unit UfrmFiltroRelAbastecimentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.DBCtrls,
  Vcl.Mask, Vcl.ExtCtrls,UCon.Controller, UICon,
   FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TfrmFiltroRelAbastecimentos = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    MEDataInicio: TMaskEdit;
    MEDataFim: TMaskEdit;
    DBLkpTanque: TDBLookupComboBox;
    DBLkpBomba: TDBLookupComboBox;
    DSTanque: TDataSource;
    DSBomba: TDataSource;
    PnlBar: TPanel;
    btnImprimir: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function ValidaCampos: Boolean;
    procedure DBLkpTanqueExit(Sender: TObject);
    function MontarConsultaDadosSql: String;
    function PegarFiltrosDadosSql : string;
    procedure ExibirRelatorio;
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
    FControllerConexao: IConController;
    procedure mostrarForm;

  public
    { Public declarations }
        class function New: TfrmFiltroRelAbastecimentos;
  end;

var
  frmFiltroRelAbastecimentos: TfrmFiltroRelAbastecimentos;

implementation

{$R *.dfm}

uses UrptRelAbastecimentos;

{ TfrmFiltroRelAbastecimentos }

procedure TfrmFiltroRelAbastecimentos.btnImprimirClick(Sender: TObject);
begin
  if (ValidaCampos) then
    ExibirRelatorio;
end;

procedure TfrmFiltroRelAbastecimentos.DBLkpTanqueExit(Sender: TObject);
begin
  if (DBLkpTanque.KeyValue <> Null) then
    begin
      DBLkpBomba.KeyValue := Null;
      TFDQuery(DSBomba.DataSet).Close;
      TFDQuery(DSBomba.DataSet).SQL.Clear;
      TFDQuery(DSBomba.DataSet).SQL.Add('SELECT * FROM BOMBAS WHERE TANQUE_ID = ' + DSTanque.DataSet.FieldByName('ID').AsString);
      TFDQuery(DSBomba.DataSet).Open;
      TFDQuery(DSBomba.DataSet).FetchAll;
    end
  else
    begin
      TFDQuery(DSBomba.DataSet).Close;
      TFDQuery(DSBomba.DataSet).SQL.Clear;
      TFDQuery(DSBomba.DataSet).SQL.Add('SELECT * FROM BOMBAS');
      TFDQuery(DSBomba.DataSet).Open;
      TFDQuery(DSBomba.DataSet).FetchAll;
    end;

end;

procedure TfrmFiltroRelAbastecimentos.ExibirRelatorio;
begin
  TrptRelAbasteciemntos
    .New(MontarConsultaDadosSql);

end;

procedure TfrmFiltroRelAbastecimentos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CaFree;
end;

function TfrmFiltroRelAbastecimentos.MontarConsultaDadosSql: String;
begin
  Result := ' SELECT A.DATA, A.LITROS, A.VALOR, A.IMPOSTO, B.DESCRICAO BOMBA, T.DESCRICAO TANQUE ' +
  ' FROM ABASTECIMENTOS A ' +
  ' INNER JOIN BOMBAS B ON B.ID = A.BOMBA_ID ' +
  ' INNER JOIN TANQUES T ON T.ID = B.TANQUE_ID ' +
  PegarFiltrosDadosSql +
  ' GROUP BY A.DATA, A.LITROS, A.VALOR, A.IMPOSTO, B.DESCRICAO, T.DESCRICAO ' +
  ' ORDER BY DATA ';

end;

procedure TfrmFiltroRelAbastecimentos.mostrarForm;
begin
  FControllerConexao := TControllerConexao.New;

  DSTanque.DataSet  := FControllerConexao
                         .SetFDQuery(tFDQTanques)
                         .GetTipoFDQuery;

  DSBomba.DataSet := FControllerConexao
                      .SetFDQuery(tFDQBombas)
                      .GetTipoFDQuery;

  Self.ShowModal;
end;

class function TfrmFiltroRelAbastecimentos.New: TfrmFiltroRelAbastecimentos;
begin
  Result := Self.Create(frmFiltroRelAbastecimentos);
  if (not Assigned(frmFiltroRelAbastecimentos)) then
    Application.CreateForm(TfrmFiltroRelAbastecimentos, frmFiltroRelAbastecimentos);
  frmFiltroRelAbastecimentos.mostrarForm;

  if (Assigned(frmFiltroRelAbastecimentos)) then
    FreeAndNil(frmFiltroRelAbastecimentos);

end;

function TfrmFiltroRelAbastecimentos.PegarFiltrosDadosSql: string;
begin
Result := ' WHERE 1 = 1 ';

  if (MEDataInicio.Text <> '  /  /    ') then
    Result := Result + ' AND DATA >= ''' + FormatDateTime('DD.MM.YYYY', StrToDate(MEDataInicio.Text)) + '''';

  if (MEDataFim.Text <> '  /  /    ') then
    Result := Result + ' AND DATA <= ''' + FormatDateTime('DD.MM.YYYY', StrToDate(MEDataFim.Text)) + '''';

  if (DBLkpTanque.KeyValue <> Null) then
    Result := Result + ' AND T.ID = ' + DSTanque.DataSet.FieldByName('ID').AsString;

  if (DBLkpBomba.KeyValue <> Null) then
    Result := Result + ' AND B.ID = ' + DSBomba.DataSet.FieldByName('ID').AsString;
end;

function TfrmFiltroRelAbastecimentos.ValidaCampos: Boolean;
begin
    Result := True;

  if (MEDataInicio.Text = '  /  /    ') and
     (MEDataFim.Text <> '  /  /    ') then
    begin
      Application.MessageBox('Preecha a Data Incial e Data Final.', 'Atenção', MB_ICONINFORMATION + MB_OK);
      Result := False;
    end;

  if ((MEDataInicio.Text <> '  /  /    ') and (MEDataFim.Text <> '  /  /    ') and
      (StrToDate(MEDataInicio.Text) > StrToDate(MEDataFim.Text))) then
    begin
      Application.MessageBox('A Data Inicial não pode ser Maior que a Data Final.', 'Atenção', MB_ICONINFORMATION + MB_OK);
      Result := False;
    end;
end;

end.
