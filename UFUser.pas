unit UFUser;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.DBCtrls, Vcl.DBActns, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, Vcl.StdActns, Data.DB,
  Vcl.Grids, Vcl.DBGrids, System.StrUtils, System.Math, System.RegularExpressions;

type
//  TMyCombo = class helper for TComboBox
//  private
//    FItemsValue: TStringList;
//    FValue: Variant
//  public
//    procedure DoChange(); override;
//    function GetValue;
//  end;

  TFUser = class(TForm)
    pcMain: TPageControl;
    tbsCadastre: TTabSheet;
    tbsDependents: TTabSheet;
    tbsListAllRecords: TTabSheet;
    pnlTtitle: TPanel;
    pnlData: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    pnlPhoto: TPanel;
    imgPhoto: TImage;
    dbedtName: TDBEdit;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    dbedtMail: TDBEdit;
    Label4: TLabel;
    btnLoadImage: TButton;
    Label5: TLabel;
    ActionManager1: TActionManager;
    FileOpen1: TFileOpen;
    Panel1: TPanel;
    Label6: TLabel;
    dbGridUsersAllRecords: TDBGrid;
    pnlBottom: TPanel;
    btnNew: TButton;
    btnSave: TButton;
    btnClear: TButton;
    btnPrint: TButton;
    btnDelete: TButton;
    dbNavUsers: TDBNavigator;
    dbNavUsers1: TDBNavigator;
    cboFilter: TComboBox;
    edtSearch: TEdit;
    btnFilter: TButton;
    cboActive: TComboBox;
    Panel2: TPanel;
    dbGridDep: TDBGrid;
    pnlDepTitle: TPanel;
    Label8: TLabel;
    edtNameDep: TEdit;
    edtAge: TEdit;
    Label7: TLabel;
    Label9: TLabel;
    btnAdd: TButton;
    btnRemove: TButton;
    dtsUsers: TDataSource;
    dtsDependents: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FileOpen1BeforeExecute(Sender: TObject);
    procedure FileOpen1Accept(Sender: TObject);
    procedure pcMainChange(Sender: TObject);
    procedure cboFilterChange(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure cboActiveChange(Sender: TObject);
    procedure dbGridUsersAllRecordsDblClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnClearClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure dtsUsersDataChange(Sender: TObject; Field: TField);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    procedure LoadImg;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FUser: TFUser;

implementation

{$R *.dfm}

uses UDmMain, UReports;

procedure TFUser.LoadImg;
begin
  if FileExists(DmMain.QryUsersFOTO.AsString) then
    imgPhoto.Picture.LoadFromFile(DmMain.QryUsersFOTO.AsString)
  else
    imgPhoto.Picture := Nil;
end;

procedure TFUser.pcMainChange(Sender: TObject);
begin
  pnlBottom.Visible := not tbsListAllRecords.Showing;
end;

procedure TFUser.btnAddClick(Sender: TObject);
begin
  DmMain.QryDependents.First;
  if edtNameDep.Text = EmptyStr then begin
    MessageDLG('Nome não foi informado! ',TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK],0);
    edtNameDep.SetFocus;
    exit;
  end;
  if edtAge.Text = EmptyStr then begin
    MessageDLG('Idade não foi informada! ',TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK],0);
    edtAge.SetFocus;
    exit;
  end;
  if DmMain.QryDependents.Locate('NOME;IDADE',VarArrayOf([edtNameDep.Text,edtAge.Text]),[]) then begin
    MessageDLG('Dependente com mesmo nome e idade já está cadastrado! ',TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK],0);
    exit;
  end;

  DmMain.QryDependents.Append;
    DmMain.QryDependentsCODIGO_USUARIO.AsInteger :=  DmMain.QryUsersCODIGO.AsInteger;
    DmMain.QryDependentsNOME.AsString := edtNameDep.Text;
    DmMain.QryDependentsIDADE.AsString := edtAge.Text;
  DmMain.QryDependents.Post;

  if not (DmMain.QryUsers.State in [dsEdit, dsInsert]) then
    DmMain.QryUsers.Edit;

  edtNameDep.Clear;
  edtAge.Clear;

  edtNameDep.SetFocus;

end;

procedure TFUser.btnClearClick(Sender: TObject);
begin
  if not (DmMain.QryUsers.State in [dsEdit, dsInsert]) then
    DmMain.QryUsers.Edit;

  DmMain.QryUsersNOME.Clear;
  DmMain.QryUsersEMAIL.Clear;
  DmMain.QryUsersDATA_NASCIMENTO.Clear;
  DmMain.QryUsersFOTO.Clear;
  cboActive.ItemIndex := -1;
  imgPhoto.Picture := Nil;
end;

procedure TFUser.btnDeleteClick(Sender: TObject);
begin
  if DmMain.QryUsers.IsEmpty then begin
    MessageDLG('Nenhum registro para excluir! ',TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK],0);
    exit;
  end;
  DmMain.QryUsers.Delete;
end;

procedure TFUser.btnFilterClick(Sender: TObject);
var
  sFilter : TStringBuilder;
