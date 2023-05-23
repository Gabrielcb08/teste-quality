unit UReports;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Vcl.Imaging.jpeg, Data.DB,
  System.StrUtils;

type
  TFReports = class(TForm)
    RepRegistratioForm: TRLReport;
    RLBand1: TRLBand;
    RLImage1: TRLImage;
    RLDraw1: TRLDraw;
    imgPhoto: TRLImage;
    RLDraw2: TRLDraw;
    RLDraw3: TRLDraw;
    RLDraw4: TRLDraw;
    RLDraw10: TRLDraw;
    RLDraw9: TRLDraw;
    RLDraw8: TRLDraw;
    RLDraw7: TRLDraw;
    RLDraw5: TRLDraw;
    RLDraw6: TRLDraw;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLBand2: TRLBand;
    RLDraw11: TRLDraw;
    RLDraw12: TRLDraw;
    RLDraw13: TRLDraw;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLDraw14: TRLDraw;
    RLDraw15: TRLDraw;
    RLDraw16: TRLDraw;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    dtsUsers: TDataSource;
    dtsDependents: TDataSource;
    RLBand3: TRLBand;
    RLDraw17: TRLDraw;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RepAllRecords: TRLReport;
    RLBand4: TRLBand;
    RLLabel17: TRLLabel;
    RLLabel20: TRLLabel;
    RLLabel21: TRLLabel;
    RLBand5: TRLBand;
    RLDBText13: TRLDBText;
    RLDBText14: TRLDBText;
    RLDraw20: TRLDraw;
    RLDraw21: TRLDraw;
    RLLabel13: TRLLabel;
    RLDBText8: TRLDBText;
    RLBand6: TRLBand;
    RLDraw22: TRLDraw;
    RLSystemInfo3: TRLSystemInfo;
    RLSystemInfo4: TRLSystemInfo;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    RLDraw18: TRLDraw;
    RLImage2: TRLImage;
    RLDraw23: TRLDraw;
    procedure imgPhotoBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLSystemInfo1BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure RLSystemInfo2BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure RLDBText4BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FReports: TFReports;

implementation

{$R *.dfm}

uses UDmMain;

procedure TFReports.imgPhotoBeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  if FileExists(DmMain.QryUsersFOTO.AsString) then
    imgPhoto.Picture.LoadFromFile(DmMain.QryUsersFOTO.AsString)
  else
    imgPhoto.Picture := Nil;
end;

procedure TFReports.RLDBText4BeforePrint(Sender: TObject; var AText: string;
  var PrintIt: Boolean);
begin
  if AText = '0' then
    AText := 'Inativo'
  else
    AText := 'Ativo';
end;

procedure TFReports.RLSystemInfo1BeforePrint(Sender: TObject; var AText: string;
  var PrintIt: Boolean);
begin
  AText := RightStr('00'+AText,2);
end;

procedure TFReports.RLSystemInfo2BeforePrint(Sender: TObject; var AText: string;
  var PrintIt: Boolean);
begin
  AText := RightStr('00'+AText,2);
end;

end.
