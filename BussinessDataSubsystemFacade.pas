unit BussinessDataSubsystemFacade;

interface

uses Entidades, DataModule, EncodingHelper, SysUtils, DateUtils, System.Generics.Collections, ZConnection, ConfigureFilesUtilities;
type
  TBussinessDataSubsystemFacade = class(TObject)
  public
    procedure saveUsuario(usuarioVO: TUsuario);
    procedure addUsuario(usuarioVO: TUsuario);
    procedure modifyUsuario(usuarioVO: TUsuario);
    function getUsuario(OID: Integer): TUsuario;
    procedure deleteUsuario(OID: Integer);

    function addTTAE(ttaeVO: TTomaTiempoAbastecimientoEvento) : Integer;

    procedure savePiloto(pilotoVO: TPiloto);
    procedure addPiloto(pilotoVO: TPiloto);
    procedure modifyPiloto(pilotoVO: TPiloto);
    function getPiloto(OID: Integer): TPiloto;
    function getPilotoOIDByTag(TagStr: String): Integer;
    function getPilotoOIDByDNI(DNI: String): Integer;
    function getPilotoOIDByTagID(TagID: String): Integer;
    function getPilotoOIDByNumMotoAndTipoCategoria(NumMoto, TipoCategoriaOID, eventoOID: Integer): Integer;
    function getPilotoImportadoOIDByNumero(NumMoto : Integer): Integer;
    function getCuentaPilotosByNumMotoAndTipoCategoria(NumMoto, TipoCategoriaOID, eventoOID: Integer): Integer;
    procedure deletePiloto(OID: Integer);
    function getLapTimeAbast(PilotoImportadoOID, EventoOID, nroVuelta: Integer): String;

    function getModeloMotoByNombre(Nombre: String): Integer;

    procedure saveContacto(contactoVO: TContacto);
    procedure addContacto(contactoVO: TContacto);
    procedure modifyContacto(contactoVO: TContacto);
    function getContacto(OID: Integer): TContacto;
    procedure deleteContacto(OID: Integer);

    procedure saveNavegante(naveganteVO: TNavegante);
    procedure addNavegante(naveganteVO: TNavegante);
    procedure modifyNavegante(naveganteVO: TNavegante);
    function getNavegante(OID: Integer): TNavegante;
    function getNaveganteByPiloto(pilotoOID: Integer): TNavegante;

    procedure saveEvento(eventVO: TEvento);
    procedure addEvento(eventVO: TEvento);
    procedure modifyEvento(eventVO: TEvento);
    function getEvento(OID: Integer): TEvento;
    procedure deleteEvento(OID: Integer);

    procedure addInscripcion(inscripcionVO: TInscripcion);
    procedure deleteInscripcion(OID: Integer);
    function getInscripcion(OID: Integer): TInscripcion;
    function getInscripcionByPilotoOIDAndCampeonatoOID(PilotoOID, CampeonatoOID: Integer): Boolean;
    function getInscripcionByPilotoOIDAndEventoOID(PilotoOID, EventoOID: Integer): Integer;
    function getTipoCategoriaOIDByPilotoOIDAndEventoOID(PilotoOID, EventoOID: Integer): Integer;
    function getTipoCategoriaByEventoOIDAndOrdenLargada(EventoOID, NroLargada: Integer): Integer;

    procedure deletePuntuacionByEventoOIDAndCategoriaOID(EventoOID, CategoriaOID: Integer);
    procedure addPuntuacion(EventoOID, PilotoOID, CategoriaOID, Puntos, Puesto: Integer);

    procedure saveCategoria(categoriaVO: TCategoria);
    function addCategoria(categoriaVO: TCategoria) : Integer;
    procedure modifyCategoria(categoriaVO: TCategoria);
    function getCategoria(OID: Integer): TCategoria;
    function getCategoriaByName(Nombre: String): Integer;
    procedure deleteCategoria(OID: Integer);
    function getPilotoCategoriaOIDByTipoCategoriaOIDAndEventoOID(
      pilotoOID, tipoCategoriaOID, eventoOID: Integer): Integer;

    procedure saveHandicup(handicupVO: THandicup);
    procedure addHandicup(handicupVO: THandicup);
    procedure modifyHandicup(handicupVO: THandicup);
    function getHandicup(OID: Integer): THandicup;
    procedure deleteHandicup(OID: Integer);

    procedure savePuntos(puntosVO: TPuntos);
    procedure addPuntos(puntosVO: TPuntos);
    procedure modifyPuntos(puntosVO: TPuntos);
    function getPuntos(OID: Integer): TPuntos;
    procedure deletePuntos(OID: Integer);

    procedure saveMoto(motoVO: TMoto);
    procedure addMoto(motoVO: TMoto);
    procedure modifyMoto(motoVO: TMoto);
    function getMoto(OID: Integer): TMoto;
    procedure deleteMoto(OID: Integer);

    procedure savePilotoImportado(pilotoImportadoVO: TPilotoImportado);
    procedure addPilotoImportado(pilotoImportadoVO: TPilotoImportado);
    procedure modifyPilotoImportado(pilotoImportadoVO: TPilotoImportado);
    procedure deleteTodosPilotosImportados();
    procedure deleteTomasImportadas(tomaTiempoOID: Integer);

    function getPilotoImportado(OID: Integer): TPilotoImportado;

    function getLocalidadOID(Provincia, Localidad : String) : Integer;
    function getLocalidadProvinciaByLocalidadOID(LocalidadOID : Integer):String;

    function getTomaTiempoVO(tomaTiempoEventoOID, pilotoOID, nroVuelta: Integer): TTomaTiempoVO;
    function getReconocimientoVO(tomaTiempoEventoOID, pilotoOID, nroVuelta: Integer): TTomaTiempoVO;
    function getTomaTiempoEventoVO(OID: Integer): TTomaTiempoEventoVO;

    procedure addParadasPiloto(PilotoOID, EventoOID, TipoCategoriaOID: Integer);
    function existParadasPiloto(PilotoOID, EventoOID : Integer):Boolean;

    procedure addTiempoAbastecimientoPiloto(PilotoImportadoOID, EventoOID, nroVuelta: Integer);
    procedure addTiempoAbastecimientoPilotoConTiempo(PilotoImportadoOID, EventoOID, nroVuelta: Integer; tiempo: TDateTime);

    procedure saveCampeonato(campeonatoVO: TCampeonato);
    procedure addCampeonato(campeonatoVO: TCampeonato);
    procedure modifyCampeonato(campeonatoVO: TCampeonato);
    function getCampeonato(OID: Integer): TCampeonato;
    procedure deleteCampeonato(OID: Integer);

    procedure addTomaTiempo(tomaTiempoEventoOID, pilotoOID: Integer);
    procedure addTomaTiempoWithTime(tomaTiempoEventoOID, pilotoOID: Integer; tiempoPasada: TDateTime; importada : Boolean);
    procedure addTomaTiempoWithTagReference(tomaTiempoEventoOID, lecturaOID: Integer; tiempoPasada: TDateTime; TagID: String);
    procedure updatePilotoToTomaTiempo(pilotoOID, OID: Integer);
    procedure updateEstadoTomaTiempo(isDeleted: SmallInt;  OID: Integer);

    procedure updateEstadoReconocimiento(isDeleted: SmallInt;  OID: Integer);

    procedure addReconocimiento(tomaTiempoEventoOID, pilotoOID: Integer);
    procedure addReconocimientoWithTagReference(tomaTiempoEventoOID, lecturaOID, nroVuelta: Integer; tiempoPasada: TDateTime; TagID: String);
    procedure addReconocimientoWithTime(tomaTiempoEventoOID, pilotoOID: Integer; tiempoPasada: TDateTime);

    function addTomaTiempoEvento(nombre, tipoTomaTiempo: String; eventoOID: Integer) : Integer;
    procedure editTomaTiempoEventoTagText(oid : Integer; tagText: String);
    procedure editTomaTiempoEvento(oid : Integer; nombre, estado: String);

    procedure addRecargoTomaTiempoEvento(recargoTomaTiempoEventoVO: TRecargoTomaTiempoEventoVO);
    procedure deleteRecargoTomaTiempoEvento(OID: Integer);

    function GetNroVuelta(pilotoOID, tomaTiempoEventoOID: Integer) : Integer;
    function GetNroVueltaAbastecimiento(pilotoImportadoOID, tomaTiempoAbastecimientoEventoOID: Integer) : Integer;
    function GetNroVueltaReconocimiento(pilotoOID, tomaTiempoEventoOID: Integer) : Integer;

    function saveLecturaTagsAntena(lecturaTagsAntenaVO: TLecturaTagsAntena) : Integer;

    function getNroVueltaByCategoriaAndEvento(eventoOID, categoriaOID : Integer): Integer;

    function getCountTipoCategoriaByEventoAndNroVuelta(eventoOID, nroVuelta: Integer): Integer;
    function getTipoCategoraOIDByEventoAndNroVuelta(tomaTiempoEventoOID: Integer): Integer;
    function getTipoCategoraOIDByEventoReconocimiento(tomaTiempoEventoOID: Integer): Integer;

    procedure deleteTomaTiempoEvento(OID: Integer);

    procedure reconectZConnection();

    function selPuntoByPuesto(Puesto: String) : Integer;

    class function getInstance: TBussinessDataSubsystemFacade;
  end;

implementation

var
  Instance : TBussinessDataSubsystemFacade  = nil;

  class function TBussinessDataSubsystemFacade.getInstance: TBussinessDataSubsystemFacade;
  begin
    if ( not Assigned( Instance ) ) then
    begin
      Instance := TBussinessDataSubsystemFacade.Create;
    end;
    Result := Instance
  end;

