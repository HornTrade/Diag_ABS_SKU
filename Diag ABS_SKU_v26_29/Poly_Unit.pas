unit Poly_Unit;

interface

uses    Forms,Controls,Math,SysUtils,Windows{,Messages},Dialogs,Classes,
        mainABSdiag,Link_Unit,Link_Processor,Com_Thread, IniFiles;

{type
// DMath=double;
 DMath=single;
 DSave=single;
 DFloat=single;
 MSpar=record
       C1:DMath;
       C2:DMath;
       C3:DMath;
       end;
 BType=record
       M0,M1,M2,M3,
       V0,V1,V2,V3,J0,J1,J2,J3,
       P0,P1,P2,P3,V,J,i: DSave;
       OSS1,OSS2,OSS3,OSS4,OSS5,OSS6:Byte;
       end;

var
 Ma,a,b,L,hg,rd,IkF,IkR,Fi: DMath;
 W1,W2,W3,W4:word;
 MKL,OSS1,OSS2,OSS3,OSS4,OSS5,OSS6:Byte;
 CarIni : TIniFile;
 MSparL, MSparR: MSpar;
 Ga,KG0F,KG0R,KG1F,KG1R: DMath;
 brakeP: DMath;
 //Признак требования остановки расчета
 QueryStop,Poly_Abort_F :boolean;
 i: integer;
 MaxSizeOnRun: boolean;
 FullTempName, OriginalWindowName: string;
 qt: BType;
 mas_gt:array[0..15999] of BType;
 dM_F0,dM_F1,dM_R0,dM_R1: DMath;//коэффициент
 //Параметры регулятора тормозных сил
 RMmin,RTmin,RMmax,RTmax,RdTdM,PRegOut: DMath;
 Preciv0,Preciv1,Preciv0st,Preciv1st: DMath;
 Sh,Wkh,Gh,Mti,Mdi,Mj,Mpo,FS,Ph,dWidt,Wki,klap :array[0..3] of extended;
 V0,Vend,dt,kPMF_L,kPMF_R,kPMR,delR,Re,It: DMath;
 Vi,Ja:extended;
 g: DMath=9.81;//м/(с*c), ускорение свободного падения
 cikl:integer;
 Pprug,Meng,Mdl:real;
 Kreciv0: DMath=0.025;//отношение объема т.камеры переднего колеса к объему ресивера передней оси
 Kreciv1: DMath=0.025;//отношение объема т.камеры заднего колеса к объему ресивера задней оси

 //Параметры для оценки времени цикла
 freq,  StartF, StopF : int64;
 TimeF: DFloat;
 Tstart2,ModelResult: integer;


 SumVMed: DMath; //Сумма средних скоростей на расчетных фрагментах dt
 SumJ: Dmath; //Сумма ускорений
 SumI: integer; //Cумма расчетных тактов для эффективности торможения
 Ncikl:integer;
 }
procedure       StartPolygon;
procedure       PolygonAcceleration;
procedure       PolygonBreak;
procedure       PolygonStop;
procedure       PolygonAbort;
procedure       PolySBRedraw;
function        Model(data: DWORD):integer;
procedure       ChartRedraw;
function        Doroga(IndexTypeD:integer):MSpar;
function        MuSl(S: extended; MS: MSpar): extended;
function        addP(P,Kp,PIn: extended):extended;
function        subP(P,Ks: extended):extended;

implementation

procedure StartPolygon;
var iw:integer;
    StartPoly_Result:Boolean;
    Weight: extended;
begin
  StartPoly_Result:=true;
  try
  CarIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+
                            Form1.ComboBox3.Text+'.car' );
  except
    Application.MessageBox( PChar('Файл '+
                           (ExtractFilePath(Application.ExeName)+Form1.ComboBox3.Text+'.car' )+
                                      ' не найден.'),'Ошибка',
                             MB_OK+MB_ICONERROR+MB_APPLMODAL);
  StartPoly_Result:=false;
  exit;
  end;

