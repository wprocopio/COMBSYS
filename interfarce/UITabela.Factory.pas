unit UITabela.Factory;

interface

uses
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  Data.DB ,UICon ;

type
  ITabelaFactory = interface
    ['{1DD516E0-E49F-4775-8B6B-06A99D1765D5}']
    function GetTabela(AoQuery: TTipoFDQuery): TFDQuery;
    function GetConnection: TFDConnection;
  end;

  IModelTabelaFactory = interface
    ['{99928F39-657C-4454-B80B-CB48C2A6135B}']
    function GetTabela: TFDQuery;
  end;


implementation



end.
