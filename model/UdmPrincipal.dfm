object DmPrincipal: TDmPrincipal
  OldCreateOrder = False
  Height = 279
  Width = 512
  object FDCConection: TFDConnection
    Params.Strings = (
      'Database=C:\fortes\COMBSYS\db\COMBSYS.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Transaction = FDTConection
    Left = 48
    Top = 32
  end
  object FDTConection: TFDTransaction
    Connection = FDCConection
    Left = 48
    Top = 88
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 48
    Top = 136
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 48
    Top = 192
  end
  object FDQBombas: TFDQuery
    Connection = FDCConection
    SQL.Strings = (
      'select * from bombas')
    Left = 192
    Top = 112
    object FDQBombasID: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'Id'
      FieldName = 'ID'
      Origin = 'ID'
    end
    object FDQBombasDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 30
    end
    object FDQBombasTANQUE_ID: TIntegerField
      DisplayLabel = 'Id Tanque'
      FieldName = 'TANQUE_ID'
      Origin = 'TANQUE_ID'
      Required = True
    end
  end
  object FDQTanques: TFDQuery
    Connection = FDCConection
    SQL.Strings = (
      'select * from tanques')
    Left = 192
    Top = 56
    object FDQTanquesID: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'Id'
      FieldName = 'ID'
      Origin = 'ID'
    end
    object FDQTanquesDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 30
    end
  end
  object FDQAbastecimentos: TFDQuery
    OnCalcFields = FDQAbastecimentosCalcFields
    Connection = FDCConection
    SQL.Strings = (
      'select * from abastecimentos')
    Left = 192
    Top = 160
    object FDQAbastecimentosID: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'Id'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQAbastecimentosDATA: TDateField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      Origin = '"DATA"'
      Required = True
      EditMask = '00/00/0000;1; '
    end
    object FDQAbastecimentosBOMBA_ID: TIntegerField
      DisplayLabel = 'Id Bomba'
      FieldName = 'BOMBA_ID'
      Origin = 'BOMBA_ID'
      Required = True
    end
    object FDQAbastecimentosLITROS: TFMTBCDField
      DisplayLabel = 'Litros'
      FieldName = 'LITROS'
      Origin = 'LITROS'
      Required = True
      DisplayFormat = '###,###,##0.00 L'
      EditFormat = '###,###,##0.00 L'
      Precision = 18
      Size = 2
    end
    object FDQAbastecimentosBOMBA: TStringField
      DisplayLabel = 'Bomba'
      FieldKind = fkCalculated
      FieldName = 'BOMBA'
      Size = 30
      Calculated = True
    end
    object FDQAbastecimentosVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Required = True
      DisplayFormat = 'R$ ###,###,##0.00'
      EditFormat = 'R$ ###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object FDQAbastecimentosIMPOSTO: TFMTBCDField
      FieldName = 'IMPOSTO'
      Origin = 'IMPOSTO'
      Required = True
      DisplayFormat = 'R$ ###,###,##0.00'
      EditFormat = 'R$ ###,###,##0.00'
      Precision = 18
      Size = 2
    end
  end
end
