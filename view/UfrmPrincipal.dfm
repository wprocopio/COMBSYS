object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Controle de Abastecimentos'
  ClientHeight = 181
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 48
    Top = 88
    object Cadastros1: TMenuItem
      Caption = '&Cadastros'
      object anque1: TMenuItem
        Caption = '&Tanques'
        OnClick = anque1Click
      end
      object Bombas1: TMenuItem
        Caption = '&Bombas'
        OnClick = Bombas1Click
      end
      object Abastencimentos1: TMenuItem
        Caption = '&Abastencimentos'
        OnClick = Abastencimentos1Click
      end
    end
    object Relatrios1: TMenuItem
      Caption = '&Relat'#243'rios'
      object Abastecimentos1: TMenuItem
        Caption = '&Abastecimentos'
        OnClick = Abastecimentos1Click
      end
    end
  end
end
