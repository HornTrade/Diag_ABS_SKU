unit Stend;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFormStend = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox3: TGroupBox;
    Label8: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    GroupBox2: TGroupBox;
    Label15: TLabel;
    GroupBox4: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    GroupBox5: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    GroupBox6: TGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    GroupBox7: TGroupBox;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    GroupBox8: TGroupBox;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label50: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Button3: TButton;
    Button4: TButton;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    RadioGroup1: TRadioGroup;
    Label67: TLabel;
    Panel1: TPanel;
    Label68: TLabel;
    GroupBox9: TGroupBox;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    GroupBox10: TGroupBox;
    Label73: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure  StendStep;
    procedure  SeTTing;
    procedure  ClrBox;
    procedure  PowerReset;
    procedure  PowerOff;
    procedure  Show_MOD_ST;
    procedure  Show_MOD_AD;
    procedure  Show_PK;
    procedure  Show_DIF;
    procedure  Show_DBR;
    procedure  Show_Upit;
    procedure  Show_CAN;
    procedure  Show_Lamp_Sw;
    procedure  Show_Speed;
    procedure  Show_SS_AT;
    procedure  Show_SS;
    procedure  Show_MOD;
    procedure  Show_End;
    procedure  Show_EPROM;
    procedure  Show_Start;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormStend: TFormStend;
  SS_AT_Set,SS_PT_Set,SS_GT_Set,SS_Sp_Set:integer;
  ABSL_On_Set,ABSL_Off_Set,ASRL_On_Set,ASRL_Off_Set:integer;
  KL15_Set,KL30_Set:integer;
  DBR_On_Set,DBR_Off_Set,DIF_On_Set,DIF_Off_Set:integer;
  GndD_On_Set,GndD_Off_Set,PK_On_Set,PK_Off_Set:integer;
  MOD_AV_Set,MOD_EV_Set,MOD_ST1_Set,MOD_ST2_Set:integer;
  ABS_SW_Set,ASR_SW_Set,TSET_SW_Set:integer;
  D1,D2,D3,D4:integer;
  Puls_Cnt:integer;
  Fl_Puls:boolean;

implementation
uses mainABSdiag, Link_Unit,Link_Processor,
     Com_Thread, Unit7;
{$R *.dfm}

procedure TFormStend.FormShow(Sender: TObject);
begin
      ProtokolMake:=true;
      Puls_Cnt:=10;
   //   UnSecur_Stend:=true;
      SeTTing;
end;

procedure TFormStend.FormActivate(Sender: TObject);
begin
      Form1.Timer2.Enabled:=true;
      Puls_Cnt:=10;
      if  Com_Connected_F then begin
      ProtokolMake:=true;
  //    UnSecur_Stend:=true;
      if CompStend then  CompStend:=false;
      end;
end;

procedure TFormStend.FormDeactivate(Sender: TObject);
begin
     ProtokolMake:=False;
   //  UnSecur_Stend:=false;
end;

procedure TFormStend.Show_MOD;
begin
      if ((label36.Font.Color=clWindowText) and
          (label58.Font.Color=clWindowText) and
          (label62.Font.Color=clWindowText) and
          (label40.Font.Color=clWindowText))    then label32.Font.Color:=clWindowText
                                                else label32.Font.Color:=ClRed;
      if ((label37.Font.Color=clWindowText) and
          (label59.Font.Color=clWindowText) and
          (label63.Font.Color=clWindowText) and
          (label41.Font.Color=clWindowText))    then label33.Font.Color:=clWindowText
                                                else label33.Font.Color:=ClRed;
      if ((label38.Font.Color=clWindowText) and
          (label60.Font.Color=clWindowText) and
          (label64.Font.Color=clWindowText) and
          (label42.Font.Color=clWindowText))    then label34.Font.Color:=clWindowText
                                                else label34.Font.Color:=ClRed;
      if ((label39.Font.Color=clWindowText) and
          (label61.Font.Color=clWindowText) and
          (label65.Font.Color=clWindowText) and
          (label43.Font.Color=clWindowText))    then label35.Font.Color:=clWindowText
                                                else label35.Font.Color:=ClRed;
end;
procedure TFormStend.Show_SS;
begin
      if ((label5.Font.Color=clWindowText) and
          (label46.Font.Color=clWindowText) and
          (label50.Font.Color=clWindowText) and
          (label54.Font.Color=clWindowText))    then label1.Font.Color:=clWindowText
                                                else label1.Font.Color:=ClRed;
      if ((label6.Font.Color=clWindowText) and
          (label47.Font.Color=clWindowText) and
          (label51.Font.Color=clWindowText) and
          (label55.Font.Color=clWindowText))    then label2.Font.Color:=clWindowText
                                                else label2.Font.Color:=ClRed;
      if ((label7.Font.Color=clWindowText) and
          (label48.Font.Color=clWindowText) and
          (label52.Font.Color=clWindowText) and
          (label56.Font.Color=clWindowText))    then label3.Font.Color:=clWindowText
                                                else label3.Font.Color:=ClRed;
      if ((label8.Font.Color=clWindowText) and
          (label49.Font.Color=clWindowText) and
          (label53.Font.Color=clWindowText) and
          (label57.Font.Color=clWindowText))    then label4.Font.Color:=clWindowText
                                                else label4.Font.Color:=ClRed;
