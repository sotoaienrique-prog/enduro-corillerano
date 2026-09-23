unit EditAgrupacionTomaTiempos;

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
  dxSkinXmas2008Blue, cxTextEdit, cxLabel, Vcl.ExtCtrls, cxMaskEdit,
  cxDropDownEdit, Vcl.ImgList, Vcl.StdCtrls, AeroButtons, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DataModule, Vcl.DBCtrls,
  ZAbstractTable, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, F_EEMessage,
  scExcelExport, frxClass, frxDBSet, frxExportPDF, JvTimer, Excel2010, ConfigureFilesUtilities,
  IdHTTP, IdSSLOpenSSL, IdSSLOpenSSLHeaders, uTomaTiempoIO;

type
  TEdicionAgrupacion = class(TForm)
    topPanel: TPanel;
    lblNombre: TcxLabel;
    txtNombre: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    buttonPanel: TPanel;
    btnAccept: TAeroButton;
    btnCancel: TAeroButton;
    cxButtonImageList: TcxImageList;
    ZQueryInsert: TZQuery;
    cmbTipoToma: TComboBox;
    cmbTipoAgrupacion: TComboBox;
    tomaTiempoPanel: TPanel;
    GroupBox1: TGroupBox;
    ZCampeonato: TZTable;
    DSCampeonato: TDataSource;
    DSEvento: TDataSource;
    ZTomaTiempoEvento: TZReadOnlyQuery;
    DSTomaTiempoEvento: TDataSource;
    ZEvento: TZReadOnlyQuery;
    cmbTomaTiempoEvento: TDBLookupComboBox;
    cxLabel3: TcxLabel;
    cmbEvento: TDBLookupComboBox;
    lblFilterEvento: TcxLabel;
    lblCampeonato: TcxLabel;
    cmbCampeonato: TDBLookupComboBox;
    panelAddTT: TPanel;
    panelGridTT: TPanel;
    btnAddTomaTiempo: TAeroButton;
    cxGrid: TcxGrid;
    cxGridDBTableView: TcxGridDBTableView;
    cxGridDBTableViewnombre: TcxGridDBColumn;
    cxGridLevel: TcxGridLevel;
    btnDeleteTomaTiempo: TAeroButton;
    ZTomaTiempos: TZReadOnlyQuery;
    DSTomaTiempos: TDataSource;
    ZAgrupacion: TZReadOnlyQuery;
    WideStringField1: TWideStringField;
    WideStringField2: TWideStringField;
    WideStringField3: TWideStringField;
    ZAddAgrupacoinTomaTiempo: TZQuery;
    ZTomaTiemposnombre: TWideStringField;
    ZDeleteAgrupacoinTomaTiempo: TZQuery;
    ZTomaTiemposoid: TLargeintField;
    btnExportarAgrupacion: TAeroButton;
    zExportarAgrupacion: TZReadOnlyQuery;
    ZTomaTiemposForExport: TZReadOnlyQuery;
    WideStringField4: TWideStringField;
    LargeintField1: TLargeintField;
    btnExportarAgrupacionPuntos: TAeroButton;
    scExcelExport: TscExcelExport;
    eventoDBDS: TfrxDBDataset;
    tomaTiempoDBDS: TfrxDBDataset;
    campeonato1DBDS: TfrxDBDataset;
    frxPDFExport: TfrxPDFExport;
    frxPosiciones1: TfrxReport;
    btnexportarWEB: TAeroButton;
    posiciones1DBDS: TfrxDBDataset;
    JvReportTimer: TJvTimer;
    btnExportarFile: TAeroButton;
    SaveDialog1: TSaveDialog;
    btnimportarFile: TAeroButton;
    OpenDialog1: TOpenDialog;
    procedure btnAcceptClick(Sender: TObject);
    procedure btnAddTomaTiempoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnDeleteTomaTiempoClick(Sender: TObject);
    procedure btnExportarAgrupacionClick(Sender: TObject);
    procedure btnExportarAgrupacionPuntosClick(Sender: TObject);
    procedure btnexportarWEBClick(Sender: TObject);
    procedure JvReportTimerTimer(Sender: TObject);
    procedure btnExportarFileClick(Sender: TObject);
    procedure btnimportarFileClick(Sender: TObject);
  private
    { Private declarations }
    procedure selectCombosByDate;
    function getAgrupacionSQL(agrupacionTomaTiempoOID : Integer; paraReportePDF: Boolean = False): String;
    function getAgrupacionPuntosSQL(agrupacionTomaTiempoOID : Integer; paraReportePDF: Boolean = False): String;
    procedure OcultarCamposExportacion(Dataset: TDataSet; const NombresCampos: array of string);
    procedure ExportarAHTML(Dataset: TDataSet);
    procedure SubirAWorker(const HTMLContent: string);
    procedure DiagnosticoSSL;
    procedure ExportarExcelYPDF(Dataset: TDataSet; const Instancia: string);
  public
    procedure enableAddAgrupacion;
    procedure enableAddTomaTiempos;
  end;

var
  isAdding : Boolean;
  agrupacionTomaTiempoOID: Integer;
  tipoTomaTiempo: String;
implementation

{$R *.dfm}

procedure TEdicionAgrupacion.selectCombosByDate;
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