//Исходные данные
  MSparL:=Doroga(Form1.ComboBox1.ItemIndex);
  MSparR:=Doroga(Form1.ComboBox2.ItemIndex);
  try V0:=StrToFloat(Form1.Edit32.Text)/3.6;
  except Form1.Edit32.SetFocus;
         StartPoly_Result:=false;
         exit;
  end;

  Ma:= CarIni.ReadFloat('Автомобиль','Масса автомобиля,кг',0);
  L:=  CarIni.ReadFloat('Автомобиль','Колесная база автомобиля,м',0);
  a:=  CarIni.ReadFloat('Автомобиль','Х-координата центра тяжести относительно оси передних колес,м',0);
  hg:= CarIni.ReadFloat('Автомобиль','Высота центра тяжести,м',0);
  rd:= CarIni.ReadFloat('Автомобиль','Динамический радиус колеса,м',0);
  IkF:=CarIni.ReadFloat('Автомобиль','Момент инерции переднего колеса,кг·м·м',0);
  IkR:=CarIni.ReadFloat('Автомобиль','Момент инерции заднего колеса,кг·м·м',0);
  Vend:=0.3;
  dt:=0.005;
  cikl:=100;
  Pprug:=0.3;
  delR:=CarIni.ReadFloat('Тормоз','Запаздывание тормоза задней оси,c',0);
  kPMF_L:=CarIni.ReadFloat('Тормоз','Коэффициент эффективности передней оси левый,(н·м)/атм',0);
  kPMF_R:=CarIni.ReadFloat('Тормоз','Коэффициент эффективности передней оси правый,(н·м)/атм',0);
  kPMR:=CarIni.ReadFloat('Тормоз','Коэффициент эффективности задней оси,(н·м)/атм',0);
  //Preciv0st :=CarIni.ReadFloat('Тормоз','Максимальное давление,атм',0);
  Preciv0st := StrToFloat(Form1.Edit44.Text);
  Preciv1st :=Preciv0st;
  Meng := StrToFloat(Form1.Edit47.Text);
  dM_F0 :=CarIni.ReadFloat('Тормоз','Коэффициент подъема давления передней оси',0);
  dM_F1 :=CarIni.ReadFloat('Тормоз','Коэффициент подъема давления задней оси',0);
  dM_R0 :=CarIni.ReadFloat('Тормоз','Коэффициент сброса давления передней оси',0);
  dM_R1 :=CarIni.ReadFloat('Тормоз','Коэффициент сброса давления задней оси',0);
  RMmax :=CarIni.ReadFloat('Регулятор тормозных сил','Масса задней оси в тяжелой точке',0);
  RMmin:=CarIni.ReadFloat('Регулятор тормозных сил','Масса задней оси в легкой точке,кг',0);
  RTmax:=CarIni.ReadFloat('Регулятор тормозных сил','Передаточный коэффициент в тяжелой точке',0);
  RTmin:=CarIni.ReadFloat('Регулятор тормозных сил','Передаточный коэффициент в легкой точке',0);
  CarIni.Destroy;
  if RTmax<=RTmin then
   ShowMessage('Предупреждение: Передаточный коэффициент в максимуме должен быть больше передаточного коэффициента в минимуме!');
  if RMmax<=RMmin then
   ShowMessage('Граница максимума регулируемой массы должна быть больше границы минимума регулируемой массы!');
  try RdTdM:=(RTmax-RTmin)/(RMmax-RMmin);
  except
   ShowMessage('Неверные параметры регулятора тормозных сил!');
   StartPoly_Result:=false;
   Exit;
  end;
  //проверка корректности входных данных
  if a>=L then begin
   ShowMessage('Смещение X-координаты цента тяжести отсносительно оси передних колес не может быть больше колесной базы автомобиля!');
   StartPoly_Result:=false;
   exit;      end;
  b:=L-a;
  {
  Ma:=(Ma+1000*StrToFloat(Form1.Edit45.Text));
  Ga:=Ma*g;
  KG0F:=0.5*(4650*g+(1000*StrToFloat(Form1.Edit45.Text))*g*b/L);//Н, сила тяжести, создоваемая передним колесом
  KG0R:=0.5*(3600*g+(1000*StrToFloat(Form1.Edit45.Text))*g*a/L);//Н, сила тяжести, создоваемая задним колесом
  //кг, коэффициент перераспределения силы тяжести для переднего колеса
  KG1F:=-0.5*Ga*(hg+0.0036*StrToFloat(Form1.Edit45.Text))/(g*L);
  //кг, коэффициент перераспределения силы тяжести для заднего колеса
  KG1R:=0.5*Ga*(hg+0.0036*StrToFloat(Form1.Edit45.Text))/(g*L);
  }
  Weight:=1000*StrToFloat(Form1.Edit45.Text);
  KG0F:=0.5*(Ma*a + Weight*L*0.3)*g/L;
  KG0R:=0.5*(Ma*b + Weight*L*0.7)*g/L;
  Ma:=Ma+Weight;
  Ga:=Ma*g;
  KG1F:=-0.5*Ga*hg/(g*L);
  KG1R:=-KG1F;


  Tstart2:=0;//  Round(delR/dt);

 //стартовые входные данные
 // SumVMed:=0;
 // SumJ:=0;
 // SumI:=0;
  Preciv0 :=0;//Preciv0st;
  Preciv1 :=0;//Preciv1st;
  //Vi:=V0; //м/с, скорость автомобиля
 // i:=-1;
  for iw:=0 to 3 do begin
   Sh[iw]:=0;     //безразмерный, проскалзывание колеса
   //Wkh[iw]:=V0/rd; //рад/с, угловая скорость колеса
   Wkh[iw]:= 0;
   Mti[iw]:=0;//Н*м, тормозной момент
   Mdi[iw]:=0;
   Ph[iw]:=0;
  end;
  brakeP:=0;
  PrBr:=0;
  if not QueryPerformanceFrequency(freq) then begin
   ShowMessage('Эта аппаратура не поддерживает высокоразрешающий счетчик');
   StartPoly_Result:=false;
   exit;
  end;
  TimeF:=0;
  if not StartPoly_Result then exit;
  Form1.StatusBar1.Panels.Items[6].Text:='разгон';
  PolyProgress:=True;
  PolyPhase:=1;
  Ncikl:=0;