end;
procedure TFormStend.Show_SS_AT;
var
   Temp1,Temp2:integer;
begin
      // ss act test
      Temp1:=SS_AT_Set+D1;
      Temp2:=SS_AT_Set-D1;
      if ((SenOscData[13] >Temp1) or (SenOscData[13] <Temp2)) then
                                                     label5.Font.Color:=ClRed
                                             else    label5.Font.Color:=clWindowText;
      if ((SenOscData[14] >Temp1) or (SenOscData[14] <Temp2)) then
                                                     label6.Font.Color:=ClRed
                                             else    label6.Font.Color:=clWindowText;
      if ((SenOscData[15] >Temp1) or (SenOscData[15] <Temp2)) then
                                                     label7.Font.Color:=ClRed
                                             else    label7.Font.Color:=clWindowText;
      if ((SenOscData[16] >Temp1) or (SenOscData[16] <Temp2)) then
                                                     label8.Font.Color:=ClRed
                                             else    label8.Font.Color:=clWindowText;
      Label5.Caption:=IntToStr(SenOscData[13]);
      Label6.Caption:=IntToStr(SenOscData[14]);
      Label7.Caption:=IntToStr(SenOscData[15]);
      Label8.Caption:=IntToStr(SenOscData[16]);
end;
procedure TFormStend.Show_Speed;
var
   Temp1,Temp2:integer;
begin
      // ss pas test
      Temp1:=SS_PT_Set+D1;
      Temp2:=SS_PT_Set-D1;
      if ((SenOscData[9] >Temp1) or (SenOscData[9] <Temp2)) then
                                                     label46.Font.Color:=ClRed
                                             else    label46.Font.Color:=clWindowText;
      if ((SenOscData[10] >Temp1) or (SenOscData[10] <Temp2)) then
                                                     label47.Font.Color:=ClRed
                                             else    label47.Font.Color:=clWindowText;
      if ((SenOscData[11] >Temp1) or (SenOscData[11] <Temp2)) then
                                                     label48.Font.Color:=ClRed
                                             else    label48.Font.Color:=clWindowText;
      if ((SenOscData[12] >Temp1) or (SenOscData[12] <Temp2)) then
                                                     label49.Font.Color:=ClRed
                                             else    label49.Font.Color:=clWindowText;
      Label46.Caption:=IntToStr(SenOscData[9]);
      Label47.Caption:=IntToStr(SenOscData[10]);
      Label48.Caption:=IntToStr(SenOscData[11]);
      Label49.Caption:=IntToStr(SenOscData[12]);
       // ss gap test
      Temp1:=SS_GT_Set+D2;
      Temp2:=SS_GT_Set-D2;
      if ((SenOscData[1] >Temp1) or (SenOscData[1] <Temp2)) then
                                                     label50.Font.Color:=ClRed
                                             else    label50.Font.Color:=clWindowText;
      if ((SenOscData[2] >Temp1) or (SenOscData[2] <Temp2)) then
                                                     label51.Font.Color:=ClRed
                                             else    label51.Font.Color:=clWindowText;
      if ((SenOscData[3] >Temp1) or (SenOscData[3] <Temp2)) then
                                                     label52.Font.Color:=ClRed
                                             else    label52.Font.Color:=clWindowText;
      if ((SenOscData[4] >Temp1) or (SenOscData[4] <Temp2)) then
                                                     label53.Font.Color:=ClRed
                                             else    label53.Font.Color:=clWindowText;
      Label50.Caption:=IntToStr(SenOscData[1]);
      Label51.Caption:=IntToStr(SenOscData[2]);
      Label52.Caption:=IntToStr(SenOscData[3]);
      Label53.Caption:=IntToStr(SenOscData[4]);
       // speed
      Temp1:=SS_Sp_Set;
      Temp2:=SS_Sp_Set;
      if ((SenOscData[5] >Temp1) or (SenOscData[5] <Temp2)) then
                                                     label54.Font.Color:=ClRed
                                             else    label54.Font.Color:=clWindowText;
      if ((SenOscData[6] >Temp1) or (SenOscData[6] <Temp2)) then
                                                     label55.Font.Color:=ClRed
                                             else    label55.Font.Color:=clWindowText;
      if ((SenOscData[7] >Temp1) or (SenOscData[7] <Temp2)) then
                                                     label56.Font.Color:=ClRed
                                             else    label56.Font.Color:=clWindowText;
      if ((SenOscData[8] >Temp1) or (SenOscData[8] <Temp2)) then
                                                     label57.Font.Color:=ClRed
                                             else    label57.Font.Color:=clWindowText;
      Label54.Caption:=IntToStr(SenOscData[5]);
      Label55.Caption:=IntToStr(SenOscData[6]);
      Label56.Caption:=IntToStr(SenOscData[7]);
      Label57.Caption:=IntToStr(SenOscData[8]);
end;

procedure TFormStend.Show_Lamp_Sw;
var
   Temp1,Temp2,TempAdc:integer;
