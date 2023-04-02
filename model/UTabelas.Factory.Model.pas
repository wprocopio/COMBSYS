unit UTabelas.Factory.Model;

{     obs
  estou usando esse padrao Factory pra poder ter um query pronta
}


interface

uses
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  Data.DB,UITabela.Factory,UICon,UdmPrincipal ;

type
    TModelTabelaFactory = class(TInterfacedObject, IModelTabelaFactory)

    private
    FTipoTabela: TTipoFDQuery;

    function GetTabela: TFDQuery;
    function ConsultarFDQuery(AQuery: TFDQuery): TFDQuery;
    function TratarTabelas: String;
  public
    constructor Create(AoQuery: TTipoFDQuery);
    destructor Destroy; override;
    class function New(AoQuery: TTipoFDQuery): IModelTabelaFactory;
  end;
implementation



{ TModelTabelaFactory }

function TModelTabelaFactory.ConsultarFDQuery(AQuery: TFDQuery): TFDQuery;
begin
  AQuery.Close;
  AQuery.SQL.Clear;
  AQuery.SQL.Add('SELECT * FROM ' + TratarTabelas);
  AQuery.Open;
  AQuery.FetchAll;

  Result := AQuery;
end;

constructor TModelTabelaFactory.Create(AoQuery: TTipoFDQuery);
begin
     FTipoTabela := AoQuery;
end;

destructor TModelTabelaFactory.Destroy;
begin

  inherited;
end;

function TModelTabelaFactory.GetTabela: TFDQuery;
begin
  case (FTipoTabela) of
    tFDQAbastecimentos: Result := ConsultarFDQuery(DmPrincipal.FDQAbastecimentos);
    tFDQTanques:        Result := ConsultarFDQuery(DmPrincipal.FDQTanques);
    tFDQBombas:         Result := ConsultarFDQuery(DmPrincipal.FDQBombas);
  end;
end;

class function TModelTabelaFactory.New(
  AoQuery: TTipoFDQuery): IModelTabelaFactory;
begin
    Result := Self.Create(AoQuery);
end;

function TModelTabelaFactory.TratarTabelas: String;
begin
  case (FTipoTabela) of
    tFDQAbastecimentos: Result := 'ABASTECIMENTOS ORDER BY DATA DESC';
    tFDQTanques:        Result := 'TANQUES';
    tFDQBombas:         Result := 'BOMBAS';
  end;
end;

end.
