unit GrillaTomaTiempoMultiCat;

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
  dxSkinXmas2008Blue, Vcl.ExtCtrls, JvExExtCtrls, JvNetscapeSplitter,
  cxTextEdit, cxCurrencyEdit, Vcl.DBCtrls, cxLabel, Vcl.StdCtrls, AeroButtons,
  cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  Data.DB, cxDBData, cxProgressBar, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  ZAbstractRODataset, ZDataset, ZAbstractDataset, ZAbstractTable, JvTimer,
  Vcl.ImgList, F_EEMessage, Entidades, BussinessDataSubsystemFacade, DataModule,
  cxCheckBox, cxCheckListBox, cxDBCheckListBox, Vcl.CheckLst, JvExCheckLst,
  JvCheckListBox, scExcelExport, frxClass, frxDBSet, frxExportPDF;

type
  TGrillaTomaTiempoMultiCatForm = class(TForm)
    topPanel: TPanel;
    btnStart: TAeroButton;
    btnStop: TAeroButton;
    lblFilterEvento: TcxLabel;
    cmbEvento: TDBLookupComboBox;
    JvNetscapeSplitter: TJvNetscapeSplitter;
    DSEvento: TDataSource;
    ZEvento: TZReadOnlyQuery;
    DSTomaTiempoEvento: TDataSource;
    cxLabel1: TcxLabel;
    cmbTomaTiempoEvento: TDBLookupComboBox;
    cxImageList: TcxImageList;
    ZROQPosiciones1: TZReadOnlyQuery;
    DSPosiciones1: TDataSource;
    JvTimerCategorias: TJvTimer;
    cxStyleRepository: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    ZTomaTiempoEvento: TZReadOnlyQuery;
    bottomPanel: TPanel;
    lblTiempoCaption: TLabel;
    lblTiempoValue: TLabel;
    JvTimerCount: TJvTimer;
    DSCampeonato: TDataSource;
    ZCampeonato: TZTable;
    lblCampeonato: TcxLabel;
    cmbCampeonato: TDBLookupComboBox;
    ZReSetPosition: TZQuery;
    gridPanel: TPanel;
    cxGridPosiciones1: TcxGrid;
    cxGridPosiciones1DBTableView: TcxGridDBTableView;
    cxGridPosiciones1DBTableViewnro_moto: TcxGridDBColumn;
    cxGridPosiciones1DBTableViewcategoria: TcxGridDBColumn;
    cxGridPosiciones1DBTableViewnombre_piloto: TcxGridDBColumn;
    cxGridPosiciones1Level: TcxGridLevel;
    ZROQPosicionesCount: TZReadOnlyQuery;
    lblMostrarPilotos: TcxLabel;
    txtNumPilotos: TcxCurrencyEdit;
    lblPilotos: TcxLabel;
    QueryCategoriasFilter: TZQuery;
    cxGridPosiciones2: TcxGrid;
    cxGridPosiciones2DBTableView: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    ZROQPosiciones2: TZReadOnlyQuery;
    DSPosiciones2: TDataSource;
    cxGridPosiciones3: TcxGrid;
    cxGridPosiciones3DBTableView: TcxGridDBTableView;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    ZROQPosiciones3: TZReadOnlyQuery;
    DSPosiciones3: TDataSource;
    cxGridPosiciones1DBTableViewColumn1: TcxGridDBColumn;
    cxGridPosiciones2DBTableViewColumn1: TcxGridDBColumn;
    cxGridPosiciones3DBTableViewColumn1: TcxGridDBColumn;
    cxGridPosiciones4: TcxGrid;
    cxGridPosiciones4DBTableView: TcxGridDBTableView;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridDBColumn9: TcxGridDBColumn;
    cxGridDBColumn10: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    ZROQPosiciones4: TZReadOnlyQuery;
    DSPosiciones4: TDataSource;
    cxGridPosiciones5: TcxGrid;
    cxGridPosiciones5DBTableView: TcxGridDBTableView;
    cxGridDBColumn11: TcxGridDBColumn;
    cxGridDBColumn12: TcxGridDBColumn;
    cxGridDBColumn13: TcxGridDBColumn;
    cxGridDBColumn14: TcxGridDBColumn;
    cxGridLevel4: TcxGridLevel;
    ZROQPosiciones5: TZReadOnlyQuery;
    DSPosiciones5: TDataSource;
    cxGridPosiciones6: TcxGrid;
    cxGridPosiciones6DBTableView: TcxGridDBTableView;
    cxGridDBColumn15: TcxGridDBColumn;
    cxGridDBColumn16: TcxGridDBColumn;
    cxGridDBColumn17: TcxGridDBColumn;
    cxGridDBColumn18: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
    cxGridPosiciones7: TcxGrid;
    cxGridPosiciones7DBTableView: TcxGridDBTableView;
    cxGridDBColumn19: TcxGridDBColumn;
    cxGridDBColumn20: TcxGridDBColumn;
    cxGridDBColumn21: TcxGridDBColumn;
    cxGridDBColumn22: TcxGridDBColumn;
    cxGridLevel6: TcxGridLevel;
    ZROQPosiciones6: TZReadOnlyQuery;
    DSPosiciones6: TDataSource;
    ZROQPosiciones7: TZReadOnlyQuery;
    DSPosiciones7: TDataSource;
    chkMostrarNyA: TcxCheckBox;
    cxGridPosiciones1DBTableViewColumn2: TcxGridDBColumn;
    cxGridPosiciones2DBTableViewColumn2: TcxGridDBColumn;
    cxGridPosiciones3DBTableViewColumn2: TcxGridDBColumn;
    cxGridPosiciones4DBTableViewColumn1: TcxGridDBColumn;
    cxGridPosiciones5DBTableViewColumn1: TcxGridDBColumn;
    cxGridPosiciones6DBTableViewColumn1: TcxGridDBColumn;
    cxGridPosiciones7DBTableViewColumn1: TcxGridDBColumn;
    cxLabel2: TcxLabel;
    QueryCategorias: TZQuery;
    DSCategorias: TDataSource;
    CategoriaCheckListBox: TJvCheckListBox;
    JvTimer: TJvTimer;
    ZROQPosicionesCountcuenta: TLargeintField;
    cxGridPosiciones1DBTableViewColumn3: TcxGridDBColumn;
    cxGridPosiciones2DBTableViewColumn3: TcxGridDBColumn;
    cxGridPosiciones3DBTableViewColumn3: TcxGridDBColumn;
    cxGridPosiciones4DBTableViewColumn2: TcxGridDBColumn;
    cxGridPosiciones5DBTableViewColumn2: TcxGridDBColumn;
    cxGridPosiciones7DBTableViewColumn2: TcxGridDBColumn;
    cxGridPosiciones6DBTableViewColumn2: TcxGridDBColumn;
    frxPosiciones1: TfrxReport;
    posiciones1DBDS: TfrxDBDataset;
    frxPDFExport: TfrxPDFExport;
    tomaTiempoDBDS: TfrxDBDataset;
    eventoDBDS: TfrxDBDataset;
    campeonato1DBDS: TfrxDBDataset;
    JvReportTimer: TJvTimer;
    ZSetDifAnt: TZQuery;
    ZSetDifPrim: TZQuery;
    cmbEstado: TDBLookupComboBox;
    lblFilterEstado: TcxLabel;
    ZEstadoTomaTiempo: TZTable;
    DSEstadoTomaTiempo: TDataSource;
    estadoTomaTiempoDBDS: TfrxDBDataset;
    frxProximaFecha: TfrxReport;
    frxGrillaPartida: TfrxReport;
    procedure btnStartClick(Sender: TObject);
    procedure JvTimerTimer(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmbCategoriaKeyPress(Sender: TObject; var Key: Char);
    procedure JvTimerCountTimer(Sender: TObject);
    procedure cmbCategoriaCloseUp(Sender: TObject);
    procedure cmbTomaTiempoEventoCloseUp(Sender: TObject);
    procedure JvReportTimerTimer(Sender: TObject);
  private
     queryList, gridList : TList;

    procedure refreshDataSetPreservePosition(Query : TDataSet);
    function getCategoriasByTomaTiempo(TomaTiempoEventoOID : Integer): String;
    procedure selectCombosByDate;
    function getCategorySqlFilter: String;
    function getPositionSQL(): String;
  public
    { Public declarations }
  end;

var
  secs, skip : Integer;

implementation

{$R *.dfm}

procedure TGrillaTomaTiempoMultiCatForm.refreshDataSetPreservePosition(Query : TDataSet);
begin
  Query.DisableControls;
  try
    Query.Close;
    Query.Open;
  finally
    Query.EnableControls;
  end;
end;

procedure TGrillaTomaTiempoMultiCatForm.btnStartClick(Sender: TObject);
begin
    if (cmbEvento.KeyValue > 0)
      and (cmbTomaTiempoEvento.KeyValue > 0)
        and (cmbEstado.KeyValue > 0) then
      begin
        JvTimer.Enabled:= True;
        JvTimerCount.Enabled:= True;
        JvReportTimer.Enabled:= True;

        secs:= 4;
        lblTiempoCaption.Visible:= True;
        lblTiempoValue.Visible:= True;
        lblTiempoValue.Caption:= '00:05';
        skip:= 0;

        btnStop.Enabled:= True;
        btnStart.Enabled:= False;

        cmbEvento.Enabled:= False;
        cmbTomaTiempoEvento.Enabled:= False;
        cmbCampeonato.Enabled:= False;

        JvNetscapeSplitter.Maximized:= True;

        ZReSetPosition.ParamByName('posicion').AsInteger:= 0;
        ZReSetPosition.ExecSQL;
        ZSetDifAnt.ExecSQL;
        ZSetDifPrim.ExecSQL;
      end
    else
      TF_EE_Message.ShowMessage(TComponent(Self),'¡Seleccione los campos obligatorios!',
          'Debe seleccionar el Evento y la Toma de Tiempo', TF_EE_Message.WARNING, False)
end;

procedure TGrillaTomaTiempoMultiCatForm.btnStopClick(Sender: TObject);
begin
  JvTimer.Enabled:= False;
  JvTimerCount.Enabled:= True;
  JvReportTimer.Enabled:= True;

  btnStart.Enabled:= True;
  btnStop.Enabled:= False;

  secs:= 5;
  lblTiempoCaption.Visible:= False;
  lblTiempoValue.Visible:= False;
  lblTiempoValue.Caption:= '00:05';

  refreshDataSetPreservePosition(ZEvento);
  refreshDataSetPreservePosition(ZTomaTiempoEvento);
  refreshDataSetPreservePosition(QueryCategorias);

  cmbEvento.Enabled:= True;
  cmbTomaTiempoEvento.Enabled:= True;
  cmbCampeonato.Enabled:= True;
end;

procedure TGrillaTomaTiempoMultiCatForm.cmbCategoriaCloseUp(Sender: TObject);
begin
  JvTimerTimer(nil);
end;

procedure TGrillaTomaTiempoMultiCatForm.cmbCategoriaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #8 then
    TDBLookupComboBox(Sender).KeyValue:= 0;
end;

procedure TGrillaTomaTiempoMultiCatForm.cmbTomaTiempoEventoCloseUp(Sender: TObject);
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

  CategoriaCheckListBox.Items.Clear;  with QueryCategorias do
    begin
      First;
      while not EOF do
        begin
          CategoriaCheckListBox.Items.Add(FieldByName('nombre').AsString);

          Next;
        end;
    end;
end;

procedure TGrillaTomaTiempoMultiCatForm.FormCreate(Sender: TObject);
begin
  queryList := TList.Create;
  queryList.Add(ZROQPosiciones2);
  queryList.Add(ZROQPosiciones3);
  queryList.Add(ZROQPosiciones4);
  queryList.Add(ZROQPosiciones5);
  queryList.Add(ZROQPosiciones6);
  queryList.Add(ZROQPosiciones7);
  queryList.Add(ZROQPosiciones1);

  gridList := TList.Create;
  gridList.Add(cxGridPosiciones2DBTableView);
  gridList.Add(cxGridPosiciones3DBTableView);
  gridList.Add(cxGridPosiciones4DBTableView);
  gridList.Add(cxGridPosiciones5DBTableView);
  gridList.Add(cxGridPosiciones6DBTableView);
  gridList.Add(cxGridPosiciones7DBTableView);
  gridList.Add(cxGridPosiciones1DBTableView);

  ZCampeonato.Active:= True;
  ZEstadoTomaTiempo.Active:= True;
  ZEvento.Active:= True;
  ZTomaTiempoEvento.Active:= True;

  selectCombosByDate;
end;

procedure TGrillaTomaTiempoMultiCatForm.JvReportTimerTimer(Sender: TObject);
var
  i:Integer;
  Memo: TfrxMemoView;
begin
    with QueryCategoriasFilter do
    begin
      Close;
      Sql.Text:= getCategorySqlFilter;
      ParamByName('toma_tiempo_evento_oid').AsInteger:= cmbTomaTiempoEvento.KeyValue;
      Open;
    end;

  i:= 1;
  with QueryCategoriasFilter do
    begin
      First;
      while not EOF do
      begin
        if (i < queryList.Count) then
        begin

          posiciones1DBDS.DataSet:= TZReadOnlyQuery(queryList[i]);
          frxPDFExport.FileName:= 'C:\enduro\Dropbox\Reportes Web\'
            +TZReadOnlyQuery(queryList[i]).FieldByName('categoria').AsString+'.pdf';

        if (cmbEstado.KeyValue = 6) then // grilla de partida
          begin
            frxGrillaPartida.PrepareReport();
            frxGrillaPartida.Export(frxPDFExport);
          end
        else if (cmbEstado.KeyValue = 5) then // proxima fecha
          begin
            frxProximaFecha.PrepareReport();
            frxProximaFecha.Export(frxPDFExport);
          end
        else
          begin
            frxPosiciones1.PrepareReport();
            frxPosiciones1.Export(frxPDFExport);
          end;

          i:=i+1;
        end;

        Next;
      end;
    end;
end;

procedure TGrillaTomaTiempoMultiCatForm.JvTimerCountTimer(Sender: TObject);
begin
  lblTiempoValue.Caption:= '00:0' + IntToStr(secs);
  Dec(secs);
end;

procedure TGrillaTomaTiempoMultiCatForm.JvTimerTimer(Sender: TObject);
var
  nI, i, j, categoriaCount : Integer;
  AGridView: TcxGrid;
  categoriasNameIn : String;
begin
  with ZROQPosicionesCount do
    begin
      DisableControls;
      try
        Close;
        ParamByName('toma_tiempo_evento_oid').AsInteger:= cmbTomaTiempoEvento.KeyValue;
        Open;
      finally
        EnableControls;
        categoriaCount:= ZROQPosicionesCount.FieldByName('cuenta').AsInteger;
      end;
    end;

  if ((skip + Trunc(txtNumPilotos.Value)) < categoriaCount) then
    begin
      skip:= skip + Trunc(txtNumPilotos.Value);

      ZReSetPosition.ParamByName('posicion').AsInteger:= skip;
      ZReSetPosition.ExecSQL;
      ZSetDifAnt.ExecSQL;
      ZSetDifPrim.ExecSQL;
    end
   else
    begin
      ZReSetPosition.ParamByName('posicion').AsInteger:= 0;
      ZReSetPosition.ExecSQL;
      ZSetDifAnt.ExecSQL;
      ZSetDifPrim.ExecSQL;

      skip:= 0;
    end;

    ZReSetPosition.ParamByName('posicion').AsInteger:= skip;
    ZReSetPosition.ExecSQL;
    ZSetDifAnt.ExecSQL;
    ZSetDifPrim.ExecSQL;

    with QueryCategoriasFilter do
    begin
      Close;
      Sql.Text:= getCategorySqlFilter;
      ParamByName('toma_tiempo_evento_oid').AsInteger:= cmbTomaTiempoEvento.KeyValue;
      Open;
    end;

  i:= 1;
  with QueryCategoriasFilter do
    begin
      First;
      while not EOF do
      begin
        if (i < queryList.Count) then
        begin
          TZReadOnlyQuery(queryList[i]).DisableControls;
          try
            TZReadOnlyQuery(queryList[i]).Close;
            TZReadOnlyQuery(queryList[i]).SQL.Text:= getPositionSQL;
            TZReadOnlyQuery(queryList[i]).ParamByName('toma_tiempo_evento_oid').AsInteger:= cmbTomaTiempoEvento.KeyValue;
            TZReadOnlyQuery(queryList[i]).ParamByName('categoria_oid').AsInteger:= QueryCategoriasFilter.FieldByName('oid').AsInteger;
            TZReadOnlyQuery(queryList[i]).ParamByName('skip_rows').AsInteger:= skip;
            TZReadOnlyQuery(queryList[i]).ParamByName('first_rows').AsInteger:= Trunc(txtNumPilotos.Value);
            TZReadOnlyQuery(queryList[i]).Open;
          finally
            TZReadOnlyQuery(queryList[i]).EnableControls;
            TZReadOnlyQuery(queryList[i]).RecordCount;
            TcxGridDBTableView(gridList[i]).ViewData.Expand(True);
            TcxGridDBColumn(TcxGridDBTableView(gridList[i]).Items[0]).Width:= 14; //pos
            TcxGridDBColumn(TcxGridDBTableView(gridList[i]).Items[1]).Width:= 30; //nro
            TcxGridDBColumn(TcxGridDBTableView(gridList[i]).Items[2]).Width:= 100; //Apellido
            TcxGridDBColumn(TcxGridDBTableView(gridList[i]).Items[3]).Width:= 80; //nombre
            TcxGridDBColumn(TcxGridDBTableView(gridList[i]).Items[3]).Caption:= 'Apellido';
            TcxGridDBColumn(TcxGridDBTableView(gridList[i]).Items[4]).Width:= 40;  //# Vueltas
            TcxGridDBColumn(TcxGridDBTableView(gridList[i]).Items[5]).Width:= 80; // Tiempo Total
            TcxGridDBTableView(gridList[i]).Items[3].Visible:= chkMostrarNyA.Checked;
            AGridView := TcxGridLevel(TcxGridDBTableView(gridList[i]).Level).Control as TcxGrid;
            //cxGridPosiciones1DBTableView.ApplyBestFit;
            AGridView.Visible:= True;
            AGridView.Width:= Trunc(gridPanel.Width / QueryCategoriasFilter.RecordCount);

            ZReSetPosition.ParamByName('posicion').AsInteger:= skip;
            ZReSetPosition.ExecSQL;
            ZSetDifAnt.ExecSQL;
            ZSetDifPrim.ExecSQL;
          end;
          i:=i+1;
        end;
        Next;
      end;

      for j:= i to queryList.Count - 1 do
        begin
          AGridView := TcxGridLevel(TcxGridDBTableView(gridList[j]).Level).Control as TcxGrid;
          AGridView.Visible:= False;
        end;
    end;

   secs:= 5;
end;

function TGrillaTomaTiempoMultiCatForm.getCategorySqlFilter: String;
var
  sqlString, categoriasNameIn: String;
  nI, categoriaOID : Integer;
begin
  categoriasNameIn:= '';
  for nI := 0 to (CategoriaCheckListBox.Items.Count -1) do
    if CategoriaCheckListBox.Checked[nI] then
      begin
        categoriaOID:= TBussinessDataSubsystemFacade
            .getInstance.getCategoriaByName(CategoriaCheckListBox.Items.Strings[nI]);
        IF categoriasNameIn<>'' THEN
          categoriasNameIn:=categoriasNameIn + ','+IntToStr(categoriaOID)
        ELSE
          categoriasNameIn:=categoriasNameIn + IntToStr(categoriaOID);
      end;

  sqlString:=
       ' select distinct cat.oid, cat.nombre from toma_tiempos tt ' +
       '      join toma_tiempo_evento tte on tt.toma_tiempo_evento_oid = tte.oid ' +
       '      join piloto p on tt.piloto_oid = p.oid, categorias cat ' +
       ' where sel_categoria_oid_by_evento_and_tipo_categoria((select min(ipe.tipo_categoria_oid) ' +
       '                          from inscripcion_piloto_evento ipe ' +
       '                          where ipe.evento_oid = tte.evento_oid ' +
       '                          and ipe.piloto_oid = p.oid), tte.evento_oid, p.oid) = cat.oid ' +
       ' and tte.oid = :toma_tiempo_evento_oid '+
       ' and tt.is_deleted = 0 ';
   if (categoriasNameIn<>'') then  sqlString:=sqlString+ ' and cat.oid IN ('+categoriasNameIn+') ';

  Result:= sqlString;
end;

function TGrillaTomaTiempoMultiCatForm.getCategoriasByTomaTiempo(TomaTiempoEventoOID : Integer): String;
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

procedure TGrillaTomaTiempoMultiCatForm.selectCombosByDate;
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


function TGrillaTomaTiempoMultiCatForm.getPositionSQL(): String;
var
  sqlString: String;
  eventoVO : TEvento;
begin

  sqlString:=
       'SELECT @posicion:=@posicion+1 AS posicion, ' +
       //'sel_formatted_total_time(case when @posicion = 1 then 0 when @maxvuelta > max_nro_vuelta then 0 when @tant = 0 then 0 when @tant > tiempo_sec then 0 else tiempo_sec - @tant end) dif , ' +
       'case when @posicion = 1 then sel_formatted_total_time(0) when @maxvuelta > max_nro_vuelta then CONCAT((@maxvuelta - max_nro_vuelta), ' + QuotedStr(' V') + ') else sel_formatted_total_time(case when @posicion = 0 then 0 when @tant = 0 then 0 when @tant > tiempo_sec then 0 else tiempo_sec - @tant end) end dif , ' +
       'sel_formatted_total_time(case when @posicion = 1 then 0  when @maxvuelta > max_nro_vuelta then 0 when @tprim = 0 then 0 when @tprim > tiempo_sec then 0 else tiempo_sec - @tprim end) difprin , ' +
       '@tant:= tiempo_sec, ' +
       '@maxvuelta := case when @posicion = 1 then max_nro_vuelta else @maxvuelta end maxvuelta, ' +
       '@tprim := case when @posicion = 1 then tiempo_sec else @tprim end tprim, ' +
       'subquery.* FROM ( ' +
       ' SELECT sel_nro_moto_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid) nro_moto, ' +
       ' UC_Words(CONCAT(p.apellido, '+QuotedStr(', ')+',p.nombre)) as nombre_piloto, ' +
       ' sel_handicup_by_evento_and_piloto_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid) handicup, ' +
       ' sel_recargo_by_toma_tiempo_evento_and_piloto_and_tipo_categoria(tte.oid, ipe.tipo_categoria_oid, ipe.piloto_oid) recargo, ' +
       ' sel_rec_desc_by_toma_tiempo_evento_and_piloto_and_tipo_categoria(tte.oid, ipe.tipo_categoria_oid, ipe.piloto_oid) desc_recargo, ' +
       ' sel_nombre_categoria_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid) categoria, ' +
       ' sel_total_time(tt.toma_tiempo_evento_oid, tt.piloto_oid) tiempo_sec, ' +
       ' sel_formatted_total_time(sel_total_time(tt.toma_tiempo_evento_oid, tt.piloto_oid)) formated_tiempo_sec,  l.localidad, ' +
       ' MAX(nro_vuelta) max_nro_vuelta , mm.nombre as mm_nombre, marm.nombre as marm_nombre, marm.imagen ' +

       ' from toma_tiempos tt ' +
       ' join toma_tiempo_evento tte on tt.toma_tiempo_evento_oid = tte.oid ' +
       ' join piloto p on tt.piloto_oid = p.oid ' +
       '  left join localidad l on p.localidad_oid = l.oid ' +
       '  left join modelo_moto mm on p.modelo_moto_oid = mm.oid ' +
       '  left join marca_moto marm on marm.oid = mm.marca_moto_oid ' +
       ' join inscripcion_piloto_evento ipe on (ipe.evento_oid = tte.evento_oid and ipe.piloto_oid = tt.piloto_oid) ' +
       ' where tte.oid = :toma_tiempo_evento_oid ' +
       '    and tt.is_deleted = 0 ' +
       '    and (:categoria_oid is null or :categoria_oid = 0 or :categoria_oid = sel_categoria_oid_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid))  ' +
       ' group by p.oid ' +
       ' order by sel_nombre_categoria_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid),  ' +
       ' sel_can_vueltas(tt.toma_tiempo_evento_oid, tt.piloto_oid) desc, ' +
       ' sel_total_time(tt.toma_tiempo_evento_oid, tt.piloto_oid) asc, tt.oid asc ' +
       ' LIMIT :skip_rows, :first_rows ) subquery';

  Result:= sqlString;
end;

end.
