unit ConfigureFilesUtilities;

interface

uses
  SysUtils, IniFiles;

  function ExtractRutaConfiguracion:string;
  function ReadStringFromIniFile(Seccion, Identificador, Default: String):String;
  function ReadIntegerFromIniFile(Seccion, Identificador: String; Default: Integer):Integer;
  function ExtractRutaLibrary: String;
implementation

function ExtractRutaConfiguracion:string;
begin
  Result:= ExtractFileDir (paramstr(0))+'\config.ini';
end;

function ReadStringFromIniFile(Seccion, Identificador, Default: String):String;
var
  MiFichero : TIniFile;
  ruta, outStr:string;
begin
  ruta:= ExtractRutaConfiguracion;
  MiFichero:=TIniFile.Create(ruta);
  try
    outStr:= MiFichero.ReadString(Seccion,Identificador,Default);
  finally
    MiFichero.Free;
  end;
  Result:= outStr;
end;

function ReadIntegerFromIniFile(Seccion, Identificador: String; Default: Integer):Integer;
var
  MiFichero : TIniFile;
  ruta: String;
  outInt: Integer;
begin
  ruta:= ExtractRutaConfiguracion;
  MiFichero:= TIniFile.Create(ruta);
  try
    outInt:= MiFichero.ReadInteger(Seccion, Identificador, Default);
  finally
    MiFichero.Free;
  end;
  Result:= outInt;
end;

function ExtractRutaLibrary: String;
begin
  Result:= ExtractFileDir (paramstr(0))+'\libmysql55.dll';
end;

end.
