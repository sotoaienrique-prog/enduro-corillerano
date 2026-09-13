unit Entidades;

interface

uses
  System.SysUtils, System.Generics.Collections, Classes,
  ValidationHelper, System.DateUtils;

type
  TPersistentObject = class(TObject)
  protected
    fOID: Integer;
  public
    property OID: Integer read fOID write fOID;

    function isValidObject: Boolean;
    function getValidationResult(): TStringList; Virtual; Abstract;
  end;

type
  TValueObject = class(TObject)
  protected
  public
 end;

type
  TCuentaUsuario = class(TPersistentObject)
  protected
    fUsername: String;
    fPassword: String;
  public
    property Username: String read fUsername write fUsername;
    property Password: String read fPassword write fPassword;

    function getValidationResult(): TStringList; Override;
  end;

type
  TUsuario = class(TPersistentObject)
  protected
    fNombre: String;
    fApellido: String;
    fNroDocumento: String;
    fPerfilOID: Integer;

    fCuentaUsuario: TCuentaUsuario;
  public
    property Nombre: String read fNombre write fNombre;
    property Apellido: String read fApellido write fApellido;
    property NroDocumento: String read fNroDocumento write fNroDocumento;
    property PerfilOID: Integer read fPerfilOID write fPerfilOID;

    property CuentaUsuario: TCuentaUsuario read fCuentaUsuario write fCuentaUsuario;

    function getValidationResult(): TStringList; Override;
  end;

type
  TNavegante = class(TPersistentObject)
  protected
    fNombre: String;
    fApellido: String;
    fMail: String;
    fTelefono: String;
    fTelefonoFijo: String;
    fPilotoOID: Integer;
  public
    property Nombre: String read fNombre write fNombre;
    property Apellido: String read fApellido write fApellido;
    property Telefono: String read fTelefono write fTelefono;
    property TelefonoFijo: String read fTelefonoFijo write fTelefonoFijo;
    property Mail: String read fMail write fMail;
    property PilotoOID: Integer read fPilotoOID write fPilotoOID;

    function getValidationResult(): TStringList; Override;
  end;

type
  TPilotoImportado = class(TPersistentObject)
  protected
    fNombreApellido: String;
    fCategoria: String;
    fNumero: SmallInt;
    fTiempoInicial: TDateTime;
  public
    property NombreApellido: String read fNombreApellido write fNombreApellido;
    property Categoria: String read fCategoria write fCategoria;
    property Numero: SmallInt read fNumero write fNumero;
    property TiempoInicial: TDateTime read fTiempoInicial write fTiempoInicial;

    function getValidationResult(): TStringList; Override;
  end;

type
  TPiloto = class(TUsuario)
  protected
    fFechaNacimiento: TDate;
    fDireccion: String;
    fTag: String;
    fProvinciaOID: Integer;
    fLocalidadOID: Integer;
    fTelefono: String;
    fTelefonoAcompaniante: String;
    fTelefonoFijo: String;
    fMail: String;
    fNumMoto: Integer;
    fMotoOID: Integer;
    fNumMotoCross: Integer;
    fMotoCrossOID: Integer;
    fNumCuatriciclos: Integer;
    fCuatriciclosOID: Integer;
    fNumExterno: Integer;
    fCatExternoOID: Integer;
    fCuit: String;
    fResponsabilidad: Boolean;
    fCategoriaOID: Integer;
    fNotas: WideString;
    fTagID: String;
    fRanking: SmallInt;
    fRankingExterno: SmallInt;
    fNavegante : TNavegante;

    fTipoMoto: String;
    fCategoria: String;
    fCategoriaCuatriciclo: String;
    fCategoriaMotocross: String;
    fLocalidad: String;
    fValidacionNumericaCategoria: Boolean;
    fValidacionNumericaEnCategoria: Boolean;

    fUtilizaHandicup: Boolean;
    fEsCampeon: Boolean;
  public
    property FechaNacimiento: TDate read fFechaNacimiento write fFechaNacimiento;
    property Direccion: String read fDireccion write fDireccion;
    property ProvinciaOID: Integer read fProvinciaOID write fProvinciaOID;
    property LocalidadOID: Integer read fLocalidadOID write fLocalidadOID;
    property Telefono: String read fTelefono write fTelefono;
    property TelefonoAcompaniante: String read fTelefonoAcompaniante write fTelefonoAcompaniante;
    property TelefonoFijo: String read fTelefonoFijo write fTelefonoFijo;
    property Mail: String read fMail write fMail;
    property NumMoto: Integer read fNumMoto write fNumMoto;
    property MotoOID: Integer read fMotoOID write fMotoOID;
    property NumMotoCross: Integer read fNumMotoCross write fNumMotoCross;
    property MotoCrossOID: Integer read fMotoCrossOID write fMotoCrossOID;
    property NumCuatriciclos: Integer read fNumCuatriciclos write fNumCuatriciclos;
    property CuatriciclosOID: Integer read fCuatriciclosOID write fCuatriciclosOID;
    property Tag: String read fTag write fTag;
    property Cuit: String read fCuit write fCuit;
    property Responsabilidad: Boolean read fResponsabilidad write fResponsabilidad;
    property CategoriaOID: Integer read fCategoriaOID write fCategoriaOID;
    property Notas: WideString read fNotas write fNotas;
    property TagID: String read fTagID write fTagID;
    property UtilizaHandicup: Boolean read fUtilizaHandicup write fUtilizaHandicup;
    property EsCampeon: Boolean read fEsCampeon write fEsCampeon;
    property Ranking: SmallInt read fRanking write fRanking;
    property RankingExterno: SmallInt read fRankingExterno write fRankingExterno;

    property TipoMoto: String read fTipoMoto write fTipoMoto;
    property Categoria: String read fCategoria write fCategoria;
    property CategoriaCuatriciclo: String read fCategoriaCuatriciclo write fCategoriaCuatriciclo;
    property CategoriaMotoCross: String read fCategoriaMotocross write fCategoriaMotocross;
    property Localidad: String read fLocalidad write fLocalidad;

    property NumExterno: Integer read fNumExterno write fNumExterno;
    property CatExternoOID: Integer read fCatExternoOID write fCatExternoOID;

    property ValidacionNumericaCategoria: Boolean read fValidacionNumericaCategoria write fValidacionNumericaCategoria;
    property ValidacionNumericaEnCategoria: Boolean read fValidacionNumericaEnCategoria write fValidacionNumericaEnCategoria;
    property Navegante: TNavegante read fNavegante write fNavegante;

    function getValidationResult(): TStringList; Override;
    function getNombreCompleto(): String;
    function getNumeroNombreCompleto(TipoCategoriaOID : Integer): String;
  end;

