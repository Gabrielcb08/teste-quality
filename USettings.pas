unit USettings;

interface

Uses
  System.Classes, System.IniFiles, System.SysUtils;

type
  TDataBase = Record
    isConfigured: Boolean;
    Server: String;
    DataBase: String;
    Port: Integer;
  End;

  TSys = Record
    DB: TDataBase;
  End;

  function TestConnection: Boolean;
  procedure SaveSettings;
  procedure LoadSettings;

var
  Sys: TSys;

implementation

uses UDmMain;

procedure SaveSettings;
var
  LIni: TIniFile;
begin
  LIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Settings.ini');
  try
    LIni.WriteString('DB', 'SERVER', Sys.DB.Server);
    LIni.WriteInteger('DB', 'PORT', Sys.DB.Port);
    LIni.WriteString('DB', 'DATABASE', Sys.DB.DataBase);
  finally
    FreeAndNil(LIni);
  end;
end;

procedure LoadSettings;
var
  LIni: TIniFile;
begin
  LIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Settings.ini');
  try
    Sys.DB.Server := LIni.ReadString('DB', 'SERVER', '127.0.0.1');
    Sys.DB.Port := LIni.ReadInteger('DB', 'PORT', 3050);
    Sys.DB.DataBase := LIni.ReadString('DB', 'DATABASE', ExtractFilePath(ParamStr(0))+'DB\BANCO.FDB');
  finally
    FreeAndNil(LIni);
  end;
end;

function TestConnection: Boolean;
begin
  Result := False;
  try
    DmMain.FDConnMain.Connected := True;
  except
  end;

  if DmMain.FDConnMain.Connected then
    Result := True;

  Sys.DB.isConfigured := Result;

end;

end.
