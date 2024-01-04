unit Mail4Delphi;

{$IF DEFINED(FPC)}
{$MODE DELPHI}{$H+}
{$ENDIF}

interface

uses
{$IF DEFINED(FPC)}
  Classes, SysUtils, Variants,
{$ELSE}
  System.Classes, System.SysUtils, System.Variants,
{$ENDIF}
  IdSMTP, IdSSLOpenSSL, IdMessage, IdMessageParts, IdText, IdAttachmentFile, IdExplicitTLSClientServerBase, Mail4Delphi.Intf;

type
  IMail = Mail4Delphi.Intf.IMail;

  TMail = class(TInterfacedObject, IMail)
  private const
    CONNECT_TIMEOUT = 60000;
    READ_TIMEOUT = 60000;
  private
    FIdSSLIOHandlerSocket: TIdSSLIOHandlerSocketOpenSSL;
    FIdSMTP: TIdSMTP;
    FIdMessage: TIdMessage;
    FIdText: TIdText;
    FSSL: Boolean;
    FAuth: Boolean;
    FReceiptRecipient: Boolean;
    function AddTo(const AMail: string; const AName: string = ''): IMail;
    function From(const AMail: string; const AName: string = ''): IMail;
    function ReceiptRecipient(const AValue: Boolean): IMail;
    function Subject(const ASubject: string): IMail;
    function AddReplyTo(const AMail: string; const AName: string = ''): IMail;
    function AddCC(const AMail: string; const AName: string = ''): IMail;
    function AddBCC(const AMail: string; const AName: string = ''): IMail;
    function AddBody(const ABody: string): IMail;
    function MessageId(const AMessageId: string): IMail;
    function ClearBody: IMail;
    function ClearAttachments: IMail;
    function Host(const AHost: string): IMail;
    function UserName(const AUserName: string): IMail;
    function Password(const APassword: string): IMail;
    function Port(const APort: Integer): IMail;
    function AddAttachment(const AFile: string; ATemporaryFile: Boolean = False): IMail; overload;
    function AddAttachment(const AStream: TStream; const AFileName: string; const AContentType: string = ''): IMail; overload;
    function Auth(const AValue: Boolean): IMail;
    function SSL(const AValue: Boolean): IMail;
    function ContentType(const AValue: string): IMail;
    function ConnectTimeout(const ATimeout: Integer): IMail;
    function ReadTimeout(const ATimeout: Integer): IMail;
    function Clear: IMail;
    function SendMail: Boolean;
    function SetUpEmail: Boolean;
    function Connect: Boolean;
    function Disconnect: Boolean;
    function MessageDefault: IMail;
  protected
    property IdSSLIOHandlerSocket: TIdSSLIOHandlerSocketOpenSSL read FIdSSLIOHandlerSocket write FIdSSLIOHandlerSocket;
    property IdSMTP: TIdSMTP read FIdSMTP write FIdSMTP;
    property IdMessage: TIdMessage read FIdMessage write FIdMessage;
    property IdText: TIdText read FIdText write FIdText;
    property SetSSL: Boolean read FSSL write FSSL;
    property SetAuth: Boolean read FAuth write FAuth;
    property SetReceiptRecipient: Boolean read FReceiptRecipient write FReceiptRecipient;
  public
    class function New: IMail;
    constructor Create;
    destructor Destroy; override;
  end;

implementation

function TMail.From(const AMail: string; const AName: string = ''): IMail;
begin
  if AMail.Trim.IsEmpty then
    raise Exception.Create('Sender email not informed!');
  FIdMessage.From.Address := AMail.Trim;
  FIdMessage.From.Name := AName.Trim;
  Result := Self;
end;

function TMail.AddBCC(const AMail: string; const AName: string = ''): IMail;
begin
  Result := Self;
  if AMail.Trim.IsEmpty then
    Exit;
  with FIdMessage.BccList.Add do
  begin
    Address := AMail.Trim;
    Name := AName.Trim;
  end;
end;

function TMail.AddAttachment(const AFile: string; ATemporaryFile: Boolean): IMail;
var
  LFile: TIdAttachmentFile;
begin
  LFile := TIdAttachmentFile.Create(FIdMessage.MessageParts, AFile);
  LFile.ContentDescription := ExtractFileName(AFile);
  LFile.FileIsTempFile := ATemporaryFile;
  Result := Self;
end;

function TMail.AddAttachment(const AStream: TStream; const AFileName: string; const AContentType: string): IMail;
var
  LFile: TIdAttachmentFile;
begin
  AStream.Position := 0;
  LFile := TIdAttachmentFile.Create(FIdMessage.MessageParts, AFileName);
  LFile.StoredPathName := EmptyStr;
  LFile.ContentDescription := AFileName;
  if not AContentType.Trim.IsEmpty then
    LFile.ContentType := AContentType;
  LFile.LoadFromStream(AStream);
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
    raise Exception.Create('Server not informed!');
  FIdSMTP.Host := AHost;
  Result := Self;
