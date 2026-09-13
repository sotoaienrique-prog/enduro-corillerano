unit ReportTotalPuestoEvento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, QuickRpt, QRCtrls,
  Data.DB, ZAbstractRODataset, ZDataset;

type
  TReporteTotalPuestoEvento = class(TForm)
    QuickReport: TQuickRep;
    bTitle: TQRBand;
    QRGroup: TQRGroup;
    txtNombreCategoria: TQRDBText;
    QRBand: TQRBand;
    lblPuntosAcumulados: TQRLabel;
    lblPosicion: TQRLabel;
    lblNroMoto: TQRLabel;
    lblPiloto: TQRLabel;
    lblModeloMoto: TQRLabel;
    lblLocalidad: TQRLabel;
    lblPosValue: TQRLabel;
    txtPuntosAcumulados: TQRDBText;
    txtNroMoto: TQRDBText;
    txtPiloto: TQRDBText;
    txtModeloMoto: TQRDBText;
    txtLocalidad: TQRDBText;
    ZSelectReporteEvento: TZReadOnlyQuery;
    DSSelectReporteEvento: TDataSource;
    ZEventos: TZReadOnlyQuery;
    DSEventos: TDataSource;
    lblTitle: TQRLabel;
    txtEvento: TQRDBText;
    shape: TQRShape;
    procedure QRBandBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRGroupBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
     eventoOID, categoriaOID, campeonatoOID : Integer;
     nombreCategoria : String;
    function buildQRLabel(captionStr: String; LeftMgn, RecordNO : Integer) : TQRLabel;
    function buildQRDBText(dataFieldStr: String; LeftMgn, RecordNO : Integer) : TQRDBText;
    function buildQRShape(LeftMgn, RecordNO: Integer; penStyle: TPenStyle) : TQRShape;
  public
    procedure setEventoOID(eventoOID : Integer);
    procedure setCategoriaOID(categoriaOID : Integer);
    procedure setCampeonatoOID(campeonatoOID : Integer);
    procedure setNombreCategoria(nombreCategoria : String);
    procedure showReport;

    function buildSqlString: String;
  end;

var
  i : Integer;
  puestoFields : TStringList;
implementation

{$R *.dfm}
function TReporteTotalPuestoEvento.buildQRLabel(captionStr: String; LeftMgn, RecordNO : Integer) : TQRLabel;
var
 QRLabel : TQRLabel;
begin
  QRLabel:= TQRLabel.Create(nil);
  QRLabel.Caption:= captionStr;
  QRLabel.Left:= LeftMgn + (100*(RecordNO-1));
  QRLabel.Alignment:= taCenter;
  QRLabel.Parent:= QRGroup;
  QRLabel.Top:= lblLocalidad.Top;
  QRLabel.Font:= lblLocalidad.Font;
  QRLabel.Width:= 33;
  QRLabel.Color:= lblLocalidad.Color;

  Result:= QRLabel;
end;

function TReporteTotalPuestoEvento.buildQRShape(LeftMgn, RecordNO: Integer; penStyle: TPenStyle) : TQRShape;
var
 QRShape : TQRShape;
begin
  QRShape:= TQRShape.Create(nil);
  QRShape.Left:= LeftMgn + (100*(RecordNO-1)) - 1;
  QRShape.Shape:= qrsVertLine;
  QRShape.Parent:= QRBand;
  QRShape.Pen.Style:= penStyle;

  Result:= QRShape;
end;

function TReporteTotalPuestoEvento.buildQRDBText(dataFieldStr: String; LeftMgn, RecordNO : Integer) : TQRDBText;
var
 QRDBText : TQRDBText;
begin
  QRDBText:= TQRDBText.Create(nil);
  QRDBText.DataSet:= ZSelectReporteEvento;
  QRDBText.Font:= txtLocalidad.Font;
  QRDBText.Parent:= QRBand;
  QRDBText.Top:= txtLocalidad.Top;
  QRDBText.Left:= LeftMgn + (100*(RecordNO-1));
  QRDBText.DataField:= dataFieldStr + IntToStr(RecordNO);
  QRDBText.ParentFont:= True;
  QRDBText.Transparent:= True;
  QRDBText.Width:= 33;

  Result:= QRDBText;
end;

procedure TReporteTotalPuestoEvento.showReport;
var
  QRLabel, QRLabel2, QRLabeTitulo : TQRLabel;
  QRDBText, QRDBText2 : TQRDBText;
  LeftMargin1, LeftMargin2: Integer;
begin
    with ZSelectReporteEvento do
    begin
      Close;
      SQL.Clear;
      SQL.Append(buildSqlString);
      ParamByName('evento_oid').AsInteger:= eventoOID;
