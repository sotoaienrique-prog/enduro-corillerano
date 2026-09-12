unit AbstractCRUD;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
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
  dxSkinXmas2008Blue, cxSplitter, cxStyles, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, Data.DB, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Vcl.ImgList, Vcl.StdCtrls, AeroButtons,
  ZAbstractRODataset, ZDataset, AdvSmoothLabel, cxContainer, cxListBox, Entidades,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, Data.Bind.Components, AbstractEditor,
  Vcl.Menus, cxGridCustomPopupMenu, cxGridPopupMenu, AdvMenus, cxLabel,
  AdvPicture, dxGDIPlusClasses, HotSpotImage, Vcl.ComCtrls, cxListView,
  JvExExtCtrls, JvNetscapeSplitter, cxLocalization, Vcl.ToolWin, Vcl.ActnList,
  Vcl.DBCtrls;

type
  TAbstractCRUDFrame = class(TFrame)
    filterPanel: TPanel;
    mainPanel: TPanel;
    buttonPanel: TPanel;
    gridPanel: TPanel;
    cxGridDBTableView: TcxGridDBTableView;
    cxGridLevel: TcxGridLevel;
    cxGrid: TcxGrid;
    btnNew: TAeroButton;
    cxButtonImageList: TcxImageList;
    btnDelete: TAeroButton;
    btnEdit: TAeroButton;
    queryGrid: TZReadOnlyQuery;
    dataSourceGrid: TDataSource;
    btnFilter: TAeroButton;
    cxFilterImageList: TcxImageList;
    topPanel: TPanel;
    bannerPanel: TPanel;
    TitleSmoothLabel: TAdvSmoothLabel;
    filterGB: TGroupBox;
    BindingsList: TBindingsList;
    BindScope: TBindScope;
    AdvPopupMenu: TAdvPopupMenu;
    miEditar: TMenuItem;
    miEliiminar: TMenuItem;
    labelResultMessage: TcxLabel;
    pictureResultMessage: THotSpotImage;
    miNuevo: TMenuItem;
    editorPanel: TPanel;
    validationPanel: TPanel;
    errorListView: TcxListView;
    Splitter1: TSplitter;
    topSplitter: TJvNetscapeSplitter;
    leftSplitter: TJvNetscapeSplitter;
    cxLocalizer: TcxLocalizer;
    ilMain: TImageList;
    alMain: TActionList;
    actFiltering: TAction;
    actShowDescription: TAction;
    actColumnsCustomize: TAction;
    actExit: TAction;
    actShowPictures: TAction;
    actGrouping: TAction;
    acIndicator: TAction;
    actSummaryFooter: TAction;
    actHeader: TAction;
    actAutoWidth: TAction;
    actInvertSelected: TAction;
    actFullExpand: TAction;
    actFullCollapse: TAction;
    actBestFit: TAction;
    actShowEditButtons: TAction;
    actAbout: TAction;
    actGridLines: TAction;
    actAutoPreview: TAction;
    actShowDependsOnData: TAction;
    actNewItemRow: TAction;
    actSelectStyleSheet: TAction;
    actEditorsShadow: TAction;
    actPageSetup: TAction;
    actPreview: TAction;
    acPrint: TAction;
    actDesigner: TAction;
    acExportExel: TAction;
    ControlBar1: TControlBar;
    tbView1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    tbView: TToolBar;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton12: TToolButton;
    ToolButton17: TToolButton;
    ToolButton11: TToolButton;
    ToolButton7: TToolButton;
    ToolBar1: TToolBar;
    ToolButton5: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolBar2: TToolBar;
    ToolButton6: TToolButton;
    ToolButton8: TToolButton;
    ToolButton13: TToolButton;
    ToolButton16: TToolButton;
    btnReload: TAeroButton;
    procedure btnNewClick(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure actGroupingExecute(Sender: TObject);
    procedure acIndicatorExecute(Sender: TObject);
    procedure actFilteringExecute(Sender: TObject);
    procedure actHeaderExecute(Sender: TObject);
    procedure actAutoWidthExecute(Sender: TObject);
    procedure actGridLinesExecute(Sender: TObject);
    procedure actFullCollapseExecute(Sender: TObject);
    procedure actBestFitExecute(Sender: TObject);
    procedure actFullExpandExecute(Sender: TObject);
    procedure actInvertSelectedExecute(Sender: TObject);
    procedure actAutoPreviewExecute(Sender: TObject);
    procedure actColumnsCustomizeExecute(Sender: TObject);
    procedure cxGridDBTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure btnReloadClick(Sender: TObject);
    procedure bannerPanelResize(Sender: TObject);
    procedure FrameMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FrameMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);

  private
    { Private declarations }
    procedure editObject;
    procedure deleteObject;

    procedure InitializeTranslation;
    function ExtractRutaTranslation: String;
  protected
    abstractEdit : TAbstractEdit;
    filterVO: TValueObject;

    procedure textKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure InitializeBinding; Virtual; Abstract;
  public
    procedure DoSetShowGrouping(Value: boolean);
    procedure DoSetShowIndicator(Value: boolean);
    procedure DoSetShowFilter(Value: boolean);
    procedure DoSetShowHeader(Value: boolean);
    procedure DoSetAutoWidth(Value: boolean);
    procedure DoSetShowGridLines(Value: boolean);
    procedure DoSetInvertSelected(Value: boolean);
    procedure DoSetAutoPreview(Value: boolean);
    procedure DoColumnsCustomization;
    procedure DoFullExpand;
    procedure DoFullCollapse;
    procedure DoBestFit;


    { Public declarations }
    constructor Create(owner: TComponent); Override;
    destructor Destroy(); Override;

    procedure doRequestSave(persistentVO: TPersistentObject); Virtual; Abstract;
    procedure requestSave(persistentVO: TPersistentObject);
    procedure requestSaveDone(persistentVO: TPersistentObject);
    procedure requestDelete(OID: Integer); Virtual; Abstract;
    procedure requestLoadInitialDataComplete(filterVO: TValueObject);
    procedure requestLoadInitialData(filterVO: TValueObject); Virtual; Abstract;
    procedure requestLoadInitialDataDone(filterVO: TValueObject);
    function requestElement(OID: Integer): TPersistentObject; Virtual; Abstract;

    procedure hideEditor;
    procedure RefreshCRUDData; Virtual;

    procedure showResultMessage(message : String);
    procedure clearResultMessage();
  end;

