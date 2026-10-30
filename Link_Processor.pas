unit Link_Processor;

interface
uses SysUtils,Forms,Link_Unit,Windows,RoadTest,Classes, Controls, StdCtrls,Queue,Dialogs;

type
    TFormISO = class(TForm)

//Synchronize
        procedure  ReadAllError;
        procedure  ReadAddError;
        procedure  RoadTest_Slide;
        procedure  RunawayLoad;
        procedure  OscRead;
        procedure  ReadOsc;
        procedure  SenOscRead;
        procedure  LampOscRead;
        procedure  PWMSend;
        procedure  SlowdownLoad;
        procedure  StendEPROM;        
        procedure  LoadATcounter(AdrCNT:byte; var cnt:word);
        procedure  LoadATStopCNT;
        procedure  LoadATModCNT;
        procedure  LoadOscAddress;
        procedure  SendSpeed;
        procedure  PolyStopeed;
        procedure  CANRead;
        procedure  SendDSC;
        procedure  ReadAGS;
        procedure  SendPGM;
        procedure  ReadFPROT;
        procedure  ReadEBS22;
        procedure  ReadVDCTestVAR;
        procedure  ReadCANVAR;
        procedure  ReadCAN_TCO;
        procedure  ReadCANVAR2;
        procedure  Read_PcbTest;
        procedure  Read_MDT_Var;
//queue
        procedure  SendInhcnt;
        procedure  SendPGMcnt;
        procedure  ResetMCU;
        procedure  EraseError_EPROM;
        procedure  Erase_EEPROM;
        procedure  Write_EEPROM;
        procedure  InitProgramm_Flash;
 //
        procedure  InitProgramm_STM;
        procedure  EraseProgramm_Flash;
        procedure  WriteProgramm_Flash(Cnt:byte;Adr:word);
        procedure  ReadProgramm_Flash(Cnt:byte;Adr:word);
// ; формат 1-Command 2,3-Adress  4_12-Data
        procedure  Send_Programm_ROM(Command:byte;Adr:word);
        procedure  PGM_Read_Null;
// ; формат 2-Command 3,4,5-Adress  6_36-Data
        procedure  Send_Programm_STM(Command:byte; Adr:integer);
// ; формат 2-Command 3,4-Adress  5_36-Data
        procedure  Send_Programm_PA(Command:byte; Adr:integer);

        procedure  DownLoadOscAddress;
        procedure  DownLoadCANAddress;
        procedure  LoadATTime;
        procedure  WriteATEPROMCheckSum;
        procedure  ClrErrSSmot;
        procedure  WriteATEPROMini;
        procedure  WriteATEPROM_B12;
        procedure  WriteATEPROM_clr;
        procedure  WriteATEPROM_con;
        procedure  WriteATEPROM_err;
        procedure  WriteATEPROM_dum;
        procedure  WriteMotEPROM_con;
        procedure  WriteEPROM_FPROT;
        procedure  ReadEPROM_FPROT;
        procedure  DumpAT_EPROM;
        procedure  ErrorATLoad;
        procedure  TestDIF_Kl;
        procedure  TestLamp;
        procedure  MC1_TestLamp;
        procedure  MC2_TestLamp;
        procedure  WriteWx_Presure;
        procedure  ModCommand;
        procedure  SaveProtocol;
        procedure  Write_Security;
        procedure  PWM_Send;
        procedure  DSC_PulsPress;

        Procedure  WriteProg_Mon(Adr:word;Dat:byte);
        Procedure  IWriteProg_Mon(Dat:byte);
        Procedure  ReadProg_Mon(Adr:word;var Dat:byte);
        procedure  LoadProg_Mon(Cnt:byte;Adr:word);
        Procedure  LoadProg_End;
        Procedure  Programm_Flash_Mon(Cnt:byte;Adr:word);
        Procedure  Prog_Run_Mon;
        procedure  Stend_Selector;
        procedure  WriteTestVAR;
        procedure  RunawaySave;
        procedure  WriteVIN_DA;
        procedure  Queue_DefConfigLoad;
        procedure  Init_UpGrade;
        procedure  Command_UpGrade(Command:byte; Adr:integer);
        procedure  Command_CANUSB(Cmd:word);
        procedure  Cmd_CANUSB(Cmd:word;Size:byte);
        procedure  Read_CFG_AGS(Adr:word);
        procedure  Read_BridgeCAN;
        procedure  Write_BridgeCAN;
        procedure  Test_TruckSim;
        procedure  Emul_TruckSim;
//  private
//    { Private declarations }
//  public
//     { Public declarations }
end;
        procedure  Send_Speed(Weel0,Weel1,Weel2,Weel3:word;bp:byte);
        procedure  Send_DSC(Weel0,Weel1,Weel2,Weel3:word;bp,Wd,Wz,Ay,Ax:byte);
        procedure  ReadNOP;
        procedure  ReadATEPROM(addr : word);
        procedure  WriteATEPROMByte(adrEPROM:word;dataEPROM:byte);
        function   LoadATEPROMString(adrEPROM:word):string;
        procedure  DumpATLoad(Adr_Start,Adr_Stop:Word);
        procedure  DumpMOTLoad(Adr_Start,Adr_Stop:Word);
        procedure  DumpFlashLoad(Adr_Start,Adr_Stop:Word);
        procedure  WriteMOTORAM(adrRAM:word;dataRAM:byte);
        procedure  ReadMOTORAM(adrRAM:word;var dataRAM:byte);
        procedure  WriteATEPROMString(adrEPROM:word;str:string);
        procedure  RAMMOTLoad(Adr_Start,Adr_Stop:Word);
        procedure  WriteMot_con;
        procedure  CalibrState;

Var
   FormISO: TFormISO;
   Link_ProcBufOut,Link_ProcBufIn:ComBuf;
   comqueue : TQueue;
implementation

uses mainABSdiag,Task_Progress,Com_Thread,PrepRep,Poly_Unit, dump,UnitPCB;

{$R *.DFM}

procedure  TFormISO.Test_TruckSim;
var
     loop,Vx:integer;
begin
        Cmd_CANUSB_Ask:=false;
        CANUSB_Error:=false;
        Link_ProcBufOut[1]:=170;
        Link_ProcBufOut[2]:=32;
        Vx:=$3200;
        For Loop:=0 to 3 do
        begin
          Link_ProcBufOut[Loop*2+3]:=HI(Vx);
          Link_ProcBufOut[Loop*2+4]:=LO(Vx);
        end;
        WriteFile(hhhCOM,Link_ProcBufOut,32,Bytes,nil);
        ReadFile(hhhCOM,Link_ProcBufIn,32,Bytes,nil);
        if Bytes=32 then
        begin
           For Loop:=1 to 13 do
           Buf.Osc[Loop]:=Link_ProcBufIn[Loop];
           CANUSB_Rx_Cnt:=CANUSB_Rx_Cnt+1;
        end
        else CANUSB_Error:=true;
         Cmd_CANUSB_Ask:=true;
end;

procedure  TFormISO.Emul_TruckSim;
var
     loop,Vx:integer;
begin
     Link_ProcBufOut[1]:=175;
     Link_ProcBufOut[2]:=15;
     Link_ProcBufOut[3]:=Hi(W1*4);
     Link_ProcBufOut[4]:=Lo(W1*4);
     Link_ProcBufOut[5]:=Hi(W2*4);
     Link_ProcBufOut[6]:=Lo(W2*4);
     Link_ProcBufOut[7]:=Hi(W3*4);
     Link_ProcBufOut[8]:=Lo(W3*4);
     Link_ProcBufOut[9]:=Hi(W4*4);
     Link_ProcBufOut[10]:=Lo(W4*4);
     Link_ProcBufOut[11]:=PrBr;
     Link_ProcBufOut[12]:=DSC_Akker;
     Link_ProcBufOut[13]:=DSC_OmegaZ;
     Link_ProcBufOut[14]:=DSC_AccY;
     Link_ProcBufOut[15]:=DSC_AccX;
     WriteFile(hhhCOM,Link_ProcBufOut,32,Bytes,nil);
     ReadFile(hhhCOM,Link_ProcBufIn,32,Bytes,nil);
     if Bytes=32 then
     begin
           For Loop:=1 to 13 do
           Buf.Osc[Loop]:=Link_ProcBufIn[Loop];
     MKL :=Link_ProcBufIn[1];
     Oss1:=Link_ProcBufIn[2];
     Oss2:=Link_ProcBufIn[3];
     Oss3:=Link_ProcBufIn[4];
     Oss4:=Link_ProcBufIn[5];
     Oss5:=Link_ProcBufIn[6];
     end;
     SinxrEmul:=true;
end;

procedure  TFormISO.Read_BridgeCAN;
var
    i:integer;
    DA: Byte;
begin
    BrCAN_Read_Cmpl:= false;
    BrCAN_Read_Error:= false;
    DA:=BrCAN_DA and $7F;  // чтение
    Link_ProcBufOut[2]:=DA;
    Link_ProcBufOut[3]:=BrCAN_Adr div 65536;
    Link_ProcBufOut[4]:=(BrCAN_Adr mod 65536) div 256;
    Link_ProcBufOut[5]:=(BrCAN_Adr mod 65536) mod 256;
    if not Com_Link_Command(Bridge_CAN,Link_ProcBufOut,Link_ProcBufIn)
        or (Link_ProcBufIn[1] = 5)
    then
      BrCAN_Read_Error:=true
    else
    begin
       for i:=0 to 7 do
       BrCAN_InBuf[i]:= Link_ProcBufIn[i+2];
    end;
    BrCAN_Read_Cmpl:=true;
end;

procedure  TFormISO.Write_BridgeCAN;
var
    i:integer;
    DA: Byte;
begin
    BrCAN_Write_Cmpl:= false;
    BrCAN_Write_Error:= false;
    DA:=BrCAN_DA or $80;  // запись
    Link_ProcBufOut[2]:=DA;
    Link_ProcBufOut[3]:=BrCAN_Adr div 65536;
    Link_ProcBufOut[4]:=(BrCAN_Adr mod 65536) div 256;
    Link_ProcBufOut[5]:=(BrCAN_Adr mod 65536) mod 256;
    for i:=0 to 7 do
    Link_ProcBufOut[i+6]:= BrCAN_OutBuf[i];
    if not Com_Link_Command(Bridge_CAN,Link_ProcBufOut,Link_ProcBufIn)
        or (Link_ProcBufIn[1] = 5)
    then
      BrCAN_Write_Error:=true;
 //   else
 //   begin
 //      for i:=0 to 7 do
 //      BrCAN_OutBuf[i]:= Link_ProcBufIn[i+2];
 //   end;
    BrCAN_Write_Cmpl:=true;
end;


procedure  TFormISO.Read_CFG_AGS(Adr:word);
var
    i:integer;
begin
    AGS_Read_Cmpl:= false;
    AGS_Read_Error:= false;
    Link_ProcBufOut[2]:=HI(Adr);
    Link_ProcBufOut[3]:=LO(Adr);
    if (Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn)) then //and
    //   (Link_ProcBufIn[9] = $80) then
    begin
       for i:=0 to 7 do
       AGS_Read_Data[i]:= Link_ProcBufIn[i+1];
    end
    else AGS_Read_Error:= true;
    AGS_Read_Cmpl:= true;
end;

procedure  TFormISO.Init_UpGrade;
begin
     PGM_Error_Ask:=false;
     // инициализация 1 step
     Link_ProcBufOut[1]:=$AF;
     Link_ProcBufOut[2]:=$C0;//
     Link_ProcBufOut[3]:=$55;
     Link_ProcBufOut[4]:=$FA;//$AA;
     WriteFile(hCOM,Link_ProcBufOut,4,Bytes,nil);
     ReadFile(hCOM,Link_ProcBufIn,2,Bytes,nil);
     if (Bytes<>2) and
        (Link_ProcBufIn[1]<>Link_ProcBufOut[1]) and
        (Link_ProcBufIn[2]<>Link_ProcBufOut[2])
     then  PGM_Error_Ask:=true;
     // инициализация 2 step
     Link_ProcBufOut[1]:=$AF;
     Link_ProcBufOut[2]:=$B0;//
     Link_ProcBufOut[3]:=$AA;
     WriteFile(hCOM,Link_ProcBufOut,4,Bytes,nil);
     ReadFile(hCOM,Link_ProcBufIn,2,Bytes,nil);
     if (Bytes<>2) and
        (Link_ProcBufIn[1]<>Link_ProcBufOut[1]) and
        (Link_ProcBufIn[2]<>Link_ProcBufOut[2])
     then  PGM_Error_Ask:=true;
     InitProg_Ask:=true;
end;

Procedure TFormISO.Command_UpGrade(Command:byte; Adr:integer);
var
     loop:integer;
begin
        PGM_Error_Ask:=false;
        CmdProg_Ask:=false;
        Link_ProcBufOut[1]:=Programm_STM;
        Link_ProcBufOut[2]:=Command;
        Link_ProcBufOut[3]:=Adr div 65536;
        Link_ProcBufOut[4]:=(Adr mod 65536) div 256;
        Link_ProcBufOut[5]:=(Adr mod 65536) mod 256;
        for loop:=0 to (SizePaketSTM-1) do
            Link_ProcBufOut[loop+6]:=PaketData[loop];
        WriteFile(hCOM,Link_ProcBufOut,$25,Bytes,nil);
        if Command = Moto_ClearFlashEEPROM then
             ComTimeOut.ReadTotalTimeoutConstant:=200
        else ComTimeOut.ReadTotalTimeoutConstant:=50;
        ReadFile(hCOM,Link_ProcBufIn,2,Bytes,nil);
        if (Bytes<>2) or
           (Link_ProcBufIn[1] = 5) or
           (Link_ProcBufIn[1] <> Command) then
        begin
            PGM_Error_Ask:=true;
            PGM_Error:=Link_ProcBufIn[1];
        end;
        PGM_Ask:=Link_ProcBufIn[2];
        CmdProg_Ask:=true;
end;

procedure  TFormISO.Command_CANUSB(Cmd:word);
var
     loop:integer;
begin
        Cmd_CANUSB_Ask:=false;
        CANUSB_Error:=false;
        Link_ProcBufOut[1]:=$AF;
        Link_ProcBufOut[2]:=Hi(Cmd);
        Link_ProcBufOut[3]:=Lo(Cmd);
        Link_ProcBufOut[4]:=$FA;
        WriteFile(hCOM,Link_ProcBufOut,4,Bytes,nil);
        ReadFile(hCOM,Link_ProcBufIn,13,Bytes,nil);
        if Bytes=13 then
        begin
           For Loop:=1 to 13 do
           Buf.Osc[Loop]:=Link_ProcBufIn[Loop];
           CANUSB_Rx_Cnt:=CANUSB_Rx_Cnt+1;
        end
        else
        CANUSB_Error:=true;
        Cmd_CANUSB_Ask:=true;
end;

procedure  TFormISO.Cmd_CANUSB(Cmd:word;Size:byte);
var
     loop,Num:integer;
begin
        Cmd_CANUSB_Ask:=false;
        CANUSB_Error:=false;
        Link_ProcBufOut[1]:=$AF;
        Link_ProcBufOut[2]:=Hi(Cmd);
        Link_ProcBufOut[3]:=Lo(Cmd);
        Link_ProcBufOut[4]:=Size;
        Num:= Size-5;
        if Num>0 then
        begin
          For Loop:=0 to Num do
          Link_ProcBufOut[5+Loop]:=CANUSB_Data[Loop];
        end;
        Link_ProcBufOut[5+Num]:=$FA;
        WriteFile(hCOM,Link_ProcBufOut,Size,Bytes,nil);

        ReadFile(hCOM,Link_ProcBufIn,13,Bytes,nil);
        if Bytes=13 then
        begin
           For Loop:=1 to 12 do
           Buf.Osc[Loop]:=Link_ProcBufIn[Loop];
           CANUSB_Rx_Cnt:=CANUSB_Rx_Cnt+1;
        end
        else CANUSB_Error:=true;
        Cmd_CANUSB_Ask:=true;
end;

procedure TFormISO.InitProgramm_STM;
begin
    InitProg_Ask:= false;
    PGM_Error_Ask:=true;
    Link_ProcBufOut[1]:=Init_Programm_Flash;
    Link_ProcBufOut[2]:=MCnum;
    WriteFile(hCOM,Link_ProcBufOut,4,Bytes,nil);
    ReadFile(hCOM,Link_ProcBufIn,13,Bytes,nil);
    if (Bytes=13) and (Link_ProcBufIn[1] = Init_Programm_Flash) then
 //   Com_Link_Command(Init_Programm_Flash,Link_ProcBufOut,Link_ProcBufIn);
 //   if Link_ProcBufIn[1] <> Init_Programm_Flash then
    PGM_Error_Ask:=False;
    InitProg_Ask:= true;
end;

Procedure TFormISO.LoadATStopCNT;
begin
     LoadATcounter(AdrStopCNT,StopCNT);
end;

Procedure TFormISO.LoadATModCNT;
begin
     LoadATcounter(AdrDifCNT,DifCNT);
     LoadATcounter(AdrMod1CNT,Mod1CNT);
     LoadATcounter(AdrMod2CNT,Mod2CNT);
     LoadATcounter(AdrMod3CNT,Mod3CNT);
     LoadATcounter(AdrMod4CNT,Mod4CNT);
end;

Procedure TFormISO.SendSpeed;
begin
     Send_Speed(W1,W2,W3,W4,PrBr);
     SinxrPoly:=true;
     SinxrEmul:=true;
end;

