unit PilotEditorInnerUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, PilotEditorUnit, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, Vcl.ComCtrls, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Data.DB, ZAbstractRODataset, ZAbstractDataset,
  ZAbstractTable, ZDataset, Data.Bind.Components, Vcl.ImgList, cxListView,
  cxCheckBox, cxCurrencyEdit, Vcl.DBCtrls, AdvDateTimePicker, cxMaskEdit,
  cxTextEdit, cxLabel, Vcl.StdCtrls, AeroButtons, Vcl.ExtCtrls, Entidades,
  BindingHelperUnit, cxMemo, MotoCRUDUnit, MotoEditorInnerUnit, LoginForm,
  F_EEMessage, AbstractCRUD;

type
  TPilotInnerEditor = class(TPilotEditor)
    procedure btnAddTipoMotoClick(Sender: TObject);
    procedure btnAcceptClick(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(owner: TComponent; persistentVO: TPersistentObject; showConfirmationMessage: Boolean = True); Virtual;
  end;

var
  motoCRUD : TMotoCRUD;
  motoEditor : TMotoEditorInner;

implementation

{$R *.dfm}

procedure TPilotInnerEditor.btnAcceptClick(Sender: TObject);
var
  pilotReport: String;
  pilotoVO: TPiloto;
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
      TAbstractCRUDFrame(owner).requestSave(self.getEditorValueObject());
      ModalResult:= mrOk;
    end;
end;

procedure TPilotInnerEditor.btnAddTipoMotoClick(Sender: TObject);
var
  motoVO : TMoto;
begin
  try
    motoVO:= TMoto.Create;

    if (not Assigned(motoCRUD)) then
      motoCRUD:= TMotoCRUD.Create(nil);

    if (not Assigned(motoEditor)) then
      motoEditor:= TMotoEditorInner.Create(motoCRUD, motoVO);

    motoEditor.ClearEditor;
    motoEditor.Show;
  finally
    ZTipoMoto.Close;
    ZTipoMoto.Open;
  end;
end;

constructor TPilotInnerEditor.Create(owner: TComponent; persistentVO: TPersistentObject; showConfirmationMessage: Boolean = True);
begin
  inherited Create(owner, persistentVO, showConfirmationMessage);

  cmbLocalidad.KeyValue:= TPiloto(persistentVO).LocalidadOID;
  TPiloto(persistentVO).ValidacionNumericaCategoria:= True;
end;


end.
