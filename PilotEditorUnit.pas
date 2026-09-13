unit PilotEditorUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AbstractEditor, Vcl.ComCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, Data.Bind.EngExt, Vcl.Bind.DBEngExt,
  Data.Bind.Components, Vcl.ImgList, cxContainer, cxEdit, cxListView,
  Vcl.StdCtrls, AeroButtons, Vcl.ExtCtrls, cxMaskEdit, cxTextEdit, cxLabel,
  AdvDateTimePicker, Vcl.DBCtrls, Data.DB, ZAbstractRODataset, ZAbstractDataset,
  ZAbstractTable, ZDataset, DataModule, Entidades, BindingHelperUnit,
  cxCurrencyEdit, F_EEMessage, cxCheckBox, MotoCRUDUnit, MotoEditorUnit, cxMemo, IdTCPClient,
  NumeracionDisponibleEdit, NaveganteEdit, Vcl.Grids, Vcl.DBGrids;

type
  TPilotEditor = class(TAbstractEdit)
    userDataGB: TGroupBox;
    lblNombre: TcxLabel;
    txtNombre: TcxTextEdit;
    lblApellido: TcxLabel;
    txtApellido: TcxTextEdit;
    lblNroDoc: TcxLabel;
    txtNroDoc: TcxMaskEdit;
    dtpFechaNac: TAdvDateTimePicker;
    lblFechaNacimiento: TcxLabel;
    lblDireccion: TcxLabel;
    txtDireccion: TcxTextEdit;
    lblTelefono: TcxLabel;
    lblMail: TcxLabel;
    txtMail: TcxTextEdit;
    cmbProvincia: TDBLookupComboBox;
    lblProvincia: TcxLabel;
    lblLocalidad: TcxLabel;
    cmbLocalidad: TDBLookupComboBox;
    ZTProvincia: TZTable;
    DSProvincia: TDataSource;
    ZTLocalidad: TZTable;
    DSLocalidad: TDataSource;
    ZTipoMoto: TZTable;
    DSTipoMoto: TDataSource;
    seguroGB: TGroupBox;
    ZCategoria: TZTable;
    DSCategoria: TDataSource;
    txtTelefono: TcxTextEdit;
    chkResponsabilidadCivil: TcxCheckBox;
    cxLabel1: TcxLabel;
    txtTelefonoAcompaniante: TcxTextEdit;
    notasGB: TGroupBox;
    notasMemo: TcxMemo;
    motosGB: TGroupBox;
    lblNumMoto: TcxLabel;
    lblTipoMoto: TcxLabel;
    cmbTipoMoto: TDBLookupComboBox;
    lblCateogoria: TcxLabel;
    cmbCategoria: TDBLookupComboBox;
    btnAddTipoMoto: TAeroButton;
    txtNumMoto: TcxCurrencyEdit;
    lblNumMotoCross: TcxLabel;
    txtNumMotoCross: TcxCurrencyEdit;
    ZCategoriaMotocross: TZTable;
    lblCategoriaMotocross: TcxLabel;
    cmbCategoriaMotocross: TDBLookupComboBox;
    DSCategoriaMotocross: TDataSource;
    lblNumCuatriciclos: TcxLabel;
    txtNumCuatris: TcxCurrencyEdit;
    lblCategoriaCuatris: TcxLabel;
    cmbCategoriaCuatris: TDBLookupComboBox;
    ZCategoriaCuatriciclos: TZTable;
    DSCategoriaCuatriciclos: TDataSource;
    lblTagID: TcxLabel;
    txtTagID: TcxTextEdit;
    lblTelFijo: TcxLabel;
    txtTelefonoFijo: TcxTextEdit;
    chkUtilizaHandicup: TcxCheckBox;
    chkEsCampeon: TcxCheckBox;
    lblRanking: TcxLabel;
    txtRanking: TcxCurrencyEdit;
    btnVerNumeracionDisponible: TAeroButton;
    btnVerNumeracionDisponibleMotocross: TAeroButton;
    btnVerNumeracionDisponibleCuatri: TAeroButton;
    btnAgregarAcompaniante: TAeroButton;
    cxLabel2: TcxLabel;
    cmbCategoriaAnterior: TDBLookupComboBox;
    ZROQHistorico: TZReadOnlyQuery;
    DSHistorico: TDataSource;
    lblEdad: TcxLabel;
    lblValEdad: TcxLabel;
    ZROQHistoricoRecargoInscripcion: TZReadOnlyQuery;
    DSHistoricoRecargoInscripcion: TDataSource;
    DBGrid1: TDBGrid;
    lblNumeroExterna: TcxLabel;
    txtNumExterno: TcxCurrencyEdit;
    lblCategoriaExterna: TcxLabel;
    cmbCategoriaExterna: TDBLookupComboBox;
    btnVerNumeracionDisponibleExterno: TAeroButton;
    ZCategoriaExterna: TZTable;
    DSCategoriaExterna: TDataSource;
    lblRankingExterno: TcxLabel;
    txtRankingExterno: TcxCurrencyEdit;
    procedure textKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cmbProvinciaExit(Sender: TObject);
    procedure dtpFechaNacExit(Sender: TObject);
    procedure dtpFechaNacKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtNroDocPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure btnAcceptClick(Sender: TObject);
    procedure chkResponsabilidadCivilClick(Sender: TObject);
    procedure txtNumMotoExit(Sender: TObject);
    procedure btnAddTipoMotoClick(Sender: TObject);
    procedure notasMemoExit(Sender: TObject);
    procedure cmbCategoriaKeyPress(Sender: TObject; var Key: Char);
    procedure cmbTipoMotoDropDown(Sender: TObject);
    procedure txtTelefonoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtTagIDEnter(Sender: TObject);
    procedure chkUtilizaHandicupExit(Sender: TObject);
    procedure chkUtilizaHandicupFocusChanged(Sender: TObject);
    procedure btnVerNumeracionDisponibleClick(Sender: TObject);
    procedure btnVerNumeracionDisponibleMotocrossClick(Sender: TObject);
    procedure btnVerNumeracionDisponibleCuatriClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAgregarAcompanianteClick(Sender: TObject);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure dtpFechaNacChange(Sender: TObject);

    function CalculateAge(BirthDate: TDateTime): Integer;
    procedure btnVerNumeracionDisponibleExternoClick(Sender: TObject);
  private
    showConfirmationMessage : Boolean;
    procedure InitializeBinding; Override;
    procedure startReadingAntena();
  public
    procedure setEditorValueObject(persistentVO : TPersistentObject); Override;
    procedure ClearEditor; Override;
    procedure RefreshEditorData; Override;
    function abrirNumeracionDisponible(CategoriaOID : Integer): Integer;

    constructor Create(owner: TComponent; persistentVO: TPersistentObject; showConfirmationMessage: Boolean = True); Virtual;
  end;

  type
  TCommThread = class(TThread)
  private
    fKeepRuning: Boolean;
    editTest: TcxTextEdit;
    pilotoVO: TPiloto;
  protected
    procedure Execute; override;
    property KeepRuning: Boolean read fKeepRuning write fKeepRuning;
  end;

