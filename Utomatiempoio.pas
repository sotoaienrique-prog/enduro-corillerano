unit uTomaTiempoIO;

{==============================================================================
  uTomaTiempoIO
  --------------------------------------------------------------------------
  Exporta e importa TODAS las tomas de tiempo (cabeceras toma_tiempo_evento +
  su detalle completo toma_tiempos) que pertenecen a una agrupacion
  (toma_tiempo_agrupacion_oid).

  IMPORTANTE: esta version NO usa System.JSON a proposito (para evitar
  depender de esa unit). El archivo generado es texto plano, separado por
  ';', con un formato propio muy simple:

    # TOMA_TIEMPO_EXPORT_V1;<agrupacion_oid>;<exportado_en>
    A;<oid>;<tagid>;<timestampux>
    A;...
    H;<oid>;<nombre>;<evento_oid>;<start_time>;<end_time>;<tipo>;<estado>;<tag_text>
    D;<oid>;<piloto_oid>;<tiempo_pasada>;<is_deleted>;<nro_vuelta>;<evento_oid>;<lectura_tag_antena_oid>;<toma_tiempo_importada>;<categoria_oid>
    D;...
    H;...
    D;...

  Las lineas "A" (una por cada lectura_tags_antena distinta referenciada
  por alguna toma de la agrupacion) van todas al principio del archivo,
  antes que cualquier "H"/"D", para garantizar que existan en destino
  antes de insertar las tomas que las referencian (hay FK). Cada linea
  "H" es una cabecera (toma_tiempo_evento). Las lineas "D" que le siguen
  (hasta la proxima "H") son sus tomas_tiempos hijas.
  Fechas en formato fijo 'yyyy-mm-dd hh:nn:ss'. Los valores NULL se
  representan con el token \N (igual que MySQL). Los campos de texto libre
  (nombre, tag_text, tagid) se escapan con comillas dobles si contienen
  ';', '"' o saltos de linea (mismo criterio que un CSV estandar).

  Reglas de importacion:
    - Cada lectura_tags_antena ("A") se inserta preservando su oid
      original solo si ese oid todavia no existe en destino; si ya
      existe, se reutiliza tal cual esta en destino (no se pisa).
    - Cada cabecera ("H") se matchea por (oid + nombre).
        * oid existe y nombre coincide  -> se reutiliza (no se duplica).
        * oid existe pero nombre distinto -> conflicto: se inserta como
          cabecera nueva con oid autogenerado.
        * oid no existe -> se inserta preservando el oid original.
    - Cada toma_tiempos ("D") se importa solo si no existe ya una fila
      equivalente (misma cabecera + piloto_oid + nro_vuelta + tiempo_pasada).
      Las filas importadas quedan marcadas con toma_tiempo_importada = 1.

  Requiere: ZeosLib (ZConnection, ZDataset). Solo usa System.SysUtils,
  System.Classes, System.IOUtils y Data.DB de la RTL (nada de System.JSON).
==============================================================================}

interface

uses
  System.SysUtils, System.Classes, System.IOUtils, Data.DB,
  ZConnection, ZDataset;

