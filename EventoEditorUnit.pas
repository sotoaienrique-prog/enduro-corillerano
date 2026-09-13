unit EventoEditorUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AbstractEditor, Vcl.ComCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, Data.Bind.EngExt, Vcl.Bind.DBEngExt,
  Data.Bind.Components, Vcl.ImgList, cxContainer, cxEdit, cxListView,
  Vcl.StdCtrls, AeroButtons, Vcl.ExtCtrls, Entidades, BindingHelperUnit,
  cxTextEdit, cxLabel, Vcl.DBCtrls, AdvDateTimePicker, cxCurrencyEdit, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZAbstractTable, ZDataset, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxGroupBox, JvMemoryDataset, System.Generics.Collections,
  cxCheckBox;

type
  TEventEditor = class(TAbstractEdit)
    gbDatosGenerales: TGroupBox;
    lblNombre: TcxLabel;
    txtNombre: TcxTextEdit;
    lblFecha: TcxLabel;
    dtpFecha: TAdvDateTimePicker;
    gbPista: TGroupBox;
    cxLabel2: TcxLabel;
    cmbCampeonato: TDBLookupComboBox;
    ZTProvincia: TZTable;
    ZTLocalidad: TZTable;
    DSProvincia: TDataSource;
    DSLocalidad: TDataSource;
    ZCampeonato: TZTable;
    DSCampeonato: TDataSource;
    cxLabel1: TcxLabel;
    txtNroFecha: TcxCurrencyEdit;
    lblProvincia: TcxLabel;
    cmbProvincia: TDBLookupComboBox;
    lblLocalidad: TcxLabel;
    cmbLocalidad: TDBLookupComboBox;
    cmbTipoDeCompetencia: TDBLookupComboBox;
    cxLabel3: TcxLabel;
    ZTTipoDeCompetencia: TZTable;
    DSTipoDeCompetencia: TDataSource;
    lblNroVueltas: TcxLabel;
    txtNroVuelta: TcxCurrencyEdit;
    GBVueltasCategoria: TcxGroupBox;
    gridNumPorCategoria: TcxGrid;
    gridNumPorCategoriaDBTableView1: TcxGridDBTableView;
    gridNumPorCategoriaLevel1: TcxGridLevel;
    panelRecorrido: TPanel;
    txtDistancia: TcxCurrencyEdit;
    lblMetros: TcxLabel;
    panelDatosCategoria: TPanel;
    lblCateogoria: TcxLabel;
    cmbCategoria: TDBLookupComboBox;
    lblNroVueltasPorCat: TcxLabel;
    txtNroVueltasPorCat: TcxCurrencyEdit;
    btnAgregar: TAeroButton;
    btnEliminar: TAeroButton;
    BindScopeNumCat: TBindScope;
    panelInternalErrorList: TPanel;
    internalErrorListView: TcxListView;
    numerosICRUDData: TJvMemoryData;
    numerosICRUDDS: TDataSource;
    gridNumPorCategoriaDBTableView1Column1: TcxGridDBColumn;
    gridNumPorCategoriaDBTableView1Column2: TcxGridDBColumn;
    DSCategoria: TDataSource;
    ZCategoria: TZTable;
    lblNumMoto: TcxLabel;
    panelNombreCheckpoints: TcxGroupBox;
    chkUltimaFecha: TcxCheckBox;
    chkUsaPuntosExtra: TcxCheckBox;
    chkUtilizaHandicup: TcxCheckBox;
    procedure cmbComboExit(Sender: TObject);
    procedure cmbComboKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure textKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dtpFechaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dtpFechaExit(Sender: TObject);
    procedure cmbLocalidadExit(Sender: TObject);
    procedure cmbLocalidadKeyPress(Sender: TObject; var Key: Char);
    procedure btnAgregarClick(Sender: TObject);
    procedure btnEliminarClick(Sender: TObject);
    procedure btnAcceptClick(Sender: TObject);
    procedure chkUltimaFechaClick(Sender: TObject);
    procedure chkUltimaFechaExit(Sender: TObject);
    procedure chkUltimaFechaFocusChanged(Sender: TObject);
  private
    procedure InitializeBinding; Override;
    function dataSetToPartesVO(dataSet : TJvMemoryData): TList<TEventoCategoriaNumeracion>;
    function partesVOToDataSet(partesListVO : TList<TEventoCategoriaNumeracion>): TJvMemoryData;
  public
    procedure setEditorValueObject(persistentVO : TPersistentObject); Override;
    procedure ClearEditor; Override;
    procedure RefreshEditorData; Override;

    constructor Create(owner: TComponent; persistentVO: TPersistentObject); Virtual;
  end;

