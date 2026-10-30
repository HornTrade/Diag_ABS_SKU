object FormError: TFormError
  Left = 654
  Top = 352
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'ViewError'
  ClientHeight = 183
  ClientWidth = 654
  Color = clBtnFace
  DragKind = dkDock
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
  object sgError: TStringGrid
    Left = 8
    Top = 16
    Width = 633
    Height = 120
    ColCount = 3
    DefaultColWidth = 155
    FixedCols = 0
    RowCount = 2
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect, goThumbTracking]
    ScrollBars = ssVertical
    TabOrder = 0
    OnSelectCell = sgErrorSelectCell
    ColWidths = (
      515
      57
      205)
  end
  object btnDelete: TButton
    Left = 184
    Top = 144
    Width = 81
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 1
    OnClick = btnDeleteClick
  end
  object btnQuit: TButton
    Left = 304
    Top = 144
    Width = 81
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 2
    OnClick = btnQuitClick
  end
end
