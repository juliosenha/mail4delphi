unit Mail4Delphi.Intf;

interface

type
  IMail = interface
    ['{A63918AD-EA2C-4CB9-98C5-90C3BAB95144}']
    function AddTo(const AMail: string; const AName: string = ''): IMail;
    function AddFrom(const AMail: string; const AName: string = ''): IMail;
    function SetReceiptRecipient(const AValue: Boolean): IMail;
    function AddSubject(const ASubject: string): IMail;
    function AddReplyTo(const AMail: string; const AName: string = ''): IMail;
    function AddCC(const AMail: string; const AName: string = ''): IMail;
    function AddBCC(const AMail: string; const AName: string = ''): IMail;
    function SetBody(const ABody: string): IMail;
    function SetHost(const AHost: string): IMail;
    function SetUserName(const AUserName: string): IMail;
    function SetPassword(const APassword: string): IMail;
    function SetPort(const APort: Integer): IMail;
    function AddAttachment(const AFile: string): IMail;
    function SetAuth(const AValue: Boolean): IMail;
    function SetSSL(const AValue: Boolean): IMail;
    function Clear: IMail;
    function SendMail: Boolean;
    function SetUpEmail: Boolean;
  end;

implementation

end.