end;

procedure PolygonAcceleration;
begin
   SinxrPoly:=false;
   brakeP:=0;
   PrBr:=0;
   if ABS_Poly then begin
   if Ncikl<=480 then    Vi:=V0*Ncikl/480;
        W1:=Round(64*Vi*3.6);
        W2:=W1;
        W3:=W1;
        W4:=W1;
   inc(Ncikl);
   if  Ncikl= 700 then begin
   PolyPhase:=2;
   SumVMed:=0;
   SumJ:=0;
   SumI:=0;
   i:=-1;
   QueryPerformanceCounter(StartF);
   Form1.StatusBar1.Panels.Items[6].Text:='торможение';
   form1.Timer1.Enabled:=false;
                        end;
  end else begin
  Vi:=0;
        W1:=Round(64*Vi*3.6);
        W2:=W1;
        W3:=W1;
        W4:=W1;
   i:=-1;
   PolyPhase:=2;
   QueryPerformanceCounter(StartF);
   Form1.StatusBar1.Panels.Items[6].Text:='пробуксовка';
   form1.Timer1.Enabled:=false;
  end;
end;

procedure PolygonBreak;
begin
    SinxrPoly:=false;
    ModelResult:=Model(0);
    if (ModelResult=0) or (Poly_Abort_F) then
    begin
    It:=i;
    PolyPhase:=3;
    if Poly_Abort_F then form1.StatusBar1.Panels.Items[6].Text:='прерван'
    else begin
        form1.PolyBtn.Down:=false;
        form1.PolyBtn.Caption:='Start';
        form1.StatusBar1.Panels.Items[6].Text:='остановка';
    end;
    Ncikl:=0;
    Screen.Cursor:=crArrow;
    form1.Timer1.Enabled:=true;
    end;
end;

procedure PolygonStop;
var iw:integer;
begin
    SinxrPoly:=false;
    if not Poly_Abort_F then
    begin
    ModelResult:=Model(0);
    end else begin
        Preciv0 :=0;
        Preciv1 :=0;
        for iw:=0 to 3 do  Ph[iw]:=0;
        brakeP:=0;
        PrBr:=0;
        ModelResult:=Model(0);
    end;
    inc(Ncikl);
    if  Ncikl= 50 then  begin
                PolyPhase:=4;
                PolyProgress:=False;
                end;
end;

procedure PolygonAbort;
var iw:integer;
begin
//отпускание тормоза
        SinxrPoly:=false;
        PolyProgress:=true;
        Preciv0 :=0;
        Preciv1 :=0;
        for iw:=0 to 3 do  Ph[iw]:=0;
        brakeP:=0;
          PrBr:=0;
        ModelResult:=Model(0);
        Vi:=Vi-0.04;
        if Vi<0.1 then  begin
                PolyPhase:=0;
                PolyProgress:=False;
                form1.PolyBtn.AllowAllUp:=true;
                form1.PolyBtn.Down:=false;
                form1.PolyBtn.Caption:='Start';
                Poly_Abort_F:=false;
          end;
end;

function Model(data: DWORD):integer;
var
 iw: integer;//переменная цикла для смены колес
 q: integer;//переменная цикла
 Tt: DFloat;//передаточный коэффициент (0)..[1] для заданной нагрузки
 //обнуляемые параметры
 dPV0: DMath;//расход воздуха за цикл для ресивера передней оси(атм*литр)
 dPV1: DMath;//расход воздуха за цикл для ресивера задней оси(атм*литр)
 newP: DMath;
 //brakeP: DMath;
begin
 inc(i);
 if i=6000 then begin
 ShowMessage('Превышено время');
 Model:=0;
 Poly_Abort_F:=true;
 exit;
 end;

    if ABS_Poly then begin

 dPV0:=0;
 dPV1:=0;
 if i<=50 then begin
     Preciv0:=Preciv0st*(i)/50;
     Preciv1:=Preciv0;
     end;
 for iw:=0 to 3 do Wki[iw]:=Wkh[iw];

 Gh[0]:=KG0F+KG1F*Ja;//Н, вертикальная сила тяжести 1L
 Gh[1]:=Gh[0];            //Н, вертикальная сила тяжести 1R
 Gh[2]:=KG0R+KG1R*Ja;//Н, вертикальная сила тяжести 1L
 Gh[3]:=Gh[2]            ;//Н, вертикальная сила тяжести 1R
 //регулятор тормозных сил
 //PRegOut:=PReciv1*(RTmax-(RMmax-(Gh[2]+Gh[2])/g)*RdTdM);
 //if  PRegOut>PReciv1 then PRegOut:=PReciv1;
 PRegOut:=PReciv1;

 for q:=0 to cikl-1 do begin
  newP:=addP(brakeP,(dM_F0),Preciv0);
  brakeP:= newP;
  for iw:=0 to 3 do  begin
 //Изменение давления в камерах и накопитель расхода воздуха
 case iw of
 0:begin  {дешифрация команды колеса 1L}
     if ((MKL and $01)<>0) and ((MKL and $02)<>0)
