object rptRelAbasteciemntos: TrptRelAbasteciemntos
  Left = 0
  Top = 0
  Caption = 'Relatorio de Abastecimentos'
  ClientHeight = 336
  ClientWidth = 774
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport1: TRLReport
    Left = 8
    Top = 0
    Width = 794
    Height = 1123
    DataSource = DSRpt
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 63
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Borders.FixedBottom = True
      object RLLabel7: TRLLabel
        Left = 3
        Top = 42
        Width = 88
        Height = 16
        Caption = 'RELAT'#211'RIO:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLTit: TRLLabel
        Left = 95
        Top = 42
        Width = 304
        Height = 16
        Caption = 'RELAT'#211'RIO DE ABASTECIMENTOS - PERIODO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel5: TRLLabel
        Left = 19
        Top = 23
        Width = 72
        Height = 16
        Caption = 'SISTEMA:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel12: TRLLabel
        Left = 95
        Top = 23
        Width = 304
        Height = 16
        Caption = 'SISTEMA DE CONTROLE DE ABASTECIMENTOS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel18: TRLLabel
        Left = 19
        Top = 5
        Width = 72
        Height = 16
        Caption = 'CLIENTE:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLEnt: TRLLabel
        Left = 95
        Top = 5
        Width = 200
        Height = 16
        Caption = 'POSTO FORTES INFORMATICA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
      object RLLDtHora: TRLLabel
        Left = 461
        Top = 3
        Width = 83
        Height = 16
        Caption = 'Data/Hora:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLSysData: TRLSystemInfo
        Left = 547
        Top = 3
        Width = 56
        Height = 16
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLSysHora: TRLSystemInfo
        Left = 659
        Top = 3
        Width = 56
        Height = 16
        Alignment = taRightJustify
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        Info = itHour
        ParentFont = False
        Text = ''
      end
      object RLLabel39: TRLLabel
        Left = 528
        Top = 41
        Width = 56
        Height = 16
        Caption = 'P'#225'gina'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 588
        Top = 41
        Width = 104
        Height = 16
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        Info = itPageNumber
        ParentFont = False
        Text = ''
      end
      object RLLabel38: TRLLabel
        Left = 614
        Top = 41
        Width = 24
        Height = 16
        Caption = 'de'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 642
        Top = 41
        Width = 73
        Height = 16
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        Info = itLastPageNumber
        ParentFont = False
        Text = ''
      end
    end
    object RLGroup1: TRLGroup
      Left = 38
      Top = 101
      Width = 718
      Height = 87
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Borders.FixedBottom = True
      DataFields = 'DATA'
      object RLBand2: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 49
        BeforePrint = RLBand2BeforePrint
        object RLLabel1: TRLLabel
          Left = 0
          Top = 0
          Width = 91
          Height = 16
          Caption = 'Data Abastec.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText1: TRLDBText
          Left = 0
          Top = 16
          Width = 89
          Height = 16
          AutoSize = False
          DataField = 'DATA'
          DataSource = DSRpt
          Text = ''
        end
        object RLDBText2: TRLDBText
          Left = 99
          Top = 16
          Width = 89
          Height = 16
          AutoSize = False
          DataField = 'TANQUE'
          DataSource = DSRpt
          Text = ''
        end
        object RLLabel2: TRLLabel
          Left = 99
          Top = 0
          Width = 52
          Height = 16
          Caption = 'Tanque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel3: TRLLabel
          Left = 198
          Top = 0
          Width = 49
          Height = 16
          Caption = 'Bomba'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText3: TRLDBText
          Left = 198
          Top = 16
          Width = 89
          Height = 16
          AutoSize = False
          DataField = 'BOMBA'
          DataSource = DSRpt
          Text = ''
        end
        object RLLabel4: TRLLabel
          Left = 297
          Top = 0
          Width = 39
          Height = 16
          Caption = 'Litros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText4: TRLDBText
          Left = 297
          Top = 16
          Width = 89
          Height = 16
          AutoSize = False
          DataField = 'LITROS'
          DataSource = DSRpt
          Text = ''
        end
        object RLLabel9: TRLLabel
          Left = 396
          Top = 0
          Width = 38
          Height = 16
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText5: TRLDBText
          Left = 396
          Top = 16
          Width = 89
          Height = 16
          AutoSize = False
          DataField = 'VALOR'
          DataSource = DSRpt
          Text = ''
        end
        object RLLabel15: TRLLabel
          Left = 498
          Top = 0
          Width = 82
          Height = 16
          Caption = 'Imposto 13%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText6: TRLDBText
          Left = 495
          Top = 16
          Width = 89
          Height = 16
          AutoSize = False
          DataField = 'IMPOSTO'
          DataSource = DSRpt
          Text = ''
        end
      end
      object RLBand3: TRLBand
        Left = 0
        Top = 49
        Width = 718
        Height = 39
        BandType = btSummary
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = True
        Borders.FixedTop = True
        Borders.FixedBottom = True
        object rlResultValor: TRLDBResult
          Left = 327
          Top = 12
          Width = 89
          Height = 16
          AutoSize = False
          DataField = 'VALOR_ABASTECIDO'
          DataSource = DSRpt
          DisplayMask = 'R$ ,0.00'
          Info = riSum
          Text = ''
          OnCompute = rlResultValorCompute
        end
        object RLLabel6: TRLLabel
          Left = 285
          Top = 12
          Width = 42
          Height = 16
          Caption = 'Valor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel10: TRLLabel
          Left = 3
          Top = 6
          Width = 91
          Height = 19
          Caption = 'Total Diario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel13: TRLLabel
          Left = 426
          Top = 12
          Width = 58
          Height = 16
          Caption = 'Imposto:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rlResultImposto: TRLDBResult
          Left = 484
          Top = 12
          Width = 89
          Height = 16
          AutoSize = False
          DataField = 'VALOR_IMPOSTO'
          DataSource = DSRpt
          DisplayMask = 'R$ ,0.00'
          Info = riSum
          Text = ''
          OnCompute = rlResultImpostoCompute
        end
        object RLLabel16: TRLLabel
          Left = 147
          Top = 12
          Width = 43
          Height = 16
          Caption = 'Litros:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rlResultLitros: TRLDBResult
          Left = 190
          Top = 12
          Width = 89
          Height = 16
          AutoSize = False
          DataField = 'LITROS'
          DataSource = DSRpt
          DisplayMask = '0.00 L'
          Info = riSum
          Text = ''
          OnCompute = rlResultLitrosCompute
        end
      end
    end
    object RLBand4: TRLBand
      Left = 38
      Top = 188
      Width = 718
      Height = 93
      BandType = btSummary
      BeforePrint = RLBand4BeforePrint
      object RLLabel11: TRLLabel
        Left = 0
        Top = 46
        Width = 136
        Height = 19
        Caption = 'Total por Periodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel8: TRLLabel
        Left = 442
        Top = 44
        Width = 42
        Height = 16
        Caption = 'Valor:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel14: TRLLabel
        Left = 426
        Top = 68
        Width = 58
        Height = 16
        Caption = 'Imposto:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLTotPerValor: TRLLabel
        Left = 484
        Top = 44
        Width = 89
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
      end
      object RLLTotPerImposto: TRLLabel
        Left = 484
        Top = 68
        Width = 89
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
      end
      object RLLabel17: TRLLabel
        Left = 441
        Top = 17
        Width = 43
        Height = 16
        Caption = 'Litros:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLTotPerLitros: TRLLabel
        Left = 484
        Top = 17
        Width = 89
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
      end
    end
  end
  object FDQRptRel: TFDQuery
    Left = 509
    Top = 496
  end
  object DSRpt: TDataSource
    DataSet = FDQRptRel
    Left = 509
    Top = 504
  end
end
