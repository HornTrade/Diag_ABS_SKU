unit Make_CFG;

interface

uses
  Windows,Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, ComCtrls, ToolWin, Menus, Buttons, StdCtrls, ExtCtrls, IniFiles,
  ActnList,RoadTest, ShellAPI, Mask, Link_Processor, Link_Unit,{Queue,}
  Grids, TeEngine, Series, TeeProcs, Chart, Spin, ComObj;

Type PnevmoType=record
     Kinj:String;
     Kexh:String;
     FullP:String;
     GinjL:String;
     GinjR:String;
     Gexh:String;
     Dinj:String;
     Dexh:String;
     Ddelay:String;
end;

type
  TMakeCFG = class(TForm)
    Label1: TLabel;
    GroupBox2: TGroupBox;
    GroupBox54: TGroupBox;
    Label225: TLabel;
    Label226: TLabel;
    Label245: TLabel;
    Label475: TLabel;
    Label387: TLabel;
    Label419: TLabel;
    Label420: TLabel;
    Label418: TLabel;
    Label234: TLabel;
    Label429: TLabel;
    Label535: TLabel;
    Label530: TLabel;
    Label561: TLabel;
    Edit48: TEdit;
    Edit49: TEdit;
    Edit73: TEdit;
    Edit226: TEdit;
    Edit154: TEdit;
    Edit169: TEdit;
    Edit170: TEdit;
    Edit168: TEdit;
    Edit53: TEdit;
    Edit178: TEdit;
    Edit293: TEdit;
    Edit328: TEdit;
    Edit330: TEdit;
    CheckBox293: TCheckBox;
    GroupBox239: TGroupBox;
    Label364: TLabel;
    CheckBox131: TCheckBox;
    Edit405: TEdit;
    GroupBox10: TGroupBox;
    GroupBox121: TGroupBox;
    Label72: TLabel;
    Label73: TLabel;
    Edit26: TEdit;
    Edit27: TEdit;
    GroupBox122: TGroupBox;
    Label423: TLabel;
    Label74: TLabel;
    Edit21: TEdit;
    Edit22: TEdit;
    CheckBox162: TCheckBox;
    GroupBox123: TGroupBox;
    Label157: TLabel;
    Label158: TLabel;
    Edit174: TEdit;
    Edit175: TEdit;
    CheckBox163: TCheckBox;
    GroupBox148: TGroupBox;
    CheckBox299: TCheckBox;
    Label4: TLabel;
    Edit4: TEdit;
    GroupBox66: TGroupBox;
    GroupBox207: TGroupBox;
    Label477: TLabel;
    CheckBox233: TCheckBox;
    Edit270: TEdit;
    GroupBox208: TGroupBox;
    Label582: TLabel;
    Label452: TLabel;
    Edit269: TEdit;
    CheckBox232: TCheckBox;
    GroupBox200: TGroupBox;
    CheckBox84: TCheckBox;
    RadioGroup9: TRadioGroup;
    CheckBox231: TCheckBox;
    Label5: TLabel;
    Label6: TLabel;
    grp1: TGroupBox;
    ButtonXBRLoadXLSX: TButton;
    Edit410: TEdit;
    ButtonXBR1: TButton;
    Label630: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    ModelGrid: TStringGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    ButtonXBR3: TButton;
    ButtonXBR2: TButton;
    mmo1: TMemo;
    GroupBox135: TGroupBox;
    Label270: TLabel;
    Label267: TLabel;
    Label450: TLabel;
    Label508: TLabel;
    Label509: TLabel;
    Label426: TLabel;
    Label553: TLabel;
    Edit76: TEdit;
    Edit77: TEdit;
    Edit75: TEdit;
    Edit78: TEdit;
    Edit197: TEdit;
    Edit196: TEdit;
    Edit324: TEdit;
    Edit253: TEdit;
    Edit254: TEdit;
    Edit266: TEdit;
    Edit267: TEdit;
    GroupBox: TGroupBox;
    Label264: TLabel;
    Edit67: TEdit;
    Edit68: TEdit;
    Label253: TLabel;
    Edit71: TEdit;
    Edit72: TEdit;
    Edit198: TEdit;
    Label451: TLabel;
    Edit199: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    GroupBox3: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    SaveDialog1: TSaveDialog;
    Edit5: TEdit;
    Label11: TLabel;
    CheckBox229: TCheckBox;
    Edit155: TEdit;
    GroupBox11: TGroupBox;
    GroupBox131: TGroupBox;
    Label321: TLabel;
    Edit125: TEdit;
    GroupBox12: TGroupBox;
    Label12: TLabel;
    Edit219: TEdit;
    Label10: TLabel;
    Label13: TLabel;
    Edit7: TEdit;
    Edit8: TEdit;
    Label9: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Edit6: TEdit;

    procedure ButtonXBRLoadXLSXClick(Sender: TObject);
    procedure DumpToForm;
    procedure FormToDump;
    procedure ButtonXBR3Click(Sender: TObject);
    procedure SetList(M:String);
    procedure CheckActiveSheet;
    procedure Load_CFGFromExcel;
    procedure Set_CFGFromExcel;
    procedure Clr_CFGFromExcel;
    procedure Dump_Load;
    procedure Save_FileCFG;
    function  Tire_Calculate(Tip:String):String;
    function  Tire2_Calculate(Tip:String):String;
    function  Num_Col(Name:String):Integer;
    procedure Clr_Make_CFG;
    function  Load_Pnevmo(Tip:String):PnevmoType;
    function  Str_From_Rec(Rec:String):String;
    procedure ModelGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure ButtonXBR1Click(Sender: TObject);
    procedure ButtonXBR2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MakeCFG: TMakeCFG;
  CFG_Excel_File, Model, NameSheet, TempStr, TempNF,
  TempStrF, TempStrR, Cars_Folder, Model_Folder, FilesPath,
  CFG_Default,CFG_Default_FromMake, CFG_File,
  TireF, TireR, SelectedModel, ModelMAZ,
  TipPnevmo, RecordPT, Modification_Number, Kmp_Ini :String;
  MsExcel: Variant;
  ExcelSheet: OLEVariant;
  Nstr,ExRows,ExColumns,x,y,N,
  Start_Row, End_Row, SelRow, SelCol, Axles :Integer;
  Nrow:Array[0..1000] of Integer;
  Axle3, Default_Cmpl: Boolean;
  KdZ, Kkin :extended;
  ConfigFile:TextFile;
  sr: TSearchRec;
  CFGIni : TIniFile;
  //
 { Fa2_B12, Fa2_D16, Fa2_B24, Fa2_D24,
  Ra2_B16, Ra2_D16, Ra2_B24, Ra2_D24, Ra2_B30,
  Fa3_B24, Fa3_D24, Fa3_B30,
  Ra3_B24, Ra3_D24, Ra3_B30 : PnevmoType; }

