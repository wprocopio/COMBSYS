unit UrptRelAbastecimentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, RLReport;

type
  TrptRelAbasteciemntos = class(TForm)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLGroup1: TRLGroup;
    RLBand2: TRLBand;
    RLLabel1: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLDBText3: TRLDBText;
    RLLabel4: TRLLabel;
    RLDBText4: TRLDBText;
    RLLabel9: TRLLabel;
    RLDBText5: TRLDBText;
    RLLabel15: TRLLabel;
    RLDBText6: TRLDBText;
    RLBand3: TRLBand;
    rlResultValor: TRLDBResult;
    RLLabel6: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel13: TRLLabel;
    rlResultImposto: TRLDBResult;
    RLLabel16: TRLLabel;
    rlResultLitros: TRLDBResult;
    RLBand4: TRLBand;
    RLLabel11: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel14: TRLLabel;
    RLLTotPerValor: TRLLabel;
    RLLTotPerImposto: TRLLabel;
    RLLabel17: TRLLabel;
    RLLTotPerLitros: TRLLabel;
    FDQRptRel: TFDQuery;
    DSRpt: TDataSource;
    RLLabel7: TRLLabel;
    RLLTit: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel18: TRLLabel;
    RLLEnt: TRLLabel;
    RLLDtHora: TRLLabel;
    RLSysData: TRLSystemInfo;
    RLSysHora: TRLSystemInfo;
    RLLabel39: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel38: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand4BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure rlResultLitrosCompute(Sender: TObject; var Value: Variant;
      var AText: string; var ComputeIt: Boolean);
    procedure rlResultValorCompute(Sender: TObject; var Value: Variant;
      var AText: string; var ComputeIt: Boolean);
    procedure rlResultImpostoCompute(Sender: TObject; var Value: Variant;
      var AText: string; var ComputeIt: Boolean);
  private
    { Private declarations }
      TotalPerValor, TotalPerImposto, TotalPerLitros: Double;
    procedure MostrarRelatorio(SQL: String);
  public
    { Public declarations }
      class function New(SQL: String): TrptRelAbasteciemntos;
  end;

var
  rptRelAbasteciemntos: TrptRelAbasteciemntos;

implementation

{$R *.dfm}

uses UCon.Controller;

{ TrptRelAbasteciemntos }

procedure TrptRelAbasteciemntos.MostrarRelatorio(SQL: String);
begin
  FDQRptRel.Connection := TControllerConexao
                         .New
                         .GetFDConnection;
  FDQRptRel.Close;
  FDQRptRel.SQL.Clear;
  FDQRptRel.SQL.Add(SQL);
  FDQRptRel.Open;

  TFloatField(FDQRptRel.Fields[1]).DisplayFormat := '0.00 L';
  TFloatField(FDQRptRel.Fields[1]).EditFormat    := '0.00 L';
  TFloatField(FDQRptRel.Fields[2]).DisplayFormat := 'R$ ,0.00';
  TFloatField(FDQRptRel.Fields[2]).EditFormat    := 'R$ ,0.00';
  TFloatField(FDQRptRel.Fields[3]).DisplayFormat := 'R$ ,0.00';
  TFloatField(FDQRptRel.Fields[3]).EditFormat    := 'R$ ,0.00';

  TotalPerValor   := 0;
  TotalPerImposto := 0;
  TotalPerLitros  := 0;

  RLReport1.Preview();

end;

class function TrptRelAbasteciemntos.New(SQL: String): TrptRelAbasteciemntos;
begin
  Result := Self.Create(rptRelAbasteciemntos);
  if (not Assigned(rptRelAbasteciemntos)) then
    Application.CreateForm(TrptRelAbasteciemntos, rptRelAbasteciemntos);
  rptRelAbasteciemntos.MostrarRelatorio(SQL);

  if Assigned(rptRelAbasteciemntos) then
    FreeAndNil(rptRelAbasteciemntos);

end;

procedure TrptRelAbasteciemntos.RLBand2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  TotalPerValor   := TotalPerValor   + FDQRptRel.FieldByName('VALOR').AsCurrency;
  TotalPerImposto := TotalPerImposto + FDQRptRel.FieldByName('IMPOSTO').AsCurrency;
  TotalPerLitros  := TotalPerLitros  + FDQRptRel.FieldByName('LITROS').AsCurrency;

end;

procedure TrptRelAbasteciemntos.RLBand4BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLTotPerValor.Caption   := FormatFloat('R$ ,0.00', TotalPerValor);
  RLLTotPerImposto.Caption := FormatFloat('R$ ,0.00', TotalPerImposto);
  RLLTotPerLitros.Caption  := FormatFloat('0.00 L',   TotalPerLitros);

end;

procedure TrptRelAbasteciemntos.rlResultImpostoCompute(Sender: TObject;
  var Value: Variant; var AText: string; var ComputeIt: Boolean);
begin
  Value := FDQRptRel.FieldByName('IMPOSTO').AsCurrency;
end;

procedure TrptRelAbasteciemntos.rlResultLitrosCompute(Sender: TObject;
  var Value: Variant; var AText: string; var ComputeIt: Boolean);
begin
  Value := FDQRptRel.FieldByName('LITROS').AsCurrency;
end;

procedure TrptRelAbasteciemntos.rlResultValorCompute(Sender: TObject;
  var Value: Variant; var AText: string; var ComputeIt: Boolean);
begin
Value := FDQRptRel.FieldByName('VALOR').AsCurrency;
end;

end.
