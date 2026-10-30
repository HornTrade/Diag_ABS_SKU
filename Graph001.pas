unit Graph001;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Menus;

type
  TGraph = class(TForm)
    OscBox: TPaintBox;
    Panel1: TPanel;
    ComboBox1: TComboBox;
    ScrollBar1: TScrollBar;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    MainMenu1: TMainMenu;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    procedure Activated(Sender: TObject);
    Procedure LoadData;
    Procedure DrawGrid;
    Procedure DrawPlot;
    Procedure DrawGraph;
    procedure DrawRepaint;   
    procedure CheckBox1Click(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure OscBoxMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Type  CarDeviceID=Record
      ID1,ID2,ID3,ID4:Byte;
end;
Type
      Data_8Bytes=Record
      TimerSynch:Integer;  //
      D0,D1,D2,D3,D4,D5,D6,D7:Byte;
end;
Type
      DataFormat=Record
      CanCounter:Integer;
      CanData:array[1..20000] of Data_8Bytes;
end;

var
  Graph: TGraph;
  FSize,IDCounter:Integer;
  MainFileName,DataFileName:String;
  PCan,P0Can:^Byte;
  DataFile:File of Byte;
  IDArray:array[1..200] of CarDeviceID;
  Data:array[1..200] of DataFormat;
  CurrentData:Data_8Bytes;
  CurrentID:CarDeviceID;
  CurrentTimerSynch:Integer;
  Graph0Pos,Graph1Pos,Graph2Pos,Graph3Pos,Graph4Pos,Graph5Pos,Graph6Pos,Graph7Pos:Integer;
  ActiveID,Graph_X,Graph_Y,Plot_Num,X1:Integer;

implementation

uses mainABSdiag ;



{$R *.DFM}

function   DecBin(data:integer):string;
var     Str:String;
begin
 if  (data and 128) =128 then Str:='1' else Str:='0';
 if  (data and 64) =64 then Str:=Str+'1' else Str:=Str+'0';
 if  (data and 32) =32 then Str:=Str+'1' else Str:=Str+'0';
 if  (data and 16) =16 then Str:=Str+'1' else Str:=Str+'0';
 if  (data and 8) =8   then Str:=Str+'1' else Str:=Str+'0';
 if  (data and 4) =4   then Str:=Str+'1' else Str:=Str+'0';
 if  (data and 2) =2   then Str:=Str+'1' else Str:=Str+'0';
 if  (data and 1) =1   then Str:=Str+'1' else Str:=Str+'0';
 DecBin:=Str;
end;

procedure TGraph.LoadData;
Var       Loop0,Loop1,BytesCounter,TestInt:Integer;
          TestByte,SizePaket:Byte;
          TestString:String;
          Found:Boolean;
begin
     if DataFileName ='' then exit;
     AssignFile(DataFile,DataFileName);
     Reset(DataFile);
     FSize:=FileSize(DataFile);
     fl_GetMem_CAN := True;
     GetMem(PCan,FSize);
     P0Can:=PCan;
     BlockRead(DataFile,PCan^,FSize);
     IDCounter:=0;
     ComboBox1.Clear;
     BytesCounter:=0;
 {    if CAN_Oss_TipBlock = 8 then
          SizePaket:=24
     else SizePaket:=16; //o    For Loop0:=1 to FSize div 16 do  }
     SizePaket:=28;
     For Loop0:=1 to FSize div SizePaket do
     begin
       CurrentTimerSynch:=P0Can^;
       inc(P0Can,1);
       CurrentTimerSynch:=CurrentTimerSynch+256*P0Can^;
       inc(P0Can,1);
       CurrentTimerSynch:=CurrentTimerSynch+256*256*P0Can^;
       inc(P0Can,1);
       CurrentTimerSynch:=CurrentTimerSynch+256*256*256*P0Can^;
 //      if CurrentTimerSynch =214748504 then
 //      if CAN_Oss_TipBlock = 8 then
       if NumberOsc = 24 then
       begin
         // block v8
         // определяется назначением в осцилографе
         // RoadTestBuf по 3 сверху
          inc(P0Can,1);
          CurrentID.ID1:=P0Can^;
          inc(P0Can,1);
          CurrentData.D0:=P0Can^;
          inc(P0Can,1);
          CurrentData.D4:=P0Can^;
          inc(P0Can,1);
          CurrentID.ID2:=P0Can^;
          inc(P0Can,1);
          CurrentData.D1:=P0Can^;
          inc(P0Can,1);
          CurrentData.D5:=P0Can^;
          inc(P0Can,1);
          CurrentID.ID3:=P0Can^;
          inc(P0Can,1);
          CurrentData.D2:=P0Can^;
          inc(P0Can,1);
          CurrentData.D6:=P0Can^;
          inc(P0Can,1);
          CurrentID.ID4:=P0Can^;
          inc(P0Can,1);
          CurrentData.D3:=P0Can^;
          inc(P0Can,1);
          CurrentData.D7:=P0Can^;
          // RoadTestBuf 28 = 24-прием + 4-TimerSynch
          // пропускаем 13 = 28 - (4+4+8) +1
          inc(P0Can,13);
       end;
       if NumberOsc = 20 then
       begin
          inc(P0Can,1);
          CurrentID.ID1:=P0Can^ shr 3; //*
          CurrentID.ID2:=P0Can^ shl 5;
          inc(P0Can,1);
          CurrentData.D0:=P0Can^;
          inc(P0Can,1);
          CurrentData.D4:=P0Can^;
          inc(P0Can,1);
  // для MCP
  //        CurrentID.ID2:=(CurrentID.ID2 and 224)
  //        or ((P0Can^ shr 3) and 28) or (P0Can^ and 3);
  // для MOTOROLA GZ
    {      CurrentID.ID2:=(CurrentID.ID2 and 224) or
                         ((P0Can^ shr 3) and 28) or
                         ((P0Can^ shr 1) and 3); }
          CurrentID.ID2:=(CurrentID.ID2 and 224) or
                         ((P0Can^ and 240) shr 3) or
                         ((P0Can^ and 2) shr 1 );
          CurrentID.ID3:=(P0Can^ shl 7) and 128;
          inc(P0Can,1);
          CurrentData.D1:=P0Can^;
          inc(P0Can,1);
          CurrentData.D5:=P0Can^;
          inc(P0Can,1);
          CurrentID.ID3:=CurrentID.ID3 or ((P0Can^ shr 1) and 127);
          CurrentID.ID4:=(P0Can^ shl 7) and 128;
          inc(P0Can,1);
          CurrentData.D2:=P0Can^;
          inc(P0Can,1);
          CurrentData.D6:=P0Can^;
          inc(P0Can,1);
          CurrentID.ID4:=CurrentID.ID4 or ((P0Can^ shr 1) and 127);
          inc(P0Can,1);
          CurrentData.D3:=P0Can^;
          inc(P0Can,1);
          CurrentData.D7:=P0Can^;
          inc(P0Can,13);  // см. выше
       end;
       Inc(BytesCounter,16);
       Found:=False;
       For Loop1:=1 to IDCounter do
         begin
               if  (CurrentID.ID1=IDArray[Loop1].ID1)
               and (CurrentID.ID2=IDArray[Loop1].ID2)
               and (CurrentID.ID3=IDArray[Loop1].ID3)
               and (CurrentID.ID4=IDArray[Loop1].ID4) then
               begin
                    Inc(Data[Loop1].CanCounter);
                    Data[Loop1].CanData[Data[Loop1].CanCounter].TimerSynch:=CurrentTimerSynch;
                    Data[Loop1].CanData[Data[Loop1].CanCounter].D0:=CurrentData.D0;
                    Data[Loop1].CanData[Data[Loop1].CanCounter].D1:=CurrentData.D1;
                    Data[Loop1].CanData[Data[Loop1].CanCounter].D2:=CurrentData.D2;
                    Data[Loop1].CanData[Data[Loop1].CanCounter].D3:=CurrentData.D3;
                    Data[Loop1].CanData[Data[Loop1].CanCounter].D4:=CurrentData.D4;
                    Data[Loop1].CanData[Data[Loop1].CanCounter].D5:=CurrentData.D5;
                    Data[Loop1].CanData[Data[Loop1].CanCounter].D6:=CurrentData.D6;
                    Data[Loop1].CanData[Data[Loop1].CanCounter].D7:=CurrentData.D7;
                    Found:=True;
               end;
         end;
         if  not Found Then
           begin
               TestString:=IntToHex(CurrentID.ID1,2)+' '+
                           IntToHex(CurrentID.ID2,2)+' '+
                           IntToHex(CurrentID.ID3,2)+' '+
                           IntToHex(CurrentID.ID4,2);
               ComboBox1.Items.Add(TestString);
               Inc(IDCounter);
               Data[IDCounter].CanCounter:=0;
               IDArray[IDCounter].ID1:=CurrentID.ID1;
               IDArray[IDCounter].ID2:=CurrentID.ID2;
               IDArray[IDCounter].ID3:=CurrentID.ID3;
               IDArray[IDCounter].ID4:=CurrentID.ID4;
           end;
     end; //Loop0
     CloseFile(DataFile);
end;

procedure TGraph.Activated(Sender: TObject);
begin
     LoadData;
     if IDCounter<>0 then  begin
     ComboBox1.ItemIndex:=0;
     ActiveID:=1;
     ScrollBar1.Max:=(Data[ActiveID].CanCounter div  OscBox.Width);
     ScrollBar1.Position:=0;
     end;
     Graph.Cursor:=crCross;
     DrawRepaint;
end;

Procedure TGraph.DrawGrid;
var Loop,XStep,YStep:Integer;
begin
     CheckBox1.Font.Color:=$0000FF;
     CheckBox2.Font.Color:=$0000DF;
     CheckBox3.Font.Color:=$DF00DF;
     CheckBox4.Font.Color:=$FFFFFF;
     CheckBox5.Font.Color:=$7F7F7F;
     CheckBox6.Font.Color:=$000000;
     CheckBox7.Font.Color:=$007F00;
     CheckBox8.Font.Color:=$00DF00;
     XStep:=OscBox.Width div 10;
     YStep:=OscBox.Height div 6;
     OscBox.Canvas.Pen.Style:=psDot;
     OscBox.Canvas.Pen.Width:=1;
     OscBox.Canvas.Pen.Color:=$FFFFFF;
     OscBox.Color:=Form1.Color;
     OscBox.Update;
     for Loop:=0 to 10 do
     begin
          OscBox.Canvas.MoveTo(Loop*XStep,0);
          OscBox.Canvas.LineTo(Loop*XStep,OscBox.Height);
     end;
     for Loop:=0 to 6 do
     begin
          OscBox.Canvas.MoveTo(0,Loop*YStep);
          OscBox.Canvas.LineTo(OscBox.Width,Loop*YStep);
     end;
     OscBox.Canvas.Pen.Style:=psSolid;
     OscBox.Canvas.Pen.Width:=1;

end;

Procedure TGraph.DrawPlot;
begin
     if CheckBox1.Checked then begin
        OscBox.Canvas.Pen.Color:=$0000FF;
        OscBox.Canvas.MoveTo(Graph_X-1,255-Data[ActiveID].CanData[Graph_Y-1].D0);
        OscBox.Canvas.LineTo(Graph_X,255-Data[ActiveID].CanData[Graph_Y].D0);
     end;
     if CheckBox2.Checked then begin
        OscBox.Canvas.Pen.Color:=$0000DF;
        OscBox.Canvas.MoveTo(Graph_X-1,255-Data[ActiveID].CanData[Graph_Y-1].D1);
        OscBox.Canvas.LineTo(Graph_X,255-Data[ActiveID].CanData[Graph_Y].D1);
     end;
     if CheckBox3.Checked then begin
        OscBox.Canvas.Pen.Color:=$DF00DF;
        OscBox.Canvas.MoveTo(Graph_X-1,255-Data[ActiveID].CanData[Graph_Y-1].D2);
        OscBox.Canvas.LineTo(Graph_X,255-Data[ActiveID].CanData[Graph_Y].D2);
     end;
     if CheckBox4.Checked then begin
        OscBox.Canvas.Pen.Color:=$FFFFFF;
        OscBox.Canvas.MoveTo(Graph_X-1,255-Data[ActiveID].CanData[Graph_Y-1].D3);
        OscBox.Canvas.LineTo(Graph_X,255-Data[ActiveID].CanData[Graph_Y].D3);
     end;
     if CheckBox5.Checked then begin
        OscBox.Canvas.Pen.Color:=$7F7F7F;
        OscBox.Canvas.MoveTo(Graph_X-1,255-Data[ActiveID].CanData[Graph_Y-1].D4);
        OscBox.Canvas.LineTo(Graph_X,255-Data[ActiveID].CanData[Graph_Y].D4);
     end;
     if CheckBox6.Checked then begin
        OscBox.Canvas.Pen.Color:=$000000;
        OscBox.Canvas.MoveTo(Graph_X-1,255-Data[ActiveID].CanData[Graph_Y-1].D5);
        OscBox.Canvas.LineTo(Graph_X,255-Data[ActiveID].CanData[Graph_Y].D5);
     end;
     if CheckBox7.Checked then begin
        OscBox.Canvas.Pen.Color:=$007F00;
        OscBox.Canvas.MoveTo(Graph_X-1,255-Data[ActiveID].CanData[Graph_Y-1].D6);
        OscBox.Canvas.LineTo(Graph_X,255-Data[ActiveID].CanData[Graph_Y].D6);
     end;
     if CheckBox8.Checked then begin
        OscBox.Canvas.Pen.Color:=$00DF00;
        OscBox.Canvas.MoveTo(Graph_X-1,255-Data[ActiveID].CanData[Graph_Y-1].D7);
        OscBox.Canvas.LineTo(Graph_X,255-Data[ActiveID].CanData[Graph_Y].D7);
     end;
end;

Procedure TGraph.DrawGraph;
begin
     Plot_Num:=ScrollBar1.Position;
     For Graph_X:=2 to OscBox.Width  do
     begin
          Graph_Y:=Graph_X+ScrollBar1.Position*OscBox.Width;
          DrawPlot;
     end;
end;
procedure TGraph.CheckBox1Click(Sender: TObject);
begin
     DrawRepaint;
end;

procedure TGraph.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
    Xx: Integer;
begin
     Xx:=X+ScrollBar1.Position*OscBox.Width;
     Label2.Caption:='Y Position: '+IntToStr(255-Y);
     Label12.Caption:='X Position: '+IntToStr(Data[ActiveID].CanData[Xx].TimerSynch);
     Label14.Caption:='deltaX Position: '+IntToStr(Data[ActiveID].CanData[Xx].TimerSynch-X1);

     Label4.Caption:=IntToStr(Data[ActiveID].CanData[Xx].D0);
     Label5.Caption:=IntToStr(Data[ActiveID].CanData[Xx].D1);
     Label6.Caption:=IntToStr(Data[ActiveID].CanData[Xx].D2);
     Label7.Caption:=IntToStr(Data[ActiveID].CanData[Xx].D3);
     Label8.Caption:=IntToStr(Data[ActiveID].CanData[Xx].D4);
     Label9.Caption:=IntToStr(Data[ActiveID].CanData[Xx].D5);
     Label10.Caption:=IntToStr(Data[ActiveID].CanData[Xx].D6);
     Label11.Caption:=IntToStr(Data[ActiveID].CanData[Xx].D7);

     Label15.Caption:=DecBin(Data[ActiveID].CanData[Xx].D0);
     Label16.Caption:=DecBin(Data[ActiveID].CanData[Xx].D1);
     Label17.Caption:=DecBin(Data[ActiveID].CanData[Xx].D2);
     Label18.Caption:=DecBin(Data[ActiveID].CanData[Xx].D3);
     Label19.Caption:=DecBin(Data[ActiveID].CanData[Xx].D4);
     Label20.Caption:=DecBin(Data[ActiveID].CanData[Xx].D5);
     Label21.Caption:=DecBin(Data[ActiveID].CanData[Xx].D6);
     Label22.Caption:=DecBin(Data[ActiveID].CanData[Xx].D7);
end;

procedure TGraph.Button1Click(Sender: TObject);
begin
     OpenDialog1.Execute;
     if OpenDialog1.Files.Text<>'' then DataFileName :=OpenDialog1.FileName;
     if fl_GetMem_CAN then FreeMem(PCan);
     Graph.Activated(nil);
end;
procedure TGraph.DrawRepaint;
begin
     OscBox.Repaint;
     DrawGrid;
     DrawGraph;
end;
procedure TGraph.ComboBox1Click(Sender: TObject);
begin
     ActiveID:=ComboBox1.ItemIndex+1;
     ScrollBar1.Max:=(Data[ActiveID].CanCounter div  OscBox.Width);
     ScrollBar1.Position:=0;
     DrawRepaint;
end;

procedure TGraph.BitBtn1Click(Sender: TObject);
begin
   if fl_GetMem_CAN then FreeMem(PCan);
   close;
end;

procedure TGraph.ScrollBar1Change(Sender: TObject);
begin
    Label13.Caption:=iNTtOsTR(ScrollBar1.Position);
    if ScrollBar1.Position<>Plot_Num then  DrawRepaint;
end;

procedure TGraph.OscBoxMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
        DrawRepaint;
        OscBox.Canvas.Pen.Color:=clWhite;
        OscBox.Canvas.MoveTo(X,0);
        OscBox.Canvas.LineTo(X,OscBox.Height-1);
        X1:=Data[ActiveID].CanData[X+ScrollBar1.Position*OscBox.Width].TimerSynch;
end;

end.
