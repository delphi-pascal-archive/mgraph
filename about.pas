unit about;

interface

uses
  {$IFDEF MSWINDOWS} Windows, {$ENDIF} SysUtils, Types, Classes, QGraphics, QControls, QForms, QDialogs, QExtCtrls, QButtons, QStdCtrls;

type
  TAboutbox = class(TForm)
    AboutPanel: TPanel;
    ProgramIcon: TImage;
    ProductName: TLabel;
    Version: TLabel;
    Copyright: TLabel;
    Comments: TLabel;
    OKButton: TButton;
    Label1: TLabel;
    procedure OKButtonClick(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Aboutbox: TAboutbox;

implementation

{$R *.xfm}

procedure TAboutbox.OKButtonClick(Sender: TObject);
begin
  Self.Release;
end;

procedure TAboutbox.FormDeactivate(Sender: TObject);
begin
  {$IFDEF MSWINDOWS} MessageBeep(MB_ICONEXCLAMATION); {$ENDIF}
  Self.SetFocus;
end;

end.