Procedure  TFormISO.SendDSC;
begin
     Send_DSC(W1,W2,W3,W4,PrBr,DSC_Akker,DSC_OmegaZ,DSC_AccY,DSC_AccX);
  {   Link_ProcBufOut[2]:=Hi(W1);
     Link_ProcBufOut[3]:=Lo(W1);
     Link_ProcBufOut[4]:=Hi(W2);
     Link_ProcBufOut[5]:=Lo(W2);
     Link_ProcBufOut[6]:=Hi(W3);
     Link_ProcBufOut[7]:=Lo(W3);
     Link_ProcBufOut[8]:=Hi(W4);
     Link_ProcBufOut[9]:=Lo(W4);
     Link_ProcBufOut[10]:=PrBr;//Lo(EmulCount);//
     Link_ProcBufOut[11]:=DSC_Akker;
     Link_ProcBufOut[12]:=DSC_OmegaZ;
     Link_ProcBufOut[13]:=DSC_AccY;
     Link_ProcBufOut[14]:=DSC_AccX;
     Com_Link_Command(Road_Emul_DSC,Link_ProcBufOut,Link_ProcBufIn);
     MKL :=Link_ProcBufIn[1];
     Oss1:=Link_ProcBufIn[2];
     Oss2:=Link_ProcBufIn[3];
     Oss3:=Link_ProcBufIn[4];
     Oss4:=Link_ProcBufIn[5];
     Oss5:=Link_ProcBufIn[6];
     SinxrPoly:=true; }
     SinxrEmul:=true;
end;

Procedure TFormISO.Prog_Run_Mon;
Var Adr:Integer;
    DatM:byte;
begin
     // чтение SP
                    sleep(1);
                    TestComBuf[1]:=$0C;
                    WriteFile(hCOM,TestComBuf,1,Bytes,nil);
                    ReadFile(hCOM,ComBufIn,4,Bytes,nil);
                    Adr_ProgFlash_SP:=ComBufIn[3]*256+ComBufIn[4];
    // запись PC в стек
                    DatM:=Hi(Adr_ProgFlash_Start);;
                    Adr:=Adr_ProgFlash_SP+4;
                    FormISO.WriteProg_Mon(Adr,DatM);
                    DatM:=Lo(Adr_ProgFlash_Start);;
                    Adr:=Adr_ProgFlash_SP+5;
                    FormISO.WriteProg_Mon(Adr,DatM);
    // run
                    sleep(1);
                    TestComBuf[1]:=$28;
                    WriteFile(hCOM,TestComBuf,1,Bytes,nil);
                    ReadFile(hCOM,ComBufIn,3,Bytes,nil);
end;

Procedure TFormISO.WriteProg_Mon(Adr:word;Dat:byte);
begin
                    sleep(1);
                    TestComBuf[1]:=$49;
                    WriteFile(hCOM,TestComBuf,1,Bytes,nil);
                    ReadFile(hCOM,ComBufIn,2,Bytes,nil);
                    if ((ComBufIn[1]<>ComBufIn[2]) or (Bytes<>2)) then Fl_Error_Prog:=True;
                    TestComBuf[1]:=Hi(Adr);
                    WriteFile(hCOM,TestComBuf,1,Bytes,nil);
                    ReadFile(hCOM,ComBufIn,2,Bytes,nil);
                    if ((ComBufIn[1]<>ComBufIn[2]) or (Bytes<>2)) then Fl_Error_Prog:=True;
                    TestComBuf[1]:=Lo(Adr);
                    WriteFile(hCOM,TestComBuf,1,Bytes,nil);
                    ReadFile(hCOM,ComBufIn,2,Bytes,nil);
                    if ((ComBufIn[1]<>ComBufIn[2]) or (Bytes<>2)) then Fl_Error_Prog:=True;
                    TestComBuf[1]:=Dat;
                    WriteFile(hCOM,TestComBuf,1,Bytes,nil);
                    ReadFile(hCOM,ComBufIn,2,Bytes,nil);
                    if ((ComBufIn[1]<>ComBufIn[2]) or (Bytes<>2)) then Fl_Error_Prog:=True;
end;

Procedure TFormISO.IWriteProg_Mon(Dat:byte);
begin
                    sleep(1);
                    TestComBuf[1]:=$19;
                    WriteFile(hCOM,TestComBuf,1,Bytes,nil);
                    ReadFile(hCOM,ComBufIn,2,Bytes,nil);
                    if ((ComBufIn[1]<>ComBufIn[2]) or (Bytes<>2)) then Fl_Error_Prog:=True;
                    TestComBuf[1]:=Dat;
                    WriteFile(hCOM,TestComBuf,1,Bytes,nil);
                    ReadFile(hCOM,ComBufIn,2,Bytes,nil);
                    if ((ComBufIn[1]<>ComBufIn[2]) or (Bytes<>2)) then Fl_Error_Prog:=True;
end;

Procedure TFormISO.ReadProg_Mon(Adr:word;var Dat:byte);
begin
                    TestComBuf[1]:=$4A;
                    WriteFile(hCOM,TestComBuf,1,Bytes,nil);
                    ReadFile(hCOM,ComBufIn,2,Bytes,nil);
                //    if ((ComBufIn[1]<>ComBufIn[2]) or (Bytes<>2)) then Fl_Error_Prog:=True;
                    sleep(1);
                    TestComBuf[1]:=Hi(Adr);
                    WriteFile(hCOM,TestComBuf,1,Bytes,nil);
                    ReadFile(hCOM,ComBufIn,2,Bytes,nil);
                //    if ((ComBufIn[1]<>ComBufIn[2]) or (Bytes<>2)) then Fl_Error_Prog:=True;
                    sleep(1);
                    TestComBuf[1]:=Lo(Adr);
                    WriteFile(hCOM,TestComBuf,1,Bytes,nil);
                    //ReadFile(hCOM,ComBufIn,7,Bytes,nil);
                    ReadFile(hCOM,ComBufIn,3,Bytes,nil);
                //    if ((ComBufIn[1]<>ComBufIn[2]) or (Bytes<>3)) then Fl_Error_Prog:=True;
                    Dat:=ComBufIn[3];
                    sleep(1);
end;

Procedure TFormISO.LoadProg_Mon(Cnt:byte;Adr:word);
var
  BytesTr: byte;
  loop:integer;
begin
                    TestComBuf[1]:=$F7;
                    TestComBuf[2]:=Cnt;
                    TestComBuf[3]:=Hi(Adr);
                    TestComBuf[4]:=Lo(Adr);
                    BytesTr:=Cnt+4;
                    WriteFile(hCOM,TestComBuf,BytesTr,Bytes,nil);
                    ReadFile(hCOM,ComBufIn,BytesTr,Bytes,nil);
                    if Bytes<>BytesTr then
                    Fl_Error_Prog:=True;
              //      ReadFile(hCOM,ComBufIn,BytesTr+Cnt,Bytes,nil);
              //      sleep(0);
              //      for loop:=0 to Cnt-1 do
              //       if ComBufIn[5+loop]<> ComBufIn[Cnt+5+loop] then
              //      ComBufIn[50]:=loop;// sleep(0);
end;

Procedure TFormISO.Programm_Flash_Mon(Cnt:byte;Adr:word);
var
  BytesTr: byte;
  loop:integer;
begin

                    for loop:=0 to 128 do ComBufIn[loop]:=0;
                    TestComBuf[1]:=$F1;
                    TestComBuf[2]:=Cnt;
                    TestComBuf[3]:=Hi(Adr);
                    TestComBuf[4]:=Lo(Adr);
                    BytesTr:=Cnt+4;
                    WriteFile(hCOM,TestComBuf,BytesTr,Bytes,nil);
                    ReadFile(hCOM,ComBufIn,BytesTr+1,Bytes,nil);
                    if ((Bytes<>BytesTr+1) or (ComBufIn[BytesTr+1]<>85)) then
                    Fl_Error_Prog:=True;
end;

Procedure TFormISO.LoadProg_End;
begin
                    TestComBuf[1]:=EndLoad_Programm_Flash;
                    TestComBuf[2]:=0;
                    TestComBuf[3]:=0;
                    TestComBuf[4]:=0;
                    WriteFile(hCOM,TestComBuf,4,Bytes,nil);
                    ReadFile(hCOM,ComBufIn,7,Bytes,nil);
                    sleep(0);
end;

Procedure TFormISO.Send_Programm_ROM(Command:byte; Adr:word);
var
     loop:integer;
begin
        PGM_Error_Ask:=false;
        Link_ProcBufOut[2]:=Command;
        Link_ProcBufOut[3]:=Hi(Adr);
        Link_ProcBufOut[4]:=Lo(Adr);
        for loop:=0 to 7 do Link_ProcBufOut[loop+5]:=PaketData[loop];
        if not Com_Link_Command(Programm_ROM,Link_ProcBufOut,Link_ProcBufIn)
        or (Link_ProcBufIn[1] <> Command) then
        begin
            PGM_Error_Ask:=true;
            PGM_Error:=Link_ProcBufIn[1];
            Cmd_Error:=Link_ProcBufOut[2];
        end
        else PGM_Error:=0;
        CmdProg_Ask:=true;
end;

Procedure TFormISO.PGM_Read_Null;
begin
     Repeat_Cnt:=Repeat_Cnt+1;
     Form1.Label337.Caption:=IntToStr(Repeat_Cnt);
     Form1.Label337.Repaint;
     PGM_Null_Ask:=false;
     repeat
       ReadFile(hCOM,ComBufIn,1,Bytes,nil);
       PGM_Null_Ask:=true;
     until Bytes=1;
     PGM_Null_Ask:=true;
end;

Procedure TFormISO.Send_Programm_STM(Command:byte; Adr:integer);
var
     loop:integer;
begin
     if Tip_Block < 7 then
     begin
        PGM_Error_Ask:=false;
        CmdProg_Ask:=false;
        Link_ProcBufOut[2]:=Command;

  //      if Command = Moto_ClearFlashEEPROM then
  //           ComTimeOut.ReadTotalTimeoutConstant:=300
  //      else ComTimeOut.ReadTotalTimeoutConstant:=50;

        Link_ProcBufOut[3]:=Adr div 65536;
        Link_ProcBufOut[4]:=(Adr mod 65536) div 256;
        Link_ProcBufOut[5]:=(Adr mod 65536) mod 256;
        for loop:=0 to (SizePaketSTM-1) do
            Link_ProcBufOut[loop+6]:=PaketData[loop];
        if not Com_Link_Command(Programm_STM,Link_ProcBufOut,Link_ProcBufIn)
        or (Link_ProcBufIn[2] = 5) or (Link_ProcBufIn[2] <> Command) then
        begin
            PGM_Error_Ask:=true;
            PGM_Error:=Link_ProcBufIn[2];
        end;

        PGM_Ask:=Link_ProcBufIn[1];
        CmdProg_Ask:=true;
     end
     else

     begin
        PGM_Error_Ask:=false;
        CmdProg_Ask:=false;
        Link_ProcBufOut[1]:=$AF;
        Link_ProcBufOut[2]:=$A0;
        Link_ProcBufOut[3]:=Command;
        Link_ProcBufOut[4]:= Adr div 65536;
        Link_ProcBufOut[5]:=(Adr mod 65536) div 256;
        Link_ProcBufOut[6]:=(Adr mod 65536) mod 256;
        for loop:=0 to (SizePaketSTM-1) do
            Link_ProcBufOut[loop+7]:=PaketData[loop];

        if not Fl_ProgLoaderSTM then
        begin
          if not Com_Link_Command(STM_Programm_V8,Link_ProcBufOut,Link_ProcBufIn)
             or (Link_ProcBufIn[2] = 5) or (Link_ProcBufIn[2] <> Command)  then
          begin
            PGM_Error:=Link_ProcBufIn[2];
            PGM_Error_Ask:=true;
          end;
        end
        else
        begin  // лодырь
          WriteFile(hCOM,Link_ProcBufOut,$27,Bytes,nil);
          if Fl_ProgCAN_STM then
          begin //CAN
            ReadFile(hCOM,Link_ProcBufIn,2,Bytes,nil);
            if  (Link_ProcBufIn[2] <> Command) then
            begin
              PGM_Error:=Link_ProcBufIn[1];
              PGM_Error_Ask:=true;
            end;
          end
          else
          begin  // лодырь  UART
            ReadFile(hCOM,Link_ProcBufIn,41,Bytes,nil);
            if  ((Link_ProcBufIn[41] = 5) or (Link_ProcBufIn[41] <> Command)) then
            begin
              PGM_Error:=Link_ProcBufIn[40];
              PGM_Error_Ask:=true;
            end;
          end;
        end;
        PGM_Ask:=Link_ProcBufIn[1];
        CmdProg_Ask:=true;
     end;
end;

Procedure TFormISO.Send_Programm_PA(Command:byte; Adr:integer);
var
     loop:integer;
begin
        PGM_Error_Ask:=false;
        CmdProg_Ask:=false;
        Link_ProcBufOut[2]:=Command;
        Link_ProcBufOut[3]:=Hi(Adr);
        Link_ProcBufOut[4]:=Lo(Adr);
        for loop:=0 to (SizePaketSTM-1) do
            Link_ProcBufOut[loop+5]:=PaketData[loop];
        if not Com_Link_Command(Programm_STM,Link_ProcBufOut,Link_ProcBufIn)
        or (Link_ProcBufIn[2] = 5) or (Link_ProcBufIn[2] <> Command) then
        begin
            PGM_Error_Ask:=true;
            PGM_Error:=Link_ProcBufIn[2];
        end;
        PGM_Ask:=Link_ProcBufIn[1];
        CmdProg_Ask:=true;
end;

Procedure TFormISO.EraseProgramm_Flash;
begin
        Link_ProcBufOut[2]:=4;
        Link_ProcBufOut[3]:=5;
        Link_ProcBufOut[4]:=6;
        Com_Link_Command(Erase_Programm_Flash,Link_ProcBufOut,Link_ProcBufIn);
end;

Procedure TFormISO.WriteProgramm_Flash(Cnt:byte;Adr:word);
begin
        BytesSend:=Cnt+3;
        Link_ProcBufOut[2]:=Cnt;
        Link_ProcBufOut[3]:=Hi(Adr);
        Link_ProcBufOut[4]:=Lo(Adr);
        Com_Link_Command(Write_Programm_Flash,Link_ProcBufOut,Link_ProcBufIn);
end;

Procedure TFormISO.ReadProgramm_Flash(Cnt:byte;Adr:word);
begin
        BytesReceive:=Cnt-1;
        Link_ProcBufOut[2]:=Cnt;
        Link_ProcBufOut[3]:=Hi(Adr);
        Link_ProcBufOut[4]:=Lo(Adr);
        Com_Link_Command(Read_Programm_Flash,Link_ProcBufOut,Link_ProcBufIn);
end;

Procedure TFormISO.LoadATcounter(AdrCNT:byte; var cnt:word);
begin
{     Link_ProcBufOut[2]:=AdrCNT;
     Link_ProcBufOut[3]:=AdrCNT+1;
     Com_Link_Command(Moto_ChangeATAddress,Link_ProcBufOut,Link_ProcBufIn);
     Link_ProcBufOut[2]:=Hi(AdrSPI_In_Buff+1);
     Link_ProcBufOut[3]:=Lo(AdrSPI_In_Buff+1);
     Link_ProcBufOut[4]:=Hi(AdrSPI_In_Buff+2);
     Link_ProcBufOut[5]:=Lo(AdrSPI_In_Buff+2);
     Com_Link_Command(Moto_ChangeMonAddress,Link_ProcBufOut,Link_ProcBufIn);
//     sleep(20); //для перезагагрузки адресов
     Link_ProcBufOut[2]:=12;
     Com_Link_Command(Moto_OscFrame,Link_ProcBufOut,Link_ProcBufIn);
     Link_ProcBufOut[2]:=12;
     Com_Link_Command(Moto_OscFrame,Link_ProcBufOut,Link_ProcBufIn);

     cnt:=Link_ProcBufIn[1]+256*Link_ProcBufIn[2]; }
end;


procedure TFormISO.PWMSend;
begin
     WriteMOTORAM((AdrPWM),PWM);
 //     WriteMOTORAM((579),PWM);
  //   ReadOsc; //ReadMOTORAM(StrToInt(Form1.Edit1.Text),Oss1);
end;

procedure xPWMSend;
begin
     WriteMOTORAM((AdrPWM),PWM);
end;

procedure xTestDIF_Kl;
begin
     WriteMOTORAM(AdrTestDIF,DatTestDIF);
end;

procedure xTestLamp;
begin
     WriteMOTORAM(AdrTestLamp,DatTestLamp);
end;

procedure TFormISO.MC1_TestLamp;
Var
   TempSelectorMC:integer;
begin
 //    WriteMOTORAM(AdrTestLamp,DatTestLamp);
     Link_ProcBufOut[2]:=HI(AdrTestLamp);
     Link_ProcBufOut[3]:=LO(AdrTestLamp);
     Link_ProcBufOut[4]:=LO(DatTestLamp);
     Com_Link_Command(Moto_WR_RAM,Link_ProcBufOut,Link_ProcBufIn);
end;

procedure TFormISO.MC2_TestLamp;
Var
   TempSelectorMC:integer;
begin
//     WriteMOTORAM(AdrTestLamp,DatTestLamp);
     Link_ProcBufOut[2]:=HI(AdrTestLamp);
     Link_ProcBufOut[3]:=LO(AdrTestLamp);
     Link_ProcBufOut[4]:=LO(DatTestLamp);
     Com_Link_Command(Moto_WR_RAM,Link_ProcBufOut,Link_ProcBufIn);
end;

procedure xWriteWx_Presure;
var
  Loop,ABS_System_F3: byte;
