unit UserCRUDUnit;

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
  cxData, cxDataStorage, cxEdit, Data.DB, cxDBData, cxContainer,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, Vcl.Menus, AdvMenus,
  Data.Bind.Components, ZAbstractRODataset, ZDataset, Vcl.ImgList,
  dxGDIPlusClasses, HotSpotImage, cxLabel, AdvSmoothLabel, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxSplitter, Vcl.StdCtrls, AeroButtons, Vcl.ExtCtrls,
  Entidades, UserEditorUnit, cxTextEdit, BindingHelperUnit,
  BussinessDataSubsystemFacade, Vcl.ComCtrls, cxListView, JvExExtCtrls,
  JvNetscapeSplitter;

type
  TUserCRUD = class(TAbstractCRUDFrame)
    lblUsuario: TcxLabel;
    txtUsuario: TcxTextEdit;
    cxGridDBTableViewnombre: TcxGridDBColumn;
    cxGridDBTableViewapellido: TcxGridDBColumn;
    cxGridDBTableViewnro_docu: TcxGridDBColumn;
    cxGridDBTableViewusername: TcxGridDBColumn;
    txtApellido: TcxTextEdit;
    lblApellido: TcxLabel;
    txtNombre: TcxTextEdit;
    lblNombre: TcxLabel;
    procedure textBindKeyPress(Sender: TObject; var Key: Char);
    procedure filterPanelResize(Sender: TObject);
    procedure txtNombreFocusChanged(Sender: TObject);
    procedure txtNombreKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  protected
    procedure InitializeBinding; Override;
    procedure doRequestSave(persistentVO: TPersistentObject); Override;
    procedure requestLoadInitialData(filterVO: TValueObject); Override;
    function requestElement(OID: Integer): TPersistentObject; Override;
    procedure requestDelete(OID: Integer); Override;
  public
    { Public declarations }
    constructor Create(owner: TComponent); Override;
  end;

var
  UserCRUD: TUserCRUD;

implementation

{$R *.dfm}

constructor TUserCRUD.Create(owner: TComponent);
var
  usuarioVO : TUsuario;
begin
  inherited Create(owner);

  usuarioVO:= TUsuario.Create;
  usuarioVO.CuentaUsuario:= TCuentaUsuario.Create;

  abstractEdit:= TUserEditor.Create(self, usuarioVO);
end;

procedure TUserCRUD.requestLoadInitialData(filterVO: TValueObject);
var
  userFilterVO: TUsuarioFilter;
begin
  userFilterVO:= TUsuarioFilter(filterVO);

  with queryGrid do
    begin
      Close;
      ParamByName('nombre').AsString:= userFilterVO.Nombre;
      ParamByName('apellido').AsString:= userFilterVO.Apellido;
      ParamByName('cuenta').AsString:= userFilterVO.Cuenta;
      Open;
    end;
end;

procedure TUserCRUD.textBindKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = Chr(13) then
    requestLoadInitialDataComplete(filterVO);
end;

procedure TUserCRUD.txtNombreFocusChanged(Sender: TObject);
begin
  inherited;
  BindingsList.Notify(Sender, 'Text');
end;

procedure TUserCRUD.txtNombreKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  BindingsList.Notify(Sender, 'Text');
end;

procedure TUserCRUD.InitializeBinding;
var
  expression: TBindExpression;
begin
  BindingHelper.setMessageKey(TComponent(txtNombre), 'Text', TComponent(BindScope), 'Nombre', BindingsList);
  BindingHelper.setMessageKey(TComponent(txtApellido), 'Text', TComponent(BindScope), 'Apellido', BindingsList);
  BindingHelper.setMessageKey(TComponent(txtUsuario), 'Text', TComponent(BindScope), 'Cuenta', BindingsList);

  // Create a Filter object.
  filterVO := TUsuarioFilter.Create;
  BindScope.DataObject := filterVO;
end;

function TUserCRUD.requestElement(OID: Integer): TPersistentObject;
begin
  Result:= TBussinessDataSubsystemFacade.getInstance.getUsuario(OID);
end;

procedure TUserCRUD.requestDelete(OID: Integer);
begin
  TBussinessDataSubsystemFacade.getInstance.deleteUsuario(OID);
end;

procedure TUserCRUD.doRequestSave(persistentVO: TPersistentObject);
begin
   TBussinessDataSubsystemFacade.getInstance.saveUsuario(TUsuario(persistentVO));
end;

procedure TUserCRUD.filterPanelResize(Sender: TObject);
begin
  inherited;
  txtNombre.Width:= filterGB.Width - 67;
end;

end.
