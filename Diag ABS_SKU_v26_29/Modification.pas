unit Modification;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, IniFiles, Grids;

type
  TFormModification = class(TForm)
    GroupBox1: TGroupBox;
    ModelGrid: TStringGrid;
    GroupBox: TGroupBox;
    Edit1: TEdit;
    Label1: TLabel;
    procedure FormProtocol_VAR;
    procedure SetList(M:String);
    procedure ModelGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormModification: TFormModification;
  CFGIni : TIniFile;
  Nstr,i:Integer;

implementation

uses Unit9,mainABSdiag, PrepRep, Authorized;

{$R *.dfm}

procedure TFormModification.SetList(M:String);
begin
      ModelGrid.Cells[0,0]:='№';
      ModelGrid.Cells[1,0]:='Modification number';
      GroupBox1.Caption:='Выбор Модификации   '+M;
      GroupBox1.Visible:=true;
      CFGIni := TIniFile.Create(IniPath+'\CFG\CFGIni.ini' );
      Nstr:= StrToInt(CFGIni.ReadString(M,'N', '100'));
      ModelGrid.RowCount:=Nstr+1;
      for i:=1 to Nstr do
      begin
         ModelGrid.Cells[0,i]:=IntToStr(i);
         ModelGrid.Cells[1,i]:=CFGIni.ReadString(M,IntToStr(i), '');
      end;
end;

procedure TFormModification.ModelGridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
      ModelGrid.Color:=clWindow;
      Edit1.Color:=clWindow;//clBtnFace;
      Model:=Form9.Edit259.Text+Form9.Edit260.Text;
      Vehicle_Modification_F10:=ModelGrid.Cells[1,ARow];
      FormModification.GroupBox.Visible:=true;
      FormModification.Edit1.Text:=Model+'-'+Vehicle_Modification_F10;
      Form9.Button64.Enabled:=true;
      Form9.Button64.SetFocus;
      CFGfile_Path:= IniPath+'\CFG\'+Form9.Edit259.Text+'\'+Model+'\';
      CFGfile_Name:=FormModification.Edit1.Text;
      //
      FormModification.FormProtocol_VAR;
end;

procedure TFormModification.FormProtocol_VAR;
var
   DateTime : TDateTime;
   Year, Month, Day : Word;
   Str: string;
begin
      PrepRep.Report.ECU_DN:= Decimal_Number;
      PrepRep.Report.ECU_SN:= Form1.Label26.Caption;
      PrepRep.Report.ECU_Soft:= Form1.Label29.Caption;
      PrepRep.Report.ECU_CRC:= Form1.Label569.Caption;
      //  из Form9 Ввод  VIN
      Vehicle_VIN_CFG_F9:= Form9.Edit262.Text+Form9.Edit259.Text+
                           Form9.Edit260.Text+Form9.Edit263.Text+
                           Form9.Edit261.Text;
      PrepRep.Report.Vehicle_VIN:= Model+'-'+Vehicle_VIN_CFG_F9;
      PrepRep.Report.Vehicle_Modification:= Vehicle_Modification_F10;
      // из AuthorizedForm
      PrepRep.Report.Authorized_Surname:=Authorized.Author.Surname;
      PrepRep.Report.Authorized_Code:=Authorized.Author.Code;
      // Текущее время
      DateTime := Now;
      DecodeDate(DateTime, Year, Month, Day);
      PrepRep.Report.Commissioning_Date:=IntToStr(Day)+'.'+
                                         IntToStr(Month)+'.'+
                                         IntToStr(Year);
      Report_Folder:=ExtractFilePath(Application.ExeName) +'CFG\!Report\';
      // имя файла отчета
      Number_Report:= DiagIni.ReadInteger('Report','Number',0);
      Str:=IntToStr(Year);
      Delete(Str,1,2);
      PrepRep.Report.Report_Name:= Model+'\Report_№ '+
                                   IntToStr(Number_Report)+'-'+
                                   Str;//IntToStr(Year);
end;

end.
