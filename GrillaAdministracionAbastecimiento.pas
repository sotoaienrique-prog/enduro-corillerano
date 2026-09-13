unit GrillaAdministracionAbastecimiento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB,
  ZAbstractRODataset, ZDataset, cxGraphics, cxControls, cxLookAndFeels,
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
  dxSkinXmas2008Blue, Vcl.DBCtrls, cxLabel, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, DataModule, Vcl.StdCtrls, AeroButtons, Vcl.ImgList,
  ZAbstractDataset;

type
  TTAdminGillaAbastecimiento = class(TForm)
    ZEvento: TZReadOnlyQuery;
    DSEvento: TDataSource;
    PanelTop: TPanel;
    lblFilterEvento: TcxLabel;
    cmbFilterEvento: TDBLookupComboBox;
    mainPanel: TPanel;
    cxGridPosiciones: TcxGrid;
    cxGridPosicionesDBTableView: TcxGridDBTableView;
    cxGridPosicionesLevel: TcxGridLevel;
    ZROQPosiciones: TZReadOnlyQuery;
    DSPosiciones: TDataSource;
    cxGridPosicionesDBTableViewnumero: TcxGridDBColumn;
    cxGridPosicionesDBTableViewnombre_apellido: TcxGridDBColumn;
    cxGridPosicionesDBTableViewcategoria: TcxGridDBColumn;
    cxGridPosicionesDBTableViewtiempo_pasada: TcxGridDBColumn;
    cxGridPosicionesDBTableViewnro_vuelta: TcxGridDBColumn;
    panelName: TPanel;
    ZROQPilotosParadaEvento: TZReadOnlyQuery;
    cxImageList: TcxImageList;
    btnEliminarEsperasEvento: TAeroButton;
    ZDeleteParadaPilotoEvento: TZQuery;
    procedure cmbFilterEventoCloseUp(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnEliminarEsperasEventoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TTAdminGillaAbastecimiento.btnEliminarEsperasEventoClick(
  Sender: TObject);
begin
  if (ZROQPosiciones.Active and not ZROQPosiciones.IsEmpty) then
    begin
      with ZDeleteParadaPilotoEvento do
        begin
          Close;
          ParamByName('oid').AsInteger:= ZROQPosiciones.FieldByName('oid').AsInteger;
          ExecSQL;
        end;

      ZROQPosiciones.DisableControls;
      try
        ZROQPosiciones.Close;
        ZROQPosiciones.Open;
      finally
        ZROQPosiciones.EnableControls;
      end;
    end;
end;

procedure TTAdminGillaAbastecimiento.cmbFilterEventoCloseUp(Sender: TObject);
begin
  with ZROQPosiciones do
    begin
      Close;
      ParamByName('ttae_oid').AsInteger:= cmbFilterEvento.KeyValue;
      Open;
    end;
end;

procedure TTAdminGillaAbastecimiento.FormCreate(Sender: TObject);
begin
  ZEvento.Active:= True;
end;

end.