begin
      //abs lamp
 //     if ((Stend_Step >4) and (Stend_Step <7)) then begin
      if (BufLampOsc[4] and $08)=0 then begin label9.Font.Color:=clWindowText;
                                              Label9.Caption:= 'ABS_Lamp   Off';
                                        end else begin
                                        label9.Font.Color:=ClRed;
                                        Label9.Caption:= 'ABS_Lamp   On ';
                                        end;
//      end;
      Temp1:=ABSL_On_Set+D4;
      Temp2:=ABSL_On_Set-D4;
      if ((TestData[8] >Temp1) or (TestData[8] <Temp2)) then
                                                     label19.Font.Color:=ClRed
                                             else    label19.Font.Color:=clWindowText;
      Temp1:=ABSL_Off_Set+D4;
      Temp2:=ABSL_Off_Set-D4;
      if ((TestData[7] >Temp1) or (TestData[7] <Temp2)) then
                                                     label20.Font.Color:=ClRed
                                             else    label20.Font.Color:=clWindowText;
      Label19.Caption:=IntToStr(TestData[8]);
      Label20.Caption:=IntToStr(TestData[7]);
      //asr lamp
//      if ((Stend_Step >4) and (Stend_Step <7)) then begin
      if (BufLampOsc[4] and $10)=0 then begin label10.Font.Color:=clWindowText;
                                              Label10.Caption:= 'ASR_Lamp  Off';
                                        end else begin
                                        label10.Font.Color:=ClRed;
                                        Label10.Caption:= 'ASR_Lamp  On ';
                                        end;
      Temp1:=ASRL_On_Set+D4;
      Temp2:=ASRL_On_Set-D4;
      if ((TestData[11] >Temp1) or (TestData[11] <Temp2)) then
                                                     label44.Font.Color:=ClRed
                                             else    label44.Font.Color:=clWindowText;
      Temp1:=ASRL_Off_Set+D4;
      Temp2:=ASRL_Off_Set-D4;
      if ((TestData[12] >Temp1) or (TestData[12] <Temp2)) then
                                                     label45.Font.Color:=ClRed
                                             else    label45.Font.Color:=clWindowText;
      Label44.Caption:=IntToStr(TestData[11]);
      Label45.Caption:=IntToStr(TestData[12]);
 //     end;
      if (BufLampOsc[3] and $01)=0 then  begin label11.Font.Color:=clWindowText;
                                               label11.Caption:='ABS_Sw      Off';
                                        end else begin
                                        label11.Font.Color:=ClRed;
                                        label11.Caption:='ABS_Sw      On ';
                                        end;

      Temp1:=ABS_SW_Set+D1;
      Temp2:=ABS_SW_Set-D1;
      if label73.Caption = 'PCB - 2' then begin
                                  Temp1:=Temp1+D3;
                                  Temp2:=Temp2+D3;
                                          end;
      if ((ADCData[6] >Temp1) or (ADCData[6] <Temp2)) then
                                                     label21.Font.Color:=ClRed
                                             else    label21.Font.Color:=clWindowText;
      Label21.Caption:=IntToStr(ADCData[6]);
      if (BufLampOsc[3] and $02)=0 then  begin label12.Font.Color:=clWindowText;
                                               label12.Caption:='ASR_Sw      Off';
                                        end else begin
                                        label12.Font.Color:=ClRed;
                                        label12.Caption:='ASR_Sw      On ';
                                        end;
      Temp1:=ASR_SW_Set+D1;
      Temp2:=ASR_SW_Set-D1;
      if label73.Caption = 'PCB - 2' then begin
                                  Temp1:=Temp1+D3;
                                  Temp2:=Temp2+D3;
                                          end;      
      if ((ADCData[5] >Temp1) or (ADCData[5] <Temp2)) then
                                                     label22.Font.Color:=ClRed
                                             else    label22.Font.Color:=clWindowText;
      Label22.Caption:=IntToStr(ADCData[5]);
      //TSET
 //     if (FormStend.RadioGroup1.ItemIndex=2) then 
      if (DumpMOT[28] and 16)=16  then
      begin
      if (BufLampOsc[6] and $08)=0 then  begin label13.Font.Color:=clWindowText;
                                               label13.Caption:='TSET_Sw    Off';
                                        end else begin
                                        label13.Font.Color:=ClRed;
                                        label13.Caption:='TSET_Sw     On ';
                                        end;

      Temp1:=TSET_SW_Set+D1;
      Temp2:=TSET_SW_Set-D1;
      if ((ADCData[23] >Temp1) or (ADCData[23] <Temp2)) then
                                                     label23.Font.Color:=ClRed
                                             else    label23.Font.Color:=clWindowText;
      Label23.Caption:=IntToStr(ADCData[23]);
      end else begin
      label23.Font.Color:=clWindowText;
               Label23.Caption:='---';
      end;
      if (BufLampOsc[3] and $04)=0 then  begin label14.Font.Color:=clWindowText;
                                               label14.Caption:='DIA_Sw      Off';
                                        end else begin
                                        label14.Font.Color:=ClRed;
                                        label14.Caption:='DIA_Sw      On ';
                                        end;

end;
procedure TFormStend.Show_CAN;
var
   Temp1,Temp2:integer;
