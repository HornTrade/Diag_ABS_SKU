unit Unit8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TTestDSC = class(TForm)
    Button5: TButton;
    GroupBox1: TGroupBox;
    GroupBox67: TGroupBox;
    Button7: TButton;
    GroupBox68: TGroupBox;
    Button8: TButton;
    GroupBox2: TGroupBox;
    GroupBox70: TGroupBox;
    Button10: TButton;
    GroupBox71: TGroupBox;
    Button9: TButton;
    GroupBox3: TGroupBox;
    Button1: TButton;
    Label255: TLabel;
    Button2: TButton;
    Label256: TLabel;
    Button3: TButton;
    Label257: TLabel;
    Button4: TButton;
    Label258: TLabel;
    Button6: TButton;
    Label1: TLabel;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    Button11: TButton;
    GroupBox6: TGroupBox;
    Button12: TButton;
    GroupBox7: TGroupBox;
    Button13: TButton;
    Label369: TLabel;
    TrackBar2: TTrackBar;
    Label367: TLabel;
    Label370: TLabel;
    GroupBox8: TGroupBox;
    Button14: TButton;
    GroupBox9: TGroupBox;
    Button15: TButton;
    GroupBox10: TGroupBox;
    Button16: TButton;
    GroupBox11: TGroupBox;
    Button17: TButton;
    GroupBox12: TGroupBox;
    Button18: TButton;
    GroupBox13: TGroupBox;
    Button19: TButton;
    grp1: TGroupBox;
    ButtonXBR: TButton;
    GroupBox14: TGroupBox;
    Prop: TButton;
    procedure Button1Click(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TestDSC: TTestDSC;

implementation
uses Link_Unit,mainABSdiag, Link_Processor;

{$R *.dfm}

procedure TTestDSC.Button1Click(Sender: TObject);
begin
        if Not(Com_Connected_F) then Exit;
        if (Sender as TButton).Name='Button1' then DSCPulsPress_Com:=1;
        if (Sender as TButton).Name='Button2' then DSCPulsPress_Com:=2;
        if (Sender as TButton).Name='Button3' then DSCPulsPress_Com:=3;
        if (Sender as TButton).Name='Button4' then DSCPulsPress_Com:=4;
        if (Sender as TButton).Name='Button6' then DSCPulsPress_Com:=7;
        if (Sender as TButton).Name='Button5' then Form1.VDC_Test_Reset; // Сброс
        // Test Dif_Valve
        if DSCPulsPress_Com = 0 then
        begin  // не было команд Puls
         if ((Sender as TButton).Name='Button14')
         then
         begin
           if Fl_MOD_test_ON then Fl_MOD_test_ON:= false
                             else begin
                                  Fl_MOD_test_ON:= true;
                                  Form1.Timer2.Enabled:= true;
                                  Form1.Timer2.Interval:=6000;
                                  end;
         end;
         if ((Sender as TButton).Name='Button15')
         then
         begin
           if Fl_PnevmoTest_ON then Fl_PnevmoTest_ON:= false
                             else begin
                                  Fl_PnevmoTest_ON:= true;
                                  Form1.Timer2.Enabled:= true;
                                  Form1.Timer2.Interval:=6000;
                                  end;
         end;

         if ((Sender as TButton).Name='Button16')
         then
         begin
           if Fl_BreakFront_ON then
                                begin
                                     Fl_BreakFront_ON:= false;
                                     clrFl_BreakFront_ON:= true;
                                end
                                else Fl_BreakFront_ON:= true;
         end;
         if ((Sender as TButton).Name='Button17')
         then
         begin
           if Fl_BreakRear_ON then
                                begin
                                     Fl_BreakRear_ON:= false;
                                     clrFl_BreakRear_ON:= true;
                                end
                                else Fl_BreakRear_ON:= true;
         end;
         if ((Sender as TButton).Name='Button18')
         then
         begin
           if Fl_HillHolder_ON then Fl_HillHolder_ON:= false
                             else begin
                                  Fl_HillHolder_ON:= true;
                                  Form1.Timer2.Enabled:= true;
                                  Form1.Timer2.Interval:=6000;
                                  end;
         end;
         if ((Sender as TButton).Name='Button19')
         then
         begin
           if Fl_HaltBrake_ON then begin
                                     Fl_HaltBrake_ON:= false;
                                     clrFl_HaltBrake_ON:= true;
                                   end
                             else Fl_HaltBrake_ON:= true;
         end;
         if ((Sender as TButton).Name='ButtonXBR')
         then
         begin
           if Fl_XBR_ON then
           begin
              Fl_XBR_ON:= false;
              clrFl_XBR_ON:= true;
           end
           else Fl_XBR_ON:= true;
         end;
         if ((Sender as TButton).Name='Button11') and
            (Form1.Button53.Caption = 'Выключен') then
         begin
           Fl_DifRear_ON:= false;
           Fl_DifTrailer_ON:= false;
           if Fl_DifFront_ON then Fl_DifFront_ON:= false
                             else begin
                                  Fl_DifFront_ON:= true;
                                  Fl_DifXX:= true;
                                  end;
         end;
         if ((Sender as TButton).Name='Button12') and
            (Form1.Button52.Caption = 'Выключен') then
         begin
           Fl_DifFront_ON:= false;
           Fl_DifTrailer_ON:= false;
           if Fl_DifRear_ON  then Fl_DifRear_ON:= false
                             else begin
                                  Fl_DifRear_ON:= true;
                                  Fl_DifXX:= true;
                                  end;
         end;
         if ((Sender as TButton).Name='Button13') and
            (Form1.Button59.Caption = 'Выключен') then
         begin
           Fl_DifFront_ON:= false;
           Fl_DifRear_ON:= false;
           if Fl_DifTrailer_ON  then
                 Fl_DifTrailer_ON:= false
           else
           begin
                 Fl_DifTrailer_ON:= true;
                 Fl_DifXX:= true;
           end;
         end;
        end
        else  // Сброс
        begin
            Fl_DifXX:= false;
            Fl_DifFront_ON:= false;
            Fl_DifRear_ON:= false;
            Fl_DifTrailer_ON:= false;
        end;
        // Управление двигателем ограничение момента
        if (Sender as TButton).Name='Button7' then begin
         Fl_Engine_Drag:= false;
         if Fl_Engine_Brake then Fl_Engine_Brake:= false
                            else begin
                                 Fl_Engine_Brake:= true;
                                 Fl_Engine:= true;
                                 end;
        end;
        // Управление двигателем задание момента
        if (Sender as TButton).Name='Button8' then begin
         Fl_Engine_Brake:= false;
         if Fl_Engine_Drag then Fl_Engine_Drag:= false
                           else begin
                                Fl_Engine_Drag:= true;
                                Fl_Engine:= true;
                                end;
        end;
        // Управление Retarder задание момента
        if (Sender as TButton).Name='Button9' then begin
         Fl_Retarder_Off:= false;
         if Fl_Retarder_Brake then Fl_Retarder_Brake:= false
                            else begin
                                 Fl_Retarder_Brake:= true;
                                 Fl_Retarder:= true;
                                 end;
        end;
        // Управление Retarder ограничение момента
        if (Sender as TButton).Name='Button10' then begin
         Fl_Retarder_Brake:= false;
         if Fl_Retarder_Off then Fl_Retarder_Off:= false
                           else begin
                                Fl_Retarder_Off:= true;
                                Fl_Retarder:= true;
                                end;
        end;
         // Управление Prop
        if (Sender as TButton).Name='Prop' then begin
        if Fl_Prop_On then Fl_Prop_On:= false
                           else begin
                                Fl_Prop_On:= true;
                                Fl_Prop:= true;
                                end;
        end;
        Form1.DSC_TestEnd;
end;

procedure TTestDSC.TrackBar2Change(Sender: TObject);
begin
     if not Com_Connected_F then
     begin
        TestDSC.Label370.Caption:='---';
        Exit;
     end;
     if Fl_Prop then
     TestDSC.Label370.Caption:= 'PWM = '+
               FloatToStrF(TestDSC.TrackBar2.Position/1.50,ffFixed,4,2) +'%'
     else
     TestDSC.Label370.Caption:=
               FloatToStrF(TestDSC.TrackBar2.Position/20,ffFixed,4,2) +' atm';
     WriteTrailerPress(TestDSC.TrackBar2.Position);
end;

end.
