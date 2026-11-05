object Form9: TForm9
  Left = 980
  Top = 3
  Width = 260
  Height = 152
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  Caption = #1042#1074#1086#1076'  VIN'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label516: TLabel
    Left = 16
    Top = 63
    Width = 19
    Height = 13
    Caption = #1050#1086#1076
  end
  object Label1: TLabel
    Left = 32
    Top = 135
    Width = 3
    Height = 13
  end
  object Label2: TLabel
    Left = 80
    Top = 64
    Width = 3
    Height = 13
  end
  object Button1: TButton
    Left = 10
    Top = 84
    Width = 79
    Height = 25
    Caption = #1057#1073#1088#1086#1089
    TabOrder = 0
    OnClick = Button1Click
  end
  object GroupBox152: TGroupBox
    Left = 8
    Top = 4
    Width = 225
    Height = 55
    Caption = 'VIN'
    TabOrder = 1
    object Label607: TLabel
      Left = 32
      Top = 8
      Width = 180
      Height = 13
      Caption = #1047#1072#1075#1083#1072#1074#1085#1099#1077' '#1083#1072#1090#1080#1085#1089#1082#1080#1077' 17 '#1089#1080#1084#1074#1086#1083#1086#1074
    end
    object Edit259: TEdit
      Left = 66
      Top = 26
      Width = 42
      Height = 21
      TabOrder = 1
      OnChange = Edit259Change
    end
    object Edit260: TEdit
      Left = 112
      Top = 26
      Width = 20
      Height = 21
      TabOrder = 2
      OnChange = Edit260Change
    end
    object Edit261: TEdit
      Left = 156
      Top = 26
      Width = 50
      Height = 21
      TabOrder = 4
      OnChange = Edit261Change
    end
    object Edit262: TEdit
      Left = 34
      Top = 26
      Width = 28
      Height = 21
      TabOrder = 0
      OnChange = Edit262Change
    end
    object Edit263: TEdit
      Left = 136
      Top = 26
      Width = 16
      Height = 21
      TabOrder = 3
      OnChange = Edit263Change
    end
  end
  object Edit265: TEdit
    Left = 42
    Top = 60
    Width = 27
    Height = 21
    TabOrder = 2
    OnChange = Edit265Change
  end
  object Button64: TButton
    Left = 152
    Top = 84
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    Enabled = False
    TabOrder = 3
    OnClick = Button64Click
  end
end
