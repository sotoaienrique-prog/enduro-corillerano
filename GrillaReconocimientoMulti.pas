unit GrillaReconocimientoMulti;

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
  cxData, cxDataStorage, Data.DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  Vcl.StdCtrls, Vcl.DBCtrls, cxLabel, AeroButtons, Vcl.ExtCtrls, ZDataset,
  ZAbstractRODataset, ZAbstractDataset, ZAbstractTable, Vcl.ImgList, JvTimer,
  DataModule, F_EEMessage, JvExExtCtrls, JvNetscapeSplitter, cxTextEdit,
  cxCurrencyEdit, Entidades, BussinessDataSubsystemFacade, cxCheckBox,
  Vcl.CheckLst, JvExCheckLst, JvCheckListBox, scExcelExport, frxClass,
  frxExportPDF, frxDBSet;

type
  TGrillaReconocimientoMultiForm = class(TForm)
    topPanel: TPanel;
    btnStart: TAeroButton;
    btnStop: TAeroButton;
    lblFilterEvento: TcxLabel;
    cmbEvento: TDBLookupComboBox;
    cxLabel1: TcxLabel;
    cmbTomaTiempoEvento: TDBLookupComboBox;
    lblCampeonato: TcxLabel;
    cmbCampeonato: TDBLookupComboBox;
    bottomPanel: TPanel;
    lblTiempoCaption: TLabel;
    lblTiempoValue: TLabel;
    ZCampeonato: TZTable;
    DSCampeonato: TDataSource;
    DSEvento: TDataSource;
    ZEvento: TZReadOnlyQuery;
    ZTomaTiempoEvento: TZReadOnlyQuery;
    DSTomaTiempoEvento: TDataSource;
    QueryCategorias: TZQuery;
    DSCategorias: TDataSource;
    cxImageList: TcxImageList;
    JvTimer: TJvTimer;
    JvNetscapeSplitter: TJvNetscapeSplitter;
    ZROQReconocimientoCount: TZReadOnlyQuery;
    cxStyleRepository: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    JvTimerCount: TJvTimer;
    lblMostrarPilotos: TcxLabel;
    txtNumPilotos: TcxCurrencyEdit;
    lblPilotos: TcxLabel;
    QueryCategoriasFilter: TZQuery;
    ZROQPosiciones1: TZReadOnlyQuery;
    ZROQPosiciones2: TZReadOnlyQuery;
    ZROQPosiciones3: TZReadOnlyQuery;
    ZROQPosiciones4: TZReadOnlyQuery;
    ZROQPosiciones5: TZReadOnlyQuery;
    ZROQPosiciones6: TZReadOnlyQuery;
    ZROQPosiciones7: TZReadOnlyQuery;
    DSPosiciones1: TDataSource;
    DSPosiciones2: TDataSource;
    DSPosiciones3: TDataSource;
    DSPosiciones4: TDataSource;
    DSPosiciones7: TDataSource;
    DSPosiciones6: TDataSource;
    DSPosiciones5: TDataSource;
    gridPanel: TPanel;
    cxGridPosiciones1: TcxGrid;
    cxGridPosiciones1DBTableView: TcxGridDBTableView;
    cxGridPosiciones1DBTableViewColumn1: TcxGridDBColumn;
    cxGridPosiciones1DBTableViewnro_moto: TcxGridDBColumn;
    cxGridPosiciones1DBTableViewcategoria: TcxGridDBColumn;
    cxGridPosiciones1DBTableViewColumn2: TcxGridDBColumn;
    cxGridPosiciones1DBTableViewnombre_piloto: TcxGridDBColumn;
    cxGridPosiciones1Level: TcxGridLevel;
    cxGridPosiciones2: TcxGrid;
    cxGridPosiciones2DBTableView: TcxGridDBTableView;
    cxGridPosiciones2DBTableViewColumn1: TcxGridDBColumn;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridPosiciones2DBTableViewColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxGridPosiciones3: TcxGrid;
    cxGridPosiciones3DBTableView: TcxGridDBTableView;
    cxGridPosiciones3DBTableViewColumn1: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridPosiciones3DBTableViewColumn2: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    cxGridPosiciones4: TcxGrid;
    cxGridPosiciones4DBTableView: TcxGridDBTableView;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridDBColumn9: TcxGridDBColumn;
    cxGridPosiciones4DBTableViewColumn1: TcxGridDBColumn;
    cxGridDBColumn10: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    cxGridPosiciones5: TcxGrid;
    cxGridPosiciones5DBTableView: TcxGridDBTableView;
    cxGridDBColumn11: TcxGridDBColumn;
    cxGridDBColumn12: TcxGridDBColumn;
    cxGridDBColumn13: TcxGridDBColumn;
    cxGridPosiciones5DBTableViewColumn1: TcxGridDBColumn;
    cxGridDBColumn14: TcxGridDBColumn;
    cxGridLevel4: TcxGridLevel;
    cxGridPosiciones6: TcxGrid;
    cxGridPosiciones6DBTableView: TcxGridDBTableView;
    cxGridDBColumn15: TcxGridDBColumn;
    cxGridDBColumn16: TcxGridDBColumn;
    cxGridDBColumn17: TcxGridDBColumn;
    cxGridPosiciones6DBTableViewColumn1: TcxGridDBColumn;
    cxGridDBColumn18: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
    cxGridPosiciones7: TcxGrid;
    cxGridPosiciones7DBTableView: TcxGridDBTableView;
    cxGridDBColumn19: TcxGridDBColumn;
    cxGridDBColumn20: TcxGridDBColumn;
    cxGridDBColumn21: TcxGridDBColumn;
    cxGridPosiciones7DBTableViewColumn1: TcxGridDBColumn;
    cxGridDBColumn22: TcxGridDBColumn;
    cxGridLevel6: TcxGridLevel;
    ZReSetPosition: TZQuery;
    chkMostrarNyA: TcxCheckBox;
    cxLabel2: TcxLabel;
    CategoriaCheckListBox: TJvCheckListBox;
    cxGridPosiciones1DBTableViewColumn3: TcxGridDBColumn;
    cxGridPosiciones2DBTableViewColumn3: TcxGridDBColumn;
    cxGridPosiciones3DBTableViewColumn3: TcxGridDBColumn;
    cxGridPosiciones4DBTableViewColumn2: TcxGridDBColumn;
    cxGridPosiciones5DBTableViewColumn2: TcxGridDBColumn;
    cxGridPosiciones6DBTableViewColumn2: TcxGridDBColumn;
    cxGridPosiciones7DBTableViewColumn2: TcxGridDBColumn;
    frxPosiciones1: TfrxReport;
    posiciones1DBDS: TfrxDBDataset;
    frxPDFExport: TfrxPDFExport;
    JvReportTimer: TJvTimer;
    campeonato1DBDS: TfrxDBDataset;
    eventoDBDS: TfrxDBDataset;
    tomaTiempoDBDS: TfrxDBDataset;
    procedure cmbTomaTiempoEventoCloseUp(Sender: TObject);
    procedure JvTimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure JvTimerCountTimer(Sender: TObject);
    procedure JvReportTimerTimer(Sender: TObject);
  private
     queryList, gridList : TList;
    procedure refreshDataSetPreservePosition(Query : TDataSet);
    procedure selectCombosByDate;
    function getPositionSQL(): String;
    function getCategoriasByTomaTiempo(TomaTiempoEventoOID : Integer): String;
    function getCategorySqlFilter: String;
  public
    { Public declarations }
  end;