procedure TEdicionAgrupacion.enableAddTomaTiempos;
begin
  isAdding:= False;
  txtNombre.Enabled:= False;
  cmbTipoToma.Enabled:= False;
  cmbTipoAgrupacion.Enabled:= False;

  ZCampeonato.Active:= True;
  ZEvento.Active:= True;

  ZTomaTiempoEvento.Close;
  ZTomaTiempoEvento.ParamByName('tipo_toma_tiempo').AsString:= tipoTomaTiempo;
  ZTomaTiempoEvento.Open;

  cmbEvento.Enabled:= True;
  cmbTomaTiempoEvento.Enabled:= True;
  cmbCampeonato.Enabled:= True;

  tomaTiempoPanel.Visible:= True;

  with ZAgrupacion do
    begin
      Close;
      ParamByName('oid').AsInteger:= agrupacionTomaTiempoOID;
      Open;

      txtNombre.Text:= FieldByName('nombre').AsString;
      cmbTipoToma.ItemIndex := cmbTipoToma.Items.IndexOf(FieldByName('tipo_toma_tiempo').AsString);
      cmbTipoAgrupacion.ItemIndex:= cmbTipoAgrupacion.Items.IndexOf(FieldByName('tipo_agrupacion').AsString);

      tipoTomaTiempo:= FieldByName('tipo_toma_tiempo').AsString;
    end;

  with ZTomaTiempos do
    begin
      Close;
      ParamByName('toma_tiempo_agrupacion_oid').AsInteger:= agrupacionTomaTiempoOID;
      Open;
    end;
end;

procedure TEdicionAgrupacion.FormCreate(Sender: TObject);
begin
  selectCombosByDate;
end;

procedure TEdicionAgrupacion.btnAddTomaTiempoClick(Sender: TObject);
begin
  with ZAddAgrupacoinTomaTiempo do
    begin
      Close;
      ParamByName('toma_tiempo_agrupacion_oid').AsInteger:= agrupacionTomaTiempoOID;
      ParamByName('toma_tiempo_oid').AsInteger:= cmbTomaTiempoEvento.KeyValue;
      ExecSQL;
    end;

  with ZTomaTiempos do
    begin
      Close;
      ParamByName('toma_tiempo_agrupacion_oid').AsInteger:= agrupacionTomaTiempoOID;
      Open;
    end;
end;

procedure TEdicionAgrupacion.btnDeleteTomaTiempoClick(Sender: TObject);
begin
  if (TF_EE_Message.ShowMessage(TComponent(Self),'Confirmación de eliminación de Elemento',
    '¿Está seguro que desea eliminar el elemento seleccionado?', TF_EE_Message.QUESTION, False) = mrOk) then
  begin
    with ZDeleteAgrupacoinTomaTiempo do
      begin
        Close;
        ParamByName('toma_tiempo_agrupacion_oid').AsInteger:= agrupacionTomaTiempoOID;
        ParamByName('toma_tiempo_oid').AsInteger:= ZTomaTiempos.FieldByName('oid').AsInteger;
        ExecSQL;
      end;

      with ZTomaTiempos do
        begin
          Close;
          ParamByName('toma_tiempo_agrupacion_oid').AsInteger:= agrupacionTomaTiempoOID;
          Open;
        end;
  end;
end;

procedure TEdicionAgrupacion.btnExportarAgrupacionClick(Sender: TObject);
begin
      with zExportarAgrupacion do
      begin
        DisableControls;
        try
          Close;
          Sql.Text:= getAgrupacionSQL(agrupacionTomaTiempoOID);
          ParamByName('toma_tiempo_agrupacion_oid').AsInteger:= agrupacionTomaTiempoOID;
          Open;
        finally
          EnableControls;
        end;
      end;

      scExcelExport.Dataset:= zExportarAgrupacion;
      scExcelExport.WorksheetName := 'Toma de Tiempos Agrupada';
      scExcelExport.ExportDataset;
      scExcelExport.Disconnect;
end;

procedure TEdicionAgrupacion.btnExportarAgrupacionPuntosClick(Sender: TObject);
begin
      with zExportarAgrupacion do
      begin
        DisableControls;
        try
          Close;
          Sql.Text:= getAgrupacionPuntosSQL(agrupacionTomaTiempoOID);
          ParamByName('toma_tiempo_agrupacion_oid').AsInteger:= agrupacionTomaTiempoOID;
          Open;
        finally
          EnableControls;
        end;
      end;

      scExcelExport.Dataset:= zExportarAgrupacion;
      scExcelExport.WorksheetName := 'Clasifica x Categoria';
      scExcelExport.ExportDataset;
      scExcelExport.Disconnect;
 end;

procedure TEdicionAgrupacion.btnExportarFileClick(Sender: TObject);
var
  LIO: TTomaTiempoExportImport;
  LCantidad: Integer;
begin
  SaveDialog1.Filter := 'Archivo de tomas de tiempo (*.tte)|*.tte|Todos los archivos (*.*)|*.*';
  SaveDialog1.DefaultExt := 'tte';
  SaveDialog1.FileName := Format('agrupacion_%s_%s.tte',
    [IntToStr(agrupacionTomaTiempoOID), FormatDateTime('yyyymmdd_hhnnss', Now)]);

  if not SaveDialog1.Execute then
    Exit;

  LIO := TTomaTiempoExportImport.Create(ConnectionModule.ZConnection);
  try
    try
      LCantidad := LIO.ExportarAgrupacion(agrupacionTomaTiempoOID, SaveDialog1.FileName);
      ShowMessage(Format('Se exportaron %d tomas de tiempo a:'#13#10'%s',
        [LCantidad, SaveDialog1.FileName]));
    except
      on E: Exception do
        ShowMessage('Error al exportar: ' + E.Message);
    end;
  finally
    LIO.Free;
  end;
end;

procedure TEdicionAgrupacion.btnexportarWEBClick(Sender: TObject);
begin
  JvReportTimer.Enabled:= True;
  //DiagnosticoSSL;
end;

procedure TEdicionAgrupacion.btnimportarFileClick(Sender: TObject);
var
  LIO: TTomaTiempoExportImport;
  LStats: TTomaTiempoImportStats;
  LModo: TTomaTiempoImportMode;
