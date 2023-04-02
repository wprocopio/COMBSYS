unit UTabela.Factory.Controller;

interface

uses
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  Data.DB, UITabela.Factory, UICon;

type
  TTabelaFactory = class(TInterfacedObject, ITabelaFactory)
  private
    FTipoTabela: TTipoFDQuery;

    function GetTabela(AoQuery: TTipoFDQuery): TFDQuery;
    function GetConnection: TFDConnection;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: ITabelaFactory;
  end;

implementation

{ TTabelaFactory }

uses UdmPrincipal, UTabelas.Factory.Model;

constructor TTabelaFactory.Create;
begin

end;

destructor TTabelaFactory.Destroy;
begin

  inherited;
end;

function TTabelaFactory.GetConnection: TFDConnection;
begin
  Result := DmPrincipal.FDCConection;
end;

function TTabelaFactory.GetTabela(AoQuery: TTipoFDQuery): TFDQuery;
begin
     Result := TModelTabelaFactory.New(AoQuery).GetTabela;
end;

class function TTabelaFactory.New: ITabelaFactory;
begin
   Result := Self.Create;
end;

end.
