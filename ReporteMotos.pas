unit ReporteMotos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, QuickRpt, QRCtrls,
  Data.DB, ZAbstractRODataset, ZDataset;

type
  TReportMotos = class(TForm)
    QuickRep: TQuickRep;
    bTitle: TQRBand;
    lblTitle: TQRLabel;
    bDetail: TQRBand;
    txtPiloto: TQRDBText;
    txtNroMoto: TQRDBText;
    bGroup: TQRGroup;
    lblPiloto: TQRLabel;
    lblNroMoto: TQRLabel;
    ZSelectReporteEvento: TZReadOnlyQuery;
    DSSelectReporteEvento: TDataSource;
    bFooter: TQRBand;
    QRExpr1: TQRExpr;
    lblPagina: TQRLabel;
    QRLabel2: TQRLabel;
    QRExpr2: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