implementation

uses mainABSdiag;

{$R *.dfm}
function  TMakeCFG.Str_From_Rec(Rec:String):String;
Var
    Str:String;
begin
    Str:=RecordPT;
    Delete(RecordPT,1,Pos(';',RecordPT));
    Delete(Str,Pos(';',Str),Length(Str));
    Str_From_Rec:=Str;
end;

function  TMakeCFG.Load_Pnevmo(Tip:String):PnevmoType;
Var
    PnevmoFile:TextFile;
    Str, PnevmoFile_Name, PTN :String;
//    PT : PnevmoType;
    i:Integer;
    PTA:Array[0..9] of String;
begin
      PTN:='';
      PnevmoFile_Name:= FilesPath+'\Pnevmo.txt';
      if FileExists(PnevmoFile_Name) then
      begin
        AssignFile(PnevmoFile,PnevmoFile_Name);
        Reset(PnevmoFile);
        Repeat
          ReadLn(PnevmoFile,Str);
          if Pos(Tip,Str)<>0 then
          begin
            PTN:=Str;
            ReadLn(PnevmoFile,RecordPT);
            if RecordPT <> '' then
            begin
            for i:=0 to 9 do
            begin
               Str:=RecordPT;
               Delete(RecordPT,1,Pos(';',RecordPT));
               Delete(Str,Pos(';',Str),Length(Str));
               PTA[i]:=Str;
            end;
            Load_Pnevmo.Kinj:= PTA[0];
            Load_Pnevmo.Kexh:= PTA[1];
            Load_Pnevmo.FullP:=PTA[2];
            Load_Pnevmo.GinjL:=PTA[3];
            Load_Pnevmo.GinjR:=PTA[4];
            Load_Pnevmo.Gexh:= PTA[5];
            Load_Pnevmo.Dinj:= PTA[6];
            Load_Pnevmo.Dexh:= PTA[7];
            Load_Pnevmo.Ddelay:=PTA[8];
            end
            else ShowMessage('Tip '+Tip+ ' не определен');
         end;
        Until Eof(PnevmoFile);
        CloseFile(PnevmoFile);
      end
      else ShowMessage('Файл '+PnevmoFile_Name+ ' не найден');
      if PTN = ''
      then ShowMessage('Tip '+Tip+ ' не найден');
end;

procedure TMakeCFG.DumpToForm;
begin
    Form1.CheckBox318.Checked:=true; // Загрузить CFG без связи с блоком
    Form1.TabSheet8Show(nil);
end;

procedure TMakeCFG.FormToDump;
begin
     Form1.Dump_SKU_CFG; //заполнение Dump из формы
end;

procedure TMakeCFG.Clr_Make_CFG;
begin
    CFG_Excel_File:='';
    SelectedModel:='';
    MakeCFG.Edit1.Text:='';
    MakeCFG.mmo1.Visible:=False;
    GroupBox1.Visible:=False;
end;

procedure TMakeCFG.ButtonXBRLoadXLSXClick(Sender: TObject);
begin
        MakeCFG.Edit410.Text:='';
        Form1.OpenDialog1.FileName:=CFG_Excel_File;
        Form1.Opendialog1.InitialDir:='F:\!!!CAR!!!\CAR_xlsc\';
        Form1.OpenDialog1.Filter:='xlsx|*.xlsx';
        if Form1.Opendialog1.Execute and
           FileExists(Form1.Opendialog1.FileName) then
        begin
            CFG_Excel_File:=Form1.Opendialog1.FileName;
            if CFG_Excel_File<>'' then
            begin
           //     DiagIni.WriteString('Файл программирования AGS','Bin_File',AGS_UpGrade_File);
                MakeCFG.Edit410.Text:=CFG_Excel_File;
            end;
        end;

    // Загрузка Excel
    MsExcel := CreateOleObject('Excel.Application');
    MsExcel.Visible := true;
    //только чтение
    MsExcel.Workbooks.Open(CFG_Excel_File, 0, True);
    MsExcel.DisplayAlerts:=False;
    ButtonXBR1.Enabled:=true;
    ButtonXBR3.Enabled:=true;
    ActiveControl:= ButtonXBR3;
end;

procedure TMakeCFG.SetList(M:String);
Var
  i:Integer;
begin
    ModelGrid.Cells[0,0]:='№';
    ModelGrid.Cells[1,0]:='Модификация';
    GroupBox1.Caption:='Выбор Модификации '+M;
    GroupBox1.Visible:=true;
 //   y:=3;
    x:=1;
    y:=Num_Col('Modification number');
    if y = 0 then
    begin
         ShowMessage('Нет Modification number! Переключи ExcelSheet');
         Exit;
    end;
    //  начальный Rows
    Start_Row:=6;//x;
    //  конечный Rows
    x:=ExRows;
    End_Row:=ExRows;//x+2;

    ModelGrid.RowCount:=ExRows;
    x:=Start_Row;
    N:=1;
    for i:=1 to End_Row do
    begin
        TempStr:=ExcelSheet.UsedRange.Cells[x+i,y];
        if  TempStr <> '' then
        begin
           ModelGrid.Cells[0,N]:=IntToStr(N);
           ModelGrid.Cells[1,N]:=TempStr;
           Nrow[N]:= x+i;
           N:=N+1;
           ModelGrid.RowCount:=N;
        end;
    end;
    End_Row:=Nrow[N];
    MakeCFG.Edit1.Visible:=true;
    MakeCFG.Edit1.Text:=ModelGrid.Cells[1,End_Row];
    MakeCFG.Edit1.Visible:=true;
end;

procedure TMakeCFG.CheckActiveSheet;
begin
    ExcelSheet := MsExcel.ActiveWorkbook.ActiveSheet;
    ExRows :=ExcelSheet.UsedRange.Rows.Count;
    ExColumns :=ExcelSheet.UsedRange.Columns.Count;
    MakeCFG.Edit1.Text:=IntToStr(ExRows);
end;

procedure TMakeCFG.ButtonXBR3Click(Sender: TObject);
begin
    if CFG_Excel_File <>'' then
    begin
      MakeCFG.CheckActiveSheet;
      NameSheet:= ExcelSheet.Name;
      Label1.Caption:=NameSheet;
      Clr_CFGFromExcel;
      Model:='';
      SetList(Model); // Выбор Модификации
    end
    else ShowMessage('Не выбран Файл Excel');