//     if ((MKL and $08)<>0) and ((MKL and $04)<>0)
                  then Ph[iw]:=subP(Ph[iw],dM_R0);
     if ((MKL and $01)=0) and ((MKL and $02)=0) then
//     if ((MKL and $08)=0) and ((MKL and $04)=0) then
     begin
 //    newP:=addP(Ph[iw],(dM_F0),Preciv0);
 if form1.CheckBox48.Checked then newP:=addP(Ph[iw],(dM_F0),Preciv0)
     else newP:=addP(Ph[iw],(dM_F0),0);
     dPV0:=(newP-Ph[iw]);
     Ph[iw]:=newP;
     end;
    end;
 1:begin  {дешифрация команды колеса 1R}
     if ((MKL and $08)<>0) and ((MKL and $04)<>0)
//       if ((MKL and $01)<>0) and ((MKL and $02)<>0)
                  then Ph[iw]:=subP(Ph[iw],dM_R0);
     if ((MKL and $08)=0) and ((MKL and $04)=0) then
//     if ((MKL and $01)=0) and ((MKL and $02)=0) then
     begin
 //    newP:=addP(Ph[iw],(dM_F0),Preciv0);
 if form1.CheckBox48.Checked then newP:=addP(Ph[iw],(dM_F0),Preciv0)
     else newP:=addP(Ph[iw],(dM_F0),0);
     dPV0:=(newP-Ph[iw]);
     Ph[iw]:=newP;
     end;
    end;
 2:begin   {дешифрация команды колеса 2L}
     if ((MKL and $10)<>0) and ((MKL and $20)<>0)  then
//     if ((MKL and $40)<>0) and ((MKL and $80)<>0)  then
     begin
     Ph[iw]:=subP(Ph[iw],dM_R1);
     if (i<Tstart2+1) then Ph[iw]:=0;
                            end;
     if ((MKL and $10)=0) and ((MKL and $20)=0)  then
//     if ((MKL and $40)=0) and ((MKL and $80)=0)  then
     begin
     if (i<Tstart2+1) then Ph[iw]:=0
                      else begin
     newP:=addP(Ph[iw],(dM_F1),PRegout);
     dPV1:=(newP-Ph[iw]);
     Ph[iw]:=newP;
                           end;
     end;
    end;
 3:begin  {дешифрация команды колеса 2R}
     if ((MKL and $40)<>0) and ((MKL and $80)<>0)  then
//     if ((MKL and $10)<>0) and ((MKL and $20)<>0)  then
     begin
     Ph[iw]:=subP(Ph[iw],dM_R1);
     if (i<Tstart2+1) then Ph[iw]:=0;
     end;
     if ((MKL and $40)=0) and ((MKL and $80)=0)  then
//     if ((MKL and $10)=0) and ((MKL and $20)=0)  then
     begin
     if (i<Tstart2+1) then Ph[iw]:=0
     else begin
     newP:=addP(Ph[iw],(dM_F1),PRegout);
     dPV1:=(newP-Ph[iw]);
     Ph[iw]:=newP;
         end;
     end;
    end;
 end;
 //Преопразование давления в момент
 case iw of
 0: Mti[iw]:=(Ph[iw]-Pprug)*kPMF_L;
 1: Mti[iw]:=(Ph[iw]-Pprug)*kPMF_R;
 2,3: Mti[iw]:=(Ph[iw]-Pprug)*kPMR;
 end;
 if Mti[iw]<0 then Mti[iw]:=0;

 //скорость колеса
 if  (Mti[iw]=0) and (Sh[iw]=0)  then
 Wkh[iw]:=Vi/rd
 else begin
 case iw of
 0,1: Wkh[iw]:=Wkh[iw]+(Mdi[iw]-Mti[iw])/IkF*dt/cikl;
 2,3: Wkh[iw]:=Wkh[iw]+(Mdi[iw]-Mti[iw])/IkR*dt/cikl;
 end;
 if  Wkh[iw]<0 then Wkh[iw]:=0;
 if  Wkh[iw]>Vi/rd then begin
  Sh[iw]:=0;
  Wkh[iw]:=Vi/rd;
  Mdi[iw]:=0;
  end  else begin
     Sh[iw]:= 1-Wkh[iw]*rd/Vi;// проскальзывание
       //moment дороги
  case iw of
   0,2: FS[iw]:=MuSl(Sh[iw],MSparL);
   1,3: FS[iw]:=MuSl(Sh[iw],MSparR);
  end;
  Mdi[iw]:=FS[iw]*Gh[iw]*rd;
             end;
      end;
 end;//вычислений по колесам
