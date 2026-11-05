object FormModification: TFormModification
  Left = 981
  Top = 155
  Width = 260
  Height = 217
  Caption = #1052#1086#1076#1080#1092#1080#1082#1072#1094#1080#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 4
    Width = 225
    Height = 129
    Caption = #1042#1099#1073#1086#1088' '#1052#1086#1076#1080#1092#1080#1082#1072#1094#1080#1080
    TabOrder = 0
    object ModelGrid: TStringGrid
      Left = 32
      Top = 18
      Width = 169
      Height = 104
      ColCount = 2
      DefaultColWidth = 30
      DefaultRowHeight = 16
      RowCount = 6
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect, goThumbTracking]
      ScrollBars = ssVertical
      TabOrder = 0
      OnSelectCell = ModelGridSelectCell
      ColWidths = (
        30
        192)
      RowHeights = (
        16
        16
        16
        16
        16
        16)
    end
  end
  object GroupBox: TGroupBox
    Left = 8
    Top = 134
    Width = 225
    Height = 40
    TabOrder = 1
    object Label1: TLabel
      Left = 4
      Top = 16
      Width = 76
      Height = 13
      Caption = #1042#1099#1073#1088#1072#1085' '#1053#1086#1084#1077#1088
    end
    object Edit1: TEdit
      Left = 86
      Top = 12
      Width = 129
      Height = 21
      TabOrder = 0
    end
  end
end
