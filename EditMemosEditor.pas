unit EditMemosEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, JvComponentBase, JvFormPlacement,
  AeroButtons, Vcl.ImgList, cxGraphics;

type
  TEditMemos = class(TForm)
    editPanel: TPanel;
    memoEdit: TMemo;
    cxButtonImageList: TcxImageList;
    buttonPanel: TPanel;
    btnAccept: TAeroButton;
    btnCancel: TAeroButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
