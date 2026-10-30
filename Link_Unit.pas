unit Link_Unit;

interface
uses
  Windows,Dialogs,Classes,Sysutils;

const
        Com_Init_Char = 85;
        W_Busy = 1;
        Moto_ClearFlashEEPROM = $60;
        Moto_WriteFlashEEPROM = $61;
        Moto_ChangeMonAddress = $62;
        Moto_OscFrame = $63;
        Moto_QuitDiag = $64;
        Moto_StopSpeed = $65;
        Road_Emul_DSC = $66;
        Moto_DownloadSpeed = $67;
        Moto_SensorTest = $68;
        Moto_ModTest = $69;
        Moto_Reset = $6A;
        Moto_ReadATEEPROM = $6B;
        Moto_WriteATEEPROM = $6C;
        Moto_ReadActiveErrors = $6D;
        Programm_STM = $6E;
        Moto_RD_RAM = $6F;
        Moto_WR_RAM = $70;
        Moto_Security = $71;
        Moto_Ident = $72;
        Init_Programm_Flash = $73;
        Erase_Error_EPROM = $74;
        Read_Additive_Errors = $75;
        DSC_Puls_Press = $76;
        Bridge_CAN = $77;

        Erase_Programm_Flash = $F5;
        Write_Programm_Flash = $F1;
        Read_Programm_Flash = $F3;
        EndLoad_Programm_Flash = $F4;

        Programm_ROM = $AA;
        STM_ReSixrUart = $7E;
        STM_Programm_V8 = $AF;

type
        ComBuf = Array [1..256] of Byte;

procedure Com_Init;
procedure Com2_Init;
function  Com_InitBlock:Boolean;
function  Com_Link_Command(Command_Name:Byte; ArrayToSend:ComBuf;var ArrayToReceive:ComBuf):boolean;
procedure Com_Baudrate(Com_Baudrate:Integer);
procedure Com_Close;


var
        ComBufIn,ComBufOut,TestComBuf:ComBuf;
        DCB:tDCB;
        Stat:tCOMStat;
        hCOM:tHandle;
        ComTimeOut:tCommTimeOuts;
        Errors,Bytes:dWord;
        Flags:TComStateFlags;
        Com_Busy_F,Com_RealTime_F,Com_Connected_F:Boolean;
        Port_Num:Byte;
        Com_Result:Boolean;
implementation

uses Com_Thread,Screen_Thread,mainABSdiag;

procedure Com_Init;
begin
     hCOM:=CreateFile(PChar('COM'+IntToStr(Port_Num)),
                    Generic_Read or Generic_Write,
                    0,nil,
                    Open_Existing,
                    FILE_ATTRIBUTE_NORMAL,0);
     If hCOM=Invalid_Handle_Value then
     begin
          Form1.MainStatBar.Panels[0].Text := 'Не могу открыть порт';
          Form1.MainStatBar.Refresh;
          Fl_ComCreate:=false;
          hhhCOM:=0;
     end
     else
     begin
        Fl_ComCreate:=true;
        hhhCOM:=hCOM;
     end;
     Com_Busy_F:=False;
end;

procedure Com2_Init;
begin
     hCOM:=CreateFile(PChar('COM'+IntToStr(UpGrade_ComNum)),
                    Generic_Read or Generic_Write,
                    0,nil,
                    Open_Existing,
                    FILE_ATTRIBUTE_NORMAL,0);
     If hCOM=Invalid_Handle_Value then
     begin
          Form1.MainStatBar.Panels[0].Text := 'Не могу открыть порт COM2';
          Form1.MainStatBar.Refresh;
          Fl_ComCreate:=false;
          hhhCOM:=0;
     end
     else
     begin
        Fl_ComCreate:=true;
        hhhCOM:=hCOM;
     end;
     Com_Busy_F:=False;
end;

procedure Com_Close;
begin
     if Fl_ComCreate and (hhhCOM<>0) then
     begin
         CloseHandle(hhhCOM);
         Fl_ComCreate:=false;
     end;
end;