begin
      if ((FormStend.RadioGroup1.ItemIndex=0) or
          (FormStend.RadioGroup1.ItemIndex=1)) then begin
      if ((CANData[1]=240) and (CANData[2]=125)) then
                                        begin  label15.Font.Color:=clWindowText;
                                               label15.Caption:='ÌÓÏ‡';
                                        end else begin
                                        label15.Font.Color:=ClRed;
                                        label15.Caption:='ÌÂËÒÔ‡‚ÂÌ';
                                        end;
                                        end;
end;
procedure TFormStend.Show_MOD_ST;
var
   Temp1,Temp2:integer;
begin
      Temp1:=MOD_ST1_Set;
      Temp2:=MOD_ST2_Set;
      if (TestData[21]=Temp1)  then label58.Font.Color:=clWindowText
                               else label58.Font.Color:=ClRed;
      if (TestData[22]=Temp2)  then label62.Font.Color:=clWindowText
                               else label62.Font.Color:=ClRed;
      if (TestData[23]=Temp1)  then label59.Font.Color:=clWindowText
                               else label59.Font.Color:=ClRed;
      if (TestData[24]=Temp2)  then label63.Font.Color:=clWindowText
                               else label63.Font.Color:=ClRed;
      if (TestData[25]=Temp1)  then label60.Font.Color:=clWindowText
                               else label60.Font.Color:=ClRed;
      if (TestData[26]=Temp2)  then label64.Font.Color:=clWindowText
                               else label64.Font.Color:=ClRed;
      if (TestData[27]=Temp1)  then label61.Font.Color:=clWindowText
                               else label61.Font.Color:=ClRed;
      if (TestData[28]=Temp2)  then label65.Font.Color:=clWindowText
                               else label65.Font.Color:=ClRed;
             Label58.Caption:=IntToStr(TestData[21]);
             Label62.Caption:=IntToStr(TestData[22]);
             Label59.Caption:=IntToStr(TestData[23]);
             Label63.Caption:=IntToStr(TestData[24]);

             Label60.Caption:=IntToStr(TestData[25]);
             Label64.Caption:=IntToStr(TestData[26]);
             Label61.Caption:=IntToStr(TestData[27]);
             Label65.Caption:=IntToStr(TestData[28]);
end;
procedure TFormStend.Show_Upit;
var
   Temp1,Temp2,TempAdc:integer;
begin
      Temp1:=KL15_Set-D1;
      Temp2:=KL15_Set+D1;
      if label73.Caption = 'PCB - 2' then TempAdc:=ADCData[20]+5
                                     else TempAdc:=ADCData[20];

      if ((TempAdc >Temp1) and (TempAdc <Temp2)) then
                                        begin  label16.Font.Color:=clWindowText;
                                               label16.Caption:='KL15      '+IntToStr(TempAdc);
                                        end else begin
                                        label16.Font.Color:=ClRed;
                                        label16.Caption:='KL15      '+IntToStr(TempAdc);
                                        end;
      Temp1:=KL30_Set-D1;
      Temp2:=KL30_Set+D1;
      if ((ADCData[19] >Temp1) and (ADCData[19] <Temp2)) then
                                        begin  label17.Font.Color:=clWindowText;
                                               label17.Caption:='KL30      '+IntToStr(ADCData[19]);
                                        end else begin
                                        label17.Font.Color:=ClRed;
                                        label17.Caption:='KL30      '+IntToStr(ADCData[19]);
                                        end;
end;
procedure TFormStend.Show_DBR;
var
   Temp1,Temp2:integer;
begin
      if (DumpMOT[11] and 1)=1 then begin // config
      Temp1:=DBR_On_Set+D1;
      Temp2:=DBR_On_Set-D1;
      if ((TestData[5] >Temp1) or (TestData[5] <Temp2)) then
                                                     label18.Font.Color:=ClRed
                                             else    label18.Font.Color:=clWindowText;
      Temp1:=DBR_Off_Set+D1;
      Temp2:=DBR_Off_Set-D1;
      if ((TestData[6] >Temp1) or (TestData[6] <Temp2)) then
                                                     label24.Font.Color:=ClRed
                                             else    label24.Font.Color:=clWindowText;
             Label18.Caption:=IntToStr(TestData[5]);
             Label24.Caption:=IntToStr(TestData[6]);
      end;
end;
procedure TFormStend.Show_MOD_AD;
var
   Temp1,Temp2:integer;
