unit ImportarAbastecimientoEnTomaTiempo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ImgList, cxGraphics, Vcl.StdCtrls,
  AeroButtons, Vcl.ExtCtrls, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
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
  dxSkinXmas2008Blue, Vcl.DBCtrls, cxLabel, ZDataset, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZAbstractTable, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, AddTomaTiempo, Entidades,
  BussinessDataSubsystemFacade, F_EEMessage, Vcl.OleServer, Excel2010;

type
  TImportarTomaTiempoAbastecimiento = class(TForm)
    cxButtonImageList: TcxImageList;
    buttonPanel: TPanel;
    btnClose: TAeroButton;
    ZCampeonato: TZTable;
    DSCampeonato: TDataSource;
    DSEvento: TDataSource;
    ZEvento: TZReadOnlyQuery;
    topPanel: TPanel;
    lblCampeonato: TcxLabel;
    cmbCampeonato: TDBLookupComboBox;
    cmbEvento: TDBLookupComboBox;
    lblEvento: TcxLabel;
    ZTomaTiempoEventoCont: TZReadOnlyQuery;
    DSTomaTiempoEventoCont: TDataSource;
    lblTomaTiempoEventoCont: TcxLabel;
    cmbTomaTiempoEventoCont: TDBLookupComboBox;
    buttomPanel: TPanel;
    cxGridPosiciones: TcxGrid;
    cxGridPosicionesDBTableView: TcxGridDBTableView;
    cxGridPosicionesDBTableViewnro_moto: TcxGridDBColumn;
    cxGridPosicionesDBTableViewnombre_piloto: TcxGridDBColumn;
    cxGridPosicionesDBTableViewcategoria: TcxGridDBColumn;
    cxGridPosicionesLevel: TcxGridLevel;
    DSPosiciones: TDataSource;
    ZROQPosiciones: TZReadOnlyQuery;
    QueryCategoriasFilter: TZQuery;
    btnImportar: TAeroButton;
    cxImageList1: TcxImageList;
    Excel: TExcelApplication;
    procedure FormCreate(Sender: TObject);
    procedure cmbTomaTiempoEventoContCloseUp(Sender: TObject);
    procedure btnImportarClick(Sender: TObject);
  private
    { Private declarations }
    procedure RefreshPosiciones;
    function getPositionSQL(TomaTiempoEventoOID : Integer): String;
    function getCategoriasByTomaTiempo(TomaTiempoEventoOID : Integer): String;
    procedure updateGridRows;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TImportarTomaTiempoAbastecimiento.btnImportarClick(Sender: TObject);
var
  openDialog : TOpenDialog;

  i, tomaTiempoOID, numero, vuelta, pilotoOID, imp: Integer;
  si, categoria, horaPasada: String;
  Hoja: _WorkSheet;
  hora : TDateTime;
  tiempo : Double;
  tomaTiempoEventoVO : TTomaTiempoEventoVO;

  FN: String;
  F:TextFile;
