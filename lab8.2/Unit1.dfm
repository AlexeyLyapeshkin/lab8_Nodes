object Form1: TForm1
  Left = 192
  Top = 129
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Form1'
  ClientHeight = 524
  ClientWidth = 900
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object label1: TLabel
    Left = 776
    Top = 8
    Width = 89
    Height = 33
    Caption = #1042#1099#1089#1086#1090#1072' '#1076#1077#1088#1077#1074#1072
  end
  object lbl1: TLabel
    Left = 672
    Top = 8
    Width = 84
    Height = 13
    Caption = #1042#1099#1089#1086#1090#1072' '#1076#1077#1088#1077#1074#1072' :'
  end
  object btn1: TButton
    Left = 664
    Top = 56
    Width = 217
    Height = 49
    Caption = #1057#1086#1079#1076#1072#1090#1100' '#1076#1077#1088#1077#1074#1086
    TabOrder = 0
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 664
    Top = 112
    Width = 217
    Height = 41
    Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1080#1079' '#1092#1072#1081#1083#1072
    TabOrder = 1
    OnClick = btn2Click
  end
  object btn3: TButton
    Left = 664
    Top = 160
    Width = 217
    Height = 49
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1076#1077#1088#1077#1074#1086
    TabOrder = 2
    OnClick = btn3Click
  end
  object tv1: TTreeView
    Left = 0
    Top = 0
    Width = 657
    Height = 529
    Indent = 19
    ReadOnly = True
    ShowButtons = False
    ShowLines = False
    ShowRoot = False
    SortType = stData
    TabOrder = 3
    Visible = False
  end
end