procedure Com_Baudrate(Com_Baudrate:Integer);
begin
     If hCOM=Invalid_Handle_Value then exit;
     ClearCommError(hCOM,Errors,@Stat);
     ReadFile(hCOM,ComBufIn,Stat.cbInQue,Bytes,nil);
     with DCB do begin
        BaudRate:=Com_Baudrate;
        ByteSize:=8;
        Parity:=0;
        StopBits:= OneStopBit;// TWOSTOPBITS; //

  //      Flags.fDtrControl := DTR_CONTROL_DISABLE;
{
 typedef struct _DCB {
  DWORD DCBlength;
  DWORD BaudRate;
  DWORD fBinary  :1;
  DWORD fParity  :1;
  DWORD fOutxCtsFlow  :1;
  DWORD fOutxDsrFlow  :1;
  DWORD fDtrControl  :2;
  DWORD fDsrSensitivity  :1;
  DWORD fTXContinueOnXoff  :1;
  DWORD fOutX  :1;
  DWORD fInX  :1;
  DWORD fErrorChar  :1;
  DWORD fNull  :1;
  DWORD fRtsControl  :2;
  DWORD fAbortOnError  :1;
  DWORD fDummy2  :17;
  WORD  wReserved;
  WORD  XonLim;
  WORD  XoffLim;
  BYTE  ByteSize;
  BYTE  Parity;
  BYTE  StopBits;
  char  XonChar;
  char  XoffChar;
  char  ErrorChar;
  char  EofChar;
  char  EvtChar;
  WORD  wReserved1;
}{ DCB, *LPDCB;
}
     end;
 //    ComTimeOut.WriteTotalTimeoutConstant:=1;
 //    ComTimeOut.WriteTotalTimeOutMultiplier:=1;
     ComTimeOut.ReadTotalTimeoutConstant:=50;
     ComTimeOut.ReadTotalTimeOutMultiplier:=5;
     SetCommTimeouts(hCOM,ComTimeOut);
     if not SetCommState(hCOM,DCB) then
 //    ShowMessage('Порт не настроен');
     begin
         Form1.MainStatBar.Panels[0].Text := 'Порт не настроен';
         Form1.MainStatBar.Refresh;
     end;
end;


function Com_Link_Command(Command_Name:Byte; ArrayToSend:ComBuf;var ArrayToReceive:ComBuf):boolean;
Label   W_Commands;
var     Loop:Integer;
        BytesToSend,BytesToReceive:Byte;
        HandShake:Boolean;
begin
     //   if (not(Com_Connected_F)) and (not(Form1.CheckBox332.Checked)) then Exit;
        if not(Com_Connected_F) then Exit;
        While Com_Busy_F do Sleep(1);
        Com_Busy_F:=True;
        HandShake:=False;
        if Tip_Block < 8  then
        begin
           case Command_Name of
                W_Busy: begin HandShake:=True; BytesToSend:=1; end;
                Moto_ClearFlashEEPROM: begin BytesToSend:=2;
                        BytesToReceive:=0; end;
                Moto_WriteFlashEEPROM: begin BytesToSend:=10;
                        BytesToReceive:=0; end;
                Moto_ChangeMonAddress: begin BytesToSend:=NumberOsc*2; //NumberOsc_New*2;
                        BytesToReceive:=0; end;
                Moto_OscFrame: begin BytesToSend:=0;
                        BytesToReceive:=NumberOsc; end; // 16; end;
                Moto_QuitDiag: begin BytesToSend:=0;
                        Com_Connected_F:=False;
                        BytesToReceive:=0; end;
                Moto_StopSpeed: begin BytesToSend:=0;
                        BytesToReceive:=0; end;
                Moto_SensorTest: begin BytesToSend:=0;
                        BytesToReceive:=8; end;
                Moto_ModTest: begin BytesToSend:=0;
                        BytesToReceive:=0; end;
                Moto_Reset: begin BytesToSend:=0;   //
                        BytesToReceive:=0; end;
                Moto_ReadATEEPROM: begin BytesToSend:=2;
                        BytesToReceive:=8; end;
                Moto_WriteATEEPROM: begin BytesToSend:=3;
                        BytesToReceive:=0; end;
                Moto_ReadActiveErrors: begin BytesToSend:=0;
                        BytesToReceive:=Number_Error_Old; end;
                Read_Additive_Errors: begin BytesToSend:=0;
                        BytesToReceive:=(Number_Error_New-Number_Error_Old); end;
                Road_Emul_DSC: begin BytesToSend:=13;
                        BytesToReceive:=5; end;
                Moto_DownloadSpeed: begin BytesToSend:=9;
                        BytesToReceive:=5; end;
                Moto_RD_RAM: begin BytesToSend:=2;
                        BytesToReceive:=8; end;
                Moto_WR_RAM: begin BytesToSend:=3;
                        BytesToReceive:=0; end;
                Moto_Security: begin BytesToSend:=8;
                        BytesToReceive:=0; end;
                Init_Programm_Flash: begin BytesToSend:=1;
                        BytesToReceive:=0; end;
                Programm_ROM: begin BytesToSend:=11;
                        BytesToReceive:=0; end;
                Programm_STM: begin BytesToSend:=SizePaketSTM+4; //36
                        BytesToReceive:=1; end;
//
                Erase_Programm_Flash: begin BytesToSend:=3;
                        BytesToReceive:=0; end;
                Write_Programm_Flash: begin BytesToSend:=BytesSend;
                        BytesToReceive:=0; end;
                Read_Programm_Flash: begin BytesToSend:=3;
                        BytesToReceive:=BytesReceive; end;
//

                Erase_Error_EPROM: begin BytesToSend:=2;
                                         BytesToReceive:=0; end;
                DSC_Puls_Press: begin BytesToSend:=1;
                                      BytesToReceive:=0; end;
                Bridge_CAN: begin BytesToSend:=12;
                                  BytesToReceive:=8; end;

           end;
        end
        else
        begin

          case Command_Name of
               Moto_OscFrame: begin //BytesToSend:=3;
                                    BytesToReceive:=NumberOsc; end; //
               Moto_StopSpeed: begin //BytesToSend:=0;
                                    BytesToReceive:=0; end;
               Moto_RD_RAM:   begin //BytesToSend:=3;
                                    BytesToReceive:=8; end;
               Moto_WR_RAM:   begin //BytesToSend:=3;
                                    BytesToReceive:=0; end;
               Moto_ModTest:  begin //BytesToSend:=3;
                                    BytesToReceive:=0; end;
               Moto_ReadATEEPROM: begin //BytesToSend:=3;
                                        BytesToReceive:=8; end;
               Moto_WriteATEEPROM: begin //BytesToSend:=3;
                                         BytesToReceive:=0; end;
               Moto_ReadActiveErrors: begin // BytesToSend:=3;
                        BytesToReceive:=Number_Error_Old; end;
               Read_Additive_Errors: begin //BytesToSend:=3;
                        BytesToReceive:=(Number_Error_New-Number_Error_Old); end;
               Erase_Error_EPROM:  begin //BytesToSend:=3;
                                   BytesToReceive:=0; end;
               Bridge_CAN: begin //BytesToSend:=12;
                                  BytesToReceive:=8; end;
               Init_Programm_Flash: begin //BytesToSend:=1;
                                    BytesToReceive:=0; end;
               Moto_ClearFlashEEPROM: begin //BytesToSend:=2;
                                    BytesToReceive:=0; end;
               Moto_WriteFlashEEPROM: begin //BytesToSend:=10;
                                    BytesToReceive:=0; end;
               Moto_DownloadSpeed: begin // BytesToSend:=9;
                                    BytesToReceive:=5; end;
               DSC_Puls_Press: begin //BytesToSend:=1;
                                    BytesToReceive:=0; end;
               Road_Emul_DSC: begin //BytesToSend:=13;
                                    BytesToReceive:=5; end;
          end;
          BytesToSend:= 13;
          if Command_Name = Programm_STM then
          begin BytesToSend:=SizePaketSTM+4; //36
                BytesToReceive:=1;
          end;
          if Command_Name = STM_Programm_V8 then
          begin BytesToSend:=SizePaketSTM+5; //37
                BytesToReceive:=1;
          end;
          if ((DIA_MC_Num = 2) and
          ((Command_Name = Moto_OscFrame) or
           (Command_Name = Moto_ModTest) or
           (Command_Name = Moto_RD_RAM) or
           (Command_Name = Moto_WR_RAM) or
           (Command_Name = DSC_Puls_Press)
           ))
          then Command_Name:=Command_Name or $80;
            //        ArrayToSend[15]:=Command_Name;
        end;
        ArrayToSend[1]:=Command_Name;
        Command_Buf:=ArrayToSend[1] and $3F;
        if HandShake then goto W_Commands;
     WriteFile(hCom,ArrayToSend,BytesToSend+2,Bytes,nil);
        for loop:=1 to 100 do TestComBuf[loop]:=$ff;
     ReadFile(hCom,TestComBuf,BytesToSend+3+BytesToReceive,Bytes,nil);
        if Bytes<>(BytesToSend+3+BytesToReceive) then
        begin
                Result:=False;
                if (not fl_FlashProg)
                    and (not Fl_ProgDZ)
                    and (not Fl_ProgPA)
                //    and (not AGS_Make_PGM)
                    and (not Fl2_ProgSTM) then
                begin
                // Com_Close;   // вызывается в Form1.BtnStopClick(nil)
                // если убрано работает отладчик Delphi!!!
                Com_Connected_F:=False;
                Form1.Timer1.Interval:=1100;//1200;
                Com_Result:=False;
                Com_Busy_F:=False;
                Com_Connected_F:=False;
                if ComAdapter <> 2 then RepeatIni_F:=false
                else  RepeatIni_F:=True;
                Form1.BtnStopClick(nil); 
                end;
        end
        else
        begin
                Result:=True;
                Com_Result:=True;
                RepeatIni_F:=False;
        end;

        for Loop:=1 to BytesToReceive+1 do
        ArrayToReceive[Loop]:=TestComBuf[BytesToSend+2+Loop];
        Com_Busy_F:=False;
        exit;
W_Commands:
        For Loop:=1 to BytesToSend do
        begin
                WriteFile(hCOM,ArrayToSend[Loop],1,Bytes,nil);
                ReadFile(hCOM,TestComBuf,2,Bytes,nil);
                if Bytes<>2 then
                        begin
                                Result:=False;
                                Break;
                        end;
                Result:=True;
                ArrayToReceive[Loop]:=TestComBuf[2];
        end;
        if Result then
        begin
                TestComBuf[1]:=$80;
                WriteFile(hCOM,TestComBuf,1,Bytes,nil);
                ReadFile(hCOM,TestComBuf,1,Bytes,nil);
        end;
        Com_Busy_F:=False;
end;

procedure PreciseDelay(StartTime, Interval: Int64; Freq: Int64);
var
  NowTime: Int64;
begin
  repeat
    QueryPerformanceCounter(NowTime);
    // Optional: yield CPU a bit
    Sleep(0);
  until (NowTime - StartTime) >= Interval;
end;

procedure Send5Baud(code: Byte);
var
  i: Integer;
  Freq, StartTime, NextTime, BitInterval: Int64;
begin
  QueryPerformanceFrequency(Freq);

  // 200 ms in timer ticks
  BitInterval := (Freq * 200) div 1000;

  QueryPerformanceCounter(StartTime);
  NextTime := StartTime;

  // Start bit
  EscapeCommFunction(hCOM, SETBREAK);
  NextTime := NextTime + BitInterval;
  PreciseDelay(StartTime, NextTime - StartTime, Freq);

  // Data bits
	for i := 0 to 7 do
  begin
    if ((code shr i) and 1) = 1
    then  EscapeCommFunction(hCOM, CLRBREAK)
    else  EscapeCommFunction(hCOM, SETBREAK);

    NextTime := NextTime + BitInterval;
    PreciseDelay(StartTime, NextTime - StartTime, Freq);
  end;

  // Stop bit
        EscapeCommFunction(hCOM, CLRBREAK);
  NextTime := NextTime + BitInterval;
  PreciseDelay(StartTime, NextTime - StartTime, Freq);

	PurgeComm(hCOM, PURGE_TXABORT or PURGE_RXABORT or PURGE_TXCLEAR or PURGE_RXCLEAR);
end;

function Com_InitBlock;
Var code:Byte;
    r:LongBool;
begin
   Result:=False;
   if ComAdapter = 1 then
   begin
        Com_Connected_F:=False;
        Result:=False;
        Com_Busy_F:=False;
        Com_RealTime_F:=False;
        Com_Baudrate(5); //Установка 5 бод
        TestComBuf[1]:=DiagIni.ReadInteger('Init','codinit',0);//Com_Init_Char;
        WriteFile(hCOM,TestComBuf,1,Bytes,nil);
        sleep(2500);
        Com_Baudrate(ComBaudrate);
        TestComBuf[1]:=Moto_Ident;
        TestComBuf[2]:=2;
        WriteFile(hCOM,TestComBuf,2,Bytes,nil);
        ReadFile(hCOM,ComBufIn,6,Bytes,nil);
        If Bytes=0 then  Cabel_F:=False else  Cabel_F:=True;
        If Bytes=6 then begin          // XP
                KeyByte1:=ComBufIn[4];
                KeyByte2:=ComBufIn[5];
                KeyByte3:=ComBufIn[6];
                Com_Connected_F:=True;
                Result:=True;
                end
                else
        If Bytes=5 then
                begin          // 98
                KeyByte1:=ComBufIn[3];
                KeyByte2:=ComBufIn[4];
                KeyByte3:=ComBufIn[5];
                Com_Connected_F:=True;
                Result:=True;
                end
                else
                begin
                KeyByte1:=0;
                KeyByte2:=0;
                KeyByte3:=0;
                Result:=False;
                end;
   end;
   if ComAdapter = 2 then
   begin
        Com_Connected_F:=False;
        Result:=False;
        Com_Busy_F:=False;
        Com_RealTime_F:=False;
        Com_Baudrate(ComBaudrate);
        code := DiagIni.ReadInteger('Init','codinit',0);
        if Form1.CheckBox340.Checked then code := 42;
        Send5Baud(code);
        Sleep(200);
        TestComBuf[1]:=Moto_Ident;
        TestComBuf[2]:=2;
        WriteFile(hCOM,TestComBuf,2,Bytes,nil);
        Sleep(10);
        ReadFile(hCOM,ComBufIn,5,Bytes,nil);
        if Bytes = 5 then
            begin
                KeyByte1:=ComBufIn[3];  //KeyByte1=85
                KeyByte2:=ComBufIn[4];  //KeyByte2=151
                KeyByte3:=ComBufIn[5];  //KeyByte3=17
                 Plata_SKU_DUE:=False;
                if (KeyByte2 = KeyIni2v8) and
                   (KeyByte3 = KeyIni3v8)
                then Tip_Block:=8
                else
                begin
                if (KeyByte2 = KeyIni2v9) and
                   (KeyByte3 = KeyIni3v9)
                then Tip_Block:=9
                else
                if (KeyByte2 = KeyIni2v10) and
                   (KeyByte3 = KeyIni3v10)
                then Tip_Block:=10
                else
                begin
                  if (KeyByte2 = 70) and
                     (KeyByte3 = 24)
                  then begin
                    Tip_Block:=8;
                    Plata_SKU_DUE:=True;
                  end
                  else Tip_Block:=6;
                end;
                end;
                Com_Connected_F:=True;
                Result:=True;
                Fl_ResetMCU:=True;
            end
        else
            begin
                KeyByte1:=0;
                KeyByte2:=0;
                KeyByte3:=0;
                Result:=False;
            end;
   end;

   if ComAdapter = 3 then
   begin
        Com_Connected_F:=False;
        Result:=False;
        Com_Busy_F:=False;
        Com_RealTime_F:=False;
        Com_Baudrate(ComBaudrate);
        code := DiagIni.ReadInteger('Init','codinit',0);
  //      Send5Baud(code);
  //      Sleep(100);
  //    Sleep(2500);
        TestComBuf[1]:=code; //10
        TestComBuf[2]:=Moto_Ident; //$72;
        TestComBuf[3]:=3;
        TestComBuf[4]:=4;
        WriteFile(hCOM,TestComBuf,4,Bytes,nil);
        Sleep(1);
        ReadFile(hCOM,ComBufIn,15,Bytes,nil);

        if Bytes = 5 then
        begin
          KeyByte1:=ComBufIn[3];
          KeyByte2:=ComBufIn[4];
          KeyByte3:=ComBufIn[5];
          Com_Connected_F:=True;
          Result:=True;
          Fl_ResetMCU:=True;
        end
        else
        begin
                KeyByte1:=0;
                KeyByte2:=0;
                KeyByte3:=0;
                Result:=False;
        end;
   end;

end;

end.