begin
  OpenDialog1.Filter := 'Archivo de tomas de tiempo (*.tte)|*.tte|Todos los archivos (*.*)|*.*';

  if not OpenDialog1.Execute then
    Exit;

  case MessageDlg(
    '¿Cómo querés importar este archivo?' + sLineBreak + sLineBreak +
    'MERGE: agrega tomas nuevas, respeta lo que ya existe.' + sLineBreak +
    'REEMPLAZAR: borra las tomas existentes de cada evento del archivo antes de importar.',
    mtConfirmation, [mbYes, mbNo, mbCancel], 0) of
    mrYes: LModo := timMerge;           // "Merge"
    mrNo:  LModo := timReemplazoTotal;  // "Reemplazar"
  else
    Exit; // Cancelar
  end;

  LIO := TTomaTiempoExportImport.Create(ConnectionModule.ZConnection);
  try
    try
      LStats := LIO.ImportarDesdeArchivo(OpenDialog1.FileName, LModo);
      ShowMessage('Importación completada.'#13#10#13#10 + LStats.AsText);
    except
      on E: Exception do
        ShowMessage('Error al importar: ' + E.Message);
    end;
  finally
    LIO.Free;
  end;
end;

function TEdicionAgrupacion.getAgrupacionPuntosSQL(agrupacionTomaTiempoOID : Integer; paraReportePDF: Boolean = False): String;
var
  sqlString, columnasTramos: String;
  i : Integer;
  aliasPos, aliasTot: String;
begin
  with ZTomaTiemposForExport do
  begin
    Close;
    ParamByName('toma_tiempo_agrupacion_oid').AsInteger := agrupacionTomaTiempoOID;
    Open;
  end;

  // ── PASO 1: construir la lista de columnas de tramos ──────────────────
  columnasTramos := '';
  i := 1;
  with ZTomaTiemposForExport do
  begin
    First;
    while not EOF do
    begin
      if paraReportePDF then
      begin
        aliasPos := 'POS_' + IntToStr(i);
        aliasTot := 'TOT_' + IntToStr(i);
      end
      else
      begin
        aliasPos := 'P. ' + FieldByName('nombre').AsString;
        aliasTot := 'T. ' + FieldByName('nombre').AsString;
      end;

      // CAMBIO: Usar backticks en lugar de QuotedStr para alias de columnas
      columnasTramos := columnasTramos +
        't.`' + aliasPos + '`, ' +
        't.`' + aliasTot + '`, ';

      Inc(i);
      Next;
    end;
  end;

  // ── PASO 2: encabezado SELECT externo con columnas en orden deseado ───
  sqlString :=
    'SELECT ' +
    '@posicion := IF(@cat_actual = t.Cat, @posicion + 1, 1) AS Posicion, ' +
    '@cat_actual := t.Cat AS Categoria_Control, ' +

    // Columnas fijas iniciales
    't.`Nro. Competidor`, ' +
    't.Competidor, ' +
    't.Cat, ' +

    // CAMBIO: Diferencias usando Backticks para el AS final
    'IF(@posicion = 1, ' + QuotedStr('-') + ', ' +
    '   IF(t.Vueltas < @vueltas_primero, ' +
    '      CONCAT(CAST(@vueltas_primero - t.Vueltas AS SIGNED), ' + QuotedStr(' vuelta') + ', IF(@vueltas_primero - t.Vueltas > 1, ' + QuotedStr('s') + ', ' + QuotedStr('') + ')), ' +
    '      CONCAT(sel_formatted_lap_time(t.tiempo_total_raw - @primer_tiempo_cat), ' + QuotedStr('') + '))) AS `Dif. con 1ro`, ' +

    'IF(@posicion = 1, ' + QuotedStr('-') + ', ' +
    '   IF(t.Vueltas < @vueltas_anterior, ' +
    '      CONCAT(CAST(@vueltas_anterior - t.Vueltas AS SIGNED), ' + QuotedStr(' vuelta') + ', IF(@vueltas_anterior - t.Vueltas > 1, ' + QuotedStr('s') + ', ' + QuotedStr('') + ')), ' +
    '      CONCAT(sel_formatted_lap_time(t.tiempo_total_raw - @tiempo_anterior), ' + QuotedStr('') + '))) AS `Dif. con Anterior`, ' +

    // Columnas dinámicas de tramos (CT/ET)
    // xxxxxxxx - SE DEBE COMENTAR ESTAS 2 LÍNEAS, EN CASO QUE QUIERAN SOLAMENTE totalizar
    columnasTramos +

    // Columnas fijas finales
    't.`Tiempo Total`, ' +
    't.Vueltas, ' +

    't.categoria_oid, ' +
    't.piloto_oid, ' +
    't.Recargo, ' +
    't.DescripcionRecargo as Descripcion, ' +

    '@primer_tiempo_cat := IF(@posicion = 1, t.tiempo_total_raw, @primer_tiempo_cat) AS _p, ' +
    '@tiempo_anterior   := t.tiempo_total_raw AS _a, ' +
    '@vueltas_primero   := IF(@posicion = 1, t.Vueltas, @vueltas_primero) AS _vp, ' +
    '@vueltas_anterior  := t.Vueltas AS _va ' +
    'FROM ( ';

  // Subquery interno
  sqlString := sqlString + ' SELECT nro_competidor AS `Nro. Competidor`, nombre_piloto AS Competidor, Cat, ';

  i := 1;
  with ZTomaTiemposForExport do
  begin
    First;
    while not EOF do
    begin
      if paraReportePDF then
      begin
        aliasPos := 'POS_' + IntToStr(i);
        aliasTot := 'TOT_' + IntToStr(i);
      end
      else
      begin
        aliasPos := 'P. ' + FieldByName('nombre').AsString;
        aliasTot := 'T. ' + FieldByName('nombre').AsString;
      end;

      // CAMBIO: Usar backticks en los alias de las funciones
      // xxxxxxxx - SE DEBE COMENTAR ESTAS 2 LÍNEAS, EN CASO QUE QUIERAN SOLAMENTE totalizar
      sqlString := sqlString + 'sel_pos_dinamic_total_time(' + FieldByName('oid').AsString +
                   ', piloto_oid, categoria_oid) as `' + aliasPos + '`, ';

      sqlString := sqlString + 'CONCAT(sel_formatted_lap_time(sel_total_time(' + FieldByName('oid').AsString +
                   ', piloto_oid)), ' + QuotedStr('') + ') as `' + aliasTot + '`, ';

      Inc(i);
      Next;
    end;
  end;

  sqlString := sqlString +
             'CONCAT(sel_formatted_total_time(SUM(tiempo_total)), ' + QuotedStr('') + ') AS `Tiempo Total`, ' +
             'SUM(tiempo_total) AS tiempo_total_raw, ' +
             'SUM(ranking.Vueltas) AS Vueltas, ' +
             'categoria_oid, piloto_oid, Recargo, DescripcionRecargo ';

  sqlString := sqlString +
       ' FROM (SELECT tte.oid, c.orden, sel_nro_moto_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid) nro_competidor, ' +
       ' sel_categoria_oid_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, tt.piloto_oid) categoria_oid, ' +
       ' CASE WHEN c.utiliza_acompaniante = 1 THEN CONCAT(UC_Words(CONCAT(p.apellido, ' + QuotedStr(', ') + ' , p.nombre)), IFNULL(UC_Words(CONCAT(' + QuotedStr(' / ') + ', n.apellido, ' + QuotedStr(', ') + ' , n.nombre)), ' + QuotedStr(' ') + '))' +
       ' ELSE UC_Words(CONCAT(p.apellido, ' + QuotedStr(', ') + ' , p.nombre)) END AS nombre_piloto, ' +
       ' sel_nombre_categoria_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid) Cat, ' +
       ' sel_total_time(tt.toma_tiempo_evento_oid, tt.piloto_oid) tiempo_total, '+
       ' sel_can_vueltas(tt.toma_tiempo_evento_oid, tt.piloto_oid) Vueltas, ' +
       ' sel_recargo_by_toma_tiempo_agrup_and_piloto_and_tipo_categoria(:toma_tiempo_agrupacion_oid, ipe.tipo_categoria_oid, ipe.piloto_oid) Recargo, ' +
       ' sel_rec_desc_by_toma_tiempo_agrup_and_piloto_and_tipo_categoria(:toma_tiempo_agrupacion_oid, ipe.tipo_categoria_oid, ipe.piloto_oid) DescripcionRecargo, ' +
       ' p.oid as piloto_oid ' +
       ' FROM toma_tiempos tt ' +
       '      JOIN toma_tiempo_evento tte ON tt.toma_tiempo_evento_oid = tte.oid ' +
       '      JOIN piloto p ON tt.piloto_oid = p.oid ' +
       '      JOIN inscripcion_piloto_evento ipe ON (ipe.evento_oid = tte.evento_oid AND ipe.piloto_oid = tt.piloto_oid)' +
       '      LEFT JOIN navegante n ON n.piloto_oid = p.oid ' +
       '      JOIN categorias c ON c.oid = sel_categoria_oid_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, ipe.evento_oid, ipe.piloto_oid) ' + // CAMBIO: Join explícito
       ' WHERE tte.oid IN (SELECT DISTINCT toma_tiempo_oid FROM toma_tiempo_agrupacion_tt WHERE toma_tiempo_agrupacion_oid = :toma_tiempo_agrupacion_oid) ' +
       ' GROUP BY p.oid, tte.oid) ranking ' +
       ' GROUP BY nro_competidor, nombre_piloto, Cat ' +
       // CAMBIO: Ordenar por tiempo_total_raw (numérico) en lugar de alias formateado
       ' ORDER BY orden is null, orden asc, Cat, Vueltas DESC, tiempo_total_raw ASC ' +
       ' ) t, (SELECT @posicion := 0, @cat_actual := ' + QuotedStr('') + ', ' +
       ' @primer_tiempo_cat := 0, @tiempo_anterior := 0, ' +
       ' @vueltas_primero := 0, @vueltas_anterior := 0) r ';

  Result := sqlString;
end;

function TEdicionAgrupacion.getAgrupacionSQL(agrupacionTomaTiempoOID : Integer; paraReportePDF: Boolean = False): String;
var
  sqlString: String;
  i : Integer;
colName: String;
begin
  with ZTomaTiemposForExport do
    begin
      Close;
      ParamByName('toma_tiempo_agrupacion_oid').AsInteger:= agrupacionTomaTiempoOID;
      Open;
    end;

  // --- PUNTO 1: Envolver todo en un SELECT externo con variables ---
  sqlString := 'SELECT ' +
               ' @posicion := IF(@cat_actual = t.Cat, @posicion + 1, 1) AS Posicion, ' +
               ' @cat_actual := t.Categoria as Categoria_Control, ' +
               ' t.* FROM ( ';

  sqlString := sqlString + ' SELECT nro_competidor ' + QuotedStr('Nro. Competidor') +
               ', nombre_piloto Competidor, Categoria, ';

  i := 1;
  with ZTomaTiemposForExport do
    begin
      First;
      while not EOF do
        begin
          if paraReportePDF then
            colName := 'TOT_' + IntToStr(i)
          else
            colName := FieldByName('nombre').AsString;

          sqlString:= sqlString + 'CONCAT(sel_formatted_lap_time(sel_total_time('+FieldByName('oid').AsString+', piloto_oid)), '+QuotedStr('.')+') as '+QuotedStr(colName)+', ' ;

          Inc(i);
          Next;
        end;
    end;


  sqlString:= sqlString + ' GROUP_CONCAT(ranking.TR) DescripcionRecargo, SUM(ranking.Recargo) Recargo, CONCAT(sel_formatted_total_time(SUM(tiempo_total)), '+QuotedStr('.')+') '+QuotedStr('Tiempo Total')+', SUM(ranking.Vueltas) Vueltas ' +
       ' from (select tte.oid, sel_nro_moto_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid) nro_competidor, ' +
       ' CASE WHEN c.utiliza_acompaniante = 1 THEN CONCAT(UC_Words(CONCAT(p.apellido, ' + QuotedStr(', ') + ' , p.nombre)), IFNULL(UC_Words(CONCAT(' + QuotedStr(' / ') + ', n.apellido, ' + QuotedStr(', ') + ' , n.nombre)), ' + QuotedStr(' ') + '))' +
       ' ELSE UC_Words(CONCAT(p.apellido, ' + QuotedStr(', ') + ' , p.nombre)) END AS nombre_piloto, ' +
       ' sel_nombre_categoria_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid) Categoria, ' +
       ' sel_total_time(tt.toma_tiempo_evento_oid, tt.piloto_oid) tiempo_total, '+
       ' sel_can_vueltas(tt.toma_tiempo_evento_oid, tt.piloto_oid) Vueltas, ' +
       ' c.orden, ' +
       ' sel_recargo_by_toma_tiempo_evento_and_piloto_and_tipo_categoria(tte.oid, ipe.tipo_categoria_oid, ipe.piloto_oid) Recargo, ' +
       ' CONCAT(sel_rec_desc_by_toma_tiempo_evento_and_piloto_and_tipo_categoria(tte.oid, ipe.tipo_categoria_oid, ipe.piloto_oid), '+QuotedStr(' - ')+', tte.nombre) TR, ' +
       ' p.oid as piloto_oid ' +
     ' from toma_tiempos tt ' +
     '     join toma_tiempo_evento tte on tt.toma_tiempo_evento_oid = tte.oid ' +
     '     join piloto p on tt.piloto_oid = p.oid ' +
     '     join inscripcion_piloto_evento ipe on (ipe.evento_oid = tte.evento_oid and ipe.piloto_oid = tt.piloto_oid)' +
     '     left join navegante n on n.piloto_oid = p.oid, categorias c' +
     ' where tte.oid in (SELECT DISTINCT toma_tiempo_oid FROM toma_tiempo_agrupacion_tt WHERE toma_tiempo_agrupacion_oid = :toma_tiempo_agrupacion_oid) ' +
     ' and c.oid = sel_categoria_oid_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, ipe.evento_oid, ipe.piloto_oid) ' +
     ' group by p.oid, tte.oid) ranking ' +
     ' group by nro_competidor, nombre_piloto, Categoria ' +
     ' order by orden IS NULL, orden, Categoria, Vueltas desc, tiempo_total asc ' +
     ' ) t, (SELECT @posicion := 0, @cat_actual := ' + QuotedStr('') + ') r '; // --- PUNTO 3: Cierre de subconsulta e inicialización ---

  Result:= sqlString;
end;

procedure TEdicionAgrupacion.OcultarCamposExportacion(Dataset: TDataSet; const NombresCampos: array of string);
var
  i: Integer;
  Campo: TField;
begin
  // Desactivamos los controles visuales para ganar velocidad
  Dataset.DisableControls;
  try
    for i := Low(NombresCampos) to High(NombresCampos) do
    begin
      Campo := Dataset.FindField(NombresCampos[i]);
      if Assigned(Campo) then
        Campo.Visible := False;
    end;
  finally
    Dataset.EnableControls;
  end;
end;

procedure ActualizarWebNetlifyInvisibles;
var
  StartInfo: TStartupInfo;
  ProcInfo: TProcessInformation;
  Comando: string;
begin
  Comando := 'C:\enduro\Dropbox\Reportes Web\actualizar.bat';

  FillChar(StartInfo, SizeOf(StartInfo), 0);
  StartInfo.cb := SizeOf(StartInfo);
  // Configuramos para que la ventana de la consola nazca oculta
  StartInfo.dwFlags := STARTF_USESHOWWINDOW;
  StartInfo.wShowWindow := SW_HIDE;

  // Creamos el proceso en Windows
  if CreateProcess(nil, PChar(Comando), nil, nil, False,
                   CREATE_NO_WINDOW, nil, nil, StartInfo, ProcInfo) then
  begin
    // Cerramos los handles inmediatamente para liberar memoria
    CloseHandle(ProcInfo.hProcess);
    CloseHandle(ProcInfo.hThread);
  end;
end;


procedure TEdicionAgrupacion.JvReportTimerTimer(Sender: TObject);
var
  RutaArchivo, TextoCabecera, Instancia, Modo: string;
begin
      with zExportarAgrupacion do
      begin
        Close; // Cierra primero
        Sql.Text := getAgrupacionPuntosSQL(agrupacionTomaTiempoOID);
        ParamByName('toma_tiempo_agrupacion_oid').AsInteger := agrupacionTomaTiempoOID;

        DisableControls; // Desactiva justo antes de abrir
        try
          Open;
        finally
          EnableControls;
        end;
      end;

      // Ocultamos las columnas que no queremos ver en la exportaciÓn
      OcultarCamposExportacion(zExportarAgrupacion, ['Posicion', 'categoria_oid', 'piloto_oid', 'Categoria_Control', '_p', '_a', '_vp', '_va', 'tiempo_total_raw']);
      ExportarAHTML(zExportarAgrupacion);
      //Modo:= ReadStringFromIniFile('Instancia','Modo','PROD');
      //if(Modo = 'PROD') then

      // Si en algún momento se retoma Excel/PDF:
      // if Modo = 'LEGACY' then
      //   ExportarExcelYPDF(zExportarAgrupacion, Instancia);
end;

procedure TEdicionAgrupacion.ExportarExcelYPDF(Dataset: TDataSet; const Instancia: string);
var
  RutaArchivo: string;
  Hoja: Variant;
begin
  // Método en desuso - se mantiene por si se retoma la exportación a Excel/PDF más adelante.
  // Actualmente la publicación de resultados se hace vía ExportarAHTML + Cloudflare Worker.

  scExcelExport.Dataset := Dataset;
  scExcelExport.WorksheetName := 'Clasifica x Categoria';
  scExcelExport.FileName := 'C:\enduro\Dropbox\Reportes Web\exportarweb' + Instancia + '.xls';
  RutaArchivo := 'C:\enduro\Dropbox\Reportes Web\exportarweb.pdf';

  try
    scExcelExport.Connect;

    if Assigned(scExcelExport.ExcelApplication) then
    begin
      scExcelExport.ExcelApplication.Visible[0] := False;
      scExcelExport.ExcelApplication.ScreenUpdating[0] := False;
      scExcelExport.ExcelApplication.DisplayAlerts[0] := False;
    end;

    scExcelExport.ExportDataset;

    Hoja := scExcelExport.ExcelApplication.ActiveSheet;

    Hoja.Cells[2, 7].Select;
    scExcelExport.ExcelApplication.ActiveWindow.FreezePanes := True;

    Hoja.PageSetup.CenterHeader := '&"Arial,Bold"&12 ENCUENTRO CORDILLERANO' + #13 +
      'Fecha 1: Epuyen' + #13 +
      'Generado el: ' + FormatDateTime('dd/mm/yyyy hh:nn', Now);

    Hoja.PageSetup.RightFooter := 'Página &P de &N';

    Hoja.Range['A1', 'AF146'].EntireColumn.AutoFit;
    Hoja.Range['A1', 'AF146'].HorizontalAlignment := -4108;

    Hoja.PageSetup.Zoom := False;
    Hoja.PageSetup.FitToPagesWide := 1;
    Hoja.PageSetup.FitToPagesTall := False;
    Hoja.PageSetup.Orientation := 2;
    Hoja.ExportAsFixedFormat(0, RutaArchivo);

    if Assigned(scExcelExport.ExcelApplication) then
      scExcelExport.ExcelApplication.Visible[0] := False;

    scExcelExport.ExcelApplication.ActiveWorkbook.SaveAs(
      scExcelExport.FileName,
      56,
      EmptyParam, EmptyParam, EmptyParam, EmptyParam,
      1,
      EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 0
    );

    scExcelExport.ExcelApplication.Quit;
  finally
    scExcelExport.Disconnect;
  end;
end;

function EjecutarComando(const CmdLine: string; out Salida: string): Boolean;
var
  SecurityAttr: TSecurityAttributes;
  StdOutRead, StdOutWrite: THandle;
  StartInfo: TStartupInfo;
  ProcInfo: TProcessInformation;
  Buffer: array[0..4095] of AnsiChar;
  BytesRead, ExitCode: DWORD;
  CmdLineBuf: string;
begin
  Result := False;
  Salida := '';

  SecurityAttr.nLength := SizeOf(TSecurityAttributes);
  SecurityAttr.bInheritHandle := True;
  SecurityAttr.lpSecurityDescriptor := nil;

  if not CreatePipe(StdOutRead, StdOutWrite, @SecurityAttr, 0) then
    Exit;

  try
    FillChar(StartInfo, SizeOf(StartInfo), 0);
    StartInfo.cb := SizeOf(StartInfo);
    StartInfo.hStdOutput := StdOutWrite;
    StartInfo.hStdError := StdOutWrite;
    StartInfo.dwFlags := STARTF_USESTDHANDLES or STARTF_USESHOWWINDOW;
    StartInfo.wShowWindow := SW_HIDE;

    CmdLineBuf := CmdLine; // CreateProcess necesita un buffer modificable

    if CreateProcess(nil, PChar(CmdLineBuf), nil, nil, True, 0, nil, nil, StartInfo, ProcInfo) then
    begin
      CloseHandle(StdOutWrite);
      StdOutWrite := 0;

      repeat
        if not ReadFile(StdOutRead, Buffer, SizeOf(Buffer) - 1, BytesRead, nil) or (BytesRead = 0) then
          Break;
        Buffer[BytesRead] := #0;
        Salida := Salida + string(AnsiString(Buffer));
      until False;

      WaitForSingleObject(ProcInfo.hProcess, 15000); // timeout de 15s, no INFINITE
      GetExitCodeProcess(ProcInfo.hProcess, ExitCode);
      Result := (ExitCode = 0);

      CloseHandle(ProcInfo.hProcess);
      CloseHandle(ProcInfo.hThread);
    end;
  finally
    if StdOutWrite <> 0 then CloseHandle(StdOutWrite);
    CloseHandle(StdOutRead);
  end;
end;

procedure TEdicionAgrupacion.SubirAWorker(const HTMLContent: string);
var
  RutaTemp, CmdLine, Salida, IdInstancia: string;
  SL: TStringList;
begin
  IdInstancia:= ReadStringFromIniFile('Instancia','Nombre','');

  RutaTemp := ExtractFilePath(ParamStr(0)) + 'posiciones_temp.html';

  SL := TStringList.Create;
  try
    SL.Text := HTMLContent;
    SL.SaveToFile(RutaTemp, TEncoding.UTF8);
  finally
    SL.Free;
  end;

  CmdLine := Format(
    '"%scurl.exe" -s -X POST -H "Authorization: Bearer K7pQ2xR9mT4vB8nL1cW6yH3jF5sD0aZ8" ' +
    '-H "Content-Type: text/html; charset=utf-8" --data-binary "@%s" ' +
    '"https://resultados-carrera.sotoaienrique.workers.dev/?id=%s"',
    [ExtractFilePath(ParamStr(0)), RutaTemp, IdInstancia]);

  if not EjecutarComando(CmdLine, Salida) then
    raise Exception.Create('Fallo al subir con curl: ' + Salida);
end;

procedure TEdicionAgrupacion.ExportarAHTML(Dataset: TDataSet);
var
  List: TStringList;
  Conteo: TStringList;
  i: Integer;
  Fila, CategoriaActual, NombreCampoCat: string;
  PrimeraFila: Boolean;
  PosicionEnCategoria: Integer;

  function ObtenerConteo(const Categoria: string): Integer;
  var
    idx: Integer;
  begin
    idx := Conteo.IndexOfName(Categoria);
    if idx >= 0 then
      Result := StrToInt(Conteo.ValueFromIndex[idx])
    else
      Result := 0;
  end;

function Medalla(Pos: Integer): string;
begin
  case Pos of
    1: Result := '&#129351;'; // 🥇
    2: Result := '&#129352;'; // 🥈
    3: Result := '&#129353;'; // 🥉
  else
    Result := IntToStr(Pos);
  end;
end;

procedure AbrirTabla(const Categoria: string);
var
  i: Integer;
begin
  List.Add('  <div class="categoria-card">');
  List.Add('    <div class="categoria-header">');
  List.Add('      <span class="categoria-nombre">' + Categoria + '</span>');
  List.Add('      <span class="categoria-count">' + IntToStr(ObtenerConteo(Categoria)) +
    ' de ' + IntToStr(ObtenerConteo(Categoria)) + ' participantes</span>');
  List.Add('    </div>');
  List.Add('    <div class="tabla-scroll">');        // <-- ESTA LÍNEA es la que falta
  List.Add('    <table class="tabla-web">');
  List.Add('      <thead><tr>');
  List.Add('        <th>Pos.</th>');
  for i := 0 to Dataset.FieldCount - 1 do
    if Dataset.Fields[i].Visible and not SameText(Dataset.Fields[i].FieldName, NombreCampoCat) then
      List.Add('        <th>' + Dataset.Fields[i].DisplayLabel + '</th>');
  List.Add('      </tr></thead>');
  List.Add('      <tbody>');
end;

procedure CerrarTabla;
begin
  List.Add('      </tbody>');
  List.Add('    </table>');
  List.Add('    </div>');    // <-- ESTA LÍNEA también falta (cierre de tabla-scroll)
  List.Add('  </div>');      // cierre de categoria-card
end;

begin
  NombreCampoCat := 'Cat'; // nombre del campo de categoría

  List := TStringList.Create;
  Conteo := TStringList.Create;
  try
    Conteo.Sorted := False;

    // --- Pre-conteo de participantes por categoría ---
    Dataset.First;
    while not Dataset.Eof do
    begin
      CategoriaActual := Trim(Dataset.FieldByName(NombreCampoCat).AsString);
      i := Conteo.IndexOfName(CategoriaActual);
      if i >= 0 then
        Conteo.ValueFromIndex[i] := IntToStr(StrToInt(Conteo.ValueFromIndex[i]) + 1)
      else
        Conteo.Add(CategoriaActual + '=1');
      Dataset.Next;
    end;

    // --- Estilos (una sola vez) ---
    List.Add('<style>');
    List.Add('  body { background-color: #f5f6f8; }');
    List.Add('  .categoria-card {');
    List.Add('    font-family: Arial, Helvetica, sans-serif;');
    List.Add('    background: #ffffff;');
    List.Add('    border-radius: 10px;');
    List.Add('    box-shadow: 0 2px 6px rgba(0,0,0,0.12);');
    List.Add('    margin-bottom: 24px;');
    List.Add('    overflow: hidden;');
    List.Add('  }');
    List.Add('  .tabla-scroll {');
    List.Add('    overflow-x: auto;');
    List.Add('    -webkit-overflow-scrolling: touch;');
    List.Add('    width: 100%;');
    List.Add('  }');
    List.Add('  .tabla-web { min-width: 900px; }'); // fuerza scroll horizontal en vez de achicar el texto hasta ilegible
    List.Add('  .categoria-header {');
    List.Add('    background: linear-gradient(135deg, #2c3e50, #34495e);');
    List.Add('    color: #ffffff;');
    List.Add('    padding: 12px 16px;');
    List.Add('    display: flex;');
    List.Add('    justify-content: space-between;');
    List.Add('    align-items: center;');
    List.Add('    flex-wrap: wrap;');
    List.Add('  }');
    List.Add('  .categoria-nombre { font-size: 16px; font-weight: bold; }');
    List.Add('  .categoria-count { font-size: 13px; opacity: 0.85; }');
    List.Add('  .tabla-web { border-collapse: collapse; width: 100%; }');
    List.Add('  .tabla-web th {');
    List.Add('    background-color: #ecf0f1;');
    List.Add('    color: #2c3e50;');
    List.Add('    padding: 8px 10px;');
    List.Add('    font-size: 13px;');
    List.Add('    text-transform: uppercase;');
    List.Add('    border-bottom: 2px solid #dcdfe1;');
    List.Add('  }');
    List.Add('  .tabla-web td {');
    List.Add('    padding: 8px 10px;');
    List.Add('    text-align: center;');
    List.Add('    font-size: 14px;');
    List.Add('    border-bottom: 1px solid #eee;');
    List.Add('  }');
    List.Add('  .tabla-web tr:nth-child(even) { background-color: #f9fafb; }');
    List.Add('  .tabla-web tr:hover { background-color: #eef6ff; }');
    List.Add('  .tabla-web td:first-child { font-weight: bold; }');
    List.Add('  .top1 { color: #d4af37; }');
    List.Add('  .top2 { color: #a7a7ad; }');
    List.Add('  .top3 { color: #cd7f32; }');
    List.Add('  .evento-header {');
    List.Add('    font-family: Arial, Helvetica, sans-serif;');
    List.Add('    background: #ffffff;');
    List.Add('    border-radius: 10px;');
    List.Add('    box-shadow: 0 2px 6px rgba(0,0,0,0.12);');
    List.Add('    padding: 16px 20px;');
    List.Add('    margin-bottom: 20px;');
    List.Add('    text-align: center;');
    List.Add('  }');
    List.Add('  .evento-titulo { font-size: 20px; font-weight: bold; color: #2c3e50; margin-bottom: 4px; }');
    List.Add('  .evento-subtitulo { font-size: 14px; color: #7f8c8d; margin-bottom: 10px; }');
    List.Add('  .evento-datos { font-size: 13px; color: #34495e; line-height: 1.6; }');
    List.Add('  .evento-datos strong { color: #2c3e50; }');
    List.Add('</style>');
    List.Add('<div class="table-responsive">');
    List.Add('  <div class="evento-header">');
    //List.Add('    <div class="evento-titulo">' + 'NombreFecha' + '</div>');
    //List.Add('    <div class="evento-subtitulo">Resultados por categorías</div>');
    List.Add('    <div class="evento-datos">');
    //List.Add('      Fecha: ' + FormatDateTime('dd-mm-yyyy', 'FechaEvento') + '<br>');
    //List.Add('      Lugar: ' + 'Lugar' + '<br>');
    List.Add('      Última actualización: ' + FormatDateTime('dd-mm-yyyy hh:nn:ss', Now));
    List.Add('    </div>');
    List.Add('  </div>');

    // --- Recorrido principal ---
    PrimeraFila := True;
    CategoriaActual := '';
    PosicionEnCategoria := 0;

    Dataset.First;
    while not Dataset.Eof do
    begin
      if (Trim(Dataset.FieldByName(NombreCampoCat).AsString) <> CategoriaActual) then
      begin
        if not PrimeraFila then
          CerrarTabla;
        CategoriaActual := Trim(Dataset.FieldByName(NombreCampoCat).AsString);
        AbrirTabla(CategoriaActual);
        PrimeraFila := False;
        PosicionEnCategoria := 0;
      end;

      Inc(PosicionEnCategoria);

      Fila := '        <tr>';
      // Columna de posición con medalla si corresponde
      case PosicionEnCategoria of
        1: Fila := Fila + '<td class="top1">' + Medalla(PosicionEnCategoria) + '</td>';
        2: Fila := Fila + '<td class="top2">' + Medalla(PosicionEnCategoria) + '</td>';
        3: Fila := Fila + '<td class="top3">' + Medalla(PosicionEnCategoria) + '</td>';
      else
        Fila := Fila + '<td>' + IntToStr(PosicionEnCategoria) + '</td>';
      end;

      for i := 0 to Dataset.FieldCount - 1 do
        if Dataset.Fields[i].Visible and not SameText(Dataset.Fields[i].FieldName, NombreCampoCat) then
          Fila := Fila + '<td>' + Dataset.Fields[i].AsString + '</td>';
      Fila := Fila + '</tr>';
      List.Add(Fila);

      Dataset.Next;
    end;

    if not PrimeraFila then
      CerrarTabla;

    List.Add('</div>');

    try
      SubirAWorker(List.Text);
    except
  on E: Exception do
    ShowMessage('Error: ' + E.Message + sLineBreak +
                'DLL que Indy no pudo cargar: ' + WhichFailedToLoad);
    end;
  finally
    Conteo.Free;
    List.Free;
  end;
end;

procedure TEdicionAgrupacion.DiagnosticoSSL;
var
  Carpeta: string;
begin
  Carpeta := ExtractFilePath(ParamStr(0));
  ShowMessage(
    'Carpeta del EXE: ' + Carpeta + sLineBreak +
    'libssl-3.dll existe: '   + BoolToStr(FileExists(Carpeta + 'libssl-3.dll'), True) + sLineBreak +
    'libcrypto-3.dll existe: ' + BoolToStr(FileExists(Carpeta + 'libcrypto-3.dll'), True)
  );
end;

procedure TEdicionAgrupacion.enableAddAgrupacion;
begin
  isAdding:= True;
  txtNombre.Enabled:= True;
  cmbTipoToma.Enabled:= True;
  cmbTipoAgrupacion.Enabled:= True;

  tomaTiempoPanel.Visible:= False;
end;

procedure TEdicionAgrupacion.btnAcceptClick(Sender: TObject);
begin
  if (isAdding = True) then
    with ZQueryInsert do
      begin
        ParamByName('nombre').AsString:= txtNombre.Text;
        ParamByName('tipo_agrupacion').AsString:= cmbTipoAgrupacion.Text;
        ParamByName('tipo_toma_tiempo').AsString:= cmbTipoToma.Text;
        ExecSQL;
      end;
end;

end.
