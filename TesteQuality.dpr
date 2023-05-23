program TesteQuality;

uses
  Vcl.Forms,
  UFMain in 'UFMain.pas' {FMain},
  UFUser in 'UFUser.pas' {FUser},
  UDmMain in 'UDmMain.pas' {DmMain: TDataModule},
  USettings in 'USettings.pas',
  UReports in 'UReports.pas' {FReports},
  UFSettings in 'UFSettings.pas' {FSettings};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDmMain, DmMain);
  Application.CreateForm(TFMain, FMain);
  Application.CreateForm(TFSettings, FSettings);
  Application.Run;
end.
