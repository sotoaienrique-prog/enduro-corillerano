
unit a;

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
  PilotEditorInnerUnit, tmsAdvGridExcel, DataModule, cxCheckBox;

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
    frxInscripcionReporte: TfrxReport;
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
  private
    procedure initializeTables;
    procedure generateReport(pilotoOID, tipoCategoriaOID, eventoOID: Integer);
    procedure setTListItemsByString(errorListView : TcxListView; stringMessage: String);
    function getNroMoto(tipoCategoriaOID : Integer; pilotoVO : TPiloto) : String;
    function getCategoria(tipoCategoriaOID : Integer; pilotoVO : TPiloto) : String;
    procedure selectCombosByDate;
  protected
    persistentVO: TPersistentObject;

    procedure InitializeBinding; Override;
    procedure requestLoadInitialData(filterVO: TValueObject); Override;
    procedure doRequestSave(persistentVO: TPersistentObject); Override;
    function requestElement(OID: Integer): TPersistentObject; Override;
    procedure requestDelete(OID: Integer); Override;
  public
    constructor Create(owner: TComponent); Override;
    function getEditorValueObject(): TPersistentObject;
    procedure setTListItemsByTStringList(errorListView : TcxListView; stringList : TStringList);
    procedure RefreshCRUDData;
    procedure inscribirPiloto(piloto: TPiloto);
  end;

implementation

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

procedure TInscripcionesCRUD.scExcelExportGetCellStyleEvent(Sender: TObject;
  Field: TField; var ColorBackground: TColor; FontCell: TxlFont);
begin
  if Field.FieldName = 'Nro.' then
    begin
      ColorBackground:= clAqua;
      FontCell.Style:= [fsBold];
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

procedure TInscripcionesCRUD.btnEditClick(Sender: TObject);
var
  pilotoOID, tipoCategoriaOID, eventoOID : Integer;
begin
  pilotoOID:= queryGrid.FieldByName('piloto_oid').AsInteger;
  tipoCategoriaOID:= queryGrid.FieldByName('tipo_categoria_oid').AsInteger;
  eventoOID:= queryGrid.FieldByName('evento_oid').AsInteger;
  generateReport(pilotoOID, tipoCategoriaOID, eventoOID);
end;

procedure TInscripcionesCRUD.generateReport(pilotoOID, tipoCategoriaOID, eventoOID: Integer);
begin
  with ZSelectedPilotData do
  begin
    Close;
    ParamByName('oid').AsInteger:= pilotoOID;
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
  nroDocumento, texoNroDocumento: String;
  pilotoVO, pilot2VO : TPiloto;

  pilotoCRUD : TPilotCRUD;
  pilotoEditor : TPilotEditor;
begin
  nroDocumento:= TInscripcion(getEditorValueObject()).PilotoNroDocumento;
  texoNroDocumento:= txtNroDocumento.Text;
  pilotoOID:= TBussinessDataSubsystemFacade.getInstance.getPilotoOIDByTag(nroDocumento);
  piloto:= TBussinessDataSubsystemFacade.getInstance.getPiloto(pilotoOID);

  TInscripcion(getEditorValueObject()).PilotoOID:= pilotoOID;
  if Assigned(piloto) then
    begin
      TInscripcion(getEditorValueObject()).PilotoResponsabilidad:= piloto.Responsabilidad;
      TInscripcion(getEditorValueObject()).PilotoTag:= piloto.TagID;

      if (not self.getEditorValueObject().isValidObject()) then
        begin
          validationPanel.Visible:= True;
          setTListItemsByTStringList(errorListView,
            self.getEditorValueObject().getValidationResult);

            if (pilotoOID > 0) then
            begin
              // En casi de error en el piloto, enviar a editar
              try
                  pilotoCRUD:= TPilotCRUD.Create(nil);
                  pilotoEditor:= TPilotInnerEditor.Create(pilotoCRUD, piloto, False);

                  if (pilotoEditor.ShowModal = mrOk) then
                    begin
                      if (self.getEditorValueObject().isValidObject()) then
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

  eventoVO : TEvento;
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

              requestSaveDone(persistentVO);

              if (chkImprimirReporte.Checked) then
                generateReport(piloto.OID, cmbTipoCategoria.KeyValue, cmbEvento.KeyValue);

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
begin
  inherited Create(owner);

  initializeTables;
end;

procedure TInscripcionesCRUD.cxGridDBTableViewTcxGridDBDataControllerTcxDataSummaryFooterSummaryItems0GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: string);
begin
  inherited;
  AText:= 'Cantidad de Inscriptos: ' + VarToStr(AValue);
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
begin
//  Result:= TBussinessDataSubsystemFacade.getInstance.getEvento(OID);
end;

procedure TInscripcionesCRUD.requestDelete(OID: Integer);
begin
  TBussinessDataSubsystemFacade.getInstance.deleteInscripcion(OID);
end;

procedure TInscripcionesCRUD.doRequestSave(persistentVO: TPersistentObject);
begin
//   TBussinessDataSubsystemFacade.getInstance.saveEvento(TEvento(persistentVO));
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
    if (cmbEvento.Focused) then
        cmbEvento.Perform(WM_KEYDOWN, VK_DOWN, 0);
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
    if (cmbEvento.Focused) then
        cmbEvento.Perform(WM_KEYDOWN, VK_UP, 0);
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

end.