var
  AThread: TCommThread;

implementation
{$R *.dfm}

procedure TPilotEditor.textKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  BindingsList.Notify(Sender, 'Text');
end;

procedure TPilotEditor.txtNroDocPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  ErrorText:= 'Ha ingresado un Número de Documento inválido';
end;

procedure TPilotEditor.txtNumMotoExit(Sender: TObject);
begin
  BindingsList.Notify(Sender, 'Text');
end;

procedure TPilotEditor.txtTagIDEnter(Sender: TObject);
begin
  inherited;
  BindingsList.Notify(Sender, 'Text');
end;

procedure TPilotEditor.txtTelefonoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  BindingsList.Notify(Sender, 'Text');
end;

procedure TPilotEditor.cmbCategoriaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #8 then
    TDBLookupComboBox(Sender).KeyValue:= 0;
end;

procedure TPilotEditor.cmbProvinciaExit(Sender: TObject);
begin
  inherited;
  BindingsList.Notify(Sender, 'KeyValue');
end;

procedure TPilotEditor.cmbTipoMotoDropDown(Sender: TObject);
begin
  ZTipoMoto.Close;
  ZTipoMoto.Open;
end;

constructor TPilotEditor.Create(owner: TComponent; persistentVO: TPersistentObject; showConfirmationMessage: Boolean = True);
begin
  inherited Create(owner, persistentVO);

  self.showConfirmationMessage:= showConfirmationMessage;
  TPiloto(persistentVO).ValidacionNumericaCategoria:= False;
