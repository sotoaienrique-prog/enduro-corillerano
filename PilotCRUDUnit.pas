unit PilotCRUDUnit;

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
  Entidades, PilotEditorUnit, BindingHelperUnit, cxTextEdit,
  BussinessDataSubsystemFacade, cxMaskEdit, cxCurrencyEdit, Vcl.ComCtrls,
  cxListView, Vcl.DBCtrls, ZAbstractDataset, ZAbstractTable, JvExExtCtrls,
  JvNetscapeSplitter, Vcl.ActnList, cxLocalization, Vcl.ToolWin, scExcelExport,
  Vcl.OleServer, Excel2010, F_EEMessage;

type
  TPilotCRUD = class(TAbstractCRUDFrame)
    lblNombre: TcxLabel;
    txtNombre: TcxTextEdit;
    lblApellido: TcxLabel;
    txtApellido: TcxTextEdit;
    cxGridDBTableViewnombre: TcxGridDBColumn;
    cxGridDBTableViewapellido: TcxGridDBColumn;
    cxGridDBTableViewnro_docu: TcxGridDBColumn;
    cxGridDBTableViewfecha_nacimiento: TcxGridDBColumn;
    cxGridDBTableViewdireccion: TcxGridDBColumn;
    cxGridDBTableViewtelefono: TcxGridDBColumn;
    cxGridDBTableViewemail: TcxGridDBColumn;
    lblNroDoc: TcxLabel;
    lblNumMoto: TcxLabel;
    txtNumMoto: TcxCurrencyEdit;
    cxGridDBTableViewNumMoto: TcxGridDBColumn;
    cxGridDBTableViewProvincia: TcxGridDBColumn;
    cxGridDBTableViewLocalidad: TcxGridDBColumn;
    ZCategoria: TZTable;
    DSCategoria: TDataSource;
    cxLabel2: TcxLabel;
    cmbCategoria: TDBLookupComboBox;
    cxGridDBTableViewCategoria: TcxGridDBColumn;
    txtNroDoc: TcxCurrencyEdit;
    btnExpPilotos: TAeroButton;
    ZExportarPilotos: TZReadOnlyQuery;
    ZCategoriaoid: TIntegerField;
    ZCategorianombre: TWideStringField;
    ZCategoriatipo_categoria_oid: TSmallintField;
    cxGridDBTableViewColumn1: TcxGridDBColumn;
    cxGridDBTableViewColumn2: TcxGridDBColumn;
    lblTID: TcxLabel;
    txtTID: TcxTextEdit;
    btnImportPilotos: TAeroButton;
    btnNumerosRepetidos: TAeroButton;
    ZExportarNrosRepetidos: TZQuery;
    ZExportarTags: TZQuery;
    btnTags: TAeroButton;
    btnExpMails: TAeroButton;
    ZExportarMail: TZReadOnlyQuery;
    cxGridDBTableViewColumn3: TcxGridDBColumn;
    Excel: TExcelApplication;
    scExcelExport: TscExcelExport;
    procedure textBindKeyPress(Sender: TObject; var Key: Char);
    procedure textKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure txtNroDocPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure txtNumMotoFocusChanged(Sender: TObject);
    procedure cmbCategoriaExit(Sender: TObject);
    procedure cmbCategoriaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cmbCategoriaKeyPress(Sender: TObject; var Key: Char);
    procedure txtNombreKeyPress(Sender: TObject; var Key: Char);
    procedure cxGridDBTableViewTcxGridDBDataControllerTcxDataSummaryFooterSummaryItems0GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
      var AText: string);
    procedure btnExpPilotosClick(Sender: TObject);
    procedure buttonPanelResize(Sender: TObject);
    procedure btnImportPilotosClick(Sender: TObject);
    procedure btnNumerosRepetidosClick(Sender: TObject);
    procedure btnTagsClick(Sender: TObject);
    procedure btnExpMailsClick(Sender: TObject);
  private
    function GetAge(const BirthDate, CurrentDate: TDateTime): Integer;
  protected
    procedure InitializeBinding; Override;
    procedure requestLoadInitialData(filterVO: TValueObject); Override;
    procedure doRequestSave(persistentVO: TPersistentObject); Override;
    function requestElement(OID: Integer): TPersistentObject; Override;
    procedure requestDelete(OID: Integer); Override;
    procedure RefreshCRUDData; Override;
  public
    constructor Create(owner: TComponent); Override;
  end;

