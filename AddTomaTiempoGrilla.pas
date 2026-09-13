unit AddTomaTiempoGrilla;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxCustomData, cxGraphics, cxControls,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxFilter, cxData, cxDataStorage,
  cxEdit, cxCalendar, cxGridCustomTableView, cxGridTableView, cxGridCustomView,
  cxClasses, cxGridLevel, cxGrid, Vcl.StdCtrls, AeroButtons, Vcl.ExtCtrls,
  Vcl.ImgList, cxSpinEdit, cxGridDBTableView;

type
  TTAddTomaTiempoGridForm = class(TForm)
    cxButtonImageList: TcxImageList;
    cxErrorImageList: TcxImageList;
    buttonPanel: TPanel;
    btnCancel: TAeroButton;
    btnAccept: TAeroButton;
    mainPanel: TPanel;
    cxGridTomaTiempoLevel: TcxGridLevel;
    cxGridTomaTiempo: TcxGrid;
    cxGridTomaTiempoTableView: TcxGridTableView;
    cxGridTomaTiempoTableViewPiloto: TcxGridColumn;
    cxGridTomaTiempoTableViewTimestamp: TcxGridColumn;
    procedure cxGridTomaTiempoTableViewDataControllerNewRecord(
      ADataController: TcxCustomDataController; ARecordIndex: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cxGridTomaTiempoTableViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGridTomaTiempoTableViewEditKeyDown(
      Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}
procedure TTAddTomaTiempoGridForm.cxGridTomaTiempoTableViewDataControllerNewRecord(
  ADataController: TcxCustomDataController; ARecordIndex: Integer);
begin
  // Asignamos un valor inicial para que el registro no nazca "vacío"
  ADataController.Values[ARecordIndex, cxGridTomaTiempoTableViewTimestamp.Index] := Now;

  // IMPORTANTE: No asignes 0 al piloto aquí si quieres que sea opcional.
  // Déjalo sin asignar o usa Null.
end;

procedure TTAddTomaTiempoGridForm.cxGridTomaTiempoTableViewEditKeyDown(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
var
  LView: TcxGridDBTableView;
  LController: TcxGridTableController;
begin
  if Key = VK_TAB then
  begin
    Key := 0;

    LView := TcxGridDBTableView(Sender);
    LController := LView.Controller;

    LController.EditingController.HideEdit(True);

    // Usamos LView.DataController en vez de LController.DataController
    if LController.FocusedRowIndex < LView.DataController.RowCount - 1 then
      LController.FocusedRowIndex := LController.FocusedRowIndex + 1;

    LController.EditingController.ShowEdit;
  end;
end;

procedure TTAddTomaTiempoGridForm.cxGridTomaTiempoTableViewKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
var
  LView: TcxGridDBTableView;
  LController: TcxGridTableController;
begin
  if Key = VK_TAB then
  begin
    Key := 0;

    LView := TcxGridDBTableView(Sender);
    LController := LView.Controller;

    LController.EditingController.HideEdit(True);

    // Usamos LView.DataController en vez de LController.DataController
    if LController.FocusedRowIndex < LView.DataController.RowCount - 1 then
      LController.FocusedRowIndex := LController.FocusedRowIndex + 1;

    LController.EditingController.ShowEdit;
  end;
end;

procedure TTAddTomaTiempoGridForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  LDC: TcxCustomDataController;
  NewIdx: Integer;
begin
  if Key = VK_RETURN then
  begin
    LDC := cxGridTomaTiempoTableView.DataController;

    // 1. Forzar fin de edición
    cxGridTomaTiempoTableView.Controller.EditingController.HideEdit(True);

    // 2. Postear lo anterior
    LDC.Post;

    // 3. EN LUGAR DE APPEND: Vamos a forzar la creación de un nuevo registro
    // RecordCount + 1 obliga al DataController a expandir el buffer interno
    LDC.RecordCount := LDC.RecordCount + 1;

    // 4. El nuevo registro siempre será el último
    NewIdx := LDC.RecordCount - 1;

    // 5. ASIGNAR VALORES DIRECTOS AL BUFFER
    // Esto es lo más importante: asignamos a NewIdx, NO a FocusedRecordIndex
    LDC.Values[NewIdx, cxGridTomaTiempoTableViewTimestamp.Index] := Now;
    LDC.Values[NewIdx, cxGridTomaTiempoTableViewPiloto.Index] := 0;

    // 6. Sincronizar la vista con el nuevo registro
    LDC.FocusedRecordIndex := NewIdx;

    // 7. Forzar foco a la columna piloto para empezar a escribir
    cxGridTomaTiempoTableView.Controller.FocusedColumn := cxGridTomaTiempoTableViewPiloto;

    Key := 0;
  end

  // --- LÓGICA PARA ELIMINAR (SUPR / DELETE) ---
  else if Key = VK_DELETE then
  begin
    // 1. Opcional: Confirmar con el usuario
    if MessageDlg('¿Desea eliminar el registro seleccionado?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      // 2. Ejecutar la eliminación del registro enfocado
      cxGridTomaTiempoTableView.DataController.DeleteFocused;

      // 3. Limpiar la tecla para que no se propague el evento
      Key := 0;
    end;
  end;
end;

{var
  LDataController: TcxCustomDataController;
begin
  if Key = VK_RETURN then
  begin
    LDataController := cxGridTomaTiempoTableView.DataController;

    // 1. Forzar cierre de edición
    if cxGridTomaTiempoTableView.Controller.EditingController.IsEditing then
      cxGridTomaTiempoTableView.Controller.EditingController.HideEdit(True);

    // 2. Forzar el guardado del registro que acabamos de "completar"
    LDataController.Post;

    // 3. Insertar el nuevo registro
    LDataController.Append;

    // 4. LA CLAVE: Asignar el valor DIRECTAMENTE al buffer después del Append
    // Esto marca el registro como "Dirty" y evita que se pise.
    // Usamos el FocusedRecordIndex que ahora apunta al nuevo registro.
    LDataController.Values[LDataController.FocusedRecordIndex,
                           cxGridTomaTiempoTableViewTimestamp.Index] := Now;

    // 5. Opcional: Asignar un valor vacío o null al piloto para inicializar la celda
    LDataController.Values[LDataController.FocusedRecordIndex,
                           cxGridTomaTiempoTableViewPiloto.Index] := Unassigned;

    // 6. Colocar el cursor en la columna Piloto para que el usuario pueda escribir
    cxGridTomaTiempoTableView.Controller.FocusedColumn := cxGridTomaTiempoTableViewPiloto;

    Key := 0;
  end;
end;}

end.
