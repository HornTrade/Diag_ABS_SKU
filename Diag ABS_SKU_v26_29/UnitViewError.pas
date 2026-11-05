unit UnitViewError;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Math, StdCtrls ,Com_Thread,Link_Processor;

type
  TFormError = class(TForm)
    sgError: TStringGrid;
    btnDelete: TButton;
    btnQuit: TButton;
    function  PasErr(BtnPress:byte):integer;
    function  AdrPasErr(BtnPress,Bit_Num:byte):integer;
    function  CntPasErr(Byte_Num,Bit_Num:byte):integer;
    procedure FormShow(Sender: TObject);
    procedure btnQuitClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure sgErrorSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormError: TFormError;
  x : integer;
  NumBit : array[0..30] of byte;
  numbbit : byte;
  errrow : integer;
  err_str: string;
implementation

uses mainABSdiag,Link_Unit,Dump;

{$R *.DFM}
procedure NotConf;
begin
  FormError.sgError.cells[0,1] := 'Данные отсутствуют. Нет в конфигурации.';
  FormError.sgError.cells[1,1] := '        ';
  FormError.sgError.cells[2,1] := '        ';
  FormError.btnDelete.Enabled := false;
end;
procedure TFormError.FormShow(Sender: TObject);
Var
   l,Error_Num,Bit_Num  : integer;
   B_str: string;
Label conf_not;
begin
   sgError.RowCount := 2;
   sgError.FixedRows:=1;
   sgError.cells[0,0] :='Тип неисправности';
   sgError.cells[1,0] :='Повтор';
   sgError.cells[2,0] :='Время';
   Error_Num:=0;
   if not Com_Connected_F then
      begin
          sgError.cells[0,1] := 'Данные отсутствуют. Необходимо установить связь.';
          sgError.cells[1,1] := '        ';
          sgError.cells[2,1] := '        ';
          btnDelete.Enabled := false;
          Exit;
       end;
 //конфигурация
   if (Tag=16) and (not form1.CheckBox39.Checked) then
   begin
       NotConf;
       exit;
   end;
   if (Tag=11) and (not form1.CheckBox33.Checked) then
   begin
       NotConf;
       exit;
   end;
   if (Tag=10) and (not form1.CheckBox32.Checked) then
   begin
       NotConf;
       exit;
   end;
   if (Tag=14) and ((not form1.CheckBox38.Checked and
                     not form1.CheckBox49.Checked)) then
   begin
       NotConf;
       exit;
   end;
   if (Tag=13) and ((form1.RadioGroup1.ItemIndex <>2) and
            (not form1.CheckBox49.Checked)) then
   begin
       NotConf;
       exit;
   end;

   if (Image_Err_Num=Const_Image_Err_Old) and ((Tag=17) or (Tag=18)  or (Tag=19)  or (Tag=20)) then
   begin
       NotConf;
       exit;
   end;
   if ((form1.RadioGroup9.ItemIndex =2) and (Tag=21)) then     begin
       NotConf;
       exit;
   end;
   if (Tag=22) and (not form1.CheckBox82.Checked) then
   begin
       NotConf;
       exit;
   end;
   if (Tag=23) and (not form1.CheckBox54.Checked) then
   begin
       NotConf;
       exit;
   end;
   if (Tag=24) and (not form1.CheckBox85.Checked) then
   begin
       NotConf;
       exit;
   end;
   if (Tag=25) and (not form1.CheckBox83.Checked) then
   begin
       NotConf;
       exit;
   end;
   if (Tag=26) and (not form1.CheckBox84.Checked) then
   begin
       NotConf;
       exit;
   end;

   if (Active_Errors_Array[Tag] = 0) and (PasErr(Tag)=0) then
       begin
          sgError.cells[0,1] := 'Неисправности отсутствуют.';
          sgError.cells[1,1] := '        ';
          sgError.cells[2,1] := '        ';
          btnDelete.Enabled := false;
          Exit;
       end;
// перекодировка для блока HCS 6S6M
   B_str:='B'+inttostr(Tag);

