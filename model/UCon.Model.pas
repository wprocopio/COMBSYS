unit UCon.Model;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.Menus, UICon, Data.DB, IBX.IBCustomDataSet, IBX.IBQuery,UdmPrincipal ,
    Inifiles;

type
  TModelConexao = class(TInterfacedObject, ICon)
  private
    FDriverID,
    FBanco,
    FUsuario,
    FSenha,
    FServer,
    FPorta: String;

    procedure CarregarINI(AcDiretorioIni: String);
    function Conectar: ICon;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: ICon;
  end;


implementation

{ TModelConexao }

procedure TModelConexao.CarregarINI(AcDiretorioIni: String);
var
  arqINI: TIniFile;
begin
try
    arqINI := TIniFile.Create(AcDiretorioIni);

    FDriverID  := arqINI.ReadString('Conexao', 'DriverID',  '');
    FBanco     := arqINI.ReadString('Conexao', 'Database',  '');
    FUsuario   := arqINI.ReadString('Conexao', 'User_Name', '');
    FSenha     := arqINI.ReadString('Conexao', 'Password',  '');
    FServer    := arqINI.ReadString('Conexao', 'Server',    '');
    FPorta     := arqINI.ReadString('Conexao', 'Port',      '');
  finally
    arqINI.Free;
  end;
end;

function TModelConexao.Conectar: ICon;
begin
  try
    DmPrincipal.FDCConection.Connected := False;
    DmPrincipal.FDCConection.Params.Values['DriverID'] := FDriverID;
    DmPrincipal.FDCConection.Params.Values['Database'] := FBanco;
    DmPrincipal.FDCConection.Params.Values['UserName'] := FUsuario;
    DmPrincipal.FDCConection.Params.Values['Password'] := FSenha;
    DmPrincipal.FDCConection.Params.Values['Server']   := FServer;
    DmPrincipal.FDCConection.Params.Values['Port']     := FPorta;
    DmPrincipal.FDCConection.Connected := True;
  except
  on E: Exception do
    begin
      Application.MessageBox(PChar('Erro ao conectar com o Banco de Dados Contate o Suporte.'
                                    + #13  + E.Message), 'Atenção', MB_ICONERROR + MB_OK);
      TerminateProcess(GetCurrentProcess, 0);
    end;
  end;
end;

constructor TModelConexao.Create;
begin
  const ArquivoINI = GetCurrentDir + '\config.ini';

  if (not FileExists(ArquivoINI)) then
    begin
      Application.MessageBox('Não foi possível localizar o arquivo de configurações.', 'Atenção', MB_ICONWARNING + MB_OK);
      TerminateProcess(GetCurrentProcess, 0);
    end;

  CarregarINI(ArquivoINI);
end;

destructor TModelConexao.Destroy;
begin

  inherited;
end;

class function TModelConexao.New: ICon;
begin
  Result := Self.Create;
end;

end.
