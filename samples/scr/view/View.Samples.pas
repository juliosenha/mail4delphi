unit View.Samples;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Mail4Delphi.Intf, Mail4Delphi.Default;

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
    edtUserName: TEdit;
    edtPassword: TEdit;
    edtHost: TEdit;
    edtPort: TEdit;
    edtFrom: TEdit;
    cbAuth: TComboBox;
    edtNameFrom: TEdit;
    chkReceiptRecipient: TCheckBox;
    pnlHeaderConfiguracaoEmail: TPanel;
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
    mmBody: TMemo;
    edtNameTo: TEdit;
    edtSubject: TEdit;
    Panel1: TPanel;
    edtCc: TEdit;
    edtNomeCc: TEdit;
    edtCco: TEdit;
    edtNomeCco: TEdit;
    lbAnexo: TListBox;
    btnEnviar: TButton;
    btnAnexar: TButton;
    procedure btnAnexarClick(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
    procedure lbAnexoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  end;

implementation

{$R *.dfm}


procedure TFrmSamples.btnAnexarClick(Sender: TObject);
var
  LOpenDialog: TFileOpenDialog;
begin
  LOpenDialog := TFileOpenDialog.Create(Self);
  try
    LOpenDialog.Options := [fdoAllowMultiSelect];
    LOpenDialog.DefaultFolder := ExtractFilePath(Application.ExeName);
    if LOpenDialog.Execute then
      lbAnexo.Items.AddStrings(LOpenDialog.Files);
  finally
    LOpenDialog.Free;
  end;
end;

procedure TFrmSamples.btnEnviarClick(Sender: TObject);
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
    .UserName(edtUserName.Text)
    .Password(edtPassword.Text)
    .ReceiptRecipient(chkReceiptRecipient.Checked)
    .AddCC(edtCc.Text, edtNomeCc.Text)
    .AddBCC(edtCco.Text, edtNomeCco.Text)
    .AddTo(edtTo.Text, edtNameTo.Text)
    .AddSubject(edtSubject.Text)
    .AddBody(mmBody.Text);
  if lbAnexo.Items.Count > 0 then
    for I := 0 to Pred(lbAnexo.Items.Count) do
      LMail.AddAttachment(lbAnexo.Items[I]);
  if LMail.SendMail then
    ShowMessage('Email enviado com sucesso!');
end;

procedure TFrmSamples.lbAnexoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  I: Integer;
begin
  if Key = VK_DELETE then
  begin
    for I := Pred(lbAnexo.Items.Count) downto 0 do
      if lbAnexo.Selected[I] then
        lbAnexo.Items.Delete(I);
  end;
end;

end.