//------------------------------------------------------------------------//

  procedure TBussinessDataSubsystemFacade.addUsuario(usuarioVO: TUsuario);
  var
    lastInsertedOID: Integer;
  begin
    ConnectionModule.ZConnection.StartTransaction;
    try

      with ConnectionModule.ZAddUsuario do
        begin
          Close;
          ParamByName('nombre').AsString:= usuarioVO.Nombre;
          ParamByName('apellido').AsString:= usuarioVO.Apellido;
          ParamByName('nro_docu').AsString:= usuarioVO.NroDocumento;
          ParamByName('perfil_oid').AsInteger:= usuarioVO.PerfilOID;
          ExecSQL;
        end;

      with ConnectionModule.ZSelLastInsOID do
        begin
          Close;
          Open;

          lastInsertedOID:= FieldByName('OID').AsInteger;
        end;

      with ConnectionModule.ZAddCuentaUsuario do
        begin
          Close;
          ParamByName('username').AsString:= usuarioVO.CuentaUsuario.Username;
          ParamByName('password').AsString:= TEncodingHelper
            .XorEncode('74606A780C0C', usuarioVO.CuentaUsuario.Password);
          ParamByName('usuario_oid').AsInteger:= lastInsertedOID;
          ExecSQL;
        end;

      ConnectionModule.ZConnection.Commit;
    except
      ConnectionModule.ZConnection.Rollback;
    end;
  end;

 //------------------------------------------------------------------------//

  procedure TBussinessDataSubsystemFacade.modifyUsuario(usuarioVO: TUsuario);
  begin
    ConnectionModule.ZConnection.StartTransaction;
    try

      with ConnectionModule.ZModifyUsuario do
        begin
          Close;
          ParamByName('nombre').AsString:= usuarioVO.Nombre;
          ParamByName('apellido').AsString:= usuarioVO.Apellido;
          ParamByName('nro_docu').AsString:= usuarioVO.NroDocumento;
          ParamByName('perfil_oid').AsInteger:= usuarioVO.PerfilOID;
          ParamByName('oid').AsInteger:= usuarioVO.OID;
          ExecSQL;
        end;

      with ConnectionModule.ZModifyCuentaUsuario do
        begin
          Close;
          ParamByName('username').AsString:= usuarioVO.CuentaUsuario.Username;
          ParamByName('password').AsString:= TEncodingHelper
            .XorEncode('74606A780C0C', usuarioVO.CuentaUsuario.Password);
          ParamByName('usuario_oid').AsInteger:= usuarioVO.OID;
          ExecSQL;
        end;

      ConnectionModule.ZConnection.Commit;
    except
      ConnectionModule.ZConnection.Rollback;
    end;
  end;

 //------------------------------------------------------------------------//

  function TBussinessDataSubsystemFacade.getUsuario(OID: Integer): TUsuario;
  var
    usuarioVO: TUsuario;
    cuentaUsuarioVO: TCuentaUsuario;
  begin
    with ConnectionModule.ZGetUsuario do
      begin
        Close;
        ParamByName('OID').AsInteger:= OID;
        Open;

        if (RecordCount > 0) then
        begin
          usuarioVO:= TUsuario.Create;
          usuarioVO.OID:= FieldByName('oid').AsInteger;
          usuarioVO.Nombre:= FieldByName('nombre').AsString;
          usuarioVO.Apellido:= FieldByName('apellido').AsString;
          usuarioVO.NroDocumento:= FieldByName('nro_docu').AsString;
          usuarioVO.PerfilOID:= FieldByName('perfil_oid').AsInteger;

          cuentaUsuarioVO:= TCuentaUsuario.Create;
          cuentaUsuarioVO.Username:= FieldByName('username').AsString;
          cuentaUsuarioVO.Password:= TEncodingHelper.XorDecode('74606A780C0C', FieldByName('password').AsString);

          usuarioVO.CuentaUsuario:= cuentaUsuarioVO;
        end;
      end;
   Result:= usuarioVO;
  end;

  procedure TBussinessDataSubsystemFacade.deleteUsuario(OID: Integer);
  begin
    with ConnectionModule.ZDeleteUsuario do
      begin
        Close;
        ParamByName('oid').AsInteger:= OID;
        ExecSQL;
      end;
  end;

  procedure TBussinessDataSubsystemFacade.saveUsuario(usuarioVO: TUsuario);
  begin
    if usuarioVO.OID > 0 then
      modifyUsuario(usuarioVO)
    else
      addUsuario(usuarioVO);
  end;

  function TBussinessDataSubsystemFacade.getPiloto(OID: Integer): TPiloto;
  var
    pilotoVO: TPiloto;
  begin
    pilotoVO:= nil;

    with ConnectionModule.ZGetPiloto do
      begin
        Close;
        ParamByName('OID').AsInteger:= OID;
        Open;

        if (RecordCount > 0) then
        begin
          pilotoVO:= TPiloto.Create;
          pilotoVO.OID:= FieldByName('oid').AsInteger;
          pilotoVO.Nombre:= FieldByName('nombre').AsString;
          pilotoVO.Apellido:= FieldByName('apellido').AsString;
          pilotoVO.NroDocumento:= FieldByName('nro_docu').AsString;
          pilotoVO.FechaNacimiento:= FieldByName('fecha_nacimiento').AsVariant;
          pilotoVO.Direccion:= FieldByName('direccion').AsString;
          pilotoVO.LocalidadOID:= FieldByName('localidad_oid').AsInteger;
          pilotoVO.ProvinciaOID:= FieldByName('provincia_oid').AsInteger;
          pilotoVO.Telefono:= FieldByName('telefono').AsString;
          pilotoVO.TelefonoAcompaniante:= FieldByName('telefono_acompaniante').AsString;
          pilotoVO.TelefonoFijo:= FieldByName('telefono_fijo').AsString;
          pilotoVO.Mail:= FieldByName('email').AsString;
          pilotoVO.NumMoto:= FieldByName('nro_moto').AsInteger;
          pilotoVO.NumMotoCross:= FieldByName('nro_moto_cross').AsInteger;
          pilotoVO.NumCuatriciclos:= FieldByName('nro_cuatriciclo').AsInteger;
          pilotoVO.MotoOID:= FieldByName('modelo_moto_oid').AsInteger;
          pilotoVO.CategoriaOID:= FieldByName('categoria_oid').AsInteger;
          pilotoVO.MotoCrossOID:= FieldByName('categoria_motocross_oid').AsInteger;
          pilotoVO.CuatriciclosOID:= FieldByName('categoria_cuatriciclos_oid').AsInteger;
          pilotoVO.Responsabilidad:= FieldByName('responsabilidad_civil').AsInteger = 1;
          pilotoVO.UtilizaHandicup:= FieldByName('aplica_handicup').AsInteger = 1;
          pilotoVO.EsCampeon:= FieldByName('es_campeon').AsInteger = 1;
          pilotoVO.Tag:= FieldByName('tag').AsString;
          pilotoVO.Categoria:= FieldByName('categoria').AsString;
          pilotoVO.CategoriaCuatriciclo:= FieldByName('categoria_cuatricilo').AsString;
          pilotoVO.CategoriaMotoCross:= FieldByName('categoria_motocross').AsString;
          pilotoVO.TipoMoto:= FieldByName('modelo_moto').AsString;
          pilotoVO.Localidad:= FieldByName('localidad').AsString;
          pilotoVO.Ranking:= FieldByName('ranking').AsInteger;
          pilotoVO.RankingExterno:= FieldByName('ranking_externo').AsInteger;
          pilotoVO.Notas:= FieldByName('notas').AsWideString;
          pilotoVO.TagID:= FieldByName('tid').AsString;
          pilotoVO.NumExterno:= FieldByName('nro_campeonato_externo').AsInteger;
          pilotoVO.CatExternoOID:= FieldByName('categoria_externa_oid').AsInteger;

          pilotoVO.Navegante:= getNaveganteByPiloto(pilotoVO.OID);
        end;
      end;
   Result:= pilotoVO;
  end;

  function TBussinessDataSubsystemFacade.getPilotoOIDByDNI(DNI: String): Integer;
   var
    resultOID: Integer;
  begin
    resultOID:= 0;

    with ConnectionModule.ZGetPiolotoByDNI do
      begin
        Close;
        ParamByName('nro_docu').AsString := DNI;
        Open;

        if (RecordCount > 0) then
        begin
          resultOID:= FieldByName('oid').AsInteger;
        end;
      end;

   Result:= resultOID;
  end;

  function TBussinessDataSubsystemFacade.getPilotoOIDByTag(TagStr: String): Integer;
  var
    resultOID: Integer;
  begin
    resultOID:= 0;

    with ConnectionModule.ZGetPiolotoByTag do
      begin
        Close;
        ParamByName('tag').AsString := TagStr;
        Open;

        if (RecordCount > 0) then
        begin
          resultOID:= FieldByName('oid').AsInteger;
        end;
      end;

   Result:= resultOID;
  end;

  function TBussinessDataSubsystemFacade.getModeloMotoByNombre(Nombre: String): Integer;
  var
    resultOID: Integer;
  begin
    resultOID:= 0;

    with ConnectionModule.ZGetModeloMotoByName do
      begin
        Close;

        SQL.Clear;

        SQL.Add('select oid');
        SQL.Add('from modelo_moto');
        SQL.Add('where REPLACE(UPPER(nombre), '' '', '''') = :nombre');

        ParamByName('nombre').AsString := Nombre;
        Open;

        if (RecordCount > 0) then
        begin
          resultOID:= FieldByName('oid').AsInteger;
        end;
      end;

   Result:= resultOID;
  end;

  function TBussinessDataSubsystemFacade.getPilotoOIDByTagID(TagID: String): Integer;
  var
    resultOID: Integer;
  begin
    resultOID:= 0;

    with ConnectionModule.ZGetPilotoByTagID do
      begin
        Close;
        ParamByName('tid').AsString := TagID;
        Open;

        if (RecordCount > 0) then
        begin
          resultOID:= FieldByName('oid').AsInteger;
        end;
      end;

   Result:= resultOID;
  end;

  function TBussinessDataSubsystemFacade.getPilotoImportadoOIDByNumero(NumMoto : Integer): Integer;
  var
    resultOID: Integer;
  begin
    resultOID:= 0;

    with ConnectionModule.ZGetPilotoImportadoByNumero do
      begin
        Close;
        ParamByName('numero').AsInteger:= NumMoto;
        Open;

        if (RecordCount > 0) then
        begin
          resultOID:= FieldByName('piloto_oid').AsInteger;
        end;
      end;

   Result:= resultOID;
  end;

  function TBussinessDataSubsystemFacade.getPilotoOIDByNumMotoAndTipoCategoria(NumMoto, TipoCategoriaOID, eventoOID: Integer): Integer;
  var
    resultOID: Integer;
  begin
    resultOID:= 0;

    with ConnectionModule.ZGetPilotoByNumMoto do
      begin
        Close;
        ParamByName('nro_moto').AsInteger:= NumMoto;
        ParamByName('tipo_categoria_oid').AsInteger:= TipoCategoriaOID;
        ParamByName('evento_oid').AsInteger:= eventoOID;
        Open;

        if (RecordCount > 0) then
        begin
          resultOID:= FieldByName('piloto_oid').AsInteger;
        end;
      end;

   Result:= resultOID;
  end;

  function TBussinessDataSubsystemFacade.getCuentaPilotosByNumMotoAndTipoCategoria(NumMoto, TipoCategoriaOID, eventoOID: Integer): Integer;
  var
    resultOID: Integer;
  begin
    resultOID:= 0;

    with ConnectionModule.ZGetCantPilotosByNumMoto do
      begin
        Close;
        ParamByName('nro_moto').AsInteger:= NumMoto;
        ParamByName('tipo_categoria_oid').AsInteger:= TipoCategoriaOID;
        ParamByName('evento_oid').AsInteger:= eventoOID;
        Open;

        if (RecordCount > 0) then
        begin
          resultOID:= FieldByName('cantidad_pilotos').AsInteger;
        end;
      end;

   Result:= resultOID;
  end;

  procedure TBussinessDataSubsystemFacade.deletePiloto(OID: Integer);
  begin
    with ConnectionModule.ZDeletePiloto do
      begin
        Close;
        ParamByName('oid').AsInteger:= OID;
        ExecSQL;
      end;
  end;

  procedure TBussinessDataSubsystemFacade.addPiloto(pilotoVO: TPiloto);
  var
    lastInsertedOID : Integer;
  begin
    ConnectionModule.ZConnection.StartTransaction;
    try

      with ConnectionModule.ZAddPiloto do
        begin
          Close;
          ParamByName('nombre').AsString:= pilotoVO.Nombre;
          ParamByName('apellido').AsString:= pilotoVO.Apellido;
          ParamByName('nro_docu').AsString:= pilotoVO.NroDocumento;
          ParamByName('fecha_nacimiento').AsDate:= pilotoVO.FechaNacimiento;
          ParamByName('direccion').AsString:= pilotoVO.Direccion;
          ParamByName('localidad_oid').AsInteger:= pilotoVO.LocalidadOID;
          ParamByName('telefono').AsString:= pilotoVO.Telefono;
          ParamByName('email').AsString:= pilotoVO.Mail;
          ParamByName('nro_moto').AsInteger:= pilotoVO.NumMoto;
          ParamByName('nro_moto_cross').AsInteger:= pilotoVO.NumMotoCross;
          ParamByName('nro_cuatriciclo').AsInteger:= pilotoVO.NumCuatriciclos;
          ParamByName('nro_campeonato_externo').AsInteger:= pilotoVO.NumExterno;
          ParamByName('modelo_moto_oid').AsInteger:= pilotoVO.MotoOID;
          ParamByName('telefono_acompaniante').AsString:= pilotoVO.TelefonoAcompaniante;
          ParamByName('categoria_oid').AsInteger:= pilotoVO.CategoriaOID;
          ParamByName('categoria_motocross_oid').AsInteger:= pilotoVO.MotoCrossOID;
          ParamByName('categoria_cuatriciclos_oid').AsInteger:= pilotoVO.CuatriciclosOID;
          ParamByName('categoria_externa_oid').AsInteger:= pilotoVO.CatExternoOID;
          ParamByName('ranking').AsSmallInt:= pilotoVO.Ranking;
          ParamByName('ranking_externo').AsSmallInt:= pilotoVO.RankingExterno;

          if (pilotoVO.Responsabilidad) then
            ParamByName('responsabilidad_civil').AsInteger:= 1
          else
            ParamByName('responsabilidad_civil').AsInteger:= 0;

          if (pilotoVO.UtilizaHandicup) then
            ParamByName('aplica_handicup').AsInteger:= 1
          else
            ParamByName('aplica_handicup').AsInteger:= 0;

          if (pilotoVO.EsCampeon) then
            ParamByName('es_campeon').AsInteger:= 1
          else
            ParamByName('es_campeon').AsInteger:= 0;

          ParamByName('tag').AsString:= StringReplace(pilotoVO.NroDocumento, '.', '', [rfReplaceAll, rfIgnoreCase]);
          ParamByName('notas').AsWideString:= pilotoVO.Notas;
          ParamByName('tid').AsString:= pilotoVO.TagID;
          ParamByName('telefono_fijo').AsString:= pilotoVO.TelefonoFijo;
          ExecSQL;
        end;

      with ConnectionModule.ZSelLastInsOID do
        begin
          Close;
          Open;

          lastInsertedOID:= FieldByName('OID').AsInteger;
        end;

     if (pilotoVO.Navegante<>nil) then
     begin
        pilotoVO.Navegante.PilotoOID:= lastInsertedOID;
        saveNavegante(pilotoVO.Navegante);
     end;

      ConnectionModule.ZConnection.Commit;
    except
      ConnectionModule.ZConnection.Rollback;
    end;
  end;


procedure TBussinessDataSubsystemFacade.modifyPiloto(pilotoVO: TPiloto);
begin
  if not Assigned(pilotoVO) then
    raise Exception.Create('Error: El objeto pilotoVO es nulo (nil) en modifyPiloto.');

    ConnectionModule.ZConnection.StartTransaction;
    try

      with ConnectionModule.ZModifyPiloto do
        begin
          Close;
          ParamByName('nombre').AsString:= pilotoVO.Nombre;
          ParamByName('apellido').AsString:= pilotoVO.Apellido;
          ParamByName('nro_docu').AsString:= pilotoVO.NroDocumento;
          ParamByName('fecha_nacimiento').AsDate:= pilotoVO.FechaNacimiento;
          ParamByName('direccion').AsString:= pilotoVO.Direccion;
          ParamByName('localidad_oid').AsInteger:= pilotoVO.LocalidadOID;
          ParamByName('telefono').AsString:= pilotoVO.Telefono;
          ParamByName('telefono_acompaniante').AsString:= pilotoVO.TelefonoAcompaniante;
          ParamByName('email').AsString:= pilotoVO.Mail;
          ParamByName('nro_moto').AsInteger:= pilotoVO.NumMoto;
          ParamByName('nro_moto_cross').AsInteger:= pilotoVO.NumMotoCross;
          ParamByName('nro_cuatriciclo').AsInteger:= pilotoVO.NumCuatriciclos;
          ParamByName('modelo_moto_oid').AsInteger:= pilotoVO.MotoOID;
          ParamByName('categoria_oid').AsInteger:= pilotoVO.CategoriaOID;
          ParamByName('categoria_motocross_oid').AsInteger:= pilotoVO.MotoCrossOID;
          ParamByName('categoria_cuatriciclos_oid').AsInteger:= pilotoVO.CuatriciclosOID;
          ParamByName('nro_campeonato_externo').AsInteger:= pilotoVO.NumExterno;
          ParamByName('categoria_externa_oid').AsInteger:= pilotoVO.CatExternoOID;
          ParamByName('ranking').AsSmallInt:= pilotoVO.Ranking;
          ParamByName('ranking_externo').AsSmallInt:= pilotoVO.RankingExterno;

          if (pilotoVO.Responsabilidad) then
            ParamByName('responsabilidad_civil').AsInteger:= 1
          else
            ParamByName('responsabilidad_civil').AsInteger:= 0;

          if (pilotoVO.UtilizaHandicup) then
            ParamByName('aplica_handicup').AsInteger:= 1
          else
            ParamByName('aplica_handicup').AsInteger:= 0;

          if (pilotoVO.EsCampeon) then
            ParamByName('es_campeon').AsInteger:= 1
          else
            ParamByName('es_campeon').AsInteger:= 0;

          ParamByName('tag').AsString:= StringReplace(pilotoVO.NroDocumento, '.', '', [rfReplaceAll, rfIgnoreCase]);
          // Opción de seguridad: Si está corrupto o es larguísimo, lo truncamos o limpiamos
          if Length(pilotoVO.Notas) > 5000 then
            ParamByName('notas').AsString := Copy(pilotoVO.Notas, 1, 1000) // Evita el desborde de memoria
          else
            ParamByName('notas').AsString := pilotoVO.Notas;
          ParamByName('tid').AsString:= pilotoVO.TagID;
          ParamByName('telefono_fijo').AsString:= pilotoVO.TelefonoFijo;
          ParamByName('oid').AsInteger:= pilotoVO.OID;
          ExecSQL;
        end;

        if (pilotoVO.Navegante<>nil) then
        begin
          pilotoVO.Navegante.pilotoOID := pilotoVO.OID;
          saveNavegante(pilotoVO.Navegante);
        end;

      ConnectionModule.ZConnection.Commit;
    except
      ConnectionModule.ZConnection.Rollback;
    end;
  end;

  procedure TBussinessDataSubsystemFacade.saveContacto(contactoVO: TContacto);
  begin
    if contactoVO.OID > 0 then
      modifyContacto(contactoVO)
    else
      addContacto(contactoVO);
  end;

  procedure TBussinessDataSubsystemFacade.saveNavegante(naveganteVO: TNavegante);
    begin
    if naveganteVO.OID > 0 then
      modifyNavegante(naveganteVO)
    else
      addNavegante(naveganteVO);
  end;

  procedure TBussinessDataSubsystemFacade.addNavegante(naveganteVO: TNavegante);
    begin
      ConnectionModule.ZConnection.StartTransaction;
    try

      with ConnectionModule.ZAddNavegante do
        begin
          Close;
          ParamByName('nombre').AsString:= naveganteVO.Nombre;
          ParamByName('apellido').AsString:= naveganteVO.Apellido;
          ParamByName('telefono_celular').AsString:= naveganteVO.Telefono;
          ParamByName('email').AsString:= naveganteVO.Mail;
          ParamByName('telefono_fijo').AsString:= naveganteVO.TelefonoFijo;
          ParamByName('piloto_oid').AsInteger:= naveganteVO.PilotoOID;

          ExecSQL;
        end;

      ConnectionModule.ZConnection.Commit;
    except
      ConnectionModule.ZConnection.Rollback;
    end;
    end;

  procedure TBussinessDataSubsystemFacade.modifyNavegante(naveganteVO: TNavegante);
    begin
      ConnectionModule.ZConnection.StartTransaction;
      try

        with ConnectionModule.ZModifyNavegante do
          begin
            Close;
            ParamByName('nombre').AsString:= naveganteVO.Nombre;
            ParamByName('apellido').AsString:= naveganteVO.Apellido;
            ParamByName('telefono_celular').AsString:= naveganteVO.Telefono;
            ParamByName('email').AsString:= naveganteVO.Mail;
            ParamByName('telefono_fijo').AsString:= naveganteVO.TelefonoFijo;
            ParamByName('oid').AsInteger:= naveganteVO.OID;
            ParamByName('piloto_oid').AsInteger:= naveganteVO.PilotoOID;
            ExecSQL;
          end;

        ConnectionModule.ZConnection.Commit;
      except
        ConnectionModule.ZConnection.Rollback;
      end;
    end;

  procedure TBussinessDataSubsystemFacade.addContacto(contactoVO: TContacto);
  begin
    ConnectionModule.ZConnection.StartTransaction;
    try

      with ConnectionModule.ZAddContacto do
        begin
          Close;
          ParamByName('nombre').AsString:= contactoVO.Nombre;
          ParamByName('apellido').AsString:= contactoVO.Apellido;
          ParamByName('direccion').AsString:= contactoVO.Direccion;
          ParamByName('localidad_oid').AsInteger:= contactoVO.LocalidadOID;
          ParamByName('telefono_celular').AsString:= contactoVO.Telefono;
          ParamByName('email').AsString:= contactoVO.Mail;

          ParamByName('notas').AsWideString:= contactoVO.Notas;
          ParamByName('telefono_fijo').AsString:= contactoVO.TelefonoFijo;
          ExecSQL;
        end;

      ConnectionModule.ZConnection.Commit;
    except
      ConnectionModule.ZConnection.Rollback;
    end;
  end;

  procedure TBussinessDataSubsystemFacade.modifyContacto(contactoVO: TContacto);
  begin
    ConnectionModule.ZConnection.StartTransaction;
    try

      with ConnectionModule.ZModifyContacto do
        begin
          Close;
          ParamByName('nombre').AsString:= contactoVO.Nombre;
          ParamByName('apellido').AsString:= contactoVO.Apellido;
          ParamByName('direccion').AsString:= contactoVO.Direccion;
          ParamByName('localidad_oid').AsInteger:= contactoVO.LocalidadOID;
          ParamByName('telefono_celular').AsString:= contactoVO.Telefono;
          ParamByName('email').AsString:= contactoVO.Mail;
          ParamByName('notas').AsWideString:= contactoVO.Notas;
          ParamByName('telefono_fijo').AsString:= contactoVO.TelefonoFijo;
          ParamByName('oid').AsInteger:= contactoVO.OID;
          ExecSQL;
        end;

      ConnectionModule.ZConnection.Commit;
    except
      ConnectionModule.ZConnection.Rollback;
    end;
  end;

  function TBussinessDataSubsystemFacade.getNaveganteByPiloto(pilotoOID: Integer): TNavegante;
  var
    naveganteVO: TNavegante;
  begin
    naveganteVO:= nil;

    with ConnectionModule.ZGetNaveganteByPiloto do
      begin
        Close;
        ParamByName('piloto_oid').AsInteger:= pilotoOID;
        Open;

        if (RecordCount > 0) then
        begin
          naveganteVO:= getNavegante(FieldByName('oid').AsInteger)
        end;
      end;
   Result:= naveganteVO;

  end;

  function TBussinessDataSubsystemFacade.getNavegante(OID: Integer): TNavegante;
  var
    naveganteVO: TNavegante;
  begin
    naveganteVO:= nil;

    with ConnectionModule.ZGetNavegante do
      begin
        Close;
        ParamByName('OID').AsInteger:= OID;
        Open;

        if (RecordCount > 0) then
        begin
          naveganteVO:= TNavegante.Create;
          naveganteVO.OID:= FieldByName('oid').AsInteger;
          naveganteVO.Nombre:= FieldByName('nombre').AsString;
          naveganteVO.Apellido:= FieldByName('apellido').AsString;
          naveganteVO.Telefono:= FieldByName('telefono_celular').AsString;
          naveganteVO.TelefonoFijo:= FieldByName('telefono_fijo').AsString;
          naveganteVO.Mail:= FieldByName('email').AsString;
        end;
      end;
   Result:= naveganteVO;
  end;


  function TBussinessDataSubsystemFacade.getContacto(OID: Integer): TContacto;
  var
    contactoVO: TContacto;
  begin
    contactoVO:= nil;

    with ConnectionModule.ZGetContacto do
      begin
        Close;
        ParamByName('OID').AsInteger:= OID;
        Open;

        if (RecordCount > 0) then
        begin
          contactoVO:= TContacto.Create;
          contactoVO.OID:= FieldByName('oid').AsInteger;
          contactoVO.Nombre:= FieldByName('nombre').AsString;
          contactoVO.Apellido:= FieldByName('apellido').AsString;
          contactoVO.Direccion:= FieldByName('direccion').AsString;
          contactoVO.LocalidadOID:= FieldByName('localidad_oid').AsInteger;
          contactoVO.ProvinciaOID:= FieldByName('provincia_oid').AsInteger;
          contactoVO.Telefono:= FieldByName('telefono_celular').AsString;
          contactoVO.TelefonoFijo:= FieldByName('telefono_fijo').AsString;
          contactoVO.Mail:= FieldByName('email').AsString;
          contactoVO.Localidad:= FieldByName('localidad').AsString;
          contactoVO.Notas:= FieldByName('notas').AsWideString;
        end;
      end;
   Result:= contactoVO;
  end;

  procedure TBussinessDataSubsystemFacade.deleteContacto(OID: Integer);
  begin
    with ConnectionModule.ZDeleteContacto do
      begin
        Close;
        ParamByName('oid').AsInteger:= OID;
        ExecSQL;
      end;
  end;

  procedure TBussinessDataSubsystemFacade.savePiloto(pilotoVO: TPiloto);
  begin
    if pilotoVO.OID > 0 then
      modifyPiloto(pilotoVO)
    else
      addPiloto(pilotoVO);
  end;

  procedure TBussinessDataSubsystemFacade.saveEvento(eventVO: TEvento);
  begin
    if eventVO.OID > 0 then
      modifyEvento(eventVO)
    else
      addEvento(eventVO);
  end;

  procedure TBussinessDataSubsystemFacade.addEvento(eventVO: TEvento);
  var
    eventoCategoriaNumeracionVO : TEventoCategoriaNumeracion;
  begin
    ConnectionModule.ZConnection.StartTransaction;
    try

      with ConnectionModule.ZAddEvento do
        begin
          Close;
          ParamByName('nombre').AsString:= eventVO.Nombre;
          ParamByName('localidad_oid').AsInteger:= eventVO.LocalidadOID;
          ParamByName('fecha').AsDate:= eventVO.Fecha;
          ParamByName('nro_fecha').AsShortInt:= eventVO.NroFecha;
          ParamByName('distancia').AsInteger:= eventVO.Distancia;
          ParamByName('localidad_oid').AsInteger:= eventVO.LocalidadOID;
          ParamByName('campeonato_oid').AsInteger:= eventVO.CampeonatoOID;
          ParamByName('tipo_evento_oid').AsInteger:= eventVO.TipoCompetenciaOID;
          ParamByName('nro_vueltas').AsInteger:= eventVO.NroVueltas;

          if (eventVO.UltimaFecha) then
            ParamByName('ultima_fecha').AsInteger:= 1
          else
            ParamByName('ultima_fecha').AsInteger:= 0;

         if (eventVO.UsaPuntosExtra) then
            ParamByName('usa_puntos_extra').AsInteger:= 1
          else
            ParamByName('usa_puntos_extra').AsInteger:= 0;

         if (eventVO.UsaHandicup) then
            ParamByName('usa_handicup').AsInteger:= 1
          else
            ParamByName('usa_handicup').AsInteger:= 0;

          ExecSQL;
        end;

      for eventoCategoriaNumeracionVO in eventVO.VueltasCategoria do
      with ConnectionModule.ZAddVueltasPorCategoria do
        begin
          Close;
            ParamByName('categoria_oid').asInteger:= eventoCategoriaNumeracionVO.CategoriaOID;
            ParamByName('nro_vueltas').asInteger:= eventoCategoriaNumeracionVO.NroVuelta;
            ParamByName('evento_oid').asInteger:= eventVO.OID;
          ExecSQL;
        end;

      ConnectionModule.ZConnection.Commit;
    except
      ConnectionModule.ZConnection.Rollback;
    end;
  end;

  procedure TBussinessDataSubsystemFacade.modifyEvento(eventVO: TEvento);
  var
    eventoCategoriaNumeracionVO : TEventoCategoriaNumeracion;
  begin
    ConnectionModule.ZConnection.StartTransaction;
    try

      with ConnectionModule.ZDeleteVueltasPorCategoria do
        begin
          Close;
          ParamByName('evento_oid').AsInteger:= eventVO.OID;
          ExecSQL;
        end;

      with ConnectionModule.ZModifyEvento do
        begin
          Close;
          ParamByName('nombre').AsString:= eventVO.Nombre;
          ParamByName('localidad_oid').AsInteger:= eventVO.LocalidadOID;
          ParamByName('fecha').AsDate:= eventVO.Fecha;
          ParamByName('nro_fecha').AsShortInt:= eventVO.NroFecha;
          ParamByName('distancia').AsInteger:= eventVO.Distancia;
          ParamByName('localidad_oid').AsInteger:= eventVO.LocalidadOID;
          ParamByName('campeonato_oid').AsInteger:= eventVO.CampeonatoOID;
          ParamByName('tipo_evento_oid').AsInteger:= eventVO.TipoCompetenciaOID;
          ParamByName('nro_vueltas').AsInteger:= eventVO.NroVueltas;

          if (eventVO.UltimaFecha) then
            ParamByName('ultima_fecha').AsInteger:= 1
          else
            ParamByName('ultima_fecha').AsInteger:= 0;

          if (eventVO.UsaPuntosExtra) then
            ParamByName('usa_puntos_extra').AsInteger:= 1
          else
            ParamByName('usa_puntos_extra').AsInteger:= 0;

         if (eventVO.UsaHandicup) then
            ParamByName('usa_handicup').AsInteger:= 1
          else
            ParamByName('usa_handicup').AsInteger:= 0;

          ParamByName('oid').AsInteger:= eventVO.OID;
          ExecSQL;
        end;

      for eventoCategoriaNumeracionVO in eventVO.VueltasCategoria do
      with ConnectionModule.ZAddVueltasPorCategoria do
        begin
          Close;
            ParamByName('categoria_oid').asInteger:= eventoCategoriaNumeracionVO.CategoriaOID;
            ParamByName('nro_vueltas').asInteger:= eventoCategoriaNumeracionVO.NroVuelta;
            ParamByName('evento_oid').asInteger:= eventVO.OID;
          ExecSQL;
        end;

      ConnectionModule.ZConnection.Commit;
    except
      ConnectionModule.ZConnection.Rollback;
    end;
  end;

  function TBussinessDataSubsystemFacade.getEvento(OID: Integer): TEvento;
  var
    eventVO: TEvento;
    vueltasVO : TEventoCategoriaNumeracion;
    vueltasListVO : TList<TEventoCategoriaNumeracion>;
    puntoControlVO : TEventoPuntoControl;
    puntoControlListVO : TList<TEventoPuntoControl>;
  begin
    with ConnectionModule.ZGetEvento do
      begin
        Close;
        ParamByName('OID').AsInteger:= OID;
        Open;

        if (RecordCount > 0) then
        begin
          eventVO:= TEvento.Create;
          eventVO.OID:= FieldByName('oid').AsInteger;
          eventVO.Nombre:= FieldByName('nombre').AsString;
          eventVO.LocalidadOID:= FieldByName('localidad_oid').AsInteger;
          eventVO.ProvinciaOID:= FieldByName('provincia_oid').AsInteger;
          eventVO.Fecha:= FieldByName('fecha').AsVariant;
          eventVO.NroFecha:= FieldByName('nro_fecha').AsInteger;
          eventVO.Distancia:= FieldByName('distancia').AsInteger;
          eventVO.Nombre:= FieldByName('nombre').AsString;
          eventVO.CampeonatoOID:= FieldByName('campeonato_oid').AsInteger;
          eventVO.TipoCompetenciaOID:= FieldByName('tipo_evento_oid').AsInteger;
          eventVO.NroVueltas:= FieldByName('nro_vueltas').AsInteger;
          eventVO.UltimaFecha:= FieldByName('ultima_fecha').AsInteger = 1;
          eventVO.UsaPuntosExtra:= FieldByName('usa_puntos_extra').AsInteger = 1;
          eventVO.UsaHandicup:= FieldByName('usa_handicup').AsInteger = 1;

          vueltasListVO := TList<TEventoCategoriaNumeracion>.Create;
          with ConnectionModule.ZGetVueltasPorCategoria do
          begin
            Close;
            ParamByName('evento_oid').AsInteger:= OID;
            Open;
            while not Eof do
            begin
              vueltasVO := TEventoCategoriaNumeracion.Create;
              vueltasVO.CategoriaOID:= FieldByName('categoria_oid').AsInteger;
              vueltasVO.NroVuelta:= FieldByName('nro_vueltas').AsInteger;
              vueltasVO.Categoria:= FieldByName('nombre_categoria').AsString;
              vueltasListVO.Add(vueltasVO);

              Next;
            end;
          end;
          eventVO.VueltasCategoria:= vueltasListVO;

          puntoControlListVO := TList<TEventoPuntoControl>.Create;
          with ConnectionModule.ZGetPdCByEvento do
          begin
            Close;
            ParamByName('evento_oid').AsInteger:= OID;
            Open;
            while not Eof do
            begin
              puntoControlVO := TEventoPuntoControl.Create;
              puntoControlVO.Nombre:= FieldByName('nombre').AsString;
              puntoControlVO.NumeroPuntoControl:= FieldByName('nro_punto_control').AsInteger;
              puntoControlListVO.Add(puntoControlVO);

              Next;
            end;
          end;
          eventVO.PuntoDeControl:= puntoControlListVO;
        end;
      end;
   Result:= eventVO;
  end;

  function TBussinessDataSubsystemFacade.getTomaTiempoEventoVO(OID: Integer): TTomaTiempoEventoVO;
  var
    tomaTiempoEventoVO: TTomaTiempoEventoVO;
  begin
    with ConnectionModule.ZGetTomaTiempoEvento do
      begin
        Close;
        ParamByName('oid').AsInteger:= OID;
        Open;

        if (RecordCount > 0) then
        begin
          tomaTiempoEventoVO:= TTomaTiempoEventoVO.Create;
          tomaTiempoEventoVO.OID:= FieldByName('oid').AsInteger;
          tomaTiempoEventoVO.Nombre:= FieldByName('nombre').AsString;
          tomaTiempoEventoVO.EventoOID:= FieldByName('evento_oid').AsInteger;
          tomaTiempoEventoVO.TomaTiempoStartTime:= FieldByName('toma_tiempo_start_time').AsDateTime;
          tomaTiempoEventoVO.TomaTiempoStopTime:= FieldByName('toma_tiempo_end_time').AsDateTime;
          tomaTiempoEventoVO.Estado:= FieldByName('estado_toma_tiempo').AsString;
          tomaTiempoEventoVO.TagText:= FieldByName('tag_text').AsWideString;
        end;
      end;
   Result:= tomaTiempoEventoVO;
  end;

  function TBussinessDataSubsystemFacade.getTomaTiempoVO(tomaTiempoEventoOID, pilotoOID, nroVuelta: Integer): TTomaTiempoVO;
  var
    tomaTiempoVO: TTomaTiempoVO;
  begin
    tomaTiempoVO := nil;

    with ConnectionModule.ZGetTomaTiempoByPilotoNroVuelta do
      begin
        Close;
        ParamByName('toma_tiempo_evento_oid').AsInteger:= tomaTiempoEventoOID;
        ParamByName('piloto_oid').AsInteger:= pilotoOID;
        ParamByName('nro_vuelta').AsInteger:= nroVuelta;
        Open;

        if (RecordCount > 0) then
        begin
          tomaTiempoVO:= TTomaTiempoVO.Create;
          tomaTiempoVO.OID:= FieldByName('oid').AsInteger;
          tomaTiempoVO.PilotoOID:= FieldByName('piloto_oid').AsInteger;
          tomaTiempoVO.TiempoPasada:= FieldByName('tiempo_pasada').AsDateTime;
          tomaTiempoVO.IsDeleted:= FieldByName('is_deleted').AsInteger = 0;
          tomaTiempoVO.TomaTiempoEventoOID:= FieldByName('toma_tiempo_evento_oid').AsInteger;
          tomaTiempoVO.NroVuelta:= FieldByName('nro_vuelta').AsInteger;
          tomaTiempoVO.LecturaTagAntenaOID:= FieldByName('lectura_tag_antena_oid').AsInteger;
          tomaTiempoVO.EventoOID:= FieldByName('evento_oid').AsInteger;
        end;
      end;
   Result:= tomaTiempoVO;

  end;

  function TBussinessDataSubsystemFacade.getReconocimientoVO(tomaTiempoEventoOID, pilotoOID, nroVuelta: Integer): TTomaTiempoVO;
  var
    tomaTiempoVO: TTomaTiempoVO;
  begin
    tomaTiempoVO := nil;

    with ConnectionModule.ZGetReconocimientoByPilotoNroVuelta do
      begin
        Close;
        ParamByName('toma_tiempo_evento_oid').AsInteger:= tomaTiempoEventoOID;
        ParamByName('piloto_oid').AsInteger:= pilotoOID;
        ParamByName('nro_vuelta').AsInteger:= nroVuelta;
        Open;

        if (RecordCount > 0) then
        begin
          tomaTiempoVO:= TTomaTiempoVO.Create;
          tomaTiempoVO.OID:= FieldByName('oid').AsInteger;
          tomaTiempoVO.PilotoOID:= FieldByName('piloto_oid').AsInteger;
          tomaTiempoVO.TiempoPasada:= FieldByName('tiempo_pasada').AsDateTime;
          tomaTiempoVO.IsDeleted:= FieldByName('is_deleted').AsInteger = 0;
          tomaTiempoVO.TomaTiempoEventoOID:= FieldByName('toma_tiempo_evento_oid').AsInteger;
          tomaTiempoVO.NroVuelta:= FieldByName('nro_vuelta').AsInteger;
          tomaTiempoVO.LecturaTagAntenaOID:= FieldByName('lectura_tag_antena_oid').AsInteger;
        end;
      end;
   Result:= tomaTiempoVO;

  end;

  procedure TBussinessDataSubsystemFacade.deleteEvento(OID: Integer);
  begin
    with ConnectionModule.ZDeleteEvento do
      begin
        Close;
        ParamByName('oid').AsInteger:= OID;
        ExecSQL;
      end;
  end;

  procedure TBussinessDataSubsystemFacade.addInscripcion(inscripcionVO: TInscripcion);
  var
    esDiaInscripcion : Boolean;
  begin
    ConnectionModule.ZConnection.StartTransaction;
    try

      with ConnectionModule.ZAddInscripcion do
        begin
          Close;
          ParamByName('evento_oid').AsInteger:= inscripcionVO.EventoOID;
          ParamByName('piloto_oid').AsInteger:= inscripcionVO.PilotoOID;
          if (inscripcionVO.DiaInscripcionIndex = 0) then
            ParamByName('es_dia_inscripcion').AsSmallInt:= 1
          else
            ParamByName('es_dia_inscripcion').AsSmallInt:= 0;

          ParamByName('tipo_categoria_oid').AsInteger:= inscripcionVO.TipoCategoriaOID;

          ExecSQL;
        end;

      ConnectionModule.ZConnection.Commit;
    except
      ConnectionModule.ZConnection.Rollback;
    end;
  end;

  function TBussinessDataSubsystemFacade.getInscripcion(OID: Integer): TInscripcion;
  var
    inscripcionVO: TInscripcion;
  begin
    with ConnectionModule.ZGetInscripcion do
      begin
        Close;
        ParamByName('oid').AsInteger:= OID;
        Open;

        if (RecordCount > 0) then
        begin
          inscripcionVO:= TInscripcion.Create;
          inscripcionVO.OID:= FieldByName('oid').AsInteger;
          inscripcionVO.EventoOID:= FieldByName('evento_oid').AsInteger;
          inscripcionVO.PilotoOID:= FieldByName('piloto_oid').AsInteger;
        end;
      end;

   Result:= inscripcionVO;
  end;

  procedure TBussinessDataSubsystemFacade.deleteInscripcion(OID: Integer);
  begin
    with ConnectionModule.ZDeleteInscripcion do
      begin
        Close;
        ParamByName('oid').AsInteger:= OID;
        ExecSQL;
      end;
  end;

  procedure TBussinessDataSubsystemFacade.deletePuntuacionByEventoOIDAndCategoriaOID(EventoOID, CategoriaOID: Integer);
  begin
    with ConnectionModule.ZDeletePuntuacion do
      begin
        Close;
        ParamByName('evento_oid').AsInteger:= EventoOID;
        ParamByName('categoria_oid').AsInteger:= CategoriaOID;
        ExecSQL;
      end;
  end;

  procedure TBussinessDataSubsystemFacade.addPuntuacion(EventoOID, PilotoOID, CategoriaOID, Puntos, Puesto: Integer);
  begin
    ConnectionModule.ZConnection.StartTransaction;
    try

      with ConnectionModule.ZAddPuntuacion do
        begin
          Close;
          ParamByName('evento_oid').AsInteger:= EventoOID;
          ParamByName('piloto_oid').AsInteger:= PilotoOID;
          ParamByName('categoria_oid').AsInteger:= CategoriaOID;
          ParamByName('puntos').AsInteger:= Puntos;
          ParamByName('puesto').AsInteger:= Puesto;
          ExecSQL;
        end;

      ConnectionModule.ZConnection.Commit;
    except
      ConnectionModule.ZConnection.Rollback;
    end;
  end;


  procedure TBussinessDataSubsystemFacade.saveCategoria(categoriaVO: TCategoria);
  begin
    if categoriaVO.OID > 0 then
      modifyCategoria(categoriaVO)
    else
      addCategoria(categoriaVO);
  end;

  procedure TBussinessDataSubsystemFacade.modifyCategoria(categoriaVO: TCategoria);
  begin
    ConnectionModule.ZConnection.StartTransaction;
    try

      with ConnectionModule.ZModifyCategoria do
        begin
          Close;
          ParamByName('nombre').AsString:= categoriaVO.Nombre;
          ParamByName('oid').AsInteger:= categoriaVO.OID;
          ParamByName('tipo_categoria_oid').AsInteger:= categoriaVO.TipoCategoriaOID;
          ParamByName('valor_seguro').AsString:= categoriaVO.ValorSeguro;
          ParamByName('valor_seguro_texto').AsString:= categoriaVO.ValorSeguroTexto;
          ParamByName('edad_minima').AsInteger:= categoriaVO.EdadMinima;
          ParamByName('edad_maxima').AsInteger:= categoriaVO.EdadMaxima;
          ParamByName('valor_organizador').AsFloat:= categoriaVO.ValorOrganizador;
          ParamByName('valor_cordillerano').AsFloat:= categoriaVO.ValorCordillerano;

          if (categoriaVO.UtilizaAcompaniante) then
            ParamByName('utiliza_acompaniante').AsInteger:= 1
          else
            ParamByName('utiliza_acompaniante').AsInteger:= 0;

          if (categoriaVO.HandicupEdad) then
            ParamByName('calc_hand_edad').AsInteger:= 1
          else
            ParamByName('calc_hand_edad').AsInteger:= 0;

          if (categoriaVO.HandicupMoto) then
            ParamByName('calc_hand_moto').AsInteger:= 1
          else
            ParamByName('calc_hand_moto').AsInteger:= 0;

          ExecSQL;
        end;

      with ConnectionModule.ZModifyNumeracion do
        begin
          Close;
          ParamByName('inicio').AsInteger:= categoriaVO.NumeracionInicial;
          ParamByName('fin').AsInteger:= categoriaVO.NumeracionFinal;
          ParamByName('categoria_oid').AsInteger:= categoriaVO.OID;
          ExecSQL;
        end;

      ConnectionModule.ZConnection.Commit;
    except
      ConnectionModule.ZConnection.Rollback;
    end;
  end;

  function TBussinessDataSubsystemFacade.addCategoria(categoriaVO: TCategoria): Integer;
  var
    lastInsertedOID: Integer;
  begin
    ConnectionModule.ZConnection.StartTransaction;
    try

      with ConnectionModule.ZAddCategoria do
        begin
          Close;
          ParamByName('nombre').AsString:= categoriaVO.Nombre;
          ParamByName('tipo_categoria_oid').AsInteger:= categoriaVO.TipoCategoriaOID;
          ParamByName('valor_seguro').AsString:= categoriaVO.ValorSeguro;
          ParamByName('valor_seguro_texto').AsString:= categoriaVO.ValorSeguroTexto;
          ParamByName('edad_minima').AsInteger:= categoriaVO.EdadMinima;
          ParamByName('edad_maxima').AsInteger:= categoriaVO.EdadMaxima;
          ParamByName('valor_organizador').AsFloat:= categoriaVO.ValorOrganizador;
          ParamByName('valor_cordillerano').AsFloat:= categoriaVO.ValorCordillerano;

          if (categoriaVO.HandicupEdad) then
            ParamByName('calc_hand_edad').AsInteger:= 1
          else
            ParamByName('calc_hand_edad').AsInteger:= 0;

          if (categoriaVO.HandicupMoto) then
            ParamByName('calc_hand_moto').AsInteger:= 1
          else
            ParamByName('calc_hand_moto').AsInteger:= 0;

          if (categoriaVO.UtilizaAcompaniante) then
            ParamByName('utiliza_acompaniante').AsInteger:= 1
          else
            ParamByName('utiliza_acompaniante').AsInteger:= 0;


          ExecSQL;
        end;

      with ConnectionModule.ZSelLastInsOID do
        begin
          Close;
          Open;

          lastInsertedOID:= FieldByName('OID').AsInteger;

          Result:= lastInsertedOID;
        end;

      with ConnectionModule.ZAddNumeracion do
        begin
          Close;
          ParamByName('inicio').AsInteger:= categoriaVO.NumeracionInicial;
          ParamByName('fin').AsInteger:= categoriaVO.NumeracionFinal;
          ParamByName('categoria_oid').AsInteger:= lastInsertedOID;
          ExecSQL;
        end;

      ConnectionModule.ZConnection.Commit;
    except
      ConnectionModule.ZConnection.Rollback;
    end;
  end;

  function TBussinessDataSubsystemFacade.getPilotoCategoriaOIDByTipoCategoriaOIDAndEventoOID(
      pilotoOID, tipoCategoriaOID, eventoOID: Integer): Integer;
  var
    categoriaOID : Integer;
  begin
    with ConnectionModule.ZCategoriaOIDByTipoCatAndEvento do
      begin
        Close;
        ParamByName('tipo_categoria_oid').AsInteger:= tipoCategoriaOID;
        ParamByName('evento_oid').AsInteger:= eventoOID;
        ParamByName('piloto_oid').AsInteger:= pilotoOID;
        Open;

        categoriaOID:= FieldByName('categoria_oid').AsInteger;
      end;

    Result:= categoriaOID;
  end;

  function TBussinessDataSubsystemFacade.getCategoriaByName(Nombre: String): Integer;
  var
    categoriaOID: Integer;
    categoriaVO : TCategoria;
  begin
    with ConnectionModule.ZCategoriaByName do
      begin
        Close;
        ParamByName('nombre').AsString:= Nombre;
        Open;

        if (RecordCount > 0) then
          begin
            categoriaOID:= FieldByName('oid').AsInteger
          end
        else
          begin
            categoriaVO := TCategoria.Create;
            categoriaVO.Nombre:= Nombre;
            categoriaVO.TipoCategoriaOID:= 3;

            categoriaOID:= addCategoria(categoriaVO);
          end;
      end;

      Result:= categoriaOID;
  end;

  function TBussinessDataSubsystemFacade.getCategoria(OID: Integer): TCategoria;
  var
    categoriaVO: TCategoria;
  begin
    with ConnectionModule.ZGetCategoria do
      begin
        Close;
        ParamByName('OID').AsInteger:= OID;
        Open;

        if (RecordCount > 0) then
        begin
          categoriaVO:= TCategoria.Create;
          categoriaVO.OID:= FieldByName('oid').AsInteger;
          categoriaVO.Nombre:= FieldByName('nombre').AsString;
          categoriaVO.TipoCategoriaOID:= FieldByName('tipo_categoria_oid').AsInteger;
          categoriaVO.NumeracionInicial:= FieldByName('inicio').AsInteger;
          categoriaVO.NumeracionFinal:= FieldByName('fin').AsInteger;
          categoriaVO.ValorSeguro:= FieldByName('valor_seguro').AsString;
          categoriaVO.ValorSeguroTexto:= FieldByName('valor_seguro_texto').AsString;
          categoriaVO.EdadMinima:= FieldByName('edad_minima').AsInteger;
          categoriaVO.EdadMaxima:= FieldByName('edad_maxima').AsInteger;
          categoriaVO.HandicupEdad:= FieldByName('calc_hand_edad').AsInteger = 1;
          categoriaVO.HandicupMoto:= FieldByName('calc_hand_moto').AsInteger = 1;
          categoriaVO.ValorOrganizador:= FieldByName('valor_organizador').AsFloat;
          categoriaVO.ValorCordillerano:= FieldByName('valor_cordillerano').AsFloat;
          categoriaVO.UtilizaAcompaniante:= FieldByName('utiliza_acompaniante').AsInteger = 1;
        end;
      end;
   Result:= categoriaVO;
  end;

  procedure TBussinessDataSubsystemFacade.deleteCategoria(OID: Integer);
  begin
    ConnectionModule.ZConnection.StartTransaction;
    try

      with ConnectionModule.ZDeleteNumCategoria do
        begin
          Close;
          ParamByName('categoria_oid').AsInteger:= OID;
          ExecSQL;
        end;

      with ConnectionModule.ZDeleteCategoria do
        begin
          Close;
          ParamByName('oid').AsInteger:= OID;
          ExecSQL;
        end;

      ConnectionModule.ZConnection.Commit;
    except
      ConnectionModule.ZConnection.Rollback;
    end;
  end;

procedure TBussinessDataSubsystemFacade.savePuntos(puntosVO: TPuntos);
begin
  if puntosVO.OID > 0 then
    modifyPuntos(puntosVO)
  else
    addPuntos(puntosVO);
end;

  procedure TBussinessDataSubsystemFacade.addPuntos(puntosVO: TPuntos);
  begin
    ConnectionModule.ZConnection.StartTransaction;
    try

      with ConnectionModule.ZAddHandicup do
        begin
          Close;

          ParamByName('puesto').AsInteger:= puntosVO.Posicion;
          ParamByName('punto').AsInteger:= puntosVO.Puntos;
          ParamByName('punto_extra').AsInteger:= puntosVO.PuntosExtra;

          ExecSQL;
        end;

      ConnectionModule.ZConnection.Commit;
    except
      ConnectionModule.ZConnection.Rollback;
    end;
  end;

  procedure TBussinessDataSubsystemFacade.modifyPuntos(puntosVO: TPuntos);
  begin
    ConnectionModule.ZConnection.StartTransaction;
    try

      with ConnectionModule.ZModifyPuntos do
        begin
          Close;

          ParamByName('puesto').AsInteger:= puntosVO.Posicion;
          ParamByName('punto').AsInteger:= puntosVO.Puntos;
          ParamByName('punto_extra').AsInteger:= puntosVO.PuntosExtra;
          ParamByName('oid').AsInteger:= puntosVO.OID;
          ExecSQL;
        end;

      ConnectionModule.ZConnection.Commit;
    except
      ConnectionModule.ZConnection.Rollback;
    end;
  end;

function TBussinessDataSubsystemFacade.getPuntos(OID: Integer): TPuntos;
var
  puntosVO: TPuntos;
begin
  with ConnectionModule.ZGetPuntos do
    begin
      Close;
      ParamByName('OID').AsInteger:= OID;
      Open;

      if (RecordCount > 0) then
      begin
        puntosVO:= TPuntos.Create;
        puntosVO.OID:= FieldByName('oid').AsInteger;
        puntosVO.Posicion:= FieldByName('puesto').AsInteger;
        puntosVO.Puntos:= FieldByName('punto').AsInteger;
        puntosVO.PuntosExtra:= FieldByName('punto_extra').AsInteger;
      end;
    end;
 Result:= puntosVO;
end;

procedure TBussinessDataSubsystemFacade.deletePuntos(OID: Integer);
  begin
    with ConnectionModule.ZDeletePuntos do
      begin
        Close;
        ParamByName('oid').AsInteger:= OID;
        ExecSQL;
      end;
  end;

  procedure TBussinessDataSubsystemFacade.saveHandicup(handicupVO: THandicup);
  begin
    if handicupVO.OID > 0 then
      modifyHandicup(handicupVO)
    else
      addHandicup(handicupVO);
  end;


  procedure TBussinessDataSubsystemFacade.addHandicup(handicupVO: THandicup);
  begin
    ConnectionModule.ZConnection.StartTransaction;
    try

      with ConnectionModule.ZAddHandicup do
        begin
          Close;

          if (handicupVO.TipoCategoria) then
            ParamByName('tipo_handicup').AsString:= 'CATEGORIA';
          if (handicupVO.TipoMoto) then
            ParamByName('tipo_handicup').AsString:= 'MOTO';
          ParamByName('edad_base').AsInteger:= handicupVO.Edad;
          ParamByName('segundos_anio').AsInteger:= handicupVO.Segundos;
          ParamByName('categoria_oid').AsInteger:= handicupVO.CategoriaOID;
          ParamByName('modelo_moto_oid').AsInteger:= handicupVO.ModeloMotoOID;

          ExecSQL;
        end;

      ConnectionModule.ZConnection.Commit;
    except
      ConnectionModule.ZConnection.Rollback;
    end;
  end;

  procedure TBussinessDataSubsystemFacade.modifyHandicup(handicupVO: THandicup);
  begin
    ConnectionModule.ZConnection.StartTransaction;
    try

      with ConnectionModule.ZModifyHandicup do
        begin
          Close;
          if (handicupVO.TipoCategoria) then
            ParamByName('tipo_handicup').AsString:= 'CATEGORIA';
          if (handicupVO.TipoMoto) then
            ParamByName('tipo_handicup').AsString:= 'MOTO';
          ParamByName('edad_base').AsInteger:= handicupVO.Edad;
          ParamByName('segundos_anio').AsInteger:= handicupVO.Segundos;
          ParamByName('categoria_oid').AsInteger:= handicupVO.CategoriaOID;
          ParamByName('modelo_moto_oid').AsInteger:= handicupVO.ModeloMotoOID;
          ParamByName('oid').AsInteger:= handicupVO.OID;
          ExecSQL;
        end;

      ConnectionModule.ZConnection.Commit;
    except
      ConnectionModule.ZConnection.Rollback;
    end;
  end;

  procedure TBussinessDataSubsystemFacade.deleteHandicup(OID: Integer);
  begin
    with ConnectionModule.ZDeleteHandicup do
      begin
        Close;
        ParamByName('oid').AsInteger:= OID;
        ExecSQL;
      end;
  end;

  function TBussinessDataSubsystemFacade.getHandicup(OID: Integer): THandicup;
  var
    handicupVO: THandicup;
  begin
    with ConnectionModule.ZGetHandicup do
      begin
        Close;
        ParamByName('OID').AsInteger:= OID;
        Open;

        if (RecordCount > 0) then
        begin
          handicupVO:= THandicup.Create;
          handicupVO.OID:= FieldByName('oid').AsInteger;
          handicupVO.TipoCategoria:= FieldByName('tipo_handicup').AsString = 'CATEGORIA';
          handicupVO.TipoMoto:= FieldByName('tipo_handicup').AsString = 'MOTO';
          handicupVO.Edad:= FieldByName('edad_base').AsInteger;
          handicupVO.Segundos:= FieldByName('segundos_anio').AsInteger;
          handicupVO.CategoriaOID:= FieldByName('categoria_oid').AsInteger;
          handicupVO.ModeloMotoOID:= FieldByName('modelo_moto_oid').AsInteger;
        end;
      end;
   Result:= handicupVO;
  end;

  procedure TBussinessDataSubsystemFacade.saveCampeonato(campeonatoVO: TCampeonato);
  begin
    if campeonatoVO.OID > 0 then
      modifyCampeonato(campeonatoVO)
    else
      addCampeonato(campeonatoVO);
  end;

  procedure TBussinessDataSubsystemFacade.addCampeonato(campeonatoVO: TCampeonato);
  var
    lastInsertedOID: Integer;
  begin
    ConnectionModule.ZConnection.StartTransaction;
    try

      with ConnectionModule.ZAddCampeonato do
        begin
          Close;
          ParamByName('nombre').AsString:= campeonatoVO.Nombre;
          ExecSQL;
        end;

      with ConnectionModule.ZSelLastInsOID do
        begin
          Close;
          Open;

          lastInsertedOID:= FieldByName('OID').AsInteger;
        end;

      ConnectionModule.ZConnection.Commit;
    except
      ConnectionModule.ZConnection.Rollback;
    end;
  end;

  procedure TBussinessDataSubsystemFacade.addRecargoTomaTiempoEvento(recargoTomaTiempoEventoVO: TRecargoTomaTiempoEventoVO);
  begin
    ConnectionModule.ZConnection.StartTransaction;
    try
      with ConnectionModule.ZAddRecargoTomaTiempoEvento do
        begin
          Close;
          ParamByName('toma_tiempo_evento_oid').AsInteger:= recargoTomaTiempoEventoVO.TomaTiempoEventoOID;
          ParamByName('piloto_oid').AsInteger:= recargoTomaTiempoEventoVO.PilotoOID;
          ParamByName('tipo_recargo').AsInteger:= recargoTomaTiempoEventoVO.TipoRecargoOID;
          ParamByName('tipo_categoria_oid').AsInteger:= recargoTomaTiempoEventoVO.TipoCategoriaOID;
          ParamByName('segundos_recargo').AsSmallInt:= recargoTomaTiempoEventoVO.SegundosRecargo;
          ExecSQL;
        end;
      ConnectionModule.ZConnection.Commit;
    except
      ConnectionModule.ZConnection.Rollback;
    end;
  end;

  function TBussinessDataSubsystemFacade.saveLecturaTagsAntena(lecturaTagsAntenaVO: TLecturaTagsAntena) : Integer;
  var
    lastInsertedOID: Integer;
  begin
    ConnectionModule.ZConnectionAntena.StartTransaction;
    try
      with ConnectionModule.ZAddLecturaTagsAntena do
        begin
          Close;
          ParamByName('tagid').AsString:= lecturaTagsAntenaVO.TagID;
          ParamByName('timestampux').AsLargeInt:= lecturaTagsAntenaVO.Timestampux;
          ExecSQL;
        end;

      with ConnectionModule.ZSelLastInsAntenaOID do
        begin
          Close;
          Open;

          lastInsertedOID:= FieldByName('OID').AsInteger;
        end;

      ConnectionModule.ZConnectionAntena.Commit;
    except
      ConnectionModule.ZConnectionAntena.Rollback;
    end;

    Result:= lastInsertedOID;
  end;

  procedure TBussinessDataSubsystemFacade.deleteRecargoTomaTiempoEvento(OID: Integer);
  begin
    with ConnectionModule.ZDeleteRecargoTomaTiempoEvento do
      begin
        Close;
        ParamByName('oid').AsInteger:= OID;
        ExecSQL;
      end;
  end;

  procedure TBussinessDataSubsystemFacade.modifyCampeonato(campeonatoVO: TCampeonato);
  begin
    ConnectionModule.ZConnection.StartTransaction;
    try

      with ConnectionModule.ZModifyCampeonato do
        begin
          Close;
          ParamByName('nombre').AsString:= campeonatoVO.Nombre;
          ParamByName('oid').AsInteger:= campeonatoVO.OID;
          ExecSQL;
        end;

      ConnectionModule.ZConnection.Commit;
    except
      ConnectionModule.ZConnection.Rollback;
    end;
  end;

  function TBussinessDataSubsystemFacade.getCampeonato(OID: Integer): TCampeonato;
  var
    campeonatoVO: TCampeonato;
  begin
    with ConnectionModule.ZGetCampeonato do
      begin
        Close;
        ParamByName('OID').AsInteger:= OID;
        Open;

        if (RecordCount > 0) then
        begin
          campeonatoVO:= TCampeonato.Create;
          campeonatoVO.OID:= FieldByName('oid').AsInteger;
          campeonatoVO.Nombre:= FieldByName('nombre').AsString;
        end;
      end;
   Result:= campeonatoVO;
  end;

  procedure TBussinessDataSubsystemFacade.deleteCampeonato(OID: Integer);
  begin
    with ConnectionModule.ZDeleteCampeonato do
      begin
        Close;
        ParamByName('oid').AsInteger:= OID;
        ExecSQL;
      end;
  end;

  procedure TBussinessDataSubsystemFacade.saveMoto(motoVO: TMoto);
  begin
    if motoVO.OID > 0 then
      modifyMoto(motoVO)
    else
      addMoto(motoVO);
  end;

  procedure TBussinessDataSubsystemFacade.addMoto(motoVO: TMoto);
  var
    lastInsertedOID: Integer;
  begin
    ConnectionModule.ZConnection.StartTransaction;
    try

      with ConnectionModule.ZAddMoto do
        begin
          Close;
          ParamByName('nombre').AsString:= motoVO.Nombre;
          ParamByName('puntos_extra').AsInteger:= motoVO.PuntosExtra;
          ExecSQL;
        end;

      ConnectionModule.ZConnection.Commit;
    except
      ConnectionModule.ZConnection.Rollback;
    end;
  end;

  procedure TBussinessDataSubsystemFacade.modifyMoto(motoVO: TMoto);
  begin
    ConnectionModule.ZConnection.StartTransaction;
    try

      with ConnectionModule.ZModifyMoto do
        begin
          Close;
          ParamByName('nombre').AsString:= motoVO.Nombre;
          ParamByName('puntos_extra').AsInteger:= motoVO.PuntosExtra;
          ParamByName('oid').AsInteger:= motoVO.OID;
          ExecSQL;
        end;

      ConnectionModule.ZConnection.Commit;
    except
      ConnectionModule.ZConnection.Rollback;
    end;
  end;

  function TBussinessDataSubsystemFacade.getMoto(OID: Integer): TMoto;
  var
    motoVO: TMoto;
  begin
    with ConnectionModule.ZGetMoto do
      begin
        Close;
        ParamByName('OID').AsInteger:= OID;
        Open;

        if (RecordCount > 0) then
        begin
          motoVO:= TMoto.Create;
          motoVO.OID:= FieldByName('oid').AsInteger;
          motoVO.Nombre:= FieldByName('nombre').AsString;
          motoVO.PuntosExtra:= FieldByName('puntos_extra').AsInteger;
        end;
      end;
   Result:= motoVO;
  end;

  procedure TBussinessDataSubsystemFacade.deleteMoto(OID: Integer);
  begin
    with ConnectionModule.ZDeleteMoto do
      begin
        Close;
        ParamByName('oid').AsInteger:= OID;
        ExecSQL;
      end;
  end;

procedure TBussinessDataSubsystemFacade.addParadasPiloto(PilotoOID, EventoOID, TipoCategoriaOID: Integer);
begin
    with ConnectionModule.ZAddParadaPiloto do
      begin
        Close;
        ParamByName('piloto_oid').AsInteger:= PilotoOID;
        ParamByName('evento_oid').AsInteger:= EventoOID;
        ParamByName('tipo_categoria_oid').AsInteger:= TipoCategoriaOID;
        ExecSQL;
      end;
end;

procedure TBussinessDataSubsystemFacade.addTiempoAbastecimientoPiloto(PilotoImportadoOID, EventoOID, nroVuelta: Integer);
begin
  with ConnectionModule.ZAddTomaTiempoAbastPiloto do
    begin
      Close;
      ParamByName('piloto_importado_oid').AsInteger:= PilotoImportadoOID;
      ParamByName('ttae_pod').AsInteger:= EventoOID;
      ParamByName('nro_vuelta').AsInteger:= nroVuelta;

      ExecSQL;
    end;
end;

procedure TBussinessDataSubsystemFacade.addTiempoAbastecimientoPilotoConTiempo(PilotoImportadoOID, EventoOID, nroVuelta: Integer; tiempo: TDateTime);
begin
  with ConnectionModule.ZAddTomaTiempoAbastPilotoCT do
    begin
      Close;
      ParamByName('piloto_importado_oid').AsInteger:= PilotoImportadoOID;
      ParamByName('ttae_pod').AsInteger:= EventoOID;
      ParamByName('nro_vuelta').AsInteger:= nroVuelta;
      ParamByName('tiempo_pasada').AsDateTime:= tiempo;
      ExecSQL;
    end;
end;

function TBussinessDataSubsystemFacade.getInscripcionByPilotoOIDAndCampeonatoOID(PilotoOID, CampeonatoOID: Integer): Boolean;
begin
    with ConnectionModule.ZGetInscripcionEnCampeonato do
      begin
        Close;
        ParamByName('piloto_oid').AsInteger:= PilotoOID;
        ParamByName('campeonato_oid').AsInteger:= CampeonatoOID;
        Open;

        Result := RecordCount > 0;
      end;
end;

function TBussinessDataSubsystemFacade.getInscripcionByPilotoOIDAndEventoOID(PilotoOID, EventoOID: Integer): Integer;
var
  inscripcionOID : Integer;
begin
    inscripcionOID:= 0;

    with ConnectionModule.ZGetInscripcionByPilotoAndEvento do
      begin
        Close;
        ParamByName('piloto_oid').AsInteger:= PilotoOID;
        ParamByName('evento_oid').AsInteger:= EventoOID;
        Open;

        if (RecordCount > 0) then
        begin
          inscripcionOID:= FieldByName('oid').AsInteger;
        end;
      end;

   Result:= inscripcionOID;
end;

function TBussinessDataSubsystemFacade.getTipoCategoriaOIDByPilotoOIDAndEventoOID(PilotoOID, EventoOID: Integer): Integer;
var
  tipoCategoriaOID : Integer;
begin
    tipoCategoriaOID:= 1;

    with ConnectionModule.ZGetInscripcionByPilotoAndEvento do
      begin
        Close;
        ParamByName('piloto_oid').AsInteger:= PilotoOID;
        ParamByName('evento_oid').AsInteger:= EventoOID;
        Open;

        if (RecordCount > 0) then
        begin
          tipoCategoriaOID:= FieldByName('tipo_categoria_oid').AsInteger;
        end;
      end;

   Result:= tipoCategoriaOID;
end;

function TBussinessDataSubsystemFacade.getTipoCategoriaByEventoOIDAndOrdenLargada(EventoOID, NroLargada: Integer): Integer;
var
  tipoCategoriaOID : Integer;
begin
    tipoCategoriaOID:= 0;

    with ConnectionModule.ZGetTipoCategoriaByEventoAndOrdenLargada do
      begin
        Close;
        ParamByName('orden_largada').AsInteger:= NroLargada;
        ParamByName('evento_oid').AsInteger:= EventoOID;
        Open;

        if (RecordCount > 0) then
        begin
          tipoCategoriaOID:= FieldByName('tipo_categoria_oid').AsInteger;
        end;
      end;

   Result:= tipoCategoriaOID;
end;

function TBussinessDataSubsystemFacade.existParadasPiloto(PilotoOID, EventoOID : Integer):Boolean;
var
  return_value: Boolean;
begin
    with ConnectionModule.ZGetParadaPiloto do
    begin
        Close;
        ParamByName('piloto_oid').AsInteger:= PilotoOID;
        ParamByName('evento_oid').AsInteger:= EventoOID;
        Open;

        return_value:= RecordCount > 0;
    end;

    Result:= return_value;
end;

procedure TBussinessDataSubsystemFacade.addTomaTiempo(tomaTiempoEventoOID, pilotoOID: Integer);
var
  nroVuelta : Integer;
begin
    with ConnectionModule.ZGetNroCuentaNow do
      begin
        Close;
        ParamByName('piloto_oid').AsInteger:= pilotoOID;
        ParamByName('toma_tiempo_evento_oid').AsInteger:= tomaTiempoEventoOID;
        Open;

        nroVuelta:= FieldByName('count').AsInteger;
      end;

  with ConnectionModule.ZAddTomaTiempo do
    begin
      Close;
      ParamByName('piloto_oid').AsInteger:= pilotoOID;
      ParamByName('toma_tiempo_evento_oid').AsInteger:= tomaTiempoEventoOID;
      ParamByName('nro_vuelta').AsSmallInt:= nroVuelta;
      ExecSQL;
    end;
end;

procedure TBussinessDataSubsystemFacade.addReconocimiento(tomaTiempoEventoOID, pilotoOID: Integer);
var
  nroVuelta : Integer;
begin
    with ConnectionModule.ZGetNroCuentaReconoNow do
      begin
        Close;
        ParamByName('piloto_oid').AsInteger:= pilotoOID;
        ParamByName('toma_tiempo_evento_oid').AsInteger:= tomaTiempoEventoOID;
        Open;

        nroVuelta:= FieldByName('count').AsInteger;
      end;

  with ConnectionModule.ZAddReconocimiento do
    begin
      Close;
      ParamByName('piloto_oid').AsInteger:= pilotoOID;
      ParamByName('toma_tiempo_evento_oid').AsInteger:= tomaTiempoEventoOID;
      ParamByName('nro_vuelta').AsSmallInt:= nroVuelta;
      ExecSQL;
    end;
end;

procedure TBussinessDataSubsystemFacade.addTomaTiempoWithTime(tomaTiempoEventoOID, pilotoOID: Integer;
  tiempoPasada: TDateTime; importada : Boolean);
var
  nroVuelta : Integer;
  FechaConHoraPrecisa: TDateTime;
  H, M, S, MS: Word;
begin
    // 1. Preparamos la fecha actual con la hora de 'tiempoPasada'
    DecodeTime(tiempoPasada, H, M, S, MS);
    FechaConHoraPrecisa := Trunc(Date) + EncodeTime(H, M, S, MS);

    with ConnectionModule.GetNroCuenta do
      begin
        Close;
        ParamByName('piloto_oid').AsInteger:= pilotoOID;
        ParamByName('toma_tiempo_evento_oid').AsInteger:= tomaTiempoEventoOID;
        //ReplaceDate(tiempoPasada, Date);
        //ParamByName('tiempo_pasada').AsDateTime:= tiempoPasada;
        // Usamos el string formateado para no perder nada
        ParamByName('tiempo_pasada').AsString := FormatDateTime('yyyy-mm-dd hh:nn:ss.zzz', FechaConHoraPrecisa);
        Open;

        nroVuelta:= FieldByName('count').AsInteger;
      end;

  with ConnectionModule.ZAddTomaTiempoWithTiempo do
    begin
      Close;
      ParamByName('piloto_oid').AsInteger:= pilotoOID;
      ParamByName('toma_tiempo_evento_oid').AsInteger:= tomaTiempoEventoOID;
      ParamByName('nro_vuelta').AsSmallInt:= nroVuelta;
      ParamByName('toma_tiempo_importada').AsSmallInt:= nroVuelta;
      //ReplaceDate(tiempoPasada, Date);
      //ParamByName('tiempo_pasada').AsDateTime:= tiempoPasada;

      // ENVIAR COMO STRING PARA ASEGURAR MILISEGUNDOS
      ParamByName('tiempo_pasada').AsString := FormatDateTime('yyyy-mm-dd hh:nn:ss.zzz', FechaConHoraPrecisa);
      ExecSQL;
    end;

  with ConnectionModule.ZUpdateNroVueltaAddPasada do
    begin
      Close;
      ParamByName('piloto_oid').AsInteger:= pilotoOID;
      ParamByName('toma_tiempo_evento_oid').AsInteger:= tomaTiempoEventoOID;

      //ReplaceDate(tiempoPasada, Date);
      //ParamByName('tiempo_pasada').AsDateTime:= tiempoPasada;
      // ENVIAR COMO STRING PARA ASEGURAR MILISEGUNDOS
      ParamByName('tiempo_pasada').AsString := FormatDateTime('yyyy-mm-dd hh:nn:ss.zzz', FechaConHoraPrecisa);
      ExecSQL;
    end;
end;

procedure TBussinessDataSubsystemFacade.addTomaTiempoWithTagReference(tomaTiempoEventoOID, lecturaOID: Integer; tiempoPasada: TDateTime; TagID: String);
var
  pilotoOID, nroVuelta : Integer;
begin
    pilotoOID:= TBussinessDataSubsystemFacade.getInstance.getPilotoOIDByTagID(TagID);

    if (pilotoOID>0) then
    begin
      with ConnectionModule.GetNroCuenta2 do
        begin
          Close;
          ParamByName('piloto_oid').AsInteger:= pilotoOID;
          ParamByName('toma_tiempo_evento_oid').AsInteger:= tomaTiempoEventoOID;
          Open;

          nroVuelta:= FieldByName('count').AsInteger;
        end;

      with ConnectionModule.ZAddTomaTiempoWithTagID do
        begin
          Close;
          ParamByName('piloto_oid').AsInteger:= pilotoOID;
          ParamByName('toma_tiempo_evento_oid').AsInteger:= tomaTiempoEventoOID;
          ParamByName('nro_vuelta').AsSmallInt:= nroVuelta;
          ParamByName('lectura_tag_antena_oid').AsInteger:= lecturaOID;
          ExecSQL;
        end;
    end;
end;

procedure TBussinessDataSubsystemFacade.addReconocimientoWithTagReference(tomaTiempoEventoOID, lecturaOID, nroVuelta: Integer; tiempoPasada: TDateTime; TagID: String);
var
  pilotoOID : Integer;
begin
    pilotoOID:= TBussinessDataSubsystemFacade.getInstance.getPilotoOIDByTagID(TagID);

    if (pilotoOID>0) then
      begin
        with ConnectionModule.ZAddReconocimientoWithTagID do
          begin
            Close;
            ParamByName('piloto_oid').AsInteger:= pilotoOID;
            ParamByName('toma_tiempo_evento_oid').AsInteger:= tomaTiempoEventoOID;
            ParamByName('nro_vuelta').AsSmallInt:= nroVuelta;
            ParamByName('lectura_tag_antena_oid').AsInteger:= lecturaOID;
            ExecSQL;
          end;
      end;
end;

procedure TBussinessDataSubsystemFacade.addReconocimientoWithTime(tomaTiempoEventoOID, pilotoOID: Integer; tiempoPasada: TDateTime);
var
  nroVuelta : Integer;
begin
    with ConnectionModule.ZGetVueltasReconoByTime do
      begin
        Close;
        ParamByName('piloto_oid').AsInteger:= pilotoOID;
        ParamByName('toma_tiempo_evento_oid').AsInteger:= tomaTiempoEventoOID;
        ReplaceDate(tiempoPasada, Date);
        ParamByName('tiempo_pasada').AsDateTime:= tiempoPasada;
        Open;

        nroVuelta:= FieldByName('count').AsInteger;
      end;

  with ConnectionModule.ZAddReconocimientoWithTiempo do
    begin
      Close;
      ParamByName('piloto_oid').AsInteger:= pilotoOID;
      ParamByName('toma_tiempo_evento_oid').AsInteger:= tomaTiempoEventoOID;
      ParamByName('nro_vuelta').AsSmallInt:= nroVuelta;
      ReplaceDate(tiempoPasada, Date);
      ParamByName('tiempo_pasada').AsDateTime:= tiempoPasada;
      ExecSQL;
    end;


  with ConnectionModule.ZUpdateNroVueltaAddPasadaRecono do
    begin
      Close;
      ParamByName('piloto_oid').AsInteger:= pilotoOID;
      ParamByName('toma_tiempo_evento_oid').AsInteger:= tomaTiempoEventoOID;

      ReplaceDate(tiempoPasada, Date);
      ParamByName('tiempo_pasada').AsDateTime:= tiempoPasada;
      ExecSQL;
    end;
end;

function TBussinessDataSubsystemFacade.GetNroVuelta(pilotoOID, tomaTiempoEventoOID: Integer) : Integer;
var
  nroVuelta : Integer;
begin
  with ConnectionModule.GetNroVuelta do
    begin
      Close;
      ParamByName('piloto_oid').AsInteger:= pilotoOID;
      ParamByName('toma_tiempo_evento_oid').AsInteger:= tomaTiempoEventoOID;
      Open;

      nroVuelta:= FieldByName('count').AsInteger;
    end;
  Result:= nroVuelta;
end;

function TBussinessDataSubsystemFacade.GetNroVueltaAbastecimiento(pilotoImportadoOID, tomaTiempoAbastecimientoEventoOID: Integer) : Integer;
var
  nroVuelta : Integer;
begin
  with ConnectionModule.ZGetNroVueltaAbastecimiento do
    begin
      Close;
      ParamByName('piloto_importado_oid').AsInteger:= pilotoImportadoOID;
      ParamByName('ttae_oid').AsInteger:= tomaTiempoAbastecimientoEventoOID;
      Open;

      nroVuelta:= FieldByName('count').AsInteger;
    end;
  Result:= nroVuelta;
end;

function TBussinessDataSubsystemFacade.GetNroVueltaReconocimiento(pilotoOID, tomaTiempoEventoOID: Integer) : Integer;
var
  nroVuelta : Integer;
begin
  with ConnectionModule.GetNroVueltaReconocimiento do
    begin
      Close;
      ParamByName('piloto_oid').AsInteger:= pilotoOID;
      ParamByName('toma_tiempo_evento_oid').AsInteger:= tomaTiempoEventoOID;
      Open;

      nroVuelta:= FieldByName('count').AsInteger;
    end;
  Result:= nroVuelta;
end;

procedure TBussinessDataSubsystemFacade.updatePilotoToTomaTiempo(pilotoOID, OID: Integer);
begin
    with ConnectionModule.ZUpdateTomaTiempo do
      begin
        Close;
        ParamByName('piloto_oid').AsInteger:= pilotoOID;
        ParamByName('nro_vuelta').AsSmallInt:= GetNroVuelta(pilotoOID, OID);
        ParamByName('oid').AsInteger:= OID;
        ExecSQL;
      end;
end;

procedure TBussinessDataSubsystemFacade.updateEstadoTomaTiempo(isDeleted: SmallInt;  OID: Integer);
begin
    with ConnectionModule.ZUpdateEstadoTomaTiempo do
      begin
        Close;
        ParamByName('is_deleted').AsSmallInt:= isDeleted;
        ParamByName('oid').AsInteger:= OID;
        ExecSQL;
      end;

  with ConnectionModule.ZGetTomaTiempo do
    begin
      Close;
      ParamByName('oid').AsInteger:= OID;
      Open;
    end;

  if (isDeleted = 1) then
  begin
    with ConnectionModule.ZUpdateNroVueltaDisalbePasada do
      begin
        Close;
        ParamByName('piloto_oid').AsInteger:= ConnectionModule.ZGetTomaTiempo.FieldByName('piloto_oid').AsInteger;
        ParamByName('toma_tiempo_evento_oid').AsInteger:= ConnectionModule.ZGetTomaTiempo.FieldByName('toma_tiempo_evento_oid').AsInteger;
        ParamByName('nro_vuelta').AsSmallInt:= ConnectionModule.ZGetTomaTiempo.FieldByName('nro_vuelta').AsInteger;
        ExecSQL;
    end;
  end;

  if (isDeleted = 0) then
  begin
    with ConnectionModule.ZUpdateNroVueltaEnablePasada do
      begin
        Close;
        ParamByName('piloto_oid').AsInteger:= ConnectionModule.ZGetTomaTiempo.FieldByName('piloto_oid').AsInteger;
        ParamByName('toma_tiempo_evento_oid').AsInteger:= ConnectionModule.ZGetTomaTiempo.FieldByName('toma_tiempo_evento_oid').AsInteger;
        ParamByName('nro_vuelta').AsSmallInt:= ConnectionModule.ZGetTomaTiempo.FieldByName('nro_vuelta').AsInteger;
        ParamByName('oid').AsInteger:= OID;
        ExecSQL;
      end;
  end;
end;

procedure TBussinessDataSubsystemFacade.updateEstadoReconocimiento(isDeleted: SmallInt;  OID: Integer);
begin
    with ConnectionModule.ZUpdateEstadoReconocimiento do
      begin
        Close;
        ParamByName('is_deleted').AsSmallInt:= isDeleted;
        ParamByName('oid').AsInteger:= OID;
        ExecSQL;
      end;

  with ConnectionModule.ZGetReconocimiento do
    begin
      Close;
      ParamByName('oid').AsInteger:= OID;
      Open;
    end;


  if (isDeleted = 1) then
  begin
    with ConnectionModule.ZUpdateNroVueltaDisalbePasadaRec do
      begin
        Close;
        ParamByName('piloto_oid').AsInteger:= ConnectionModule.ZGetReconocimiento.FieldByName('piloto_oid').AsInteger;
        ParamByName('toma_tiempo_evento_oid').AsInteger:= ConnectionModule.ZGetReconocimiento.FieldByName('toma_tiempo_evento_oid').AsInteger;
        ParamByName('nro_vuelta').AsSmallInt:= ConnectionModule.ZGetReconocimiento.FieldByName('nro_vuelta').AsInteger;
        ExecSQL;
    end;
  end;

  if (isDeleted = 0) then
  begin
    with ConnectionModule.ZUpdateNroVueltaEnablePasadaRec do
      begin
        Close;
        ParamByName('piloto_oid').AsInteger:= ConnectionModule.ZGetReconocimiento.FieldByName('piloto_oid').AsInteger;
        ParamByName('toma_tiempo_evento_oid').AsInteger:= ConnectionModule.ZGetReconocimiento.FieldByName('toma_tiempo_evento_oid').AsInteger;
        ParamByName('nro_vuelta').AsSmallInt:= ConnectionModule.ZGetReconocimiento.FieldByName('nro_vuelta').AsInteger;
        ParamByName('oid').AsInteger:= OID;
        ExecSQL;
      end;
  end;
end;

function TBussinessDataSubsystemFacade.addTomaTiempoEvento(nombre, tipoTomaTiempo: String; eventoOID: Integer) : Integer;
var
  lastInsertedOID : Integer;
begin
    with ConnectionModule.ZAddTomaTiempoEvento do
      begin
        Close;
        ParamByName('nombre').AsString:= nombre;
        ParamByName('evento_oid').AsInteger:= eventoOID;
        ParamByName('tipo_toma_tiempo').AsString:= tipoTomaTiempo;
        ExecSQL;
      end;

      with ConnectionModule.ZSelLastInsOID do
        begin
          Close;
          Open;

          lastInsertedOID:= FieldByName('OID').AsInteger;
        end;
  Result:= lastInsertedOID;
end;

procedure TBussinessDataSubsystemFacade.editTomaTiempoEvento(oid : Integer; nombre, estado: String);
begin
    with ConnectionModule.ZUpdateTomaTiempoEvento do
      begin
        Close;
        ParamByName('nombre').AsString:= nombre;
        ParamByName('estado_toma_tiempo').AsString:= estado;
        ParamByName('oid').AsInteger:= oid;
        ExecSQL;
      end;
end;

procedure TBussinessDataSubsystemFacade.editTomaTiempoEventoTagText(oid : Integer; tagText: String);
begin
    with ConnectionModule.ZUpdateTagTextTTEvento do
      begin
        Close;
        ParamByName('tag_text').AsString:= tagText;
        ParamByName('oid').AsInteger:= oid;
        ExecSQL;
      end;
end;

function TBussinessDataSubsystemFacade.getNroVueltaByCategoriaAndEvento(eventoOID, categoriaOID : Integer): Integer;
var
  nroVueltas : Integer;
begin
  with ConnectionModule.ZROQNroVueltaByCategoria do
    begin
      Close;
      ParamByName('evento_oid').AsInteger:= eventoOID;
      ParamByName('categoria_oid').AsInteger:= categoriaOID;
      Open;

      nroVueltas:= FieldByName('nro_vueltas').AsInteger;
    end;

  Result:= nroVueltas;
end;

function TBussinessDataSubsystemFacade.getCountTipoCategoriaByEventoAndNroVuelta(eventoOID, nroVuelta: Integer): Integer;
var
  tipoCategoriaCount: Integer;
begin
  with ConnectionModule.ZGetTipoCategoriaByEventoAndLargada do
    begin
      Close;
      ParamByName('evento_oid').AsInteger:= eventoOID;
      ParamByName('orden_de_largada').AsSmallInt:= nroVuelta;
      Open;

      tipoCategoriaCount:= RecordCount;
    end;

  Result:= tipoCategoriaCount;
end;

function TBussinessDataSubsystemFacade.getTipoCategoraOIDByEventoAndNroVuelta(tomaTiempoEventoOID: Integer): Integer;
var
  tipoCategoriaOID: Integer;
begin
  with ConnectionModule.ZGetTipoCategoriaByEventoAndLargada do
    begin
      Close;
      ParamByName('toma_tiempo_evento_oid').AsInteger:= tomaTiempoEventoOID;
      Open;

      tipoCategoriaOID:= FieldByName('tipo_categoria_oid').AsInteger;
    end;

  Result:= tipoCategoriaOID;
end;

function TBussinessDataSubsystemFacade.getTipoCategoraOIDByEventoReconocimiento(tomaTiempoEventoOID: Integer): Integer;
var
  tipoCategoriaOID: Integer;
begin
  with ConnectionModule.ZGetTipoCategoriaByEventoReconocimiento do
    begin
      Close;
      ParamByName('toma_tiempo_evento_oid').AsInteger:= tomaTiempoEventoOID;
      Open;

      tipoCategoriaOID:= FieldByName('tipo_categoria_oid').AsInteger;
    end;

  Result:= tipoCategoriaOID;
end;

function TBussinessDataSubsystemFacade.getLocalidadOID(Provincia, Localidad : String) : Integer;
var
  provinciaOID, localidadOID: Integer;
begin
  localidadOID:= 0;
  with ConnectionModule.zGetProvinciaByName do
    begin
      Close;
      ParamByName('provincia').AsString:= Provincia;
      Open;

      provinciaOID:= FieldByName('oid').AsInteger;
    end;

  with ConnectionModule.ZGetLocalidadByProvinciaAndName do
    begin
      Close;
      ParamByName('provincia_oid').AsInteger:= provinciaOID;
      ParamByName('localidad').AsString:= Localidad;
      Open;

      localidadOID:= FieldByName('oid').AsInteger;
    end;

  Result:= localidadOID;
end;

function TBussinessDataSubsystemFacade.getLocalidadProvinciaByLocalidadOID(LocalidadOID : Integer):String;
var
  localidadProvincia : String;
begin
  with ConnectionModule.ZGetLocalidadProinciaByLocalidadOID do
    begin
      Close;
      ParamByName('localidad_oid').AsInteger:= LocalidadOID;
      Open;

      localidadProvincia:= FieldByName('localidad_provincia').AsString;
    end;
  Result:= localidadProvincia;
end;

procedure TBussinessDataSubsystemFacade.deleteTomaTiempoEvento(OID: Integer);
begin
  with ConnectionModule.ZDeleteTomaTiempoEvento do
    begin
      Close;
      ParamByName('oid').AsInteger:= OID;
      ExecSQL;
    end;
end;

function TBussinessDataSubsystemFacade.selPuntoByPuesto(Puesto: String) : Integer;
var
  puntos : Integer;
begin
  with ConnectionModule.ZGetPuntosByPosicion do
    begin
      Close;
      ParamByName('puesto').AsString:= Puesto;
      Open;

      puntos:= FieldByName('punto').AsInteger;
    end;

    Result:= puntos
end;

procedure TBussinessDataSubsystemFacade.savePilotoImportado(pilotoImportadoVO: TPilotoImportado);
begin
  if pilotoImportadoVO.OID > 0 then
    modifyPilotoImportado(pilotoImportadoVO)
  else
    addPilotoImportado(pilotoImportadoVO);
end;

function TBussinessDataSubsystemFacade.addTTAE(ttaeVO: TTomaTiempoAbastecimientoEvento) : Integer;
var
  lastInsertedOID: Integer;
begin
  ConnectionModule.ZConnection.StartTransaction;
  try

    with ConnectionModule.ZAddTTAE do
      begin
        Close;
        ParamByName('nombre').AsString:= ttaeVO.Nombre;
        ParamByName('segundos').AsSmallInt:= ttaeVO.Segundos;
        ExecSQL;
      end;

    with ConnectionModule.ZSelLastInsOID do
      begin
        Close;
        Open;

        lastInsertedOID:= FieldByName('OID').AsInteger;
      end;
    ConnectionModule.ZConnection.Commit;
  except
    ConnectionModule.ZConnection.Rollback;
  end;

  Result:= lastInsertedOID;
end;

procedure TBussinessDataSubsystemFacade.addPilotoImportado(pilotoImportadoVO: TPilotoImportado);
var
  lastInsertedOID: Integer;
begin
  ConnectionModule.ZConnection.StartTransaction;
  try

    with ConnectionModule.ZAddPilotoImportado do
      begin
        Close;
        ParamByName('nombre_apellido').AsString:= pilotoImportadoVO.NombreApellido;
        ParamByName('numero').AsSmallInt:= pilotoImportadoVO.Numero;
        ParamByName('categoria').AsString:= pilotoImportadoVO.Categoria;
        ParamByName('tiempo_inicial').AsDateTime:= pilotoImportadoVO.TiempoInicial;
        ExecSQL;
      end;

    with ConnectionModule.ZSelLastInsOID do
      begin
        Close;
        Open;

        lastInsertedOID:= FieldByName('OID').AsInteger;
      end;

    ConnectionModule.ZConnection.Commit;
  except
    ConnectionModule.ZConnection.Rollback;
  end;
end;

function TBussinessDataSubsystemFacade.getPilotoImportado(OID: Integer): TPilotoImportado;
var
  pilotoImportadoVO : TPilotoImportado;
begin
  with ConnectionModule.ZGetPilotoImportado do
    begin
        Close;
        ParamByName('OID').AsInteger:= OID;
        Open;

        if (RecordCount > 0) then
        begin
          pilotoImportadoVO:= TPilotoImportado.Create;
          pilotoImportadoVO.NombreApellido:= FieldByName('nombre_apellido').AsString;
          pilotoImportadoVO.Categoria:= FieldByName('categoria').AsString;
          pilotoImportadoVO.Numero:= FieldByName('numero').AsInteger;
          pilotoImportadoVO.TiempoInicial:= FieldByName('tiempo_inicial').AsDateTime;
        end;
    end;

   Result:= pilotoImportadoVO;
end;

procedure TBussinessDataSubsystemFacade.modifyPilotoImportado(pilotoImportadoVO: TPilotoImportado);
  begin
    ConnectionModule.ZConnection.StartTransaction;
    try

      with ConnectionModule.ZModifyPilotoImportado do
        begin
          Close;
          ParamByName('nombre_apellido').AsString:= pilotoImportadoVO.NombreApellido;
          ParamByName('numero').AsSmallInt:= pilotoImportadoVO.Numero;
          ParamByName('categoria').AsString:= pilotoImportadoVO.Categoria;
          ExecSQL;
        end;

      ConnectionModule.ZConnection.Commit;
    except
      ConnectionModule.ZConnection.Rollback;
    end;
  end;

procedure TBussinessDataSubsystemFacade.deleteTodosPilotosImportados();
begin
  with ConnectionModule.ZDeletePilotosImportados do
    begin
      Close;
      ExecSQL;
    end;
end;

procedure TBussinessDataSubsystemFacade.deleteTomasImportadas(tomaTiempoOID: Integer);
begin
  with ConnectionModule.ZDeleteTomaTiempoImportada do
    begin
      Close;
      ParamByName('toma_tiempo_evento_oid').AsInteger:= tomaTiempoOID;
      ExecSQL;
    end;
end;

function TBussinessDataSubsystemFacade.getLapTimeAbast(PilotoImportadoOID, EventoOID, nroVuelta: Integer): String;
var
  tiempo : String;
begin
  with ConnectionModule.ZGetLapTimeAbast do
    begin
      Close;
      ParamByName('toma_tiempo_abast').AsInteger:= EventoOID;
      ParamByName('piloto_oid').AsInteger:= PilotoImportadoOID;
      ParamByName('nro_vuelta').AsInteger:= nroVuelta;
      Open;

      tiempo:= FieldByName('tiempo').AsString;
    end;

    Result:= tiempo
end;


procedure TBussinessDataSubsystemFacade.reconectZConnection();
begin
  ConnectionModule.ZConnection.Reconnect;
  ConnectionModule.ZConnectionQueries.Reconnect;
  ConnectionModule.ZConnectionUpdate.Reconnect;
  ConnectionModule.ZConnectionAntena.Reconnect;
end;

end.
