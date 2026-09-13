unit TomaTiemposEditUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ZDataset, ZAbstractDataset,
  ZAbstractTable, Data.DB, ZAbstractRODataset, cxGraphics, cxControls,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, Vcl.DBCtrls, cxLabel, Vcl.ExtCtrls,
  cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, DataModule,
  Vcl.StdCtrls, AeroButtons, Vcl.ImgList, F_EEMessage,
  BussinessDataSubsystemFacade, cxTextEdit, datelbl, Entidades, cxMaskEdit,
  cxDropDownEdit;

type
  TTomaTiemposEdit = class(TForm)
    DSEvento: TDataSource;
    QueryCategorias: TZQuery;
    DSCategorias: TDataSource;
    topPanel: TPanel;
    lblFilterEvento: TcxLabel;
    cmbEvento: TDBLookupComboBox;
    cxLabel1: TcxLabel;
    cmbTomaTiempoEvento: TDBLookupComboBox;
    cxLabel2: TcxLabel;
    cmbCategoria: TDBLookupComboBox;
    ZROQTomaTiempos: TZQuery;
    ZROQTomaTiemposoid: TLargeintField;
    ZROQTomaTiemposnro_moto: TWideStringField;
    ZROQTomaTiemposnombre_piloto: TWideStringField;
    ZROQTomaTiemposis_deleted: TWideStringField;
    ZROQTomaTiemposcategoria: TWideStringField;
    ZROQTomaTiempostiempo: TWideStringField;
    ZROQTomaTiempostiempo_pasada: TTimeField;
    ZROQTomaTiempostipo_categoria_oid: TLargeintField;
    ZROQTomaTiemposevento_oid: TIntegerField;
    ZROQTomaTiemposnro_vuelta: TIntegerField;
    ZROQTomaTiemposdeleted_val: TSmallintField;
    DSTomaTiempos: TDataSource;
    PanelMail: TPanel;
    panelCenter: TPanel;
    PanelDatos: TPanel;
    cxGridTomaTiempo: TcxGrid;
    cxGridTomaTiempoDBTableView: TcxGridDBTableView;
    cxGridTomaTiempoDBTableViewnro_moto: TcxGridDBColumn;
    cxGridTomaTiempoDBTableViewnombre_piloto: TcxGridDBColumn;
    cxGridTomaTiempoDBTableViewtiempo: TcxGridDBColumn;
    cxGridTomaTiempoDBTableViewnro_vuelta: TcxGridDBColumn;
    cxGridTomaTiempoDBTableViewColumn1: TcxGridDBColumn;
    cxGridTomaTiempoDBTableViewcategoria: TcxGridDBColumn;
    cxGridTomaTiempoDBTableViewis_deleted: TcxGridDBColumn;
    cxGridTomaTiempoLevel: TcxGridLevel;
    ZCampeonato: TZTable;
    DSCampeonato: TDataSource;
    ZEvento: TZReadOnlyQuery;
    lblCampeonato: TcxLabel;
    cmbCampeonato: TDBLookupComboBox;
    DSTomaTiempoEvento: TDataSource;
    cxFilterImageList: TcxImageList;
    cxImageList: TcxImageList;
    btnFilter: TAeroButton;
    ZTomaTiempoEvento: TZReadOnlyQuery;
    btnDelete: TAeroButton;
    PanelDatosToma: TPanel;
    lblNombre: TcxLabel;
    txtNombre: TcxTextEdit;
    lblTiempoInicio: TDateLabel;
    lblStartTime: TcxLabel;
    lblTiempoFin: TDateLabel;
    lblEndTime: TcxLabel;
    btnGuardar: TAeroButton;
    lblEstado: TcxLabel;
    cmbEstado: TcxComboBox;
    procedure FormCreate(Sender: TObject);
    procedure cmbTomaTiempoEventoCloseUp(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
  private
    { Private declarations }
    procedure refreshDataSetPreservePosition(Query : TDataSet);
    procedure refrescarGrilla();

    procedure limpiarCampos;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TTomaTiemposEdit.refreshDataSetPreservePosition(Query : TDataSet);
begin
  Query.DisableControls;
  try
    Query.Close;
    Query.Open;
  finally
    Query.EnableControls;
  end;
end;

procedure TTomaTiemposEdit.btnDeleteClick(Sender: TObject);
begin
  if (cmbTomaTiempoEvento.KeyValue > 0) then
    begin
      if (TF_EE_Message.ShowMessage(TComponent(Self),'Confirmación de eliminación de Elemento',
        '¿Está seguro que desea eliminar el elemento seleccionado?', TF_EE_Message.QUESTION, False) = mrOk) then
        begin
          TBussinessDataSubsystemFacade.getInstance.deleteTomaTiempoEvento(cmbTomaTiempoEvento.KeyValue);

          refreshDataSetPreservePosition(ZTomaTiempoEvento);
          refrescarGrilla;
        end;
    end;
end;
procedure TTomaTiemposEdit.refrescarGrilla();
var
  cmbTomaTiempoEventoOID : Integer;
begin
  cmbTomaTiempoEventoOID:= 0;
  if (cmbTomaTiempoEvento.KeyValue > 0) then
    cmbTomaTiempoEventoOID:= cmbTomaTiempoEvento.KeyValue;

  with ZROQTomaTiempos do
    begin
      Close;
      ParamByName('toma_tiempo_evento_oid').AsInteger:= cmbTomaTiempoEventoOID;
      Open;
    end;
end;

procedure TTomaTiemposEdit.btnFilterClick(Sender: TObject);
var
  cmbTomaTiempoEventoOID : Integer;
  tomaTiempoEventoVO : TTomaTiempoEventoVO;
begin
  if (cmbTomaTiempoEvento.KeyValue > 0) then
  begin
    cmbTomaTiempoEventoOID:= cmbTomaTiempoEvento.KeyValue;

    tomaTiempoEventoVO:= TBussinessDataSubsystemFacade
      .getInstance.getTomaTiempoEventoVO(cmbTomaTiempoEventoOID);

    txtNombre.Text:= tomaTiempoEventoVO.Nombre;
    lblTiempoInicio.Caption:= DateTimeToStr(tomaTiempoEventoVO.TomaTiempoStartTime);
    lblTiempoFin.Caption:= DateTimeToStr(tomaTiempoEventoVO.TomaTiempoStopTime);
    cmbEstado.Text:= tomaTiempoEventoVO.Estado;

    refrescarGrilla;
  end;
end;

procedure TTomaTiemposEdit.btnGuardarClick(Sender: TObject);
begin
  TBussinessDataSubsystemFacade.getInstance.editTomaTiempoEvento(
    cmbTomaTiempoEvento.KeyValue, txtNombre.Text, cmbEstado.Text);

  limpiarCampos;
end;

procedure TTomaTiemposEdit.cmbTomaTiempoEventoCloseUp(Sender: TObject);
begin
  if (cmbTomaTiempoEvento.KeyValue > 0) then
    begin
      with QueryCategorias do
        begin
          Close;
          ParamByName('toma_tiempo_evento_oid').AsInteger:= cmbTomaTiempoEvento.KeyValue;
          Open;
        end;
    end;
end;

procedure TTomaTiemposEdit.FormCreate(Sender: TObject);
begin
  ZCampeonato.Active:= True;
  ZEvento.Active:= True;
  ZTomaTiempoEvento.Active:= True;
  QueryCategorias.Active:= True;
  QueryCategorias.Next;
end;

procedure TTomaTiemposEdit.limpiarCampos;
begin
  txtNombre.Clear;
  cmbEstado.ItemIndex:= -1;
  lblTiempoInicio.Caption:= '';
  lblTiempoFin.Caption:= '';

  refreshDataSetPreservePosition(ZTomaTiempoEvento);

  refrescarGrilla;
end;

end.
