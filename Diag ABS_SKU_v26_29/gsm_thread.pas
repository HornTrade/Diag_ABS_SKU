unit gsm_thread;

interface

uses
  Classes,Sysutils,Windows;

type
  gsmThread = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  end;
var
        Tgsm:TThread;
        MemStr:TStream;
implementation
uses UnitGSM,mainABSdiag, Link_Unit,Link_Processor;

{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure TThread.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ TThread }

procedure gsmThread.Execute;
var
        buf: string;
  inputBuffer: array[0..2048] of byte;
  BufPos     : integer;
  TempStr:String;
    Loop:Integer;
    BRec:Integer;
begin
   repeat
{ try
  MemStr:=TMemoryStream.Create;
  FormGSM.idTCPClient1.ReadStream(MemStr,-1,False);
  MemStr.Position:=0;
  FormGSM.Memo2.Lines.LoadFromStream(MemStr);
  finally
  MemStr.Free;
  end;}

{  try
//  While FormGSM.IdTcpClient1.Connected do
  begin
  buf := FormGSM.idTCPClient1.readln('');
  if buf <> '' then begin
  FormGSM.Memo2.Lines.Add(buf);
  BytesRecievFromGSM:=BytesRecievFromGSM+length(buf);
  FormGSM.Label16.Caption:=IntToStr(BytesRecievFromGSM);
  buf:='';
  end; }
  
  //buf := FormGSM.idTCPClient1.readln('');

// FormGSM.Memo2.Lines.Add('Data ---' + FormGSM.idTCPClient1.readln(''));

 { FormGSM.idTCPClient1.ReadFromStack(True, 0, False);
  while FormGSM.IdTCPClient1.InputBuffer.Size > 0 do
  begin
    // read one complete frame and process as needed ...
    FormGSM.idTCPClient1.ReadBuffer(DataFromGSM, FormGSM.idTCPClient1.InputBuffer.Size);
  end;
  for BufPos := 0 to FormGSM.idTCPClient1.InputBuffer.Size do  buf := buf+' '+IntToStr(DataFromGSM[BufPos]); }

 { FormGSM.idTCPClient1.ReadBuffer(inputBuffer,(StrToInt(FormGSM.Edit16.Text)-1));
  buf:='';
  for BufPos := 0 to 255 do  buf := buf+' '+IntToStr(inputBuffer[BufPos]);
  FormGSM.Memo2.Lines.Add(buf);
  buf:='';
  for BufPos := 256 to 511 do  buf := buf+' '+IntToStr(inputBuffer[BufPos]);
  FormGSM.Memo2.Lines.Add(buf);
  buf:='';
  for BufPos := 512 to 767 do  buf := buf+' '+IntToStr(inputBuffer[BufPos]);
  FormGSM.Memo2.Lines.Add(buf);
  buf:='';
  for BufPos := 768 to 1023 do  buf := buf+' '+IntToStr(inputBuffer[BufPos]);
  FormGSM.Memo2.Lines.Add(buf); }


{end;
except
begin
 // FormGSM.Memo2.Lines.Add('.');
end;
end; }



       ReadFile(hCom,DataFromGSM,BytesFromGSM,Bytes,nil);
       if Bytes <>0 then begin
       BytesFromGSM:=  BytesFromGSM-Bytes;
       if BytesFromGSM =0 then
       begin
       GSMsinxr:=true;
       FormGSM.Memo2.Lines.Add('принято');
       end;
       end;


     {  ReadFile(hCom,DataFromGSM,8,Bytes,nil);
       TempStr:='';
       if Bytes <>0 then begin
       for Loop := 1 to Bytes do  if DataFromGSM[Loop] <>13 then
       FormGSM.Memo2.SelText:=char(DataFromGSM[Loop]) else
       FormGSM.Memo2.Lines.Add(''); 
     //  TempStr:=TempStr+char(DataFromGSM[Loop]);
     //  FormGSM.Memo2.SelText:=TempStr;
       end;}

    Sleep(0);
     until Terminated;
   Tgsm.Destroy;
end;

end.
 