begin
  {   Link_ProcBufOut[2]:=HI(AdrLamp+4);
     Link_ProcBufOut[3]:=LO(AdrLamp+4);
     Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
     ABS_System_F3:=Link_ProcBufIn[1];
     WriteMOTORAM((AdrLamp+4),(ABS_System_F3 or 128));
   for  Loop:=0 to 3 do   WriteMOTORAM((W0_Presure_C+Loop),(128));
     WriteMOTORAM((AdrLamp+4),(ABS_System_F3 and 127)); }
end;

procedure  TFormISO.SlowdownLoad;
var
   Bl_num,i: word;
begin
//   Bl_num:=ADRE('ADR_POINT_DEC');
   Bl_num:=221;//ADRE('ADR_1_DEC');
   Link_ProcBufOut[2]:=HI(Bl_num);
   Link_ProcBufOut[3]:=LO(Bl_num);
   Com_Link_Command(Moto_ReadATEEPROM,Link_ProcBufOut,Link_ProcBufIn);
   for i := 0 to 7 do  DumpEPROM[Bl_num+i]:= Link_ProcBufIn[i+1];
   Bl_num:=BaseDec;
   repeat
    Link_ProcBufOut[2]:=HI(Bl_num);
    Link_ProcBufOut[3]:=LO(Bl_num);
    Com_Link_Command(Moto_ReadATEEPROM,Link_ProcBufOut,Link_ProcBufIn);
    for i := 0 to 7 do  DumpEPROM[Bl_num+i]:= Link_ProcBufIn[i+1];
    Bl_num:=Bl_num+8;
   until Bl_num=BaseDec+32;
end;

procedure  TFormISO.StendEPROM;
var
   Bl_num,i: word;
begin
   Bl_num:=Adr_CorrKdec_H;
   repeat
    Link_ProcBufOut[2]:=HI(Bl_num);
    Link_ProcBufOut[3]:=LO(Bl_num);
    Com_Link_Command(Moto_ReadATEEPROM,Link_ProcBufOut,Link_ProcBufIn);
    for i := 0 to 7 do  DumpEPROM[Bl_num+i]:= Link_ProcBufIn[i+1];
    Bl_num:=Bl_num+8;
   until Bl_num=Adr_CorrKdec_H+16;
end;

procedure TFormISO.ReadAllError;
var
  Count,Loop,Block_num,i: byte;
  Temp_Buf:ComBuf;
begin
   Com_Link_Command(Moto_ReadActiveErrors,Link_ProcBufOut,Link_ProcBufIn);
   Active_Errors_Array[0]:=Link_ProcBufIn[1]+Link_ProcBufIn[2]*256;
   Active_Errors_Array[1]:=Link_ProcBufIn[3]+Link_ProcBufIn[4]*256;
   Active_Errors_Array[2]:=Link_ProcBufIn[5]+Link_ProcBufIn[6]*256;
   Active_Errors_Array[3]:=Link_ProcBufIn[7]+Link_ProcBufIn[8]*256;
   Active_Errors_Array[4]:=Link_ProcBufIn[9]+Link_ProcBufIn[10]*256;
   Active_Errors_Array[5]:=Link_ProcBufIn[11];
   Active_Errors_Array[6]:=Link_ProcBufIn[12]+Link_ProcBufIn[13]*256;
   Active_Errors_Array[7]:=Link_ProcBufIn[14]+Link_ProcBufIn[15]*256;
   Active_Errors_Array[8]:=Link_ProcBufIn[16]+Link_ProcBufIn[17]*256;
   Active_Errors_Array[9]:=Link_ProcBufIn[18]+Link_ProcBufIn[19]*256;
   Active_Errors_Array[10]:=Link_ProcBufIn[20];
   Active_Errors_Array[11]:=Link_ProcBufIn[21];
   Active_Errors_Array[12]:=Link_ProcBufIn[26];
   Active_Errors_Array[13]:=Link_ProcBufIn[22];
   Active_Errors_Array[14]:=Link_ProcBufIn[23];
   Active_Errors_Array[15]:=Link_ProcBufIn[24];
   Active_Errors_Array[16]:=Link_ProcBufIn[25];
 //  if Tip_Block < 8  then begin
// Прочитать  из памяти  ЭППЗУ
   Block_num:=0;
   repeat
        ReadATEPROM(Block_num);
        for Count := 0 to 7 do  DumpEPROM[Block_num+Count]:= Link_ProcBufIn[Count+1];
        Block_num:=Block_num+8;
   until Block_num >= Adr_TimeErr_H;
 //  end;
end; //END procedure ReadAllError;

procedure TFormISO.ReadAddError;
var
   i: byte;
begin
   if Tip_Block > 3  then  begin
   For i:=0 to 100 do Link_ProcBufIn[i] := 0;
   Com_Link_Command(Read_Additive_Errors,Link_ProcBufOut,Link_ProcBufIn);
   Active_Errors_Array[17]:=Link_ProcBufIn[1]+Link_ProcBufIn[2]*256;
   Active_Errors_Array[18]:=Link_ProcBufIn[3]+Link_ProcBufIn[4]*256;
   Active_Errors_Array[24]:=Link_ProcBufIn[5];  //MC VDS
   Active_Errors_Array[19]:=Link_ProcBufIn[6]+Link_ProcBufIn[7]*256;
   Active_Errors_Array[20]:=Link_ProcBufIn[8]+Link_ProcBufIn[9]*256;
   Active_Errors_Array[22]:=Link_ProcBufIn[10];  //SAS
   Active_Errors_Array[23]:=Link_ProcBufIn[11];  //AGS
   Active_Errors_Array[21]:=Link_ProcBufIn[12]+Link_ProcBufIn[13]*256; //DodT
   Active_Errors_Array[25]:=Link_ProcBufIn[14];  //Press
   Active_Errors_Array[26]:=Link_ProcBufIn[15];  //CANT
   end;
end; //END procedure ReadAlddError;

procedure  TFormISO.RoadTest_Slide;
Var Loop:integer;
begin
        Link_ProcBufOut[2]:=NumberOsc;//12;
        Link_ProcBufOut[3]:=StrToInt(Form1.Edit100.Text);
        Com_Link_Command(Moto_OscFrame,Link_ProcBufOut,Link_ProcBufIn);
        For Loop:=0 to NumberOsc-1 do
        Buf.Osc[Loop]:=Link_ProcBufIn[Loop+1];
        
        QueryPerformanceCounter(StopTimer_Value);
        CurrentRoadTimer:=Round(1000*(StopTimer_Value-StartTimer_Value)/TimerFreq_Value);
        Buf.TimerSynch:=CurrentRoadTimer;
        RoadTestBuf[RoadTestInCount]:=Buf;
        Inc(RoadTestInCount);
        SinxrRoadTest:=True;
end;

procedure TFormISO.RunawayLoad;
begin
     Link_ProcBufOut[2]:=HI(AdrRunaway_0);
     Link_ProcBufOut[3]:=LO(AdrRunaway_0);
     Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
     Runaway:=(Link_ProcBufIn[3]+Link_ProcBufIn[2]*256+
               Link_ProcBufIn[1]*65536)/ConstRunaway;
     Work_Time:=(Link_ProcBufIn[6]+Link_ProcBufIn[5]*256+
               Link_ProcBufIn[4]*65536)/ConstWorkTime;
end;

procedure TFormISO.OscRead;
Var Loop:integer;
begin
     Link_ProcBufOut[2]:=NumberOsc;     // колличество лучей
     Com_Link_Command(Moto_OscFrame,Link_ProcBufOut,Link_ProcBufIn);
     for Loop:=1 to NumberOsc do  OscData[Loop]:=Link_ProcBufIn[Loop];
     SinxrOsc:=True;
     Inc(OscPos);
     if OscPos=600 then
     begin
        Form1.OscStartPos;
        DrawGridF:=true;
     end;
end;


procedure TFormISO.ReadOsc;
Var Loop:integer;
begin
     Link_ProcBufOut[2]:=3;     // колличество лучей
     Com_Link_Command(Moto_OscFrame,Link_ProcBufOut,Link_ProcBufIn);
     for Loop:=1 to 3 do   OscData[Loop]:=Link_ProcBufIn[Loop];
end;

procedure xStend_Selector;
begin
     WriteMOTORAM(Stend_Buf_Adr,Stend_Buf_Dat);
end;

procedure TFormISO.CANRead;
Var  Loop:integer;
     Tempbyte1,Tempbyte2,Tempbyte3:byte;
     TempSelectorMC:integer;
begin
 //CAN
     Link_ProcBufOut[2]:=HI(CANAddress+4);
     Link_ProcBufOut[3]:=LO(CANAddress+4);
     Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
     for Loop:=0 to 8 do
     CANData[Loop]:=Link_ProcBufIn[Loop];
 //
     Link_ProcBufOut[2]:=HI(ADCDataBuffer);
     Link_ProcBufOut[3]:=LO(ADCDataBuffer);
     Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
     for Loop:=1 to 8 do
     ADCData[Loop]:=Link_ProcBufIn[Loop];
     Link_ProcBufOut[2]:=HI(ADCDataBuffer+8);
     Link_ProcBufOut[3]:=LO(ADCDataBuffer+8);
     Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
     for Loop:=1 to 8 do
     ADCData[Loop+8]:=Link_ProcBufIn[Loop];
     Link_ProcBufOut[2]:=HI(ADCDataBuffer+16);
     Link_ProcBufOut[3]:=LO(ADCDataBuffer+16);
     Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
     for Loop:=1 to 8 do
     ADCData[Loop+16]:=Link_ProcBufIn[Loop];
//GndD_On_Val
     Link_ProcBufOut[2]:=HI(GndD_On_Val);
     Link_ProcBufOut[3]:=LO(GndD_On_Val);
     Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
     for Loop:=1 to 8 do
     TestData[Loop]:=Link_ProcBufIn[Loop];
     Link_ProcBufOut[2]:=HI(GndD_On_Val+8);
     Link_ProcBufOut[3]:=LO(GndD_On_Val+8);
     Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
     for Loop:=1 to 8 do
     TestData[Loop+8]:=Link_ProcBufIn[Loop];
     Link_ProcBufOut[2]:=HI(GndD_On_Val+16);
     Link_ProcBufOut[3]:=LO(GndD_On_Val+16);
     Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
     for Loop:=1 to 8 do
     TestData[Loop+16]:=Link_ProcBufIn[Loop];
     Link_ProcBufOut[2]:=HI(GndD_On_Val+24);
     Link_ProcBufOut[3]:=LO(GndD_On_Val+24);
     Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
     for Loop:=1 to 8 do
     TestData[Loop+24]:=Link_ProcBufIn[Loop];
end;

procedure TFormISO.SenOscRead;
Var  Loop:integer;
     Tempbyte1,Tempbyte2,Tempbyte3:byte;
     TempSelectorMC:integer;
begin

     if Tip_Block = 4 then
     begin
// блок HCS
      Link_ProcBufOut[2]:=HI(Wheel0_Speed);
      Link_ProcBufOut[3]:=LO(Wheel0_Speed);
      Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
 // скорость
      for Loop:=0 to 3 do
      SenOscData[Loop+5]:=(Link_ProcBufIn[Loop*2+1]*256+Link_ProcBufIn[Loop*2+2]) shr 7;
      Loop:=Wheel0_Speed+8;
      Link_ProcBufOut[2]:=HI(Loop);
      Link_ProcBufOut[3]:=LO(Loop);
      Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
      for Loop:=0 to 1 do
      SenOscData[Loop+21]:=(Link_ProcBufIn[Loop*2+1]*256+Link_ProcBufIn[Loop*2+2]) shr 7;
//MC1
      Link_ProcBufOut[2]:=HI(W0_Gap_Value);
      Link_ProcBufOut[3]:=LO(W0_Gap_Value);
      Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
      for Loop:=0 to 1 do
      begin
 //амплитуда
       SenOscData[Loop+1]:=Round((Link_ProcBufIn[Loop*2+1]*256+Link_ProcBufIn[Loop*2+2])/c_GapMulConst);
 // пасс тест
       SenOscData[Loop+9]:=Link_ProcBufIn[Loop+5];
 // act тест
       SenOscData[Loop+13]:=Link_ProcBufIn[Loop+7];
      end;
 //MC2
      Link_ProcBufOut[2]:=HI(W0_Gap_Value);
      Link_ProcBufOut[3]:=LO(W0_Gap_Value);
      Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
      for Loop:=0 to 1 do
      begin
 //амплитуда
       SenOscData[Loop+3]:=Round((Link_ProcBufIn[Loop*2+1]*256+Link_ProcBufIn[Loop*2+2])/c_GapMulConst);
 // пасс тест
       SenOscData[Loop+11]:=Link_ProcBufIn[Loop+5];
 // act тест
       SenOscData[Loop+15]:=Link_ProcBufIn[Loop+7];
      end;
 //MC3
     if NumCh_Block = 6 then begin
{     Form1.RadioGroup5.ItemIndex:=2;
     Link_ProcBufOut[2]:=HI(W0_Gap_Value);
     Link_ProcBufOut[3]:=LO(W0_Gap_Value);
     Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
     for Loop:=0 to 1 do begin
 //амплитуда
     SenOscData[Loop+23]:=Round((Link_ProcBufIn[Loop*2+1]*256+Link_ProcBufIn[Loop*2+2])/c_GapMulConst);
 // пасс тест
     SenOscData[Loop+25]:=Link_ProcBufIn[Loop+5];
 // act тест
     SenOscData[Loop+29]:=Link_ProcBufIn[Loop+7];
     end; }
      end;
     end;

 //    else
     if Tip_Block = 7 then
     begin
//SKU
       Link_ProcBufOut[2]:=HI(Wheel0_Speed);
       Link_ProcBufOut[3]:=LO(Wheel0_Speed);
       Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
 // скорость
       for Loop:=0 to 3 do
       SenOscData[Loop+5]:=(Link_ProcBufIn[Loop*2+1]*256+Link_ProcBufIn[Loop*2+2]) shr 7;
       Link_ProcBufOut[2]:=HI(Wheel0_Speed+8);
       Link_ProcBufOut[3]:=LO(Wheel0_Speed+8);
       Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
       for Loop:=0 to 1 do
       SenOscData[Loop+21]:=(Link_ProcBufIn[Loop*2+1]*256+Link_ProcBufIn[Loop*2+2]) shr 7;

       Link_ProcBufOut[2]:=HI(W0_Gap_Value);
       Link_ProcBufOut[3]:=LO(W0_Gap_Value);
       Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
       for Loop:=0 to 3 do
 //амплитуда
       SenOscData[Loop+1]:=Link_ProcBufIn[Loop+1];
 //23,24
       SenOscData[23]:=Link_ProcBufIn[5];
       SenOscData[24]:=Link_ProcBufIn[6];
       SenOscData[13]:=Link_ProcBufIn[7]; // тест биения
       SenOscData[14]:=Link_ProcBufIn[8];

       Link_ProcBufOut[2]:=HI(W0_Gap_Value+8);
       Link_ProcBufOut[3]:=LO(W0_Gap_Value+8);
       Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
       for Loop:=0 to 3 do
 // пасс тест W0_A1_U0
       SenOscData[Loop+9]:=Link_ProcBufIn[Loop+1];
       SenOscData[25]:=Link_ProcBufIn[5];
       SenOscData[26]:=Link_ProcBufIn[6];
       SenOscData[15]:=Link_ProcBufIn[7]; // тест биения
       SenOscData[16]:=Link_ProcBufIn[8];

       Link_ProcBufOut[2]:=HI(W0_Gap_Value+16);
       Link_ProcBufOut[3]:=LO(W0_Gap_Value+16);
       Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
       for Loop:=0 to 3 do
 // пасс тест W0_A2_U0
       SenOscData[Loop+17]:=Link_ProcBufIn[Loop+1];
       SenOscData[27]:=Link_ProcBufIn[5];
       SenOscData[28]:=Link_ProcBufIn[6];
       SenOscData[29]:=Link_ProcBufIn[7]; // тест биения
       SenOscData[30]:=Link_ProcBufIn[8];
     end;
 //    else
//-------------SKU v08----------------
     if Tip_Block >= 8 then
     begin
//SKU
       Link_ProcBufOut[2]:=HI(Wheel0_Speed);
       Link_ProcBufOut[3]:=LO(Wheel0_Speed);
       Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
 // скорость
       for Loop:=0 to 3 do
       SenOscData[Loop+5]:=(Link_ProcBufIn[Loop*2+1]*256+Link_ProcBufIn[Loop*2+2]) shr 7;

       Link_ProcBufOut[2]:=HI(W0_Gap_Value);
       Link_ProcBufOut[3]:=LO(W0_Gap_Value);
       Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
       for Loop:=0 to 3 do
 //амплитуда
       SenOscData[Loop+1]:=Link_ProcBufIn[Loop+1];
       for Loop:=0 to 3 do
 // пасс тест W0_A1_U0
       SenOscData[Loop+9]:=Link_ProcBufIn[Loop+5];

       Link_ProcBufOut[2]:=HI(W0_Gap_Value+1);
       Link_ProcBufOut[3]:=LO(W0_Gap_Value+1);
       Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
       for Loop:=0 to 3 do
 // пасс тест W0_A2_U0
       SenOscData[Loop+17]:=Link_ProcBufIn[Loop+1];
       for Loop:=0 to 3 do
 // тест биения
       SenOscData[Loop+13]:=Link_ProcBufIn[Loop+5];
