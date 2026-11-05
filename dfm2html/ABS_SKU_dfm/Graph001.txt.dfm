object Graph: TGraph
  Left = 619
  Top = 189
  Width = 696
  Height = 438
  Caption = 'CAN Graphics'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnActivate = Activated
  OnMouseMove = FormMouseMove
  PixelsPerInch = 96
  TextHeight = 13
  object OscBox: TPaintBox
    Left = 5
    Top = 0
    Width = 681
    Height = 256
    OnMouseDown = OscBoxMouseDown
    OnMouseMove = FormMouseMove
  end
  object Panel1: TPanel
    Left = 0
    Top = 348
    Width = 686
    Height = 35
    Align = alBottom
    Caption = 'Panel1'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 10
      Width = 94
      Height = 13
      Caption = 'Available Identifiers:'
    end
    object Label13: TLabel
      Left = 392
      Top = 10
      Width = 9
      Height = 13
      Caption = '   '
    end
    object ComboBox1: TComboBox
      Left = 112
      Top = 8
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = 'None'
      OnClick = ComboBox1Click
    end
    object ScrollBar1: TScrollBar
      Left = 264
      Top = 10
      Width = 121
      Height = 16
      PageSize = 0
      TabOrder = 1
      OnChange = ScrollBar1Change
    end
    object BitBtn1: TBitBtn
      Left = 608
      Top = 5
      Width = 75
      Height = 25
      Caption = 'Close'
      TabOrder = 2
      OnClick = BitBtn1Click
      Kind = bkCancel
    end
  end
  object GroupBox2: TGroupBox
    Left = 528
    Top = 256
    Width = 153
    Height = 89
    Caption = 'File'
    TabOrder = 2
    object Label3: TLabel
      Left = 16
      Top = 19
      Width = 56
      Height = 13
      Caption = 'Current File:'
    end
    object Button1: TButton
      Left = 16
      Top = 43
      Width = 75
      Height = 25
      Caption = 'Browse'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 256
    Width = 521
    Height = 84
    Caption = 'Graph_Optoins'
    TabOrder = 1
    object Label2: TLabel
      Left = 376
      Top = 32
      Width = 6
      Height = 13
      Caption = '0'
    end
    object Label4: TLabel
      Left = 53
      Top = 16
      Width = 32
      Height = 13
      Caption = 'Label4'
    end
    object Label5: TLabel
      Left = 53
      Top = 32
      Width = 32
      Height = 13
      Caption = 'Label4'
    end
    object Label6: TLabel
      Left = 53
      Top = 48
      Width = 32
      Height = 13
      Caption = 'Label4'
    end
    object Label7: TLabel
      Left = 53
      Top = 64
      Width = 32
      Height = 13
      Caption = 'Label4'
    end
    object Label8: TLabel
      Left = 220
      Top = 16
      Width = 32
      Height = 13
      Caption = 'Label4'
    end
    object Label9: TLabel
      Left = 220
      Top = 32
      Width = 32
      Height = 13
      Caption = 'Label4'
    end
    object Label10: TLabel
      Left = 220
      Top = 48
      Width = 32
      Height = 13
      Caption = 'Label4'
    end
    object Label11: TLabel
      Left = 220
      Top = 64
      Width = 32
      Height = 13
      Caption = 'Label4'
    end
    object Label12: TLabel
      Left = 376
      Top = 16
      Width = 6
      Height = 13
      Caption = '0'
    end
    object Label14: TLabel
      Left = 376
      Top = 48
      Width = 32
      Height = 13
      Caption = 'Label4'
    end
    object Label15: TLabel
      Left = 96
      Top = 16
      Width = 32
      Height = 13
      Caption = 'Label4'
    end
    object Label16: TLabel
      Left = 96
      Top = 32
      Width = 32
      Height = 13
      Caption = 'Label4'
    end
    object Label17: TLabel
      Left = 96
      Top = 48
      Width = 32
      Height = 13
      Caption = 'Label4'
    end
    object Label18: TLabel
      Left = 96
      Top = 63
      Width = 32
      Height = 13
      Caption = 'Label4'
    end
    object Label19: TLabel
      Left = 266
      Top = 16
      Width = 32
      Height = 13
      Caption = 'Label4'
    end
    object Label20: TLabel
      Left = 266
      Top = 32
      Width = 32
      Height = 13
      Caption = 'Label4'
    end
    object Label21: TLabel
      Left = 266
      Top = 48
      Width = 32
      Height = 13
      Caption = 'Label4'
    end
    object Label22: TLabel
      Left = 266
      Top = 63
      Width = 32
      Height = 13
      Caption = 'Label4'
    end
    object CheckBox1: TCheckBox
      Left = 8
      Top = 16
      Width = 41
      Height = 17
      Caption = 'D0'
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnClick = CheckBox1Click
    end
    object CheckBox2: TCheckBox
      Left = 8
      Top = 32
      Width = 41
      Height = 17
      Caption = 'D1'
      Checked = True
      State = cbChecked
      TabOrder = 1
      OnClick = CheckBox1Click
    end
    object CheckBox3: TCheckBox
      Left = 8
      Top = 48
      Width = 41
      Height = 17
      Caption = 'D2'
      Checked = True
      State = cbChecked
      TabOrder = 2
      OnClick = CheckBox1Click
    end
    object CheckBox4: TCheckBox
      Left = 8
      Top = 64
      Width = 41
      Height = 17
      Caption = 'D3'
      Checked = True
      State = cbChecked
      TabOrder = 3
      OnClick = CheckBox1Click
    end
    object CheckBox5: TCheckBox
      Left = 176
      Top = 16
      Width = 41
      Height = 17
      Caption = 'D4'
      Checked = True
      State = cbChecked
      TabOrder = 4
      OnClick = CheckBox1Click
    end
    object CheckBox6: TCheckBox
      Left = 176
      Top = 32
      Width = 41
      Height = 17
      Caption = 'D5'
      Checked = True
      State = cbChecked
      TabOrder = 5
      OnClick = CheckBox1Click
    end
    object CheckBox7: TCheckBox
      Left = 176
      Top = 48
      Width = 41
      Height = 17
      Caption = 'D6'
      Checked = True
      State = cbChecked
      TabOrder = 6
      OnClick = CheckBox1Click
    end
    object CheckBox8: TCheckBox
      Left = 176
      Top = 62
      Width = 41
      Height = 17
      Caption = 'D7'
      Checked = True
      State = cbChecked
      TabOrder = 7
      OnClick = CheckBox1Click
    end
  end
  object MainMenu1: TMainMenu
    Left = 656
  end
  object OpenDialog1: TOpenDialog
    Left = 624
  end
end
