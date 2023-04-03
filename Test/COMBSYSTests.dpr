program COMBSYSTests;
{

  Delphi DUnit Test Project
  -------------------------
  This project contains the DUnit test framework and the GUI/Console test runners.
  Add "CONSOLE_TESTRUNNER" to the conditional defines entry in the project options
  to use the console test runner.  Otherwise the GUI test runner will be used by
  default.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  DUnitTestRunner,
  UfrmAbastecimentos in '..\view\UfrmAbastecimentos.pas',
  UCon.Controller in '..\controller\UCon.Controller.pas',
  UICon in '..\interfarce\UICon.pas',
  UCon.Model in '..\model\UCon.Model.pas',
  UTabela.Factory.Controller in '..\factory\UTabela.Factory.Controller.pas',
  UITabela.Factory in '..\interfarce\UITabela.Factory.pas',
  UdmPrincipal in '..\model\UdmPrincipal.pas' {DmPrincipal: TDataModule},
  UhelperFree in '..\helper\UhelperFree.pas',
  UTabelas.Factory.Model in '..\model\UTabelas.Factory.Model.pas',
  UfrmBase in '..\view\UfrmBase.pas',
  TestUfrmAbastecimentos in 'TestUfrmAbastecimentos.pas';

{$R *.res}

begin
  DUnitTestRunner.RunRegisteredTests;
end.

