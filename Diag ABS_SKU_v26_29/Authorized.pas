unit Authorized;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls;

Type AuthorizedType=record
     Surname:String;
     Code:String;
     end;

type
  TAuthorizedForm = class(TForm)
    Button1: TButton;
    GroupBox1: TGroupBox;
    AuthorizedGrid: TStringGrid;
    GroupBox: TGroupBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Label22: TLabel;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure AuthorizedGridSelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AuthorizedForm: TAuthorizedForm;
  Author: AuthorizedType;
  Authorized_Cmpl: Boolean;
  Rows: integer;

implementation

uses mainABSdiag, Unit9, PrepRep, Modification;
{$R *.dfm}

procedure TAuthorizedForm.FormShow(Sender: TObject);
Var
  i:integer;
  Str:string;
begin
      AuthorizedForm.Left:=Form1.Left+ Form1.Width+6;
      AuthorizedForm.Top:=Form1.Top+Form9.Height+FormModification.Height+6;
      AuthorizedForm.Edit1.Text:=Author.Surname;
      AuthorizedForm.Edit2.Text:=Author.Code;
      if (Author.Surname = '') or
         (Author.Code = '')
      then  Authorized_Cmpl:=False;
      AuthorizedGrid.Cells[0,0]:='Code';
      AuthorizedGrid.Cells[1,0]:='  Surname';

      Rows:= StrToInt(DiagIni.ReadString('Authorized','N','10'));
      AuthorizedGrid.RowCount:=Rows+1;
      for i:=1 to Rows do
      begin
         AuthorizedGrid.Cells[0,i]:=IntToStr(i);
         Str:=DiagIni.ReadString('Authorized',IntToStr(i),'');
         AuthorizedGrid.Cells[1,i]:=Str;
      end;
      AuthorizedGrid.Color:=clWindow;
      AuthorizedForm.Visible:=true;
end;

procedure TAuthorizedForm.AuthorizedGridSelectCell(Sender: TObject; ACol,
          ARow: Integer; var CanSelect: Boolean);
begin
     Author.Code:=AuthorizedGrid.Cells[0,ARow];
     Author.Surname:=AuthorizedGrid.Cells[1,ARow];
     AuthorizedForm.Edit1.Text:=Author.Surname;
     AuthorizedForm.Edit2.Text:=Author.Code;
     Form1.btnParametr.ImageIndex:= 7;
     Authorized_Cmpl:=true;
     if Form9.Visible then
     begin
       Form9.Label2.Caption:=Author.Surname;
       Form9.Edit265.Text:=Author.Code;
       Form9.Edit262.SetFocus;
     end;
end;

procedure TAuthorizedForm.Button1Click(Sender: TObject);
Var
  i:integer;
  Str,New_Surname: string;
begin
      New_Surname:= AuthorizedForm.Edit1.Text;
      for i:=1 to Rows do
      begin
         Str:= AuthorizedGrid.Cells[1,i];
         if Str = New_Surname then New_Surname:='';
      end;
      if New_Surname <> '' then
      begin
         // Новое имя
         Rows:= Rows+1;
         DiagIni.WriteString('Authorized','N',IntToStr(Rows));
         DiagIni.WriteString('Authorized',IntToStr(Rows),New_Surname);
         AuthorizedForm.FormShow(nil);
      end;
end;

end.
