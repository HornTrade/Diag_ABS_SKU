object FormChoiceDir: TFormChoiceDir
  Left = 340
  Top = 157
  Width = 299
  Height = 290
  BorderIcons = [biSystemMenu]
  Caption = 'Выбор папки'
  Color = clBtnFace
  DragKind = dkDock
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ChoiceDirectory: TDirectoryListBox
    Left = 8
    Top = 8
    Width = 185
    Height = 209
    ItemHeight = 16
    TabOrder = 0
  end
  object ChoiceDrive: TDriveComboBox
    Left = 8
    Top = 232
    Width = 185
    Height = 19
    TabOrder = 1
    OnChange = ChoiceDriveChange
  end
  object btnOk: TButton
    Left = 208
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 2
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 208
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Отмена'
    TabOrder = 3
    OnClick = btnCancelClick
  end
end
