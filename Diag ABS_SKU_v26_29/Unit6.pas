unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids;

type
  TForm6 = class(TForm)
    Motdump: TStringGrid;
    bQuit: TButton;
    bRead: TButton;
    procedure bQuitClick(Sender: TObject);
    procedure ViewDump(DumpStart:integer;DumpEnd:integer);
    procedure FormShow(Sender: TObject);
    procedure bReadClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation
uses mainABSdiag, Link_Unit,Link_Processor,
     Task_Progress, Com_Thread;
     
{$R *.DFM}

procedure TForm6.bQuitClick(Sender: TObject);
begin
    AGS_Read_InProcess:=false;
    SAS_Read_InProcess:=false;
    close;
end;
//DumpFlash_End
//Program_Start
procedure TForm6.ViewDump(DumpStart:integer;DumpEnd:integer);
var
  i: integer;
  hexstr : string;
begin
   hexstr := '0123456789ABCDEF';
   Form6.Motdump.cells[0, 0] := '';
   for i := 1 to 16 do Form6.Motdump.cells[i, 0] := ' '+hexstr[i];
   for i := (DumpStart div 16) to (DumpEnd div 16)
   do Form6.Motdump.cells[0, i-(DumpStart div 16)+1] :=
       hexstr[(i div 256)+1]+
       hexstr[((i mod 256) div 16)+1]+
       hexstr[((i mod 256) mod 16)+1];
   for i := 0 to (DumpEnd-DumpStart) do
   begin
     if AGS_Read_InProcess then
     Form6.Motdump.cells[(i mod 16)+1,(i div 16)+1]:=
        hexstr[(AGS_CFG_Buff[i] div 16)+1]+
        hexstr[(AGS_CFG_Buff[i] mod 16)+1]
     else
     if SAS_Read_InProcess then
     Form6.Motdump.cells[(i mod 16)+1,(i div 16)+1]:=
        hexstr[(SAS_CFG_Buff[i] div 16)+1]+
        hexstr[(SAS_CFG_Buff[i] mod 16)+1]
     else
     Form6.Motdump.cells[(i mod 16)+1,(i div 16)+1] :=
                            IntToStr(DumpFlash[i]);
   end;
   Form6.Motdump.RowCount:=((DumpEnd-DumpStart) div 16) +1;
end;

procedure TForm6.FormShow(Sender: TObject);
var
  i: integer;
begin
   bRead.Enabled := False;
   if AGS_Read_InProcess then
   begin
     Form2.Caption:='Dump CFG AGS';
     ViewDump(AGS_CFG_Start,AGS_CFG_End);
   end
   else
   begin
     Form2.Caption:='Dump Flash';
 //o    ViewDump(DumpMOTStart, (DumpFlash_End -768));
    for i := 0 to DumpMOTEnd do
        DumpFlash[i]:=0;
     ViewDump(DumpMOTStart, (DumpFlash_End));
   end;
   Form6.Motdump.Repaint;
   bRead.Enabled := True;
end;

procedure TForm6.bReadClick(Sender: TObject);
var
  i : integer;
  hexstr : string;
begin
   hexstr := '0123456789ABCDEF';

   if not Com_Connected_F then Exit;
   if AGS_Read_InProcess then
   begin
      Form1.RdCFGClick(nil);
      AGS_CFG_Start:=_Start_CFG_AGS;
      AGS_CFG_End:=_Start_CFG_AGS+AGS_SizeSector;
      ViewDump(AGS_CFG_Start,AGS_CFG_End);
      Form6.Motdump.Repaint;
   end
   else
   if SAS_Read_InProcess then
   begin
      Form1.RdCFGSASClick(nil);
      SAS_CFG_Start:=_Start_CFG_SAS;
      SAS_CFG_End:=_Start_CFG_SAS+SAS_SizeSector;
      ViewDump(SAS_CFG_Start,SAS_CFG_End);
      Form6.Motdump.Repaint;
   end
   else
   begin
   Form2.Caption:='Чтение DUMP';
   Form2.Visible:=True;

//o   DumpFlashLoad(DumpMOTStart,(DumpFlash_End -768));
//   DumpMOTLoad(DumpMOTStart,DumpMOTEnd);
   DumpFlashLoad(DumpMOTStart,(DumpFlash_End));
   repeat Application.ProcessMessages until Fl_FlashLoad;
   for i := 0 to (DumpFlash_End-DumpMOTStart) do
   Form6.Motdump.cells[(i mod 16)+1,(i div 16)+1] :=
                                  IntToStr(DumpFlash[i]);
                              //o    IntToStr(DumpMOT[i]);
   Form2.Visible:=False;
   bRead.Enabled :=True;
   end;
end;

procedure TForm6.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    AGS_Read_InProcess:=false;
end;

end.