type
  TContacto = class(TUsuario)
  protected
    fDireccion: String;
    fProvinciaOID: Integer;
    fLocalidadOID: Integer;
    fTelefono: String;
    fTelefonoFijo: String;
    fMail: String;
    fNotas: WideString;
    fLocalidad: String;
  public
    property Direccion: String read fDireccion write fDireccion;
    property ProvinciaOID: Integer read fProvinciaOID write fProvinciaOID;
    property LocalidadOID: Integer read fLocalidadOID write fLocalidadOID;
    property Telefono: String read fTelefono write fTelefono;
    property TelefonoFijo: String read fTelefonoFijo write fTelefonoFijo;
    property Mail: String read fMail write fMail;
    property Notas: WideString read fNotas write fNotas;
    property Localidad: String read fLocalidad write fLocalidad;

    function getValidationResult(): TStringList; Override;
    function getNombreCompleto(): String;
  end;

type
  TInscripcion = class(TPersistentObject)
  protected

    fEventoOID: Integer;
    fPilotoOID: Integer;

    // GUI
    fCampeonatoOID: Integer;
    fPilotoNroDocumento: String;
    fPilotoResponsabilidad: Boolean;
    fDiaInscripcionIndex: Integer;
    fTipoCategoriaOID: Integer;
    fPilotoTag: String;
  public
    property CampeonatoOID: Integer read fCampeonatoOID write fCampeonatoOID;
    property EventoOID: Integer read fEventoOID write fEventoOID;
    property PilotoOID: Integer read fPilotoOID write fPilotoOID;
    property PilotoNroDocumento: String read fPilotoNroDocumento write fPilotoNroDocumento;
    property PilotoResponsabilidad: Boolean read fPilotoResponsabilidad write fPilotoResponsabilidad;
    property PilotoTag: String read fPilotoTag write fPilotoTag;
    property DiaInscripcionIndex: Integer read fDiaInscripcionIndex write fDiaInscripcionIndex;
    property TipoCategoriaOID: Integer read fTipoCategoriaOID write fTipoCategoriaOID;

    function getValidationResult(): TStringList; Override;
  end;

type
  TCategoria = class(TPersistentObject)
  protected

    fNombre: String;
    fTipoCategoriaOID: Integer;
    fValorSeguro: String;
    fValorSeguroTexto: String;
    fEdadMinima: Integer;
    fEdadMaxima: Integer;

    fNumeracionInicial: Integer;
    fNumeracionFinal: Integer;

    fHandicupEdad: Boolean;
    fHandicupMoto: Boolean;

    fValorOrganizador: Double;
    fValorCordillerano: Double;

    fUtilizaAcompaniante: Boolean;
  public
    property Nombre: String read fNombre write fNombre;
    property TipoCategoriaOID: Integer read fTipoCategoriaOID write fTipoCategoriaOID;
    property ValorSeguro: String read fValorSeguro write fValorSeguro;
    property ValorSeguroTexto: String read fValorSeguroTexto write fValorSeguroTexto;
    property EdadMinima: Integer read fEdadMinima write fEdadMinima;
    property EdadMaxima: Integer read fEdadMaxima write fEdadMaxima;

    property NumeracionInicial: Integer read fNumeracionInicial write fNumeracionInicial;
    property NumeracionFinal: Integer read fNumeracionFinal write fNumeracionFinal;

    property ValorOrganizador: Double read fValorOrganizador write fValorOrganizador;
    property ValorCordillerano: Double read fValorCordillerano write fValorCordillerano;

    property HandicupEdad: Boolean read fHandicupEdad write fHandicupEdad;
    property HandicupMoto: Boolean read fHandicupMoto write fHandicupMoto;

    property UtilizaAcompaniante: Boolean read fUtilizaAcompaniante write fUtilizaAcompaniante;

    function getValidationResult(): TStringList; Override;
  end;

