unit F_CustReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRPrntr, ActnList, ImgList, ComCtrls, ToolWin, ExtCtrls,
  QRPDFFilt, JvDialogs;
type
  TQRCustomPreviewInterface = class(TQRPreviewInterface)
  public
   function Show(AQRPrinter : TQRPrinter): TWinControl; override;
   function ShowModal(AQRPrinter : TQRPrinter): TWinControl; override;
  end;
{$WARNINGS OFF}
  TCustPreview = class(TForm)
    StatusBar: TStatusBar;
    P_ToolBar: TPanel;
    TB_RPreview: TToolBar;
    TB_ZoomIn: TToolButton;
    IL_RPreview: TImageList;
    AL_ToolBar: TActionList;
    ZoomIn: TAction;
    ToolButton1: TToolButton;
    ZoomOut: TAction;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    Zoom100: TAction;
    ToolButton4: TToolButton;
    ZoomToFit: TAction;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ZoomToWidth: TAction;
    ToolButton7: TToolButton;
    NextPage: TAction;
    PreviousPage: TAction;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    FirstPage: TAction;
    LastPage: TAction;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    Print: TAction;
    ToolButton13: TToolButton;
    PrinterSetup: TAction;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    Close: TAction;
    ToolButton17: TToolButton;
    Export: TAction;
    JvSaveDialog: TJvSaveDialog;
    QR_Preview: TQRPreview;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZoomInExecute(Sender: TObject);
    procedure ZoomOutExecute(Sender: TObject);
    procedure ZoomOutUpdate(Sender: TObject);
    procedure Zoom100Execute(Sender: TObject);
    procedure ZoomToFitExecute(Sender: TObject);
    procedure ZoomToWidthExecute(Sender: TObject);
    procedure QR_PreviewPageAvailable(Sender: TObject; PageNum: Integer);
    procedure NextPageExecute(Sender: TObject);
    procedure PreviousPageExecute(Sender: TObject);
    procedure NextPageUpdate(Sender: TObject);
    procedure FirstPageExecute(Sender: TObject);
    procedure LastPageExecute(Sender: TObject);
    procedure PrintExecute(Sender: TObject);
    procedure PrinterSetupExecute(Sender: TObject);
     procedure ExportExecute(Sender: TObject);
  private
    { Private declarations }
    fQRPrinter: TQRPrinter;
  public
    { Public declarations }
    constructor Create(AOwner : TComponent; AQRPrinter : TQRPrinter); virtual;
  end;
{$WARNINGS ON}
var
  CustPreview: TCustPreview;

implementation

{$R *.dfm}

function TQRCustomPreviewInterface.Show(AQRPrinter: TQRPrinter): TWinControl;
var
 frm : TCustPreview;
begin
 frm := TCustPreview.Create(Application, AQRPrinter);
 frm.Show;
 Result := frm;
end;

function TQRCustomPreviewInterface.ShowModal(AQRPrinter: TQRPrinter): TWinControl;
var
 frm : TCustPreview;
begin
 frm := TCustPreview.Create(Application, AQRPrinter);
 frm.ShowModal;
 Result := frm;
end;

constructor TCustPreview.Create(AOwner: TComponent; AQRPrinter: TQRPrinter);
begin
 inherited Create(AOwner);
 fQRPrinter := AQRPrinter;
 QR_Preview.QRPrinter := AQRPrinter;
end;

procedure TCustPreview.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fQRPrinter.ClosePreview(Self);
  Action := caFree;
end;

procedure TCustPreview.ZoomInExecute(Sender: TObject);
begin
  QR_Preview.Zoom:= QR_Preview.Zoom+10;
end;

procedure TCustPreview.ZoomOutExecute(Sender: TObject);
begin
  QR_Preview.Zoom:= QR_Preview.Zoom-10;
end;

procedure TCustPreview.ZoomOutUpdate(Sender: TObject);
begin
  QR_Preview.UpdateZoom;
  StatusBar.Panels[1].Text:= ' '+IntToStr(QR_Preview.Zoom)+'%';
//  TToolButton(Sender).Down:=True;
end;

procedure TCustPreview.Zoom100Execute(Sender: TObject);
begin
  QR_Preview.Zoom:=100;
end;

procedure TCustPreview.ZoomToFitExecute(Sender: TObject);
begin
  QR_Preview.ZoomToFit;
end;

procedure TCustPreview.ZoomToWidthExecute(Sender: TObject);
begin
  QR_Preview.ZoomToWidth;
end;

procedure TCustPreview.QR_PreviewPageAvailable(Sender: TObject; PageNum: Integer);
begin
  StatusBar.Panels[3].Text:= QR_Preview.QRPrinter.Title;
  Caption:= 'Título del Reporte: ' + QR_Preview.QRPrinter.Title;
  StatusBar.Panels[2].Text:= 'Página '+ IntToStr(QR_Preview.QRPrinter.PageNumber)+ ' de '+ IntToStr(QR_Preview.QRPrinter.PageCount);
end;

procedure TCustPreview.NextPageExecute(Sender: TObject);
begin
  QR_Preview.PageNumber:= QR_Preview.PageNumber+1;
end;

procedure TCustPreview.PreviousPageExecute(Sender: TObject);
begin
  QR_Preview.PageNumber:= QR_Preview.PageNumber-1;
end;

procedure TCustPreview.NextPageUpdate(Sender: TObject);
begin
  StatusBar.Panels[2].Text:= 'Página '+ IntToStr(QR_Preview.PageNumber)+ ' de '+ IntToStr(QR_Preview.QRPrinter.PageCount);
end;

procedure TCustPreview.FirstPageExecute(Sender: TObject);
begin
  QR_Preview.PageNumber:= 1;
end;

procedure TCustPreview.LastPageExecute(Sender: TObject);
begin
  QR_Preview.PageNumber:= QR_Preview.QRPrinter.PageCount;
end;

procedure TCustPreview.PrintExecute(Sender: TObject);
begin
  QR_Preview.QRPrinter.Print;
end;

procedure TCustPreview.PrinterSetupExecute(Sender: TObject);
begin
  with QR_Preview.QRPrinter do
    begin
      Tag:=-1;
      PrintSetup;
      if Tag=0 then
        Print;
    end;
end;

procedure TCustPreview.ExportExecute(Sender: TObject);
begin
  if (JvSaveDialog.Execute) then
    QR_Preview.QRPrinter.ExportToFilter(TQRPDFDocumentFilter.Create(JvSaveDialog.FileName));
end;

end.
