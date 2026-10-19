unit EditAgrupacionTomaTiempos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxTextEdit, cxLabel, Vcl.ExtCtrls, cxMaskEdit,
  cxDropDownEdit, Vcl.ImgList, Vcl.StdCtrls, AeroButtons, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DataModule, Vcl.DBCtrls,
  ZAbstractTable, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, F_EEMessage,
  scExcelExport, frxClass, frxDBSet, frxExportPDF, JvTimer, Excel2010, ConfigureFilesUtilities,
  IdHTTP, IdSSLOpenSSL, IdSSLOpenSSLHeaders, uTomaTiempoIO;

type
  TEdicionAgrupacion = class(TForm)
    topPanel: TPanel;
    lblNombre: TcxLabel;
    txtNombre: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    buttonPanel: TPanel;
    btnAccept: TAeroButton;
    btnCancel: TAeroButton;
    cxButtonImageList: TcxImageList;
    ZQueryInsert: TZQuery;
    cmbTipoToma: TComboBox;
    cmbTipoAgrupacion: TComboBox;
    tomaTiempoPanel: TPanel;
    GroupBox1: TGroupBox;
    ZCampeonato: TZTable;
    DSCampeonato: TDataSource;
    DSEvento: TDataSource;
    ZTomaTiempoEvento: TZReadOnlyQuery;
    DSTomaTiempoEvento: TDataSource;
    ZEvento: TZReadOnlyQuery;
    cmbTomaTiempoEvento: TDBLookupComboBox;
    cxLabel3: TcxLabel;
    cmbEvento: TDBLookupComboBox;
    lblFilterEvento: TcxLabel;
    lblCampeonato: TcxLabel;
    cmbCampeonato: TDBLookupComboBox;
    panelAddTT: TPanel;
    panelGridTT: TPanel;
    btnAddTomaTiempo: TAeroButton;
    cxGrid: TcxGrid;
    cxGridDBTableView: TcxGridDBTableView;
    cxGridDBTableViewnombre: TcxGridDBColumn;
    cxGridLevel: TcxGridLevel;
    btnDeleteTomaTiempo: TAeroButton;
    ZTomaTiempos: TZReadOnlyQuery;
    DSTomaTiempos: TDataSource;
    ZAgrupacion: TZReadOnlyQuery;
    WideStringField1: TWideStringField;
    WideStringField2: TWideStringField;
    WideStringField3: TWideStringField;
    ZAddAgrupacoinTomaTiempo: TZQuery;
    ZTomaTiemposnombre: TWideStringField;
    ZDeleteAgrupacoinTomaTiempo: TZQuery;
    ZTomaTiemposoid: TLargeintField;
    btnExportarAgrupacion: TAeroButton;
    zExportarAgrupacion: TZReadOnlyQuery;
    ZTomaTiemposForExport: TZReadOnlyQuery;
    WideStringField4: TWideStringField;
    LargeintField1: TLargeintField;
    btnExportarAgrupacionPuntos: TAeroButton;
    scExcelExport: TscExcelExport;
    eventoDBDS: TfrxDBDataset;
    tomaTiempoDBDS: TfrxDBDataset;
    campeonato1DBDS: TfrxDBDataset;
    frxPDFExport: TfrxPDFExport;
    frxPosiciones1: TfrxReport;
    btnexportarWEB: TAeroButton;
    posiciones1DBDS: TfrxDBDataset;
    JvReportTimer: TJvTimer;
    btnExportarFile: TAeroButton;
    SaveDialog1: TSaveDialog;
    btnimportarFile: TAeroButton;
    OpenDialog1: TOpenDialog;
    btnAddAllTomaTiempo: TAeroButton;
    btnDeleteAllTomaTiempo: TAeroButton;
    procedure btnAcceptClick(Sender: TObject);
    procedure btnAddTomaTiempoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnDeleteTomaTiempoClick(Sender: TObject);
    procedure btnExportarAgrupacionClick(Sender: TObject);
    procedure btnExportarAgrupacionPuntosClick(Sender: TObject);
    procedure btnexportarWEBClick(Sender: TObject);
    procedure JvReportTimerTimer(Sender: TObject);
    procedure btnExportarFileClick(Sender: TObject);
    procedure btnimportarFileClick(Sender: TObject);
    procedure btnAddAllTomaTiempoClick(Sender: TObject);
    procedure btnDeleteAllTomaTiempoClick(Sender: TObject);
  private
    { Private declarations }
    procedure selectCombosByDate;
    function getAgrupacionSQL(agrupacionTomaTiempoOID : Integer; paraReportePDF: Boolean = False): String;
    function getAgrupacionPuntosSQL(agrupacionTomaTiempoOID : Integer; paraReportePDF: Boolean = False): String;
    procedure OcultarCamposExportacion(Dataset: TDataSet; const NombresCampos: array of string);
    procedure ExportarAHTML(Dataset: TDataSet);
    function ConstruirCabeceraEvento: string;
    procedure SubirAWorker(const HTMLContent: string);
    procedure SubirArchivoAWorker(const Contenido, NombreArchivo, ContentType, Ruta: string);
    function GenerarJSONResultados(Dataset: TDataSet): string;
    procedure DiagnosticoSSL;
    procedure ExportarExcelYPDF(Dataset: TDataSet; const Instancia: string);
    procedure AbrirConsultaPublicacion(Query: TZReadOnlyQuery);
    function EsColumnaPublicable(Field: TField): Boolean;
    procedure ExportarAExcel(Dataset: TDataSet);
  public
    procedure enableAddAgrupacion;
    procedure enableAddTomaTiempos;
  end;

var
  isAdding : Boolean;
  agrupacionTomaTiempoOID: Integer;
  tipoTomaTiempo: String;
  procedure PublicarEnWorker(const Contenido, NombreArchivo, ContentType, Ruta, IdDestino: string);
const
  URL_WORKER = 'https://resultados-carrera.sotoaienrique.workers.dev';
implementation

uses
  System.Win.ComObj, LogUnit;
{$R *.dfm}

const
  CAMPO_CATEGORIA_PUBLICACION = 'Cat';
  // Formato Texto de Excel. Debe ser string tipado: el literal '@' es un Char y por OLE
  // viaja como el ordinal 64, y Excel recibe el formato "64" en lugar de Texto.
  FORMATO_TEXTO_EXCEL: WideString = '@';

procedure TEdicionAgrupacion.selectCombosByDate;
begin
  with ConnectionModule.GetEventoByDate do
    begin
      Close;
      Open;

      if (RecordCount > 0) then
        begin
          cmbCampeonato.KeyValue:= FieldByName('campeonato_oid').AsInteger;
          cmbEvento.KeyValue:= FieldByName('evento_oid').AsInteger;
        end;
    end;
end;

procedure TEdicionAgrupacion.enableAddTomaTiempos;
begin
  isAdding:= False;
  txtNombre.Enabled:= False;
  cmbTipoToma.Enabled:= False;
  cmbTipoAgrupacion.Enabled:= False;

  ZCampeonato.Active:= True;
  ZEvento.Active:= True;

  ZTomaTiempoEvento.Close;
  ZTomaTiempoEvento.ParamByName('tipo_toma_tiempo').AsString:= tipoTomaTiempo;
  ZTomaTiempoEvento.Open;

  cmbEvento.Enabled:= True;
  cmbTomaTiempoEvento.Enabled:= True;
  cmbCampeonato.Enabled:= True;

  tomaTiempoPanel.Visible:= True;

  with ZAgrupacion do
    begin
      Close;
      ParamByName('oid').AsInteger:= agrupacionTomaTiempoOID;
      Open;

      txtNombre.Text:= FieldByName('nombre').AsString;
      cmbTipoToma.ItemIndex := cmbTipoToma.Items.IndexOf(FieldByName('tipo_toma_tiempo').AsString);
      cmbTipoAgrupacion.ItemIndex:= cmbTipoAgrupacion.Items.IndexOf(FieldByName('tipo_agrupacion').AsString);

      tipoTomaTiempo:= FieldByName('tipo_toma_tiempo').AsString;
    end;

  with ZTomaTiempos do
    begin
      Close;
      ParamByName('toma_tiempo_agrupacion_oid').AsInteger:= agrupacionTomaTiempoOID;
      Open;
    end;
end;

procedure TEdicionAgrupacion.FormCreate(Sender: TObject);
begin
  selectCombosByDate;
end;

procedure TEdicionAgrupacion.btnAddTomaTiempoClick(Sender: TObject);
begin
  with ZAddAgrupacoinTomaTiempo do
    begin
      Close;
      ParamByName('toma_tiempo_agrupacion_oid').AsInteger:= agrupacionTomaTiempoOID;
      ParamByName('toma_tiempo_oid').AsInteger:= cmbTomaTiempoEvento.KeyValue;
      ExecSQL;
    end;

  with ZTomaTiempos do
    begin
      Close;
      ParamByName('toma_tiempo_agrupacion_oid').AsInteger:= agrupacionTomaTiempoOID;
      Open;
    end;
