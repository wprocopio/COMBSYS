inherited frmBombas: TfrmBombas
  Caption = 'Cadastro de Bombas'
  ClientHeight = 360
  ClientWidth = 514
  ExplicitWidth = 520
  ExplicitHeight = 389
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlButon: TPanel
    Top = 313
    Width = 514
    inherited btnNovo: TButton
      Left = 233
    end
    inherited btnEditar: TButton
      Left = 289
    end
    inherited btnSalvar: TButton
      Left = 345
    end
    inherited btnCancelar: TButton
      Left = 401
    end
    inherited btnExcluir: TButton
      Left = 457
    end
  end
  object GBDados: TGroupBox [1]
    Left = 8
    Top = 8
    Width = 481
    Height = 73
    Caption = ' Dados da Bomba '
    TabOrder = 1
    object Label4: TLabel
      Left = 15
      Top = 24
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object Label1: TLabel
      Left = 315
      Top = 24
      Width = 36
      Height = 13
      Caption = 'Tanque'
    end
    object DBLkpTanque: TDBLookupComboBox
      Left = 315
      Top = 38
      Width = 150
      Height = 21
      DataField = 'TANQUE_ID'
      DataSource = DSBase
      KeyField = 'ID'
      ListField = 'DESCRICAO'
      ListSource = DSTanque
      TabOrder = 1
    end
    object DBDescricao: TDBEdit
      Left = 15
      Top = 38
      Width = 290
      Height = 21
      CharCase = ecUpperCase
      DataField = 'DESCRICAO'
      DataSource = DSBase
      TabOrder = 0
    end
  end
  object GBVisualizacao: TGroupBox [2]
    Tag = 1
    Left = 8
    Top = 87
    Width = 481
    Height = 197
    Caption = ' Visualiza'#231#227'o '
    TabOrder = 2
    object DBGvizualizacao: TDBGrid
      Left = 2
      Top = 15
      Width = 477
      Height = 180
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
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 350
          Visible = True
        end>
    end
  end
  inherited DSBase: TDataSource
    Left = 144
    Top = 280
  end
  object DSTanque: TDataSource
    Left = 184
    Top = 279
  end
end