type
  TCampeonato = class(TPersistentObject)
  protected

    fNombre: String;
  public
    property Nombre: String read fNombre write fNombre;

    function getValidationResult(): TStringList; Override;
  end;

type
  TMoto = class(TPersistentObject)
  protected

    fNombre: String;
    fPuntosExtra: Integer;
  public
    property Nombre: String read fNombre write fNombre;
    property PuntosExtra: Integer read fPuntosExtra write fPuntosExtra;

    function getValidationResult(): TStringList; Override;
  end;

type
  THandicup = class(TPersistentObject)
  protected

    fTipoCategoria: Boolean;
    fTipoMoto: Boolean;

    fEdad: Integer;
    fSegundos: Integer;
    fCategoriaOID: Integer;
    fModeloMotoOID: Integer;

  public
    property TipoCategoria: Boolean read fTipoCategoria write fTipoCategoria;
    property TipoMoto: Boolean read fTipoMoto write fTipoMoto;

    property Edad: Integer read fEdad write fEdad;
    property Segundos: Integer read fSegundos write fSegundos;
    property CategoriaOID: Integer read fCategoriaOID write fCategoriaOID;
    property ModeloMotoOID: Integer read fModeloMotoOID write fModeloMotoOID;

    function getValidationResult(): TStringList; Override;
  end;

type
  TPuntos = class(TPersistentObject)
  protected

    fPosicion: Integer;
    fPuntos: Integer;
    fPuntosExtra: Integer;

  public
    property Posicion: Integer read fPosicion write fPosicion;
    property Puntos: Integer read fPuntos write fPuntos;
    property PuntosExtra: Integer read fPuntosExtra write fPuntosExtra;

    function getValidationResult(): TStringList; Override;
  end;

type
  TRecargoTomaTiempoEventoVO = class(TPersistentObject)
  protected

    fTomaTiempoEventoOID: Integer;
    fPilotoOID: Integer;
    fTipoCategoriaOID: Integer;
    fSegundosRecargo: SmallInt;
    fTipoRecargoOID: Integer;

  public
    property TomaTiempoEventoOID: Integer read fTomaTiempoEventoOID write fTomaTiempoEventoOID;
    property PilotoOID: Integer read fPilotoOID write fPilotoOID;
    property TipoCategoriaOID: Integer read fTipoCategoriaOID write fTipoCategoriaOID;
    property TipoRecargoOID: Integer read fTipoRecargoOID write fTipoRecargoOID;
    property SegundosRecargo: SmallInt read fSegundosRecargo write fSegundosRecargo;

    function getValidationResult(): TStringList; Override;
  end;

type
  TTomaTiempoEventoVO = class(TPersistentObject)
  protected
    fNombre: String;
    fEventoOID: Integer;
    fTomaTiempoStartTime: TDateTime;
    fTomaTiempoStopTime: TDateTime;
    fEstado: String;
    fTagText: WideString;
  public
    property Nombre: String read fNombre write fNombre;
    property EventoOID: Integer read fEventoOID write fEventoOID;
    property TomaTiempoStartTime: TDateTime read fTomaTiempoStartTime write fTomaTiempoStartTime;
    property TomaTiempoStopTime: TDateTime read fTomaTiempoStopTime write fTomaTiempoStopTime;
    property Estado: String read fEstado write fEstado;
    property TagText: WideString read fTagText write fTagText;
  end;

type
  TTomaTiempoVO = class(TPersistentObject)
  protected
    fPilotoOID: Integer;
    fTiempoPasada: TDateTime;
    fIsDeleted: Boolean;
    fTomaTiempoEventoOID: Integer;
    fNroVuelta: SmallInt;
    fLecturaTagAntenaOID: Integer;
    fEventoOID: Integer;
  public
    property PilotoOID: Integer read fPilotoOID write fPilotoOID;
    property TiempoPasada: TDateTime read fTiempoPasada write fTiempoPasada;
    property IsDeleted: Boolean read fIsDeleted write fIsDeleted;
    property TomaTiempoEventoOID: Integer read fTomaTiempoEventoOID write fTomaTiempoEventoOID;
    property NroVuelta: SmallInt read fNroVuelta write fNroVuelta;
    property LecturaTagAntenaOID: Integer read fLecturaTagAntenaOID write fLecturaTagAntenaOID;
    property EventoOID: Integer read fEventoOID write fEventoOID;
  end;