var
  secs, skip : Integer;

implementation

{$R *.dfm}

procedure TGrillaReconocimientoMultiForm.refreshDataSetPreservePosition(Query : TDataSet);
begin
  Query.DisableControls;
  try
    Query.Close;
    Query.Open;
  finally
    Query.EnableControls;
  end;
end;

function TGrillaReconocimientoMultiForm.getCategorySqlFilter: String;
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
       ' select distinct cat.oid, cat.nombre ' +
       ' from inscripcion_piloto_evento ipe ' +
       '  join piloto p on ipe.piloto_oid = p.oid, categorias cat ' +
       ' where sel_categoria_oid_by_evento_and_tipo_categoria((select min(ipe.tipo_categoria_oid) ' +
       '                          from inscripcion_piloto_evento ipe ' +
       '                          where ipe.evento_oid = ipe.evento_oid ' +
       '                          and ipe.piloto_oid = p.oid), ipe.evento_oid, p.oid) = cat.oid ' +
       ' and ipe.evento_oid = :evento_oid';
   if (categoriasNameIn<>'') then  sqlString:=sqlString+ ' and cat.oid IN ('+categoriasNameIn+') ';
   sqlString:=sqlString+ 'order by cat.orden is null, cat.orden asc';

   Result:= sqlString;
end;

procedure TGrillaReconocimientoMultiForm.btnStartClick(Sender: TObject);
begin
  if (cmbEvento.KeyValue > 0) and (cmbTomaTiempoEvento.KeyValue > 0) then
    begin
      JvTimer.Enabled:= True;
      JvTimerCount.Enabled:= True;

      secs:= 4;
      lblTiempoCaption.Visible:= True;
      lblTiempoValue.Visible:= True;
      lblTiempoValue.Caption:= '00:05';
      skip:= 0;

      btnStop.Enabled:= True;
      btnStart.Enabled:= False;

      txtNumPilotos.Enabled:= False;
      cmbEvento.Enabled:= False;
      cmbTomaTiempoEvento.Enabled:= False;
      cmbCampeonato.Enabled:= False;

      JvNetscapeSplitter.Maximized:= True;
    end
  else
    TF_EE_Message.ShowMessage(TComponent(Self),'¡Seleccione los campos obligatorios!',
        'Debe seleccionar el Evento y la Toma de Tiempo', TF_EE_Message.WARNING, False)
