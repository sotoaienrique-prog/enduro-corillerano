unit ConsultaDatosPilotoUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, AeroButtons, Vcl.ExtCtrls,
  Vcl.ImgList, cxGraphics, F_EEMessage, Entidades, IdContext,
  IdTCPConnection, IdTCPClient, IdBaseComponent, IdComponent, IdCustomTCPServer,
  IdTCPServer, BussinessDataSubsystemFacade, cxControls, cxLookAndFeels,
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
  dxSkinXmas2008Blue, Vcl.DBCtrls, Vcl.ComCtrls, AdvDateTimePicker, cxMaskEdit,
  cxTextEdit, cxLabel, Data.DB, ZAbstractRODataset, ZAbstractDataset,
  ZAbstractTable, PilotCRUDUnit, PilotEditorUnit, PilotEditorInnerUnit, JvTimer;

type
  TConsultaDatosPiloto = class(TForm)
    cxButtonImageList: TcxImageList;
    buttonPanel: TPanel;
    btnAccept: TAeroButton;
    btnCancel: TAeroButton;
    JvTimer: TJvTimer;
    procedure FormCreate(Sender: TObject);
    procedure JvTimerTimer(Sender: TObject);
  private
    procedure AThreadTerminate(Sender: TObject);
  public
    { Public declarations }
  end;

  type
  TCommThread = class(TThread)
  private
    fKeepRuning: Boolean;
  protected
    procedure Execute; override;
    property KeepRuning: Boolean read fKeepRuning write fKeepRuning;
  end;

var
  AThread: TCommThread;

implementation

{$R *.dfm}


procedure TCommThread.Execute;
var
  Client: TIdTCPClient;
  SplitList: TStringList;
  readLn : String;
  lecturaTagsAntena : TLecturaTagsAntena;
  lecturaTagOID, nroVueltasByCat, tipoCategoriaOID,
    nroVueltasByPiloto, pilotoOID, categoriaOID: Integer;
  tomaTiempoEventoVO: TTomaTiempoEventoVO;
  tomaTiempoVO: TTomaTiempoVO;
  pilotoVO: TPiloto;
  nowTime : TDateTime;

  FN: String;
  pilotReport: String;
  F:TextFile;

  pilotoCRUD : TPilotCRUD;
  pilotoEditor : TPilotEditor;
begin
  try
    Client := TIdTCPClient.Create(nil);
    SplitList := TStringList.Create;
    try
      Client.Host:= '192.168.1.100';
      Client.Port:= 14150;
      SplitList.Delimiter:= ',';
      Client.Connect;

        while (Client.Connected) do
          if (KeepRuning) then
            begin
              readLn:= Client.IOHandler.ReadLn;

              try
                  SplitList.Clear;
                  SplitList.DelimitedText:= readLn;

                  if SplitList.Count > 0 then
                  begin
                    lecturaTagsAntena:= TLecturaTagsAntena.Create;
                    lecturaTagsAntena.Timestampux:= StrToInt64(SplitList[1]);
                    lecturaTagsAntena.TagID:= SplitList[0];

                    pilotoOID:= TBussinessDataSubsystemFacade.getInstance.getPilotoOIDByTagID(lecturaTagsAntena.TagID);
                    pilotoVO:= TBussinessDataSubsystemFacade.getInstance.getPiloto(pilotoOID);

                    pilotReport:= '<font size="3">';
                    pilotReport:= pilotReport + 'Nombre: <b>' + pilotoVO.Nombre + '</b><br>';
                    pilotReport:= pilotReport + 'Apellido: <b>' + pilotoVO.Apellido + '</b><br>';
                    pilotReport:= pilotReport + 'Nro. Doc.: <b>' + pilotoVO.NroDocumento + '</b><br>';
                    pilotReport:= pilotReport + 'Fecha Nac.: <b>' + DateToStr(pilotoVO.FechaNacimiento) + '</b><br>';
                    pilotReport:= pilotReport + 'Dirección: <b>' + pilotoVO.Direccion + '</b><br>';
                    pilotReport:= pilotReport + 'Celular: <b>' + pilotoVO.Telefono + '</b><br>';
                    pilotReport:= pilotReport + 'Email: <b>' + pilotoVO.Mail + '</b><br>';
                    pilotReport:= pilotReport + 'TagID: <b>' + pilotoVO.TagID + '</b><br><br>';
                    pilotReport:= pilotReport + 'Localidad: <b>' + pilotoVO.Localidad + '</b><br>';

                    pilotReport:= pilotReport + 'Nº Corredor: <b>' + IntToStr(pilotoVO.NumMotoCross) + '</b><br>';
                    pilotReport:= pilotReport + 'Categoría: <b>' + pilotoVO.CategoriaMotoCross + '</b><br>';

                    pilotReport:= pilotReport + '</font>';

                    TF_EE_Message.ShowMessage(TComponent(Self),'¡Confirmación de datos del piloto!',
                      pilotReport, TF_EE_Message.QUESTION, False, True, 5);
                    end;
              except
                on E:Exception do
                  begin
                  end;
              end;
            end;
      Client.Disconnect;
    finally
      begin
        Client.Free;
        SplitList.Free;
      end;
    end;
  except
    on E:Exception do
      begin
        TF_EE_Message.ShowMessage(TComponent(Self), 'Error al conectar con la Antena',
          '¡Error! Clase: ' + E.ClassName + '. Mensaje: ' + QuotedStr(E.Message), TF_EE_Message.ERROR, True)
      end;
  end;
end;

procedure TConsultaDatosPiloto.AThreadTerminate(Sender: TObject);
var
  stringResult : String;
begin
//  stringResult:= (Sender as TCommThread).Text;
end;

procedure TConsultaDatosPiloto.FormCreate(Sender: TObject);
begin
   if (not Assigned(AThread)) then
  begin
    AThread:= TCommThread.Create(True);

    AThread.KeepRuning:= True;
    AThread.FreeOnTerminate:= True;
    AThread.OnTerminate:= AThreadTerminate;

    AThread.Start;
  end;
  AThread.KeepRuning:= True;
end;

procedure TConsultaDatosPiloto.JvTimerTimer(Sender: TObject);
begin
//  Update;
end;

end.
