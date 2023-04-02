object frmFiltroRelAbastecimentos: TfrmFiltroRelAbastecimentos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Relatorio de Abastecimentos'
  ClientHeight = 211
  ClientWidth = 220
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 220
    Height = 170
    Align = alClient
    Caption = 'Criterios para Gerca'#231#227'o do Relatorio'
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 53
      Height = 13
      Caption = 'Data Inicial'
    end
    object Label2: TLabel
      Left = 120
      Top = 24
      Width = 48
      Height = 13
      Caption = 'Data Final'
    end
    object Label3: TLabel
      Left = 16
      Top = 65
      Width = 36
      Height = 13
      Caption = 'Tanque'
    end
    object Label4: TLabel
      Left = 16
      Top = 109
      Width = 32
      Height = 13
      Caption = 'Bomba'
    end
    object MEDataInicio: TMaskEdit
      Left = 16
      Top = 40
      Width = 88
      Height = 21
      EditMask = '00/00/0000;1; '
      MaxLength = 10
      TabOrder = 0
      Text = '  /  /    '
    end
    object MEDataFim: TMaskEdit
      Left = 120
      Top = 40
      Width = 88
      Height = 21
      EditMask = '00/00/0000;1; '
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
    end
    object DBLkpTanque: TDBLookupComboBox
      Left = 16
      Top = 81
      Width = 192
      Height = 21
      KeyField = 'ID'
      ListField = 'DESCRICAO'
      ListSource = DSTanque
      NullValueKey = 16430
      TabOrder = 2
      OnExit = DBLkpTanqueExit
    end
    object DBLkpBomba: TDBLookupComboBox
      Left = 16
      Top = 125
      Width = 192
      Height = 21
      KeyField = 'ID'
      ListField = 'DESCRICAO'
      ListSource = DSBomba
      TabOrder = 3
    end
  end
  object PnlBar: TPanel
    Left = 0
    Top = 170
    Width = 220
    Height = 41
    Align = alBottom
    Caption = 'PnlBar'
    TabOrder = 1
    object btnImprimir: TButton
      Left = 1
      Top = 1
      Width = 218
      Height = 39
      Align = alClient
      Caption = 'Imprimir'
      TabOrder = 0
      OnClick = btnImprimirClick
    end
  end
  object DSTanque: TDataSource
    Left = 16
    Top = 144
  end
  object DSBomba: TDataSource
    Left = 168
    Top = 144
  end
end