begin
    // Getting the filename for the logfile (In this case the Filename is 'application-exename.log'
    FN := ChangeFileExt(Application.Exename, FormatDateTime('yyyymmddhhmmss', Now)+'.log');
    // Assigns Filename to variable F
    AssignFile(F, FN);
    // Rewrites the file F
    Rewrite(F);
    // Open file for appending
    Append(F);


  // Create the open dialog object - assign to our open dialog variable
  openDialog := TOpenDialog.Create(self);

  // Set up the starting directory to be the current one
  openDialog.InitialDir := GetCurrentDir;

  // Only allow existing files to be selected
  openDialog.Options := [ofFileMustExist];

  // Allow only .dpr and .pas files to be selected
  openDialog.Filter :=
    'Excel File|*.xls|Excel File|*.xlsx';

  // Display the open file dialog
  if openDialog.Execute then
    begin
      Excel.Workbooks.Open(openDialog.FileName,
        EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
        EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
        EmptyParam, EmptyParam, EmptyParam, EmptyParam, 0 );
    end;

    Hoja := Excel.Worksheets.Item[1] as _WorkSheet;

    i := 2;
    imp := 0;
    si := IntToStr(i);

    if (cmbTomaTiempoEventoCont.KeyValue > 0) then
      begin
        tomaTiempoOID:= cmbTomaTiempoEventoCont.KeyValue;
        WriteLn(F, FormatDateTime('[yyyy/mm/dd hh:mm:ss] ', Now) + 'tomaTiempoOID: ' + IntToStr(tomaTiempoOID));
        TBussinessDataSubsystemFacade.getInstance.deleteTomasImportadas(tomaTiempoOID);
        WriteLn(F, FormatDateTime('[yyyy/mm/dd hh:mm:ss] ', Now) + 'deleteTomasImportadas');
        repeat
          numero:= Hoja.Range['A'+si,'A'+si].Value2; // Numero
          categoria:= Trim(Hoja.Range['B'+si,'B'+si].Value2); // Categoria
          tiempo:= Hoja.Range['E'+si,'E'+si].Value2; // Tiempo Pasado
          horaPasada := FormatDateTime('hh:nn:ss', tiempo);
          hora:= StrToDateTime(horaPasada);
          ReplaceDate(hora, Date);
          //vuelta:= Hoja.Range['F'+si,'F'+si].Value2; // Nro Vuelta

          WriteLn(F, FormatDateTime('[yyyy/mm/dd hh:mm:ss] ', Now) + 'getTomaTiempoEventoVO start');
          tomaTiempoEventoVO:= TBussinessDataSubsystemFacade.getInstance.getTomaTiempoEventoVO(tomaTiempoOID);
          WriteLn(F, FormatDateTime('[yyyy/mm/dd hh:mm:ss] ', Now) + 'getTomaTiempoEventoVO end');
          WriteLn(F, FormatDateTime('[yyyy/mm/dd hh:mm:ss] ', Now) + 'getPilotoOIDByNumMotoAndTipoCategoria start');
          pilotoOID:= TBussinessDataSubsystemFacade.getInstance
            .getPilotoOIDByNumMotoAndTipoCategoria(numero, 3, tomaTiempoEventoVO.EventoOID);
          WriteLn(F, FormatDateTime('[yyyy/mm/dd hh:mm:ss] ', Now) + 'getPilotoOIDByNumMotoAndTipoCategoria end. pilotoOID' + IntToStr(pilotoOID));

          if (pilotoOID > 0) then
            begin
              WriteLn(F, FormatDateTime('[yyyy/mm/dd hh:mm:ss] ', Now) + 'addTomaTiempoWithTime start');
              TBussinessDataSubsystemFacade.getInstance.addTomaTiempoWithTime(tomaTiempoOID, pilotoOID, hora, true);
              WriteLn(F, FormatDateTime('[yyyy/mm/dd hh:mm:ss] ', Now) + 'addTomaTiempoWithTime end');
              Inc( imp );
            end;

          Inc( i );
          si := IntToStr( i );
        until (VarType( Excel.Range['A'+si,'A'+si].Value2) = VarEmpty);

        TF_EE_Message.ShowMessage(TComponent(Self),'Operación Exitosa',
          'Se realizó exitosamente la importación de ' + IntToStr(imp) + ' Tomas de Tiempos.', TF_EE_Message.INFORMATION, False);
      end;
end;

procedure TImportarTomaTiempoAbastecimiento.cmbTomaTiempoEventoContCloseUp(
  Sender: TObject);
begin
RefreshPosiciones;
updateGridRows
end;

procedure TImportarTomaTiempoAbastecimiento.FormCreate(Sender: TObject);
begin
  ZCampeonato.Active:= True;
  ZEvento.Active:= True;
  ZTomaTiempoEventoCont.Active:= True;
end;

procedure TImportarTomaTiempoAbastecimiento.RefreshPosiciones;
var
  tomaTiempoEventoVO: TTomaTiempoEventoVO;
begin
    with ZROQPosiciones do
      begin
        Close;
        SQL.Text:= getPositionSQL(cmbTomaTiempoEventoCont.KeyValue);
        ParamByName('toma_tiempo_evento_oid').AsInteger:= cmbTomaTiempoEventoCont.KeyValue;
        Open;
      end;

      tomaTiempoEventoVO:= TBussinessDataSubsystemFacade.getInstance
        .getTomaTiempoEventoVO(cmbTomaTiempoEventoCont.KeyValue);

    cxGridPosicionesDBTableView.ViewData.Expand(True);
end;

function TImportarTomaTiempoAbastecimiento.getCategoriasByTomaTiempo(TomaTiempoEventoOID : Integer): String;
var
  categoriasIn: String;
  firstItemFlag : Boolean;
