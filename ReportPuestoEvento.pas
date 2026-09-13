unit ReportPuestoEvento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, QuickRpt, Vcl.ExtCtrls,
  DataModule, Data.DB, ZAbstractRODataset, ZDataset, QRCtrls;

type
  TReportePuestoEvento = class(TForm)
    QuickRep: TQuickRep;
    bTitle: TQRBand;
    bDetail: TQRBand;
    DSSelectReporteEvento: TDataSource;
    txtLocalidad: TQRDBText;
    bGroup: TQRGroup;
    lblPosicion: TQRLabel;
    lblPosValue: TQRLabel;
    txtNombreCategoria: TQRDBText;
    lblTitle: TQRLabel;
    txtEvento: TQRDBText;
    lblLocalidad: TQRLabel;
    lblPiloto: TQRLabel;
    txtPiloto: TQRDBText;
    lblNroMoto: TQRLabel;
    txtNroMoto: TQRDBText;
    lblModeloMoto: TQRLabel;
    txtModeloMoto: TQRDBText;
    lblPuntosAcumulados: TQRLabel;
    txtPuntosAcumulados: TQRDBText;
    lblPuntosFecha: TQRLabel;
    txtFecha: TQRDBText;
    lblPuestoFecha: TQRLabel;
    txtPuestoFecha: TQRDBText;
    bFooter: TQRBand;
    QRExpr1: TQRExpr;
    lblPagina: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    ZSelectReporteEvento: TZReadOnlyQuery;
    DSEvento: TDataSource;
    ZSelectEvento: TZReadOnlyQuery;
    procedure bGroupBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure bDetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  i : Integer;
implementation

{$R *.dfm}

procedure TReportePuestoEvento.FormCreate(Sender: TObject);
begin
  ZSelectReporteEvento.Active:= True;
  ZSelectEvento.Active:= True;
end;

procedure TReportePuestoEvento.bDetailBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inc(i);
  lblPosValue.Caption:= IntToStr(i);
end;

procedure TReportePuestoEvento.bGroupBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  i:= 0;
end;

end.
