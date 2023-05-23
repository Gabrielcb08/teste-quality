unit UDmMain;

interface

uses
  System.SysUtils, System.StrUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, Vcl.Dialogs;

type
  TDmMain = class(TDataModule)
    FDConnMain: TFDConnection;
    QryUsers: TFDQuery;
    QryDependents: TFDQuery;
    QryUsersCODIGO: TIntegerField;
    QryUsersNOME: TStringField;
    QryUsersDATA_NASCIMENTO: TDateField;
    QryUsersEMAIL: TStringField;
    QryUsersFOTO: TStringField;
    QryUsersATIVO: TSmallintField;
    QryDependentsCODIGO: TIntegerField;
    QryDependentsCODIGO_USUARIO: TIntegerField;
    QryDependentsNOME: TStringField;
    QryDependentsIDADE: TSmallintField;
    procedure QryUsersBeforeDelete(DataSet: TDataSet);
    procedure QryUsersAfterOpen(DataSet: TDataSet);
    procedure QryUsersAfterPost(DataSet: TDataSet);
    procedure QryUsersAfterInsert(DataSet: TDataSet);
    procedure FDConnMainBeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmMain: TDmMain;

implementation

uses
  System.UITypes, USettings;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDmMain.FDConnMainBeforeConnect(Sender: TObject);
var
  sKey: String;
begin
  sKey := 'DB';
  with TFDConnection(Sender) do begin
    ConnectionDefName := sKey;
    DriverName := 'FB';
    Params.Values['DriverID'] := 'FB';
    Params.Values['CharacterSet'] := 'Win1252';
    Params.Values['ExtendedMetadata'] := 'False';
    Params.Values['Port'] := Sys.DB.Port.ToString;
    Params.Values['Server'] := Sys.DB.Server;
    Params.Values['Database'] := Sys.DB.DataBase;
    Params.Values['User_name'] := 'SYSDBA';
    Params.Values['Password'] := 'masterkey';
  end;
end;

procedure TDmMain.QryUsersAfterInsert(DataSet: TDataSet);
begin
  DmMain.QryDependents.Close;
    DmMain.QryDependents.ParamByName('CODIGO').AsInteger := DmMain.QryUsersCODIGO.AsInteger;
  DmMain.QryDependents.Open;
end;

procedure TDmMain.QryUsersAfterOpen(DataSet: TDataSet);
begin
  DmMain.QryUsers.Filtered := False;
end;

procedure TDmMain.QryUsersAfterPost(DataSet: TDataSet);
begin
  if QryDependents.ChangeCount > 0 then begin
    DmMain.QryDependents.ParamByName('CODIGO').AsInteger := QryUsersCODIGO.AsInteger;

    DmMain.QryDependents.ApplyUpdates(-1);
    DmMain.QryDependents.CommitUpdates;
  end;

  FDConnMain.Commit;
end;

procedure TDmMain.QryUsersBeforeDelete(DataSet: TDataSet);
begin
  if MessageDLG('Deseja realmente excluir '+QryUsersNOME.AsString,TMsgDlgType.mtConfirmation,
    [TMsgDlgBtn.mbYes,TMsgDlgBtn.mbNo,TMsgDlgBtn.mbCancel],0,TMsgDlgBtn.mbYes,['Sim','Não','Cancelar']) <> idYes then
    abort;

end;

end.
