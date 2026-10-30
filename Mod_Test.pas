unit Mod_Test;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls;

type
  TForm3 = class(TForm)
    BitBtn1: TBitBtn;
    ProgressBar1: TProgressBar;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  ModStopTimer_Value:Int64;

implementation

uses Link_Unit,mainABSdiag, Link_Processor;

{$R *.DFM}

procedure TForm3.BitBtn1Click(Sender: TObject);
begin
        ModStopTimer_Value:=0;
        ModCommand:=0;
        FormISO.ModCommand;
        Form3.Visible:=False;
end;

procedure TForm3.FormPaint(Sender: TObject);
Var StartTimer_Value,TimerFreq_Value,TestINT64:Int64;

begin
        if ModStopTimer_Value<>0 then Exit;
        QueryPerformanceCounter(StartTimer_Value);
        QueryPerformanceFrequency(TimerFreq_Value);
        Case Tag div 65536 of
        1: begin end;
        2: begin end;
        3: begin end;
        4: begin end;
        5: begin end;
        6: begin end;
        end;
        ModStopTimer_Value:=StartTimer_Value+(Tag mod 65536)*TimerFreq_Value;
        repeat
                if Form1.PageControl1.ActivePageIndex=4 then Form3.BringToFront;
                QueryPerformanceCounter(TestINT64);
                ProgressBar1.Position:=(TestINT64-StartTimer_Value)*100 div (ModStopTimer_Value-StartTimer_Value);
                Application.ProcessMessages;
        until   TestINT64>=ModStopTimer_Value;
        BitBtn1Click(Sender);
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
        ModStopTimer_Value:=0;
end;

end.