implementation
var
  eventoCategoriaNumeracionVO: TEventoCategoriaNumeracion;
{$R *.dfm}

procedure TEventEditor.RefreshEditorData;
begin
  ZTProvincia.Close;
  ZTProvincia.Open;

  ZTLocalidad.Close;
  ZTLocalidad.Open;

  ZCampeonato.Close;
  ZCampeonato.Open;

  ZTTipoDeCompetencia.Close;
  ZTTipoDeCompetencia.Open;

  ZCategoria.Close;
  ZCategoria.Open;
end;

procedure TEventEditor.setEditorValueObject(persistentVO : TPersistentObject);
var
  eventoVO: TEvento;
begin
  inherited;
  eventoVO := TEvento(persistentVO);
  partesVOToDataSet(eventoVO.VueltasCategoria);
end;

procedure TEventEditor.btnAcceptClick(Sender: TObject);
var
  eventoVO : TEvento;
begin
  eventoVO := TEvento(self.getEditorValueObject());
  eventoVO.VueltasCategoria:= dataSetToPartesVO(numerosICRUDData);
  inherited;
end;

procedure TEventEditor.btnAgregarClick(Sender: TObject);
begin
  if (not eventoCategoriaNumeracionVO.isValidObject()) then
    begin
      panelInternalErrorList.Visible:= True;
      setTListItemsByTStringList(internalErrorListView,
        eventoCategoriaNumeracionVO.getValidationResult)
    end
  else
    begin
      panelInternalErrorList.Visible:= False;

      with numerosICRUDData do
        if not Locate('oid', VarArrayOf([eventoCategoriaNumeracionVO.OID]), []) then
          begin
            Append;
              FieldByName('numerosICRUDCategoria').AsString:= cmbCategoria.Text; //eventoCategoriaNumeracionVO.Categoria;
              FieldByName('numerosICRUDCategoriaOID').AsInteger:= eventoCategoriaNumeracionVO.CategoriaOID;
              FieldByName('numerosICRUDNumero').AsInteger:= eventoCategoriaNumeracionVO.NroVuelta;
            Post;

          end;
    end;

  eventoCategoriaNumeracionVO:= TEventoCategoriaNumeracion.Create;
  BindScopeNumCat.DataObject := eventoCategoriaNumeracionVO;
end;

procedure TEventEditor.btnEliminarClick(Sender: TObject);
begin
    with numerosICRUDDS.DataSet do
    begin
      if (RecordCount>0) then
        if (MessageDLG('¿Esta Seguro que desea eliminar el Nro seleccionado?',mtWarning,[mbOk,mbCancel],0) = mrOk) then
          Delete;
    end;
end;

procedure TEventEditor.chkUltimaFechaClick(Sender: TObject);
begin
  inherited;
  BindingsList.Notify(Sender, 'Checked');
end;

procedure TEventEditor.chkUltimaFechaExit(Sender: TObject);
begin
  inherited;
  BindingsList.Notify(Sender, 'Checked');
end;

procedure TEventEditor.chkUltimaFechaFocusChanged(Sender: TObject);
begin
  inherited;
  BindingsList.Notify(Sender, 'Checked');
end;

procedure TEventEditor.ClearEditor;
begin
  inherited;

  txtNombre.Clear;

  cmbProvincia.KeyValue:= 0;
  cmbLocalidad.KeyValue:= 0;

  cmbCampeonato.KeyValue:= 0;

  txtNroFecha.Clear;
  txtDistancia.Clear;

  numerosICRUDData.EmptyTable;
  validationPanel.Visible:= False;

  panelInternalErrorList.Visible:= False;

  chkUltimaFecha.Checked:= False;
  chkUsaPuntosExtra.Checked:= False;
  chkUtilizaHandicup.Checked:= True;
end;

procedure TEventEditor.InitializeBinding;
var
  expression: TBindExpression;
  eventoVO: TEvento;
