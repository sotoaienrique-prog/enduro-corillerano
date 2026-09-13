unit MotoEditorUnit;

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
  Vcl.StdCtrls, AeroButtons, Vcl.ExtCtrls, cxTextEdit, cxLabel, Entidades,
  BindingHelperUnit, cxCurrencyEdit;

type
  TMotoEditor = class(TAbstractEdit)
    gbDatosGenerales: TGroupBox;
    lblNombre: TcxLabel;
    txtNombre: TcxTextEdit;
    lblPtosExtra: TcxLabel;
    txtPtosExtra: TcxCurrencyEdit;
    procedure txtNombreExit(Sender: TObject);
    procedure txtNombreKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure InitializeBinding; Override;
  public
    procedure setEditorValueObject(persistentVO : TPersistentObject); Override;
    procedure ClearEditor; Override;
  end;

implementation

{$R *.dfm}
procedure TMotoEditor.InitializeBinding;
var
  expression: TBindExpression;
  categoriaVO: TCategoria;
begin
  BindingHelper.setMessageKey(TComponent(txtNombre), 'Text', TComponent(BindScope), 'Nombre', BindingsList);
  BindingHelper.setMessageKey(TComponent(txtPtosExtra), 'Text', TComponent(BindScope), 'PuntosExtra', BindingsList);

  categoriaVO:= TCategoria(persistentVO);
  BindScope.DataObject := categoriaVO;
end;

procedure TMotoEditor.setEditorValueObject(persistentVO : TPersistentObject);
var
  motoVO: TMoto;
begin
  inherited;
  motoVO := TMoto(persistentVO);
end;

procedure TMotoEditor.txtNombreExit(Sender: TObject);
begin
  inherited;
  BindingsList.Notify(Sender, 'Text');
end;

procedure TMotoEditor.txtNombreKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  BindingsList.Notify(Sender, 'Text');
end;

procedure TMotoEditor.ClearEditor;
begin
  inherited;

  txtNombre.Clear;
end;

end.
