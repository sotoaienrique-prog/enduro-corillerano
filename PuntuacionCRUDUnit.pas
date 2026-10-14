unit PuntuacionCRUDUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AbstractCRUD, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
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
  dxSkinXmas2008Blue, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, Data.DB, cxDBData, Vcl.ComCtrls, cxContainer,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, Vcl.Menus, AdvMenus,
  Data.Bind.Components, ZAbstractRODataset, ZDataset, Vcl.ImgList,
  dxGDIPlusClasses, HotSpotImage, cxLabel, AdvSmoothLabel, cxListView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxSplitter, Vcl.StdCtrls,
  AeroButtons, Vcl.ExtCtrls, JvMemoryDataset, Vcl.DBCtrls, ZAbstractDataset,
  ZAbstractTable, BindingHelperUnit, Entidades, BussinessDataSubsystemFacade,
  JvExExtCtrls, JvNetscapeSplitter, Vcl.ActnList, cxLocalization, Vcl.ToolWin,
  ReportPuestoEvento, ReportTotalPuestoEvento, ReportePuntuacionEvento,
  F_EEMessage, JvComponentBase, JvDBGridExport, scExcelExport, Vcl.OleServer,
  Excel2010, QRCtrls, QuickRpt;

type
  TPuntuacionCRUD = class(TAbstractCRUDFrame)
    JvMemoryData: TJvMemoryData;
    ZCampeonato: TZTable;
    DSCampeonato: TDataSource;
    DSEvento: TDataSource;
    lblEvento: TcxLabel;
    cmbEvento: TDBLookupComboBox;
    lblCampeonato: TcxLabel;
    cmbCampeonato: TDBLookupComboBox;
    ZCategoria: TZTable;
    DSCategoria: TDataSource;
    cxLabel2: TcxLabel;
    cmbCategoria: TDBLookupComboBox;
    cxGridDBTableViewPilotoDataField: TcxGridDBColumn;
    cxGridDBTableViewPuntosDataField: TcxGridDBColumn;
    ZEvento: TZReadOnlyQuery;
    cxGridDBTableViewCategoria: TcxGridDBColumn;
    cxGridDBTableViewPuesto: TcxGridDBColumn;
    ZGetPuntoByPuesto: TZReadOnlyQuery;
    cxGridDBTableViewNroMoto: TcxGridDBColumn;
    cxGridDBTableViewMM: TcxGridDBColumn;
    cxGridDBTableViewPtosExtra: TcxGridDBColumn;
    btnImprTabla: TAeroButton;
    btnImprTablaEvento: TAeroButton;
    cxErrorImageList: TcxImageList;
    btnPuntuacionEvento: TAeroButton;
    btnHistoricoPiloto: TAeroButton;
    ZQueryHisorico: TZQuery;
    btnExportarExcel: TAeroButton;
    ZSelectReporteEvento: TZReadOnlyQuery;
    scExcelExport: TscExcelExport;
    btnImportPilotos: TAeroButton;
    btnImprTablaExcel: TAeroButton;
    ZEventos: TZReadOnlyQuery;
    ZReSetPosition: TZQuery;
    Excel: TExcelApplication;
    ZGetPuntoExtraByPuesto: TZReadOnlyQuery;
    btnClasifGralWeb: TAeroButton;
    procedure cmbEventoExit(Sender: TObject);
    procedure cmbEventoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnFilterClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure cmbCategoriaKeyPress(Sender: TObject; var Key: Char);
    procedure JvMemoryDataDummyBeforePost(DataSet: TDataSet);
    procedure JvMemoryDataBeforeEdit(DataSet: TDataSet);
    procedure JvMemoryDataAfterEdit(DataSet: TDataSet);
    procedure btnImprTablaEventoClick(Sender: TObject);
    procedure btnImprTablaClick(Sender: TObject);
    procedure btnPuntuacionEventoClick(Sender: TObject);
    procedure cxGridDBTableViewEditValueChanged(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem);
    procedure btnHistoricoPilotoClick(Sender: TObject);
    procedure btnExportarExcelClick(Sender: TObject);
    procedure btnImportPilotosClick(Sender: TObject);
    procedure btnImprTablaExcelClick(Sender: TObject);
    procedure btnClasifGralWebClick(Sender: TObject);
  private
    procedure generateEventoCategoriaTable;
    procedure inicializarTablas;

    function getPuntosByPuesto(Puesto: Integer): Integer;
    function getPuntosExtraByPuesto(Puesto: Integer): Integer;

    procedure setTListItemsByString(errorListView : TcxListView; stringMessage: String);

    function buildSqlString(EventoOID: Integer; TodasLasCategorias: Boolean = False): String;
    function GenerarHTMLClasifCampeonato(Dataset, Eventos: TDataSet): String;
  protected
    procedure InitializeBinding; Override;
    procedure requestLoadInitialData(filterVO: TValueObject); Override;
    procedure doRequestSave(persistentVO: TPersistentObject); Override;
    function requestElement(OID: Integer): TPersistentObject; Override;
    procedure requestDelete(OID: Integer); Override;

    function isPuestoInTable(puesto : String; OID: Integer): Boolean;
  public
    constructor Create(owner: TComponent); Override;
    procedure RefreshCRUDData;
  end;

var
  PuntuacionCRUD: TPuntuacionCRUD;
  isGeneratingTable: Boolean;

implementation

uses
  System.Win.ComObj, ConfigureFilesUtilities, EditAgrupacionTomaTiempos;

{$R *.dfm}

procedure TPuntuacionCRUD.RefreshCRUDData;
begin
  ZCategoria.Close;
  ZCategoria.Open;

  ZCampeonato.Close;
  ZCampeonato.Open;

  ZEvento.Close;
  ZEvento.Open;
end;

procedure TPuntuacionCRUD.setTListItemsByString(errorListView : TcxListView; stringMessage: String);
var
  Index : Integer;
  stringList : TStringList;
begin
  stringList:= TStringList.Create;
  stringList.Add(stringMessage);

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

constructor TPuntuacionCRUD.Create(owner: TComponent);
begin
  inherited Create(owner);
  inicializarTablas;

  isGeneratingTable:= False;
end;