end;

procedure TGrillaReconocimientoMultiForm.btnStopClick(Sender: TObject);
begin
  JvTimer.Enabled:= False;
  JvTimerCount.Enabled:= True;

  btnStart.Enabled:= True;
  btnStop.Enabled:= False;

  secs:= 5;
  lblTiempoCaption.Visible:= False;
  lblTiempoValue.Visible:= False;
  lblTiempoValue.Caption:= '00:05';

  refreshDataSetPreservePosition(ZEvento);
  refreshDataSetPreservePosition(ZTomaTiempoEvento);
  refreshDataSetPreservePosition(QueryCategorias);

  txtNumPilotos.Enabled:= True;
  cmbEvento.Enabled:= True;
  cmbTomaTiempoEvento.Enabled:= True;
  cmbCampeonato.Enabled:= True;
end;

procedure TGrillaReconocimientoMultiForm.cmbTomaTiempoEventoCloseUp(Sender: TObject);
begin
  if (cmbTomaTiempoEvento.KeyValue > 0) then
    begin
      with QueryCategorias do
        begin
          Close;
          ParamByName('evento_oid').AsInteger:= cmbEvento.KeyValue;
          Open;
        end;
    end;

  CategoriaCheckListBox.Items.Clear;
  with QueryCategorias do
    begin
      First;
      while not EOF do
        begin
          CategoriaCheckListBox.Items.Add(FieldByName('nombre').AsString);

          Next;
        end;
    end;
end;

procedure TGrillaReconocimientoMultiForm.FormCreate(Sender: TObject);
begin
  queryList := TList.Create;
  queryList.Add(ZROQPosiciones1);
  queryList.Add(ZROQPosiciones2);
  queryList.Add(ZROQPosiciones3);
  queryList.Add(ZROQPosiciones4);
  queryList.Add(ZROQPosiciones5);
  queryList.Add(ZROQPosiciones6);
  queryList.Add(ZROQPosiciones7);

  gridList := TList.Create;
  gridList.Add(cxGridPosiciones1DBTableView);
  gridList.Add(cxGridPosiciones2DBTableView);
  gridList.Add(cxGridPosiciones3DBTableView);
  gridList.Add(cxGridPosiciones4DBTableView);
  gridList.Add(cxGridPosiciones5DBTableView);
  gridList.Add(cxGridPosiciones6DBTableView);
  gridList.Add(cxGridPosiciones7DBTableView);

  ZCampeonato.Active:= True;
  ZEvento.Active:= True;
  ZTomaTiempoEvento.Active:= True;
  QueryCategorias.Active:= True;
  QueryCategorias.Next;

  selectCombosByDate;
end;

procedure TGrillaReconocimientoMultiForm.JvReportTimerTimer(Sender: TObject);
var
  i:Integer;
begin
  i:= 0;
  with QueryCategoriasFilter do
    begin
      First;
      while not EOF do
      begin
        if (i < queryList.Count) then
        begin

          posiciones1DBDS.DataSet:= TZReadOnlyQuery(queryList[i]);
          frxPDFExport.FileName:= 'C:\enduro\reportes\'
            +TZReadOnlyQuery(queryList[i]).FieldByName('categoria').AsString+'.pdf';

          frxPosiciones1.PrepareReport();
          frxPosiciones1.Export(frxPDFExport);

          i:=i+1;
        end;

        Next;
      end;
    end;
end;

procedure TGrillaReconocimientoMultiForm.JvTimerCountTimer(Sender: TObject);
begin
  lblTiempoValue.Caption:= '00:0' + IntToStr(secs);
  Dec(secs);
end;

procedure TGrillaReconocimientoMultiForm.JvTimerTimer(Sender: TObject);
var
  i, j, categoriaCount : Integer;
  AGridView: TcxGrid;
