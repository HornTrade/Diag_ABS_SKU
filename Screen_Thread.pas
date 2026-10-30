unit Screen_Thread;

interface

uses    Classes,Windows,Graphics,SysUtils;

type
  ScreenRefreshThread = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  end;

var
        T2:TThread;




implementation

uses Link_Unit,Link_Processor,mainABSdiag,RoadTest,Poly_Unit,Stend, UnitPCB;

{ Important: Methods and properties of objects in VCL can only be used in a
  method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure Screen_Refresh.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ Screen_Refresh }

procedure ScreenRefreshThread.Execute;
begin
  repeat

   while not Com_Connected_F do
   begin
      while TruckSim_Flag do
      begin
         //   if  not SinxrEmul then Sleep(0)
         //   else
            begin
              Form1.RoadTestEmul;
              FormISO.Emul_TruckSim;
            end;
      end;
      Sleep(100);
   end;
   
   if ProtokolMake then
   begin
    //    Synchronize(FormStend.StendShow);
        Sleep(100);
   end
   else
   case Form1.PageControl1.ActivePage.PageIndex of
     0: begin
        Synchronize(Form1.ViewInfo);
        Sleep(50);
        Synchronize(Form1.PGM_Osc);
        Sleep(50);
        Synchronize(Form1.LampOsc);
        Sleep(50);
        Synchronize(Form1.PCB_Test);
        Sleep(50);
      end;
     1: begin
        Synchronize(Form1.ViewError);
        Sleep(50);
        Synchronize(Form1.LampOsc);
        Sleep(50);
        Synchronize(Form1.PCB_Test);
        Sleep(50);
     end;
