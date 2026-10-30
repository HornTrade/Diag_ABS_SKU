unit UnitPath;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, Outline, DirOutln, ComCtrls, FileCtrl;

type
  TFormPath = class(TForm)
    GroupBox1: TGroupBox;
    btnView: TButton;
    Label1: TLabel;
    btnOk: TButton;
    btnClose: TButton;
    cbPath: TEdit;
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnViewClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPath: TFormPath;
 // PathApp: string;
 // n : integer;

implementation

uses mainABSdiag, ChoiceDir;

{$R *.DFM}


procedure TFormPath.FormShow(Sender: TObject);
var
  PathApp, DirPath : string;
begin
   PathApp := Application.ExeName;
   PathApp := ExtractFilePath(PathApp);
   DirPath := DiagIni.ReadString('Path', 'DirPath', '');
//Если какой-либо путь отсутствует, то прописывается текущая директория
   if DirPath = '' then DiagIni.WriteString('Path', 'DirPath', PathApp);
   DirPath := DiagIni.ReadString('Path', 'DirPath', '');
   cbPath.Text := DirPath;
end;

//Кнопка "Отмена"
procedure TFormPath.btnCloseClick(Sender: TObject);
begin
   Close;
end;

//Отображение формы для выбора диска и папки
//Результат возвращаутся в переменной ChDir
procedure TFormPath.btnViewClick(Sender: TObject);
begin
   FormChoiceDir.ShowModal;
//Если выход из формы произведен через кнопку " Отмена",
//то параметр Tag равен 0.
   if FormChoiceDir.Tag = 0 then exit;
   cbPath.Text := Chdir;
end;

//Кнопка "OK"
procedure TFormPath.btnOkClick(Sender: TObject);
begin
   DiagIni.WriteString('Path', 'DirPath', cbPath.Text);
//!!!!!!!! Необходимо сделать проверку на существование директории !!!!!!!!!   
   Close;
end;

end.
