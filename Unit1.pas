unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxPC, dxDockControl, dxDockPanel,
  AdvShapeButton, AdvGlowButton, AdvToolBar, AdvOfficeStatusBar, LoginForm,
  Entidades, AbstractCRUD, UserCRUDUnit, LoggedUserSingleton, PilotCRUDUnit,
  EventCRUDUnit, InscripcionCRUD, PuntuacionCRUDUnit, ConfigurationEditorFrame,
  CategoriaCrudUnit, HandicupCRUDUnit, MotoCRUDUnit, GrillaTiempoEspera,
  FormularioTiempoEspera, F_CustReport, QRPrntr, CampeonatoCRUDUnit,
  TomaTiemposUnit, Demopreview, GrillaTomaTiempo, TomaTiemposEditUnit,
  ReconocimientoUnit, GrillaReconocimiento, RecargoTomaTiempoEventoUnit,
  ContactoCRUDUnit, GrillaTomaTiempoMultiCat, ConsultaDatosPilotoUnit,
  GrillaReconocimientoMulti, AgrupacionReconocimiento,
  GrillaAgrupacionTomasMultiCat, scExcelExport, Vcl.OleServer, Excel2010,
  BussinessDataSubsystemFacade, F_EEMessage, GrillaAbastecimiento,
  AgregarTomaTiempoAbastecimiento, ImportarAbastecimientoEnTomaTiempo,
  GrillaAdministracionAbastecimiento, AgregarTomaTiempoAbastecimientoWithTime,
  GrillaTomaTiempoMultiCatEPU, PuntosCRUDUnit;

const
  CAMPEONATO_EDITOR = 'Administración de Campeonato';
  USER_EDITOR = 'Administración de Usuarios';
  PILOT_EDITOR = 'Administración de Pilotos';
  EVENT_EDITOR = 'Administración de Eventos';
  INSCRIPCION = 'Inscripcion a Evento';
  PUNTUACION = 'Inscripcion a Puntuación';
  PUNTOS = 'Administracion de Puntos';
  CONFIGURATION_EDITOR = 'Configuración';
  CATEGORIA_EDITOR = 'Administración de Categorías';
  HANDICUP_EDITOR = 'Administración de Handicup';
  MOTO_EDITOR = 'Administración de Motos';
