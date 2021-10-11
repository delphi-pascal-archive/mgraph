unit main;

interface

uses
  SysUtils, Types, Classes, QGraphics, QControls, QForms, QDialogs,
  QStdCtrls, QMenus, QActnList, QTypes, QComCtrls, QExtCtrls, QImgList,
  QStdActns, QButtons;

type

  TGraphicParam = record
    Func: ShortString; {собственно функция}
    FileName: ShortString; Saved: boolean; {имя файла на диске и признак того что уже раз сохранили}
    Xmin, Xmax, Ymin, Ymax: Extended; {отображаемые величины}
    DivX, DivY: Extended; {масштаб по осям}
    PaintX, PaintY: Integer; {Размер графика: PaintX = Abs(Xmax-Xmin)*DivX; PaintY = Abs(Ymax-Ymin)*DivY}
    Xstr, Ystr: ShortString; Font, FontDivision: TFont; {надписи на осях координат}
    Xborder, Yborder: Integer; {величина бордюра}
    DivXstr, DivYstr: Integer; {в процентах насадка цифр на координатные оси}
  end;

  TMainForm = class(TForm)
    ImageList: TImageList;
    StatusBar: TStatusBar;
    ToolBar: TToolBar;
    MainMenu: TMainMenu;
    ActionList: TActionList;
    FileItem: TMenuItem;
    New1: TMenuItem;
    Open1: TMenuItem;
    Save1: TMenuItem;
    SaveAs1: TMenuItem;
    N2: TMenuItem;
    Print1: TMenuItem;
    PrintSetup1: TMenuItem;
    N3: TMenuItem;
    Exit1: TMenuItem;
    EditItem: TMenuItem;
    Undo1: TMenuItem;
    N4: TMenuItem;
    Cut1: TMenuItem;
    Copy1: TMenuItem;
    Paste1: TMenuItem;
    N5: TMenuItem;
    HelpItem: TMenuItem;
    Contents1: TMenuItem;
    SearchforHelpOn1: TMenuItem;
    About1: TMenuItem;
    actionEditCut: TEditCut;
    actionEditCopy: TEditCopy;
    actionEditPaste: TEditPaste;
    actionEditSelectAll: TEditSelectAll;
    actionEditDelete: TEditDelete;
    actionFileNew: TAction;
    actionFileOpen: TAction;
    actionFileSave: TAction;
    actionFileSaveAs: TAction;
    actionFileClose: TAction;
    actionFilePrint: TAction;
    actionFilePrintSetup: TAction;
    actionFileExit: TAction;
    Delete1: TMenuItem;
    SelectAll1: TMenuItem;
    actionEditUndo: TAction;
    actionHelpAbout: TAction;
    N6: TMenuItem;
    actionEditOptions: TAction;
    actionEditOptions1: TMenuItem;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton10: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    pnlWorkSpace: TPanel;
    grboxImg: TGroupBox;
    editExpresion: TEdit;
    ToolButton11: TToolButton;
    pnlProperties: TPanel;
    PageControlProperies: TPageControl;
    tsProperties: TTabSheet;
    tsHelp: TTabSheet;
    lblExpresion: TLabel;
    ToolButton14: TToolButton;
    actionEditPaint: TAction;
    PaintGraphics1: TMenuItem;
    ScrollBox: TScrollBox;
    imgGraphic: TImage;
    tbHelp: TTextBrowser;
    ToolBarHelp: TToolBar;
    ToolButton9: TToolButton;
    ToolButton15: TToolButton;
    ToolButton17: TToolButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    editXstart: TEdit;
    editXend: TEdit;
    editYtop: TEdit;
    editYbottom: TEdit;
    Label7: TLabel;
    editXstr: TEdit;
    Label8: TLabel;
    editYstr: TEdit;
    sbShowGrid: TCheckBox;
    FontDialog: TFontDialog;
    bbtnFont: TBitBtn;
    Label9: TLabel;
    Label10: TLabel;
    seditborderX: TSpinEdit;
    seditborderY: TSpinEdit;
    Label11: TLabel;
    Label12: TLabel;
    editDivX: TEdit;
    editDivY: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    lblXsize: TLabel;
    lblYsize: TLabel;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    actionHelpFunctions: TAction;
    Functions1: TMenuItem;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    actionHelpContents: TAction;
    actionHelpTopicSearch: TAction;
    GroupBox4: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    tbarDivX: TTrackBar;
    tbarDivY: TTrackBar;
    lblDivX: TLabel;
    lblDivY: TLabel;
    FontDialogDivision: TFontDialog;
    BitBtn1: TBitBtn;
    Image1: TImage;
    procedure actionHelpAboutExecute(Sender: TObject);
    procedure ToolBarResize(Sender: TObject);
    procedure actionEditPaintUpdate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actionFileExitExecute(Sender: TObject);
    procedure actionEditPaintExecute(Sender: TObject);
    procedure actionEditOptionsExecute(Sender: TObject);
    procedure actionEditOptionsUpdate(Sender: TObject);
    procedure PageControlProperiesChange(Sender: TObject);
    procedure editXstartExit(Sender: TObject);
    procedure bbtnFontClick(Sender: TObject);
    procedure editDivXExit(Sender: TObject);
    procedure actionFileNewExecute(Sender: TObject);
    procedure actionFileOpenExecute(Sender: TObject);
    procedure actionFileSaveExecute(Sender: TObject);
    procedure actionFileSaveAsExecute(Sender: TObject);
    procedure actionHelpContentsExecute(Sender: TObject);
    procedure actionHelpFunctionsExecute(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure tbarDivYChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    FGraphicParam: TGraphicParam;
    procedure SetGraphicParam(const Value: TGraphicParam); {закрывается рабочий десктоп}
    procedure PaintGraphics(Func:string); {рисуем график функции на imgGraphic}
    function AdjustGraphicOptions: boolean; {с панели Options устанавливаем параметры графика}
    procedure AdjustGraphicDimension; {вычисляет значения PaintX и PaintY}
    procedure NewWorkSpace;
    procedure OpenFile(FileName: TFileName);
    procedure SaveFile(FileName: TFileName);
  public
    property GraphicParam: TGraphicParam read FGraphicParam write SetGraphicParam;
    procedure DisplayHint(Sender: TObject);
  end;

var
  MainForm: TMainForm;

implementation

uses about, MathematicsFunc;

{$R *.xfm}

resourcestring
  ermsg_Caption = 'Error';
  wgmsg_Caption = 'Warning';
  ermsg_InvalidFloatValue = '''%s'' is not a valid floating point value';
  ermsg_InvalidFileName = 'File %s not found';
  ermsg_HelpFileNotFound = 'File %s not found for displaing help';
  wgmsg_InvalidOptions = 'Invalid options. Please check it.';

const
  GraphicParamDefault: TGraphicParam = ( Func:'5*Sin(x*2)/(2*x)'; Saved:false;
    Xmin:-9.8696;Xmax:9.8694;Ymin:-3.1416;Ymax:6.2832; {отображаемые величины}
    DivX:22;DivY:40; {масштаб по осям}
    Xstr:'x';Ystr:'f(x)'; {надписи на осях координат}
    Xborder:12;Yborder:12;
    DivXstr:50;DivYstr:80);
    FormCaption='MGraph - %s';

var
  HelpFileContents, HelpFileFunctions: TFileName;

type
  TFileGraphic = file of TGraphicParam;

procedure TMainForm.actionHelpAboutExecute(Sender: TObject);
begin
  Application.CreateForm(TAboutBox, AboutBox);
  AboutBox.ShowModal;
end;

procedure TMainForm.ToolBarResize(Sender: TObject);
begin
  if Self.editExpresion.Width = 1
    then Self.editExpresion.Width := Self.ToolBar.Width - Self.editExpresion.Left - (Self.ToolBar.Width - Self.editExpresion.Left) div 5
    else begin Self.editExpresion.Width := 1; Self.ToolBar.OnResize(Sender); end;
end;

procedure TMainForm.actionEditPaintUpdate(Sender: TObject);
begin
  if Sender is TAction then (Sender as TAction).Enabled := Length(Self.editExpresion.Text)>0
end;

procedure TMainForm.DisplayHint(Sender: TObject);
begin
  Self.StatusBar.Panels[1].Text := Application.Hint;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Self.OpenDialog.InitialDir := ExtractFilePath(Application.ExeName);

  {$IFDEF MSWINDOWS} HelpFileContents := Self.OpenDialog.InitialDir+'help\contents.html';
  {$ELSE} HelpFileContents := Self.OpenDialog.InitialDir+'Help/contents.html'; {$ENDIF}

  {$IFDEF MSWINDOWS} HelpFileFunctions := Self.OpenDialog.InitialDir+'help\functions.html';
  {$ELSE} HelpFileFunctions := Self.OpenDialog.InitialDir+'Help/functions.html'; {$ENDIF}

  Self.imgGraphic.Canvas.Font := Self.lblExpresion.Font;
  Self.lblExpresion.Width := Self.imgGraphic.Canvas.TextWidth(Self.lblExpresion.Caption);
  Self.lblExpresion.Height := Self.ToolBar.ButtonHeight;

  Self.actionFileNew.Execute;
  Application.OnHint := Self.DisplayHint;
  Self.tbHelp.FileName := HelpFileContents;
  Self.PageControlProperies.ActivePage := Self.tsProperties;

  {viravnivaem leibli}
  Self.Label3.Left := Self.editXstart.Left-2-Self.Label3.Width;
  Self.Label4.Left := Self.editXend.Left-2-Self.Label4.Width;
  Self.Label9.Left := Self.seditborderX.Left-2-Self.Label9.Width;

  Self.Label2.Left := Self.editYtop.Left-2-Self.Label2.Width;
  Self.Label5.Left := Self.editYbottom.Left-2-Self.Label5.Width;
  Self.Label10.Left := Self.seditborderY.Left-2-Self.Label10.Width;

  Self.Label11.Left := Self.editDivX.Left-2-Self.Label11.Width;
  Self.Label12.Left := Self.editDivY.Left-2-Self.Label12.Width;

  Self.Label7.Left := Self.editXstr.Left-2-Self.Label7.Width;
  Self.Label8.Left := Self.editYstr.Left-2-Self.Label8.Width;

  Self.Label15.Left := Self.tbarDivX.Left-2-Self.Label15.Width;
  Self.Label16.Left := Self.tbarDivY.Left-2-Self.Label16.Width;   

end;

procedure TMainForm.actionFileExitExecute(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TMainForm.SetGraphicParam(const Value: TGraphicParam);
  function MakeItAString(I: Extended): string;{ Convert any integer type to a string }
    var S: string; begin Str(I:0:4, S); Result:= S; end;
begin
  FGraphicParam := Value; Self.FGraphicParam.Font := Self.FontDialog.Font; Self.FGraphicParam.FontDivision := Self.FontDialogDivision.Font;
  {на панели Properties отображаем}
  Self.AdjustGraphicDimension;
  Self.editXstart.Text := MakeItAString(Value.Xmin); Self.editXend.Text := MakeItAString(Value.Xmax);
  Self.editYtop.Text := MakeItAString(Value.Ymax); Self.editYbottom.Text := MakeItAString(Value.Ymin);
  Self.editXstr.Text := Value.Xstr; Self.editYstr.Text := Value.Ystr;
  Self.seditborderX.Value := Value.Xborder; Self.seditborderY.Value := Value.Yborder;
  Self.editDivX.Text := MakeItAString(Value.DivX); Self.editDivY.Text := MakeItAString(Value.DivY);
  Self.Caption := Format(FormCaption, [Value.FileName]);
  Self.editExpresion.Text := Value.Func;
  Self.tbarDivX.Position := Self.FGraphicParam.DivXstr;
  Self.tbarDivY.Position := Self.FGraphicParam.DivYstr;
end;

procedure TMainForm.actionEditPaintExecute(Sender: TObject);
begin
  if Self.AdjustGraphicOptions
    then Self.PaintGraphics(Self.editExpresion.Text)
    else begin Application.MessageBox(wgmsg_InvalidOptions, wgmsg_Caption, [smbOk], smsWarning); Self.actionEditOptions.Execute; end;
end;

procedure TMainForm.PaintGraphics(Func: string); {рисуем график функции на imgGraphic}
var Xaxis, Yaxis: integer; {положение осей на рисунке} i: integer; workfunc: TE; funcresult,j: Extended;
    Bitmap: TBitmap; strDiv: string; strDivPos: integer; XbeginDiv: Extended; flgPaint:boolean;
  {преобразователь в тип TPoint}
  function ToPoint(const x,y: integer): TPoint; begin Result.X := x; Result.Y := y; end;
begin
// устанавливаем начальные параметры
  Self.StatusBar.Panels[0].Text := 'Working...'; Self.StatusBar.Refresh; Bitmap := nil;
  try
    Bitmap := TBitmap.Create;
    Bitmap.Width := Self.FGraphicParam.PaintX+Self.FGraphicParam.Xborder*2;
    Bitmap.Height := Self.FGraphicParam.PaintY+Self.FGraphicParam.Yborder*2;
    Self.imgGraphic.Picture.Graphic := Bitmap;
    Self.imgGraphic.SetBounds(5,5,Bitmap.Width,Bitmap.Height);
  finally
    Bitmap.Free;
  end;

  {$IFDEF MSWINDOWS}
    Self.imgGraphic.Canvas.Brush.Color := clWhite;
    Self.imgGraphic.Canvas.Brush.Style := bsDense4;
  {$ELSE}
    Self.imgGraphic.Canvas.Brush.Style := bsSolid;
    Self.imgGraphic.Canvas.Brush.Color := clSilver;
  {$ENDIF}
  Self.imgGraphic.Canvas.Pen.Color := clBlack;
  Self.imgGraphic.Canvas.Pen.Style := psSolid;
  Self.imgGraphic.Canvas.FillRect(Self.imgGraphic.ClientRect);
  Self.imgGraphic.Canvas.Rectangle(Self.imgGraphic.ClientRect);

// вычисляем положение координатных осей
  Yaxis := -Round(Self.FGraphicParam.Xmin*Self.FGraphicParam.DivX)+Self.FGraphicParam.Xborder;
  if Yaxis<Self.FGraphicParam.Xborder then Yaxis := Self.FGraphicParam.Xborder else if Yaxis>Self.FGraphicParam.PaintX+Self.FGraphicParam.Xborder then Yaxis := Self.FGraphicParam.PaintX+Self.FGraphicParam.Xborder;
  Xaxis := Round(Self.FGraphicParam.Ymax*Self.FGraphicParam.DivY)+Self.FGraphicParam.Yborder;
  if Xaxis<Self.FGraphicParam.Yborder then Xaxis := Self.FGraphicParam.Yborder else if Xaxis>Self.FGraphicParam.PaintY+Self.FGraphicParam.Yborder then Xaxis := Self.FGraphicParam.PaintY+Self.FGraphicParam.Yborder;

// рисуем оси координат
  Self.imgGraphic.Canvas.Brush.Color := clBlack; Self.imgGraphic.Canvas.Brush.Style := bsDense4;
  {X}
  Self.imgGraphic.Canvas.MoveTo(Self.FGraphicParam.Xborder, Xaxis); Self.imgGraphic.Canvas.LineTo(Self.GraphicParam.PaintX+Self.FGraphicParam.Xborder, Xaxis);
  Self.imgGraphic.Canvas.Polygon([ToPoint(Self.GraphicParam.PaintX+Self.FGraphicParam.Xborder, Xaxis), ToPoint(Self.GraphicParam.PaintX+Self.FGraphicParam.Xborder-16, Xaxis-4), ToPoint(Self.GraphicParam.PaintX+Self.FGraphicParam.Xborder-15, Xaxis), ToPoint(Self.GraphicParam.PaintX+Self.FGraphicParam.Xborder-16, Xaxis+4)]);
  {Y}
  Self.imgGraphic.Canvas.MoveTo(Yaxis, Self.FGraphicParam.Yborder); Self.imgGraphic.Canvas.LineTo(Yaxis, Self.GraphicParam.PaintY+Self.FGraphicParam.Yborder);
//  Self.imgGraphic.Canvas.Polygon([ToPoint(Yaxis, Self.FGraphicParam.Yborder), ToPoint(Yaxis-Self.GraphicParam.Xborder div 3, 7*Self.FGraphicParam.Yborder div 3), ToPoint(Yaxis, 9*Self.FGraphicParam.Yborder div 4), ToPoint(Yaxis+Self.GraphicParam.Xborder div 3, 7*Self.FGraphicParam.Yborder div 3)]);
  Self.imgGraphic.Canvas.Polygon([ToPoint(Yaxis, Self.FGraphicParam.Yborder), ToPoint(Yaxis-4, Self.FGraphicParam.Yborder+16), ToPoint(Yaxis, Self.FGraphicParam.Yborder+15), ToPoint(Yaxis+4, Self.FGraphicParam.Yborder+16)]);

// надписи на осях
  Self.imgGraphic.Canvas.Font := Self.FGraphicParam.Font;
  i := Xaxis-6-Self.imgGraphic.Canvas.TextHeight(Self.FGraphicParam.Xstr); if i<Self.FGraphicParam.Yborder then i := Xaxis+6;
  Self.imgGraphic.Canvas.TextOut(Self.FGraphicParam.Xborder+Self.FGraphicParam.PaintX-Self.imgGraphic.Canvas.TextWidth(Self.FGraphicParam.Xstr),i,Self.FGraphicParam.Xstr);
  i := Yaxis+9; if i+Self.imgGraphic.Canvas.TextWidth(Self.FGraphicParam.Ystr)>Self.FGraphicParam.Xborder+Self.FGraphicParam.PaintX then i := Yaxis-9-Self.imgGraphic.Canvas.TextWidth(Self.FGraphicParam.Ystr);
  Self.imgGraphic.Canvas.TextOut(i,Self.FGraphicParam.Yborder,Self.FGraphicParam.Ystr);

// рисуем координатную сетку (задается параметрам DivXYstr)
  Self.imgGraphic.Canvas.Font := Self.FGraphicParam.FontDivision;
  {x}
  strDivPos := Self.FGraphicParam.Xborder; XbeginDiv := Self.FGraphicParam.Xmin;
  if Self.FGraphicParam.DivXstr>Self.tbarDivX.Min then repeat
    Self.imgGraphic.Canvas.MoveTo(strDivPos, Xaxis-1); Self.imgGraphic.Canvas.LineTo(strDivPos, Xaxis+1);
    Str(XbeginDiv:0:2, strDiv);
    if Xaxis+1+Self.imgGraphic.Canvas.TextHeight(strDiv)<Self.FGraphicParam.Yborder+Self.FGraphicParam.PaintY
      then Self.imgGraphic.Canvas.TextOut(strDivPos, Xaxis+1, strDiv)
      else Self.imgGraphic.Canvas.TextOut(strDivPos, Xaxis-1-Self.imgGraphic.Canvas.TextHeight(strDiv), strDiv);
    Inc(strDivPos, Round(Self.imgGraphic.Canvas.TextWidth(strDiv)+Self.imgGraphic.Canvas.TextWidth(strDiv)*(Self.tbarDivX.Position/(Self.tbarDivX.Max-Self.tbarDivX.Min))));
    XbeginDiv := Self.FGraphicParam.Xmin+(Self.FGraphicParam.Xmax-Self.FGraphicParam.Xmin)*(strDivPos-Self.FGraphicParam.Xborder)/Self.FGraphicParam.PaintX;
  until strDivPos>Self.FGraphicParam.PaintX-Self.FGraphicParam.Xborder;
  {y}
  strDivPos := Self.FGraphicParam.Yborder+Self.FGraphicParam.PaintY; XbeginDiv := Self.FGraphicParam.Ymin;
  if Self.FGraphicParam.DivYstr>Self.tbarDivY.Min then repeat
    Self.imgGraphic.Canvas.MoveTo(Yaxis-1, strDivPos); Self.imgGraphic.Canvas.LineTo(Yaxis+1, strDivPos);
    Str(XbeginDiv:0:2, strDiv);
    if Yaxis+4+Self.imgGraphic.Canvas.TextWidth(strDiv)<Self.FGraphicParam.PaintX+Self.FGraphicParam.Xborder
      then Self.imgGraphic.Canvas.TextOut(Yaxis+4, strDivPos-Self.imgGraphic.Canvas.TextHeight(strDiv) div 2, strDiv)
      else Self.imgGraphic.Canvas.TextOut(Yaxis-Self.imgGraphic.Canvas.TextWidth(strDiv)-4, strDivPos-Self.imgGraphic.Canvas.TextHeight(strDiv) div 2, strDiv);
    Dec(strDivPos, Round(Self.imgGraphic.Canvas.TextHeight(strDiv)+Self.imgGraphic.Canvas.TextHeight(strDiv)*(Self.tbarDivY.Position/(Self.tbarDivY.Max-Self.tbarDivY.Min))));
    XbeginDiv := Self.FGraphicParam.Ymax-(Self.FGraphicParam.Ymax-Self.FGraphicParam.Ymin)*(strDivPos-Self.FGraphicParam.Yborder)/Self.FGraphicParam.PaintY;
  until strDivPos<Self.FGraphicParam.Yborder*2+Self.imgGraphic.Canvas.TextHeight(strDiv);

// рисуем график функции
  Self.imgGraphic.Canvas.Pen.Color := clNavy; flgPaint:=false;
  if MathematicsFunc.Parse_Line(Func, workfunc) then begin {разлагаем функцию в дерево}
    for i:=Self.FGraphicParam.Xborder to Self.FGraphicParam.Xborder+Self.FGraphicParam.PaintX do begin {цикл по всевозможным точкам на рисунке и строим график}
      j := Self.FGraphicParam.Xmin+(Self.FGraphicParam.Xmax-Self.FGraphicParam.Xmin)*((i-Self.FGraphicParam.Xborder)/Self.FGraphicParam.PaintX);
      if not MathematicsFunc.Count_Func(true, workfunc, j, 0, funcresult) then begin Self.imgGraphic.Canvas.MoveTo(i, Xaxis); flgPaint:=false; Continue; end;
      funcresult := -funcresult*Self.FGraphicParam.DivY+Self.FGraphicParam.Ymax*Self.FGraphicParam.DivY+Self.FGraphicParam.Yborder;
      if i=Self.FGraphicParam.Xborder
        then Self.imgGraphic.Canvas.MoveTo(i, Round(funcresult))
        else if (Round(funcresult)<Self.FGraphicParam.Yborder) then Self.imgGraphic.Canvas.MoveTo(i, Self.FGraphicParam.Yborder)
          else if (Round(funcresult)>Self.FGraphicParam.Yborder+Self.FGraphicParam.PaintY) then Self.imgGraphic.Canvas.MoveTo(i, Self.FGraphicParam.Yborder+Self.FGraphicParam.PaintY)
            else if flgPaint then Self.imgGraphic.Canvas.LineTo(i, Round(funcresult)) else Self.imgGraphic.Canvas.MoveTo(i, Round(funcresult));
      flgPaint:=true;
    end;
    MathematicsFunc.Delete_Tree(workfunc); {освобождаем дерево функции}
  end;

// заканчиваем работу
  Self.StatusBar.Panels[0].Text := 'Active';
end;

procedure TMainForm.actionEditOptionsExecute(Sender: TObject);
begin
  Self.PageControlProperies.ActivePage := Self.tsProperties;
end;

procedure TMainForm.actionEditOptionsUpdate(Sender: TObject);
begin
  if Sender is TAction then
    (Sender as TAction).Enabled := Self.PageControlProperies.ActivePage <> Self.tsProperties;
end;

procedure TMainForm.PageControlProperiesChange(Sender: TObject);
begin
  Self.PageControlProperies.ActivePage.SetFocus;
end;

procedure TMainForm.editXstartExit(Sender: TObject);
var r: Extended;
begin
  if Sender is TEdit then
    if not MathematicsFunc.Count_Const((Sender as TEdit).Text, r) then begin
      Application.MessageBox(Format(ermsg_InvalidFloatValue, [(Sender as TEdit).Text]), ermsg_Caption, [smbOk], smsCritical);
      (Sender as TEdit).SetFocus;
    end;
end;

function TMainForm.AdjustGraphicOptions: boolean;
begin {с панели Options устанавливаем параметры графика}
  Result := false;
  Self.FGraphicParam.Xstr := Self.editXstr.Text; Self.FGraphicParam.Ystr := Self.editYstr.Text;
  Self.FGraphicParam.Func := Self.editExpresion.Text;
  {Axis}
  if not MathematicsFunc.Count_Const(Self.editXstart.Text, Self.FGraphicParam.Xmin) then Exit;
  if not MathematicsFunc.Count_Const(Self.editXend.Text, Self.FGraphicParam.Xmax) then Exit;
  if not MathematicsFunc.Count_Const(Self.editYbottom.Text, Self.FGraphicParam.Ymin) then Exit;
  if not MathematicsFunc.Count_Const(Self.editYtop.Text, Self.FGraphicParam.Ymax) then Exit;
  {div}
  if not MathematicsFunc.Count_Const(Self.editDivX.Text, Self.FGraphicParam.DivX) then Exit;
  if not MathematicsFunc.Count_Const(Self.editDivY.Text, Self.FGraphicParam.DivY) then Exit;

  Self.FGraphicParam.Xborder := Self.seditborderX.Value; Self.FGraphicParam.Yborder := Self.seditborderY.Value;
  Self.FGraphicParam.Font := Self.FontDialog.Font;
  Self.AdjustGraphicDimension; Result := true;
end;

procedure TMainForm.AdjustGraphicDimension;
begin
  FGraphicParam.PaintX := Round((FGraphicParam.Xmax-FGraphicParam.Xmin)*FGraphicParam.DivX);
  FGraphicParam.PaintY := Round((FGraphicParam.Ymax-FGraphicParam.Ymin)*FGraphicParam.DivY);
  Self.lblXsize.Caption := IntToStr(Self.FGraphicParam.PaintX+2*FGraphicParam.Xborder);
  Self.lblYsize.Caption := IntToStr(Self.FGraphicParam.PaintY+2*FGraphicParam.Yborder);
  Self.lblDivX.Caption := Format('%d %%', [Self.FGraphicParam.DivXstr]);
  Self.lblDivY.Caption := Format('%d %%', [Self.FGraphicParam.DivYstr]);
end;

procedure TMainForm.bbtnFontClick(Sender: TObject);
var i: integer;
begin
  if Self.FontDialog.Execute then begin {устанавливаем шрифт}
    Self.FGraphicParam.Font := Self.FontDialog.Font;
    i := Self.editXstr.Font.Size; Self.editXstr.Font := Self.FontDialog.Font; Self.editXstr.Font.Size := i;
    i := Self.editYstr.Font.Size; Self.editYstr.Font := Self.FontDialog.Font; Self.editYstr.Font.Size := i;
  end;
end;

procedure TMainForm.editDivXExit(Sender: TObject);
begin
  Self.editXstartExit(Sender);
  if not MathematicsFunc.Count_Const(Self.editDivX.Text, Self.FGraphicParam.DivX) then Exit;
  if not MathematicsFunc.Count_Const(Self.editDivY.Text, Self.FGraphicParam.DivY) then Exit;
  Self.AdjustGraphicDimension;
end;

procedure TMainForm.NewWorkSpace;
begin
  Self.imgGraphic.Canvas.Font := Self.FontDialog.Font;
  Self.GraphicParam := GraphicParamDefault;
  Self.FGraphicParam.FileName := Self.OpenDialog.InitialDir+'NoName.'+Self.OpenDialog.DefaultExt;
  Self.Caption := Format(FormCaption, [Self.FGraphicParam.FileName]);
  Self.imgGraphic.Picture.Graphic := nil;
  Self.editExpresion.SelLength := 0;
end;

procedure TMainForm.actionFileNewExecute(Sender: TObject);
begin
  Self.NewWorkSpace;
end;

procedure TMainForm.actionFileOpenExecute(Sender: TObject);
begin
  if Self.OpenDialog.Execute then Self.OpenFile(Self.OpenDialog.FileName);
end;

procedure TMainForm.OpenFile(FileName: TFileName);
var DiskFile: TFileGraphic; GraphicParams: TGraphicParam;
begin
  if FileExists(FileName) then begin
    AssignFile(DiskFile, FileName);
    try
      Reset(DiskFile); Read(DiskFile, GraphicParams);
      GraphicParams.Font := Self.FontDialog.Font; GraphicParams.Saved := true;
      Self.FGraphicParam.FileName := FileName;
      Self.GraphicParam := GraphicParams;
    finally
      CloseFile(DiskFile);
    end;
  end else Application.MessageBox(ermsg_InvalidFileName, ermsg_Caption, [smbOk], smsCritical);
end;

procedure TMainForm.SaveFile(FileName: TFileName);
var DiskFile: TFileGraphic;
begin
  AssignFile(DiskFile, FileName);
  try
    Self.FGraphicParam.FileName := FileName; Self.Caption := Format(FormCaption, [Self.FGraphicParam.FileName]);
    Rewrite(DiskFile); Write(DiskFile, Self.GraphicParam);
    Self.FGraphicParam.Saved := true;
  finally
    CloseFile(DiskFile);
  end;
end;

procedure TMainForm.actionFileSaveExecute(Sender: TObject);
begin
  if Self.GraphicParam.Saved
    then Self.SaveFile(Self.GraphicParam.FileName)
    else Self.actionFileSaveAs.Execute;
end;


procedure TMainForm.actionFileSaveAsExecute(Sender: TObject);
begin
  if Self.SaveDialog.Execute then
    begin
      Self.FGraphicParam.FileName := Self.SaveDialog.FileName;
      Self.SaveFile(Self.GraphicParam.FileName);
    end;
end;

procedure TMainForm.actionHelpContentsExecute(Sender: TObject);
begin
  if FileExists(HelpFileContents) then begin
    Self.tsHelp.Show; Self.tbHelp.LoadFromFile(HelpFileContents);
  end else Application.MessageBox(Format(ermsg_HelpFileNotFound, [HelpFileContents]), ermsg_Caption, [smbOk], smsCritical);
end;

procedure TMainForm.actionHelpFunctionsExecute(Sender: TObject);
begin
  if FileExists(HelpFileFunctions) then begin
    Self.tsHelp.Show; Self.tbHelp.LoadFromFile(HelpFileFunctions);
  end else Application.MessageBox(Format(ermsg_HelpFileNotFound, [HelpFileFunctions]), ermsg_Caption, [smbOk], smsCritical);
end;

procedure TMainForm.SpeedButton1Click(Sender: TObject);
begin
  Self.tbHelp.Backward;
end;

procedure TMainForm.SpeedButton2Click(Sender: TObject);
begin
  Self.tbHelp.Forward;
end;

procedure TMainForm.tbarDivYChange(Sender: TObject);
begin
  if Sender is TTrackBar then begin
    if (Sender as TTrackBar)=Self.tbarDivX
      then Self.FGraphicParam.DivXstr := Self.tbarDivX.Position
      else Self.FGraphicParam.DivYstr := Self.tbarDivY.Position;
    Self.AdjustGraphicDimension;
  end;
end;

procedure TMainForm.BitBtn1Click(Sender: TObject);
begin
  if Self.FontDialogDivision.Execute then {устанавливаем шрифт}
    Self.FGraphicParam.FontDivision := Self.FontDialogDivision.Font;
end;

end.
