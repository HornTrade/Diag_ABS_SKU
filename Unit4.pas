unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, TeEngine, Series, ExtCtrls, TeeProcs, Chart;

type
  TForm4 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label7: TLabel;
    Label8: TLabel;
    Memo1: TMemo;
    Button3: TButton;
    Button2: TButton;
    Button1: TButton;
    Edit7: TEdit;
    Button5: TButton;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Memo2: TMemo;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button4: TButton;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    yyyyyy: TPageControl;
    TabSheet3: TTabSheet;
    Label9: TLabel;
    Label10: TLabel;
    Memo3: TMemo;
    Button7: TButton;
    Edit8: TEdit;
    Button9: TButton;
    TabSheet4: TTabSheet;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Memo4: TMemo;
    Edit10: TEdit;
    Edit11: TEdit;
    Button10: TButton;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    TabSheet5: TTabSheet;
    Button6: TButton;
    Label17: TLabel;
    Label18: TLabel;
    Edit15: TEdit;
    Memo5: TMemo;
    Button8: TButton;
    Button11: TButton;
    Edit9: TEdit;
    Label16: TLabel;
    Label19: TLabel;
    SleepSafe: TTabSheet;
    Memo6: TMemo;
    SleepSafe_Calc: TButton;
    TabSheet6: TTabSheet;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Edit20: TEdit;
    Button12: TButton;
    Chart1: TChart;
    Series1: TFastLineSeries;
    Button13: TButton;
    Edit21: TEdit;
    Label25: TLabel;
    Series2: TLineSeries;
    Series3: TLineSeries;
    Series4: TLineSeries;
    Series5: TLineSeries;
    Label26: TLabel;
    Label27: TLabel;
    Edit22: TEdit;
    Edit23: TEdit;
    procedure Button7Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure SleepSafe_CalcClick(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

//Const
//     F0=SpeedConst;//921600;//625000;
var
  Form4: TForm4;
  ccc:Real;
  T0oss,T1oss:Integer;
implementation

uses mainABSdiag;
//Const
//     F0:=SpeedConst;
{$R *.DFM}

//**********************************************
procedure TForm4.Button7Click(Sender: TObject);
Var       Data:Integer;
          Loop,Loop1:Integer;
          StrAdd:String;
          Res,a,b,c,D,x,F0,dSp,dV:Real;
          T1,T2:Integer;
          T0,T3,T4:Extended;
          TestFile:File of Byte;
          TestByte:Byte;
          FDirStr,FNameStr:String;
          sr: TSearchRec;
begin
{   FDirStr:=ExtractFilePath(Const_File);
  FNameStr:=FDirStr+'dT_Max.dat';
  if (FindFirst(FNameStr, faAnyFile, sr) <> 0) then
    begin
        Application.MessageBox( PChar('Файл dT_Max.dat не найден.'),
              'Ошибка', MB_OK+MB_ICONERROR+MB_APPLMODAL);
        exit;
    end;
    CopyFile(PChar(FNameStr),PChar(FDirStr+'dT_Max.bak'),true);
     AssignFile(TestFile,FNameStr);
     ReWrite(TestFile);
 }
     Memo3.Clear;
     a:=2*pi*8.4534*35.28*StrToFloat(Edit8.Text);
     b:=2*pi*8.4534;
     c:=-2*pi;
     F0:=StrToFloat(Edit21.Text);
     dSp:=3.6*9.81*0.005*StrToFloat(Edit8.Text);

                  Form4.Series1.Clear;
                  Form4.Series2.Clear;
                  Form4.Series3.Clear;
                  Form4.Series4.Clear;
                  Form4.Series5.Clear;
     for Loop:=0 to 150 do
     begin
          Data:=Loop;
          if Loop>0 then
          T0:=(F0/(8.4534*Loop))
          else T0:=Round(F0/(8.4534*0.01));
          D:=sqr(b*Loop)-4*a*c;
          Res:=(-b*Loop+sqrt(D))/(2*a);
          T2:=Round(Res*F0);
    // ограничение от T0
          if T2> Round(T0*StrToFloat(Edit9.Text)) then
             T2:=Round(T0*StrToFloat(Edit9.Text));
          if T2>65535 then T2:=65535;


 //New 2019
          T4:=F0/(8.4534*(Loop + dSp));
          if T4 < 5000 then T3 := 5000/T4 else T3 := 1;
          T1:=Round(F0/(8.4534*(Loop + T3*dSp)));
          if T1>65535 then T1:=65535;
        //  Loop1:=(Round(F0/(8.4534*T1)) - Loop);
        //  Loop1:=Round(1000*T0/T1);
          Loop1:=Round(1000*T0/T2);
          T2:=Round(T0/((T0/StrToFloat(Edit15.Text))+StrToFloat(Edit9.Text)));

          Memo3.SelText:='                        db';
          TestByte:=T1 div 256;
//          Write(TestFile,TestByte);
          TestByte:=T1 mod 256;
//          Write(TestFile,TestByte);
          Str((T1 div 256):7,StrAdd);
          Memo3.SelText:=StrAdd+'T,';
          Str((T1 mod 256),StrAdd);
          Memo3.SelText:=StrAdd+'T';
          Memo3.Lines.Add('');

          if Loop>3 then  begin
          T0oss:=Round(T2);
          if T0oss > 10000 then T0oss:= 10000;
          T1oss:=Round(T0);
          if T1oss > 10000 then T1oss:= 10000;
          Form4.Series1.AddXY(Loop,T1,'',Form4.Series4.LinePen.Color);
  //        Form4.Series2.AddXY(Loop,T0,'',Form4.Series5.LinePen.Color);
          Form4.Series2.AddXY(Loop,T0oss,'',Form4.Series5.LinePen.Color);
          Form4.Series3.AddXY(Loop,Loop1,'',Form4.Series2.LinePen.Color);
          Form4.Series4.AddXY(Loop,T1oss,'',Form4.Series2.LinePen.Color);
          end;
     end;
//     CloseFile(TestFile);
end;

procedure TForm4.Button9Click(Sender: TObject);
Var       Data:Integer;
          Loop,Loop1:Integer;
          StrAdd:String;
          Res,a,b,c,D,x,F0,dSp,dV:Real;
          T1,T2:Integer;
          T0,T3,T4:Extended;
          TestFile:File of Byte;
          TestByteH,TestByteL:Byte;
          FDirStr,FNameStr:String;
          sr: TSearchRec;
begin
{  FDirStr:=ExtractFilePath(Const_File);
  FNameStr:=FDirStr+'dT_Min.dat';
  if (FindFirst(FNameStr, faAnyFile, sr) <> 0) then
    begin
        Application.MessageBox( PChar('Файл dT_Min.dat не найден.'),
              'Ошибка', MB_OK+MB_ICONERROR+MB_APPLMODAL);
        exit;
    end;
  CopyFile(PChar(FNameStr),PChar(FDirStr+'dT_Min.bak'),true);
     AssignFile(TestFile,FNameStr);
     ReWrite(TestFile); }
     Memo3.Clear;  
     a:=2*pi*8.4534*35.28*StrToFloat(Edit15.Text);
     b:=2*pi*8.4534;
     c:=-2*pi;
     F0:=StrToFloat(Edit21.Text);
     dSp:=3.6*9.81*0.005*StrToFloat(Edit15.Text);
                     Form4.Series1.Clear;
                     Form4.Series2.Clear;
                     Form4.Series3.Clear;
                     Form4.Series4.Clear;
     for Loop:=1 to 150 do
     begin
               T2:=65535;
          Data:=Loop;
          if Loop>0 then  T0:=(F0/(8.4534*Loop))
          else T0:=Round(F0/(8.4534*0.01));
 {         D:=sqr(b*Loop)+4*a*c*(5000/T0);
          if D>0 then begin
          Res:=(-b*Loop+sqrt(D))/(2*a*(5000/T0));
                     T2:=Round(-Res*F0);

          end   else T2:=65535; }
          T2:=Round(T0+T0*StrToFloat(Edit22.Text));
          if T2> 65535 then   T2:=65535;

 {        if Loop > dSp then begin
    //          T4:=F0/(8.4534*(Loop - dSp));
              T4:=F0/(8.4534*Loop);
              if T4 < 5000 then T3 := 5000/T4 else T3 := 1;
        //      T3 := T4/5000;
              T1:=Round(F0/(8.4534*(Loop - T3*dSp)));
          end
          else T3 := 1;
          if Loop > dSp then T1:=Round(F0/(8.4534*(Loop - T3*dSp))) else T1:=65535; }

 //New 2019
 //         T1:=Round(T0*(StrToFloat(Edit23.Text)+StrToFloat(Edit22.Text)*(1-Loop/150)));
 //         if T1>65535 then T1:=65535;
//New 2025
          T4:=F0/(8.4534*(Loop));
          if T4 < 5000 then T3 := 5000/T4 else T3 := 1;
          T1:=Round(F0/(8.4534*(Loop - T3*dSp)));
          if T1>65535 then T1:=65535;
          if T1<0 then T1:=65535;
          T2:=Round(T0*((T0/StrToFloat(Edit8.Text))+StrToFloat(Edit9.Text)));
          if T2>65535 then T2:=65535;
          Loop1:=Round(1000*T2/T0);

          Memo3.SelText:='                        db';
          TestByteH:=T1 div 256;
//          Write(TestFile,TestByteH);
          TestByteL:=T1 mod 256;
//          Write(TestFile,TestByteL);
          Str(TestByteH:7,StrAdd);
          Memo3.SelText:=StrAdd+'T,';
          Str(TestByteL,StrAdd);
          Memo3.SelText:=StrAdd+'T';
          Memo3.Lines.Add('');

          if Loop>3 then  begin
          T0oss:=Round(T1);
          if T0oss > 40000 then T0oss:= 40000;
          T1oss:=Round(T2);
          if T1oss > 40000 then T1oss:= 40000;

          Form4.Series1.AddXY(Loop,T0oss,'',Form4.Series4.LinePen.Color);
          Form4.Series2.AddXY(Loop,T1oss,'',Form4.Series5.LinePen.Color);
          Form4.Series3.AddXY(Loop,T0,'',Form4.Series5.LinePen.Color);
          Form4.Series4.AddXY(Loop,Loop1,'',Form4.Series2.LinePen.Color);
 //         if Loop>7 then begin
 //         Form4.Series3.AddXY(Loop,T1,'',Form4.Series3.LinePen.Color);
 //         Form4.Series5.AddXY(Loop,Loop1,'',Form4.Series5.LinePen.Color);

          end;
     end;
//     CloseFile(TestFile);
end;

procedure TForm4.Button10Click(Sender: TObject);
Var Loop:Integer;
    F,K,dP:Real;
    StrAdd:String;
    Asm_T,Pmax,tmin:Integer;
    TestFile:File of Byte;
    FDirStr,FNameStr:String;
    sr: TSearchRec;
begin
  FDirStr:=ExtractFilePath(Const_File);
  FNameStr:=FDirStr+'Pump.dat';
  if (FindFirst(FNameStr, faAnyFile, sr) <> 0) then
    begin
        Application.MessageBox( PChar('Файл Pump.dat не найден.'),
              'Ошибка', MB_OK+MB_ICONERROR+MB_APPLMODAL);
        exit;
    end;
  CopyFile(PChar(FNameStr),PChar(FDirStr+'Pump.bak'),true);
     AssignFile(TestFile,FNameStr);
     ReWrite(TestFile);
     Memo4.Clear;
     K:=StrToFloat(Edit14.Text);
     Pmax:=StrToInt(Edit10.Text);
     dP:=StrToFloat(Edit11.Text)*16;
     for Loop:=1 to 128 do
     begin
          if  (Pmax-Loop-dP)>=0 then
          F:=-ln((Pmax-Loop-dP)/(Pmax-Loop))/K;
          if F<StrToInt(Edit13.Text) then F:=StrToInt(Edit13.Text);
          if F>StrToInt(Edit12.Text) then F:=StrToInt(Edit12.Text);
          Asm_T:=Round(F);
          Write(TestFile,Asm_T);
          Str(Asm_T:7,StrAdd);
          Memo4.SelText:='                        db'+StrAdd+'T';
          Memo4.Lines.Add('');
     end;
     CloseFile(TestFile);
end;

procedure TForm4.Button6Click(Sender: TObject);
var       Loop,Asm_Gap:Integer;
          F,Gap:Real;
          StrAdd:String;
          TestFile:File of Byte;
          FDirStr,FNameStr:String;
          sr: TSearchRec;
begin
  FDirStr:=ExtractFilePath(Const_File);
  FNameStr:=FDirStr+'Gap.dat';
  if (FindFirst(FNameStr, faAnyFile, sr) <> 0) then
    begin
        Application.MessageBox( PChar('Файл Gap.dat не найден.'),
              'Ошибка', MB_OK+MB_ICONERROR+MB_APPLMODAL);
        exit;
    end;
  CopyFile(PChar(FNameStr),PChar(FDirStr+'Gap.bak'),true);
//     AssignFile(TestFile,FNameStr);
//     ReWrite(TestFile);
     Memo5.Clear;
     for Loop:=1 to 150 do
     begin
          F:=Loop*8.45;
          Gap:=8.6667*Ln(F)-9.904;
          Asm_Gap:=Round(Gap);
//          Write(TestFile,Asm_Gap);
          Memo5.SelText:='   '+IntToStr(Loop);
          Memo5.SelText:='                        db';
          Str(Asm_Gap:7,StrAdd);
          Memo5.SelText:=StrAdd+'T';
          Memo5.Lines.Add('');
     end;
//     CloseFile(TestFile);
end;


procedure TForm4.Button8Click(Sender: TObject);
Var       Data:Integer;
          Loop,Loop1:Integer;
          StrAdd:String;
          Res,a,b,c,D,x,F0:Real;
          T0,T1:Integer;
          TestByte:Byte;          
          TestFile:File of Byte;
          TestByteH,TestByteL:Byte;
          FDirStr,FNameStr:String;
          sr: TSearchRec;
begin
  FDirStr:=ExtractFilePath(Const_File);
  FNameStr:=FDirStr+'dT_Min_Ch.dat';
  if (FindFirst(FNameStr, faAnyFile, sr) <> 0) then
    begin
        Application.MessageBox( PChar('Файл dT_Min_Ch.dat не найден.'),
              'Ошибка', MB_OK+MB_ICONERROR+MB_APPLMODAL);
        exit;
    end;
  CopyFile(PChar(FNameStr),PChar(FDirStr+'dT_Min_Ch.bak'),true);
     AssignFile(TestFile,FNameStr);
     ReWrite(TestFile);
     Memo3.Clear;
   //   a:=2*pi*8.4534*35.28*StrToFloat(Edit9.Text);
     a:=9.81*StrToFloat(Edit8.Text);
     c:=StrToFloat(Edit9.Text);
   //  b:=2*pi*8.4534;
   //  c:=-2*pi;
        ccc:=100/(pi*3.6*1.05);
          F0:=StrToFloat(Edit21.Text);
     for Loop:=0 to 150 do
     begin
          Data:=Loop;
          if Loop>0 then
          T0:=Round(F0/(ccc*Loop))
          else T0:=Round(F0/(ccc*0.01));
          if  T0 >65535 then T0:=65535;
          b:=5000/T0;
          if b<1 then b:=1;
          if  T0 <5000 then T0:=5000;
   //       D:=T0*a*3.6/1000000;
          D:=5000*a*3.6/1000000;
          Res:=Loop+(D*b*1.1+c);
          if Res <0 then Res:= 0.01;
          T1:=Round(F0/(ccc*Res));
          if  T1 >65535 then T1:=65535;

   //       D:=sqr(b*Loop)-4*a*c;
   //       Res:=(-b*Loop+sqrt(D))/(2*a);
   //       T1:=Round(Res*F0-T0*0.25*Loop/150);
          Memo3.SelText:='                        db';
          TestByte:=T1 div 256;
          Write(TestFile,TestByte);
          TestByte:=T1 mod 256;
          Write(TestFile,TestByte);
          Str((T1 div 256):7,StrAdd);
   //       Str((T0 div 256):7,StrAdd);
          Memo3.SelText:=StrAdd+'T,';
          Str((T1 mod 256),StrAdd);
   //       Str((T0 mod 256),StrAdd);
          Memo3.SelText:=StrAdd+'T';
          Memo3.Lines.Add('');
     end;
     CloseFile(TestFile);

end;

procedure TForm4.Button11Click(Sender: TObject);
Var       Data:Integer;
          Loop,Loop1:Integer;
          StrAdd:String;
          Res,a,b,c,D,x,F0:Real;
          T0,T1:Integer;
          TestFile:File of Byte;
          TestByte:Byte;
          FDirStr,FNameStr:String;
          sr: TSearchRec;
begin
  FDirStr:=ExtractFilePath(Const_File);
  FNameStr:=FDirStr+'dT_Max_Ch.dat';
  if (FindFirst(FNameStr, faAnyFile, sr) <> 0) then
    begin
        Application.MessageBox( PChar('Файл dT_Max_Ch.dat не найден.'),
              'Ошибка', MB_OK+MB_ICONERROR+MB_APPLMODAL);
        exit;
    end;
  CopyFile(PChar(FNameStr),PChar(FDirStr+'dT_Max_Ch.bak'),true);
     AssignFile(TestFile,FNameStr);
     ReWrite(TestFile);
     Memo3.Clear;
  //   a:=2*pi*8.4534*35.28*StrToFloat(Edit9.Text);
     a:=9.81*StrToFloat(Edit15.Text);
     c:=StrToFloat(Edit9.Text);
   //  b:=2*pi*8.4534;
   //  c:=-2*pi;
        ccc:=100/(pi*3.6*1.05);
          F0:=StrToFloat(Edit21.Text);
     for Loop:=0 to 150 do
     begin
          Data:=Loop;
          if Loop>0 then
          T0:=Round(F0/(ccc*Loop))
          else T0:=Round(F0/(ccc*0.01));
          if  T0 >65535 then T0:=65535;
          b:=5000/T0;
          if b<1 then b:=1;
          if  T0 <5000 then T0:=5000;
   //       D:=T0*a*3.6/1000000;
          D:=5000*a*3.6/1000000;
          Res:=Loop-(D*b*1.1+c);
          if Res <0 then Res:= 0.01;
          T1:=Round(F0/(ccc*Res));
          if  T1 >65535 then T1:=65535;

   //       D:=sqr(b*Loop)-4*a*c;
   //       Res:=(-b*Loop+sqrt(D))/(2*a);
   //       T1:=Round(Res*F0-T0*0.25*Loop/150);
          Memo3.SelText:='                        db';
          TestByte:=T1 div 256;
          Write(TestFile,TestByte);
          TestByte:=T1 mod 256;
          Write(TestFile,TestByte);
          Str((T1 div 256):7,StrAdd);
    //      Str(((T0-T1) div 256):7,StrAdd);
          Memo3.SelText:=StrAdd+'T,';
          Str((T1 mod 256),StrAdd);
    //      Str(((T0-T1) mod 256),StrAdd);
          Memo3.SelText:=StrAdd+'T';
          Memo3.Lines.Add('');
     end;
     CloseFile(TestFile);
end;


procedure TForm4.SleepSafe_CalcClick(Sender: TObject);
Var       Data:Integer;
          Loop,Loop1:Integer;
          StrAdd:String;
          Res,a,b,c,D,x,F0:Real;
          T0,T1:Integer;
          TestFile:File of Byte;
          TestByte:Byte;
          FDirStr,FNameStr:String;
          sr: TSearchRec;
          Test_Array:Array [1..512] of Byte;
begin
  FDirStr:=ExtractFilePath(Const_File);
  FNameStr:=FDirStr+'dT_Min.dat';
  if (FindFirst(FNameStr, faAnyFile, sr) <> 0) then
    begin
        Application.MessageBox( PChar('Файл dT_Min.dat не найден.'),
              'Ошибка', MB_OK+MB_ICONERROR+MB_APPLMODAL);
        exit;
    end;
     AssignFile(TestFile,FNameStr);
     Reset(TestFile);
     BlockRead(TestFile,Test_Array,FileSize(TestFile));
     CloseFile(TestFile);
          F0:=StrToFloat(Edit21.Text);
     for Loop:=1 to 150 do
     begin
          T1:= Test_Array[Loop*2]+ 256*Test_Array[Loop*2-1];
          a:=F0/(8.4534*T1);
          Data:=Round(1.1*255*(loop-a)/loop);
          if Data <= 255 then TestByte:= Data else TestByte:=255;
          Str((TestByte):7,StrAdd);
          Memo6.SelText:='                        db';
          Memo6.SelText:=StrAdd+'T    ';


     end;
end;

procedure TForm4.Button12Click(Sender: TObject);
Var       Data:Integer;
          Loop:Integer;
          SD_Const,SD_Coef,SD_Mul,SD_Add:Integer;
begin
        Form4.Series1.Clear;
        SD_Const:=StrToInt(Edit16.Text);
        SD_Coef:=256*StrToInt(Edit17.Text)+StrToInt(Edit18.Text);
        SD_Mul:=StrToInt(Edit19.Text);
        SD_Add:=StrToInt(Edit20.Text);
        for Loop:=1 to 150 do begin
        Data:=SD_Const+Round(SD_Coef div (Loop+SD_Add))+Round(Loop*SD_Mul div 256);
        Form4.Series1.AddXY(Loop,Data,'',Form4.Series1.LinePen.Color);
        end
end;

procedure TForm4.Button13Click(Sender: TObject);

Var       x:Byte;
          y:Real;//Integer;
          Loop:Integer;
          StrAdd:String;
begin
        Memo3.Clear;
        for Loop:=0 to 128 do begin
        x:=Loop;
        y:= 128 - Round(x*128/256)  - Round(x*x*32/256/128)  ;//+ x*x*x*16/256/128/128  ;
        x:=Loop;
        y1:=Round(Sqrt((128-x)/128)*128);
          Str((y),StrAdd);
          Memo3.SelText:=StrAdd+'    ';
          Str((y1),StrAdd);
          Memo3.SelText:=StrAdd+'    ';
          Memo3.Lines.Add('');
        end
end;




end.