implementation

{$R *.dfm}

procedure TPilotCRUD.textKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  BindingsList.Notify(Sender, 'Text');
end;

procedure TPilotCRUD.txtNombreKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnFilterClick(Sender);
end;

procedure TPilotCRUD.txtNroDocPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  ErrorText:= 'Ha ingresado un Número de Documento inválido';
end;

procedure TPilotCRUD.txtNumMotoFocusChanged(Sender: TObject);
begin
  inherited;
  BindingsList.Notify(Sender, 'Text');
end;

procedure TPilotCRUD.btnExpMailsClick(Sender: TObject);
begin
  with ZExportarMail do
    begin
      Close;
      Open;
    end;

  scExcelExport.Dataset:= ZExportarMail;
  scExcelExport.WorksheetName := 'Lista de Mails';
  scExcelExport.ExportDataset;

  scExcelExport.Disconnect;
end;

procedure TPilotCRUD.btnExpPilotosClick(Sender: TObject);
begin
  with ZExportarPilotos do
    begin
      Close;
      Open;
    end;

  scExcelExport.Dataset:= ZExportarPilotos;
  scExcelExport.WorksheetName := 'Pilotos';
  scExcelExport.ExportDataset;

  scExcelExport.Disconnect;
end;

procedure TPilotCRUD.btnImportPilotosClick(Sender: TObject);
var
  openDialog : TOpenDialog;
  Piloto : TPiloto;
  nroDocumento, categoria, genero, distancia, edadStr : String;

  i, edad: Integer;
  si: String;
  Hoja: _WorkSheet;
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

    i := 2;
    si := IntToStr(i);
    repeat
      Piloto:= TPiloto.Create;

      Piloto.ValidacionNumericaCategoria:= False;

      Piloto.Nombre:= Trim(Hoja.Range['A'+si,'A'+si].Value2);
      Piloto.Apellido:= Trim(Hoja.Range['B'+si,'B'+si].Value2);
      nroDocumento:= StringReplace(Hoja.Range['C'+si,'C'+si].Value2, '.', '', [rfReplaceAll, rfIgnoreCase]);
      nroDocumento:= StringReplace(nroDocumento, ' ', '', [rfReplaceAll, rfIgnoreCase]);
      Piloto.NroDocumento:= FormatFloat('###,###,##0', strToFloat(nroDocumento));
      Piloto.FechaNacimiento:= StrToDateTime(Hoja.Range['Q'+si,'Q'+si].Value2);
      Piloto.Mail:= Hoja.Range['H'+si,'H'+si].Value2;
      Piloto.Telefono:= Hoja.Range['I'+si,'I'+si].Value2;
      Piloto.Direccion:= Hoja.Range['E'+si,'E'+si].Value2;

      Piloto.MotoOID:= TBussinessDataSubsystemFacade.getInstance
        .getModeloMotoByNombre(Hoja.Range['G'+si,'G'+si].Value2);

      // Comento ya que es el calculo de categoría para EPUMAHUIDA
      {distancia:= Hoja.Range['T'+si,'T'+si].Value2;
      genero:= Hoja.Range['U'+si,'U'+si].Value2;
      edad:= GetAge(Piloto.FechaNacimiento, Now);

      if ((edad > 16) and (edad < 30)) then
        edadStr:= '17-29'
      else if ((edad >= 30) and (edad < 40)) then
        edadStr:= '30-39'
      else if ((edad >= 40) and (edad < 50)) then
        edadStr:= '40-49'
      else if ((edad >= 50) and (edad < 60)) then
        edadStr:= '50-59'
      else if (edad >= 60) then
        edadStr:= '+60';

      categoria:= genero + ' ' + distancia + ' ' + edadStr;}

      categoria:= Hoja.Range['F'+si,'F'+si].Value2;
      Piloto.CategoriaOID:= TBussinessDataSubsystemFacade
        .getInstance.getCategoriaByName(categoria);

      Piloto.NumMoto:= Hoja.Range['O'+si,'O'+si].Value2;
      //Piloto.NumMotoCross:= Hoja.Range['O'+si,'O'+si].Value2;
      Piloto.NumExterno:= Hoja.Range['P'+si,'P'+si].Value2;

      Piloto.LocalidadOID:= TBussinessDataSubsystemFacade.getInstance
        .getLocalidadOID(Hoja.Range['K'+si,'K'+si].Value2, Hoja.Range['J'+si,'J'+si].Value2);

      Piloto.TagID:= Hoja.Range['R'+si,'R'+si].Value2;

      if (Piloto.isValidObject) then
        TBussinessDataSubsystemFacade.getInstance.addPiloto(Piloto)
      else
        TF_EE_Message.ShowMessage(TComponent(Self),'¡Piloto con datos insuficientes!',
            'Se debe completar los datos de la persona <b>'+ Piloto.Apellido + ', ' + Piloto.Nombre +
            '</b> <br> Mensaje: ' + Piloto.getValidationResult().CommaText, TF_EE_Message.WARNING, False);
      Inc( i );
      si := IntToStr( i );
    until ( VarType( Excel.Range['A'+si,'A'+si].Value2 ) = VarEmpty );
