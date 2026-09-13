unit DataModule;

interface

uses
  System.SysUtils, System.Classes, ZAbstractConnection, ZConnection,
  ConfigureFilesUtilities, F_EEMessage, Data.DB, ZAbstractRODataset, ZDataset,
  ZAbstractDataset, ZSqlMonitor;

type
  TConnectionModule = class(TDataModule)
    ZConnection: TZConnection;
    ZLoginQuery: TZReadOnlyQuery;
    ZUniqueValidation: TZReadOnlyQuery;
    ZAddUsuario: TZQuery;
    ZSelLastInsOID: TZReadOnlyQuery;
    ZModifyUsuario: TZQuery;
    ZGetUsuario: TZReadOnlyQuery;
    ZDeleteUsuario: TZQuery;
    ZAddCuentaUsuario: TZQuery;
    ZModifyCuentaUsuario: TZQuery;
    ZDeletePiloto: TZQuery;
    ZAddPiloto: TZQuery;
    ZModifyPiloto: TZQuery;
    ZGetPiloto: TZReadOnlyQuery;
    ZAddEvento: TZQuery;
    ZModifyEvento: TZQuery;
    ZGetEvento: TZReadOnlyQuery;
    ZDeleteEvento: TZQuery;
    ZGetInscripcion: TZReadOnlyQuery;
    ZDeleteInscripcion: TZQuery;
    ZAddInscripcion: TZQuery;
    ZGetPiolotoByTag: TZReadOnlyQuery;
    ZDeletePuntuacion: TZQuery;
    ZAddPuntuacion: TZQuery;
    ZAddCategoria: TZQuery;
    ZModifyCategoria: TZQuery;
    ZGetCategoria: TZReadOnlyQuery;
    ZDeleteCategoria: TZQuery;
    ZAddNumeracion: TZQuery;
    ZModifyNumeracion: TZQuery;
    ZAddHandicup: TZQuery;
    ZModifyHandicup: TZQuery;
    ZDeleteHandicup: TZQuery;
    ZGetHandicup: TZReadOnlyQuery;
    ZAddMoto: TZQuery;
    ZModifyMoto: TZQuery;
    ZGetMoto: TZReadOnlyQuery;
    ZDeleteMoto: TZQuery;
    ZAddParadaPiloto: TZQuery;
    ZGetPilotoByNumMoto: TZReadOnlyQuery;
    ZGetInscripcionByPilotoAndEvento: TZReadOnlyQuery;
    ZGetParadaPiloto: TZReadOnlyQuery;
    ZDeleteParadaPilotoEvento: TZQuery;
    ZAddCampeonato: TZQuery;
    ZModifyCampeonato: TZQuery;
    ZGetCampeonato: TZReadOnlyQuery;
    ZDeleteCampeonato: TZQuery;
    ZAddTomaTiempo: TZQuery;
    ZUpdateTomaTiempo: TZQuery;
    ZAddTomaTiempoEvento: TZQuery;
    ZUpdateEstadoTomaTiempo: TZQuery;
    ZDeleteNumCategoria: TZQuery;
    GetNroVuelta: TZReadOnlyQuery;
    ZGetVueltasPorCategoria: TZReadOnlyQuery;
    ZDeleteVueltasPorCategoria: TZQuery;
    ZAddVueltasPorCategoria: TZQuery;
    ZAddTomaTiempoWithTiempo: TZQuery;
    GetNroCuenta2: TZReadOnlyQuery;
    ZCategoriaOIDByTipoCatAndEvento: TZReadOnlyQuery;
    ZAddRecargoTomaTiempoEvento: TZQuery;
    ZDeleteRecargoTomaTiempoEvento: TZQuery;
    ZUpdateNroVueltaAddPasada: TZQuery;
    ZGetTomaTiempo: TZReadOnlyQuery;
    ZUpdateNroVueltaDisalbePasada: TZQuery;
    ZUpdateNroVueltaEnablePasada: TZQuery;
    ZAddLecturaTagsAntena: TZQuery;
    ZGetPilotoByTagID: TZReadOnlyQuery;
    ZGetTomaTiempoEvento: TZReadOnlyQuery;
    ZAddTomaTiempoWithTagID: TZQuery;
    ZROQNroVueltaByCategoria: TZReadOnlyQuery;
    ZGetTipoCategoriaByEventoAndLargada: TZReadOnlyQuery;
    ZGetTomaTiempoByPilotoNroVuelta: TZReadOnlyQuery;
    GetNroVueltaReconocimiento: TZReadOnlyQuery;
    ZAddReconocimientoWithTagID: TZQuery;
    ZConnectionQueries: TZConnection;
    ZAddReconocimientoWithTiempo: TZQuery;
    ZUpdateEstadoReconocimiento: TZQuery;
    ZGetReconocimiento: TZReadOnlyQuery;
    ZUpdateNroVueltaEnablePasadaRec: TZQuery;
    ZUpdateNroVueltaDisalbePasadaRec: TZQuery;
    ZGetReconocimientoByPilotoNroVuelta: TZReadOnlyQuery;
    ZDeleteTomaTiempoEvento: TZQuery;
    ZUpdateTomaTiempoEvento: TZQuery;
    ZUpdateTagTextTTEvento: TZQuery;
    ZGetTipoCategoriaByEventoAndOrdenLargada: TZReadOnlyQuery;
    GetEventoByDate: TZReadOnlyQuery;
    ZAddContacto: TZQuery;
    ZModifyContacto: TZQuery;
    ZGetContacto: TZReadOnlyQuery;
    ZDeleteContacto: TZQuery;
    zGetProvinciaByName: TZReadOnlyQuery;
    ZGetLocalidadByProvinciaAndName: TZReadOnlyQuery;
    ZCategoriaByName: TZReadOnlyQuery;
    ZGetPdCByEvento: TZReadOnlyQuery;
    ZGetPuntosByPosicion: TZReadOnlyQuery;
    ZGetNroCuentaNow: TZReadOnlyQuery;
    GetNroCuenta: TZReadOnlyQuery;
    ZGetNroCuentaReconoNow: TZReadOnlyQuery;
    ZAddReconocimiento: TZQuery;
    ZGetTipoCategoriaByEventoReconocimiento: TZReadOnlyQuery;
    ZGetCantPilotosByNumMoto: TZReadOnlyQuery;
    ZGetVueltasReconoByTime: TZReadOnlyQuery;
    ZUpdateNroVueltaAddPasadaRecono: TZQuery;
    ZGetLocalidadProinciaByLocalidadOID: TZReadOnlyQuery;
    ZAddNavegante: TZQuery;
    ZModifyNavegante: TZQuery;
    ZGetNavegante: TZReadOnlyQuery;
    ZGetNaveganteByPiloto: TZReadOnlyQuery;
    ZAddPilotoImportado: TZQuery;
    ZModifyPilotoImportado: TZQuery;
    ZDeletePilotosImportados: TZQuery;
    ZAddTTAE: TZQuery;
    ZGetPilotoImportadoByNumero: TZReadOnlyQuery;
    ZAddTomaTiempoAbastPiloto: TZQuery;
    ZGetPilotoImportado: TZReadOnlyQuery;
    ZGetNroVueltaAbastecimiento: TZReadOnlyQuery;
    ZDeleteTomaTiempoImportada: TZQuery;
    ZAddTomaTiempoAbastPilotoCT: TZQuery;
    ZGetLapTimeAbast: TZReadOnlyQuery;
    ZAddPuntos: TZQuery;
    ZModifyPuntos: TZQuery;
    ZGetPuntos: TZReadOnlyQuery;
    ZDeletePuntos: TZQuery;
    ZGetModeloMotoByName: TZReadOnlyQuery;
    ZGetPiolotoByDNI: TZReadOnlyQuery;
    ZSQLMonitor: TZSQLMonitor;
    ZConnectionUpdate: TZConnection;
    ZConnectionAntena: TZConnection;
    ZGetInscripcionEnCampeonato: TZReadOnlyQuery;
    ZSelLastInsAntenaOID: TZReadOnlyQuery;
    procedure DataModuleCreate(Sender: TObject);
  public
    procedure reloadConnectionParametersAndConnect;
  end;

