unit F_EEMessage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, JvExStdCtrls, JvHtControls, JvExControls,
  JvImageSquare, ExtCtrls, ImgList, AeroButtons, cxGraphics, JvTimer;
{$WARNINGS OFF}
const
  TextWidth = 100;
type
  TF_EE_Message = class(TForm)
    Panel_Inferior: TPanel;
    Panel_Principal: TPanel;
    HTLabel_Mensaje: TJvHTLabel;
    JvImageSquare: TJvImageSquare;
    ImageList: TImageList;
    cxButtonImageList: TcxImageList;
    btnCancel: TAeroButton;
    btnAccept: TAeroButton;
    JvTimer: TJvTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure btnAcceptClick(Sender: TObject);
    procedure JvTimerTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure CreateParams(var Params: TCreateParams); override;
    function AdjustTextToScreenWidth(Mensaje:string):string;
  public
    { Public declarations }
    class function ERROR: integer;
    class function QUESTION: integer;
    class function INFORMATION: integer;
    class function WARNING: integer;
    class function ShowMessage(var owner: TComponent; TitleCaption,
      TMessage:string; ImageIndex: integer; DialogMessage: boolean; Large: Boolean = False; Seconds: Integer = 0):integer;
  end;
{$WARNINGS ON}
var
  SecondsToClose: Integer;

implementation

{$R *.dfm}
procedure TF_EE_Message.btnAcceptClick(Sender: TObject);
begin
  ModalResult:= mrOk;
end;

procedure TF_EE_Message.btnCancelClick(Sender: TObject);
begin
  ModalResult:= mrCancel;
end;

procedure TF_EE_Message.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do begin
    // Form "Stay on Top"
    ExStyle := ExStyle or WS_EX_TOPMOST;
    WndParent := GetDesktopwindow;
  end;
end;

function TF_EE_Message.AdjustTextToScreenWidth(Mensaje:string):string;
var
  sMessage, auxMessage: string;
  i,j: integer;
begin
  i:= 0;
  auxMessage:= Mensaje;
  sMessage:= '';
    while (Length(auxMessage) > TextWidth) do
      begin
        j:= 0;
        while (auxMessage[TextWidth + j] <> ' ') do
          inc(j);
        sMessage:= sMessage+Copy(auxMessage, 1, TextWidth + j) + '<br>';
        auxMessage:= Copy(Mensaje, (TextWidth*(i+1) + j + 1), Length(Mensaje));
        inc(i);
      end;
    Result:= sMessage+ Copy(auxMessage,2,Length(auxMessage));
end;

class function TF_EE_Message.ERROR: integer; 
begin
  Result:= 0;
end;

class function TF_EE_Message.QUESTION: integer;
begin
  Result:= 1;
end;

class function TF_EE_Message.INFORMATION: integer;
begin
  Result:= 2;
end;

procedure TF_EE_Message.JvTimerTimer(Sender: TObject);
begin
  Close;
end;

class function TF_EE_Message.WARNING: integer;
begin
  Result:= 3;
end;

class function TF_EE_Message.ShowMessage(var owner: TComponent; TitleCaption,
  TMessage:string; ImageIndex: integer; DialogMessage: Boolean; Large: Boolean = False; Seconds: Integer = 0):integer;
var
  F_EE_Message : TF_EE_Message;
begin
  F_EE_Message:= TF_EE_Message.Create(nil);
  try
    with F_EE_Message do
      begin
        case ImageIndex of
          0: Caption := 'Error';
          1: Caption := 'Pregunta';
          2: Caption := 'Información';
          3: Caption := '¡Atención!';
        end;

        if ((Length(TMessage) > TextWidth) and (not Large)) then
          HTLabel_Mensaje.Caption:= AdjustTextToScreenWidth(TMessage)
        else
          HTLabel_Mensaje.Caption:=TMessage;

        ImageList.GetIcon(ImageIndex, Icon);
        Caption:= Caption+' - '+TitleCaption;
        Width:= HTLabel_Mensaje.Width + 170;
        Height:= HTLabel_Mensaje.Height + 120;

        JvImageSquare.ImageIndex:=ImageIndex;
        if (DialogMessage) then
          btnCancel.Visible:= False;

        SecondsToClose:= Seconds;

        Result:=ShowModal;
      end;
  finally
    F_EE_Message.Free;
  end;

end;

procedure TF_EE_Message.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  //Release;
end;

procedure TF_EE_Message.FormShow(Sender: TObject);
begin
  if (SecondsToClose > 0) then
    begin
      Panel_Inferior.Visible:= False;
      JvTimer.Interval:= SecondsToClose*1000;
      JvTimer.Enabled:= True;
    end;
end;

end.
