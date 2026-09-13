unit GrillaAgrupacionTomasMultiCat;

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
  JvCheckListBox, scExcelExport;

type
  TGrillaAgrupacionMultiCatForm = class(TForm)
    topPanel: TPanel;
    btnStart: TAeroButton;
    btnStop: TAeroButton;
    JvNetscapeSplitter: TJvNetscapeSplitter;
    DSTomaTiempoEvento: TDataSource;
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
    DSAgrupacion: TDataSource;
    ZAgrupacion: TZTable;
    lblCampeonato: TcxLabel;
    cmbAgrupacion: TDBLookupComboBox;
    ZReSetPosition: TZQuery;
    ZROQPosicionesCount: TZReadOnlyQuery;
    lblMostrarPilotos: TcxLabel;
    txtNumPilotos: TcxCurrencyEdit;
    lblPilotos: TcxLabel;
    QueryCategoriasFilter: TZQuery;
    ZROQPosiciones2: TZReadOnlyQuery;
    DSPosiciones2: TDataSource;
    ZROQPosiciones3: TZReadOnlyQuery;
    DSPosiciones3: TDataSource;
    ZROQPosiciones4: TZReadOnlyQuery;
    DSPosiciones4: TDataSource;
    ZROQPosiciones5: TZReadOnlyQuery;
    DSPosiciones5: TDataSource;
    ZROQPosiciones6: TZReadOnlyQuery;
    DSPosiciones6: TDataSource;
    ZROQPosiciones7: TZReadOnlyQuery;
    DSPosiciones7: TDataSource;
    chkMostrarNyA: TcxCheckBox;
    cxLabel2: TcxLabel;
    QueryCategorias: TZQuery;
    DSCategorias: TDataSource;
    CategoriaCheckListBox: TJvCheckListBox;
    JvTimer: TJvTimer;
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
    cxGridPosiciones1DBTableViewColumn3: TcxGridDBColumn;
    cxGridPosiciones2DBTableViewColumn3: TcxGridDBColumn;
    cxGridPosiciones3DBTableViewColumn3: TcxGridDBColumn;
    cxGridPosiciones4DBTableViewColumn2: TcxGridDBColumn;
    cxGridPosiciones5DBTableViewColumn2: TcxGridDBColumn;
    cxGridPosiciones6DBTableViewColumn2: TcxGridDBColumn;
    cxGridPosiciones7DBTableViewColumn2: TcxGridDBColumn;
    cxGridPosiciones1DBTableViewColumn4: TcxGridDBColumn;
    cxGridPosiciones2DBTableViewColumn4: TcxGridDBColumn;
    cxGridPosiciones3DBTableViewColumn4: TcxGridDBColumn;
    cxGridPosiciones4DBTableViewColumn3: TcxGridDBColumn;
    cxGridPosiciones5DBTableViewColumn3: TcxGridDBColumn;
    cxGridPosiciones6DBTableViewColumn3: TcxGridDBColumn;
    cxGridPosiciones7DBTableViewColumn3: TcxGridDBColumn;
    scExcelExport: TscExcelExport;
    procedure btnStartClick(Sender: TObject);
    procedure JvTimerTimer(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmbCategoriaKeyPress(Sender: TObject; var Key: Char);
    procedure JvTimerCountTimer(Sender: TObject);
    procedure cmbCategoriaCloseUp(Sender: TObject);
    procedure cmbAgrupacionCloseUp(Sender: TObject);
  private
     queryList, gridList : TList;

    procedure refreshDataSetPreservePosition(Query : TDataSet);
    function getCategoriasByTomaTiempo(TomaTiempoEventoOID : Integer): String;
    function getCategorySqlFilter: String;
    function getPositionSQL(): String;
  public
    { Public declarations }
  end;

var
  secs, skip : Integer;

implementation

{$R *.dfm}

procedure TGrillaAgrupacionMultiCatForm.refreshDataSetPreservePosition(Query : TDataSet);
begin
  Query.DisableControls;
  try
    Query.Close;
    Query.Open;
  finally
    Query.EnableControls;
  end;
end;

procedure TGrillaAgrupacionMultiCatForm.btnStartClick(Sender: TObject);
begin
  if (cmbAgrupacion.KeyValue > 0) then
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

      cmbAgrupacion.Enabled:= False;

      JvNetscapeSplitter.Maximized:= True;

      ZReSetPosition.ParamByName('posicion').AsInteger:= 0;
      ZReSetPosition.ExecSQL;

    end
  else
    TF_EE_Message.ShowMessage(TComponent(Self),'¡Seleccione los campos obligatorios!',
        'Debe seleccionar el Evento y la Toma de Tiempo', TF_EE_Message.WARNING, False)
end;

procedure TGrillaAgrupacionMultiCatForm.btnStopClick(Sender: TObject);
begin
  JvTimer.Enabled:= False;
  JvTimerCount.Enabled:= True;

  btnStart.Enabled:= True;
  btnStop.Enabled:= False;

  secs:= 5;
  lblTiempoCaption.Visible:= False;
  lblTiempoValue.Visible:= False;
  lblTiempoValue.Caption:= '00:05';

  refreshDataSetPreservePosition(ZTomaTiempoEvento);
  refreshDataSetPreservePosition(QueryCategorias);

  cmbAgrupacion.Enabled:= True;
end;

procedure TGrillaAgrupacionMultiCatForm.cmbAgrupacionCloseUp(Sender: TObject);
begin
  if (cmbAgrupacion.KeyValue > 0) then
    begin
      with QueryCategorias do
        begin
          Close;
          ParamByName('toma_tiempo_agrupacion_oid').AsInteger:= cmbAgrupacion.KeyValue;
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

procedure TGrillaAgrupacionMultiCatForm.cmbCategoriaCloseUp(Sender: TObject);
begin
  JvTimerTimer(nil);
end;

procedure TGrillaAgrupacionMultiCatForm.cmbCategoriaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #8 then
    TDBLookupComboBox(Sender).KeyValue:= 0;
end;

procedure TGrillaAgrupacionMultiCatForm.FormCreate(Sender: TObject);
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

  ZTomaTiempoEvento.Active:= True;
  ZAgrupacion.Active:= True;
end;

procedure TGrillaAgrupacionMultiCatForm.JvTimerCountTimer(Sender: TObject);
begin
  lblTiempoValue.Caption:= '00:0' + IntToStr(secs);
  Dec(secs);
end;

procedure TGrillaAgrupacionMultiCatForm.JvTimerTimer(Sender: TObject);
var
  nI, i, j, categoriaCount : Integer;
  AGridView: TcxGrid;
  categoriasNameIn : String;
begin
   ZReSetPosition.ParamByName('posicion').AsInteger:= 0;
   ZReSetPosition.ExecSQL;

  with QueryCategoriasFilter do
  begin
    Close;
    Sql.Text:= getCategorySqlFilter;
    ParamByName('toma_tiempo_agrupacion').AsInteger:= cmbAgrupacion.KeyValue;
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
            TZReadOnlyQuery(queryList[i]).ParamByName('toma_tiempo_agrupacion_oid').AsInteger:= cmbAgrupacion.KeyValue;
            TZReadOnlyQuery(queryList[i]).ParamByName('categoria_oid').AsInteger:= QueryCategoriasFilter.FieldByName('oid').AsInteger;
            TZReadOnlyQuery(queryList[i]).Open;
          finally
            TZReadOnlyQuery(queryList[i]).EnableControls;
            TcxGridDBTableView(gridList[i]).ViewData.Expand(True);
            TcxGridDBColumn(TcxGridDBTableView(gridList[i]).Items[0]).Width:= 14; //pos
            TcxGridDBColumn(TcxGridDBTableView(gridList[i]).Items[1]).Width:= 30; //nro
            TcxGridDBColumn(TcxGridDBTableView(gridList[i]).Items[2]).Width:= 100;
            TcxGridDBColumn(TcxGridDBTableView(gridList[i]).Items[3]).Width:= 70;
            TcxGridDBColumn(TcxGridDBTableView(gridList[i]).Items[4]).Width:= 20;
            TcxGridDBColumn(TcxGridDBTableView(gridList[i]).Items[5]).Width:= 25;
            TcxGridDBColumn(TcxGridDBTableView(gridList[i]).Items[6]).Width:= 85;
            TcxGridDBTableView(gridList[i]).Items[3].Visible:= chkMostrarNyA.Checked;
            AGridView := TcxGridLevel(TcxGridDBTableView(gridList[i]).Level).Control as TcxGrid;
            AGridView.Visible:= True;
            AGridView.Width:= Trunc(gridPanel.Width / QueryCategoriasFilter.RecordCount);

            ZReSetPosition.ParamByName('posicion').AsInteger:= 0;
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

function TGrillaAgrupacionMultiCatForm.getCategorySqlFilter: String;
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
       '   join piloto p on ipe.piloto_oid = p.oid, categorias cat  ' +
       '  where sel_categoria_oid_by_evento_and_tipo_categoria((select min(ipe.tipo_categoria_oid)  ' +
       '                          from inscripcion_piloto_evento ipe ' +
       '                          where ipe.evento_oid = ipe.evento_oid ' +
       '                          and ipe.piloto_oid = p.oid), ipe.evento_oid, p.oid) = cat.oid ' +
       ' and ipe.evento_oid = (select distinct tte.evento_oid ' +
       ' from toma_tiempo_agrupacion tta ' +
       '     inner join toma_tiempo_agrupacion_tt ttat on ttat.toma_tiempo_agrupacion_oid = tta.oid '+
       '     inner join toma_tiempo_evento tte on ttat.toma_tiempo_oid = tte.oid '+
       ' where tta.oid = :toma_tiempo_agrupacion)';
   if (categoriasNameIn<>'') then  sqlString:=sqlString+ ' and cat.oid IN ('+categoriasNameIn+') '+
   ' order by  cat.orden is null, cat.orden asc';

  Result:= sqlString;
end;

function TGrillaAgrupacionMultiCatForm.getCategoriasByTomaTiempo(TomaTiempoEventoOID : Integer): String;
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
  with QueryCategorias do
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

function TGrillaAgrupacionMultiCatForm.getPositionSQL(): String;
var
  sqlString: String;
  i : Integer;
begin
  sqlString:= ' SELECT @posicion:=@posicion+1 AS posicion, subquery.* FROM (' +
  ' SELECT nro_competidor as nro_moto, nombre_piloto, Categoria, '+
       ' sel_formatted_total_time(SUM(tiempo_total)) formated_tiempo_sec, SUM(ranking.Vueltas) vueltas, SUM(ranking.Recargo) Recargo ' +
       ' from (select p.oid as piloto_oid, sel_nro_moto_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid) nro_competidor, ' +
       ' p.apellido nombre_piloto,' +
       ' sel_nombre_categoria_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid) Categoria,  ' +
       ' sel_total_time_recono(tte.oid, ipe.piloto_oid) tiempo_total, ' +
       ' sel_recargo_by_toma_tiempo_evento_and_piloto_and_tipo_categoria(tte.oid, ipe.tipo_categoria_oid, ipe.piloto_oid) Recargo, ' +
       ' sel_can_vueltas_recono(tte.oid, ipe.piloto_oid) Vueltas '+
     ' from inscripcion_piloto_evento ipe ' +
     '  join toma_tiempo_evento tte on (ipe.evento_oid = tte.evento_oid) ' +
     '  left join toma_tiempos_reconocimiento tt on (tt.toma_tiempo_evento_oid = tte.oid and ipe.piloto_oid = tt.piloto_oid) ' +
     '  join piloto p on (ipe.piloto_oid = p.oid) ' +
     ' where tte.oid in (SELECT DISTINCT toma_tiempo_oid FROM toma_tiempo_agrupacion_tt WHERE toma_tiempo_agrupacion_oid = :toma_tiempo_agrupacion_oid) ' +
       '    and :categoria_oid = sel_categoria_oid_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid) ' +
     ' group by p.oid, tte.oid) ranking   ' +
     '    group by nro_competidor, nombre_piloto, Categoria ' +
     '    order by Categoria, Vueltas desc, formated_tiempo_sec asc ) subquery ';

  Result:= sqlString;
end;



end.