//6Ch
       Link_ProcBufOut[2]:=HI(Wheel5_Speed);
       Link_ProcBufOut[3]:=LO(Wheel5_Speed);
       Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
 // скорость
       for Loop:=0 to 1 do
       SenOscData[Loop+21]:=(Link_ProcBufIn[Loop*2+1]*256+Link_ProcBufIn[Loop*2+2]) shr 7;
       for Loop:=0 to 1 do
 //амплитуда
       SenOscData[Loop+23]:=Link_ProcBufIn[Loop+5];
 // пасс тест W0_A2_U0  25
       Link_ProcBufOut[2]:=HI(Wheel5_Speed+1);
       Link_ProcBufOut[3]:=LO(Wheel5_Speed+1);
       Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
       for Loop:=0 to 5 do
       SenOscData[Loop+25]:=Link_ProcBufIn[Loop+1];
     end;

//-------------SKU v18.3------------
     if (Tip_Block = 5) or (Tip_Block = 6) then//5
     begin
//SKU
       Link_ProcBufOut[2]:=HI(Wheel0_Speed);
       Link_ProcBufOut[3]:=LO(Wheel0_Speed);
       Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
 // скорость
       for Loop:=0 to 3 do
       SenOscData[Loop+5]:=(Link_ProcBufIn[Loop*2+1]*256+Link_ProcBufIn[Loop*2+2]) shr 7;
       Link_ProcBufOut[2]:=HI(Wheel0_Speed+8);
       Link_ProcBufOut[3]:=LO(Wheel0_Speed+8);
       Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
       for Loop:=0 to 1 do
       SenOscData[Loop+21]:=(Link_ProcBufIn[Loop*2+1]*256+Link_ProcBufIn[Loop*2+2]) shr 7;
       Link_ProcBufOut[2]:=HI(W0_Gap_Value);
       Link_ProcBufOut[3]:=LO(W0_Gap_Value);
       Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
       for Loop:=0 to 3 do
 //амплитуда
       SenOscData[Loop+1]:=Link_ProcBufIn[Loop+1];
 //23,24
       for Loop:=0 to 1 do
       SenOscData[Loop+23]:=Link_ProcBufIn[Loop+5];

       Link_ProcBufOut[2]:=HI(W0_Gap_Value+6);
       Link_ProcBufOut[3]:=LO(W0_Gap_Value+6);
       Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
       for Loop:=0 to 3 do
 // пасс тест W0_A1_U0
       SenOscData[Loop+9]:=Link_ProcBufIn[Loop+1];
       for Loop:=0 to 1 do
       SenOscData[Loop+25]:=Link_ProcBufIn[Loop+5];

       Link_ProcBufOut[2]:=HI(W0_Gap_Value+12);
       Link_ProcBufOut[3]:=LO(W0_Gap_Value+12);
       Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
       for Loop:=0 to 3 do
 // пасс тест W0_A2_U0
       SenOscData[Loop+17]:=Link_ProcBufIn[Loop+1];
       for Loop:=0 to 1 do
       SenOscData[Loop+27]:=Link_ProcBufIn[Loop+5];
       Link_ProcBufOut[2]:=HI(W0_Gap_Value+18);
       Link_ProcBufOut[3]:=LO(W0_Gap_Value+18);
       Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
       for Loop:=0 to 3 do
 // тест биения
       SenOscData[Loop+13]:=Link_ProcBufIn[Loop+1];
       for Loop:=0 to 1 do
       SenOscData[Loop+29]:=Link_ProcBufIn[Loop+5];
     end;

 //--------------старый блок---------------
     if Tip_Block = 3 then
  //   else
     begin
// старый блок
     Link_ProcBufOut[2]:=HI(Wheel0_Speed);
     Link_ProcBufOut[3]:=LO(Wheel0_Speed);
     Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
 // скорость
     for Loop:=0 to 3 do
     SenOscData[Loop+5]:=(Link_ProcBufIn[Loop*2+1]*256+Link_ProcBufIn[Loop*2+2]) shr 7;
 //амплитуда
     Link_ProcBufOut[2]:=HI(W0_Gap_Value);
     Link_ProcBufOut[3]:=LO(W0_Gap_Value);
     Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
     for Loop:=0 to 3 do
     SenOscData[Loop+1]:=Round((Link_ProcBufIn[Loop*2+1]*256+Link_ProcBufIn[Loop*2+2])/c_GapMulConst);
 // пасс тест
     Link_ProcBufOut[2]:=HI(W0_Gap_Value+8);
     Link_ProcBufOut[3]:=LO(W0_Gap_Value+8);
     Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
     for Loop:=0 to 7 do
     SenOscData[Loop+9]:=Link_ProcBufIn[Loop+1];

     Link_ProcBufOut[2]:=HI(W0_Gap_Value+20);
     Link_ProcBufOut[3]:=LO(W0_Gap_Value+20);
     Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
     for Loop:=0 to 3 do
     SenOscData[Loop+17]:=Link_ProcBufIn[Loop+1];
     end;

     SinxrSenOsc:=True;
     Inc(SenOscPos);
     if SenOscPos=form1.PaintBox2.Width then
     begin
        SenOscPos:=1;
        for Loop:=1 to 8 do SenOscArray[Loop].PreviousXPosition:=0;
        Form1.OscStartPos;
        SenDrawGridF:=true;
     end;
end;

procedure TFormISO.LampOscRead;
Var Loop:integer;
   TempSelectorMC:integer;
begin
     if Tip_Block > 3 then  begin

 {    Link_ProcBufOut[2]:=HI(AdrLamp);
     Link_ProcBufOut[3]:=LO(AdrLamp);
     Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
     For Loop:=2 to 7 do
     MC1_BufLampOsc[Loop]:=Link_ProcBufIn[Loop];
     ABS_System_F0:= Link_ProcBufIn[2];  }

     Link_ProcBufOut[2]:=HI(AdrStop);
     Link_ProcBufOut[3]:=LO(AdrStop);
     Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
     StopPress:= Link_ProcBufIn[1];
     BrakeDemand:= Link_ProcBufIn[3];
     TrailerPress:=Link_ProcBufIn[4];

     Link_ProcBufOut[2]:=HI(AdrLamp);
     Link_ProcBufOut[3]:=LO(AdrLamp);
     Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
     For Loop:=1 to 8 do
     BufLampOsc[Loop]:=Link_ProcBufIn[Loop];
     ABS_System_F0:= Link_ProcBufIn[2];

     Link_ProcBufOut[2]:=HI(AdrDSC_Flags);
     Link_ProcBufOut[3]:=LO(AdrDSC_Flags);
     Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
     DSC_Flags1:=Link_ProcBufIn[1];  //DSC_Flags
{ DSC_Flags
#define     RetarderActive   _DSC_Flags.Bits.b0
#define     DYC_Active       _DSC_Flags.Bits.b1
#define     ROP_Active       _DSC_Flags.Bits.b2
#define     DYC_BrakeActive  _DSC_Flags.Bits.b3
#define     ROP_BrakeActive  _DSC_Flags.Bits.b4
#define     DYC_EngineActive _DSC_Flags.Bits.b5
#define     ROP_EngineActive _DSC_Flags.Bits.b6
#define     ABS_Active	     _DSC_Flags.Bits.b7
}
     DSC_Flags2:=Link_ProcBufIn[2];  // Front_Flags
{ Front_Flags
#define     DSC_Emul_Fl      _Front_Flags.Bits.b0
#define     DSC_Disable      _Front_Flags.Bits.b1
#define     VDC_Lamp_MC1     _Front_Flags.Bits.b2
#define     DYC_Front_Break  _Front_Flags.Bits.b3
#define     ROP_Front_Break  _Front_Flags.Bits.b4
#define     ABS_TAI_Flag_FL  _Front_Flags.Bits.b5
#define     ABS_TAI_Flag_FR  _Front_Flags.Bits.b6
#define     ABS_Front_Active _Front_Flags.Bits.b7
}
     DSC_Flags3:=Link_ProcBufIn[3];  // Rear_Flags
{ Rear_Flags
#define     ABS_Fail_MC2     _Rear_Flags.Bits.b0
#define     VDC_Lamp_MC2     _Rear_Flags.Bits.b1
#define     Trailer_Break    _Rear_Flags.Bits.b2
#define     DYC_Rear_Break   _Rear_Flags.Bits.b3
#define     ROP_Rear_Break   _Rear_Flags.Bits.b4
#define     ASR_Brake_Active _Rear_Flags.Bits.b5
#define     ASR_EngineActive _Rear_Flags.Bits.b6
#define     ABS_Rear_Active  _Rear_Flags.Bits.b7
}
     DSC_Flags4:=Link_ProcBufIn[4];  // DSC_Flags4
{ DSC_Flags4
#define     Truck_VDC_Active _DSC_Flags4.Bits.b0 // флаг  Truck_VDC активно
												 // не менять управляет лампой VDC
#define     Control_Active   _DSC_Flags4.Bits.b1 // флаг  Control_Active любое регулирование активно
#define     EBL_Active       _DSC_Flags4.Bits.b2
#define    XBR_System_Active _DSC_Flags4.Bits.b3
#define    HillHolder_Active _DSC_Flags4.Bits.b4
#define     HaltBrake_Active _DSC_Flags4.Bits.b5
#define     Emergency_Brake  _DSC_Flags4.Bits.b6
#define   Brake_Asist_Active _DSC_Flags4.Bits.b7
}
     DSC_Flags5:=Link_ProcBufIn[5]; // TorqueMode
{ TorqueMode
#define    Torque_Lim           _TorqueMode.Bits.b0
#define    Torque_Drag          _TorqueMode.Bits.b1
#define    Retarder_Brake       _TorqueMode.Bits.b2
#define    Retarder_Off         _TorqueMode.Bits.b3
#define    EngineLim_Request    _TorqueMode.Bits.b4
#define    EngineDrag_Request   _TorqueMode.Bits.b5

#define  EngineTrailer_Request  _TorqueMode.Bits.b7
}
     DSC_Flags6:=Link_ProcBufIn[6]; // DSC_Flags3
{ DSC_Flags3
#define     SAS_Ok           _DSC_Flags3.Bits.b0
#define     AGS_Ok           _DSC_Flags3.Bits.b1
#define     SAS_Calibr_Cmpl  _DSC_Flags3.Bits.b2
#define     AGS_Calibr_Cmpl  _DSC_Flags3.Bits.b3
#define     Model_Instal     _DSC_Flags3.Bits.b4
#define     VDC_Instal_Cmpl  _DSC_Flags3.Bits.b5
#define     DSC_Break_Abort  _DSC_Flags3.Bits.b6
#define     Fatal_Failure    _DSC_Flags3.Bits.b7
}
     DSC_Flags7:=Link_ProcBufIn[7]; // DSC_Flags2
{

}
     DSC_Flags8:=Link_ProcBufIn[8]; //
{

}
     Link_ProcBufOut[2]:=HI(AdrECUID_Dat0);
     Link_ProcBufOut[3]:=LO(AdrECUID_Dat0);
     Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
     For Loop:=1 to 8 do
     ECUID_Data[Loop]:=Link_ProcBufIn[Loop];

     if Tip_Block < 8 then
     begin
     Link_ProcBufOut[2]:=HI(AdrECUID_Dat0+8);
     Link_ProcBufOut[3]:=LO(AdrECUID_Dat0+8);
     end
     else
     begin
     Link_ProcBufOut[2]:=HI(AdrECUID_Dat8);
     Link_ProcBufOut[3]:=LO(AdrECUID_Dat8);
     end;
     Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
     For Loop:=1 to 8 do
     ECUID_Data[Loop+8]:=Link_ProcBufIn[Loop];

     if Tip_Block >= 8 then
     begin
       // ReadCRC32STM
       Link_ProcBufOut[2]:=HI(AdrCRC32_MC3); // aдрес CRC_pgm_MC3 в
       Link_ProcBufOut[3]:=LO(AdrCRC32_MC3);
       Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
       for Loop:=0 to 3 do
       begin
        CRC_pgm_MC3[Loop]:= Link_ProcBufIn[Loop+5];
        CRC_pgm_MC2[Loop]:= Link_ProcBufIn[Loop+1];
       end;
     end;
     end
     else begin
// старый блок
     Link_ProcBufOut[2]:=HI(AdrLamp);
     Link_ProcBufOut[3]:=LO(AdrLamp);
     Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
     For Loop:=2 to 7 do
     BufLampOsc[Loop]:=Link_ProcBufIn[Loop];
     Link_ProcBufOut[2]:=HI(AdrStop);
     Link_ProcBufOut[3]:=LO(AdrStop);
     Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
     BufLampOsc[1]:=Link_ProcBufIn[1];
     Link_ProcBufOut[2]:=HI(ATStatus);
     Link_ProcBufOut[3]:=LO(ATStatus);
     Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
     BufLampOsc[5]:=Link_ProcBufIn[1];
     end;
end;

procedure TFormISO.Read_PcbTest;
begin
     Link_ProcBufOut[2]:=HI(AdrPcb_Test_1);
     Link_ProcBufOut[3]:=LO(AdrPcb_Test_1);
     Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
     Pcb_Test_1:= Link_ProcBufIn[1];
     Pcb_Test_2:= Link_ProcBufIn[2];
     Pcb_Test_3:= Link_ProcBufIn[3];
     Pcb_Test_4:= Link_ProcBufIn[4];
     Pcb_Test_5:= Link_ProcBufIn[5];
     Pcb_Test_6:= Link_ProcBufIn[6];
     Pcb_Test_7:= Link_ProcBufIn[7];
     Pcb_Test_8:= Link_ProcBufIn[8];
     if Tip_Block < 8 then
     begin
     Link_ProcBufOut[2]:=HI(W0_Gap_Value-74); // WL_Off_Val
     Link_ProcBufOut[3]:=LO(W0_Gap_Value-74);
     Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
     WL_Off_Val:= Link_ProcBufIn[1];
     WL_On_Val:= Link_ProcBufIn[2];
     DBR_On_Val:= Link_ProcBufIn[6];
     DBR_Off_Val:= Link_ProcBufIn[7];

     Link_ProcBufOut[2]:=HI(W0_Gap_Value-66); // LASR_On_ADCValue
     Link_ProcBufOut[3]:=LO(W0_Gap_Value-66);
     Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
     LASR_On_Val:= Link_ProcBufIn[1];
     LASR_Off_Val:= Link_ProcBufIn[2];
     end
     else
     begin
        Link_ProcBufOut[2]:=HI(AdrRunaway_0);
        Link_ProcBufOut[3]:=LO(AdrRunaway_0);
        Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
        Pcb_Test_9:= Link_ProcBufIn[8];
     end;
     Pcb_Test_Read_Cmpl:=true;
end;

procedure TFormISO.ReadAGS;
Var TmpInt:integer;

begin
   if (Tip_Block > 3) then  begin
     Link_ProcBufOut[2]:=HI(AGS_Buf_Adr);
     Link_ProcBufOut[3]:=LO(AGS_Buf_Adr);
     Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
     TmpInt:=Link_ProcBufIn[1]*256 + Link_ProcBufIn[2];
     if TmpInt < 32768 then Omega_X:= TmpInt
                       else Omega_X:= TmpInt-65536;
     TmpInt:=Link_ProcBufIn[3]*256+Link_ProcBufIn[4];
     if TmpInt < 32768 then Omega_Y:= TmpInt
                       else Omega_Y:= TmpInt-65536;
     TmpInt:=Link_ProcBufIn[5]*256+Link_ProcBufIn[6];
     if TmpInt < 32768 then Omega_Z:= TmpInt
                       else Omega_Z:= TmpInt-65536;
     TmpInt:=Link_ProcBufIn[7]*256+Link_ProcBufIn[8];
     if TmpInt < 32768 then Accel_X:= TmpInt
                       else Accel_X:= TmpInt-65536;

     if Tip_Block < 8 then
     begin
     Link_ProcBufOut[2]:=HI(AGS_Buf_Adr+8);
     Link_ProcBufOut[3]:=LO(AGS_Buf_Adr+8);
     end
     else
     begin   //8
     Link_ProcBufOut[2]:=HI(AGS_Buf_Adr+1);
     Link_ProcBufOut[3]:=LO(AGS_Buf_Adr+1);
     end;
     Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
     TmpInt:=Link_ProcBufIn[1]*256+Link_ProcBufIn[2];
     if TmpInt < 32768 then Accel_Y:= TmpInt
                       else Accel_Y:= TmpInt-65536;
     TmpInt:=Link_ProcBufIn[3]*256+Link_ProcBufIn[4];
     if TmpInt < 32768 then Accel_Z:= TmpInt
                       else Accel_Z:= TmpInt-65536;
     TmpInt:=Link_ProcBufIn[5]*256+Link_ProcBufIn[6];
     if TmpInt < 32768 then Steering_Angle:= TmpInt
                       else Steering_Angle:= TmpInt-65536;
     STM_AGS_Status:= Link_ProcBufIn[7];
     Fl_AGS_Read:= true;
     Form1.Edit87.Text:= IntToStr(STM_AGS_Status);
  //   Проверяем завершение калибровки GYRO
     if Fl_Calibr_Gyro then
     begin
        // New AGS
        if (Link_ProcBufIn[7] = 14) then //Ok  14
        begin
            Calibr_Gyro_Cmpl := true;
            Calibr_Gyro_Err := false;
        end
        else
        if (Link_ProcBufIn[7] = 15) then //Err  15
        begin
            Calibr_Gyro_Cmpl := true;
            Calibr_Gyro_Err := true;
        end;
        // Old AGS
        if (Link_ProcBufIn[7] = 11) then Calibr_Gyro_Cmpl := true; //Ok
 //       Form1.Edit87.Text  := IntToStr(Link_ProcBufIn[7]);
     end;
   end;
end;