begin
      Temp1:=MOD_AV_Set+D1;
      Temp2:=MOD_AV_Set-D1;
      if ((TestData[13]<Temp1) and (TestData[13]>Temp2)) then label36.Font.Color:=clWindowText
                                                   else label36.Font.Color:=ClRed;
      if ((TestData[14]<Temp1) and (TestData[14]>Temp2)) then label40.Font.Color:=clWindowText
                                                   else label40.Font.Color:=ClRed;
             Label36.Caption:=IntToStr(TestData[13]);
             Label40.Caption:=IntToStr(TestData[14]);

      if ((TestData[15]<Temp1) and (TestData[15]>Temp2)) then label37.Font.Color:=clWindowText
                                                   else label37.Font.Color:=ClRed;
      if ((TestData[16]<Temp1) and (TestData[16]>Temp2)) then label41.Font.Color:=clWindowText
                                                   else label41.Font.Color:=ClRed;
             Label37.Caption:=IntToStr(TestData[15]);
             Label41.Caption:=IntToStr(TestData[16]);

      if ((TestData[17]<Temp1) and (TestData[17]>Temp2)) then label38.Font.Color:=clWindowText
                                                   else label38.Font.Color:=ClRed;
      if ((TestData[18]<Temp1) and (TestData[18]>Temp2)) then label42.Font.Color:=clWindowText
                                                   else label42.Font.Color:=ClRed;
             Label38.Caption:=IntToStr(TestData[17]);
             Label42.Caption:=IntToStr(TestData[18]);

      if ((TestData[19]<Temp1) and (TestData[19]>Temp2)) then label39.Font.Color:=clWindowText
                                                   else label39.Font.Color:=ClRed;
      if ((TestData[20]<Temp1) and (TestData[20]>Temp2)) then label43.Font.Color:=clWindowText
                                                   else label43.Font.Color:=ClRed;
             Label39.Caption:=IntToStr(TestData[19]);
             Label43.Caption:=IntToStr(TestData[20]);
end;
procedure TFormStend.Show_PK;
var
   Temp1,Temp2:integer;
begin
      if (FormStend.RadioGroup1.ItemIndex=2) then begin
      Temp1:=PK_On_Set+D1;
      Temp2:=PK_On_Set-D1;
      if ((TestData[9] >Temp1) or (TestData[9] <Temp2)) then
                                                     label27.Font.Color:=ClRed
                                             else    label27.Font.Color:=clWindowText;
      Temp1:=PK_Off_Set+D1;
      Temp2:=PK_Off_Set-D1;
      if ((TestData[10] >Temp1) or (TestData[10] <Temp2)) then
                                                     label28.Font.Color:=ClRed
                                             else    label28.Font.Color:=clWindowText;
             Label27.Caption:=IntToStr(TestData[9]);
             Label28.Caption:=IntToStr(TestData[10]);

      end else begin
      label27.Font.Color:=clWindowText;
      label28.Font.Color:=clWindowText;
               Label27.Caption:='---';
               Label28.Caption:='---';
               end;
end;
procedure TFormStend.Show_DIF;
var
   Temp1,Temp2:integer;
begin
      Temp1:=DIF_On_Set+D1;
      Temp2:=DIF_On_Set-D1;
      if ((TestData[3] >Temp1) or (TestData[3] <Temp2)) then
                                                     label25.Font.Color:=ClRed
                                             else    label25.Font.Color:=clWindowText;
      Temp1:=DIF_Off_Set+D1;
      Temp2:=DIF_Off_Set-D1;
      if ((TestData[4] >Temp1) or (TestData[4] <Temp2)) then
                                                     label26.Font.Color:=ClRed
                                             else    label26.Font.Color:=clWindowText;
      Temp1:=GndD_On_Set+D1;
      Temp2:=GndD_On_Set-D1;
      if ((TestData[1] >Temp1) or (TestData[1] <Temp2)) then
                                                     label30.Font.Color:=ClRed
                                             else    label30.Font.Color:=clWindowText;
      Temp1:=GndD_Off_Set+D1;
      Temp2:=GndD_Off_Set-D1;
      if ((TestData[2] >Temp1) or (TestData[2] <Temp2)) then
                                                     label31.Font.Color:=ClRed
                                             else    label31.Font.Color:=clWindowText;

             Label25.Caption:=IntToStr(TestData[3]);
             Label26.Caption:=IntToStr(TestData[4]);
             Label30.Caption:=IntToStr(TestData[1]);
             Label31.Caption:=IntToStr(TestData[2]);
end;
procedure TFormStend.Show_EPROM;
var
   Temp1,Temp2:integer;
begin
//      Temp1:=DIF_On_Set+D1;
//      Temp2:=DIF_On_Set-D1;
      if (DumpEPROM[Adr_CorrKdec_H+1] <>128) then
                                                     label69.Font.Color:=ClRed
                                             else    label69.Font.Color:=clWindowText;
             Label69.Caption:=IntToStr(DumpEPROM[Adr_CorrKdec_H+1]);
end;
procedure TFormStend.Show_Start;
var
   Temp1,Temp2:integer;
begin
      if (BufLampOsc[7] and $08)=0 then  begin label73.Font.Color:=clWindowText;
                                               label73.Caption:='PCB - 1';
                                        end else begin
                                        label73.Font.Color:=clGreen;
                                        label73.Caption:='PCB - 2';
                                        end;
      if label73.Caption = 'PCB - 2' then begin
                                  Temp1:=13;
                                  Temp2:=226;
                                          end
                                      else begin
                                  Temp1:=12;
                                  Temp2:=234;
                                          end;
             if (OscData[1] <>Temp1) then
                                                     label71.Font.Color:=ClRed
                                             else    label71.Font.Color:=clWindowText;
             if (OscData[2] <>Temp2) then
                                                     label72.Font.Color:=ClRed
                                             else    label72.Font.Color:=clWindowText;
             Label71.Caption:=IntToStr(OscData[1]);
             Label72.Caption:=IntToStr(OscData[2]);

end;


