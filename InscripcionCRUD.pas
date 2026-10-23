
unit InscripcionCRUD;

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
  cxData, cxDataStorage, cxEdit, Data.DB, cxDBData, cxContainer,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, Vcl.Menus, AdvMenus,
  Data.Bind.Components, ZAbstractRODataset, ZDataset, Vcl.ImgList,
  dxGDIPlusClasses, HotSpotImage, cxLabel, AdvSmoothLabel, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxSplitter, Vcl.StdCtrls, AeroButtons, Vcl.ExtCtrls,
  Vcl.DBCtrls, ZAbstractDataset, ZAbstractTable, Entidades, BindingHelperUnit,
  BussinessDataSubsystemFacade, cxTextEdit, Vcl.ComCtrls, cxListView, frxClass,
  frxDBSet, scExcelExport, JvExExtCtrls, JvNetscapeSplitter, Vcl.ActnList,
  cxLocalization, Vcl.ToolWin, F_EEMessage, PilotCRUDUnit, PilotEditorUnit,
  PilotEditorInnerUnit, tmsAdvGridExcel, DataModule, cxCheckBox, Vcl.OleServer,
  Excel2010;

type
  TInscripcionesCRUD = class(TAbstractCRUDFrame)
    ZCampeonato: TZTable;
    DSCampeonato: TDataSource;
    DSEvento: TDataSource;
    BindingsListEntity: TBindingsList;
    BindScopeEntity: TBindScope;
    cxGridDBTableViewnombre_evento: TcxGridDBColumn;
    cxGridDBTableViewnombre_piloto: TcxGridDBColumn;
    cxGridDBTableViewnombre_campeonato: TcxGridDBColumn;
    lblCampeonato: TcxLabel;
    cmbCampeonato: TDBLookupComboBox;
    lblEvento: TcxLabel;
    cmbEvento: TDBLookupComboBox;
    txtNroDocumento: TcxTextEdit;
    lblNombre: TcxLabel;
    cxErrorImageList: TcxImageList;
    lblFilterCampeonato: TcxLabel;
    cmbFilterPiloto: TDBLookupComboBox;
    lblFilterEvento: TcxLabel;
    cmbFilterEvento: TDBLookupComboBox;
    DSFilterPiloto: TDataSource;
    DSFilterEvento: TDataSource;
    ZSelectedPilotData: TZReadOnlyQuery;
    N1: TMenuItem;
    ZFilterPiloto: TZReadOnlyQuery;
    btnExportarExcel: TAeroButton;
    ZExportarInscripcion: TZQuery;
    ZFilterEvento: TZReadOnlyQuery;
    ZEvento: TZReadOnlyQuery;
    frxReporteEvento: TfrxReport;
    cxGridDBTableViewCategoria: TcxGridDBColumn;
    ZCategoria: TZTable;
    DSCategoria: TDataSource;
    cxLabel2: TcxLabel;
    cmbCategoria: TDBLookupComboBox;
    ZExportarDatosInscriptos: TZQuery;
    btnInscriptos: TAeroButton;
    cxGridDBTableViewNroMoto: TcxGridDBColumn;
    cmbDiaInscripcion: TComboBox;
    lblTipoCategoria: TcxLabel;
    cmbTipoCategoria: TDBLookupComboBox;
    ZTipoCategoria: TZTable;
    DSTipoCategoria: TDataSource;
    cxGridDBTableViewtipo_categoria: TcxGridDBColumn;
    TCampeonatoFilter: TZTable;
    DSCampeonatoFilter: TDataSource;
    lblCampeonatoFilter: TcxLabel;
    cmbFilterCampeonato: TDBLookupComboBox;
    ZExportarValores: TZQuery;
    btnValores: TAeroButton;
    chkImprimirReporte: TcxCheckBox;
    ZInscripcionesPorPiloto: TZReadOnlyQuery;
    btnGenerarInscripcionMasiva: TAeroButton;
    ZInscripcionMasiva: TZQuery;
    ZExportarDatosInscriptosT: TZQuery;
    ZReSetPosition: TZQuery;
    scExcelExport: TscExcelExport;
    usuarioDBDS: TfrxDBDataset;
    usgusta: TAeroButton;
    Excel: TExcelApplication;
    btnDesinscripcionMasiva: TAeroButton;
    ZDesinscripcionMasiva: TZQuery;
    frxInscripcionReporte: TfrxReport;
    cxGridDBTableViewColumn1: TcxGridDBColumn;
    cxGridDBTableViewColumn2: TcxGridDBColumn;
    procedure btnNewClick(Sender: TObject);
    procedure cmbCampeonatoExit(Sender: TObject);
    procedure cmbCampeonatoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtNroDocumentoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtNroDocumentoKeyPress(Sender: TObject; var Key: Char);
    procedure btnEditClick(Sender: TObject);
    procedure buttonPanelResize(Sender: TObject);
    procedure btnExportarExcelClick(Sender: TObject);
    procedure cmbFilterEventoKeyPress(Sender: TObject; var Key: Char);
    procedure FrameEnter(Sender: TObject);
    procedure cmbFilterEventoExit(Sender: TObject);
    procedure cmbFilterEventoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGridDBTableViewTcxGridDBDataControllerTcxDataSummaryFooterSummaryItems0GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
      var AText: string);
    procedure btnInscriptosClick(Sender: TObject);
    procedure cmbDiaInscripcionExit(Sender: TObject);
    procedure cmbDiaInscripcionKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnValoresClick(Sender: TObject);
    procedure btnGenerarInscripcionMasivaClick(Sender: TObject);
    procedure scExcelExportGetCellStyleEvent(Sender: TObject; Field: TField;
      var ColorBackground: TColor; FontCell: TxlFont);
    procedure FrameMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FrameMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure usgustaClick(Sender: TObject);
    procedure btnDesinscripcionMasivaClick(Sender: TObject);
  private
    FEstiloSinNumero: TcxStyle;
    FEstiloRepetido: TcxStyle;
    FColPilotoOID: TcxGridDBColumn;
    FRepetidos: TStringList;   // piloto_oid con un número que usa otro inscripto del evento
    procedure CargarNumerosRepetidos(EventoOID: Integer);
    function EsNumeroRepetido(ARecord: TcxCustomGridRecord): Boolean;
    function NumeroRepetidoAlInscribir(piloto: TPiloto): String;
    procedure initializeTables;
    procedure generateReport(Pilotos: TStringList; tipoCategoriaOID, eventoOID: Integer);
    procedure setTListItemsByString(errorListView : TcxListView; stringMessage: String);
    function getNroMoto(tipoCategoriaOID : Integer; pilotoVO : TPiloto) : String;
    function getCategoria(tipoCategoriaOID : Integer; pilotoVO : TPiloto) : String;
    procedure selectCombosByDate;
    function getPilotDataSQL(Pilotos: TStringList): String;
    function TieneNumeroCero(const NroMoto: string): Boolean;
    function ContarInscriptosSinNumero: Integer;
    procedure cxGridDBTableViewGetContentStyleSinNumero(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
  protected
    persistentVO: TPersistentObject;

    procedure InitializeBinding; Override;
    procedure requestLoadInitialData(filterVO: TValueObject); Override;
    procedure doRequestSave(persistentVO: TPersistentObject); Override;
    function requestElement(OID: Integer): TPersistentObject; Override;
    procedure requestDelete(OID: Integer); Override;
  public
    constructor Create(owner: TComponent); Override;
    destructor Destroy; override;
    function getEditorValueObject(): TPersistentObject;
    procedure setTListItemsByTStringList(errorListView : TcxListView; stringList : TStringList);
    procedure RefreshCRUDData;
    procedure inscribirPiloto(piloto: TPiloto);
  end;

implementation

uses
  System.Win.ComObj, LogUnit, ValidationHelper;

{$R *.dfm}

procedure TInscripcionesCRUD.RefreshCRUDData;
begin
  ZCategoria.Close;
  ZCategoria.Open;

  ZFilterPiloto.Close;
  ZFilterPiloto.Open;

  ZFilterEvento.Close;
  ZFilterEvento.Open;

  ZTipoCategoria.Close;
  ZTipoCategoria.Open;

  ZCampeonato.Close;
  ZCampeonato.Open;

  ZEvento.Close;
  ZEvento.Open;

end;

procedure TInscripcionesCRUD.setTListItemsByTStringList(errorListView : TcxListView; stringList : TStringList);
var
  Index : Integer;
begin
  errorListView.Items.Clear;

  for Index := 0 to stringList.Count - 1 do
  begin
    with errorListView.Items.Add do
    begin
      Caption := stringList[Index];
      StateIndex:= 0;
    end;
  end;
end;

procedure TInscripcionesCRUD.txtNroDocumentoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (Key = #13) then
    btnNewClick(Sender);
end;

procedure TInscripcionesCRUD.txtNroDocumentoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  BindingsListEntity.Notify(Sender, 'Text');
end;

procedure TInscripcionesCRUD.btnExportarExcelClick(Sender: TObject);
begin
  if (cmbEvento.KeyValue > 0) then
    begin
      with ZExportarInscripcion do
      begin
        Close;
        ParamByName('evento_oid').AsInteger:= cmbEvento.KeyValue;
        Open;
      end;

      scExcelExport.Dataset:= ZExportarInscripcion;
      scExcelExport.WorksheetName := 'Toma de Tiempos';
      scExcelExport.ExportDataset;
      scExcelExport.Disconnect;
    end
  else
      setTListItemsByString(errorListView, 'Debe seleccionar un Evento para generar el archivo de Excel.');
end;

procedure TInscripcionesCRUD.btnGenerarInscripcionMasivaClick(Sender: TObject);
begin
  if (TF_EE_Message.ShowMessage(TComponent(Self),'Confirmación de inscripción Masiva',
    '¿Está seguro que desea generar una INSCRIPCION MASIVA?', TF_EE_Message.QUESTION, False) = mrOk) then
  begin
    if (cmbEvento.KeyValue > 0) then
      begin
        with ZInscripcionMasiva do
        begin
          Close;
          ParamByName('evento_oid').AsInteger:= cmbEvento.KeyValue;
          ExecSQL;
        end;

        with queryGrid do
          begin
            Close;
            ParamByName('evento_oid').AsInteger:= cmbEvento.KeyValue;
            Open;
          end;

        TF_EE_Message.ShowMessage(TComponent(Self),'Generación de Inscripción Masiva exitosa',
          'Se ha generado la inscripción masiva de manera exitosa.', TF_EE_Message.INFORMATION, True);
      end
    else
        setTListItemsByString(errorListView, 'Debe seleccionar un Evento para realizar la Inscripción Masiva');
  end;
end;

procedure TInscripcionesCRUD.scExcelExportGetCellStyleEvent(Sender: TObject;
  Field: TField; var ColorBackground: TColor; FontCell: TxlFont);
begin
  if Field.FieldName = 'Nro.' then
    begin
      ColorBackground:= clAqua;
      FontCell.Style:= [fsBold];
    end;
end;

procedure TInscripcionesCRUD.usgustaClick(Sender: TObject);
const
  MAX_ITEMS_VISIBLES = 15;
var
  OpenDialog: TOpenDialog;
  ExcelApp, Libro, Rango, Datos, ValorFecha: Variant;
  Piloto: TPiloto;
  EventoVO: TEvento;
  InscripcionVO, InscripcionEVO: TInscripcion;
  SinNumero, NoEncontrados, Avisos: TStringList;
  NroDocumento, Categoria, Fila, Mensaje, OtroPiloto: string;
  FilaBase, TotalFilas, TotalCols, r, NumMoto, PilotoOID: Integer;
  Inscriptos, YaInscriptos: Integer;
  Fecha: TDateTime;

  function Celda(F, C: Integer): Variant;
  begin
    Result := Unassigned;
    if (F >= 1) and (F <= TotalFilas) and (C <= TotalCols) then
      Result := Datos[F, C];
  end;

  function CeldaTexto(F, C: Integer): string;
  var
    Valor: Variant;
  begin
    Valor := Celda(F, C);
    if VarIsEmpty(Valor) or VarIsNull(Valor) or (VarType(Valor) = varError) then
      Result := ''
    else
      Result := Trim(VarToStr(Valor));
  end;

  procedure AgregarLista(Lista: TStringList; const Titulo: string);
  var
    k: Integer;
  begin
    if Lista.Count = 0 then
      Exit;
    Mensaje := Mensaje + '<br><br><b>' + Titulo + ' (' + IntToStr(Lista.Count) + '):</b>';
    for k := 0 to Lista.Count - 1 do
      if k < MAX_ITEMS_VISIBLES then
        Mensaje := Mensaje + '<br>' + Lista[k];
    if Lista.Count > MAX_ITEMS_VISIBLES then
      Mensaje := Mensaje + Format('<br>... y %d más.', [Lista.Count - MAX_ITEMS_VISIBLES]);
  end;

begin
  if not ((cmbEvento.KeyValue > 0) and (cmbTipoCategoria.KeyValue > 0)) then
  begin
    TF_EE_Message.ShowMessage(TComponent(Self), '¡Seleccione el Evento!',
      'Debe seleccionar el Evento y el Tipo de Categoría', TF_EE_Message.INFORMATION, True);
    Exit;
  end;

  // 1) Elegir archivo y leer la primera hoja completa de una vez
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
        Libro := ExcelApp.Workbooks.Open(OpenDialog.FileName, 0, True); // solo lectura
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
      'La primera hoja del archivo no tiene DNI en la columna A.', TF_EE_Message.WARNING, True);
    Exit;
  end;
  TotalFilas := VarArrayHighBound(Datos, 1);
  TotalCols := VarArrayHighBound(Datos, 2);

  SinNumero := TStringList.Create;
  NoEncontrados := TStringList.Create;
  Avisos := TStringList.Create;
  EventoVO := TBussinessDataSubsystemFacade.getInstance.getEvento(cmbEvento.KeyValue);
  Inscriptos := 0;
  YaInscriptos := 0;
  if not ZCategoria.Active then
    ZCategoria.Open;
  Screen.Cursor := crHourGlass;
  try
    // 2) Fila 1 de la hoja = encabezados; los datos empiezan en la fila 2
    for r := 1 to TotalFilas do
    begin
      if FilaBase + r - 1 < 2 then
        Continue;

      Fila := 'Fila ' + IntToStr(FilaBase + r - 1);
      NroDocumento := StringReplace(CeldaTexto(r, 1), '.', '', [rfReplaceAll]);
      NroDocumento := StringReplace(NroDocumento, ' ', '', [rfReplaceAll]);
      if NroDocumento = '' then
        Continue;

      PilotoOID := TBussinessDataSubsystemFacade.getInstance.getPilotoOIDByDNI(NroDocumento);
      Piloto := TBussinessDataSubsystemFacade.getInstance.getPiloto(PilotoOID);
      if Piloto = nil then
      begin
        NoEncontrados.Add(Fila + ': DNI ' + NroDocumento);
        Continue;
      end;

      try
        Piloto.ValidacionNumericaCategoria := False;
        // Con esto no se valida la numeracion en categoria ni TAGS
        Piloto.ValidacionNumericaEnCategoria := TBussinessDataSubsystemFacade
          .getInstance.getInscripcionByPilotoOIDAndCampeonatoOID(PilotoOID, EventoVO.CampeonatoOID);

        // Col. B: categoría (solo si existe; no se crean categorías nuevas)
        Categoria := CeldaTexto(r, 2);
        if Categoria <> '' then
        begin
          if ZCategoria.Locate('nombre', Categoria, [loCaseInsensitive]) then
            Piloto.CategoriaOID := ZCategoria.FieldByName('oid').AsInteger
          else
            Avisos.Add(Format('%s (%s): la categoría "%s" no existe; se mantiene la del piloto.',
              [Fila, Piloto.getNombreCompleto, Categoria]));
        end;

        // Col. C: fecha de nacimiento (fecha de Excel o texto dd/mm/aaaa)
        ValorFecha := Celda(r, 3);
        if VarType(ValorFecha) = varDouble then
          Piloto.FechaNacimiento := TDateTime(Double(ValorFecha))
        else if CeldaTexto(r, 3) <> '' then
        begin
          if TryStrToDate(CeldaTexto(r, 3), Fecha) then
            Piloto.FechaNacimiento := Fecha
          else
            Avisos.Add(Format('%s (%s): fecha de nacimiento inválida "%s".',
              [Fila, Piloto.getNombreCompleto, CeldaTexto(r, 3)]));
        end;

        // Col. D: número de moto (opcional; vacío o texto = queda como está).
        // No se asigna si ya lo usa otro inscripto del evento: el número de moto es único.
        if TryStrToInt(CeldaTexto(r, 4), NumMoto) and (NumMoto > 0) then
        begin
          OtroPiloto := TValidationHelper.getPilotoConNumeroEnEvento(cmbEvento.KeyValue, 1,
            NumMoto, PilotoOID, False);
          if OtroPiloto <> '' then
            Avisos.Add(Format('%s (%s): el número %d ya lo tiene %s; se mantiene el %d.',
              [Fila, Piloto.getNombreCompleto, NumMoto, OtroPiloto, Piloto.NumMoto]))
          else
            Piloto.NumMoto := NumMoto;
        end;

        if Piloto.isValidObject then
          TBussinessDataSubsystemFacade.getInstance.savePiloto(Piloto)
        else
          Avisos.Add(Format('%s (%s): datos del piloto sin guardar - %s',
            [Fila, Piloto.getNombreCompleto, Piloto.getValidationResult().CommaText]));

        // Inscripción (aunque no tenga número: se asigna a mano desde la grilla)
        if TBussinessDataSubsystemFacade.getInstance
             .getInscripcionByPilotoOIDAndEventoOID(PilotoOID, cmbEvento.KeyValue) < 1 then
        begin
          InscripcionVO := TInscripcion.Create;
          try
            InscripcionVO.EventoOID := cmbEvento.KeyValue;
            InscripcionVO.PilotoOID := PilotoOID;
            InscripcionVO.DiaInscripcionIndex := cmbDiaInscripcion.ItemIndex;
            InscripcionVO.TipoCategoriaOID := cmbTipoCategoria.KeyValue;
            TBussinessDataSubsystemFacade.getInstance.addInscripcion(InscripcionVO);
            Inc(Inscriptos);

            if (Piloto.NumExterno > 0) and (InscripcionVO.TipoCategoriaOID <> 4) then
            begin
              InscripcionEVO := TInscripcion.Create;
              try
                InscripcionEVO.EventoOID := cmbEvento.KeyValue;
                InscripcionEVO.PilotoOID := PilotoOID;
                InscripcionEVO.DiaInscripcionIndex := cmbDiaInscripcion.ItemIndex;
                InscripcionEVO.TipoCategoriaOID := 4;
                TBussinessDataSubsystemFacade.getInstance.addInscripcion(InscripcionEVO);
              finally
                InscripcionEVO.Free;
              end;
            end;
          finally
            InscripcionVO.Free;
          end;
        end
        else
          Inc(YaInscriptos);

        if (getNroMoto(cmbTipoCategoria.KeyValue, Piloto) = '0') or
           (getNroMoto(cmbTipoCategoria.KeyValue, Piloto) = '') then
          SinNumero.Add(Format('%s: %s (DNI %s)', [Fila, Piloto.getNombreCompleto, NroDocumento]));
      finally
        Piloto.Free;
      end;
    end;

    // 3) Refrescar la grilla con el filtro actual
    btnFilterClick(Self);
  finally
    Screen.Cursor := crDefault;
  end;

  // 4) Resumen
  Mensaje := Format('Evento: <b>%s</b><br>Inscriptos nuevos: <b>%d</b><br>Ya estaban inscriptos: <b>%d</b>',
    [cmbEvento.Text, Inscriptos, YaInscriptos]);
  AgregarLista(SinNumero, '<font color="#c00000">SIN NÚMERO - asignar desde la grilla (doble clic)</font>');
  AgregarLista(NoEncontrados, 'No están en la base de datos');
  AgregarLista(Avisos, 'Avisos');

  try
    TF_EE_Message.ShowMessage(TComponent(Self), 'Resultado de Inscripción por XLS', Mensaje,
      TF_EE_Message.INFORMATION, True, True);
  finally
    EventoVO.Free;
    Avisos.Free;
    NoEncontrados.Free;
    SinNumero.Free;
  end;
end;

procedure TInscripcionesCRUD.btnInscriptosClick(Sender: TObject);
var
  eventoVO : TEvento;
  consulta: String;
begin
  if (cmbEvento.KeyValue > 0) then
    begin
      eventoVO:= TBussinessDataSubsystemFacade.getInstance.getEvento(cmbEvento.KeyValue);

      ZReSetPosition.ParamByName('posicion').AsInteger:= 0;
      ZReSetPosition.ExecSQL;

      consulta:= 'select @posicion:=@posicion+1 as ' + QuotedStr('Nro.') + ', subquery.* FROM ( ' +
      ' SELECT CONCAT(p.apellido, '+QuotedStr(',') +  ' , p.nombre) as ' + QuotedStr('Apellido y Nombre/s') +
      ', REPLACE(p.nro_docu, '+QuotedStr('.')+', '+QuotedStr('')+') '+QuotedStr('DNI')+ ', ' +
      ' prov.provincia as '+QuotedStr('Provincia') + ', ' +
      ' l.localidad Localidad, p.direccion ' + QuotedStr('Dirección (Calle, nro)') + ', ' +
      'p.email ' + QuotedStr('e-Correo') + ', ' +
      QuotedStr('-') + ' as ' + QuotedStr('N° Recibo') + ', ' +
      'CONCAT(' + QuotedStr(' ') +  ', p.telefono) '+QuotedStr('Teléfono') + ', p.telefono_acompaniante ' + QuotedStr('Teléfono Acompañante') + ', ' +
      'p.notas as ' + QuotedStr('SINIESTRO-Descripción-Seguimiento:') +

      ' from inscripcion_piloto_evento ipe ' +
      '   join piloto p on ipe.piloto_oid = p.oid ' +
      '   left join localidad l on p.localidad_oid = l.oid ' +
      '   left join provincias prov on prov.oid = l.provincia_oid ' +
      '   left join modelo_moto mm on p.modelo_moto_oid = mm.oid ' +
      '   join evento e on ipe.evento_oid = e.oid, categorias cat ' +
      '  where ipe.evento_oid = :evento_oid ' +
      '    and cat.oid = sel_categoria_oid_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, :evento_oid, ipe.piloto_oid) ' +
      ' order by ipe.oid, p.apellido, p.nombre, '+QuotedStr('Categoría') + ') subquery ';


      with ZExportarDatosInscriptosT do
      begin
        Close;
        SQL.Text:= consulta;
        ParamByName('evento_oid').AsInteger:= cmbEvento.KeyValue;
        Open;
      end;

      scExcelExport.Dataset:= ZExportarDatosInscriptosT;
      scExcelExport.WorksheetName := 'Detalle de Pilotos y Siniestros';

      scExcelExport.HeaderText.Text :=
        '           Fecha: ' + eventoVO.Nombre +
        '           Evento: ' + DateToStr(eventoVO.Fecha) +
        '           Lugar: ' + TBussinessDataSubsystemFacade.getInstance.getLocalidadProvinciaByLocalidadOID(eventoVO.LocalidadOID);

      scExcelExport.FontHeader.Style:= [fsBold];
      scExcelExport.FontHeader.Size:= 12;
      scExcelExport.FontHeader.Name:= 'Bookman Old Style';

      scExcelExport.FontHeader.Alignment:= haGeneral;
      scExcelExport.BorderHeader.BackColor:= clSkyBlue;
      scExcelExport.BeginRowHeader := 1;

      scExcelExport.StyleColumnWidth:= cwAutoFit;
      scExcelExport.FontTitles.Style:= [fsBold];
      scExcelExport.FontTitles.Name:= 'Calibri';
      scExcelExport.BorderTitles.BackColor:= clAqua;
      scExcelExport.BeginRowTitles := 2;

      scExcelExport.FontData.Name:= 'Calibri';

      scExcelExport.ExportDataset;

      scExcelExport.Disconnect;
    end
  else
      setTListItemsByString(errorListView, 'Debe seleccionar un Evento para generar el Excel de Inscriptos por Evento');
end;

procedure TInscripcionesCRUD.btnDesinscripcionMasivaClick(Sender: TObject);
begin
  if (TF_EE_Message.ShowMessage(TComponent(Self),'Confirmación de eliminación masiva de inscripción',
    '¿Está seguro que desea ELIMINAR una INSCRIPCIÓN?', TF_EE_Message.QUESTION, False) = mrOk) then
  begin
    if (cmbEvento.KeyValue > 0) then
      begin
        with ZDesinscripcionMasiva do
        begin
          Close;
          ParamByName('evento_oid').AsInteger:= cmbEvento.KeyValue;
          ExecSQL;
        end;

        with queryGrid do
          begin
            Close;
            ParamByName('evento_oid').AsInteger:= cmbEvento.KeyValue;
            Open;
          end;

        TF_EE_Message.ShowMessage(TComponent(Self),'ELIMINACIÓN de Inscripción exitosa',
          'Se ha eliminado la inscripción de manera exitosa.', TF_EE_Message.INFORMATION, True);
      end
    else
      setTListItemsByString(errorListView, 'Debe seleccionar un Evento para realizar la eliminación Masiva');
  end;
end;

procedure TInscripcionesCRUD.btnEditClick(Sender: TObject);
var
  pilotoOID, tipoCategoriaOID, eventoOID : Integer;

  i, SelectedCount, RecordIndex, CurrentRecNo: Integer;

  Pilotos: TStringList;
begin
  SelectedCount := cxGridDBTableView.DataController.GetSelectedCount;

  // Guardar posición actual
  CurrentRecNo := queryGrid.RecNo;
  pilotos := TStringList.Create;

  for i := 0 to SelectedCount - 1 do
  begin
    RecordIndex := cxGridDBTableView.DataController.GetSelectedRowIndex(i);

      // Ir al registro específico
      queryGrid.RecNo := RecordIndex + 1; // RecNo es base 1

      pilotos.Add(queryGrid.FieldByName('piloto_oid').AsString);

      tipoCategoriaOID:= queryGrid.FieldByName('tipo_categoria_oid').AsInteger;
      eventoOID:= queryGrid.FieldByName('evento_oid').AsInteger;
  end;

  queryGrid.RecNo := CurrentRecNo;

  generateReport(pilotos, tipoCategoriaOID, eventoOID);
end;

procedure TInscripcionesCRUD.generateReport(Pilotos: TStringList; tipoCategoriaOID, eventoOID: Integer);
begin
  with ZSelectedPilotData do
  begin
    Close;
    SQL.Text:= getPilotDataSQL(Pilotos);
    ParamByName('tipo_categoria_oid').AsInteger:= tipoCategoriaOID;
    ParamByName('evento_oid').AsInteger:= eventoOID;
    Open;
  end;

  try
    frxInscripcionReporte.PrepareReport(true);
    frxInscripcionReporte.PrintOptions.Copies:= 2;
    frxInscripcionReporte.Print;
  except
    on E : Exception do
      ShowMessage('Ha ocurrido un error al generar el reporte: : ' + E.Message);
  end;
end;

procedure TInscripcionesCRUD.btnNewClick(Sender: TObject);
var
  pilotoOID: Integer;
  piloto: TPiloto;
  nroDocumento, texoNroDocumento, numeroRepetido: String;
  pilotoVO, pilot2VO : TPiloto;

  pilotoCRUD : TPilotCRUD;
  pilotoEditor : TPilotEditor;
begin
  // Evitar reentrancia si el botón vuelve a hacer clic o se presiona una tecla repetida
  btnNew.Enabled := False;
  try
    nroDocumento:= TInscripcion(getEditorValueObject()).PilotoNroDocumento;
    texoNroDocumento:= txtNroDocumento.Text;
    pilotoOID:= TBussinessDataSubsystemFacade.getInstance.getPilotoOIDByTag(nroDocumento);
    piloto:= TBussinessDataSubsystemFacade.getInstance.getPiloto(pilotoOID);

    TInscripcion(getEditorValueObject()).PilotoOID:= pilotoOID;
    if Assigned(piloto) then
      begin
        TInscripcion(getEditorValueObject()).PilotoResponsabilidad:= piloto.Responsabilidad;
        TInscripcion(getEditorValueObject()).PilotoTag:= piloto.TagID;

        // El número de moto es único en el evento: el editor del piloto no deja guardar un número
        // que ya usa otro inscripto (también el del tipo en el que se está inscribiendo)
        piloto.EventoValidacionOID:= cmbEvento.KeyValue;
        piloto.TipoInscripcionOID:= cmbTipoCategoria.KeyValue;
        numeroRepetido:= NumeroRepetidoAlInscribir(piloto);

        if (not self.getEditorValueObject().isValidObject()) or (numeroRepetido <> '') then
          begin
            validationPanel.Visible:= True;
            if (not self.getEditorValueObject().isValidObject()) then
              setTListItemsByTStringList(errorListView,
                self.getEditorValueObject().getValidationResult)
            else
              setTListItemsByString(errorListView, numeroRepetido);

            if (pilotoOID > 0) then
              begin
                // En caso de error en el piloto o número repetido, enviar a editar
                try
                  pilotoCRUD:= TPilotCRUD.Create(nil);
                  pilotoEditor:= TPilotInnerEditor.Create(pilotoCRUD, piloto, False);

                  if (pilotoEditor.ShowModal = mrOk) then
                    begin
                      if (self.getEditorValueObject().isValidObject())
                        and (NumeroRepetidoAlInscribir(piloto) = '') then
                        inscribirPiloto(piloto)
                      else
                        txtNroDocumento.Text:= texoNroDocumento;
                    end;
                finally
                  pilotoEditor.Free;
                  pilotoCRUD.Free;
                  txtNroDocumento.SetFocus;
                end;
              end;
          end
        else
          begin
            inscribirPiloto(piloto);
          end;
      end
    else
      begin
        try
          texoNroDocumento:= txtNroDocumento.Text;
          pilotoCRUD:= TPilotCRUD.Create(nil);
          pilot2VO:= TPiloto.Create;
          pilot2VO.NroDocumento:= texoNroDocumento;
          pilotoEditor:= TPilotInnerEditor.Create(pilotoCRUD, pilot2VO, False);

          pilotoEditor.ShowModal;
          txtNroDocumento.Text:= pilot2VO.NroDocumento;

        finally
          pilotoEditor.Free;
          pilotoCRUD.Free;
          txtNroDocumento.SetFocus;
        end;

      end;
  finally
    btnNew.Enabled := True; // Volvemos a habilitar el botón al terminar
  end;
end;

procedure TInscripcionesCRUD.btnValoresClick(Sender: TObject);
begin
  if (cmbEvento.KeyValue > 0) then
    begin
      with ZExportarValores do
      begin
        Close;
        ParamByName('evento_oid').AsInteger:= cmbEvento.KeyValue;
        Open;
      end;

      scExcelExport.Dataset:= ZExportarValores;
      scExcelExport.WorksheetName := 'Valores';
      scExcelExport.ExportDataset;

      scExcelExport.Disconnect;
    end
  else
      setTListItemsByString(errorListView, 'Debe seleccionar un Evento para generar el Excel de Valores');
end;

procedure TInscripcionesCRUD.inscribirPiloto(piloto: TPiloto);
var
  pilotReport, texoNroDocumento: String;

  pilotoCRUD : TPilotCRUD;
  pilotoEditor : TPilotEditor;
  pilotosList : TStringList;

  eventoVO : TEvento;
  inscripcionEVO : TInscripcion;
begin
    eventoVO:= TBussinessDataSubsystemFacade.getInstance.getEvento(cmbEvento.KeyValue);

    validationPanel.Visible:= False;
    clearResultMessage();

    pilotReport:= '<font size="3">';
    pilotReport:= pilotReport + 'Nombre: <b>' + piloto.Nombre + '</b><br>';
    pilotReport:= pilotReport + 'Apellido: <b>' + piloto.Apellido + '</b><br>';
    pilotReport:= pilotReport + 'Nro. Doc.: <b>' + piloto.NroDocumento + '</b><br>';
    pilotReport:= pilotReport + 'Fecha Nac.: <b>' + DateToStr(piloto.FechaNacimiento) + '</b><br>';
    pilotReport:= pilotReport + 'Dirección: <b>' + piloto.Direccion + '</b><br>';
    pilotReport:= pilotReport + 'Celular: <b>' + piloto.Telefono + '</b><br>';
    pilotReport:= pilotReport + 'Fijo: <b>' + piloto.TelefonoFijo + '</b><br>';
    pilotReport:= pilotReport + 'Email: <b>' + piloto.Mail + '</b><br>';
    pilotReport:= pilotReport + 'Localidad: <b>' + piloto.Localidad + '</b><br>';
    pilotReport:= pilotReport + 'Tel. Acompañante: <b>' + piloto.TelefonoAcompaniante + '</b><br>';
    pilotReport:= pilotReport + 'Tag: <b>' + piloto.TagID + '</b><br><br>';

    pilotReport:= pilotReport + 'Nº Moto: <b>' + getNroMoto(cmbTipoCategoria.KeyValue, piloto) + '</b><br>';
    pilotReport:= pilotReport + 'Tipo Moto: <b>' + piloto.TipoMoto + '</b><br>';
    pilotReport:= pilotReport + 'Categoría: <b>' + getCategoria(cmbTipoCategoria.KeyValue, piloto) + '</b><br><br><br>';

    if (eventoVO.UltimaFecha) then
      with ZInscripcionesPorPiloto do
        begin
          Close;
          ParamByName('campeonato_oid').AsInteger:= eventoVO.CampeonatoOID;
          ParamByName('piloto_oid').AsInteger:= piloto.OID;
          Open;

          if (RecordCount > 0) then
            pilotReport:= pilotReport + '<b><font color="#ff0000">¡¡¡PILOTO CON ASISTENCIA PERFECTA!!!</font> </b><br>';

        end;
    pilotReport:= pilotReport + '</font>';

    if (TF_EE_Message.ShowMessage(TComponent(Self),'¡Confirmación de datos del piloto!',
      pilotReport, TF_EE_Message.QUESTION, False, True) = mrOk) then
      begin
        TBussinessDataSubsystemFacade.getInstance.addInscripcion(TInscripcion(persistentVO));

        if ((piloto.NumExterno > 0) and (TInscripcion(persistentVO).TipoCategoriaOID <> 4)) then
          begin
            inscripcionEVO:= TInscripcion.Create;
            inscripcionEVO.EventoOID:= TInscripcion(persistentVO).EventoOID;
            inscripcionEVO.PilotoOID:= TInscripcion(persistentVO).PilotoOID;
            inscripcionEVO.DiaInscripcionIndex:= TInscripcion(persistentVO).DiaInscripcionIndex;
            inscripcionEVO.TipoCategoriaOID:= 4;

            TBussinessDataSubsystemFacade.getInstance.addInscripcion(inscripcionEVO);
          end;

        requestSaveDone(persistentVO);

        if (chkImprimirReporte.Checked) then
        begin
          pilotosList := TStringList.Create;
          try
            pilotosList.Add(IntToStr(piloto.OID));
            generateReport(pilotosList, cmbTipoCategoria.KeyValue, cmbEvento.KeyValue);
          finally
            pilotosList.Free; // Evita fuga de memoria
          end;
        end;

        txtNroDocumento.Clear;
        txtNroDocumento.SetFocus;
      end
    else
      begin
        try
            pilotoCRUD:= TPilotCRUD.Create(nil);
            pilotoEditor:= TPilotInnerEditor.Create(pilotoCRUD, piloto, False);

            texoNroDocumento:= txtNroDocumento.Text;
            pilotoEditor.ShowModal;
        finally
           pilotoEditor.Free;
           pilotoCRUD.Free;
           txtNroDocumento.Text:= texoNroDocumento;
           txtNroDocumento.SetFocus;
        end;
    end;
end;


function TInscripcionesCRUD.getNroMoto(tipoCategoriaOID : Integer; pilotoVO : TPiloto) : String;
var
  nroMotoString : String;
begin
  if (tipoCategoriaOID = 1) then
    nroMotoString := IntToStr(pilotoVO.NumMoto)
  else if (tipoCategoriaOID = 2) then
    nroMotoString := IntToStr(pilotoVO.NumCuatriciclos)
  else if (tipoCategoriaOID = 3) then
    nroMotoString := IntToStr(pilotoVO.NumMotoCross);
  Result:= nroMotoString;
end;

function TInscripcionesCRUD.getCategoria(tipoCategoriaOID : Integer; pilotoVO : TPiloto) : String;
var
  categoria : String;
begin
  if (tipoCategoriaOID = 1) then
    categoria := pilotoVO.Categoria
  else if (tipoCategoriaOID = 2) then
    categoria := pilotoVO.CategoriaCuatriciclo
  else if (tipoCategoriaOID = 3) then
    categoria := pilotoVO.CategoriaMotoCross;
  Result:= categoria;
end;

procedure TInscripcionesCRUD.buttonPanelResize(Sender: TObject);
begin
  inherited;

  btnEdit.Left:= 7;
  btnExportarExcel.Left:= 117;
  btnInscriptos.Left:= 248;
  btnValores.Left:= 376;
end;

procedure TInscripcionesCRUD.cmbCampeonatoExit(Sender: TObject);
begin
  inherited;
  BindingsListEntity.Notify(Sender, 'KeyValue');
end;

procedure TInscripcionesCRUD.cmbCampeonatoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  BindingsListEntity.Notify(Sender, 'KeyValue');
end;

procedure TInscripcionesCRUD.cmbDiaInscripcionExit(Sender: TObject);
begin
  BindingsList.Notify(Sender, 'ItemIndex');
end;

procedure TInscripcionesCRUD.cmbDiaInscripcionKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  BindingsList.Notify(Sender, 'ItemIndex');
end;

procedure TInscripcionesCRUD.cmbFilterEventoExit(Sender: TObject);
begin
  inherited;
  BindingsList.Notify(Sender, 'KeyValue');
end;

procedure TInscripcionesCRUD.cmbFilterEventoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #8 then
    TDBLookupComboBox(Sender).KeyValue:= 0;
end;

procedure TInscripcionesCRUD.cmbFilterEventoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  BindingsList.Notify(Sender, 'KeyValue');
end;

constructor TInscripcionesCRUD.Create(owner: TComponent);
var
  pilotoVO : TPiloto;
begin
  // Antes del inherited: el inherited ya carga y pinta la grilla (pie y estilos usan esta lista)
  FRepetidos := TStringList.Create;
  FRepetidos.Sorted := True;
  FRepetidos.Duplicates := dupIgnore;

  inherited Create(owner);

  initializeTables;

  pilotoVO:= TPiloto.Create;
  abstractEdit:= TPilotEditor.Create(self, pilotoVO);

  // Resaltar inscriptos sin número (Nro. 0) para asignarlo a mano
  FEstiloSinNumero := TcxStyle.Create(Self);
  FEstiloSinNumero.Color := RGB(255, 199, 206);
  FEstiloSinNumero.TextColor := RGB(156, 0, 6);

  // Resaltar inscriptos con el mismo número que otro de su categoría en el evento
  FEstiloRepetido := TcxStyle.Create(Self);
  FEstiloRepetido.Color := RGB(255, 235, 156);
  FEstiloRepetido.TextColor := RGB(156, 87, 0);

  // Columna oculta con el piloto_oid de la fila (no hace falta tocar el .dfm)
  FColPilotoOID := cxGridDBTableView.CreateColumn;
  FColPilotoOID.DataBinding.FieldName := 'piloto_oid';
  FColPilotoOID.Visible := False;
  FColPilotoOID.VisibleForCustomization := False;

  cxGridDBTableView.Styles.OnGetContentStyle := cxGridDBTableViewGetContentStyleSinNumero;
end;

destructor TInscripcionesCRUD.Destroy;
begin
  FreeAndNil(FRepetidos);  // nil: si la grilla se repinta durante el inherited, el pie no la toca
  inherited;
end;

procedure TInscripcionesCRUD.cxGridDBTableViewTcxGridDBDataControllerTcxDataSummaryFooterSummaryItems0GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: string);
begin
  inherited;
  AText:= 'Cantidad de Inscriptos: ' + VarToStr(AValue);
  if ContarInscriptosSinNumero > 0 then
    AText:= AText + '   -   Sin número: ' + IntToStr(ContarInscriptosSinNumero);
  if Assigned(FRepetidos) and (FRepetidos.Count > 0) then
    AText:= AText + '   -   Nº repetido: ' + IntToStr(FRepetidos.Count);
