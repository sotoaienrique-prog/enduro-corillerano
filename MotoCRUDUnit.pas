unit MotoCRUDUnit;

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
  AeroButtons, Vcl.ExtCtrls, cxTextEdit, BindingHelperUnit, Entidades,
  BussinessDataSubsystemFacade, MotoEditorUnit, JvExExtCtrls, JvNetscapeSplitter,
  Vcl.ActnList, cxLocalization, Vcl.ToolWin, ReporteMotos;

type
  TMotoCRUD = class(TAbstractCRUDFrame)
    lblNombre: TcxLabel;
    txtNombre: TcxTextEdit;
    cxGridDBTableViewnombre: TcxGridDBColumn;
    cxGridDBTableViewColumn1: TcxGridDBColumn;
    btnReporteMotos: TAeroButton;
    procedure txtNombreFocusChanged(Sender: TObject);
    procedure txtNombreKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnReporteMotosClick(Sender: TObject);
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

procedure TMotoCRUD.btnReporteMotosClick(Sender: TObject);
var
  ReportMotos: TReportMotos;
begin
    ReportMotos:= TReportMotos.Create(nil);

    with ReportMotos.ZSelectReporteEvento do
    begin
      Close;
      Open;
    end;

   if (ReportMotos.ZSelectReporteEvento.RecordCount > 0) then
   begin
     ReportMotos.QuickRep.Preview;
   end;
end;

constructor TMotoCRUD.Create(owner: TComponent);
var
  motoVO : TMoto;
begin
  inherited Create(owner);

  motoVO:= TMoto.Create;

  abstractEdit:= TMotoEditor.Create(self, motoVO);
end;

procedure TMotoCRUD.InitializeBinding;
var
  expression: TBindExpression;
begin
  BindingHelper.setMessageKey(TComponent(txtNombre), 'Text', TComponent(BindScope), 'Nombre', BindingsList);

  // Create a Filter object.
  filterVO := TMotoFilter.Create;
  BindScope.DataObject := filterVO;
end;

procedure TMotoCRUD.requestLoadInitialData(filterVO: TValueObject);
var
  motoFilterVO: TMotoFilter;
begin
  motoFilterVO:= TMotoFilter(filterVO);

  with queryGrid do
    begin
      Close;
      ParamByName('nombre').AsString:= motoFilterVO.Nombre;
      Open;
    end;
end;

procedure TMotoCRUD.txtNombreFocusChanged(Sender: TObject);
begin
  BindingsList.Notify(Sender, 'Text');
end;

procedure TMotoCRUD.txtNombreKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  BindingsList.Notify(Sender, 'Text');
end;

function TMotoCRUD.requestElement(OID: Integer): TPersistentObject;
begin
  Result:= TBussinessDataSubsystemFacade.getInstance.getMoto(OID);
end;

procedure TMotoCRUD.requestDelete(OID: Integer);
begin
  TBussinessDataSubsystemFacade.getInstance.deleteMoto(OID);
end;

procedure TMotoCRUD.doRequestSave(persistentVO: TPersistentObject);
begin
   TBussinessDataSubsystemFacade.getInstance.saveMoto(TMoto(persistentVO));
end;

end.
