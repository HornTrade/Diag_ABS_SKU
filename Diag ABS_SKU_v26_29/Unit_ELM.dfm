object FormELM: TFormELM
  Left = 726
  Top = 17
  Width = 558
  Height = 652
  Caption = 'FormELM'
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
    Left = 384
    Top = 32
    Width = 22
    Height = 13
    Caption = 'Host'
  end
  object Label2: TLabel
    Left = 384
    Top = 80
    Width = 20
    Height = 13
    Caption = 'Port'
  end
  object Label3: TLabel
    Left = 384
    Top = 56
    Width = 24
    Height = 13
    Caption = 'Mask'
  end
  object Label4: TLabel
    Left = 356
    Top = 530
    Width = 41
    Height = 13
    Caption = 'Distance'
  end
  object Label5: TLabel
    Left = 358
    Top = 554
    Width = 41
    Height = 13
    Caption = 'RunTime'
  end
  object Edit1: TEdit
    Left = 408
    Top = 32
    Width = 89
    Height = 21
    TabOrder = 0
    Text = '192.168.0.10'
  end
  object Edit2: TEdit
    Left = 408
    Top = 80
    Width = 89
    Height = 21
    TabOrder = 1
    Text = '35000'
  end
  object Edit3: TEdit
    Left = 408
    Top = 56
    Width = 89
    Height = 21
    TabOrder = 2
    Text = '255.255.255.0'
  end
  object ButtonXBR1: TButton
    Left = 400
    Top = 128
    Width = 50
    Height = 25
    Caption = 'Connect'
    TabOrder = 3
    OnClick = ButtonXBR1Click
  end
  object ButtonXBR2: TButton
    Left = 464
    Top = 128
    Width = 65
    Height = 25
    Caption = 'Disconnect'
    TabOrder = 4
    OnClick = ButtonXBR2Click
  end
  object Edit4: TEdit
    Left = 408
    Top = 104
    Width = 89
    Height = 21
    TabOrder = 5
  end
  object ButtonXBR3: TButton
    Left = 320
    Top = 128
    Width = 45
    Height = 25
    Caption = 'Send'
    TabOrder = 6
    OnClick = ButtonXBR3Click
  end
  object Edit5: TEdit
    Left = 192
    Top = 128
    Width = 121
    Height = 21
    TabOrder = 7
    Text = 'ATi'
  end
  object mmo1: TMemo
    Left = 8
    Top = 32
    Width = 177
    Height = 289
    Lines.Strings = (
      'Memo3')
    ScrollBars = ssVertical
    TabOrder = 8
  end
  object Edit6: TEdit
    Left = 192
    Top = 160
    Width = 41
    Height = 21
    TabOrder = 9
    Text = ' '
  end
  object lst1: TListBox
    Left = 192
    Top = 32
    Width = 137
    Height = 89
    ItemHeight = 13
    Items.Strings = (
      'AT Z'
      'AT I'
      'AT SP A'
      'AT DM1'
      'AT MP FE BF'
      ''
      'AT AL'
      'AT AR'
      'MR B'
      'MT B'
      'AT CS'
      ''
      'AT SH 18 EA 0B 88'
      'C5 FD 00'
      'AT FC  SH 18 EA 0B FF'
      'AT FC  SD C5 FD 00 00 00 00 00 00'
      'AT FC SM 1'
      'AT E0'
      ''
      '18 EA 0B 88'
      'AT CP18'
      'AT SH  EA 0B 88'
      'C5 FD 00 00 00 00 00 00')
    TabOrder = 10
    OnClick = lst1Click
  end
  object WrECUID: TButton
    Left = 400
    Top = 192
    Width = 50
    Height = 25
    Caption = 'ECUID'
    TabOrder = 11
    OnClick = WrECUIDClick
  end
  object Wr2: TButton
    Left = 472
    Top = 160
    Width = 50
    Height = 25
    Caption = ' DM1'
    TabOrder = 12
    OnClick = Wr2Click
  end
  object Wr3: TButton
    Left = 400
    Top = 160
    Width = 50
    Height = 25
    Caption = 'AT Z'
    TabOrder = 13
    OnClick = Wr3Click
  end
  object Edit7: TEdit
    Left = 280
    Top = 328
    Width = 257
    Height = 21
    TabOrder = 14
    Text = 'Edit7'
  end
  object WrVIN: TButton
    Left = 400
    Top = 224
    Width = 50
    Height = 25
    Caption = 'VIN'
    TabOrder = 15
    OnClick = WrVINClick
  end
  object Edit8: TEdit
    Left = 280
    Top = 352
    Width = 257
    Height = 21
    TabOrder = 16
    Text = 'Edit8'
  end
  object WrSOFT: TButton
    Left = 400
    Top = 256
    Width = 50
    Height = 25
    Caption = ' SOFT'
    TabOrder = 17
    OnClick = WrSOFTClick
  end
  object Edit9: TEdit
    Left = 280
    Top = 376
    Width = 257
    Height = 21
    TabOrder = 18
    Text = 'Edit9'
  end
  object WrDM2: TButton
    Left = 472
    Top = 192
    Width = 50
    Height = 25
    Caption = ' DM2'
    TabOrder = 19
    OnClick = WrDM2Click
  end
  object WrEH: TButton
    Left = 472
    Top = 256
    Width = 50
    Height = 25
    Caption = 'EH'
    TabOrder = 20
    OnClick = WrEHClick
  end
  object WrDM_1: TButton
    Left = 480
    Top = 224
    Width = 50
    Height = 25
    Caption = ' DM1'
    TabOrder = 21
    OnClick = WrDM_1Click
  end
  object Edit10: TEdit
    Left = 96
    Top = 584
    Width = 433
    Height = 21
    TabOrder = 22
    Text = 'Edit10'
  end
  object DMGrid: TStringGrid
    Left = 13
    Top = 402
    Width = 524
    Height = 111
    ColCount = 6
    DefaultColWidth = 25
    DefaultRowHeight = 16
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goThumbTracking]
    TabOrder = 23
    RowHeights = (
      16
      16
      16
      16
      16)
  end
  object Edit11: TEdit
    Left = 240
    Top = 160
    Width = 129
    Height = 21
    TabOrder = 24
    Text = 'Edit11'
  end
  object Edit12: TEdit
    Left = 16
    Top = 520
    Width = 25
    Height = 21
    TabOrder = 25
  end
  object Edit13: TEdit
    Left = 400
    Top = 528
    Width = 121
    Height = 21
    TabOrder = 26
    Text = 'Edit13'
  end
  object Edit14: TEdit
    Left = 400
    Top = 552
    Width = 121
    Height = 21
    TabOrder = 27
    Text = 'Edit14'
  end
  object ClientSocket1: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 0
    OnConnect = ClientSocket1Connect
    OnDisconnect = ClientSocket1Disconnect
    OnRead = ClientSocket1Read
    OnWrite = ClientSocket1Write
    Left = 512
  end
  object tmr1: TTimer
    Enabled = False
    OnTimer = tmr1Timer
    Left = 512
    Top = 48
  end
end
