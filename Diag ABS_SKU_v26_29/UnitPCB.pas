unit UnitPCB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFormPCB = class(TForm)
    GroupBox1105: TGroupBox;
    Edit415: TEdit;
    Edit416: TEdit;
    Edit417: TEdit;
    Edit418: TEdit;
    Edit419: TEdit;
    Edit420: TEdit;
    Edit421: TEdit;
    Edit422: TEdit;
    Edit423: TEdit;
    GroupBox1106: TGroupBox;
    Label646: TLabel;
    Label647: TLabel;
    Label648: TLabel;
    Label649: TLabel;
    Label650: TLabel;
    Label651: TLabel;
    Label652: TLabel;
    Label653: TLabel;
    GroupBox1107: TGroupBox;
    Label654: TLabel;
    Label655: TLabel;
    Label656: TLabel;
    Label657: TLabel;
    Label658: TLabel;
    Label659: TLabel;
    Label660: TLabel;
    Label661: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    GroupBox: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    GroupBox11: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    GroupBox12: TGroupBox;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    GroupBox13: TGroupBox;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    GroupBox14: TGroupBox;
    GroupBox15: TGroupBox;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label102: TLabel;
    Label106: TLabel;
    Label107: TLabel;
    Label108: TLabel;
    Label109: TLabel;
    Label215: TLabel;
    Label216: TLabel;
    Label632: TLabel;
    Label633: TLabel;
    GroupBox16: TGroupBox;
    Label71: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label101: TLabel;
    Label103: TLabel;
    Label104: TLabel;
    Label105: TLabel;
    Label217: TLabel;
    Label218: TLabel;
    Label634: TLabel;
    Label635: TLabel;
    GroupBox18: TGroupBox;
    Label179: TLabel;
    Label180: TLabel;
    Label181: TLabel;
    Label182: TLabel;
    Label183: TLabel;
    Label184: TLabel;
    Label185: TLabel;
    Label186: TLabel;
    Label223: TLabel;
    Label224: TLabel;
    Edit425: TEdit;
    GroupBox17: TGroupBox;
    Label110: TLabel;
    Label111: TLabel;
    Label112: TLabel;
    Label170: TLabel;
    Label171: TLabel;
    Label172: TLabel;
    Label173: TLabel;
    Label174: TLabel;
    Label175: TLabel;
    Label198: TLabel;
    Label176: TLabel;
    Label204: TLabel;
    Label177: TLabel;
    Label206: TLabel;
    Label178: TLabel;
    Label208: TLabel;
    Label219: TLabel;
    Label220: TLabel;
    Label221: TLabel;
    Label222: TLabel;
    Label636: TLabel;
    Label637: TLabel;
    Label638: TLabel;
    Label639: TLabel;
    GroupBox19: TGroupBox;
    GroupBox110: TGroupBox;
    GroupBox111: TGroupBox;
    Label37: TLabel;
    Label38: TLabel;
    GroupBox112: TGroupBox;
    Label39: TLabel;
    Label40: TLabel;
    GroupBox113: TGroupBox;
    GroupBox114: TGroupBox;
    Label41: TLabel;
    Label42: TLabel;
    GroupBox115: TGroupBox;
    Label43: TLabel;
    Label44: TLabel;
    GroupBox116: TGroupBox;
    GroupBox117: TGroupBox;
    Label45: TLabel;
    Label46: TLabel;
    GroupBox118: TGroupBox;
    Label47: TLabel;
    Label48: TLabel;
    GroupBox119: TGroupBox;
    GroupBox120: TGroupBox;
    Label49: TLabel;
    Label50: TLabel;
    GroupBox121: TGroupBox;
    Label51: TLabel;
    Label52: TLabel;
    GroupBox125: TGroupBox;
    GroupBox122: TGroupBox;
    Label53: TLabel;
    Label54: TLabel;
    GroupBox123: TGroupBox;
    Label55: TLabel;
    Label56: TLabel;
    GroupBox124: TGroupBox;
    Label57: TLabel;
    Label58: TLabel;
    GroupBox127: TGroupBox;
    GroupBox129: TGroupBox;
    Label60: TLabel;
    GroupBox126: TGroupBox;
    Label59: TLabel;
    GroupBox128: TGroupBox;
    Label61: TLabel;
    GroupBox130: TGroupBox;
    GroupBox131: TGroupBox;
    Label62: TLabel;
    GroupBox132: TGroupBox;
    Label63: TLabel;
    GroupBox133: TGroupBox;
    Label64: TLabel;
    GroupBox134: TGroupBox;
    Label65: TLabel;
    GroupBox136: TGroupBox;
    Label67: TLabel;
    GroupBox135: TGroupBox;
    Label66: TLabel;
    GroupBox137: TGroupBox;
    Label68: TLabel;
    Label69: TLabel;
    GroupBox138: TGroupBox;
    Label70: TLabel;
    Label72: TLabel;
    GroupBox139: TGroupBox;
    Label73: TLabel;
    Label74: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    RadioGroup2: TRadioGroup;
    GroupBox140: TGroupBox;
    Label85: TLabel;
    GroupBox141: TGroupBox;
    Label86: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    Edit1: TEdit;
    Label90: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    Label93: TLabel;

    procedure PCB_Test;
    procedure Sens_Test;
    procedure MDT_Var;
    procedure FormShow(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

Type OscType=record
     PreviousYPosition:Byte;
     PreviousXPosition:Word;
     Color:TColor;
     Enabled:boolean;
     OscLabel:TLabel;
end;

var
  FormPCB: TFormPCB;
  Sen_Test_Data:array[1..32] of Real;
  Sen_Test_Thresh:array[1..32] of Real;
  Sen_Test_Result:array[1..32] of Byte;
  Sen_Array:array[1..32] of OscType;
  PcbT3, PcbT4, PcbT8  : Byte;

implementation

uses  mainABSdiag, Link_Unit;

{$R *.dfm}

procedure TFormPCB.MDT_Var;
Var Loop :Integer;
begin
  if Com_Connected_F then
   begin
   // Mod 1L
   if (Pcb_Test_1 and $01) <> $01
   then FormPCB.Label37.Font.Color := clRed
   else FormPCB.Label37.Font.Color :=clGreen;
   if (Pcb_Test_1 and $02) <> $02
   then FormPCB.Label38.Font.Color := clRed
   else FormPCB.Label38.Font.Color :=clGreen;
   if (Pcb_Test_2 and $01) <> $01
   then FormPCB.Label39.Font.Color := clRed
   else FormPCB.Label39.Font.Color :=clGreen;
   if (Pcb_Test_2 and $02) <> $02
   then FormPCB.Label40.Font.Color := clRed
   else FormPCB.Label40.Font.Color :=clGreen;
   FormPCB.Label37.Caption:=IntToStr(VarMDT[1]);
   FormPCB.Label38.Caption:=IntToStr(VarMDT[2]);
   FormPCB.Label39.Caption:=IntToStr(VarMDT[3]);
   FormPCB.Label40.Caption:=IntToStr(VarMDT[4]);
   // Mod 1R
   if (Pcb_Test_1 and $04) <> $04
   then FormPCB.Label41.Font.Color := clRed
   else FormPCB.Label41.Font.Color :=clGreen;
   if (Pcb_Test_1 and $08) <> $08
   then FormPCB.Label42.Font.Color := clRed
   else FormPCB.Label42.Font.Color :=clGreen;
   if (Pcb_Test_2 and $04) <> $04
   then FormPCB.Label43.Font.Color := clRed
   else FormPCB.Label43.Font.Color :=clGreen;
   if (Pcb_Test_2 and $08) <> $08
   then FormPCB.Label44.Font.Color := clRed
   else FormPCB.Label44.Font.Color :=clGreen;
   FormPCB.Label41.Caption:=IntToStr(VarMDT[5]);
   FormPCB.Label42.Caption:=IntToStr(VarMDT[6]);
   FormPCB.Label43.Caption:=IntToStr(VarMDT[7]);
   FormPCB.Label44.Caption:=IntToStr(VarMDT[8]);
   // Mod 2L
   if (Pcb_Test_1 and $10) <> $10
   then FormPCB.Label45.Font.Color := clRed
   else FormPCB.Label45.Font.Color :=clGreen;
   if (Pcb_Test_1 and $20) <> $20
   then FormPCB.Label46.Font.Color := clRed
   else FormPCB.Label46.Font.Color :=clGreen;
   if (Pcb_Test_2 and $10) <> $10
   then FormPCB.Label47.Font.Color := clRed
   else FormPCB.Label47.Font.Color :=clGreen;
   if (Pcb_Test_2 and $20) <> $20
   then FormPCB.Label48.Font.Color := clRed
   else FormPCB.Label48.Font.Color :=clGreen;
   FormPCB.Label45.Caption:=IntToStr(VarMDT[9]);
   FormPCB.Label46.Caption:=IntToStr(VarMDT[10]);
   FormPCB.Label47.Caption:=IntToStr(VarMDT[11]);
   FormPCB.Label48.Caption:=IntToStr(VarMDT[12]);
   // Mod 2R
   if (Pcb_Test_1 and $40) <> $40
   then FormPCB.Label49.Font.Color := clRed
   else FormPCB.Label49.Font.Color :=clGreen;
   if (Pcb_Test_1 and $80) <> $80
   then FormPCB.Label50.Font.Color := clRed
   else FormPCB.Label50.Font.Color :=clGreen;
   if (Pcb_Test_2 and $40) <> $40
   then FormPCB.Label51.Font.Color := clRed
   else FormPCB.Label51.Font.Color :=clGreen;
   if (Pcb_Test_2 and $80) <> $80
   then FormPCB.Label52.Font.Color := clRed
   else FormPCB.Label52.Font.Color :=clGreen;
   FormPCB.Label49.Caption:=IntToStr(VarMDT[13]);
   FormPCB.Label50.Caption:=IntToStr(VarMDT[14]);
   FormPCB.Label51.Caption:=IntToStr(VarMDT[15]);
   FormPCB.Label52.Caption:=IntToStr(VarMDT[16]);
   // DifT
   if (Pcb_Test_3 and $01) <> $01
   then FormPCB.Label53.Font.Color := clRed
   else FormPCB.Label53.Font.Color :=clGreen;
   if (Pcb_Test_3 and $02) <> $02
   then FormPCB.Label54.Font.Color := clRed
   else FormPCB.Label54.Font.Color :=clGreen;
   FormPCB.Label53.Caption:=IntToStr(VarMDT[25]);
   FormPCB.Label54.Caption:=IntToStr(VarMDT[26]);
   // DifF
   if (Pcb_Test_3 and $04) <> $04
   then FormPCB.Label57.Font.Color := clRed
   else FormPCB.Label57.Font.Color :=clGreen;
   if (Pcb_Test_3 and $08) <> $08
   then FormPCB.Label58.Font.Color := clRed
   else FormPCB.Label58.Font.Color :=clGreen;
   FormPCB.Label57.Caption:=IntToStr(VarMDT[29]);
   FormPCB.Label58.Caption:=IntToStr(VarMDT[30]);
   // DifR
   if (Pcb_Test_3 and $10) <> $10
   then FormPCB.Label55.Font.Color := clRed
   else FormPCB.Label55.Font.Color :=clGreen;
   if (Pcb_Test_3 and $20) <> $20
   then FormPCB.Label56.Font.Color := clRed
   else FormPCB.Label56.Font.Color :=clGreen;
   FormPCB.Label55.Caption:=IntToStr(VarMDT[31]);
   FormPCB.Label56.Caption:=IntToStr(VarMDT[32]);

   if Tip_Block >= 8 then
   begin
     GroupBox140.Visible:=true;
     GroupBox141.Visible:=true;
      // PK
     if (Pcb_Test_3 and $40) <> $40
     then FormPCB.Label86.Font.Color := clRed
     else FormPCB.Label86.Font.Color :=clGreen;
     FormPCB.Label86.Caption:=IntToStr(VarMDT[17]);//(PK_On_Val);
     if (Pcb_Test_3 and $80) <> $80
     then FormPCB.Label87.Font.Color := clRed
     else FormPCB.Label87.Font.Color :=clGreen;
     FormPCB.Label87.Caption:=IntToStr(VarMDT[18]);//(DBR_Off_Val);
     // Trailer P
     if (Pcb_Test_8 and $80) <> $80
     then FormPCB.Label85.Font.Color := clRed
     else FormPCB.Label85.Font.Color :=clGreen;
     FormPCB.Label85.Caption:=IntToStr(TrailerPress);  //IIntToStr(VarMDT[18]);
   end
   else
   begin
     GroupBox140.Visible:=False;
     GroupBox141.Visible:=False;
   end;

   if Tip_Block < 8 then
   begin
   // PA_ADC_PWR
   if (Pcb_Test_4 and $40) <> $40
   then FormPCB.Label59.Font.Color := clRed
   else FormPCB.Label59.Font.Color :=clGreen;
   FormPCB.Label59.Caption:=IntToStr(PA_ADC_PWR);
   //Sila
   if (Pcb_Test_4 and $01) <> $01
   then FormPCB.Label60.Font.Color := clRed
   else FormPCB.Label60.Font.Color :=clGreen;
   FormPCB.Label60.Caption:=IntToStr(ADCData[14]);
   //Kl15
   if (Pcb_Test_4 and $02) <> $02
   then FormPCB.Label61.Font.Color := clRed
   else FormPCB.Label61.Font.Color :=clGreen;
   FormPCB.Label61.Caption:=IntToStr(ADCData[6]);
   // Pcb_Test_6
   if (Pcb_Test_6 and $01) = $01
   then FormPCB.Label63.Font.Color := clRed
   else FormPCB.Label63.Font.Color :=clGreen;
   FormPCB.Label63.Caption:=IntToStr(ADCData[22]);
   if (Pcb_Test_6 and $02) = $02
   then FormPCB.Label62.Font.Color := clRed
   else FormPCB.Label62.Font.Color :=clGreen;
   FormPCB.Label62.Caption:=IntToStr(ADCData[15]);
   if (Pcb_Test_6 and $04) = $04
   then FormPCB.Label64.Font.Color := clRed
   else FormPCB.Label64.Font.Color :=clGreen;
   FormPCB.Label64.Caption:=IntToStr(ADCData[15]);
   if (Pcb_Test_6 and $08) = $08
   then FormPCB.Label65.Font.Color := clRed
   else FormPCB.Label65.Font.Color :=clGreen;
   FormPCB.Label65.Caption:=IntToStr(ADCData[23]);
   // Gnd WL
   if (Pcb_Test_4 and $20) <> $20
   then FormPCB.Label66.Font.Color := clRed
   else FormPCB.Label66.Font.Color :=clGreen;
   FormPCB.Label66.Caption:=IntToStr(ADCData[7]);
   // Stop
   FormPCB.Label67.Caption:=IntToStr(ADCData[5]);
   // WL
   FormPCB.Label68.Font.Color :=clGreen;
   FormPCB.Label68.Caption:=IntToStr(WL_On_Val);
   if (Pcb_Test_4 and $04) <> $04
   then FormPCB.Label69.Font.Color := clRed
   else FormPCB.Label69.Font.Color :=clGreen;
   FormPCB.Label69.Caption:=IntToStr(WL_Off_Val);
   // LASR
   FormPCB.Label70.Font.Color :=clGreen;
   FormPCB.Label70.Caption:=IntToStr(LASR_On_Val);
   if (Pcb_Test_4 and $08) <> $08
   then FormPCB.Label72.Font.Color := clRed
   else FormPCB.Label72.Font.Color :=clGreen;
   FormPCB.Label72.Caption:=IntToStr(LASR_Off_Val);
   // DBR
   FormPCB.Label73.Font.Color :=clGreen;
   FormPCB.Label73.Caption:=IntToStr(DBR_On_Val);
   if (Pcb_Test_4 and $10) <> $10
   then FormPCB.Label74.Font.Color := clRed
   else FormPCB.Label74.Font.Color :=clGreen;
   FormPCB.Label74.Caption:=IntToStr(DBR_Off_Val);
   end
   else  // блок v8
   begin
   //Sila
   if (Pcb_Test_4 and $01) <> $01
   then FormPCB.Label60.Font.Color := clRed
   else FormPCB.Label60.Font.Color :=clGreen;
   FormPCB.Label60.Caption:=IntToStr(VarMDT[27]);
   //Kl15
   if (Pcb_Test_4 and $02) <> $02
   then FormPCB.Label61.Font.Color := clRed
   else FormPCB.Label61.Font.Color :=clGreen;
   FormPCB.Label61.Caption:=IntToStr(VarMDT[28]);
   // Stop P
   if (Pcb_Test_8 and $40) <> $40
   then FormPCB.Label67.Font.Color := clRed
   else FormPCB.Label67.Font.Color :=clGreen;
   FormPCB.Label67.Caption:=IntToStr(Pcb_Test_BrPS_Val);//BrakeDemand);  //IntToStr(VarMDT[17]);
   // WL
   FormPCB.Label68.Font.Color :=clGreen;
   FormPCB.Label68.Caption:=IntToStr(VarMDT[19]);//(WL_On_Val);
   if (Pcb_Test_4 and $04) <> $04
   then FormPCB.Label69.Font.Color := clRed
   else FormPCB.Label69.Font.Color :=clGreen;
   FormPCB.Label69.Caption:=IntToStr(VarMDT[20]);//(WL_Off_Val);
   // LASR
   FormPCB.Label70.Font.Color :=clGreen;
   FormPCB.Label70.Caption:=IntToStr(VarMDT[21]);//(LASR_On_Val);
   if (Pcb_Test_4 and $08) <> $08
   then FormPCB.Label72.Font.Color := clRed
   else FormPCB.Label72.Font.Color :=clGreen;
   FormPCB.Label72.Caption:=IntToStr(VarMDT[22]);//(LASR_Off_Val);
   // DBR
   FormPCB.Label73.Font.Color :=clGreen;
   FormPCB.Label73.Caption:=IntToStr(VarMDT[23]);//(DBR_On_Val);
   if (Pcb_Test_4 and $10) <> $10
   then FormPCB.Label74.Font.Color := clRed
   else FormPCB.Label74.Font.Color :=clGreen;
   FormPCB.Label74.Caption:=IntToStr(VarMDT[24]);//(DBR_Off_Val);
   end;
  end;
end;

procedure TFormPCB.PCB_Test;
Var Loop :Integer;
begin
  if Com_Connected_F then
  begin
  // Pcb_Test пошел с 6 версии
  if Pcb_Test_Read_Cmpl then
  begin
    Pcb_Test_Read_Cmpl:=False;
    if Tip_Block < 8 then
    begin
      Pcb_Test_6:= 0;
      if Form1.Label97.Caption = 'включен' then Pcb_Test_6:= Pcb_Test_6 or $01; //ABS
      if Form1.Label125.Caption ='включен' then Pcb_Test_6:= Pcb_Test_6 or $02; //ASR
      if Form1.Label191.Caption ='включен' then Pcb_Test_6:= Pcb_Test_6 or $04; //TSET
      if Form1.Label124.Caption ='включен' then Pcb_Test_6:= Pcb_Test_6 or $08; //DIA
      For Loop:=0 to 16 do
       if Active_Errors_Array[Loop] <> 0 then Pcb_Test_6:= Pcb_Test_6 or $10; // Errors
      if (((Active_Errors_Array[22] and $7F) <> 0) or // s_SAS_Error
          ((Active_Errors_Array[23] and $7F) <> 0) or // s_AGS_Error
           (Active_Errors_Array[25] <> 0))            // s_Press_Error
      then Pcb_Test_6:= Pcb_Test_6 or $20;
    end;

    FormPCB.Edit415.Text:=IntToStr(Pcb_Test_1);
    FormPCB.Edit416.Text:=IntToStr(Pcb_Test_2);
    FormPCB.Edit417.Text:=IntToStr(Pcb_Test_3);
    FormPCB.Edit418.Text:=IntToStr(Pcb_Test_4);
    FormPCB.Edit419.Text:=IntToStr(Pcb_Test_5);
    FormPCB.Edit420.Text:=IntToStr(Pcb_Test_6);
    FormPCB.Edit421.Text:=IntToStr(Pcb_Test_7);
    FormPCB.Edit422.Text:=IntToStr(Pcb_Test_8);
    FormPCB.Edit1.Text:=IntToStr(Pcb_Test_9);

    if Tip_Block < 8 then
    begin
      PcbT3:=63; // нет PK
      if StrToInt(V_PO_DZ) < 5
      then PcbT4:=63  // нет PA_PWR  CAN_j1939
      else PcbT4:=255;
      if StrToInt(V_PO_STM) < 6
      then PcbT8:=15  // нет CANS MC3 BrakePS TrailerPS
      else PcbT8:=255;
    end
    else
    begin
      PcbT3:=255;
      PcbT4:=255;
      PcbT8:=255;
    end;
    if Form1.CheckBox327.Checked
    then Form1.Edit373.Visible:=True
    else Form1.Edit373.Visible:=False;

    if (Pcb_Test_1 = 255) and
       (Pcb_Test_2 = 255) and
       (Pcb_Test_3 = PcbT3) and
       (Pcb_Test_4 = PcbT4) and
       (Pcb_Test_5 = 255) and
       (Pcb_Test_6 = 0) and
       (Pcb_Test_8 = PcbT8) then
    begin
        FormPCB.Edit423.Color:=clMoneyGreen;
        FormPCB.Edit423.Text:='Исправен';
        Form1.Edit373.Color:=clMoneyGreen; //clAqua
        Form1.Edit373.Text:='Pcb Ok';
    end
    else
    begin
        FormPCB.Edit423.Color:=clRed;
        FormPCB.Edit423.Text:='Не Исправен';
        Form1.Edit373.Color:=clRed;
        Form1.Edit373.Text:='Pcb Fail';
    end;

//    begin
         // Pcb_Test_1
        if (Pcb_Test_1 and $01) <> $01
          then FormPCB.Label15.Caption := 'Fail M0AV_On'
          else FormPCB.Label15.Caption := '';
        if (Pcb_Test_1 and $02) <> $02
          then FormPCB.Label16.Caption := 'Fail M0AV_Off'
          else FormPCB.Label16.Caption := '';
        if (Pcb_Test_1 and $04) <> $04
          then FormPCB.Label17.Caption := 'Fail M1AV_On'
          else FormPCB.Label17.Caption := '';
        if (Pcb_Test_1 and $08) <> $08
          then FormPCB.Label18.Caption := 'Fail M1AV_Off'
          else FormPCB.Label18.Caption := '';
        if (Pcb_Test_1 and $10) <> $10
          then FormPCB.Label19.Caption := 'Fail M2AV_On'
          else FormPCB.Label19.Caption := '';
        if (Pcb_Test_1 and $20) <> $20
          then FormPCB.Label20.Caption := 'Fail M2AV_Off'
          else FormPCB.Label20.Caption := '';
        if (Pcb_Test_1 and $40) <> $40
          then FormPCB.Label21.Caption := 'Fail M3AV_On'
          else FormPCB.Label21.Caption := '';
        if (Pcb_Test_1 and $80) <> $80
          then FormPCB.Label22.Caption := 'Fail M3AV_Off'
          else FormPCB.Label22.Caption := '';
         // Pcb_Test_2
        if (Pcb_Test_2 and $01) <> $01
          then FormPCB.Label23.Caption := 'Fail M0EV_On'
          else FormPCB.Label23.Caption := '';
        if (Pcb_Test_2 and $02) <> $02
          then FormPCB.Label24.Caption := 'Fail M0EV_Off'
          else FormPCB.Label24.Caption := '';
        if (Pcb_Test_2 and $04) <> $04
          then FormPCB.Label25.Caption := 'Fail M1EV_On'
          else FormPCB.Label25.Caption := '';
        if (Pcb_Test_2 and $08) <> $08
          then FormPCB.Label26.Caption := 'Fail M1EV_Off'
          else FormPCB.Label26.Caption := '';
        if (Pcb_Test_2 and $10) <> $10
          then FormPCB.Label27.Caption := 'Fail M2EV_On'
          else FormPCB.Label27.Caption := '';
        if (Pcb_Test_2 and $20) <> $20
          then FormPCB.Label28.Caption := 'Fail M2EV_Off'
          else FormPCB.Label28.Caption := '';
        if (Pcb_Test_2 and $40) <> $40
          then FormPCB.Label29.Caption := 'Fail M3EV_On'
          else FormPCB.Label29.Caption := '';
        if (Pcb_Test_2 and $80) <> $80
          then FormPCB.Label30.Caption := 'Fail M3EV_Off'
          else FormPCB.Label30.Caption := '';
         // Pcb_Test_3
        if (Pcb_Test_3 and $01) <> $01
          then FormPCB.Label9.Caption := 'Fail DifT On'
          else FormPCB.Label9.Caption := '';
        if (Pcb_Test_3 and $02) <> $02
          then FormPCB.Label10.Caption := 'Fail DifT Off'
          else FormPCB.Label10.Caption := '';
        if (Pcb_Test_3 and $04) <> $04
          then FormPCB.Label11.Caption := 'Fail DifF On'
          else FormPCB.Label11.Caption := '';
        if (Pcb_Test_3 and $08) <> $08
          then FormPCB.Label12.Caption := 'Fail DifF Off'
          else FormPCB.Label12.Caption := '';
        if (Pcb_Test_3 and $10) <> $10
          then FormPCB.Label13.Caption := 'Fail DifR On'
          else FormPCB.Label13.Caption := '';
        if (Pcb_Test_3 and $20) <> $20
          then FormPCB.Label14.Caption := 'Fail DifR Off'
          else FormPCB.Label14.Caption := '';
        if Tip_Block > 6 then
        begin
        if (Pcb_Test_3 and $40) <> $40
          then FormPCB.Label88.Caption := 'Fail PK On'
          else FormPCB.Label88.Caption := '';
        if (Pcb_Test_3 and $80) <> $80
          then FormPCB.Label89.Caption := 'Fail PK Off'
          else FormPCB.Label89.Caption := '';
        end
        else
        begin
          FormPCB.Label88.Caption := '';
          FormPCB.Label89.Caption := '';
        end;
         // Pcb_Test_4
        if (Pcb_Test_4 and $01) <> $01
          then FormPCB.Label646.Caption := 'Fail Sila'
          else FormPCB.Label646.Caption := '';
        if (Pcb_Test_4 and $02) <> $02
          then FormPCB.Label647.Caption := 'Fail Kl15'
          else FormPCB.Label647.Caption := '';
        if (Pcb_Test_4 and $04) <> $04
          then FormPCB.Label648.Caption := 'Fail WL'
          else FormPCB.Label648.Caption := '';
        if (Pcb_Test_4 and $08) <> $08
          then FormPCB.Label649.Caption := 'Fail LASR'
          else FormPCB.Label649.Caption := '';
        if (Pcb_Test_4 and $10) <> $10
          then FormPCB.Label650.Caption := 'Fail DBR'
          else FormPCB.Label650.Caption := '';
        if (Pcb_Test_4 and $20) <> $20
          then FormPCB.Label651.Caption := 'Fail GndWL'
          else FormPCB.Label651.Caption := '';
        if PcbT4 =255 then
        begin
        if (Pcb_Test_4 and $40) <> $40
          then FormPCB.Label652.Caption := 'Fail PA_PWR'
          else FormPCB.Label652.Caption := '';
        if (Pcb_Test_4 and $80) <> $80
          then FormPCB.Label653.Caption := 'Fail CAN_j1939'
          else FormPCB.Label653.Caption := '';
        end
        else
        begin
          FormPCB.Label652.Caption := '';
          FormPCB.Label653.Caption := '';
        end;
        // Pcb_Test_5
        if (Pcb_Test_5 and $01) <>  $01
          then FormPCB.Label1.Caption := 'Fail W0.1_U0'
          else FormPCB.Label1.Caption := '';
        if (Pcb_Test_5 and $02) <>  $02
          then FormPCB.Label2.Caption := 'Fail W1.1_U0'
          else FormPCB.Label2.Caption := '';
        if (Pcb_Test_5 and $04) <>  $04
          then FormPCB.Label3.Caption := 'Fail W2.1_U0'
          else FormPCB.Label3.Caption := '';
        if (Pcb_Test_5 and $08) <>  $08
          then FormPCB.Label4.Caption := 'Fail W3.1_U0'
          else FormPCB.Label4.Caption := '';
        if (Pcb_Test_5 and $10) <>  $10
          then FormPCB.Label5.Caption := 'Fail W0.2_U0'
          else FormPCB.Label5.Caption := '';
        if (Pcb_Test_5 and $20) <>  $20
          then FormPCB.Label6.Caption := 'Fail W1.2_U0'
          else FormPCB.Label6.Caption := '';
        if (Pcb_Test_5 and $40) <>  $40
          then FormPCB.Label7.Caption := 'Fail W2.2_U0'
          else FormPCB.Label7.Caption := '';
        if (Pcb_Test_5 and $80) <>  $80
          then FormPCB.Label8.Caption := 'Fail W3.2_U0'
          else FormPCB.Label8.Caption := '';

         // Pcb_Test_6
        if (Pcb_Test_6 and $01) = $01
          then FormPCB.Label31.Caption := 'Fail SW ABS'
          else FormPCB.Label31.Caption := '';
        if (Pcb_Test_6 and $02) = $02
          then FormPCB.Label32.Caption := 'Fail SW ASR'
          else FormPCB.Label32.Caption := '';
        if (Pcb_Test_6 and $04) = $04
          then FormPCB.Label33.Caption := 'Fail SW TSET'
          else FormPCB.Label33.Caption := '';
        if (Pcb_Test_6 and $08) = $08
          then FormPCB.Label34.Caption := 'Fail SW DIA'
          else FormPCB.Label34.Caption := '';
        if (Pcb_Test_6 and $10) = $10
          then FormPCB.Label35.Caption := 'Errors ABS'
          else FormPCB.Label35.Caption := '';
        if (Pcb_Test_6 and $20) = $20
          then FormPCB.Label36.Caption := 'Errors SKU'
          else FormPCB.Label36.Caption := '';

        // Pcb_Test_8
        if (Pcb_Test_8 and $01) <> $01
          then FormPCB.Label654.Caption := 'Fail PWR STM'
          else FormPCB.Label654.Caption := '';
        if (Pcb_Test_8 and $02) <> $02
          then FormPCB.Label655.Caption := 'Fail Kl15'
          else FormPCB.Label655.Caption := '';
        if (Pcb_Test_8 and $04) <> $04
          then FormPCB.Label656.Caption := 'Fail SPL'
          else FormPCB.Label656.Caption := '';
        if (Pcb_Test_8 and $08) <> $08
          then FormPCB.Label657.Caption := 'Fail CANT'
          else FormPCB.Label657.Caption := '';
        if PcbT8=255 then
        begin
        if (Pcb_Test_8 and $10) <> $10
          then FormPCB.Label658.Caption := 'Fail CANS'
          else FormPCB.Label658.Caption := '';
        if (Pcb_Test_8 and $20) <> $20
          then FormPCB.Label659.Caption := 'Fail MC3'
          else FormPCB.Label659.Caption := '';
        if (Pcb_Test_8 and $40) <> $40
          then FormPCB.Label660.Caption := 'Fail Brake PS'
          else FormPCB.Label660.Caption := '';
        if (Pcb_Test_8 and $80) <> $80
          then FormPCB.Label661.Caption := 'Fail Trailer PS'
          else FormPCB.Label661.Caption := '';
        end
        else
        begin
          FormPCB.Label658.Caption := '';
          FormPCB.Label659.Caption := '';
          FormPCB.Label660.Caption := '';
          FormPCB.Label661.Caption := '';
        end;
    end;
   end;
end;

procedure TFormPCB.Sens_Test;
Var Loop, Xpoz,Ypoz, LoopTo:Integer;
    mulK,D,Th,Tl:Extended;
    R:boolean;
begin
    if (Sen_Array[1].OscLabel = nil) or
       (not Com_Connected_F)
    then Exit
    else  
    begin
    Form1.Edit425.Visible:=True;
     if (Tip_Block > 3) then
     begin
        if Tip_Block  = 7 then mulK:=0.0131   //7
                          else mulK:=0.0194;  //5
     end
     else mulK:=1;
    if (NumCh_Block = 6) then LoopTo:=30
    else LoopTo:=20;
    For Loop:=1 to LoopTo do
    begin
     Sen_Test_Result[Loop]:=0;
     case Loop of
     //амплитуда
     1..4,23,24:
        begin
           if Tip_Block < 7 then
           begin
           Sen_Test_Data[Loop]:=(SenOscData[Loop]*19.6/1000);
           if (Sen_Test_Data[Loop] < (SenOscTest_Thresh[Loop]*1.25)) and
              (Sen_Test_Data[Loop] > (SenOscTest_Thresh[Loop]*0.75))
              then Sen_Test_Result[Loop]:=1
              else Sen_Test_Result[Loop]:=0;
           end
           else
           begin
           Sen_Test_Data[Loop]:=(SenOscData[Loop]*11.5/1000);
           if FormPCB.RadioGroup2.ItemIndex > 0 then
              begin
              if (Pcb_Test_7 and $01) = $01 then Sen_Test_Result[1]:=1;
              if (Pcb_Test_7 and $02) = $02 then Sen_Test_Result[2]:=1;
              if (Pcb_Test_7 and $04) = $04 then Sen_Test_Result[3]:=1;
              if (Pcb_Test_7 and $08) = $08 then Sen_Test_Result[4]:=1;
              end
              else
              if (Sen_Test_Data[Loop] < (SenOscTest_Thresh[Loop]*1.25)) and
              (Sen_Test_Data[Loop] > (SenOscTest_Thresh[Loop]*0.75))
              then Sen_Test_Result[Loop]:=1
              else Sen_Test_Result[Loop]:=0;
           end;
        end;
     // скорости
     5..8,21,22:
        begin
            Sen_Test_Data[Loop]:=Round(SenOscData[Loop]/2);
            if (Sen_Test_Data[Loop] = SenOscTest_Thresh[Loop])
              then Sen_Test_Result[Loop]:=1
              else Sen_Test_Result[Loop]:=0;
        end;
     // пасс тест W0_A1_U0 W0_A2_U0
     9..12,17..20,25..28:
        begin
           Sen_Test_Data[Loop]:=(SenOscData[Loop]*mulK);
           if Tip_Block < 7 then
           begin
           if (Sen_Test_Data[Loop] < (SenOscTest_Thresh[Loop]*1.15)) and
              (Sen_Test_Data[Loop] > (SenOscTest_Thresh[Loop]*0.85))
              then Sen_Test_Result[Loop]:=1
              else Sen_Test_Result[Loop]:=0;
           end
           else
           begin
              if (Pcb_Test_5 and $01) = $01 then Sen_Test_Result[9]:=1;
              if (Pcb_Test_5 and $02) = $02 then Sen_Test_Result[10]:=1;
              if (Pcb_Test_5 and $04) = $04 then Sen_Test_Result[11]:=1;
              if (Pcb_Test_5 and $08) = $08 then Sen_Test_Result[12]:=1;
              if (Pcb_Test_5 and $10) = $10 then Sen_Test_Result[17]:=1;
              if (Pcb_Test_5 and $20) = $20 then Sen_Test_Result[18]:=1;
              if (Pcb_Test_5 and $40) = $40 then Sen_Test_Result[19]:=1;
              if (Pcb_Test_5 and $80) = $80 then Sen_Test_Result[20]:=1;
           end;
        end;
     //тест биения
     13..16,29,30:
        begin
           if Tip_Block >= 7 then
               Sen_Test_Data[Loop]:=(1+SenOscData[Loop]/100)
           else
           begin
            if SenOscData[Loop] > 0 then //деление на ноль
               Sen_Test_Data[Loop]:=(1/(SenOscData[Loop]/256));
           end;
           if Tip_Block < 7 then
           begin
           if (Sen_Test_Data[Loop] < (SenOscTest_Thresh[Loop]*1.25)) and
              (Sen_Test_Data[Loop] > (SenOscTest_Thresh[Loop]*0.75))
              then Sen_Test_Result[Loop]:=1
              else Sen_Test_Result[Loop]:=0;
           end
           else
           begin
              if (Pcb_Test_7 and $10) = $10 then Sen_Test_Result[13]:=1;
              if (Pcb_Test_7 and $20) = $20 then Sen_Test_Result[14]:=1;
              if (Pcb_Test_7 and $40) = $40 then Sen_Test_Result[15]:=1;
              if (Pcb_Test_7 and $80) = $80 then Sen_Test_Result[16]:=1;
           end;
        end;
     end;

     if Sen_Test_Result[Loop] = 0
     then Sen_Array[Loop].OscLabel.Font.Color:= clRed
     else Sen_Array[Loop].OscLabel.Font.Color:= clGreen;
     Sen_Array[Loop].OscLabel.Caption:=
                          FloatToStrF(Sen_Test_Data[Loop],ffFixed, 5,2);
    end;

   if (NumCh_Block = 6) then
   begin
      R:= true;
      For Loop:=1 to 30 do
      if Sen_Test_Result[Loop] = 0 then R:= False;
   end
   else
   begin
      R:= true;
      For Loop:=1 to 20 do
      if Sen_Test_Result[Loop] = 0 then R:= False;
   end;
   if  R then
   begin
      FormPCB.Edit425.Color:=clMoneyGreen;
      FormPCB.Edit425.Text:='Ok';
   end
   else
   begin
      FormPCB.Edit425.Color:=clRed;
      FormPCB.Edit425.Text:='False';
   end;
  end;
end;

procedure TFormPCB.FormShow(Sender: TObject);
begin
     FormPCB.RadioGroup2.ItemIndex:=DiagIni.ReadInteger('Stend_PCB','Type',0);
     FormPCB.RadioGroup2Click(nil);
        Sen_Array[1].OscLabel:=FormPCB.Label71;
        Sen_Array[2].OscLabel:=FormPCB.Label75;
        Sen_Array[3].OscLabel:=FormPCB.Label76;
        Sen_Array[4].OscLabel:=FormPCB.Label77;
        Sen_Array[5].OscLabel:=FormPCB.Label78;
        Sen_Array[6].OscLabel:=FormPCB.Label79;
        Sen_Array[7].OscLabel:=FormPCB.Label80;
        Sen_Array[8].OscLabel:=FormPCB.Label102;
        Sen_Array[9].OscLabel:=FormPCB.Label110;
        Sen_Array[10].OscLabel:=FormPCB.Label111;
        Sen_Array[11].OscLabel:=FormPCB.Label112;
        Sen_Array[12].OscLabel:=FormPCB.Label170;
        Sen_Array[13].OscLabel:=FormPCB.Label183;
        Sen_Array[14].OscLabel:=FormPCB.Label184;
        Sen_Array[15].OscLabel:=FormPCB.Label185;
        Sen_Array[16].OscLabel:=FormPCB.Label186;
        Sen_Array[17].OscLabel:=FormPCB.Label175;
        Sen_Array[18].OscLabel:=FormPCB.Label176;
        Sen_Array[19].OscLabel:=FormPCB.Label177;
        Sen_Array[20].OscLabel:=FormPCB.Label178;
  {
        Sen_Array[1].OscLabel.Font.Color:=FormPCB.Label71.Font.Color;
        Sen_Array[2].OscLabel.Font.Color:=FormPCB.Label75.Font.Color;
        Sen_Array[3].OscLabel.Font.Color:=FormPCB.Label76.Font.Color;
        Sen_Array[4].OscLabel.Font.Color:=FormPCB.Label77.Font.Color;
        Sen_Array[5].OscLabel.Font.Color:=FormPCB.Label78.Font.Color;
        Sen_Array[6].OscLabel.Font.Color:=FormPCB.Label79.Font.Color;
        Sen_Array[7].OscLabel.Font.Color:=FormPCB.Label80.Font.Color;
        Sen_Array[8].OscLabel.Font.Color:=FormPCB.Label102.Font.Color;
        Sen_Array[9].OscLabel.Font.Color:=FormPCB.Label110.Font.Color;
        Sen_Array[10].OscLabel.Font.Color:=FormPCB.Label111.Font.Color;
        Sen_Array[11].OscLabel.Font.Color:=FormPCB.Label112.Font.Color;
        Sen_Array[12].OscLabel.Font.Color:=FormPCB.Label170.Font.Color;
        Sen_Array[13].OscLabel.Font.Color:=FormPCB.Label183.Font.Color;
        Sen_Array[14].OscLabel.Font.Color:=FormPCB.Label184.Font.Color;
        Sen_Array[15].OscLabel.Font.Color:=FormPCB.Label185.Font.Color;
        Sen_Array[16].OscLabel.Font.Color:=FormPCB.Label186.Font.Color;
        Sen_Array[17].OscLabel.Font.Color:=FormPCB.Label175.Font.Color;
        Sen_Array[18].OscLabel.Font.Color:=FormPCB.Label176.Font.Color;
        Sen_Array[19].OscLabel.Font.Color:=FormPCB.Label177.Font.Color;
        Sen_Array[20].OscLabel.Font.Color:=FormPCB.Label178.Font.Color;
 }

        Sen_Array[21].OscLabel:=FormPCB.Label215;
        Sen_Array[22].OscLabel:=FormPCB.Label216;
        Sen_Array[23].OscLabel:=FormPCB.Label217;
        Sen_Array[24].OscLabel:=FormPCB.Label218;
        Sen_Array[25].OscLabel:=FormPCB.Label219;
        Sen_Array[26].OscLabel:=FormPCB.Label220;
        Sen_Array[27].OscLabel:=FormPCB.Label221;
        Sen_Array[28].OscLabel:=FormPCB.Label222;
        Sen_Array[29].OscLabel:=FormPCB.Label223;
        Sen_Array[30].OscLabel:=FormPCB.Label224;
   if (NumCh_Block <> 6) then
   begin
      FormPCB.Label90.Visible:=False;
      FormPCB.Label91.Visible:=False;
      FormPCB.Label215.Visible:=False;
      FormPCB.Label216.Visible:=False;
      FormPCB.Label217.Visible:=False;
      FormPCB.Label218.Visible:=False;
      FormPCB.Label219.Visible:=False;
      FormPCB.Label220.Visible:=False;
      FormPCB.Label221.Visible:=False;
      FormPCB.Label222.Visible:=False;
      FormPCB.Label223.Visible:=False;
      FormPCB.Label224.Visible:=False;
      FormPCB.Label632.Visible:=False;
      FormPCB.Label633.Visible:=False;
      FormPCB.Label634.Visible:=False;
      FormPCB.Label635.Visible:=False;
      FormPCB.Label636.Visible:=False;
      FormPCB.Label637.Visible:=False;
      FormPCB.Label638.Visible:=False;
      FormPCB.Label639.Visible:=False;
   end;
end;

procedure TFormPCB.RadioGroup2Click(Sender: TObject);
var
  Loop: Integer;
begin
   case (FormPCB.RadioGroup2.ItemIndex)  of
   0:   begin
         For Loop:=1 to 30 do
         SenOscTest_Thresh[Loop]:=DiagIni.ReadFloat('PcbSS_Test_Result',
                                                       IntToStr(Loop),0);
        end;
   1:   begin
         For Loop:=1 to 30 do
         SenOscTest_Thresh[Loop]:=DiagIni.ReadFloat('PcbSS_Test_Result1',
                                                       IntToStr(Loop),0);
        end;
   2:   begin
         For Loop:=1 to 30 do
         SenOscTest_Thresh[Loop]:=DiagIni.ReadFloat('PcbSS_Test_Result2',
                                                       IntToStr(Loop),0);
        end;
   end;
   DiagIni.WriteInteger('Stend_PCB','Type',FormPCB.RadioGroup2.ItemIndex);
end;

end.
