inherited frmAbastecimentos: TfrmAbastecimentos
  Caption = 'Cadastro de Abastecimenntos'
  ClientHeight = 342
  ClientWidth = 509
  ExplicitWidth = 515
  ExplicitHeight = 371
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlButon: TPanel
    Top = 295
    Width = 509
    ExplicitTop = 295
    ExplicitWidth = 509
    inherited btnNovo: TButton
      Left = 228
      ExplicitLeft = 228
    end
    inherited btnEditar: TButton
      Left = 284
      ExplicitLeft = 284
    end
    inherited btnSalvar: TButton
      Left = 340
      ExplicitLeft = 340
    end
    inherited btnCancelar: TButton
      Left = 396
      ExplicitLeft = 396
    end
    inherited btnExcluir: TButton
      Left = 452
      ExplicitLeft = 452
    end
  end
  object GBoxVisualizacao: TGroupBox [1]
    Tag = 1
    Left = 8
    Top = 99
    Width = 498
    Height = 193
    Caption = ' Visualiza'#231#227'o '
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 2
      Top = 15
      Width = 494
      Height = 176
      Align = alClient
      DataSource = DSBase
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Title.Caption = 'C'#243'digo'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA'
          Title.Caption = 'Dta Abastecimento'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BOMBA'
          Title.Caption = 'Bomba'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LITROS'
          Title.Caption = 'Litros'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR'
          Title.Caption = 'Valor'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IMPOSTO'
          Title.Caption = 'Valor Imposto'
          Width = 80
          Visible = True
        end>
    end
  end
  object GBoxDados: TGroupBox [2]
    Left = 8
    Top = 8
    Width = 497
    Height = 86
    Caption = ' Dados do Abastecimento '
    TabOrder = 2
    object Label1: TLabel
      Left = 99
      Top = 42
      Width = 32
      Height = 13
      Caption = 'Bomba'
    end
    object Label2: TLabel
      Left = 236
      Top = 42
      Width = 26
      Height = 13
      Caption = 'Litros'
    end
    object Label3: TLabel
      Left = 304
      Top = 42
      Width = 24
      Height = 13
      Caption = 'Valor'
    end
    object Label4: TLabel
      Left = 15
      Top = 42
      Width = 23
      Height = 13
      Caption = 'Data'
    end
    object Label5: TLabel
      Left = 388
      Top = 42
      Width = 39
      Height = 13
      Caption = 'Imposto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 92
      Top = 20
      Width = 370
      Height = 16
      Caption = '1 - Para calculo de imposto sera aplicado um percentual de 13%'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object DBLitros: TDBEdit
      Left = 236
      Top = 56
      Width = 58
      Height = 21
      DataField = 'LITROS'
      DataSource = DSBase
      TabOrder = 2
    end
    object DBValor: TDBEdit
      Left = 304
      Top = 56
      Width = 74
      Height = 21
      DataField = 'VALOR'
      DataSource = DSBase
      TabOrder = 3
      OnExit = DBValorExit
    end
    object DBData: TDBEdit
      Left = 15
      Top = 56
      Width = 74
      Height = 21
      DataField = 'DATA'
      DataSource = DSBase
      TabOrder = 0
    end
    object DBImposto: TDBEdit
      Left = 388
      Top = 56
      Width = 74
      Height = 21
      DataField = 'IMPOSTO'
      DataSource = DSBase
      ReadOnly = True
      TabOrder = 4
    end
    object DBLkpBomba: TDBLookupComboBox
      Left = 99
      Top = 56
      Width = 128
      Height = 21
      DataField = 'BOMBA_ID'
      DataSource = DSBase
      KeyField = 'ID'
      ListField = 'DESCRICAO'
      ListSource = DSBomba
      TabOrder = 1
    end
  end
  inherited DSBase: TDataSource
    Left = 16
    Top = 298
  end
  object DSBomba: TDataSource
    Left = 48
    Top = 300
  end
end
