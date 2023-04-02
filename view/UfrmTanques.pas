unit UfrmTanques;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UfrmBase, Data.DB, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TfrmTanques = class(TfrmBase)
    GBVisualizacao: TGroupBox;
    DBGvizualizacao: TDBGrid;
    GBDados: TGroupBox;
    Label4: TLabel;
    DBDesc: TDBEdit;
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
  private
    { Private declarations }
    procedure MostrarForm;
  public
    { Public declarations }
    class function New: TFrmTanques;
  end;

var
  frmTanques: TfrmTanques;

implementation

{$R *.dfm}

uses UCon.Controller, UICon;

procedure TfrmTanques.btnEditarClick(Sender: TObject);
begin
  inherited;
  DBDesc.SetFocus;
end;

procedure TfrmTanques.btnNovoClick(Sender: TObject);
begin
  inherited;
  DBDesc.SetFocus;
end;

procedure TfrmTanques.MostrarForm;
begin
  DSBase.DataSet := TControllerConexao
                             .New
                             .SetFDQuery(tFDQTanques)
                             .GetTipoFDQuery;

  Self.ShowModal;

end;

class function TfrmTanques.New: TFrmTanques;
begin
  Result := Self.Create(frmTanques);
  if (not Assigned(frmTanques)) then
    Application.CreateForm(TfrmTanques, frmTanques);
  frmTanques.MostrarForm;

  if (Assigned(frmTanques)) then
    FreeAndNil(frmTanques);

end;

end.
