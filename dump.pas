unit Dump;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, StdCtrls, ComCtrls, ExtCtrls;

type
  TDumpForm = class(TForm)
    Gdump: TStringGrid;
    bQuit: TButton;
    dumpStatBar: TStatusBar;
    bRead: TButton;
    changeSave: TButton;
    procedure ViewDump;
    procedure FormShow(Sender: TObject);
    procedure bQuitClick(Sender: TObject);
    procedure bReadClick(Sender: TObject);
    procedure GdumpSetEditText(Sender: TObject; ACol, ARow: Integer;
                               const Value: String);
    procedure changeSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DumpForm: TDumpForm;

implementation
uses mainABSdiag, Link_Unit,Link_Processor,
     Task_Progress, Com_Thread;

{$R *.DFM}

var
   changeArray,dataArray : Array [0..2047] of Byte;
//   addrArray : Array [0..2047] of Word;
//******************************************************************
procedure TDumpForm.ViewDump;
var
  i: integer;
  hexstr : string;
begin
   hexstr := '0123456789ABCDEF';
   DumpForm.Gdump.cells[0, 0] := '';
   for i := 1 to 16 do DumpForm.Gdump.cells[i, 0] := ' 0'+hexstr[i];
   for i := 0 to (EEPROMSize div 16) do
      DumpForm.Gdump.cells[0, i+1] :=
      ' 0'+hexstr[(i div 16)+1]+hexstr[(i mod 16)+1];
   for i := 0 to EEPROMSize-1 do
      DumpForm.Gdump.cells[(i mod 16)+1,(i div 16)+1] :=
                                  inttostr(DumpEPROM[i]);
   DumpForm.Gdump.RowCount:=(EEPROMSize div 16)+1;
end;


procedure TDumpForm.FormShow(Sender: TObject);
begin
   bRead.Enabled := False;
   changeSave.Enabled := False;
   ViewDump;
   DumpForm.Gdump.Repaint;
   bRead.Enabled := True;
end;
//**************************************************************

//**********Прочитать данные**********
procedure TDumpForm.bReadClick(Sender: TObject);
var
  i : integer;
begin
   if not Com_Connected_F then Exit;
   Fl_DumpATLoad := False;
   bRead.Enabled := False;
   Form2.Caption:='Чтение EEPROM';
   Form2.Label1.Caption:='Идет чтение EEPROM';
   Form2.Label2.Caption:='Пожалуйста подождите';
   Form2.ProgressBar1.Position:=0;
   Form2.Visible:=True;
   FormISO.DumpAT_EPROM;
   repeat Application.ProcessMessages until Fl_DumpATLoad;
   for i := 0 to (EEPROMSize-1) do
        DumpForm.Gdump.cells[(i mod 16)+1,(i div 16)+1] :=
                                  inttostr(DumpEPROM[i]);
   Form2.Visible:=False;
   bRead.Enabled :=True;
end;
//***************************************************************

//**********Сохранить изменения**********
procedure TDumpForm.changeSaveClick(Sender: TObject);
var
   i, n : integer;
begin
   if not Set_Security then  exit;
   for i := 0 to ((EEPROMSize div 16)-1) do
    for n := 0 to 15  do
     dataArray[i*16 + n] := StrToInt(Gdump.cells[n+1, i+1]);
   n := 0;
   for i := 0 to (EEPROMSize-1) do
       if changeArray[i] = 1 then
          begin
             DdataArray[n] := dataArray[i];
             DaddrArray[n] := i;
             inc(n);
          end;
   dumpStatBar.SimpleText := 'Запись данных в EEPROM.';
   for i := 0 to EEPROMSize-1 do   changeArray[i] := 0;
   if n = 0 then Exit;
   DumpNum:=n;
   FormISO.WriteATEPROM_dum;
   bRead.Enabled := True;
   changeSave.Enabled := False;
end;

//**********Закрыть форму**********
procedure TDumpForm.bQuitClick(Sender: TObject);
begin
    close;
end;
//************************************************************

//В ячейку внесены изменения
procedure TDumpForm.GdumpSetEditText(Sender: TObject; ACol, ARow: Integer;
  const Value: String);
begin
    if Value = '' then Exit;
    changeArray[(ACol-1) + (ARow-1)*16] := 1;
    changeSave.Enabled:=True;
end;


end.
