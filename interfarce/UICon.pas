unit UICon;

interface

uses
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  Data.DB;

type
  TTipoFDQuery  = (tFDQAbastecimentos, tFDQTanques, tFDQBombas);
  ICon = interface
    ['{CFA15C2E-77E9-4F7F-8D0C-17DDAECB00DD}']
    function Conectar: ICon;
  end;

  IConController = interface
    ['{B47CBB19-3AEE-48A1-952F-7ED9AC6E159F}']
    function SetFDQuery(AoQuery: TTipoFDQuery): IConController;
    function GetTipoFDQuery: TFDQuery;
    function GetFDConnection: TFDConnection;
  end;

implementation

end.