end;

procedure TInscripcionesCRUD.initializeTables;
begin
  ZCampeonato.Active:= True;
  ZEvento.Active:= True;
  ZFilterPiloto.Active:= True;
  ZFilterEvento.Active:= True;
  ZCategoria.Active:= True;
  ZTipoCategoria.Active:= True;
  TCampeonatoFilter.Active:= True;
end;

procedure TInscripcionesCRUD.requestLoadInitialData(filterVO: TValueObject);
var
  inscripcionFilterVO: TInscripcionFilter;
begin
  inscripcionFilterVO:= TInscripcionFilter(filterVO);

  with queryGrid do
    begin
      Close;
      ParamByName('evento_oid').AsInteger:= inscripcionFilterVO.EventoOID;
      ParamByName('piloto_oid').AsInteger:= inscripcionFilterVO.PilotoOID;
      ParamByName('categoria_oid').AsInteger:= inscripcionFilterVO.CategoriaOID;
      Open;
    end;

  CargarNumerosRepetidos(inscripcionFilterVO.EventoOID);
end;

procedure TInscripcionesCRUD.InitializeBinding;
var
  expression: TBindExpression;
begin
  BindingHelper.setMessageKey(TComponent(cmbFilterEvento), 'KeyValue', TComponent(BindScope), 'EventoOID', BindingsList);
  BindingHelper.setMessageKey(TComponent(cmbFilterPiloto), 'KeyValue', TComponent(BindScope), 'PilotoOID', BindingsList);
  BindingHelper.setMessageKey(TComponent(cmbCategoria), 'KeyValue', TComponent(BindScope), 'CategoriaOID', BindingsList);

  // Create a Filter object.
  filterVO := TInscripcionFilter.Create;
  BindScope.DataObject := filterVO;

  BindingHelper.setMessageKey(TComponent(cmbCampeonato), 'KeyValue', TComponent(BindScopeEntity), 'CampeonatoOID', BindingsListEntity);
  BindingHelper.setMessageKey(TComponent(cmbEvento), 'KeyValue', TComponent(BindScopeEntity), 'EventoOID', BindingsListEntity);
  BindingHelper.setMessageKey(TComponent(txtNroDocumento), 'Text', TComponent(BindScopeEntity), 'PilotoNroDocumento', BindingsListEntity);
  BindingHelper.setMessageKey(TComponent(cmbDiaInscripcion), 'ItemIndex', TComponent(BindScopeEntity), 'DiaInscripcionIndex', BindingsListEntity);
  BindingHelper.setMessageKey(TComponent(cmbTipoCategoria), 'KeyValue', TComponent(BindScopeEntity), 'TipoCategoriaOID', BindingsListEntity);

  // Create a Persistent object.
  persistentVO := TInscripcion.Create;
  BindScopeEntity.DataObject := persistentVO;

  selectCombosByDate;
