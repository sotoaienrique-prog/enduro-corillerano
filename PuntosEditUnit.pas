unit PuntosEditUnit;

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
  Vcl.StdCtrls, AeroButtons, Vcl.ExtCtrls, cxLabel, cxTextEdit, cxCurrencyEdit,
  Entidades, BindingHelperUnit;

type
  TPuntosEditor = class(TAbstractEdit)
    lblPuesto: TcxLabel;
    lblPuntos: TcxLabel;
    lblPuntosExtra: TcxLabel;
    txtPuesto: TcxCurrencyEdit;
    txtPuntos: TcxCurrencyEdit;
    txtPuntosExtra: TcxCurrencyEdit;
    procedure txtPuestoExit(Sender: TObject);
    procedure txtPuestoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure InitializeBinding; Override;
  public
    procedure setEditorValueObject(persistentVO : TPersistentObject); Override;
    procedure ClearEditor; Override;
  end;

implementation

{$R *.dfm}

procedure TPuntosEditor.txtPuestoExit(Sender: TObject);
begin
  inherited;
  BindingsList.Notify(Sender, 'Text');
end;

procedure TPuntosEditor.txtPuestoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  BindingsList.Notify(Sender, 'Text');
end;

procedure TPuntosEditor.InitializeBinding;
var
  expression: TBindExpression;
  puntosVO: TPuntos;
begin
  BindingHelper.setMessageKey(TComponent(txtPuesto), 'Text', TComponent(BindScope), 'Posicion', BindingsList);
  BindingHelper.setMessageKey(TComponent(txtPuntos), 'Text', TComponent(BindScope), 'Puntos', BindingsList);
  BindingHelper.setMessageKey(TComponent(txtPuntosExtra), 'Text', TComponent(BindScope), 'PuntosExtra', BindingsList);

  puntosVO:= TPuntos(persistentVO);
  BindScope.DataObject := puntosVO;
end;

procedure TPuntosEditor.setEditorValueObject(persistentVO : TPersistentObject);
var
  puntosVO: TPuntos;
begin
  inherited;
  puntosVO := TPuntos(puntosVO);
end;

procedure TPuntosEditor.ClearEditor;
begin
  inherited;

  txtPuesto.Clear;
  txtPuntos.Clear;
  txtPuntosExtra.Clear;

end;

end.