type
  TPrincipal = class(TForm)
    AdvOfficeStatusBar: TAdvOfficeStatusBar;
    mainDockPanel: TdxDockPanel;
    mainDockSite: TdxDockSite;
    mainLayoutDockSite: TdxLayoutDockSite;
    dxTabContainerDockSite: TdxTabContainerDockSite;
    hideDockPanel: TdxDockPanel;
    AdvToolBarPager: TAdvToolBarPager;
    AdvPagePrincipal: TAdvPage;
    tbConnection: TAdvToolBar;
    btnConnect: TAdvGlowButton;
    btnDisconnect: TAdvGlowButton;
    tbUsers: TAdvToolBar;
    btnUser: TAdvGlowButton;
    AdvToolBarConfiguration: TAdvToolBar;
    btnConfiguration: TAdvGlowButton;
    AdvPageCompeticion: TAdvPage;
    tbEvento: TAdvToolBar;
    btnEvento: TAdvGlowButton;
    tbInscripcion: TAdvToolBar;
    btnInscripcion: TAdvGlowButton;
    tbPilotos: TAdvToolBar;
    btnPilotos: TAdvGlowButton;
    btnConsultaPiloto: TAdvGlowButton;
    tbHandicup: TAdvToolBar;
    btnHandicup: TAdvGlowButton;
    tbCampeonato: TAdvToolBar;
    btnCampeonato: TAdvGlowButton;
    tbCategoria: TAdvToolBar;
    btnCategoria: TAdvGlowButton;
    tbMotos: TAdvToolBar;
    btnMotos: TAdvGlowButton;
    tbContactoExtra: TAdvToolBar;
    btnContacto: TAdvGlowButton;
    tbPuntuacion: TAdvToolBar;
    btnPuntuacion: TAdvGlowButton;
    AdvPageEspera: TAdvPage;
    tbTiempoEspera: TAdvToolBar;
    btnAgregarPiloto: TAdvGlowButton;
    btnMostrarGrillaTiemposEspera: TAdvGlowButton;
    AdvPageTomaTiempos: TAdvPage;
    AdvTomaTiempos: TAdvToolBar;
    tbTomaTiempos: TAdvGlowButton;
    tbTomaTiempoEdit: TAdvGlowButton;
    tbReconocimiento: TAdvGlowButton;
    btnRecargoTomaTiempo: TAdvGlowButton;
    btnAdministracionAgrupacion: TAdvGlowButton;
    AdvPageConsulta: TAdvPage;
    tbGrillaConsultaReconocimiento: TAdvGlowButton;
    tbGrillaConsultaReconocimientoMulti: TAdvGlowButton;
    tbGrillaConsulta: TAdvGlowButton;
    tbGrillaConsultaMc: TAdvGlowButton;
    btnGrillaAgrupacion: TAdvGlowButton;
    tbAbastecimientoRally: TAdvToolBar;
    btnImporPilo: TAdvGlowButton;
    btnGrillaTiempoAbastecimiento: TAdvGlowButton;
    btnAgregarPilotoRally: TAdvGlowButton;
    AdvTbImportarAbastecimiento: TAdvToolBar;
    btnImportarAbastecimiento: TAdvGlowButton;
    AdvGlowButton1: TAdvGlowButton;
    btnAgregarPilotoRallyTime: TAdvGlowButton;
    tbGrillaConsultaMcEPU: TAdvGlowButton;
    btnPuntosGlow: TAdvGlowButton;
    procedure btnConnectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnUserClick(Sender: TObject);
    procedure dockPanelClose(Sender: TdxCustomDockControl);
    procedure btnDisconnectClick(Sender: TObject);
    procedure btnPilotosClick(Sender: TObject);
    procedure btnEventoClick(Sender: TObject);
    procedure btnInscripcionClick(Sender: TObject);
    procedure btnConfigurationClick(Sender: TObject);
    { Private declarations }
    procedure createAndShowLoginForm;
    procedure btnCategoriaClick(Sender: TObject);
    procedure btnHandicupClick(Sender: TObject);

    procedure btnMotosClick(Sender: TObject);
    procedure btnMostrarGrillaTiemposEsperaClick(Sender: TObject);
    procedure btnAgregarPilotoClick(Sender: TObject);
    procedure btnCampeonatoClick(Sender: TObject);
    procedure tbTomaTiemposClick(Sender: TObject);
    procedure tbGrillaConsultaClick(Sender: TObject);
    procedure tbTomaTiempoEditClick(Sender: TObject);
    procedure tbReconocimientoClick(Sender: TObject);
    procedure tbGrillaConsultaReconocimientoClick(Sender: TObject);
    procedure btnRecargoTomaTiempoClick(Sender: TObject);
    procedure btnContactoClick(Sender: TObject);
    procedure tbGrillaConsultaMcClick(Sender: TObject);
    procedure btnConsultaPilotoClick(Sender: TObject);
    procedure tbGrillaConsultaReconocimientoMultiClick(Sender: TObject);
    procedure btnAdministracionAgrupacionClick(Sender: TObject);
    procedure btnGrillaAgrupacionClick(Sender: TObject);
    procedure btnImporPiloClick(Sender: TObject);
    procedure btnGrillaTiempoAbastecimientoClick(Sender: TObject);
    procedure btnAgregarPilotoRallyClick(Sender: TObject);
    procedure btnImportarAbastecimientoClick(Sender: TObject);
    procedure AdvGlowButton1Click(Sender: TObject);
    procedure btnAgregarPilotoRallyTimeClick(Sender: TObject);
    procedure tbGrillaConsultaMcEPUClick(Sender: TObject);
    procedure btnPuntuacionClick(Sender: TObject);
    procedure btnPuntosGlowClick(Sender: TObject);  public
    procedure setButtonPanelEnable(Enabled : Boolean);
    procedure setLoggedUserToButtomPanel();
  end;