// перекодировка для блока SKU_2STM 4S4M
   if (Tip_Block >= 8) then
   begin
       if (Tag=4)  then   B_str:='B29'; //  CPU
       if ((form1.RadioGroup9.ItemIndex =1) and (Tag=21))
       then  B_str:='B30'; // Dif прицепа
       if (Tag=16) then   B_str:='B31'; //  DBR
       if (Tag=12) then   B_str:='B33'; //  GND
       if (Tag=15) then   B_str:='B34'; //  Lamp
   end
   else
   begin
       if ((form1.RadioGroup9.ItemIndex =1) and (Tag=21)) then
        B_str:='B28';
   end;
   Bit_Num:=StrToInt(DiagIni.ReadString(B_str,'bit', '16'));
   Fl_ATTime:=false;
   FormISO.ErrorATLoad;
   repeat Application.ProcessMessages until Fl_ATTime;

   For l := 0 to Bit_Num
    do begin//Номер бита в анализируемом байте неисправности
     if (Active_Errors_Array[Tag] and Trunc(Power(2, l)) <> 0) then
        begin
         if  Error_Num<> 0 then  sgError.RowCount := sgError.RowCount + 1;
         Inc(Error_Num);
         sgError.Cells[0, sgError.RowCount -1 ] :=
         'Активная неисправность '+IntToStr(Error_Num)+': '
          +DiagIni.ReadString(B_str, IntToStr(l), 'Ошибка не описана');
    //     sgError.Cells[1, sgError.RowCount -1 ] :='---';
         sgError.Cells[1, sgError.RowCount -1 ] :=
         IntToStr(DumpEPROM[Adr_CntErr_H+CntPasErr(AdrPasErr(Tag,l),l)-1]);
         sgError.Cells[2, sgError.RowCount -1 ] :='---';
         NumBit[sgError.RowCount -1] :=l;
     end else
     if (PasErr(Tag) and Trunc(Power(2, l)) <> 0) then
        begin
         if  Error_Num<> 0 then  sgError.RowCount := sgError.RowCount + 1;
         Inc(Error_Num);
         sgError.Cells[0, sgError.RowCount -1 ] :=
         'Пассивная неисправность '+IntToStr(Error_Num)+': '
          +DiagIni.ReadString(B_str, IntToStr(l), 'Ошибка не описана');

         sgError.Cells[1, sgError.RowCount -1 ] :=
         IntToStr(DumpEPROM[Adr_CntErr_H+CntPasErr(AdrPasErr(Tag,l),l)-1]);

         sgError.Cells[2, sgError.RowCount -1 ] :=
         FloatToStrF(({WorkTime-}DumpEPROM[Adr_TimeErr_H+AdrPasErr(Tag,l)]),ffFixed, 5,0);
         NumBit[sgError.RowCount -1] :=l;
        end;
       end;
   sgError.Row := 1 ;
   btnDelete.Enabled := false;
end;


//Закрыть форму
procedure TFormError.btnQuitClick(Sender: TObject);
begin
   Close;
end;

function TFormError.CntPasErr(Byte_Num,Bit_Num:byte):integer;
var i,k:integer;
begin
    k:=0;
    if (Tip_Block > 3) then  begin
      if Bit_Num <=7 then CntPasErr:=Byte_Num*8+Bit_Num+1
                     else CntPasErr:=Byte_Num*8+Bit_Num-7
    end
    else
    begin
      if Bit_Num <=7 then begin
      for i:=0 to Byte_Num-1 do k:=k + NumBit_ErrByte[i];
      CntPasErr:=k+(NumBit_ErrByte[Byte_Num]-(Bit_Num+1));
      end else begin
      for i:=0 to Byte_Num-1 do k:=k + NumBit_ErrByte[i];
      CntPasErr:=k+(NumBit_ErrByte[Byte_Num]-(Bit_Num-8)-1);
      end;
    end;
end;

function TFormError.AdrPasErr(BtnPress,Bit_Num:byte):integer;
begin
    AdrPasErr:=0;
   Case BtnPress of
    0: if Bit_Num <=7 then AdrPasErr:=0 else AdrPasErr:=1;//SS_1L
    1: if Bit_Num <=7 then AdrPasErr:=2 else AdrPasErr:=3;//SS_1R
    2: if Bit_Num <=7 then AdrPasErr:=4 else AdrPasErr:=5;//SS_2L
    3: if Bit_Num <=7 then AdrPasErr:=6 else AdrPasErr:=7;//SS_2R
    4: if Bit_Num <=7 then AdrPasErr:=8 else AdrPasErr:=9;//CPU
    5: AdrPasErr:=10;//Upit
    6: if Bit_Num <=7 then AdrPasErr:=11 else AdrPasErr:=12;//MD_1L
    7: if Bit_Num <=7 then AdrPasErr:=13 else AdrPasErr:=14;//MD_1К
    8: if Bit_Num <=7 then AdrPasErr:=15 else AdrPasErr:=16;//MD_2L
    9: if Bit_Num <=7 then AdrPasErr:=17 else AdrPasErr:=18;//MD_2К
    10: AdrPasErr:=19;
    11: AdrPasErr:=20;
    12: AdrPasErr:=25;
    13: AdrPasErr:=21;
    14: AdrPasErr:=22;
    15: AdrPasErr:=23;
    16: AdrPasErr:=24;
    17: if Bit_Num <=7 then AdrPasErr:=26 else AdrPasErr:=27;//SS_3L
    18: if Bit_Num <=7 then AdrPasErr:=28 else AdrPasErr:=29;//SS_3R
    19: if Bit_Num <=7 then AdrPasErr:=31 else AdrPasErr:=32;//MD_3L
    20: if Bit_Num <=7 then AdrPasErr:=33 else AdrPasErr:=34;//MD_3К
    21: if Bit_Num <=7 then AdrPasErr:=37 else AdrPasErr:=38;//MD_t
    22: AdrPasErr:=35;  //SAS
    23: AdrPasErr:=36;  //AGS
    24: AdrPasErr:=30;  //MC3
    25: AdrPasErr:=39;  //Press
    26: AdrPasErr:=40;  //CANT
   end;
