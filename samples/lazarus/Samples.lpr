program Samples;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces,
  Forms, indylaz,
  View.Samples in 'src\view\View.Samples.pas' {FrmSamples},
  Mail4Delphi.Intf in '..\..\src\Mail4Delphi.Intf.pas',
  Mail4Delphi in '..\..\src\Mail4Delphi.pas';

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TFrmSamples, FrmSamples);
  Application.Run;
end.

