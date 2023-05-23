object FSettings: TFSettings
  Left = 0
  Top = 0
  Caption = 'Configura'#231#245'es'
  ClientHeight = 394
  ClientWidth = 475
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object pnlTtitle: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 469
    Height = 41
    Align = alTop
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = -96
    ExplicitTop = 0
    ExplicitWidth = 571
    object Label1: TLabel
      AlignWithMargins = True
      Left = 10
      Top = 3
      Width = 122
      Height = 31
      Margins.Left = 10
      Align = alLeft
      Caption = 'Configura'#231#245'es'
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
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 50
    Width = 469
    Height = 287
    Align = alClient
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitLeft = 6
    ExplicitTop = 11
    ExplicitHeight = 41
    object Label2: TLabel
      Left = 24
      Top = 8
      Width = 28
      Height = 15
      Caption = 'Sever'
    end
    object Label3: TLabel
      Left = 24
      Top = 56
      Width = 154
      Height = 15
      Caption = 'Caminho do Banco de Dados'
    end
    object Label4: TLabel
      Left = 24
      Top = 104
      Width = 28
      Height = 15
      Caption = 'Porta'
    end
    object Label5: TLabel
      Left = 24
      Top = 154
      Width = 426
      Height = 82
      AutoSize = False
      Caption = 
        'Caso o Firebird 3.0 n'#227'o esteja instalado e uma outra instancia d' +
        'o Firebird esteja na maquina, altere a porta e cliente em instal' +
        'ar!  Obs: Execute como Administrador caso d'#234' erro na instala'#231#227'o!'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      WordWrap = True
      StyleElements = []
    end
    object edtServer: TEdit
      Left = 24
      Top = 29
      Width = 121
      Height = 23
      TabOrder = 0
      Text = '127.0.0.1'
    end
    object edtDataBase: TEdit
      Left = 24
      Top = 77
      Width = 377
      Height = 23
      TabOrder = 1
    end
    object Button2: TButton
      Left = 407
      Top = 76
      Width = 25
      Height = 25
      Caption = '...'
      TabOrder = 2
      OnClick = Button2Click
    end
    object edtPort: TEdit
      Left = 24
      Top = 125
      Width = 73
      Height = 23
      NumbersOnly = True
      TabOrder = 3
      Text = '3050'
    end
    object btnInstallFirebird: TButton
      Left = 24
      Top = 242
      Width = 201
      Height = 25
      Caption = 'Instalar Firebird Nesta Porta'
      TabOrder = 4
      OnClick = btnInstallFirebirdClick
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 343
    Width = 469
    Height = 48
    Align = alBottom
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitTop = 256
    object btnSave: TButton
      Left = 194
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Salvar'
      TabOrder = 0
      OnClick = btnSaveClick
    end
  end
  object Open: TOpenDialog
    Filter = 'FDB|*.FDB'
    Left = 336
    Top = 56
  end
end
