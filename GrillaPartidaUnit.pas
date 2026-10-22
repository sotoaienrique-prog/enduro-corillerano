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
  TFilaSprint = record
    IngresoSeg: Integer;   // hora de ingreso al parque, en segundos del día
    NroMoto, Piloto, Categoria, Modelo: string;
  end;
  TFilasSprint = array of TFilaSprint;

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
    btnGrillaSprint: TAeroButton;
    procedure RefreshPilotoPreservePosition;
    function getNroOrden(eventoOID, categoriaOID : Integer):Integer;
    procedure btnGrillaSprintClick(Sender: TObject);
    function CargarFilasSprint: TFilasSprint;
    function ConstruirTituloEvento: string;
    procedure ExportarSprintAExcel(const Filas: TFilasSprint; MinutosCH1: Integer);
    function GenerarHTMLSprint(const Filas: TFilasSprint; MinutosCH1: Integer): string;
  public
    procedure setEventoOID(eventoOID : Integer);
    function getTTCByCategoriaOID(categoriaOID, eventoOID:Integer):Integer;
    procedure insertTT(categoriaOID, pilotoOID, grilaTTCOID, nroOrden :Integer);

    constructor Create(owner: TComponent; eventoOID: Integer); Overload;
  end;

var
  nroLargada : Integer;

implementation

uses
  System.Win.ComObj, ConfigureFilesUtilities, EditAgrupacionTomaTiempos, LogUnit;

{$R *.dfm}

const
  TIPO_LARGADA_SPRINT = 3;
  // Debe ser string tipado: el literal '@' es un Char y por OLE viaja como 64
  FORMATO_TEXTO_EXCEL: WideString = '@';

function FormatoHoraSprint(Seg: Integer): string;
begin
  // Con enteros, sin pasar por TDateTime, para que 12:05 no salga 12:04:59
  if (Seg mod 60) = 0 then
    Result := Format('%.2d:%.2d', [Seg div 3600, (Seg mod 3600) div 60])
  else
    Result := Format('%.2d:%.2d:%.2d', [Seg div 3600, (Seg mod 3600) div 60, Seg mod 60]);
end;

function HtmlEscSprint(const S: string): string;
begin
  Result := StringReplace(S, '&', '&amp;', [rfReplaceAll]);
  Result := StringReplace(Result, '<', '&lt;', [rfReplaceAll]);
  Result := StringReplace(Result, '>', '&gt;', [rfReplaceAll]);
end;

// Último índice del grupo que empieza en Desde (todas las filas con la misma hora de ingreso)
function FinGrupoSprint(const Filas: TFilasSprint; Desde: Integer): Integer;
begin
  Result := Desde;
  while (Result + 1 < Length(Filas)) and (Filas[Result + 1].IngresoSeg = Filas[Desde].IngresoSeg) do
    Inc(Result);
end;

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
  cantQuitados : Integer;
begin
    categoriaOIDAnt:= 0;
    nroOrden:= 0;

    // Quitar de la grilla a los pilotos sin inscripción (eliminados o con cambio de categoría)
    cantQuitados:= TBussinessDataSubsystemFacade.getInstance
      .deleteGrillaPartidaSinInscripcion(self.eventoOID);

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

    if cantQuitados > 0 then
      TF_EE_Message.ShowMessage(TComponent(Self), 'Grilla actualizada',
        'Se quitaron <b>' + IntToStr(cantQuitados) + '</b> piloto(s) que ya no están inscriptos ' +
        'en esa categoría.<br>Si ya se generó la toma de tiempos inicial, volvé a generarla ' +
        'con <b>Aceptar</b> u <b>Holeshot</b>.', TF_EE_Message.INFORMATION, True);
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

function TGrillaPartida.CargarFilasSprint: TFilasSprint;
var
  Q: TZReadOnlyQuery;
  Fila: TFilaSprint;
  n, gpcAnterior, posEnCategoria, cantPorLargada, segundosEntre: Integer;
  inicioCategoriaSeg, ultimoIngresoSeg, segundosAnterior: Integer;
