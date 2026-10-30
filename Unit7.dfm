object Form7: TForm7
  Left = 975
  Top = 105
  Width = 173
  Height = 514
  Caption = #1059#1089#1090#1072#1074#1082#1080' '#1057#1090#1077#1085#1076#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 0
    Width = 153
    Height = 65
    Caption = #1044#1072#1090#1095#1080#1082#1080
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 14
      Height = 13
      Caption = 'AT'
    end
    object Label2: TLabel
      Left = 48
      Top = 16
      Width = 14
      Height = 13
      Caption = 'PT'
    end
    object Label3: TLabel
      Left = 72
      Top = 16
      Width = 15
      Height = 13
      Caption = 'GT'
    end
    object Label4: TLabel
      Left = 96
      Top = 16
      Width = 31
      Height = 13
      Caption = 'Speed'
    end
    object Edit1: TEdit
      Left = 8
      Top = 32
      Width = 25
      Height = 21
      TabOrder = 0
      Text = '124'
      OnChange = Edit1Change
    end
    object Edit2: TEdit
      Left = 40
      Top = 32
      Width = 25
      Height = 21
      TabOrder = 1
      Text = '125'
      OnChange = Edit1Change
    end
    object Edit3: TEdit
      Left = 72
      Top = 32
      Width = 25
      Height = 21
      TabOrder = 2
      Text = '10'
      OnChange = Edit1Change
    end
    object Edit4: TEdit
      Left = 104
      Top = 32
      Width = 25
      Height = 21
      TabOrder = 3
      Text = '30'
      OnChange = Edit1Change
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 72
    Width = 153
    Height = 137
    Caption = #1051#1072#1084#1087#1099' '#1050#1085#1086#1087#1082#1080'  On      Off'
    TabOrder = 1
    object Label9: TLabel
      Left = 24
      Top = 16
      Width = 53
      Height = 13
      Caption = 'ABS_Lamp'
    end
    object Label10: TLabel
      Left = 24
      Top = 40
      Width = 54
      Height = 13
      Caption = 'ASR_Lamp'
    end
    object Label11: TLabel
      Left = 16
      Top = 66
      Width = 42
      Height = 13
      Caption = 'ABS_Sw'
    end
    object Label12: TLabel
      Left = 16
      Top = 90
      Width = 43
      Height = 13
      Caption = 'ASR_Sw'
    end
    object Label13: TLabel
      Left = 8
      Top = 114
      Width = 49
      Height = 13
      Caption = 'TSET_Sw'
    end
    object Edit5: TEdit
      Left = 80
      Top = 16
      Width = 25
      Height = 21
      TabOrder = 0
      Text = '5'
      OnChange = Edit1Change
    end
    object Edit6: TEdit
      Left = 80
      Top = 40
      Width = 25
      Height = 21
      TabOrder = 1
      Text = '5'
      OnChange = Edit1Change
    end
    object Edit7: TEdit
      Left = 112
      Top = 16
      Width = 33
      Height = 21
      TabOrder = 2
      Text = '126'
      OnChange = Edit1Change
    end
    object Edit8: TEdit
      Left = 112
      Top = 36
      Width = 33
      Height = 21
      TabOrder = 3
      Text = '134'
      OnChange = Edit1Change
    end
    object Edit9: TEdit
      Left = 64
      Top = 62
      Width = 33
      Height = 21
      TabOrder = 4
      Text = '127'
      OnChange = Edit1Change
    end
    object Edit10: TEdit
      Left = 64
      Top = 86
      Width = 33
      Height = 21
      TabOrder = 5
      Text = '120'
      OnChange = Edit1Change
    end
    object Edit11: TEdit
      Left = 64
      Top = 110
      Width = 33
      Height = 21
      TabOrder = 6
      Text = '129'
      OnChange = Edit1Change
    end
  end
  object GroupBox4: TGroupBox
    Left = 8
    Top = 216
    Width = 145
    Height = 65
    Caption = #1055#1080#1090#1072#1085#1080#1077
    TabOrder = 2
    object Label16: TLabel
      Left = 56
      Top = 16
      Width = 25
      Height = 13
      Caption = 'KL15'
    end
    object Label17: TLabel
      Left = 56
      Top = 40
      Width = 25
      Height = 13
      Caption = 'KL30'
    end
    object Edit12: TEdit
      Left = 88
      Top = 12
      Width = 33
      Height = 21
      TabOrder = 0
      Text = '150'
      OnChange = Edit1Change
    end
    object Edit13: TEdit
      Left = 88
      Top = 36
      Width = 33
      Height = 21
      TabOrder = 1
      Text = '150'
      OnChange = Edit1Change
    end
  end
  object GroupBox5: TGroupBox
    Left = 8
    Top = 288
    Width = 145
    Height = 113
    Caption = '                On            Off'
    TabOrder = 3
    object Label18: TLabel
      Left = 16
      Top = 20
      Width = 23
      Height = 13
      Caption = 'DBR'
    end
    object Label24: TLabel
      Left = 16
      Top = 40
      Width = 17
      Height = 13
      Caption = 'DIF'
    end
    object Label5: TLabel
      Left = 16
      Top = 84
      Width = 14
      Height = 13
      Caption = 'PK'
    end
    object Label6: TLabel
      Left = 8
      Top = 60
      Width = 28
      Height = 13
      Caption = 'GndD'
    end
    object Edit14: TEdit
      Left = 48
      Top = 16
      Width = 25
      Height = 21
      TabOrder = 0
      Text = '0'
      OnChange = Edit1Change
    end
    object Edit15: TEdit
      Left = 48
      Top = 36
      Width = 33
      Height = 21
      TabOrder = 1
      Text = '148'
      OnChange = Edit1Change
    end
    object Edit16: TEdit
      Left = 48
      Top = 60
      Width = 25
      Height = 21
      TabOrder = 2
      Text = '1'
      OnChange = Edit1Change
    end
    object Edit17: TEdit
      Left = 48
      Top = 84
      Width = 33
      Height = 21
      TabOrder = 3
      Text = '148'
      OnChange = Edit1Change
    end
    object Edit18: TEdit
      Left = 96
      Top = 16
      Width = 33
      Height = 21
      TabOrder = 4
      Text = '147'
      OnChange = Edit1Change
    end
    object Edit19: TEdit
      Left = 96
      Top = 36
      Width = 25
      Height = 21
      TabOrder = 5
      Text = '2'
      OnChange = Edit1Change
    end
    object Edit20: TEdit
      Left = 96
      Top = 60
      Width = 33
      Height = 21
      TabOrder = 6
      Text = '145'
      OnChange = Edit1Change
    end
    object Edit21: TEdit
      Left = 96
      Top = 84
      Width = 25
      Height = 21
      TabOrder = 7
      Text = '2'
      OnChange = Edit1Change
    end
  end
  object GroupBox8: TGroupBox
    Left = 5
    Top = 408
    Width = 148
    Height = 65
    Caption = #1052#1086#1076#1091#1083#1103#1090#1086#1088#1099'  '
    TabOrder = 4
    object Label32: TLabel
      Left = 16
      Top = 16
      Width = 14
      Height = 13
      Caption = 'AV'
    end
    object Label33: TLabel
      Left = 48
      Top = 16
      Width = 14
      Height = 13
      Caption = 'EV'
    end
    object Label34: TLabel
      Left = 72
      Top = 16
      Width = 16
      Height = 13
      Caption = 'St1'
    end
    object Label35: TLabel
      Left = 104
      Top = 16
      Width = 16
      Height = 13
      Caption = 'St2'
    end
    object Edit22: TEdit
      Left = 8
      Top = 32
      Width = 25
      Height = 21
      TabOrder = 0
      Text = '70'
      OnChange = Edit1Change
    end
    object Edit23: TEdit
      Left = 40
      Top = 32
      Width = 25
      Height = 21
      TabOrder = 1
      Text = '70'
      OnChange = Edit1Change
    end
    object Edit24: TEdit
      Left = 72
      Top = 32
      Width = 25
      Height = 21
      TabOrder = 2
      Text = '8'
      OnChange = Edit1Change
    end
    object Edit25: TEdit
      Left = 104
      Top = 32
      Width = 25
      Height = 21
      TabOrder = 3
      Text = '2'
      OnChange = Edit1Change
    end
  end
end
