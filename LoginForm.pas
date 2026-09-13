unit LoginForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ImgList, Vcl.StdCtrls,
  AeroButtons, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxLabel, cxTextEdit, AdvPicture, dxGDIPlusClasses, cxImage,
  DataModule, Vcl.ComCtrls, cxListView, Entidades, Data.Bind.Components,
  BindingHelperUnit, Data.Bind.EngExt, Vcl.Bind.DBEngExt, EncodingHelper,
  F_EEMessage, LoggedUserSingleton;

type
  TLogin = class(TForm)
    panelButtons: TPanel;
    panelMain: TPanel;
    btnAceptar: TAeroButton;
    btnCanelar: TAeroButton;
    txtUsuario: TcxTextEdit;
    lblUsuario: TcxLabel;
    lblPassword: TcxLabel;
    txtPassword: TcxTextEdit;
    loginImageList: TcxImageList;
    loginImage: TcxImage;
    cxErrorImageList: TcxImageList;
    BindScope: TBindScope;
    BindingsList: TBindingsList;
    panelError: TPanel;
    errorListView: TcxListView;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    procedure btnAceptarClick(Sender: TObject);
    procedure txtKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnCanelarClick(Sender: TObject);
    procedure LoginKeyPress(Sender: TObject; var Key: Char);
  protected
    persistentVO: TPersistentObject;

    procedure InitializeBinding;
  private
    procedure CreateParams(var Params: TCreateParams); override;
  public
    constructor Create(owner: TComponent; persistentVO: TPersistentObject);

    procedure setEditorValueObject(persistentVO : TPersistentObject);
    function getEditorValueObject(): TPersistentObject;

    procedure setTListItemsByTStringList(errorListView : TcxListView; stringList : TStringList);
    procedure setErrorMessage(errorListView : TcxListView; message: String);

    procedure LogIn;
  end;

implementation

{$R *.dfm}

uses Unit1;

procedure TLogin.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do begin
    // Form "Stay on Top"
    ExStyle := ExStyle or WS_EX_TOPMOST;
    WndParent := GetDesktopwindow;
  end;
end;

procedure TLogin.btnCanelarClick(Sender: TObject);
begin
  // Application.MainForm.Close;
  Application.Terminate;
end;

constructor TLogin.Create(owner: TComponent; persistentVO: TPersistentObject);
begin
  inherited Create(owner);
  self.persistentVO:= persistentVO;
  InitializeBinding;
end;

procedure TLogin.btnAceptarClick(Sender: TObject);
begin
  if (not self.getEditorValueObject().isValidObject()) then
    begin
      setTListItemsByTStringList(errorListView,
        self.getEditorValueObject().getValidationResult);
      txtUsuario.SetFocus;
    end
  else
    begin
      panelError.Visible:= False;
      LogIn;
      //Close;
    end;
end;

procedure TLogin.setEditorValueObject(persistentVO : TPersistentObject);
begin
 self.persistentVO:= persistentVO;
 BindScope.DataObject := persistentVO;
end;

function TLogin.getEditorValueObject(): TPersistentObject;
begin
  result:= self.persistentVO;
end;

procedure TLogin.setTListItemsByTStringList(errorListView : TcxListView; stringList : TStringList);
var
  Index : Integer;
begin
  errorListView.Items.Clear;
  panelError.Visible:= True;

  for Index := 0 to stringList.Count - 1 do
  begin
    with errorListView.Items.Add do
    begin
      Caption := stringList[Index];
      StateIndex:= 0;
    end;
  end;
end;

procedure TLogin.txtKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  BindingsList.Notify(Sender, '');
end;

procedure TLogin.InitializeBinding;
var
  expression: TBindExpression;
  cuentaUsuarioVO: TCuentaUsuario;
begin
  BindingHelper.setMessageKey(TComponent(txtUsuario), 'Text', TComponent(BindScope), 'Username', BindingsList);
  BindingHelper.setMessageKey(TComponent(txtPassword), 'Text', TComponent(BindScope), 'Password', BindingsList);

  cuentaUsuarioVO:= TCuentaUsuario(persistentVO);
  BindScope.DataObject := cuentaUsuarioVO;
end;

procedure TLogin.LogIn;
var
  LoggedUser : TLoggedUser;
begin
  try
    with ConnectionModule.ZLoginQuery do
      begin
        Close;
        Params.ParamByName('username').AsString:= txtUsuario.Text;
        Params.ParamByName('password').AsString:= TEncodingHelper.XorEncode('74606A780C0C', txtPassword.Text);
        Open;
        if RecordCount > 0 then
          begin
            // Crear Usuario
            LoggedUser:= TLoggedUser.Create;
            LoggedUser.OID:= FieldByName('oid').AsInteger;
            LoggedUser.Nombre:= FieldByName('nombre').AsString;
            LoggedUser.Apellido:= FieldByName('apellido').AsString;
            LoggedUser.AccountTypeOID:= FieldByName('perfil_oid').AsInteger;
            LoggedUser.AccountTypeName:= FieldByName('perfil_nombre').AsString;

            TLoggedUserSingleton.getInstance.LoggedUser:= LoggedUser;

            Principal.setLoggedUserToButtomPanel;
            // Cerramos la ventana
            ModalResult:= mrOk;
          end
        else
            setErrorMessage(errorListView, 'El "Usuario" o la "Contraseña" son incorrectos.');
      end;
  except
    on E: Exception do TF_EE_Message.ShowMessage(TComponent(Self), 'Error de Conexión de Base de datos', 'Mensaje: No se puede conectar con la base de datos. <br><br>Error al conectarse con el host: <b>"'+ConnectionModule.ZConnection.HostName+'"</b> <br><br>Mensaje: '+E.Message, 0, True)
  end;
end;

procedure TLogin.setErrorMessage(errorListView : TcxListView; message: String);
  var
    stringList : TStringList;
begin
  stringList := TStringList.Create;
  stringList.Add(message);
  setTListItemsByTStringList(errorListView, stringList);
end;

procedure TLogin.LoginKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    LogIn;
end;

end.
