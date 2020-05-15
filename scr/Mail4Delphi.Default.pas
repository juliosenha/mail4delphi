unit Mail4Delphi.Default;

interface

uses Mail4Delphi.Intf, System.Classes, System.SysUtils, IdSMTP, IdSSLOpenSSL, IdMessage, IdText, IdAttachmentFile,
  IdExplicitTLSClientServerBase, System.Variants;

type
  TMail = class(TInterfacedObject, IMail)
  private
    FIdSSLIOHandlerSocket: TIdSSLIOHandlerSocketOpenSSL;
    FIdSMTP: TIdSMTP;
    FIdMessage: TIdMessage;
    FIdText: TIdText;
    FSSL: Boolean;
    FAuth: Boolean;
    FReceiptRecipient: Boolean;
    function SetUpEmail: Boolean;
  protected
    property IdSSLIOHandlerSocket: TIdSSLIOHandlerSocketOpenSSL read FIdSSLIOHandlerSocket write FIdSSLIOHandlerSocket;
    property IdSMTP: TIdSMTP read FIdSMTP write FIdSMTP;
    property IdMessage: TIdMessage read FIdMessage write FIdMessage;
    property IdText: TIdText read FIdText write FIdText;
    property SSL: Boolean read FSSL write FSSL;
    property Auth: Boolean read FAuth write FAuth;
    property ReceiptRecipient: Boolean read FReceiptRecipient write FReceiptRecipient;
  public
    function AddTo(const AMail: string; const AName: string = ''): IMail;
    function AddFrom(const AMail: string; const AName: string = ''): IMail;
    function AddSubject(const ASubject: string): IMail;
    function AddReplyTo(const AMail: string; const AName: string = ''): IMail;
    function AddCC(const AMail: string; const AName: string = ''): IMail;
    function AddBCC(const AMail: string; const AName: string = ''): IMail;
    function SetBody(const ABody: string): IMail;
    function SetHost(const AHost: string): IMail;
    function SetUserName(const AUserName: string): IMail;
    function SetPassword(const APassword: string): IMail;
    function SetPort(const APort: Integer): IMail;
    function SetReceiptRecipient(const AValue: Boolean): IMail;
    function AddAttachment(const AFile: string): IMail;
    function SetAuth(const AValue: Boolean): IMail;
    function SetSSL(const AValue: Boolean): IMail;
    function Clear: IMail;
    function SendMail: Boolean;
    class function New: IMail;
    constructor Create;
    destructor Destroy; override;
  end;

implementation

function TMail.AddFrom(const AMail: string; const AName: string = ''): IMail;
begin
  if AMail.Trim.IsEmpty then
  begin
    raise Exception.Create('E-mail do remetente não informado!');
    Exit;
  end;
  IdMessage.From.Address := AMail;
  if not AName.Trim.IsEmpty then
    IdMessage.From.Name := AName;
  Result := Self;
end;

function TMail.AddBCC(const AMail: string; const AName: string = ''): IMail;
begin
  if AMail.Trim.IsEmpty then
  begin
    raise Exception.Create('E-mail não informado para cópia oculta!');
    Exit;
  end;
  IdMessage.BccList.Add.Text := AName + ' ' + AMail;
  Result := Self;
end;

function TMail.AddAttachment(const AFile: string): IMail;
var
  LFile: TIdAttachmentFile;
begin
  LFile := TIdAttachmentFile.Create(IdMessage.MessageParts, AFile);
  LFile.ContentDescription := 'Arquivo Anexo: ' + ExtractFileName(AFile);
  Result := Self;
end;

function TMail.SetAuth(const AValue: Boolean): IMail;
begin
  FAuth := AValue;
  Result := Self;
end;

function TMail.SetBody(const ABody: string): IMail;
begin
  IdText := TIdText.Create(IdMessage.MessageParts);
  IdText.ContentType := 'text/html; text/plain; charset=iso-8859-1';
  IdText.Body.Clear;
  IdText.Body.Add(ABody);
  Result := Self;
end;

function TMail.SetHost(const AHost: string): IMail;
begin
  if AHost.Trim.IsEmpty then
    raise Exception.Create('Servidor não informado!');
  IdSMTP.Host := AHost;
  Result := Self;
end;

function TMail.SetPassword(const APassword: string): IMail;
begin
  if APassword.Trim.IsEmpty then
    raise Exception.Create('Senha não informado!');
  IdSMTP.Password := APassword;
  Result := Self;
end;

function TMail.SetPort(const APort: Integer): IMail;
begin
  if VarIsNull(APort) then
    raise Exception.Create('Senha não informado!');
  IdSMTP.Port := APort;
  Result := Self;