begin
  BindingHelper.setMessageKey(TComponent(txtNombre), 'Text', TComponent(BindScope), 'Nombre', BindingsList);
  BindingHelper.setMessageKey(TComponent(dtpFecha), 'Date', TComponent(BindScope), 'Fecha', BindingsList);
  BindingHelper.setMessageKey(TComponent(cmbProvincia), 'KeyValue', TComponent(BindScope), 'ProvinciaOID', BindingsList);
  BindingHelper.setMessageKey(TComponent(cmbLocalidad), 'KeyValue', TComponent(BindScope), 'LocalidadOID', BindingsList);
  BindingHelper.setMessageKey(TComponent(txtDistancia), 'Text', TComponent(BindScope), 'Distancia', BindingsList);
  BindingHelper.setMessageKey(TComponent(cmbCampeonato), 'KeyValue', TComponent(BindScope), 'CampeonatoOID', BindingsList);
  BindingHelper.setMessageKey(TComponent(txtNroFecha), 'Text', TComponent(BindScope), 'NroFecha', BindingsList);
  BindingHelper.setMessageKey(TComponent(cmbTipoDeCompetencia), 'KeyValue', TComponent(BindScope), 'TipoCompetenciaOID', BindingsList);
  BindingHelper.setMessageKey(TComponent(txtNroVuelta), 'Text', TComponent(BindScope), 'NroVueltas', BindingsList);

  BindingHelper.setMessageKey(TComponent(chkUltimaFecha), 'Checked', TComponent(BindScope), 'UltimaFecha', BindingsList);
  BindingHelper.setMessageKey(TComponent(chkUsaPuntosExtra), 'Checked', TComponent(BindScope), 'UsaPuntosExtra', BindingsList);
  BindingHelper.setMessageKey(TComponent(chkUtilizaHandicup), 'Checked', TComponent(BindScope), 'UsaHandicup', BindingsList);
  BindingHelper.setMessageKey(TComponent(cmbCategoria), 'KeyValue', TComponent(BindScopeNumCat), 'CategoriaOID', BindingsList);
  BindingHelper.setMessageKey(TComponent(txtNroVueltasPorCat), 'Text', TComponent(BindScopeNumCat), 'NroVuelta', BindingsList);

  eventoVO:= TEvento(persistentVO);
  BindScope.DataObject := eventoVO;

  eventoCategoriaNumeracionVO:= TEventoCategoriaNumeracion.Create;
  BindScopeNumCat.DataObject := eventoCategoriaNumeracionVO;
end;

procedure TEventEditor.cmbComboExit(Sender: TObject);
begin
  inherited;
  BindingsList.Notify(Sender, 'KeyValue');
end;

procedure TEventEditor.cmbComboKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  BindingsList.Notify(Sender, 'KeyValue');
end;

procedure TEventEditor.cmbLocalidadExit(Sender: TObject);
begin
  inherited;
  BindingsList.Notify(Sender, 'KeyValue');
end;

procedure TEventEditor.cmbLocalidadKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  BindingsList.Notify(Sender, 'KeyValue');
end;

constructor TEventEditor.Create(owner: TComponent; persistentVO: TPersistentObject);
begin
  inherited Create(owner, persistentVO);

  numerosICRUDData.Active:= True;
end;

procedure TEventEditor.dtpFechaExit(Sender: TObject);
begin
  inherited;
  BindingsList.Notify(Sender, 'Date');
end;

procedure TEventEditor.dtpFechaKeyUp(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
  inherited;
  BindingsList.Notify(Sender, 'Date');
end;

procedure TEventEditor.textKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  BindingsList.Notify(Sender, 'Text');
end;

function TEventEditor.dataSetToPartesVO(dataSet : TJvMemoryData): TList<TEventoCategoriaNumeracion>;
var
  parteListVO : TList<TEventoCategoriaNumeracion>;
  eventoCategoriaNumeracionVO : TEventoCategoriaNumeracion;
begin
  with dataSet do
  begin
    First;

    parteListVO :=  TList<TEventoCategoriaNumeracion>.Create;
    while not Eof do
    begin
        eventoCategoriaNumeracionVO := TEventoCategoriaNumeracion.Create;
        eventoCategoriaNumeracionVO.CategoriaOID:= FieldByName('numerosICRUDCategoriaOID').AsInteger;
        eventoCategoriaNumeracionVO.NroVuelta:= FieldByName('numerosICRUDNumero').AsInteger;
        eventoCategoriaNumeracionVO.Categoria:= FieldByName('numerosICRUDCategoria').AsString;
        parteListVO.Add(eventoCategoriaNumeracionVO);

        Next;
    end;
  end;
  Result:= parteListVO;
end;

function TEventEditor.partesVOToDataSet(partesListVO : TList<TEventoCategoriaNumeracion>): TJvMemoryData;
var
  eventoCategoriaNumeracionVO : TEventoCategoriaNumeracion;
begin
  numerosICRUDData.EmptyTable;

    for eventoCategoriaNumeracionVO in partesListVO do
      with numerosICRUDData do
      begin
        Insert;
          FieldByName('numerosICRUDCategoriaOID').AsInteger:= eventoCategoriaNumeracionVO.CategoriaOID;
          FieldByName('numerosICRUDNumero').AsInteger:= eventoCategoriaNumeracionVO.NroVuelta;
          FieldByName('numerosICRUDCategoria').AsString:= eventoCategoriaNumeracionVO.Categoria;
        Post;
      end;
end;

end.