end;

function TMail.MessageId(const AMessageId: string): IMail;
begin
  FIdMessage.MsgId := AMessageId;
  Result := Self;
end;

function TMail.MessageDefault: IMail;
begin
  FIdMessage.Encoding := meMIME;
  FIdMessage.ConvertPreamble := True;
  FIdMessage.Priority := mpNormal;
  FIdMessage.ContentType := 'multipart/mixed';
  FIdMessage.CharSet := 'utf-8';
  FIdMessage.Date := Now;
  Result := Self;
end;

function TMail.Password(const APassword: string): IMail;
begin
  if APassword.Trim.IsEmpty then
    raise Exception.Create('Password not informed!');
  FIdSMTP.Password := APassword;
  Result := Self;
end;

function TMail.Port(const APort: Integer): IMail;
begin
  if VarIsNull(APort) then
    raise Exception.Create('Port not informed!');
  FIdSMTP.Port := APort;
  Result := Self;
end;

function TMail.ReadTimeout(const ATimeout: Integer): IMail;
begin
  if (ATimeout > 0) then
    FIdSMTP.ReadTimeout := ATimeout;
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
  Result := Self;
  if AMail.Trim.IsEmpty then
    Exit;
  with FIdMessage.CCList.Add do
  begin
    Address := AMail.Trim;
    Name := AName.Trim;
  end;
end;

function TMail.AddReplyTo(const AMail: string; const AName: string = ''): IMail;
begin
  Result := Self;
  if AMail.Trim.IsEmpty then
    Exit;
  with FIdMessage.ReplyTo.Add do
  begin
    Address := AMail.Trim;
    Name := AName.Trim;
  end;
end;

function TMail.Subject(const ASubject: string): IMail;
begin
  if ASubject.Trim.IsEmpty then
    raise Exception.Create('Subject not informed!');
  FIdMessage.Subject := ASubject;
  Result := Self;
end;

function TMail.AddTo(const AMail: string; const AName: string = ''): IMail;
begin
  if AMail.Trim.IsEmpty then
    raise Exception.Create('Recipient email not informed!');
  with FIdMessage.Recipients.Add do
  begin
    Address := AMail.Trim;
    Name := AName.Trim;
  end;
  Result := Self;
end;

function TMail.Clear: IMail;
begin
  FIdMessage.ClearHeader;
  Self.MessageDefault;
  Self.ClearAttachments;
  Self.ClearBody;
  Result := Self;
end;

function TMail.ClearAttachments: IMail;
var
  I: Integer;
begin
  for I := Pred(FIdMessage.MessageParts.Count) downto 0 do
  begin
    if FIdMessage.MessageParts.Items[I].PartType = TIdMessagePartType.mptAttachment then
      FIdMessage.MessageParts.Delete(I);
  end;
  Result := Self;
end;

function TMail.ClearBody: IMail;
begin
  FIdText.Body.Clear;
  Result := Self;
end;

function TMail.Connect: Boolean;
begin
  FIdSSLIOHandlerSocket.SSLOptions.Method := sslvSSLv23;
  FIdSSLIOHandlerSocket.SSLOptions.Mode := sslmUnassigned;
  FIdSMTP.IOHandler := FIdSSLIOHandlerSocket;
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
  except
    on E: Exception do
      raise Exception.Create('Connection error: ' + E.Message);
  end;
  try
    FIdSMTP.Authenticate;
    Result := True;
  except
    on E: Exception do
    begin
      Self.Disconnect;
      raise Exception.Create('Authentication error:' + E.Message);
    end;
  end;
end;

function TMail.ConnectTimeout(const ATimeout: Integer): IMail;
begin
  if (ATimeout > 0) then
    FIdSMTP.ConnectTimeout := ATimeout;
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
  FIdSMTP.ConnectTimeout := CONNECT_TIMEOUT;
  FIdSMTP.ReadTimeout := READ_TIMEOUT;
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

function TMail.Disconnect: Boolean;
begin
  if FIdSMTP.Connected then
    FIdSMTP.Disconnect;
  UnLoadOpenSSLLibrary;
  Result := True;
end;

class function TMail.New: IMail;
begin
  Result := TMail.Create;
end;

function TMail.SendMail: Boolean;
var
  LImplicitConnection: Boolean;
begin
  if not SetUpEmail then
    raise Exception.Create('Incomplete data!');
  LImplicitConnection := False;
  if not FIdSMTP.Connected then
    LImplicitConnection := Self.Connect;
  try
    try
      FIdSMTP.Send(FIdMessage);
      Result := True;
    except
      on E: Exception do
        raise Exception.Create('Error sending message: ' + E.Message);
    end;
  finally
    if LImplicitConnection then
      Self.Disconnect;
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
    raise Exception.Create('User not informed!');
  FIdSMTP.UserName := AUserName;
  Result := Self;
end;

end.
