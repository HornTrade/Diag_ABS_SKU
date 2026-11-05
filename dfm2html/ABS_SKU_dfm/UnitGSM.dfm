object FormGSM: TFormGSM
  Left = 803
  Top = 29
  Width = 653
  Height = 817
  Caption = 'FormGSM'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 200
    Top = 40
    Width = 34
    Height = 13
    Caption = #1053#1086#1084#1077#1088
  end
  object Label2: TLabel
    Left = 208
    Top = 64
    Width = 18
    Height = 13
    Caption = 'PIN'
  end
  object Label3: TLabel
    Left = 208
    Top = 96
    Width = 22
    Height = 13
    Caption = 'PUK'
  end
  object Label4: TLabel
    Left = 176
    Top = 16
    Width = 56
    Height = 13
    Caption = #1053#1086#1084#1077#1088' SIM'
  end
  object Label5: TLabel
    Left = 184
    Top = 120
    Width = 46
    Height = 13
    Caption = 'device_id'
  end
  object Label6: TLabel
    Left = 200
    Top = 144
    Width = 26
    Height = 13
    Caption = 'mode'
  end
  object Label7: TLabel
    Left = 200
    Top = 168
    Width = 30
    Height = 13
    Caption = 'bearer'
  end
  object Label8: TLabel
    Left = 176
    Top = 192
    Width = 57
    Height = 13
    Caption = 'SERVER IP'
  end
  object Label9: TLabel
    Left = 160
    Top = 216
    Width = 77
    Height = 13
    Caption = 'SERVER PORT'
  end
  object Label10: TLabel
    Left = 208
    Top = 240
    Width = 22
    Height = 13
    Caption = 'APN'
  end
  object Label11: TLabel
    Left = 168
    Top = 264
    Width = 67
    Height = 13
    Caption = 'LOCAL PORT'
  end
  object Label12: TLabel
    Left = 152
    Top = 456
    Width = 61
    Height = 13
    Caption = 'GPRS profile'
  end
  object Label13: TLabel
    Left = 56
    Top = 496
    Width = 32
    Height = 13
    Caption = 'socket'
  end
  object Label14: TLabel
    Left = 16
    Top = 536
    Width = 73
    Height = 13
    Caption = 'listening socket'
  end
  object Label15: TLabel
    Left = 32
    Top = 448
    Width = 38
    Height = 13
    Caption = 'Label15'
  end
  object Label16: TLabel
    Left = 400
    Top = 696
    Width = 6
    Height = 13
    Caption = '0'
  end
  object Label17: TLabel
    Left = 496
    Top = 696
    Width = 38
    Height = 13
    Caption = 'Label17'
  end
  object Label18: TLabel
    Left = 320
    Top = 736
    Width = 38
    Height = 13
    Caption = 'Label18'
  end
  object Label19: TLabel
    Left = 120
    Top = 52
    Width = 24
    Height = 13
    Caption = 'COM'
  end
  object Label20: TLabel
    Left = 192
    Top = 288
    Width = 36
    Height = 13
    Caption = #1087#1072#1088#1086#1083#1100
  end
  object Label21: TLabel
    Left = 168
    Top = 312
    Width = 68
    Height = 13
    Caption = 'Authentication'
  end
  object Label22: TLabel
    Left = 192
    Top = 336
    Width = 29
    Height = 13
    Caption = 'DNS1'
  end
  object Label23: TLabel
    Left = 192
    Top = 360
    Width = 29
    Height = 13
    Caption = 'DNS2'
  end
  object Button1: TButton
    Left = 24
    Top = 48
    Width = 89
    Height = 25
    Caption = 'Com_Init'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 24
    Top = 88
    Width = 113
    Height = 25
    Caption = 'Com_Close'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Memo1: TMemo
    Left = 384
    Top = 0
    Width = 249
    Height = 385
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object Button3: TButton
    Left = 24
    Top = 128
    Width = 113
    Height = 25
    Caption = 'CONFIG MODE'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 24
    Top = 288
    Width = 115
    Height = 25
    Caption = 'RESTART'
    TabOrder = 4
    OnClick = Button4Click
  end
  object Edit1: TEdit
    Left = 240
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 5
    Text = '+375297639843'
  end
  object Button5: TButton
    Left = 24
    Top = 208
    Width = 113
    Height = 25
    Caption = 'GET'
    TabOrder = 6
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 24
    Top = 168
    Width = 113
    Height = 25
    Caption = 'SET'
    TabOrder = 7
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 24
    Top = 248
    Width = 113
    Height = 25
    Caption = 'TEST'
    TabOrder = 8
    OnClick = Button7Click
  end
  object Edit2: TEdit
    Left = 240
    Top = 64
    Width = 121
    Height = 21
    TabOrder = 9
    Text = '1229'
  end
  object Edit3: TEdit
    Left = 240
    Top = 88
    Width = 121
    Height = 21
    TabOrder = 10
    Text = '06366280'
  end
  object Edit4: TEdit
    Left = 240
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 11
    Text = '+375447029775'
  end
  object Edit5: TEdit
    Left = 240
    Top = 112
    Width = 121
    Height = 21
    TabOrder = 12
    Text = '00216879'
  end
  object Edit6: TEdit
    Left = 240
    Top = 136
    Width = 121
    Height = 21
    TabOrder = 13
    Text = 'slave'
  end
  object Edit7: TEdit
    Left = 240
    Top = 160
    Width = 121
    Height = 21
    TabOrder = 14
    Text = 'GPRS'
  end
  object Edit8: TEdit
    Left = 240
    Top = 184
    Width = 121
    Height = 21
    TabOrder = 15
    Text = '77.74.38.101'
  end
  object Edit9: TEdit
    Left = 240
    Top = 208
    Width = 121
    Height = 21
    TabOrder = 16
    Text = '0'
  end
  object Edit10: TEdit
    Left = 240
    Top = 232
    Width = 121
    Height = 21
    TabOrder = 17
    Text = 'web2.velcom.by'
  end
  object Edit11: TEdit
    Left = 240
    Top = 256
    Width = 121
    Height = 21
    TabOrder = 18
    Text = '9005'
  end
  object Button8: TButton
    Left = 32
    Top = 720
    Width = 75
    Height = 25
    Caption = 'Send'
    TabOrder = 19
    OnClick = Button8Click
  end
  object Button9: TButton
    Left = 128
    Top = 720
    Width = 75
    Height = 25
    Caption = 'Receive'
    TabOrder = 20
    OnClick = Button9Click
  end
  object Edit12: TEdit
    Left = 16
    Top = 328
    Width = 89
    Height = 21
    TabOrder = 21
    Text = 'AT+CGATT=1'
  end
  object Button10: TButton
    Left = 112
    Top = 328
    Width = 65
    Height = 25
    Caption = 'Button10'
    TabOrder = 22
    OnClick = Button10Click
  end
  object Edit13: TEdit
    Left = 8
    Top = 624
    Width = 129
    Height = 21
    TabOrder = 23
    Text = 'AT+CUSD=1,"*100#",15'
  end
  object Button11: TButton
    Left = 144
    Top = 624
    Width = 75
    Height = 25
    Caption = 'Button11'
    TabOrder = 24
    OnClick = Button11Click
  end
  object Edit14: TEdit
    Left = 16
    Top = 16
    Width = 113
    Height = 21
    TabOrder = 25
    Text = '115200'
  end
  object Button12: TButton
    Left = 232
    Top = 656
    Width = 75
    Height = 25
    Caption = 'Button12'
    TabOrder = 26
    OnClick = Button12Click
  end
  object Edit15: TEdit
    Left = 8
    Top = 688
    Width = 129
    Height = 21
    TabOrder = 27
    Text = 'at+cops?'
  end
  object Button13: TButton
    Left = 24
    Top = 568
    Width = 75
    Height = 25
    Caption = 'registration'
    TabOrder = 28
    OnClick = Button13Click
  end
  object Button14: TButton
    Left = 264
    Top = 448
    Width = 75
    Height = 25
    Caption = 'Store in NVM'
    TabOrder = 29
    OnClick = Button14Click
  end
  object Button15: TButton
    Left = 112
    Top = 568
    Width = 113
    Height = 25
    Caption = 'Activate GPRS profile'
    TabOrder = 30
    OnClick = Button15Click
  end
  object Button16: TButton
    Left = 240
    Top = 568
    Width = 113
    Height = 25
    Caption = 'Deactivate GPRS'
    TabOrder = 31
    OnClick = Button16Click
  end
  object Button17: TButton
    Left = 144
    Top = 656
    Width = 75
    Height = 25
    Caption = 'Set binary'
    TabOrder = 32
    OnClick = Button17Click
  end
  object Edit16: TEdit
    Left = 8
    Top = 656
    Width = 129
    Height = 21
    TabOrder = 33
    Text = '30'
  end
  object Edit17: TEdit
    Left = 224
    Top = 448
    Width = 33
    Height = 21
    TabOrder = 34
    Text = '0'
  end
  object Edit18: TEdit
    Left = 96
    Top = 488
    Width = 41
    Height = 21
    TabOrder = 35
    Text = '1'
  end
  object Edit19: TEdit
    Left = 96
    Top = 528
    Width = 41
    Height = 21
    TabOrder = 36
    Text = '0'
  end
  object Button18: TButton
    Left = 144
    Top = 488
    Width = 113
    Height = 25
    Caption = 'Client Socket '
    TabOrder = 37
    OnClick = Button18Click
  end
  object Button19: TButton
    Left = 144
    Top = 528
    Width = 113
    Height = 25
    Caption = 'Listening Socket'
    TabOrder = 38
    OnClick = Button19Click
  end
  object Button20: TButton
    Left = 272
    Top = 488
    Width = 75
    Height = 25
    Caption = 'Close socket'
    TabOrder = 39
    OnClick = Button20Click
  end
  object Button21: TButton
    Left = 272
    Top = 528
    Width = 75
    Height = 25
    Caption = 'Close socket'
    TabOrder = 40
    OnClick = Button21Click
  end
  object Edit20: TEdit
    Left = 144
    Top = 48
    Width = 25
    Height = 21
    TabOrder = 41
    Text = '1'
  end
  object Edit21: TEdit
    Left = 232
    Top = 696
    Width = 65
    Height = 21
    TabOrder = 42
    Text = '30'
  end
  object Memo2: TMemo
    Left = 384
    Top = 424
    Width = 249
    Height = 201
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 43
  end
  object Button22: TButton
    Left = 384
    Top = 648
    Width = 97
    Height = 25
    Caption = 'TCPClient Connect'
    TabOrder = 44
    OnClick = Button22Click
  end
  object Button23: TButton
    Left = 496
    Top = 648
    Width = 129
    Height = 25
    Caption = 'TCPClient1 Disconnect'
    TabOrder = 45
    OnClick = Button23Click
  end
  object Button24: TButton
    Left = 224
    Top = 744
    Width = 75
    Height = 25
    Caption = 'Button24'
    TabOrder = 46
    OnClick = Button24Click
  end
  object Button25: TButton
    Left = 376
    Top = 728
    Width = 75
    Height = 25
    Caption = 'Button25'
    TabOrder = 47
    OnClick = Button25Click
  end
  object stop: TButton
    Left = 128
    Top = 752
    Width = 75
    Height = 25
    Caption = 'stop'
    TabOrder = 48
  end
  object Button26: TButton
    Left = 504
    Top = 728
    Width = 75
    Height = 25
    Caption = 'Button26'
    TabOrder = 49
    OnClick = Button26Click
  end
  object Edit22: TEdit
    Left = 240
    Top = 280
    Width = 121
    Height = 21
    TabOrder = 50
    Text = 'web2'
  end
  object Edit23: TEdit
    Left = 240
    Top = 304
    Width = 121
    Height = 21
    TabOrder = 51
    Text = '0'
  end
  object Edit24: TEdit
    Left = 240
    Top = 328
    Width = 121
    Height = 21
    TabOrder = 52
    Text = '77.74.36.229'
  end
  object Edit25: TEdit
    Left = 240
    Top = 352
    Width = 121
    Height = 21
    TabOrder = 53
    Text = '8.8.8.8'
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 144
    Top = 176
  end
  object Timer2: TTimer
    Enabled = False
    OnTimer = Timer2Timer
    Left = 144
    Top = 232
  end
end
