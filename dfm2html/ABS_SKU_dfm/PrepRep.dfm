object FormProtocol: TFormProtocol
  Left = 482
  Top = 92
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1047#1072#1087#1086#1083#1085#1077#1085#1080#1077' '#1087#1088#1086#1090#1086#1082#1086#1083#1072
  ClientHeight = 612
  ClientWidth = 294
  Color = clBtnFace
  DragKind = dkDock
  DragMode = dmAutomatic
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Print: TBitBtn
    Left = 128
    Top = 581
    Width = 75
    Height = 25
    Caption = #1055#1077#1095#1072#1090#1100
    TabOrder = 2
    OnClick = PrintClick
  end
  object GroupBox4: TGroupBox
    Left = 4
    Top = 368
    Width = 289
    Height = 121
    Caption = #1055#1088#1077#1076#1087#1088#1086#1074#1077#1088#1086#1095#1085#1099#1077' '#1091#1089#1083#1086#1074#1080#1103
    TabOrder = 0
    object CB1: TCheckBox
      Left = 10
      Top = 13
      Width = 207
      Height = 17
      Caption = #1090#1088#1072#1085#1089#1087#1086#1088#1090#1085#1086#1077' '#1089#1088#1077#1076#1089#1090#1074#1086' '#1086#1073#1082#1072#1090#1072#1085#1086
      TabOrder = 0
    end
    object CB2: TCheckBox
      Left = 10
      Top = 27
      Width = 207
      Height = 17
      Caption = #1072#1082#1082#1091#1084#1091#1083#1103#1090#1086#1088' '#1080#1089#1087#1088#1072#1074#1077#1085' '#1080' '#1079#1072#1088#1103#1078#1077#1085
      TabOrder = 1
    end
    object CB5: TCheckBox
      Left = 10
      Top = 97
      Width = 263
      Height = 17
      Caption = #1074#1099#1082#1083#1102#1095#1072#1090#1077#1083#1100' '#1087#1088#1080#1073#1086#1088#1086#1074' '#1080' '#1089#1090#1072#1088#1090#1077#1088#1072' '#1074#1099#1082#1083#1102#1095#1077#1085
      TabOrder = 2
    end
    object CB6: TCheckBox
      Left = 10
      Top = 41
      Width = 247
      Height = 17
      Caption = #1087#1088#1077#1076#1086#1093#1088#1072#1085#1080#1090#1077#1083#1080#1089#1080#1089#1090#1077#1084#1099' '#1087#1080#1090#1072#1085#1080#1103' '#1080#1089#1087#1088#1072#1074#1085#1099
      TabOrder = 3
    end
    object CB7: TCheckBox
      Left = 10
      Top = 55
      Width = 217
      Height = 17
      Caption = #1090#1072#1093#1086#1075#1088#1072#1092' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085' '#1080' '#1086#1090#1090#1086#1088#1080#1088#1086#1074#1072#1085
      TabOrder = 4
    end
    object CB3: TCheckBox
      Left = 10
      Top = 83
      Width = 263
      Height = 17
      Caption = #1076#1072#1090#1095#1080#1082#1080' ABS '#1087#1088#1086#1074#1077#1088#1077#1085#1099' '#1087#1086' '#1080#1085#1089#1090#1088#1091#1082#1094#1080#1080
      TabOrder = 5
    end
    object CB0: TCheckBox
      Left = 10
      Top = 69
      Width = 263
      Height = 17
      Caption = #1090#1086#1088#1084#1086#1079#1085#1086#1081' '#1087#1088#1080#1074#1086#1076' '#1087#1088#1086#1074#1077#1088#1077#1085' '#1080' '#1080#1089#1087#1088#1072#1074#1077#1085
      TabOrder = 6
    end
  end
  object Exp: TBitBtn
    Left = 219
    Top = 581
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 3
    OnClick = PrintClick
  end
  object PrnSetup: TBitBtn
    Left = 4
    Top = 581
    Width = 124
    Height = 25
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1087#1088#1080#1085#1090#1077#1088#1072
    TabOrder = 1
    OnClick = PrnSetupClick
  end
  object GroupBox5: TGroupBox
    Left = 4
    Top = 490
    Width = 289
    Height = 54
    Caption = #1055#1088#1086#1074#1077#1088#1082#1072' ABS SKU'
    TabOrder = 4
    object Label12: TLabel
      Left = 168
      Top = 17
      Width = 48
      Height = 13
      Caption = '                '
    end
    object Label13: TLabel
      Left = 230
      Top = 17
      Width = 56
      Height = 13
      Caption = #1074#1099#1087#1086#1083#1085#1077#1085#1072
    end
    object CheckBox4: TCheckBox
      Left = 10
      Top = 17
      Width = 143
      Height = 17
      Caption = #1055#1077#1088#1074#1080#1095#1085#1072#1103' '#1087#1088#1086#1074#1077#1088#1082#1072' '#1087#1086
      TabOrder = 0
    end
    object CheckBox5: TCheckBox
      Left = 10
      Top = 33
      Width = 276
      Height = 17
      Caption = #1054#1082#1086#1085#1095#1072#1090#1077#1083#1100#1085#1072#1103' '#1087#1088#1086#1074#1077#1088#1082#1072' '#1074' '#1076#1074#1080#1078#1077#1085#1080#1080'   '#1074#1099#1087#1086#1083#1085#1077#1085#1072'    '
      TabOrder = 1
    end
  end
  object GroupBox11: TGroupBox
    Left = 4
    Top = 125
    Width = 289
    Height = 121
    Caption = 'Electronic Control Unit'
    TabOrder = 5
    object Label14: TLabel
      Left = 8
      Top = 20
      Width = 78
      Height = 13
      Caption = 'Decimal Number'
    end
    object Label15: TLabel
      Left = 8
      Top = 44
      Width = 66
      Height = 13
      Caption = 'Serial Number'
    end
    object Label16: TLabel
      Left = 8
      Top = 70
      Width = 80
      Height = 13
      Caption = 'Software Version'
    end
    object Label19: TLabel
      Left = 8
      Top = 94
      Width = 67
      Height = 13
      Caption = 'Software CRC'
    end
    object Edit6: TEdit
      Left = 104
      Top = 16
      Width = 177
      Height = 21
      TabOrder = 0
    end
    object Edit7: TEdit
      Left = 104
      Top = 40
      Width = 177
      Height = 21
      TabOrder = 1
    end
    object Edit8: TEdit
      Left = 104
      Top = 64
      Width = 177
      Height = 21
      TabOrder = 2
    end
    object Edit9: TEdit
      Left = 104
      Top = 88
      Width = 177
      Height = 21
      TabOrder = 3
    end
  end
  object GroupBox12: TGroupBox
    Left = 4
    Top = 50
    Width = 289
    Height = 73
    Caption = 'Vehicle Data'
    TabOrder = 6
    object Label20: TLabel
      Left = 8
      Top = 20
      Width = 18
      Height = 13
      Caption = 'VIN'
    end
    object Label21: TLabel
      Left = 8
      Top = 44
      Width = 60
      Height = 13
      Caption = 'Modification '
    end
    object Edit10: TEdit
      Left = 104
      Top = 16
      Width = 177
      Height = 21
      TabOrder = 0
    end
    object Edit11: TEdit
      Left = 104
      Top = 40
      Width = 177
      Height = 21
      TabOrder = 1
    end
  end
  object GroupBox13: TGroupBox
    Left = 4
    Top = 250
    Width = 289
    Height = 95
    Caption = 'Commissioning'
    TabOrder = 7
    object Label22: TLabel
      Left = 8
      Top = 20
      Width = 95
      Height = 13
      Caption = 'Authorized Surname'
    end
    object Label23: TLabel
      Left = 8
      Top = 68
      Width = 95
      Height = 13
      Caption = 'Commissioning Date'
    end
    object Label2: TLabel
      Left = 8
      Top = 44
      Width = 81
      Height = 13
      Caption = 'Authorized  Code'
    end
    object Edit12: TEdit
      Left = 106
      Top = 16
      Width = 177
      Height = 21
      TabOrder = 0
    end
    object Edit13: TEdit
      Left = 106
      Top = 64
      Width = 177
      Height = 21
      TabOrder = 1
    end
    object Edit2: TEdit
      Left = 106
      Top = 40
      Width = 177
      Height = 21
      TabOrder = 2
    end
  end
  object GroupBox1: TGroupBox
    Left = 4
    Top = 6
    Width = 289
    Height = 41
    TabOrder = 8
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 63
      Height = 13
      Caption = 'Report Name'
    end
    object Edit1: TEdit
      Left = 104
      Top = 12
      Width = 177
      Height = 21
      TabOrder = 0
    end
  end
  object SD1: TSaveDialog
    DefaultExt = 'doc'
    Filter = 'Documents|*.doc'
    Left = 40
    Top = 552
  end
  object PrnSetupDialog: TPrinterSetupDialog
    Left = 8
    Top = 552
  end
end
