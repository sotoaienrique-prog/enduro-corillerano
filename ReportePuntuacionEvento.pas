unit ReportePuntuacionEvento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, QuickRpt, Data.DB,
  ZAbstractRODataset, ZDataset, QRCtrls;

type
  TReportPuntuacionEvento = class(TForm)
    QuickRep: TQuickRep;
    ZSelectReportePuntuacion: TZReadOnlyQuery;
    DSSelectReportePuntuacion: TDataSource;
    bTitle: TQRBand;
    lblTitle: TQRLabel;
    QRLabel2: TQRLabel;
    bDetail: TQRBand;
    txtPiloto: TQRDBText;
    txtNroMoto: TQRDBText;
    txtModeloMoto: TQRDBText;
    txtPuntosAcumulados: TQRDBText;
    bFooter: TQRBand;
    QRExpr1: TQRExpr;
    lblPagina: TQRLabel;
    bGroup: TQRGroup;
    lblPosicion: TQRLabel;
    txtNombreCategoria: TQRDBText;
    lblPiloto: TQRLabel;
    lblNroMoto: TQRLabel;
    lblModeloMoto: TQRLabel;
    lblPuntosAcumulados: TQRLabel;
    txtPuestoAcumulados: TQRDBText;
    DSEvento: TDataSource;
    ZSelectEvento: TZReadOnlyQuery;
    txtEvento: TQRDBText;
    lblLocalidad: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    procedure bDetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure bGroupBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  i : Integer;

implementation

{$R *.dfm}

procedure TReportPuntuacionEvento.bDetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inc(i);
end;

procedure TReportPuntuacionEvento.bGroupBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
  i:= 0;
end;

end.
