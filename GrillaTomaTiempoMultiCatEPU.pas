unit GrillaTomaTiempoMultiCatEPU;

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
  TGrillaTomaTiempoMultiCatEPUForm = class(TForm)
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
    chkMostrarNyA: TcxCheckBox;
    cxGridPosiciones1DBTableViewColumn2: TcxGridDBColumn;
    cxGridPosiciones2DBTableViewColumn2: TcxGridDBColumn;
    cxGridPosiciones3DBTableViewColumn2: TcxGridDBColumn;
    QueryCategorias: TZQuery;
    DSCategorias: TDataSource;
    scExcelExport: TscExcelExport;
    JvTimer: TJvTimer;
    ZROQPosicionesCountcuenta: TLargeintField;
    btnExpXLSTT: TAeroButton;
    ZExcelExport: TZReadOnlyQuery;
    scExcelExportPosiciones: TscExcelExport;
    chkAgruparPorKMs: TcxCheckBox;
    chkAgruparPorSexo: TcxCheckBox;
    procedure btnStartClick(Sender: TObject);
    procedure JvTimerTimer(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmbCategoriaKeyPress(Sender: TObject; var Key: Char);
    procedure JvTimerCountTimer(Sender: TObject);
    procedure cmbCategoriaCloseUp(Sender: TObject);
    procedure cmbTomaTiempoEventoCloseUp(Sender: TObject);
    procedure btnExpXLSTTClick(Sender: TObject);
  private
     queryList, gridList : TList;

    procedure refreshDataSetPreservePosition(Query : TDataSet);
    function getCategoriasByTomaTiempo(TomaTiempoEventoOID : Integer): String;
    procedure selectCombosByDate;
    function getCategorySqlFilter: String;
    function getPositionSQL(catOIDs:String): String;
    function getExportPositionSQL(TomaTiempoEventoOID : Integer): String;
  public
    { Public declarations }
  end;

var
  secs, skip : Integer;

implementation

{$R *.dfm}

function TGrillaTomaTiempoMultiCatEPUForm.getExportPositionSQL(TomaTiempoEventoOID : Integer): String;
var
  sqlStringPrefix, sqlStringSufix, categoriasIn: String;
  eventoVO : TEvento;
  eventoPuntoControlVO : TEventoPuntoControl;
  i : Integer;
begin
  sqlStringPrefix:=
       ' SELECT @posicion:=@posicion+1 AS Pos, subquery.* FROM ( ' +
       ' SELECT sel_nro_moto_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid) ' + QuotedStr('Nro.') + ', ' +
       ' CASE WHEN c.utiliza_acompaniante = 1 THEN CONCAT(UC_Words(CONCAT(p.apellido, ' + QuotedStr(', ') + ' , p.nombre)), IFNULL(UC_Words(CONCAT(' + QuotedStr(' / ') + ', n.apellido, ' + QuotedStr(', ') + ' , n.nombre)), ' + QuotedStr(' ') + '))' +
       ' ELSE UC_Words(CONCAT(p.apellido, ' + QuotedStr(', ') + ' , p.nombre))END AS ' + QuotedStr('Piloto / Navegante') + ', ' +
       ' sel_nombre_categoria_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid) Categoria, ' +
       ' l.localidad Localidad ';

  eventoVO:= TBussinessDataSubsystemFacade.getInstance.getEvento(cmbEvento.KeyValue);

  if (eventoVO.PuntoDeControl.Count>0) then
    begin
      for eventoPuntoControlVO in eventoVO.PuntoDeControl do
        sqlStringPrefix:= sqlStringPrefix + ', CONCAT(sel_lap_time(tt.toma_tiempo_evento_oid, p.oid, '+IntToStr(eventoPuntoControlVO.NumeroPuntoControl)+'), ' + QuotedStr('.') + ') ' + QuotedStr(eventoPuntoControlVO.Nombre);
    end
  else
    begin
      for i:= 1 to eventoVO.NroVueltas do
        sqlStringPrefix:= sqlStringPrefix + ', CONCAT(sel_lap_time(tt.toma_tiempo_evento_oid, p.oid, '+IntToStr(i)+'), ' + QuotedStr('.') + ') ' + QuotedStr('Tiemp. V. #'+IntToStr(i));
    end;

  sqlStringSufix:= ', CONCAT(sel_formatted_total_time(sel_total_time_neta(tt.toma_tiempo_evento_oid, tt.piloto_oid)), ' + QuotedStr('.') + ') ' + QuotedStr('Tiempo Neto') + ', ' +
        ' CONCAT(sel_formatted_total_time(sel_total_time(tt.toma_tiempo_evento_oid, tt.piloto_oid)), ' + QuotedStr('.') + ') ' + QuotedStr('Tiempo Total') + ', ' +
        ' sel_can_vueltas(tt.toma_tiempo_evento_oid, tt.piloto_oid) VTot, ' +
        ' sel_handicup_by_evento_and_piloto_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid) ' + QuotedStr('Hand.') + ', ' +
        ' sel_recargo_by_toma_tiempo_evento_and_piloto_and_tipo_categoria(tte.oid, ipe.tipo_categoria_oid, ipe.piloto_oid) ' + QuotedStr('Rec.') + ', ' +
        ' sel_rec_desc_by_toma_tiempo_evento_and_piloto_and_tipo_categoria(tte.oid, ipe.tipo_categoria_oid, ipe.piloto_oid) ' + QuotedStr('Desc. Rec.') +
     ' from toma_tiempos tt ' +
     ' join toma_tiempo_evento tte on tt.toma_tiempo_evento_oid = tte.oid ' +
     ' join piloto p on tt.piloto_oid = p.oid ' +
     ' left join localidad l on p.localidad_oid = l.oid ' +
     ' join inscripcion_piloto_evento ipe on (ipe.evento_oid = tte.evento_oid and ipe.piloto_oid = tt.piloto_oid) ' +
     ' left join navegante n on n.piloto_oid = p.oid, categorias c ' +
     ' where tte.oid = :toma_tiempo_evento_oid ' +
     ' and (:categoria_oid is null or :categoria_oid = 0 or :categoria_oid = sel_categoria_oid_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid)) ' +
     ' and c.oid = sel_categoria_oid_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, ipe.evento_oid, ipe.piloto_oid) ' ;
     sqlStringSufix:= sqlStringSufix + ' group by p.oid ';

     sqlStringSufix:= sqlStringSufix + ' order by ';
     if (chkAgruparPorSexo.Checked = True AND chkAgruparPorSexo.Checked = True) then
      sqlStringSufix:= sqlStringSufix + ' c.sexo, c.kms, '
     else
      begin
         if (chkAgruparPorSexo.Checked = True) then
          sqlStringSufix:= sqlStringSufix + ' c.sexo, ';
         if (chkAgruparPorKMs.Checked = True) then
          sqlStringSufix:= sqlStringSufix + ' c.kms, ';
      end;
     sqlStringSufix:= sqlStringSufix + ' VTot desc, sel_total_time(tt.toma_tiempo_evento_oid, tt.piloto_oid) asc, tt.oid asc) subquery ';

  Result:= sqlStringPrefix + sqlStringSufix;
end;


procedure TGrillaTomaTiempoMultiCatEPUForm.refreshDataSetPreservePosition(Query : TDataSet);
begin
  Query.DisableControls;
  try
    Query.Close;
    Query.Open;
  finally
    Query.EnableControls;
  end;
end;

procedure TGrillaTomaTiempoMultiCatEPUForm.btnExpXLSTTClick(Sender: TObject);
begin
  if (cmbTomaTiempoEvento.KeyValue > 0) then
    begin
      ZReSetPosition.ParamByName('posicion').AsInteger:= 0;
      ZReSetPosition.ExecSQL;

      with ZExcelExport do
      begin
        DisableControls;
        try
          Close;
          SQL.Text:= getExportPositionSQL(cmbTomaTiempoEvento.KeyValue);
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

          HeaderText.Text := 'Posiciones Generales';
          BorderHeader.BackColor:= clSilver;

          //BorderData.BackAlternateColor := clGrayText;
          BeginRowHeader:= 1;

          BeginRowTitles := 2;

          ExportDataset;
          Disconnect;
        end;
    end;
end;

procedure TGrillaTomaTiempoMultiCatEPUForm.btnStartClick(Sender: TObject);
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

      cmbEvento.Enabled:= False;
      cmbTomaTiempoEvento.Enabled:= False;
      cmbCampeonato.Enabled:= False;

      JvNetscapeSplitter.Maximized:= True;

      ZReSetPosition.ParamByName('posicion').AsInteger:= 0;
      ZReSetPosition.ExecSQL;

    end
  else
    TF_EE_Message.ShowMessage(TComponent(Self),'¡Seleccione los campos obligatorios!',
        'Debe seleccionar el Evento y la Toma de Tiempo', TF_EE_Message.WARNING, False)
end;

procedure TGrillaTomaTiempoMultiCatEPUForm.btnStopClick(Sender: TObject);
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

  cmbEvento.Enabled:= True;
  cmbTomaTiempoEvento.Enabled:= True;
  cmbCampeonato.Enabled:= True;
end;

procedure TGrillaTomaTiempoMultiCatEPUForm.cmbCategoriaCloseUp(Sender: TObject);
begin
  JvTimerTimer(nil);
end;

procedure TGrillaTomaTiempoMultiCatEPUForm.cmbCategoriaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #8 then
    TDBLookupComboBox(Sender).KeyValue:= 0;
end;

procedure TGrillaTomaTiempoMultiCatEPUForm.cmbTomaTiempoEventoCloseUp(Sender: TObject);
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

procedure TGrillaTomaTiempoMultiCatEPUForm.FormCreate(Sender: TObject);
begin
  queryList := TList.Create;
  queryList.Add(ZROQPosiciones2);
  queryList.Add(ZROQPosiciones3);
  queryList.Add(ZROQPosiciones1);

  gridList := TList.Create;
  gridList.Add(cxGridPosiciones2DBTableView);
  gridList.Add(cxGridPosiciones3DBTableView);
  gridList.Add(cxGridPosiciones1DBTableView);

  ZCampeonato.Active:= True;
  ZEvento.Active:= True;
  ZTomaTiempoEvento.Active:= True;

  selectCombosByDate;
end;

procedure TGrillaTomaTiempoMultiCatEPUForm.JvTimerCountTimer(Sender: TObject);
begin
  lblTiempoValue.Caption:= '00:0' + IntToStr(secs);
  Dec(secs);
end;

procedure TGrillaTomaTiempoMultiCatEPUForm.JvTimerTimer(Sender: TObject);
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
      ParamByName('toma_tiempo_evento_oid').AsInteger:= cmbTomaTiempoEvento.KeyValue;
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
            TZReadOnlyQuery(queryList[i]).SQL.Text:= getPositionSQL(QueryCategoriasFilter.FieldByName('oids').AsString);
            TZReadOnlyQuery(queryList[i]).ParamByName('toma_tiempo_evento_oid').AsInteger:= cmbTomaTiempoEvento.KeyValue;
//            TZReadOnlyQuery(queryList[i]).ParamByName('categoria_oid').AsString:= ;
            TZReadOnlyQuery(queryList[i]).ParamByName('skip_rows').AsInteger:= skip;
            TZReadOnlyQuery(queryList[i]).ParamByName('first_rows').AsInteger:= Trunc(txtNumPilotos.Value);
            TZReadOnlyQuery(queryList[i]).Open;
          finally
            TZReadOnlyQuery(queryList[i]).EnableControls;
            TcxGridDBTableView(gridList[i]).ViewData.Expand(True);
            TcxGridDBColumn(TcxGridDBTableView(gridList[i]).Items[0]).Width:= 20; //pos
            TcxGridDBColumn(TcxGridDBTableView(gridList[i]).Items[1]).Width:= 30; //nro
            TcxGridDBColumn(TcxGridDBTableView(gridList[i]).Items[2]).Width:= 100;
            TcxGridDBColumn(TcxGridDBTableView(gridList[i]).Items[3]).Width:= 120; //Apellido
            TcxGridDBColumn(TcxGridDBTableView(gridList[i]).Items[3]).Caption:= 'Apellido';
            TcxGridDBColumn(TcxGridDBTableView(gridList[i]).Items[4]).Width:= 97; // Tiempo Total
//            TcxGridDBTableView(gridList[i]).Items[3].Visible:= chkMostrarNyA.Checked;
            AGridView := TcxGridLevel(TcxGridDBTableView(gridList[i]).Level).Control as TcxGrid;
            AGridView.Visible:= True;
//            AGridView.Width:= Trunc(gridPanel.Width / QueryCategoriasFilter.RecordCount);

            ZReSetPosition.ParamByName('posicion').AsInteger:= skip;
            ZReSetPosition.ExecSQL;
          end;
          i:=i+1;
        end;
        Next;
      end;

      //for j:= i to queryList.Count - 1 do
      //  begin
      //    AGridView := TcxGridLevel(TcxGridDBTableView(gridList[j]).Level).Control as TcxGrid;
      //    AGridView.Visible:= False;
      //  end;
    end;

   secs:= 5;
end;

function TGrillaTomaTiempoMultiCatEPUForm.getCategorySqlFilter: String;
var
  sqlString, categoriasNameLIKE: String;
  nI, categoriaOID : Integer;
begin
  categoriasNameLIKE:= '';

  sqlString:=
       ' SELECT GROUP_CONCAT(tabla.oid) as oids FROM( ' +
       ' select DISTINCT cat.oid, cat.kms from toma_tiempos tt ' +
       '      join toma_tiempo_evento tte on tt.toma_tiempo_evento_oid = tte.oid ' +
       '      join piloto p on tt.piloto_oid = p.oid, categorias cat ' +
       ' where sel_categoria_oid_by_evento_and_tipo_categoria((select min(ipe.tipo_categoria_oid) ' +
       '                          from inscripcion_piloto_evento ipe ' +
       '                          where ipe.evento_oid = tte.evento_oid ' +
       '                          and ipe.piloto_oid = p.oid), tte.evento_oid, p.oid) = cat.oid ' +
       ' and tte.oid = :toma_tiempo_evento_oid '+
       ' and tt.is_deleted = 0 ' +
       ' ) tabla GROUP BY tabla.kms';

  Result:= sqlString;
end;

function TGrillaTomaTiempoMultiCatEPUForm.getCategoriasByTomaTiempo(TomaTiempoEventoOID : Integer): String;
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

procedure TGrillaTomaTiempoMultiCatEPUForm.selectCombosByDate;
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


function TGrillaTomaTiempoMultiCatEPUForm.getPositionSQL(catOIDs:String): String;
var
  sqlString: String;
begin

  sqlString:=
       'SELECT @posicion:=@posicion+1 AS posicion, subquery.* FROM ( ' +
       ' SELECT sel_nro_moto_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid) nro_moto, ' +
       ' p.apellido as nombre_piloto, ' +
       ' sel_nombre_categoria_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid) categoria, ' +
       ' sel_formatted_total_time(sel_total_time(tt.toma_tiempo_evento_oid, tt.piloto_oid)) formated_tiempo_sec ' +

       ' from toma_tiempos tt ' +
       ' join toma_tiempo_evento tte on tt.toma_tiempo_evento_oid = tte.oid ' +
       ' join piloto p on tt.piloto_oid = p.oid ' +
       ' join inscripcion_piloto_evento ipe on (ipe.evento_oid = tte.evento_oid and ipe.piloto_oid = tt.piloto_oid) ' +
       ' where tte.oid = :toma_tiempo_evento_oid ' +
       '    and sel_categoria_oid_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid) in ('+catOIDS+') ' +
       ' group by p.oid ' +
       ' order by sel_can_vueltas(tt.toma_tiempo_evento_oid, tt.piloto_oid) desc, ' +
       ' sel_total_time(tt.toma_tiempo_evento_oid, tt.piloto_oid) asc, tt.oid asc ' +
       ' LIMIT :skip_rows, :first_rows ) subquery';

  Result:= sqlString;
end;

end.