end;

function TPilotCRUD.GetAge(const BirthDate, CurrentDate: TDateTime): Integer;
var
    y1, m1, d1: Word; //born
    y2, m2, d2: Word; //today
begin
    Result := 0;

    if CurrentDate < BirthDate then
        Exit;

    DecodeDate(BirthDate, y1, m1, d1);
    DecodeDate(CurrentDate, y2, m2, d2);

    //Fudge someone born on the leap-day to Feb 28th of the same year
    //strictly for the purposes of this calculation
    if ( (m1=2) and (d1=29) )
            and
        ( not IsLeapYear(y2) ) then
    begin
        d1 := 28;
    end;

    Result := y2-y1; //rough count of years
    //Take away a year of the month/day is before their birth month/day
    if (m2 < m1) or
            ((m2=m1) and (d2<d1)) then
        Dec(Result);
end;

procedure TPilotCRUD.btnNumerosRepetidosClick(Sender: TObject);
begin
      with ZExportarNrosRepetidos do
      begin
        Close;
        Open;
      end;

      scExcelExport.Dataset:= ZExportarNrosRepetidos;
      scExcelExport.WorksheetName := 'Numeración';
      scExcelExport.ExportDataset;

      scExcelExport.Disconnect;
end;

procedure TPilotCRUD.btnTagsClick(Sender: TObject);
begin
    with ZExportarTags do
    begin
      Close;
      Open;
    end;

    scExcelExport.Dataset:= ZExportarTags;
    scExcelExport.WorksheetName := 'Tags';
    scExcelExport.ExportDataset;

    scExcelExport.Disconnect;
end;

procedure TPilotCRUD.buttonPanelResize(Sender: TObject);
begin
  inherited;
  btnExpPilotos.Left:= 6;
end;

procedure TPilotCRUD.cmbCategoriaExit(Sender: TObject);
begin
  inherited;
  BindingsList.Notify(Sender, 'KeyValue');
end;

procedure TPilotCRUD.cmbCategoriaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #8 then
    TDBLookupComboBox(Sender).KeyValue:= 0;
end;