procedure TFormStend.Show_End;
begin
if ((label32.Font.Color=clWindowText) and
          (label33.Font.Color=clWindowText) and
          (label34.Font.Color=clWindowText) and
          (label35.Font.Color=clWindowText) and
          (label1.Font.Color=clWindowText) and
          (label2.Font.Color=clWindowText) and
          (label3.Font.Color=clWindowText) and
          (label4.Font.Color=clWindowText) and
          (label16.Font.Color=clWindowText) and
          (label17.Font.Color=clWindowText) and
          (label9.Font.Color=clWindowText) and
          (label10.Font.Color=clWindowText) and
          (label11.Font.Color=clWindowText) and
          (label12.Font.Color=clWindowText) and
          (label13.Font.Color=clWindowText) and
          (label14.Font.Color=clWindowText) and
          (label27.Font.Color=clWindowText) and
          (label28.Font.Color=clWindowText) and
          (label18.Font.Color=clWindowText) and
          (label24.Font.Color=clWindowText) and
          (label25.Font.Color=clWindowText) and
          (label26.Font.Color=clWindowText) and
          (label25.Font.Color=clWindowText) and
          (label30.Font.Color=clWindowText) and
          (label19.Font.Color=clWindowText) and
          (label20.Font.Color=clWindowText) and
          (label21.Font.Color=clWindowText) and
          (label22.Font.Color=clWindowText) and
          (label23.Font.Color=clWindowText) and
          (label44.Font.Color=clWindowText) and
          (label45.Font.Color=clWindowText) and
          (label69.Font.Color=clWindowText) and
          (label31.Font.Color=clWindowText))    then begin
                                                    label68.Font.Color:=clGreen;
                                                    label68.Caption:='     »—œ–¿¬≈Õ';
                                                     end
                                                else begin
                                                    label68.Font.Color:=ClRed;
                                                    label68.Caption:='          ¡–¿ ';
                                                    end;
end;

procedure TFormStend.SeTTing;
begin
  SS_AT_Set:=StrToInt(Form7.Edit1.Text);
  SS_PT_Set:=StrToInt(Form7.Edit2.Text);
  SS_GT_Set:=StrToInt(Form7.Edit3.Text);
  SS_Sp_Set:=StrToInt(Form7.Edit4.Text);
  ABSL_On_Set:=StrToInt(Form7.Edit5.Text);
  ABSL_Off_Set:=StrToInt(Form7.Edit7.Text);
  ASRL_On_Set:=StrToInt(Form7.Edit6.Text);
  ASRL_Off_Set:=StrToInt(Form7.Edit8.Text);
  ABS_SW_Set:=StrToInt(Form7.Edit9.Text);
  ASR_SW_Set:=StrToInt(Form7.Edit10.Text);
  TSET_SW_Set:=StrToInt(Form7.Edit11.Text);
  KL15_Set:=StrToInt(Form7.Edit12.Text);
  KL30_Set:=StrToInt(Form7.Edit13.Text);
  DBR_On_Set:=StrToInt(Form7.Edit14.Text);
  DBR_Off_Set:=StrToInt(Form7.Edit18.Text);
  DIF_On_Set:=StrToInt(Form7.Edit15.Text);
  DIF_Off_Set:=StrToInt(Form7.Edit19.Text);
  GndD_On_Set:=StrToInt(Form7.Edit16.Text);
  GndD_Off_Set:=StrToInt(Form7.Edit20.Text);
  PK_On_Set:=StrToInt(Form7.Edit17.Text);
  PK_Off_Set:=StrToInt(Form7.Edit21.Text);
  MOD_AV_Set:=StrToInt(Form7.Edit22.Text);
  MOD_EV_Set:=StrToInt(Form7.Edit23.Text);
  MOD_ST1_Set:=StrToInt(Form7.Edit24.Text);
  MOD_ST2_Set:=StrToInt(Form7.Edit25.Text);
  D1:=5;
  D2:=1;
  D3:=0; //15;
  D4:=7;
end;