//полигон
     2: begin
        case PolyPhase of
        0: Sleep(100);
        1: begin
           if  not SinxrPoly then Sleep(10)
           else PolygonAcceleration;
        end;
        2: begin
           if  not SinxrPoly then Sleep(0)
           else    PolygonBreak;
        end;
        3: begin
           if  not SinxrPoly then Sleep(0)
           else PolygonStop;
        end;
        4: begin
  //       T2.Priority:=tpTimeCritical;
         PolySBRedraw;
         ChartRedraw;   //вывод графика
         if not Poly_Abort_F then PolyPhase:=0
                             else PolyPhase:=5;
         T2.Priority:=tpNormal;
         end;
        5: begin
           if  not SinxrPoly then Sleep(0)
           else PolygonAbort;
         end;
       end;
     end;
     3: begin
          while RoadTest_Flag do
           begin
           Synchronize(Form1.DrawRoadTimer);
           Sleep(100);
           end;
          while RoadEmul_Flag do
          begin
            if  not SinxrEmul then Sleep(0)
            else
            begin
             if not EmulAccel then  Form1.RoadTestEmul
                              else  Form1.RoadAccelEmul;
            end;
          end;
          while PWM_Emul_Flag do
          begin
           if  not SinxrEmul then Sleep(1)
           else  begin
              Form1.PWMTestEmul; Sleep(1)
              end;
           Sleep(1);
          end;

          if ((not RoadTest_Flag) and
             (not RoadEmul_Flag))// and
            // (not PWM_Emul_Flag)
          then
          begin
               Synchronize(Form1.VDCTestVAROsc);
               Sleep(50);
               Synchronize(Form1.LampOsc);
               Sleep(50);
               Synchronize(Form1.PCB_Test);
               Sleep(50);
          end;
     end;
     4: begin    //test
        case Form1.PageControl3.ActivePageIndex of
         0:begin
           Synchronize(Form1.ViewCNT);
           Sleep(50);
           Synchronize(Form1.LampOsc);
           Sleep(50);
           Synchronize(Form1.PCB_Test);
           Sleep(50);
           end;
         1:begin
           Synchronize(Form1.SensOsc);
           Sleep(1);
           end;
         2:begin //Body Controller
           Synchronize(Form1.LampOsc);
           Sleep(50);
           Synchronize(Form1.CAN_TCO_Osc);
           Sleep(50);
           Synchronize(Form1.VDCTestVAROsc);
           Sleep(50);
           Synchronize(Form1.PCB_Test);
           Sleep(50);
           end;
         3:begin
     //      Synchronize(Form1.PCB_Test);
           if fl_PWM_Prop  then
           begin
           if not fl_PWM_Direct  then
           begin
           if Cnt_Test_PWM > (StrToInt(Form1.Edit40.Text)) then
           begin
           //fl_PWM_Sinxr:=true;
           Cnt_Test_PWM:=0;
           //sleep(StrToInt(Form1.Edit40.Text));
           Form1.TrackBar1.Position:=Form1.TrackBar1.Position +StrToInt(Form1.Edit42.Text);
           if Form1.TrackBar1.Position >= StrToInt(Form1.Edit41.Text)
           then fl_PWM_Direct := true;
           end
           else Cnt_Test_PWM:=Cnt_Test_PWM+1;
           end
           else
           begin
           if Cnt_Test_PWM > (StrToInt(Form1.Edit40.Text)) then
           begin
           //fl_PWM_Sinxr:=true;
            Cnt_Test_PWM:=0;
           //sleep(StrToInt(Form1.Edit40.Text));
            Form1.TrackBar1.Position:=Form1.TrackBar1.Position - StrToInt(Form1.Edit42.Text);
            if Form1.TrackBar1.Position <= StrToInt(Form1.Edit43.Text) then fl_PWM_Direct := false;
           end
           else Cnt_Test_PWM:=Cnt_Test_PWM+1;
           end;
           Sleep(10);
           end
           else
           begin
              Synchronize(Form1.PCB_Test);
              Sleep(50);
           end;
           end;
         4:begin
           if RoadTest_Flag then
           begin
           Synchronize(Form1.CANOsc);
           Sleep(1);
           end
           else
           Sleep(20);
           end;
         5:begin   //калибровка DSC датчиков
           Synchronize(Form1.AGSOsc);
           Sleep(20);
           Synchronize(Form1.VDCTestVAROsc);
           Sleep(20);
           Synchronize(Form1.CANVAROsc);
           Sleep(20);
           Synchronize(Form1.CANfindOsc);
           Sleep(20);
           Synchronize(Form1.CAN_TCO_Osc);
           Sleep(20);
           Synchronize(Form1.LampOsc);
           Sleep(20);
           Synchronize(Form1.PCB_Test);
           Sleep(20);
           end;
          6:begin  //Тахограф (TCO)
           Synchronize(Form1.TrailerOsc);
           Sleep(20);
           Synchronize(Form1.CAN_TCO_Osc);
           Sleep(20);
           Synchronize(Form1.VDCTestVAROsc);
           Sleep(20);
           Synchronize(Form1.CANfindOsc);
           Sleep(20);
           Synchronize(Form1.LampOsc);
           Sleep(20);
           Synchronize(Form1.PCB_Test);
           Sleep(20);
           end;
          7:begin  //EBL
           Synchronize(Form1.TrailerOsc);
           Sleep(20);
           Synchronize(Form1.CAN_TCO_Osc);
           Sleep(20);
           Synchronize(Form1.VDCTestVAROsc); //
           Sleep(20);
           Synchronize(Form1.CANfindOsc);
           Sleep(20);
           Synchronize(Form1.LampOsc);
           Sleep(20);
           Synchronize(Form1.PCB_Test);
           Sleep(20);
           end;
        end;
     end;
     5: begin
          if (Form1.Button10.Caption='Running') and
           (not Form1.Panel8.Visible) then  begin
          T2.Priority:=tpNormal;//tpLowest;//tpNormal;
          Synchronize(Form1.Osc);
          Sleep(1);
          end  else  begin
          T2.Priority:=tpLowest;//tpNormal;
          Sleep(100);
          end;
     end;
     6: begin  //EEPROM
           Synchronize(Form1.PCB_Test);
           Sleep(100);
     end;
     7: begin  //настройка
           Synchronize(Form1.ViewAGS);
           Sleep(30);
           Synchronize(Form1.ViewSAS);
           Sleep(30);
           Synchronize(Form1.ConfigOsc);
           Sleep(30);
           Synchronize(Form1.LampOsc);
           Sleep(30);
           Synchronize(Form1.PCB_Test);
           Sleep(20);
        end;
     8: begin  //Programmer
         if not Fl_ProgStart then
         begin
           if not Fl_ProgSTM then
           begin
             Synchronize(Form1.PGM_Osc);
             Sleep(100);
           end;
         end;
     end;
   end;
  until   Terminated or not Com_Connected_F;
end;






end.
