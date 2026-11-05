object FormPath: TFormPath
  Left = 260
  Top = 194
  Width = 424
  Height = 191
  BorderIcons = [biSystemMenu]
  Caption = 'Настройка'
  Color = clBtnFace
  DragKind = dkDock
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 401
    Height = 105
    Caption = 'Путь к папкам'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 95
      Height = 13
      Caption = 'Папка для отчетов'
    end
    object btnView: TButton
      Left = 312
      Top = 48
      Width = 75
      Height = 25
      Caption = 'Обзор...'
      TabOrder = 0
      OnClick = btnViewClick
    end
    object cbPath: TEdit
      Left = 8
      Top = 48
      Width = 289
      Height = 21
      TabOrder = 1
    end
  end
  object btnOk: TButton
    Left = 104
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 1
    OnClick = btnOkClick
  end
  object btnClose: TButton
    Left = 232
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Отмена'
    TabOrder = 2
    OnClick = btnCloseClick
  end
end
