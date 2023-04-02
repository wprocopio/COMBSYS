unit UfrmAbastecimentos;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,UCon.Controller,
   UCon.Model, UTabela.Factory.Controller,UICon,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, UfrmBase;

type
  TfrmAbastecimentos = class(TfrmBase)
    GBoxVisualizacao: TGroupBox;
    DBGrid1: TDBGrid;
    GBoxDados: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBLitros: TDBEdit;
    DBValor: TDBEdit;
    DBData: TDBEdit;
    DBImposto: TDBEdit;
    DBLkpBomba: TDBLookupComboBox;
    Label6: TLabel;
    DSBomba: TDataSource;
    function CalculoImposto(valor: Double): Double;
    procedure DBValorExit(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
  private
    { Private declarations }
    FControllerConexao: IConController;
    procedure mostrarForm;
  public
    { Public declarations }
    class function New: TFrmAbastecimentos;
  end;

var
  frmAbastecimentos: TfrmAbastecimentos;

implementation

{$R *.dfm}


{ TfrmAbastecimentos }

procedure TfrmAbastecimentos.btnEditarClick(Sender: TObject);
begin
  inherited;
   DBData.SetFocus;
end;

procedure TfrmAbastecimentos.btnNovoClick(Sender: TObject);
begin
  inherited;
   DBData.SetFocus;
end;

function TfrmAbastecimentos.CalculoImposto(valor: Double): Double;
begin
  if (FloatToStr(valor) <> EmptyStr) then
    Result := (valor * 0.13)
  else Result := 0;

end;

procedure TfrmAbastecimentos.DBValorExit(Sender: TObject);
begin
  inherited;
  TFDQuery(DSBase.DataSet).FieldByName('IMPOSTO').Value := CalculoImposto(TFDQuery(DSBase.DataSet).FieldByName('VALOR').Value);
end;

procedure TfrmAbastecimentos.mostrarForm;
begin
  FControllerConexao := TControllerConexao.New;

  DSBase.DataSet   := FControllerConexao
                      .SetFDQuery(tFDQAbastecimentos)
                      .GetTipoFDQuery;

  DSBomba.DataSet := FControllerConexao
                      .SetFDQuery(tFDQBombas)
                      .GetTipoFDQuery;


  Self.ShowModal;

end;

class function TfrmAbastecimentos.New: TFrmAbastecimentos;
begin
  Result := Self.Create(frmAbastecimentos);
  if (not Assigned(frmAbastecimentos)) then
    Application.CreateForm(TFrmAbastecimentos, FrmAbastecimentos);
  FrmAbastecimentos.mostrarForm;

  if (Assigned(FrmAbastecimentos)) then
    FreeAndNil(FrmAbastecimentos);

end;

end.
