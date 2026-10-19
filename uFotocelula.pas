unit uFotocelula;

{
  Lector de la fotocélula CRONOPIC FB-3 por el puerto COM de la interfaz USB (chip CP210x).

  Protocolo (fuente del proveedor, main.c): 9600 baudios, 8N1. Cada corte de la barrera
  manda 2 caracteres ASCII: 'r' + el número de canal ('1'..'9', el que figura debajo del
  receptor). Sin salto de línea.

  Se reciben todos los cortes (el aparato tiene un tiempo muerto propio de 0,05 s). El
  descarte de cortes repetidos de una misma moto se hace después, al emparejar con la antena.

  Compatible con Windows XP: no usa CancelIoEx ni GetTickCount64 (son de Vista en adelante).
  ReadFile vuelve cada 100 ms aunque no lleguen datos, así el hilo puede ver Terminated.
}

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes, System.SyncObjs,
  System.Generics.Collections;

type
  TDisparo = record
    Hora: TDateTime;  // hora de llegada a la PC, resolución ~1 ms
    Canal: Char;      // '1'..'9'
  end;

  TFotocelulaThread = class(TThread)
  private
    FPuerto: string;
    FCanal: Char;                 // #0: acepta cualquier canal
    FHandle: THandle;
    FLock: TCriticalSection;
    FDisparos: TList<TDisparo>;
    // Reloj preciso: Now avanza de a ~15 ms, se ancla a QueryPerformanceCounter
    FFrecuencia, FContadorBase: Int64;
    FHoraBase: TDateTime;
    FUltimoAnclaje: Cardinal;
    procedure AbrirPuerto;
    procedure CerrarPuerto;
    procedure AnclarReloj;
    function HoraPrecisa: TDateTime;
    procedure AgregarDisparo(const Hora: TDateTime; Canal: Char);
  protected
    procedure Execute; override;
  public
    constructor Create(const Puerto: string; Canal: Char);
    destructor Destroy; override;
    // Devuelve los disparos recibidos desde la última llamada y vacía la lista
    function TomarDisparos: TArray<TDisparo>;
  end;

// Arranca el lector si config.ini tiene [Fotocelula] Habilitada=1. Si ya estaba corriendo no hace nada.
procedure IniciarFotocelula;
procedure DetenerFotocelula;
// nil si la fotocélula no está habilitada o está detenida
function Fotocelula: TFotocelulaThread;

implementation

uses
  LogUnit, ConfigureFilesUtilities;

const
  // Si nadie toma los disparos (prueba de campo), se descartan los más viejos
  MAX_DISPAROS = 1000;
  // Cada cuánto se vuelve a anclar el reloj (QueryPerformanceCounter deriva unos ms por minuto respecto de Windows)
  ANCLAJE_MS = 30000;

var
  GFotocelula: TFotocelulaThread;

{ TFotocelulaThread }

constructor TFotocelulaThread.Create(const Puerto: string; Canal: Char);
begin
  inherited Create(True);
  FPuerto := Puerto;
  FCanal := Canal;
  FHandle := INVALID_HANDLE_VALUE;
  FLock := TCriticalSection.Create;
  FDisparos := TList<TDisparo>.Create;
end;

destructor TFotocelulaThread.Destroy;
begin
  // inherited hace Terminate + WaitFor: ReadFile vuelve en <= 100 ms
  inherited;
  CerrarPuerto;
  FDisparos.Free;
  FLock.Free;
end;

procedure TFotocelulaThread.AbrirPuerto;
var
  DCB: TDCB;
  Timeouts: TCommTimeouts;
