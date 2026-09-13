unit HandicupEditUnit;

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
  Vcl.StdCtrls, AeroButtons, Vcl.ExtCtrls, Entidades, BindingHelperUnit,
  cxRadioGroup, cxGroupBox, cxTextEdit, cxCurrencyEdit, cxLabel, Vcl.DBCtrls,
  Data.DB, ZAbstractRODataset, ZAbstractDataset, ZAbstractTable, ZDataset;

type
  THandicupEditor = class(TAbstractEdit)
    rgTipo: TcxRadioGroup;
    rbCategoria: TcxRadioButton;
    rbModeloMoto: TcxRadioButton;
    lblEdadBase: TcxLabel;
    lblSegundos: TcxLabel;
    txtEdadBase: TcxCurrencyEdit;
    txtSegundos: TcxCurrencyEdit;
    cmbTipoMoto: TDBLookupComboBox;
    lblTipoMoto: TcxLabel;
    lblCategoria: TcxLabel;
    cmbCategoria: TDBLookupComboBox;
    ZCategoria: TZTable;
    DSCategoria: TDataSource;
    ZTipoMoto: TZTable;
    DSTipoMoto: TDataSource;
    procedure txtEdadBaseExit(Sender: TObject);
    procedure txtEdadBaseKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cmbCategoriaExit(Sender: TObject);
    procedure cmbCategoriaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rbCategoriaExit(Sender: TObject);
    procedure rbCategoriaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure rbCategoriaClick(Sender: TObject);
    procedure rbModeloMotoClick(Sender: TObject);
  private
    procedure InitializeBinding; Override;
    procedure InitializeDataSources;
  public
    procedure setEditorValueObject(persistentVO : TPersistentObject); Override;
    procedure ClearEditor; Override;
    procedure RefreshEditorData; Override;

    constructor Create(owner: TComponent; persistentVO: TPersistentObject); Virtual;
  end;

implementation

{$R *.dfm}
constructor THandicupEditor.Create(owner: TComponent; persistentVO: TPersistentObject);
begin
  inherited Create(owner, persistentVO);

  InitializeDataSources;
end;

procedure THandicupEditor.InitializeDataSources;
begin
  ZTipoMoto.Active:= True;
  ZCategoria.Active:= True;
end;

procedure THandicupEditor.cmbCategoriaExit(Sender: TObject);
begin
  inherited;
  BindingsList.Notify(Sender, 'KeyValue');
end;

procedure THandicupEditor.cmbCategoriaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  BindingsList.Notify(Sender, 'KeyValue');
end;

procedure THandicupEditor.InitializeBinding;
var
  expression: TBindExpression;
  handicupVO: THandicup;
begin
  BindingHelper.setMessageKey(TComponent(rbCategoria), 'Checked', TComponent(BindScope), 'TipoCategoria', BindingsList);
  BindingHelper.setMessageKey(TComponent(rbModeloMoto), 'Checked', TComponent(BindScope), 'TipoMoto', BindingsList);

  BindingHelper.setMessageKey(TComponent(txtEdadBase), 'Text', TComponent(BindScope), 'Edad', BindingsList);
  BindingHelper.setMessageKey(TComponent(txtSegundos), 'Text', TComponent(BindScope), 'Segundos', BindingsList);

  BindingHelper.setMessageKey(TComponent(cmbTipoMoto), 'KeyValue', TComponent(BindScope), 'ModeloMotoOID', BindingsList);
  BindingHelper.setMessageKey(TComponent(cmbCategoria), 'KeyValue', TComponent(BindScope), 'CategoriaOID', BindingsList);

  handicupVO:= THandicup(persistentVO);
  BindScope.DataObject := handicupVO;
end;

procedure THandicupEditor.rbCategoriaClick(Sender: TObject);
begin
  inherited;

  lblCategoria.Enabled:= True;
  cmbCategoria.Enabled:= True;

  lblTipoMoto.Enabled:= False;
  cmbTipoMoto.Enabled:= False;

  cmbTipoMoto.KeyValue:= 0;
  BindingsList.Notify(cmbTipoMoto, 'KeyValue');

  lblEdadBase.Enabled:= True;
  txtEdadBase.Enabled:= True;

  lblSegundos.Caption:= 'Seg. Por Año:';
end;

procedure THandicupEditor.rbCategoriaExit(Sender: TObject);
begin
  inherited;
  BindingsList.Notify(rbCategoria, 'Checked');
  BindingsList.Notify(rbModeloMoto, 'Checked');
end;

procedure THandicupEditor.rbCategoriaMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  BindingsList.Notify(rbCategoria, 'Checked');
  BindingsList.Notify(rbModeloMoto, 'Checked');
end;

procedure THandicupEditor.rbModeloMotoClick(Sender: TObject);
begin
  inherited;
  System.Variants.NullStrictConvert := False;

  lblCategoria.Enabled:= False;
  cmbCategoria.Enabled:= False;

  cmbCategoria.KeyValue:= 0;
  BindingsList.Notify(cmbCategoria, 'KeyValue');

  lblTipoMoto.Enabled:= True;
  cmbTipoMoto.Enabled:= True;

  lblEdadBase.Enabled:= False;
  txtEdadBase.Enabled:= False;
  txtEdadBase.Clear;
  BindingsList.Notify(txtEdadBase, 'Text');

  lblSegundos.Caption:= 'Segundos:';
end;

procedure THandicupEditor.setEditorValueObject(persistentVO : TPersistentObject);
var
  handicupVO: THandicup;
begin
  inherited;
  handicupVO := THandicup(persistentVO);
end;

 procedure THandicupEditor.txtEdadBaseExit(Sender: TObject);
begin
  inherited;
  BindingsList.Notify(Sender, 'Text');
end;


procedure THandicupEditor.txtEdadBaseKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  BindingsList.Notify(Sender, 'Text');
end;

procedure THandicupEditor.ClearEditor;
begin
  inherited;

  txtEdadBase.Clear;
  txtSegundos.Clear;

  cmbCategoria.KeyValue:= 0;
  cmbTipoMoto.KeyValue:= 0;
end;

procedure THandicupEditor.RefreshEditorData;
begin
  ZTipoMoto.Close;
  ZTipoMoto.Open;

  ZCategoria.Close;
  ZCategoria.Open;
end;

end.
