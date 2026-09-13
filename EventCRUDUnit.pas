unit EventCRUDUnit;

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
  Entidades, EventoEditorUnit, BussinessDataSubsystemFacade, BindingHelperUnit,
  cxTextEdit, Vcl.ComCtrls, cxListView, JvExExtCtrls, JvNetscapeSplitter,
  Vcl.ActnList, cxLocalization, Vcl.ToolWin, System.Generics.Collections;

type
  TEventCRUD = class(TAbstractCRUDFrame)
    cxGridDBTableViewnombre: TcxGridDBColumn;
    cxGridDBTableViewfecha: TcxGridDBColumn;
    cxGridDBTableViewnro_fecha: TcxGridDBColumn;
    cxGridDBTableViewdistancia: TcxGridDBColumn;
    lblNombre: TcxLabel;
    txtNombre: TcxTextEdit;
    cxGridDBTableViewnombre_campeonato: TcxGridDBColumn;
    cxGridDBTableViewnombre_localidad: TcxGridDBColumn;
    cxGridDBTableViewColumn1: TcxGridDBColumn;
    procedure textKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure txtNombreKeyPress(Sender: TObject; var Key: Char);
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

procedure TEventCRUD.textKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  BindingsList.Notify(Sender, 'Text');
end;

procedure TEventCRUD.txtNombreKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  BindingsList.Notify(Sender, 'Text');
end;

constructor TEventCRUD.Create(owner: TComponent);
var
  eventoVO : TEvento;
begin
  inherited Create(owner);

  eventoVO:= TEvento.Create;
  eventoVO.Fecha:= Date;
  eventoVO.VueltasCategoria:= TList<TEventoCategoriaNumeracion>.Create;
  eventoVO.PuntoDeControl:= TList<TEventoPuntoControl>.Create;

  abstractEdit:= TEventEditor.Create(self, eventoVO);
end;

procedure TEventCRUD.requestLoadInitialData(filterVO: TValueObject);
var
  eventoFilterVO: TEventoFilter;
begin
  eventoFilterVO:= TEventoFilter(filterVO);

  with queryGrid do
    begin
      Close;
      ParamByName('nombre').AsString:= eventoFilterVO.Nombre;
      Open;
    end;
end;

procedure TEventCRUD.InitializeBinding;
var
  expression: TBindExpression;
begin
  BindingHelper.setMessageKey(TComponent(txtNombre), 'Text', TComponent(BindScope), 'Nombre', BindingsList);

  // Create a Filter object.
  filterVO := TEventoFilter.Create;
  BindScope.DataObject := filterVO;
end;

function TEventCRUD.requestElement(OID: Integer): TPersistentObject;
begin
  Result:= TBussinessDataSubsystemFacade.getInstance.getEvento(OID);
end;

procedure TEventCRUD.requestDelete(OID: Integer);
begin
  TBussinessDataSubsystemFacade.getInstance.deleteEvento(OID);
end;

procedure TEventCRUD.doRequestSave(persistentVO: TPersistentObject);
begin
   TBussinessDataSubsystemFacade.getInstance.saveEvento(TEvento(persistentVO));
end;

end.