begin
    with QueryCategoriasFilter do
      begin
        Close;
        ParamByName('toma_tiempo_evento_oid').AsInteger:= TomaTiempoEventoOID;
        Open;
      end;

  categoriasIn:= '';
  firstItemFlag:= True;
  with QueryCategoriasFilter do
    begin
      First;
      while not EOF do
        begin
          if (not firstItemFlag) then
            categoriasIn:= categoriasIn + ', ';
          categoriasIn:= categoriasIn + FieldByName('oid').AsString;
          firstItemFlag:= False;
          Next;
        end;
    end;

    Result:= categoriasIn;
end;

function TImportarTomaTiempoAbastecimiento.getPositionSQL(TomaTiempoEventoOID : Integer): String;
var
  sqlStringPrefix, sqlStringSufix, categoriasIn: String;
  eventoVO : TEvento;
  eventoPuntoControlVO : TEventoPuntoControl;
  i : Integer;
begin
  categoriasIn:= getCategoriasByTomaTiempo(TomaTiempoEventoOID);

  sqlStringPrefix:= 'select sel_nro_moto_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid) nro_moto, ' +
//       ' CONCAT(p.apellido, ' + QuotedStr(', ') + ' , p.nombre) as nombre_piloto, ' +
       ' CASE WHEN c.utiliza_acompaniante = 1 THEN CONCAT(UC_Words(CONCAT(p.apellido, ' + QuotedStr(', ') + ' , p.nombre)), IFNULL(UC_Words(CONCAT(' + QuotedStr(' / ') + ', n.apellido, ' + QuotedStr(', ') + ' , n.nombre)), ' + QuotedStr(' ') + '))' +
       ' ELSE UC_Words(CONCAT(p.apellido, ' + QuotedStr(', ') + ' , p.nombre)) END AS nombre_piloto, ' +
       ' sel_nombre_categoria_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid) categoria, ' +
       ' sel_handicup_by_evento_and_piloto_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid) handicup, ' +
       ' sel_recargo_by_toma_tiempo_evento_and_piloto_and_tipo_categoria(tte.oid, ipe.tipo_categoria_oid, ipe.piloto_oid) recargo,' +
       ' sel_total_time(tt.toma_tiempo_evento_oid, tt.piloto_oid) tiempo_sec, ' +
       ' sel_formatted_total_time(sel_total_time(tt.toma_tiempo_evento_oid, tt.piloto_oid)) formated_tiempo_sec, ' +
//       ' TIME_FORMAT(sel_total_time_time_format(tt.toma_tiempo_evento_oid, tt.piloto_oid),' + QuotedStr('%H:%i:%s.%f') + ') formated_tiempo_sec, ' +
       ' sel_can_vueltas(tt.toma_tiempo_evento_oid, tt.piloto_oid) max_nro_vuelta ';

  eventoVO:= TBussinessDataSubsystemFacade.getInstance.getEvento(cmbEvento.KeyValue);

  if (eventoVO.PuntoDeControl.Count>0) then
    begin
      for eventoPuntoControlVO in eventoVO.PuntoDeControl do
        begin
            sqlStringPrefix:= sqlStringPrefix + ', sel_lap_time(:toma_tiempo_evento_oid, p.oid, '+IntToStr(eventoPuntoControlVO.NumeroPuntoControl)+') vuelta_'+IntToStr(eventoPuntoControlVO.NumeroPuntoControl);
        end;
    end
  else
    begin
      for i:= 1 to eventoVO.NroVueltas do
        begin
          sqlStringPrefix:= sqlStringPrefix + ', sel_lap_time(:toma_tiempo_evento_oid, p.oid, '+IntToStr(i)+') vuelta_'+IntToStr(i);
        end;
    end;

  sqlStringSufix:= ' from toma_tiempos tt ' +
     ' join toma_tiempo_evento tte on tt.toma_tiempo_evento_oid = tte.oid ' +
     ' join piloto p on tt.piloto_oid = p.oid ' +
     ' join inscripcion_piloto_evento ipe on (ipe.evento_oid = tte.evento_oid and ipe.piloto_oid = tt.piloto_oid) ' +
     ' left join navegante n on n.piloto_oid = p.oid, categorias c ' +
     ' where tte.oid = :toma_tiempo_evento_oid ' +
     ' and c.oid = sel_categoria_oid_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, ipe.evento_oid, ipe.piloto_oid) ';
     if (categoriasIn <> '') then
        sqlStringSufix:= sqlStringSufix + ' and sel_categoria_oid_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, tte.evento_oid, ipe.piloto_oid) in (' + categoriasIn + ')';
     sqlStringSufix:= sqlStringSufix + ' group by p.oid ' +
     ' order by categoria, max_nro_vuelta desc, tiempo_sec asc, tt.oid asc ';

  Result:= sqlStringPrefix + sqlStringSufix;