end;

procedure TEdicionAgrupacion.btnDeleteTomaTiempoClick(Sender: TObject);
begin
  if (TF_EE_Message.ShowMessage(TComponent(Self),'Confirmación de eliminación de Elemento',
    '¿Está seguro que desea eliminar el elemento seleccionado?', TF_EE_Message.QUESTION, False) = mrOk) then
  begin
    with ZDeleteAgrupacoinTomaTiempo do
      begin
        Close;
        ParamByName('toma_tiempo_agrupacion_oid').AsInteger:= agrupacionTomaTiempoOID;
        ParamByName('toma_tiempo_oid').AsInteger:= ZTomaTiempos.FieldByName('oid').AsInteger;
        ExecSQL;
      end;

      with ZTomaTiempos do
        begin
          Close;
          ParamByName('toma_tiempo_agrupacion_oid').AsInteger:= agrupacionTomaTiempoOID;
          Open;
        end;
  end;
end;

procedure TEdicionAgrupacion.btnAddAllTomaTiempoClick(Sender: TObject);
var
  Existentes: TStringList;
  Agregadas: Integer;
begin
  if not (cmbEvento.KeyValue > 0) then
  begin
    TF_EE_Message.ShowMessage(TComponent(Self), '¡Seleccione el Evento!',
      'Debe seleccionar el Evento cuyas tomas desea agregar.', TF_EE_Message.WARNING, True);
    Exit;
  end;

  // ZTomaTiempoEvento es detalle de ZEvento: se asegura que liste las tomas del evento elegido
  ZEvento.Locate('oid', cmbEvento.KeyValue, []);

  Agregadas := 0;
  Existentes := TStringList.Create;
  try
    // Tomas que ya están en la agrupación
    ZTomaTiempos.DisableControls;
    try
      ZTomaTiempos.First;
      while not ZTomaTiempos.Eof do
      begin
        Existentes.Add(ZTomaTiempos.FieldByName('oid').AsString);
        ZTomaTiempos.Next;
      end;
    finally
      ZTomaTiempos.EnableControls;
    end;

    // Mismas tomas que lista el combo "Toma Tiempo"
    ZTomaTiempoEvento.DisableControls;
    try
      ZTomaTiempoEvento.First;
      while not ZTomaTiempoEvento.Eof do
      begin
        if Existentes.IndexOf(ZTomaTiempoEvento.FieldByName('oid').AsString) < 0 then
        begin
          with ZAddAgrupacoinTomaTiempo do
          begin
            Close;
            ParamByName('toma_tiempo_agrupacion_oid').AsInteger:= agrupacionTomaTiempoOID;
            ParamByName('toma_tiempo_oid').AsInteger:= ZTomaTiempoEvento.FieldByName('oid').AsInteger;
            ExecSQL;
          end;
          Inc(Agregadas);
        end;
        ZTomaTiempoEvento.Next;
      end;
    finally
      ZTomaTiempoEvento.EnableControls;
    end;
  finally
    Existentes.Free;
  end;

  with ZTomaTiempos do
    begin
      Close;
      ParamByName('toma_tiempo_agrupacion_oid').AsInteger:= agrupacionTomaTiempoOID;
      Open;
    end;

  if Agregadas = 0 then
    TF_EE_Message.ShowMessage(TComponent(Self), 'Agregar Todas',
      'Todas las tomas del evento ya estaban en la agrupación.', TF_EE_Message.INFORMATION, True)
  else
    TF_EE_Message.ShowMessage(TComponent(Self), 'Agregar Todas',
      Format('Se agregaron %d tomas de tiempo a la agrupación.', [Agregadas]), TF_EE_Message.INFORMATION, True);
end;

procedure TEdicionAgrupacion.btnDeleteAllTomaTiempoClick(Sender: TObject);
var
  OIDs: TStringList;
  i: Integer;
begin
  if ZTomaTiempos.IsEmpty then
    Exit;

  if (TF_EE_Message.ShowMessage(TComponent(Self), 'Confirmación de eliminación de Elementos',
    Format('¿Está seguro que desea quitar las %d tomas de tiempo de la agrupación?<br>' +
      'Las tomas no se borran, solo dejan de formar parte de la agrupación.', [ZTomaTiempos.RecordCount]),
    TF_EE_Message.QUESTION, False) <> mrOk) then
    Exit;

  OIDs := TStringList.Create;
  try
    ZTomaTiempos.DisableControls;
    try
      ZTomaTiempos.First;
      while not ZTomaTiempos.Eof do
      begin
        OIDs.Add(ZTomaTiempos.FieldByName('oid').AsString);
        ZTomaTiempos.Next;
      end;
    finally
      ZTomaTiempos.EnableControls;
    end;

    for i := 0 to OIDs.Count - 1 do
      with ZDeleteAgrupacoinTomaTiempo do
        begin
          Close;
          ParamByName('toma_tiempo_agrupacion_oid').AsInteger:= agrupacionTomaTiempoOID;
          ParamByName('toma_tiempo_oid').AsInteger:= StrToInt(OIDs[i]);
          ExecSQL;
        end;
  finally
    OIDs.Free;
  end;

  with ZTomaTiempos do
    begin
      Close;
      ParamByName('toma_tiempo_agrupacion_oid').AsInteger:= agrupacionTomaTiempoOID;
      Open;
    end;
end;

procedure TEdicionAgrupacion.btnExportarAgrupacionClick(Sender: TObject);
var
  Consulta: TZReadOnlyQuery;
begin
  // Consulta propia: JvReportTimer (exportación WEB) reutiliza zExportarAgrupacion cada 30 s
  Consulta := TZReadOnlyQuery.Create(nil);
  try
    Consulta.Connection := zExportarAgrupacion.Connection;
    AbrirConsultaPublicacion(Consulta);
    ExportarAExcel(Consulta);
  finally
    Consulta.Free;
  end;
end;


procedure TEdicionAgrupacion.btnExportarAgrupacionPuntosClick(Sender: TObject);
begin
      with zExportarAgrupacion do
      begin
        DisableControls;
        try
          Close;
          Sql.Text:= getAgrupacionPuntosSQL(agrupacionTomaTiempoOID);
          ParamByName('toma_tiempo_agrupacion_oid').AsInteger:= agrupacionTomaTiempoOID;
          Open;
        finally
          EnableControls;
        end;
      end;

      scExcelExport.Dataset:= zExportarAgrupacion;
      scExcelExport.WorksheetName := 'Clasifica x Categoria';
      scExcelExport.ExportDataset;
      scExcelExport.Disconnect;
 end;

procedure TEdicionAgrupacion.btnExportarFileClick(Sender: TObject);
var
  LIO: TTomaTiempoExportImport;
  LCantidad: Integer;
begin
  SaveDialog1.Filter := 'Archivo de tomas de tiempo (*.tte)|*.tte|Todos los archivos (*.*)|*.*';
  SaveDialog1.DefaultExt := 'tte';
  SaveDialog1.FileName := Format('agrupacion_%s_%s.tte',
    [IntToStr(agrupacionTomaTiempoOID), FormatDateTime('yyyymmdd_hhnnss', Now)]);

  if not SaveDialog1.Execute then
    Exit;

  LIO := TTomaTiempoExportImport.Create(ConnectionModule.ZConnection);
  try
    try
      LCantidad := LIO.ExportarAgrupacion(agrupacionTomaTiempoOID, SaveDialog1.FileName);
      ShowMessage(Format('Se exportaron %d tomas de tiempo a:'#13#10'%s',
        [LCantidad, SaveDialog1.FileName]));
    except
      on E: Exception do
        ShowMessage('Error al exportar: ' + E.Message);
    end;
  finally
    LIO.Free;
  end;
end;

procedure TEdicionAgrupacion.btnexportarWEBClick(Sender: TObject);
begin
  JvReportTimer.Enabled:= True;
  //DiagnosticoSSL;
end;

procedure TEdicionAgrupacion.btnimportarFileClick(Sender: TObject);
var
  LIO: TTomaTiempoExportImport;
  LStats: TTomaTiempoImportStats;
  LModo: TTomaTiempoImportMode;