end;

function TPilotEditor.CalculateAge(BirthDate: TDateTime): Integer;
var
  Today: TDateTime;
  Years, Months, Days: Word;
  BirthYear, BirthMonth, BirthDay: Word;
  TodayYear, TodayMonth, TodayDay: Word;
begin
  Today := Date(); // Get current date

  // Extract year, month, day from birth date
  DecodeDate(BirthDate, BirthYear, BirthMonth, BirthDay);

  // Extract year, month, day from today's date
  DecodeDate(Today, TodayYear, TodayMonth, TodayDay);

  // Calculate age
  Years := TodayYear - BirthYear;

  // Adjust age if birthday hasn't occurred this year yet
  if (TodayMonth < BirthMonth) or
     ((TodayMonth = BirthMonth) and (TodayDay < BirthDay)) then
    Dec(Years);

  Result := Years;
end;

procedure TPilotEditor.dtpFechaNacChange(Sender: TObject);
begin
  lblValEdad.Caption:= IntToStr(CalculateAge(dtpFechaNac.DateTime)) + ' años';
end;

procedure TPilotEditor.dtpFechaNacExit(Sender: TObject);
begin
  inherited;
  BindingsList.Notify(Sender, 'Date');
end;

procedure TPilotEditor.dtpFechaNacKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  BindingsList.Notify(Sender, 'Date');
end;

procedure TPilotEditor.FormActivate(Sender: TObject);
begin
  if (TPiloto(persistentVO).OID > 0) then
  begin
    ZROQHistorico.Close;
    ZROQHistorico.ParamByName('piloto_oid').AsInteger:= TPiloto(persistentVO).OID;
    ZROQHistorico.Open;
    cmbCategoriaAnterior.KeyValue:= ZROQHistorico.FieldByName('oid').AsInteger;

    ZROQHistoricoRecargoInscripcion.Close;
    ZROQHistoricoRecargoInscripcion.ParamByName('piloto_oid').AsInteger:= TPiloto(persistentVO).OID;
    ZROQHistoricoRecargoInscripcion.Open;
  end;

    lblValEdad.Caption:= IntToStr(CalculateAge(dtpFechaNac.DateTime)) + ' años';
end;

procedure TPilotEditor.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
    if (cmbProvincia.Focused) then
        cmbProvincia.Perform(WM_KEYDOWN, VK_DOWN, 0);
    if (cmbLocalidad.Focused) then
        cmbLocalidad.Perform(WM_KEYDOWN, VK_DOWN, 0);
    if (cmbCategoria.Focused) then
        cmbCategoria.Perform(WM_KEYDOWN, VK_DOWN, 0);
    if (cmbCategoriaMotocross.Focused) then
        cmbCategoriaMotocross.Perform(WM_KEYDOWN, VK_DOWN, 0);
    if (cmbCategoriaCuatris.Focused) then
        cmbCategoriaCuatris.Perform(WM_KEYDOWN, VK_DOWN, 0);
    if (cmbCategoriaExterna.Focused) then
        cmbCategoriaExterna.Perform(WM_KEYDOWN, VK_DOWN, 0);
