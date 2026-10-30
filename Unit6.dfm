object Form6: TForm6
  Left = 673
  Top = 94
  BorderStyle = bsSingle
  Caption = 'Dump Flash'
  ClientHeight = 388
  ClientWidth = 668
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Motdump: TStringGrid
    Left = 8
    Top = 2
    Width = 547
    Height = 375
    ColCount = 17
    DefaultColWidth = 30
    DefaultRowHeight = 16
    RowCount = 17
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goThumbTracking]
    TabOrder = 0
    ColWidths = (
      30
      30
      30
      30
      30
      30
      30
      30
      30
      30
      30
      30
      30
      30
      30
      30
      30)
    RowHeights = (
      16
      16
      16
      16
      16
      16
      16
      16
      16
      16
      16
      16
      16
      16
      16
      16
      16)
  end
  object bQuit: TButton
    Left = 572
    Top = 296
    Width = 85
    Height = 25
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 1
    OnClick = bQuitClick
  end
  object bRead: TButton
    Left = 572
    Top = 260
    Width = 85
    Height = 25
    Caption = #1055#1088#1086#1095#1080#1090#1072#1090#1100
    Enabled = False
    TabOrder = 2
    OnClick = bReadClick
  end
end
