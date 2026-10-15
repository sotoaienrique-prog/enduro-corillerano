unit LogUnit;

interface

uses
  System.SysUtils, System.Classes, System.SyncObjs;

type
  TLog = class
  private
    class var FCritico: TCriticalSection;
    class var FCarpeta: string;
    class var FHabilitado: Boolean;
    class var FSQLHabilitado: Boolean;
    class procedure Escribir(const Prefijo, Linea: string);
    class procedure Registrar(const Nivel, Modulo, Mensaje: string);
    class procedure BorrarViejos(Dias: Integer);
    class function UsuarioActual: string;
    class var FFallando: TStringList;
  public
    class procedure Inicializar;
    class procedure Finalizar;
    class procedure Info(const Modulo, Mensaje: string);
    class procedure Aviso(const Modulo, Mensaje: string);
    class procedure Error(const Modulo, Mensaje: string); overload;
    class procedure Error(const Modulo: string; E: Exception); overload;
    class procedure SQL(const Linea: string);
    // Para Application.OnException
    class procedure ManejarExcepcion(Sender: TObject; E: Exception);
    class property SQLHabilitado: Boolean read FSQLHabilitado;
    // Para timers: loguea ERROR sólo la primera vez que falla 'Clave'
    class procedure ErrorRepetido(const Clave, Modulo, Mensaje: string);
    // Y un INFO cuando vuelve a funcionar
    class procedure Recuperado(const Clave, Modulo: string);
  end;

implementation

uses
  System.IOUtils, Vcl.Forms, ConfigureFilesUtilities, LoggedUserSingleton;

class procedure TLog.Inicializar;
var
  Dias: Integer;
begin
  if FCritico = nil then
    FCritico := TCriticalSection.Create;

  if FFallando = nil then
    FFallando := TStringList.Create;

  FHabilitado := ReadIntegerFromIniFile('Log', 'Habilitado', 1) = 1;
  FSQLHabilitado := ReadIntegerFromIniFile('Log', 'SQL', 1) = 1;
  Dias := ReadIntegerFromIniFile('Log', 'DiasRetencion', 30);
  FCarpeta := IncludeTrailingPathDelimiter(
    ReadStringFromIniFile('Log', 'Carpeta', ExtractFilePath(ParamStr(0)) + 'logs'));

  try
    ForceDirectories(FCarpeta);
    if Dias > 0 then
      BorrarViejos(Dias);
  except
    // El log nunca debe impedir que arranque la aplicación
  end;
end;

class procedure TLog.Finalizar;
begin
  FreeAndNil(FCritico);
  FreeAndNil(FFallando);
  FreeAndNil(FCritico);
end;

class procedure TLog.BorrarViejos(Dias: Integer);
var
  Archivo: string;
  Limite: TDateTime;
begin
  Limite := Date - Dias;
  for Archivo in TDirectory.GetFiles(FCarpeta, '*.log') do
    if TFile.GetLastWriteTime(Archivo) < Limite then
      try
        TFile.Delete(Archivo);
      except
        // abierto por otro programa: se borra en el próximo arranque
      end;
end;

class function TLog.UsuarioActual: string;
var
  Usuario: TLoggedUser;
begin
  Result := '-';
  try
    Usuario := TLoggedUserSingleton.getInstance.LoggedUser;
    if Usuario <> nil then
      Result := Trim(Usuario.Nombre + ' ' + Usuario.Apellido);
  except
    Result := '?';
  end;
end;

class procedure TLog.Escribir(const Prefijo, Linea: string);
var
  Archivo: string;
  Stream: TFileStream;
  Bytes: TBytes;
begin
  if FCritico = nil then
    Exit;

  // Un archivo por día: el nombre se calcula en cada escritura (corta solo a la medianoche)
  Archivo := FCarpeta + Prefijo + '_' + FormatDateTime('yyyy-mm-dd', Now) + '.log';
  Bytes := TEncoding.UTF8.GetBytes(Linea + sLineBreak);

  FCritico.Enter;
  try
    try
      if FileExists(Archivo) then
      begin
        // fmShareDenyNone: se puede abrir con el Bloc de notas mientras la app escribe
        Stream := TFileStream.Create(Archivo, fmOpenWrite or fmShareDenyNone);
        Stream.Seek(0, soEnd);
      end
      else
        Stream := TFileStream.Create(Archivo, fmCreate);
      try
        if Length(Bytes) > 0 then
          Stream.WriteBuffer(Bytes[0], Length(Bytes));
      finally
        Stream.Free;
      end;
    except
      // El log nunca debe romper la aplicación
    end;
  finally
    FCritico.Leave;
  end;
