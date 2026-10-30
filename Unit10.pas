unit Unit10;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics,
  IdBaseComponent,Forms, IdComponent, IdTCPConnection, IdTCPClient, Sockets,
  StdCtrls, Controls,IdIOHandler, IdTCPServer, ScktComp, Grids;

type
  TForm10 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    ButtonXBR1: TButton;
    ButtonXBR2: TButton;
    Edit4: TEdit;
    ButtonXBR3: TButton;
    Edit5: TEdit;
    mmo1: TMemo;
    Edit6: TEdit;
    ClientSocket1: TClientSocket;
    lst1: TListBox;
    procedure Connect_Text;
    procedure Receive_From_ELM;
    procedure tcpsrvr1Accept(Sender: TObject;
      ClientSocket: TCustomIpClient);
    procedure ButtonXBR1Click(Sender: TObject);
    procedure ButtonXBR2Click(Sender: TObject);
    procedure idtcpclnt1Connected(Sender: TObject);
    procedure idtcpsrvr1Execute(AThread: TIdPeerThread);
    procedure idtcpclnt1Disconnected(Sender: TObject);
    procedure ButtonXBR3Click(Sender: TObject);
    procedure TcpClient1Connect(Sender: TObject);
    procedure TcpClient1Disconnect(Sender: TObject);
    procedure TcpClient1Send(Sender: TObject; Buf: PAnsiChar;
      var DataLen: Integer);
    procedure TcpClient1Receive(Sender: TObject; Buf: PAnsiChar;
      var DataLen: Integer);
    procedure ClientSocket1Connect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocket1Write(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocket1Disconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure lst1Click(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;
  IP,Port,
  msgFromClient,
  msgToClient: String;
  TcpClient: TIdTCPClient;
  TcpServer: TIdTCPServer;
  TcpConnect: Boolean;
  BtnConnect: Boolean;
  BufR,BufS: PAnsiChar;
  LenR,LenS,CntR,CntL: Integer;
  Rec_Cmpl: Boolean;
  Buff: array[0..100] of Integer;
  Buff1: array[0..1000] of Byte;
implementation

{$R *.dfm}

procedure TForm10.tcpsrvr1Accept(Sender: TObject;
  ClientSocket: TCustomIpClient);
var
  str: string;
begin
  str := ClientSocket.Receiveln;

end;

procedure TForm10.Connect_Text;
begin
 // if idtcpclnt1.Connected then TcpConnect :=true
 //                         else TcpConnect :=false;
  if BtnConnect and TcpConnect then
                           Edit4.Text :='Connected'
  else if not BtnConnect and not TcpConnect then
                           Edit4.Text :='Disconnected'
  else Edit4.Text :='?';
end;

procedure TForm10.idtcpclnt1Connected(Sender: TObject);
begin
    Connect_Text;
end;

procedure TForm10.idtcpclnt1Disconnected(Sender: TObject);
begin
    Connect_Text;
end;

procedure TForm10.ButtonXBR1Click(Sender: TObject);
var
  P: Integer;
begin
  Port := Edit2.Text;
  IP := Edit1.Text;
  P := StrToInt(Port);
  BtnConnect:= True;
  // Server
{  idtcpsrvr1.Active := False;
  idtcpsrvr1.DefaultPort := P;
  idtcpsrvr1.Active  := True;
  // Client
  idtcpclnt1.BoundIP := Edit1.Text;
  idtcpclnt1.BoundPort := P;
  idtcpclnt1.Connect(1000);
  BtnConnect:= True;
  Connect_Text;  }

 { TcpClient1.RemoteHost:=IP;
  TcpClient1.RemotePort:=Port;
  TcpClient1.Connect; }

  ClientSocket1.Host:=IP;
  ClientSocket1.Port:= P;
  ClientSocket1.Open;
  msgToClient:= '  Connected';
end;
procedure TForm10.TcpClient1Connect(Sender: TObject);
begin
     Edit4.Text :='Connected';
end;

procedure TForm10.ButtonXBR2Click(Sender: TObject);
begin
 // idtcpsrvr1.Active    := False; {Disconnect First}
 // idtcpclnt1.Disconnect;
    BtnConnect:= False;
 // Connect_Text;
 //   TcpClient1.Disconnect;

    ClientSocket1.Close;
end;
procedure TForm10.TcpClient1Disconnect(Sender: TObject);
begin
     Edit4.Text :='Disconnected';
end;

procedure TForm10.idtcpsrvr1Execute(AThread: TIdPeerThread);
var
S: String;
begin
    IP:= AThread.Connection.Socket.Binding.PeerIP;
//    msgFromClient:= AThread.Connection.ReadLn;
    S := 'From: ' + IP + msgFromClient;
    mmo1.Lines.Add(S);
// WriteLn(Format('%s: %s', [AThread.Connection.Socket.Binding.PeerIP,S]));
   //AThread.Connection.WriteLn('Indy Zip Code Server Ready.');

end;


procedure TForm10.Receive_From_ELM;
var
S: String;
begin
   Rec_Cmpl:=False;
 //   TcpClient1.Receiveln(msgFromClient);
  //  TcpClient1.ReceiveBuf(msgFromClient,20,0);
//    TcpClient1.ReceiveBuf(S,14,0);
  //  TcpClient1.ReceiveFrom(msgFromClient, SizeOf(msgFromClient),
  //     (TcpClient1.GetSocketAddr(TcpClient1.RemoteHost,
  //                               TcpClient1.RemotePort)),1);
 //   S := 'Rec: ' + msgFromClient;
 //   mmo1.Lines.Add(S);
//  repeat Application.ProcessMessages until Rec_Cmpl;
end;

procedure TForm10.ButtonXBR3Click(Sender: TObject);
begin
    mmo1.Clear;
  //  ButtonXBR3.Enabled:=False;
    msgToClient:= Edit5.Text +#13+#10;

 //   TcpClient1.Sendln(msgToClient);
    msgFromClient:='';
 //   CntR:=0;
    CntL:=0;
  //  Receive_From_ELM;
    ClientSocket1.Socket.SendText(msgToClient);
end;
procedure TForm10.TcpClient1Send(Sender: TObject; Buf: PAnsiChar;
  var DataLen: Integer);
var
   S: String;
   i: Integer;
begin
    LenS:= DataLen;
    BufR:= Buf;
{    if LenR <>0 then
    begin
        BufR:= Buf;
        for i:=0 to LenR do
        S := S + Char(Buf[i]);
  //      msgFromClient:=S;
    end;}
 //   S := 'Sent: ' + msgToClient;
    mmo1.Lines.Add(S);
end;



procedure TForm10.TcpClient1Receive(Sender: TObject; Buf: PAnsiChar;
  var DataLen: Integer);
var
   S: String;
   i: Integer;
begin
//    S := 'Rec: ' + msgFromClient;
//  mmo1.Lines.Add(S);
    Rec_Cmpl:=true;
 //   if DataLen <> 0 then
    begin
    CntR:=CntR+1;
    Edit6.Text:=IntToStr(CntR);
    Form10.Refresh;

  //  S := 'Buf: ' + Char(Buf);
  //  mmo1.Lines.Add(S);

    S := '';
    LenR:= DataLen;
    BufR:= Buf;
    if LenR <>0 then
    begin
        BufR:= Buf;
        for i:=0 to LenR-1 do
        S := S + Char(BufR[i]);
        msgFromClient:=S;
        mmo1.Lines.Add('Rec: ' +S);
    end;
// S := 'Rec: ' + msgFromClient;
//    mmo1.Lines.Add(S);
 //   if Pos(msgToClient,msgFromClient) <>0 then
//    if LenR <>0 then
//    Receive_From_ELM;
//    else
 //   begin
//    TcpClient1.Disconnect;
    ButtonXBR3.Enabled:=true;
//    Receive_From_ELM;
 //   end;

//    TcpClient1.Disconnect;
   end;
  // else Break();
  // TcpClient1.Disconnect;
end;



procedure TForm10.ClientSocket1Connect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
     Edit4.Text :='Connected';
end;

procedure TForm10.ClientSocket1Write(Sender: TObject;
  Socket: TCustomWinSocket);
begin
    mmo1.Lines.Add('Sent: ' + msgToClient);
end;

procedure TForm10.ClientSocket1Disconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
     Edit4.Text :='Disconnected';
end;

procedure TForm10.ClientSocket1Read(Sender: TObject;
  Socket: TCustomWinSocket);
var
   S: String;
   i: Integer;
begin
    msgFromClient:=Socket.ReceiveText;
    mmo1.Lines.Add('Rec: ' +msgFromClient);
    CntR:=CntR+1;
    Edit6.Text:=IntToStr(CntR);
    Form10.Refresh;


 //   for i:=0 to Socket.ReceiveLength-1 do
 //   Buff[i] := Socket.ReceiveBuf[i];
    LenR:= Socket.ReceiveLength;
    Socket.ReceiveBuf(Buff,LenR);

end;

procedure TForm10.lst1Click(Sender: TObject);
begin
   CntL:= lst1.ItemIndex;
     Edit5.Text:=lst1.Items.Strings[CntL];
end;

end.
