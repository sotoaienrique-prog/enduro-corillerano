unit RecargoTomaTiempoEventoUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, Vcl.DBCtrls, cxLabel, Vcl.StdCtrls,
  AeroButtons, Vcl.ImgList, Data.DB, ZAbstractRODataset, ZAbstractDataset,
  ZAbstractTable, ZDataset, cxTextEdit, cxCurrencyEdit, Vcl.ComCtrls, cxListView,
  Entidades, BussinessDataSubsystemFacade, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, DataModule, JvExExtCtrls, JvNetscapeSplitter,
  scExcelExport;

type
  TRecargoTomaTiempoEvento = class(TForm)
    cxButtonImageList: TcxImageList;
    DSTomaTiempoEvento: TDataSource;
    ZFilterPiloto: TZReadOnlyQuery;
    DSFilterPiloto: TDataSource;
    ZTipoRecargo: TZTable;
    DSTipoRecargo: TDataSource;
    ZRecargo: TZQuery;
    DSRecargo: TDataSource;
    cxErrorImageList: TcxImageList;
    ZTipoCategoria: TZTable;
    DSTipoCategoria: TDataSource;
    ZTomaTiempoEvento: TZReadOnlyQuery;
    mainPanel: TPanel;
    topPanel: TPanel;
    cxLabel1: TcxLabel;
    cmbTomaTiempoEvento: TDBLookupComboBox;
    cmbFilterPiloto: TDBLookupComboBox;
    lblFilterCampeonato: TcxLabel;
    cxLabel2: TcxLabel;
    cmbTipoRecargo: TDBLookupComboBox;
    lblRecargo: TcxLabel;
    txtSegundos: TcxCurrencyEdit;
    lblSegs: TcxLabel;
    btnNew: TAeroButton;
    btnRecargoTiempo: TAeroButton;
    lblTipoCategoria: TcxLabel;
    cmbTipoCategoria: TDBLookupComboBox;
    panelInferior: TPanel;
    btnAccept: TAeroButton;
    validationPanel: TPanel;
    errorListView: TcxListView;
    cxGrid: TcxGrid;
    cxGridDBTableView: TcxGridDBTableView;
    cxGridDBTableViewtoma_tiempo_evento: TcxGridDBColumn;
    cxGridDBTableViewtipo_recargo: TcxGridDBColumn;
    cxGridDBTableViewpiloto: TcxGridDBColumn;
    cxGridDBTableViewsegundos_recargo: TcxGridDBColumn;
    cxGridLevel: TcxGridLevel;
    filterPanel: TPanel;
    btnFilter: TAeroButton;
    filterGB: TGroupBox;
    leftSplitter: TJvNetscapeSplitter;
    cxFilterImageList: TcxImageList;
    TCampeonatoFilter: TZTable;
    DSCampeonatoFilter: TDataSource;
    ZFilterEvento: TZReadOnlyQuery;
    DSFilterEvento: TDataSource;
    lblCampeonatoFilter: TcxLabel;
    lblFilterEvento: TcxLabel;
    cmbFilterEvento: TDBLookupComboBox;
    cmbFilterCampeonato: TDBLookupComboBox;
    cxGridDBTableViewColumn1: TcxGridDBColumn;
    btnExpXLSTT: TAeroButton;
    ZRecargoDisplay: TZQuery;
    cxLabel3: TcxLabel;
    cmbTipoToma: TComboBox;
    scExcelExport: TscExcelExport;
    procedure FormCreate(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnRecargoTiempoClick(Sender: TObject);
    procedure cmbTomaTiempoEventoCloseUp(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure cmbTipoRecargoCloseUp(Sender: TObject);
    procedure btnExpXLSTTClick(Sender: TObject);
    procedure cmbTipoTomaCloseUp(Sender: TObject);
  private
    procedure setTListItemsByTStringList(errorListView : TcxListView; stringList : TStringList);
    function VarToIntDef(const V: Variant; const ADefault: Integer): Integer;
    procedure refreshGrid;
    procedure clearComponents;
    procedure selectCombosByDate;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

function TRecargoTomaTiempoEvento.VarToIntDef(const V: Variant; const ADefault: Integer): Integer;
begin
  if not VarIsNull(V) then
    Result := StrToIntDef(V, ADefault)
  else
    Result := ADefault;
end;

procedure TRecargoTomaTiempoEvento.btnExpXLSTTClick(Sender: TObject);
begin
  with ZRecargoDisplay do
    begin
      Close;
      if (cmbFilterCampeonato.KeyValue > 0) then
        ParamByName('campeonato_oid').AsInteger:= cmbFilterCampeonato.KeyValue;
      Open;
    end;

    scExcelExport.Dataset:= ZRecargoDisplay;
    scExcelExport.WorksheetName := 'Grilla de Recargos';
    scExcelExport.ExportDataset;
    scExcelExport.Disconnect;
end;

procedure TRecargoTomaTiempoEvento.btnFilterClick(Sender: TObject);
begin
  refreshGrid;
end;

procedure TRecargoTomaTiempoEvento.btnNewClick(Sender: TObject);
var
  RecargoTomaTiempoEvento : TRecargoTomaTiempoEventoVO;
begin
  RecargoTomaTiempoEvento := TRecargoTomaTiempoEventoVO.Create;

  RecargoTomaTiempoEvento.TomaTiempoEventoOID:= VarToIntDef(cmbTomaTiempoEvento.KeyValue, 0);
  RecargoTomaTiempoEvento.PilotoOID:= VarToIntDef(cmbFilterPiloto.KeyValue, 0);
  RecargoTomaTiempoEvento.TipoRecargoOID:= VarToIntDef(cmbTipoRecargo.KeyValue, 0);
  RecargoTomaTiempoEvento.SegundosRecargo:= StrToIntDef(txtSegundos.Text, 0);
  RecargoTomaTiempoEvento.TipoCategoriaOID:= StrToIntDef(cmbTipoCategoria.KeyValue, 0);

  if (RecargoTomaTiempoEvento.isValidObject) then
    begin
      validationPanel.Visible:= False;

      TBussinessDataSubsystemFacade.getInstance
        .addRecargoTomaTiempoEvento(RecargoTomaTiempoEvento);

      refreshGrid;
      clearComponents;
    end
  else
      setTListItemsByTStringList(errorListView, RecargoTomaTiempoEvento.getValidationResult);
end;

procedure TRecargoTomaTiempoEvento.refreshGrid;
begin
  with ZRecargo do
    begin
      Close;
      if (cmbFilterEvento.KeyValue > 0) then
        ParamByName('evento_oid').AsInteger:= cmbFilterEvento.KeyValue;
      Open;
    end;

  if (cmbFilterEvento.KeyValue > 0) then
        ZTomaTiempoEvento.ParamByName('evento_oid').AsInteger:= cmbFilterEvento.KeyValue;
  ZTomaTiempoEvento.Active:= False;
  ZTomaTiempoEvento.Active:= True;
end;

procedure TRecargoTomaTiempoEvento.clearComponents;
begin
   txtSegundos.Clear;
end;

procedure TRecargoTomaTiempoEvento.cmbTipoRecargoCloseUp(Sender: TObject);
begin
  if ((cmbTipoRecargo.KeyValue = 1)
    or (cmbTipoRecargo.KeyValue = 4)
    or (cmbTipoRecargo.KeyValue = 5)
    or (cmbTipoRecargo.KeyValue = 6)
    or (cmbTipoRecargo.KeyValue = 8)
    or (cmbTipoRecargo.KeyValue = 9)
    or (cmbTipoRecargo.KeyValue = 10)
    or (cmbTipoRecargo.KeyValue = 12) //Recargo x Corte de Camino
    ) then
    begin
      txtSegundos.Enabled:= True;
    end
  else
    begin
      txtSegundos.Enabled:= False;
      txtSegundos.Value:= 0;
    end;
end;

procedure TRecargoTomaTiempoEvento.cmbTipoTomaCloseUp(Sender: TObject);
begin
  with ZTomaTiempoEvento do
    begin
      Close;
      ParamByName('tipo_toma_tiempo').AsString:= cmbTipoToma.Text;
      if (cmbFilterEvento.KeyValue > 0) then
            ParamByName('evento_oid').AsInteger:= cmbFilterEvento.KeyValue;
      Open;
    end;
end;

procedure TRecargoTomaTiempoEvento.cmbTomaTiempoEventoCloseUp(Sender: TObject);
begin
  with ZFilterPiloto do
    begin
      Close;
      ParamByName('evento_oid').AsInteger:= ZTomaTiempoEvento.FieldByName('evento_oid').AsInteger;
      ParamByName('toma_tiempo_evento_oid').AsInteger:= ZTomaTiempoEvento.FieldByName('oid').AsInteger;
      ParamByName('tipo_categoria_oid').AsInteger:= ZTipoCategoria.FieldByName('oid').AsInteger;
      Open;
    end;
end;

procedure TRecargoTomaTiempoEvento.btnRecargoTiempoClick(Sender: TObject);
var
  selectedOID : Integer;
begin
  selectedOID:= ZRecargo.FieldByName('oid').AsInteger;

  TBussinessDataSubsystemFacade.getInstance
    .deleteRecargoTomaTiempoEvento(selectedOID);

  refreshGrid;
end;

procedure TRecargoTomaTiempoEvento.FormCreate(Sender: TObject);
begin
  selectCombosByDate;
  ZFilterPiloto.Active:= true;
  ZTipoRecargo.Active:= true;
  refreshGrid;
  ZTipoCategoria.Active:= true;
  TCampeonatoFilter.Active:= True;
  ZFilterEvento.Active:= True;
end;

procedure TRecargoTomaTiempoEvento.setTListItemsByTStringList(errorListView : TcxListView; stringList : TStringList);
var
  Index : Integer;
begin
  errorListView.Items.Clear;
  validationPanel.Visible:= True;

  for Index := 0 to stringList.Count - 1 do
  begin
    with errorListView.Items.Add do
    begin
      Caption := stringList[Index];
      StateIndex:= 0;
    end;
  end;
end;

procedure TRecargoTomaTiempoEvento.selectCombosByDate;
begin
  with ConnectionModule.GetEventoByDate do
    begin
      Close;
      Open;

      if (RecordCount > 0) then
        begin
          cmbFilterCampeonato.KeyValue:= FieldByName('campeonato_oid').AsInteger;
          cmbFilterEvento.KeyValue:= FieldByName('evento_oid').AsInteger;
        end;
    end;
end;

end.
