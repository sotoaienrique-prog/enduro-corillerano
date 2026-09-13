unit ContactoCRUDUnit;

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
  Vcl.StdCtrls, AeroButtons, JvExExtCtrls, JvNetscapeSplitter, cxTextEdit,
  Entidades, BussinessDataSubsystemFacade, BindingHelperUnit, ContactoEditorUnit,
  scExcelExport;

type
  TContactCRUD = class(TAbstractCRUDFrame)
    lblNombre: TcxLabel;
    txtNombre: TcxTextEdit;
    lblApellido: TcxLabel;
    txtApellido: TcxTextEdit;
    cxGridDBTableViewnombre: TcxGridDBColumn;
    cxGridDBTableViewapellido: TcxGridDBColumn;
    cxGridDBTableViewdireccion: TcxGridDBColumn;
    cxGridDBTableViewtelefono_fijo: TcxGridDBColumn;
    cxGridDBTableViewtelefono_fijo_1: TcxGridDBColumn;
    cxGridDBTableViewemail: TcxGridDBColumn;
    cxGridDBTableViewnombre_localidad: TcxGridDBColumn;
    cxGridDBTableViewnombre_provincia: TcxGridDBColumn;
    btnExpPilotos: TAeroButton;
    ZExportarContacto: TZReadOnlyQuery;
    scExcelExport: TscExcelExport;
    procedure txtNombreKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExpPilotosClick(Sender: TObject);
  private
    procedure txtNombreKeyPress(Sender: TObject; var Key: Char);
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

uses AbstractEditor;

procedure TContactCRUD.RefreshCRUDData;
begin
  inherited;


end;

procedure TContactCRUD.btnExpPilotosClick(Sender: TObject);
begin
  inherited;
  with ZExportarContacto do
    begin
      Close;
      Open;
    end;

  scExcelExport.Dataset:= ZExportarContacto;
  scExcelExport.WorksheetName := 'Contactos';
  scExcelExport.ExportDataset;

  scExcelExport.Disconnect;
end;

constructor TContactCRUD.Create(owner: TComponent);
var
  concactoVO : TContacto;
begin
  inherited Create(owner);

  concactoVO:= TContacto.Create;

  abstractEdit:= TContactEdit.Create(self, concactoVO);
end;

procedure TContactCRUD.txtNombreKeyPress(Sender: TObject; var Key: Char);
begin
//  if Key = #13 then
//    btnFilterClick(Sender);
end;

procedure TContactCRUD.txtNombreKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  BindingsList.Notify(Sender, 'Text');
end;

procedure TContactCRUD.requestLoadInitialData(filterVO: TValueObject);
var
  pilotoFilterVO: TPilotoFilter;
  nroDocu: String;
  tipoCategoriaOID : Integer;
begin
  pilotoFilterVO:= TPilotoFilter(filterVO);

  queryGrid.DisableControls;
  with queryGrid do
    begin
      Close;
      ParamByName('nombre').AsString:= pilotoFilterVO.Nombre;
      ParamByName('apellido').AsString:= pilotoFilterVO.Apellido;
      Open;
    end;
  queryGrid.EnableControls;
end;

procedure TContactCRUD.InitializeBinding;
var
  expression: TBindExpression;
begin
  BindingHelper.setMessageKey(TComponent(txtNombre), 'Text', TComponent(BindScope), 'Nombre', BindingsList);
  BindingHelper.setMessageKey(TComponent(txtApellido), 'Text', TComponent(BindScope), 'Apellido', BindingsList);

  // Create a Filter object.
  filterVO := TPilotoFilter.Create;
  BindScope.DataObject := filterVO;
end;

function TContactCRUD.requestElement(OID: Integer): TPersistentObject;
begin
  Result:= TBussinessDataSubsystemFacade.getInstance.getContacto(OID);
end;

procedure TContactCRUD.requestDelete(OID: Integer);
begin
  TBussinessDataSubsystemFacade.getInstance.deleteContacto(OID);
end;

procedure TContactCRUD.doRequestSave(persistentVO: TPersistentObject);
begin
   TBussinessDataSubsystemFacade.getInstance.saveContacto(TContacto(persistentVO));
end;

end.