end;

procedure TMakeCFG.ModelGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
Var
  Str:String;
  i:Integer;
begin
    Clr_CFGFromExcel;
    Str:=ModelGrid.Cells[1,ARow];
    Delete(Str,Pos(' ',Str),Pos(' ',Str)+1);
    SelectedModel:=Str;
    Delete(Str,1,Pos('-',Str));
    Modification_Number:=Str;
    ModelMAZ:=SelectedModel;
    Delete(ModelMAZ,5,Length(ModelMAZ));
// Vehicle_Modification
    for i:=1 to Modif_Size do
      Vehicle_Modif_Data[i]:=Ord(Modification_Number[i]);
    MakeCFG.Edit1.Text:=SelectedModel;
    SelRow:=Nrow[ARow];
    MakeCFG.Edit2.Text:=IntToStr(SelRow);
    Load_CFGFromExcel;
    ButtonXBR2.Enabled:=true;
    ActiveControl:= ButtonXBR2;
end;

function  TMakeCFG.Num_Col(Name:String):Integer;
Var
  Str:String;
  R,C:Integer;
begin
    Num_Col:=0;
    for C:=1 to ExColumns do
    for R:=4 to 6 do
    begin
       Str:= UpperCase(ExcelSheet.UsedRange.Cells[R,C]);
       if Pos(UpperCase(Name),Str) <>0 then
       begin
         Num_Col:=C;
         Exit;
       end;
    end;
end;

procedure TMakeCFG.Load_CFGFromExcel;
Var
  Str:String;
  A,B,LuF,LuR,Lu2,Lu3,LlF,LlR,Ll2,Ll3:Integer;
  AB, Base,E,M:extended;
  PT : PnevmoType;