end;

function TInscripcionesCRUD.requestElement(OID: Integer): TPersistentObject;
var
  Inscripcion : TInscripcion;
  Piloto : TPiloto;
begin
  Inscripcion:= TBussinessDataSubsystemFacade.getInstance.getInscripcion(OID);
  Piloto:= TBussinessDataSubsystemFacade.getInstance.getPiloto(Inscripcion.PilotoOID);
  // Al guardar desde la grilla se valida que el número no se repita en la categoría del evento
  Piloto.EventoValidacionOID:= Inscripcion.EventoOID;
  Result:= Piloto;
end;

procedure TInscripcionesCRUD.requestDelete(OID: Integer);
begin
  TBussinessDataSubsystemFacade.getInstance.deleteInscripcion(OID);
end;

procedure TInscripcionesCRUD.doRequestSave(persistentVO: TPersistentObject);
begin
   TBussinessDataSubsystemFacade.getInstance.savePiloto(TPiloto(persistentVO));
end;

procedure TInscripcionesCRUD.FrameEnter(Sender: TObject);
begin
  inherited;
  txtNroDocumento.SetFocus;
end;

procedure TInscripcionesCRUD.FrameMouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
    if (cmbCampeonato.Focused) then
        cmbCampeonato.Perform(WM_KEYDOWN, VK_DOWN, 0);
    if (cmbFilterCampeonato.Focused) then
        cmbFilterCampeonato.Perform(WM_KEYDOWN, VK_DOWN, 0);
    if (cmbEvento.Focused) then
        cmbEvento.Perform(WM_KEYDOWN, VK_DOWN, 0);
    if (cmbFilterEvento.Focused) then
        cmbFilterEvento.Perform(WM_KEYDOWN, VK_DOWN, 0);
    if (cmbTipoCategoria.Focused) then
        cmbTipoCategoria.Perform(WM_KEYDOWN, VK_DOWN, 0);
    if (cmbFilterPiloto.Focused) then
        cmbFilterPiloto.Perform(WM_KEYDOWN, VK_DOWN, 0);
    if (cmbCategoria.Focused) then
        cmbCategoria.Perform(WM_KEYDOWN, VK_DOWN, 0);
