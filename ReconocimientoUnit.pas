unit ReconocimientoUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
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
  dxSkinXmas2008Blue, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, Data.DB, cxDBData, Vcl.ComCtrls, ZAbstractRODataset,
  ZAbstractDataset, ZAbstractTable, ZDataset, Vcl.ImgList, cxListView,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, Vcl.StdCtrls, cxGroupBox, cxTextEdit,
  AeroButtons, Vcl.DBCtrls, cxLabel, Vcl.ExtCtrls, JvExExtCtrls,
  JvNetscapeSplitter, F_EEMessage, BussinessDataSubsystemFacade, IdContext,
  IdTCPConnection, IdTCPClient, IdBaseComponent, IdComponent, IdCustomTCPServer,
  IdTCPServer, Entidades, scExcelExport, AddTomaTiempo, DateUtils, ZDbcIntfs,
  DataModule, tmsAdvGridExcel, dxGDIPlusClasses, HotSpotImage, AdvSmoothLabel,
  Vcl.ToolWin;

type
  TReconocimiento = class(TForm)
    rightPanel: TPanel;
    JvNetscapeSplitter: TJvNetscapeSplitter;
    lblCampeonato: TcxLabel;
    cmbCampeonato: TDBLookupComboBox;
    lblEvento: TcxLabel;
    cmbEvento: TDBLookupComboBox;
    btnStart: TAeroButton;
    btnStop: TAeroButton;
    btnAgregarPasada: TAeroButton;
    btnEliminarPasada: TAeroButton;
    btnDeseliminarPasada: TAeroButton;
    lblNombre: TcxLabel;
    txtNombre: TcxTextEdit;
    lblTomaTiempoEvento: TcxLabel;
    cmbTomaTiempoEvento: TDBLookupComboBox;
    btnAgregarPasadaConNumeroYTiempo: TAeroButton;
    btnExpXLSTT: TAeroButton;
    btnRefrescarGrilla: TAeroButton;
    gbLecturas: TcxGroupBox;
    MemoLectuas: TMemo;
    btnContinuarTomaTiempo: TAeroButton;
    lblTomaTiempoEventoCont: TcxLabel;
    cmbTomaTiempoEventoCont: TDBLookupComboBox;
    topPanel: TPanel;
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
    validationPanel: TPanel;
    errorListView: TcxListView;
    cxImageList: TcxImageList;
    ZCampeonato: TZTable;
    DSCampeonato: TDataSource;
    ZEvento: TZReadOnlyQuery;
    DSEvento: TDataSource;
    DSTomaTiempoEventoCont: TDataSource;
    ZTomaTiempoEventoCont: TZReadOnlyQuery;
    ZROQTomaTiempos: TZQuery;
    ZROQTomaTiemposoid: TLargeintField;
    ZROQTomaTiemposnro_moto: TWideStringField;
    ZROQTomaTiemposnombre_piloto: TWideStringField;
    ZROQTomaTiemposis_deleted: TWideStringField;
    ZROQTomaTiemposcategoria: TWideStringField;
    ZROQTomaTiempostiempo: TWideStringField;
    ZROQTomaTiempostipo_categoria_oid: TLargeintField;
    ZROQTomaTiemposevento_oid: TIntegerField;
    ZROQTomaTiemposdeleted_val: TSmallintField;
    DSTomaTiempos: TDataSource;
    ZROQTomaTiemposnro_vuelta: TSmallintField;
    ZROQTomaTiemposExp: TZQuery;
    DSTomaTiempoEvento: TDataSource;
    ZTomaTiempoEvento: TZReadOnlyQuery;
    btnExportarExcelPosiciones: TAeroButton;
    QueryCategoriasFilter: TZQuery;
    cxLabel2: TcxLabel;
    cmbCategoria: TDBLookupComboBox;
    DSCategorias: TDataSource;
    QueryCategorias: TZQuery;
    btnAgregarPasadaConNumero: TAeroButton;
    ZROQTomaTiempostoma_tiempo_evento_oid: TLargeintField;
    ZROQTomaTiempostiempo_pasada: TWideStringField;
    DSTipoCategoria: TDataSource;
    ZTipoCategoria: TZTable;
    ZTable1: TZTable;
    DataSource1: TDataSource;
    cmbTipoCategoria: TDBLookupComboBox;
    lblTipoCategoria: TcxLabel;
    ZReSetPosition: TZQuery;
    ZROQReconocimientoExp: TZQuery;
    scExcelExport: TscExcelExport;
    procedure FormCreate(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure btnContinuarTomaTiempoClick(Sender: TObject);
    procedure btnRefrescarGrillaClick(Sender: TObject);
    procedure btnExpXLSTTClick(Sender: TObject);
    procedure btnAgregarPasadaConNumeroYTiempoClick(Sender: TObject);
    procedure btnEliminarPasadaClick(Sender: TObject);
    procedure btnExportarExcelPosicionesClick(Sender: TObject);
    procedure cmbTomaTiempoEventoCloseUp(Sender: TObject);
    procedure btnDeseliminarPasadaClick(Sender: TObject);
    procedure btnAgregarPasadaConNumeroClick(Sender: TObject);
    procedure cmbCategoriaKeyPress(Sender: TObject; var Key: Char);
  private
    function validateStartReconocimiento: Boolean;
    function validateContinueReconocimiento: Boolean;
    procedure updateButtonState(state : Boolean);
    procedure refreshDataSetPreservePosition(Query : TDataSet);
    procedure startReadingAntena(TomaTiempoOID : Integer);
    procedure selectCombosByDate;
    function getPositionSQL(count:Boolean; TomaTiempoEventoOID : Integer): String;
    function getCategoriasByTomaTiempo(TomaTiempoEventoOID : Integer): String;
  public
    { Public declarations }
  end;

  type
  TCommThread = class(TThread)
  private
    fKeepRuning: Boolean;
    fTomaTiempoOID: Integer;
    fMemo: TMemo;
    fMemoAppendText: String;
    procedure CopyMemoTextToString;
    procedure AppendLineToText;
  protected
    procedure Execute; override;
    property KeepRuning: Boolean read fKeepRuning write fKeepRuning;
    property TomaTiempoOID: Integer read fTomaTiempoOID write fTomaTiempoOID;
  public
    constructor Create(Memo: TMemo);
  end;

var
  isRaceStarted: Boolean;
  tomaTiempoEvento: Integer;
  AThread: TCommThread;

implementation

{$R *.dfm}

procedure TReconocimiento.startReadingAntena(TomaTiempoOID: Integer);
begin
  if (not Assigned(AThread)) then
  begin
    AThread:= TCommThread.Create(MemoLectuas);

    AThread.KeepRuning:= True;
    AThread.FreeOnTerminate:= True;

    AThread.Start;
  end;

  AThread.TomaTiempoOID:= TomaTiempoOID;
  AThread.KeepRuning:= True;

end;

procedure TReconocimiento.refreshDataSetPreservePosition(Query : TDataSet);
begin
  Query.DisableControls;
  try
    Query.Close;
    Query.Open;
  finally
    Query.EnableControls;
  end;
end;

procedure TReconocimiento.updateButtonState(state : Boolean);
begin
  btnStop.Enabled:= state;
  btnAgregarPasada.Enabled:= state;
  btnAgregarPasadaConNumero.Enabled:= state;
  btnAgregarPasadaConNumeroYTiempo.Enabled:= state;
  btnEliminarPasada.Enabled:= state;
  btnDeseliminarPasada.Enabled:= state;

  cmbCampeonato.Enabled:= not state;
  cmbEvento.Enabled:= not state;
  txtNombre.Enabled:= not state;

  btnStart.Enabled:= not state;
  btnContinuarTomaTiempo.Enabled:= not state;

  isRaceStarted:= state;
end;

function TReconocimiento.validateStartReconocimiento: Boolean;
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

    if not (cmbTipoCategoria.KeyValue > 0) then
      begin
        TF_EE_Message.ShowMessage(TComponent(Self),'¡Seleccione el Tipo de Categoría!',
          'Debe seleccionar el Tipo de Categoría', TF_EE_Message.INFORMATION, True);
        resultado:= False;
      end;

  Result:= resultado;
end;

function TReconocimiento.validateContinueReconocimiento: Boolean;
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
        TF_EE_Message.ShowMessage(TComponent(Self),'¡Seleccione la Toma de Tiempo!',
          'Debe seleccionar la Toma de Tiempo', TF_EE_Message.INFORMATION, True);
        resultado:= False;
      end;

    if not (cmbTipoCategoria.KeyValue > 0) then
      begin
        TF_EE_Message.ShowMessage(TComponent(Self),'¡Seleccione el Tipo de Categoría!',
          'Debe seleccionar el Tipo de Categoría', TF_EE_Message.INFORMATION, True);
        resultado:= False;
      end;

  Result:= resultado;
end;

procedure TReconocimiento.btnAgregarPasadaConNumeroClick(Sender: TObject);
var
  addTomaTiempoForm : TAddTomaTiempoForm;
  eventoOID, tipoCategoriaOID, categoriaOID, pilotoOID, tomaTiempoOID,
    tomaTiempoEventoOID : Integer;
  pilotoVO : TPiloto;
begin
  if (isRaceStarted) then
    begin
      eventoOID:= ZROQTomaTiempos.FieldByName('evento_oid').AsInteger;
      tomaTiempoEventoOID:= ZROQTomaTiempos.FieldByName('toma_tiempo_evento_oid').AsInteger;
      if ((tomaTiempoEventoOID <= 0) and (tomaTiempoEvento > 0)) then
        tomaTiempoEventoOID:= tomaTiempoEvento;
      tipoCategoriaOID:= cmbTipoCategoria.KeyValue;

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

             if (pilotoOID > 0) then
               begin
                 TBussinessDataSubsystemFacade.getInstance.addReconocimiento(tomaTiempoEvento, pilotoOID);
                 refreshDataSetPreservePosition(ZROQTomaTiempos);
                 cxGridTomaTiempoDBTableViewnro_moto.Focused := True;
               end;
          end;
      finally
        addTomaTiempoForm.Free;
      end;
  end;
end;

procedure TReconocimiento.btnAgregarPasadaConNumeroYTiempoClick(Sender: TObject);
var
  addTomaTiempoForm : TAddTomaTiempoForm;
  eventoOID, tipoCategoriaOID, categoriaOID, tomaTiempoOID,
    pilotoOID, nroLargada, nroVueltasByPiloto, tomaTiempoEventoOID : Integer;
  pilotoVO : TPiloto;
begin
  if (isRaceStarted) then
    begin
      eventoOID:= ZROQTomaTiempos.FieldByName('evento_oid').AsInteger;

      tomaTiempoEventoOID:= ZROQTomaTiempos.FieldByName('toma_tiempo_evento_oid').AsInteger;
      if ((tomaTiempoEventoOID <= 0) and (tomaTiempoEvento > 0)) then
        tomaTiempoEventoOID:= tomaTiempoEvento;

      tipoCategoriaOID:= cmbTipoCategoria.KeyValue;

      addTomaTiempoForm:= TAddTomaTiempoForm.Create(nil);
      addTomaTiempoForm.eventOID:= eventoOID;
      addTomaTiempoForm.tipoCategoriaOID:= tipoCategoriaOID;
      try
        if (addTomaTiempoForm.ShowModal = mrOk) then
          begin
             pilotoOID:= addTomaTiempoForm.pilotoOID;

             if (pilotoOID > 0) then
               begin
                 categoriaOID:= TBussinessDataSubsystemFacade.getInstance.getPilotoCategoriaOIDByTipoCategoriaOIDAndEventoOID(
                    pilotoOID, tipoCategoriaOID, eventoOID);

                 //tomaTiempoOID:= cmbTomaTiempoEventoCont.KeyValue;
                 nroVueltasByPiloto:= TBussinessDataSubsystemFacade.getInstance.GetNroVueltaReconocimiento(pilotoOID, TomaTiempoOID);

                 TBussinessDataSubsystemFacade.getInstance.addReconocimientoWithTime(tomaTiempoEventoOID, pilotoOID, addTomaTiempoForm.timeEdit.Time);

                 refreshDataSetPreservePosition(ZROQTomaTiempos);
               end;
          end
      finally
        addTomaTiempoForm.Free;
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

procedure TReconocimiento.btnContinuarTomaTiempoClick(Sender: TObject);
var
  eventoOID, nroLargada: Integer;
begin
  if (validateContinueReconocimiento) then
    begin
      eventoOID:= cmbEvento.KeyValue;
      tomaTiempoEvento:= cmbTomaTiempoEventoCont.KeyValue;

      updateButtonState(True);

      ZROQTomaTiempos.ParamByName('toma_tiempo_evento_oid').AsInteger:= tomaTiempoEvento;
      refreshDataSetPreservePosition(ZROQTomaTiempos);
      refreshDataSetPreservePosition(ZTomaTiempoEvento);

      if (TF_EE_Message.ShowMessage(TComponent(Self),'¿Iniciar lectura antena?',
        '¿Desea continuar la toma de tiempo de reconocimiento con lectura de antena?', TF_EE_Message.QUESTION, False) = mrOk) then
          begin
            startReadingAntena(tomaTiempoEvento);
          end;
    end;
end;

procedure TReconocimiento.btnDeseliminarPasadaClick(Sender: TObject);
var
  oid : Integer;
begin
  oid:= ZROQTomaTiempos.FieldByName('oid').AsInteger;
  TBussinessDataSubsystemFacade.getInstance.updateEstadoReconocimiento(0, oid);
  refreshDataSetPreservePosition(ZROQTomaTiempos);
end;

procedure TReconocimiento.btnEliminarPasadaClick(Sender: TObject);
var
  oid : Integer;
begin
  oid:= ZROQTomaTiempos.FieldByName('oid').AsInteger;
  TBussinessDataSubsystemFacade.getInstance.updateEstadoReconocimiento(1 , oid);
  refreshDataSetPreservePosition(ZROQTomaTiempos);
end;

procedure TReconocimiento.btnExportarExcelPosicionesClick(Sender: TObject);
begin
  if ((cmbEvento.KeyValue > 0) and (cmbTomaTiempoEvento.KeyValue > 0) ) then
    begin
      ZReSetPosition.ParamByName('posicion').AsInteger:= 0;
      ZReSetPosition.ExecSQL;

      with ZROQTomaTiemposExp do
      begin
        DisableControls;
        try
          Close;
          ParamByName('toma_tiempo_evento_oid').AsInteger:= cmbTomaTiempoEvento.KeyValue;
          Open;
        finally
          EnableControls;
        end;
      end;

      scExcelExport.Dataset:= ZROQTomaTiemposExp;
      scExcelExport.WorksheetName := ZTomaTiempoEvento.FieldByName('nombre_simple').AsString;
      scExcelExport.ExportDataset;
      scExcelExport.Disconnect;
    end;
end;

procedure TReconocimiento.btnExpXLSTTClick(Sender: TObject);
begin
  if ((cmbEvento.KeyValue > 0) and (cmbTomaTiempoEvento.KeyValue > 0) ) then
    begin
      ZReSetPosition.ParamByName('posicion').AsInteger:= 0;
      ZReSetPosition.ExecSQL;

      with ZROQReconocimientoExp do
        begin
          DisableControls;
          try
            Close;
            SQL.Text:= getPositionSQL(False, cmbTomaTiempoEvento.KeyValue);
            ParamByName('toma_tiempo_evento_oid').AsInteger:= cmbTomaTiempoEvento.KeyValue;
            ParamByName('categoria_oid').AsInteger:= cmbCategoria.KeyValue;
            ParamByName('skip_rows').AsInteger:= 0;
            ParamByName('first_rows').AsInteger:= 400;
            Open;
          finally
            EnableControls;
          end;
        end;

      with ZROQTomaTiemposExp do
      begin
        DisableControls;
        try
          Close;
          ParamByName('toma_tiempo_evento_oid').AsInteger:= cmbTomaTiempoEvento.KeyValue;
          Open;
        finally
          EnableControls;
        end;
      end;

      scExcelExport.Dataset:= ZROQReconocimientoExp;
      scExcelExport.WorksheetName := ZTomaTiempoEvento.FieldByName('nombre_simple').AsString;
      scExcelExport.ExportDataset;
      scExcelExport.Disconnect;
    end;
end;

procedure TReconocimiento.btnRefrescarGrillaClick(Sender: TObject);
begin
  refreshDataSetPreservePosition(ZROQTomaTiempos);
end;

procedure TReconocimiento.btnStartClick(Sender: TObject);
var
  eventoOID : Integer;
  nroLargada : SmallInt;
begin
  if (validateStartReconocimiento) then
    begin
      eventoOID:= cmbEvento.KeyValue;

      updateButtonState(True);

      tomaTiempoEvento:= TBussinessDataSubsystemFacade.getInstance
        .addTomaTiempoEvento(txtNombre.Text, 'RECONOCIMIENTO', cmbEvento.KeyValue);

     ZROQTomaTiempos.ParamByName('toma_tiempo_evento_oid').AsInteger:= tomaTiempoEvento;
     refreshDataSetPreservePosition(ZROQTomaTiempos);
     refreshDataSetPreservePosition(ZTomaTiempoEvento);
     refreshDataSetPreservePosition(ZTomaTiempoEventoCont);

     startReadingAntena(tomaTiempoEvento);
    end;
end;

procedure TReconocimiento.btnStopClick(Sender: TObject);
begin
   if (TF_EE_Message.ShowMessage(TComponent(Self),'¡Detener Carrera!',
        '¿Está seguro que desea detener la toma de tiempos de la carrera?', TF_EE_Message.QUESTION, True) = mrOk) then
    begin
      updateButtonState(False);
      refreshDataSetPreservePosition(ZTomaTiempoEventoCont);
      refreshDataSetPreservePosition(ZTomaTiempoEvento);

      AThread.KeepRuning:= False;
    end;
end;

procedure TReconocimiento.cmbCategoriaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #8 then
    TDBLookupComboBox(Sender).KeyValue:= 0;
end;

procedure TReconocimiento.cmbTomaTiempoEventoCloseUp(Sender: TObject);
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

procedure TReconocimiento.FormCreate(Sender: TObject);
begin
  ZCampeonato.Active:= True;
  ZEvento.Active:= True;
  ZTomaTiempoEventoCont.Active:= True;
  ZTomaTiempoEvento.Active:= True;
  ZTipoCategoria.Active:= True;

  selectCombosByDate;
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
    nroVueltasByPiloto, pilotoOID: Integer;
  tomaTiempoEventoVO: TTomaTiempoEventoVO;
  tomaTiempoVO: TTomaTiempoVO;
  pilotoVO: TPiloto;
  nowTime : TDateTime;
begin
  try
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

                    pilotoOID:= TBussinessDataSubsystemFacade.getInstance.getPilotoOIDByTagID(lecturaTagsAntena.TagID);
                    pilotoVO:= TBussinessDataSubsystemFacade.getInstance.getPiloto(pilotoOID);

                    lecturaTagOID:= TBussinessDataSubsystemFacade.getInstance
                      .saveLecturaTagsAntena(lecturaTagsAntena);

                    nowTime:= Now;

                    nroVueltasByPiloto:= TBussinessDataSubsystemFacade.getInstance.GetNroVueltaReconocimiento(pilotoOID, TomaTiempoOID);

                    if (Assigned(pilotoVO)) then
                      begin
                        tomaTiempoVO:= TBussinessDataSubsystemFacade.getInstance
                          .getReconocimientoVO(TomaTiempoOID, pilotoOID, nroVueltasByPiloto -1);

                        tipoCategoriaOID:= TBussinessDataSubsystemFacade.getInstance
                          .getTipoCategoriaOIDByPilotoOIDAndEventoOID(pilotoOID, tomaTiempoEventoVO.EventoOID);

                        if (Assigned(tomaTiempoVO)) then
                          begin
                            if (SecondsBetween(nowTime, tomaTiempoVO.TiempoPasada) > 60) then
                              begin
                                TBussinessDataSubsystemFacade.getInstance.addReconocimientoWithTagReference(TomaTiempoOID, lecturaTagOID, nroVueltasByPiloto,
                                  nowTime, lecturaTagsAntena.TagID);

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
                            TBussinessDataSubsystemFacade.getInstance.addReconocimientoWithTagReference(TomaTiempoOID, lecturaTagOID, nroVueltasByPiloto,
                              nowTime, lecturaTagsAntena.TagID);

                            fMemoAppendText:= FormatDateTime('hh:mm:ss', nowTime)+' | '+pilotoVO.getNumeroNombreCompleto(tipoCategoriaOID);
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

                      Sleep(5000);
                      fMemoAppendText:= FormatDateTime('[yyyy/mm/dd hh:mm:ss] ', Now) + 'Intentando Reconectar con Base de Datos';
                      Synchronize(AppendLineToText);
                      try
                        TBussinessDataSubsystemFacade.getInstance.reconectZConnection;
                      except on E: Exception do
                        begin
                          fMemoAppendText:= FormatDateTime('[yyyy/mm/dd hh:mm:ss] ', Now) + '¡Error! Clase: ' + E.ClassName + '. Mensaje: ' + QuotedStr(E.Message);
                          Synchronize(AppendLineToText);
                        end;
                      end;
                  end;
                on E:Exception do
                  begin
                     fMemoAppendText:= FormatDateTime('[yyyy/mm/dd hh:mm:ss] ', Now) + '¡Error! Clase: ' + E.ClassName + '. Mensaje: ' + QuotedStr(E.Message);
                     Synchronize(AppendLineToText);
                  end;
              end;
            end;
      Client.Disconnect;
    finally
      begin
        Client.Free;
        SplitList.Free;
      end;
    end;
  except
    on E:Exception do
      begin
        TF_EE_Message.ShowMessage(TComponent(Self), 'Error al conectar con la Antena',
          '¡Error! Clase: ' + E.ClassName + '. Mensaje: ' + QuotedStr(E.Message), TF_EE_Message.ERROR, True)

      end;
    on EZSQL:EZSQLException do
      begin
        fMemoAppendText:= FormatDateTime('[yyyy/mm/dd hh:mm:ss] ', Now) + 'PERDIDA DE CONEXION CON BD. Mensaje: ' + QuotedStr(EZSQL.Message);
        Synchronize(AppendLineToText);

        //TBussinessDataSubsystemFacade.getInstance.reconectZConnection;
      end;
  end;
end;

procedure TReconocimiento.selectCombosByDate;
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

function TReconocimiento.getCategoriasByTomaTiempo(TomaTiempoEventoOID : Integer): String;
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

function TReconocimiento.getPositionSQL(count:Boolean; TomaTiempoEventoOID : Integer): String;
var
  sqlStringPrefix, sqlStringSufix, categoriasIn: String;
  eventoVO : TEvento;
  i : Integer;
  eventoPuntoControlVO : TEventoPuntoControl;
begin
  //categoriasIn:= getCategoriasByTomaTiempo(TomaTiempoEventoOID);
  sqlStringPrefix:= '';

  if (not count) then
    begin
      sqlStringPrefix:= sqlStringPrefix + ' SELECT @posicion:=@posicion+1 AS Posicion, subquery.* FROM (';
    end;

  sqlStringPrefix:= sqlStringPrefix + 'select DISTINCT sel_nro_moto_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid) ' + QuotedStr('Nro. Competidor') +  ', ' +
       ' CONCAT(p.apellido, ' + QuotedStr(', ') + ' , p.nombre) as Competidor, ' +
       ' sel_nombre_categoria_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid) Categoria ';

  eventoVO:= TBussinessDataSubsystemFacade.getInstance.getEvento(cmbEvento.KeyValue);

  if (eventoVO.PuntoDeControl.Count>0) then
    begin
      for eventoPuntoControlVO in eventoVO.PuntoDeControl do
        sqlStringPrefix:= sqlStringPrefix + ', CONCAT(sel_lap_time_reconocimiento(tt.toma_tiempo_evento_oid, p.oid, '+IntToStr(eventoPuntoControlVO.NumeroPuntoControl)+'), ' + QuotedStr('.') + ') ' + QuotedStr(eventoPuntoControlVO.Nombre);
    end
  else
    begin
      for i:= 1 to eventoVO.NroVueltas do
        sqlStringPrefix:= sqlStringPrefix + ', CONCAT(sel_lap_time_reconocimiento(tt.toma_tiempo_evento_oid, p.oid, '+IntToStr(i)+'), ' + QuotedStr('.') + ') ' + QuotedStr('Vuelta #'+IntToStr(i));
    end;

   sqlStringSufix:= ', sel_recargo_by_toma_tiempo_evento_and_piloto_and_tipo_categoria(tte.oid, ipe.tipo_categoria_oid, ipe.piloto_oid) Recargo, ' +
     ' sel_rec_desc_by_toma_tiempo_evento_and_piloto_and_tipo_categoria(tte.oid, ipe.tipo_categoria_oid, ipe.piloto_oid) ' + QuotedStr('Tipo de Recargo') + ', ' +
     ' sel_can_vueltas_recono(tt.toma_tiempo_evento_oid, tt.piloto_oid) Vueltas, ' +
     ' CONCAT(sel_formatted_total_time(sel_total_time_recono(tt.toma_tiempo_evento_oid, tt.piloto_oid)), ' + QuotedStr('.') + ') ' + QuotedStr('Tiempo Total') +
     ' from toma_tiempos_reconocimiento tt ' +
     ' join toma_tiempo_evento tte on tt.toma_tiempo_evento_oid = tte.oid ' +
     ' join piloto p on tt.piloto_oid = p.oid ' +
     ' join inscripcion_piloto_evento ipe on (ipe.evento_oid = tte.evento_oid and ipe.piloto_oid = tt.piloto_oid) ' +
     ' where tte.oid = :toma_tiempo_evento_oid '+
     ' and (:categoria_oid is null or :categoria_oid = 0 or :categoria_oid = sel_categoria_oid_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid)) ';
//     if (categoriasIn <> '') then
  //      sqlStringSufix:= sqlStringSufix + ' and sel_categoria_oid_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid) in (' + categoriasIn + ')';
//     sqlStringSufix:= sqlStringSufix + ' group by p.oid ' +
     sqlStringSufix:=sqlStringSufix+' order by Categoria, Vueltas desc, sel_total_time_recono(tt.toma_tiempo_evento_oid, tt.piloto_oid) asc, tt.oid asc';
     if (not count) then
      begin
        sqlStringSufix:= sqlStringSufix + ' LIMIT :skip_rows, :first_rows ) subquery ';
      end;
  Result:= sqlStringPrefix + sqlStringSufix;
end;

end.
