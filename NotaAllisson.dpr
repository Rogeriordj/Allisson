program NotaAllisson;

uses
  Vcl.Forms,
  NotaAlisson in 'NotaAlisson.pas' {frmNotas},
  dmConexao in 'dmConexao.pas' {dtmConexao: TDataModule},
  uLkJSON in 'uLkJSON.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmNotas, frmNotas);
  Application.CreateForm(TdtmConexao, dtmConexao);
  Application.Run;
end.
