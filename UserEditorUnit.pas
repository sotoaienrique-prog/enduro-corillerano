unit UserEditorUnit;

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
  Vcl.StdCtrls, AeroButtons, Vcl.ExtCtrls, cxLabel, cxTextEdit, Entidades,
  BindingHelperUnit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, Data.DB, ZAbstractRODataset, ZAbstractDataset,
  ZAbstractTable, ZDataset, DataModule, Vcl.DBCtrls;

type
  TUserEditor = class(TAbstractEdit)
    userDataGB: TGroupBox;
    lblNombre: TcxLabel;
    txtNombre: TcxTextEdit;
    lblApellido: TcxLabel;
    txtApellido: TcxTextEdit;
    GroupBox1: TGroupBox;
    lblUsuario: TcxLabel;
    txtUsuario: TcxTextEdit;
    lblPassword: TcxLabel;
    txtPassword: TcxTextEdit;
    lblNroDoc: TcxLabel;
    txtNroDoc: TcxMaskEdit;
    ZTProfile: TZTable;
    DSProfile: TDataSource;
    lblProfile: TcxLabel;
    cmbProfile: TDBLookupComboBox;
    procedure textKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAcceptClick(Sender: TObject);
    procedure cmbProfileKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cmbProfileExit(Sender: TObject);
    procedure txtNroDocPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
  private
  protected
    procedure InitializeBinding; Override;
  public
    procedure setEditorValueObject(persistentVO : TPersistentObject); Override;
    procedure ClearEditor; Override;

    constructor Create(owner: TComponent; persistentVO: TPersistentObject); Virtual;
  end;

implementation

{$R *.dfm}

procedure TUserEditor.textKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  BindingsList.Notify(Sender, 'Text');
end;

procedure TUserEditor.txtNroDocPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  ErrorText:= 'Ha ingresado un Número de Documento inválido';
end;

constructor TUserEditor.Create(owner: TComponent; persistentVO: TPersistentObject);
begin
  inherited Create(owner, persistentVO);
end;

procedure TUserEditor.setEditorValueObject(persistentVO : TPersistentObject);
var
  usuarioVO: TUsuario;
begin
  inherited;

  usuarioVO := TUsuario(persistentVO);
end;

procedure TUserEditor.InitializeBinding;
var
  expression: TBindExpression;
  usuarioVO: TUsuario;
begin
  BindingHelper.setMessageKey(TComponent(txtNombre), 'Text', TComponent(BindScope), 'Nombre', BindingsList);
  BindingHelper.setMessageKey(TComponent(txtApellido), 'Text', TComponent(BindScope), 'Apellido', BindingsList);
  BindingHelper.setMessageKey(TComponent(txtNroDoc), 'Text', TComponent(BindScope), 'NroDocumento', BindingsList);
  BindingHelper.setMessageKey(TComponent(cmbProfile), 'KeyValue', TComponent(BindScope), 'PerfilOID', BindingsList);

  BindingHelper.setMessageKey(TComponent(txtUsuario), 'Text', TComponent(BindScope), 'CuentaUsuario.Username', BindingsList);
  BindingHelper.setMessageKey(TComponent(txtPassword), 'Text', TComponent(BindScope), 'CuentaUsuario.Password', BindingsList);

  usuarioVO:= TUsuario(persistentVO);
  BindScope.DataObject := usuarioVO;

  //ClearEditor;
end;

procedure TUserEditor.btnAcceptClick(Sender: TObject);
var
  usuarioVO : TUsuario;
begin
  usuarioVO:= TUsuario(self.getEditorValueObject());
  inherited;
end;

procedure TUserEditor.ClearEditor;
begin
  inherited;

  txtNombre.Clear;
  txtApellido.Clear;
  txtNroDoc.Clear;

  txtUsuario.Clear;
  txtPassword.Clear;
end;

procedure TUserEditor.cmbProfileExit(Sender: TObject);
begin
  inherited;
  BindingsList.Notify(Sender, 'KeyValue');
end;

procedure TUserEditor.cmbProfileKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  BindingsList.Notify(Sender, 'KeyValue');
end;

end.
