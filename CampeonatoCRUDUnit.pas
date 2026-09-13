unit CampeonatoCRUDUnit;

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
  Entidades, CampeonatoEditorUnit, BindingHelperUnit,
  BussinessDataSubsystemFacade, ZAbstractDataset, scExcelExport;

type
  TCampeonatoCRUD = class(TAbstractCRUDFrame)
    lblNombre: TcxLabel;
    txtNombre: TcxTextEdit;
    cxGridDBTableViewnombre: TcxGridDBColumn;
    btnValores: TAeroButton;
    scExcelExport: TscExcelExport;
    ZExportarValores: TZQuery;
    procedure txtNombreFocusChanged(Sender: TObject);
    procedure txtNombreKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnValoresClick(Sender: TObject);
  private
    procedure setTListItemsByString(errorListView : TcxListView; stringMessage: String);
  protected
    procedure InitializeBinding; Override;
  public
    constructor Create(owner: TComponent); Override;
    procedure requestLoadInitialData(filterVO: TValueObject); Override;
    procedure doRequestSave(persistentVO: TPersistentObject); Override;
    function requestElement(OID: Integer): TPersistentObject; Override;
    procedure requestDelete(OID: Integer); Override;
  end;

implementation

{$R *.dfm}

procedure TCampeonatoCRUD.btnValoresClick(Sender: TObject);
var
  campeonatoOID : Integer;
begin
  campeonatoOID:= queryGrid.FieldByName('oid').AsInteger;
  if (campeonatoOID > 0) then
    begin
      with ZExportarValores do
      begin
        Close;
        ParamByName('campeonato_oid').AsInteger:= campeonatoOID;
        Open;
      end;

      scExcelExport.Dataset:= ZExportarValores;
      scExcelExport.WorksheetName := 'Asistencia Perfecta';
      scExcelExport.ExportDataset;

      scExcelExport.Disconnect;
    end
  else
      setTListItemsByString(errorListView, 'Debe seleccionar un Evento para generar el Excel de Valores');
end;

constructor TCampeonatoCRUD.Create(owner: TComponent);
var
  campeonatoVO : TCampeonato;
begin
  inherited Create(owner);

  campeonatoVO:= TCampeonato.Create;

  abstractEdit:= TCampeonatoEditor.Create(self, campeonatoVO);
end;

procedure TCampeonatoCRUD.InitializeBinding;
var
  expression: TBindExpression;
begin
  BindingHelper.setMessageKey(TComponent(txtNombre), 'Text', TComponent(BindScope), 'Nombre', BindingsList);

  // Create a Filter object.
  filterVO := TCampeonatoFilter.Create;
  BindScope.DataObject := filterVO;
end;

procedure TCampeonatoCRUD.requestLoadInitialData(filterVO: TValueObject);
var
  campeonatoFilterVO: TCampeonatoFilter;
begin
  campeonatoFilterVO:= TCampeonatoFilter(filterVO);

  with queryGrid do
    begin
      Close;
      ParamByName('nombre').AsString:= campeonatoFilterVO.Nombre;
      Open;
    end;
end;

procedure TCampeonatoCRUD.txtNombreFocusChanged(Sender: TObject);
begin
  BindingsList.Notify(Sender, 'Text');
end;

procedure TCampeonatoCRUD.txtNombreKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  BindingsList.Notify(Sender, 'Text');
end;

function TCampeonatoCRUD.requestElement(OID: Integer): TPersistentObject;
begin
  Result:= TBussinessDataSubsystemFacade.getInstance.getCampeonato(OID);
end;

procedure TCampeonatoCRUD.requestDelete(OID: Integer);
begin
  TBussinessDataSubsystemFacade.getInstance.deleteCampeonato(OID);
end;

procedure TCampeonatoCRUD.doRequestSave(persistentVO: TPersistentObject);
begin
   TBussinessDataSubsystemFacade.getInstance.saveCampeonato(TCampeonato(persistentVO));
end;

procedure TCampeonatoCRUD.setTListItemsByString(errorListView : TcxListView; stringMessage: String);
var
  Index : Integer;
  stringList : TStringList;
begin
  stringList:= TStringList.Create;
  stringList.Add(stringMessage);

  errorListView.Items.Clear;

  for Index := 0 to stringList.Count - 1 do
  begin
    with errorListView.Items.Add do
    begin
      Caption := stringList[Index];
      StateIndex:= 0;
    end;
  end;

  validationPanel.Visible:= True;
end;

end.