procedure TFormISO.ReadEBS22;
begin
     if Tip_Block > 3 then  begin
     Link_ProcBufOut[2]:=HI(EBS22_Buf_Adr);
     Link_ProcBufOut[3]:=LO(EBS22_Buf_Adr);
     Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
     EBS22_Status1:=Link_ProcBufIn[1];
     EBS22_Status2:=Link_ProcBufIn[2];
     EBS22_Status3:=Link_ProcBufIn[3];
     EBS22_Status4:=Link_ProcBufIn[4];
     EBS22_AxleLoadSum:=Link_ProcBufIn[5]*256+Link_ProcBufIn[6];
     Trailer_Num:=Link_ProcBufIn[7];
     EBS22_Cnt:=Link_ProcBufIn[8];
     end;
end;

procedure TFormISO.ReadVDCTestVAR;
Var TmpInt:integer;
begin
     if Tip_Block > 3 then
     begin
     Link_ProcBufOut[2]:=HI(VDCTestVAR_Adr);
     Link_ProcBufOut[3]:=LO(VDCTestVAR_Adr);
     Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
     TCO_Koef:=Link_ProcBufIn[1]*256+Link_ProcBufIn[2];
     CAN_CCVS_Status:=Link_ProcBufIn[3];
     Config_Cnt:=Link_ProcBufIn[4]*256+Link_ProcBufIn[5];
     RearAxle_Load:=Link_ProcBufIn[6]*256+Link_ProcBufIn[7];
     Gear_Num:=Link_ProcBufIn[8];

     // блок VDC Test VAR 2
     if Tip_Block < 8 then
     begin
     Link_ProcBufOut[2]:=HI(VDCTestVAR_Adr+8);
     Link_ProcBufOut[3]:=LO(VDCTestVAR_Adr+8);
     end
     else
     begin
     Link_ProcBufOut[2]:=HI(VDCTestVAR_Adr+1);
     Link_ProcBufOut[3]:=LO(VDCTestVAR_Adr+1);
     end;
     Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
     Trailer_Press_1L:=Link_ProcBufIn[1];
     Trailer_Press_1R:=Link_ProcBufIn[2];
     Trailer_Press_2L:=Link_ProcBufIn[3];
     Trailer_Press_2R:=Link_ProcBufIn[4];
     Trailer_Press_3L:=Link_ProcBufIn[5];
     Trailer_Press_3R:=Link_ProcBufIn[6];
     EBS25_Status5:=Link_ProcBufIn[7];
     EBS25_Cnt:=Link_ProcBufIn[8];
     // блок VDC Test VAR 3
     if Tip_Block < 8 then
     begin
     Link_ProcBufOut[2]:=HI(VDCTestVAR_Adr+16);
     Link_ProcBufOut[3]:=LO(VDCTestVAR_Adr+16);
     end
     else
     begin
     Link_ProcBufOut[2]:=HI(VDCTestVAR_Adr+2);
     Link_ProcBufOut[3]:=LO(VDCTestVAR_Adr+2);
     end;
     Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
     TrainMass:=Link_ProcBufIn[1]*256+Link_ProcBufIn[2];
     FrontInPress:=Link_ProcBufIn[3];
     RearInPress:=Link_ProcBufIn[4];
     Trailer_Speed:=Link_ProcBufIn[5]*256+Link_ProcBufIn[6];
     CANT_Mode:=Link_ProcBufIn[7];
     Trailer_Press:=Link_ProcBufIn[8];
// блок VDC Test VAR 4
     if Tip_Block < 8 then
     begin
     Link_ProcBufOut[2]:=HI(VDCTestVAR_Adr+24);
     Link_ProcBufOut[3]:=LO(VDCTestVAR_Adr+24);
     end
     else
     begin
     Link_ProcBufOut[2]:=HI(VDCTestVAR_Adr+3);
     Link_ProcBufOut[3]:=LO(VDCTestVAR_Adr+3);
     end;
     Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
     Mass_Break_Est:=Link_ProcBufIn[1]*256+Link_ProcBufIn[2];
     EBL_REG_Koef:=Link_ProcBufIn[3];
     Hitch_Fz:=Link_ProcBufIn[4]*256+Link_ProcBufIn[5];
     Mass_Engine_Est:=Link_ProcBufIn[6]*256+Link_ProcBufIn[7];
     Load_Koef:=Link_ProcBufIn[8];

// блок Test_VAR5
     Link_ProcBufOut[2]:=HI(Test_VAR5_Adr);
     Link_ProcBufOut[3]:=LO(Test_VAR5_Adr);
     Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
     SelfTun_PeakTorque:=Link_ProcBufIn[1]*256+Link_ProcBufIn[2];
     SelfTun_Break_KP:=Link_ProcBufIn[3];

     Brake_Time1:=Link_ProcBufIn[4];
     Brake_Deccel1:=Link_ProcBufIn[5];

     SelfTun_Engine_PTxx:=Link_ProcBufIn[6];
     Engine_TorqueLoss:=Link_ProcBufIn[7]*256+Link_ProcBufIn[8];

// блок Test_VAR6
     if Tip_Block < 8 then
     begin
     Link_ProcBufOut[2]:=HI(Test_VAR5_Adr+8);
     Link_ProcBufOut[3]:=LO(Test_VAR5_Adr+8);
     end
     else
     begin
     Link_ProcBufOut[2]:=HI(Test_VAR5_Adr+1);
     Link_ProcBufOut[3]:=LO(Test_VAR5_Adr+1);
     end;
     Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
     TmpInt:=Link_ProcBufIn[1]*256+Link_ProcBufIn[2];
     if TmpInt < 32768 then Below_SensPress:= TmpInt
                       else Below_SensPress:= 0;
     DSC_Flags4s:=Link_ProcBufIn[3];
     Engine_PercentLoss:=Link_ProcBufIn[4];
     TmpInt:=Link_ProcBufIn[5]*256+Link_ProcBufIn[6];
     if TmpInt < 32768 then SAS_Zero_Angle:= TmpInt
                       else SAS_Zero_Angle:= TmpInt-65536;
     EC1_PeakTorque:=Link_ProcBufIn[7]*256+Link_ProcBufIn[8];

// блок Test_VAR7
     if Tip_Block < 8 then
     begin
     Link_ProcBufOut[2]:=HI(Test_VAR5_Adr+16);
     Link_ProcBufOut[3]:=LO(Test_VAR5_Adr+16);
     end
     else
     begin
     Link_ProcBufOut[2]:=HI(Test_VAR5_Adr+2);
     Link_ProcBufOut[3]:=LO(Test_VAR5_Adr+2);
     end;
     Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
     TCO_KoefFront:=Link_ProcBufIn[1]*256+Link_ProcBufIn[2];
     PS_CAN_SA:=Link_ProcBufIn[3];
     DSC_Flags1s:=Link_ProcBufIn[4];
     ECAS_PS_Offset:=Link_ProcBufIn[5];
     if Tip_Block < 8 then
     begin
      V_PO_STM:=IntToStr(Link_ProcBufIn[6]);
     end
     else
     begin
     ECU_PO_MC1:=IntToStr(Link_ProcBufIn[6]);
     ECU_PO_MC2:=IntToStr(Link_ProcBufIn[7]);
     ECU_Ver_PO:=IntToStr(Link_ProcBufIn[8]);
     end;

//  блок VDC Test VAR 8
     if Tip_Block < 8 then
     begin
     Link_ProcBufOut[2]:=HI(Test_VAR5_Adr+24);
     Link_ProcBufOut[3]:=LO(Test_VAR5_Adr+24);
     end
     else
     begin
     Link_ProcBufOut[2]:=HI(Test_VAR5_Adr+3);
     Link_ProcBufOut[3]:=LO(Test_VAR5_Adr+3);
     end;
     Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
     SelfTun_Engine_Loss_K1:=Link_ProcBufIn[1];
     SelfTun_Engine_Loss_K2:=Link_ProcBufIn[2];
     TCO_KoefRear:=Link_ProcBufIn[4]*256+Link_ProcBufIn[5];
     Pcb_Test_BrPS_Val:=Link_ProcBufIn[6];
     EBS21_Status1:=Link_ProcBufIn[7];
     EBS21_Status2:=Link_ProcBufIn[8];
//  блок VDC Test VAR 9
     if Tip_Block < 8 then
     begin
     Link_ProcBufOut[2]:=HI(Test_VAR5_Adr+32);
     Link_ProcBufOut[3]:=LO(Test_VAR5_Adr+32);
     end
     else
     begin
     Link_ProcBufOut[2]:=HI(Test_VAR5_Adr+4);
     Link_ProcBufOut[3]:=LO(Test_VAR5_Adr+4);
     end;
     Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
     AGS_Err_Hi:=Link_ProcBufIn[1];
     AGS_Err_Lo:=Link_ProcBufIn[2];
     AGS_CFG1_B0:=Link_ProcBufIn[3];
     SAS_Err_Hi:=Link_ProcBufIn[4];
     SAS_Err_Lo:=Link_ProcBufIn[5];
     AGS_STM_TEMP:=Link_ProcBufIn[6];
     AGS_IAM_TEMP:=Link_ProcBufIn[7];
     end;
     FL_ReadVDCVAR:=True;
end;

procedure TFormISO.ReadCAN_TCO;
begin
     if Tip_Block > 3 then
     begin
     Link_ProcBufOut[2]:=HI(TCO_Koef_Adr);
     Link_ProcBufOut[3]:=LO(TCO_Koef_Adr);
     Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
     CAN_TCO1_Taxo:= Link_ProcBufIn[1]*256+Link_ProcBufIn[2];
     CAN_TCO1_Speed:=Link_ProcBufIn[3]*256+Link_ProcBufIn[4];
     CAN_TCO1_Status:=Link_ProcBufIn[5];
     CAN_ASC1_Status:=Link_ProcBufIn[6];
     EC1_RefTorque:=Link_ProcBufIn[7]*256+Link_ProcBufIn[8];
     end;
end;

procedure TFormISO.ReadCANVAR;
begin
     if Tip_Block > 3 then
     begin
     Link_ProcBufOut[2]:=HI(CAN_Buff_Adr);
     Link_ProcBufOut[3]:=LO(CAN_Buff_Adr);
     Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
     CAN_AirPress_1:=Link_ProcBufIn[1];
     CAN_AirPress_2:=Link_ProcBufIn[2];
     CAN_Driver:=Link_ProcBufIn[3];
     CAN_Torque:=Link_ProcBufIn[4];
     CAN_Taxo:=Link_ProcBufIn[5];
     CAN_Accelerator:=Link_ProcBufIn[6];
     CAN_CruCon_Status:=Link_ProcBufIn[7];
     CAN_CCVS_Speed:=Link_ProcBufIn[8];
     end;
end;

procedure TFormISO.ReadCANVAR2;
begin
     if Tip_Block > 3 then
     begin
     Link_ProcBufOut[2]:=HI(CAN_HDRH_Adr);
     Link_ProcBufOut[3]:=LO(CAN_HDRH_Adr);
     Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
     CAN_HDRH_Distance:=Link_ProcBufIn[1]*256*256*256+
                        Link_ProcBufIn[2]*256*256+
                        Link_ProcBufIn[3]*256+
                        Link_ProcBufIn[4];
     CAN_AmbientAir:=Link_ProcBufIn[5]*256+Link_ProcBufIn[6];
     CAN_PGN_Find:=Link_ProcBufIn[7];
     CAN_PGN_Tout:=Link_ProcBufIn[8];
     if (CAN_PGN_Find and $01) =$01 then  Find_ASC4:=true
                                    else  Find_ASC4:=false;
     if (CAN_PGN_Find and $02) =$02 then  Find_TCO1:=true
                                    else  Find_TCO1:=false;
     if (CAN_PGN_Find and $04) =$04 then  Find_CCVS:=true
                                    else  Find_CCVS:=false;
     if (CAN_PGN_Find and $08) =$08 then  Find_EEC2:=true
                                    else  Find_EEC2:=false;
     if (CAN_PGN_Find and $10) =$10 then  Find_EEC1:=true
                                    else  Find_EEC1:=false;
     if (CAN_PGN_Find and $20) =$20 then  Find_AMB:=true
                                    else  Find_AMB:=false;
     if (CAN_PGN_Find and $40) =$40 then  Find_VDHR:=true
                                    else  Find_VDHR:=false;
     if (CAN_PGN_Find and $80) =$80 then  Find_AIR1:=true
                                    else  Find_AIR1:=false;

     if (CAN_PGN_Tout and $01) =$01 then  Tout_ASC4:=true
                                    else  Tout_ASC4:=false;
     if (CAN_PGN_Tout and $02) =$02 then  Tout_TCO1:=true
                                    else  Tout_TCO1:=false;
     if (CAN_PGN_Tout and $04) =$04 then  Tout_CCVS:=true
                                    else  Tout_CCVS:=false;
     if (CAN_PGN_Tout and $08) =$08 then  Tout_EEC2:=true
                                    else  Tout_EEC2:=false;
     if (CAN_PGN_Tout and $10) =$10 then  Tout_EEC1:=true
                                    else  Tout_EEC1:=false;
     if (CAN_PGN_Tout and $20) =$20 then  Tout_AMB:=true
                                    else  Tout_AMB:=false;
     if (CAN_PGN_Tout and $40) =$40 then  Tout_VDHR:=true
                                    else  Tout_VDHR:=false;
     if (CAN_PGN_Tout and $80) =$80 then  Tout_AIR1:=true
                                    else  Tout_AIR1:=false;
     // блок CAN VAR 3 CAN_VAR4_Adr
     if Tip_Block < 8 then
     begin
     Link_ProcBufOut[2]:=HI(CAN_HDRH_Adr+8);
     Link_ProcBufOut[3]:=LO(CAN_HDRH_Adr+8);
     end
     else
     begin
     Link_ProcBufOut[2]:=HI(CAN_HDRH_Adr+1);
     Link_ProcBufOut[3]:=LO(CAN_HDRH_Adr+1);
     end;
     Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
     BellowPress:=Link_ProcBufIn[1]*256+Link_ProcBufIn[2];
     EC1_TaxoPoint1:=Link_ProcBufIn[3]*256+Link_ProcBufIn[4];
     EC1_TorquePoint1:=Link_ProcBufIn[5];
     EC1_TorquePoint5:=Link_ProcBufIn[6];
     EC1_TaxoPoint2:=Link_ProcBufIn[7]*256+Link_ProcBufIn[8];

     // блок UartDZ.Sel = 8
     if Tip_Block < 8 then
     begin
     Link_ProcBufOut[2]:=HI(CAN_HDRH_Adr+16);
     Link_ProcBufOut[3]:=LO(CAN_HDRH_Adr+16);
     end
     else
     begin
     Link_ProcBufOut[2]:=HI(CAN_HDRH_Adr+2);
     Link_ProcBufOut[3]:=LO(CAN_HDRH_Adr+2);
     end;
     Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
     Validity_Flags:=Link_ProcBufIn[2];
     FrontAxle_Load:=Link_ProcBufIn[3]*256+Link_ProcBufIn[4];
     Engine_Torque_Nm:=Link_ProcBufIn[5]*256+Link_ProcBufIn[6];
     Truck_Mass_ECAS:=Link_ProcBufIn[7]*256+Link_ProcBufIn[8];

     // блок CAN VAR 4
     Link_ProcBufOut[2]:=HI(CAN_VAR4_Adr);
     Link_ProcBufOut[3]:=LO(CAN_VAR4_Adr);
     Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
     CAN_EBC1_B3:=Link_ProcBufIn[1];
     CAN_EBC1_B6:=Link_ProcBufIn[2];
     CAN_EBC1_B7:=Link_ProcBufIn[3];
     CAN_EBC1_Adr:=Link_ProcBufIn[4];
     CAN_Flags7:=Link_ProcBufIn[5];
     PGN_FF23_Ubat:=Link_ProcBufIn[6];
     PGN_FF22_Fuel:=Link_ProcBufIn[7];
     DSC_Flags5:=Link_ProcBufIn[8];

     // блок CAN VAR 5
     if Tip_Block < 8 then
     begin
     Link_ProcBufOut[2]:=HI(CAN_VAR4_Adr+8);
     Link_ProcBufOut[3]:=LO(CAN_VAR4_Adr+8);
     end
     else
     begin
     Link_ProcBufOut[2]:=HI(CAN_VAR4_Adr+1);
     Link_ProcBufOut[3]:=LO(CAN_VAR4_Adr+1);
     end;
     Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
     PGN_FF20_Status1:=Link_ProcBufIn[1];
     PGN_FF20_Status2:=Link_ProcBufIn[2];
     PGN_FF21_Status1:=Link_ProcBufIn[3];
     PGN_FF22_AIR1:=Link_ProcBufIn[4];
     PGN_FF22_AIR2:=Link_ProcBufIn[5];
     PGN_FF22_Temp:=Link_ProcBufIn[6];
     PGN_FF22_Taxo:=Link_ProcBufIn[7]*256+Link_ProcBufIn[8];

     // блок CAN VAR 6
     if Tip_Block < 8 then
     begin
     Link_ProcBufOut[2]:=HI(CAN_VAR4_Adr+16);
     Link_ProcBufOut[3]:=LO(CAN_VAR4_Adr+16);
     end
     else
     begin
     Link_ProcBufOut[2]:=HI(CAN_VAR4_Adr+2);
     Link_ProcBufOut[3]:=LO(CAN_VAR4_Adr+2);
     end;
     Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
     CAN_Gear_State:=Link_ProcBufIn[1];
     CAN_Gear_Num:=Link_ProcBufIn[2];
     CAN_Gear_OutTaxo:=Link_ProcBufIn[3]*256+Link_ProcBufIn[4];
     Door_Status:=Link_ProcBufIn[5];
     CAN_DC1_Adr:=Link_ProcBufIn[6];
     Load_Brake_Num:=Link_ProcBufIn[7];
     Load_Engine_Num:=Link_ProcBufIn[8];
     end;