begin
    KdZ:=StrToFloat(MakeCFG.Edit3.Text);
    Kkin:=StrToFloat(MakeCFG.Edit4.Text);

    SelCol:=Num_Col('Axle config'); //5
    Str:= ExcelSheet.UsedRange.Cells[SelRow,SelCol];
    Delete(Str,Pos('х',Str),Length(Str));
    if Str = '4' then TempStr:= '1';
    if Str = '6' then TempStr:= '2';
    Axles:=StrToInt(TempStr);
    MakeCFG.Edit178.Text:=TempStr; //Количество задних осей
    //
    SelCol:=Num_Col('Wheelbase'); //6
    TempStr:= ExcelSheet.UsedRange.Cells[SelRow,SelCol];
    if Pos('+',TempStr) <>0
    then //'3200+1400'
    begin
        Str:= TempStr;
        Delete(Str,Pos('+',Str),Length(Str));
        A:=StrToInt(Str);
        Str:= TempStr;
        Delete(Str,1,Pos('+',Str));
        B:=StrToInt(Str);
        A:=A+B div 2;
        TempStr:=FloatToStrF(A/1000,ffFixed,5,2);
    end
    else
    begin
        A:=StrToInt(TempStr);
        TempStr:=FloatToStrF(A/1000,ffFixed,5,2);
    end;
    MakeCFG.Edit49.Text:=TempStr; //База автомобиля
    Base:=StrToFloat(TempStr);
    //Контроль прицепа
    SelCol:=Num_Col('trailer');
    Str:= UpperCase(ExcelSheet.UsedRange.Cells[SelRow,SelCol]);
    if Str = 'YES' then
    begin
      MakeCFG.RadioGroup9.ItemIndex:=1;//Контроль давления прицепа
      MakeCFG.CheckBox84.Checked:=true;// CAN прицепа установлен
      MakeCFG.CheckBox231.Checked:=true;// Датчик давления установлен
    end
    else
    begin
      MakeCFG.RadioGroup9.ItemIndex:=2;//Контроль давления прицепа
      MakeCFG.CheckBox84.Checked:=false;// CAN прицепа установлен
      MakeCFG.CheckBox231.Checked:=false;// Датчик давления установлен
    end;
    // Kkin
    SelCol:=Num_Col('Front axle'); //
    Str:= ExcelSheet.UsedRange.Cells[SelRow,SelCol];
    Kkin:= 1.048;
    if Str = '6430-3000015-001' then Kkin:= 1.052; // Lc -240 L5 -228
    if Str = '650103-3000015-001' then Kkin:= 0.93; // Lc -240 L5 -258
    if Str = '6312B3-3000015-000' then Kkin:= 0.93; // Lc -240 L5 -258
    MakeCFG.Edit4.Text:= FloatToStrF(Kkin,ffFixed,5,3);
    //
    SelCol:=Num_Col('Ratio'); // 22,2-22,6
    Str:= ExcelSheet.UsedRange.Cells[SelRow,SelCol];
    Delete(Str,1,Pos('-',Str));
    E:=Kkin*StrToFloat(Str);
    TempStr:=FloatToStrF(E,ffFixed,5,1);
    MakeCFG.Edit48.Text:=TempStr; //Передаточное число Steer
    //
    SelCol:=Num_Col('Rotor tooth number'); //
    MakeCFG.Edit26.Text:=ExcelSheet.UsedRange.Cells[SelRow,SelCol]; //Число зубов ротора
    MakeCFG.Edit21.Text:=ExcelSheet.UsedRange.Cells[SelRow,SelCol]; //Число зубов ротора
    MakeCFG.Edit174.Text:=ExcelSheet.UsedRange.Cells[SelRow,SelCol];//Число зубов ротора
    //
    SelCol:=Num_Col('Tires'); //12
    TempStr:= ExcelSheet.UsedRange.Cells[SelRow,SelCol];

    if Pos(' или ',TempStr) <>0 then

    Delete(TempStr,(Pos(' или ',TempStr)),Length(TempStr));

    if Pos('Front: ',TempStr) <>0
    then //'Front: 315/60R22,5 Rear: 295/60R22,5'
    begin
      Str:= TempStr;
      Delete(Str,1,Pos('Front: ',Str)+6);
      Delete(Str,Pos('Rear',Str),Length(Str));
      TempStrF:= Tire_Calculate(Str);
      Str:= TempStr;//Front: 395/65R22,5 Rear, additional: 315/80R22,5
      Delete(Str,1,Pos('Rear',Str)+5);
      Delete(Str,1,Pos(':',Str)+1);
      TempStrR:= Tire_Calculate(Str);
    end
    else
    begin
    //4381  245/70R19,5 265/70R19,5 или 9.00R20
      if Pos(' ',TempStr) <>0 then
      begin // 245/70R19,5 265/70R19,5
         Str:= TempStr;
         Delete(Str,Pos(' ',Str),Length(Str));
         TireF:=Str;
         TempStrF:= Tire_Calculate(Str);
         Str:= TempStr;
         Delete(Str,1,Pos(' ',Str));
         TireR:=Str;
         TempStrR:= Tire_Calculate(Str);
      end
      else
      begin
        if Pos('/',TempStr) <> 0
        then TempStrF:= Tire_Calculate(TempStr) // 245/70R19,5
        else TempStrF:= Tire2_Calculate(TempStr); //9.00R20 10R22,5
        TempStrR:= TempStrF;
        TireF:= TempStr;
        TireR:= TireF;
      end;
    end;
    MakeCFG.Edit27.Text:=TempStrF;  //Диаметр колес
    MakeCFG.Edit22.Text:=TempStrR;  //Диаметр колес
    MakeCFG.Edit175.Text:=TempStrR;  //Диаметр колес
    MakeCFG.Label5.Caption:=TireF;
    MakeCFG.Label6.Caption:=TireR;

    // Сенсор AGS backward, 1978 (0)
    SelCol:=Num_Col('Yaw sensor');
    Str:= ExcelSheet.UsedRange.Cells[SelRow,SelCol];
    Delete(Str,Pos(',',Str),Length(Str));
    if Str = 'backward' then
                 begin
                    CheckBox299.Checked:=true;
                    CheckBox299.Color:=clBtnFace;
                    CheckBox299.Caption:='Разъем назад';
                    end
                 else
                 begin
                     CheckBox299.Checked:=false;
                     CheckBox299.Color:=clAqua;
                     CheckBox299.Caption:='Разъем вперед';
                 end;

    // Suspension
    SelCol:=Num_Col('Suspension');
    Str:= UpperCase(ExcelSheet.UsedRange.Cells[SelRow,SelCol]);
 //   if Pos('Air bellow',Str) <>0
    if Pos('AIR',Str) <>0
    then //'Air bellow (type1)'
    begin
       if Pos('TYPE',Str) <>0 then
       begin
         Delete(Str,Pos(')',Str),Length(Str));
         Delete(Str,1,Length(Str)-1);
         TempStr:= Str; // type1
         Edit405.Text:=TempStr;
         Str:= ModelMAZ+'_AirKmp';
         // чтение Kmp из CFGIni
         Kmp_Ini:= CFGIni.ReadString(Str,TempStr, '2,16');
       end;
       CheckBox131.Caption:='Пневмо подвеска';
       Label364.Visible:=true;
       Edit405.Visible:=true;
       CheckBox131.Checked:=true;
       CheckBox229.Checked:=true; //ECAS Ps
    end
    else
    begin
       CheckBox131.Caption:='Рессорная';
       Label364.Visible:=false;
       Edit405.Visible:=false;
       CheckBox131.Checked:=false;
       Edit155.Text:='2,16';
       CheckBox229.Checked:= false;  //ECAS Ps
    end;
    // Brake mechanism
    SelCol:=Num_Col('Brake mechanism');
    Str:= UpperCase(ExcelSheet.UsedRange.Cells[SelRow,SelCol]);
    if Pos('DRUM',Str) <>0
    then //
    begin
           CheckBox232.Caption:='Барабан';
           CheckBox232.Checked:=false;
           CheckBox233.Caption:='Барабан';
           CheckBox233.Checked:=false;
    end
    else
    begin
           CheckBox232.Caption:='Диск';
           CheckBox232.Checked:=true;
           CheckBox233.Caption:='Диск';
           CheckBox233.Checked:=true;
     end;
    Str:= ExcelSheet.UsedRange.Cells[SelRow,SelCol+1];
    Delete(Str,1,Pos('type ',Str)+4);
    TempStrF:= Str;
    MakeCFG.Edit269.Text:=TempStrF; // Передняя ось Камера
    Str:= ExcelSheet.UsedRange.Cells[SelRow,SelCol+2];
    Delete(Str,1,Pos('type ',Str)+4);
    Delete(Str,1,Pos('/',Str));
    TempStrR:= Str;
    MakeCFG.Edit270.Text:=TempStrR; //  Передняя ось Камера

    //заполнение пневматики
    // Front  Axles
    TipPnevmo:= 'Fa'+IntToStr(Axles+1);
    if CheckBox232.Caption='Диск'
    then Str:= '_D'
    else Str:= '_B';
    TipPnevmo:= TipPnevmo+Str+MakeCFG.Edit269.Text;
    MakeCFG.Label7.Caption:=TipPnevmo;
    PT:=MakeCFG.Load_Pnevmo(TipPnevmo);
    MakeCFG.Edit76.Text:=PT.Kinj; //
    MakeCFG.Edit75.Text:=PT.Kexh; //
    MakeCFG.Edit197.Text:=PT.FullP; //
    MakeCFG.Edit324.Text:=PT.GinjL; //
    MakeCFG.Edit253.Text:=PT.GinjR; //
    MakeCFG.Edit254.Text:=PT.Gexh; //
    MakeCFG.Edit67.Text:=PT.Dinj; //Dif
    MakeCFG.Edit71.Text:=PT.Dexh; //
    MakeCFG.Edit198.Text:=PT.Ddelay; //
    // Rear
    TipPnevmo:= 'Ra'+IntToStr(Axles+1);
    if CheckBox233.Caption='Диск'
    then Str:= '_D'
    else Str:= '_B';
    TipPnevmo:= TipPnevmo+Str+MakeCFG.Edit270.Text;
    MakeCFG.Label8.Caption:=TipPnevmo;
    PT:=MakeCFG.Load_Pnevmo(TipPnevmo);
    MakeCFG.Edit77.Text:=PT.Kinj; //
    MakeCFG.Edit78.Text:=PT.Kexh; //
    MakeCFG.Edit196.Text:=PT.FullP; //
    MakeCFG.Edit266.Text:=PT.GinjL; //
    MakeCFG.Edit267.Text:=PT.Gexh; //
    MakeCFG.Edit68.Text:=PT.Dinj; //Dif
    MakeCFG.Edit72.Text:=PT.Dexh; //
    MakeCFG.Edit199.Text:=PT.Ddelay; //

    // GearBox Manual
    SelCol:=Num_Col('Transmission');
    Str:= ExcelSheet.UsedRange.Cells[SelRow,SelCol];
    if Pos('Manual',Str) <>0
    then //
    begin
           CheckBox293.Caption:='GearBox Mechanical';
           CheckBox293.Checked:=false;
    end
    else
    begin
           CheckBox293.Caption:='GearBox Automatic';
           CheckBox293.Checked:=true;
    end;

    SelCol:=Num_Col('Axle load (unladen)');
    Str:= ExcelSheet.UsedRange.Cells[SelRow,SelCol];
    Delete(Str,Pos('*',Str),Length(Str));
    Delete(Str,Pos(' ',Str),Length(Str));
    LuF:=StrToInt(Str);
    MakeCFG.Edit169.Text:=Str; //Нагрузка оси перед
    Str:= ExcelSheet.UsedRange.Cells[SelRow,SelCol+1];
    Delete(Str,Pos('*',Str),Length(Str));
    Delete(Str,Pos(' ',Str),Length(Str));
    Lu2:=StrToInt(Str);
    if Axles =2 then
    begin
    Str:= ExcelSheet.UsedRange.Cells[SelRow,SelCol+2];
    Delete(Str,Pos('*',Str),Length(Str));
    Delete(Str,Pos(' ',Str),Length(Str));
    Delete(Str,Pos('-',Str),Length(Str));
    if Str <> '' then  Lu3:=StrToInt(Str)
                 else Lu3:=0;
    end
    else Lu3:=0;
    LuR:=Lu2+Lu3;
    MakeCFG.Edit170.Text:=IntToStr(LuR); //Нагрузка оси зад
    MakeCFG.Edit154.Text:=IntToStr(LuF+LuR); //Снаряженная масса
     // Axle load (laden)
    SelCol:=Num_Col('Axle load (laden)');
    Str:= ExcelSheet.UsedRange.Cells[SelRow,SelCol];
    Delete(Str,Pos('*',Str),Length(Str));
    Delete(Str,Pos(' ',Str),Length(Str));
    LlF:=StrToInt(Str);
    Str:= ExcelSheet.UsedRange.Cells[SelRow,SelCol+1];
    Delete(Str,Pos('*',Str),Length(Str));
    Delete(Str,Pos(' ',Str),Length(Str));
    Ll2:=StrToInt(Str);
 //   Str:= ExcelSheet.UsedRange.Cells[6,SelCol+2];
 //   if Pos('Axle 3',Str) <>0 then
    if Axles =2 then
    begin
      Str:= ExcelSheet.UsedRange.Cells[SelRow,SelCol+2];
      Delete(Str,Pos('*',Str),Length(Str));
      Delete(Str,Pos(' ',Str),Length(Str));
      Ll3:=StrToInt(Str);
    end
    else  Ll3:=0;
    LlR:=Ll2+Ll3;
    MakeCFG.Edit168.Text:=IntToStr(LlF+LlR-LuF-LuR); //Максимальная нагрузка
    AB:=Base/(1+(LlF-LuF)/(LlR-LuR));
    TempStr:=FloatToStrF(AB,ffFixed,5,2);
    MakeCFG.Edit53.Text:=TempStr; // Центр сцепки

    E:=AB+(Base-AB)*0.5;//5;
    TempStr:=FloatToStrF(E,ffFixed,5,2);
    MakeCFG.Edit293.Text:=TempStr; // База поворота   Lо'о

    E:=(LlR/Axles-StrToInt(MakeCFG.Edit6.Text))/
                        StrToFloat(MakeCFG.Edit8.Text)/1000;
    TempStr:=FloatToStrF(E,ffFixed,5,2);
    if CFGIni.ReadString('Air_bellow','Type', '0') = 'Calculation' then
    Edit155.Text:=TempStr; // Kmp расчет
    if CFGIni.ReadString('Air_bellow','Type', '0') = 'From_CFGIni' then
    Edit155.Text:=Kmp_Ini; // Kmp из CFGIni

    SelCol:=Num_Col('Track width');
    Str:= ExcelSheet.UsedRange.Cells[SelRow,SelCol];
    // Track width (front axle/rear axle), mm  //2087/1804/2058
    Delete(Str,Pos('/',Str),Length(Str));
    Delete(Str,Pos('/',Str),Length(Str));
    E:=StrToFloat(Str)/1000;
    TempStr:=FloatToStrF(E,ffFixed,5,2);
    MakeCFG.Edit73.Text:=TempStr; // Передняя колея
    //Engine
    SelCol:=Num_Col('Maximum torque');
    Str:= ExcelSheet.UsedRange.Cells[SelRow,SelCol];
    Delete(Str,Pos('(',Str)-1,Length(Str));
    TempStr:=Str;
    MakeCFG.Edit125.Text:=Str; // Максимальный момент
    //
    SelCol:=Num_Col('Hight of center of mass');
    Str:= ExcelSheet.UsedRange.Cells[SelRow,SelCol];
    E:=StrToFloat(Str)/1000;
    TempStr:=FloatToStrF(E,ffFixed,5,2);
    MakeCFG.Edit330.Text:=TempStr; // Высота центра масс
    //
    M:=StrToInt(Edit168.Text)+StrToInt(Edit154.Text);//полная масса
    LuF:=StrToInt(Edit269.Text);
    LuR:=StrToInt(Edit270.Text)*Axles;
    E:=(LuF*LuF+LuR*LuR)/M*950;//1390
    Edit219.Text:=IntToStr(Round(E));//FloatToStrF(E,ffFixed,5,2);
