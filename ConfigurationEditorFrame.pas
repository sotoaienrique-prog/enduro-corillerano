unit ConfigurationEditorFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ConfigureFilesUtilities, IniFiles,
  Vcl.ExtCtrls, Vcl.StdCtrls, JvExStdCtrls, JvEdit, JvValidateEdit, Vcl.ImgList,
  cxGraphics, AeroButtons;

type
  TConfigurationFrame = class(TFrame)
    mainPanel: TPanel;
    Panel_BD: TPanel;
    GB_BaseDeDatos: TGroupBox;
    Label_Puerto: TLabel;
    L_Host: TLabel;
    E_Host: TEdit;
    Label1: TLabel;
    JvVE_Puerto: TJvValidateEdit;
    buttonPanel: TPanel;
    cxButtonImageList: TcxImageList;
    btnAccept: TAeroButton;
    btnReloadConnection: TAeroButton;
    procedure btnAcceptClick(Sender: TObject);
    procedure btnReloadConnectionClick(Sender: TObject);
  private
    { Private declarations }
    procedure LoadConfiguration;
    procedure SaveConfiguration;
  public
    { Public declarations }
    constructor Create(owner: TComponent); Override;
  end;

implementation

uses
  DataModule;

{$R *.dfm}

procedure TConfigurationFrame.btnAcceptClick(Sender: TObject);
begin
  SaveConfiguration();
end;

procedure TConfigurationFrame.btnReloadConnectionClick(Sender: TObject);
begin
  SaveConfiguration();
  ConnectionModule.reloadConnectionParametersAndConnect;
end;

constructor TConfigurationFrame.Create(owner: TComponent);
begin
  inherited;
  LoadConfiguration;
end;

procedure TConfigurationFrame.LoadConfiguration;
begin
    E_Host.Text := ReadStringFromIniFile('Conexion','Host','');
    JvVE_Puerto.Value:= ReadStringFromIniFile('Conexion', 'Puerto','0');
end;

procedure TConfigurationFrame.SaveConfiguration;
var
  MiFichero : TIniFile;
  ruta:string;
begin
  ruta:= ExtractRutaConfiguracion;
  try
    MiFichero:= TIniFile.Create(ruta);

    MiFIchero.WriteString('Conexion','Host', E_Host.Text);
    MiFIchero.WriteString('Conexion','Puerto', JvVE_Puerto.Value);
  finally
    MiFIchero.Free;
  end;
end;

end.
