unit GrillaPartidaUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DataModule, F_EEMessage,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid, cxDBLookupComboBox, ZAbstractTable, Vcl.StdCtrls, AeroButtons,
  Vcl.ImgList, JvExExtCtrls, JvNetscapeSplitter, CambiarEstadoPilotoGrillaUnit, System.DateUtils,
  cxCheckBox, scExcelExport, BussinessDataSubsystemFacade, Entidades, cxTextEdit,
  cxContainer;

type
  TGrillaPartida = class(TForm)
    panelOrdenCategorias: TPanel;
    panelPilotos: TPanel;
    QInsertGrillaTTCategoria: TZQuery;
    SelectPilotosEvento: TZQuery;
    InsertPilotosEvento: TZQuery;
    SelectTTCategoria: TZReadOnlyQuery;
    cxGridCategoriasDBTableView: TcxGridDBTableView;
    cxGridCategoriasLevel: TcxGridLevel;
    cxGridCategorias: TcxGrid;
    QueryCategorias: TZQuery;
    DSCategorias: TDataSource;
    cxGridCategoriasDBTableVieworden_de_largada: TcxGridDBColumn;
    cxGridCategoriasDBTableViewhora_de_largada: TcxGridDBColumn;
    cxGridCategoriasDBTableViewsegundos_entre_pilotos: TcxGridDBColumn;
    QueryPilotos: TZQuery;
    DSPilotos: TDataSource;
    cxGridCategoriasDBTableViewcant_piloto_por_largada: TcxGridDBColumn;
    cxGridCategoriasDBTableViewtipo_de_largada: TcxGridDBColumn;
    TipoDeLargada: TZTable;
    DSTipoDeLargada: TDataSource;
    cxGridCategoriasDBTableViewnombre_categoria: TcxGridDBColumn;
    Categoria: TZTable;
    DSCategoria: TDataSource;
    topSplitter: TJvNetscapeSplitter;
    panelAccionesPiloto: TPanel;
    panelGrillaPilotos: TPanel;
    cxGridPilotos: TcxGrid;
    cxGridPilotosDBTableView: TcxGridDBTableView;
    cxGridPilotosDBTableViewnro_moto: TcxGridDBColumn;
    cxGridPilotosDBTableViewnombre_piloto: TcxGridDBColumn;
    cxGridPilotosDBTableViewnombre_categoria: TcxGridDBColumn;
    cxGridPilotosLevel: TcxGridLevel;
    cxButtonImageList: TcxImageList;
    btnChangeStatus: TAeroButton;
    ZUpdatePilotoEstado: TZQuery;
    cxGridPilotosDBTableViewestado_piloto: TcxGridDBColumn;
    buttonPanel: TPanel;
    btnAccept: TAeroButton;
    btnCancel: TAeroButton;
    ZInsertLargadaJuntos: TZQuery;
    ZInsertXPorTiempo: TZQuery;
    SelectXPorTiempo: TZQuery;
    ZDeleteTomaTiempoXEvento: TZQuery;
    panelAcciones: TPanel;
    btnGeneratePilotList: TAeroButton;
    btnGenerarListaCategorias: TAeroButton;
    DeleteGrillaTTPilotos: TZQuery;
    cxGridPilotosDBTableViewColumn1: TcxGridDBColumn;
    ZFilterPiloto: TZReadOnlyQuery;
    DSFilterPiloto: TDataSource;
    GrillaPartidaEstado: TZTable;
    DSGrillaPartidaEstado: TDataSource;
    ZGetNroOrden: TZReadOnlyQuery;
    btnExpXLSTT: TAeroButton;
    QueryPilotosExport: TZQuery;
    ROQGetGrillaPartida: TZReadOnlyQuery;
    ZCountLargadaJuntos: TZQuery;
    scExcelExport: TscExcelExport;
    cxGridCategoriasDBTableViewColumn1: TcxGridDBColumn;
    cxGridCategoriasDBTableViewColumn2: TcxGridDBColumn;
    btnHoleshot: TAeroButton;
    btnControlDePaso: TAeroButton;
    ROQControlDePaso: TZReadOnlyQuery;
    btnControlParque: TAeroButton;
    ROQControlParque: TZReadOnlyQuery;
    SelectPilotosEventoNuevo: TZQuery;
    SelectPilotosEventoF10: TZQuery;
    chkInvertirP10: TcxCheckBox;
    btnEliminarLista: TAeroButton;
    SelectPilotosEventoF5: TZQuery;
    chkInvertirP5: TcxCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btnChangeStatusClick(Sender: TObject);
    procedure btnAcceptClick(Sender: TObject);
    procedure btnGeneratePilotListClick(Sender: TObject);
    procedure btnGenerarListaCategoriasClick(Sender: TObject);
    procedure btnExpXLSTTClick(Sender: TObject);
    procedure cxGridCategoriasDBTableViewEditValueChanged(
      Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
    procedure btnHoleshotClick(Sender: TObject);
    procedure btnControlDePasoClick(Sender: TObject);
    procedure btnControlParqueClick(Sender: TObject);
    procedure btnEliminarListaClick(Sender: TObject);
    procedure chkInvertirP10Click(Sender: TObject);
    procedure chkInvertirP5Click(Sender: TObject);
  private
    eventoOID: Integer;
    procedure RefreshPilotoPreservePosition;
    function getNroOrden(eventoOID, categoriaOID : Integer):Integer;
  public
    procedure setEventoOID(eventoOID : Integer);
    function getTTCByCategoriaOID(categoriaOID, eventoOID:Integer):Integer;
    procedure insertTT(categoriaOID, pilotoOID, grilaTTCOID, nroOrden :Integer);

    constructor Create(owner: TComponent; eventoOID: Integer); Overload;
  end;

var
  nroLargada : Integer;

implementation
{$R *.dfm}

procedure TGrillaPartida.RefreshPilotoPreservePosition;
 begin
  QueryPilotos.DisableControls;
  try
    QueryPilotos.Close;
    QueryPilotos.Open;
  finally
    QueryPilotos.EnableControls;
  end;
 end;

procedure TGrillaPartida.btnAcceptClick(Sender: TObject);
var
  nro_pilotos, segundos, tipo_largada,
    grilla_partida_oid, orden_de_largada : Integer;
  skip, first_row, cantCategorias, cantPilotos : Integer;
  hora_largada, default_date: TDateTime;
const
  LARGARXPILOTOS = 1;
  LARGADA_MASIVA = 2;
  LARGADA_SPRINT = 3; // O el nombre que corresponda al tipo 3
begin
    QueryCategorias.First;
    with QueryCategorias do
      begin
          default_date := StrToDateTime('29/12/2000 12:00:00.00');

          hora_largada:= FieldByName('hora_de_largada').AsDateTime;
          ReplaceDate(hora_largada, Date);

          orden_de_largada:= FieldByName('orden_de_largada').AsInteger;

        if ((orden_de_largada > 0) and (CompareTime(default_date, hora_largada) = 0)) then
          begin
            TF_EE_Message.ShowMessage(TComponent(Self), 'Atención',
              'Existe una Categoría con Número de Largada ('+IntToStr(orden_de_largada)+') '
                +'asignado que posee el Hora de Largada default. ', TF_EE_Message.INFORMATION, True);
          end
        else
          begin

            if (TF_EE_Message.ShowMessage(TComponent(Self), 'Generar Toma de Tiempos Inicial',
              '¿Desea re generar la toma de tiempos inicial? ', TF_EE_Message.QUESTION, False) = mrOk ) then
            begin

              with ZDeleteTomaTiempoXEvento do
                begin
                  Close;
                  ParamByName('evento_oid').AsInteger:= eventoOID;
                  ExecSQL;
                end;

              cantCategorias:= 0;
              cantPilotos:= 0;

              QueryCategorias.First;
              with QueryCategorias do
                while not EOF do
                  begin
                    inc(cantCategorias);

                    grilla_partida_oid:= FieldByName('oid').AsInteger;

                    tipo_largada:= FieldByName('tipo_de_largada_oid').AsInteger;
                    nro_pilotos:= FieldByName('cant_piloto_por_largada').AsInteger;
                    segundos:= FieldByName('segundos_entre_pilotos').AsInteger;
                    tipo_largada:= FieldByName('tipo_de_largada_oid').AsInteger;

                    hora_largada:= FieldByName('hora_de_largada').AsDateTime;
                    ReplaceDate(hora_largada, Date);

                    // Insertar en Toma Tiempos los pilotos segun configuracion
                    if (tipo_largada = LARGARXPILOTOS) then
                      begin
                        skip:= 0;
                        first_row:= FieldByName('cant_piloto_por_largada').AsInteger;

                        while True do
                          begin
                            with SelectXPorTiempo do
                              begin
                                Close;
                                ParamByName('grilla_de_partida_categoria_oid').AsInteger:= grilla_partida_oid;
                                ParamByName('skip_rows').AsInteger:= skip;
                                ParamByName('first_rows').AsInteger:= first_row;
                                Open;
                              end;

                              if (SelectXPorTiempo.RecordCount > 0) then
                                begin
                                  cantPilotos:= cantPilotos + SelectXPorTiempo.RecordCount;

                                  with ZInsertXPorTiempo do
                                    begin
                                      Close;
                                      ParamByName('grilla_de_partida_categoria_oid').AsInteger:= grilla_partida_oid;
                                      ParamByName('tiempo_pasada').AsDateTime:= hora_largada;
                                      ParamByName('evento_oid').AsInteger:= eventoOID;
                                      ParamByName('skip_rows').AsInteger:= skip;
                                      ParamByName('first_rows').AsInteger:= first_row;
                                      ExecSQL;
                                    end;

                                  hora_largada := IncSecond(hora_largada, segundos);
                                  skip:= skip +  FieldByName('cant_piloto_por_largada').AsInteger;
                                end
                              else
                                Break;
                        end;
                      end
                    else if (tipo_largada = LARGADA_MASIVA)
                              or (tipo_largada = LARGADA_SPRINT) then // Largan todos los pilotos juntos
                      begin
                        with ZCountLargadaJuntos do
                          begin
                            Close;
                            ParamByName('grilla_de_partida_categoria_oid').AsInteger:= grilla_partida_oid;
                            Open;

                            cantPilotos:= cantPilotos + FieldByName('cuenta').AsInteger;
                          end;

                        with ZInsertLargadaJuntos do
                          begin
                            Close;
                            ParamByName('grilla_de_partida_categoria_oid').AsInteger:= grilla_partida_oid;
                            ParamByName('tiempo_pasada').AsDateTime:= hora_largada;
                            ParamByName('evento_oid').AsInteger:= eventoOID;
                            ExecSQL;
                          end;
                      end;

                    Next;
                  end;

              TF_EE_Message.ShowMessage(TComponent(Self), 'Reporte generación Grilla de Partida',
                'Se ingresaron '+IntToStr(cantPilotos)+' Pilotos en la Grilla de Partida en '+IntToStr(cantCategorias)+' Categorías', TF_EE_Message.QUESTION, True);

                ModalResult:= mrOk;
            end;
          end;
      end;
end;

procedure TGrillaPartida.btnChangeStatusClick(Sender: TObject);
var
  oid : Integer;
begin
  with TCambiarEstadoPilotoGrilla.Create(nil) do
  begin
    cmbEstado.KeyValue:= QueryPilotos.FieldByName('estado_piloto_partida').AsInteger;
    descripcionMemo.Text:= QueryPilotos.FieldByName('descripcion_cambio_estado').AsString;

    if ShowModal = mrOk then
      begin
        oid:= QueryPilotos.FieldByName('oid').AsInteger;

        if (oid > 0) then
          begin
            if (TF_EE_Message.ShowMessage(TComponent(Self), '¿Eliminar Piloto seleccionado?',
              '¿Desea eliminar el Piloto seleccionado? ', TF_EE_Message.QUESTION, False) = mrOk ) then
              begin
                ZUpdatePilotoEstado.Close;
                ZUpdatePilotoEstado.ParamByName('estado_piloto_partida').AsInteger:= cmbEstado.KeyValue;
                ZUpdatePilotoEstado.ParamByName('descripcion_cambio_estado').AsString:= descripcionMemo.Text;
                ZUpdatePilotoEstado.ParamByName('oid').AsInteger:= oid;
                ZUpdatePilotoEstado.ExecSQL;
              end;
          end;
        RefreshPilotoPreservePosition;
      end;
  end;
end;

procedure TGrillaPartida.btnControlDePasoClick(Sender: TObject);
begin
    with ROQControlDePaso do
    begin
      DisableControls;
      try
        Close;
        ParamByName('evento_oid').AsInteger:= eventoOID;
        Open;
      finally
        EnableControls;
      end;
    end;

    scExcelExport.Dataset:= ROQControlDePaso;
    scExcelExport.WorksheetName := 'Control de Paso';
    scExcelExport.ExportDataset;
    scExcelExport.Disconnect;
end;

procedure TGrillaPartida.btnControlParqueClick(Sender: TObject);
begin
  with ROQControlParque do
    begin
      DisableControls;
      try
        Close;
        ParamByName('evento_oid').AsInteger:= eventoOID;
        Open;
      finally
        EnableControls;
      end;
    end;

    scExcelExport.Dataset:= ROQControlParque;
    scExcelExport.WorksheetName := 'Control de Parque Cerrado';
    scExcelExport.ExportDataset;
    scExcelExport.Disconnect;
end;

procedure TGrillaPartida.btnEliminarListaClick(Sender: TObject);
begin
    with DeleteGrillaTTPilotos do
    begin
      Close;
      ParamByName('evento_oid').AsInteger:= self.eventoOID;
      ExecSQL;
    end;

    QueryPilotos.Close;
    QueryPilotos.Open;
end;

procedure TGrillaPartida.btnExpXLSTTClick(Sender: TObject);
begin
    with ROQGetGrillaPartida do
    begin
      DisableControls;
      try
        Close;
        ParamByName('evento_oid').AsInteger:= eventoOID;
        Open;
      finally
        EnableControls;
      end;
    end;

    scExcelExport.Dataset:= ROQGetGrillaPartida;
    scExcelExport.WorksheetName := 'Grilla de Partida';
    scExcelExport.ExportDataset;
    scExcelExport.Disconnect;
end;

procedure TGrillaPartida.btnGenerarListaCategoriasClick(Sender: TObject);
begin
    with QInsertGrillaTTCategoria do
    begin
      Close;
      ParamByName('evento_oid').AsInteger:= self.eventoOID;
      ExecSQL;
    end;

  with QueryCategorias do
    begin
      Close;
      ParamByName('evento_oid').AsInteger:= self.eventoOID;
      Open;
    end;
end;

function TGrillaPartida.getNroOrden(eventoOID, categoriaOID : Integer):Integer;
var
  nroOrden : Integer;
begin
  nroOrden:= 0;
  with ZGetNroOrden do
    begin
      Close;
      ParamByName('evento_oid').AsInteger:= eventoOID;
      ParamByName('categoria_oid').AsInteger:= categoriaOID;
      Open;
      nroOrden:= FieldByName('max_orden').AsInteger;
    end;
  Result:= nroOrden;
end;

procedure TGrillaPartida.btnGeneratePilotListClick(Sender: TObject);
var
  categoriaOIDAnt : Integer;
  nroOrden : Integer;
begin
    categoriaOIDAnt:= 0;
    nroOrden:= 0;

    if (not chkInvertirP10.Checked) and (not chkInvertirP5.Checked) then
      begin
        with SelectPilotosEvento do
        begin
          Close;
          ParamByName('evento_oid').AsInteger:= self.eventoOID;
          Open;

          while not Eof do
          begin
            if categoriaOIDAnt <> FieldByName('categoria_oid').AsInteger then
            begin
              categoriaOIDAnt:= FieldByName('categoria_oid').AsInteger;
              nroOrden:= getNroOrden(self.eventoOID, FieldByName('categoria_oid').AsInteger);
            end;
            nroOrden:= nroOrden + 1;

            insertTT(FieldByName('categoria_oid').AsInteger, FieldByName('piloto_oid').AsInteger,
              getTTCByCategoriaOID(FieldByName('categoria_oid').AsInteger, self.eventoOID), nroOrden);

            Next;
          end;
        end;
      end
    else if (chkInvertirP10.Checked) then
      begin
        with SelectPilotosEventoF10 do
        begin
          Close;
          ParamByName('evento_oid').AsInteger:= self.eventoOID;
          Open;

          while not Eof do
          begin
            if categoriaOIDAnt <> FieldByName('categoria_oid').AsInteger then
            begin
              categoriaOIDAnt:= FieldByName('categoria_oid').AsInteger;
              nroOrden:= getNroOrden(self.eventoOID, FieldByName('categoria_oid').AsInteger);
            end;
            nroOrden:= nroOrden + 1;

            insertTT(FieldByName('categoria_oid').AsInteger, FieldByName('piloto_oid').AsInteger,
              getTTCByCategoriaOID(FieldByName('categoria_oid').AsInteger, self.eventoOID), nroOrden);

            Next;
          end;
        end;
      end
      else
        begin
          with SelectPilotosEventoF5 do
          begin
            Close;
            ParamByName('evento_oid').AsInteger:= self.eventoOID;
            Open;

            while not Eof do
            begin
              if categoriaOIDAnt <> FieldByName('categoria_oid').AsInteger then
              begin
                categoriaOIDAnt:= FieldByName('categoria_oid').AsInteger;
                nroOrden:= getNroOrden(self.eventoOID, FieldByName('categoria_oid').AsInteger);
              end;
              nroOrden:= nroOrden + 1;

              insertTT(FieldByName('categoria_oid').AsInteger, FieldByName('piloto_oid').AsInteger,
                getTTCByCategoriaOID(FieldByName('categoria_oid').AsInteger, self.eventoOID), nroOrden);

              Next;
            end;
          end;
        end;

    QueryPilotos.Close;
    QueryPilotos.Open;
end;

procedure TGrillaPartida.btnHoleshotClick(Sender: TObject);
var
  nro_pilotos, segundos, grilla_partida_oid, orden_de_largada, orden_largada_posicion : Integer;
  skip, first_row, cantCategorias, cantPilotos, cant_posiciones_muertas : Integer;
  hora_largada, default_date: TDateTime;
begin
    with QueryCategorias do
      begin
          orden_largada_posicion:= FieldByName('orden_de_largada_posicion').AsInteger;
          nroLargada:= FieldByName('orden_de_largada').AsInteger;;
          if (orden_largada_posicion > 0) then
            begin

              default_date := StrToDateTime('29/12/2000 12:00:00.00');

              hora_largada:= FieldByName('hora_de_largada').AsDateTime;
              ReplaceDate(hora_largada, Date);

              orden_de_largada:= FieldByName('orden_de_largada').AsInteger;

            if ((orden_de_largada > 0) and (orden_largada_posicion = 1 )
                and (CompareTime(default_date, hora_largada) = 0)) then
              begin
                TF_EE_Message.ShowMessage(TComponent(Self), 'Atención',
                  'Existe una Categoría con Número de Largada ('+IntToStr(orden_de_largada)+') '
                    +'asignado que posee el Hora de Largada default. ', TF_EE_Message.INFORMATION, True);
              end
            else
              begin

                if (TF_EE_Message.ShowMessage(TComponent(Self), 'Generar Toma de Tiempos HoleShot',
                  '¿Desea re generar la toma de tiempos holeshot? ', TF_EE_Message.QUESTION, False) = mrOk ) then
                begin

                  with ZDeleteTomaTiempoXEvento do
                    begin
                      Close;
                      ParamByName('evento_oid').AsInteger:= eventoOID;
                      ExecSQL;
                    end;

                  cantCategorias:= 0;
                  cantPilotos:= 0;

                  with QueryCategorias do
                    while (not EOF) do
                      begin
                        if ((FieldByName('orden_de_largada_posicion').AsInteger>0)) then
                        begin
                        grilla_partida_oid:= FieldByName('oid').AsInteger;

                        nro_pilotos:= FieldByName('cant_piloto_por_largada').AsInteger;
                        segundos:= FieldByName('segundos_entre_pilotos').AsInteger;

//                        hora_largada:= FieldByName('hora_de_largada').AsDateTime;
  //                      ReplaceDate(hora_largada, Date);

                        // Insertar en Toma Tiempos los pilotos segun configuracion
                        //if (tipo_largada = 1) then
                          //begin
                            skip:= 0;
                            first_row:= FieldByName('cant_piloto_por_largada').AsInteger;

                            while True do
                              begin
                                with SelectXPorTiempo do
                                  begin
                                    Close;
                                    ParamByName('grilla_de_partida_categoria_oid').AsInteger:= grilla_partida_oid;
                                    ParamByName('skip_rows').AsInteger:= skip;
                                    ParamByName('first_rows').AsInteger:= first_row;
                                    Open;
                                  end;

                                  if (SelectXPorTiempo.RecordCount > 0) then
                                    begin
                                      cantPilotos:= cantPilotos + SelectXPorTiempo.RecordCount;

                                      with ZInsertXPorTiempo do
                                        begin
                                          Close;
                                          ParamByName('grilla_de_partida_categoria_oid').AsInteger:= grilla_partida_oid;
                                          ParamByName('tiempo_pasada').AsDateTime:= hora_largada;
                                          ParamByName('evento_oid').AsInteger:= eventoOID;
                                          ParamByName('skip_rows').AsInteger:= skip;
                                          ParamByName('first_rows').AsInteger:= first_row;
                                          ExecSQL;
                                        end;

                                      hora_largada := IncSecond(hora_largada, segundos);
                                      skip:= skip +  FieldByName('cant_piloto_por_largada').AsInteger;
                                    end
                                  else
                                    Break;
                            end;
                          //end;
                            // incrementamos x segundos por posiciones muertas
                           cant_posiciones_muertas:= FieldByName('cant_posiciones_muertas').AsInteger;
                           hora_largada := IncSecond(hora_largada, (cant_posiciones_muertas Div nro_pilotos)*segundos);
                        end;
                        Next;
                      end;

                    ModalResult:= mrYes;
                end;
              end;
            end;
      end;
end;

procedure TGrillaPartida.chkInvertirP10Click(Sender: TObject);
begin
      chkInvertirP5.Checked:= False;
end;

procedure TGrillaPartida.chkInvertirP5Click(Sender: TObject);
begin
 chkInvertirP10.Checked:= False;
end;

constructor TGrillaPartida.Create(owner: TComponent; eventoOID: Integer);
begin
  inherited Create(owner);
  self.eventoOID:= eventoOID;
end;

procedure TGrillaPartida.cxGridCategoriasDBTableViewEditValueChanged(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
var
  categoriaOID, tipoCategoriaOID,
    nroVuelta, nroVueltaEdit : Integer;
  categoriaVO : TCategoria;
begin
  if ((cxGridCategoriasDBTableVieworden_de_largada = AItem)) then
    begin
      nroVuelta:= AItem.EditValue;
      nroVueltaEdit:= Sender.Controller.EditingController.Edit.EditingValue;
      categoriaOID:= QueryCategorias.FieldByName('categoria_oid').AsInteger;
      categoriaVO:= TBussinessDataSubsystemFacade.getInstance.getCategoria(categoriaOID);
      tipoCategoriaOID:= TBussinessDataSubsystemFacade.getInstance
        .getTipoCategoriaByEventoOIDAndOrdenLargada(self.eventoOID, nroVueltaEdit);

      if ((tipoCategoriaOID = 0) or (nroVueltaEdit = 0)
        or (categoriaVO.TipoCategoriaOID = tipoCategoriaOID)) then
          Sender.Controller.EditingController.Edit.PostEditValue
      else
        begin
          TF_EE_Message.ShowMessage(TComponent(Self), 'Asignación de Categoría Incorrecta',
            'No es posible asignar la Categoría <b>'+categoriaVO.Nombre
              +'</b> al Nro. Largada <b>'+IntToStr(nroVueltaEdit)+'</b>', TF_EE_Message.ERROR, False);
          Sender.Controller.EditingController.Edit.Reset;
        end;
    end;
end;

procedure TGrillaPartida.setEventoOID(eventoOID : Integer);
begin
  self.eventoOID:= eventoOID;
end;

function TGrillaPartida.getTTCByCategoriaOID(categoriaOID, eventoOID:Integer):Integer;
var
  resultado : Integer;
begin
    with SelectTTCategoria do
    begin
      Close;
      ParamByName('categoria_oid').AsInteger:= categoriaOID;
      ParamByName('evento_oid').AsInteger:= eventoOID;
      Open;
      resultado:= FieldByName('oid').AsInteger;
    end;
    Result:= resultado;
end;

procedure TGrillaPartida.insertTT(categoriaOID, pilotoOID, grilaTTCOID, nroOrden :Integer);
begin
    with InsertPilotosEvento do
    begin
      Close;
      ParamByName('piloto_oid').AsInteger:= pilotoOID;
      ParamByName('categoria_oid').AsInteger:= categoriaOID;
      ParamByName('grilla_de_partida_categoria_oid').AsInteger:= grilaTTCOID;
      ParamByName('orden').AsInteger:= nroOrden;
      ExecSQL;
    end;
end;

procedure TGrillaPartida.FormCreate(Sender: TObject);
begin
  TipoDeLargada.Active:= True;
  Categoria.Active:= True;
  ZFilterPiloto.Active:= True;
  GrillaPartidaEstado.Active:= True;

  btnGenerarListaCategorias.Caption:= 'Generar Lista'+Chr(13)+'de Categorías';
  btnGeneratePilotList.Caption:= 'Generar Lista'+Chr(13)+'de Pilotos';

  with QueryCategorias do
    begin
      Close;
      ParamByName('evento_oid').AsInteger:= self.eventoOID;
      Open;
    end;

    QueryPilotos.Active:= True;
  end;
end.