end;

procedure TMakeCFG.Clr_CFGFromExcel;
begin
    MakeCFG.CheckBox293.Caption:='';//GearBox Mechanical
    MakeCFG.CheckBox293.Checked:=false;
    MakeCFG.CheckBox131.Caption:='';//'Рессорная';
    MakeCFG.CheckBox131.Checked:=false;
    MakeCFG.Label364 .Visible:=false;
    MakeCFG.Edit405.Visible:=false;
    MakeCFG.Edit405.Text:=''; //Tip
    MakeCFG.Edit178.Text:=''; //Количество задних осей
    MakeCFG.Edit49.Text:=''; //База автомобиля
    MakeCFG.Edit48.Text:=''; //Передаточное число Steer
    MakeCFG.Edit26.Text:=''; //Число зубов ротора
    MakeCFG.Edit21.Text:=''; //Число зубов ротора
    MakeCFG.Edit174.Text:=''; //Число зубов ротора
    MakeCFG.Edit27.Text:='';  //Диаметр колес
    MakeCFG.Edit22.Text:='';  //Диаметр колес
    MakeCFG.Edit175.Text:=''; //Диаметр колес
    MakeCFG.Edit169.Text:=''; //Нагрузка оси перед
    MakeCFG.Edit170.Text:=''; //Нагрузка оси зад
    MakeCFG.Edit154.Text:=''; //Снаряженная масса
    MakeCFG.Edit168.Text:=''; //Максимальная нагрузка
    MakeCFG.Edit53.Text:=''; // Центр сцепки
    MakeCFG.Edit73.Text:=''; // Передняя колея
    MakeCFG.Edit125.Text:=''; // Максимальный момент
    MakeCFG.Edit330.Text:=''; // Высота центра масс
    MakeCFG.Edit293.Text:=''; // База поворота   Lо'о
    MakeCFG.Label5.Caption:='';
    MakeCFG.Label6.Caption:='';
    MakeCFG.CheckBox299.Checked:=true;
    MakeCFG.CheckBox299.Color:=clBtnFace;
    MakeCFG.CheckBox299.Caption:='Разъем назад';
    MakeCFG.Label7.Caption:='';
    MakeCFG.CheckBox232.Checked:=false;// Барабан
    MakeCFG.Edit269.Text:=''; // Тип
    MakeCFG.Edit76.Text:=''; //
    MakeCFG.Edit75.Text:=''; //
    MakeCFG.Edit197.Text:=''; //
    MakeCFG.Edit324.Text:=''; //
    MakeCFG.Edit253.Text:=''; //
    MakeCFG.Edit254.Text:=''; //
    MakeCFG.Edit67.Text:=''; //Dif
    MakeCFG.Edit71.Text:=''; //
    MakeCFG.Edit198.Text:=''; //
    MakeCFG.Label8.Caption:='';
    MakeCFG.CheckBox233.Checked:=false;// Барабан
    MakeCFG.Edit270.Text:=''; // Тип
    MakeCFG.Edit77.Text:=''; //
    MakeCFG.Edit78.Text:=''; //
    MakeCFG.Edit196.Text:=''; //
    MakeCFG.Edit266.Text:=''; //
    MakeCFG.Edit267.Text:=''; //
    MakeCFG.Edit68.Text:=''; //Dif
    MakeCFG.Edit72.Text:=''; //
    MakeCFG.Edit199.Text:=''; //
    MakeCFG.RadioGroup9.ItemIndex:=-1;//Контроль давления прицепа
    MakeCFG.CheckBox84.Checked:=false;// CAN прицепа установлен
    MakeCFG.CheckBox231.Checked:=false;// Датчик давления установлен
