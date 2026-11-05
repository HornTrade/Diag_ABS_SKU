object DumpForm: TDumpForm
  Left = 632
  Top = 353
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1044#1072#1084#1087' '#1087#1072#1084#1103#1090#1080
  ClientHeight = 337
  ClientWidth = 692
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
  object Gdump: TStringGrid
    Left = 8
    Top = 24
    Width = 547
    Height = 297
    ColCount = 17
    DefaultColWidth = 30
    DefaultRowHeight = 16
    RowCount = 17
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goThumbTracking]
    TabOrder = 0
    OnSetEditText = GdumpSetEditText
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
    Left = 564
    Top = 200
    Width = 121
    Height = 25
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 1
    OnClick = bQuitClick
  end
  object dumpStatBar: TStatusBar
    Left = 0
    Top = 317
    Width = 692
    Height = 20
    Panels = <>
    SimplePanel = True
  end
  object bRead: TButton
    Left = 564
    Top = 244
    Width = 121
    Height = 25
    Caption = #1055#1088#1086#1095#1080#1090#1072#1090#1100
    Enabled = False
    TabOrder = 3
    OnClick = bReadClick
  end
  object changeSave: TButton
    Left = 564
    Top = 284
    Width = 121
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
    Enabled = False
    TabOrder = 4
    OnClick = changeSaveClick
  end
end