var
  Principal: TPrincipal;

  campeonatoDockPanel, userDockPanel, configurationDockPanel,
  pilotDockPanel, eventoDockPanel,
  inscripcionDockPanel, puntuacionDockPanel, puntosDockPanel,
  categoriaDockPanel, handicupDockPanel, motoDockPanel, contactoDockPanel: TdxDockPanel;

  campeonatoCRUD, userCRUD, pilotCRUD, eventoCRUD,
  inscripcionCRUD, puntuacionCRUD, puntosCRUD,
  categoriaCRUD, handicupCRUD, motoCRUD, contactoCRUD: TAbstractCRUDFrame;

  configurationFrame: TFrame;
implementation

{$R *.dfm}

procedure TPrincipal.btnDisconnectClick(Sender: TObject);
begin
  createAndShowLoginForm;
end;

procedure TPrincipal.btnEventoClick(Sender: TObject);
begin

  if (not Assigned(eventoDockPanel)) then
  begin
      eventoDockPanel:= TdxDockPanel.Create(self);
      eventoDockPanel.Caption:= EVENT_EDITOR;
      eventoDockPanel.DockTo(hideDockPanel, dtClient, -1);
      eventoDockPanel.OnClose:= dockPanelClose;
  end;

  if (Assigned(eventoCRUD)) then
    begin
      eventoDockPanel.Visible:= True;
      dxTabContainerDockSite.ActiveChild:= eventoDockPanel;
    end
  else
    begin
      eventoCRUD:= TEventCRUD.Create(nil);
      eventoCRUD.Align:= alClient;
      eventoCRUD.SetParentComponent(eventoDockPanel);
    end;
end;

procedure TPrincipal.btnGrillaAgrupacionClick(Sender: TObject);
begin
  with TGrillaAgrupacionMultiCatForm.Create(nil) do
    begin
      ShowModal;
      Free;
    end;
end;

procedure TPrincipal.btnGrillaTiempoAbastecimientoClick(Sender: TObject);
begin
  with TFGrillaAbastecimiento.Create(self) do
    begin
      ShowModal;
      Free;
    end;
end;

procedure TPrincipal.btnHandicupClick(Sender: TObject);
begin
  if (not Assigned(handicupDockPanel)) then
  begin
      handicupDockPanel:= TdxDockPanel.Create(self);
      handicupDockPanel.Caption:= INSCRIPCION;
      handicupDockPanel.DockTo(hideDockPanel, dtClient, -1);
      handicupDockPanel.OnClose:= dockPanelClose;
  end;

  if (Assigned(handicupCRUD)) then
    begin
      handicupDockPanel.Visible:= True;
      dxTabContainerDockSite.ActiveChild:= handicupDockPanel;
    end
  else
    begin
      handicupCRUD:= THandicupCRUD.Create(nil);
      handicupCRUD.Align:= alClient;
      handicupCRUD.SetParentComponent(handicupDockPanel);
    end;
end;

procedure TPrincipal.btnImporPiloClick(Sender: TObject);
var
  openDialog : TOpenDialog;
  Piloto : TPilotoImportado;

  i: Integer;
  si, horaPasada: String;
  Hoja: _WorkSheet;
  hora : TDateTime;
  tiempo : Double;
