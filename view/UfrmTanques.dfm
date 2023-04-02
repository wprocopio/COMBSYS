inherited frmTanques: TfrmTanques
  Caption = 'Cadastro De Tanques'
  ClientHeight = 353
  ClientWidth = 489
  ExplicitWidth = 495
  ExplicitHeight = 382
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlButon: TPanel
    Top = 306
    Width = 489
    ExplicitTop = 306
    ExplicitWidth = 466
    inherited btnNovo: TButton
      Left = 208
      ExplicitLeft = 185
    end
    inherited btnEditar: TButton
      Left = 264
      ExplicitLeft = 241
    end
    inherited btnSalvar: TButton
      Left = 320
      ExplicitLeft = 297
    end
    inherited btnCancelar: TButton
      Left = 376
      ExplicitLeft = 353
    end
    inherited btnExcluir: TButton
      Left = 432
      ExplicitLeft = 409
    end
  end
  object GBVisualizacao: TGroupBox [1]
    Tag = 1
    Left = 1
    Top = 87
    Width = 481
    Height = 197
    Caption = ' Visualiza'#231#227'o '
    TabOrder = 1
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
          Width = 400
          Visible = True
        end>
    end
  end
  object GBDados: TGroupBox [2]
    Left = 1
    Top = 8
    Width = 481
    Height = 73
    Caption = ' Dados do Tanque'
    TabOrder = 2
    object Label4: TLabel
      Left = 8
      Top = 24
      Width = 62
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object DBDesc: TDBEdit
      Left = 8
      Top = 38
      Width = 466
      Height = 21
      CharCase = ecUpperCase
      DataField = 'DESCRICAO'
      DataSource = DSBase
      TabOrder = 0
    end
  end
  inherited DSBase: TDataSource
    Left = 8
    Top = 320
  end
end