end;


function TFormError.PasErr(BtnPress:byte):integer;
var i:integer;
begin
    PasErr:=0;
    if Adr_PassEr_H<2 then i:=Adr_PassEr_H else i:=0;
    Case BtnPress of
    0: PasErr:=DumpEPROM[i+0]+256*DumpEPROM[i+1];//SS_1L
    1: PasErr:=DumpEPROM[i+2]+256*DumpEPROM[i+3];//SS_1R
    2: PasErr:=DumpEPROM[i+4]+256*DumpEPROM[i+5];//SS_2L
    3: PasErr:=DumpEPROM[i+6]+256*DumpEPROM[i+7];//SS_2R
    4: PasErr:=DumpEPROM[i+8]+256*DumpEPROM[i+9];//CPU
    5: PasErr:=DumpEPROM[i+10];//Upit
    6: PasErr:=DumpEPROM[i+11]+256*DumpEPROM[i+12];//MD_1L
    7: PasErr:=DumpEPROM[i+13]+256*DumpEPROM[i+14];//MD_1К
    8: PasErr:=DumpEPROM[i+15]+256*DumpEPROM[i+16];//MD_2L
    9: PasErr:=DumpEPROM[i+17]+256*DumpEPROM[i+18];//MD_2К
    10: PasErr:=DumpEPROM[i+19];//pk
    11: PasErr:=DumpEPROM[i+20];//dif
    12: PasErr:=DumpEPROM[i+25];//gnd 25
    13: PasErr:=DumpEPROM[i+21];//can
    14: PasErr:=DumpEPROM[i+22];//b7
    15: PasErr:=DumpEPROM[i+23];//lamp
    16: PasErr:=DumpEPROM[i+24];//dbr
    17: PasErr:=DumpEPROM[i+26]+256*DumpEPROM[i+27];//SS_3L
    18: PasErr:=DumpEPROM[i+28]+256*DumpEPROM[i+29];//SS_3R
    19: PasErr:=DumpEPROM[i+31]+256*DumpEPROM[i+32];//MD_3L
    20: PasErr:=DumpEPROM[i+33]+256*DumpEPROM[i+34];//MD_3R
    21: PasErr:=DumpEPROM[i+37]+256*DumpEPROM[i+38];//MD_t
    22: PasErr:=DumpEPROM[i+35];//SAS
    23: PasErr:=DumpEPROM[i+36];//AGS
    24: PasErr:=DumpEPROM[i+30];//MC3
    25: PasErr:=DumpEPROM[i+39];//Press
    26: PasErr:=DumpEPROM[i+40];//CANT
    end;  
end;



//Удалить выделенную неисправность
procedure TFormError.btnDeleteClick(Sender: TObject);
begin
   sgError.Cells[0,errrow] :='';
   sgError.Cells[1,errrow] :='';
   sgError.Cells[2,errrow] :='';
   Case Tag of
    0..4:if numbbit < 8 then begin
             adrEPROM:=Tag*2+1;
             dataEPROM :=DumpEPROM[adrEPROM] and (not(1 shl numbbit));
             adEPROM:=adrEPROM*8+numbbit;
                        end
                        else begin
             adrEPROM:=Tag*2+2;
             adEPROM:=(adrEPROM-1)*8+numbbit;
             dataEPROM :=DumpEPROM[adrEPROM] and (not(1 shl (numbbit-8)));

                        end;
    5..50:begin
          adrEPROM:=Tag+6;
          adEPROM:=adrEPROM*8+numbbit;
          dataEPROM :=DumpEPROM[adrEPROM] and (not(1 shl numbbit));
          end;
   end;
   DumpEPROM[adrEPROM]:=dataEPROM;
   DumpEPROM[256+adEPROM]:=0;
   DumpEPROM[512+adEPROM]:=0;
   aEPROM:=adrEPROM;
   dEPROM:=dataEPROM;
   bEPROM:=adEPROM;
   FormISO.WriteATEPROM_err;
   btnDelete.Enabled := false;
end;

procedure TFormError.sgErrorSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if ARow = 0 then exit;
  numbbit :=NumBit[ARow];
  errrow:=ARow;
  if Copy(sgError.Cells[0, ARow ],1,3) ='Пас' then
                          btnDelete.Enabled := false //true
                                              else
                          btnDelete.Enabled := false;
end;

end.