begin
{  // Create the open dialog object - assign to our open dialog variable
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
    si := IntToStr(i);

    TBussinessDataSubsystemFacade.getInstance.deleteTodosPilotosImportados();

    repeat
      Piloto:= TPilotoImportado.Create;

      Piloto.NombreApellido:= Trim(Hoja.Range['G'+si,'G'+si].Value2); //Nombre y Apellido
      Piloto.Categoria:= Trim(Hoja.Range['E'+si,'E'+si].Value2); // Categoria
      Piloto.Numero:= Hoja.Range['F'+si,'F'+si].Value2; // Numero

      tiempo:= Hoja.Range['L'+si,'L'+si].Value2; // Tiempo Pasado
      horaPasada := FormatDateTime('hh:nn:ss', tiempo);
      hora:= StrToDateTime(horaPasada);
      ReplaceDate(hora, Date);

      Piloto.TiempoInicial:= hora;

      if (Piloto.isValidObject) then
        TBussinessDataSubsystemFacade.getInstance.addPilotoImportado(Piloto)
      else
        TF_EE_Message.ShowMessage(TComponent(Self),'¡Piloto con datos insuficientes!',
            'Se debe completar los datos de la persona '+ Piloto.NombreApellido, TF_EE_Message.WARNING, False);
      Inc( i );
      si := IntToStr( i );
    until (VarType( Excel.Range['F'+si,'F'+si].Value2) = VarEmpty);

    TF_EE_Message.ShowMessage(TComponent(Self),'Operación Exitosa',
      'Se realizó exitosamente la importación de ' + IntToStr(i) + ' Pilotos.', TF_EE_Message.INFORMATION, False);
  }
  end;

procedure TPrincipal.btnImportarAbastecimientoClick(Sender: TObject);
begin
  with TImportarTomaTiempoAbastecimiento.Create(self) do
    begin
      ShowModal;
      Free;
    end;
end;

procedure TPrincipal.btnInscripcionClick(Sender: TObject);
begin
  if (not Assigned(inscripcionDockPanel)) then
  begin
      inscripcionDockPanel:= TdxDockPanel.Create(self);
      inscripcionDockPanel.Caption:= INSCRIPCION;
      inscripcionDockPanel.DockTo(hideDockPanel, dtClient, -1);
      inscripcionDockPanel.OnClose:= dockPanelClose;
  end;

  if (Assigned(inscripcionCRUD)) then
    begin
      inscripcionDockPanel.Visible:= True;
      dxTabContainerDockSite.ActiveChild:= inscripcionDockPanel;
    end
  else
    begin
      inscripcionCRUD:= TInscripcionesCRUD.Create(nil);
      inscripcionCRUD.Align:= alClient;
      inscripcionCRUD.SetParentComponent(inscripcionDockPanel);
    end;
end;

procedure TPrincipal.btnMostrarGrillaTiemposEsperaClick(Sender: TObject);
begin
  with TFGrillaTiempoEspera.Create(nil) do
    begin
      ShowModal;
      Free;
    end;
end;

procedure TPrincipal.btnMotosClick(Sender: TObject);
var
 crudFrame: TAbstractCRUDFrame;
 dockIndex: Integer;
begin
  if (not Assigned(motoDockPanel)) then
  begin
      motoDockPanel:= TdxDockPanel.Create(self);
      motoDockPanel.Caption:= MOTO_EDITOR;
      motoDockPanel.DockTo(hideDockPanel, dtClient, -1);
      motoDockPanel.OnClose:= dockPanelClose;
  end;

  if (Assigned(motoCRUD)) then
    begin
      motoDockPanel.Visible:= True;
      dxTabContainerDockSite.ActiveChild:= motoDockPanel;
    end
  else
    begin
      motoCRUD:= TMotoCRUD.Create(nil);
      motoCRUD.Align:= alClient;
      motoCRUD.SetParentComponent(motoDockPanel);
    end;
end;

procedure TPrincipal.btnPilotosClick(Sender: TObject);
begin
  if (not Assigned(pilotDockPanel)) then
  begin
      pilotDockPanel:= TdxDockPanel.Create(self);
      pilotDockPanel.Caption:= PILOT_EDITOR;
      pilotDockPanel.DockTo(hideDockPanel, dtClient, -1);
      pilotDockPanel.OnClose:= dockPanelClose;
  end;

  if (Assigned(pilotCRUD)) then
    begin
      pilotDockPanel.Visible:= True;
      dxTabContainerDockSite.ActiveChild:= pilotDockPanel;
    end
  else
    begin
      pilotCRUD:= TPilotCRUD.Create(nil);
      pilotCRUD.Align:= alClient;
      pilotCRUD.SetParentComponent(pilotDockPanel);
    end;
end;