end;

function  TMakeCFG.Tire_Calculate(Tip:String):String;
Var
  A,B,C:String;
 // H, // высота профиля
 // Ds:Extended;
begin
   A:=Tip;
   Delete(A,Pos('/',A),Length(A));
   B:=Tip;
   Delete(B,1,Pos('/',B));
   Delete(B,Pos('R',B),Length(B));
   C:=Tip;
   Delete(C,1,Pos('R',C));
   // учет KdZ коэффициент вертикальной деформации
   Tire_Calculate:= FloatToStrF((((StrToInt(A) * StrToInt(B) /50)*KdZ +
                                  StrToFloat(C) * 25.4)/1000),
                                ffFixed,5,2);
end;
{
00- обозначение полнопрофильной шины для грузовых автомобилей.
Два нуля через точку означают отношение высоты профиля к ширине, равное 100%.
Единица в разрядесотен при этом опускается.
Таким образом маркировка типа 8.25 будет означать ширину профиля 8 дюймов,
при отношении высоты к ширине в 125%
}
function  TMakeCFG.Tire2_Calculate(Tip:String):String;
Var
  A,B,C:String;
  W,           // ширина профиля
  k,  // отношение высоты профиля к %
  H,           // высота профиля
  D: Extended; // диаметр диска ,m
begin
   A:=Tip; // 9.00R20
   Delete(A,Pos('R',A),Length(A));
   k:=100; //отношение высоты шины к ширине в процентах
   if (Pos('.',A) <>0)then
   begin
     B:=A;
     Delete(A,Pos('.',A),Length(A)); // A - ширина профиля
     Delete(B,1,Pos('.',B));
     k:=StrToInt(B) +100;
     if B ='00' then B:='100';
   end;
   if (Pos(',',A) <>0)then
   begin
     B:=A;
     Delete(A,Pos(',',A),Length(A)); // A - ширина профиля
     Delete(B,1,Pos(',',B));
     k:=StrToInt(B) +100;
     if B ='00' then B:='100';
   end;
   // учет KdZ коэффициент вертикальной деформации
   H:= StrToInt(A)*k*KdZ*0.000254;// /100*25.4/1000;
   C:=Tip;
   Delete(C,1,Pos('R',C));
   // диаметр диска
   D:= StrToFloat(C)*0.0254; //*25.4/1000
   Tire2_Calculate:= FloatToStrF((H*2+D),ffFixed,5,2);
end;

procedure TMakeCFG.ButtonXBR1Click(Sender: TObject);
begin
    MakeCFG.Clr_Make_CFG;
    MakeCFG.Clr_CFGFromExcel;
    MsExcel.Application.Quit;
    ButtonXBR1.Enabled:=False;
end;

procedure TMakeCFG.Dump_Load;
Var
  Str:String;
  Loop:Integer;
begin
        AssignFile(ConfigFile,CFG_Default);
        Reset(ConfigFile);
        for Loop:=0 to SizeDumpMOT do
        begin
           ReadLn(ConfigFile,Str);
           DumpMOT[Loop]:=StrToInt(Str);
        end;
        CloseFile(ConfigFile);
        Default_Cmpl:=true;
        MakeCFG.mmo1.Lines.Add('Загружен  ');
        MakeCFG.mmo1.Lines.Add(CFG_Default);
end;

procedure TMakeCFG.Save_FileCFG;
Var
  Str:String;
  Loop,i:Integer;
begin
         AssignFile(ConfigFile,CFG_File);
         ReWrite(ConfigFile);
// заполняем конец буфера 0 т.к. в DumpMOT $FF
    i:=SizeDumpMOT;
    while DumpMOT[i] = $FF do
    begin
       DumpMOT[i]:= 0;
       i:= i-1;
    end;
// Vehicle_Modification
    for i:=1 to Modif_Size do
    begin
      Vehicle_Modif_Data[i]:=Ord(Modification_Number[i]);
      DumpMOT[348+i-1]:= Vehicle_Modif_Data[i];
    end;

         for Loop:=0 to SizeDumpMOT do
          begin
            Str:=IntToStr(DumpMOT[Loop]);
            WriteLn(ConfigFile,Str);
          end;
          CloseFile(ConfigFile);
          MakeCFG.mmo1.Lines.Add('Создан файл конфигурации  ');
          MakeCFG.mmo1.Lines.Add(CFG_File);
