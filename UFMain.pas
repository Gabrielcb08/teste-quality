unit UFMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Menus,
  Vcl.Imaging.jpeg;

type
  TFMain = class(TForm)
    imgBackground: TImage;
    Menu: TMainMenu;
    Arquivo1: TMenuItem;
    Arquivo2: TMenuItem;
    RelatoriodeCadastros1: TMenuItem;
    Configurao1: TMenuItem;
    procedure Arquivo2Click(Sender: TObject);
    procedure RelatoriodeCadastros1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Configurao1Click(Sender: TObject);
  private
    function TestSettings: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMain: TFMain;

implementation

{$R *.dfm}

uses UFUser, UDmMain, UReports, USettings, UFSettings;

function TFmain.TestSettings: Boolean;
begin
  if not Sys.DB.isConfigured then
    TestConnection;
  if not Sys.DB.isConfigured then begin
    if MessageDLG('Configuração com banco de dados não foi encontrada! '+sLineBreak+
      'Configurar Agora?',TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes,TMsgDlgBtn.mbNo],0,
      TMsgDlgBtn.mbYes,['Sim','Não']) = idYes then begin
        Configurao1Click(Configurao1);
      end;

    Abort;
  end;
end;

procedure TFMain.Arquivo2Click(Sender: TObject);
begin
  TestSettings;

  if not Assigned(FUser) then
    FUser := TFUser.Create(Self);
  try
    FUser.ShowModal;
  finally
    FreeAndNil(FUser);
  end;
end;

procedure TFMain.Configurao1Click(Sender: TObject);
begin
  if not Assigned(FUser) then
    FSettings := TFSettings.Create(Self);
  try
    FSettings.ShowModal;
  finally
    FreeAndNil(FSettings);
  end;
end;

procedure TFMain.FormCreate(Sender: TObject);
begin
  LoadSettings;
end;

procedure TFMain.RelatoriodeCadastros1Click(Sender: TObject);
begin
  TestSettings;

  FReports := TFReports.Create(Self);
  Try
    DmMain.QryUsers.Close;
    DmMain.QryUsers.Open;

    DmMain.QryUsers.Filtered := False;
      DmMain.QryUsers.Filter := 'ATIVO = 1';
    DmMain.QryUsers.Filtered := True;
    FReports.RepAllRecords.PreviewModal;
  Finally
    FreeAndNil(FReports);
    DmMain.QryUsers.Filtered := False;
  End;
end;

end.