type
  ETomaTiempoIO = class(Exception);

  TTomaTiempoImportStats = record
    AntenasInsertadas     : Integer;
    AntenasReutilizadas   : Integer;
    CabecerasReutilizadas : Integer;
    CabecerasInsertadas   : Integer;
    CabecerasConflicto    : Integer;
    TomasInsertadas       : Integer;
    TomasOmitidas         : Integer;
    procedure Clear;
    function AsText: string;
  end;

  TTomaTiempoExportImport = class
  private
    const
      FIELD_SEP  = ';';
      NULL_TOKEN = '\N';
      FILE_MARK  = '# TOMA_TIEMPO_EXPORT_V1';
    var
      FConnection: TZConnection;
    function NewQuery: TZQuery;

    // ---- serializacion (Dataset -> texto) ----
    function CSVEscape(const AValue: string): string;
    function FieldToCSV(AField: TField): string;
    function MakeLine(const ATag: string; const AFields: array of string): string;

    // ---- parsing (texto -> valores) ----
    function ParseCSVLine(const ALine: string): TArray<string>;
    function ParseFixedDateTime(const S: string): TDateTime;
    procedure SetParamValue(AQuery: TZQuery; const AParamName, AValue: string;
      ADataType: TFieldType);

    // ---- logica de import ----
    procedure ResolverAntena(const AFields: TArray<string>;
      var AStats: TTomaTiempoImportStats);
    function ResolverCabecera(const AFields: TArray<string>;
      var AStats: TTomaTiempoImportStats): Int64;
    procedure ImportarUnaToma(const ATomaTiempoEventoOid: Int64;
      const AFields: TArray<string>; var AStats: TTomaTiempoImportStats);

  public
    constructor Create(AConnection: TZConnection);

    function ExportarAgrupacion(AAgrupacionOid: Integer;
      const AFileName: string): Integer;

    function ImportarDesdeArchivo(const AFileName: string): TTomaTiempoImportStats;
  end;

implementation

uses
  System.DateUtils;

{ TTomaTiempoImportStats }

procedure TTomaTiempoImportStats.Clear;
begin
  AntenasInsertadas     := 0;
  AntenasReutilizadas   := 0;
  CabecerasReutilizadas := 0;
  CabecerasInsertadas   := 0;
  CabecerasConflicto    := 0;
  TomasInsertadas       := 0;
  TomasOmitidas         := 0;
end;

function TTomaTiempoImportStats.AsText: string;
begin
  Result :=
    Format('Lecturas de antena: %d insertadas, %d ya existian en destino.' + sLineBreak +
           'Cabeceras: %d reutilizadas, %d insertadas, %d en conflicto (oid duplicado con otro nombre).' + sLineBreak +
           'Tomas de tiempo: %d insertadas, %d omitidas (ya existian).',
           [AntenasInsertadas, AntenasReutilizadas,
            CabecerasReutilizadas, CabecerasInsertadas, CabecerasConflicto,
            TomasInsertadas, TomasOmitidas]);
end;

{ TTomaTiempoExportImport }

constructor TTomaTiempoExportImport.Create(AConnection: TZConnection);
begin
  inherited Create;
  if not Assigned(AConnection) then
    raise ETomaTiempoIO.Create('Debe indicar una TZConnection valida.');
  FConnection := AConnection;
end;

function TTomaTiempoExportImport.NewQuery: TZQuery;
begin
  Result := TZQuery.Create(nil);
  Result.Connection := FConnection;
end;

