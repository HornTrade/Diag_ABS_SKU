unit Unit_ELM;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics,
  IdBaseComponent,Forms, IdComponent, IdTCPConnection, IdTCPClient, Sockets,
  StdCtrls, Controls,IdIOHandler, IdTCPServer, ScktComp, Grids, ExtCtrls;

Type PGN_Type=record
     PGN:string;
     R:byte;
     Data :array[0..100] of Byte;
     Str :array[0..100] of string;
     Cmpl:boolean;
end;

type
  TFormELM = class(TForm)
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
    tmr1: TTimer;
    WrECUID: TButton;
    Wr2: TButton;
    Wr3: TButton;
    Edit7: TEdit;
    WrVIN: TButton;
    Edit8: TEdit;
    WrSOFT: TButton;
    Edit9: TEdit;
    WrDM2: TButton;
    WrEH: TButton;
    WrDM_1: TButton;
    Edit10: TEdit;
    DMGrid: TStringGrid;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Label4: TLabel;
    Label5: TLabel;

    procedure ButtonXBR1Click(Sender: TObject);
    procedure ButtonXBR2Click(Sender: TObject);
    procedure ButtonXBR3Click(Sender: TObject);

    procedure ClientSocket1Connect(Sender: TObject;
                           Socket: TCustomWinSocket);
    procedure ClientSocket1Write(Sender: TObject;
                           Socket: TCustomWinSocket);
    procedure ClientSocket1Disconnect(Sender: TObject;
                           Socket: TCustomWinSocket);
    procedure ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure lst1Click(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure WrECUIDClick(Sender: TObject);
    procedure Wr2Click(Sender: TObject);
    procedure Wr3Click(Sender: TObject);
    function  HexStrToByte(Str:string):byte;
    procedure WrVINClick(Sender: TObject);
    function  Read_PGN(P:PGN_Type):string;
    procedure WrSOFTClick(Sender: TObject);
    procedure WrDM2Click(Sender: TObject);
    procedure WrEHClick(Sender: TObject);
    procedure WrDM_1Click(Sender: TObject);
    function  ERR_SPN_FMI(Spn:word;Fmi:byte):string;
    procedure DMGrid_View(A:string;N:byte);
    function  MOD_FMI(B:byte):string;
    function  SS_FMI(B:byte):string;
    function  DIFF_FMI(B:byte):string;
    function  DIFR_FMI(B:byte):string;
    function  CAN_FMI(B:byte):string;
    function  DIFT_FMI(B:byte):string;
    function  SAS_FMI(B:byte):string;
    function  AGS_FMI(B:byte):string;
    function  PS_FMI(B:byte):string;
    function  MC1_FMI(B:byte):string;
    function  MC2_FMI(B:byte):string;
    function  MC3_FMI(B:byte):string;
    function  Power_FMI(B:byte):string;
    function  PK_FMI(B:byte):string;
    function  DBR_FMI(B:byte):string;
    function  B7_FMI(B:byte):string;
    function  WL_FMI(B:byte):string;
    function  ASRL_FMI(B:byte):string;
    function  GND_FMI(B:byte):string;
    function  CANT_FMI(B:byte):string;

  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  FormELM: TFormELM;
  IP,Port, msgFromClient, msgToClient: String;
 // BufR,BufS: PAnsiChar;
  LenR,LenS,CntR,CntL,Max,MaxK,Nrow: Integer;
  BtnConnect, Rec_Cmpl, Tmr_Cmpl, Rec_DM1, Rec_EH: Boolean;
  SOFT,ECUID,VIN,DM1,DM2,EH: PGN_Type;
  sErr,sEb,Str: String;
implementation

uses mainABSdiag;

{$R *.dfm}
function  TFormELM.MOD_FMI(B:byte):string;
var
  S : string;
begin
      Case B of
      22: S:='0';
      26: S:='1';
      3:  S:='2';
      23: S:='3';
      5:  S:='4';
      25: S:='5';
      4:  S:='6';
      24: S:='7';
      9:  S:='8';
      27: S:='9';
      28: S:='10';
      29: S:='11';
      end;
      MOD_FMI:=S;
end;

function  TFormELM.SS_FMI(B:byte):string;
var
  S : string;
begin
      Case B of
      7: S:='0';
      3: S:='1';
      4: S:='2';
      5: S:='3';
      6:  S:='4';
      10: S:='5';
      16: S:='6';
      8:  S:='7';
      22: S:='8';
      27: S:='9';
      23: S:='10';
      24: S:='11';
      end;
      SS_FMI:=S;
end;

function  TFormELM.DIFF_FMI(B:byte):string;
var
  S : string;
begin
      Case B of
      5: S:='0';
      4: S:='1';
      3: S:='2';
      9: S:='3';
      end;
      DIFF_FMI:=S;
end;
function  TFormELM.DIFR_FMI(B:byte):string;
var
  S : string;
begin
      Case B of
      5: S:='4';
      4: S:='5';
      3: S:='6';
      9: S:='7';
      end;
      DIFR_FMI:=S;
end;

function  TFormELM.CAN_FMI(B:byte):string;
var
  S : string;
begin
      Case B of
      19: S:='0';
      22: S:='1';
      2:  S:='2';
      23: S:='3';
      11: S:='4';
      end;
      CAN_FMI:=S;
end;

function  TFormELM.DIFT_FMI(B:byte):string;
var
  S : string;
begin
      Case B of
      5: S:='4';
      4: S:='6';
      3: S:='2';
      9: S:='9';
      7: S:='15';
      end;
      DIFT_FMI:=S;
end;

function  TFormELM.SAS_FMI(B:byte):string;
var
  S : string;
begin
      Case B of
      19: S:='0';
      12: S:='1';
      22: S:='2';
      13: S:='3';
      23: S:='4';
      11: S:='5';
      14: S:='7';
      end;
      SAS_FMI:=S;
end;

function  TFormELM.AGS_FMI(B:byte):string;
var
  S : string;
begin
      Case B of
      19: S:='0';
      13: S:='1';
      22: S:='2';
      9:  S:='3';
      23: S:='4';
      24: S:='5';
      25: S:='6';
      14: S:='7';
      end;
      AGS_FMI:=S;
end;

function  TFormELM.PS_FMI(B:byte):string;
var
  S : string;
begin
      Case B of
      19: S:='0';
      22: S:='1';
      23: S:='2';
      24: S:='3';
      5:  S:='4';
      26: S:='5';
      27: S:='6';
      25: S:='7';
      end;
      PS_FMI:=S;
end;

function  TFormELM.MC1_FMI(B:byte):string;
var
  S : string;
begin
      Case B of
      2: S:='0';
      25: S:='1';
      23: S:='2';
      24: S:='3';
      22:  S:='4';
      26: S:='5';
      27: S:='6';
      14: S:='7';
      end;
      MC1_FMI:=S;
end;

function  TFormELM.MC2_FMI(B:byte):string;
var
  S : string;
begin
      Case B of
      23: S:='8';
      2:  S:='9';
      24: S:='10';
      26: S:='11';
      27: S:='12';
      11: S:='13';
      end;
      MC2_FMI:=S;
end;

function  TFormELM.MC3_FMI(B:byte):string;
var
  S : string;
begin
      Case B of
      24: S:='0';
      23: S:='1';
      22: S:='2';
      25: S:='3';
      26: S:='4';
      14: S:='5';
      27: S:='6';
      28: S:='7';
      end;
      MC3_FMI:=S;
end;

function  TFormELM.Power_FMI(B:byte):string;
var
  S : string;
begin
      Case B of
      5: S:='2';
      4: S:='3';
      3: S:='4';
      11: S:='5';
      16: S:='6';
      end;
      Power_FMI:=S;
end;

function  TFormELM.PK_FMI(B:byte):string;
var
  S : string;
begin
      Case B of
      5: S:='0';
      4: S:='1';
      3: S:='2';
      11: S:='3';
      end;
      PK_FMI:=S;
end;

function  TFormELM.DBR_FMI(B:byte):string;
var
  S : string;
begin
      Case B of
      5: S:='0';
      3: S:='1';
      11: S:='2';
      end;
      DBR_FMI:=S;
end;

function  TFormELM.B7_FMI(B:byte):string;
var
  S : string;
begin
      Case B of
      5: S:='0';
      8: S:='1';
      2: S:='2';
      21: S:='3';
      19: S:='4';
      11: S:='5';
      end;
      B7_FMI:=S;
end;

function  TFormELM.WL_FMI(B:byte):string;
var
  S : string;
begin
      Case B of
      5: S:='0';
      3: S:='1';
      22: S:='4';
      19: S:='5';
      26: S:='6';
      27: S:='7';
      end;
      WL_FMI:=S;
end;

function  TFormELM.ASRL_FMI(B:byte):string;
var
  S : string;
begin
      Case B of
      5: S:='2';
      3: S:='3';
      end;
      ASRL_FMI:=S;
end;


function  TFormELM.GND_FMI(B:byte):string;
var
  S : string;
begin
      Case B of
      11: S:='0';
      5:  S:='2';
      25: S:='3';
      4:  S:='4';
      3:  S:='5';
      24: S:='6';
      23: S:='7';
      end;
      GND_FMI:=S;
end;

function  TFormELM.CANT_FMI(B:byte):string;
var
  S : string;
begin
      Case B of
      19: S:='0';
      22: S:='1';
      2:  S:='2';
      5:  S:='3';
      25: S:='4';
      3:  S:='5';
      23: S:='6';
      11: S:='7';
      end;
      CANT_FMI:=S;
end;


function  TFormELM.ERR_SPN_FMI(Spn:word;Fmi:byte):string;
var
  S : string;
begin
      Case Spn of
      597: begin sErr:='B15'; sEb:= WL_FMI(Fmi); end;  //Brake Switch
      609: begin sErr:='B4'; sEb:= MC2_FMI(Fmi); end;
      629: begin sErr:='B4'; sEb:= MC1_FMI(Fmi); end;
      627: begin sErr:='B5'; sEb:= Power_FMI(Fmi); end;
      639: begin sErr:='B13'; sEb:= CAN_FMI(Fmi); end;
      697: begin sErr:='B10'; sEb:= PK_FMI(Fmi); end;
      701: begin sErr:='B27'; sEb:= GND_FMI(Fmi); end;
      789: begin sErr:='B0'; sEb:= SS_FMI(Fmi); end;
      790: begin sErr:='B1'; sEb:= SS_FMI(Fmi); end;
      791: begin sErr:='B2'; sEb:= SS_FMI(Fmi); end;
      792: begin sErr:='B3'; sEb:= SS_FMI(Fmi); end;
      793: begin sErr:='B17'; sEb:= SS_FMI(Fmi); end;
      794: begin sErr:='B18'; sEb:= SS_FMI(Fmi); end;
      795: begin sErr:='B6'; sEb:= MOD_FMI(Fmi); end;
      796: begin sErr:='B7'; sEb:= MOD_FMI(Fmi); end;
      797: begin sErr:='B8'; sEb:= MOD_FMI(Fmi); end;
      798: begin sErr:='B9'; sEb:= MOD_FMI(Fmi); end;
      799: begin sErr:='B20'; sEb:= MOD_FMI(Fmi); end;
      800: begin sErr:='B19'; sEb:= MOD_FMI(Fmi); end;
      801: begin sErr:='B16'; sEb:= DBR_FMI(Fmi); end;
      806: begin sErr:='B11'; sEb:= DIFF_FMI(Fmi); end;
      807: begin sErr:='B11'; sEb:= DIFR_FMI(Fmi); end;
      810: begin sErr:='B14'; sEb:= B7_FMI(Fmi); end;
      1624: begin sErr:='B14'; sEb:= B7_FMI(Fmi); end;
      811: begin sErr:='B15'; sEb:= WL_FMI(Fmi); end;
      812: begin sErr:='B15'; sEb:= ASRL_FMI(Fmi); end;
      847: begin sErr:='B29'; sEb:= DIFT_FMI(Fmi); end;
      880: begin sErr:='B15'; sEb:= WL_FMI(Fmi); end; //Stop Lamp Circuit
      1042: begin sErr:='B26'; sEb:= CANT_FMI(Fmi); end;
      1047: begin sErr:='B25'; sEb:= PS_FMI(Fmi); end;
      1058: begin sErr:='B25'; sEb:= PS_FMI(Fmi); end;
      1727: begin sErr:='B25'; sEb:= PS_FMI(Fmi); end;
      1808: begin sErr:='B23'; sEb:= AGS_FMI(Fmi); end;
      1812: begin sErr:='B22'; sEb:= SAS_FMI(Fmi); end;
      5109: begin sErr:='B24'; sEb:= MC3_FMI(Fmi); end;
      end;
  //    ERR_SPN_FMI:=DiagIni.ReadString(sErr, name, '')+
  //                 DiagIni.ReadString(sErr, sEb, 'Ошибка не описана');
end;
function TFormELM.HexStrToByte(Str:string):byte;
var
  hexstr,strH,strL : string;
begin
   hexstr := '123456789ABCDEF';
   HexStrToByte:=Pos(Str[1],hexstr)*16+
                 Pos(Str[2],hexstr);
end;

procedure TFormELM.DMGrid_View(A:string;N:byte);
var
   sSPN,sFMI,sN: String;
   i,N1: Integer;
   dSPN:Word;
   dFMI,dN:Byte;
begin
      N1:= N;
      DMGrid.RowCount:=N+2;
      DMGrid.ColWidths[1]:=50;
      DMGrid.ColWidths[4]:=200;
      DMGrid.ColWidths[5]:=200;
      DMGrid.FixedRows:=1;
      DMGrid.FixedCols:=1;
      DMGrid.Cells[0,0]:='№';
      DMGrid.Cells[1,0]:='SPN';
      DMGrid.Cells[2,0]:='FMI';
      DMGrid.Cells[3,0]:='Num';
      DMGrid.Cells[4,0]:='            Место';
      DMGrid.Cells[5,0]:='            Тип неисправности';
      for i:=1 to DMGrid.RowCount do
      begin
        DMGrid.Cells[0,i]:='';
        DMGrid.Cells[1,i]:='';
        DMGrid.Cells[2,i]:='';
        DMGrid.Cells[3,i]:='';
        DMGrid.Cells[4,i]:='';
        DMGrid.Cells[5,i]:='';
      end;
      for i:=1 to N do
      begin
        dSPN:= HexStrToByte(A[(i-1)*8+1]+A[(i-1)*8+2])+
              (HexStrToByte(A[(i-1)*8+3]+A[(i-1)*8+4]))*256;
        if dSPN <$FFFF then
        begin
        sSPN:=IntToStr(dSPN);
        dFMI:= HexStrToByte(A[(i-1)*8+5]+A[(i-1)*8+6]);
        sFMI:=IntToStr(dFMI);
        dN:= HexStrToByte(A[(i-1)*8+7]+A[(i-1)*8+8]);
        sN:=IntToStr(dN);
        DMGrid.Cells[0,i]:=IntToStr(i);
        DMGrid.Cells[1,i]:=sSPN;
        DMGrid.Cells[2,i]:=sFMI;
        DMGrid.Cells[3,i]:=sN;
        FormELM.ERR_SPN_FMI(dSPN,dFMI);
        if sErr<>'' then
        begin
          DMGrid.Cells[4,i]:=DiagIni.ReadString(sErr, 'name', '');
          if sEb<>'' then
          DMGrid.Cells[5,i]:=DiagIni.ReadString(sErr, sEb, 'Ошибка не описана');
        end;
        end;
      end;
end;

procedure TFormELM.ButtonXBR1Click(Sender: TObject);
var
  P: Integer;
begin
  Port := Edit2.Text;
  IP := Edit1.Text;
  P := StrToInt(Port);
  BtnConnect:= True;
  ClientSocket1.Host:=IP;
  ClientSocket1.Port:= P;
  ClientSocket1.Open;
  msgToClient:= '  Connected';
end;

procedure TFormELM.ButtonXBR2Click(Sender: TObject);
begin
    BtnConnect:= False;
    ClientSocket1.Close;
end;

procedure TFormELM.ButtonXBR3Click(Sender: TObject);
begin
    if  Edit4.Text = 'Disconnected' then Exit;
 //   mmo1.Clear;
    Tmr_Cmpl:=False;
    Rec_Cmpl:=False;
    tmr1.Enabled:=True;
    msgToClient:= Edit5.Text +#13+#10;
    msgFromClient:='';
 //   CntR:=0;
    CntL:=0;
    ClientSocket1.Socket.SendText(msgToClient);
    mmo1.Lines.Add('Sent: ' + msgToClient);
end;


procedure TFormELM.ClientSocket1Connect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
     Edit4.Text :='Connected';
end;
procedure TFormELM.ClientSocket1Disconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
     Edit4.Text :='Disconnected';
end;

procedure TFormELM.ClientSocket1Write(Sender: TObject;
  Socket: TCustomWinSocket);
begin
    mmo1.Lines.Add('Sent: ' + msgToClient);
end;

procedure TFormELM.ClientSocket1Read(Sender: TObject;
  Socket: TCustomWinSocket);
var
   S,A: String;
   i,P,m,N,D,T: Integer;
begin
    msgFromClient:=Socket.ReceiveText;
    mmo1.Lines.Add('Rec: ' +msgFromClient);
    CntR:=CntR+1;
    FormELM.Edit6.Text:=IntToStr(CntR);
    FormELM.Edit11.Text:= msgFromClient;
    if Pos('OK',msgFromClient)>0 then  Rec_Cmpl:=True;
    
    if Rec_DM1 then
    begin
      S:=msgFromClient;
      P:= Pos(':',S);
      if P >0 then
      begin
         i:= HexStrToByte(S[1]+S[2]);
         if Max<i then Max:=i
         else
         begin
           MaxK:=Max;
           Max:=1;
           A:='';
           for m:=1 to MaxK do
           A:=A+ DM1.Str[m];
           Delete(A,1,6);
           for m:=1 to Length(A) do
           if A[m] =' ' then Delete(A,m,1);
           Nrow:=Round(Length(A)/8);
           Str:=A;
           FormELM.Edit10.Text:=Str;
           FormELM.Edit12.Text:= IntToStr(Nrow);
           DMGrid_View(Str,Nrow);
         end;
         Delete(S,1,P);                   //начало до :
         Delete(S,Length(S)-1,Length(S)); // в конце #D
         DM1.Str[i]:=S;
      end;
    end;
    if Rec_EH then
    begin
      S:=msgFromClient;
      for m:=1 to Length(S) do
      if S[m] =' ' then Delete(S,m,1);
      Edit10.Text:=S;
      D:=HexStrToByte(S[1]+S[2])+
         HexStrToByte(S[3]+S[4])*256+
         HexStrToByte(S[5]+S[6])*65536;
      FormELM.Edit13.Text:=FloatToStrF(D/10,ffFixed,10,2);
      T:=HexStrToByte(S[9]+S[10])+
         HexStrToByte(S[11]+S[12])*256+
         HexStrToByte(S[13]+S[14])*65536;
      FormELM.Edit14.Text:=FloatToStrF(T/128,ffFixed,10,2);
    end;

 //   FormELM.Refresh;
 //   LenR:= Socket.ReceiveLength;
 //   Socket.ReceiveBuf(Buff,LenR);

end;

procedure TFormELM.lst1Click(Sender: TObject);
begin
     CntL:= lst1.ItemIndex;
     Edit5.Text:=lst1.Items.Strings[CntL];
end;

procedure TFormELM.tmr1Timer(Sender: TObject);
begin
     Tmr_Cmpl:=true;
     tmr1.Enabled:=False;
end;


procedure TFormELM.Wr2Click(Sender: TObject);
var
   S,A: String;
   i,P: Integer;
begin
    Rec_DM1:=True;
    Rec_EH:=False;
    for i:=1 to 7 do DM1.Str[i]:='';
    Max:=1;
    FormELM.Edit5.Text:='AT DM1';
    FormELM.ButtonXBR3Click(nil);
    repeat Application.ProcessMessages until (Tmr_Cmpl or Rec_Cmpl);
end;

procedure TFormELM.Wr3Click(Sender: TObject);
var
   S,A: String;
begin
    FormELM.Edit5.Text:='AT Z';
    FormELM.ButtonXBR3Click(nil);
    repeat Application.ProcessMessages until (Tmr_Cmpl or Rec_Cmpl);
    FormELM.Edit5.Text:='AT E0';
    FormELM.ButtonXBR3Click(nil);
    repeat Application.ProcessMessages until (Tmr_Cmpl or Rec_Cmpl);
    FormELM.Edit5.Text:='AT SP A';
    FormELM.ButtonXBR3Click(nil);
    repeat Application.ProcessMessages until (Tmr_Cmpl or Rec_Cmpl);
    FormELM.Edit5.Text:='AT ST FA'; //1c
    FormELM.ButtonXBR3Click(nil);
    repeat Application.ProcessMessages until (Tmr_Cmpl or Rec_Cmpl);
end;



function  TFormELM.Read_PGN(P: PGN_Type):string;
var
   Ps,S,A: String;
   i,k,n,Pr: Integer;
   D:Byte;
begin
    Ps:= P.PGN;
    Pr:= P.R;
    FormELM.Edit5.Text:='AT CP 18';
    FormELM.ButtonXBR3Click(nil);
    repeat Application.ProcessMessages until (Tmr_Cmpl or Rec_Cmpl);
    FormELM.Edit5.Text:='AT SH EA 0B 88';
    FormELM.ButtonXBR3Click(nil);
    msgFromClient:='';
    repeat Application.ProcessMessages until (Tmr_Cmpl or (Rec_Cmpl and (Pos('OK',msgFromClient) <>0)));
    FormELM.Edit5.Text:=Ps+' 00 00 00 00 00 00';
    FormELM.ButtonXBR3Click(nil);
    mmo1.Clear;
    repeat Application.ProcessMessages until (Tmr_Cmpl or Rec_Cmpl);

    S:=mmo1.Lines.ValueFromIndex[0];
    if //(FormELM.mmo1.GetTextLen > 100) and
       (Pos(Ps,S) > 0) then
    begin
    A:='';
    n:= 5;
    for k:=1 to Pr do
    begin
      S:=mmo1.Lines.ValueFromIndex[k];
      for i:=1 to 7 do
      begin
        D:=HexStrToByte(S[i*3+n]+S[i*3+1+n]);
        P.Data[i+(k-1)*7]:=D;
        if (D < 255) and
           (D > 20) then
        Insert(Chr(Ord(D)), A, (i+(k-1)*7));
      end;
    end;
         Read_PGN:= A;
    end
    else Read_PGN:='NO DATA';
end;

procedure TFormELM.WrSOFTClick(Sender: TObject);
begin
   SOFT.PGN:='DA FE';
   SOFT.R:=6;
   FormELM.Edit9.Text:=FormELM.Read_PGN(SOFT);
end;

procedure TFormELM.WrECUIDClick(Sender: TObject);
begin
   ECUID.PGN:='C5 FD';
   ECUID.R:=6;
   FormELM.Edit7.Text:=FormELM.Read_PGN(ECUID);
end;

procedure TFormELM.WrVINClick(Sender: TObject);
begin
   VIN.PGN:='EC FE';
   VIN.R:=3;
   FormELM.Edit8.Text:=FormELM.Read_PGN(VIN);
end;

procedure TFormELM.WrDM2Click(Sender: TObject);
var
   sSPN,sFMI,sN,A,S: String;
   i,P,L,N,R,K: Integer;
   dSPN:Word;
   dFMI,dN:Byte;
begin
   DM2.PGN:='CB FE';
   DM2.R:=1;
   FormELM.Read_PGN(DM2);
   S:=mmo1.Lines.ValueFromIndex[0];
   P:=Pos('ec: 20',S);
   if P>0 then
   begin
      K:= HexStrToByte(S[P+7]+S[P+8]);
      R:= HexStrToByte(S[P+13]+S[P+14]);
      N:=Round((HexStrToByte(S[P+7]+S[P+8])-2)/4);
      A:= '';
      for i:=1 to R do
      begin
        S:=mmo1.Lines.ValueFromIndex[i];
        P:=Pos('Rec:',S);
        Delete(S,1,P+7);
        A:= A+S;
      end;
      Delete(A,1,6); //3
      for i:=1 to Length(A) do
       if A[i] =' ' then Delete(A,i,1);

      DMGrid_View(A,N);
      //Active_Errors_Array[0]:=
      FormELM.Edit10.Text:= A;
   end;
end;

procedure TFormELM.WrEHClick(Sender: TObject);
begin
   EH.PGN:='B1 FE';
   EH.R:=1;
   FormELM.Read_PGN(EH);
   FormELM.Edit5.Text:='AT I';
   FormELM.ButtonXBR3Click(nil);
   repeat Application.ProcessMessages until (Tmr_Cmpl or Rec_Cmpl);
   FormELM.Edit5.Text:='AT MP FE B1';
   FormELM.ButtonXBR3Click(nil);
   Rec_EH:=True;
   Rec_DM1:=False;
   repeat Application.ProcessMessages until (Tmr_Cmpl or Rec_Cmpl);
end;

procedure TFormELM.WrDM_1Click(Sender: TObject);
begin
   DM1.PGN:='CA FE';
   DM1.R:=1;
   FormELM.Read_PGN(DM1);
end;

end.