//
 if i<1 then
 Ja:=1-(Mdi[0]+Mdi[1]+Mdi[2]+Mdi[3])/rd/ma //;
 else  Ja:=-(Mdi[0]+Mdi[1]+Mdi[2]+Mdi[3])/rd/ma+(0.01*StrToFloat(Form1.Edit46.Text))*g ;
 Vi:=Vi+Ja*dt/cikl;
 //расчет расхода воздуха(давления в расивере)
 Preciv0:=Preciv0-dPV0*Kreciv0;
 Preciv1:=Preciv1-dPV1*Kreciv1;

 //расчет эффективности торможения
 if (Vi<=(40/3.6)) and (Vi>(20/3.6)) then begin
   SumJ:=SumJ+Ja;
   inc(SumI);
   end;

   SumVMed:=SumVMed+Vi*dt/cikl;
 end;

 for iw:=0 to 3 do dWidt[iw]:=Wkh[iw]-Wki[iw];

        W1:=Round(64*Wkh[0]*3.6*rd);
   //     if ((i<2) or (i>3)) then       W2:=Round(64*Wkh[1]*3.6*rd)
    W2:=Round(64*Wkh[1]*3.6*rd+StrToInt(Form1.Edit47.Text)*Wkh[1]/V0);
    //    W2:=Round(64*Wkh[1]*3.6*rd) ;
        W3:=Round(64*Wkh[2]*3.6*rd);
        W4:=Round(64*Wkh[3]*3.6*rd);

        PrBr:= Round(brakeP*25)+25;
   //     PrBr:= Round(Preciv0*32);
 if (Vi<=(35/3.6)) and (Vi>(20/3.6)) then begin
 //  Preciv0:=Preciv0-Kreciv0/3;
   Preciv1:=Preciv0;
   end;

 //начало зоны вывода графика
 if (not Poly_Abort_F) and ((PolyPhase=2) or (PolyPhase=3))then
 begin
 qt.M0:=FS[0]*100;
 qt.M1:=FS[1]*100;
 qt.M2:=FS[2]*100;
 qt.M3:=FS[3]*100;
 qt.V:=Vi*3.6;
 qt.V0:=Wkh[0]*rd*3.6;
 qt.V1:=Wkh[1]*rd*3.6;
 qt.V2:=Wkh[2]*rd*3.6;
 qt.V3:=Wkh[3]*rd*3.6;
 qt.P0:=Ph[0]*10*1.124;
 qt.P1:=Ph[1]*10*1.124;
 qt.P2:=Ph[2]*10*1.124;
 qt.P3:=Ph[3]*10*1.124;
 qt.J:=TimeF;
 qt.J0:=dWidt[0]*rd/dt/g;
 qt.J1:=dWidt[1]*rd/dt/g;
 qt.J2:=dWidt[2]*rd/dt/g;
 qt.J3:=dWidt[3]*rd/dt/g;
 qt.i:=i*dt;
 qt.OSS1:=OSS1;
 qt.OSS2:=OSS2;
 qt.OSS3:=OSS3;
 qt.OSS4:=OSS4;
 qt.OSS5:=OSS5;
 qt.OSS6:=OSS6;
 mas_gt[i]:=qt;
 end;
 //конец зоны вывода графика
   QueryPerformanceCounter(StopF);
   TimeF:=(StopF-StartF)/freq*1000;//1000 - SToMs
   StartF:=StopF;

 if (Vi<=Vend) or QueryStop then
  begin
  Model:=0;
  if SumI <>0 then Re:=(-SumJ/SumI/((MSparL.C1+MSparR.C1)/2*g)*100);
  end
  else Model:=Ceil(Vi);
  end
// конец ABS
  else  begin
// ASR
 dPV0:=0;
 dPV1:=0;
 Gh[2]:=KG0R;//+KG1R*Ja;//Н, вертикальная сила тяжести 1L
 Gh[3]:=Gh[2]            ;//Н, вертикальная сила тяжести 1R

 if (Oss1 and $04) =0 then  PRegOut:=0
                      else  PRegOut:=Preciv0st;
 if (Oss1 and $10) =0 then for iw:=0 to 3 do Ph[iw]:=0;
 for iw:=0 to 3 do Wki[iw]:=Wkh[iw];

 for q:=0 to cikl-1 do begin
  for iw:=2 to 3 do  begin
 //Изменение давления в камерах и накопитель расхода воздуха
 case iw of
 2:begin   {дешифрация команды колеса 2L}
     if ((MKL and $10)<>0) and ((MKL and $20)<>0)  then
     Ph[iw]:=subP(Ph[iw],dM_R1);
     if ((MKL and $10)=0) and ((MKL and $20)=0)  then
     begin
     newP:=addP(Ph[iw],(dM_F1),PRegout);
     dPV1:=(newP-Ph[iw]);
     Ph[iw]:=newP;
     end;
    end;
 3:begin  {дешифрация команды колеса 2R}
     if ((MKL and $40)<>0) and ((MKL and $80)<>0)  then
     Ph[iw]:=subP(Ph[iw],dM_R1);
     if ((MKL and $40)=0) and ((MKL and $80)=0)  then
     begin
     newP:=addP(Ph[iw],(dM_F1),PRegout);
     dPV1:=(newP-Ph[iw]);
     Ph[iw]:=newP;
     end;
    end;
 end;
  //Преопразование давления в момент
    Mti[iw]:=(Ph[iw]-Pprug)*kPMR;
    if Mti[iw]<0 then Mti[iw]:=0;

 end; //for

