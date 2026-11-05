unit Queue;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
   TQProc = procedure;

type

  TQueue = class(TComponent)
     constructor    Create(AOwner: TComponent);override;
     destructor     Destroy;override;
     function Pop : TQProc; // Removes and returns the item at the front of the queue.
     procedure Push(Proc: TQProc);// Adds an item to the end of the queue.
     procedure FirstProc(Proc: TQProc);

  private
     QList : Array[1..255] of TQProc;
  public
    { Public declarations }
    QPointer : integer;
  end;


implementation


constructor TQueue.Create(AOwner: TComponent);
var
   i : byte;
begin
   inherited Create(AOwner);
   for i := 1 to 255 do QList[i] := nil;
   QPointer := 0;
end;

destructor TQueue.Destroy;
begin
    inherited Destroy;
end;

function TQueue.Pop : TQProc;
var
  i : integer;
begin
   if QPointer = 0 then Exit;
   Pop := QList[1];
   for i := 1 to QPointer do  QList[i] := QList[i+1];
   QList[QPointer] := nil;
   dec(QPointer);
end;



procedure TQueue.FirstProc(Proc: TQProc);
var
  i : integer;
begin
   if QPointer = 0 then
      begin
         inc(QPointer);
         QList[QPointer] := Proc;
         Exit;
      end;
   for i := QPointer downto 1 do QList[i+1] := QList[i];
   QList[1] := Proc;
   inc(QPointer);
end;

procedure TQueue.Push(Proc: TQProc);
var
   i : integer;
begin
   if QPointer > 100 then exit;
       {begin
          for i := 1 to 255 do QList[i] := nil;
          QPointer := 0;
       end;}
   inc(QPointer);
   QList[QPointer] := Proc;
end;



end.
 