end;

class procedure TLog.Registrar(const Nivel, Modulo, Mensaje: string);
var
  Texto: string;
begin
  if not FHabilitado then
    Exit;
  // Una línea por evento
  Texto := StringReplace(Mensaje, sLineBreak, ' | ', [rfReplaceAll]);
  Texto := StringReplace(Texto, #10, ' | ', [rfReplaceAll]);
  Escribir('enduro', FormatDateTime('yyyy-mm-dd hh:nn:ss.zzz', Now) +
    ' [' + Nivel + '] [' + UsuarioActual + '] [' + Modulo + '] ' + Texto);
end;

class procedure TLog.Info(const Modulo, Mensaje: string);
begin
  Registrar('INFO ', Modulo, Mensaje);
end;

class procedure TLog.Aviso(const Modulo, Mensaje: string);
begin
  Registrar('AVISO', Modulo, Mensaje);
end;

class procedure TLog.Error(const Modulo, Mensaje: string);
begin
  Registrar('ERROR', Modulo, Mensaje);
end;

class procedure TLog.Error(const Modulo: string; E: Exception);
begin
  Registrar('ERROR', Modulo, E.ClassName + ': ' + E.Message);
end;

class procedure TLog.SQL(const Linea: string);
begin
  if FHabilitado and FSQLHabilitado then
    Escribir('sql', Linea);
end;

class procedure TLog.ManejarExcepcion(Sender: TObject; E: Exception);
var
  Origen: string;
begin
  if Sender is TComponent then
    Origen := TComponent(Sender).Name + ' (' + Sender.ClassName + ')'
  else if Sender <> nil then
    Origen := Sender.ClassName
  else
    Origen := 'Aplicacion';
  Error('Excepción no controlada - ' + Origen, E);
  Application.ShowException(E);   // mismo comportamiento visible que hoy
end;

class procedure TLog.ErrorRepetido(const Clave, Modulo, Mensaje: string);
var
  Nuevo: Boolean;
begin
  if FCritico = nil then
    Exit;
  FCritico.Enter;
  try
    Nuevo := FFallando.IndexOf(Clave) < 0;
    if Nuevo then
      FFallando.Add(Clave);
  finally
    FCritico.Leave;
  end;
  if Nuevo then
    Error(Modulo, Mensaje + ' (se omiten repeticiones hasta que se recupere)');
end;

class procedure TLog.Recuperado(const Clave, Modulo: string);
var
  Estaba: Boolean;
  I: Integer;
begin
  if FCritico = nil then
    Exit;
  FCritico.Enter;
  try
    I := FFallando.IndexOf(Clave);
    Estaba := I >= 0;
    if Estaba then
      FFallando.Delete(I);
  finally
    FCritico.Leave;
  end;
  if Estaba then
    Info(Modulo, 'Recuperado: ' + Clave);
end;
end.

class procedure TLog.ErrorRepetido(const Clave, Modulo, Mensaje: string);
var
  Nuevo: Boolean;
begin
  if FCritico = nil then
    Exit;
  FCritico.Enter;
  try
    Nuevo := FFallando.IndexOf(Clave) < 0;
    if Nuevo then
      FFallando.Add(Clave);
  finally
    FCritico.Leave;
  end;
  if Nuevo then
    Error(Modulo, Mensaje + ' (se omiten repeticiones hasta que se recupere)');
end;

class procedure TLog.Recuperado(const Clave, Modulo: string);
var
  Estaba: Boolean;
  I: Integer;
begin
  if FCritico = nil then
    Exit;
  FCritico.Enter;
  try
    I := FFallando.IndexOf(Clave);
    Estaba := I >= 0;
    if Estaba then
      FFallando.Delete(I);
  finally
    FCritico.Leave;
  end;
  if Estaba then
    Info(Modulo, 'Recuperado: ' + Clave);
end;

initialization
  TLog.Inicializar;

finalization
  TLog.Finalizar;


