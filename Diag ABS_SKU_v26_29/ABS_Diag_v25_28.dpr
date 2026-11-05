program ABS_Diag_v25_28;



uses
  Forms,
  mainABSdiag in 'mainABSdiag.pas' {Form1},
  UnitPath in 'UnitPath.pas' {FormPath},
  ChoiceDir in 'ChoiceDir.pas' {FormChoiceDir},
  UnitViewError in 'UnitViewError.pas' {FormError},
  PrepRep in 'PrepRep.pas' {FormProtocol},
  RoadTest in 'RoadTest.pas',
  dump in 'dump.pas' {DumpForm},
  Com_Thread in 'Com_Thread.pas',
  ChPort in 'chport.pas' {ChoicePort},
  Trash_Unit in 'Trash_Unit.pas',
  Screen_Thread in 'Screen_Thread.pas',
  Task_Progress in 'Task_Progress.pas' {Form2},
  Mod_Test in 'Mod_Test.pas' {Form3},
  paswrdUnit in 'paswrdUnit.pas' {paswrdForm},
  Poly_Unit in 'Poly_Unit.pas',
  Link_Processor in 'Link_Processor.pas' {FormISO},
  Unit4 in 'Unit4.pas' {Form4},
  Link_Unit in 'Link_Unit.pas',
  Queue in 'Queue.pas',
  Unit5 in 'Unit5.pas' {Form5},
  Unit6 in 'Unit6.pas' {Form6},
  Graph001 in 'Graph001.pas' {Graph},
  Stend in 'Stend.pas' {FormStend},
  Unit7 in 'Unit7.pas' {Form7},
  Unit8 in 'Unit8.pas' {TestDSC},
  Unit9 in 'Unit9.pas' {Form9},
  Unit10 in 'Unit10.pas' {Form10},
  Make_CFG in 'Make_CFG.pas' {MakeCFG},
  Modification in 'Modification.pas' {FormModification},
  Authorized in 'Authorized.pas' {AuthorizedForm},
  Unit_ELM in 'Unit_ELM.pas' {FormELM},
  UnitPCB in 'UnitPCB.pas' {FormPCB};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TFormPath, FormPath);
  Application.CreateForm(TFormChoiceDir, FormChoiceDir);
  Application.CreateForm(TFormError, FormError);
  Application.CreateForm(TFormProtocol, FormProtocol);
  Application.CreateForm(TDumpForm, DumpForm);
  Application.CreateForm(TChoicePort, ChoicePort);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TpaswrdForm, paswrdForm);
  Application.CreateForm(TFormISO, FormISO);
  Application.CreateForm(TFormStend, FormStend);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TTestDSC, TestDSC);
  Application.CreateForm(TForm9, Form9);
  Application.CreateForm(TMakeCFG, MakeCFG);
  Application.CreateForm(TFormModification, FormModification);
  Application.CreateForm(TAuthorizedForm, AuthorizedForm);
  Application.CreateForm(TFormELM, FormELM);
  Application.CreateForm(TFormPCB, FormPCB);
  Application.CreateForm(TForm10, Form10);
  // Application.CreateForm(TFormGSM, FormGSM);
  // Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TGraph, Graph);
  Application.Run;
end.
