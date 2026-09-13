unit AgregarTomaTiempoAbastecimientoWithTime;

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
  ZAbstractDataset, ZAbstractTable, cxMaskEdit, cxSpinEdit, cxTimeEdit;

type
  TAddTomaTiempoAbastecimientoWithTime = class(TForm)
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
    timeEdit: TcxTimeEdit;
    lblTiempo: TcxLabel;
    procedure txtNumMotoKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    function validatePiloto(): Boolean;
    procedure setTListItemsByString(errorListView : TcxListView;
      stringMessage : String; indiceEstado : Integer; clear : Boolean);
  public
    { Public declarations }
  end;

var
  AddTomaTiempoAbastecimientoWithTime: TAddTomaTiempoAbastecimientoWithTime;

implementation

{$R *.dfm}

procedure TAddTomaTiempoAbastecimientoWithTime.FormCreate(Sender: TObject);
begin
  ZEvento.Active:= True;
  timeEdit.Time:= Now;
//  cmbFilterEvento.
end;

procedure TAddTomaTiempoAbastecimientoWithTime.txtNumMotoKeyPress(Sender: TObject; var Key: Char);
var
  pilotoOID, eventoOID, nroVuelta: Integer;
  pilotoVO: TPilotoImportado;
  tipoEntrada, tiempoEntrada, texto: String;
  hora : TDateTime;
begin
  if Key = #13 then
    begin
      if (validatePiloto()) then
      begin
        pilotoOID:= TBussinessDataSubsystemFacade.getInstance.getPilotoImportadoOIDByNumero(StrToIntDef(txtNumMoto.Text, 0));
        pilotoVO:= TBussinessDataSubsystemFacade.getInstance.getPilotoImportado(pilotoOID);
        nroVuelta:= TBussinessDataSubsystemFacade.getInstance.GetNroVueltaAbastecimiento(pilotoOID, cmbFilterEvento.KeyValue);

        if (nroVuelta = 0) then
        begin
            TBussinessDataSubsystemFacade.getInstance.addTiempoAbastecimientoPilotoConTiempo
              (pilotoOID, cmbFilterEvento.KeyValue, nroVuelta, pilotoVO.TiempoInicial);
          nroVuelta:= nroVuelta + 1;
        end;

        if (nroVuelta > 2) then
          begin
            setTListItemsByString(errorListView, 'El Piloto ' + QuotedStr(pilotoVO.NombreApellido) +
              ' ya tiene establecido tiempo de ENTRADA y SALIDA. ', 0, True);
          end
        ELSE
          BEGIN
            hora:= timeEdit.Time;
            ReplaceDate(hora, Date);
            TBussinessDataSubsystemFacade.getInstance.addTiempoAbastecimientoPilotoConTiempo(pilotoOID, cmbFilterEvento.KeyValue, nroVuelta, hora);

            if (nroVuelta = 1) then
              tipoEntrada := 'ENTRADA';

            if (nroVuelta = 2) then
              tipoEntrada := 'SALIDA';

            texto:= 'El Piloto ' + QuotedStr(pilotoVO.NombreApellido) +
              ' se agregó correctamente a la Lista de Abastecimiento. Tipo: ' + tipoEntrada;

            if (nroVuelta = 1) then
              begin
                  tiempoEntrada:= TBussinessDataSubsystemFacade.getInstance.getLapTimeAbast(pilotoOID, cmbFilterEvento.KeyValue, nroVuelta);
                  texto:= texto + '. Con un tiempo de ' + tiempoEntrada;
              end;

            setTListItemsByString(errorListView, texto, 1, False);

            txtNumMoto.Clear;
          END;
      end;
    end;
end;

function TAddTomaTiempoAbastecimientoWithTime.validatePiloto(): Boolean;
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
    setTListItemsByString(errorListView, 'Debe seleccionar el Evento', 0, True);
    returnValue:= False;
  end;

  pilotoOID:= TBussinessDataSubsystemFacade.getInstance.getPilotoImportadoOIDByNumero(StrToIntDef(txtNumMoto.Text, 0));
  if ((pilotoOID < 1) and returnValue) then
  begin
    setTListItemsByString(errorListView, 'El número de la moto no se encuentra asignado a un Piloto', 0, True);
    returnValue:= False;
  end;

//  if (TBussinessDataSubsystemFacade.getInstance.existParadasPiloto(pilotoOID, eventoOID) and returnValue) then
//  begin
//   setTListItemsByString(errorListView, 'El Piloto ya se ha agregado a la Lista de Espera para el Evento seleccionado', 0);
//   returnValue:= False;
//  end;

  Result:= returnValue;
end;

procedure TAddTomaTiempoAbastecimientoWithTime.setTListItemsByString(errorListView : TcxListView;
    stringMessage : String; indiceEstado : Integer; clear : Boolean);
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
