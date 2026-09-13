unit GrillaTiempoEspera;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, Data.DB, cxDBData, Vcl.StdCtrls, AeroButtons,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, JvTimer, DataModule,
  ZAbstractRODataset, ZDataset, cxContainer, Vcl.DBCtrls, cxLabel,
  cxColorComboBox, cxProgressBar, cxTextEdit, cxCurrencyEdit, F_EEMessage,
  JvExExtCtrls, JvNetscapeSplitter, Vcl.ImgList, scExcelExport;

type
  TFGrillaTiempoEspera = class(TForm)
    topPanel: TPanel;
    gridPanel: TPanel;
    cxGridTableView: TcxGridDBTableView;
    cxGridLevel: TcxGridLevel;
    cxGrid: TcxGrid;
    btnStart: TAeroButton;
    btnStop: TAeroButton;
    JvTimer: TJvTimer;
    ZROQTiempoEspera: TZReadOnlyQuery;
    DSTiempoEspera: TDataSource;
    cxGridTableViewnro_moto: TcxGridDBColumn;
    cxGridTableViewnombre_piloto: TcxGridDBColumn;
    cxGridTableViewsegundos_espera: TcxGridDBColumn;
    ZEvento: TZReadOnlyQuery;
    DSEvento: TDataSource;
    lblFilterEvento: TcxLabel;
    cmbFilterEvento: TDBLookupComboBox;
    cxSRContent: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxGridTableViewprogreso: TcxGridDBColumn;
    lblTEspera: TcxLabel;
    txtTEspera: TcxCurrencyEdit;
    JvNetscapeSplitter: TJvNetscapeSplitter;
    lblSegundos: TcxLabel;
    btnEliminarEsperasEvento: TAeroButton;
    cxImageList: TcxImageList;
    cxGridTableViewSalida: TcxGridDBColumn;
    lblPermanencia: TcxLabel;
    txtPermanencia: TcxCurrencyEdit;
    cxLabel1: TcxLabel;
    ZROQPilotosParadaEvento: TZReadOnlyQuery;
    scExcelExport: TscExcelExport;
    btnInscriptos: TAeroButton;
    procedure btnStopClick(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure JvTimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnEliminarEsperasEventoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnInscriptosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGrillaTiempoEspera: TFGrillaTiempoEspera;

implementation

{$R *.dfm}

procedure TFGrillaTiempoEspera.btnEliminarEsperasEventoClick(Sender: TObject);
begin
  with ConnectionModule.ZDeleteParadaPilotoEvento do
    begin
      Close;
      ParamByName('evento_oid').AsInteger:= cmbFilterEvento.KeyValue;
      ExecSQL;
    end;
end;

procedure TFGrillaTiempoEspera.btnInscriptosClick(Sender: TObject);
begin
  if (cmbFilterEvento.KeyValue > 0) then
    begin
      with ZROQPilotosParadaEvento do
      begin
        Close;
        ParamByName('evento_oid').AsInteger:= cmbFilterEvento.KeyValue;
        Open;
      end;

      scExcelExport.Dataset:= ZROQPilotosParadaEvento;
      scExcelExport.WorksheetName := 'Paradas por Pilotos';
      scExcelExport.ExportDataset;

      scExcelExport.Disconnect;
    end
end;

procedure TFGrillaTiempoEspera.btnStartClick(Sender: TObject);
begin
  if (cmbFilterEvento.KeyValue > 0) then
    begin
      JvTimer.Enabled:= True;
      btnStop.Enabled:= True;
      btnStart.Enabled:= False;

      cmbFilterEvento.Enabled:= False;
      txtTEspera.Enabled:= False;

      JvNetscapeSplitter.Maximized:= True;
    end
  else
    TF_EE_Message.ShowMessage(TComponent(Self),'¡Seleccione el Evento!',
        'Debe seleccionar el Evento', TF_EE_Message.WARNING, False)

end;

procedure TFGrillaTiempoEspera.btnStopClick(Sender: TObject);
begin
  JvTimer.Enabled:= False;
  btnStart.Enabled:= True;
  btnStop.Enabled:= False;

  cmbFilterEvento.Enabled:= True;
  txtTEspera.Enabled:= True;
end;

procedure TFGrillaTiempoEspera.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  JvTimer.Enabled:= False;
end;

procedure TFGrillaTiempoEspera.FormCreate(Sender: TObject);
begin
  ZEvento.Active:= True;
  cmbFilterEvento.KeyValue:= 1;
end;

procedure TFGrillaTiempoEspera.JvTimerTimer(Sender: TObject);
begin
  with ZROQTiempoEspera do
    begin
      Close;
      ParamByName('evento_oid').AsInteger:= cmbFilterEvento.KeyValue;
      ParamByName('tiempo_espera').AsString:= txtTEspera.Text;
      ParamByName('tiempo_permanencia').AsString:= txtPermanencia.Text;
      Open;
    end;
end;

end.
