unit ChPort;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TChoicePort = class(TForm)
    Button1: TButton;
    Button2: TButton;
    gbPort: TGroupBox;
    RB1: TRadioButton;
    RB2: TRadioButton;
    RB3: TRadioButton;
    RB4: TRadioButton;
    GroupBox1: TGroupBox;
    RB_S1: TRadioButton;
    RB_S2: TRadioButton;
    GroupBox2: TGroupBox;
    RB_A1: TRadioButton;
    RB_A2: TRadioButton;
    Edit1: TEdit;
    Label1: TLabel;
    RB_S3: TRadioButton;
    RB_A3: TRadioButton;
    RB_S4: TRadioButton;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ChoicePort: TChoicePort;

implementation

uses mainABSdiag,Link_Unit;

{$R *.DFM}

procedure TChoicePort.FormShow(Sender: TObject);
begin
         RB1.Checked := false;
         RB2.Checked := false;
         RB3.Checked := false;
         RB4.Checked := false;
         RB_S1.Checked := false;
         RB_S2.Checked := false;
         RB_S3.Checked := false;
         RB_A1.Checked := false;
         RB_A2.Checked := false;

   if Port_Num = 1 then  RB1.Checked := true;
   if Port_Num = 2 then  RB2.Checked := true;
   if Port_Num = 3 then  RB3.Checked := true;
   if Port_Num = 4 then  RB4.Checked := true;

   if ComBaudrate = 38400 then  RB_S1.Checked := true;
   if ComBaudrate = 57600 then  RB_S2.Checked := true;
   if ComBaudrate = 100000 then  RB_S3.Checked := true;

   if ComAdapter = 1 then  RB_A1.Checked := true;
   if ComAdapter = 2 then  RB_A2.Checked := true;
end;

//Кнопка " Ok "
procedure TChoicePort.Button1Click(Sender: TObject);
begin
   if RB1.Checked then    Port_Num := 1;
   if RB2.Checked then    Port_Num := 2;
   if RB3.Checked then    Port_Num := 3;
   if RB4.Checked then    Port_Num := 4;

   if RB_S1.Checked then    ComBaudrate := 38400;

   if RB_S2.Checked then    ComBaudrate := 250000;// ComBaudrate := 57600;
   if RB_S3.Checked then    ComBaudrate := 100000;
   if RB_S4.Checked then    ComBaudrate := 115200;

   if RB_A1.Checked then    ComAdapter := 1;
   if RB_A2.Checked then    ComAdapter := 2;
   if RB_A3.Checked then    ComAdapter := 3;

   if Edit1.Text <>''  then    Port_Num := StrToInt(Edit1.Text);

   DiagIni.WriteInteger('Serial', 'com', Port_Num);
   DiagIni.WriteInteger('Serial', 'Baudrate', ComBaudrate);
   DiagIni.WriteInteger('Serial', 'Adapter', ComAdapter);
 //  if CheckBox1.Checked then  Stend_Fl :=true
 //                       else  Stend_Fl :=false;
   Close;
end;

//Кнопка " Отмена "
procedure TChoicePort.Button2Click(Sender: TObject);
begin
   Close;
end;




end.