var
  ConnectionModule: TConnectionModule;

implementation

uses
  Unit1;
{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TConnectionModule.reloadConnectionParametersAndConnect;
begin
    ZConnection.HostName:= ReadStringFromIniFile('Conexion','Host','');
    ZConnection.Port:= ReadIntegerFromIniFile('Conexion', 'Puerto', 0);
    ZConnection.Database:= ReadStringFromIniFile('Conexion', 'Database', 'enduro');
    ZConnection.LibraryLocation:= ExtractRutaLibrary;

    ZConnectionQueries.HostName:= ReadStringFromIniFile('Conexion','Host','');
    ZConnectionQueries.Port:= ReadIntegerFromIniFile('Conexion', 'Puerto', 0);
    ZConnectionQueries.Database:= ReadStringFromIniFile('Conexion', 'Database', 'enduro');
    ZConnectionQueries.LibraryLocation:= ExtractRutaLibrary;

    ZConnectionUpdate.HostName:= ReadStringFromIniFile('Conexion','Host','');
    ZConnectionUpdate.Port:= ReadIntegerFromIniFile('Conexion', 'Puerto', 0);
    ZConnectionUpdate.Database:= ReadStringFromIniFile('Conexion', 'Database', 'enduro');
    ZConnectionUpdate.LibraryLocation:= ExtractRutaLibrary;

    ZConnectionAntena.HostName:= ReadStringFromIniFile('Conexion','Host','');
    ZConnectionAntena.Port:= ReadIntegerFromIniFile('Conexion', 'Puerto', 0);
    ZConnectionAntena.Database:= ReadStringFromIniFile('Conexion', 'Database', 'enduro');
    ZConnectionAntena.LibraryLocation:= ExtractRutaLibrary;

    try
      ZConnection.Connect;
      ZConnectionQueries.Connect;
      ZConnectionUpdate.Connect;
      ZConnectionAntena.Connect;
      //Principal.setButtonPanelEnable(True);
    except on E: Exception do
      begin
        TF_EE_Message.ShowMessage(TComponent(Principal),'Error de conexión a la Base de datos',
          'No se ha podido conectar con la Base de Datos ', TF_EE_Message.ERROR, True);

        //Principal.setButtonPanelEnable(False);
      end;
    end;
end;

procedure TConnectionModule.DataModuleCreate(Sender: TObject);
begin
  reloadConnectionParametersAndConnect;
end;

end.