end;

procedure TPilotEditor.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
    if (cmbProvincia.Focused) then
        cmbProvincia.Perform(WM_KEYDOWN, VK_UP, 0);
    if (cmbLocalidad.Focused) then
        cmbLocalidad.Perform(WM_KEYDOWN, VK_UP, 0);
    if (cmbCategoria.Focused) then
        cmbCategoria.Perform(WM_KEYDOWN, VK_UP, 0);
    if (cmbCategoriaMotocross.Focused) then
        cmbCategoriaMotocross.Perform(WM_KEYDOWN, VK_UP, 0);
    if (cmbCategoriaCuatris.Focused) then
        cmbCategoriaCuatris.Perform(WM_KEYDOWN, VK_UP, 0);
    if (cmbCategoriaExterna.Focused) then
        cmbCategoriaExterna.Perform(WM_KEYDOWN, VK_UP, 0);
end;

procedure TPilotEditor.FormShow(Sender: TObject);
begin
  inherited;

  //cmbTipoMoto.KeyValue:= 1;
  cmbTipoMotoDropDown(self);
  chkResponsabilidadCivil.Checked:= True;
  chkResponsabilidadCivilClick(self);
end;

procedure TPilotEditor.setEditorValueObject(persistentVO : TPersistentObject);
var
  pilotoVO: TPiloto;
begin
  inherited;
  pilotoVO := TPiloto(persistentVO);
end;

procedure TPilotEditor.InitializeBinding;
var
  expression: TBindExpression;
  pilotoVO: TPiloto;
begin
  BindingHelper.setMessageKey(TComponent(txtNombre), 'Text', TComponent(BindScope), 'Nombre', BindingsList);
  BindingHelper.setMessageKey(TComponent(txtApellido), 'Text', TComponent(BindScope), 'Apellido', BindingsList);
  BindingHelper.setMessageKey(TComponent(txtNroDoc), 'Text', TComponent(BindScope), 'NroDocumento', BindingsList);
  BindingHelper.setMessageKey(TComponent(dtpFechaNac), 'Date', TComponent(BindScope), 'FechaNacimiento', BindingsList);

  BindingHelper.setMessageKey(TComponent(txtDireccion), 'Text', TComponent(BindScope), 'Direccion', BindingsList);
  BindingHelper.setMessageKey(TComponent(txtTelefono), 'Text', TComponent(BindScope), 'Telefono', BindingsList);
  BindingHelper.setMessageKey(TComponent(txtTelefonoAcompaniante), 'Text', TComponent(BindScope), 'TelefonoAcompaniante', BindingsList);
  BindingHelper.setMessageKey(TComponent(txtTelefonoFijo), 'Text', TComponent(BindScope), 'TelefonoFijo', BindingsList);
  BindingHelper.setMessageKey(TComponent(txtMail), 'Text', TComponent(BindScope), 'Mail', BindingsList);

  BindingHelper.setMessageKey(TComponent(cmbProvincia), 'KeyValue', TComponent(BindScope), 'ProvinciaOID', BindingsList);
  BindingHelper.setMessageKey(TComponent(cmbLocalidad), 'KeyValue', TComponent(BindScope), 'LocalidadOID', BindingsList);

  BindingHelper.setMessageKey(TComponent(txtNumMoto), 'Text', TComponent(BindScope), 'NumMoto', BindingsList);
  BindingHelper.setMessageKey(TComponent(cmbTipoMoto), 'KeyValue', TComponent(BindScope), 'MotoOID', BindingsList);
  BindingHelper.setMessageKey(TComponent(txtNumMotoCross), 'Text', TComponent(BindScope), 'NumMotoCross', BindingsList);
  BindingHelper.setMessageKey(TComponent(cmbCategoriaMotocross), 'KeyValue', TComponent(BindScope), 'MotoCrossOID', BindingsList);
  BindingHelper.setMessageKey(TComponent(txtNumCuatris), 'Text', TComponent(BindScope), 'NumCuatriciclos', BindingsList);
  BindingHelper.setMessageKey(TComponent(cmbCategoriaCuatris), 'KeyValue', TComponent(BindScope), 'CuatriciclosOID', BindingsList);
  BindingHelper.setMessageKey(TComponent(txtRanking), 'Text', TComponent(BindScope), 'Ranking', BindingsList);
  BindingHelper.setMessageKey(TComponent(txtRankingExterno), 'Text', TComponent(BindScope), 'RankingExterno', BindingsList);

  BindingHelper.setMessageKey(TComponent(txtNumExterno), 'Text', TComponent(BindScope), 'NumExterno', BindingsList);
  BindingHelper.setMessageKey(TComponent(cmbCategoriaExterna), 'KeyValue', TComponent(BindScope), 'CatExternoOID', BindingsList);

  BindingHelper.setMessageKey(TComponent(cmbCategoria), 'KeyValue', TComponent(BindScope), 'CategoriaOID', BindingsList);
  BindingHelper.setMessageKey(TComponent(chkResponsabilidadCivil), 'Checked', TComponent(BindScope), 'Responsabilidad', BindingsList);
  BindingHelper.setMessageKey(TComponent(chkUtilizaHandicup), 'Checked', TComponent(BindScope), 'UtilizaHandicup', BindingsList);
  BindingHelper.setMessageKey(TComponent(chkEsCampeon), 'Checked', TComponent(BindScope), 'EsCampeon', BindingsList);

  BindingHelper.setMessageKey(TComponent(notasMemo), 'Text', TComponent(BindScope), 'Notas', BindingsList);
  BindingHelper.setMessageKey(TComponent(txtTagID), 'Text', TComponent(BindScope), 'TagID', BindingsList);

  pilotoVO:= TPiloto(persistentVO);
  BindScope.DataObject := pilotoVO;