procedure TFormStend.ClrBox;
begin
               Label1.Font.Color:=clWindowText;
               Label2.Font.Color:=clWindowText;
               Label3.Font.Color:=clWindowText;
               Label4.Font.Color:=clWindowText;
               Label5.Font.Color:=clWindowText;
               Label6.Font.Color:=clWindowText;
               Label7.Font.Color:=clWindowText;
               Label8.Font.Color:=clWindowText;
               Label9.Font.Color:=clWindowText;
               Label10.Font.Color:=clWindowText;
               Label11.Font.Color:=clWindowText;
               Label12.Font.Color:=clWindowText;
               Label13.Font.Color:=clWindowText;
               Label14.Font.Color:=clWindowText;
               Label15.Font.Color:=clWindowText;
               Label16.Font.Color:=clWindowText;
               Label17.Font.Color:=clWindowText;
               Label18.Font.Color:=clWindowText;
               Label19.Font.Color:=clWindowText;
               Label20.Font.Color:=clWindowText;
               Label21.Font.Color:=clWindowText;
               Label22.Font.Color:=clWindowText;
               Label23.Font.Color:=clWindowText;
               Label24.Font.Color:=clWindowText;
               Label25.Font.Color:=clWindowText;
               Label26.Font.Color:=clWindowText;
               Label27.Font.Color:=clWindowText;
               Label28.Font.Color:=clWindowText;
               Label29.Font.Color:=clWindowText;
               Label30.Font.Color:=clWindowText;
               Label31.Font.Color:=clWindowText;
               Label32.Font.Color:=clWindowText;
               Label33.Font.Color:=clWindowText;
               Label34.Font.Color:=clWindowText;
               Label35.Font.Color:=clWindowText;
               Label36.Font.Color:=clWindowText;
               Label37.Font.Color:=clWindowText;
               Label38.Font.Color:=clWindowText;
               Label39.Font.Color:=clWindowText;
               Label40.Font.Color:=clWindowText;
               Label41.Font.Color:=clWindowText;
               Label42.Font.Color:=clWindowText;
               Label43.Font.Color:=clWindowText;
               Label44.Font.Color:=clWindowText;
               Label45.Font.Color:=clWindowText;
               Label46.Font.Color:=clWindowText;
               Label47.Font.Color:=clWindowText;
               Label48.Font.Color:=clWindowText;
               Label49.Font.Color:=clWindowText;
               Label50.Font.Color:=clWindowText;
               Label51.Font.Color:=clWindowText;
               Label52.Font.Color:=clWindowText;
               Label53.Font.Color:=clWindowText;
               Label54.Font.Color:=clWindowText;
               Label55.Font.Color:=clWindowText;
               Label56.Font.Color:=clWindowText;
               Label57.Font.Color:=clWindowText;
               Label58.Font.Color:=clWindowText;
               Label59.Font.Color:=clWindowText;
               Label60.Font.Color:=clWindowText;
               Label61.Font.Color:=clWindowText;
               Label62.Font.Color:=clWindowText;
               Label63.Font.Color:=clWindowText;
               Label64.Font.Color:=clWindowText;
               Label65.Font.Color:=clWindowText;
               Label68.Font.Color:=clWindowText;
               Label69.Font.Color:=clWindowText;
               Label71.Font.Color:=clWindowText;
               Label72.Font.Color:=clWindowText;
               Label73.Font.Color:=clWindowText;

               Label5.Caption:='---';
               Label6.Caption:='---';
               Label7.Caption:='---';
               Label8.Caption:='---';
               Label15.Caption:='---';
               Label16.Caption:='KL15';
               Label17.Caption:='KL30';
               Label18.Caption:='---';
               Label24.Caption:='---';
               Label19.Caption:='---';
               Label20.Caption:='---';
               Label21.Caption:='---';
               Label22.Caption:='---';
               Label23.Caption:='---';
               Label25.Caption:='---';
               Label26.Caption:='---';
               Label27.Caption:='---';
               Label28.Caption:='---';
               Label30.Caption:='---';
               Label31.Caption:='---';
               Label44.Caption:='---';
               Label45.Caption:='---';

               Label46.Caption:='---';
               Label47.Caption:='---';
               Label48.Caption:='---';
               Label49.Caption:='---';
               Label50.Caption:='---';
               Label51.Caption:='---';
               Label52.Caption:='---';
               Label53.Caption:='---';
               Label54.Caption:='---';
               Label55.Caption:='---';
               Label56.Caption:='---';
               Label57.Caption:='---';
               Label36.Caption:='---';
               Label37.Caption:='---';
               Label38.Caption:='---';
               Label39.Caption:='---';
               Label40.Caption:='---';
               Label41.Caption:='---';
               Label42.Caption:='---';
               Label43.Caption:='---';
               Label58.Caption:='---';
               Label59.Caption:='---';
               Label60.Caption:='---';
               Label61.Caption:='---';
               Label62.Caption:='---';
               Label63.Caption:='---';
               Label64.Caption:='---';
               Label65.Caption:='---';
               Label68.Caption:='   ';
               Label69.Caption:='---';
               Label71.Caption:='---';
               Label72.Caption:='---';
               Label73.Caption:='---';               
end;

procedure TFormStend.StendStep;
Var
    Loop:Integer;
