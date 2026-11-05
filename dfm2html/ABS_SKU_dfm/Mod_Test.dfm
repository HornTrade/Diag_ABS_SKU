object Form3: TForm3
  Left = 221
  Top = 270
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Акустический тест модулятора'
  ClientHeight = 123
  ClientWidth = 365
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 128
    Top = 90
    Width = 97
    Height = 25
    Caption = 'Abort Test'
    TabOrder = 0
    OnClick = BitBtn1Click
    Kind = bkCancel
  end
  object ProgressBar1: TProgressBar
    Left = 16
    Top = 64
    Width = 337
    Height = 16
    Min = 0
    Max = 100
    TabOrder = 1
  end
end