end;

procedure xWriteTestVAR;
begin
     Link_ProcBufOut[2]:=HI(WriteTestVAR_Addres);
     Link_ProcBufOut[3]:=LO(WriteTestVAR_Addres);
     Link_ProcBufOut[4]:=WriteTestVAR_Byte;
     Com_Link_Command(Moto_WR_RAM,Link_ProcBufOut,Link_ProcBufIn);
end;

procedure xWriteVIN_DA;
begin
     Link_ProcBufOut[2]:=HI(Adr_CAN_VIN_DA);
     Link_ProcBufOut[3]:=LO(Adr_CAN_VIN_DA);
     Link_ProcBufOut[4]:=Adr_CAN_DA;
     Com_Link_Command(Moto_WR_RAM,Link_ProcBufOut,Link_ProcBufIn);
     CAN_DA_Fl:= true;
end;
Procedure TFormISO.LoadOscAddress;
begin
     Link_ProcBufOut[2]:=Hi(StrToInt(Form1.Edit1.Text));
     Link_ProcBufOut[3]:=Lo(StrToInt(Form1.Edit1.Text));
     Link_ProcBufOut[4]:=Hi(StrToInt(Form1.Edit2.Text));
     Link_ProcBufOut[5]:=Lo(StrToInt(Form1.Edit2.Text));
     Link_ProcBufOut[6]:=Hi(StrToInt(Form1.Edit3.Text));
     Link_ProcBufOut[7]:=Lo(StrToInt(Form1.Edit3.Text));
     Link_ProcBufOut[8]:=Hi(StrToInt(Form1.Edit4.Text));
     Link_ProcBufOut[9]:=Lo(StrToInt(Form1.Edit4.Text));
     Link_ProcBufOut[10]:=Hi(StrToInt(Form1.Edit5.Text));
     Link_ProcBufOut[11]:=Lo(StrToInt(Form1.Edit5.Text));
     Link_ProcBufOut[12]:=Hi(StrToInt(Form1.Edit6.Text));
     Link_ProcBufOut[13]:=Lo(StrToInt(Form1.Edit6.Text));
     Link_ProcBufOut[14]:=Hi(StrToInt(Form1.Edit7.Text));
     Link_ProcBufOut[15]:=Lo(StrToInt(Form1.Edit7.Text));
     Link_ProcBufOut[16]:=Hi(StrToInt(Form1.Edit8.Text));
     Link_ProcBufOut[17]:=Lo(StrToInt(Form1.Edit8.Text));
     Link_ProcBufOut[18]:=Hi(StrToInt(Form1.Edit9.Text));
     Link_ProcBufOut[19]:=Lo(StrToInt(Form1.Edit9.Text));
     Link_ProcBufOut[20]:=Hi(StrToInt(Form1.Edit10.Text));
     Link_ProcBufOut[21]:=Lo(StrToInt(Form1.Edit10.Text));
     Link_ProcBufOut[22]:=Hi(StrToInt(Form1.Edit11.Text));
     Link_ProcBufOut[23]:=Lo(StrToInt(Form1.Edit11.Text));
     Link_ProcBufOut[24]:=Hi(StrToInt(Form1.Edit12.Text));
     Link_ProcBufOut[25]:=Lo(StrToInt(Form1.Edit12.Text));

 //    if NumberOsc = NumberOsc_New then begin
     Link_ProcBufOut[26]:=Hi(StrToInt(Form1.Edit14.Text));
     Link_ProcBufOut[27]:=Lo(StrToInt(Form1.Edit14.Text));
     Link_ProcBufOut[28]:=Hi(StrToInt(Form1.Edit15.Text));
     Link_ProcBufOut[29]:=Lo(StrToInt(Form1.Edit15.Text));
     Link_ProcBufOut[30]:=Hi(StrToInt(Form1.Edit16.Text));
     Link_ProcBufOut[31]:=Lo(StrToInt(Form1.Edit16.Text));
     Link_ProcBufOut[32]:=Hi(StrToInt(Form1.Edit17.Text));
     Link_ProcBufOut[33]:=Lo(StrToInt(Form1.Edit17.Text));

     Link_ProcBufOut[34]:=Hi(StrToInt(Form1.Edit88.Text));
     Link_ProcBufOut[35]:=Lo(StrToInt(Form1.Edit88.Text));
     Link_ProcBufOut[36]:=Hi(StrToInt(Form1.Edit89.Text));
     Link_ProcBufOut[37]:=Lo(StrToInt(Form1.Edit89.Text));
     Link_ProcBufOut[38]:=Hi(StrToInt(Form1.Edit90.Text));
     Link_ProcBufOut[39]:=Lo(StrToInt(Form1.Edit90.Text));
     Link_ProcBufOut[40]:=Hi(StrToInt(Form1.Edit91.Text));
     Link_ProcBufOut[41]:=Lo(StrToInt(Form1.Edit91.Text));

 //    end;
     Com_Link_Command(Moto_ChangeMonAddress,Link_ProcBufOut,Link_ProcBufIn);
end;


//********************************
Procedure xDownLoadCANAddress;
begin
 {    Link_ProcBufOut[2]:=Hi(CANAddress);
     Link_ProcBufOut[3]:=Lo(CANAddress);
     Link_ProcBufOut[4]:=Hi(CANAddress+5);
     Link_ProcBufOut[5]:=Lo(CANAddress+5);
     Link_ProcBufOut[6]:=Hi(CANAddress+9);
     Link_ProcBufOut[7]:=Lo(CANAddress+9);

     Link_ProcBufOut[8]:=Hi(CANAddress+1);
     Link_ProcBufOut[9]:=Lo(CANAddress+1);

     Link_ProcBufOut[10]:=Hi(CANAddress+6);
     Link_ProcBufOut[11]:=Lo(CANAddress+6);
     Link_ProcBufOut[12]:=Hi(CANAddress+10);
     Link_ProcBufOut[13]:=Lo(CANAddress+10);

     Link_ProcBufOut[14]:=Hi(CANAddress+2);
     Link_ProcBufOut[15]:=Lo(CANAddress+2);

     Link_ProcBufOut[16]:=Hi(CANAddress+7);
     Link_ProcBufOut[17]:=Lo(CANAddress+7);
     Link_ProcBufOut[18]:=Hi(CANAddress+11);
     Link_ProcBufOut[19]:=Lo(CANAddress+11);

     Link_ProcBufOut[20]:=Hi(CANAddress+3);
     Link_ProcBufOut[21]:=Lo(CANAddress+3);

     Link_ProcBufOut[22]:=Hi(CANAddress+8);
     Link_ProcBufOut[23]:=Lo(CANAddress+8);
     Link_ProcBufOut[24]:=Hi(CANAddress+12);
     Link_ProcBufOut[25]:=Lo(CANAddress+12);}

     Link_ProcBufOut[2]:=Hi(CANAddress);
     Link_ProcBufOut[3]:=Lo(CANAddress);

     Link_ProcBufOut[4]:=Hi(CANAddress+4);
     Link_ProcBufOut[5]:=Lo(CANAddress+4);
     Link_ProcBufOut[6]:=Hi(CANAddress+8);
     Link_ProcBufOut[7]:=Lo(CANAddress+8);

     Link_ProcBufOut[8]:=Hi(CANAddress+1);
     Link_ProcBufOut[9]:=Lo(CANAddress+1);

     Link_ProcBufOut[10]:=Hi(CANAddress+5);
     Link_ProcBufOut[11]:=Lo(CANAddress+5);
     Link_ProcBufOut[12]:=Hi(CANAddress+9);
     Link_ProcBufOut[13]:=Lo(CANAddress+9);

     Link_ProcBufOut[14]:=Hi(CANAddress+2);
     Link_ProcBufOut[15]:=Lo(CANAddress+2);

     Link_ProcBufOut[16]:=Hi(CANAddress+6);
     Link_ProcBufOut[17]:=Lo(CANAddress+6);
     Link_ProcBufOut[18]:=Hi(CANAddress+10);
     Link_ProcBufOut[19]:=Lo(CANAddress+10);

     Link_ProcBufOut[20]:=Hi(CANAddress+3);
     Link_ProcBufOut[21]:=Lo(CANAddress+3);

     Link_ProcBufOut[22]:=Hi(CANAddress+7);
     Link_ProcBufOut[23]:=Lo(CANAddress+7);
     Link_ProcBufOut[24]:=Hi(CANAddress+11);
     Link_ProcBufOut[25]:=Lo(CANAddress+11);
     Com_Link_Command(Moto_ChangeMonAddress,Link_ProcBufOut,Link_ProcBufIn);
end;

procedure xClrErrSSmot;
var
  Loop: byte;
begin
  for  Loop:=0 to 7 do  WriteMOTORAM((Weel0_Error_Reg0+Loop),0);
  for  Loop:=32 to 48 do WriteATEPROMByte(Loop,0);
end;

procedure ReadNOP;
begin
   Com_Link_Command(Moto_ReadActiveErrors,Link_ProcBufOut,Link_ProcBufIn);
end;

Procedure Send_Speed;
begin
     Link_ProcBufOut[2]:=Hi(Weel0);
     Link_ProcBufOut[3]:=Lo(Weel0);
     Link_ProcBufOut[4]:=Hi(Weel1);
     Link_ProcBufOut[5]:=Lo(Weel1);
     Link_ProcBufOut[6]:=Hi(Weel2);
     Link_ProcBufOut[7]:=Lo(Weel2);
     Link_ProcBufOut[8]:=Hi(Weel3);
     Link_ProcBufOut[9]:=Lo(Weel3);
     Link_ProcBufOut[10]:=bp;
     Com_Link_Command(Moto_DownloadSpeed,Link_ProcBufOut,Link_ProcBufIn);
     MKL :=Link_ProcBufIn[1];
     Oss1:=Link_ProcBufIn[2];
     Oss2:=Link_ProcBufIn[3];
     Oss3:=Link_ProcBufIn[4];
     Oss4:=Link_ProcBufIn[5];
     Oss5:=Link_ProcBufIn[6];
          SinxrEmul:=true;
 //    Oss6:=Link_ProcBufIn[7];
end;


Procedure Send_DSC;
begin
     Link_ProcBufOut[2]:=Hi(Weel0);
     Link_ProcBufOut[3]:=Lo(Weel0);
     Link_ProcBufOut[4]:=Hi(Weel1);
     Link_ProcBufOut[5]:=Lo(Weel1);
     Link_ProcBufOut[6]:=Hi(Weel2);
     Link_ProcBufOut[7]:=Lo(Weel2);
     Link_ProcBufOut[8]:=Hi(Weel3);
     Link_ProcBufOut[9]:=Lo(Weel3);
     Link_ProcBufOut[10]:=bp;
     Link_ProcBufOut[11]:=Wd;
     Link_ProcBufOut[12]:=Wz;
     Link_ProcBufOut[13]:=Ay;
     Link_ProcBufOut[14]:=Ax;
     Com_Link_Command(Road_Emul_DSC,Link_ProcBufOut,Link_ProcBufIn);
     MKL :=Link_ProcBufIn[1];
     Oss1:=Link_ProcBufIn[2];
     Oss2:=Link_ProcBufIn[3];
     Oss3:=Link_ProcBufIn[4];
     Oss4:=Link_ProcBufIn[5];
     Oss5:=Link_ProcBufIn[6];
     SinxrEmul:=true;
 //    Oss6:=Link_ProcBufIn[7];
end;

Procedure  xDownLoadOscAddress;
Var
        TestWord:Word;
begin
     if Tip_Block < 8 then
     begin
     TestWord:=StrToInt(Form1.Edit1.Text);
     Link_ProcBufOut[2]:=Hi(TestWord);
     Link_ProcBufOut[3]:=Lo(TestWord);
     TestWord:=StrToInt(Form1.Edit2.Text);
     Link_ProcBufOut[4]:=Hi(TestWord);
     Link_ProcBufOut[5]:=Lo(TestWord);
     TestWord:=StrToInt(Form1.Edit3.Text);
     Link_ProcBufOut[6]:=Hi(TestWord);
     Link_ProcBufOut[7]:=Lo(TestWord);
     TestWord:=StrToInt(Form1.Edit4.Text);
     Link_ProcBufOut[8]:=Hi(TestWord);
     Link_ProcBufOut[9]:=Lo(TestWord);
     TestWord:=StrToInt(Form1.Edit5.Text);
     Link_ProcBufOut[10]:=Hi(TestWord);
     Link_ProcBufOut[11]:=Lo(TestWord);
     TestWord:=StrToInt(Form1.Edit6.Text);
     Link_ProcBufOut[12]:=Hi(TestWord);
     Link_ProcBufOut[13]:=Lo(TestWord);
     TestWord:=StrToInt(Form1.Edit7.Text);
     Link_ProcBufOut[14]:=Hi(TestWord);
     Link_ProcBufOut[15]:=Lo(TestWord);
     TestWord:=StrToInt(Form1.Edit8.Text);
     Link_ProcBufOut[16]:=Hi(TestWord);
     Link_ProcBufOut[17]:=Lo(TestWord);
     TestWord:=StrToInt(Form1.Edit9.Text);
     Link_ProcBufOut[18]:=Hi(TestWord);
     Link_ProcBufOut[19]:=Lo(TestWord);
     TestWord:=StrToInt(Form1.Edit10.Text);
     Link_ProcBufOut[20]:=Hi(TestWord);
     Link_ProcBufOut[21]:=Lo(TestWord);
     TestWord:=StrToInt(Form1.Edit11.Text);
     Link_ProcBufOut[22]:=Hi(TestWord);
     Link_ProcBufOut[23]:=Lo(TestWord);
     TestWord:=StrToInt(Form1.Edit12.Text);
     Link_ProcBufOut[24]:=Hi(TestWord);
     Link_ProcBufOut[25]:=Lo(TestWord);

     TestWord:=StrToInt(Form1.Edit14.Text);
     Link_ProcBufOut[26]:=Hi(TestWord);
     Link_ProcBufOut[27]:=Lo(TestWord);
     TestWord:=StrToInt(Form1.Edit15.Text);
     Link_ProcBufOut[28]:=Hi(TestWord);
     Link_ProcBufOut[29]:=Lo(TestWord);
     TestWord:=StrToInt(Form1.Edit16.Text);
     Link_ProcBufOut[30]:=Hi(TestWord);
     Link_ProcBufOut[31]:=Lo(TestWord);
     TestWord:=StrToInt(Form1.Edit17.Text);
     Link_ProcBufOut[32]:=Hi(TestWord);
     Link_ProcBufOut[33]:=Lo(TestWord);

     TestWord:=StrToInt(Form1.Edit88.Text);
     Link_ProcBufOut[34]:=Hi(TestWord);
     Link_ProcBufOut[35]:=Lo(TestWord);
     TestWord:=StrToInt(Form1.Edit89.Text);
     Link_ProcBufOut[36]:=Hi(TestWord);
     Link_ProcBufOut[37]:=Lo(TestWord);
     TestWord:=StrToInt(Form1.Edit90.Text);
     Link_ProcBufOut[38]:=Hi(TestWord);
     Link_ProcBufOut[39]:=Lo(TestWord);
     TestWord:=StrToInt(Form1.Edit91.Text);
     Link_ProcBufOut[40]:=Hi(TestWord);
     Link_ProcBufOut[41]:=Lo(TestWord);
     Com_Link_Command(Moto_ChangeMonAddress,Link_ProcBufOut,Link_ProcBufIn);
     // селектор сценариев Road
     Link_ProcBufOut[2]:=HI(Road_Sel_Adr);
     Link_ProcBufOut[3]:=LO(Road_Sel_Adr);
     Link_ProcBufOut[4]:=StrToInt(Form1.Edit100.Text);
     Com_Link_Command(Moto_WR_RAM,Link_ProcBufOut,Link_ProcBufIn);
     end
     else
     begin  //2STM
     // селектор сценариев Road
     Link_ProcBufOut[2]:=HI(Road_Sel_Adr);
     Link_ProcBufOut[3]:=LO(Road_Sel_Adr);
     Link_ProcBufOut[4]:=StrToInt(Form1.Edit100.Text);
     Link_ProcBufOut[5]:=StrToInt(Form1.Edit418.Text);
     Com_Link_Command(Moto_WR_RAM,Link_ProcBufOut,Link_ProcBufIn);
     // селектор сценариев TP
     Link_ProcBufOut[2]:=HI(TestPoint_Sel_Adr);
     Link_ProcBufOut[3]:=LO(TestPoint_Sel_Adr);
     Link_ProcBufOut[4]:=StrToInt(Form1.Edit427.Text);
     Com_Link_Command(Moto_WR_RAM,Link_ProcBufOut,Link_ProcBufIn);
     end;

end;

procedure  xEraseError_EPROM;
Var
   AdrNV:integer;
   TempSelectorMC:integer;
begin
     if Com_Connected_F then
     begin
     AdrNV:=0;
     repeat
     Link_ProcBufOut[2]:=HI(AdrNV);
     Link_ProcBufOut[3]:=LO(AdrNV);
     Com_Link_Command(Erase_Error_EPROM,Link_ProcBufOut,Link_ProcBufIn);  //$74;
     AdrNV:=AdrNV+8;
     if Tip_Block >= 8 then Sleep(20);
     until AdrNV>= Adr_CorrKdec_H-1;
     end;
end;

procedure  TFormISO.SendPGM;
begin
     Link_ProcBufOut[2]:=HI(adrPGMcnt);
     Link_ProcBufOut[3]:=LO(adrPGMcnt);
     Link_ProcBufOut[4]:=DZ_PGMCnt;
     Com_Link_Command(Moto_WR_RAM,Link_ProcBufOut,Link_ProcBufIn);
