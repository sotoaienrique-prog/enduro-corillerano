unit NumeracionDisponibleEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, DataModule, Data.DB,
  ZAbstractRODataset, ZDataset, ZAbstractDataset, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  cxGridCardView, cxGridDBCardView, cxGridCustomLayoutView, cxContainer,
  Vcl.DBCtrls, cxLabel, ZAbstractTable, JvExExtCtrls, JvNetscapeSplitter,
  Vcl.ImgList, Vcl.StdCtrls, AeroButtons;

type
  TFormNumeracionDisponible = class(TForm)
    catPanel: TPanel;
    caMainPanel: TPanel;
    ZCategorias: TZReadOnlyQuery;
    cxGridNumeracion: TcxGrid;
    cxGridNumeracionLevel: TcxGridLevel;
    DSNumeracion: TDataSource;
    ZNumeracion: TZReadOnlyQuery;
    cxGridNumeracionDBCardView1: TcxGridDBCardView;
    cxGridNumeracionDBCardView1num_moto: TcxGridDBCardViewRow;
    cxGridNumeracionDBCardView1Row1: TcxGridDBCardViewRow;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    DSCategorias: TDataSource;
    cxLabel2: TcxLabel;
    cmbCategoria: TDBLookupComboBox;
    ZCategoria: TZTable;
    ZCategoriaoid: TIntegerField;
    ZCategorianombre: TWideStringField;
    ZCategoriatipo_categoria_oid: TSmallintField;
    JvNetscapeSplitter: TJvNetscapeSplitter;
    buttonPanel: TPanel;
    btnAccept: TAeroButton;
    cxButtonImageList: TcxImageList;
    procedure FormShow(Sender: TObject);
    procedure cmbCategoriaCloseUp(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxGridNumeracionDBCardView1DblClick(Sender: TObject);
    procedure btnAcceptClick(Sender: TObject);
  private
    procedure generateTabla(CategoriaOID : Integer);
  public
    CategoriaOID: Integer;
  end;

implementation

{$R *.dfm}

procedure TFormNumeracionDisponible.generateTabla(CategoriaOID : Integer);
begin
  with ZCategorias do
    begin
      Close;
      ParamByName('categoria_oid').AsInteger:= CategoriaOID;
      Open;

      self.Caption:= 'Numeración Disponible: ' + FieldByName('nombre').AsString;
    end;

  with ZNumeracion do
    begin
      Close;
      ParamByName('tipoCategoria').AsInteger:= ZCategorias.FieldByName('tipo_categoria_oid').AsInteger;
      ParamByName('inicio').AsInteger:= ZCategorias.FieldByName('Inicio').AsInteger;
      ParamByName('fin').AsInteger:= ZCategorias.FieldByName('fin').AsInteger;
      Open;
    end;
end;

procedure TFormNumeracionDisponible.btnAcceptClick(Sender: TObject);
begin
if Length(ZNumeracion.FieldByName('competidor').AsString) = 0 then
    ModalResult:= MrOK;
end;

procedure TFormNumeracionDisponible.cmbCategoriaCloseUp(Sender: TObject);
begin
  generateTabla(cmbCategoria.KeyValue);
end;

procedure TFormNumeracionDisponible.cxGridNumeracionDBCardView1DblClick(
  Sender: TObject);
begin
  if Length(ZNumeracion.FieldByName('competidor').AsString) = 0 then
    ModalResult:= MrOK;
end;

procedure TFormNumeracionDisponible.FormCreate(Sender: TObject);
begin
  ZCategoria.Active:= True;
end;

procedure TFormNumeracionDisponible.FormShow(Sender: TObject);
begin
  cmbCategoria.KeyValue:=  CategoriaOID;

  generateTabla(CategoriaOID);

  JvNetscapeSplitter.Maximized:= True;
end;

end.