type
  TCategoriaFilter = class(TValueObject)
  protected
    fNombre: String;
    fTipoCategoriaOID: Integer;
  public
    property Nombre: String read fNombre write fNombre;
    property TipoCategoriaOID: Integer read fTipoCategoriaOID write fTipoCategoriaOID;
  end;

type
  TMotoFilter = class(TValueObject)
  protected
    fNombre: String;
  public
    property Nombre: String read fNombre write fNombre;
  end;

type
  TCampeonatoFilter = class(TValueObject)
  protected
    fNombre: String;
  public
    property Nombre: String read fNombre write fNombre;
  end;

type
  TInscripcionFilter = class(TValueObject)
  protected
    fEventoOID: Integer;
    fPilotoOID: Integer;
    fCategoriaOID: Integer;
  public
    property EventoOID: Integer read fEventoOID write fEventoOID;
    property PilotoOID: Integer read fPilotoOID write fPilotoOID;
    property CategoriaOID: Integer read fCategoriaOID write fCategoriaOID;
  end;

type
  TPuntuacionFilter = class(TValueObject)
  protected
    fEventoOID: Integer;
    fCampeonatoOID: Integer;
  public
    property EventoOID: Integer read fEventoOID write fEventoOID;
    property CampeonatoOID: Integer read fCampeonatoOID write fCampeonatoOID;
  end;

type
  TUsuarioFilter = class(TValueObject)
  protected
    fNombre: String;
    fApellido: String;
    fCuenta: String;
  public
    property Nombre: String read fNombre write fNombre;
    property Apellido: String read fApellido write fApellido;
    property Cuenta: String read fCuenta write fCuenta;
  end;

type
  TPilotoFilter = class(TUsuarioFilter)
  protected
    fNroDocumento: String;
    fNumMoto: Integer;
    fCategoriaOID: Integer;
    fTID: String;
  public
    property NroDocumento: String read fNroDocumento write fNroDocumento;
    property NumMoto: Integer read fNumMoto write fNumMoto;
    property CategoriaOID: Integer read fCategoriaOID write fCategoriaOID;
    property TID: String read fTID write fTID;
  end;

type
  TEventoCategoriaNumeracion = class(TPersistentObject)
  protected
    fCategoriaOID: Integer;
    fNroVuelta: Integer;
    fCategoria: String;
  public
    property CategoriaOID: Integer read fCategoriaOID write fCategoriaOID;
    property NroVuelta: Integer read fNroVuelta write fNroVuelta;
    property Categoria: String read fCategoria write fCategoria;

    function getValidationResult(): TStringList; Override;
  end;

type
  TEventoPuntoControl = class(TPersistentObject)
  protected
    fNombre: String;
    fNumeroPuntoControl: SmallInt;
  public
    property Nombre: String read fNombre write fNombre;
    property NumeroPuntoControl: SmallInt read fNumeroPuntoControl write fNumeroPuntoControl;

    function getValidationResult(): TStringList; Override;
  end;

type
  TTomaTiempoAbastecimientoEvento = class(TPersistentObject)
  protected
    fNombre: String;
    fSegundos: Smallint;
    fFecha: TDate;
  public
    property Nombre: String read fNombre write fNombre;
    property Segundos: Smallint read fSegundos write fSegundos;
    property Fecha: TDate read fFecha write fFecha;
  end;

type
  TEvento = class(TPersistentObject)
  protected
    fNombre: String;
    fLocalidadOID: Integer;
    fProvinciaOID: Integer;
    fFecha: TDate;
    fNroFecha: ShortInt;
    fDistancia: Integer;
    fCampeonatoOID: Integer;
    fTipoCompetenciaOID: Integer;
    fNroVueltas: SmallInt;
    fUltimaFecha: Boolean;
    fUsaPuntosExtra: Boolean;
    fUsaHandicup: Boolean;
    fVueltasCategoria : TList<TEventoCategoriaNumeracion>;
    fPuntoDeControl : TList<TEventoPuntoControl>;
  public
    property Nombre: String read fNombre write fNombre;
    property LocalidadOID: Integer read fLocalidadOID write fLocalidadOID;
    property ProvinciaOID: Integer read fProvinciaOID write fProvinciaOID;
    property Fecha: TDate read fFecha write fFecha;
    property NroFecha: ShortInt read fNroFecha write fNroFecha;
    property Distancia: Integer read fDistancia write fDistancia;
    property CampeonatoOID: Integer read fCampeonatoOID write fCampeonatoOID;
    property TipoCompetenciaOID: Integer read fTipoCompetenciaOID write fTipoCompetenciaOID;
    property NroVueltas: SmallInt read fNroVueltas write fNroVueltas;
    property UltimaFecha: Boolean read fUltimaFecha write fUltimaFecha;
    property UsaPuntosExtra: Boolean read fUsaPuntosExtra write fUsaPuntosExtra;
    property UsaHandicup: Boolean read fUsaHandicup write fUsaHandicup;
    property VueltasCategoria: TList<TEventoCategoriaNumeracion> read fVueltasCategoria write fVueltasCategoria;
    property PuntoDeControl: TList<TEventoPuntoControl> read fPuntoDeControl write fPuntoDeControl;

    function getValidationResult(): TStringList; Override;
  end;