begin
  OpenDialog1.Filter := 'Archivo de tomas de tiempo (*.tte)|*.tte|Todos los archivos (*.*)|*.*';

  if not OpenDialog1.Execute then
    Exit;

  case MessageDlg(
    '¿Cómo querés importar este archivo?' + sLineBreak + sLineBreak +
    'MERGE: agrega tomas nuevas, respeta lo que ya existe.' + sLineBreak +
    'REEMPLAZAR: borra las tomas existentes de cada evento del archivo antes de importar.',
    mtConfirmation, [mbYes, mbNo, mbCancel], 0) of
    mrYes: LModo := timMerge;           // "Merge"
    mrNo:  LModo := timReemplazoTotal;  // "Reemplazar"
  else
    Exit; // Cancelar
  end;

  LIO := TTomaTiempoExportImport.Create(ConnectionModule.ZConnection);
  try
    try
      LStats := LIO.ImportarDesdeArchivo(OpenDialog1.FileName, LModo);
      ShowMessage('Importación completada.'#13#10#13#10 + LStats.AsText);
    except
      on E: Exception do
        ShowMessage('Error al importar: ' + E.Message);
    end;
  finally
    LIO.Free;
  end;
end;

function TEdicionAgrupacion.getAgrupacionPuntosSQL(agrupacionTomaTiempoOID : Integer; paraReportePDF: Boolean = False): String;
var
  sqlString, columnasTramos: String;
  i : Integer;
  aliasPos, aliasTot: String;
begin
  with ZTomaTiemposForExport do
  begin
    Close;
    ParamByName('toma_tiempo_agrupacion_oid').AsInteger := agrupacionTomaTiempoOID;
    Open;
  end;

  // ── PASO 1: construir la lista de columnas de tramos ──────────────────
  columnasTramos := '';
  i := 1;
  with ZTomaTiemposForExport do
  begin
    First;
    while not EOF do
    begin
      if paraReportePDF then
      begin
        aliasPos := 'POS_' + IntToStr(i);
        aliasTot := 'TOT_' + IntToStr(i);
      end
      else
      begin
        aliasPos := 'P. ' + FieldByName('nombre').AsString;
        aliasTot := 'T. ' + FieldByName('nombre').AsString;
      end;

      // CAMBIO: Usar backticks en lugar de QuotedStr para alias de columnas
      columnasTramos := columnasTramos +
        't.`' + aliasPos + '`, ' +
        't.`' + aliasTot + '`, ';

      Inc(i);
      Next;
    end;
  end;

  // ── PASO 2: encabezado SELECT externo con columnas en orden deseado ───
  sqlString :=
    'SELECT ' +
    '@posicion := IF(@cat_actual = t.Cat, @posicion + 1, 1) AS Posicion, ' +
    '@cat_actual := t.Cat AS Categoria_Control, ' +

    // Columnas fijas iniciales
    't.`Nro. Competidor`, ' +
    't.Competidor, ' +
    't.`Tiempo Total` AS `T. Total`, ' +
    't.Cat, ' +

    // CAMBIO: Diferencias usando Backticks para el AS final
    'IF(@posicion = 1, ' + QuotedStr('-') + ', ' +
    '   IF(t.Vueltas < @vueltas_primero, ' +
    '      CONCAT(CAST(@vueltas_primero - t.Vueltas AS SIGNED), ' + QuotedStr(' vuelta') + ', IF(@vueltas_primero - t.Vueltas > 1, ' + QuotedStr('s') + ', ' + QuotedStr('') + ')), ' +
    '      CONCAT(sel_formatted_lap_time(t.tiempo_total_raw - @primer_tiempo_cat), ' + QuotedStr('') + '))) AS `Dif. con 1ro`, ' +

    'IF(@posicion = 1, ' + QuotedStr('-') + ', ' +
    '   IF(t.Vueltas < @vueltas_anterior, ' +
    '      CONCAT(CAST(@vueltas_anterior - t.Vueltas AS SIGNED), ' + QuotedStr(' vuelta') + ', IF(@vueltas_anterior - t.Vueltas > 1, ' + QuotedStr('s') + ', ' + QuotedStr('') + ')), ' +
    '      CONCAT(sel_formatted_lap_time(t.tiempo_total_raw - @tiempo_anterior), ' + QuotedStr('') + '))) AS `Dif. con Anterior`, ' +

    // Columnas dinámicas de tramos (CT/ET)
    // xxxxxxxx - SE DEBE COMENTAR ESTAS 2 LÍNEAS, EN CASO QUE QUIERAN SOLAMENTE totalizar
    columnasTramos +

    // Columnas fijas finales
    't.`Tiempo Total`, ' +
    't.Vueltas, ' +
    't.tiempo_total_raw, ' +
    't.tiempo_min_raw, ' +
    't.cat_orden, ' +

    't.categoria_oid, ' +
    't.piloto_oid, ' +
    't.Recargo, ' +
    't.DescripcionRecargo as Descripcion, ' +

    '@primer_tiempo_cat := IF(@posicion = 1, t.tiempo_total_raw, @primer_tiempo_cat) AS _p, ' +
    '@tiempo_anterior   := t.tiempo_total_raw AS _a, ' +
    '@vueltas_primero   := IF(@posicion = 1, t.Vueltas, @vueltas_primero) AS _vp, ' +
    '@vueltas_anterior  := t.Vueltas AS _va ' +
    'FROM ( ';

  // Subquery interno
  sqlString := sqlString + ' SELECT nro_competidor AS `Nro. Competidor`, nombre_piloto AS Competidor, Cat, ';

  i := 1;
  with ZTomaTiemposForExport do
  begin
    First;
    while not EOF do
    begin
      if paraReportePDF then
      begin
        aliasPos := 'POS_' + IntToStr(i);
        aliasTot := 'TOT_' + IntToStr(i);
      end
      else
      begin
        aliasPos := 'P. ' + FieldByName('nombre').AsString;
        aliasTot := 'T. ' + FieldByName('nombre').AsString;
      end;

      // CAMBIO: Usar backticks en los alias de las funciones
      // xxxxxxxx - SE DEBE COMENTAR ESTAS 2 LÍNEAS, EN CASO QUE QUIERAN SOLAMENTE totalizar
      sqlString := sqlString + 'sel_pos_dinamic_total_time(' + FieldByName('oid').AsString +
                   ', piloto_oid, categoria_oid) as `' + aliasPos + '`, ';

      sqlString := sqlString + 'CONCAT(sel_formatted_lap_time(MAX(CASE WHEN ranking.oid = ' + FieldByName('oid').AsString +
                   ' THEN ranking.tiempo_total END)), ' + QuotedStr('') + ') as `' + aliasTot + '`, ';

      Inc(i);
      Next;
    end;
  end;

  sqlString := sqlString +
             'CONCAT(sel_formatted_total_time(SUM(tiempo_total)), ' + QuotedStr('') + ') AS `Tiempo Total`, ' +
             'SUM(tiempo_total) AS tiempo_total_raw, ' +
             'SUM(ranking.Vueltas) AS Vueltas, ' +
             'MIN(ranking.tiempo_total) AS tiempo_min_raw, ' +
             'MIN(ranking.orden) AS cat_orden, ' +
             'categoria_oid, piloto_oid, Recargo, DescripcionRecargo ';

  sqlString := sqlString +
       ' FROM (SELECT tte.oid, c.orden, sel_nro_moto_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid) nro_competidor, ' +
       ' sel_categoria_oid_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, tt.piloto_oid) categoria_oid, ' +
       ' CASE WHEN c.utiliza_acompaniante = 1 THEN CONCAT(UC_Words(CONCAT(p.apellido, ' + QuotedStr(', ') + ' , p.nombre)), IFNULL(UC_Words(CONCAT(' + QuotedStr(' / ') + ', n.apellido, ' + QuotedStr(', ') + ' , n.nombre)), ' + QuotedStr(' ') + '))' +
       ' ELSE UC_Words(CONCAT(p.apellido, ' + QuotedStr(', ') + ' , p.nombre)) END AS nombre_piloto, ' +
       ' sel_nombre_categoria_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid) Cat, ' +
       ' sel_total_time(tt.toma_tiempo_evento_oid, tt.piloto_oid) tiempo_total, '+
       ' sel_can_vueltas(tt.toma_tiempo_evento_oid, tt.piloto_oid) Vueltas, ' +
       ' sel_recargo_by_toma_tiempo_agrup_and_piloto_and_tipo_categoria(:toma_tiempo_agrupacion_oid, ipe.tipo_categoria_oid, ipe.piloto_oid) Recargo, ' +
       ' sel_rec_desc_by_toma_tiempo_agrup_and_piloto_and_tipo_categoria(:toma_tiempo_agrupacion_oid, ipe.tipo_categoria_oid, ipe.piloto_oid) DescripcionRecargo, ' +
       ' p.oid as piloto_oid ' +
       ' FROM (SELECT DISTINCT toma_tiempo_evento_oid, piloto_oid FROM toma_tiempos ' +
       '       WHERE toma_tiempo_evento_oid IN (SELECT toma_tiempo_oid FROM toma_tiempo_agrupacion_tt ' +
       '                                        WHERE toma_tiempo_agrupacion_oid = :toma_tiempo_agrupacion_oid)) tt ' +
       '      JOIN toma_tiempo_evento tte ON tt.toma_tiempo_evento_oid = tte.oid ' +
       '      JOIN piloto p ON tt.piloto_oid = p.oid ' +
       '      JOIN inscripcion_piloto_evento ipe ON (ipe.evento_oid = tte.evento_oid AND ipe.piloto_oid = tt.piloto_oid)' +
       '      LEFT JOIN navegante n ON n.piloto_oid = p.oid ' +
       '      JOIN categorias c ON c.oid = sel_categoria_oid_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, ipe.evento_oid, ipe.piloto_oid) ' + // CAMBIO: Join explícito
       ' WHERE tte.oid IN (SELECT DISTINCT toma_tiempo_oid FROM toma_tiempo_agrupacion_tt WHERE toma_tiempo_agrupacion_oid = :toma_tiempo_agrupacion_oid) ' +
       ' GROUP BY p.oid, tte.oid) ranking ' +
       ' GROUP BY nro_competidor, nombre_piloto, Cat ' +
       // CAMBIO: Ordenar por tiempo_total_raw (numérico) en lugar de alias formateado
       ' ORDER BY orden is null, orden asc, Cat, Vueltas DESC, tiempo_total_raw ASC ' +
       ' ) t, (SELECT @posicion := 0, @cat_actual := ' + QuotedStr('') + ', ' +
       ' @primer_tiempo_cat := 0, @tiempo_anterior := 0, ' +
       ' @vueltas_primero := 0, @vueltas_anterior := 0) r ';

  Result := sqlString;
end;

function TEdicionAgrupacion.getAgrupacionSQL(agrupacionTomaTiempoOID : Integer; paraReportePDF: Boolean = False): String;
var
  sqlString: String;
  i : Integer;
colName: String;
begin
  with ZTomaTiemposForExport do
    begin
      Close;
      ParamByName('toma_tiempo_agrupacion_oid').AsInteger:= agrupacionTomaTiempoOID;
      Open;
    end;

  // --- PUNTO 1: Envolver todo en un SELECT externo con variables ---
  sqlString := 'SELECT ' +
               ' @posicion := IF(@cat_actual = t.Cat, @posicion + 1, 1) AS Posicion, ' +
               ' @cat_actual := t.Categoria as Categoria_Control, ' +
               ' t.* FROM ( ';

  sqlString := sqlString + ' SELECT nro_competidor ' + QuotedStr('Nro. Competidor') +
               ', nombre_piloto Competidor, Categoria, ';

  i := 1;
  with ZTomaTiemposForExport do
    begin
      First;
      while not EOF do
        begin
          if paraReportePDF then
            colName := 'TOT_' + IntToStr(i)
          else
            colName := FieldByName('nombre').AsString;

          sqlString:= sqlString + 'CONCAT(sel_formatted_lap_time(sel_total_time('+FieldByName('oid').AsString+', piloto_oid)), '+QuotedStr('.')+') as '+QuotedStr(colName)+', ' ;

          Inc(i);
          Next;
        end;
    end;


  sqlString:= sqlString + ' GROUP_CONCAT(ranking.TR) DescripcionRecargo, SUM(ranking.Recargo) Recargo, CONCAT(sel_formatted_total_time(SUM(tiempo_total)), '+QuotedStr('.')+') '+QuotedStr('Tiempo Total')+', SUM(ranking.Vueltas) Vueltas ' +
       ' from (select tte.oid, sel_nro_moto_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid) nro_competidor, ' +
       ' CASE WHEN c.utiliza_acompaniante = 1 THEN CONCAT(UC_Words(CONCAT(p.apellido, ' + QuotedStr(', ') + ' , p.nombre)), IFNULL(UC_Words(CONCAT(' + QuotedStr(' / ') + ', n.apellido, ' + QuotedStr(', ') + ' , n.nombre)), ' + QuotedStr(' ') + '))' +
       ' ELSE UC_Words(CONCAT(p.apellido, ' + QuotedStr(', ') + ' , p.nombre)) END AS nombre_piloto, ' +
       ' sel_nombre_categoria_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid) Categoria, ' +
       ' sel_total_time(tt.toma_tiempo_evento_oid, tt.piloto_oid) tiempo_total, '+
       ' sel_can_vueltas(tt.toma_tiempo_evento_oid, tt.piloto_oid) Vueltas, ' +
       ' c.orden, ' +
       ' sel_recargo_by_toma_tiempo_evento_and_piloto_and_tipo_categoria(tte.oid, ipe.tipo_categoria_oid, ipe.piloto_oid) Recargo, ' +
       ' CONCAT(sel_rec_desc_by_toma_tiempo_evento_and_piloto_and_tipo_categoria(tte.oid, ipe.tipo_categoria_oid, ipe.piloto_oid), '+QuotedStr(' - ')+', tte.nombre) TR, ' +
       ' p.oid as piloto_oid ' +
     ' from toma_tiempos tt ' +
     '     join toma_tiempo_evento tte on tt.toma_tiempo_evento_oid = tte.oid ' +
     '     join piloto p on tt.piloto_oid = p.oid ' +
     '     join inscripcion_piloto_evento ipe on (ipe.evento_oid = tte.evento_oid and ipe.piloto_oid = tt.piloto_oid)' +
     '     left join navegante n on n.piloto_oid = p.oid, categorias c' +
     ' where tte.oid in (SELECT DISTINCT toma_tiempo_oid FROM toma_tiempo_agrupacion_tt WHERE toma_tiempo_agrupacion_oid = :toma_tiempo_agrupacion_oid) ' +
     ' and c.oid = sel_categoria_oid_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, ipe.evento_oid, ipe.piloto_oid) ' +
     ' group by p.oid, tte.oid) ranking ' +
     ' group by nro_competidor, nombre_piloto, Categoria ' +
     ' order by orden IS NULL, orden, Categoria, Vueltas desc, tiempo_total asc ' +
     ' ) t, (SELECT @posicion := 0, @cat_actual := ' + QuotedStr('') + ') r '; // --- PUNTO 3: Cierre de subconsulta e inicialización ---

  Result:= sqlString;
end;

procedure TEdicionAgrupacion.OcultarCamposExportacion(Dataset: TDataSet; const NombresCampos: array of string);
var
  i: Integer;
  Campo: TField;
begin
  // Desactivamos los controles visuales para ganar velocidad
  Dataset.DisableControls;
  try
    for i := Low(NombresCampos) to High(NombresCampos) do
    begin
      Campo := Dataset.FindField(NombresCampos[i]);
      if Assigned(Campo) then
        Campo.Visible := False;
    end;
  finally
    Dataset.EnableControls;
  end;
end;

function TEdicionAgrupacion.EsColumnaPublicable(Field: TField): Boolean;
begin
  // Misma regla para HTML y Excel: campo visible y que no sea la categoría (va como título de bloque)
  Result := Field.Visible and not SameText(Field.FieldName, CAMPO_CATEGORIA_PUBLICACION);
end;

procedure TEdicionAgrupacion.AbrirConsultaPublicacion(Query: TZReadOnlyQuery);
begin
  // Consulta única de publicación: la usan la exportación WEB y la de Excel
  with Query do
  begin
    Close;
    Sql.Text := getAgrupacionPuntosSQL(agrupacionTomaTiempoOID);
    ParamByName('toma_tiempo_agrupacion_oid').AsInteger := agrupacionTomaTiempoOID;

    DisableControls;
    try
      Open;
    finally
      EnableControls;
    end;
  end;

  // Columnas internas que no se publican
  OcultarCamposExportacion(Query, ['Posicion', 'categoria_oid', 'piloto_oid', 'Categoria_Control', '_p', '_a', '_vp', '_va', 'tiempo_total_raw', 'tiempo_min_raw', 'cat_orden']);
end;

procedure TEdicionAgrupacion.ExportarAExcel(Dataset: TDataSet);
const
  xlCenter      = -4108;
  xlLeft        = -4131;
  xlRight       = -4152;
  xlEdgeBottom  = 9;
  xlContinuous  = 1;
  xlLandscape   = 2;
var
  Excel, Libro, Hoja, Fila: Variant;
  Filas: array of Variant;
  Columnas: array of TField;
  Conteo: TStringList;
  CategoriaActual: string;
  NumCols, FilaExcel, PosicionEnCategoria, i: Integer;

  function Rango(FilaDesde, ColDesde, FilaHasta, ColHasta: Integer): Variant;
  begin
    Result := Hoja.Range[Hoja.Cells[FilaDesde, ColDesde], Hoja.Cells[FilaHasta, ColHasta]];
  end;

  function ObtenerConteo(const Categoria: string): Integer;
  var
    idx: Integer;
  begin
    idx := Conteo.IndexOfName(Categoria);
    if idx >= 0 then
      Result := StrToInt(Conteo.ValueFromIndex[idx])
    else
      Result := 0;
  end;

  procedure EscribirTituloCategoria(const Categoria: string);
  var
    R, Encabezados: Variant;
    c: Integer;
  begin
    // Fila de título: igual al encabezado de la tarjeta HTML
    R := Rango(FilaExcel, 1, FilaExcel, NumCols);
    R.NumberFormat := FORMATO_TEXTO_EXCEL;
    R.Interior.Color := RGB(44, 62, 80);
    R.Font.Color := RGB(255, 255, 255);
    R.Font.Bold := True;
    R := Rango(FilaExcel, 1, FilaExcel, NumCols - 1);
    R.Merge; // celdas combinadas: AutoFit no ensancha la columna Pos. por el nombre
    R.HorizontalAlignment := xlLeft;
    Hoja.Cells[FilaExcel, 1].Value := Categoria;
    Hoja.Cells[FilaExcel, NumCols].HorizontalAlignment := xlRight;
    Hoja.Cells[FilaExcel, NumCols].Value := IntToStr(ObtenerConteo(Categoria)) +
      ' de ' + IntToStr(ObtenerConteo(Categoria)) + ' participantes';
    Inc(FilaExcel);

    // Fila de encabezados de columna
    Encabezados := VarArrayCreate([1, NumCols], varVariant);
    Encabezados[1] := 'Pos.';
    for c := 0 to High(Columnas) do
      Encabezados[c + 2] := Columnas[c].DisplayLabel;
    R := Rango(FilaExcel, 1, FilaExcel, NumCols);
    R.NumberFormat := FORMATO_TEXTO_EXCEL;
    R.Value := Encabezados;
    R.Font.Bold := True;
    R.Interior.Color := RGB(236, 240, 241);
    R.Borders[xlEdgeBottom].LineStyle := xlContinuous;
    Inc(FilaExcel);
  end;

  procedure VolcarFilasCategoria;
  var
    Bloque, Datos: Variant;
    f, c: Integer;
  begin
    if Length(Filas) = 0 then
      Exit;

    // Una sola asignación por categoría (Variant array 2D), sobre columnas ya formateadas
    Bloque := VarArrayCreate([1, Length(Filas), 1, NumCols], varVariant);
    for f := 0 to High(Filas) do
    begin
      Datos := Filas[f];
      for c := 1 to NumCols do
        Bloque[f + 1, c] := Datos[c];
    end;
    Rango(FilaExcel, 1, FilaExcel + High(Filas), NumCols).Value := Bloque;

    // Columna Pos.: negrita y colores de podio del HTML (.top1/.top2/.top3)
    Rango(FilaExcel, 1, FilaExcel + High(Filas), 1).Font.Bold := True;
    if Length(Filas) > 0 then
      Hoja.Cells[FilaExcel, 1].Font.Color := RGB(212, 175, 55);
    if Length(Filas) > 1 then
      Hoja.Cells[FilaExcel + 1, 1].Font.Color := RGB(167, 167, 173);
    if Length(Filas) > 2 then
      Hoja.Cells[FilaExcel + 2, 1].Font.Color := RGB(205, 127, 50);

    Inc(FilaExcel, Length(Filas) + 1); // fila en blanco entre categorías
    SetLength(Filas, 0);
  end;

begin
  if Dataset.IsEmpty then
  begin
    TF_EE_Message.ShowMessage(TComponent(Self), 'Exportar a Excel',
      'La agrupación no tiene tomas de tiempo para exportar.', TF_EE_Message.INFORMATION, False);
    Exit;
  end;

  // Mismas columnas y en el mismo orden que el HTML
  for i := 0 to Dataset.FieldCount - 1 do
    if EsColumnaPublicable(Dataset.Fields[i]) then
    begin
      SetLength(Columnas, Length(Columnas) + 1);
      Columnas[High(Columnas)] := Dataset.Fields[i];
    end;
  NumCols := Length(Columnas) + 1; // + columna Pos.

  try
    Excel := CreateOleObject('Excel.Application');
  except
    on E: Exception do
    begin
      TF_EE_Message.ShowMessage(TComponent(Self), 'No se pudo iniciar Excel',
        'Verifique que Microsoft Excel esté instalado en este equipo.' + sLineBreak + E.Message,
        TF_EE_Message.ERROR, False);
      Exit;
    end;
  end;

  Conteo := TStringList.Create;
  Screen.Cursor := crHourGlass;
  try
    try
      Excel.ScreenUpdating := False;
      Excel.DisplayAlerts := False;
      Libro := Excel.Workbooks.Add;
      Hoja := Libro.Worksheets[1];
      Hoja.Name := 'Toma de Tiempos Agrupada';

      // Formato ANTES de escribir: columnas de texto en '@' para que Excel no convierta
      // tiempos (MM:SS.mmm / HH:MM:SS.mmm), Nro. Competidor ni diferencias.
      // Las numéricas (Pos., P. <toma>, Vueltas, Recargo) quedan en General.
      Rango(1, 1, 1, NumCols).EntireColumn.HorizontalAlignment := xlCenter;
      for i := 0 to High(Columnas) do
        if not (Columnas[i] is TNumericField) then
          Hoja.Cells[1, i + 2].EntireColumn.NumberFormat := FORMATO_TEXTO_EXCEL;

      FilaExcel := 1;

      // Pre-conteo de participantes por categoría (igual que ExportarAHTML)
      Dataset.First;
      while not Dataset.Eof do
      begin
        CategoriaActual := Trim(Dataset.FieldByName(CAMPO_CATEGORIA_PUBLICACION).AsString);
        i := Conteo.IndexOfName(CategoriaActual);
        if i >= 0 then
          Conteo.ValueFromIndex[i] := IntToStr(StrToInt(Conteo.ValueFromIndex[i]) + 1)
        else
          Conteo.Add(CategoriaActual + '=1');
        Dataset.Next;
      end;

      // Recorrido principal: un bloque por categoría
      CategoriaActual := '';
      PosicionEnCategoria := 0;
      Dataset.First;
      while not Dataset.Eof do
      begin
        if Trim(Dataset.FieldByName(CAMPO_CATEGORIA_PUBLICACION).AsString) <> CategoriaActual then
        begin
          VolcarFilasCategoria;
          CategoriaActual := Trim(Dataset.FieldByName(CAMPO_CATEGORIA_PUBLICACION).AsString);
          EscribirTituloCategoria(CategoriaActual);
          PosicionEnCategoria := 0;
        end;

        Inc(PosicionEnCategoria);

        // Mismo valor que el <td> del HTML (Field.AsString); los numéricos van como número
        Fila := VarArrayCreate([1, NumCols], varVariant);
        Fila[1] := PosicionEnCategoria;
        for i := 0 to High(Columnas) do
          if (Columnas[i] is TNumericField) and not Columnas[i].IsNull then
            Fila[i + 2] := Columnas[i].AsFloat
          else
            Fila[i + 2] := Columnas[i].AsString;

        SetLength(Filas, Length(Filas) + 1);
        Filas[High(Filas)] := Fila;

        Dataset.Next;
      end;
      VolcarFilasCategoria;

      Rango(1, 1, FilaExcel, NumCols).Columns.AutoFit;

      // Impresión: horizontal y 1 página de ancho, como ExportarExcelYPDF
      try
        Hoja.PageSetup.Orientation := xlLandscape;
        Hoja.PageSetup.Zoom := False;
        Hoja.PageSetup.FitToPagesWide := 1;
        Hoja.PageSetup.FitToPagesTall := False;
      except
        // Sin impresora instalada PageSetup puede fallar; no impide la exportación
      end;

      Excel.ScreenUpdating := True;
      Excel.DisplayAlerts := True;
      Excel.Visible := True;
      Excel.UserControl := True; // Excel queda abierto para el usuario al liberar las referencias
    except
      on E: Exception do
      begin
        try
          Excel.DisplayAlerts := False;
          Excel.Quit; // descarta el libro a medio generar
        except
        end;
        TF_EE_Message.ShowMessage(TComponent(Self), 'Error al exportar a Excel',
          E.Message, TF_EE_Message.ERROR, False);
      end;
    end;
  finally
    Screen.Cursor := crDefault;
    Conteo.Free;
    SetLength(Filas, 0);
    Fila := Unassigned;
    Hoja := Unassigned;
    Libro := Unassigned;
    Excel := Unassigned;
  end;
end;

procedure TEdicionAgrupacion.JvReportTimerTimer(Sender: TObject);
var
  RutaArchivo, TextoCabecera, Instancia, Modo: string;
begin
      AbrirConsultaPublicacion(zExportarAgrupacion);
      ExportarAHTML(zExportarAgrupacion);
      try
        SubirArchivoAWorker(GenerarJSONResultados(zExportarAgrupacion),
          'datos_temp.json', 'application/json; charset=utf-8', '/datos');
      except
        // Sin mensaje en pantalla: si falla la red, ExportarAHTML ya avisó en este mismo ciclo.
        on E: Exception do
          TLog.Error('Worker', 'JSON de resultados: ' + E.Message);
      end;
end;

procedure TEdicionAgrupacion.ExportarExcelYPDF(Dataset: TDataSet; const Instancia: string);
var
  RutaArchivo: string;
  Hoja: Variant;
begin
  // Método en desuso - se mantiene por si se retoma la exportación a Excel/PDF más adelante.
  // Actualmente la publicación de resultados se hace vía ExportarAHTML + Cloudflare Worker.

  scExcelExport.Dataset := Dataset;
  scExcelExport.WorksheetName := 'Clasifica x Categoria';
  scExcelExport.FileName := 'C:\enduro\Dropbox\Reportes Web\exportarweb' + Instancia + '.xls';
  RutaArchivo := 'C:\enduro\Dropbox\Reportes Web\exportarweb.pdf';

  try
    scExcelExport.Connect;

    if Assigned(scExcelExport.ExcelApplication) then
    begin
      scExcelExport.ExcelApplication.Visible[0] := False;
      scExcelExport.ExcelApplication.ScreenUpdating[0] := False;
      scExcelExport.ExcelApplication.DisplayAlerts[0] := False;
    end;

    scExcelExport.ExportDataset;

    Hoja := scExcelExport.ExcelApplication.ActiveSheet;

    Hoja.Cells[2, 7].Select;
    scExcelExport.ExcelApplication.ActiveWindow.FreezePanes := True;

    Hoja.PageSetup.CenterHeader := '&"Arial,Bold"&12 ENCUENTRO CORDILLERANO' + #13 +
      'Fecha 1: Epuyen' + #13 +
      'Generado el: ' + FormatDateTime('dd/mm/yyyy hh:nn', Now);

    Hoja.PageSetup.RightFooter := 'Página &P de &N';

    Hoja.Range['A1', 'AF146'].EntireColumn.AutoFit;
    Hoja.Range['A1', 'AF146'].HorizontalAlignment := -4108;

    Hoja.PageSetup.Zoom := False;
    Hoja.PageSetup.FitToPagesWide := 1;
    Hoja.PageSetup.FitToPagesTall := False;
    Hoja.PageSetup.Orientation := 2;
    Hoja.ExportAsFixedFormat(0, RutaArchivo);

    if Assigned(scExcelExport.ExcelApplication) then
      scExcelExport.ExcelApplication.Visible[0] := False;

    scExcelExport.ExcelApplication.ActiveWorkbook.SaveAs(
      scExcelExport.FileName,
      56,
      EmptyParam, EmptyParam, EmptyParam, EmptyParam,
      1,
      EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 0
    );

    scExcelExport.ExcelApplication.Quit;
  finally
    scExcelExport.Disconnect;
  end;
end;

function EjecutarComando(const CmdLine: string; out Salida: string): Boolean;
var
  SecurityAttr: TSecurityAttributes;
  StdOutRead, StdOutWrite: THandle;
  StartInfo: TStartupInfo;
  ProcInfo: TProcessInformation;
  Buffer: array[0..4095] of AnsiChar;
  BytesRead, ExitCode, Espera: DWORD;
  CmdLineBuf: string;
begin
  Result := False;
  Salida := '';
  ExitCode := 0;

  SecurityAttr.nLength := SizeOf(TSecurityAttributes);
  SecurityAttr.bInheritHandle := True;
  SecurityAttr.lpSecurityDescriptor := nil;

  if not CreatePipe(StdOutRead, StdOutWrite, @SecurityAttr, 0) then
  begin
    Salida := 'CreatePipe: ' + SysErrorMessage(GetLastError);
    Exit;
  end;

  // curl solo hereda el extremo de escritura del pipe
  SetHandleInformation(StdOutRead, HANDLE_FLAG_INHERIT, 0);

  try
    FillChar(StartInfo, SizeOf(StartInfo), 0);
    StartInfo.cb := SizeOf(StartInfo);
    StartInfo.hStdOutput := StdOutWrite;
    StartInfo.hStdError := StdOutWrite;
    StartInfo.dwFlags := STARTF_USESTDHANDLES or STARTF_USESHOWWINDOW;
    StartInfo.wShowWindow := SW_HIDE;

    CmdLineBuf := CmdLine; // CreateProcess necesita un buffer modificable

    if not CreateProcess(nil, PChar(CmdLineBuf), nil, nil, True, 0, nil, nil, StartInfo, ProcInfo) then
    begin
      Salida := 'No se pudo ejecutar curl: ' + SysErrorMessage(GetLastError);
      Exit;
    end;

    CloseHandle(StdOutWrite);
    StdOutWrite := 0;

    repeat
      if not ReadFile(StdOutRead, Buffer, SizeOf(Buffer) - 1, BytesRead, nil) or (BytesRead = 0) then
        Break;
      Buffer[BytesRead] := #0;
      Salida := Salida + string(AnsiString(Buffer));
    until False;

    Espera := WaitForSingleObject(ProcInfo.hProcess, 15000); // timeout de 15s, no INFINITE
    if Espera = WAIT_TIMEOUT then
    begin
      TerminateProcess(ProcInfo.hProcess, 1);
      Salida := Trim(Salida) + ' [curl no terminó en 15 s]';
    end
    else if GetExitCodeProcess(ProcInfo.hProcess, ExitCode) then
    begin
      Result := (ExitCode = 0);
      if not Result then
        Salida := Trim(Salida) + Format(' [curl exit code %d]', [ExitCode]);
    end
    else
      Salida := Trim(Salida) + ' GetExitCodeProcess: ' + SysErrorMessage(GetLastError);

    CloseHandle(ProcInfo.hProcess);
    CloseHandle(ProcInfo.hThread);
  finally
    if StdOutWrite <> 0 then CloseHandle(StdOutWrite);
    CloseHandle(StdOutRead);
  end;
end;

function JSONTexto(const S: string): string;
var
  i: Integer;
begin
  Result := '"';
  for i := 1 to Length(S) do
    case S[i] of
      '"': Result := Result + '\"';
      '\': Result := Result + '\\';
      #9:  Result := Result + '\t';
      #10: Result := Result + '\n';
      #13: Result := Result + '\r';
    else
      if S[i] < #32 then
        Result := Result + '\u' + IntToHex(Ord(S[i]), 4)
      else
        Result := Result + S[i];
    end;
  Result := Result + '"';
end;

function TEdicionAgrupacion.GenerarJSONResultados(Dataset: TDataSet): string;
const
  PREFIJO_POS = 'P. ';
var
  SB: TStringBuilder;
  FS: TFormatSettings;
  Tomas: TStringList;
  i: Integer;
  PrimerPiloto: Boolean;
begin
  // Punto decimal fijo: con la configuración regional argentina FloatToStr usa coma
  FS := TFormatSettings.Create;
  FS.DecimalSeparator := '.';

  Tomas := TStringList.Create;
  SB := TStringBuilder.Create;
  try
    // Las tomas de este servidor salen de las columnas "P. <toma>"
    for i := 0 to Dataset.FieldCount - 1 do
      if Copy(Dataset.Fields[i].FieldName, 1, Length(PREFIJO_POS)) = PREFIJO_POS then
        Tomas.Add(Copy(Dataset.Fields[i].FieldName, Length(PREFIJO_POS) + 1, MaxInt));

    SB.Append('{"instancia":').Append(JSONTexto(ReadStringFromIniFile('Instancia', 'Nombre', '')));
    SB.Append(',"generado":').Append(JSONTexto(FormatDateTime('yyyy-mm-dd hh:nn:ss', Now)));
    SB.Append(',"tomas":[');
    for i := 0 to Tomas.Count - 1 do
    begin
      if i > 0 then
        SB.Append(',');
      SB.Append(JSONTexto(Tomas[i]));
    end;
    SB.Append('],"pilotos":[');

    PrimerPiloto := True;
    Dataset.DisableControls;
    try
      Dataset.First;
      while not Dataset.Eof do
      begin
        if not PrimerPiloto then
          SB.Append(',');
        PrimerPiloto := False;

        SB.Append('{"nro":').Append(JSONTexto(Trim(Dataset.FieldByName('Nro. Competidor').AsString)));
        SB.Append(',"nombre":').Append(JSONTexto(Dataset.FieldByName('Competidor').AsString));
        SB.Append(',"cat":').Append(JSONTexto(Trim(Dataset.FieldByName(CAMPO_CATEGORIA_PUBLICACION).AsString)));
        if Dataset.FieldByName('cat_orden').IsNull then
          SB.Append(',"catOrden":null')
        else
          SB.Append(',"catOrden":').Append(Dataset.FieldByName('cat_orden').AsInteger);
        SB.Append(',"tiempo":').Append(FormatFloat('0.000', Dataset.FieldByName('tiempo_total_raw').AsFloat, FS));
        SB.Append(',"vueltas":').Append(Round(Dataset.FieldByName('Vueltas').AsFloat));
        if Dataset.FieldByName('tiempo_min_raw').AsFloat < 0 then
          SB.Append(',"desc":true')
        else
          SB.Append(',"desc":false');
        SB.Append(',"recargo":').Append(Dataset.FieldByName('Recargo').AsInteger);
        SB.Append(',"recargoDesc":').Append(JSONTexto(Dataset.FieldByName('Descripcion').AsString));

        SB.Append(',"tomas":{');
        for i := 0 to Tomas.Count - 1 do
        begin
          if i > 0 then
            SB.Append(',');
          SB.Append(JSONTexto(Tomas[i]));
          SB.Append(':{"pos":').Append(JSONTexto(Dataset.FieldByName(PREFIJO_POS + Tomas[i]).AsString));
          SB.Append(',"tiempo":').Append(JSONTexto(Dataset.FieldByName('T. ' + Tomas[i]).AsString));
          SB.Append('}');
        end;
        SB.Append('}}');

        Dataset.Next;
      end;
    finally
      Dataset.EnableControls;
    end;

    SB.Append(']}');
    Result := SB.ToString;
  finally
    SB.Free;
    Tomas.Free;
  end;
end;

procedure PublicarEnWorker(const Contenido, NombreArchivo, ContentType, Ruta, IdDestino: string);
var
  RutaTemp, CmdLine, Salida, Token: string;
  SL: TStringList;
begin
  Token := ReadStringFromIniFile('Instancia', 'Token', '');

  RutaTemp := ExtractFilePath(ParamStr(0)) + NombreArchivo;

  SL := TStringList.Create;
  try
    SL.Text := Contenido;
    SL.SaveToFile(RutaTemp, TEncoding.UTF8);
  finally
    SL.Free;
  end;

  // -f: si el Worker responde 4xx/5xx (token inválido, JSON mal formado) curl
  // devuelve error y no se da por subido en silencio.
  // -sS: sin barra de progreso pero con el mensaje de error.
  // --max-time: que una red lenta no congele la pantalla (menor que la espera de 15 s de EjecutarComando).
  CmdLine := Format(
    '"%scurl.exe" -sS -f --connect-timeout 5 --max-time 12 -X POST -H "Authorization: Bearer %s" ' +
    '-H "Content-Type: %s" --data-binary "@%s" ' +
    '"%s%s?id=%s"',
    [ExtractFilePath(ParamStr(0)), Token, ContentType, RutaTemp, URL_WORKER, Ruta, IdDestino]);

  if not EjecutarComando(CmdLine, Salida) then
  begin
    TLog.Error('Worker', 'Fallo al subir ' + NombreArchivo + ' a ' + Ruta + '?id=' + IdDestino + ': ' + Salida);
    raise Exception.Create('Fallo al subir con curl: ' + Salida);
  end;
  TLog.Info('Worker', 'Publicado ' + NombreArchivo + ' en ' + Ruta + '?id=' + IdDestino);
end;

procedure TEdicionAgrupacion.SubirArchivoAWorker(const Contenido, NombreArchivo, ContentType, Ruta: string);
begin
  PublicarEnWorker(Contenido, NombreArchivo, ContentType, Ruta,
  ReadStringFromIniFile('Instancia', 'Nombre', ''));
end;

procedure TEdicionAgrupacion.SubirAWorker(const HTMLContent: string);
begin
  SubirArchivoAWorker(HTMLContent, 'posiciones_temp.html', 'text/html; charset=utf-8', '/');
end;

function TEdicionAgrupacion.ConstruirCabeceraEvento: string;
var
  Q: TZReadOnlyQuery;
  Lista: TStringList;
  Titulo, Fechas, UnaFecha: string;

  function HtmlEsc(const S: string): string;
  begin
    Result := StringReplace(S, '&', '&amp;', [rfReplaceAll]);
    Result := StringReplace(Result, '<', '&lt;', [rfReplaceAll]);
    Result := StringReplace(Result, '>', '&gt;', [rfReplaceAll]);
  end;

begin
  Titulo := '';
  Fechas := '';

  // La(s) fecha(s) de la agrupación: tomas -> toma_tiempo_evento -> evento -> campeonato
  Q := TZReadOnlyQuery.Create(nil);
  try
    try
      Q.Connection := zExportarAgrupacion.Connection;
      Q.SQL.Text :=
        'SELECT DISTINCT e.nro_fecha nro_fecha, e.nombre nombre, e.fecha fecha, c.nombre campeonato ' +
        'FROM toma_tiempo_agrupacion_tt tta ' +
        'JOIN toma_tiempo_evento tte ON tte.oid = tta.toma_tiempo_oid ' +
        'JOIN evento e ON e.oid = tte.evento_oid ' +
        'LEFT JOIN campeonato c ON c.oid = e.campeonato_oid ' +
        'WHERE tta.toma_tiempo_agrupacion_oid = :oid ' +
        'ORDER BY e.nro_fecha, e.fecha';
      Q.ParamByName('oid').AsInteger := agrupacionTomaTiempoOID;
      Q.Open;

      while not Q.Eof do
      begin
        if Titulo = '' then
          Titulo := Trim(Q.FieldByName('campeonato').AsString);

        UnaFecha := '';
        if not Q.FieldByName('nro_fecha').IsNull then
          UnaFecha := 'Fecha ' + Q.FieldByName('nro_fecha').AsString + ' - ';
        if not Q.FieldByName('fecha').IsNull then
          UnaFecha := UnaFecha + FormatDateTime('dd/mm/yyyy', Q.FieldByName('fecha').AsDateTime) + ' - ';
        UnaFecha := UnaFecha + HtmlEsc(Trim(Q.FieldByName('nombre').AsString));

        if Fechas = '' then
          Fechas := UnaFecha
        else
          Fechas := Fechas + ' &middot; ' + UnaFecha;

        Q.Next;
      end;
    except
      on E: Exception do
      begin
        // Si falla la consulta de cabecera no se corta la publicación: solo se omite el título/fecha.
        Titulo := '';
        Fechas := '';
        TLog.Error('Worker', 'Cabecera de evento: ' + E.Message);
      end;
    end;
  finally
    Q.Free;
  end;

  Lista := TStringList.Create;
  try
    Lista.Add('  <div class="evento-header">');
    if Titulo <> '' then
      Lista.Add('    <div class="evento-titulo">' + HtmlEsc(Titulo) + '</div>');
    if Fechas <> '' then
      Lista.Add('    <div class="evento-subtitulo">Tiempos en vivo &middot; ' + Fechas + '</div>')
    else
      Lista.Add('    <div class="evento-subtitulo">Tiempos en vivo</div>');
    Lista.Add('    <div class="evento-datos">');
    Lista.Add('      &Uacute;ltima actualizaci&oacute;n: ' + FormatDateTime('dd-mm-yyyy hh:nn:ss', Now));
    Lista.Add('    </div>');
    Lista.Add('  </div>');
    Result := Lista.Text;
  finally
    Lista.Free;
  end;
end;


procedure TEdicionAgrupacion.ExportarAHTML(Dataset: TDataSet);
var
  List: TStringList;
  Conteo: TStringList;
  i: Integer;
  Fila, CategoriaActual, NombreCampoCat: string;
  PrimeraFila: Boolean;
  PosicionEnCategoria: Integer;
  NroCategoria: Integer;

  function ObtenerConteo(const Categoria: string): Integer;
  var
    idx: Integer;
  begin
    idx := Conteo.IndexOfName(Categoria);
    if idx >= 0 then
      Result := StrToInt(Conteo.ValueFromIndex[idx])
    else
      Result := 0;
  end;

function Medalla(Pos: Integer): string;
begin
  case Pos of
    1: Result := '&#129351;'; // 🥇
    2: Result := '&#129352;'; // 🥈
    3: Result := '&#129353;'; // 🥉
  else
    Result := IntToStr(Pos);
  end;
end;

procedure AbrirTabla(const Categoria: string);
var
  i: Integer;
begin
  Inc(NroCategoria);
  List.Add('  <div class="categoria-card" id="cat-' + IntToStr(NroCategoria) + '">');
  List.Add('    <div class="categoria-header">');
  List.Add('      <span class="categoria-nombre">' + Categoria + '</span>');
  List.Add('      <span class="categoria-count">' + IntToStr(ObtenerConteo(Categoria)) +
    ' de ' + IntToStr(ObtenerConteo(Categoria)) + ' participantes</span>');
  List.Add('    </div>');
  List.Add('    <div class="tabla-scroll">');        // <-- ESTA LÍNEA es la que falta
  List.Add('    <table class="tabla-web">');
  List.Add('      <thead><tr>');
  List.Add('        <th>Pos.</th>');
  for i := 0 to Dataset.FieldCount - 1 do
    if Dataset.Fields[i].Visible and not SameText(Dataset.Fields[i].FieldName, NombreCampoCat) then
      List.Add('        <th>' + Dataset.Fields[i].DisplayLabel + '</th>');
  List.Add('      </tr></thead>');
  List.Add('      <tbody>');
end;

procedure CerrarTabla;
begin
  List.Add('      </tbody>');
  List.Add('    </table>');
  List.Add('    </div>');    // <-- ESTA LÍNEA también falta (cierre de tabla-scroll)
  List.Add('  </div>');      // cierre de categoria-card
end;

begin
  NombreCampoCat := CAMPO_CATEGORIA_PUBLICACION; // nombre del campo de categoría

  List := TStringList.Create;
  Conteo := TStringList.Create;
  try
    Conteo.Sorted := False;

    // --- Pre-conteo de participantes por categoría ---
    Dataset.First;
    while not Dataset.Eof do
    begin
      CategoriaActual := Trim(Dataset.FieldByName(NombreCampoCat).AsString);
      i := Conteo.IndexOfName(CategoriaActual);
      if i >= 0 then
        Conteo.ValueFromIndex[i] := IntToStr(StrToInt(Conteo.ValueFromIndex[i]) + 1)
      else
        Conteo.Add(CategoriaActual + '=1');
      Dataset.Next;
    end;

    // --- Estilos (una sola vez) ---
    List.Add('<style>');
    List.Add('  body { background-color: #f5f6f8; }');
    List.Add('  .categoria-card {');
    List.Add('    font-family: Arial, Helvetica, sans-serif;');
    List.Add('    background: #ffffff;');
    List.Add('    border-radius: 10px;');
    List.Add('    box-shadow: 0 2px 6px rgba(0,0,0,0.12);');
    List.Add('    margin-bottom: 24px;');
    List.Add('    overflow: hidden;');
    List.Add('  }');
    List.Add('  .tabla-scroll {');
    List.Add('    overflow-x: auto;');
    List.Add('    -webkit-overflow-scrolling: touch;');
    List.Add('    width: 100%;');
    List.Add('  }');
    List.Add('  .tabla-web { min-width: 900px; }'); // fuerza scroll horizontal en vez de achicar el texto hasta ilegible
    List.Add('  .categoria-header {');
    List.Add('    background: linear-gradient(135deg, #2c3e50, #34495e);');
    List.Add('    color: #ffffff;');
    List.Add('    padding: 12px 16px;');
    List.Add('    display: flex;');
    List.Add('    justify-content: space-between;');
    List.Add('    align-items: center;');
    List.Add('    flex-wrap: wrap;');
    List.Add('  }');
    List.Add('  .categoria-nombre { font-size: 16px; font-weight: bold; }');
    List.Add('  .categoria-count { font-size: 13px; opacity: 0.85; }');
    List.Add('  .tabla-web { border-collapse: collapse; width: 100%; }');
    List.Add('  .tabla-web th {');
    List.Add('    background-color: #ecf0f1;');
    List.Add('    color: #2c3e50;');
    List.Add('    padding: 8px 10px;');
    List.Add('    font-size: 13px;');
    List.Add('    text-transform: uppercase;');
    List.Add('    border-bottom: 2px solid #dcdfe1;');
    List.Add('  }');
    List.Add('  .tabla-web td {');
    List.Add('    padding: 8px 10px;');
    List.Add('    text-align: center;');
    List.Add('    font-size: 14px;');
    List.Add('    border-bottom: 1px solid #eee;');
    List.Add('  }');
    List.Add('  .tabla-web tr:nth-child(even) { background-color: #f9fafb; }');
    List.Add('  .tabla-web tr:hover { background-color: #eef6ff; }');
    List.Add('  .tabla-web td:first-child { font-weight: bold; }');
    List.Add('  .top1 { color: #d4af37; }');
    List.Add('  .top2 { color: #a7a7ad; }');
    List.Add('  .top3 { color: #cd7f32; }');
    List.Add('  .evento-header {');
    List.Add('    font-family: Arial, Helvetica, sans-serif;');
    List.Add('    background: #ffffff;');
    List.Add('    border-radius: 10px;');
    List.Add('    box-shadow: 0 2px 6px rgba(0,0,0,0.12);');
    List.Add('    padding: 16px 20px;');
    List.Add('    margin-bottom: 20px;');
    List.Add('    text-align: center;');
    List.Add('  }');
    List.Add('  .evento-titulo { font-size: 20px; font-weight: bold; color: #2c3e50; margin-bottom: 4px; }');
    List.Add('  .evento-subtitulo { font-size: 14px; color: #7f8c8d; margin-bottom: 10px; }');
    List.Add('  .evento-datos { font-size: 13px; color: #34495e; line-height: 1.6; }');
    List.Add('  .evento-datos strong { color: #2c3e50; }');
    List.Add('  .cat-indice { text-align: center; margin: -4px 0 20px; line-height: 2.4; font-family: Arial, Helvetica, sans-serif; }');
    List.Add('  .cat-indice a { display: inline-block; padding: 2px 12px; margin: 0 3px; border: 1px solid #95b3d7; border-radius: 14px; background: #ffffff; color: #2c3e50; font-size: 13px; text-decoration: none; }');
    List.Add('  .cat-indice a:hover { background: #dce6f1; }');
    List.Add('</style>');
    List.Add('<div class="table-responsive">');

    // Cabecera: campeonato y fecha que se está corriendo (igual criterio que la Clasif. Gral. Campeonato Web)
    List.Add(ConstruirCabeceraEvento);

    // Índice de categorías: links a cada tarjeta para encontrar la categoría más rápido
    if Conteo.Count > 0 then
    begin
      Fila := '  <div class="cat-indice">';
      for i := 0 to Conteo.Count - 1 do
        Fila := Fila + '<a href="#cat-' + IntToStr(i + 1) + '">' + Conteo.Names[i] + '</a>';
      List.Add(Fila + '</div>');
    end;

    // --- Recorrido principal ---
    PrimeraFila := True;
    CategoriaActual := '';
    PosicionEnCategoria := 0;
    NroCategoria := 0;

    Dataset.First;
    while not Dataset.Eof do
    begin
      if (Trim(Dataset.FieldByName(NombreCampoCat).AsString) <> CategoriaActual) then
      begin
        if not PrimeraFila then
          CerrarTabla;
        CategoriaActual := Trim(Dataset.FieldByName(NombreCampoCat).AsString);
        AbrirTabla(CategoriaActual);
        PrimeraFila := False;
        PosicionEnCategoria := 0;
      end;

      Inc(PosicionEnCategoria);

      Fila := '        <tr>';
      // Columna de posición con medalla si corresponde
      case PosicionEnCategoria of
        1: Fila := Fila + '<td class="top1">' + Medalla(PosicionEnCategoria) + '</td>';
        2: Fila := Fila + '<td class="top2">' + Medalla(PosicionEnCategoria) + '</td>';
        3: Fila := Fila + '<td class="top3">' + Medalla(PosicionEnCategoria) + '</td>';
      else
        Fila := Fila + '<td>' + IntToStr(PosicionEnCategoria) + '</td>';
      end;

      for i := 0 to Dataset.FieldCount - 1 do
        if EsColumnaPublicable(Dataset.Fields[i]) then
          Fila := Fila + '<td>' + Dataset.Fields[i].AsString + '</td>';
      Fila := Fila + '</tr>';
      List.Add(Fila);

      Dataset.Next;
    end;

    if not PrimeraFila then
      CerrarTabla;

    List.Add('</div>');

    try
      SubirAWorker(List.Text);
    except
  on E: Exception do
    ShowMessage('Error: ' + E.Message + sLineBreak +
                'DLL que Indy no pudo cargar: ' + WhichFailedToLoad);
    end;
  finally
    Conteo.Free;
    List.Free;
  end;
end;

procedure TEdicionAgrupacion.DiagnosticoSSL;
var
  Carpeta: string;
begin
  Carpeta := ExtractFilePath(ParamStr(0));
  ShowMessage(
    'Carpeta del EXE: ' + Carpeta + sLineBreak +
    'libssl-3.dll existe: '   + BoolToStr(FileExists(Carpeta + 'libssl-3.dll'), True) + sLineBreak +
    'libcrypto-3.dll existe: ' + BoolToStr(FileExists(Carpeta + 'libcrypto-3.dll'), True)
  );
end;

procedure TEdicionAgrupacion.enableAddAgrupacion;
begin
  isAdding:= True;
  txtNombre.Enabled:= True;
  cmbTipoToma.Enabled:= True;
  cmbTipoAgrupacion.Enabled:= True;

  tomaTiempoPanel.Visible:= False;
end;

procedure TEdicionAgrupacion.btnAcceptClick(Sender: TObject);
begin
  if (isAdding = True) then
    with ZQueryInsert do
      begin
        ParamByName('nombre').AsString:= txtNombre.Text;
        ParamByName('tipo_agrupacion').AsString:= cmbTipoAgrupacion.Text;
        ParamByName('tipo_toma_tiempo').AsString:= cmbTipoToma.Text;
        ExecSQL;
      end;
end;

end.