end;

procedure  xSendPGMcnt;
begin
     Fl_SendPGMcnt:=false;
     Link_ProcBufOut[2]:=HI(adrPGMcnt);
     Link_ProcBufOut[3]:=LO(adrPGMcnt);
     Link_ProcBufOut[4]:=DZ_PGMCnt;
     Com_Link_Command(Moto_WR_RAM,Link_ProcBufOut,Link_ProcBufIn);
     Fl_SendPGMcnt:=true;
end;

procedure  xSendInhcnt;
begin
     Fl_SendInhcnt:=false;
     Link_ProcBufOut[2]:=HI(adrPGMcnt-2);
     Link_ProcBufOut[3]:=LO(adrPGMcnt-2);
     Link_ProcBufOut[4]:=DZ_InhCnt;
     Com_Link_Command(Moto_WR_RAM,Link_ProcBufOut,Link_ProcBufIn);
     Fl_SendInhcnt:=true;
end;
procedure  xErase_EEPROM;
Var Loop:Integer;
begin
     If Not Com_Connected_F then begin
        Form1.Memo1.Lines.Add('Не могу стереть EEPROM!!! Отсутствует связь с блоком.');
        Exit;
     end;
     Form1.Memo1.Lines.Add('Стираю EEPROM.');
     Fl_EPROM_Error:=false;
     for Loop:=0 to ConstSectorNum-1 do
     begin
        Link_ProcBufOut[2]:=Hi(ConstStart+SizeFlashSector*Loop);
        Link_ProcBufOut[3]:=Lo(ConstStart+SizeFlashSector*Loop);
        Com_Link_Command(Moto_ClearFlashEEPROM,Link_ProcBufOut,Link_ProcBufIn);
        if ((Link_ProcBufIn[1] and $3F)<>Command_Buf) then
        begin
           Form1.Memo1.Lines.Add('Ошибка!!! Не могу стереть EEPROM!!!');
           Fl_EPROM_Error:=true;           
           Exit;
        end;
     end;
     Form1.Memo1.Lines.Add('EEPROM чист.')
end;


procedure  xWrite_EEPROM;
Var EEPROM_Address:Word;
    Loop:Integer;
begin
     Form1.Memo1.Lines.Add('Программирую EEPROM.');
     EEPROM_Address:=ConstStart;
     Fl_EPROM_Error:=false;
     For Loop:=0 to (EEPROM_Size) div 8 do
     begin
        Link_ProcBufOut[2]:=Hi(EEPROM_Address);
        Link_ProcBufOut[3]:=Lo(EEPROM_Address);
        Link_ProcBufOut[4]:=EEPROM_Array[0+Loop*8];
        Link_ProcBufOut[5]:=EEPROM_Array[1+Loop*8];
        Link_ProcBufOut[6]:=EEPROM_Array[2+Loop*8];
        Link_ProcBufOut[7]:=EEPROM_Array[3+Loop*8];
        Link_ProcBufOut[8]:=EEPROM_Array[4+Loop*8];
        Link_ProcBufOut[9]:=EEPROM_Array[5+Loop*8];
        Link_ProcBufOut[10]:=EEPROM_Array[6+Loop*8];
        Link_ProcBufOut[11]:=EEPROM_Array[7+Loop*8];
        if not (Com_Link_Command(Moto_WriteFlashEEPROM,Link_ProcBufOut,Link_ProcBufIn))
        or ((Link_ProcBufIn[1] and $3F)<>Command_Buf) then
        begin
             Form1.Memo1.Lines.Add('Ошибка!!! Не могу записать EEPROM!!!');
             Fl_WriteConst:=true;
             Fl_EPROM_Error:=true;
             Exit;
        end;
        EEPROM_Address:=EEPROM_Address+8;
     end;
     Form1.Memo1.Lines.Add('EEPROM зашит.');
     Fl_WriteConst:=true;
end;

procedure  xWrite_Security;
var     Temp_Word:word;
        TempSelectorMC:integer;
begin
        Temp_Word:=DumpMOT0+KeyByte2+DumpMOT7+KeyByte3+
                   DumpMOT126+DumpMOT127;
        Link_ProcBufOut[2]:=Lo(Temp_Word);
        Link_ProcBufOut[3]:=Hi(Temp_Word);
        Link_ProcBufOut[4]:=DumpMOT0;     //Block_Config
        Link_ProcBufOut[5]:=KeyByte2;
        Link_ProcBufOut[6]:=DumpMOT7;     //Button_Config
        Link_ProcBufOut[7]:=KeyByte3;
        Link_ProcBufOut[8]:=DumpMOT126;   //Config_ChSum_1
        Link_ProcBufOut[9]:=DumpMOT127;   //Config_ChSum_2
        if not (Com_Link_Command(Moto_Security,Link_ProcBufOut,Link_ProcBufIn))
        or ((Link_ProcBufIn[1] and $3F)<>Command_Buf) then  fl_Security:=False
                                                      else  fl_Security:=true;
        if (DumpMOT126 = $FF) and (DumpMOT127 = $FF) then  fl_Security:=true;
        
        fl_Security_Com:=true;
end;

// Прочитать байт данных из памяти  ЭППЗУ
Procedure ReadATEPROM(addr : word);
begin
   Link_ProcBufOut[2]:=HI(addr);
   Link_ProcBufOut[3]:=LO(addr);
   Com_Link_Command(Moto_ReadATEEPROM,Link_ProcBufOut,Link_ProcBufIn);
end;

procedure WriteATEPROMByte(adrEPROM:word;dataEPROM:byte);
Var
   ComBufOut,ComBufIn:ComBuf;
begin
   DumpEPROM[adrEPROM]:=dataEPROM;
   ComBufOut[2]:=HI(adrEPROM);
   ComBufOut[3]:=LO(adrEPROM);
   ComBufOut[4]:=dataEPROM;
   Com_Link_Command(Moto_WriteATEEPROM,ComBufOut,ComBufIn); //$6C;
end;

procedure DumpATLoad(Adr_Start,Adr_Stop:Word);
var
   Bl_num,i: integer;
begin
   Bl_num:=Adr_Start;
   repeat
        ReadATEPROM(Bl_num);
        for i := 0 to 7 do  DumpEPROM[Bl_num+i]:= Link_ProcBufIn[i+1];
        Bl_num:=Bl_num+8;
        if  (Bl_num mod 64)=0 then
            Form2.ProgressBar1.Position:=Round(100*Bl_num/2048);
   until Bl_num>=Adr_Stop;
end;


Procedure xLoadATTime;
Var
   Temp_Edit1,Temp_Edit14:string;
begin
     Temp_Edit1:=Form1.Edit1.Text;
     Temp_Edit14:=Form1.Edit14.Text;
     Form1.Edit14.Text:=IntToStr(AdrTIMER_LOW+2);
     Form1.Edit1.Text:= IntToStr(AdrSPI_In_Buff+1);
     xDownLoadOscAddress;
     Link_ProcBufOut[2]:=NumberOsc;
     Com_Link_Command(Moto_OscFrame,Link_ProcBufOut,Link_ProcBufIn);
     WorkTime:=Link_ProcBufIn[1];
     Fl_ATTime:=true;
     Form1.Edit14.Text:=Temp_Edit14;
     Form1.Edit1.Text:=Temp_Edit1;
     xDownLoadOscAddress;
end;

procedure RAMMOTLoad(Adr_Start,Adr_Stop:Word);
var
   Bl_num,i: integer;
begin
   Bl_num:=Adr_Start;
   repeat
     Link_ProcBufOut[2]:=HI(Bl_num);
     Link_ProcBufOut[3]:=LO(Bl_num);
     Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
     for i := 0 to 7 do  begin
                         RAMMOT[Bl_num-Adr_Start+i]:=Link_ProcBufIn[i+1];
                         end;
     Bl_num:=Bl_num+8;
   until Bl_num>=Adr_Stop;
end;

procedure CalibrState;
begin
     Link_ProcBufOut[2]:=HI(DumpMOTStart + 222);
     Link_ProcBufOut[3]:=LO(DumpMOTStart + 222);
     Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
// Vehicle_StateAGS
     Vehicle_StateAGS := Link_ProcBufIn[1];
     DumpMOT[222] := Vehicle_StateAGS;
// Vehicle.StateSAS
     Vehicle_StateSAS := Link_ProcBufIn[2];
     DumpMOT[223] := Vehicle_StateSAS;
end;

procedure DumpMOTLoad(Adr_Start,Adr_Stop:Word);
var
   Bl_num,i,Adr: integer;
begin
     Fl_FlashLoad:=False;
     Bl_num:=Adr_Start;
     if Tip_Block < 8 then
     begin
     repeat
       Link_ProcBufOut[2]:=HI(Bl_num);
       Link_ProcBufOut[3]:=LO(Bl_num);
     Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
     for i := 0 to 7 do  begin
                         DumpMOT[CFG_OffSet_Dump+Bl_num-Adr_Start+i]:=
                         Link_ProcBufIn[i+1];
                         DumpFlash[$880+Bl_num-Adr_Start+i]:=Link_ProcBufIn[i+1];
                         end;
     Bl_num:=Bl_num+8;
     until Bl_num>=Adr_Stop;
     end
     else
     begin
     repeat
        Link_ProcBufOut[2]:=HI(Bl_num+$8000);
        Link_ProcBufOut[3]:=LO(Bl_num+$8000);
        Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
        for i := 0 to 7 do
        begin
           Adr:= CFG_OffSet_Dump+Bl_num-Adr_Start+i;
           if Adr >=0 then
           begin
              DumpMOT[Adr]:= Link_ProcBufIn[i+1];
              DumpFlash[Adr]:=Link_ProcBufIn[i+1];
           end;
        end;
        Bl_num:=Bl_num+8;
     until Bl_num>=Adr_Stop;
     end;
     Fl_FlashLoad:=True;
end;

procedure DumpFlashLoad(Adr_Start,Adr_Stop:Word);
var
   Bl_num,i,Adr: integer;
   A:Word;
begin
   Bl_num:=Adr_Start;
   repeat
 //    Link_ProcBufOut[2]:=HI(Bl_num);
 //    Link_ProcBufOut[3]:=LO(Bl_num);

     if Tip_Block < 8 then
     begin
       Link_ProcBufOut[2]:=HI(Bl_num);
       Link_ProcBufOut[3]:=LO(Bl_num);
     end
     else
     begin
       A:= Bl_num+$8000;
       Link_ProcBufOut[2]:=HI(A);
       Link_ProcBufOut[3]:=LO(A);
//       Link_ProcBufOut[2]:=HI(Bl_num+$8000);
//       Link_ProcBufOut[3]:=LO(Bl_num+$8000);
     end;
     Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
     for i := 0 to 7 do
     begin
        Adr:= CFG_OffSet_Dump+Bl_num-Adr_Start+i;
        if Adr >=0 then
        begin
  //         DumpMOT[Adr]:= Link_ProcBufIn[i+1];
           DumpFlash[Adr]:=Link_ProcBufIn[i+1];
        end;
     end;
     Bl_num:=Bl_num+8;
     if  (Bl_num mod 64)=0 then
           Form2.ProgressBar1.Position:=Round(100*(Bl_num-Adr_Start)/4095);
   until Bl_num=Adr_Stop;
   Fl_FlashLoad:=True;
end;

procedure xRunawaySave;
Var
   ComBufOut,ComBufIn:ComBuf;
begin
    if Tip_Block < 8  then
    begin
// W2
     ComBufOut[2]:=HI(Adr_W2_Runaway_Buf);
     ComBufOut[3]:=LO(Adr_W2_Runaway_Buf);
     ComBufOut[4]:=RunWay div 65536;
     Com_Link_Command(Moto_WR_RAM,ComBufOut,ComBufIn);
     ComBufOut[2]:=HI(Adr_W2_Runaway_Buf+1);
     ComBufOut[3]:=LO(Adr_W2_Runaway_Buf+1);
     ComBufOut[4]:=(RunWay mod 65536) div 256;
     Com_Link_Command(Moto_WR_RAM,ComBufOut,ComBufIn);
     ComBufOut[2]:=HI(Adr_W2_Runaway_Buf+2);
     ComBufOut[3]:=LO(Adr_W2_Runaway_Buf+2);
     ComBufOut[4]:=(RunWay mod 65536) mod 256;
     Com_Link_Command(Moto_WR_RAM,ComBufOut,ComBufIn);
// W3
     ComBufOut[2]:=HI(Adr_W2_Runaway_Buf+4);
     ComBufOut[3]:=LO(Adr_W2_Runaway_Buf+4);
     ComBufOut[4]:=RunWay div 65536;
     Com_Link_Command(Moto_WR_RAM,ComBufOut,ComBufIn);
     ComBufOut[2]:=HI(Adr_W2_Runaway_Buf+5);
     ComBufOut[3]:=LO(Adr_W2_Runaway_Buf+5);
     ComBufOut[4]:=(RunWay mod 65536) div 256;
     Com_Link_Command(Moto_WR_RAM,ComBufOut,ComBufIn);
     ComBufOut[2]:=HI(Adr_W2_Runaway_Buf+6);
     ComBufOut[3]:=LO(Adr_W2_Runaway_Buf+6);
     ComBufOut[4]:=(RunWay mod 65536) mod 256;
     Com_Link_Command(Moto_WR_RAM,ComBufOut,ComBufIn);
// запись в EEPROM
     WriteATEPROMByte(Adr_BufRunaway,RunWay div 65536);
     WriteATEPROMByte(Adr_BufRunaway+1,(RunWay mod 65536) div 256);
     WriteATEPROMByte(Adr_BufRunaway+2,(RunWay mod 65536) mod 256);

     WriteATEPROMByte(Adr_BufRunaway+4,0);
     WriteATEPROMByte(Adr_BufRunaway+5,0);
     WriteATEPROMByte(Adr_BufRunaway+6,0);
     WriteATEPROMByte(Adr_BufRunaway+7,0);

     WriteATEPROMByte(Adr_BufRunaway+8,RunWay div 65536);
     WriteATEPROMByte(Adr_BufRunaway+9,(RunWay mod 65536) div 256);
     WriteATEPROMByte(Adr_BufRunaway+10,(RunWay mod 65536) mod 256);
     // для 7
 //    DSCPulsPress_Com:=71;
 //    FormISO.DSC_PulsPress;
     ComBufOut[2]:=71;
     Com_Link_Command(DSC_Puls_Press,ComBufOut,ComBufIn);
     end
     else
     begin
        ComBufOut[2]:=HI(AdrRunaway_0);
        ComBufOut[3]:=LO(AdrRunaway_0);
        ComBufOut[4]:=RunWay div 65536;
        ComBufOut[5]:=(RunWay mod 65536) div 256;
        ComBufOut[6]:=(RunWay mod 65536) mod 256;
        Com_Link_Command(Moto_WR_RAM,ComBufOut,ComBufIn);
      end;

end;

procedure WriteATEPROMString(adrEPROM:word;str:string);
Var
   ComBufOut,ComBufIn:ComBuf;
   i:integer;
begin
   for i:=1 to Length(str) do begin
   ComBufOut[2]:=HI(adrEPROM+i-1);
   ComBufOut[3]:=LO(adrEPROM+i-1);
   ComBufOut[4]:=Ord(str[i]);
   Com_Link_Command(Moto_WriteATEEPROM,ComBufOut,ComBufIn);
   end;
end;

function LoadATEPROMString(adrEPROM:word):string;
Var
   ComBufOut,ComBufIn:ComBuf;
   i:integer;
   str:string;
begin
   str:='';
   ComBufOut[2]:=HI(adrEPROM);
   ComBufOut[3]:=LO(adrEPROM);
   Com_Link_Command(Moto_ReadATEEPROM,ComBufOut,ComBufIn);
   for i:=1 to 8 do str:=str+Chr(ComBufIn[i]);
   LoadATEPROMString:=str;
end;

procedure xWriteATEPROMCheckSum;
Var
   n,k:integer;
   sum:word;
begin
   n:=Adr_CorrKdec_H;
   k:=238;
   sum:=0;
   repeat
    sum:=sum+DumpEPROM[n];
    inc(n);
   until n=k;
   DumpEPROM[k+1]:=Lo(sum);
   DumpEPROM[k]:=Hi(sum);
   WriteATEPROMByte(k,DumpEPROM[k]);
   WriteATEPROMByte(k+1,DumpEPROM[k+1]);
end;

procedure  WriteMOTORAM(adrRAM:word;dataRAM:byte);
var
   ComBufOut,ComBufIn:ComBuf;
begin
     ComBufOut[2]:=HI(adrRAM);
     ComBufOut[3]:=LO(adrRAM);
     ComBufOut[4]:=dataRAM;
     Com_Link_Command(Moto_WR_RAM,ComBufOut,ComBufIn);
end;


procedure ReadMOTORAM(adrRAM:word;var dataRAM: Byte);

begin
     Link_ProcBufOut[2]:=HI(adrRAM);
     Link_ProcBufOut[3]:=LO(adrRAM);
     Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
     dataRAM:=Link_ProcBufIn[1];
end;

procedure xWriteATEPROMini;
Var
   loop:integer;
begin
     xClrErrSSmot;
     for loop:=0 to 2047 do  begin
     WriteATEPROMByte(loop,InidataArray[loop]);
     if  (loop mod 64)=0 then
            Form2.ProgressBar1.Position:=Round(100*loop/2048);
     end;
     xWriteATEPROMCheckSum;
     Fl_ATEPROMini:=true;
end;

procedure xWriteATEPROM_B12;
Var
   loop:integer;
