unit EncodingHelper;

interface

uses
  SysUtils;

  type
  TEncodingHelper = class(TObject)
  public
    class function XorEncode(const Key, Source: string): string;
    class function XorDecode(const Key, Source: string): string;
  end;

implementation

  class function TEncodingHelper.XorEncode(const Key, Source: string): string;
  var
    I: Integer;
    C: Byte;
  begin
    Result := '';
    for I := 1 to Length(Source) do
    begin
      if Length(Key) > 0 then
        C := Byte(Key[1 + ((I - 1) mod Length(Key))]) xor Byte(Source[I])
      else
        C := Byte(Source[I]);
      Result := Result + AnsiLowerCase(IntToHex(C, 2));
    end;
  end;

  class function TEncodingHelper.XorDecode(const Key, Source: string): string;
  var
    I: Integer;
    C: Char;
  begin
    Result := '';
    for I := 0 to Length(Source) div 2 - 1 do
    begin
      C := Chr(StrToIntDef('$' + Copy(Source, (I * 2) + 1, 2), Ord(' ')));
      if Length(Key) > 0 then
        C := Chr(Byte(Key[1 + (I mod Length(Key))]) xor Byte(C));
      Result := Result + C;
    end;
  end;

end.