procedure TPrincipal.btnPuntosGlowClick(Sender: TObject);
begin
  if (not Assigned(puntosDockPanel)) then
  begin
      puntosDockPanel:= TdxDockPanel.Create(self);
      puntosDockPanel.Caption:= PUNTOS;
      puntosDockPanel.DockTo(hideDockPanel, dtClient, -1);
      puntosDockPanel.OnClose:= dockPanelClose;
  end;

  if (Assigned(puntosCRUD)) then
    begin
      puntosDockPanel.Visible:= True;
      dxTabContainerDockSite.ActiveChild:= puntosDockPanel
    end
  else
    begin
      puntosCRUD:= TTPuntosCRUD.Create(nil);
      puntosCRUD.Align:= alClient;
      puntosCRUD.SetParentComponent(puntosDockPanel);
    end;
end;

procedure TPrincipal.btnPuntuacionClick(Sender: TObject);
begin
  if (not Assigned(puntuacionDockPanel)) then
  begin
      puntuacionDockPanel:= TdxDockPanel.Create(self);
      puntuacionDockPanel.Caption:= PUNTUACION;
      puntuacionDockPanel.DockTo(hideDockPanel, dtClient, -1);
      puntuacionDockPanel.OnClose:= dockPanelClose;
  end;

  if (Assigned(puntuacionCRUD)) then
    begin
      puntuacionDockPanel.Visible:= True;
      dxTabContainerDockSite.ActiveChild:= puntuacionDockPanel
    end
  else
    begin
      puntuacionCRUD:= TPuntuacionCRUD.Create(nil);
      puntuacionCRUD.Align:= alClient;
      puntuacionCRUD.SetParentComponent(puntuacionDockPanel);
    end;
end;

procedure TPrincipal.btnRecargoTomaTiempoClick(Sender: TObject);
var
 RecargoTomaTiempoEvento: TRecargoTomaTiempoEvento;
begin
  RecargoTomaTiempoEvento:= TRecargoTomaTiempoEvento.Create(nil);
  RecargoTomaTiempoEvento.ShowModal;
  RecargoTomaTiempoEvento.Free;
end;

procedure TPrincipal.btnUserClick(Sender: TObject);
begin
  if (not Assigned(userDockPanel)) then
  begin
      userDockPanel:= TdxDockPanel.Create(self);
      userDockPanel.Caption:= USER_EDITOR;
      userDockPanel.DockTo(hideDockPanel, dtClient, -1);
      userDockPanel.OnClose:= dockPanelClose;
  end;

  if (Assigned(userCRUD)) then
    begin
      userDockPanel.Visible:= True;
      dxTabContainerDockSite.ActiveChild:= userDockPanel;
    end
  else
    begin
      userCRUD:= TUserCRUD.Create(nil);
      userCRUD.Align:= alClient;
      userCRUD.SetParentComponent(userDockPanel);
    end;
end;

procedure TPrincipal.createAndShowLoginForm;
var
  cuentaUsuario : TCuentaUsuario;
begin
  Hide;
  setButtonPanelEnable(False);

  cuentaUsuario:= TCuentaUsuario.Create();
  with TLogin.Create(self, cuentaUsuario) do
    begin
      ShowModal;
      Free;
    end;
end;

procedure TPrincipal.FormCreate(Sender: TObject);
begin
  AdvToolBarPager.ActivePageIndex:= 0;

  //Registrar Previsualizador
//  RegisterPreviewClass(TQRCustomPreviewInterface);
  RegisterPreviewClass(TQRSimplePreviewInterface);

  createAndShowLoginForm;
end;

procedure TPrincipal.btnConnectClick(Sender: TObject);
begin
   createAndShowLoginForm;
end;

procedure TPrincipal.btnConsultaPilotoClick(Sender: TObject);
begin
  with TConsultaDatosPiloto.Create(nil) do
    begin
      ShowModal;
      Free;
    end;
end;

procedure TPrincipal.setButtonPanelEnable(Enabled : Boolean);
begin
  btnDisconnect.Enabled:= Enabled;
  btnConnect.Enabled:= Enabled;
end;