end;

procedure TPilotEditor.notasMemoExit(Sender: TObject);
begin
  inherited;
  BindingsList.Notify(Sender, 'Text');
end;

procedure TPilotEditor.btnAddTipoMotoClick(Sender: TObject);
var
  motoVO : TMoto;
  motoCRUD : TMotoCRUD;
  motoEditor : TMotoEditor;
begin
  inherited;
  try
    motoVO:= TMoto.Create;

    motoCRUD:= TMotoCRUD.Create(nil);
    motoEditor:= TMotoEditor.Create(motoCRUD, motoVO);
    motoEditor.ClearEditor;
    motoEditor.ShowModal;
  finally
    motoCRUD.Free;
    motoEditor.Free;
  end;
end;

procedure TPilotEditor.btnAgregarAcompanianteClick(Sender: TObject);
var
  naveganteEditor : TNaveganteEditor;
  naveganteVO : TNavegante;

begin
  if cmbCategoria.KeyValue > 0 then
  begin

    if (TPiloto(Self.getEditorValueObject).Navegante<>nil) then
        naveganteVO:= TPiloto(Self.getEditorValueObject).Navegante
     else
        naveganteVO:= TNavegante.Create;

    try
      naveganteEditor:= TNaveganteEditor.Create(self, naveganteVO);
      naveganteEditor.ShowModal;
    finally
      naveganteVO:= TNavegante(naveganteEditor.getEditorValueObject);
      if (naveganteVO.isValidObject) then
        TPiloto(Self.getEditorValueObject).Navegante:= naveganteVO;

      naveganteEditor.Free;
    end;
  end;
end;

procedure TPilotEditor.btnVerNumeracionDisponibleClick(Sender: TObject);
begin
  txtNumMoto.Value:= abrirNumeracionDisponible(cmbCategoria.KeyValue);