//  for iw:=2 to 3 do  begin
//moment полуоси
 if i<20 then  Mdl:=Meng*100
 else begin
 //if i=100 then  Mdl:=Meng;
 //if (Wkh[2]+Wkh[3])>(Wkh[0]+Wkh[1]+10) then
 //       begin
 //       Mdl:=Mdl-100*dt/cikl; if Mdl<(Meng-150) then Mdl:=(Meng-150);
 //       end
 //       else begin
 //       Mdl:=Mdl+300*dt/cikl; if Mdl>Meng then Mdl:=Meng;
 //       end;
    Mdl:= (Oss2-125) *Meng;
 end;

// if i<1 then  Mpo[iw]:=Mdl/2
//  else
//case iw of
//   2: Mpo[iw]:=Mdl-(Mdi[3]-Mti[3]+Mj[3]);
//   3: Mpo[iw]:=Mdl-(Mdi[2]-Mti[2]+Mj[2]);
//   2: Mpo[iw]:=Mdl/2+Mti[3]-Mti[2];
//   3: Mpo[iw]:=Mdl/2+Mti[2]-Mti[3];
//   2: Mpo[iw]:=Mdl/2+Mti[3];
//   3: Mpo[iw]:=Mdl/2+Mti[2];
//  end;
 // if Mpo[iw]<0 then Mpo[iw]:=0;

 // Mj[iw]:=Mpo[iw]-Mdi[iw]-Mti[iw];
// end; //for

  if (Mdi[2]+Mti[2])<(Mdi[3]+Mti[3]) then begin
             Mpo[3]:= Mdi[2]+Mti[2];
             Mpo[2]:= Mdl-(Mdi[2]+Mti[2]);
             end  else  begin
             Mpo[2]:= Mdi[3]+Mti[3];
             Mpo[3]:= Mdl-(Mdi[3]+Mti[3]);
             end;

  for iw:=2 to 3 do  begin
  Mj[iw]:=Mpo[iw]-Mdi[iw]-Mti[iw];
 //скорость колеса
  Wkh[iw]:=Wkh[iw]+Mj[iw]/IkR*dt/cikl;
  if  Wkh[iw]<0 then Wkh[iw]:=0;
 // проскальзывание
   if  Wkh[iw]>Vi/rd then if Wkh[iw]>0 then Sh[iw]:= 1-Vi/(Wkh[iw]*rd) else Sh[iw]:=0
   else if Vi>0 then Sh[iw]:= 1-Wkh[iw]*rd/Vi else Sh[iw]:=0;
  if  Sh[iw]>1 then Sh[iw]:= 1;
//moment дороги
  case iw of
   2: FS[iw]:=MuSl(Sh[iw],MSparL);
   3: if i>100 then  FS[iw]:=MuSl(Sh[iw],MSparR)
               else  FS[iw]:=MuSl(Sh[iw],Doroga(4));
  end;
  Mdi[iw]:=FS[iw]*Gh[iw]*rd;
  if  Wkh[iw]<Vi/rd then  Mdi[iw]:=-Mdi[iw];
  end; //for

 end;//вычислений по колесам
//
 Ja:=(Mdi[2]+Mdi[3])/rd/ma+(0.01*StrToFloat(Form1.Edit46.Text))*g ;
 Vi:=Vi+Ja*dt;// /cikl;
 //расчет расхода воздуха(давления в расивере)
 Preciv0:=Preciv0-dPV0*Kreciv0;
 Preciv1:=Preciv1-dPV1*Kreciv1;
 Wkh[0]:=Vi/rd;
 Wkh[1]:=Vi/rd;
 for iw:=0 to 3 do dWidt[iw]:=Wkh[iw]-Wki[iw];

        W1:=0;//Round(64*Vi*3.6);
        W2:=Round(64*Wkh[1]*3.6*rd)+StrToInt(Form1.Edit47.Text);
   //     W2:=W1;
        W3:=Round(64*Wkh[2]*3.6*rd);

        W4:=Round(64*Wkh[3]*3.6*rd);

        PrBr:= Round(brakeP*25)+25;

 //начало зоны вывода графика
 if (not Poly_Abort_F) and ((PolyPhase=2) or (PolyPhase=3))then
 begin