end;

function TMail.SetReceiptRecipient(const AValue: Boolean): IMail;
begin
  FReceiptRecipient := AValue;
  Result := Self;
end;

function TMail.SetSSL(const AValue: Boolean): IMail;
begin
  FSSL := AValue;
  Result := Self;
end;

function TMail.AddCC(const AMail: string; const AName: string = ''): IMail;
begin
  if AMail.Trim.IsEmpty then
  begin
    raise Exception.Create('E-mail não informado para cópia!');
    Exit;
  end;
  IdMessage.CCList.Add.Text := AName + ' ' + AMail;
  Result := Self;
end;

function TMail.AddReplyTo(const AMail: string; const AName: string = ''): IMail;
begin
  if AMail.Trim.IsEmpty then
  begin
    raise Exception.Create('E-mail para resposta não informado!');
    Exit;
  end;
  IdMessage.ReplyTo.Add.Text := AName + ' ' + AMail;
  Result := Self;
end;

function TMail.AddSubject(const ASubject: string): IMail;
begin
  if ASubject.Trim.IsEmpty then
    raise Exception.Create('Assunto não informado!');
  IdMessage.Subject := ASubject;
  Result := Self;
end;

function TMail.AddTo(const AMail: string; const AName: string = ''): IMail;
begin
  if AMail.Trim.IsEmpty then
    raise Exception.Create('E-mail do destinatário não informado!')
  else
    IdMessage.Recipients.Add.Text := AName + ' ' + AMail;
  Result := Self;
end;

function TMail.Clear: IMail;
begin
  IdMessage.Clear;
  Result := Self;
end;

constructor TMail.Create;
begin
  FIdSSLIOHandlerSocket := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  FIdSMTP := TIdSMTP.Create(nil);
  IdMessage := TIdMessage.Create(nil);
  IdMessage.Encoding := meMIME;
  IdMessage.ConvertPreamble := True;
  IdMessage.Priority := mpNormal;
  IdMessage.ContentType := 'multipart/mixed';
  IdMessage.CharSet := 'ISO-8859-1';
  IdMessage.Date := Now;
  FSSL := False;
  FAuth := False;
  FReceiptRecipient := False;
end;

destructor TMail.Destroy;
begin
  FreeAndNil(FIdMessage);
  FreeAndNil(FIdSSLIOHandlerSocket);
  FreeAndNil(FIdSMTP);
end;

class function TMail.New: IMail;
begin
  Result := TMail.Create;
end;

function TMail.SendMail: Boolean;
begin
  if not SetUpEmail then
  begin
    raise Exception.Create('Dados incompletos!');
    Exit(False);
  end;

  IdSSLIOHandlerSocket.SSLOptions.Method := sslvTLSv1_2;
  IdSSLIOHandlerSocket.SSLOptions.Mode := sslmUnassigned;
  IdSMTP.IOHandler := IdSSLIOHandlerSocket;
  IdSMTP.UseTLS := utUseExplicitTLS;
  if FSSL then
  begin
    IdSSLIOHandlerSocket.SSLOptions.Mode := sslmClient;
    IdSMTP.UseTLS := utUseImplicitTLS;
  end;
  IdSMTP.AuthType := satNone;
  if FAuth then
    IdSMTP.AuthType := satDefault;
  if ReceiptRecipient then
    IdMessage.ReceiptRecipient.Text := IdMessage.From.Name + ' ' + IdMessage.From.Address;
  try
    IdSMTP.Connect;
    IdSMTP.Authenticate;
  except
    on E: Exception do
    begin
      raise Exception.Create('Erro na conexão ou autenticação: ' + E.Message);
      Exit(False);
    end;
  end;

  try
    IdSMTP.Send(IdMessage);
    IdSMTP.Disconnect;
    UnLoadOpenSSLLibrary;
    Result := True;
  except
    on E: Exception do
      raise Exception.Create('Erro ao enviar a mensagem: ' + E.Message);
  end;
end;

function TMail.SetUpEmail: Boolean;
begin
  Result := False;
  if not(IdMessage.Recipients.Count < 1) then
    if not(IdSMTP.Host.Trim.IsEmpty) then
      if not(IdSMTP.Username.Trim.IsEmpty) then
        if not(IdSMTP.Password.Trim.IsEmpty) then
          Result := not(VarIsNull(IdSMTP.Port));
end;

function TMail.SetUserName(const AUserName: string): IMail;
begin
  if AUserName.Trim.IsEmpty then
    raise Exception.Create('Usuário não informado!');
  IdSMTP.Username := AUserName;
  Result := Self;
end;

end.
