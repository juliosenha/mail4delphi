unit Mail4Delphi;

interface

uses Mail4Delphi.Intf, System.Classes, System.SysUtils, IdSMTP, IdSSLOpenSSL, IdMessage, IdText, IdAttachmentFile,
  IdExplicitTLSClientServerBase, System.Variants;

type
  IMail = Mail4Delphi.Intf.IMail;

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
    property SetSSL: Boolean read FSSL write FSSL;
    property SetAuth: Boolean read FAuth write FAuth;
    property SetReceiptRecipient: Boolean read FReceiptRecipient write FReceiptRecipient;
  public
    function AddTo(const AMail: string; const AName: string = ''): IMail;
    function AddFrom(const AMail: string; const AName: string = ''): IMail;
    function AddSubject(const ASubject: string): IMail;
    function AddReplyTo(const AMail: string; const AName: string = ''): IMail;
    function AddCC(const AMail: string; const AName: string = ''): IMail;
    function AddBCC(const AMail: string; const AName: string = ''): IMail;
    function AddBody(const ABody: string): IMail;
    function Host(const AHost: string): IMail;
    function UserName(const AUserName: string): IMail;
    function Password(const APassword: string): IMail;
    function Port(const APort: Integer): IMail;
    function ReceiptRecipient(const AValue: Boolean): IMail;
    function AddAttachment(const AFile: string): IMail;
    function Auth(const AValue: Boolean): IMail;
    function SSL(const AValue: Boolean): IMail;
    function ContentType(const AValue: string): IMail;
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
    raise Exception.Create('E-mail do remetente não informado!');
  FIdMessage.From.Address := AMail;
  if not AName.Trim.IsEmpty then
    FIdMessage.From.Name := AName;
  Result := Self;
end;

function TMail.AddBCC(const AMail: string; const AName: string = ''): IMail;
begin
  if not(AMail.Trim.IsEmpty) then
    FIdMessage.BccList.Add.Text := AName + ' ' + AMail;
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

function TMail.Auth(const AValue: Boolean): IMail;
begin
  FAuth := AValue;
  Result := Self;
end;

function TMail.AddBody(const ABody: string): IMail;
begin
  FIdText.Body.Add(ABody);
  Result := Self;
end;

function TMail.Host(const AHost: string): IMail;
begin
  if AHost.Trim.IsEmpty then
    raise Exception.Create('Servidor não informado!');
  FIdSMTP.Host := AHost;
  Result := Self;
end;

function TMail.Password(const APassword: string): IMail;
begin
  if APassword.Trim.IsEmpty then
    raise Exception.Create('Senha não informado!');
  FIdSMTP.Password := APassword;
  Result := Self;
end;

function TMail.Port(const APort: Integer): IMail;
begin
  if VarIsNull(APort) then
    raise Exception.Create('Porta não informada!');
  FIdSMTP.Port := APort;
  Result := Self;
end;

function TMail.ReceiptRecipient(const AValue: Boolean): IMail;
begin
  FReceiptRecipient := AValue;
  Result := Self;
end;

function TMail.SSL(const AValue: Boolean): IMail;
begin
  FSSL := AValue;
  Result := Self;
end;

function TMail.AddCC(const AMail: string; const AName: string = ''): IMail;
begin
  if not(AMail.Trim.IsEmpty) then
    FIdMessage.CCList.Add.Text := AName + ' ' + AMail;
  Result := Self;
end;

function TMail.AddReplyTo(const AMail: string; const AName: string = ''): IMail;
begin
  if not(AMail.Trim.IsEmpty) then
    FIdMessage.ReplyTo.Add.Text := AName + ' ' + AMail;
  Result := Self;
end;

function TMail.AddSubject(const ASubject: string): IMail;
begin
  if ASubject.Trim.IsEmpty then
    raise Exception.Create('Assunto não informado!');
  FIdMessage.Subject := ASubject;
  Result := Self;
end;

function TMail.AddTo(const AMail: string; const AName: string = ''): IMail;
begin
  if AMail.Trim.IsEmpty then
    raise Exception.Create('E-mail do destinatário não informado!');
  FIdMessage.Recipients.Add.Text := AName + ' ' + AMail;
  Result := Self;
end;

function TMail.Clear: IMail;
begin
  FIdMessage.Clear;
  FIdText.Body.Clear;
  Result := Self;
end;

function TMail.ContentType(const AValue: string): IMail;
begin
  FIdText.ContentType := AValue;
  Result := Self;
end;

constructor TMail.Create;
begin
  FIdSSLIOHandlerSocket := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  FIdSMTP := TIdSMTP.Create(nil);
  FIdMessage := TIdMessage.Create(nil);
  FIdMessage.Encoding := meMIME;
  FIdMessage.ConvertPreamble := True;
  FIdMessage.Priority := mpNormal;
  FIdMessage.ContentType := 'multipart/mixed';
  FIdMessage.CharSet := 'utf-8';
  FIdMessage.Date := Now;
  FIdText := TIdText.Create(IdMessage.MessageParts);
  FIdText.ContentType := 'text/html; text/plain;';
  FIdText.CharSet := 'utf-8';
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
    raise Exception.Create('Dados incompletos!');
  try
    FIdSSLIOHandlerSocket.SSLOptions.Method := sslvTLSv1_2;
    FIdSSLIOHandlerSocket.SSLOptions.Mode := sslmUnassigned;
    FIdSMTP.IOHandler := IdSSLIOHandlerSocket;
    FIdSMTP.UseTLS := utUseExplicitTLS;
    if FSSL then
    begin
      FIdSSLIOHandlerSocket.SSLOptions.Mode := sslmClient;
      FIdSMTP.UseTLS := utUseImplicitTLS;
    end;
    FIdSMTP.AuthType := satNone;
    if FAuth then
      FIdSMTP.AuthType := satDefault;
    if FReceiptRecipient then
      FIdMessage.ReceiptRecipient.Text := FIdMessage.From.Name + ' ' + FIdMessage.From.Address;
    try
      FIdSMTP.Connect;
      FIdSMTP.Authenticate;
    except
      on E: Exception do
        raise Exception.Create('Erro na conexão ou autenticação: ' + E.Message);
    end;
    try
      FIdSMTP.Send(IdMessage);
    except
      on E: Exception do
        raise Exception.Create('Erro ao enviar a mensagem: ' + E.Message);
    end;
  finally
    FIdSMTP.Disconnect;
    UnLoadOpenSSLLibrary;
    Result := True;
  end;
end;

function TMail.SetUpEmail: Boolean;
begin
  Result := False;
  if not(FIdMessage.Recipients.Count < 1) then
    if not(FIdSMTP.Host.Trim.IsEmpty) then
      if not(FIdSMTP.UserName.Trim.IsEmpty) then
        if not(FIdSMTP.Password.Trim.IsEmpty) then
          Result := not(VarIsNull(FIdSMTP.Port));
end;

function TMail.UserName(const AUserName: string): IMail;
begin
  if AUserName.Trim.IsEmpty then
    raise Exception.Create('Usuário não informado!');
  FIdSMTP.UserName := AUserName;
  Result := Self;
end;

end.