end;

procedure TImportarTomaTiempoAbastecimiento.updateGridRows;
var
  i : Integer;
  eventoVO : TEvento;
  AColumn: TcxGridDBColumn;
  eventoPuntoControlVO : TEventoPuntoControl;
begin
  //Clear All Columns
  for i := 1 to cxGridPosicionesDBTableView.ColumnCount do
    begin
        cxGridPosicionesDBTableView.Columns[0].Free
    end;

  eventoVO:= TBussinessDataSubsystemFacade.getInstance.getEvento(cmbEvento.KeyValue);

  AColumn:= cxGridPosicionesDBTableView.CreateColumn;
  AColumn.DataBinding.ValueType:= 'Integer';
  AColumn.DataBinding.FieldName:= 'nro_moto';
  AColumn.Caption:= 'Nro. Moto';
  AColumn.Width:= 25;

  AColumn:= cxGridPosicionesDBTableView.CreateColumn;
  AColumn.DataBinding.ValueType:= 'String';
  AColumn.DataBinding.FieldName:= 'categoria';
  AColumn.Caption:= 'Categoría';
  AColumn.GroupIndex:= 0;
  AColumn.Visible:= False;
  AColumn.SortOrder:= soAscending;

  AColumn:= cxGridPosicionesDBTableView.CreateColumn;
  AColumn.DataBinding.ValueType:= 'String';
  AColumn.DataBinding.FieldName:= 'nombre_piloto';
  AColumn.Caption:= 'Piloto';
  AColumn.Width:= 110;

  if (eventoVO.PuntoDeControl.Count>0) then
    begin
      for eventoPuntoControlVO in eventoVO.PuntoDeControl do
        begin
          AColumn:= cxGridPosicionesDBTableView.CreateColumn;
          AColumn.DataBinding.ValueType:= 'String';
          AColumn.DataBinding.FieldName:= 'vuelta_'+IntToStr(eventoPuntoControlVO.NumeroPuntoControl);
          AColumn.Caption:= eventoPuntoControlVO.Nombre;
          AColumn.Width:= 30;
        end;
    end
  else
    begin
      for i:= 1 to eventoVO.NroVueltas do
        begin
          AColumn:= cxGridPosicionesDBTableView.CreateColumn;
          AColumn.DataBinding.ValueType:= 'String';
          AColumn.DataBinding.FieldName:= 'vuelta_'+IntToStr(i);
          AColumn.Caption:= 'Vuelta #'+IntToStr(i);
          AColumn.Width:= 30;
        end;
    end;

  AColumn:= cxGridPosicionesDBTableView.CreateColumn;
  AColumn.DataBinding.ValueType:= 'Integer';
  AColumn.DataBinding.FieldName:= 'handicup';
  AColumn.Caption:= 'Handicup';
  AColumn.Width:= 30;

  AColumn:= cxGridPosicionesDBTableView.CreateColumn;
  AColumn.DataBinding.ValueType:= 'Integer';
  AColumn.DataBinding.FieldName:= 'recargo';
  AColumn.Caption:= 'Recargo';
  AColumn.Width:= 30;

  AColumn:= cxGridPosicionesDBTableView.CreateColumn;
  AColumn.DataBinding.ValueType:= 'String';
  AColumn.DataBinding.FieldName:= 'max_nro_vuelta';
  AColumn.Caption:= 'Vueltas';
  AColumn.Width:= 30;

  AColumn:= cxGridPosicionesDBTableView.CreateColumn;
  AColumn.DataBinding.ValueType:= 'String';
  AColumn.DataBinding.FieldName:= 'formated_tiempo_sec';
  AColumn.Caption:= 'Tiempo Total';
  AColumn.Width:= 30;
end;


end.
