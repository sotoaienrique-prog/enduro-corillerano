unit CategoriaCrudUnit;

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
  AeroButtons, Vcl.ExtCtrls, BindingHelperUnit, BussinessDataSubsystemFacade,
  Entidades, cxTextEdit, CategoriaEdit, Vcl.ActnList, cxLocalization,
  Vcl.ToolWin, JvExExtCtrls, JvNetscapeSplitter, Vcl.DBCtrls, ZAbstractDataset,
  ZAbstractTable;

type
  TCategoriaCRUD = class(TAbstractCRUDFrame)
    lblNombre: TcxLabel;
    txtNombre: TcxTextEdit;
    cxGridDBTableViewnombre: TcxGridDBColumn;
    cxGridDBTableViewinicio: TcxGridDBColumn;
    cxGridDBTableViewfin: TcxGridDBColumn;
    cxGridDBTableViewColumn1: TcxGridDBColumn;
    lblTipoCategoria: TcxLabel;
    cmbTipoCategoria: TDBLookupComboBox;
    ZTipoCategoria: TZTable;
    DSTipoCategoria: TDataSource;
    cxGridDBTableViewColumn2: TcxGridDBColumn;
    cxGridDBTableViewColumn3: TcxGridDBColumn;
    cxGridDBTableViewColumn4: TcxGridDBColumn;
    cxGridDBTableViewColumn5: TcxGridDBColumn;
    cxGridDBTableViewColumn6: TcxGridDBColumn;
    cxGridDBTableViewColumn7: TcxGridDBColumn;
    procedure txtNombreKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtNombreFocusChanged(Sender: TObject);
    procedure txtNombreKeyPress(Sender: TObject; var Key: Char);
    procedure cmbTipoCategoriaExit(Sender: TObject);
    procedure cmbTipoCategoriaKeyPress(Sender: TObject; var Key: Char);
    procedure cmbTipoCategoriaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
  protected
    procedure InitializeBinding; Override;
    procedure requestLoadInitialData(filterVO: TValueObject); Override;
    procedure doRequestSave(persistentVO: TPersistentObject); Override;
    function requestElement(OID: Integer): TPersistentObject; Override;
    procedure requestDelete(OID: Integer); Override;
    procedure RefreshCRUDData; Override;
  public
    constructor Create(owner: TComponent); Override;
  end;

implementation

{$R *.dfm}

procedure TCategoriaCRUD.InitializeBinding;
var
  expression: TBindExpression;
begin
  BindingHelper.setMessageKey(TComponent(txtNombre), 'Text', TComponent(BindScope), 'Nombre', BindingsList);
  BindingHelper.setMessageKey(TComponent(cmbTipoCategoria), 'KeyValue', TComponent(BindScope), 'TipoCategoriaOID', BindingsList);

  // Create a Filter object.
  filterVO := TCategoriaFilter.Create;
  BindScope.DataObject := filterVO;
end;

procedure TCategoriaCRUD.cmbTipoCategoriaExit(Sender: TObject);
begin
  inherited;
  BindingsList.Notify(Sender, 'KeyValue');
end;

procedure TCategoriaCRUD.cmbTipoCategoriaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #8 then
    TDBLookupComboBox(Sender).KeyValue:= 0;
end;

procedure TCategoriaCRUD.cmbTipoCategoriaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  BindingsList.Notify(Sender, 'KeyValue');
end;

constructor TCategoriaCRUD.Create(owner: TComponent);
var
  categoriaVO : TCategoria;
begin
  inherited Create(owner);

  categoriaVO:= TCategoria.Create;

  abstractEdit:= TCategoriaEditor.Create(self, categoriaVO);

  ZTipoCategoria.Active:= True;
end;

procedure TCategoriaCRUD.requestLoadInitialData(filterVO: TValueObject);
var
  categoriaFilterVO: TCategoriaFilter;
begin
  categoriaFilterVO:= TCategoriaFilter(filterVO);

  with queryGrid do
    begin
      Close;
      ParamByName('nombre').AsString:= categoriaFilterVO.Nombre;
      ParamByName('tipo_categoria_oid').AsInteger:= categoriaFilterVO.TipoCategoriaOID;
      Open;
    end;
end;

procedure TCategoriaCRUD.txtNombreFocusChanged(Sender: TObject);
begin
  inherited;
  BindingsList.Notify(Sender, 'Text');
end;

procedure TCategoriaCRUD.txtNombreKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  BindingsList.Notify(Sender, 'Text');
end;

procedure TCategoriaCRUD.txtNombreKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  BindingsList.Notify(Sender, 'Text');
end;

function TCategoriaCRUD.requestElement(OID: Integer): TPersistentObject;
begin
  Result:= TBussinessDataSubsystemFacade.getInstance.getCategoria(OID);
end;

procedure TCategoriaCRUD.requestDelete(OID: Integer);
begin
  TBussinessDataSubsystemFacade.getInstance.deleteCategoria(OID);
end;

procedure TCategoriaCRUD.doRequestSave(persistentVO: TPersistentObject);
begin
   TBussinessDataSubsystemFacade.getInstance.saveCategoria(TCategoria(persistentVO));
end;

procedure TCategoriaCRUD.RefreshCRUDData;
begin
  inherited;

  ZTipoCategoria.Close;
  ZTipoCategoria.Open;
end;

end.
