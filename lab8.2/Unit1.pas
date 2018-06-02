unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, math;

type
  TForm1 = class(TForm)
    btn1: TButton;
    label1: TLabel;
    btn2: TButton;
    btn3: TButton;
    tv1: TTreeView;
    lbl1: TLabel;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  N = 10;

type
  TPNode = ^PNode;

  PNode = record
    Info: integer;
    Pleft, Pright: TPNode;
  end;

var
  Form1: TForm1;
  num: Integer;
  tree: TPNode;
  kek: TTreeNode;

implementation

{$R *.dfm}

procedure AddToTree(var phead: TPNode; x: integer);
var
  flag: boolean;
begin
  flag := True;
  if phead = nil then
  begin
    new(phead);
    phead^.Info := x;
    phead^.Pleft := nil;
    phead^.Pright := nil;
    flag := False;
  end;
  if flag = True then
  begin
    if x < phead^.Info then
      AddToTree(phead^.Pleft, x)
    else
      AddToTree(phead^.Pright, x);
  end;
end;

procedure writeTree(phead: TPnode);
begin
  if phead <> nil then
  begin
    writetree(phead^.Pleft);
    write(phead^.Info: 4);
    writetree(phead^.Pright);
  end;
end;

function height12(phead: TPnode): integer;
var
  l, r: integer;
begin
  if phead <> nil then
  begin
    l := height12(phead^.Pleft);
    r := height12(phead^.Pright);
    if l > r then
      height12 := l + 1
    else
      height12 := r + 1
  end
  else
    height12 := 0;
end;

function getpath(phead: TPNode): string;
begin
  if phead <> nil then
  begin
    if height12(phead^.Pleft) > height12(phead^.Pright) then
      getpath := IntToStr(phead^.info) + ' ' + getpath(phead^.Pleft)
    else
      getpath := IntToStr(phead^.info) + ' ' + getpath(phead^.Pright)
  end
  else
    getpath := '';
end;

procedure TreeFree(var aPNode: TPNode);
begin
  if aPNode = nil then
    Exit;
  TreeFree(aPNode^.PLeft); {Рекурсивный вызов для освобождения памяти в левой ветви.}
  TreeFree(aPNode^.PRight); {Рекурсивный вызов для освобождения памяти в правой ветви.}
  Dispose(aPNode); {Освобождение памяти, занятой для текущего узла.}
  aPNode := nil; {Обнуление указателя на текущий узел.}
end;

procedure PrintTree(treenode: TTreeNode; root: TPNode);
var
  newnode: TTreeNode;
begin
  if Assigned(root) then
    with Form1 do
    begin
      newnode := tv1.Items.AddChild(treenode, inttostr(root^.info));
      PrintTree(newnode, root^.PLeft);
      PrintTree(newnode, root^.PRight);
    end;
end;

function TreeDepth(tree: TPNode): byte;
begin
  if tree = nil then
    TreeDepth := 0
  else
    TreeDepth := 1 + max(TreeDepth(tree^.Pleft), TreeDepth(tree^.pright));
end;

procedure DrawTree(Tree: TPNOde; Rect: TRect; Canvas: TCanvas);
const
  Radius = 20;
var
  M, H, D: Word;
var
  R: TRect;
begin
  if Tree <> nil then
  begin
    M := (Rect.Left + Rect.Right) div 2;
    H := Rect.Top;
    D := Abs(Rect.Bottom - Rect.Top) div TreeDepth(Tree);
    with Canvas do
    begin
      Pen.Color := $000000;
      Pen.Width := 2;
      Brush.Color := clWhite;
      LineTo(M, H);
      Ellipse(M - Radius, H - Radius, M + Radius, H + Radius);
      TextOut(M - (Radius div 2) + 2, H - (Radius div 2) + 2, IntToStr(Tree.info));
    end;
    Canvas.MoveTo(M, H + radius);
    if Tree^.Pleft <> nil then
    begin
      R.Left := Rect.Left;
      R.Right := M;
      R.Top := H + D;
      R.Bottom := Rect.Bottom;
      DrawTree(Tree^.Pleft, R, Canvas);
    end;
    Canvas.MoveTo(M, H + radius);
    if Tree^.Pright <> nil then
    begin
      R.Left := M;
      R.Right := Rect.Right;
      R.Top := H + D;
      R.Bottom := Rect.Bottom;
      DrawTree(Tree^.Pright, R, Canvas);
    end;
  end;
end;

procedure TForm1.btn1Click(Sender: TObject);
var
  k: Integer;
  lel: TComponent;
  rectangle: TRect;
begin
  k := height12(tree);
  label1.Caption := IntToStr(k);

  rectangle := Rect(20, 20, 657, 529);
  Form1.Canvas.MoveTo(((rectangle.Left + rectangle.Right) div 2), rectangle.Top);
  DrawTree(tree, rectangle, Canvas);
end;

procedure TForm1.btn2Click(Sender: TObject);
var
  fileofnode: Textfile;
  x: Integer;
begin
  AssignFile(fileofnode, 'Node.txt');
  reset(fileofnode);
  while not eof(fileofnode) do
  begin
    readln(fileofnode, x);
    AddToTree(tree, x);
  end;
end;

procedure TForm1.btn3Click(Sender: TObject);
var
  aowner: TComponent;
  rectangl: TRect;
begin
  treefree(tree);
  rectangl := Rect(0, 0, 657, 529);
  Canvas.fillrect(rectangl);
end;

end.