procedure TPuntuacionCRUD.cxGridDBTableViewEditValueChanged(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
var
  puesto : String;
begin
  if ((not isGeneratingTable) and (cxGridDBTableViewPuesto = AItem)) then
    begin
      Sender.DataController.PostEditingData;
      puesto:= AItem.EditValue;

      if(ZEvento.FieldByName('usa_puntos_extra').AsInteger = 1) then
        JvMemoryData.FieldByName('PuntosExtraDataField').AsInteger:=  getPuntosExtraByPuesto(StrToInt(puesto));

      JvMemoryData.FieldByName('PuntosDataField').AsInteger:=
        getPuntosByPuesto(StrToInt(puesto)) + JvMemoryData.FieldByName('PuntosExtraDataField').AsInteger;
    end;

end;

procedure TPuntuacionCRUD.inicializarTablas;
begin
  ZCampeonato.Active:= True;
  ZEvento.Active:= True;
  ZCategoria.Active:= True;
  JvMemoryData.Active:= True;
end;

procedure TPuntuacionCRUD.btnClasifGralWebClick(Sender: TObject);
var
  Query: TZReadOnlyQuery;
  IdDestino: String;
begin
  if not ((cmbCampeonato.KeyValue > 0) and (cmbEvento.KeyValue > 0)) then
  begin
    setTListItemsByString(errorListView, 'Debe seleccionar un Evento y el Campeonato para publicar la Clasificación General Web.');
    Exit;
  end;

  IdDestino := ReadStringFromIniFile('Instancia', 'IdCampeonato', 'campeonato');

  // Query propia: no se pisa el SQL de ZSelectReporteEvento que usan los otros botones
  Query := TZReadOnlyQuery.Create(nil);
  Screen.Cursor := crHourGlass;
  try
    try
      Query.Connection := ZSelectReporteEvento.Connection;

      ZReSetPosition.ParamByName('posicion').AsInteger:= 0;
      ZReSetPosition.ExecSQL;

      // Mismo SQL que el Excel "Clasif. Gral. Camp", sin filtrar por categoría.
      // buildSqlString deja ZEventos abierto por nro_fecha asc: es el orden de las columnas Pos #n / Ptos #n.
      Query.SQL.Text := buildSqlString(cmbEvento.KeyValue, True);
      Query.ParamByName('evento_oid').AsInteger:= cmbEvento.KeyValue;
      Query.ParamByName('campeonato_oid').AsInteger:= cmbCampeonato.KeyValue;
      Query.Open;

      if Query.RecordCount = 0 then
      begin
        Screen.Cursor := crDefault;
        TF_EE_Message.ShowMessage(TComponent(Self), 'Clasificación General Web',
          'No hay puntos cargados para el evento seleccionado.', TF_EE_Message.WARNING, True);
        Exit;
      end;

      PublicarEnWorker(GenerarHTMLClasifCampeonato(Query, ZEventos),
        'campeonato_temp.html', 'text/html; charset=utf-8', '/', IdDestino);

      Screen.Cursor := crDefault;
      TF_EE_Message.ShowMessage(TComponent(Self), 'Clasificación General Web',
        'Se publicó la clasificación general de todas las categorías del evento.' + sLineBreak +
        'Id de publicación: ' + IdDestino, TF_EE_Message.INFORMATION, True);
    except
      on E: Exception do
      begin
        Screen.Cursor := crDefault;
        TF_EE_Message.ShowMessage(TComponent(Self), 'Clasificación General Web',
          'No se pudo publicar: ' + E.Message, TF_EE_Message.ERROR, True);
      end;
    end;
  finally
    Screen.Cursor := crDefault;
    Query.Free;
  end;
end;

function TPuntuacionCRUD.GenerarHTMLClasifCampeonato(Dataset, Eventos: TDataSet): String;
var
  List, Conteo: TStringList;
  CabeceraFechas, SubCabeceraFechas, CategoriaActual, Fila, Clase: String;
  PrimerPar, CantFechas, k, PosEnCat, NroCategoria, PosFecha, PtosFecha: Integer;

  function HtmlEsc(const S: String): String;
  begin
    Result := StringReplace(S, '&', '&amp;', [rfReplaceAll]);
    Result := StringReplace(Result, '<', '&lt;', [rfReplaceAll]);
    Result := StringReplace(Result, '>', '&gt;', [rfReplaceAll]);
    Result := StringReplace(Result, '"', '&quot;', [rfReplaceAll]);
  end;

  function Medalla(Pos: Integer): String;
  begin
    case Pos of
      1: Result := '&#129351;';
      2: Result := '&#129352;';
      3: Result := '&#129353;';
    else
      Result := IntToStr(Pos);
    end;
  end;

  procedure AbrirTabla(const Categoria: String);
  begin
    Inc(NroCategoria);
    List.Add('  <div class="categoria-card" id="cat-' + IntToStr(NroCategoria) + '">');
    List.Add('    <div class="categoria-header">');
    List.Add('      <span class="categoria-nombre">' + HtmlEsc(Categoria) + '</span>');
    List.Add('      <span class="categoria-count">' + Conteo.Values[Categoria] + ' pilotos</span>');
    List.Add('    </div>');
    List.Add('    <div class="tabla-scroll">');
    List.Add('    <table class="tabla-camp">');
    List.Add('      <thead>');
    List.Add('        <tr><th rowspan="2">Pos</th><th rowspan="2">Num.</th><th rowspan="2">Tot</th>' +
      '<th rowspan="2" class="izq">Competidor</th><th rowspan="2" class="izq">Localidad</th>' +
      '<th rowspan="2" class="izq">Moto</th>' + CabeceraFechas + '<th rowspan="2">Total</th></tr>');
    List.Add('        <tr>' + SubCabeceraFechas + '</tr>');
    List.Add('      </thead>');
    List.Add('      <tbody>');
  end;

  procedure CerrarTabla;
  begin
    List.Add('      </tbody>');
    List.Add('    </table>');
    List.Add('    </div>');
    List.Add('  </div>');
  end;

begin
  List := TStringList.Create;
  Conteo := TStringList.Create;
  try
    // Las columnas Pos #n / Ptos #n van de a pares entre Categoria y Total (ver buildSqlString)
    PrimerPar := Dataset.FieldByName('Categoria').Index + 1;
    CantFechas := (Dataset.FieldByName('Total').Index - PrimerPar) div 2;

    // Cabecera de fechas en el mismo orden (nro_fecha asc) con que buildSqlString armó las columnas
    CabeceraFechas := '';
    SubCabeceraFechas := '';
    k := 0;
    Eventos.First;
    while (not Eventos.Eof) and (k < CantFechas) do
    begin
      Inc(k);
      if k = CantFechas then
        Clase := ' class="actual"'
      else
        Clase := '';
      CabeceraFechas := CabeceraFechas + '<th colspan="2"' + Clase + '>Fecha ' +
        Eventos.FieldByName('nro_fecha').AsString + '<br><span class="fecha-nombre">' +
        HtmlEsc(Eventos.FieldByName('nombre').AsString) + '</span></th>';
      SubCabeceraFechas := SubCabeceraFechas + '<th class="sub">Pos</th><th class="sub sep">Ptos</th>';
      Eventos.Next;
    end;

    // Pilotos por categoría (y orden de categorías para el índice)
    Dataset.First;
    while not Dataset.Eof do
    begin
      CategoriaActual := Trim(Dataset.FieldByName('Categoria').AsString);
      Conteo.Values[CategoriaActual] := IntToStr(StrToIntDef(Conteo.Values[CategoriaActual], 0) + 1);
      Dataset.Next;
    end;

    List.Add('<style>');
    List.Add('  body { background-color: #f5f6f8; }');
    List.Add('  .camp-wrap { font-family: Arial, Helvetica, sans-serif; color: #1f2d3d; }');
    List.Add('  .camp-header { background: #ffffff; border-radius: 10px; box-shadow: 0 2px 6px rgba(0,0,0,0.12); padding: 16px 20px; margin-bottom: 16px; text-align: center; }');
    List.Add('  .camp-titulo { font-size: 20px; font-weight: bold; color: #1f3b5c; }');
    List.Add('  .camp-subtitulo { font-size: 14px; color: #4f6475; margin-top: 4px; }');
    List.Add('  .camp-actualizado { font-size: 12px; color: #7f8c8d; margin-top: 8px; }');
    List.Add('  .camp-indice { text-align: center; margin-bottom: 20px; line-height: 2.4; }');
    List.Add('  .camp-indice a { display: inline-block; padding: 2px 12px; margin: 0 3px; border: 1px solid #95b3d7; border-radius: 14px; background: #ffffff; color: #1f3b5c; font-size: 13px; text-decoration: none; }');
    List.Add('  .camp-indice a:hover { background: #dce6f1; }');
    List.Add('  .categoria-card { background: #ffffff; border-radius: 10px; box-shadow: 0 2px 6px rgba(0,0,0,0.12); margin-bottom: 24px; overflow: hidden; }');
    List.Add('  .categoria-header { background: #366092; color: #ffffff; padding: 12px 16px; display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; }');
    List.Add('  .categoria-nombre { font-size: 16px; font-weight: bold; }');
    List.Add('  .categoria-count { font-size: 13px; opacity: 0.85; }');
    List.Add('  .tabla-scroll { overflow-x: auto; -webkit-overflow-scrolling: touch; width: 100%; }');
    List.Add('  .tabla-camp { border-collapse: collapse; width: 100%; min-width: 900px; }');
    List.Add('  .tabla-camp th { background: #4f81bd; color: #ffffff; font-size: 12px; padding: 6px 8px; border: 1px solid #95b3d7; white-space: nowrap; }');
    List.Add('  .tabla-camp th.actual { background: #2f5f98; }');
    List.Add('  .tabla-camp th.sub { background: #5b8ac6; font-weight: normal; }');
    List.Add('  .tabla-camp .fecha-nombre { font-weight: normal; font-size: 11px; opacity: 0.9; }');
    List.Add('  .tabla-camp td { padding: 6px 8px; text-align: center; font-size: 13px; border-bottom: 1px solid #95b3d7; white-space: nowrap; }');
    List.Add('  .tabla-camp tbody tr:nth-child(odd) td { background: #dce6f1; }');
    List.Add('  .tabla-camp tbody tr:hover td { background: #c5d9f1; }');
    List.Add('  .tabla-camp .izq { text-align: left; }');
    List.Add('  .tabla-camp .nombre { font-weight: bold; }');
    List.Add('  .tabla-camp .sep { border-right: 1px solid #95b3d7; }');
    List.Add('  .tabla-camp .nc { color: #9aa5b1; }');
    List.Add('  .tabla-camp .pos, .tabla-camp .tot { font-weight: bold; }');
    List.Add('  .tabla-camp .total { font-weight: bold; font-size: 14px; color: #1f3b5c; }');
    List.Add('  .top1 { color: #d4af37; }');
    List.Add('  .top2 { color: #a7a7ad; }');
    List.Add('  .top3 { color: #cd7f32; }');
    List.Add('</style>');

    List.Add('<div class="camp-wrap">');
    List.Add('  <div class="camp-header">');
    List.Add('    <div class="camp-titulo">' + HtmlEsc(cmbCampeonato.Text) + '</div>');
    List.Add('    <div class="camp-subtitulo">Clasificaci&oacute;n general del campeonato &middot; actualizada a la Fecha ' + HtmlEsc(cmbEvento.Text) + '</div>');
    List.Add('    <div class="camp-actualizado">&Uacute;ltima actualizaci&oacute;n: ' + FormatDateTime('dd-mm-yyyy hh:nn', Now) + '</div>');
    List.Add('  </div>');

    // Índice de categorías (links a cada tabla)
    Fila := '  <div class="camp-indice">';
    for k := 0 to Conteo.Count - 1 do
      Fila := Fila + '<a href="#cat-' + IntToStr(k + 1) + '">' + HtmlEsc(Conteo.Names[k]) + '</a>';
    List.Add(Fila + '</div>');

    CategoriaActual := '';
    NroCategoria := 0;
    PosEnCat := 0;
    Dataset.First;
    while not Dataset.Eof do
    begin
      if (NroCategoria = 0) or (Trim(Dataset.FieldByName('Categoria').AsString) <> CategoriaActual) then
      begin
        if NroCategoria > 0 then
          CerrarTabla;
        CategoriaActual := Trim(Dataset.FieldByName('Categoria').AsString);
        AbrirTabla(CategoriaActual);
        PosEnCat := 0;
      end;

      // Posición por categoría (el @posicion del SQL es corrido para todas)
      Inc(PosEnCat);
      case PosEnCat of
        1: Clase := 'pos top1';
        2: Clase := 'pos top2';
        3: Clase := 'pos top3';
      else
        Clase := 'pos';
      end;

      Fila := '        <tr><td class="' + Clase + '">' + Medalla(PosEnCat) + '</td>' +
        '<td>' + HtmlEsc(Dataset.FieldByName('Num.').AsString) + '</td>' +
        '<td class="tot">' + IntToStr(Dataset.FieldByName('Tot').AsInteger) + '</td>' +
        '<td class="izq nombre">' + HtmlEsc(Dataset.FieldByName('Competidor').AsString) + '</td>' +
        '<td class="izq">' + HtmlEsc(Dataset.FieldByName('Localidad').AsString) + '</td>' +
        '<td class="izq">' + HtmlEsc(Dataset.FieldByName('Moto').AsString) + '</td>';

      for k := 0 to CantFechas - 1 do
      begin
        PosFecha := Dataset.Fields[PrimerPar + 2 * k].AsInteger;
        PtosFecha := Dataset.Fields[PrimerPar + 2 * k + 1].AsInteger;
        if (PosFecha = 0) and (PtosFecha = 0) then
          // No corrió esa fecha
          Fila := Fila + '<td class="nc">&ndash;</td><td class="nc sep">&ndash;</td>'
        else
        begin
          if PosFecha = 0 then
            Fila := Fila + '<td class="nc">&ndash;</td>'
          else
            Fila := Fila + '<td>' + IntToStr(PosFecha) + '</td>';
          Fila := Fila + '<td class="sep">' + IntToStr(PtosFecha) + '</td>';
        end;
      end;

      Fila := Fila + '<td class="total">' + IntToStr(Dataset.FieldByName('Total').AsInteger) + '</td></tr>';
      List.Add(Fila);

      Dataset.Next;
    end;

    if NroCategoria > 0 then
      CerrarTabla;

    List.Add('</div>');

    Result := List.Text;
  finally
    Conteo.Free;
    List.Free;
  end;
end;

procedure TPuntuacionCRUD.btnExportarExcelClick(Sender: TObject);
begin
  if ((cmbCampeonato.KeyValue > 0) and (cmbEvento.KeyValue > 0) ) then
  begin

    with ZSelectReporteEvento do
    begin
      Close;
      ParamByName('evento_oid').AsInteger:= cmbEvento.KeyValue;
      ParamByName('campeonato_oid').AsInteger:= cmbCampeonato.KeyValue;
      ParamByName('categoria_oid').AsInteger:= cmbCategoria.KeyValue;
      Open;
    end;

    if ZSelectReporteEvento.RecordCount > 0 then
      with scExcelExport do
      begin
        Dataset:= ZSelectReporteEvento;
        WorksheetName := 'Toma de Tiempos';
        ExportDataset;
        Disconnect;
      end;

    validationPanel.Visible:= False;
    topPanel.Visible:= False;
  end;
end;

procedure TPuntuacionCRUD.btnFilterClick(Sender: TObject);
begin
  generateEventoCategoriaTable;
end;

procedure TPuntuacionCRUD.btnHistoricoPilotoClick(Sender: TObject);
var
  cuenta : Integer;
  insertSQL : String;
begin
  if (cmbEvento.KeyValue > 0) then
  begin
    with ZQueryHisorico do
      begin
        Close;
        SQL.Text:= 'select count(oid) cuenta from piloto_historico_evento where evento_oid = :evento_oid';
        ParamByName('evento_oid').AsInteger:= cmbEvento.KeyValue;
        Open;
        cuenta:= FieldByName('cuenta').AsInteger;

        if (cuenta > 0) then
          begin
            if (TF_EE_Message.ShowMessage(TComponent(Self),'Histórico existente',
              '¡Ya posee datos históricos para el evento seleccionado! ¿Desea continuar?', TF_EE_Message.QUESTION, False, True) = mrOk) then
              begin
                Close;
                SQL.Text:= 'delete from piloto_historico_evento where evento_oid = :evento_oid';
                ParamByName('evento_oid').AsInteger:= cmbEvento.KeyValue;
                ExecSQL;

                Close;
                SQL.Text:= 'insert into piloto_historico_evento(piloto_oid, nro_moto, nro_moto_cross, nro_cuatriciclo, categoria_oid, categoria_motocross_oid, categoria_cuatriciclos_oid, modelo_moto_oid, evento_oid) ' +
                         'select oid piloto_oid, nro_moto, nro_moto_cross, nro_cuatriciclo, categoria_oid, categoria_motocross_oid, categoria_cuatriciclos_oid, modelo_moto_oid, :evento_oid from piloto ';
                ParamByName('evento_oid').AsInteger:= cmbEvento.KeyValue;
                ExecSQL;
              end
          end
        else
          begin
            Close;
            SQL.Text:= 'insert into piloto_historico_evento(piloto_oid, nro_moto, nro_moto_cross, nro_cuatriciclo, categoria_oid, categoria_motocross_oid, categoria_cuatriciclos_oid, modelo_moto_oid, evento_oid) ' +
                       'select oid piloto_oid, nro_moto, nro_moto_cross, nro_cuatriciclo, categoria_oid, categoria_motocross_oid, categoria_cuatriciclos_oid, modelo_moto_oid, :evento_oid from piloto ';
            ParamByName('evento_oid').AsInteger:= cmbEvento.KeyValue;
            ExecSQL;
          end;
      end;

    validationPanel.Visible:= False;
    topPanel.Visible:= False;
  end
  else
    setTListItemsByString(errorListView, 'Debe seleccionar un Evento para guardar el Histórico de Pilotos.');
end;

procedure TPuntuacionCRUD.btnImportPilotosClick(Sender: TObject);
type
  TFilaPuntos = record
    FilaExcel: Integer;
    Categoria: string;
    Puesto, NroMoto, CategoriaOID, TipoCategoriaOID, PilotoOID: Integer;
  end;
const
  MAX_ERRORES_VISIBLES = 15;
var
  OpenDialog: TOpenDialog;
  ExcelApp, Libro, Rango, Datos: Variant;
  Filas: array of TFilaPuntos;
  Errores, Categorias: TStringList;
  EventoVO: TEvento;
  CategoriaActual, ListaCategorias, Mensaje: string;
  FilaBase, TotalFilas, TotalCols, r, i, Puesto, NroMoto, Puntos, Importados: Integer;

  function Celda(Fila, Columna: Integer): string;
  var
    Valor: Variant;
  begin
    Result := '';
    if (Fila < 1) or (Fila > TotalFilas) or (Columna > TotalCols) then
      Exit;
    Valor := Datos[Fila, Columna];
    if not (VarIsEmpty(Valor) or VarIsNull(Valor) or (VarType(Valor) = varError)) then
      Result := Trim(VarToStr(Valor));
  end;

  function EsEncabezado(Fila: Integer): Boolean;
  begin
    // "Pos." / "Nro. Competidor" (Exportar Agrupación) o "Pos" / "Nro." (formato anterior)
    Result := (SameText(Celda(Fila, 1), 'Pos.') or SameText(Celda(Fila, 1), 'Pos'))
      and SameText(Copy(Celda(Fila, 2), 1, 3), 'Nro');
  end;

  procedure AgregarError(const Texto: string);
  begin
    if Errores.IndexOf(Texto) < 0 then
      Errores.Add(Texto);
  end;

  function BuscarCategoria(const Nombre: string): Boolean;
  begin
    // Deja ZCategoria posicionada en la categoría. La exportación recorta espacios
    // y algunos nombres en la base los tienen al final (ej. 'MX 1 ').
    Result := ZCategoria.Locate('nombre', Nombre, [loCaseInsensitive]);
    if not Result then
    begin
      ZCategoria.First;
      while not (Result or ZCategoria.Eof) do
        if SameText(Trim(ZCategoria.FieldByName('nombre').AsString), Nombre) then
          Result := True
        else
          ZCategoria.Next;
    end;
  end;

begin
  if not (cmbEvento.KeyValue > 0) then
  begin
    TF_EE_Message.ShowMessage(TComponent(Self), '¡Seleccione el Evento!',
      'Debe seleccionar el Evento', TF_EE_Message.INFORMATION, True);
    Exit;
  end;

  // 1) Elegir archivo y leer la primera hoja completa de una vez (UsedRange.Value2)
  OpenDialog := TOpenDialog.Create(Self);
  try
    OpenDialog.InitialDir := GetCurrentDir;
    OpenDialog.Options := [ofFileMustExist];
    OpenDialog.Filter := 'Archivos Excel (*.xls;*.xlsx)|*.xls;*.xlsx';
    if not OpenDialog.Execute then
      Exit;

    try
      ExcelApp := CreateOleObject('Excel.Application');
    except
      on E: Exception do
      begin
        TF_EE_Message.ShowMessage(TComponent(Self), 'No se pudo iniciar Excel',
          'Verifique que Microsoft Excel esté instalado en este equipo.<br>' + E.Message,
          TF_EE_Message.ERROR, True);
        Exit;
      end;
    end;

    try
      try
        ExcelApp.DisplayAlerts := False;
        Libro := ExcelApp.Workbooks.Open(OpenDialog.FileName, 0, True); // sin actualizar vínculos, solo lectura
        Rango := Libro.Worksheets[1].UsedRange;
        FilaBase := Rango.Row;
        if Rango.Column = 1 then
          Datos := Rango.Value2;
        Libro.Close(False);
      finally
        Rango := Unassigned;
        Libro := Unassigned;
        ExcelApp.Quit;
        ExcelApp := Unassigned;
      end;
    except
      on E: Exception do
      begin
        TF_EE_Message.ShowMessage(TComponent(Self), 'Error al leer el archivo',
          OpenDialog.FileName + '<br>' + E.Message, TF_EE_Message.ERROR, True);
        Exit;
      end;
    end;
  finally
    OpenDialog.Free;
  end;

  if not VarIsArray(Datos) then
  begin
    TF_EE_Message.ShowMessage(TComponent(Self), 'Formato no reconocido',
      'La primera hoja del archivo no tiene datos en la columna A (Pos.).', TF_EE_Message.WARNING, True);
    Exit;
  end;
  TotalFilas := VarArrayHighBound(Datos, 1);
  TotalCols := VarArrayHighBound(Datos, 2);

  Errores := TStringList.Create;
  Categorias := TStringList.Create;
  EventoVO := nil;
  try
    // 2) Recorrer bloques: fila de categoría, encabezado Pos./Nro., filas de pilotos
    CategoriaActual := '';
    r := 1;
    while r <= TotalFilas do
    begin
      if (Celda(r, 1) <> '') and EsEncabezado(r + 1) then
      begin
        CategoriaActual := Celda(r, 1);
        Inc(r, 2);
        Continue;
      end;

      if (CategoriaActual <> '') and TryStrToInt(Celda(r, 1), Puesto) then
      begin
        if TryStrToInt(Celda(r, 2), NroMoto) then
        begin
          SetLength(Filas, Length(Filas) + 1);
          Filas[High(Filas)].FilaExcel := FilaBase + r - 1;
          Filas[High(Filas)].Categoria := CategoriaActual;
          Filas[High(Filas)].Puesto := Puesto;
          Filas[High(Filas)].NroMoto := NroMoto;
          Filas[High(Filas)].CategoriaOID := 0;
          Filas[High(Filas)].TipoCategoriaOID := 0;
          Filas[High(Filas)].PilotoOID := 0;
        end
        else
          AgregarError(Format('Fila %d (%s): Nro. de competidor inválido "%s".',
            [FilaBase + r - 1, CategoriaActual, Celda(r, 2)]));
      end;

      Inc(r);
    end;

    if Length(Filas) = 0 then
    begin
      TF_EE_Message.ShowMessage(TComponent(Self), 'Formato no reconocido',
        'No se encontraron categorías con pilotos en el archivo.<br>' +
        'Use el Excel generado con "Exportar Agrupación".', TF_EE_Message.WARNING, True);
      Exit;
    end;

    // 3) Resolver categoría y piloto de cada fila, sin modificar nada todavía.
    //    No se usa getCategoriaByName porque crea la categoría si no existe.
    Screen.Cursor := crHourGlass;
    try
      if not ZCategoria.Active then
        ZCategoria.Open;

      Importados := 0;
      for i := 0 to High(Filas) do
      begin
        if BuscarCategoria(Filas[i].Categoria) then
        begin
          Filas[i].CategoriaOID := ZCategoria.FieldByName('oid').AsInteger;
          Filas[i].TipoCategoriaOID := ZCategoria.FieldByName('tipo_categoria_oid').AsInteger;
          Filas[i].PilotoOID := TBussinessDataSubsystemFacade.getInstance
            .getPilotoOIDByNumMotoAndTipoCategoria(Filas[i].NroMoto, Filas[i].TipoCategoriaOID, cmbEvento.KeyValue);

          if Filas[i].PilotoOID > 0 then
          begin
            Inc(Importados);
            if Categorias.IndexOf(Filas[i].Categoria) < 0 then
              Categorias.AddObject(Filas[i].Categoria, TObject(Filas[i].CategoriaOID));
          end
          else
            AgregarError(Format('Fila %d (%s): el Nro. %d no corresponde a un piloto inscripto en el evento.',
              [Filas[i].FilaExcel, Filas[i].Categoria, Filas[i].NroMoto]));
        end
        else
          AgregarError(Format('Categoría "%s": no existe en el sistema; se omiten sus pilotos.',
            [Filas[i].Categoria]));
      end;
    finally
      Screen.Cursor := crDefault;
    end;

    // 4) Confirmación con resumen y filas omitidas
    ListaCategorias := '';
    for i := 0 to Categorias.Count - 1 do
    begin
      if ListaCategorias <> '' then
        ListaCategorias := ListaCategorias + ', ';
      ListaCategorias := ListaCategorias + Categorias[i];
    end;

    if Importados = 0 then
      Mensaje := 'No hay pilotos válidos para importar.'
    else
      Mensaje := Format('Se reemplazarán los puntos del evento <b>%s</b> en %d categorías (%d pilotos):<br>%s',
        [cmbEvento.Text, Categorias.Count, Importados, ListaCategorias]);

    if Errores.Count > 0 then
    begin
      Mensaje := Mensaje + '<br><br><b>Se omitirán:</b>';
      for i := 0 to Errores.Count - 1 do
        if i < MAX_ERRORES_VISIBLES then
          Mensaje := Mensaje + '<br>' + Errores[i];
      if Errores.Count > MAX_ERRORES_VISIBLES then
        Mensaje := Mensaje + Format('<br>... y %d más.', [Errores.Count - MAX_ERRORES_VISIBLES]);
    end;

    if Importados = 0 then
    begin
      TF_EE_Message.ShowMessage(TComponent(Self), 'Importación de Puntos', Mensaje,
        TF_EE_Message.WARNING, True, True);
      Exit;
    end;

    if TF_EE_Message.ShowMessage(TComponent(Self), 'Confirmar Importación de Puntos',
      Mensaje + '<br><br>¿Desea continuar?', TF_EE_Message.QUESTION, False, True) <> mrOk then
      Exit;

    // 5) Grabar: primero borrar cada categoría del archivo, después insertar
    Screen.Cursor := crHourGlass;
    try
      EventoVO := TBussinessDataSubsystemFacade.getInstance.getEvento(cmbEvento.KeyValue);

      for i := 0 to Categorias.Count - 1 do
        TBussinessDataSubsystemFacade.getInstance.deletePuntuacionByEventoOIDAndCategoriaOID(
          cmbEvento.KeyValue, Integer(Categorias.Objects[i]));

      for i := 0 to High(Filas) do
        if (Filas[i].CategoriaOID > 0) and (Filas[i].PilotoOID > 0) then
        begin
          Puntos := TBussinessDataSubsystemFacade.getInstance.selPuntoByPuesto(IntToStr(Filas[i].Puesto));

          // Punto EXTRA solo si el evento los usa
          if EventoVO.UsaPuntosExtra then
            Puntos := Puntos + getPuntosExtraByPuesto(Filas[i].Puesto);

          TBussinessDataSubsystemFacade.getInstance.addPuntuacion(cmbEvento.KeyValue,
            Filas[i].PilotoOID, Filas[i].CategoriaOID, Puntos, Filas[i].Puesto);
        end;
    finally
      Screen.Cursor := crDefault;
    end;

    TF_EE_Message.ShowMessage(TComponent(Self), 'Mensaje de Importación Exitosa',
      Format('Se importaron los puntos de %d pilotos en %d categorías para el Evento: <b>%s</b>.',
        [Importados, Categorias.Count, cmbEvento.Text]), TF_EE_Message.INFORMATION, True);
  finally
    EventoVO.Free;
    Categorias.Free;
    Errores.Free;
  end;
end;

procedure TPuntuacionCRUD.btnImprTablaClick(Sender: TObject);
var
  ReporteTotalPuestoEvento : TReporteTotalPuestoEvento;
begin
  if ((cmbCampeonato.KeyValue > 0) and (cmbEvento.KeyValue > 0) ) then
    begin
      ReporteTotalPuestoEvento:= TReporteTotalPuestoEvento.Create(nil);
      ReporteTotalPuestoEvento.setEventoOID(cmbEvento.KeyValue);
      ReporteTotalPuestoEvento.setCategoriaOID(cmbCategoria.KeyValue);
      ReporteTotalPuestoEvento.setCampeonatoOID(cmbCampeonato.KeyValue);
      ReporteTotalPuestoEvento.setNombreCategoria(cmbCategoria.Text);
      ReporteTotalPuestoEvento.showReport;

      validationPanel.Visible:= False;
      topPanel.Visible:= False;
    end
  else
    setTListItemsByString(errorListView, 'Debe seleccionar un Evento y el Campeonato para generar el Reporte del Evento.');
end;

procedure TPuntuacionCRUD.btnImprTablaEventoClick(Sender: TObject);
var
  ReportePuestoEvento : TReportePuestoEvento;
begin
  if ((cmbCampeonato.KeyValue > 0) and (cmbEvento.KeyValue > 0) ) then
  begin
   ReportePuestoEvento:= TReportePuestoEvento.Create(nil);

    with ReportePuestoEvento.ZSelectReporteEvento do
    begin
      Close;
      ParamByName('evento_oid').AsInteger:= cmbEvento.KeyValue;
      ParamByName('campeonato_oid').AsInteger:= cmbCampeonato.KeyValue;
      ParamByName('categoria_oid').AsInteger:= cmbCategoria.KeyValue;
      Open;
    end;

    with ReportePuestoEvento.ZSelectEvento do
    begin
      Close;
      ParamByName('evento_oid').AsInteger:= cmbEvento.KeyValue;
      Open;
    end;

    if ReportePuestoEvento.ZSelectReporteEvento.RecordCount > 0 then
      with ReportePuestoEvento do
      begin
        QuickRep.Preview;
      end;

    validationPanel.Visible:= False;
    topPanel.Visible:= False;
  end
  else
    setTListItemsByString(errorListView, 'Debe seleccionar un Evento y el Campeonato para generar el Reporte del Evento.');
end;

procedure TPuntuacionCRUD.btnImprTablaExcelClick(Sender: TObject);
begin
  ZReSetPosition.ParamByName('posicion').AsInteger:= 0;
  ZReSetPosition.ExecSQL;

  if ((cmbCampeonato.KeyValue > 0) and (cmbEvento.KeyValue > 0) ) then
  begin
    with ZSelectReporteEvento do
    begin
      Close;
      SQL.Clear;
      SQL.Append(buildSqlString(cmbEvento.KeyValue));
      ParamByName('evento_oid').AsInteger:= cmbEvento.KeyValue;
      ParamByName('campeonato_oid').AsInteger:= cmbCampeonato.KeyValue;
      ParamByName('nombre_categoria').AsString:= cmbCategoria.Text;
      Open;
    end;

    if ZSelectReporteEvento.RecordCount > 0 then
      with scExcelExport do
      begin
        Dataset:= ZSelectReporteEvento;
        WorksheetName := 'Clasif. Gral. Camp';
        ExportDataset;
        Disconnect;
      end;

    validationPanel.Visible:= False;
    topPanel.Visible:= False;
  end;
end;

procedure TPuntuacionCRUD.btnNewClick(Sender: TObject);
var
  eventoOID, categoriaOID, pilotoOID, puntos, puesto: Integer;
begin
  eventoOID:= JvMemoryData.FieldByName('EventoOIDDataField').AsInteger;
  categoriaOID:= JvMemoryData.FieldByName('CategoriaOIDDataField').AsInteger;
  TBussinessDataSubsystemFacade.getInstance.deletePuntuacionByEventoOIDAndCategoriaOID(eventoOID, categoriaOID);

  with JvMemoryData do
  begin
    First;
    while not Eof do
    begin
      puntos:= FieldByName('PuntosDataField').AsInteger;
      puesto:= FieldByName('PuestoDataField').AsInteger;
      categoriaOID:= FieldByName('CategoriaOIDDataField').AsInteger;
      pilotoOID:= FieldByName('PilotoOIDDataField').AsInteger;
      eventoOID:= FieldByName('EventoOIDDataField').AsInteger;

      TBussinessDataSubsystemFacade.getInstance
        .addPuntuacion(eventoOID, pilotoOID, categoriaOID, puntos, puesto);
      Next;
    end;
  end;
end;

procedure TPuntuacionCRUD.btnPuntuacionEventoClick(Sender: TObject);
var
  eventoOID, categoriaOID: Integer;
  ReportPuntuacionEvento : TReportPuntuacionEvento;
begin
  ReportPuntuacionEvento := TReportPuntuacionEvento.Create(nil);

  eventoOID:= cmbEvento.KeyValue;
  categoriaOID:= cmbCategoria.KeyValue;

  if (eventoOID > 0) then

  with ReportPuntuacionEvento.ZSelectReportePuntuacion do
    begin
      Close;
      ParamByName('evento_oid').AsInteger:= eventoOID;
      ParamByName('categoria_oid').AsInteger:= categoriaOID;
      Open;
    end;

  with ReportPuntuacionEvento.ZSelectEvento do
    begin
      Close;
      ParamByName('evento_oid').AsInteger:= eventoOID;
      Open;
    end;

  with ReportPuntuacionEvento do
    begin
      QuickRep.Preview;
    end;
end;

procedure TPuntuacionCRUD.cmbCategoriaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #8 then
    TDBLookupComboBox(Sender).KeyValue:= 0;
end;

procedure TPuntuacionCRUD.cmbEventoExit(Sender: TObject);
begin
  inherited;
  BindingsList.Notify(Sender, 'KeyValue');
end;

procedure TPuntuacionCRUD.cmbEventoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  BindingsList.Notify(Sender, 'KeyValue');
end;

procedure TPuntuacionCRUD.generateEventoCategoriaTable;
var
  eventoOID, categoriaOID: Integer;
begin
  isGeneratingTable:= True;

  eventoOID:= cmbEvento.KeyValue;
  categoriaOID:= cmbCategoria.KeyValue;

  if ((eventoOID > 0) and (categoriaOID > 0)) then

  with queryGrid do
    begin
      Close;
      ParamByName('evento_oid').AsInteger:= eventoOID;
      ParamByName('categoria_oid').AsInteger:= categoriaOID;
      Open;

      JvMemoryData.EmptyTable;
      while not queryGrid.Eof do
      begin
        JvMemoryData.Append;

        JvMemoryData.FieldByName('OIDDataField').AsInteger:=
          FieldByName('oid').AsInteger;
        JvMemoryData.FieldByName('PuntosExtraDataField').AsInteger:=
          FieldByName('puntos_extra').AsInteger;
        JvMemoryData.FieldByName('NroMotoDataField').AsInteger:=
          FieldByName('nro_moto').AsInteger;
        JvMemoryData.FieldByName('PilotoDataField').AsString:=
          FieldByName('nombre_piloto').AsString;
        JvMemoryData.FieldByName('PuntosDataField').AsInteger:=
          FieldByName('puntos').AsInteger;
        JvMemoryData.FieldByName('PilotoOIDDataField').AsInteger:=
          FieldByName('piloto_oid').AsInteger;
        JvMemoryData.FieldByName('EventoOIDDataField').AsInteger:=
          FieldByName('evento_oid').AsInteger;
        JvMemoryData.FieldByName('CategoriaDataField').AsString:=
          FieldByName('nombre_categoria').AsString;
        JvMemoryData.FieldByName('PuestoDataField').AsInteger:=
          FieldByName('puesto').AsInteger;
        JvMemoryData.FieldByName('CategoriaOIDDataField').AsInteger:=
          FieldByName('categoria_oid').AsInteger;
        JvMemoryData.FieldByName('ModeloMotoDataField').AsString:=
          FieldByName('modelo_moto').AsString;

        JvMemoryData.Post;
        queryGrid.Next;
      end;
    end;

    isGeneratingTable:= False;
end;

procedure TPuntuacionCRUD.InitializeBinding;
var
  expression: TBindExpression;
begin
  BindingHelper.setMessageKey(TComponent(cmbEvento), 'KeyValue', TComponent(BindScope), 'EventoOID', BindingsList);
  BindingHelper.setMessageKey(TComponent(cmbCategoria), 'KeyValue', TComponent(BindScope), 'CampeonatoOID', BindingsList);

  // Create a Filter object.
  filterVO := TPuntuacionFilter.Create;
  BindScope.DataObject := filterVO;
end;

procedure TPuntuacionCRUD.requestLoadInitialData(filterVO: TValueObject);
begin
  with queryGrid do
    begin
      Close;
      Open;
    end;
end;

function TPuntuacionCRUD.requestElement(OID: Integer): TPersistentObject;
begin
//  Result:= TBussinessDataSubsystemFacade.getInstance.getEvento(OID);
end;

procedure TPuntuacionCRUD.requestDelete(OID: Integer);
begin
  TBussinessDataSubsystemFacade.getInstance.deleteInscripcion(OID);
end;

procedure TPuntuacionCRUD.doRequestSave(persistentVO: TPersistentObject);
begin
//   TBussinessDataSubsystemFacade.getInstance.saveEvento(TEvento(persistentVO));
end;

function TPuntuacionCRUD.getPuntosByPuesto(Puesto: Integer): Integer;
var
  return : Integer;
begin
  return:= 1;

  with ZGetPuntoByPuesto do
  begin
    Close;
    ParamByName('puesto').AsInteger:= Puesto;
    Open;

    if (RecordCount > 0) then
      return:= FieldByName('punto').AsInteger;
  end;

  Result:= return;
end;

function TPuntuacionCRUD.getPuntosExtraByPuesto(Puesto: Integer): Integer;
var
  return : Integer;
begin
  return:= 0;

  with ZGetPuntoExtraByPuesto do
  begin
    Close;
    ParamByName('puesto').AsInteger:= Puesto;
    Open;

    if (RecordCount > 0) then
      return:= FieldByName('punto_extra').AsInteger;
  end;

  Result:= return;
end;

function TPuntuacionCRUD.isPuestoInTable(puesto : String; OID: Integer): Boolean;
var
  BM: TArray<Byte>;
  i: Integer;
  presente : Boolean;
begin
  JvMemoryData.BeforePost:= JvMemoryDataDummyBeforePost;

  presente := False;
  // Guardar posición actual del DataSet
  BM:= JvMemoryData.Bookmark;
  // Desactivar el mostrado en los controles data-aware asociados al DataSet
  JvMemoryData.DisableControls;
  // Posicionarnos en el primer registro del DataSet
  JvMemoryData.First;
  // Mientras el DataSet tenga registros...
  while not JvMemoryData.Eof do
  begin
    if ((puesto = JvMemoryData.FieldByName('PuestoDataField').AsString)
      and (OID <> JvMemoryData.FieldByName('OIDDataField').AsInteger)) then
        presente := True;
    // Desplazarnos al próximo registro del DataSet
    JvMemoryData.Next;
  end;
  // Volver a posición previamente guardada del DataSet
  JvMemoryData.Bookmark:= BM;
  // Activar el mostrado en los controles data-aware asociados al DataSet
  JvMemoryData.EnableControls;

  JvMemoryData.BeforePost:= JvMemoryDataBeforeEdit;

  Result:= presente;
end;


procedure TPuntuacionCRUD.JvMemoryDataDummyBeforePost(DataSet: TDataSet);
var
  i:Integer;
begin
  i:= 0;
end;

procedure TPuntuacionCRUD.JvMemoryDataAfterEdit(DataSet: TDataSet);
var
  puesto : String;
begin
//  if (not isGeneratingTable) then
//    begin
//      puesto:= DataSet.FieldByName('PuestoDataField').AsString;
//
//      JvMemoryData.FieldByName('PuntosDataField').AsInteger:=
//        getPuntosByPuesto(StrToInt(puesto)) + JvMemoryData.FieldByName('PuntosExtraDataField').AsInteger;
//    end;
end;

procedure TPuntuacionCRUD.JvMemoryDataBeforeEdit(DataSet: TDataSet);
begin
//  if (not isGeneratingTable) then
//    begin
//      puesto:= DataSet.FieldByName('PuestoDataField').AsString;;
//
//      if (not isPuestoInTable(puesto, DataSet.FieldByName('OIDDataField').AsInteger)) then
//        begin
//          JvMemoryData.FieldByName('PuntosDataField').AsInteger:=
//            getPuntosByPuesto(StrToInt('1')) + JvMemoryData.FieldByName('PuntosExtraDataField').AsInteger;
//        end
//      else
//        begin
//          DataSet.Cancel;
//          raise Exception.Create('Puntos is invalid');
//        end;
//    end;
end;

function TPuntuacionCRUD.buildSqlString(EventoOID: Integer; TodasLasCategorias: Boolean = False): String;
var
  stringSQLPrefix, stringSQLSufix, sqlDinamic, sql, columnaOrden : String;
  i : Integer;
begin
    // Web (todas las categorías): orden de categoría igual que el export Web de tiempos
    columnaOrden:= '';
    if TodasLasCategorias then
      columnaOrden:= ' IFNULL((select c.orden from categorias c where c.nombre = sel_nombre_categoria_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, eve.oid, p.oid)), 255) as cat_orden, ';

    stringSQLPrefix:=  ' SELECT @posicion:=@posicion+1 AS Pos, subquery.* FROM (' +
    ' select distinct ' + columnaOrden +
    ' sel_nro_moto_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, eve.oid, p.oid) as '+QuotedStr('Num.')+', ' +
    ' sel_total_puntos_by_event_oid_and_pilot_oid(:evento_oid, p.oid, :campeonato_oid, ipe.tipo_categoria_oid, sel_categoria_oid_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, :evento_oid, p.oid)) as Tot, ' +
    ' CONCAT(p.apellido, '+QuotedStr(', ')+'  , p.nombre) as '+QuotedStr('Competidor')+', ' +
    ' l.localidad Localidad, mm.nombre as Moto, sel_nombre_categoria_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, eve.oid, p.oid) as Categoria, ';

    stringSQLSufix:= ' sel_total_puntos_by_event_oid_and_pilot_oid(:evento_oid, p.oid, :campeonato_oid, ipe.tipo_categoria_oid, sel_categoria_oid_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, :evento_oid, p.oid)) as Total '+
        '  from inscripcion_piloto_evento ipe '+
        ' join piloto p on ipe.piloto_oid = p.oid '+
        ' join evento eve on eve.oid = ipe.evento_oid '+
        ' left join puntos_piloto_evento ppe_sel on ppe_sel.piloto_oid = ipe.piloto_oid and ppe_sel.evento_oid = ipe.evento_oid '+
        ' join localidad l on p.localidad_oid = l.oid '+
        ' join modelo_moto mm on p.modelo_moto_oid = mm.oid'+

        ' where eve.fecha <= (select fecha from evento e where e.oid = :evento_oid) '+
        ' AND eve.campeonato_oid = :campeonato_oid ';

    if TodasLasCategorias then
      // Solo las categorías que se corrieron (con puntos cargados) en el evento seleccionado
      stringSQLSufix:= stringSQLSufix +
        ' AND sel_nombre_categoria_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, eve.oid, p.oid) IN ( '+
        '   select sel_nombre_categoria_by_evento_and_tipo_categoria(ipe2.tipo_categoria_oid, ipe2.evento_oid, ipe2.piloto_oid) '+
        '   from inscripcion_piloto_evento ipe2 '+
        '   join puntos_piloto_evento ppe2 on ppe2.evento_oid = ipe2.evento_oid and ppe2.piloto_oid = ipe2.piloto_oid '+
        '     and (ppe2.categoria_oid is null or ppe2.categoria_oid = sel_categoria_oid_by_evento_and_tipo_categoria(ipe2.tipo_categoria_oid, ipe2.evento_oid, ipe2.piloto_oid)) '+
        '   where ipe2.evento_oid = :evento_oid) '
    else
      stringSQLSufix:= stringSQLSufix +
        ' AND sel_nombre_categoria_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, eve.oid, p.oid) = :nombre_categoria ';

  sqlDinamic:= '';

    with ZEventos do
    begin
      Close;
      ParamByName('evento_oid').AsInteger:= eventoOID;
      SortedFields:= 'nro_fecha desc';
      Open;

      if TodasLasCategorias then
        stringSQLSufix:= stringSQLSufix  + ' order by cat_orden, Categoria, Total desc, '
      else
        stringSQLSufix:= stringSQLSufix  + ' order by Categoria, Total desc, ';

      while not Eof do
        begin
          stringSQLSufix:= stringSQLSufix + ' sel_puntos_by_event_oid_and_pilot_oid('+FieldByName('oid').AsString+', p.oid, ipe.tipo_categoria_oid, sel_categoria_oid_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, eve.oid, p.oid)) = 0,';
          stringSQLSufix:= stringSQLSufix + ' sel_puesto_by_event_oid_and_pilot_oid('+FieldByName('oid').AsString+', p.oid, ipe.tipo_categoria_oid, sel_categoria_oid_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, eve.oid, p.oid)), ';
          Next;
        end;

      stringSQLSufix:= stringSQLSufix  + 'ipe.oid) subquery';

      Close;
      ParamByName('evento_oid').AsInteger:= eventoOID;
      SortedFields:= 'nro_fecha asc';
      Open;
      while not Eof do
      begin

        sqlDinamic:= sqlDinamic + ' sel_puesto_by_event_oid_and_pilot_oid('+FieldByName('oid').AsString+', p.oid, ipe.tipo_categoria_oid, sel_categoria_oid_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, eve.oid, p.oid)) as '+QuotedStr('Pos #'+IntToStr(RecNo)) +', ' +
                                  ' sel_puntos_by_event_oid_and_pilot_oid('+FieldByName('oid').AsString+', p.oid, ipe.tipo_categoria_oid, sel_categoria_oid_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, eve.oid, p.oid)) as '+QuotedStr('Ptos #'+IntToStr(RecNo)) +', ';
        Next;
      end;
    end;

    sql:= stringSQLPrefix + sqlDinamic + stringSQLSufix;
    Result:= sql;
end;

end.
