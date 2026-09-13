unit TomaTiemposUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, JvExExtCtrls,
  JvNetscapeSplitter, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, Data.DB, cxDBData, cxContainer, Vcl.DBCtrls, cxLabel,
  ZDataset, ZAbstractRODataset, ZAbstractDataset, ZAbstractTable, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Vcl.StdCtrls, AeroButtons, Vcl.ImgList, F_EEMessage,
  DataModule, BussinessDataSubsystemFacade, Entidades, cxTextEdit, Vcl.ComCtrls,
  cxListView, cxLocalization, Vcl.Menus, AdvMenus, GrillaPartidaUnit,
  scExcelExport, AddTomaTiempo, RecargoTomaTiempoEventoUnit, IdContext,
  IdTCPConnection, IdTCPClient, IdBaseComponent, IdComponent, IdCustomTCPServer,
  IdTCPServer, DateUtils, cxGroupBox, frxClass, frxDMPExport, tmsAdvGridExcel,  Generics.Collections,
  ZDbcIntfs, StrUtils, JvComponentBase, JvDBGridExport, AddTomaTiempoGrilla,
  ZSqlMonitor, SqlTimSt;

type
  TTomaTiempos = class(TForm)
    Splitter: TSplitter;
    panelContainer: TPanel;
    topPanel: TPanel;
    topSplitter: TJvNetscapeSplitter;
    buttomPanel: TPanel;
    rightPanel: TPanel;
    JvNetscapeSplitter: TJvNetscapeSplitter;
    cxGridTomaTiempoDBTableView: TcxGridDBTableView;
    cxGridTomaTiempoLevel: TcxGridLevel;
    cxGridTomaTiempo: TcxGrid;
    cxGridPosicionesDBTableView: TcxGridDBTableView;
    cxGridPosicionesLevel: TcxGridLevel;
    cxGridPosiciones: TcxGrid;
    ZCampeonato: TZTable;
    ZEvento: TZReadOnlyQuery;
    DSCampeonato: TDataSource;
    DSEvento: TDataSource;
    lblCampeonato: TcxLabel;
    cmbCampeonato: TDBLookupComboBox;
    lblEvento: TcxLabel;
    cmbEvento: TDBLookupComboBox;
    cxImageList: TcxImageList;
    btnStart: TAeroButton;
    btnStop: TAeroButton;
    btnEliminarPasada: TAeroButton;
    btnDeseliminarPasada: TAeroButton;
    DSTomaTiempos: TDataSource;
    cxGridTomaTiempoDBTableViewnro_moto: TcxGridDBColumn;
    cxGridTomaTiempoDBTableViewnombre_piloto: TcxGridDBColumn;
    ZROQTomaTiempos: TZQuery;
    cxGridTomaTiempoDBTableViewis_deleted: TcxGridDBColumn;
    lblNombre: TcxLabel;
    txtNombre: TcxTextEdit;
    cxGridTomaTiempoDBTableViewtiempo: TcxGridDBColumn;
    validationPanel: TPanel;
    errorListView: TcxListView;
    cxErrorImageList: TcxImageList;
    cxLocalizer: TcxLocalizer;
    AdvMainMenu: TAdvMainMenu;
    itemConfiguracion: TMenuItem;
    itemConfigurarTiempoEPiloto: TMenuItem;
    btnGenerarGrillaPartida: TAeroButton;
    ZGrillaPartida: TZReadOnlyQuery;
    ZInsertTomaTiempos: TZQuery;
    NroDeLargadaByEvento: TZReadOnlyQuery;
    lblNroLargada: TcxLabel;
    cmbNroLargada: TDBLookupComboBox;
    DSNroDeLargadaByEvento: TDataSource;
    ZROQPosiciones: TZReadOnlyQuery;
    DSPosiciones: TDataSource;
    cxGridPosicionesDBTableViewnro_moto: TcxGridDBColumn;
    cxGridPosicionesDBTableViewnombre_piloto: TcxGridDBColumn;
    cxGridPosicionesDBTableViewcategoria: TcxGridDBColumn;
    cxGridTomaTiempoDBTableViewcategoria: TcxGridDBColumn;
    ZROQTomaTiemposoid: TLargeintField;
    ZROQTomaTiemposnro_moto: TWideStringField;
    ZROQTomaTiemposnombre_piloto: TWideStringField;
    ZROQTomaTiemposis_deleted: TWideStringField;
    ZROQTomaTiemposcategoria: TWideStringField;
    ZROQTomaTiempostiempo: TWideStringField;
    lblTomaTiempoEvento: TcxLabel;
    cmbTomaTiempoEvento: TDBLookupComboBox;
    DSTomaTiempoEvento: TDataSource;
    btnExportarExcelPosiciones: TAeroButton;
    cxButtonImageList: TcxImageList;
    ZExcelExport: TZReadOnlyQuery;
    cxGridTomaTiempoDBTableViewColumn1: TcxGridDBColumn;
    btnAgregarPasadaConNumeroyTiempo: TAeroButton;
    btnExpXLSTT: TAeroButton;
    ZROQTomaTiemposExp: TZQuery;
    ZROQTomaTiempostipo_categoria_oid: TLargeintField;
    ZROQTomaTiemposevento_oid: TIntegerField;
    cxGridTomaTiempoDBTableViewnro_vuelta: TcxGridDBColumn;
    ZROQTomaTiemposnro_vuelta: TIntegerField;
    ZROQTomaTiemposdeleted_val: TSmallintField;
    Timer: TTimer;
    btnRefrescarGrillaPosiciones: TAeroButton;
    gbLecturas: TcxGroupBox;
    MemoLectuas: TMemo;
    ZTomaTiempoEvento: TZReadOnlyQuery;
    QueryCategorias: TZQuery;
    DSCategorias: TDataSource;
    cxLabel2: TcxLabel;
    cmbCategoria: TDBLookupComboBox;
    btnContinuarTomaTiempo: TAeroButton;
    lblTomaTiempoEventoCont: TcxLabel;
    cmbTomaTiempoEventoCont: TDBLookupComboBox;
    ZTomaTiempoEventoCont: TZReadOnlyQuery;
    DSTomaTiempoEventoCont: TDataSource;
    btnExportarTelefonico: TAeroButton;
    ZReSetPosition: TZQuery;
    ZROQTomaTiempostoma_tiempo_evento_oid: TLargeintField;
    QueryCategoriasFilter: TZQuery;
    btnRefrescarGrillaPasadas: TAeroButton;
    btnExportarExcelPosicionesSC: TAeroButton;
    ZROQTomaTiempostiempo_pasada: TWideStringField;
    btnAgregarPasadaConNumero: TAeroButton;
    DSFilterPiloto: TDataSource;
    lblFilterCampeonato: TcxLabel;
    cmbFilterPiloto: TDBLookupComboBox;
    btnMinDiferencia: TAeroButton;
    ZFilterPiloto: TZReadOnlyQuery;
    scExcelExportPosiciones: TscExcelExport;
    btnExportarExcelPosicionesSinCat: TAeroButton;
    scExcelExport: TscExcelExport;
    ZSetDifAnt: TZQuery;
    ZSetDifPrim: TZQuery;
    ZMaxVuelta: TZQuery;
    QueryCatByTipoFilter: TZQuery;
    cxGridPosicionesDBTableViewColumn1: TcxGridDBColumn;
    btnAgregarTiempoSinPiloto: TAeroButton;
    ZGetTomaTiempo: TZReadOnlyQuery;
    pTotales: TPanel;
    lblCantidadPilotos: TLabel;
    lblCantPilotosValue: TLabel;
    lblCantPilotosCorriendoValue: TLabel;
    lblCantidadCorriendo: TLabel;
    ZROQCantPilotosCorriendo: TZReadOnlyQuery;
    ZROQCantPilotosLargado: TZReadOnlyQuery;
    cxGridTomaTiempoDBTableViewoid: TcxGridDBColumn;
    ZROQPilotoEnGrilla: TZReadOnlyQuery;
    procedure FormCreate(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure btnStartHoleshot;
    procedure btnStopClick(Sender: TObject);
    procedure cxGridTomaTiempoDBTableViewEditValueChanged(
      Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
    procedure btnEliminarPasadaClick(Sender: TObject);
    procedure btnDeseliminarPasadaClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnAgregarPasadaClick(Sender: TObject);
    procedure btnGenerarGrillaPartidaClick(Sender: TObject);
    procedure btnExportarExcelPosicionesClick(Sender: TObject);
    procedure btnAgregarPasadaConNumeroyTiempoClick(Sender: TObject);
    procedure btnExpXLSTTClick(Sender: TObject);
    procedure ZROQTomaTiemposAfterScroll(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ServidorExecute(AContext: TIdContext);
    procedure Button2Click(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure btnRefrescarGrillaPosicionesClick(Sender: TObject);
    procedure cmbCategoriaKeyPress(Sender: TObject; var Key: Char);
    procedure btnContinuarTomaTiempoClick(Sender: TObject);
    procedure btnExportarTelefonicoClick(Sender: TObject);
    procedure scExcelExportGetFieldDataType(Sender: TObject;
      const IntFieldIndex: Integer; var FieldDataType: TFieldType);
    procedure cmbTomaTiempoEventoCloseUp(Sender: TObject);
    procedure btnRefrescarGrillaPasadasClick(Sender: TObject);
    procedure btnExportarExcelPosicionesSCClick(Sender: TObject);
    procedure btnAgregarPasadaConNumeroClick(Sender: TObject);
    procedure btnMinDiferenciaClick(Sender: TObject);
    procedure scExcelExportPosicionesGetCellStyleEvent(Sender: TObject;
      Field: TField; var ColorBackground: TColor; FontCell: TxlFont);
    procedure scExcelExportPosicionesGetFieldValue(Sender: TObject;
      const IntFieldIndex: Integer; var VarValue: Variant);
    procedure btnExportarExcelPosicionesSinCatClick(Sender: TObject);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure btnAgregarTiempoSinPilotoClick(Sender: TObject);
  private
    procedure RefreshTomaTiempo;
    procedure RefreshPosiciones;
    procedure RefreshPreservePosition;
    procedure RefreshPilotCount;
    procedure setTListItemsByString(errorListView : TcxListView; stringMessage: String; AClear: Boolean = True);
    procedure updateButtonState(state : Boolean);
    procedure updateGridRows;
    procedure InitializeTranslation;
    function ExtractRutaTranslation: String;
    function validateStartRace: Boolean;
    function validateContinueRace: Boolean;
    function validateExportPosSinCat: Boolean;
    function validateExportRace: Boolean;
    function validatePositionRace: Boolean;
    procedure addTomaTiempo;
    function getPositionSQL(TomaTiempoEventoOID : Integer): String;
    function getExportPositionSQL(TomaTiempoEventoOID, TipoCategoriaOID : Integer): String;
    function getExportPositionTelefonicoSQL(TomaTiempoEventoOID : Integer): String;
    function ExistePilotoEnGrilla(pilotoOID, tipoCategoriaOID, eventoOID: Integer): Boolean;

    procedure startReadingAntena(TomaTiempoOID : Integer);
    procedure stopReadingAntena;
    procedure AThreadTerminate(Sender: TObject);

    procedure Split(const Delimiter: Char; Input: String; const Strings: TStrings);
    procedure refreshDataSetPreservePosition(Query : TDataSet);

    procedure selectCombosByDate;

    function getCategoriasByTomaTiempo(TomaTiempoEventoOID : Integer): String;
    function getCategoriasByTipoCategoria(TipoCategoriaOID : Integer): String;
  public
    constructor Create(owner: TComponent);
  end;

  type
  TCommThread = class(TThread)
  private
    fKeepRuning: Boolean;
    fTomaTiempoOID: Integer;
    fMemo: TMemo;
    fMemoAppendText: String;
    fOwner: TTomaTiempos; // <-- Guardamos la referencia a TTomaTiempos
    procedure CopyMemoTextToString;
    procedure AppendLineToText;
  protected
    procedure Execute; override;
    property KeepRuning: Boolean read fKeepRuning write fKeepRuning;
    property TomaTiempoOID: Integer read fTomaTiempoOID write fTomaTiempoOID;
  public
    // Actualizamos el constructor para recibir a TTomaTiempos
    constructor Create(AOwner: TTomaTiempos; Memo: TMemo);
  end;

  var
  isRaceStarted: Boolean;
  tomaTiempoEvento: Integer;
  AThread: TCommThread;
  tipoCategoriaByEvento : TDictionary<Integer, Integer>;
implementation

{$R *.dfm}

procedure TTomaTiempos.refreshDataSetPreservePosition(Query : TDataSet);
begin
  Query.DisableControls;
  try
    Query.Close;
    Query.Open;
  finally
    Query.EnableControls;
  end;
end;

constructor TTomaTiempos.Create(owner: TComponent);
begin
  inherited Create(owner);
  isRaceStarted:= False;
  InitializeTranslation;
end;

function TTomaTiempos.ExtractRutaTranslation: String;
begin
  Result:= ExtractFileDir(paramstr(0))+'\gridTranslation.ini';
end;

procedure TTomaTiempos.RefreshTomaTiempo;
begin
    with ZROQTomaTiempos do
      begin
        Close;
        ParamByName('toma_tiempo_evento_oid').AsInteger:= tomaTiempoEvento;
        Open;
        Last;
      end;

    RefreshPilotCount;
end;

procedure TTomaTiempos.RefreshPosiciones;
var
  tomaTiempoEventoVO: TTomaTiempoEventoVO;
begin
    with ZReSetPosition do
      begin
        Close;
        ParamByName('posicion').AsInteger:= 0;
        ExecSQL;
      end;

    with ZROQPosiciones do
      begin
        Close;
        SQL.Text:= getPositionSQL(tomaTiempoEvento);
        ParamByName('toma_tiempo_evento_oid').AsInteger:= tomaTiempoEvento;
        Open;
      end;

      tomaTiempoEventoVO:= TBussinessDataSubsystemFacade.getInstance
        .getTomaTiempoEventoVO(tomaTiempoEvento);
      //MemoLectuas.Lines.Text:= tomaTiempoEventoVO.TagText;

    cxGridPosicionesDBTableView.ViewData.Expand(True);
end;

procedure TTomaTiempos.RefreshPilotCount;
begin
    with ZROQCantPilotosCorriendo do
      begin
        Close;
        ParamByName('toma_tiempo_evento_oid').AsInteger:= tomaTiempoEvento;
        Open;
        Last; // <--- Obliga a Zeos a ir al final y contar TODO

        // Usamos RecordCount y lo convertimos a String para el Caption
        lblCantPilotosCorriendoValue.Caption := IntToStr(RecordCount);
      end;

    with ZROQCantPilotosLargado do
      begin
        Close;
        ParamByName('toma_tiempo_evento_oid').AsInteger:= tomaTiempoEvento;
        Open;
        Last; // <--- Obliga a Zeos a ir al final y contar TODO

        // Usamos RecordCount y lo convertimos a String para el Caption
        lblCantPilotosValue.Caption := IntToStr(RecordCount);
      end;
end;

procedure TTomaTiempos.RefreshPreservePosition;
var
  tomaTiempoEventoVO: TTomaTiempoEventoVO;
begin
    with ZROQTomaTiempos do
      begin
        Close;
        ParamByName('toma_tiempo_evento_oid').AsInteger:= tomaTiempoEvento;
        Open;
        Last;
      end;

    with ZGetTomaTiempo do
      begin
        Close;
        ParamByName('toma_tiempo_evento_oid').AsInteger:= tomaTiempoEvento;
        Open;
        Last;
      end;

    with ZReSetPosition do
      begin
        Close;
        ParamByName('posicion').AsInteger:= 0;
        ExecSQL;
      end;

    with ZROQPosiciones do
      begin
        Close;
        SQL.Text:= getPositionSQL(tomaTiempoEvento);
        ParamByName('toma_tiempo_evento_oid').AsInteger:= tomaTiempoEvento;
        Open;
      end;

      RefreshPilotCount;

      tomaTiempoEventoVO:= TBussinessDataSubsystemFacade.getInstance
        .getTomaTiempoEventoVO(tomaTiempoEvento);
      //MemoLectuas.Lines.Text:= tomaTiempoEventoVO.TagText;

    cxGridPosicionesDBTableView.ViewData.Expand(True);
end;

procedure TTomaTiempos.scExcelExportGetFieldDataType(Sender: TObject;
  const IntFieldIndex: Integer; var FieldDataType: TFieldType);
begin
  FieldDataType:= TFieldType.ftWideString;
end;

procedure TTomaTiempos.scExcelExportPosicionesGetCellStyleEvent(Sender: TObject;
  Field: TField; var ColorBackground: TColor; FontCell: TxlFont);
var
  posicion : Integer;
begin
  if Field.FieldName = 'Pos' then
    begin
      FontCell.Style:= [fsBold];
    end;

  if Field.FieldName = 'Localidad' then
      FontCell.Size:= 6;

  if Field.FieldName = 'Rec.' then
      FontCell.Size:= 6;

  if Field.Dataset.FieldByName('Pos').Value < 6 then
    begin
        FontCell.Style:= [fsBold];
    end;

  posicion:= Field.Dataset.FieldByName('Pos').Value;
  if ((posicion mod 2) = 0) then
    begin
        ColorBackground:= clcxLightGray;
    end;

  if ((Field.FieldName = 'maxvuelta') or
        (Field.FieldName = '@tant:= tiempo_sec') or
          (Field.FieldName = 'tprim')) then
    begin
        FontCell.Color:= clWhite;
    end;

end;

procedure TTomaTiempos.scExcelExportPosicionesGetFieldValue(Sender: TObject;
  const IntFieldIndex: Integer; var VarValue: Variant);
begin
//  if AnsiStartsStr(Field.FieldName, 'Tiemp.') then
//  if IntFieldIndex = 5 then
 //  begin
//    VarValue:= Copy(VarToStr(VarValue), 0, 11);
//  end;

  VarValue := ZExcelExport.Fields[IntFieldIndex].Value;

  if SameText(ZExcelExport.Fields[IntFieldIndex].FieldName,'Localidad') then
    VarValue := '00'+ZExcelExport.Fields[IntFieldIndex].AsString;
end;

procedure TTomaTiempos.ServidorExecute(AContext: TIdContext);
var
  sMensaje: String;
begin
  sMensaje := AContext.Connection.Socket.ReadLn;
//  Mensaje.Lines.Add( 'De: ' + AContext.Binding.PeerIP );
//  Mensaje.Lines.Add( 'Mensaje: ' + sMensaje );
end;

function TTomaTiempos.getCategoriasByTomaTiempo(TomaTiempoEventoOID : Integer): String;
var
  categoriasIn: String;
  firstItemFlag : Boolean;
begin
    with QueryCategoriasFilter do
      begin
        Close;
        ParamByName('toma_tiempo_evento_oid').AsInteger:= TomaTiempoEventoOID;
        Open;
      end;

  categoriasIn:= '';
  firstItemFlag:= True;
  with QueryCategoriasFilter do
    begin
      First;
      while not EOF do
        begin
          if (not firstItemFlag) then
            categoriasIn:= categoriasIn + ', ';
          categoriasIn:= categoriasIn + FieldByName('oid').AsString;
          firstItemFlag:= False;
          Next;
        end;
    end;

    Result:= categoriasIn;
end;

function TTomaTiempos.getCategoriasByTipoCategoria(TipoCategoriaOID : Integer): String;
var
  categoriasIn: String;
  firstItemFlag : Boolean;
begin
    with QueryCatByTipoFilter do
      begin
        Close;
        ParamByName('tipo_categoria_oid').AsInteger:= TipoCategoriaOID;
        Open;
      end;

  categoriasIn:= '';
  firstItemFlag:= True;
  with QueryCatByTipoFilter do
    begin
      First;
      while not EOF do
        begin
          if (not firstItemFlag) then
            categoriasIn:= categoriasIn + ', ';
          categoriasIn:= categoriasIn + FieldByName('oid').AsString;
          firstItemFlag:= False;
          Next;
        end;
    end;

    Result:= categoriasIn;
end;


function TTomaTiempos.getPositionSQL(TomaTiempoEventoOID : Integer): String;
var
  sqlStringPrefix, sqlStringSufix, categoriasIn: String;
  eventoVO : TEvento;
  eventoPuntoControlVO : TEventoPuntoControl;
  i : Integer;
begin
  categoriasIn:= getCategoriasByTomaTiempo(tomaTiempoEvento);

// version 1
  sqlStringPrefix:= 'select sel_nro_moto_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid) nro_moto, ' +
//       ' CONCAT(p.apellido, ' + QuotedStr(', ') + ' , p.nombre) as nombre_piloto, ' +
       ' CASE WHEN c.utiliza_acompaniante = 1 THEN CONCAT(UC_Words(CONCAT(p.apellido, ' + QuotedStr(', ') + ' , p.nombre)), IFNULL(UC_Words(CONCAT(' + QuotedStr(' / ') + ', n.apellido, ' + QuotedStr(', ') + ' , n.nombre)), ' + QuotedStr(' ') + '))' +
       ' ELSE UC_Words(CONCAT(p.apellido, ' + QuotedStr(', ') + ' , p.nombre)) END AS nombre_piloto, ' +
       ' sel_nombre_categoria_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid) categoria, ' +
       ' sel_handicup_by_evento_and_piloto_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid) handicup, ' +
       ' sel_recargo_by_toma_tiempo_evento_and_piloto_and_tipo_categoria(tte.oid, ipe.tipo_categoria_oid, ipe.piloto_oid) recargo,' +
       ' sel_total_time(tt.toma_tiempo_evento_oid, tt.piloto_oid) tiempo_sec, ' +
       ' sel_formatted_total_time(sel_total_time(tt.toma_tiempo_evento_oid, tt.piloto_oid)) formated_tiempo_sec, ' +
//       ' TIME_FORMAT(sel_total_time_time_format(tt.toma_tiempo_evento_oid, tt.piloto_oid),' + QuotedStr('%H:%i:%s.%f') + ') formated_tiempo_sec, ' +
       ' sel_can_vueltas(tt.toma_tiempo_evento_oid, tt.piloto_oid) max_nro_vuelta ';


  sqlStringPrefix:=
    'select @posicion:= case when @cat_ant != subquery.categoria then 0 else @posicion end, ' +
    '   @posicion:=@posicion+1 AS Pos, ' +
    '   subquery.*, ' +
    '   @cat_ant:= subquery.categoria ' +
    ' FROM ( ' +
    ' select sel_nro_moto_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid) nro_moto, ' +
       ' CASE WHEN c.utiliza_acompaniante = 1 THEN CONCAT(UC_Words(CONCAT(p.apellido, ' + QuotedStr(', ') + ' , p.nombre)), IFNULL(UC_Words(CONCAT(' + QuotedStr(' / ') + ', n.apellido, ' + QuotedStr(', ') + ' , n.nombre)), ' + QuotedStr(' ') + '))' +
       ' ELSE UC_Words(CONCAT(p.apellido, ' + QuotedStr(', ') + ' , p.nombre)) END AS nombre_piloto, ' +
       ' sel_nombre_categoria_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid) categoria, ' +
       ' sel_handicup_by_evento_and_piloto_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid) handicup, ' +
       ' sel_recargo_by_toma_tiempo_evento_and_piloto_and_tipo_categoria(tte.oid, ipe.tipo_categoria_oid, ipe.piloto_oid) recargo,' +
       ' sel_total_time(tt.toma_tiempo_evento_oid, tt.piloto_oid) tiempo_sec, ' +
       ' sel_formatted_total_time(sel_total_time(tt.toma_tiempo_evento_oid, tt.piloto_oid)) formated_tiempo_sec, ' +
       ' sel_can_vueltas(tt.toma_tiempo_evento_oid, tt.piloto_oid) max_nro_vuelta';


  eventoVO:= TBussinessDataSubsystemFacade.getInstance.getEvento(cmbEvento.KeyValue);

  if (eventoVO.PuntoDeControl.Count>0) then
    begin
      for eventoPuntoControlVO in eventoVO.PuntoDeControl do
        begin
            sqlStringPrefix:= sqlStringPrefix + ', sel_lap_time(:toma_tiempo_evento_oid, p.oid, '+IntToStr(eventoPuntoControlVO.NumeroPuntoControl)+') vuelta_'+IntToStr(eventoPuntoControlVO.NumeroPuntoControl);
        end;
    end
  else
    begin
      for i:= 1 to eventoVO.NroVueltas do
        begin
          sqlStringPrefix:= sqlStringPrefix + ', sel_lap_time(:toma_tiempo_evento_oid, p.oid, '+IntToStr(i)+') vuelta_'+IntToStr(i);
        end;
    end;

  sqlStringSufix:= ' from toma_tiempos tt ' +
     ' join toma_tiempo_evento tte on tt.toma_tiempo_evento_oid = tte.oid ' +
     ' join piloto p on tt.piloto_oid = p.oid ' +
     ' join inscripcion_piloto_evento ipe on (ipe.evento_oid = tte.evento_oid and ipe.piloto_oid = tt.piloto_oid) ' +
     //' left join navegante n on n.piloto_oid = p.oid, categorias c ' +
     ' left join navegante n on n.piloto_oid = p.oid ' +
     ' join categorias c on c.oid = IFNULL(tt.categoria_oid, sel_categoria_oid_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, ipe.evento_oid, ipe.piloto_oid))' +
     ' where tte.oid = :toma_tiempo_evento_oid ' +
//     ' and c.oid = sel_categoria_oid_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, ipe.evento_oid, ipe.piloto_oid) ';
     ' and ipe.tipo_categoria_oid = c.tipo_categoria_oid ';
      // 1. Agregamos el group by solo si es necesario
      if (categoriasIn <> '') then
        sqlStringSufix := sqlStringSufix + ' group by p.oid ';
      // 2. Agregamos el cierre de la subquery SIEMPRE
      sqlStringSufix := sqlStringSufix + ' order by categoria, max_nro_vuelta desc, tiempo_sec asc, tt.oid asc ) AS subquery';

  Result:= sqlStringPrefix + sqlStringSufix;
end;

function TTomaTiempos.getExportPositionSQL(TomaTiempoEventoOID, TipoCategoriaOID : Integer): String;
var
  sqlStringPrefix, sqlStringSufix, categoriasIn: String;
  eventoVO : TEvento;
  eventoPuntoControlVO : TEventoPuntoControl;
  i : Integer;
begin
  if (TipoCategoriaOID <> 4) then
    categoriasIn:= getCategoriasByTomaTiempo(tomaTiempoEvento)
  else
    categoriasIn:= getCategoriasByTipoCategoria(TipoCategoriaOID);


  eventoVO:= TBussinessDataSubsystemFacade.getInstance.getEvento(cmbEvento.KeyValue);

  sqlStringPrefix:=
       'SELECT @posicion:=@posicion+1 AS Pos, ' +
       ' subquery.nro as ' + QuotedStr('Nro.') + ', ' +
       ' subquery.Categoria, ' +
       ' subquery.categoria_externa as ' + QuotedStr('Categoría Externa') + ', ' +
       ' subquery.piloto_navegante as ' + QuotedStr('Piloto / Navegante') + ', ' +
       ' subquery.Localidad ';

        for i:= 1 to eventoVO.NroVueltas do
          sqlStringPrefix:= sqlStringPrefix + ', subquery.vuelta_'+IntToStr(i) + QuotedStr('Tiemp. V. #'+IntToStr(i));

        sqlStringPrefix:= sqlStringPrefix +
       ', CONCAT(sel_formatted_total_time(case when @posicion = 1 then 0 when @maxvuelta > VTot then 0 when @tant = 0 then 0 when @tant > tiempo_sec then 0 else tiempo_sec - @tant end), ' + QuotedStr('.') + ') ' + QuotedStr('Dif. Ant.') + ', ' +
       ' CONCAT(sel_formatted_total_time(case when @posicion = 1 then 0 when @maxvuelta > VTot then 0 when @tprim = 0 then 0 when @tprim > tiempo_sec then 0 else tiempo_sec - @tprim end), ' + QuotedStr('.') + ') ' + QuotedStr('Dif. Prim.') + ', ' +
       //' CASE WHEN @posicion = 1 THEN CONCAT(sel_formatted_total_time(0), ' + QuotedStr('.') + ') WHEN @maxvuelta > VTot then CONCAT((@maxvuelta - VTot), ' + QuotedStr(' V') + ') ELSE CONCAT(sel_formatted_total_time(CASE WHEN @posicion = 0 THEN 0 WHEN @tant = 0 then 0 WHEN @tant > tiempo_sec THEN 0 ELSE tiempo_sec - @tant END), ' + QuotedStr('.') + ') END ' + QuotedStr('Dif. Prim.') + ', ' +

       ' subquery.tiempo_neto as ' + QuotedStr('Tiempo Neto') + ', ' +
       ' subquery.tiempo_total as ' + QuotedStr('Tiempo Total') + ', ' +
       ' subquery.VTot, ' +
       ' subquery.Hand, ' +
       ' subquery.Rec, ' +
       ' subquery.desc_rec as ' + QuotedStr('Desc. Rec.') + ', ' +
       ' @tant:= tiempo_sec, ' +
       ' @maxvuelta:= case when @posicion = 1 then VTot else @maxvuelta end maxvuelta, ' +
       ' @tprim := case when @posicion = 1 then tiempo_sec else @tprim end tprim ' +
       ' FROM ( ' +
       ' SELECT sel_nro_moto_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid) nro , ' +
       ' c.nombre as Categoria, ' +
       ' cat_ext.nombre as categoria_externa, ' +
       ' CASE WHEN c.utiliza_acompaniante = 1 THEN CONCAT(UC_Words(CONCAT(p.apellido, ' + QuotedStr(', ') + ' , p.nombre)), IFNULL(UC_Words(CONCAT(' + QuotedStr(' / ') + ', n.apellido, ' + QuotedStr(', ') + ' , n.nombre)), ' + QuotedStr(' ') + '))' +
       ' ELSE UC_Words(CONCAT(p.apellido, ' + QuotedStr(', ') + ' , p.nombre))END AS ' + QuotedStr('piloto_navegante') + ', ' +
       ' l.localidad Localidad ';

  if (eventoVO.PuntoDeControl.Count>0) then
    begin
      for eventoPuntoControlVO in eventoVO.PuntoDeControl do
        sqlStringPrefix:= sqlStringPrefix + ', CONCAT(sel_lap_time(tt.toma_tiempo_evento_oid, p.oid, '+IntToStr(eventoPuntoControlVO.NumeroPuntoControl)+'), ' + QuotedStr('.') + ') ' + QuotedStr(eventoPuntoControlVO.Nombre);
    end
  else
    begin
      for i:= 1 to eventoVO.NroVueltas do
        sqlStringPrefix:= sqlStringPrefix + ', CONCAT(sel_lap_time(tt.toma_tiempo_evento_oid, p.oid, '+IntToStr(i)+'), ' + QuotedStr('.') + ') ' + QuotedStr('vuelta_'+IntToStr(i));
    end;

  sqlStringSufix:= ', CONCAT(sel_formatted_total_time(sel_total_time_neta(tt.toma_tiempo_evento_oid, tt.piloto_oid)), ' + QuotedStr('.') + ') ' + QuotedStr('tiempo_neto') + ', ' +
        ' CONCAT(sel_formatted_total_time(sel_total_time(tt.toma_tiempo_evento_oid, tt.piloto_oid)), ' + QuotedStr('.') + ') ' + QuotedStr('tiempo_total') + ', ' +
        ' sel_can_vueltas(tt.toma_tiempo_evento_oid, tt.piloto_oid) VTot, ' +
        ' sel_handicup_by_evento_and_piloto_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid) ' + QuotedStr('Hand') + ', ' +
        ' sel_recargo_by_toma_tiempo_evento_and_piloto_and_tipo_categoria(tte.oid, ipe.tipo_categoria_oid, ipe.piloto_oid) ' + QuotedStr('Rec') + ', ' +
        ' sel_rec_desc_by_toma_tiempo_evento_and_piloto_and_tipo_categoria(tte.oid, ipe.tipo_categoria_oid, ipe.piloto_oid) ' + QuotedStr('desc_rec') + ', ' +
        ' sel_total_time(tt.toma_tiempo_evento_oid, tt.piloto_oid) tiempo_sec ' +
     ' from toma_tiempos tt ' +
     ' join toma_tiempo_evento tte on tt.toma_tiempo_evento_oid = tte.oid ' +
     ' join piloto p on tt.piloto_oid = p.oid ' +
     ' left join localidad l on p.localidad_oid = l.oid ' +
     ' left join categorias cat_ext on cat_ext.oid = p.categoria_externa_oid ' +
     ' join inscripcion_piloto_evento ipe on (ipe.evento_oid = tte.evento_oid and ipe.piloto_oid = tt.piloto_oid) ' +
     ' left join navegante n on n.piloto_oid = p.oid, categorias c ' +
     ' where tte.oid = :toma_tiempo_evento_oid ';
     if (TipoCategoriaOID <> 4) then
      begin
        sqlStringSufix:= sqlStringSufix + ' and (:categoria_oid is null or :categoria_oid = 0 or :categoria_oid = sel_categoria_oid_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid)) '+
       ' and c.oid = sel_categoria_oid_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, ipe.evento_oid, ipe.piloto_oid) ';
      end;
     if (categoriasIn <> '') then
        sqlStringSufix:= sqlStringSufix + ' and sel_categoria_oid_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid) in (' + categoriasIn + ')';
     sqlStringSufix:= sqlStringSufix + ' group by p.oid ' +
     ' order by VTot desc, sel_total_time(tt.toma_tiempo_evento_oid, tt.piloto_oid) asc, tt.oid asc) subquery ';

  Result:= sqlStringPrefix + sqlStringSufix;
end;

function TTomaTiempos.getExportPositionTelefonicoSQL(TomaTiempoEventoOID : Integer): String;
var
  sqlStringPrefix, sqlStringSufix, categoriasIn: String;
  eventoVO : TEvento;
  eventoPuntoControlVO : TEventoPuntoControl;
  i : Integer;
begin
  categoriasIn:= getCategoriasByTomaTiempo(tomaTiempoEvento);

  sqlStringPrefix:= 'select p.telefono Telefono, sel_nro_moto_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid) ' + QuotedStr('Nro. Moto') + ', ' +
       ' CONCAT(p.apellido, ' + QuotedStr(', ') + ' , p.nombre) as Piloto, ' +
       ' sel_nombre_categoria_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid) Categoria' ;

  eventoVO:= TBussinessDataSubsystemFacade.getInstance.getEvento(cmbEvento.KeyValue);

  if (eventoVO.PuntoDeControl.Count>0) then
    begin
      for eventoPuntoControlVO in eventoVO.PuntoDeControl do
        begin
            sqlStringPrefix:= sqlStringPrefix + ', CONCAT(sel_lap_time(tt.toma_tiempo_evento_oid, p.oid, '+IntToStr(eventoPuntoControlVO.NumeroPuntoControl)+'), ' + QuotedStr('.') + ') ' + QuotedStr(eventoPuntoControlVO.Nombre);
        end;
    end
  else
    begin
      for i:= 1 to eventoVO.NroVueltas do
        begin
      sqlStringPrefix:= sqlStringPrefix + ', CONCAT(sel_lap_time(tt.toma_tiempo_evento_oid, p.oid, '+IntToStr(i)+'), ' + QuotedStr('.') + ') ' + QuotedStr('Vuelta #'+IntToStr(i));
        end;
    end;

  sqlStringSufix:= ', sel_handicup_by_evento_and_piloto_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid) Handicup, ' +
        ' sel_recargo_by_toma_tiempo_evento_and_piloto_and_tipo_categoria(tte.oid, ipe.tipo_categoria_oid, ipe.piloto_oid) Recargo, ' +
        ' CONCAT(sel_formatted_total_time(sel_total_time(tt.toma_tiempo_evento_oid, tt.piloto_oid)), ' + QuotedStr('.') + ') ' + QuotedStr('Tiempo Total') +
     ' from toma_tiempos tt ' +
     ' join toma_tiempo_evento tte on tt.toma_tiempo_evento_oid = tte.oid ' +
     ' join piloto p on tt.piloto_oid = p.oid ' +
     ' join inscripcion_piloto_evento ipe on ' +
          ' (ipe.evento_oid = tte.evento_oid and ipe.piloto_oid = tt.piloto_oid) ' +
     ' where tte.oid = :toma_tiempo_evento_oid ' +
     ' and (:categoria_oid is null or :categoria_oid = 0 or :categoria_oid = sel_categoria_oid_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid)) ';
     if (categoriasIn <> '') then
        sqlStringSufix:= sqlStringSufix + ' and sel_categoria_oid_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid) in (' + categoriasIn + ')';
     sqlStringSufix:= sqlStringSufix + ' group by p.oid ' +
     ' order by Categoria, sel_can_vueltas(tt.toma_tiempo_evento_oid, tt.piloto_oid) desc, sel_total_time(tt.toma_tiempo_evento_oid, tt.piloto_oid) asc, tt.oid asc';

  Result:= sqlStringPrefix + sqlStringSufix;
end;

procedure TTomaTiempos.addTomaTiempo;
begin
  if (isRaceStarted) then
    begin
      TBussinessDataSubsystemFacade.getInstance.addTomaTiempo(tomaTiempoEvento, 0);
      RefreshPreservePosition;
      cxGridTomaTiempoDBTableViewnro_moto.Focused := True;
    end;
end;

procedure TTomaTiempos.updateButtonState(state : Boolean);
begin
  btnStop.Enabled:= state;
  btnAgregarPasadaConNumeroyTiempo.Enabled:= state;
  btnAgregarPasadaConNumero.Enabled:= state;
  btnAgregarTiempoSinPiloto.Enabled:= state;
  btnEliminarPasada.Enabled:= state;
  btnDeseliminarPasada.Enabled:= state;

  cmbCampeonato.Enabled:= not state;
  cmbEvento.Enabled:= not state;
  cmbNroLargada.Enabled:= not state;
  txtNombre.Enabled:= not state;
  cmbTomaTiempoEventoCont.Enabled:= not state;

  btnStart.Enabled:= not state;
  btnContinuarTomaTiempo.Enabled:= not state;

  btnGenerarGrillaPartida.Enabled:= not state;

  isRaceStarted:= state;
end;

procedure TTomaTiempos.updateGridRows;
var
  i : Integer;
  eventoVO : TEvento;
  AColumn: TcxGridDBColumn;
  eventoPuntoControlVO : TEventoPuntoControl;
begin
  //Clear All Columns
  for i := 1 to cxGridPosicionesDBTableView.ColumnCount do
    begin
        cxGridPosicionesDBTableView.Columns[0].Free
    end;

  eventoVO:= TBussinessDataSubsystemFacade.getInstance.getEvento(cmbEvento.KeyValue);

  AColumn:= cxGridPosicionesDBTableView.CreateColumn;
  AColumn.DataBinding.ValueType:= 'Integer';
  AColumn.DataBinding.FieldName:= 'Pos';
  AColumn.Caption:= 'Pos';
  AColumn.Width:= 10;

  AColumn:= cxGridPosicionesDBTableView.CreateColumn;
  AColumn.DataBinding.ValueType:= 'Integer';
  AColumn.DataBinding.FieldName:= 'nro_moto';
  AColumn.Caption:= 'Nro. Moto';
  AColumn.Width:= 25;

  AColumn:= cxGridPosicionesDBTableView.CreateColumn;
  AColumn.DataBinding.ValueType:= 'String';
  AColumn.DataBinding.FieldName:= 'categoria';
  AColumn.Caption:= 'Categoría';
  AColumn.GroupIndex:= 0;
  AColumn.Visible:= False;
  AColumn.SortOrder:= soAscending;

  AColumn:= cxGridPosicionesDBTableView.CreateColumn;
  AColumn.DataBinding.ValueType:= 'String';
  AColumn.DataBinding.FieldName:= 'nombre_piloto';
  AColumn.Caption:= 'Piloto';
  AColumn.Width:= 110;

  if (eventoVO.PuntoDeControl.Count>0) then
    begin
      for eventoPuntoControlVO in eventoVO.PuntoDeControl do
        begin
          AColumn:= cxGridPosicionesDBTableView.CreateColumn;
          AColumn.DataBinding.ValueType:= 'String';
          AColumn.DataBinding.FieldName:= 'vuelta_'+IntToStr(eventoPuntoControlVO.NumeroPuntoControl);
          AColumn.Caption:= eventoPuntoControlVO.Nombre;
          AColumn.Width:= 30;
        end;
    end
  else
    begin
      for i:= 1 to eventoVO.NroVueltas do
        begin
          AColumn:= cxGridPosicionesDBTableView.CreateColumn;
          AColumn.DataBinding.ValueType:= 'String';
          AColumn.DataBinding.FieldName:= 'vuelta_'+IntToStr(i);
          AColumn.Caption:= 'Vuelta #'+IntToStr(i);
          AColumn.Width:= 30;
        end;
    end;

  AColumn:= cxGridPosicionesDBTableView.CreateColumn;
  AColumn.DataBinding.ValueType:= 'Integer';
  AColumn.DataBinding.FieldName:= 'handicup';
  AColumn.Caption:= 'Handicup';
  AColumn.Width:= 30;

  AColumn:= cxGridPosicionesDBTableView.CreateColumn;
  AColumn.DataBinding.ValueType:= 'Integer';
  AColumn.DataBinding.FieldName:= 'recargo';
  AColumn.Caption:= 'Recargo';
  AColumn.Width:= 30;

  AColumn:= cxGridPosicionesDBTableView.CreateColumn;
  AColumn.DataBinding.ValueType:= 'String';
  AColumn.DataBinding.FieldName:= 'max_nro_vuelta';
  AColumn.Caption:= 'Vueltas';
  AColumn.Width:= 30;

  AColumn:= cxGridPosicionesDBTableView.CreateColumn;
  AColumn.DataBinding.ValueType:= 'String';
  AColumn.DataBinding.FieldName:= 'formated_tiempo_sec';
  AColumn.Caption:= 'Tiempo Total';
  AColumn.Width:= 30;
end;

procedure TTomaTiempos.btnAgregarPasadaClick(Sender: TObject);
begin
  addTomaTiempo;
end;

procedure TTomaTiempos.btnAgregarPasadaConNumeroClick(Sender: TObject);
var
  addTomaTiempoForm : TAddTomaTiempoForm;
  eventoOID, tipoCategoriaOID, categoriaOID, pilotoOID, tomaTiempoOID,
    nroVueltasByCat, nroVueltasByPiloto, tomaTiempoEventoOID : Integer;
  pilotoVO : TPiloto;
  tcPair: TPair<Integer, Integer>;
begin
  if (isRaceStarted) then
    begin
      eventoOID:= ZGetTomaTiempo.FieldByName('evento_oid').AsInteger;
      tomaTiempoEventoOID:= ZGetTomaTiempo.FieldByName('toma_tiempo_evento_oid').AsInteger;

      if NOT tipoCategoriaByEvento.ContainsKey(tomaTiempoEventoOID) then
        begin
          tipoCategoriaOID:= TBussinessDataSubsystemFacade
              .getInstance.getTipoCategoraOIDByEventoAndNroVuelta(tomaTiempoEventoOID);

          tipoCategoriaByEvento.Add(tomaTiempoEventoOID, tipoCategoriaOID);
        end
      else
        begin
          tcPair := tipoCategoriaByEvento.ExtractPair(tomaTiempoEventoOID);
          tipoCategoriaOID:= tcPair.Value;
        end;

      addTomaTiempoForm:= TAddTomaTiempoForm.Create(nil);
      addTomaTiempoForm.eventOID:= eventoOID;
      addTomaTiempoForm.tipoCategoriaOID:= tipoCategoriaOID;
      addTomaTiempoForm.lblTiempo.Visible:= False;
      addTomaTiempoForm.timeEdit.Visible:= False;
      try
        if (addTomaTiempoForm.ShowModal = mrOk) then
          begin
             pilotoOID:= addTomaTiempoForm.pilotoOID;
             categoriaOID:= TBussinessDataSubsystemFacade.getInstance.getPilotoCategoriaOIDByTipoCategoriaOIDAndEventoOID(
                pilotoOID, tipoCategoriaOID, eventoOID);

             nroVueltasByCat:= TBussinessDataSubsystemFacade.getInstance.getNroVueltaByCategoriaAndEvento(eventoOID, categoriaOID);
             nroVueltasByPiloto:= TBussinessDataSubsystemFacade.getInstance.GetNroVuelta(pilotoOID, tomaTiempoEventoOID);

             if ((pilotoOID > 0) and (ExistePilotoEnGrilla(pilotoOID, tipoCategoriaOID, eventoOID))) then
               begin
                TBussinessDataSubsystemFacade.getInstance.addTomaTiempo(tomaTiempoEvento, pilotoOID);
                RefreshTomaTiempo;
                cxGridTomaTiempoDBTableViewnro_moto.Focused := True;

                if ((nroVueltasByCat > 0) and (nroVueltasByPiloto > nroVueltasByCat)) then
                   begin
                      pilotoVO:= TBussinessDataSubsystemFacade.getInstance.getPiloto(pilotoOID);
                      setTListItemsByString(errorListView, 'El Piloto ' + QuotedStr(pilotoVO.getNumeroNombreCompleto(1)) + ' ya completó la totalidad de las vueltas para la categoría. '
                        + IntToStr(nroVueltasByPiloto) + ' de '+ IntToStr(nroVueltasByCat) + ' vueltas');
                    end;
               end;
          end;
      finally
        addTomaTiempoForm.Free;
      end;
  end;
end;

function TTomaTiempos.ExistePilotoEnGrilla(pilotoOID, tipoCategoriaOID, eventoOID: Integer): Boolean;
begin
  with ZROQPilotoEnGrilla do
  begin
    Close;
    ParamByName('piloto_oid').AsInteger := pilotoOID;
    ParamByName('tipo_categoria_oid').AsInteger := tipoCategoriaOID;
    ParamByName('evento_oid').AsInteger := eventoOID;
    Open;

    // Retorna True si la consulta trae al menos 1 registro
    Result := not IsEmpty;
  end;
end;

procedure TTomaTiempos.btnAgregarPasadaConNumeroyTiempoClick(Sender: TObject);
var
  addTomaTiempoForm : TAddTomaTiempoForm;
  eventoOID, tipoCategoriaOID, categoriaOID, pilotoOID, tomaTiempoOID,
    nroVueltasByCat, nroVueltasByPiloto, tomaTiempoEventoOID : Integer;
  pilotoVO : TPiloto;
  tcPair: TPair<Integer, Integer>;
begin
  if (isRaceStarted) then
    begin
      eventoOID:= ZGetTomaTiempo.FieldByName('evento_oid').AsInteger;
      tomaTiempoEventoOID:= ZGetTomaTiempo.FieldByName('toma_tiempo_evento_oid').AsInteger;

      if NOT tipoCategoriaByEvento.ContainsKey(tomaTiempoEventoOID) then
        begin
          tipoCategoriaOID:= TBussinessDataSubsystemFacade
              .getInstance.getTipoCategoraOIDByEventoAndNroVuelta(tomaTiempoEventoOID);

          tipoCategoriaByEvento.Add(tomaTiempoEventoOID, tipoCategoriaOID);
        end
      else
        begin
          tcPair := tipoCategoriaByEvento.ExtractPair(tomaTiempoEventoOID);
          tipoCategoriaOID:= tcPair.Value;
        end;

      addTomaTiempoForm:= TAddTomaTiempoForm.Create(nil);
      addTomaTiempoForm.eventOID:= eventoOID;
      addTomaTiempoForm.tipoCategoriaOID:= tipoCategoriaOID;
      addTomaTiempoForm.lblTiempo.Visible:= Visible;
      addTomaTiempoForm.timeEdit.Visible:= Visible;

      try
        if (addTomaTiempoForm.ShowModal = mrOk) then
          begin
             pilotoOID:= addTomaTiempoForm.pilotoOID;
             categoriaOID:= TBussinessDataSubsystemFacade.getInstance.getPilotoCategoriaOIDByTipoCategoriaOIDAndEventoOID(
                pilotoOID, tipoCategoriaOID, eventoOID);

             nroVueltasByCat:= TBussinessDataSubsystemFacade.getInstance.getNroVueltaByCategoriaAndEvento(eventoOID, categoriaOID);
             nroVueltasByPiloto:= TBussinessDataSubsystemFacade.getInstance.GetNroVuelta(pilotoOID, tomaTiempoEventoOID);

             if ((pilotoOID > 0) and (ExistePilotoEnGrilla(pilotoOID, tipoCategoriaOID, eventoOID))) then
               begin
                TBussinessDataSubsystemFacade.getInstance.addTomaTiempoWithTime(
                  tomaTiempoEvento, pilotoOID, addTomaTiempoForm.timeEdit.Time, false);

                RefreshTomaTiempo;
                cxGridTomaTiempoDBTableViewnro_moto.Focused := True;
                if ((nroVueltasByCat > 0) and (nroVueltasByPiloto > nroVueltasByCat)) then
                  begin
                    pilotoVO:= TBussinessDataSubsystemFacade.getInstance.getPiloto(pilotoOID);
                    setTListItemsByString(errorListView, 'El Piloto ' + QuotedStr(pilotoVO.getNumeroNombreCompleto(1)) + ' ya completó la totalidad de las vueltas para la categoría. '
                      + IntToStr(nroVueltasByPiloto) + ' de '+ IntToStr(nroVueltasByCat) + ' vueltas');
                  end;
               end;
          end;
      finally
        addTomaTiempoForm.Free;
      end;
  end;
end;

procedure TTomaTiempos.btnAgregarTiempoSinPilotoClick(Sender: TObject);
var
  addTomaTiempoGridForm: TTAddTomaTiempoGridForm;
  i, NumMoto, eventoOID, tomaTiempoEventoOID, tipoCategoriaOID, pilotoOID, categoriaOID: Integer;
  nroVueltasByCat, nroVueltasByPiloto : Integer;
  TiempoPasada : TDateTime;
  V: Variant;
  pilotoVO : TPiloto;
begin
  pilotoOID := 0; // Inicializar variable en 0

  if (isRaceStarted) then
    begin
      eventoOID:= ZGetTomaTiempo.FieldByName('evento_oid').AsInteger;
      tomaTiempoEventoOID:= ZGetTomaTiempo.FieldByName('toma_tiempo_evento_oid').AsInteger;

      // Obtenemos el tipo de categoría
      tipoCategoriaOID:= TBussinessDataSubsystemFacade
        .getInstance.getTipoCategoraOIDByEventoAndNroVuelta(tomaTiempoEventoOID);
    
      // En el caso que NO haya grilla de partida, establecemos por defecto en 1
      if (tipoCategoriaOID = 0) then
        tipoCategoriaOID := 1;        

      addTomaTiempoGridForm:= TTAddTomaTiempoGridForm.Create(nil);

      if (addTomaTiempoGridForm.ShowModal = mrOk) then
      begin
        for i := 0 to addTomaTiempoGridForm.cxGridTomaTiempoTableView.DataController.RecordCount - 1 do
        begin
          NumMoto := addTomaTiempoGridForm.cxGridTomaTiempoTableView.
            DataController.Values[i, addTomaTiempoGridForm.cxGridTomaTiempoTableViewPiloto.Index];
          V := addTomaTiempoGridForm.cxGridTomaTiempoTableView.DataController.Values[i,
            addTomaTiempoGridForm.cxGridTomaTiempoTableViewTimestamp.Index];

          // Si usamos SQLTimestamp en el grid, lo convertimos de vuelta a TDateTime de forma segura
            if not VarIsNull(V) then
              TiempoPasada := SQLTimestampToDateTime(VarToSQLTimestamp(V))
            else
              TiempoPasada := 0;

             if (NumMoto > 0) then
             begin
               pilotoOID:= TBussinessDataSubsystemFacade.getInstance.getPilotoOIDByNumMotoAndTipoCategoria(NumMoto, TipoCategoriaOID, eventoOID);

               if ((pilotoOID > 0) and (ExistePilotoEnGrilla(pilotoOID, tipoCategoriaOID, eventoOID))) then
                 begin
                  TBussinessDataSubsystemFacade.getInstance.addTomaTiempoWithTime(
                    tomaTiempoEvento, pilotoOID, TiempoPasada, false);

                 {categoriaOID:= TBussinessDataSubsystemFacade.getInstance.getPilotoCategoriaOIDByTipoCategoriaOIDAndEventoOID(
                    pilotoOID, tipoCategoriaOID, eventoOID);
                 nroVueltasByCat:= TBussinessDataSubsystemFacade.getInstance.getNroVueltaByCategoriaAndEvento(eventoOID, categoriaOID);
                 nroVueltasByPiloto:= TBussinessDataSubsystemFacade.getInstance.GetNroVuelta(pilotoOID, tomaTiempoEventoOID);
                 if ((nroVueltasByCat > 0) and (nroVueltasByPiloto > nroVueltasByCat)) then
                 begin
                    pilotoVO:= TBussinessDataSubsystemFacade.getInstance.getPiloto(pilotoOID);
                    setTListItemsByString(errorListView, 'El Piloto ' + QuotedStr(pilotoVO.getNumeroNombreCompleto(1)) + ' ya completó la totalidad de las vueltas para la categoría. '
                      + IntToStr(nroVueltasByPiloto) + ' de '+ IntToStr(nroVueltasByCat) + ' vueltas', False);
                 end;}
               end;
             end;
        end;
        RefreshTomaTiempo;
      end;
    end;
 end;

procedure TTomaTiempos.btnContinuarTomaTiempoClick(Sender: TObject);
var
  eventoOID, nroLargada: Integer;
begin
  if (validateContinueRace) then
    begin
      eventoOID:= cmbEvento.KeyValue;
      tomaTiempoEvento:= cmbTomaTiempoEventoCont.KeyValue;

      updateButtonState(True);
      updateGridRows;

      RefreshPreservePosition;

      if (TF_EE_Message.ShowMessage(TComponent(Self),'¿Iniciar lectura antena?',
        '¿Desea continuar la toma de tiempo con lectura de antena?', TF_EE_Message.QUESTION, False) = mrOk) then
          begin
            startReadingAntena(tomaTiempoEvento);
          end;
    end;
end;

procedure TTomaTiempos.btnDeseliminarPasadaClick(Sender: TObject);
var
  oid : Integer;
begin
  oid:= ZROQTomaTiempos.FieldByName('oid').AsInteger;
  TBussinessDataSubsystemFacade.getInstance.updateEstadoTomaTiempo(0, oid);
  RefreshTomaTiempo;
end;

procedure TTomaTiempos.btnEliminarPasadaClick(Sender: TObject);
var
  i: Integer;
  oid: Integer;
  Rec: TcxCustomGridRecord;
  ColOid: TcxGridDBColumn;
begin
  cxGridTomaTiempoDBTableView.BeginUpdate;
  try
    for i := 0 to cxGridTomaTiempoDBTableView.Controller.SelectedRecordCount - 1 do
    begin
      Rec := cxGridTomaTiempoDBTableView.Controller.SelectedRecords[i];

      // Obtenemos el valor usando el índice de la columna encontrada
      oid := Rec.Values[cxGridTomaTiempoDBTableViewoid.Index];

      TBussinessDataSubsystemFacade.getInstance.updateEstadoTomaTiempo(1, oid);
    end;
  finally
    cxGridTomaTiempoDBTableView.EndUpdate;
  end;

  RefreshTomaTiempo;
end;
{var
  oid : Integer;
begin
  oid:= ZROQTomaTiempos.FieldByName('oid').AsInteger;
  TBussinessDataSubsystemFacade.getInstance.updateEstadoTomaTiempo(1 , oid);
  RefreshTomaTiempo;
end;}

procedure TTomaTiempos.btnExportarExcelPosicionesClick(Sender: TObject);
var
  categoriaVO : TCategoria;
begin
  if (validatePositionRace) then
    begin
      ZReSetPosition.Close;
      ZReSetPosition.ParamByName('posicion').AsInteger:= 0;
      ZReSetPosition.ExecSQL;

      ZSetDifPrim.Close;
      ZSetDifPrim.ParamByName('tprim').AsInteger:= 0;
      ZSetDifPrim.ExecSQL;

      ZSetDifAnt.Close;
      ZSetDifAnt.ParamByName('tant').AsInteger:= 0;
      ZSetDifAnt.ExecSQL;

      ZMaxVuelta.Close;
      ZMaxVuelta.ParamByName('maxvuelta').AsInteger:= 0;
      ZMaxVuelta.ExecSQL;


      categoriaVO:= TBussinessDataSubsystemFacade.getInstance.getCategoria(cmbCategoria.KeyValue);
      with ZExcelExport do
      begin
        DisableControls;
        try
          Close;
          SQL.Text:= getExportPositionSQL(cmbTomaTiempoEvento.KeyValue, categoriaVO.TipoCategoriaOID);
          ParamByName('toma_tiempo_evento_oid').AsInteger:= cmbTomaTiempoEvento.KeyValue;
          if (cmbCategoria.KeyValue > 0) then
            begin
              if (categoriaVO.TipoCategoriaOID <>4) then
                ParamByName('categoria_oid').AsInteger:= cmbCategoria.KeyValue
//              else
  //              ParamByName('categoria_oid').AsInteger:= 0
            end;

          Open;

          // Ya que en la primera llamada no establece bien la diferencia, cierro y vuelvo a abrir
          ZReSetPosition.Close;
          ZReSetPosition.ParamByName('posicion').AsInteger:= 0;
          ZReSetPosition.ExecSQL;

          Close;
          Open;
        finally
          EnableControls;
        end;
      end;

      with scExcelExportPosiciones do
        begin
          LoadDefaultProperties;
          Dataset:= ZExcelExport;
          WorksheetName := 'Posiciones';
          StyleColumnWidth:= cwAutoFit;
          FontTitles.Style:= [fsBold];
          FontTitles.Size:= 7;
          FontHeader.Size:= 7;

          FontData.Size:= 7;

          Borderdata.LineStyle:= blContinuous;

          HeaderText.Text := cmbCategoria.Text;
          BorderHeader.BackColor:= clSilver;

          BeginRowHeader:= 1;
          BeginRowTitles := 2;

          ExportDataset;
          Disconnect;
        end;
    end;
end;

procedure TTomaTiempos.btnExportarExcelPosicionesSCClick(Sender: TObject);
var
  categoriaVO : TCategoria;
begin
  if (validateExportPosSinCat) then
    begin
      ZReSetPosition.ParamByName('posicion').AsInteger:= 0;
      ZReSetPosition.ExecSQL;
      ZSetDifAnt.ExecSQL;
      ZSetDifPrim.ExecSQL;
      ZMaxVuelta.ExecSQL;

      categoriaVO:= TBussinessDataSubsystemFacade.getInstance.getCategoria(cmbCategoria.KeyValue);
      with ZExcelExport do
      begin
        DisableControls;
        try
          Close;
          SQL.Text:= getExportPositionSQL(cmbTomaTiempoEvento.KeyValue, categoriaVO.TipoCategoriaOID);
          ParamByName('toma_tiempo_evento_oid').AsInteger:= cmbTomaTiempoEvento.KeyValue;
          if (cmbCategoria.KeyValue > 0) then
            ParamByName('categoria_oid').AsInteger:= cmbCategoria.KeyValue;
          Open;
        finally
          EnableControls;
        end;
      end;

      scExcelExport.Dataset:= ZExcelExport;
      scExcelExport.WorksheetName := 'Posiciones';
      scExcelExport.ExportDataset;
      scExcelExport.Disconnect;
    end;
end;

procedure TTomaTiempos.btnExportarExcelPosicionesSinCatClick(Sender: TObject);
var
  categoriaVO : TCategoria;
begin
  if (validateExportPosSinCat) then
    begin
      ZReSetPosition.ParamByName('posicion').AsInteger:= 0;
      ZReSetPosition.ExecSQL;
      ZSetDifAnt.ExecSQL;
      ZSetDifPrim.ExecSQL;
      ZMaxVuelta.ExecSQL;

      categoriaVO:= TBussinessDataSubsystemFacade.getInstance.getCategoria(cmbCategoria.KeyValue);
      with ZExcelExport do
      begin
        DisableControls;
        try
          Close;
          SQL.Text:= getExportPositionSQL(cmbTomaTiempoEvento.KeyValue, categoriaVO.TipoCategoriaOID);
          ParamByName('toma_tiempo_evento_oid').AsInteger:= cmbTomaTiempoEvento.KeyValue;
          Open;
        finally
          EnableControls;
        end;
      end;

      with scExcelExportPosiciones do
        begin
          LoadDefaultProperties;
          Dataset:= ZExcelExport;
          WorksheetName := 'Posiciones';
          StyleColumnWidth:= cwAutoFit;
          FontTitles.Style:= [fsBold];
          FontTitles.Size:= 7;
          FontHeader.Size:= 7;

          FontData.Size:= 7;

          Borderdata.LineStyle:= blContinuous;

          HeaderText.Text := cmbCategoria.Text;
          BorderHeader.BackColor:= clSilver;

          //BorderData.BackAlternateColor := clGrayText;
          BeginRowHeader:= 1;

          BeginRowTitles := 2;

          ExportDataset;
          Disconnect;
        end;
    end;
end;

procedure TTomaTiempos.btnExportarTelefonicoClick(Sender: TObject);
begin
  if (validateExportRace) then
    begin
      with ZExcelExport do
      begin
        DisableControls;
        try
          Close;
          SQL.Text:= getExportPositionTelefonicoSQL(cmbTomaTiempoEvento.KeyValue);
          ParamByName('toma_tiempo_evento_oid').AsInteger:= cmbTomaTiempoEvento.KeyValue;
          if (cmbCategoria.KeyValue > 0) then
            ParamByName('categoria_oid').AsInteger:= cmbCategoria.KeyValue;
          Open;
        finally
          EnableControls;
        end;
      end;

      scExcelExport.Dataset:= ZExcelExport;
      scExcelExport.WorksheetName := 'Telefonico';
      scExcelExport.StyleColumnWidth:=cwAutoFit;
      scExcelExport.ExportDataset;
      scExcelExport.Disconnect;
    end;
end;

procedure TTomaTiempos.btnExpXLSTTClick(Sender: TObject);
begin
  if (validateExportRace) then
    begin
      with ZROQTomaTiemposExp do
      begin
        DisableControls;
        try
          Close;
          ParamByName('toma_tiempo_evento_oid').AsInteger:= cmbTomaTiempoEvento.KeyValue;
          if (cmbFilterPiloto.KeyValue > 0) then
            ParamByName('piloto_oid').AsInteger:= cmbFilterPiloto.KeyValue;
          Open;
        finally
          EnableControls;
        end;
      end;

      scExcelExport.Dataset:= ZROQTomaTiemposExp;
      scExcelExport.WorksheetName := 'Toma de Tiempos';
      scExcelExport.StyleColumnWidth:=cwAutoFit;
      scExcelExport.ExportDataset;
      scExcelExport.Disconnect;
    end;
end;

procedure TTomaTiempos.btnGenerarGrillaPartidaClick(Sender: TObject);
begin
  if (cmbEvento.KeyValue > 0) then
    with TGrillaPartida.Create(nil, cmbEvento.KeyValue) do
      begin
        if (ShowModal = mrYes) then
          begin
            cmbNroLargada.KeyValue := nroLargada;
            txtNombre.Text:= 'HOLESHOT';
            btnStartHoleshot;
          end;
        Free;

        refreshDataSetPreservePosition(NroDeLargadaByEvento);
      end
  else
    TF_EE_Message.ShowMessage(TComponent(Self),'¡Seleccione el Evento!',
        'Debe seleccionar el Evento', TF_EE_Message.WARNING, False)
end;

procedure TTomaTiempos.btnMinDiferenciaClick(Sender: TObject);
begin
  if (validateExportPosSinCat) then
    begin
      with ZExcelExport do
      begin
          Close;
          SQL.Text:= 'DROP TABLE IF EXISTS temp_lap_time;';
          ExecSQL;
      end;

      with ZExcelExport do
      begin
          Close;
          SQL.Text:= 'CREATE TEMPORARY TABLE temp_lap_time ' +
            ' SELECT vueltas.nro_vuelta, sel_lap_time_in_seconds(tt.toma_tiempo_evento_oid, tt.piloto_oid, vueltas.nro_vuelta) tiempo_vuelta,  sel_nro_moto_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid) nro_moto, ' +
            ' CONCAT(p.apellido, ' + QuotedStr(', ') + ' , p.nombre) as nombre_piloto, ' +
            ' sel_nombre_categoria_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid) Categoria, ' +
            ' sel_formatted_total_time(sel_total_time(tt.toma_tiempo_evento_oid, tt.piloto_oid)) tiempo_total, ' +
            ' sel_can_vueltas(tt.toma_tiempo_evento_oid, tt.piloto_oid) Vueltas, l.localidad Localidad ' +

            ' from (select oid as nro_vuelta from piloto where oid < 10) vueltas, toma_tiempos tt' +
            ' join toma_tiempo_evento tte on tt.toma_tiempo_evento_oid = tte.oid' +
            ' join piloto p on tt.piloto_oid = p.oid' +
            ' left join localidad l on p.localidad_oid = l.oid' +
            ' join inscripcion_piloto_evento ipe on (ipe.evento_oid = tte.evento_oid and ipe.piloto_oid = tt.piloto_oid)' +

            ' where tte.oid = :toma_tiempo_evento_oid' +
            ' group by p.oid, vueltas.nro_vuelta';

          ParamByName('toma_tiempo_evento_oid').AsInteger:= cmbTomaTiempoEvento.KeyValue;
          ExecSQL;
      end;

            with ZExcelExport do
      begin
        DisableControls;
        try
          Close;
          SQL.Text:= 'SELECT CONCAT(sel_formatted_total_time(min(tiempo_vuelta)), ' + QuotedStr('.') + ') ' + QuotedStr('Tiempo Maximo') +
            ', CONCAT(sel_formatted_total_time(max(tiempo_vuelta)), ' + QuotedStr('.') + ') ' + QuotedStr('Tiempo Minimo') + ', ' +
            ' CONCAT(sel_formatted_total_time(max(tiempo_vuelta) - min(tiempo_vuelta)), ' + QuotedStr('.') + ') ' + QuotedStr('Segundos de Diferencia') + ', nro_moto ' + QuotedStr('Nro. Moto') +
            ', nombre_piloto as Competidor ' +
            ', Categoria, Localidad, CONCAT(tiempo_total, ' + QuotedStr('.') + ') ' + QuotedStr('Tiempo Total') + ', Vueltas ' +
            ' FROM temp_lap_time WHERE tiempo_vuelta > 0 ' +
            ' GROUP BY ' + QuotedStr('Nro. Moto') + ', Categoria, Localidad, ' + QuotedStr('Tiempo Total') + ', Vueltas ' +
            ' ORDER BY Vueltas DESC, Categoria, (max(tiempo_vuelta) - min(tiempo_vuelta)) ';
          Open;
        finally
          EnableControls;
        end;
      end;


      scExcelExport.Dataset:= ZExcelExport;
      scExcelExport.WorksheetName := 'Minima Diferencia de Tiempo';
      scExcelExport.ExportDataset;
      scExcelExport.Disconnect;
    end;
end;

procedure TTomaTiempos.btnRefrescarGrillaPasadasClick(Sender: TObject);
begin
  RefreshTomaTiempo;
end;

procedure TTomaTiempos.btnRefrescarGrillaPosicionesClick(Sender: TObject);
begin
  RefreshPosiciones;
end;

function TTomaTiempos.validateStartRace: Boolean;
var
  resultado : Boolean;
begin
  resultado:= True;

    if not (cmbEvento.KeyValue > 0) then
      begin
        TF_EE_Message.ShowMessage(TComponent(Self),'¡Seleccione el Evento!',
          'Debe seleccionar el Evento', TF_EE_Message.INFORMATION, True);
        resultado:= False;
      end;

    if not (cmbNroLargada.KeyValue > 0) then
      begin
        TF_EE_Message.ShowMessage(TComponent(Self),'¡Seleccione el Nro. de Largada!',
          'Debe seleccionar el Nro. de Largada', TF_EE_Message.INFORMATION, True);
        resultado:= False;
      end;

  Result:= resultado;
end;

function TTomaTiempos.validateContinueRace: Boolean;
var
  resultado : Boolean;
begin
  resultado:= True;

    if not (cmbEvento.KeyValue > 0) then
      begin
        TF_EE_Message.ShowMessage(TComponent(Self),'¡Seleccione el Evento!',
          'Debe seleccionar el Evento', TF_EE_Message.INFORMATION, True);
        resultado:= False;
      end;

    if not (cmbTomaTiempoEventoCont.KeyValue > 0) then
      begin
        TF_EE_Message.ShowMessage(TComponent(Self),'¡Seleccione la Toma de Tiempos!',
          'Debe seleccionar la Toma de Tiempos', TF_EE_Message.INFORMATION, True);
        resultado:= False;
      end;

  Result:= resultado;
end;

function TTomaTiempos.validateExportPosSinCat: Boolean;
var
  resultado : Boolean;
begin
  resultado:= True;

    if not (cmbEvento.KeyValue > 0) then
      begin
        TF_EE_Message.ShowMessage(TComponent(Self),'¡Seleccione el Evento!',
          'Debe seleccionar el Evento', TF_EE_Message.INFORMATION, True);
        resultado:= False;
      end;

    if not (cmbTomaTiempoEvento.KeyValue > 0) then
      begin
        TF_EE_Message.ShowMessage(TComponent(Self),'¡Seleccione la Toma de Tiempos!',
          'Debe seleccionar la Toma de Tiempos', TF_EE_Message.INFORMATION, True);
        resultado:= False;
      end;

  Result:= resultado;
end;

function TTomaTiempos.validatePositionRace: Boolean;
var
  resultado : Boolean;
begin
  resultado:= True;

    if not (cmbEvento.KeyValue > 0) then
      begin
        TF_EE_Message.ShowMessage(TComponent(Self),'¡Seleccione el Evento!',
          'Debe seleccionar el Evento', TF_EE_Message.INFORMATION, True);
        resultado:= False;
      end;

    if not (cmbTomaTiempoEvento.KeyValue > 0) then
      begin
        TF_EE_Message.ShowMessage(TComponent(Self),'¡Seleccione la Toma de Tiempos!',
          'Debe seleccionar la Toma de Tiempos', TF_EE_Message.INFORMATION, True);
        resultado:= False;
      end;

    if not (cmbCategoria.KeyValue > 0) then
      begin
        TF_EE_Message.ShowMessage(TComponent(Self),'¡Seleccione una Categoría!',
          'Debe seleccionar una Categoría', TF_EE_Message.INFORMATION, True);
        resultado:= False;
      end;

  Result:= resultado;
end;

function TTomaTiempos.validateExportRace: Boolean;
var
  resultado : Boolean;
begin
  resultado:= True;

    if not (cmbEvento.KeyValue > 0) then
      begin
        TF_EE_Message.ShowMessage(TComponent(Self),'¡Seleccione el Evento!',
          'Debe seleccionar el Evento', TF_EE_Message.INFORMATION, True);
        resultado:= False;
      end;

    if not (cmbTomaTiempoEvento.KeyValue > 0) then
      begin
        TF_EE_Message.ShowMessage(TComponent(Self),'¡Seleccione la Toma de Tiempos!',
          'Debe seleccionar la Toma de Tiempos', TF_EE_Message.INFORMATION, True);
        resultado:= False;
      end;

  Result:= resultado;
end;

procedure TTomaTiempos.ZROQTomaTiemposAfterScroll(DataSet: TDataSet);
var
  isDeleted: Integer;
begin
  if ZROQTomaTiempos.Active = True then
  begin
    isDeleted:= ZROQTomaTiempos.FieldByName('deleted_val').AsInteger;

    if (isDeleted = 1) then
    begin
      btnDeseliminarPasada.Enabled:= True;
      btnEliminarPasada.Enabled:= False;
    end;

    if (isDeleted = 0) then
    begin
      btnDeseliminarPasada.Enabled:= False;
      btnEliminarPasada.Enabled:= True;
    end;
  end;
end;

procedure TTomaTiempos.btnStartHoleshot;
var
  eventoOID : Integer;
  nroLargada : SmallInt;
begin
  if (validateStartRace) then
    begin
      eventoOID:= cmbEvento.KeyValue;
      nroLargada:= cmbNroLargada.KeyValue;
      with ZGrillaPartida do
        begin
          Close;
          ParamByName('evento_oid').AsInteger:= cmbEvento.KeyValue;
          Open;

          if (RecordCount > 0) then
            begin
              updateButtonState(True);
              updateGridRows;

              tomaTiempoEvento:= TBussinessDataSubsystemFacade.getInstance
                .addTomaTiempoEvento(txtNombre.Text, 'CARRERA', cmbEvento.KeyValue);

              with ZInsertTomaTiempos do
                begin
                  Close;
                  ParamByName('evento_oid').AsInteger:= eventoOID;
                  ParamByName('toma_tiempo_evento_oid').AsInteger:= tomaTiempoEvento;
                  ParamByName('nro_largada').AsSmallInt:= nroLargada;
                  ExecSQL;
                end;

             RefreshPreservePosition;
             refreshDataSetPreservePosition(ZTomaTiempoEvento);
             refreshDataSetPreservePosition(ZTomaTiempoEventoCont);
           end
           else
            TF_EE_Message.ShowMessage(TComponent(Self),'¡Grilla de Partida!',
              '¡Debe generar la grilla de partida!', TF_EE_Message.WARNING, True)
        end;
    end;
end;

procedure TTomaTiempos.btnStartClick(Sender: TObject);
var
  eventoOID : Integer;
  nroLargada : SmallInt;
begin
  if (validateStartRace) then
    begin
      eventoOID:= cmbEvento.KeyValue;
      nroLargada:= cmbNroLargada.KeyValue;
      with ZGrillaPartida do
        begin
          Close;
          ParamByName('evento_oid').AsInteger:= cmbEvento.KeyValue;
          Open;

          if (RecordCount > 0) then
            begin

              updateButtonState(True);
              updateGridRows;

              tomaTiempoEvento:= TBussinessDataSubsystemFacade.getInstance
                .addTomaTiempoEvento(txtNombre.Text, 'CARRERA', cmbEvento.KeyValue);

              with ZInsertTomaTiempos do
                begin
                  Close;
                  ParamByName('evento_oid').AsInteger:= eventoOID;
                  ParamByName('toma_tiempo_evento_oid').AsInteger:= tomaTiempoEvento;
                  ParamByName('nro_largada').AsSmallInt:= nroLargada;
                  ExecSQL;
                end;

             RefreshPreservePosition;
             refreshDataSetPreservePosition(ZTomaTiempoEvento);
             refreshDataSetPreservePosition(ZTomaTiempoEventoCont);

             if (TF_EE_Message.ShowMessage(TComponent(Self),'¿Iniciar lectura antena?',
              '¿Desea iniciar la toma de tiempo con lectura de antena?', TF_EE_Message.QUESTION, False) = mrOk) then
                begin
                  startReadingAntena(tomaTiempoEvento);
                end;
           end
           else
            TF_EE_Message.ShowMessage(TComponent(Self),'¡Grilla de Partida!',
              '¡Debe generar la grilla de partida!', TF_EE_Message.WARNING, True)
        end;
    end;
end;

procedure TTomaTiempos.btnStopClick(Sender: TObject);
begin
   if (TF_EE_Message.ShowMessage(TComponent(Self),'¡Detener Carrera!',
        '¿Está seguro que desea detener la toma de tiempos de la carrera?', TF_EE_Message.QUESTION, True) = mrOk) then
    begin
      updateButtonState(False);
      refreshDataSetPreservePosition(ZTomaTiempoEvento);
      refreshDataSetPreservePosition(ZTomaTiempoEventoCont);

      AThread.KeepRuning:= False;
      Timer.Enabled:= False;
    end;
end;

procedure TTomaTiempos.Button2Click(Sender: TObject);
begin
  AThread.KeepRuning:= False;
end;

procedure TTomaTiempos.cmbCategoriaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #8 then
    TDBLookupComboBox(Sender).KeyValue:= 0;
end;

procedure TTomaTiempos.cmbTomaTiempoEventoCloseUp(Sender: TObject);
var
  tipoCategoriaOID : Integer;
begin
  if (cmbTomaTiempoEvento.KeyValue > 0) then
    begin
      with QueryCategorias do
        begin
          Close;
          ParamByName('toma_tiempo_evento_oid').AsInteger:= cmbTomaTiempoEvento.KeyValue;
          Open;
        end;

    tipoCategoriaOID:= TBussinessDataSubsystemFacade
        .getInstance.getTipoCategoraOIDByEventoAndNroVuelta(cmbTomaTiempoEvento.KeyValue);
    with ZFilterPiloto do
      begin
        Close;
        ParamByName('evento_oid').AsInteger:= cmbEvento.KeyValue;
        ParamByName('toma_tiempo_evento_oid').AsInteger:= cmbTomaTiempoEvento.KeyValue;
        ParamByName('tipo_categoria_oid').AsInteger:= tipoCategoriaOID;
        Open;
      end;
    end;
end;

procedure TTomaTiempos.cxGridTomaTiempoDBTableViewEditValueChanged(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
var
  numPiloto : String;
  tomaTiempoOID, pilotoOID, eventoOID, tipoCategoriaOID,
    categoriaOID, nroVueltasByCat, nroVueltasByPiloto, tomaTiempoEventoOID: Integer;
  pilotoVO : TPiloto;
begin
  if ((cxGridTomaTiempoDBTableViewnro_moto = AItem)) then
    with ZROQTomaTiempos do
    begin
      validationPanel.Visible:= False;

      Sender.DataController.PostEditingData;

      numPiloto:= AItem.EditValue;
      if (numPiloto > '') then
        begin
          tomaTiempoOID:= FieldByName('oid').AsInteger;

          pilotoOID:= TBussinessDataSubsystemFacade.getInstance
            .getPilotoOIDByNumMotoAndTipoCategoria(StrToIntDef(numPiloto, 0), 1, eventoOID);

          if (pilotoOID > 0) then
            begin
             eventoOID:= FieldByName('evento_oid').AsInteger;
             tomaTiempoEventoOID:= cmbTomaTiempoEventoCont.KeyValue;

             tipoCategoriaOID:= TBussinessDataSubsystemFacade.getInstance.getTipoCategoraOIDByEventoAndNroVuelta(tomaTiempoEventoOID);
             categoriaOID:= TBussinessDataSubsystemFacade.getInstance.getPilotoCategoriaOIDByTipoCategoriaOIDAndEventoOID(
                pilotoOID, tipoCategoriaOID, eventoOID);

             nroVueltasByCat:= TBussinessDataSubsystemFacade.getInstance.getNroVueltaByCategoriaAndEvento(eventoOID, categoriaOID);
             nroVueltasByPiloto:= TBussinessDataSubsystemFacade.getInstance.GetNroVuelta(pilotoOID, tomaTiempoOID);

             if ((nroVueltasByCat = 0) or (nroVueltasByPiloto <= nroVueltasByCat)) then
               begin
                 TBussinessDataSubsystemFacade.getInstance.updatePilotoToTomaTiempo(pilotoOID, tomaTiempoOID);
                 RefreshPreservePosition;
               end
             else
                begin
                  pilotoVO:= TBussinessDataSubsystemFacade.getInstance.getPiloto(pilotoOID);
                  setTListItemsByString(errorListView, 'El Piloto ' + QuotedStr(pilotoVO.getNumeroNombreCompleto(1)) + ' ya completó la totalidad de las vueltas para la categoría. '
                    + IntToStr(nroVueltasByPiloto) + ' de '+ IntToStr(nroVueltasByCat) + ' vueltas');  
                  Sender.DataController.Cancel;
                end;
            end
          else
            begin
              setTListItemsByString(errorListView, 'No se encuentra el Piloto con el número ' + numPiloto + ' .');            
              Sender.DataController.Cancel;
            end;
        end;
    end;
end;

procedure TTomaTiempos.FormCreate(Sender: TObject);
begin
  ZCampeonato.Active:= True;
  ZEvento.Active:= True;
  NroDeLargadaByEvento.Active:= True;
  ZTomaTiempoEvento.Active:= True;
  ZTomaTiempoEventoCont.Active:= True;

  tipoCategoriaByEvento := TDictionary<Integer, Integer>.Create;

  selectCombosByDate;
end;

procedure TTomaTiempos.FormKeyPress(Sender: TObject; var Key: Char);
begin
//  if Key = #13 then
//    begin
//      addTomaTiempo;
//      Key := #0;
//    end;
end;

procedure TTomaTiempos.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
    if (cmbCampeonato.Focused) then
        cmbCampeonato.Perform(WM_KEYDOWN, VK_DOWN, 0);
    if (cmbEvento.Focused) then
        cmbEvento.Perform(WM_KEYDOWN, VK_DOWN, 0);
    if (cmbFilterPiloto.Focused) then
        cmbFilterPiloto.Perform(WM_KEYDOWN, VK_DOWN, 0);
    if (cmbCategoria.Focused) then
        cmbCategoria.Perform(WM_KEYDOWN, VK_DOWN, 0);
    if (cmbNroLargada.Focused) then
        cmbNroLargada.Perform(WM_KEYDOWN, VK_DOWN, 0);
    if (cmbTomaTiempoEventoCont.Focused) then
        cmbTomaTiempoEventoCont.Perform(WM_KEYDOWN, VK_DOWN, 0);
end;

procedure TTomaTiempos.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
    if (cmbCampeonato.Focused) then
        cmbCampeonato.Perform(WM_KEYDOWN, VK_UP, 0);
    if (cmbEvento.Focused) then
        cmbEvento.Perform(WM_KEYDOWN, VK_UP, 0);
    if (cmbFilterPiloto.Focused) then
        cmbFilterPiloto.Perform(WM_KEYDOWN, VK_UP, 0);
    if (cmbCategoria.Focused) then
        cmbCategoria.Perform(WM_KEYDOWN, VK_UP, 0);
    if (cmbNroLargada.Focused) then
        cmbNroLargada.Perform(WM_KEYDOWN, VK_UP, 0);
    if (cmbTomaTiempoEventoCont.Focused) then
        cmbTomaTiempoEventoCont.Perform(WM_KEYDOWN, VK_UP, 0);
end;

procedure TTomaTiempos.setTListItemsByString(errorListView : TcxListView; stringMessage: String; AClear: Boolean = True);
var
  Index : Integer;
  stringList : TStringList;
begin
  stringList:= TStringList.Create;
  stringList.Add(stringMessage);

  // Solo limpia si AClear es True
  if AClear then
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
  topPanel.Visible:= True;
end;

procedure TTomaTiempos.InitializeTranslation;
begin
  cxLocalizer.FileName:= ExtractRutaTranslation;
  cxLocalizer.Active:= True;
  cxLocalizer.Locale:= 11274;
end;

procedure TTomaTiempos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (isRaceStarted) then
    begin
       if (TF_EE_Message.ShowMessage(TComponent(Self),'Cerrar Toma de Tiempo',
          '¿Está seguro de cerrar la ventana durante una toma de tiempo?', TF_EE_Message.QUESTION, False) = mrOk) then
          Action:= caFree
        else
          Action:= caNone;
    end;
end;

procedure TTomaTiempos.startReadingAntena(TomaTiempoOID : Integer);
begin
  if (not Assigned(AThread)) then
  begin
    AThread:= TCommThread.Create(Self, MemoLectuas);

    AThread.KeepRuning:= True;
    AThread.FreeOnTerminate:= True;
    AThread.OnTerminate:= AThreadTerminate;

    AThread.Start;
  end;

  AThread.TomaTiempoOID:= TomaTiempoOID;
  AThread.KeepRuning:= True;
//  Timer.Enabled:= True;
end;

procedure TTomaTiempos.stopReadingAntena;
begin
//  IdTCPClient.Disconnect;
end;

procedure TTomaTiempos.TimerTimer(Sender: TObject);
begin
  RefreshPreservePosition;
end;

procedure TTomaTiempos.AThreadTerminate(Sender: TObject);
var
  stringResult : String;
begin
//  stringResult:= (Sender as TCommThread).Text;
end;

constructor TCommThread.Create;
begin
  inherited Create(True);
  fMemo := Memo;
end;

procedure TCommThread.Execute;
var
  Client: TIdTCPClient;
  SplitList: TStringList;
  readLn : String;
  lecturaTagsAntena : TLecturaTagsAntena;
  lecturaTagOID, nroVueltasByCat, tipoCategoriaOID,
    nroVueltasByPiloto, pilotoOID, categoriaOID: Integer;
  tomaTiempoEventoVO: TTomaTiempoEventoVO;
  tomaTiempoVO: TTomaTiempoVO;
  pilotoVO: TPiloto;
  nowTime : TDateTime;

  FN: String;
  F:TextFile;
begin
  try
    // Getting the filename for the logfile (In this case the Filename is 'application-exename.log'
    FN := ChangeFileExt(Application.Exename, FormatDateTime('yyyymmddhhmmss', Now)+'.log');
    // Assigns Filename to variable F
    AssignFile(F, FN);
    // Rewrites the file F
    Rewrite(F);
    // Open file for appending
    Append(F);

    Client := TIdTCPClient.Create(nil);
    SplitList := TStringList.Create;
    try
      Client.Host:= '192.168.1.100';
      Client.Port:= 14150;
      SplitList.Delimiter:= ',';
      Client.Connect;

      tomaTiempoEventoVO:= TBussinessDataSubsystemFacade.getInstance
        .getTomaTiempoEventoVO(TomaTiempoOID);

        while (Client.Connected) do
          if (KeepRuning) then
            begin
              readLn:= Client.IOHandler.ReadLn;

              try
                  SplitList.Clear;
                  SplitList.DelimitedText:= readLn;

                  if SplitList.Count > 0 then
                  begin
                    lecturaTagsAntena:= TLecturaTagsAntena.Create;
                    lecturaTagsAntena.Timestampux:= StrToInt64(SplitList[1]);
                    lecturaTagsAntena.TagID:= SplitList[0];
                    WriteLn(F, FormatDateTime('[yyyy/mm/dd hh:mm:ss] ', Now) + 'Tag: ' + lecturaTagsAntena.TagID);

                    pilotoOID:= TBussinessDataSubsystemFacade.getInstance.getPilotoOIDByTagID(lecturaTagsAntena.TagID);
                    pilotoVO:= TBussinessDataSubsystemFacade.getInstance.getPiloto(pilotoOID);
                    WriteLn(F, FormatDateTime('[yyyy/mm/dd hh:mm:ss] ', Now) + 'PilotoOID: ' + IntToStr(pilotoOID));
                    tipoCategoriaOID:= TBussinessDataSubsystemFacade.getInstance
                      .getTipoCategoraOIDByEventoAndNroVuelta(tomaTiempoOID);
                    WriteLn(F, FormatDateTime('[yyyy/mm/dd hh:mm:ss] ', Now) + 'TipoCategoriaOID:' + IntToStr(TipoCategoriaOID));
                    categoriaOID:= TBussinessDataSubsystemFacade.getInstance.getPilotoCategoriaOIDByTipoCategoriaOIDAndEventoOID(
                      pilotoOID, tipoCategoriaOID, tomaTiempoEventoVO.EventoOID);
                    WriteLn(F, FormatDateTime('[yyyy/mm/dd hh:mm:ss] ', Now) + 'categoriaOID:' + IntToStr(categoriaOID));
                    nroVueltasByCat:= TBussinessDataSubsystemFacade.getInstance
                      .getNroVueltaByCategoriaAndEvento(tomaTiempoEventoVO.EventoOID, categoriaOID);
                    WriteLn(F, FormatDateTime('[yyyy/mm/dd hh:mm:ss] ', Now) + 'nroVueltasByCat:' + IntToStr(nroVueltasByCat));
                    nroVueltasByPiloto:= TBussinessDataSubsystemFacade.getInstance.GetNroVuelta(pilotoOID, TomaTiempoOID);
                    WriteLn(F, FormatDateTime('[yyyy/mm/dd hh:mm:ss] ', Now) + 'nroVueltasByPiloto:' + IntToStr(nroVueltasByPiloto));

                    Synchronize(CopyMemoTextToString);
                    //TBussinessDataSubsystemFacade.getInstance.editTomaTiempoEventoTagText(TomaTiempoOID, fMemoAppendText);
                   if ((Assigned(pilotoVO)) and (fOwner.ExistePilotoEnGrilla(pilotoOID, tipoCategoriaOID, tomaTiempoEventoVO.EventoOID))) then
                     begin
                      lecturaTagOID:= TBussinessDataSubsystemFacade.getInstance
                        .saveLecturaTagsAntena(lecturaTagsAntena);
                      WriteLn(F, FormatDateTime('[yyyy/mm/dd hh:mm:ss] ', Now) + 'lecturaOID:' + IntToStr(lecturaTagOID));
                      nowTime:= Now;
                      if ((nroVueltasByCat = 0) or (nroVueltasByPiloto <= nroVueltasByCat)) then
                        begin
                          WriteLn(F, FormatDateTime('[yyyy/mm/dd hh:mm:ss] ', Now) + 'getTomaTiempoVO ');
                          tomaTiempoVO:= TBussinessDataSubsystemFacade.getInstance
                            .getTomaTiempoVO(TomaTiempoOID, pilotoOID, nroVueltasByPiloto -1);
                          WriteLn(F, FormatDateTime('[yyyy/mm/dd hh:mm:ss] ', Now) + 'getTomaTiempoVO OK');

                          if (Assigned(tomaTiempoVO)) then
                            begin
                              WriteLn(F, FormatDateTime('[yyyy/mm/dd hh:mm:ss] ', Now) + 'tomaTiempoVO:' + IntToStr(tomaTiempoVO.OID));

                              if (SecondsBetween(nowTime, tomaTiempoVO.TiempoPasada)>60) then
                                begin
                                  TBussinessDataSubsystemFacade.getInstance.addTomaTiempoWithTagReference(TomaTiempoOID, lecturaTagOID,
                                    nowTime, lecturaTagsAntena.TagID);
                                  WriteLn(F, FormatDateTime('[yyyy/mm/dd hh:mm:ss] ', Now) + 'Add Toma Tiempo:' + lecturaTagsAntena.TagID);

                                  fMemoAppendText:= FormatDateTime('hh:mm:ss', nowTime)+' | '+pilotoVO.getNumeroNombreCompleto(tipoCategoriaOID);
                                  Synchronize(AppendLineToText);
                                end
                              else
                                begin
                                  fMemoAppendText:= FormatDateTime('hh:mm:ss', nowTime)+' | '+pilotoVO.getNumeroNombreCompleto(tipoCategoriaOID)+' | [Tiempo mínimo entre pasadas]';
                                  Synchronize(AppendLineToText);
                                end;
                            end
                          else
                            begin
                              WriteLn(F, FormatDateTime('[yyyy/mm/dd hh:mm:ss] ', Now) + 'tomaTiempoVO: no asignado');

                              TBussinessDataSubsystemFacade.getInstance.addTomaTiempoWithTagReference(TomaTiempoOID, lecturaTagOID,
                                nowTime, lecturaTagsAntena.TagID);
                              WriteLn(F, FormatDateTime('[yyyy/mm/dd hh:mm:ss] ', Now) + 'Add Toma Tiempo:' + lecturaTagsAntena.TagID);

                              fMemoAppendText:= FormatDateTime('hh:mm:ss', nowTime)+' | '+pilotoVO.getNumeroNombreCompleto(tipoCategoriaOID);
                              Synchronize(AppendLineToText);
                            end;
                        end
                      else
                        begin
                          TBussinessDataSubsystemFacade.getInstance.addTomaTiempoWithTagReference(TomaTiempoOID, lecturaTagOID,
                            nowTime, lecturaTagsAntena.TagID);

                          fMemoAppendText:= FormatDateTime('hh:mm:ss', nowTime)+' | '+pilotoVO.getNumeroNombreCompleto(tipoCategoriaOID)+' | [Máximo de vueltas superado]';
                          Synchronize(AppendLineToText);
                        end;
                     end
                   else
                      begin
                          fMemoAppendText:= FormatDateTime('hh:mm:ss', nowTime)+' | '+lecturaTagsAntena.TagID+' | [Tag sin asociar]';
                          Synchronize(AppendLineToText);
                      end;
                  end;
              except
                on EZSQL:EZSQLException do
                  begin
                      fMemoAppendText:= FormatDateTime('[yyyy/mm/dd hh:mm:ss] ', Now) + 'PERDIDA DE CONEXION CON BD. Mensaje: ' + QuotedStr(EZSQL.Message);
                      Synchronize(AppendLineToText);
                      WriteLn(F, fMemoAppendText);

                      Sleep(5000);
                      fMemoAppendText:= FormatDateTime('[yyyy/mm/dd hh:mm:ss] ', Now) + 'Intentando Reconectar con Base de Datos';
                      Synchronize(AppendLineToText);
                      try
                        TBussinessDataSubsystemFacade.getInstance.reconectZConnection;
                      except on E: Exception do
                        begin
                          fMemoAppendText:= FormatDateTime('[yyyy/mm/dd hh:mm:ss] ', Now) + '¡Error! Clase: ' + E.ClassName + '. Mensaje: ' + QuotedStr(E.Message);
                          Synchronize(AppendLineToText);
                          WriteLn(F, fMemoAppendText);
                        end;
                      end;
                  end;
                on E:Exception do
                  begin
                      fMemoAppendText:= FormatDateTime('[yyyy/mm/dd hh:mm:ss] ', Now) + '¡Error! Clase: ' + E.ClassName + '. Mensaje: ' + QuotedStr(E.Message);
                      Synchronize(AppendLineToText);
                      WriteLn(F, fMemoAppendText);
                  end;
              end;
            end;
      Client.Disconnect;
    finally
      begin
        Client.Free;
        SplitList.Free;

        CloseFile(F);
      end;
    end;
  except
    on E:Exception do
      begin
        TF_EE_Message.ShowMessage(TComponent(Self), 'Error al conectar con la Antena',
          '¡Error! Clase: ' + E.ClassName + '. Mensaje: ' + QuotedStr(E.Message), TF_EE_Message.ERROR, True)
      end;
  end;
end;

procedure TCommThread.CopyMemoTextToString;
begin
  if (Assigned(fMemo)) then
    begin
      fMemoAppendText:= fMemo.Lines.Text;
    end;
end;

procedure TCommThread.AppendLineToText;
begin
  if (Assigned(fMemo)) then
    begin
      fMemo.Lines.Append(fMemoAppendText);
    end;
end;

procedure TTomaTiempos.Split(const Delimiter: Char; Input: String; const Strings: TStrings);
begin
   Assert(Assigned(Strings)) ;
   Strings.Clear;
   Strings.Delimiter := Delimiter;
   Strings.DelimitedText := Input;
end;

procedure TTomaTiempos.selectCombosByDate;
begin
  with ConnectionModule.GetEventoByDate do
    begin
      Close;
      Open;

      if (RecordCount > 0) then
        begin
          cmbCampeonato.KeyValue:= FieldByName('campeonato_oid').AsInteger;
          cmbEvento.KeyValue:= FieldByName('evento_oid').AsInteger;
        end;
    end;
end;

end.
