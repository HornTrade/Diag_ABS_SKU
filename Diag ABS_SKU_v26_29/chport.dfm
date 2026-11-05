object ChoicePort: TChoicePort
  Left = 949
  Top = 94
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072
  ClientHeight = 505
  ClientWidth = 249
  Color = clBtnFace
  DragMode = dmAutomatic
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
  object Button1: TButton
    Left = 24
    Top = 464
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 120
    Top = 464
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    OnClick = Button2Click
  end
  object gbPort: TGroupBox
    Left = 8
    Top = 264
    Width = 225
    Height = 193
    Caption = #1042#1099#1073#1086#1088' '#1087#1086#1088#1090#1072
    TabOrder = 2
    object Label1: TLabel
      Left = 40
      Top = 148
      Width = 24
      Height = 13
      Caption = 'COM'
    end
    object RB1: TRadioButton
      Left = 16
      Top = 24
      Width = 113
      Height = 17
      Caption = #1055#1086#1088#1090' COM1'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object RB2: TRadioButton
      Left = 16
      Top = 56
      Width = 113
      Height = 17
      Caption = #1055#1086#1088#1090' COM2'
      TabOrder = 1
    end
    object RB3: TRadioButton
      Left = 16
      Top = 88
      Width = 113
      Height = 17
      Caption = #1055#1086#1088#1090' COM3'
      TabOrder = 2
    end
    object RB4: TRadioButton
      Left = 16
      Top = 120
      Width = 113
      Height = 17
      Caption = #1055#1086#1088#1090' COM4'
      TabOrder = 3
    end
    object Edit1: TEdit
      Left = 72
      Top = 144
      Width = 25
      Height = 21
      TabOrder = 4
    end
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 120
    Width = 225
    Height = 129
    Caption = #1057#1082#1086#1088#1086#1089#1090#1100
    TabOrder = 3
    object RB_S1: TRadioButton
      Left = 16
      Top = 24
      Width = 113
      Height = 17
      Caption = '38400'
      TabOrder = 0
    end
    object RB_S2: TRadioButton
      Left = 16
      Top = 48
      Width = 113
      Height = 17
      Caption = '57600'
      TabOrder = 1
    end
    object RB_S3: TRadioButton
      Left = 16
      Top = 72
      Width = 113
      Height = 17
      Caption = '100000'
      TabOrder = 2
    end
    object RB_S4: TRadioButton
      Left = 16
      Top = 96
      Width = 113
      Height = 17
      Caption = '115200'
      Checked = True
      TabOrder = 3
      TabStop = True
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 16
    Width = 225
    Height = 97
    Caption = #1040#1076#1072#1087#1090#1077#1088
    TabOrder = 4
    object RB_A1: TRadioButton
      Left = 16
      Top = 24
      Width = 113
      Height = 17
      Caption = 'COM'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object RB_A2: TRadioButton
      Left = 16
      Top = 48
      Width = 113
      Height = 17
      Caption = 'USB/COM'
      TabOrder = 1
    end
    object RB_A3: TRadioButton
      Left = 16
      Top = 72
      Width = 113
      Height = 17
      Caption = 'USB Stend'
      TabOrder = 2
    end
  end
end