// qt.M0:=FS[0]*100;
// qt.M1:=FS[1]*100;
 qt.M0:=Mpo[2]/100;
 qt.M1:=Mpo[3]/100;
 qt.M2:=Mdl/100;
// qt.M2:=FS[2]*100;
 qt.M3:=FS[3]*100;
 qt.V:=Vi*3.6;
 qt.V0:=Wkh[0]*rd*3.6;
 qt.V1:=Wkh[1]*rd*3.6;
 qt.V2:=Wkh[2]*rd*3.6;
 qt.V3:=Wkh[3]*rd*3.6;
// qt.P0:=Ph[0]*10*1.124;
// qt.P1:=Ph[1]*10*1.124;
 qt.P0:=Mti[2]/100;
 qt.P1:=Mti[3]/100;
 qt.P2:=Ph[2]*10*1.124;
 qt.P3:=Ph[3]*10*1.124;
 qt.J:=TimeF;
 qt.J0:=dWidt[0]*rd/dt/g;
 qt.J1:=dWidt[1]*rd/dt/g;
 qt.J2:=dWidt[2]*rd/dt/g;
 qt.J3:=dWidt[3]*rd/dt/g;
 qt.i:=i*dt;
 qt.OSS1:=OSS1;
 qt.OSS2:=OSS2;
 qt.OSS3:=OSS3;
 qt.OSS4:=OSS4;
 qt.OSS5:=OSS5;
 qt.OSS6:=OSS6;
 mas_gt[i]:=qt;
 end;
 //конец зоны вывода графика
   QueryPerformanceCounter(StopF);
   TimeF:=(StopF-StartF)/freq*1000;//1000 - SToMs
   StartF:=StopF;

 if (Vi>V0) or QueryStop then
  begin
  Model:=0;
  if SumI <>0 then Re:=(-SumJ/SumI/((MSparL.C1+MSparR.C1)/2*g)*100);
  end
  else
  Model:=Ceil(V0);

  end;
end;


function Doroga(IndexTypeD:integer):MSpar;
const
 DU:array[0..5] of MSpar=((C1: 0.881525; C2: 19.793572; C3: 0.101525;),
                          (C1: 0.731104; C2: 42.312075; C3: 0.231104;),
                          (C1: 0.530000; C2: 72.000000; C3: 0.180000;),
                          (C1: 0.349749; C2: 98.963774; C3: 0.149749;),
                          (C1: 0.206897; C2:110.117789; C3: 0.121897;),
                          (C1: 0.077626; C2: 41.705291; C3: 0.017626;));
begin     //C1: 0.731104; C2: 82.312075; C3: 0.431104;
 Result:=DU[IndexTypeD];
end;

function MuSl(S: extended; MS: MSpar): extended;
//функция сцепления в зависимости от проскальзывания для левого борта
//функция использует параметры MSparL: MSpar, KmsL: DMath
begin//ML
  Assert(S<=1,'ML: Проскальзывание не может быть больше единицы');
  //Assert(S>=0,'ML: Проскальзывание не может быть меньше нуля');
  MuSl:=MS.C1*(1-exp(-MS.C2*S))-MS.C3*S;
end;//ML



function addP(P,Kp,PIn: extended): extended;
//функция вброса давления
//addP,P - давление в атмосферах; dt - время в секундах
begin//addP
 addP:=PIn-((PIn-P)/exp(Kp*dt/cikl));
end;//addP

function subP(P,Ks: extended):extended;
//функция сброса давления
//subP,P - давление в атмосферах; dt - время в секундах
const
 r=2.8;//радиус в атмосферах, 1.625 - минимум
 sa=3.25;
 sb=4.875;
 sc=-r*r+2.640625;
 sd=sb*sb-4*sa*sc;
//var xc,yc,x1,x2: DMath;
begin//subP
 {if P<1 then begin
   xc:=(-sb+sqrt(sd))/(sa*2);
   yc:=xc*1.5+1.625;
   x1:=xc-sqrt(sqr(r)-sqr(yc-P));
   x2:=x1+(dt*4);
   if x2<0 then subP:=yc-sqrt(sqr(r)-sqr(xc-x2))
           else subP:=0;
             end
        else subP:=P/exp((ln(2)*(7))*(dt/cikl));}
  subP:=P/exp(Ks*dt/cikl);
end;//subP


