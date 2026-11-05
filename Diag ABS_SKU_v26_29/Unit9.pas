unit Unit9;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, IniFiles, Grids;

type
  TForm9 = class(TForm)
    Button1: TButton;
    GroupBox152: TGroupBox;
    Label607: TLabel;
    Edit259: TEdit;
    Edit260: TEdit;
    Edit261: TEdit;
    Edit262: TEdit;
    Edit263: TEdit;
    Edit265: TEdit;
    Label516: TLabel;
    Button64: TButton;
    Label1: TLabel;
    Label2: TLabel;

    procedure Button64Click(Sender: TObject);
    procedure Edit265Change(Sender: TObject);
    procedure Edit262Change(Sender: TObject);
    procedure Edit259Change(Sender: TObject);
    procedure Edit260Change(Sender: TObject);
    procedure Edit263Change(Sender: TObject);
    procedure Edit261Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;
  Model, CFGfile_Path, CFGfile_Name:String;
  Nstr,i:Integer;
  StrCmpl:boolean;

implementation
uses mainABSdiag,Link_Unit, Link_Processor,Unit10, PrepRep, Authorized,
  Modification;
{$R *.dfm}

procedure TForm9.Button64Click(Sender: TObject);
var
   CFG_File: String;
begin
    Vehicle_VIN_CFG_F9:= Form9.Edit262.Text+Form9.Edit259.Text+
                         Form9.Edit260.Text+Form9.Edit263.Text+
                         Form9.Edit261.Text;
    VIN_Model_F9:= Form9.Edit259.Text+Form9.Edit260.Text;
    if Type_VIN_New then
    begin
      if (CFGfile_Path <> '') and
         (CFGfile_Name <> '') then
      begin
         CFG_File:= CFGfile_Path+CFGfile_Name+'.asm';
         if FileExists(CFG_File) then
         begin
          if Application.MessageBox(Pchar('Выбран Файл конфигурации '+CFG_File),
              'Предупреждение', MB_OkCancel+MB_ICONASTERISK+MB_APPLMODAL) = idOk
          then
          begin
      //      if DiagIni.ReadString('Report','DocReport','') = 'Yes'
      //      then Protocol_Save:=true;
            Form1.SaveVIN;
          end
         end
         else
         begin
           ShowMessage('Файл конфигурации '+CFGfile_Name+ ' не найден');
           exit;
         end;
      end
      else
      begin
         ShowMessage('Не выбран Файл конфигурации ');
      end;
    end
    else
    begin //Старая версия
       Form1.SaveVIN;
    end;
end;
 
procedure TForm9.Edit265Change(Sender: TObject);
begin
 //   if not Type_VIN_New  then
    begin
      if Form9.Edit265.Text <>'' then
            CFG_SetCod:=StrToInt(Form9.Edit265.Text)
      else  CFG_SetCod:=0;
      if (CFG_SetCod <> 0) and
         (CFG_SetCod <> 255)
      then Form9.Button64.Enabled:=true
      else Form9.Button64.Enabled:=false;
    end;
end;

procedure TForm9.Edit262Change(Sender: TObject);
begin
      if Length(Edit262.Text) =3 then
      begin
         ActiveControl:= Edit259;
         Edit262.Text:=UpperCase((Edit262.Text));
      end;
end;

procedure TForm9.Edit259Change(Sender: TObject);
begin
      if Length(Edit259.Text) =4 then
      begin
         ActiveControl:= Edit260;
         Edit259.Text:=UpperCase((Edit259.Text));
      end;
end;

procedure TForm9.Edit260Change(Sender: TObject);
begin
      if Length(Edit260.Text) =2 then
      begin
         ActiveControl:= Edit263;
         Edit260.Text:=UpperCase((Edit260.Text));
         if (DSC_Flags5 and 8)=8  then
              Form9.Label1.Caption:='Найден ECAS'
         else Form9.Label1.Caption:='';
         Model:=Form9.Edit259.Text+Form9.Edit260.Text;
      end;
end;


procedure TForm9.Edit263Change(Sender: TObject);
begin
      if Length(Edit263.Text) =1 then
      begin
         ActiveControl:= Edit261;
         Edit263.Text:=UpperCase((Edit263.Text));
      end;
end;

procedure TForm9.Edit261Change(Sender: TObject);
begin
      if Length(Edit261.Text) =7 then
      begin
         if Type_VIN_New then
         begin
           FormModification.Left:=Form9.Left;
           FormModification.Top:=Form9.Top+Form9.Height+3;
           FormModification.Visible:=true;
           FormModification.GroupBox.Visible:=false;
           FormModification.SetList(Model);
         end
         else ActiveControl:= Edit265;
      end;
end;

procedure TForm9.Button1Click(Sender: TObject);
Var i:Integer;
begin
     // Сброс
     Button64.Enabled:=false;
     Form9.Edit262.Text:='';
     Form9.Edit259.Text:='';
     Form9.Edit260.Text:='';
     Form9.Edit263.Text:='';
     Form9.Edit261.Text:='';

     ActiveControl:= Form9.Edit262;
     FormModification.GroupBox1.Caption:='Выбор Модификации ';
     for i:=1 to FormModification.ModelGrid.RowCount do
     begin
        FormModification.ModelGrid.Cells[0,i]:='';
        FormModification.ModelGrid.Cells[1,i]:='';
     end;
     FormModification.Edit1.Text:='';
     FormModification.GroupBox.Visible:=false;
     Model:='';
     CFGfile_Path:='';
     CFGfile_Name:='';
     Fl_Message_VIN:=false;
     StrCmpl:=false;
end;

procedure TForm9.FormShow(Sender: TObject);
begin
     if Type_VIN_New then
     begin
       if Authorized_Cmpl then
       begin
          Form9.Label2.Caption:=Authorized.Author.Surname;
          Form9.Edit265.Text:=Authorized.Author.Code;
       end
       else
       begin
          ShowMessage('Необходимо выполнить авторизацию');
          Form1.btnParametrClick(nil);
    //      repeat Application.ProcessMessages until Authorized_Cmpl;
       end;

     end;
     ActiveControl:= Form9.Edit262; //Y3M
end;

end.
