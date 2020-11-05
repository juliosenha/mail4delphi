unit View.Samples;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls, Mail4Delphi, LCLType;

type

  TFrmSamples = class(TForm)
    btnAttachment: TButton;
    btnSend: TButton;
    cbAuth: TComboBox;
    cbCriptocrafia: TComboBox;
    chkReceiptRecipient: TCheckBox;
    edtCc: TEdit;
    edtCco: TEdit;
    edtFrom: TEdit;
    edtHost: TEdit;
    edtNameCc: TEdit;
    edtNameCco: TEdit;
    edtNameFrom: TEdit;
    edtNameTo: TEdit;
    edtPassword: TEdit;
    edtPort: TEdit;
    edtSubject: TEdit;
    edtTo: TEdit;
    edtUser: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lbAttachment: TListBox;
    mmMessage: TMemo;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    pnlHeaderEmailConfiguration: TPanel;
    procedure btnAttachmentClick(Sender: TObject);
    procedure btnSendClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lbAttachmentKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  end;

var
  FrmSamples: TFrmSamples;

implementation

{$R *.lfm}


procedure TFrmSamples.FormCreate(Sender: TObject);
begin

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

procedure TFrmSamples.btnAttachmentClick(Sender: TObject);
var
  LOpenDialog: TOpenDialog ;
begin
  LOpenDialog := TOpenDialog .Create(Self);
  try
    LOpenDialog.Options := [ofAllowMultiSelect];
    LOpenDialog.InitialDir := ExtractFilePath(Application.ExeName);
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

end.

