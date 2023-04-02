unit UhelperFree;

interface

type
    IHelperFreeCreate = interface
    ['{A4C8DCD9-85F5-4911-AE05-B90456212BD1}']

    function GetInstance: Pointer;
    property Instance: Pointer read GetInstance;

    end;

      TAFreeCreate = class(TInterfacedObject, IHelperFreeCreate)
  private
    Instance: TObject;
    function GetInstance: Pointer;
  public
    constructor Create(AInstance: TObject);
    destructor Destroy; override;
    class function New(AlInstance: TObject): IHelperFreeCreate;
  end;


implementation
 uses
  SysUtils;



{ TAutoFreeCreate }

constructor TAFreeCreate.Create(AInstance: TObject);
begin
  inherited Create;
  Instance := AInstance;
end;

destructor TAFreeCreate.Destroy;
begin
  try
    SysUtils.FreeAndNil(Instance);
  except
    On E: Exception do
      if (Pos('iola', E.Message) = 0) then
        raise;
  end;
  inherited;
end;

function TAFreeCreate.GetInstance: Pointer;
begin
     Result := Instance;
end;

class function TAFreeCreate.New(AlInstance: TObject): IHelperFreeCreate;
begin
    Result := TAFreeCreate.Create(AlInstance);
end;

end.
