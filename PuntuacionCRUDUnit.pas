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
  private
    procedure generateEventoCategoriaTable;
    procedure inicializarTablas;

    function getPuntosByPuesto(Puesto: Integer): Integer;
    function getPuntosExtraByPuesto(Puesto: Integer): Integer;

    procedure setTListItemsByString(errorListView : TcxListView; stringMessage: String);

    function buildSqlString(EventoOID: Integer): String;
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
var
  openDialog : TOpenDialog;
  posicion, nro_moto, categoria : String;
  categoriaOID, puntos, puntosExtra, pilotoOID: Integer;
  categoriaObj : TCategoria;
  eventoVO : TEvento;

  i: Integer;
  si: String;
  Hoja: _WorkSheet;
begin
  if ((cmbEvento.KeyValue > 0)  and (cmbCategoria.KeyValue > 0)) then
    begin
      // Create the open dialog object - assign to our open dialog variable
      openDialog := TOpenDialog.Create(self);

      // Set up the starting directory to be the current one
      openDialog.InitialDir := GetCurrentDir;

      // Only allow existing files to be selected
      openDialog.Options := [ofFileMustExist];

      // Allow only .dpr and .pas files to be selected
      openDialog.Filter :=
        'Excel File|*.xls|Excel File|*.xlsx';

      // Display the open file dialog
      if openDialog.Execute then
        begin
          Excel.Workbooks.Open(openDialog.FileName,
            EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
            EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
            EmptyParam, EmptyParam, EmptyParam, EmptyParam, 0 );
        end;

        Hoja := Excel.Worksheets.Item[1] as _WorkSheet;

        TBussinessDataSubsystemFacade
            .getInstance.deletePuntuacionByEventoOIDAndCategoriaOID(cmbEvento.KeyValue, cmbCategoria.KeyValue);

        categoria:= Hoja.Range['A1','A1'].Value2;
        categoriaOID:= TBussinessDataSubsystemFacade
          .getInstance.getCategoriaByName(categoria);
        i := 3;
        si := IntToStr(i);
        repeat
          posicion:= Hoja.Range['A'+si,'A'+si].Value2;
          nro_moto:= Hoja.Range['B'+si,'B'+si].Value2;

          puntos:= TBussinessDataSubsystemFacade
            .getInstance.selPuntoByPuesto(posicion);

          // Establecemos el punto EXTRA solo si la categorìa usa los mismos
          puntosExtra:= 0;

          eventoVO:= TBussinessDataSubsystemFacade.getInstance.getEvento(cmbEvento.KeyValue);
          if (eventoVO.UsaPuntosExtra) then
            puntosExtra:= getPuntosExtraByPuesto(StrToInt(posicion));

          categoriaObj := TBussinessDataSubsystemFacade
            .getInstance.getCategoria(categoriaOID);

          pilotoOID:= TBussinessDataSubsystemFacade.getInstance.
            getPilotoOIDByNumMotoAndTipoCategoria(
              StrToInt(nro_moto), categoriaObj.TipoCategoriaOID, cmbEvento.KeyValue);

          TBussinessDataSubsystemFacade.getInstance
            .addPuntuacion(cmbEvento.KeyValue, pilotoOID, categoriaOID, (puntos + puntosExtra), StrToInt(posicion));
          Inc( i );
          si := IntToStr( i );
        until ( VarType( Excel.Range['A'+si,'A'+si].Value2 ) = VarEmpty );

        TF_EE_Message.ShowMessage(TComponent(Self), 'Mensaje de Imporación Exitosa',
          'La Imporación de Puntos para el Evento: <b>' + cmbEvento.Text + '</b>, Categoría: <b>' + cmbCategoria.Text + '</b> fue exitosa. ', TF_EE_Message.QUESTION, True);
    end
  else
  TF_EE_Message.ShowMessage(TComponent(Self),'¡Seleccione el Evento!',
    'Debe seleccionar el Evento y la Categoría', TF_EE_Message.INFORMATION, True);

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

function TPuntuacionCRUD.buildSqlString(EventoOID: Integer): String;
var
  stringSQLPrefix, stringSQLSufix, sqlDinamic, sql : String;
  i : Integer;
begin
    stringSQLPrefix:=  ' SELECT @posicion:=@posicion+1 AS Pos, subquery.* FROM (' +
    ' select distinct sel_nro_moto_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, eve.oid, p.oid) as '+QuotedStr('Num.')+', ' +
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
        ' AND eve.campeonato_oid = :campeonato_oid '+
        ' AND sel_nombre_categoria_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, eve.oid, p.oid) = :nombre_categoria ';

  sqlDinamic:= '';

    with ZEventos do
    begin
      Close;
      ParamByName('evento_oid').AsInteger:= eventoOID;
      SortedFields:= 'nro_fecha desc';
      Open;

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