procedure       ChartRedraw;
Var Loop:Integer;
begin
       // Form1.Chart1.Series[0].Clear;

  {  if Form1.Chart1.SeriesCount > 0 then begin
        Form1.Series0.Free;
        Form1.Series1.Free;
        Form1.Series2.Free;
        Form1.Series3.Free;
        Form1.Series4.Free;
        Form1.Series5.Free;
        Form1.Series6.Free;
        Form1.Series7.Free;
        Form1.Series8.Free;
        Form1.Series13.Free;
        Form1.Series14.Free;
        Form1.Series15.Free;
        Form1.Series16.Free;
        Form1.Series17.Free;
        Form1.Series18.Free;
        Form1.Series19.Free;
        Form1.Series20.Free;
        Form1.Series21.Free;
        Form1.Series24.Free;
        Form1.Series25.Free;
        Form1.Series26.Free;
        Form1.Series27.Free;
        Form1.Series28.Free;
        Form1.Series29.Free;
        end;  }

        Form1.Series0.Clear;
        Form1.Series1.Clear;
        Form1.Series2.Clear;
        Form1.Series3.Clear;
        Form1.Series4.Clear;
        Form1.Series5.Clear;
        Form1.Series6.Clear;
        Form1.Series7.Clear;
        Form1.Series8.Clear;
        Form1.Series13.Clear;
        Form1.Series14.Clear;
        Form1.Series15.Clear;
        Form1.Series16.Clear;
        Form1.Series17.Clear;
        Form1.Series18.Clear;
        Form1.Series19.Clear;
        Form1.Series20.Clear;
        Form1.Series21.Clear;
        Form1.Series24.Clear;
        Form1.Series25.Clear;
        Form1.Series26.Clear;
        Form1.Series27.Clear;
        Form1.Series28.Clear;
        Form1.Series29.Clear;
        for Loop:=0 to i do begin
        qt:=mas_gt[Loop];
        Form1.Series0.AddXY(qt.i,qt.V,'',Form1.Series0.LinePen.Color);
        Form1.Series1.AddXY(qt.i,qt.V0,'',Form1.Series1.LinePen.Color);
        Form1.Series2.AddXY(qt.i,qt.V1,'',Form1.Series2.LinePen.Color);
        Form1.Series3.AddXY(qt.i,qt.V2,'',Form1.Series3.LinePen.Color);
        Form1.Series4.AddXY(qt.i,qt.V3,'',Form1.Series4.LinePen.Color);
        Form1.Series5.AddXY(qt.i,qt.P0,'',Form1.Series5.LinePen.Color);
        Form1.Series6.AddXY(qt.i,qt.P1,'',Form1.Series6.LinePen.Color);
        Form1.Series7.AddXY(qt.i,qt.P2,'',Form1.Series7.LinePen.Color);
        Form1.Series8.AddXY(qt.i,qt.P3,'',Form1.Series8.LinePen.Color);
        Form1.Series13.AddXY(qt.i,qt.J0,'',Form1.Series13.LinePen.Color);
        Form1.Series14.AddXY(qt.i,qt.J1,'',Form1.Series14.LinePen.Color);
        Form1.Series15.AddXY(qt.i,qt.J2,'',Form1.Series15.LinePen.Color);
        Form1.Series16.AddXY(qt.i,qt.J3,'',Form1.Series16.LinePen.Color);
        Form1.Series17.AddXY(qt.i,qt.M0,'',Form1.Series17.LinePen.Color);
        Form1.Series18.AddXY(qt.i,qt.M1,'',Form1.Series18.LinePen.Color);
        Form1.Series19.AddXY(qt.i,qt.M2,'',Form1.Series19.LinePen.Color);
        Form1.Series20.AddXY(qt.i,qt.M3,'',Form1.Series20.LinePen.Color);
        Form1.Series21.AddXY(qt.i,qt.J,'',Form1.Series21.LinePen.Color);
        Form1.Series24.AddXY(qt.i,qt.OSS1,'',Form1.Series24.LinePen.Color);
        Form1.Series25.AddXY(qt.i,qt.OSS2,'',Form1.Series25.LinePen.Color);
        Form1.Series26.AddXY(qt.i,qt.OSS3,'',Form1.Series26.LinePen.Color);
        Form1.Series27.AddXY(qt.i,qt.OSS4,'',Form1.Series27.LinePen.Color);
        Form1.Series28.AddXY(qt.i,qt.OSS5,'',Form1.Series28.LinePen.Color);
        Form1.Series29.AddXY(qt.i,qt.OSS6,'',Form1.Series29.LinePen.Color);
        end;
        Form1.Chart1.BringToFront;
end;

procedure       PolySBRedraw;
begin
     Form1.StatusBar1.Panels.Items[0].Text:='t: '+FloatToStrF((It*dt),ffFixed,5,3)+' с';
     Form1.StatusBar1.Panels.Items[1].Text:='S: '+FloatToStrF(SumVMed,ffFixed,6,3)+' м';
     if (SumI<>0) then Form1.StatusBar1.Panels.Items[2].Text:='Z: '+FloatToStrF((-SumJ/SumI),ffFixed,6,3)+' м/с2';
     Form1.StatusBar1.Panels.Items[3].Text:='Rµ_max: '+FloatToStrF(Re,ffFixed,6,1)+'%';
     Form1.StatusBar1.Panels.Items[4].Text:='dP: '+FloatToStrF((Preciv1st-Preciv1+Preciv0st-Preciv0),ffFixed,6,3)+' атм.';

end;
end.
