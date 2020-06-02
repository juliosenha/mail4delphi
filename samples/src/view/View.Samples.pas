unit View.Samples;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Mail4Delphi.Intf, Mail4Delphi;

type
  TFrmSamples = class(TForm)
    Panel2: TPanel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    cbCriptocrafia: TComboBox;
    edtUser: TEdit;
    edtPassword: TEdit;
    edtHost: TEdit;
    edtPort: TEdit;
    edtFrom: TEdit;
    cbAuth: TComboBox;
    edtNameFrom: TEdit;
    chkReceiptRecipient: TCheckBox;
    pnlHeaderEmailConfiguration: TPanel;
    Panel3: TPanel;
    Label2: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edtTo: TEdit;
    mmMessage: TMemo;
    edtNameTo: TEdit;
    edtSubject: TEdit;
    Panel1: TPanel;
    edtCc: TEdit;
    edtNameCc: TEdit;
    edtCco: TEdit;
    edtNameCco: TEdit;
    lbAttachment: TListBox;
    btnSend: TButton;
    btnAttachment: TButton;
    procedure btnAttachmentClick(Sender: TObject);
    procedure btnSendClick(Sender: TObject);
    procedure lbAttachmentKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  end;

implementation

{$R *.dfm}

procedure TFrmSamples.btnAttachmentClick(Sender: TObject);
var
  LOpenDialog: TFileOpenDialog;
begin
  LOpenDialog := TFileOpenDialog.Create(Self);
  try
    LOpenDialog.Options := [fdoAllowMultiSelect];
    LOpenDialog.DefaultFolder := ExtractFilePath(Application.ExeName);
    if LOpenDialog.Execute then
      lbAttachment.Items.AddStrings(LOpenDialog.Files);
  finally
    LOpenDialog.Free;
  end;
end;

procedure TFrmSamples.btnSendClick(Sender: TObject);
var
  LMail: IMail;
  I: Integer;
begin
  LMail := TMail.New
    .AddFrom(edtFrom.Text, edtNameFrom.Text)
    .SSL(cbCriptocrafia.ItemIndex = 0)
    .Host(edtHost.Text)
    .Port(StrToInt(edtPort.Text))
    .Auth(cbAuth.ItemIndex = 1)
    .UserName(edtUser.Text)
    .Password(edtPassword.Text)
    .ReceiptRecipient(chkReceiptRecipient.Checked)
    .AddCC(edtCc.Text, edtNameCc.Text)
    .AddBCC(edtCco.Text, edtNameCco.Text)
    .AddTo(edtTo.Text, edtNameTo.Text)
    .AddSubject(edtSubject.Text)
    .AddBody(mmMessage.Text);
  if lbAttachment.Items.Count > 0 then
    for I := 0 to Pred(lbAttachment.Items.Count) do
      LMail.AddAttachment(lbAttachment.Items[I]);
  if LMail.SendMail then
    ShowMessage('Email successfully sent');
end;

procedure TFrmSamples.lbAttachmentKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  I: Integer;
begin
  if Key = VK_DELETE then
  begin
    for I := Pred(lbAttachment.Items.Count) downto 0 do
      if lbAttachment.Selected[I] then
        lbAttachment.Items.Delete(I);
  end;
end;

end.