begin
  for loop:=0 to B12num do
  WriteATEPROMByte(B12addrArray[loop],B12dataArray[loop]);
  xWriteATEPROMCheckSum;
  Fl_ATEPROM_B12:=true;
end;

procedure xWriteATEPROM_clr;
Var
   i,Num_Err:integer;
begin
   Num_Err:=Adr_CorrKdec_H-1;
   for i:=0 to Num_Err do DumpEPROM[i]:=0;
   for i:=0 to Num_Err do WriteATEPROMByte(i,0);
 //  for i:=256 to 768 do WriteATEPROMByte(i,0);
end;

procedure xWriteATEPROM_con;
Var
   i:integer;
begin
   for i:=0 to connum+5 do DumpEPROM[addrArray[i]]:=dataArray[i];
   for i:=0 to connum+5 do WriteATEPROMByte(addrArray[i],dataArray[i]);
   xWriteATEPROMCheckSum;
   fl_change_comp:=true;
end;

procedure xWriteATEPROM_err;
begin
   WriteATEPROMByte(aEPROM,dEPROM);
   //WriteATEPROMByte(256+bEPROM,0);
   //WriteATEPROMByte(512+bEPROM,0);
end;

procedure xWriteATEPROM_dum;
Var
   i:integer;
begin
  for i:=0 to DumpNum-1 do
  WriteATEPROMByte(DaddrArray[i],DdataArray[i]);
  DumpForm.dumpStatBar.SimpleText := '';
end;

procedure TFormISO.ReadFPROT;
Var
  Loop, i:integer;
begin
     if Tip_Block >= 7 then
     begin
       // ReadCRC32STM
       Link_ProcBufOut[2]:=HI(AdrCRC32_MC3); // aдрес CRC_pgm_MC3 в DZ
       Link_ProcBufOut[3]:=LO(AdrCRC32_MC3);
       Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
       for Loop:=0 to 3 do
       begin
        abPGM_CRC_MC2[Loop]:= Link_ProcBufIn[Loop+5];
        abPGM_CRC_MC1[Loop]:= Link_ProcBufIn[Loop+1];
       end;
      end
     else
    begin
    Link_ProcBufOut[2]:=HI(adrFPROT);
    Link_ProcBufOut[3]:=LO(adrFPROT);
    Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
    FPROT:=Link_ProcBufIn[1];
  // чтение TRIM  из MCGTRM   NVFTRIM не читается ???
    Link_ProcBufOut[2]:=HI(adrMCGTRM);
    Link_ProcBufOut[3]:=LO(adrMCGTRM);
    Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
    TRIM:=Link_ProcBufIn[1];
    // ReadCRC32STM
    Link_ProcBufOut[2]:=HI(adrCRC32_MC3); // aдрес CRC_pgm_MC3 в DZ
    Link_ProcBufOut[3]:=LO(adrCRC32_MC3);
    Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
    for i:=0 to 3 do CRC_pgm_MC3[i]:= Link_ProcBufIn[i+1];
    // CRC_pgm_MC2
    Link_ProcBufOut[2]:=HI(adrTRIM_PA_ICS_C3-4); // -4 на адрес CRC_pgm_MC2 в DZ
    Link_ProcBufOut[3]:=LO(adrTRIM_PA_ICS_C3-4);
    Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
    for i:=0 to 3 do CRC_pgm_MC2[i]:= Link_ProcBufIn[i+1];
    TRIM_PA:=Link_ProcBufIn[5];
    V_PO_PA:=IntToStr(Link_ProcBufIn[6]);
    PA_ADC_PWR:=Link_ProcBufIn[7];
    end;
    Fl_ReadFPROT:= true;

end;

procedure TFormISO.Read_MDT_Var;
Var
  Loop:integer;
begin
   if Tip_Block >= 8 then
   begin
     Link_ProcBufOut[2]:=HI(AdrVarMDT_v8+VarMDT_Ptr); //
     Link_ProcBufOut[3]:=LO(AdrVarMDT_v8+VarMDT_Ptr);
     Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
     for Loop:=1 to 8 do
     VarMDT[Loop+VarMDT_Ptr*8]:= Link_ProcBufIn[Loop];
   end
   else
   begin
    Link_ProcBufOut[2]:=HI(adrTRIM_PA_ICS_C3-46+VarMDT_Ptr*8); // -46 на адрес Mod0_AV_On_Val в DZ
    Link_ProcBufOut[3]:=LO(adrTRIM_PA_ICS_C3-46+VarMDT_Ptr*8);
    Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
    for Loop:=1 to 8 do
    VarMDT[Loop+VarMDT_Ptr*8]:= Link_ProcBufIn[Loop];
   end;
   VarMDT_Ptr:=VarMDT_Ptr+1;
   if ((VarMDT_Ptr = 2) and (Tip_Block < 8)) then VarMDT_Ptr:=VarMDT_Ptr+1; //6ch
   if VarMDT_Ptr > 3 then VarMDT_Ptr:=0;

   Fl_VarMDT:= true;

end;

procedure xReadEPROM_FPROT;
Var
   i,Adr:integer;
begin
  //  Adr:= EEPROMSize-8;  // последний сектор
  //  ReadATEPROM(Adr);
  //  for i:=0 to 7 do  DumpEPROM[Adr+i]:= Link_ProcBufIn[i+1];
  //  Fl_EPROM_FPROT:=true;

    Link_ProcBufOut[2]:=HI(adrFPROT);
    Link_ProcBufOut[3]:=LO(adrFPROT);
    Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn);
    FPROT:=Link_ProcBufIn[1];
    Fl_EPROM_FPROT:=true;
end;
// 3FF adres 1023
procedure xWriteEPROM_FPROT;
Var
   data1,data2:byte;
begin
    if(Flash_Protected) then
    begin
       data1:=0;   // вся Flash защищена
       data2:=0;   // DZ 255T
    end
    else
    begin
       data1:=170;        // DZ 85T
       if Flash_UnProtected_All then
              // вся Flash незащищена
              data2:=55   // DZ 200T
       else
       begin
         if not Flash_UnProtected_CFG then
              // CFG  и Const незащищена
              data2:=105 // DZ 150T
         else
              // CFG незащищена
              data2:=155;// DZ 100T
       end;
    end;
    WriteATEPROMByte(EEPROMSize-1,data1);
    WriteATEPROMByte(EEPROMSize-2,data2);
    Fl_EPROM_FPROT:=true;
end;

procedure xErrorATLoad;
begin
    DumpATLoad(Adr_TimeErr_H,Adr_CorrKdec_H);
    Fl_ATTime:=true;
   //  DumpATLoad((256+ErrorAT_Num),(256+ErrorAT_Num+16));
   //  DumpATLoad((512+ErrorAT_Num),(512+ErrorAT_Num+16));
end;

procedure xDumpAT_EPROM;
begin
   DumpATLoad(0,EEPROMSize);
   Fl_DumpATLoad := True;
end;

procedure WriteMot_con;
Var
   TempWord:Word;
   i,S : integer;
begin
//затираем область настроек
        fl_change_Err:=false;
        if Tip_Block < 8 then
        begin
        Link_ProcBufOut[2]:=Hi(DumpMOTStart);
        Link_ProcBufOut[3]:=Lo(DumpMOTStart);
        Com_Link_Command(Moto_ClearFlashEEPROM,Link_ProcBufOut,Link_ProcBufIn);
             S:= SizeDumpMOT div 8;
        end
        else S:= DumpMOTEnd div 8;
//прошиваем область настроек
        TempWord:=DumpMOTStart;
 //       For i:=0 to (SizeDumpMOT) div 8 do
        For i:=0 to S do
        begin
                Link_ProcBufOut[2] :=Hi(TempWord);
                Link_ProcBufOut[3] :=Lo(TempWord);
                if (CFG_OffSet_Dump+0+i*8) >=0 then
                Link_ProcBufOut[4] :=DumpMOT[CFG_OffSet_Dump+0+i*8]
                else Link_ProcBufOut[4] := 0;
                Link_ProcBufOut[5] :=DumpMOT[CFG_OffSet_Dump+1+i*8];
                Link_ProcBufOut[6] :=DumpMOT[CFG_OffSet_Dump+2+i*8];
                Link_ProcBufOut[7] :=DumpMOT[CFG_OffSet_Dump+3+i*8];
                Link_ProcBufOut[8] :=DumpMOT[CFG_OffSet_Dump+4+i*8];
                Link_ProcBufOut[9] :=DumpMOT[CFG_OffSet_Dump+5+i*8];
                Link_ProcBufOut[10]:=DumpMOT[CFG_OffSet_Dump+6+i*8];
                Link_ProcBufOut[11]:=DumpMOT[CFG_OffSet_Dump+7+i*8];
                if not (Com_Link_Command(Moto_WriteFlashEEPROM,Link_ProcBufOut,Link_ProcBufIn))
                or ((Link_ProcBufIn[1] and $3F)<>Command_Buf) then
                begin
                    Form1.calibrSB.SimpleText:='Ошибка!!! Не могу записать конфигурацию!!!';
                    fl_change_mot:=false;
                    fl_change_Err:=true;
                    Exit;
                end;
                TempWord:=TempWord+8;
        end;
        if Tip_Block >= 8 then
        begin
        Link_ProcBufOut[2]:=$55;
        Link_ProcBufOut[3]:=$77;
        if not (Com_Link_Command(Moto_ClearFlashEEPROM,Link_ProcBufOut,Link_ProcBufIn))
           or ((Link_ProcBufIn[1] and $3F)<>Command_Buf) then
        begin
           Form1.calibrSB.SimpleText:='Ошибка!!! Не могу записать конфигурацию!!!';
           fl_change_mot:=false;
           fl_change_Err:=true;
           Exit;
        end;
        end;
end;

procedure xWriteMotEPROM_con;
Var
   TempSelectorMC:integer;
begin
       WriteMot_con;
       fl_change_comp:=True;
end;

procedure  xModCommand;
var
   ComBufOut,ComBufIn:ComBuf;
begin
     ComBufOut[2]:=ModCommand;
     Com_Link_Command(Moto_ModTest,ComBufOut,ComBufIn);
end;

procedure  xDSC_PulsPress;
var
   ComBufOut1,ComBufIn1:ComBuf;
begin
     ComBufOut1[2]:=DSCPulsPress_Com;
     Com_Link_Command(DSC_Puls_Press,ComBufOut1,ComBufIn1);
     DSCPulsPress_Com :=0;
end;

procedure  xSaveProtocol;
begin
 { WriteATEPROMString(DiagIni.ReadInteger('Param','Model',$400),FormProtocol.eModel.Text);
  WriteATEPROMString(DiagIni.ReadInteger('Param','VehNum',$410),FormProtocol.eVehNum.Text);
  WriteATEPROMString(DiagIni.ReadInteger('Param','DateSet',$420),FormProtocol.eDate.Text);
  WriteATEPROMString(DiagIni.ReadInteger('Param','PlaceSet',$428),FormProtocol.ePlace.Text);
  WriteATEPROMString(DiagIni.ReadInteger('Param','NumSS1',$430),FormProtocol.eNumSS1.Text);
  WriteATEPROMString(DiagIni.ReadInteger('Param','NumSS2',$438),FormProtocol.eNumSS2.Text);
  WriteATEPROMString(DiagIni.ReadInteger('Param','NumSS3',$440),FormProtocol.eNumSS3.Text);
  WriteATEPROMString(DiagIni.ReadInteger('Param','NumSS4',$448),FormProtocol.eNumSS4.Text);
  WriteATEPROMString(DiagIni.ReadInteger('Param','NumMD1',$450),FormProtocol.eNumMD1.Text);
  WriteATEPROMString(DiagIni.ReadInteger('Param','NumMD2',$458),FormProtocol.eNumMD2.Text);
  WriteATEPROMString(DiagIni.ReadInteger('Param','NumMD3',$460),FormProtocol.eNumMD3.Text);
  WriteATEPROMString(DiagIni.ReadInteger('Param','NumMD4',$468),FormProtocol.eNumMD4.Text);
  WriteATEPROMString(DiagIni.ReadInteger('Param','NumPK', $470),FormProtocol.eNumPK.Text);
  WriteATEPROMString(DiagIni.ReadInteger('Param','NumDIF',$478),FormProtocol.eNumDIF.Text);}
  ProtokolSave:=true;
end;

procedure xResetMCU;
begin
    Com_Link_Command(Moto_Reset,Link_ProcBufOut,Link_ProcBufIn);
end;

//procedure TFormISO.InitProgramm_Flash;
Procedure xInitProgramm_Flash;
begin
    InitProg_Ask:= false;
    PGM_Error_Ask:=false;
    Link_ProcBufOut[2]:=MCnum;
    Com_Link_Command(Init_Programm_Flash,Link_ProcBufOut,Link_ProcBufIn);
    if Link_ProcBufIn[1] <> Init_Programm_Flash then
    PGM_Error_Ask:=true;
    InitProg_Ask:= true;
end;

procedure TFormISO.PolyStopeed;
begin
    Com_Link_Command(Moto_StopSpeed,Link_ProcBufOut,Link_ProcBufIn);
end;

procedure TFormISO.SendPGMcnt;
begin
   comqueue.Push(xSendPGMcnt);
end;

procedure TFormISO.SendInhcnt;
begin
   comqueue.Push(xSendInhcnt);
end;

procedure TFormISO.InitProgramm_Flash;
begin
 //  comqueue.QPointer:=0;
   comqueue.Push(xInitProgramm_Flash);
end;

procedure TFormISO.ResetMCU;
begin
   comqueue.Push(xResetMCU);
end;

procedure TFormISO.EraseError_EPROM;
begin
   comqueue.Push(xEraseError_EPROM);
end;

procedure TFormISO.Erase_EEPROM;
begin
   comqueue.Push(xErase_EEPROM);
end;
procedure TFormISO.Write_EEPROM;
begin
   comqueue.Push(xWrite_EEPROM);
end;
procedure TFormISO.DownLoadOscAddress;
begin
   comqueue.Push(xDownLoadOscAddress);
end;
procedure TFormISO.LoadATTime;
begin
   comqueue.Push(xLoadATTime);
end;
procedure TFormISO.WriteATEPROMCheckSum;
begin
   comqueue.Push(xWriteATEPROMCheckSum);
end;
procedure TFormISO.ClrErrSSmot;
begin
   comqueue.Push(xClrErrSSmot);
end;
procedure TFormISO.WriteATEPROMini;
begin
   comqueue.Push(xWriteATEPROMini);
end;
procedure TFormISO.WriteATEPROM_B12;
begin
   comqueue.Push(xWriteATEPROM_B12);
end;
procedure TFormISO.WriteATEPROM_clr;
begin
   comqueue.Push(xWriteATEPROM_clr);
end;
procedure TFormISO.WriteATEPROM_con;
begin
   comqueue.Push(xWriteATEPROM_con);
end;
procedure TFormISO.WriteMotEPROM_con;
begin
   comqueue.Push(xWriteMotEPROM_con);
end;
procedure TFormISO.WriteATEPROM_err;
begin
   comqueue.Push(xWriteATEPROM_err);
end;
procedure TFormISO.WriteATEPROM_dum;
begin
   comqueue.Push(xWriteATEPROM_dum);
end;
procedure TFormISO.ReadEPROM_FPROT;
begin
   comqueue.Push(xReadEPROM_FPROT);
end;
procedure TFormISO.WriteEPROM_FPROT;
begin
   comqueue.Push(xWriteEPROM_FPROT);
end;
procedure TFormISO.DumpAT_EPROM;
begin
   comqueue.Push(xDumpAT_EPROM);
end;
procedure TFormISO.ErrorATLoad;
begin
   comqueue.Push(xErrorATLoad);
end;
procedure TFormISO.TestDIF_Kl;
begin
   comqueue.Push(xTestDIF_Kl);
end;
procedure TFormISO.TestLamp;
begin
   comqueue.Push(xTestLamp);
end;
{procedure TFormISO.MC1_TestLamp;
begin
   comqueue.Push(xMC1_TestLamp);
end;
procedure TFormISO.MC2_TestLamp;
begin
   comqueue.Push(xMC2_TestLamp);
end;}
procedure TFormISO.WriteWx_Presure;
begin
   comqueue.Push(xWriteWx_Presure);
end;

procedure TFormISO.ModCommand;
begin
   comqueue.Push(xModCommand);
end;

procedure TFormISO.DSC_PulsPress;
begin
   comqueue.Push(xDSC_PulsPress);
end;

procedure TFormISO.SaveProtocol;
begin
   comqueue.Push(xSaveProtocol);
end;

procedure TFormISO.Write_Security;
begin
   comqueue.Push(xWrite_Security);
end;

procedure TFormISO.DownLoadCANAddress;
begin
   comqueue.Push(xDownLoadCANAddress);
end;

procedure TFormISO.PWM_Send;
begin
   comqueue.Push(xPWMSend);
end;

procedure TFormISO.Stend_Selector;
begin
   comqueue.Push(xStend_Selector);
end;

procedure TFormISO.WriteTestVAR;
begin
    comqueue.Push(xWriteTestVAR);
end;

procedure TFormISO.RunawaySave;
begin
    comqueue.Push(xRunawaySave);
end;

procedure TFormISO.WriteVIN_DA;
begin
    comqueue.Push(xWriteVIN_DA);
end;

procedure xQueue_DefConfigLoad;
begin
     FormISO.ReadAllError;
   //  Form1.DefConfigLoad;
   //  Form1.DumpMOT_to_DumpMOTcopy;
   //  DumpATLoad(0,EEPROMSize);
   //  Fl_DefConfigLoad:=true;
end;

procedure TFormISO.Queue_DefConfigLoad;
begin
   comqueue.Push(xQueue_DefConfigLoad);
end;

end.
