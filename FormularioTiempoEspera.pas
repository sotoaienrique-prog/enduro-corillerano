unit FormularioTiempoEspera;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, AeroButtons, Vcl.ExtCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, Vcl.ImgList, cxTextEdit, cxCurrencyEdit,
  cxLabel, DataModule, BussinessDataSubsystemFacade, Vcl.DBCtrls, Data.DB,
  ZAbstractRODataset, ZDataset, F_EEMessage, Vcl.ComCtrls, cxListView, Entidades,
  ZAbstractDataset, ZAbstractTable;

type
  TAddPilotToWaitingGrid = class(TForm)
    buttonPanel: TPanel;
    mainPanel: TPanel;
    lblNumMoto: TcxLabel;
    txtNumMoto: TcxCurrencyEdit;
    cxButtonImageList: TcxImageList;
    btnClose: TAeroButton;
    topPanel: TPanel;
    DSEvento: TDataSource;
    lblFilterEvento: TcxLabel;
    cmbFilterEvento: TDBLookupComboBox;
    validationPanel: TPanel;
    errorListView: TcxListView;
    ZEvento: TZReadOnlyQuery;
    cxErrorImageList: TcxImageList;
    DSTipoCategoria: TDataSource;
    ZTipoCategoria: TZTable;
    lblTipoCategoria: TcxLabel;
    cmbTipoCategoria: TDBLookupComboBox;
    procedure txtNumMotoKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    function validatePiloto(): Boolean;
    procedure setTListItemsByString(errorListView : TcxListView;
      stringMessage : String; indiceEstado : Integer);
  public
    { Public declarations }
  end;

var
  AddPilotToWaitingGrid: TAddPilotToWaitingGrid;

implementation

{$R *.dfm}

procedure TAddPilotToWaitingGrid.FormCreate(Sender: TObject);
begin
  ZEvento.Active:= True;
  cmbFilterEvento.KeyValue:= 1;

  ZTipoCategoria.Active:= True;
  cmbTipoCategoria.KeyValue:= 1;
end;

procedure TAddPilotToWaitingGrid.txtNumMotoKeyPress(Sender: TObject; var Key: Char);
var
  pilotoOID, eventoOID: Integer;
  pilotoVO: TPiloto;
begin
  if Key = #13 then
    begin
      if (validatePiloto()) then
      begin
        eventoOID:= cmbFilterEvento.KeyValue;
        pilotoOID:= TBussinessDataSubsystemFacade.getInstance
          .getPilotoOIDByNumMotoAndTipoCategoria(StrToIntDef(txtNumMoto.Text, 0), cmbTipoCategoria.KeyValue, eventoOID);
        pilotoVO:= TBussinessDataSubsystemFacade.getInstance.getPiloto(pilotoOID);
        TBussinessDataSubsystemFacade.getInstance.addParadasPiloto(pilotoOID, cmbFilterEvento.KeyValue, cmbTipoCategoria.KeyValue);

        setTListItemsByString(errorListView, 'El Piloto ' + QuotedStr(pilotoVO.getNumeroNombreCompleto(
          cmbTipoCategoria.KeyValue)) + ' se agregó correctamente a la Lista de Espera', 1);
        txtNumMoto.Clear;
      end;
    end;
end;

function TAddPilotToWaitingGrid.validatePiloto(): Boolean;
var
  returnValue : Boolean;
  pilotoOID, eventoOID: Integer;
  inscripcionOID: Integer;
begin
  returnValue:= True;
  eventoOID:= cmbFilterEvento.KeyValue;

  validationPanel.Visible:= False;

  if (eventoOID < 1) then
  begin
    setTListItemsByString(errorListView, 'Debe seleccionar el Evento', 0);
    returnValue:= False;
  end;

  pilotoOID:= TBussinessDataSubsystemFacade.getInstance
    .getPilotoOIDByNumMotoAndTipoCategoria(StrToIntDef(txtNumMoto.Text, 0), cmbTipoCategoria.KeyValue, eventoOID);
  if ((pilotoOID < 1) and returnValue) then
  begin
    setTListItemsByString(errorListView, 'El número de la moto no se encuentra asignado a un Piloto', 0);
    returnValue:= False;
  end;

  if ((eventoOID > 0) and (pilotoOID > 0) and returnValue) then
  begin
    inscripcionOID:= TBussinessDataSubsystemFacade.getInstance.getInscripcionByPilotoOIDAndEventoOID(pilotoOID, cmbFilterEvento.KeyValue);
    if (inscripcionOID < 1) then
    begin
      setTListItemsByString(errorListView, 'El Piloto no se encuentra inscripto al Evento seleccionado', 0);
      returnValue:= False;
    end;
  end;

//  if (TBussinessDataSubsystemFacade.getInstance.existParadasPiloto(pilotoOID, eventoOID) and returnValue) then
//  begin
//   setTListItemsByString(errorListView, 'El Piloto ya se ha agregado a la Lista de Espera para el Evento seleccionado', 0);
//   returnValue:= False;
//  end;

  Result:= returnValue;
end;

procedure TAddPilotToWaitingGrid.setTListItemsByString(errorListView : TcxListView;
    stringMessage : String; indiceEstado : Integer);
var
  Index : Integer;
  stringList : TStringList;
begin
  stringList:= TStringList.Create;
  stringList.Add(stringMessage);

  errorListView.Items.Clear;

  for Index := 0 to stringList.Count - 1 do
  begin
    with errorListView.Items.Add do
    begin
      Caption := stringList[Index];
      StateIndex:= indiceEstado;
    end;
  end;

  validationPanel.Visible:= True;
end;

end.