begin
  FHandle := CreateFile(PChar('\\.\' + FPuerto), GENERIC_READ, 0, nil, OPEN_EXISTING, 0, 0);
  if FHandle = INVALID_HANDLE_VALUE then
    RaiseLastOSError;

  FillChar(DCB, SizeOf(DCB), 0);
  DCB.DCBlength := SizeOf(DCB);
  Win32Check(GetCommState(FHandle, DCB));
  DCB.BaudRate := CBR_9600;
  DCB.ByteSize := 8;
  DCB.Parity := NOPARITY;
  DCB.StopBits := ONESTOPBIT;
  DCB.Flags := (DCB.Flags or $1) and not $2; // fBinary = 1, fParity = 0 (igual que el programa del proveedor)
  Win32Check(SetCommState(FHandle, DCB));

  // Se piden 2 bytes por lectura: ReadFile vuelve apenas llega un disparo completo,
  // o a los 100 ms sin datos.
  FillChar(Timeouts, SizeOf(Timeouts), 0);
  Timeouts.ReadTotalTimeoutConstant := 100;
  Win32Check(SetCommTimeouts(FHandle, Timeouts));

  PurgeComm(FHandle, PURGE_RXCLEAR);
end;

procedure TFotocelulaThread.CerrarPuerto;
begin
  if FHandle <> INVALID_HANDLE_VALUE then
  begin
    CloseHandle(FHandle);
    FHandle := INVALID_HANDLE_VALUE;
  end;
end;

procedure TFotocelulaThread.AnclarReloj;
var
  Inicial: TDateTime;
begin
  QueryPerformanceFrequency(FFrecuencia);
  // Se espera el próximo cambio de Now (hasta ~16 ms) para anclar justo en el borde del tic
  Inicial := Now;
  repeat
    FHoraBase := Now;
  until FHoraBase <> Inicial;
  QueryPerformanceCounter(FContadorBase);
  FUltimoAnclaje := GetTickCount;
end;

function TFotocelulaThread.HoraPrecisa: TDateTime;
var
  Contador: Int64;
begin
  QueryPerformanceCounter(Contador);
  Result := FHoraBase + ((Contador - FContadorBase) / FFrecuencia) / SecsPerDay;
end;

procedure TFotocelulaThread.AgregarDisparo(const Hora: TDateTime; Canal: Char);
var
  D: TDisparo;
begin
  D.Hora := Hora;
  D.Canal := Canal;
  FLock.Enter;
  try
    if FDisparos.Count >= MAX_DISPAROS then
      FDisparos.Delete(0);
    FDisparos.Add(D);
  finally
    FLock.Leave;
  end;
  TLog.Info('Fotocelula', 'Disparo canal ' + Canal + ' ' + FormatDateTime('hh:nn:ss.zzz', Hora));
end;

function TFotocelulaThread.TomarDisparos: TArray<TDisparo>;
begin
  FLock.Enter;
  try
    Result := FDisparos.ToArray;
    FDisparos.Clear;
  finally
    FLock.Leave;
  end;
end;

procedure TFotocelulaThread.Execute;
var
  Buffer: array[0..1] of AnsiChar;
  Leidos: DWORD;
  i: Integer;
  EsperaCanal: Boolean;
  Hora, HoraR: TDateTime;
begin
  EsperaCanal := False;
  HoraR := 0;

  while not Terminated do
  begin
    // (Re)apertura: si la interfaz se desenchufa hay que cerrar el puerto y volver a abrirlo
    if FHandle = INVALID_HANDLE_VALUE then
    begin
      try
        AbrirPuerto;
        AnclarReloj;
        EsperaCanal := False;
        TLog.Info('Fotocelula', 'Escuchando ' + FPuerto + ' a 9600 baudios');
        TLog.Recuperado('FOTOCELULA', 'Fotocelula');
      except
        on E: Exception do
        begin
          CerrarPuerto;
          TLog.ErrorRepetido('FOTOCELULA', 'Fotocelula', 'No se pudo abrir ' + FPuerto + ': ' + E.Message);
          // Reintenta a los 3 s, sin demorar el cierre si se detiene mientras tanto
          for i := 1 to 30 do
            if not Terminated then
              Sleep(100);
          Continue;
        end;
      end;
    end;

    if not ReadFile(FHandle, Buffer, SizeOf(Buffer), Leidos, nil) then
    begin
      TLog.ErrorRepetido('FOTOCELULA', 'Fotocelula',
        'Fallo de lectura en ' + FPuerto + ': ' + SysErrorMessage(GetLastError));
      CerrarPuerto;
      Continue;
    end;

    if Leidos = 0 then
    begin
      // Sin datos: buen momento para volver a anclar el reloj
      if GetTickCount - FUltimoAnclaje > ANCLAJE_MS then
        AnclarReloj;
      Continue;
    end;

    Hora := HoraPrecisa;
    for i := 0 to Integer(Leidos) - 1 do
      if EsperaCanal and (Buffer[i] in ['1'..'9']) then
      begin
        EsperaCanal := False;
        if (FCanal = #0) or (Char(Buffer[i]) = FCanal) then
          AgregarDisparo(HoraR, Char(Buffer[i]));
      end
      else
      begin
        // La hora del disparo es la de la 'r' (si el número llega en la lectura siguiente)
        EsperaCanal := Buffer[i] = 'r';
        if EsperaCanal then
          HoraR := Hora;
      end;
  end;

  CerrarPuerto;
end;

{ Funciones globales }

procedure IniciarFotocelula;
var
  Canal: string;
  CanalChar: Char;
begin
  if Assigned(GFotocelula) then
    Exit;
  if ReadIntegerFromIniFile('Fotocelula', 'Habilitada', 0) <> 1 then
    Exit;

  Canal := Trim(ReadStringFromIniFile('Fotocelula', 'Canal', ''));
  if (Canal = '') or (Canal = '0') then
    CanalChar := #0
  else
    CanalChar := Canal[1];

  GFotocelula := TFotocelulaThread.Create(
    Trim(ReadStringFromIniFile('Fotocelula', 'Puerto', 'COM10')), CanalChar);
  GFotocelula.Start;
end;

procedure DetenerFotocelula;
begin
  if Assigned(GFotocelula) then
  begin
    FreeAndNil(GFotocelula);
    TLog.Info('Fotocelula', 'Lectura detenida');
  end;
end;

function Fotocelula: TFotocelulaThread;
begin
  Result := GFotocelula;
end;

initialization

finalization
  DetenerFotocelula;

end.