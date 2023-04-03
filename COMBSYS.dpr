program COMBSYS;

uses
  Vcl.Forms,
  UfrmPrincipal in 'view\UfrmPrincipal.pas' {frmPrincipal},
  UfrmBase in 'view\UfrmBase.pas' {frmBase},
  UdmPrincipal in 'model\UdmPrincipal.pas' {DmPrincipal: TDataModule},
  UCon.Model in 'model\UCon.Model.pas',
  UICon in 'interfarce\UICon.pas',
  UTabelas.Factory.Model in 'model\UTabelas.Factory.Model.pas',
  UITabela.Factory in 'interfarce\UITabela.Factory.pas',
  UfrmTanques in 'view\UfrmTanques.pas' {frmTanques},
  UCon.Controller in 'controller\UCon.Controller.pas',
  UTabela.Factory.Controller in 'factory\UTabela.Factory.Controller.pas',
  UfrmBombas in 'view\UfrmBombas.pas' {frmBombas},
  UfrmAbastecimentos in 'view\UfrmAbastecimentos.pas' {frmAbastecimentos},
  UrptRelAbastecimentos in 'relatorio\UrptRelAbastecimentos.pas' {rptRelAbasteciemntos},
  UfrmFiltroRelAbastecimentos in 'view\UfrmFiltroRelAbastecimentos.pas' {frmFiltroRelAbastecimentos},
  UhelperFree in 'helper\UhelperFree.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDmPrincipal, DmPrincipal);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