end;

procedure TPilotEditor.btnVerNumeracionDisponibleCuatriClick(Sender: TObject);
begin
  txtNumCuatris.Value:= abrirNumeracionDisponible(cmbCategoriaCuatris.KeyValue);
end;

function TPilotEditor.abrirNumeracionDisponible(CategoriaOID : Integer): Integer;
var
  formNumeracionDisponible : TFormNumeracionDisponible;
begin
  if CategoriaOID > 0 then
  begin
    try
      formNumeracionDisponible:= TFormNumeracionDisponible.Create(self);
      formNumeracionDisponible.CategoriaOID:= CategoriaOID;
      formNumeracionDisponible.ShowModal;
      Result:= formNumeracionDisponible.ZNumeracion.FieldByName('num_moto').AsInteger;
    finally
      formNumeracionDisponible.Free;
    end;
  end;
end;

procedure TPilotEditor.btnVerNumeracionDisponibleMotocrossClick(
  Sender: TObject);
begin
  txtNumMotoCross.Value:= abrirNumeracionDisponible(cmbCategoriaMotocross.KeyValue);
end;

procedure TPilotEditor.btnVerNumeracionDisponibleExternoClick(Sender: TObject);
begin
  inherited;
  txtNumExterno.Value:= abrirNumeracionDisponible(cmbCategoriaExterna.KeyValue);
end;

procedure TPilotEditor.btnAcceptClick(Sender: TObject);
var
  pilotReport: String;
  pilotoVO: TPiloto;
begin
  pilotoVO:= TPiloto(persistentVO);

  pilotReport:= '<font size="3">';
  pilotReport:= pilotReport + 'Nombre: <b>' + pilotoVO.Nombre + '</b><br>';
  pilotReport:= pilotReport + 'Apellido: <b>' + pilotoVO.Apellido + '</b><br>';
  pilotReport:= pilotReport + 'Nro. Doc.: <b>' + pilotoVO.NroDocumento + '</b><br>';
  pilotReport:= pilotReport + 'Fecha Nac.: <b>' + DateToStr(pilotoVO.FechaNacimiento) + '</b><br>';
  pilotReport:= pilotReport + 'Dirección: <b>' + pilotoVO.Direccion + '</b><br>';
  pilotReport:= pilotReport + 'Celular: <b>' + pilotoVO.Telefono + '</b><br>';
  pilotReport:= pilotReport + 'Fijo: <b>' + pilotoVO.TelefonoFijo + '</b><br>';
  pilotReport:= pilotReport + 'Email: <b>' + pilotoVO.Mail + '</b><br>';
  pilotReport:= pilotReport + 'Localidad: <b>' + cmbLocalidad.Text + '</b><br>';
  pilotReport:= pilotReport + 'Tel. Acompañante: <b>' + pilotoVO.TelefonoAcompaniante + '</b><br>';
  pilotReport:= pilotReport + 'TagID: <b>' + pilotoVO.TagID + '</b><br><br>';

  pilotReport:= pilotReport + 'Nº Moto Enduro: <b>' + IntToStr(pilotoVO.NumMoto) + '</b><br>';
  pilotReport:= pilotReport + 'Categoría Enduro: <b>' + cmbCategoria.Text + '</b><br>';
  pilotReport:= pilotReport + 'Nº Moto Motocross: <b>' + IntToStr(pilotoVO.NumCuatriciclos) + '</b><br>';
  pilotReport:= pilotReport + 'Categoría Motocross: <b>' + cmbCategoriaCuatris.Text + '</b><br>';
  pilotReport:= pilotReport + 'Nº Cuatriciclo: <b>' + IntToStr(pilotoVO.NumMotoCross) + '</b><br>';
  pilotReport:= pilotReport + 'Categoría Motocross: <b>' + cmbCategoriaMotocross.Text + '</b><br>';
  pilotReport:= pilotReport + 'Tipo Moto: <b>' + cmbTipoMoto.Text + '</b><br>';
  pilotReport:= pilotReport + '</font>';

  if (showConfirmationMessage) then
    begin
      if (TF_EE_Message.ShowMessage(TComponent(Self),'¡Confirmación de datos del piloto!',
        pilotReport, TF_EE_Message.QUESTION, False, True) = mrOk) then
      begin
        inherited;
      end;
    end
      else
      begin
        inherited;
      end;
