{*************************************************}
{*  QuickReport for Delphi                       *}
{*  Demo Preview form                            *}
{*                                               *}
{*  Shows how to create your own custom preview  *}
{*  screen.                                      *}
{*                                               *}
{*************************************************}

unit Demopreview;

interface

uses
  SysUtils, Windows, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, Gauges, StdCtrls, Spin, Printers,
  ComCtrls, Buttons, QRPrntr, QuickRpt, QRCtrls, Vcl.ActnList, Vcl.ImgList,
  Vcl.ToolWin, QRPDFFilt;

type
// To have a custom preview be used as the default preview,
// you first define an interface class.  You will provide two
// functions for this class, Show, and ShowModal.
// To make this the standard preview window use this code -
//        RegisterPreviewClass( TQRSimplePreviewInterface );
//        repfrm1.quickrep1.Preview;
// You can change the name TQRSimplePreviewInterface if you like.
//
  TQRSimplePreviewInterface = class(TQRPreviewInterface)
  public
    function Show(AQRPrinter : TQRPrinter) : TWinControl; override;
    function ShowModal(AQRPrinter : TQRPrinter): TWinControl; override;
  end;

  TFormPreview = class(TForm)
    QRPreview1: TQRPreview;
    PrintDialog: TPrintDialog;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    IL_RPreview: TImageList;
    TB_RPreview: TToolBar;
    ToolButton5: TToolButton;
    TB_ZoomIn: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton10: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton14: TToolButton;
    ToolButton13: TToolButton;
    ToolButton17: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    procedure FormShow(Sender: TObject);
    procedure BtnExitClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure BBPrintClick(Sender: TObject);
    procedure BBLoadClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TB_ZoomInClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure ToolButton11Click(Sender: TObject);
    procedure ToolButton13Click(Sender: TObject);
    procedure ToolButton17Click(Sender: TObject);
    procedure ToolButton14Click(Sender: TObject);
    procedure ToolButton16Click(Sender: TObject);
  private

  public
    { Public declarations }
    procedure ShowPreview(Sender: TObject);
    constructor CreatePreview(AOwner : TComponent; aQRPrinter : TQRPrinter);
  end;

var
  FormPreview: TFormPreview;
  QRPrinter : TQRPrinter;


implementation
{$R *.DFM}

function TQRSimplePreviewInterface.Show(AQRPrinter : TQRPrinter) : TWinControl;
begin
  Result := TFormPreview.CreatePreview(Application, AQRPrinter);
  TFormPreview(Result).Show;
end;

function TQRSimplePreviewInterface.ShowModal(AQRPrinter : TQRPrinter) : TWinControl;
begin
  Result := TFormPreview.CreatePreview(Application, AQRPrinter);
  TFormPreview(Result).ShowModal;
end;

constructor TFormPreview.CreatePreview(AOwner : TComponent; aQRPrinter : TQRPrinter);
begin
  inherited Create(AOwner);
  QRPrinter            := aQRPrinter;
  QRPreview1.QRPrinter := aQRPrinter;
end;

procedure TFormPreview.ShowPreview(Sender: TObject);
begin
  ShowModal;
end;

procedure TFormPreview.TB_ZoomInClick(Sender: TObject);
begin
  QRPreview1.Zoom:= QRPreview1.Zoom+10;
end;

procedure TFormPreview.ToolButton10Click(Sender: TObject);
begin
  QRPreview1.PageNumber:= 1;
end;

procedure TFormPreview.ToolButton11Click(Sender: TObject);
begin
  QRPreview1.PageNumber:= QRPreview1.QRPrinter.PageCount;
end;

procedure TFormPreview.ToolButton13Click(Sender: TObject);
begin
  with QRPreview1.QRPrinter do
    begin
      Tag:=-1;
      PrintSetup;
      if Tag=0 then
        Print;
    end;
end;

procedure TFormPreview.ToolButton14Click(Sender: TObject);
begin
  if (SaveDialog.Execute) then
    QRPreview1.QRPrinter.ExportToFilter(TQRPDFDocumentFilter.Create(SaveDialog.FileName));
end;

procedure TFormPreview.ToolButton16Click(Sender: TObject);
begin
  Close;
end;

procedure TFormPreview.ToolButton17Click(Sender: TObject);
begin
  QRPreview1.QRPrinter.Print;
end;

procedure TFormPreview.ToolButton1Click(Sender: TObject);
begin
  QRPreview1.Zoom:= QRPreview1.Zoom-10;
end;

procedure TFormPreview.ToolButton3Click(Sender: TObject);
begin
  QRPreview1.Zoom:=100;
end;

procedure TFormPreview.ToolButton4Click(Sender: TObject);
begin
  QRPreview1.ZoomToFit;
end;

procedure TFormPreview.ToolButton6Click(Sender: TObject);
begin
  QRPreview1.ZoomToWidth;
end;

procedure TFormPreview.ToolButton8Click(Sender: TObject);
begin
 QRPreview1.PageNumber:= QRPreview1.PageNumber-1;
end;

procedure TFormPreview.ToolButton9Click(Sender: TObject);
begin
  QRPreview1.PageNumber:= QRPreview1.PageNumber+1;
end;

procedure TFormPreview.FormShow(Sender: TObject);
begin
  //PageUpDown.Max          :=QRPrinter.PageCount;
  //PageUpDown.Min          :=1;
  QRPreview1.PageNumber   :=1;
  //PageUpDown.Position     :=1;
  //LblPageNum.Caption      :=IntToStr(PageUpDown.Position);
  //LblPageCount.Caption    :=IntToStr(QRPrinter.PageCount);
  //FormPreview.WindowState  :=wsMaximized;
  QRPreview1.ZoomToFit;
  //ZoomUpDown.Position     :=QRPreview1.Zoom;
  //LblZoomSize.Caption     :=IntToStr(ZoomUpDown.Position);
  PrintDialog.ToPage      :=QRPrinter.PageCount;
  PrintDialog.MaxPage     :=QRPrinter.PageCount;
end;

procedure TFormPreview.BtnExitClick(Sender: TObject);
begin
  qrprinter := nil;
  self.Close;
end;

procedure TFormPreview.BtnPrintClick(Sender: TObject);
begin
  IF PrintDialog.Execute Then QRPrinter.Print;
end;


procedure TFormPreview.BBPrintClick(Sender: TObject);
begin
  IF PrintDialog.Execute Then QRPrinter.Print;
end;

procedure TFormPreview.BBLoadClick(Sender: TObject);
begin
 IF OpenDialog.Execute Then
    Begin
      If QRPrinter.Orientation=PoPortrait Then
        Begin
         Printer.Orientation:=PoLandscape;
         QRPrinter.Orientation:=PoLandscape;
        End
      Else
        Begin
         Printer.Orientation:=PoPortrait;
         QRPrinter.Orientation:=PoPortrait;
        End;

      QRPrinter.Load(OpenDialog.FileName);
      QRPrinter.Preview;
      FormPreview.Hide;
      FormPreview.Show;
    End
end;

procedure TFormPreview.btnSaveClick(Sender: TObject);
begin
  SaveDialog.FileName := 'Test';
  if SaveDialog.Execute then
    begin

      //Write Out Report
    end;
end;

procedure TFormPreview.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
