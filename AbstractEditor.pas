unit AbstractEditor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, AeroButtons,
  Vcl.ImgList, cxGraphics, Data.Bind.EngExt, Vcl.Bind.DBEngExt,
  Data.Bind.Components, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxContainer, cxEdit, cxListBox,
  Vcl.ComCtrls, cxListView, EditMemosEditor, Vcl.Menus, cxMemo, ValidationHelper,
  Entidades;

type
  TAbstractEdit = class(TForm)
    buttonPanel: TPanel;
    btnAccept: TAeroButton;
    btnCancel: TAeroButton;
    cxButtonImageList: TcxImageList;
    mainPanel: TPanel;
    BindingsList: TBindingsList;
    BindScope: TBindScope;
    cxInternalCRUDImageList: TcxImageList;
    validationPanel: TPanel;
    errorListView: TcxListView;
    cxErrorImageList: TcxImageList;
    procedure btnAcceptClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  protected
    emptyVO, persistentVO: TPersistentObject;

    procedure InitializeBinding; Virtual; Abstract;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(owner: TComponent; persistentVO: TPersistentObject); Virtual;
    procedure EditDescription(Comp:TWinControl);
    procedure AssignDoubleClickEdit(Comp:TWinControl);
    procedure DblClick(Sender: TObject);

    procedure setEditorValueObject(persistentVO : TPersistentObject); Virtual;
    function getEditorValueObject(): TPersistentObject;

    procedure ClearEditor; Virtual;
    procedure RefreshEditorData; Virtual;

    procedure setTListItemsByTStringList(errorListView : TcxListView; stringList : TStringList);
  end;

implementation

{$R *.dfm}

uses AbstractCRUD;

constructor TAbstractEdit.Create(owner: TComponent; persistentVO: TPersistentObject);
begin
  inherited Create(owner);

  self.persistentVO:= persistentVO;
  self.emptyVO:= persistentVO;

  InitializeBinding;

  RefreshEditorData;

  AssignDoubleClickEdit(mainPanel);
end;

procedure TAbstractEdit.AssignDoubleClickEdit(Comp:TWinControl);
var
  i:integer;
begin
  for i:=0 to Comp.ControlCount-1 do
    begin
      if ((Comp.Controls[i] is TcxMemo)) then
        TcxMemo(Comp.Controls[i]).OnDblClick:= DblClick;
      if (Comp.Controls[i] is TWinControl) then
        AssignDoubleClickEdit(TWinControl(Comp.Controls[i]));
    end;
end;

procedure TAbstractEdit.DblClick(Sender: TObject);
begin
  with TEditMemos.Create(Self) do
    begin
      memoEdit.Text:= TCustomEdit(Sender).Text;
      if (ShowModal = mrOk) then
        TCustomEdit(Sender).Text:= memoEdit.Text;
      Free;
    end;
end;

procedure TAbstractEdit.EditDescription(Comp:TWinControl);
var
  i:integer;
begin
  for i:=0 to Comp.ControlCount-1 do
    begin
      if (Comp.Controls[i] is TcxMemo) then
        if TCustomEdit(Comp.Controls[i]).Focused then
          with TEditMemos.Create(Self) do
          begin
            memoEdit.Text:= TCustomEdit(Comp.Controls[i]).Text;
            if (ShowModal = mrOk) then
              TCustomEdit(Comp.Controls[i]).Text:= memoEdit.Text;
            Free;
          end;
      if (Comp.Controls[i] is TWinControl) then
        EditDescription(TWinControl(Comp.Controls[i]));
    end;
end;

procedure TAbstractEdit.btnAcceptClick(Sender: TObject);

begin
  if (not self.getEditorValueObject().isValidObject()) then
    begin
      validationPanel.Visible:= True;
      setTListItemsByTStringList(errorListView,
        self.getEditorValueObject().getValidationResult);
    end
  else
    begin
      validationPanel.Visible:= False;
      TAbstractCRUDFrame(owner).requestSave(self.getEditorValueObject());
      Close;
    end;
end;

procedure TAbstractEdit.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TAbstractEdit.ClearEditor;
begin
  setEditorValueObject(self.emptyVO);
end;

procedure TAbstractEdit.setEditorValueObject(persistentVO : TPersistentObject);
begin
 self.persistentVO:= persistentVO;
 BindScope.DataObject := persistentVO;
end;

function TAbstractEdit.getEditorValueObject(): TPersistentObject;
begin
  result:= self.persistentVO;
end;

procedure TAbstractEdit.setTListItemsByTStringList(errorListView : TcxListView; stringList : TStringList);
var
  Index : Integer;
begin
  errorListView.Items.Clear;

  for Index := 0 to stringList.Count - 1 do
  begin
    with errorListView.Items.Add do
    begin
      Caption := stringList[Index];
      StateIndex:= 0;
    end;
  end;
end;

procedure TAbstractEdit.RefreshEditorData;
begin
//
end;

end.