procedure TPrincipal.dockPanelClose(Sender: TdxCustomDockControl);
begin
//   if (Sender.Caption = USER_EDITOR) then
//    FreeAndNil(userCRUD);
//
//   if (Sender.Caption = PILOT_EDITOR) then
//    FreeAndNil(pilotCRUD);
//
//   if (Sender.Caption = EVENT_EDITOR) then
//    FreeAndNil(eventoCRUD);
//
//   if (Sender.Caption = INSCRIPCION) then
//    FreeAndNil(inscripcionCRUD);
//
//   if (Sender.Caption = PUNTUACION) then
//    FreeAndNil(puntuacionCRUD);
//
//   if (Sender.Caption = CONFIGURATION_EDITOR) then
//    FreeAndNil(configurationFrame);
//
//   if (Sender.Caption = CATEGORIA_EDITOR) then
//    FreeAndNil(categoriaCRUD);
//
//   if (Sender.Caption = HANDICUP_EDITOR) then
//    FreeAndNil(handicupCRUD);
//
//   if (Sender.Caption = MOTO_EDITOR) then
//    FreeAndNil(motoCRUD);
end;

procedure TPrincipal.setLoggedUserToButtomPanel();
var
  LoggedUser : TLoggedUser;
begin
  LoggedUser:= TLoggedUserSingleton.getInstance.LoggedUser;

  AdvOfficeStatusBar.Panels[0].Text:= LoggedUser.Nombre + ' ' + LoggedUser.Apellido;
  AdvOfficeStatusBar.Panels[1].Text:= LoggedUser.AccountTypeName;

  Show;
  setButtonPanelEnable(True);

  btnConnect.Visible:= False;
  btnDisconnect.Visible:= True;
end;

procedure TPrincipal.tbGrillaConsultaClick(Sender: TObject);
begin
  with TGrillaTomaTiempoForm.Create(nil) do
    begin
      ShowModal;
      Free;
    end;
end;

procedure TPrincipal.tbGrillaConsultaMcClick(Sender: TObject);
begin
  with TGrillaTomaTiempoMultiCatForm.Create(nil) do
    begin
      ShowModal;
      Free;
    end;
end;

procedure TPrincipal.tbGrillaConsultaMcEPUClick(Sender: TObject);
begin
  with TGrillaTomaTiempoMultiCatEPUForm.Create(nil) do
    begin
      ShowModal;
      Free;
    end;
end;

procedure TPrincipal.tbGrillaConsultaReconocimientoClick(Sender: TObject);
begin
  with TGrillaReconocimientoForm.Create(nil) do
    begin
      ShowModal;
      Free;
    end;
end;

procedure TPrincipal.tbGrillaConsultaReconocimientoMultiClick(Sender: TObject);
begin
  with TGrillaReconocimientoMultiForm.Create(nil) do
    begin
      ShowModal;
      Free;
    end;
end;

procedure TPrincipal.tbReconocimientoClick(Sender: TObject);
begin
  with TReconocimiento.Create(nil) do
    begin
      ShowModal;
      Free;
    end;
end;

procedure TPrincipal.tbTomaTiempoEditClick(Sender: TObject);
begin
  with TTomaTiemposEdit.Create(nil) do
    begin
      ShowModal;
      Free;
    end;
end;

procedure TPrincipal.tbTomaTiemposClick(Sender: TObject);
begin
  with TTomaTiempos.Create(nil) do
    begin
      ShowModal;
      Free;
    end;
end;

procedure TPrincipal.btnContactoClick(Sender: TObject);
begin
  if (not Assigned(contactoDockPanel)) then
  begin
      contactoDockPanel:= TdxDockPanel.Create(self);
      contactoDockPanel.Caption:= PILOT_EDITOR;
      contactoDockPanel.DockTo(hideDockPanel, dtClient, -1);
      contactoDockPanel.OnClose:= dockPanelClose;
  end;

  if (Assigned(contactoCRUD)) then
    begin
      contactoDockPanel.Visible:= True;
      dxTabContainerDockSite.ActiveChild:= contactoDockPanel;
    end
  else
    begin
      contactoCRUD:= TContactCRUD.Create(nil);
      contactoCRUD.Align:= alClient;
      contactoCRUD.SetParentComponent(contactoDockPanel);
    end;