implementation

{$R *.dfm}

uses DataModule, F_EEMessage;

procedure TAbstractCRUDFrame.textKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  BindingsList.Notify(Sender, 'Text');
end;

constructor TAbstractCRUDFrame.Create(owner: TComponent);
begin
  inherited Create(owner);
  InitializeBinding;
  InitializeTranslation;
  requestLoadInitialDataComplete(filterVO);
  RefreshCRUDData;
end;

procedure TAbstractCRUDFrame.cxGridDBTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  clearResultMessage();
  editObject;
end;

procedure TAbstractCRUDFrame.InitializeTranslation;
begin
  cxLocalizer.FileName:= ExtractRutaTranslation;
  cxLocalizer.Active:= True;
  cxLocalizer.Locale:= 11274;
end;

function TAbstractCRUDFrame.ExtractRutaTranslation: String;
begin
  Result:= ExtractFileDir(paramstr(0))+'\gridTranslation.ini';
end;

procedure TAbstractCRUDFrame.FrameMouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
var
  i:Integer;
begin
  for i:=0 to mainPanel.ControlCount-1 do
   begin
      if ((mainPanel.Controls[i] is TDBLookupComboBox)) then
      begin
      if (TDBLookupComboBox(mainPanel.Controls[i]).Focused) then
        begin
          TDBLookupComboBox(mainPanel.Controls[i]).Perform(WM_KEYDOWN, VK_DOWN, 0);
        end;
    end;
   end;
//
//
//  if (Sender is TDBLookupComboBox) then
//  begin
//    if (TDBLookupComboBox(Sender).Focused) then
//      begin
//        TDBLookupComboBox(Sender).Perform(WM_KEYDOWN, VK_DOWN, 0);
//      end;
//    end;
end;

