program Samples;

uses
  Vcl.Forms,
  View.Samples in 'src\view\View.Samples.pas' {FrmSamples},
  Mail4Delphi.Intf in '..\..\src\Mail4Delphi.Intf.pas',
  Mail4Delphi in '..\..\src\Mail4Delphi.pas';

{$R *.res}

var
  FrmSamples: TFrmSamples;

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmSamples, FrmSamples);
  Application.Run;
end.