end;

procedure TPilotEditor.chkResponsabilidadCivilClick(Sender: TObject);
begin
  inherited;
  BindingsList.Notify(Sender, 'Checked');
end;

procedure TPilotEditor.chkUtilizaHandicupExit(Sender: TObject);
begin
  inherited;
  BindingsList.Notify(Sender, 'Checked');
end;

procedure TPilotEditor.chkUtilizaHandicupFocusChanged(Sender: TObject);
begin
  inherited;
  BindingsList.Notify(Sender, 'Checked');
end;

procedure TPilotEditor.ClearEditor;
begin
  inherited;

  txtNombre.Clear;
  txtApellido.Clear;
  txtNroDoc.Clear;

  txtDireccion.Clear;
  txtTelefono.Clear;
  txtMail.Clear;
  txtTagID.Clear;

  cmbProvincia.KeyValue:= 0;
  cmbLocalidad.KeyValue:= 0;

  txtNumMoto.Clear;
  cmbTipoMoto.KeyValue:= 0;

  cmbCategoria.KeyValue:= 0;

  chkResponsabilidadCivil.Checked:= False;
  chkUtilizaHandicup.Checked:= True;
end;

procedure TPilotEditor.RefreshEditorData;
begin
  ZTProvincia.Close;
  ZTProvincia.Open;

  ZTLocalidad.Close;
  ZTLocalidad.Open;

  ZTipoMoto.Close;
  ZTipoMoto.Open;

  ZCategoria.Close;
  ZCategoria.Open;

  ZCategoriaCuatriciclos.Close;
  ZCategoriaCuatriciclos.Open;

  ZCategoriaMotocross.Close;
  ZCategoriaMotocross.Open;

  ZCategoriaExterna.Close;
  ZCategoriaExterna.Open;
end;

procedure TCommThread.Execute;
var
  Client: TIdTCPClient;
  SplitList: TStringList;
  readLn : String;
begin
  try
    Client := TIdTCPClient.Create(nil);
    SplitList := TStringList.Create;
    try
      Client.Host:= '192.168.1.100';
      Client.Port:= 14150;
      SplitList.Delimiter:= ',';
      Client.Connect;

        while (Client.Connected) do
          if (KeepRuning) then
            begin
              readLn:= Client.IOHandler.ReadLn;

              SplitList.Clear;
              SplitList.DelimitedText:= readLn;

              editTest.Text:= SplitList[0];
              pilotoVO.TagID:= SplitList[0];
            end;
      Client.Disconnect;
    finally
      begin
        Client.Free;
        SplitList.Free;
      end;
    end;
  except
    on E:Exception do
      begin
        TF_EE_Message.ShowMessage(TComponent(Self), 'Error al conectar con la Antena',
          '¡Error! Clase: ' + E.ClassName + '. Mensaje: ' + QuotedStr(E.Message), TF_EE_Message.ERROR, True)

      end;
  end;
end;

procedure TPilotEditor.startReadingAntena;
begin
  if (not Assigned(AThread)) then
  begin
    AThread:= TCommThread.Create(True);

    AThread.KeepRuning:= True;
    AThread.FreeOnTerminate:= True;
//    AThread.OnTerminate:= AThreadTerminate;
    AThread.editTest:= txtTagID;

    AThread.Start;
  end;

  AThread.pilotoVO:= TPiloto(persistentVO);
  AThread.KeepRuning:= True;
end;

end.