begin
      if not Stend_Blok_SEl then  begin
      Stend_Step:=0;
      exit;
      end;
      if ((not Com_Connected_F) or (not ProtokolMake) or (not Stend_Blok_SEl)) then  begin
      if Stend_Step >9 then Stend_Step:=0;
      Fl_ClrErr_Message:=false;
      FormStend.Label66.Caption:=IntToStr(Stend_Step);
      Form1.Timer2.Interval:=500;
      if Puls_Cnt<10 then  Puls_Cnt:=Puls_Cnt+1
                     else FormStend.Label70.Visible:=false;
      end else begin
      FormStend.Label66.Caption:=IntToStr(Stend_Step);
      Form1.Timer2.Interval:=1500;//2500;
      Puls_Cnt:=10;
        case Stend_Step of
           0:  begin
               FormStend.Label70.Visible:= false;
               Form1.Timer2.Interval:=3000;
               ClrBox;
              { // Ì‡ÒÚÓÈÍ‡ ÓÒÒËÎÓ„‡Ù‡
               Form1.Edit1.Text:=IntToStr(254);   // Upit_Flags
               Form1.Edit2.Text:=IntToStr(98);    // Block_Init_Close
               FormISO.DownLoadOscAddress;
               OscData[1]:=0; OscData[2]:=0;}
               PowerReset;
               end;
           1:  begin
           //    if FormStend.RadioGroup1.ItemIndex = 2 then begin
               Label68.Font.Color:=clWindowText;
               Label68.Caption:=' ŒÕ‘»√”–¿÷»ﬂ';//inttostr(ConfigMOT[0]);
               for Loop:=0 to 127 do DumpMOT[Loop]:=ConfigMOT[Loop];
               if Set_Security then begin
               fl_change_comp:=false;
               FormISO.WriteMotEPROM_con;
               repeat Application.ProcessMessages until  fl_change_comp;
               DumpMOT0:=DumpMOT[0];
               DumpMOT7:=DumpMOT[7];
               DumpMOT126:=DumpMOT[126];
               DumpMOT127:=DumpMOT[127];
               end else begin
               Stend_Step:=0;
               Form1.BtnStopClick(nil);
               end;
          //     end
          //     else begin
          //     Stend_Step:=Stend_Step+2;
          //     Label68.Caption:='“≈—“»–Œ¬¿Õ»≈';
          //     end;

                              // Ì‡ÒÚÓÈÍ‡ ÓÒÒËÎÓ„‡Ù‡
               Form1.Edit1.Text:=IntToStr(254);   // Upit_Flags
               Form1.Edit2.Text:=IntToStr(98);    // Block_Init_Close
               FormISO.DownLoadOscAddress;
               OscData[1]:=0; OscData[2]:=0;
               end;
           2:  begin
//               Label68.Caption:='“≈—“»–Œ¬¿Õ»≈';
               for loop:=0 to 255 do DumpEPROM[loop]:=0;
               Show_Start;
               PowerReset;
               end;
           3:  begin
               Label68.Caption:='“≈—“»–Œ¬¿Õ»≈';
               end;
           4:  begin
               Show_CAN;
               Show_SS_AT;
               Show_Lamp_Sw;
               Show_Upit;
               Show_DBR;
               Show_DIF;
               Show_PK;
                  // speed
                  Stend_Buf_Adr:=Stend_Buf+1;
                  Stend_Buf_Dat:=4;
                  FormISO.Stend_Selector;
               end;
           5:  begin
               Show_EPROM;
               Show_Lamp_Sw;
               Show_MOD_AD;
                  // err mod
                  Stend_Buf_Adr:=Stend_Buf+2;
                  Stend_Buf_Dat:=5;
                  FormISO.Stend_Selector;
               end;
           8:  begin
                Show_MOD_ST;
                Show_MOD;
                end;
           9:  begin
                Show_Speed;
                Show_SS;
                Fl_ClrErr_Message:=true;
                Form1.btnDelAllClick(nil);
                Fl_ClrErr_Message:=false;
                Form1.Timer2.Interval:=2000;
                end;

           10:  begin
               Show_End;
               PowerOff;
               FormStend.Label70.Visible:= true;
               Puls_Cnt:=0;
               end;

        end;
      Stend_Step:=Stend_Step+1;
      end;
end;

procedure TFormStend.PowerOff;
begin
    Stend_Buf_Adr:=Stend_Buf;
    Stend_Buf_Dat:=2;
    FormISO.Stend_Selector;
end;

procedure TFormStend.PowerReset;

begin
    Stend_Buf_Adr:=Stend_Buf;
    Stend_Buf_Dat:=3;
    FormISO.Stend_Selector;
end;

procedure TFormStend.Button1Click(Sender: TObject);
begin
    Stend_Step:=0;
    ClrBox;
    PowerOff;
end;

procedure TFormStend.Button2Click(Sender: TObject);
begin
    Stend_Step:=0;
    ClrBox;
    PowerReset;
end;

procedure TFormStend.Button3Click(Sender: TObject);
begin
     Form7.Show;
end;

procedure TFormStend.Button4Click(Sender: TObject);
begin
  //  Stend_Buf_Adr:=Stend_Buf+2;
  //  Stend_Buf_Dat:=5;
  //  FormISO.Stend_Selector;
  Stend_Step:=Stend_Step+1;
end;

procedure TFormStend.RadioGroup1Click(Sender: TObject);

Var ConfigFile:TextFile;
    TestString:String;
    Loop:Integer;
    sr: TSearchRec;
begin

   case FormStend.RadioGroup1.ItemIndex of
        0: TestString:=IniPath+'Conf_1604.asm';
        1: TestString:=IniPath+'Conf_1905.asm';
        2: TestString:=IniPath+'Conf_024.asm';
   end;
   if (FindFirst(TestString, faAnyFile, sr) <> 0) then
    begin
        Application.MessageBox( PChar('Conf_***.asm ÌÂ Ì‡È‰ÂÌ.'),
              'Œ¯Ë·Í‡', MB_OK+MB_ICONERROR+MB_APPLMODAL);
        exit;
    end;
        Config_File:=TestString;
        AssignFile(ConfigFile,Config_File);
        Reset(ConfigFile);
        for Loop:=0 to 127 do begin
                ReadLn(ConfigFile,TestString);
                ConfigMOT[Loop]:=StrToInt(TestString);
                end;
        CloseFile(ConfigFile);
end;

end.

