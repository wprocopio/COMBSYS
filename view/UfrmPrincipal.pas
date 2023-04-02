unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Relatrios1: TMenuItem;
    anque1: TMenuItem;
    Bombas1: TMenuItem;
    Abastencimentos1: TMenuItem;
    Abastecimentos1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure anque1Click(Sender: TObject);
    procedure Bombas1Click(Sender: TObject);
    procedure Abastencimentos1Click(Sender: TObject);
    procedure Abastecimentos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses UCon.Model, UfrmTanques, UfrmBombas, UfrmAbastecimentos,
  UfrmFiltroRelAbastecimentos;

procedure TfrmPrincipal.Abastecimentos1Click(Sender: TObject);
begin
   TfrmFiltroRelAbastecimentos.new;
end;

procedure TfrmPrincipal.Abastencimentos1Click(Sender: TObject);
begin
  TfrmAbastecimentos.New;
end;

procedure TfrmPrincipal.anque1Click(Sender: TObject);
begin
     TfrmTanques.New;
end;

procedure TfrmPrincipal.Bombas1Click(Sender: TObject);
begin
    TfrmBombas.New;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TerminateProcess(GetCurrentProcess, 0);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
TModelConexao
    .New
    .Conectar;
end;

end.
