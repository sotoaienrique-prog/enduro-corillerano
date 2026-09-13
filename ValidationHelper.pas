unit ValidationHelper;

interface

uses
  DataModule, SysUtils, DateUtils, Variants;

type
  TValidationHelper = class(TObject)
  public
    class function isStringEmpty(value : String): Boolean;
    class function isIntegerNull(value : Integer): Boolean;
    class function validateUnique(Entity, Field : String; Value: Variant; OID: Integer): Boolean;
    class function validateUniqueNumMotoInCategoria(NumMoto, CategoriaOID, OID: Integer): Boolean;
    class function validateUniqueNumMotoInCategoriaMotocross(NumMoto, CategoriaOID, OID: Integer): Boolean;
    class function validateUniqueNumMotoInCategoriaCuatriciclos(NumMoto, CategoriaOID, OID: Integer): Boolean;
    class function validateUniqueCampeonInCategoria(CategoriaOID, OID: Integer): Boolean;
    class function validateUniqueCampeonInCategoriaMotocross(CategoriaOID, OID: Integer): Boolean;
    class function validateUniqueCampeonInCategoriaCuatriciclos(CategoriaOID, OID: Integer): Boolean;
    class function validateNumMoto(NumMoto, CategoriaOID: Integer): Boolean;
    class function validateInscripcion(EventoOID, PilotoOID, TipoCategoriaOID: Integer): Boolean;
    class function isValidEmail(const Value: string): Boolean;
    class function assertNull(const Value: TObject): Boolean;
    class function validateNumerationRange(const oid, value, tipoCategoriaOID: Integer): Boolean;
    class function validateEdadCategoria(const eventoOID, pilotoOID, tipoCategoriaOID: Integer): Boolean;
    class function isDateAfter(fecha: TDate): Boolean;
    class function getNumMotoByTipoCategoria(const pilotOID, tipoCategoriaOID: Integer): Boolean;
    class function IsEmptyOrNull(const Value: TObject): Boolean;
    class function validateCategoriaNavegante(CategoriaOID: Integer): Boolean;
  end;

