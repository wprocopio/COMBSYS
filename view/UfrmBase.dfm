object frmBase: TfrmBase
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmBase'
  ClientHeight = 272
  ClientWidth = 455
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object pnlButon: TPanel
    Left = 0
    Top = 225
    Width = 455
    Height = 47
    Align = alBottom
    TabOrder = 0
    object btnNovo: TButton
      Left = 174
      Top = 1
      Width = 56
      Height = 45
      Align = alRight
      Caption = '&Novo'
      TabOrder = 0
      OnClick = btnNovoClick
    end
    object btnEditar: TButton
      Left = 230
      Top = 1
      Width = 56
      Height = 45
      Align = alRight
      Caption = '&Editar'
      TabOrder = 1
      OnClick = btnEditarClick
    end
    object btnSalvar: TButton
      Left = 286
      Top = 1
      Width = 56
      Height = 45
      Align = alRight
      Caption = '&Salvar'
      TabOrder = 2
      OnClick = btnSalvarClick
    end
    object btnCancelar: TButton
      Left = 342
      Top = 1
      Width = 56
      Height = 45
      Align = alRight
      Caption = '&Cancelar'
      TabOrder = 3
      OnClick = btnCancelarClick
    end
    object btnExcluir: TButton
      Left = 398
      Top = 1
      Width = 56
      Height = 45
      Align = alRight
      Caption = '&Excluir'
      TabOrder = 4
      OnClick = btnExcluirClick
    end
  end
  object DSBase: TDataSource
    OnStateChange = DSBaseStateChange
    Left = 416
    Top = 48
  end
end