end;

procedure TMakeCFG.ButtonXBR2Click(Sender: TObject);
Var
  Str:String;
  Loop:Integer;
begin
    if SelectedModel = '' then
    begin
       ShowMessage('Не выбранa Модификация');
       Exit;
    end;
    MakeCFG.mmo1.Clear;
    MakeCFG.mmo1.Visible:=true;
    // создаем папки если их нет
    FilesPath:=ExtractFilePath(Application.ExeName) +
                'CFG\';
    TempStr:=NameSheet;
    Delete(TempStr,1,Pos('-',TempStr));
    Delete(TempStr,Pos(',',TempStr),Length(TempStr));
    Str:=TempStr;
    Delete(TempStr,Length(TempStr)-1,Length(TempStr));
    Cars_Folder:=FilesPath+TempStr;
    Model_Folder:=Cars_Folder+'\'+Str;
    CreateDir(Cars_Folder);
    CreateDir(Model_Folder);
    MakeCFG.mmo1.Lines.Add('Создана Папка  ');
    MakeCFG.mmo1.Lines.Add(Model_Folder);
    // загружаем Default
    Default_Cmpl:=False;
    CFG_Default:=Cars_Folder+'\CFG_MAZ_'+TempStr+'_Default.asm';
    if  FindFirst(CFG_Default, faAnyFile, sr) <> 0 then
    begin
       MakeCFG.mmo1.Lines.Add('Не найден Default.asm');
       CFG_Default_FromMake:=CFG_Default;
       ShowMessage('Не найден Default.asm! Необходимо Создать');
       GroupBox3.Color:= clGradientActiveCaption;
       ActiveControl:= Button1;
       FindClose(sr);
       Exit;
    end
    else
    begin
       CFG_Default_FromMake:='';
       MakeCFG.Dump_Load;
       Form1.View_SKU_CFG;
       Form1.CheckBox_140;
       MakeCFG.Edit226.Text:= Form1.Edit226.Text;
       MakeCFG.Edit5.Text:= Form1.Edit155.Text;
       MakeCFG.Edit328.Text:= Form1.Edit328.Text;
       // заменяем Edit
       MakeCFG.Set_CFGFromExcel;
       MakeCFG.FormToDump; //заполнение Dump из формы
       MakeCFG.mmo1.Lines.Add('Заполнен Dump из формы');
       //
       CFG_File:=Model_Folder+'\'+SelectedModel+'.asm';
       if  (FindFirst(CFG_File, faAnyFile, sr) <> 0)
       then MakeCFG.Save_FileCFG
       else
       begin
          Str:='Файл существует. Перезаписать '+CFG_File;
          if Application.MessageBox(PChar(Str),
             'Предупреждение', MB_OkCancel+MB_ICONASTERISK+MB_APPLMODAL) = idOk
          then MakeCFG.Save_FileCFG;
       end;
       FindClose(sr);
    end;
end;

procedure TMakeCFG.Set_CFGFromExcel;
begin
    Form1.CheckBox293.Caption:=MakeCFG.CheckBox293.Caption;//GearBox Mechanical
    Form1.CheckBox293.Checked:=MakeCFG.CheckBox293.Checked;
    Form1.CheckBox131.Caption:=MakeCFG.CheckBox131.Caption;//'Рессорная';
    Form1.CheckBox131.Checked:=MakeCFG.CheckBox131.Checked;
    Form1.Label364 .Visible:=MakeCFG.Label364 .Visible;
    Form1.Edit405.Visible:=MakeCFG.Edit405.Visible;
    Form1.Edit405.Text:=MakeCFG.Edit405.Text;
    Form1.Edit178.Text:= MakeCFG.Edit178.Text; //Количество задних осей
    Form1.Edit49.Text:= MakeCFG.Edit49.Text;   //База автомобиля
    Form1.Edit48.Text:= MakeCFG.Edit48.Text;   //Передаточное число Steer
    Form1.Edit26.Text:= MakeCFG.Edit26.Text;   //Число зубов ротора
    Form1.Edit21.Text:= MakeCFG.Edit21.Text;   //Число зубов ротора
    Form1.Edit174.Text:= MakeCFG.Edit174.Text; //Число зубов ротора
    Form1.Edit27.Text:= MakeCFG.Edit27.Text;   //Диаметр колес
    Form1.Edit22.Text:= MakeCFG.Edit22.Text;   //Диаметр колес
    Form1.Edit175.Text:= MakeCFG.Edit175.Text; //Диаметр колес
    Form1.Edit169.Text:= MakeCFG.Edit169.Text; //Нагрузка оси перед
    Form1.Edit170.Text:= MakeCFG.Edit170.Text; //Нагрузка оси зад
    Form1.Edit154.Text:= MakeCFG.Edit154.Text; //Снаряженная масса
    Form1.Edit168.Text:= MakeCFG.Edit168.Text; //Максимальная нагрузка
    Form1.Edit53.Text:= MakeCFG.Edit53.Text;   // Центр сцепки
    Form1.Edit73.Text:= MakeCFG.Edit73.Text;   // Передняя колея
    Form1.Edit125.Text:= MakeCFG.Edit125.Text; // Максимальный момент
    Form1.Edit330.Text:= MakeCFG.Edit330.Text; // Высота центра масс
    Form1.Edit293.Text:= MakeCFG.Edit293.Text; // База поворота   Lо'о
    Form1.CheckBox299.Checked:=MakeCFG.CheckBox299.Checked; //Разъем назад
    Form1.CheckBox232.Checked:=MakeCFG.CheckBox232.Checked;// Барабан
    Form1.Edit269.Text:=MakeCFG.Edit269.Text;  // Тип
    Form1.Edit76.Text:=MakeCFG.Edit76.Text; //
    Form1.Edit75.Text:=MakeCFG.Edit75.Text; //
    Form1.Edit197.Text:=MakeCFG.Edit197.Text; //
    Form1.Edit324.Text:=MakeCFG.Edit324.Text; //
    Form1.Edit253.Text:=MakeCFG.Edit253.Text; //
    Form1.Edit254.Text:=MakeCFG.Edit254.Text; //
    Form1.Edit67.Text:=MakeCFG.Edit67.Text;   //Dif
    Form1.Edit71.Text:=MakeCFG.Edit71.Text; //
    Form1.Edit198.Text:=MakeCFG.Edit198.Text; //
    Form1.Edit77.Text:=MakeCFG.Edit77.Text; //
    Form1.CheckBox233.Checked:=MakeCFG.CheckBox233.Checked;// Барабан
    Form1.Edit270.Text:=MakeCFG.Edit270.Text; // Тип
    Form1.Edit78.Text:=MakeCFG.Edit78.Text; //
    Form1.Edit196.Text:=MakeCFG.Edit196.Text; //
    Form1.Edit266.Text:=MakeCFG.Edit266.Text; //
    Form1.Edit267.Text:=MakeCFG.Edit267.Text; //
    Form1.Edit68.Text:=MakeCFG.Edit68.Text;   //Dif
    Form1.Edit72.Text:=MakeCFG.Edit72.Text; //
    Form1.Edit199.Text:=MakeCFG.Edit199.Text; //
    Form1.RadioGroup9.ItemIndex:=MakeCFG.RadioGroup9.ItemIndex;//Контроль давления прицепа
    Form1.CheckBox84.Checked:=MakeCFG.CheckBox84.Checked;// CAN прицепа установлен
    Form1.CheckBox231.Checked:=MakeCFG.CheckBox231.Checked;// Датчик давления установлен
    Form1.Edit155.Text:=MakeCFG.Edit155.Text; // Kmp
    Form1.CheckBox229.Checked:=MakeCFG.CheckBox229.Checked;// ECAS Psen Установлен
