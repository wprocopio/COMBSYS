unit UfrmBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;
type
  TfrmBase = class(TForm)
    pnlButon: TPanel;
    btnNovo: TButton;
    btnEditar: TButton;
    btnSalvar: TButton;
    btnCancelar: TButton;
    btnExcluir: TButton;
    DSBase: TDataSource;
    procedure HabilitarEntrada;
    procedure DesaHabilitaEntradas;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure DSBaseStateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Connection: TFDConnection;
  public
    { Public declarations }
  end;

var
  frmBase: TfrmBase;

implementation

{$R *.dfm}

uses UCon.Controller;

{ TfrmBase }

procedure TfrmBase.btnCancelarClick(Sender: TObject);
begin
  DSBase.DataSet.Cancel;
  Connection.Rollback;

end;

procedure TfrmBase.btnEditarClick(Sender: TObject);
begin
 if (DSBase.DataSet.RecordCount > 0) then
    begin
      Connection.StartTransaction;
      DSBase.DataSet.Edit;
    end
  else Application.MessageBox('Não possui Registros para ser editado.', 'Atenção', MB_ICONEXCLAMATION + MB_OK);

end;

procedure TfrmBase.btnExcluirClick(Sender: TObject);
begin
if Application.MessageBox(' Deseja excluir o registro?', 'Atenção', MB_ICONQUESTION + MB_YESNO) = ID_YES then
    begin
      if (DSBase.DataSet.RecordCount > 0) then
        begin
          Connection.StartTransaction;
          DSBase.DataSet.Delete;
          Connection.Commit;
        end
      else Application.MessageBox('Não existem registros para exclusão.', 'Atenção', MB_ICONEXCLAMATION + MB_OK);
    end;
end;

procedure TfrmBase.btnNovoClick(Sender: TObject);
begin
  Connection.StartTransaction;
  DSBase.DataSet.Append;
end;

procedure TfrmBase.btnSalvarClick(Sender: TObject);
begin
  DSBase.DataSet.Post;
  Connection.Commit;

end;

procedure TfrmBase.DesaHabilitaEntradas;
var
    i: Integer;
begin
for i := 0 to ComponentCount - 1 do
    begin
      if (Components[i] is TDBEdit) then
        begin
          if (TDBEdit(Components[i]).Tag = 0) then
            TDBEdit(Components[i]).Enabled := False;
        end;
      if (Components[i] is TEdit) then
        begin
          if (TEdit(Components[i]).Tag = 0) then
            TEdit(Components[i]).Enabled := False;
        end;
      if (Components[i] is TCombobox) then
        begin
          if (TCombobox(Components[i]).Tag = 0) then
            TCombobox(Components[i]).Enabled := False;
        end;
      if (Components[i] is  TGroupBox) then
        begin
          if (TGroupBox(Components[i]).Tag = 0) then
            TGroupBox(Components[i]).Enabled := False;
        end;
    end;
end;

procedure TfrmBase.DSBaseStateChange(Sender: TObject);
begin
if (DSbase.State in [dsEdit, dsInsert])then
    begin
      btnNovo.Enabled     := False;
      btnExcluir.Enabled  := False;
      btnEditar.Enabled   := False;
      btnSalvar.Enabled   := True;
      btnCancelar.Enabled := True;
      HabilitarEntrada;
    end
  else
    begin
      btnNovo.Enabled     := True;
      btnExcluir.Enabled  := True;
      btnEditar.Enabled   := True;
      btnSalvar.Enabled   := False;
      btnCancelar.Enabled := False;
      DesaHabilitaEntradas;
    end;
end;

procedure TfrmBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TfrmBase.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 if (DSBase.State in [dsInsert, dsEdit]) then
    CanClose := Application.MessageBox('Aplicacao encontra-se com Ação de Inserçao ou Alteração de Dados'#13'Deseja fechar esse Cadastro ', 'Atenção', MB_ICONQUESTION + MB_YESNO) = ID_YES;

end;

procedure TfrmBase.FormCreate(Sender: TObject);
begin
 Connection   := TControllerConexao
                      .New
                      .GetFDConnection;
end;

procedure TfrmBase.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    end;

end;

procedure TfrmBase.HabilitarEntrada;
var
    i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
    begin
      if (Components[i] is TDBEdit) then
        TDBEdit(Components[i]).Enabled := True;
      if (Components[i] is TEdit) then
        TEdit(Components[i]).Enabled := True;
      if (Components[i] is TCombobox) then
        TCombobox(Components[i]).Enabled := True;
      if (Components[i] is  TGroupBox) then
        TGroupBox(Components[i]).Enabled := True;
    end;
end;

end.
