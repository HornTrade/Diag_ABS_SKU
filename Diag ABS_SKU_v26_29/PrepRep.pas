unit PrepRep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,Variants,
  StdCtrls, ExtCtrls, Buttons, OleServer, Word97, WordXP, Mask, Word2000, ComObj;

Type RepType=record
     ECU_DN:String;
     ECU_SN:String;
     ECU_Soft:String;
     ECU_CRC:String;
     Vehicle_VIN:String;
     Vehicle_Modification:String;
     Authorized_Surname:String;
     Authorized_Code:String;
     Commissioning_Date:String;
     Report_Name:String;
     end;

type
  TFormProtocol = class(TForm)
    Print: TBitBtn;
    GroupBox4: TGroupBox;
    Exp: TBitBtn;
    PrnSetup: TBitBtn;
    CB1: TCheckBox;
    CB2: TCheckBox;
    CB5: TCheckBox;
    CB6: TCheckBox;
    SD1: TSaveDialog;
    PrnSetupDialog: TPrinterSetupDialog;
    CB7: TCheckBox;
    CB3: TCheckBox;
    CB0: TCheckBox;
    GroupBox5: TGroupBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    Label12: TLabel;
    Label13: TLabel;
    GroupBox11: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label19: TLabel;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    GroupBox12: TGroupBox;
    Label20: TLabel;
    Label21: TLabel;
    Edit10: TEdit;
    Edit11: TEdit;
    GroupBox13: TGroupBox;
    Label22: TLabel;
    Label23: TLabel;
    Edit12: TEdit;
    Edit13: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label2: TLabel;

    procedure PrintClick(Sender: TObject);
    procedure PrnSetupClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Make_DocFile;
    procedure Make_Report;
    procedure Word_Quit;

  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  FormProtocol: TFormProtocol;
  Report: RepType;
  Report_Folder:string;
  Number_Report: integer;
  FileName, FileTemplate, s : OleVariant;
  Doc,EmptyParam: OleVariant;
implementation

uses mainABSdiag,Link_Unit,Link_Processor,Screen_Thread,Com_Thread,
    Unit9, Unit10,Authorized, Modification;

{$R *.DFM}

procedure TFormProtocol.Word_Quit;
begin
{   try
      MSWord.ActiveDocument.Close(EmptyParam,EmptyParam,EmptyParam);
      MsWord.Application.Quit;
    except
      Exception.Create('Error');
    end; }
end;

procedure TFormProtocol.FormClose(Sender: TObject;
                        var Action: TCloseAction);
begin
   // FormProtocol.Word_Quit;
end;

procedure TFormProtocol.Make_Report;
begin
   FormModification.FormProtocol_VAR;
   FormProtocol.FormShow(nil);
   FormProtocol.Make_DocFile;
   Number_Report:= Number_Report+1;
   DiagIni.WriteInteger('Report','Number',Number_Report);
end;

procedure TFormProtocol.PrnSetupClick(Sender: TObject);
begin
   PrnSetupDialog.Execute;
end;

procedure TFormProtocol.FormShow(Sender: TObject);
var
   Str:string;
   L:integer;
   DateTime : TDateTime;
   Year, Month, Day : Word;
begin
   // положение формы
   L:= Form1.Left-310;
   if L < 0 then L:=0;
   FormProtocol.Left:=L;
   FormProtocol.Top:=Form1.Top;
   if DiagIni.ReadString('Report','ViewForm','') = 'Yes'
   then FormProtocol.Visible := True
   else FormProtocol.Visible := False;
   // Текущее время
   DateTime := Now;
   DecodeDate(DateTime, Year, Month, Day);
   FormProtocol.Edit13.Text:=IntToStr(Day)+'.'+
                             IntToStr(Month)+'.'+
                             IntToStr(Year);
   Report_Folder:=ExtractFilePath(Application.ExeName) +'CFG\!Report\';
   // имя файла отчета
   Number_Report:= DiagIni.ReadInteger('Report','Number',0);
   Str:=IntToStr(Year);
   Delete(Str,1,2);
   //Report_Name;
   Model:=VIN_Model+VIN_Engine;
   FormProtocol.Edit1.Text:= Model+'\Report_№ '+
                             IntToStr(Number_Report)+'-'+
                             Str;
   PrepRep.Report.Report_Name:= FormProtocol.Edit1.Text;
   FormProtocol.Edit6.Text:=Decimal_Number;
   FormProtocol.Edit7.Text:=Form1.Label26.Caption;
   FormProtocol.Edit8.Text:=Form1.Label29.Caption;
   FormProtocol.Edit9.Text:=Form1.Label569.Caption;
   FormProtocol.Edit10.Text:=Form1.Label33.Caption;
   FormProtocol.Edit11.Text:=Form1.Label643.Caption;
   FormProtocol.Edit2.Text:=IntToStr(SetCod);
   FormProtocol.Edit12.Text:=DiagIni.ReadString('Authorized',FormProtocol.Edit2.Text,'');
   Form1.Edit264.Text:=FormProtocol.Edit1.Text;