type
  TEventoFilter = class(TValueObject)
  protected
    fNombre: String;
  public
    property Nombre: String read fNombre write fNombre;
  end;

type
  TLecturaTagsAntena = class(TPersistentObject)
  protected
    fTagID: String;
    fTimestampux: Int64;
  public
    property TagID: String read fTagID write fTagID;
    property Timestampux : Int64 read fTimestampux write fTimestampux;

    function getValidationResult(): TStringList; Override;
    function getTimestampAsDate: TDateTime;
    function getTimestampAsString: String;
  end;

implementation

  function  TEventoPuntoControl.getValidationResult(): TStringList;
  var
    stringList : TStringList;
  begin

    Result:= stringList;
  end;

  function TUsuario.getValidationResult(): TStringList;
  var
    stringList : TStringList;
  begin
    stringList := TStringList.Create;

    if TValidationHelper.isStringEmpty(self.Nombre) then
      stringList.Add('Nombre - Complete el campo obligatorio.');

    if TValidationHelper.isStringEmpty(self.Apellido) then
      stringList.Add('Apellido - Complete el campo obligatorio.');

    Result:= stringList;
  end;

  function TPilotoImportado.getValidationResult(): TStringList;
  var
    stringList : TStringList;
  begin
    stringList := TStringList.Create;

    if TValidationHelper.isStringEmpty(self.NombreApellido) then
      stringList.Add('Nombre y Apellido - Complete el campo obligatorio.');

    if TValidationHelper.isStringEmpty(self.fCategoria) then
      stringList.Add('Categoria - Complete el campo obligatorio.');

    if TValidationHelper.isIntegerNull(self.fNumero) then
      stringList.Add('Numero - Complete el campo obligatorio.');

    Result:= stringList;
  end;

  function TCategoria.getValidationResult(): TStringList;
  var
    stringList : TStringList;
  begin
    stringList := TStringList.Create;

    if TValidationHelper.isStringEmpty(self.Nombre) then
      stringList.Add('Nombre - Complete el campo obligatorio.');

    if TValidationHelper.isIntegerNull(self.fTipoCategoriaOID) then
      stringList.Add('Tipo Categoría - Complete el campo obligatorio.');

    if TValidationHelper.isIntegerNull(self.fNumeracionInicial) then
      stringList.Add('Inicial - Complete el campo obligatorio.');

    if TValidationHelper.isIntegerNull(self.fNumeracionFinal) then
      stringList.Add('Final - Complete el campo obligatorio.');

    if TValidationHelper.isIntegerNull(self.EdadMinima) then
      stringList.Add('Edad Mínima - Complete el campo obligatorio.');

    if TValidationHelper.isIntegerNull(self.EdadMaxima) then
      stringList.Add('Edad Máxima - Complete el campo obligatorio.');

    if self.fNumeracionInicial > self.fNumeracionFinal  then
      stringList.Add('Inicial-Final - El valor Inicial debe ser menor que el final.');

    if self.EdadMinima > self.EdadMaxima  then
      stringList.Add('Edades - El valor Mínimo debe ser menor que el Máximo.');

    //  La validacion de numeracion no aplica a la categoria Motocross
    if(self.fTipoCategoriaOID < 3) then
      begin
        if TValidationHelper.validateNumerationRange(self.OID, self.fNumeracionInicial, self.fTipoCategoriaOID) then
        stringList.Add('Inicial - El valor se encuentra solapado con otra numeración.');

        if TValidationHelper.validateNumerationRange(self.OID, self.fNumeracionFinal, self.fTipoCategoriaOID) then
        stringList.Add('Final - El valor se encuentra solapado con otra numeración.');
      end;

    Result:= stringList;
  end;

  function TMoto.getValidationResult(): TStringList;
  var
    stringList : TStringList;
  begin
    stringList := TStringList.Create;

    if TValidationHelper.isStringEmpty(self.Nombre) then
      stringList.Add('Nombre - Complete el campo obligatorio.');

    Result:= stringList;
  end;

  function TCampeonato.getValidationResult(): TStringList;
  var
    stringList : TStringList;
  begin
    stringList := TStringList.Create;

    if TValidationHelper.isStringEmpty(self.Nombre) then
      stringList.Add('Nombre - Complete el campo obligatorio.');

    Result:= stringList;
  end;

  function TPiloto.getValidationResult(): TStringList;
  var
    stringList : TStringList;
  begin
    stringList := TStringList.Create;

    if TValidationHelper.isStringEmpty(self.Nombre) then
      stringList.Add('Nombre - Complete el campo obligatorio.');

    if TValidationHelper.isStringEmpty(self.Apellido) then
      stringList.Add('Apellido - Complete el campo obligatorio.');

    if TValidationHelper.isDateAfter(self.fFechaNacimiento) then
      stringList.Add('Fecha Nacimiento - Complete el campo obligatorio.');

    if (self.ValidacionNumericaCategoria) then
      begin
        if TValidationHelper.isStringEmpty(self.Direccion) then
          stringList.Add('Direccion - Complete el campo obligatorio.');

        if TValidationHelper.isIntegerNull(self.LocalidadOID) then
          stringList.Add('Localidad - Complete el campo obligatorio.');

        if (TValidationHelper.isIntegerNull(self.NumMoto) and
              TValidationHelper.isIntegerNull(self.NumMotoCross) and
                TValidationHelper.isIntegerNull(self.NumCuatriciclos) and
                  TValidationHelper.isIntegerNull(self.NumExterno)) then
        begin
          stringList.Add('Nº Moto - Debe completar alguno de los números.');
        end;

        if TValidationHelper.isIntegerNull(self.MotoOID) then
          stringList.Add('Tipo Moto - Complete el campo obligatorio.');
      end;

      if (TValidationHelper.validateCategoriaNavegante(self.CategoriaOID) and
          (TValidationHelper.IsEmptyOrNull(self.Navegante))) then
        begin
          stringList.Add('Navegante - Complete el campo obligatorio.');
        end;

    if (self.ValidacionNumericaEnCategoria) then
      begin
          if (not TValidationHelper.isIntegerNull(self.NumMoto)) then
          begin
            if TValidationHelper.validateUniqueNumMotoInCategoria(self.NumMoto, self.CategoriaOID, self.OID) then
              stringList.Add('Nº Moto Enduro - Ya se encuentra asignado el número de moto a la Categoría seleccionada.');

            if not TValidationHelper.validateNumMoto(self.NumMoto, self.CategoriaOID) then
              stringList.Add('Nº Moto - El número de moto no pertenece a la numeración de la Categoría.');
          end;

          if (not TValidationHelper.isIntegerNull(self.NumMotoCross)) then
          begin
            if TValidationHelper.validateUniqueNumMotoInCategoriaMotocross(self.NumMotoCross, self.MotoCrossOID, self.OID) then
              stringList.Add('Nº Moto Motocross - Ya se encuentra asignado el número de moto a la Categoría seleccionada.');
          end;

          if (not TValidationHelper.isIntegerNull(self.NumCuatriciclos)) then
          begin
            if TValidationHelper.validateUniqueNumMotoInCategoriaCuatriciclos(self.NumCuatriciclos, self.CuatriciclosOID, self.OID) then
              stringList.Add('Nº Moto Cuatriciclos - Ya se encuentra asignado el número de moto a la Categoría seleccionada.');
          end;

        if (TValidationHelper.isStringEmpty(self.TagID)) then
            stringList.Add('TagID - Complete el campo obligatorio.')
        else if (TValidationHelper.validateUnique('piloto', 'tid', self.TagID, self.OID)) then
            stringList.Add('TagID - Ya se encuentra asignado el número de Tag.');

        if (TValidationHelper.validateUnique('piloto', 'nro_docu', self.fNroDocumento, self.OID)) then
            stringList.Add('NroDocumento - Ya se encuentra asignado el número de documento.');
      end;
