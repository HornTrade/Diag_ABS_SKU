unit ChoiceDir;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, FileCtrl;

type
  TFormChoiceDir = class(TForm)
    ChoiceDirectory: TDirectoryListBox;
    ChoiceDrive: TDriveComboBox;
    btnOk: TButton;
    btnCancel: TButton;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure ChoiceDriveChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormChoiceDir: TFormChoiceDir;
  ChDir : string;

implementation

{$R *.DFM}

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//—делать возможность создани€ новой директории
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!



procedure TFormChoiceDir.btnCancelClick(Sender: TObject);
begin
   FormChoiceDir.Tag := 0;
   Close;
end;

procedure TFormChoiceDir.btnOkClick(Sender: TObject);
begin
   ChDir := ChoiceDirectory.Directory;
   FormChoiceDir.Tag := 1;
   Close;
end;

procedure TFormChoiceDir.ChoiceDriveChange(Sender: TObject);
begin
   ChoiceDirectory.Drive := ChoiceDrive.Drive;
end;




end.
