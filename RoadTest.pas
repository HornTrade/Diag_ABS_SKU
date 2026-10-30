unit RoadTest;

interface
uses Windows,Link_Unit;

//12  3 строки
type    FileFrameOld=Record
        TimerSynch:Integer;
        Osc:array[0..11] of Byte;
end;
//16   4 строки
type    FileFrameOld16=Record
        TimerSynch:Integer;
        Osc:array[0..15] of Byte;
end;
//20   5 строк
type    FileFrameNew20=Record
        TimerSynch:Integer;
        Osc:array[0..19] of Byte;
end;
//24   6 строк
type    FileFrame=Record
        TimerSynch:Integer;
        Osc:array[0..23] of Byte;
end;

BufPointer=^ComBuf;
RoadOufFile=File of FileFrame;

Var
        FileBuf:FileFrame;
        RoadFile:RoadOufFile;
        RoadTest_Flag:Boolean;
        CurrentRoadTimer,RoadTestInCount:Integer;
        Buf:FileFrame;

procedure  OpenRoadFile(FileToOpen:String);
procedure  RefreshOutFile(Buf:BufPointer;StartTime:Int64);
procedure  CloseRoadFile;

implementation
uses mainABSdiag;

Procedure RefreshOutFile;
Var
        TempInt64,TimerFreq:Int64;
        Loop:Integer;
begin
     For Loop:=0 to NumberOsc-1 do
     FileBuf.Osc[Loop]:=Buf[Loop+3];
     QueryPerformanceCounter(TempInt64);
     QueryPerformanceFrequency(TimerFreq);
     FileBuf.TimerSynch:=Round(1000*(TempInt64-StartTime)/TimerFreq);
     BlockWrite(RoadFile,FileBuf,1);
end;

Procedure OpenRoadFile;
begin
     AssignFile(RoadFile,FileToOpen);
     ReWrite(RoadFile);
end;

procedure  CloseRoadFile;
begin
     CloseFile(RoadFile);
end;

end.
