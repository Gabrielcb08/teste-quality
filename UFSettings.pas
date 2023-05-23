unit UFSettings;

interface

uses
  Winapi.Windows, Winapi.ShellAPI, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFSettings = class(TForm)
    pnlTtitle: TPanel;
    Label1: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    btnSave: TButton;
    edtServer: TEdit;
    Label2: TLabel;
    edtDataBase: TEdit;
    Label3: TLabel;
    Button2: TButton;
    edtPort: TEdit;
    Label4: TLabel;
    Open: TOpenDialog;
    btnInstallFirebird: TButton;
    Label5: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnInstallFirebirdClick(Sender: TObject);
  private
    function OurExecute(AppName: String; Parameters: String = ''; Path: String = ''; ShowCmd: Integer = SW_SHOWNORMAL): Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSettings: TFSettings;

implementation

{$R *.dfm}

uses UFUser, USettings;


Function TFSettings.OurExecute(AppName: String; Parameters: String = ''; Path: String = ''; ShowCmd: Integer = SW_SHOWNORMAL): Boolean;
var
  LResult: cardinal;
begin
  Result := False;
  if not AppName.Trim.IsEmpty and Path.Trim.IsEmpty then
    Path := ExtractFilePath(ParamStr(0));
  LResult := ShellExecute(Application.Handle, 'Open', PChar(AppName), PChar(Parameters), PChar(Path), ShowCmd);
  if LResult = 2 then
    // UOur.Message.OurMessage('Arquivo não foi encontrado!',mtWarning)
  else if LResult = 31 then
    ShowMessage('Não encontramos nenhum programa padrão para executar este tipo de arquivo!')
  else if LResult <> 42 then
    ShowMessage('Não foi possível abrir este arquivo!');
  Result := LResult = 42;
end;

procedure TFSettings.btnInstallFirebirdClick(Sender: TObject);
var
  LBatName: String;
  LBat, LConfFirebird: TStringList;
  sPathFirebird, sFileName: string;
begin
  sPathFirebird := ExtractFilePath(ParamStr(0)) +'FB\3_0\';
  sFileName := 'firebird.conf';
  if not FileExists(sPathFirebird + sFileName) then begin
    MessageDLG('Pasta Firebird não foi encontrada! ',TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK],0);
    exit;
  end;

  LConfFirebird := TStringList.Create;
  try
    LConfFirebird.LoadFromFile(sPathFirebird+sFileName);

    LConfFirebird.BeginUpdate;
    LConfFirebird.Strings[0] := 'RemoteServiceName = gds_db_' + edtPort.Text;
    LConfFirebird.Strings[1] := 'RemoteServicePort = ' + edtPort.Text;
    LConfFirebird.EndUpdate;
    LConfFirebird.SaveToFile(sPathFirebird +sFileName);
  finally
    FreeAndNil(LConfFirebird);
  end;

  LBat := TStringList.Create;
  try
    LBatName := ExtractFilePath(ParamStr(0)) + 'Install_Service.bat';
    LBat.Add('@echooff');
    LBat.Add('setlocal');
    LBat.Add('cd "' + sPathFirebird + '"');
    LBat.Add('sc stop "FirebirdServerFirebird_3_0_'+edtPort.Text+'"');
    LBat.Add('timeout /t 1');
    LBat.Add('sc delete "FirebirdServerFirebird_3_0_'+edtPort.Text+'"');
    LBat.Add('timeout /t 1');
    LBat.Add('instsvc i -a -n "Firebird_3_0_'+edtPort.Text+'"');
    LBat.Add('timeout /t 1');
    LBat.Add('sc start "FirebirdServerFirebird_3_0_'+edtPort.Text+'"');
    LBat.Add('@pause');
    LBat.SaveToFile(LBatName);

    if FileExists(LBatName) then
      OurExecute(ExtractFileName(LBatName), '', ExtractFilePath(LBatName), SW_SHOWNORMAL);
  finally
    LBat.Free;
  end;
end;

procedure TFSettings.btnSaveClick(Sender: TObject);
begin
  Sys.DB.Server := edtServer.Text;
  Sys.DB.DataBase := edtDataBase.Text;
  Sys.DB.Port := StrToIntDef(edtPort.Text,3050);

  SaveSettings;

  close;
end;

procedure TFSettings.Button2Click(Sender: TObject);
begin
  Open.InitialDir := ExtractFilePath(ParamStr(0));

  if Open.Execute then
    edtDataBase.Text := Open.FileName;
end;

procedure TFSettings.FormShow(Sender: TObject);
begin
  edtServer.Text := Sys.DB.Server;
  edtDataBase.Text := Sys.DB.DataBase;
  edtPort.Text := Sys.DB.Port.ToString;
end;

end.
