object Form4: TForm4
  Left = -8
  Top = -8
  BorderStyle = bsSingle
  Caption = 'Utilits'
  ClientHeight = 706
  ClientWidth = 1366
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1366
    Height = 706
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Max_Deceleration'
      object Label7: TLabel
        Left = 8
        Top = 308
        Width = 27
        Height = 13
        Caption = 'Accel'
      end
      object Label8: TLabel
        Left = 72
        Top = 308
        Width = 8
        Height = 13
        Caption = 'G'
      end
      object Memo1: TMemo
        Left = -15
        Top = 0
        Width = 481
        Height = 297
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object Button3: TButton
        Left = 208
        Top = 303
        Width = 89
        Height = 25
        Caption = 'Gap Asm Calc'
        TabOrder = 1
      end
      object Button2: TButton
        Left = 304
        Top = 303
        Width = 75
        Height = 25
        Caption = 'T Asm Calc'
        TabOrder = 2
      end
      object Button1: TButton
        Left = 383
        Top = 303
        Width = 75
        Height = 25
        Caption = 'Full Calc'
        TabOrder = 3
      end
      object Edit7: TEdit
        Left = 40
        Top = 304
        Width = 25
        Height = 21
        TabOrder = 4
        Text = '30'
      end
      object Button5: TButton
        Left = 104
        Top = 303
        Width = 97
        Height = 25
        Caption = 'Speed_C_Delay'
        TabOrder = 5
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Pump_Sequence'
      ImageIndex = 1
      object Label1: TLabel
        Left = 352
        Top = 50
        Width = 32
        Height = 13
        Caption = 'P_max'
      end
      object Label2: TLabel
        Left = 352
        Top = 18
        Width = 25
        Height = 13
        Caption = 't_min'
      end
      object Label4: TLabel
        Left = 336
        Top = 178
        Width = 13
        Height = 13
        Caption = 'dP'
      end
      object Label3: TLabel
        Left = 328
        Top = 146
        Width = 53
        Height = 13
        Caption = 'Max_Pump'
      end
      object Label5: TLabel
        Left = 328
        Top = 114
        Width = 51
        Height = 13
        Caption = 'Min_Offset'
      end
      object Label6: TLabel
        Left = 368
        Top = 82
        Width = 7
        Height = 13
        Caption = 'K'
      end
      object Memo2: TMemo
        Left = 1
        Top = 0
        Width = 264
        Height = 337
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object Edit1: TEdit
        Left = 392
        Top = 16
        Width = 57
        Height = 21
        TabOrder = 1
        Text = '8'
      end
      object Edit2: TEdit
        Left = 392
        Top = 48
        Width = 57
        Height = 21
        TabOrder = 2
        Text = '150'
      end
      object Edit3: TEdit
        Left = 392
        Top = 176
        Width = 57
        Height = 21
        TabOrder = 3
        Text = '0,8'
      end
      object Button4: TButton
        Left = 376
        Top = 208
        Width = 75
        Height = 25
        Caption = 'Calculate'
        TabOrder = 4
      end
      object Edit4: TEdit
        Left = 392
        Top = 144
        Width = 57
        Height = 21
        TabOrder = 5
        Text = '120'
      end
      object Edit5: TEdit
        Left = 392
        Top = 112
        Width = 57
        Height = 21
        TabOrder = 6
        Text = '7'
      end
      object Edit6: TEdit
        Left = 392
        Top = 80
        Width = 57
        Height = 21
        TabOrder = 7
        Text = '0,05'
      end
    end
  end
  object yyyyyy: TPageControl
    Left = 0
    Top = 0
    Width = 1366
    Height = 706
    ActivePage = TabSheet3
    Align = alClient
    TabOrder = 1
    object TabSheet3: TTabSheet
      Caption = 'DeltaT'
      object Label9: TLabel
        Left = 328
        Top = 44
        Width = 59
        Height = 13
        Caption = 'Acceleration'
      end
      object Label10: TLabel
        Left = 440
        Top = 148
        Width = 8
        Height = 13
        Caption = 'G'
      end
      object Label17: TLabel
        Left = 328
        Top = 148
        Width = 60
        Height = 13
        Caption = 'Deceleration'
      end
      object Label18: TLabel
        Left = 440
        Top = 44
        Width = 8
        Height = 13
        Caption = 'G'
      end
      object Label16: TLabel
        Left = 344
        Top = 169
        Width = 34
        Height = 13
        Caption = 'T0_Km'
      end
      object Label19: TLabel
        Left = 344
        Top = 196
        Width = 32
        Height = 13
        Caption = 'T0_Kv'
      end
      object Label25: TLabel
        Left = 352
        Top = 8
        Width = 12
        Height = 13
        Caption = 'F0'
      end
      object Label26: TLabel
        Left = 440
        Top = 65
        Width = 8
        Height = 13
        Caption = '%'
      end
      object Label27: TLabel
        Left = 352
        Top = 68
        Width = 53
        Height = 13
        Caption = 'Change T0'
      end
      object Memo3: TMemo
        Left = 1
        Top = 0
        Width = 304
        Height = 321
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object Button7: TButton
        Left = 464
        Top = 39
        Width = 59
        Height = 25
        Caption = 'dT_Max'
        TabOrder = 1
        OnClick = Button7Click
      end
      object Edit8: TEdit
        Left = 392
        Top = 40
        Width = 41
        Height = 21
        TabOrder = 2
        Text = '120'
      end
      object Button9: TButton
        Left = 464
        Top = 135
        Width = 65
        Height = 25
        Caption = 'dT_Min'
        TabOrder = 3
        OnClick = Button9Click
      end
      object Edit15: TEdit
        Left = 392
        Top = 144
        Width = 41
        Height = 21
        TabOrder = 4
        Text = '50'
      end
      object Button8: TButton
        Left = 464
        Top = 183
        Width = 65
        Height = 25
        Caption = 'dT_Min_Ch'
        TabOrder = 5
        OnClick = Button8Click
      end
      object Button11: TButton
        Left = 464
        Top = 71
        Width = 65
        Height = 25
        Caption = 'dT_Max_Ch'
        TabOrder = 6
        OnClick = Button11Click
      end
      object Edit9: TEdit
        Left = 392
        Top = 64
        Width = 41
        Height = 21
        TabOrder = 7
        Text = '0,5'
      end
      object Button13: TButton
        Left = 448
        Top = 0
        Width = 75
        Height = 25
        Caption = 'Button13'
        TabOrder = 8
        OnClick = Button13Click
      end
      object Edit21: TEdit
        Left = 368
        Top = 0
        Width = 73
        Height = 21
        TabOrder = 9
        Text = '1000000'
      end
      object Edit22: TEdit
        Left = 392
        Top = 192
        Width = 41
        Height = 21
        TabOrder = 10
        Text = '2,5'
      end
      object Edit23: TEdit
        Left = 392
        Top = 168
        Width = 41
        Height = 21
        TabOrder = 11
        Text = '1,55'
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Pump_Sequence'
      ImageIndex = 1
      object Label11: TLabel
        Left = 352
        Top = 50
        Width = 32
        Height = 13
        Caption = 'P_max'
      end
      object Label12: TLabel
        Left = 352
        Top = 82
        Width = 25
        Height = 13
        Caption = 't_min'
      end
      object Label13: TLabel
        Left = 360
        Top = 114
        Width = 13
        Height = 13
        Caption = 'dP'
      end
      object Label14: TLabel
        Left = 328
        Top = 178
        Width = 54
        Height = 13
        Caption = 'Max_Offset'
      end
      object Label15: TLabel
        Left = 328
        Top = 146
        Width = 51
        Height = 13
        Caption = 'Min_Offset'
      end
      object Memo4: TMemo
        Left = 1
        Top = 8
        Width = 296
        Height = 305
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object Edit10: TEdit
        Left = 392
        Top = 48
        Width = 57
        Height = 21
        TabOrder = 1
        Text = '128'
      end
      object Edit11: TEdit
        Left = 392
        Top = 112
        Width = 57
        Height = 21
        TabOrder = 2
        Text = '0,063'
      end
      object Button10: TButton
        Left = 376
        Top = 272
        Width = 75
        Height = 25
        Caption = 'Calculate'
        TabOrder = 3
        OnClick = Button10Click
      end
      object Edit12: TEdit
        Left = 392
        Top = 176
        Width = 57
        Height = 21
        TabOrder = 4
        Text = '60'
      end
      object Edit13: TEdit
        Left = 392
        Top = 144
        Width = 57
        Height = 21
        TabOrder = 5
        Text = '9'
      end
      object Edit14: TEdit
        Left = 392
        Top = 80
        Width = 57
        Height = 21
        TabOrder = 6
        Text = '0,001'
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'GapTab'
      ImageIndex = 2
      object Button6: TButton
        Left = 336
        Top = 287
        Width = 89
        Height = 25
        Caption = 'Gap  Calc'
        TabOrder = 0
        OnClick = Button6Click
      end
      object Memo5: TMemo
        Left = 1
        Top = 8
        Width = 288
        Height = 305
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 1
      end
    end
    object SleepSafe: TTabSheet
      Caption = 'SleepSafe'
      ImageIndex = 3
      object Memo6: TMemo
        Left = 1
        Top = 8
        Width = 288
        Height = 305
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object SleepSafe_Calc: TButton
        Left = 392
        Top = 280
        Width = 89
        Height = 25
        Caption = 'SleepSafe_Calc'
        TabOrder = 1
        OnClick = SleepSafe_CalcClick
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'ABS_SD'
      ImageIndex = 4
      object Label20: TLabel
        Left = 8
        Top = 280
        Width = 48
        Height = 13
        Caption = 'SD_Const'
      end
      object Label21: TLabel
        Left = 120
        Top = 280
        Width = 57
        Height = 13
        Caption = 'SD_Coef_H'
      end
      object Label22: TLabel
        Left = 120
        Top = 304
        Width = 55
        Height = 13
        Caption = 'SD_Coef_L'
      end
      object Label23: TLabel
        Left = 232
        Top = 280
        Width = 38
        Height = 13
        Caption = 'SD_Mul'
      end
      object Label24: TLabel
        Left = 328
        Top = 280
        Width = 40
        Height = 13
        Caption = 'SD_Add'
      end
      object Edit16: TEdit
        Left = 64
        Top = 272
        Width = 41
        Height = 21
        TabOrder = 0
        Text = '1'
      end
      object Edit17: TEdit
        Left = 184
        Top = 272
        Width = 41
        Height = 21
        TabOrder = 1
        Text = '2'
      end
      object Edit18: TEdit
        Left = 184
        Top = 296
        Width = 41
        Height = 21
        TabOrder = 2
        Text = '150'
      end
      object Edit19: TEdit
        Left = 272
        Top = 272
        Width = 41
        Height = 21
        TabOrder = 3
        Text = '80'
      end
      object Edit20: TEdit
        Left = 368
        Top = 272
        Width = 41
        Height = 21
        TabOrder = 4
        Text = '5'
      end
      object Button12: TButton
        Left = 424
        Top = 272
        Width = 89
        Height = 25
        Caption = 'ABS_SD_Calc'
        TabOrder = 5
        OnClick = Button12Click
      end
      object Chart1: TChart
        Left = 24
        Top = 0
        Width = 441
        Height = 250
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          'TChart')
        Title.Visible = False
        Legend.Visible = False
        View3D = False
        TabOrder = 6
        object Series2: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clGreen
          LinePen.Color = 16711808
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Series3: TLineSeries
          ColorEachPoint = True
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          LinePen.Color = clRed
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Series4: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clBlue
          VertAxis = aRightAxis
          Dark3D = False
          LinePen.Color = 8454143
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
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
        object Series5: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = -1
          VertAxis = aRightAxis
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
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
    end
  end
end