begin
  SetLength(Result, 0);
  n := 0;

  Q := TZReadOnlyQuery.Create(nil);
  try
    Q.Connection := QueryCategorias.Connection;
    Q.SQL.Text :=
      'select gpc.oid gpc_oid, gpc.hora_de_largada, gpc.segundos_entre_pilotos, ' +
      '       gpc.cant_piloto_por_largada, c.nombre categoria, ' +
      '       sel_nro_moto_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, ipe.evento_oid, ipe.piloto_oid) nro_moto, ' +
      '       CASE WHEN c.utiliza_acompaniante = 1 THEN CONCAT(UC_Words(CONCAT(p.apellido, '', '' , p.nombre)), ' +
      '                 IFNULL(UC_Words(CONCAT('' / '', n.apellido, '', '' , n.nombre)), '''')) ' +
      '            ELSE UC_Words(CONCAT(p.apellido, '', '' , p.nombre)) END piloto, ' +
      '       mm.nombre modelo ' +
      'from grilla_de_partida_categorias gpc ' +
      '     inner join grilla_de_partida gp on gp.grilla_de_partida_categoria_oid = gpc.oid ' +
      '     inner join categorias c on gp.categoria_oid = c.oid ' +
      '     inner join inscripcion_piloto_evento ipe on (ipe.evento_oid = gpc.evento_oid ' +
      '                and ipe.piloto_oid = gp.piloto_oid and ipe.tipo_categoria_oid = c.tipo_categoria_oid) ' +
      '     inner join piloto p on gp.piloto_oid = p.oid ' +
      '     left join modelo_moto mm on p.modelo_moto_oid = mm.oid ' +
      '     left join navegante n on n.piloto_oid = p.oid ' +
      'where gp.estado_piloto_partida = 1 ' +
      '      and gpc.evento_oid = :evento_oid ' +
      '      and gpc.tipo_de_largada_oid = :tipo_sprint ' +
      '      and gpc.orden_de_largada > 0 ' +   // sin Nro. Largada no tiene lugar en la fila
      'order by gpc.orden_de_largada, gpc.orden_de_largada_posicion, gpc.oid, gp.orden';
    Q.ParamByName('evento_oid').AsInteger := eventoOID;
    Q.ParamByName('tipo_sprint').AsInteger := TIPO_LARGADA_SPRINT;
    Q.Open;

    // Una sola fila de largada: solo cuenta la hora de la primera categoría (la de menor
    // Nro. Largada). Cada categoría siguiente arranca en el turno que sigue al último grupo
    // de la anterior; las horas cargadas en las demás categorías se ignoran.
    gpcAnterior := -1;
    posEnCategoria := 0;
    inicioCategoriaSeg := 0;
    ultimoIngresoSeg := 0;
    segundosAnterior := 0;
    while not Q.Eof do
    begin
      cantPorLargada := Q.FieldByName('cant_piloto_por_largada').AsInteger;
      if cantPorLargada < 1 then
        cantPorLargada := 1;
      segundosEntre := Q.FieldByName('segundos_entre_pilotos').AsInteger;

      if Q.FieldByName('gpc_oid').AsInteger <> gpcAnterior then
      begin
        if gpcAnterior = -1 then
          inicioCategoriaSeg := SecondOfTheDay(Q.FieldByName('hora_de_largada').AsDateTime)
        else
          inicioCategoriaSeg := ultimoIngresoSeg + segundosAnterior;
        gpcAnterior := Q.FieldByName('gpc_oid').AsInteger;
        posEnCategoria := 0;
      end;

      // Dentro de la categoría: un grupo de N pilotos cada X segundos (como "Aceptar" por tiempo)
      Fila.IngresoSeg := inicioCategoriaSeg + (posEnCategoria div cantPorLargada) * segundosEntre;
      Fila.NroMoto := Q.FieldByName('nro_moto').AsString;
      Fila.Piloto := Q.FieldByName('piloto').AsString;
      Fila.Categoria := Q.FieldByName('categoria').AsString;
      Fila.Modelo := Q.FieldByName('modelo').AsString;

      if n >= Length(Result) then
        SetLength(Result, n + 64);
      // Las horas salen crecientes en el orden de la consulta: no hace falta reordenar
      Result[n] := Fila;

      ultimoIngresoSeg := Fila.IngresoSeg;
      segundosAnterior := segundosEntre;
      Inc(n);
      Inc(posEnCategoria);
      Q.Next;
    end;
  finally
    Q.Free;
  end;

  SetLength(Result, n);
end;

function TGrillaPartida.ConstruirTituloEvento: string;
var
  Q: TZReadOnlyQuery;
begin
  Result := '';
  Q := TZReadOnlyQuery.Create(nil);
  try
    Q.Connection := QueryCategorias.Connection;
    Q.SQL.Text :=
      'select e.nro_fecha, e.fecha, e.nombre, c.nombre campeonato ' +
      'from evento e left join campeonato c on c.oid = e.campeonato_oid ' +
      'where e.oid = :evento_oid';
    Q.ParamByName('evento_oid').AsInteger := eventoOID;
    Q.Open;

    if not Q.Eof then
    begin
      if Trim(Q.FieldByName('campeonato').AsString) <> '' then
        Result := Trim(Q.FieldByName('campeonato').AsString) + ' - ';
      if not Q.FieldByName('nro_fecha').IsNull then
        Result := Result + 'Fecha ' + Q.FieldByName('nro_fecha').AsString + ' - ';
      if not Q.FieldByName('fecha').IsNull then
        Result := Result + FormatDateTime('dd/mm/yyyy', Q.FieldByName('fecha').AsDateTime) + ' - ';
      Result := Result + Trim(Q.FieldByName('nombre').AsString);
    end;
  finally
    Q.Free;
  end;
end;

procedure TGrillaPartida.ExportarSprintAExcel(const Filas: TFilasSprint; MinutosCH1: Integer);
const
  NUM_COLS        = 6;
  FILA_ENCABEZADO = 4;
  xlCenter        = -4108;
  xlEdgeTop       = 8;
  xlContinuous    = 1;
  xlMedium        = -4138;
var
  Excel, Libro, Hoja, Datos, R: Variant;
  i, c, Desde, Hasta, NroGrupo: Integer;

  function Rango(FilaDesde, ColDesde, FilaHasta, ColHasta: Integer): Variant;
  begin
    Result := Hoja.Range[Hoja.Cells[FilaDesde, ColDesde], Hoja.Cells[FilaHasta, ColHasta]];
  end;

begin
  Excel := CreateOleObject('Excel.Application');
  try
    Excel.ScreenUpdating := False;
    Excel.DisplayAlerts := False;
    Libro := Excel.Workbooks.Add;
    Hoja := Libro.Worksheets[1];
    Hoja.Name := 'Grilla Sprint';

    Hoja.Cells[1, 1].Value := 'Grilla de Ingreso a Parque Cerrado - Largada Sprint';
    Hoja.Cells[1, 1].Font.Bold := True;
    Hoja.Cells[1, 1].Font.Size := 14;
    Hoja.Cells[2, 1].Value := ConstruirTituloEvento;
    Hoja.Cells[3, 1].Value := 'Largada CH1: ' + IntToStr(MinutosCH1) + ' min después del ingreso';

    // Encabezado + datos en un solo Variant array (una sola llamada OLE)
    Datos := VarArrayCreate([0, Length(Filas), 0, NUM_COLS - 1], varVariant);
    Datos[0, 0] := 'Ingreso Parque';
    Datos[0, 1] := 'Largada CH1';
    Datos[0, 2] := 'Nro.';
    Datos[0, 3] := 'Piloto';
    Datos[0, 4] := 'Categoría';
    Datos[0, 5] := 'Modelo';

    Desde := 0;
    while Desde < Length(Filas) do
    begin
      Hasta := FinGrupoSprint(Filas, Desde);
      for i := Desde to Hasta do
      begin
        // La hora va solo en la primera fila del grupo: después se combinan las celdas
        if i = Desde then
        begin
          Datos[i + 1, 0] := FormatoHoraSprint(Filas[i].IngresoSeg);
          Datos[i + 1, 1] := FormatoHoraSprint(Filas[i].IngresoSeg + MinutosCH1 * 60);
        end
        else
        begin
          Datos[i + 1, 0] := '';
          Datos[i + 1, 1] := '';
        end;
        Datos[i + 1, 2] := Filas[i].NroMoto;
        Datos[i + 1, 3] := Filas[i].Piloto;
        Datos[i + 1, 4] := Filas[i].Categoria;
        Datos[i + 1, 5] := Filas[i].Modelo;
      end;
      Desde := Hasta + 1;
    end;

    R := Rango(FILA_ENCABEZADO, 1, FILA_ENCABEZADO + Length(Filas), NUM_COLS);
    R.NumberFormat := FORMATO_TEXTO_EXCEL;
    R.Value := Datos;

    R := Rango(FILA_ENCABEZADO, 1, FILA_ENCABEZADO, NUM_COLS);
    R.Interior.Color := RGB(44, 62, 80);
    R.Font.Color := RGB(255, 255, 255);
    R.Font.Bold := True;

    // Grupos de la misma hora: hora combinada, línea gruesa arriba y sombreado alternado
    Desde := 0;
    NroGrupo := 0;
    while Desde < Length(Filas) do
    begin
      Hasta := FinGrupoSprint(Filas, Desde);

      R := Rango(FILA_ENCABEZADO + 1 + Desde, 1, FILA_ENCABEZADO + 1 + Hasta, NUM_COLS);
      if Odd(NroGrupo) then
        R.Interior.Color := RGB(220, 230, 241);
      R.Borders[xlEdgeTop].LineStyle := xlContinuous;
      R.Borders[xlEdgeTop].Weight := xlMedium;

      for c := 1 to 2 do
      begin
        R := Rango(FILA_ENCABEZADO + 1 + Desde, c, FILA_ENCABEZADO + 1 + Hasta, c);
        if Hasta > Desde then
          R.Merge;
        R.HorizontalAlignment := xlCenter;
        R.VerticalAlignment := xlCenter;
        R.Font.Bold := True;
        R.Font.Size := 12;
      end;

      Inc(NroGrupo);
      Desde := Hasta + 1;
    end;

    // AutoFit solo de la tabla: el título largo de A1 no debe ensanchar la columna A
    Rango(FILA_ENCABEZADO, 1, FILA_ENCABEZADO + Length(Filas), NUM_COLS).Columns.AutoFit;
    Hoja.PageSetup.PrintTitleRows := '$' + IntToStr(FILA_ENCABEZADO) + ':$' + IntToStr(FILA_ENCABEZADO);
  finally
    Excel.DisplayAlerts := True;
    Excel.ScreenUpdating := True;
    Excel.Visible := True;
  end;
end;

function TGrillaPartida.GenerarHTMLSprint(const Filas: TFilasSprint; MinutosCH1: Integer): string;
var
  List: TStringList;
  Fila: string;
  i, Desde, Hasta, NroGrupo: Integer;
begin
  List := TStringList.Create;
  try
    List.Add('<style>');
    List.Add('  body { background-color: #f5f6f8; }');
    List.Add('  .grilla-sprint { font-family: Arial, Helvetica, sans-serif; max-width: 960px; margin: 0 auto; }');
    List.Add('  .evento-header { background: #ffffff; border-radius: 10px; box-shadow: 0 2px 6px rgba(0,0,0,0.12);');
    List.Add('    padding: 16px 20px; margin-bottom: 20px; text-align: center; }');
    List.Add('  .evento-titulo { font-size: 20px; font-weight: bold; color: #2c3e50; margin-bottom: 4px; }');
    List.Add('  .evento-subtitulo { font-size: 14px; color: #7f8c8d; margin-bottom: 10px; }');
    List.Add('  .evento-datos { font-size: 13px; color: #34495e; line-height: 1.6; }');
    List.Add('  .grilla-card { background: #ffffff; border-radius: 10px; box-shadow: 0 2px 6px rgba(0,0,0,0.12); overflow: hidden; }');
    List.Add('  .tabla-scroll { overflow-x: auto; -webkit-overflow-scrolling: touch; width: 100%; }');
    List.Add('  .grilla { border-collapse: collapse; width: 100%; }');
    List.Add('  .grilla th { background: #2c3e50; color: #ffffff; padding: 8px 10px; font-size: 13px;');
    List.Add('    text-transform: uppercase; text-align: left; }');
    List.Add('  .grilla td { padding: 6px 10px; font-size: 14px; border-bottom: 1px solid #eee; text-align: left; }');
    List.Add('  .grilla tbody { border-top: 3px solid #2c3e50; }');
    List.Add('  .grilla tbody.g1 { background: #eef3f9; }');
    List.Add('  .grilla td.hora { font-size: 17px; font-weight: bold; text-align: center; white-space: nowrap;');
    List.Add('    vertical-align: middle; color: #2c3e50; }');
    List.Add('  .grilla td.ch1 { border-right: 2px solid #dcdfe1; color: #7f8c8d; }');
    List.Add('  .grilla td.nro { font-weight: bold; text-align: center; }');
    List.Add('</style>');

    List.Add('<div class="grilla-sprint">');
    List.Add('  <div class="evento-header">');
    List.Add('    <div class="evento-titulo">Grilla de Ingreso a Parque Cerrado</div>');
    List.Add('    <div class="evento-subtitulo">Largada Sprint &middot; ' + HtmlEscSprint(ConstruirTituloEvento) + '</div>');
    List.Add('    <div class="evento-datos">');
    List.Add('      Largada CH1: ' + IntToStr(MinutosCH1) + ' min despu&eacute;s del ingreso<br>');
    List.Add('      &Uacute;ltima actualizaci&oacute;n: ' + FormatDateTime('dd-mm-yyyy hh:nn:ss', Now));
    List.Add('    </div>');
    List.Add('  </div>');

    List.Add('  <div class="grilla-card"><div class="tabla-scroll">');
    List.Add('  <table class="grilla">');
    List.Add('    <thead><tr><th>Ingreso</th><th>Largada CH1</th><th>Nro.</th><th>Piloto</th><th>Categor&iacute;a</th></tr></thead>');

    // Un <tbody> por grupo de la misma hora: hora con rowspan y sombreado alternado
    Desde := 0;
    NroGrupo := 0;
    while Desde < Length(Filas) do
    begin
      Hasta := FinGrupoSprint(Filas, Desde);
      List.Add('    <tbody class="g' + IntToStr(NroGrupo mod 2) + '">');
      for i := Desde to Hasta do
      begin
        Fila := '      <tr>';
        if i = Desde then
          Fila := Fila +
            '<td class="hora" rowspan="' + IntToStr(Hasta - Desde + 1) + '">' +
              FormatoHoraSprint(Filas[i].IngresoSeg) + '</td>' +
            '<td class="hora ch1" rowspan="' + IntToStr(Hasta - Desde + 1) + '">' +
              FormatoHoraSprint(Filas[i].IngresoSeg + MinutosCH1 * 60) + '</td>';
        Fila := Fila +
          '<td class="nro">' + HtmlEscSprint(Filas[i].NroMoto) + '</td>' +
          '<td>' + HtmlEscSprint(Filas[i].Piloto) + '</td>' +
          '<td>' + HtmlEscSprint(Filas[i].Categoria) + '</td></tr>';
        List.Add(Fila);
      end;
      List.Add('    </tbody>');
      Inc(NroGrupo);
      Desde := Hasta + 1;
    end;

    List.Add('  </table>');
    List.Add('  </div></div>');
    List.Add('</div>');
    Result := List.Text;
  finally
    List.Free;
  end;
end;

procedure TGrillaPartida.btnGrillaSprintClick(Sender: TObject);
var
  Filas: TFilasSprint;
  MinutosCH1: Integer;
  IdWeb: string;
begin
  Filas := CargarFilasSprint;
  if Length(Filas) = 0 then
  begin
    TF_EE_Message.ShowMessage(TComponent(Self), 'Grilla Sprint',
      'No hay pilotos en categorías con Tipo de Largada <b>Largada Sprint</b> y Nro. Largada asignado.<br>' +
      'Asigná el tipo y el Nro. Largada en la grilla de categorías y generá la lista de pilotos.',
      TF_EE_Message.INFORMATION, True);
    Exit;
  end;

  MinutosCH1 := ReadIntegerFromIniFile('Sprint', 'MinutosParqueCH1', 5);

  Screen.Cursor := crHourGlass;
  try
    ExportarSprintAExcel(Filas, MinutosCH1);
  finally
    Screen.Cursor := crDefault;
  end;

  // La web es un extra: si no hay internet el Excel ya quedó abierto
  IdWeb := 'grilla_' + ReadStringFromIniFile('Instancia', 'Nombre', '');
  try
    PublicarEnWorker(GenerarHTMLSprint(Filas, MinutosCH1), 'grilla_sprint_temp.html',
      'text/html; charset=utf-8', '/', IdWeb);
    TF_EE_Message.ShowMessage(TComponent(Self), 'Grilla Sprint',
      'Se publicaron <b>' + IntToStr(Length(Filas)) + '</b> pilotos en la web:<br>' +
      URL_WORKER + '/?id=' + IdWeb, TF_EE_Message.INFORMATION, True);
  except
    on E: Exception do
    begin
      TLog.Error('GrillaSprint', 'No se pudo publicar la grilla: ' + E.Message);
      TF_EE_Message.ShowMessage(TComponent(Self), 'Grilla Sprint',
        'El Excel se generó, pero no se pudo publicar en la web:<br>' + E.Message,
        TF_EE_Message.ERROR, True);
    end;
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

  btnGrillaSprint := TAeroButton.Create(Self);
  btnGrillaSprint.Parent := buttonPanel;
  btnGrillaSprint.SetBounds(btnHoleshot.Left - 153, btnHoleshot.Top, 147, btnHoleshot.Height);
  btnGrillaSprint.Anchors := [akTop, akRight];
  btnGrillaSprint.Images := cxButtonImageList;
  btnGrillaSprint.ImageIndex := 3;
  btnGrillaSprint.Spacing := 10;
  btnGrillaSprint.Caption := 'Grilla Sprint';
  btnGrillaSprint.Hint := 'Excel y Web con el horario de ingreso a parque cerrado (Largada Sprint)';
  btnGrillaSprint.ShowHint := True;
  btnGrillaSprint.OnClick := btnGrillaSprintClick;

    QueryPilotos.Active:= True;
  end;
end.
