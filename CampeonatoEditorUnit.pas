unit CampeonatoEditorUnit;

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
  Vcl.StdCtrls, AeroButtons, Vcl.ExtCtrls, BindingHelperUnit, cxTextEdit,
  cxLabel, Entidades;

type
  TCampeonatoEditor = class(TAbstractEdit)
    lblNombre: TcxLabel;
    txtNombre: TcxTextEdit;
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

procedure TCampeonatoEditor.InitializeBinding;
var
  expression: TBindExpression;
  campeonatoVO: TCampeonato;
begin
  BindingHelper.setMessageKey(TComponent(txtNombre), 'Text', TComponent(BindScope), 'Nombre', BindingsList);

  campeonatoVO:= TCampeonato(persistentVO);
  BindScope.DataObject := campeonatoVO;
end;

procedure TCampeonatoEditor.setEditorValueObject(persistentVO : TPersistentObject);
var
  campeonatoVO: TCampeonato;
begin
  inherited;
  campeonatoVO := TCampeonato(persistentVO);
end;

procedure TCampeonatoEditor.txtNombreExit(Sender: TObject);
begin
  BindingsList.Notify(Sender, 'Text');
end;

procedure TCampeonatoEditor.txtNombreKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  BindingsList.Notify(Sender, 'Text');
end;

procedure TCampeonatoEditor.ClearEditor;
begin
  inherited;

  txtNombre.Clear;
end;

end.
