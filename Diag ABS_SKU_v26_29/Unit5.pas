unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm5 = class(TForm)
    Memo4: TMemo;
    Memo3: TMemo;
    Procedure LoadATMELMEMO;
    Procedure LoadMotoMemo;
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation
uses mainABSdiag;
{$R *.DFM}




Procedure TForm5.LoadMotoMemo;
Var
    TestString,TempString:String;
    RamStart,RamAdr,TempInt,Loop,cnt:Integer;

begin
        RamStart:=0;
        cnt:=0;
    Repeat
    TestString:=Form5.memo4.Lines.Strings[cnt];
    Inc(cnt);
        If Pos('RamStart',TestString)<>0 then
        begin
                RamStart:=Pos('$',TestString);
                Delete(TestString,1,RamStart-1);
                RamStart:=StrToInt(TestString);
        end;
    Until RamStart<>0;
    Repeat
    TestString:=Form5.memo4.Lines.Strings[cnt];
    Inc(cnt);
    Until Pos('RamStart',TestString)<>0;
        Form1.MotoGridOss.RowCount:=0;
        RamAdr:=0;
    Repeat
    TestString:=Form5.memo4.Lines.Strings[cnt];
    Inc(cnt);
       If (Pos(' ',TestString)<>1) and (Pos(';',TestString)<>1) and (Length(TestString)<>0)  then
                begin
                        TempString:=TestString;
                        Delete(TestString,Pos(' ',TestString),Length(TestString)-Pos(' ',TestString)+1);
                        Delete(TempString,1,Pos(' ds ',TempString));
                        Delete(TempString,1,2);
                        Repeat
                                Delete(TempString,1,1);
                                TempInt:=Pos(' ',TempString);
                        Until TempInt<>1;
                        Delete(TempString,TempInt,Length(TempString)-TempInt+1);
                        If Pos('T',TempString)<>0 then
                        Delete(TempString,Length(TempString),1);
                        TempInt:=StrToInt(TempString);

    if TestString ='ABS_System_F' then AdrLamp:=RamAdr+RamStart;
    if TestString ='ASR_PWM' then AdrPWM:=RamAdr+RamStart;
    if TestString ='SPI_In_Buff' then AdrSPI_In_Buff:=RamAdr+RamStart;
    if TestString ='Runaway_0' then AdrRunaway_0:=RamAdr+RamStart;
    if TestString ='AN_Pressure' then AdrStop:=RamAdr+RamStart;
    if TestString ='AT_Status' then ATStatus:=RamAdr+RamStart;
    if TestString ='Weel0_Error_Reg0' then Weel0_Error_Reg0:=RamAdr+RamStart;
    if TestString ='W0_Presure_C' then W0_Presure_C:=RamAdr+RamStart;
                        If   TempInt>1 then
                        For     Loop:=1 to TempInt do
                        begin
                                MotoRam[RamAdr]:=RamAdr+RamStart;
                                Form1.MotoGridOss.Cells[0,Form1.MotoGridOss.RowCount-1]:=TestString+'_'+IntToStr(Loop);
                                Form1.MotoGridOss.RowCount:=Form1.MotoGridOss.RowCount+1;
                                RamAdr:=RamAdr+1;
                        End else
                        begin
                                MotoRam[RamAdr]:=RamAdr+RamStart;
                                Form1.MotoGridOss.Cells[0,Form1.MotoGridOss.RowCount-1]:=TestString;
                                Form1.MotoGridOss.RowCount:=Form1.MotoGridOss.RowCount+1;
                                RamAdr:=RamAdr+1;
                        end;
                end;
  Until  TestString = ';END_RAM';
end;

Procedure TForm5.LoadATMELMEMO;
Var
    TestString,TempString:String;
    Num1,TempInt,Loop:Integer;

begin
    Form1.ATMEL_EPROM.RowCount:=0;
    Form1.RAM_adr.RowCount:=0;
    Num1:=0;