implementation

  class function TValidationHelper.validateCategoriaNavegante(CategoriaOID: Integer): Boolean;
  begin
    with ConnectionModule.ZUniqueValidation do
    begin
      Close;
      SQL.Text:= 'SELECT c.utiliza_acompaniante FROM categorias c'+
        ' WHERE c.oid = :categoria_oid';
      ParamByName('categoria_oid').AsInteger:= CategoriaOID;
      Open;

      Result:= (FieldByName('utiliza_acompaniante').AsInteger = 1);
    end;
  end;

  class function TValidationHelper.IsEmptyOrNull(const Value: TObject): Boolean;

  begin
    //Result := VarIsClear(Value) or VarIsEmpty(Value) or VarIsNull(Value) or (VarCompareValue(Value, Unassigned) = vrEqual);
    //if (not Result) and VarIsStr(Value) then
    //  Result := Value = '';

    Result:= not (Assigned(Value) and (Value <> nil));
  end;

  class function TValidationHelper.isStringEmpty(value : String): Boolean;
  begin
      Result:= length(value) = 0;
  end;

  class function TValidationHelper.validateUniqueNumMotoInCategoria(NumMoto, CategoriaOID, OID: Integer): Boolean;
  begin
    with ConnectionModule.ZUniqueValidation do
    begin
      Close;
      SQL.Text:= 'select p.oid from piloto p'+
       ' where p.nro_moto = :nro_moto AND p.categoria_oid = :categoria_oid AND p.OID <> :OID';
      ParamByName('nro_moto').AsInteger:= NumMoto;
      ParamByName('categoria_oid').AsInteger:= CategoriaOID;
      ParamByName('OID').AsInteger:= OID;
      Open;

      Result:= (RecordCount > 0);
    end;
  end;

  class function TValidationHelper.validateUniqueNumMotoInCategoriaMotocross(NumMoto, CategoriaOID, OID: Integer): Boolean;
  begin
    with ConnectionModule.ZUniqueValidation do
    begin
      Close;
      SQL.Text:= 'select p.oid from piloto p'+
       ' where p.nro_moto_cross = :nro_moto AND p.categoria_motocross_oid = :categoria_oid AND p.OID <> :OID';
      ParamByName('nro_moto').AsInteger:= NumMoto;
      ParamByName('categoria_oid').AsInteger:= CategoriaOID;
      ParamByName('OID').AsInteger:= OID;
      Open;

      Result:= (RecordCount > 0);
    end;
  end;

  class function TValidationHelper.validateUniqueNumMotoInCategoriaCuatriciclos(NumMoto, CategoriaOID, OID: Integer): Boolean;
  begin
    with ConnectionModule.ZUniqueValidation do
    begin
      Close;
      SQL.Text:= 'select p.oid from piloto p'+
        ' where p.nro_cuatriciclo = :nro_moto AND p.categoria_cuatriciclos_oid = :categoria_oid AND p.OID <> :OID';
      ParamByName('nro_moto').AsInteger:= NumMoto;
      ParamByName('categoria_oid').AsInteger:= CategoriaOID;
      ParamByName('OID').AsInteger:= OID;
      Open;

      Result:= (RecordCount > 0);
    end;
  end;

  class function TValidationHelper.validateUniqueCampeonInCategoria(CategoriaOID, OID: Integer): Boolean;
    begin
    with ConnectionModule.ZUniqueValidation do
    begin
      Close;
      SQL.Text:= 'select p.oid from piloto p'+
        ' where p.es_campeon = 1 AND p.categoria_oid = :categoria_oid AND p.OID <> :OID';
      ParamByName('categoria_oid').AsInteger:= CategoriaOID;
      ParamByName('OID').AsInteger:= OID;
      Open;
      Result:= (RecordCount > 0);
    end;
  end;

  class function TValidationHelper.validateUniqueCampeonInCategoriaMotocross(CategoriaOID, OID: Integer): Boolean;
    begin
    with ConnectionModule.ZUniqueValidation do
    begin
      Close;
      SQL.Text:= 'select p.oid from piloto p'+
        ' where p.es_campeon = 1 AND p.categoria_motocross_oid = :categoria_oid AND p.OID <> :OID';
      ParamByName('categoria_oid').AsInteger:= CategoriaOID;
      ParamByName('OID').AsInteger:= OID;
      Open;

      Result:= (RecordCount > 0);
    end;
  end;

  class function TValidationHelper.validateUniqueCampeonInCategoriaCuatriciclos(CategoriaOID, OID: Integer): Boolean;
  begin
    with ConnectionModule.ZUniqueValidation do
    begin
      Close;
      SQL.Text:= 'select p.oid from piloto p'+
        ' where p.es_campeon = 1 AND p.categoria_cuatriciclos_oid = :categoria_oid AND p.OID <> :OID';
      ParamByName('categoria_oid').AsInteger:= CategoriaOID;
      ParamByName('OID').AsInteger:= OID;
      Open;

      Result:= (RecordCount > 0);
    end;
  end;

  class function TValidationHelper.validateUnique(Entity, Field : String; Value: Variant; OID: Integer): Boolean;
  begin
    with ConnectionModule.ZUniqueValidation do
    begin
      Close;
      SQL.Text:= 'select oid from '+Entity+' where UPPER('
                  +Field+') = UPPER(:value) AND OID <> :OID';
      ParamByName('value').Value:= Value;
      ParamByName('OID').AsInteger:= OID;
      Open;

      Result:= (RecordCount > 0);
    end;
  end;

  class function TValidationHelper.validateNumMoto(NumMoto, CategoriaOID: Integer): Boolean;
  begin
    with ConnectionModule.ZUniqueValidation do
    begin
      Close;
      SQL.Text:= 'select oid '+
                    'from numeracion_categoria nc '+
                    'where nc.categoria_oid = :categoria_oid '+
                      'and :nro_moto between nc.inicio and nc.fin';

      ParamByName('categoria_oid').AsInteger:= CategoriaOID;
      ParamByName('nro_moto').AsInteger:= NumMoto;
      Open;

      Result:= (RecordCount > 0);
    end;
  end;

  class function TValidationHelper.isIntegerNull(value : Integer): Boolean;
  begin
      Result:= value = 0;
  end;

  class function TValidationHelper.isValidEmail(const Value: string): Boolean;


    function CheckAllowed(const s: string): Boolean;
      var i: Integer;
      begin
        Result:= false;
        for i:= 1 to Length(s) do
          if not (s[i] in ['a'..'z',
                           'A'..'Z',
                           '0'..'9',
                           '_',
                           '-',
                           '.']) then Exit;
        Result:= true;
      end;

  var
    i: Integer;
    NamePart, ServerPart: string;
  begin
    Result:= False;
    i:=Pos('@', Value);
    if i=0 then Exit;
    NamePart:=Copy(Value, 1, i-1);
    ServerPart:=Copy(Value, i+1, Length(Value));
    if (Length(NamePart)=0) or ((Length(ServerPart)<5)) then Exit;
    i:=Pos('.', ServerPart);
    if (i=0) or (i>(Length(serverPart)-2)) then Exit;
    Result:= CheckAllowed(NamePart) and CheckAllowed(ServerPart);
  end;

  class function TValidationHelper.assertNull(const Value: TObject): Boolean;
  begin
      Result:= not Assigned(Value);;
  end;

  class function TValidationHelper.validateInscripcion(EventoOID, PilotoOID, TipoCategoriaOID: Integer): Boolean;
  begin
    with ConnectionModule.ZUniqueValidation do
    begin
      Close;
      SQL.Text:= 'select oid '+
                    'from inscripcion_piloto_evento ipe '+
                    'where ipe.evento_oid = :evento_oid '+
                      'and ipe.piloto_oid = :piloto_oid '+
                      'and ipe.tipo_categoria_oid = :tipo_categoria_oid ';

      ParamByName('evento_oid').AsInteger:= EventoOID;
      ParamByName('piloto_oid').AsInteger:= PilotoOID;
      ParamByName('tipo_categoria_oid').AsInteger:= TipoCategoriaOID;
      Open;

      Result:= (RecordCount > 0);
    end;
  end;

  class function TValidationHelper.validateNumerationRange(const oid, value, tipoCategoriaOID: Integer): Boolean;
  begin
    with ConnectionModule.ZUniqueValidation do
    begin
      Close;
      SQL.Text:= 'select nc.oid '+
                    'from numeracion_categoria nc '+
                    'join categorias c on nc.categoria_oid = c.oid '+
                    'where :value between nc.inicio and nc.fin and nc.categoria_oid <> :oid and c.tipo_categoria_oid = :tipo_categoria_oid';

      ParamByName('value').AsInteger:= value;
      ParamByName('oid').AsInteger:= oid;
      ParamByName('tipo_categoria_oid').AsInteger:= tipoCategoriaOID;
      Open;

      Result:= (RecordCount > 0);
    end;
  end;

  class function TValidationHelper.validateEdadCategoria(const eventoOID, pilotoOID, tipoCategoriaOID: Integer): Boolean;
  begin
    with ConnectionModule.ZUniqueValidation do
    begin
      Close;
      SQL.Text:= ' select c.oid ' +
                 ' from categorias c ' +
                 ' where (YEAR(CURRENT_TIMESTAMP) - YEAR((select fecha_nacimiento from piloto where oid = :piloto_oid))) between c.edad_minima and c.edad_maxima ' +
                 '  and c.oid = sel_categoria_oid_by_evento_and_tipo_categoria(:tipo_categoria_oid, :evento_oid, :piloto_oid)';

      ParamByName('piloto_oid').AsInteger:= pilotoOID;
      ParamByName('evento_oid').AsInteger:= eventoOID;
      ParamByName('tipo_categoria_oid').AsInteger:= tipoCategoriaOID;
      Open;

      Result:= (RecordCount = 0);
    end;
  end;

  class function TValidationHelper.getNumMotoByTipoCategoria(const pilotOID, tipoCategoriaOID: Integer): Boolean;
  begin
    with ConnectionModule.ZUniqueValidation do
    begin
      Close;
      SQL.Text:= 'SELECT '+
                    'CASE :tipo_categoria '+
                       'WHEN 1 THEN p.nro_moto '+
                       'WHEN 2 THEN p.nro_cuatriciclo '+
                       'WHEN 3 THEN p.nro_moto_cross '+
                       'WHEN 4 THEN p.nro_campeonato_externo '+
                    'END nro_moto '+
                  'FROM piloto p '+
                  'WHERE p.oid = :piloto_oid ';

      ParamByName('tipo_categoria').AsInteger:= tipoCategoriaOID;
      ParamByName('piloto_oid').AsInteger:= pilotOID;
      Open;

      Result:= (FieldByName('nro_moto').AsInteger = 0);
    end;
  end;

  class function TValidationHelper.isDateAfter(fecha: TDate): Boolean;
  var
    beforeDate : TDate;
    ResultInt : Integer;
  begin
    beforeDate := StrToDate('01/01/1950');
    ResultInt:= CompareDate(fecha, beforeDate);

    Result:= ResultInt<=0;
  end;
end.
