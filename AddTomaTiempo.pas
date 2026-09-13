unit AddTomaTiempo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, Vcl.ComCtrls, cxListView, Vcl.DBCtrls, cxTextEdit,
  cxCurrencyEdit, cxLabel, Vcl.StdCtrls, AeroButtons, Vcl.ExtCtrls, Vcl.ImgList,
  BussinessDataSubsystemFacade, cxMaskEdit, cxSpinEdit, cxTimeEdit;

type
  TAddTomaTiempoForm = class(TForm)
    mainPanel: TPanel;
    lblNumMoto: TcxLabel;
    validationPanel: TPanel;
    errorListView: TcxListView;
    buttonPanel: TPanel;
    cxButtonImageList: TcxImageList;
    btnCancel: TAeroButton;
    btnAccept: TAeroButton;
    cxErrorImageList: TcxImageList;
    txtNumMoto: TcxCurrencyEdit;
    lblTiempo: TcxLabel;
    timeEdit: TcxTimeEdit;
    procedure btnCancelClick(Sender: TObject);
    procedure btnAcceptClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure txtNumMotoKeyPress(Sender: TObject; var Key: Char);
    procedure timeEditKeyPress(Sender: TObject; var Key: Char);
  private
    procedure setTListItemsByString(errorListView : TcxListView;
      stringMessage : String; indiceEstado : Integer);
  public
    pilotoOID, eventOID, tipoCategoriaOID : Integer;
    editedTime : Boolean;
  public
    constructor Create(owner: TComponent);
  end;

implementation

{$R *.dfm}

constructor TAddTomaTiempoForm.Create(owner: TComponent);
begin
  inherited Create(owner);
  editedTime:= False;
end;

procedure TAddTomaTiempoForm.btnAcceptClick(Sender: TObject);
var
  cantidadPilotos : Integer;
begin
  if (txtNumMoto.Text > '') then
    begin
      cantidadPilotos:= TBussinessDataSubsystemFacade.getInstance.
        getCuentaPilotosByNumMotoAndTipoCategoria(StrToIntDef(txtNumMoto.Text, 0), tipoCategoriaOID, eventOID);

      if (cantidadPilotos = 1) then
        begin
            self.pilotoOID:= TBussinessDataSubsystemFacade.getInstance
              .getPilotoOIDByNumMotoAndTipoCategoria(StrToIntDef(txtNumMoto.Text, 0), tipoCategoriaOID, eventOID);
            if (self.pilotoOID > 0) then
              ModalResult:= mrOk
        end
      else if (cantidadPilotos = 0) then
        begin
          if (StrToIntDef(txtNumMoto.Text, 0) > 1000) then
            begin
              self.pilotoOID:= TBussinessDataSubsystemFacade.getInstance
                .getPilotoOIDByNumMotoAndTipoCategoria(StrToIntDef(txtNumMoto.Text, 0), 4, eventOID);
              if (self.pilotoOID > 0) then
                ModalResult:= mrOk
            end
          else
            setTListItemsByString(errorListView, 'No existe Piloto con el número ' + txtNumMoto.Text, 0);
        end
      else if (cantidadPilotos > 1) then
        begin
          setTListItemsByString(errorListView, 'Existen más de un Piloto con el número ' + txtNumMoto.Text, 0);
        end;
    end;
end;

procedure TAddTomaTiempoForm.btnCancelClick(Sender: TObject);
begin
  ModalResult:= mrCancel;
end;

procedure TAddTomaTiempoForm.FormCreate(Sender: TObject);
begin
  timeEdit.Time:= Now;
end;

procedure TAddTomaTiempoForm.setTListItemsByString(errorListView : TcxListView;
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

procedure TAddTomaTiempoForm.timeEditKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnAcceptClick(nil)
  else
    editedTime:= True;
end;

procedure TAddTomaTiempoForm.txtNumMotoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnAcceptClick(nil);
end;

end.
