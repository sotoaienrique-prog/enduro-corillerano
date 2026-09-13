unit ContactoEditorUnit;

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
  Vcl.StdCtrls, AeroButtons, Vcl.ExtCtrls, cxMemo, Vcl.DBCtrls, cxTextEdit,
  cxLabel, Entidades, BindingHelperUnit, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZAbstractTable, ZDataset;

type
  TContactEdit = class(TAbstractEdit)
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
    cmbProvincia: TDBLookupComboBox;
    lblProvincia: TcxLabel;
    lblLocalidad: TcxLabel;
    cmbLocalidad: TDBLookupComboBox;
    txtTelefono: TcxTextEdit;
    lblTelFijo: TcxLabel;
    txtTelefonoFijo: TcxTextEdit;
    notasGB: TGroupBox;
    notasMemo: TcxMemo;
    ZTProvincia: TZTable;
    DSProvincia: TDataSource;
    DSLocalidad: TDataSource;
    ZTLocalidad: TZTable;
    procedure txtNombreKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtNombreExit(Sender: TObject);
    procedure cmbLocalidadExit(Sender: TObject);
    procedure cmbProvinciaExit(Sender: TObject);
  private
    procedure InitializeBinding; Override;
  public
    procedure setEditorValueObject(persistentVO : TPersistentObject); Override;
    procedure ClearEditor; Override;
    procedure RefreshEditorData; Override;
  end;

implementation

{$R *.dfm}

procedure TContactEdit.RefreshEditorData;
begin
  ZTProvincia.Close;
  ZTProvincia.Open;

  ZTLocalidad.Close;
  ZTLocalidad.Open;
end;

procedure TContactEdit.ClearEditor;
begin
  inherited;

  txtNombre.Clear;
  txtApellido.Clear;

  txtDireccion.Clear;
  txtTelefono.Clear;
  txtMail.Clear;

  cmbProvincia.KeyValue:= 0;
  cmbLocalidad.KeyValue:= 0;
end;

procedure TContactEdit.setEditorValueObject(persistentVO : TPersistentObject);
var
  contactoVO: TContacto;
begin
  inherited;
  contactoVO := TContacto(persistentVO);
end;

procedure TContactEdit.txtNombreExit(Sender: TObject);
begin
  inherited;
  BindingsList.Notify(Sender, 'Text');
end;

procedure TContactEdit.txtNombreKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  BindingsList.Notify(Sender, 'Text');
end;

procedure TContactEdit.cmbLocalidadExit(Sender: TObject);
begin
  inherited;
  BindingsList.Notify(Sender, 'KeyValue');
end;

procedure TContactEdit.cmbProvinciaExit(Sender: TObject);
begin
  BindingsList.Notify(Sender, 'KeyValue');
end;

procedure TContactEdit.InitializeBinding;
var
  expression: TBindExpression;
  contactoVO: TContacto;
begin
  BindingHelper.setMessageKey(TComponent(txtNombre), 'Text', TComponent(BindScope), 'Nombre', BindingsList);
  BindingHelper.setMessageKey(TComponent(txtApellido), 'Text', TComponent(BindScope), 'Apellido', BindingsList);

  BindingHelper.setMessageKey(TComponent(txtDireccion), 'Text', TComponent(BindScope), 'Direccion', BindingsList);
  BindingHelper.setMessageKey(TComponent(txtTelefono), 'Text', TComponent(BindScope), 'Telefono', BindingsList);
  BindingHelper.setMessageKey(TComponent(txtTelefonoFijo), 'Text', TComponent(BindScope), 'TelefonoFijo', BindingsList);
  BindingHelper.setMessageKey(TComponent(txtMail), 'Text', TComponent(BindScope), 'Mail', BindingsList);

  BindingHelper.setMessageKey(TComponent(cmbProvincia), 'KeyValue', TComponent(BindScope), 'ProvinciaOID', BindingsList);
  BindingHelper.setMessageKey(TComponent(cmbLocalidad), 'KeyValue', TComponent(BindScope), 'LocalidadOID', BindingsList);

  BindingHelper.setMessageKey(TComponent(notasMemo), 'Text', TComponent(BindScope), 'Notas', BindingsList);

  contactoVO:= TContacto(persistentVO);
  BindScope.DataObject := contactoVO;
end;

end.