procedure TPilotCRUD.cmbCategoriaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  BindingsList.Notify(Sender, 'KeyValue');
end;

constructor TPilotCRUD.Create(owner: TComponent);
var
  pilotoVO : TPiloto;
begin
  inherited Create(owner);

  pilotoVO:= TPiloto.Create;

  abstractEdit:= TPilotEditor.Create(self, pilotoVO);
end;

procedure TPilotCRUD.cxGridDBTableViewTcxGridDBDataControllerTcxDataSummaryFooterSummaryItems0GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: string);
begin
  AText:= '# Pilotos: ' + VarToStr(AValue);
end;

procedure TPilotCRUD.RefreshCRUDData;
begin
  inherited;

  ZCategoria.Close;
  ZCategoria.Open;
end;

procedure TPilotCRUD.requestLoadInitialData(filterVO: TValueObject);
var
  pilotoFilterVO: TPilotoFilter;
  nroDocu: String;
  tipoCategoriaOID : Integer;
begin
  pilotoFilterVO:= TPilotoFilter(filterVO);

  nroDocu:= pilotoFilterVO.NroDocumento;
  if (pilotoFilterVO.NroDocumento > '') then
    begin
      Insert('.', nroDocu, 3);
      Insert('.', nroDocu, 7);
    end;

  tipoCategoriaOID:= ZCategoria.FieldByName('tipo_categoria_oid').AsInteger;

  queryGrid.DisableControls;
  with queryGrid do
    begin
      Close;
      ParamByName('nombre').AsString:= pilotoFilterVO.Nombre;
      ParamByName('apellido').AsString:= pilotoFilterVO.Apellido;
      ParamByName('nro_docu').AsString:= nroDocu;
      ParamByName('nro_moto').AsInteger:= pilotoFilterVO.NumMoto;
      ParamByName('categoria_oid').AsInteger:= pilotoFilterVO.CategoriaOID;
      ParamByName('tipo_categoria').AsInteger:= tipoCategoriaOID;
      ParamByName('tid').AsString:= pilotoFilterVO.TID;
      Open;
    end;
  queryGrid.EnableControls;
end;

procedure TPilotCRUD.textBindKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = Chr(13) then
    requestLoadInitialDataComplete(filterVO);
end;


procedure TPilotCRUD.InitializeBinding;
var
  expression: TBindExpression;
begin
  BindingHelper.setMessageKey(TComponent(txtNombre), 'Text', TComponent(BindScope), 'Nombre', BindingsList);
  BindingHelper.setMessageKey(TComponent(txtApellido), 'Text', TComponent(BindScope), 'Apellido', BindingsList);
  BindingHelper.setMessageKey(TComponent(txtNroDoc), 'Text', TComponent(BindScope), 'NroDocumento', BindingsList);
  BindingHelper.setMessageKey(TComponent(txtNumMoto), 'Text', TComponent(BindScope), 'NumMoto', BindingsList);
  BindingHelper.setMessageKey(TComponent(cmbCategoria), 'KeyValue', TComponent(BindScope), 'CategoriaOID', BindingsList);
  BindingHelper.setMessageKey(TComponent(txtTID), 'Text', TComponent(BindScope), 'TID', BindingsList);

  // Create a Filter object.
  filterVO := TPilotoFilter.Create;
  BindScope.DataObject := filterVO;
end;

function TPilotCRUD.requestElement(OID: Integer): TPersistentObject;
begin
  Result:= TBussinessDataSubsystemFacade.getInstance.getPiloto(OID);
end;

procedure TPilotCRUD.requestDelete(OID: Integer);
begin
  TBussinessDataSubsystemFacade.getInstance.deletePiloto(OID);
end;

procedure TPilotCRUD.doRequestSave(persistentVO: TPersistentObject);
begin
   TBussinessDataSubsystemFacade.getInstance.savePiloto(TPiloto(persistentVO));
end;

end.
