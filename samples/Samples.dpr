program Samples;

uses
  Vcl.Forms,
  View.Samples in 'scr\view\View.Samples.pas' {FrmSamples};

{$R *.res}

var
  FrmSamples: TFrmSamples;

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmSamples, FrmSamples);
  Application.Run;
end.