end;

procedure TInscripcionesCRUD.FrameMouseWheelUp(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
    if (cmbCampeonato.Focused) then
        cmbCampeonato.Perform(WM_KEYDOWN, VK_UP, 0);
    if (cmbFilterCampeonato.Focused) then
        cmbFilterCampeonato.Perform(WM_KEYDOWN, VK_UP, 0);
    if (cmbEvento.Focused) then
        cmbEvento.Perform(WM_KEYDOWN, VK_UP, 0);
    if (cmbFilterEvento.Focused) then
        cmbFilterEvento.Perform(WM_KEYDOWN, VK_UP, 0);
    if (cmbTipoCategoria.Focused) then
        cmbTipoCategoria.Perform(WM_KEYDOWN, VK_UP, 0);
    if (cmbFilterPiloto.Focused) then
        cmbFilterPiloto.Perform(WM_KEYDOWN, VK_UP, 0);
    if (cmbCategoria.Focused) then
        cmbCategoria.Perform(WM_KEYDOWN, VK_UP, 0);
end;

function TInscripcionesCRUD.getEditorValueObject(): TPersistentObject;
begin
  result:= self.persistentVO;
end;

procedure TInscripcionesCRUD.setTListItemsByString(errorListView : TcxListView; stringMessage: String);
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
end;

procedure TInscripcionesCRUD.selectCombosByDate;
begin
  with ConnectionModule.GetEventoByDate do
    begin
      Close;
      Open;

      if (RecordCount > 0) then
        begin
          cmbCampeonato.KeyValue:= FieldByName('campeonato_oid').AsInteger;
          cmbEvento.KeyValue:= FieldByName('evento_oid').AsInteger;

          cmbFilterCampeonato.KeyValue:= FieldByName('campeonato_oid').AsInteger;
          cmbFilterEvento
          .KeyValue:= FieldByName('evento_oid').AsInteger;
        end;
    end;
end;


function TInscripcionesCRUD.getPilotDataSQL(Pilotos: TStringList): String;
var
  sqlString, InClause: String;
  eventoVO : TEvento;
  i : Integer;
begin

  InClause := '';
  for i := 0 to Pilotos.Count - 1 do
  begin
    if i > 0 then
      InClause := InClause + ', ';
    InClause := InClause + QuotedStr(Pilotos[i]);
  end;

 sqlString := ' select p.*, ' +
  ' CONCAT(sel_nro_moto_by_evento_and_tipo_categoria(:tipo_categoria_oid, :evento_oid, p.oid)+'''', '' - '', p.apellido, '', '' , p.nombre) as piloto, ' +
  ' CASE WHEN c.utiliza_acompaniante = 1 THEN CONCAT(UC_Words(CONCAT(sel_nro_moto_by_evento_and_tipo_categoria(:tipo_categoria_oid, :evento_oid, '+
  'p.oid)+'''', '' - '', p.apellido, '', '' , p.nombre)), IFNULL(UC_Words(CONCAT('' / '', n.apellido, '', '' , n.nombre)), '''')) ' +
  ' ELSE UC_Words(CONCAT(sel_nro_moto_by_evento_and_tipo_categoria(:tipo_categoria_oid, :evento_oid, p.oid)+'''', '' - '', p.apellido, '', '' , p.nombre)) end as nombre_piloto, ' +
  ' c.nombre nombre_categoria, mm.nombre as modelo_moto, ' +
  ' l.localidad as nombre_localidad, prov.provincia as nombre_provincia, ' +
  ' DAYOFMONTH(CURDATE()) dia, MONTH(CURDATE()) mes,YEAR(CURDATE()) anio, ' +
  ' c.valor_seguro, CONCAT(c.valor_seguro_texto, ''.-'') AS valor_seguro_texto ' +
  ' from piloto p ' +
  ' LEFT join categorias c on c.oid = sel_categoria_oid_by_evento_and_tipo_categoria(:tipo_categoria_oid, :evento_oid, p.oid) ' +
  ' LEFT join modelo_moto mm on p.modelo_moto_oid = mm.oid ' +
  ' LEFT JOIN localidad l on p.localidad_oid = l.oid ' +
  ' LEFT JOIN provincias prov on l.provincia_oid = prov.oid ' +
  ' left join navegante n on n.piloto_oid = p.oid ' +
  ' where p.oid IN (' + InClause + ')';

  Result:= sqlString;
end;

function TInscripcionesCRUD.TieneNumeroCero(const NroMoto: string): Boolean;
var
  Partes: TStringList;
  i: Integer;
begin
  // nro_moto viene como '12', '0' o '12 / 0' (un valor por tipo de categoría)
  Result := False;
  Partes := TStringList.Create;
  try
    Partes.Delimiter := '/';
    Partes.StrictDelimiter := True;
    Partes.DelimitedText := NroMoto;
    for i := 0 to Partes.Count - 1 do
      if (Trim(Partes[i]) = '') or (Trim(Partes[i]) = '0') then
        Result := True;
  finally
    Partes.Free;
  end;
end;

function TInscripcionesCRUD.ContarInscriptosSinNumero: Integer;
var
  i: Integer;
begin
  Result := 0;
  with cxGridDBTableView.DataController do
    for i := 0 to RecordCount - 1 do
      if TieneNumeroCero(VarToStr(Values[i, cxGridDBTableViewNroMoto.Index])) then
        Inc(Result);
end;

procedure TInscripcionesCRUD.cxGridDBTableViewGetContentStyleSinNumero(Sender: TcxCustomGridTableView;
  ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  AStyle := nil;
  if not Assigned(ARecord) then
    Exit;
  if TieneNumeroCero(VarToStr(ARecord.Values[cxGridDBTableViewNroMoto.Index])) then
    AStyle := FEstiloSinNumero   // rojo: sin número (gana sobre el repetido)
  else if EsNumeroRepetido(ARecord) then
    AStyle := FEstiloRepetido;   // naranja: número que usa otro inscripto del evento
end;

procedure TInscripcionesCRUD.CargarNumerosRepetidos(EventoOID: Integer);
const
  SQL_INSCRIPTOS =
    'select ipe.piloto_oid, ' +
    '  sel_nro_moto_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, ipe.evento_oid, ipe.piloto_oid) as nro ' +
    'from inscripcion_piloto_evento ipe ' +
    'where ipe.evento_oid = :evento_oid ' +
    '  and ipe.tipo_categoria_oid in (' + TIPOS_NUMERO_UNICO + ')';
var
  Q: TZReadOnlyQuery;
  Conteo, Vistos: TStringList;
  Nro, Clave: String;
begin
  if not Assigned(FRepetidos) then
    Exit;
  FRepetidos.Clear;
  // Sin evento elegido la grilla mezcla eventos: no se marca nada
  if EventoOID <= 0 then
    Exit;

  Q := TZReadOnlyQuery.Create(nil);
  Conteo := TStringList.Create;
  Vistos := TStringList.Create;
  try
    Vistos.Sorted := True;
    Vistos.Duplicates := dupIgnore;

    Q.Connection := queryGrid.Connection;
    Q.SQL.Text := SQL_INSCRIPTOS;
    Q.ParamByName('evento_oid').AsInteger := EventoOID;
    Q.Open;

    // 1ra pasada: cuántos pilotos distintos usan cada número (el 0 no cuenta).
    // El mismo piloto con el mismo número en dos tipos cuenta una sola vez.
    while not Q.Eof do
    begin
      Nro := Trim(Q.FieldByName('nro').AsString);
      if (Nro <> '') and (Nro <> '0') then
      begin
        Clave := Nro + '|' + Q.FieldByName('piloto_oid').AsString;
        if Vistos.IndexOf(Clave) < 0 then
        begin
          Vistos.Add(Clave);
          Conteo.Values[Nro] := IntToStr(StrToIntDef(Conteo.Values[Nro], 0) + 1);
        end;
      end;
      Q.Next;
    end;

    // 2da pasada: los pilotos con un número que usa más de un piloto
    Q.First;
    while not Q.Eof do
    begin
      Nro := Trim(Q.FieldByName('nro').AsString);
      if (Nro <> '') and (Nro <> '0') and (StrToIntDef(Conteo.Values[Nro], 0) > 1) then
        FRepetidos.Add(Q.FieldByName('piloto_oid').AsString);
      Q.Next;
    end;

    if FRepetidos.Count > 0 then
      TLog.Aviso('Inscripcion', Format('Evento %d: %d inscriptos con número de moto repetido en el evento',
        [EventoOID, FRepetidos.Count]));
  finally
    Vistos.Free;
    Conteo.Free;
    Q.Free;
  end;
end;

function TInscripcionesCRUD.EsNumeroRepetido(ARecord: TcxCustomGridRecord): Boolean;
begin
  Result := Assigned(FRepetidos) and Assigned(FColPilotoOID) and (FRepetidos.Count > 0) and
    (FRepetidos.IndexOf(VarToStr(ARecord.Values[FColPilotoOID.Index])) >= 0);
end;

// Mensaje de error si el número con el que se inscribe el piloto ya lo usa otro inscripto
// del evento ('' si está libre). El piloto todavía no está inscripto: se controla igual.
function TInscripcionesCRUD.NumeroRepetidoAlInscribir(piloto: TPiloto): String;
var
  tipoCategoriaOID, nroMoto: Integer;
  otroPiloto: String;
begin
  Result:= '';
  tipoCategoriaOID:= cmbTipoCategoria.KeyValue;
  nroMoto:= StrToIntDef(getNroMoto(tipoCategoriaOID, piloto), 0);

  otroPiloto:= TValidationHelper.getPilotoConNumeroEnEvento(cmbEvento.KeyValue, tipoCategoriaOID,
    nroMoto, piloto.OID, False);
  if (otroPiloto <> '') then
    Result:= 'Nº Moto - El ' + IntToStr(nroMoto) + ' ya lo tiene ' + otroPiloto +
      ' en este evento. Asigne otro número antes de inscribir.';
end;

end.
