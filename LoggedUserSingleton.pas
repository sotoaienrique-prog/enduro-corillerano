unit LoggedUserSingleton;

interface

type
  TLoggedUser = class(TObject)
  protected
    fOID: Integer;
    fNombre: String;
    fApellido: String;
    fAccountTypeOID: Integer;
    fAccountTypeName: String;
  public
    property OID: Integer read fOID write fOID;
    property Nombre: String read fNombre write fNombre;
    property Apellido: String read fApellido write fApellido;
    property AccountTypeOID: Integer read fAccountTypeOID write fAccountTypeOID;
    property AccountTypeName: String read fAccountTypeName write fAccountTypeName;
  end;

type
  TLoggedUserSingleton = class(TObject)
  protected
    fLoggedUser: TLoggedUser;
  public
    property LoggedUser: TLoggedUser read fLoggedUser write fLoggedUser;

    class function getInstance: TLoggedUserSingleton;
  end;

implementation

var
  Instance : TLoggedUserSingleton  = nil;

  class function TLoggedUserSingleton.getInstance: TLoggedUserSingleton;
  begin
    if (not Assigned( Instance )) then
    begin
      Instance:= TLoggedUserSingleton.Create;
    end;
    Result:= Instance
  end;

end.