end;

procedure TFormProtocol.Make_DocFile;
var
    Fs,Fd:String;
begin

   MsWord := CreateOleObject('Word.Application');
   if DiagIni.ReadString('Report','ViewWord','') = 'Yes'
   then MsWord.Visible := True
   else MsWord.Visible := False;
   if PrepRep.Report.Report_Name = '' then
   begin
     ShowMessage('Нет имени Файла');
     exit;
   end;
   Report_Folder:=ExtractFilePath(Application.ExeName) +
                  'CFG\!Report\';
   CreateDir(Report_Folder);
   CreateDir(Report_Folder+Model+'\');
   Fs:=Report_Folder+'Report_Template.docx';
   Fd:=Report_Folder+PrepRep.Report.Report_Name+'.docx';
   CopyFile(PChar(Fs), PChar(Fd), false); // false - функция перезапишет файл
   //
   MsWord.Documents.Open(Fd);
   Doc:=MSWord.ActiveDocument;
   MsWord.Selection.Font.Size := 12;
   //
   Doc.Tables.Item(1).Cell(2,2).Range.Text:=FormProtocol.Edit1.Text;
   Doc.Tables.Item(1).Cell(5,2).Range.Text:=FormProtocol.Edit10.Text;
   Doc.Tables.Item(1).Cell(6,2).Range.Text:=FormProtocol.Edit11.Text;
   Doc.Tables.Item(1).Cell(9,2).Range.Text:=FormProtocol.Edit6.Text;
   Doc.Tables.Item(1).Cell(10,2).Range.Text:=FormProtocol.Edit7.Text;
   Doc.Tables.Item(1).Cell(11,2).Range.Text:=FormProtocol.Edit8.Text;
   Doc.Tables.Item(1).Cell(12,2).Range.Text:=FormProtocol.Edit9.Text;
   Doc.Tables.Item(1).Cell(15,2).Range.Text:=FormProtocol.Edit12.Text;
   Doc.Tables.Item(1).Cell(16,2).Range.Text:=FormProtocol.Edit2.Text;
   Doc.Tables.Item(1).Cell(17,2).Range.Text:=FormProtocol.Edit13.Text;
end;

procedure TFormProtocol.PrintClick(Sender: TObject);
//var
 //   EmptyParam: OleVariant;
 //   yyy : _document;
begin
    FormProtocol.Make_DocFile;
    if Sender = Exp then
    begin
    Number_Report:= Number_Report+1;
    DiagIni.WriteInteger('Report','Number',Number_Report);
    end;
    if Sender = Print then
    begin
       Doc.PrintOut(EmptyParam,EmptyParam,EmptyParam,EmptyParam,
                        EmptyParam,EmptyParam,EmptyParam,EmptyParam,
                        EmptyParam,EmptyParam,EmptyParam,EmptyParam,
                        EmptyParam,EmptyParam);
    end;
   Doc.Close(EmptyParam,EmptyParam,EmptyParam);
   MsWord.Application.Quit;

 // s:= 1;
 //yyy:=WA1.Documents.Item(S);
 { yyy:=WA1.ActiveDocument;
  yyy.Fields.Item(1).Result.Text :=DiagIni.ReadString(
                        'Version_DIA','Version_DIA','');
  yyy.Fields.Item(2).Result.Text := EFirm.Text;
  s := 1;
  if CBLim.Checked then
     yyy.FormFields.Item(s).CheckBox.Value := true;
  s := 2;
  if CB0.Checked then yyy.FormFields.Item(s).CheckBox.Value := true;
 if Sender = Print then
        begin
           Doc.PrintOut(EmptyParam,EmptyParam,EmptyParam,EmptyParam,
                        EmptyParam,EmptyParam,EmptyParam,EmptyParam,
                        EmptyParam,EmptyParam,EmptyParam,EmptyParam,
                        EmptyParam,EmptyParam);
        end;
    if Sender = Exp then begin
    SD1.InitialDir:=ProtDir;
    if SD1.Execute then
       begin
          ProtDir:=ExtractFileDir(SD1.FileName);
          FileName := SD1.FileName;
 //         yyy.SaveAs(FileName,EmptyParam,EmptyParam,EmptyParam,
 //                   EmptyParam,EmptyParam,EmptyParam,EmptyParam,
 //                   EmptyParam,EmptyParam,EmptyParam);
        end;
                           end;
  if not Set_Security then Exit;
 // FormISO.SaveProtocol;
 // ProtokolSave:=false;
 // repeat Application.ProcessMessages until   ProtokolSave;
 // ShowMessage('Данные сохранены');
 // MSWord.Documents.SaveAs(FileTemplate); }
end;
end.