end;

procedure TPrincipal.AdvGlowButton1Click(Sender: TObject);
begin
  with TTAdminGillaAbastecimiento.Create(nil) do
    begin
      ShowModal;
      Free;
    end;
end;

procedure TPrincipal.btnAdministracionAgrupacionClick(Sender: TObject);
begin
  with TAgrupacionReconocimientoForm.Create(nil) do
    begin
      ShowModal;
      Free;
    end;
end;

procedure TPrincipal.btnAgregarPilotoClick(Sender: TObject);
begin
  with TAddPilotToWaitingGrid.Create(nil) do
    begin
      ShowModal;
      Free;
    end;
end;

procedure TPrincipal.btnAgregarPilotoRallyClick(Sender: TObject);
begin
  with TAddTomaTiempoAbastecimiento.Create(nil) do
    begin
      ShowModal;
      Free;
    end;
end;

procedure TPrincipal.btnAgregarPilotoRallyTimeClick(Sender: TObject);
begin
  with TAddTomaTiempoAbastecimientoWithTime.Create(nil) do
    begin
      ShowModal;
      Free;
    end;
end;

procedure TPrincipal.btnCampeonatoClick(Sender: TObject);
var
 crudFrame: TAbstractCRUDFrame;
 dockIndex: Integer;
begin
  if (not Assigned(campeonatoDockPanel)) then
  begin
      campeonatoDockPanel:= TdxDockPanel.Create(self);
      campeonatoDockPanel.Caption:= CAMPEONATO_EDITOR;
      campeonatoDockPanel.DockTo(hideDockPanel, dtClient, -1);
      campeonatoDockPanel.OnClose:= dockPanelClose;
  end;

  if (Assigned(campeonatoCRUD)) then
    begin
      campeonatoDockPanel.Visible:= True;
      dxTabContainerDockSite.ActiveChild:= campeonatoDockPanel;
    end
  else
    begin
      campeonatoCRUD:= TCampeonatoCRUD.Create(nil);
      campeonatoCRUD.Align:= alClient;
      campeonatoCRUD.SetParentComponent(campeonatoDockPanel);
    end;
end;

procedure TPrincipal.btnCategoriaClick(Sender: TObject);
begin
  if (not Assigned(categoriaDockPanel)) then
  begin
      categoriaDockPanel:= TdxDockPanel.Create(self);
      categoriaDockPanel.Caption:= CATEGORIA_EDITOR;
      categoriaDockPanel.DockTo(hideDockPanel, dtClient, -1);
      categoriaDockPanel.OnClose:= dockPanelClose;
  end;

  if (Assigned(categoriaCRUD)) then
    begin
      categoriaDockPanel.Visible:= True;
      dxTabContainerDockSite.ActiveChild:= categoriaDockPanel;
    end
  else
    begin
      categoriaCRUD:= TCategoriaCRUD.Create(nil);
      categoriaCRUD.Align:= alClient;
      categoriaCRUD.SetParentComponent(categoriaDockPanel);
    end;
end;

procedure TPrincipal.btnConfigurationClick(Sender: TObject);
begin
  if (not Assigned(configurationDockPanel)) then
  begin
      configurationDockPanel:= TdxDockPanel.Create(self);
      configurationDockPanel.Caption:= CONFIGURATION_EDITOR;
      configurationDockPanel.DockTo(hideDockPanel, dtClient, -1);
      configurationDockPanel.OnClose:= dockPanelClose;
  end;

  if (Assigned(configurationFrame)) then
    begin
      configurationDockPanel.Visible:= True;
      dxTabContainerDockSite.ActiveChild:= configurationDockPanel;
    end
  else
    begin
      configurationFrame:= TConfigurationFrame.Create(nil);
      configurationFrame.Align:= alClient;
      configurationFrame.SetParentComponent(configurationDockPanel);
    end;
end;
end.
