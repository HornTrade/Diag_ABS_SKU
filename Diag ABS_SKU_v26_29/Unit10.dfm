object Form10: TForm10
  Left = 345
  Top = 131
  Width = 949
  Height = 480
  Caption = 'Form10'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 752
    Top = 56
    Width = 22
    Height = 13
    Caption = 'Host'
  end
  object Label2: TLabel
    Left = 752
    Top = 104
    Width = 20
    Height = 13
    Caption = 'Port'
  end
  object Label3: TLabel
    Left = 752
    Top = 80
    Width = 24
    Height = 13
    Caption = 'Mask'
  end
  object Edit1: TEdit
    Left = 776
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 0
    Text = '192.168.0.10'
  end
  object Edit2: TEdit
    Left = 776
    Top = 104
    Width = 121
    Height = 21
    TabOrder = 1
    Text = '35000'
  end
  object Edit3: TEdit
    Left = 776
    Top = 80
    Width = 121
    Height = 21
    TabOrder = 2
    Text = '255.255.255.0'
  end
  object ButtonXBR1: TButton
    Left = 736
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Connect'
    TabOrder = 3
    OnClick = ButtonXBR1Click
  end
  object ButtonXBR2: TButton
    Left = 832
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Disconnect'
    TabOrder = 4
    OnClick = ButtonXBR2Click
  end
  object Edit4: TEdit
    Left = 776
    Top = 152
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object ButtonXBR3: TButton
    Left = 808
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Send'
    TabOrder = 6
    OnClick = ButtonXBR3Click
  end
  object Edit5: TEdit
    Left = 680
    Top = 256
    Width = 121
    Height = 21
    TabOrder = 7
    Text = 'ATi'
  end
  object mmo1: TMemo
    Left = 8
    Top = 32
    Width = 185
    Height = 289
    Lines.Strings = (
      'Memo3')
    ScrollBars = ssVertical
    TabOrder = 8
  end
  object Edit6: TEdit
    Left = 624
    Top = 256
    Width = 49
    Height = 21
    TabOrder = 9
    Text = ' '
  end
  object lst1: TListBox
    Left = 360
    Top = 32
    Width = 121
    Height = 225
    ItemHeight = 13
    Items.Strings = (
      'AT Z'
      'AT I'
      'AT SP A'
      'AT DM1'
      'AT MP FE BF'
      ''
      'AT SP 9'
      'AT AL'
      'MR B'
      'MT B'
      ''
      'AT CP 18'
      'AT SH EA B FF'
      'AT FC  SH 18 EA B FF'
      'AT FC  SD 0 FE EC'
      'AT FC SM 1')
    TabOrder = 10
    OnClick = lst1Click
  end
  object ClientSocket1: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 0
    OnConnect = ClientSocket1Connect
    OnDisconnect = ClientSocket1Disconnect
    OnRead = ClientSocket1Read
    OnWrite = ClientSocket1Write
    Left = 712
  end
end
