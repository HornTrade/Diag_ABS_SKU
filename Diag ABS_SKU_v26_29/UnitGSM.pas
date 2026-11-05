unit UnitGSM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,  ExtCtrls, Sockets;

type
  TFormGSM = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    Button3: TButton;
    Button4: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Label2: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Edit4: TEdit;
    Label5: TLabel;
    Edit5: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Edit6: TEdit;
    Edit7: TEdit;
    Label8: TLabel;
    Edit8: TEdit;
    Label9: TLabel;
    Edit9: TEdit;
    Label10: TLabel;
    Edit10: TEdit;
    Label11: TLabel;
    Edit11: TEdit;
    Button8: TButton;
    Button9: TButton;
    Edit12: TEdit;
    Button10: TButton;
    Edit13: TEdit;
    Button11: TButton;
    Edit14: TEdit;
    Button12: TButton;
    Edit15: TEdit;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Edit16: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Edit17: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    Button18: TButton;
    Button19: TButton;
    Button20: TButton;
    Button21: TButton;
    Edit20: TEdit;
    Edit21: TEdit;
    Memo2: TMemo;
    Button22: TButton;
    Button23: TButton;
    Label15: TLabel;
    Timer1: TTimer;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Timer2: TTimer;
    Button24: TButton;
    Button25: TButton;
    stop: TButton;
    Label19: TLabel;
    Button26: TButton;
    Edit22: TEdit;
    Label20: TLabel;
    Label21: TLabel;
    Edit23: TEdit;
    Label22: TLabel;
    Edit24: TEdit;
    Label23: TLabel;
    Edit25: TEdit;
  procedure FormShow(Sender: TObject);
  procedure StrToBuf(STR:String);
  procedure StrToModem(STR:String);
  procedure ReadToMemo;
  procedure ATStrToBuf(STR:String);
  procedure ATComToModem(AT_STR:String);
  procedure ReadModem;
  procedure ATComFromModem(Ask:String);
  procedure SendCom(SENDstr:string);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure IdTCPClient1Connected(Sender: TObject);
    procedure IdTCPClient1Disconnected(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Button24Click(Sender: TObject);
    procedure Button25Click(Sender: TObject);
    procedure Button26Click(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var


implementation


{$R *.dfm}

procedure TFormGSM.FormShow(Sender: TObject);
begin
      Memo1.Clear;
end;
procedure TFormGSM.Button1Click(Sender: TObject);
Var
    BR:Integer;
    ComStr:string;
begin
        GSMMake:=true;
        Memo1.Clear;

      if strToInt(Edit20.Text) < 10 then ComStr:='COM'+Edit20.Text
                                    else ComStr:='\\.\COM'+Edit20.Text;
      hCOM:=CreateFile(PChar(ComStr),
                    Generic_Read or Generic_Write,
                    0,nil,
                    Open_Existing,
                    0,0);
     If hCOM=Invalid_Handle_Value then begin
     ShowMessage('Не могу открыть порт');
     end;
     Memo2.Clear;
     Memo2.SelText:=FloatToStr(hCOM);
     Memo2.Lines.Add('');
  //      Com_Baudrate(115200);
        BR:=StrToInt(Edit14.Text);
        Com_Baudrate(BR);
    //    Tgsm:=gsmThread.Create(false);
 //   T1:=ComThread.Create(false);
 //   T1.Priority:=tpNormal;
    //    EscapeCommFunction(hCOM, setDTR);
    //    EscapeCommFunction(hCOM, setrts);


end;

procedure TFormGSM.Button2Click(Sender: TObject);
begin
    //Com_Close;
    CloseHandle(hCOM);
    GSMMake:=false;
   // T1.Terminate;
end;

procedure TFormGSM.Button3Click(Sender: TObject);
Var
    TempStr:String;
    Loop:Integer;
begin
  //     Memo1.Clear;
    //   StrToBuf('*get mode#');
//       StrToBuf('AT+CGMM');
       StrToBuf('AT+CLAC');

{       TempStr:='';
       for Loop := 1 to BytesToGSM do TempStr:=TempStr+char(DataToGSM[Loop]);
       Memo1.SelText:=TempStr;

     WriteFile(hCom,DataToGSM,BytesToGSM,Bytes,nil);}

     DataToGSM[1]:=byte(' ');
     BytesToGSM:=1;
     repeat
     WriteFile(hCom,DataToGSM,BytesToGSM,Bytes,nil);
     ReadFile(hCom,DataFromGSM,1,Bytes,nil);
     Application.ProcessMessages;
     until Bytes<>0;

     ReadToMemo;
end;


Procedure TFormGSM.StrToBuf;//(STR:String);
Var
    TempString:String;
    Loop:Integer;
begin
  TempString:=Concat(STR,#13,#10);
  BytesToGSM :=Length(TempString);
  for Loop := 1 to BytesToGSM do DataToGSM[Loop]:=byte(TempString[Loop]);
end;

Procedure TFormGSM.ATStrToBuf;//(STR:String);
Var
    TempString:String;
    Loop:Integer;
begin
  TempString:=Concat(STR,#13);
  BytesToGSM :=Length(TempString);
  for Loop := 1 to BytesToGSM do DataToGSM[Loop]:=byte(TempString[Loop]);
end;

Procedure TFormGSM.StrToModem;//(STR:String);
Var
    TempString:String;
    Loop:Integer;
begin
      TempString:=Concat(STR,#13,#10);
      BytesToGSM :=Length(TempString);
      for Loop := 1 to BytesToGSM do DataToGSM[Loop]:=byte(TempString[Loop]);
// эхо в Memo
      TempString:='***';
      for Loop := 1 to BytesToGSM do TempString:=TempString+char(DataToGSM[Loop]);
      Memo1.SelText:=TempString;

      WriteFile(hCom,DataToGSM,BytesToGSM,Bytes,nil);
end;

Procedure TFormGSM.ReadToMemo;
Var
    TempStr:String;
    Loop:Integer;
begin
     repeat
       ReadFile(hCom,DataFromGSM,255,Bytes,nil);
       TempStr:='';
       for Loop := 1 to Bytes do TempStr:=TempStr+char(DataFromGSM[Loop]);
       Memo1.SelText:=TempStr;
       Application.ProcessMessages;
     until Bytes=0;
end;


procedure TFormGSM.Button4Click(Sender: TObject);
begin
     StrToModem('RESTART');
     ReadToMemo;
end;

procedure TFormGSM.Button5Click(Sender: TObject);
begin
     StrToModem('get');
     ReadToMemo;
end;

procedure TFormGSM.Button6Click(Sender: TObject);
begin
     StrToModem('set mode '+Edit6.Text);//slave');
     ReadToMemo;
     StrToModem('set bearer '+Edit7.Text);
     ReadToMemo;
     StrToModem('set csd_phone '+Edit4.Text);
     ReadToMemo;
     StrToModem('set auth_phone1 '+Edit1.Text);
     ReadToMemo;
     StrToModem('pin '+Edit2.Text);
     ReadToMemo;
     StrToModem('puk '+Edit3.Text);
     ReadToMemo;
     StrToModem('set data_format 8N1');
     ReadToMemo;
     StrToModem('set device_id '+Edit5.Text);
     ReadToMemo;
     StrToModem('set server_ip '+Edit8.Text);
     ReadToMemo;
     StrToModem('set server_port '+Edit9.Text);
     ReadToMemo;
     StrToModem('set apn '+Edit10.Text);
     ReadToMemo;
     StrToModem('set local_port '+Edit11.Text);
     ReadToMemo;
end;

procedure TFormGSM.Button7Click(Sender: TObject);
begin
     StrToModem('TEST');
     repeat
     ReadToMemo;
     until not GSMMake;
end;

procedure TFormGSM.Button9Click(Sender: TObject);
begin
     repeat
     ReadToMemo;
     until not GSMMake;
end;

procedure TFormGSM.Button8Click(Sender: TObject);
Var
    TempString:String;
    Loop:Integer;
begin
 //    repeat
      BytesToGSM :=10;
      for Loop := 1 to BytesToGSM do DataToGSM[Loop]:=44;//Loop;
// эхо в Memo
      TempString:='***';
      for Loop := 1 to BytesToGSM do TempString:=TempString+char(DataToGSM[Loop]);
      Memo1.SelText:=TempString;
      WriteFile(hCom,DataToGSM,BytesToGSM,Bytes,nil);
      Application.ProcessMessages;
 //    until not GSMMake;
  // TempString:=char(255)+char(250)+char(44)+char(1)+char(0)+char(1)+char(194)+char(255)+
   //           char(240)+char(34)+char(78)+char(75)+char(83)+char(79)+char(82);
   //           Memo1.SelText:=TempString;
end;

procedure TFormGSM.Button10Click(Sender: TObject);
begin
     StrToModem(Edit12.Text);
     ReadToMemo;
end;

// ******************************************************
//     MODEM COM/G10
//*******************************************************

procedure TFormGSM.ATComToModem;
Var
    TempStr:String;
    Loop:Integer;
    BRec:Integer;
begin
       ATStrToBuf(AT_STR);
         for Loop := 1 to BytesToGSM do TempStr:=TempStr+char(DataToGSM[Loop]);
       Memo1.SelText:=TempStr+#10;

       WriteFile(hCom,DataToGSM,BytesToGSM,Bytes,nil);
   //    EXO
   //    BytesFromGSM:=BytesToGSM+3;
   //    ReadModem;
    // ASK
         TempStr:='OK'+#13+#10;
         ATComFromModem(TempStr);
   //    BytesFromGSM:=250;
   //    ReadModem;
end;

procedure TFormGSM.ReadModem;
Var
    TempStr:String;
    Loop,qwe:Integer;
begin
       GSMsinxr:=false;
       StrFromGSM:='';
       repeat
       ReadFile(hCom,DataFromGSM,BytesFromGSM,Bytes,nil);
       if Bytes <>0 then begin
 //      TempStr:='';
       for Loop := 1 to Bytes do StrFromGSM:=StrFromGSM+char(DataFromGSM[Loop]);
       Memo1.SelText:=StrFromGSM;
       GSMsinxr:=true;
       end;
       qwe:=qwe+1;
       Label15.Caption:=IntToStr(qwe);
       if not GSMMake then exit;
       Application.ProcessMessages;
       until  GSMsinxr;
end;

procedure TFormGSM.ATComFromModem;
Var
    TempStr:String;
    Loop,qwe:Integer;
begin
       GSMsinxr:=false;
       StrFromGSM:='';
       repeat
       ReadFile(hCom,DataFromGSM,8,Bytes,nil);
       TempStr:='';
       if Bytes <>0 then begin
       for Loop := 1 to Bytes do TempStr:=TempStr+char(DataFromGSM[Loop]);
       Memo1.SelText:=TempStr;
       StrFromGSM:=StrFromGSM+TempStr;
  //     GSMsinxr:=true;
       end;
       if ((Pos(Ask,StrFromGSM)<>0) or
           (Pos('ERR',StrFromGSM)<>0))
       then        GSMsinxr:=true;
       if not GSMMake then exit;
       Application.ProcessMessages;
       until  GSMsinxr;
end;

procedure TFormGSM.Button11Click(Sender: TObject);
Var
    TempStr:String;
    Loop:Integer;
begin
     ATComToModem(Edit13.Text);
end;

procedure TFormGSM.Button12Click(Sender: TObject);
Var
    TempStr:String;
    SendBytes,Loop:Integer;
begin
 //    repeat
      SendBytes :=StrToInt(Edit16.Text);
      testBytes:=0;
     repeat
      if  (SendBytes-255)>0 then begin
         BytesToGSM :=255;
         SendBytes :=SendBytes-255;
         end else begin
         BytesToGSM :=SendBytes;
         SendBytes :=0;
         end;
      for Loop := 1 to BytesToGSM do DataToGSM[Loop]:=Loop;
       testBytes:=testBytes+BytesToGSM;
       WriteFile(hCom,DataToGSM,BytesToGSM,Bytes,nil);
  //     TempStr:='';
  //     for Loop := 1 to BytesToGSM do TempStr:=TempStr+char(DataToGSM[Loop]);
  //     Memo1.SelText:=TempStr;
     until  SendBytes=0;
   //    FormGSM.Timer1.Enabled:=true;
   //    FormGSM.Timer1.Interval:=2000;
     ATComFromModem('+NSOWR:');
  FormGSM.Label18.Caption:=IntToStr(testBytes);

end;

procedure TFormGSM.Button13Click(Sender: TObject);
Var
    TempStr:String;
    Loop:Integer;
    BRec:Integer;
begin
{       ATStrToBuf('AT+IPR=9600');
         for Loop := 1 to BytesToGSM do TempStr:=TempStr+char(DataToGSM[Loop]);
       Memo1.SelText:=TempStr+#10;

       WriteFile(hCom,DataToGSM,BytesToGSM,Bytes,nil);
       sleep(100);
        Com_Baudrate(9600);
       sleep(100);
         TempStr:='OK'+#13+#10;
         ATComFromModem(TempStr);  }

// Serial interface settings
 //    ATComToModem('ATE0');

     ATComToModem('AT+ICF=3,0');
     ATComToModem('AT+IFC=0,0');
     ATComToModem('AT\Q0');

//   Use verbose <err> values

     ATComToModem('AT+CMEE=0');

//   Ask for automatic operator selection and registration
//     ATComToModem('at+cops=0');
     ATComToModem('AT+COPS=1,0,"BY VELCOM"');
//   SIM requests PIN
//     ATComToModem('at+cpin="1229"');
//   Ask for automatic operator selection and registration
//     ATComToModem('at+cops=0');
//   Get the operator name
     ATComToModem('AT+COPS?');

end;


procedure TFormGSM.Button14Click(Sender: TObject);
begin
     ATComToModem('at+npsda='+Edit17.Text+',0');
     ATComToModem('at+npsd='+Edit17.Text);

//   Specify APN  for the GPRS profile 0
     ATComToModem('at+npsd='+Edit17.Text+',1,"'+Edit10.Text+'"');
//   Set Username parameter for GPRS profile 0
     ATComToModem('at+npsd='+Edit17.Text+',2,"'+Edit22.Text+'"');
//   Set Password of profile 0
     ATComToModem('at+npsd='+Edit17.Text+',3,"'+Edit22.Text+'"');
//DNS1
     ATComToModem('at+npsd='+Edit17.Text+',4,"'+Edit24.Text+'"');
//DNS2
     ATComToModem('at+npsd='+Edit17.Text+',5,"'+Edit25.Text+'"');
// Authentication none
     ATComToModem('at+npsd='+Edit17.Text+',6,'+Edit23.Text);
//     ATComToModem('at+npsd='+Edit17.Text+',6,1');
// QoS

     ATComToModem('at+npsd='+Edit17.Text+',10,2');
     ATComToModem('at+npsd='+Edit17.Text+',11,4');
     ATComToModem('at+npsd='+Edit17.Text+',12,5');
     ATComToModem('at+npsd='+Edit17.Text+',13,5');
     ATComToModem('at+npsd='+Edit17.Text+',14,31');

// QoS min

     ATComToModem('at+npsd='+Edit17.Text+',15,2');
     ATComToModem('at+npsd='+Edit17.Text+',16,4');
     ATComToModem('at+npsd='+Edit17.Text+',17,5');
     ATComToModem('at+npsd='+Edit17.Text+',18,5');
     ATComToModem('at+npsd='+Edit17.Text+',19,31');

//   Set IP address
     ATComToModem('at+npsd='+Edit17.Text+',7,"'+Edit8.Text+'"');

//     ATComToModem('at+npsd=0,7,"0.0.0.0" ');


//   Get all the parameters related to GPRS profile 0
     ATComToModem('at+npsd='+Edit17.Text+'');
//   These parameters are all volatile
     ATComToModem('at+npsda='+Edit17.Text+',1');
//   Store all the parameters of profile 0 in NVM
//     ATComToModem('at+npsda=0,3');
end;

procedure TFormGSM.Button15Click(Sender: TObject);
begin
//   Load from NVM a GPRS profile
     ATComToModem('AT+NPSDA='+Edit17.Text+',2');
//   Get all the parameters related to GPRS profile 0
//     ATComToModem('at+npsd='+Edit17.Text+'');


//   Activate GPRS profile 0
     ATComToModem('AT+NPSDA='+Edit17.Text+',3');
//   Create a socket and associate it to TCP protocol
     ATComToModem('AT+NSOCR=6');
//   Connect the socket 0 peer-to-peer to the remote end
     ATComToModem('at+nsoli='+Edit19.Text+','+Edit11.Text);
//     FormGSM.Timer1.Enabled:=true;
//     FormGSM.Timer1.Interval:=100;
end;

procedure TFormGSM.Button16Click(Sender: TObject);
begin
//   Close socket 0
     ATComToModem('at+nsocl='+Edit18.Text);
//   Close socket 0
     ATComToModem('at+nsocl='+Edit19.Text);
//   Deactivate GPRS profile 0
     ATComToModem('at+npsda='+Edit17.Text+',4');
end;

procedure TFormGSM.Button17Click(Sender: TObject);
Var
    TempStr:String;
    Loop:Integer;
begin
//     ATComToModem('AT+NSOWR='+Edit18.Text+','+Edit16.Text);
       TempStr:='AT+NSOWR='+Edit18.Text+','+Edit16.Text;
       ATStrToBuf(TempStr);
       TempStr:='';
       for Loop := 1 to BytesToGSM do TempStr:=TempStr+char(DataToGSM[Loop]);
       Memo1.SelText:=TempStr+#10;
       WriteFile(hCom,DataToGSM,BytesToGSM,Bytes,nil);
       BytesFromGSM:=BytesToGSM+3;
       ATComFromModem('@');

 //      ReadModem;
end;

procedure TFormGSM.Button18Click(Sender: TObject);
begin
//   Create a socket and associate it to TCP protocol
     ATComToModem('AT+NSOCR=6');
//   Connect the socket 0 peer-to-peer to the remote end
     ATComToModem('AT+NSOCO='+Edit18.Text+',"'+Edit8.Text+'",'+Edit11.Text);
 //    ATComToModem('at+nsoli='+Edit19.Text+','+Edit11.Text);
end;

procedure TFormGSM.Button19Click(Sender: TObject);
begin
//   Create a socket and associate it to TCP protocol
     ATComToModem('AT+NSOCR=6');
//   Connect the socket 0 peer-to-peer to the remote end
     ATComToModem('at+nsoli='+Edit19.Text+','+Edit11.Text);

     repeat
     ReadToMemo;
     until not GSMMake;

end;

procedure TFormGSM.Button20Click(Sender: TObject);
begin
//   Close socket 
     ATComToModem('at+nsocl='+Edit18.Text);
end;

procedure TFormGSM.Button21Click(Sender: TObject);
begin
//   Close socket
     ATComToModem('at+nsocl='+Edit19.Text);
end;

procedure TFormGSM.Button22Click(Sender: TObject);
 Var
    LenRd:String;
begin
  //FormGSM.IdTCPClient1.Host:=Edit8.Text;
 // FormGSM.IdTCPClient1.Port:=StrToInt(Edit11.Text);
 // idTcpClient1.ReadTimeout := 100;
 // FormGSM.IdTCPClient1.Connect;
  BytesRecievFromGSM:= 0;
  testBytes:= 0;
       BytesFromGSM:=100;
       ReadModem;
       if Pos('+NUSORD:',StrFromGSM) <>0 then begin
       Delete(StrFromGSM,1,Pos('+NUSORD:',StrFromGSM)+7);
       LenRd:=Copy(StrFromGSM,1,(Pos(#13,StrFromGSM)-1));
       FormGSM.Memo1.Lines.Add(LenRd);
       end;
       ATComToModem('at+nsord='+LenRd);
   //    BytesFromGSM:=50;
   //    ReadModem;
       Memo1.SelText:='-------------------'+#13+#10;
       ATComToModem('at+nsowr=1,18,"data to be written"');
   //    BytesFromGSM:=50;
   //    ReadModem;

        FormGSM.Timer2.Enabled:=true;

    //   if Pos('Connected',StrFromGSM) <>0 then begin
   //    FormGSM.Button17Click(nil);
   //    FormGSM.Button12Click(nil);
    //   end;
   //    Tgsm:=gsmThread.Create(false);

end;

procedure TFormGSM.IdTCPClient1Connected(Sender: TObject);
 Var
    buf:String;
begin
    Memo2.SelText:='Connected'+#13+#10;
  //  IdTCPServer1.Active:=true;
 //   FormGSM.idTCPClient1.WriteLn('Connected');
  //  FormGSM.Timer2.Enabled:=true;


  //  Tgsm:=gsmThread.Create(false);
 { While FormGSM.IdTcpClient1.Connected do
  begin
  buf := FormGSM.idTCPClient1.readln('');
  if buf <> '' then begin
  FormGSM.Memo2.Lines.Add(buf);
  BytesRecievFromGSM:=BytesRecievFromGSM+length(buf);
  FormGSM.Label16.Caption:=IntToStr(BytesRecievFromGSM);
  buf:='';
  end;
  end;}
end;

procedure TFormGSM.IdTCPClient1Disconnected(Sender: TObject);
begin
    Memo2.SelText:='Disconnected'+#13+#10;
  //  IdTCPServer1.Free;
  //  Tgsm.Terminate;
end;

procedure TFormGSM.Button23Click(Sender: TObject);
begin
 //  FormGSM.IdTCPClient1.Disconnect;
   FormGSM.Timer2.Enabled:=false;
  //  Tgsm.Terminate;
end;





{

I am in the process of designing an app where A is the client (that I am
writing )and B is the (provided) server. A connects to B via a TCP protocol
exchanging XML frames. After A sends its request and awaits the answer from
B, A needs to listen on some port for (multiple) callbacks from B and must
answer those before receiving the final result from B. So the sequence is
A ------request----->B
A <--request--- B
A ----reply--->B
A <--request--- B
A ----reply--->B
A <--request--- B
A ----reply--->B
A <------reply------- B
// A connects to B
IdTCPClient.Connect;
try
with IdTCPClient.IOHandler do
begin
WriteBufferOpen;
Write(Length(MyRequest));
Write(MyRequest);
WriteBufferClose;
end;
// A must handle intermediate requests from B
IdSimpleServer := TIdSimpleServer.Create;
try
IdSimpleServer.BoundPort := 20007;
try
IdSimpleServer.Listen(1000);
while IdSimpleServer.Connected do
begin
try
with IdSimpleServer.IOHandler do
begin
MyTempResult := ReadString(ReadInteger());
WriteBufferOpen;
Write(Length(MyTempReply));
Write(MyTempReply);
WriteBufferClose;
end;
except
on E: EIdConnClosedGracefully do
; // nothing
end;
end;
except
on E: EIdAcceptTimeout do
; // no temp replies
end;
finally
IdSimpleServer.Free;
end;
// get result
with IdTCPClient.IOHandler do
MyResult := ReadString(ReadInteger());
finally
IdTCPClient.Disconnect;
end;
Philip

}
{
idTcpClient1.Host := 'xxx.xxx.xxx.xxx';
idTcpClient1.Port := xxxx;
idTcpClient1.ReadTimeout := 1000;
idTCPClient1.Connect;
idTCPClient1.SendCmd('dir');
try
While IdTcpClient1.Connected do
begin
buf := idTCPClient1.readln('');
Memo1.Lines.Add('Data ---' + buf);
end;
except
Memo1.Lines.Add('Time OUT!');
end;
Начинаем бесконечный цикл, посылаем команду на сервак, и читаем построчно ответы, как отолько ответов нет 1000 мс то срабатывает except - значит, что все строки посылаемые с сервака закончились. Выходим из цикла и работаем дальше.

Можно сделать так:
a := true;

While not a do
begin
try
buf := idTCPClient1.readln('');
Memo1.Lines.Add('Data ---' + buf);
except
a := False;
end;
end;

Memo1.Lines.Add('Соединение с сервером '+Edit1.Text);
idTCPClient1.Host:=Edit1.Text;
idTCPClient1.Port:=8090;
try
idTCPClient1.Connect();
except
on E: exception do
 memo1.lines.add('There are Errors: '+E.message);
end;

procedure TfrmMain.ClientSocketRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
inputBuffer: array[0..10] of smallint;
BufPos     : integer;
begin
  Socket.ReceiveBuf(inputBuffer,10);
 
  for BufPos := 0 to 10 do
  begin
    strData := strData+' '+IntToStr(inputBuffer[BufPos]);
  end;
  Memo.Lines.Add('Принял буффер:'+strData);
end;
]
 var
  vRA: TiaKioskRawAnswer;
begin
  vRA := TiaKioskRawAnswer.Create;
  try
    vRA.Add('Disconnected from ' + TidTCPClient(Sender).Socket.Binding.PeerIP + ':' + IntToStr(TidTCPClient(Sender).Socket.Binding.PeerPort));
    try
      GetAllLines(vRA);
    except
      on e: EIdConnClosedGracefully do
        DoOnDisconnected( vRA );
    end;
  finally
    FreeAndNil(vRA);
  end;
end;
 }


procedure TFormGSM.Timer1Timer(Sender: TObject);
begin
       if GSMMake=false then begin FormGSM.Timer1.Enabled:=false;
                       end else begin
       BytesFromGSM:=30;
       ReadModem;
       end;
end;

procedure TFormGSM.Timer2Timer(Sender: TObject);
var
        buf: string;
        MemStr:TMemoryStream;
begin
{  buf := FormGSM.idTCPClient1.readln('');
  if buf <> '' then begin
  FormGSM.Memo2.Lines.Add(buf);
  BytesRecievFromGSM:=BytesRecievFromGSM+length(buf);
  FormGSM.Label16.Caption:=IntToStr(BytesRecievFromGSM);
  buf:='';
  end; }

  try
  MemStr:=TMemoryStream.Create;
 // FormGSM.idTCPClient1.ReadStream(MemStr,-1,False);
  MemStr.Position:=0;
  FormGSM.Memo2.Lines.LoadFromStream(MemStr);
  finally
  MemStr.Free;
  end;
end;

procedure TFormGSM.Button24Click(Sender: TObject);
Var
    TempString:String;
    Loop:Integer;
begin
  TempString:='Send'+FormGSM.Edit21.Text+#13;
  BytesToGSM :=Length(TempString);
  for Loop := 1 to BytesToGSM do DataToGSM[Loop]:=byte(TempString[Loop]);

  WriteFile(hCom,DataToGSM,BytesToGSM,Bytes,nil);

  BytesFromGSM:=StrToInt(FormGSM.Edit16.Text);

       GSMsinxr:=false;

       repeat
       if not GSMMake then exit;
       Application.ProcessMessages;
       until  GSMsinxr;

end;


procedure TFormGSM.SendCom;
var
    TempString:String;
    Loop:Integer;
begin
  TempString:=SENDstr;
  BytesToGSM :=Length(TempString);
  for Loop := 1 to BytesToGSM do DataToGSM[Loop]:=byte(TempString[Loop]);
  Memo1.SelText:=TempString+#10;
  WriteFile(hCom,DataToGSM,BytesToGSM,Bytes,nil);
end;

procedure TFormGSM.Button25Click(Sender: TObject);
var
 freq,  StartF, StopF : int64;
 TimeF: single;  //integer;
     TempString:String;
    Loop:Integer;
begin
  if not QueryPerformanceFrequency(freq) then
   ShowMessage('Эта аппаратура не поддерживает высокоразрешающий счетчик');
      ATComFromModem('+NUSORD:');
         FormGSM.Memo2.Lines.Add('1');
    QueryPerformanceCounter(StartF);
       ATComToModem('AT+NSORD=1,7');
          FormGSM.Memo2.Lines.Add('2');
       Button17Click(nil);
          FormGSM.Memo2.Lines.Add('3');
       Button12Click(nil);
          FormGSM.Memo2.Lines.Add('4');
     QueryPerformanceCounter(StopF);




 { SendCom('SEND_IVAN');
  ATComFromModem('SEND_KIRILL');
  SendCom('END_SEND');
  ATComFromModem('END_SEND');
      QueryPerformanceCounter(StopF); }
   TimeF:=(StopF-StartF)/freq*1000;//1000 - SToMs
        FormGSM.Memo2.Lines.Add(FloatToStr(TimeF));
 //  Tgsm.Terminate;
 //  GSMMake:=false;
end;

procedure TFormGSM.Button26Click(Sender: TObject);
var
 freq,  StartF, StopF : int64;
 TimeF: single;  //integer;
     TempString:String;
    Loop:Integer;
begin
{  if not QueryPerformanceFrequency(freq) then
   ShowMessage('Эта аппаратура не поддерживает высокоразрешающий счетчик');
  //    ATComFromModem('+NUSORD:');
  //       FormGSM.Memo2.Lines.Add('1');
    QueryPerformanceCounter(StartF);
  //     ATComToModem('AT+NSORD=1,7');
  //        FormGSM.Memo2.Lines.Add('2');
  //     Button17Click(nil);
  //        FormGSM.Memo2.Lines.Add('3');
  //     Button12Click(nil);
  //        FormGSM.Memo2.Lines.Add('4');
  //   QueryPerformanceCounter(StopF);

  ATComFromModem('SEND_IVAN');
  SendCom('SEND_KIRILL');
  ATComFromModem('END_SEND');
  SendCom('END_SEND');
      QueryPerformanceCounter(StopF);
   TimeF:=(StopF-StartF)/freq*1000;//1000 - SToMs
        FormGSM.Memo2.Lines.Add(FloatToStr(TimeF)); }
 // Tgsm:=gsmThread.Create(false);
  GSMMake:=true;
end;

end.
