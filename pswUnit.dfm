object pswForm: TpswForm
  Left = 511
  Top = 278
  BorderStyle = bsDialog
  Caption = 'ѕароль'
  ClientHeight = 135
  ClientWidth = 251
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 121
    Height = 13
    Caption = '¬ведите старый пароль'
  end
  object Label2: TLabel
    Left = 16
    Top = 72
    Width = 116
    Height = 13
    Caption = '¬ведите новый пароль'
  end
  object Button1: TButton
    Left = 160
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 0
    OnClick = Button1Click
  end
  object oldPSW: TEdit
    Left = 24
    Top = 32
    Width = 105
    Height = 21
    TabOrder = 1
  end
  object newPSW: TEdit
    Left = 24
    Top = 96
    Width = 105
    Height = 21
    TabOrder = 2
  end
  object Button2: TButton
    Left = 160
    Top = 64
    Width = 75
    Height = 25
    Caption = 'ќтмена'
    TabOrder = 3
    OnClick = Button2Click
  end
end
