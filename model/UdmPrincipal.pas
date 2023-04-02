unit UdmPrincipal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, Data.DB,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.UI, FireDAC.Phys.IBBase;

type
  TDmPrincipal = class(TDataModule)
    FDCConection: TFDConnection;
    FDTConection: TFDTransaction;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDQBombas: TFDQuery;
    FDQBombasID: TIntegerField;
    FDQBombasDESCRICAO: TStringField;
    FDQBombasTANQUE_ID: TIntegerField;
    FDQTanques: TFDQuery;
    FDQTanquesID: TIntegerField;
    FDQTanquesDESCRICAO: TStringField;
    FDQAbastecimentos: TFDQuery;
    FDQAbastecimentosID: TIntegerField;
    FDQAbastecimentosDATA: TDateField;
    FDQAbastecimentosBOMBA_ID: TIntegerField;
    FDQAbastecimentosLITROS: TFMTBCDField;
    FDQAbastecimentosBOMBA: TStringField;
    FDQAbastecimentosVALOR: TFMTBCDField;
    FDQAbastecimentosIMPOSTO: TFMTBCDField;
    procedure FDQAbastecimentosCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmPrincipal: TDmPrincipal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UhelperFree;

{$R *.dfm}

procedure TDmPrincipal.FDQAbastecimentosCalcFields(DataSet: TDataSet);
var
  qryTemp: TFDQuery;
begin
if (FDQAbastecimentosBOMBA_ID.AsString <> EmptyStr) then
    begin
      qryTemp            := TAFreeCreate.New(TFDQuery.Create(Nil)).GetInstance;
      qryTemp.Connection := FDCConection;

      qryTemp.Close;
      qryTemp.SQL.Clear;
      qryTemp.SQL.Add('SELECT DESCRICAO FROM BOMBAS WHERE ID = ' + FDQAbastecimentosBOMBA_ID.AsString);
      qryTemp.Open;

      if (qryTemp.RecordCount > 0) then
        FDQAbastecimentosBOMBA.AsString := qryTemp.FieldByName('DESCRICAO').AsString
      else FDQAbastecimentosBOMBA.AsString := EmptyStr;
    end;
end;

end.
