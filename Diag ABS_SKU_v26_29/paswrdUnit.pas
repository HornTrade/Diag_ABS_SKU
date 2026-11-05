unit paswrdUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TpaswrdForm = class(TForm)
    ePSW: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  function Decrypt(const S: String; Key: Word): String;
var
  paswrdForm: TpaswrdForm;
  pswTrue : boolean;
const
   psw = 'PASWRD';
implementation

{$R *.DFM}

//const
//   psw = 'PASWRD';

var
  S, ss: string;


function Encrypt(const S: String; Key: Word): String;
var
   I: byte;
   ch : byte;
   k : integer;
begin
   ss := '';
   k := Key;
   for I := 1 to Length(S) do
      begin
         ch := byte(S[I]) xor 85;
         ss := ss + char(ch);
      end;
   ss := 'dfgj3456xvn476f567gj' + ss + 'sgfh987fbh7df567ghjt';
   result := ss;
end;


function Decrypt(const S: String; Key: Word): String;
var
   I: byte;
   ch : byte;
   k : integer;
   z : string;
begin
   z := Copy(S, 21, Length(S)-40);
   ss := '';
   k := Key;
   for I := 1 to Length(z) do
       begin
       ch := byte(z[I]) xor 85;
       ss := ss + char(ch);
   end;
   result := ss;
end;


procedure TpaswrdForm.Button1Click(Sender: TObject);
var
   F : TextFile;
   failpsw : string;
   bFile : boolean;
begin
   paswrdForm.Tag := 0;
   pswTrue := False;
   AssignFile(F, 'password.dll');
   {$I-}
   Reset(F);
   {$I+}
   bFile := False;
   failpsw := '';
   if IOResult = 0 then
      begin
         bFile := True;
         Read(F, failpsw);
         CloseFile(F);
         failpsw := Decrypt(failpsw,12345);
      end;
   if ePSW.Text <> psw then
      if ePSW.Text <> failpsw then
         begin
            Application.MessageBox('Неверный пароль!',
                                   'Ошибка',
                                   MB_OK + MB_ICONERROR + MB_APPLMODAL);
            Exit;
         end;
   paswrdForm.Tag := 1;
   pswTrue := True;
   Close;
end;


procedure TpaswrdForm.Button2Click(Sender: TObject);
begin
   Close;
end;


procedure TpaswrdForm.FormShow(Sender: TObject);
begin
    ePSW.Text := '';
    ePSW.SetFocus;
end;



end.
