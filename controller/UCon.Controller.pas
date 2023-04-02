unit UCon.Controller;

interface
uses
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  Data.DB,UICon;

type
  TControllerConexao = class(TInterfacedObject, IConController)
  private
    FQueryTabela: TFDQuery;

    function SetFDQuery(AoQuery: TTipoFDQuery): IConController;
    function GetTipoFDQuery: TFDQuery;
    function GetFDConnection: TFDConnection;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IConController;
  end;
implementation


{ TControllerConexao }

uses UTabela.Factory.Controller;

constructor TControllerConexao.Create;
begin

end;

destructor TControllerConexao.Destroy;
begin

  inherited;
end;

function TControllerConexao.GetFDConnection: TFDConnection;
begin
  result:=  TTabelaFactory.New.GetConnection;
end;

function TControllerConexao.GetTipoFDQuery: TFDQuery;
begin
  Result := FQueryTabela;
end;

class function TControllerConexao.New: IConController;
begin
     Result := Self.Create;
end;

function TControllerConexao.SetFDQuery(AoQuery: TTipoFDQuery): IConController;
begin
  Result       := Self;
  FQueryTabela := TTabelaFactory.New.GetTabela(AoQuery);

end;

end.
