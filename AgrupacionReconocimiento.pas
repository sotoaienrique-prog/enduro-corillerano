unit AgrupacionReconocimiento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, AeroButtons,
  Vcl.ImgList, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, Data.DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  cxTextEdit, cxLabel, ZAbstractRODataset, ZDataset, EditAgrupacionTomaTiempos,
  DataModule, F_EEMessage, ZAbstractDataset;

type
  TAgrupacionReconocimientoForm = class(TForm)
    topPanel: TPanel;
    rightPanel: TPanel;
    mainPanel: TPanel;
    cxButtonImageList: TcxImageList;
    btnNew: TAeroButton;
    btnDelete: TAeroButton;
    lblNombre: TcxLabel;
    txtNombre: TcxTextEdit;
    cxGrid: TcxGrid;
    cxGridDBTableView: TcxGridDBTableView;
    cxGridLevel: TcxGridLevel;
    DSAgrupacion: TDataSource;
    ZAgrupacion: TZReadOnlyQuery;
    cxFilterImageList: TcxImageList;
    btnFilter: TAeroButton;
    cxGridDBTableViewnombre: TcxGridDBColumn;
    cxGridDBTableViewtipo_agrupacion: TcxGridDBColumn;
    cxGridDBTableViewtipo_toma_tiempo: TcxGridDBColumn;
    btnNewTT: TAeroButton;
    ZDeleteAgrupacoin: TZQuery;
    procedure btnFilterClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnNewTTClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
  private
    { Private declarations }
    procedure filtrarLista;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TAgrupacionReconocimientoForm.btnNewClick(Sender: TObject);
begin
  with TEdicionAgrupacion.Create(self) do
    begin
      enableAddAgrupacion;

      ShowModal;
      Free;
    end;

  with ZAgrupacion do
    begin
      Close;
      ParamByName('nombre').AsString:= txtNombre.Text;
      Open;
    end;
end;

procedure TAgrupacionReconocimientoForm.btnNewTTClick(Sender: TObject);
begin
  with TEdicionAgrupacion.Create(self) do
    begin
      agrupacionTomaTiempoOID:= Self.ZAgrupacion.FieldByName('oid').AsInteger;
      tipoTomaTiempo:= Self.ZAgrupacion.FieldByName('tipo_toma_tiempo').AsString;
      enableAddTomaTiempos;

      ShowModal;
      Free;
    end;
end;

procedure TAgrupacionReconocimientoForm.filtrarLista;
begin
  with ZAgrupacion do
    begin
      Close;
      ParamByName('nombre').AsString:= txtNombre.Text;
      Open;
    end;
end;

procedure TAgrupacionReconocimientoForm.FormCreate(Sender: TObject);
begin
  filtrarLista;
end;

procedure TAgrupacionReconocimientoForm.btnDeleteClick(Sender: TObject);
begin
  if (TF_EE_Message.ShowMessage(TComponent(Self),'Confirmación de eliminación de Elemento',
    '¿Está seguro que desea eliminar el elemento seleccionado?', TF_EE_Message.QUESTION, False) = mrOk) then
  begin
    with ZDeleteAgrupacoin do
      begin
        Close;
        ParamByName('oid').AsInteger:= ZAgrupacion.FieldByName('oid').AsInteger;
        ExecSQL;
      end;

      with ZAgrupacion do
        begin
          Close;
          ParamByName('nombre').AsString:= txtNombre.Text;
          Open;
        end;
  end;
end;

procedure TAgrupacionReconocimientoForm.btnFilterClick(Sender: TObject);
begin
  filtrarLista;
end;

end.
