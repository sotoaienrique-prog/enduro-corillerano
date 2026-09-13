unit GrillaReconocimiento;

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
  cxCurrencyEdit, Entidades, BussinessDataSubsystemFacade;

type
  TGrillaReconocimientoForm = class(TForm)
    topPanel: TPanel;
    btnStart: TAeroButton;
    btnStop: TAeroButton;
    lblFilterEvento: TcxLabel;
    cmbEvento: TDBLookupComboBox;
    cxLabel1: TcxLabel;
    cmbTomaTiempoEvento: TDBLookupComboBox;
    cxLabel2: TcxLabel;
    cmbCategoria: TDBLookupComboBox;
    lblCampeonato: TcxLabel;
    cmbCampeonato: TDBLookupComboBox;
    bottomPanel: TPanel;
    lblTiempoCaption: TLabel;
    lblTiempoValue: TLabel;
    GrillaReconocimientoForm: TPanel;
    cxGridPosiciones: TcxGrid;
    cxGridPosicionesDBTableView: TcxGridDBTableView;
    cxGridPosicionesDBTableViewnro_moto: TcxGridDBColumn;
    cxGridPosicionesDBTableViewcategoria: TcxGridDBColumn;
    cxGridPosicionesDBTableViewnombre_piloto: TcxGridDBColumn;
    cxGridPosicionesLevel: TcxGridLevel;
    ZCampeonato: TZTable;
    DSCampeonato: TDataSource;
    DSEvento: TDataSource;
    ZEvento: TZReadOnlyQuery;
    ZTomaTiempoEvento: TZReadOnlyQuery;
    DSTomaTiempoEvento: TDataSource;
    QueryCategorias: TZQuery;
    DSCategorias: TDataSource;
    cxImageList: TcxImageList;
    ZROQReconocimiento: TZReadOnlyQuery;
    DSReconocimiento: TDataSource;
    cxGridPosicionesDBTableViewcategoria1: TcxGridDBColumn;
    cxGridPosicionesDBTableViewtiempo: TcxGridDBColumn;
    cxGridPosicionesDBTableViewtiempo_pasada: TcxGridDBColumn;
    cxGridPosicionesDBTableViewnro_vuelta: TcxGridDBColumn;
    JvTimer: TJvTimer;
    JvTimerCategorias: TJvTimer;
    JvNetscapeSplitter: TJvNetscapeSplitter;
    ZROQReconocimientoCount: TZReadOnlyQuery;
    cxStyleRepository: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    JvTimerCount: TJvTimer;
    lblTEspera: TcxLabel;
    lblSegundos: TcxLabel;
    txtTEspera: TcxCurrencyEdit;
    lblMostrarPilotos: TcxLabel;
    txtNumPilotos: TcxCurrencyEdit;
    lblPilotos: TcxLabel;
    QueryCategoriasFilter: TZQuery;
    procedure cmbTomaTiempoEventoCloseUp(Sender: TObject);
    procedure JvTimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure JvTimerCategoriasTimer(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure JvTimerCountTimer(Sender: TObject);
  private
    procedure refreshDataSetPreservePosition(Query : TDataSet);
    procedure selectCombosByDate;
    function getPositionSQL(count:Boolean; TomaTiempoEventoOID : Integer): String;
    function getCategoriasByTomaTiempo(TomaTiempoEventoOID : Integer): String;
    procedure updateGridRows;
  public
    { Public declarations }
  end;

var
  secs, skip : Integer;

implementation

{$R *.dfm}

procedure TGrillaReconocimientoForm.refreshDataSetPreservePosition(Query : TDataSet);
begin
  Query.DisableControls;
  try
    Query.Close;
    Query.Open;
  finally
    Query.EnableControls;
  end;
end;

procedure TGrillaReconocimientoForm.btnStartClick(Sender: TObject);
begin
  if (cmbEvento.KeyValue > 0) and (cmbTomaTiempoEvento.KeyValue > 0) then
    begin
      JvTimer.Enabled:= True;
      JvTimerCategorias.Enabled:= True;
      JvTimerCount.Enabled:= True;

      secs:= 4;
      lblTiempoCaption.Visible:= True;
      lblTiempoValue.Visible:= True;
      lblTiempoValue.Caption:= '00:05';
      skip:= 0;

      btnStop.Enabled:= True;
      btnStart.Enabled:= False;

      txtTEspera.Enabled:= False;
      txtNumPilotos.Enabled:= False;
      cmbEvento.Enabled:= False;
      cmbTomaTiempoEvento.Enabled:= False;
      cmbCampeonato.Enabled:= False;

      JvNetscapeSplitter.Maximized:= True;

      updateGridRows;
    end
  else
    TF_EE_Message.ShowMessage(TComponent(Self),'¡Seleccione los campos obligatorios!',
        'Debe seleccionar el Evento y la Toma de Tiempo', TF_EE_Message.WARNING, False)
end;

procedure TGrillaReconocimientoForm.btnStopClick(Sender: TObject);
begin
  JvTimer.Enabled:= False;
  JvTimerCount.Enabled:= True;
  JvTimerCategorias.Enabled:= True;
  btnStart.Enabled:= True;
  btnStop.Enabled:= False;

  secs:= 5;
  lblTiempoCaption.Visible:= False;
  lblTiempoValue.Visible:= False;
  lblTiempoValue.Caption:= '00:05';

  refreshDataSetPreservePosition(ZEvento);
  refreshDataSetPreservePosition(ZTomaTiempoEvento);
  refreshDataSetPreservePosition(QueryCategorias);

  txtTEspera.Enabled:= True;
  txtNumPilotos.Enabled:= True;
  cmbEvento.Enabled:= True;
  cmbTomaTiempoEvento.Enabled:= True;
  cmbCampeonato.Enabled:= True;
end;

procedure TGrillaReconocimientoForm.cmbTomaTiempoEventoCloseUp(Sender: TObject);
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

procedure TGrillaReconocimientoForm.FormCreate(Sender: TObject);
begin
  ZCampeonato.Active:= True;
  ZEvento.Active:= True;
  ZTomaTiempoEvento.Active:= True;
  QueryCategorias.Active:= True;
  QueryCategorias.Next;

  selectCombosByDate;
end;

procedure TGrillaReconocimientoForm.JvTimerCategoriasTimer(Sender: TObject);
var
  categoriaCount : Integer;
begin
  ZROQReconocimiento.Open;

  with ZROQReconocimientoCount do
    begin
      DisableControls;
      try
        Close;
        ParamByName('toma_tiempo_evento_oid').AsInteger:= cmbTomaTiempoEvento.KeyValue;
        ParamByName('categoria_oid').AsInteger:= QueryCategorias.FieldByName('oid').AsInteger;
        ParamByName('tiempo_espera').AsString:= txtTEspera.Text;
        Open;
      finally
        EnableControls;
      end;
    end;
  categoriaCount:= ZROQReconocimientoCount.RecordCount;

  if (skip + ZROQReconocimiento.RecordCount < categoriaCount) then
    begin
      skip:= skip + Trunc(txtNumPilotos.Value);
    end
   else
    begin
      with QueryCategorias do
        begin
          if RecNo < RecordCount then
            QueryCategorias.Next
          else
            QueryCategorias.First;

          cmbCategoria.KeyValue:= FieldByName('oid').AsInteger;
        end;

        skip:= 0;
    end;
end;

procedure TGrillaReconocimientoForm.JvTimerCountTimer(Sender: TObject);
begin
  lblTiempoValue.Caption:= '00:0' + IntToStr(secs);
  Dec(secs);
end;

procedure TGrillaReconocimientoForm.JvTimerTimer(Sender: TObject);
begin
  with ZROQReconocimiento do
    begin
      DisableControls;
      try
        Close;
        SQL.Text:= getPositionSQL(False, cmbTomaTiempoEvento.KeyValue);
        ParamByName('toma_tiempo_evento_oid').AsInteger:= cmbTomaTiempoEvento.KeyValue;
        ParamByName('categoria_oid').AsInteger:= QueryCategorias.FieldByName('oid').AsInteger;
//        ParamByName('tiempo_espera').AsString:= txtTEspera.Text;
        ParamByName('skip_rows').AsInteger:= skip;
        ParamByName('first_rows').AsInteger:= Trunc(txtNumPilotos.Value);
        Open;
      finally
        EnableControls;
        cxGridPosicionesDBTableView.ViewData.Expand(True);
      end;
    end;
  secs:= 5;
end;

procedure TGrillaReconocimientoForm.selectCombosByDate;
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

function TGrillaReconocimientoForm.getCategoriasByTomaTiempo(TomaTiempoEventoOID : Integer): String;
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

function TGrillaReconocimientoForm.getPositionSQL(count:Boolean; TomaTiempoEventoOID : Integer): String;
var
  sqlStringPrefix, sqlStringSufix, categoriasIn: String;
  eventoVO : TEvento;
  i : Integer;
  eventoPuntoControlVO : TEventoPuntoControl;
begin
  categoriasIn:= getCategoriasByTomaTiempo(TomaTiempoEventoOID);

  sqlStringPrefix:= '';

  if (not count) then
    begin
      sqlStringPrefix:= sqlStringPrefix + ' SELECT @posicion:=@posicion+1 AS posicion, subquery.* FROM (';
    end;

  sqlStringPrefix:= sqlStringPrefix + 'select sel_nro_moto_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid) nro_moto, ' +
       ' CONCAT(p.apellido, ' + QuotedStr(', ') + ' , p.nombre) as nombre_piloto, ' +
       ' sel_nombre_categoria_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid) categoria, ' +
       ' sel_handicup_by_evento_and_piloto_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid) handicup, ' +
       ' sel_recargo_by_toma_tiempo_evento_and_piloto_and_tipo_categoria(tte.oid, ipe.tipo_categoria_oid, ipe.piloto_oid) recargo, ' +
       ' sel_total_time_recono(tt.toma_tiempo_evento_oid, tt.piloto_oid) tiempo_sec, ' +
       ' sel_formatted_total_time(sel_total_time_recono(tt.toma_tiempo_evento_oid, tt.piloto_oid)) formated_tiempo_sec, ' +
       ' sel_can_vueltas_recono(tt.toma_tiempo_evento_oid, tt.piloto_oid) max_nro_vuelta ';

  eventoVO:= TBussinessDataSubsystemFacade.getInstance.getEvento(cmbEvento.KeyValue);

  if (eventoVO.PuntoDeControl.Count>0) then
    begin
      for eventoPuntoControlVO in eventoVO.PuntoDeControl do
        begin
            sqlStringPrefix:= sqlStringPrefix + ', sel_lap_time_reconocimiento(:toma_tiempo_evento_oid, p.oid, '+IntToStr(eventoPuntoControlVO.NumeroPuntoControl)+') vuelta_'+IntToStr(eventoPuntoControlVO.NumeroPuntoControl);
        end;
    end
  else
    begin
      for i:= 1 to eventoVO.NroVueltas do
        begin
          sqlStringPrefix:= sqlStringPrefix + ', sel_lap_time_reconocimiento(:toma_tiempo_evento_oid, p.oid, '+IntToStr(i)+') vuelta_'+IntToStr(i);
        end;
    end;

  sqlStringSufix:= ' from toma_tiempos_reconocimiento tt ' +
     ' join toma_tiempo_evento tte on tt.toma_tiempo_evento_oid = tte.oid ' +
     ' join piloto p on tt.piloto_oid = p.oid ' +
     ' join inscripcion_piloto_evento ipe on ' +
          ' (ipe.evento_oid = tte.evento_oid and ipe.piloto_oid = tt.piloto_oid) ' +
     ' where tte.oid = :toma_tiempo_evento_oid ' +
     ' and (:categoria_oid is null or :categoria_oid = 0 or :categoria_oid = sel_categoria_oid_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid)) ';
     if (categoriasIn <> '') then
        sqlStringSufix:= sqlStringSufix + ' and sel_categoria_oid_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid) in (' + categoriasIn + ')';
     sqlStringSufix:= sqlStringSufix + ' group by p.oid ' +
     ' order by categoria, max_nro_vuelta desc, tiempo_sec asc, tt.oid asc';
     if (not count) then
      begin
        sqlStringSufix:= sqlStringSufix + ' LIMIT :skip_rows, :first_rows ) subquery ';
      end;
  Result:= sqlStringPrefix + sqlStringSufix;
end;

procedure TGrillaReconocimientoForm.updateGridRows;
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
  AColumn.DataBinding.FieldName:= 'nro_moto';
  AColumn.Caption:= 'Nro. Moto';
  AColumn.Width:= 35;

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
  AColumn.Width:= 120;

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

//  AColumn:= cxGridPosicionesDBTableView.CreateColumn;
//  AColumn.DataBinding.ValueType:= 'String';
//  AColumn.DataBinding.FieldName:= 'max_nro_vuelta';
//  AColumn.Caption:= 'Vueltas';
//  AColumn.Width:= 35;
//
//  AColumn:= cxGridPosicionesDBTableView.CreateColumn;
//  AColumn.DataBinding.ValueType:= 'String';
//  AColumn.DataBinding.FieldName:= 'formated_tiempo_sec';
//  AColumn.Caption:= 'Tiempo Total';
//  AColumn.Width:= 55;
end;

end.