end;

procedure TMakeCFG.Button1Click(Sender: TObject);
Var
  DefaultFile:TextFile;
  Str:String;
  Loop:Integer;
begin
    // загружаем файл
    Form1.Opendialog1.InitialDir:=FilesPath+'\!Tested_CFG';
    Form1.Opendialog1.Filter:='asm|*.asm';
    if  Form1.Opendialog1.Execute and
        FileExists(Form1.Opendialog1.FileName) then
    begin
        CFG_Default:=Form1.Opendialog1.FileName;
        AssignFile(DefaultFile,CFG_Default);
        Reset(DefaultFile);
        for Loop:=0 to SizeDumpMOT do
        begin
           ReadLn(DefaultFile,Str);
           DumpMOT[Loop]:=StrToInt(Str);
        end;
        CloseFile(DefaultFile);
        MakeCFG.DumpToForm;
        MakeCFG.mmo1.Clear;
        MakeCFG.mmo1.Visible:=true;
        MakeCFG.mmo1.Lines.Add('Загружен исходный файл   ');
        MakeCFG.mmo1.Lines.Add(CFG_Default);
        MakeCFG.mmo1.Lines.Add('Проверьте вкладку Настройка');
        ActiveControl:= Button2;
    end;
end;

procedure TMakeCFG.Button2Click(Sender: TObject);
Var
  DefaultFile:TextFile;
  Str,FP,FN,Default_File:String;
  Loop,i:Integer;
begin
     if CFG_Default_FromMake <>  '' then CFG_Default:=CFG_Default_FromMake;
     Str:=CFG_Default;
     Delete(Str,1,Pos('CFG_MAZ_',Str)+7);
     Delete(Str,5,Length(Str));
     FP:=FilesPath+Str;//путь к файлу
     Str:=CFG_Default;
     Delete(Str,1,Pos('CFG_MAZ_',Str)-1);
     Delete(Str,Pos('CFG_MAZ_',Str)+12,Length(Str));
     FN:=Str+'_Default.asm';  //имя файла
     TempNF:= FP+'\'+FN;
     if  FindFirst(TempNF, faAnyFile, sr) <> 0
     then
     begin   // нет файла
       if FN <> '_Default.asm' then
       begin
         MakeCFG.mmo1.Lines.Add('Нет файла! Создаем папку и файл');
         CreateDir(FP);
         AssignFile(DefaultFile,TempNF);
         ReWrite(DefaultFile);
         CloseFile(DefaultFile);
       end
       else
       begin
         ShowMessage('Нечего сохранять');
         Exit;
       end;
     end;
     FindClose(sr);
     //
     MakeCFG.FormToDump; //заполнение Dump из формы
     i:=SizeDumpMOT;
     while DumpMOT[i] = $FF do
     begin
       DumpMOT[i]:= 0;
       i:= i-1;
     end;
     // Vehicle_StateAGS
     DumpMOT[222] := 0;
     // Vehicle.StateSAS
     DumpMOT[223] := 0;
     // VIN
     for i:=1 to 17 do
     begin
      Vehicle_VIN_Data[i]:=48;
      DumpMOT[224+i-1]:= Vehicle_VIN_Data[i];
     end;
     //
     SaveDialog1.InitialDir:=FP;// путь к файлу в SaveDialog
     SaveDialog1.Filter:='asm|*.asm';
     SaveDialog1.FileName:=FN;  // имя файла  в SaveDialog
     if SaveDialog1.Execute then
     begin
        if not FileExists(SaveDialog1.FileName) then
        begin
          Str:='Изменено имя файла'+Fn;
          if Application.MessageBox(PChar(Str),
             'Предупреждение', MB_OkCancel+MB_ICONASTERISK+MB_APPLMODAL) = idCancel
          then Exit;
        end;
        Default_File:=SaveDialog1.FileName;
        AssignFile(DefaultFile,Default_File);
        ReWrite(DefaultFile);
        for Loop:=0 to SizeDumpMOT do
        begin
            Str:=IntToStr(DumpMOT[Loop]);
            WriteLn(DefaultFile,Str);
        end;
        CloseFile(DefaultFile);
        MakeCFG.mmo1.Lines.Add('Сохранен файл   ');
        MakeCFG.mmo1.Lines.Add(Default_File);
        // копируем в папку Default_CFG
        Str:=Default_File;
        Delete(Str,1,Pos('CFG_MAZ_',Str)-1);
        TempNF:= FilesPath+'!Default_CFG\'+Str;
        CopyFile(PChar(Default_File), PChar(TempNF), false); // false - функция перезапишет файл
        MakeCFG.mmo1.Lines.Add('Файл скопирован в папку Default_CFG');
        GroupBox3.Color:= clBtnFace;
    end;
    SaveDialog1.Free;
end;

procedure TMakeCFG.FormActivate(Sender: TObject);
begin
    FilesPath:=ExtractFilePath(Application.ExeName) +'CFG\';
    CFGIni := TIniFile.Create(IniPath+'\CFG\CFGIni.ini' );
  //  ButtonXBR3.Enabled:=False;
    ButtonXBR2.Enabled:=False;
  //  ButtonXBR1.Enabled:=False;
end;

end.
