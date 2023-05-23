object DmMain: TDmMain
  Height = 325
  Width = 578
  PixelsPerInch = 120
  object FDConnMain: TFDConnection
    Params.Strings = (
      
        'Database=D:\Projects\Gabriel\TesteQuality\Win32\Debug\DB\BANCO.F' +
        'DB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Protocol=TCPIP'
      'Server=127.0.0.1'
      'Port=3050'
      'CharacterSet=WIN1252'
      'DriverID=FB')
    LoginPrompt = False
    BeforeConnect = FDConnMainBeforeConnect
    Left = 104
    Top = 40
  end
  object QryUsers: TFDQuery
    AfterOpen = QryUsersAfterOpen
    AfterInsert = QryUsersAfterInsert
    AfterPost = QryUsersAfterPost
    BeforeDelete = QryUsersBeforeDelete
    Connection = FDConnMain
    UpdateOptions.AssignedValues = [uvLockPoint, uvFetchGeneratorsPoint, uvGeneratorName]
    UpdateOptions.FetchGeneratorsPoint = gpImmediate
    UpdateOptions.GeneratorName = 'GEN_USUARIOS_ID'
    UpdateOptions.KeyFields = 'CODIGO'
    UpdateOptions.AutoIncFields = 'CODIGO'
    SQL.Strings = (
      'SELECT'
      '    U.CODIGO,'
      '    U.NOME,'
      '    U.DATA_NASCIMENTO,'
      '    U.EMAIL,'
      '    U.ATIVO,'
      '    U.FOTO'
      'FROM'
      '    USUARIOS U'
      'WHERE'
      '    U.CODIGO > 0')
    Left = 104
    Top = 128
    object QryUsersCODIGO: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QryUsersNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 255
    end
    object QryUsersDATA_NASCIMENTO: TDateField
      FieldName = 'DATA_NASCIMENTO'
      Origin = 'DATA_NASCIMENTO'
      EditMask = '!99/99/9999;1;_'
    end
    object QryUsersEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 255
    end
    object QryUsersFOTO: TStringField
      FieldName = 'FOTO'
      Origin = 'FOTO'
      Size = 255
    end
    object QryUsersATIVO: TSmallintField
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
    end
  end
  object QryDependents: TFDQuery
    CachedUpdates = True
    Connection = FDConnMain
    UpdateOptions.KeyFields = 'CODIGO'
    SQL.Strings = (
      'SELECT '
      '  CODIGO,'
      '  CODIGO_USUARIO,'
      '  NOME,'
      '  IDADE'
      'FROM  '
      '  DEPENDENTES D'
      'WHERE'
      '  D.CODIGO_USUARIO = :CODIGO')
    Left = 224
    Top = 128
    ParamData = <
      item
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    object QryDependentsCODIGO: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QryDependentsCODIGO_USUARIO: TIntegerField
      FieldName = 'CODIGO_USUARIO'
      Origin = 'CODIGO_USUARIO'
    end
    object QryDependentsNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 255
    end
    object QryDependentsIDADE: TSmallintField
      FieldName = 'IDADE'
      Origin = 'IDADE'
    end
  end
end
