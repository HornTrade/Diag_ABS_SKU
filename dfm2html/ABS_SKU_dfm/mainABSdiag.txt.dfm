object Form1: TForm1
  Left = 693
  Top = 10
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 
    #1044#1080#1072#1075#1085#1086#1089#1090#1080#1082#1072' '#1072#1085#1090#1080#1073#1083#1086#1082#1080#1088#1086#1074#1086#1095#1085#1086#1081' '#1089#1080#1089#1090#1077#1084#1099' '#1090#1086#1088#1084#1086#1079#1086#1074'                  ' +
    '                           v25.28'
  ClientHeight = 585
  ClientWidth = 668
  Color = clBtnFace
  DragMode = dmAutomatic
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = hk
  PixelsPerInch = 96
  TextHeight = 13
  object LampABS: TSpeedButton
    Left = 532
    Top = 0
    Width = 25
    Height = 25
    Cursor = crHandPoint
    AllowAllUp = True
    GroupIndex = 2
    OnClick = LampABSClick
  end
  object Label602: TLabel
    Left = 534
    Top = 24
    Width = 21
    Height = 13
    Caption = 'ABS'
  end
  object LampASR: TSpeedButton
    Left = 566
    Top = 0
    Width = 25
    Height = 25
    Cursor = crHandPoint
    AllowAllUp = True
    GroupIndex = 3
    OnClick = LampASRClick
  end
  object Label603: TLabel
    Left = 567
    Top = 24
    Width = 22
    Height = 13
    Caption = 'ASR'
  end
  object LampVDC: TSpeedButton
    Left = 600
    Top = 0
    Width = 25
    Height = 25
    Cursor = crHandPoint
    AllowAllUp = True
    GroupIndex = 2
    OnClick = LampVDCClick
  end
  object Label604: TLabel
    Left = 601
    Top = 24
    Width = 22
    Height = 13
    Caption = 'VDC'
  end
  object Label646: TLabel
    Left = 384
    Top = 208
    Width = 12
    Height = 13
    Caption = 'Lo'
  end
  object MainStatBar: TStatusBar
    Left = 0
    Top = 560
    Width = 668
    Height = 25
    Anchors = [akLeft]
    Panels = <
      item
        Width = 620
      end
      item
        Width = 50
      end>
    SizeGrip = False
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 241
    Height = 46
    Align = alNone
    ButtonHeight = 38
    ButtonWidth = 39
    Caption = 'ToolBar1'
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Images = IL3
    TabOrder = 1
    object BtnQuit: TToolButton
      Left = 0
      Top = 2
      Hint = #1042#1099#1093#1086#1076
      Caption = #1042#1099#1093#1086#1076
      ImageIndex = 0
      ParentShowHint = False
      ShowHint = True
      OnClick = BtnQuitClick
    end
    object BtnStart: TToolButton
      Left = 39
      Top = 2
      Hint = #1057#1090#1072#1088#1090
      Caption = #1057#1090#1072#1088#1090
      ImageIndex = 1
      ParentShowHint = False
      ShowHint = True
      OnClick = BtnStartClick
    end
    object BtnStop: TToolButton
      Left = 78
      Top = 2
      Hint = #1057#1090#1086#1087
      Caption = #1057#1090#1086#1087
      Enabled = False
      ImageIndex = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = BtnStopClick
    end
    object btnParametr: TToolButton
      Left = 117
      Top = 2
      Hint = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1089#1080#1089#1090#1077#1084#1099
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1080#1079#1072#1094#1080#1103
      Enabled = False
      ImageIndex = 4
      ParentShowHint = False
      ShowHint = True
      OnClick = btnParametrClick
    end
    object BtnOtchet: TToolButton
      Left = 156
      Top = 2
      Hint = #1057#1086#1079#1076#1072#1090#1100' '#1086#1090#1095#1077#1090
      Caption = 'BtnOtchet'
      ImageIndex = 3
      ParentShowHint = False
      ShowHint = True
      OnClick = BtnOtchetClick
    end
    object KeyButton: TToolButton
      Left = 195
      Top = 2
      Hint = ' '#1044#1086#1089#1090#1091#1087' '#1082' '#1089#1080#1089#1090#1077#1084#1085#1099#1084' '#1092#1091#1085#1082#1094#1080#1103#1084' '
      Enabled = False
      ImageIndex = 5
      ParentShowHint = False
      ShowHint = True
      OnClick = KeyButtonClick
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 46
    Width = 668
    Height = 514
    ActivePage = TabSheet8
    Align = alBottom
    MultiLine = True
    TabOrder = 2
    OnChange = PageControl1Change
    object DataSheet: TTabSheet
      Caption = #1044#1072#1085#1085#1099#1077' ABS'
      object GroupBox5: TGroupBox
        Left = 8
        Top = 296
        Width = 409
        Height = 161
        Caption = #1069#1082#1089#1087#1083#1091#1072#1090#1072#1094#1080#1086#1085#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103
        TabOrder = 0
        object LProbeg: TLabel
          Left = 16
          Top = 24
          Width = 137
          Height = 13
          Caption = #1054#1073#1097#1080#1081' '#1087#1088#1086#1073#1077#1075' '#1072#1074#1090#1086#1084#1086#1073#1080#1083#1103
          OnClick = LProbegClick
        end
        object LLastProbeg: TLabel
          Left = 16
          Top = 88
          Width = 214
          Height = 13
          Caption = #1055#1088#1086#1073#1077#1075' '#1072#1074#1090#1086#1084#1086#1073#1080#1083#1103' '#1087#1086#1089#1083#1077' '#1087#1086#1089#1083#1077#1076#1085#1077#1075#1086' '#1058#1054
          Visible = False
        end
        object Label34: TLabel
          Left = 304
          Top = 24
          Width = 86
          Height = 13
          Caption = #1053#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
          OnDblClick = Label34DblClick
        end
        object Label35: TLabel
          Left = 304
          Top = 88
          Width = 86
          Height = 13
          Caption = #1053#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
          Visible = False
        end
        object Label18: TLabel
          Left = 16
          Top = 56
          Width = 270
          Height = 13
          Caption = #1050#1086#1076' '#1083#1080#1094#1072', '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1074#1096#1077#1075#1086' '#1087#1072#1088#1072#1084#1077#1090#1088#1080#1088#1086#1074#1072#1085#1080#1077' '#1073#1083#1086#1082#1072
        end
        object Label30: TLabel
          Left = 304
          Top = 56
          Width = 86
          Height = 13
          Caption = #1053#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
        end
        object Label19: TLabel
          Left = 16
          Top = 72
          Width = 221
          Height = 13
          Caption = #1044#1072#1090#1072' '#1087#1086#1089#1083#1077#1076#1085#1077#1075#1086' '#1087#1072#1088#1072#1084#1077#1090#1088#1080#1088#1086#1074#1072#1085#1080#1103' '#1073#1083#1086#1082#1072
        end
        object Label31: TLabel
          Left = 304
          Top = 72
          Width = 86
          Height = 13
          Caption = #1053#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
        end
        object Label92: TLabel
          Left = 16
          Top = 40
          Width = 94
          Height = 13
          Caption = #1054#1073#1097#1072#1103' '#1085#1072#1088#1072#1073#1086#1090#1082#1072' '
        end
        object Label93: TLabel
          Left = 304
          Top = 40
          Width = 86
          Height = 13
          Caption = #1053#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
        end
        object Label149: TLabel
          Left = 16
          Top = 136
          Width = 236
          Height = 13
          Caption = #1069#1092#1092#1077#1082#1090#1080#1085#1086#1089#1090#1100' '#1087#1086#1089#1083#1077#1076#1085#1077#1075#1086' '#1090#1086#1088#1084#1086#1078#1077#1085#1080#1103' '#1089' ABS'
          Visible = False
          OnDblClick = Label156DblClick
        end
        object Label156: TLabel
          Left = 304
          Top = 136
          Width = 86
          Height = 13
          Caption = #1053#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
          Visible = False
          OnDblClick = Label156DblClick
        end
        object Label160: TLabel
          Left = 16
          Top = 120
          Width = 144
          Height = 13
          Caption = #1069#1092#1092#1077#1082#1090#1080#1085#1086#1089#1090#1100'  '#1090#1086#1088#1084#1086#1078#1077#1085#1080#1103
          Visible = False
          OnDblClick = Label156DblClick
        end
        object Label161: TLabel
          Left = 304
          Top = 120
          Width = 86
          Height = 13
          Caption = #1053#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
          Visible = False
        end
        object Label162: TLabel
          Left = 16
          Top = 104
          Width = 125
          Height = 13
          Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1090#1086#1088#1084#1086#1078#1077#1085#1080#1081
          Visible = False
          OnDblClick = Label156DblClick
        end
        object Label163: TLabel
          Left = 304
          Top = 104
          Width = 86
          Height = 13
          Caption = #1053#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
          Visible = False
          OnDblClick = Label156DblClick
        end
      end
      object GroupBox7: TGroupBox
        Left = 432
        Top = 346
        Width = 193
        Height = 81
        Caption = #1044#1072#1090#1095#1080#1082#1080
        TabOrder = 3
        Visible = False
        object Label40: TLabel
          Left = 8
          Top = 16
          Width = 77
          Height = 13
          Caption = #1053#1086#1084#1077#1088' '#1044#1063#1042#1050' 1'
        end
        object Label41: TLabel
          Left = 8
          Top = 32
          Width = 77
          Height = 13
          Caption = #1053#1086#1084#1077#1088' '#1044#1063#1042#1050' 2'
        end
        object Label42: TLabel
          Left = 8
          Top = 48
          Width = 77
          Height = 13
          Caption = #1053#1086#1084#1077#1088' '#1044#1063#1042#1050' 3'
        end
        object Label43: TLabel
          Left = 8
          Top = 64
          Width = 77
          Height = 13
          Caption = #1053#1086#1084#1077#1088' '#1044#1063#1042#1050' 4'
        end
        object Label44: TLabel
          Left = 96
          Top = 16
          Width = 86
          Height = 13
          Caption = #1053#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
        end
        object Label45: TLabel
          Left = 96
          Top = 32
          Width = 86
          Height = 13
          Caption = #1053#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
        end
        object Label46: TLabel
          Left = 96
          Top = 48
          Width = 86
          Height = 13
          Caption = #1053#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
        end
        object Label47: TLabel
          Left = 96
          Top = 64
          Width = 86
          Height = 13
          Caption = #1053#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
        end
      end
      object GroupBox8: TGroupBox
        Left = 457
        Top = 364
        Width = 193
        Height = 81
        Caption = #1052#1086#1076#1091#1083#1103#1090#1086#1088#1099
        TabOrder = 4
        Visible = False
        object Label48: TLabel
          Left = 16
          Top = 16
          Width = 70
          Height = 13
          Caption = #1053#1086#1084#1077#1088' '#1069#1055#1052' 1'
        end
        object Label49: TLabel
          Left = 16
          Top = 32
          Width = 70
          Height = 13
          Caption = #1053#1086#1084#1077#1088' '#1069#1055#1052' 2'
        end
        object Label50: TLabel
          Left = 16
          Top = 48
          Width = 70
          Height = 13
          Caption = #1053#1086#1084#1077#1088' '#1069#1055#1052' 3'
        end
        object Label51: TLabel
          Left = 16
          Top = 64
          Width = 70
          Height = 13
          Caption = #1053#1086#1084#1077#1088' '#1069#1055#1052' 4'
        end
        object Label52: TLabel
          Left = 96
          Top = 16
          Width = 86
          Height = 13
          Caption = #1053#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
        end
        object Label53: TLabel
          Left = 96
          Top = 32
          Width = 86
          Height = 13
          Caption = #1053#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
        end
        object Label54: TLabel
          Left = 96
          Top = 48
          Width = 86
          Height = 13
          Caption = #1053#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
        end
        object Label55: TLabel
          Left = 96
          Top = 64
          Width = 86
          Height = 13
          Caption = #1053#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
        end
      end
      object GroupBox6: TGroupBox
        Left = 8
        Top = 0
        Width = 233
        Height = 129
        Caption = #1069#1083#1077#1082#1090#1088#1086#1085#1085#1099#1081' '#1073#1083#1086#1082
        TabOrder = 2
        object Label571: TLabel
          Left = 8
          Top = 96
          Width = 22
          Height = 13
          Caption = 'CRC'
        end
        object Label22: TLabel
          Left = 8
          Top = 32
          Width = 67
          Height = 13
          Caption = #1053#1086#1084#1077#1088' '#1073#1083#1086#1082#1072
        end
        object Label23: TLabel
          Left = 8
          Top = 48
          Width = 71
          Height = 13
          Caption = #1048#1079#1075#1086#1090#1086#1074#1080#1090#1077#1083#1100
        end
        object Label24: TLabel
          Left = 8
          Top = 64
          Width = 99
          Height = 13
          Caption = #1044#1072#1090#1072' '#1080#1079#1075#1086#1090#1086#1074#1083#1077#1085#1080#1103
        end
        object Label25: TLabel
          Left = 8
          Top = 80
          Width = 99
          Height = 13
          Caption = #1042#1077#1088#1089#1080#1103' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
        end
        object Label29: TLabel
          Left = 122
          Top = 80
          Width = 86
          Height = 13
          Caption = #1053#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
        end
        object Label28: TLabel
          Left = 122
          Top = 64
          Width = 86
          Height = 13
          Caption = #1053#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
        end
        object Label27: TLabel
          Left = 122
          Top = 48
          Width = 86
          Height = 13
          Caption = #1053#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
        end
        object Label26: TLabel
          Left = 122
          Top = 32
          Width = 86
          Height = 13
          Caption = #1053#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
        end
        object Label193: TLabel
          Left = 122
          Top = 16
          Width = 86
          Height = 13
          Caption = #1053#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
        end
        object Label268: TLabel
          Left = 8
          Top = 16
          Width = 108
          Height = 13
          Caption = #1053#1072#1087#1088#1103#1078#1077#1085#1080#1077' '#1087#1080#1090#1072#1085#1080#1103
        end
        object Label569: TLabel
          Left = 40
          Top = 96
          Width = 18
          Height = 13
          Caption = '      '
        end
        object Label627: TLabel
          Left = 8
          Top = 112
          Width = 108
          Height = 13
          Caption = #1044#1077#1094#1080#1084#1072#1083#1100#1085#1099#1081' '#1085#1086#1084#1077#1088
          Visible = False
        end
      end
      object GroupBox3: TGroupBox
        Left = 265
        Top = 0
        Width = 352
        Height = 129
        Caption = #1058#1088#1072#1085#1089#1087#1086#1088#1090#1085#1086#1077' '#1089#1088#1077#1076#1089#1090#1074#1086
        TabOrder = 1
        object Label20: TLabel
          Left = 8
          Top = 16
          Width = 39
          Height = 13
          Caption = #1052#1086#1076#1077#1083#1100
          OnClick = Label20Click
        end
        object Label21: TLabel
          Left = 8
          Top = 64
          Width = 18
          Height = 13
          Caption = 'VIN'
          OnClick = Label21Click
        end
        object Label32: TLabel
          Left = 128
          Top = 16
          Width = 86
          Height = 13
          Caption = #1053#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
        end
        object Label33: TLabel
          Left = 128
          Top = 64
          Width = 86
          Height = 13
          Caption = #1053#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
        end
        object Label36: TLabel
          Left = 8
          Top = 32
          Width = 79
          Height = 13
          Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
        end
        object Label37: TLabel
          Left = 8
          Top = 48
          Width = 64
          Height = 13
          Caption = #1043#1086#1076' '#1074#1099#1087#1091#1089#1082#1072
        end
        object Label38: TLabel
          Left = 128
          Top = 32
          Width = 86
          Height = 13
          Caption = #1053#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
        end
        object Label39: TLabel
          Left = 128
          Top = 48
          Width = 86
          Height = 13
          Caption = #1053#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
        end
        object Label513: TLabel
          Left = 8
          Top = 80
          Width = 109
          Height = 13
          Caption = #1042#1074#1086#1076' '#1074' '#1101#1082#1089#1087#1083#1091#1072#1090#1072#1094#1080#1102
          OnClick = Label513Click
        end
        object Label514: TLabel
          Left = 128
          Top = 80
          Width = 86
          Height = 13
          Caption = #1053#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
        end
        object Label519: TLabel
          Left = 8
          Top = 96
          Width = 110
          Height = 13
          Caption = #1050#1072#1083#1080#1073#1088#1086#1074#1082#1072' '#1076#1072#1090#1095#1080#1082#1086#1074
        end
        object Label520: TLabel
          Left = 128
          Top = 96
          Width = 86
          Height = 13
          Caption = #1053#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
        end
        object Label630: TLabel
          Left = 264
          Top = 16
          Width = 3
          Height = 13
        end
        object Label643: TLabel
          Left = 220
          Top = 16
          Width = 12
          Height = 13
          Caption = '    '
        end
      end
      object GroupBox33: TGroupBox
        Left = 432
        Top = 296
        Width = 185
        Height = 41
        TabOrder = 5
        Visible = False
        object Label145: TLabel
          Left = 8
          Top = 8
          Width = 81
          Height = 13
          Caption = #1053#1086#1084#1077#1088' '#1055#1088#1086#1087'.'#1082#1083'.'
        end
        object Label146: TLabel
          Left = 96
          Top = 8
          Width = 86
          Height = 13
          Caption = #1053#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
        end
        object Label147: TLabel
          Left = 8
          Top = 24
          Width = 78
          Height = 13
          Caption = #1053#1086#1084#1077#1088' '#1044#1080#1092'.'#1082#1083'.'
        end
        object Label148: TLabel
          Left = 96
          Top = 24
          Width = 86
          Height = 13
          Caption = #1053#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
        end
      end
      object Memo2: TMemo
        Left = 488
        Top = 344
        Width = 113
        Height = 89
        Color = clMenu
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 6
        Visible = False
      end
      object GroupBox153: TGroupBox
        Left = 280
        Top = 132
        Width = 337
        Height = 111
        Caption = #1042#1074#1086#1076' '#1074' '#1101#1082#1089#1087#1083#1091#1072#1090#1072#1094#1080#1102
        TabOrder = 7
        Visible = False
        object Label516: TLabel
          Left = 112
          Top = 79
          Width = 19
          Height = 13
          Caption = #1050#1086#1076
        end
        object Label515: TLabel
          Left = 10
          Top = 79
          Width = 52
          Height = 13
          Caption = #1055#1088#1086#1090#1086#1082#1086#1083' '
          Visible = False
        end
        object GroupBox152: TGroupBox
          Left = 8
          Top = 12
          Width = 257
          Height = 55
          Caption = 'VIN'
          TabOrder = 0
          Visible = False
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
            TabOrder = 0
          end
          object Edit260: TEdit
            Left = 112
            Top = 26
            Width = 20
            Height = 21
            TabOrder = 1
          end
          object Edit261: TEdit
            Left = 156
            Top = 26
            Width = 50
            Height = 21
            TabOrder = 2
          end
          object Edit262: TEdit
            Left = 34
            Top = 26
            Width = 28
            Height = 21
            TabOrder = 3
            Text = 'Y3M'
          end
          object Edit263: TEdit
            Left = 136
            Top = 26
            Width = 16
            Height = 21
            TabOrder = 4
          end
        end
        object Edit265: TEdit
          Left = 134
          Top = 76
          Width = 40
          Height = 21
          TabOrder = 1
          OnChange = Edit264Enter
          OnClick = Edit264Enter
          OnEnter = Edit264Enter
        end
        object Button64: TButton
          Left = 184
          Top = 76
          Width = 75
          Height = 25
          Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
          Enabled = False
          TabOrder = 2
          OnClick = Button64Click
        end
        object Edit264: TEdit
          Left = 62
          Top = 76
          Width = 40
          Height = 21
          TabOrder = 3
          Visible = False
          OnChange = Edit264Enter
          OnClick = Edit264Enter
          OnEnter = Edit264Enter
        end
        object Button73: TButton
          Left = 274
          Top = 76
          Width = 49
          Height = 25
          Caption = #1042#1099#1093#1086#1076
          TabOrder = 4
          OnClick = Button73Click
        end
      end
      object GroupBox151: TGroupBox
        Left = 280
        Top = 248
        Width = 337
        Height = 45
        Caption = #1042#1074#1086#1076' '#1084#1086#1076#1077#1083#1080
        TabOrder = 8
        Visible = False
        object Label512: TLabel
          Left = 8
          Top = 20
          Width = 131
          Height = 13
          Caption = #1052#1040#1047'                    --            --'
        end
        object Edit255: TEdit
          Left = 40
          Top = 16
          Width = 33
          Height = 21
          TabOrder = 0
        end
        object Edit256: TEdit
          Left = 72
          Top = 16
          Width = 20
          Height = 21
          TabOrder = 1
        end
        object Edit257: TEdit
          Left = 97
          Top = 16
          Width = 33
          Height = 21
          TabOrder = 2
        end
        object Edit258: TEdit
          Left = 144
          Top = 16
          Width = 28
          Height = 21
          TabOrder = 3
        end
        object Ok: TButton
          Left = 192
          Top = 12
          Width = 49
          Height = 25
          Caption = 'Ok'
          TabOrder = 4
          OnClick = OkClick
        end
        object ButtonXBR2: TButton
          Left = 274
          Top = 12
          Width = 49
          Height = 25
          Caption = #1042#1099#1093#1086#1076
          TabOrder = 5
          OnClick = ButtonXBR2Click
        end
      end
      object stat1: TStatusBar
        Left = 0
        Top = 461
        Width = 660
        Height = 25
        Panels = <>
        SimplePanel = True
      end
      object GroupBox1117: TGroupBox
        Left = 8
        Top = 132
        Width = 233
        Height = 150
        Caption = #1044#1072#1090#1095#1080#1082#1080' '#1057#1050#1059
        TabOrder = 10
        Visible = False
        object GroupBox1118: TGroupBox
          Left = 8
          Top = 16
          Width = 217
          Height = 62
          Caption = 'AGS'
          TabOrder = 0
          Visible = False
          object Label692: TLabel
            Left = 8
            Top = 14
            Width = 108
            Height = 13
            Caption = #1044#1077#1094#1080#1084#1072#1083#1100#1085#1099#1081' '#1085#1086#1084#1077#1088
          end
          object Label693: TLabel
            Left = 8
            Top = 30
            Width = 91
            Height = 13
            Caption = #1057#1077#1088#1080#1081#1085#1099#1081' '#1053#1086#1084#1077#1088' '
          end
          object Label694: TLabel
            Left = 8
            Top = 46
            Width = 56
            Height = 13
            Caption = #1042#1077#1088#1089#1080#1103' '#1055#1054
          end
        end
        object GroupBox1119: TGroupBox
          Left = 8
          Top = 80
          Width = 217
          Height = 62
          Caption = 'SAS'
          TabOrder = 1
          Visible = False
          object Label695: TLabel
            Left = 8
            Top = 14
            Width = 108
            Height = 13
            Caption = #1044#1077#1094#1080#1084#1072#1083#1100#1085#1099#1081' '#1085#1086#1084#1077#1088
          end
          object Label696: TLabel
            Left = 8
            Top = 30
            Width = 91
            Height = 13
            Caption = #1057#1077#1088#1080#1081#1085#1099#1081' '#1053#1086#1084#1077#1088' '
          end
          object Label697: TLabel
            Left = 8
            Top = 46
            Width = 56
            Height = 13
            Caption = #1042#1077#1088#1089#1080#1103' '#1055#1054
          end
        end
      end
    end
    object ErrorSheet: TTabSheet
      Caption = #1053#1077#1080#1089#1087#1088#1072#1074#1085#1086#1089#1090#1080
      ImageIndex = 1
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 601
        Height = 369
        Caption = #1040#1082#1090#1080#1074#1085#1099#1077' '#1085#1077#1080#1089#1087#1088#1072#1074#1085#1086#1089#1090#1080
        TabOrder = 0
        object Label1: TLabel
          Left = 304
          Top = 44
          Width = 197
          Height = 13
          Caption = #1052#1086#1076#1091#1083#1103#1090#1086#1088'  '#1087#1077#1088#1077#1076#1085#1077#1075#1086' '#1087#1088#1072#1074#1086#1075#1086' '#1082#1086#1083#1077#1089#1072
        end
        object Label3: TLabel
          Left = 48
          Top = 180
          Width = 83
          Height = 13
          Caption = #1069#1083#1077#1082#1090#1088#1086#1087#1080#1090#1072#1085#1080#1077
        end
        object sb1: TSpeedButton
          Left = 16
          Top = 16
          Width = 22
          Height = 22
          Cursor = crHandPoint
          AllowAllUp = True
          GroupIndex = 1
          OnClick = PressButton
        end
        object sb2: TSpeedButton
          Left = 16
          Top = 40
          Width = 22
          Height = 22
          Cursor = crHandPoint
          AllowAllUp = True
          GroupIndex = 1
          OnClick = PressButton
        end
        object sb3: TSpeedButton
          Left = 16
          Top = 64
          Width = 22
          Height = 22
          Cursor = crHandPoint
          AllowAllUp = True
          GroupIndex = 1
          OnClick = PressButton
        end
        object Label5: TLabel
          Left = 48
          Top = 20
          Width = 170
          Height = 13
          Caption = #1044#1072#1090#1095#1080#1082' '#1087#1077#1088#1077#1076#1085#1077#1075#1086' '#1083#1077#1074#1086#1075#1086' '#1082#1086#1083#1077#1089#1072
        end
        object Label6: TLabel
          Left = 48
          Top = 44
          Width = 176
          Height = 13
          Caption = #1044#1072#1090#1095#1080#1082' '#1087#1077#1088#1077#1076#1085#1077#1075#1086' '#1087#1088#1072#1074#1086#1075#1086' '#1082#1086#1083#1077#1089#1072
        end
        object Label7: TLabel
          Left = 48
          Top = 92
          Width = 164
          Height = 13
          Caption = #1044#1072#1090#1095#1080#1082' '#1079#1072#1076#1085#1077#1075#1086' '#1087#1088#1072#1074#1086#1075#1086' '#1082#1086#1083#1077#1089#1072
        end
        object Label8: TLabel
          Left = 48
          Top = 68
          Width = 158
          Height = 13
          Caption = #1044#1072#1090#1095#1080#1082' '#1079#1072#1076#1085#1077#1075#1086' '#1083#1077#1074#1086#1075#1086' '#1082#1086#1083#1077#1089#1072
        end
        object Label9: TLabel
          Left = 304
          Top = 20
          Width = 191
          Height = 13
          Caption = #1052#1086#1076#1091#1083#1103#1090#1086#1088'  '#1087#1077#1088#1077#1076#1085#1077#1075#1086' '#1083#1077#1074#1086#1075#1086' '#1082#1086#1083#1077#1089#1072
        end
        object sb4: TSpeedButton
          Left = 16
          Top = 88
          Width = 22
          Height = 22
          Cursor = crHandPoint
          AllowAllUp = True
          GroupIndex = 1
          OnClick = PressButton
        end
        object sb5: TSpeedButton
          Left = 16
          Top = 200
          Width = 22
          Height = 22
          Cursor = crHandPoint
          AllowAllUp = True
          GroupIndex = 1
          OnClick = PressButton
        end
        object sb6: TSpeedButton
          Left = 16
          Top = 176
          Width = 22
          Height = 22
          Cursor = crHandPoint
          AllowAllUp = True
          GroupIndex = 1
          OnClick = PressButton
        end
        object sb7: TSpeedButton
          Left = 272
          Top = 16
          Width = 22
          Height = 22
          Cursor = crHandPoint
          AllowAllUp = True
          GroupIndex = 1
          OnClick = PressButton
        end
        object sb8: TSpeedButton
          Left = 272
          Top = 40
          Width = 22
          Height = 22
          Cursor = crHandPoint
          AllowAllUp = True
          GroupIndex = 1
          OnClick = PressButton
        end
        object sb9: TSpeedButton
          Left = 272
          Top = 64
          Width = 22
          Height = 22
          Cursor = crHandPoint
          AllowAllUp = True
          GroupIndex = 1
          OnClick = PressButton
        end
        object sb10: TSpeedButton
          Left = 272
          Top = 88
          Width = 22
          Height = 22
          Cursor = crHandPoint
          AllowAllUp = True
          GroupIndex = 1
          OnClick = PressButton
        end
        object sb11: TSpeedButton
          Left = 272
          Top = 224
          Width = 22
          Height = 22
          Cursor = crHandPoint
          AllowAllUp = True
          GroupIndex = 1
          OnClick = PressButton
        end
        object Label10: TLabel
          Left = 304
          Top = 228
          Width = 139
          Height = 13
          Caption = #1055#1088#1086#1087#1086#1088#1094#1080#1086#1085#1072#1083#1100#1085#1099#1081' '#1082#1083#1072#1087#1072#1085
        end
        object Label2: TLabel
          Left = 304
          Top = 92
          Width = 185
          Height = 13
          Caption = #1052#1086#1076#1091#1083#1103#1090#1086#1088'  '#1079#1072#1076#1085#1077#1075#1086' '#1087#1088#1072#1074#1086#1075#1086' '#1082#1086#1083#1077#1089#1072
        end
        object Label16: TLabel
          Left = 304
          Top = 68
          Width = 176
          Height = 13
          Caption = #1052#1086#1076#1091#1083#1103#1090#1086#1088' '#1079#1072#1076#1085#1077#1075#1086' '#1083#1077#1074#1086#1075#1086' '#1082#1086#1083#1077#1089#1072
        end
        object Label17: TLabel
          Left = 48
          Top = 204
          Width = 87
          Height = 13
          Caption = #1041#1083#1086#1082' '#1091#1087#1088#1072#1074#1083#1077#1085#1080#1103
        end
        object sb12: TSpeedButton
          Left = 16
          Top = 224
          Width = 22
          Height = 22
          Cursor = crHandPoint
          AllowAllUp = True
          GroupIndex = 1
          OnClick = PressButton
        end
        object Label117: TLabel
          Left = 48
          Top = 228
          Width = 150
          Height = 13
          Caption = #1044#1080#1092#1092#1077#1088#1077#1085#1094#1080#1072#1083#1100#1085#1099#1077' '#1082#1083#1072#1087#1072#1085#1072
        end
        object sb13: TSpeedButton
          Left = 272
          Top = 176
          Width = 22
          Height = 22
          Cursor = crHandPoint
          AllowAllUp = True
          GroupIndex = 1
          OnClick = PressButton
        end
        object sb14: TSpeedButton
          Left = 272
          Top = 200
          Width = 22
          Height = 22
          Cursor = crHandPoint
          AllowAllUp = True
          GroupIndex = 1
          OnClick = PressButton
        end
        object sb15: TSpeedButton
          Left = 272
          Top = 248
          Width = 22
          Height = 22
          Cursor = crHandPoint
          AllowAllUp = True
          GroupIndex = 1
          OnClick = PressButton
        end
        object sb16: TSpeedButton
          Left = 16
          Top = 272
          Width = 22
          Height = 22
          Cursor = crHandPoint
          AllowAllUp = True
          GroupIndex = 1
          OnClick = PressButton
        end
        object Label118: TLabel
          Left = 304
          Top = 180
          Width = 33
          Height = 13
          Caption = #1047#1077#1084#1083#1080
        end
        object Label119: TLabel
          Left = 304
          Top = 204
          Width = 75
          Height = 13
          Caption = 'CAN SAEJ1939'
        end
        object Label120: TLabel
          Left = 304
          Top = 252
          Width = 49
          Height = 13
          Caption = #1058#1072#1093#1086#1075#1088#1072#1092
        end
        object Label121: TLabel
          Left = 48
          Top = 276
          Width = 37
          Height = 13
          Caption = #1055#1088#1086#1095#1080#1077
        end
        object sb17: TSpeedButton
          Left = 16
          Top = 248
          Width = 22
          Height = 22
          Cursor = crHandPoint
          AllowAllUp = True
          GroupIndex = 1
          OnClick = PressButton
        end
        object Label91: TLabel
          Left = 48
          Top = 252
          Width = 51
          Height = 13
          Caption = #1056#1077#1083#1077' DBR'
        end
        object SB18: TSpeedButton
          Left = 16
          Top = 112
          Width = 22
          Height = 22
          Cursor = crHandPoint
          AllowAllUp = True
          GroupIndex = 1
          OnClick = PressButton
        end
        object Label205: TLabel
          Left = 48
          Top = 116
          Width = 178
          Height = 13
          Caption = #1044#1072#1090#1095#1080#1082' '#1083#1077#1074#1086#1075#1086' '#1082#1086#1083#1077#1089#1072' '#1090#1088#1077#1090#1100#1077#1081' '#1086#1089#1080
        end
        object SB19: TSpeedButton
          Left = 16
          Top = 136
          Width = 22
          Height = 22
          Cursor = crHandPoint
          AllowAllUp = True
          GroupIndex = 1
          OnClick = PressButton
        end
        object Label207: TLabel
          Left = 48
          Top = 140
          Width = 184
          Height = 13
          Caption = #1044#1072#1090#1095#1080#1082' '#1087#1088#1072#1074#1086#1075#1086' '#1082#1086#1083#1077#1089#1072' '#1090#1088#1077#1090#1100#1077#1081' '#1086#1089#1080
        end
        object SB20: TSpeedButton
          Left = 272
          Top = 112
          Width = 22
          Height = 22
          Cursor = crHandPoint
          AllowAllUp = True
          GroupIndex = 1
          OnClick = PressButton
        end
        object SB21: TSpeedButton
          Left = 272
          Top = 136
          Width = 22
          Height = 22
          Cursor = crHandPoint
          AllowAllUp = True
          GroupIndex = 1
          OnClick = PressButton
        end
        object Label209: TLabel
          Left = 304
          Top = 116
          Width = 196
          Height = 13
          Caption = #1052#1086#1076#1091#1083#1103#1090#1086#1088' '#1083#1077#1074#1086#1075#1086' '#1082#1086#1083#1077#1089#1072' '#1090#1088#1077#1090#1100#1077#1081' '#1086#1089#1080
        end
        object Label210: TLabel
          Left = 304
          Top = 140
          Width = 205
          Height = 13
          Caption = #1052#1086#1076#1091#1083#1103#1090#1086#1088'  '#1087#1088#1072#1074#1086#1075#1086' '#1082#1086#1083#1077#1089#1072' '#1090#1088#1077#1090#1100#1077#1081' '#1086#1089#1080
        end
        object GroupBox60: TGroupBox
          Left = 5
          Top = 302
          Width = 588
          Height = 63
          Caption = #1050#1091#1088#1089#1086#1074#1072#1103' '#1089#1090#1072#1073#1080#1083#1080#1079#1072#1094#1080#1103
          TabOrder = 0
          object SB23: TSpeedButton
            Left = 11
            Top = 14
            Width = 22
            Height = 22
            Cursor = crHandPoint
            AllowAllUp = True
            GroupIndex = 1
            OnClick = PressButton
          end
          object Label248: TLabel
            Left = 42
            Top = 18
            Width = 87
            Height = 13
            Caption = #1044#1072#1090#1095#1080#1082' '#1088#1091#1083#1103' SAS'
          end
          object SB24: TSpeedButton
            Left = 11
            Top = 38
            Width = 22
            Height = 22
            Cursor = crHandPoint
            AllowAllUp = True
            GroupIndex = 1
            OnClick = PressButton
          end
          object Label249: TLabel
            Left = 42
            Top = 41
            Width = 118
            Height = 13
            Caption = #1044#1072#1090#1095#1080#1082' '#1091#1089#1082#1086#1088#1077#1085#1080#1103' AGS'
          end
          object SB25: TSpeedButton
            Left = 171
            Top = 14
            Width = 22
            Height = 22
            Cursor = crHandPoint
            AllowAllUp = True
            GroupIndex = 1
            OnClick = PressButton
          end
          object Label250: TLabel
            Left = 202
            Top = 18
            Width = 85
            Height = 13
            Caption = #1050#1086#1085#1090#1088#1086#1083#1083#1077#1088' VDC'
          end
          object SB26: TSpeedButton
            Left = 171
            Top = 38
            Width = 22
            Height = 22
            Cursor = crHandPoint
            AllowAllUp = True
            GroupIndex = 1
            OnClick = PressButton
          end
          object Label251: TLabel
            Left = 202
            Top = 42
            Width = 94
            Height = 13
            Caption = #1044#1072#1090#1095#1080#1082#1080' '#1076#1072#1074#1083#1077#1085#1080#1103
          end
          object SB22: TSpeedButton
            Left = 304
            Top = 14
            Width = 22
            Height = 22
            Cursor = crHandPoint
            AllowAllUp = True
            GroupIndex = 1
            OnClick = PressButton
          end
          object Label252: TLabel
            Left = 336
            Top = 18
            Width = 103
            Height = 13
            Caption = #1052#1086#1076#1091#1083#1103#1090#1086#1088'  '#1087#1088#1080#1094#1077#1087#1072
          end
          object SB27: TSpeedButton
            Left = 304
            Top = 38
            Width = 22
            Height = 22
            Cursor = crHandPoint
            AllowAllUp = True
            GroupIndex = 1
            OnClick = PressButton
          end
          object Label247: TLabel
            Left = 336
            Top = 42
            Width = 70
            Height = 13
            Caption = 'CAN  '#1087#1088#1080#1094#1077#1087#1072
          end
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 376
        Width = 281
        Height = 70
        Caption = #1051#1077#1075#1077#1085#1076#1072' '#1085#1077#1080#1089#1087#1088#1072#1074#1085#1086#1089#1090#1077#1081
        TabOrder = 1
        object Label12: TLabel
          Left = 40
          Top = 48
          Width = 48
          Height = 13
          Caption = #1040#1082#1090#1080#1074#1085#1072#1103
        end
        object Label13: TLabel
          Left = 40
          Top = 20
          Width = 86
          Height = 13
          Caption = #1053#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
        end
        object Label15: TLabel
          Left = 216
          Top = 48
          Width = 56
          Height = 13
          Caption = #1055#1072#1089#1089#1080#1074#1085#1072#1103
        end
        object Label14: TLabel
          Left = 218
          Top = 20
          Width = 50
          Height = 13
          Caption = #1048#1089#1087#1088#1072#1074#1085#1086
        end
        object Panel1: TPanel
          Left = 8
          Top = 44
          Width = 24
          Height = 24
          TabOrder = 0
          object Image1: TImage
            Left = 1
            Top = 1
            Width = 20
            Height = 20
            Align = alClient
            AutoSize = True
            Center = True
            Picture.Data = {
              07544269746D617066010000424D660100000000000076000000280000001400
              0000140000000100040000000000F00000000000000000000000100000000000
              000000000000000080000080000000808000800000008000800080800000C0C0
              C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
              FF00777777000000007777770000777777000000007777770000777700111111
              9900777700007777001111119900777700007700111111111199007700007700
              1111111111990077000000999999111111119900000000999999111111119900
              0000009999991111111199000000009999991111111199000000009999999999
              1111110000000099999999991111110000000099FFFF99999911110000000099
              FFFF9999991111000000770099FFFF99991100770000770099FFFF9999110077
              0000777700999999990077770000777700999999990077770000777777000000
              007777770000777777000000007777770000}
          end
        end
        object Panel2: TPanel
          Left = 8
          Top = 16
          Width = 24
          Height = 24
          TabOrder = 1
          object Image2: TImage
            Left = 1
            Top = 1
            Width = 22
            Height = 22
            Align = alClient
            Picture.Data = {
              07544269746D617066010000424D660100000000000076000000280000001400
              0000140000000100040000000000F00000000000000000000000100000000000
              000000000000000080000080000000808000800000008000800080800000C0C0
              C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
              FF00777777000000007777770000777777000000007777770000777700888888
              7700777700007777008888887700777700007700888888888877007700007700
              8888888888770077000000777777888888887700000000777777888888887700
              0000007777778888888877000000007777778888888877000000007777777777
              8888880000000077777777778888880000000077FFFF77777788880000000077
              FFFF7777778888000000770077FFFF77778800770000770077FFFF7777880077
              0000777700777777770077770000777700777777770077770000777777000000
              007777770000777777000000007777770000}
          end
        end
        object Panel3: TPanel
          Left = 190
          Top = 16
          Width = 25
          Height = 25
          TabOrder = 2
          object Image3: TImage
            Left = 1
            Top = 1
            Width = 22
            Height = 23
            Align = alLeft
            Picture.Data = {
              07544269746D617066010000424D660100000000000076000000280000001400
              0000140000000100040000000000F00000000000000000000000100000000000
              000000000000000080000080000000808000800000008000800080800000C0C0
              C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
              FF00777777000000007777770000777777000000007777770000777700222222
              AA0077770000777700222222AA007777000077002222222222AA007700007700
              2222222222AA0077000000AAAAAA22222222AA00000000AAAAAA22222222AA00
              000000AAAAAA22222222AA00000000AAAAAA22222222AA00000000AAAAAAAAAA
              22222200000000AAAAAAAAAA22222200000000AAFFFFAAAAAA222200000000AA
              FFFFAAAAAA22220000007700AAFFFFAAAA22007700007700AAFFFFAAAA220077
              0000777700AAAAAAAA0077770000777700AAAAAAAA0077770000777777000000
              007777770000777777000000007777770000}
          end
        end
        object Panel4: TPanel
          Left = 190
          Top = 44
          Width = 24
          Height = 24
          TabOrder = 3
          object Image4: TImage
            Left = 1
            Top = 1
            Width = 22
            Height = 22
            Align = alClient
            Picture.Data = {
              07544269746D617066010000424D660100000000000076000000280000001400
              0000140000000100040000000000F00000000000000000000000100000000000
              000000000000000080000080000000808000800000008000800080800000C0C0
              C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
              FF00777777000000007777770000777777000000007777770000777700333333
              BB0077770000777700333333BB007777000077003333333333BB007700007700
              3333333333BB0077000000BBBBBB33333333BB00000000BBBBBB33333333BB00
              000000BBBBBB33333333BB00000000BBBBBB33333333BB00000000BBBBBBBBBB
              33333300000000BBBBBBBBBB33333300000000BBFFFFBBBBBB333300000000BB
              FFFFBBBBBB33330000007700BBFFFFBBBB33007700007700BBFFFFBBBB330077
              0000777700BBBBBBBB0077770000777700BBBBBBBB0077770000777777000000
              007777770000777777000000007777770000}
          end
        end
      end
      object btnDelAll: TButton
        Left = 376
        Top = 412
        Width = 201
        Height = 25
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1072#1089#1089#1080#1074#1085#1099#1077' '#1085#1077#1080#1089#1087#1088#1072#1074#1085#1086#1089#1090#1080
        TabOrder = 2
        OnClick = btnDelAllClick
      end
    end
    object pol: TTabSheet
      Caption = #1055#1086#1083#1080#1075#1086#1085
      ImageIndex = 2
      DesignSize = (
        660
        486)
      object Label138: TLabel
        Left = 191
        Top = 352
        Width = 44
        Height = 13
        Caption = #1076#1086#1088#1086#1075#1072' L'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label139: TLabel
        Left = 336
        Top = 352
        Width = 46
        Height = 13
        Caption = #1076#1086#1088#1086#1075#1072' R'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label140: TLabel
        Left = 432
        Top = 352
        Width = 31
        Height = 13
        Caption = 'V'#1082#1084'/'#1095
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label141: TLabel
        Left = 472
        Top = 352
        Width = 26
        Height = 13
        Caption = 'P'#1072#1090#1084
      end
      object PolyBtn: TSpeedButton
        Left = 0
        Top = 364
        Width = 57
        Height = 25
        Cursor = crHandPoint
        AllowAllUp = True
        GroupIndex = 5
        Caption = #1057#1090#1072#1088#1090
        OnClick = PolyBtnClick
      end
      object Label11: TLabel
        Left = 504
        Top = 352
        Width = 13
        Height = 13
        Caption = 'G'#1090
      end
      object Label133: TLabel
        Left = 536
        Top = 352
        Width = 24
        Height = 13
        Caption = #1057#1082#1072#1090
      end
      object Chart1: TChart
        Left = 0
        Top = -16
        Width = 603
        Height = 369
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        LeftWall.Brush.Color = clWhite
        MarginBottom = 2
        MarginLeft = 0
        MarginRight = 1
        MarginTop = 3
        Title.AdjustFrame = False
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -11
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Title.Text.Strings = (
          'TChart')
        Title.Visible = False
        OnClickLegend = Chart1ClickLegend
        BottomAxis.TickLength = 1
        DepthAxis.ExactDateTime = False
        DepthAxis.Visible = True
        LeftAxis.Automatic = False
        LeftAxis.AutomaticMaximum = False
        LeftAxis.AutomaticMinimum = False
        LeftAxis.Axis.Width = 1
        LeftAxis.Axis.Visible = False
        LeftAxis.ExactDateTime = False
        LeftAxis.Increment = 10.000000000000000000
        LeftAxis.Maximum = 100.000000000000000000
        LeftAxis.MinorTickCount = 4
        LeftAxis.TickLength = 0
        LeftAxis.Title.Caption = #1057#1082#1086#1088#1086#1089#1090#1100', '#1082#1084'/'#1095
        Legend.Color = 13158600
        Legend.ColorWidth = 10
        Legend.DividingLines.Visible = True
        Legend.Font.Charset = ANSI_CHARSET
        Legend.Font.Color = clBlack
        Legend.Font.Height = -9
        Legend.Font.Name = 'Arial'
        Legend.Font.Style = [fsBold]
        Legend.HorizMargin = 1
        Legend.LegendStyle = lsSeries
        Legend.ShadowColor = 10724259
        Legend.ShadowSize = 1
        Legend.TextStyle = ltsPlain
        Legend.TopPos = 1
        RightAxis.ExactDateTime = False
        RightAxis.Grid.Style = psSolid
        RightAxis.Grid.Visible = False
        RightAxis.Increment = 1.000000000000000000
        RightAxis.MinorTickCount = 4
        RightAxis.TickLength = 0
        TopAxis.TickLength = 1
        TopAxis.Title.Caption = #1077#1077#1077
        TopAxis.Visible = False
        View3D = False
        View3DWalls = False
        BevelInner = bvLowered
        Color = clSilver
        TabOrder = 0
        object Edit47: TEdit
          Left = 552
          Top = 288
          Width = 41
          Height = 21
          TabOrder = 0
          Text = '50'
        end
        object Button33: TButton
          Left = 544
          Top = 272
          Width = 51
          Height = 17
          Caption = 'ABS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = Button33Click
        end
        object Series0: TFastLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clWhite
          Title = 'Car'
          LinePen.Color = clWhite
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Series1: TFastLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'W_FL'
          LinePen.Color = clRed
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Series2: TFastLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clGreen
          Title = 'W_FR'
          LinePen.Color = clGreen
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Series3: TFastLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clYellow
          Title = 'W_RL'
          LinePen.Color = clYellow
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Series4: TFastLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clBlue
          Title = 'W_RR'
          LinePen.Color = clBlue
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Series5: TFastLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'P_FL'
          LinePen.Color = clRed
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Series6: TFastLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clGreen
          Title = 'P_FR'
          LinePen.Color = clGreen
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Series7: TFastLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clYellow
          Title = 'P_RL'
          LinePen.Color = clYellow
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Series8: TFastLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clBlue
          Title = 'P_RR'
          LinePen.Color = clBlue
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Series13: TFastLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'A_FL'
          VertAxis = aRightAxis
          LinePen.Color = clRed
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Series14: TFastLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clGreen
          Title = 'A_FR'
          VertAxis = aRightAxis
          LinePen.Color = clGreen
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Series15: TFastLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clYellow
          Title = 'A_RL'
          VertAxis = aRightAxis
          LinePen.Color = clYellow
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Series16: TFastLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clBlue
          Title = 'A_RR'
          VertAxis = aRightAxis
          LinePen.Color = clBlue
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Series17: TFastLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'M_FL'
          LinePen.Color = clRed
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Series18: TFastLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clGreen
          Title = 'M_FR'
          LinePen.Color = clGreen
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Series19: TFastLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clYellow
          Title = 'M_RL'
          LinePen.Color = clYellow
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Series20: TFastLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clBlue
          Title = 'M_RR'
          LinePen.Color = clBlue
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Series21: TFastLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clGray
          Title = 'Acar'
          LinePen.Color = clGray
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Series24: TFastLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'OSC1'
          VertAxis = aRightAxis
          LinePen.Color = clRed
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Series25: TFastLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = 65408
          Title = 'OSC2'
          VertAxis = aRightAxis
          LinePen.Color = 65408
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Series26: TFastLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clYellow
          Title = 'OSC3'
          VertAxis = aRightAxis
          LinePen.Color = clYellow
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Series27: TFastLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clBlue
          Title = 'OSC4'
          VertAxis = aRightAxis
          LinePen.Color = clBlue
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Series28: TFastLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clWhite
          Title = 'OSC5'
          VertAxis = aRightAxis
          LinePen.Color = clWhite
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Series29: TFastLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = 4194368
          Title = 'OSC6'
          VertAxis = aRightAxis
          LinePen.Color = 4194368
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
      end
      object StatusBar1: TStatusBar
        Left = 0
        Top = 467
        Width = 660
        Height = 19
        BiDiMode = bdLeftToRight
        Panels = <
          item
            Text = #1042#1088#1077#1084#1103
            Width = 60
          end
          item
            Text = #1055#1091#1090#1100
            Width = 73
          end
          item
            Text = #1047#1072#1084#1077#1076#1083#1077#1085#1080#1077
            Width = 77
          end
          item
            Text = #1056#1077#1072#1083#1080#1079#1072#1094#1080#1103'  '#181'_max '
            Width = 110
          end
          item
            Text = #1056#1072#1089#1093#1086#1076' '
            Width = 65
          end
          item
            Width = 20
          end
          item
            Width = 40
          end>
        ParentBiDiMode = False
      end
      object ComboBox1: TComboBox
        Left = 144
        Top = 366
        Width = 201
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DropDownCount = 6
        ItemHeight = 13
        TabOrder = 2
        Items.Strings = (
          #1089#1091#1093#1086#1081' '#1073#1077#1090#1086#1085', '#181'_max 0,85'
          #1084#1086#1082#1088#1099#1081' '#1073#1077#1090#1086#1085', '#181'_max 0,7'
          #1084#1086#1082#1088#1099#1081' '#1073#1077#1090#1086#1085', '#181'_max 0,5'
          #1089#1085#1077#1075', '#181'_max 0,35'
          #1089#1091#1093#1086#1081' '#1083#1077#1076', '#181'_max 0,2'
          #1084#1086#1082#1088#1099#1081' '#1083#1077#1076', '#181'_max 0,08')
      end
      object ComboBox2: TComboBox
        Left = 292
        Top = 366
        Width = 197
        Height = 21
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        DropDownCount = 6
        ItemHeight = 13
        TabOrder = 3
        Items.Strings = (
          #1089#1091#1093#1086#1081' '#1073#1077#1090#1086#1085', '#181'_max 0,85'
          #1084#1086#1082#1088#1099#1081' '#1073#1077#1090#1086#1085', '#181'_max 0,7'
          #1084#1086#1082#1088#1099#1081' '#1073#1077#1090#1086#1085', '#181'_max 0,5'
          #1087#1083#1086#1090#1085#1099#1081' '#1089#1085#1077#1075', '#181'_max 0,35'
          #1089#1091#1093#1086#1081' '#1083#1077#1076', '#181'_max 0,2'
          #1084#1086#1082#1088#1099#1081' '#1083#1077#1076', '#181'_max 0,08')
      end
      object Edit32: TEdit
        Left = 492
        Top = 364
        Width = 28
        Height = 21
        Anchors = [akTop, akRight]
        TabOrder = 4
      end
      object ComboBox3: TComboBox
        Left = 62
        Top = 366
        Width = 80
        Height = 21
        ItemHeight = 13
        TabOrder = 5
      end
      object Edit44: TEdit
        Left = 472
        Top = 364
        Width = 25
        Height = 21
        TabOrder = 6
        Text = '8'
      end
      object Edit45: TEdit
        Left = 504
        Top = 364
        Width = 25
        Height = 21
        TabOrder = 7
        Text = '0'
      end
      object Edit46: TEdit
        Left = 536
        Top = 364
        Width = 25
        Height = 21
        TabOrder = 8
        Text = '0'
      end
      object CheckBox48: TCheckBox
        Left = 576
        Top = 368
        Width = 57
        Height = 17
        Checked = True
        State = cbChecked
        TabOrder = 9
      end
    end
    object RoadTestPage: TTabSheet
      Cursor = crCross
      Caption = 'RoadTest'
      ImageIndex = 3
      object RoadTestBox: TPaintBox
        Left = 0
        Top = 8
        Width = 600
        Height = 278
        OnMouseDown = RoadTestBoxMouseDown
        OnMouseMove = RoadTestBoxMouseMove
      end
      object GroupBox13: TGroupBox
        Left = 464
        Top = 296
        Width = 137
        Height = 68
        Caption = 'Road Test Results'
        TabOrder = 1
        object Button8: TButton
          Left = 16
          Top = 16
          Width = 113
          Height = 22
          Caption = 'Load Road Test File'
          TabOrder = 0
          OnClick = Button8Click
        end
        object Button7: TButton
          Left = 16
          Top = 40
          Width = 113
          Height = 22
          Caption = 'Save Road File as...'
          TabOrder = 1
          OnClick = Button7Click
        end
      end
      object GroupBox12: TGroupBox
        Left = 280
        Top = 296
        Width = 185
        Height = 68
        Caption = 'Road Test'
        TabOrder = 0
        object Label83: TLabel
          Left = 104
          Top = 10
          Width = 64
          Height = 13
          Caption = #1042#1088#1077#1084#1103' '#1090#1077#1089#1090#1072
        end
        object Label81: TLabel
          Left = 160
          Top = 28
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '0'
        end
        object Label98: TLabel
          Left = 152
          Top = 48
          Width = 25
          Height = 13
          Caption = 'msec'
        end
        object Label82: TLabel
          Left = 16
          Top = 48
          Width = 82
          Height = 13
          Caption = #1052#1077#1090#1082#1080' '#1074#1088#1077#1084#1077#1085#1080':'
        end
        object Button6: TButton
          Left = 8
          Top = 16
          Width = 75
          Height = 25
          Caption = 'Start Test'
          TabOrder = 0
          OnClick = Button6Click
        end
        object Edit38: TEdit
          Left = 112
          Top = 44
          Width = 33
          Height = 21
          TabOrder = 1
          Text = '500'
        end
      end
      object GroupBox16: TGroupBox
        Left = 0
        Top = 296
        Width = 281
        Height = 156
        Caption = 'Road Osc'
        TabOrder = 2
        object Label99: TLabel
          Left = 184
          Top = 26
          Width = 38
          Height = 13
          Caption = 'Label99'
        end
        object Label100: TLabel
          Left = 184
          Top = 39
          Width = 44
          Height = 13
          Caption = 'Label100'
        end
        object Label70: TLabel
          Left = 184
          Top = 52
          Width = 38
          Height = 13
          Caption = 'Label70'
          OnClick = Label70Click
        end
        object Label126: TLabel
          Left = 184
          Top = 64
          Width = 7
          Height = 13
          Caption = 'A'
          OnClick = Label126Click
        end
        object ScrollBar1: TScrollBar
          Left = 8
          Top = 122
          Width = 265
          Height = 16
          PageSize = 0
          TabOrder = 0
          OnChange = ScrollBar1Change
        end
        object CheckBox13: TCheckBox
          Left = 8
          Top = 16
          Width = 41
          Height = 17
          Caption = 'R1'
          TabOrder = 1
          OnClick = CheckBox22Click
        end
        object CheckBox14: TCheckBox
          Left = 8
          Top = 32
          Width = 41
          Height = 17
          Caption = 'R2'
          TabOrder = 2
          OnClick = CheckBox22Click
        end
        object CheckBox15: TCheckBox
          Left = 8
          Top = 48
          Width = 41
          Height = 17
          Caption = 'R3'
          TabOrder = 3
          OnClick = CheckBox22Click
        end
        object CheckBox16: TCheckBox
          Left = 48
          Top = 48
          Width = 41
          Height = 17
          Caption = 'R6'
          TabOrder = 4
          OnClick = CheckBox22Click
        end
        object CheckBox17: TCheckBox
          Left = 48
          Top = 32
          Width = 41
          Height = 17
          Caption = 'R5'
          TabOrder = 5
          OnClick = CheckBox22Click
        end
        object CheckBox18: TCheckBox
          Left = 48
          Top = 16
          Width = 41
          Height = 17
          Caption = 'R4'
          TabOrder = 6
          OnClick = CheckBox22Click
        end
        object CheckBox19: TCheckBox
          Left = 88
          Top = 48
          Width = 41
          Height = 17
          Caption = 'R9'
          TabOrder = 7
          OnClick = CheckBox22Click
        end
        object CheckBox20: TCheckBox
          Left = 88
          Top = 32
          Width = 41
          Height = 17
          Caption = 'R8'
          TabOrder = 8
          OnClick = CheckBox22Click
        end
        object CheckBox21: TCheckBox
          Left = 88
          Top = 16
          Width = 41
          Height = 17
          Caption = 'R7'
          TabOrder = 9
          OnClick = CheckBox22Click
        end
        object CheckBox22: TCheckBox
          Left = 128
          Top = 48
          Width = 41
          Height = 17
          Caption = 'R12'
          TabOrder = 10
          OnClick = CheckBox22Click
        end
        object CheckBox23: TCheckBox
          Left = 128
          Top = 32
          Width = 41
          Height = 17
          Caption = 'R11'
          TabOrder = 11
          OnClick = CheckBox22Click
        end
        object CheckBox24: TCheckBox
          Left = 128
          Top = 16
          Width = 41
          Height = 17
          Caption = 'R10'
          TabOrder = 12
          OnClick = CheckBox22Click
        end
        object CheckBox90: TCheckBox
          Left = 8
          Top = 64
          Width = 41
          Height = 17
          Caption = 'R13'
          TabOrder = 13
          OnClick = CheckBox22Click
        end
        object CheckBox91: TCheckBox
          Left = 48
          Top = 64
          Width = 41
          Height = 17
          Caption = 'R14'
          TabOrder = 14
          OnClick = CheckBox22Click
        end
        object CheckBox92: TCheckBox
          Left = 88
          Top = 64
          Width = 41
          Height = 17
          Caption = 'R15'
          TabOrder = 15
          OnClick = CheckBox22Click
        end
        object CheckBox93: TCheckBox
          Left = 128
          Top = 64
          Width = 41
          Height = 17
          Caption = 'R16'
          TabOrder = 16
          OnClick = CheckBox22Click
        end
        object CheckBox96: TCheckBox
          Left = 8
          Top = 80
          Width = 41
          Height = 17
          Caption = 'R17'
          TabOrder = 17
          OnClick = CheckBox22Click
        end
        object CheckBox97: TCheckBox
          Left = 48
          Top = 80
          Width = 41
          Height = 17
          Caption = 'R18'
          TabOrder = 18
          OnClick = CheckBox22Click
        end
        object CheckBox98: TCheckBox
          Left = 88
          Top = 80
          Width = 41
          Height = 17
          Caption = 'R19'
          TabOrder = 19
          OnClick = CheckBox22Click
        end
        object CheckBox99: TCheckBox
          Left = 128
          Top = 80
          Width = 41
          Height = 17
          Caption = 'R20'
          TabOrder = 20
          OnClick = CheckBox22Click
        end
        object CheckBox347: TCheckBox
          Left = 8
          Top = 96
          Width = 41
          Height = 17
          Caption = 'R21'
          TabOrder = 21
          OnClick = CheckBox22Click
        end
        object CheckBox348: TCheckBox
          Left = 48
          Top = 96
          Width = 41
          Height = 17
          Caption = 'R22'
          TabOrder = 22
          OnClick = CheckBox22Click
        end
        object CheckBox349: TCheckBox
          Left = 88
          Top = 96
          Width = 41
          Height = 17
          Caption = 'R23'
          TabOrder = 23
          OnClick = CheckBox22Click
        end
        object CheckBox350: TCheckBox
          Left = 128
          Top = 96
          Width = 41
          Height = 17
          Caption = 'R24'
          TabOrder = 24
          OnClick = CheckBox22Click
        end
      end
      object GroupBox64: TGroupBox
        Left = 280
        Top = 398
        Width = 321
        Height = 54
        Caption = 'Emulation Road Test'
        TabOrder = 3
        object Button9: TButton
          Left = 8
          Top = 27
          Width = 73
          Height = 22
          Caption = 'Emulation'
          TabOrder = 0
          OnClick = Button9Click
        end
        object Button31: TButton
          Left = 248
          Top = 27
          Width = 65
          Height = 22
          Caption = 'Truck Sim'
          TabOrder = 1
          OnClick = Button31Click
        end
        object TipEmul: TRadioGroup
          Left = 120
          Top = 6
          Width = 65
          Height = 44
          ItemIndex = 1
          Items.Strings = (
            'ABS'
            'DSC')
          TabOrder = 2
        end
        object CheckBox104: TCheckBox
          Left = 192
          Top = 8
          Width = 41
          Height = 17
          Caption = 'PrBr'
          Checked = True
          State = cbChecked
          TabOrder = 3
        end
        object CheckBox132: TCheckBox
          Left = 192
          Top = 24
          Width = 49
          Height = 17
          Caption = 'Taxo'
          TabOrder = 4
        end
        object CheckBox227: TCheckBox
          Left = 256
          Top = 8
          Width = 57
          Height = 17
          Caption = 'Deccel'
          TabOrder = 5
          OnClick = CheckBox227Click
        end
      end
      object GroupBox58: TGroupBox
        Left = 280
        Top = 364
        Width = 321
        Height = 36
        Caption = 'Road File'
        TabOrder = 4
        object Label84: TLabel
          Left = 8
          Top = 15
          Width = 31
          Height = 13
          Caption = 'Name:'
        end
        object Label85: TLabel
          Left = 48
          Top = 15
          Width = 51
          Height = 13
          Caption = 'Temp.road'
        end
        object Label263: TLabel
          Left = 238
          Top = 15
          Width = 54
          Height = 13
          Caption = #1058#1080#1087' '#1092#1072#1081#1083#1072
          OnClick = Label263Click
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = #1058#1077#1089#1090#1099
      ImageIndex = 7
      object PageControl3: TPageControl
        Left = 0
        Top = 0
        Width = 660
        Height = 486
        ActivePage = TabSheet16
        Align = alClient
        TabOrder = 0
        OnChange = PageControl3Change
        object TabSheet5: TTabSheet
          Caption = #1052#1086#1076#1091#1083#1103#1090#1086#1088#1099
          object Label122: TLabel
            Left = 8
            Top = 288
            Width = 167
            Height = 13
            Caption = #1044#1083#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100' '#1090#1077#1089#1090#1072' ('#1076#1086' 65535 '#1089')'
          end
          object Label123: TLabel
            Left = 120
            Top = 312
            Width = 35
            Height = 13
            Caption = #1089#1077#1082#1091#1085#1076
          end
          object GroupBox19: TGroupBox
            Left = 184
            Top = 0
            Width = 177
            Height = 73
            Caption = #1055#1077#1088#1077#1076#1085#1080#1081' '#1087#1088#1072#1074#1099#1081
            TabOrder = 1
            object Label151: TLabel
              Left = 12
              Top = 54
              Width = 94
              Height = 13
              Caption = #1082#1086#1083'.'#1089#1088#1072#1073#1072#1090#1099#1074#1072#1085#1080#1081
              Visible = False
            end
            object Button20: TButton
              Left = 8
              Top = 20
              Width = 75
              Height = 25
              Caption = #1058#1077#1089#1090
              TabOrder = 0
              OnClick = Button18Click
            end
            object Button21: TButton
              Left = 88
              Top = 20
              Width = 75
              Height = 25
              Caption = #1042#1099#1087#1091#1089#1082#1085#1086#1081
              Enabled = False
              TabOrder = 1
              Visible = False
              OnClick = Button18Click
            end
          end
          object GroupBox11: TGroupBox
            Left = 0
            Top = 0
            Width = 177
            Height = 73
            Caption = #1055#1077#1088#1077#1076#1085#1080#1081' '#1083#1077#1074#1099#1081
            TabOrder = 3
            object Label150: TLabel
              Left = 12
              Top = 54
              Width = 94
              Height = 13
              Caption = #1082#1086#1083'.'#1089#1088#1072#1073#1072#1090#1099#1074#1072#1085#1080#1081
              Visible = False
            end
            object Button18: TButton
              Left = 8
              Top = 20
              Width = 75
              Height = 25
              Caption = #1058#1077#1089#1090
              TabOrder = 0
              OnClick = Button18Click
            end
            object Button19: TButton
              Left = 88
              Top = 20
              Width = 75
              Height = 25
              Caption = #1042#1099#1087#1091#1089#1082#1085#1086#1081
              Enabled = False
              TabOrder = 1
              Visible = False
              OnClick = Button18Click
            end
          end
          object GroupBox20: TGroupBox
            Left = 0
            Top = 88
            Width = 177
            Height = 73
            Caption = #1047#1072#1076#1085#1080#1081' '#1083#1077#1074#1099#1081
            TabOrder = 2
            object Label153: TLabel
              Left = 12
              Top = 54
              Width = 94
              Height = 13
              Caption = #1082#1086#1083'.'#1089#1088#1072#1073#1072#1090#1099#1074#1072#1085#1080#1081
              Visible = False
            end
            object Button22: TButton
              Left = 8
              Top = 20
              Width = 75
              Height = 25
              Caption = #1058#1077#1089#1090
              TabOrder = 0
              OnClick = Button18Click
            end
            object Button23: TButton
              Left = 88
              Top = 20
              Width = 75
              Height = 25
              Caption = #1042#1099#1087#1091#1089#1082#1085#1086#1081
              Enabled = False
              TabOrder = 1
              Visible = False
              OnClick = Button18Click
            end
          end
          object GroupBox21: TGroupBox
            Left = 184
            Top = 88
            Width = 177
            Height = 73
            Caption = #1047#1072#1076#1085#1080#1081' '#1087#1088#1072#1074#1099#1081
            TabOrder = 0
            object Label154: TLabel
              Left = 12
              Top = 54
              Width = 94
              Height = 13
              Caption = #1082#1086#1083'.'#1089#1088#1072#1073#1072#1090#1099#1074#1072#1085#1080#1081
              Visible = False
            end
            object Button24: TButton
              Left = 8
              Top = 20
              Width = 75
              Height = 25
              Caption = #1058#1077#1089#1090
              TabOrder = 0
              OnClick = Button18Click
            end
            object Button25: TButton
              Left = 88
              Top = 20
              Width = 75
              Height = 25
              Caption = #1042#1099#1087#1091#1089#1082#1085#1086#1081
              Enabled = False
              TabOrder = 1
              Visible = False
              OnClick = Button18Click
            end
          end
          object MaskEdit1: TMaskEdit
            Left = 64
            Top = 308
            Width = 49
            Height = 21
            TabOrder = 4
            Text = '10'
          end
          object GroupBox30: TGroupBox
            Left = 392
            Top = 96
            Width = 177
            Height = 73
            Caption = #1044#1080#1092'.'#1082#1083#1072#1087#1072#1085
            TabOrder = 5
            Visible = False
            object TestDIF: TSpeedButton
              Left = 48
              Top = 20
              Width = 89
              Height = 25
              Cursor = crHandPoint
              AllowAllUp = True
              GroupIndex = 2
              Caption = #1042#1082#1083#1102#1095#1080#1090#1100
              OnClick = TestDIFClick
            end
            object Label152: TLabel
              Left = 12
              Top = 54
              Width = 94
              Height = 13
              Caption = #1082#1086#1083'.'#1089#1088#1072#1073#1072#1090#1099#1074#1072#1085#1080#1081
            end
          end
          object GroupBox46: TGroupBox
            Left = 0
            Top = 176
            Width = 177
            Height = 73
            Caption = #1058#1088#1077#1090#1100#1103' '#1086#1089#1100' '#1083#1077#1074#1099#1081
            TabOrder = 6
            object Label211: TLabel
              Left = 12
              Top = 54
              Width = 94
              Height = 13
              Caption = #1082#1086#1083'.'#1089#1088#1072#1073#1072#1090#1099#1074#1072#1085#1080#1081
              Visible = False
            end
            object Button34: TButton
              Left = 8
              Top = 20
              Width = 75
              Height = 25
              Caption = #1058#1077#1089#1090
              TabOrder = 0
              OnClick = Button18Click
            end
            object Button36: TButton
              Left = 88
              Top = 20
              Width = 75
              Height = 25
              Caption = #1042#1099#1087#1091#1089#1082#1085#1086#1081
              Enabled = False
              TabOrder = 1
              Visible = False
              OnClick = Button18Click
            end
          end
          object GroupBox47: TGroupBox
            Left = 184
            Top = 176
            Width = 177
            Height = 73
            Caption = #1058#1088#1077#1090#1100#1103' '#1086#1089#1100' '#1087#1088#1072#1074#1099#1081
            TabOrder = 7
            object Label212: TLabel
              Left = 12
              Top = 54
              Width = 94
              Height = 13
              Caption = #1082#1086#1083'.'#1089#1088#1072#1073#1072#1090#1099#1074#1072#1085#1080#1081
              Visible = False
            end
            object Button37: TButton
              Left = 8
              Top = 20
              Width = 75
              Height = 25
              Caption = #1058#1077#1089#1090
              TabOrder = 0
              OnClick = Button18Click
            end
            object Button38: TButton
              Left = 88
              Top = 20
              Width = 75
              Height = 25
              Caption = #1042#1099#1087#1091#1089#1082#1085#1086#1081
              Enabled = False
              TabOrder = 1
              Visible = False
              OnClick = Button18Click
            end
          end
        end
        object TabSheet6: TTabSheet
          Caption = #1044#1072#1090#1095#1080#1082#1080
          ImageIndex = 1
          OnShow = TabSheet6Show
          object PaintBox2: TPaintBox
            Left = 0
            Top = 0
            Width = 652
            Height = 220
            Align = alTop
            Color = clBtnFace
            Enabled = False
            ParentColor = False
          end
          object Panel7: TPanel
            Left = 0
            Top = 344
            Width = 652
            Height = 114
            Align = alBottom
            BiDiMode = bdLeftToRight
            ParentBiDiMode = False
            TabOrder = 0
            object GroupBox37: TGroupBox
              Left = 160
              Top = 1
              Width = 81
              Height = 112
              BiDiMode = bdLeftToRight
              Caption = #1040#1084#1087#1083#1080#1090#1091#1076#1072' '
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentBiDiMode = False
              ParentColor = False
              ParentFont = False
              ParentShowHint = False
              ShowHint = False
              TabOrder = 4
              object Label71: TLabel
                Left = 22
                Top = 12
                Width = 6
                Height = 13
                Alignment = taRightJustify
                Caption = '0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label75: TLabel
                Left = 22
                Top = 28
                Width = 6
                Height = 13
                Alignment = taRightJustify
                Caption = '0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGreen
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label76: TLabel
                Left = 22
                Top = 44
                Width = 6
                Height = 13
                Alignment = taRightJustify
                Caption = '0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMaroon
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label77: TLabel
                Left = 22
                Top = 60
                Width = 6
                Height = 13
                Alignment = taRightJustify
                Caption = '0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label101: TLabel
                Left = 40
                Top = 12
                Width = 7
                Height = 13
                Caption = 'B'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label103: TLabel
                Left = 40
                Top = 28
                Width = 7
                Height = 13
                Caption = 'B'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowFrame
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label104: TLabel
                Left = 40
                Top = 44
                Width = 7
                Height = 13
                Caption = 'B'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowFrame
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label105: TLabel
                Left = 40
                Top = 60
                Width = 7
                Height = 13
                Caption = 'B'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowFrame
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label217: TLabel
                Left = 22
                Top = 76
                Width = 6
                Height = 13
                Alignment = taRightJustify
                Caption = '0'
                Color = clBtnFace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end
              object Label218: TLabel
                Left = 22
                Top = 92
                Width = 6
                Height = 13
                Alignment = taRightJustify
                Caption = '0'
                Color = clBtnFace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clTeal
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end
              object Label634: TLabel
                Left = 40
                Top = 76
                Width = 7
                Height = 13
                Caption = 'B'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowFrame
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label635: TLabel
                Left = 40
                Top = 92
                Width = 7
                Height = 13
                Caption = 'B'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowFrame
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
            end
            object CheckBox28: TCheckBox
              Left = 8
              Top = 25
              Width = 65
              Height = 17
              BiDiMode = bdLeftToRight
              Caption = #1044#1063#1042#1050' 2:'
              Checked = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowFrame
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentBiDiMode = False
              ParentFont = False
              State = cbChecked
              TabOrder = 1
              OnClick = CheckBox1Click
            end
            object CheckBox27: TCheckBox
              Left = 8
              Top = 9
              Width = 65
              Height = 17
              BiDiMode = bdLeftToRight
              Caption = #1044#1063#1042#1050' 1:'
              Checked = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowFrame
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentBiDiMode = False
              ParentFont = False
              State = cbChecked
              TabOrder = 0
              OnClick = CheckBox1Click
            end
            object CheckBox29: TCheckBox
              Left = 8
              Top = 41
              Width = 65
              Height = 17
              BiDiMode = bdLeftToRight
              Caption = #1044#1063#1042#1050' 3:'
              Checked = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowFrame
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentBiDiMode = False
              ParentFont = False
              State = cbChecked
              TabOrder = 2
              OnClick = CheckBox1Click
            end
            object CheckBox30: TCheckBox
              Left = 8
              Top = 57
              Width = 65
              Height = 17
              BiDiMode = bdLeftToRight
              Caption = #1044#1063#1042#1050' 4:'
              Checked = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowFrame
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentBiDiMode = False
              ParentFont = False
              State = cbChecked
              TabOrder = 3
              OnClick = CheckBox1Click
            end
            object GroupBox38: TGroupBox
              Left = 78
              Top = 1
              Width = 73
              Height = 112
              Caption = #1057#1082#1086#1088#1086#1089#1090#1100
              TabOrder = 5
              object Label78: TLabel
                Left = 16
                Top = 12
                Width = 6
                Height = 13
                Alignment = taRightJustify
                Caption = '0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label79: TLabel
                Left = 16
                Top = 28
                Width = 6
                Height = 13
                Alignment = taRightJustify
                Caption = '0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGreen
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label80: TLabel
                Left = 16
                Top = 44
                Width = 6
                Height = 13
                Alignment = taRightJustify
                Caption = '0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMaroon
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label102: TLabel
                Left = 16
                Top = 60
                Width = 6
                Height = 13
                Alignment = taRightJustify
                Caption = '0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label106: TLabel
                Left = 36
                Top = 12
                Width = 24
                Height = 13
                Caption = #1082#1084'/'#1095
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowFrame
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label107: TLabel
                Left = 36
                Top = 28
                Width = 24
                Height = 13
                Caption = #1082#1084'/'#1095
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowFrame
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label108: TLabel
                Left = 36
                Top = 44
                Width = 24
                Height = 13
                Caption = #1082#1084'/'#1095
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowFrame
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label109: TLabel
                Left = 36
                Top = 60
                Width = 24
                Height = 13
                Caption = #1082#1084'/'#1095
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowFrame
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label215: TLabel
                Left = 16
                Top = 76
                Width = 6
                Height = 13
                Alignment = taRightJustify
                Caption = '0'
                Color = clBtnFace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end
              object Label216: TLabel
                Left = 16
                Top = 92
                Width = 6
                Height = 13
                Alignment = taRightJustify
                Caption = '0'
                Color = clBtnFace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clTeal
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end
              object Label632: TLabel
                Left = 36
                Top = 76
                Width = 24
                Height = 13
                Caption = #1082#1084'/'#1095
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowFrame
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label633: TLabel
                Left = 36
                Top = 92
                Width = 24
                Height = 13
                Caption = #1082#1084'/'#1095
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowFrame
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
            end
            object GroupBox39: TGroupBox
              Left = 304
              Top = 1
              Width = 161
              Height = 112
              BiDiMode = bdLeftToRight
              Caption = #1053#1072#1087#1088#1103#1078#1077#1085#1080#1103
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clTeal
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentBiDiMode = False
              ParentColor = False
              ParentFont = False
              ParentShowHint = False
              ShowHint = False
              TabOrder = 6
              object Label110: TLabel
                Left = 30
                Top = 12
                Width = 6
                Height = 13
                Alignment = taRightJustify
                Caption = '0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label111: TLabel
                Left = 30
                Top = 28
                Width = 6
                Height = 13
                Alignment = taRightJustify
                Caption = '0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGreen
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label112: TLabel
                Left = 30
                Top = 44
                Width = 6
                Height = 13
                Alignment = taRightJustify
                Caption = '0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMaroon
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label170: TLabel
                Left = 30
                Top = 60
                Width = 6
                Height = 13
                Alignment = taRightJustify
                Caption = '0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label171: TLabel
                Left = 48
                Top = 12
                Width = 7
                Height = 13
                Caption = 'B'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label172: TLabel
                Left = 48
                Top = 28
                Width = 7
                Height = 13
                Caption = 'B'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowFrame
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label173: TLabel
                Left = 48
                Top = 44
                Width = 7
                Height = 13
                Caption = 'B'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowFrame
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label174: TLabel
                Left = 48
                Top = 60
                Width = 7
                Height = 13
                Caption = 'B'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowFrame
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label175: TLabel
                Left = 118
                Top = 12
                Width = 6
                Height = 13
                Alignment = taRightJustify
                Caption = '0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label198: TLabel
                Left = 134
                Top = 12
                Width = 7
                Height = 13
                Caption = 'B'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label176: TLabel
                Left = 118
                Top = 28
                Width = 6
                Height = 13
                Alignment = taRightJustify
                Caption = '0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGreen
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label204: TLabel
                Left = 134
                Top = 28
                Width = 7
                Height = 13
                Caption = 'B'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowFrame
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label177: TLabel
                Left = 118
                Top = 44
                Width = 6
                Height = 13
                Alignment = taRightJustify
                Caption = '0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMaroon
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label206: TLabel
                Left = 134
                Top = 44
                Width = 7
                Height = 13
                Caption = 'B'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowFrame
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label178: TLabel
                Left = 118
                Top = 60
                Width = 6
                Height = 13
                Alignment = taRightJustify
                Caption = '0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label208: TLabel
                Left = 134
                Top = 60
                Width = 7
                Height = 13
                Caption = 'B'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowFrame
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label219: TLabel
                Left = 30
                Top = 76
                Width = 6
                Height = 13
                Alignment = taRightJustify
                Caption = '0'
                Color = clBtnFace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end
              object Label220: TLabel
                Left = 30
                Top = 92
                Width = 6
                Height = 13
                Alignment = taRightJustify
                Caption = '0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clTeal
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label221: TLabel
                Left = 118
                Top = 76
                Width = 6
                Height = 13
                Alignment = taRightJustify
                Caption = '0'
                Color = clBtnFace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end
              object Label222: TLabel
                Left = 118
                Top = 92
                Width = 6
                Height = 13
                Alignment = taRightJustify
                Caption = '0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clTeal
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label636: TLabel
                Left = 48
                Top = 76
                Width = 7
                Height = 13
                Caption = 'B'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowFrame
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label637: TLabel
                Left = 134
                Top = 76
                Width = 7
                Height = 13
                Caption = 'B'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowFrame
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label638: TLabel
                Left = 48
                Top = 92
                Width = 7
                Height = 13
                Caption = 'B'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowFrame
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label639: TLabel
                Left = 134
                Top = 92
                Width = 7
                Height = 13
                Caption = 'B'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowFrame
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
            end
            object GroupBox40: TGroupBox
              Left = 472
              Top = 1
              Width = 81
              Height = 112
              BiDiMode = bdLeftToRight
              Caption = 'Act Test'
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentBiDiMode = False
              ParentColor = False
              ParentFont = False
              ParentShowHint = False
              ShowHint = False
              TabOrder = 7
              object Label180: TLabel
                Left = 54
                Top = 28
                Width = 7
                Height = 13
                Caption = 'B'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowFrame
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label181: TLabel
                Left = 54
                Top = 44
                Width = 7
                Height = 13
                Caption = 'B'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowFrame
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label182: TLabel
                Left = 54
                Top = 60
                Width = 7
                Height = 13
                Caption = 'B'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowFrame
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label183: TLabel
                Left = 38
                Top = 12
                Width = 6
                Height = 13
                Alignment = taRightJustify
                Caption = '0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label184: TLabel
                Left = 38
                Top = 28
                Width = 6
                Height = 13
                Alignment = taRightJustify
                Caption = '0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGreen
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label185: TLabel
                Left = 38
                Top = 44
                Width = 6
                Height = 13
                Alignment = taRightJustify
                Caption = '0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMaroon
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label186: TLabel
                Left = 38
                Top = 60
                Width = 6
                Height = 13
                Alignment = taRightJustify
                Caption = '0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label223: TLabel
                Left = 38
                Top = 76
                Width = 6
                Height = 13
                Alignment = taRightJustify
                Caption = '0'
                Color = clBtnFace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end
              object Label224: TLabel
                Left = 38
                Top = 92
                Width = 6
                Height = 13
                Alignment = taRightJustify
                Caption = '0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clTeal
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label179: TLabel
                Left = 54
                Top = 12
                Width = 7
                Height = 13
                Caption = 'B'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowFrame
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
            end
            object CheckBox46: TCheckBox
              Left = 8
              Top = 73
              Width = 65
              Height = 17
              BiDiMode = bdLeftToRight
              Caption = #1044#1063#1042#1050' 5:'
              Checked = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowFrame
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentBiDiMode = False
              ParentFont = False
              State = cbChecked
              TabOrder = 8
              OnClick = CheckBox1Click
            end
            object CheckBox47: TCheckBox
              Left = 8
              Top = 89
              Width = 65
              Height = 17
              BiDiMode = bdLeftToRight
              Caption = #1044#1063#1042#1050' 6:'
              Checked = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowFrame
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentBiDiMode = False
              ParentFont = False
              State = cbChecked
              TabOrder = 9
              OnClick = CheckBox1Click
            end
            object CheckBox331: TCheckBox
              Left = 560
              Top = 88
              Width = 97
              Height = 17
              Caption = 'SS_Check'
              TabOrder = 10
            end
            object Edit425: TEdit
              Left = 559
              Top = 52
              Width = 44
              Height = 21
              TabOrder = 11
              Text = 'SS Fail'
              Visible = False
            end
          end
        end
        object TabSheet7: TTabSheet
          Caption = 'Body Controller'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ImageIndex = 2
          ParentFont = False
          object GroupBox15: TGroupBox
            Left = 4
            Top = 0
            Width = 253
            Height = 82
            Caption = #1050#1085#1086#1087#1082#1080
            TabOrder = 0
            object Label94: TLabel
              Left = 8
              Top = 14
              Width = 105
              Height = 14
              Caption = #1055#1077#1088#1077#1082#1083#1102#1095#1072#1090#1077#1083#1100' ABS'
            end
            object Label95: TLabel
              Left = 8
              Top = 30
              Width = 105
              Height = 14
              Caption = #1055#1077#1088#1077#1082#1083#1102#1095#1072#1090#1077#1083#1100' ASR'
            end
            object Label96: TLabel
              Left = 8
              Top = 62
              Width = 100
              Height = 14
              Caption = #1055#1077#1088#1077#1082#1083#1102#1095#1072#1090#1077#1083#1100' DIA'
            end
            object Label97: TLabel
              Left = 136
              Top = 14
              Width = 86
              Height = 14
              Caption = #1053#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object Label124: TLabel
              Left = 136
              Top = 62
              Width = 86
              Height = 14
              Caption = #1053#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
            end
            object Label125: TLabel
              Left = 136
              Top = 30
              Width = 86
              Height = 14
              Caption = #1053#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
            end
            object Label190: TLabel
              Left = 8
              Top = 46
              Width = 108
              Height = 14
              Caption = #1055#1077#1088#1077#1082#1083#1102#1095#1072#1090#1077#1083#1100' TSET'
            end
            object Label191: TLabel
              Left = 136
              Top = 46
              Width = 86
              Height = 14
              Caption = #1053#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
            end
          end
          object GroupBox29: TGroupBox
            Left = 4
            Top = 194
            Width = 253
            Height = 63
            Caption = #1057#1090#1086#1087'-'#1089#1080#1075#1085#1072#1083
            TabOrder = 1
            object Label142: TLabel
              Left = 24
              Top = 44
              Width = 73
              Height = 14
              Caption = #1042#1099#1082#1083#1102#1095#1072#1090#1077#1083#1100' '
            end
            object Label143: TLabel
              Left = 160
              Top = 44
              Width = 86
              Height = 14
              Caption = #1053#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object Label144: TLabel
              Left = 8
              Top = 26
              Width = 163
              Height = 14
              Caption = #1044#1072#1090#1095#1080#1082' '#1076#1072#1074#1083#1077#1085#1080#1103'                 '#1072#1090#1084' '
            end
            object Label155: TLabel
              Left = 112
              Top = 8
              Width = 87
              Height = 14
              Caption = '0  '#1089#1088#1072#1073#1072#1090#1099#1074#1072#1085#1080#1081
              Visible = False
            end
            object Edit13: TEdit
              Left = 104
              Top = 22
              Width = 41
              Height = 27
              Enabled = False
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clNavy
              Font.Height = -16
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
            end
          end
          object GroupBox160: TGroupBox
            Left = 304
            Top = 0
            Width = 345
            Height = 356
            Caption = 'Dash Board     '#1065#1055'8155 '#1042#1080#1090#1077#1073#1089#1082
            TabOrder = 2
            object GroupBox114: TGroupBox
              Left = 8
              Top = 308
              Width = 177
              Height = 41
              Caption = 'AMB'
              TabOrder = 0
              object Label398: TLabel
                Left = 8
                Top = 16
                Width = 137
                Height = 14
                Caption = 'Ambient Air                  deg C'
              end
              object Label417: TLabel
                Left = 40
                Top = 0
                Width = 20
                Height = 14
                Caption = 'Tout'
              end
              object Edit160: TEdit
                Left = 80
                Top = 12
                Width = 31
                Height = 22
                TabOrder = 0
              end
            end
            object GroupBox178: TGroupBox
              Left = 8
              Top = 12
              Width = 329
              Height = 148
              Caption = 'PGN  0xFF20'
              TabOrder = 1
              object Label544: TLabel
                Left = 24
                Top = 14
                Width = 46
                Height = 14
                Caption = #1057#1090#1072#1090#1091#1089' 1'
              end
              object Label545: TLabel
                Left = 168
                Top = 14
                Width = 46
                Height = 14
                Caption = #1057#1090#1072#1090#1091#1089' 2'
              end
              object Edit305: TEdit
                Left = 80
                Top = 12
                Width = 31
                Height = 22
                TabOrder = 0
              end
              object Edit306: TEdit
                Left = 222
                Top = 12
                Width = 31
                Height = 22
                TabOrder = 1
              end
              object CheckBox185: TCheckBox
                Left = 8
                Top = 32
                Width = 97
                Height = 17
                Caption = 'SPN 70 Parking'
                TabOrder = 2
              end
              object CheckBox186: TCheckBox
                Left = 8
                Top = 46
                Width = 153
                Height = 17
                Caption = #1085#1077#1080#1089#1087#1088#1072#1074#1085#1086#1089#1090#1100' '#1090#1086#1088#1084'.'#1089#1080#1089
                TabOrder = 3
              end
              object CheckBox187: TCheckBox
                Left = 8
                Top = 59
                Width = 153
                Height = 17
                Caption = #1085#1077#1080#1089#1087#1088#1072#1074#1085#1086#1089#1090#1100' '#1082#1086#1085#1090#1091#1088' 2'
                TabOrder = 4
              end
              object CheckBox188: TCheckBox
                Left = 8
                Top = 72
                Width = 153
                Height = 17
                Caption = #1085#1077#1080#1089#1087#1088#1072#1074#1085#1086#1089#1090#1100' '#1082#1086#1085#1090#1091#1088' 1'
                TabOrder = 5
              end
              object CheckBox189: TCheckBox
                Left = 8
                Top = 85
                Width = 161
                Height = 17
                Caption = #1084#1077#1078#1082#1086#1083#1077#1089#1085#1099#1081' '#1076#1080#1092#1077#1088#1077#1085#1094#1080#1072#1083
                TabOrder = 6
              end
              object CheckBox190: TCheckBox
                Left = 8
                Top = 100
                Width = 153
                Height = 17
                Caption = #1084#1077#1078#1086#1089#1077#1074#1086#1081' '#1076#1080#1092#1077#1088#1077#1085#1094#1080#1072#1083
                TabOrder = 7
              end
              object CheckBox191: TCheckBox
                Left = 8
                Top = 114
                Width = 153
                Height = 17
                Caption = #1085#1077#1081#1090#1088#1072#1083#1100
                TabOrder = 8
              end
              object CheckBox192: TCheckBox
                Left = 8
                Top = 128
                Width = 153
                Height = 17
                Caption = #1076#1077#1084#1091#1083#1100#1090#1087#1083#1080#1082#1072#1090#1086#1088' '#1087#1086#1074#1099#1096'.'
                TabOrder = 9
              end
              object CheckBox193: TCheckBox
                Left = 168
                Top = 40
                Width = 158
                Height = 17
                Caption = #1080#1079#1085#1086#1089' '#1090#1086#1088#1084#1086#1079#1085#1099#1093' '#1085#1072#1082#1083#1072#1076#1086#1082
                TabOrder = 10
              end
              object CheckBox194: TCheckBox
                Left = 168
                Top = 54
                Width = 153
                Height = 17
                Caption = #1082#1088#1080#1090#1080#1095#1077#1089#1082#1072#1103' '#1086#1096#1080#1073#1082#1072' EDC'
                TabOrder = 11
              end
              object CheckBox195: TCheckBox
                Left = 168
                Top = 67
                Width = 156
                Height = 17
                Caption = #1085#1077' '#1082#1088#1080#1090#1080#1095#1085#1072#1103' '#1086#1096#1080#1073#1082#1072' EDC'
                TabOrder = 12
              end
              object CheckBox196: TCheckBox
                Left = 168
                Top = 80
                Width = 153
                Height = 17
                Caption = 'SPN 595 Cruise Active'
                TabOrder = 13
              end
              object CheckBox197: TCheckBox
                Left = 168
                Top = 93
                Width = 153
                Height = 17
                Caption = #1088#1072#1079#1088#1103#1076' '#1040#1050#1041
                TabOrder = 14
              end
              object CheckBox198: TCheckBox
                Left = 168
                Top = 108
                Width = 153
                Height = 17
                Caption = #1087#1086#1084#1086#1097#1100' '#1087#1088#1080' '#1090#1088#1086#1075#1072#1085#1080#1080
                TabOrder = 15
              end
              object CheckBox199: TCheckBox
                Left = 168
                Top = 122
                Width = 153
                Height = 17
                Caption = 'SPN 5082'
                TabOrder = 16
              end
            end
            object GroupBox179: TGroupBox
              Left = 8
              Top = 160
              Width = 177
              Height = 149
              Caption = 'PGN  0xFF21'
              TabOrder = 2
              object Label546: TLabel
                Left = 32
                Top = 14
                Width = 37
                Height = 14
                Caption = #1057#1090#1072#1090#1091#1089
              end
              object Edit307: TEdit
                Left = 80
                Top = 12
                Width = 31
                Height = 22
                TabOrder = 0
              end
              object CheckBox200: TCheckBox
                Left = 8
                Top = 32
                Width = 161
                Height = 17
                Caption = #1080#1079#1085#1086#1089' '#1090#1086#1088#1084#1086#1079#1085#1099#1093' '#1085#1072#1082#1083#1072#1076#1086#1082
                TabOrder = 1
              end
              object CheckBox201: TCheckBox
                Left = 8
                Top = 46
                Width = 164
                Height = 17
                Caption = #1085#1077' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1085#1086#1077' '#1087#1086#1083#1086#1078#1077#1085#1080#1077
                TabOrder = 2
              end
              object CheckBox202: TCheckBox
                Left = 8
                Top = 59
                Width = 153
                Height = 17
                Caption = #1085#1077#1081#1090#1088#1072#1083#1100' '#1088#1072#1079#1076#1072#1090#1082#1080
                TabOrder = 3
              end
              object CheckBox203: TCheckBox
                Left = 8
                Top = 72
                Width = 153
                Height = 17
                Caption = #1076#1077#1083#1080#1090#1077#1083#1100' '#1087#1086#1085#1080#1078'.'
                TabOrder = 4
              end
              object CheckBox204: TCheckBox
                Left = 8
                Top = 85
                Width = 161
                Height = 17
                Caption = #1076#1080#1092#1077#1088#1077#1085#1094#1080#1072#1083' '#1087#1077#1088#1077#1076'. '#1084#1086#1089#1090#1072
                TabOrder = 5
              end
              object CheckBox205: TCheckBox
                Left = 8
                Top = 100
                Width = 161
                Height = 17
                Caption = #1084#1077#1078#1086#1089#1077#1074#1086#1081' '#1076#1080#1092'. '#1088#1072#1079#1076#1072#1090#1082#1080
                TabOrder = 6
              end
              object CheckBox206: TCheckBox
                Left = 8
                Top = 114
                Width = 153
                Height = 17
                Caption = 'SPN 520 '#1079#1072#1084#1077#1076#1083#1080#1090#1077#1083#1100
                TabOrder = 7
              end
              object CheckBox207: TCheckBox
                Left = 8
                Top = 128
                Width = 153
                Height = 17
                Caption = #1085#1077#1080#1089#1087#1088#1072#1074#1085#1086#1089#1090#1100' '#1088#1091#1083#1103
                TabOrder = 8
              end
            end
            object GroupBox180: TGroupBox
              Left = 192
              Top = 160
              Width = 145
              Height = 120
              Caption = 'PGN  0xFF22'
              TabOrder = 3
              object Label547: TLabel
                Left = 8
                Top = 16
                Width = 67
                Height = 14
                Caption = 'Brake Primary'
              end
              object Label548: TLabel
                Left = 8
                Top = 35
                Width = 84
                Height = 14
                Caption = 'Brake Secondary'
              end
              object Label549: TLabel
                Left = 8
                Top = 54
                Width = 71
                Height = 14
                Caption = 'Engine Coolant'
              end
              object Label550: TLabel
                Left = 24
                Top = 76
                Width = 58
                Height = 14
                Caption = 'Engine Taxo'
              end
              object Label552: TLabel
                Left = 24
                Top = 96
                Width = 49
                Height = 14
                Caption = 'Fuel Level'
              end
              object Edit308: TEdit
                Left = 94
                Top = 12
                Width = 31
                Height = 22
                TabOrder = 0
              end
              object Edit309: TEdit
                Left = 94
                Top = 32
                Width = 31
                Height = 22
                TabOrder = 1
              end
              object Edit310: TEdit
                Left = 94
                Top = 52
                Width = 31
                Height = 22
                TabOrder = 2
              end
              object Edit311: TEdit
                Left = 94
                Top = 72
                Width = 31
                Height = 22
                TabOrder = 3
              end
              object Edit313: TEdit
                Left = 94
                Top = 92
                Width = 31
                Height = 22
                TabOrder = 4
              end
            end
            object GroupBox181: TGroupBox
              Left = 192
              Top = 280
              Width = 145
              Height = 41
              Caption = 'PGN  0xFF23'
              TabOrder = 4
              object Label551: TLabel
                Left = 8
                Top = 16
                Width = 127
                Height = 14
                Caption = 'Battery Voltage               V'
              end
              object Edit312: TEdit
                Left = 94
                Top = 12
                Width = 31
                Height = 22
                TabOrder = 0
              end
            end
          end
          object GroupBox185: TGroupBox
            Left = 4
            Top = 328
            Width = 253
            Height = 121
            Caption = #1041#1057#1059' '#1053#1043#1050
            TabOrder = 3
            object GroupBox209: TGroupBox
              Left = 8
              Top = 14
              Width = 217
              Height = 101
              Caption = #1050#1086#1088#1086#1073#1082#1072' '#1087#1077#1088#1077#1076#1072#1095
              TabOrder = 0
              object GroupBox188: TGroupBox
                Left = 8
                Top = 12
                Width = 201
                Height = 41
                Caption = 'Gear State'
                TabOrder = 0
                object Label128: TLabel
                  Left = 72
                  Top = 16
                  Width = 102
                  Height = 14
                  Caption = #1055#1077#1088#1077#1076#1072#1095#1072' '#1074#1082#1083#1102#1095#1077#1085#1072
                end
                object Edit371: TEdit
                  Left = 8
                  Top = 14
                  Width = 31
                  Height = 22
                  TabOrder = 0
                end
              end
              object GroupBox201: TGroupBox
                Left = 8
                Top = 52
                Width = 201
                Height = 41
                Caption = 'Gear Number'
                TabOrder = 1
                object Label605: TLabel
                  Left = 72
                  Top = 16
                  Width = 48
                  Height = 14
                  Caption = #1085#1077#1081#1090#1088#1072#1083#1100
                end
                object Edit372: TEdit
                  Left = 8
                  Top = 14
                  Width = 31
                  Height = 22
                  TabOrder = 0
                end
              end
            end
          end
          object GroupBox115: TGroupBox
            Left = 304
            Top = 359
            Width = 234
            Height = 90
            Caption = 'Gear Box'
            TabOrder = 4
            object Label399: TLabel
              Left = 8
              Top = 14
              Width = 106
              Height = 14
              Caption = #1055#1077#1088#1077#1076#1072#1090#1086#1095#1085#1086#1077' '#1095#1080#1089#1083#1086
            end
            object Label400: TLabel
              Left = 8
              Top = 36
              Width = 85
              Height = 14
              Caption = #1053#1086#1084#1077#1088' '#1055#1077#1088#1077#1076#1072#1095#1080
            end
            object Label401: TLabel
              Left = 82
              Top = 56
              Width = 85
              Height = 14
              Caption = #1085#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
            end
            object Label402: TLabel
              Left = 10
              Top = 56
              Width = 61
              Height = 14
              Caption = #1058#1088#1072#1085#1089#1084#1080#1089#1080#1103
            end
            object Label403: TLabel
              Left = 10
              Top = 70
              Width = 58
              Height = 14
              Caption = #1047#1072#1076#1085#1080#1081' '#1093#1086#1076
            end
            object Label404: TLabel
              Left = 82
              Top = 70
              Width = 85
              Height = 14
              Caption = #1085#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
            end
            object Edit161: TEdit
              Left = 122
              Top = 12
              Width = 66
              Height = 22
              TabOrder = 0
            end
            object Edit162: TEdit
              Left = 122
              Top = 34
              Width = 66
              Height = 22
              TabOrder = 1
            end
          end
          object GroupBox149: TGroupBox
            Left = 4
            Top = 82
            Width = 253
            Height = 113
            Caption = 'CAN EBC1'
            TabOrder = 5
            object Label367: TLabel
              Left = 6
              Top = 34
              Width = 50
              Height = 14
              Caption = #1040#1076#1088#1077#1089' SA'
            end
            object Label495: TLabel
              Left = 28
              Top = 52
              Width = 28
              Height = 14
              Caption = 'Byte3'
            end
            object Label496: TLabel
              Left = 28
              Top = 70
              Width = 28
              Height = 14
              Caption = 'Byte6'
            end
            object Label497: TLabel
              Left = 96
              Top = 28
              Width = 58
              Height = 14
              Caption = 'Switch ABS'
            end
            object Label498: TLabel
              Left = 96
              Top = 44
              Width = 58
              Height = 14
              Caption = 'Switch ASR'
            end
            object Label499: TLabel
              Left = 96
              Top = 60
              Width = 51
              Height = 14
              Caption = 'ASR Lamp'
            end
            object Label500: TLabel
              Left = 96
              Top = 76
              Width = 51
              Height = 14
              Caption = 'ABS Lamp'
            end
            object Label501: TLabel
              Left = 160
              Top = 28
              Width = 86
              Height = 14
              Caption = #1053#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
            end
            object Label502: TLabel
              Left = 160
              Top = 44
              Width = 86
              Height = 14
              Caption = #1053#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
            end
            object Label503: TLabel
              Left = 160
              Top = 60
              Width = 86
              Height = 14
              Caption = #1053#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
            end
            object Label504: TLabel
              Left = 160
              Top = 76
              Width = 86
              Height = 14
              Caption = #1053#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
            end
            object Label505: TLabel
              Left = 28
              Top = 88
              Width = 28
              Height = 14
              Caption = 'Byte7'
            end
            object Label506: TLabel
              Left = 96
              Top = 92
              Width = 59
              Height = 14
              Caption = 'Trailer Lamp'
            end
            object Label507: TLabel
              Left = 160
              Top = 92
              Width = 86
              Height = 14
              Caption = #1053#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
            end
            object Label511: TLabel
              Left = 6
              Top = 14
              Width = 67
              Height = 14
              Caption = 'EBC1 not Find'
            end
            object Edit249: TEdit
              Left = 58
              Top = 28
              Width = 31
              Height = 22
              TabOrder = 0
              OnChange = ParamChange
            end
            object Edit250: TEdit
              Left = 58
              Top = 50
              Width = 31
              Height = 22
              TabOrder = 1
              OnChange = ParamChange
            end
            object Edit251: TEdit
              Left = 58
              Top = 68
              Width = 31
              Height = 22
              TabOrder = 2
              OnChange = ParamChange
            end
            object Edit252: TEdit
              Left = 58
              Top = 86
              Width = 31
              Height = 22
              TabOrder = 3
              OnChange = ParamChange
            end
          end
          object GroupBox223: TGroupBox
            Left = 4
            Top = 256
            Width = 253
            Height = 63
            Caption = 'Door Control'
            TabOrder = 6
            object Label127: TLabel
              Left = 16
              Top = 38
              Width = 57
              Height = 14
              Caption = 'Door Status'
            end
            object Label606: TLabel
              Left = 120
              Top = 38
              Width = 80
              Height = 14
              Caption = #1044#1074#1077#1088#1080' '#1079#1072#1082#1088#1099#1090#1099
            end
            object Label626: TLabel
              Left = 14
              Top = 15
              Width = 50
              Height = 14
              Caption = #1040#1076#1088#1077#1089' SA'
            end
            object Edit287: TEdit
              Left = 74
              Top = 36
              Width = 31
              Height = 22
              TabOrder = 0
            end
            object Edit398: TEdit
              Left = 74
              Top = 10
              Width = 31
              Height = 22
              TabOrder = 1
              OnChange = ParamChange
            end
          end
        end
        object PropKl: TTabSheet
          Cursor = crHandPoint
          Caption = #1055#1088#1086#1087'.'#1082#1083#1072#1087#1072#1085
          ImageIndex = 3
          object GroupBox24: TGroupBox
            Left = 24
            Top = 24
            Width = 361
            Height = 129
            Caption = 'PWM'
            TabOrder = 0
            object Label129: TLabel
              Left = 24
              Top = 48
              Width = 14
              Height = 13
              Caption = '0%'
            end
            object Label130: TLabel
              Left = 320
              Top = 48
              Width = 26
              Height = 13
              Caption = '100%'
            end
            object Label131: TLabel
              Left = 181
              Top = 24
              Width = 14
              Height = 13
              Caption = '0%'
            end
            object Label132: TLabel
              Left = 48
              Top = 24
              Width = 128
              Height = 13
              Caption = #1058#1077#1082#1091#1097#1077#1077' '#1079#1085#1072#1095#1077#1085#1080#1077'  PWM'
            end
            object TrackBar1: TTrackBar
              Left = 16
              Top = 74
              Width = 329
              Height = 47
              Cursor = crHandPoint
              LineSize = 2
              Max = 100
              Frequency = 10
              TabOrder = 0
              ThumbLength = 25
              TickMarks = tmTopLeft
              OnChange = TrackBar1Change
            end
          end
          object GroupBox42: TGroupBox
            Left = 400
            Top = 24
            Width = 185
            Height = 217
            Caption = 'Test'
            TabOrder = 1
            object Label200: TLabel
              Left = 34
              Top = 24
              Width = 23
              Height = 13
              Caption = 'Time'
            end
            object Label201: TLabel
              Left = 15
              Top = 56
              Width = 50
              Height = 13
              Caption = 'Max PWM'
            end
            object Label202: TLabel
              Left = 18
              Top = 88
              Width = 47
              Height = 13
              Caption = 'Min PWM'
            end
            object Label203: TLabel
              Left = 10
              Top = 120
              Width = 55
              Height = 13
              Caption = 'Delta PWM'
            end
            object Edit40: TEdit
              Left = 72
              Top = 16
              Width = 81
              Height = 21
              TabOrder = 0
              Text = '2000'
            end
            object Edit41: TEdit
              Left = 72
              Top = 48
              Width = 81
              Height = 21
              TabOrder = 1
              Text = '80'
            end
            object Edit43: TEdit
              Left = 72
              Top = 80
              Width = 81
              Height = 21
              TabOrder = 2
              Text = '0'
            end
            object Edit42: TEdit
              Left = 72
              Top = 112
              Width = 81
              Height = 21
              TabOrder = 3
              Text = '10'
            end
            object Button30: TButton
              Left = 78
              Top = 144
              Width = 75
              Height = 25
              Caption = 'Off'
              TabOrder = 4
              OnClick = Button30Click
            end
          end
        end
        object TabSheet11: TTabSheet
          Caption = 'CAN'
          ImageIndex = 4
          OnShow = TabSheet6Show
          object CANOssBox: TPaintBox
            Left = 0
            Top = 0
            Width = 596
            Height = 256
          end
          object Panel5: TPanel
            Left = 0
            Top = 264
            Width = 593
            Height = 41
            TabOrder = 3
          end
          object Button27: TButton
            Left = 136
            Top = 272
            Width = 75
            Height = 25
            Caption = 'Graph'
            TabOrder = 0
            OnClick = Button27Click
          end
          object Button28: TButton
            Left = 16
            Top = 272
            Width = 75
            Height = 25
            Caption = 'Start Test'
            TabOrder = 1
            OnClick = Button28Click
          end
          object Button29: TButton
            Left = 496
            Top = 272
            Width = 89
            Height = 25
            Caption = 'Save File as...'
            TabOrder = 2
            OnClick = Button29Click
          end
          object Button76: TButton
            Left = 600
            Top = 268
            Width = 49
            Height = 25
            Caption = 'Stop'
            TabOrder = 4
            OnClick = Button76Click
          end
          object grp1: TGroupBox
            Left = 0
            Top = 306
            Width = 649
            Height = 150
            Caption = 'A'#1076#1072#1087#1090#1077#1088' CANUSB '
            TabOrder = 5
            object Label613: TLabel
              Left = 48
              Top = 57
              Width = 47
              Height = 13
              Caption = 'Label613 '
            end
            object Label688: TLabel
              Left = 134
              Top = 21
              Width = 46
              Height = 13
              Caption = 'CRC CFG'
            end
            object grp2: TGroupBox
              Left = 448
              Top = 8
              Width = 193
              Height = 67
              Caption = 'Test'
              TabOrder = 0
              object Edit375: TEdit
                Left = 16
                Top = 14
                Width = 57
                Height = 21
                TabOrder = 0
              end
              object Test1: TButton
                Left = 16
                Top = 36
                Width = 57
                Height = 25
                Caption = 'Stop'
                Enabled = False
                TabOrder = 1
                OnClick = Test1Click
              end
              object grp3: TGroupBox
                Left = 80
                Top = 8
                Width = 49
                Height = 44
                Caption = 'USB'
                TabOrder = 2
                object Test2: TButton
                  Left = 8
                  Top = 14
                  Width = 33
                  Height = 25
                  Caption = 'Stop'
                  Enabled = False
                  TabOrder = 0
                  OnClick = Test2Click
                end
              end
              object grp4: TGroupBox
                Left = 136
                Top = 8
                Width = 49
                Height = 44
                Caption = 'CAN'
                TabOrder = 3
                object Test3: TButton
                  Left = 8
                  Top = 14
                  Width = 33
                  Height = 25
                  Caption = 'Stop'
                  Enabled = False
                  TabOrder = 0
                  OnClick = Test3Click
                end
              end
            end
            object grp5: TGroupBox
              Left = 8
              Top = 12
              Width = 113
              Height = 33
              Caption = #1057#1077#1088#1080#1081#1085#1099#1081' '#1085#1086#1084#1077#1088
              TabOrder = 1
              object Label612: TLabel
                Left = 8
                Top = 16
                Width = 44
                Height = 13
                Caption = 'Label612'
              end
            end
            object grp6: TGroupBox
              Left = 312
              Top = 8
              Width = 129
              Height = 67
              Caption = 'USB Serial Port'
              TabOrder = 2
              object Label576: TLabel
                Left = 8
                Top = 42
                Width = 24
                Height = 13
                Caption = 'COM'
              end
              object Label611: TLabel
                Left = 8
                Top = 16
                Width = 48
                Height = 13
                Caption = 'BaudRate'
              end
              object Edit374: TEdit
                Left = 32
                Top = 38
                Width = 25
                Height = 21
                TabOrder = 0
                OnDblClick = Edit374DblClick
              end
              object Edit379: TEdit
                Left = 64
                Top = 14
                Width = 57
                Height = 21
                TabOrder = 1
                OnDblClick = Edit379DblClick
              end
              object USBopen: TButton
                Left = 64
                Top = 36
                Width = 57
                Height = 25
                Caption = 'Closed'
                TabOrder = 2
                OnClick = USBopenClick
              end
            end
            object grp7: TGroupBox
              Left = 8
              Top = 76
              Width = 633
              Height = 68
              Caption = 'UpGrade CANUSB '#1072#1076#1072#1087#1090#1077#1088#1072
              TabOrder = 3
              object Label608: TLabel
                Left = 308
                Top = 45
                Width = 49
                Height = 13
                Caption = 'CRC PGM'
              end
              object Label609: TLabel
                Left = 440
                Top = 45
                Width = 20
                Height = 13
                Caption = 'Size'
              end
              object Label610: TLabel
                Left = 8
                Top = 18
                Width = 16
                Height = 13
                Caption = 'File'
              end
              object Edit376: TEdit
                Left = 358
                Top = 42
                Width = 75
                Height = 21
                TabOrder = 0
                Text = 'Edit376'
              end
              object Edit377: TEdit
                Left = 464
                Top = 42
                Width = 44
                Height = 21
                TabOrder = 1
              end
              object UpGrade: TButton
                Left = 568
                Top = 36
                Width = 49
                Height = 25
                Caption = 'Start'
                Enabled = False
                TabOrder = 2
                OnClick = UpGradeClick
              end
              object Edit378: TEdit
                Left = 26
                Top = 16
                Width = 511
                Height = 21
                TabOrder = 3
                OnDblClick = Edit378DblClick
              end
              object Edit380: TEdit
                Left = 504
                Top = 42
                Width = 30
                Height = 21
                TabOrder = 4
              end
            end
            object Edit449: TEdit
              Left = 182
              Top = 18
              Width = 75
              Height = 21
              TabOrder = 4
              Text = 'Edit376'
            end
          end
        end
        object TabSheet16: TTabSheet
          Caption = #1058#1103#1075#1072#1095' VDC '
          ImageIndex = 5
          object GroupBox62: TGroupBox
            Left = 0
            Top = 0
            Width = 153
            Height = 144
            Caption = #1058#1077#1089#1090'   PulsPress'
            TabOrder = 0
            object Label255: TLabel
              Left = 8
              Top = 16
              Width = 85
              Height = 13
              Caption = #1055#1077#1088#1077#1076#1085#1080#1081' '#1083#1077#1074#1099#1081
            end
            object Label256: TLabel
              Left = 8
              Top = 37
              Width = 91
              Height = 13
              Caption = #1055#1077#1088#1077#1076#1085#1080#1081' '#1087#1088#1072#1074#1099#1081
            end
            object Label257: TLabel
              Left = 8
              Top = 59
              Width = 72
              Height = 13
              Caption = #1047#1072#1076#1085#1080#1081' '#1083#1077#1074#1099#1081
            end
            object Label258: TLabel
              Left = 8
              Top = 80
              Width = 78
              Height = 13
              Caption = #1047#1072#1076#1085#1080#1081' '#1087#1088#1072#1074#1099#1081
            end
            object Label266: TLabel
              Left = 74
              Top = 104
              Width = 22
              Height = 13
              Caption = #1042#1089#1077' '
            end
            object Button43: TButton
              Left = 104
              Top = 8
              Width = 41
              Height = 22
              Caption = 'Puls'
              TabOrder = 0
              OnClick = TestPulsClick
            end
            object Button44: TButton
              Left = 104
              Top = 32
              Width = 41
              Height = 22
              Caption = 'Puls'
              TabOrder = 1
              OnClick = TestPulsClick
            end
            object Button45: TButton
              Left = 104
              Top = 56
              Width = 41
              Height = 22
              Caption = 'Puls'
              TabOrder = 2
              OnClick = TestPulsClick
            end
            object Button46: TButton
              Left = 104
              Top = 80
              Width = 41
              Height = 22
              Caption = 'Puls'
              TabOrder = 3
              OnClick = TestPulsClick
            end
            object Button50: TButton
              Left = 104
              Top = 104
              Width = 41
              Height = 22
              Caption = 'Puls'
              TabOrder = 4
              OnClick = TestPulsClick
            end
            object Button51: TButton
              Left = 8
              Top = 116
              Width = 57
              Height = 22
              Caption = #1057#1073#1088#1086#1089
              TabOrder = 5
              OnClick = TestPulsClick
            end
          end
          object GroupBox59: TGroupBox
            Left = 484
            Top = 234
            Width = 163
            Height = 90
            Caption = #1044#1072#1090#1095#1080#1082' '#1087#1086#1083#1086#1078#1077#1085#1080#1103' '#1088#1091#1083#1103
            TabOrder = 1
            object Label269: TLabel
              Left = 38
              Top = 20
              Width = 99
              Height = 13
              Caption = '                           deg'
            end
            object Edit86: TEdit
              Left = 56
              Top = 16
              Width = 57
              Height = 21
              TabOrder = 0
              Text = ' '
            end
            object GroupBox61: TGroupBox
              Left = 8
              Top = 40
              Width = 145
              Height = 44
              TabOrder = 1
              object Button47: TButton
                Left = 25
                Top = 12
                Width = 97
                Height = 25
                Caption = #1050#1072#1083#1080#1073#1088#1086#1074#1082#1072' '#1085#1091#1083#1103
                TabOrder = 0
                OnClick = CalibrovkaDSCsenClick
              end
            end
          end
          object GroupBox63: TGroupBox
            Left = 484
            Top = 0
            Width = 163
            Height = 214
            Caption = #1044#1072#1090#1095#1080#1082' '#1091#1089#1082#1086#1088#1077#1085#1080#1103' '#1080' '#1075#1080#1088#1086#1089#1082#1086#1087
            TabOrder = 2
            object GroupBox25: TGroupBox
              Left = 8
              Top = 16
              Width = 145
              Height = 73
              Caption = #1043#1080#1088#1086#1089#1082#1086#1087
              TabOrder = 0
              object Label273: TLabel
                Left = 6
                Top = 20
                Width = 131
                Height = 13
                Caption = #1054#1089#1100'  X                       deg/c'
              end
              object Label274: TLabel
                Left = 6
                Top = 36
                Width = 131
                Height = 13
                Caption = #1054#1089#1100'  Y                       deg/c'
              end
              object Label275: TLabel
                Left = 6
                Top = 52
                Width = 131
                Height = 13
                Caption = #1054#1089#1100'  Z                       deg/c'
              end
              object Edit35: TEdit
                Left = 48
                Top = 16
                Width = 57
                Height = 21
                TabOrder = 0
                Text = ' '
              end
              object Edit81: TEdit
                Left = 48
                Top = 32
                Width = 57
                Height = 21
                TabOrder = 1
                Text = ' '
              end
              object Edit82: TEdit
                Left = 48
                Top = 48
                Width = 57
                Height = 21
                TabOrder = 2
                Text = ' '
              end
            end
            object GroupBox75: TGroupBox
              Left = 8
              Top = 88
              Width = 145
              Height = 73
              Caption = #1059#1089#1082#1086#1088#1077#1085#1080#1077
              TabOrder = 1
              object Label276: TLabel
                Left = 6
                Top = 20
                Width = 127
                Height = 13
                Caption = #1054#1089#1100'  X                       m/c2'
              end
              object Label277: TLabel
                Left = 6
                Top = 36
                Width = 127
                Height = 13
                Caption = #1054#1089#1100'  Y                       m/c2'
              end
              object Label278: TLabel
                Left = 6
                Top = 52
                Width = 127
                Height = 13
                Caption = #1054#1089#1100'  Z                       m/c2'
              end
              object Edit83: TEdit
                Left = 48
                Top = 16
                Width = 57
                Height = 21
                TabOrder = 0
              end
              object Edit84: TEdit
                Left = 48
                Top = 32
                Width = 57
                Height = 21
                TabOrder = 1
              end
              object Edit85: TEdit
                Left = 48
                Top = 48
                Width = 57
                Height = 21
                TabOrder = 2
              end
            end
            object GroupBox215: TGroupBox
              Left = 8
              Top = 164
              Width = 145
              Height = 44
              TabOrder = 2
              object Edit87: TEdit
                Left = 8
                Top = 15
                Width = 25
                Height = 21
                TabOrder = 0
              end
              object Button48: TButton
                Left = 40
                Top = 11
                Width = 97
                Height = 25
                Caption = #1050#1072#1083#1080#1073#1088#1086#1074#1082#1072' '
                TabOrder = 1
                OnClick = CalibrovkaDSCsenClick
              end
            end
          end
          object GroupBox65: TGroupBox
            Left = 0
            Top = 238
            Width = 153
            Height = 102
            Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1076#1074#1080#1075#1072#1090#1077#1083#1077#1084
            TabOrder = 3
            object GroupBox67: TGroupBox
              Left = 8
              Top = 13
              Width = 137
              Height = 41
              Caption = 'O'#1075#1088#1072#1085#1080#1095#1077#1085#1080#1077' '#1084#1086#1084#1077#1085#1090#1072
              TabOrder = 0
              object Button49: TButton
                Left = 28
                Top = 16
                Width = 81
                Height = 22
                Caption = #1042#1099#1082#1083#1102#1095#1077#1085#1086
                TabOrder = 0
                OnClick = TestPulsClick
              end
            end
            object GroupBox68: TGroupBox
              Left = 8
              Top = 55
              Width = 137
              Height = 41
              Caption = #1047#1072#1076#1072#1085#1080#1077' '#1084#1086#1084#1077#1085#1090#1072
              TabOrder = 1
              object Button42: TButton
                Left = 28
                Top = 16
                Width = 81
                Height = 22
                Caption = #1042#1099#1082#1083#1102#1095#1077#1085#1086
                TabOrder = 0
                OnClick = TestPulsClick
              end
            end
          end
          object GroupBox69: TGroupBox
            Left = 0
            Top = 144
            Width = 153
            Height = 94
            Caption = 'Test   Dif_Valve'
            TabOrder = 4
            object Label408: TLabel
              Left = 20
              Top = 18
              Width = 50
              Height = 13
              Caption = #1055#1077#1088#1077#1076#1085#1080#1081
            end
            object Label409: TLabel
              Left = 32
              Top = 43
              Width = 37
              Height = 13
              Caption = #1047#1072#1076#1085#1080#1081
            end
            object Label410: TLabel
              Left = 32
              Top = 67
              Width = 38
              Height = 13
              Caption = #1055#1088#1080#1094#1077#1087
            end
            object Button53: TButton
              Left = 80
              Top = 16
              Width = 65
              Height = 22
              Caption = #1042#1099#1082#1083#1102#1095#1077#1085
              TabOrder = 0
              OnClick = TestPulsClick
            end
            object Button52: TButton
              Left = 80
              Top = 40
              Width = 65
              Height = 22
              Caption = #1042#1099#1082#1083#1102#1095#1077#1085
              TabOrder = 1
              OnClick = TestPulsClick
            end
            object Button59: TButton
              Left = 80
              Top = 64
              Width = 65
              Height = 22
              Caption = #1042#1099#1082#1083#1102#1095#1077#1085
              TabOrder = 2
              OnClick = TestPulsClick
            end
          end
          object Button40: TButton
            Left = 8
            Top = 429
            Width = 137
            Height = 25
            Caption = #1054#1090#1082#1088#1099#1090#1100' '#1092#1086#1088#1084#1091' '#1058#1077#1089#1090' '
            TabOrder = 5
            OnClick = Button40Click
          end
          object GroupBox104: TGroupBox
            Left = 176
            Top = 0
            Width = 252
            Height = 134
            Caption = 'Engine'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
            object GroupBox105: TGroupBox
              Left = 8
              Top = 14
              Width = 236
              Height = 59
              Caption = 'CAN CCVS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              object Label306: TLabel
                Left = 12
                Top = 13
                Width = 28
                Height = 13
                Caption = 'Brake'
              end
              object Label374: TLabel
                Left = 58
                Top = 13
                Width = 84
                Height = 13
                Caption = #1085#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
              end
              object Label375: TLabel
                Left = 12
                Top = 26
                Width = 30
                Height = 13
                Caption = 'Clutch'
              end
              object Label376: TLabel
                Left = 58
                Top = 26
                Width = 84
                Height = 13
                Caption = #1085#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
              end
              object Label377: TLabel
                Left = 12
                Top = 39
                Width = 36
                Height = 13
                Caption = 'Parking'
              end
              object Label378: TLabel
                Left = 58
                Top = 39
                Width = 84
                Height = 13
                Caption = #1085#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
              end
              object Label381: TLabel
                Left = 152
                Top = 36
                Width = 77
                Height = 13
                Caption = 'V               km/h'
              end
              object Label411: TLabel
                Left = 72
                Top = 0
                Width = 22
                Height = 13
                Caption = 'Tout'
              end
              object Edit148: TEdit
                Left = 162
                Top = 34
                Width = 41
                Height = 21
                TabOrder = 0
                Text = '0'
              end
            end
            object GroupBox106: TGroupBox
              Left = 8
              Top = 72
              Width = 236
              Height = 56
              Caption = 'CAN EEC1'
              TabOrder = 1
              object Label382: TLabel
                Left = 8
                Top = 14
                Width = 90
                Height = 13
                Caption = 'Torque                %'
              end
              object Label383: TLabel
                Left = 8
                Top = 32
                Width = 90
                Height = 13
                Caption = 'Driver                  %'
              end
              object Label384: TLabel
                Left = 131
                Top = 32
                Width = 92
                Height = 13
                Caption = 'Taxo                 rpm'
              end
              object Label412: TLabel
                Left = 64
                Top = 0
                Width = 22
                Height = 13
                Caption = 'Tout'
              end
              object Label454: TLabel
                Left = 126
                Top = 14
                Width = 95
                Height = 13
                Caption = 'Torque               Nm'
              end
              object Edit149: TEdit
                Left = 54
                Top = 12
                Width = 33
                Height = 21
                TabOrder = 0
                Text = '0'
              end
              object Edit150: TEdit
                Left = 54
                Top = 30
                Width = 33
                Height = 21
                TabOrder = 1
                Text = '0'
              end
              object Edit151: TEdit
                Left = 162
                Top = 30
                Width = 41
                Height = 21
                TabOrder = 2
              end
              object Edit203: TEdit
                Left = 162
                Top = 10
                Width = 41
                Height = 21
                TabOrder = 3
              end
            end
          end
          object GroupBox70: TGroupBox
            Left = 176
            Top = 134
            Width = 252
            Height = 76
            Caption = 'Break'
            TabOrder = 7
            object Label379: TLabel
              Left = 22
              Top = 52
              Width = 137
              Height = 13
              Caption = 'Press Demand                 atm'
            end
            object Edit147: TEdit
              Left = 98
              Top = 50
              Width = 41
              Height = 21
              TabOrder = 0
              Text = '0'
            end
            object GroupBox71: TGroupBox
              Left = 8
              Top = 12
              Width = 236
              Height = 36
              Caption = 'AIR1'
              TabOrder = 1
              object Label389: TLabel
                Left = 124
                Top = 14
                Width = 103
                Height = 13
                Caption = 'Air Press2             atm'
              end
              object Label388: TLabel
                Left = 12
                Top = 14
                Width = 100
                Height = 13
                Caption = 'Air Press1            atm'
              end
              object Label413: TLabel
                Left = 40
                Top = 0
                Width = 22
                Height = 13
                Caption = 'Tout'
              end
              object Edit156: TEdit
                Left = 62
                Top = 10
                Width = 33
                Height = 21
                TabOrder = 0
                Text = '0'
              end
              object Edit157: TEdit
                Left = 174
                Top = 10
                Width = 33
                Height = 21
                TabOrder = 1
                Text = '0'
              end
            end
          end
          object GroupBox119: TGroupBox
            Left = 176
            Top = 366
            Width = 252
            Height = 90
            Caption = 'ECAS'
            TabOrder = 8
            object GroupBox120: TGroupBox
              Left = 8
              Top = 11
              Width = 236
              Height = 36
              Caption = 'ASC1'
              TabOrder = 0
              object Label407: TLabel
                Left = 8
                Top = 12
                Width = 34
                Height = 13
                Caption = #1057#1090#1072#1090#1091#1089
              end
              object Label440: TLabel
                Left = 86
                Top = 12
                Width = 20
                Height = 13
                Caption = 'Find'
              end
              object Label441: TLabel
                Left = 148
                Top = 12
                Width = 22
                Height = 13
                Caption = 'Tout'
              end
              object Edit173: TEdit
                Left = 46
                Top = 10
                Width = 31
                Height = 21
                TabOrder = 0
              end
              object Edit166: TEdit
                Left = 108
                Top = 10
                Width = 33
                Height = 21
                TabOrder = 1
              end
              object Edit167: TEdit
                Left = 170
                Top = 10
                Width = 33
                Height = 21
                TabOrder = 2
              end
            end
            object GroupBox118: TGroupBox
              Left = 7
              Top = 47
              Width = 236
              Height = 36
              Caption = 'ASC4'
              TabOrder = 1
              object Label386: TLabel
                Left = 6
                Top = 13
                Width = 218
                Height = 13
                Caption = 'Bellow Press                          Psen             atm'
              end
              object Label414: TLabel
                Left = 40
                Top = 0
                Width = 22
                Height = 13
                Caption = 'Tout'
              end
              object Edit153: TEdit
                Left = 70
                Top = 10
                Width = 33
                Height = 21
                TabOrder = 0
              end
              object Edit329: TEdit
                Left = 170
                Top = 10
                Width = 33
                Height = 21
                TabOrder = 1
              end
            end
          end
          object GroupBox110: TGroupBox
            Left = 176
            Top = 210
            Width = 252
            Height = 155
            Caption = #1058#1072#1093#1086#1075#1088#1072#1092
            TabOrder = 9
            object GroupBox111: TGroupBox
              Left = 8
              Top = 12
              Width = 236
              Height = 98
              Caption = 'TCO1'
              TabOrder = 0
              object Label385: TLabel
                Left = 6
                Top = 55
                Width = 143
                Height = 13
                Caption = 'Vehicle speed                km/h '
              end
              object Label396: TLabel
                Left = 6
                Top = 74
                Width = 132
                Height = 13
                Caption = 'Output shaft                   rpm'
              end
              object Label415: TLabel
                Left = 48
                Top = 0
                Width = 22
                Height = 13
                Caption = 'Tout'
              end
              object Label390: TLabel
                Left = 4
                Top = 13
                Width = 64
                Height = 13
                Caption = 'System event'
              end
              object Label393: TLabel
                Left = 110
                Top = 13
                Width = 84
                Height = 13
                Caption = #1085#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
              end
              object Label391: TLabel
                Left = 4
                Top = 26
                Width = 69
                Height = 13
                Caption = 'Vehicle motion'
              end
              object Label394: TLabel
                Left = 110
                Top = 26
                Width = 84
                Height = 13
                Caption = #1085#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
              end
              object Label392: TLabel
                Left = 4
                Top = 39
                Width = 85
                Height = 13
                Caption = 'Direction indicator'
              end
              object Label395: TLabel
                Left = 110
                Top = 39
                Width = 84
                Height = 13
                Caption = #1085#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
              end
              object Edit152: TEdit
                Left = 78
                Top = 52
                Width = 40
                Height = 21
                TabOrder = 0
                Text = '0'
              end
              object Edit158: TEdit
                Left = 78
                Top = 72
                Width = 40
                Height = 21
                TabOrder = 1
              end
            end
            object GroupBox112: TGroupBox
              Left = 9
              Top = 110
              Width = 163
              Height = 39
              Caption = 'VDHR'
              TabOrder = 1
              object Label397: TLabel
                Left = 16
                Top = 16
                Width = 139
                Height = 13
                Caption = 'ODOmeter                         km'
              end
              object Label416: TLabel
                Left = 48
                Top = 0
                Width = 22
                Height = 13
                Caption = 'Tout'
              end
              object Edit159: TEdit
                Left = 74
                Top = 12
                Width = 63
                Height = 21
                TabOrder = 0
              end
            end
          end
          object GroupBox157: TGroupBox
            Left = 0
            Top = 340
            Width = 153
            Height = 42
            Caption = 'Stop Light'
            TabOrder = 10
            object Emergency: TSpeedButton
              Left = 116
              Top = 14
              Width = 25
              Height = 22
              Cursor = crHandPoint
              AllowAllUp = True
              GroupIndex = 2
              OnClick = LampVDCClick
            end
            object Label599: TLabel
              Left = 92
              Top = 18
              Width = 20
              Height = 13
              Caption = 'OFF'
            end
            object Label600: TLabel
              Left = 92
              Top = -1
              Width = 53
              Height = 13
              Caption = 'Emergency'
            end
            object Label541: TLabel
              Left = 12
              Top = 18
              Width = 20
              Height = 13
              Caption = 'OFF'
            end
            object StopLight: TSpeedButton
              Left = 36
              Top = 14
              Width = 25
              Height = 22
              Cursor = crHandPoint
              AllowAllUp = True
              GroupIndex = 2
              OnClick = LampVDCClick
            end
          end
          object GroupBox221: TGroupBox
            Left = 0
            Top = 382
            Width = 153
            Height = 41
            Caption = 'Halt Brake'
            TabOrder = 11
            object HaltBrake: TSpeedButton
              Left = 36
              Top = 14
              Width = 25
              Height = 22
              Cursor = crHandPoint
              AllowAllUp = True
              GroupIndex = 2
              OnClick = LampVDCClick
            end
            object Label614: TLabel
              Left = 13
              Top = 18
              Width = 20
              Height = 13
              Caption = 'OFF'
            end
          end
          object GroupBox238: TGroupBox
            Left = 484
            Top = 336
            Width = 163
            Height = 121
            Caption = #1050#1086#1101#1092#1092'. '#1057#1082#1086#1088#1086#1089#1090#1080
            TabOrder = 12
            object Edit146: TEdit
              Left = 113
              Top = 42
              Width = 40
              Height = 21
              TabOrder = 0
              Text = '1'
            end
            object CheckBox313: TCheckBox
              Left = 8
              Top = 42
              Width = 89
              Height = 17
              Caption = #1047#1072#1076#1085#1103#1103' '#1086#1089#1100
              TabOrder = 1
            end
            object CheckBox314: TCheckBox
              Left = 8
              Top = 24
              Width = 89
              Height = 17
              Caption = #1055#1077#1088#1077#1076#1085#1103#1103' '#1086#1089#1100
              TabOrder = 2
            end
            object Edit404: TEdit
              Left = 113
              Top = 22
              Width = 40
              Height = 21
              TabOrder = 3
              Text = '1'
            end
            object CheckBox315: TCheckBox
              Left = 8
              Top = 60
              Width = 97
              Height = 17
              Caption = #1054#1087#1088#1077#1076#1077#1083#1103#1102#1090#1089#1103
              TabOrder = 4
            end
            object CheckBox316: TCheckBox
              Left = 8
              Top = 76
              Width = 97
              Height = 17
              Caption = 'TransmissionON'
              TabOrder = 5
            end
            object CheckBox317: TCheckBox
              Left = 8
              Top = 92
              Width = 97
              Height = 17
              Caption = 'ReverseON'
              TabOrder = 6
            end
          end
        end
        object TabSheet17: TTabSheet
          Caption = #1055#1088#1080#1094#1077#1087' VDC '
          ImageIndex = 6
          object GroupBox113: TGroupBox
            Left = 296
            Top = 0
            Width = 294
            Height = 299
            Caption = 'TRAILER'
            TabOrder = 0
            object Label457: TLabel
              Left = 48
              Top = 218
              Width = 132
              Height = 13
              Caption = 'Press Model                   atm'
            end
            object GroupBox124: TGroupBox
              Left = 8
              Top = 12
              Width = 278
              Height = 139
              Caption = 'EBS25'
              TabOrder = 0
              object Label430: TLabel
                Left = 8
                Top = 16
                Width = 210
                Height = 13
                Caption = 'Press 1L                         1R                     atm'
              end
              object Label431: TLabel
                Left = 8
                Top = 36
                Width = 210
                Height = 13
                Caption = 'Press 2L                         2R                     atm'
              end
              object Label432: TLabel
                Left = 8
                Top = 56
                Width = 210
                Height = 13
                Caption = 'Press 3L                         3R                     atm'
              end
              object Label433: TLabel
                Left = 16
                Top = 100
                Width = 32
                Height = 13
                Caption = 'Rx Cnt'
              end
              object Edit179: TEdit
                Left = 56
                Top = 12
                Width = 49
                Height = 21
                TabOrder = 0
              end
              object Edit180: TEdit
                Left = 144
                Top = 12
                Width = 49
                Height = 21
                TabOrder = 1
              end
              object Edit181: TEdit
                Left = 56
                Top = 34
                Width = 49
                Height = 21
                TabOrder = 2
              end
              object Edit182: TEdit
                Left = 144
                Top = 34
                Width = 49
                Height = 21
                TabOrder = 3
              end
              object Edit183: TEdit
                Left = 56
                Top = 56
                Width = 49
                Height = 21
                TabOrder = 4
              end
              object Edit184: TEdit
                Left = 144
                Top = 56
                Width = 49
                Height = 21
                TabOrder = 5
              end
              object Edit185: TEdit
                Left = 56
                Top = 96
                Width = 28
                Height = 21
                TabOrder = 6
              end
              object GroupBox126: TGroupBox
                Left = 96
                Top = 80
                Width = 175
                Height = 49
                Caption = 'Status5'
                TabOrder = 7
                object Label436: TLabel
                  Left = 77
                  Top = 12
                  Width = 84
                  Height = 13
                  Caption = #1085#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
                end
                object Label437: TLabel
                  Left = 52
                  Top = 12
                  Width = 26
                  Height = 13
                  Caption = 'ROP '
                end
                object Label438: TLabel
                  Left = 52
                  Top = 28
                  Width = 25
                  Height = 13
                  Caption = 'DYC '
                end
                object Label439: TLabel
                  Left = 77
                  Top = 28
                  Width = 84
                  Height = 13
                  Caption = #1085#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
                end
                object Edit186: TEdit
                  Left = 8
                  Top = 16
                  Width = 28
                  Height = 21
                  TabOrder = 0
                end
              end
            end
            object Edit205: TEdit
              Left = 112
              Top = 215
              Width = 49
              Height = 21
              TabOrder = 1
            end
            object GroupBox1106: TGroupBox
              Left = 8
              Top = 154
              Width = 273
              Height = 55
              Caption = #1044#1072#1090#1095#1080#1082' '#1076#1072#1074#1083#1077#1085#1080#1103
              TabOrder = 2
              object Label368: TLabel
                Left = 153
                Top = 12
                Width = 17
                Height = 13
                Caption = 'atm'
              end
              object Label370: TLabel
                Left = 61
                Top = 15
                Width = 15
                Height = 13
                Caption = '-----'
              end
              object Edit145: TEdit
                Left = 104
                Top = 10
                Width = 49
                Height = 21
                TabOrder = 0
                Text = '0'
              end
            end
          end
          object GroupBox93: TGroupBox
            Left = 0
            Top = 0
            Width = 289
            Height = 299
            Caption = 'TRAILER'
            TabOrder = 1
            object GroupBox94: TGroupBox
              Left = 8
              Top = 12
              Width = 273
              Height = 280
              Caption = 'CAN'
              TabOrder = 0
              object Label354: TLabel
                Left = 52
                Top = 32
                Width = 44
                Height = 13
                Caption = 'Label354'
              end
              object Label456: TLabel
                Left = 8
                Top = 16
                Width = 22
                Height = 13
                Caption = 'CAN'
              end
              object Label442: TLabel
                Left = 40
                Top = 16
                Width = 174
                Height = 13
                Caption = #1044#1042#1059#1061#1087#1088#1086#1074#1086#1076#1085#1099#1081'                             '
              end
              object GroupBox95: TGroupBox
                Left = 8
                Top = 50
                Width = 257
                Height = 130
                Caption = 'EBS22'
                TabOrder = 0
                object Label344: TLabel
                  Left = 8
                  Top = 16
                  Width = 36
                  Height = 13
                  Caption = 'Status1'
                end
                object Label345: TLabel
                  Left = 8
                  Top = 32
                  Width = 36
                  Height = 13
                  Caption = 'Status2'
                end
                object Label346: TLabel
                  Left = 8
                  Top = 48
                  Width = 36
                  Height = 13
                  Caption = 'Status3'
                end
                object Label347: TLabel
                  Left = 8
                  Top = 64
                  Width = 36
                  Height = 13
                  Caption = 'Status4'
                end
                object Label348: TLabel
                  Left = 32
                  Top = 106
                  Width = 149
                  Height = 13
                  Caption = 'AxleLoadSum                        kg'
                end
                object Label349: TLabel
                  Left = 84
                  Top = 8
                  Width = 21
                  Height = 13
                  Caption = 'ABS'
                end
                object Label350: TLabel
                  Left = 84
                  Top = 21
                  Width = 28
                  Height = 13
                  Caption = 'Brake'
                end
                object Label351: TLabel
                  Left = 84
                  Top = 34
                  Width = 43
                  Height = 13
                  Caption = #1055#1080#1090#1072#1085#1080#1077
                end
                object Label352: TLabel
                  Left = 84
                  Top = 47
                  Width = 63
                  Height = 13
                  Caption = 'Red Warning'
                end
                object Label353: TLabel
                  Left = 84
                  Top = 60
                  Width = 73
                  Height = 13
                  Caption = 'Amber Warning'
                end
                object Label355: TLabel
                  Left = 8
                  Top = 82
                  Width = 32
                  Height = 13
                  Caption = 'Rx Cnt'
                end
                object Label356: TLabel
                  Left = 140
                  Top = 8
                  Width = 84
                  Height = 13
                  Caption = #1085#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
                end
                object Label357: TLabel
                  Left = 140
                  Top = 21
                  Width = 84
                  Height = 13
                  Caption = #1085#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
                end
                object Label358: TLabel
                  Left = 140
                  Top = 34
                  Width = 84
                  Height = 13
                  Caption = #1085#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
                end
                object Label359: TLabel
                  Left = 162
                  Top = 47
                  Width = 58
                  Height = 13
                  Caption = #1085#1077#1076#1086#1089#1090#1091#1087#1085#1086
                end
                object Label360: TLabel
                  Left = 162
                  Top = 60
                  Width = 58
                  Height = 13
                  Caption = #1085#1077#1076#1086#1089#1090#1091#1087#1085#1086
                end
                object Edit133: TEdit
                  Left = 48
                  Top = 16
                  Width = 28
                  Height = 21
                  TabOrder = 0
                end
                object Edit134: TEdit
                  Left = 48
                  Top = 32
                  Width = 28
                  Height = 21
                  TabOrder = 1
                end
                object Edit135: TEdit
                  Left = 48
                  Top = 48
                  Width = 28
                  Height = 21
                  TabOrder = 2
                end
                object Edit136: TEdit
                  Left = 48
                  Top = 64
                  Width = 28
                  Height = 21
                  TabOrder = 3
                end
                object Edit137: TEdit
                  Left = 100
                  Top = 102
                  Width = 66
                  Height = 21
                  TabOrder = 4
                end
                object Edit138: TEdit
                  Left = 48
                  Top = 80
                  Width = 28
                  Height = 21
                  TabOrder = 5
                end
              end
              object GroupBox125: TGroupBox
                Left = 8
                Top = 186
                Width = 257
                Height = 87
                Caption = 'EBS21'
                TabOrder = 1
                object Label435: TLabel
                  Left = 48
                  Top = 58
                  Width = 143
                  Height = 13
                  Caption = 'Speed                             km/h'
                end
                object Label652: TLabel
                  Left = 8
                  Top = 16
                  Width = 36
                  Height = 13
                  Caption = 'Status1'
                end
                object Label653: TLabel
                  Left = 8
                  Top = 32
                  Width = 36
                  Height = 13
                  Caption = 'Status2'
                end
                object Label654: TLabel
                  Left = 84
                  Top = 9
                  Width = 21
                  Height = 13
                  Caption = 'ABS'
                end
                object Label655: TLabel
                  Left = 84
                  Top = 22
                  Width = 28
                  Height = 13
                  Caption = 'Brake'
                end
                object Label656: TLabel
                  Left = 84
                  Top = 35
                  Width = 22
                  Height = 13
                  Caption = 'VDC'
                end
                object Label657: TLabel
                  Left = 140
                  Top = 9
                  Width = 84
                  Height = 13
                  Caption = #1085#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
                end
                object Label658: TLabel
                  Left = 140
                  Top = 22
                  Width = 84
                  Height = 13
                  Caption = #1085#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
                end
                object Label659: TLabel
                  Left = 140
                  Top = 35
                  Width = 84
                  Height = 13
                  Caption = #1085#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
                end
                object Edit187: TEdit
                  Left = 96
                  Top = 58
                  Width = 66
                  Height = 21
                  TabOrder = 0
                end
                object Edit422: TEdit
                  Left = 48
                  Top = 16
                  Width = 28
                  Height = 21
                  TabOrder = 1
                end
                object Edit423: TEdit
                  Left = 48
                  Top = 32
                  Width = 28
                  Height = 21
                  TabOrder = 2
                end
              end
            end
          end
        end
        object TabSheet23: TTabSheet
          Caption = 'EBL'
          ImageIndex = 7
          object GroupBox108: TGroupBox
            Left = 8
            Top = 0
            Width = 281
            Height = 449
            Caption = #1053#1072#1075#1088#1091#1079#1082#1072
            TabOrder = 0
            object GroupBox129: TGroupBox
              Left = 8
              Top = 14
              Width = 265
              Height = 97
              Caption = #1058#1103#1075#1072#1095' '
              TabOrder = 0
              object Label455: TLabel
                Left = 8
                Top = 35
                Width = 163
                Height = 13
                Caption = 'Rear Axle Load                          kg'
              end
              object Label469: TLabel
                Left = 8
                Top = 16
                Width = 164
                Height = 13
                Caption = 'Front Axle Load                          kg'
              end
              object Label462: TLabel
                Left = 8
                Top = 53
                Width = 163
                Height = 13
                Caption = 'Hitch Load                                 kg'
              end
              object Label461: TLabel
                Left = 48
                Top = 72
                Width = 45
                Height = 13
                Caption = 'EBL Koef'
              end
              object Edit204: TEdit
                Left = 108
                Top = 30
                Width = 46
                Height = 21
                TabOrder = 0
              end
              object Edit217: TEdit
                Left = 108
                Top = 10
                Width = 46
                Height = 21
                TabOrder = 1
              end
              object Edit210: TEdit
                Left = 108
                Top = 50
                Width = 46
                Height = 21
                TabOrder = 2
              end
              object Edit209: TEdit
                Left = 108
                Top = 70
                Width = 46
                Height = 21
                TabOrder = 3
              end
            end
            object GroupBox130: TGroupBox
              Left = 8
              Top = 111
              Width = 265
              Height = 130
              Caption = 'Train'
              TabOrder = 1
              object Label464: TLabel
                Left = 16
                Top = 16
                Width = 155
                Height = 13
                Caption = 'Mass Break Est                       kg'
              end
              object Label460: TLabel
                Left = 16
                Top = 36
                Width = 154
                Height = 13
                Caption = 'Mass Engine Est                     kg'
              end
              object Label465: TLabel
                Left = 48
                Top = 104
                Width = 49
                Height = 13
                Caption = 'Load Koef'
              end
              object Label474: TLabel
                Left = 16
                Top = 83
                Width = 156
                Height = 13
                Caption = 'Mass  Measure                        kg'
              end
              object Label564: TLabel
                Left = 16
                Top = 56
                Width = 155
                Height = 13
                Caption = 'Mass ECAS Est                       kg'
              end
              object Label698: TLabel
                Left = 198
                Top = 16
                Width = 21
                Height = 13
                Caption = 'Calc'
              end
              object Label699: TLabel
                Left = 198
                Top = 40
                Width = 21
                Height = 13
                Caption = 'Calc'
              end
              object Edit212: TEdit
                Left = 108
                Top = 12
                Width = 46
                Height = 21
                TabOrder = 0
              end
              object Edit208: TEdit
                Left = 108
                Top = 32
                Width = 46
                Height = 21
                TabOrder = 1
              end
              object Edit213: TEdit
                Left = 108
                Top = 102
                Width = 46
                Height = 21
                TabOrder = 2
              end
              object Edit225: TEdit
                Left = 108
                Top = 79
                Width = 46
                Height = 21
                TabOrder = 3
              end
              object Edit331: TEdit
                Left = 108
                Top = 52
                Width = 46
                Height = 21
                TabOrder = 4
              end
              object Edit459: TEdit
                Left = 220
                Top = 12
                Width = 29
                Height = 21
                TabOrder = 5
              end
              object Edit460: TEdit
                Left = 220
                Top = 36
                Width = 29
                Height = 21
                TabOrder = 6
              end
            end
            object GroupBox144: TGroupBox
              Left = 8
              Top = 242
              Width = 265
              Height = 200
              Caption = 'Self Tuning'
              TabOrder = 2
              object Label650: TLabel
                Left = 68
                Top = 10
                Width = 79
                Height = 13
                Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' CFG'
              end
              object Label651: TLabel
                Left = 172
                Top = 10
                Width = 80
                Height = 13
                Caption = #1057#1072#1084#1086#1085#1072#1089#1090#1088#1086#1081#1082#1072
              end
              object GroupBox116: TGroupBox
                Left = 8
                Top = 22
                Width = 249
                Height = 125
                Caption = 'Engine'
                TabOrder = 0
                object Label480: TLabel
                  Left = 5
                  Top = 16
                  Width = 135
                  Height = 13
                  Caption = 'Peak Torque                   N'#1084
                end
                object Label481: TLabel
                  Left = 32
                  Top = 80
                  Width = 40
                  Height = 13
                  Caption = 'K Point4'
                end
                object Label482: TLabel
                  Left = 32
                  Top = 100
                  Width = 40
                  Height = 13
                  Caption = 'K Point2'
                end
                object Label484: TLabel
                  Left = 6
                  Top = 56
                  Width = 128
                  Height = 13
                  Caption = 'Torque  XX                      %'
                end
                object Label485: TLabel
                  Left = 6
                  Top = 34
                  Width = 182
                  Height = 13
                  Caption = 'Torque  Loss                   N'#1084'             %'
                end
                object Edit236: TEdit
                  Left = 80
                  Top = 12
                  Width = 40
                  Height = 21
                  TabOrder = 0
                  Text = '2000'
                  OnChange = ParamChange
                end
                object Edit237: TEdit
                  Left = 80
                  Top = 76
                  Width = 41
                  Height = 21
                  TabOrder = 1
                  Text = ' '
                  OnChange = ParamChange
                end
                object Edit238: TEdit
                  Left = 80
                  Top = 98
                  Width = 41
                  Height = 21
                  TabOrder = 2
                  Text = ' '
                  OnChange = ParamChange
                end
                object Edit240: TEdit
                  Left = 184
                  Top = 12
                  Width = 40
                  Height = 21
                  TabOrder = 3
                  OnChange = ParamChange
                end
                object Edit243: TEdit
                  Left = 184
                  Top = 54
                  Width = 41
                  Height = 21
                  TabOrder = 4
                  Text = ' '
                  OnChange = ParamChange
                end
                object Edit244: TEdit
                  Left = 80
                  Top = 32
                  Width = 40
                  Height = 21
                  TabOrder = 5
                  OnChange = ParamChange
                end
                object Edit271: TEdit
                  Left = 80
                  Top = 54
                  Width = 40
                  Height = 21
                  TabOrder = 6
                  OnChange = ParamChange
                end
                object Edit419: TEdit
                  Left = 184
                  Top = 76
                  Width = 41
                  Height = 21
                  TabOrder = 7
                  Text = ' '
                  OnChange = ParamChange
                end
                object Edit420: TEdit
                  Left = 184
                  Top = 98
                  Width = 41
                  Height = 21
                  TabOrder = 8
                  Text = ' '
                  OnChange = ParamChange
                end
                object Edit421: TEdit
                  Left = 144
                  Top = 32
                  Width = 33
                  Height = 21
                  TabOrder = 9
                  OnChange = ParamChange
                end
              end
              object GroupBox143: TGroupBox
                Left = 8
                Top = 148
                Width = 249
                Height = 46
                Caption = #1058#1086#1088#1084#1086#1078#1077#1085#1080#1077
                TabOrder = 1
                object Label305: TLabel
                  Left = 14
                  Top = 24
                  Width = 124
                  Height = 13
                  Caption = 'Load Koef                         '
                end
                object Edit230: TEdit
                  Left = 80
                  Top = 18
                  Width = 41
                  Height = 21
                  TabOrder = 0
                  OnChange = ParamChange
                end
                object Edit231: TEdit
                  Left = 184
                  Top = 18
                  Width = 41
                  Height = 21
                  TabOrder = 1
                  OnChange = ParamChange
                end
              end
            end
          end
          object GroupBox109: TGroupBox
            Left = 296
            Top = 152
            Width = 289
            Height = 65
            Caption = #1044#1072#1074#1083#1077#1085#1080#1077
            TabOrder = 1
            object Label458: TLabel
              Left = 8
              Top = 16
              Width = 133
              Height = 13
              Caption = 'Front In Press                 atm'
            end
            object Label459: TLabel
              Left = 8
              Top = 33
              Width = 132
              Height = 13
              Caption = 'Rear In Press                 atm'
            end
            object Edit206: TEdit
              Left = 80
              Top = 12
              Width = 41
              Height = 21
              TabOrder = 0
            end
            object Edit207: TEdit
              Left = 80
              Top = 31
              Width = 41
              Height = 21
              TabOrder = 1
            end
          end
          object GroupBox145: TGroupBox
            Left = 296
            Top = 0
            Width = 289
            Height = 150
            Caption = #1050#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1103' '#1076#1074#1080#1075#1072#1090#1077#1083#1103' CAN  EC1'
            TabOrder = 2
            object Label479: TLabel
              Left = 6
              Top = 18
              Width = 133
              Height = 13
              Caption = 'Ref Torque                     N'#1084
            end
            object Label483: TLabel
              Left = 5
              Top = 60
              Width = 135
              Height = 13
              Caption = 'Peak Torque                   N'#1084
            end
            object Label486: TLabel
              Left = 6
              Top = 40
              Width = 127
              Height = 13
              Caption = 'Peak Torque                   %'
            end
            object Label487: TLabel
              Left = 6
              Top = 80
              Width = 126
              Height = 13
              Caption = 'Torque Point1                 %'
            end
            object Label488: TLabel
              Left = 6
              Top = 100
              Width = 136
              Height = 13
              Caption = 'Taxo  XX                         rpm'
            end
            object Label517: TLabel
              Left = 6
              Top = 119
              Width = 135
              Height = 13
              Caption = 'Taxo  P2                         rpm'
            end
            object Edit232: TEdit
              Left = 80
              Top = 16
              Width = 40
              Height = 21
              TabOrder = 0
              OnChange = ParamChange
            end
            object Edit233: TEdit
              Left = 80
              Top = 57
              Width = 40
              Height = 21
              TabOrder = 1
              OnChange = ParamChange
            end
            object Edit234: TEdit
              Left = 80
              Top = 36
              Width = 41
              Height = 21
              TabOrder = 2
              Text = ' '
              OnChange = ParamChange
            end
            object Edit235: TEdit
              Left = 80
              Top = 78
              Width = 41
              Height = 21
              TabOrder = 3
              Text = ' '
              OnChange = ParamChange
            end
            object Edit239: TEdit
              Left = 80
              Top = 98
              Width = 41
              Height = 21
              TabOrder = 4
            end
            object Edit268: TEdit
              Left = 80
              Top = 118
              Width = 41
              Height = 21
              TabOrder = 5
            end
          end
        end
      end
    end
    object OscPage: TTabSheet
      Caption = #1054#1089#1094#1080#1083#1083#1086#1075#1088#1072#1092
      ImageIndex = 2
      object OscBox: TPaintBox
        Left = 0
        Top = 16
        Width = 601
        Height = 256
        Color = clBtnFace
        Enabled = False
        ParentColor = False
      end
      object Panel6: TPanel
        Left = 0
        Top = 304
        Width = 660
        Height = 182
        Align = alBottom
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        TabOrder = 0
        object Label56: TLabel
          Left = 87
          Top = 10
          Width = 6
          Height = 13
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnDblClick = Label56Click
        end
        object Label57: TLabel
          Left = 87
          Top = 28
          Width = 6
          Height = 13
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnDblClick = Label56Click
        end
        object Label58: TLabel
          Left = 87
          Top = 46
          Width = 6
          Height = 13
          Caption = '0'
          OnDblClick = Label56Click
        end
        object Label59: TLabel
          Left = 195
          Top = 10
          Width = 6
          Height = 13
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnDblClick = Label56Click
        end
        object Label60: TLabel
          Left = 195
          Top = 28
          Width = 6
          Height = 13
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnDblClick = Label56Click
        end
        object Label61: TLabel
          Left = 195
          Top = 46
          Width = 6
          Height = 13
          Caption = '0'
          OnDblClick = Label56Click
        end
        object Label62: TLabel
          Left = 305
          Top = 10
          Width = 6
          Height = 13
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnDblClick = Label56Click
        end
        object Label63: TLabel
          Left = 305
          Top = 28
          Width = 6
          Height = 13
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnDblClick = Label56Click
        end
        object Label64: TLabel
          Left = 305
          Top = 46
          Width = 6
          Height = 13
          Caption = '0'
          OnDblClick = Label56Click
        end
        object Label65: TLabel
          Left = 424
          Top = 10
          Width = 6
          Height = 13
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnDblClick = Label56Click
        end
        object Label66: TLabel
          Left = 424
          Top = 28
          Width = 6
          Height = 13
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnDblClick = Label56Click
        end
        object Label67: TLabel
          Left = 424
          Top = 46
          Width = 6
          Height = 13
          Caption = '0'
          OnDblClick = Label56Click
        end
        object Label259: TLabel
          Left = 87
          Top = 66
          Width = 6
          Height = 13
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnDblClick = Label56Click
        end
        object Label260: TLabel
          Left = 195
          Top = 66
          Width = 6
          Height = 13
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnDblClick = Label56Click
        end
        object Label261: TLabel
          Left = 305
          Top = 66
          Width = 6
          Height = 13
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnDblClick = Label56Click
        end
        object Label262: TLabel
          Left = 424
          Top = 66
          Width = 6
          Height = 13
          Caption = '0'
          OnDblClick = Label56Click
        end
        object Label279: TLabel
          Left = 87
          Top = 86
          Width = 6
          Height = 13
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnDblClick = Label56Click
        end
        object Label280: TLabel
          Left = 195
          Top = 86
          Width = 6
          Height = 13
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnDblClick = Label56Click
        end
        object Label281: TLabel
          Left = 305
          Top = 86
          Width = 6
          Height = 13
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnDblClick = Label56Click
        end
        object Label282: TLabel
          Left = 424
          Top = 86
          Width = 6
          Height = 13
          Caption = '0'
          OnDblClick = Label56Click
        end
        object Label326: TLabel
          Left = 600
          Top = 160
          Width = 14
          Height = 13
          Caption = 'TP'
        end
        object Label687: TLabel
          Left = 87
          Top = 104
          Width = 6
          Height = 13
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnDblClick = Label56Click
        end
        object Label689: TLabel
          Left = 195
          Top = 104
          Width = 6
          Height = 13
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnDblClick = Label56Click
        end
        object Label690: TLabel
          Left = 305
          Top = 104
          Width = 6
          Height = 13
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnDblClick = Label56Click
        end
        object Label691: TLabel
          Left = 424
          Top = 104
          Width = 6
          Height = 13
          Caption = '0'
          OnDblClick = Label56Click
        end
        object Edit1: TEdit
          Left = 52
          Top = 9
          Width = 30
          Height = 21
          TabOrder = 1
          Text = '0'
          OnClick = EditAdrOssClick
          OnKeyPress = Edit1KeyPress
        end
        object Edit2: TEdit
          Left = 52
          Top = 28
          Width = 30
          Height = 21
          TabOrder = 2
          Text = '0'
          OnClick = EditAdrOssClick
          OnKeyPress = Edit1KeyPress
        end
        object Edit3: TEdit
          Left = 52
          Top = 46
          Width = 30
          Height = 21
          TabOrder = 3
          Text = '0'
          OnClick = EditAdrOssClick
          OnKeyPress = Edit1KeyPress
        end
        object Edit4: TEdit
          Left = 160
          Top = 8
          Width = 30
          Height = 21
          TabOrder = 4
          Text = '0'
          OnClick = EditAdrOssClick
          OnKeyPress = Edit1KeyPress
        end
        object Edit5: TEdit
          Left = 160
          Top = 28
          Width = 30
          Height = 21
          TabOrder = 5
          Text = '0'
          OnClick = EditAdrOssClick
          OnKeyPress = Edit1KeyPress
        end
        object Edit6: TEdit
          Left = 160
          Top = 46
          Width = 30
          Height = 21
          TabOrder = 6
          Text = '0'
          OnClick = EditAdrOssClick
          OnKeyPress = Edit1KeyPress
        end
        object Edit7: TEdit
          Left = 272
          Top = 8
          Width = 30
          Height = 21
          TabOrder = 7
          Text = '0'
          OnClick = EditAdrOssClick
          OnKeyPress = Edit1KeyPress
        end
        object Edit8: TEdit
          Left = 272
          Top = 28
          Width = 30
          Height = 21
          TabOrder = 8
          Text = '0'
          OnClick = EditAdrOssClick
          OnKeyPress = Edit1KeyPress
        end
        object Edit9: TEdit
          Left = 272
          Top = 46
          Width = 30
          Height = 21
          TabOrder = 9
          Text = '0'
          OnClick = EditAdrOssClick
          OnKeyPress = Edit1KeyPress
        end
        object Edit10: TEdit
          Left = 392
          Top = 8
          Width = 30
          Height = 21
          TabOrder = 10
          Text = '0'
          OnClick = EditAdrOssClick
          OnKeyPress = Edit1KeyPress
        end
        object Edit11: TEdit
          Left = 392
          Top = 28
          Width = 30
          Height = 21
          TabOrder = 11
          Text = '0'
          OnClick = EditAdrOssClick
          OnKeyPress = Edit1KeyPress
        end
        object Edit12: TEdit
          Left = 392
          Top = 46
          Width = 30
          Height = 21
          TabOrder = 13
          Text = '0'
          OnClick = EditAdrOssClick
          OnKeyPress = Edit1KeyPress
        end
        object CheckBox1: TCheckBox
          Left = 8
          Top = 9
          Width = 37
          Height = 17
          TabStop = False
          Alignment = taLeftJustify
          BiDiMode = bdLeftToRight
          Caption = 'Ch1'
          Checked = True
          ParentBiDiMode = False
          State = cbChecked
          TabOrder = 12
          OnClick = CheckBox1Click
        end
        object CheckBox2: TCheckBox
          Left = 8
          Top = 28
          Width = 37
          Height = 17
          TabStop = False
          Alignment = taLeftJustify
          BiDiMode = bdLeftToRight
          Caption = 'Ch2'
          Checked = True
          ParentBiDiMode = False
          State = cbChecked
          TabOrder = 14
          OnClick = CheckBox1Click
        end
        object CheckBox3: TCheckBox
          Left = 8
          Top = 46
          Width = 37
          Height = 17
          TabStop = False
          Alignment = taLeftJustify
          BiDiMode = bdLeftToRight
          Caption = 'Ch3'
          Checked = True
          ParentBiDiMode = False
          State = cbChecked
          TabOrder = 15
          OnClick = CheckBox1Click
        end
        object CheckBox4: TCheckBox
          Left = 120
          Top = 10
          Width = 37
          Height = 17
          TabStop = False
          Alignment = taLeftJustify
          BiDiMode = bdLeftToRight
          Caption = 'Ch4'
          Checked = True
          ParentBiDiMode = False
          State = cbChecked
          TabOrder = 16
          OnClick = CheckBox1Click
        end
        object CheckBox5: TCheckBox
          Left = 120
          Top = 28
          Width = 37
          Height = 17
          TabStop = False
          Alignment = taLeftJustify
          BiDiMode = bdLeftToRight
          Caption = 'Ch5'
          Checked = True
          ParentBiDiMode = False
          State = cbChecked
          TabOrder = 17
          OnClick = CheckBox1Click
        end
        object CheckBox6: TCheckBox
          Left = 120
          Top = 46
          Width = 37
          Height = 17
          TabStop = False
          Alignment = taLeftJustify
          BiDiMode = bdLeftToRight
          Caption = 'Ch6'
          Checked = True
          ParentBiDiMode = False
          State = cbChecked
          TabOrder = 18
          OnClick = CheckBox1Click
        end
        object CheckBox7: TCheckBox
          Left = 232
          Top = 10
          Width = 37
          Height = 17
          TabStop = False
          Alignment = taLeftJustify
          BiDiMode = bdLeftToRight
          Caption = 'Ch7'
          Checked = True
          ParentBiDiMode = False
          State = cbChecked
          TabOrder = 19
          OnClick = CheckBox1Click
        end
        object CheckBox8: TCheckBox
          Left = 232
          Top = 28
          Width = 37
          Height = 17
          TabStop = False
          Alignment = taLeftJustify
          BiDiMode = bdLeftToRight
          Caption = 'Ch8'
          Checked = True
          ParentBiDiMode = False
          State = cbChecked
          TabOrder = 21
          OnClick = CheckBox1Click
        end
        object CheckBox9: TCheckBox
          Left = 232
          Top = 46
          Width = 37
          Height = 17
          TabStop = False
          Alignment = taLeftJustify
          BiDiMode = bdLeftToRight
          Caption = 'Ch9'
          Checked = True
          ParentBiDiMode = False
          State = cbChecked
          TabOrder = 22
          OnClick = CheckBox1Click
        end
        object CheckBox10: TCheckBox
          Left = 344
          Top = 10
          Width = 43
          Height = 17
          TabStop = False
          Alignment = taLeftJustify
          BiDiMode = bdLeftToRight
          Caption = 'Ch10'
          Checked = True
          ParentBiDiMode = False
          State = cbChecked
          TabOrder = 23
          OnClick = CheckBox1Click
        end
        object CheckBox11: TCheckBox
          Left = 344
          Top = 28
          Width = 43
          Height = 17
          TabStop = False
          Alignment = taLeftJustify
          BiDiMode = bdLeftToRight
          Caption = 'Ch11'
          Checked = True
          ParentBiDiMode = False
          State = cbChecked
          TabOrder = 24
          OnClick = CheckBox1Click
        end
        object CheckBox12: TCheckBox
          Left = 344
          Top = 46
          Width = 43
          Height = 17
          TabStop = False
          Alignment = taLeftJustify
          BiDiMode = bdLeftToRight
          Caption = 'Ch12'
          Checked = True
          ParentBiDiMode = False
          State = cbChecked
          TabOrder = 26
          OnClick = CheckBox1Click
        end
        object Button10: TButton
          Left = 216
          Top = 148
          Width = 75
          Height = 25
          Caption = 'Paused'
          TabOrder = 0
          OnClick = Button10Click
        end
        object CheckBox86: TCheckBox
          Left = 6
          Top = 66
          Width = 40
          Height = 17
          TabStop = False
          Alignment = taLeftJustify
          BiDiMode = bdLeftToRight
          Caption = 'Ch13'
          Checked = True
          ParentBiDiMode = False
          State = cbChecked
          TabOrder = 27
          OnClick = CheckBox1Click
        end
        object Edit14: TEdit
          Left = 52
          Top = 66
          Width = 30
          Height = 21
          TabOrder = 28
          Text = '0'
          OnClick = EditAdrOssClick
          OnKeyPress = Edit1KeyPress
        end
        object CheckBox87: TCheckBox
          Left = 118
          Top = 66
          Width = 40
          Height = 17
          TabStop = False
          Alignment = taLeftJustify
          BiDiMode = bdLeftToRight
          Caption = 'Ch14'
          Checked = True
          ParentBiDiMode = False
          State = cbChecked
          TabOrder = 25
          OnClick = CheckBox1Click
        end
        object Edit15: TEdit
          Left = 160
          Top = 66
          Width = 30
          Height = 21
          TabOrder = 20
          Text = '0'
          OnClick = EditAdrOssClick
          OnKeyPress = Edit1KeyPress
        end
        object CheckBox88: TCheckBox
          Left = 230
          Top = 66
          Width = 40
          Height = 17
          TabStop = False
          Alignment = taLeftJustify
          BiDiMode = bdLeftToRight
          Caption = 'Ch15'
          Checked = True
          ParentBiDiMode = False
          State = cbChecked
          TabOrder = 29
          OnClick = CheckBox1Click
        end
        object Edit16: TEdit
          Left = 272
          Top = 66
          Width = 30
          Height = 21
          TabOrder = 30
          Text = '0'
          OnClick = EditAdrOssClick
          OnKeyPress = Edit1KeyPress
        end
        object CheckBox89: TCheckBox
          Left = 344
          Top = 66
          Width = 43
          Height = 17
          TabStop = False
          Alignment = taLeftJustify
          BiDiMode = bdLeftToRight
          Caption = 'Ch16'
          Checked = True
          ParentBiDiMode = False
          State = cbChecked
          TabOrder = 31
          OnClick = CheckBox1Click
        end
        object Edit17: TEdit
          Left = 392
          Top = 66
          Width = 30
          Height = 21
          TabOrder = 32
          Text = '0'
          OnClick = EditAdrOssClick
          OnKeyPress = Edit1KeyPress
        end
        object CheckBox100: TCheckBox
          Left = 6
          Top = 86
          Width = 40
          Height = 17
          TabStop = False
          Alignment = taLeftJustify
          BiDiMode = bdLeftToRight
          Caption = 'Ch17'
          Checked = True
          ParentBiDiMode = False
          State = cbChecked
          TabOrder = 33
          OnClick = CheckBox1Click
        end
        object Edit88: TEdit
          Left = 52
          Top = 86
          Width = 30
          Height = 21
          TabOrder = 34
          Text = '0'
          OnClick = EditAdrOssClick
          OnKeyPress = Edit1KeyPress
        end
        object CheckBox101: TCheckBox
          Left = 118
          Top = 86
          Width = 40
          Height = 17
          TabStop = False
          Alignment = taLeftJustify
          BiDiMode = bdLeftToRight
          Caption = 'Ch18'
          Checked = True
          ParentBiDiMode = False
          State = cbChecked
          TabOrder = 35
          OnClick = CheckBox1Click
        end
        object Edit89: TEdit
          Left = 160
          Top = 86
          Width = 30
          Height = 21
          TabOrder = 36
          Text = '0'
          OnClick = EditAdrOssClick
          OnKeyPress = Edit1KeyPress
        end
        object CheckBox102: TCheckBox
          Left = 230
          Top = 86
          Width = 40
          Height = 17
          TabStop = False
          Alignment = taLeftJustify
          BiDiMode = bdLeftToRight
          Caption = 'Ch19'
          Checked = True
          ParentBiDiMode = False
          State = cbChecked
          TabOrder = 37
          OnClick = CheckBox1Click
        end
        object Edit90: TEdit
          Left = 272
          Top = 86
          Width = 30
          Height = 21
          TabOrder = 38
          Text = '0'
          OnClick = EditAdrOssClick
          OnKeyPress = Edit1KeyPress
        end
        object CheckBox103: TCheckBox
          Left = 344
          Top = 86
          Width = 43
          Height = 17
          TabStop = False
          Alignment = taLeftJustify
          BiDiMode = bdLeftToRight
          Caption = 'Ch20'
          Checked = True
          ParentBiDiMode = False
          State = cbChecked
          TabOrder = 39
          OnClick = CheckBox1Click
        end
        object Edit91: TEdit
          Left = 392
          Top = 86
          Width = 30
          Height = 21
          TabOrder = 40
          Text = '0'
          OnClick = EditAdrOssClick
          OnKeyPress = Edit1KeyPress
        end
        object Edit427: TEdit
          Left = 618
          Top = 157
          Width = 33
          Height = 21
          TabOrder = 41
          Text = '0'
        end
        object GroupBox1111: TGroupBox
          Left = 448
          Top = 0
          Width = 121
          Height = 121
          Caption = 'C'#1077#1083#1077#1082#1090#1086#1088' '#1089#1094#1077#1085#1072#1088#1080#1077#1074
          TabOrder = 42
          object Edit100: TEdit
            Left = 96
            Top = 16
            Width = 20
            Height = 21
            TabOrder = 0
            Text = '0'
          end
          object _SelOss_Grid: TStringGrid
            Left = 8
            Top = 16
            Width = 88
            Height = 98
            ColCount = 2
            DefaultColWidth = 20
            DefaultRowHeight = 14
            RowCount = 3
            FixedRows = 0
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect, goThumbTracking]
            ScrollBars = ssVertical
            TabOrder = 1
            OnSelectCell = _SelOss_GridSelectCell
          end
        end
        object CheckBox341: TCheckBox
          Left = 6
          Top = 104
          Width = 40
          Height = 17
          TabStop = False
          Alignment = taLeftJustify
          BiDiMode = bdLeftToRight
          Caption = 'Ch21'
          Checked = True
          ParentBiDiMode = False
          State = cbChecked
          TabOrder = 43
          OnClick = CheckBox1Click
        end
        object Edit452: TEdit
          Left = 52
          Top = 104
          Width = 30
          Height = 21
          TabOrder = 44
          Text = '0'
          OnClick = EditAdrOssClick
          OnKeyPress = Edit1KeyPress
        end
        object CheckBox342: TCheckBox
          Left = 118
          Top = 104
          Width = 40
          Height = 17
          TabStop = False
          Alignment = taLeftJustify
          BiDiMode = bdLeftToRight
          Caption = 'Ch22'
          Checked = True
          ParentBiDiMode = False
          State = cbChecked
          TabOrder = 45
          OnClick = CheckBox1Click
        end
        object Edit453: TEdit
          Left = 160
          Top = 104
          Width = 30
          Height = 21
          TabOrder = 46
          Text = '0'
          OnClick = EditAdrOssClick
          OnKeyPress = Edit1KeyPress
        end
        object CheckBox343: TCheckBox
          Left = 230
          Top = 104
          Width = 40
          Height = 17
          TabStop = False
          Alignment = taLeftJustify
          BiDiMode = bdLeftToRight
          Caption = 'Ch23'
          Checked = True
          ParentBiDiMode = False
          State = cbChecked
          TabOrder = 47
          OnClick = CheckBox1Click
        end
        object Edit457: TEdit
          Left = 272
          Top = 104
          Width = 30
          Height = 21
          TabOrder = 48
          Text = '0'
          OnClick = EditAdrOssClick
          OnKeyPress = Edit1KeyPress
        end
        object CheckBox346: TCheckBox
          Left = 344
          Top = 104
          Width = 43
          Height = 17
          TabStop = False
          Alignment = taLeftJustify
          BiDiMode = bdLeftToRight
          Caption = 'Ch24'
          Checked = True
          ParentBiDiMode = False
          State = cbChecked
          TabOrder = 49
          OnClick = CheckBox1Click
        end
        object Edit458: TEdit
          Left = 392
          Top = 104
          Width = 30
          Height = 21
          TabOrder = 50
          Text = '0'
          OnClick = EditAdrOssClick
          OnKeyPress = Edit1KeyPress
        end
        object GroupBox1107: TGroupBox
          Left = 560
          Top = 32
          Width = 96
          Height = 121
          Caption = 'C'#1077#1083#1077#1082#1090#1086#1088' Road'
          TabOrder = 51
          Visible = False
          object _SelRoad_Grid: TStringGrid
            Left = 6
            Top = 16
            Width = 84
            Height = 98
            ColCount = 2
            DefaultColWidth = 20
            DefaultRowHeight = 14
            RowCount = 3
            FixedRows = 0
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect, goThumbTracking]
            ScrollBars = ssVertical
            TabOrder = 0
            OnSelectCell = _SelRoad_GridSelectCell
          end
        end
        object Edit418: TEdit
          Left = 624
          Top = 8
          Width = 20
          Height = 21
          TabOrder = 52
          Text = '0'
          Visible = False
        end
        object rg3: TRadioGroup
          Left = 486
          Top = 128
          Width = 59
          Height = 46
          Items.Strings = (
            'MC1'
            'MC2')
          TabOrder = 53
          OnClick = rg3Click
        end
      end
      object StringGrid1: TStringGrid
        Left = 58
        Top = 40
        Width = 143
        Height = 161
        ColCount = 1
        DefaultColWidth = 120
        DefaultRowHeight = 15
        FixedCols = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goRowSelect, goThumbTracking]
        ScrollBars = ssVertical
        TabOrder = 1
        Visible = False
      end
      object Panel8: TPanel
        Left = 0
        Top = 8
        Width = 601
        Height = 289
        Caption = 'Panel8'
        TabOrder = 2
        Visible = False
        object Button3: TButton
          Left = 280
          Top = 240
          Width = 97
          Height = 25
          Caption = 'Update OSC Adr'
          TabOrder = 0
          OnClick = Button3Click
        end
        object GroupBox4: TGroupBox
          Left = 48
          Top = 14
          Width = 217
          Height = 267
          Caption = 'MOTOROLA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object GroupBox14: TGroupBox
            Left = 8
            Top = 16
            Width = 201
            Height = 241
            Caption = #1055#1077#1088#1077#1084#1077#1085#1085#1072#1103
            DragKind = dkDock
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object MotoGridOss: TStringGrid
              Left = 10
              Top = 16
              Width = 183
              Height = 217
              BiDiMode = bdLeftToRight
              ColCount = 1
              DefaultColWidth = 160
              DefaultRowHeight = 15
              FixedCols = 0
              RowCount = 511
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goRowSelect, goThumbTracking]
              ParentBiDiMode = False
              ScrollBars = ssVertical
              TabOrder = 0
              OnClick = MotoGridOssClick
              OnKeyPress = MotoGridOssKeyPress
            end
          end
        end
        object GroupBox17: TGroupBox
          Left = 272
          Top = 14
          Width = 313
          Height = 211
          Caption = 'ATMEL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          object Label86: TLabel
            Left = 16
            Top = 24
            Width = 63
            Height = 13
            Caption = 'SPI_In_Buff2'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label87: TLabel
            Left = 16
            Top = 48
            Width = 63
            Height = 13
            Caption = 'SPI_In_Buff3'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label88: TLabel
            Left = 16
            Top = 72
            Width = 63
            Height = 13
            Caption = 'SPI_In_Buff4'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label89: TLabel
            Left = 16
            Top = 96
            Width = 63
            Height = 13
            Caption = 'SPI_In_Buff5'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label90: TLabel
            Left = 16
            Top = 120
            Width = 63
            Height = 13
            Caption = 'SPI_In_Buff6'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object GroupBox18: TGroupBox
            Left = 136
            Top = 16
            Width = 169
            Height = 185
            Caption = #1055#1077#1088#1077#1084#1077#1085#1085#1072#1103
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object RAM_adr: TStringGrid
              Left = 10
              Top = 16
              Width = 143
              Height = 161
              ColCount = 1
              DefaultColWidth = 120
              DefaultRowHeight = 15
              FixedCols = 0
              RowCount = 15
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goRowSelect, goThumbTracking]
              ScrollBars = ssVertical
              TabOrder = 0
              OnSelectCell = Select
            end
          end
          object Edit19: TEdit
            Left = 88
            Top = 144
            Width = 33
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Text = 'Edit19'
            OnClick = Edit14Click
          end
          object Edit18: TEdit
            Left = 88
            Top = 120
            Width = 33
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            Text = 'Edit13'
            OnClick = Edit14Click
          end
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'EEPROM'
      ImageIndex = 4
      object EEPROM: TPageControl
        Left = 0
        Top = 0
        Width = 660
        Height = 486
        ActivePage = TabSheet2
        Align = alClient
        TabOrder = 0
        object TabSheet2: TTabSheet
          Caption = 'MOTOROLA'
          object Label4: TLabel
            Left = 8
            Top = 0
            Width = 33
            Height = 13
            Caption = '-----------'
          end
          object GroupBox9: TGroupBox
            Left = 8
            Top = 82
            Width = 193
            Height = 81
            Caption = 'EEPROM'
            TabOrder = 2
            object Label68: TLabel
              Left = 8
              Top = 12
              Width = 135
              Height = 13
              Caption = #1056#1072#1079#1084#1077#1088' EEPROM '#1086#1073#1083#1072#1089#1090#1080':'
            end
            object Label115: TLabel
              Left = 8
              Top = 28
              Width = 105
              Height = 13
              Caption = #1050#1086#1085#1090#1088#1086#1083#1100#1085#1072#1103' '#1089#1091#1084#1084#1072':'
            end
            object Label116: TLabel
              Left = 110
              Top = 46
              Width = 3
              Height = 13
            end
            object Label288: TLabel
              Left = 48
              Top = 62
              Width = 43
              Height = 13
              Caption = #1042' '#1073#1083#1086#1082#1077':'
            end
            object Label289: TLabel
              Left = 110
              Top = 62
              Width = 3
              Height = 13
            end
            object Label290: TLabel
              Left = 48
              Top = 46
              Width = 45
              Height = 13
              Caption = #1042' '#1092#1072#1081#1083#1077':'
            end
          end
          object Memo1: TMemo
            Left = 0
            Top = 168
            Width = 209
            Height = 137
            ScrollBars = ssVertical
            TabOrder = 0
          end
          object MotoGrid: TStringGrid
            Left = 219
            Top = 18
            Width = 377
            Height = 361
            ColCount = 4
            DefaultColWidth = 110
            DefaultRowHeight = 16
            FixedCols = 2
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goThumbTracking]
            TabOrder = 1
            ColWidths = (
              110
              31
              30
              198)
            RowHeights = (
              16
              16
              16
              16
              16)
          end
          object GroupBox22: TGroupBox
            Left = 8
            Top = 15
            Width = 193
            Height = 66
            Caption = 'ROM'
            TabOrder = 3
            object Label113: TLabel
              Left = 8
              Top = 14
              Width = 105
              Height = 13
              Caption = #1050#1086#1085#1090#1088#1086#1083#1100#1085#1072#1103' '#1089#1091#1084#1084#1072':'
            end
            object Label114: TLabel
              Left = 110
              Top = 46
              Width = 3
              Height = 13
            end
            object Label291: TLabel
              Left = 48
              Top = 30
              Width = 45
              Height = 13
              Caption = #1042' '#1092#1072#1081#1083#1077':'
            end
            object Label292: TLabel
              Left = 48
              Top = 46
              Width = 43
              Height = 13
              Caption = #1042' '#1073#1083#1086#1082#1077':'
            end
            object Label293: TLabel
              Left = 110
              Top = 30
              Width = 3
              Height = 13
            end
          end
          object GroupBox88: TGroupBox
            Left = 0
            Top = 304
            Width = 209
            Height = 116
            TabOrder = 4
            object Button32: TButton
              Left = 8
              Top = 47
              Width = 81
              Height = 25
              Caption = #1055#1088#1086#1096#1080#1090#1100' S19'
              TabOrder = 0
              OnClick = Button32Click
            end
            object Button26: TButton
              Left = 8
              Top = 11
              Width = 81
              Height = 25
              Caption = 'DUMP'
              TabOrder = 1
              OnClick = Button26Click
            end
            object Button11: TButton
              Left = 8
              Top = 83
              Width = 81
              Height = 25
              Caption = 'UtIls'
              TabOrder = 2
              OnClick = Button11Click
            end
            object Button5: TButton
              Left = 104
              Top = 11
              Width = 97
              Height = 25
              Caption = #1055#1088#1086#1096#1080#1090#1100' Const'
              TabOrder = 3
              OnClick = Button5Click
            end
            object Button14: TButton
              Left = 104
              Top = 47
              Width = 97
              Height = 25
              Caption = 'Load_Const_File'
              TabOrder = 4
              OnClick = Button14Click
            end
            object Button15: TButton
              Left = 104
              Top = 83
              Width = 97
              Height = 25
              Caption = 'Save_Const_File'
              TabOrder = 5
              OnClick = Button15Click
            end
          end
          object Button57: TButton
            Left = 240
            Top = 392
            Width = 75
            Height = 25
            Caption = 'Protected'
            TabOrder = 5
            OnClick = Button57Click
          end
          object Button58: TButton
            Left = 344
            Top = 392
            Width = 75
            Height = 25
            Caption = 'Un Protected'
            TabOrder = 6
            OnClick = Button58Click
          end
        end
        object TabSheet3: TTabSheet
          Caption = 'EPROM'
          ImageIndex = 1
          object Label69: TLabel
            Left = 24
            Top = 16
            Width = 118
            Height = 13
            Cursor = crHandPoint
            Caption = #1060#1072#1081#1083' '#1085#1072#1089#1090#1088#1086#1077#1082' ATMEL'
            OnDblClick = Label69DblClick
          end
          object ATMEL_EPROM: TStringGrid
            Left = 16
            Top = 48
            Width = 544
            Height = 249
            ColCount = 3
            DefaultColWidth = 200
            DefaultRowHeight = 20
            FixedRows = 0
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing, goThumbTracking]
            TabOrder = 0
            Visible = False
            OnSetEditText = ATMEL_EPROMSetEditText
            ColWidths = (
              200
              64
              255)
            RowHeights = (
              20
              20
              20
              20
              20)
          end
          object Button13: TButton
            Left = 16
            Top = 304
            Width = 75
            Height = 25
            Caption = 'DUMP'
            TabOrder = 1
            OnClick = Button13Click
          end
          object Button12: TButton
            Left = 280
            Top = 304
            Width = 113
            Height = 25
            Cursor = crHandPoint
            Caption = #1047#1072#1087#1080#1089#1072#1090#1100' EEPROM'
            TabOrder = 2
            OnClick = Button12Click
          end
          object Button16: TButton
            Left = 424
            Top = 304
            Width = 139
            Height = 25
            Cursor = crHandPoint
            Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
            TabOrder = 3
            Visible = False
            OnClick = ATMEL_EPROMEnter
          end
        end
      end
    end
    object TabSheet8: TTabSheet
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072
      ImageIndex = 7
      OnEnter = TabSheet8Enter
      OnExit = TabSheet8Exit
      OnShow = TabSheet8Show
      object Label380: TLabel
        Left = 616
        Top = 436
        Width = 36
        Height = 13
        Caption = '------------'
      end
      object GroupBox23: TGroupBox
        Left = 120
        Top = 422
        Width = 490
        Height = 38
        TabOrder = 3
        object Button4: TButton
          Left = 8
          Top = 9
          Width = 65
          Height = 25
          Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
          TabOrder = 0
          OnClick = Button4Click
        end
        object Button39: TButton
          Left = 88
          Top = 9
          Width = 65
          Height = 25
          Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
          TabOrder = 1
          OnClick = Button39Click
        end
        object Button2: TButton
          Left = 260
          Top = 9
          Width = 129
          Height = 25
          Caption = #1048#1085#1080#1094#1080#1072#1083#1080#1079#1072#1094#1080#1103' '#1085#1086#1084#1077#1088#1072
          TabOrder = 2
          OnClick = Button2Click
        end
        object CheckBox50: TCheckBox
          Left = 394
          Top = 14
          Width = 92
          Height = 15
          Caption = #1058#1077#1082#1091#1097#1072#1103' '#1076#1072#1090#1072
          TabOrder = 3
        end
      end
      object PageControl2: TPageControl
        Left = 0
        Top = 0
        Width = 611
        Height = 424
        ActivePage = TabSheet13
        TabOrder = 0
        OnChange = PageControl2Change
        object TabSheet9: TTabSheet
          Caption = #1050#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1103
          ImageIndex = 1
          object RadioGroup1: TRadioGroup
            Left = 4
            Top = 228
            Width = 153
            Height = 65
            Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1076#1074#1080#1075#1072#1090#1077#1083#1077#1084
            Items.Strings = (
              #1055#1085#1077#1074#1084#1086#1094#1080#1083#1080#1085#1076#1088
              #1085#1077#1090
              #1050#1072#1085#1072#1083' CAN')
            TabOrder = 0
            OnClick = ParamChange
          end
          object GroupBox34: TGroupBox
            Left = 168
            Top = 228
            Width = 185
            Height = 49
            Caption = #1052#1086#1090#1086#1088#1085#1099#1081' '#1090#1086#1088#1084#1086#1079
            TabOrder = 1
            object CheckBox36: TCheckBox
              Left = 8
              Top = 30
              Width = 137
              Height = 17
              Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1074#1082#1083#1102#1095#1077#1085#1086
              TabOrder = 0
              OnClick = ParamChange
            end
            object CheckBox39: TCheckBox
              Left = 8
              Top = 14
              Width = 137
              Height = 17
              Caption = #1056#1077#1083#1077'  '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1086
              TabOrder = 1
              OnClick = ParamChange
            end
          end
          object GroupBox35: TGroupBox
            Left = 368
            Top = 0
            Width = 229
            Height = 172
            Caption = #1050#1072#1085#1072#1083' CAN'
            TabOrder = 2
            DesignSize = (
              229
              172)
            object Label159: TLabel
              Left = 10
              Top = 16
              Width = 82
              Height = 13
              Caption = #1055#1088#1080#1086#1088#1080#1090#1077#1090'  '#1055#1041#1057
            end
            object Label187: TLabel
              Left = 10
              Top = 35
              Width = 201
              Height = 13
              Caption = #1050#1086#1077#1092#1092#1080#1094#1080#1077#1085#1090' '#1091#1089#1080#1083#1077#1085#1080#1103' '#1055#1041#1057'                %'
            end
            object Label188: TLabel
              Left = 10
              Top = 54
              Width = 200
              Height = 13
              Caption = #1052#1086#1084#1077#1085#1090' '#1090#1086#1088#1084#1086#1079#1072'-'#1079#1072#1084#1077#1076#1083#1080#1090#1077#1083#1103'            %'
            end
            object Label189: TLabel
              Left = 10
              Top = 72
              Width = 81
              Height = 13
              Caption = 'Preffered_Adress'
            end
            object ComboBox5: TComboBox
              Left = 98
              Top = 12
              Width = 77
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              DropDownCount = 6
              ItemHeight = 13
              TabOrder = 0
              OnChange = ParamChange
              Items.Strings = (
                #1042#1099#1089#1086#1095#1072#1081#1096#1080#1081
                #1042#1099#1089#1086#1082#1080#1081
                #1057#1088#1077#1076#1085#1080#1081
                #1053#1080#1079#1082#1080#1081)
            end
            object Edit20: TEdit
              Left = 176
              Top = 32
              Width = 25
              Height = 21
              TabOrder = 1
              Text = '100'
              OnChange = ParamChange
            end
            object Edit29: TEdit
              Left = 176
              Top = 51
              Width = 25
              Height = 21
              TabOrder = 2
              OnChange = ParamChange
            end
            object Edit30: TEdit
              Left = 104
              Top = 69
              Width = 30
              Height = 21
              TabOrder = 3
              Text = '11'
            end
            object CheckBox42: TCheckBox
              Left = 10
              Top = 103
              Width = 169
              Height = 17
              Caption = #1047#1072#1087#1088#1086#1089' '#1076#1074#1080#1075#1072#1090#1077#1083#1102' '#1087#1086#1089#1090#1086#1103#1085#1085#1086
              TabOrder = 4
              OnClick = ParamChange
            end
            object CheckBox49: TCheckBox
              Left = 10
              Top = 87
              Width = 169
              Height = 17
              Caption = #1058#1072#1093#1086#1075#1088#1072#1092' c CAN'
              TabOrder = 5
              OnClick = ParamChange
            end
            object CheckBox94: TCheckBox
              Left = 10
              Top = 119
              Width = 169
              Height = 17
              BiDiMode = bdLeftToRight
              Caption = #1040#1076#1088#1077#1089' CAN VDC Wabco'
              ParentBiDiMode = False
              TabOrder = 6
              OnClick = ParamChange
            end
            object CheckBox126: TCheckBox
              Left = 10
              Top = 135
              Width = 169
              Height = 17
              Caption = 'CAN DM1 '#1087#1086#1089#1090#1086#1103#1085#1085#1086
              TabOrder = 7
              OnClick = ParamChange
            end
            object CheckBox25: TCheckBox
              Left = 10
              Top = 151
              Width = 169
              Height = 17
              Caption = 'TSC_AE  Arbitrage'
              TabOrder = 8
              OnClick = ParamChange
            end
          end
          object GroupBox43: TGroupBox
            Left = 168
            Top = 310
            Width = 185
            Height = 34
            Caption = ' '#1059#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1090#1103#1075#1086#1074#1099#1084' '#1084#1086#1084#1077#1085#1090#1086#1084
            TabOrder = 3
            object CheckBox34: TCheckBox
              Left = 8
              Top = 14
              Width = 173
              Height = 17
              Caption = #1056#1077#1078#1080#1084' Drag TC '#1080#1089#1087#1086#1083#1100#1079#1091#1077#1090#1089#1103' '
              TabOrder = 0
              OnClick = ParamChange
            end
          end
          object GroupBox52: TGroupBox
            Left = 168
            Top = 276
            Width = 185
            Height = 33
            Caption = #1041#1083#1086#1082#1080#1088#1086#1074#1082#1072' '#1076#1080#1092#1092#1077#1088#1077#1085#1094#1080#1072#1083#1072
            TabOrder = 4
            object CheckBox53: TCheckBox
              Left = 6
              Top = 14
              Width = 173
              Height = 17
              Caption = #1042#1077#1076#1091#1097#1077#1075#1086' '#1084#1086#1089#1090#1072' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1072
              TabOrder = 0
              OnClick = ParamChange
            end
          end
          object GroupBox28: TGroupBox
            Left = 4
            Top = 300
            Width = 153
            Height = 93
            Caption = #1057#1090#1086#1087'-'#1089#1080#1075#1085#1072#1083
            TabOrder = 5
            object RadioGroup4: TRadioGroup
              Left = 8
              Top = 12
              Width = 129
              Height = 60
              Items.Strings = (
                #1042#1099#1082#1083#1102#1095#1072#1090#1077#1083#1100
                #1044#1072#1090#1095#1080#1082' '#1076#1072#1074#1083#1077#1085#1080#1103
                #1053#1077' '#1080#1089#1087#1086#1083#1100#1079#1091#1077#1090#1089#1103)
              TabOrder = 0
              OnClick = ParamChange
            end
            object CheckBox68: TCheckBox
              Left = 88
              Top = 73
              Width = 49
              Height = 17
              Alignment = taLeftJustify
              Caption = 'OffSet '
              TabOrder = 1
              OnClick = ParamChange
            end
          end
          object GroupBox27: TGroupBox
            Left = 368
            Top = 192
            Width = 137
            Height = 200
            Caption = #1055#1077#1088#1077#1082#1083#1102#1095#1072#1090#1077#1083#1080' '
            TabOrder = 6
            object RadioGroup6: TRadioGroup
              Left = 8
              Top = 133
              Width = 121
              Height = 60
              Caption = 'TSET'
              Items.Strings = (
                #1074#1099#1082#1083#1102#1095#1072#1090#1077#1083#1100
                #1082#1085#1086#1087#1082#1072
                #1085#1077#1090)
              TabOrder = 0
              OnClick = ParamChange
            end
            object RadioGroup3: TRadioGroup
              Left = 8
              Top = 73
              Width = 121
              Height = 60
              Caption = 'ASR  VDC'
              Items.Strings = (
                #1074#1099#1082#1083#1102#1095#1072#1090#1077#1083#1100
                #1082#1085#1086#1087#1082#1072
                #1085#1077#1090)
              TabOrder = 1
              OnClick = ParamChange
            end
            object RadioGroup2: TRadioGroup
              Left = 9
              Top = 13
              Width = 121
              Height = 60
              Caption = 'ABS'
              Items.Strings = (
                #1074#1099#1082#1083#1102#1095#1072#1090#1077#1083#1100
                #1082#1085#1086#1087#1082#1072
                #1085#1077#1090)
              TabOrder = 2
              OnClick = ParamChange
            end
          end
          object GroupBox164: TGroupBox
            Left = 168
            Top = 344
            Width = 185
            Height = 49
            Caption = #1051#1072#1084#1087#1099
            TabOrder = 7
            object CheckBox31: TCheckBox
              Left = 8
              Top = 12
              Width = 153
              Height = 17
              Caption = #1051#1072#1084#1087#1072' '#1055#1041#1057' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1072
              TabOrder = 0
              OnClick = ParamChange
            end
            object CheckBox40: TCheckBox
              Left = 8
              Top = 28
              Width = 153
              Height = 17
              Caption = #1051#1072#1084#1087#1072' ABS '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1072
              TabOrder = 1
              OnClick = ParamChange
            end
          end
          object RadioGroup7: TRadioGroup
            Left = 4
            Top = 0
            Width = 349
            Height = 209
            Caption = #1050#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1103' '#1052#1086#1076#1091#1083#1103#1090#1086#1088#1086#1074
            Items.Strings = (
              ' '#1054#1076#1080#1085#1086#1095#1085#1099#1081' '#1052#1086#1076#1091#1083#1103#1090#1086#1088' '#1085#1072' '#1054#1089#1080' (2S/1M)'
              ' '#1054#1076#1085#1072' '#1054#1089#1100' '#1052#1086#1076#1091#1083#1103#1090#1086#1088' '#1085#1072' '#1044#1072#1090#1095#1080#1082' (2S/2M)'
              ' '#1044#1074#1077' '#1054#1089#1080' '#1087#1086' '#1086#1076#1085#1086#1084#1091' '#1052#1086#1076#1091#1083#1103#1090#1086#1088#1091' '#1085#1072' '#1073#1086#1088#1090' (4S/2M) '
              ' '#1054#1076#1080#1085' '#1052#1086#1076#1091#1083#1103#1090#1086#1088' '#1085#1072' '#1059#1087#1088#1072#1074#1083#1103#1077#1084#1086#1081' '#1054#1089#1080'  (4S/3M) '
              ' '#1054#1076#1080#1085' '#1052#1086#1076#1091#1083#1103#1090#1086#1088' '#1085#1072' '#1042#1077#1076#1091#1097#1077#1081' '#1054#1089#1080'  (4S/3M)'
              ' '#1044#1074#1077' '#1054#1089#1080' '#1052#1086#1076#1091#1083#1103#1090#1086#1088' '#1085#1072' '#1044#1072#1090#1095#1080#1082' (4S/4M)'
              ' '#1054#1076#1080#1085' '#1052#1086#1076#1091#1083#1103#1090#1086#1088' '#1085#1072' '#1059#1087#1088#1072#1074#1083#1103#1077#1084#1086#1081' '#1054#1089#1080' '#1080' '#1087#1086' '#1073#1086#1088#1090#1072#1084' (6S/3M)'
              ' '#1042#1077#1076#1091#1097#1072#1103' '#1080' '#1044#1086#1087'. '#1054#1089#1100' '#1087#1086' '#1086#1076#1085#1086#1084#1091' '#1052#1086#1076#1091#1083#1103#1090#1086#1088#1091' '#1085#1072' '#1073#1086#1088#1090' (6S/4M)'
              ' '#1054#1076#1080#1085' '#1052#1086#1076#1091#1083#1103#1090#1086#1088' '#1085#1072' '#1059#1087#1088#1072#1074#1083#1103#1077#1084#1086#1081' '#1054#1089#1080' '#1080' '#1085#1072' '#1044#1086#1087'. '#1054#1089#1080' (6S/4M) '
              ' '#1054#1076#1080#1085' '#1052#1086#1076#1091#1083#1103#1090#1086#1088' '#1085#1072' '#1059#1087#1088#1072#1074#1083#1103#1077#1084#1086#1081' '#1054#1089#1080'  (6S/5M) '
              ' '#1054#1076#1080#1085' '#1052#1086#1076#1091#1083#1103#1090#1086#1088' '#1085#1072' '#1044#1086#1087'. '#1054#1089#1080' (6S/5M) '
              ' '#1058#1088#1080' '#1054#1089#1080' '#1052#1086#1076#1091#1083#1103#1090#1086#1088' '#1085#1072' '#1044#1072#1090#1095#1080#1082' (6S/6M)')
            TabOrder = 8
            OnClick = ParamChange
          end
          object RadioGroup8: TRadioGroup
            Left = 528
            Top = 192
            Width = 67
            Height = 49
            Items.Strings = (
              #1090#1103#1075#1072#1095
              #1087#1088#1080#1094#1077#1087)
            TabOrder = 9
            OnClick = ParamChange
          end
        end
        object TabSheet10: TTabSheet
          Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
          ImageIndex = 1
          object GroupBox10: TGroupBox
            Left = 6
            Top = 0
            Width = 196
            Height = 249
            Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1082#1086#1083#1077#1089
            TabOrder = 0
            object CheckBox37: TCheckBox
              Left = 8
              Top = 226
              Width = 177
              Height = 17
              Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1072#1103' '#1082#1086#1084#1087#1077#1085#1089#1072#1094#1080#1103
              TabOrder = 0
              OnClick = CheckBox37Click
            end
            object GroupBox121: TGroupBox
              Left = 8
              Top = 14
              Width = 180
              Height = 62
              Caption = #1055#1077#1088#1077#1076#1085#1103#1103' '#1086#1089#1100
              TabOrder = 1
              DesignSize = (
                180
                62)
              object Label72: TLabel
                Left = 8
                Top = 16
                Width = 102
                Height = 13
                Caption = #1063#1080#1089#1083#1086' '#1079#1091#1073#1086#1074' '#1088#1086#1090#1086#1088#1072
              end
              object Label73: TLabel
                Left = 8
                Top = 36
                Width = 165
                Height = 13
                Caption = #1044#1080#1072#1084#1077#1090#1088' '#1082#1086#1083#1077#1089'                          '#1084
              end
              object Edit26: TEdit
                Left = 123
                Top = 14
                Width = 41
                Height = 21
                Anchors = [akTop, akRight]
                TabOrder = 0
                Text = '0'
                OnChange = ParamChange
              end
              object Edit27: TEdit
                Left = 123
                Top = 34
                Width = 41
                Height = 21
                Anchors = [akTop, akRight]
                TabOrder = 1
                Text = '0'
                OnChange = ParamChange
                OnClick = Edit27Click
              end
            end
            object GroupBox122: TGroupBox
              Left = 8
              Top = 78
              Width = 180
              Height = 72
              Caption = #1047#1072#1076#1085#1103#1103' '#1086#1089#1100
              TabOrder = 2
              DesignSize = (
                180
                72)
              object Label423: TLabel
                Left = 8
                Top = 16
                Width = 102
                Height = 13
                Caption = #1063#1080#1089#1083#1086' '#1079#1091#1073#1086#1074' '#1088#1086#1090#1086#1088#1072
              end
              object Label74: TLabel
                Left = 8
                Top = 36
                Width = 165
                Height = 13
                Caption = #1044#1080#1072#1084#1077#1090#1088' '#1082#1086#1083#1077#1089'                          '#1084
              end
              object Edit21: TEdit
                Left = 123
                Top = 14
                Width = 41
                Height = 21
                Anchors = [akTop, akRight]
                TabOrder = 0
                Text = '0'
                OnChange = ParamChange
              end
              object Edit22: TEdit
                Left = 123
                Top = 34
                Width = 41
                Height = 21
                Anchors = [akTop, akRight]
                TabOrder = 1
                Text = '0'
                OnChange = ParamChange
                OnClick = Edit22Click
              end
              object CheckBox162: TCheckBox
                Left = 12
                Top = 52
                Width = 93
                Height = 17
                Caption = 'Tire Tandem'
                TabOrder = 2
                OnClick = ParamChange
              end
            end
            object GroupBox123: TGroupBox
              Left = 8
              Top = 152
              Width = 180
              Height = 72
              Caption = #1058#1088#1077#1090#1100#1103' '#1086#1089#1100
              TabOrder = 3
              DesignSize = (
                180
                72)
              object Label157: TLabel
                Left = 8
                Top = 16
                Width = 102
                Height = 13
                Caption = #1063#1080#1089#1083#1086' '#1079#1091#1073#1086#1074' '#1088#1086#1090#1086#1088#1072
              end
              object Label158: TLabel
                Left = 8
                Top = 36
                Width = 165
                Height = 13
                Caption = #1044#1080#1072#1084#1077#1090#1088' '#1082#1086#1083#1077#1089'                          '#1084
              end
              object Edit174: TEdit
                Left = 123
                Top = 14
                Width = 41
                Height = 21
                Anchors = [akTop, akRight]
                TabOrder = 0
                Text = '0'
                OnChange = ParamChange
              end
              object Edit175: TEdit
                Left = 123
                Top = 34
                Width = 41
                Height = 21
                Anchors = [akTop, akRight]
                TabOrder = 1
                Text = '0'
                OnChange = ParamChange
                OnClick = Edit175Click
              end
              object CheckBox163: TCheckBox
                Left = 12
                Top = 52
                Width = 93
                Height = 17
                Caption = 'Tire Tandem'
                TabOrder = 2
                OnClick = ParamChange
              end
            end
          end
          object GroupBox36: TGroupBox
            Left = 320
            Top = 192
            Width = 280
            Height = 138
            Caption = #1055#1085#1077#1074#1084#1072#1090#1080#1082#1072
            TabOrder = 1
            Visible = False
            object GroupBox41: TGroupBox
              Left = 8
              Top = 14
              Width = 129
              Height = 118
              Caption = #1055#1077#1088#1077#1076
              TabOrder = 0
              DesignSize = (
                129
                118)
              object Label168: TLabel
                Left = 3
                Top = 16
                Width = 101
                Height = 13
                Caption = 'T'#1086#1088#1084#1086#1079#1085#1072#1103'  '#1082#1072#1084#1077#1088#1072
              end
              object ComboBox6: TComboBox
                Left = 8
                Top = 28
                Width = 113
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                DropDownCount = 6
                ItemHeight = 13
                TabOrder = 0
                OnChange = ComboBox6Change
                Items.Strings = (
                  #1058#1080#1087' '#1085#1077#1086#1087#1088#1077#1076#1077#1083#1077#1085
                  '1 '#1083
                  '0,7 '#1083
                  '')
              end
              object GroupBox72: TGroupBox
                Left = 8
                Top = 50
                Width = 113
                Height = 61
                Caption = #1050#1086#1077#1092'. '#1052#1086#1076#1077#1083#1080' '
                TabOrder = 1
                DesignSize = (
                  113
                  61)
                object Label164: TLabel
                  Left = 4
                  Top = 18
                  Width = 48
                  Height = 13
                  Caption = 'K Exhaust'
                end
                object Label165: TLabel
                  Left = 4
                  Top = 36
                  Width = 36
                  Height = 13
                  Caption = 'K Inject'
                end
                object Edit23: TEdit
                  Left = 76
                  Top = 16
                  Width = 29
                  Height = 21
                  Anchors = [akTop, akRight]
                  TabOrder = 0
                  Text = '0'
                  OnChange = ParamChange
                end
                object Edit24: TEdit
                  Left = 76
                  Top = 36
                  Width = 29
                  Height = 21
                  Anchors = [akTop, akRight]
                  TabOrder = 1
                  Text = '0'
                  OnChange = ParamChange
                end
              end
            end
            object GroupBox73: TGroupBox
              Left = 144
              Top = 14
              Width = 129
              Height = 118
              Caption = #1047#1072#1076
              TabOrder = 1
              DesignSize = (
                129
                118)
              object Label169: TLabel
                Left = 3
                Top = 16
                Width = 101
                Height = 13
                Caption = 'T'#1086#1088#1084#1086#1079#1085#1072#1103'  '#1082#1072#1084#1077#1088#1072
              end
              object ComboBox7: TComboBox
                Left = 8
                Top = 28
                Width = 113
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                DropDownCount = 6
                ItemHeight = 13
                TabOrder = 0
                OnChange = ComboBox6Change
                Items.Strings = (
                  #1058#1080#1087' '#1085#1077#1086#1087#1088#1077#1076#1077#1083#1077#1085
                  '1 '#1083
                  '0,7 '#1083
                  '')
              end
              object GroupBox74: TGroupBox
                Left = 8
                Top = 50
                Width = 113
                Height = 61
                Caption = #1050#1086#1077#1092'. '#1052#1086#1076#1077#1083#1080' '
                TabOrder = 1
                DesignSize = (
                  113
                  61)
                object Label166: TLabel
                  Left = 4
                  Top = 18
                  Width = 48
                  Height = 13
                  Caption = 'K Exhaust'
                end
                object Label167: TLabel
                  Left = 4
                  Top = 36
                  Width = 36
                  Height = 13
                  Caption = 'K Inject'
                end
                object Edit25: TEdit
                  Left = 76
                  Top = 16
                  Width = 29
                  Height = 21
                  Anchors = [akTop, akRight]
                  TabOrder = 0
                  Text = '0'
                  OnChange = ParamChange
                end
                object Edit28: TEdit
                  Left = 76
                  Top = 36
                  Width = 29
                  Height = 21
                  Anchors = [akTop, akRight]
                  TabOrder = 1
                  Text = '0'
                  OnChange = ParamChange
                end
              end
            end
          end
          object RadioGroup5: TRadioGroup
            Left = 6
            Top = 248
            Width = 129
            Height = 49
            Caption = #1053#1072#1087#1088#1103#1078#1077#1085#1080#1077' '#1087#1080#1090#1072#1085#1080#1103
            Items.Strings = (
              '24V'
              '12V')
            TabOrder = 2
            OnClick = ParamChange
          end
          object GroupBox: TGroupBox
            Left = 320
            Top = 0
            Width = 280
            Height = 192
            Caption = #1064#1080#1085#1085#1099#1081' '#1050#1072#1083#1100#1082#1091#1083#1103#1090#1086#1088
            TabOrder = 3
            object GroupBox193: TGroupBox
              Left = 8
              Top = 22
              Width = 161
              Height = 62
              Caption = #1050#1072#1083#1100#1082#1091#1083#1103#1090#1086#1088
              TabOrder = 0
              DesignSize = (
                161
                62)
              object Label424: TLabel
                Left = 8
                Top = 16
                Width = 115
                Height = 13
                Caption = #1056#1072#1079#1084#1077#1088'             /        R'
              end
              object Label631: TLabel
                Left = 5
                Top = 40
                Width = 102
                Height = 13
                Caption = #1044#1080#1072#1084#1077#1090#1088'                '#1084
              end
              object Edit344: TEdit
                Left = 55
                Top = 14
                Width = 30
                Height = 21
                Anchors = [akTop, akRight]
                TabOrder = 0
                Text = '0'
              end
              object Edit345: TEdit
                Left = 93
                Top = 14
                Width = 22
                Height = 21
                Anchors = [akTop, akRight]
                TabOrder = 1
                Text = '0'
              end
              object Edit346: TEdit
                Left = 126
                Top = 14
                Width = 30
                Height = 21
                Anchors = [akTop, akRight]
                TabOrder = 2
                Text = '22,5'
              end
              object Edit343: TEdit
                Left = 55
                Top = 38
                Width = 41
                Height = 21
                Anchors = [akTop, akRight]
                TabOrder = 3
                Text = '0'
                OnChange = ParamChange
                OnClick = Edit343Click
              end
            end
            object rg1: TRadioGroup
              Left = 176
              Top = 6
              Width = 97
              Height = 180
              Caption = 'Tyre'
              Items.Strings = (
                '215/75R17.5'
                '235/75R17.5'
                '245/70R19.5'
                '275/70R22.5'
                '295/80R22.5'
                '315/70R22.5'
                '315/80R22.5'
                '385/55R22.5'
                '385/65R22.5')
              TabOrder = 1
              OnClick = rg1Click
            end
          end
        end
        object TabSheet13: TTabSheet
          Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1040#1041#1057
          ImageIndex = 2
          object GroupBox158: TGroupBox
            Left = 376
            Top = 198
            Width = 217
            Height = 90
            Caption = 'Phase 4'
            TabOrder = 0
            object GroupBox159: TGroupBox
              Left = 8
              Top = 12
              Width = 200
              Height = 72
              Caption = #1047#1072#1074#1080#1089#1080#1084#1086#1089#1090#1100' P'
              TabOrder = 0
              object Label524: TLabel
                Left = 40
                Top = 16
                Width = 36
                Height = 13
                Caption = 'K Press'
              end
              object Label523: TLabel
                Left = 40
                Top = 32
                Width = 37
                Height = 13
                Caption = 'K Accel'
              end
              object Label565: TLabel
                Left = 99
                Top = -2
                Width = 66
                Height = 13
                Caption = #1087#1077#1088#1077#1076'      '#1079#1072#1076
              end
              object Edit274: TEdit
                Left = 96
                Top = 12
                Width = 33
                Height = 21
                TabOrder = 0
                OnChange = ParamChange
              end
              object Edit275: TEdit
                Left = 143
                Top = 12
                Width = 33
                Height = 21
                TabOrder = 1
                Text = ' '
                OnChange = ParamChange
              end
              object Edit276: TEdit
                Left = 96
                Top = 28
                Width = 33
                Height = 21
                TabOrder = 2
                OnChange = ParamChange
              end
              object Edit277: TEdit
                Left = 143
                Top = 28
                Width = 33
                Height = 21
                TabOrder = 3
                Text = ' '
                OnChange = ParamChange
              end
              object CheckBox183: TCheckBox
                Left = 10
                Top = 50
                Width = 130
                Height = 17
                Caption = 'Rekursiya  Enable     K'
                TabOrder = 4
                OnClick = ParamChange
              end
              object Edit279: TEdit
                Left = 143
                Top = 48
                Width = 33
                Height = 21
                TabOrder = 5
                Text = ' '
                OnChange = ParamChange
              end
            end
          end
          object GroupBox161: TGroupBox
            Left = 376
            Top = 288
            Width = 217
            Height = 53
            Caption = 'Phase 5'
            TabOrder = 1
            object Label528: TLabel
              Left = 104
              Top = 14
              Width = 97
              Height = 13
              Caption = 'Pause                  ms'
            end
            object Edit283: TEdit
              Left = 150
              Top = 10
              Width = 33
              Height = 21
              TabOrder = 0
              OnChange = ParamChange
            end
            object CheckBox286: TCheckBox
              Left = 10
              Top = 32
              Width = 135
              Height = 17
              Caption = 'Pause Slip             Koef   '
              TabOrder = 1
              OnClick = ParamChange
            end
            object Edit365: TEdit
              Left = 150
              Top = 30
              Width = 33
              Height = 21
              TabOrder = 2
              OnChange = ParamChange
            end
          end
          object GroupBox176: TGroupBox
            Left = 376
            Top = 340
            Width = 217
            Height = 55
            Caption = 'Phase 6'
            TabOrder = 2
            object CheckBox226: TCheckBox
              Left = 12
              Top = 14
              Width = 141
              Height = 17
              Caption = 'ddP Tip2      Koef NumP'
              TabOrder = 0
              OnClick = ParamChange
            end
            object Edit278: TEdit
              Left = 150
              Top = 10
              Width = 33
              Height = 21
              TabOrder = 1
              OnChange = ParamChange
            end
            object CheckBox224: TCheckBox
              Left = 12
              Top = 32
              Width = 133
              Height = 17
              Caption = 'End Tip2         High Mu '
              TabOrder = 2
              OnClick = ParamChange
            end
            object Edit317: TEdit
              Left = 150
              Top = 30
              Width = 33
              Height = 21
              TabOrder = 3
              OnChange = ParamChange
            end
          end
          object GroupBox183: TGroupBox
            Left = 376
            Top = 94
            Width = 217
            Height = 104
            Caption = #1050#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1103'  Ph3'
            TabOrder = 3
            object Label297: TLabel
              Left = 100
              Top = 34
              Width = 94
              Height = 13
              Caption = 'Slip  Exh               %'
            end
            object CheckBox182: TCheckBox
              Left = 10
              Top = 70
              Width = 205
              Height = 17
              Caption = 'ProMotion                                    km/h'
              TabOrder = 7
              OnClick = ParamChange
            end
            object CheckBox219: TCheckBox
              Left = 10
              Top = 32
              Width = 63
              Height = 17
              Caption = 'End Slip       '
              TabOrder = 1
              OnClick = ParamChange
            end
            object CheckBox184: TCheckBox
              Left = 10
              Top = 52
              Width = 199
              Height = 17
              Caption = 'End High Accel                           m/c2  '
              TabOrder = 0
              OnClick = ParamChange
            end
            object Edit304: TEdit
              Left = 150
              Top = 30
              Width = 33
              Height = 21
              TabOrder = 2
              OnChange = ParamChange
            end
            object Edit316: TEdit
              Left = 150
              Top = 50
              Width = 33
              Height = 21
              TabOrder = 3
              OnChange = ParamChange
            end
            object CheckBox287: TCheckBox
              Left = 10
              Top = 12
              Width = 199
              Height = 17
              Caption = 'Slip Optim                                     %'
              TabOrder = 4
              OnClick = ParamChange
            end
            object Edit321: TEdit
              Left = 150
              Top = 10
              Width = 33
              Height = 21
              TabOrder = 5
              OnChange = ParamChange
            end
            object Edit318: TEdit
              Left = 150
              Top = 70
              Width = 33
              Height = 21
              TabOrder = 6
              OnChange = ParamChange
            end
            object CheckBox142: TCheckBox
              Left = 10
              Top = 84
              Width = 73
              Height = 17
              Caption = 'ProM Front'
              TabOrder = 8
            end
          end
          object GroupBox184: TGroupBox
            Left = 4
            Top = 0
            Width = 277
            Height = 222
            Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1088#1077#1075#1091#1083#1080#1088#1086#1074#1072#1085#1080#1103
            TabOrder = 4
            object Label556: TLabel
              Left = 100
              Top = 14
              Width = 118
              Height = 13
              Caption = 'Speed  Min             km/h'
            end
            object Edit320: TEdit
              Left = 160
              Top = 10
              Width = 33
              Height = 21
              TabOrder = 0
              OnChange = ParamChange
            end
            object GroupBox196: TGroupBox
              Left = 8
              Top = 112
              Width = 261
              Height = 105
              Caption = 'Speed Thresh'
              TabOrder = 1
              object Label584: TLabel
                Left = 58
                Top = 16
                Width = 148
                Height = 13
                Caption = 'Const                                km/h'
              end
              object Label421: TLabel
                Left = 95
                Top = -2
                Width = 66
                Height = 13
                Caption = #1087#1077#1088#1077#1076'      '#1079#1072#1076
              end
              object Label578: TLabel
                Left = 40
                Top = 34
                Width = 169
                Height = 13
                Caption = '[dPpump]                                 km/h'
              end
              object GroupBox197: TGroupBox
                Left = 8
                Top = 50
                Width = 121
                Height = 49
                Caption = 'Brake Condition'
                TabOrder = 0
                object CheckBox160: TCheckBox
                  Left = 6
                  Top = 14
                  Width = 95
                  Height = 17
                  Caption = 'Not ABS Enable'
                  TabOrder = 0
                  OnClick = ParamChange
                end
                object CheckBox165: TCheckBox
                  Left = 6
                  Top = 30
                  Width = 111
                  Height = 17
                  Caption = 'Active ABS Enable'
                  TabOrder = 1
                  OnClick = ParamChange
                end
              end
              object Edit349: TEdit
                Left = 94
                Top = 12
                Width = 33
                Height = 21
                TabOrder = 1
                OnChange = ParamChange
              end
              object Edit350: TEdit
                Left = 144
                Top = 12
                Width = 33
                Height = 21
                TabOrder = 2
                OnChange = ParamChange
              end
              object Edit314: TEdit
                Left = 94
                Top = 32
                Width = 33
                Height = 21
                TabOrder = 3
                OnChange = ParamChange
              end
              object Edit348: TEdit
                Left = 144
                Top = 32
                Width = 33
                Height = 21
                TabOrder = 4
                OnChange = ParamChange
              end
              object GroupBox1103: TGroupBox
                Left = 134
                Top = 50
                Width = 120
                Height = 49
                Caption = 'AntiGAZ'
                TabOrder = 5
                object CheckBox173: TCheckBox
                  Left = 6
                  Top = 14
                  Width = 55
                  Height = 17
                  Caption = 'Enable                      '
                  TabOrder = 0
                end
                object CheckBox222: TCheckBox
                  Left = 6
                  Top = 30
                  Width = 108
                  Height = 17
                  Caption = 'Active ABS Enable'
                  TabOrder = 1
                  OnClick = ParamChange
                end
              end
            end
            object CheckBox164: TCheckBox
              Left = 10
              Top = 14
              Width = 85
              Height = 17
              Caption = 'ABS  Enable'
              TabOrder = 2
              OnClick = ParamChange
            end
            object GroupBox107: TGroupBox
              Left = 7
              Top = 30
              Width = 218
              Height = 83
              Caption = #1055#1086#1088#1086#1075#1080
              TabOrder = 3
              object Label531: TLabel
                Left = 38
                Top = 34
                Width = 159
                Height = 13
                Caption = 'Slip ABS On                               %'
              end
              object Label575: TLabel
                Left = 107
                Top = -2
                Width = 66
                Height = 13
                Caption = #1087#1077#1088#1077#1076'      '#1079#1072#1076
              end
              object Label527: TLabel
                Left = 30
                Top = 16
                Width = 183
                Height = 13
                Caption = 'Accel ABS On                              m/c2'
              end
              object Edit289: TEdit
                Left = 104
                Top = 32
                Width = 33
                Height = 21
                TabOrder = 0
                OnChange = ParamChange
              end
              object Edit290: TEdit
                Left = 152
                Top = 32
                Width = 33
                Height = 21
                TabOrder = 1
                OnChange = ParamChange
              end
              object Edit282: TEdit
                Left = 104
                Top = 12
                Width = 33
                Height = 21
                TabOrder = 2
                OnChange = ParamChange
              end
              object Edit288: TEdit
                Left = 152
                Top = 12
                Width = 33
                Height = 21
                TabOrder = 3
                OnChange = ParamChange
              end
              object CheckBox221: TCheckBox
                Left = 6
                Top = 50
                Width = 147
                Height = 17
                Caption = 'SlipThr Change         Koef'
                TabOrder = 4
                OnClick = ParamChange
              end
              object Edit319: TEdit
                Left = 152
                Top = 52
                Width = 33
                Height = 21
                TabOrder = 5
                OnChange = ParamChange
              end
              object CheckBox223: TCheckBox
                Left = 6
                Top = 64
                Width = 95
                Height = 17
                Caption = 'Slip Dec_Change'
                TabOrder = 6
                OnClick = ParamChange
              end
            end
          end
          object GroupBox182: TGroupBox
            Left = 352
            Top = 0
            Width = 241
            Height = 95
            Caption = #1050#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1103'  Ph1'
            TabOrder = 5
            object CheckBox217: TCheckBox
              Left = 135
              Top = 14
              Width = 104
              Height = 17
              Caption = 'TAI Exh3  Enable'
              TabOrder = 0
              OnClick = ParamChange
            end
            object CheckBox181: TCheckBox
              Left = 10
              Top = 14
              Width = 117
              Height = 17
              Caption = 'Time dExh1  Enable'
              TabOrder = 1
              OnClick = ParamChange
            end
            object GroupBox189: TGroupBox
              Left = 8
              Top = 30
              Width = 227
              Height = 59
              Caption = #1059#1082#1086#1088#1072#1095#1080#1074#1072#1085#1080#1077' '#1074#1099#1087#1091#1089#1082#1072
              TabOrder = 2
              object Label559: TLabel
                Left = 82
                Top = 34
                Width = 143
                Height = 13
                Caption = #1047#1072#1076#1077#1088#1078#1082#1072'                          '#1084#1089
              end
              object Label568: TLabel
                Left = 138
                Top = -2
                Width = 66
                Height = 13
                Caption = #1087#1077#1088#1077#1076'      '#1079#1072#1076
              end
              object CheckBox161: TCheckBox
                Left = 6
                Top = 16
                Width = 124
                Height = 17
                Caption = 'Enable                 Koef '
                TabOrder = 0
                OnClick = ParamChange
              end
              object Edit325: TEdit
                Left = 136
                Top = 12
                Width = 33
                Height = 21
                TabOrder = 1
                OnChange = ParamChange
              end
              object Edit323: TEdit
                Left = 136
                Top = 32
                Width = 33
                Height = 21
                TabOrder = 2
                OnChange = ParamChange
              end
              object Edit337: TEdit
                Left = 178
                Top = 12
                Width = 33
                Height = 21
                TabOrder = 3
                OnChange = ParamChange
              end
              object Edit338: TEdit
                Left = 178
                Top = 32
                Width = 33
                Height = 21
                TabOrder = 4
                OnChange = ParamChange
              end
              object CheckBox214: TCheckBox
                Left = 6
                Top = 32
                Width = 75
                Height = 17
                Caption = 'Ais Enable'
                TabOrder = 5
                OnClick = ParamChange
              end
            end
          end
          object GroupBox162: TGroupBox
            Left = 4
            Top = 236
            Width = 205
            Height = 158
            Caption = 'MIR Front'
            TabOrder = 6
            object GroupBox163: TGroupBox
              Left = 8
              Top = 92
              Width = 190
              Height = 60
              Caption = #1047#1072#1074#1080#1089#1080#1084#1086#1089#1090#1100' dP'
              TabOrder = 0
              object Label529: TLabel
                Left = 4
                Top = 40
                Width = 54
                Height = 13
                Caption = 'Koef  dP(T)'
              end
              object Label532: TLabel
                Left = 8
                Top = 17
                Width = 176
                Height = 13
                Caption = 'dP0       FL                   FR            atm'
              end
              object Label557: TLabel
                Left = 100
                Top = 40
                Width = 85
                Height = 13
                Caption = 'dPmax            atm'
              end
              object Edit285: TEdit
                Left = 62
                Top = 34
                Width = 33
                Height = 21
                TabOrder = 1
                Text = ' '
                OnChange = ParamChange
              end
              object Edit284: TEdit
                Left = 134
                Top = 14
                Width = 33
                Height = 21
                TabOrder = 0
                OnChange = ParamChange
              end
              object Edit286: TEdit
                Left = 62
                Top = 14
                Width = 33
                Height = 21
                TabOrder = 2
                OnChange = ParamChange
              end
              object Edit327: TEdit
                Left = 134
                Top = 34
                Width = 33
                Height = 21
                TabOrder = 3
                OnChange = ParamChange
              end
            end
            object CheckBox167: TCheckBox
              Left = 10
              Top = 14
              Width = 77
              Height = 17
              Caption = 'MIR Disable'
              TabOrder = 1
              OnClick = ParamChange
            end
            object CheckBox216: TCheckBox
              Left = 10
              Top = 29
              Width = 95
              Height = 17
              Caption = 'MIR always'
              TabOrder = 2
              OnClick = CheckBox140Click
            end
            object CheckBox225: TCheckBox
              Left = 10
              Top = 77
              Width = 95
              Height = 17
              Caption = 'ExhM Ph3 only'
              TabOrder = 3
              OnClick = CheckBox140Click
            end
            object CheckBox220: TCheckBox
              Left = 10
              Top = 45
              Width = 191
              Height = 17
              Caption = 'Yaw Check                             deg/s'
              TabOrder = 4
              OnClick = ParamChange
            end
            object CheckBox112: TCheckBox
              Left = 10
              Top = 62
              Width = 127
              Height = 17
              Caption = 'Relation Press          K'
              TabOrder = 5
              OnClick = ParamChange
            end
            object Edit326: TEdit
              Left = 138
              Top = 40
              Width = 33
              Height = 21
              TabOrder = 6
            end
            object Edit322: TEdit
              Left = 138
              Top = 60
              Width = 33
              Height = 21
              TabOrder = 7
              OnChange = ParamChange
            end
          end
          object GroupBox167: TGroupBox
            Left = 215
            Top = 320
            Width = 149
            Height = 73
            Caption = #1050#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1103
            TabOrder = 7
            object CheckBox298: TCheckBox
              Left = 8
              Top = 16
              Width = 129
              Height = 17
              Caption = 'ABS OffRoad Enable'
              TabOrder = 0
              OnClick = ParamChange
            end
            object CheckBox303: TCheckBox
              Left = 8
              Top = 32
              Width = 121
              Height = 17
              Caption = 'ABS Rear Ph3 Drag'
              TabOrder = 1
              OnClick = ParamChange
            end
            object CheckBox230: TCheckBox
              Left = 8
              Top = 48
              Width = 117
              Height = 17
              Caption = 'ABS Disable AxFail'
              TabOrder = 2
              OnClick = ParamChange
            end
          end
        end
        object TabSheet18: TTabSheet
          Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' ESP'
          ImageIndex = 6
          object PageControl4: TPageControl
            Left = 0
            Top = -3
            Width = 603
            Height = 399
            ActivePage = TabSheet20
            TabOrder = 0
            OnChange = PageControl4Change
            OnEnter = PageControl4Change
            object TabSheet19: TTabSheet
              Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '
              object GroupBox53: TGroupBox
                Left = 0
                Top = -2
                Width = 201
                Height = 371
                Caption = #1050#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1103' '
                TabOrder = 0
                OnClick = ParamChange
                object CheckBox63: TCheckBox
                  Left = 8
                  Top = 220
                  Width = 169
                  Height = 17
                  Caption = 'ESP Stop Light  '#1072#1082#1090#1080#1074#1080#1088#1091#1077#1090#1089#1103
                  TabOrder = 0
                  OnClick = ParamChange
                end
                object CheckBox82: TCheckBox
                  Left = 8
                  Top = 30
                  Width = 145
                  Height = 17
                  Caption = #1057#1077#1085#1089#1086#1088' SAS '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085
                  TabOrder = 1
                  OnClick = ParamChange
                end
                object CheckBox83: TCheckBox
                  Left = 8
                  Top = 46
                  Width = 169
                  Height = 17
                  Caption = #1044#1072#1090#1095#1080#1082' '#1076#1072#1074#1083#1077#1085#1080#1103' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085
                  TabOrder = 2
                  OnClick = ParamChange
                end
                object CheckBox85: TCheckBox
                  Left = 8
                  Top = 14
                  Width = 185
                  Height = 17
                  Caption = #1050#1086#1085#1090#1088#1086#1083#1077#1088' VDC '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085
                  TabOrder = 3
                  OnClick = ParamChange
                end
                object CheckBox256: TCheckBox
                  Left = 8
                  Top = 206
                  Width = 185
                  Height = 17
                  Caption = 'Emergency Brake '#1072#1082#1090#1080#1074#1080#1088#1091#1077#1090#1089#1103
                  TabOrder = 4
                  OnClick = ParamChange
                end
                object GroupBox98: TGroupBox
                  Left = 8
                  Top = 114
                  Width = 185
                  Height = 49
                  Caption = #1044#1080#1092'. '#1050#1083#1072#1087#1072#1085' '
                  TabOrder = 5
                  object CheckBox66: TCheckBox
                    Left = 8
                    Top = 14
                    Width = 161
                    Height = 17
                    Caption = #1055#1077#1088#1077#1076#1085#1077#1081' '#1086#1089#1080' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085
                    TabOrder = 0
                    OnClick = ParamChange
                  end
                  object CheckBox33: TCheckBox
                    Left = 8
                    Top = 30
                    Width = 153
                    Height = 17
                    Caption = #1047#1072#1076#1085#1077#1081' '#1086#1089#1080' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085
                    TabOrder = 1
                    OnClick = ParamChange
                  end
                end
                object GroupBox148: TGroupBox
                  Left = 8
                  Top = 64
                  Width = 185
                  Height = 49
                  Caption = #1057#1077#1085#1089#1086#1088' AGS'
                  TabOrder = 6
                  object CheckBox54: TCheckBox
                    Left = 8
                    Top = 14
                    Width = 145
                    Height = 17
                    Caption = #1059#1089#1090#1072#1085#1086#1074#1083#1077#1085
                    TabOrder = 0
                    OnClick = ParamChange
                  end
                  object CheckBox299: TCheckBox
                    Left = 8
                    Top = 30
                    Width = 145
                    Height = 17
                    Caption = #1056#1072#1079#1098#1077#1084' '#1085#1072#1079#1072#1076
                    Color = clBtnFace
                    ParentColor = False
                    TabOrder = 1
                    OnClick = CheckBox140Click
                  end
                end
                object CheckBox119: TCheckBox
                  Left = 10
                  Top = 254
                  Width = 167
                  Height = 17
                  Caption = #1058#1072#1093#1086#1075#1088#1072#1092' TCO  '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085
                  TabOrder = 7
                  OnClick = ParamChange
                end
              end
              object GroupBox54: TGroupBox
                Left = 402
                Top = -2
                Width = 190
                Height = 371
                Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1072#1074#1090#1086#1084#1086#1073#1080#1083#1103
                TabOrder = 1
                object Label225: TLabel
                  Left = 4
                  Top = 20
                  Width = 132
                  Height = 13
                  Caption = #1055#1077#1088#1077#1076#1072#1090#1086#1095#1085#1086#1077' '#1095#1080#1089#1083#1086' Steer'
                end
                object Label226: TLabel
                  Left = 4
                  Top = 57
                  Width = 121
                  Height = 13
                  Caption = #1041#1072#1079#1072' '#1072#1074#1090#1086#1084#1086#1073#1080#1083#1103'  L,   '#1084
                end
                object Label245: TLabel
                  Left = 5
                  Top = 99
                  Width = 122
                  Height = 13
                  Caption = #1055#1077#1088#1077#1076#1085#1103#1103' '#1082#1086#1083#1077#1103'    Tf,  '#1084
                end
                object Label475: TLabel
                  Left = 4
                  Top = 38
                  Width = 134
                  Height = 13
                  Caption = #1050#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090' '#1090#1088#1072#1087#1077#1094#1080#1080', %'
                end
                object Label387: TLabel
                  Left = 5
                  Top = 162
                  Width = 124
                  Height = 13
                  Caption = #1057#1085#1072#1088#1103#1078#1077#1085#1085#1072#1103' '#1084#1072#1089#1089#1072',  '#1082#1075
                end
                object Label419: TLabel
                  Left = 5
                  Top = 181
                  Width = 122
                  Height = 13
                  Caption = #1053#1072#1075#1088#1091#1079#1082#1072' '#1086#1089#1080' '#1087#1077#1088#1077#1076',  '#1082#1075
                end
                object Label420: TLabel
                  Left = 4
                  Top = 200
                  Width = 107
                  Height = 13
                  Caption = #1053#1072#1075#1088#1091#1079#1082#1072' '#1086#1089#1080' '#1079#1072#1076', '#1082#1075
                end
                object Label418: TLabel
                  Left = 4
                  Top = 219
                  Width = 140
                  Height = 13
                  Caption = #1052#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1085#1072#1075#1088#1091#1079#1082#1072' '#1082#1075
                end
                object Label234: TLabel
                  Left = 11
                  Top = 120
                  Width = 115
                  Height = 13
                  Caption = ' '#1062#1077#1085#1090#1088' '#1089#1094#1077#1087#1082#1080'       A, '#1084
                end
                object Label429: TLabel
                  Left = 12
                  Top = 238
                  Width = 130
                  Height = 13
                  Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1079#1072#1076#1085#1080#1093' '#1086#1089#1077#1081'  '
                end
                object Label535: TLabel
                  Left = 4
                  Top = 78
                  Width = 124
                  Height = 13
                  Caption = #1041#1072#1079#1072' '#1087#1086#1074#1086#1088#1086#1090#1072'   L'#1086#39#1086',   '#1084
                end
                object Label530: TLabel
                  Left = 12
                  Top = 258
                  Width = 119
                  Height = 13
                  Caption = #1052#1072#1089#1089#1072' '#1079#1072#1076#1085#1077#1081' '#1086#1089#1080',  '#1082#1075'  '
                end
                object Label561: TLabel
                  Left = 5
                  Top = 140
                  Width = 133
                  Height = 13
                  Caption = #1042#1099#1089#1086#1090#1072' '#1094#1077#1085#1090#1088#1072' '#1084#1072#1089#1089'  H, '#1084
                end
                object Edit48: TEdit
                  Left = 144
                  Top = 16
                  Width = 38
                  Height = 21
                  TabOrder = 0
                  Text = '23,55'
                  OnChange = ParamChange
                end
                object Edit49: TEdit
                  Left = 144
                  Top = 55
                  Width = 38
                  Height = 21
                  TabOrder = 1
                  Text = '4,49'
                  OnChange = ParamChange
                end
                object Edit73: TEdit
                  Left = 144
                  Top = 95
                  Width = 38
                  Height = 21
                  TabOrder = 2
                  Text = '2,00'
                  OnChange = ParamChange
                end
                object Edit226: TEdit
                  Left = 144
                  Top = 35
                  Width = 38
                  Height = 21
                  TabOrder = 3
                  Text = '13,5'
                  OnChange = ParamChange
                end
                object Edit154: TEdit
                  Left = 144
                  Top = 158
                  Width = 38
                  Height = 21
                  TabOrder = 4
                  OnChange = ParamChange
                end
                object Edit169: TEdit
                  Left = 144
                  Top = 179
                  Width = 38
                  Height = 21
                  TabOrder = 5
                  Text = '5090'
                  OnChange = ParamChange
                end
                object Edit170: TEdit
                  Left = 144
                  Top = 198
                  Width = 38
                  Height = 21
                  TabOrder = 6
                  Text = '2570'
                  OnChange = ParamChange
                end
                object Edit168: TEdit
                  Left = 144
                  Top = 217
                  Width = 38
                  Height = 21
                  TabOrder = 7
                  Text = '11500'
                  OnChange = ParamChange
                end
                object Edit53: TEdit
                  Left = 144
                  Top = 116
                  Width = 38
                  Height = 21
                  TabOrder = 8
                  Text = '2,8'
                  OnChange = ParamChange
                end
                object Edit178: TEdit
                  Left = 144
                  Top = 236
                  Width = 38
                  Height = 21
                  TabOrder = 9
                  Text = '1'
                  OnChange = ParamChange
                end
                object Edit293: TEdit
                  Left = 144
                  Top = 75
                  Width = 38
                  Height = 21
                  TabOrder = 10
                  Text = '4,49'
                  OnChange = ParamChange
                end
                object Edit328: TEdit
                  Left = 144
                  Top = 255
                  Width = 38
                  Height = 21
                  TabOrder = 11
                  Text = '1'
                  OnChange = ParamChange
                end
                object Edit330: TEdit
                  Left = 144
                  Top = 136
                  Width = 38
                  Height = 21
                  TabOrder = 12
                  Text = '2,8'
                  OnChange = ParamChange
                end
                object CheckBox293: TCheckBox
                  Left = 8
                  Top = 324
                  Width = 145
                  Height = 17
                  Caption = 'GearBox Automatic'
                  TabOrder = 13
                  OnClick = CheckBox140Click
                end
                object GroupBox239: TGroupBox
                  Left = 4
                  Top = 276
                  Width = 182
                  Height = 40
                  Caption = #1055#1086#1076#1074#1077#1089#1082#1072' '#1079#1072#1076#1085#1077#1081' '#1086#1089#1080
                  TabOrder = 14
                  object Label364: TLabel
                    Left = 118
                    Top = 15
                    Width = 22
                    Height = 13
                    Caption = #1058#1080#1087' '
                    Visible = False
                  end
                  object CheckBox131: TCheckBox
                    Left = 6
                    Top = 14
                    Width = 113
                    Height = 17
                    Caption = #1055#1085#1077#1074#1084#1086' '#1087#1086#1076#1074#1077#1089#1082#1072
                    TabOrder = 0
                    OnClick = CheckBox140Click
                  end
                  object Edit405: TEdit
                    Left = 141
                    Top = 12
                    Width = 37
                    Height = 21
                    TabOrder = 1
                    Text = '1'
                    Visible = False
                    OnChange = ParamChange
                  end
                end
              end
              object GroupBox66: TGroupBox
                Left = 208
                Top = -2
                Width = 180
                Height = 93
                Caption = #1055#1085#1077#1074#1084#1072#1090#1080#1082'a'
                TabOrder = 2
                object GroupBox207: TGroupBox
                  Left = 6
                  Top = 50
                  Width = 168
                  Height = 37
                  Caption = #1047#1072#1076#1085#1103#1103' '#1086#1089#1100
                  TabOrder = 0
                  object Label477: TLabel
                    Left = 105
                    Top = 16
                    Width = 19
                    Height = 13
                    Caption = #1058#1080#1087
                  end
                  object CheckBox233: TCheckBox
                    Left = 8
                    Top = 15
                    Width = 62
                    Height = 17
                    Caption = #1041#1072#1088#1072#1073#1072#1085
                    TabOrder = 0
                    OnClick = CheckBox140Click
                  end
                  object Edit270: TEdit
                    Left = 126
                    Top = 12
                    Width = 33
                    Height = 21
                    TabOrder = 1
                    OnChange = ParamChange
                  end
                end
                object GroupBox208: TGroupBox
                  Left = 6
                  Top = 14
                  Width = 168
                  Height = 37
                  Caption = #1055#1077#1088#1077#1076#1085#1103#1103' '#1086#1089#1100
                  TabOrder = 1
                  object Label582: TLabel
                    Left = 105
                    Top = 16
                    Width = 19
                    Height = 13
                    Caption = #1058#1080#1087
                  end
                  object Label452: TLabel
                    Left = 115
                    Top = -2
                    Width = 39
                    Height = 13
                    Caption = #1050#1072#1084#1077#1088#1072
                  end
                  object Edit269: TEdit
                    Left = 126
                    Top = 12
                    Width = 33
                    Height = 21
                    TabOrder = 0
                    OnChange = ParamChange
                  end
                  object CheckBox232: TCheckBox
                    Left = 8
                    Top = 14
                    Width = 62
                    Height = 17
                    Caption = #1041#1072#1088#1072#1073#1072#1085
                    TabOrder = 1
                    OnClick = CheckBox140Click
                  end
                end
              end
              object GroupBox200: TGroupBox
                Left = 208
                Top = 92
                Width = 180
                Height = 120
                Caption = #1055#1088#1080#1094#1077#1087
                TabOrder = 3
                object CheckBox84: TCheckBox
                  Left = 6
                  Top = 12
                  Width = 155
                  Height = 17
                  Caption = 'CAN '#1087#1088#1080#1094#1077#1087#1072' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085
                  TabOrder = 0
                  OnClick = ParamChange
                end
                object CheckBox127: TCheckBox
                  Left = 6
                  Top = 40
                  Width = 169
                  Height = 17
                  Caption = #1051#1072#1084#1087#1072' '#1055#1088#1080#1094#1077#1087#1072' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1072
                  TabOrder = 1
                  OnClick = ParamChange
                end
                object RadioGroup9: TRadioGroup
                  Left = 7
                  Top = 55
                  Width = 166
                  Height = 58
                  Caption = #1050#1086#1085#1090#1088#1086#1083#1100' '#1076#1072#1074#1083#1077#1085#1080#1103' '#1087#1088#1080#1094#1077#1087#1072
                  Items.Strings = (
                    #1052#1086#1076#1091#1083#1103#1090#1086#1088
                    #1044#1080#1092'.'#1082#1083#1072#1087#1072#1085
                    #1053#1077#1090)
                  TabOrder = 2
                  OnClick = ParamChange
                end
                object CheckBox231: TCheckBox
                  Left = 6
                  Top = 26
                  Width = 171
                  Height = 17
                  Caption = #1044#1072#1090#1095#1080#1082' '#1076#1072#1074#1083#1077#1085#1080#1103' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085
                  TabOrder = 3
                end
              end
              object grp8: TGroupBox
                Left = 206
                Top = 264
                Width = 192
                Height = 105
                Caption = #1056#1077#1075#1091#1083#1080#1088#1086#1074#1072#1085#1080#1077
                TabOrder = 4
                object CheckBox59: TCheckBox
                  Left = 4
                  Top = 64
                  Width = 185
                  Height = 17
                  Caption = 'Yaw Control '#1090#1086#1088#1084#1086#1079#1072#1084#1080' '#1074#1082#1083#1102#1095#1077#1085
                  TabOrder = 0
                  OnClick = ParamChange
                end
                object CheckBox60: TCheckBox
                  Left = 4
                  Top = 48
                  Width = 185
                  Height = 17
                  Caption = 'Yaw Control '#1076#1074#1080#1075#1072#1090#1077#1083#1077#1084' '#1074#1082#1083#1102#1095#1077#1085
                  TabOrder = 1
                  OnClick = ParamChange
                end
                object CheckBox61: TCheckBox
                  Left = 4
                  Top = 32
                  Width = 145
                  Height = 17
                  Caption = 'Roll Control '#1074#1082#1083#1102#1095#1077#1085
                  TabOrder = 2
                  OnClick = ParamChange
                end
                object CheckBox62: TCheckBox
                  Left = 4
                  Top = 80
                  Width = 185
                  Height = 17
                  Caption = 'SideSleep Control '#1074#1082#1083#1102#1095#1077#1085
                  TabOrder = 3
                  OnClick = ParamChange
                end
                object CheckBox55: TCheckBox
                  Left = 4
                  Top = 16
                  Width = 153
                  Height = 17
                  Caption = #1056#1077#1078#1080#1084' ESP '#1074#1082#1083#1102#1095#1077#1085
                  TabOrder = 4
                  OnClick = ParamChange
                end
              end
            end
            object TabSheet20: TTabSheet
              Caption = 'Roll Over Protection   ROP'
              ImageIndex = 1
              object GroupBox77: TGroupBox
                Left = 4
                Top = 0
                Width = 298
                Height = 137
                Caption = #1055#1086#1088#1086#1075#1080
                TabOrder = 0
                object Label295: TLabel
                  Left = 6
                  Top = 15
                  Width = 147
                  Height = 13
                  Caption = 'Ay BrakeON                     m/c2'
                end
                object Label233: TLabel
                  Left = 7
                  Top = 34
                  Width = 145
                  Height = 13
                  Caption = 'Ax Desire                         m/c2'
                end
                object Label318: TLabel
                  Left = 34
                  Top = 113
                  Width = 120
                  Height = 13
                  Caption = 'Speed ON               km/h'
                end
                object Label320: TLabel
                  Left = 4
                  Top = 74
                  Width = 148
                  Height = 13
                  Caption = 'Vx R20m Empty                km/h'
                end
                object Label307: TLabel
                  Left = 4
                  Top = 94
                  Width = 149
                  Height = 13
                  Caption = 'Vx R20m Laden                km/h'
                end
                object Label473: TLabel
                  Left = 6
                  Top = 52
                  Width = 146
                  Height = 13
                  Caption = 'Delta Ay                           m/c2'
                end
                object Edit98: TEdit
                  Left = 90
                  Top = 12
                  Width = 33
                  Height = 21
                  TabOrder = 0
                  Text = '3,5'
                  OnChange = ParamChange
                end
                object Edit80: TEdit
                  Left = 90
                  Top = 32
                  Width = 33
                  Height = 21
                  TabOrder = 1
                  Text = '3,0'
                  OnChange = ParamChange
                end
                object Edit110: TEdit
                  Left = 90
                  Top = 72
                  Width = 33
                  Height = 21
                  TabOrder = 2
                  Text = '0,5'
                  OnChange = ParamChange
                end
                object Edit122: TEdit
                  Left = 90
                  Top = 112
                  Width = 33
                  Height = 21
                  TabOrder = 3
                  Text = '27'
                  OnChange = ParamChange
                end
                object Edit107: TEdit
                  Left = 90
                  Top = 92
                  Width = 33
                  Height = 21
                  TabOrder = 4
                  Text = '5,5'
                  OnChange = ParamChange
                end
                object Edit222: TEdit
                  Left = 90
                  Top = 50
                  Width = 33
                  Height = 21
                  TabOrder = 5
                  Text = '3,5'
                  OnChange = ParamChange
                end
                object GroupBox170: TGroupBox
                  Left = 162
                  Top = 13
                  Width = 128
                  Height = 116
                  Caption = 'Expert'
                  TabOrder = 6
                  object Label317: TLabel
                    Left = 15
                    Top = 16
                    Width = 110
                    Height = 13
                    Caption = 'dVx  Ph3              km/h'
                  end
                  object Edit120: TEdit
                    Left = 64
                    Top = 12
                    Width = 34
                    Height = 21
                    TabOrder = 0
                    Text = ' '
                    OnChange = ParamChange
                  end
                  object GroupBox127: TGroupBox
                    Left = 8
                    Top = 32
                    Width = 113
                    Height = 76
                    Caption = 'Thr ON'
                    TabOrder = 1
                    object Label271: TLabel
                      Left = 15
                      Top = 16
                      Width = 26
                      Height = 13
                      Caption = 'K_Sp'
                    end
                    object Label227: TLabel
                      Left = 15
                      Top = 34
                      Width = 31
                      Height = 13
                      Caption = 'K_dAy'
                    end
                    object Label294: TLabel
                      Left = 16
                      Top = 52
                      Width = 33
                      Height = 13
                      Caption = 'K_load'
                    end
                    object Edit79: TEdit
                      Left = 56
                      Top = 12
                      Width = 33
                      Height = 21
                      TabOrder = 0
                      OnChange = ParamChange
                    end
                    object Edit51: TEdit
                      Left = 56
                      Top = 34
                      Width = 33
                      Height = 21
                      TabOrder = 1
                      OnChange = ParamChange
                    end
                    object Edit65: TEdit
                      Left = 56
                      Top = 50
                      Width = 33
                      Height = 21
                      TabOrder = 2
                      Text = '150'
                      OnChange = ParamChange
                    end
                  end
                end
              end
              object GroupBox81: TGroupBox
                Left = 4
                Top = 138
                Width = 298
                Height = 151
                Caption = #1056#1077#1075#1091#1083#1080#1088#1086#1074#1072#1085#1080#1077' '#1076#1074#1080#1075#1072#1090#1077#1083#1103
                TabOrder = 1
                object Label296: TLabel
                  Left = 4
                  Top = 20
                  Width = 113
                  Height = 13
                  Caption = 'dAy_ON                m/c2'
                end
                object Label323: TLabel
                  Left = 4
                  Top = 38
                  Width = 114
                  Height = 13
                  Caption = 'dAy_OFF               m/c2'
                end
                object Edit99: TEdit
                  Left = 56
                  Top = 16
                  Width = 33
                  Height = 21
                  TabOrder = 0
                  Text = '0,3'
                  OnChange = ParamChange
                end
                object Edit124: TEdit
                  Left = 56
                  Top = 35
                  Width = 34
                  Height = 21
                  TabOrder = 1
                  Text = '0,8'
                  OnChange = ParamChange
                end
                object CheckBox117: TCheckBox
                  Left = 7
                  Top = 74
                  Width = 234
                  Height = 17
                  Caption = #1050#1086#1085#1090#1088#1086#1083#1100' '#1076#1074#1080#1075#1072#1090#1077#1083#1103' '#1087#1088#1080' ROP '#1087#1088#1080#1094#1077#1087#1072
                  TabOrder = 2
                  OnClick = ParamChange
                end
                object CheckBox137: TCheckBox
                  Left = 136
                  Top = 36
                  Width = 129
                  Height = 17
                  Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1087#1086#1088#1086#1075#1072
                  TabOrder = 3
                end
                object CheckBox174: TCheckBox
                  Left = 7
                  Top = 58
                  Width = 234
                  Height = 17
                  Caption = #1050#1086#1085#1090#1088#1086#1083#1100' '#1086#1073#1086#1088#1086#1090#1086#1074
                  TabOrder = 4
                  OnClick = CheckBox140Click
                end
                object GroupBox171: TGroupBox
                  Left = 8
                  Top = 92
                  Width = 273
                  Height = 53
                  Caption = 'Expert'
                  TabOrder = 5
                  object Label316: TLabel
                    Left = 22
                    Top = 30
                    Width = 101
                    Height = 13
                    Caption = 'Torque Min             %'
                  end
                  object Label314: TLabel
                    Left = 38
                    Top = 12
                    Width = 88
                    Height = 13
                    Caption = 'K Driver              %'
                  end
                  object Label466: TLabel
                    Left = 166
                    Top = 12
                    Width = 34
                    Height = 13
                    Caption = 'Thr Int '
                  end
                  object Edit119: TEdit
                    Left = 80
                    Top = 28
                    Width = 34
                    Height = 21
                    TabOrder = 0
                    Text = ' '
                    OnChange = ParamChange
                  end
                  object Edit117: TEdit
                    Left = 80
                    Top = 8
                    Width = 34
                    Height = 21
                    TabOrder = 1
                    Text = ' '
                    OnChange = ParamChange
                  end
                  object Edit118: TEdit
                    Left = 200
                    Top = 8
                    Width = 34
                    Height = 21
                    TabOrder = 2
                    Text = ' '
                    OnChange = ParamChange
                  end
                end
              end
              object GroupBox128: TGroupBox
                Left = 306
                Top = 0
                Width = 286
                Height = 370
                Caption = #1056#1077#1075#1091#1083#1080#1088#1086#1074#1072#1085#1080#1077' '#1076#1072#1074#1083#1077#1085#1080#1103
                TabOrder = 2
                object GroupBox79: TGroupBox
                  Left = 8
                  Top = 14
                  Width = 270
                  Height = 205
                  Caption = #1058#1103#1075#1072#1095
                  TabOrder = 0
                  object Label236: TLabel
                    Left = 110
                    Top = 58
                    Width = 143
                    Height = 13
                    Caption = 'dPpump                             atm'
                  end
                  object Label300: TLabel
                    Left = 130
                    Top = 18
                    Width = 123
                    Height = 13
                    Caption = 'Po                               atm'
                  end
                  object Label302: TLabel
                    Left = 110
                    Top = 78
                    Width = 143
                    Height = 13
                    Caption = 'dPexh                                atm'
                  end
                  object Label301: TLabel
                    Left = 152
                    Top = 0
                    Width = 72
                    Height = 13
                    Caption = #1055#1077#1088#1077#1076'       '#1047#1072#1076
                  end
                  object Label428: TLabel
                    Left = 114
                    Top = 38
                    Width = 139
                    Height = 13
                    Caption = 'P max                               atm'
                  end
                  object Edit70: TEdit
                    Left = 152
                    Top = 56
                    Width = 33
                    Height = 21
                    TabOrder = 0
                    OnChange = ParamChange
                  end
                  object Edit64: TEdit
                    Left = 200
                    Top = 56
                    Width = 33
                    Height = 21
                    TabOrder = 1
                    OnChange = ParamChange
                  end
                  object Edit57: TEdit
                    Left = 200
                    Top = 76
                    Width = 34
                    Height = 21
                    TabOrder = 2
                    OnChange = ParamChange
                  end
                  object Edit55: TEdit
                    Left = 200
                    Top = 16
                    Width = 33
                    Height = 21
                    TabOrder = 3
                    Text = ' '
                    OnChange = ParamChange
                  end
                  object Edit52: TEdit
                    Left = 152
                    Top = 16
                    Width = 33
                    Height = 21
                    TabOrder = 4
                    OnChange = ParamChange
                  end
                  object Edit101: TEdit
                    Left = 152
                    Top = 76
                    Width = 34
                    Height = 21
                    TabOrder = 5
                    Text = ' '
                    OnChange = ParamChange
                  end
                  object Edit176: TEdit
                    Left = 152
                    Top = 36
                    Width = 33
                    Height = 21
                    TabOrder = 6
                    OnChange = ParamChange
                  end
                  object Edit177: TEdit
                    Left = 200
                    Top = 36
                    Width = 33
                    Height = 21
                    TabOrder = 7
                    Text = ' '
                    OnChange = ParamChange
                  end
                  object GroupBox168: TGroupBox
                    Left = 7
                    Top = 96
                    Width = 254
                    Height = 102
                    Caption = 'Expert'
                    TabOrder = 8
                    object Label490: TLabel
                      Left = 144
                      Top = 0
                      Width = 72
                      Height = 13
                      Caption = #1055#1077#1088#1077#1076'       '#1047#1072#1076
                    end
                    object Label446: TLabel
                      Left = 126
                      Top = 16
                      Width = 13
                      Height = 13
                      Caption = 'K1'
                    end
                    object Label470: TLabel
                      Left = 132
                      Top = 61
                      Width = 54
                      Height = 13
                      Caption = 'K Pmax(Vx)'
                    end
                    object Label365: TLabel
                      Left = 8
                      Top = 60
                      Width = 88
                      Height = 13
                      Caption = 'SleepN               %'
                    end
                    object Label309: TLabel
                      Left = 12
                      Top = 82
                      Width = 84
                      Height = 13
                      Caption = 'Tcut                mc'
                    end
                    object Label312: TLabel
                      Left = 142
                      Top = 82
                      Width = 93
                      Height = 13
                      Caption = 'K Ph3exh             %'
                    end
                    object Edit190: TEdit
                      Left = 144
                      Top = 14
                      Width = 34
                      Height = 21
                      TabOrder = 0
                      Text = ' '
                      OnChange = ParamChange
                    end
                    object Edit191: TEdit
                      Left = 192
                      Top = 14
                      Width = 34
                      Height = 21
                      TabOrder = 1
                      Text = ' '
                      OnChange = ParamChange
                    end
                    object Edit165: TEdit
                      Left = 192
                      Top = 58
                      Width = 33
                      Height = 21
                      TabOrder = 2
                      Text = '10'
                      OnChange = ParamChange
                    end
                    object CheckBox154: TCheckBox
                      Left = 10
                      Top = 37
                      Width = 231
                      Height = 17
                      Caption = 'Ph1 Enable Sleep                                      %'
                      TabOrder = 3
                      OnClick = ParamChange
                    end
                    object Edit56: TEdit
                      Left = 144
                      Top = 34
                      Width = 34
                      Height = 21
                      TabOrder = 4
                      Text = '7,5'
                      OnChange = ParamChange
                    end
                    object Edit58: TEdit
                      Left = 192
                      Top = 34
                      Width = 34
                      Height = 21
                      TabOrder = 5
                      Text = '7,5'
                      OnChange = ParamChange
                    end
                    object Edit143: TEdit
                      Left = 48
                      Top = 56
                      Width = 34
                      Height = 21
                      TabOrder = 6
                      Text = '10,0'
                      OnChange = ParamChange
                    end
                    object Edit108: TEdit
                      Left = 48
                      Top = 78
                      Width = 34
                      Height = 21
                      TabOrder = 7
                      Text = ' '
                      OnChange = ParamChange
                    end
                    object Edit109: TEdit
                      Left = 192
                      Top = 78
                      Width = 34
                      Height = 21
                      TabOrder = 8
                      Text = ' '
                      OnChange = ParamChange
                    end
                    object CheckBox136: TCheckBox
                      Left = 10
                      Top = 16
                      Width = 106
                      Height = 17
                      Caption = 'Press (Load_K1)'
                      TabOrder = 9
                      OnClick = CheckBox140Click
                    end
                  end
                end
                object GroupBox80: TGroupBox
                  Left = 8
                  Top = 220
                  Width = 270
                  Height = 144
                  Caption = #1055#1088#1080#1094#1077#1087
                  TabOrder = 1
                  object Label363: TLabel
                    Left = 134
                    Top = 14
                    Width = 121
                    Height = 13
                    Caption = 'Press Desire               atm'
                  end
                  object Label366: TLabel
                    Left = 134
                    Top = 34
                    Width = 122
                    Height = 13
                    Caption = 'Delta Press                 atm'
                  end
                  object CheckBox70: TCheckBox
                    Left = 7
                    Top = 14
                    Width = 122
                    Height = 17
                    Caption = #1050#1086#1085#1090#1088#1086#1083#1100' '#1076#1072#1074#1083#1077#1085#1080#1103
                    TabOrder = 0
                    OnClick = ParamChange
                  end
                  object Edit141: TEdit
                    Left = 200
                    Top = 12
                    Width = 34
                    Height = 21
                    TabOrder = 1
                    Text = ' 4,0'
                    OnChange = ParamChange
                  end
                  object Edit144: TEdit
                    Left = 200
                    Top = 32
                    Width = 34
                    Height = 21
                    TabOrder = 2
                    Text = ' 0,7'
                    OnChange = ParamChange
                  end
                  object GroupBox169: TGroupBox
                    Left = 8
                    Top = 51
                    Width = 254
                    Height = 86
                    Caption = 'Expert'
                    TabOrder = 3
                    object Label434: TLabel
                      Left = 152
                      Top = 14
                      Width = 94
                      Height = 13
                      Caption = 'Press                 atm'
                    end
                    object Label448: TLabel
                      Left = 174
                      Top = 45
                      Width = 13
                      Height = 13
                      Caption = 'K3'
                    end
                    object Label361: TLabel
                      Left = 160
                      Top = 64
                      Width = 78
                      Height = 13
                      Caption = ' K Ax               %'
                    end
                    object CheckBox123: TCheckBox
                      Left = 7
                      Top = 64
                      Width = 130
                      Height = 17
                      Caption = #1060#1080#1083#1100#1090#1088' Trailer Press'
                      TabOrder = 0
                      OnClick = ParamChange
                    end
                    object CheckBox150: TCheckBox
                      Left = 7
                      Top = 14
                      Width = 90
                      Height = 17
                      Caption = 'Before ROP'
                      TabOrder = 1
                      OnClick = ParamChange
                    end
                    object Edit214: TEdit
                      Left = 192
                      Top = 11
                      Width = 34
                      Height = 21
                      TabOrder = 2
                      Text = ' 4,0'
                      OnChange = ParamChange
                    end
                    object Edit139: TEdit
                      Left = 192
                      Top = 58
                      Width = 34
                      Height = 21
                      TabOrder = 3
                      Text = ' '
                      OnChange = ParamChange
                    end
                    object Edit194: TEdit
                      Left = 192
                      Top = 38
                      Width = 34
                      Height = 21
                      TabOrder = 4
                      Text = ' '
                      OnChange = ParamChange
                    end
                    object CheckBox242: TCheckBox
                      Left = 7
                      Top = 30
                      Width = 178
                      Height = 17
                      Caption = 'VDC brake light  '#1072#1082#1090#1080#1074#1080#1088#1091#1077#1090#1089#1103
                      TabOrder = 5
                      OnClick = ParamChange
                    end
                  end
                  object CheckBox328: TCheckBox
                    Left = 8
                    Top = 31
                    Width = 82
                    Height = 17
                    Caption = #1087#1086' '#1076#1072#1090#1095#1080#1082#1091
                    TabOrder = 4
                    OnClick = CheckBox140Click
                  end
                end
              end
              object GroupBox141: TGroupBox
                Left = 4
                Top = 290
                Width = 298
                Height = 81
                Caption = #1050#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1103'  Expert'
                TabOrder = 3
                object CheckBox120: TCheckBox
                  Left = 7
                  Top = 30
                  Width = 114
                  Height = 17
                  Caption = 'Wm Pump Not Cut'
                  TabOrder = 0
                  OnClick = ParamChange
                end
                object CheckBox118: TCheckBox
                  Left = 7
                  Top = 46
                  Width = 114
                  Height = 17
                  Caption = 'ON Check VxEnd'
                  TabOrder = 1
                  OnClick = ParamChange
                end
                object CheckBox116: TCheckBox
                  Left = 7
                  Top = 14
                  Width = 98
                  Height = 17
                  Caption = 'Tilting   5,5 m/c2'
                  TabOrder = 2
                  OnClick = ParamChange
                end
                object CheckBox218: TCheckBox
                  Left = 7
                  Top = 62
                  Width = 114
                  Height = 17
                  Caption = 'OFF dAy 0.25m/c2'
                  TabOrder = 3
                  OnClick = CheckBox140Click
                end
              end
            end
            object TabSheet21: TTabSheet
              Caption = 'Direct Yaw Control   DYC'
              ImageIndex = 2
              object GroupBox76: TGroupBox
                Left = 6
                Top = 0
                Width = 310
                Height = 258
                Caption = #1056#1077#1075#1091#1083#1080#1088#1086#1074#1072#1085#1080#1077' '#1076#1072#1074#1083#1077#1085#1080#1103
                TabOrder = 0
                object GroupBox86: TGroupBox
                  Left = 8
                  Top = 14
                  Width = 294
                  Height = 102
                  Caption = #1058#1103#1075#1072#1095
                  TabOrder = 0
                  object Label272: TLabel
                    Left = 162
                    Top = 14
                    Width = 105
                    Height = 13
                    Caption = 'Press OFF             atm'
                  end
                  object GroupBox100: TGroupBox
                    Left = 8
                    Top = 32
                    Width = 278
                    Height = 63
                    Caption = 'Puls Press '
                    TabOrder = 0
                    object Label298: TLabel
                      Left = 84
                      Top = 0
                      Width = 32
                      Height = 13
                      Caption = #1055#1077#1088#1077#1076
                    end
                    object Label362: TLabel
                      Left = 134
                      Top = 0
                      Width = 19
                      Height = 13
                      Caption = #1047#1072#1076
                    end
                    object Label240: TLabel
                      Left = 50
                      Top = 19
                      Width = 122
                      Height = 13
                      Caption = 'Pset                            atm'
                    end
                    object Label238: TLabel
                      Left = 180
                      Top = 19
                      Width = 22
                      Height = 13
                      Caption = 'Tcut'
                    end
                    object Edit61: TEdit
                      Left = 78
                      Top = 16
                      Width = 33
                      Height = 21
                      TabOrder = 0
                      OnChange = ParamChange
                    end
                    object Edit62: TEdit
                      Left = 120
                      Top = 16
                      Width = 33
                      Height = 21
                      TabOrder = 1
                      OnChange = ParamChange
                    end
                    object Edit66: TEdit
                      Left = 206
                      Top = 17
                      Width = 33
                      Height = 21
                      TabOrder = 2
                      OnChange = ParamChange
                    end
                  end
                  object Edit103: TEdit
                    Left = 214
                    Top = 12
                    Width = 33
                    Height = 21
                    TabOrder = 1
                    OnChange = ParamChange
                  end
                  object CheckBox44: TCheckBox
                    Left = 8
                    Top = 14
                    Width = 99
                    Height = 17
                    Caption = 'Brake abort DYC'
                    TabOrder = 2
                    OnClick = ParamChange
                  end
                end
                object GroupBox87: TGroupBox
                  Left = 8
                  Top = 176
                  Width = 294
                  Height = 74
                  Caption = #1056#1077#1075#1091#1083#1103#1090#1086#1088' PD'
                  TabOrder = 1
                  object Label285: TLabel
                    Left = 156
                    Top = 16
                    Width = 123
                    Height = 13
                    Caption = 'Delta Lim                 deg/s'
                  end
                  object Label283: TLabel
                    Left = 60
                    Top = 17
                    Width = 31
                    Height = 13
                    Caption = 'K prop'
                  end
                  object Label284: TLabel
                    Left = 60
                    Top = 36
                    Width = 21
                    Height = 13
                    Caption = 'K dif'
                  end
                  object Edit106: TEdit
                    Left = 212
                    Top = 14
                    Width = 33
                    Height = 21
                    TabOrder = 0
                    OnChange = ParamChange
                  end
                  object CheckBox121: TCheckBox
                    Left = 6
                    Top = 54
                    Width = 139
                    Height = 17
                    Caption = #1053#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' PDout'
                    TabOrder = 1
                    OnClick = ParamChange
                  end
                  object Edit92: TEdit
                    Left = 92
                    Top = 14
                    Width = 33
                    Height = 21
                    TabOrder = 2
                    OnChange = ParamChange
                  end
                  object Edit93: TEdit
                    Left = 92
                    Top = 32
                    Width = 33
                    Height = 21
                    TabOrder = 3
                    OnChange = ParamChange
                  end
                end
                object GroupBox99: TGroupBox
                  Left = 8
                  Top = 116
                  Width = 294
                  Height = 59
                  Caption = #1055#1088#1080#1094#1077#1087' '
                  TabOrder = 2
                  object Label371: TLabel
                    Left = 148
                    Top = 16
                    Width = 118
                    Height = 13
                    Caption = 'Press Desire              atm'
                  end
                  object CheckBox69: TCheckBox
                    Left = 6
                    Top = 16
                    Width = 123
                    Height = 17
                    Caption = #1050#1086#1085#1090#1088#1086#1083#1100' '#1076#1072#1074#1083#1077#1085#1080#1103
                    TabOrder = 0
                    OnClick = ParamChange
                  end
                  object Edit140: TEdit
                    Left = 212
                    Top = 14
                    Width = 33
                    Height = 21
                    TabOrder = 1
                    Text = '3,5'
                    OnChange = ParamChange
                  end
                  object CheckBox52: TCheckBox
                    Left = 6
                    Top = 34
                    Width = 131
                    Height = 17
                    Caption = #1055#1088#1086#1090#1080#1074' '#1057#1082#1083#1072#1076#1099#1074#1072#1085#1080#1077
                    TabOrder = 2
                    OnClick = ParamChange
                  end
                  object CheckBox129: TCheckBox
                    Left = 144
                    Top = 34
                    Width = 49
                    Height = 17
                    Caption = 'Tip 2'
                    TabOrder = 3
                    OnClick = ParamChange
                  end
                end
              end
              object GroupBox82: TGroupBox
                Left = 326
                Top = 98
                Width = 219
                Height = 153
                Caption = 'Under Steering'
                TabOrder = 1
                object Label304: TLabel
                  Left = 92
                  Top = 36
                  Width = 51
                  Height = 13
                  Caption = 'PD Thresh'
                end
                object Label322: TLabel
                  Left = 100
                  Top = 16
                  Width = 105
                  Height = 13
                  Caption = 'Ay Max               m/c2'
                end
                object CheckBox125: TCheckBox
                  Left = 17
                  Top = 56
                  Width = 184
                  Height = 17
                  Caption = 'Derivative Akker   Thr            '
                  TabOrder = 4
                  OnClick = ParamChange
                end
                object Edit104: TEdit
                  Left = 144
                  Top = 32
                  Width = 33
                  Height = 21
                  TabOrder = 0
                  OnChange = ParamChange
                end
                object Edit126: TEdit
                  Left = 144
                  Top = 12
                  Width = 33
                  Height = 21
                  TabOrder = 1
                  OnChange = ParamChange
                end
                object Edit123: TEdit
                  Left = 144
                  Top = 54
                  Width = 33
                  Height = 21
                  TabOrder = 2
                  Text = '48'
                  OnChange = ParamChange
                end
                object CheckBox145: TCheckBox
                  Left = 17
                  Top = 16
                  Width = 80
                  Height = 17
                  Caption = 'Only Circle'
                  TabOrder = 3
                  OnClick = ParamChange
                end
                object GroupBox173: TGroupBox
                  Left = 8
                  Top = 76
                  Width = 203
                  Height = 69
                  Caption = 'Expert'
                  TabOrder = 5
                  object Label303: TLabel
                    Left = 40
                    Top = 18
                    Width = 92
                    Height = 13
                    Caption = 'Derivative OmegaZ'
                  end
                  object Label319: TLabel
                    Left = 63
                    Top = 40
                    Width = 136
                    Height = 13
                    Caption = 'Delta OmegaZ             deg/s'
                  end
                  object Edit102: TEdit
                    Left = 135
                    Top = 14
                    Width = 33
                    Height = 21
                    TabOrder = 0
                    OnChange = ParamChange
                  end
                  object Edit121: TEdit
                    Left = 135
                    Top = 36
                    Width = 34
                    Height = 21
                    TabOrder = 1
                    Text = ' '
                    OnChange = ParamChange
                  end
                end
              end
              object GroupBox83: TGroupBox
                Left = 326
                Top = 252
                Width = 219
                Height = 63
                Caption = 'Over Steering'
                TabOrder = 2
                object Label311: TLabel
                  Left = 80
                  Top = 13
                  Width = 129
                  Height = 13
                  Caption = 'Yaw Bias                   deg/s'
                end
                object Label315: TLabel
                  Left = 86
                  Top = 32
                  Width = 51
                  Height = 13
                  Caption = 'PD Thresh'
                end
                object Edit111: TEdit
                  Left = 144
                  Top = 10
                  Width = 33
                  Height = 21
                  TabOrder = 0
                end
                object Edit94: TEdit
                  Left = 144
                  Top = 28
                  Width = 33
                  Height = 21
                  TabOrder = 1
                  OnChange = ParamChange
                end
              end
              object GroupBox84: TGroupBox
                Left = 326
                Top = 0
                Width = 219
                Height = 92
                Caption = #1056#1077#1075#1091#1083#1080#1088#1086#1074#1072#1085#1080#1077' '#1076#1074#1080#1075#1072#1090#1077#1083#1103
                TabOrder = 3
                object GroupBox85: TGroupBox
                  Left = 8
                  Top = 16
                  Width = 201
                  Height = 69
                  Caption = 'Drag'
                  TabOrder = 0
                  object Label286: TLabel
                    Left = 70
                    Top = 16
                    Width = 107
                    Height = 13
                    Caption = 'Torque Max              %'
                  end
                  object CheckBox128: TCheckBox
                    Left = 48
                    Top = 32
                    Width = 129
                    Height = 17
                    Caption = 'Torque Min                %   '
                    TabOrder = 2
                  end
                  object Edit95: TEdit
                    Left = 136
                    Top = 12
                    Width = 33
                    Height = 21
                    TabOrder = 0
                    OnChange = ParamChange
                  end
                  object Edit96: TEdit
                    Left = 136
                    Top = 30
                    Width = 33
                    Height = 21
                    TabOrder = 1
                    OnChange = ParamChange
                  end
                  object CheckBox51: TCheckBox
                    Left = 8
                    Top = 48
                    Width = 129
                    Height = 17
                    Caption = 'LowMu Drag Enable'
                    TabOrder = 3
                  end
                end
              end
              object GroupBox172: TGroupBox
                Left = 6
                Top = 264
                Width = 310
                Height = 105
                Caption = #1050#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1103'  Expert'
                TabOrder = 4
                object CheckBox130: TCheckBox
                  Left = 8
                  Top = 30
                  Width = 81
                  Height = 19
                  Caption = 'Wref Correct'
                  TabOrder = 0
                  OnClick = ParamChange
                end
                object CheckBox114: TCheckBox
                  Left = 8
                  Top = 14
                  Width = 115
                  Height = 17
                  Caption = 'RoadMu Ax Enable'
                  Checked = True
                  State = cbChecked
                  TabOrder = 1
                  OnClick = ParamChange
                end
                object CheckBox179: TCheckBox
                  Left = 8
                  Top = 46
                  Width = 121
                  Height = 17
                  Caption = 'ABS  DYC  Disable'
                  TabOrder = 2
                end
                object CheckBox210: TCheckBox
                  Left = 8
                  Top = 62
                  Width = 121
                  Height = 17
                  Caption = 'Validity abort DYC'
                  TabOrder = 3
                end
                object CheckBox273: TCheckBox
                  Left = 8
                  Top = 78
                  Width = 177
                  Height = 17
                  Caption = 'VDC Active on Stop Fail  Enable'
                  TabOrder = 4
                end
              end
            end
            object TabSheet15: TTabSheet
              Caption = 'Side Slip Control   SSC'
              ImageIndex = 3
              object GroupBox101: TGroupBox
                Left = 8
                Top = 8
                Width = 257
                Height = 249
                Caption = 'Side Sleep Angle'
                TabOrder = 0
                object Label372: TLabel
                  Left = 9
                  Top = 78
                  Width = 136
                  Height = 13
                  Caption = 'Delta OmegaZ             deg/s'
                end
                object Label373: TLabel
                  Left = 9
                  Top = 102
                  Width = 125
                  Height = 13
                  Caption = 'Thresh  SA                  deg'
                end
                object Label232: TLabel
                  Left = 5
                  Top = 127
                  Width = 128
                  Height = 13
                  Caption = #1046#1077#1089#1090#1082#1086#1089#1090#1100' '#1096#1080#1085#1099',  N/deg'
                end
                object Label231: TLabel
                  Left = 5
                  Top = 31
                  Width = 141
                  Height = 13
                  Caption = #1082#1101#1092#1092#1080#1094#1080#1077#1090' Omega_Z '#1074' '#1091#1075#1083#1077
                end
                object CheckBox113: TCheckBox
                  Left = 4
                  Top = 56
                  Width = 125
                  Height = 17
                  Caption = #1059#1095#1080#1090#1099#1074#1072#1090#1100' OmegaZ'
                  TabOrder = 0
                  OnClick = ParamChange
                end
                object Edit127: TEdit
                  Left = 80
                  Top = 76
                  Width = 33
                  Height = 21
                  TabOrder = 1
                  OnChange = ParamChange
                end
                object Edit112: TEdit
                  Left = 80
                  Top = 102
                  Width = 33
                  Height = 21
                  TabOrder = 2
                  OnChange = ParamChange
                end
                object Edit188: TEdit
                  Left = 152
                  Top = 28
                  Width = 33
                  Height = 21
                  TabOrder = 3
                  OnChange = ParamChange
                end
                object Edit60: TEdit
                  Left = 144
                  Top = 124
                  Width = 40
                  Height = 21
                  TabOrder = 4
                  Text = '2511,0'
                  OnChange = ParamChange
                end
              end
            end
          end
        end
        object TabSheet14: TTabSheet
          Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1040'SR'
          ImageIndex = 5
          object GroupBox155: TGroupBox
            Left = 8
            Top = 2
            Width = 241
            Height = 79
            Caption = #1050#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1103' '
            TabOrder = 0
            object CheckBox155: TCheckBox
              Left = 12
              Top = 14
              Width = 93
              Height = 17
              Caption = 'ASR Enable'
              TabOrder = 0
              OnClick = ParamChange
            end
            object CheckBox156: TCheckBox
              Left = 12
              Top = 30
              Width = 197
              Height = 17
              Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1090#1086#1088#1084#1086#1079#1072#1084#1080' '#1074#1082#1083#1102#1095#1077#1085#1086
              TabOrder = 1
              OnClick = ParamChange
            end
            object CheckBox157: TCheckBox
              Left = 12
              Top = 44
              Width = 205
              Height = 17
              Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1076#1074#1080#1075#1072#1090#1077#1083#1077#1084' '#1074#1082#1083#1102#1095#1077#1085#1086
              TabOrder = 2
              OnClick = ParamChange
            end
            object CheckBox158: TCheckBox
              Left = 12
              Top = 60
              Width = 165
              Height = 17
              Caption = 'TSC '#1082#1086#1085#1090#1088#1086#1083#1100' '#1086#1073#1086#1088#1086#1090#1086#1074
              TabOrder = 3
              OnClick = CheckBox140Click
            end
          end
          object GroupBox165: TGroupBox
            Left = 272
            Top = 2
            Width = 257
            Height = 384
            Caption = #1056#1077#1075#1091#1083#1080#1088#1086#1074#1072#1085#1080#1077' '#1076#1072#1074#1083#1077#1085#1080#1103
            TabOrder = 1
            object Label533: TLabel
              Left = 60
              Top = 18
              Width = 152
              Height = 13
              Caption = #1055#1086#1088#1086#1075' '#1089#1083#1077#1078#1077#1085#1080#1103' dP           '#1072#1090#1084
            end
            object Label534: TLabel
              Left = 53
              Top = 37
              Width = 162
              Height = 13
              Caption = #1044#1072#1074#1083#1077#1085#1080#1077' '#1087#1086#1076#1082#1072#1095#1082#1080'              '#1072#1090#1084
            end
            object Label536: TLabel
              Left = 104
              Top = 118
              Width = 100
              Height = 13
              Caption = 'Sleep  On               %'
            end
            object Label542: TLabel
              Left = 104
              Top = 98
              Width = 115
              Height = 13
              Caption = 'Speed Off              km/h'
            end
            object Label585: TLabel
              Left = 21
              Top = 57
              Width = 192
              Height = 13
              Caption = #1052#1072#1082#1089#1080#1084#1072#1083#1100#1085#1086#1077' '#1076#1072#1074#1083#1077#1085#1080#1077'               '#1072#1090#1084
            end
            object Edit291: TEdit
              Left = 160
              Top = 14
              Width = 33
              Height = 21
              TabOrder = 0
              Text = '0,25'
              OnChange = ParamChange
            end
            object Edit292: TEdit
              Left = 160
              Top = 34
              Width = 33
              Height = 21
              TabOrder = 1
              Text = '0,5'
              OnChange = ParamChange
            end
            object Edit294: TEdit
              Left = 160
              Top = 114
              Width = 33
              Height = 21
              TabOrder = 2
              OnChange = ParamChange
            end
            object GroupBox175: TGroupBox
              Left = 8
              Top = 136
              Width = 241
              Height = 105
              Caption = 'PID '#1088#1077#1075#1091#1083#1103#1090#1086#1088
              TabOrder = 3
              object Label478: TLabel
                Left = 38
                Top = 16
                Width = 116
                Height = 13
                Caption = #1055#1088#1086#1087#1086#1088#1094#1080#1086#1085#1072#1083#1100#1085#1099#1081'  K '
              end
              object Label537: TLabel
                Left = 36
                Top = 36
                Width = 115
                Height = 13
                Caption = #1044#1080#1092#1092#1077#1088#1077#1085#1094#1080#1072#1083#1100#1085#1099#1081' K'
              end
              object Label538: TLabel
                Left = 52
                Top = 56
                Width = 147
                Height = 13
                Caption = #1048#1085#1090#1077#1075#1088#1072#1083#1100#1085#1099#1081'  K +              -- '
              end
              object Label596: TLabel
                Left = 84
                Top = 80
                Width = 64
                Height = 13
                Caption = #1055#1086#1088#1086#1075' Ref  K'
              end
              object Edit295: TEdit
                Left = 152
                Top = 12
                Width = 33
                Height = 21
                TabOrder = 0
                OnChange = ParamChange
              end
              object Edit296: TEdit
                Left = 152
                Top = 32
                Width = 33
                Height = 21
                TabOrder = 1
                OnChange = ParamChange
              end
              object Edit297: TEdit
                Left = 152
                Top = 52
                Width = 33
                Height = 21
                TabOrder = 2
                OnChange = ParamChange
              end
              object Edit362: TEdit
                Left = 200
                Top = 52
                Width = 33
                Height = 21
                TabOrder = 3
                OnChange = ParamChange
              end
              object Edit363: TEdit
                Left = 152
                Top = 76
                Width = 33
                Height = 21
                TabOrder = 4
                OnChange = ParamChange
              end
            end
            object Edit298: TEdit
              Left = 160
              Top = 74
              Width = 33
              Height = 21
              TabOrder = 4
              OnChange = ParamChange
            end
            object Edit303: TEdit
              Left = 160
              Top = 94
              Width = 33
              Height = 21
              TabOrder = 5
              OnChange = ParamChange
            end
            object Edit351: TEdit
              Left = 160
              Top = 54
              Width = 33
              Height = 21
              TabOrder = 6
              OnChange = ParamChange
            end
            object CheckBox258: TCheckBox
              Left = 76
              Top = 244
              Width = 133
              Height = 17
              Caption = 'Time Out                   c'
              TabOrder = 7
              OnClick = ParamChange
            end
            object Edit352: TEdit
              Left = 160
              Top = 242
              Width = 33
              Height = 21
              TabOrder = 8
              OnChange = ParamChange
            end
            object CheckBox269: TCheckBox
              Left = 8
              Top = 76
              Width = 150
              Height = 17
              Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1085#1077' '#1091#1095#1080#1090#1099#1074#1072#1077#1090#1089#1103
              TabOrder = 9
              OnClick = CheckBox140Click
            end
            object GroupBox103: TGroupBox
              Left = 8
              Top = 278
              Width = 241
              Height = 99
              Caption = 'Expert'
              TabOrder = 10
              object CheckBox264: TCheckBox
                Left = 8
                Top = 30
                Width = 145
                Height = 17
                Caption = 'Brake Tout Poff'
                TabOrder = 0
                OnClick = CheckBox140Click
              end
              object CheckBox265: TCheckBox
                Left = 8
                Top = 62
                Width = 129
                Height = 17
                Caption = 'TCO Stop Disable ASR'
                TabOrder = 1
                OnClick = CheckBox140Click
              end
              object CheckBox266: TCheckBox
                Left = 8
                Top = 78
                Width = 137
                Height = 17
                Caption = 'Error Noice Disable ASR'
                TabOrder = 2
                OnClick = ParamChange
              end
              object CheckBox172: TCheckBox
                Left = 8
                Top = 14
                Width = 113
                Height = 17
                Caption = 'Brake Abort  ASR                        '
                TabOrder = 3
              end
              object CheckBox236: TCheckBox
                Left = 8
                Top = 46
                Width = 114
                Height = 17
                Caption = 'Check Safe Enable'
                TabOrder = 4
                OnClick = ParamChange
              end
            end
          end
          object GroupBox174: TGroupBox
            Left = 8
            Top = 84
            Width = 241
            Height = 301
            Caption = #1056#1077#1075#1091#1083#1080#1088#1086#1074#1072#1085#1080#1077' '#1076#1074#1080#1075#1072#1090#1077#1083#1103
            TabOrder = 2
            object Label588: TLabel
              Left = 86
              Top = 20
              Width = 105
              Height = 13
              Caption = 'ON Delay               mc'
            end
            object CheckBox259: TCheckBox
              Left = 76
              Top = 168
              Width = 117
              Height = 17
              Caption = 'Time Out               c'
              TabOrder = 0
              OnClick = ParamChange
            end
            object Edit353: TEdit
              Left = 144
              Top = 166
              Width = 33
              Height = 21
              TabOrder = 1
              OnChange = ParamChange
            end
            object Edit356: TEdit
              Left = 144
              Top = 18
              Width = 33
              Height = 21
              TabOrder = 2
              OnChange = ParamChange
            end
            object GroupBox214: TGroupBox
              Left = 8
              Top = 42
              Width = 225
              Height = 119
              Caption = 'PID '#1088#1077#1075#1091#1083#1103#1090#1086#1088' '#1052#1086#1084#1077#1085#1090#1072
              TabOrder = 3
              object Label287: TLabel
                Left = 22
                Top = 15
                Width = 113
                Height = 13
                Caption = #1055#1088#1086#1087#1086#1088#1094#1080#1086#1085#1072#1083#1100#1085#1099#1081'  K'
              end
              object Label308: TLabel
                Left = 20
                Top = 35
                Width = 115
                Height = 13
                Caption = #1044#1080#1092#1092#1077#1088#1077#1085#1094#1080#1072#1083#1100#1085#1099#1081' K'
              end
              object Label590: TLabel
                Left = 40
                Top = 54
                Width = 144
                Height = 13
                Caption = #1048#1085#1090#1077#1075#1088#1072#1083#1100#1085#1099#1081' K +              -- '
              end
              object Label554: TLabel
                Left = 6
                Top = 96
                Width = 177
                Height = 13
                Caption = #1053#1072#1095#1072#1083#1100#1085#1099#1081' '#1084#1086#1084#1077#1085#1090' Driver             %'
              end
              object Edit357: TEdit
                Left = 136
                Top = 12
                Width = 33
                Height = 21
                TabOrder = 0
                OnChange = ParamChange
              end
              object Edit358: TEdit
                Left = 136
                Top = 32
                Width = 33
                Height = 21
                TabOrder = 1
                OnChange = ParamChange
              end
              object Edit359: TEdit
                Left = 136
                Top = 52
                Width = 33
                Height = 21
                TabOrder = 2
                OnChange = ParamChange
              end
              object Edit360: TEdit
                Left = 184
                Top = 52
                Width = 33
                Height = 21
                TabOrder = 3
                OnChange = ParamChange
              end
              object Edit335: TEdit
                Left = 136
                Top = 72
                Width = 33
                Height = 21
                TabOrder = 4
                Text = ' '
                OnChange = ParamChange
              end
              object Edit315: TEdit
                Left = 136
                Top = 92
                Width = 33
                Height = 21
                TabOrder = 5
                OnChange = ParamChange
              end
              object CheckBox263: TCheckBox
                Left = 8
                Top = 73
                Width = 128
                Height = 17
                Caption = '           '#1044#1072#1074#1083#1077#1085#1080#1103'  K'
                TabOrder = 6
                OnClick = CheckBox140Click
              end
            end
            object GroupBox210: TGroupBox
              Left = 8
              Top = 205
              Width = 225
              Height = 88
              Caption = 'Expert'
              TabOrder = 4
              object CheckBox176: TCheckBox
                Left = 8
                Top = 15
                Width = 189
                Height = 17
                Caption = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1077' Grad Taxo'
                TabOrder = 0
                OnClick = ParamChange
              end
              object CheckBox177: TCheckBox
                Left = 8
                Top = 32
                Width = 117
                Height = 17
                Caption = #1060#1080#1083#1100#1090#1088#1072#1094#1080#1103' Taxo'
                TabOrder = 1
                OnClick = ParamChange
              end
              object CheckBox171: TCheckBox
                Left = 8
                Top = 64
                Width = 77
                Height = 17
                Caption = 'Adjst KTS'
                TabOrder = 2
                OnClick = ParamChange
              end
              object CheckBox178: TCheckBox
                Left = 8
                Top = 48
                Width = 181
                Height = 17
                Caption = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1077'  dTaxo              rpm'
                TabOrder = 3
                OnClick = ParamChange
              end
              object Edit246: TEdit
                Left = 134
                Top = 46
                Width = 33
                Height = 21
                TabOrder = 4
                OnChange = ParamChange
              end
            end
          end
        end
        object TabSheet26: TTabSheet
          Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' EBL'
          ImageIndex = 5
          object GroupBox51: TGroupBox
            Left = 6
            Top = 0
            Width = 244
            Height = 393
            Caption = #1054#1087#1088#1077#1076#1077#1083#1077#1085#1080#1077' '#1079#1072#1075#1088#1091#1079#1082#1080
            TabOrder = 0
            object GroupBox132: TGroupBox
              Left = 8
              Top = 12
              Width = 228
              Height = 258
              Caption = #1056#1072#1079#1075#1086#1085
              TabOrder = 0
              object Label471: TLabel
                Left = 16
                Top = 170
                Width = 208
                Height = 13
                Caption = #1052#1080#1085#1080#1084#1072#1083#1100#1085#1072#1103' '#1089#1082#1086#1088#1086#1089#1090#1100'                 '#1082#1084'/'#1095#1072#1089
              end
              object Label586: TLabel
                Left = 48
                Top = 190
                Width = 145
                Height = 13
                Caption = #1047#1072#1076#1077#1088#1078#1082#1072' Torque                 c'
              end
              object Label558: TLabel
                Left = 112
                Top = 210
                Width = 113
                Height = 13
                Caption = 'Vmax                 '#1082#1084'/'#1095#1072#1089
              end
              object GroupBox131: TGroupBox
                Left = 8
                Top = 12
                Width = 212
                Height = 96
                Caption = 'Engine'
                TabOrder = 0
                object Label489: TLabel
                  Left = 40
                  Top = 36
                  Width = 149
                  Height = 13
                  Caption = #1052#1086#1084#1077#1085#1090'  XX                           %'
                end
                object Label321: TLabel
                  Left = 8
                  Top = 14
                  Width = 188
                  Height = 13
                  Caption = #1052#1072#1082#1089#1080#1084#1072#1083#1085#1099#1081' '#1084#1086#1084#1077#1085#1090'                   Nm'
                end
                object Edit125: TEdit
                  Left = 136
                  Top = 10
                  Width = 40
                  Height = 21
                  TabOrder = 0
                  Text = '2000'
                  OnChange = ParamChange
                end
                object Edit245: TEdit
                  Left = 136
                  Top = 32
                  Width = 41
                  Height = 21
                  TabOrder = 1
                  Text = ' '
                  OnChange = ParamChange
                end
                object GroupBox156: TGroupBox
                  Left = 8
                  Top = 52
                  Width = 193
                  Height = 37
                  Caption = 'Losses'
                  TabOrder = 2
                  object Label467: TLabel
                    Left = 22
                    Top = 15
                    Width = 16
                    Height = 13
                    Caption = ' K1'
                  end
                  object Label468: TLabel
                    Left = 110
                    Top = 15
                    Width = 13
                    Height = 13
                    Caption = 'K2'
                  end
                  object Edit215: TEdit
                    Left = 49
                    Top = 10
                    Width = 41
                    Height = 21
                    TabOrder = 0
                    Text = ' '
                    OnChange = ParamChange
                  end
                  object Edit216: TEdit
                    Left = 128
                    Top = 10
                    Width = 41
                    Height = 21
                    TabOrder = 1
                    Text = ' '
                    OnChange = ParamChange
                  end
                end
              end
              object GroupBox150: TGroupBox
                Left = 8
                Top = 108
                Width = 212
                Height = 56
                Caption = 'Vechicle Losses'
                TabOrder = 1
                object Label522: TLabel
                  Left = 24
                  Top = 34
                  Width = 165
                  Height = 13
                  Caption = 'Transmition Efficiency                  %'
                end
                object Label560: TLabel
                  Left = 22
                  Top = 15
                  Width = 182
                  Height = 13
                  Caption = #1047#1072#1084#1077#1076#1083#1077#1085#1080#1077' '#1074#1099#1073#1077#1075#1072'                  '#1084'/c2'
                end
                object Edit113: TEdit
                  Left = 136
                  Top = 10
                  Width = 40
                  Height = 21
                  TabOrder = 0
                  Text = '0,25'
                  OnChange = ParamChange
                end
                object Edit273: TEdit
                  Left = 136
                  Top = 30
                  Width = 40
                  Height = 21
                  TabOrder = 1
                  OnChange = ParamChange
                end
              end
              object CheckBox153: TCheckBox
                Left = 8
                Top = 223
                Width = 125
                Height = 17
                Caption = #1055#1088#1080#1086#1088#1080#1090#1077#1090' '#1052#1077#1090#1086#1076' 2'
                TabOrder = 2
                OnClick = ParamChange
              end
              object Edit202: TEdit
                Left = 144
                Top = 188
                Width = 40
                Height = 21
                TabOrder = 3
                Text = '0,275'
                OnChange = ParamChange
              end
              object Edit218: TEdit
                Left = 144
                Top = 166
                Width = 41
                Height = 21
                TabOrder = 4
                Text = ' '
                OnChange = ParamChange
              end
              object CheckBox278: TCheckBox
                Left = 8
                Top = 238
                Width = 193
                Height = 17
                Caption = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1077' '#1088#1072#1079#1085#1080#1094#1099' '#1079#1072#1084#1077#1088#1086#1074
                TabOrder = 5
                OnClick = ParamChange
              end
              object CheckBox270: TCheckBox
                Left = 8
                Top = 208
                Width = 49
                Height = 17
                Caption = 'KTS'
                TabOrder = 6
                OnClick = ParamChange
              end
              object Edit364: TEdit
                Left = 144
                Top = 208
                Width = 41
                Height = 21
                TabOrder = 7
                Text = ' '
                OnChange = ParamChange
              end
              object CheckBox330: TCheckBox
                Left = 144
                Top = 224
                Width = 49
                Height = 17
                Caption = 'Buff'
                TabOrder = 8
                OnClick = ParamChange
              end
            end
            object GroupBox133: TGroupBox
              Left = 8
              Top = 270
              Width = 228
              Height = 116
              Caption = #1058#1086#1088#1084#1086#1078#1077#1085#1080#1077
              TabOrder = 1
              object Label310: TLabel
                Left = 48
                Top = 50
                Width = 145
                Height = 13
                Caption = #1047#1072#1076#1077#1088#1078#1082#1072' Brake                   c'
              end
              object Label591: TLabel
                Left = 26
                Top = 32
                Width = 180
                Height = 13
                Caption = #1044#1072#1074#1083#1077#1085#1080#1077' '#1072#1082#1090#1080#1074#1072#1094#1080#1080'                  '#1072#1090#1084
              end
              object Label700: TLabel
                Left = 53
                Top = 16
                Width = 80
                Height = 13
                Caption = 'Load Brake Koef'
              end
              object Edit219: TEdit
                Left = 144
                Top = 10
                Width = 41
                Height = 21
                TabOrder = 0
                OnChange = ParamChange
              end
              object Edit220: TEdit
                Left = 144
                Top = 50
                Width = 40
                Height = 21
                TabOrder = 1
                Text = '0,175'
                OnChange = ParamChange
              end
              object CheckBox152: TCheckBox
                Left = 8
                Top = 64
                Width = 129
                Height = 17
                Caption = #1055#1088#1080#1086#1088#1080#1090#1077#1090' '#1052#1077#1090#1086#1076' 2'
                TabOrder = 2
                OnClick = ParamChange
              end
              object Edit334: TEdit
                Left = 144
                Top = 30
                Width = 40
                Height = 21
                TabOrder = 3
                OnChange = ParamChange
              end
              object CheckBox312: TCheckBox
                Left = 8
                Top = 81
                Width = 137
                Height = 17
                Caption = #1059#1095#1080#1090#1099#1074#1072#1090#1100' '#1056#1077#1090#1072#1088#1076#1077#1088' K'
                TabOrder = 4
                OnClick = ParamChange
              end
              object Edit403: TEdit
                Left = 144
                Top = 78
                Width = 41
                Height = 21
                TabOrder = 5
                Text = '80'
                OnChange = ParamChange
              end
              object CheckBox276: TCheckBox
                Left = 8
                Top = 96
                Width = 121
                Height = 17
                Caption = #1060#1080#1083#1100#1090#1088' '#1084#1077#1076#1080#1072#1085#1072
                TabOrder = 6
                OnClick = ParamChange
              end
              object CheckBox329: TCheckBox
                Left = 144
                Top = 96
                Width = 49
                Height = 17
                Caption = 'Buff'
                TabOrder = 7
                OnClick = ParamChange
              end
            end
          end
          object GroupBox117: TGroupBox
            Left = 272
            Top = 0
            Width = 236
            Height = 265
            Caption = #1056#1077#1075#1091#1083#1080#1088#1086#1074#1072#1085#1080#1077' '#1076#1072#1074#1083#1077#1085#1080#1103
            TabOrder = 1
            object Label406: TLabel
              Left = 29
              Top = 36
              Width = 185
              Height = 13
              Caption = #1055#1086#1088#1086#1075' '#1089#1083#1077#1078#1077#1085#1080#1103'         dP              '#1072#1090#1084
            end
            object Label592: TLabel
              Left = 194
              Top = 56
              Width = 19
              Height = 13
              Caption = #1072#1090#1084
            end
            object Label567: TLabel
              Left = 34
              Top = 238
              Width = 194
              Height = 13
              Caption = #1057#1082#1086#1088#1086#1089#1090#1100' '#1054#1090#1082#1083#1102#1095#1077#1085#1080#1103'               '#1082#1084'/'#1095#1072#1089
            end
            object CheckBox238: TCheckBox
              Left = 8
              Top = 16
              Width = 217
              Height = 17
              Caption = #1044#1072#1074#1083#1077#1085#1080#1077' '#1086#1090#1089#1077#1095#1082#1080'       Po              '#1072#1090#1084
              TabOrder = 8
            end
            object CheckBox212: TCheckBox
              Left = 8
              Top = 54
              Width = 145
              Height = 17
              Caption = #1055#1086#1076#1082#1072#1095#1082#1072' '#1086#1090' '#1079#1072#1075#1088#1091#1079#1082#1080
              TabOrder = 4
              OnClick = CheckBox140Click
            end
            object Edit163: TEdit
              Left = 160
              Top = 14
              Width = 33
              Height = 21
              TabOrder = 0
              Text = '2,0'
              OnChange = ParamChange
            end
            object Edit164: TEdit
              Left = 160
              Top = 34
              Width = 33
              Height = 21
              TabOrder = 1
              Text = '0,25'
              OnChange = ParamChange
            end
            object Edit97: TEdit
              Left = 160
              Top = 54
              Width = 33
              Height = 21
              TabOrder = 2
              Text = '0,5'
              OnChange = ParamChange
            end
            object CheckBox211: TCheckBox
              Left = 8
              Top = 198
              Width = 225
              Height = 17
              Caption = #1054#1090#1082#1083#1102#1095#1077#1085#1080#1077' '#1087#1088#1080' '#1089#1080#1083#1100#1085#1086#1084' '#1090#1086#1088#1084#1086#1078#1077#1085#1080#1080'                   '
              TabOrder = 3
            end
            object CheckBox234: TCheckBox
              Left = 8
              Top = 214
              Width = 145
              Height = 17
              Caption = #1055#1077#1088#1077#1088#1072#1089#1087#1088#1077#1076#1077#1083#1077#1085#1080#1077' Fz                 '
              TabOrder = 5
            end
            object GroupBox194: TGroupBox
              Left = 8
              Top = 134
              Width = 220
              Height = 57
              Caption = #1055#1088#1086#1089#1082#1072#1083#1100#1079#1099#1074#1072#1085#1080#1077
              TabOrder = 6
              object CheckBox138: TCheckBox
                Left = 8
                Top = 16
                Width = 209
                Height = 17
                Caption = 
                  #1055#1086#1088#1086#1075'                                            %              ' +
                  ' '
                TabOrder = 0
              end
              object Edit171: TEdit
                Left = 152
                Top = 12
                Width = 34
                Height = 21
                TabOrder = 1
                Text = '10,0'
                OnChange = ParamChange
              end
              object CheckBox213: TCheckBox
                Left = 8
                Top = 32
                Width = 185
                Height = 17
                Caption = #1050#1086#1088#1088#1077#1082#1094#1080#1103'  '#1082#1086#1101#1092#1092'.  '#1088#1077#1075#1091#1083#1103#1090#1086#1088#1072'                    '
                TabOrder = 2
              end
            end
            object GroupBox195: TGroupBox
              Left = 8
              Top = 80
              Width = 220
              Height = 52
              Caption = 'K'#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090
              TabOrder = 7
              object CheckBox139: TCheckBox
                Left = 8
                Top = 16
                Width = 201
                Height = 17
                Caption = #1055#1086#1087#1088#1072#1074#1082#1072'                                     % '
                TabOrder = 0
              end
              object CheckBox140: TCheckBox
                Left = 8
                Top = 32
                Width = 121
                Height = 17
                Caption = #1047#1085#1072#1082' '#1087#1086#1087#1088#1072#1074#1082#1080'  +'
                TabOrder = 1
                OnClick = CheckBox140Click
              end
              object Edit172: TEdit
                Left = 152
                Top = 12
                Width = 33
                Height = 21
                TabOrder = 2
                Text = '10'
                OnChange = ParamChange
              end
            end
            object Edit116: TEdit
              Left = 156
              Top = 236
              Width = 34
              Height = 21
              TabOrder = 9
              Text = ' '
              OnChange = ParamChange
            end
          end
          object GroupBox49: TGroupBox
            Left = 272
            Top = 272
            Width = 236
            Height = 82
            Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099'  '#1087#1088#1080#1094#1077#1087#1072
            TabOrder = 2
            object Label445: TLabel
              Left = 21
              Top = 16
              Width = 121
              Height = 13
              Caption = #1057#1085#1072#1088#1103#1078#1077#1085#1085#1072#1103' '#1084#1072#1089#1089#1072', '#1082#1075
            end
            object Label463: TLabel
              Left = 54
              Top = 36
              Width = 84
              Height = 13
              Caption = #1047#1072#1074#1080#1089#1080#1084#1086#1089#1090#1100' K4'
            end
            object Edit189: TEdit
              Left = 160
              Top = 12
              Width = 40
              Height = 21
              TabOrder = 0
              Text = '7900'
              OnChange = ParamChange
            end
            object Edit211: TEdit
              Left = 160
              Top = 32
              Width = 41
              Height = 21
              TabOrder = 1
              Text = ' '
              OnChange = ParamChange
            end
            object CheckBox151: TCheckBox
              Left = 6
              Top = 53
              Width = 121
              Height = 17
              Caption = 'LoadKoef_Enable                        '
              TabOrder = 2
            end
          end
        end
        object TabSheet22: TTabSheet
          Caption = 'EXPERT'
          ImageIndex = 6
          object PageControl5: TPageControl
            Left = 0
            Top = 0
            Width = 602
            Height = 396
            ActivePage = TabSheet28
            TabOrder = 0
            OnChange = PageControl5Change
            OnEnter = PageControl5Change
            object TabSheet25: TTabSheet
              Caption = #1050#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1103' '
              object GroupBox102: TGroupBox
                Left = 4
                Top = 0
                Width = 173
                Height = 164
                Caption = #1050#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1103
                TabOrder = 0
                object CheckBox106: TCheckBox
                  Left = 10
                  Top = 14
                  Width = 101
                  Height = 17
                  Caption = 'Tire Koef Enable'
                  TabOrder = 0
                  OnClick = ParamChange
                end
                object CheckBox228: TCheckBox
                  Left = 10
                  Top = 126
                  Width = 125
                  Height = 17
                  Caption = 'Deccel  50 - 15 km/h'
                  TabOrder = 1
                  OnClick = CheckBox140Click
                end
                object CheckBox243: TCheckBox
                  Left = 10
                  Top = 78
                  Width = 133
                  Height = 17
                  Caption = 'Rele Stop '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1086
                  TabOrder = 2
                  OnClick = ParamChange
                end
                object CheckBox257: TCheckBox
                  Left = 10
                  Top = 142
                  Width = 157
                  Height = 17
                  Caption = 'Emergency_Brake 6 m/c2'
                  TabOrder = 3
                  OnClick = CheckBox140Click
                end
                object CheckBox260: TCheckBox
                  Left = 10
                  Top = 94
                  Width = 154
                  Height = 17
                  Caption = #1058#1077#1089#1090' '#1079#1077#1084#1083#1080' WL '#1088#1072#1079#1088#1077#1096#1077#1085
                  TabOrder = 4
                  OnClick = ParamChange
                end
                object CheckBox56: TCheckBox
                  Left = 10
                  Top = 62
                  Width = 145
                  Height = 17
                  Caption = #1051#1072#1084#1087#1072' ESP '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1072
                  TabOrder = 5
                  OnClick = ParamChange
                end
                object CheckBox115: TCheckBox
                  Left = 10
                  Top = 46
                  Width = 99
                  Height = 17
                  Caption = 'Vx '#1060#1080#1083#1100#1090#1088' 1Hz'
                  TabOrder = 6
                  OnClick = CheckBox140Click
                end
                object CheckBox295: TCheckBox
                  Left = 10
                  Top = 110
                  Width = 151
                  Height = 17
                  Caption = #1044#1072#1090#1095#1080#1082' Clutch '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085
                  TabOrder = 7
                  OnClick = ParamChange
                end
              end
              object GroupBox203: TGroupBox
                Left = 184
                Top = 0
                Width = 119
                Height = 161
                Caption = 'Fault Maska'
                TabOrder = 1
                object CheckBox247: TCheckBox
                  Left = 12
                  Top = 14
                  Width = 93
                  Height = 17
                  Caption = 'AGS  Zero Fail'
                  TabOrder = 0
                  OnClick = ParamChange
                end
                object CheckBox248: TCheckBox
                  Left = 12
                  Top = 30
                  Width = 101
                  Height = 17
                  Caption = 'AGS  Mount Fail'
                  TabOrder = 1
                  OnClick = ParamChange
                end
                object CheckBox249: TCheckBox
                  Left = 12
                  Top = 46
                  Width = 101
                  Height = 17
                  Caption = 'AGS  Install Fail'
                  TabOrder = 2
                  OnClick = ParamChange
                end
                object CheckBox250: TCheckBox
                  Left = 12
                  Top = 62
                  Width = 93
                  Height = 17
                  Caption = 'SAS  Zero Fail '
                  TabOrder = 3
                  OnClick = ParamChange
                end
                object CheckBox251: TCheckBox
                  Left = 12
                  Top = 78
                  Width = 101
                  Height = 17
                  Caption = 'SAS  Install Fail'
                  TabOrder = 4
                  OnClick = ParamChange
                end
                object CheckBox252: TCheckBox
                  Left = 12
                  Top = 94
                  Width = 104
                  Height = 17
                  Caption = 'Model  Install Fail'
                  TabOrder = 5
                  OnClick = ParamChange
                end
                object CheckBox255: TCheckBox
                  Left = 12
                  Top = 114
                  Width = 99
                  Height = 17
                  Caption = 'Fail LampOff'
                  TabOrder = 6
                  OnClick = ParamChange
                end
                object CheckBox262: TCheckBox
                  Left = 12
                  Top = 142
                  Width = 99
                  Height = 17
                  Caption = 'AccX Fail Enable'
                  TabOrder = 7
                  OnClick = ParamChange
                end
              end
              object GroupBox191: TGroupBox
                Left = 4
                Top = 166
                Width = 180
                Height = 200
                Caption = 'CAN'
                TabOrder = 2
                object GroupBox204: TGroupBox
                  Left = 8
                  Top = 12
                  Width = 164
                  Height = 98
                  Caption = 'Trailer ISO 11992'
                  TabOrder = 0
                  object CheckBox143: TCheckBox
                    Left = 7
                    Top = 46
                    Width = 138
                    Height = 17
                    Caption = 'EBS12 Curvature Tx'
                    TabOrder = 0
                    OnClick = ParamChange
                  end
                  object CheckBox124: TCheckBox
                    Left = 7
                    Top = 30
                    Width = 138
                    Height = 17
                    Caption = 'EBS11  Press Sensor Tx'
                    TabOrder = 1
                    OnClick = ParamChange
                  end
                  object CheckBox144: TCheckBox
                    Left = 7
                    Top = 14
                    Width = 130
                    Height = 17
                    Caption = 'CAN OneWire Enable'
                    TabOrder = 2
                    OnClick = ParamChange
                  end
                  object CheckBox71: TCheckBox
                    Left = 7
                    Top = 62
                    Width = 154
                    Height = 17
                    Caption = #1057#1090#1072#1090#1091#1089#1099' EBS21 EBS22  Rx'
                    TabOrder = 3
                    OnClick = ParamChange
                  end
                  object CheckBox74: TCheckBox
                    Left = 7
                    Top = 78
                    Width = 125
                    Height = 17
                    Caption = 'Route to J1939'
                    TabOrder = 4
                    OnClick = ParamChange
                  end
                end
                object GroupBox205: TGroupBox
                  Left = 8
                  Top = 111
                  Width = 164
                  Height = 82
                  Caption = 'Truck  J1939'
                  TabOrder = 1
                  object CheckBox141: TCheckBox
                    Left = 8
                    Top = 14
                    Width = 121
                    Height = 17
                    Caption = 'Status CCVS Enable'
                    TabOrder = 0
                    OnClick = ParamChange
                  end
                  object CheckBox175: TCheckBox
                    Left = 8
                    Top = 30
                    Width = 145
                    Height = 17
                    Caption = 'Engine Configuration EC1'
                    TabOrder = 1
                    OnClick = ParamChange
                  end
                  object CheckBox297: TCheckBox
                    Left = 8
                    Top = 46
                    Width = 153
                    Height = 17
                    Caption = 'EBC1  SPN521 BrakePedal '
                    TabOrder = 2
                    OnClick = ParamChange
                  end
                  object CheckBox308: TCheckBox
                    Left = 8
                    Top = 62
                    Width = 145
                    Height = 17
                    Caption = 'VW every second'
                    TabOrder = 3
                    OnClick = ParamChange
                  end
                end
              end
              object GroupBox202: TGroupBox
                Left = 190
                Top = 192
                Width = 112
                Height = 173
                Caption = 'Hill Holder'
                TabOrder = 3
                object Label543: TLabel
                  Left = 8
                  Top = 144
                  Width = 77
                  Height = 13
                  Caption = 'Time                c'
                end
                object CheckBox245: TCheckBox
                  Left = 8
                  Top = 124
                  Width = 97
                  Height = 17
                  Caption = #1048#1085#1076#1080#1082#1072#1090#1086#1088' ESP'
                  TabOrder = 0
                  OnClick = ParamChange
                end
                object CheckBox246: TCheckBox
                  Left = 8
                  Top = 108
                  Width = 95
                  Height = 17
                  Caption = 'RearDIF Enable'
                  TabOrder = 1
                  OnClick = ParamChange
                end
                object CheckBox275: TCheckBox
                  Left = 8
                  Top = 92
                  Width = 100
                  Height = 17
                  Caption = 'Failure Enable'
                  TabOrder = 2
                  OnClick = ParamChange
                end
                object CheckBox244: TCheckBox
                  Left = 8
                  Top = 14
                  Width = 55
                  Height = 17
                  Caption = 'Enable'
                  TabOrder = 3
                  OnClick = ParamChange
                end
                object Edit347: TEdit
                  Left = 44
                  Top = 141
                  Width = 33
                  Height = 21
                  TabOrder = 4
                  Text = ' '
                  OnChange = ParamChange
                end
                object GroupBox97: TGroupBox
                  Left = 8
                  Top = 29
                  Width = 97
                  Height = 62
                  Caption = #1040#1082#1090#1080#1074#1072#1094#1080#1103
                  TabOrder = 5
                  object CheckBox254: TCheckBox
                    Left = 6
                    Top = 14
                    Width = 79
                    Height = 17
                    Caption = 'T'#1086#1088#1084#1086#1079#1086#1084' '
                    TabOrder = 0
                    OnClick = ParamChange
                  end
                  object CheckBox253: TCheckBox
                    Left = 6
                    Top = 28
                    Width = 82
                    Height = 17
                    Caption = 'EBC1 Switch'
                    TabOrder = 1
                    OnClick = ParamChange
                  end
                  object CheckBox57: TCheckBox
                    Left = 6
                    Top = 40
                    Width = 83
                    Height = 17
                    Caption = 'TSET Switch'
                    TabOrder = 2
                    OnClick = ParamChange
                  end
                end
              end
              object GroupBox50: TGroupBox
                Left = 310
                Top = 0
                Width = 278
                Height = 112
                Caption = #1044#1072#1090#1095#1080#1082#1080' '#1076#1072#1074#1083#1077#1085#1080#1103
                TabOrder = 4
                object CheckBox296: TCheckBox
                  Left = 7
                  Top = 86
                  Width = 258
                  Height = 17
                  Caption = 'ECAS Psen  '#1050#1072#1083#1080#1073#1088#1086#1074#1082#1072'      OffSet              atm'
                  TabOrder = 8
                end
                object CheckBox159: TCheckBox
                  Left = 7
                  Top = 14
                  Width = 258
                  Height = 17
                  Caption = 'OffSet  Enable                Break Press             '#1072#1090#1084
                  TabOrder = 3
                  OnClick = ParamChange
                end
                object CheckBox149: TCheckBox
                  Left = 7
                  Top = 28
                  Width = 89
                  Height = 17
                  Caption = 'OffSet  Repeat                       '
                  TabOrder = 0
                  OnClick = ParamChange
                end
                object Edit200: TEdit
                  Left = 202
                  Top = 12
                  Width = 33
                  Height = 21
                  TabOrder = 1
                  OnChange = ParamChange
                end
                object Edit201: TEdit
                  Left = 202
                  Top = 86
                  Width = 33
                  Height = 21
                  TabOrder = 2
                  OnChange = ParamChange
                end
                object CheckBox208: TCheckBox
                  Left = 7
                  Top = 42
                  Width = 138
                  Height = 17
                  Caption = 'Trailer Press Sens AUX2'
                  TabOrder = 4
                  OnClick = CheckBox140Click
                end
                object CheckBox209: TCheckBox
                  Left = 7
                  Top = 56
                  Width = 138
                  Height = 17
                  Caption = 'Break Press Sens CAN'
                  TabOrder = 5
                  OnClick = CheckBox140Click
                end
                object CheckBox229: TCheckBox
                  Left = 7
                  Top = 70
                  Width = 193
                  Height = 17
                  Caption = 'ECAS Psen  '#1059#1089#1090#1072#1085#1086#1074#1083#1077#1085'         Kmp'
                  TabOrder = 6
                end
                object Edit155: TEdit
                  Left = 202
                  Top = 64
                  Width = 33
                  Height = 21
                  TabOrder = 7
                  Text = '3,0'
                  OnChange = ParamChange
                end
              end
              object GroupBox55: TGroupBox
                Left = 310
                Top = 112
                Width = 278
                Height = 128
                Caption = #1044#1072#1090#1095#1080#1082#1080'  SAS  '#1080'  AGS'
                TabOrder = 5
                object Label587: TLabel
                  Left = 8
                  Top = 104
                  Width = 262
                  Height = 13
                  Caption = #1050#1072#1083#1080#1073#1088#1086#1074#1082#1072' SAS  OmegaZ            dps   SA            deg'
                end
                object GroupBox57: TGroupBox
                  Left = 8
                  Top = 14
                  Width = 262
                  Height = 87
                  Caption = 'Sensor'
                  TabOrder = 0
                  object Label237: TLabel
                    Left = 4
                    Top = 16
                    Width = 55
                    Height = 13
                    Caption = 'Steer Angle'
                  end
                  object Label239: TLabel
                    Left = 4
                    Top = 32
                    Width = 50
                    Height = 13
                    Caption = 'Yaw Rate '
                  end
                  object Label241: TLabel
                    Left = -51
                    Top = 52
                    Width = 40
                    Height = 13
                    Caption = 'Accel  Y'
                  end
                  object Label243: TLabel
                    Left = 4
                    Top = 48
                    Width = 203
                    Height = 13
                    Caption = 'Accel  Y           mg/dig                        m/c2'
                  end
                  object Label229: TLabel
                    Left = 112
                    Top = 0
                    Width = 17
                    Height = 13
                    Caption = 'Ref'
                  end
                  object Label230: TLabel
                    Left = 4
                    Top = 64
                    Width = 203
                    Height = 13
                    Caption = 'Accel  X           mg/dig                        m/c2'
                  end
                  object Label242: TLabel
                    Left = 56
                    Top = 0
                    Width = 24
                    Height = 13
                    Caption = 'Pos -'
                  end
                  object Label244: TLabel
                    Left = 132
                    Top = 16
                    Width = 69
                    Height = 13
                    Caption = 'Dm             dig'
                  end
                  object Label443: TLabel
                    Left = 208
                    Top = 0
                    Width = 33
                    Height = 13
                    Caption = 'Enable'
                  end
                  object Label444: TLabel
                    Left = 152
                    Top = 0
                    Width = 28
                    Height = 13
                    Caption = 'Offset'
                  end
                  object Edit54: TEdit
                    Left = 148
                    Top = 42
                    Width = 31
                    Height = 21
                    TabOrder = 0
                    Text = '0,00'
                    OnChange = ParamChange
                  end
                  object Edit59: TEdit
                    Left = 148
                    Top = 61
                    Width = 31
                    Height = 21
                    TabOrder = 1
                    Text = '0,00'
                    OnChange = ParamChange
                  end
                  object CheckBox72: TCheckBox
                    Left = 64
                    Top = 31
                    Width = 10
                    Height = 17
                    TabOrder = 2
                    OnClick = ParamChange
                  end
                  object CheckBox73: TCheckBox
                    Left = 64
                    Top = 46
                    Width = 10
                    Height = 17
                    TabOrder = 3
                    OnClick = ParamChange
                  end
                  object CheckBox75: TCheckBox
                    Left = 115
                    Top = 14
                    Width = 10
                    Height = 17
                    TabOrder = 4
                    OnClick = ParamChange
                  end
                  object CheckBox76: TCheckBox
                    Left = 115
                    Top = 31
                    Width = 10
                    Height = 17
                    TabOrder = 5
                    OnClick = ParamChange
                  end
                  object CheckBox77: TCheckBox
                    Left = 115
                    Top = 46
                    Width = 10
                    Height = 17
                    TabOrder = 6
                    OnClick = ParamChange
                  end
                  object CheckBox78: TCheckBox
                    Left = 115
                    Top = 61
                    Width = 10
                    Height = 17
                    TabOrder = 7
                    OnClick = ParamChange
                  end
                  object Edit74: TEdit
                    Left = 148
                    Top = 14
                    Width = 37
                    Height = 21
                    TabOrder = 8
                    Text = '13940'
                    OnChange = ParamChange
                  end
                  object CheckBox80: TCheckBox
                    Left = 64
                    Top = 16
                    Width = 10
                    Height = 17
                    TabOrder = 9
                    OnClick = ParamChange
                  end
                  object CheckBox81: TCheckBox
                    Left = 64
                    Top = 61
                    Width = 10
                    Height = 17
                    TabOrder = 10
                    OnClick = ParamChange
                  end
                  object CheckBox107: TCheckBox
                    Left = 131
                    Top = 61
                    Width = 10
                    Height = 17
                    Checked = True
                    State = cbChecked
                    TabOrder = 11
                    OnClick = ParamChange
                  end
                  object CheckBox108: TCheckBox
                    Left = 211
                    Top = 62
                    Width = 46
                    Height = 17
                    Caption = 'Pitch'
                    TabOrder = 12
                    OnClick = ParamChange
                  end
                  object CheckBox146: TCheckBox
                    Left = 211
                    Top = 46
                    Width = 46
                    Height = 17
                    Caption = 'Roll'
                    TabOrder = 13
                    OnClick = ParamChange
                  end
                  object CheckBox105: TCheckBox
                    Left = 211
                    Top = 14
                    Width = 46
                    Height = 17
                    Caption = 'Drift'
                    TabOrder = 14
                    OnClick = ParamChange
                  end
                end
                object Edit354: TEdit
                  Left = 142
                  Top = 102
                  Width = 34
                  Height = 21
                  TabOrder = 1
                  Text = ' '
                  OnChange = ParamChange
                end
                object Edit355: TEdit
                  Left = 216
                  Top = 102
                  Width = 34
                  Height = 21
                  TabOrder = 2
                  Text = ' '
                  OnChange = ParamChange
                end
              end
              object GroupBox206: TGroupBox
                Left = 310
                Top = 306
                Width = 157
                Height = 59
                Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1072#1074#1090#1086#1084#1086#1073#1080#1083#1103
                TabOrder = 6
                object Label228: TLabel
                  Left = 2
                  Top = 16
                  Width = 145
                  Height = 13
                  Caption = ' '#1043#1088#1072#1076#1080#1077#1085#1090'  Kus              deg/g'
                end
                object Label324: TLabel
                  Left = 5
                  Top = 36
                  Width = 120
                  Height = 13
                  Caption = #1047#1072#1076#1077#1088#1078#1082#1072' Yaw             c'
                end
                object Edit50: TEdit
                  Left = 80
                  Top = 14
                  Width = 38
                  Height = 21
                  TabOrder = 0
                  Text = '0,25'
                  OnChange = ParamChange
                end
                object Edit128: TEdit
                  Left = 80
                  Top = 34
                  Width = 38
                  Height = 21
                  TabOrder = 1
                  Text = '0,275'
                  OnChange = ParamChange
                end
              end
              object GroupBox199: TGroupBox
                Left = 310
                Top = 248
                Width = 157
                Height = 57
                Caption = 'Brake Asist'
                TabOrder = 7
                object Label566: TLabel
                  Left = 64
                  Top = 32
                  Width = 77
                  Height = 13
                  Caption = 'Time                c'
                end
                object CheckBox237: TCheckBox
                  Left = 8
                  Top = 12
                  Width = 145
                  Height = 17
                  Caption = 'Enable        Po             atm'
                  TabOrder = 0
                  OnClick = ParamChange
                end
                object Edit336: TEdit
                  Left = 100
                  Top = 10
                  Width = 33
                  Height = 21
                  TabOrder = 1
                  Text = ' '
                  OnChange = ParamChange
                end
                object Edit342: TEdit
                  Left = 100
                  Top = 30
                  Width = 33
                  Height = 21
                  TabOrder = 2
                  Text = ' '
                  OnChange = ParamChange
                end
              end
              object GroupBox177: TGroupBox
                Left = 474
                Top = 248
                Width = 113
                Height = 65
                Caption = 'Halt Brake'
                TabOrder = 8
                object CheckBox304: TCheckBox
                  Left = 8
                  Top = 14
                  Width = 55
                  Height = 17
                  Caption = 'Enable'
                  TabOrder = 0
                  OnClick = ParamChange
                end
                object CheckBox305: TCheckBox
                  Left = 8
                  Top = 29
                  Width = 55
                  Height = 17
                  Caption = 'Auto'
                  TabOrder = 1
                  OnClick = ParamChange
                end
                object CheckBox306: TCheckBox
                  Left = 8
                  Top = 44
                  Width = 97
                  Height = 17
                  Caption = 'GAZ DeActivate'
                  TabOrder = 2
                  OnClick = ParamChange
                end
              end
              object GroupBox222: TGroupBox
                Left = 474
                Top = 312
                Width = 113
                Height = 52
                Caption = 'XBR'
                TabOrder = 9
                object CheckBox307: TCheckBox
                  Left = 8
                  Top = 14
                  Width = 55
                  Height = 17
                  Caption = 'Enable'
                  TabOrder = 0
                  OnClick = ParamChange
                end
              end
            end
            object TabSheet27: TTabSheet
              Caption = #1055#1085#1077#1074#1084#1072#1090#1080#1082#1072
              ImageIndex = 1
              object GroupBox136: TGroupBox
                Left = 4
                Top = 0
                Width = 514
                Height = 318
                Caption = #1055#1085#1077#1074#1084#1072#1090#1080#1082'a Truck'
                TabOrder = 0
                object GroupBox139: TGroupBox
                  Left = 8
                  Top = 14
                  Width = 234
                  Height = 72
                  Caption = #1058#1088#1086#1084#1086#1079#1085#1086#1081' '#1082#1088#1072#1085
                  TabOrder = 0
                  object Label472: TLabel
                    Left = 38
                    Top = 32
                    Width = 102
                    Height = 13
                    Caption = 'K'#1086#1077#1092'. '#1089#1085#1080#1078#1077#1085#1080#1103'    P'
                  end
                  object CheckBox302: TCheckBox
                    Left = 8
                    Top = 48
                    Width = 209
                    Height = 17
                    Caption = 'BPS '#1085#1072' '#1058#1086#1088#1084#1086#1079#1085#1086#1084' '#1082#1088#1072#1085#1077
                    TabOrder = 3
                    OnClick = CheckBox140Click
                  end
                  object CheckBox268: TCheckBox
                    Left = 8
                    Top = 14
                    Width = 209
                    Height = 17
                    Caption = #1043#1088#1072#1076#1080#1077#1085#1090' '#1087#1086#1076#1098#1077#1084#1072'    P              '#1072#1090#1084'/'#1089
                    TabOrder = 2
                    OnClick = ParamChange
                  end
                  object Edit195: TEdit
                    Left = 144
                    Top = 10
                    Width = 34
                    Height = 21
                    TabOrder = 0
                    OnChange = ParamChange
                  end
                  object Edit221: TEdit
                    Left = 144
                    Top = 30
                    Width = 33
                    Height = 21
                    TabOrder = 1
                    OnChange = ParamChange
                  end
                end
                object GroupBox190: TGroupBox
                  Left = 248
                  Top = 11
                  Width = 258
                  Height = 300
                  Caption = #1052#1086#1076#1091#1083#1103#1090#1086#1088#1099
                  TabOrder = 1
                  object GroupBox135: TGroupBox
                    Left = 8
                    Top = 182
                    Width = 242
                    Height = 111
                    TabOrder = 1
                    object Label270: TLabel
                      Left = 92
                      Top = 12
                      Width = 39
                      Height = 13
                      Caption = 'K  Inject'
                    end
                    object Label267: TLabel
                      Left = 84
                      Top = 31
                      Width = 48
                      Height = 13
                      Caption = 'K Exhaust'
                    end
                    object Label450: TLabel
                      Left = 85
                      Top = 50
                      Width = 149
                      Height = 13
                      Caption = 'Full Press                             atm'
                    end
                    object Label508: TLabel
                      Left = 6
                      Top = 70
                      Width = 129
                      Height = 13
                      Caption = 'Grad. Inject    L               R '
                    end
                    object Label509: TLabel
                      Left = 64
                      Top = 90
                      Width = 67
                      Height = 13
                      Caption = 'Grad. Exhaust'
                    end
                    object Label426: TLabel
                      Left = 142
                      Top = -2
                      Width = 24
                      Height = 13
                      Caption = 'Front'
                    end
                    object Label553: TLabel
                      Left = 190
                      Top = -2
                      Width = 23
                      Height = 13
                      Caption = 'Rear'
                    end
                    object Edit76: TEdit
                      Left = 136
                      Top = 9
                      Width = 33
                      Height = 21
                      TabOrder = 0
                      OnChange = ParamChange
                    end
                    object Edit77: TEdit
                      Left = 184
                      Top = 9
                      Width = 33
                      Height = 21
                      TabOrder = 1
                      OnChange = ParamChange
                    end
                    object Edit75: TEdit
                      Left = 136
                      Top = 28
                      Width = 33
                      Height = 21
                      TabOrder = 2
                      OnChange = ParamChange
                    end
                    object Edit78: TEdit
                      Left = 184
                      Top = 28
                      Width = 33
                      Height = 21
                      TabOrder = 3
                      OnChange = ParamChange
                    end
                    object Edit197: TEdit
                      Left = 136
                      Top = 47
                      Width = 33
                      Height = 21
                      TabOrder = 4
                      OnChange = ParamChange
                    end
                    object Edit196: TEdit
                      Left = 184
                      Top = 47
                      Width = 33
                      Height = 21
                      TabOrder = 5
                      OnChange = ParamChange
                    end
                    object Edit324: TEdit
                      Left = 82
                      Top = 66
                      Width = 33
                      Height = 21
                      TabOrder = 6
                      OnChange = ParamChange
                    end
                    object Edit253: TEdit
                      Left = 136
                      Top = 66
                      Width = 33
                      Height = 21
                      TabOrder = 7
                      OnChange = ParamChange
                    end
                    object Edit254: TEdit
                      Left = 136
                      Top = 85
                      Width = 33
                      Height = 21
                      TabOrder = 8
                      OnChange = ParamChange
                    end
                    object Edit266: TEdit
                      Left = 184
                      Top = 66
                      Width = 33
                      Height = 21
                      TabOrder = 9
                      OnChange = ParamChange
                    end
                    object Edit267: TEdit
                      Left = 184
                      Top = 85
                      Width = 33
                      Height = 21
                      TabOrder = 10
                      OnChange = ParamChange
                    end
                  end
                  object GroupBox138: TGroupBox
                    Left = 108
                    Top = 6
                    Width = 141
                    Height = 59
                    Caption = 'Delay'
                    TabOrder = 0
                    object Label369: TLabel
                      Left = 16
                      Top = 16
                      Width = 13
                      Height = 13
                      Caption = 'Ko'
                    end
                    object Label492: TLabel
                      Left = 12
                      Top = 36
                      Width = 23
                      Height = 13
                      Caption = 'K dP'
                    end
                    object Label491: TLabel
                      Left = 46
                      Top = 0
                      Width = 17
                      Height = 13
                      Caption = ' Inj '
                    end
                    object Label494: TLabel
                      Left = 84
                      Top = 0
                      Width = 24
                      Height = 13
                      Caption = ' Exh '
                    end
                    object Edit227: TEdit
                      Left = 86
                      Top = 14
                      Width = 33
                      Height = 21
                      TabOrder = 0
                      OnChange = ParamChange
                    end
                    object Edit228: TEdit
                      Left = 38
                      Top = 14
                      Width = 33
                      Height = 21
                      TabOrder = 1
                      OnChange = ParamChange
                    end
                    object Edit248: TEdit
                      Left = 38
                      Top = 34
                      Width = 34
                      Height = 21
                      TabOrder = 2
                      OnChange = ParamChange
                    end
                    object Edit247: TEdit
                      Left = 86
                      Top = 34
                      Width = 34
                      Height = 21
                      TabOrder = 3
                      Text = ' '
                      OnChange = ParamChange
                    end
                  end
                  object CheckBox166: TCheckBox
                    Left = 8
                    Top = 16
                    Width = 97
                    Height = 17
                    Caption = 'Model StatusPA'
                    TabOrder = 2
                    OnClick = CheckBox140Click
                  end
                  object GroupBox192: TGroupBox
                    Left = 8
                    Top = 65
                    Width = 242
                    Height = 116
                    Caption = #1055#1086#1076#1082#1072#1095#1082#1080
                    TabOrder = 3
                    object Label526: TLabel
                      Left = 142
                      Top = -2
                      Width = 66
                      Height = 13
                      Caption = #1087#1077#1088#1077#1076'      '#1079#1072#1076
                    end
                    object Label580: TLabel
                      Left = 68
                      Top = 15
                      Width = 168
                      Height = 13
                      Caption = 'Press Low Mu                            atm'
                    end
                    object Label540: TLabel
                      Left = 50
                      Top = 54
                      Width = 186
                      Height = 13
                      Caption = #1044#1072#1074#1083#1077#1085#1080#1077'    Po                               atm'
                    end
                    object Label577: TLabel
                      Left = 49
                      Top = 74
                      Width = 184
                      Height = 13
                      Caption = #1052#1080#1085#1080#1084#1072#1083#1100#1085#1072#1103'                                 '#1084#1089
                    end
                    object CheckBox241: TCheckBox
                      Left = 8
                      Top = 34
                      Width = 121
                      Height = 17
                      Caption = #1047#1085#1072#1082'  +  Koef  dP(P)'
                      TabOrder = 4
                      OnClick = CheckBox140Click
                    end
                    object Edit280: TEdit
                      Left = 138
                      Top = 12
                      Width = 33
                      Height = 21
                      TabOrder = 0
                      OnChange = ParamChange
                    end
                    object Edit281: TEdit
                      Left = 186
                      Top = 12
                      Width = 33
                      Height = 21
                      TabOrder = 1
                      Text = ' '
                      OnChange = ParamChange
                    end
                    object Edit301: TEdit
                      Left = 138
                      Top = 32
                      Width = 33
                      Height = 21
                      TabOrder = 2
                      OnChange = ParamChange
                    end
                    object Edit302: TEdit
                      Left = 186
                      Top = 32
                      Width = 33
                      Height = 21
                      TabOrder = 3
                      Text = ' '
                      OnChange = ParamChange
                    end
                    object Edit299: TEdit
                      Left = 138
                      Top = 52
                      Width = 33
                      Height = 21
                      TabOrder = 5
                      OnChange = ParamChange
                    end
                    object Edit300: TEdit
                      Left = 186
                      Top = 52
                      Width = 33
                      Height = 21
                      TabOrder = 6
                      Text = ' '
                      OnChange = ParamChange
                    end
                    object Edit332: TEdit
                      Left = 138
                      Top = 72
                      Width = 33
                      Height = 21
                      TabOrder = 7
                      OnChange = ParamChange
                    end
                    object Edit333: TEdit
                      Left = 186
                      Top = 72
                      Width = 33
                      Height = 21
                      TabOrder = 8
                      Text = ' '
                      OnChange = ParamChange
                    end
                  end
                end
                object GroupBox134: TGroupBox
                  Left = 9
                  Top = 154
                  Width = 234
                  Height = 157
                  Caption = #1044#1080#1092#1092'. '#1082#1083#1072#1087#1072#1085
                  TabOrder = 2
                  object Label264: TLabel
                    Left = 100
                    Top = 11
                    Width = 39
                    Height = 13
                    Caption = 'K  Inject'
                  end
                  object Label253: TLabel
                    Left = 92
                    Top = 31
                    Width = 48
                    Height = 13
                    Caption = 'K Exhaust'
                  end
                  object Label451: TLabel
                    Left = 110
                    Top = 52
                    Width = 27
                    Height = 13
                    Caption = 'Delay'
                  end
                  object Label579: TLabel
                    Left = 146
                    Top = -2
                    Width = 24
                    Height = 13
                    Caption = 'Front'
                  end
                  object Label581: TLabel
                    Left = 194
                    Top = -2
                    Width = 23
                    Height = 13
                    Caption = 'Rear'
                  end
                  object Edit67: TEdit
                    Left = 144
                    Top = 9
                    Width = 33
                    Height = 21
                    TabOrder = 0
                    OnChange = ParamChange
                  end
                  object Edit68: TEdit
                    Left = 190
                    Top = 9
                    Width = 33
                    Height = 21
                    TabOrder = 1
                    OnChange = ParamChange
                  end
                  object Edit71: TEdit
                    Left = 144
                    Top = 28
                    Width = 33
                    Height = 21
                    TabOrder = 2
                    OnChange = ParamChange
                  end
                  object Edit72: TEdit
                    Left = 190
                    Top = 28
                    Width = 33
                    Height = 21
                    TabOrder = 3
                    OnChange = ParamChange
                  end
                  object Edit198: TEdit
                    Left = 144
                    Top = 47
                    Width = 33
                    Height = 21
                    TabOrder = 4
                    OnChange = ParamChange
                  end
                  object Edit199: TEdit
                    Left = 190
                    Top = 47
                    Width = 33
                    Height = 21
                    TabOrder = 5
                    OnChange = ParamChange
                  end
                  object CheckBox267: TCheckBox
                    Left = 8
                    Top = 29
                    Width = 73
                    Height = 17
                    Caption = 'PWM on'
                    TabOrder = 6
                    OnClick = CheckBox140Click
                  end
                  object CheckBox147: TCheckBox
                    Left = 8
                    Top = 14
                    Width = 89
                    Height = 17
                    Caption = 'CutM Enable'
                    TabOrder = 7
                    OnClick = ParamChange
                  end
                  object GroupBox142: TGroupBox
                    Left = 7
                    Top = 68
                    Width = 218
                    Height = 36
                    Caption = 'ROP'
                    TabOrder = 8
                    object Label447: TLabel
                      Left = 32
                      Top = 14
                      Width = 13
                      Height = 13
                      Caption = 'dP'
                    end
                    object Label299: TLabel
                      Left = 137
                      Top = 14
                      Width = 75
                      Height = 13
                      Caption = 'Po+             atm'
                    end
                    object Edit192: TEdit
                      Left = 47
                      Top = 10
                      Width = 34
                      Height = 21
                      TabOrder = 0
                      Text = ' '
                      OnChange = ParamChange
                    end
                    object Edit193: TEdit
                      Left = 158
                      Top = 10
                      Width = 34
                      Height = 21
                      TabOrder = 1
                      Text = ' '
                      OnChange = ParamChange
                    end
                  end
                  object GroupBox213: TGroupBox
                    Left = 7
                    Top = 104
                    Width = 218
                    Height = 46
                    Caption = 'DYC'
                    TabOrder = 9
                    object Label235: TLabel
                      Left = 30
                      Top = 23
                      Width = 178
                      Height = 13
                      Caption = 'dP               Po                              atm'
                    end
                    object Label539: TLabel
                      Left = 106
                      Top = 6
                      Width = 32
                      Height = 13
                      Caption = #1055#1077#1088#1077#1076
                    end
                    object Label589: TLabel
                      Left = 166
                      Top = 6
                      Width = 19
                      Height = 13
                      Caption = #1047#1072#1076
                    end
                    object Edit69: TEdit
                      Left = 103
                      Top = 20
                      Width = 33
                      Height = 21
                      TabOrder = 0
                      OnChange = ParamChange
                    end
                    object Edit63: TEdit
                      Left = 158
                      Top = 20
                      Width = 33
                      Height = 21
                      TabOrder = 1
                      OnChange = ParamChange
                    end
                    object Edit105: TEdit
                      Left = 46
                      Top = 20
                      Width = 33
                      Height = 21
                      TabOrder = 2
                      OnChange = ParamChange
                    end
                  end
                end
                object GroupBox140: TGroupBox
                  Left = 8
                  Top = 86
                  Width = 234
                  Height = 68
                  Caption = #1059#1089#1082#1086#1088#1080#1090#1077#1083#1100#1085#1099#1081' '#1082#1083#1072#1087#1072#1085
                  TabOrder = 3
                  object Label476: TLabel
                    Left = 6
                    Top = 16
                    Width = 3
                    Height = 13
                  end
                  object Label405: TLabel
                    Left = 154
                    Top = 0
                    Width = 24
                    Height = 13
                    Caption = 'Front'
                  end
                  object Label422: TLabel
                    Left = 194
                    Top = 0
                    Width = 23
                    Height = 13
                    Caption = 'Rear'
                  end
                  object Label343: TLabel
                    Left = 102
                    Top = 36
                    Width = 39
                    Height = 13
                    Caption = 'K  Press'
                  end
                  object Label427: TLabel
                    Left = 68
                    Top = 17
                    Width = 76
                    Height = 13
                    Caption = #1044#1072#1074#1083#1077#1085#1080#1077', '#1072#1090#1084
                  end
                  object CheckBox239: TCheckBox
                    Left = 8
                    Top = 16
                    Width = 57
                    Height = 17
                    Caption = #1052#1086#1076#1077#1083#1100
                    TabOrder = 2
                    OnClick = CheckBox140Click
                  end
                  object Edit223: TEdit
                    Left = 144
                    Top = 14
                    Width = 33
                    Height = 21
                    TabOrder = 0
                    OnChange = ParamChange
                  end
                  object Edit224: TEdit
                    Left = 190
                    Top = 14
                    Width = 33
                    Height = 21
                    TabOrder = 1
                    OnChange = ParamChange
                  end
                  object Edit366: TEdit
                    Left = 144
                    Top = 33
                    Width = 33
                    Height = 21
                    TabOrder = 3
                    OnChange = ParamChange
                  end
                  object Edit367: TEdit
                    Left = 190
                    Top = 33
                    Width = 33
                    Height = 21
                    TabOrder = 4
                    OnChange = ParamChange
                  end
                  object CheckBox288: TCheckBox
                    Left = 8
                    Top = 32
                    Width = 89
                    Height = 17
                    Caption = 'Always'
                    TabOrder = 5
                    OnClick = CheckBox140Click
                  end
                  object CheckBox289: TCheckBox
                    Left = 8
                    Top = 48
                    Width = 113
                    Height = 17
                    Caption = 'Filtr AirDrop Enable'
                    TabOrder = 6
                    OnClick = CheckBox140Click
                  end
                end
              end
              object GroupBox137: TGroupBox
                Left = 4
                Top = 322
                Width = 229
                Height = 40
                Caption = #1055#1085#1077#1074#1084#1072#1090#1080#1082'a TRAILER'
                TabOrder = 1
                object Label342: TLabel
                  Left = 22
                  Top = 17
                  Width = 150
                  Height = 13
                  Caption = 'Gradient        Inj                   Ehx'
                end
                object Edit131: TEdit
                  Left = 116
                  Top = 14
                  Width = 33
                  Height = 21
                  TabOrder = 0
                  OnChange = ParamChange
                end
                object Edit132: TEdit
                  Left = 174
                  Top = 12
                  Width = 33
                  Height = 21
                  TabOrder = 1
                  OnChange = ParamChange
                end
              end
            end
            object TabSheet24: TTabSheet
              Caption = 'DBR'
              ImageIndex = 2
              object GroupBox198: TGroupBox
                Left = 4
                Top = 0
                Width = 178
                Height = 225
                Caption = #1050#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1103' DBR'
                TabOrder = 0
                object CheckBox240: TCheckBox
                  Left = 8
                  Top = 14
                  Width = 85
                  Height = 17
                  Caption = 'DBR  Enable'
                  TabOrder = 0
                  OnClick = ParamChange
                end
                object CheckBox294: TCheckBox
                  Left = 8
                  Top = 28
                  Width = 161
                  Height = 17
                  Caption = #1047#1072#1076#1072#1085#1080#1077' '#1052#1086#1084#1077#1085#1090#1072
                  TabOrder = 1
                  OnClick = CheckBox140Click
                end
                object GroupBox236: TGroupBox
                  Left = 8
                  Top = 136
                  Width = 161
                  Height = 81
                  Caption = #1050#1086#1085#1090#1088#1086#1083#1100' '#1079#1072#1084#1077#1076#1083#1077#1085#1080#1103
                  TabOrder = 2
                  object Label628: TLabel
                    Left = 8
                    Top = 34
                    Width = 137
                    Height = 13
                    Caption = #1046#1077#1083#1072#1077#1084#1086#1077'  Ax             m/c2'
                  end
                  object Label629: TLabel
                    Left = 29
                    Top = 54
                    Width = 102
                    Height = 13
                    Caption = #1052#1086#1084#1077#1085#1090'                  %'
                  end
                  object Edit401: TEdit
                    Left = 84
                    Top = 32
                    Width = 33
                    Height = 21
                    TabOrder = 0
                    Text = '1,0'
                    OnChange = ParamChange
                  end
                  object CheckBox311: TCheckBox
                    Left = 8
                    Top = 14
                    Width = 137
                    Height = 17
                    Caption = #1050#1086#1085#1090#1088#1086#1083#1100' '#1088#1072#1079#1088#1077#1096#1077#1085
                    TabOrder = 1
                    OnClick = CheckBox140Click
                  end
                  object Edit402: TEdit
                    Left = 84
                    Top = 52
                    Width = 33
                    Height = 21
                    TabOrder = 2
                    Text = '25'
                    OnChange = ParamChange
                  end
                end
                object GroupBox237: TGroupBox
                  Left = 8
                  Top = 48
                  Width = 161
                  Height = 84
                  Caption = #1050#1086#1085#1090#1088#1086#1083#1100' '#1087#1088#1086#1089#1082#1072#1083#1100#1079#1099#1074#1072#1085#1080#1103
                  TabOrder = 3
                  object Label572: TLabel
                    Left = 9
                    Top = 18
                    Width = 119
                    Height = 13
                    Caption = 'Slip DBR  On                %'
                  end
                  object Label573: TLabel
                    Left = 8
                    Top = 40
                    Width = 119
                    Height = 13
                    Caption = 'Slip DBR  Off                %'
                  end
                  object Label574: TLabel
                    Left = 24
                    Top = 59
                    Width = 120
                    Height = 13
                    Caption = 'Speed ON               km/h'
                  end
                  object Edit339: TEdit
                    Left = 84
                    Top = 16
                    Width = 33
                    Height = 21
                    TabOrder = 0
                    OnChange = ParamChange
                  end
                  object Edit340: TEdit
                    Left = 84
                    Top = 36
                    Width = 33
                    Height = 21
                    TabOrder = 1
                    OnChange = ParamChange
                  end
                  object Edit341: TEdit
                    Left = 84
                    Top = 56
                    Width = 33
                    Height = 21
                    TabOrder = 2
                    OnChange = ParamChange
                  end
                end
              end
            end
            object TabSheet31: TTabSheet
              Caption = 'Validation'
              ImageIndex = 3
              ParentShowHint = False
              ShowHint = False
              object GroupBox211: TGroupBox
                Left = 4
                Top = 0
                Width = 172
                Height = 236
                Caption = 'Press Sensor Validation'
                TabOrder = 0
                object CheckBox261: TCheckBox
                  Left = 8
                  Top = 18
                  Width = 137
                  Height = 17
                  Caption = 'FailPS  PressEst  Enable'
                  TabOrder = 0
                  OnClick = ParamChange
                end
                object CheckBox277: TCheckBox
                  Left = 8
                  Top = 34
                  Width = 137
                  Height = 17
                  Caption = #1060#1080#1083#1100#1090#1088' Break Demand'
                  TabOrder = 1
                  OnClick = ParamChange
                end
                object CheckBox279: TCheckBox
                  Left = 8
                  Top = 74
                  Width = 153
                  Height = 17
                  Caption = 'Stop Switch '#1051#1103#1075#1091#1096#1082#1072'  Test'
                  TabOrder = 2
                  OnClick = ParamChange
                end
                object CheckBox284: TCheckBox
                  Left = 8
                  Top = 58
                  Width = 137
                  Height = 17
                  Caption = 'Stop Light AUX1 Test'
                  TabOrder = 3
                  OnClick = ParamChange
                end
                object GroupBox212: TGroupBox
                  Left = 8
                  Top = 160
                  Width = 156
                  Height = 68
                  Caption = 'Trailer Press Sensor Test'
                  TabOrder = 4
                  object CheckBox282: TCheckBox
                    Left = 8
                    Top = 14
                    Width = 145
                    Height = 17
                    Caption = #1044#1086#1089#1090#1086#1074#1077#1088#1085#1086#1089#1090#1100' '#1089#1080#1075#1085#1072#1083#1072
                    TabOrder = 0
                    OnClick = ParamChange
                  end
                  object CheckBox283: TCheckBox
                    Left = 8
                    Top = 30
                    Width = 97
                    Height = 17
                    Caption = #1054#1073#1088#1099#1074' AUX2'
                    TabOrder = 1
                    OnClick = ParamChange
                  end
                  object CheckBox285: TCheckBox
                    Left = 8
                    Top = 46
                    Width = 137
                    Height = 17
                    Caption = #1054#1090#1089#1091#1090#1089#1090#1074#1080#1077' '#1057#1080#1075#1085#1072#1083#1072' '
                    TabOrder = 2
                    OnClick = ParamChange
                  end
                end
                object GroupBox219: TGroupBox
                  Left = 8
                  Top = 90
                  Width = 156
                  Height = 68
                  Caption = 'Brake Press Sensor Test'
                  TabOrder = 5
                  object CheckBox280: TCheckBox
                    Left = 8
                    Top = 30
                    Width = 137
                    Height = 17
                    Caption = #1057#1080#1075#1085#1072#1083' '#1073#1077#1079' '#1053#1072#1078#1072#1090#1080#1103
                    TabOrder = 0
                    OnClick = ParamChange
                  end
                  object CheckBox281: TCheckBox
                    Left = 8
                    Top = 46
                    Width = 137
                    Height = 17
                    Caption = #1054#1090#1089#1091#1090#1089#1090#1074#1080#1077' '#1057#1080#1075#1085#1072#1083#1072
                    TabOrder = 1
                    OnClick = ParamChange
                  end
                  object CheckBox148: TCheckBox
                    Left = 8
                    Top = 14
                    Width = 130
                    Height = 17
                    Caption = #1053#1077#1090' CAN '#1080#1083#1080' '#1054#1073#1088#1099#1074
                    TabOrder = 2
                    OnClick = ParamChange
                  end
                end
              end
              object GroupBox216: TGroupBox
                Left = 188
                Top = 0
                Width = 130
                Height = 85
                Caption = 'Wheel Speed'
                TabOrder = 1
                object CheckBox271: TCheckBox
                  Left = 8
                  Top = 16
                  Width = 113
                  Height = 17
                  Caption = 'Extapolation Enable'
                  TabOrder = 0
                end
                object CheckBox170: TCheckBox
                  Left = 8
                  Top = 48
                  Width = 91
                  Height = 17
                  Caption = 'Speed High Hz'
                  TabOrder = 1
                  OnClick = ParamChange
                end
                object CheckBox215: TCheckBox
                  Left = 8
                  Top = 64
                  Width = 99
                  Height = 17
                  Caption = 'High Hz Capture'
                  TabOrder = 2
                  OnClick = ParamChange
                end
                object CheckBox272: TCheckBox
                  Left = 8
                  Top = 32
                  Width = 113
                  Height = 17
                  Caption = 'Extapolation Accel'
                  TabOrder = 3
                end
              end
              object GroupBox218: TGroupBox
                Left = 348
                Top = 0
                Width = 242
                Height = 361
                Caption = #1044#1080#1072#1075#1085#1086#1089#1090#1080#1082#1072' ISO'
                TabOrder = 2
                object GroupBox186: TGroupBox
                  Left = 8
                  Top = 48
                  Width = 225
                  Height = 150
                  Caption = 'Pnevmo Test '
                  TabOrder = 0
                  object Label313: TLabel
                    Left = 8
                    Top = 128
                    Width = 201
                    Height = 13
                    Caption = #1047#1072#1076#1072#1085#1080#1077' '#1076#1072#1074#1083#1077#1085#1080#1103'                              atm'
                  end
                  object Label449: TLabel
                    Left = 114
                    Top = 110
                    Width = 80
                    Height = 13
                    Caption = 'Front         Rear  '
                  end
                  object CheckBox235: TCheckBox
                    Left = 8
                    Top = 30
                    Width = 135
                    Height = 17
                    Caption = 'Brake One Axis Enable'
                    TabOrder = 0
                    OnClick = ParamChange
                  end
                  object CheckBox110: TCheckBox
                    Left = 8
                    Top = 14
                    Width = 121
                    Height = 17
                    Caption = 'Sound Dif Enable'
                    TabOrder = 1
                    OnClick = ParamChange
                  end
                  object CheckBox67: TCheckBox
                    Left = 8
                    Top = 46
                    Width = 145
                    Height = 17
                    Caption = 'MDT Right Side Enable'
                    TabOrder = 2
                    OnClick = ParamChange
                  end
                  object CheckBox290: TCheckBox
                    Left = 8
                    Top = 62
                    Width = 145
                    Height = 17
                    Caption = 'MDT Left Side Enable'
                    TabOrder = 3
                    OnClick = ParamChange
                  end
                  object CheckBox291: TCheckBox
                    Left = 8
                    Top = 78
                    Width = 145
                    Height = 17
                    Caption = 'MDT Front Axis Enable'
                    TabOrder = 4
                    OnClick = ParamChange
                  end
                  object CheckBox292: TCheckBox
                    Left = 8
                    Top = 94
                    Width = 129
                    Height = 17
                    Caption = 'MDT Rear Axis Enable'
                    TabOrder = 5
                    OnClick = ParamChange
                  end
                  object Edit114: TEdit
                    Left = 110
                    Top = 124
                    Width = 34
                    Height = 21
                    TabOrder = 6
                    Text = ' '
                    OnChange = ParamChange
                  end
                  object Edit115: TEdit
                    Left = 158
                    Top = 124
                    Width = 34
                    Height = 21
                    TabOrder = 7
                    Text = ' '
                    OnChange = ParamChange
                  end
                end
                object CheckBox180: TCheckBox
                  Left = 8
                  Top = 16
                  Width = 121
                  Height = 17
                  Caption = 'Diagnose Enable'
                  TabOrder = 1
                end
                object CheckBox274: TCheckBox
                  Left = 8
                  Top = 32
                  Width = 121
                  Height = 17
                  Caption = 'TP2  My_Main'
                  TabOrder = 2
                  OnClick = CheckBox140Click
                end
                object GroupBox56: TGroupBox
                  Left = 8
                  Top = 200
                  Width = 130
                  Height = 65
                  Caption = 'SPY'
                  TabOrder = 3
                  object CheckBox64: TCheckBox
                    Left = 8
                    Top = 14
                    Width = 97
                    Height = 17
                    Caption = 'SPY '#1074#1082#1083#1102#1095#1077#1085
                    TabOrder = 0
                    OnClick = ParamChange
                  end
                  object CheckBox65: TCheckBox
                    Left = 8
                    Top = 30
                    Width = 120
                    Height = 17
                    Caption = 'Press model  for ABS'
                    TabOrder = 1
                    OnClick = ParamChange
                  end
                  object CheckBox79: TCheckBox
                    Left = 8
                    Top = 46
                    Width = 115
                    Height = 17
                    Caption = #1055#1086#1083#1080#1075#1086#1085' '#1088#1072#1079#1088#1077#1096#1077#1085
                    TabOrder = 2
                    OnClick = ParamChange
                  end
                end
                object GroupBox166: TGroupBox
                  Left = 144
                  Top = 200
                  Width = 89
                  Height = 65
                  Caption = 'Emul'
                  TabOrder = 4
                  object CheckBox168: TCheckBox
                    Left = 8
                    Top = 30
                    Width = 77
                    Height = 17
                    Caption = 'Emul  Ay Ax'
                    Checked = True
                    ParentShowHint = False
                    ShowHint = True
                    State = cbChecked
                    TabOrder = 0
                    OnClick = ParamChange
                  end
                  object CheckBox169: TCheckBox
                    Left = 8
                    Top = 14
                    Width = 75
                    Height = 17
                    Caption = 'Emul Taxo'
                    TabOrder = 1
                    OnClick = ParamChange
                  end
                end
                object CheckBox58: TCheckBox
                  Left = 10
                  Top = 266
                  Width = 149
                  Height = 17
                  Caption = #1052#1086#1076#1077#1083#1080#1088#1086#1074#1072#1085#1080#1077' TruckSim'
                  TabOrder = 5
                  OnClick = ParamChange
                end
                object CheckBox95: TCheckBox
                  Left = 10
                  Top = 282
                  Width = 185
                  Height = 17
                  Caption = #1053#1086#1074#1099#1077' '#1082#1083#1102#1095#1080' '#1074' '#1089#1090#1072#1088#1099#1093' '#1073#1083#1086#1082#1072#1093
                  TabOrder = 6
                  OnClick = ParamChange
                end
                object CheckBox300: TCheckBox
                  Left = 10
                  Top = 298
                  Width = 111
                  Height = 17
                  Caption = 'K Line Blink Code'
                  TabOrder = 7
                  OnClick = ParamChange
                end
                object CheckBox333: TCheckBox
                  Left = 10
                  Top = 314
                  Width = 111
                  Height = 17
                  Caption = 'Blink Code Enable'
                  TabOrder = 8
                  OnClick = ParamChange
                end
              end
              object GroupBox78: TGroupBox
                Left = 4
                Top = 240
                Width = 172
                Height = 126
                Caption = 'Plata AGS'
                TabOrder = 3
                object CheckBox301: TCheckBox
                  Left = 64
                  Top = 8
                  Width = 65
                  Height = 17
                  Caption = 'Enable'
                  TabOrder = 0
                  OnClick = ParamChange
                end
                object RadioGroup11: TRadioGroup
                  Left = 8
                  Top = 23
                  Width = 156
                  Height = 98
                  Caption = #1054#1088#1080#1077#1085#1090#1072#1094#1080#1103' '#1041#1083#1086#1082#1072
                  Items.Strings = (
                    #1043#1086#1088#1080#1079#1086#1085#1090#1072#1083#1100#1085#1086
                    #1042#1077#1088#1090#1080#1082#1072#1083#1100#1085#1086' '#1042#1087#1077#1088#1077#1076
                    #1042#1077#1088#1090#1080#1082#1072#1083#1100#1085#1086' '#1053#1072#1079#1072#1076
                    #1042#1077#1088#1090#1080#1082#1072#1083#1100#1085#1086' '#1042#1087#1088#1072#1074#1086
                    #1042#1077#1088#1090#1080#1082#1072#1083#1100#1085#1086' '#1042#1083#1077#1074#1086)
                  TabOrder = 1
                  OnClick = ParamChange
                end
              end
              object GroupBox220: TGroupBox
                Left = 184
                Top = 240
                Width = 137
                Height = 121
                Caption = #1055#1088#1080#1073#1086#1088#1085#1072#1103' '#1087#1072#1085#1077#1083#1100
                TabOrder = 4
                object Label246: TLabel
                  Left = 23
                  Top = 16
                  Width = 58
                  Height = 13
                  Caption = 'CAN '#1072#1076#1088#1077#1089' '
                end
                object Edit142: TEdit
                  Left = 88
                  Top = 14
                  Width = 33
                  Height = 21
                  TabOrder = 0
                  Text = ' '
                  OnChange = ParamChange
                end
                object RadioGroup12: TRadioGroup
                  Left = 8
                  Top = 45
                  Width = 120
                  Height = 68
                  Caption = #1058#1080#1087' '
                  Items.Strings = (
                    #1065#1055'8155 '#1042#1080#1090#1077#1073#1089#1082
                    #1041#1057#1059' '#1053#1043#1050' '#1052#1080#1085#1089#1082
                    #1055#1048'10  '#1055#1088#1086#1090#1086#1082)
                  TabOrder = 1
                  OnClick = RadioGroup12Click
                end
              end
              object GroupBox224: TGroupBox
                Left = 184
                Top = 96
                Width = 145
                Height = 105
                Caption = 'AGS'
                TabOrder = 5
                object CheckBox309: TCheckBox
                  Left = 8
                  Top = 14
                  Width = 129
                  Height = 17
                  Caption = 'GYRO Self Set Zero'
                  TabOrder = 0
                  OnClick = ParamChange
                end
                object CheckBox310: TCheckBox
                  Left = 8
                  Top = 30
                  Width = 113
                  Height = 17
                  Caption = 'Last Error'
                  TabOrder = 1
                  OnClick = ParamChange
                end
              end
            end
            object TabSheet30: TTabSheet
              Caption = 'UTIL'
              ImageIndex = 4
              object btn7: TSpeedButton
                Left = 480
                Top = 335
                Width = 105
                Height = 25
                Cursor = crHandPoint
                AllowAllUp = True
                GroupIndex = 5
                Caption = 'MAKE SKU'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                OnClick = btn3Click
              end
              object GroupBox147: TGroupBox
                Left = 4
                Top = 86
                Width = 204
                Height = 175
                Caption = #1050#1086#1084#1072#1085#1076#1099' '#1050#1072#1083#1080#1073#1088#1086#1074#1082#1080
                TabOrder = 1
                object Label493: TLabel
                  Left = 8
                  Top = 17
                  Width = 89
                  Height = 13
                  Caption = #1050#1072#1083#1080#1073#1088#1086#1074#1082#1072'  AGS'
                end
                object Label510: TLabel
                  Left = 8
                  Top = 40
                  Width = 105
                  Height = 13
                  Caption = #1059#1089#1090#1072#1085#1086#1074#1082#1072' '#1085#1091#1083#1103' SAS'
                end
                object Label521: TLabel
                  Left = 8
                  Top = 60
                  Width = 93
                  Height = 13
                  Caption = #1059#1075#1086#1083'               '#1075#1088#1072#1076
                end
                object Label425: TLabel
                  Left = 8
                  Top = 122
                  Width = 95
                  Height = 13
                  Caption = #1057#1073#1088#1086#1089' '#1050#1072#1083#1080#1073#1088#1086#1074#1082#1080
                end
                object Label453: TLabel
                  Left = 8
                  Top = 80
                  Width = 107
                  Height = 13
                  Caption = #1050#1072#1083#1080#1073#1088#1086#1074#1082#1080' ECAS Ps'
                end
                object Label525: TLabel
                  Left = 8
                  Top = 100
                  Width = 89
                  Height = 13
                  Caption = 'OffSet              atm'
                end
                object Label325: TLabel
                  Left = 8
                  Top = 146
                  Width = 101
                  Height = 13
                  Caption = #1057#1073#1088#1086#1089' VIN '#1080' '#1050#1072#1083#1080#1073#1088
                end
                object Button61: TButton
                  Left = 118
                  Top = 12
                  Width = 75
                  Height = 25
                  Caption = 'Cmd 36'
                  TabOrder = 0
                  OnClick = Button61Click
                end
                object Button62: TButton
                  Left = 118
                  Top = 42
                  Width = 75
                  Height = 25
                  Caption = 'Cmd 37'
                  TabOrder = 1
                  OnClick = Button62Click
                end
                object Button65: TButton
                  Left = 118
                  Top = 112
                  Width = 75
                  Height = 25
                  Caption = 'Cmd 38'
                  TabOrder = 2
                  OnClick = Button65Click
                end
                object Edit272: TEdit
                  Left = 40
                  Top = 56
                  Width = 35
                  Height = 21
                  TabOrder = 3
                end
                object Button69: TButton
                  Left = 118
                  Top = 72
                  Width = 75
                  Height = 25
                  Caption = 'Cmd 39'
                  TabOrder = 4
                  OnClick = Button69Click
                end
                object Edit368: TEdit
                  Left = 40
                  Top = 96
                  Width = 35
                  Height = 21
                  TabOrder = 5
                  OnChange = ParamChange
                end
                object Button72: TButton
                  Left = 118
                  Top = 142
                  Width = 75
                  Height = 25
                  Caption = 'Default'
                  TabOrder = 6
                  OnClick = Button72Click
                end
              end
              object GroupBox154: TGroupBox
                Left = 216
                Top = 0
                Width = 250
                Height = 260
                Caption = #1044#1080#1072#1075#1085#1086#1089#1090#1080#1082#1072' CAN'
                TabOrder = 2
                object Label593: TLabel
                  Left = 32
                  Top = 16
                  Width = 120
                  Height = 13
                  Caption = #1054#1090#1083#1072#1076#1082#1072'  '#1087#1077#1088#1077#1076#1072#1095#1080' VIN '
                end
                object Label594: TLabel
                  Left = 24
                  Top = 50
                  Width = 107
                  Height = 13
                  Caption = #1047#1072#1087#1088#1086#1089' VIN '#1082#1086#1084#1091' DA '
                end
                object Label597: TLabel
                  Left = 32
                  Top = 80
                  Width = 120
                  Height = 13
                  Caption = #1054#1090#1083#1072#1076#1082#1072'  '#1087#1077#1088#1077#1076#1072#1095#1080' VW '
                end
                object Label518: TLabel
                  Left = 72
                  Top = 94
                  Width = 72
                  Height = 13
                  Caption = 'Vehicle Weight'
                end
                object Label598: TLabel
                  Left = 24
                  Top = 112
                  Width = 132
                  Height = 13
                  Caption = #1054#1090#1083#1072#1076#1082#1072'  '#1087#1077#1088#1077#1076#1072#1095#1080' ECUID'
                end
                object Label601: TLabel
                  Left = 8
                  Top = 146
                  Width = 122
                  Height = 13
                  Caption = #1047#1072#1087#1088#1086#1089' ECUID '#1082#1086#1084#1091' DA '
                end
                object Button66: TButton
                  Left = 166
                  Top = 12
                  Width = 75
                  Height = 25
                  Caption = 'Cmd 129'
                  TabOrder = 0
                  OnClick = Button66Click
                end
                object Button67: TButton
                  Left = 166
                  Top = 44
                  Width = 75
                  Height = 25
                  Caption = 'Cmd 130'
                  TabOrder = 1
                  OnClick = Button67Click
                end
                object Edit361: TEdit
                  Left = 130
                  Top = 46
                  Width = 33
                  Height = 21
                  TabOrder = 2
                  Text = '255'
                end
                object Button68: TButton
                  Left = 166
                  Top = 76
                  Width = 75
                  Height = 25
                  Caption = 'Cmd 131'
                  TabOrder = 3
                  OnClick = Button68Click
                end
                object Button70: TButton
                  Left = 166
                  Top = 108
                  Width = 75
                  Height = 25
                  Caption = 'Cmd 132'
                  TabOrder = 4
                  OnClick = Button70Click
                end
                object Edit370: TEdit
                  Left = 130
                  Top = 142
                  Width = 33
                  Height = 21
                  TabOrder = 5
                  Text = '255'
                end
                object Button71: TButton
                  Left = 166
                  Top = 140
                  Width = 75
                  Height = 25
                  Caption = 'Cmd 133'
                  TabOrder = 6
                  OnClick = Button71Click
                end
                object GroupBox1108: TGroupBox
                  Left = 8
                  Top = 184
                  Width = 233
                  Height = 68
                  Caption = 'ELM OBDII'
                  TabOrder = 7
                  object ELMbut: TButton
                    Left = 96
                    Top = 32
                    Width = 129
                    Height = 25
                    Caption = #1054#1090#1082#1088#1099#1090#1100' '#1092#1086#1088#1084#1091' ELM'
                    TabOrder = 0
                    OnClick = ELMbutClick
                  end
                end
              end
              object GroupBox240: TGroupBox
                Left = 216
                Top = 262
                Width = 250
                Height = 99
                Caption = 'CFG Excel'
                TabOrder = 3
                object Button77: TButton
                  Left = 136
                  Top = 33
                  Width = 97
                  Height = 25
                  Caption = 'Make CFG Excel'
                  TabOrder = 0
                  OnClick = Button77Click
                end
                object ButtonXBR1: TButton
                  Left = 8
                  Top = 33
                  Width = 81
                  Height = 25
                  Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' Doc'
                  TabOrder = 1
                  OnClick = ButtonXBR1Click
                end
                object CheckBox318: TCheckBox
                  Left = 8
                  Top = 16
                  Width = 217
                  Height = 17
                  Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' CFG '#1073#1077#1079' '#1089#1074#1103#1079#1080' '#1089' '#1073#1083#1086#1082#1086#1084
                  TabOrder = 2
                end
                object Wr1: TButton
                  Left = 8
                  Top = 64
                  Width = 81
                  Height = 25
                  Caption = 'Make Report'
                  TabOrder = 3
                  OnClick = Wr1Click
                end
              end
              object GroupBox1104: TGroupBox
                Left = 4
                Top = 262
                Width = 204
                Height = 99
                TabOrder = 4
                object Label644: TLabel
                  Left = 8
                  Top = 16
                  Width = 82
                  Height = 13
                  Caption = #1041#1083#1086#1082#1080#1088#1086#1074#1082#1072' VIN'
                end
                object Label645: TLabel
                  Left = 8
                  Top = 43
                  Width = 107
                  Height = 13
                  Caption = #1057#1073#1088#1086#1089' '#1089#1072#1084#1086#1085#1072#1089#1090#1088#1086#1077#1082
                end
                object Label663: TLabel
                  Left = 8
                  Top = 70
                  Width = 99
                  Height = 13
                  Caption = #1059#1089#1090#1072#1085#1086#1074#1082#1072' '#1087#1088#1086#1073#1077#1075#1072
                end
                object Wr2: TButton
                  Left = 118
                  Top = 10
                  Width = 75
                  Height = 25
                  Caption = 'Cmd 48'
                  TabOrder = 0
                  OnClick = Button69Click
                end
                object Wr3: TButton
                  Left = 118
                  Top = 40
                  Width = 75
                  Height = 25
                  Caption = 'Cmd 49'
                  TabOrder = 1
                  OnClick = Button69Click
                end
                object Wr4: TButton
                  Left = 118
                  Top = 66
                  Width = 75
                  Height = 25
                  Caption = 'Cmd 71'
                  TabOrder = 2
                  OnClick = Button69Click
                end
              end
              object GroupBox146: TGroupBox
                Left = 4
                Top = 0
                Width = 205
                Height = 85
                Caption = #1057#1084#1077#1085#1072' '#1072#1076#1088#1077#1089#1072' CAN '
                TabOrder = 0
                object Button60: TButton
                  Left = 118
                  Top = 48
                  Width = 75
                  Height = 25
                  Caption = 'CAN Adres'
                  TabOrder = 0
                  OnClick = Button60Click
                end
                object GroupBox1109: TGroupBox
                  Left = 8
                  Top = 14
                  Width = 97
                  Height = 64
                  Caption = #1040#1076#1088#1077#1089
                  TabOrder = 1
                  object Label555: TLabel
                    Left = 8
                    Top = 18
                    Width = 19
                    Height = 13
                    Caption = ' Old'
                  end
                  object Label570: TLabel
                    Left = 72
                    Top = 18
                    Width = 20
                    Height = 13
                    Caption = 'PS1'
                  end
                  object Label595: TLabel
                    Left = 8
                    Top = 40
                    Width = 25
                    Height = 13
                    Caption = ' New'
                  end
                  object Label583: TLabel
                    Left = 72
                    Top = 40
                    Width = 15
                    Height = 13
                    Caption = '-----'
                  end
                  object Edit369: TEdit
                    Left = 32
                    Top = 14
                    Width = 33
                    Height = 21
                    TabOrder = 0
                  end
                  object Edit229: TEdit
                    Left = 32
                    Top = 38
                    Width = 33
                    Height = 21
                    TabOrder = 1
                    Text = '214'
                    OnChange = Edit229Change
                  end
                end
              end
              object CheckBox327: TCheckBox
                Left = 488
                Top = 4
                Width = 105
                Height = 17
                Caption = 'Pcb Test Enable'
                TabOrder = 5
                OnClick = CheckBox327Click
              end
            end
            object TabSheet28: TTabSheet
              Caption = 'Not Used'
              ImageIndex = 5
              object GroupBox31: TGroupBox
                Left = 8
                Top = 2
                Width = 225
                Height = 127
                Caption = #1050#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1103' OLD'
                TabOrder = 0
                object CheckBox26: TCheckBox
                  Left = 8
                  Top = 32
                  Width = 193
                  Height = 17
                  Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1090#1086#1088#1084#1086#1079#1072#1084#1080' '#1074#1082#1083#1102#1095#1077#1085#1086
                  TabOrder = 0
                  OnClick = ParamChange
                end
                object CheckBox35: TCheckBox
                  Left = 8
                  Top = 48
                  Width = 201
                  Height = 17
                  Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1076#1074#1080#1075#1072#1090#1077#1083#1077#1084' '#1074#1082#1083#1102#1095#1077#1085#1086
                  TabOrder = 1
                  OnClick = ParamChange
                end
                object CheckBox109: TCheckBox
                  Left = 8
                  Top = 64
                  Width = 169
                  Height = 17
                  Caption = #1060#1080#1083#1100#1090#1088#1072#1094#1080#1103' '#1084#1086#1084#1077#1085#1090#1072
                  TabOrder = 2
                  OnClick = ParamChange
                end
                object CheckBox111: TCheckBox
                  Left = 8
                  Top = 78
                  Width = 209
                  Height = 17
                  Caption = #1059#1084#1077#1085#1100#1096#1077#1085#1080#1077' '#1084#1086#1084#1077#1085#1090#1072' '#1085#1072' '#1087#1086#1074#1086#1088#1086#1090#1072#1093
                  TabOrder = 3
                  OnClick = ParamChange
                end
                object CheckBox122: TCheckBox
                  Left = 8
                  Top = 92
                  Width = 209
                  Height = 17
                  Caption = 'TSC '#1082#1086#1085#1090#1088#1086#1083#1100' '#1086#1073#1086#1088#1086#1090#1086#1074' '#1074#1082#1083#1102#1095#1077#1085
                  TabOrder = 4
                  OnClick = ParamChange
                end
                object CheckBox133: TCheckBox
                  Left = 8
                  Top = 106
                  Width = 209
                  Height = 17
                  Caption = 'TimeOut '#1074#1082#1083#1102#1095#1077#1085
                  TabOrder = 5
                  OnClick = ParamChange
                end
              end
              object GroupBox45: TGroupBox
                Left = 8
                Top = 138
                Width = 225
                Height = 34
                Caption = #1056#1077#1075#1091#1083#1103#1090#1086#1088' '#1058#1086#1088#1084#1086#1079#1085#1099#1093' '#1089#1080#1083
                TabOrder = 1
                object CheckBox41: TCheckBox
                  Left = 8
                  Top = 14
                  Width = 137
                  Height = 17
                  Caption = #1056#1077#1078#1080#1084' '#1080#1089#1087#1086#1083#1100#1079#1091#1077#1090#1089#1103' '
                  TabOrder = 0
                  OnClick = ParamChange
                end
              end
              object GroupBox217: TGroupBox
                Left = 12
                Top = 182
                Width = 221
                Height = 51
                Caption = 'Not Used'
                TabOrder = 2
              end
              object Button74: TButton
                Left = 440
                Top = 192
                Width = 75
                Height = 25
                Caption = 'Button74'
                TabOrder = 3
              end
              object ELM2: TButton
                Left = 440
                Top = 248
                Width = 75
                Height = 25
                Caption = 'ELM2'
                TabOrder = 4
                OnClick = ELM2Click
              end
            end
            object TabSheet29: TTabSheet
              Caption = 'AGS'
              ImageIndex = 6
              object Label640: TLabel
                Left = 496
                Top = 256
                Width = 44
                Height = 13
                Caption = 'Label640'
                Color = clBtnFace
                ParentColor = False
              end
              object Label649: TLabel
                Left = 168
                Top = 196
                Width = 43
                Height = 13
                Caption = 'Chip ICM'
              end
              object GroupBox226: TGroupBox
                Left = 0
                Top = 268
                Width = 595
                Height = 100
                Caption = 'Up Grade'
                TabOrder = 0
                object Label615: TLabel
                  Left = 4
                  Top = 16
                  Width = 16
                  Height = 13
                  Caption = 'File'
                end
                object SpeedButton4: TSpeedButton
                  Left = 336
                  Top = 66
                  Width = 73
                  Height = 25
                  Cursor = crHandPoint
                  AllowAllUp = True
                  GroupIndex = 5
                  Caption = #1057#1090#1072#1088#1090
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  OnClick = SpeedButton4Click
                end
                object Label616: TLabel
                  Left = 272
                  Top = 40
                  Width = 20
                  Height = 13
                  Caption = 'Size'
                end
                object Label617: TLabel
                  Left = 168
                  Top = 40
                  Width = 22
                  Height = 13
                  Caption = 'CRC'
                end
                object btn2: TSpeedButton
                  Left = 248
                  Top = 66
                  Width = 73
                  Height = 25
                  Cursor = crHandPoint
                  AllowAllUp = True
                  GroupIndex = 5
                  Caption = 'MAKE'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  OnClick = btn2Click
                end
                object Button80: TButton
                  Left = 8
                  Top = 66
                  Width = 73
                  Height = 25
                  Caption = 'Load File'
                  TabOrder = 0
                  OnClick = Button80Click
                end
                object Edit381: TEdit
                  Left = 293
                  Top = 38
                  Width = 44
                  Height = 21
                  TabOrder = 1
                end
                object Edit382: TEdit
                  Left = 339
                  Top = 38
                  Width = 30
                  Height = 21
                  TabOrder = 2
                  Text = '1024'
                end
                object Edit383: TEdit
                  Left = 192
                  Top = 38
                  Width = 75
                  Height = 21
                  TabOrder = 3
                  OnDblClick = Edit383DblClick
                end
                object Memo4: TMemo
                  Left = 416
                  Top = 9
                  Width = 174
                  Height = 85
                  Lines.Strings = (
                    '')
                  ScrollBars = ssVertical
                  TabOrder = 4
                end
                object Edit384: TEdit
                  Left = 24
                  Top = 14
                  Width = 385
                  Height = 21
                  TabOrder = 5
                  Text = 
                    'F:\!!!2023_Projekt\CAN_USB_Adapter\stm103_v01\Debug\stm103_v01.b' +
                    'in'
                  OnDblClick = Edit384DblClick
                end
                object chk1: TCheckBox
                  Left = 8
                  Top = 40
                  Width = 113
                  Height = 17
                  Caption = 'Adapter ABS SKU'
                  TabOrder = 6
                  OnClick = chk1Click
                end
                object Edit461: TEdit
                  Left = 88
                  Top = 69
                  Width = 159
                  Height = 21
                  TabOrder = 7
                  Text = '39FF71065041393443330143'
                end
              end
              object GroupBox227: TGroupBox
                Left = 478
                Top = 0
                Width = 113
                Height = 249
                Caption = 'CFG'
                TabOrder = 1
                object lbl1: TLabel
                  Left = 16
                  Top = 42
                  Width = 38
                  Height = 13
                  Caption = 'Address'
                end
                object Label619: TLabel
                  Left = 8
                  Top = 18
                  Width = 22
                  Height = 13
                  Caption = 'CRC'
                end
                object Button81: TButton
                  Left = 20
                  Top = 184
                  Width = 73
                  Height = 25
                  Caption = 'Dump'
                  TabOrder = 0
                  OnClick = Button81Click
                end
                object Edit385: TEdit
                  Left = 56
                  Top = 40
                  Width = 35
                  Height = 21
                  TabOrder = 1
                  Text = '7C00'
                end
                object Edit386: TEdit
                  Left = 32
                  Top = 14
                  Width = 74
                  Height = 21
                  TabOrder = 2
                  OnDblClick = Edit386DblClick
                end
                object WrCFG: TButton
                  Left = 20
                  Top = 216
                  Width = 73
                  Height = 25
                  Caption = 'WRITE'
                  TabOrder = 3
                  OnClick = WrCFGClick
                end
                object RdCFG: TButton
                  Left = 20
                  Top = 152
                  Width = 73
                  Height = 25
                  Caption = 'READ'
                  TabOrder = 4
                  OnClick = RdCFGClick
                end
                object GroupBox230: TGroupBox
                  Left = 8
                  Top = 58
                  Width = 98
                  Height = 57
                  Caption = 'Size'
                  TabOrder = 5
                  object lbl2: TLabel
                    Left = 8
                    Top = 14
                    Width = 68
                    Height = 13
                    Caption = 'Flash            K'
                  end
                  object lbl4: TLabel
                    Left = 8
                    Top = 32
                    Width = 25
                    Height = 13
                    Caption = 'Page'
                  end
                  object Edit389: TEdit
                    Left = 36
                    Top = 10
                    Width = 33
                    Height = 21
                    TabOrder = 0
                  end
                  object Edit391: TEdit
                    Left = 36
                    Top = 30
                    Width = 33
                    Height = 21
                    TabOrder = 1
                  end
                end
                object GroupBox235: TGroupBox
                  Left = 8
                  Top = 116
                  Width = 98
                  Height = 31
                  Caption = #1057#1095#1077#1090#1095#1080#1082' '#1079#1072#1087#1080#1089#1077#1081
                  TabOrder = 6
                  object Label618: TLabel
                    Left = 28
                    Top = 14
                    Width = 18
                    Height = 13
                    Caption = '------'
                  end
                end
              end
              object GroupBox232: TGroupBox
                Left = 0
                Top = 0
                Width = 158
                Height = 268
                Caption = #1044#1072#1085#1085#1099#1077' AGS'
                TabOrder = 2
                object GroupBox231: TGroupBox
                  Left = 8
                  Top = 13
                  Width = 142
                  Height = 41
                  Caption = 'Decimal Number'
                  TabOrder = 0
                  object Edit393: TEdit
                    Left = 24
                    Top = 14
                    Width = 105
                    Height = 21
                    TabOrder = 0
                  end
                end
                object GroupBox229: TGroupBox
                  Left = 8
                  Top = 166
                  Width = 142
                  Height = 96
                  Caption = 'Chip'
                  TabOrder = 1
                  object lbl3: TLabel
                    Left = 20
                    Top = 15
                    Width = 100
                    Height = 13
                    Caption = 'ID                Rev       '
                  end
                  object Edit388: TEdit
                    Left = 32
                    Top = 12
                    Width = 44
                    Height = 21
                    TabOrder = 0
                  end
                  object Edit390: TEdit
                    Left = 102
                    Top = 12
                    Width = 33
                    Height = 21
                    TabOrder = 1
                  end
                  object GroupBox228: TGroupBox
                    Left = 8
                    Top = 32
                    Width = 127
                    Height = 58
                    Caption = 'UID'
                    TabOrder = 2
                    object Label620: TLabel
                      Left = 8
                      Top = 14
                      Width = 24
                      Height = 13
                      Caption = 'WAF'
                    end
                    object Label621: TLabel
                      Left = 8
                      Top = 34
                      Width = 21
                      Height = 13
                      Caption = 'LOT'
                    end
                    object Edit387: TEdit
                      Left = 32
                      Top = 10
                      Width = 84
                      Height = 21
                      TabOrder = 0
                    end
                    object Edit392: TEdit
                      Left = 32
                      Top = 32
                      Width = 84
                      Height = 21
                      TabOrder = 1
                    end
                  end
                end
                object GroupBox234: TGroupBox
                  Left = 8
                  Top = 54
                  Width = 142
                  Height = 112
                  TabOrder = 2
                  object Label624: TLabel
                    Left = 24
                    Top = 12
                    Width = 52
                    Height = 13
                    Caption = #1053#1086#1084#1077#1088' SN'
                  end
                  object Label625: TLabel
                    Left = 8
                    Top = 32
                    Width = 72
                    Height = 13
                    Caption = #1044#1072#1090#1072' '#1074#1099#1087#1091#1089#1082#1072
                  end
                  object GroupBox233: TGroupBox
                    Left = 8
                    Top = 48
                    Width = 126
                    Height = 58
                    Caption = #1055#1054
                    TabOrder = 0
                    object Label622: TLabel
                      Left = 16
                      Top = 34
                      Width = 22
                      Height = 13
                      Caption = 'CRC'
                    end
                    object Label623: TLabel
                      Left = 4
                      Top = 14
                      Width = 40
                      Height = 13
                      Caption = #1042#1077#1088#1089#1080#1103' '
                    end
                    object Edit394: TEdit
                      Left = 44
                      Top = 10
                      Width = 73
                      Height = 21
                      TabOrder = 0
                    end
                    object Edit395: TEdit
                      Left = 44
                      Top = 32
                      Width = 74
                      Height = 21
                      TabOrder = 1
                    end
                  end
                  object Edit396: TEdit
                    Left = 84
                    Top = 30
                    Width = 49
                    Height = 21
                    TabOrder = 1
                  end
                  object Edit397: TEdit
                    Left = 84
                    Top = 9
                    Width = 49
                    Height = 21
                    TabOrder = 2
                    OnDblClick = Edit397DblClick
                  end
                end
              end
              object GroupBox225: TGroupBox
                Left = 164
                Top = 217
                Width = 245
                Height = 51
                Caption = #1042#1074#1086#1076' '#1085#1086#1084#1077#1088#1072' SN'
                TabOrder = 3
                OnDblClick = GroupBox225DblClick
                object CheckBox319: TCheckBox
                  Left = 8
                  Top = 31
                  Width = 121
                  Height = 17
                  Caption = #1048#1085#1082#1088#1077#1084#1077#1085#1090' '#1085#1086#1084#1077#1088#1072' '
                  TabOrder = 4
                end
                object chk2: TCheckBox
                  Left = 8
                  Top = 15
                  Width = 113
                  Height = 17
                  Caption = #1055#1072#1088#1090#1080#1103'              SN         '
                  TabOrder = 2
                  OnClick = chk2Click
                end
                object Edit399: TEdit
                  Left = 66
                  Top = 13
                  Width = 33
                  Height = 21
                  TabOrder = 0
                end
                object Edit400: TEdit
                  Left = 122
                  Top = 13
                  Width = 49
                  Height = 21
                  TabOrder = 1
                end
                object WrNum: TButton
                  Left = 180
                  Top = 18
                  Width = 56
                  Height = 25
                  Caption = 'Save'
                  TabOrder = 3
                  OnClick = WrNumClick
                end
              end
              object GroupBox1100: TGroupBox
                Left = 164
                Top = 0
                Width = 245
                Height = 188
                Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' AGS'
                TabOrder = 4
                object GroupBox1101: TGroupBox
                  Left = 8
                  Top = 12
                  Width = 153
                  Height = 170
                  Caption = 'Config_1'
                  TabOrder = 0
                  object Label662: TLabel
                    Left = 48
                    Top = 14
                    Width = 71
                    Height = 13
                    Caption = 'SKU         AGS'
                  end
                  object CheckBox320: TCheckBox
                    Left = 8
                    Top = 30
                    Width = 65
                    Height = 17
                    Caption = 'ST_IniOn'
                    TabOrder = 0
                    OnClick = CheckBox320Click
                  end
                  object CheckBox321: TCheckBox
                    Left = 8
                    Top = 46
                    Width = 142
                    Height = 17
                    Caption = 'GX_OffSet              deg/c  '
                    TabOrder = 1
                    OnClick = CheckBox320Click
                  end
                  object CheckBox322: TCheckBox
                    Left = 8
                    Top = 66
                    Width = 142
                    Height = 17
                    Caption = 'GY_OffSet              deg/c'
                    TabOrder = 2
                    OnClick = CheckBox320Click
                  end
                  object CheckBox323: TCheckBox
                    Left = 8
                    Top = 86
                    Width = 142
                    Height = 17
                    Caption = 'GZ_OffSet              deg/c'
                    TabOrder = 3
                    OnClick = CheckBox320Click
                  end
                  object CheckBox324: TCheckBox
                    Left = 8
                    Top = 106
                    Width = 139
                    Height = 17
                    Caption = 'AX_OffSet               m/c2'
                    TabOrder = 4
                    OnClick = CheckBox320Click
                  end
                  object CheckBox325: TCheckBox
                    Left = 8
                    Top = 126
                    Width = 139
                    Height = 17
                    Caption = 'AY_OffSet               m/c2'
                    TabOrder = 5
                    OnClick = CheckBox320Click
                  end
                  object CheckBox326: TCheckBox
                    Left = 8
                    Top = 146
                    Width = 139
                    Height = 17
                    Caption = 'AZ_OffSet               m/c2'
                    TabOrder = 6
                    OnClick = CheckBox320Click
                  end
                  object Edit407: TEdit
                    Left = 80
                    Top = 44
                    Width = 40
                    Height = 21
                    TabOrder = 7
                    Text = ' '
                    OnChange = Edit407Change
                  end
                  object Edit408: TEdit
                    Left = 80
                    Top = 64
                    Width = 40
                    Height = 21
                    TabOrder = 8
                    Text = ' '
                    OnChange = Edit407Change
                  end
                  object Edit409: TEdit
                    Left = 80
                    Top = 84
                    Width = 40
                    Height = 21
                    TabOrder = 9
                    Text = ' '
                    OnChange = Edit407Change
                  end
                  object Edit410: TEdit
                    Left = 80
                    Top = 104
                    Width = 40
                    Height = 21
                    TabOrder = 10
                    OnChange = Edit407Change
                  end
                  object Edit411: TEdit
                    Left = 80
                    Top = 124
                    Width = 40
                    Height = 21
                    TabOrder = 11
                    OnChange = Edit407Change
                  end
                  object Edit412: TEdit
                    Left = 80
                    Top = 144
                    Width = 40
                    Height = 21
                    TabOrder = 12
                    OnChange = Edit407Change
                  end
                  object Edit414: TEdit
                    Left = 72
                    Top = 10
                    Width = 25
                    Height = 21
                    TabOrder = 13
                  end
                  object Edit424: TEdit
                    Left = 120
                    Top = 10
                    Width = 25
                    Height = 21
                    TabOrder = 14
                  end
                end
              end
              object GroupBox1102: TGroupBox
                Left = 416
                Top = 217
                Width = 57
                Height = 53
                Caption = 'Error'
                TabOrder = 5
                object Label641: TLabel
                  Left = 8
                  Top = 16
                  Width = 12
                  Height = 13
                  Caption = 'Lo'
                end
                object Label642: TLabel
                  Left = 8
                  Top = 32
                  Width = 10
                  Height = 13
                  Caption = 'Hi'
                end
                object Edit406: TEdit
                  Left = 26
                  Top = 13
                  Width = 25
                  Height = 21
                  TabOrder = 0
                end
                object Edit413: TEdit
                  Left = 26
                  Top = 29
                  Width = 25
                  Height = 21
                  TabOrder = 1
                end
              end
              object GroupBox1105: TGroupBox
                Left = 416
                Top = 152
                Width = 57
                Height = 65
                Caption = 'TEMP'
                TabOrder = 6
                object Label647: TLabel
                  Left = 4
                  Top = 40
                  Width = 19
                  Height = 13
                  Caption = 'IAM'
                end
                object Label648: TLabel
                  Left = 2
                  Top = 18
                  Width = 23
                  Height = 13
                  Caption = 'STM'
                end
                object Edit415: TEdit
                  Left = 26
                  Top = 36
                  Width = 25
                  Height = 21
                  TabOrder = 0
                end
                object Edit416: TEdit
                  Left = 26
                  Top = 14
                  Width = 25
                  Height = 21
                  TabOrder = 1
                end
              end
              object Edit417: TEdit
                Left = 220
                Top = 193
                Width = 77
                Height = 21
                TabOrder = 7
                OnDblClick = Edit397DblClick
              end
            end
            object TabSheet32: TTabSheet
              Caption = 'SAS'
              ImageIndex = 8
              object Label686: TLabel
                Left = 496
                Top = 256
                Width = 44
                Height = 13
                Caption = 'Label686'
                Color = clBtnFace
                ParentColor = False
              end
              object GroupBox26: TGroupBox
                Left = -1
                Top = 268
                Width = 595
                Height = 100
                Caption = 'Up Grade'
                TabOrder = 0
                object Label669: TLabel
                  Left = 4
                  Top = 16
                  Width = 16
                  Height = 13
                  Caption = 'File'
                end
                object SpeedButton5: TSpeedButton
                  Left = 336
                  Top = 66
                  Width = 73
                  Height = 25
                  Cursor = crHandPoint
                  AllowAllUp = True
                  GroupIndex = 5
                  Caption = #1057#1090#1072#1088#1090
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  OnClick = SpeedButton5Click
                end
                object Label670: TLabel
                  Left = 232
                  Top = 40
                  Width = 20
                  Height = 13
                  Caption = 'Size'
                end
                object Label671: TLabel
                  Left = 128
                  Top = 40
                  Width = 22
                  Height = 13
                  Caption = 'CRC'
                end
                object SpeedButton6: TSpeedButton
                  Left = 240
                  Top = 66
                  Width = 73
                  Height = 25
                  Cursor = crHandPoint
                  AllowAllUp = True
                  GroupIndex = 5
                  Caption = 'MAKE'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  OnClick = btn2Click
                end
                object SAS_File: TButton
                  Left = 16
                  Top = 66
                  Width = 73
                  Height = 25
                  Caption = 'Load File'
                  TabOrder = 0
                  OnClick = SAS_FileClick
                end
                object Edit428: TEdit
                  Left = 253
                  Top = 38
                  Width = 44
                  Height = 21
                  TabOrder = 1
                end
                object Edit429: TEdit
                  Left = 299
                  Top = 38
                  Width = 30
                  Height = 21
                  TabOrder = 2
                  Text = '1024'
                end
                object Edit430: TEdit
                  Left = 152
                  Top = 38
                  Width = 75
                  Height = 21
                  TabOrder = 3
                  OnDblClick = Edit430DblClick
                end
                object Memo5: TMemo
                  Left = 504
                  Top = 89
                  Width = 174
                  Height = 85
                  Lines.Strings = (
                    '')
                  ScrollBars = ssVertical
                  TabOrder = 4
                end
                object Edit431: TEdit
                  Left = 24
                  Top = 14
                  Width = 385
                  Height = 21
                  TabOrder = 5
                  Text = 
                    'F:\!!!2023_Projekt\CAN_USB_Adapter\stm103_v01\Debug\stm103_v01.b' +
                    'in'
                  OnDblClick = Edit384DblClick
                end
                object CheckBox336: TCheckBox
                  Left = 8
                  Top = 40
                  Width = 113
                  Height = 17
                  Caption = 'Adapter ABS SKU'
                  TabOrder = 6
                  OnClick = CheckBox336Click
                end
              end
              object GroupBox32: TGroupBox
                Left = 0
                Top = 0
                Width = 158
                Height = 268
                Caption = #1044#1072#1085#1085#1099#1077' SAS'
                TabOrder = 1
                object GroupBox241: TGroupBox
                  Left = 8
                  Top = 13
                  Width = 142
                  Height = 41
                  Caption = 'Decimal Number'
                  TabOrder = 0
                  object Edit432: TEdit
                    Left = 24
                    Top = 14
                    Width = 105
                    Height = 21
                    TabOrder = 0
                  end
                end
                object GroupBox242: TGroupBox
                  Left = 8
                  Top = 166
                  Width = 142
                  Height = 96
                  Caption = 'Chip'
                  TabOrder = 1
                  object Label672: TLabel
                    Left = 20
                    Top = 15
                    Width = 100
                    Height = 13
                    Caption = 'ID                Rev       '
                  end
                  object Edit433: TEdit
                    Left = 32
                    Top = 12
                    Width = 44
                    Height = 21
                    TabOrder = 0
                  end
                  object Edit434: TEdit
                    Left = 102
                    Top = 12
                    Width = 33
                    Height = 21
                    TabOrder = 1
                  end
                  object GroupBox243: TGroupBox
                    Left = 8
                    Top = 32
                    Width = 127
                    Height = 58
                    Caption = 'UID'
                    TabOrder = 2
                    object Label673: TLabel
                      Left = 8
                      Top = 14
                      Width = 24
                      Height = 13
                      Caption = 'WAF'
                    end
                    object Label674: TLabel
                      Left = 8
                      Top = 34
                      Width = 21
                      Height = 13
                      Caption = 'LOT'
                    end
                    object Edit435: TEdit
                      Left = 32
                      Top = 10
                      Width = 84
                      Height = 21
                      TabOrder = 0
                    end
                    object Edit436: TEdit
                      Left = 32
                      Top = 32
                      Width = 84
                      Height = 21
                      TabOrder = 1
                    end
                  end
                end
                object GroupBox244: TGroupBox
                  Left = 8
                  Top = 54
                  Width = 142
                  Height = 112
                  TabOrder = 2
                  object Label675: TLabel
                    Left = 24
                    Top = 12
                    Width = 52
                    Height = 13
                    Caption = #1053#1086#1084#1077#1088' SN'
                  end
                  object Label676: TLabel
                    Left = 8
                    Top = 32
                    Width = 72
                    Height = 13
                    Caption = #1044#1072#1090#1072' '#1074#1099#1087#1091#1089#1082#1072
                  end
                  object GroupBox245: TGroupBox
                    Left = 8
                    Top = 48
                    Width = 126
                    Height = 58
                    Caption = #1055#1054
                    TabOrder = 0
                    object Label677: TLabel
                      Left = 16
                      Top = 34
                      Width = 22
                      Height = 13
                      Caption = 'CRC'
                    end
                    object Label678: TLabel
                      Left = 4
                      Top = 14
                      Width = 40
                      Height = 13
                      Caption = #1042#1077#1088#1089#1080#1103' '
                    end
                    object Edit437: TEdit
                      Left = 44
                      Top = 10
                      Width = 73
                      Height = 21
                      TabOrder = 0
                    end
                    object Edit438: TEdit
                      Left = 44
                      Top = 32
                      Width = 74
                      Height = 21
                      TabOrder = 1
                      OnDblClick = Edit438DblClick
                    end
                  end
                  object Edit439: TEdit
                    Left = 84
                    Top = 30
                    Width = 49
                    Height = 21
                    TabOrder = 1
                  end
                  object Edit440: TEdit
                    Left = 84
                    Top = 9
                    Width = 49
                    Height = 21
                    TabOrder = 2
                    OnDblClick = Edit440DblClick
                  end
                end
              end
              object GroupBox246: TGroupBox
                Left = 478
                Top = 0
                Width = 113
                Height = 249
                Caption = 'CFG'
                TabOrder = 2
                object Label679: TLabel
                  Left = 16
                  Top = 42
                  Width = 38
                  Height = 13
                  Caption = 'Address'
                end
                object Label680: TLabel
                  Left = 8
                  Top = 18
                  Width = 22
                  Height = 13
                  Caption = 'CRC'
                end
                object Button41: TButton
                  Left = 20
                  Top = 184
                  Width = 73
                  Height = 25
                  Caption = 'Dump'
                  TabOrder = 0
                  OnClick = Button41Click
                end
                object Edit441: TEdit
                  Left = 56
                  Top = 40
                  Width = 35
                  Height = 21
                  TabOrder = 1
                  Text = '7C00'
                end
                object Edit442: TEdit
                  Left = 32
                  Top = 14
                  Width = 74
                  Height = 21
                  TabOrder = 2
                  OnDblClick = Edit386DblClick
                end
                object btnWrCFGSAS: TButton
                  Left = 20
                  Top = 216
                  Width = 73
                  Height = 25
                  Caption = 'WRITE'
                  TabOrder = 3
                  OnClick = btnWrCFGSASClick
                end
                object RdCFGSAS: TButton
                  Left = 20
                  Top = 152
                  Width = 73
                  Height = 25
                  Caption = 'READ'
                  TabOrder = 4
                  OnClick = RdCFGSASClick
                end
                object GroupBox247: TGroupBox
                  Left = 8
                  Top = 58
                  Width = 98
                  Height = 57
                  Caption = 'Size'
                  TabOrder = 5
                  object Label681: TLabel
                    Left = 8
                    Top = 14
                    Width = 68
                    Height = 13
                    Caption = 'Flash            K'
                  end
                  object Label682: TLabel
                    Left = 8
                    Top = 32
                    Width = 25
                    Height = 13
                    Caption = 'Page'
                  end
                  object Edit443: TEdit
                    Left = 36
                    Top = 10
                    Width = 33
                    Height = 21
                    TabOrder = 0
                  end
                  object Edit444: TEdit
                    Left = 36
                    Top = 30
                    Width = 33
                    Height = 21
                    TabOrder = 1
                  end
                end
                object GroupBox248: TGroupBox
                  Left = 8
                  Top = 116
                  Width = 98
                  Height = 31
                  Caption = #1057#1095#1077#1090#1095#1080#1082' '#1079#1072#1087#1080#1089#1077#1081
                  TabOrder = 6
                  object Label683: TLabel
                    Left = 28
                    Top = 14
                    Width = 18
                    Height = 13
                    Caption = '------'
                  end
                end
              end
              object GroupBox249: TGroupBox
                Left = 416
                Top = 217
                Width = 57
                Height = 53
                Caption = 'Error'
                TabOrder = 3
                object Label684: TLabel
                  Left = 8
                  Top = 16
                  Width = 12
                  Height = 13
                  Caption = 'Lo'
                end
                object Label685: TLabel
                  Left = 8
                  Top = 32
                  Width = 10
                  Height = 13
                  Caption = 'Hi'
                end
                object Edit445: TEdit
                  Left = 24
                  Top = 13
                  Width = 25
                  Height = 21
                  TabOrder = 0
                end
                object Edit446: TEdit
                  Left = 24
                  Top = 29
                  Width = 25
                  Height = 21
                  TabOrder = 1
                end
              end
              object GroupBox250: TGroupBox
                Left = 196
                Top = 56
                Width = 309
                Height = 217
                Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' SAS'
                TabOrder = 4
                object GroupBox251: TGroupBox
                  Left = 8
                  Top = 12
                  Width = 169
                  Height = 117
                  Caption = 'Config_1'
                  TabOrder = 0
                  object CheckBox338: TCheckBox
                    Left = 8
                    Top = 54
                    Width = 142
                    Height = 17
                    Caption = 'DA1_OffSet              dig '
                    TabOrder = 0
                    OnClick = CheckBox338Click
                  end
                  object CheckBox339: TCheckBox
                    Left = 8
                    Top = 74
                    Width = 142
                    Height = 17
                    Caption = 'DA2_OffSet              dig'
                    TabOrder = 1
                    OnClick = CheckBox338Click
                  end
                  object Edit447: TEdit
                    Left = 86
                    Top = 52
                    Width = 40
                    Height = 21
                    TabOrder = 2
                    Text = ' '
                    OnChange = Edit447Change
                  end
                  object Edit448: TEdit
                    Left = 86
                    Top = 72
                    Width = 40
                    Height = 21
                    TabOrder = 3
                    Text = ' '
                    OnChange = Edit447Change
                  end
                  object Edit454: TEdit
                    Left = 8
                    Top = 15
                    Width = 25
                    Height = 21
                    TabOrder = 4
                  end
                end
              end
              object GroupBox252: TGroupBox
                Left = 164
                Top = 217
                Width = 245
                Height = 51
                Caption = #1042#1074#1086#1076' '#1085#1086#1084#1077#1088#1072' SN'
                TabOrder = 5
                OnDblClick = GroupBox225DblClick
                object CheckBox344: TCheckBox
                  Left = 8
                  Top = 31
                  Width = 121
                  Height = 17
                  Caption = #1048#1085#1082#1088#1077#1084#1077#1085#1090' '#1085#1086#1084#1077#1088#1072' '
                  TabOrder = 4
                end
                object CheckBox345: TCheckBox
                  Left = 8
                  Top = 15
                  Width = 113
                  Height = 17
                  Caption = #1055#1072#1088#1090#1080#1103'              SN         '
                  TabOrder = 2
                  OnClick = CheckBox345Click
                end
                object Edit455: TEdit
                  Left = 66
                  Top = 13
                  Width = 33
                  Height = 21
                  TabOrder = 0
                end
                object Edit456: TEdit
                  Left = 122
                  Top = 13
                  Width = 49
                  Height = 21
                  TabOrder = 1
                end
                object Button78: TButton
                  Left = 180
                  Top = 18
                  Width = 56
                  Height = 25
                  Caption = 'Save'
                  TabOrder = 3
                  OnClick = Button78Click
                end
              end
            end
            object ts1: TTabSheet
              Caption = 'LIM'
              ImageIndex = 7
              object GroupBox1112: TGroupBox
                Left = 8
                Top = 98
                Width = 281
                Height = 47
                Caption = #1058#1072#1093#1086#1075#1088#1072#1092'  B7'
                TabOrder = 0
                object Label665: TLabel
                  Left = 168
                  Top = 19
                  Width = 38
                  Height = 13
                  Caption = 'Koef B7'
                end
                object CheckBox38: TCheckBox
                  Left = 8
                  Top = 18
                  Width = 145
                  Height = 17
                  Caption = #1058#1072#1093#1086#1075#1088#1072#1092' '#1080#1089#1087#1086#1083#1100#1079#1091#1077#1090#1089#1103'   '
                  TabOrder = 0
                  OnClick = ParamChange
                end
                object Edit31: TEdit
                  Left = 210
                  Top = 16
                  Width = 30
                  Height = 21
                  TabOrder = 1
                  Text = '225'
                  OnChange = ParamChange
                end
              end
              object GroupBox1113: TGroupBox
                Left = 8
                Top = 147
                Width = 281
                Height = 152
                Caption = #1055#1085#1077#1074#1084#1086#1094#1080#1083#1080#1085#1076#1088
                TabOrder = 1
                DesignSize = (
                  281
                  152)
                object Label135: TLabel
                  Left = 8
                  Top = 38
                  Width = 25
                  Height = 13
                  Caption = #1058#1080#1087'  '
                end
                object Label196: TLabel
                  Left = 24
                  Top = 68
                  Width = 13
                  Height = 13
                  Caption = 'Ku'
                end
                object Label197: TLabel
                  Left = 24
                  Top = 90
                  Width = 13
                  Height = 13
                  Caption = 'Ko'
                end
                object Label265: TLabel
                  Left = 88
                  Top = 68
                  Width = 19
                  Height = 13
                  Caption = 'dKu'
                end
                object Label194: TLabel
                  Left = 84
                  Top = 91
                  Width = 27
                  Height = 13
                  Caption = 'dKoD'
                end
                object Label195: TLabel
                  Left = 160
                  Top = 68
                  Width = 24
                  Height = 13
                  Caption = 'Kvolt'
                end
                object Label660: TLabel
                  Left = 160
                  Top = 91
                  Width = 22
                  Height = 13
                  Caption = 'Kper'
                end
                object Label661: TLabel
                  Left = 50
                  Top = 122
                  Width = 106
                  Height = 13
                  Caption = 'PWM period           mc'
                end
                object ComboBox4: TComboBox
                  Left = 32
                  Top = 38
                  Width = 193
                  Height = 21
                  Anchors = [akLeft, akTop, akRight]
                  DropDownCount = 6
                  ItemHeight = 13
                  TabOrder = 0
                  OnChange = ComboBox4Change
                  Items.Strings = (
                    #1058#1080#1087' '#1085#1077#1086#1087#1088#1077#1076#1077#1083#1077#1085
                    #1058#1080#1087' -1'
                    #1058#1080#1087' -2'
                    '')
                end
                object Edit34: TEdit
                  Left = 40
                  Top = 88
                  Width = 41
                  Height = 21
                  TabOrder = 1
                  Text = '7936'
                  OnChange = ParamChange
                end
                object Edit33: TEdit
                  Left = 40
                  Top = 64
                  Width = 30
                  Height = 21
                  TabOrder = 2
                  Text = '40'
                  OnChange = ParamChange
                end
                object Edit36: TEdit
                  Left = 112
                  Top = 64
                  Width = 30
                  Height = 21
                  TabOrder = 3
                  Text = '1'
                  OnChange = ParamChange
                end
                object Edit37: TEdit
                  Left = 112
                  Top = 88
                  Width = 30
                  Height = 21
                  TabOrder = 4
                  Text = '2'
                  OnChange = ParamChange
                end
                object Edit39: TEdit
                  Left = 192
                  Top = 64
                  Width = 30
                  Height = 21
                  TabOrder = 5
                  Text = '50'
                  OnChange = ParamChange
                end
                object CheckBox32: TCheckBox
                  Left = 8
                  Top = 16
                  Width = 153
                  Height = 17
                  Caption = #1055#1088#1086#1087'.'#1082#1083#1072#1087#1072#1085' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085
                  TabOrder = 6
                  OnClick = ParamChange
                end
                object Edit450: TEdit
                  Left = 192
                  Top = 88
                  Width = 30
                  Height = 21
                  TabOrder = 7
                  Text = '32'
                  OnChange = ParamChange
                end
                object Edit451: TEdit
                  Left = 112
                  Top = 120
                  Width = 30
                  Height = 21
                  TabOrder = 8
                  Text = '30'
                  OnChange = ParamChange
                end
              end
              object GroupBox1114: TGroupBox
                Left = 8
                Top = 3
                Width = 281
                Height = 93
                Caption = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1077' '#1089#1082#1086#1088#1086#1089#1090#1080
                TabOrder = 2
                object Label136: TLabel
                  Left = 8
                  Top = 30
                  Width = 177
                  Height = 13
                  Caption = #1042#1077#1083#1080#1095#1080#1085#1072' '#1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1086#1081' '#1089#1082#1086#1088#1086#1089#1090#1080
                end
                object Label137: TLabel
                  Left = 248
                  Top = 26
                  Width = 24
                  Height = 13
                  Caption = #1082#1084'/'#1095
                end
                object Label192: TLabel
                  Left = 144
                  Top = 48
                  Width = 3
                  Height = 13
                end
                object Label199: TLabel
                  Left = 248
                  Top = 46
                  Width = 24
                  Height = 13
                  Caption = #1082#1084'/'#1095
                end
                object Label254: TLabel
                  Left = 168
                  Top = 70
                  Width = 3
                  Height = 13
                end
                object CheckBoxLIM: TCheckBox
                  Left = 8
                  Top = 14
                  Width = 113
                  Height = 17
                  Caption = #1056#1077#1078#1080#1084' '#1074#1082#1083#1102#1095#1077#1085
                  TabOrder = 0
                  OnClick = ParamChange
                end
                object SpinEdit1: TSpinEdit
                  Left = 202
                  Top = 22
                  Width = 45
                  Height = 22
                  MaxValue = 120
                  MinValue = 40
                  TabOrder = 1
                  Value = 40
                  OnChange = ParamChange
                end
                object CheckBox43: TCheckBox
                  Left = 8
                  Top = 46
                  Width = 193
                  Height = 17
                  Caption = 'TSET '#1080#1089#1087#1086#1083#1100#1079#1091#1077#1090#1089#1103'     TSET Vmin'
                  TabOrder = 2
                  OnClick = ParamChange
                end
                object SpinEdit2: TSpinEdit
                  Left = 202
                  Top = 44
                  Width = 45
                  Height = 22
                  MaxValue = 120
                  MinValue = 35
                  TabOrder = 3
                  Value = 35
                  OnChange = ParamChange
                end
              end
            end
          end
        end
      end
      object Button1: TButton
        Left = 16
        Top = 430
        Width = 75
        Height = 25
        Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100
        Enabled = False
        TabOrder = 1
        OnClick = Button1Click
      end
      object calibrSB: TStatusBar
        Left = 0
        Top = 461
        Width = 660
        Height = 25
        Panels = <>
        SimplePanel = True
      end
    end
    object TabSheet12: TTabSheet
      Caption = 'Programmer'
      ImageIndex = 8
      object Memo3: TMemo
        Left = 8
        Top = 24
        Width = 185
        Height = 257
        Lines.Strings = (
          'Memo3')
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object GroupBox89: TGroupBox
        Left = 200
        Top = 200
        Width = 457
        Height = 85
        Caption = #1055#1056#1054#1043#1056#1040#1052#1052#1048#1056#1054#1042#1040#1053#1048#1045'  STM 1'
        TabOrder = 1
        object Label327: TLabel
          Left = 16
          Top = 16
          Width = 26
          Height = 13
          Caption = #1092#1072#1081#1083
        end
        object SpeedButton1: TSpeedButton
          Left = 376
          Top = 51
          Width = 73
          Height = 25
          Cursor = crHandPoint
          AllowAllUp = True
          GroupIndex = 5
          Caption = #1057#1090#1072#1088#1090
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnClick = SpeedButton1Click
        end
        object Label339: TLabel
          Left = 96
          Top = 51
          Width = 42
          Height = 13
          Caption = '----          '
        end
        object Label340: TLabel
          Left = 96
          Top = 66
          Width = 30
          Height = 13
          Caption = '----      '
        end
        object Label341: TLabel
          Left = 208
          Top = 34
          Width = 52
          Height = 13
          Caption = 'CRC32--    '
        end
        object Button54: TButton
          Left = 8
          Top = 51
          Width = 73
          Height = 25
          Caption = 'Load File'
          TabOrder = 0
          OnClick = Button54Click
        end
        object Edit129: TEdit
          Left = 256
          Top = 34
          Width = 81
          Height = 21
          TabOrder = 1
        end
        object CheckBox332: TCheckBox
          Left = 256
          Top = 60
          Width = 62
          Height = 17
          Caption = 'Boot Up'
          TabOrder = 2
        end
        object CheckBox335: TCheckBox
          Left = 320
          Top = 60
          Width = 43
          Height = 17
          Caption = 'CAN'
          TabOrder = 3
        end
      end
      object GroupBox90: TGroupBox
        Left = 200
        Top = 116
        Width = 457
        Height = 81
        Caption = #1055#1056#1054#1043#1056#1040#1052#1052#1048#1056#1054#1042#1040#1053#1048#1045'  PA'
        TabOrder = 2
        object Label328: TLabel
          Left = 16
          Top = 16
          Width = 26
          Height = 13
          Caption = #1092#1072#1081#1083
        end
        object SpeedButton2: TSpeedButton
          Left = 376
          Top = 48
          Width = 73
          Height = 25
          Cursor = crHandPoint
          AllowAllUp = True
          GroupIndex = 5
          Caption = #1057#1090#1072#1088#1090
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnClick = SpeedButton2Click
        end
        object Label329: TLabel
          Left = 96
          Top = 34
          Width = 27
          Height = 13
          Caption = '----     '
        end
        object Label330: TLabel
          Left = 96
          Top = 64
          Width = 30
          Height = 13
          Caption = '----      '
        end
        object Label331: TLabel
          Left = 96
          Top = 49
          Width = 42
          Height = 13
          Caption = '----          '
        end
        object Label332: TLabel
          Left = 208
          Top = 50
          Width = 52
          Height = 13
          Caption = 'CRC32--    '
        end
        object Button55: TButton
          Left = 8
          Top = 48
          Width = 73
          Height = 25
          Caption = 'Load File'
          TabOrder = 0
          OnClick = Button55Click
        end
        object Edit130: TEdit
          Left = 256
          Top = 46
          Width = 81
          Height = 21
          TabOrder = 1
        end
      end
      object GroupBox91: TGroupBox
        Left = 200
        Top = 376
        Width = 457
        Height = 108
        Caption = #1055#1056#1054#1043#1056#1040#1052#1052#1048#1056#1054#1042#1040#1053#1048#1045'  GZ'
        TabOrder = 3
        object ProgStart: TSpeedButton
          Left = 376
          Top = 74
          Width = 73
          Height = 25
          Cursor = crHandPoint
          AllowAllUp = True
          GroupIndex = 5
          Caption = #1057#1090#1072#1088#1090
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnClick = ProgStartClick
        end
        object TestButton: TSpeedButton
          Left = 136
          Top = 74
          Width = 73
          Height = 25
          Cursor = crHandPoint
          AllowAllUp = True
          GroupIndex = 5
          Caption = 'Test'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnClick = TestButtonClick
        end
        object Button35: TButton
          Left = 8
          Top = 74
          Width = 73
          Height = 25
          Caption = 'Load File'
          TabOrder = 0
          OnClick = Button35Click
        end
        object GroupBox48: TGroupBox
          Left = 88
          Top = 32
          Width = 281
          Height = 40
          Caption = #1047#1040#1055#1048#1057#1068'  FLASH MOTOROLA GZ'
          TabOrder = 1
          Visible = False
          object Label213: TLabel
            Left = 168
            Top = 24
            Width = 3
            Height = 13
          end
          object Label214: TLabel
            Left = 168
            Top = 96
            Width = 3
            Height = 13
          end
          object ProgressBar1: TProgressBar
            Left = 8
            Top = 16
            Width = 265
            Height = 20
            TabOrder = 0
          end
        end
        object GroupBox44: TGroupBox
          Left = 8
          Top = 12
          Width = 433
          Height = 22
          Caption = 'File'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          object Label134: TLabel
            Left = 24
            Top = 8
            Width = 3
            Height = 13
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
        end
        object Button17: TButton
          Left = 240
          Top = 74
          Width = 65
          Height = 25
          Caption = 'Monitor'
          TabOrder = 3
          Visible = False
          OnClick = Button17Click
        end
      end
      object GroupBox92: TGroupBox
        Left = 200
        Top = 8
        Width = 457
        Height = 105
        Caption = #1055#1056#1054#1043#1056#1040#1052#1052#1048#1056#1054#1042#1040#1053#1048#1045'  DZ'
        TabOrder = 4
        object Label333: TLabel
          Left = 16
          Top = 16
          Width = 26
          Height = 13
          Caption = #1092#1072#1081#1083
        end
        object SpeedButton3: TSpeedButton
          Left = 376
          Top = 72
          Width = 73
          Height = 25
          Cursor = crHandPoint
          AllowAllUp = True
          GroupIndex = 5
          Caption = #1057#1090#1072#1088#1090
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnClick = SpeedButton3Click
        end
        object Label334: TLabel
          Left = 96
          Top = 54
          Width = 27
          Height = 13
          Caption = '----     '
        end
        object Label335: TLabel
          Left = 96
          Top = 88
          Width = 30
          Height = 13
          Caption = '----      '
        end
        object Label336: TLabel
          Left = 96
          Top = 73
          Width = 42
          Height = 13
          Caption = '----          '
        end
        object Label337: TLabel
          Left = 240
          Top = 74
          Width = 27
          Height = 13
          Caption = '----     '
        end
        object Label338: TLabel
          Left = 192
          Top = 54
          Width = 79
          Height = 13
          Caption = #1047#1072#1097#1080#1090#1072'  FLASH'
        end
        object Button56: TButton
          Left = 8
          Top = 72
          Width = 73
          Height = 25
          Caption = 'Load File'
          TabOrder = 0
          OnClick = Button56Click
        end
        object CheckBox134: TCheckBox
          Left = 224
          Top = 36
          Width = 137
          Height = 17
          Caption = #1053#1077' '#1079#1072#1087#1080#1089#1099#1074#1072#1090#1100' Config'
          TabOrder = 1
        end
        object CheckBox135: TCheckBox
          Left = 8
          Top = 36
          Width = 209
          Height = 17
          Caption = #1047#1072#1087#1080#1089#1100' '#1090#1086#1083#1100#1082#1086' '#1086#1073#1083#1072#1089#1090#1080' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
          TabOrder = 2
          OnClick = CheckBox135Click
        end
      end
      object CheckBox45: TCheckBox
        Left = 24
        Top = 4
        Width = 113
        Height = 17
        Caption = #1087#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1084#1077#1084#1086
        Checked = True
        State = cbChecked
        TabOrder = 5
        OnClick = CheckBox45Click
      end
      object GroupBox1110: TGroupBox
        Left = 200
        Top = 289
        Width = 457
        Height = 85
        Caption = #1055#1056#1054#1043#1056#1040#1052#1052#1048#1056#1054#1042#1040#1053#1048#1045'  STM 2'
        TabOrder = 6
        object Label664: TLabel
          Left = 16
          Top = 16
          Width = 26
          Height = 13
          Caption = #1092#1072#1081#1083
        end
        object btn1: TSpeedButton
          Left = 376
          Top = 51
          Width = 73
          Height = 25
          Cursor = crHandPoint
          AllowAllUp = True
          GroupIndex = 5
          Caption = #1057#1090#1072#1088#1090
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnClick = SpeedButton1Click
        end
        object Label666: TLabel
          Left = 96
          Top = 51
          Width = 42
          Height = 13
          Caption = '----          '
        end
        object Label667: TLabel
          Left = 96
          Top = 66
          Width = 30
          Height = 13
          Caption = '----      '
        end
        object Label668: TLabel
          Left = 208
          Top = 34
          Width = 52
          Height = 13
          Caption = 'CRC32--    '
        end
        object ELM1: TButton
          Left = 8
          Top = 51
          Width = 73
          Height = 25
          Caption = 'Load File'
          TabOrder = 0
          OnClick = Button54Click
        end
        object Edit426: TEdit
          Left = 256
          Top = 34
          Width = 81
          Height = 21
          TabOrder = 1
        end
        object chk3: TCheckBox
          Left = 256
          Top = 60
          Width = 62
          Height = 17
          Caption = 'Boot Up'
          TabOrder = 2
        end
        object CheckBox334: TCheckBox
          Left = 320
          Top = 60
          Width = 43
          Height = 17
          Caption = 'CAN'
          TabOrder = 3
        end
      end
      object GroupBox1115: TGroupBox
        Left = 8
        Top = 288
        Width = 185
        Height = 193
        TabOrder = 7
        object btn4: TSpeedButton
          Left = 24
          Top = 126
          Width = 33
          Height = 25
          Cursor = crHandPoint
          AllowAllUp = True
          GroupIndex = 5
          Caption = 'STM'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnClick = btn4Click
        end
        object btn5: TSpeedButton
          Left = 80
          Top = 126
          Width = 33
          Height = 25
          Cursor = crHandPoint
          AllowAllUp = True
          GroupIndex = 5
          Caption = 'DZ'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnClick = btn5Click
        end
        object btn6: TSpeedButton
          Left = 136
          Top = 126
          Width = 33
          Height = 25
          Cursor = crHandPoint
          AllowAllUp = True
          GroupIndex = 5
          Caption = 'PA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnClick = btn6Click
        end
        object btn3: TSpeedButton
          Left = 32
          Top = 160
          Width = 105
          Height = 25
          Cursor = crHandPoint
          AllowAllUp = True
          GroupIndex = 5
          Caption = 'MAKE SKU'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnClick = btn3Click
        end
        object rg2: TRadioGroup
          Left = 72
          Top = 60
          Width = 105
          Height = 65
          Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1072#1090#1086#1088
          Items.Strings = (
            #1089#1090#1072#1088#1072#1103' '#1087#1083#1072#1090#1072
            'CKU + DUE'
            'Edit')
          TabOrder = 0
          OnClick = rg2Click
        end
        object Prop1: TButton
          Left = 8
          Top = 80
          Width = 41
          Height = 25
          Caption = 'CHS'
          TabOrder = 1
          OnClick = Prop1Click
        end
        object GroupBox1116: TGroupBox
          Left = 72
          Top = 8
          Width = 105
          Height = 52
          Caption = 'Stend TuckSIM'
          TabOrder = 2
          object CheckBox340: TCheckBox
            Left = 8
            Top = 14
            Width = 81
            Height = 17
            Caption = 'Cod5bod 42'
            TabOrder = 0
          end
          object CheckBox337: TCheckBox
            Left = 8
            Top = 30
            Width = 65
            Height = 17
            Caption = 'NotEcho'
            TabOrder = 1
          end
        end
        object CheckBox351: TCheckBox
          Left = 8
          Top = 132
          Width = 17
          Height = 17
          Checked = True
          State = cbChecked
          TabOrder = 3
        end
        object CheckBox352: TCheckBox
          Left = 64
          Top = 132
          Width = 17
          Height = 17
          Checked = True
          State = cbChecked
          TabOrder = 4
        end
        object CheckBox353: TCheckBox
          Left = 122
          Top = 132
          Width = 17
          Height = 17
          TabOrder = 5
        end
      end
    end
  end
  object GroupBox187: TGroupBox
    Left = 256
    Top = -3
    Width = 121
    Height = 50
    TabOrder = 3
    Visible = False
    object Label562: TLabel
      Left = 15
      Top = 12
      Width = 83
      Height = 13
      Caption = 'Time[1]              c'
    end
    object Label563: TLabel
      Left = 4
      Top = 30
      Width = 110
      Height = 13
      Caption = 'Deccel[1]             m/c2'
    end
    object Edit241: TEdit
      Left = 56
      Top = 8
      Width = 33
      Height = 21
      TabOrder = 0
      Text = ' '
      OnChange = ParamChange
    end
    object Edit242: TEdit
      Left = 56
      Top = 27
      Width = 33
      Height = 21
      TabOrder = 1
      Text = ' '
      OnChange = ParamChange
    end
  end
  object Edit373: TEdit
    Left = 615
    Top = 36
    Width = 44
    Height = 21
    TabOrder = 4
    Text = 'Pcb Fail'
    Visible = False
  end
  object MainMenu1: TMainMenu
    Left = 624
    object mDiag: TMenuItem
      Caption = #1044#1080#1072#1075#1085#1086#1089#1090#1080#1082#1072
      object mStart: TMenuItem
        Caption = #1057#1090#1072#1088#1090
        OnClick = BtnStartClick
      end
      object mStop: TMenuItem
        Caption = #1057#1090#1086#1087
        Enabled = False
        OnClick = BtnStopClick
      end
      object mOtchet: TMenuItem
        Caption = #1057#1086#1079#1076#1072#1090#1100' '#1086#1090#1095#1077#1090
        Enabled = False
        OnClick = mOtchetClick
      end
      object mQuit: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        ShortCut = 16465
        OnClick = mQuitClick
      end
    end
    object N1: TMenuItem
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072
      object N3: TMenuItem
        Caption = #1042#1099#1073#1086#1088' '#1087#1086#1088#1090#1072
        OnClick = N3Click
      end
      object N4: TMenuItem
        Caption = #1055#1091#1090#1100' '#1082' '#1076#1072#1085#1085#1099#1084
        Enabled = False
        OnClick = N4Click
      end
      object nParametr: TMenuItem
        Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1080#1079#1072#1094#1080#1103' '#1073#1083#1086#1082#1072
        Enabled = False
        OnClick = btnParametrClick
      end
    end
    object N2: TMenuItem
      Caption = #1042#1099#1093#1086#1076
      OnClick = N2Click
    end
    object Help1: TMenuItem
      Caption = 'Help'
      Visible = False
      object mniWelcome: TMenuItem
        Caption = 'Welcome'
      end
      object AboutProgramm1: TMenuItem
        Caption = 'About Programm'
      end
      object HelpContents1: TMenuItem
        Caption = 'Help Contents'
      end
    end
  end
  object IL1: TImageList
    BlendColor = clFuchsia
    AllocBy = 0
    Masked = False
    Left = 448
    Bitmap = {
      494C010104000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      000000000000000000000000000000000000BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF0000000000BFBFBF00BFBFBF00FFFF
      FF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000000000000000000000000000
      000000000000000000000000000000000000BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF007F7F7F0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BFBFBF00BFBFBF00BFBFBF00BFBF
      BF007F7F7F0000000000FFFFFF00BFBFBF00BFBFBF0000000000BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF0000000000BFBFBF00BFBF
      BF0000000000BFBFBF00BFBFBF00BFBFBF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000BFBFBF00BFBFBF00BFBFBF000000
      0000BFBFBF00BFBFBF0000000000BFBFBF00BFBFBF00BFBFBF0000000000BFBF
      BF00BFBFBF00BFBFBF0000000000BFBFBF00BFBFBF0000000000BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF007F7F7F000000
      0000FFFFFF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000
      0000BFBFBF00BFBFBF0000000000BFBFBF00BFBFBF0000000000BFBFBF00BFBF
      BF0000000000BFBFBF0000000000BFBFBF00BFBFBF00BFBFBF0000000000BFBF
      BF0000000000BFBFBF00BFBFBF00BFBFBF0000000000BFBFBF00BFBFBF00BFBF
      BF0000000000BFBFBF00BFBFBF00BFBFBF000000000000000000000000000000
      000000000000BFBFBF00BFBFBF0000000000BFBFBF00BFBFBF00BFBFBF00BFBF
      BF0000000000BFBFBF00BFBFBF0000000000BFBFBF00BFBFBF00BFBFBF00BFBF
      BF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF007F7F7F0000000000FFFF
      FF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF007F7F7F0000000000FFFFFF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF0000000000BFBFBF00BFBFBF0000000000BFBFBF00BFBF
      BF00BFBFBF0000000000BFBFBF000000000000000000BFBFBF0000000000BFBF
      BF00BFBFBF0000000000BFBFBF00BFBFBF0000000000BFBFBF00BFBFBF00BFBF
      BF0000000000BFBFBF0000000000BFBFBF00BFBFBF0000000000BFBFBF00BFBF
      BF00BFBFBF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF0000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF0000000000BFBFBF0000000000BFBFBF00BFBF
      BF0000000000BFBFBF00BFBFBF0000000000BFBFBF00BFBFBF00BFBFBF000000
      0000BFBFBF0000000000BFBFBF00BFBFBF00BFBFBF0000000000BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF0000000000BFBFBF00BFBFBF00BFBF
      BF00BFBFBF000000000000000000000000000000000000000000BFBFBF00BFBF
      BF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF0000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF0000000000BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF0000000000BFBFBF00BFBFBF00BFBF
      BF00BFBFBF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF007F7F
      7F0000000000FFFFFF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF0000000000BFBFBF00BFBF
      BF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF0000000000BFBFBF00BFBF
      BF0000000000BFBFBF00BFBFBF0000000000BFBFBF00BFBFBF00BFBFBF000000
      0000BFBFBF00BFBFBF0000000000BFBFBF00BFBFBF0000000000BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF0000000000BFBFBF00BFBFBF0000000000BFBF
      BF00BFBFBF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF007F7F7F000000
      0000FFFFFF00BFBFBF00BFBFBF00BFBFBF00BFBFBF0000000000BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF0000000000BFBFBF00BFBFBF00BFBFBF000000
      0000BFBFBF00BFBFBF00BFBFBF0000000000BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF0000000000BFBFBF0000000000BFBF
      BF00BFBFBF00BFBFBF0000000000BFBFBF0000000000BFBFBF00BFBFBF00BFBF
      BF00BFBFBF007F7F7F0000000000FFFFFF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000
      0000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF0000000000BFBFBF00BFBF
      BF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF007F7F7F0000000000FFFFFF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF0000000000BFBFBF00BFBF
      BF0000000000BFBFBF0000000000BFBFBF00BFBFBF00BFBFBF0000000000BFBF
      BF0000000000BFBFBF00BFBFBF00BFBFBF0000000000BFBFBF00BFBFBF00BFBF
      BF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF007F7F7F000000
      0000FFFFFF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF0000000000BFBFBF00BFBFBF0000000000BFBFBF00BFBFBF00BFBFBF00BFBF
      BF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF007F7F
      7F0000000000FFFFFF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF0000000000BFBFBF00BFBF
      BF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000
      0000BFBFBF00BFBFBF0000000000BFBFBF00BFBFBF0000000000BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF0000000000BFBFBF00BFBFBF0000000000BFBF
      BF00BFBFBF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF007F7F7F000000
      0000FFFFFF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF007F7F7F0000000000FFFFFF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BFBFBF00BFBFBF0000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF007F7F7F0000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F7F7F007F7F7F007F7F7F007F7F7F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000007F0000007F0000007F0000007F000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000007F0000007F0000007F0000007F000000FF000000FF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000007F7F00007F7F00007F7F00007F7F0000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      7F0000007F0000007F0000007F0000007F0000007F0000007F0000007F000000
      FF000000FF00000000000000000000000000000000000000000000000000007F
      0000007F0000007F0000007F0000007F0000007F0000007F0000007F000000FF
      000000FF0000000000000000000000000000000000000000000000000000007F
      7F00007F7F00007F7F00007F7F00007F7F00007F7F00007F7F00007F7F0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      7F0000007F0000007F0000007F0000007F0000007F0000007F0000007F000000
      FF000000FF00000000000000000000000000000000000000000000000000007F
      0000007F0000007F0000007F0000007F0000007F0000007F0000007F000000FF
      000000FF0000000000000000000000000000000000000000000000000000007F
      7F00007F7F00007F7F00007F7F00007F7F00007F7F00007F7F00007F7F0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F00000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF0000007F0000007F0000007F0000007F0000007F000000
      7F0000007F000000FF0000000000000000000000000000FF000000FF000000FF
      000000FF000000FF0000007F0000007F0000007F0000007F0000007F0000007F
      0000007F000000FF000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00007F7F00007F7F00007F7F00007F7F00007F7F00007F
      7F00007F7F0000FFFF0000000000000000000000000000000000000000000000
      000000000000000000007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F00000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF0000007F0000007F0000007F0000007F0000007F000000
      7F0000007F000000FF0000000000000000000000000000FF000000FF000000FF
      000000FF000000FF0000007F0000007F0000007F0000007F0000007F0000007F
      0000007F000000FF000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00007F7F00007F7F00007F7F00007F7F00007F7F00007F
      7F00007F7F0000FFFF0000000000000000000000000000000000000000000000
      000000000000000000007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F00000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF0000007F0000007F0000007F0000007F0000007F000000
      7F0000007F000000FF0000000000000000000000000000FF000000FF000000FF
      000000FF000000FF0000007F0000007F0000007F0000007F0000007F0000007F
      0000007F000000FF000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00007F7F00007F7F00007F7F00007F7F00007F7F00007F
      7F00007F7F0000FFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF0000007F0000007F000000
      7F0000007F0000007F0000000000000000000000000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF0000007F0000007F0000007F
      0000007F0000007F000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00007F7F00007F7F00007F
      7F00007F7F00007F7F0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF0000007F0000007F000000
      7F0000007F0000007F0000000000000000000000000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF0000007F0000007F0000007F
      0000007F0000007F000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00007F7F00007F7F00007F
      7F00007F7F00007F7F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F007F7F7F007F7F7F000000000000000000000000000000FF000000FF000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      7F0000007F0000007F0000000000000000000000000000FF000000FF00000000
      0000000000000000000000FF000000FF000000FF000000FF000000FF0000007F
      0000007F0000007F000000000000000000000000000000FFFF0000FFFF000000
      0000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00007F
      7F00007F7F00007F7F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F007F7F7F000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000FF000000FF000000FF000000
      7F0000007F0000000000000000000000000000000000000000000000000000FF
      000000FF000000000000000000000000000000FF000000FF000000FF0000007F
      0000007F000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000000000000000000000000000FFFF0000FFFF0000FFFF00007F
      7F00007F7F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F007F7F7F000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000FF000000FF000000FF000000
      7F0000007F0000000000000000000000000000000000000000000000000000FF
      000000FF000000000000000000000000000000FF000000FF000000FF0000007F
      0000007F000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000000000000000000000000000FFFF0000FFFF0000FFFF00007F
      7F00007F7F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF000000FF000000FF000000FF000000FF000000FF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000F81FF81FF81FF81FF81FF81FF81FF81F
      E067E007E007E007801B800380038003801B8003800380037C04000000000000
      7C040000000000007C040000000000007F800000000000007F80000000000000
      7FE01C001C001C009FE38703870387039FE3870387038703E7E7E007E007E007
      F81FF81FF81FF81FF81FF81FF81FF81F00000000000000000000000000000000
      000000000000}
  end
  object IL3: TImageList
    Height = 32
    Width = 32
    Left = 496
    Bitmap = {
      494C010108000900040020002000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      00000000000036000000280000008000000060000000010020000000000000C0
      000000000000000000000000000000000000BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF007F7F7F007F7F7F007F7F7F00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F0000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F0000000000BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000FF000000FF00000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF0000FFFF000000
      00007F7F7F00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00FFFFFF007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F000000FF007F7F
      7F007F7F7F000000000000000000000000007F7F7F007F7F7F00000000000000
      0000000000007F7F7F007F7F7F0000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F000000000000000000000000000000
      00000000FF000000FF00000000000000FF000000FF0000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00007F7F00BFBFBF00000000007F7F
      7F00000000007F7F7F00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00FFFFFF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00BFBFBF00000000000000000000000000BFBFBF00BFBFBF00000000000000
      000000000000BFBFBF007F7F7F0000000000000000007F7F7F00000000000000
      000000000000000000000000000000000000000000000000000000FFFF000000
      00007F7F7F000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF0000FFFF00BFBFBF007F7F7F000000
      000000000000000000007F7F7F00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000
      0000FF0000000000000000000000000000000000000000000000BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00FFFFFF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00BFBFBF000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00000000000000
      000000000000000000000000000000000000007F7F0000000000000000007F7F
      7F00000000007F7F7F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00007F7F00BFBFBF00000000007F7F7F00000000000000
      00000000000000000000000000007F7F7F00BFBFBF00BFBFBF0000000000FF00
      0000FF000000FF000000FF000000FF000000FF00000000000000BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00FFFFFF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000FF000000
      FF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000FF00BFBF
      BF0000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000000000007F7F7F0000000000000000007F7F7F00000000000000
      00000000000000000000000000000000000000FFFF00000000007F7F7F000000
      000000000000000000007F7F7F00000000007F7F7F0000000000000000000000
      0000000000000000FF000000FF000000FF000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF0000FFFF00BFBFBF007F7F7F0000000000000000000000
      0000000000000000000000000000000000007F7F7F00BFBFBF00BFBFBF000000
      0000FF0000000000000000000000000000000000000000000000BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00FFFFFF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000FF000000FF000000
      FF000000FF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF0000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000000000007F7F7F0000000000000000007F7F7F00000000000000
      00000000000000000000007F7F0000000000000000007F7F7F00000000000000
      00000000000000000000000000007F7F7F000000000000000000000000000000
      00000000FF000000FF00000000000000FF000000FF0000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00BFBFBF00BFBF
      BF00007F7F00BFBFBF00000000007F7F7F000000000000000000000000000000
      0000000000000000000000000000BFBFBF0000000000BFBFBF00BFBFBF00BFBF
      BF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000
      000000000000000000007F7F7F0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000FF000000
      FF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF0000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000000000007F7F7F0000000000000000007F7F7F00000000000000
      0000000000000000000000FFFF00000000007F7F7F0000000000000000000000
      00000000000000000000000000000000000000FFFF00007F7F00000000000000
      FF000000FF000000000000000000000000000000FF000000FF00000000007F7F
      7F00007F7F00007F7F007F7F7F0000000000000000007F7F7F00BFBFBF00BFBF
      BF0000FFFF00BFBFBF007F7F7F00000000000000000000000000000000007F7F
      7F000000000000000000BFBFBF00BFBFBF0000FFFF00007F7F00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00007F7F00007F
      7F00007F7F00007F7F007F7F7F0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BFBFBF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000000000007F7F7F0000000000000000007F7F7F00000000000000
      0000007F7F0000000000000000007F7F7F000000000000000000000000000000
      0000000000000000000000000000BFBFBF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000007F7F00007F
      7F0000FFFF00000000007F7F7F0000000000000000007F7F7F00007F7F00BFBF
      BF00000000007F7F7F0000000000000000000000000000000000000000000000
      000000000000BFBFBF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00007F7F00007F
      7F0000FFFF00000000007F7F7F0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F0000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000000000007F7F7F0000000000000000007F7F7F00000000000000
      000000FFFF00000000007F7F7F00000000000000000000000000000000007F7F
      7F000000000000000000BFBFBF00000000000000000000000000000000000000
      00000000000000000000000000007F7F7F00007F7F00007F7F00BFBFBF00007F
      7F0000000000007F7F007F7F7F0000000000000000007F7F7F0000FFFF00BFBF
      BF007F7F7F00000000000000000000000000000000007F7F7F00000000000000
      0000BFBFBF00BFBFBF0000FFFF00007F7F00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF007F7F7F00007F7F00007F7F00BFBFBF00007F
      7F0000000000007F7F007F7F7F0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F00000000000000000000000000000000007F7F7F007F7F
      7F0000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000000000007F7F7F0000000000000000007F7F7F00007F7F000000
      0000000000007F7F7F0000000000000000000000000000000000000000000000
      000000000000BFBFBF0000000000000000000000000000000000000000000000
      0000000000000000000000000000007F7F00BFBFBF00BFBFBF00007F7F000000
      0000007F7F00000000007F7F7F0000000000000000007F7F7F00000000007F7F
      7F00000000000000000000000000000000007F7F7F000000000000000000BFBF
      BF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00007F7F00BFBFBF00BFBFBF00007F7F000000
      0000007F7F00000000007F7F7F0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000007F7F7F0000FF
      000000FF00007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F000000000000000000000000000000000000000000000000007F7F
      7F0000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000000000007F7F7F0000000000000000007F7F7F0000FFFF000000
      00007F7F7F00000000000000000000000000000000007F7F7F00000000000000
      0000BFBFBF000000000000FFFF00007F7F000000000000000000000000000000
      0000000000000000000000000000007F7F00BFBFBF00007F7F0000000000007F
      7F0000000000000000007F7F7F0000000000000000007F7F7F00BFBFBF000000
      00000000000000000000000000007F7F7F000000000000000000BFBFBF00BFBF
      BF0000FFFF00007F7F00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00007F7F00BFBFBF00007F7F0000000000007F
      7F0000000000BFBFBF007F7F7F0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000007F7F7F0000FF
      000000FF00007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F00BFBFBF00BFBFBF00BFBFBF007F7F7F0000FF00007F7F
      7F0000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000000000007F7F7F0000000000000000007F7F7F00000000007F7F
      7F00000000000000000000000000000000007F7F7F000000000000000000BFBF
      BF00000000000000000000000000000000000000000000000000000000000000
      0000007F7F00007F7F00007F7F0000FFFF00007F7F0000000000007F7F000000
      000000000000000000007F7F7F0000000000000000007F7F7F00BFBFBF00BFBF
      BF000000000000000000000000000000000000000000BFBFBF0000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00007F7F00007F7F00007F7F0000FFFF00007F7F0000000000007F7F000000
      0000BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000000000007F7F7F0000000000000000007F7F7F00BFBFBF000000
      00000000000000000000000000007F7F7F000000000000000000BFBFBF000000
      000000FFFF00007F7F000000000000000000000000000000000000000000007F
      7F00BFBFBF00BFBFBF0000FFFF00007F7F0000000000007F7F00000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00BFBFBF00BFBF
      BF00BFBFBF00000000000000000000000000BFBFBF00BFBFBF0000FFFF00007F
      7F00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00007F
      7F00BFBFBF00BFBFBF0000FFFF00007F7F0000000000007F7F0000000000BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BFBFBF0000000000BFBF
      BF00BFBFBF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F000000000000000000007F7F0000000000000000
      00007F7F0000000000007F7F7F0000000000000000007F7F7F0000000000BFBF
      BF000000000000000000000000000000000000000000BFBFBF00000000000000
      000000000000000000000000000000000000000000000000000000000000007F
      7F0000FFFF0000FFFF00007F7F0000000000007F7F0000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF0000000000BFBFBF0000000000BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00007F
      7F0000FFFF0000FFFF00007F7F0000000000007F7F0000000000BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BFBFBF00BFBFBF000000
      00000000000000000000007F7F00BFBFBF00007F7F00007F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F0000000000BFBF
      BF00BFBFBF00000000000000000000000000BFBFBF000000000000000000BFBF
      BF0000000000000000007F7F7F0000000000000000007F7F7F00000000000000
      0000BFBFBF00000000000000000000000000BFBFBF000000000000FFFF00007F
      7F0000000000000000000000000000000000007F7F0000000000007F7F00BFBF
      BF0000FFFF00007F7F0000000000007F7F000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF007F007F0000FFFF00007F7F00BFBFBF00BFBF
      BF00007F7F00007F7F00007F7F00007F7F00007F7F0000000000007F7F00BFBF
      BF0000FFFF00007F7F0000000000007F7F0000000000BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF000000000000000000BFBFBF00BFBFBF00007F7F007F7F
      7F007F7F7F007F7F7F007F7F7F00000000000000000000000000000000000000
      000000000000BFBFBF0000000000BFBFBF00BFBFBF0000000000BFBFBF00BFBF
      BF0000000000BFBFBF007F7F7F0000000000000000007F7F7F00000000000000
      000000000000BFBFBF0000000000BFBFBF000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000FFFF0000FF
      FF00007F7F0000000000007F7F00000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00007F7F00007F
      7F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF0000FF
      FF00007F7F0000000000007F7F0000000000BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BFBFBF00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000000000007F7F7F00000000000000
      00000000000000000000BFBFBF007F007F0000FFFF00007F7F00000000000000
      0000007F7F00007F7F00007F7F00007F7F0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000007F7F0000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00007F7F00FFFFFF00FFFF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000007F7F0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BFBFBF00BFBFBF000000
      000000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF007F7F7F000000
      000000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000000000007F7F7F00000000000000
      0000000000000000000000000000000000000000000000000000007F7F00007F
      7F00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00007F7F000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00007F7F00FFFFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00007F7F0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BFBFBF00BFBFBF000000
      0000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF007F7F7F00BFBF
      BF000000000000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000000000007F7F7F00000000000000
      00000000000000000000000000000000000000000000007F7F00FFFFFF00FFFF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00007F7F000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00007F7F00FFFFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00007F7F0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BFBFBF00BFBFBF000000
      0000BFBFBF00BFBFBF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000BFBFBF007F7F7F00BFBF
      BF00BFBFBF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000000000007F7F7F00000000000000
      000000000000000000000000000000000000007F7F00FFFFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FFFF0000FFFF0000FF
      FF00007F7F000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00007F7F00FFFFFF0000FFFF0000FFFF0000FF
      FF000000000000FFFF000000000000FFFF000000000000FFFF0000FFFF0000FF
      FF00007F7F0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BFBFBF00BFBFBF000000
      0000BFBFBF00BFBFBF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000BFBFBF007F7F7F00BFBF
      BF00BFBFBF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000000000007F7F7F00000000000000
      000000000000000000000000000000000000007F7F00FFFFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00007F7F000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00007F7F00FFFFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000FFFF000000000000FFFF0000FFFF0000FFFF0000FF
      FF00007F7F0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BFBFBF00BFBFBF000000
      0000BFBFBF00BFBFBF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000BFBFBF007F7F7F00BFBF
      BF00BFBFBF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF0000000000BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000000000007F7F7F00000000000000
      0000000000000000000000000000007F7F00FFFFFF0000FFFF0000FFFF0000FF
      FF000000000000FFFF000000000000FFFF000000000000FFFF0000FFFF0000FF
      FF00007F7F000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00007F7F00FFFFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF000000000000FFFF000000000000FFFF0000FFFF0000FF
      FF00007F7F0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F00000000007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BFBFBF00BFBFBF000000
      0000BFBFBF00BFBFBF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000BFBFBF007F7F7F00BFBF
      BF00BFBFBF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000000000007F7F7F00000000000000
      0000000000000000000000000000007F7F00FFFFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000FFFF000000000000FFFF0000FFFF0000FFFF0000FF
      FF00007F7F000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00007F7F00FFFFFF0000FFFF00000000000000
      00000000000000FFFF0000FFFF000000000000FFFF0000FFFF0000FFFF0000FF
      FF00007F7F0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF007F7F7F00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF0000FFFF00BFBFBF00FFFF
      FF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00FFFFFF00BFBFBF00BFBFBF000000
      0000BFBFBF00BFBFBF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000BFBFBF007F7F7F00BFBF
      BF00BFBFBF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF0000000000BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000000000007F7F7F00000000000000
      0000000000000000000000000000007F7F00FFFFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF000000000000FFFF000000000000FFFF0000FFFF0000FF
      FF00007F7F000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00007F7F00FFFFFF000000000000FFFF0000FF
      FF00BFBFBF000000000000FFFF0000FFFF000000000000FFFF0000FFFF0000FF
      FF00007F7F0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF007F7F7F00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00007F7F00BFBFBF0000000000FFFFFF000000
      0000FFFFFF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00FFFFFF00BFBFBF00BFBFBF000000
      0000BFBFBF00BFBFBF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000BFBFBF007F7F7F00BFBF
      BF00BFBFBF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF0000000000BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000000000007F7F7F00000000000000
      0000000000000000000000000000007F7F00FFFFFF0000FFFF00000000000000
      00000000000000FFFF0000FFFF000000000000FFFF0000FFFF0000FFFF00007F
      7F00000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00007F7F00FFFFFF000000000000FFFF0000FF
      FF0000FFFF000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00007F
      7F0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF007F7F7F00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF0000FFFF00BFBFBF00FFFFFF00000000000000
      000000000000FFFFFF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00FFFFFF00BFBFBF00BFBFBF000000
      0000BFBFBF00BFBFBF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000BFBFBF007F7F7F00BFBF
      BF00BFBFBF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000
      0000BFBFBF00BFBFBF007F7F7F0000000000000000007F7F7F00000000000000
      0000000000000000000000000000007F7F00FFFFFF00BFBFBF00000000000000
      0000000000000000000000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F000000FF007F7F
      7F007F7F7F000000000000000000000000007F7F7F007F7F7F00000000000000
      0000000000007F7F7F007F7F7F0000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F000000FF000000
      FF007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F000000FF000000FF007F7F
      7F007F7F7F007F7F7F007F7F7F0000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F0000000000FFFFFF007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F00000000007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F0000000000FFFFFF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00BFBFBF00000000000000000000000000BFBFBF00BFBFBF00000000000000
      000000000000BFBFBF007F7F7F0000000000000000007F7F7F00000000000000
      000000000000000000000000000000000000000000000000000000FFFF000000
      00007F7F7F0000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000FF000000FF000000FF000000
      000000000000000000007F7F7F0000000000000000007F7F7F00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF0000FFFF000000
      00007F7F7F00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00000000000000
      000000000000000000000000000000000000000000000000000000FF00000000
      0000FFFF0000000000000000000000000000BFBFBF00BFBFBF00000000000000
      000000000000BFBFBF007F7F7F0000000000FFFFFF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00BFBFBF000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00000000000000
      000000000000000000000000000000000000007F7F0000000000000000007F7F
      7F00000000007F7F7F0000000000000000000000000000000000000000000000
      FF000000FF000000FF00000000000000FF000000FF000000FF00000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00007F7F00BFBFBF00000000007F7F
      7F00000000007F7F7F00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000FFFFFF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000FF000000
      FF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000FF00BFBF
      BF0000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000000000007F7F7F0000000000000000007F7F7F00000000000000
      00000000000000000000000000000000000000FFFF00000000007F7F7F000000
      000000000000000000007F7F7F00000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF0000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF0000FFFF00BFBFBF007F7F7F000000
      000000000000000000007F7F7F00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000
      0000FF0000000000000000000000000000000000000000000000BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000000000FF
      000000000000000000000000000000000000000000000000000000FF00000000
      00000000000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF0000000000007F7F7F0000000000FFFFFF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000FF000000FF000000
      FF000000FF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF0000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000000000007F7F7F0000000000000000007F7F7F00000000000000
      00000000000000000000007F7F0000000000000000007F7F7F00000000000000
      00000000000000000000000000007F7F7F000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00007F7F00BFBFBF00000000007F7F7F00000000000000
      00000000000000000000000000007F7F7F00BFBFBF00BFBFBF0000000000FF00
      0000FF000000FF000000FF000000FF000000FF00000000000000BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00FFFF00000000000000FF
      000000000000FFFF0000BFBFBF00BFBFBF00BFBFBF00BFBFBF0000000000BFBF
      BF000000000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF0000000000007F7F7F0000000000FFFFFF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000FF000000
      FF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF0000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000000000007F7F7F0000000000000000007F7F7F00000000000000
      0000000000000000000000FFFF00000000007F7F7F0000000000000000000000
      0000000000000000000000000000000000007F7F7F0000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF0000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF0000FFFF00BFBFBF007F7F7F0000000000000000000000
      0000000000000000000000000000000000007F7F7F00BFBFBF00BFBFBF000000
      0000FF0000000000000000000000000000000000000000000000BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00000000000000
      000000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF000000000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF0000000000007F7F7F0000000000FFFFFF00BFBFBF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000000000007F7F7F0000000000000000007F7F7F00000000000000
      0000007F7F0000000000000000007F7F7F000000000000000000000000000000
      0000000000000000000000000000BFBFBF000000000000000000000000000000
      FF000000FF000000FF00000000000000FF000000FF000000FF00000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00BFBFBF00BFBF
      BF00007F7F00BFBFBF00000000007F7F7F000000000000000000000000000000
      0000000000000000000000000000BFBFBF0000000000BFBFBF00BFBFBF00BFBF
      BF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000
      000000000000000000007F7F7F0000000000FFFFFF00BFBFBF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF0000000000007F7F7F0000000000FFFFFF00000000007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F0000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000000000007F7F7F0000000000000000007F7F7F00000000000000
      000000FFFF00000000007F7F7F00000000000000000000000000000000007F7F
      7F000000000000000000BFBFBF000000000000FFFF00007F7F000000FF000000
      FF000000FF000000000000000000000000000000FF000000FF000000FF007F7F
      7F00007F7F00007F7F007F7F7F0000000000000000007F7F7F00BFBFBF00BFBF
      BF0000FFFF00BFBFBF007F7F7F00000000000000000000000000000000007F7F
      7F000000000000000000BFBFBF00BFBFBF0000FFFF00007F7F00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00007F7F00007F
      7F00007F7F00007F7F007F7F7F0000000000FFFFFF00000000007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F000000000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF0000000000007F7F7F0000000000FFFFFF00000000007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F00000000000000000000000000000000007F7F7F007F7F
      7F0000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000000000007F7F7F0000000000000000007F7F7F00007F7F000000
      0000000000007F7F7F0000000000000000000000000000000000000000000000
      000000000000BFBFBF00000000000000000000000000000000000000FF000000
      FF0000000000000000000000000000000000000000000000FF000000FF00007F
      7F0000FFFF00000000007F7F7F0000000000000000007F7F7F00007F7F00BFBF
      BF00000000007F7F7F0000000000000000000000000000000000000000000000
      000000000000BFBFBF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00007F7F00007F
      7F0000FFFF00000000007F7F7F0000000000FFFFFF00000000007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F00000000000000000000000000000000007F7F7F007F7F
      7F000000000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF0000000000007F7F7F0000000000FFFFFF00000000007F7F7F0000FF
      000000FF00007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F000000000000000000000000000000000000000000000000007F7F
      7F0000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000000000007F7F7F0000000000000000007F7F7F0000FFFF000000
      00007F7F7F00000000000000000000000000000000007F7F7F00000000000000
      0000BFBFBF000000000000FFFF00007F7F000000000000000000000000000000
      00000000000000000000000000007F7F7F00007F7F00007F7F00BFBFBF00007F
      7F0000000000007F7F007F7F7F0000000000000000007F7F7F0000FFFF00BFBF
      BF007F7F7F00000000000000000000000000000000007F7F7F00000000000000
      0000BFBFBF00BFBFBF0000FFFF00007F7F00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF007F7F7F00007F7F00007F7F00BFBFBF00007F
      7F0000000000007F7F007F7F7F0000000000FFFFFF00000000007F7F7F0000FF
      000000FF00007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F000000000000000000000000000000000000000000000000007F7F
      7F000000000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF0000000000007F7F7F0000000000FFFFFF00000000007F7F7F0000FF
      000000FF00007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F00BFBFBF00BFBFBF00BFBFBF007F7F7F0000FF00007F7F
      7F0000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000000000007F7F7F0000000000000000007F7F7F00000000007F7F
      7F00000000000000000000000000000000007F7F7F000000000000000000BFBF
      BF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000007F7F00BFBFBF00BFBFBF00007F7F000000
      0000007F7F00000000007F7F7F0000000000000000007F7F7F00000000007F7F
      7F00000000000000000000000000000000007F7F7F000000000000000000BFBF
      BF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00007F7F00BFBFBF00BFBFBF00007F7F000000
      0000007F7F00000000007F7F7F0000000000FFFFFF00000000007F7F7F0000FF
      000000FF00007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F00BFBFBF00BFBFBF00BFBFBF007F7F7F0000FF00007F7F
      7F000000000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF0000000000007F7F7F0000000000FFFFFF00000000007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F0000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000000000007F7F7F0000000000000000007F7F7F00BFBFBF000000
      00000000000000000000000000007F7F7F000000000000000000BFBFBF000000
      000000FFFF00007F7F0000000000000000000000000000000000000000000000
      0000000000000000000000000000007F7F00BFBFBF00007F7F0000000000007F
      7F0000000000000000007F7F7F0000000000000000007F7F7F00BFBFBF000000
      00000000000000000000000000007F7F7F000000000000000000BFBFBF00BFBF
      BF0000FFFF00007F7F00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00007F7F00BFBFBF00007F7F0000000000007F
      7F0000000000BFBFBF007F7F7F0000000000FFFFFF00000000007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F000000000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF0000000000007F7F7F0000000000FFFFFF00BFBFBF0000000000BFBF
      BF00BFBFBF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F000000000000000000007F7F0000000000000000
      00007F7F0000000000007F7F7F0000000000000000007F7F7F0000000000BFBF
      BF000000000000000000000000000000000000000000BFBFBF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007F7F00007F7F00007F7F0000FFFF00007F7F0000000000007F7F000000
      000000000000000000007F7F7F0000000000000000007F7F7F00BFBFBF00BFBF
      BF000000000000000000000000000000000000000000BFBFBF0000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00007F7F00007F7F00007F7F0000FFFF00007F7F0000000000007F7F000000
      0000BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00BFBFBF0000000000BFBF
      BF00BFBFBF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F000000000000000000007F7F0000000000000000
      00007F7F0000000000007F7F7F0000000000FFFFFF00BFBFBF00BFBFBF000000
      00000000000000000000007F7F00BFBFBF00007F7F00007F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F0000000000BFBF
      BF00BFBFBF00000000000000000000000000BFBFBF000000000000000000BFBF
      BF0000000000000000007F7F7F0000000000000000007F7F7F00000000000000
      0000BFBFBF00000000000000000000000000BFBFBF000000000000FFFF00007F
      7F0000000000000000000000000000000000000000000000000000000000007F
      7F00BFBFBF00BFBFBF0000FFFF00007F7F0000000000007F7F00000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00BFBFBF00BFBF
      BF00BFBFBF00000000000000000000000000BFBFBF00BFBFBF0000FFFF00007F
      7F00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00007F
      7F00BFBFBF00BFBFBF0000FFFF00007F7F0000000000007F7F0000000000BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00BFBFBF00BFBFBF000000
      00000000000000000000007F7F00BFBFBF00007F7F00007F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F0000000000BFBF
      BF00BFBFBF00000000000000000000000000BFBFBF000000000000000000BFBF
      BF0000000000000000007F7F7F0000000000FFFFFF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF000000000000000000BFBFBF00BFBFBF00007F7F007F7F
      7F007F7F7F007F7F7F007F7F7F00000000000000000000000000000000000000
      000000000000BFBFBF0000000000BFBFBF00BFBFBF0000000000BFBFBF00BFBF
      BF0000000000BFBFBF007F7F7F0000000000000000007F7F7F00000000000000
      000000000000BFBFBF0000000000BFBFBF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000007F
      7F0000FFFF0000FFFF00007F7F0000000000007F7F0000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF0000000000BFBFBF0000000000BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00007F
      7F0000FFFF0000FFFF00007F7F0000000000007F7F0000000000BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF000000000000000000BFBFBF00BFBFBF00007F7F007F7F
      7F007F7F7F007F7F7F007F7F7F00000000000000000000000000000000000000
      000000000000BFBFBF0000000000BFBFBF00BFBFBF0000000000BFBFBF00BFBF
      BF0000000000BFBFBF007F7F7F0000000000FFFFFF00BFBFBF00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000000000007F7F7F00000000000000
      00000000000000000000BFBFBF007F007F0000FFFF00007F7F00000000000000
      0000007F7F00007F7F00007F7F00007F7F00007F7F0000000000007F7F00BFBF
      BF0000FFFF00007F7F0000000000007F7F000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF007F007F0000FFFF00007F7F00BFBFBF00BFBF
      BF00007F7F00007F7F00007F7F00007F7F00007F7F0000000000007F7F00BFBF
      BF0000FFFF00007F7F0000000000007F7F0000000000BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00BFBFBF00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00BFBFBF00BFBFBF000000
      000000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF007F7F7F000000
      000000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000000000007F7F7F00000000000000
      0000000000000000000000000000000000000000000000000000007F7F00007F
      7F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF0000FF
      FF00007F7F0000000000007F7F00000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00007F7F00007F
      7F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF0000FF
      FF00007F7F0000000000007F7F0000000000BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00BFBFBF00BFBFBF000000
      000000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF007F7F7F000000
      000000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00BFBFBF00BFBFBF000000
      0000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF007F7F7F00BFBF
      BF000000000000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000000000007F7F7F00000000000000
      00000000000000000000000000000000000000000000007F7F00FFFFFF00FFFF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000007F7F0000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00007F7F00FFFFFF00FFFF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000007F7F0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00BFBFBF00BFBFBF000000
      0000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF007F7F7F00BFBF
      BF000000000000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00BFBFBF00BFBFBF000000
      0000BFBFBF00BFBFBF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000BFBFBF007F7F7F00BFBF
      BF00BFBFBF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000000000007F7F7F00000000000000
      000000000000000000000000000000000000007F7F00FFFFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00007F7F000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00007F7F00FFFFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00007F7F0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00BFBFBF00BFBFBF000000
      0000BFBFBF00BFBFBF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000BFBFBF007F7F7F00BFBF
      BF00BFBFBF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00BFBFBF00BFBFBF000000
      0000BFBFBF00BFBFBF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000BFBFBF007F7F7F00BFBF
      BF00BFBFBF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000000000007F7F7F00000000000000
      000000000000000000000000000000000000007F7F00FFFFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00007F7F000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00007F7F00FFFFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00007F7F0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00BFBFBF00BFBFBF000000
      0000BFBFBF00BFBFBF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000BFBFBF007F7F7F00BFBF
      BF00BFBFBF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00BFBFBF00BFBFBF000000
      0000BFBFBF00BFBFBF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000BFBFBF007F7F7F00BFBF
      BF00BFBFBF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF000000FF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000000000007F7F7F00000000000000
      0000000000000000000000000000007F7F00FFFFFF0000FFFF0000FFFF0000FF
      FF000000000000FFFF000000000000FFFF000000000000FFFF0000FFFF0000FF
      FF00007F7F000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00007F7F00FFFFFF0000FFFF0000FFFF0000FF
      FF000000000000FFFF000000000000FFFF000000000000FFFF0000FFFF0000FF
      FF00007F7F0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00BFBFBF00BFBFBF000000
      0000BFBFBF00BFBFBF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000BFBFBF007F7F7F00BFBF
      BF00BFBFBF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00BFBFBF00BFBFBF000000
      0000BFBFBF00BFBFBF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000BFBFBF007F7F7F00BFBF
      BF00BFBFBF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000000000007F7F7F00000000000000
      0000000000000000000000000000007F7F00FFFFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000FFFF000000000000FFFF0000FFFF0000FFFF0000FF
      FF00007F7F000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00007F7F00FFFFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000FFFF000000000000FFFF0000FFFF0000FFFF0000FF
      FF00007F7F0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00BFBFBF00BFBFBF000000
      0000BFBFBF00BFBFBF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000BFBFBF007F7F7F00BFBF
      BF00BFBFBF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00BFBFBF00BFBFBF000000
      0000BFBFBF00BFBFBF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000BFBFBF007F7F7F00BFBF
      BF00BFBFBF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF000000FF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000000000007F7F7F00000000000000
      0000000000000000000000000000007F7F00FFFFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF000000000000FFFF000000000000FFFF0000FFFF0000FF
      FF00007F7F000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00007F7F00FFFFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF000000000000FFFF000000000000FFFF0000FFFF0000FF
      FF00007F7F0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00BFBFBF00BFBFBF000000
      0000BFBFBF00BFBFBF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000BFBFBF007F7F7F00BFBF
      BF00BFBFBF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00BFBFBF00BFBFBF000000
      0000BFBFBF00BFBFBF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000BFBFBF007F7F7F00BFBF
      BF00BFBFBF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF000000FF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000000000007F7F7F00000000000000
      0000000000000000000000000000007F7F00FFFFFF0000FFFF00000000000000
      00000000000000FFFF0000FFFF000000000000FFFF0000FFFF0000FFFF0000FF
      FF00007F7F000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00007F7F00FFFFFF0000FFFF00000000000000
      00000000000000FFFF0000FFFF000000000000FFFF0000FFFF0000FFFF0000FF
      FF00007F7F0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00BFBFBF00BFBFBF000000
      0000BFBFBF00BFBFBF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000BFBFBF007F7F7F00BFBF
      BF00BFBFBF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00BFBFBF00BFBFBF000000
      0000BFBFBF00BFBFBF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000BFBFBF007F7F7F00BFBF
      BF00BFBFBF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000
      FF00BFBFBF00BFBFBF007F7F7F0000000000000000007F7F7F00000000000000
      0000000000000000000000000000007F7F00FFFFFF00BFBFBF00000000000000
      0000000000000000000000FFFF0000FFFF000000000000FFFF0000FFFF0000FF
      FF00007F7F000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00007F7F00FFFFFF000000000000FFFF0000FF
      FF00BFBFBF000000000000FFFF0000FFFF000000000000FFFF0000FFFF0000FF
      FF00007F7F0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00BFBFBF00BFBFBF000000
      0000BFBFBF00BFBFBF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000BFBFBF007F7F7F00BFBF
      BF00BFBFBF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00BFBFBF00BFBFBF000000
      0000BFBFBF00BFBFBF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000BFBFBF007F7F7F00BFBF
      BF00BFBFBF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF000000FF00BFBFBF007F7F7F0000000000000000007F7F7F00000000000000
      0000000000000000000000000000007F7F00FFFFFF00BFBFBF00000000000000
      0000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00007F
      7F00000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00007F7F00FFFFFF000000000000FFFF0000FF
      FF0000FFFF000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00007F
      7F0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00BFBFBF00BFBFBF000000
      0000BFBFBF00BFBFBF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000BFBFBF007F7F7F00BFBF
      BF00BFBFBF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00BFBFBF00BFBFBF000000
      0000BFBFBF00BFBFBF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000BFBFBF007F7F7F00BFBF
      BF00BFBFBF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF000000FF00BFBFBF007F7F7F0000000000000000007F7F7F00000000000000
      0000000000000000000000000000000000007F7F7F00FFFFFF00BFBFBF000000
      0000000000000000000000FFFF0000FFFF0000FFFF0000FFFF00007F7F00007F
      7F00000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF007F7F7F00FFFFFF000000000000FF
      FF007F7F7F000000000000FFFF0000FFFF0000FFFF0000FFFF00007F7F00007F
      7F0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00BFBFBF00BFBFBF000000
      0000BFBFBF00BFBFBF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000BFBFBF007F7F7F00BFBF
      BF00BFBFBF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00BFBFBF00BFBFBF000000
      0000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF007F7F7F00BFBF
      BF00BFBFBF0000000000BFBFBF00BFBFBF000000FF00BFBFBF00BFBFBF00BFBF
      BF000000FF00BFBFBF007F7F7F0000000000000000007F7F7F00000000000000
      00000000000000000000000000000000000000000000007F7F00FFFFFF00BFBF
      BF00BFBFBF0000FFFF0000FFFF0000FFFF0000FFFF00007F7F00007F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00007F7F00FFFFFF000000
      00000000000000FFFF0000FFFF0000FFFF00007F7F00007F7F00007F7F000000
      0000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00BFBFBF00BFBFBF000000
      0000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF007F7F7F00BFBF
      BF00BFBFBF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00BFBFBF00BFBFBF00BFBF
      BF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF000000FF000000FF000000
      FF00BFBFBF00BFBFBF007F7F7F0000000000000000007F7F7F00000000000000
      0000000000000000000000000000000000000000000000000000007F7F00BFBF
      BF0000FFFF0000FFFF0000FFFF0000FFFF00007F7F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00007F7F00BFBF
      BF0000FFFF0000FFFF0000FFFF00007F7F00007F7F000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00BFBFBF00BFBFBF00BFBF
      BF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F0000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F0000000000FFFFFF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00FFFFFF00FFFFFF00FFFFFF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F0000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F0000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F00000000000000000000000000000000000000
      00000000000000000000BFBFBF00BFBFBF00BFBFBF0000000000000000000000
      000000000000BFBFBF00BFBFBF00BFBFBF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000007F7F7F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000BFBFBF00BFBFBF00BFBFBF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000007F7F7F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00000000007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00000000007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000BFBFBF00BFBFBF00BFBF
      BF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000007F7F7F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00000000007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00000000007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000BFBF
      BF00BFBFBF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000007F7F7F00000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00000000007F7F
      7F00FFFF0000FFFF00007F7F7F00FFFF0000FFFF00007F7F7F00FFFF0000FFFF
      0000FFFF00007F7F7F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00000000007F7F
      7F00FFFF0000FFFF00007F7F7F00FFFF0000FFFF00007F7F7F00FFFF0000FFFF
      0000FFFF00007F7F7F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000BFBFBF00BFBFBF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000007F7F7F00000000000000
      00000000000000000000000000000000000000FF000000FF000000FF000000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00000000007F7F
      7F00FFFF00007F7F7F007F7F7F00FFFF00007F7F7F007F7F7F00FFFF00007F7F
      7F00FFFF00007F7F7F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00000000007F7F
      7F00FFFF00007F7F7F007F7F7F00FFFF00007F7F7F007F7F7F00FFFF00007F7F
      7F00FFFF00007F7F7F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000BFBFBF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000007F7F7F00000000000000
      00000000000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00000000007F7F
      7F00FFFF0000FFFF00007F7F7F00FFFF00007F7F7F007F7F7F00FFFF00007F7F
      7F00FFFF00007F7F7F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00000000007F7F
      7F00FFFF0000FFFF00007F7F7F00FFFF00007F7F7F007F7F7F00FFFF00007F7F
      7F00FFFF00007F7F7F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000BFBFBF00BFBFBF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000007F7F7F00000000000000
      00000000000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00000000007F7F
      7F00FFFF00007F7F7F007F7F7F00FFFF00007F7F7F007F7F7F00FFFF00007F7F
      7F00FFFF00007F7F7F0000000000000000000000000000000000000000000000
      0000000000007F7F7F0000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00000000007F7F
      7F00FFFF00007F7F7F007F7F7F00FFFF00007F7F7F007F7F7F00FFFF00007F7F
      7F00FFFF00007F7F7F0000000000000000000000000000000000000000000000
      0000000000007F7F7F0000000000000000000000000000000000000000000000
      000000000000000000007F7F7F000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF000000000000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00FFFFFF00FFFFFF00FFFFFF00000000007F7F7F00000000000000
      00000000000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00000000007F7F
      7F00FFFF0000FFFF00007F7F7F00FFFF0000FFFF00007F7F7F00FFFF00007F7F
      7F00FFFF00007F7F7F0000000000000000000000000000000000000000000000
      00007F7F7F00000000007F7F7F00000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00000000007F7F
      7F00FFFF0000FFFF00007F7F7F00FFFF0000FFFF00007F7F7F00FFFF00007F7F
      7F00FFFF00007F7F7F0000000000000000000000000000000000000000000000
      00007F7F7F00000000007F7F7F00000000000000000000000000000000000000
      000000000000000000007F7F7F000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000BFBFBF00BFBFBF00FFFFFF00FFFFFF00000000007F7F7F00000000000000
      00000000000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00000000007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F0000000000000000000000000000000000000000007F7F
      7F00FFFF0000000000007F7F7F007F7F7F000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00000000007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F0000000000000000000000000000000000000000007F7F
      7F00FFFF0000000000007F7F7F007F7F7F000000000000000000000000000000
      000000000000000000007F7F7F000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000BFBFBF00BFBFBF00FFFFFF00000000007F7F7F00000000000000
      00000000000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00000000007F7F
      7F00FFFFFF007F7F7F00FFFFFF007F7F7F00FFFFFF007F7F7F00FFFFFF007F7F
      7F00FFFFFF007F7F7F00000000000000000000000000000000007F7F7F000000
      00007F7F7F00000000007F7F7F007F7F7F007F7F7F0000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00000000007F7F
      7F00FFFFFF007F7F7F00FFFFFF007F7F7F00FFFFFF007F7F7F00FFFFFF007F7F
      7F00FFFFFF007F7F7F00000000000000000000000000000000007F7F7F000000
      00007F7F7F00000000007F7F7F007F7F7F007F7F7F0000000000000000000000
      000000000000000000007F7F7F000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000BFBFBF00FFFFFF00000000007F7F7F00000000000000
      00000000000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      000000000000000000000000000000000000000000007F7F7F00000000007F7F
      7F0000000000FFFF0000000000007F7F7F007F7F7F007F7F7F00000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      000000000000000000000000000000000000000000007F7F7F00000000007F7F
      7F0000000000FFFF0000000000007F7F7F007F7F7F007F7F7F00000000000000
      000000000000000000007F7F7F000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000BFBFBF00FFFFFF00000000007F7F7F00000000000000
      00000000000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000007F7F7F00FFFF00007F7F7F000000
      0000FFFF0000FFFF0000FFFF0000000000007F7F7F007F7F7F007F7F7F000000
      000000000000000000007F7F7F0000000000000000007F7F7F00000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000007F7F7F00FFFF00007F7F7F000000
      0000FFFF0000FFFF0000FFFF0000000000007F7F7F007F7F7F007F7F7F000000
      000000000000000000007F7F7F000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000BFBFBF00BFBFBF00000000007F7F7F00000000000000
      00000000000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000FF00000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00000000000000
      000000000000000000000000000000FFFF000000FF0000000000000000000000
      00000000000000000000000000007F7F7F00FFFF00007F7F7F0000000000FFFF
      0000FFFF00000000000000000000FFFF0000000000007F7F7F007F7F7F007F7F
      7F0000000000000000007F7F7F0000000000000000007F7F7F00000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      00000000000000000000000000007F7F7F00FFFF00007F7F7F0000000000FFFF
      0000FFFF00000000000000000000FFFF0000000000007F7F7F007F7F7F007F7F
      7F0000000000000000007F7F7F000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000BFBFBF00000000007F7F7F00000000000000
      00000000000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000000000FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000FF000000FF000000FF00000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      000000000000000000007F7F7F00FFFF00007F7F7F0000000000FFFF0000FFFF
      00000000000000000000FFFF000000000000FFFF0000000000007F7F7F007F7F
      7F007F7F7F00000000007F7F7F0000000000000000007F7F7F00000000000000
      FF000000FF0000000000000000000000FF000000000000000000000000000000
      FF0000000000000000007F7F7F00FFFF00007F7F7F0000000000FFFF0000FFFF
      00000000000000000000FFFF000000000000FFFF0000000000007F7F7F007F7F
      7F007F7F7F00000000007F7F7F000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF0000000000BFBFBF00000000007F7F7F00000000000000
      00000000000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000000000FFFFFF00FFFFFF000000000000000000000000000000
      0000FF000000FF000000FF000000FF000000FF00000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00000000000000
      000000000000000000000000000000FFFF000000FF0000000000000000000000
      0000000000007F7F7F00FFFF00007F7F7F0000000000FFFF0000FFFF00000000
      0000FFFF0000000000007F7F7F00FFFF000000000000FFFF0000000000007F7F
      7F007F7F7F00000000007F7F7F0000000000000000007F7F7F00000000000000
      FF000000FF000000FF00000000000000FF0000000000000000000000FF000000
      FF000000FF007F7F7F00FFFF00007F7F7F0000000000FFFF0000FFFF00000000
      0000FFFF0000000000007F7F7F00FFFF000000000000FFFF0000000000007F7F
      7F007F7F7F00000000007F7F7F000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000BFBFBF00000000007F7F7F00000000000000
      00000000000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000000000FFFFFF00FFFFFF000000000000000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000000000007F7F7F0000000000000000007F7F7F00000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      00007F7F7F00FFFF00007F7F7F0000000000FFFF0000FFFF000000000000FFFF
      0000FFFF000000000000FFFF00007F7F7F00FFFF000000000000FFFF00000000
      00007F7F7F00000000007F7F7F0000000000000000007F7F7F00000000000000
      00000000FF000000FF000000FF000000FF00000000000000FF000000FF000000
      FF007F7F7F00FFFF00007F7F7F0000000000FFFF0000FFFF000000000000FFFF
      0000FFFF000000000000FFFF00007F7F7F00FFFF000000000000FFFF00000000
      00007F7F7F00000000007F7F7F000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000BFBFBF00000000007F7F7F00000000000000
      00000000000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000000000FFFFFF00FFFFFF000000000000000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000000000007F7F7F0000000000000000007F7F7F00000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      0000FFFF00007F7F7F0000000000FFFF0000FFFF000000000000FFFF00000000
      0000FFFF0000000000007F7F7F00FFFF00007F7F7F0000000000FFFF0000FFFF
      000000000000000000007F7F7F0000000000000000007F7F7F00000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF000000FF000000
      0000FFFF00007F7F7F0000000000FFFF0000FFFF000000000000FFFF00000000
      0000FFFF0000000000007F7F7F00FFFF00007F7F7F0000000000FFFF0000FFFF
      000000000000000000007F7F7F000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000BFBFBF00000000007F7F7F00000000000000
      00000000000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000000000FFFFFF00FFFFFF000000000000000000000000000000
      0000FF000000FF000000FF000000FF000000FF00000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      00007F7F7F0000000000FFFF0000FFFF000000000000FFFF0000000000000000
      0000FFFF000000000000FFFF00007F7F7F00FFFF00000000000000000000FFFF
      0000FFFF0000000000007F7F7F0000000000000000007F7F7F00000000000000
      000000000000000000000000FF000000FF000000FF000000FF00000000000000
      00007F7F7F0000000000FFFF0000FFFF000000000000FFFF0000000000000000
      0000FFFF000000000000FFFF00007F7F7F00FFFF00000000000000000000FFFF
      0000FFFF0000000000007F7F7F000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000BFBFBF00000000007F7F7F00000000000000
      00000000000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000000000FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000FF000000FF000000FF00000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00000000000000
      000000000000000000000000000000FFFF000000FF0000000000000000000000
      000000000000FFFF0000FFFF000000000000FFFF000000000000000000000000
      000000000000FFFF000000000000FFFF00007F7F7F0000000000FFFF00000000
      000000000000000000007F7F7F0000000000000000007F7F7F00000000000000
      000000000000000000000000FF000000FF000000FF000000FF00000000000000
      000000000000FFFF0000FFFF000000000000FFFF000000000000000000000000
      000000000000FFFF000000000000FFFF00007F7F7F0000000000FFFF00000000
      000000000000000000007F7F7F000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000BFBFBF00000000007F7F7F00000000000000
      00000000000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000FF00000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      0000FFFF0000FFFF000000000000FFFF00000000000000000000000000000000
      0000FFFF0000FFFF0000FFFF000000000000FFFF000000000000FFFF00000000
      000000000000000000007F7F7F0000000000000000007F7F7F00000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF000000FF000000
      0000FFFF0000FFFF000000000000FFFF00000000000000000000000000000000
      0000FFFF0000FFFF0000FFFF000000000000FFFF000000000000FFFF00000000
      000000000000000000007F7F7F000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000BFBFBF00000000007F7F7F00000000000000
      00000000000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00000000000000
      000000000000000000000000000000FFFF000000FF0000000000000000000000
      000000000000FFFF000000000000FFFF0000000000000000000000000000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF00000000000000000000FFFF00000000
      000000000000000000007F7F7F0000000000000000007F7F7F00000000000000
      00000000FF000000FF000000FF000000FF00000000000000FF000000FF000000
      FF0000000000FFFF000000000000FFFF0000000000000000000000000000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF00000000000000000000FFFF00000000
      000000000000000000007F7F7F000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF0000000000BFBFBF00000000007F7F7F00000000000000
      00000000000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      0000000000000000000000000000FFFF00000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF000000000000FFFF0000FFFF00000000
      000000000000000000007F7F7F0000000000000000007F7F7F00000000000000
      FF000000FF000000FF00000000000000FF0000000000000000000000FF000000
      FF000000FF000000000000000000FFFF00000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF000000000000FFFF0000FFFF00000000
      000000000000000000007F7F7F000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000BFBFBF00000000007F7F7F00000000000000
      00000000000000FF000000FF000000FF000000FF000000FF000000FF00000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      0000000000000000000000000000FFFF000000000000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF000000000000FFFF0000FFFF0000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00000000000000
      FF000000FF000000000000000000000000000000FF0000000000000000000000
      FF00000000000000000000000000FFFF000000000000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF000000000000FFFF0000FFFF0000000000000000
      000000000000000000007F7F7F000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000FF00FFFFFF00FFFF
      FF00FFFFFF000000FF000000FF00FFFFFF00FFFFFF000000FF000000FF000000
      FF00FFFFFF00FFFFFF000000FF000000FF000000FF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000BFBFBF00000000007F7F7F00000000000000
      00000000000000FF000000FF000000FF0000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000000000000FFFF0000FFFF000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000000000000FFFF0000FFFF000000000000000000000000
      000000000000000000007F7F7F000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF000000FF00FFFF
      FF000000FF00FFFFFF00FFFFFF000000FF00FFFFFF000000FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000BFBFBF00000000007F7F7F00000000000000
      00000000000000FF0000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00000000000000
      00000000000000000000000000000000000000FFFF000000FF000000FF000000
      FF000000FF000000FF0000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF000000000000FFFF0000FFFF00000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      0000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF000000000000FFFF0000FFFF00000000000000000000000000000000
      000000000000000000007F7F7F000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF000000FF00FFFF
      FF000000FF00FFFFFF00FFFFFF000000FF00FFFFFF000000FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000BFBFBF00000000007F7F7F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00000000000000
      000000000000000000000000000000000000000000000000FF0000FFFF000000
      FF0000FFFF000000FF000000FF0000000000FFFF0000FFFF0000FFFF0000FFFF
      000000000000FFFF0000FFFF0000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF0000000000FFFF0000FFFF0000FFFF0000FFFF
      000000000000FFFF0000FFFF0000000000000000000000000000000000000000
      000000000000000000007F7F7F000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF000000FF00FFFF
      FF000000FF00FFFFFF00FFFFFF000000FF00FFFFFF000000FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000BFBFBF00000000007F7F7F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000FFFF00000000
      0000FFFF0000FFFF000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000FFFF00000000
      0000FFFF0000FFFF000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000FF00FFFFFF00FFFF
      FF00FFFFFF000000FF000000FF00FFFFFF00FFFFFF000000FF000000FF000000
      FF00FFFFFF00FFFFFF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000BFBFBF00000000007F7F7F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F00000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F00000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000BFBFBF00000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F0000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F0000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000BFBFBF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00424D3E000000000000003E000000
      2800000080000000600000000100010000000000000600000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      30003E20000000000000000000000000000000003E20300000001E3241000004
      5052200020004000011030001E32400000000739BFD7C71D80100001F7BDF7BD
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      0000000000000000000000000000FFFF00000000000000000000000000000000
      00000000000000000000000000000000FFFF0000000000000000000000000000
      FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      0000000000000000000000000000FFFFFFFF0000FFFFFFFF0000000000000000
      FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      0000000000000000000000000000FFFFFFFF0000FFFF00000000000000000000
      FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      0000073980000001800000010000000100000739BFD7C71D8010000100000739
      000007FDBF43E23D80000001000007FD00000805BF41F07D8000000100000805
      00000805BD00F8FD800000010000080500000805BD00707D8000000100000805
      3FFFF805B4006221800000013FFFF80540000805B40107018000000140000805
      4003C8059001CF81800000014003C8054007E8059004FE01800000014007E805
      400008058007FE018000000140000805400008058013FE058000000140000805
      27FFFDB5A01FF00D8000000127FFFDB51C00276DB04FE01D800000011C00276D
      0301FA49B87FE03D800000010301FA490FFFC001BC30007D800000010FFFC001
      18001801BFC000FD800000011800180110000C01BF8001FD8000000110000C01
      10000401BF0003FD800000011000040110000401BF0003FD8000000110000401
      10000401BE0003FD800000011000040110000401BE0003FD8000000110000401
      10000401BE0003FD800000011000040110000401BE0003FD8000000110000401
      10000401BE1803FD800000011000040110000401BE1807FD8000000110000401
      10000401BF0007FD800000011000040110000401BF800FFD8000000110000401
      08000801BFC01FFD800000010800080107FFF001800000018000000107FFF001
      00000001FFFFFFFFFFFFFFFF00000001FFFFFFFFFFFFFFFFFFFFFFFF00000000
      80000001800000018000000100000000BFFFFFFDB001FFFDB001FFFD00000000
      BFFFFFFDA001FFFDA001FFFD00000000BFE3FFFDA001FFFDA001FFFD00000000
      BF03FFFDA001FFFDA001FFFD00000000B803FFFDA001FFFDA001FFFD00000000
      8000000DA001FBFDA001FBFD00000000B0007FFDA001F1FDA001F1FD00000000
      B0007FFDA001E0FDA001E0FD00000000B0007FFDA001C07DA001C07D00000000
      B0007FFDA003803DA003803D00000000B0007FFDBE7F001DBEFF001D00000000
      B0007F3DBE7E000DBEFE000D00000000B0007C3DBE7C0005BEFC000500000000
      B000703DBE780001A6E8000100000000B0004001BE780001A2C0000100000000
      B0000001BE700001B080000100000000B0000001BE600001B800000100000000
      B0004001BE600001BC20000100000000B000703DBE600005BC20000500000000
      B0007C3DBE60000DB800000D00000000B0007F3DBE70000DB080000D00000000
      B0007FFDBE78000DA2C0000D00000000B0007FFDBE7C001DA76C001D00000000
      B0007FFDBE3C003DBF7C003D00000000B0007FFDBF00007DBFBC007D00000000
      B0007FFDBF8000FDBFC000FD00000000BFFFFFFDBFFF01FDBFFF01FD00000000
      BFFFFFFDBFFF83FDBFFF83FD0000000080000001800000018000000100000000
      FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000
      000000000000}
  end
  object OpenDialog1: TOpenDialog
    Options = [ofHideReadOnly, ofOldStyleDialog, ofEnableSizing]
    Left = 472
    Top = 24
  end
  object ColorDialog1: TColorDialog
    Left = 400
    Top = 24
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 1100
    OnTimer = Timer1Timer
    Left = 400
  end
  object IL2: TImageList
    Height = 32
    Width = 32
    Left = 472
    Bitmap = {
      494C010102000400040020002000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000800000002000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F7F0000FFFF0000FF000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00FF000000BFBFBF00FF000000000000007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F7F0000BFBFBF00FFFFFF00BFBF
      BF0000000000BFBFBF00000000007F7F7F00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00FF00000000000000BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F7F7F00FFFFFF0000000000BFBF
      BF00FFFFFF00FFFFFF00FFFFFF00BFBFBF00000000007F7F7F00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F7F7F00FFFFFF00FFFFFF00BFBF
      BF007F7F7F00FFFFFF00007F7F00007F7F00000000007F7F7F00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF007F7F7F0000000000BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F7F0000FF000000BFBFBF00FFFF
      FF00FFFFFF00BFBFBF007F7F7F00007F7F0000FFFF00007F7F00000000007F7F
      7F00BFBFBF007F000000FF00000000000000BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F7F0000FFFF00007F7F0000FF00
      0000BFBFBF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00007F7F0000FFFF00007F
      7F0000000000FF000000FF00000000000000BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00007F
      7F000000FF0000007F00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF007F7F7F000000000000000000BFBFBF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF000000
      0000BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFF
      FF00BFBFBF00FFFFFF00BFBFBF0000000000BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF0000000000BFBFBF0000FFFF00BFBF
      BF0000FFFF00BFBFBF0000FFFF00BFBFBF0000FFFF00BFBFBF0000FFFF000000
      0000BFBFBF00BFBFBF00BFBFBF00BFBFBF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00BFBFBF0000FF
      FF00BFBFBF0000FFFF00BFBFBF0000FFFF00BFBFBF0000FFFF00BFBFBF0000FF
      FF00BFBFBF0000FFFF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF000000
      0000BFBFBF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00BFBFBF0000000000BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF0000000000BFBFBF0000FFFF00BFBF
      BF0000FFFF00BFBFBF0000FFFF00BFBFBF0000FFFF00BFBFBF0000FFFF000000
      0000BFBFBF00BFBFBF00BFBFBF00BFBFBF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00BFBFBF0000FF
      FF00BFBFBF0000000000BFBFBF0000FFFF00BFBFBF0000FFFF00BFBFBF0000FF
      FF00BFBFBF0000FFFF0000000000BFBFBF0000000000BFBFBF00BFBFBF000000
      0000BFBFBF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00BFBFBF0000000000BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF0000000000BFBFBF0000FFFF00BFBF
      BF0000FFFF00BFBFBF0000FFFF00BFBFBF0000FFFF00BFBFBF0000FFFF000000
      0000BFBFBF00BFBFBF0000000000BFBFBF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00BFBFBF000000
      000000000000000000000000000000000000BFBFBF0000FFFF00BFBFBF0000FF
      FF00BFBFBF0000FFFF0000000000BFBFBF00BFBFBF00BFBFBF00000000000000
      000000000000FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF0000FF
      000000FF000000FF0000BFBFBF00000000000000FF000000FF00BFBFBF00BFBF
      BF000000FF000000FF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF0000000000BFBFBF0000FFFF00BFBF
      BF0000FFFF00BFBFBF0000FFFF00BFBFBF0000FFFF00BFBFBF0000FFFF000000
      000000000000BFBFBF00BFBFBF00BFBFBF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00BFBFBF0000FF
      FF00BFBFBF0000000000BFBFBF0000FFFF00BFBFBF0000FFFF00BFBFBF0000FF
      FF00BFBFBF0000FFFF0000000000BFBFBF00BFBFBF00BFBFBF0000000000BFBF
      BF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000FF000000
      FF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000000000FFFF00BFBF
      BF0000FFFF00BFBFBF0000000000BFBFBF00BFBFBF00BFBFBF0000000000BFBF
      BF0000000000BFBFBF00BFBFBF00BFBFBF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BFBFBF00BFBFBF0000000000BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000FF000000FF00BFBFBF00BFBF
      BF000000FF000000FF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF0000000000BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF0000000000BFBFBF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BFBFBF00BFBFBF00000000000000
      0000000000000000000000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BFBFBF00BFBFBF007F0000007F00
      0000BFBFBF00BFBFBF007F0000007F000000BFBFBF00BFBFBF00BFBFBF00BFBF
      BF0000007F0000007F0000007F00BFBFBF007F000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007F000000BFBFBF00BFBFBF00BFBF
      BF0000007F0000007F0000007F00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF0000007F0000007F0000007F00BFBFBF007F0000007F0000007F0000007F00
      00007F0000007F0000007F0000007F000000BFBFBF00BFBFBF00BFBFBF00BFBF
      BF0000007F0000007F0000007F00BFBFBF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BFBFBF00BFBFBF007F0000007F00
      00007F0000007F0000007F0000007F000000BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF0000007F00BFBFBF00BFBFBF007F000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007F000000BFBFBF00BFBFBF00BFBF
      BF00BFBFBF0000007F00BFBFBF00BFBFBF00BFBFBF0000000000000000000000
      0000000000000000000000000000000000000000000000000000BFBFBF00BFBF
      BF00BFBFBF0000007F00BFBFBF00BFBFBF007F000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF007F000000BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF0000007F00BFBFBF00BFBFBF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BFBFBF00BFBFBF00BFBFBF007F00
      00007F0000007F0000007F000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF0000007F00BFBFBF00BFBFBF007F000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007F000000BFBFBF00BFBFBF00BFBF
      BF00BFBFBF0000007F00BFBFBF00BFBFBF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000BFBFBF00BFBF
      BF00BFBFBF0000007F00BFBFBF00BFBFBF007F000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF007F00000000FFFF00FFFFFF007F000000BFBF
      BF00BFBFBF0000007F00BFBFBF00BFBFBF00FF00000000000000000000007F7F
      7F0000000000000000007F7F7F0000000000000000007F7F7F00000000000000
      0000FF0000007F7F7F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00000000000000000000007F7F
      7F0000000000000000007F7F7F0000000000000000007F7F7F00000000000000
      0000FF0000007F7F7F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF0000007F00BFBFBF00BFBFBF007F000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007F000000BFBFBF00BFBFBF00BFBF
      BF00BFBFBF0000007F00BFBFBF00BFBFBF0000000000FFFFFF00FFFFFF007F00
      0000FFFFFF007F000000FFFFFF00FFFFFF000000000000000000BFBFBF00BFBF
      BF00BFBFBF0000007F00BFBFBF00BFBFBF007F000000FFFFFF00FFFFFF00FFFF
      FF007F0000007F0000007F0000007F00000000FFFF00FFFFFF007F000000BFBF
      BF00BFBFBF0000007F00BFBFBF00BFBFBF00FF0000007F7F7F00000000000000
      00007F7F7F0000000000000000007F7F7F0000000000000000007F7F7F000000
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF0000007F7F7F00000000000000
      00007F7F7F0000000000000000007F7F7F0000000000000000007F7F7F000000
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BFBFBF00BFBFBF007F0000007F00
      0000BFBFBF00BFBFBF007F0000007F000000BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF0000007F00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF0000007F00BFBFBF00BFBFBF0000000000FFFFFF00FFFFFF007F00
      0000FFFFFF007F0000007F000000FFFFFF000000000000000000BFBFBF00BFBF
      BF00BFBFBF0000007F00BFBFBF00BFBFBF007F000000FFFFFF00FFFFFF00FFFF
      FF007F0000007F00000000FFFF00FFFFFF0000FFFF00FFFFFF007F000000BFBF
      BF00BFBFBF0000007F00BFBFBF00BFBFBF00FF0000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F0000FF000000FF00007F7F
      7F00FF0000000000000000000000000000000000000000000000FFFFFF000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000000000000000FF0000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F0000FF000000FF00007F7F
      7F00FF0000000000000000000000000000000000000000000000FFFFFF000000
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF00000000000000000000BFBFBF00BFBFBF00BFBFBF007F00
      00007F0000007F0000007F0000007F000000BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF0000007F00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF007F000000FFFFFF00FFFFFF007F000000BFBFBF00BFBFBF00BFBF
      BF00BFBFBF0000007F00BFBFBF00BFBFBF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BFBFBF00BFBF
      BF00BFBFBF0000007F00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF007F00
      000000FFFF00FFFFFF0000FFFF007F00000000FFFF007F000000BFBFBF00BFBF
      BF00BFBFBF0000007F00BFBFBF00BFBFBF00FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF0000000000000000000000000000000000000000000000FFFFFF000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF0000000000FFFFFF00FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF0000000000000000000000000000000000000000000000FFFFFF000000
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000000000FFFFFF00BFBFBF00BFBFBF00BFBFBF007F00
      00007F0000007F0000007F000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF0000007F00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF007F0000007F0000007F0000007F000000BFBFBF00BFBFBF00BFBF
      BF00BFBFBF0000007F00BFBFBF00BFBFBF000000000000000000000000000000
      00000000000000000000000000000000000000000000BFBFBF00BFBFBF00BFBF
      BF00BFBFBF0000007F00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF007F00
      00007F0000007F0000007F0000007F000000BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF0000007F00BFBFBF00BFBFBF00FF00000000000000000000007F7F
      00007F7F00007F7F00007F7F00007F7F00007F7F00007F7F00007F7F00000000
      0000FF0000000000000000000000000000000000000000000000FFFFFF000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF0000000000FFFFFF00FF00000000000000000000007F7F
      00007F7F00007F7F00007F7F00007F7F00007F7F00007F7F00007F7F00000000
      0000FF000000FF00000000FF000000FF000000FF000000FF0000FFFFFF000000
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000000000FFFFFF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00FF00000000000000000000007F7F
      00007F7F00007F7F00007F7F00007F7F00007F7F00007F7F00007F7F00000000
      0000FF000000000000000000FF000000FF000000FF000000FF00FFFFFF000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF0000000000FFFFFF00FF00000000000000000000007F7F
      00007F7F00007F7F00007F7F00007F7F00007F7F00007F7F00007F7F00000000
      0000FF0000000000000000000000000000000000000000000000FFFFFF000000
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FF0000000000000000000000FFFF
      00007F7F00007F7F00007F7F00007F7F00007F7F00007F7F00007F7F00000000
      0000FF0000000000000000000000000000000000000000000000FFFFFF000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF0000000000FFFFFF00FF0000000000000000000000FFFF
      00007F7F00007F7F00007F7F00007F7F00007F7F00007F7F00007F7F00000000
      0000FF0000000000000000000000000000000000000000000000FFFFFF000000
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF007F7F
      7F007F000000FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF007F7F7F007F00
      0000FFFFFF000000000000000000FFFFFF00FFFFFF00BFBFBF007F000000FFFF
      FF000000000000000000FFFFFF000000000000000000FFFFFF00FFFFFF007F00
      0000FFFFFF00FFFFFF00000000000000000000000000FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF0000000000FF0000000000000000000000FFFF
      00007F7F00007F7F00007F7F00007F7F00007F7F00007F7F00007F7F00000000
      0000FF0000000000000000000000000000000000000000000000FFFFFF000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000000000000000FF0000000000000000000000FFFF
      00007F7F00007F7F00007F7F00007F7F00007F7F00007F7F00007F7F00000000
      0000FF0000000000000000000000000000000000000000000000FFFFFF000000
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF0000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007F000000FFFFFF00FFFF
      FF007F000000FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007F0000007F000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF007F0000007F00
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007F0000007F000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF007F00
      0000FFFFFF00FFFFFF00000000000000000000000000FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF0000000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF007F00
      0000FFFFFF00FFFFFF007F000000FFFFFF00FFFFFF007F0000007F0000007F00
      0000FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF007F00
      00007F0000007F0000007F0000007F0000007F0000007F0000007F0000007F00
      00007F000000FFFFFF00FFFFFF0000000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF007F00
      00007F0000007F000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF007F7F
      7F007F000000FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF007F7F7F007F00
      0000FFFFFF000000000000000000FFFFFF00FFFFFF007F7F7F007F000000FFFF
      FF000000000000000000FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF0000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000200000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFFFFFFFCFF180190FF6ECB
      FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF0000000000000000
      FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF0000000000000000
      FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF0000000000000000
      FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF0000000000000000
      FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF0000000000000000
      FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF0000000000000000
      FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF0000000000000000
      FFFFFFFFFFFFFFFF740092C270FF6ECBFFFFFFFFFFFFFFFFA2C624C020332AC0
      FFFFFFFFFFFFFFFF740092C240D7D1CF8001FFFF8001FFFF40D7D1CF844B41C1
      0005FFFF0005FFFF7EB100C0300000002491FFFF2491FFFFFCB900C0004472C1
      1243F0031243F003ED608200004472C10003C0010003C0010C1401C00A000000
      7FF3C0007FF3C0008CFE6ECB20FE6ECB4013C00040100000A03A05C087000000
      401000004013C000803B00C040D7D1CF4013C0004013C0000000000070FF6ECB
      4013C0014013C0018CFE6ECBE0FD6ECB4013F0034013F003852700C0ACFC03C0
      7FF3FFFF7FF3FFFF40D7D1CFC01772C10007FFFF0007FFFF8CFE6ECB49F606C0
      FFFFFFFFFFFFFFFFD79C4703C01772C100000000000000000000000000000000
      000000000000}
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = Timer2Timer
    Left = 376
  end
  object SaveDialog1: TSaveDialog
    Options = [ofOverwritePrompt, ofExtensionDifferent, ofPathMustExist, ofFileMustExist, ofOldStyleDialog, ofEnableSizing]
    Left = 424
  end
  object SaveDialog2: TSaveDialog
    Left = 424
    Top = 24
  end
  object OpenDialog2: TOpenDialog
    Left = 376
    Top = 24
  end
end
