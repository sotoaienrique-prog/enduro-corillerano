unit HandicupCRUDUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AbstractCRUD, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, Data.DB, cxDBData, Vcl.ComCtrls, cxContainer,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, Vcl.Menus, AdvMenus,
  Data.Bind.Components, ZAbstractRODataset, ZDataset, Vcl.ImgList,
  dxGDIPlusClasses, HotSpotImage, cxLabel, AdvSmoothLabel, cxListView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxSplitter, Vcl.StdCtrls,
  AeroButtons, Vcl.ExtCtrls, BindingHelperUnit, Entidades,
  BussinessDataSubsystemFacade, HandicupEditUnit, JvExExtCtrls,
  JvNetscapeSplitter, Vcl.ActnList, cxLocalization, Vcl.ToolWin;

type
  THandicupCRUD = class(TAbstractCRUDFrame)
    cxGridDBTableViewtipo_handicup: TcxGridDBColumn;
    cxGridDBTableViewedad_base: TcxGridDBColumn;
    cxGridDBTableViewsegundos_anio: TcxGridDBColumn;
    cxGridDBTableViewnombre_categoria: TcxGridDBColumn;
    cxGridDBTableViewnombre_moto: TcxGridDBColumn;
  private
  protected
    procedure InitializeBinding; Override;
    procedure requestLoadInitialData(filterVO: TValueObject); Override;
    procedure doRequestSave(persistentVO: TPersistentObject); Override;
    function requestElement(OID: Integer): TPersistentObject; Override;
    procedure requestDelete(OID: Integer); Override;
  public
    constructor Create(owner: TComponent); Override;
  end;


implementation

{$R *.dfm}

constructor THandicupCRUD.Create(owner: TComponent);
var
  handicupVO : THandicup;
begin
  inherited Create(owner);

  handicupVO:= THandicup.Create;

  abstractEdit:= THandicupEditor.Create(self, handicupVO);
end;

procedure THandicupCRUD.InitializeBinding;
var
  expression: TBindExpression;
begin
  //BindingHelper.setMessageKey(TComponent(txtNombre), 'Text', TComponent(BindScope), 'Nombre', BindingsList);

  // Create a Filter object.
  //filterVO := TCategoriaFilter.Create;
  //BindScope.DataObject := filterVO;
end;

procedure THandicupCRUD.requestLoadInitialData(filterVO: TValueObject);
var
  categoriaFilterVO: TCategoriaFilter;
begin
//  categoriaFilterVO:= TCategoriaFilter(filterVO);

  with queryGrid do
    begin
      Close;
      Open;
    end;
end;
function THandicupCRUD.requestElement(OID: Integer): TPersistentObject;
begin
  Result:= TBussinessDataSubsystemFacade.getInstance.getHandicup(OID);
end;

procedure THandicupCRUD.requestDelete(OID: Integer);
begin
  TBussinessDataSubsystemFacade.getInstance.deleteHandicup(OID);
end;

procedure THandicupCRUD.doRequestSave(persistentVO: TPersistentObject);
begin
   TBussinessDataSubsystemFacade.getInstance.saveHandicup(THandicup(persistentVO));
end;

end.
