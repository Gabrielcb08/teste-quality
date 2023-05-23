object FUser: TFUser
  Left = 0
  Top = 0
  Caption = 'Cadastrar Usu'#225'rio'
  ClientHeight = 404
  ClientWidth = 579
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  TextHeight = 15
  object pcMain: TPageControl
    Left = 0
    Top = 0
    Width = 579
    Height = 328
    ActivePage = tbsDependents
    Align = alClient
    TabOrder = 0
    OnChange = pcMainChange
    ExplicitWidth = 575
    ExplicitHeight = 327
    object tbsCadastre: TTabSheet
      Caption = 'Cadastro'
      object pnlTtitle: TPanel
        Left = 0
        Top = 0
        Width = 571
        Height = 41
        Align = alTop
        BevelKind = bkFlat
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitWidth = 567
        object Label1: TLabel
          AlignWithMargins = True
          Left = 10
          Top = 3
          Width = 83
          Height = 31
          Margins.Left = 10
          Align = alLeft
          Caption = 'Cadastros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -18
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
          ExplicitHeight = 25
        end
      end
      object pnlData: TPanel
        Left = 0
        Top = 41
        Width = 571
        Height = 257
        Align = alClient
        BevelEdges = [beLeft, beRight, beBottom]
        BevelKind = bkFlat
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitWidth = 567
        ExplicitHeight = 256
        object Label3: TLabel
          Left = 11
          Top = 16
          Width = 36
          Height = 17
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 11
          Top = 72
          Width = 119
          Height = 17
          Caption = 'Data de Nascimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 11
          Top = 130
          Width = 31
          Height = 17
          Caption = 'Email'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 11
          Top = 188
          Width = 29
          Height = 17
          Caption = 'Ativo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object pnlPhoto: TPanel
          Left = 382
          Top = 37
          Width = 144
          Height = 153
          BevelKind = bkFlat
          BevelOuter = bvNone
          TabOrder = 0
          object imgPhoto: TImage
            Left = 0
            Top = 0
            Width = 140
            Height = 149
            Align = alClient
            Proportional = True
            Stretch = True
            ExplicitLeft = 15
            ExplicitTop = 16
            ExplicitWidth = 105
            ExplicitHeight = 105
          end
        end
        object dbedtName: TDBEdit
          Left = 11
          Top = 37
          Width = 358
          Height = 23
          CharCase = ecUpperCase
          DataField = 'NOME'
          DataSource = dtsUsers
          TabOrder = 1
        end
        object DBEdit2: TDBEdit
          Left = 11
          Top = 93
          Width = 358
          Height = 23
          DataField = 'DATA_NASCIMENTO'
          DataSource = dtsUsers
          TabOrder = 2
        end
        object dbedtMail: TDBEdit
          Left = 11
          Top = 153
          Width = 358
          Height = 23
          CharCase = ecLowerCase
          DataField = 'EMAIL'
          DataSource = dtsUsers
          TabOrder = 3
        end
        object btnLoadImage: TButton
          Left = 383
          Top = 196
          Width = 114
          Height = 25
          Action = FileOpen1
          TabOrder = 4
        end
        object cboActive: TComboBox
          Left = 11
          Top = 211
          Width = 94
          Height = 23
          TabOrder = 5
          Text = 'Escolha'
          OnChange = cboActiveChange
          Items.Strings = (
            'Sim'
            'N'#227'o')
        end
      end
    end
    object tbsDependents: TTabSheet
      Caption = 'Dependentes'
      ImageIndex = 1
      object Panel2: TPanel
        Left = 0
        Top = 41
        Width = 571
        Height = 56
        Align = alTop
        BevelEdges = [beLeft, beRight]
        BevelKind = bkFlat
        BevelOuter = bvNone
        TabOrder = 0
        object Label7: TLabel
          Left = 11
          Top = 6
          Width = 33
          Height = 15
          Caption = 'Nome'
        end
        object Label9: TLabel
          Left = 319
          Top = 6
          Width = 29
          Height = 15
          Caption = 'Idade'
        end
        object edtNameDep: TEdit
          Left = 11
          Top = 24
          Width = 302
          Height = 23
          CharCase = ecUpperCase
          TabOrder = 0
          TextHint = 'Nome do dependente'
        end
        object edtAge: TEdit
          Left = 319
          Top = 24
          Width = 78
          Height = 23
          NumbersOnly = True
          TabOrder = 1
          TextHint = 'Idade'
        end
        object btnAdd: TButton
          Left = 403
          Top = 23
          Width = 75
          Height = 25
          Caption = 'Adicionar'
          TabOrder = 2
          OnClick = btnAddClick
        end
        object btnRemove: TButton
          Left = 484
          Top = 23
          Width = 75
          Height = 25
          Caption = 'Remover'
          TabOrder = 3
          OnClick = btnRemoveClick
        end
      end
      object dbGridDep: TDBGrid
        Left = 0
        Top = 97
        Width = 571
        Height = 201
        Align = alClient
        DataSource = dtsDependents
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnDblClick = dbGridUsersAllRecordsDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'NOME'
            Title.Caption = 'Nome'
            Width = 284
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IDADE'
            Title.Caption = 'Idade'
            Width = 80
            Visible = True
          end>
      end
      object pnlDepTitle: TPanel
        Left = 0
        Top = 0
        Width = 571
        Height = 41
        Align = alTop
        BevelKind = bkFlat
        BevelOuter = bvNone
        TabOrder = 2
        object Label8: TLabel
          AlignWithMargins = True
          Left = 10
          Top = 3
          Width = 226
          Height = 31
          Margins.Left = 10
          Align = alLeft
          Caption = 'Cadastros de Dependentes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -18
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
          ExplicitHeight = 25
        end
      end
    end
    object tbsListAllRecords: TTabSheet
      Caption = 'Lista dos Cadastrados'
      ImageIndex = 2
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 571
        Height = 41
        Align = alTop
        BevelKind = bkFlat
        BevelOuter = bvNone
        TabOrder = 0
        object Label6: TLabel
          AlignWithMargins = True
          Left = 10
          Top = 3
          Width = 143
          Height = 31
          Margins.Left = 10
          Align = alLeft
          Caption = 'Lista de Usu'#225'rios'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -18
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
          ExplicitHeight = 25
        end
        object cboFilter: TComboBox
          Left = 208
          Top = 10
          Width = 81
          Height = 23
          TabOrder = 0
          Text = 'Escolha'
          OnChange = cboFilterChange
          Items.Strings = (
            'Ativos'
            'Inativos'
            'Todos')
        end
        object edtSearch: TEdit
          Left = 295
          Top = 10
          Width = 170
          Height = 23
          CharCase = ecUpperCase
          TabOrder = 1
          TextHint = 'Pesquisa por palavra chave'
        end
        object btnFilter: TButton
          Left = 471
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Filtrar'
          TabOrder = 2
          OnClick = btnFilterClick
        end
      end
      object dbGridUsersAllRecords: TDBGrid
        Left = 0
        Top = 41
        Width = 571
        Height = 232
        Align = alClient
        DataSource = dtsUsers
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnDblClick = dbGridUsersAllRecordsDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'NOME'
            Title.Caption = 'Nome'
            Width = 197
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EMAIL'
            Title.Caption = 'Email'
            Width = 158
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATA_NASCIMENTO'
            Title.Caption = 'Data de Nascimento'
            Width = 116
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ATIVO'
            Title.Caption = 'Ativo'
            Visible = True
          end>
      end
      object dbNavUsers: TDBNavigator
        Left = 0
        Top = 273
        Width = 571
        Height = 25
        DataSource = dtsUsers
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Align = alBottom
        TabOrder = 2
      end
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 328
    Width = 579
    Height = 76
    Align = alBottom
    BevelEdges = [beLeft, beRight, beBottom]
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitTop = 327
    ExplicitWidth = 575
    object btnNew: TButton
      Left = 15
      Top = 32
      Width = 75
      Height = 25
      Hint = 'Insert'
      Caption = '&Novo'
      ImageIndex = 4
      TabOrder = 0
      OnClick = btnNewClick
    end
    object btnSave: TButton
      Left = 96
      Top = 32
      Width = 75
      Height = 25
      Hint = 'Post'
      Caption = '&Salvar'
      ImageIndex = 7
      TabOrder = 1
      OnClick = btnSaveClick
    end
    object btnClear: TButton
      Left = 177
      Top = 32
      Width = 75
      Height = 25
      Caption = 'Limpar'
      TabOrder = 2
      OnClick = btnClearClick
    end
    object btnPrint: TButton
      Left = 258
      Top = 32
      Width = 75
      Height = 25
      Caption = 'Imprimir'
      TabOrder = 3
      OnClick = btnPrintClick
    end
    object btnDelete: TButton
      Left = 339
      Top = 33
      Width = 75
      Height = 25
      Hint = 'Delete'
      Caption = '&Excluir'
      ImageIndex = 5
      TabOrder = 4
      OnClick = btnDeleteClick
    end
    object dbNavUsers1: TDBNavigator
      Left = 177
      Top = 2
      Width = 192
      Height = 25
      DataSource = dtsUsers
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 5
    end
  end
  object ActionManager1: TActionManager
    ActionBars = <
      item
      end
      item
      end>
    Left = 416
    Top = 16
    StyleName = 'Platform Default'
    object FileOpen1: TFileOpen
      Category = 'File'
      Caption = '&Escolher Foto'
      Dialog.DefaultExt = '.jpg'
      Dialog.Filter = 'JPG|*.jpg'
      Hint = 'Open|Opens an existing file'
      ImageIndex = 7
      ShortCut = 16463
      BeforeExecute = FileOpen1BeforeExecute
      OnAccept = FileOpen1Accept
    end
  end
  object dtsUsers: TDataSource
    DataSet = DmMain.QryUsers
    OnDataChange = dtsUsersDataChange
    Left = 136
    Top = 184
  end
  object dtsDependents: TDataSource
    DataSet = DmMain.QryDependents
    Left = 224
    Top = 193
  end
end
