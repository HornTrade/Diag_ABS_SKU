program ABSdiag;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads, cmem,
  {$ENDIF}
  Interfaces, Forms, LCLVersion, tachartlazaruspkg, runtimetypeinfocontrols,
  lazcontrols, mainABSdiag   {Form1},
  UnitViewError in 'UnitViewError.pas' {FormError},
  Unit4         in 'Unit4.pas'         {Form4},
  Unit5         in 'Unit5.pas'         {Form5},
  Unit6         in 'Unit6.pas'         {Form6},
  Unit7         in 'Unit7.pas'         {Form7},
  Unit8         in 'Unit8.pas'         {TestDSC},
  Unit9         in 'Unit9.pas'         {Form9},
  Dump          in 'dump.pas'          {DumpForm},
  Graph001      in 'Graph001.pas'      {Graph},
  Stend         in 'Stend.pas'         {FormStend},
  UnitPCB       in 'UnitPCB.pas'       {FormPCB},
  Make_CFG      in 'Make_CFG.pas'      {MakeCFG},
  Modification  in 'Modification.pas'  {FormModification},
  Model         in 'Model.pas'         {FormModel},
  Authorized    in 'Authorized.pas'    {AuthorizedForm},
  ChPort        in 'chport.pas'        {ChoicePort},
  Task_Progress in 'Task_Progress.pas' {Form2},
  Mod_Test      in 'Mod_Test.pas'      {Form3},
  //pswUnit       in 'pswUnit.pas'       {pswForm},
  paswrdUnit    in 'paswrdUnit.pas'    {paswrdForm},
  Link_Processor in 'Link_Processor.pas' {FormISO};

{$R *.res}

begin
  RequireDerivedFormResource := True;
  Application.Scaled := True;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFormISO, FormISO);       // ← важно: FormISO вызывается раньше всех
  Application.CreateForm(TFormError, FormError);
  Application.CreateForm(TForm2, Form2);           // Task_Progress (прогресс-бар)
  Application.CreateForm(TForm3, Form3);           // Mod_Test
  Application.CreateForm(TForm4, Form4);           // Utilits
  Application.CreateForm(TForm5, Form5);           // Unit5 (правила)
  Application.CreateForm(TForm6, Form6);           // Dump Flash
  Application.CreateForm(TForm7, Form7);           // Stend settings
  Application.CreateForm(TTestDSC, TestDSC);       // Unit8
  Application.CreateForm(TForm9, Form9);           // VIN entry
  //Application.CreateForm(TForm10, Form10);         // Unit10
  Application.CreateForm(TDumpForm, DumpForm);
  Application.CreateForm(TGraph, Graph);
  Application.CreateForm(TFormStend, FormStend);
  Application.CreateForm(TFormPCB, FormPCB);
  //Application.CreateForm(TFormELM, FormELM);
  Application.CreateForm(TMakeCFG, MakeCFG);
  Application.CreateForm(TFormModification, FormModification);
  Application.CreateForm(TAuthorizedForm, AuthorizedForm);
  //Application.CreateForm(TFormProtocol, FormProtocol);
  Application.CreateForm(TChoicePort, ChoicePort);
  //Application.CreateForm(TFormChoiceDir, FormChoiceDir);
  //Application.CreateForm(TFormGSM, FormGSM);
  //Application.CreateForm(TpswForm, pswForm);
  Application.CreateForm(TpaswrdForm, paswrdForm);
  Application.Run;
end.
