program MGraph;

uses
  QForms,
  main in 'main.pas' {MainForm},
  about in 'about.pas' {AboutBox};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'MGraph';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
