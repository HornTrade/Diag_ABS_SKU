unit Com_Thread;

interface

uses
  Classes,Sysutils,Windows,Link_Unit,Link_Processor,RoadTest,UnitPCB;

const
        BusyInterval = 50000;   //в микросекундах;

type
  ComThread = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  end;

var     ThreadCounter,Loop:Integer;
        TimerFreq_Value,StartTimer_Value:Int64;
        ComOut,ComIn:ComBuf;
        T1:TThread;

implementation

uses mainABSdiag;
{ ComThread }



procedure ComThread.Execute;
begin
  
   repeat
   if comqueue.QPointer > 0 then
   comqueue.Pop; //Выполняем команду из очереди
 {  if ProtokolMake then begin
        CompStend:=true;
        Sleep(1); }
   case Form1.PageControl1.ActivePage.PageIndex of
     0:begin
 {      Synchronize(FormISO.ReadFPROT);
       Sleep(20);
       Synchronize(FormISO.ReadVDCTestVAR);
       Sleep(20); }
       Synchronize(FormISO.RunawayLoad);
       Sleep(20);
       Synchronize(FormISO.LampOscRead);
       Sleep(20);
       Synchronize(FormISO.ReadCANVAR2);
       Sleep(20);
     end;
     1: begin
        Synchronize(FormISO.ReadAllError);
        Sleep(10);
        Synchronize(FormISO.ReadAddError);
        Sleep(20);
        Synchronize(FormISO.LampOscRead);
        Sleep(50);
     end;
     //полигон
     2: if Tip_Block < 8  then begin
        begin
        if not PolyProgress then begin
          FormISO.PolyStopeed;
          Sleep(100);
        end else
        begin
   //       T1.Priority:=tpTimeCritical;
          FormISO.SendSpeed;
          Sleep(0);
        end;
        end;
     end;
     3: begin
          T1.Priority:=tpNormal;
          if RoadTest_Flag then
           begin
           FormISO.RoadTest_Slide;
           Sleep(0);
           end
          else
          if RoadEmul_Flag then
          begin
            T1.Priority:=tpTimeCritical;
            Case Form1.TipEmul.ItemIndex of
              0: FormISO.SendSpeed; //   ABS
              1: FormISO.SendDSC;   //   DSC
            end;
            Sleep(0);
          end
          else
          if PWM_Emul_Flag then
           begin
            FormISO.PWMSend;
            SinxrEmul:=true;
            Sleep(0);
           end
          else begin
           T1.Priority:=tpNormal;
      //     T1.Priority:=tpLowest;
           QueryPerformanceCounter(StartTimer_Value);
           QueryPerformanceFrequency(TimerFreq_Value);
           Synchronize(FormISO.ReadAllError); //ReadNOP;;
           Sleep(20);
           Synchronize(FormISO.ReadAddError);
           Sleep(20);
           FormISO.PolyStopeed;
           Sleep(20);
           Synchronize(FormISO.LampOscRead);
           Sleep(20);
           Synchronize(FormISO.ReadVDCTestVAR);
           Sleep(20);
           end;
     end;
     // test
     4: begin
        case Form1.PageControl3.ActivePageIndex of
         0:begin
           Synchronize(FormISO.ReadAllError);
           Sleep(50);
           Synchronize(FormISO.ReadAddError);
           Sleep(50);
    //       Synchronize(FormISO.LoadATModCNT);
    //       Sleep(30);
           Synchronize(FormISO.LampOscRead);
           Sleep(20);
           end;
         1:begin
           FormISO.SenOscRead;
           Sleep(0);
           end;
         2:begin
           Synchronize(FormISO.LampOscRead);
           Sleep(20);
           Synchronize(FormISO.ReadCANVAR2);
           Sleep(50);
    //       Synchronize(FormISO.ReadVDCTestVAR);
    //       Sleep(30);
           end;
         3:begin
           if fl_PWM_Prop  then
           begin
             if fl_PWM_Sinxr then
             begin
               FormISO.PWMSend;
               fl_PWM_Sinxr:=false;
             end
             else FormISO.RoadTest_Slide;
             Sleep(0);
           end
           else
           begin
      //     Synchronize(FormISO.Read_PcbTest);
      //     Sleep(20);
           end;
           end;
         4:begin
            if RoadTest_Flag then
           begin
           //T1.Priority:=tpTimeCritical;
           T1.Priority:=tpNormal;
           FormISO.RoadTest_Slide;
           Sleep(0);
           end
           else begin
           T1.Priority:=tpNormal;
           QueryPerformanceCounter(StartTimer_Value);
           QueryPerformanceFrequency(TimerFreq_Value);
           ReadNOP;
           Sleep(100);
           end;
           end;

         5:begin  //калибровка DSC датчиков
           Synchronize(FormISO.ReadAGS);
           Sleep(15);
           Synchronize(FormISO.LampOscRead);
           Sleep(15);
           Synchronize(FormISO.ReadEBS22);
           Sleep(15);
           Synchronize(FormISO.ReadVDCTestVAR);
           Sleep(15);
           Synchronize(FormISO.ReadCANVAR);
           Sleep(15);
           Synchronize(FormISO.ReadCANVAR2);
           Sleep(15);
           Synchronize(FormISO.ReadCAN_TCO);
           Sleep(10);
           end;
         6:begin  //Тахограф (TCO)
           Synchronize(FormISO.ReadCAN_TCO);
           Sleep(20);
           Synchronize(FormISO.ReadCANVAR2);
           Sleep(20);
           Synchronize(FormISO.ReadVDCTestVAR);
           Sleep(20);
           Synchronize(FormISO.ReadEBS22);
           Sleep(20);
           Synchronize(FormISO.LampOscRead);
           Sleep(20);
           end;
          7:begin  //EBL
           Synchronize(FormISO.ReadCAN_TCO);
           Sleep(20);
           Synchronize(FormISO.ReadCANVAR2);
           Sleep(20);
           Synchronize(FormISO.ReadVDCTestVAR); //
           Sleep(20);
           Synchronize(FormISO.ReadEBS22);
           Sleep(20);
           Synchronize(FormISO.LampOscRead);
           Sleep(20);
           end;
       end;
     end;
     5: begin
        if (Form1.Button10.Caption='Running') and
           (not Form1.Panel8.Visible) then
           begin
     //      T1.Priority:=tpTimeCritical;
           FormISO.OscRead;
           Sleep(0);
         end else begin
           T1.Priority:=tpNormal;
           Synchronize(FormISO.ReadAllError);
           Sleep(1);
           Synchronize(FormISO.ReadAddError);
           Sleep(80);
           Synchronize(FormISO.LampOscRead);
           Sleep(20);
         end;
     end;
     
     6: begin  //EEPROM
         if not Fl_ProgROM then
         begin
           Synchronize(FormISO.ReadAllError);
           Sleep(1);
           Synchronize(FormISO.ReadAddError);
           Sleep(80);
           Synchronize(FormISO.LampOscRead);
           Sleep(20);
         end
         else
         begin
           if not Fl_ProgS19  then
           begin
             Synchronize(FormISO.SendPGM);
             Sleep(100);
           end
           else
            Sleep(0);
         end;
     end;

     7: begin  //настройка
        if Fl_ComThread then
        begin
         if not Fl_ProgROM then
         begin
           Synchronize(FormISO.Read_MDT_Var);
           Sleep(15);
           Synchronize(FormISO.ReadAllError);
           Sleep(15);
           Synchronize(FormISO.ReadAddError);
           Sleep(15);
           Synchronize(FormISO.ReadAGS);
           Sleep(15);
           Synchronize(FormISO.ReadVDCTestVAR);
           Sleep(15);
           Synchronize(FormISO.LampOscRead);
           Sleep(15);
         end
         else
         begin
           if not Fl_ProgS19  then
           begin
             Synchronize(FormISO.SendPGM);
             Sleep(100);
           end
           else
           Sleep(0);
         end;
       end
       else Sleep(0);
     end;
     8: begin  //Programmer STM
     //GZ    if not Fl_ProgStart then
         begin
        //    if not Fl_ProgSTM and  not Fl_ProgROM then
            if Fl_ComThread then
            begin
             Synchronize(FormISO.ReadFPROT);
             Sleep(100);
             ClrErr_Cnt:=ClrErr_Cnt+1;
            end
            else Sleep(0);
         end;

     end;
   end; //case
      if((Form1.PageControl1.ActivePage.PageIndex <> 2) and  // полигон
         (Form1.PageControl1.ActivePage.PageIndex <> 3) and  // RoadTest
         (Form1.PageControl3.ActivePage.PageIndex <> 1) and    // Test & SenOscRead;
         (Form1.PageControl3.ActivePage.PageIndex <> 4) and // Test & CAN;
         (Form1.PageControl1.ActivePage.PageIndex <> 5) and  // Running
         (Form1.PageControl1.ActivePage.PageIndex <> 6) and  // EEPROM;
         //(Form1.PageControl5.ActivePage.PageIndex <> 6) and // AGS
         not UpGrade_InPro  and
         (Form1.PageControl1.ActivePage.PageIndex <> 8))     //Programmer
   then
   begin
       Synchronize(FormISO.Read_PcbTest);
       Sleep(2);
       Synchronize(FormISO.SenOscRead);
       Sleep(2);
       Synchronize(FormISO.Read_MDT_Var);
       Sleep(2);
       Synchronize(FormISO.ReadFPROT);
       Sleep(2);
       Synchronize(FormISO.CANRead); //ADCData
       Sleep(2);
       Synchronize(FormISO.ReadVDCTestVAR);
       Sleep(2);
       Pcb_Test_Cnt2:=Pcb_Test_Cnt1+2;
   end;

   until Terminated or not Com_Connected_F;
   T1.Destroy;
   //T1.FreeOnTerminate;
end;

end.