//      ParamByName('categoria_oid').AsInteger:= categoriaOID;
      ParamByName('campeonato_oid').AsInteger:= campeonatoOID;
      ParamByName('nombre_categoria').AsString:= nombreCategoria;
      Open;
    end;

    with ZEventos do
    begin
      Close;
      ParamByName('evento_oid').AsInteger:= eventoOID;
      Open;

      puestoFields := TStringList.Create;

      while not Eof do
      begin
        LeftMargin1:= lblLocalidad.Left + lblLocalidad.Width;
        LeftMargin2:= LeftMargin1 + 50;

        QRLabel:= buildQRLabel('Pos.', LeftMargin1, RecNo);
        QRLabel2:= buildQRLabel('Ptos.', LeftMargin2, RecNo);

        QRLabeTitulo:= TQRLabel.Create(nil);
        QRLabeTitulo.Font:= txtLocalidad.Font;
        QRLabeTitulo.Left:= (LeftMargin1-5) + (100*(RecNo-1));
        QRLabeTitulo.Caption:= FieldByName('nro_fecha').AsString +
          '# - ' + FieldByName('nombre').AsString;
        QRLabeTitulo.Parent:= QRGroup;
        QRLabeTitulo.Width:= 100;
        QRLabeTitulo.Height:= 35;
        QRLabeTitulo.AutoSize:= False;
        QRLabeTitulo.AutoStretch:= False;
        QRLabeTitulo.WordWrap:= True;
        QRLabeTitulo.Color:= clYellow;

        buildQRShape(LeftMargin1, RecNo, psDot);
        QRDBText:= buildQRDBText('puesto_fecha_', LeftMargin1, RecNo);
        puestoFields.Add('puesto_fecha_'+IntToStr(RecNo));
        buildQRShape(LeftMargin2, RecNo, psSolid);
        QRDBText2:= buildQRDBText('punto_fecha_', LeftMargin2, RecNo);

        Next;
      end;
    end;

    if ZSelectReporteEvento.RecordCount > 0 then
      begin
        QuickReport.Preview;
      end;
end;

procedure TReporteTotalPuestoEvento.QRBandBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
var
  index : Integer;
  found : Boolean;
begin
  inc(i);
  lblPosValue.Caption:= IntToStr(i);

  if (Assigned(puestoFields)) then
  begin
    found:= False;
    for index := 0 to puestoFields.Count - 1 do
      if (ZSelectReporteEvento.FieldByName(puestoFields[index]).AsString = '1') then
      begin
        found:= True;
        Break;
      end;

    if (found) then
      begin
        Sender.Font.Style:= [fsBold];
        Sender.Color:= cl3DLight;
      end
    else
      begin
        Sender.Color:= clWhite;
        Sender.Font.Style:= [];
      end;
  end;
end;

procedure TReporteTotalPuestoEvento.QRGroupBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
  i:= 0;
end;

procedure TReporteTotalPuestoEvento.setEventoOID(eventoOID : Integer);
begin
  self.eventoOID:= eventoOID;
end;

procedure TReporteTotalPuestoEvento.setCategoriaOID(categoriaOID : Integer);
begin
  self.categoriaOID:= categoriaOID;
end;

procedure TReporteTotalPuestoEvento.setCampeonatoOID(campeonatoOID : Integer);
begin
  self.campeonatoOID:= campeonatoOID;
end;

procedure TReporteTotalPuestoEvento.setNombreCategoria(nombreCategoria : String);
begin
  self.nombreCategoria:= nombreCategoria;
end;

function TReporteTotalPuestoEvento.buildSqlString: String;
var
  stringSQLPrefix, stringSQLSufix, sqlDinamic, sql : String;
  i : Integer;
begin
    stringSQLPrefix:= ' select distinct sel_nro_moto_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, eve.oid, p.oid) as nro_moto, CONCAT(p.apellido, '+QuotedStr(', ')+'  , p.nombre) as nombre_apellido, ' +
    ' l.localidad, mm.nombre as nombre_moto, sel_nombre_categoria_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, eve.oid, p.oid) as nombre_categoria, ';

    stringSQLSufix:= ' sel_total_puntos_by_event_oid_and_pilot_oid(:evento_oid, p.oid, :campeonato_oid, ipe.tipo_categoria_oid, sel_categoria_oid_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, :evento_oid, p.oid)) as puntos_acumulados '+
        '  from inscripcion_piloto_evento ipe '+
        ' join piloto p on ipe.piloto_oid = p.oid '+
        ' join evento eve on eve.oid = ipe.evento_oid '+
        ' left join puntos_piloto_evento ppe_sel on ppe_sel.piloto_oid = ipe.piloto_oid and ppe_sel.evento_oid = ipe.evento_oid '+
        ' join localidad l on p.localidad_oid = l.oid '+
        ' join modelo_moto mm on p.modelo_moto_oid = mm.oid '+

        ' where eve.fecha <= (select fecha from evento e where e.oid = :evento_oid) '+
        ' AND eve.campeonato_oid = :campeonato_oid '+
        ' AND sel_nombre_categoria_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, eve.oid, p.oid) = :nombre_categoria';

  sqlDinamic:= '';

    with ZEventos do
    begin
      Close;
      ParamByName('evento_oid').AsInteger:= eventoOID;
      Open;

      stringSQLSufix:= stringSQLSufix  + ' order by nombre_categoria, puntos_acumulados desc, ';

      for i := RecordCount downto 1 do
        stringSQLSufix:= stringSQLSufix  + 'punto_fecha_'+IntToStr(i)+' = 0, puesto_fecha_'+IntToStr(i)+', ';

      stringSQLSufix:= stringSQLSufix  + 'ipe.oid ';

      while not Eof do
      begin

        sqlDinamic:= sqlDinamic + ' sel_puntos_by_event_oid_and_pilot_oid('+FieldByName('oid').AsString+', p.oid, ipe.tipo_categoria_oid, sel_categoria_oid_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, eve.oid, p.oid)) as punto_fecha_'+IntToStr(RecNo)+', '+
                                  ' sel_puesto_by_event_oid_and_pilot_oid('+FieldByName('oid').AsString+', p.oid, ipe.tipo_categoria_oid, sel_categoria_oid_by_evento_and_tipo_categoria(ipe.tipo_categoria_oid, eve.oid, p.oid)) as puesto_fecha_'+IntToStr(RecNo)+', ';

        Next;
      end;
    end;

    sql:= stringSQLPrefix + sqlDinamic + stringSQLSufix;
    Result:= sql;
end;

end.