//    if (self.EsCampeon = True) then
//    begin
//      if (not TValidationHelper.isIntegerNull(self.NumMoto)) then
//      begin
//        if TValidationHelper.validateUniqueCampeonInCategoria(self.CategoriaOID, self.OID) then
//          stringList.Add('Nº Moto Enduro - Ya se encuentra asignado un campeón en la Categoría Enduro seleccionada.');
//      end;

//      if (not TValidationHelper.isIntegerNull(self.NumMotoCross)) then
//      begin
//        if TValidationHelper.validateUniqueCampeonInCategoriaMotocross(self.MotoCrossOID, self.OID) then
//          stringList.Add('Nº Moto Motocross - Ya se encuentra asignado un campeón en la Categoría Motocross seleccionada.');
//      end;

//      if (not TValidationHelper.isIntegerNull(self.NumCuatriciclos)) then
//      begin
//        if TValidationHelper.validateUniqueCampeonInCategoriaCuatriciclos(self.CuatriciclosOID, self.OID) then
//          stringList.Add('Nº Moto Cuatriciclos - Ya se encuentra asignado un campeón en la Categoría Cuatriciclo seleccionada.');
//      end;

//    end;

    Result:= stringList;
  end;

   function TPiloto.getNombreCompleto(): String;
   begin
     Result:= self.Apellido + ', ' + self.Nombre;
   end;

   function TPiloto.getNumeroNombreCompleto(TipoCategoriaOID : Integer): String;
   var
    numeroMoto : Integer;
   begin
      if (TipoCategoriaOID = 1) then
        numeroMoto:= self.NumMoto;
      if (TipoCategoriaOID = 2) then
        numeroMoto:= self.NumCuatriciclos;
      if (TipoCategoriaOID = 3) then
        numeroMoto:= self.NumMotoCross;

     Result:= IntToStr(numeroMoto) + ' - ' + self.Apellido + ', ' + self.Nombre;
   end;

  function TCuentaUsuario.getValidationResult(): TStringList;
  var
    stringList : TStringList;
  begin
    stringList := TStringList.Create;

    if TValidationHelper.isStringEmpty(self.Username) then
      stringList.Add('Username - Complete el campo obligatorio.');

    if TValidationHelper.isStringEmpty(self.Password) then
      stringList.Add('Password - Complete el campo obligatorio.');

    Result:= stringList;
  end;

  function TInscripcion.getValidationResult(): TStringList;
  var
    stringList : TStringList;
  begin
    stringList := TStringList.Create;

    if TValidationHelper.isIntegerNull(self.EventoOID) then
      stringList.Add('Evento - Complete el campo obligatorio.');

    if TValidationHelper.isIntegerNull(self.PilotoOID) then
      stringList.Add('Piloto - Complete el campo obligatorio.');

    if TValidationHelper.isIntegerNull(self.TipoCategoriaOID) then
      stringList.Add('Tipo Categoría - Complete el campo obligatorio.');

    if TValidationHelper.validateInscripcion(self.EventoOID, self.PilotoOID, self.TipoCategoriaOID) then
      stringList.Add('Piloto - El Piloto ya se encuentra inscripto en el evento.');

    if TValidationHelper.getNumMotoByTipoCategoria(self.PilotoOID, self.TipoCategoriaOID) then
      stringList.Add('Piloto - El Piloto no posee numeración para el Tipo de Categoría seleccionada.');

    if not self.fPilotoResponsabilidad then
      stringList.Add('Piloto - El Piloto no ha presentado conformidad al acuerdo de Responsabilidad Civil.');

    if TValidationHelper.isStringEmpty(self.PilotoTag) then
      stringList.Add('Piloto - El Piloto no posee TagID asociado.');

    if TValidationHelper.validateEdadCategoria(self.EventoOID, self.PilotoOID, self.TipoCategoriaOID) then
      stringList.Add('Piloto - El Piloto no posee la edad para inscribirse en la Categoría.');

    Result:= stringList;
  end;

  function TPersistentObject.isValidObject: Boolean;
  var
    validResult : TStringList;
    boolResult : Boolean;
  begin
    validResult:= self.getValidationResult();
    boolResult:= validResult.Count > 0;
    Result:= not boolResult;
  end;

  function TEvento.getValidationResult(): TStringList;
  var
    stringList : TStringList;
  begin
    stringList := TStringList.Create;

    if TValidationHelper.isStringEmpty(self.fNombre) then
      stringList.Add('Nombre - Complete el campo obligatorio.');

    if TValidationHelper.isIntegerNull(self.LocalidadOID) then
      stringList.Add('Localidad - Complete el campo obligatorio.');

    if TValidationHelper.isIntegerNull(self.CampeonatoOID) then
      stringList.Add('Campeonato - Complete el campo obligatorio.');

    if TValidationHelper.isIntegerNull(self.NroFecha) then
      stringList.Add('Nro. Fecha - Complete el campo obligatorio.');

    if TValidationHelper.isIntegerNull(self.NroVueltas) then
      stringList.Add('Nro. Vueltas - Complete el campo obligatorio.');

    Result:= stringList;
  end;

  function TEventoCategoriaNumeracion.getValidationResult(): TStringList;
  var
    stringList : TStringList;
  begin
    stringList := TStringList.Create;

      if TValidationHelper.isIntegerNull(self.NroVuelta) then
        stringList.Add('Nº de Vueltas - Complete el campo obligatorio.');

      if TValidationHelper.isIntegerNull(self.CategoriaOID) then
        stringList.Add('Categoría - Complete el campo obligatorio.');

    Result:= stringList;
  end;

  function THandicup.getValidationResult(): TStringList;
  var
    stringList : TStringList;
  begin
    stringList := TStringList.Create;

    if (self.TipoCategoria) then
    begin
      if TValidationHelper.isIntegerNull(self.Segundos) then
        stringList.Add('Seg. por año - Complete el campo obligatorio.');

      if TValidationHelper.isIntegerNull(self.Edad) then
        stringList.Add('Edad Base - Complete el campo obligatorio.');

      if TValidationHelper.isIntegerNull(self.CategoriaOID) then
        stringList.Add('Categoría - Complete el campo obligatorio.');
    end;

    if (self.TipoMoto) then
    begin
      if TValidationHelper.isIntegerNull(self.ModeloMotoOID) then
        stringList.Add('Tipo Moto - Complete el campo obligatorio.');

      if TValidationHelper.isIntegerNull(self.Segundos) then
        stringList.Add('Segundos - Complete el campo obligatorio.');
    end;

    Result:= stringList;
  end;