procedure TAbstractCRUDFrame.FrameMouseWheelUp(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  if (Sender is TDBLookupComboBox) then
  begin
    if (TDBLookupComboBox(Sender).Focused) then
      begin
        TDBLookupComboBox(Sender).Perform(WM_KEYDOWN, VK_UP, 0);
      end;
    end;
end;

procedure TAbstractCRUDFrame.requestLoadInitialDataComplete(filterVO: TValueObject);
begin
  try
    requestLoadInitialData(filterVO);
  except on E: Exception do
    TF_EE_Message.ShowMessage(TComponent(self),'Error al seleccionar los datos',
      'No se ha podido conectar con la Base de Datos ' +
      E.Message , TF_EE_Message.ERROR, True);
  end;
  requestLoadInitialDataDone(filterVO);
end;

procedure TAbstractCRUDFrame.requestLoadInitialDataDone(filterVO: TValueObject);
begin
  cxGridDBTableView.ViewData.Expand(true);
end;

destructor TAbstractCRUDFrame.Destroy();
begin
  if Assigned(abstractEdit) then
  begin
    FreeAndNil(abstractEdit);
  end;
end;

procedure TAbstractCRUDFrame.acIndicatorExecute(Sender: TObject);
begin
  TAction(Sender).Checked := not TAction(Sender).Checked;
  DoSetShowIndicator(TAction(Sender).Checked);
end;

procedure TAbstractCRUDFrame.actAutoPreviewExecute(Sender: TObject);
begin
  TAction(Sender).Checked := not TAction(Sender).Checked;
  DoSetAutoPreview(TAction(Sender).Checked);
end;

procedure TAbstractCRUDFrame.actAutoWidthExecute(Sender: TObject);
begin
  TAction(Sender).Checked := not TAction(Sender).Checked;
  DoSetAutoWidth(TAction(Sender).Checked);
end;

procedure TAbstractCRUDFrame.actFilteringExecute(Sender: TObject);
begin
  TAction(Sender).Checked := not TAction(Sender).Checked;
  DoSetShowFilter(TAction(Sender).Checked);
end;

procedure TAbstractCRUDFrame.actGridLinesExecute(Sender: TObject);
begin
  TAction(Sender).Checked := not TAction(Sender).Checked;
  DoSetShowGridLines(TAction(Sender).Checked);
end;

procedure TAbstractCRUDFrame.actGroupingExecute(Sender: TObject);
begin
  TAction(Sender).Checked := not TAction(Sender).Checked;
  DoSetShowGrouping(TAction(Sender).Checked);
end;

procedure TAbstractCRUDFrame.actHeaderExecute(Sender: TObject);
begin
  TAction(Sender).Checked := not TAction(Sender).Checked;
  DoSetShowHeader(TAction(Sender).Checked);
end;

procedure TAbstractCRUDFrame.actInvertSelectedExecute(Sender: TObject);
begin
  TAction(Sender).Checked := not TAction(Sender).Checked;
  DoSetInvertSelected(TAction(Sender).Checked);
end;

procedure TAbstractCRUDFrame.bannerPanelResize(Sender: TObject);
begin
  btnReload.Left:= bannerPanel.Width - btnReload.Width - 10;
end;

procedure TAbstractCRUDFrame.btnDeleteClick(Sender: TObject);
begin
  clearResultMessage();
  deleteObject;
end;

procedure TAbstractCRUDFrame.btnEditClick(Sender: TObject);
begin
  clearResultMessage();
  editObject;
end;

procedure TAbstractCRUDFrame.btnFilterClick(Sender: TObject);
begin
  requestLoadInitialDataComplete(filterVO);
end;

procedure TAbstractCRUDFrame.btnNewClick(Sender: TObject);
begin
  clearResultMessage();
  abstractEdit.ClearEditor;
  abstractEdit.Show;
end;

procedure TAbstractCRUDFrame.btnReloadClick(Sender: TObject);
begin
  RefreshCRUDData;
end;

procedure TAbstractCRUDFrame.editObject;
var
  selectedOID: Integer;
  persistentVO: TPersistentObject;
begin
  selectedOID:= queryGrid.FieldByName('OID').AsInteger;
  persistentVO:= requestElement(selectedOID);
  abstractEdit.setEditorValueObject(persistentVO);
  abstractEdit.Show;
end;

procedure TAbstractCRUDFrame.deleteObject;
var
  selectedOID: Integer;
begin
  if (TF_EE_Message.ShowMessage(TComponent(Self),'Confirmación de eliminación de Elemento',
    '¿Está seguro que desea eliminar el elemento seleccionado?', TF_EE_Message.QUESTION, False) = mrOk) then
  begin
    selectedOID:= queryGrid.FieldByName('OID').AsInteger;
    requestDelete(selectedOID);
    requestLoadInitialDataComplete(filterVO);
  end;
end;

procedure TAbstractCRUDFrame.hideEditor;
begin
  if (Assigned(abstractEdit)) then
    begin
      abstractEdit.Hide;
    end;
end;

procedure TAbstractCRUDFrame.RefreshCRUDData;
begin
  if (Assigned(abstractEdit)) then
    abstractEdit.RefreshEditorData;
end;

procedure TAbstractCRUDFrame.requestSave(persistentVO: TPersistentObject);
begin
  doRequestSave(persistentVO);
  requestSaveDone(persistentVO);
end;

procedure TAbstractCRUDFrame.requestSaveDone(persistentVO: TPersistentObject);
begin
  showResultMessage('El elemento ha sido guardado satisfactoriamente.');
  requestLoadInitialDataComplete(filterVO);
end;

procedure TAbstractCRUDFrame.showResultMessage(message : String);
begin
  pictureResultMessage.Visible:= True;
  labelResultMessage.Visible:= True;

  labelResultMessage.Caption:= message;
end;

procedure TAbstractCRUDFrame.clearResultMessage();
begin
  pictureResultMessage.Visible:= False;
  labelResultMessage.Visible:= False;
end;

procedure TAbstractCRUDFrame.DoSetShowGrouping(Value: boolean);
begin
  TcxGridTableView(cxGrid.FocusedView).OptionsView.GroupByBox := Value;
end;

procedure TAbstractCRUDFrame.DoSetShowIndicator(Value: boolean);
begin
  TcxGridTableView(cxGrid.FocusedView).OptionsView.Indicator := Value;
end;

procedure TAbstractCRUDFrame.DoSetShowFilter(Value: boolean);
begin
  TcxGridTableView(cxGrid.FocusedView).FilterRow.Visible := Value;
end;

procedure TAbstractCRUDFrame.DoSetShowHeader(Value: boolean);
begin
  TcxGridTableView(cxGrid.FocusedView).OptionsView.Header := Value;
end;

procedure TAbstractCRUDFrame.DoSetAutoWidth(Value: boolean);
begin
  TcxGridTableView(cxGrid.FocusedView).OptionsView.ColumnAutoWidth := Value;
end;

procedure TAbstractCRUDFrame.DoSetShowGridLines(Value: boolean);
begin
  if Value then
    TcxGridTableView(cxGrid.FocusedView).OptionsView.GridLines := glBoth
  else TcxGridTableView(cxGrid.FocusedView).OptionsView.GridLines := glNone;
end;

procedure TAbstractCRUDFrame.actFullCollapseExecute(Sender: TObject);
begin
  DoFullCollapse;
end;

procedure TAbstractCRUDFrame.actFullExpandExecute(Sender: TObject);
begin
  DoFullExpand;
end;

procedure TAbstractCRUDFrame.DoFullCollapse;
begin
  cxGridDBTableView.ViewData.Collapse(True);
end;


procedure TAbstractCRUDFrame.actBestFitExecute(Sender: TObject);
begin
  DoBestFit;
end;

procedure TAbstractCRUDFrame.actColumnsCustomizeExecute(Sender: TObject);
begin
  DoColumnsCustomization;
end;

procedure TAbstractCRUDFrame.DoBestFit;
begin
  TcxGridTableView(cxGrid.FocusedView).ApplyBestFit;
end;

procedure TAbstractCRUDFrame.DoFullExpand;
begin
   cxGridDBTableView.ViewData.Expand(True);
end;

procedure TAbstractCRUDFrame.DoSetInvertSelected(Value: boolean);
begin
  TcxGridTableView(cxGrid.FocusedView).OptionsSelection.InvertSelect := Value;
end;

procedure TAbstractCRUDFrame.DoSetAutoPreview(Value: boolean);
begin
  TcxGridTableView(cxGrid.FocusedView).Preview.Visible := Value;
end;

procedure TAbstractCRUDFrame.DoColumnsCustomization;
begin
  TcxGridTableController(TcxGridTableView(cxGrid.FocusedView).Controller).Customization := True;
end;

end.
