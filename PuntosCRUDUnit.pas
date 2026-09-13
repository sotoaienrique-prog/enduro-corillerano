unit PuntosCRUDUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AbstractCRUD, cxGraphics, cxControls,
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
  cxDataStorage, cxEdit, Data.DB, cxDBData, Vcl.ComCtrls, cxContainer,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, Vcl.ActnList, cxLocalization, Vcl.Menus,
  AdvMenus, Data.Bind.Components, ZAbstractRODataset, ZDataset, Vcl.ImgList,
  dxGDIPlusClasses, HotSpotImage, cxLabel, AdvSmoothLabel, cxListView,
  Vcl.ToolWin, Vcl.ExtCtrls, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  Vcl.StdCtrls, AeroButtons, JvExExtCtrls, JvNetscapeSplitter, Entidades,
  BussinessDataSubsystemFacade, PuntosEditUnit;

type
  TTPuntosCRUD = class(TAbstractCRUDFrame)
    cxGridDBTableViewpuesto: TcxGridDBColumn;
    cxGridDBTableViewpunto: TcxGridDBColumn;
    cxGridDBTableViewpunto_extra: TcxGridDBColumn;
  private
  protected
    procedure requestLoadInitialData(filterVO: TValueObject); Override;
    procedure InitializeBinding; Override;
    procedure doRequestSave(persistentVO: TPersistentObject); Override;
    function requestElement(OID: Integer): TPersistentObject; Override;
    procedure requestDelete(OID: Integer); Override;
  public
    constructor Create(owner: TComponent); Override;
  end;

var
  TPuntosCRUD: TTPuntosCRUD;

implementation

{$R *.dfm}

constructor TTPuntosCRUD.Create(owner: TComponent);
var
  puntosVO : TPuntos;
begin
  inherited Create(owner);

  puntosVO:= TPuntos.Create;

  abstractEdit:= TPuntosEditor.Create(self, puntosVO);
end;

procedure TTPuntosCRUD.requestLoadInitialData(filterVO: TValueObject);
begin
  with queryGrid do
    begin
      Close;
      Open;
    end;
end;

procedure TTPuntosCRUD.InitializeBinding;
begin
end;

function TTPuntosCRUD.requestElement(OID: Integer): TPersistentObject;
begin
  Result:= TBussinessDataSubsystemFacade.getInstance.getPuntos(OID);
end;

procedure TTPuntosCRUD.requestDelete(OID: Integer);
begin
  TBussinessDataSubsystemFacade.getInstance.deletePuntos(OID);
end;

procedure TTPuntosCRUD.doRequestSave(persistentVO: TPersistentObject);
begin
   TBussinessDataSubsystemFacade.getInstance.savePuntos(TPuntos(persistentVO));
end;

end.