function TPuntos.getValidationResult(): TStringList;
  var
    stringList : TStringList;
  begin
    stringList := TStringList.Create;

    if TValidationHelper.isIntegerNull(self.Posicion) then
        stringList.Add('Posición - Complete el campo obligatorio.');

    if TValidationHelper.isIntegerNull(self.Puntos) then
        stringList.Add('Puntos - Complete el campo obligatorio.');

    if TValidationHelper.isIntegerNull(self.PuntosExtra) then
        stringList.Add('Puntos Extra - Complete el campo obligatorio.');

    Result:= stringList;
  end;

  function TRecargoTomaTiempoEventoVO.getValidationResult(): TStringList;
  var
    stringList : TStringList;
  begin
    stringList := TStringList.Create;

    if TValidationHelper.isIntegerNull(self.fTomaTiempoEventoOID) then
      stringList.Add('Toma Tiempo Evento - Complete el campo obligatorio.');

    if TValidationHelper.isIntegerNull(self.fPilotoOID) then
      stringList.Add('Piloto - Complete el campo obligatorio.');

    if TValidationHelper.isIntegerNull(self.fTipoRecargoOID) then
      stringList.Add('Tipo Recargo - Complete el campo obligatorio.');

    if (self.fTipoRecargoOID = 1) then
    begin
      if TValidationHelper.isIntegerNull(self.fSegundosRecargo) then
        stringList.Add('Segundos - Complete el campo obligatorio.');
    end;

    if TValidationHelper.isIntegerNull(self.fTipoCategoriaOID) then
      stringList.Add('Tipo Categoría - Complete el campo obligatorio.');

    Result:= stringList;
  end;

  function TLecturaTagsAntena.getValidationResult(): TStringList;
  var
    stringList : TStringList;
  begin
    stringList := TStringList.Create;

    if TValidationHelper.isStringEmpty(self.fTagID) then
      stringList.Add('TagID - Complete el campo obligatorio.');

    Result:= stringList;
  end;

  function TLecturaTagsAntena.getTimestampAsString: String;
  var
    prefixStr : String;
  begin
    prefixStr:= copy(IntToStr(self.fTimestampux), 1, 10);
    Result:= FormatDateTime('dd/mm/yy hh:mm:ss', UnixToDateTime(StrToInt(prefixStr)))
      +'.'+copy(IntToStr(self.fTimestampux), 11, 13);
  end;

  function TLecturaTagsAntena.getTimestampAsDate: TDateTime;
  var
    prefixStr : String;
  begin
    prefixStr:= copy(IntToStr(self.fTimestampux), 1, 10);
    Result:= UnixToDateTime(StrToInt(prefixStr));
  end;

  function TContacto.getValidationResult(): TStringList;
  var
    stringList : TStringList;
  begin
    stringList := TStringList.Create;

    if TValidationHelper.isStringEmpty(self.Nombre) then
      stringList.Add('Nombre - Complete el campo obligatorio.');

    if TValidationHelper.isStringEmpty(self.Apellido) then
      stringList.Add('Apellido - Complete el campo obligatorio.');

    if (not TValidationHelper.isStringEmpty(self.Mail)) then
      if not TValidationHelper.isValidEmail(self.Mail) then
        stringList.Add('Mail - Ingrese una dirección de Mail válida.');

    if TValidationHelper.isStringEmpty(self.Direccion) then
      stringList.Add('Direccion - Complete el campo obligatorio.');

    if TValidationHelper.isIntegerNull(self.LocalidadOID) then
      stringList.Add('Localidad - Complete el campo obligatorio.');

    Result:= stringList;
  end;

   function TContacto.getNombreCompleto(): String;
   begin
     Result:= self.Apellido + ', ' + self.Nombre;
   end;

  function TNavegante.getValidationResult(): TStringList;
  var
    stringList : TStringList;
  begin
    stringList := TStringList.Create;

    if TValidationHelper.isStringEmpty(self.Nombre) then
      stringList.Add('Nombre - Complete el campo obligatorio.');

    if TValidationHelper.isStringEmpty(self.Apellido) then
      stringList.Add('Apellido - Complete el campo obligatorio.');

    Result:= stringList;
  end;
end.
