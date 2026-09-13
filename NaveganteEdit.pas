unit NaveganteEdit;

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
  Vcl.StdCtrls, AeroButtons, Vcl.ExtCtrls, cxTextEdit, cxLabel, Entidades, BindingHelperUnit;

type
  TNaveganteEditor = class(TAbstractEdit)
    userDataGB: TGroupBox;
    lblNombre: TcxLabel;
    txtNombre: TcxTextEdit;
    lblApellido: TcxLabel;
    txtApellido: TcxTextEdit;
    lblDireccion: TcxLabel;
    txtDireccion: TcxTextEdit;
    lblTelefono: TcxLabel;
    lblMail: TcxLabel;
    txtMail: TcxTextEdit;
    txtTelefono: TcxTextEdit;
    lblTelFijo: TcxLabel;
    txtTelefonoFijo: TcxTextEdit;
    procedure txtNombreExit(Sender: TObject);
    procedure txtNombreKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAcceptClick(Sender: TObject);
  private
    procedure InitializeBinding; Override;
  public
    procedure setEditorValueObject(persistentVO : TPersistentObject); Override;
    procedure ClearEditor; Override;
    procedure RefreshEditorData; Override;
  end;

implementation

{$R *.dfm}

procedure TNaveganteEditor.setEditorValueObject(persistentVO : TPersistentObject);
var
  naveganteVO: TNavegante;
begin
  inherited;
  naveganteVO := TNavegante(persistentVO);
end;

procedure TNaveganteEditor.txtNombreExit(Sender: TObject);
begin
  BindingsList.Notify(Sender, 'Text');
end;

procedure TNaveganteEditor.txtNombreKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  BindingsList.Notify(Sender, 'Text');
end;

procedure TNaveganteEditor.RefreshEditorData;
begin

end;

procedure TNaveganteEditor.btnAcceptClick(Sender: TObject);
begin
  if (not self.getEditorValueObject().isValidObject()) then
    begin
      validationPanel.Visible:= True;
      setTListItemsByTStringList(errorListView,
        self.getEditorValueObject().getValidationResult);
    end
  else
    begin
      validationPanel.Visible:= False;
      Close;
    end;
end;

procedure TNaveganteEditor.ClearEditor;
begin
  inherited;

  txtNombre.Clear;
  txtApellido.Clear;

  txtDireccion.Clear;
  txtTelefono.Clear;
  txtMail.Clear;
end;

procedure TNaveganteEditor.InitializeBinding;
var
  expression: TBindExpression;
  naveganteVO: TNavegante;
begin
  BindingHelper.setMessageKey(TComponent(txtNombre), 'Text', TComponent(BindScope), 'Nombre', BindingsList);
  BindingHelper.setMessageKey(TComponent(txtApellido), 'Text', TComponent(BindScope), 'Apellido', BindingsList);

//  BindingHelper.setMessageKey(TComponent(txtDireccion), 'Text', TComponent(BindScope), 'Direccion', BindingsList);
  BindingHelper.setMessageKey(TComponent(txtTelefono), 'Text', TComponent(BindScope), 'Telefono', BindingsList);
  BindingHelper.setMessageKey(TComponent(txtTelefonoFijo), 'Text', TComponent(BindScope), 'TelefonoFijo', BindingsList);
  BindingHelper.setMessageKey(TComponent(txtMail), 'Text', TComponent(BindScope), 'Mail', BindingsList);

  naveganteVO:= TNavegante(persistentVO);
  BindScope.DataObject := naveganteVO;
end;

end.