begin
  with ZROQReconocimientoCount do
    begin
      DisableControls;
      try
        Close;
        ParamByName('toma_tiempo_evento_oid').AsInteger:= cmbTomaTiempoEvento.KeyValue;
        Open;
      finally
        EnableControls;
        categoriaCount:= FieldByName('cuenta').AsInteger;
      end;
    end;

  if ((skip + Trunc(txtNumPilotos.Value)) < categoriaCount) then
    begin
      skip:= skip + Trunc(txtNumPilotos.Value);

      ZReSetPosition.ParamByName('posicion').AsInteger:= skip;
      ZReSetPosition.ExecSQL;
    end
   else
    begin
      ZReSetPosition.ParamByName('posicion').AsInteger:= 0;
      ZReSetPosition.ExecSQL;

      skip:= 0;
    end;

  ZReSetPosition.ParamByName('posicion').AsInteger:= skip;
  ZReSetPosition.ExecSQL;

  with QueryCategoriasFilter do
  begin
    Close;
    Sql.Text:= getCategorySqlFilter;
    ParamByName('evento_oid').AsInteger:= cmbEvento.KeyValue;
    Open;
  end;

  i:= 0;
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
            TcxGridDBTableView(gridList[i]).ViewData.Expand(True);
            TcxGridDBColumn(TcxGridDBTableView(gridList[i]).Items[0]).Width:= 14; //pos
            TcxGridDBColumn(TcxGridDBTableView(gridList[i]).Items[1]).Width:= 30; //nro
            TcxGridDBColumn(TcxGridDBTableView(gridList[i]).Items[2]).Width:= 100;
            TcxGridDBColumn(TcxGridDBTableView(gridList[i]).Items[3]).Width:= 90; //nombre
            TcxGridDBColumn(TcxGridDBTableView(gridList[i]).Items[3]).Caption:= 'Apellido';
            TcxGridDBColumn(TcxGridDBTableView(gridList[i]).Items[4]).Width:= 10;  //corriendo
            TcxGridDBColumn(TcxGridDBTableView(gridList[i]).Items[5]).Width:= 97; // Tiempo Total
            TcxGridDBTableView(gridList[i]).Items[3].Visible:= chkMostrarNyA.Checked;
            AGridView := TcxGridLevel(TcxGridDBTableView(gridList[i]).Level).Control as TcxGrid;
            AGridView.Visible:= True;
            AGridView.Width:= Trunc(gridPanel.Width / QueryCategoriasFilter.RecordCount);

            ZReSetPosition.ParamByName('posicion').AsInteger:= skip;
            ZReSetPosition.ExecSQL;
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

procedure TGrillaReconocimientoMultiForm.selectCombosByDate;
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

function TGrillaReconocimientoMultiForm.getCategoriasByTomaTiempo(TomaTiempoEventoOID : Integer): String;
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

function TGrillaReconocimientoMultiForm.getPositionSQL(): String;
var
  sqlString: String;
  eventoVO : TEvento;
  i : Integer;
  eventoPuntoControlVO : TEventoPuntoControl;
begin
  sqlString:= ' SELECT @posicion:=@posicion+1 AS posicion, subquery.* FROM (' +
    'select sel_nro_moto_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid) nro_moto, ' +
       ' UC_Words(CONCAT(p.apellido, '+QuotedStr(', ')+',p.nombre)) as nombre_piloto, ' +
       ' sel_nombre_categoria_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid) categoria, ' +
       ' sel_total_time_recono(tte.oid, ipe.piloto_oid) tiempo_sec,  l.localidad,' +
       ' sel_handicup_by_evento_and_piloto_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid) handicup, ' +
       ' sel_recargo_by_toma_tiempo_evento_and_piloto_and_tipo_categoria(tte.oid, ipe.tipo_categoria_oid, ipe.piloto_oid) recargo,' +
       ' sel_formatted_total_time(sel_total_time_recono(tte.oid, ipe.piloto_oid)) formated_tiempo_sec, ' +
       ' sel_can_vueltas_recono(tte.oid, ipe.piloto_oid) max_nro_vuelta, '+
       ' CASE (select COUNT(tt2.oid) from toma_tiempos_reconocimiento tt2 where tt2.toma_tiempo_evento_oid = :toma_tiempo_evento_oid and tt2.piloto_oid = ipe.piloto_oid and is_deleted = 0) ' +
       ' WHEN 1 THEN ' + QuotedStr('*') + ' ELSE '+QuotedStr('')+' END corriendo' +
     ' from inscripcion_piloto_evento ipe ' +
     ' join toma_tiempo_evento tte on (ipe.evento_oid = tte.evento_oid) ' +
     ' left join toma_tiempos_reconocimiento tt on (tt.toma_tiempo_evento_oid = tte.oid and ipe.piloto_oid = tt.piloto_oid) ' +
     ' join piloto p on (ipe.piloto_oid = p.oid) ' +
     '   left join localidad l on p.localidad_oid = l.oid ' +
     ' where tte.oid = :toma_tiempo_evento_oid ' +
     ' and (:categoria_oid is null or :categoria_oid = 0 or :categoria_oid = sel_categoria_oid_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid)) ' +
     ' group by p.oid ' +
     ' order by categoria, max_nro_vuelta desc, tiempo_sec asc, corriendo = ' + QuotedStr('') + ', tt.oid asc' +
     ' LIMIT :skip_rows, :first_rows ) subquery ';

  Result:= sqlString;
end;

end.