// ---------------------------------------------------------------------------
// Escapado tipo CSV: solo envuelve en comillas si hace falta.
// ---------------------------------------------------------------------------
function TTomaTiempoExportImport.CSVEscape(const AValue: string): string;
begin
  if (Pos(FIELD_SEP, AValue) > 0) or (Pos('"', AValue) > 0) or
     (Pos(#10, AValue) > 0) or (Pos(#13, AValue) > 0) then
    Result := '"' + StringReplace(AValue, '"', '""', [rfReplaceAll]) + '"'
  else
    Result := AValue;
end;

function TTomaTiempoExportImport.FieldToCSV(AField: TField): string;
begin
  if AField.IsNull then
    Exit(NULL_TOKEN);

  case AField.DataType of
    ftSmallint, ftInteger, ftWord, ftLargeint, ftAutoInc, ftLongWord:
      Result := IntToStr(AField.AsLargeInt);
    ftDate, ftTime, ftDateTime, ftTimeStamp:
      Result := FormatDateTime('yyyy-mm-dd hh:nn:ss.zzz', AField.AsDateTime);
    ftBoolean:
      if AField.AsBoolean then
        Result := '1'
      else
        Result := '0';
  else
    Result := CSVEscape(AField.AsString);
  end;
end;

function TTomaTiempoExportImport.MakeLine(const ATag: string;
  const AFields: array of string): string;
var
  I: Integer;
begin
  Result := ATag;
  for I := Low(AFields) to High(AFields) do
    Result := Result + FIELD_SEP + AFields[I];
end;

// ---------------------------------------------------------------------------
// Parser CSV minimo (respeta comillas y ; dentro de comillas)
// ---------------------------------------------------------------------------
function TTomaTiempoExportImport.ParseCSVLine(const ALine: string): TArray<string>;
var
  I, LLen: Integer;
  LInQuotes: Boolean;
  LField: string;
  LResult: TArray<string>;
  LCh: Char;
begin
  SetLength(LResult, 0);
  LField := '';
  LInQuotes := False;
  I := 1;
  LLen := Length(ALine);
  while I <= LLen do
  begin
    LCh := ALine[I];
    if LInQuotes then
    begin
      if LCh = '"' then
      begin
        if (I < LLen) and (ALine[I + 1] = '"') then
        begin
          LField := LField + '"';
          Inc(I);
        end
        else
          LInQuotes := False;
      end
      else
        LField := LField + LCh;
    end
    else
    begin
      if LCh = '"' then
        LInQuotes := True
      else if LCh = FIELD_SEP then
      begin
        SetLength(LResult, Length(LResult) + 1);
        LResult[High(LResult)] := LField;
        LField := '';
      end
      else
        LField := LField + LCh;
    end;
    Inc(I);
  end;
  SetLength(LResult, Length(LResult) + 1);
  LResult[High(LResult)] := LField;
  Result := LResult;
end;

// Espera exactamente 'yyyy-mm-dd hh:nn:ss.zzz' (19 caracteres, sin depender
// de la configuracion regional de la maquina).
function TTomaTiempoExportImport.ParseFixedDateTime(const S: string): TDateTime;
var
  LMs: Integer;
begin
  if Length(S) < 19 then
    raise ETomaTiempoIO.CreateFmt('Fecha/hora con formato invalido: "%s"', [S]);

  LMs := 0;
  if (Length(S) >= 23) and (S[20] = '.') then
    LMs := StrToInt(Copy(S, 21, 3));

  Result := EncodeDateTime(
    StrToInt(Copy(S, 1, 4)),  StrToInt(Copy(S, 6, 2)),  StrToInt(Copy(S, 9, 2)),
    StrToInt(Copy(S, 12, 2)), StrToInt(Copy(S, 15, 2)), StrToInt(Copy(S, 18, 2)), LMs);
end;

procedure TTomaTiempoExportImport.SetParamValue(AQuery: TZQuery;
  const AParamName, AValue: string; ADataType: TFieldType);
begin
  if AValue = NULL_TOKEN then
  begin
    AQuery.ParamByName(AParamName).Clear;
    AQuery.ParamByName(AParamName).DataType := ADataType;
    Exit;
  end;
  case ADataType of
    ftSmallint, ftInteger, ftWord, ftLargeint, ftAutoInc, ftLongWord:
      AQuery.ParamByName(AParamName).AsLargeInt := StrToInt64(AValue);
    ftDate, ftTime, ftDateTime, ftTimeStamp:
      AQuery.ParamByName(AParamName).AsDateTime := ParseFixedDateTime(AValue);
  else
    AQuery.ParamByName(AParamName).AsString := AValue;
  end;
end;

// ---------------------------------------------------------------------------
// EXPORTAR
// ---------------------------------------------------------------------------
function TTomaTiempoExportImport.ExportarAgrupacion(AAgrupacionOid: Integer;
  const AFileName: string): Integer;
var
  LQryCabeceras, LQryDetalle, LQryAntenas: TZQuery;
  LOut: TStringList;
begin
  Result := 0;
  LQryCabeceras := NewQuery;
  LQryDetalle   := NewQuery;
  LQryAntenas   := NewQuery;
  LOut := TStringList.Create;
  try
    LQryCabeceras.SQL.Text :=
      'SELECT tte.oid, tte.nombre, tte.evento_oid, tte.toma_tiempo_start_time, ' +
      '       tte.toma_tiempo_end_time, tte.tipo_toma_tiempo, tte.estado_toma_tiempo, ' +
      '       tte.tag_text ' +
      'FROM toma_tiempo_agrupacion_tt tta ' +
      'INNER JOIN toma_tiempo_evento tte ON tta.toma_tiempo_oid = tte.oid ' +
      'WHERE tta.toma_tiempo_agrupacion_oid = :agrupacion_oid ' +
      'ORDER BY tte.toma_tiempo_start_time';
    LQryCabeceras.ParamByName('agrupacion_oid').AsInteger := AAgrupacionOid;
    LQryCabeceras.Open;

    LOut.Add(Format('%s;%d;%s', [FILE_MARK, AAgrupacionOid,
      FormatDateTime('yyyy-mm-dd hh:nn:ss', Now)]));

    // Todas las lecturas de antena distintas referenciadas por CUALQUIER
    // toma de la agrupacion, exportadas primero para que el import pueda
    // resolver la FK antes de insertar las tomas.
    LQryAntenas.SQL.Text :=
      'SELECT DISTINCT la.oid, la.tagid, la.timestampux ' +
      'FROM toma_tiempo_agrupacion_tt tta ' +
      'INNER JOIN toma_tiempo_evento tte ON tta.toma_tiempo_oid = tte.oid ' +
      'INNER JOIN toma_tiempos tt ON tt.toma_tiempo_evento_oid = tte.oid ' +
      'INNER JOIN lectura_tags_antena la ON la.oid = tt.lectura_tag_antena_oid ' +
      'WHERE tta.toma_tiempo_agrupacion_oid = :agrupacion_oid';
    LQryAntenas.ParamByName('agrupacion_oid').AsInteger := AAgrupacionOid;
    LQryAntenas.Open;
    while not LQryAntenas.Eof do
    begin
      LOut.Add(MakeLine('A', [
        FieldToCSV(LQryAntenas.FieldByName('oid')),
        FieldToCSV(LQryAntenas.FieldByName('tagid')),
        FieldToCSV(LQryAntenas.FieldByName('timestampux'))
      ]));
      LQryAntenas.Next;
    end;
    LQryAntenas.Close;

    while not LQryCabeceras.Eof do
    begin
      LOut.Add(MakeLine('H', [
        FieldToCSV(LQryCabeceras.FieldByName('oid')),
        FieldToCSV(LQryCabeceras.FieldByName('nombre')),
        FieldToCSV(LQryCabeceras.FieldByName('evento_oid')),
        FieldToCSV(LQryCabeceras.FieldByName('toma_tiempo_start_time')),
        FieldToCSV(LQryCabeceras.FieldByName('toma_tiempo_end_time')),
        FieldToCSV(LQryCabeceras.FieldByName('tipo_toma_tiempo')),
        FieldToCSV(LQryCabeceras.FieldByName('estado_toma_tiempo')),
        FieldToCSV(LQryCabeceras.FieldByName('tag_text'))
      ]));

      LQryDetalle.Close;
      LQryDetalle.SQL.Text :=
        'SELECT oid, piloto_oid, tiempo_pasada, is_deleted, nro_vuelta, ' +
        '       evento_oid, lectura_tag_antena_oid, toma_tiempo_importada, categoria_oid ' +
        'FROM toma_tiempos ' +
        'WHERE toma_tiempo_evento_oid = :tte_oid ' +
        'ORDER BY tiempo_pasada';
      LQryDetalle.ParamByName('tte_oid').AsLargeInt := LQryCabeceras.FieldByName('oid').AsLargeInt;
      LQryDetalle.Open;

      while not LQryDetalle.Eof do
      begin
        LOut.Add(MakeLine('D', [
          FieldToCSV(LQryDetalle.FieldByName('oid')),
          FieldToCSV(LQryDetalle.FieldByName('piloto_oid')),
          FieldToCSV(LQryDetalle.FieldByName('tiempo_pasada')),
          FieldToCSV(LQryDetalle.FieldByName('is_deleted')),
          FieldToCSV(LQryDetalle.FieldByName('nro_vuelta')),
          FieldToCSV(LQryDetalle.FieldByName('evento_oid')),
          FieldToCSV(LQryDetalle.FieldByName('lectura_tag_antena_oid')),
          FieldToCSV(LQryDetalle.FieldByName('toma_tiempo_importada')),
          FieldToCSV(LQryDetalle.FieldByName('categoria_oid'))
        ]));
        LQryDetalle.Next;
      end;

      Inc(Result);
      LQryCabeceras.Next;
    end;

    LOut.SaveToFile(AFileName, TEncoding.UTF8);
  finally
    LOut.Free;
    LQryAntenas.Free;
    LQryDetalle.Free;
    LQryCabeceras.Free;
  end;
end;

// ---------------------------------------------------------------------------
// IMPORTAR - inserta lectura_tags_antena si su oid todavia no existe.
// AFields: ['A', oid, tagid, timestampux]
// Se hace SIEMPRE antes de procesar cualquier H/D, para que la FK
// fk_tt_lectura_tag de toma_tiempos nunca falle por dato faltante.
// ---------------------------------------------------------------------------
procedure TTomaTiempoExportImport.ResolverAntena(const AFields: TArray<string>;
  var AStats: TTomaTiempoImportStats);
var
  LQry, LQryIns: TZQuery;
  LOid: Int64;
begin
  LOid := StrToInt64(AFields[1]);

  LQry := NewQuery;
  try
    LQry.SQL.Text := 'SELECT oid FROM lectura_tags_antena WHERE oid = :oid';
    LQry.ParamByName('oid').AsLargeInt := LOid;
    LQry.Open;
    if not LQry.Eof then
    begin
      LQry.Close;
      Inc(AStats.AntenasReutilizadas);
      Exit;
    end;
    LQry.Close;
  finally
    LQry.Free;
  end;

  LQryIns := NewQuery;
  try
    LQryIns.SQL.Text :=
      'INSERT INTO lectura_tags_antena (oid, tagid, timestampux) ' +
      'VALUES (:oid, :tagid, :timestampux)';
    LQryIns.ParamByName('oid').AsLargeInt := LOid;
    SetParamValue(LQryIns, 'tagid',       AFields[2], ftString);
    SetParamValue(LQryIns, 'timestampux', AFields[3], ftLargeint);
    LQryIns.ExecSQL;
    Inc(AStats.AntenasInsertadas);
  finally
    LQryIns.Free;
  end;
end;

// ---------------------------------------------------------------------------
// IMPORTAR - resuelve/crea la cabecera toma_tiempo_evento por (oid+nombre)
// AFields: ['H', oid, nombre, evento_oid, start, end, tipo, estado, tag_text]
// ---------------------------------------------------------------------------
function TTomaTiempoExportImport.ResolverCabecera(const AFields: TArray<string>;
  var AStats: TTomaTiempoImportStats): Int64;
var
  LQry, LQryIns: TZQuery;
  LOidOrig: Int64;
  LNombreOrig, LNombreExistente: string;
  LOidExiste: Boolean;
begin
  LOidOrig    := StrToInt64(AFields[1]);
  LNombreOrig := AFields[2];

  LQry := NewQuery;
  try
    LQry.SQL.Text := 'SELECT oid, nombre FROM toma_tiempo_evento WHERE oid = :oid';
    LQry.ParamByName('oid').AsLargeInt := LOidOrig;
    LQry.Open;
    LOidExiste := not LQry.Eof;
    if LOidExiste then
      LNombreExistente := LQry.FieldByName('nombre').AsString;
    LQry.Close;

    if LOidExiste and (LNombreExistente = LNombreOrig) then
    begin
      Inc(AStats.CabecerasReutilizadas);
      Exit(LOidOrig);
    end;

    LQryIns := NewQuery;
    try
      if not LOidExiste then
      begin
        LQryIns.SQL.Text :=
          'INSERT INTO toma_tiempo_evento ' +
          '  (oid, nombre, evento_oid, toma_tiempo_start_time, toma_tiempo_end_time, ' +
          '   tipo_toma_tiempo, estado_toma_tiempo, tag_text) ' +
          'VALUES ' +
          '  (:oid, :nombre, :evento_oid, :start_time, :end_time, :tipo, :estado, :tag_text)';
        LQryIns.ParamByName('oid').AsLargeInt := LOidOrig;
      end
      else
      begin
        Inc(AStats.CabecerasConflicto);
        LQryIns.SQL.Text :=
          'INSERT INTO toma_tiempo_evento ' +
          '  (nombre, evento_oid, toma_tiempo_start_time, toma_tiempo_end_time, ' +
          '   tipo_toma_tiempo, estado_toma_tiempo, tag_text) ' +
          'VALUES ' +
          '  (:nombre, :evento_oid, :start_time, :end_time, :tipo, :estado, :tag_text)';
      end;

      SetParamValue(LQryIns, 'nombre',     LNombreOrig,   ftString);
      SetParamValue(LQryIns, 'evento_oid', AFields[3],    ftInteger);
      SetParamValue(LQryIns, 'start_time', AFields[4],    ftDateTime);
      SetParamValue(LQryIns, 'end_time',   AFields[5],    ftDateTime);
      SetParamValue(LQryIns, 'tipo',       AFields[6],    ftString);
      SetParamValue(LQryIns, 'estado',     AFields[7],    ftString);
      SetParamValue(LQryIns, 'tag_text',   AFields[8],    ftString);
      LQryIns.ExecSQL;

      if not LOidExiste then
      begin
        Inc(AStats.CabecerasInsertadas);
        Result := LOidOrig;
      end
      else
      begin
        LQryIns.SQL.Text := 'SELECT LAST_INSERT_ID() AS newoid';
        LQryIns.Open;
        Result := LQryIns.FieldByName('newoid').AsLargeInt;
        LQryIns.Close;
      end;
    finally
      LQryIns.Free;
    end;
  finally
    LQry.Free;
  end;
end;

// ---------------------------------------------------------------------------
// IMPORTAR - inserta una toma_tiempos hija evitando duplicados
// AFields: ['D', oid, piloto_oid, tiempo_pasada, is_deleted, nro_vuelta,
//           evento_oid, lectura_tag_antena_oid, toma_tiempo_importada, categoria_oid]
// ---------------------------------------------------------------------------
procedure TTomaTiempoExportImport.ImportarUnaToma(const ATomaTiempoEventoOid: Int64;
  const AFields: TArray<string>; var AStats: TTomaTiempoImportStats);
var
  LQryCheck, LQryIns: TZQuery;
  LExiste: Boolean;
begin
  LQryCheck := NewQuery;
  LQryIns   := NewQuery;
  try
    LQryCheck.SQL.Text :=
      'SELECT oid FROM toma_tiempos ' +
      'WHERE toma_tiempo_evento_oid = :tte_oid ' +
      '  AND piloto_oid <=> :piloto_oid ' +
      '  AND nro_vuelta <=> :nro_vuelta ' +
      '  AND tiempo_pasada = :tiempo_pasada ' +
      'LIMIT 1';
    LQryCheck.ParamByName('tte_oid').AsLargeInt := ATomaTiempoEventoOid;
    SetParamValue(LQryCheck, 'piloto_oid',    AFields[2], ftLargeint);
    SetParamValue(LQryCheck, 'nro_vuelta',    AFields[5], ftInteger);
    SetParamValue(LQryCheck, 'tiempo_pasada', AFields[3], ftDateTime);
    LQryCheck.Open;
    LExiste := not LQryCheck.Eof;
    LQryCheck.Close;

    if LExiste then
    begin
      Inc(AStats.TomasOmitidas);
      Exit;
    end;

    LQryIns.SQL.Text :=
      'INSERT INTO toma_tiempos ' +
      '  (piloto_oid, tiempo_pasada, is_deleted, toma_tiempo_evento_oid, nro_vuelta, ' +
      '   evento_oid, lectura_tag_antena_oid, toma_tiempo_importada, categoria_oid) ' +
      'VALUES ' +
      '  (:piloto_oid, :tiempo_pasada, :is_deleted, :tte_oid, :nro_vuelta, ' +
      '   :evento_oid, :lectura_tag_antena_oid, 1, :categoria_oid)';
    SetParamValue(LQryIns, 'piloto_oid',           AFields[2], ftLargeint);
    SetParamValue(LQryIns, 'tiempo_pasada',        AFields[3], ftDateTime);
    SetParamValue(LQryIns, 'is_deleted',           AFields[4], ftInteger);
    LQryIns.ParamByName('tte_oid').AsLargeInt := ATomaTiempoEventoOid;
    SetParamValue(LQryIns, 'nro_vuelta',            AFields[5], ftInteger);
    SetParamValue(LQryIns, 'evento_oid',            AFields[6], ftInteger);
    SetParamValue(LQryIns, 'lectura_tag_antena_oid',AFields[7], ftLargeint);
    SetParamValue(LQryIns, 'categoria_oid',         AFields[9], ftInteger);
    LQryIns.ExecSQL;

    Inc(AStats.TomasInsertadas);
  finally
    LQryIns.Free;
    LQryCheck.Free;
  end;
end;

// ---------------------------------------------------------------------------
// IMPORTAR - punto de entrada
// ---------------------------------------------------------------------------
function TTomaTiempoExportImport.ImportarDesdeArchivo(
  const AFileName: string): TTomaTiempoImportStats;
var
  LLines: TStringList;
  I: Integer;
  LLine: string;
  LFields: TArray<string>;
  LCurrentEventoOid: Int64;
  LTieneEventoActual: Boolean;
  LWasInTransaction: Boolean;
begin
  if not TFile.Exists(AFileName) then
    raise ETomaTiempoIO.CreateFmt('No se encontro el archivo "%s".', [AFileName]);

  Result.Clear;
  LCurrentEventoOid := 0;
  LTieneEventoActual := False;

  LLines := TStringList.Create;
  try
    LLines.LoadFromFile(AFileName, TEncoding.UTF8);

    if (LLines.Count = 0) or (Pos(FILE_MARK, LLines[0]) <> 1) then
      raise ETomaTiempoIO.Create('El archivo no tiene el formato esperado (falta el encabezado).');

    LWasInTransaction := FConnection.InTransaction;
    if not LWasInTransaction then
      FConnection.StartTransaction;
    try
      for I := 1 to LLines.Count - 1 do
      begin
        LLine := LLines[I];
        if Trim(LLine) = '' then
          Continue;

        LFields := ParseCSVLine(LLine);
        if Length(LFields) = 0 then
          Continue;

        if LFields[0] = 'A' then
        begin
          ResolverAntena(LFields, Result);
        end
        else if LFields[0] = 'H' then
        begin
          LCurrentEventoOid := ResolverCabecera(LFields, Result);
          LTieneEventoActual := True;
        end
        else if LFields[0] = 'D' then
        begin
          if not LTieneEventoActual then
            raise ETomaTiempoIO.CreateFmt(
              'Linea %d: se encontro una toma de tiempo (D) sin una cabecera (H) previa.', [I + 1]);
          ImportarUnaToma(LCurrentEventoOid, LFields, Result);
        end;
        // lineas con otro tag o comentarios ('#') se ignoran silenciosamente
      end;

      if not LWasInTransaction then
        FConnection.Commit;
    except
      on E: Exception do
      begin
        if not LWasInTransaction then
          FConnection.Rollback;
        raise ETomaTiempoIO.CreateFmt('Error importando (se hizo rollback): %s', [E.Message]);
      end;
    end;
  finally
    LLines.Free;
  end;
end;

end.