begin
  sFilter := TStringBuilder.Create;
  Try
    sFilter.Append('NOME LIKE ').Append(QuotedStr('%'+edtSearch.Text+'%'));

    if cboFilter.ItemIndex = 0 then
      sFilter.Append(' AND ATIVO = 1')
    else
    if cboFilter.ItemIndex = 1 then
      sFilter.Append(' AND ATIVO = 0');

    DmMain.QryUsers.Filtered := False;
      DmMain.QryUsers.Filter := sFilter.ToString;
    DmMain.QryUsers.Filtered := True;
  Finally
    sFilter.Free;
  End;

end;

procedure TFUser.btnNewClick(Sender: TObject);
begin
  DmMain.QryUsers.Append;
end;

procedure TFUser.btnPrintClick(Sender: TObject);
begin
  FReports := TFReports.Create(Self);
  Try
    FReports.RepRegistratioForm.PreviewModal;
  Finally
    FreeAndNil(FReports);
  End;
end;

procedure TFUser.btnRemoveClick(Sender: TObject);
begin
  if DmMain.QryDependents.IsEmpty then begin
    MessageDLG('Nenhum registro para excluir! ',TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK],0);
    exit;
  end;
  DmMain.QryDependents.Delete;
end;

procedure TFUser.btnSaveClick(Sender: TObject);
  function IsValidEmail(const Email: string): Boolean;
  const
    EmailRegex = '^[\w\.-]+@[\w\.-]+\.\w{2,4}$';
  begin
    Result := TRegEx.IsMatch(Email, EmailRegex);
  end;
var
  sMsg: string;
begin
  if dbedtName.Text = EmptyStr then begin
    MessageDLG('Nome do usuário não foi informado! ',TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK],0);
    dbedtName.SetFocus;
    abort;
  end;


  if not IsValidEmail(dbedtMail.Text) then begin
    if dbedtMail.Text = EmptyStr then
      sMsg := 'Email não informado! '
    else
      sMsg := 'Email inválido! ';

    MessageDLG(sMsg,TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK],0);
    dbedtMail.SetFocus;
    abort;
  end;
  DmMain.QryUsers.Post;
end;

procedure TFUser.cboActiveChange(Sender: TObject);
begin
  if not (DmMain.QryUsers.State in [dsEdit,dsInsert]) then
    DmMain.QryUsers.edit;

  DmMain.QryUsersATIVO.AsInteger := IfThen(cboActive.Text = 'Sim',1,0);
end;

procedure TFUser.cboFilterChange(Sender: TObject);
begin
  btnFilterClick(btnFilter);
end;

procedure TFUser.dbGridUsersAllRecordsDblClick(Sender: TObject);
begin
  if DmMain.QryUsers.IsEmpty then begin
    MessageDLG('Não existe registro para ser alterado! ',TMsgDlgType.mtWarning,
    [TMsgDlgBtn.mbOK],0);
    exit;
  end;

  DmMain.QryUsers.edit;
  tbsCadastre.Show;
  pcMainChange(pcMain);
end;

procedure TFUser.dtsUsersDataChange(Sender: TObject; Field: TField);
begin
  LoadImg;

  if DmMain.QryUsers.State in [dsEdit, dsInsert] then begin
    btnNew.Enabled := False;
    btnSave.Enabled := True;
    dbNavUsers1.Enabled := False;
  end
  else begin
    btnNew.Enabled := True;
    btnSave.Enabled := False;
    dbNavUsers1.Enabled := True;
    if DmMain.QryDependents.ChangeCount = 0 then begin
      DmMain.QryDependents.Close;
      DmMain.QryDependents.ParamByName('CODIGO').AsInteger := DmMain.QryUsersCODIGO.AsInteger;
      DmMain.QryDependents.Open;
    end;
    if DmMain.QryUsersATIVO.AsVariant <> NUll then
      cboActive.ItemIndex := cboActive.Items.IndexOf(IfThen(DmMain.QryUsersATIVO.AsInteger = 1,'Sim','Não'));
  end;
end;

procedure TFUser.FileOpen1Accept(Sender: TObject);
begin
  if FileOpen1.Dialog.Files.Count > 0 then begin
    if not (DmMain.QryUsers.State in [dsEdit,dsInsert]) then
      DmMain.QryUsers.edit;

    DmMain.QryUsersFOTO.AsString := FileOpen1.Dialog.Files[0];
  end;
  LoadImg;
end;

procedure TFUser.FileOpen1BeforeExecute(Sender: TObject);
begin
  FileOpen1.Dialog.InitialDir := ExtractFilePath(ParamStr(0))+'Images\' ;
end;

procedure TFUser.FormCreate(Sender: TObject);
begin
  if not Assigned(DmMain) then
    DmMain := TDmMain.Create(Nil);

  if not DmMain.QryUsers.Active then
    DmMain.QryUsers.Open;

  tbsCadastre.Show;

  DmMain.QryUsers.Append;
end;

procedure TFUser.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
    perform(WM_NEXTDLGCTL,0,0);
end;

procedure TFUser.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    key := #0;

end;

end.
