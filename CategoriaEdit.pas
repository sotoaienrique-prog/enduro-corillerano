unit CategoriaEdit;

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
  Vcl.StdCtrls, AeroButtons, Vcl.ExtCtrls, cxCurrencyEdit, cxTextEdit, cxLabel,
  Entidades, BindingHelperUnit, Vcl.DBCtrls, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZAbstractTable, ZDataset, cxCheckBox;

type
  TCategoriaEditor = class(TAbstractEdit)
    gbDatosGenerales: TGroupBox;
    lblNombre: TcxLabel;
    txtNombre: TcxTextEdit;
    gbNumeracion: TGroupBox;
    lblInicial: TcxLabel;
    txtInicial: TcxCurrencyEdit;
    lblFinal: TcxLabel;
    txtFinal: TcxCurrencyEdit;
    lblTipoCategoria: TcxLabel;
    cmbTipoCategoria: TDBLookupComboBox;
    ZTipoCategoria: TZTable;
    DSTipoCategoria: TDataSource;
    gbValorSeguro: TGroupBox;
    lblValorSeguro: TcxLabel;
    txtValorSeguro: TcxCurrencyEdit;
    lblValorSeguroTexto: TcxLabel;
    txtValorSeguroTexto: TcxTextEdit;
    gbRangoEdades: TGroupBox;
    lblMinima: TcxLabel;
    txtMinima: TcxCurrencyEdit;
    lblMaxima: TcxLabel;
    txtMaxima: TcxCurrencyEdit;
    gbHandicup: TGroupBox;
    chkHandicupEdad: TcxCheckBox;
    chkHandicupMoto: TcxCheckBox;
    GroupBox1: TGroupBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    txtOrganizador: TcxCurrencyEdit;
    txtCordillerano: TcxCurrencyEdit;
    chkUtilizaAcompaniante: TcxCheckBox;
    procedure txtNombreExit(Sender: TObject);
    procedure txtNombreKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cmbTipoCategoriaExit(Sender: TObject);
    procedure cmbTipoCategoriaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chkHandicupEdadClick(Sender: TObject);
    procedure chkHandicupEdadExit(Sender: TObject);
    procedure chkHandicupEdadFocusChanged(Sender: TObject);
    procedure txtOrganizadorExit(Sender: TObject);
    procedure txtOrganizadorFocusChanged(Sender: TObject);
    procedure txtOrganizadorKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure InitializeBinding; Override;
  public
    procedure setEditorValueObject(persistentVO : TPersistentObject); Override;
    procedure ClearEditor; Override;
    procedure RefreshEditorData; Override;
  end;

implementation

{$R *.dfm}

procedure TCategoriaEditor.cmbTipoCategoriaExit(Sender: TObject);
begin
  inherited;
  BindingsList.Notify(Sender, 'KeyValue');
end;

procedure TCategoriaEditor.cmbTipoCategoriaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  BindingsList.Notify(Sender, 'KeyValue');
end;

procedure TCategoriaEditor.InitializeBinding;
var
  expression: TBindExpression;
  categoriaVO: TCategoria;
begin
  BindingHelper.setMessageKey(TComponent(txtNombre), 'Text', TComponent(BindScope), 'Nombre', BindingsList);
  BindingHelper.setMessageKey(TComponent(cmbTipoCategoria), 'KeyValue', TComponent(BindScope), 'TipoCategoriaOID', BindingsList);
  BindingHelper.setMessageKey(TComponent(txtValorSeguro), 'Text', TComponent(BindScope), 'ValorSeguro', BindingsList);
  BindingHelper.setMessageKey(TComponent(txtValorSeguroTexto), 'Text', TComponent(BindScope), 'ValorSeguroTexto', BindingsList);
  BindingHelper.setMessageKey(TComponent(txtMinima), 'Text', TComponent(BindScope), 'EdadMinima', BindingsList);
  BindingHelper.setMessageKey(TComponent(txtMaxima), 'Text', TComponent(BindScope), 'EdadMaxima', BindingsList);
  BindingHelper.setMessageKey(TComponent(txtInicial), 'Text', TComponent(BindScope), 'NumeracionInicial', BindingsList);
  BindingHelper.setMessageKey(TComponent(txtFinal), 'Text', TComponent(BindScope), 'NumeracionFinal', BindingsList);
  BindingHelper.setMessageKey(TComponent(chkHandicupEdad), 'Checked', TComponent(BindScope), 'HandicupEdad', BindingsList);
  BindingHelper.setMessageKey(TComponent(chkHandicupMoto), 'Checked', TComponent(BindScope), 'HandicupMoto', BindingsList);
  BindingHelper.setMessageKey(TComponent(txtOrganizador), 'Value', TComponent(BindScope), 'ValorOrganizador', BindingsList);
  BindingHelper.setMessageKey(TComponent(txtCordillerano), 'Value', TComponent(BindScope), 'ValorCordillerano', BindingsList);
  BindingHelper.setMessageKey(TComponent(chkUtilizaAcompaniante), 'Checked', TComponent(BindScope), 'UtilizaAcompaniante', BindingsList);
  categoriaVO:= TCategoria(persistentVO);
  BindScope.DataObject := categoriaVO;
end;

procedure TCategoriaEditor.setEditorValueObject(persistentVO : TPersistentObject);
var
  categoriaVO: TCategoria;
begin
  inherited;
  categoriaVO := TCategoria(persistentVO);
end;

procedure TCategoriaEditor.txtNombreExit(Sender: TObject);
begin
  inherited;
  BindingsList.Notify(Sender, 'Text');
end;

procedure TCategoriaEditor.txtNombreKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  BindingsList.Notify(Sender, 'Text');
end;

procedure TCategoriaEditor.txtOrganizadorExit(Sender: TObject);
begin
  inherited;
  BindingsList.Notify(Sender, 'Value');
end;

procedure TCategoriaEditor.txtOrganizadorFocusChanged(Sender: TObject);
begin
  inherited;
  BindingsList.Notify(Sender, 'Value');
end;

procedure TCategoriaEditor.txtOrganizadorKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  BindingsList.Notify(Sender, 'Value');
end;

procedure TCategoriaEditor.chkHandicupEdadClick(Sender: TObject);
begin
  inherited;
  BindingsList.Notify(Sender, 'Checked');
end;

procedure TCategoriaEditor.chkHandicupEdadExit(Sender: TObject);
begin
  inherited;
  BindingsList.Notify(Sender, 'Checked');
end;

procedure TCategoriaEditor.chkHandicupEdadFocusChanged(Sender: TObject);
begin
  inherited;
  BindingsList.Notify(Sender, 'Checked');
end;

procedure TCategoriaEditor.ClearEditor;
begin
  inherited;

  txtNombre.Clear;
  cmbTipoCategoria.KeyValue:= 0;

  txtInicial.Clear;
  txtFinal.Clear;

  chkHandicupEdad.Checked:= False;
  chkHandicupMoto.Checked:= False;

  txtOrganizador.Clear;
  txtCordillerano.Clear;
end;

procedure TCategoriaEditor.RefreshEditorData;
begin
  ZTipoCategoria.Close;
  ZTipoCategoria.Open;
end;

end.
