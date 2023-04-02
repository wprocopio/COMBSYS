unit UfrmBombas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UfrmBase, Data.DB, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls,UCon.Controller, UICon;

type
  TfrmBombas = class(TfrmBase)
    GBDados: TGroupBox;
    Label4: TLabel;
    Label1: TLabel;
    DBLkpTanque: TDBLookupComboBox;
    DBDescricao: TDBEdit;
    GBVisualizacao: TGroupBox;
    DBGvizualizacao: TDBGrid;
    DSTanque: TDataSource;
    procedure btnEditarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
  private
    { Private declarations }
    FControllerConexao: IConController;
    procedure mostrarForm;
  public
    { Public declarations }
    class function New: TFrmBombas;
  end;

var
  frmBombas: TfrmBombas;

implementation

{$R *.dfm}





procedure TfrmBombas.btnEditarClick(Sender: TObject);
begin
  inherited;
   DBDescricao.SetFocus
end;

procedure TfrmBombas.btnNovoClick(Sender: TObject);
begin
  inherited;
   DBDescricao.SetFocus
end;

procedure TfrmBombas.mostrarForm;
begin
  FControllerConexao := TControllerConexao.New;

  DSBase.DataSet   := FControllerConexao
                      .SetFDQuery(tFDQBombas)
                      .GetTipoFDQuery;

  DSTanque.DataSet := FControllerConexao
                      .SetFDQuery(tFDQTanques)
                      .GetTipoFDQuery;


  Self.ShowModal;
end;

class function TfrmBombas.New: TFrmBombas;
begin
  Result := Self.Create(FrmBombas);
  if (not Assigned(FrmBombas)) then
    Application.CreateForm(TFrmBombas, FrmBombas);
  FrmBombas.mostrarForm;

  if (Assigned(frmBombas)) then
    FreeAndNil(FrmBombas);

end;

end.