//заполнение ATMEL_EPROM.Cells
  Repeat
  TestString:=Form5.memo3.Lines.Strings[Num1];
  if Length(TestString)=0 then EpromCon[Num1]:=' '
                          else EpromCon[Num1]:=TestString;
  Inc(Num1);
  if (Pos(' EQU ',TestString)<>0) or (Pos(' equ ',TestString)<>0)
  then   begin
  EpromConIndex[Form1.ATMEL_EPROM.RowCount]:=Num1-1;
  if (Pos(' EQU ',TestString)<>0)
  then TempString:=Copy(TestString,0,Pos(' EQU ',TestString))
  else TempString:=Copy(TestString,0,Pos(' equ ',TestString));
  Delete(TempString,Pos(' ',TempString),Length(TempString)-
                                       Pos(' ',TempString)+1);
   Form1.ATMEL_EPROM.Cells[0,Form1.ATMEL_EPROM.RowCount]:=TempString;
  if (Pos(' EQU ',TestString)<>0)
  then  TempString:=Copy(TestString,Pos(' EQU',TestString)+4,Length(TestString))
  else  TempString:=Copy(TestString,Pos(' equ',TestString)+4,Length(TestString));
  loop:=1;
  repeat Inc(loop) until  Copy(TempString,loop,1)<>' ';
  TempInt:=loop;
  repeat Inc(loop) until  (Copy(TempString,loop,1)=' ') or
                          (Copy(TempString,loop,1)=';') or
                          (loop=Length(TempString)+1) ;
  TempString:=Copy(TempString,TempInt,loop-TempInt);
  Form1.ATMEL_EPROM.Cells[1,Form1.ATMEL_EPROM.RowCount]:=TempString;
  if Pos(';',TestString)<>0 then begin
  TempString:=Copy(TestString,Pos(';',TestString),
  Length(TestString)-Pos(';',TestString)+1);
  Form1.ATMEL_EPROM.Cells[2,Form1.ATMEL_EPROM.RowCount]:=TempString;
                                 end;
  Form1.ATMEL_EPROM.RowCount:=Form1.ATMEL_EPROM.RowCount+1;
  end
  else if Pos(';',TestString)<>0 then
  begin
  EpromConIndex[Form1.ATMEL_EPROM.RowCount]:=Num1-1;
  Form1.ATMEL_EPROM.Cells[0,Form1.ATMEL_EPROM.RowCount]:=TestString;
  Form1.ATMEL_EPROM.RowCount:=Form1.ATMEL_EPROM.RowCount+1;
  end;
  Until TestString = ';ADR EEPROM';// EOF(IncFile);
  EpromConSize:=Num1;
  Form1.ATMEL_EPROM.RowCount:=Form1.ATMEL_EPROM.RowCount-1;
  for loop:=0 to Form1.ATMEL_EPROM.RowCount do EpromName[loop]:='';
  for loop:=0 to Form1.ATMEL_EPROM.RowCount do EpromData[loop]:='';
  EpromAdr:='';

  //считываем остаток файла в string EpromAdr
  Repeat
    TestString:=Form5.memo3.Lines.Strings[Num1];
    Inc(Num1);
    EpromAdr:=Concat(EpromAdr,TestString,#13,#10);
  Until  TestString = ';BEGIN_RAM';

  Repeat
    TestString:=Form5.memo3.Lines.Strings[Num1];
    Inc(Num1);
  if (Pos(' EQU ',TestString)<>0) or (Pos(' equ ',TestString)<>0)
  then   begin
  if (Pos(' EQU ',TestString)<>0)


    then TempString:=Copy(TestString,1,Pos(' EQU ',TestString))
    else TempString:=Copy(TestString,1,Pos(' equ ',TestString));
  Delete(TempString,Pos(' ',TempString),Length(TempString)-
                                          Pos(' ',TempString)+1);
  Form1.RAM_adr.Cells[0,Form1.RAM_adr.RowCount-1]:=TempString;
  if (Pos(' EQU ',TestString)<>0)
  then  TempString:=Copy(TestString,Pos(' EQU',TestString)+4,Length(TestString))
  else  TempString:=Copy(TestString,Pos(' equ',TestString)+4,Length(TestString));
  loop:=1;
  repeat Inc(loop) until  Copy(TempString,loop,1)<>' ';
  TempInt:=loop;
  repeat Inc(loop) until  (Copy(TempString,loop,1)=' ') or
                          (Copy(TempString,loop,1)=';') or
                          (Copy(TempString,loop,1)='h') or
                          (Copy(TempString,loop,1)='H') or
                          (loop=Length(TempString)+1) ;

  TempString:=Copy(TempString,TempInt,loop-TempInt);
  ATMEL_RAM[Form1.RAM_adr.RowCount-1]:=StrToInt('$'+TempString);
  if Form1.RAM_adr.Cells[0,Form1.RAM_adr.RowCount-1]='TIMER_LOW' then
    AdrTIMER_LOW:=ATMEL_RAM[Form1.RAM_adr.RowCount-1];
  if Form1.RAM_adr.Cells[0,Form1.RAM_adr.RowCount-1]='CNT_Stop_SW' then
    AdrStopCNT:=ATMEL_RAM[Form1.RAM_adr.RowCount-1];
  if Form1.RAM_adr.Cells[0,Form1.RAM_adr.RowCount-1]='ADR_CNT_DIF' then
    AdrDifCNT:=ATMEL_RAM[Form1.RAM_adr.RowCount-1];
  if Form1.RAM_adr.Cells[0,Form1.RAM_adr.RowCount-1]='ADR_CNT_M1' then
    AdrMod1CNT:=ATMEL_RAM[Form1.RAM_adr.RowCount-1];
  if Form1.RAM_adr.Cells[0,Form1.RAM_adr.RowCount-1]='ADR_CNT_M2' then
    AdrMod2CNT:=ATMEL_RAM[Form1.RAM_adr.RowCount-1];
  if Form1.RAM_adr.Cells[0,Form1.RAM_adr.RowCount-1]='ADR_CNT_M3' then
    AdrMod3CNT:=ATMEL_RAM[Form1.RAM_adr.RowCount-1];
  if Form1.RAM_adr.Cells[0,Form1.RAM_adr.RowCount-1]='ADR_CNT_M4' then
    AdrMod4CNT:=ATMEL_RAM[Form1.RAM_adr.RowCount-1];
  Form1.RAM_adr.RowCount:=Form1.RAM_adr.RowCount+1;
  end;
  Until  TestString = ';END_RAM';
end;


procedure TForm5.FormCreate(Sender: TObject);
begin
     if DiagIni.ReadString('Version_DIA', 'Type_DIA', '') = 'Diag_Klient' then begin
      Form5.Visible:=false;
      Form5.LoadMotoMEMO;
      Form5.LoadATMELMEMO;
      Form1.Pol.TabVisible:= False;
      Form1.KeyButton.Visible:= False;
      Form1.KeyButton.Enabled:= False;
      Form1.Button9.Visible:= False;
      Form1.Button9.Enabled:= False;
     if DiagIni.ReadString('Version_DIA', 'DIA_DOC', '') <> '1'
      then begin
  //    Form1.BtnOtchet.Visible:= False;
  //    Form1.BtnOtchet.Enabled:= False;
           end;
     end;
end;

end.
