object AuthorizedForm: TAuthorizedForm
  Left = 980
  Top = 372
  Width = 260
  Height = 284
  Caption = #1040#1074#1090#1086#1088#1080#1079#1072#1094#1080#1103
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
  object Button1: TButton
    Left = 136
    Top = 216
    Width = 97
    Height = 25
    Caption = #1042#1085#1077#1089#1090#1080' '#1074' '#1057#1087#1080#1089#1086#1082
    TabOrder = 0
    OnClick = Button1Click
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 4
    Width = 225
    Height = 137
    Caption = #1057#1087#1080#1089#1086#1082' '#1040#1074#1090#1086#1088#1080#1079#1086#1074#1072#1085#1085#1099#1093'  '#1051#1080#1094
    TabOrder = 1
    object AuthorizedGrid: TStringGrid
      Left = 40
      Top = 16
      Width = 177
      Height = 111
      ColCount = 2
      DefaultColWidth = 30
      DefaultRowHeight = 16
      RowCount = 6
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect, goThumbTracking]
      ScrollBars = ssVertical
      TabOrder = 0
      OnSelectCell = AuthorizedGridSelectCell
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
    Top = 142
    Width = 225
    Height = 65
    Caption = 'Authorized'
    TabOrder = 2
    object Label22: TLabel
      Left = 30
      Top = 16
      Width = 42
      Height = 13
      Caption = 'Surname'
    end
    object Label2: TLabel
      Left = 40
      Top = 40
      Width = 28
      Height = 13
      Caption = ' Code'
    end
    object Edit1: TEdit
      Left = 74
      Top = 12
      Width = 140
      Height = 21
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 74
      Top = 36
      Width = 140
      Height = 21
      TabOrder = 1
    end
  end
end
