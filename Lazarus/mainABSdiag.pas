unit mainABSdiag;

{$mode delphi}{$H+}
{$modeswitch unicodestrings}
{$WARN SYMBOL_PLATFORM OFF}
{$WARN 5024 OFF}   // unused parameter (LCL часто ругается)

interface

uses
  {$IFDEF MSWINDOWS}
  Windows, Messages, ShellAPI, MMSystem, ComObj, ActiveX,
  {$ELSE}
  LCLIntf, LCLType, LMessages,
  {$ENDIF}
  SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Variants,
  ImgList, ComCtrls, ToolWin, Menus, Buttons, StdCtrls, ExtCtrls,
  IniFiles, ActnList, MaskEdit, Grids, Spin,
  RoadTest, Link_Processor, Link_Unit, Dump, Unit4, Graph001,
  Stend, Unit7, Unit8,
  TAGraph, TASeries;   // ← lazTeeChart

type

  TTabSheetHelper = class helper for TTabSheet
  private
    function  GetHighlighted: Boolean;
    procedure SetHighlighted(const Value: Boolean);
  public
    property Highlighted: Boolean read GetHighlighted write SetHighlighted;
  end;

  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    mDiag: TMenuItem;
    MainStatBar: TStatusBar;
    IL1: TImageList;
    mStart: TMenuItem;
    mStop: TMenuItem;
    mQuit: TMenuItem;
    ToolBar1: TToolBar;
    BtnQuit: TToolButton;
    IL3: TImageList;
    BtnStart: TToolButton;
    BtnStop: TToolButton;
    BtnOtchet: TToolButton;
    mOtchet: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    btnParametr: TToolButton;
    nParametr: TMenuItem;
    PageControl1: TPageControl;
    DataSheet: TTabSheet;
    ErrorSheet: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    sb1: TSpeedButton;
    sb2: TSpeedButton;
    sb3: TSpeedButton;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    sb4: TSpeedButton;
    sb5: TSpeedButton;
    sb6: TSpeedButton;
    sb7: TSpeedButton;
    sb8: TSpeedButton;
    sb9: TSpeedButton;
    sb10: TSpeedButton;
    sb11: TSpeedButton;
    GroupBox5: TGroupBox;
    LProbeg: TLabel;
    LLastProbeg: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label10: TLabel;
    Label2: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    GroupBox3: TGroupBox;
    Label18: TLabel;
    Label30: TLabel;
    Label19: TLabel;
    Label31: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    GroupBox6: TGroupBox;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label29: TLabel;
    Label28: TLabel;
    Label27: TLabel;
    Label26: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    GroupBox7: TGroupBox;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    GroupBox8: TGroupBox;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    OscPage: TTabSheet;
    OscBox: TPaintBox;
    Panel6: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    TabSheet1: TTabSheet;
    RoadTestPage: TTabSheet;
    GroupBox12: TGroupBox;
    GroupBox13: TGroupBox;
    Button6: TButton;
    Button8: TButton;
    Label83: TLabel;
    Button7: TButton;
    RoadTestBox: TPaintBox;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Button10: TButton;
    pol: TTabSheet;
    OpenDialog1: TOpenDialog;
    ColorDialog1: TColorDialog;
    TabSheet4: TTabSheet;
    GroupBox2: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label14: TLabel;
    Panel1: TPanel;
    Image1: TImage;
    Panel2: TPanel;
    Image2: TImage;
    Panel3: TPanel;
    Image3: TImage;
    Panel4: TPanel;
    Image4: TImage;
    sb12: TSpeedButton;
    Label117: TLabel;
    sb13: TSpeedButton;
    sb14: TSpeedButton;
    sb15: TSpeedButton;
    sb16: TSpeedButton;
    Label118: TLabel;
    Label119: TLabel;
    Label120: TLabel;
    Label121: TLabel;
    Label81: TLabel;
    Label98: TLabel;
    Edit38: TEdit;
    Label82: TLabel;
    Timer1: TTimer;
    StringGrid1: TStringGrid;
    Panel8: TPanel;
    Button3: TButton;
    GroupBox4: TGroupBox;
    GroupBox14: TGroupBox;
    MotoGridOss: TStringGrid;
    GroupBox17: TGroupBox;
    Label86: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    GroupBox18: TGroupBox;
    RAM_adr: TStringGrid;
    Edit19: TEdit;
    Edit18: TEdit;
    KeyButton: TToolButton;
    EEPROM: TPageControl;
    TabSheet2: TTabSheet;
    GroupBox9: TGroupBox;
    Label68: TLabel;
    Label115: TLabel;
    Label116: TLabel;
    Memo1: TMemo;
    MotoGrid: TStringGrid;
    GroupBox22: TGroupBox;
    Label113: TLabel;
    Label114: TLabel;
    TabSheet3: TTabSheet;
    Label69: TLabel;
    ATMEL_EPROM: TStringGrid;
    Button13: TButton;
    Button12: TButton;
    Button16: TButton;
    sb17: TSpeedButton;
    Label91: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    // Chart1: TChart;
    Series1: TLineSeries;
    Series2: TLineSeries;
    StatusBar1: TStatusBar;
    Series3: TLineSeries;
    Series4: TLineSeries;
    Series0: TLineSeries;
    Series5: TLineSeries;
    Series6: TLineSeries;
    Series7: TLineSeries;
    Series8: TLineSeries;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Label138: TLabel;
    Label139: TLabel;
    Edit32: TEdit;
    Label140: TLabel;
    Label141: TLabel;
    Series13: TLineSeries;
    Series14: TLineSeries;
    Series15: TLineSeries;
    Series16: TLineSeries;
    Series17: TLineSeries;
    Series18: TLineSeries;
    Series19: TLineSeries;
    Series20: TLineSeries;
    Series21: TLineSeries;
    Series24: TLineSeries;
    Series25: TLineSeries;
    Series26: TLineSeries;
    Series27: TLineSeries;
    Series28: TLineSeries;
    Series29: TLineSeries;
    ComboBox3: TComboBox;
    TabSheet8: TTabSheet;
    PageControl2: TPageControl;
    TabSheet9: TTabSheet;
    RadioGroup1: TRadioGroup;
    Button1: TButton;
    TabSheet10: TTabSheet;
    calibrSB: TStatusBar;
    btnDelAll: TButton;
    GroupBox10: TGroupBox;
    GroupBox33: TGroupBox;
    Label145: TLabel;
    Label146: TLabel;
    Label147: TLabel;
    Label148: TLabel;
    Label149: TLabel;
    Label156: TLabel;
    Memo2: TMemo;
    GroupBox34: TGroupBox;
    CheckBox36: TCheckBox;
    PolyBtn: TSpeedButton;
    CheckBox37: TCheckBox;
    GroupBox35: TGroupBox;
    Label159: TLabel;
    ComboBox5: TComboBox;
    Label160: TLabel;
    Label161: TLabel;
    Label162: TLabel;
    Label163: TLabel;
    IL2: TImageList;
    CheckBox39: TCheckBox;
    GroupBox36: TGroupBox;
    Label187: TLabel;
    Edit20: TEdit;
    Label188: TLabel;
    Edit29: TEdit;
    Label189: TLabel;
    Edit30: TEdit;
    Label4: TLabel;
    Edit47: TEdit;
    Button33: TButton;
    Edit44: TEdit;
    Edit45: TEdit;
    Label11: TLabel;
    Edit46: TEdit;
    Label133: TLabel;
    TabSheet12: TTabSheet;
    CheckBox42: TCheckBox;
    SB18: TSpeedButton;
    Label205: TLabel;
    SB19: TSpeedButton;
    Label207: TLabel;
    SB20: TSpeedButton;
    SB21: TSpeedButton;
    Label209: TLabel;
    Label210: TLabel;
    Memo3: TMemo;
    CheckBox48: TCheckBox;
    Timer2: TTimer;
    CheckBox49: TCheckBox;
    TabSheet13: TTabSheet;
    GroupBox43: TGroupBox;
    CheckBox34: TCheckBox;
    GroupBox52: TGroupBox;
    CheckBox53: TCheckBox;
    GroupBox60: TGroupBox;
    SB23: TSpeedButton;
    Label248: TLabel;
    SB24: TSpeedButton;
    Label249: TLabel;
    SB25: TSpeedButton;
    Label250: TLabel;
    SB26: TSpeedButton;
    Label251: TLabel;
    SB22: TSpeedButton;
    Label252: TLabel;
    SB27: TSpeedButton;
    Label247: TLabel;
    CheckBox86: TCheckBox;
    Edit14: TEdit;
    Label259: TLabel;
    CheckBox87: TCheckBox;
    Edit15: TEdit;
    Label260: TLabel;
    CheckBox88: TCheckBox;
    Edit16: TEdit;
    Label261: TLabel;
    CheckBox89: TCheckBox;
    Edit17: TEdit;
    Label262: TLabel;
    GroupBox16: TGroupBox;
    Label99: TLabel;
    Label100: TLabel;
    Label70: TLabel;
    Label126: TLabel;
    ScrollBar1: TScrollBar;
    CheckBox13: TCheckBox;
    CheckBox14: TCheckBox;
    CheckBox15: TCheckBox;
    CheckBox16: TCheckBox;
    CheckBox17: TCheckBox;
    CheckBox18: TCheckBox;
    CheckBox19: TCheckBox;
    CheckBox20: TCheckBox;
    CheckBox21: TCheckBox;
    CheckBox22: TCheckBox;
    CheckBox23: TCheckBox;
    CheckBox24: TCheckBox;
    CheckBox90: TCheckBox;
    CheckBox91: TCheckBox;
    CheckBox92: TCheckBox;
    CheckBox93: TCheckBox;
    GroupBox64: TGroupBox;
    Button9: TButton;
    Button31: TButton;
    TipEmul: TRadioGroup;
    GroupBox28: TGroupBox;
    RadioGroup4: TRadioGroup;
    GroupBox27: TGroupBox;
    GroupBox41: TGroupBox;
    Label168: TLabel;
    ComboBox6: TComboBox;
    GroupBox72: TGroupBox;
    Edit23: TEdit;
    Label164: TLabel;
    Edit24: TEdit;
    Label165: TLabel;
    GroupBox73: TGroupBox;
    Label169: TLabel;
    ComboBox7: TComboBox;
    GroupBox74: TGroupBox;
    Label166: TLabel;
    Label167: TLabel;
    Edit25: TEdit;
    Edit28: TEdit;
    Label193: TLabel;
    Label268: TLabel;
    RadioGroup5: TRadioGroup;
    CheckBox96: TCheckBox;
    CheckBox97: TCheckBox;
    CheckBox98: TCheckBox;
    CheckBox99: TCheckBox;
    CheckBox100: TCheckBox;
    Edit88: TEdit;
    Label279: TLabel;
    CheckBox101: TCheckBox;
    Edit89: TEdit;
    Label280: TLabel;
    CheckBox102: TCheckBox;
    Edit90: TEdit;
    Label281: TLabel;
    CheckBox103: TCheckBox;
    Edit91: TEdit;
    Label282: TLabel;
    SaveDialog1: TSaveDialog;
    SaveDialog2: TSaveDialog;
    OpenDialog2: TOpenDialog;
    Label288: TLabel;
    Label289: TLabel;
    Label290: TLabel;
    Label291: TLabel;
    Label292: TLabel;
    Label293: TLabel;
    CheckBox68: TCheckBox;
    CheckBox104: TCheckBox;
    GroupBox58: TGroupBox;
    Label84: TLabel;
    Label85: TLabel;
    Label263: TLabel;
    TabSheet18: TTabSheet;
    PageControl4: TPageControl;
    TabSheet19: TTabSheet;
    TabSheet20: TTabSheet;
    TabSheet21: TTabSheet;
    GroupBox53: TGroupBox;
    CheckBox83: TCheckBox;
    CheckBox85: TCheckBox;
    GroupBox54: TGroupBox;
    Label225: TLabel;
    Label226: TLabel;
    Label245: TLabel;
    Edit48: TEdit;
    Edit49: TEdit;
    Edit73: TEdit;
    GroupBox66: TGroupBox;
    GroupBox76: TGroupBox;
    GroupBox77: TGroupBox;
    Label295: TLabel;
    Label233: TLabel;
    Edit98: TEdit;
    Edit80: TEdit;
    TabSheet14: TTabSheet;
    CheckBox94: TCheckBox;
    GroupBox81: TGroupBox;
    Label296: TLabel;
    Edit99: TEdit;
    GroupBox82: TGroupBox;
    Edit104: TEdit;
    Label304: TLabel;
    GroupBox83: TGroupBox;
    Edit110: TEdit;
    Label318: TLabel;
    Edit122: TEdit;
    GroupBox84: TGroupBox;
    Edit126: TEdit;
    Label322: TLabel;
    Label323: TLabel;
    Edit124: TEdit;
    Edit107: TEdit;
    Edit123: TEdit;
    GroupBox85: TGroupBox;
    Label286: TLabel;
    Edit95: TEdit;
    Edit96: TEdit;
    GroupBox86: TGroupBox;
    Edit111: TEdit;
    Label311: TLabel;
    Label320: TLabel;
    GroupBox87: TGroupBox;
    Edit106: TEdit;
    Label285: TLabel;
    CheckBox121: TCheckBox;
    Label307: TLabel;
    GroupBox88: TGroupBox;
    Button32: TButton;
    Button26: TButton;
    Button11: TButton;
    Button5: TButton;
    Button14: TButton;
    Button15: TButton;
    GroupBox89: TGroupBox;
    Button54: TButton;
    Label327: TLabel;
    SpeedButton1: TSpeedButton;
    GroupBox90: TGroupBox;
    Label328: TLabel;
    SpeedButton2: TSpeedButton;
    Button55: TButton;
    Label329: TLabel;
    Label330: TLabel;
    Label331: TLabel;
    Label332: TLabel;
    GroupBox91: TGroupBox;
    ProgStart: TSpeedButton;
    Button35: TButton;
    GroupBox48: TGroupBox;
    Label213: TLabel;
    Label214: TLabel;
    ProgressBar1: TProgressBar;
    GroupBox44: TGroupBox;
    Label134: TLabel;
    TestButton: TSpeedButton;
    GroupBox92: TGroupBox;
    Label333: TLabel;
    SpeedButton3: TSpeedButton;
    Label334: TLabel;
    Label335: TLabel;
    Label336: TLabel;
    Label337: TLabel;
    Button56: TButton;
    CheckBox45: TCheckBox;
    Label338: TLabel;
    Label339: TLabel;
    Label340: TLabel;
    Label341: TLabel;
    Edit129: TEdit;
    Edit130: TEdit;
    CheckBox126: TCheckBox;
    GroupBox99: TGroupBox;
    CheckBox69: TCheckBox;
    Edit140: TEdit;
    Label371: TLabel;
    TabSheet15: TTabSheet;
    GroupBox101: TGroupBox;
    CheckBox113: TCheckBox;
    Edit127: TEdit;
    Label372: TLabel;
    Edit112: TEdit;
    Label373: TLabel;
    Edit92: TEdit;
    Edit93: TEdit;
    Label283: TLabel;
    Label284: TLabel;
    Label315: TLabel;
    Edit94: TEdit;
    GroupBox100: TGroupBox;
    Label298: TLabel;
    Label362: TLabel;
    Label240: TLabel;
    Edit61: TEdit;
    Edit62: TEdit;
    CheckBox132: TCheckBox;
    Label380: TLabel;
    CheckBox134: TCheckBox;
    CheckBox135: TCheckBox;
    Button57: TButton;
    Button58: TButton;
    GroupBox121: TGroupBox;
    Label72: TLabel;
    Edit26: TEdit;
    Label73: TLabel;
    Edit27: TEdit;
    GroupBox122: TGroupBox;
    Label423: TLabel;
    Edit21: TEdit;
    Edit22: TEdit;
    GroupBox123: TGroupBox;
    Label157: TLabel;
    Edit174: TEdit;
    Edit175: TEdit;
    Label272: TLabel;
    Edit103: TEdit;
    RadioGroup6: TRadioGroup;
    RadioGroup3: TRadioGroup;
    RadioGroup2: TRadioGroup;
    CheckBox25: TCheckBox;
    CheckBox44: TCheckBox;
    CheckBox52: TCheckBox;
    CheckBox145: TCheckBox;
    Edit188: TEdit;
    GroupBox128: TGroupBox;
    GroupBox79: TGroupBox;
    Label236: TLabel;
    Label300: TLabel;
    Label302: TLabel;
    Label301: TLabel;
    Label428: TLabel;
    Edit70: TEdit;
    Edit64: TEdit;
    Edit57: TEdit;
    Edit55: TEdit;
    Edit52: TEdit;
    Edit101: TEdit;
    Edit176: TEdit;
    Edit177: TEdit;
    GroupBox80: TGroupBox;
    Label363: TLabel;
    Label366: TLabel;
    CheckBox70: TCheckBox;
    Edit141: TEdit;
    Edit144: TEdit;
    CheckBox117: TCheckBox;
    CheckBox137: TCheckBox;
    Label232: TLabel;
    Edit60: TEdit;
    Label473: TLabel;
    Edit222: TEdit;
    Edit226: TEdit;
    Label475: TLabel;
    Label387: TLabel;
    Edit154: TEdit;
    Label419: TLabel;
    Edit169: TEdit;
    Label420: TLabel;
    Edit170: TEdit;
    Label418: TLabel;
    Edit168: TEdit;
    Label234: TLabel;
    Edit53: TEdit;
    Label429: TLabel;
    Edit178: TEdit;
    Label513: TLabel;
    Label514: TLabel;
    GroupBox153: TGroupBox;
    GroupBox152: TGroupBox;
    Edit259: TEdit;
    Edit260: TEdit;
    Edit261: TEdit;
    Edit262: TEdit;
    Edit263: TEdit;
    Label519: TLabel;
    Label520: TLabel;
    GroupBox155: TGroupBox;
    CheckBox155: TCheckBox;
    CheckBox156: TCheckBox;
    CheckBox157: TCheckBox;
    CheckBox158: TCheckBox;
    TabSheet26: TTabSheet;
    GroupBox51: TGroupBox;
    GroupBox132: TGroupBox;
    Label471: TLabel;
    GroupBox131: TGroupBox;
    Label489: TLabel;
    Edit125: TEdit;
    Edit245: TEdit;
    GroupBox156: TGroupBox;
    Label467: TLabel;
    Label468: TLabel;
    Edit215: TEdit;
    Edit216: TEdit;
    GroupBox150: TGroupBox;
    Label522: TLabel;
    Edit113: TEdit;
    Edit273: TEdit;
    CheckBox153: TCheckBox;
    Edit202: TEdit;
    Edit218: TEdit;
    GroupBox133: TGroupBox;
    Label310: TLabel;
    Edit219: TEdit;
    Edit220: TEdit;
    GroupBox117: TGroupBox;
    Edit163: TEdit;
    Edit164: TEdit;
    Edit97: TEdit;
    GroupBox49: TGroupBox;
    Label445: TLabel;
    Label463: TLabel;
    Edit189: TEdit;
    Edit211: TEdit;
    CheckBox162: TCheckBox;
    CheckBox163: TCheckBox;
    PageControl3: TPageControl;
    TabSheet5: TTabSheet;
    Label122: TLabel;
    Label123: TLabel;
    GroupBox19: TGroupBox;
    Label151: TLabel;
    Button20: TButton;
    Button21: TButton;
    GroupBox11: TGroupBox;
    Label150: TLabel;
    Button18: TButton;
    Button19: TButton;
    GroupBox20: TGroupBox;
    Label153: TLabel;
    Button22: TButton;
    Button23: TButton;
    GroupBox21: TGroupBox;
    Label154: TLabel;
    Button24: TButton;
    Button25: TButton;
    MaskEdit1: TMaskEdit;
    GroupBox30: TGroupBox;
    TestDIF: TSpeedButton;
    Label152: TLabel;
    GroupBox46: TGroupBox;
    Label211: TLabel;
    Button34: TButton;
    Button36: TButton;
    GroupBox47: TGroupBox;
    Label212: TLabel;
    Button37: TButton;
    Button38: TButton;
    TabSheet6: TTabSheet;
    PaintBox2: TPaintBox;
    Panel7: TPanel;
    GroupBox37: TGroupBox;
    Label71: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label101: TLabel;
    Label103: TLabel;
    Label104: TLabel;
    Label105: TLabel;
    Label217: TLabel;
    Label218: TLabel;
    CheckBox28: TCheckBox;
    CheckBox27: TCheckBox;
    CheckBox29: TCheckBox;
    CheckBox30: TCheckBox;
    GroupBox38: TGroupBox;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label102: TLabel;
    Label106: TLabel;
    Label107: TLabel;
    Label108: TLabel;
    Label109: TLabel;
    Label215: TLabel;
    Label216: TLabel;
    GroupBox39: TGroupBox;
    Label110: TLabel;
    Label111: TLabel;
    Label112: TLabel;
    Label170: TLabel;
    Label171: TLabel;
    Label172: TLabel;
    Label173: TLabel;
    Label174: TLabel;
    Label175: TLabel;
    Label198: TLabel;
    Label176: TLabel;
    Label204: TLabel;
    Label177: TLabel;
    Label206: TLabel;
    Label178: TLabel;
    Label208: TLabel;
    Label219: TLabel;
    Label220: TLabel;
    Label221: TLabel;
    Label222: TLabel;
    GroupBox40: TGroupBox;
    Label180: TLabel;
    Label181: TLabel;
    Label182: TLabel;
    Label183: TLabel;
    Label184: TLabel;
    Label185: TLabel;
    Label186: TLabel;
    Label223: TLabel;
    Label224: TLabel;
    CheckBox46: TCheckBox;
    CheckBox47: TCheckBox;
    TabSheet7: TTabSheet;
    GroupBox15: TGroupBox;
    Label94: TLabel;
    Label95: TLabel;
    Label96: TLabel;
    Label97: TLabel;
    Label124: TLabel;
    Label125: TLabel;
    Label190: TLabel;
    Label191: TLabel;
    GroupBox29: TGroupBox;
    Label142: TLabel;
    Label143: TLabel;
    Label144: TLabel;
    Label155: TLabel;
    Edit13: TEdit;
    PropKl: TTabSheet;
    GroupBox24: TGroupBox;
    Label129: TLabel;
    Label130: TLabel;
    Label131: TLabel;
    Label132: TLabel;
    TrackBar1: TTrackBar;
    GroupBox42: TGroupBox;
    Label200: TLabel;
    Label201: TLabel;
    Label202: TLabel;
    Label203: TLabel;
    Edit40: TEdit;
    Edit41: TEdit;
    Edit43: TEdit;
    Edit42: TEdit;
    Button30: TButton;
    TabSheet11: TTabSheet;
    CANOssBox: TPaintBox;
    Panel5: TPanel;
    Button27: TButton;
    Button28: TButton;
    Button29: TButton;
    TabSheet16: TTabSheet;
    GroupBox62: TGroupBox;
    Label255: TLabel;
    Label256: TLabel;
    Label257: TLabel;
    Label258: TLabel;
    Label266: TLabel;
    Button43: TButton;
    Button44: TButton;
    Button45: TButton;
    Button46: TButton;
    Button50: TButton;
    Button51: TButton;
    GroupBox59: TGroupBox;
    Label269: TLabel;
    Edit86: TEdit;
    GroupBox63: TGroupBox;
    GroupBox25: TGroupBox;
    Label273: TLabel;
    Label274: TLabel;
    Label275: TLabel;
    Edit35: TEdit;
    Edit81: TEdit;
    Edit82: TEdit;
    GroupBox75: TGroupBox;
    Label276: TLabel;
    Label277: TLabel;
    Label278: TLabel;
    Edit83: TEdit;
    Edit84: TEdit;
    Edit85: TEdit;
    GroupBox65: TGroupBox;
    GroupBox67: TGroupBox;
    Button49: TButton;
    GroupBox68: TGroupBox;
    Button42: TButton;
    GroupBox69: TGroupBox;
    Label408: TLabel;
    Label409: TLabel;
    Label410: TLabel;
    Button53: TButton;
    Button52: TButton;
    Button59: TButton;
    Button40: TButton;
    GroupBox104: TGroupBox;
    GroupBox105: TGroupBox;
    Label306: TLabel;
    Label374: TLabel;
    Label375: TLabel;
    Label376: TLabel;
    Label377: TLabel;
    Label378: TLabel;
    Label381: TLabel;
    Label411: TLabel;
    Edit148: TEdit;
    GroupBox106: TGroupBox;
    Label382: TLabel;
    Label383: TLabel;
    Label384: TLabel;
    Label412: TLabel;
    Label454: TLabel;
    Edit149: TEdit;
    Edit150: TEdit;
    Edit151: TEdit;
    Edit203: TEdit;
    GroupBox70: TGroupBox;
    Label379: TLabel;
    Edit147: TEdit;
    GroupBox71: TGroupBox;
    Label389: TLabel;
    Label388: TLabel;
    Label413: TLabel;
    Edit156: TEdit;
    Edit157: TEdit;
    GroupBox119: TGroupBox;
    GroupBox120: TGroupBox;
    Label407: TLabel;
    Label440: TLabel;
    Label441: TLabel;
    Edit173: TEdit;
    Edit166: TEdit;
    Edit167: TEdit;
    GroupBox118: TGroupBox;
    Label386: TLabel;
    Label414: TLabel;
    Edit153: TEdit;
    GroupBox110: TGroupBox;
    GroupBox111: TGroupBox;
    Label385: TLabel;
    Label396: TLabel;
    Label415: TLabel;
    Label390: TLabel;
    Label393: TLabel;
    Label391: TLabel;
    Label394: TLabel;
    Label392: TLabel;
    Label395: TLabel;
    Edit152: TEdit;
    Edit158: TEdit;
    TabSheet17: TTabSheet;
    GroupBox113: TGroupBox;
    Label457: TLabel;
    GroupBox124: TGroupBox;
    Label430: TLabel;
    Label431: TLabel;
    Label432: TLabel;
    Label433: TLabel;
    Edit179: TEdit;
    Edit180: TEdit;
    Edit181: TEdit;
    Edit182: TEdit;
    Edit183: TEdit;
    Edit184: TEdit;
    Edit185: TEdit;
    GroupBox126: TGroupBox;
    Label436: TLabel;
    Label437: TLabel;
    Label438: TLabel;
    Label439: TLabel;
    Edit186: TEdit;
    Edit205: TEdit;
    GroupBox93: TGroupBox;
    GroupBox94: TGroupBox;
    Label354: TLabel;
    GroupBox95: TGroupBox;
    Label344: TLabel;
    Label345: TLabel;
    Label346: TLabel;
    Label347: TLabel;
    Label348: TLabel;
    Label349: TLabel;
    Label350: TLabel;
    Label351: TLabel;
    Label352: TLabel;
    Label353: TLabel;
    Label355: TLabel;
    Label356: TLabel;
    Label357: TLabel;
    Label358: TLabel;
    Label359: TLabel;
    Label360: TLabel;
    Edit133: TEdit;
    Edit134: TEdit;
    Edit135: TEdit;
    Edit136: TEdit;
    Edit137: TEdit;
    Edit138: TEdit;
    TabSheet23: TTabSheet;
    GroupBox108: TGroupBox;
    GroupBox129: TGroupBox;
    Label455: TLabel;
    Label469: TLabel;
    Label462: TLabel;
    Label461: TLabel;
    Edit204: TEdit;
    Edit217: TEdit;
    Edit210: TEdit;
    Edit209: TEdit;
    GroupBox130: TGroupBox;
    Label464: TLabel;
    Label460: TLabel;
    Label465: TLabel;
    Label474: TLabel;
    Edit212: TEdit;
    Edit208: TEdit;
    Edit213: TEdit;
    Edit225: TEdit;
    GroupBox144: TGroupBox;
    GroupBox116: TGroupBox;
    Label480: TLabel;
    Label481: TLabel;
    Label482: TLabel;
    Label484: TLabel;
    Label485: TLabel;
    Edit236: TEdit;
    Edit237: TEdit;
    Edit238: TEdit;
    Edit240: TEdit;
    Edit243: TEdit;
    Edit244: TEdit;
    Edit271: TEdit;
    GroupBox143: TGroupBox;
    Label305: TLabel;
    Edit230: TEdit;
    Edit231: TEdit;
    GroupBox109: TGroupBox;
    Label458: TLabel;
    Label459: TLabel;
    Edit206: TEdit;
    Edit207: TEdit;
    GroupBox145: TGroupBox;
    Label479: TLabel;
    Label483: TLabel;
    Label486: TLabel;
    Label487: TLabel;
    Label488: TLabel;
    Label517: TLabel;
    Edit232: TEdit;
    Edit233: TEdit;
    Edit234: TEdit;
    Edit235: TEdit;
    Edit239: TEdit;
    Edit268: TEdit;
    GroupBox160: TGroupBox;
    GroupBox114: TGroupBox;
    Label398: TLabel;
    Label417: TLabel;
    Edit160: TEdit;
    TabSheet22: TTabSheet;
    GroupBox164: TGroupBox;
    CheckBox31: TCheckBox;
    CheckBox40: TCheckBox;
    CheckBox174: TCheckBox;
    GroupBox165: TGroupBox;
    Label533: TLabel;
    Edit291: TEdit;
    Label534: TLabel;
    Edit292: TEdit;
    Label535: TLabel;
    Edit293: TEdit;
    PageControl5: TPageControl;
    TabSheet27: TTabSheet;
    TabSheet30: TTabSheet;
    GroupBox146: TGroupBox;
    Button60: TButton;
    GroupBox147: TGroupBox;
    Label493: TLabel;
    Label510: TLabel;
    Label521: TLabel;
    Button61: TButton;
    Button62: TButton;
    Button65: TButton;
    Edit272: TEdit;
    GroupBox136: TGroupBox;
    GroupBox139: TGroupBox;
    Label472: TLabel;
    Edit195: TEdit;
    Edit221: TEdit;
    CheckBox125: TCheckBox;
    GroupBox174: TGroupBox;
    Label536: TLabel;
    Edit294: TEdit;
    GroupBox175: TGroupBox;
    Edit295: TEdit;
    Label478: TLabel;
    Label537: TLabel;
    Edit296: TEdit;
    Label538: TLabel;
    Edit297: TEdit;
    Edit298: TEdit;
    Label542: TLabel;
    Edit303: TEdit;
    GroupBox178: TGroupBox;
    Edit305: TEdit;
    Label544: TLabel;
    Label545: TLabel;
    Edit306: TEdit;
    CheckBox185: TCheckBox;
    CheckBox186: TCheckBox;
    CheckBox187: TCheckBox;
    CheckBox188: TCheckBox;
    CheckBox189: TCheckBox;
    CheckBox190: TCheckBox;
    CheckBox191: TCheckBox;
    CheckBox192: TCheckBox;
    CheckBox193: TCheckBox;
    CheckBox194: TCheckBox;
    CheckBox195: TCheckBox;
    CheckBox196: TCheckBox;
    CheckBox197: TCheckBox;
    CheckBox198: TCheckBox;
    CheckBox199: TCheckBox;
    GroupBox179: TGroupBox;
    Label546: TLabel;
    Edit307: TEdit;
    CheckBox200: TCheckBox;
    CheckBox201: TCheckBox;
    CheckBox202: TCheckBox;
    CheckBox203: TCheckBox;
    CheckBox204: TCheckBox;
    CheckBox205: TCheckBox;
    CheckBox206: TCheckBox;
    CheckBox207: TCheckBox;
    GroupBox180: TGroupBox;
    Label547: TLabel;
    Edit308: TEdit;
    Label548: TLabel;
    Edit309: TEdit;
    Label549: TLabel;
    Edit310: TEdit;
    Label550: TLabel;
    Edit311: TEdit;
    GroupBox181: TGroupBox;
    Label551: TLabel;
    Edit312: TEdit;
    Label552: TLabel;
    Edit313: TEdit;
    CheckBox211: TCheckBox;
    CheckBox212: TCheckBox;
    Label406: TLabel;
    TabSheet24: TTabSheet;
    GroupBox187: TGroupBox;
    Label562: TLabel;
    Label563: TLabel;
    Edit241: TEdit;
    Edit242: TEdit;
    CheckBox227: TCheckBox;
    GroupBox190: TGroupBox;
    GroupBox138: TGroupBox;
    Label369: TLabel;
    Label492: TLabel;
    Label491: TLabel;
    Label494: TLabel;
    Edit227: TEdit;
    Edit228: TEdit;
    Edit248: TEdit;
    Edit247: TEdit;
    Label530: TLabel;
    Edit328: TEdit;
    Edit329: TEdit;
    CheckBox152: TCheckBox;
    Label560: TLabel;
    CheckBox234: TCheckBox;
    Label561: TLabel;
    Edit330: TEdit;
    Label564: TLabel;
    Edit331: TEdit;
    GroupBox194: TGroupBox;
    CheckBox138: TCheckBox;
    Edit171: TEdit;
    CheckBox213: TCheckBox;
    GroupBox195: TGroupBox;
    CheckBox139: TCheckBox;
    CheckBox140: TCheckBox;
    Edit172: TEdit;
    CheckBox238: TCheckBox;
    Label569: TLabel;
    Label571: TLabel;
    Label74: TLabel;
    Label158: TLabel;
    Label425: TLabel;
    TabSheet25: TTabSheet;
    GroupBox102: TGroupBox;
    CheckBox228: TCheckBox;
    CheckBox243: TCheckBox;
    GroupBox135: TGroupBox;
    Label270: TLabel;
    Label267: TLabel;
    Label450: TLabel;
    Label508: TLabel;
    Label509: TLabel;
    Edit76: TEdit;
    Edit77: TEdit;
    Edit75: TEdit;
    Edit78: TEdit;
    Edit197: TEdit;
    Edit196: TEdit;
    Edit324: TEdit;
    Edit253: TEdit;
    Edit254: TEdit;
    Edit266: TEdit;
    Edit267: TEdit;
    GroupBox134: TGroupBox;
    Label264: TLabel;
    Label253: TLabel;
    Label451: TLabel;
    Edit67: TEdit;
    Edit68: TEdit;
    Edit71: TEdit;
    Edit72: TEdit;
    Edit198: TEdit;
    Edit199: TEdit;
    Label426: TLabel;
    Label553: TLabel;
    Label579: TLabel;
    Label581: TLabel;
    GroupBox191: TGroupBox;
    GroupBox204: TGroupBox;
    CheckBox143: TCheckBox;
    CheckBox124: TCheckBox;
    CheckBox144: TCheckBox;
    CheckBox71: TCheckBox;
    GroupBox205: TGroupBox;
    CheckBox141: TCheckBox;
    CheckBox175: TCheckBox;
    TabSheet31: TTabSheet;
    GroupBox207: TGroupBox;
    CheckBox233: TCheckBox;
    Edit270: TEdit;
    Label477: TLabel;
    GroupBox208: TGroupBox;
    Label582: TLabel;
    Edit269: TEdit;
    CheckBox232: TCheckBox;
    GroupBox200: TGroupBox;
    CheckBox84: TCheckBox;
    CheckBox127: TCheckBox;
    RadioGroup9: TRadioGroup;
    CheckBox231: TCheckBox;
    Label452: TLabel;
    Label586: TLabel;
    Label321: TLabel;
    Label585: TLabel;
    Edit351: TEdit;
    CheckBox258: TCheckBox;
    Edit352: TEdit;
    CheckBox259: TCheckBox;
    Edit353: TEdit;
    CheckBox260: TCheckBox;
    CheckBox74: TCheckBox;
    CheckBox56: TCheckBox;
    GroupBox211: TGroupBox;
    CheckBox261: TCheckBox;
    CheckBox269: TCheckBox;
    CheckBox128: TCheckBox;
    CheckBox267: TCheckBox;
    CheckBox147: TCheckBox;
    Label588: TLabel;
    Edit356: TEdit;
    GroupBox214: TGroupBox;
    Label287: TLabel;
    Label308: TLabel;
    Label590: TLabel;
    Edit357: TEdit;
    Edit358: TEdit;
    Edit359: TEdit;
    Edit360: TEdit;
    GroupBox151: TGroupBox;
    Label512: TLabel;
    Edit255: TEdit;
    Edit256: TEdit;
    Edit257: TEdit;
    Edit258: TEdit;
    Ok: TButton;
    Edit265: TEdit;
    Label516: TLabel;
    Button64: TButton;
    Label515: TLabel;
    Edit264: TEdit;
    Edit334: TEdit;
    Label591: TLabel;
    Label592: TLabel;
    Edit335: TEdit;
    Edit315: TEdit;
    Label554: TLabel;
    CheckBox263: TCheckBox;
    GroupBox154: TGroupBox;
    Label593: TLabel;
    Button66: TButton;
    Button67: TButton;
    Label594: TLabel;
    Edit361: TEdit;
    CheckBox166: TCheckBox;
    Edit362: TEdit;
    Label597: TLabel;
    Button68: TButton;
    GroupBox216: TGroupBox;
    CheckBox271: TCheckBox;
    CheckBox170: TCheckBox;
    CheckBox215: TCheckBox;
    CheckBox272: TCheckBox;
    GroupBox218: TGroupBox;
    GroupBox186: TGroupBox;
    CheckBox235: TCheckBox;
    CheckBox110: TCheckBox;
    CheckBox67: TCheckBox;
    CheckBox180: TCheckBox;
    CheckBox274: TCheckBox;
    GroupBox56: TGroupBox;
    CheckBox64: TCheckBox;
    CheckBox65: TCheckBox;
    CheckBox79: TCheckBox;
    GroupBox166: TGroupBox;
    CheckBox168: TCheckBox;
    CheckBox169: TCheckBox;
    CheckBox58: TCheckBox;
    CheckBox277: TCheckBox;
    CheckBox278: TCheckBox;
    CheckBox279: TCheckBox;
    CheckBox284: TCheckBox;
    GroupBox212: TGroupBox;
    CheckBox282: TCheckBox;
    CheckBox283: TCheckBox;
    CheckBox285: TCheckBox;
    GroupBox219: TGroupBox;
    CheckBox280: TCheckBox;
    CheckBox281: TCheckBox;
    CheckBox148: TCheckBox;
    GroupBox50: TGroupBox;
    CheckBox159: TCheckBox;
    CheckBox149: TCheckBox;
    Edit200: TEdit;
    Edit201: TEdit;
    CheckBox208: TCheckBox;
    CheckBox209: TCheckBox;
    CheckBox229: TCheckBox;
    Edit155: TEdit;
    GroupBox55: TGroupBox;
    Label587: TLabel;
    GroupBox57: TGroupBox;
    Label237: TLabel;
    Label239: TLabel;
    Label241: TLabel;
    Label243: TLabel;
    Label229: TLabel;
    Label230: TLabel;
    Label242: TLabel;
    Label244: TLabel;
    Label443: TLabel;
    Label444: TLabel;
    Edit54: TEdit;
    Edit59: TEdit;
    CheckBox72: TCheckBox;
    CheckBox73: TCheckBox;
    CheckBox75: TCheckBox;
    CheckBox76: TCheckBox;
    CheckBox77: TCheckBox;
    CheckBox78: TCheckBox;
    Edit74: TEdit;
    CheckBox80: TCheckBox;
    CheckBox81: TCheckBox;
    CheckBox107: TCheckBox;
    CheckBox108: TCheckBox;
    CheckBox146: TCheckBox;
    CheckBox105: TCheckBox;
    Edit354: TEdit;
    Edit355: TEdit;
    GroupBox206: TGroupBox;
    Label228: TLabel;
    Label324: TLabel;
    Edit50: TEdit;
    Edit128: TEdit;
    GroupBox170: TGroupBox;
    Label317: TLabel;
    Edit120: TEdit;
    GroupBox127: TGroupBox;
    Label271: TLabel;
    Label227: TLabel;
    Label294: TLabel;
    Edit79: TEdit;
    Edit51: TEdit;
    Edit65: TEdit;
    GroupBox171: TGroupBox;
    Label316: TLabel;
    Label314: TLabel;
    Label466: TLabel;
    Edit119: TEdit;
    Edit117: TEdit;
    Edit118: TEdit;
    GroupBox169: TGroupBox;
    Label434: TLabel;
    Label448: TLabel;
    Label361: TLabel;
    CheckBox123: TCheckBox;
    CheckBox150: TCheckBox;
    Edit214: TEdit;
    Edit139: TEdit;
    Edit194: TEdit;
    CheckBox242: TCheckBox;
    GroupBox168: TGroupBox;
    Label490: TLabel;
    Label446: TLabel;
    Label470: TLabel;
    Label365: TLabel;
    Label309: TLabel;
    Label312: TLabel;
    Edit190: TEdit;
    Edit191: TEdit;
    Edit165: TEdit;
    CheckBox154: TCheckBox;
    Edit56: TEdit;
    Edit58: TEdit;
    Edit143: TEdit;
    Edit108: TEdit;
    Edit109: TEdit;
    CheckBox136: TCheckBox;
    GroupBox141: TGroupBox;
    CheckBox120: TCheckBox;
    CheckBox118: TCheckBox;
    CheckBox116: TCheckBox;
    CheckBox218: TCheckBox;
    GroupBox142: TGroupBox;
    Label447: TLabel;
    Label299: TLabel;
    Edit192: TEdit;
    Edit193: TEdit;
    Label238: TLabel;
    Edit66: TEdit;
    CheckBox268: TCheckBox;
    GroupBox213: TGroupBox;
    Label235: TLabel;
    Label539: TLabel;
    Label589: TLabel;
    Edit69: TEdit;
    Edit63: TEdit;
    Edit105: TEdit;
    GroupBox173: TGroupBox;
    Label303: TLabel;
    Label319: TLabel;
    Edit102: TEdit;
    Edit121: TEdit;
    CheckBox129: TCheckBox;
    CheckBox51: TCheckBox;
    GroupBox172: TGroupBox;
    CheckBox130: TCheckBox;
    CheckBox114: TCheckBox;
    CheckBox179: TCheckBox;
    CheckBox210: TCheckBox;
    GroupBox192: TGroupBox;
    Label526: TLabel;
    Label580: TLabel;
    CheckBox241: TCheckBox;
    Edit280: TEdit;
    Edit281: TEdit;
    Edit301: TEdit;
    Edit302: TEdit;
    Label596: TLabel;
    Edit363: TEdit;
    GroupBox210: TGroupBox;
    CheckBox176: TCheckBox;
    CheckBox177: TCheckBox;
    CheckBox171: TCheckBox;
    CheckBox178: TCheckBox;
    Edit246: TEdit;
    RadioGroup7: TRadioGroup;
    GroupBox158: TGroupBox;
    GroupBox159: TGroupBox;
    Label524: TLabel;
    Label523: TLabel;
    Label565: TLabel;
    Edit274: TEdit;
    Edit275: TEdit;
    Edit276: TEdit;
    Edit277: TEdit;
    CheckBox183: TCheckBox;
    Edit279: TEdit;
    GroupBox161: TGroupBox;
    Label528: TLabel;
    Edit283: TEdit;
    GroupBox176: TGroupBox;
    CheckBox286: TCheckBox;
    Edit365: TEdit;
    CheckBox226: TCheckBox;
    Edit278: TEdit;
    CheckBox224: TCheckBox;
    RadioGroup8: TRadioGroup;
    GroupBox183: TGroupBox;
    CheckBox219: TCheckBox;
    CheckBox184: TCheckBox;
    Edit304: TEdit;
    Edit316: TEdit;
    CheckBox287: TCheckBox;
    Edit321: TEdit;
    Edit317: TEdit;
    GroupBox184: TGroupBox;
    Label556: TLabel;
    Edit320: TEdit;
    GroupBox196: TGroupBox;
    GroupBox197: TGroupBox;
    CheckBox160: TCheckBox;
    CheckBox165: TCheckBox;
    CheckBox164: TCheckBox;
    Edit349: TEdit;
    Edit350: TEdit;
    Label584: TLabel;
    Label421: TLabel;
    Label578: TLabel;
    Edit314: TEdit;
    Edit348: TEdit;
    GroupBox107: TGroupBox;
    Label531: TLabel;
    Label575: TLabel;
    Label527: TLabel;
    Edit289: TEdit;
    Edit290: TEdit;
    Edit282: TEdit;
    Edit288: TEdit;
    GroupBox182: TGroupBox;
    CheckBox217: TCheckBox;
    CheckBox181: TCheckBox;
    GroupBox189: TGroupBox;
    Label559: TLabel;
    Label568: TLabel;
    CheckBox161: TCheckBox;
    Edit325: TEdit;
    Edit323: TEdit;
    Edit337: TEdit;
    Edit338: TEdit;
    CheckBox214: TCheckBox;
    GroupBox198: TGroupBox;
    CheckBox240: TCheckBox;
    CheckBox270: TCheckBox;
    Label558: TLabel;
    Edit364: TEdit;
    GroupBox140: TGroupBox;
    Label476: TLabel;
    Label405: TLabel;
    Label422: TLabel;
    Label343: TLabel;
    CheckBox239: TCheckBox;
    Edit223: TEdit;
    Edit224: TEdit;
    Edit366: TEdit;
    Edit367: TEdit;
    Label427: TLabel;
    GroupBox137: TGroupBox;
    Label342: TLabel;
    Edit131: TEdit;
    Edit132: TEdit;
    CheckBox273: TCheckBox;
    CheckBox288: TCheckBox;
    CheckBox289: TCheckBox;
    GroupBox98: TGroupBox;
    CheckBox66: TCheckBox;
    CheckBox33: TCheckBox;
    CheckBox290: TCheckBox;
    CheckBox291: TCheckBox;
    CheckBox292: TCheckBox;
    Label313: TLabel;
    Edit114: TEdit;
    Edit115: TEdit;
    Label449: TLabel;
    Label518: TLabel;
    CheckBox295: TCheckBox;
    CheckBox294: TCheckBox;
    CheckBox296: TCheckBox;
    Label453: TLabel;
    Button69: TButton;
    Edit368: TEdit;
    Label525: TLabel;
    CheckBox297: TCheckBox;
    GroupBox148: TGroupBox;
    CheckBox54: TCheckBox;
    CheckBox299: TCheckBox;
    CheckBox293: TCheckBox;
    GroupBox157: TGroupBox;
    Emergency: TSpeedButton;
    Label599: TLabel;
    Label600: TLabel;
    Label541: TLabel;
    StopLight: TSpeedButton;
    Label567: TLabel;
    Edit116: TEdit;
    CheckBox95: TCheckBox;
    CheckBox300: TCheckBox;
    GroupBox78: TGroupBox;
    CheckBox301: TCheckBox;
    RadioGroup11: TRadioGroup;
    CheckBox302: TCheckBox;
    Label598: TLabel;
    Button70: TButton;
    Label601: TLabel;
    Edit370: TEdit;
    Button71: TButton;
    GroupBox112: TGroupBox;
    Label397: TLabel;
    Label416: TLabel;
    Edit159: TEdit;
    Button17: TButton;
    LampABS: TSpeedButton;
    Label602: TLabel;
    LampASR: TSpeedButton;
    Label603: TLabel;
    LampVDC: TSpeedButton;
    Label604: TLabel;
    GroupBox185: TGroupBox;
    GroupBox209: TGroupBox;
    GroupBox188: TGroupBox;
    Label128: TLabel;
    Edit371: TEdit;
    GroupBox201: TGroupBox;
    Label605: TLabel;
    Edit372: TEdit;
    GroupBox115: TGroupBox;
    Label399: TLabel;
    Label400: TLabel;
    Label401: TLabel;
    Label402: TLabel;
    Label403: TLabel;
    Label404: TLabel;
    Edit161: TEdit;
    Edit162: TEdit;
    TabSheet28: TTabSheet;
    GroupBox31: TGroupBox;
    Label325: TLabel;
    Button72: TButton;
    Label607: TLabel;
    Button73: TButton;
    GroupBox23: TGroupBox;
    Button4: TButton;
    Button39: TButton;
    Button2: TButton;
    CheckBox50: TCheckBox;
    GroupBox61: TGroupBox;
    Button47: TButton;
    GroupBox215: TGroupBox;
    Edit87: TEdit;
    Button48: TButton;
    Edit373: TEdit;
    GroupBox149: TGroupBox;
    Label367: TLabel;
    Label495: TLabel;
    Label496: TLabel;
    Label497: TLabel;
    Label498: TLabel;
    Label499: TLabel;
    Label500: TLabel;
    Label501: TLabel;
    Label502: TLabel;
    Label503: TLabel;
    Label504: TLabel;
    Label505: TLabel;
    Label506: TLabel;
    Label507: TLabel;
    Label511: TLabel;
    Edit249: TEdit;
    Edit250: TEdit;
    Edit251: TEdit;
    Edit252: TEdit;
    Label540: TLabel;
    Edit299: TEdit;
    Edit300: TEdit;
    Edit332: TEdit;
    Edit333: TEdit;
    Label577: TLabel;
    Button74: TButton;
    Button76: TButton;
    TabSheet29: TTabSheet;
    GroupBox226: TGroupBox;
    Label615: TLabel;
    Button80: TButton;
    SpeedButton4: TSpeedButton;
    Label616: TLabel;
    Edit381: TEdit;
    Edit382: TEdit;
    Label617: TLabel;
    Edit383: TEdit;
    Memo4: TMemo;
    Edit384: TEdit;
    GroupBox227: TGroupBox;
    Button81: TButton;
    Edit385: TEdit;
    lbl1: TLabel;
    Edit386: TEdit;
    Label619: TLabel;
    WrCFG: TButton;
    Help1: TMenuItem;
    mniWelcome: TMenuItem;
    AboutProgramm1: TMenuItem;
    HelpContents1: TMenuItem;
    GroupBox232: TGroupBox;
    GroupBox231: TGroupBox;
    Edit393: TEdit;
    GroupBox229: TGroupBox;
    lbl3: TLabel;
    Edit388: TEdit;
    Edit390: TEdit;
    GroupBox228: TGroupBox;
    Label620: TLabel;
    Label621: TLabel;
    Edit387: TEdit;
    Edit392: TEdit;
    RdCFG: TButton;
    GroupBox230: TGroupBox;
    lbl2: TLabel;
    lbl4: TLabel;
    Edit389: TEdit;
    Edit391: TEdit;
    GroupBox234: TGroupBox;
    Label624: TLabel;
    Label625: TLabel;
    GroupBox233: TGroupBox;
    Label622: TLabel;
    Label623: TLabel;
    Edit394: TEdit;
    Edit395: TEdit;
    grp1: TGroupBox;
    grp2: TGroupBox;
    Edit375: TEdit;
    Test1: TButton;
    grp3: TGroupBox;
    Test2: TButton;
    grp4: TGroupBox;
    Test3: TButton;
    Label613: TLabel;
    grp5: TGroupBox;
    Label612: TLabel;
    grp6: TGroupBox;
    Label576: TLabel;
    Label611: TLabel;
    Edit374: TEdit;
    Edit379: TEdit;
    USBopen: TButton;
    grp7: TGroupBox;
    Label608: TLabel;
    Label609: TLabel;
    Label610: TLabel;
    Edit376: TEdit;
    Edit377: TEdit;
    UpGrade: TButton;
    Edit378: TEdit;
    Edit380: TEdit;
    chk1: TCheckBox;
    Edit396: TEdit;
    Edit397: TEdit;
    GroupBox221: TGroupBox;
    HaltBrake: TSpeedButton;
    Label614: TLabel;
    GroupBox223: TGroupBox;
    Label127: TLabel;
    Edit287: TEdit;
    Label606: TLabel;
    Label626: TLabel;
    Edit398: TEdit;
    Label627: TLabel;
    CheckBox308: TCheckBox;
    GroupBox224: TGroupBox;
    CheckBox309: TCheckBox;
    CheckBox310: TCheckBox;
    GroupBox225: TGroupBox;
    Edit399: TEdit;
    Edit400: TEdit;
    chk2: TCheckBox;
    GroupBox235: TGroupBox;
    Label618: TLabel;
    GroupBox236: TGroupBox;
    Label628: TLabel;
    Edit401: TEdit;
    CheckBox311: TCheckBox;
    GroupBox237: TGroupBox;
    Label572: TLabel;
    Edit339: TEdit;
    Label573: TLabel;
    Edit340: TEdit;
    Label574: TLabel;
    Edit341: TEdit;
    Label629: TLabel;
    Edit402: TEdit;
    CheckBox312: TCheckBox;
    Edit403: TEdit;
    CheckBox276: TCheckBox;
    GroupBox238: TGroupBox;
    Edit146: TEdit;
    CheckBox313: TCheckBox;
    CheckBox314: TCheckBox;
    Edit404: TEdit;
    CheckBox315: TCheckBox;
    CheckBox316: TCheckBox;
    CheckBox317: TCheckBox;
    grp8: TGroupBox;
    CheckBox59: TCheckBox;
    CheckBox60: TCheckBox;
    CheckBox61: TCheckBox;
    CheckBox62: TCheckBox;
    CheckBox55: TCheckBox;
    CheckBox119: TCheckBox;
    GroupBox239: TGroupBox;
    CheckBox131: TCheckBox;
    Edit405: TEdit;
    Label364: TLabel;
    GroupBox240: TGroupBox;
    Button77: TButton;
    ButtonXBR1: TButton;
    CheckBox318: TCheckBox;
    Label630: TLabel;
    GroupBox: TGroupBox;
    GroupBox193: TGroupBox;
    Label424: TLabel;
    Label631: TLabel;
    Edit344: TEdit;
    Edit345: TEdit;
    Edit346: TEdit;
    Edit343: TEdit;
    rg1: TRadioGroup;
    ButtonXBR2: TButton;
    stat1: TStatusBar;
    Label632: TLabel;
    Label633: TLabel;
    Label634: TLabel;
    Label635: TLabel;
    Label636: TLabel;
    Label637: TLabel;
    Label638: TLabel;
    Label639: TLabel;
    WrNum: TButton;
    CheckBox319: TCheckBox;
    GroupBox1100: TGroupBox;
    GroupBox1101: TGroupBox;
    CheckBox320: TCheckBox;
    CheckBox321: TCheckBox;
    CheckBox322: TCheckBox;
    CheckBox323: TCheckBox;
    Label640: TLabel;
    CheckBox324: TCheckBox;
    CheckBox325: TCheckBox;
    CheckBox326: TCheckBox;
    Edit407: TEdit;
    Edit408: TEdit;
    Edit409: TEdit;
    Edit410: TEdit;
    Edit411: TEdit;
    Edit412: TEdit;
    GroupBox1102: TGroupBox;
    Edit406: TEdit;
    Edit413: TEdit;
    Label641: TLabel;
    Label642: TLabel;
    Edit414: TEdit;
    Label643: TLabel;
    Wr1: TButton;
    GroupBox1103: TGroupBox;
    CheckBox173: TCheckBox;
    CheckBox222: TCheckBox;
    CheckBox221: TCheckBox;
    Edit319: TEdit;
    CheckBox223: TCheckBox;
    GroupBox162: TGroupBox;
    GroupBox163: TGroupBox;
    Label529: TLabel;
    Label532: TLabel;
    Label557: TLabel;
    Edit285: TEdit;
    Edit284: TEdit;
    Edit286: TEdit;
    Edit327: TEdit;
    CheckBox167: TCheckBox;
    CheckBox216: TCheckBox;
    CheckBox225: TCheckBox;
    CheckBox220: TCheckBox;
    CheckBox112: TCheckBox;
    Edit326: TEdit;
    Edit322: TEdit;
    GroupBox167: TGroupBox;
    CheckBox298: TCheckBox;
    CheckBox303: TCheckBox;
    CheckBox230: TCheckBox;
    GroupBox1104: TGroupBox;
    Label644: TLabel;
    Wr2: TButton;
    Label645: TLabel;
    Wr3: TButton;
    CheckBox328: TCheckBox;
    CheckBox329: TCheckBox;
    CheckBox330: TCheckBox;
    Edit424: TEdit;
    Label662: TLabel;
    Wr4: TButton;
    GroupBox1109: TGroupBox;
    Label555: TLabel;
    Edit369: TEdit;
    Label570: TLabel;
    Label595: TLabel;
    Edit229: TEdit;
    Label583: TLabel;
    CheckBox327: TCheckBox;
    Label663: TLabel;
    GroupBox1108: TGroupBox;
    //ELMbut: TButton;
    CheckBox331: TCheckBox;
    Edit425: TEdit;
    GroupBox1110: TGroupBox;
    Label664: TLabel;
    btn1: TSpeedButton;
    Label666: TLabel;
    Label667: TLabel;
    Label668: TLabel;
    //ELM1: TButton;
    Edit426: TEdit;
    CheckBox332: TCheckBox;
    CheckBox333: TCheckBox;
    Edit427: TEdit;
    Label326: TLabel;
    GroupBox1111: TGroupBox;
    Edit100: TEdit;
    _SelOss_Grid: TStringGrid;
    chk3: TCheckBox;
    Label179: TLabel;
    Label231: TLabel;
    ts1: TTabSheet;
    GroupBox1112: TGroupBox;
    GroupBox1113: TGroupBox;
    Label135: TLabel;
    Label196: TLabel;
    Label197: TLabel;
    Label265: TLabel;
    Label194: TLabel;
    Label195: TLabel;
    ComboBox4: TComboBox;
    Edit34: TEdit;
    Edit33: TEdit;
    Edit36: TEdit;
    Edit37: TEdit;
    Edit39: TEdit;
    GroupBox1114: TGroupBox;
    Label136: TLabel;
    Label137: TLabel;
    Label192: TLabel;
    Label199: TLabel;
    Label254: TLabel;
    CheckBoxLIM: TCheckBox;
    SpinEdit1: TSpinEdit;
    CheckBox43: TCheckBox;
    SpinEdit2: TSpinEdit;
    CheckBox38: TCheckBox;
    Edit31: TEdit;
    Label665: TLabel;
    CheckBox32: TCheckBox;
    btn2: TSpeedButton;
    btn7: TSpeedButton;
    GroupBox1115: TGroupBox;
    btn4: TSpeedButton;
    btn5: TSpeedButton;
    btn6: TSpeedButton;
    btn3: TSpeedButton;
    rg2: TRadioGroup;
    Prop1: TButton;
    CheckBox334: TCheckBox;
    CheckBox335: TCheckBox;
    TabSheet32: TTabSheet;
    GroupBox26: TGroupBox;
    Label669: TLabel;
    SpeedButton5: TSpeedButton;
    Label670: TLabel;
    Label671: TLabel;
    SpeedButton6: TSpeedButton;
    SAS_File: TButton;
    Edit428: TEdit;
    Edit429: TEdit;
    Edit430: TEdit;
    Memo5: TMemo;
    Edit431: TEdit;
    CheckBox336: TCheckBox;
    GroupBox32: TGroupBox;
    GroupBox241: TGroupBox;
    Edit432: TEdit;
    GroupBox242: TGroupBox;
    Label672: TLabel;
    Edit433: TEdit;
    Edit434: TEdit;
    GroupBox243: TGroupBox;
    Label673: TLabel;
    Label674: TLabel;
    Edit435: TEdit;
    Edit436: TEdit;
    GroupBox244: TGroupBox;
    Label675: TLabel;
    Label676: TLabel;
    GroupBox245: TGroupBox;
    Label677: TLabel;
    Label678: TLabel;
    Edit437: TEdit;
    Edit438: TEdit;
    Edit439: TEdit;
    Edit440: TEdit;
    GroupBox246: TGroupBox;
    Label679: TLabel;
    Label680: TLabel;
    Button41: TButton;
    Edit441: TEdit;
    Edit442: TEdit;
    btnWrCFGSAS: TButton;
    RdCFGSAS: TButton;
    GroupBox247: TGroupBox;
    Label681: TLabel;
    Label682: TLabel;
    Edit443: TEdit;
    Edit444: TEdit;
    GroupBox248: TGroupBox;
    Label683: TLabel;
    GroupBox249: TGroupBox;
    Label684: TLabel;
    Label685: TLabel;
    Edit445: TEdit;
    Edit446: TEdit;
    Label686: TLabel;
    GroupBox250: TGroupBox;
    GroupBox251: TGroupBox;
    CheckBox338: TCheckBox;
    CheckBox339: TCheckBox;
    Edit447: TEdit;
    Edit448: TEdit;
    Edit454: TEdit;
    GroupBox252: TGroupBox;
    CheckBox344: TCheckBox;
    CheckBox345: TCheckBox;
    Edit455: TEdit;
    Edit456: TEdit;
    Button78: TButton;
    Edit449: TEdit;
    Label688: TLabel;
    GroupBox1105: TGroupBox;
    Label646: TLabel;
    Label647: TLabel;
    Edit415: TEdit;
    Label648: TLabel;
    Edit416: TEdit;
    Edit417: TEdit;
    Label649: TLabel;
    Label650: TLabel;
    Label651: TLabel;
    Edit419: TEdit;
    Edit420: TEdit;
    Edit421: TEdit;
    GroupBox1106: TGroupBox;
    Label368: TLabel;
    Label370: TLabel;
    Edit145: TEdit;
    Label456: TLabel;
    Label442: TLabel;
    GroupBox125: TGroupBox;
    Label435: TLabel;
    Edit187: TEdit;
    Label652: TLabel;
    Label653: TLabel;
    Edit422: TEdit;
    Edit423: TEdit;
    Label654: TLabel;
    Label655: TLabel;
    Label656: TLabel;
    Label657: TLabel;
    Label658: TLabel;
    Label659: TLabel;
    Edit450: TEdit;
    Label660: TLabel;
    Label661: TLabel;
    Edit451: TEdit;
    CheckBox341: TCheckBox;
    Edit452: TEdit;
    Label687: TLabel;
    CheckBox342: TCheckBox;
    Edit453: TEdit;
    Label689: TLabel;
    CheckBox343: TCheckBox;
    Edit457: TEdit;
    Label690: TLabel;
    CheckBox346: TCheckBox;
    Edit458: TEdit;
    Label691: TLabel;
    CheckBox347: TCheckBox;
    CheckBox348: TCheckBox;
    CheckBox349: TCheckBox;
    CheckBox350: TCheckBox;
    GroupBox1107: TGroupBox;
    _SelRoad_Grid: TStringGrid;
    Edit418: TEdit;
    GroupBox1116: TGroupBox;
    CheckBox340: TCheckBox;
    CheckBox337: TCheckBox;
    GroupBox1117: TGroupBox;
    GroupBox1118: TGroupBox;
    Label692: TLabel;
    Label693: TLabel;
    Label694: TLabel;
    GroupBox1119: TGroupBox;
    Label695: TLabel;
    Label696: TLabel;
    Label697: TLabel;
    rg3: TRadioGroup;
    CheckBox351: TCheckBox;
    CheckBox352: TCheckBox;
    CheckBox353: TCheckBox;
    Edit459: TEdit;
    Edit460: TEdit;
    Label698: TLabel;
    Label699: TLabel;
    CheckBox151: TCheckBox;
    Label700: TLabel;
    Edit461: TEdit;
    CheckBox26: TCheckBox;
    CheckBox35: TCheckBox;
    GroupBox1120: TGroupBox;
    CheckBox182: TCheckBox;
    Edit318: TEdit;
    CheckBox142: TCheckBox;
    GroupBox1121: TGroupBox;
    CheckBox354: TCheckBox;
    btn_GD1: TSpeedButton;
    CheckBox355: TCheckBox;
    btn_GD2: TSpeedButton;
    rg4: TRadioGroup;
    GroupBox1122: TGroupBox;
    CheckBox357: TCheckBox;
    CheckBox82: TCheckBox;
    GroupBox1124: TGroupBox;
    CheckBox247: TCheckBox;
    CheckBox248: TCheckBox;
    CheckBox249: TCheckBox;
    CheckBox250: TCheckBox;
    CheckBox251: TCheckBox;
    CheckBox252: TCheckBox;
    CheckBox255: TCheckBox;
    CheckBox262: TCheckBox;
    GroupBox1125: TGroupBox;
    Label246: TLabel;
    Edit142: TEdit;
    rg5: TRadioGroup;
    CheckBox106: TCheckBox;
    CheckBox115: TCheckBox;
    CheckBox63: TCheckBox;
    CheckBox109: TCheckBox;
    CheckBox122: TCheckBox;
    CheckBox111: TCheckBox;
    Label297: TLabel;
    Edit463: TEdit;
    Label701: TLabel;
    Edit464: TEdit;
    GroupBox1126: TGroupBox;
    Label543: TLabel;
    CheckBox245: TCheckBox;
    CheckBox246: TCheckBox;
    CheckBox275: TCheckBox;
    CheckBox244: TCheckBox;
    Edit347: TEdit;
    GroupBox1127: TGroupBox;
    CheckBox254: TCheckBox;
    CheckBox253: TCheckBox;
    CheckBox57: TCheckBox;
    GroupBox177: TGroupBox;
    CheckBox304: TCheckBox;
    CheckBox305: TCheckBox;
    CheckBox306: TCheckBox;
    GroupBox199: TGroupBox;
    Label566: TLabel;
    CheckBox237: TCheckBox;
    Edit342: TEdit;
    GroupBox1128: TGroupBox;
    CheckBox307: TCheckBox;
    Edit462: TEdit;
    Label702: TLabel;
    GroupBox1123: TGroupBox;
    CheckBox257: TCheckBox;
    CheckBox256: TCheckBox;
    Edit336: TEdit;
    Label703: TLabel;
    CheckBox41: TCheckBox;
    CheckBox264: TCheckBox;
    GroupBox103: TGroupBox;
    CheckBox265: TCheckBox;
    CheckBox266: TCheckBox;
    CheckBox172: TCheckBox;
    CheckBox236: TCheckBox;
    CheckBox133: TCheckBox;

    procedure FormCreate(Sender: TObject);
    procedure BtnQuitClick(Sender: TObject);
    procedure mQuitClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure BtnOtchetClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure mOtchetClick(Sender: TObject);
    procedure BtnStartClick(Sender: TObject);
    procedure BtnStopClick(Sender: TObject);
    procedure ButtonConnected;
    procedure viewInfo;
    procedure SaveVIN;
    procedure ViewVIN;
    procedure Clr_PasErrArray;
    procedure PressButton(Sender: TObject);
    procedure mParametrClick(Sender: TObject);
    procedure btnParametrClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure DrawGrid(PBox:TPaintBox);
    procedure StartRT_View;
    procedure DrawRoadTest(OffSet:Integer);
    procedure TestDIFClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure RoadTestBoxMouseMove(Sender: TObject; Shift: TShiftState; X,
                                   Y: Integer);
    procedure Select(Sender: TObject; ACol, ARow: Integer;
                     var CanSelect: Boolean);
    procedure EditATOnClick(Sender: TObject);
    procedure Label56Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    Procedure LoadMotoEEPROM(EEPROM_File:String);
    Procedure GetMotoRomCheckSum;
    procedure Button15Click(Sender: TObject);
    procedure ATMEL_EPROMEnter(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    Procedure LoadATMELInc(FilePath:String);
    procedure ATMEL_EPROMSetEditText(Sender: TObject; ACol, ARow: Integer;
                                     const Value: String);
    procedure Label69DblClick(Sender: TObject);
    procedure RoadTestBoxMouseDown(Sender: TObject; Button: TMouseButton;
                              Shift: TShiftState; X, Y: Integer);
    procedure Button18Click(Sender: TObject);

    procedure ChangeImage(Im:Byte; i : integer);
    procedure ViewError;
    procedure Osc_Deffinition;
    procedure Osc;
    procedure SensOsc;
    procedure SensOsc_Check;
    procedure CANOsc;
    procedure CANOsc_Read;
    procedure CANUSB_Read;
    procedure Button3Click(Sender: TObject);
    procedure DrawRoadTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure PageControl3Change(Sender: TObject);
    procedure EditAdrOssClick(Sender: TObject);
    procedure MotoGridOssClick(Sender: TObject);
    Procedure LoadMotoRAM;
    procedure Edit14Click(Sender: TObject);
    procedure KeyButtonClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Chart1ClickLegend(Sender: TChart; Button: TMouseButton;
                                Shift: TShiftState; X, Y: Integer);
    procedure LoadFileCar;
    procedure Label126Click(Sender: TObject);
    procedure Label70Click(Sender: TObject);
    procedure LampOsc;
    procedure LampABSClick(Sender: TObject);
    procedure LampASRClick(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnDelAllClick(Sender: TObject);
    procedure ParamChange(Sender: TObject);
    procedure TabSheet8Show(Sender: TObject);
    procedure Label156DblClick(Sender: TObject);
    procedure ReadNumber;
    procedure OscStartPos;
    procedure ViewCNT;
    procedure Button2Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure MotoGridOssKeyPress(Sender: TObject; var Key: Char);
    procedure PolyBtnClick(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure RoadTestEmul;
    procedure RoadAccelEmul;
    procedure CheckBox37Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure ComboBox6Change(Sender: TObject);
    procedure Button26Click(Sender: TObject);
    procedure Button27Click(Sender: TObject);
    procedure Button28Click(Sender: TObject);
    procedure Button29Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button30Click(Sender: TObject);
    procedure Button31Click(Sender: TObject);
    procedure PWMTestEmul;
    procedure Button32Click(Sender: TObject);
    procedure Button33Click(Sender: TObject);
    procedure Button35Click(Sender: TObject);
    procedure ProgStartClick(Sender: TObject);
    procedure DefConfigLoad;
    procedure DSCConfigLoad;
    procedure DumpMOT_to_DumpMOTcopy;
    procedure CheckSUM_DumpMOT;
    procedure DumpMOTcopy_to_DumpMOT;
    procedure ProgPit;
    procedure hk(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Timer2Timer(Sender: TObject);
    procedure Button39Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure TestButtonClick(Sender: TObject);
    procedure CheckBox22Click(Sender: TObject);
    procedure Button40Click(Sender: TObject);
    procedure LampVDCClick(Sender: TObject);
    procedure TestPulsClick(Sender: TObject);
    procedure Label263Click(Sender: TObject);
    procedure CalibrovkaDSCsenClick(Sender: TObject);
    procedure DSC_TestEnd;
    procedure VDC_Test_Reset;
    procedure AGSOsc;
    procedure Close_Form2;
    procedure CalibrovkaAccel;
    procedure PGM_Osc;
    procedure Button54Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Button55Click(Sender: TObject);
    function  ByteToHexStr(Bt:byte):string;
    procedure PA_Write;
    procedure Button56Click(Sender: TObject);
    procedure CheckBox45Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure TrailerOsc;
    procedure VDCTestVAROsc;
    procedure ConfigOsc;
    procedure CANVAROsc;
    procedure CAN_TCO_Osc;
    procedure CANfindOsc;
    procedure FormEnable;
    procedure FormDisable;
    procedure CheckBox135Click(Sender: TObject);
    procedure LProbegClick(Sender: TObject);
    procedure Button58Click(Sender: TObject);
    procedure Button57Click(Sender: TObject);
    procedure CheckBox140Click(Sender: TObject);
    procedure Button60Click(Sender: TObject);
    procedure Button61Click(Sender: TObject);
    procedure Button65Click(Sender: TObject);
    procedure Label20Click(Sender: TObject);
    procedure OkClick(Sender: TObject);
    procedure Label21Click(Sender: TObject);
    procedure Label513Click(Sender: TObject);
    procedure Button64Click(Sender: TObject);
    procedure Edit264Enter(Sender: TObject);
    procedure Button62Click(Sender: TObject);
    procedure TabSheet8Exit(Sender: TObject);
    procedure TabSheet8Enter(Sender: TObject);
    procedure PageControl2Change(Sender: TObject);
    procedure PageControl4Change(Sender: TObject);
    procedure CheckBox227Click(Sender: TObject);
    procedure rg1Click(Sender: TObject);
    procedure Edit27Click(Sender: TObject);
    procedure Edit22Click(Sender: TObject);
    procedure Edit175Click(Sender: TObject);
    procedure Edit343Click(Sender: TObject);
    procedure Button66Click(Sender: TObject);
    procedure Button67Click(Sender: TObject);
    procedure Button68Click(Sender: TObject);
    procedure Button69Click(Sender: TObject);
    procedure Edit229Change(Sender: TObject);
    procedure Button70Click(Sender: TObject);
    procedure Button71Click(Sender: TObject);
    procedure Button72Click(Sender: TObject);
    procedure Button73Click(Sender: TObject);
    procedure rg5Click(Sender: TObject);
    procedure Test2Click(Sender: TObject);
    procedure UpGradeClick(Sender: TObject);
    procedure Edit378DblClick(Sender: TObject);
    procedure Edit374DblClick(Sender: TObject);
    procedure Edit379DblClick(Sender: TObject);
    procedure USBopenClick(Sender: TObject);
    procedure Test1Click(Sender: TObject);
    procedure Test3Click(Sender: TObject);
    procedure Button80Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Edit384DblClick(Sender: TObject);
    procedure Button81Click(Sender: TObject);
    procedure ViewAGS;
    procedure ViewSAS;
    procedure View_AGS_CFG;
    procedure View_SAS_CFG;
    procedure RdCFG_AGS(A:integer);
    procedure RdCFG_SAS(A:integer);
    procedure WrCFGClick(Sender: TObject);
    procedure btnWrCFGSASClick(Sender: TObject);
    procedure ReadCRC_AGS;
    procedure RdCFGClick(Sender: TObject);
    procedure chk1Click(Sender: TObject);
    procedure Edit383DblClick(Sender: TObject);
    procedure GroupBox225DblClick(Sender: TObject);
    procedure Edit386DblClick(Sender: TObject);
    procedure Edit397DblClick(Sender: TObject);

    procedure View_SKU_CFG;
    procedure Dump_SKU_CFG;
    procedure ButtonXBR1Click(Sender: TObject);
    procedure  CheckBox_140;
    procedure Button77Click(Sender: TObject);
    procedure Highlight(TabSheet: TTabSheet);
    procedure PageControl5Change(Sender: TObject);
    procedure ButtonXBR2Click(Sender: TObject);
    procedure WrNumClick(Sender: TObject);
    procedure chk2Click(Sender: TObject);
    procedure Edit407Change(Sender: TObject);
    procedure CheckBox320Click(Sender: TObject);
    procedure Wr1Click(Sender: TObject);
    procedure PCB_Test;
    //procedure ELMbutClick(Sender: TObject);
    procedure _SelOss_GridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure CheckBox327Click(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure rg2Click(Sender: TObject);
    procedure Prop1Click(Sender: TObject);
    procedure SAS_FileClick(Sender: TObject);
    procedure CheckBox336Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure RdCFGSASClick(Sender: TObject);
    procedure Edit430DblClick(Sender: TObject);
    procedure Button41Click(Sender: TObject);
    procedure Edit438DblClick(Sender: TObject);
    procedure Button78Click(Sender: TObject);
    procedure CheckBox345Click(Sender: TObject);
    procedure Edit440DblClick(Sender: TObject);
    procedure CheckBox338Click(Sender: TObject);
    procedure Edit447Change(Sender: TObject);
    procedure TabSheet6Show(Sender: TObject);
    procedure Button76Click(Sender: TObject);
    procedure _SelRoad_GridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure rg3Click(Sender: TObject);
    procedure Label34DblClick(Sender: TObject);
    procedure btn_GD1Click(Sender: TObject);
    procedure btn_GD2Click(Sender: TObject);
    procedure CheckBox354Click(Sender: TObject);
    procedure CheckBox355Click(Sender: TObject);
    procedure rg4Click(Sender: TObject);

  private
    { Private declarations }

  public
     { Public declarations }

  end;
    function   DATAE(ConstName:string):integer;
    function   LoadIniFile: boolean;
    procedure  LoadABSIniFile;
    procedure  SaveABSIniFile;
    procedure  GetBytes(SearchString:String);
    function   Set_Security:boolean;
    procedure  FlashProtected;
    procedure  FlashUnProtected;
    procedure  WriteTrailerPress(Position:byte);
    function   CAN_SAE(B:integer):String;
    procedure  ReleOFF_After_Reset;
    procedure  ReleON_After_Reset;
    procedure  Kl15inh_Cnt_Clr;
    procedure  Kl15inh_Cnt_Set;
    procedure  Word_Row(Row:Integer;Str1,Str2,Str3:String);
    procedure  QffSetG(A:Integer;E:String);
    procedure  QffSetA(A:Integer;E:String);
    function   gQffSet(A:Integer):String;
    function   aQffSet(A:Integer):String;
    procedure  QffSetS(A:Integer;E:String);
    function   sQffSet(A:Integer):String;
    procedure  Init_ProgLoader(ChB:boolean);
    procedure  Init_ProgUpGrate(ChB:boolean);
    function   Load_STMbin_File(BinName:String):boolean;
    function MsgBox(const Text, Caption: string; Flags: Longint): Integer;
    //function GetClickedLegendIndex(Chart: TChart; X, Y: Integer): Integer;

var

  Form1 : TForm1;

  RoadTestBuf              : array[0..300000] of FileFrame;
  RoadTestBufNew           : array[0..300000] of FileFrameNew20;
  RoadTestBufOld           : array[0..300000] of FileFrameOld;
  RoadTestBufOld16         : array[0..300000] of FileFrameOld16;
  FF                       : File of FileFrame;
  FFnew                    : File of FileFrameNew20;
  FFold                    : File of FileFrameOld;
  FFold16                  : File of FileFrameOld16;
  Main_ComBufIn, Main_ComBufOut : ComBuf;


type
// DMath=double;
 DSave=single;
 DFloat=single;

implementation

uses
  ABSGlobal,
  ChPort, UnitViewError,
  Trash_Unit, Screen_Thread, Mod_Test, Com_Thread,
  Poly_Unit, paswrdUnit, Task_Progress, Queue, Unit5, Unit6, Unit9,
  Modification, Make_CFG, Authorized, UnitPCB;

{$R *.lfm}

procedure TForm1.FormCreate(Sender: TObject);
Var i:integer;
begin
 // BASS_Init(-1, 44100, 0, application.Handle, nil);
 //    geAutoScale(Form1);
     if not LoadIniFile then halt;//ABSini.ini
     Image_Err_Num:=20;
     if CheckBox45.Checked then  Memo3.Visible:= true
                           else  Memo3.Visible:= false;

     Fl_ClrErr_Message:=false;
     Fl_DefConfigLoad:=false;
     Fl_TabSheet8Show:=false;
     ProtokolMake:=false;
     Stend_Blok_SEl:=false;
     BtnOtchet.Enabled:=false;

     if DiagIni.ReadString('Version_DIA', 'Type_DIA', '') = 'Diag_Prof' then
     begin
       BtnOtchet.Enabled:=True;
       IndCod:=ParamCod;
       pswTrue := True;
       OscPage.TabVisible:=True;
       OscPos:=2;SenOscPos:=2;
       RoadTestInCount:=0;
       TabSheet1.TabVisible:=True;
       PageControl1Change(nil);
  //     btnParametr.ImageIndex:= 7;
              btnParametr.ImageIndex:= 4;
       btnParametr.Enabled := True;
       nParametr.Enabled := False;
       KeyButton.ImageIndex:= 6;
       KeyButton.Enabled:= True;
       GroupBox72.Visible:=True;
       GroupBox74.Visible:=True;
       LoadMotoConst_F:=False;
     end
     else
     begin
       IndCod:=ParamCod;  // íóæíî èíà÷å "is not a valid integer value'
       pswTrue := False;
       LoadMotoConst_F:=True;
       Change_NumBlock:=False;
       Form1.KeyButton.Visible:= False;
       Form1.BtnOtchet.Visible:= False;
       // íåâèäèìûå
       Form1.Pol.TabVisible:= False;          //Ïîëèãîí
       Form1.RoadTestPage.TabVisible:= False; // RoadTest
       Form1.TabSheet11.TabVisible:= False;   // CAN
       Form1.OscPage.TabVisible:= False;      // Îñöèëëîãðàô
       Form1.PropKl.TabVisible:= False;       // Ïðîï.êëàïàí
       Form1.TabSheet1.TabVisible:= False;    //EEPROM
       Form1.TabSheet12.TabVisible:= False;   // Programmer
       // íå ðåäàêòèðóåìûå
       Button2.Enabled:= False; //  Èíèöèàëèçàöèÿ íîìåðà
       TabSheet14.Enabled:= False;  // Íàñòðîéêà ÀSR
       TabSheet26.Enabled:= False;  // Íàñòðîéêà EBL
       TabSheet13.Enabled:= False;  // Íàñòðîéêà ABS
       TabSheet18.Enabled:= False;  // Íàñòðîéêà EBL

   //    TabSheet22.TabVisible:= False;  // Expert
        Form1.TabSheet25.Enabled :=false; //Êîíôèãóðàöèÿ
        Form1.TabSheet27.Enabled :=false; // Ïíåâìàòèêà
        Form1.TabSheet24.Enabled :=false; //  ABS
        Form1.TabSheet31.Enabled :=false; //  Validation
  //      Form1.TabSheet30.Highlighted :=false; //  UTIL
        Form1.TabSheet28.TabVisible :=false; //   Not Used
        Form1.TabSheet29.TabVisible :=false; //  AGS
  //      GroupBox240.Enabled :=false; //
  
  //     TabSheet9.TabVisible:= False;  // Êîíôèãóðàöèÿ
       RadioGroup7.Enabled:= False; // Êîíôèãóðàöèÿ Ìîäóëÿòîðîâ
       RadioGroup1.Enabled:= False; // Óïðàâëåíèå äâèãàòåëåì
       RadioGroup8.Enabled:= False; // òÿãà÷ ïðèöåï
       GroupBox28.Enabled:= False; // Ñòîï-ñèãíàë
       GroupBox34.Enabled:= False; // Ìîòîðíûé òîðìîç
       GroupBox52.Enabled:= False; // Áëîêèðîâêà äèôôåðåíöèàëà
       GroupBox43.Enabled:= False; //  Óïðàâëåíèå òÿãîâûì ìîìåíòîì
 //      GroupBox35.Visible:= False; //  Êàíàë CAN
       //Ïàðàìåòðû
//       GroupBox26.Enabled:= true; // Îãðàíè÷åíèå ñêîðîñòè
       RadioGroup5.Enabled:= False; // Íàïðÿæåíèå ïèòàíèÿ
       GroupBox36.Enabled:= False; //Ïíåâìàòèêà
 //      GroupBox32.Enabled:= False; //Ïíåâìîöèëèíäð
       // test EBL
       GroupBox144.Enabled:= False;  //Self Tuning
 //      GroupBox61.Visible:= False;  // Êàëèáðîâêà íóëÿ
 //      GroupBox215.Visible:= False;  // Êàëèáðîâêà AGS
       Button40.Enabled:= False; //Îòêðûòü ôîðìó Òåñò
 //      GroupBox39.Visible:= False;  // Pass Test
       GroupBox40.Visible:= False; //Act Test
       GroupBox115.Visible:= False; //Gear Box
       GroupBox109.Visible:= False; //Äàâëåíèå
       
     end;
     ABS_Poly:=True;
     fl_Security:=False;
     Com_Connected_F:=False;
     Cabel_F:=False;
     RepeatIni_F:=False;
     KeyByte1:=0;
     KeyByte2:=0;
     KeyByte3:=0;
     EEPROMSize:=Const_EEPROMSize_Old;
     OpenDialog1.InitialDir:=ExtractFileDir(Application.ExeName);
     Clr_PasErrArray;
     Osc_Deffinition;
//Ñîçäàåì ìàññèâ êíîïîê äëÿ äàëüíåéøåé ðàáîòû
     SbArray[0] := sb1;
     SbArray[1] := sb2;
     SbArray[2] := sb3;
     SbArray[3] := sb4;
     SbArray[4] := sb5;
     SbArray[5] := sb6;
     SbArray[6] := sb7;
     SbArray[7] := sb8;
     SbArray[8] := sb9;
     SbArray[9] := sb10;
     SbArray[10] := sb11;
     SbArray[11] := sb12;
     SbArray[12] := sb13;
     SbArray[13] := sb14;
     SbArray[14] := sb15;
     SbArray[15] := sb16;
     SbArray[16] := sb17;
     SbArray[17] := sb18;
     SbArray[18] := sb19;
     SbArray[19] := sb20;
     SbArray[20] := sb21;
     SbArray[21] := sb22;
     SbArray[22] := sb23;
     SbArray[23] := sb24;
     SbArray[24] := sb25;
     SbArray[25] := sb26;
     SbArray[26] := sb27;
     //äîáàâèòü SbArray[25] åñëè íîâûå SB
     for i:=0 to Const_Image_Err_New  do SbColorBuf[i]:=4;
     PageControl1.ActivePageIndex := 0;
     comqueue := TQueue.Create(comqueue);//Î÷åðåäü êîìàíä

     Form1.rg3.ItemIndex:=0; //MC1
end;

//***********************************************************
//Ïðîöåäóðû âûõîäà
procedure TForm1.BtnQuitClick(Sender: TObject);
begin
   Close;
end;

procedure TForm1.mQuitClick(Sender: TObject);
begin
   Close;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
   Close;
end;
//***********************************************************************

//Çàãðóçêà INI - ôàéëà
function LoadIniFile: boolean;
var
    sr: TSearchRec;
begin
 IniPath := ExtractFilePath(Application.ExeName);
 if (FindFirst((IniPath+'ABSIni.ini'), faAnyFile, sr) = 0) then
   begin
   DiagIni := TIniFile.Create( IniPath+'ABSIni.ini' );
   result := true;
   LoadABSIniFile;
   end
  else
   begin
   MsgBox( PChar('Ôàéë ABSIni.ini íå íàéäåí.'),
              'Îøèáêà', MB_OK+MB_ICONERROR+MB_APPLMODAL);
   form1.Opendialog1.InitialDir:=IniPath;
   form1.OpenDialog1.Filter:='ini|*.ini';
   if form1.Opendialog1.Execute and  FileExists('ABSIni.ini')
   then
   begin
   result := true;
//çàïèñàòü INI â íóæíóþ äèðåêòîðèþ
   CopyFile(PAnsiChar(UTF8Encode(form1.Opendialog1.FileName)),PAnsiChar(UTF8Encode(IniPath+'ABSIni.ini')),true);
//Çàãðóçêà INI - ôàéëà
   DiagIni := TIniFile.Create(form1.Opendialog1.FileName);
   LoadABSIniFile;
   end
   else   result := false;
   end;
end;

//Ìåíþ "Íàñòðîéêà\Ïóòü ê äàííûì"
procedure TForm1.N4Click(Sender: TObject);
begin
  // if Com_Connected_F then exit;
   //FormPath.ShowModal;
end;

//Êíîïêà "Ñîçäàòü îò÷åò"
procedure TForm1.BtnOtchetClick(Sender: TObject);
begin
   Form1.Wr1Click(nil);
  /// FormStend.Show;
end;

//Ìåíþ "Äèàãíîñòèêà\Ñîçäàòü îò÷åò"
procedure TForm1.mOtchetClick(Sender: TObject);
begin
   Form1.Wr1Click(nil);
   //FormProtocol.Show;
end;

//Ìåíþ "Íàñòðîéêà\Âûáîð ïîðòà"
procedure TForm1.N3Click(Sender: TObject);
begin
   if Com_Connected_F then begin
   exit;
   end
   else
   begin
   ChoicePort.ShowModal;
   end;
end;

//Ñîñòîÿíèå êíîïîê â çàâèñèìîñòè îò ñâîéñòâà CPort.Connected
procedure TForm1.ButtonConnected;
begin
   if Com_Connected_F then
      begin
         N3.Enabled:= false;
         BtnStart.Enabled := false;
         mStart.Enabled := false;
         BtnStop.Enabled := true;
         mStop.Enabled := true;
         btnParametr.Enabled := true;
         nParametr.Enabled := true;
         if DiagIni.ReadString('Version_DIA', 'Type_DIA', '') = 'Diag_Prof' then KeyButton.Enabled:=True;
      end
      else  begin
         N3.Enabled:= true;
         BtnStart.Enabled := true;
         BtnStart.Down := False;
         mStart.Enabled := true;
         BtnStop.Enabled := false;
         mStop.Enabled := false;
         if    IndCod<>ParamCod then  begin
         btnParametr.Enabled := false;
         nParametr.Enabled := false;
         end;
       if not pswTrue then KeyButton.Enabled := false;
     end;
end;


//Ñòàðò äèàãíîñòèêè
procedure TForm1.BtnStartClick(Sender: TObject);
var     i:integer;
begin
//Ñàðò äèàãíîñòèêè
   Form1.stat1.SimpleText:='';
   if Com_Connected_F then Exit;
   if BtnStart.Down then Exit;
   BtnStart.Down:=True;
   Screen.Cursor:=crHourGlass;
   MainStatBar.Panels[0].Text := 'Óñòàíîâêà ñâÿçè ñ áëîêîì ...';
   MainStatBar.Refresh;
   Com_Init;
   if not(Com_InitBlock) then
        begin
            BtnStart.Down:=False;
            MainStatBar.Panels[0].Text := 'Íå óäàëîñü óñòàíîâèòü ñâÿçü.';
            MainStatBar.Refresh;
            BtnStart.Enabled:=True;
            Com_Close;
            Screen.Cursor:=crArrow;
            Exit;
        end;
   if DiagIni.ReadString('Version_DIA', 'Type_DIA', '') = 'Diag_Prof'
   then KeyButton.Enabled:=True;
   Screen.Cursor:=crArrow;
   ButtonConnected; //Îáíîâëÿåì ñîñòîÿíèå êíîïîê è ïóíêòîâ ìåíþ

 //  ïðîâåðêà Âåðñèÿ äèàãíîñòè÷åñêîé ïðîãðàììû New!!
   if not (
      ((KeyByte1=KeyIni1) and (KeyByte2=70) and (KeyByte3=24)) or
      ((KeyByte1=KeyIni1) and (KeyByte2=KeyIni2) and (KeyByte3=KeyIni3)) or
      ((KeyByte1=nKeyIni1) and (KeyByte2=nKeyIni2) and (KeyByte3=nKeyIni3)) or
      ((KeyByte1=KeyIni1v8) and (KeyByte2=KeyIni2v8) and (KeyByte3=KeyIni3v8)) or
      ((KeyByte1=KeyIni1v9) and (KeyByte2=KeyIni2v9) and (KeyByte3=KeyIni3v9)) or
      ((KeyByte1=KeyIni1v10) and (KeyByte2=KeyIni2v10) and (KeyByte3=KeyIni3v10)))
   then
   begin
      Com_Connected_F :=false;
      Form1.BtnStopClick(nil);
      MainStatBar.Panels[0].Text := 'Ïðîáëåìû ñ Âåðñèåé äèàãíîñòè÷åñêîé ïðîãðàììû';
      MsgBox( 'Âåðñèÿ äèàãíîñòè÷åñêîé ïðîãðàììû íå ñîîòâåòñòâóåò âåðñèè áëîêà!',
            'Ïðåäóïðåæäåíèå', MB_OK+MB_ICONASTERISK+MB_APPLMODAL);
      exit;
   end;

   Form1.Timer1.Enabled:=true;
   DefConfigLoad;
   // NEW
   // âîçìîæíà íå çàãðóçêà DefConfig
   if not Fl_DefConfigLoad then Exit;
   DumpMOT_to_DumpMOTcopy;
   if Tip_Block < 8 then
   DumpATLoad(0,EEPROMSize);


   Form1.Timer1.Enabled:=true;
   // óñòàíàâëèâàåì Page Test Index:=0 ÷òîáû ðàáîòàë ComThread
   Form1.PageControl3.ActivePageIndex:=0;
     Fl_ProgROM:=false; // ðàçðåøàåì ïîòîê Com
     Fl_ProgS19:=false;
     Button2.Enabled:=True;
     Fl_ComThread :=true;  // ðàçðåøàåì  ïîòîê Com

     if   Com_Connected_F  then
     begin
                T1:=ComThread.Create(false);
                T1.Priority:=tpNormal;
                T2:=ScreenRefreshThread.Create(false);
                T2.Priority:=tpNormal;
     end;
     Fl_Message_VIN:=false;
     Vehicle_VIN_CFG_F9:= '';
     VIN_Model_F9:= '';

     // æäåì ÷òåíèÿ DSC_Flags4s
     if   Com_Connected_F  then
     repeat Application.ProcessMessages until FL_ReadVDCVAR;
     if (DSC_Flags4s and $10) <> 0  then
        Authorized_Cmpl:=true;
     Form1.View_SKU_CFG;  // äîëæíî ñòîÿòü TabSheet8Show
     Form1.TabSheet8Show(nil);

     if NumCh_Block = 6 then begin
         // Ìîäóëÿòîðû
         CheckBox46.Enabled:=true;  // Òðåòüÿ îñü ëåâûé
         CheckBox47.Enabled:=true;
         CheckBox46.Visible:=true;
         CheckBox47.Visible:=true;
         CheckBox46.Checked:=true;
         CheckBox47.Checked:=true;
         end else begin
         CheckBox46.Enabled:=false;
         CheckBox47.Enabled:=false;
         CheckBox46.Visible:=false;
         CheckBox47.Visible:=false;
     end;

    // ÷òåíèå äàò÷èêîâ ÑÊÓ òîëüêî Tip_Block 8 9
    if ((Tip_Block > 7) and (Tip_Block < 10)) then
    begin
     AGS_RdCFG_ProgressBar:=False;
     Form1.RdCFGClick(nil);
     if not Plata_SKU_DUE then
     Form1.RdCFGSASClick(nil);
     if AGS_CFG_ReadCmpl or SAS_CFG_ReadCmpl then
     begin
       Form1.GroupBox1117.Visible:=True;
       if AGS_CFG_ReadCmpl then
       begin
          Form1.GroupBox1118.Visible:=True;
          Form1.Label692.Caption:= 'Äåöèìàëüíûé íîìåð '+
                                     Form1.Edit393.Text;
          Form1.Label693.Caption:= 'Ñåðèéíûé Íîìåð      '+
                                 Form1.Edit396.Text+
                             '.'+Form1.Edit397.Text;
          Form1.Label694.Caption:= 'Âåðñèÿ ÏÎ  '+
                             Form1.Edit394.Text+'  CRC '+
                             Form1.Edit395.Text;
          Form1.GroupBox1119.Visible:=True;
          if SAS_CFG_ReadCmpl then
          begin
          Form1.Label695.Caption:= 'Äåöèìàëüíûé íîìåð '+
                                     Form1.Edit432.Text;
          Form1.Label696.Caption:= 'Ñåðèéíûé Íîìåð      '+
                                 Form1.Edit439.Text+
                             '.'+Form1.Edit440.Text;
          Form1.Label697.Caption:= 'Âåðñèÿ ÏÎ  '+
                             Form1.Edit437.Text+'  CRC '+
                             Form1.Edit438.Text;
          end
          else
          begin
            Form1.Label695.Caption:=
                  'Äåöèìàëüíûé íîìåð ÀÄÞÈ.402142.001';
            Form1.Label696.Caption:=
                'Ñåðèéíûé Íîìåð       Íåò èíôîðìàöèè';
            Form1.Label697.Visible:=False;
          end;
       end;
     end;
     AGS_RdCFG_ProgressBar:=True;
    end;
end;

procedure TForm1.CheckSUM_DumpMOT;
var
    i:integer;
    TempWord:Word;
begin
// KSUM
   TempWord:=0;
   for i:=0 to 125 do TempWord:=TempWord+DumpMOT[i];
   DumpMOT[126]:=Hi(TempWord);
   DumpMOT[127]:=Lo(TempWord);
// äëÿ Security
 //  DumpMOT0:=DumpMOT[0];
 //  DumpMOT7:=DumpMOT[7];
 //  DumpMOT126:=DumpMOT[126];
 //  DumpMOT127:=DumpMOT[127];
end;

procedure TForm1.DumpMOT_to_DumpMOTcopy;
var     i:integer;
begin
   for i:=0 to SizeDumpMOT do DumpMOTcopy[i]:=DumpMOT[i];
// äëÿ Security
   DumpMOT0:=DumpMOT[0];
   DumpMOT7:=DumpMOT[7];
   DumpMOT126:=DumpMOT[126];
   DumpMOT127:=DumpMOT[127];
end;

procedure TForm1.DumpMOTcopy_to_DumpMOT;
var     i:integer;
begin
    for i:=0 to SizeDumpMOT do DumpMOT[i]:=DumpMOTcopy[i];
// äëÿ Security
   DumpMOT0:=DumpMOT[0];
   DumpMOT7:=DumpMOT[7];
   DumpMOT126:=DumpMOT[126];
   DumpMOT127:=DumpMOT[127];    
end;

procedure TForm1.DSCConfigLoad;
begin
     if (DumpMOT[31] = 255) then Sens_Config:=15
                            else Sens_Config:=DumpMOT[31];
     if (DumpMOT[32] = 255) then Mod_Config:=15
                            else Mod_Config:=DumpMOT[32];
     if (DumpMOT[35] = 255) and
        (DumpMOT[36] = 255) and
        (DumpMOT[58] = 255) then
     begin
      DSC_Config_1:=0;
      DSC_Config_2:=0;
      DSC_Config_3:=0;
     end
     else
     begin
      DSC_Config_1:=DumpMOT[35];
      DSC_Config_2:=DumpMOT[36];
      DSC_Config_3:=DumpMOT[58];
     end;
end;

procedure TForm1.DefConfigLoad;
var     i:integer;
begin
  if Tip_Block < 8 then
  begin
     Link_ProcBufOut[2]:=HI($FFFE);
     Link_ProcBufOut[3]:=LO($FFFE);
     if Com_Link_Command(Moto_RD_RAM,Link_ProcBufOut,Link_ProcBufIn)
     then Program_Start:=Link_ProcBufIn[1]*256+Link_ProcBufIn[2]//;
     else Exit;
 // ÷òåíèå Adress_Ident.asm
     DumpMOTLoad(Program_Start,(Program_Start+16));
     if (((DumpMOT[3]*256+ DumpMOT[4])<> Program_Start) or
         ((DumpMOT[5]*256+ DumpMOT[6])<> (Program_Start+3))) then
     begin
        MsgBox( 'Âåðñèÿ äèàãíîñòè÷åñêîé ïðîãðàììû íå ñîîòâåòñòâóåò âåðñèè áëîêà! ',
            'Ïðåäóïðåæäåíèå', MB_OK+MB_ICONASTERISK+MB_APPLMODAL);
        exit;
     end;
     DumpMOTLoad(Program_Start,(Program_Start+128));
     DumpFlash_End:= Program_Start;
//  ; àäðåña
     DumpMOTStart:=DumpMOT[9]*256+ DumpMOT[10];
     DumpMOTEnd:=DumpMOT[13]*256+ DumpMOT[14];
     ConstStart:=DumpMOTEnd;
     adrCheckSumRom:=DumpMOT[15]*256+ DumpMOT[16];
     adrEEPROM_ATMEGA:=DumpMOT[19]*256+ DumpMOT[20];
//     adrPGMcnt:=DumpMOT[21]*256+ DumpMOT[22];

 //  ; êîíñòàíòû
     SpeedConst:=DumpMOT[29]*256*256+ DumpMOT[30]*256+ DumpMOT[31];
     W_Errors_Num:=DumpMOT[32];
     VER_PO:=DumpMOT[33];
     c_GapMulConst:=DumpMOT[34];
     Tip_CPU:=DumpMOT[35];
     Tip_Block:=DumpMOT[36]; // Òèï_Áëîêà 3 - ñòàðûé  4  - 2hcs  5 - ñ 2015
                             // 6 SKU_18  7 SKU_24
     NumCh_Block:=DumpMOT[37];
     V_PO_DZ:=IntToStr(DumpMOT[38]);
     if Tip_CPU = 21 then begin
           Image_Err_Num:=Const_Image_Err_New;
           EEPROMSize:=Const_EEPROMSize_New;
           NumberOsc:=NumberOsc_New;
           SizeFlashSector:= FlashSectorSize_New;
           ConstSectorNum:= round((Program_Start-DumpMOTStart)/SizeFlashSector)-2;
     end else begin
           Image_Err_Num:=Const_Image_Err_Old;
           EEPROMSize:=Const_EEPROMSize_Old;
           NumberOsc:=NumberOsc_Old;
           SizeFlashSector:= FlashSectorSize_Old;
           ConstSectorNum:=1;
     end;
     Form1.Label263Click(nil);
//  ; àäðåña ïåðåìåííûõ
    AdrLamp:=DumpMOT[43]*256+ DumpMOT[44];
    AdrPWM:=DumpMOT[45]*256+ DumpMOT[46];
    AdrSPI_In_Buff:=DumpMOT[47]*256+ DumpMOT[48];
    AdrRunaway_0:=DumpMOT[49]*256+ DumpMOT[50];
    AdrStop:=DumpMOT[51]*256+ DumpMOT[52];
    ATStatus:=DumpMOT[53]*256+ DumpMOT[54];
    Weel0_Error_Reg0:=DumpMOT[55]*256+ DumpMOT[56];
    W0_Presure_C:=DumpMOT[57]*256+ DumpMOT[58];
    CANAddress:=DumpMOT[59]*256+ DumpMOT[60];
    W0_Gap_Value:= DumpMOT[61]*256+ DumpMOT[62];
    Wheel0_Speed:= DumpMOT[63]*256+ DumpMOT[64];
    ADCDataBuffer:= DumpMOT[65]*256+ DumpMOT[66];
    GndD_On_Val:= DumpMOT[67]*256+ DumpMOT[68];
    Stend_Buf:= DumpMOT[69]*256+ DumpMOT[70];

    AGS_Buf_Adr:= DumpMOT[73]*256+ DumpMOT[74];
    Road_Sel_Adr:= DumpMOT[75]*256+ DumpMOT[76];
    adrPGMcnt:=DumpMOT[77]*256+ DumpMOT[78];
    adrFPROT:=DumpMOT[79]*256+ DumpMOT[80];    //  $1824
    adrMCGTRM:=DumpMOT[81]*256+ DumpMOT[82];   //  $004A
    adrNVFTRIM:=DumpMOT[83]*256+ DumpMOT[84];  //  $FFAE
    adrTRIM_PA_ICS_C3:=DumpMOT[85]*256+ DumpMOT[86];
    adrNVFTRIM_PA:=DumpMOT[87]*256+ DumpMOT[88];  //  $FF6E
    adrCRC32_MC3:=DumpMOT[89]*256+ DumpMOT[90];
    EBS22_Buf_Adr:=DumpMOT[91]*256+ DumpMOT[92];
    VDCTestVAR_Adr:=DumpMOT[93]*256+ DumpMOT[94];
    CAN_Buff_Adr:=DumpMOT[95]*256+ DumpMOT[96];
    TCO_Koef_Adr:=DumpMOT[97]*256+ DumpMOT[98];
    CAN_HDRH_Adr:=DumpMOT[99]*256+ DumpMOT[100];
    Adr_W2_Runaway_Buf:=DumpMOT[101]*256+ DumpMOT[102];
    Test_VAR5_Adr:=DumpMOT[103]*256+ DumpMOT[104];
    CAN_VAR4_Adr:=DumpMOT[105]*256+ DumpMOT[106];
    Adr_CAN_VIN_DA:=DumpMOT[107]*256+ DumpMOT[108];
    DiagTest_VAR_Adr:=DumpMOT[109]*256+ DumpMOT[110];
    AdrECUID_Dat0:=DumpMOT[111]*256+ DumpMOT[112];
    AdrDSC_Flags:=DumpMOT[113]*256+ DumpMOT[114];
    AdrPcb_Test_1:=DumpMOT[115]*256+ DumpMOT[116];
    Adr_BufRunaway:=$0240;
    CFG_OffSet_Dump:= 0;
 // àäðåñà â EEPROM

     DumpMOTLoad(adrEEPROM_ATMEGA,adrCheckSumRom+8);
   //  for i:=0 to W_Errors_Num do NumBit_ErrByte[i]:=DumpMOT[i];
     for i:=0 to 25 do NumBit_ErrByte[i]:=DumpMOT[i];
 //    NumBit_ErrByte[26]:=NumBit_ErrByte[0];  //s_W4_Error
 //    NumBit_ErrByte[27]:=NumBit_ErrByte[1];
 //    NumBit_ErrByte[28]:=NumBit_ErrByte[0];
 //    NumBit_ErrByte[29]:=NumBit_ErrByte[1];
 //    NumBit_ErrByte[30]:=NumBit_ErrByte[0];  //MC3_System_Error
 //    NumBit_ErrByte[31]:=NumBit_ErrByte[11]; //s_Mod4_Error
 //    NumBit_ErrByte[32]:=NumBit_ErrByte[12];
 //    NumBit_ErrByte[33]:=NumBit_ErrByte[11];
 //    NumBit_ErrByte[34]:=NumBit_ErrByte[12];
  // àäðåñà â EEPROM
     Adr_PassEr_H:= DumpMOT[26]*256+ DumpMOT[27];
     Adr_TimeErr_H:= DumpMOT[28]*256+ DumpMOT[29];
     Adr_Last_Er_H:= DumpMOT[30]*256+ DumpMOT[31];
     Adr_CntErr_H:= DumpMOT[32]*256+ DumpMOT[33];
     Adr_CorrKdec_H:= DumpMOT[34]*256+ DumpMOT[35];

 // ÷òåíèå CheckSumRom
     DumpMOTLoad(adrCheckSumRom,adrCheckSumRom+8);
     CheckSumRom:=DumpMOT[0]*256*256+ DumpMOT[1]*256+ DumpMOT[2];
     Label114.Caption:=IntToStr(CheckSumRom div 65536)+'  '+
                IntToStr((CheckSumRom mod 65536) div 256)+'  '+
                IntToStr((CheckSumRom mod 65536) mod 256);
     CheckSumConst:=DumpMOT[3]*256*256+ DumpMOT[4]*256+ DumpMOT[5];
     Label289.Caption:=IntToStr(CheckSumConst div 65536)+'  '+
                IntToStr((CheckSumConst mod 65536) div 256)+'  '+
                IntToStr((CheckSumConst mod 65536) mod 256);

// ÷òåíèå êîíôèãóðàöèè Flash Mot
     DumpMOTLoad(DumpMOTStart,DumpMOTEnd);
     DumpMOT0:=DumpMOT[0];
     DumpMOT7:=DumpMOT[7];
     DumpMOT126:=DumpMOT[126];
     DumpMOT127:=DumpMOT[127];
     ADRE_Y_M:=DumpMOT[106];
     ADRE_M_M:=DumpMOT[107];
     ADRE_NH:=DumpMOT[108];
     ADRE_NL:=DumpMOT[109];
     Def_Config_3:=DumpMOT[30];//Upit

     Form1.DSCConfigLoad;

     if Tip_Block = 3 then begin
      TabSheet14.TabVisible:=false;
      TabSheet18.TabVisible:=false;
     end;
    if not LoadMotoConst_F then begin
        LoadMotoEEPROM(Const_File);
        LoadMotoConst_F:=true;
    end;
    Fl_DefConfigLoad:=True;
  end
  else
  begin
//  ; àäðåña ïåðåìåííûõ
     AdrLamp:= 1;
     AdrStop:= 2;
     AdrDSC_Flags:= 3;
     AdrECUID_Dat0:= 4;
     AdrECUID_Dat8:= 5;
     AdrPcb_Test_1:= 6;
     AdrCRC32_MC3:= 7;
     AdrRunaway_0:= 8;
     Adr_CAN_VIN:= 9;
     Adr_CAN_VIN8:= 10;
     Adr_CAN_VIN16:= 11;
     Adr_CAN_VIN24:= 12;
     Adr_SN:= 13;
     CAN_HDRH_Adr:= 14;
     CAN_VAR4_Adr:= 17;
     VDCTestVAR_Adr:= 20;
     Test_VAR5_Adr:= 24;
     Wheel0_Speed:= 29;
     W0_Gap_Value:= 30; //30 -31
     AGS_Buf_Adr:= 32;
     EBS22_Buf_Adr:= 34;
     CAN_Buff_Adr:= 35;
     TCO_Koef_Adr:= 36;
     Road_Sel_Adr:= 37;
     AdrPWM:= 38;
     TestPoint_Sel_Adr:= 39;
     AdrVarMDT_v8:= 40;//40 - 44

     ADCDataBuffer_v8:= 45;//not used

     DiagTest_VAR_Adr_v8:= 50; //DIA_Write_RAM
     Wheel5_Speed:= 51; //51 - 52

           Image_Err_Num:=Const_Image_Err_New;
           EEPROMSize:=Const_EEPROMSize_New;
           NumberOsc:=NumberOsc_New24;
           SizeFlashSector:= FlashSectorSize_New;
           ConstSectorNum:= 1;//round((Program_Start-DumpMOTStart)/SizeFlashSector)-2;

     Adr_PassEr_H:=  0;
     Adr_TimeErr_H:= 48;
     Adr_Last_Er_H:= 96;
     Adr_CntErr_H:=  112;
     Adr_CorrKdec_H:= 448;

     DumpMOTStart:=0;
     DumpMOTEnd:= 400;//160;//2048;
     CFG_OffSet_Dump:= -1;//35;
     c_GapMulConst:=18;
// ÷òåíèå êîíôèãóðàöèè Flash Mot
     DumpMOTLoad(DumpMOTStart,DumpMOTEnd);
     DumpMOT0:=DumpMOT[0];
     DumpMOT7:=DumpMOT[7];
     DumpMOT126:=DumpMOT[126];
     DumpMOT127:=DumpMOT[127];
     ADRE_Y_M:=DumpMOT[106];
     ADRE_M_M:=DumpMOT[107];
     ADRE_NH:=DumpMOT[108];
     ADRE_NL:=DumpMOT[109];
     ADRE_Lot_M:=DumpMOT[361];

     Def_Config_3:=DumpMOT[30];//Upit
     Sens_Config:=DumpMOT[31];
     Mod_Config:=DumpMOT[32];
     // WheelSens_Config
     if Sens_Config = 63
     then  NumCh_Block:= 6
     else  NumCh_Block:= 4;
     DSC_Config_1:=DumpMOT[35];
     DSC_Config_2:=DumpMOT[36];
     DSC_Config_3:=DumpMOT[58];
     DumpFlash_End:= 2048;
     Button10.Caption:='Running';
     Form1.PageControl3.TabIndex:=0;
     Fl_DefConfigLoad:=True;
  end;

end;

procedure TForm1.Clr_PasErrArray;
var     i:integer;
begin
    for  i := 0 to 32 do DumpEPROM[i] := 0;
end;

{function ADRE(EpromName:string):integer;
Var
  Poz,PozB:integer;
begin
  if  Pos(EpromName,EpromAdr)<>0 then
  begin
  Poz:=Pos(EpromName,EpromAdr);
  repeat  Inc(Poz);  until Copy(EpromAdr,Poz,1) = ' ';
  repeat  Inc(Poz);  until Copy(EpromAdr,Poz,1) <>' ';
  Poz:=Poz+3;
  repeat  Inc(Poz);  until Copy(EpromAdr,Poz,1) <>' ';
  PozB:=Poz;
  repeat  Inc(Poz);  until Copy(EpromAdr,Poz,1) ='H';
  ADRE:=StrToInt('$'+Copy(EpromAdr,PozB,Poz-PozB));
  end
  else begin
  MsgBox(('Àäðåñ íå ñóùåñòâóåò'),'Ïðåäóïðåæäåíèå',
                          mb_Ok+mb_IconAsterisk+mb_ApplModal);
  ADRE:=0;
     end;
end; }

function DATAE(ConstName:string):integer;
Var
  loop:integer;
  flfound:boolean;
begin
  flfound:=false;
  for loop:=1 to form1.ATMEL_EPROM.RowCount do
  if form1.ATMEL_EPROM.Cells[0,loop]=ConstName then begin
   DATAE:=StrToInt(form1.ATMEL_EPROM.Cells[1,loop]);
   flfound:=true;
  end;
  if not flfound then begin
  MsgBox(('Êîíñòàíòà íå ñóùåñòâóåò'),'Ïðåäóïðåæäåíèå',
                          mb_Ok+mb_IconAsterisk+mb_ApplModal);
  DATAE:=0;
  constnotfound:=true;
  end;
end;

//Ñòîï äèàãíîñòèêè
procedure TForm1.BtnStopClick(Sender: TObject);
begin
   Button10.Caption:='Paused';
   if Com_Connected_F then begin
     if Form3.Visible or RoadTest_Flag then Exit;
     T1.Terminate;
     T2.Terminate;
     Com_Connected_F:=False;
     Com_RealTime_F:=False;
     RepeatIni_F:=false;
     comqueue.QPointer := 0;
   end;
   Com_Close;
 //  comqueue.QPointer := 0;
   ButtonConnected;
   Memo2.Visible:=false;
   PolyProgress:=False;
   form1.PolyBtn.AllowAllUp:=true;
   form1.PolyBtn.Down:=false;
   form1.PolyBtn.Caption:='Ñòàðò';
   Poly_Abort_F:=false;
   Form1.Repaint;
   Clr_PasErrArray;
   ViewError;
   ViewInfo;
   LampOsc;
   LampASR.Down:=false;
   LampABS.Down:=false;
   Button1.Enabled:=false;
   Button2.Enabled:=false;
   LASRColor:=0;
   LABSColor:=0;
   LVDCColor:=0;
   TrackBar1.Position:=0;
   fl_PWM_Prop := false;
   Button30.Caption := 'Off';

end;

//*****************************************************************
procedure TForm1.ViewInfo;
var
  tmp1, tmp2, tmp3, tmp4, Str : string;
  Loop: integer;
begin
   if not Com_Connected_F then
       begin
          Label26.Caption := 'Íåò èíôîðìàöèè.';
          Label27.Caption := 'Íåò èíôîðìàöèè.';
          Label28.Caption := 'Íåò èíôîðìàöèè.';
          Label29.Caption := 'Íåò èíôîðìàöèè.';
          Label569.Caption := '';
          Label30.Caption := 'Íåò èíôîðìàöèè.';
          Label31.Caption := 'Íåò èíôîðìàöèè.';
          Label32.Caption := 'Íåò èíôîðìàöèè.';
          Label33.Caption := 'Íåò èíôîðìàöèè.';
          Label34.Caption := 'Íåò èíôîðìàöèè.';
          Label35.Caption := 'Íåò èíôîðìàöèè.';
          Label38.Caption := 'Íåò èíôîðìàöèè.';
          Label39.Caption := 'Íåò èíôîðìàöèè.';
          Label93.Caption := 'Íåò èíôîðìàöèè.';
          Label44.Caption := 'Íåò èíôîðìàöèè.';
          Label45.Caption := 'Íåò èíôîðìàöèè.';
          Label46.Caption := 'Íåò èíôîðìàöèè.';
          Label47.Caption := 'Íåò èíôîðìàöèè.';
          Label52.Caption := 'Íåò èíôîðìàöèè.';
          Label53.Caption := 'Íåò èíôîðìàöèè.';
          Label54.Caption := 'Íåò èíôîðìàöèè.';
          Label55.Caption := 'Íåò èíôîðìàöèè.';
          Label146.Caption := 'Íåò èíôîðìàöèè.';
          Label148.Caption := 'Íåò èíôîðìàöèè.';
          Label156.Caption := 'Íåò èíôîðìàöèè.';
          Label161.Caption := 'Íåò èíôîðìàöèè.';
          Label163.Caption := 'Íåò èíôîðìàöèè.';
          Label193.Caption := 'Íåò èíôîðìàöèè.';
          Label514.Color:=clBtnFace;
          Label514.Caption := 'Íåò èíôîðìàöèè.';
          Label520.Color:=clBtnFace;
          Label520.Caption := 'Íåò èíôîðìàöèè.';
          Label569.Caption := '';
       //   Label627.Caption:= 'Äåöèìàëüíûé íîìåð   ';
          Label627.Caption:= '';
          Form1.Label643.Left:= 220;
          Form1.Label643.Caption:= '';
          Exit;
       end;
// Upit
    if Def_Config_3 = 255 then Label193.Caption := 'Íåò èíôîðìàöèè.'
    else
    begin
         if (Def_Config_3 and 1) = 1 then
                Label193.Caption := '12V'
         else   Label193.Caption := '24V';
  {       if (Def_Config_3 and $80) <> 0
         then  NumCh_Block := 6
         else  NumCh_Block := 4;  }
    end;
    if NumCh_Block = 4 then  GroupBox6.Caption:='Ýëåêòðîííûé áëîê 4S/4M';
    if NumCh_Block = 6 then  GroupBox6.Caption:='Ýëåêòðîííûé áëîê 6S/6M';

    // Äàòà èçãîòîâëåíèÿ
    tmp1 :=inttostr(ADRE_M_M );//Ìåñÿö âûïóñêà
    tmp2 :=inttostr(ADRE_Y_M );
    if length(tmp1) = 1 then  tmp1 := '0'+ tmp1 ;
    if length(tmp2) = 1 then  tmp2 := '0'+ tmp2 ;
    if tmp2 <>'00' then Label28.Caption := tmp1 + '.20' + tmp2;
    tmp3 := tmp1 + '.' +tmp2 + '.';
    // íîìåð
    tmp2 := inttostr(ADRE_NH*256 + ADRE_NL);
    case length(tmp2) of
     1: tmp2 := '0000' + tmp2;
     2: tmp2 := '000' + tmp2;
     3: tmp2 := '00' + tmp2;
     4: tmp2 := '0' + tmp2;
    end;
    ADRE_Lot_M:=DumpMOT[361];
    if ADRE_Lot_M < 255 then
    begin
      tmp4 := inttostr(ADRE_Lot_M);
  {     case length(tmp4) of
        1: tmp4 := '00' + tmp4;
        2: tmp4 := '0' + tmp4;
       end;}
      if length(tmp4) = 1 then  tmp4 := '0'+ tmp4 ;
        tmp4 := tmp4 + '.';
      tmp3 := tmp3+ tmp4 + tmp2;
    end
    else
    begin
      tmp3 := tmp3 + tmp2;
    end;
    Label26.Caption := tmp3;

    Label27.Caption := DiagIni.ReadString('Ïðîèçâîäèòåëü', 'name', '');
    if Fl_ReadFPROT then
    begin
    if Tip_Block < 8 then
    begin
     Label29.Caption := inttostr(VER_PO)+'.'+V_PO_DZ+'.'+V_PO_PA+'.'+V_PO_STM;//
     Label569.Caption :=inttostr(CheckSumRom)+'  '+CRC_PA+'  '+ CRC_STM;
    end
    else
    begin
     Label29.Caption := ECU_Ver_PO+'.'+ECU_PO_MC1+'.'+ECU_PO_MC2;//
     Label569.Caption :=PGM_CRC_MC1+'  '+PGM_CRC_MC2;
    end;
    end;
  //  Label569.Caption := CRC_PA;
  //  Label570.Caption := CRC_STM;
    //Äàòà ïîñëåäíåãî èçìåíåíèÿ ïàðàìåòðîâ áëîêà
    tmp1 := inttostr(DumpMOT[102]);//×èñëî
    tmp2 := inttostr(DumpMOT[101]);//Ìåñÿö
    tmp3 := inttostr(DumpMOT[100]);//Ãîä
    if length(tmp1) = 1 then  tmp1 := '0'+ tmp1;
    if length(tmp2) = 1 then  tmp2 := '0'+ tmp2;
    if length(tmp3) = 1 then  tmp3 := '0'+ tmp3;
    if (tmp1 <> '00') then Label31.Caption := tmp1 + '.' + tmp2 + '.20' + tmp3;

    //Êîä ëèöà ïðîâîäèâøåãî ïîñëåäíèå èçìåíåíèÿ ïàðàìåòðîâ áëîêà
    tmp1:= inttostr(DumpMOT[103]*65536 +
                    DumpMOT[104]*256 +
                    DumpMOT[105] );
    if (tmp1 <> '0') then Label30.Caption := tmp1;

    
    //Îáùàÿ íàðàáîòêà (ìîòî÷àñîâ)
    Label93.Caption := FloatToStrF(Work_Time,ffFixed, 6,1);
 {
    repeat Application.ProcessMessages until FL_ReadVDCVAR;
    if (DSC_Flags4s and $10) <> 0  then
    begin
     Authorized_Cmpl:=true;
    end;
    Form1.View_SKU_CFG;  // äîëæíî ñòîÿòü
 }
    if Fl_TabSheet8Show then
    ViewVIN;

    Label44.Caption:=NumSS1;
    Label45.Caption:=NumSS2;
    Label46.Caption:=NumSS3;
    Label47.Caption:=NumSS4;
    Label52.Caption:=NumMD1;
    Label53.Caption:=NumMD2;
    Label54.Caption:=NumMD3;
    Label55.Caption:=NumMD4;
    Label146.Caption:=NumPK;
    Label148.Caption:=NumDIF;
 //Îáùèé ïðîáåã
    Label34.Caption:=FloatToStrF(Runaway,ffFixed, 10,1);

      Str:='';
      for Loop:=1 to 15 do
      Str:=Str+Chr(ECUID_Data[Loop]);
      tmp1:= Chr(ECUID_Data[1]);
 //o     if (tmp1 = 'A') or (tmp1 = 'À') then
      begin
           Label627.Visible:=True;
           Decimal_Number:=Str;
           Label627.Caption:= 'Äåöèìàëüíûé íîìåð   '+Str;
      end
 //o     else Label627.Caption:= '';

 //Ïðîáåã ïîñëå ïîñëåäíåãî ÒÎ
 {   tmp1:= inttostr(DumpEPROM[ADRE('ADR_CNTD_TO')+2]*65536 +
                    DumpEPROM[ADRE('ADR_CNTD_TO')+1]*256 +
                    DumpEPROM[ADRE('ADR_CNTD_TO')] );
    if (tmp1 <> '0') then Label35.Caption := tmp1;
   //çàìåäëåíèå
    n:=DumpEPROM[ADRE('ADR_POINT_DEC')];
    tmp1:= inttostr(DumpEPROM[n*3+BaseDec]) +','+
           inttostr(DumpEPROM[n*3+BaseDec+1]) +
           inttostr(DumpEPROM[n*3+BaseDec+2])+' ì/ñ2';
    if (tmp1<>'0,00 ì/ñ2')  and (DumpEPROM[n*3+BaseDec]<9)
              then  Label156.Caption := tmp1
              else  Label156.Caption := 'Íåò èíôîðìàöèè.';
    if (not Memo2.Visible) or
       (PointDec<>DumpEPROM[ADRE('ADR_POINT_DEC')]) then
    begin
    Memo2.Clear;
    Memo2.SelStart:=0;
    PointDec:=DumpEPROM[ADRE('ADR_POINT_DEC')];
    for n:=0 to 9 do begin
    tmp1:= inttostr(DumpEPROM[PointDec*3+BaseDec]) +','+
           inttostr(DumpEPROM[PointDec*3+BaseDec+1]) +
           inttostr(DumpEPROM[PointDec*3+BaseDec+2])+' ì/ñ2';
    Memo2.Lines.Add(inttostr(n)+'  '+ tmp1);
    dec(PointDec);
    if PointDec=255 then PointDec:=9;
                     end;
     //Memo2.SelStart:=0;

    end; }
//ñòîï ñèãíàë
 {        if (DumpMOT[7] and 4)=4 then
                        Label163.Caption:=IntToStr(StopCNT+
                        DumpEPROM[ADRE('BADR_CNTBP')+2]*65536 +
                        DumpEPROM[ADRE('BADR_CNTBP')+1]*256 +
                        DumpEPROM[ADRE('BADR_CNTBP')] )
                                 else
                        Label163.Caption := 'Íåò èíôîðìàöèè.';
//çàìåäëåíèå
   if  DumpEPROM[ADRE('ADR_1_DEC')]<9 then begin
    tmp1:= inttostr(DumpEPROM[ADRE('ADR_1_DEC')]) +','+
           inttostr(DumpEPROM[ADRE('ADR_2_DEC')]) +
           inttostr(DumpEPROM[ADRE('ADR_3_DEC')]) +' ì/ñ2';
    if (tmp1<>'0,00 ì/ñ2')  then  Label161.Caption := tmp1;
    end
    else Label161.Caption := 'Íåò èíôîðìàöèè.'; }
end; //END procedure TForm1.viewInfo
//*****************************************************************

//Íàæàòà îäíà èç êíîïîê
procedure TForm1.PressButton(Sender: TObject);
var
   i : integer;
begin
   FormError.btnQuitClick(nil);
//Ïðîâåðÿåì êàêàÿ èç êíîïîê íàæàòà
   for i := 0 to Image_Err_Num do
    if SbArray[i].Down then
      begin
         SbArray[i].Down := false;
//Íîìåð íàæàòîé êíîïêè ïåðåäàåì â ôîðìó FormError ÷åðåç ñâîéñòâî Tag
         FormError.Tag := i;
         FormError.Caption := DiagIni.ReadString('B'+IntToStr(i), 'name', '');
         FormError.Show;//Modal;
      end;
end;
//********************************************************************
//Ïàðàìåòðèçàöèÿ ñèñòåìû
procedure TForm1.mParametrClick(Sender: TObject);
begin
   Form1.btnParametrClick(nil);
end;

procedure TForm1.btnParametrClick(Sender: TObject);
begin
   AuthorizedForm.FormShow(nil);
end;
//********************************************************************

procedure TForm1.PageControl1Change(Sender: TObject);
var
  Loop, Rows: Integer;
begin
   Form1.TabSheet8.Highlighted :=false;
   Pcb_Test_Disable:=false;
     if Not(Com_Connected_F) then  Exit;
     Com_RealTime_F:=False;
     T2.Priority:=tpNormal;
     T1.Priority:=tpNormal;
     case PageControl1.ActivePage.PageIndex of
      0: ViewInfo;
      //
      1: TabSheet8Show(nil);

      2: begin
         str_comb3:= Form1.ComboBox3.Text;
         if Form1.ComboBox3.Text ='' then   LoadFileCar;    // *.car     poly
         end;
      3: begin
          if RoadTest_Flag then begin
                        MainStatBar.Panels[0].Text := 'Èäóò äîðîæíûå èñïûòàíèÿ';
          end
          else
            begin
               StartRT_View;
               MainStatBar.Panels[0].Text := 'Ê äîðîæíûì èñïûòàíèÿì ÃÎÒÎÂ.';
               Label85.Caption:=OpenDialog1.FileName;
            end;
          MainStatBar.Refresh;
         end;
     4:  begin
          PageControl3Change(Sender);
         end;
      5: begin
          if  NumberOsc = NumberOsc_Old then begin
            Form1.Edit14.Visible:=false;
            Form1.Edit15.Visible:=false;
            Form1.Edit16.Visible:=false;
            Form1.Edit17.Visible:=false;
            Form1.Edit88.Visible:=false;
            Form1.Edit89.Visible:=false;
            Form1.Edit90.Visible:=false;
            Form1.Edit91.Visible:=false;
            Form1.CheckBox86.Visible:=false;
            Form1.CheckBox87.Visible:=false;
            Form1.CheckBox88.Visible:=false;
            Form1.CheckBox89.Visible:=false;
            Form1.CheckBox100.Visible:=false;
            Form1.CheckBox101.Visible:=false;
            Form1.CheckBox102.Visible:=false;
            Form1.CheckBox103.Visible:=false;
            Form1.Label259.Visible:=false;
            Form1.Label260.Visible:=false;
            Form1.Label261.Visible:=false;
            Form1.Label262.Visible:=false;
            Form1.Label279.Visible:=false;
            Form1.Label280.Visible:=false;
            Form1.Label281.Visible:=false;
            Form1.Label282.Visible:=false;
            Form1.Label263.Caption:='Old road File';
          end else begin
          if  NumberOsc = NumberOsc_Old16 then begin
            Form1.Edit14.Visible:=true;
            Form1.Edit15.Visible:=true;
            Form1.Edit16.Visible:=true;
            Form1.Edit17.Visible:=true;
            Form1.Edit88.Visible:=false;
            Form1.Edit89.Visible:=false;
            Form1.Edit90.Visible:=false;
            Form1.Edit91.Visible:=false;

            Form1.CheckBox86.Visible:=true;
            Form1.CheckBox87.Visible:=true;
            Form1.CheckBox88.Visible:=true;
            Form1.CheckBox89.Visible:=true;
            Form1.CheckBox100.Visible:=false;
            Form1.CheckBox101.Visible:=false;
            Form1.CheckBox102.Visible:=false;
            Form1.CheckBox103.Visible:=false;

            Form1.Label259.Visible:=true;
            Form1.Label260.Visible:=true;
            Form1.Label261.Visible:=true;
            Form1.Label262.Visible:=true;
            Form1.Label279.Visible:=false;
            Form1.Label280.Visible:=false;
            Form1.Label281.Visible:=false;
            Form1.Label282.Visible:=false;
            Form1.Label263.Caption:='Old16 road File';
          end else
            Form1.Edit14.Visible:=true;
            Form1.Edit15.Visible:=true;
            Form1.Edit16.Visible:=true;
            Form1.Edit17.Visible:=true;
            Form1.Edit88.Visible:=true;
            Form1.Edit89.Visible:=true;
            Form1.Edit90.Visible:=true;
            Form1.Edit91.Visible:=true;

            Form1.CheckBox86.Visible:=true;
            Form1.CheckBox87.Visible:=true;
            Form1.CheckBox88.Visible:=true;
            Form1.CheckBox89.Visible:=true;
            Form1.CheckBox100.Visible:=true;
            Form1.CheckBox101.Visible:=true;
            Form1.CheckBox102.Visible:=true;
            Form1.CheckBox103.Visible:=true;

            Form1.Label259.Visible:=true;
            Form1.Label260.Visible:=true;
            Form1.Label261.Visible:=true;
            Form1.Label262.Visible:=true;
            Form1.Label279.Visible:=true;
            Form1.Label280.Visible:=true;
            Form1.Label281.Visible:=true;
            Form1.Label282.Visible:=true;
            if  NumberOsc = NumberOsc_New
            then Form1.Label263.Caption:='New road File'
            else Form1.Label263.Caption:='New 24 road File';
          end;
          if Tip_Block < 8 then
           begin
             Rows:= StrToInt(DiagIni.ReadString('Selector_Oss_Old','N','35'));
             Form1._SelOss_Grid.RowCount:=Rows;
             Form1._SelOss_Grid.ColWidths[1]:=60;
             for Loop:=0 to Rows do
             begin
               Form1._SelOss_Grid.Cells[0,Loop]:=IntToStr(Loop);
               Form1._SelOss_Grid.Cells[1,Loop]:=DiagIni.ReadString('Selector_Oss_Old',
                                                         IntToStr(Loop),'');
             end;
           end
           else
           begin
             Rows:= StrToInt(DiagIni.ReadString('Selector_Oss','N','15'));
             Form1._SelOss_Grid.RowCount:=Rows;
             Form1._SelOss_Grid.ColWidths[1]:=60;
             for Loop:=0 to Rows do
             begin
               Form1._SelOss_Grid.Cells[0,Loop]:=IntToStr(Loop);
               Form1._SelOss_Grid.Cells[1,Loop]:=DiagIni.ReadString('Selector_Oss',
                                                         IntToStr(Loop),'');
             end;
             if StrToInt(Form1.Edit100.Text) = 0 then
             begin
               Form1.GroupBox1107.Visible:=True;
               Form1.Edit418.Visible:= True;
               // Form1._SelRoad_Grid.Visible:=True;
                Rows:= StrToInt(DiagIni.ReadString('RoadTest_VAR','N','15'));
               Form1._SelRoad_Grid.RowCount:=Rows;
               Form1._SelRoad_Grid.ColWidths[1]:=60;
               for Loop:=0 to Rows do
               begin
                Form1._SelRoad_Grid.Cells[0,Loop]:=IntToStr(Loop);
                Form1._SelRoad_Grid.Cells[1,Loop]:=DiagIni.ReadString('RoadTest_VAR',
                                                         IntToStr(Loop),'');
               end;
             end
             else
             begin
                Form1.GroupBox1107.Visible:=False;
                Form1.Edit418.Visible:=False;
             end;
           end;
          DrawGrid(OscBox);
          OscStartPos;
         end;
     6:  begin
         EEPROM.ActivePageIndex:=0;
         end;
     7:  begin
            Form1.TabSheet8.Highlighted :=true;
         end;
     8:  begin    // Programmer
             Form1.CheckBox45Click(nil);
  //           Fl_ProgStart:=false;
         end;
     end;
end;

Procedure TForm1.DrawGrid;
var Loop,XStep,YStep:Integer;
begin
     XStep:=25;
     YStep:=25;
     PBox.Canvas.Pen.Style:=psDot;
     PBox.Canvas.Pen.Width:=1;
     PBox.Canvas.Pen.Color:=$ffffff0;
     PBox.Repaint;
     for Loop:=0 to 24 do
     begin
          PBox.Canvas.MoveTo(Loop*XStep,0);
          PBox.Canvas.LineTo(Loop*XStep,OscBox.Height);
     end;
     for Loop:=0 to 10 do
     begin
          PBox.Canvas.MoveTo(0,OscBox.Height-1-Loop*YStep);
          PBox.Canvas.LineTo(OscBox.Width,OscBox.Height-1-Loop*YStep);
     end;
     PBox.Canvas.MoveTo(0,0);
     PBox.Canvas.LineTo(OscBox.Width,0);
     PBox.Canvas.Pen.Style:=psSolid;
end;

procedure TForm1.TestDIFClick(Sender: TObject);
begin
     if  not Com_Connected_F then  exit;
     if TestDIF.Down then TestDIF.Caption:= 'Âûêëþ÷èòü'
                     else TestDIF.Caption:= 'Âêëþ÷èòü';
     AdrTestDIF:=AdrLamp+1;
     if TestDIF.Down then  begin
                           DatTestDIF:=6;
                           FormIso.TestDIF_Kl;
                           end
                     else  begin
                           DatTestDIF:=4;
                           FormIso.TestDIF_Kl;
                           end;
end;


procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     SaveABSIniFile;
     BtnStopClick(Sender);
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
     if not Com_Connected_F then Exit;
     RoadTest_Flag:=False;
     FormISO.DownLoadOscAddress;
     MainStatBar.Panels[0].Text := 'Ýìóëÿöèÿ äîðîæíûõ èñïûòàíèé.';
     MainStatBar.Refresh;
     EmulCount:=0;
     SinxrEmul:=false;
     RoadEmul_Flag:=true;
     EmulAccel:=false;//true;
end;

procedure TForm1.RoadAccelEmul;
begin
        SinxrEmul:=false;
        W1:=round(RoadTestBuf[0].Osc[0]*16*EmulCount/300);
        W2:=round(RoadTestBuf[0].Osc[3]*16*EmulCount/300);
        W3:=round(RoadTestBuf[0].Osc[6]*16*EmulCount/300);
        W4:=round(RoadTestBuf[0].Osc[9]*16*EmulCount/300);
        inc(EmulCount);
        if EmulCount > 300 then
        begin
           EmulCount:=0;
           EmulAccel:=true;//false;
        end;
end;

procedure TForm1.RoadTestEmul;
var
   Temp1: integer;
begin
        SinxrEmul:=false;
        Temp1:=0;
        W1:=(RoadTestBuf[EmulCount].Osc[0]+Temp1)*16;
        W2:=(RoadTestBuf[EmulCount].Osc[3]+Temp1)*16;
        W3:=(RoadTestBuf[EmulCount].Osc[6]+Temp1)*16;
        W4:=(RoadTestBuf[EmulCount].Osc[9]+Temp1)*16;
        if Form1.CheckBox104.Checked then
             PrBr:= RoadTestBuf[EmulCount].Osc[10]
        else
        begin
           if Form1.CheckBox132.Checked then
                 PrBr:= RoadTestBuf[EmulCount].Osc[10] //Osc[4]
           else  PrBr:= 0;
        end;
        DSC_Akker:= RoadTestBuf[EmulCount].Osc[12];
        DSC_OmegaZ:= RoadTestBuf[EmulCount].Osc[13];
        DSC_AccY:= RoadTestBuf[EmulCount].Osc[14];
        DSC_AccX:= RoadTestBuf[EmulCount].Osc[15];
        if CheckBox15.Checked then RoadTestBuf[EmulCount].Osc[2]:=Oss1;
        if CheckBox16.Checked then RoadTestBuf[EmulCount].Osc[5]:=Oss2;
        if CheckBox19.Checked then RoadTestBuf[EmulCount].Osc[8]:=Oss3;
        if CheckBox22.Checked then RoadTestBuf[EmulCount].Osc[11]:=Oss4;
        inc(EmulCount);
        if EmulCount > Trunc(RoadTestInCount) then
        begin
             RoadEmul_Flag:=False;
             TruckSim_Flag:=False;
             StartRT_View;
             if TruckSim_USB_Open then
             begin
                Com_Close;
                TruckSim_USB_Open:=false;
             end;
             MainStatBar.Panels[0].Text := 'Ýìóëÿöèÿ äîðîæíûõ èñïûòàíèé çàâåðøåíà.';
             MainStatBar.Refresh;
        end;
end;

procedure TForm1.Button5Click(Sender: TObject);
Var     TestFile:File of Byte;
        sr: TSearchRec;
        FString:String;
Label Label_End;
begin
     if not(Com_Connected_F) then
     begin
        Memo1.Lines.Add('Íå ìîãó çàïðîãðàììèðîâàòü EEPROM!!! Îòñóòñòâóåò ñâÿçü ñ áëîêîì.');
        Exit;
     end;
     // âûêëþ÷åíèå ðåëå ïîñëå Ðåñòàðòà
     ReleOFF_After_Reset;
     Kl15inh_Cnt_Set;

     Fl_ProgROM:=true;   // îñòàíîâêà îáìåíà â Com_Thread
     Fl_ProgS19:=false;
     Form1.Memo1.Clear;
     Button5.Enabled:=false;
     Form1.FormDisable; //çàïðåò Form1
     Form1.Memo1.Lines.Add('Cíÿòèå çàùèòû Flash');
// ñíÿòèå çàùèòû Flash
     Flash_UnProtected_All:=false; // Ïðîãðàììà çàùèùåíà
     Flash_UnProtected_CFG:=false;
     FlashUnProtected;
     Form1.Memo1.Lines.Add('Çàùèòà Flash ñíÿòà');
// ñíÿòèå Security â MC1 - DZ
     if not Set_Security  then  Exit;
// ñîõðàíÿåì EEPROM_Array â Const ôàéë
     Button15Click(Sender);
     if Label114.Caption<>IntToStr(EEPROM_Array[EEPROM_Size-6])+'  '+
                          IntToStr(EEPROM_Array[EEPROM_Size-5])+'  '+
                          IntToStr(EEPROM_Array[EEPROM_Size-4])
     then MsgBox( PChar('CheckSumRom íå ñîâïàäàåò ñ Const'),
                                  'Îøèáêà', MB_OK+MB_ICONERROR+MB_APPLMODAL)
     else
     if CheckSumRom <> 0 then
     begin
        Fl_WriteConst:=false;
        FormISO.Erase_EEPROM;
        FormISO.Write_EEPROM;
        repeat Application.ProcessMessages until Fl_WriteConst;
     end;
     if Fl_EPROM_Error then goto Label_End;
     // îøèáêa çàïèñè !!!

     Form1.Memo1.Lines.Add('Óñòàíîâêà çàùèòû Flash');
//Óñòàíîâêà çàùèòû Flash
     FlashProtected;
     if Fl_FlashProtect_Compleet then
     begin
        Form1.Memo1.Lines.Add('Çàùèòà Flash óñòàíîâëåíà');
        Form1.Memo1.Lines.Add('Çàâåðøåíî óñïåøíî!');
     end;
Label_End:
     Fl_ProgROM:=false; // ðàçðåøàåì ïîòîê Com
     Fl_ProgS19:=false;
// ñòèðàíèå îøèáîê
     FormISO.EraseError_EPROM;
// âêëþ÷åíèå ðåëå ïîñëå Ðåñòàðòà
     ReleON_After_Reset;
     Kl15inh_Cnt_Clr;
     Button5.Enabled:=true;
     Form1.FormEnable; //ðàçðåøåíèå Form1
end;

procedure TForm1.Button6Click(Sender: TObject);
Var
  Loop,LoopD: integer;
begin
     if not Com_Connected_F then Exit;
     if RoadTest_Flag then begin
        RoadTest_Flag:=False;
        Button6.Caption:='Start Test';
        Sleep(50);
        BlockWrite(FF,RoadTestBuf,RoadTestInCount);
        CloseFile(FF);
        if RoadTestInCount < 600 then begin
            for Loop:=RoadTestInCount to 600 do begin
               RoadTestBuf[Loop].TimerSynch:= 0;
               for LoopD:=0 to NumberOsc-1 do
                 RoadTestBuf[Loop].Osc[LoopD]:= 0;
            end;
        end;
        MainStatBar.Panels[0].Text := 'Äîðîæíûå èñïûòàíèÿ óñïåøíî çàâåðøåíû.';
        MainStatBar.Refresh;
        ScrollBar1.Enabled:=True;
        Form1.Label263Click(nil);
        StartRT_View;
     end else begin
        ScrollBar1.Enabled:=False;
        AssignFile(FF,Opendialog1.InitialDir+'\Temp.road');
        Rewrite(FF);
        RoadTestInCount:=0;
        Label85.Caption:='Temp.road';
        FormISO.DownLoadOscAddress;
        MainStatBar.Panels[0].Text := 'Èäóò äîðîæíûå èñïûòàíèÿ';
        MainStatBar.Refresh;
        Button6.Caption:='Stop Test';
        QueryPerformanceCounter(StartTimer_Value);
        QueryPerformanceFrequency(TimerFreq_Value);
        RoadTest_Flag:=True;

 //       NumberOsc:= NumberOsc_New;
        Form1.Label263Click(nil);
     end;
end;

Procedure TForm1.DrawRoadTest;
Var PolyOsc:Array[0..659] of TPoint;
    Loop,Loop0,GridStep:Integer;
begin
        FlPutFirst:=false;
        X1:=RoadTestBox.Width;
        RoadTestBox.Canvas.Pen.Mode:=pmCopy;
        RoadTestBox.Repaint;
        RoadTestBox.Canvas.Pen.Color:=$FFFFFF;
        RoadTestBox.Canvas.Pen.Width:=1;
        RoadTestBox.Canvas.Pen.Style:=psDot;
        For Loop:=0 to 659 do
        begin
                PolyOsc[Loop].x:=0;
                PolyOsc[Loop].y:=0;
        end;
        GridStep:=20;
        For Loop:=0 to 6 do
        begin
                PolyOsc[Loop*4+1].x:=0;
                PolyOsc[Loop*4+1].y:=GridStep+(2*GridStep*Loop);
                PolyOsc[Loop*4+2].x:=RoadTestBox.Width-1;
                PolyOsc[Loop*4+2].y:=GridStep+(2*GridStep*Loop);
                PolyOsc[Loop*4+3].x:=RoadTestBox.Width-1;
                PolyOsc[Loop*4+3].y:=2*GridStep*(Loop+1);
                PolyOsc[Loop*4+4].x:=0;
                PolyOsc[Loop*4+4].y:=2*GridStep*(Loop+1);
        end;
        PolyOsc[28].x:=RoadTestBox.Width-1;
        PolyOsc[28].y:=RoadTestBox.Height-1;
        PolyOsc[29].x:=0;
        PolyOsc[29].y:=RoadTestBox.Height-1;
        PolyOsc[31].x:=RoadTestBox.Width-1;
        PolyOsc[31].y:=0;
        PolyOsc[32].x:=RoadTestBox.Width-1;
        PolyOsc[32].y:=RoadTestBox.Height-1;
        PolyOsc[33].x:=0;
        PolyOsc[33].y:=RoadTestBox.Height-1;
        RoadTestBox.Canvas.Polyline(PolyOsc);

        Loop0:=StrToInt(Edit38.Text);
        PolyOsc[0].x:=0;
        PolyOsc[0].y:=0;
        for loop:=1 to 659 do
        begin
           PolyOsc[Loop].x:=Loop;
           if (RoadTestBuf[Loop+OffSet].TimerSynch div Loop0)<>
              (RoadTestBuf[Loop+OffSet-1].TimerSynch div Loop0) then
              begin
                PolyOsc[Loop-1].x:=Loop;
                if PolyOsc[Loop-1].y=0  then
                begin
                   PolyOsc[Loop].y:=RoadTestBox.Height-18;
                end
                else
                begin
                   PolyOsc[Loop].y:=0;
                end;
                if RoadTestBuf[Loop+OffSet].TimerSynch<>0 then
                   RoadTestBox.Canvas.TextOut(Loop-3*Trunc(1+Ln(RoadTestBuf[Loop+OffSet].TimerSynch)/Ln(10)),
                   RoadTestBox.Height-15,
                   IntToStr(RoadTestBuf[Loop+OffSet].TimerSynch));
              end
              else PolyOsc[Loop].y:=PolyOsc[Loop-1].y;
        end;
        RoadTestBox.Canvas.Pen.Color:=$FFFFFF;
        RoadTestBox.Canvas.Polyline(PolyOsc);
//        RoadTestBox.Canvas.Pen.Width:=2;
        RoadTestBox.Canvas.Pen.Width:=1;
        RoadTestBox.Canvas.Pen.Style:=psSolid;
// line 128
   //     RoadTestBox.Canvas.Pen.Color:=clWindowText;
        RoadTestBox.Canvas.MoveTo(0,132);
        RoadTestBox.Canvas.LineTo(659,132);

 For Loop0:=0 to NumberOsc-1 do
 begin
  For Loop:=0 to 659 do
   begin
   PolyOsc[Loop].x:=Loop;
   PolyOsc[Loop].y:=RoadTestBox.Height-RoadTestBuf[Loop+OffSet].Osc[Loop0]-17;
   end;
  case  Loop0 of
 0:if CheckBox13.Checked  then begin
        RoadTestBox.Canvas.Pen.Color:=Label56.Font.Color;
        For Loop:=1 to 659 do  begin
           RoadTestBox.Canvas.MoveTo(PolyOsc[Loop-1].x,PolyOsc[Loop-1].y);
           RoadTestBox.Canvas.LineTo(PolyOsc[Loop].x,PolyOsc[Loop].y);
           end;
        end;
 1:if CheckBox14.Checked  then begin
        RoadTestBox.Canvas.Pen.Color:=Label57.Font.Color;
        For Loop:=1 to 659 do  begin
           RoadTestBox.Canvas.MoveTo(PolyOsc[Loop-1].x,PolyOsc[Loop-1].y);
           RoadTestBox.Canvas.LineTo(PolyOsc[Loop].x,PolyOsc[Loop].y);
           end;
        end;
 2:if CheckBox15.Checked  then begin
        RoadTestBox.Canvas.Pen.Color:=Label58.Font.Color;
        For Loop:=1 to 659 do  begin
           RoadTestBox.Canvas.MoveTo(PolyOsc[Loop-1].x,PolyOsc[Loop-1].y);
           RoadTestBox.Canvas.LineTo(PolyOsc[Loop].x,PolyOsc[Loop].y);
           end;
        end;
 3:if CheckBox18.Checked  then begin
        RoadTestBox.Canvas.Pen.Color:=Label59.Font.Color;
        For Loop:=1 to 659 do  begin
           RoadTestBox.Canvas.MoveTo(PolyOsc[Loop-1].x,PolyOsc[Loop-1].y);
           RoadTestBox.Canvas.LineTo(PolyOsc[Loop].x,PolyOsc[Loop].y);
           end;
        end;
 4:if CheckBox17.Checked  then begin
        RoadTestBox.Canvas.Pen.Color:=Label60.Font.Color;
        For Loop:=1 to 659 do  begin
           RoadTestBox.Canvas.MoveTo(PolyOsc[Loop-1].x,PolyOsc[Loop-1].y);
           RoadTestBox.Canvas.LineTo(PolyOsc[Loop].x,PolyOsc[Loop].y);
           end;
        end;
 5:if CheckBox16.Checked  then begin
        RoadTestBox.Canvas.Pen.Color:=Label61.Font.Color;
        For Loop:=1 to 659 do  begin
           RoadTestBox.Canvas.MoveTo(PolyOsc[Loop-1].x,PolyOsc[Loop-1].y);
           RoadTestBox.Canvas.LineTo(PolyOsc[Loop].x,PolyOsc[Loop].y);
           end;
        end;
 6:if CheckBox21.Checked  then begin
        RoadTestBox.Canvas.Pen.Color:=Label62.Font.Color;
        For Loop:=1 to 659 do  begin
           RoadTestBox.Canvas.MoveTo(PolyOsc[Loop-1].x,PolyOsc[Loop-1].y);
           RoadTestBox.Canvas.LineTo(PolyOsc[Loop].x,PolyOsc[Loop].y);
           end;
        end;
 7:if CheckBox20.Checked  then begin
        RoadTestBox.Canvas.Pen.Color:=Label63.Font.Color;
        For Loop:=1 to 659 do  begin
           RoadTestBox.Canvas.MoveTo(PolyOsc[Loop-1].x,PolyOsc[Loop-1].y);
           RoadTestBox.Canvas.LineTo(PolyOsc[Loop].x,PolyOsc[Loop].y);
           end;
        end;
 8:if CheckBox19.Checked  then begin
        RoadTestBox.Canvas.Pen.Color:=Label64.Font.Color;
        For Loop:=1 to 659 do  begin
           RoadTestBox.Canvas.MoveTo(PolyOsc[Loop-1].x,PolyOsc[Loop-1].y);
           RoadTestBox.Canvas.LineTo(PolyOsc[Loop].x,PolyOsc[Loop].y);
           end;
        end;
 9:if CheckBox24.Checked  then begin
        RoadTestBox.Canvas.Pen.Color:=Label65.Font.Color;
        For Loop:=1 to 659 do  begin
           RoadTestBox.Canvas.MoveTo(PolyOsc[Loop-1].x,PolyOsc[Loop-1].y);
           RoadTestBox.Canvas.LineTo(PolyOsc[Loop].x,PolyOsc[Loop].y);
           end;
        end;
 10:if CheckBox23.Checked then begin
        RoadTestBox.Canvas.Pen.Color:=Label66.Font.Color;
        For Loop:=1 to 659 do  begin
           RoadTestBox.Canvas.MoveTo(PolyOsc[Loop-1].x,PolyOsc[Loop-1].y);
           RoadTestBox.Canvas.LineTo(PolyOsc[Loop].x,PolyOsc[Loop].y);
           end;
        end;
 11:if CheckBox22.Checked then begin
        RoadTestBox.Canvas.Pen.Color:=Label67.Font.Color;
        For Loop:=1 to 659 do  begin
           RoadTestBox.Canvas.MoveTo(PolyOsc[Loop-1].x,PolyOsc[Loop-1].y);
           RoadTestBox.Canvas.LineTo(PolyOsc[Loop].x,PolyOsc[Loop].y);
           end;
        end;
    12:if CheckBox90.Checked then begin
        RoadTestBox.Canvas.Pen.Color:=Label259.Font.Color;
        For Loop:=1 to 659 do  begin
           RoadTestBox.Canvas.MoveTo(PolyOsc[Loop-1].x,PolyOsc[Loop-1].y);
           RoadTestBox.Canvas.LineTo(PolyOsc[Loop].x,PolyOsc[Loop].y);
           end;
        end;
    13:if CheckBox91.Checked then begin
        RoadTestBox.Canvas.Pen.Color:=Label260.Font.Color;
        For Loop:=1 to 659 do  begin
           RoadTestBox.Canvas.MoveTo(PolyOsc[Loop-1].x,PolyOsc[Loop-1].y);
           RoadTestBox.Canvas.LineTo(PolyOsc[Loop].x,PolyOsc[Loop].y);
           end;
        end;
    14:if CheckBox92.Checked then begin
        RoadTestBox.Canvas.Pen.Color:=Label261.Font.Color;
        For Loop:=1 to 659 do  begin
           RoadTestBox.Canvas.MoveTo(PolyOsc[Loop-1].x,PolyOsc[Loop-1].y);
           RoadTestBox.Canvas.LineTo(PolyOsc[Loop].x,PolyOsc[Loop].y);
           end;
        end;
    15:if CheckBox93.Checked then begin
        RoadTestBox.Canvas.Pen.Color:=Label262.Font.Color;
        For Loop:=1 to 659 do  begin
           RoadTestBox.Canvas.MoveTo(PolyOsc[Loop-1].x,PolyOsc[Loop-1].y);
           RoadTestBox.Canvas.LineTo(PolyOsc[Loop].x,PolyOsc[Loop].y);
           end;
        end;

    16:if CheckBox96.Checked then begin
        RoadTestBox.Canvas.Pen.Color:=Label279.Font.Color;
        For Loop:=1 to 659 do  begin
           RoadTestBox.Canvas.MoveTo(PolyOsc[Loop-1].x,PolyOsc[Loop-1].y);
           RoadTestBox.Canvas.LineTo(PolyOsc[Loop].x,PolyOsc[Loop].y);
           end;
        end;
    17:if CheckBox97.Checked then begin
        RoadTestBox.Canvas.Pen.Color:=Label280.Font.Color;
        For Loop:=1 to 659 do  begin
           RoadTestBox.Canvas.MoveTo(PolyOsc[Loop-1].x,PolyOsc[Loop-1].y);
           RoadTestBox.Canvas.LineTo(PolyOsc[Loop].x,PolyOsc[Loop].y);
           end;
        end;
    18:if CheckBox98.Checked then begin
        RoadTestBox.Canvas.Pen.Color:=Label281.Font.Color;
        For Loop:=1 to 659 do  begin
           RoadTestBox.Canvas.MoveTo(PolyOsc[Loop-1].x,PolyOsc[Loop-1].y);
           RoadTestBox.Canvas.LineTo(PolyOsc[Loop].x,PolyOsc[Loop].y);
           end;
        end;
    19:if CheckBox99.Checked then begin
        RoadTestBox.Canvas.Pen.Color:=Label282.Font.Color;
        For Loop:=1 to 659 do  begin
           RoadTestBox.Canvas.MoveTo(PolyOsc[Loop-1].x,PolyOsc[Loop-1].y);
           RoadTestBox.Canvas.LineTo(PolyOsc[Loop].x,PolyOsc[Loop].y);
           end;
        end;

    20:if CheckBox347.Checked then begin
        RoadTestBox.Canvas.Pen.Color:=Label687.Font.Color;
        For Loop:=1 to 659 do  begin
           RoadTestBox.Canvas.MoveTo(PolyOsc[Loop-1].x,PolyOsc[Loop-1].y);
           RoadTestBox.Canvas.LineTo(PolyOsc[Loop].x,PolyOsc[Loop].y);
           end;
        end;
    21:if CheckBox348.Checked then begin
        RoadTestBox.Canvas.Pen.Color:=Label689.Font.Color;
        For Loop:=1 to 659 do  begin
           RoadTestBox.Canvas.MoveTo(PolyOsc[Loop-1].x,PolyOsc[Loop-1].y);
           RoadTestBox.Canvas.LineTo(PolyOsc[Loop].x,PolyOsc[Loop].y);
           end;
        end;
    22:if CheckBox349.Checked then begin
        RoadTestBox.Canvas.Pen.Color:=Label690.Font.Color;
        For Loop:=1 to 659 do  begin
           RoadTestBox.Canvas.MoveTo(PolyOsc[Loop-1].x,PolyOsc[Loop-1].y);
           RoadTestBox.Canvas.LineTo(PolyOsc[Loop].x,PolyOsc[Loop].y);
           end;
        end;
    23:if CheckBox350.Checked then begin
        RoadTestBox.Canvas.Pen.Color:=Label691.Font.Color;
        For Loop:=1 to 659 do  begin
           RoadTestBox.Canvas.MoveTo(PolyOsc[Loop-1].x,PolyOsc[Loop-1].y);
           RoadTestBox.Canvas.LineTo(PolyOsc[Loop].x,PolyOsc[Loop].y);
           end;
        end;
  end; //case
 end;
  //       RoadTestBox.Canvas.Pen.Width:=1;
end;


procedure TForm1.ScrollBar1Change(Sender: TObject);
begin
        if RoadTest_Flag then Exit;
        if RoadTestInCount<>0 then begin
           DrawRoadTest(ScrollBar1.Position);
        end;
end;

procedure TForm1.Button8Click(Sender: TObject);
Var
  Loop,LoopD: integer;
begin
        Form1.OpenDialog2.Filter:='road|*.road|all|*.*';
        Form1.OpenDialog2.InitialDir:=RoadDir;
        if Opendialog2.Execute and  FileExists(Opendialog2.FileName)
        then
        begin
        AssignFile(FF,OpenDialog2.FileName);
        Reset(FF);
        RoadTestInCount:=FileSize(FF);
        BlockRead(FF,RoadTestBuf,RoadTestInCount);
        if IntToStr(RoadTestBuf[0].TimerSynch)='2147483007' then
        begin
            RoadTestBuf[0].TimerSynch:=RoadTestBuf[1].TimerSynch;
            NumberOsc:=NumberOsc_New24;
            CloseFile(FF);
        end
        else
        if IntToStr(RoadTestBuf[0].TimerSynch)='2147483504' then
        begin
            RoadTestBuf[0].TimerSynch:=RoadTestBuf[1].TimerSynch;
            NumberOsc:=NumberOsc_New;
            CloseFile(FF);
            AssignFile(FFnew,OpenDialog2.FileName);
            Reset(FFnew);
            RoadTestInCount:=FileSize(FFnew);
            BlockRead(FFnew,RoadTestBufNew,RoadTestInCount);
         // ïðåîáðàçîâàíèå ôîðìàòà
            for Loop:=0 to RoadTestInCount-1 do begin
               RoadTestBuf[Loop].TimerSynch:=RoadTestBufNew[Loop].TimerSynch;
               for LoopD:=0 to NumberOsc_New-1 do
                 RoadTestBuf[Loop].Osc[LoopD]:= RoadTestBufNew[Loop].Osc[LoopD];
               for LoopD:=NumberOsc_New to NumberOsc_New24-1 do
                 RoadTestBuf[Loop].Osc[LoopD]:= 0;
            end;
            NumberOsc:=NumberOsc_New;
            CloseFile(FFnew);
        end
        else begin
        if IntToStr(RoadTestBuf[0].TimerSynch)='2147483647' then begin
            CloseFile(FF);
            AssignFile(FFold16,OpenDialog2.FileName);
            Reset(FFold16);
            RoadTestInCount:=FileSize(FFold16);
            BlockRead(FFold16,RoadTestBufOld16,RoadTestInCount);
         // ïðåîáðàçîâàíèå ôîðìàòà
            for Loop:=0 to RoadTestInCount-1 do begin
               RoadTestBuf[Loop].TimerSynch:=RoadTestBufOld16[Loop].TimerSynch;
               for LoopD:=0 to NumberOsc_Old16-1 do
                 RoadTestBuf[Loop].Osc[LoopD]:= RoadTestBufOld16[Loop].Osc[LoopD];
               for LoopD:=NumberOsc_Old16 to NumberOsc_New-1 do
                 RoadTestBuf[Loop].Osc[LoopD]:= 0;
            end;
            NumberOsc:=NumberOsc_Old16;
            CloseFile(FFold16);
        end
        else begin
            CloseFile(FF);
            AssignFile(FFold,OpenDialog2.FileName);
            Reset(FFold);
            RoadTestInCount:=FileSize(FFold);
            BlockRead(FFold,RoadTestBufOld,RoadTestInCount);
         // ïðåîáðàçîâàíèå ôîðìàòà
            for Loop:=0 to RoadTestInCount-1 do begin
               RoadTestBuf[Loop].TimerSynch:=RoadTestBufOld[Loop].TimerSynch;
               for LoopD:=0 to NumberOsc_Old-1 do
                 RoadTestBuf[Loop].Osc[LoopD]:= RoadTestBufOld[Loop].Osc[LoopD];
               for LoopD:=NumberOsc_Old to NumberOsc_New-1 do
                 RoadTestBuf[Loop].Osc[LoopD]:= 0;
            end;
            NumberOsc:=NumberOsc_Old;
            CloseFile(FFold);
         end;
        end;
        Label85.Caption:=ExtractFileName(OpenDialog2.FileName);
        RoadDir:=ExtractFileDir(OpenDialog2.FileName);
        DiagIni.WriteString('RoadDir','RoadDir',RoadDir);
        Form1.Label263Click(nil);
        StartRT_View;
        end
        else
        RoadTestBox.Refresh;
end;


procedure TForm1.Button7Click(Sender: TObject);
//Var FileName: String;
begin
     Form1.SaveDialog2.Filter:='road|*.road|all|*.*';
     Form1.SaveDialog2.InitialDir:=RoadDir;
     if SaveDialog2.Execute
     then begin
     if Pos('.road',SaveDialog2.FileName) = 0 then
        SaveDialog2.FileName:=SaveDialog2.FileName+'.road';
     AssignFile(FF,SaveDialog2.FileName);
     Rewrite(FF);
     RoadTestBuf[0].TimerSynch:=StrToInt('2147483007'); //24 ëó÷åé
     BlockWrite(FF,RoadTestBuf,RoadTestInCount);
     CloseFile(FF);
     Label85.Caption:=ExtractFileName(SaveDialog2.FileName);
     RoadDir:=ExtractFilePath(SaveDialog2.FileName);
     DiagIni.WriteString('RoadDir','RoadDir',RoadDir);
     end;
     DrawRoadTest(ScrollBar1.Position);
end;

procedure TForm1.StartRT_View;
Var TestInterger:Integer;
begin
        TestInterger:=RoadTestInCount-600;
        If TestInterger<0 then TestInterger:=0;
        ScrollBar1.Max:=TestInterger;
        ScrollBar1.Position:=0;
        if NumberOsc=NumberOsc_New24 then
              Form1.Label263.Caption:='New24 road File'
        else
        if NumberOsc=NumberOsc_New then
              Form1.Label263.Caption:='New road File'
        else
        begin
           if NumberOsc=NumberOsc_Old16 then
              Form1.Label263.Caption:='Old16 road File'
           else
              Form1.Label263.Caption:='Old road File';
        end;
        DrawRoadTest(ScrollBar1.Position);
end;

procedure TForm1.RoadTestBoxMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
 T:integer;
begin
        if RoadTest_Flag then Exit;
        If Y>260 then Y:=260;
        Label99.Caption:='Y Position:'+IntToStr(260-Y);
        Label100.Caption:='X Position:'+IntToStr(RoadTestBuf[X+ScrollBar1.Position].TimerSynch);
        CheckBox13.Caption:=IntToStr(RoadTestBuf[X+ScrollBar1.Position].Osc[0]);
        CheckBox14.Caption:=IntToStr(RoadTestBuf[X+ScrollBar1.Position].Osc[1]);
        CheckBox15.Caption:=IntToStr(RoadTestBuf[X+ScrollBar1.Position].Osc[2]);
        CheckBox18.Caption:=IntToStr(RoadTestBuf[X+ScrollBar1.Position].Osc[3]);
        CheckBox17.Caption:=IntToStr(RoadTestBuf[X+ScrollBar1.Position].Osc[4]);
        CheckBox16.Caption:=IntToStr(RoadTestBuf[X+ScrollBar1.Position].Osc[5]);
        CheckBox21.Caption:=IntToStr(RoadTestBuf[X+ScrollBar1.Position].Osc[6]);
        CheckBox20.Caption:=IntToStr(RoadTestBuf[X+ScrollBar1.Position].Osc[7]);
        CheckBox19.Caption:=IntToStr(RoadTestBuf[X+ScrollBar1.Position].Osc[8]);
        CheckBox24.Caption:=IntToStr(RoadTestBuf[X+ScrollBar1.Position].Osc[9]);
        CheckBox23.Caption:=IntToStr(RoadTestBuf[X+ScrollBar1.Position].Osc[10]);
        CheckBox22.Caption:=IntToStr(RoadTestBuf[X+ScrollBar1.Position].Osc[11]);
        CheckBox90.Caption:=IntToStr(RoadTestBuf[X+ScrollBar1.Position].Osc[12]);
        CheckBox91.Caption:=IntToStr(RoadTestBuf[X+ScrollBar1.Position].Osc[13]);
        CheckBox92.Caption:=IntToStr(RoadTestBuf[X+ScrollBar1.Position].Osc[14]);
        CheckBox93.Caption:=IntToStr(RoadTestBuf[X+ScrollBar1.Position].Osc[15]);
        CheckBox96.Caption:=IntToStr(RoadTestBuf[X+ScrollBar1.Position].Osc[16]);
        CheckBox97.Caption:=IntToStr(RoadTestBuf[X+ScrollBar1.Position].Osc[17]);
        CheckBox98.Caption:=IntToStr(RoadTestBuf[X+ScrollBar1.Position].Osc[18]);
        CheckBox99.Caption:=IntToStr(RoadTestBuf[X+ScrollBar1.Position].Osc[19]);

        CheckBox347.Caption:=IntToStr(RoadTestBuf[X+ScrollBar1.Position].Osc[20]);
        CheckBox348.Caption:=IntToStr(RoadTestBuf[X+ScrollBar1.Position].Osc[21]);
        CheckBox349.Caption:=IntToStr(RoadTestBuf[X+ScrollBar1.Position].Osc[22]);
        CheckBox350.Caption:=IntToStr(RoadTestBuf[X+ScrollBar1.Position].Osc[23]);
        if not Fl_vert then begin
        RoadTestBox.Canvas.Pen.Color:=$FFFFF;
        RoadTestBox.Canvas.Pen.Mode:=pmXor;
        RoadTestBox.Canvas.MoveTo(X1,0);
        RoadTestBox.Canvas.LineTo(X1,RoadTestBox.Height-1);
        RoadTestBox.Canvas.MoveTo(X,0);
        RoadTestBox.Canvas.LineTo(X,RoadTestBox.Height-1);
        X1:=X;
        Label70.Caption:='deltaX:'+
        IntToStr(RoadTestBuf[X+ScrollBar1.Position].TimerSynch-
                 RoadTestBuf[X0+ScrollBar1.Position].TimerSynch);
        end
        else begin
        if FlPutFirst then begin
        RoadTestBox.Canvas.Pen.Color:=$FFFFF;
        RoadTestBox.Canvas.Pen.Mode:=pmXor;
        RoadTestBox.Canvas.MoveTo(Xa,Ya);
        RoadTestBox.Canvas.LineTo(X1,Y2);
        RoadTestBox.Canvas.MoveTo(Xa,Ya);
        RoadTestBox.Canvas.LineTo(X,Y);
        X1:=X;
        Y2:=Y;
        T:=RoadTestBuf[X+ScrollBar1.Position].TimerSynch-
           RoadTestBuf[Xa+ScrollBar1.Position].TimerSynch;
        if T<>0 then
        Label126.Caption:='A'+
        FloatToStrF(((Ya-Y)/4/T*1000/3.6),ffFixed,6,2)+
        'm/c2 ('+FloatToStrF(abs((Ya-Y)/4/T*1000/3.6/9.81),ffFixed,6,2)+'g)';
        end
        else begin

        end;
        end;
end;

procedure TForm1.Select(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  (EditNum1 as TEdit).Text:=IntToStr(ATMEL_RAM[ARow]);
end;

procedure TForm1.EditATOnClick(Sender: TObject);
begin
  EditNum1:=Sender;
end;

procedure TForm1.Label56Click(Sender: TObject);
Var XLabel:^TLabel;
begin
   XLabel:=@Sender;
   if  ColorDialog1.Execute  then
   XLabel.Font.Color:= ColorDialog1.Color;
   Panel6.Refresh;
   Osc_Deffinition;
   if Com_Connected_F then  DrawGrid(OscBox);
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
        if Not Com_Connected_F then Exit;
        if Button10.Caption='Paused' then
        begin
                Button10.Caption:='Running';
                FormISO.DownLoadOscAddress;
        end
        else begin
                Button10.Caption:='Paused';
        end;
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
    DumpForm.Visible:=True;
end;

procedure TForm1.Button14Click(Sender: TObject);
begin
        OpenDialog1.FileName:=Const_File;
        Opendialog1.InitialDir:=ExtractFilePath(Const_File);
        OpenDialog1.Filter:='asm|*.asm';
        Opendialog1.Execute;
        Const_File:=Opendialog1.FileName;
        If Const_File<>'' then  begin
        DiagIni.WriteString('Ôàèë íàñòðîåê ABS','Const_File',Const_File);
        LoadMotoEEPROM(Const_File);
        Label4.Caption:= ExtractFilePath(Const_File);
        end;
end;

Procedure TForm1.LoadMotoEEPROM;
Label
        Next_String;
Var IncFile:TextFile;
    TestString,TempString:String;
    TempInt,Loop:Integer;
    sr: TSearchRec;
    TestFile:File of Byte;
begin
 if (FindFirst(EEPROM_File, faAnyFile, sr) <> 0) then
    begin
        MsgBox( PChar('Ôàéë Abs_Const.asm íå íàéäåí.'),
              'Îøèáêà', MB_OK+MB_ICONERROR+MB_APPLMODAL);
        Form1.Button14Click(nil);
        exit;
    end;
  //      Label568.Caption:= Const_File;

        AssignFile(IncFile,EEPROM_File);
        Reset(IncFile);
        Label4.Caption:= ExtractFilePath(Const_File);
      {  Moto_EEPROM_Start:=0;
        Repeat
                ReadLn(IncFile,TestString);
                If Pos('org',TestString)<>0 then
                begin
                        Delete(TestString,1,Pos('$',TestString)-1);
                        Delete(TestString,6,Length(TestString)-1);
                        Moto_EEPROM_Start:=StrToInt(TestString);
                end;
        Until Moto_EEPROM_Start<>0; }
        EEPROM_Size:=0;
        Repeat
                ReadLn(IncFile,TestString);
                GetBytes(TestString);
        Until Pos('Mass_End',TestString)<>0;
        MotoGrid.Visible:=False;
        MotoGrid.RowCount:=1;
        Repeat
                ReadLn(IncFile,TestString);
                If (Pos(' ',TestString)=1) or (Length(TestString)=0)  then GOTO Next_String;
                if (Pos(';',TestString)<6) and (Pos(';',TestString)<>0) then
                MotoGrid.Cells[3,MotoGrid.RowCount]:=TestString
                else begin
                     TempInt:=EEPROM_Size;
                     GetBytes(TestString);
                     if EEPROM_Size=TempInt then Goto Next_String
                     else begin
                        TempString:=TestString;
                        Delete(TestString,Pos(' ',TestString),Length(TestString)-Pos(' ',TestString)+1);
                        MotoGrid.Cells[1,MotoGrid.RowCount]:=IntToHex(EEPROM_Size+ConstStart-1,4);
                        MotoGrid.Cells[0,MotoGrid.RowCount]:=TestString;
                        MotoGrid.Cells[2,MotoGrid.RowCount]:=IntToStr(EEPROM_Array[EEPROM_Size-1]);
                        if Pos(';',TempString)<>0 then
                        begin
                                Delete(TempString,1,Pos(';',TempString)-1);
                                MotoGrid.Cells[3,MotoGrid.RowCount]:=TempString;
                        end;
                     end;
                end;
                MotoGrid.RowCount:=MotoGrid.RowCount+1;
Next_String:
        Until Pos('EEPROM_End',TestString)<>0;
        MotoGrid.FixedRows:=1;
        MotoGrid.Cells[0,0]:='Íàñòðîéêè';
        MotoGrid.Cells[1,0]:='Adr';
        MotoGrid.Cells[2,0]:='Data';
        MotoGrid.Cells[3,0]:='Ïîÿñíåíèå';
        Label68.Caption:='Ðàçìåð EEPROM îáëàñòè: '+IntToStr(EEPROM_Size);
        TempInt:=0;
        MotoGrid.Visible:=True;
        For Loop:=0 to EEPROM_Size-4 do
        TempInt:=TempInt+EEPROM_Array[Loop];
        EEPROM_Array[EEPROM_Size-3]:=TempInt div 65536;
        TempInt:=TempInt mod 65536;
        EEPROM_Array[EEPROM_Size-2]:=TempInt div 256;
        EEPROM_Array[EEPROM_Size-1]:=TempInt mod 256;
        Label116.Caption:=IntToStr(EEPROM_Array[EEPROM_Size-3])+'  '+
        IntToStr(EEPROM_Array[EEPROM_Size-2])+'  '+
        IntToStr(EEPROM_Array[EEPROM_Size-1]);

        Label293.Caption:=IntToStr(EEPROM_Array[EEPROM_Size-6])+'  '+
                IntToStr(EEPROM_Array[EEPROM_Size-5])+'  '+
                IntToStr(EEPROM_Array[EEPROM_Size-4]);

        CloseFile(IncFile);
end;

Procedure  GetBytes;
Var TestST:String;
begin
        TestST:=SearchString;
        If Pos(' db ',TestST)=0 then Exit;
        Delete(TestST,1,Pos(' db ',TestST)+2);
        Repeat
                Delete(TestST,1,1);
        Until Copy(TestST,1,1)<>' ';
        SearchString:=TestST;
        TestST:='';
        Repeat
                if (Copy(SearchString,1,1)=',') or (Copy(SearchString,1,1)='T') then
                if (Length(TestST))=0 then Delete(SearchString,1,1)
                else Begin
                        EEPROM_Array[EEPROM_Size]:=StrToInt(TestST);
                        Inc(EEPROM_Size);
                        TestST:='';
                        Delete(SearchString,1,1);
                end else
                begin
                        TestST:=TestST+Copy(SearchString,1,1);
                        Delete(SearchString,1,1)
                end;
        Until (Length(SearchString)=0) or (Copy(SearchString,1,1)=' ');
        if (Length(TestST))<>0 then
        Begin
                EEPROM_Array[EEPROM_Size]:=StrToInt(TestST);
                Inc(EEPROM_Size);
        end;
end;


procedure TForm1.Button15Click(Sender: TObject);
Var NewFile,IncFile:TextFile;
    TestString,Temp_File_Name:String;
    TempInt,RowPointer,Loop,CheckSum:Integer;
begin
        AssignFile(IncFile,Const_File);
        Reset(IncFile);
        Temp_File_Name:=ExtractFilePath(Const_File)+'Temp.asm';
        AssignFile(NewFile,Temp_File_Name);
        ReWrite(NewFile);
      if Tip_Block =3 then begin
        TempInt:=0;
        Repeat
                ReadLn(IncFile,TestString);
                If Pos(' db ',TestString)=0 then WriteLn(NewFile,TestString)
                else  begin
                        TestString:='             db      '
                        +IntToStr(EEPROM_Array[TempInt*2])+'T,'
                        +IntToStr(EEPROM_Array[TempInt*2+1])+'T';
                        Inc(TempInt);
                        WriteLn(NewFile,TestString);
                end;
        Until   TempInt=151;
        TempInt:=302;
        Repeat
                ReadLn(IncFile,TestString);
                If Pos(' db ',TestString)=0 then WriteLn(NewFile,TestString)
                else  begin
                        TestString:='             db      '
                        +IntToStr(EEPROM_Array[TempInt])+'T';
                        Inc(TempInt);
                        WriteLn(NewFile,TestString);
                end;
        Until   TempInt=452;
        Repeat
                ReadLn(IncFile,TestString);
                If Pos(' db ',TestString)=0 then WriteLn(NewFile,TestString)
                else  begin
                        TestString:='             db      '
                        +IntToStr(EEPROM_Array[TempInt])+'T';
                        Inc(TempInt);
                        WriteLn(NewFile,TestString);
                end;
        Until   TempInt=580;
        Repeat
                ReadLn(IncFile,TestString);
                If Pos(' db ',TestString)=0 then WriteLn(NewFile,TestString)
                else  begin
                        TestString:='             db      '
                        +IntToStr(EEPROM_Array[TempInt])+'T,'
                        +IntToStr(EEPROM_Array[TempInt+1])+'T';
                        Inc(TempInt);
                        Inc(TempInt);
                        WriteLn(NewFile,TestString);
                end;
        Until   TempInt=882;
     end;
     if Tip_Block > 3 then begin
        TempInt:=0;
        Repeat
                ReadLn(IncFile,TestString);
                If Pos(' db ',TestString)=0 then WriteLn(NewFile,TestString)
                else  begin
                        TestString:='             db      '
                        +IntToStr(EEPROM_Array[TempInt])+'T,'
                        +IntToStr(EEPROM_Array[TempInt+1])+'T';
                        Inc(TempInt);
                        Inc(TempInt);
                        WriteLn(NewFile,TestString);
                end;
        Until   TempInt=302;
        TempInt:=302;  //pump 128
        Repeat
                ReadLn(IncFile,TestString);
                If Pos(' db ',TestString)=0 then WriteLn(NewFile,TestString)
                else  begin
                        TestString:='             db      '
                        +IntToStr(EEPROM_Array[TempInt])+'T';
                        Inc(TempInt);
                        WriteLn(NewFile,TestString);
                end;
        Until   TempInt=430;
        Repeat // Maximal_T_Tab
                ReadLn(IncFile,TestString);
                If Pos(' db ',TestString)=0 then WriteLn(NewFile,TestString)
                else  begin
                        TestString:='             db      '
                        +IntToStr(EEPROM_Array[TempInt])+'T,'
                        +IntToStr(EEPROM_Array[TempInt+1])+'T';
                        Inc(TempInt);
                        Inc(TempInt);
                        WriteLn(NewFile,TestString);
                end;
        Until   TempInt=732;
        Repeat // MaxCh_T_Tab
                ReadLn(IncFile,TestString);
                If Pos(' db ',TestString)=0 then WriteLn(NewFile,TestString)
                else  begin
                        TestString:='             db      '
                        +IntToStr(EEPROM_Array[TempInt])+'T,'
                        +IntToStr(EEPROM_Array[TempInt+1])+'T';
                        Inc(TempInt);
                        Inc(TempInt);
                        WriteLn(NewFile,TestString);
                end;
        Until   TempInt=1034;
        Repeat // MinCh_T_Tab
                ReadLn(IncFile,TestString);
                If Pos(' db ',TestString)=0 then WriteLn(NewFile,TestString)
                else  begin
                        TestString:='             db      '
                        +IntToStr(EEPROM_Array[TempInt])+'T,'
                        +IntToStr(EEPROM_Array[TempInt+1])+'T';
                        Inc(TempInt);
                        Inc(TempInt);
                        WriteLn(NewFile,TestString);
                end;
        Until   TempInt=1336;
     end;
        RowPointer:=0;
        Repeat
                ReadLn(IncFile,TestString);
                If Pos(' db ',TestString)=0 then WriteLn(NewFile,TestString)
                else  begin
                        Repeat
                                Inc(RowPointer);
                        Until   Pos(MotoGrid.Cells[0,RowPointer],TestString)<>0;
                        Delete(TestString,Pos(' db',TestString)+1,Length(TestString)
                               -Pos(' db',TestString));
                        EEPROM_Array[TempInt]:=StrToInt(MotoGrid.Cells[2,RowPointer]);
                        TestString:=TestString+'db      '+IntToStr(EEPROM_Array[TempInt])+'T';
                        if EEPROM_Array[TempInt]<10 then TestString:=TestString+' ';
                        if EEPROM_Array[TempInt]<100 then TestString:=TestString+' ';
                        TestString:=TestString+'   '+MotoGrid.Cells[3,RowPointer];
                        Inc(TempInt);
                        WriteLn(NewFile,TestString);
                end;
        Until   Pos('EEPROM_Check_Sum',TestString)<>0;
        //GetMotoRomCheckSum;

       if MsgBox( 'Îïðåäåëèòü RomCheckSum èç s19?',
          'Ïðåäóïðåæäåíèå', MB_OkCancel+MB_ICONASTERISK+MB_APPLMODAL)= idOk
          then  begin
                 GetMotoRomCheckSum;
                 if CheckSumRom_Calc then begin
                 EEPROM_Array[EEPROM_Size-6]:=CheckSumRom div 65536;
                 EEPROM_Array[EEPROM_Size-5]:=(CheckSumRom mod 65536) div 256;
                 EEPROM_Array[EEPROM_Size-4]:=(CheckSumRom mod 65536) mod 256;
                 Label114.Caption:=IntToStr(EEPROM_Array[EEPROM_Size-6])+'  '+
                                   IntToStr(EEPROM_Array[EEPROM_Size-5])+'  '+
                                   IntToStr(EEPROM_Array[EEPROM_Size-4])
                                       end;
                 end;

        CheckSum:=0;
        For Loop:=0 to EEPROM_Size-4 do CheckSum:=CheckSum+EEPROM_Array[Loop];
        EEPROM_Array[EEPROM_Size-3]:=CheckSum div 65536;
        CheckSum:=CheckSum mod 65536;
        EEPROM_Array[EEPROM_Size-2]:=CheckSum div 256;
        EEPROM_Array[EEPROM_Size-1]:=CheckSum mod 256;
        Label116.Caption:=IntToStr(EEPROM_Array[EEPROM_Size-3])+'  '+
                          IntToStr(EEPROM_Array[EEPROM_Size-2])+'  '+
                          IntToStr(EEPROM_Array[EEPROM_Size-1]);
        Repeat
                ReadLn(IncFile,TestString);
                If Pos(' db ',TestString)=0 then WriteLn(NewFile,TestString)
                else  begin
                        Repeat
                                Inc(RowPointer);
                        Until   Pos(MotoGrid.Cells[0,RowPointer],TestString)<>0;
                        Delete(TestString,Pos(' db',TestString)+1,Length(TestString)-Pos(' db',TestString));
                        MotoGrid.Cells[2,RowPointer]:=IntToStr(EEPROM_Array[TempInt]);
                        TestString:=TestString+'db      '+IntToStr(EEPROM_Array[TempInt])+'T';
                        if EEPROM_Array[TempInt]<10 then TestString:=TestString+' ';
                        if EEPROM_Array[TempInt]<100 then TestString:=TestString+' ';
                        TestString:=TestString+'   '+MotoGrid.Cells[3,RowPointer];
                        Inc(TempInt);
                        WriteLn(NewFile,TestString);
                end;
        Until   Pos('EEPROM_End',TestString)<>0;
        CloseFile(IncFile);
        CloseFile(NewFile);
        DeleteFile(Const_File);
        MoveFile(PAnsiChar(UTF8Encode(Temp_File_Name)),PAnsiChar(UTF8Encode(Const_File)));
end;




Procedure TForm1.GetMotoRomCheckSum;
Var RomFile:TextFile;
    TestString:String;
    ByteCounter,Loop,Adr:Integer;
    sr: TSearchRec;
begin
    TestString:=ExtractFilePath(Const_File)+'ABS_Main.s19';
    if (FindFirst(TestString, faAnyFile, sr) <> 0) then
    begin
        MsgBox( PChar('Ôàéë ABS_Main.s19 íå íàéäåí.'),
              'Îøèáêà', MB_OK+MB_ICONERROR+MB_APPLMODAL);
        CheckSumRom_Calc:=False;
        exit;
    end;
        CheckSumRom_Calc:=True;
        CheckSumRom:=0;
        AssignFile(RomFile,TestString);
        Reset(RomFile);
        Repeat
        ReadLn(RomFile,TestString);
        if Pos('S1',TestString)<>0 then
        begin
           ByteCounter:=-3+HexToByte(TestString[3])*16+HexToByte(TestString[4]);
           Adr:= (HexToByte(TestString[5])*16+HexToByte(TestString[6]))*256+
                  HexToByte(TestString[7])*16+HexToByte(TestString[8]);
           if Adr >= (Program_Start) then
              for loop:=0 to ByteCounter-1 do
              begin
                 CheckSumRom:=CheckSumRom+HexToByte(TestString[9+Loop*2])*16+
                                          HexToByte(TestString[10+Loop*2]);
              end;
        end;
        Until Pos('S1',TestString)=0;
        Label114.Caption:=IntToStr(CheckSumRom div 65536)+'  '+
                IntToStr((CheckSumRom mod 65536) div 256)+'  '+
                IntToStr((CheckSumRom mod 65536) mod 256);
        CloseFile(RomFile);
end;

Procedure TForm1.LoadATMELInc;
Var IncFile:TextFile;
    TestString,TempString:String;
    Num1,TempInt,Loop:Integer;
    sr: TSearchRec;
begin
  if (FindFirst(FilePath, faAnyFile, sr) <> 0) then
    begin
        MsgBox( PChar('Ôàéë BASAT_08.INC íå íàéäåí.'),
              'Îøèáêà', MB_OK+MB_ICONERROR+MB_APPLMODAL);
        Label69DblClick(nil);
        exit;
    end;

    AssignFile(IncFile,FilePath);
    Reset(IncFile);
    ATMEL_EPROM.RowCount:=0;
    RAM_adr.RowCount:=0;
    Num1:=0;
  Label69.Caption:= FilePath;
//çàïîëíåíèå ATMEL_EPROM.Cells
  Repeat
  ReadLn(IncFile,TestString);
  if Length(TestString)=0 then EpromCon[Num1]:=' '
                          else EpromCon[Num1]:=TestString;
  Inc(Num1);
  if (Pos(' EQU ',TestString)<>0) or (Pos(' equ ',TestString)<>0)
  then   begin
  EpromConIndex[ATMEL_EPROM.RowCount]:=Num1-1;
  if (Pos(' EQU ',TestString)<>0)
  then TempString:=Copy(TestString,0,Pos(' EQU ',TestString))
  else TempString:=Copy(TestString,0,Pos(' equ ',TestString));
  Delete(TempString,Pos(' ',TempString),Length(TempString)-
                                       Pos(' ',TempString)+1);
   ATMEL_EPROM.Cells[0,ATMEL_EPROM.RowCount]:=TempString;
  if (Pos(' EQU ',TestString)<>0)
  then  TempString:=Copy(TestString,Pos(' EQU',TestString)+4,Length(TestString))
  else  TempString:=Copy(TestString,Pos(' equ',TestString)+4,Length(TestString));
  loop:=1;
  repeat Inc(loop) until  Copy(TempString,loop,1)<>' ';
  TempInt:=loop;
  repeat Inc(loop) until  (Copy(TempString,loop,1)=' ') or
                          (Copy(TempString,loop,1)=';') or
                          (loop=Length(TempString)+1) ;
  TempString:=Copy(TempString,TempInt,loop-TempInt);
  ATMEL_EPROM.Cells[1,ATMEL_EPROM.RowCount]:=TempString;
  if Pos(';',TestString)<>0 then begin
  TempString:=Copy(TestString,Pos(';',TestString),
  Length(TestString)-Pos(';',TestString)+1);
  ATMEL_EPROM.Cells[2,ATMEL_EPROM.RowCount]:=TempString;
                                 end;
  ATMEL_EPROM.RowCount:=ATMEL_EPROM.RowCount+1;
  end
  else if Pos(';',TestString)<>0 then
  begin
  EpromConIndex[ATMEL_EPROM.RowCount]:=Num1-1;
  ATMEL_EPROM.Cells[0,ATMEL_EPROM.RowCount]:=TestString;
  ATMEL_EPROM.RowCount:=ATMEL_EPROM.RowCount+1;
  end;
  Until TestString = ';ADR EEPROM';// EOF(IncFile);
  EpromConSize:=Num1;
  ATMEL_EPROM.RowCount:=ATMEL_EPROM.RowCount-1;
  for loop:=0 to ATMEL_EPROM.RowCount do EpromName[loop]:='';
  for loop:=0 to ATMEL_EPROM.RowCount do EpromData[loop]:='';
  EpromAdr:='';
//ñ÷èòûâàåì îñòàòîê ôàéëà â string EpromAdr
  Repeat
  ReadLn(IncFile,TestString);
  EpromAdr:=Concat(EpromAdr,TestString,#13,#10);
  Until EOF(IncFile);
//çàïîëíåíèå RAM
  Reset(IncFile);
  Repeat
  ReadLn(IncFile,TestString);
  Until  TestString = ';BEGIN_RAM';
  Repeat
  ReadLn(IncFile,TestString);
  if (Pos(' EQU ',TestString)<>0) or (Pos(' equ ',TestString)<>0)
  then   begin
  if (Pos(' EQU ',TestString)<>0)
    then TempString:=Copy(TestString,1,Pos(' EQU ',TestString))
    else TempString:=Copy(TestString,1,Pos(' equ ',TestString));
  Delete(TempString,Pos(' ',TempString),Length(TempString)-
                                          Pos(' ',TempString)+1);
  RAM_adr.Cells[0,RAM_adr.RowCount-1]:=TempString;
  if (Pos(' EQU ',TestString)<>0)
  then  TempString:=Copy(TestString,Pos(' EQU',TestString)+4,Length(TestString))
  else  TempString:=Copy(TestString,Pos(' equ',TestString)+4,Length(TestString));
  loop:=1;
  repeat Inc(loop) until  Copy(TempString,loop,1)<>' ';
  TempInt:=loop;
  repeat Inc(loop) until  (Copy(TempString,loop,1)=' ') or
                          (Copy(TempString,loop,1)=';') or
                          (Copy(TempString,loop,1)='h') or
                          (Copy(TempString,loop,1)='H') or
                          (loop=Length(TempString)+1) ;

  TempString:=Copy(TempString,TempInt,loop-TempInt);
  ATMEL_RAM[RAM_adr.RowCount-1]:=StrToInt('$'+TempString);
  if RAM_adr.Cells[0,RAM_adr.RowCount-1]='TIMER_LOW' then
    AdrTIMER_LOW:=ATMEL_RAM[RAM_adr.RowCount-1];
  if RAM_adr.Cells[0,RAM_adr.RowCount-1]='CNT_Stop_SW' then
    AdrStopCNT:=ATMEL_RAM[RAM_adr.RowCount-1];
  if RAM_adr.Cells[0,RAM_adr.RowCount-1]='ADR_CNT_DIF' then
    AdrDifCNT:=ATMEL_RAM[RAM_adr.RowCount-1];
  if RAM_adr.Cells[0,RAM_adr.RowCount-1]='ADR_CNT_M1' then
    AdrMod1CNT:=ATMEL_RAM[RAM_adr.RowCount-1];
  if RAM_adr.Cells[0,RAM_adr.RowCount-1]='ADR_CNT_M2' then
    AdrMod2CNT:=ATMEL_RAM[RAM_adr.RowCount-1];
  if RAM_adr.Cells[0,RAM_adr.RowCount-1]='ADR_CNT_M3' then
    AdrMod3CNT:=ATMEL_RAM[RAM_adr.RowCount-1];
  if RAM_adr.Cells[0,RAM_adr.RowCount-1]='ADR_CNT_M4' then
    AdrMod4CNT:=ATMEL_RAM[RAM_adr.RowCount-1];
  RAM_adr.RowCount:=RAM_adr.RowCount+1;
  end;
  Until  TestString = ';END_RAM';//  EOF(IncFile);
  CloseFile(IncFile);
end;

procedure TForm1.ATMEL_EPROMEnter(Sender: TObject);
Var IncFile:TextFile;
    Loop:Integer;
    FilName,TempFil,TempString:String;
begin
    AssignFile(IncFile,ConstAT_File);
    try
    Reset(IncFile);
    except
    ShowMessage('Íåóäàåòñÿ îòêðûòü ôàéë '+ConstAT_File);
    Label69DblClick(nil);
    exit;
    end;
    Repeat
    ReadLn(IncFile,TempString);
    TempFil:=Concat(TempFil,TempString,#13,#10);
    Until  EOF(IncFile);
    CloseFile(IncFile);
    Erase(IncFile);
    FilName:=ChangeFileExt(ConstAT_File,'.BAK');
    AssignFile(IncFile,FilName);
    try
    ReWrite(IncFile);
    except
    Reset(IncFile);
    CloseFile(IncFile);
    Erase(IncFile);
    ReWrite(IncFile);
    end;
    Write(IncFile,TempFil);
    CloseFile(IncFile);

    AssignFile(IncFile,ConstAT_File);
    ReWrite(IncFile);
    Loop:=0;
    Repeat
    WriteLn(IncFile,EpromCon[loop]);
    inc(Loop);
    Until Loop = EpromConSize;

    Write(IncFile,EpromAdr);
    CloseFile(IncFile);
    ShowMessage('Äàííûå çàïèñàíû â  '+ConstAT_File);
end;

procedure TForm1.ATMEL_EPROMSetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
Var TempString:String;
begin
  TempString:=ATMEL_EPROM.Cells[0,aRow];
  if  Length(TempString) <16 then
  repeat  Insert(' ',TempString,Length(TempString)+1) until Length(TempString)=16;
  Insert(' EQU ',TempString,Length(TempString)+1);
  if  Length(TempString) <25 then
  repeat Insert(' ',TempString,Length(TempString)+1) until Length(TempString)=25;
  Insert(ATMEL_EPROM.Cells[1,aRow]+' ',TempString,Length(TempString)+1);
  if  Length(TempString) <29 then
  repeat Insert(' ',TempString,Length(TempString)+1) until Length(TempString)=29;
  if Pos(';',ATMEL_EPROM.Cells[2,aRow])=0 then  Insert(';',TempString,Length(TempString)+1);
  Insert(ATMEL_EPROM.Cells[2,aRow],TempString,Length(TempString));

  if Pos(';',ATMEL_EPROM.Cells[0,aRow])<>0  then exit;
  EpromCon[EpromConIndex[ARow]]:=TempString;
  EpromName[ARow-1]:=ATMEL_EPROM.Cells[0,aRow];
  EpromData[ARow-1]:=ATMEL_EPROM.Cells[1,aRow];
end;

procedure TForm1.Button12Click(Sender: TObject);
Var
   num,Loop,poz:Integer;
begin
  if not Set_Security then Exit;
  num:=0;
  for loop:=0 to ATMEL_EPROM.RowCount do
  begin
  if EpromName[loop]<>'' then
  begin
  if (Pos('H',EpromData[loop])=0) and (Pos('h',EpromData[loop])=0)
  then B12dataArray[num]:=StrToInt(EpromData[loop])
  else B12dataArray[num]:=StrToInt('$'+
        Copy(EpromData[loop],1,Length(EpromData[loop])));
  if  Pos('ADR_'+EpromName[loop],EpromAdr)<>0 then
  begin
  Poz:=Pos('ADR_'+EpromName[loop],EpromAdr);
  repeat  Inc(Poz);  until Copy(EpromAdr,Poz,1) = ' ';
  repeat  Inc(Poz);  until Copy(EpromAdr,Poz,1) <>' ';
  Poz:=Poz+3;
  repeat  Inc(Poz);  until Copy(EpromAdr,Poz,1) <>' ';
  B12addrArray[num]:=StrToInt('$'+Copy(EpromAdr,Poz,2));
  end
  else begin
  MsgBox(('Àäðåñ íå ñóùåñòâóåò'),'Ïðåäóïðåæäåíèå',
                          mb_Ok+mb_IconAsterisk+mb_ApplModal);
  EpromName[loop]:='';
  exit;
        end;
  inc(num);
  end;
  end;
  if num =0 then begin
  MsgBox('Íåò èçìåíåíèé','Ïðåäóïðåæäåíèå',
                          mb_Ok+mb_IconAsterisk+mb_ApplModal);
  exit;
  end;
  Button12.Cursor:=crHourGlass;
  Button12.Enabled:=false;
  B12num:=num;
  Fl_ATEPROM_B12:=false;
  FormISO.WriteATEPROM_B12;
  repeat Application.ProcessMessages until Fl_ATEPROM_B12;
  Button12.Cursor:=crHandPoint;
  Button12.Enabled:=true;
  MsgBox('Äàííûå çàïèñàíû â EEPROM','',
                          mb_Ok+mb_ApplModal);

end;

procedure TForm1.Label69DblClick(Sender: TObject);
begin
  OpenDialog1.FileName:=ConstAT_File;
  Opendialog1.InitialDir:=ExtractFilePath(ConstAT_File);
  OpenDialog1.Filter:='inc|*.inc';
  if Opendialog1.Execute and  FileExists(Opendialog1.FileName)
  then
  begin
  ConstAT_File:=Opendialog1.FileName;
  DiagIni.WriteString('Ôàèë íàñòðîåê ABS','ConstAT_File',ConstAT_File);
  LoadATMELInc(ConstAT_File);
  end;
end;



procedure TForm1.RoadTestBoxMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
        if RoadTest_Flag then Exit;
        if not Fl_vert then begin
        DrawRoadTest(ScrollBar1.Position);
        RoadTestBox.Canvas.Pen.Color:=clWhite;
        RoadTestBox.Canvas.MoveTo(X1,0);
        RoadTestBox.Canvas.LineTo(X1,RoadTestBox.Height-1);
        RoadTestBox.Canvas.MoveTo(X,0);
        RoadTestBox.Canvas.LineTo(X,RoadTestBox.Height-1);
        X0:=x;
        end
        else begin
        if not FlPutFirst then begin
        FlPutFirst:=True;
        Ya:=Y;
        Xa:=X;
        X1:=X;
        Y2:=Y;
        RoadTestBox.Canvas.Brush.Style:=bsClear;
        RoadTestBox.Canvas.Pen.Color:=clWhite;//clRed;
        RoadTestBox.Canvas.Ellipse(X-10,Y+10,X+10,Y-10);
        end
        else begin
        DrawRoadTest(ScrollBar1.Position);
        FlPutFirst:=False;
        end;
        end;
end;

procedure LoadABSIniFile;
var
  Loop, Rows: Integer;
  TempStr:string;
begin
     if DiagIni.ReadString('Version_DIA', 'Type_VIN', '') = '2'
     then  Type_VIN_New:=true
     else  Type_VIN_New:=false;

   Port_Num:= DiagIni.ReadInteger('Serial', 'com',1);
   ComBaudrate:= DiagIni.ReadInteger('Serial', 'Baudrate',38400);
   ComAdapter:= DiagIni.ReadInteger('Serial', 'Adapter',1);

   Const_File:=DiagIni.ReadString('Ôàèë íàñòðîåê ABS','Const_File','');
   Prog_File:=DiagIni.ReadString('Ôàèë ïðîãðàììèðîâàíèÿ','s19_File','');
   Sec_s19:=DiagIni.ReadString('Ôàèë ïðîãðàììèðîâàíèÿ','Security_s19_File','');
   Prog_s19:=DiagIni.ReadString('Ôàèë ïðîãðàììèðîâàíèÿ','Prog_s19_File','');

   ProgSTM_File:=DiagIni.ReadString('Ôàèë ïðîãðàììèðîâàíèÿ STM','STMbin_File','');
   ProgSTM2_File:=DiagIni.ReadString('Ôàèë ïðîãðàììèðîâàíèÿ STM','STM2bin_File','');
   ProgPA_File:=DiagIni.ReadString('Ôàèë ïðîãðàììèðîâàíèÿ PA','PA_s19_File','');
   ProgDZ_File:=DiagIni.ReadString('Ôàéë ïðîãðàììèðîâàíèÿ DZ','DZ_s19_File','');
   Form1.CheckBox134.Checked:=DiagIni.ReadBool('Ôàéë ïðîãðàììèðîâàíèÿ DZ',
                                               'Íå çàïèñûâàòü Config',False);
   Form1.CheckBox135.Checked:=DiagIni.ReadBool('Ôàéë ïðîãðàììèðîâàíèÿ DZ',
                                               'Íå çàïèñûâàòü Const',False);

    UpGrade_File:=DiagIni.ReadString('Ôàéë ïðîãðàììèðîâàíèÿ CANUSB àäàïòåðà','Bin_File','');
    Form1.Edit378.Text:=UpGrade_File;
    UpGrade_ComNum:= DiagIni.ReadInteger('UpGrade_Serial', 'Com',5);
    Form1.Edit374.Text:=IntToStr(UpGrade_ComNum);
    UpGrade_ComBaudrate:= DiagIni.ReadInteger('UpGrade_Serial', 'Baudrate',115200);
    Form1.Edit379.Text:=IntToStr(UpGrade_ComBaudrate);

    AGS_UpGrade_File:=DiagIni.ReadString('Ôàéë ïðîãðàììèðîâàíèÿ AGS','Bin_File','');
    Form1.Edit384.Text:=AGS_UpGrade_File;
    SAS_UpGrade_File:=DiagIni.ReadString('Ôàéë ïðîãðàììèðîâàíèÿ SAS','Bin_File','');
    Form1.Edit431.Text:=SAS_UpGrade_File;
    Form1.rg2.ItemIndex:=StrToInt(DiagIni.ReadString('UpGrade_Serial','Programmator','0'));

   Form1.rg4.ItemIndex:=StrToInt(DiagIni.ReadString('UpGrade_Serial','ProgrammatorNEW','0'));
   Path_STLINK_CLI:=DiagIni.ReadString('UpGrade_Serial','Path_ST-LINK_CLI','0');
   Form1.CheckBox351.Checked:=DiagIni.ReadBool('UpGrade_Serial','ProgSTM_Checked',False);
   ProgSTM_Checked:=Form1.CheckBox354.Checked;
   Form1.CheckBox354.Checked:=DiagIni.ReadBool('UpGrade_Serial','ProgGD1_Checked',False);
   ProgGD1_Checked:=Form1.CheckBox354.Checked;
   Form1.CheckBox355.Checked:=DiagIni.ReadBool('UpGrade_Serial','ProgGD2_Checked',False);
   ProgGD2_Checked:=Form1.CheckBox355.Checked;
   
   Form1.Label134.Caption:=Prog_File;
   Form1.Label327.Caption:=ProgSTM_File;
   Form1.Label664.Caption:=ProgSTM2_File;
   Form1.Label328.Caption:=ProgPA_File;
   Form1.Label333.Caption:='Ôàéë '+ProgDZ_File;

   FileCarName:=DiagIni.ReadString('Poly','FileCar','');
   MaxSizeOnRun:=DiagIni.ReadBool('Poly','MaxSizeOnRun',False);
   Form1.Edit32.Text:=FloatToStr(DiagIni.ReadFloat('Poly','V0',0));
   Form1.ComboBox1.ItemIndex:=DiagIni.ReadInteger('Poly','DorogaL',0);
   Form1.ComboBox2.ItemIndex:=DiagIni.ReadInteger('Poly','DorogaR',0);
   Form1.Series0.Active:=DiagIni.ReadBool('Poly_Enable','Series0',False);;
   Form1.Series1.Active:=DiagIni.ReadBool('Poly_Enable','Series1',False);;
   Form1.Series2.Active:=DiagIni.ReadBool('Poly_Enable','Series2',False);;
   Form1.Series3.Active:=DiagIni.ReadBool('Poly_Enable','Series3',False);;
   Form1.Series4.Active:=DiagIni.ReadBool('Poly_Enable','Series4',False);;
   Form1.Series5.Active:=DiagIni.ReadBool('Poly_Enable','Series5',False);;
   Form1.Series6.Active:=DiagIni.ReadBool('Poly_Enable','Series6',False);;
   Form1.Series7.Active:=DiagIni.ReadBool('Poly_Enable','Series7',False);;
   Form1.Series8.Active:=DiagIni.ReadBool('Poly_Enable','Series8',False);;
   Form1.Series13.Active:=DiagIni.ReadBool('Poly_Enable','Series13',False);;
   Form1.Series14.Active:=DiagIni.ReadBool('Poly_Enable','Series14',False);;
   Form1.Series15.Active:=DiagIni.ReadBool('Poly_Enable','Series15',False);;
   Form1.Series16.Active:=DiagIni.ReadBool('Poly_Enable','Series16',False);;
   Form1.Series17.Active:=DiagIni.ReadBool('Poly_Enable','Series17',False);;
   Form1.Series18.Active:=DiagIni.ReadBool('Poly_Enable','Series18',False);;
   Form1.Series19.Active:=DiagIni.ReadBool('Poly_Enable','Series19',False);;
   Form1.Series20.Active:=DiagIni.ReadBool('Poly_Enable','Series20',False);;
   Form1.Series21.Active:=DiagIni.ReadBool('Poly_Enable','Series21',False);;
   Form1.Series24.Active:=DiagIni.ReadBool('Poly_Enable','Series24',False);;
   Form1.Series25.Active:=DiagIni.ReadBool('Poly_Enable','Series25',False);;
   Form1.Series26.Active:=DiagIni.ReadBool('Poly_Enable','Series26',False);;
   Form1.Series27.Active:=DiagIni.ReadBool('Poly_Enable','Series27',False);;
   Form1.Series28.Active:=DiagIni.ReadBool('Poly_Enable','Series28',False);;
   Form1.Series29.Active:=DiagIni.ReadBool('Poly_Enable','Series29',False);;

   Form1.Edit1.Text:=IntToStr(DiagIni.ReadInteger('OSC_Address','Osc_Adr_1',0));
   Form1.Edit2.Text:=IntToStr(DiagIni.ReadInteger('OSC_Address','Osc_Adr_2',0));
   Form1.Edit3.Text:=IntToStr(DiagIni.ReadInteger('OSC_Address','Osc_Adr_3',0));
   Form1.Edit4.Text:=IntToStr(DiagIni.ReadInteger('OSC_Address','Osc_Adr_4',0));
   Form1.Edit5.Text:=IntToStr(DiagIni.ReadInteger('OSC_Address','Osc_Adr_5',0));
   Form1.Edit6.Text:=IntToStr(DiagIni.ReadInteger('OSC_Address','Osc_Adr_6',0));
   Form1.Edit7.Text:=IntToStr(DiagIni.ReadInteger('OSC_Address','Osc_Adr_7',0));
   Form1.Edit8.Text:=IntToStr(DiagIni.ReadInteger('OSC_Address','Osc_Adr_8',0));
   Form1.Edit9.Text:=IntToStr(DiagIni.ReadInteger('OSC_Address','Osc_Adr_9',0));
   Form1.Edit10.Text:=IntToStr(DiagIni.ReadInteger('OSC_Address','Osc_Adr_10',0));
   Form1.Edit11.Text:=IntToStr(DiagIni.ReadInteger('OSC_Address','Osc_Adr_11',0));
   Form1.Edit12.Text:=IntToStr(DiagIni.ReadInteger('OSC_Address','Osc_Adr_12',0));
   Form1.Edit14.Text:=IntToStr(DiagIni.ReadInteger('OSC_Address','Osc_Adr_13',0));
   Form1.Edit15.Text:=IntToStr(DiagIni.ReadInteger('OSC_Address','Osc_Adr_14',0));
   Form1.Edit16.Text:=IntToStr(DiagIni.ReadInteger('OSC_Address','Osc_Adr_15',0));
   Form1.Edit17.Text:=IntToStr(DiagIni.ReadInteger('OSC_Address','Osc_Adr_16',0));
   Form1.Edit88.Text:=IntToStr(DiagIni.ReadInteger('OSC_Address','Osc_Adr_17',0));
   Form1.Edit89.Text:=IntToStr(DiagIni.ReadInteger('OSC_Address','Osc_Adr_18',0));
   Form1.Edit90.Text:=IntToStr(DiagIni.ReadInteger('OSC_Address','Osc_Adr_19',0));
   Form1.Edit91.Text:=IntToStr(DiagIni.ReadInteger('OSC_Address','Osc_Adr_20',0));
   Form1.Edit452.Text:=IntToStr(DiagIni.ReadInteger('OSC_Address','Osc_Adr_21',0));
   Form1.Edit453.Text:=IntToStr(DiagIni.ReadInteger('OSC_Address','Osc_Adr_22',0));
   Form1.Edit457.Text:=IntToStr(DiagIni.ReadInteger('OSC_Address','Osc_Adr_23',0));
   Form1.Edit458.Text:=IntToStr(DiagIni.ReadInteger('OSC_Address','Osc_Adr_24',0));

   Form1.Edit100.Text:=IntToStr(DiagIni.ReadInteger('Sel_OSC','Sel_OSC_1',0));
   Form1.Edit427.Text:=IntToStr(DiagIni.ReadInteger('Sel_OSC','Sel_TestPoint',0));
   Form1.Edit418.Text:=IntToStr(DiagIni.ReadInteger('Sel_OSC','Sel_RoadVAR',0));
   Form1.Edit18.Text:=IntToStr(DiagIni.ReadInteger('OSC_Address_AT1','Osc_Adr_5',0));
   Form1.Edit19.Text:=IntToStr(DiagIni.ReadInteger('OSC_Address_AT1','Osc_Adr_6',0));
   Form1.CheckBox27.Checked:=DiagIni.ReadBool('SEN_OSC_Enable','Enable1',true);
   Form1.CheckBox28.Checked:=DiagIni.ReadBool('SEN_OSC_Enable','Enable2',true);
   Form1.CheckBox29.Checked:=DiagIni.ReadBool('SEN_OSC_Enable','Enable3',true);
   Form1.CheckBox30.Checked:=DiagIni.ReadBool('SEN_OSC_Enable','Enable4',true);
   Form1.CheckBox46.Checked:=DiagIni.ReadBool('SEN_OSC_Enable','Enable5',true);
   Form1.CheckBox47.Checked:=DiagIni.ReadBool('SEN_OSC_Enable','Enable6',true);

   Form1.CheckBox1.Checked:=DiagIni.ReadBool('OSC_Enable','Enable1',true);
   Form1.CheckBox2.Checked:=DiagIni.ReadBool('OSC_Enable','Enable2',true);
   Form1.CheckBox3.Checked:=DiagIni.ReadBool('OSC_Enable','Enable3',true);
   Form1.CheckBox4.Checked:=DiagIni.ReadBool('OSC_Enable','Enable4',true);
   Form1.CheckBox5.Checked:=DiagIni.ReadBool('OSC_Enable','Enable5',true);
   Form1.CheckBox6.Checked:=DiagIni.ReadBool('OSC_Enable','Enable6',true);
   Form1.CheckBox7.Checked:=DiagIni.ReadBool('OSC_Enable','Enable7',true);
   Form1.CheckBox8.Checked:=DiagIni.ReadBool('OSC_Enable','Enable8',true);
   Form1.CheckBox9.Checked:=DiagIni.ReadBool('OSC_Enable','Enable9',true);
   Form1.CheckBox10.Checked:=DiagIni.ReadBool('OSC_Enable','Enable10',true);
   Form1.CheckBox11.Checked:=DiagIni.ReadBool('OSC_Enable','Enable11',true);
   Form1.CheckBox12.Checked:=DiagIni.ReadBool('OSC_Enable','Enable12',true);
   Form1.CheckBox86.Checked:=DiagIni.ReadBool('OSC_Enable','Enable13',true);
   Form1.CheckBox87.Checked:=DiagIni.ReadBool('OSC_Enable','Enable14',true);
   Form1.CheckBox88.Checked:=DiagIni.ReadBool('OSC_Enable','Enable15',true);
   Form1.CheckBox89.Checked:=DiagIni.ReadBool('OSC_Enable','Enable16',true);
   Form1.CheckBox100.Checked:=DiagIni.ReadBool('OSC_Enable','Enable17',true);
   Form1.CheckBox101.Checked:=DiagIni.ReadBool('OSC_Enable','Enable18',true);
   Form1.CheckBox102.Checked:=DiagIni.ReadBool('OSC_Enable','Enable19',true);
   Form1.CheckBox103.Checked:=DiagIni.ReadBool('OSC_Enable','Enable20',true);
   Form1.CheckBox341.Checked:=DiagIni.ReadBool('OSC_Enable','Enable21',true);
   Form1.CheckBox342.Checked:=DiagIni.ReadBool('OSC_Enable','Enable22',true);
   Form1.CheckBox343.Checked:=DiagIni.ReadBool('OSC_Enable','Enable23',true);
   Form1.CheckBox346.Checked:=DiagIni.ReadBool('OSC_Enable','Enable24',true);

   Form1.Label56.Font.Color:=DiagIni.ReadInteger('OSC_Color','Color_1',0);
   Form1.Label57.Font.Color:=DiagIni.ReadInteger('OSC_Color','Color_2',0);
   Form1.Label58.Font.Color:=DiagIni.ReadInteger('OSC_Color','Color_3',0);
   Form1.Label59.Font.Color:=DiagIni.ReadInteger('OSC_Color','Color_4',0);
   Form1.Label60.Font.Color:=DiagIni.ReadInteger('OSC_Color','Color_5',0);
   Form1.Label61.Font.Color:=DiagIni.ReadInteger('OSC_Color','Color_6',0);
   Form1.Label62.Font.Color:=DiagIni.ReadInteger('OSC_Color','Color_7',0);
   Form1.Label63.Font.Color:=DiagIni.ReadInteger('OSC_Color','Color_8',0);
   Form1.Label64.Font.Color:=DiagIni.ReadInteger('OSC_Color','Color_9',0);
   Form1.Label65.Font.Color:=DiagIni.ReadInteger('OSC_Color','Color_10',0);
   Form1.Label66.Font.Color:=DiagIni.ReadInteger('OSC_Color','Color_11',0);
   Form1.Label67.Font.Color:=DiagIni.ReadInteger('OSC_Color','Color_12',0);
   Form1.Label259.Font.Color:=DiagIni.ReadInteger('OSC_Color','Color_13',0);
   Form1.Label260.Font.Color:=DiagIni.ReadInteger('OSC_Color','Color_14',0);
   Form1.Label261.Font.Color:=DiagIni.ReadInteger('OSC_Color','Color_15',0);
   Form1.Label262.Font.Color:=DiagIni.ReadInteger('OSC_Color','Color_16',0);
   Form1.Label279.Font.Color:=DiagIni.ReadInteger('OSC_Color','Color_17',0);
   Form1.Label280.Font.Color:=DiagIni.ReadInteger('OSC_Color','Color_18',0);
   Form1.Label281.Font.Color:=DiagIni.ReadInteger('OSC_Color','Color_19',0);
   Form1.Label282.Font.Color:=DiagIni.ReadInteger('OSC_Color','Color_20',0);
   Form1.Label687.Font.Color:=DiagIni.ReadInteger('OSC_Color','Color_21',0);
   Form1.Label689.Font.Color:=DiagIni.ReadInteger('OSC_Color','Color_22',0);
   Form1.Label690.Font.Color:=DiagIni.ReadInteger('OSC_Color','Color_23',0);
   Form1.Label691.Font.Color:=DiagIni.ReadInteger('OSC_Color','Color_24',0);

   Form1.CheckBox13.Font.Color:=Form1.Label56.Font.Color;
   Form1.CheckBox14.Font.Color:=Form1.Label57.Font.Color;
   Form1.CheckBox15.Font.Color:=Form1.Label58.Font.Color;
   Form1.CheckBox16.Font.Color:=Form1.Label61.Font.Color;//
   Form1.CheckBox17.Font.Color:=Form1.Label60.Font.Color;//
   Form1.CheckBox18.Font.Color:=Form1.Label59.Font.Color;
   Form1.CheckBox19.Font.Color:=Form1.Label64.Font.Color;
   Form1.CheckBox20.Font.Color:=Form1.Label63.Font.Color;
   Form1.CheckBox21.Font.Color:=Form1.Label62.Font.Color;
   Form1.CheckBox22.Font.Color:=Form1.Label67.Font.Color;
   Form1.CheckBox23.Font.Color:=Form1.Label66.Font.Color;
   Form1.CheckBox24.Font.Color:=Form1.Label65.Font.Color;
   Form1.CheckBox90.Font.Color:=Form1.Label259.Font.Color;
   Form1.CheckBox91.Font.Color:=Form1.Label260.Font.Color;
   Form1.CheckBox92.Font.Color:=Form1.Label261.Font.Color;
   Form1.CheckBox93.Font.Color:=Form1.Label262.Font.Color;
   Form1.CheckBox96.Font.Color:=Form1.Label279.Font.Color;
   Form1.CheckBox97.Font.Color:=Form1.Label280.Font.Color;
   Form1.CheckBox98.Font.Color:=Form1.Label281.Font.Color;
   Form1.CheckBox99.Font.Color:=Form1.Label282.Font.Color;
   Form1.CheckBox347.Font.Color:=Form1.Label687.Font.Color;
   Form1.CheckBox348.Font.Color:=Form1.Label689.Font.Color;
   Form1.CheckBox349.Font.Color:=Form1.Label690.Font.Color;
   Form1.CheckBox350.Font.Color:=Form1.Label691.Font.Color;

   Form1.CheckBox13.Checked:=DiagIni.ReadBool('ROAD_Enable','Enable1',true);
   Form1.CheckBox14.Checked:=DiagIni.ReadBool('ROAD_Enable','Enable2',true);
   Form1.CheckBox15.Checked:=DiagIni.ReadBool('ROAD_Enable','Enable3',true);
   Form1.CheckBox18.Checked:=DiagIni.ReadBool('ROAD_Enable','Enable4',true);
   Form1.CheckBox17.Checked:=DiagIni.ReadBool('ROAD_Enable','Enable5',true);
   Form1.CheckBox16.Checked:=DiagIni.ReadBool('ROAD_Enable','Enable6',true);
   Form1.CheckBox21.Checked:=DiagIni.ReadBool('ROAD_Enable','Enable7',true);
   Form1.CheckBox20.Checked:=DiagIni.ReadBool('ROAD_Enable','Enable8',true);
   Form1.CheckBox19.Checked:=DiagIni.ReadBool('ROAD_Enable','Enable9',true);
   Form1.CheckBox24.Checked:=DiagIni.ReadBool('ROAD_Enable','Enable10',true);
   Form1.CheckBox23.Checked:=DiagIni.ReadBool('ROAD_Enable','Enable11',true);
   Form1.CheckBox22.Checked:=DiagIni.ReadBool('ROAD_Enable','Enable12',true);
   Form1.CheckBox90.Checked:=DiagIni.ReadBool('ROAD_Enable','Enable13',true);
   Form1.CheckBox91.Checked:=DiagIni.ReadBool('ROAD_Enable','Enable14',true);
   Form1.CheckBox92.Checked:=DiagIni.ReadBool('ROAD_Enable','Enable15',true);
   Form1.CheckBox93.Checked:=DiagIni.ReadBool('ROAD_Enable','Enable16',true);
   Form1.CheckBox96.Checked:=DiagIni.ReadBool('ROAD_Enable','Enable17',true);
   Form1.CheckBox97.Checked:=DiagIni.ReadBool('ROAD_Enable','Enable18',true);
   Form1.CheckBox98.Checked:=DiagIni.ReadBool('ROAD_Enable','Enable19',true);
   Form1.CheckBox99.Checked:=DiagIni.ReadBool('ROAD_Enable','Enable20',true);

   Form1.CheckBox347.Checked:=DiagIni.ReadBool('ROAD_Enable','Enable21',true);
   Form1.CheckBox348.Checked:=DiagIni.ReadBool('ROAD_Enable','Enable22',true);
   Form1.CheckBox349.Checked:=DiagIni.ReadBool('ROAD_Enable','Enable23',true);
   Form1.CheckBox350.Checked:=DiagIni.ReadBool('ROAD_Enable','Enable24',true);

   RoadDir:=DiagIni.ReadString('RoadDir','RoadDir',IniPath);
   ProtDir:=DiagIni.ReadString('ProtDir','ProtDir',IniPath);
   BaseDec:=DiagIni.ReadInteger('Param','ZoneDec',$500);
   KeyIni1:=DiagIni.ReadInteger('Key','KeyByte1',1);
   KeyIni2:=DiagIni.ReadInteger('Key','KeyByte2',1);
   KeyIni3:=DiagIni.ReadInteger('Key','KeyByte3',1);
   nKeyIni1:=DiagIni.ReadInteger('nKey','KeyByte1',1);
   nKeyIni2:=DiagIni.ReadInteger('nKey','KeyByte2',1);
   nKeyIni3:=DiagIni.ReadInteger('nKey','KeyByte3',1);
   KeyIni1v8:=DiagIni.ReadInteger('v8Key','KeyByte1',1);
   KeyIni2v8:=DiagIni.ReadInteger('v8Key','KeyByte2',1);
   KeyIni3v8:=DiagIni.ReadInteger('v8Key','KeyByte3',1);
   KeyIni1v9:=DiagIni.ReadInteger('v9Key','KeyByte1',1);
   KeyIni2v9:=DiagIni.ReadInteger('v9Key','KeyByte2',1);
   KeyIni3v9:=DiagIni.ReadInteger('v9Key','KeyByte3',1);
   KeyIni1v10:=DiagIni.ReadInteger('v10Key','KeyByte1',1);
   KeyIni2v10:=DiagIni.ReadInteger('v10Key','KeyByte2',1);
   KeyIni3v10:=DiagIni.ReadInteger('v10Key','KeyByte3',1);
   For Loop:=1 to 30 do
   SenOscTest_Thresh[Loop]:=DiagIni.ReadFloat('PcbSS_Test_Result',IntToStr(Loop),0);

   Rows:= StrToInt(DiagIni.ReadString('Selector_Oss','N','12'));
   Form1._SelOss_Grid.RowCount:=Rows;
   Form1._SelOss_Grid.ColWidths[1]:=60;
   for Loop:=0 to Rows do
   begin
      Form1._SelOss_Grid.Cells[0,Loop]:=IntToStr(Loop);
      Form1._SelOss_Grid.Cells[1,Loop]:=DiagIni.ReadString('Selector_Oss',
                                                         IntToStr(Loop),'');
   end;
   ADRE_Lot_M_V8:= DiagIni.ReadInteger('NumBlock','NumLot',0);

 {   PK_Tip:=DiagIni.ReadInteger('TipPnevmo1','Tip',0);
    Form1.ComboBox4.ItemIndex:= PK_Tip;
    case  Form1.ComboBox4.ItemIndex of
    0: TempStr:='Òèï íåîïðåäåëåí';
    1: TempStr:='TipPnevmo1';
    2: TempStr:='TipPnevmo2';
    end;
    PK_Ku:=DiagIni.ReadInteger(TempStr,'KUI',38);
    PK_Ko:=(DiagIni.ReadInteger(TempStr,'U0HI',31) *256 +
                          DiagIni.ReadInteger(TempStr,'U0LI',5));
    PK_dKu:=(DiagIni.ReadInteger(TempStr,'KUD',1));
    PK_dKoD:=DiagIni.ReadInteger(TempStr,'U0HD',13);
    PK_Kv:=DiagIni.ReadInteger(TempStr,'U0LD',211);

    Form1.Edit33.Text:=IntToStr(PK_Ku);
    Form1.Edit34.Text:=IntToStr(PK_Ko);
    Form1.Edit36.Text:=IntToStr(PK_dKu);
    Form1.Edit37.Text:=IntToStr(PK_dKoD);
    Form1.Edit39.Text:=IntToStr(PK_Kv);  }
end;

procedure SaveABSIniFile;
var
  TempStr:string;
begin
   DiagIni.WriteString('Ôàèë íàñòðîåê ABS','Const_File',Const_File);
   DiagIni.WriteString('Poly','FileCar',Form1.ComboBox3.Text);
   DiagIni.WriteBool('Poly','MaxSizeOnRun',MaxSizeOnRun);
   DiagIni.WriteFloat('Poly','V0',StrToFloat(form1.Edit32.Text));
   DiagIni.WriteInteger('Poly','DorogaL',Form1.ComboBox1.ItemIndex);
   DiagIni.WriteInteger('Poly','DorogaR',Form1.ComboBox2.ItemIndex);
   DiagIni.WriteBool('Poly_Enable','Series0',Form1.Series0.Active);
   DiagIni.WriteBool('Poly_Enable','Series1',Form1.Series1.Active);
   DiagIni.WriteBool('Poly_Enable','Series2',Form1.Series2.Active);
   DiagIni.WriteBool('Poly_Enable','Series3',Form1.Series3.Active);
   DiagIni.WriteBool('Poly_Enable','Series4',Form1.Series4.Active);
   DiagIni.WriteBool('Poly_Enable','Series5',Form1.Series5.Active);
   DiagIni.WriteBool('Poly_Enable','Series6',Form1.Series6.Active);
   DiagIni.WriteBool('Poly_Enable','Series7',Form1.Series7.Active);
   DiagIni.WriteBool('Poly_Enable','Series8',Form1.Series8.Active);
   DiagIni.WriteBool('Poly_Enable','Series13',Form1.Series13.Active);
   DiagIni.WriteBool('Poly_Enable','Series14',Form1.Series14.Active);
   DiagIni.WriteBool('Poly_Enable','Series15',Form1.Series15.Active);
   DiagIni.WriteBool('Poly_Enable','Series16',Form1.Series16.Active);
   DiagIni.WriteBool('Poly_Enable','Series17',Form1.Series17.Active);
   DiagIni.WriteBool('Poly_Enable','Series18',Form1.Series18.Active);
   DiagIni.WriteBool('Poly_Enable','Series19',Form1.Series19.Active);
   DiagIni.WriteBool('Poly_Enable','Series20',Form1.Series20.Active);
   DiagIni.WriteBool('Poly_Enable','Series21',Form1.Series21.Active);
   DiagIni.WriteBool('Poly_Enable','Series24',Form1.Series24.Active);
   DiagIni.WriteBool('Poly_Enable','Series25',Form1.Series25.Active);
   DiagIni.WriteBool('Poly_Enable','Series26',Form1.Series26.Active);
   DiagIni.WriteBool('Poly_Enable','Series27',Form1.Series27.Active);
   DiagIni.WriteBool('Poly_Enable','Series28',Form1.Series28.Active);
   DiagIni.WriteBool('Poly_Enable','Series29',Form1.Series29.Active);

   DiagIni.WriteInteger('OSC_Address','Osc_Adr_1',StrToInt(Form1.Edit1.Text));
   DiagIni.WriteInteger('OSC_Address','Osc_Adr_2',StrToInt(Form1.Edit2.Text));
   DiagIni.WriteInteger('OSC_Address','Osc_Adr_3',StrToInt(Form1.Edit3.Text));
   DiagIni.WriteInteger('OSC_Address','Osc_Adr_4',StrToInt(Form1.Edit4.Text));
   DiagIni.WriteInteger('OSC_Address','Osc_Adr_5',StrToInt(Form1.Edit5.Text));
   DiagIni.WriteInteger('OSC_Address','Osc_Adr_6',StrToInt(Form1.Edit6.Text));
   DiagIni.WriteInteger('OSC_Address','Osc_Adr_7',StrToInt(Form1.Edit7.Text));
   DiagIni.WriteInteger('OSC_Address','Osc_Adr_8',StrToInt(Form1.Edit8.Text));
   DiagIni.WriteInteger('OSC_Address','Osc_Adr_9',StrToInt(Form1.Edit9.Text));
   DiagIni.WriteInteger('OSC_Address','Osc_Adr_10',StrToInt(Form1.Edit10.Text));
   DiagIni.WriteInteger('OSC_Address','Osc_Adr_11',StrToInt(Form1.Edit11.Text));
   DiagIni.WriteInteger('OSC_Address','Osc_Adr_12',StrToInt(Form1.Edit12.Text));
   DiagIni.WriteInteger('OSC_Address','Osc_Adr_13',StrToInt(Form1.Edit14.Text));
   DiagIni.WriteInteger('OSC_Address','Osc_Adr_14',StrToInt(Form1.Edit15.Text));
   DiagIni.WriteInteger('OSC_Address','Osc_Adr_15',StrToInt(Form1.Edit16.Text));
   DiagIni.WriteInteger('OSC_Address','Osc_Adr_16',StrToInt(Form1.Edit17.Text));
   DiagIni.WriteInteger('OSC_Address','Osc_Adr_17',StrToInt(Form1.Edit88.Text));
   DiagIni.WriteInteger('OSC_Address','Osc_Adr_18',StrToInt(Form1.Edit89.Text));
   DiagIni.WriteInteger('OSC_Address','Osc_Adr_19',StrToInt(Form1.Edit90.Text));
   DiagIni.WriteInteger('OSC_Address','Osc_Adr_20',StrToInt(Form1.Edit91.Text));
   DiagIni.WriteInteger('OSC_Address','Osc_Adr_21',StrToInt(Form1.Edit452.Text));
   DiagIni.WriteInteger('OSC_Address','Osc_Adr_22',StrToInt(Form1.Edit453.Text));
   DiagIni.WriteInteger('OSC_Address','Osc_Adr_23',StrToInt(Form1.Edit457.Text));
   DiagIni.WriteInteger('OSC_Address','Osc_Adr_24',StrToInt(Form1.Edit458.Text));

   DiagIni.WriteInteger('Sel_OSC','Sel_OSC_1',StrToInt(Form1.Edit100.Text));
   DiagIni.WriteInteger('Sel_OSC','Sel_TestPoint',StrToInt(Form1.Edit427.Text));
   DiagIni.WriteInteger('Sel_OSC','Sel_RoadVAR',StrToInt(Form1.Edit418.Text));

   DiagIni.WriteInteger('OSC_Address_AT1','Osc_Adr_5',StrToInt(Form1.Edit18.Text));
   DiagIni.WriteInteger('OSC_Address_AT1','Osc_Adr_6',StrToInt(Form1.Edit19.Text));

   DiagIni.WriteBool('OSC_Enable','Enable1',Form1.CheckBox1.Checked);
   DiagIni.WriteBool('OSC_Enable','Enable2',Form1.CheckBox2.Checked);
   DiagIni.WriteBool('OSC_Enable','Enable3',Form1.CheckBox3.Checked);
   DiagIni.WriteBool('OSC_Enable','Enable4',Form1.CheckBox4.Checked);
   DiagIni.WriteBool('OSC_Enable','Enable5',Form1.CheckBox5.Checked);
   DiagIni.WriteBool('OSC_Enable','Enable6',Form1.CheckBox6.Checked);
   DiagIni.WriteBool('OSC_Enable','Enable7',Form1.CheckBox7.Checked);
   DiagIni.WriteBool('OSC_Enable','Enable8',Form1.CheckBox8.Checked);
   DiagIni.WriteBool('OSC_Enable','Enable9',Form1.CheckBox9.Checked);
   DiagIni.WriteBool('OSC_Enable','Enable10',Form1.CheckBox10.Checked);
   DiagIni.WriteBool('OSC_Enable','Enable11',Form1.CheckBox11.Checked);
   DiagIni.WriteBool('OSC_Enable','Enable12',Form1.CheckBox12.Checked);
   DiagIni.WriteBool('OSC_Enable','Enable13',Form1.CheckBox86.Checked);
   DiagIni.WriteBool('OSC_Enable','Enable14',Form1.CheckBox87.Checked);
   DiagIni.WriteBool('OSC_Enable','Enable15',Form1.CheckBox88.Checked);
   DiagIni.WriteBool('OSC_Enable','Enable16',Form1.CheckBox89.Checked);
   DiagIni.WriteBool('OSC_Enable','Enable17',Form1.CheckBox100.Checked);
   DiagIni.WriteBool('OSC_Enable','Enable18',Form1.CheckBox101.Checked);
   DiagIni.WriteBool('OSC_Enable','Enable19',Form1.CheckBox102.Checked);
   DiagIni.WriteBool('OSC_Enable','Enable20',Form1.CheckBox103.Checked);
   DiagIni.WriteBool('OSC_Enable','Enable21',Form1.CheckBox341.Checked);
   DiagIni.WriteBool('OSC_Enable','Enable22',Form1.CheckBox342.Checked);
   DiagIni.WriteBool('OSC_Enable','Enable23',Form1.CheckBox343.Checked);
   DiagIni.WriteBool('OSC_Enable','Enable24',Form1.CheckBox346.Checked);

   DiagIni.WriteInteger('OSC_Color','Color_1',Form1.Label56.Font.Color);
   DiagIni.WriteInteger('OSC_Color','Color_2',Form1.Label57.Font.Color);
   DiagIni.WriteInteger('OSC_Color','Color_3',Form1.Label58.Font.Color);
   DiagIni.WriteInteger('OSC_Color','Color_4',Form1.Label59.Font.Color);
   DiagIni.WriteInteger('OSC_Color','Color_5',Form1.Label60.Font.Color);
   DiagIni.WriteInteger('OSC_Color','Color_6',Form1.Label61.Font.Color);
   DiagIni.WriteInteger('OSC_Color','Color_7',Form1.Label62.Font.Color);
   DiagIni.WriteInteger('OSC_Color','Color_8',Form1.Label63.Font.Color);
   DiagIni.WriteInteger('OSC_Color','Color_9',Form1.Label64.Font.Color);
   DiagIni.WriteInteger('OSC_Color','Color_10',Form1.Label65.Font.Color);
   DiagIni.WriteInteger('OSC_Color','Color_11',Form1.Label66.Font.Color);
   DiagIni.WriteInteger('OSC_Color','Color_12',Form1.Label67.Font.Color);
   DiagIni.WriteInteger('OSC_Color','Color_13',Form1.Label259.Font.Color);
   DiagIni.WriteInteger('OSC_Color','Color_14',Form1.Label260.Font.Color);
   DiagIni.WriteInteger('OSC_Color','Color_15',Form1.Label261.Font.Color);
   DiagIni.WriteInteger('OSC_Color','Color_16',Form1.Label262.Font.Color);
   DiagIni.WriteInteger('OSC_Color','Color_17',Form1.Label279.Font.Color);
   DiagIni.WriteInteger('OSC_Color','Color_18',Form1.Label280.Font.Color);
   DiagIni.WriteInteger('OSC_Color','Color_19',Form1.Label281.Font.Color);
   DiagIni.WriteInteger('OSC_Color','Color_20',Form1.Label282.Font.Color);
   DiagIni.WriteInteger('OSC_Color','Color_21',Form1.Label687.Font.Color);
   DiagIni.WriteInteger('OSC_Color','Color_22',Form1.Label689.Font.Color);
   DiagIni.WriteInteger('OSC_Color','Color_23',Form1.Label690.Font.Color);
   DiagIni.WriteInteger('OSC_Color','Color_24',Form1.Label691.Font.Color);

   DiagIni.WriteBool('ROAD_Enable','Enable1',Form1.CheckBox13.Checked);
   DiagIni.WriteBool('ROAD_Enable','Enable2',Form1.CheckBox14.Checked);
   DiagIni.WriteBool('ROAD_Enable','Enable3',Form1.CheckBox15.Checked);
   DiagIni.WriteBool('ROAD_Enable','Enable4',Form1.CheckBox18.Checked);
   DiagIni.WriteBool('ROAD_Enable','Enable5',Form1.CheckBox17.Checked);
   DiagIni.WriteBool('ROAD_Enable','Enable6',Form1.CheckBox16.Checked);
   DiagIni.WriteBool('ROAD_Enable','Enable7',Form1.CheckBox21.Checked);
   DiagIni.WriteBool('ROAD_Enable','Enable8',Form1.CheckBox20.Checked);
   DiagIni.WriteBool('ROAD_Enable','Enable9',Form1.CheckBox19.Checked);
   DiagIni.WriteBool('ROAD_Enable','Enable10',Form1.CheckBox24.Checked);
   DiagIni.WriteBool('ROAD_Enable','Enable11',Form1.CheckBox23.Checked);
   DiagIni.WriteBool('ROAD_Enable','Enable12',Form1.CheckBox22.Checked);
   DiagIni.WriteBool('ROAD_Enable','Enable13',Form1.CheckBox90.Checked);
   DiagIni.WriteBool('ROAD_Enable','Enable14',Form1.CheckBox91.Checked);
   DiagIni.WriteBool('ROAD_Enable','Enable15',Form1.CheckBox92.Checked);
   DiagIni.WriteBool('ROAD_Enable','Enable16',Form1.CheckBox93.Checked);
   DiagIni.WriteBool('ROAD_Enable','Enable17',Form1.CheckBox96.Checked);
   DiagIni.WriteBool('ROAD_Enable','Enable18',Form1.CheckBox97.Checked);
   DiagIni.WriteBool('ROAD_Enable','Enable19',Form1.CheckBox98.Checked);
   DiagIni.WriteBool('ROAD_Enable','Enable20',Form1.CheckBox99.Checked);
   DiagIni.WriteBool('ROAD_Enable','Enable21',Form1.CheckBox347.Checked);
   DiagIni.WriteBool('ROAD_Enable','Enable22',Form1.CheckBox348.Checked);
   DiagIni.WriteBool('ROAD_Enable','Enable23',Form1.CheckBox349.Checked);
   DiagIni.WriteBool('ROAD_Enable','Enable24',Form1.CheckBox350.Checked);

   DiagIni.WriteBool('SEN_OSC_Enable','Enable1',Form1.CheckBox27.Checked);
   DiagIni.WriteBool('SEN_OSC_Enable','Enable2',Form1.CheckBox28.Checked);
   DiagIni.WriteBool('SEN_OSC_Enable','Enable3',Form1.CheckBox29.Checked);
   DiagIni.WriteBool('SEN_OSC_Enable','Enable4',Form1.CheckBox30.Checked);
   DiagIni.WriteBool('SEN_OSC_Enable','Enable5',Form1.CheckBox46.Checked);
   DiagIni.WriteBool('SEN_OSC_Enable','Enable6',Form1.CheckBox47.Checked);

   DiagIni.WriteBool('Ôàéë ïðîãðàììèðîâàíèÿ DZ',
                     'Íå çàïèñûâàòü Config',Form1.CheckBox134.Checked);
   DiagIni.WriteBool('Ôàéë ïðîãðàììèðîâàíèÿ DZ',
                     'Íå çàïèñûâàòü Const',Form1.CheckBox135.Checked);

   DiagIni.WriteString('RoadDir','RoadDir',RoadDir);
   DiagIni.WriteString('ProtDir','ProtDir',ProtDir);

   DiagIni.WriteString('Ôàéë ïðîãðàììèðîâàíèÿ CANUSB àäàïòåðà','Bin_File',UpGrade_File);
   DiagIni.WriteInteger('UpGrade_Serial', 'Com',UpGrade_ComNum);
   DiagIni.WriteInteger('UpGrade_Serial', 'Baudrate',UpGrade_ComBaudrate);

{    PK_Tip:=Form1.ComboBox4.ItemIndex;
    DiagIni.WriteInteger('TipPnevmo1','Tip',PK_Tip);
    case  Form1.ComboBox4.ItemIndex of
    0: TempStr:='Òèï íåîïðåäåëåí';
    1: TempStr:='TipPnevmo1';
    2: TempStr:='TipPnevmo2';
    end;

    DiagIni.WriteInteger(TempStr,'KUI',PK_Ku);
    DiagIni.WriteInteger(TempStr,'U0HI',PK_Ko div 256);
    DiagIni.WriteInteger(TempStr,'U0LI',PK_Ko mod 256);
    DiagIni.WriteInteger(TempStr,'KUD',PK_dKu);
    DiagIni.WriteInteger(TempStr,'U0HD',PK_dKoD);
    DiagIni.WriteInteger(TempStr,'U0LD',PK_Kv);  }
   DiagIni.Free;
end;

procedure TForm1.Button18Click(Sender: TObject);
begin
        if Form3.Visible then Exit;
        if Not(Com_Connected_F) then Exit;
        if (Sender as TButton).Name='BitBtn1' then ModCommand:=0;
        if (Sender as TButton).Name='Button18' then ModCommand:=1;
        if (Sender as TButton).Name='Button20' then ModCommand:=2;
        if (Sender as TButton).Name='Button22' then ModCommand:=3;
        if (Sender as TButton).Name='Button24' then ModCommand:=4;

        if (Sender as TButton).Name='Button19' then ModCommand:=1;
        if (Sender as TButton).Name='Button21' then ModCommand:=2;
        if (Sender as TButton).Name='Button23' then ModCommand:=3;
        if (Sender as TButton).Name='Button25' then ModCommand:=4;
//
        if (Sender as TButton).Name='Button34' then ModCommand:=5;
        if (Sender as TButton).Name='Button37' then ModCommand:=6;

        FormISO.ModCommand;
        Form3.Tag:=ModCommand*65536+StrToInt(MaskEdit1.Text);
        Form3.Visible:=True;
end;

//Ìåíÿåì öâåò êíîïêè
//ïåðâûé ïàðàìåòð - íîìåð Bitmapa â Image-ëèñòå
//âòîðîé ïàðàìåòð - íîìåð êíîïêè, íà êîòîðîé ìåíÿåì êàðòèíêó
procedure TForm1.ChangeImage(Im:Byte; i : integer);
begin
        if (SbColorBuf[i]=Im) then Exit;
        SbColorBuf[i]:=Im;
        GImage:= TBitmap.Create;
        Form1.IL1.GetBitmap(Im, GImage);
        SbArray[i].Glyph.Assign(GImage);
        SbArray[i].Refresh;
        GImage.Free;
end;

procedure TForm1.ViewError;
var   i: integer;
      ChIm :array[0..30] of Byte;
begin
     for i:=0 to Const_Image_Err_New do ChIm[i]:=0;
     for i:=0 to Image_Err_Num do
     begin
          if not Com_Connected_F then              ChIm[i]:=0
          else if Active_Errors_Array[i] <> 0 then ChIm[i]:=1 //êðàñíûé öâåò
             else if FormError.PasErr(i) <> 0 then ChIm[i]:=3 // æåëòûé öâåò
                else ChIm[i]:=2; //çåëåíûé öâåò
     end;
     if Com_Connected_F then begin
 //êîíôèãóðàöèÿ
        if not form1.CheckBox33.Checked then ChIm[11]:=0; //ChIm[11] dif
        if not form1.CheckBox32.Checked then ChIm[10]:=0; //ChIm[10] prop
        if not form1.CheckBox39.Checked then ChIm[16]:=0; //ChIm[16] dbr
        if ((not form1.CheckBox38.Checked)  and
           (not form1.CheckBox49.Checked)) then ChIm[14]:=0; //ChIm[14] b7
        if ((form1.RadioGroup1.ItemIndex <>2)  and
           (not form1.CheckBox49.Checked)) then ChIm[13]:=0; //ChIm[13] can
        if (Tip_CPU = 21) or (Tip_CPU = 2) or
           (Tip_Block > 3)
        then
        begin
        //íîâûé áëîê
            if (Sens_Config and  1) <> 1 then  ChIm[0]:=0;
            if (Sens_Config and  2) <> 2 then  ChIm[1]:=0;
            if (Sens_Config and  4) <> 4 then  ChIm[2]:=0;
            if (Sens_Config and  8) <> 8 then  ChIm[3]:=0;
            if (Sens_Config and  16) <> 16 then  ChIm[17]:=0;
            if (Sens_Config and  32) <> 32 then  ChIm[18]:=0;

            if (Mod_Config and  1) <> 1 then  ChIm[6]:=0;
            if (Mod_Config and  2) <> 2 then  ChIm[7]:=0;
            if (Mod_Config and  4) <> 4 then  ChIm[8]:=0;
            if (Mod_Config and  8) <> 8 then  ChIm[9]:=0;
            if (Mod_Config and  16) <> 16 then  ChIm[19]:=0;
            if (Mod_Config and  32) <> 32 then  ChIm[20]:=0;
 //           if (Mod_Config and  64) <> 64 then  ChIm[21]:=0;
  //          if not (((Mod_Config and  64) = 64) or ((Mod_Config and  128) = 128))
  //                                        then  ChIm[21]:=0;
            if (form1.RadioGroup9.ItemIndex = 2) then  ChIm[21]:=0; //Mpd T
            if (DSC_Config_3 and 2) = 0  then  ChIm[24]:=0; //MC3
            if (DSC_Config_2 and  128) = 0 then  ChIm[25]:=0; //Press
            if ChIm[24]<>0  then
            begin // åñòü MC3
                if (DSC_Config_2 and  16) <> 16 then  ChIm[23]:=0; //AGS
                if (DSC_Config_2 and  32) <> 32 then  ChIm[22]:=0; //SAS
                if (DSC_Config_2 and  64) <> 64 then  ChIm[26]:=0; //CANT
      //          if (DSC_Config_2 and  128) <> 128 then  ChIm[25]:=0; //Press
            end
            else begin
                ChIm[23]:=0; ChIm[22]:=0; ChIm[26]:=0; //ChIm[25]:=0;
            end;

        end;
//     if Const_Num_Err =16 then begin
//     ChIm[17]:=0; ChIm[18]:=0; ChIm[19]:=0; ChIm[20]:=0;
//     end;
     end; //end Com_Connected_F
//     for i:=0 to Const_Num_Err do ChangeImage(ChIm[i],i);
       for i:=0 to Const_Image_Err_New do ChangeImage(ChIm[i],i); //âñå
end;

procedure TForm1.Osc_Deffinition;
begin
        OscArray[1].Color:=Form1.Label56.Font.Color;
        OscArray[2].Color:=Form1.Label57.Font.Color;
        OscArray[3].Color:=Form1.Label58.Font.Color;
        OscArray[4].Color:=Form1.Label59.Font.Color;
        OscArray[5].Color:=Form1.Label60.Font.Color;
        OscArray[6].Color:=Form1.Label61.Font.Color;
        OscArray[7].Color:=Form1.Label62.Font.Color;
        OscArray[8].Color:=Form1.Label63.Font.Color;
        OscArray[9].Color:=Form1.Label64.Font.Color;
        OscArray[10].Color:=Form1.Label65.Font.Color;
        OscArray[11].Color:=Form1.Label66.Font.Color;
        OscArray[12].Color:=Form1.Label67.Font.Color;
        OscArray[13].Color:=Form1.Label259.Font.Color;
        OscArray[14].Color:=Form1.Label260.Font.Color;
        OscArray[15].Color:=Form1.Label261.Font.Color;
        OscArray[16].Color:=Form1.Label262.Font.Color;
        OscArray[17].Color:=Form1.Label279.Font.Color;
        OscArray[18].Color:=Form1.Label280.Font.Color;
        OscArray[19].Color:=Form1.Label281.Font.Color;
        OscArray[20].Color:=Form1.Label282.Font.Color;
          // 6 ñòðîêà
        OscArray[21].Color:=Form1.Label687.Font.Color;
        OscArray[22].Color:=Form1.Label689.Font.Color;
        OscArray[23].Color:=Form1.Label690.Font.Color;
        OscArray[24].Color:=Form1.Label691.Font.Color;

        OscArray[1].OscLabel:=Form1.Label56;
        OscArray[2].OscLabel:=Form1.Label57;
        OscArray[3].OscLabel:=Form1.Label58;
        OscArray[4].OscLabel:=Form1.Label59;
        OscArray[5].OscLabel:=Form1.Label60;
        OscArray[6].OscLabel:=Form1.Label61;
        OscArray[7].OscLabel:=Form1.Label62;
        OscArray[8].OscLabel:=Form1.Label63;
        OscArray[9].OscLabel:=Form1.Label64;
        OscArray[10].OscLabel:=Form1.Label65;
        OscArray[11].OscLabel:=Form1.Label66;
        OscArray[12].OscLabel:=Form1.Label67;
        OscArray[13].OscLabel:=Form1.Label259;
        OscArray[14].OscLabel:=Form1.Label260;
        OscArray[15].OscLabel:=Form1.Label261;
        OscArray[16].OscLabel:=Form1.Label262;
        OscArray[17].OscLabel:=Form1.Label279;
        OscArray[18].OscLabel:=Form1.Label280;
        OscArray[19].OscLabel:=Form1.Label281;
        OscArray[20].OscLabel:=Form1.Label282;
         // 6 ñòðîêà
        OscArray[21].OscLabel:=Form1.Label687;
        OscArray[22].OscLabel:=Form1.Label689;
        OscArray[23].OscLabel:=Form1.Label690;
        OscArray[24].OscLabel:=Form1.Label691;

        OscArray[1].Enabled:=CheckBox1.Checked;
        OscArray[2].Enabled:=CheckBox2.Checked;
        OscArray[3].Enabled:=CheckBox3.Checked;
        OscArray[4].Enabled:=CheckBox4.Checked;
        OscArray[5].Enabled:=CheckBox5.Checked;
        OscArray[6].Enabled:=CheckBox6.Checked;
        OscArray[7].Enabled:=CheckBox7.Checked;
        OscArray[8].Enabled:=CheckBox8.Checked;
        OscArray[9].Enabled:=CheckBox9.Checked;
        OscArray[10].Enabled:=CheckBox10.Checked;
        OscArray[11].Enabled:=CheckBox11.Checked;
        OscArray[12].Enabled:=CheckBox12.Checked;
        OscArray[13].Enabled:=CheckBox86.Checked;
        OscArray[14].Enabled:=CheckBox87.Checked;
        OscArray[15].Enabled:=CheckBox88.Checked;
        OscArray[16].Enabled:=CheckBox89.Checked;
        OscArray[17].Enabled:=CheckBox100.Checked;
        OscArray[18].Enabled:=CheckBox101.Checked;
        OscArray[19].Enabled:=CheckBox102.Checked;
        OscArray[20].Enabled:=CheckBox103.Checked;
        // 6 ñòðîêà
        OscArray[21].Enabled:=CheckBox341.Checked;
        OscArray[22].Enabled:=CheckBox342.Checked;
        OscArray[23].Enabled:=CheckBox343.Checked;
        OscArray[24].Enabled:=CheckBox346.Checked;

 // SenOscArray
        SenOscArray[1].Enabled:=CheckBox27.Checked;
        SenOscArray[2].Enabled:=CheckBox28.Checked;
        SenOscArray[3].Enabled:=CheckBox29.Checked;
        SenOscArray[4].Enabled:=CheckBox30.Checked;
        SenOscArray[5].Enabled:=CheckBox27.Checked;
        SenOscArray[6].Enabled:=CheckBox28.Checked;
        SenOscArray[7].Enabled:=CheckBox29.Checked;
        SenOscArray[8].Enabled:=CheckBox30.Checked;
        SenOscArray[9].Enabled:=CheckBox27.Checked;
        SenOscArray[10].Enabled:=CheckBox28.Checked;
        SenOscArray[11].Enabled:=CheckBox29.Checked;
        SenOscArray[12].Enabled:=CheckBox30.Checked;
        SenOscArray[13].Enabled:=CheckBox27.Checked;
        SenOscArray[14].Enabled:=CheckBox28.Checked;
        SenOscArray[15].Enabled:=CheckBox29.Checked;
        SenOscArray[16].Enabled:=CheckBox30.Checked;
        SenOscArray[17].Enabled:=CheckBox27.Checked;
        SenOscArray[18].Enabled:=CheckBox28.Checked;
        SenOscArray[19].Enabled:=CheckBox29.Checked;
        SenOscArray[20].Enabled:=CheckBox30.Checked;
        if (NumCh_Block <> 6) then begin
          CheckBox46.Checked:=false;
          CheckBox47.Checked:=false;
          end;
        SenOscArray[21].Enabled:=CheckBox46.Checked;
        SenOscArray[22].Enabled:=CheckBox47.Checked;
        SenOscArray[23].Enabled:=CheckBox46.Checked;
        SenOscArray[24].Enabled:=CheckBox47.Checked;
        SenOscArray[25].Enabled:=CheckBox46.Checked;
        SenOscArray[26].Enabled:=CheckBox47.Checked;
        SenOscArray[27].Enabled:=CheckBox46.Checked;
        SenOscArray[28].Enabled:=CheckBox47.Checked;
        SenOscArray[29].Enabled:=CheckBox46.Checked;
        SenOscArray[30].Enabled:=CheckBox47.Checked;

        Label101.Visible:=CheckBox27.Checked;
        Label103.Visible:=CheckBox28.Checked;
        Label104.Visible:=CheckBox29.Checked;
        Label105.Visible:=CheckBox30.Checked;
        Label106.Visible:=CheckBox27.Checked;
        Label107.Visible:=CheckBox28.Checked;
        Label108.Visible:=CheckBox29.Checked;
        Label109.Visible:=CheckBox30.Checked;
        Label171.Visible:=CheckBox27.Checked;
        Label172.Visible:=CheckBox28.Checked;
        Label173.Visible:=CheckBox29.Checked;
        Label174.Visible:=CheckBox30.Checked;
        Label179.Visible:=CheckBox27.Checked;
        Label180.Visible:=CheckBox28.Checked;
        Label181.Visible:=CheckBox29.Checked;
        Label182.Visible:=CheckBox30.Checked;
        Label198.Visible:=CheckBox27.Checked;
        Label204.Visible:=CheckBox28.Checked;
        Label206.Visible:=CheckBox29.Checked;
        Label208.Visible:=CheckBox30.Checked;
        Label215.Visible:=CheckBox46.Checked;
        Label217.Visible:=CheckBox46.Checked;
        Label219.Visible:=CheckBox46.Checked;
        Label221.Visible:=CheckBox46.Checked;
        Label223.Visible:=CheckBox46.Checked;
        Label632.Visible:=CheckBox46.Checked;
        Label634.Visible:=CheckBox46.Checked;
        Label636.Visible:=CheckBox46.Checked;
        Label637.Visible:=CheckBox46.Checked;

        Label216.Visible:=CheckBox47.Checked;
        Label218.Visible:=CheckBox47.Checked;
        Label220.Visible:=CheckBox47.Checked;
        Label222.Visible:=CheckBox47.Checked;
        Label224.Visible:=CheckBox47.Checked;
        Label633.Visible:=CheckBox46.Checked;
        Label635.Visible:=CheckBox46.Checked;
        Label638.Visible:=CheckBox46.Checked;
        Label639.Visible:=CheckBox46.Checked;

        SenOscArray[1].OscLabel:=Form1.Label71;
        SenOscArray[2].OscLabel:=Form1.Label75;
        SenOscArray[3].OscLabel:=Form1.Label76;
        SenOscArray[4].OscLabel:=Form1.Label77;
        SenOscArray[5].OscLabel:=Form1.Label78;
        SenOscArray[6].OscLabel:=Form1.Label79;
        SenOscArray[7].OscLabel:=Form1.Label80;
        SenOscArray[8].OscLabel:=Form1.Label102;
        SenOscArray[9].OscLabel:=Form1.Label110;
        SenOscArray[10].OscLabel:=Form1.Label111;
        SenOscArray[11].OscLabel:=Form1.Label112;
        SenOscArray[12].OscLabel:=Form1.Label170;
        SenOscArray[13].OscLabel:=Form1.Label183;
        SenOscArray[14].OscLabel:=Form1.Label184;
        SenOscArray[15].OscLabel:=Form1.Label185;
        SenOscArray[16].OscLabel:=Form1.Label186;
        SenOscArray[17].OscLabel:=Form1.Label175;
        SenOscArray[18].OscLabel:=Form1.Label176;
        SenOscArray[19].OscLabel:=Form1.Label177;
        SenOscArray[20].OscLabel:=Form1.Label178;

        SenOscArray[21].OscLabel:=Form1.Label215;
        SenOscArray[22].OscLabel:=Form1.Label216;
        SenOscArray[23].OscLabel:=Form1.Label217;
        SenOscArray[24].OscLabel:=Form1.Label218;
        SenOscArray[25].OscLabel:=Form1.Label219;
        SenOscArray[26].OscLabel:=Form1.Label220;
        SenOscArray[27].OscLabel:=Form1.Label221;
        SenOscArray[28].OscLabel:=Form1.Label222;
        SenOscArray[29].OscLabel:=Form1.Label223;
        SenOscArray[30].OscLabel:=Form1.Label224;

        SenOscArray[1].Color:=Form1.Label71.Font.Color;
        SenOscArray[2].Color:=Form1.Label75.Font.Color;
        SenOscArray[3].Color:=Form1.Label76.Font.Color;
        SenOscArray[4].Color:=Form1.Label77.Font.Color;
        SenOscArray[5].Color:=Form1.Label78.Font.Color;
        SenOscArray[6].Color:=Form1.Label79.Font.Color;
        SenOscArray[7].Color:=Form1.Label80.Font.Color;
        SenOscArray[8].Color:=Form1.Label102.Font.Color;

        SenOscArray[21].Color:=Form1.Label215.Font.Color;
        SenOscArray[22].Color:=Form1.Label216.Font.Color;
        SenOscArray[23].Color:=Form1.Label215.Font.Color;
        SenOscArray[24].Color:=Form1.Label216.Font.Color;
end;

procedure TForm1.Osc;
Var Loop,Xpoz,Ypoz:Integer;
begin
     if Button10.Caption='Paused' then Exit;
     if not SinxrOsc then exit;
     if not(Panel8.Visible) then begin
     For Loop:=1 to NumberOsc do
     begin
     Ypoz:= OscData[Loop];
     Xpoz:= OscPos;
        if OscArray[Loop].Enabled then
        begin
           OscBox.Canvas.Pen.Color:=OscArray[Loop].Color;
           OscBox.Canvas.MoveTo(OscArray[Loop].PreviousXPosition,
                  OscBox.Height-OscArray[Loop].PreviousYPosition-1);
           OscBox.Canvas.LineTo(Xpoz,OscBox.Height-Ypoz-1);
        end;
        OscArray[Loop].PreviousYPosition:=Ypoz;
        OscArray[Loop].PreviousXPosition:=Xpoz;
      end;
     end;
     Loop:=(OscPos mod NumberOsc)+1;
     if OscArray[Loop].Enabled then
     OscArray[Loop].OscLabel.Caption:=IntToStr(OscData[Loop])
     else OscArray[Loop].OscLabel.Caption:='';

     if (DrawGridF) and (not Form1.Panel8.Visible) then begin
           DrawGrid(Form1.OscBox);
           DrawGridF:=false;
           end;
     SinxrOsc:=false;
end;

procedure TForm1.OscStartPos;
Var Loop:Integer;
begin
     OscPos:=1;
     for Loop:=1 to NumberOsc do OscArray[Loop].PreviousXPosition:=0;
end;

procedure TForm1.SensOsc_Check;
Var Loop, Xpoz,Ypoz, LoopTo :Integer;
    mulK,D,Th,Tl:Extended;
    R:boolean;
begin
   if Form1.CheckBox331.Checked then
   begin
    Form1.Edit425.Visible:=True;
     if (Tip_Block > 3) then
     begin
        if Tip_Block = 7 then mulK:=0.0131  //7
                         else mulK:=0.0194;  //5
     end
     else mulK:=1;
    if (NumCh_Block = 6) then LoopTo:=30
    else LoopTo:=20;
    For Loop:=1 to LoopTo do
    begin
     case Loop of
     //àìïëèòóäà
     1..4,23,24:
        begin
           if Tip_Block = 7 then
                SenOscTest_Data[Loop]:=(SenOscData[Loop]*10.6/1000)
           else SenOscTest_Data[Loop]:=(SenOscData[Loop]*19.6/1000);
           if (SenOscTest_Data[Loop] < (SenOscTest_Thresh[Loop]*1.25)) and
              (SenOscTest_Data[Loop] > (SenOscTest_Thresh[Loop]*0.75))
              then SenOscTest_Result[Loop]:=1
              else SenOscTest_Result[Loop]:=0;
        end;
     // ñêîðîñòè
     5..8,21,22:
        begin
            SenOscTest_Data[Loop]:=Round(SenOscData[Loop]/2);
            if (SenOscTest_Data[Loop] = SenOscTest_Thresh[Loop])
              then SenOscTest_Result[Loop]:=1
              else SenOscTest_Result[Loop]:=0;
        end;
     // ïàññ òåñò W0_A1_U0 W0_A2_U0
     9..12,17..20,25..28:
        begin
           SenOscTest_Data[Loop]:=(SenOscData[Loop]*mulK);
           if (SenOscTest_Data[Loop] < (SenOscTest_Thresh[Loop]*1.20)) and
              (SenOscTest_Data[Loop] > (SenOscTest_Thresh[Loop]*0.80))
              then SenOscTest_Result[Loop]:=1
              else SenOscTest_Result[Loop]:=0;
        end;
     //òåñò áèåíèÿ
     13..16,29,30:
        begin
           if Tip_Block = 7 then
               SenOscTest_Data[Loop]:=(SenOscData[Loop]/100)
           else
           begin
            if SenOscData[Loop] > 0 then //äåëåíèå íà íîëü
               SenOscTest_Data[Loop]:=(1/(SenOscData[Loop]/256));
           end;
            if (SenOscTest_Data[Loop] < (SenOscTest_Thresh[Loop]*1.2)) and
              (SenOscTest_Data[Loop] > (SenOscTest_Thresh[Loop]*0.8))
              then SenOscTest_Result[Loop]:=1
              else SenOscTest_Result[Loop]:=0;
        end;
     end;
    end;
   if (NumCh_Block = 6) then
   begin
      R:= true;
      For Loop:=1 to 30 do
      if SenOscTest_Result[Loop] = 0 then R:= False;
   end
   else
   begin
      R:= true;
      For Loop:=1 to 20 do
      if SenOscTest_Result[Loop] = 0 then R:= False;
   end;
   if  R then  begin
                Form1.Edit425.Color:=clMoneyGreen;
                Form1.Edit425.Text:='Ok';
               end
         else  begin
                Form1.Edit425.Color:=clRed;
                Form1.Edit425.Text:='False';
               end;
   end
   else  Form1.Edit425.Visible:=False;
end;

procedure TForm1.SensOsc;
Var Loop, Xpoz,Ypoz:Integer;
    mulK:Extended;
begin
     if not SinxrSenOsc then exit;
     SensOsc_Check;
     if (Tip_Block > 3) then
     begin
        Form1.GroupBox40.Caption:='Tåñò áèåíèÿ';
        Form1.Label179.Visible:=false;
        Form1.Label180.Visible:=false;
        Form1.Label181.Visible:=false;
        Form1.Label182.Visible:=false;
        if Tip_Block = 7 then mulK:=0.0131  //7
                         else mulK:=0.0194;  //5
     end
     else mulK:=1;
     For Loop:=1 to 8 do
     begin
     Ypoz:= SenOscData[Loop];
     Xpoz:= SenOscPos;
        if SenOscArray[Loop].Enabled then
        begin
           PaintBox2.Canvas.Pen.Color:=SenOscArray[Loop].Color;
           PaintBox2.Canvas.MoveTo(SenOscArray[Loop].PreviousXPosition,
                  PaintBox2.Height-SenOscArray[Loop].PreviousYPosition-1);
           PaintBox2.Canvas.LineTo(Xpoz,PaintBox2.Height-Ypoz-1);
        end;
        SenOscArray[Loop].PreviousYPosition:=Ypoz;
        SenOscArray[Loop].PreviousXPosition:=Xpoz;
      end;

     if (NumCh_Block = 6) then
      For Loop:=21 to 24 do
     begin
     Ypoz:= SenOscData[Loop];
     Xpoz:= SenOscPos;
        if SenOscArray[Loop].Enabled then
        begin
           PaintBox2.Canvas.Pen.Color:=SenOscArray[Loop].Color;
           PaintBox2.Canvas.MoveTo(SenOscArray[Loop].PreviousXPosition,
                  PaintBox2.Height-SenOscArray[Loop].PreviousYPosition-1);
           PaintBox2.Canvas.LineTo(Xpoz,PaintBox2.Height-Ypoz-1);
        end;
        SenOscArray[Loop].PreviousYPosition:=Ypoz;
        SenOscArray[Loop].PreviousXPosition:=Xpoz;
     end;

     Loop:=(SenOscPos mod 30)+1;
     if SenOscArray[Loop].Enabled then
     case Loop of
     //àìïëèòóäà
     1..4,23,24: //SenOscArray[Loop].OscLabel.Caption:=IntToStr(Round(SenOscData[Loop]*19.6));
           if Tip_Block = 7 then
                SenOscArray[Loop].OscLabel.Caption:=
                FloatToStrF(SenOscData[Loop]*10.6/1000,ffFixed, 5,2)
           else SenOscArray[Loop].OscLabel.Caption:=
                FloatToStrF(SenOscData[Loop]*19.6/1000,ffFixed, 5,2);
     // ñêîðîñòè
     5..8,21,22:
            SenOscArray[Loop].OscLabel.Caption:=IntToStr(Round(SenOscData[Loop]/2));
     // ïàññ òåñò W0_A1_U0 W0_A2_U0
     9..12,17..20,25..28:// SenOscArray[Loop].OscLabel.Caption:=IntToStr(Round(SenOscData[Loop]*mulK));
            SenOscArray[Loop].OscLabel.Caption:=
            FloatToStrF(SenOscData[Loop]*mulK,ffFixed, 5,2);
     //òåñò áèåíèÿ
     13..16,29,30:
           if Tip_Block = 7 then
               SenOscArray[Loop].OscLabel.Caption:=
               FloatToStrF((SenOscData[Loop]/100),ffFixed, 5,2)
           else
           if Tip_Block >= 8 then
               SenOscArray[Loop].OscLabel.Caption:=
               FloatToStrF(1 +(SenOscData[Loop]/100),ffFixed, 5,2)
           else
           begin
            if SenOscData[Loop] > 0 then //äåëåíèå íà íîëü
            SenOscArray[Loop].OscLabel.Caption:=
            FloatToStrF(1/(SenOscData[Loop]/256),ffFixed, 5,2);
           end;
     end
     else SenOscArray[Loop].OscLabel.Caption:='';
     if (SenDrawGridF) then begin
           DrawGrid(PaintBox2);
           SenDrawGridF:=false;
           end;
     SinxrSenOsc:=false;
end;

procedure TForm1.LampOsc;
Var LColor : byte;
    LImage : TBitmap;
begin
   if  Com_Connected_F then
   begin
     if (BufLampOsc[3] and $10)=0 then   //ABS  ABS_OFFRoad
       //  BufLampOsc[3] and $01)=0 then   //  ABS_SW_Condition
         begin
         label97.Font.Color:=clWindowText;
         label97.Caption:='âûêëþ÷åí';
         end
         else
         begin
         label97.Font.Color:=ClRed;//Blue;
         label97.Caption:='âêëþ÷åí';
         end;
     if (BufLampOsc[1] and $10)=0 then   //ASR  ASR_disable
        //(BufLampOsc[3] and $02)=0 then     // ASR_SW_Condition
         begin
         label125.Font.Color:=clWindowText;
         label125.Caption:='âûêëþ÷åí';
         end
         else
         begin
         label125.Font.Color:=ClAqua;
         label125.Caption:='âêëþ÷åí';
         end;
     if (BufLampOsc[3] and $04)=0 then   // Warn_SW_Condition
         begin
         label124.Font.Color:=clWindowText;
         label124.Caption:='âûêëþ÷åí';
         end
         else
         begin
         label124.Font.Color:=ClRed;
         label124.Caption:='âêëþ÷åí';
         end;
     if (BufLampOsc[6] and $08)=0 then //TSET  TSET_SW_Activ
        // (BufLampOsc[6] and $08)=0 then
         begin
         label191.Font.Color:=clWindowText;
         label191.Caption:='âûêëþ÷åí';
         end
         else
         begin
         label191.Font.Color:=ClRed;
         label191.Caption:='âêëþ÷åí';
         end;

     LImage:= TBitmap.Create;
     if (BufLampOsc[4] and $08)=0 then LColor:=0 else LColor:=1;
     if LABSColor<>LColor then begin
           LABSColor:=LColor;
           Form1.IL1.GetBitmap(LColor, LImage);
           LampABS.Glyph.Assign(LImage);
           LampABS.Refresh;
           end;
     if (BufLampOsc[4] and $10)=0 then LColor:=0 else LColor:=2;
     if LASRColor<>LColor then begin
           LASRColor:=LColor;
           Form1.IL1.GetBitmap(LColor, LImage);
           LampASR.Glyph.Assign(LImage);
           LampASR.Refresh;
           end;
     if (BufLampOsc[8] and $08)=0 then LColor:=0 else LColor:=3;
     if LVDCColor<>LColor then begin
           LVDCColor:=LColor;
           Form1.IL1.GetBitmap(LColor, LImage);
           LampVDC.Glyph.Assign(LImage);
           LampVDC.Refresh;
           end;
//     Edit373.Text:=IntToStr(BufLampOsc[8]);
     LImage.Free;
 // Ñòîï-ñèãíàë
     if (DumpMOT[7] and 4)=4 then
     begin
       case (DumpMOT[7] and 8)  of
        0: if (BufLampOsc[3] and $08)=0 then
            begin
            label143.Font.Color:=clWindowText;
            label143.Caption:='âûêëþ÷åí'
            end
            else
            begin
            label143.Font.Color:=ClRed;
            label143.Caption:='âêëþ÷åí';
            end;
        8: begin
            if (Tip_Block > 3) then
            begin
               Edit13.Text:=FloatToStrF(BrakeDemand/20,ffFixed,4,2);
            end
            else
            begin
               Edit13.Text:=FloatToStrF((BufLampOsc[1]*
               DiagIni.ReadFloat('SenPress','K_u',0.1)),ffFixed,5,2);
            end
           end;
       end;
       {Label155.Caption:=IntToStr(StopCNT+
                DumpEPROM[ADRE('BADR_CNTBP')+2]*65536 +
                DumpEPROM[ADRE('BADR_CNTBP')+1]*256 +
                DumpEPROM[ADRE('BADR_CNTBP')] ) +'  ñðàáàòûâàíèé'; }
     end
     else
     begin
        label143.Font.Color:=clWindowText;
        Label143.Caption:='Íåò èíôîðìàöèè';
        Label155.Caption:='Íåò èíôîðìàöèè';
        Edit13.Text:='';
     end;
     // Pcb_Test
 //    FormPCB.PCB_Test;
   end
   else
   begin
     label97.Font.Color:=clWindowText;
     label97.Caption :='Íåò èíôîðìàöèè';
     label125.Font.Color:=clWindowText;
     label125.Caption:='Íåò èíôîðìàöèè';
     label124.Font.Color:=clWindowText;
     label124.Caption:='Íåò èíôîðìàöèè';
     label143.Font.Color:=clWindowText;
     Label143.Caption:='Íåò èíôîðìàöèè';
     label191.Font.Color:=clWindowText;
     Label191.Caption:='Íåò èíôîðìàöèè';
     LABSColor:=0;
     LASRColor:=0;
     LVDCColor:=0;
     LImage:= TBitmap.Create;
     Form1.IL1.GetBitmap(0, LImage);
     LampABS.Glyph.Assign(LImage);
     LampABS.Refresh;
     LampASR.Glyph.Assign(LImage);
     LampASR.Refresh;
     LampVDC.Glyph.Assign(LImage);
     LampVDC.Refresh;
     LImage.Free;
     Edit13.Text:='';
     Form1.Edit373.Visible:=False;
   end;
end;


procedure TForm1.Button3Click(Sender: TObject);
begin
   if Not(Com_Connected_F) then Exit;
   FormISO.DownLoadOscAddress;
   Panel8.Visible:=False;
   DrawGrid(OscBox);
   OscStartPos;
end;

procedure TForm1.DrawRoadTimer;
begin
   Form1.Label81.Caption:=IntToStr(CurrentRoadTimer);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
    if not Fl_DefConfigLoad then
    begin
      MainStatBar.Panels[0].Text := 'Ñâÿçü íå óñòàíîâëåíà! Ïîâòîðèòå';
      MainStatBar.ReFresh;
      Exit;
    end;
 //   if (PageControl1.ActivePageIndex<>3) and
 //      (PageControl3.ActivePageIndex<>4) then   //CAN
    if not RoadTest_Flag and
       not RoadEmul_Flag and
       not CAN_USB_Open then
    begin
        if Com_Connected_F
        then  MainStatBar.Panels[0].Text := 'Ñâÿçü c áëîêîì óñòàíîâëåíà'
        else  MainStatBar.Panels[0].Text := 'Ñâÿçü c áëîêîì îòñóòñòâóåò';
        MainStatBar.ReFresh;
        if Com_Connected_F
        then IL2.Draw(MainStatBar.Canvas,MainStatBar.Panels[0].Width+6,6, 1)
        else IL2.Draw(MainStatBar.Canvas,MainStatBar.Panels[0].Width+6,6, 0);
   end;
   if RepeatIni_F then
 //  if not Com_Connected_F then
   begin
// 'Âîññòàíîâëåíèå ñâÿçè ñ áëîêîì ...';
 //   if ComAdapter <> 2 then
 //if not Fl_ComCreate then
    Com_Init;
    ButtonConnected;
    BtnStart.Down:=True;
    if not(Com_InitBlock) then
        begin
            Form1.Timer1.Interval:=1100;//1200;
            BtnStart.Down:=False;
            BtnStart.Enabled:=True;
  //          if ComAdapter <> 2 then
            Com_Close;
          if  not ProtokolMake then  if not Cabel_F then  RepeatIni_F:=false;
          if ComAdapter <> 2 then RepeatIni_F:=false;
        end
    else
       begin
        Form1.Timer1.Interval:=550;
        RepeatIni_F:=false;
        // NEW
  //      if not Fl_DefConfigLoad then  Exit;
  {      begin
          DefConfigLoad;
          if Tip_Block < 8 then
          DumpATLoad(0,EEPROMSize);
        end; }
        ButtonConnected;
        CalibrState;
        DumpMOTcopy_to_DumpMOT;

        Button2.Enabled:=True;
        T1:=ComThread.Create(false);
        T1.Priority:=tpNormal;
        T2:=ScreenRefreshThread.Create(false);
        T2.Priority:=tpNormal;
      end;
   end;
end;

procedure TForm1.Close_Form2;
begin
     Form2.Caption:='';
     Form2.Label1.Caption:='';
     Form2.Label2.Caption:='';
     Form2.ProgressBar1.Position:=0;
     Form2.Visible:=False;
end;

procedure TForm1.PageControl3Change(Sender: TObject);
begin
    if not(Com_Connected_F) then  Exit;
    case  PageControl3.ActivePageIndex of
    0:  begin
        Com_RealTime_F:=False;
  {      if (Tip_CPU = 2) then begin
             GroupBox46.Visible:=false;
             GroupBox47.Visible:=false;
        end;  }
        end;
    1:  begin
                SenOscPos:=form1.PaintBox2.Width-1;
                Com_RealTime_F:=True;
                if not RoadTest_Flag then begin
                end;
        end;

     2: begin
  if (DumpMOT[7] and 4)=4 then begin
   case (DumpMOT[7] and 8)  of
   0:   begin
        Label144.Enabled:=false;
        Edit13.Visible:=false;
        Label142.Enabled:=true;
        Label143.Enabled:=true;
        end;
   8:   begin
        Label142.Enabled:=false;
        Label143.Enabled:=false;
        Label144.Enabled:=true;
        Edit13.Visible:=true;
        end;
   end;
        Label155.Enabled:=true;
   end
   else begin
        Label144.Enabled:=false;
        Edit13.Visible:=false;
        Label142.Enabled:=false;
        Label143.Enabled:=false;
        Label155.Enabled:=false;
   end;
        end;
    4:  begin
        DrawGrid(CANOssBox);
        end;

   end;
end;

procedure TForm1.EditAdrOssClick(Sender: TObject);
begin
      EditNum:=Sender;
      if Tip_Block < 8 then
      begin
        if not Panel8.Visible then LoadMotoRAM;
        Panel8.Visible := True;
      end;
end;

procedure TForm1.MotoGridOssClick(Sender: TObject);
begin


  (EditNum as TEdit).Text:=IntToStr(MotoRam[MotoGridOss.Row]);
  
end;

Procedure TForm1.LoadMotoRAM;
Var IncFile:TextFile;
    TestString,TempString:String;
    RamStart,RamAdr,TempInt,Loop:Integer;
    sr: TSearchRec;
begin
  TempString:=ExtractFilePath(Const_File)+'Abs_Regs.inc';
  if (FindFirst(TempString, faAnyFile, sr) <> 0) then
    begin
        MsgBox( PChar('Ôàéë Abs_Regs.inc íå íàéäåí.'),
              'Îøèáêà', MB_OK+MB_ICONERROR+MB_APPLMODAL);
        exit;
    end;
        AssignFile(IncFile,TempString);
        Reset(IncFile);
        RamStart:=0;
        Repeat
        ReadLn(IncFile,TestString);
        If Pos('RamStart',TestString)<>0 then
        begin
                RamStart:=Pos('$',TestString);
                Delete(TestString,1,RamStart-1);
                RamStart:=StrToInt(TestString);
        end;
        Until RamStart<>0;
        Repeat
                ReadLn(IncFile,TestString);
        Until Pos('org     RamStart',TestString)<>0;
        MotoGridOss.RowCount:=0;
        RamAdr:=0;
        Repeat
                ReadLn(IncFile,TestString);
                If (Pos(' ',TestString)<>1) and (Pos(';',TestString)<>1) and (Length(TestString)<>0)  then
                begin
                        TempString:=TestString;
                        Delete(TestString,Pos(' ',TestString),Length(TestString)-Pos(' ',TestString)+1);
                        Delete(TempString,1,Pos(' ds ',TempString));
                        Delete(TempString,1,2);
                        Repeat
                                Delete(TempString,1,1);
                                TempInt:=Pos(' ',TempString);
                        Until TempInt<>1;
                        Delete(TempString,TempInt,Length(TempString)-TempInt+1);
                        If Pos('T',TempString)<>0 then
                        Delete(TempString,Length(TempString),1);
                        TempInt:=StrToInt(TempString);

                            If   TempInt>1 then
                        For     Loop:=1 to TempInt do
                        begin
                                MotoRam[RamAdr]:=RamAdr+RamStart;
                                MotoGridOss.Cells[0,MotoGridOss.RowCount-1]:=TestString+'_'+IntToStr(Loop);
                                MotoGridOss.RowCount:=MotoGridOss.RowCount+1;
                                RamAdr:=RamAdr+1;
                        End else
                        begin
                                MotoRam[RamAdr]:=RamAdr+RamStart;
                                MotoGridOss.Cells[0,MotoGridOss.RowCount-1]:=TestString;
                                MotoGridOss.RowCount:=MotoGridOss.RowCount+1;
                                RamAdr:=RamAdr+1;
                        end;
                end;
        Until EOF(IncFile);
        CloseFile(IncFile);
end;

procedure TForm1.Edit14Click(Sender: TObject);
begin
   EditNum1:=Sender;
end;

procedure TForm1.KeyButtonClick(Sender: TObject);
var
   F : TextFile;
   failpsw : string;
   pswAnsi: AnsiString;
begin
   if  pswTrue then
   begin
       ShowMessage('Äîñòóï ê ñèñòåìíûì ôóíêöèÿì ðàçðåøåí');
       exit;
   end;
   System_PSW:='';
   pswAnsi := '';
   if not InputQuery('Äîñòóï ê ñèñòåìíûì ôóíêöèÿì',
               'Ââåäèòå êîä äîñòóïà',pswAnsi) then exit;
   System_PSW := string(pswAnsi);       // AnsiString → UnicodeString
   pswTrue := False;
   AssignFile(F, 'password.dll');
   {$I-}
   Reset(F);
   {$I+}
   //bFile := False;
   failpsw := '';
   if IOResult = 0 then
      begin
        // bFile := True;
         Read(F, failpsw);
         CloseFile(F);
         failpsw := Decrypt(failpsw,12345);
      end;
   if System_PSW <> psw then
      if System_PSW <> failpsw then
         begin
            MsgBox('Íåâåðíûé ïàðîëü!',
                                   'Îøèáêà',
                                   MB_OK + MB_ICONERROR + MB_APPLMODAL);
            Exit;
         end;
   pswTrue := True;
{   GImage:= TBitmap.Create;
   Form1.IL3.GetBitmap(6, GImage);
   ToolBar1.Images.ReplaceMasked(5,GImage,clNone);
   GImage.Free; }
   OscPage.TabVisible:=True;
   TabSheet1.TabVisible:=True;
   PageControl1Change(nil);
   LoadMotoEEPROM(Const_File);
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
    Osc_Deffinition;
end;

procedure TForm1.PolyBtnClick(Sender: TObject);
begin
        if not (Com_Connected_F) then exit;
        if Form1.ComboBox3.Text ='' then  exit;

         if (PolyBtn.Caption='Stop') and (PolyPhase <>2)then begin
         PolyBtn.Down:=false;
         PolyBtn.Refresh;
         exit;
         end;
        if  PolyBtn.Down then
          begin
            PolyBtn.Caption:='Stop';
            PolyBtn.Refresh;
            PolyPhase:=0;
            Poly_Abort_F:=false;
            FormISO.DownLoadOscAddress;
            StartPolygon;
            if  PolyPhase=0  then  begin
                                   Poly_Abort_F:=True;
                                   PolyBtn.Caption:='Start';
                                   PolyBtn.Down:=false;
                                   PolyBtn.Refresh;
                                   StatusBar1.Panels.Items[6].Text:='îøèáêà';
                                   end;
        end
        else begin
            Poly_Abort_F:=True;
            Screen.Cursor:=crArrow;
            StatusBar1.Panels.Items[6].Text:='ïðåðâàí';
        end;
end;

procedure TForm1.Chart1ClickLegend(Sender: TChart;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  idx: Integer;
begin
  idx := 1;//GetClickedLegendIndex(Sender, X, Y);
    case idx of
       0: if Series0.Active=False then Series0.Active:=True
                                           else Series0.Active:=False;
       1: if Series1.Active=False then Series1.Active:=True
                                           else Series1.Active:=False;
       2: if Series2.Active=False then Series2.Active:=True
                                           else Series2.Active:=False;
       3: if Series3.Active=False then Series3.Active:=True
                                           else Series3.Active:=False;
       4: if Series4.Active=False then Series4.Active:=True
                                           else Series4.Active:=False;
       5: if Series5.Active=False then Series5.Active:=True
                                           else Series5.Active:=False;
       6: if Series6.Active=False then Series6.Active:=True
                                           else Series6.Active:=False;
       7: if Series7.Active=False then Series7.Active:=True
                                           else Series7.Active:=False;
       8: if Series8.Active=False then Series8.Active:=True
                                           else Series8.Active:=False;
       9: if Series13.Active=False then Series13.Active:=True
                                             else Series13.Active:=False;
       10: if Series14.Active=False then Series14.Active:=True
                                             else Series14.Active:=False;
       11: if Series15.Active=False then Series15.Active:=True
                                             else Series15.Active:=False;
       12: if Series16.Active=False then Series16.Active:=True
                                             else Series16.Active:=False;
       13: if Series17.Active=False then Series17.Active:=True
                                             else Series17.Active:=False;
       14: if Series18.Active=False then Series18.Active:=True
                                             else Series18.Active:=False;
       15: if Series19.Active=False then Series19.Active:=True
                                             else Series19.Active:=False;
       16: if Series20.Active=False then Series20.Active:=True
                                             else Series20.Active:=False;
       17: if Series21.Active=False then Series21.Active:=True
                                             else Series21.Active:=False;
       18: if Series24.Active=False then Series24.Active:=True
                                             else Series24.Active:=False;
       19: if Series25.Active=False then Series25.Active:=True
                                             else Series25.Active:=False;
       20: if Series26.Active=False then Series26.Active:=True
                                             else Series26.Active:=False;
       21: if Series27.Active=False then Series27.Active:=True
                                             else Series27.Active:=False;
       22: if Series28.Active=False then Series28.Active:=True
                                             else Series28.Active:=False;
       23: if Series29.Active=False then Series29.Active:=True
                                             else Series29.Active:=False;
   end;
end;

procedure TForm1.LoadFileCar;
var   sr: TSearchRec;
begin
  if FindFirst((ExtractFilePath(Application.ExeName)+'/*.car'),faAnyFile, sr) = 0
  then    repeat
   Form1.ComboBox3.Items.Add(Copy(sr.Name,1,Pos('.',sr.Name)-1));
          until FindNext(sr) <> 0
  else    begin
    MsgBox( PChar('Ôàéë *.car íå íàéäåí.'), 'Îøèáêà',
                           MB_OK+MB_ICONERROR+MB_APPLMODAL);
    exit;
           end;
  i:=0;
  repeat
    if Form1.ComboBox3.Items.Strings[i]= FileCarName then
       Form1.ComboBox3.Text:=FileCarName;
    inc(i);
  until i=ComboBox3.Items.Capacity ;

end;




procedure TForm1.Label126Click(Sender: TObject);
begin
   DrawRoadTest(ScrollBar1.Position);
   Fl_vert:=True;
end;

procedure TForm1.Label70Click(Sender: TObject);
begin
   DrawRoadTest(ScrollBar1.Position);
   Fl_vert:=false;
end;

procedure TForm1.LampABSClick(Sender: TObject);
var     mask:byte;
begin
     if not Com_Connected_F then  exit;
     if (BufLampOsc[4] and 128)=0 then TestLampABS:=BufLampOsc[4];
     if  LampABS.Down then
     begin
       case  (TestLampABS and  24) of
       0: // ëàìïû âûêëþ÷åíû
          mask:=BufLampOsc[4] or 160;
       8: // LampABS_ON
          mask:=BufLampOsc[4] or 128;
       16: // LampASR_ON
          mask:=BufLampOsc[4] or 224;
       24: // ëàìïû âêëþ÷åíû
          mask:=BufLampOsc[4] or 192;
       end;
     end
     else  mask:=0;//BufLampOsc[4] and 95;//223;
     AdrTestLamp:=(AdrLamp+3);
     DatTestLamp:=mask;
     FormIso.TestLamp;
end;

procedure TForm1.LampASRClick(Sender: TObject);
var     mask:byte;
begin
     if  not Com_Connected_F then  exit;
     if (BufLampOsc[4] and 128)=0 then TestLampASR:=BufLampOsc[4];
     if  LampABS.Down then LampABS.Down:=false;
     if  LampASR.Down then
     begin
       case  (TestLampASR and  24) of
       0: // ëàìïû âûêëþ÷åíû
          mask:=BufLampOsc[4] or 192;
       8: // LampABS_ON
          mask:=BufLampOsc[4] or 224;
       16: // LampASR_ON
          mask:=BufLampOsc[4] or 128;
       24: // ëàìïû âêëþ÷åíû
          mask:=BufLampOsc[4] or 160;
       end;
     end
     else  mask:=0; //BufLampOsc[4] and 63;//191;
     AdrTestLamp:=(AdrLamp+3);
     DatTestLamp:=mask;
     FormIso.TestLamp;
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
   Label131.caption:= inttostr(TrackBar1.Position)+' %';
   if fl_PWM_Prop and (TrackBar1.Position = 0) then
   PWM:= 1
   else
   PWM:=Round(TrackBar1.Position*2.55);
   fl_PWM_Sinxr:=true;
   FormISO.PWM_Send;
end;

procedure  ReleOFF_After_Reset;
begin
// âûêëþ÷åíèå ðåëå ïîñëå Ðåñòàðòà
     DZ_PGMCnt:=$FF;
     FormISO.SendPGMcnt;
     repeat Application.ProcessMessages until Fl_SendPGMcnt;
end;

procedure  Kl15inh_Cnt_Clr;
begin
     DZ_InhCnt:=1;
     FormISO.SendInhcnt;
     repeat Application.ProcessMessages until Fl_SendInhcnt;
end;

procedure  Kl15inh_Cnt_Set;
begin
     DZ_InhCnt:=47;
     FormISO.SendInhcnt;
     repeat Application.ProcessMessages until Fl_SendInhcnt;
end;

procedure  ReleON_After_Reset;
begin
// âêëþ÷åíèå ðåëå ïîñëå Ðåñòàðòà
     DZ_PGMCnt:=0;
     FormISO.SendPGMcnt;
     repeat Application.ProcessMessages until Fl_SendPGMcnt;
end;

procedure  FlashUnProtected;
begin
// ÷òåíèå ïîñëåäíèé ñåêòîð EPROM DZ
   if ComBaudrate < 115200 then begin
   Fl_EPROM_FPROT:=false;
   FormISO.ReadEPROM_FPROT;
   repeat Application.ProcessMessages until Fl_EPROM_FPROT;
   if (FPROT = $D8) or (FPROT = $D9) or
      (FPROT = $DB) then
   begin
//ñíÿòèå çàùèòû Flash
       Fl_FlashProtect_Compleet:=false;
       Fl_EPROM_FPROT:=false;
       Flash_Protected:=false;
       FormISO.WriteEPROM_FPROT;
       repeat Application.ProcessMessages until Fl_EPROM_FPROT;
//       sleep(200);
// Ðåñòàðò MCU
       Fl_ResetMCU:=false;
       FormISO.ResetMCU;
       repeat Application.ProcessMessages until Fl_ResetMCU;
       Fl_FlashProtect_Compleet:=true;
   end
   else
// â DZ íåò çàùèòû Flash
   begin
       Fl_FlashProtect_Compleet:=true;
   end;
   end;
end;

procedure  FlashProtected;
begin
  if ComBaudrate < 115200 then begin
//óñòàíîâêà çàùèòû Flash
   Fl_EPROM_FPROT:=false;
   Flash_Protected:=true;
   FormISO.WriteEPROM_FPROT;
   repeat Application.ProcessMessages until Fl_EPROM_FPROT;
// Ðåñòàðò MCU
   Fl_ResetMCU:=false;
   FormISO.ResetMCU;
   repeat Application.ProcessMessages until Fl_ResetMCU;
// ÷òåíèå FPROT
   Fl_EPROM_FPROT:=false;
   FormISO.ReadEPROM_FPROT;
   repeat Application.ProcessMessages until Fl_EPROM_FPROT;
   if (FPROT = $D8) then Fl_FlashProtect_Compleet:=true
   else Fl_FlashProtect_Compleet:=false;
   Fl_ResetMCU:=false;
  end;
end;

procedure TForm1.Dump_SKU_CFG;
var
   DateTime : TDateTime;
   Year, Month, Day : Word;
   i,n,mask,TempAdr: integer;
   TempWord:Word;
   TempFloat:Real;
   TempStr:string;
//Label Label_End;
begin
//êîíôèãóðàöèÿ áëîêà
     case RadioGroup1.ItemIndex of
       0:  mask:=128;
       1:  mask:=32;
       2:  mask:=64;
     end;
     if not form1.CheckBox49.Checked  then  mask:= mask or 16;
     DumpMOT[0]:=(DumpMOT[0] and 15) or mask;

//÷èñëî çóáîâ
// Ïåðåäíÿÿ îñü
     if ( StrToInt(Form1.Edit26.Text)>120) or
        ( StrToInt(Form1.Edit26.Text)<60 ) then
     begin
        MsgBox( PChar('Íåâåðíûå ïàðàìåòðû ðîòîðà Ïåðåäíÿÿ îñü'),
              'Îøèáêà', MB_OK+MB_ICONERROR+MB_APPLMODAL);
        calibrSB.SimpleText := ' ';
        TabSheet8Show(nil);
        Fl_Dump_Fail := true;
        Exit;
     end;
     DumpMOT[1]:=StrToInt(Form1.Edit26.Text);
// Çàäíÿÿ îñü
     if ( StrToInt(Form1.Edit21.Text)>120) or
        ( StrToInt(Form1.Edit21.Text)<60 ) then
     begin
        MsgBox( PChar('Íåâåðíûå ïàðàìåòðû ðîòîðà Çàäíÿÿ îñü'),
              'Îøèáêà', MB_OK+MB_ICONERROR+MB_APPLMODAL);
        calibrSB.SimpleText := ' ';
        TabSheet8Show(nil);
        Fl_Dump_Fail := true;
        Exit;
     end;
     DumpMOT[113]:=StrToInt(Form1.Edit21.Text);
// Òðåòüÿ îñü
     if ( StrToInt(Form1.Edit174.Text)>120) or
        ( StrToInt(Form1.Edit174.Text)<60 ) then
     begin
        MsgBox( PChar('Íåâåðíûå ïàðàìåòðû ðîòîðà Òðåòüÿ îñü'),
              'Îøèáêà', MB_OK+MB_ICONERROR+MB_APPLMODAL);
        calibrSB.SimpleText := ' ';
        TabSheet8Show(nil);
        Fl_Dump_Fail := true;
        Exit;
     end;
     DumpMOT[119]:=StrToInt(Form1.Edit174.Text);

//êîýôôèöèåíòû ñêîðîñòè
// Ïåðåäíÿÿ îñü
     if ( StrToFloat(Form1.Edit27.Text)>1.5) or
        ( StrToFloat(Form1.Edit27.Text)<0.6 ) then
     begin
        MsgBox( PChar('Íåâåðíûå ïàðàìåòðû êîëåñà Ïåðåäíÿÿ îñü'),
              'Îøèáêà', MB_OK+MB_ICONERROR+MB_APPLMODAL);
        calibrSB.SimpleText := ' ';
        TabSheet8Show(nil);
        Fl_Dump_Fail := true;
        Exit;
     end;
     TempFloat:=2*SpeedConst*256/(StrToInt(Form1.Edit26.Text)*1000/
                          (3600*Pi*StrToFloat(Form1.Edit27.Text)));
     DumpMOT[2]:=Round(TempFloat) div 16777216;
     DumpMOT[3]:=(Round(TempFloat) mod 16777216) div 65536;
     DumpMOT[4]:=((Round(TempFloat) mod 16777216) mod 65536) div 256;
     DumpMOT[5]:=((Round(TempFloat) mod 16777216) mod 65536) mod 256;
     DumpMOT[6]:=Round(StrToInt(Form1.Edit26.Text)/(pi*StrToFloat(Form1.Edit27.Text)));
// Çàäíÿÿ îñü
     if ( StrToFloat(Form1.Edit22.Text)>1.5) or
        ( StrToFloat(Form1.Edit22.Text)<0.6 ) then
     begin
        MsgBox( PChar('Íåâåðíûå ïàðàìåòðû êîëåñà Çàäíÿÿ îñü'),
              'Îøèáêà', MB_OK+MB_ICONERROR+MB_APPLMODAL);
        calibrSB.SimpleText := ' ';
        TabSheet8Show(nil);
        Fl_Dump_Fail := true;
        Exit;
     end;
     TempFloat:=2*SpeedConst*256/(StrToInt(Form1.Edit21.Text)*1000/
                          (3600*Pi*StrToFloat(Form1.Edit22.Text)));
     DumpMOT[114]:=Round(TempFloat) div 16777216;
     DumpMOT[115]:=(Round(TempFloat) mod 16777216) div 65536;
     DumpMOT[116]:=((Round(TempFloat) mod 16777216) mod 65536) div 256;
     DumpMOT[117]:=((Round(TempFloat) mod 16777216) mod 65536) mod 256;
     DumpMOT[118]:=Round(StrToInt(Form1.Edit21.Text)/(pi*StrToFloat(Form1.Edit22.Text)));
// Òðåòüÿ îñü
     if ( StrToFloat(Form1.Edit22.Text)>1.5) or
        ( StrToFloat(Form1.Edit22.Text)<0.6 ) then
     begin
        MsgBox( PChar('Íåâåðíûå ïàðàìåòðû êîëåñà Òðåòüÿ îñü'),
              'Îøèáêà', MB_OK+MB_ICONERROR+MB_APPLMODAL);
        calibrSB.SimpleText := ' ';
        TabSheet8Show(nil);
        Fl_Dump_Fail := true;
        Exit;
     end;
     TempFloat:=2*SpeedConst*256/(StrToInt(Form1.Edit174.Text)*1000/
                          (3600*Pi*StrToFloat(Form1.Edit175.Text)));
     DumpMOT[120]:=Round(TempFloat) div 16777216;
     DumpMOT[121]:=(Round(TempFloat) mod 16777216) div 65536;
     DumpMOT[122]:=((Round(TempFloat) mod 16777216) mod 65536) div 256;
     DumpMOT[123]:=((Round(TempFloat) mod 16777216) mod 65536) mod 256;
     DumpMOT[124]:=Round(StrToInt(Form1.Edit174.Text)/(pi*StrToFloat(Form1.Edit175.Text)));
//íàñòðîéêè êíîïîê
  // ABS_SW
   case (RadioGroup2.ItemIndex)  of
   0:   begin
           DumpMOT[7]:=DumpMOT[7] and 254;
           DumpMOT[11]:=DumpMOT[11] or 64;
        end;
   1:   begin
           DumpMOT[7]:=DumpMOT[7] or 1;
           DumpMOT[11]:=DumpMOT[11] or 64;
        end;
   2:   begin
           DumpMOT[7]:=DumpMOT[7] and 254;
           DumpMOT[11]:=DumpMOT[11] and 191;
        end;
   end;

  // ASR_SW
   case (RadioGroup3.ItemIndex)  of
   0:   begin
           DumpMOT[7]:=DumpMOT[7] and 253;
           DumpMOT[11]:=DumpMOT[11] or 128;
        end;
   1:   begin
           DumpMOT[7]:=DumpMOT[7] or 2;
           DumpMOT[11]:=DumpMOT[11] or 128;
        end;
   2:   begin
           DumpMOT[7]:=DumpMOT[7] and 253;
           DumpMOT[11]:=DumpMOT[11] and 127;
        end;
   end;

//ñòîð ñèãíàë
{     if CheckBox25.Checked then
     begin
       DumpMOT[7]:=DumpMOT[7] or 4;
       if  RadioGroup4.ItemIndex=0 then DumpMOT[7]:=DumpMOT[7] and 247
                                   else DumpMOT[7]:=DumpMOT[7] or 8;
     end
     else  DumpMOT[7]:=DumpMOT[7] and 243; }
   case (RadioGroup4.ItemIndex)  of
   0:   begin
           DumpMOT[7]:=DumpMOT[7] and 247;
           DumpMOT[7]:=DumpMOT[7] or 4;
        end;
   1:   begin
           DumpMOT[7]:=DumpMOT[7] or 8;
           DumpMOT[7]:=DumpMOT[7] or 4;
        end;
   2:   begin
           DumpMOT[7]:=DumpMOT[7] and 247;
           DumpMOT[7]:=DumpMOT[7] and 243;
        end;
   end;

// ASR Óïðàâëåíèå òîðìîçàìè âêëþ÷åíî
// ASR_Two_Engine
     if  not CheckBox26.Checked then DumpMOT[7]:=DumpMOT[7] and 239
                                else DumpMOT[7]:=DumpMOT[7] or 16;
// ASR Óïðàâëåíèå äâèãàòåëåì âêëþ÷åíî
// èçìåðèòåëüíûå äàò÷êè äàâëåíèÿ
     if  not CheckBox35.Checked then DumpMOT[7]:=DumpMOT[7] and 223
                                else DumpMOT[7]:=DumpMOT[7] or 32;
// DBREnable
     if  not CheckBox36.Checked then DumpMOT[7]:=DumpMOT[7] and 191
                                else DumpMOT[7]:=DumpMOT[7] or 64;
// ACPT_Enable
     if  not CheckBox37.Checked then DumpMOT[7]:=DumpMOT[7] and 127
                                else DumpMOT[7]:=DumpMOT[7] or 128;
// TSCAE_Prior1
     DumpMOT[8]:=DumpMOT[8] and 207;
     case ComboBox5.ItemIndex of
       0:  DumpMOT[8]:=DumpMOT[8] or 0;
       1:  DumpMOT[8]:=DumpMOT[8] or 16;
       2:  DumpMOT[8]:=DumpMOT[8] or 32;
       3:  DumpMOT[8]:=DumpMOT[8] or 48;
     end;
     DumpMOT[9]:=252;
//Norm_Weel_Coef
     DumpMOT[10]:=Round((StrToInt(Form1.Edit26.Text)/
                       StrToFloat(Form1.Edit27.Text))/
                       (100/1.05)*128);
//Def_Config_1
     if  not CheckBox39.Checked then DumpMOT[11]:=DumpMOT[11] and 254
                                else DumpMOT[11]:=DumpMOT[11] or 1;
     if  not CheckBox31.Checked then DumpMOT[11]:=DumpMOT[11] and 253
                                else DumpMOT[11]:=DumpMOT[11] or 2;
     if  not CheckBox32.Checked then DumpMOT[11]:=DumpMOT[11] and 251
                                else DumpMOT[11]:=DumpMOT[11] or 4;
     if  not CheckBox33.Checked then DumpMOT[11]:=DumpMOT[11] and 247
                                else DumpMOT[11]:=DumpMOT[11] or 8;
     if  not CheckBox38.Checked then DumpMOT[11]:=DumpMOT[11] and 239
                                else DumpMOT[11]:=DumpMOT[11] or 16;
     if not CheckBoxLIM.Checked then DumpMOT[11]:=DumpMOT[11] and 223
                                else DumpMOT[11]:=DumpMOT[11] or 32;

// Press
     DumpMOT[12]:=StrToInt(Form1.Edit23.Text);
     DumpMOT[13]:=StrToInt(Form1.Edit24.Text);
     DumpMOT[14]:=StrToInt(Form1.Edit25.Text);
     DumpMOT[15]:=StrToInt(Form1.Edit28.Text);

// CAN
     DumpMOT[16]:=Round((StrToInt(Form1.Edit20.Text)/100*255));
     if StrToInt(Form1.Edit29.Text) <= 125 then
           DumpMOT[17]:=125-(StrToInt(Form1.Edit29.Text))
     else  DumpMOT[17]:=0;
     DumpMOT[18]:=StrToInt(Form1.Edit30.Text);
//Lim_Speed
     DumpMOT[19]:=SpinEdit1.Value;
     DumpMOT[20]:=0;
     DumpMOT[21]:=StrToInt(Form1.Edit31.Text);

//ïíåâìîöèëèíäð
     DumpMOT[22]:=StrToInt(Form1.Edit33.Text);
     DumpMOT[23]:=StrToInt(Form1.Edit34.Text) div 256;
     DumpMOT[24]:=StrToInt(Form1.Edit34.Text) mod 256;
     DumpMOT[25]:=StrToInt(Form1.Edit36.Text);
     DumpMOT[26]:=StrToInt(Form1.Edit37.Text);
     DumpMOT[27]:=StrToInt(Form1.Edit39.Text);

//Def_Config_2
//ðåãóëÿòîð EBL
    if  not CheckBox41.Checked then DumpMOT[28]:=DumpMOT[28] and 254
                               else DumpMOT[28]:=DumpMOT[28] or 1;
//ëàìïà ABS
    if  not CheckBox40.Checked then DumpMOT[28]:=DumpMOT[28] and 253
                               else DumpMOT[28]:=DumpMOT[28] or 2;
//ðåãóëÿòîð DTC
    if  not CheckBox34.Checked then DumpMOT[28]:=DumpMOT[28] and 251
                               else DumpMOT[28]:=DumpMOT[28] or 4;
// ÑAN mode1
    if  not CheckBox42.Checked then DumpMOT[28]:=DumpMOT[28] and 191
                               else DumpMOT[28]:=DumpMOT[28] or 64;
//íàñòðîéêè êíîïêè TSET
   case (RadioGroup6.ItemIndex)  of
   0:   begin
           DumpMOT[28]:=DumpMOT[28] and 247;
           DumpMOT[28]:=DumpMOT[28] or 16;
        end;
   1:   begin
           DumpMOT[28]:=DumpMOT[28] or 8;
           DumpMOT[28]:=DumpMOT[28] or 16;
        end;
   2:   begin
           DumpMOT[28]:=DumpMOT[28] and 239;
           DumpMOT[28]:=DumpMOT[28] and 247;
        end;
   end;

    if  not CheckBox43.Checked then DumpMOT[28]:=DumpMOT[28] and 223
                               else DumpMOT[28]:=DumpMOT[28] or 32;

// òÿãà÷  -1  ïðèöåï -0
    if  RadioGroup8.ItemIndex=1 then DumpMOT[28]:=DumpMOT[28] and 127
                                else DumpMOT[28]:=DumpMOT[28] or 128;
//Lim_Speed TSET
    DumpMOT[29]:=SpinEdit2.Value;

//Def_Config_3
    // 24V
    Case RadioGroup5.ItemIndex of
    0: DumpMOT[30]:=DumpMOT[30] and 254; //   24V
    1: DumpMOT[30]:=DumpMOT[30] or 1;    //   12V
    end;
    // Íîâûå êëþ÷è â ñòàðûõ áëîêàõ
    if CheckBox95.Checked then DumpMOT[30]:=DumpMOT[30] or 2
                          else DumpMOT[30]:=DumpMOT[30] and 253;
    // CAN DM1 ïîñòîÿííî
    if CheckBox126.Checked then DumpMOT[30]:=DumpMOT[30] or 4
                           else DumpMOT[30]:=DumpMOT[30] and 251;
    // Ëàìïà ïðèöåïà óñòàíîâëåíà
    if CheckBox127.Checked then DumpMOT[30]:=DumpMOT[30] or 8
                           else DumpMOT[30]:=DumpMOT[30] and 247;
    //Ðåæèì Ïîëèãîí èñïîëüçóåñÿ
    if CheckBox79.Checked then DumpMOT[30]:=DumpMOT[30] or 16
                          else DumpMOT[30]:=DumpMOT[30] and 239;
    // Àäðåñ CAN VDC Wabco
    if CheckBox94.Checked then DumpMOT[30]:=DumpMOT[30] or 32
                          else DumpMOT[30]:=DumpMOT[30] and 223;
    // TimeOut âêëþ÷åí
    if CheckBox133.Checked then DumpMOT[30]:=DumpMOT[30] or 64
                           else DumpMOT[30]:=DumpMOT[30] and 191;
    if (RadioGroup7.ItemIndex >= 7) and
       (RadioGroup7.ItemIndex <= 12)
                           then DumpMOT[30]:=DumpMOT[30] or 128  //6S/6M
                           else DumpMOT[30]:=DumpMOT[30] and 127;
    Def_Config_3:=DumpMOT[30];

//ABS_Config
    Case RadioGroup7.ItemIndex of
    0: DumpMOT[33]:=1;//   2S/1M
    1: DumpMOT[33]:=2;//   2S/2M
    2: DumpMOT[33]:=3;//   4S/2M
    3: DumpMOT[33]:=4;//   4S/3M
    4: DumpMOT[33]:=5;//   4S/3M
    5: DumpMOT[33]:=6;//   4S/4M
    6: DumpMOT[33]:=7;//   6S/3M
    7: DumpMOT[33]:=8;//   6S/4M
    8: DumpMOT[33]:=9;//   6S/4M
    9: DumpMOT[33]:=10;//  6S/5M
    10: DumpMOT[33]:=11;// 6S/5M
    11: DumpMOT[33]:=12;// 6S/6M
    end;
//Sens_Config
    Case DumpMOT[33] of
    1: DumpMOT[31]:=3; //   2S/1M
    2: DumpMOT[31]:=3; //   2S/2M
    3: DumpMOT[31]:=15;//   4S/2M
    4: DumpMOT[31]:=15;//   4S/3M
    5: DumpMOT[31]:=15;//   4S/3M
    6: DumpMOT[31]:=15;//   4S/4M
    7: DumpMOT[31]:=63;//   6S/3M
    8: DumpMOT[31]:=63;//   6S/4M
    9: DumpMOT[31]:=63;//   6S/4M
    10: DumpMOT[31]:=63;//  6S/5M
    11: DumpMOT[31]:=63;//  6S/5M
    12: DumpMOT[31]:=63;//  6S/6M
    end;
    Sens_Config:=DumpMOT[31];
//Mod_Config
    Case DumpMOT[33] of
    1: DumpMOT[32]:=1; //   2S/1M
    2: DumpMOT[32]:=12;//   2S/2M
    3: DumpMOT[32]:=12;//   4S/2M
    4: DumpMOT[32]:=13;//   4S/3M
    5: DumpMOT[32]:=7;//    4S/3M
    6: DumpMOT[32]:=15;//   4S/4M
    7: DumpMOT[32]:=13;//   6S/3M
    8: DumpMOT[32]:=15;//   6S/4M
    9: DumpMOT[32]:=29;//   6S/4M
    10: DumpMOT[32]:=61;//  6S/5M
    11: DumpMOT[32]:=31;//  6S/5M
    12: DumpMOT[32]:=63;//  6S/6M
    end;


   //  Êîíôèãóðàöèÿ Ìîäóëÿòîða ïðèöåïà
    Case RadioGroup9.ItemIndex of
       0: DumpMOT[32]:=DumpMOT[32] or 64; //   Ìîäóëÿòîð
       1: DumpMOT[32]:=DumpMOT[32] or 128;//   Äèô. êëàïàí
       2: DumpMOT[32]:=DumpMOT[32] or 0;  //   Íåò
    end;

    Sens_Config:=DumpMOT[31];
    Mod_Config:=DumpMOT[32];
//  DiffLock_Config
    if  not CheckBox53.Checked then DumpMOT[34]:=DumpMOT[34] and 253
                               else DumpMOT[34]:=DumpMOT[34] or 2;

    if (Tip_Block <> 3) then //or CheckBox318.Checked then
    begin
// DSC íàñòðîéêè

      L_base:=StrToFloat(Form1.Edit49.Text);          //áàçà â ìåòðàõ
      Kus:=pi*StrToFloat(Form1.Edit50.Text)/180; // ãðàäóñû â ðàäèàíû
      Vmc:=Sqrt(L_base/Kus);        //ñêîðîñòü â ì/ñ  ïðè êîòîðîé  Kus* V^2 = L
      K_L_Acker:= Round(L_base*3.6*3.6/Kus);
         // 1/Kus  óìíîæàåì íà L è íà ïåðåâîä ì/ñ â  êì/ñ 3.6
         // â êâàäðàòå
     Akk:=(Vmc/(2*L_base))*8192*2*K_L_Acker;
       // çíà÷åíèå àêêåðìàíà äëÿ Vv óìíîæàåì íà Ìw(ðàä.ñ) -8192
       // è íà çíàìåíàòåëü ðàâíûé 2*K_L
     K_Q_Acker:= Round(3.6/Kus); //ðàçìåðíîñòü óãëà ðàä -8192
     Ratio_Steer:= Round(8*65536/StrToFloat(Form1.Edit48.Text));   //ðàçìåðíîñòü óãëà ðàä -8192
     Car_Base:= Round(L_base*1024);

 // DSC_Config_1
     DumpMOT[35]:= 0;
   //Ðåæèì èñïîëüçóåñÿ
     if CheckBox55.Checked then DumpMOT[35]:=DumpMOT[35] or 1;
   // Ëàìïà DSC óñòàíîâëåíà
     if CheckBox56.Checked then DumpMOT[35]:=DumpMOT[35] or 2;
   // HillHolder TSET
     if CheckBox57.Checked then DumpMOT[35]:=DumpMOT[35] or 4;
   // óñòàíîâëåí Dif ïåðåäíåé îñè
     if CheckBox66.Checked then DumpMOT[35]:=DumpMOT[35] or 8;
   // Yaw Control òîðìîçàìè âêëþ÷åí
     if CheckBox59.Checked then DumpMOT[35]:=DumpMOT[35] or 16;
   // Yaw Control äâèãàòåëåì âêëþ÷åí
     if CheckBox60.Checked then DumpMOT[35]:=DumpMOT[35] or 32;
   // Roll Control âêëþ÷åí
     if CheckBox61.Checked then DumpMOT[35]:=DumpMOT[35] or 64;
   // SideSleep Control âêëþ÷åí
     if CheckBox62.Checked then DumpMOT[35]:=DumpMOT[35] or 128;
     DSC_Config_1:=DumpMOT[35];

 // DSC_Config_2
     DumpMOT[36]:= 0;
     // VDC brake light  àêòèâèðóåòñÿ
     if CheckBox63.Checked then DumpMOT[36]:=DumpMOT[36] or 1;
     // ÌîäåëèðîâàíèåTruckSim
     if CheckBox58.Checked then DumpMOT[36]:=DumpMOT[36] or 2;
     //  Êîíôèãóðàöèÿ Ìîäóëÿòîða ïðèöåïà
     Case RadioGroup9.ItemIndex of
       0: DumpMOT[36]:=DumpMOT[36] or 4;//   Ìîäóëÿòîð
       1: DumpMOT[36]:=DumpMOT[36] or 8;//   Äèô. êëàïàí
       2: DumpMOT[36]:=DumpMOT[36] or 0;//   Íåò
     end;
     // Ñåíñîð AGS óñòàíîâëåí
     if CheckBox54.Checked then DumpMOT[36]:=DumpMOT[36] or 16;
     // Ñåíñîð SAS óñòàíîâëåí
     if CheckBox82.Checked then DumpMOT[36]:=DumpMOT[36] or 32;
     // ÑAN ïðèöåïà óñòàíîâëåí
     if CheckBox84.Checked then DumpMOT[36]:=DumpMOT[36] or 64;
     // Ñåíñîð äàâëåíèÿ ïðèöåïà óñòàíîâëåí
     if CheckBox83.Checked then DumpMOT[36]:=DumpMOT[36] or 128;
     DSC_Config_2:=DumpMOT[36];
 // end DSC_Config_2

 // DSC_Ratio_Steer
     DumpMOT[37]:=Ratio_Steer div 256;
     DumpMOT[38]:=Ratio_Steer mod 256;
 // DSC_K_l_Acker
     DumpMOT[39]:=K_L_Acker div 256;
     DumpMOT[40]:=K_L_Acker mod 256;
 // DSC_K_Q_Acker
     DumpMOT[41]:=K_Q_Acker div 256;
     DumpMOT[42]:=K_Q_Acker mod 256;
 //  Car_Base    //áàçà â ìåòðàõ * 1024
     DumpMOT[43]:=Car_Base div 256;
     DumpMOT[44]:=Car_Base mod 256;

// Delay_Inj
   DumpMOT[49]:= StrToInt(Edit228.Text);
// Delay_Exh
   DumpMOT[50]:= StrToInt(Edit227.Text);
// ASR.Engine.CFG.Kpro
   DumpMOT[51]:= StrToInt(Edit357.Text);
// ASR.Engine.CFG.Kdif
   DumpMOT[52]:= StrToInt(Edit358.Text);

//DSC_Config_4
     DumpMOT[53]:= 0;
     if CheckBox106.Checked then DumpMOT[53]:=DumpMOT[53] or 1;   //Tire_Koef_Enable
     if CheckBox107.Checked then DumpMOT[53]:=DumpMOT[53] or 2;   //AccX_WyOS_Enable
     if CheckBox108.Checked then DumpMOT[53]:=DumpMOT[53] or 4;   //AccX_Pitch_Enable
     if CheckBox109.Checked then DumpMOT[53]:=DumpMOT[53] or 8;   // ASR_Torq_Filtr
     if CheckBox110.Checked then DumpMOT[53]:=DumpMOT[53] or 16;  // Çàâèñèìîñòü Load  Mu Road
     if CheckBox111.Checked then DumpMOT[53]:=DumpMOT[53] or 32;  // ASR_Torq_Turn
     if CheckBox112.Checked then DumpMOT[53]:=DumpMOT[53] or 64;  // ROP_notMIR
     if CheckBox122.Checked then DumpMOT[53]:=DumpMOT[53] or 128; // MIR Rear  Enable

     DumpMOT[45]:=StrToInt(Edit51.Text);
     DumpMOT[46]:= Round(StrToFloat(Form1.Edit52.Text)*20);
     DumpMOT[47]:= Round(StrToFloat(Form1.Edit55.Text)*20);

// ROP_SleepF
     DumpMOT[54]:= Round(StrToFloat(Form1.Edit56.Text)*256/100*4);
// ROP_SleepR
     DumpMOT[56]:= Round(StrToFloat(Form1.Edit58.Text)*256/100*4);
// ROP_SleepNF
     DumpMOT[164]:= Round(StrToFloat(Form1.Edit143.Text)*256/100*4);


// Offset Enable
     DumpMOT[57]:= 0;
     if CheckBox68.Checked then DumpMOT[57]:=DumpMOT[57] or 1; // PressSen_demand
     if CheckBox70.Checked then DumpMOT[57]:=DumpMOT[57] or 2; // ROP_Trailer_Break_Enable
     if CheckBox71.Checked then DumpMOT[57]:=DumpMOT[57] or 4; // Ñòàòóñû CAN ïðèöåïà
     if CheckBox105.Checked then DumpMOT[57]:=DumpMOT[57] or 8; // Ackerman
     if CheckBox75.Checked then DumpMOT[57]:=DumpMOT[57] or 16; // Steer Angle
     if CheckBox76.Checked then DumpMOT[57]:=DumpMOT[57] or 32; // Yaw Rate
     if CheckBox77.Checked then DumpMOT[57]:=DumpMOT[57] or 64; // Accel Y  **
     if CheckBox78.Checked then DumpMOT[57]:=DumpMOT[57] or 128; // Accel X **

//DSC_Config_3
     DumpMOT[58]:= 0;
 // Route_CANT
     if CheckBox74.Checked then DumpMOT[58]:=DumpMOT[58] or 1;
 // Êîíòðîëåð DSC óñòàíîâëåí
     if CheckBox85.Checked then DumpMOT[58]:=DumpMOT[58] or 2;
 // ROP_FrontPress_Lim
     if CheckBox67.Checked then DumpMOT[58]:=DumpMOT[58] or 4;
 // DYC_TrailerPress
     if CheckBox69.Checked then DumpMOT[58]:=DumpMOT[58] or 8;

//Orientation sensor
//Steer
     if CheckBox80.Checked then DumpMOT[58]:=DumpMOT[58] or 16;
// Omega_Z
     if CheckBox72.Checked then DumpMOT[58]:=DumpMOT[58] or 32;
// Acc_Y
     if CheckBox73.Checked then DumpMOT[58]:=DumpMOT[58] or 64;
// Acc_X
     if CheckBox81.Checked then DumpMOT[58]:=DumpMOT[58] or 128;

     if CheckBox73.Checked and
        CheckBox81.Checked then
        CheckBox299.Checked := true;
     if not CheckBox73.Checked and
        not CheckBox81.Checked then
        CheckBox299.Checked := false;
     if CheckBox80.Checked then
           CheckBox357.Checked := true
     else  CheckBox357.Checked := false;

// Car_CG_A
     A_base:=StrToFloat(Form1.Edit53.Text);          //CG A â ìåòðàõ
     Car_CG_A:= Round(1024*A_base);
     DumpMOT[59]:=Car_CG_A div 256;
     DumpMOT[60]:=Car_CG_A mod 256;

// ASR.Engine.CFG.Kpro
     DumpMOT[61]:= StrToInt(Edit359.Text);
// ASR.Engine.CFG.Kdif
     DumpMOT[62]:= StrToInt(Edit360.Text);

// Koef_FySa
     Koef_FySa:= Round(StrToFloat(Form1.Edit60.Text));
//     DumpMOT[63]:=Koef_FySa div 256;
//     DumpMOT[64]:=Koef_FySa mod 256;

// Tip ECAS
     if (Edit405.Text <>'') and (Edit405.Visible)
     then  DumpMOT[63]:= StrToInt(Edit405.Text)
     else  DumpMOT[63]:= 1;
// EmptyMass Truck  íåò
//     EmptyMass:= Round(StrToInt(Form1.Edit154.Text));
//     DumpMOT[63]:=EmptyMass div 256;
//     DumpMOT[64]:=EmptyMass mod 256;

//DSC_Pump_Set
     DumpMOT[65]:=Round(StrToFloat(Edit61.Text)*20);
     DumpMOT[66]:=Round(StrToFloat(Edit62.Text)*20);
//DSC_Tcut_Set
     DumpMOT[68]:=StrToInt(Edit66.Text);
//FrontDif.P_High
     DumpMOT[69]:=StrToInt(Edit69.Text);
// RearDif.P_High
     DumpMOT[71]:=StrToInt(Edit63.Text);
//  Ïàðàìåòðû  äèô. êëàïàíîâ
     DumpMOT[73]:=StrToInt(Edit67.Text); //Dif DelayOn
     DumpMOT[74]:=StrToInt(Edit68.Text);
     DumpMOT[75]:=StrToInt(Edit71.Text); //Dif DelayOff
     DumpMOT[76]:=StrToInt(Edit72.Text);

//dP_pump_F
      DumpMOT[70]:=Round(StrToFloat(Edit70.Text)*100);
//dP_pump_R
     DumpMOT[72]:=Round(StrToFloat(Edit64.Text)*100);
//dP_exh_F
     DumpMOT[48]:=Round(StrToFloat(Edit101.Text)*100);
//dP_exh_R
     DumpMOT[55]:=Round(StrToFloat(Edit57.Text)*100);

// Koef_Acc_Y_dVf
     Tfront:= StrToFloat(Form1.Edit73.Text);
     Koef_AydVf:= Round(2048*256/3.6/3.6/Tfront); //256/279
     DumpMOT[77]:=Koef_AydVf div 256;
     DumpMOT[78]:=Koef_AydVf mod 256;
// Sen_Steer_DigMax
     DumpMOT[79]:=StrToInt(Form1.Edit74.Text) div 256;
     DumpMOT[80]:=StrToInt(Form1.Edit74.Text) mod 256;

//   Ïàðàìåòðû  ïíåâìàòèêè
     DumpMOT[81]:=StrToInt(Edit79.Text); // Pmax
     DumpMOT[83]:=StrToInt(Edit75.Text); // K Exhaust Front
     DumpMOT[84]:=StrToInt(Edit76.Text); // K Inject  Front
     DumpMOT[85]:=StrToInt(Edit78.Text); // K Exhaust Rear
     DumpMOT[86]:=StrToInt(Edit77.Text); // K Inject  Rear

//   Ïàðàìåòðû  DYC
     DumpMOT[87]:=StrToInt(Edit92.Text); // DYC_K_PD_Prop
     DumpMOT[88]:=StrToInt(Edit93.Text);  // DYC_K_PD_Diff
     DumpMOT[89]:=StrToInt(Edit94.Text);  // OvSt_PDThresh
     DumpMOT[90]:=StrToInt(Edit95.Text);  // TorqueValue.Drag
     DumpMOT[91]:=StrToInt(Edit96.Text);  // TorqueValue.Min

//   Ïàðàìåòðû  ROP
     DumpMOT[67]:=StrToInt(Edit65.Text);              // ROP_PI_Kprop
 // dP Sleep
     DumpMOT[92]:=Round(StrToFloat(Edit97.Text)*100); //Ïîäêà÷êà EBL
     DumpMOT[93]:=Round(StrToFloat(Edit98.Text)*32);  // ROP_BrON_AccY
     DumpMOT[94]:=Round(StrToFloat(Edit99.Text)*32);  // ROP_EnON_AccY
     DumpMOT[82]:=Round(StrToFloat(Edit80.Text)*32);  // ROP.AccXdes

// Def_Conf_SPY
     DumpMOT[98]:= 0;
//Ðåæèì èñïîëüçóåñÿ
     if CheckBox64.Checked then DumpMOT[98]:=DumpMOT[98] or 128;
// SPY model Press for ABS
     if CheckBox65.Checked then DumpMOT[98]:=DumpMOT[98] or 64;

// Def_Rez
     DumpMOT[99]:= 0;
   end;  // end if Tip_Block = 5

//Òåêóùåå âðåìÿ
   DateTime := Now;
   DecodeDate(DateTime, Year, Month, Day);
   if Year<2000 then Year :=0
   else Year := Year - 2000;
//Çàïîëíÿåì ìàññèâ äàííûõ
 // if  Change_NumBlock then begin
   DumpMOT[100] := Year;
   DumpMOT[101] := Month;
   DumpMOT[102] := Day;
   Change_NumBlock:=False;
 // end;
   DumpMOT[103] := StrToInt(IndCod) div 65536;
   DumpMOT[104] := (StrToInt(IndCod) mod 65536) div 256;
   DumpMOT[105] := (StrToInt(IndCod) mod 65536) mod 256;
   DumpMOT[106]:=ADRE_Y_M;
   DumpMOT[107]:=ADRE_M_M;
   DumpMOT[108]:=ADRE_NH;
   DumpMOT[109]:=ADRE_NL;
   DumpMOT[110]:=VER_PO;
//
   DumpMOT[128] := StrToInt(Edit102.Text); // UnStON_DerOmegaZ
 //  DumpMOT[129]:= Round(StrToFloat(Edit103.Text)*256/100); // DYC.OvSt.WzLim 25% max
   DumpMOT[129] := Round(StrToFloat(Edit103.Text)*20);     // DYC Off Press 160 - 8bar
   DumpMOT[130] := StrToInt(Edit104.Text); // UnSt_PDThresh
   DumpMOT[131] := StrToInt(Edit105.Text); // DYC.CFG.Dif_dP
   DumpMOT[132] := Round(StrToFloat(Edit106.Text)*32);// DeltaWz_Lim  max 8dps
   DumpMOT[133] := StrToInt(Edit107.Text);  // VxNormR20m  Laden
   DumpMOT[134] := StrToInt(Edit108.Text); // Tcut
   DumpMOT[135] := Round(StrToFloat(Edit109.Text)*256/100); // __ROP_Ph3_dPexh
   DumpMOT[136] := StrToInt(Edit110.Text);  // VxNormR20m
   DumpMOT[137] := Round(StrToFloat(Edit111.Text)*32);// Yaw Bias_Thresh  max 8dps
   DumpMOT[138] := Round(StrToFloat(Edit112.Text)*143/8); // Thresh  SA max 14grad
   DumpMOT[139] := Round(StrToFloat(Edit113.Text)*128);  // Load.CFG.AxRunOut
   DumpMOT[140] := Round(StrToFloat(Edit114.Text)*20);   // Brake.Front.CFG.MDT_Pdes
   DumpMOT[141] := Round(StrToFloat(Edit115.Text)*20);   // Brake.Rear.CFG.MDT_Pdes
 //  DumpMOT[142] := Round(StrToFloat(Form1.Edit116.Text)*256/100*4); // DYC_Sleep F
   DumpMOT[142] := Round(StrToFloat(Form1.Edit116.Text)*16); //
   DumpMOT[143] := Round(StrToInt(Edit117.Text)*256/100); // ROP.CFG.Kgaz
   DumpMOT[144] := StrToInt(Edit118.Text); // ROP.CFG.EngInt
   DumpMOT[145] := StrToInt(Edit119.Text); // P2Fm
   DumpMOT[146] := Round(StrToFloat(Form1.Edit120.Text)*16);  // Vx Ph3
   DumpMOT[147] := Round(StrToFloat(Edit121.Text)*32);// Eng dWz  max 8dps
   DumpMOT[148] := StrToInt(Edit122.Text); // SpeedON
   DumpMOT[149] := Round(StrToInt(Edit123.Text)*256/100); // DYC_EngSleepOn 25% max
   DumpMOT[150] := Round(StrToFloat(Edit124.Text)*32);  // ROPengOFF dAy
//DSC_Config_5
   DumpMOT[151]:= 0;
// Çàïðåò Engine òèïà ASR
   if CheckBox114.Checked then DumpMOT[151]:=DumpMOT[151] or 1;
// Ôèëüòð Vx 1Hz
   if CheckBox115.Checked then DumpMOT[151]:=DumpMOT[151] or 2;
// AccY_Tilting
   if CheckBox116.Checked then DumpMOT[151]:=DumpMOT[151] or 4;
// Ðåãóëèðîâàíèå  AccY
   if CheckBox117.Checked then DumpMOT[151]:=DumpMOT[151] or 8;
// ON Check VxEnd
   if CheckBox118.Checked then DumpMOT[151]:=DumpMOT[151] or 16;
// TCO_Koef_Enable
   if CheckBox119.Checked then DumpMOT[151]:=DumpMOT[151] or 32;
// ROP PumpR cont
   if CheckBox120.Checked then DumpMOT[151]:=DumpMOT[151] or 64;
// DYC_PDout_Norm
   if CheckBox121.Checked then DumpMOT[151]:=DumpMOT[151] or 128;

// EngineTorquePeak
   EngineTorquePeak := StrToInt(Edit125.Text);
   DumpMOT[152]:=EngineTorquePeak div 256;
   DumpMOT[153]:=EngineTorquePeak mod 256;
   DumpMOT[154]:= Round(StrToFloat(Form1.Edit126.Text)*32);  // UnStAyON
// dWz  SAdec max 8dps
   DumpMOT[155] := Round(StrToFloat(Edit127.Text)*32);
//Çàäåðæêà Yaw
   DumpMOT[156] := Round(StrToFloat(Form1.Edit128.Text)*200);
// Trailer
   DumpMOT[157] := StrToInt(Edit131.Text); // Trailer Dif Kinj
   DumpMOT[158] := StrToInt(Edit132.Text); // Trailer Dif Kexh
   DumpMOT[159] := Round(StrToInt(Edit139.Text)/100*255); // Trailer Toff
   DumpMOT[160] := Round(StrToFloat(Edit140.Text)*20);     // DYC Press Desire 160 - 8bar
   //DSC_Config_6
   DumpMOT[161]:= 0;
   // FiltrTrailerPress_Enable
   if CheckBox123.Checked then DumpMOT[161]:=DumpMOT[161] or 1;
   // TrailerPress_Sensor_EBS11
   if CheckBox124.Checked then DumpMOT[161]:=DumpMOT[161] or 2;
   // UnSt Derivative Akker
   if CheckBox125.Checked then DumpMOT[161]:=DumpMOT[161] or 4;
   // UnSt Drag Act
   if CheckBox128.Checked then DumpMOT[161]:=DumpMOT[161] or 8;
   // P reg Tip2
   if CheckBox129.Checked then DumpMOT[161]:=DumpMOT[161] or 16;
   // Wref Correct
   if CheckBox130.Checked then DumpMOT[161]:=DumpMOT[161] or 32;
   // SSA_OmegaZ_Enable
   if CheckBox113.Checked then DumpMOT[161]:=DumpMOT[161] or 64;
   // Ïíåâìî ïîäâåñêà
   if CheckBox131.Checked then DumpMOT[161]:=DumpMOT[161] or 128;

   DumpMOT[162] := Round(StrToFloat(Edit141.Text)*20);     // ROP Press Desire 160 - 8bar
   DumpMOT[163]:= StrToInt(Form1.Edit142.Text); // SA Dash
   DumpMOT[165] := Round(StrToFloat(Edit144.Text)*20);     // Delta Press
   DumpMOT[166] := Round(StrToFloat(Edit155.Text)*32);
   DumpMOT[167] := Round(StrToFloat(Edit163.Text)*20);     // Äàâëåíèå îòñå÷êè P laden
   DumpMOT[168] := Round(StrToFloat(Edit164.Text)*100);     // Ïîðîã äàâëåíèÿ  dP laden
   DumpMOT[169] := StrToInt(Edit165.Text);  // EBL êîððåêöèÿ ïî çàìåäëåíèþ

// OffSet Break Press
  // DumpMOT[170] := Round(StrToFloat(Edit200.Text)*20/13.8768*256);
   DumpMOT[170] := Round(StrToFloat(Edit200.Text)/0.0027);
// OffSet ECAS Press
 //  DumpMOT[171] := Round(StrToFloat(Edit201.Text)*20/13.8768*256);
   DumpMOT[171] := Round(StrToFloat(Edit201.Text)/0.0027);
// Íàãðóçêà íà ñöåïêó  ,êã
   Hitch_MaxLoad:= Round(StrToInt(Form1.Edit168.Text));
   DumpMOT[172]:=Hitch_MaxLoad div 256;
   DumpMOT[173]:=Hitch_MaxLoad mod 256;
// FrontAxis_EmptyLoad
   FrontAxis_EmptyLoad:= Round(StrToInt(Form1.Edit169.Text));
   DumpMOT[174]:=FrontAxis_EmptyLoad div 256;
   DumpMOT[175]:=FrontAxis_EmptyLoad mod 256;
// RearAxis_EmptyLoad
   RearAxis_EmptyLoad:= Round(StrToInt(Form1.Edit170.Text));
   DumpMOT[176]:=RearAxis_EmptyLoad div 256;
   DumpMOT[177]:=RearAxis_EmptyLoad mod 256;
// EBL_Sleep
   DumpMOT[178]:= Round(StrToFloat(Form1.Edit171.Text)*256/100*4);
   
//DSC_Config_7
   DumpMOT[179]:= 0;
   // ROP Reg P Tip2
   if CheckBox136.Checked then DumpMOT[179]:=DumpMOT[179] or 1;
   // ROP_Eng_Off
   if CheckBox137.Checked then DumpMOT[179]:=DumpMOT[179] or 2;
   // Ïðîñêàëüçûâíèå
   if CheckBox138.Checked then DumpMOT[179]:=DumpMOT[179] or 4;
   // Êîðåêöèÿ êîýôôèöèåíòà
   if CheckBox139.Checked then DumpMOT[179]:=DumpMOT[179] or 8;
   // Çíàê êîýôôèöèåíòà
   if CheckBox140.Checked then DumpMOT[179]:=DumpMOT[179] or 16;
   // CAN Status Enable
   if CheckBox141.Checked then DumpMOT[179]:=DumpMOT[179] or 32;
   // ABS_PromExh_Front
   if CheckBox142.Checked then DumpMOT[179]:=DumpMOT[179] or 64;
   // Dif_CutM_Enable  EBL_dP_Corr Ôèëüòð 2Hz
   if CheckBox147.Checked then DumpMOT[179]:=DumpMOT[179] or 128;

// êîýôôèöèåíò
   DumpMOT[180]:= Round(StrToFloat(Form1.Edit172.Text)*256/100);
// ROP Pmax F
   DumpMOT[181]:= Round(StrToFloat(Edit176.Text)*20);
// ROP Pmax R
   DumpMOT[182]:= Round(StrToFloat(Edit177.Text)*20);
// Num_Axis
   DumpMOT[183]:= StrToInt(Edit178.Text);

//DSC_Config_8
   DumpMOT[184]:= 0;
// EBS12 Curvature
   if CheckBox143.Checked then DumpMOT[184]:=DumpMOT[184] or 1;
// OneWire Enable
   if CheckBox144.Checked then DumpMOT[184]:=DumpMOT[184] or 2;
// TSC_AE  Arbitrage
   if CheckBox25.Checked then DumpMOT[184]:=DumpMOT[184] or 4;
// Break abort DYC
   if CheckBox44.Checked then DumpMOT[184]:=DumpMOT[184] or 8;
// LowMu AntiGaz Enable
   if CheckBox51.Checked then DumpMOT[184]:=DumpMOT[184] or 16;
// Ïðîòèâ Ñêëàäûâàíèå
   if CheckBox52.Checked then DumpMOT[184]:=DumpMOT[184] or 32;
// Only Circle
   if CheckBox145.Checked then DumpMOT[184]:=DumpMOT[184] or 64;
// Roll Enable
   if CheckBox146.Checked then DumpMOT[184]:=DumpMOT[184] or 128;
//SSC.CFG.Ktg_Koef
   DumpMOT[185]:= StrToInt(Edit188.Text);

// EmptyMass Trailer
     EmptyMass:= Round(StrToInt(Form1.Edit189.Text));
     DumpMOT[186]:=EmptyMass div 256;
     DumpMOT[187]:=EmptyMass mod 256;
// ROP K1
   DumpMOT[188]:= StrToInt(Edit190.Text);
   DumpMOT[189]:= StrToInt(Edit191.Text);
// ROP K2
   DumpMOT[190]:= StrToInt(Edit192.Text);
 //  DumpMOT[191]:= StrToInt(Edit193.Text);
   DumpMOT[191]:= Round(StrToFloat(Edit193.Text)*20);

// ROP K3
   DumpMOT[192]:= StrToInt(Edit194.Text);
// EBL Tpump
   DumpMOT[193]:= StrToInt(Edit195.Text);

//DSC_Config_9
   DumpMOT[194]:= 0;
// Press Validation
   if CheckBox148.Checked then DumpMOT[194]:=DumpMOT[194] or 1;
// Press Sensor OffSet
   if CheckBox149.Checked then DumpMOT[194]:=DumpMOT[194] or 2;
// Trailer_Before_ROP_Enable
   if CheckBox150.Checked then DumpMOT[194]:=DumpMOT[194] or 4;
// Test Load **
   if CheckBox151.Checked then DumpMOT[194]:=DumpMOT[194] or 8;
// Load_Break_Metod2
   if CheckBox152.Checked then DumpMOT[194]:=DumpMOT[194] or 16;
// LoadDelay
   if CheckBox153.Checked then DumpMOT[194]:=DumpMOT[194] or 32;
// Ph1 Sleep Enable
   if CheckBox154.Checked then DumpMOT[194]:=DumpMOT[194] or 64;
// AUX_Press_Sens
   if CheckBox159.Checked then DumpMOT[194]:=DumpMOT[194] or 128;

// Front P_Ful
//   DumpMOT[195]:= StrToInt(Edit197.Text);
   DumpMOT[195] := Round(StrToFloat(Edit197.Text)*100);
// Rear  P_Ful
//   DumpMOT[196]:= StrToInt(Edit196.Text);
   DumpMOT[196] := Round(StrToFloat(Edit196.Text)*100);

// Front dP_Max
   DumpMOT[197]:= StrToInt(Edit198.Text);
// Rear  dP_Max
   DumpMOT[198]:= StrToInt(Edit199.Text);
// K_ExhTap
   DumpMOT[199]:= StrToInt(Edit221.Text);
// Êîýôôèöèåíò òðàïåöèè
//   DumpMOT[200] := Round(StrToFloat(Form1.Edit226.Text)/100*256*4);
   DumpMOT[200] := Round(StrToFloat(Form1.Edit226.Text)*10);
// Çàäåðæêà Load
   DumpMOT[201] := Round(StrToFloat(Form1.Edit202.Text)*200);
// EBL K4
   DumpMOT[202]:= Round(StrToFloat(Form1.Edit211.Text)*128);
//
   DumpMOT[203] := Round(StrToFloat(Edit214.Text)*20);

// Engine  K_P4
   DumpMOT[204]:= StrToInt(Edit215.Text);
// Engine  K_P2
   DumpMOT[205]:= StrToInt(Edit216.Text);
// Engine  K_Vx
   DumpMOT[206]:= StrToInt(Edit218.Text);
// Load.CFG.K_Pr
   DumpMOT[207]:= StrToInt(Edit219.Text);
// Çàäåðæêà Break
   DumpMOT[208] := Round(StrToFloat(Form1.Edit220.Text)*200);
// ROP.CFG.dAccY
   DumpMOT[209]:=Round(StrToFloat(Edit222.Text)*32);  // ROP.AccXdes
// Brake.CFG.dPincV_R
   DumpMOT[210] := Round(StrToFloat(Edit224.Text)*20*4);
// Brake.CFG.dPincV_F
   DumpMOT[211] := Round(StrToFloat(Edit223.Text)*20*4);

 // OffSet_AccY
     OffSet_temp:= Round(2048*StrToFloat(Form1.Edit54.Text));
     if OffSet_temp>0 then OffSet_AccY:=OffSet_temp
                      else OffSet_AccY:=65536+OffSet_temp;
     DumpMOT[212]:=OffSet_AccY div 256;
     DumpMOT[213]:=OffSet_AccY mod 256;
 // OffSet_AccX
 //    OffSet_temp:= Round(10*256*StrToFloat(Form1.Edit59.Text));
     OffSet_temp:= Round(2048*StrToFloat(Form1.Edit59.Text));
     if OffSet_temp>0 then OffSet_AccX:=OffSet_temp
                      else OffSet_AccX:=65536+OffSet_temp;
     DumpMOT[214]:=OffSet_AccX div 256;
     DumpMOT[215]:=OffSet_AccX mod 256;
 //Engine.CFG.TorqXX
     DumpMOT[216]:= StrToInt(Edit245.Text);
// ASR.CFG.Sleep
     DumpMOT[217]:= Round(StrToFloat(Edit294.Text)*10);

 // dP Pump
     DumpMOT[218]:= StrToInt(Edit248.Text);
// dP Exh
     DumpMOT[219]:= StrToInt(Edit247.Text);

// Grad_Inj Front
     DumpMOT[220]:= StrToInt(Edit253.Text);
// Grad_Exh Front
     DumpMOT[221]:= StrToInt(Edit254.Text);

     if  clrStateAGS then
     begin
     Vehicle_StateAGS:= 0;
     Vehicle_StateSAS:= 0;
     clrStateAGS := false;
     end;
// Vehicle_StateAGS
     DumpMOT[222] := Vehicle_StateAGS;
// Vehicle.StateSAS
     DumpMOT[223] := Vehicle_StateSAS;

// VIN
    for i:=1 to 17 do
    begin
      if Fl_VIN_CFG then
           Vehicle_VIN_Data[i]:=Ord(Vehicle_VIN_CFG[i]);
      if Fl_Clr_VIN then
           Vehicle_VIN_Data[i]:=48;
      DumpMOT[224+i-1]:= Vehicle_VIN_Data[i];
    end;
 // CFG_SetCod;
    if Fl_Clr_VIN then  DumpMOT[241]:= 0
    else
    if Fl_VIN_CFG then  DumpMOT[241] := CFG_SetCod;

//DSC_Config_10
     DumpMOT[242]:= 0;
// Engine ASR
   if CheckBox155.Checked then DumpMOT[242]:=DumpMOT[242] or 1;
// ASR Break Enable
   if CheckBox156.Checked then DumpMOT[242]:=DumpMOT[242] or 2;
// ASR Torque Enable
   if CheckBox157.Checked then DumpMOT[242]:=DumpMOT[242] or 4;
// ASR Engine Control
   if CheckBox158.Checked then DumpMOT[242]:=DumpMOT[242] or 8;
// ABS_BrCond_Enable
   if CheckBox160.Checked then DumpMOT[242]:=DumpMOT[242] or 16;
// Ph1 Dec Exhaust Enable
   if CheckBox161.Checked then DumpMOT[242]:=DumpMOT[242] or 32;
// ABS Break Enable
   if CheckBox164.Checked then DumpMOT[242]:=DumpMOT[242] or 64;
// ABS_BrCond_Enable
   if CheckBox165.Checked then DumpMOT[242]:=DumpMOT[242] or 128;

// Wheel_FL.CFG.Nz
     DumpMOT[243]:= StrToInt(Form1.Edit26.Text);
// Wheel_FL.CFG.Radius
     DumpMOT[244]:= Round(StrToFloat(Form1.Edit27.Text)*100);
// Wheel_RL.CFG.Nz
     DumpMOT[245]:= StrToInt(Form1.Edit21.Text);
// Wheel_RL.CFG.Radius
     DumpMOT[246]:= Round(StrToFloat(Form1.Edit22.Text)*100);

// Grad_Inj Rear
     DumpMOT[247]:= StrToInt(Edit266.Text);
// Grad_Exh Rear
     DumpMOT[248]:= StrToInt(Edit267.Text);
// Chamber Tip Front
     DumpMOT[249]:= StrToInt(Edit269.Text);
// Chamber Tip Rear
     DumpMOT[250]:= StrToInt(Edit270.Text);
// Efficiency
     DumpMOT[251]:= StrToInt(Edit273.Text);//Round(StrToFloat(Edit273.Text)*100);

//DSC_Config_11
     DumpMOT[252]:= 0;
// RearTire_Tandem
   if CheckBox162.Checked then DumpMOT[252]:=DumpMOT[252] or 1;
// DopTire_Tandem
   if CheckBox163.Checked then DumpMOT[252]:=DumpMOT[252] or 2;
// Press_Emul_Enable
   if CheckBox166.Checked then DumpMOT[252]:=DumpMOT[252] or 4;
// Ph1 Accel Enable
   if CheckBox167.Checked then DumpMOT[252]:=DumpMOT[252] or 8;
// Emul  Ay  Ax
   if CheckBox168.Checked then DumpMOT[252]:=DumpMOT[252] or 16;
// Emul Taxo
   if CheckBox169.Checked then DumpMOT[252]:=DumpMOT[252] or 32;
// Speed_HalfPeriod
   if CheckBox170.Checked then DumpMOT[252]:=DumpMOT[252] or 64;
// Adjst Repeat
   if CheckBox171.Checked then DumpMOT[252]:=DumpMOT[252] or 128;

//  ABS K Ph4 dP Front
   DumpMOT[253]:= StrToInt(Edit274.Text);
//  ABS K Ph4 dP Rear
   DumpMOT[254]:= StrToInt(Edit275.Text);
// ABS K Accel Front
   DumpMOT[255]:= StrToInt(Edit276.Text);
// ABS K Accel Rear
   DumpMOT[256]:= StrToInt(Edit277.Text);
// ABS K ForceZ Front
   DumpMOT[257]:= StrToInt(Edit278.Text);
// Rekursiya  K
   DumpMOT[258]:= StrToInt(Edit279.Text);
// ABS Press Min Front
   DumpMOT[259] := Round(StrToFloat(Edit280.Text)*20);
// ABS Press Min Rear
   DumpMOT[260] := Round(StrToFloat(Edit281.Text)*20);
// Accel ABS On Front
   DumpMOT[261] := Round(StrToFloat(Edit282.Text)*5);
// Pause
   DumpMOT[262]:= StrToInt(Edit283.Text);
// MIR_Front.CFG.dP0_L
   DumpMOT[263] := Round(StrToFloat(Edit286.Text)*100);
// MIR_Front.CFG.dP0_R
   DumpMOT[264]:= Round(StrToFloat(Edit284.Text)*100);
// MIR_Front.CFG.KdP
   DumpMOT[265]:= StrToInt(Edit285.Text);

//DSC_Config_12
   DumpMOT[266]:= 0;
// BC_AntiGAZ_Enable
   if CheckBox173.Checked then DumpMOT[266]:=DumpMOT[266] or 1;
// ROP_LoadB_Enable Îïðåäåëåíèå Load ïðè ROP
   if CheckBox172.Checked then DumpMOT[266]:=DumpMOT[266] or 2;
// ROP_Engine_Taxo
   if CheckBox174.Checked then DumpMOT[266]:=DumpMOT[266] or 4;
// Engine_EC1_Enable
   if CheckBox175.Checked then DumpMOT[266]:=DumpMOT[266] or 8;
// ASR_Taxo_Grad
   if CheckBox176.Checked then DumpMOT[266]:=DumpMOT[266] or 16;
// ASR_Taxo_Filtr
   if CheckBox177.Checked then DumpMOT[266]:=DumpMOT[266] or 32;
// ASR dTaxoLim
   if CheckBox178.Checked then DumpMOT[266]:=DumpMOT[266] or 64;
// ASR  DYC  Disable
   if CheckBox180.Checked then DumpMOT[266]:=DumpMOT[266] or 128;

// Accel ABS On Rear
   DumpMOT[267] := Round(StrToFloat(Edit288.Text)*5); //Wheel Accel òî÷íîñòü 0,2m/c2 max 51m/c2
// ASR.CFG.ThrP
   DumpMOT[268] := Round(StrToFloat(Edit291.Text)*100);
// ASR.CFG.dPump
   DumpMOT[269] := Round(StrToFloat(Edit292.Text)*100);
// ROP.CFG.Turn_OO
   Car_BaseOO:= Round(StrToFloat(Form1.Edit293.Text)*1024);
   DumpMOT[270]:=Car_BaseOO div 256;
   DumpMOT[271]:=Car_BaseOO mod 256;
// Wheel_FL.ABS.CFG.SleepOn
   DumpMOT[272]:= Round(StrToFloat(Edit289.Text)*10);  //Sleep òî÷íîñòü 0,1% max 24,9%
// Wheel_RL.ABS.CFG.SleepOn
   DumpMOT[273]:= Round(StrToFloat(Edit290.Text)*10);
// ASR.CFG.dTaxoLim
   DumpMOT[274]:= StrToInt(Edit246.Text);

//DSC_Config_13
   DumpMOT[275]:= 0;
// ABS  DYC  Disable
   if CheckBox179.Checked then DumpMOT[275]:=DumpMOT[275] or 1;
// Ph1 dExh1  Enable
   if CheckBox181.Checked then DumpMOT[275]:=DumpMOT[275] or 2;
// Ph1 dExh2  Enable
   if CheckBox182.Checked then DumpMOT[275]:=DumpMOT[275] or 4;
// Ph1 OffDec  Enable
   if CheckBox183.Checked then DumpMOT[275]:=DumpMOT[275] or 8;
// ABS_CutPh7_Disable
   if CheckBox184.Checked then DumpMOT[275]:=DumpMOT[275] or 16;
// Trailer Press  AUX2
   if CheckBox208.Checked then DumpMOT[275]:=DumpMOT[275] or 32;
// Break Press Sens CAN
   if CheckBox209.Checked then DumpMOT[275]:=DumpMOT[275] or 64;
// Validity abort DYC
   if CheckBox210.Checked then DumpMOT[275]:=DumpMOT[275] or 128;

// ASR PID Kpro
   DumpMOT[276]:= StrToInt(Form1.Edit295.Text);
// ASR PID IntI
   DumpMOT[277]:= StrToInt(Form1.Edit297.Text);
// ASR PID dif
   DumpMOT[278]:= StrToInt(Form1.Edit296.Text);
// ASR K load
   DumpMOT[279]:= StrToInt(Form1.Edit298.Text);

// ABS Ph6 dPF
   DumpMOT[280] := Round(StrToFloat(Edit299.Text)*100);
// ABS Ph6 dPR
   DumpMOT[281] := Round(StrToFloat(Edit300.Text)*100);
// ABS Ph6 KdPF
   DumpMOT[282]:= StrToInt(Form1.Edit301.Text);
// ABS Ph6 KdPR
   DumpMOT[283]:= StrToInt(Form1.Edit302.Text);
// ASR Speed On
   DumpMOT[284]:= StrToInt(Form1.Edit303.Text);
// ABS.CFG.SleepExh
   DumpMOT[285]:= Round(StrToFloat(Edit304.Text)*10);
// Fault Maska
   DumpMOT[286]:= 0;
// AGS  Zero Fail  Enable
   if CheckBox247.Checked then DumpMOT[286]:=DumpMOT[286] or 1;
// AGS  Mount Fail  Enable
   if CheckBox248.Checked then DumpMOT[286]:=DumpMOT[286] or 2;
// AGS  Install Fail  Enable
   if CheckBox249.Checked then DumpMOT[286]:=DumpMOT[286] or 4;
// SAS  Zero Fail  Enable
   if CheckBox250.Checked then DumpMOT[286]:=DumpMOT[286] or 8;
// SAS  Install Fail  Enable
   if CheckBox251.Checked then DumpMOT[286]:=DumpMOT[286] or 16;
// ModelStr  Install Fail  Enable
   if CheckBox252.Checked then DumpMOT[286]:=DumpMOT[286] or 32;
// Trailer Pnevmo Enable
   if CheckBox255.Checked then DumpMOT[286]:=DumpMOT[286] or 64;
// HillHolder Failure Enable
   if CheckBox275.Checked then DumpMOT[286]:=DumpMOT[286] or 128;

// ASR.CFG.Kgaz
 //  DumpMOT[287]:= StrToInt(Form1.Edit315.Text);
   DumpMOT[287] := Round(StrToInt(Edit315.Text)*256/100); // ROP.CFG.Kgaz

//DSC_Config_14
   DumpMOT[288]:= 0;
// EBL_HighP_Enable
   if CheckBox211.Checked then DumpMOT[288]:=DumpMOT[288] or 1;
// EBL_Pump_dP_CFG
   if CheckBox212.Checked then DumpMOT[288]:=DumpMOT[288] or 2;
// EBL_Ks_Enable
   if CheckBox213.Checked then DumpMOT[288]:=DumpMOT[288] or 4;
// ABS_BC Ph4 Enable
   if CheckBox214.Checked then DumpMOT[288]:=DumpMOT[288] or 8;
// ABS_Ph1 End  Accel
   if CheckBox215.Checked then DumpMOT[288]:=DumpMOT[288] or 16;
// ABS_Ph4 dP Metod2
   if CheckBox216.Checked then DumpMOT[288]:=DumpMOT[288] or 32;
// ABS_ExhTAI_Enable
   if CheckBox217.Checked then DumpMOT[288]:=DumpMOT[288] or 64;
// dAy Off Event
   if CheckBox218.Checked then DumpMOT[288]:=DumpMOT[288] or 128;

// ABS_Promotion AccMax
   DumpMOT[289]:= StrToInt(Form1.Edit316.Text);

//DSC_Config_15
   DumpMOT[290]:= 0;
// Ph3 End Accel Lim
   if CheckBox219.Checked then DumpMOT[290]:=DumpMOT[290] or 1;
// MIRF_dWZ_Enable
   if CheckBox220.Checked then DumpMOT[290]:=DumpMOT[290] or 2;
// SlipThr_Change
   if CheckBox221.Checked then DumpMOT[290]:=DumpMOT[290] or 4;
// SpeedThr ABS Enable
   if CheckBox222.Checked then DumpMOT[290]:=DumpMOT[290] or 8;
// ABS_SlipDec_Change
   if CheckBox223.Checked then DumpMOT[290]:=DumpMOT[290] or 16;
// ABS_End_Tip2
   if CheckBox224.Checked then DumpMOT[290]:=DumpMOT[290] or 32;
// MIRF ExhM Tip2
   if CheckBox225.Checked then DumpMOT[290]:=DumpMOT[290] or 64;
// Ph6_ddP_Tip2
   if CheckBox226.Checked then DumpMOT[290]:=DumpMOT[290] or 128;

// ProM Rear           km/h
   DumpMOT[291]:= Round(StrToFloat(Edit318.Text)*32);
// High Mu
   DumpMOT[292]:= Round(StrToFloat(Edit317.Text)*9.81*16);
// SlipThr Change     K
   DumpMOT[293]:= StrToInt(Form1.Edit319.Text);
// Speed OFF Min    km/h
   DumpMOT[294]:= Round(StrToFloat(Edit320.Text)*16);
// ABS.CFG.SleepEnd
   DumpMOT[295]:= Round(StrToFloat(Edit321.Text)*10);
// Relation Press
   DumpMOT[296]:= Round(StrToFloat(Edit322.Text)*10);
// ABS.CFG.T_ShExh  F
   DumpMOT[297]:= StrToInt(Form1.Edit323.Text);
//  P0 FL
   DumpMOT[298]:= StrToInt(Form1.Edit324.Text);//Round(StrToFloat(Edit324.Text)*100);
// Koef Short Exh Front
   DumpMOT[299]:= StrToInt(Form1.Edit325.Text);
// MIRF dWz
   DumpMOT[300]:= Round(StrToFloat(Edit326.Text)*32);//max 8dps
// MIRF dPmax
   DumpMOT[301]:= Round(StrToFloat(Edit327.Text)*100);

// ECAS.CFG.Susp_Mass
   DumpMOT[302]:= Round(StrToFloat(Edit328.Text)/10);

//DSC_Config_16
   DumpMOT[303]:= 0;
// ECAS_SP_Install
   if CheckBox229.Checked then DumpMOT[303]:=DumpMOT[303] or 1;
// PDeccel  50 - 15 km/h
   if CheckBox228.Checked then DumpMOT[303]:=DumpMOT[303] or 2;
// ABS Disable AxFail
   if CheckBox230.Checked then DumpMOT[303]:=DumpMOT[303] or 4;
// Psen1 Install
   if CheckBox231.Checked then DumpMOT[303]:=DumpMOT[303] or 8;
// Break_Tip_Front
   if CheckBox232.Checked then DumpMOT[303]:=DumpMOT[303] or 16;
// Break_Tip_Rear
   if CheckBox233.Checked then DumpMOT[303]:=DumpMOT[303] or 32;
// EBL_FzHg_Enable
   if CheckBox234.Checked then DumpMOT[303]:=DumpMOT[303] or 64;
// Brake One Axis_Enable
   if CheckBox235.Checked then DumpMOT[303]:=DumpMOT[303] or 128;

// DSC_Car_Hcg
   DumpMOT[304]:= Round(StrToFloat(Edit330.Text)*100);
// Wheel_FL.CFG.TpumpMin
   DumpMOT[305]:= StrToInt(Form1.Edit332.Text);
// Wheel_ÊL.CFG.TpumpMin
   DumpMOT[306]:= StrToInt(Form1.Edit333.Text);
// Load.CFG.P_Start
//   DumpMOT[307]:= StrToInt(Form1.Edit334.Text);
   DumpMOT[307]:= Round(StrToFloat(Edit334.Text)*20);
// Wheel_ÊL.CFG.Tpump
   DumpMOT[308]:= StrToInt(Form1.Edit335.Text);

//DSC_Config_17
   DumpMOT[309]:= 0;
// ABS_Tpump_Enable
   if CheckBox236.Checked then DumpMOT[309]:=DumpMOT[309] or 1;
// Brake Asist _Enable
   if CheckBox237.Checked then DumpMOT[309]:=DumpMOT[309] or 2;
// EBL_PoCut_Enable
   if CheckBox238.Checked then DumpMOT[309]:=DumpMOT[309] or 4;
// IncValve_Tip2
   if CheckBox239.Checked then DumpMOT[309]:=DumpMOT[309] or 8;
// DBR  Enable
   if CheckBox240.Checked then DumpMOT[309]:=DumpMOT[309] or 16;
// ABS_Sign_KdP
   if CheckBox241.Checked then DumpMOT[309]:=DumpMOT[309] or 32;
// Trailer_Stop_Light
   if CheckBox242.Checked then DumpMOT[309]:=DumpMOT[309] or 64;
// Rele_Stop_Install
   if CheckBox243.Checked then DumpMOT[309]:=DumpMOT[309] or 128;

// Brake Asist_Press
   DumpMOT[310] := Round(StrToFloat(Edit336.Text)*20);
// Koef Short Exh Rear
   DumpMOT[311]:= StrToInt(Form1.Edit337.Text);
// ABS.CFG.T_ShExh Rear
   DumpMOT[312]:= StrToInt(Form1.Edit338.Text);
// DBR.CFG.SlipOn
   DumpMOT[313]:= Round(StrToFloat(Edit339.Text)*10);
// DBR.CFG.SlipOff
   DumpMOT[314]:= Round(StrToFloat(Edit340.Text)*10);
// DBR.Speed ON
   DumpMOT[315]:= StrToInt(Form1.Edit341.Text);
// Brake Asist_Time
   DumpMOT[316] := Round(StrToFloat(Edit342.Text)*100);

//DSC_Config_18
   DumpMOT[317]:= 0;
// Hill Holder_Enable
   if CheckBox244.Checked then DumpMOT[317]:=DumpMOT[317] or 1;
// Hill Holder_Lamp
   if CheckBox245.Checked then DumpMOT[317]:=DumpMOT[317] or 2;
// HHR_DifR_Enable
   if CheckBox246.Checked then DumpMOT[317]:=DumpMOT[317] or 4;
// HHR_Switch  óñòàíîâëåí
   if CheckBox253.Checked then DumpMOT[317]:=DumpMOT[317] or 8;
// HHR_Press_Enable
   if CheckBox254.Checked then DumpMOT[317]:=DumpMOT[317] or 16;
// Emergency Brake àêòèâèðóåòñÿ
   if CheckBox256.Checked then DumpMOT[317]:=DumpMOT[317] or 32;
// SPN5847_Deccel_6
   if CheckBox257.Checked then DumpMOT[317]:=DumpMOT[317] or 64;
// Test_GndWL_Enable
   if CheckBox260.Checked then DumpMOT[317]:=DumpMOT[317] or 128;

// Hill Holder_Time
   DumpMOT[318] := Round(StrToFloat(Edit347.Text)*20);
// SpThr_dPpump_F    km/h
   DumpMOT[319]:= Round(StrToFloat(Edit314.Text)*32);
// SpThr_dPpump_R    km/h
   DumpMOT[320]:= Round(StrToFloat(Edit348.Text)*32);
// SpThr_dPpump_F    km/h
   DumpMOT[321]:= Round(StrToFloat(Edit349.Text)*32);
// SpThr_dPpump_R    km/h
   DumpMOT[322]:= Round(StrToFloat(Edit350.Text)*32);

//DSC_Config_19
   DumpMOT[323]:= 0;
// Brake Tout Enable
   if CheckBox258.Checked then DumpMOT[323]:=DumpMOT[323] or 1;
// Engine Tout Enable
   if CheckBox259.Checked then DumpMOT[323]:=DumpMOT[323] or 2;
// All Off  Tout Enable
   if CheckBox262.Checked then DumpMOT[323]:=DumpMOT[323] or 4;
// ASR_Torq_KoefPress
   if CheckBox263.Checked then DumpMOT[323]:=DumpMOT[323] or 8;
// Brake Tout  Tip2 (Plim)
   if CheckBox264.Checked then DumpMOT[323]:=DumpMOT[323] or 16;
// ON Check TCO
   if CheckBox265.Checked then DumpMOT[323]:=DumpMOT[323] or 32;
// Error  RWS Enable
   if CheckBox266.Checked then DumpMOT[323]:=DumpMOT[323] or 64;
// ASR_Brake_Fz
   if CheckBox269.Checked then DumpMOT[323]:=DumpMOT[323] or 128;


// Brake Tout
   DumpMOT[324] := Round(StrToFloat(Edit352.Text)*8);
// Engine Tout
   DumpMOT[325] := Round(StrToFloat(Edit353.Text)*2);
// ASR Brake Pmax
   DumpMOT[326] := Round(StrToFloat(Edit351.Text)*20);
// SASzero_Wz  max 2dps
   DumpMOT[327] := Round(StrToFloat(Edit354.Text)*128);
// SASzero_SAngle  max 14deg
   DumpMOT[328] := Round(StrToFloat(Edit355.Text)*pi/180*1024);

//DSC_Config_20
   DumpMOT[329]:= 0;
// DIF_PWM_Enable
   if CheckBox267.Checked then DumpMOT[329]:=DumpMOT[329] or 1;
// Ps_Grad  Enable
   if CheckBox268.Checked then DumpMOT[329]:=DumpMOT[329] or 2;
// PsFail_Enable
   if CheckBox261.Checked then DumpMOT[329]:=DumpMOT[329] or 4;
// Load KTS
   if CheckBox270.Checked then DumpMOT[329]:=DumpMOT[329] or 8;
// Extapolation Enable
   if CheckBox271.Checked then DumpMOT[329]:=DumpMOT[329] or 16;
// Extapolation Accel
   if CheckBox272.Checked then DumpMOT[329]:=DumpMOT[329] or 32;
// VDC Fail Stop
   if CheckBox273.Checked then DumpMOT[329]:=DumpMOT[329] or 64;
// TP2  My_Main
   if CheckBox274.Checked then DumpMOT[329]:=DumpMOT[329] or 128;

// ASRE ON Delay
   DumpMOT[330]:= Round(StrToInt(Form1.Edit356.Text)/5);
// ASR PID IntD
   DumpMOT[331]:= StrToInt(Form1.Edit362.Text);
// __ASRB_Thr_Mul
   DumpMOT[332]:= StrToInt(Form1.Edit363.Text);

//DSC_Config_21
   DumpMOT[333]:= 0;
// Ôèëüòð ìåäèàíà
   if CheckBox276.Checked then DumpMOT[333]:=DumpMOT[333] or 1;
// Ôèëüòð Break Demand
   if CheckBox277.Checked then DumpMOT[333]:=DumpMOT[333] or 2;
// Load_DeltaMass_Lim
   if CheckBox278.Checked then DumpMOT[333]:=DumpMOT[333] or 4;
// Stop Switch Test
   if CheckBox279.Checked then DumpMOT[333]:=DumpMOT[333] or 8;
// BPS Off Test
   if CheckBox280.Checked then DumpMOT[333]:=DumpMOT[333] or 16;
// BPS On Test
   if CheckBox281.Checked then DumpMOT[333]:=DumpMOT[333] or 32;
// Trailer_PS_Test
   if CheckBox282.Checked then DumpMOT[333]:=DumpMOT[333] or 64;
// Trailer_NC_Test
   if CheckBox283.Checked then DumpMOT[333]:=DumpMOT[333] or 128;

// Load Engine Vmax
   DumpMOT[334]:= StrToInt(Edit364.Text);

//DSC_Config_22
   DumpMOT[335]:= 0;
// Stop_Light_Test
   if CheckBox284.Checked then DumpMOT[335]:=DumpMOT[335] or 1;
// Trailer_PS_On_Test
   if CheckBox285.Checked then DumpMOT[335]:=DumpMOT[335] or 2;
// ABS_Ph5_PauseSlip
   if CheckBox286.Checked then DumpMOT[335]:=DumpMOT[335] or 4;
// ABS_Search_SlipOpt
   if CheckBox287.Checked then DumpMOT[335]:=DumpMOT[335] or 8;
// IncValve_Always
   if CheckBox288.Checked then DumpMOT[335]:=DumpMOT[335] or 16;
// Filt_AirDrop_Enable
   if CheckBox289.Checked then DumpMOT[335]:=DumpMOT[335] or 32;
// MDT_Left_Enable
   if CheckBox290.Checked then DumpMOT[335]:=DumpMOT[335] or 64;

// Pause Slip Koef
   DumpMOT[336]:= Round(StrToFloat(Form1.Edit365.Text)*16);
// Brake.Front.CFG.K_Pva
   DumpMOT[337]:= StrToInt(Edit366.Text);
// Brake.Rear.CFG.K_Pva
   DumpMOT[338]:= StrToInt(Edit367.Text);

//DSC_Config_23
   DumpMOT[339]:= 0;
// MDT_Front_Enable
   if CheckBox291.Checked then DumpMOT[339]:=DumpMOT[339] or 1;
// MDT_Rear_Enable
   if CheckBox292.Checked then DumpMOT[339]:=DumpMOT[339] or 2;
// GearBox_AutoMatic
   if CheckBox293.Checked then DumpMOT[339]:=DumpMOT[339] or 4;
// DBR_Torque_Set
   if CheckBox294.Checked then DumpMOT[339]:=DumpMOT[339] or 8;
// Sens_Clutch_Instal
   if CheckBox295.Checked then DumpMOT[339]:=DumpMOT[339] or 16;
// ECAS_PS_Calibr
   if CheckBox296.Checked then DumpMOT[339]:=DumpMOT[339] or 32;
// EBC1_SPN521_Enable
   if CheckBox297.Checked then DumpMOT[339]:=DumpMOT[339] or 64;
// ABS_OffRoad_Enable
   if CheckBox298.Checked then DumpMOT[339]:=DumpMOT[339] or 128;

//DSC_Config_24
   DumpMOT[340]:= 0;
// Ïðèáîðíàÿ ïàíåëü
   Case rg5.ItemIndex of
       0: DumpMOT[340]:=DumpMOT[340] or 0; //
       1: DumpMOT[340]:=DumpMOT[340] or 1;//
       2: DumpMOT[340]:=DumpMOT[340] or 2;//
   end;
// K Line Blink Code
   if CheckBox300.Checked then DumpMOT[340]:=DumpMOT[340] or 8;
// BPS_onAccValve
   if CheckBox302.Checked then DumpMOT[340]:=DumpMOT[340] or 16;
// Halt Brake Gaz
   if CheckBox306.Checked then DumpMOT[340]:=DumpMOT[340] or 32;
// Halt Brake Enable
   if CheckBox304.Checked then DumpMOT[340]:=DumpMOT[340] or 64;
// Halt Brake Auto
   if CheckBox305.Checked then DumpMOT[340]:=DumpMOT[340] or 128;

//DSC_Config_25
   DumpMOT[341]:= 0;
// Îðèåíòàöèÿ Áëîêà
   Case RadioGroup11.ItemIndex of
       0: DumpMOT[341]:=DumpMOT[341] or 0; //   Ãîðèçîíòàëüíî
       1: DumpMOT[341]:=DumpMOT[341] or 1;//   Âåðòèêàëüíî Âïåðåä
       2: DumpMOT[341]:=DumpMOT[341] or 2;//   Âåðòèêàëüíî Íàçàä
       3: DumpMOT[341]:=DumpMOT[341] or 3;//   Âåðòèêàëüíî Âïðàâî
       4: DumpMOT[341]:=DumpMOT[341] or 4;//   Âåðòèêàëüíî Âëåâî
   end;
 // Plata_AGS_Enable
   if CheckBox301.Checked then DumpMOT[341]:=DumpMOT[341] or 8;
// XBR
   if CheckBox307.Checked then DumpMOT[341]:=DumpMOT[341] or 16;
// ABS Rear ON RefSpeed
   if CheckBox303.Checked then DumpMOT[341]:=DumpMOT[341] or 32;
// VW 1s Enable
   if CheckBox308.Checked then DumpMOT[341]:=DumpMOT[341] or 64;
// GYRO  Self Set Zero
   if CheckBox309.Checked then DumpMOT[341]:=DumpMOT[341] or 128;

//DSC_Config_26
   DumpMOT[342]:= 0;
// Îøèáêè Not Clear
   if CheckBox310.Checked then DumpMOT[342]:=DumpMOT[342] or 1;
// DBR_Torque_Deccel Enable
   if CheckBox311.Checked then DumpMOT[342]:=DumpMOT[342] or 2;
// Ó÷èòûâàòü Ðåòàðäåð K
   if CheckBox312.Checked then DumpMOT[342]:=DumpMOT[342] or 4;
   if CheckBox330.Checked then DumpMOT[342]:=DumpMOT[342] or 8;
   if CheckBox329.Checked then DumpMOT[342]:=DumpMOT[342] or 16;
   if CheckBox328.Checked then DumpMOT[342]:=DumpMOT[342] or 32;
// Blink_Code_Enable
   if CheckBox333.Checked then DumpMOT[342]:=DumpMOT[342] or 64;
// Axis3Tire_Tandem
   if CheckBox163.Checked then DumpMOT[342]:=DumpMOT[342] or 128;

// DBR_Deccel
   DumpMOT[343]:=Round(StrToFloat(Edit401.Text)*64);  //
// DBR_Torque
   DumpMOT[344]:=Round(125-StrToInt(Edit402.Text));  //
// Íàñòðîéêà EBL Ðåòàðäåð K Load
   DumpMOT[345]:=StrToInt(Edit403.Text);  //
   // LIM.CFG.PWM_PK.Kper èçìåíåíèå ïåðèîäà
   DumpMOT[346]:=StrToInt(Edit450.Text);
   // LIM.CFG.PWM_PK.Period  ïåðèîä mc
   DumpMOT[347]:=StrToInt(Edit451.Text);  //
//   Vehicle_Modification
    for i:=1 to Modif_Size do
    begin
      if Fl_VIN_CFG and Type_VIN_New then
           Vehicle_Modif_Data[i]:=Ord(Vehicle_Modification_F10[i]);
      if Fl_Clr_VIN then
           Vehicle_Modif_Data[i]:=48;
      DumpMOT[348+i-1]:= Vehicle_Modif_Data[i];
    end;
//------(DumpMOT[360]);
    DumpMOT[360]:= 1;
    DumpMOT[361] :=ADRE_Lot_M_V8; //Lot

// HillHold_Pdes atm
   DumpMOT[362]:= Round(StrToFloat(Edit462.Text)*20);

// ABS.CFG.SleepEnd R
   DumpMOT[363]:= Round(StrToFloat(Edit463.Text)*10);
// ABS.CFG.SleepEnd F
   DumpMOT[364]:= Round(StrToFloat(Edit464.Text)*10);

// KSUM
     CheckSUM_DumpMOT;
// êîïèðîâàíèå DumpMOT  DumpMOTcopy
     DumpMOT_to_DumpMOTcopy;
     Fl_Dump_Fail := false;
end;

procedure TForm1.Button1Click(Sender: TObject);
Label Label_End;
begin
   Button1.Enabled:=false;
   if Tip_Block < 8 then
   begin
     Form1.FormDisable; //çàïðåò Form1
// âûêëþ÷åíèå ðåëå ïîñëå Ðåñòàðòà
     ReleOFF_After_Reset;
     Kl15inh_Cnt_Set;
// îñòàíîâêà îáìåíà â Com_Thread
     Fl_ProgROM:=true;   // îñòàíîâêà îáìåíà â Com_Thread
     Fl_ProgS19:=false;
     Form1.calibrSB.SimpleText:='Ñíÿòèå çàùèòû Flash';
//ñíÿòèå çàùèòû Flash
     Flash_UnProtected_All:=false; // Ïðîãðàììà çàùèùåíà
     Flash_UnProtected_CFG:=true;
     FlashUnProtected;
//ñíÿòèå Set_Security
     if not Set_Security  then goto Label_End; //Exit;
     Form1.Dump_SKU_CFG;
     if   Fl_Dump_Fail then goto Label_End; //Exit;

// ÇÀÏÈÑÜ ÊÎÍÔÈÃÓÐÀÖÈÈ
     calibrSB.SimpleText := 'Çàïèñü äàííûõ â Motorola Config; CheckSUM  '+
                            IntToStr(DumpMOT[126])+'  '+
                            IntToStr(DumpMOT[127]) ;
     fl_change_comp:=false;
     FormISO.WriteMotEPROM_con;
     repeat Application.ProcessMessages until fl_change_comp;
     if not fl_change_Err then //íåò îøèáêè çàïèñè
     begin
       sleep(500); // çàäåðæêà íà çàïèñü â STM
        //óñòàíîâêà çàùèòû Flash
        FlashProtected;
        if Fl_FlashProtect_Compleet then
        begin
          Form1.View_SKU_CFG;
          if Fl_VIN_CFG then
          Form1.stat1.SimpleText:='Âûïîëíåíà Çàïèñü VIN è Êîíôèãóðàöèè';
          Fl_VIN_CFG:=False; // ïîñëå View_SKU_CFG
          Fl_Clr_VIN:=False;
          MsgBox( 'Êîíôèãóðàöèÿ íàñòðîéêè ñîõðàíåíà',
            'Ïðåäóïðåæäåíèå', MB_OK+MB_ICONASTERISK+MB_APPLMODAL);
        end;
     end;
     goto Label_End; //Exit;
   end
   else
   begin  // 8
     Form1.Dump_SKU_CFG;
     if   Fl_Dump_Fail then goto Label_End; //Exit;
     Form1.FormDisable; //çàïðåò Form1
     Fl_ProgROM:=true;   // îñòàíîâêà îáìåíà â Com_Thread
     Fl_ProgS19:=false;
// ÇÀÏÈÑÜ ÊÎÍÔÈÃÓÐÀÖÈÈ
     calibrSB.SimpleText := 'Çàïèñü äàííûõ â Motorola Config; CheckSUM  '+
                            IntToStr(DumpMOT[126])+'  '+
                            IntToStr(DumpMOT[127]) ;
     fl_change_comp:=false;
     FormISO.WriteMotEPROM_con;
     repeat Application.ProcessMessages until fl_change_comp;
     if not fl_change_Err then //íåò îøèáêè çàïèñè
     begin

          Form1.View_SKU_CFG;
          if Fl_VIN_CFG then
          Form1.stat1.SimpleText:='Âûïîëíåíà Çàïèñü VIN è Êîíôèãóðàöèè';
          Fl_VIN_CFG:=False; // ïîñëå View_SKU_CFG
          Fl_Clr_VIN:=False;
          Sleep(100);
          MsgBox( 'Êîíôèãóðàöèÿ íàñòðîéêè ñîõðàíåíà',
            'Ïðåäóïðåæäåíèå', MB_OK+MB_ICONASTERISK+MB_APPLMODAL);
     end
     else
     begin
      // îøèáêa çàïèñè
        calibrSB.SimpleText := 'îøèáêa çàïèñè  ';
        Form1.FormEnable; //ðàçðåøåíèå Form1
        Button1.Enabled:=true;
      // êîïèðîâàíèå DumpMOTcopy  DumpMOT
        DumpMOTcopy_to_DumpMOT;
        goto Label_End; //exit;
     end;

Label_End:
     Button1.Enabled:=true;
     Form1.FormEnable; //ðàçðåøåíèå Form1
     Fl_ProgROM:=false; // ðàçðåøàåì ïîòîê Com
     Fl_ProgS19:=false;
     calibrSB.SimpleText:='';
// ñòèðàíèå îøèáîê
     FormISO.EraseError_EPROM;
// âêëþ÷åíèå ðåëå ïîñëå Ðåñòàðòà
     if Tip_Block < 8 then
     begin
     ReleON_After_Reset;
     Kl15inh_Cnt_Clr;
     end;
   end;
end;

procedure TForm1.ParamChange(Sender: TObject);
var
     TempStr:string;
begin
if not Com_Connected_F then  exit;
   Button1.Enabled:=true;
//   if CheckBox25.Checked then   RadioGroup4.Enabled:=true
//                         else   RadioGroup4.Enabled:=false;

    case RadioGroup1.ItemIndex of
    0: begin
        Label135.Enabled:=true;
    //    ComboBox4.Visible:=true;
     //   cLIM.Enabled:=true;
        CheckBox38.Enabled:=true;
        SpinEdit1.Enabled:=true;
        SpinEdit2.Enabled:=true;
        Label136.Enabled:=true;
        Label137.Enabled:=true;
        Label199.Enabled:=true;
        Label192.Enabled:=true;
        Edit31.Enabled:=true;
        CheckBox32.Enabled:=true;
        ComboBox5.Visible:=true;
        CheckBox35.Enabled:=true;
        CheckBox33.Enabled:=true;
        CheckBox26.Enabled:=true;
        ComboBox5.Visible:=false;
        Label159.Enabled:=false;
        Label187.Enabled:=false;
        Edit20.Visible:=false;
        Label188.Enabled:=false;
        Edit29.Visible:=false;
        Edit30.Visible:=false;
        Label189.Enabled:=false;
        CheckBox42.Enabled:=false;
        CheckBox43.Enabled:=true;
   //     GroupBox32.Enabled:=true;
        Edit33.Visible:=true;
        Edit34.Visible:=true;
        Edit36.Visible:=true;
        Edit37.Visible:=true;
        Edit39.Visible:=true;
        Label196.Visible:=true;
        Label197.Visible:=true;
        Label265.Visible:=true;
        Label194.Visible:=true;
        Label195.Visible:=true;
        end;
      1: begin
   {     Label137.Enabled:=false;
        Label199.Enabled:=false;
        Label192.Enabled:=false;
        CheckBox43.Enabled:=false;
        CheckBox42.Enabled:=false;
        CheckBox33.Checked:=false;
        CheckBox33.Enabled:=false;
        CheckBox26.Checked:=false;
        CheckBox26.Enabled:=false;
        ComboBox5.Visible:=false;
        Label159.Enabled:=false;
        Label187.Enabled:=false;
        Edit20.Visible:=false;
        Label188.Enabled:=false;
        Edit29.Visible:=false;
        Edit30.Visible:=false;
        Label189.Enabled:=false;
        Label135.Enabled:=false;
        ComboBox4.Visible:=false;
        cLIM.Checked:=false;
        cLIM.Enabled:=false;
        CheckBox38.Checked:=false;
        CheckBox38.Enabled:=false;
        SpinEdit1.Enabled:=false;
        SpinEdit2.Enabled:=false;
        Label136.Enabled:=false;
        Edit31.Enabled:=false;
        CheckBox32.Checked:=false;
        CheckBox32.Enabled:=false;
        CheckBox35.Checked:=false;
        CheckBox35.Enabled:=false;
        GroupBox32.Enabled:=false;
        Edit33.Visible:=false;
        Edit34.Visible:=false;
        Edit36.Visible:=false;
        Edit37.Visible:=false;
        Edit39.Visible:=false;
        Label196.Visible:=false;
        Label197.Visible:=false;
        Label265.Visible:=false;
        Label194.Visible:=false;
        Label195.Visible:=false;  }
        end;
     2: begin
        Label137.Enabled:=false;
        Label199.Enabled:=false;
        Label192.Enabled:=false;
   //     CheckBox43.Enabled:=false;
        ComboBox5.Visible:=true;
        Label159.Enabled:=true;
        Label187.Enabled:=true;
        Edit20.Visible:=true;
        Label188.Enabled:=true;
        Edit29.Visible:=true;
        Edit30.Visible:=true;
        CheckBox33.Enabled:=true;
        CheckBox26.Enabled:=true;
        Label189.Enabled:=true;
        CheckBox42.Enabled:=true;
        CheckBox35.Enabled:=true;
        end;
    end;
{   case  ComboBox4.ItemIndex of
    0: TempStr:='Òèï íåîïðåäåëåí';
    1: TempStr:='TipPnevmo1';
    2: TempStr:='TipPnevmo2';
   end;
    if ComboBox4.ItemIndex>0 then
    begin
    Edit33.Text:=IntToStr(DiagIni.ReadInteger(TempStr,'KUI',38));
    Edit34.Text:=IntToStr(DiagIni.ReadInteger(TempStr,'U0HI',31) *256 +
                          DiagIni.ReadInteger(TempStr,'U0LI',5));
    Edit36.Text:=IntToStr(DiagIni.ReadInteger(TempStr,'KUD',1));
    Edit37.Text:=IntToStr(DiagIni.ReadInteger(TempStr,'U0HD',13));
    Edit39.Text:=IntToStr(DiagIni.ReadInteger(TempStr,'U0LD',211));

    PK_Ku:=StrToInt(Form1.Edit33.Text);
    PK_Ko:=StrToInt(Form1.Edit34.Text);
    PK_dKu:=StrToInt(Form1.Edit36.Text);
    PK_dKoD:=StrToInt(Form1.Edit37.Text);
    PK_Kv:=StrToInt(Form1.Edit39.Text);
    end;  }

    FrontAxis_EmptyLoad:= Round(StrToInt(Form1.Edit169.Text));
    RearAxis_EmptyLoad:= Round(StrToInt(Form1.Edit170.Text));
    Form1.Edit154.Text:=IntToStr(FrontAxis_EmptyLoad+RearAxis_EmptyLoad);

end;

procedure TForm1.btnDelAllClick(Sender: TObject);
var
   str:string;
   i: integer;
begin
   if not Set_Security then  exit;

   str:='';
   for i:=0 to Image_Err_Num do
       if ((Active_Errors_Array[i]<> 0) and (not Fl_ClrErr_Message)) then
         str:='Ïðèñóòñòâóþò àêòèâíûå íåèñïðàâíîñòè óäàëÿòñÿ òîëüêî ïàññèâíûå';
   if str<>'' then ShowMessage(str);
 //  FormISO.EraseError_EPROM;
   //FormISO.WriteATEPROM_clr;
    if (Tip_Block = 3) then  FormISO.WriteATEPROM_clr  //$6C;
                       else  FormISO.EraseError_EPROM; //$74;
end;

procedure TForm1.View_SKU_CFG;
Var TempInt:integer;
    TempStr:String ;
    DumpMOT32:byte;
begin

   case (DumpMOT[0] and 192)  of
   0:    RadioGroup1.ItemIndex:=1;
   128:  RadioGroup1.ItemIndex:=0;
   64:   RadioGroup1.ItemIndex:=2;
   end;
   if (DumpMOT[0] and 16)=16 then CheckBox49.Checked:=false
                             else CheckBox49.Checked:=true;


//÷èñëî çóáîâ
// Ïåðåäíÿÿ îñü
   Edit26.Text:=IntToStr(DumpMOT[1]);
// Çàäíÿÿ îñü
   Edit21.Text:=IntToStr(DumpMOT[113]);
// Òðåòüÿ îñü
   Edit174.Text:=IntToStr(DumpMOT[119]);

//äèàìåòð êîëåñà
   if SpeedConst = 0 then SpeedConst:=1000000;
// Ïåðåäíÿÿ îñü
   Edit27.Text:=FloatToStrF((DumpMOT[2]*16777216+
                DumpMOT[3]*65536+DumpMOT[4]*256+DumpMOT[5])/
                (2*SpeedConst/1000*256*3600*Pi)*DumpMOT[1],ffFixed,5,2);
// Çàäíÿÿ îñü
   Edit22.Text:=FloatToStrF((DumpMOT[114]*16777216+
                DumpMOT[115]*65536+DumpMOT[116]*256+DumpMOT[117])/
                (2*SpeedConst/1000*256*3600*Pi)*DumpMOT[113],ffFixed,5,2);
// Òðåòüÿ îñü
   Edit175.Text:=FloatToStrF((DumpMOT[120]*16777216+
                DumpMOT[121]*65536+DumpMOT[122]*256+DumpMOT[123])/
                (2*SpeedConst/1000*256*3600*Pi)*DumpMOT[119],ffFixed,5,2);
//   if NumCh_Block = 6 then GroupBox123.Visible:=true
//                      else GroupBox123.Visible:=false;


   DiamKol:=Edit27.Text;
   ConfIndex:=RadioGroup1.ItemIndex;
   SwABSIndex:=RadioGroup2.ItemIndex;
   SwASRIndex:=RadioGroup3.ItemIndex;

// Stop
   if (DumpMOT[7] and 4)=0      then RadioGroup4.ItemIndex:=2
   else if (DumpMOT[7] and 8)=8 then RadioGroup4.ItemIndex:=1
                                else RadioGroup4.ItemIndex:=0;
//ASR_Two_Engine
   if (DumpMOT[7] and 16)=16 then CheckBox26.Checked:=true
                             else CheckBox26.Checked:=false;
   PressEnable:=CheckBox26.Checked;
// èçìåðèòåëüíûå äàò÷êè äàâëåíèÿ
   if (DumpMOT[7] and 32)=32 then CheckBox35.Checked:=true
                             else CheckBox35.Checked:=false;
   MotorEnable:=CheckBox35.Checked;
   if (DumpMOT[7] and 64)=64 then CheckBox36.Checked:=true
                             else CheckBox36.Checked:=false;
   DBREnable:=CheckBox36.Checked;
   if (DumpMOT[11] and 1)=1  then CheckBox39.Checked:=true
                             else CheckBox39.Checked:=false;
   R_DBREnable:=CheckBox39.Checked;
   if (DumpMOT[11] and 2)=2  then CheckBox31.Checked:=true
                             else CheckBox31.Checked:=false;

   if (DumpMOT[11] and 4)=4  then CheckBox32.Checked:=true
                             else CheckBox32.Checked:=false;

   if (DumpMOT[11] and 8)=8  then CheckBox33.Checked:=true
                             else CheckBox33.Checked:=false;

   if (DumpMOT[11] and 16)=16  then CheckBox38.Checked:=true
                               else CheckBox38.Checked:=false;
   TaxoEnable:=CheckBox38.Checked;
   if (DumpMOT[11] and 32)=32  then CheckBoxLIM.Checked:=true
                               else CheckBoxLIM.Checked:=false;
   LIMenable:=CheckBoxLIM.Checked;

// ABS_SW
   if (DumpMOT[11] and 64)=0    then RadioGroup2.ItemIndex:=2
   else if (DumpMOT[7] and 1)=1 then RadioGroup2.ItemIndex:=1
                                else RadioGroup2.ItemIndex:=0;
// ASR_SW
   if (DumpMOT[11] and 128)=0   then RadioGroup3.ItemIndex:=2
   else if (DumpMOT[7] and 2)=2 then RadioGroup3.ItemIndex:=1
                                else RadioGroup3.ItemIndex:=0;

    if (DumpMOT[28] and 1)=1  then CheckBox41.Checked:=true
                              else CheckBox41.Checked:=false;
    if (DumpMOT[28] and 2)=2  then CheckBox40.Checked:=true
                              else CheckBox40.Checked:=false;
    if (DumpMOT[28] and 4)=4  then CheckBox34.Checked:=true
                              else CheckBox34.Checked:=false;
// TSET_SW
     if (DumpMOT[28] and 16)=0     then RadioGroup6.ItemIndex:=2
     else if (DumpMOT[28] and 8)=8 then RadioGroup6.ItemIndex:=1
                                   else RadioGroup6.ItemIndex:=0;

     if (DumpMOT[28] and 32)=32  then CheckBox43.Checked:=true
                                 else CheckBox43.Checked:=false;
     if (DumpMOT[28] and 64)=64  then CheckBox42.Checked:=true
                                 else CheckBox42.Checked:=false;
     if (DumpMOT[28] and 128)=128  then RadioGroup8.ItemIndex:=0
                                   else RadioGroup8.ItemIndex:=1;

   SpinEdit1.Value:=DumpMOT[19];       // Âåëè÷èíà ìàêñèìàëüíîé ñêîðîñòè
   Edit31.Text:=IntToStr(DumpMOT[21]); // Òàõîãðàô Koef B7
   SpinEdit2.Value:=DumpMOT[29];       // TSET Vmin
   // Àâòîìàòè÷åñêàÿ êîìïåíñàöèÿ
   if (DumpMOT[7] and 128)=128 then CheckBox37.Checked:=true
                               else CheckBox37.Checked:=false;

   Edit33.Text:=IntToStr(DumpMOT[22]);
   Edit34.Text:=IntToStr(DumpMOT[23]*256 + DumpMOT[24]);
   Edit36.Text:=IntToStr(DumpMOT[25]);
   Edit37.Text:=IntToStr(DumpMOT[26]);
   Edit39.Text:=IntToStr(DumpMOT[27]);

   ComboBox4.ItemIndex:=0;
   if ((DumpMOT[22]=DiagIni.ReadInteger('TipPnevmo1','KUI',0)) and
       (DumpMOT[23]=DiagIni.ReadInteger('TipPnevmo1','U0HI',0))) then
                                     ComboBox4.ItemIndex:=1;
   if ((DumpMOT[22]=DiagIni.ReadInteger('TipPnevmo2','KUI',0)) and
       (DumpMOT[23]=DiagIni.ReadInteger('TipPnevmo2','U0HI',0))) then
                                     ComboBox4.ItemIndex:=2;
   PnevmoIndex:=ComboBox4.ItemIndex;

   case  ComboBox4.ItemIndex of
   0: TempStr:='Òèï íåîïðåäåëåí';
   1: TempStr:='TipPnevmo1';
   2:   TempStr:='TipPnevmo2';
   end;

   case (DumpMOT[8] and 48)  of
   0:    ComboBox5.ItemIndex:=0;
   16:   ComboBox5.ItemIndex:=1;
   32:   ComboBox5.ItemIndex:=2;
   48:   ComboBox5.ItemIndex:=3;
   end;
   PriorIndex:=ComboBox5.ItemIndex;
   Edit23.Text:=IntToStr(DumpMOT[12]);
   Edit24.Text:=IntToStr(DumpMOT[13]);
   Edit25.Text:=IntToStr(DumpMOT[14]);
   Edit28.Text:=IntToStr(DumpMOT[15]);
   if  DumpMOT[12]=DiagIni.ReadInteger('Kpress1','K_Exhaust_Front',12)
    then  ComboBox6.ItemIndex:=1
     else  if  DumpMOT[12]=DiagIni.ReadInteger('Kpress2','K_Exhaust_Front',16)
      then  ComboBox6.ItemIndex:=2
       else    ComboBox6.ItemIndex:=0;
   if  DumpMOT[14]=DiagIni.ReadInteger('Kpress1','K_Exhaust_Rear',10)
    then  ComboBox7.ItemIndex:=1
    else  if  DumpMOT[14]=DiagIni.ReadInteger('Kpress2','K_Exhaust_Rear',13)
     then  ComboBox7.ItemIndex:=2
      else    ComboBox7.ItemIndex:=0;
   Edit20.Text:=IntToStr(Round((DumpMOT[16])/255*100));
   CAN_KuASR:=Edit20.Text;
   Edit29.Text:=IntToStr(125-DumpMOT[17]);
   CAN_KuDB:=Edit29.Text;
   Edit30.Text:=IntToStr(DumpMOT[18]);

 //Def_Config_3
    Def_Config_3:=DumpMOT[30];
    if DumpMOT[30] =255 then begin RadioGroup5.ItemIndex:=0;
                                   CheckBox95.Checked:=false;
    end
    else begin
    if (DumpMOT[30] and 1)=1  then RadioGroup5.ItemIndex:=1
                              else RadioGroup5.ItemIndex:=0;
    // Íîâûå êëþ÷è â ñòàðûõ áëîêàõ
    if (DumpMOT[30] and 2)=2  then CheckBox95.Checked:=true
                              else CheckBox95.Checked:=false;
    // CAN DM1 ïîñòîÿííî
    if (DumpMOT[30] and 4)=4  then CheckBox126.Checked:=true
                              else CheckBox126.Checked:=false;
    // Ëàìïà ïðèöåïà óñòàíîâëåíà
    if (DumpMOT[30] and 8)=8  then CheckBox127.Checked:=true
                              else CheckBox127.Checked:=false;
   //Ðåæèì Ïîëèãîí èñïîëüçóåñÿ
    if (DumpMOT[30] and 16)=16  then CheckBox79.Checked:=true
                                else CheckBox79.Checked:=false;
   // Àäðåñ CAN VDC Wabco
    if (DumpMOT[30] and 32)=32  then CheckBox94.Checked:=true
                                else CheckBox94.Checked:=false;
    // TimeOut âêëþ÷åí
    if (DumpMOT[30] and 64)=64  then CheckBox133.Checked:=true
                                else CheckBox133.Checked:=false;
    end;

   //ABS_Config
    Case DumpMOT[33] of
    1: RadioGroup7.ItemIndex:=0; //   2S/1M
    2: RadioGroup7.ItemIndex:=1;//   2S/2M
    3: RadioGroup7.ItemIndex:=2;//   4S/2M
    4: RadioGroup7.ItemIndex:=3;//   4S/3M
    5: RadioGroup7.ItemIndex:=4;//   4S/3M
    6,255: RadioGroup7.ItemIndex:=5;//   4S/4M
    7: RadioGroup7.ItemIndex:=6;//   6S/3M
    8: RadioGroup7.ItemIndex:=7;//   6S/4M
    9: RadioGroup7.ItemIndex:=8;//   6S/4M
    10: RadioGroup7.ItemIndex:=9;//  6S/5M
    11: RadioGroup7.ItemIndex:=10;//  6S/5M
    12: RadioGroup7.ItemIndex:=11;//  6S/6M
    end;
//ïðîâåðêà Config
    Case DumpMOT[33] of
    1: if DumpMOT[31]<>3 then Config_Fail:=true; //   2S/1M
    2: if DumpMOT[31]<>12 then Config_Fail:=true;//   2S/2M
    3: if DumpMOT[31]<>15 then Config_Fail:=true;//   4S/2M
    4: if DumpMOT[31]<>15 then Config_Fail:=true;//   4S/3M
    5: if DumpMOT[31]<>15 then Config_Fail:=true;//   4S/3M
    6: if DumpMOT[31]<>15 then Config_Fail:=true;//   4S/4M
    255: if DumpMOT[31]<>255 then Config_Fail:=true;//   4S/4M
    7: if DumpMOT[31]<>63 then Config_Fail:=true;//   6S/3M
    8: if DumpMOT[31]<>63 then Config_Fail:=true;//   6S/4M
    9: if DumpMOT[31]<>63 then Config_Fail:=true;//   6S/4M
    10: if DumpMOT[31]<>63 then Config_Fail:=true;//  6S/5M
    11: if DumpMOT[31]<>63 then Config_Fail:=true;//  6S/5M
    12: if DumpMOT[31]<>63 then Config_Fail:=true;//  6S/6M
    end;
//Mod_Config
    DumpMOT32:=DumpMOT[32] and 63;
    Case DumpMOT[33] of
    1: if DumpMOT32<>1 then Config_Fail:=true; //   2S/1M
    2: if DumpMOT32<>12 then Config_Fail:=true;//   2S/2M
    3: if DumpMOT32<>12 then Config_Fail:=true;//   4S/2M
    4: if DumpMOT32<>13 then Config_Fail:=true;//   4S/3M
    5: if DumpMOT32<>7 then Config_Fail:=true;//    4S/3M
    6: if DumpMOT32<>15 then Config_Fail:=true;//   4S/4M
    255: if DumpMOT32<>255 then Config_Fail:=true;//   4S/4M
    7: if DumpMOT32<>13 then Config_Fail:=true;//   6S/3M
    8: if DumpMOT32<>15 then Config_Fail:=true;//   6S/4M
    9: if DumpMOT32<>29 then Config_Fail:=true;//   6S/4M
    10: if DumpMOT32<>61 then Config_Fail:=true;//  6S/5M
    11: if DumpMOT32<>31 then Config_Fail:=true;//  6S/5M
    12: if DumpMOT32<>63 then Config_Fail:=true;//  6S/6M
    end;

//  DiffLock_Config
    if (DumpMOT[34] and 2)=2  then CheckBox53.Checked:=true
                              else CheckBox53.Checked:=false;
    if (Tip_Block <> 3) then //or CheckBox318.Checked then
    begin
// DSC íàñòðîéêè
 // DSC_Config_1
     if (DumpMOT[35] and 1)=1  then CheckBox55.Checked:=true
                               else CheckBox55.Checked:=false;
     if (DumpMOT[35] and 2)=2  then CheckBox56.Checked:=true
                               else CheckBox56.Checked:=false;
     if (DumpMOT[35] and 4)=4  then CheckBox57.Checked:=true   //HillHolder TSET
                               else CheckBox57.Checked:=false;
     if (DumpMOT[35] and 8)=8  then CheckBox66.Checked:=true
                               else CheckBox66.Checked:=false;  //dif
     if (DumpMOT[35] and 16)=16  then CheckBox59.Checked:=true
                                 else CheckBox59.Checked:=false;
     if (DumpMOT[35] and 32)=32  then CheckBox60.Checked:=true
                                 else CheckBox60.Checked:=false;
     if (DumpMOT[35] and 64)=64  then CheckBox61.Checked:=true
                                 else CheckBox61.Checked:=false;
     if (DumpMOT[35] and 128)=128  then CheckBox62.Checked:=true
                                   else CheckBox62.Checked:=false;
 // DSC_Config_2
     // VDC brake light  àêòèâèðóåòñÿ
     if (DumpMOT[36] and 1)=1  then CheckBox63.Checked:=true
                               else CheckBox63.Checked:=false;
   // Ýìóëÿöèÿ TruckSim
     if (DumpMOT[36] and 2)=2  then CheckBox58.Checked:=true
                               else CheckBox58.Checked:=false;
   //  Êîíôèãóðàöèÿ Ìîäóëÿòîða ïðèöåïà
     RadioGroup9.ItemIndex :=-1;
     if (DumpMOT[36] and 12)=4  then RadioGroup9.ItemIndex :=0;// Ìîäóëÿòîð
     if (DumpMOT[36] and 12)=8  then RadioGroup9.ItemIndex :=1;// Äèô. êëàïàí
     if (DumpMOT[36] and 12)=0  then RadioGroup9.ItemIndex :=2;// Íåò

  // Ñåíñîð AGS óñòàíîâëåí
     if (DumpMOT[36] and 16)=16  then CheckBox54.Checked:=true
                                 else CheckBox54.Checked:=false;
  // Ñåíñîð SAS óñòàíîâëåí
     if (DumpMOT[36] and 32)=32  then CheckBox82.Checked:=true
                                 else CheckBox82.Checked:=false;
  // ÑAN ïðèöåïà óñòàíîâëåí
     if (DumpMOT[36] and 64)=64  then CheckBox84.Checked:=true
                                 else CheckBox84.Checked:=false;
  // Ñåíñîð äàâëåíèÿ ïðèöåïà óñòàíîâëåí
     if (DumpMOT[36] and 128)=128  then CheckBox83.Checked:=true
                                   else CheckBox83.Checked:=false;
 // end DSC_Config_2

 // DSC_Ratio_Steer
     Ratio_Steer:=DumpMOT[37]*256 + DumpMOT[38];
//ðàçìåðíîñòü óãëà ðàä -8192
     Form1.Edit48.Text:=FloatToStrF((8*65536/Ratio_Steer),ffFixed,5,2); //ðàçìåðíîñòü óãëà ðàä -8192
 //  Car_Base    //áàçà â ìåòðàõ * 1024
     Car_Base:=DumpMOT[43]*256 + DumpMOT[44];
     L_base:= Car_Base/1024;
     Form1.Edit49.Text:=FloatToStrF(L_base,ffFixed,5,2);
 // DSC_K_l_Acker
     K_L_Acker:= DumpMOT[39]*256 + DumpMOT[40];
     //Kus:= K_L_Acker/L_base/3.6/3.6/65536;
     K_Q_Acker:= DumpMOT[41]*256 + DumpMOT[42];
 //    Kus:= 3.6*8/K_Q_Acker;   //ðàçìåðíîñòü óãëà ðàä -1024
     Kus:= 3.6/K_Q_Acker;   //ðàçìåðíîñòü óãëà ðàä -8192
     Form1.Edit50.Text:=FloatToStrF(Kus/pi*180,ffFixed,5,2);

// Delay_Inj
   Form1.Edit228.Text:=IntToStr(DumpMOT[49]);
// Delay_Exh
   Form1.Edit227.Text:=IntToStr(DumpMOT[50]);
// ASR.Engine.CFG.Kpro
   Form1.Edit357.Text:=IntToStr(DumpMOT[51]);
// ASR.Engine.CFG.Kdif
   Form1.Edit358.Text:=IntToStr(DumpMOT[52]);

//DSC_Config_4
     if (DumpMOT[53] and 1)=1  then CheckBox106.Checked:=true
                               else CheckBox106.Checked:=false;
     if (DumpMOT[53] and 2)=2  then CheckBox107.Checked:=true
                               else CheckBox107.Checked:=false;
     if (DumpMOT[53] and 4)=4  then CheckBox108.Checked:=true
                               else CheckBox108.Checked:=false;
     if (DumpMOT[53] and 8)=8  then CheckBox109.Checked:=true
                               else CheckBox109.Checked:=false;
     if (DumpMOT[53] and 16)=16  then CheckBox110.Checked:=true
                                 else CheckBox110.Checked:=false;
     if (DumpMOT[53] and 32)=32  then CheckBox111.Checked:=true
                                 else CheckBox111.Checked:=false;
     if (DumpMOT[53] and 64)=64  then CheckBox112.Checked:=true
                                 else CheckBox112.Checked:=false;
     if (DumpMOT[53] and 128)=128  then CheckBox122.Checked:=true
                                   else CheckBox122.Checked:=false;

     Form1.Edit51.Text:= IntToStr(DumpMOT[45]); //ThrON_dAyK
     Form1.Edit52.Text:= FloatToStrF(DumpMOT[46]/20,ffFixed,5,1); //ROP.CFG.PoF
     Form1.Edit55.Text:= FloatToStrF(DumpMOT[47]/20,ffFixed,5,1); //ROP.CFG.PoF
 // ROP_SleepF
     K_Scale:= DumpMOT[54]/256*100/4;
     Form1.Edit56.Text:=FloatToStrF(K_Scale,ffFixed,5,1);
// ROP_SleepR
     K_Scale:= DumpMOT[56]/256*100/4;
     Form1.Edit58.Text:=FloatToStrF(K_Scale,ffFixed,5,1);
// ROP_SleepNF
     K_Scale:= DumpMOT[164]/256*100/4;
     Form1.Edit143.Text:=FloatToStrF(K_Scale,ffFixed,5,1);

// Offset Enable
     // PressSen_demand
     if (DumpMOT[57] and 1)=1  then CheckBox68.Checked:=true
                               else CheckBox68.Checked:=false;
     // ROP_Trailer_Break_Enable
     if (DumpMOT[57] and 2)=2  then CheckBox70.Checked:=true
                               else CheckBox70.Checked:=false;
     //  StatusTrailer_Enable
     if (DumpMOT[57] and 4)=4  then CheckBox71.Checked:=true
                               else CheckBox71.Checked:=false;
     // Ackerman
     if (DumpMOT[57] and 8)=8  then CheckBox105.Checked:=true
                               else CheckBox105.Checked:=false;
     // Steer Angle
     if (DumpMOT[57] and 16)=16  then CheckBox75.Checked:=true
                                 else CheckBox75.Checked:=false;
     // Yaw Rate
     if (DumpMOT[57] and 32)=32  then CheckBox76.Checked:=true
                                 else CheckBox76.Checked:=false;
     // Accel Y
     if (DumpMOT[57] and 64)=64  then CheckBox77.Checked:=true
                                 else CheckBox77.Checked:=false;
     // Accel X
     if (DumpMOT[57] and 128)=128 then CheckBox78.Checked:=true
                                  else CheckBox78.Checked:=false;
//DSC_Config_3
// Route_CANT
     if (DumpMOT[58] and 1)=1  then CheckBox74.Checked:=true
                               else CheckBox74.Checked:=false;
// Êîíòðîëåð DSC óñòàíîâëåí
     if (DumpMOT[58] and 2)=2  then CheckBox85.Checked:=true
                               else CheckBox85.Checked:=false;
//ROP_FrontPress_Lim
     if (DumpMOT[58] and 4)=4  then CheckBox67.Checked:=true
                               else CheckBox67.Checked:=false;
//DYC_TrailerPress
     if (DumpMOT[58] and 8)=8  then CheckBox69.Checked:=true
                               else CheckBox69.Checked:=false;
//Orientation sensor
//Steer
     if (DumpMOT[58] and 16)=16  then CheckBox80.Checked:=true
                                 else CheckBox80.Checked:=false;
// Omega_Z
     if (DumpMOT[58] and 32)=32  then CheckBox72.Checked:=true
                                 else CheckBox72.Checked:=false;
// Acc_Y
     if (DumpMOT[58] and 64)=64  then CheckBox73.Checked:=true
                                 else CheckBox73.Checked:=false;
// Acc_X
    if (DumpMOT[58] and 128)=128 then CheckBox81.Checked:=true
                                 else CheckBox81.Checked:=false;
     if CheckBox73.Checked and
        CheckBox81.Checked then
        CheckBox299.Checked := true
    else CheckBox299.Checked := false;

    if CheckBox80.Checked then
         CheckBox357.Checked := true
    else CheckBox357.Checked := false;

// Car_CG_A
//CG A â ìåòðàõ
     Car_CG_A:=DumpMOT[59]*256 + DumpMOT[60];
     A_base:= Car_CG_A/1024;
     Form1.Edit53.Text:=FloatToStrF(A_base,ffFixed,5,2);

// ASR.Engine.CFG.Kpro
     Form1.Edit359.Text:=IntToStr(DumpMOT[61]);
// ASR.Engine.CFG.Kdif
     Form1.Edit360.Text:=IntToStr(DumpMOT[62]);

// Koef_FySa
     Koef_FySa:= 2511;//DumpMOT[63]*256 + DumpMOT[64];
     Form1.Edit60.Text:=FloatToStrF(Koef_FySa,ffFixed,5,1);
// EmptyMass Truck
//     EmptyMass:= DumpMOT[63]*256 + DumpMOT[64];
//     Form1.Edit154.Text:= IntToStr(EmptyMass);

//DYC_Pump_Set_L
       Edit61.Text:=FloatToStrF(DumpMOT[65]/20,ffFixed,4,1);
//DYC_Pump_Set_R
       Edit62.Text:=FloatToStrF(DumpMOT[66]/20,ffFixed,4,1);
// DYC_Tcut_Set_R
       Edit66.Text:=IntToStr(DumpMOT[68]);
 
//Dif  Phigh
       Edit69.Text:=IntToStr(DumpMOT[69]);
//Dif  PPlow
       Edit63.Text:=IntToStr(DumpMOT[71]);

//dP_pump_F
       Edit70.Text:=FloatToStrF(DumpMOT[70]/100,ffFixed,4,2);
//dP_pump_R
       Edit64.Text:=FloatToStrF(DumpMOT[72]/100,ffFixed,4,2);
//dP_exh_F
       Edit101.Text:=FloatToStrF(DumpMOT[48]/100,ffFixed,4,2);
//dP_exh_R
       Edit57.Text:=FloatToStrF(DumpMOT[55]/100,ffFixed,4,2);

//  Ïàðàìåòðû  äèô. êëàïàíîâ
//Dif DelayOn  Front
       Edit67.Text:=IntToStr(DumpMOT[73]);
//Dif DelayOn  Rear
       Edit68.Text:=IntToStr(DumpMOT[74]);
//Dif DelayOff  Front
       Edit71.Text:=IntToStr(DumpMOT[75]);
//Dif DelayOff  Rear
       Edit72.Text:=IntToStr(DumpMOT[76]);
 // Koef_Acc_Y_dVf
      Koef_AydVf:=DumpMOT[77]*256 + DumpMOT[78];
//ïåðåäíåé êîëåè
      Tfront:= 2048*256/3.6/3.6/Koef_AydVf;
      Form1.Edit73.Text:=FloatToStrF(Tfront,ffFixed,5,2);
// Sen_Steer_DigMax
      Form1.Edit74.Text:=IntToStr(DumpMOT[79]*256 + DumpMOT[80]);

//   Ïàðàìåòðû  ïíåâìàòèêè
      Form1.Edit79.Text:=IntToStr(DumpMOT[81]); // Pmax
      Form1.Edit75.Text:=IntToStr(DumpMOT[83]); // K Exhaust Front
      Form1.Edit76.Text:=IntToStr(DumpMOT[84]); // K Inject  Front
      Form1.Edit78.Text:=IntToStr(DumpMOT[85]); // K Exhaust Rear
      Form1.Edit77.Text:=IntToStr(DumpMOT[86]); // K Inject  Rear

//   Ïàðàìåòðû  DYC
      Form1.Edit92.Text:=IntToStr(DumpMOT[87]); // DYC_K_PD_Prop
      Form1.Edit93.Text:=IntToStr(DumpMOT[88]); // DYC_K_PD_Diff
      Form1.Edit94.Text:=IntToStr(DumpMOT[89]); // OvSt_PDThresh
      Form1.Edit95.Text:=IntToStr(DumpMOT[90]); // TorqueValue.Drag
      Form1.Edit96.Text:=IntToStr(DumpMOT[91]); // TorqueValue.Min
//   Ïàðàìåòðû  ROP
        // ROP_PI_Kint
      Form1.Edit97.Text:=FloatToStrF(DumpMOT[92]/100,ffFixed,3,2);
      Form1.Edit98.Text:=FloatToStrF(DumpMOT[93]/32,ffFixed,3,1);  // ROP_ON_AccY
      Form1.Edit99.Text:=FloatToStrF(DumpMOT[94]/32,ffFixed,3,1);  // ROP_EnON_AccY
      Form1.Edit80.Text:=FloatToStrF(DumpMOT[82]/32,ffFixed,3,1);  // ROP.AccXdes

// Def_Conf_SPY
   //Ðåæèì èñïîëüçóåñÿ
     if (DumpMOT[98] and 128)=128  then CheckBox64.Checked:=true
                                   else CheckBox64.Checked:=false;
   // SPY model Press for ABS
     if (DumpMOT[98] and 64)=64  then CheckBox65.Checked:=true
                                 else CheckBox65.Checked:=false;

   end; // Config DSC

   Application.ProcessMessages;

   //-----------------ADD CFG VDC----------------------
   Form1.Edit102.Text:=IntToStr(DumpMOT[128]); // UnStON_DerOmegaZ
   Form1.Edit103.Text:=FloatToStrF(DumpMOT[129]/20,ffFixed,3,1);  // DYC Off Press 160 - 8bar
   Form1.Edit104.Text:=IntToStr(DumpMOT[130]); // UnSt_PDThresh
   Form1.Edit105.Text:=IntToStr(DumpMOT[131]); // DYC.CFG.Dif_dP
   Form1.Edit106.Text:=FloatToStrF(DumpMOT[132]/32,ffFixed,3,1);// DeltaWz_Lim  max 8dps
   Form1.Edit107.Text:=IntToStr(DumpMOT[133]);  // VxNormR20m Laden
   Form1.Edit108.Text:=IntToStr(DumpMOT[134]); // Tcut
   Form1.Edit109.Text:=FloatToStrF(DumpMOT[135]*100/256,ffFixed,3,0); // TcutR
   Form1.Edit110.Text:=IntToStr(DumpMOT[136]);  // VxNormR20m Empty
   Form1.Edit111.Text:=FloatToStrF(DumpMOT[137]/32,ffFixed,3,1);// Yaw Bias_Thresh  max 8dps
   Form1.Edit112.Text:=FloatToStrF(DumpMOT[138]*8/143,ffFixed,3,1); // Thresh  SA max 14grad
   Form1.Edit113.Text:=FloatToStrF(DumpMOT[139]/128,ffFixed,3,2);  // Load.CFG.AxRunOut
   Form1.Edit114.Text:=FloatToStrF(DumpMOT[140]/20,ffFixed,3,1);  // Brake.Front.CFG.MDT_Pdes
   Form1.Edit115.Text:=FloatToStrF(DumpMOT[141]/20,ffFixed,3,1);  // Brake.Rear.CFG.MDT_Pdes
 //  Form1.Edit116.Text:=FloatToStrF(DumpMOT[142]/256*100/4,ffFixed,5,1);  // DYC_Sleep F
   Form1.Edit116.Text:=FloatToStrF(DumpMOT[142]/16,ffFixed,5,1);  //
   Form1.Edit117.Text:=IntToStr(Round(DumpMOT[143]/256*100)); // ROP.CFG.Kgaz
   Form1.Edit118.Text:=IntToStr(DumpMOT[144]); // ROP.CFG.EngInt
   Form1.Edit119.Text:=IntToStr(DumpMOT[145]); // P2Fm
   Form1.Edit120.Text:=FloatToStrF(DumpMOT[146]/16,ffFixed,5,1);
   Form1.Edit121.Text:=FloatToStrF(DumpMOT[147]/32,ffFixed,3,1);// Eng dWz  max 8dps
   Form1.Edit122.Text:=IntToStr(DumpMOT[148]); // SpeedON
// DYC_EngSleepOn
   Form1.Edit123.Text:=IntToStr(Round(DumpMOT[149]/256*100));
// ROPengOFF dAy
   Form1.Edit124.Text:=FloatToStrF(DumpMOT[150]/32,ffFixed,3,1);
//DSC_Config_5
// DYC_RoadAx_Enable
   if (DumpMOT[151] and 1)=1  then CheckBox114.Checked:=true
                              else CheckBox114.Checked:=false;
 // Ôèëüòð Vx 1Hz
   if (DumpMOT[151] and 2)=2  then CheckBox115.Checked:=true
                              else CheckBox115.Checked:=false;
 // AccY_Tilting
   if (DumpMOT[151] and 4)=4  then CheckBox116.Checked:=true
                              else CheckBox116.Checked:=false;
 // Ðåãóëèðîâàíèå  AccY
   if (DumpMOT[151] and 8)=8  then CheckBox117.Checked:=true
                              else CheckBox117.Checked:=false;
// ON Check VxEnd
   if (DumpMOT[151] and 16)=16 then CheckBox118.Checked:=true
                               else CheckBox118.Checked:=false;
// TCO_Koef_Enable
   if (DumpMOT[151] and 32)=32 then CheckBox119.Checked:=true
                               else CheckBox119.Checked:=false;
// ROP PumpR cont
   if (DumpMOT[151] and 64)=64 then CheckBox120.Checked:=true
                               else CheckBox120.Checked:=false;
// DYC_PDout_Norm
   if (DumpMOT[151] and 128)=128 then CheckBox121.Checked:=true
                               else CheckBox121.Checked:=false;
 // EngineTorquePeak
   EngineTorquePeak := DumpMOT[152]*256 + DumpMOT[153];
   Form1.Edit125.Text:=IntToStr(EngineTorquePeak);
   Form1.Edit126.Text:=FloatToStrF(DumpMOT[154]/32,ffFixed,3,1);  // UnStAyON
// dWz  SAdec max 8dps
   Form1.Edit127.Text:=FloatToStrF(DumpMOT[155]/32,ffFixed,3,1);//


 //Çàäåðæêà Yaw
   Form1.Edit128.Text:=FloatToStrF(DumpMOT[156]/200,ffFixed,5,3);

// Trailer
   Form1.Edit131.Text:=IntToStr(DumpMOT[157]); // Trailer Dif Kinj
   Form1.Edit132.Text:=IntToStr(DumpMOT[158]); // Trailer Dif Kexh
   Form1.Edit139.Text:=IntToStr(Round(DumpMOT[159]*100/255)); // Trailer Toff
   Form1.Edit140.Text:=FloatToStrF(DumpMOT[160]/20,ffFixed,3,1);  // DYC Press Desire 160 - 8bar
//DSC_Config_6
   // FiltrTrailerPress_Enable
   if (DumpMOT[161] and 1)=1  then CheckBox123.Checked:=true
                              else CheckBox123.Checked:=false;
   // TrailerPress_Sensor_EBS11
   if (DumpMOT[161] and 2)=2  then CheckBox124.Checked:=true
                              else CheckBox124.Checked:=false;
   //  UnSt Derivative Akker
   if (DumpMOT[161] and 4)=4  then CheckBox125.Checked:=true
                              else CheckBox125.Checked:=false;
    // UnSt Drag Act
   if (DumpMOT[161] and 8)=8  then CheckBox128.Checked:=true
                              else CheckBox128.Checked:=false;
    // P reg Tip2
   if (DumpMOT[161] and 16)=16  then CheckBox129.Checked:=true
                                else CheckBox129.Checked:=false;
    // Wref Correct
   if (DumpMOT[161] and 32)=32  then CheckBox130.Checked:=true
                                else CheckBox130.Checked:=false;
    // SSA_OmegaZ_Enable
   if (DumpMOT[161] and 64)=64  then CheckBox113.Checked:=true
                                else CheckBox113.Checked:=false;
   // Ïíåâìî ïîäâåñêà
   Edit405.Text:=IntToStr(DumpMOT[63]);// Tip ECAS
   if (DumpMOT[161] and 128)=128  then
                                  begin
                                       CheckBox131.Checked:=true;
                                       Label364.Visible:=true;
                                       Edit405.Visible:=true;
                                  end
                                  else
                                  begin
                                       CheckBox131.Checked:=false;
                                       Label364.Visible:=false;
                                       Edit405.Visible:=false;
                                  end;

   Form1.Edit141.Text:=FloatToStrF(DumpMOT[162]/20,ffFixed,3,1);   // ROP Press Desire 160 - 8bar
   Form1.Edit142.Text:=IntToStr(DumpMOT[163]);  //  SA Dash
   Form1.Edit144.Text:=FloatToStrF(DumpMOT[165]/20,ffFixed,4,2);   // Delta Press
   Form1.Edit155.Text:=FloatToStrF(DumpMOT[166]/32,ffFixed,4,2);
   // EBL
   Form1.Edit163.Text:=FloatToStrF(DumpMOT[167]/20,ffFixed,4,1);   // Äàâëåíèå îòñå÷êè P laden
   Form1.Edit164.Text:=FloatToStrF(DumpMOT[168]/100,ffFixed,4,2);   // Ïîðîã äàâëåíèÿ  dP laden
   Form1.Edit165.Text:=IntToStr(DumpMOT[169]);  // EBL êîððåêöèÿ ïî çàìåäëåíèþ
// OffSet Break Press
// /20*13.8768/256 = *0.0027
   Form1.Edit200.Text:=FloatToStrF(DumpMOT[170]*0.0027,ffFixed,4,2);
// OffSet ECAS Press
   Form1.Edit201.Text:=FloatToStrF(DumpMOT[171]*0.0027,ffFixed,4,3);
// Íàãðóçêà íà ñöåïêó  ,êã
   Hitch_MaxLoad:= DumpMOT[172]*256+DumpMOT[173];
   Form1.Edit168.Text:=IntToStr(Hitch_MaxLoad);
// FrontAxis_EmptyLoad
   FrontAxis_EmptyLoad:= DumpMOT[174]*256+DumpMOT[175];
   Form1.Edit169.Text:=IntToStr(FrontAxis_EmptyLoad);
// RearAxis_EmptyLoad
   RearAxis_EmptyLoad:= DumpMOT[176]*256+DumpMOT[177];
   Form1.Edit170.Text:=IntToStr(RearAxis_EmptyLoad);
   Form1.Edit154.Text:=IntToStr(FrontAxis_EmptyLoad+RearAxis_EmptyLoad);
// EBL_Sleep
   Form1.Edit171.Text:=FloatToStrF(DumpMOT[178]/256*100/4,ffFixed,5,1);
//DSC_Config_7
   // ROP Reg P Tip2
   if (DumpMOT[179] and 1)=1  then CheckBox136.Checked:=true
                              else CheckBox136.Checked:=false;
   // ROP_Eng_Off
   if (DumpMOT[179] and 2)=2  then CheckBox137.Checked:=true
                              else CheckBox137.Checked:=false;
   // Ïðîñêàëüçûâíèå
   if (DumpMOT[179] and 4)=4  then CheckBox138.Checked:=true
                              else CheckBox138.Checked:=false;
   // Êîðåêöèÿ êîýôôèöèåíòà
   if (DumpMOT[179] and 8)=8  then CheckBox139.Checked:=true
                              else CheckBox139.Checked:=false;
   // Çíàê êîýôôèöèåíòà
   if (DumpMOT[179] and 16)=16  then CheckBox140.Checked:=true
                                else CheckBox140.Checked:=false;
   // CAN Status Enable
   if (DumpMOT[179] and 32)=32  then CheckBox141.Checked:=true
                                else CheckBox141.Checked:=false;
   // ABS_PromExh_Front
   if (DumpMOT[179] and 64)=64  then CheckBox142.Checked:=true
                                else CheckBox142.Checked:=false;
   // Dif_CutM_Enable
   if (DumpMOT[179] and 128)=128  then CheckBox147.Checked:=true
                                  else CheckBox147.Checked:=false;

   Form1.CheckBox140Click(nil);
   
// êîýôôèöèåíò
 //  Form1.Edit172.Text:=FloatToStrF(DumpMOT[180]/256*100,ffFixed,5,1);
   Form1.Edit172.Text:=IntToStr(Round(DumpMOT[180]/256*100));
// ROP Pmax F
   Form1.Edit176.Text:=FloatToStrF(DumpMOT[181]/20,ffFixed,5,1);
// ROP Pmax R
   Form1.Edit177.Text:=FloatToStrF(DumpMOT[182]/20,ffFixed,5,1);
// Num_Axis
   Form1.Edit178.Text:=IntToStr(DumpMOT[183]);

//DSC_Config_8
   // EBS12 Curvature
   if (DumpMOT[184] and 1)=1  then CheckBox143.Checked:=true
                              else CheckBox143.Checked:=false;
   // OneWire Enable
   if (DumpMOT[184] and 2)=2  then CheckBox144.Checked:=true
                              else CheckBox144.Checked:=false;
   // TSC_AE  Arbitrage
   if (DumpMOT[184] and 4)=4  then CheckBox25.Checked:=true
                              else CheckBox25.Checked:=false;
   // Break abort DYC
   if (DumpMOT[184] and 8)=8  then CheckBox44.Checked:=true
                              else CheckBox44.Checked:=false;
   // LowMu AntiGaz Enable
   if (DumpMOT[184] and 16)=16  then CheckBox51.Checked:=true
                                else CheckBox51.Checked:=false;
   // Ïðîòèâ Ñêëàäûâàíèå
   if (DumpMOT[184] and 32)=32  then CheckBox52.Checked:=true
                                else CheckBox52.Checked:=false;
   // Only Circle
   if (DumpMOT[184] and 64)=64  then CheckBox145.Checked:=true
                                else CheckBox145.Checked:=false;
   // AccY_Roll_Enable
   if (DumpMOT[184] and 128)=128  then CheckBox146.Checked:=true
                                  else CheckBox146.Checked:=false;
//SSC.CFG.Ktg_Koef
   Form1.Edit188.Text:=IntToStr(DumpMOT[185]);
// EmptyMass Trailer
   Form1.Edit189.Text:=IntToStr(DumpMOT[186]*256+DumpMOT[187]);
// ROP K1
   Form1.Edit190.Text:=IntToStr(DumpMOT[188]);
   Form1.Edit191.Text:=IntToStr(DumpMOT[189]);
// ROP K2
   Form1.Edit192.Text:=IntToStr(DumpMOT[190]);
//  Form1.Edit193.Text:=IntToStr(DumpMOT[191]);
   Form1.Edit193.Text:=FloatToStrF(DumpMOT[191]/20,ffFixed,4,2);
// ROP K3
   Form1.Edit194.Text:=IntToStr(DumpMOT[192]);
// EBL Tpump
   Form1.Edit195.Text:=IntToStr(DumpMOT[193]);

//DSC_Config_9
// Press Validation
   if (DumpMOT[194] and 1)=1  then CheckBox148.Checked:=true
                              else CheckBox148.Checked:=false;
// Press Sensor OffSet
   if (DumpMOT[194] and 2)=2  then CheckBox149.Checked:=true
                              else CheckBox149.Checked:=false;
// Trailer_Before_ROP_Enable
   if (DumpMOT[194] and 4)=4  then CheckBox150.Checked:=true
                              else CheckBox150.Checked:=false;
// Test Load **
   if (DumpMOT[194] and 8)=8  then CheckBox151.Checked:=true
                              else CheckBox151.Checked:=false;
// Load_Break_Metod2
   if (DumpMOT[194] and 16)=16  then CheckBox152.Checked:=true
                                else CheckBox152.Checked:=false;
// LoadDelay
   if (DumpMOT[194] and 32)=32  then CheckBox153.Checked:=true
                                else CheckBox153.Checked:=false;
// Ph1 Sleep Enable
   if (DumpMOT[194] and 64)=64  then CheckBox154.Checked:=true
                                else CheckBox154.Checked:=false;
// AUX_Press_Sens
   if (DumpMOT[194] and 128)=128  then CheckBox159.Checked:=true
                                  else CheckBox159.Checked:=false;

// Front P_Ful
//   Form1.Edit197.Text:=IntToStr(DumpMOT[195]);
   Form1.Edit197.Text:=FloatToStrF(DumpMOT[195]/100,ffFixed,4,2);
// Rear  P_Ful
//   Form1.Edit196.Text:=IntToStr(DumpMOT[196]);
   Form1.Edit196.Text:=FloatToStrF(DumpMOT[196]/100,ffFixed,4,2);
// Front dP_Max
   Form1.Edit198.Text:=IntToStr(DumpMOT[197]);
// Rear  dP_Max
   Form1.Edit199.Text:=IntToStr(DumpMOT[198]);
// K_ExhTap
   Form1.Edit221.Text:=IntToStr(DumpMOT[199]);
// Êîýôôèöèåíò òðàïåöèè
//   Form1.Edit226.Text:=FloatToStrF(DumpMOT[200]/256*100/4,ffFixed,3,1);
   Form1.Edit226.Text:=FloatToStrF(DumpMOT[200]/256*100/4,ffFixed,3,1);

   Application.ProcessMessages;

//Çàäåðæêà Load
   Form1.Edit202.Text:=FloatToStrF(DumpMOT[201]/200,ffFixed,5,3);
// EBL K4
   Form1.Edit211.Text:=FloatToStrF(DumpMOT[202]/128,ffFixed,4,2);
//
   Form1.Edit214.Text:=FloatToStrF(DumpMOT[203]/20,ffFixed,4,2);

// Engine  K_P4
   Form1.Edit215.Text:=IntToStr(DumpMOT[204]);
// Engine  K_P2
   Form1.Edit216.Text:=IntToStr(DumpMOT[205]);
// Engine  K_Vx
   Form1.Edit218.Text:=IntToStr(DumpMOT[206]);
// Load.CFG.K_Pr
   Form1.Edit219.Text:=IntToStr(DumpMOT[207]);
// Çàäåðæêà Break
   Form1.Edit220.Text:=FloatToStrF(DumpMOT[208]/200,ffFixed,5,3);
// ROP.CFG.dAccY
   Form1.Edit222.Text:=FloatToStrF(DumpMOT[209]/32,ffFixed,3,1);
// dP_min
 //  Form1.Edit224.Text:=IntToStr(DumpMOT[210]);
   Form1.Edit224.Text:=FloatToStrF(DumpMOT[210]/20/4,ffFixed,4,2);   //
// dP_max
 //  Form1.Edit223.Text:=IntToStr(DumpMOT[211]);
   Form1.Edit223.Text:=FloatToStrF(DumpMOT[211]/20/4,ffFixed,4,2);   //

//OffSet_AccY
     OffSet_temp:= DumpMOT[212]*256 + DumpMOT[213];
     if OffSet_temp < 32768 then OffSet_AccY:= OffSet_temp
                            else OffSet_AccY:= OffSet_temp-65536;
     Form1.Edit54.Text:=FloatToStrF(OffSet_AccY/2048,ffFixed,5,2);
//OffSet_AccX
     OffSet_temp:= DumpMOT[214]*256 + DumpMOT[215];
     if OffSet_temp < 32768 then OffSet_AccX:= OffSet_temp
                            else OffSet_AccX:= OffSet_temp-65536;
     Form1.Edit59.Text:=FloatToStrF(OffSet_AccX/2048,ffFixed,5,2);

 //Engine.CFG.TorqXX
     Form1.Edit245.Text:= IntToStr(DumpMOT[216]);
// ASR.CFG.Sleep
     Form1.Edit294.Text:=FloatToStrF(DumpMOT[217]/10,ffFixed,4,1);

// dP Pump
     Form1.Edit248.Text:= IntToStr(DumpMOT[218]);
// dP Exh
     Form1.Edit247.Text:= IntToStr(DumpMOT[219]);
// Grad_Inj
     Form1.Edit253.Text:= IntToStr(DumpMOT[220]);
// Grad_Exh
     Form1.Edit254.Text:= IntToStr(DumpMOT[221]);
// Vehicle_StateAGS
     Vehicle_StateAGS:= DumpMOT[222];
// Vehicle.StateSAS
     Vehicle_StateSAS:= DumpMOT[223];

// VIN
     Vehicle_VIN:='';
     for i:=1 to 17 do
{     begin
       if Tip_Block < 8 then
            Vehicle_VIN_Data[i]:= DumpMOT[224+i-1]
       else Vehicle_VIN_Data[i]:= Vehicle_VIN_DataV8[i];
       Insert(Chr(Ord(Vehicle_VIN_Data[i])), Vehicle_VIN, i);
     end; }
     begin
       Vehicle_VIN_Data[i]:= DumpMOT[224+i-1];
       Insert(Chr(Ord(Vehicle_VIN_Data[i])), Vehicle_VIN, i);
     end;
     VIN_Manuf:='';
     for i:=1 to 3 do
     Insert(Chr(Ord(Vehicle_VIN_Data[i])), VIN_Manuf, i);
     VIN_Model:='';
     for i:=4 to 7 do
     Insert(Chr(Ord(Vehicle_VIN_Data[i])), VIN_Model, i);
     VIN_Engine:='';
     for i:=8 to 9 do
     Insert(Chr(Ord(Vehicle_VIN_Data[i])), VIN_Engine, i);
     VIN_Year:='';
     Insert(Chr(Ord(Vehicle_VIN_Data[10])),VIN_Year, 10);
     VIN_Num:='';
     for i:=11 to 17 do
     Insert(Chr(Ord(Vehicle_VIN_Data[i])), VIN_Num, i);
 //    if Tip_Block < 8 then
     SetCod:= DumpMOT[241];
 //    else SetCod:= CFG_SetCodV8;
     //  Ââîä â ýêñïëóàòàöèþ GroupBox153 Äàííûå ABS
     if not Fl_VIN_CFG then
     begin
 //    CFG_SetCod:=0;
     Form1.Edit262.Text:= VIN_Manuf;
     Form1.Edit259.Text:= VIN_Model;
     Form1.Edit260.Text:= VIN_Engine;
     Form1.Edit263.Text:= VIN_Year;
     Form1.Edit261.Text:= VIN_Num;
     Form1.Edit265.Text:= IntToStr(SetCod);
     ViewVIN;
     end;

//DSC_Config_10
// Engine ASR
   if (DumpMOT[242] and 1)=1 then CheckBox155.Checked:=true
                             else CheckBox155.Checked:=false;
// ASR Break Enable
   if (DumpMOT[242] and 2)=2 then CheckBox156.Checked:=true
                             else CheckBox156.Checked:=false;
// ASR Torque Enable
   if (DumpMOT[242] and 4)=4 then CheckBox157.Checked:=true
                             else CheckBox157.Checked:=false;
// ASR Engine Control
   if (DumpMOT[242] and 8)=8 then CheckBox158.Checked:=true
                             else CheckBox158.Checked:=false;
// ABS_BrCond_Enable
   if (DumpMOT[242] and 16)=16 then CheckBox160.Checked:=true
                               else CheckBox160.Checked:=false;
// Ph1 Dec Exhaust Enable
   if (DumpMOT[242] and 32)=32 then CheckBox161.Checked:=true
                               else CheckBox161.Checked:=false;
// ABS Break Enable
   if (DumpMOT[242] and 64)=64 then CheckBox164.Checked:=true
                               else CheckBox164.Checked:=false;
// ABS_BrCond_Enable
   if (DumpMOT[242] and 128)=128 then CheckBox165.Checked:=true
                                 else CheckBox165.Checked:=false;

// Grad_Inj Rear
   Form1.Edit266.Text:= IntToStr(DumpMOT[247]);
// Grad_Exh Rear
   Form1.Edit267.Text:= IntToStr(DumpMOT[248]);
// Chamber Tip Front
   Form1.Edit269.Text:= IntToStr(DumpMOT[249]);
// Chamber Tip Rear
   Form1.Edit270.Text:= IntToStr(DumpMOT[250]);
// Efficiency
   Form1.Edit273.Text:= IntToStr(DumpMOT[251]);//FloatToStrF(DumpMOT[251]/100,ffFixed,5,2);

//DSC_Config_11
// RearTire_Tandem
   if (DumpMOT[252] and 1)=1 then CheckBox162.Checked:=true
                             else CheckBox162.Checked:=false;
// DopTire_Tandem
   if (DumpMOT[252] and 2)=2 then CheckBox163.Checked:=true
                             else CheckBox163.Checked:=false;
// Press_Emul_Enable
   if (DumpMOT[252] and 4)=4 then CheckBox166.Checked:=true
                             else CheckBox166.Checked:=false;
// Ph1 Accel Enable
   if (DumpMOT[252] and 8)=8 then CheckBox167.Checked:=true
                             else CheckBox167.Checked:=false;
// Emul  Ay  Ax
   if (DumpMOT[252] and 16)=16 then begin
                                  CheckBox168.Checked:=true;
                                  CheckBox168.Caption:='Emul  Ax Ay';
                               end
                               else  begin
                                  CheckBox168.Checked:=false;
                                  CheckBox168.Caption:='Emul  Ay Ax';
                               end;
                                CheckBox168.Repaint;
// Emul  Taxo
   if (DumpMOT[252] and 32)=32 then CheckBox169.Checked:=true
                               else CheckBox169.Checked:=false;
// Speed_HalfPeriod
   if (DumpMOT[252] and 64)=64 then CheckBox170.Checked:=true
                               else CheckBox170.Checked:=false;
// Adjst Repeat
   if (DumpMOT[252] and 128)=128 then CheckBox171.Checked:=true
                                 else CheckBox171.Checked:=false;


//  ABS K Ph4 dP Front
   Form1.Edit274.Text:= IntToStr(DumpMOT[253]);
//  ABS K Ph4 dP Rear
   Form1.Edit275.Text:= IntToStr(DumpMOT[254]);
// ABS K Accel Front
   Form1.Edit276.Text:= IntToStr(DumpMOT[255]);
// ABS K Accel Rear
   Form1.Edit277.Text:= IntToStr(DumpMOT[256]);

// ABS K ForceZ Front
   Form1.Edit278.Text:= IntToStr(DumpMOT[257]);
// Rekursiya  K
   Form1.Edit279.Text:= IntToStr(DumpMOT[258]);

// ABS Press Min Front
   Form1.Edit280.Text:=FloatToStrF(DumpMOT[259]/20,ffFixed,4,1);
// ABS Press Min Rear
   Form1.Edit281.Text:=FloatToStrF(DumpMOT[260]/20,ffFixed,4,1);

// Accel ABS On  Front
   Form1.Edit282.Text:=FloatToStrF(DumpMOT[261]/5,ffFixed,4,1);
// Pause
   Form1.Edit283.Text:= IntToStr(DumpMOT[262]);
// MIR_Front.CFG.dP0_L
   Form1.Edit286.Text:=FloatToStrF(DumpMOT[263]/100,ffFixed,4,2);
// MIR_Front.CFG.dP0_R
   Form1.Edit284.Text:=FloatToStrF(DumpMOT[264]/100,ffFixed,4,2);
// MIR_Front.CFG.KdP
   Form1.Edit285.Text:= IntToStr(DumpMOT[265]);

//DSC_Config_12
// BC_AntiGAZ_Enable
   if (DumpMOT[266] and 1)=1 then CheckBox173.Checked:=true
                             else CheckBox173.Checked:=false;
// ROP_LoadB_Enable Îïðåäåëåíèå Load ïðè ROP
   if (DumpMOT[266] and 2)=2 then CheckBox172.Checked:=true
                             else CheckBox172.Checked:=false;
// ROP_Engine_Taxo
   if (DumpMOT[266] and 4)=4 then CheckBox174.Checked:=true
                             else CheckBox174.Checked:=false;
// Engine_EC1_Enable
   if (DumpMOT[266] and 8)=8 then CheckBox175.Checked:=true
                             else CheckBox175.Checked:=false;
// ASR_Taxo_Grad
   if (DumpMOT[266] and 16)=16 then CheckBox176.Checked:=true
                               else CheckBox176.Checked:=false;
// ASR_Taxo_Filtr
   if (DumpMOT[266] and 32)=32 then CheckBox177.Checked:=true
                               else CheckBox177.Checked:=false;
// ASR dTaxoLim
   if (DumpMOT[266] and 64)=64 then CheckBox178.Checked:=true
                               else CheckBox178.Checked:=false;
// ASR  DYC  Disable
   if (DumpMOT[266] and 128)=128 then CheckBox180.Checked:=true
                                 else CheckBox180.Checked:=false;

// Accel ABS On Rear
   Form1.Edit288.Text:=FloatToStrF(DumpMOT[267]/5,ffFixed,4,1);
// ASR.CFG.ThrP
   Form1.Edit291.Text:=FloatToStrF(DumpMOT[268]/100,ffFixed,4,2);
// ASR.CFG.dPump
   Form1.Edit292.Text:=FloatToStrF(DumpMOT[269]/100,ffFixed,4,2);
// ROP.CFG.Turn_OO
   Form1.Edit293.Text:=FloatToStrF((DumpMOT[270]*256 +
                                    DumpMOT[271])/1024 ,ffFixed,5,2);
// Wheel_FL.ABS.CFG.SleepOn
   Form1.Edit289.Text:=FloatToStrF(DumpMOT[272]/10,ffFixed,4,1);
// Wheel_RL.ABS.CFG.SleepOn
   Form1.Edit290.Text:=FloatToStrF(DumpMOT[273]/10,ffFixed,4,1);
// ASR.CFG.dTaxoLim
   Form1.Edit246.Text:=IntToStr(DumpMOT[274]);

//DSC_Config_13
// ABS  DYC  Disable
   if (DumpMOT[275] and 1)=1 then CheckBox179.Checked:=true
                             else CheckBox179.Checked:=false;
// Ph1 dExh1  Enable
   if (DumpMOT[275] and 2)=2 then CheckBox181.Checked:=true
                             else CheckBox181.Checked:=false;
// Ph1 dExh2  Enable
   if (DumpMOT[275] and 4)=4 then CheckBox182.Checked:=true
                             else CheckBox182.Checked:=false;
// Ph1 OffDec  Enable
   if (DumpMOT[275] and 8)=8 then CheckBox183.Checked:=true
                             else CheckBox183.Checked:=false;
// ABS_CutPh7_Disable
   if (DumpMOT[275] and 16)=16 then CheckBox184.Checked:=true
                               else CheckBox184.Checked:=false;
// Trailer Press  AUX2
   if (DumpMOT[275] and 32)=32 then CheckBox208.Checked:=true
                               else CheckBox208.Checked:=false;
// Break Press Sens CAN
   if (DumpMOT[275] and 64)=64 then CheckBox209.Checked:=true
                               else CheckBox209.Checked:=false;
// Validity abort DYC
   if (DumpMOT[275] and 128)=128 then CheckBox210.Checked:=true
                                 else CheckBox210.Checked:=false;

// ASR PID Kpro
   Form1.Edit295.Text:=IntToStr(DumpMOT[276]);
// ASR PID IntI
   Form1.Edit297.Text:=IntToStr(DumpMOT[277]);
// ASR PID dif
   Form1.Edit296.Text:=IntToStr(DumpMOT[278]);
// ASR K load
   Form1.Edit298.Text:=IntToStr(DumpMOT[279]);
// ABS Ph6 dPF
   Form1.Edit299.Text:=FloatToStrF(DumpMOT[280]/100,ffFixed,4,2);
// ABS Ph6 dPR
   Form1.Edit300.Text:=FloatToStrF(DumpMOT[281]/100,ffFixed,4,2);
// ABS Ph6 KdPF
   Form1.Edit301.Text:=IntToStr(DumpMOT[282]);
// ABS Ph6 KdPR
   Form1.Edit302.Text:=IntToStr(DumpMOT[283]);
// ASR Speed On
   Form1.Edit303.Text:=IntToStr(DumpMOT[284]);
// ABS.CFG.SleepExh
   Form1.Edit304.Text:=FloatToStrF(DumpMOT[285]/10,ffFixed,4,1);
// Fault Maska
//   Form1.Edit314.Text:=IntToStr(DumpMOT[286]);
// AGS  Zero Fail  Enable
   if (DumpMOT[286] and 1)=1 then CheckBox247.Checked:=true
                             else CheckBox247.Checked:=false;
// AGS  Mount Fail  Enable
   if (DumpMOT[286] and 2)=2 then CheckBox248.Checked:=true
                             else CheckBox248.Checked:=false;
// AGS  Install Fail  Enable
   if (DumpMOT[286] and 4)=4 then CheckBox249.Checked:=true
                             else CheckBox249.Checked:=false;
// SAS  Zero Fail  Enable
   if (DumpMOT[286] and 8)=8 then CheckBox250.Checked:=true
                             else CheckBox250.Checked:=false;
// SAS  Install Fail  Enable
   if (DumpMOT[286] and 16)=16 then CheckBox251.Checked:=true
                               else CheckBox251.Checked:=false;
// ModelStr  Install Fail  Enable
   if (DumpMOT[286] and 32)=32 then CheckBox252.Checked:=true
                               else CheckBox252.Checked:=false;
// Trailer Pnevmo Enable
   if (DumpMOT[286] and 64)=64 then CheckBox255.Checked:=true
                               else CheckBox255.Checked:=false;
// HillHolder Failure Enable
   if (DumpMOT[286] and 128)=128 then CheckBox275.Checked:=true
                                 else CheckBox275.Checked:=false;

// ASR.CFG.Kgaz
 //  Form1.Edit315.Text:=IntToStr(DumpMOT[287]);
   Form1.Edit315.Text:=IntToStr(Round(DumpMOT[287]/256*100)); //

//DSC_Config_14
// EBL_HighP_Enable
   if (DumpMOT[288] and 1)=1 then CheckBox211.Checked:=true
                             else CheckBox211.Checked:=false;
// EBL_Pump_dP_CFG
   if (DumpMOT[288] and 2)=2 then CheckBox212.Checked:=true
                             else CheckBox212.Checked:=false;
// EBL_Ks_Enable
   if (DumpMOT[288] and 4)=4 then CheckBox213.Checked:=true
                             else CheckBox213.Checked:=false;
// ABS_BC Ph4 Enable
   if (DumpMOT[288] and 8)=8 then CheckBox214.Checked:=true
                             else CheckBox214.Checked:=false;
// ABS_Ph1 End  Accel
   if (DumpMOT[288] and 16)=16 then CheckBox215.Checked:=true
                               else CheckBox215.Checked:=false;
// ABS_Ph4 dP Metod2
   if (DumpMOT[288] and 32)=32 then CheckBox216.Checked:=true
                               else CheckBox216.Checked:=false;
// ABS_ExhTAI_Enable
   if (DumpMOT[288] and 64)=64 then CheckBox217.Checked:=true
                               else CheckBox217.Checked:=false;
// dAy Off Event
   if (DumpMOT[288] and 128)=128 then CheckBox218.Checked:=true
                                 else CheckBox218.Checked:=false;
// ABS_Promotion AccMax
   Form1.Edit316.Text:=IntToStr(DumpMOT[289]);

//DSC_Config_15
// Ph3 End Accel Lim
   if (DumpMOT[290] and 1)=1 then CheckBox219.Checked:=true
                             else CheckBox219.Checked:=false;
// MIRF_dWZ_Enable
   if (DumpMOT[290] and 2)=2 then CheckBox220.Checked:=true
                             else CheckBox220.Checked:=false;
// SlipThr_Change
   if (DumpMOT[290] and 4)=4 then CheckBox221.Checked:=true
                             else CheckBox221.Checked:=false;
// SpeedThr Enable
   if (DumpMOT[290] and 8)=8 then CheckBox222.Checked:=true
                             else CheckBox222.Checked:=false;
// ABS_FdExh2_Enable
   if (DumpMOT[290] and 16)=16 then CheckBox223.Checked:=true
                               else CheckBox223.Checked:=false;
// Mu Split Enable
   if (DumpMOT[290] and 32)=32 then CheckBox224.Checked:=true
                               else CheckBox224.Checked:=false;
// MIRF ExhM Tip2
   if (DumpMOT[290] and 64)=64 then CheckBox225.Checked:=true
                               else CheckBox225.Checked:=false;
// Ph6_ddP_Tip2
   if (DumpMOT[290] and 128)=128 then CheckBox226.Checked:=true
                                 else CheckBox226.Checked:=false;

// ProM            km/h
   Form1.Edit318.Text:=FloatToStrF(DumpMOT[291]/32,ffFixed,4,2);
// High Mu
   Form1.Edit317.Text:=FloatToStrF(DumpMOT[292]/9.81/16,ffFixed,4,2);
// SlipThr Change     K
   Form1.Edit319.Text:=IntToStr(DumpMOT[293]);
// Speed OFF Min    km/h
   Form1.Edit320.Text:=FloatToStrF(DumpMOT[294]/16,ffFixed,4,2);
// ABS.CFG.SleepEnd
   Form1.Edit321.Text:=FloatToStrF(DumpMOT[295]/10,ffFixed,4,1);
// Relation Press
   Form1.Edit322.Text:=FloatToStrF(DumpMOT[296]/10,ffFixed,4,1);
// ABS.CFG.T_ShExh
   Form1.Edit323.Text:=IntToStr(DumpMOT[297]);
//  P0 FL
   Form1.Edit324.Text:=IntToStr(DumpMOT[298]);//FloatToStrF(DumpMOT[298]/100,ffFixed,4,2);
// Koef Short Exh Front
   Form1.Edit325.Text:=IntToStr(DumpMOT[299]);
// MIRF dWz
   Form1.Edit326.Text:=FloatToStrF(DumpMOT[300]/32,ffFixed,3,1);//max 8dps
// MIRF dPmax
   Form1.Edit327.Text:=FloatToStrF(DumpMOT[301]/100,ffFixed,4,2);

   Application.ProcessMessages;

// ECAS.CFG.Susp_Mass
   Form1.Edit328.Text:=IntToStr(DumpMOT[302]*10);
//DSC_Config_16
// ECAS_SP_Install
   if (DumpMOT[303] and 1)=1 then CheckBox229.Checked:=true
                             else CheckBox229.Checked:=false;
// Deccel  50 - 15 km/h
   if (DumpMOT[303] and 2)=2 then CheckBox228.Checked:=true
                             else CheckBox228.Checked:=false;
// ABS Disable AxFail
   if (DumpMOT[303] and 4)=4 then CheckBox230.Checked:=true
                             else CheckBox230.Checked:=false;
// Psen1 Install
   if (DumpMOT[303] and 8)=8 then CheckBox231.Checked:=true
                             else CheckBox231.Checked:=false;
// Break_Tip_Front
   if (DumpMOT[303] and 16)=16 then CheckBox232.Checked:=true
                               else CheckBox232.Checked:=false;
// Break_Tip_Rear
   if (DumpMOT[303] and 32)=32 then CheckBox233.Checked:=true
                               else CheckBox233.Checked:=false;
// EBL_FzHg_Enable
   if (DumpMOT[303] and 64)=64 then CheckBox234.Checked:=true
                               else CheckBox234.Checked:=false;
// Brake One Axis_Enable
   if (DumpMOT[303] and 128)=128 then CheckBox235.Checked:=true
                                 else CheckBox235.Checked:=false;
// DSC_Car_Hcg
   Form1.Edit330.Text:=FloatToStrF(DumpMOT[304]/100,ffFixed,4,2);
// Wheel_FL.CFG.TpumpMin
   Form1.Edit332.Text:=IntToStr(DumpMOT[305]);
// Wheel_ÊL.CFG.TpumpMin
   Form1.Edit333.Text:=IntToStr(DumpMOT[306]);
// Load.CFG.P_Start
 //  Form1.Edit334.Text:=IntToStr(DumpMOT[307]);
   Form1.Edit334.Text:=FloatToStrF(DumpMOT[307]/20,ffFixed,3,1);
// Wheel_ÊL.CFG.Tpump
   Form1.Edit335.Text:=IntToStr(DumpMOT[308]);

//DSC_Config_17
// ABS_Tpump_Enable
   if (DumpMOT[309] and 1)=1 then CheckBox236.Checked:=true
                             else CheckBox236.Checked:=false;
// Brake Asist _Enable
   if (DumpMOT[309] and 2)=2 then CheckBox237.Checked:=true
                             else CheckBox237.Checked:=false;
// EBL_PoCut_Enable
   if (DumpMOT[309] and 4)=4 then CheckBox238.Checked:=true
                             else CheckBox238.Checked:=false;
// IncValve_Tip2
   if (DumpMOT[309] and 8)=8 then CheckBox239.Checked:=true
                             else CheckBox239.Checked:=false;
// DBR  Enable
   if (DumpMOT[309] and 16)=16 then CheckBox240.Checked:=true
                               else CheckBox240.Checked:=false;
// ABS_Sign_KdP
   if (DumpMOT[309] and 32)=32 then CheckBox241.Checked:=true
                               else CheckBox241.Checked:=false;
// Trailer_Stop_Light
   if (DumpMOT[309] and 64)=64 then CheckBox242.Checked:=true
                               else CheckBox242.Checked:=false;
// Rele_Stop_Install
   if (DumpMOT[309] and 128)=128 then CheckBox243.Checked:=true
                                 else CheckBox243.Checked:=false;

// Brake Asist_Press
   Form1.Edit336.Text:=FloatToStrF(DumpMOT[310]/20,ffFixed,4,1);
// Koef Short Exh Rear
   Form1.Edit337.Text:=IntToStr(DumpMOT[311]);
// ABS.CFG.T_ShExh Rear
   Form1.Edit338.Text:=IntToStr(DumpMOT[312]);
// DBR.CFG.SlipOn
   Form1.Edit339.Text:=FloatToStrF(DumpMOT[313]/10,ffFixed,4,1);
// DBR.CFG.SlipOff
   Form1.Edit340.Text:=FloatToStrF(DumpMOT[314]/10,ffFixed,4,1);
// DBR.Speed ON
   Form1.Edit341.Text:=IntToStr(DumpMOT[315]);
// Brake Asist_Time
   Form1.Edit342.Text:=FloatToStrF(DumpMOT[316]/100,ffFixed,4,2);

//DSC_Config_18
// Hill Holder_Enable
   if (DumpMOT[317] and 1)=1 then CheckBox244.Checked:=true
                             else CheckBox244.Checked:=false;
// Hill Holder_Lamp
   if (DumpMOT[317] and 2)=2 then CheckBox245.Checked:=true
                             else CheckBox245.Checked:=false;
// HHR_DifR_Enable
   if (DumpMOT[317] and 4)=4 then CheckBox246.Checked:=true
                             else CheckBox246.Checked:=false;
// HHR_Switch  óñòàíîâëåí
   if (DumpMOT[317] and 8)=8 then CheckBox253.Checked:=true
                             else CheckBox253.Checked:=false;
// HHR_Press_Enable
   if (DumpMOT[317] and 16)=16 then CheckBox254.Checked:=true
                               else CheckBox254.Checked:=false;
// Emergency Brake àêòèâèðóåòñÿ
   if (DumpMOT[317] and 32)=32 then CheckBox256.Checked:=true
                               else CheckBox256.Checked:=false;
// SPN5847_Deccel_6
   if (DumpMOT[317] and 64)=64 then CheckBox257.Checked:=true
                               else CheckBox257.Checked:=false;
// Test_GndWL_Enable
   if (DumpMOT[317] and 128)=128 then CheckBox260.Checked:=true
                                 else CheckBox260.Checked:=false;

// Hill Holder_Time
   Form1.Edit347.Text:=FloatToStrF(DumpMOT[318]/20,ffFixed,4,1);
// SpThr_dPpump_F    km/h
   Form1.Edit314.Text:=FloatToStrF(DumpMOT[319]/32,ffFixed,4,2);
// SpThr_dPpump_R    km/h
   Form1.Edit348.Text:=FloatToStrF(DumpMOT[320]/32,ffFixed,4,2);
// SpThr_Con_F    km/h
   Form1.Edit349.Text:=FloatToStrF(DumpMOT[321]/32,ffFixed,4,2);
// SpThr_Con_R    km/h
   Form1.Edit350.Text:=FloatToStrF(DumpMOT[322]/32,ffFixed,4,2);

//DSC_Config_19
// Brake Tout Enable
   if (DumpMOT[323] and 1)=1 then CheckBox258.Checked:=true
                             else CheckBox258.Checked:=false;
// Engine Tout Enable
   if (DumpMOT[323] and 2)=2 then CheckBox259.Checked:=true
                             else CheckBox259.Checked:=false;
// All Off  Tout Enable
   if (DumpMOT[323] and 4)=4 then CheckBox262.Checked:=true
                             else CheckBox262.Checked:=false;
// ASR_Torq_KoefPress
   if (DumpMOT[323] and 8)=8 then CheckBox263.Checked:=true
                             else CheckBox263.Checked:=false;
// Brake Tout  Tip2 (Plim)
   if (DumpMOT[323] and 16)=16 then CheckBox264.Checked:=true
                               else CheckBox264.Checked:=false;
// ON Check TCO
   if (DumpMOT[323] and 32)=32 then CheckBox265.Checked:=true
                               else CheckBox265.Checked:=false;
// Error  RWS Enable
   if (DumpMOT[323] and 64)=64 then CheckBox266.Checked:=true
                               else CheckBox266.Checked:=false;
// ASR_Brake_Fz
   if (DumpMOT[323] and 128)=128 then CheckBox269.Checked:=true
                                 else CheckBox269.Checked:=false;

// Brake Tout
   Form1.Edit352.Text:=FloatToStrF(DumpMOT[324]/8,ffFixed,4,1);
// Engine Tout
   Form1.Edit353.Text:=FloatToStrF(DumpMOT[325]/2,ffFixed,4,0);
// ASR Brake Pmax
   Form1.Edit351.Text:=FloatToStrF(DumpMOT[326]/20,ffFixed,4,1);
// SASzero_Wz  max 2dps
   Form1.Edit354.Text:=FloatToStrF(DumpMOT[327]/128,ffFixed,3,2);
// SASzero_SAngle  max 14deg
   Form1.Edit355.Text:=FloatToStrF(DumpMOT[328]/pi*180/1024,ffFixed,3,1);

//DSC_Config_20
// DIF_PWM_Enable
   if (DumpMOT[329] and 1)=1 then CheckBox267.Checked:=true
                             else CheckBox267.Checked:=false;
// Grad  Enable
   if (DumpMOT[329] and 2)=2 then CheckBox268.Checked:=true
                             else CheckBox268.Checked:=false;
// PsFail_Enable
   if (DumpMOT[329] and 4)=4 then CheckBox261.Checked:=true
                             else CheckBox261.Checked:=false;
// Load KTS
   if (DumpMOT[329] and 8)=8 then CheckBox270.Checked:=true
                             else CheckBox270.Checked:=false;
// Extapolation Enable
   if (DumpMOT[329] and 16)=16 then CheckBox271.Checked:=true
                               else CheckBox271.Checked:=false;
// Extapolation Accel
   if (DumpMOT[329] and 32)=32 then CheckBox272.Checked:=true
                               else CheckBox272.Checked:=false;
// VDC Fail Stop
   if (DumpMOT[329] and 64)=64 then CheckBox273.Checked:=true
                               else CheckBox273.Checked:=false;
// TP2  My_Main
   if (DumpMOT[329] and 128)=128 then CheckBox274.Checked:=true
                                 else CheckBox274.Checked:=false;

// ASRE ON Delay
   Form1.Edit356.Text:=IntToStr(DumpMOT[330]*5);
// ASR PID IntD
   Form1.Edit362.Text:=IntToStr(DumpMOT[331]);
// __ASRB_Thr_Mul
   Form1.Edit363.Text:=IntToStr(DumpMOT[332]);

//DSC_Config_21
// Ôèëüòð ìåäèàíà
   if (DumpMOT[333] and 1)=1 then CheckBox276.Checked:=true
                             else CheckBox276.Checked:=false;
// Ôèëüòð Break Demand
   if (DumpMOT[333] and 2)=2 then CheckBox277.Checked:=true
                             else CheckBox277.Checked:=false;
// Load_DeltaMass_Lim
   if (DumpMOT[333] and 4)=4 then CheckBox278.Checked:=true
                             else CheckBox278.Checked:=false;
// Stop Switch Test
   if (DumpMOT[333] and 8)=8 then CheckBox279.Checked:=true
                             else CheckBox279.Checked:=false;
// BPS Off Test
   if (DumpMOT[333] and 16)=16 then CheckBox280.Checked:=true
                               else CheckBox280.Checked:=false;
// BPS On Test
   if (DumpMOT[333] and 32)=32 then CheckBox281.Checked:=true
                               else CheckBox281.Checked:=false;
// Trailer_PS_Test
   if (DumpMOT[333] and 64)=64 then CheckBox282.Checked:=true
                               else CheckBox282.Checked:=false;
// Trailer_NC_Test
   if (DumpMOT[333] and 128)=128 then CheckBox283.Checked:=true
                                 else CheckBox283.Checked:=false;

// Load Engine Vmax
   Form1.Edit364.Text:=IntToStr(DumpMOT[334]);

//DSC_Config_22
// Stop_Light_Test
   if (DumpMOT[335] and 1)=1 then CheckBox284.Checked:=true
                             else CheckBox284.Checked:=false;
// Trailer_PS_On_Test
   if (DumpMOT[335] and 2)=2 then CheckBox285.Checked:=true
                             else CheckBox285.Checked:=false;
// ABS_Ph5_PauseSlip
   if (DumpMOT[335] and 4)=4 then CheckBox286.Checked:=true
                             else CheckBox286.Checked:=false;
// ABS_Search_SlipOpt
   if (DumpMOT[335] and 8)=8 then CheckBox287.Checked:=true
                             else CheckBox287.Checked:=false;
// IncValve_Always
   if (DumpMOT[335] and 16)=16 then CheckBox288.Checked:=true
                               else CheckBox288.Checked:=false;
// Filt_AirDrop_Enable
   if (DumpMOT[335] and 32)=32 then CheckBox289.Checked:=true
                               else CheckBox289.Checked:=false;
// MDT_Left_Enable
   if (DumpMOT[335] and 64)=64 then CheckBox290.Checked:=true
                               else CheckBox290.Checked:=false;

// Pause Slip Koef
   Form1.Edit365.Text:=FloatToStrF(DumpMOT[336]/16,ffFixed,4,1);
// Brake.Front.CFG.K_Pva
   Form1.Edit366.Text:=IntToStr(DumpMOT[337]);
// Brake.Rear.CFG.K_Pva
   Form1.Edit367.Text:=IntToStr(DumpMOT[338]);

//DSC_Config_23
// MDT_Front_Enable
   if (DumpMOT[339] and 1)=1 then CheckBox291.Checked:=true
                             else CheckBox291.Checked:=false;
// MDT_Rear_Enable
   if (DumpMOT[339] and 2)=2 then CheckBox292.Checked:=true
                             else CheckBox292.Checked:=false;
// GearBox_AutoMatic
   if (DumpMOT[339] and 4)=4 then CheckBox293.Checked:=true
                             else CheckBox293.Checked:=false;
// DBR_Torque_Set
   if (DumpMOT[339] and 8)=8 then CheckBox294.Checked:=true
                             else CheckBox294.Checked:=false;
// Sens_Clutch_Instal
   if (DumpMOT[339] and 16)=16 then CheckBox295.Checked:=true
                               else CheckBox295.Checked:=false;
// ECAS_PS_Calibr
   if (DumpMOT[339] and 32)=32 then CheckBox296.Checked:=true
                               else CheckBox296.Checked:=false;
// EBC1_SPN521_Enable
   if (DumpMOT[339] and 64)=64 then CheckBox297.Checked:=true
                               else CheckBox297.Checked:=false;
// ABS_OffRoad_Enable
   if (DumpMOT[339] and 128)=128 then CheckBox298.Checked:=true
                                 else CheckBox298.Checked:=false;

//DSC_Config_24
// Ïðèáîðíàÿ ïàíåëü
   rg5.ItemIndex:= (DumpMOT[340] and 3);
// K Line Blink Code
   if (DumpMOT[340] and 8)=8 then CheckBox300.Checked:=true
                             else CheckBox300.Checked:=false;
// BPS_onAccValve
   if (DumpMOT[340] and 16)=16 then CheckBox302.Checked:=true
                               else CheckBox302.Checked:=false;
// Halt Brake Gaz
   if (DumpMOT[340] and 32)=32 then CheckBox306.Checked:=true
                               else CheckBox306.Checked:=false;
// Halt Brake Enable
   if (DumpMOT[340] and 64)=64 then CheckBox304.Checked:=true
                               else CheckBox304.Checked:=false;
// Halt Brake Auto
   if (DumpMOT[340] and 128)=128 then CheckBox305.Checked:=true
                                 else CheckBox305.Checked:=false;

//DSC_Config_25
// Îðèåíòàöèÿ Áëîêà
   RadioGroup11.ItemIndex:= (DumpMOT[341] and 7);
// Plata_AGS_Enable
   if (DumpMOT[341] and 8)=8 then CheckBox301.Checked:=true
                             else CheckBox301.Checked:=false;
// XBR
   if (DumpMOT[341] and 16)=16 then CheckBox307.Checked:=true
                               else CheckBox307.Checked:=false;
// ABS Rear ON RefSpeed
   if (DumpMOT[341] and 32)=32 then CheckBox303.Checked:=true
                               else CheckBox303.Checked:=false;
// VW 1s Enable
   if (DumpMOT[341] and 64)=64 then CheckBox308.Checked:=true
                               else CheckBox308.Checked:=false;
// GYRO  Self Set Zero
   if (DumpMOT[341] and 128)=128 then CheckBox309.Checked:=true
                                 else CheckBox309.Checked:=false;

//DSC_Config_26
// Îøèáêè Not Clear
   if (DumpMOT[342] and 1)=1 then CheckBox310.Checked:=true
                             else CheckBox310.Checked:=false;
// DBR_Torque_Deccel Enable
   if (DumpMOT[342] and 2)=2 then CheckBox311.Checked:=true
                             else CheckBox311.Checked:=false;
// Ó÷èòûâàòü Ðåòàðäåð K
   if (DumpMOT[342] and 4)=4 then CheckBox312.Checked:=true
                             else CheckBox312.Checked:=false;
   if (DumpMOT[342] and 8)=8 then CheckBox330.Checked:=true
                             else CheckBox330.Checked:=false;
   if (DumpMOT[342] and 16)=16 then CheckBox329.Checked:=true
                                else CheckBox329.Checked:=false;
   if (DumpMOT[342] and 32)=32 then CheckBox328.Checked:=true
                               else CheckBox328.Checked:=false;
 // Blink_Code_Enable
   if (DumpMOT[342] and 64)=64 then CheckBox333.Checked:=true
                               else CheckBox333.Checked:=false;
// Axis3Tire_Tandem
   if (DumpMOT[342] and 128)=128 then CheckBox163.Checked:=true
                                 else CheckBox163.Checked:=false;

// DBR_Deccel
   Form1.Edit401.Text:=FloatToStrF(DumpMOT[343]/64,ffFixed,3,1);
// DBR_Torque
   Form1.Edit402.Text:= IntToStr(125-DumpMOT[344]);
//  Ðåòàðäåð K Load
   Form1.Edit403.Text:= IntToStr(DumpMOT[345]);
   // LIM.CFG.PWM_PK.Kper èçìåíåíèå ïåðèîäà
   Form1.Edit450.Text:= IntToStr(DumpMOT[346]);
   // LIM.CFG.PWM_PK.Period  ïåðèîä mc
   Form1.Edit451.Text:= IntToStr(DumpMOT[347]);

   // Vehicle Modification
   Vehicle_Modification:='';
   for i:=1 to Modif_Size do
   begin
//     if Tip_Block < 8 then
     Vehicle_Modif_Data[i]:= DumpMOT[348+i-1];
//     else Vehicle_Modif_Data[i]:=Vehicle_Modif_DataV8[i];
     Insert(Chr(Ord(Vehicle_Modif_Data[i])), Vehicle_Modification, i);
   end;
//------(DumpMOT[360]);

// ProM  Front   km/h
   Form1.Edit462.Text:=FloatToStrF(DumpMOT[362]/20,ffFixed,4,1);

// ABS.CFG.SleepEnd R
   Form1.Edit463.Text:=FloatToStrF(DumpMOT[363]/10,ffFixed,4,1);
// ABS.CFG.SleepEnd F
   Form1.Edit464.Text:=FloatToStrF(DumpMOT[364]/10,ffFixed,4,1);

end;

procedure TForm1.TabSheet8Show(Sender: TObject);
Var TempInt:integer;
    TempStr:String ;
    DumpMOT32:byte;
begin
   if not Com_Connected_F and
      not CheckBox318.Checked  //Çàãðóçèòü CFG áåç ñâÿçè ñ áëîêîì
   then exit;
//çàïîëíåíèå íàñòðîåê
 //  if Tip_Block < 8 then
   begin
   Form1.View_SKU_CFG;
//   Form1.DSCConfigLoad;
   Fl_TabSheet8Show:=true;
   end;
end;

procedure TForm1.Label156DblClick(Sender: TObject);
begin
  Memo2.Visible:=true;
end;

procedure TForm1.ReadNumber;
begin
    ModelStr:=LoadATEPROMString(DiagIni.ReadInteger('Param','ModelStr',$400));
    ModelStr:=ModelStr+LoadATEPROMString(DiagIni.ReadInteger('Param','ModelStr',$400)+8);
    VehNum:=LoadATEPROMString(DiagIni.ReadInteger('Param','VehNum',$410));
    VehNum:=VehNum+LoadATEPROMString(DiagIni.ReadInteger('Param','VehNum',$410)+8);
    DateSet:=LoadATEPROMString(DiagIni.ReadInteger('Param','DateSet',$420));
    PlaceSet:=LoadATEPROMString(DiagIni.ReadInteger('Param','PlaceSet',$428));
    NumSS1:=LoadATEPROMString(DiagIni.ReadInteger('Param','NumSS1',$430));
    NumSS2:=LoadATEPROMString(DiagIni.ReadInteger('Param','NumSS2',$438));
    NumSS3:=LoadATEPROMString(DiagIni.ReadInteger('Param','NumSS3',$440));
    NumSS4:=LoadATEPROMString(DiagIni.ReadInteger('Param','NumSS4',$448));
    NumMD1:=LoadATEPROMString(DiagIni.ReadInteger('Param','NumMD1',$450));
    NumMD2:=LoadATEPROMString(DiagIni.ReadInteger('Param','NumMD2',$458));
    NumMD3:=LoadATEPROMString(DiagIni.ReadInteger('Param','NumMD3',$460));
    NumMD4:=LoadATEPROMString(DiagIni.ReadInteger('Param','NumMD4',$468));
    NumPK:=LoadATEPROMString(DiagIni.ReadInteger('Param','NumPK',$470));
    NumDIF:=LoadATEPROMString(DiagIni.ReadInteger('Param','NumDIF',$478));
end;

procedure TForm1.ViewCNT;
begin
   if Com_Connected_F then  begin
{
//DIF
    Label152.Caption:=IntToStr(DifCNT+
                DumpEPROM[ADRE('BADR_CNTDIF')+2]*65536 +
                DumpEPROM[ADRE('BADR_CNTDIF')+1]*256 +
                DumpEPROM[ADRE('BADR_CNTDIF')] ) +'  ñðàáàòûâàíèé';
//Mod1
    Label150.Caption:=IntToStr(Mod1CNT+
                DumpEPROM[ADRE('BADR_CNTM1')+2]*65536 +
                DumpEPROM[ADRE('BADR_CNTM1')+1]*256 +
                DumpEPROM[ADRE('BADR_CNTM1')] ) +'  ñðàáàòûâàíèé';
//Mod2
    Label151.Caption:=IntToStr(Mod2CNT+
                DumpEPROM[ADRE('BADR_CNTM2')+2]*65536 +
                DumpEPROM[ADRE('BADR_CNTM2')+1]*256 +
                DumpEPROM[ADRE('BADR_CNTM2')] ) +'  ñðàáàòûâàíèé';
//Mod3
    Label153.Caption:=IntToStr(Mod3CNT+
                DumpEPROM[ADRE('BADR_CNTM3')+2]*65536 +
                DumpEPROM[ADRE('BADR_CNTM3')+1]*256 +
                DumpEPROM[ADRE('BADR_CNTM3')] ) +'  ñðàáàòûâàíèé';
//Mod4
    Label154.Caption:=IntToStr(Mod4CNT+
                DumpEPROM[ADRE('BADR_CNTM4')+2]*65536 +
                DumpEPROM[ADRE('BADR_CNTM4')+1]*256 +
                DumpEPROM[ADRE('BADR_CNTM4')] ) +'  ñðàáàòûâàíèé'; }
  end else begin
  Label150.Caption:='êîë.ñðàáàòûâàíèé';
  Label151.Caption:='êîë.ñðàáàòûâàíèé';
  Label152.Caption:='êîë.ñðàáàòûâàíèé';
  Label153.Caption:='êîë.ñðàáàòûâàíèé';
  Label154.Caption:='êîë.ñðàáàòûâàíèé';
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
Var
   DateTime : TDateTime;
   Year, Month, Day : Word;
   Loop,N:Integer;
   NumBlock : AnsiString;
begin
 //    if not Set_Security then Exit;
     constnotfound:=false;
     ADRE_Lot_M_V8:= DiagIni.ReadInteger('NumBlock','NumLot',0);
     N:=DiagIni.ReadInteger('NumBlock','NumLast',1);
     NumBlock:=IntToStr(N);
     if not InputQuery('Èíèöèàëèçàöèÿ EEPROM áëîêà',
               'Ââåäèòå íîìåð áëîêà',NumBlock)
        then     exit;
     DateTime := Now;
     DecodeDate(DateTime, Year, Month, Day);
     Year := Year - 2000;
 //    InidataArray[ADRE('BADR_DATA') + 2] := Year;
 //    InidataArray[ADRE('BADR_DATA') + 1] := Month;
 //    InidataArray[ADRE('BADR_DATA')] := Day;
 //    InidataArray[ADRE('BADR_CODF')] := 1;

     if CheckBox50.Checked then begin
     ADRE_Y_M := Year;
     ADRE_M_M := Month;
     end;
     ADRE_NH :=Hi(StrToInt(NumBlock));
     ADRE_NL :=Lo(StrToInt(NumBlock));
     Change_NumBlock:=true;
     N:= StrToInt(NumBlock);
     N:=N+1;
     DiagIni.WriteInteger('NumBlock','NumLast',N);
     Form1.Button1Click(nil);

end;



procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
    if Key=#13 then
    begin
      EditNum:=Sender;
      Panel8.Visible := True;
      MotoGridOss.SetFocus;
    end;
end;

procedure TForm1.MotoGridOssKeyPress(Sender: TObject; var Key: Char);
begin
     if Key=#13 then begin
     (EditNum as TEdit).SetFocus;

     Panel8.Visible :=False;
     end;
end;


procedure TForm1.CheckBox37Click(Sender: TObject);
begin
  if not Com_Connected_F then  exit;
  FormIso.WriteWx_Presure;
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
  Form4.Visible:=True;
end;

function Set_Security:boolean;
Var     KeyTest : boolean;
begin
   if Tip_Block < 8  then
   begin
   Set_Security:=false;
   if not Com_Connected_F then  exit;
   FormIso.Write_Security;
   fl_Security_Com:=false;
   repeat Application.ProcessMessages until   fl_Security_Com;
   KeyTest:= false;
   if ((KeyByte1=nKeyIni1) and (KeyByte2=nKeyIni2) and (KeyByte3=nKeyIni3)) or
      ((KeyByte1=KeyIni1) and (KeyByte2=KeyIni2) and (KeyByte3=KeyIni3)) then KeyTest:= true;
   if not KeyTest then   begin
        MsgBox( 'Âåðñèÿ äèàãíîñòè÷åñêîé ïðîãðàììû íå ñîîòâåòñòâóåò âåðñèè áëîêà! Ôóíêöèÿ íå áóäåò âûïîëíåíà ',
            'Ïðåäóïðåæäåíèå', MB_OK+MB_ICONASTERISK+MB_APPLMODAL);
  //      exit;
        end;
   if not fl_Security  then   begin
        MsgBox( 'áëîê çàùèùåí ',
            'Ïðåäóïðåæäåíèå', MB_OK+MB_ICONASTERISK+MB_APPLMODAL);
  //      exit;
        end;
   Set_Security:=true;
   end
   else
   begin
   if not (((KeyByte1=KeyIni1) and (KeyByte2=70) and (KeyByte3=24)) or
           ((KeyByte1=KeyIni1v8) and (KeyByte2=KeyIni2v8) and (KeyByte3=KeyIni3v8)) or
           ((KeyByte1=KeyIni1v9) and (KeyByte2=KeyIni2v9) and (KeyByte3=KeyIni3v9)) or
           ((KeyByte1=KeyIni1v10) and (KeyByte2=KeyIni2v10) and (KeyByte3=KeyIni3v10))) then
   begin
     MsgBox( 'Âåðñèÿ äèàãíîñòè÷åñêîé ïðîãðàììû íå ñîîòâåòñòâóåò âåðñèè áëîêà! Ôóíêöèÿ íå áóäåò âûïîëíåíà ',
            'Ïðåäóïðåæäåíèå', MB_OK+MB_ICONASTERISK+MB_APPLMODAL);
     exit;
   end;
   Set_Security:=true;
   end;
end;

procedure TForm1.ComboBox6Change(Sender: TObject);
begin
   case ComboBox6.ItemIndex  of
   1:   begin
        Edit23.Text:=IntToStr(DiagIni.ReadInteger('Kpress1','K_Exhaust_Front',12));
        Edit24.Text:=IntToStr(DiagIni.ReadInteger('Kpress1','K_Inject_Front',7));
        end;
   2:   begin
        Edit23.Text:=IntToStr(DiagIni.ReadInteger('Kpress2','K_Exhaust_Front',16));
        Edit24.Text:=IntToStr(DiagIni.ReadInteger('Kpress2','K_Inject_Front',9));
        end;
   end;
   case ComboBox7.ItemIndex  of
   1:   begin
        Edit25.Text:=IntToStr(DiagIni.ReadInteger('Kpress1','K_Exhaust_Rear',10));
        Edit28.Text:=IntToStr(DiagIni.ReadInteger('Kpress1','K_Inject_Rear',5));
        end;
   2:   begin
        Edit25.Text:=IntToStr(DiagIni.ReadInteger('Kpress2','K_Exhaust_Rear',13));
        Edit28.Text:=IntToStr(DiagIni.ReadInteger('Kpress2','K_Inject_Rear',6));
        end;
   end;
end;

procedure TForm1.Button26Click(Sender: TObject);
begin

  Form6.Visible:=True;
  Form6.FormShow(nil);
end;

procedure TForm1.Button27Click(Sender: TObject);
Var     TestFile:File of Byte;
        sr: TSearchRec;
        FString:String;
begin
   if Tip_Block >=8 then CAN_Oss_TipBlock:=8;
   FString:=Opendialog1.InitialDir+'\TempCAN.road';
   if (FindFirst(FString, faAnyFile, sr) <> 0) then
    begin
        DataFileName :='';
        Graph.Button1Click(Sender);
    end else
    begin
        DataFileName :=FString;
    end;
     Graph.Visible:=True;
     fl_GetMem_CAN :=False;
end;

procedure TForm1.CANOsc_Read;
begin
     if Tip_Block >=8 then CAN_Oss_TipBlock:=8;
     if RoadTest_Flag then begin
        RoadTest_Flag:=False;
        Button28.Caption:='Start Test';
        Sleep(50);
        RoadTestBuf[0].TimerSynch:=StrToInt('2147483504'); //20 ëó÷åé
        BlockWrite(FF,RoadTestBuf,RoadTestInCount);
        CloseFile(FF);
        MainStatBar.Panels[0].Text := '×òåíèå CAN çàâåðøåíî.';
        MainStatBar.Refresh;
     end else begin
        DrawGrid(Form1.CANOssBox);
        OscStartPos;
        AssignFile(FF,Opendialog1.InitialDir+'\TempCAN.road');
        Rewrite(FF);
        RoadTestInCount:=0;
        FreeMem(PCan);
        if Tip_Block < 8 then
                FormISO.DownLoadCANAddress
        else    Edit100.Text:='7';

        MainStatBar.Panels[0].Text := 'Èäåò ÷òåíèå CAN';
        MainStatBar.Refresh;
        Button28.Caption:='Stop Test';
        QueryPerformanceCounter(StartTimer_Value);
        QueryPerformanceFrequency(TimerFreq_Value);
        RoadTest_Flag:=True;
     end;

end;
procedure TForm1.Button28Click(Sender: TObject);
begin
//  NumberOsc:=NumberOsc_Old16;
  if Com_Connected_F then Form1.CANOsc_Read
  else Form1.CANUSB_Read;
 {    if not Com_Connected_F then Exit;
     CAN_Oss_TipBlock:=8;
     if RoadTest_Flag then begin
        RoadTest_Flag:=False;
        Button28.Caption:='Start Test';
        Sleep(50);
        RoadTestBuf[0].TimerSynch:=StrToInt('2147483504'); //20 ëó÷åé
        BlockWrite(FF,RoadTestBuf,RoadTestInCount);
        CloseFile(FF);
        MainStatBar.Panels[0].Text := '×òåíèå CAN çàâåðøåíî.';
        MainStatBar.Refresh;
     end else begin
        DrawGrid(Form1.CANOssBox);
        OscStartPos;
        AssignFile(FF,Opendialog1.InitialDir+'\TempCAN.road');
        Rewrite(FF);
        RoadTestInCount:=0;
        FreeMem(PCan);
        if Tip_Block < 8 then
                FormISO.DownLoadCANAddress
        else    Edit100.Text:='7';

        MainStatBar.Panels[0].Text := 'Èäåò ÷òåíèå CAN';
        MainStatBar.Refresh;
        Button28.Caption:='Stop Test';
        QueryPerformanceCounter(StartTimer_Value);
        QueryPerformanceFrequency(TimerFreq_Value);
        RoadTest_Flag:=True;
     end;  }
end;

procedure TForm1.CANUSB_Read;
begin
     Tip_Block:=8;
     Form1.CANOsc_Read;
     RoadTestInCount:=0;
  if CAN_USB_Open then
  begin
    while RoadTest_Flag do
    begin
       FormISO.Command_CANUSB($200B);
       repeat Application.ProcessMessages until Cmd_CANUSB_Ask;
       if not CANUSB_Error then
       begin
        QueryPerformanceCounter(StopTimer_Value);
        CurrentRoadTimer:=Round(1000*(StopTimer_Value-StartTimer_Value)/TimerFreq_Value);
        Buf.TimerSynch:=CurrentRoadTimer;
        RoadTestBuf[RoadTestInCount]:=Buf;
        Inc(RoadTestInCount);
       end
       else RoadTest_Flag:=False;
    end;

  end;


end;

procedure TForm1.CANOsc;
Var Loop,Xpoz,Ypoz:Integer;
begin
     if not SinxrRoadTest then exit;
     if RoadTestInCount >300000 then begin
                                     Form1.Button28Click(nil);
                                     exit;
                                     end;
     Inc(OscPos);
     Xpoz:= OscPos;
     if  Xpoz< CANOssBox.Width then
     For Loop:=1 to 12 do
     begin
        Ypoz:= Buf.Osc[Loop-1];
        CANOssBox.Canvas.Pen.Color:=OscArray[Loop].Color;
        CANOssBox.Canvas.MoveTo(OscArray[Loop].PreviousXPosition,
        CANOssBox.Height-OscArray[Loop].PreviousYPosition-1);
        CANOssBox.Canvas.LineTo(Xpoz,CANOssBox.Height-Ypoz-1);
        OscArray[Loop].PreviousYPosition:=Ypoz;
        OscArray[Loop].PreviousXPosition:=Xpoz;
     end
     else
     begin
           DrawGrid(Form1.CANOssBox);
       //    OscStartPos;
           OscPos:=1;
           for Loop:=1 to 12 do OscArray[Loop].PreviousXPosition:=0;
     end;
     SinxrRoadTest:=false;
end;

procedure TForm1.Button29Click(Sender: TObject);
begin
  if Opendialog1.Execute {and  FileExists(Opendialog1.FileName)}
     then begin
     AssignFile(FF,OpenDialog1.FileName);
     Rewrite(FF);
     RoadTestBuf[0].TimerSynch:=StrToInt('2147483504'); //20 ëó÷åé
     BlockWrite(FF,RoadTestBuf,RoadTestInCount);
     CloseFile(FF);
     Opendialog1.InitialDir:=ExtractFilePath(OpenDialog1.FileName);
     end;
end;

procedure TForm1.Button17Click(Sender: TObject);
Var RomFile:TextFile;
    TestString,DataString:String;
    ByteCounter:Byte;
    Loop,Adr,Adress,Sum:Integer;
    hexstr : string;
    Adress_Start,Adress_End:Integer;
begin
   Adress_Start:=$ff00;
   Adress_End:=$ff80;

    Fl_FlashLoad := False;
   Form2.Caption:='×òåíèå EEPROM';
   Form2.Label1.Caption:='Èäåò ÷òåíèå EEPROM';
   Form2.Label2.Caption:='Ïîæàëóéñòà ïîäîæäèòå';
   Form2.ProgressBar1.Position:=0;
   Form2.Visible:=True; 
   DumpFlashLoad(Adress_Start,Adress_End);
   repeat Application.ProcessMessages until Fl_FlashLoad;
   Form2.Visible:=False;

    hexstr := '0123456789ABCDEF';
        TestString:=ExtractFilePath(Const_File)+'gz32_Monitor.s19';
        AssignFile(RomFile,TestString);
        ReWrite(RomFile);
        Adr:=Adress_Start;
        ByteCounter:=16;
        Adress:=0;
    repeat
        DataString:='';
        Sum:=0;
        for Loop := 1 to 16 do  begin
                DataString:= DataString+
                                hexstr[(DumpFlash[Adr-Adress_Start+Loop-1] div 16)+1]+
                                hexstr[(DumpFlash[Adr-Adress_Start+Loop-1] mod 16)+1];
                Sum:=Sum+ DumpFlash[Adr-Adress_Start+Loop-1];
        end;
        Sum:=255-((Sum+(Adr div 256)+(Adr mod 256)+(ByteCounter+3)) mod 256);
        TestString:='S1'+hexstr[((ByteCounter+3) div 16)+1]+hexstr[((ByteCounter+3) mod 16)+1]+
                         hexstr[((Adr div 256) div 16)+1]+hexstr[((Adr div 256) mod 16)+1]+
                         hexstr[((Adr mod 256) div 16)+1]+hexstr[((Adr mod 256) mod 16)+1]+
                         DataString+
                         hexstr[(Sum div 16)+1]+hexstr[(Sum mod 16)+1];
        WriteLn(RomFile,TestString);
        Adr:=Adr+ByteCounter;
     until Adr > Adress_End;
        TestString:='S9030000FC';
        WriteLn(RomFile,TestString);
        CloseFile(RomFile);
end;


procedure TForm1.Button30Click(Sender: TObject);
begin
//        if fl_PWM_Prop  then begin
        if Button30.Caption = 'On'  then begin
                                   Cnt_Test_PWM:=0;
                                   fl_PWM_Prop := false;
                                   Button30.Caption := 'Off';
                                   fl_PWM_Direct := false;
                                   TrackBar1.Position:=0;
                                        Sleep(50);
                                        RoadTestBuf[0].TimerSynch:=StrToInt('2147483504'); //20 ëó÷åé
                                        BlockWrite(FF,RoadTestBuf,RoadTestInCount);
                                        CloseFile(FF);
                                   end
                                   else  begin
                                   FormISO.DownLoadOscAddress;
                                   Cnt_Test_PWM:=0;
                                   Button30.Caption := 'On';
                                   fl_PWM_Direct := false;
                                   TrackBar1.Position:=0;
                                        AssignFile(FF,Opendialog1.InitialDir+'\Temp.road');
                                        Rewrite(FF);
                                        RoadTestInCount:=0;
                                        QueryPerformanceCounter(StartTimer_Value);
                                        QueryPerformanceFrequency(TimerFreq_Value);
                                   fl_PWM_Prop := true;
                                   end;
        TrackBar1Change(Sender);
        PWM:=Round(TrackBar1.Position*2.55);
end;

procedure TForm1.Button31Click(Sender: TObject);
begin
{     if not Com_Connected_F then Exit;
     RoadTest_Flag:=False;
     if not PWM_Emul_Flag then begin PWM_Emul_Flag:=true;
     FormISO.DownLoadOscAddress;
     MainStatBar.Panels[0].Text := 'Ýìóëÿöèÿ PWM èñïûòàíèé.';
     MainStatBar.Refresh;
     EmulCount:=0;
     end
     else
     begin PWM_Emul_Flag:=False;
     FormISO.DownLoadOscAddress;
     MainStatBar.Panels[0].Text := 'Ýìóëÿöèÿ PWM èñïûòàíèé ïðåðâàíà.';
     MainStatBar.Refresh;
     PWM:=0;
     FormISO.PWM_Send;
     end; }

     if Com_Connected_F then Exit;
     RoadTest_Flag:=False;
     RoadEmul_Flag:=False;
     PWM_Emul_Flag:=False;
  //   FormISO.DownLoadOscAddress;
     //
       MainStatBar.Panels[0].Text := '';
       Edit374.Text:=IntToStr(UpGrade_ComNum);
       Com2_Init;
       TruckSim_ComBaudrate:=460800;
       Edit379.Text:=IntToStr(TruckSim_ComBaudrate);
       Com_Baudrate(TruckSim_ComBaudrate);
       if Fl_ComCreate then  TruckSim_USB_Open:=true
       else
       begin
         MainStatBar.Panels[0].Text := 'Com'+Edit374.Text+' not Open';
         TruckSim_USB_Open:=false;
         exit;
       end;
     MainStatBar.Panels[0].Text := 'Ýìóëÿöèÿ äîðîæíûõ èñïûòàíèé Truck Sim.';
     MainStatBar.Refresh;
     
     EmulCount:=0;
     SinxrEmul:=false;
     TruckSim_Flag:=True;
     repeat
     Form1.RoadTestEmul;
     FormISO.Emul_TruckSim;
 {    repeat Application.ProcessMessages until Cmd_CANUSB_Ask;
         if not CANUSB_Error then
         begin

         end; }
    until not TruckSim_Flag;
    EmulCount:=0;
end;

procedure TForm1.PWMTestEmul;
var
   Temp1: integer;
begin
        SinxrEmul:=false;
  {      PWM:= RoadTestBuf[EmulCount].Osc[11];
        if CheckBox1.Checked then RoadTestBuf[EmulCount].Osc[2]:=OscData[1];
        RoadTestBuf[EmulCount].Osc[5]:=OscData[2];//round(OscData[2]*0.77 +15);
        RoadTestBuf[EmulCount].Osc[8]:=OscData[3];
  }
        PWM:= RoadTestBuf[EmulCount].Osc[2];
   //     if CheckBox1.Checked then RoadTestBuf[EmulCount].Osc[2]:=OscData[1];
        RoadTestBuf[EmulCount].Osc[5]:=OscData[1];
        RoadTestBuf[EmulCount].Osc[8]:=OscData[2];
        RoadTestBuf[EmulCount].Osc[11]:=OscData[3];
        inc(EmulCount);
        if EmulCount > Trunc(RoadTestInCount) then begin
             PWM_Emul_Flag:=False;
             StartRT_View;
             MainStatBar.Panels[0].Text := 'Ýìóëÿöèÿ PWM èñïûòàíèé çàâåðøåíà.';
             MainStatBar.Refresh;
             end;
end;




//procedure ProgPit;
///begin
//end;

procedure TForm1.Button33Click(Sender: TObject);
begin
        if  Form1.Button33.Caption='ASR' then
          begin
            Form1.Button33.Caption:='ABS';
            Form1.Button33.Refresh;
            ABS_Poly:=True;
            end else
            begin
            Form1.Button33.Caption:='ASR';
            Form1.Button33.Refresh;
            ABS_Poly:=False;
            end

end;



procedure TForm1.Button35Click(Sender: TObject);
begin
        OpenDialog1.FileName:=Prog_File;
        Opendialog1.InitialDir:=ExtractFilePath(Prog_File);
        OpenDialog1.Filter:='s19|*.s19';
        Opendialog1.Execute;
        Prog_File:=Opendialog1.FileName;
        If Prog_File<>'' then  begin
        DiagIni.WriteString('Ôàèë ïðîãðàììèðîâàíèÿ','s19_File',Prog_File);
        Label134.Caption:=Prog_File;
        end;
end;

procedure TForm1.ProgPit;
//Var Loop,Adr:Integer;
//    DatM:byte;
begin
       { EscapeCommFunction(hCOM, SETBREAK);
        sleep(1);
        EscapeCommFunction(hCOM, CLRBREAK);
        PurgeComm(hCOM, PURGE_TXABORT or PURGE_RXABORT or PURGE_TXCLEAR or PURGE_RXCLEAR); }
    //    EscapeCommFunction(hCOM, SETRTS);
        EscapeCommFunction(hCOM, SETDTR);
        EscapeCommFunction(hCOM, SETRTS);
        sleep(100);
        EscapeCommFunction(hCOM, CLRDTR);
        sleep(1);
        EscapeCommFunction(hCOM, CLRRTS);
        ReadFile(hCOM,ComBufIn,1,Bytes,nil);
        sleep(10);
end;


procedure TForm1.hk(Sender: TObject; var Key: Word; Shift: TShiftState);
Var    TestString:String;
begin
      hhKey:= Key;
      if Key = 115 then ProgStartClick(Sender);
end;


procedure TForm1.Timer2Timer(Sender: TObject);
begin

      if (FormStend.RadioGroup1.ItemIndex=-1) then begin
      FormStend.label67.Font.Color:=ClRed;
      Stend_Blok_SEl:=false;
      end
      else
      begin
       if not Stend_Blok_SEl then
       begin
        FormStend.label67.Font.Color:=clWindowText;
        FormStend.label67.Visible:=false;
        FormStend.label67.Repaint;
        Stend_Blok_SEl:=True;
       end;
      end;
      FormStend.StendStep;

      if Fl_MOD_test_ON or
         Fl_PnevmoTest_ON or
         Fl_XBR_ON or
         Fl_HillHolder_ON or
         Fl_HaltBrake_ON then
      begin
        Fl_MOD_test_ON:= false;
        Fl_PnevmoTest_ON:= false;
        Fl_HillHolder_ON:= false;
        Fl_HaltBrake_ON:= false;
        Fl_XBR_ON:= false;
        Form1.Timer2.Enabled:= false;
        Form1.Timer2.Interval:=2000;
        Form1.DSC_TestEnd;
      end;
end;

procedure TForm1.Button39Click(Sender: TObject);
Var ConfigFile:TextFile;
    TestString:String;
    TempInt,Loop:Integer;
begin
      if OpenDlg_Path <>''
      then Opendialog1.InitialDir:= OpenDlg_Path
      else Opendialog1.InitialDir:=IniPath;

      Opendialog1.Filter:='asm|*.asm';
      if Opendialog1.Execute and  FileExists(Opendialog1.FileName) then
      begin
        Config_File:=Opendialog1.FileName;
        OpenDlg_Path:=ExtractFilePath(Config_File);
        AssignFile(ConfigFile,Config_File);
        Reset(ConfigFile);
        // êîïèðîâàíèå DumpMOT  DumpMOTcopy
        DumpMOT_to_DumpMOTcopy;
        for Loop:=0 to SizeDumpMOT do
        begin
           ReadLn(ConfigFile,TestString);
           DumpMOT[Loop]:=StrToInt(TestString);
        end;
        CloseFile(ConfigFile);
        TabSheet8Show(nil);
      end;
end;

procedure TForm1.Button4Click(Sender: TObject);
Var ConfigFile:TextFile;
    TestString:String;
    Loop:Integer;
begin
     if MsgBox('Óâåðåíû â èçìåíåíèè ôàéëà íàñòðîåê?',
         'Ïðåäóïðåæäåíèå', MB_OKCANCEL	+MB_ICONASTERISK +MB_APPLMODAL)
          = IDCANCEL	 then Exit;
     if SaveDlg_Path <>''
     then Savedialog1.InitialDir:= SaveDlg_Path
     else Savedialog1.InitialDir:=IniPath;
     SaveDialog1.Filter:='asm|*.asm';
     if SaveDialog1.Execute and
        FileExists(SaveDialog1.FileName) then
     begin
        Form1.Dump_SKU_CFG; //çàïîëíåíèå Dump èç ôîðìû
        Config_File:=SaveDialog1.FileName;
        SaveDlg_Path:=ExtractFilePath(Config_File);
        AssignFile(ConfigFile,Config_File);
        ReWrite(ConfigFile);
        for Loop:=0 to SizeDumpMOT do
        begin
            TestString:=IntToStr(DumpMOT[Loop]);
            WriteLn(ConfigFile,TestString);
        end;
        CloseFile(ConfigFile);
    end;

end;

procedure TForm1.TestButtonClick(Sender: TObject);
Var
    TestString:String;
    ByteCounter1,Adr1,Sme,AdrM,Loop,ProgressBarCnt:Integer;
begin
        if Fl_TestStart then begin
           TestButton.Down:=false;
            Fl_TestStart:=false;
            Com_Close;
            sleep(1000);
        end else begin
            Fl_TestStart:=True;
            TestButton.Down:=true;
            Memo3.Visible:= true;
            Memo3.Clear;
            Memo3.Refresh;
            Port_Num := 8;
            Com_Init;
            Com_Baudrate(38400);
            for Loop:=1 to 255 do TestComBuf[Loop]:=$55;

            WriteFile(hCOM,TestComBuf,255,Bytes,nil);
            ReadFile(hCOM,ComBufIn,255,Bytes,nil);
            for Loop:=1 to 255 do
            begin
              Memo3.SelText:=IntToStr(ComBufIn[Loop]);
              Memo3.Lines.Add('');
            end;
            sleep(1000);
        end; 
end;


procedure TForm1.CheckBox22Click(Sender: TObject);
begin
        if RoadTestInCount<>0 then  DrawRoadTest(ScrollBar1.Position);
end;

procedure TForm1.Label263Click(Sender: TObject);
begin
        if  NumberOsc = NumberOsc_Old then begin
            CheckBox90.Visible:=false;
            CheckBox91.Visible:=false;
            CheckBox92.Visible:=false;
            CheckBox93.Visible:=false;
            CheckBox96.Visible:=false;
            CheckBox97.Visible:=false;
            CheckBox98.Visible:=false;
            CheckBox99.Visible:=false;
            Form1.Label263.Caption:='Old road File';
        end else begin
        if  NumberOsc = NumberOsc_Old16 then begin
            CheckBox90.Visible:=true;
            CheckBox91.Visible:=true;
            CheckBox92.Visible:=true;
            CheckBox93.Visible:=true;
            CheckBox96.Visible:=false;
            CheckBox97.Visible:=false;
            CheckBox98.Visible:=false;
            CheckBox99.Visible:=false;
            Form1.Label263.Caption:='Old16 road File';
        end else begin
            CheckBox90.Visible:=true;
            CheckBox91.Visible:=true;
            CheckBox92.Visible:=true;
            CheckBox93.Visible:=true;
            CheckBox96.Visible:=true;
            CheckBox97.Visible:=true;
            CheckBox98.Visible:=true;
            CheckBox99.Visible:=true;
            Form1.Label263.Caption:='New road File';
           end;
        end;
end;

procedure TForm1.Button40Click(Sender: TObject);
begin
    TestDSC.Show;
end;


procedure TForm1.LampVDCClick(Sender: TObject);
Var LColor, SColor, EColor, HColor :byte;
    LImage, SImage, EImage, HImage : TBitmap;
begin
        if Not(Com_Connected_F) then Exit;
        // VDC_TestLamp
        if (Sender as TSpeedButton).Name='LampVDC' then
        begin
        LImage:= TBitmap.Create;
        if  Fl_VDC_TestLamp then  begin
          //  Label246.Caption := 'OFF';
            DSCPulsPress_Com:=18;
            Fl_VDC_TestLamp := false;
            LColor:=0;
            LampVDC.Down := false;
        end
        else begin
         //   Label246.Caption := 'ON';
            DSCPulsPress_Com:=17;
            Fl_VDC_TestLamp := true;
            LColor:=3;
        end;
       Form1.IL1.GetBitmap(LColor, LImage);
       LampVDC.Glyph.Assign(LImage);
       LampVDC.Refresh;
       LImage.Free;
       end;
       // StopLight
       if (Sender as TSpeedButton).Name='StopLight' then
       begin
        SImage:= TBitmap.Create; //
        if  Fl_VDC_StopLight then  begin
            Label541.Caption := 'OFF';
            DSCPulsPress_Com:=15;
            Fl_VDC_StopLight := false;
            SColor:=0;
            StopLight.Down := false;
        end
        else begin
            Label541.Caption := 'ON';
            DSCPulsPress_Com:=53;
            Fl_VDC_StopLight := true;
            SColor:=1;
        end;
       Form1.IL1.GetBitmap(SColor, SImage);
       StopLight.Glyph.Assign(SImage);
       StopLight.Refresh;
       SImage.Free;
       end;
       // Emergency
       if (Sender as TSpeedButton).Name='Emergency' then
       begin
        EImage:= TBitmap.Create; //
        if  Fl_VDC_Emergency then  begin
            Label599.Caption := 'OFF';
            DSCPulsPress_Com:=15;
            Fl_VDC_Emergency := false;
            EColor:=0;
            Emergency.Down := false;
        end
        else begin
            Label599.Caption := 'ON';
            DSCPulsPress_Com:=54;
            Fl_VDC_Emergency := true;
            EColor:=3;
        end;
       Form1.IL1.GetBitmap(EColor, EImage);
       Emergency.Glyph.Assign(EImage);
       Emergency.Refresh;
       EImage.Free;
       end;

       // HaltBrake
       if (Sender as TSpeedButton).Name='HaltBrake' then
       begin
        HImage:= TBitmap.Create; //
        if  Fl_VDC_HaltBrake then  begin
            Label614.Caption := 'OFF';
            DSCPulsPress_Com:=15;
            Fl_VDC_HaltBrake := false;
            HColor:=0;
            HaltBrake.Down := false;
        end
        else begin
            Label614.Caption := 'ON';
            DSCPulsPress_Com:=13;
            Fl_VDC_HaltBrake := true;
            HColor:=3;
        end;
       Form1.IL1.GetBitmap(HColor, HImage);
       HaltBrake.Glyph.Assign(HImage);
       HaltBrake.Refresh;
       HImage.Free;
       end;
       FormISO.DSC_PulsPress;
end;

procedure TForm1.VDC_Test_Reset;
begin
            DSCPulsPress_Com:=15;
            TestDSC.TrackBar2.Position:=0;
            WriteTrailerPress(TestDSC.TrackBar2.Position);
            Fl_Engine_Brake:= false;
            Fl_Engine_Drag:= false;
            Fl_Engine:= false;
            Fl_Retarder_Brake:= false;
            Fl_Retarder_Off:= false;
            Fl_Retarder:= false;
            Fl_DifXX:= false;
            Fl_DifFront_ON:= false;
            Fl_DifRear_ON:= false;
            Fl_DifTrailer_ON:= false;

            Fl_Prop_On:= false;
            Fl_Prop:= false;
            TestDSC.Prop.Caption := 'Âêëþ÷åí';
            TestDSC.GroupBox14.Color :=clBtnFace;

            Form1.Label408.Color :=clBtnFace;
            Form1.Button53.Caption := 'Âûêëþ÷åí';
            Form1.Label409.Color :=clBtnFace;
            Form1.Button52.Caption := 'Âûêëþ÷åí';
            Form1.Label410.Color :=clBtnFace;
            Form1.Button59.Caption := 'Âûêëþ÷åí';
            Fl_MOD_test_ON:= false;
            Fl_XBR_ON:= false;
            Fl_HaltBrake_ON:= false;
            Fl_HillHolder_ON:= false;
            Fl_PnevmoTest_ON:= false;
            Fl_BreakFront_ON:= false;
            Fl_BreakRear_ON:= false;
            Fl_BrakeFront_Only:= false;
            Fl_BrakeRear_Only:= false;
end;

procedure TForm1.DSC_TestEnd;
begin
// Test Dif_Valve Caption
         if Fl_DifFront_ON then
         begin
             TestDSC.GroupBox5.Color :=clAqua;
             TestDSC.Button11.Caption := 'Âêëþ÷åí';
         end
         else
         begin
             TestDSC.GroupBox5.Color :=clBtnFace;
             TestDSC.Button11.Caption := 'Âûêëþ÷åí';
 //            Form1.Label408.Color :=clBtnFace;
 //            Form1.Button53.Caption := 'Âûêëþ÷åí';
         end;
         if Fl_DifRear_ON then
         begin
             TestDSC.GroupBox6.Color :=clAqua;
             TestDSC.Button12.Caption := 'Âêëþ÷åí';
         end
         else
         begin
             TestDSC.GroupBox6.Color :=clBtnFace;
             TestDSC.Button12.Caption := 'Âûêëþ÷åí';
 //            Form1.Label409.Color :=clBtnFace;
 //            Form1.Button52.Caption := 'Âûêëþ÷åí';
         end;
         if Fl_DifTrailer_ON then
         begin
             TestDSC.GroupBox7.Color :=clAqua;
             TestDSC.Button13.Caption := 'Âêëþ÷åí';
         end
         else
         begin
             TestDSC.GroupBox7.Color :=clBtnFace;
             TestDSC.Button13.Caption := 'Âûêëþ÷åí';
  //           Form1.Label410.Color :=clBtnFace;
  //           Form1.Button59.Caption := 'Âûêëþ÷åí';
         end;

// Engine Caption
         if Fl_Engine_Brake then
         begin
             TestDSC.GroupBox67.Color :=clAqua;
             Form1.Button49.Caption := 'Âêëþ÷åíî';
             TestDSC.Button7.Caption := 'Âêëþ÷åíî';
         end
         else
         begin
             TestDSC.GroupBox67.Color :=clBtnFace;
             Form1.Button49.Caption := 'Âûêëþ÷åíî';
             TestDSC.Button7.Caption := 'Âûêëþ÷åíî';
        end;
        if Fl_Engine_Drag then
        begin
             TestDSC.GroupBox68.Color :=clAqua;
             Form1.Button42.Caption := 'Âêëþ÷åíî';
             TestDSC.Button8.Caption := 'Âêëþ÷åíî';
        end
        else
        begin
             TestDSC.GroupBox68.Color :=clBtnFace;
             Form1.Button42.Caption := 'Âûêëþ÷åíî';
             TestDSC.Button8.Caption := 'Âûêëþ÷åíî';
        end;
        if Fl_MOD_test_ON then
        begin
             TestDSC.GroupBox8.Color :=clAqua;
             TestDSC.Button14.Caption := 'Âêëþ÷åí';
        end
        else
        begin
             TestDSC.GroupBox8.Color :=clBtnFace;
             TestDSC.Button14.Caption := 'Âûêëþ÷åí';
        end;
        if Fl_PnevmoTest_ON then
        begin
             TestDSC.GroupBox9.Color :=clAqua;
             TestDSC.Button15.Caption := 'Âêëþ÷åí';
        end
        else
        begin
             TestDSC.GroupBox9.Color :=clBtnFace;
             TestDSC.Button15.Caption := 'Âûêëþ÷åí';
        end;
        if Fl_BreakFront_ON then
        begin
             TestDSC.GroupBox10.Color :=clRed;
             TestDSC.Button16.Caption := 'Âêëþ÷åí';
        end
        else
        begin
             TestDSC.GroupBox10.Color :=clBtnFace;
             TestDSC.Button16.Caption := 'Âûêëþ÷åí';
        end;
        if Fl_BreakRear_ON then
        begin
             TestDSC.GroupBox11.Color :=clRed;
             TestDSC.Button17.Caption := 'Âêëþ÷åí';
        end
        else
        begin
             TestDSC.GroupBox11.Color :=clBtnFace;
             TestDSC.Button17.Caption := 'Âûêëþ÷åí';
        end;
        if Fl_HillHolder_ON then
        begin
             TestDSC.GroupBox12.Color :=clAqua;
             TestDSC.Button18.Caption := 'Âêëþ÷åí';
        end
        else
        begin
             TestDSC.GroupBox12.Color :=clBtnFace;
             TestDSC.Button18.Caption := 'Âûêëþ÷åí';
        end;
        if Fl_HaltBrake_ON then
        begin
             TestDSC.GroupBox13.Color :=clAqua;
             TestDSC.Button19.Caption := 'Âêëþ÷åí';
        end
        else
        begin
             TestDSC.GroupBox13.Color :=clBtnFace;
             TestDSC.Button19.Caption := 'Âûêëþ÷åí';
        end;

        if Fl_XBR_ON then
        begin
             TestDSC.grp1.Color :=clAqua;
             TestDSC.ButtonXBR.Caption := 'Âêëþ÷åí';
        end
        else
        begin
             TestDSC.grp1.Color :=clBtnFace;
             TestDSC.ButtonXBR.Caption := 'Âûêëþ÷åí';
        end;
//Retarder Caption
        if Fl_Retarder_Brake then
        begin
             TestDSC.GroupBox71.Color :=clAqua;
             TestDSC.Button9.Caption := 'Âêëþ÷åíî';
        end
        else
        begin
             TestDSC.GroupBox71.Color :=clBtnFace;
             TestDSC.Button9.Caption := 'Âûêëþ÷åíî';
        end;
        if Fl_Retarder_Off then
        begin
             TestDSC.GroupBox70.Color :=clAqua;
             TestDSC.Button10.Caption := 'Âêëþ÷åíî';
        end
        else
        begin
             TestDSC.GroupBox70.Color :=clBtnFace;
             TestDSC.Button10.Caption := 'Âûêëþ÷åíî';
        end;
        if Fl_Prop_On then
        begin
             TestDSC.GroupBox14.Color :=clAqua;
             TestDSC.Prop.Caption := 'Âêëþ÷åí';
        end
        else
        begin
             TestDSC.GroupBox14.Color :=clBtnFace;
             TestDSC.Prop.Caption := 'Âûêëþ÷åí';
        end;

        if Fl_BrakeFront_Only then
        begin
             TestDSC.GroupBox15.Color :=clRed;
             TestDSC.btn1.Caption := 'Âêëþ÷åí';
        end
        else
        begin
             TestDSC.GroupBox15.Color :=clBtnFace;
             TestDSC.btn1.Caption := 'Âûêëþ÷åí';
        end;

        if Fl_BrakeRear_Only then
        begin
             TestDSC.GroupBox16.Color :=clRed;
             TestDSC.btn2.Caption := 'Âêëþ÷åí';
        end
        else
        begin
             TestDSC.GroupBox16.Color :=clBtnFace;
             TestDSC.btn2.Caption := 'Âûêëþ÷åí';
        end;

//Test Dif_Valve DSCPulsPress_Com
        if DSCPulsPress_Com =0 then
        begin  // íå áûëî êîìàíä Puls
          if Fl_DifFront_ON then DSCPulsPress_Com:=61
          else
          if Fl_DifRear_ON  then DSCPulsPress_Com:=62
          else
          if Fl_DifTrailer_ON  then DSCPulsPress_Com:=63
          else
          if Fl_DifXX then
          begin
             DSCPulsPress_Com:=65;
             Fl_DifXX:= false;
          end;
//Engine DSCPulsPress_Com
          if Fl_Engine_Brake then DSCPulsPress_Com:=41
          else
          if Fl_Engine_Drag then DSCPulsPress_Com:=42
          else
          if Fl_Engine then
          begin
             DSCPulsPress_Com:=45;
             Fl_Engine:= false;
          end;
//Retarder DSCPulsPress_Com
          if Fl_Retarder_Brake then DSCPulsPress_Com:=51
          else
          if Fl_Retarder_Off then DSCPulsPress_Com:=52
          else
          if Fl_Retarder then
          begin
             DSCPulsPress_Com:=55;
             Fl_Retarder:= false;
          end
          else
          if Fl_Prop_On then DSCPulsPress_Com:=64
          else
          begin
            if Fl_Prop then
            begin
               Fl_Prop:=false;
               TestDSC.TrackBar2.Position:=0;
               DSCPulsPress_Com:=65;
            end;
          end;

          if Fl_MOD_test_ON then DSCPulsPress_Com:=8;
          if Fl_PnevmoTest_ON  then DSCPulsPress_Com:=9;
          if Fl_BreakFront_ON then DSCPulsPress_Com:=10;
          if Fl_BreakRear_ON then DSCPulsPress_Com:=11;
          if Fl_HillHolder_ON then DSCPulsPress_Com:=12;
          if Fl_HaltBrake_ON then DSCPulsPress_Com:=13;
          if Fl_XBR_ON then DSCPulsPress_Com:=14;
          if Fl_BrakeFront_Only then DSCPulsPress_Com:=19;
          if Fl_BrakeRear_Only then DSCPulsPress_Com:=20;

          if clrFl_Brake_Only then
          begin
               clrFl_Brake_Only:= false;
               DSCPulsPress_Com:=21;
          end;
          if clrFl_BreakFront_ON then
          begin
               clrFl_BreakFront_ON:= false;
               DSCPulsPress_Com:=15;
          end;
          if clrFl_BreakRear_ON then
          begin
               clrFl_BreakRear_ON:= false;
               DSCPulsPress_Com:=15;
          end;
          if clrFl_HaltBrake_ON then
          begin
               clrFl_HaltBrake_ON:= false;
               DSCPulsPress_Com:=15;
          end;
          if clrFl_XBR_ON then
          begin
               clrFl_XBR_ON:= false;
               DSCPulsPress_Com:=15;
          end;
         end;

        FormISO.DSC_PulsPress;
end;

procedure TForm1.TestPulsClick(Sender: TObject);
begin
        if Not(Com_Connected_F) then Exit;
        if (Sender as TButton).Name='Button43' then DSCPulsPress_Com:=1;
        if (Sender as TButton).Name='Button44' then DSCPulsPress_Com:=2;
        if (Sender as TButton).Name='Button45' then DSCPulsPress_Com:=3;
        if (Sender as TButton).Name='Button46' then DSCPulsPress_Com:=4;
        if (Sender as TButton).Name='Button50' then DSCPulsPress_Com:=7; //All
        if (Sender as TButton).Name='Button51' then Form1.VDC_Test_Reset; //Reset
        // Test   Dif_Valve
        // Ïåðåäíèé
        if ((Sender as TButton).Name='Button53')
            and not Fl_DifFront_ON then
        begin
           if Form1.Button53.Caption = 'Âûêëþ÷åí' then
           begin
             Form1.Label408.Color :=clAqua;
             Form1.Button53.Caption := 'Âêëþ÷åí';
             DSCPulsPress_Com:=61;
           end
           else
           begin
             Form1.Label408.Color :=clBtnFace;
             Form1.Button53.Caption := 'Âûêëþ÷åí';
             DSCPulsPress_Com:=65;
           end;
        end;
        // Çàäíèé
        if ((Sender as TButton).Name='Button52')
            and not Fl_DifRear_ON then
        begin
           if Form1.Button52.Caption = 'Âûêëþ÷åí' then
           begin
             Form1.Label409.Color :=clAqua;
             Form1.Button52.Caption := 'Âêëþ÷åí';
             DSCPulsPress_Com:=62;
           end
           else
           begin
             Form1.Label409.Color :=clBtnFace;
             Form1.Button52.Caption := 'Âûêëþ÷åí';
             DSCPulsPress_Com:=65;
           end;
        end;
        // Ïðèöåï
        if ((Sender as TButton).Name='Button59')
            and not Fl_DifTrailer_ON then
        begin
           if Form1.Button59.Caption = 'Âûêëþ÷åí' then
           begin
             Form1.Label410.Color :=clAqua;
             Form1.Button59.Caption := 'Âêëþ÷åí';
             DSCPulsPress_Com:=63;
           end
           else
           begin
             Form1.Label410.Color :=clBtnFace;
             Form1.Button59.Caption := 'Âûêëþ÷åí';
             DSCPulsPress_Com:=65;
           end;
        end;
        // Óïðàâëåíèå äâèãàòåëåì îãðàíè÷åíèå ìîìåíòà
        if (Sender as TButton).Name='Button49' then
        begin
         Fl_Engine_Drag:= false;
         if Fl_Engine_Brake then Fl_Engine_Brake:= false
                            else begin
                                 Fl_Engine_Brake:= true;
                                 Fl_Engine:= true;
                                 end;
        end;
        // Óïðàâëåíèå äâèãàòåëåì çàäàíèå ìîìåíòà
        if (Sender as TButton).Name='Button42' then
        begin
         Fl_Engine_Brake:= false;
         if Fl_Engine_Drag then Fl_Engine_Drag:= false
                           else begin
                                Fl_Engine_Drag:= true;
                                Fl_Engine:= true;
                                end;
        end;
{        // Óïðàâëåíèå Retarder çàäàíèå ìîìåíòà
        if (Sender as TButton).Name='Button53' then
        begin
         Fl_Retarder_Off:= false;
         if Fl_Retarder_Brake then Fl_Retarder_Brake:= false
                            else begin
                                 Fl_Retarder_Brake:= true;
                                 Fl_Retarder:= true;
                                 end;
        end;
        // Óïðàâëåíèå Retarder îãðàíè÷åíèå ìîìåíòà
        if (Sender as TButton).Name='Button52' then
        begin
         Fl_Retarder_Brake:= false;
         if Fl_Retarder_Off then Fl_Retarder_Off:= false
                           else begin
                                Fl_Retarder_Off:= true;
                                Fl_Retarder:= true;
                                end;
        end;
}
        DSC_TestEnd;
end;

procedure TForm1.CalibrovkaDSCsenClick(Sender: TObject);
var
    Butt:string;
Label Label_Error;

begin
   Butt:= (Sender as TButton).Name;
   if Butt='Button47' then
   begin
      DSCPulsPress_Com:=32;
      FormISO.DSC_PulsPress;
      Exit;
   end
   else
   if Butt='Button48' then
   if Tip_Block >= 8 then
   begin
       Form2.Caption:='Kàëèáðîâêà AGS';
       Form2.Label1.Caption:='Ïîæàëóéñòà ïîäîæäèòå';
       Form2.Label2.Caption:='';
       Form2.ProgressBar1.Position:=-1;
       Form2.Visible:=True;
       Fl_Calibr_AGS:=true; // ðàçðåøàåì ProgressBar1 â Form1.AGSOsc
        DSCPulsPress_Com:=34;
       FormISO.DSC_PulsPress;
       repeat Application.ProcessMessages until STM_AGS_Status = 14;//Calibr_Gyro_Cmpl;
       if Calibr_Gyro_Err then goto Label_Error
       else
       begin
        Fl_Calibr_AGS:=false;
        Form1.Close_Form2; // çàêðûâàåì ôîðìó 2
        Form1.FormEnable;
        MsgBox( 'Êàëèáðîâêà AGS âûïîëíåíà',
                     'Ïðåäóïðåæäåíèå', MB_OK+MB_ICONASTERISK+MB_APPLMODAL);
        FormISO.EraseError_EPROM;
        Button48.Enabled:=true;
        Exit;
       end;
   end
   else
   begin
//    ïðîâåðÿåì âêëþ÷åíî ðåëå
    if (ABS_System_F0 and 1)=1 then
    begin
      Button48.Enabled:=false;
      Form1.FormDisable; //çàïðåò Form1
      Form2.Caption:='Kàëèáðîâêà AGS';
      Form2.Label1.Caption:='Ïîæàëóéñòà ïîäîæäèòå';
      Form2.ProgressBar1.Position:=-1;
      Form2.Visible:=True;
      if   (AGS_CFG1_B0  and $30) = $30 then
      begin
        Fl_Calibr_AGS:=true; // ðàçðåøàåì ProgressBar1 â Form1.AGSOsc
        Fl_Calibr_Gyro:=true;
        Calibr_Gyro_Cmpl:=false;
        Calibr_Gyro_Err:=false;
        Form2.Label2.Caption:='Kàëèáðîâêa ãèðîñêîïà';
        DSCPulsPress_Com:=34;
        FormISO.DSC_PulsPress;
// æäåì çàâåðøåíèå êàëèáðîâêè ãèðîñêîïà
        repeat Application.ProcessMessages until Calibr_Gyro_Cmpl;
        if Calibr_Gyro_Err then goto Label_Error;
        Fl_Calibr_AGS:=false;
        Form1.Close_Form2; // çàêðûâàåì ôîðìó 2
        Form1.FormEnable;
        MsgBox( 'Êàëèáðîâêà AGS âûïîëíåíà',
                     'Ïðåäóïðåæäåíèå', MB_OK+MB_ICONASTERISK+MB_APPLMODAL);
        FormISO.EraseError_EPROM;
        Button48.Enabled:=true;
        Exit;
      end
      else
      begin
      ReleON_After_Reset;
//ñíÿòèå çàùèòû Flash
      Fl_Calibr_AGS:=true; // ðàçðåøàåì ProgressBar1 â Form1.AGSOsc
      Form2.Label2.Caption:='Ñíÿòèå çàùèòû Flash';
      Flash_UnProtected_All:=false; // Ïðîãðàììà çàùèùåíà
      Flash_UnProtected_CFG:=true;
      FlashUnProtected;
// Kàëèáðîâêa ãèðîñêîïà
      Fl_Calibr_Gyro:=true;
      Calibr_Gyro_Cmpl:=false;
      Calibr_Gyro_Err:=false;
      Form2.Label2.Caption:='Kàëèáðîâêa ãèðîñêîïà';
      DSCPulsPress_Com:=34;
      FormISO.DSC_PulsPress;
// æäåì çàâåðøåíèå êàëèáðîâêè ãèðîñêîïà
      repeat Application.ProcessMessages until Calibr_Gyro_Cmpl;
      if Calibr_Gyro_Err then goto Label_Error;
// ñíÿòèå Security
      if not Set_Security then goto Label_Error;
// Kàëèáðîâêa àêñåëåðîìåòðà
      Form2.Label2.Caption:='Kàëèáðîâêa àêñåëåðîìåòðà';
      Sum_Cnt:=0;
      Sum_OffSet_AccX:=0;
      Sum_OffSet_AccY:=0;
      Calibr_Acc_Cmpl:=false;
      Fl_Calibr_Acc:=true;
      repeat
        CalibrovkaAccel;
        repeat Application.ProcessMessages until Fl_AGS_Read;
      until Calibr_Acc_Cmpl;
// KSUM
      CheckSUM_DumpMOT;
// êîïèðîâàíèå DumpMOT  DumpMOTcopy
      DumpMOT_to_DumpMOTcopy;
// ñîõðàíåíèå CFG
      fl_change_comp:=false;
      fl_change_Err:=false;
      FormISO.WriteMotEPROM_con;
      repeat Application.ProcessMessages until fl_change_comp;
//  err
// âûêëþ÷åíèå ðåëå ïîñëå Ðåñòàðòà
      ReleOFF_After_Reset;
// çàäåðæêà çàïèñè â STM
      sleep(500);
// Óñòàíîâêà çàùèòû Flash
      Form2.Label2.Caption:='Óñòàíîâêà çàùèòû Flash';
      Form1.FormEnable;
      FlashProtected;
      if Fl_FlashProtect_Compleet then
      begin
        // âêëþ÷åíèå ðåëå ïîñëå Ðåñòàðòà
        Form1.FormEnable;
        ReleON_After_Reset;
        Butt:='';
        Fl_Calibr_AGS:=false;
        Form1.Close_Form2; // çàêðûâàåì ôîðìó 2
        MsgBox( 'Êàëèáðîâêà AGS âûïîëíåíà',
                     'Ïðåäóïðåæäåíèå', MB_OK+MB_ICONASTERISK+MB_APPLMODAL);
        FormISO.EraseError_EPROM;
        Button48.Enabled:=true;
      end;
      Exit;
      end;
    end
    else
    begin
      ShowMessage('Íåâîçìîæíî âûïîëíèòü âûêëþ÷åíî ðåëå');
      Form1.FormEnable;
      Exit;
    end;

// Label Error
Label_Error:
     Fl_Calibr_AGS:=false;
     Form1.FormEnable;
     Button48.Enabled:=true;
     Form1.Close_Form2; // çàêðûâàåì ôîðìó 2
     MsgBox( PChar('Êàëèáðîâêà íå âûïîëíåíà'),
                    'Îøèáêà', MB_OK+MB_ICONERROR+MB_APPLMODAL);
   end;

end;


procedure TForm1.CalibrovkaAccel;
var
    AccX_OffSet, AccY_OffSet:integer;
begin
     // OffSet_AccY
     OffSet_temp:= Round(2048*StrToFloat(Form1.Edit59.Text));
     if OffSet_temp>0 then OffSet_AccX:=OffSet_temp
                      else OffSet_AccX:=65536+OffSet_temp;
     OffSet_AccX:= OffSet_AccX + Accel_X;
     // OffSet_AccY
     OffSet_temp:= Round(2048*StrToFloat(Form1.Edit54.Text));
     if OffSet_temp>0 then OffSet_AccY:=OffSet_temp
                      else OffSet_AccY:=65536+OffSet_temp;
     OffSet_AccY:= OffSet_AccY + Accel_Y;
     // íàõîäèì ñðåäíèå OffSet
     if Fl_Calibr_Acc then
     begin
         if Sum_Cnt < 50 then
         begin
            if Fl_AGS_Read then
            begin
              Fl_AGS_Read:=false;
              Sum_Cnt:=Sum_Cnt+1;
              Sum_OffSet_AccX:=Sum_OffSet_AccX+OffSet_AccX;
              Sum_OffSet_AccY:=Sum_OffSet_AccY+OffSet_AccY;
            end;
         end
         else
         begin
             Fl_Calibr_Acc:=false;
             AccX_OffSet:= Round(Sum_OffSet_AccX/Sum_Cnt);
             AccY_OffSet:= Round(Sum_OffSet_AccY/Sum_Cnt);
             Form1.Edit54.Text:= FloatToStrF(AccY_OffSet/2048,ffFixed,5,2);
             DumpMOT[212]:= AccY_OffSet div 256;
             DumpMOT[213]:= AccY_OffSet mod 256;
             Form1.Edit59.Text:= FloatToStrF(AccX_OffSet/2048,ffFixed,5,2);
             DumpMOT[214]:= AccX_OffSet div 256;
             DumpMOT[215]:= AccX_OffSet mod 256;
             Calibr_Acc_Cmpl:=true;
         end;
     end;
end;

procedure TForm1.AGSOsc;
begin
      if not Com_Connected_F then Exit;
      Form1.Edit35.Text:=FloatToStrF(Omega_X/pi*180/8192,ffFixed,5,2);
      Form1.Edit81.Text:=FloatToStrF(Omega_Y/pi*180/8192,ffFixed,5,2);
      Form1.Edit82.Text:=FloatToStrF(Omega_Z/pi*180/8192,ffFixed,5,2);
      Form1.Edit83.Text:=FloatToStrF(Accel_X/2048,ffFixed,5,2);
      Form1.Edit84.Text:=FloatToStrF(Accel_Y/2048,ffFixed,5,2);
      Form1.Edit85.Text:=FloatToStrF(Accel_Z/2048,ffFixed,5,2);
      Form1.Edit86.Text:=FloatToStrF(Steering_Angle/pi*180/1024,ffFixed,5,1);

      if Fl_Calibr_AGS then
           Form2.ProgressBar1.Position:= Form2.ProgressBar1.Position+1;
end;

procedure TForm1.TrailerOsc;
begin
      if (not Com_Connected_F)then Exit;
      if (not CheckBox84.Checked) then
      begin
         GroupBox94.Visible:=false;
         Exit;
      end
      else GroupBox94.Visible:=true;
      // Rx Cnt
      Form1.Edit138.Text:=IntToStr(EBS22_Cnt);
      // Trailer_Num
      case Trailer_Num of
      0:  Form1.Label354.Caption:='íå îïðåäåëåí';
      1:  Form1.Label354.Caption:='Îïðåäåëåí ïðèöåï 1';
      2:  Form1.Label354.Caption:='Îïðåäåëåíû ïðèöåïû 1 è 2';
      3:  Form1.Label354.Caption:='Îïðåäåëåíû ïðèöåïû 1 è 2 è 3';
      4:  Form1.Label354.Caption:='Îïðåäåëåíû ïðèöåïû 1 è 2 è 3 è 4';
      5:  Form1.Label354.Caption:='Îïðåäåëåíû ïðèöåïû 1 è 2 è 3 è 4 è 5';
      end;
      // EBS22
      Form1.Edit133.Text:=IntToStr(EBS22_Status1);
      Form1.Edit134.Text:=IntToStr(EBS22_Status2);
      Form1.Edit135.Text:=IntToStr(EBS22_Status3);
      Form1.Edit136.Text:=IntToStr(EBS22_Status4);
      if EBS22_AxleLoadSum < $FE00 then
           Form1.Edit137.Text:=IntToStr(EBS22_AxleLoadSum)
      else Form1.Edit137.Text:='íåäîñòóïíî';

      // EBS22_Status1
      if (EBS22_Status1 and 3)=0 then
           Form1.Label356.Caption:='íå àêòèâíî';
      if (EBS22_Status1 and 3)=1 then
           Form1.Label356.Caption:='àêòèâíî';
      if (EBS22_Status1 and 3)=2 then
      begin
           Form1.Label356.Color:= clRed;
           Form1.Label356.Caption:='íå èñïðàâíî';
      end
      else Form1.Label356.Color:= clBtnFace;
      if (EBS22_Status1 and 3)=3 then
           Form1.Label356.Caption:='íåò èíôîðìàöèè';

      // Brake
      if (EBS22_Status1 and $30)=0 then
           Form1.Label357.Caption:='íå àêòèâíî';
      if (EBS22_Status1 and $30)=$10 then
           Form1.Label357.Caption:='àêòèâíî';
      if (EBS22_Status1 and $30)=$20 then
           Form1.Label357.Caption:='íå èñïðàâíî';
      if (EBS22_Status1 and $30)=$30 then
           Form1.Label357.Caption:='íåò èíôîðìàöèè';

      // EBS22_Status2
      if (EBS22_Status2 and 12)=0 then
           Form1.Label358.Caption:='èñïðàâíî';
      if (EBS22_Status2 and 12)=4 then
           Form1.Label358.Caption:='èñïðàâíî';  //
      if (EBS22_Status2 and 12)=8 then
      begin
           Form1.Label358.Color:= clRed;
           Form1.Label358.Caption:='íå èñïðàâíî';
      end
      else Form1.Label358.Color:= clBtnFace;
      if (EBS22_Status2 and 12)=12 then
           Form1.Label358.Caption:='íåò èíôîðìàöèè';

      if (EBS22_Status2 and $C)=0 then
           Form1.Label359.Caption:='OFF';
      if (EBS22_Status2 and $C)=$4 then
      begin
           Form1.Label359.Color:= clRed;
           Form1.Label359.Caption:='ON';
      end
      else Form1.Label359.Color:= clBtnFace;
      if (EBS22_Status2 and $C)=$8 then
           Form1.Label359.Caption:='Error';
      if (EBS22_Status2 and $C)=$C then
           Form1.Label359.Caption:='íåäîñòóïíî';

      if (EBS22_Status2 and $30)=0 then
           Form1.Label360.Caption:='OFF';
      if (EBS22_Status2 and $30)=$10 then
      begin
           Form1.Label360.Color:= clYellow;
           Form1.Label360.Caption:='ON';
      end
      else Form1.Label360.Color:= clBtnFace;
      if (EBS22_Status2 and $30)=$20 then
           Form1.Label360.Caption:='Error';
      if (EBS22_Status2 and $30)=$30 then
           Form1.Label360.Caption:='íåäîñòóïíî';
      // Äàò÷èê äàâëåíèÿ
      if Fl_DifTrailer_ON then
      Form1.Label370.Caption:=
               FloatToStrF(TestDSC.TrackBar2.Position/20,ffFixed,4,2)
      else Form1.Label370.Caption:='';
      Form1.Edit145.Text:= FloatToStrF(TrailerPress/20,ffFixed,4,1);

      // EBS25
      // Trailer_Press_1L
      Form1.Edit179.Text:= FloatToStrF(Trailer_Press_1L/20,ffFixed,4,1);
      // Trailer_Press_1R
      Form1.Edit180.Text:= FloatToStrF(Trailer_Press_1R/20,ffFixed,4,1);
      // Trailer_Press_2L
      Form1.Edit181.Text:= FloatToStrF(Trailer_Press_2L/20,ffFixed,4,1);
      // Trailer_Press_2R
      Form1.Edit182.Text:= FloatToStrF(Trailer_Press_2R/20,ffFixed,4,1);
      // Trailer_Press_3L
      Form1.Edit183.Text:= FloatToStrF(Trailer_Press_3L/20,ffFixed,4,1);
      // Trailer_Press_3R
      Form1.Edit184.Text:= FloatToStrF(Trailer_Press_3R/20,ffFixed,4,1);
      // EBS25_Cnt
      Form1.Edit185.Text:= IntToStr(EBS25_Cnt);
      // EBS25_Status5
      Form1.Edit186.Text:= IntToStr(EBS25_Status5);
       // 12 bits ROP system enabled/disabled
      if Trailer_Num = 0 then
      begin
         Form1.Label436.Caption:='íåò èíôîðìàöèè';
         Form1.Label439.Caption:='íåò èíôîðìàöèè';
      end
      else
      begin
      if (EBS25_Status5 and $03)=$00 then
      begin
           Form1.Label436.Color:= clRed;
           Form1.Label436.Caption:='Disabled';
      end
      else
      begin
      Form1.Label436.Color:= clBtnFace;
      if (EBS25_Status5 and $03)= $01 then
           Form1.Label436.Caption:='Enabled';
      if (EBS25_Status5 and $03)= $02 then
           Form1.Label436.Caption:='Error';
      if (EBS25_Status5 and $03)= $03 then
           Form1.Label436.Caption:='íåäîñòóïíî';
      end;
      // 34 bits DYC system enabled/disabled
      if (EBS25_Status5 and $0C)= 0 then
      begin
           Form1.Label439.Color:= clRed;
           Form1.Label439.Caption:='Disabled';
      end
      else
      begin
      Form1.Label439.Color:= clBtnFace;
      if (EBS25_Status5 and $0C)= $04 then
           Form1.Label439.Caption:='Enabled';
      if (EBS25_Status5 and $0C)= $08 then
           Form1.Label439.Caption:='Error';
      if (EBS25_Status5 and $0C)= $0C then
           Form1.Label439.Caption:='íåäîñòóïíî';
      end;
      end;

      // EBS21
      Form1.Edit422.Text:=IntToStr(EBS21_Status1);
      Form1.Edit423.Text:=IntToStr(EBS21_Status2);
      // EBS21_Status1
      if (EBS21_Status1 and 3)=0 then
           Form1.Label657.Caption:='íå àêòèâíî';
      if (EBS21_Status1 and 3)=1 then
           Form1.Label657.Caption:='àêòèâíî';
      if (EBS21_Status1 and 3)=2 then
      begin
           Form1.Label657.Color:= clRed;
           Form1.Label657.Caption:='íå èñïðàâíî';
      end
      else Form1.Label657.Color:= clBtnFace;
      if (EBS21_Status1 and 3)=3 then
           Form1.Label657.Caption:='íåò èíôîðìàöèè';
      // Brake
      if (EBS21_Status1 and $30)=0 then
           Form1.Label658.Caption:='íå àêòèâíî';
      if (EBS21_Status1 and $30)=$10 then
           Form1.Label658.Caption:='àêòèâíî';
      if (EBS21_Status1 and $30)=$20 then
           Form1.Label658.Caption:='íå èñïðàâíî';
      if (EBS21_Status1 and $30)=$30 then
           Form1.Label658.Caption:='íåò èíôîðìàöèè';
      // EBS21_Status2
      if (EBS21_Status2 and 3)=0 then
           Form1.Label659.Caption:='íå àêòèâíî';
      if (EBS21_Status2 and 3)=1 then
           Form1.Label659.Caption:='àêòèâíî';
      if (EBS21_Status2 and 3)=2 then
      begin
           Form1.Label659.Color:= clRed;
           Form1.Label659.Caption:='íå èñïðàâíî';
      end
      else Form1.Label659.Color:= clBtnFace;
      if (EBS21_Status2 and 3)=3 then
           Form1.Label659.Caption:='íåò èíôîðìàöèè';
      // Trailer_Speed
      if Trailer_Speed < $FE00 then
      Form1.Edit187.Text:= FloatToStrF(Trailer_Speed/256,ffFixed,4,1)
      else
      Form1.Edit187.Text:= 'íåäîñòóïíî';
      // CANT_Mode
      if CANT_Mode = 0 then Form1.Label442.Caption:='ÄÂÓÕïðîâîäíûé'
      else
      if CANT_Mode = 1 then Form1.Label442.Caption:='ÎÄÍÎïðîâîäíûé CAN_H'
      else
      if CANT_Mode = 2 then Form1.Label442.Caption:='ÎÄÍÎïðîâîäíûé CAN_L';

      // Trailer_Press
      Form1.Edit205.Text:= FloatToStrF(Trailer_Press/20,ffFixed,4,1);

end;

procedure TForm1.FormDisable;
begin
     Form1.ToolBar1.Enabled:=false;
     Form1.PageControl1.Enabled:=false;
end;

procedure TForm1.FormEnable;
begin
     Form1.ToolBar1.Enabled:=true;
     Form1.PageControl1.Enabled:=true;
     Form1.BtnQuit.Enabled:=true;
end;

procedure TForm1.CANfindOsc;
begin
     Form1.Edit166.Text:= IntToStr(CAN_PGN_Find);
     Form1.Edit167.Text:= IntToStr(CAN_PGN_Tout);
     if Find_CCVS and not Tout_CCVS then Form1.GroupBox105.Color:=cl3DLight
                                    else Form1.GroupBox105.Color:=clBtnFace;
     if Find_EEC1 and not Tout_EEC1 then Form1.GroupBox106.Color:=cl3DLight
                                    else Form1.GroupBox106.Color:=clBtnFace;
     if Find_AIR1 and not Tout_AIR1 then Form1.GroupBox71.Color:=cl3DLight
                                    else Form1.GroupBox71.Color:=clBtnFace;
     if Find_ASC4 and not Tout_ASC4 then Form1.GroupBox118.Color:=cl3DLight
                                    else Form1.GroupBox118.Color:=clBtnFace;
     if Find_TCO1 and not Tout_TCO1 then Form1.GroupBox111.Color:=cl3DLight
                                    else Form1.GroupBox111.Color:=clBtnFace;
     if Find_VDHR and not Tout_VDHR then Form1.GroupBox112.Color:=cl3DLight
                                    else Form1.GroupBox112.Color:=clBtnFace;
     if Find_AMB and not Tout_AMB then Form1.GroupBox114.Color:=cl3DLight
                                  else Form1.GroupBox114.Color:=clBtnFace;

     if Find_CCVS and not Tout_CCVS then Form1.Label411.Visible:=false
                                    else Form1.Label411.Visible:=true;
     if Find_EEC1 and not Tout_EEC1 then Form1.Label412.Visible:=false
                                    else Form1.Label412.Visible:=true;
     if Find_AIR1 and not Tout_AIR1 then Form1.Label413.Visible:=false
                                    else Form1.Label413.Visible:=true;
     if Find_ASC4 and not Tout_ASC4 then Form1.Label414.Visible:=false
                                    else Form1.Label414.Visible:=true;
     if Find_TCO1 and not Tout_TCO1 then Form1.Label415.Visible:=false
                                    else Form1.Label415.Visible:=true;
     if Find_VDHR and not Tout_VDHR then Form1.Label416.Visible:=false
                                    else Form1.Label416.Visible:=true;
     if Find_AMB and not Tout_AMB then Form1.Label417.Visible:=false
                                  else Form1.Label417.Visible:=true;
end;

procedure TForm1.VDCTestVAROsc;
begin
      // Êîåôôèöèåíò ÒÑÎ
      Form1.Edit146.Text:= FloatToStrF(TCO_KoefRear/$7FFF,ffFixed,4,2);
      Form1.Edit404.Text:= FloatToStrF(TCO_KoefFront/$7FFF,ffFixed,4,2);
      // DSC_Flags1s
      if (DSC_Flags1s and $10)=$10  then CheckBox313.Checked:=true     // KoefRear_Cplt
                                    else CheckBox313.Checked:=false;
      if (DSC_Flags1s and $08)=$08  then CheckBox314.Checked:=true     // KoefFront_Cplt
                                    else CheckBox314.Checked:=false;
      if (DSC_Flags1s and $04)=$04  then CheckBox315.Checked:=true     // KoefSpeed_Enable
                                    else CheckBox315.Checked:=false;
      if (DSC_Flags1s and $20)=$20  then CheckBox316.Checked:=true     // TransmissionON
                                    else CheckBox316.Checked:=false;
      if (DSC_Flags1s and $40)=$40  then CheckBox317.Checked:=true     // ReverseON
                                    else CheckBox317.Checked:=false;
      // CAN_CCVS_Status
      // Parking
      if (CAN_CCVS_Status and $C)=0 then
           Form1.Label378.Caption:='OFF';
      if (CAN_CCVS_Status and $C)=$4 then
      begin
           Form1.Label378.Color:= clRed;
           Form1.Label378.Caption:='ON';
      end
      else Form1.Label378.Color:= clBtnFace;
      if (CAN_CCVS_Status and $C)=$8 then
           Form1.Label378.Caption:='Error';
      if (CAN_CCVS_Status and $C)=$C then
           Form1.Label378.Caption:='íåäîñòóïíî';
      // Brake
      if (CAN_CCVS_Status and $30)=0 then
           Form1.Label374.Caption:='OFF';
      if (CAN_CCVS_Status and $30)=$10 then
      begin
           Form1.Label374.Color:= clRed;
           Form1.Label374.Caption:='ON';
      end
      else Form1.Label374.Color:= clBtnFace;
      if (CAN_CCVS_Status and $30)=$20 then
           Form1.Label374.Caption:='Error';
      if (CAN_CCVS_Status and $30)=$30 then
           Form1.Label374.Caption:='íåäîñòóïíî';
      // Clutch
      if (CAN_CCVS_Status and $C0)=0 then
           Form1.Label376.Caption:='ON';
      if (CAN_CCVS_Status and $C0)=$40 then
      begin
           Form1.Label376.Color:= clRed;
           Form1.Label376.Caption:='OFF';
      end
      else Form1.Label376.Color:= clBtnFace;
      if (CAN_CCVS_Status and $C0)=$80 then
           Form1.Label376.Caption:='Error';
      if (CAN_CCVS_Status and $C0)=$C0 then
           Form1.Label376.Caption:='íåäîñòóïíî';
      // BrakeDemand
      Form1.Edit147.Text:= FloatToStrF(BrakeDemand/20,ffFixed,4,1);
      // BellowPress
      if BellowPress < $FE00 then
           Form1.Edit153.Text:= FloatToStrF(BellowPress/1000,ffFixed,4,2)
      else  Form1.Edit153.Text:= 'íåäîñòóïíî';
      // BellowPress
      if Below_SensPress > 0 then
           Form1.Edit329.Text:= FloatToStrF(Below_SensPress/1000,ffFixed,4,2)
      else Form1.Edit329.Text:= '----';

      // TCO_Gear_Koef
      if (Gear_Num and $80)=0  then
      begin
           Form1.Edit161.Text:= FloatToStrF(TCO_Gear_Koef/256,ffFixed,4,2);
           if Gear_Num = 126 then Form1.Edit162.Text:= 'Parking'
           else
           begin
            if (Gear_Num and $1F) = 0 then Form1.Edit162.Text:= 'Íåéòðàëü'
            else Form1.Edit162.Text:= IntToStr(Gear_Num and $1F);
           end;
           // TransmissionON - b5
           if (Gear_Num and $20) = $20 then
           begin
              Form1.Label401.Color:= clBtnFace;
              Form1.Label401.Caption:='Âêëþ÷åíà';
           end
           else
           begin
              Form1.Label401.Color:= clYellow;
              Form1.Label401.Caption:='Âûêëþ÷åíà';
           end;
           // ReverseON - b6
           if (Gear_Num and $40) = $40 then
           begin
              Form1.Label404.Color:= clAqua;
              Form1.Label404.Caption:='âêëþ÷åí'
           end
           else
           begin
              Form1.Label404.Color:= clBtnFace;
              Form1.Label404.Caption:='Íåò';
           end;

      end
      else
      begin
          Form1.Edit161.Text:= 'íåäîñòóïíî';
          Form1.Edit162.Text:= 'íåäîñòóïíî';
          Form1.Label401.Color:= clBtnFace;
          Form1.Label404.Color:= clBtnFace;
          Form1.Label401.Caption:='íåò èíôîðìàöèè';
          Form1.Label404.Caption:='íåò èíôîðìàöèè';
      end;

      // FrontInPress
      Form1.Edit206.Text:= FloatToStrF(FrontInPress/20,ffFixed,4,1);
      // RearInPress
      Form1.Edit207.Text:= FloatToStrF(RearInPress/20,ffFixed,4,1);

      // RearAxleLoad
      Form1.Edit204.Text:= IntToStr(RearAxle_Load*10);
      // FrontAxleLoad
      Form1.Edit217.Text:= IntToStr(FrontAxle_Load*10);

      // Mass_Engine_Est
      Form1.Edit208.Text:= IntToStr(Mass_Engine_Est*10);
      // Truck_Mass_ECAS
      Form1.Edit331.Text:= IntToStr(Truck_Mass_ECAS*10);
      // EBL.REG.Koef
      Form1.Edit209.Text:= FloatToStrF(EBL_REG_Koef/256,ffFixed,4,2);
      // Hitch_Fz
      Form1.Edit210.Text:= IntToStr(Hitch_Fz*10);
      // Mass_Break_Est
      Form1.Edit212.Text:= IntToStr(Mass_Break_Est*10);
      // Load_Koef
      Form1.Edit213.Text:= FloatToStrF(Load_Koef/32,ffFixed,4,2);
       // TrainMass
      Form1.Edit225.Text:= IntToStr(TrainMass*10);
      // êîëè÷åñòâî çàìåðîâ
      Form1.Edit459.Text:= IntToStr(Load_Brake_Num);
      Form1.Edit460.Text:= IntToStr(Load_Engine_Num);
      
// SelfTun_PeakTorque
      Form1.Edit236.Text:=IntToStr(EngineTorquePeak);
      Form1.Edit240.Text:=IntToStr(SelfTun_PeakTorque);
//Engine_TorqueLoss Nm
      Form1.Edit244.Text:= IntToStr(Round(Engine_TorqueLoss/25));
      Form1.Edit421.Text:= IntToStr(Engine_PercentLoss);
//Engine_Torque XX %
      Form1.Edit271.Text:= Form1.Edit245.Text;//IntToStr(Engine_PercentLoss);
// SelfTun_Engine_PTxx
      Form1.Edit243.Text:=IntToStr(SelfTun_Engine_PTxx);
// SelfTun_EngineLoss_K1
      Form1.Edit237.Text:=Form1.Edit215.Text;//IntToStr(DumpMOT[204]);
      Form1.Edit419.Text:= IntToStr(SelfTun_Engine_Loss_K1);
// SelfTun_EngineLoss_K2
      Form1.Edit238.Text:=Form1.Edit216.Text;//IntToStr(DumpMOT[205]);
      Form1.Edit420.Text:= IntToStr(SelfTun_Engine_Loss_K2);

// SelfTun_Break_KP
      Form1.Edit230.Text:=Form1.Edit219.Text;//IntToStr(DumpMOT[207]);
      Form1.Edit231.Text:=IntToStr(SelfTun_Break_KP);

// Êîíôèãóðàöèÿ äâèãàòåëÿ CAN  EC1
      Form1.Edit232.Text:= IntToStr(Round(EC1_RefTorque));
      if (EC1_TorquePoint5 >= $7D) and
         (EC1_TorquePoint5 <= $FA)
      then  Form1.Edit234.Text:= IntToStr(EC1_TorquePoint5-$7D)
      else  Form1.Edit234.Text:= '----';
   //   Form1.Edit234.Text:= IntToStr(EC1_TorquePoint5);
      Form1.Edit233.Text:= IntToStr(Round(EC1_PeakTorque));
   //   Form1.Edit235.Text:= IntToStr(EC1_TorquePoint1);
      if (EC1_TorquePoint1 >= $7D) and
         (EC1_TorquePoint1 <= $FA)
      then  Form1.Edit235.Text:= IntToStr(EC1_TorquePoint1-$7D)
      else  Form1.Edit235.Text:= '----';

      Form1.Edit239.Text:= IntToStr(Round(EC1_TaxoPoint1/8));

      Form1.Edit268.Text:= IntToStr(Round(EC1_TaxoPoint2/8));
      // Ïàðàìåòðû òîðìîæåíèÿ
      // Deccel[1]
      // ðàçìåðíîñòü Dec 0,05m/c2 - 1msb            20 íå ìåíÿòü !!
      if Tip_Block < 8 then
      Form1.Edit242.Text:=FloatToStrF(Brake_Deccel1/20,ffFixed,4,2)
      else
      Form1.Edit242.Text:=FloatToStrF(Brake_Deccel1/51200,ffFixed,4,2);
      // Time[1]
      // ðàçìåðíîñòü Time 0,05c - 1msb
      Form1.Edit241.Text:=FloatToStrF(Brake_Time1/20,ffFixed,4,2);
      if (CAN_Flags7 and $04)= $04  then
      begin
      Form1.Label511.Caption:='EBC1 Find';
      Form1.Edit249.Text:= IntToStr(CAN_EBC1_Adr);
      Form1.Edit250.Text:= IntToStr(CAN_EBC1_B3);
      Form1.Edit251.Text:= IntToStr(CAN_EBC1_B6);
      Form1.Edit252.Text:= IntToStr(CAN_EBC1_B7);
      // Switch ABS
      if (CAN_EBC1_B3 and $03)= $01 then
          Form1.Label501.Caption:='On';
      if (CAN_EBC1_B3 and $03)= $00 then
          Form1.Label501.Caption:='Off';
      if (CAN_EBC1_B3 and $03)= $02 then
           Form1.Label501.Caption:='Error';
      if (CAN_EBC1_B3 and $03)= $03 then
           Form1.Label501.Caption:='íåäîñòóïíî';
      // Switch ASR
      if (CAN_EBC1_B3 and $0C)= $04 then
          Form1.Label502.Caption:='On';
      if (CAN_EBC1_B3 and $0C)= $00 then
          Form1.Label502.Caption:='Off';
      if (CAN_EBC1_B3 and $0C)= $08 then
           Form1.Label502.Caption:='Error';
      if (CAN_EBC1_B3 and $0C)= $0C then
           Form1.Label502.Caption:='íåäîñòóïíî';
      // ASR Lamp
      if (CAN_EBC1_B6 and $C0)= $40 then
          Form1.Label503.Caption:='On';
      if (CAN_EBC1_B6 and $C0)= $00 then
          Form1.Label503.Caption:='Off';
      if (CAN_EBC1_B6 and $C0)= $80 then
           Form1.Label503.Caption:='Error';
      if (CAN_EBC1_B6 and $C0)= $C0 then
           Form1.Label503.Caption:='íåäîñòóïíî';
      // ABS Lamp
      if (CAN_EBC1_B6 and $30)= $10 then
          Form1.Label504.Caption:='On';
      if (CAN_EBC1_B6 and $30)= $00 then
          Form1.Label504.Caption:='Off';
      if (CAN_EBC1_B6 and $30)= $20 then
           Form1.Label504.Caption:='Error';
      if (CAN_EBC1_B6 and $30)= $30 then
           Form1.Label504.Caption:='íåäîñòóïíî';
      // Trailer Lamp
      if (CAN_EBC1_B7 and $C0)= $40 then
          Form1.Label507.Caption:='On';
      if (CAN_EBC1_B7 and $C0)= $00 then
          Form1.Label507.Caption:='Off';
      if (CAN_EBC1_B7 and $C0)= $80 then
           Form1.Label507.Caption:='Error';
      if (CAN_EBC1_B7 and $C0)= $C0 then
           Form1.Label507.Caption:='íåäîñòóïíî';
      end
      else
      begin
      Form1.Label511.Caption:='EBC1 not Find';
      Form1.Edit249.Text:= '';
      Form1.Edit250.Text:= '';
      Form1.Edit251.Text:= '';
      Form1.Edit252.Text:= '';
      Form1.Label501.Caption:='Íåò èíôîðìàöèè';
      Form1.Label502.Caption:='Íåò èíôîðìàöèè';
      Form1.Label503.Caption:='Íåò èíôîðìàöèè';
      Form1.Label504.Caption:='Íåò èíôîðìàöèè';
      Form1.Label507.Caption:='Íåò èíôîðìàöèè';
      end;

      //---------ÁÑÓ ÍÃÊ-----------------------
      // Door Status
      if (CAN_Flags7 and $10)= $10  then
      begin
      Form1.Edit287.Text:= IntToStr(Door_Status);
      if Door_Status = 255 then
               Label606.Caption :='Íåò èíôîðìàöèè'
      else begin
         if ((Door_Status and $0F)= $02) or
            ((Door_Status and $0F)= $01) then
               Label606.Caption :='Äâåðè çàêðûòû'
         else
         if (Door_Status and $0F)= 0 then
               Label606.Caption :='Äâåðè îòêðûòû'
         else  Label606.Caption :='íåäîñòóïíî';
      end;
      end
      else     Label606.Caption :='Íåò ñîîáùåíèé DC1';
      // DC1 Adr
      Form1.Edit398.Text:= IntToStr(CAN_DC1_Adr);
      
      // Gear State
      Form1.Edit371.Text:= IntToStr(CAN_Gear_State);
      if CAN_Gear_State = 255 then
             Label128.Caption :='Íåò èíôîðìàöèè'
      else begin
         if (CAN_Gear_State and $30)= $10 then
               Label128.Caption :='Ïåðåäà÷à ïåðåêëþ÷àåòñÿ'
         else
         if (CAN_Gear_State and $30)= 0 then
               Label128.Caption :='Ïåðåäà÷à âêëþ÷åíà'
         else  Label128.Caption :='íåäîñòóïíî';
      end;
      // Gear Num
      Form1.Edit372.Text:= IntToStr(CAN_Gear_Num);
      if CheckBox293.Checked then
      begin
        if CAN_Gear_Num = 125 then Label605.Caption :='íåéòðàëü'
        else
        if CAN_Gear_Num < 125 then Label605.Caption := 'çàäíÿÿ ïåðåäà÷à'
        else
        if CAN_Gear_Num > 125 then Label605.Caption := 'ïåðåäíÿÿ ïåðåäà÷à';
      end
      else
      begin
        if (CAN_Gear_Num < 124) or
           (CAN_Gear_Num > 126) then
                Label605.Caption :='Íåò èíôîðìàöèè'
        else
        begin
        case CAN_Gear_Num of
           124: Label605.Caption :='çàäíÿÿ ïåðåäà÷à ';
           125: Label605.Caption :='íåéòðàëü ';
           126: Label605.Caption :='ïåðåäíÿÿ ïåðåäà÷à ';
        end;
        end;
      end;
end;

procedure TForm1.ConfigOsc;
var
     SA : integer;
begin
     Form1.Label380.Caption:= IntToStr(Config_Cnt);
     if SAS_Zero_Angle <> 0 then
     Form1.Edit272.Text:=FloatToStrF(SAS_Zero_Angle/pi*180/1024,ffFixed,5,1);
     Form1.Edit368.Text:=FloatToStrF(ECAS_PS_Offset*0.0027,ffFixed,4,3);
     Form1.Edit369.Text:=IntToStr(PS_CAN_SA);
          Form1.Label570.Caption :='---';
     case PS_CAN_SA of
     208: Form1.Label570.Caption :='PSB';
     214: Form1.Label570.Caption :='PS1';
     215: Form1.Label570.Caption :='PS2';
     216: Form1.Label570.Caption :='PS3';
     217: Form1.Label570.Caption :='PS4';
     end;
          SA:=StrToInt(Form1.Edit229.Text);
          Form1.Label583.Caption :='---';
     case SA of
     208: Form1.Label583.Caption :='PSB';
     214: Form1.Label583.Caption :='PS1';
     215: Form1.Label583.Caption :='PS2';
     216: Form1.Label583.Caption :='PS3';
     217: Form1.Label583.Caption :='PS4';
     end;

end;

function   CAN_SAE(B:integer):String;
begin
    if B < 0 then CAN_SAE:= '0' else
    if B = 102 then CAN_SAE:= 'Err' else
    if B = 130 then CAN_SAE:= 'Not' else
    CAN_SAE:=IntToStr(B);
end;

procedure TForm1.CANVAROsc;
begin
       Form1.Edit148.Text:= IntToStr(CAN_CCVS_Speed);
       Form1.Edit149.Text:= CAN_SAE(CAN_Torque-$7D);
       Form1.Edit150.Text:= CAN_SAE(CAN_Driver-$7D);
       Form1.Edit151.Text:= CAN_SAE(CAN_Taxo*10);
       Form1.Edit156.Text:= FloatToStrF(CAN_AirPress_1*8/100,ffFixed,4,1);
       Form1.Edit157.Text:= FloatToStrF(CAN_AirPress_2*8/100,ffFixed,4,1);
end;

procedure TForm1.CAN_TCO_Osc;
begin
      // TCO Speed
      Form1.Edit152.Text:= FloatToStrF(CAN_TCO1_Speed/256,ffFixed,4,1);
      // TCO Status
      // 12 bits System event
      if (CAN_TCO1_Status and $03)=0 then
           Form1.Label393.Caption:='Not';
      if (CAN_TCO1_Status and $03)=$01 then
      begin
           Form1.Label393.Color:= clRed;
           Form1.Label393.Caption:='Yes';
      end
      else Form1.Label393.Color:= clBtnFace;
      if (CAN_TCO1_Status and $03)=$02 then
           Form1.Label393.Caption:='Error';
      if (CAN_TCO1_Status and $03)=$03 then
           Form1.Label393.Caption:='íåäîñòóïíî';
       // 56 bits Vehicle motion
      if (CAN_TCO1_Status and $30)=0 then
           Form1.Label394.Caption:='Stands';
      if (CAN_TCO1_Status and $30)=$10 then
      begin
           Form1.Label394.Color:= clAqua;
           Form1.Label394.Caption:='Motion';
      end
      else Form1.Label394.Color:= clBtnFace;
      if (CAN_TCO1_Status and $30)=$20 then
           Form1.Label394.Caption:='Error';
      if (CAN_TCO1_Status and $30)=$30 then
           Form1.Label394.Caption:='íåäîñòóïíî';
       // 78 bits Direction indicator
      if (CAN_TCO1_Status and $C0)=0 then
           Form1.Label395.Caption:='Forward';
      if (CAN_TCO1_Status and $C0)=$40 then
      begin
           Form1.Label395.Color:= clRed;
           Form1.Label395.Caption:='Reverse';
      end
      else Form1.Label395.Color:= clBtnFace;
      if (CAN_TCO1_Status and $C0)=$80 then
           Form1.Label395.Caption:='Error';
      if (CAN_TCO1_Status and $C0)=$C0 then
           Form1.Label395.Caption:='íåäîñòóïíî';
      // CAN_TCO1_Taxo
      if CAN_TCO1_Taxo < $FE00 then
           Form1.Edit158.Text:= FloatToStrF(CAN_TCO1_Taxo*0.125,ffFixed,6,1)
      else Form1.Edit158.Text:='íåäîñòóïíî';
      // CAN_HDRH_Distance 5 m/bit
      Form1.Edit159.Text:= FloatToStrF(CAN_HDRH_Distance/200,ffFixed,10,2);
      // CAN_AmbientAir  Resolution:  0.03125 deg C/bit, -273 deg C offset  8736
      Form1.Edit160.Text:= FloatToStrF((CAN_AmbientAir-8736)*0.03125,ffFixed,4,1);
      //
      Form1.Edit173.Text:= IntToStr(CAN_ASC1_Status);
      // Engine_Torque_Nm
      Form1.Edit203.Text:= IntToStr(Round(Engine_Torque_Nm/25));

      // Dash Board
      Form1.Edit305.Text:= IntToStr(PGN_FF20_Status1);
      if (PGN_FF20_Status1 and $01)=$01
          then Form1.CheckBox185.Checked := true
          else Form1.CheckBox185.Checked := false;
      if (PGN_FF20_Status1 and $02)=$02
          then Form1.CheckBox186.Checked := true
          else Form1.CheckBox186.Checked := false;
      if (PGN_FF20_Status1 and $04)=$04
          then Form1.CheckBox187.Checked := true
          else Form1.CheckBox187.Checked := false;
      if (PGN_FF20_Status1 and $08)=$08
          then Form1.CheckBox188.Checked := true
          else Form1.CheckBox188.Checked := false;
      if (PGN_FF20_Status1 and $10)=$10
          then Form1.CheckBox189.Checked := true
          else Form1.CheckBox189.Checked := false;
      if (PGN_FF20_Status1 and $20)=$20
          then Form1.CheckBox190.Checked := true
          else Form1.CheckBox190.Checked := false;
      if (PGN_FF20_Status1 and $40)=$40
          then Form1.CheckBox191.Checked := true
          else Form1.CheckBox191.Checked := false;
      if (PGN_FF20_Status1 and $80)=$80
          then Form1.CheckBox192.Checked := true
          else Form1.CheckBox192.Checked := false;

      Form1.Edit306.Text:= IntToStr(PGN_FF20_Status2);
      if (PGN_FF20_Status2 and $01)=$01
          then Form1.CheckBox193.Checked := true
          else Form1.CheckBox193.Checked := false;
      if (PGN_FF20_Status2 and $02)=$02
          then Form1.CheckBox194.Checked := true
          else Form1.CheckBox194.Checked := false;
      if (PGN_FF20_Status2 and $04)=$04
          then Form1.CheckBox195.Checked := true
          else Form1.CheckBox195.Checked := false;
      if (PGN_FF20_Status2 and $08)=$08
          then Form1.CheckBox196.Checked := true
          else Form1.CheckBox196.Checked := false;
      if (PGN_FF20_Status1 and $10)=$10
          then Form1.CheckBox197.Checked := true
          else Form1.CheckBox197.Checked := false;
      if (PGN_FF20_Status2 and $20)=$20
          then Form1.CheckBox198.Checked := true
          else Form1.CheckBox198.Checked := false;
      if (PGN_FF20_Status2 and $40)=$40
          then Form1.CheckBox199.Checked := true
          else Form1.CheckBox199.Checked := false;

      Form1.Edit307.Text:= IntToStr(PGN_FF21_Status1);
      if (PGN_FF21_Status1 and $01)=$01
          then Form1.CheckBox200.Checked := true
          else Form1.CheckBox200.Checked := false;
      if (PGN_FF21_Status1 and $02)=$02
          then Form1.CheckBox201.Checked := true
          else Form1.CheckBox201.Checked := false;
      if (PGN_FF21_Status1 and $04)=$04
          then Form1.CheckBox202.Checked := true
          else Form1.CheckBox202.Checked := false;
      if (PGN_FF21_Status1 and $08)=$08
          then Form1.CheckBox203.Checked := true
          else Form1.CheckBox203.Checked := false;
      if (PGN_FF21_Status1 and $10)=$10
          then Form1.CheckBox204.Checked := true
          else Form1.CheckBox204.Checked := false;
      if (PGN_FF21_Status1 and $20)=$20
          then Form1.CheckBox205.Checked := true
          else Form1.CheckBox205.Checked := false;
      if (PGN_FF21_Status1 and $40)=$40
          then Form1.CheckBox206.Checked := true
          else Form1.CheckBox206.Checked := false;
      if (PGN_FF21_Status1 and $80)=$80
          then Form1.CheckBox207.Checked := true
          else Form1.CheckBox207.Checked := false;

      Form1.Edit308.Text:= IntToStr(PGN_FF22_AIR1);
      Form1.Edit309.Text:= IntToStr(PGN_FF22_AIR2);
      Form1.Edit310.Text:= IntToStr(PGN_FF22_Temp);
      Form1.Edit311.Text:= IntToStr(PGN_FF22_Taxo);
      Form1.Edit312.Text:= FloatToStrF(PGN_FF23_Ubat/5,ffFixed,5,1);
      Form1.Edit313.Text:= IntToStr(PGN_FF22_Fuel);
end;

procedure  WriteTrailerPress(Position:byte);
begin
     if Tip_Block < 8 then
           WriteTestVAR_Addres:= DiagTest_VAR_Adr//   Road_Sel_Adr+1;
     else  WriteTestVAR_Addres:= DiagTest_VAR_Adr_v8;
     WriteTestVAR_Byte:= Position;
     FormISO.WriteTestVAR;
end;


function TForm1.ByteToHexStr(Bt:byte):string;
var
  hexstr,strH,strL : string;
begin
   hexstr := '123456789ABCDEF';
   if (Bt div 16)>0 then strH:=hexstr[Bt div 16]
   else  strH:='0';
   if (Bt mod 16)>0 then strL:=hexstr[Bt mod 16]
   else  strL:='0';
   ByteToHexStr:=strH+ strL;
end;

procedure TForm1.CheckBox45Click(Sender: TObject);
begin
    if CheckBox45.Checked then  Memo3.Visible:= true
                          else  Memo3.Visible:= false;
end;

//------------------------  Flash GZ Programmer  ------------------------------

procedure TForm1.ProgStartClick(Sender: TObject);
type
        MonBuf = Array [1..1024] of Integer;
Var RomFile:TextFile;
    TestString:String;
    ByteCounter,ByteCounter2,Loop,Adr,RepeatCounter,
    ByteCounter1,Adr1,Sme,AdrM,LoopM,CSum_Mon,ProgressBarCnt:Integer;
    DatM,BytesRec:byte;
    sr: TSearchRec;
    Mon_Buf,MonBuf1,MonBuf2 : MonBuf;
    FileString:Array [0..256] of String;
Label flashProg,flashEnd,Prog_error,Mon_error,Prog_start;

begin
    if Com_Connected_F then
    begin
        Memo3.Lines.Add('Íå ìîãó çàïðîãðàììèðîâàòü !!! Åñòü ñâÿçü ñ áëîêîì.');
        ProgStart.Down:=False;
        Exit;
    end;

   if Fl_ProgSTM and Fl_ProgROM then
   begin
       ProgStart.Down:=False;
       exit;
   end;
   if Fl_ProgStart then
   begin
       ProgStart.Enabled:=false;
       exit;
   end;
   Form1.CheckBox45Click(nil);
   ProgStart.Down:=True;
   Fl_ProgStart:=True;
   Label134.Caption:=Prog_File;
   Label134.Refresh;
  // Form2.Visible:=True;
  // Form2.Caption:='çàïèñü flash';
   Label214.Caption:='Èäåò çàãðóçêà ïðîãðàììàòîðà';
   Label214.Refresh;
  // Form2.Label2.Caption:='Ïîæàëóéñòà ïîäîæäèòå';
   ProgressBar1.Position:=0;
  // Form2.Refresh;
    //    Fl_fast_load:=False;
        ProgressBarCnt:=0;
        GroupBox48.Visible:= True;
        GroupBox48.Repaint;
        Fl_Error_Prog:=False;
        Memo3.Clear;
        Memo3.Refresh;
        Com_Init;
        Com_Baudrate(7200);
//
        ProgPit;
        TestComBuf[1]:=$FF;
        for loop:=0 to 7 do begin
            WriteFile(hCOM,TestComBuf,1,Bytes,nil);
            ReadFile(hCOM,ComBufIn,2,Bytes,nil);
        end;
        with DCB do   Parity:=1;//EVENPARITY;
        ReadFile(hCOM,ComBufIn,1,Bytes,nil);
        if ComBufIn[1] = 0 then
        begin
        Memo3.SelText:='ïîëó÷åí áðåaê';
        Memo3.Lines.Add('');
        end;
        if ((ComBufIn[1] <> 0) or (Bytes<>1)) then
        begin
//        goto Prog_start;
        //Form2.Visible:=False;
        GroupBox48.Visible:= False;
        MsgBox( PChar('Íåò îòâåòà ïëàòû!!!'),
                               'Îøèáêà', MB_OK+MB_ICONERROR+MB_APPLMODAL);
        goto flashEnd;
        end;

        with DCB do   Parity:=0;//NOPARITY;
        Adr:=$40;
        FormISO.ReadProg_Mon(Adr,DatM);
        if (DatM  and $40) = $40 then
        begin
        Memo3.SelText:='ïîëó÷åí ñåêóðèòè';
        Memo3.Lines.Add('');
        end;
 // ñòèðàíèå
        TestString:=Sec_s19;
        if (FindFirst(TestString, faAnyFile, sr) <> 0) then
        begin
         MsgBox( PChar('Ôàéë SecurityFlash.s19 íå íàéäåí.'),
              'Îøèáêà', MB_OK+MB_ICONERROR+MB_APPLMODAL);
         OpenDialog1.Filter:='s19|*.s19';
         Opendialog1.Execute;
         Sec_s19:=Opendialog1.FileName;
         if Sec_s19<>'' then begin
              DiagIni.WriteString('Ôàèë ïðîãðàììèðîâàíèÿ','Security_s19_File',Sec_s19);
              TestString:=Sec_s19;
              end;
        end;
        AssignFile(RomFile,TestString);
        Reset(RomFile);

        Adr_ProgFlash_Start:=0;
        Adr_ProgFlash_End:=0;
        Repeat
        ReadLn(RomFile,TestString);
        If Pos('S1',TestString)<>0 then
        begin
                ByteCounter:=-3+HexToByte(TestString[3])*16+HexToByte(TestString[4]);
                AdrSec:= HexToByte(TestString[5])*4096+HexToByte(TestString[6])*256+
                         HexToByte(TestString[7])*16+HexToByte(TestString[8]);

                if Adr_ProgFlash_Start =0 then Adr_ProgFlash_Start:=
                      HexToByte(TestString[9])*4096+HexToByte(TestString[10])*256+
                      HexToByte(TestString[11])*16+HexToByte(TestString[12]);
                if Adr_ProgFlash_End =0 then Adr_ProgFlash_End:=
                      HexToByte(TestString[13])*4096+HexToByte(TestString[14])*256+
                      HexToByte(TestString[15])*16+HexToByte(TestString[16]);

                DatM:=HexToByte(TestString[9])*16+HexToByte(TestString[10]);
                FormISO.WriteProg_Mon(AdrSec,DatM);
                for loop:=1 to ByteCounter-1 do
                begin
                    DatM:=HexToByte(TestString[9+Loop*2])*16+HexToByte(TestString[10+Loop*2]);
                    FormISO.IWriteProg_Mon(DatM);
                end;
                if Fl_Error_Prog then  goto Mon_error;
        end;
    //    Form2.ProgressBar1.Position:=Round(100*(AdrSec-Adr_ProgFlash_Start)/
    //                                          (Adr_ProgFlash_End-Adr_ProgFlash_Start));
        ProgressBarCnt:=ProgressBarCnt+1;
        ProgressBar1.Position:=ProgressBarCnt;

        Until Pos('S1',TestString)=0;
        CloseFile(RomFile);
        FormISO.Prog_Run_Mon;
        sleep(150);
         ReadFile(hCOM,ComBufIn,1,Bytes,nil);
     {   EscapeCommFunction(hCOM, SETBREAK);
        sleep(1);
        EscapeCommFunction(hCOM, CLRBREAK);
        PurgeComm(hCOM, PURGE_TXABORT or PURGE_RXABORT or PURGE_TXCLEAR or PURGE_RXCLEAR);}
        ProgPit;
         TestComBuf[1]:=$FF;
        for loop:=0 to 7 do begin
            WriteFile(hCOM,TestComBuf,1,Bytes,nil);
            ReadFile(hCOM,ComBufIn,2,Bytes,nil);
        end;
        with DCB do   Parity:=1;//EVENPARITY;
        ReadFile(hCOM,ComBufIn,1,Bytes,nil);
        if ComBufIn[1] = 0 then
        begin
        Memo3.SelText:='ïîëó÷åí áðåaê';
        Memo3.Lines.Add('');
        end;
        if ((ComBufIn[1] <> 0) or (Bytes<>1)) then Fl_Error_Prog:=True;
        with DCB do   Parity:=0;//NOPARITY;
        Adr:=$40;
        FormISO.ReadProg_Mon(Adr,DatM);

        if (DatM  and $40) = $40 then
        begin
        Memo3.SelText:='ïîëó÷åí ñåêóðèòè';
        Memo3.Lines.Add('');
        end;
        if ((DatM  and $40) <> $40) then
        begin
        //Form2.Visible:=False;
        GroupBox48.Visible:= False;
        MsgBox( PChar('Íå ñíÿò ñåêóðèòè!!!'),
                               'Îøèáêà', MB_OK+MB_ICONERROR+MB_APPLMODAL);
        goto flashEnd;
        end;

        TestString:=Prog_s19;
        if (FindFirst(TestString, faAnyFile, sr) <> 0) then
          begin
          MsgBox( PChar('Ôàéë ProgFlash.s19 íå íàéäåí.'),
              'Îøèáêà', MB_OK+MB_ICONERROR+MB_APPLMODAL);
          OpenDialog1.Filter:='s19|*.s19';
          Opendialog1.Execute; 
          Prog_s19:=Opendialog1.FileName;
          if Prog_s19<>'' then  begin
               DiagIni.WriteString('Ôàèë ïðîãðàììèðîâàíèÿ','Prog_s19_File',Prog_s19);
               TestString:=Prog_s19;
               end;
          end;
        AssignFile(RomFile,TestString);
        Reset(RomFile);

        Adr_ProgFlash_Start:=0;
        Adr_ProgFlash_End:=0;
        Repeat
        ReadLn(RomFile,TestString);
        If Pos('S1',TestString)<>0 then
        begin
                ByteCounter:=-3+HexToByte(TestString[3])*16+HexToByte(TestString[4]);
                AdrSec:= HexToByte(TestString[5])*4096+HexToByte(TestString[6])*256+
                      HexToByte(TestString[7])*16+HexToByte(TestString[8]);

                if Adr_ProgFlash_Start =0 then Adr_ProgFlash_Start:=
                      HexToByte(TestString[9])*4096+HexToByte(TestString[10])*256+
                      HexToByte(TestString[11])*16+HexToByte(TestString[12]);
                if Adr_ProgFlash_End =0 then Adr_ProgFlash_End:=
                      HexToByte(TestString[13])*4096+HexToByte(TestString[14])*256+
                      HexToByte(TestString[15])*16+HexToByte(TestString[16]);

                    DatM:=HexToByte(TestString[9])*16+HexToByte(TestString[10]);
                    FormISO.WriteProg_Mon(AdrSec,DatM);
                for loop:=1 to ByteCounter-1 do
                begin
                    DatM:=HexToByte(TestString[9+Loop*2])*16+HexToByte(TestString[10+Loop*2]);
                    FormISO.IWriteProg_Mon(DatM);
                end;
                if Fl_Error_Prog then  goto Mon_error;
        end;
       // Form2.ProgressBar1.Position:=Round(100*(AdrSec-Adr_ProgFlash_Start)/
       //                                       (Adr_ProgFlash_End-Adr_ProgFlash_Start));
        ProgressBarCnt:=ProgressBarCnt+1;
        ProgressBar1.Position:=ProgressBarCnt;
        Until Pos('S1',TestString)=0;
        CloseFile(RomFile);
  //çàïóñê
        FormISO.Prog_Run_Mon;
  // ñìåíà ñêîðîñòè
        EscapeCommFunction(hCOM, SETBREAK);
        sleep(1);
        EscapeCommFunction(hCOM, CLRBREAK);
        PurgeComm(hCOM, PURGE_TXABORT or PURGE_RXABORT or PURGE_TXCLEAR or PURGE_RXCLEAR);
        ReadFile(hCOM,ComBufIn,1,Bytes,nil);
        Com_Baudrate(57600);
        sleep(10);
        TestComBuf[1]:=Erase_Programm_Flash;
        WriteFile(hCOM,TestComBuf,1,Bytes,nil);
        ReadFile(hCOM,ComBufIn,2,Bytes,nil);
        if ((Bytes<>2) or (ComBufIn[1]<> ComBufIn[2]))  then goto Mon_error;
        Memo3.SelText:=IntToStr(ComBufIn[1])+' '+IntToStr(ComBufIn[2]);
        Memo3.Lines.Add('');
   // çàâåðøåíèå çàãðóçêè
        if  Fl_Error_Prog then
        begin
Mon_error:
        //Form2.Visible:=False;
        GroupBox48.Visible:= False;
        MsgBox( PChar('Îøèáêà çàãðóçêè ïðîãðàììàòîðà.'),
                               'Îøèáêà', MB_OK+MB_ICONERROR+MB_APPLMODAL);
        goto flashEnd;
        end;
 // çàïèñü
   if (FindFirst(Prog_File, faAnyFile, sr) <> 0) then
    begin
        MsgBox( PChar('Ôàéë ABS_Main.s19 íå íàéäåí.'),
              'Îøèáêà', MB_OK+MB_ICONERROR+MB_APPLMODAL);
        Button35Click(Sender);
    end;
        AssignFile(RomFile,Prog_File);
        Reset(RomFile);
   Label214.Caption:='Èäåò çàïèñü FLASH MOTOROLA';
   Label214.Repaint;
   ProgressBar1.Position:=0;
   CheckSumRom:=0;
        Repeat
        ReadLn(RomFile,TestString);
        If Pos('S1',TestString)<>0 then
        begin
                Form1.ProgressBar1.Position:=Round(100*Adr/$FFFF);
                Application.ProcessMessages;
                ByteCounter:=-3+HexToByte(TestString[3])*16+HexToByte(TestString[4]);
                Adr:= HexToByte(TestString[5])*4096+HexToByte(TestString[6])*256+
                      HexToByte(TestString[7])*16+HexToByte(TestString[8]);
                for loop:=0 to ByteCounter-1 do
                  begin
                  TestComBuf[loop+5]:=HexToByte(TestString[9+Loop*2])*16+HexToByte(TestString[10+Loop*2]);
                  CheckSumRom:=CheckSumRom+TestComBuf[loop+5];
                  end;
                FormISO.Programm_Flash_Mon(ByteCounter,Adr);
                if Fl_Error_Prog then  goto Prog_error;
        end;
        Until Pos('S1',TestString)=0;
        CloseFile(RomFile);
       // Form2.Visible:=False;
       GroupBox48.Visible:= False;
   // çàâåðøåíèå ïðîãðàììèðîâàíèÿ
        FormISO.LoadProg_End;
        if  {ByteCounter1}CheckSumRom<>(ComBufIn[5]*256*256+ComBufIn[6]*256+ComBufIn[7])
          then
Prog_error:
           begin
           MsgBox( PChar('Îøèáêà ïðîãðàììèðîâàíèÿ Flash.'),
                                'Îøèáêà', MB_OK+MB_ICONERROR+MB_APPLMODAL);
           goto flashEnd;
           end;
     {      else
           MsgBox( PChar('Ïðîãðàììèðîâàíèÿ Flash çàâåðøåíî.'),
                                '', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL); }

flashEnd:
        Com_Close;
        ProgStart.Down:=False;
        ProgStart.Enabled:=True;
        Fl_ProgStart:=False;
        exit;

end;

//------------------------  Flash DZ UpGrade  ------------------------------
procedure TForm1.PGM_Osc;
begin
    if Tip_Block < 8 then
    begin
     // DZ
     Form1.Label338.Caption:= 'Çàùèòà  FLASH = 0x'+ByteToHexStr(FPROT);
     Form1.Label334.Caption:='TRIM = 0x'+ ByteToHexStr(TRIM);
     // STM
     Form1.Label341.Caption:='CRC32 = ';
     CRC_STM:= ByteToHexStr(CRC_pgm_MC3[0])+
               ByteToHexStr(CRC_pgm_MC3[1])+
               ByteToHexStr(CRC_pgm_MC3[2])+
               ByteToHexStr(CRC_pgm_MC3[3]);
     Form1.Edit129.Text:= ' 0x'+ CRC_STM;
     // PA
     Form1.Label332.Caption:='CRC32 = ';
     CRC_PA:=       ByteToHexStr(CRC_pgm_MC2[0])+
                    ByteToHexStr(CRC_pgm_MC2[1])+
                    ByteToHexStr(CRC_pgm_MC2[2])+
                    ByteToHexStr(CRC_pgm_MC2[3]);
     Form1.Edit130.Text:= ' 0x'+ CRC_PA;
     Form1.Label329.Caption:='TRIM = 0x'+ ByteToHexStr(TRIM_PA);
     GroupBox1110.Visible:=False;
     CheckBox332.Visible:=False;
     CheckBox335.Visible:=False;
   end
   else
   begin
     Form1.Label341.Caption:='CRC32 = ';
     // MC1
     PGM_CRC_MC1:=ByteToHexStr(abPGM_CRC_MC1[0])+
                  ByteToHexStr(abPGM_CRC_MC1[1])+
                  ByteToHexStr(abPGM_CRC_MC1[2])+
                  ByteToHexStr(abPGM_CRC_MC1[3]);
     Form1.Edit129.Text:= ' 0x'+ PGM_CRC_MC1;
     // MC2
     Form1.Label668.Caption:='CRC32 = ';
     PGM_CRC_MC2:=ByteToHexStr(abPGM_CRC_MC2[0])+
                  ByteToHexStr(abPGM_CRC_MC2[1])+
                  ByteToHexStr(abPGM_CRC_MC2[2])+
                  ByteToHexStr(abPGM_CRC_MC2[3]);
     Form1.Edit426.Text:= ' 0x'+ PGM_CRC_MC2;
     GroupBox90.Visible:=False;
     GroupBox92.Visible:=False;
   end;

end;

procedure TForm1.Button56Click(Sender: TObject);
begin
        Form1.Label333.Caption:='';
        OpenDialog1.FileName:=ProgDZ_File;
        Opendialog1.InitialDir:=ExtractFilePath(ProgDZ_File);
        OpenDialog1.Filter:='s19|*.s19';
        if Opendialog1.Execute and  FileExists(Opendialog1.FileName) then
        begin
            ProgDZ_File:=Opendialog1.FileName;
            if ProgDZ_File<>'' then
            begin
                DiagIni.WriteString('Ôàéë ïðîãðàììèðîâàíèÿ DZ','DZ_s19_File',ProgDZ_File);
                Label333.Caption:='Ôàéë '+ProgDZ_File;
            end;
        end;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);

Var RomFile:TextFile;
    TestString,s19name:String;
    Loop,Adr,ByteCounter,RepeatCounter,i:Integer;
    sr: TSearchRec;

Label Label_Repeat,Label_End;

begin
    Form1.Memo3.Clear;
    Form1.Label337.Caption:='----';
    Form1.Memo3.Lines.Add('ÏÐÎÃÐÀÌÌÈÐÎÂÀÍÈÅ DZ');
    Fl_ProgStart:=false;
    if Not(Com_Connected_F) then
    begin
        Memo3.Lines.Add('Íå ìîãó çàïðîãðàììèðîâàòü !!! Îòñóòñòâóåò ñâÿçü ñ áëîêîì.');
        Exit;
    end;
    if MsgBox('Óâåðåíû â Çàïèñè Flash DZ ?',
            'Ïðåäóïðåæäåíèå', MB_OKCANCEL	+MB_ICONASTERISK +MB_APPLMODAL)
       = IDCANCEL	 then
    begin
        SpeedButton3.Down:=false;
        Exit;
    end;
    s19name:=ProgDZ_File;
    if (FindFirst(s19name, faAnyFile, sr) <> 0) then
    begin
        MsgBox( PChar('Ôàéë ABS_Main.s19 íå íàéäåí.'),
              'Îøèáêà', MB_OK+MB_ICONERROR+MB_APPLMODAL);
        exit;
    end;
    AssignFile(RomFile,s19name);
    Reset(RomFile);

// ñîõðàíåíèå äàííûõ S19 â áóôåðå
    Form1.Memo3.Lines.Add('Çàãðóçêà ôàéëà');
    SpeedButton3.Down:=true;
    Form1.FormDisable; //çàïðåò Form1
//  FF
    for i:=0 to 65536 do S19Buff[i]:= $FF;

//  îïðåäåëÿåì îáëàñòü çàïèñè
    if Form1.CheckBox135.Checked  then // Íå çàïèñûâàòü Const
// çàïèñûâàåì òîëüêî îáëàñòü ïðîãðàììû
       S19Start:=Program_Start  //  $2800 10240;
    else
    begin
      if Form1.CheckBox134.Checked  then // Íå çàïèñûâàòü Config
        // çàïèñûâàåì Const è îáëàñòü ïðîãðàììû
        S19Start:=ConstStart    //  $1C00 7168;
        else
        // çàïèñûâàåì âñå
        S19Start:=DumpMOTStart;   //  $1900 6400;
    end;
    ProgramDZ_Start:= S19Start;

// ÷òåíèå
    Repeat
     ReadLn(RomFile,TestString);
     if Pos('S1',TestString)<>0 then
     begin
       ByteCounter:=-3+HexToByte(TestString[3])*16+HexToByte(TestString[4]);
       Adr:= HexToByte(TestString[5])*4096+HexToByte(TestString[6])*256+
             HexToByte(TestString[7])*16+HexToByte(TestString[8]);
       if Adr >= S19Start then
         for loop:=0 to ByteCounter-1 do
         S19Buff[Adr+loop-S19Start]:= HexToByte(TestString[9+Loop*2])*16+
                                      HexToByte(TestString[10+Loop*2]);
     end;
    Until Pos('S1',TestString)=0;
    CloseFile(RomFile);

// TRIM
    S19Buff[adrNVFTRIM-S19Start]:= 1;
    S19Buff[adrNVFTRIM-S19Start+1]:= TRIM;
    ProgramDZ_End:=$FFFF;
    Label335.Caption:='EndAdrress =  0x'+ ByteToHexStr(ProgramDZ_End div 256)+
                                          ByteToHexStr(ProgramDZ_End mod 256);
    Label336.Caption:='StartAdrress = 0x'+ ByteToHexStr(ProgramDZ_Start div 256)+
                                           ByteToHexStr(ProgramDZ_Start mod 256);
// âûêëþ÷åíèå ðåëå ïîñëå Ðåñòàðòà
    ReleOFF_After_Reset;
    Kl15inh_Cnt_Set;
//ñíÿòèå çàùèòû Flash
    Form1.Memo3.Lines.Add('Cíÿòèå çàùèòû Flash');
    Flash_UnProtected_All:=true; // âñÿ Flash íåçàùèùåíà
    Flash_UnProtected_CFG:=false;
    FlashUnProtected;

//  Èíèöèàëèçàöèÿ
    Form1.Memo3.Lines.Add('Èíèöèàëèçàöèÿ');
    Fl_ProgROM:=true;
    Fl_ProgS19:=true;
    InitProg_Ask :=false;
    Fl_ComThread :=false;  // çàïðåøàåì ïîòîê Com
    MCnum := $11; // $11 - DZ
    FormISO.InitProgramm_Flash;
    repeat Application.ProcessMessages until InitProg_Ask;
    if PGM_Error_Ask then
    begin
        Form1.Memo3.Lines.Add('Ïîëó÷åí îòâåò îøèáêà');
        goto Label_End;
    end
    else
    begin
        Form1.Memo3.Lines.Add('Ïîëó÷åí îòâåò');
        Fl_ProgDZ:=true;
    end;
    Form2.Caption:='Çàïèñü âo Flash DZ';
    Form2.Label1.Caption:='Èäåò çàïèñü Flash';
    Form2.Label2.Caption:='Ïîæàëóéñòà ïîäîæäèòå 30 ñåêóíä';
    Form2.ProgressBar1.Position:=0;
    Form2.Visible:=True;
    Repeat_Cnt:=0;
    SectorNUM:=Round(($FFFF-S19Start)/SizeFlashSector); //   72
    PaketNum:=Round(SizeFlashSector/8);                 //   96
//  çàïèñü
    Form1.Memo3.Lines.Add('Çàïèñü âo Flash');
    SectorAdr:=S19Start;
    Sector:=0;
    for Sector:=0 to SectorNUM-1 do      //   0...71
    begin
Label_Repeat:
      Form2.ProgressBar1.Position:=Sector;
// ñòèðàíèå ñåòîðà
      for i:=0 to 7 do PaketData[i]:= S19Buff[SectorAdr+i-S19Start]; //i
      SectorAdr:=S19Start + Sector * SizeFlashSector;
      CmdProg_Ask:=false;
      FormISO.Send_Programm_ROM(Moto_ClearFlashEEPROM,SectorAdr);  // ñòèðàíèå ñåòîðà
      repeat Application.ProcessMessages until CmdProg_Ask;
      // îáðàáîòêà îøèáêè
      if PGM_Error_Ask then
      begin
         PGM_Error_Ask:=false;
         Form1.Memo3.Lines.Add('Íå ñòåðò ñåêòîð '+
                               IntToStr(Sector));
            // æäåì ïðèõîäà îò DZ îäíîãî áàéòà
            FormISO.PGM_Read_Null;
            repeat Application.ProcessMessages until PGM_Null_Ask;
	          goto Label_Repeat;
      end;
// çàïèñü ñåêòîðà
      for Paket:=0 to (PaketNum-1) do   //  0...95
         begin  // çàïèñü ïàêåòà
	       PaketAdr:=SectorAdr+Paket*8;  //àäðåñ â ïàêåòå
         for i:=0 to 7 do PaketData[i]:= S19Buff[PaketAdr+i-S19Start];
         CmdProg_Ask:=false;
         FormISO.Send_Programm_ROM(Moto_WriteFlashEEPROM,PaketAdr); // çàïèñü ïàêåòà
         repeat Application.ProcessMessages until CmdProg_Ask;
         // îáðàáîòêà îøèáêè
         if PGM_Error_Ask then
         begin
             PGM_Error_Ask:=false;
             Form1.Memo3.Lines.Add('Oøèáêà â ñåêòîðå '+
                                    IntToStr(Sector));
            // æäåì ïðèõîäà îò DZ îäíîãî áàéòà
            FormISO.PGM_Read_Null;
            repeat Application.ProcessMessages until PGM_Null_Ask;
	          goto Label_Repeat;
         end;
      end;
    end;
// çàâåðøåíî
    PaketData[0]:= PaketAdr div 256;
    PaketData[1]:= PaketAdr mod 256;
    CmdProg_Ask:=false;
    FormISO.Send_Programm_ROM($6E,SectorAdr); //êîìàíäà çàâåðøåíèÿ
    repeat Application.ProcessMessages until CmdProg_Ask;
    Form1.Memo3.Lines.Add('Çàïèñü âûïîëíåíà');
    Fl_ProgDZ:=false;
//Óñòàíîâêà çàùèòû Flash
    Fl_ProgROM:=false;       // ðàçðåøàåì ïîòîê Com
    Fl_ComThread :=true;     // ðàçðåøàåì  ïîòîê Com
    Form1.Memo3.Lines.Add('Óñòàíîâêà çàùèòû Flash');
    Form1.FormEnable; //ðàçðåøåíèå Form1
    FlashProtected;
 //   if Fl_FlashProtect_Compleet then
    Form1.Memo3.SelText:=('Ïðîãðàììèðîâàíèå çàâåðøåíî!');

// âûõîä
Label_End:
    Form1.Close_Form2; // çàêðûâàåì ôîðìó 2
    Fl_ProgROM:=false;       // ðàçðåøàåì ïîòîê Com
    Fl_ProgS19:=false;
    Fl_ComThread :=true;    // ðàçðåøàåì  ïîòîê Com
    Fl_ProgDZ:=false;
    SpeedButton3.Down:=false;
    Form1.FormEnable; //ðàçðåøåíèå Form1

// ñòèðàíèå îøèáîê
    FormISO.EraseError_EPROM;
// âêëþ÷åíèå ðåëå ïîñëå Ðåñòàðòà
    ReleON_After_Reset;
    Kl15inh_Cnt_Clr;

end;

procedure TForm1.Button32Click(Sender: TObject);
Var RomFile:TextFile;
    TestString,s19name:String;
    Loop,Adr,ByteCounter,RepeatCounter,i:Integer;
    sr: TSearchRec;

Label Label_Repeat,Label_End;

begin

    if Not(Com_Connected_F) then
    begin
        Memo1.Lines.Add('Íå ìîãó çàïðîãðàììèðîâàòü !!! Îòñóòñòâóåò ñâÿçü ñ áëîêîì.');
        Exit;
    end;
    s19name:=ExtractFilePath(Const_File)+'ABS_Main.s19';
    if (FindFirst(s19name, faAnyFile, sr) <> 0) then
    begin
        MsgBox( PChar('Ôàéë ABS_Main.s19 íå íàéäåí.'),
              'Îøèáêà', MB_OK+MB_ICONERROR+MB_APPLMODAL);
        exit;
    end;
    AssignFile(RomFile,s19name);
    Reset(RomFile);

// ñîõðàíåíèå äàííûõ S19 â áóôåðå
    Form1.Memo1.Clear;
    Form1.Memo1.Lines.Add('Ôàéë '+s19name);
    if MsgBox('Çàïèñü âo Flash DZ',
            'Ïðåäóïðåæäåíèå', MB_OKCANCEL	+MB_ICONASTERISK +MB_APPLMODAL)
       = IDCANCEL	 then Exit;
    Button32.Enabled:=false;
    GroupBox88.Enabled:=false;
    for i:=0 to 65536 do S19Buff[i]:= 255;
// çàïèñûâàåì òîëüêî îáëàñòü ïðîãðàììû c íåëüçÿ Const
    S19Start:=Program_Start;  //DumpMOTStart;//10240;
    Repeat
     ReadLn(RomFile,TestString);
     if Pos('S1',TestString)<>0 then
     begin
       ByteCounter:=-3+HexToByte(TestString[3])*16+HexToByte(TestString[4]);
       Adr:= HexToByte(TestString[5])*4096+HexToByte(TestString[6])*256+
             HexToByte(TestString[7])*16+HexToByte(TestString[8]);
       if Adr >= S19Start then
         for loop:=0 to ByteCounter-1 do
         S19Buff[Adr+loop-S19Start]:= HexToByte(TestString[9+Loop*2])*16+
                                      HexToByte(TestString[10+Loop*2]);
     end;
    Until Pos('S1',TestString)=0;
    CloseFile(RomFile);
// TRIM
    S19Buff[adrNVFTRIM-S19Start]:= 1;
    S19Buff[adrNVFTRIM-S19Start+1]:= TRIM;
//ñíÿòèå çàùèòû Flash
    Form1.Memo1.Lines.Add('Cíÿòèå çàùèòû Flash');
    Flash_UnProtected_All:=true; // âñÿ Flash íåçàùèùåíà
    Flash_UnProtected_CFG:=false;
    FlashUnProtected;

//  Èíèöèàëèçàöèÿ
    Form1.Memo1.Lines.Add('Èíèöèàëèçàöèÿ');
    Fl_ProgROM:=true;
    Fl_ProgS19:=true;
    InitProg_Ask :=false;
    MCnum := $11; // $11 - DZ
    FormISO.InitProgramm_Flash;  // $11 - DZ
    repeat Application.ProcessMessages until InitProg_Ask;
    Form1.Memo1.Lines.Add('Ïîëó÷åí îòâåò');

    Form2.Caption:='Çàïèñü âo Flash DZ S19';
    Form2.Label1.Caption:='Èäåò çàïèñü Flash';
    Form2.Label2.Caption:='Ïîæàëóéñòà ïîäîæäèòå';
    Form2.ProgressBar1.Position:=0;
    Form2.Visible:=True;

    SectorNUM:=Round(($FFFF-S19Start)/SizeFlashSector); //   72
    PaketNum:=Round(SizeFlashSector/8);                 //   96
//  çàïèñü
    Form1.Memo1.Lines.Add('Çàïèñü âo Flash');
    SectorAdr:=S19Start;
    Sector:=0;
    for Sector:=0 to SectorNUM-1 do      //   0...71
    begin
Label_Repeat:
      Form2.ProgressBar1.Position:=Sector;
// ñòèðàíèå ñåòîðà
      for i:=0 to 7 do PaketData[i]:= S19Buff[SectorAdr+i-S19Start]; //i
      SectorAdr:=S19Start + Sector * SizeFlashSector;
      CmdProg_Ask:=false;
      FormISO.Send_Programm_ROM(Moto_ClearFlashEEPROM,SectorAdr);  // ñòèðàíèå ñåòîðà
      repeat Application.ProcessMessages until CmdProg_Ask;
// çàïèñü ñåêòîðà
      for Paket:=0 to (PaketNum-1) do   //  0...95
         begin  // çàïèñü ïàêåòà
	       PaketAdr:=SectorAdr+Paket*8;  //àäðåñ â ïàêåòå
         for i:=0 to 7 do PaketData[i]:= S19Buff[PaketAdr+i-S19Start];
         CmdProg_Ask:=false;
         FormISO.Send_Programm_ROM(Moto_WriteFlashEEPROM,PaketAdr); // çàïèñü ïàêåòà
         repeat Application.ProcessMessages until CmdProg_Ask;
         // îáðàáîòêà îøèáêè
         if PGM_Error_Ask then
         begin
             Form1.Memo1.Lines.Add('îøèáêà');
             PGM_Error_Ask:=false;
	          // goto Label_Repeat;
            goto Label_End;
         end;
      end;
    end;
// çàâåðøåíî
    PaketData[0]:= PaketAdr div 256;
    PaketData[1]:= PaketAdr mod 256;
    CmdProg_Ask:=false;
    FormISO.Send_Programm_ROM($6E,SectorAdr); //êîìàíäà çàâåðøåíèÿ
    repeat Application.ProcessMessages until CmdProg_Ask;
    Form1.Memo1.Lines.Add('Çàïèñü âûïîëíåíà');
//Óñòàíîâêà çàùèòû Flash
    Fl_ProgROM:=false;       // ðàçðåøàåì ïîòîê Com
    Form1.Memo1.Lines.Add('Óñòàíîâêà çàùèòû Flash');
    FlashProtected;
    if Fl_FlashProtect_Compleet then
    Form1.Memo1.SelText:=('Ïðîãðàììèðîâàíèå çàâåðøåíî!');
// âûõîä
Label_End:
    Form1.Close_Form2;         // çàêðûâàåì ôîðìó 2
    Fl_ProgROM:=false;       // ðàçðåøàåì ïîòîê Com
    Fl_ProgS19:=false;
    Button32.Enabled:=true;  //o
    GroupBox88.Enabled:=true;
// ñòèðàíèå îøèáîê
    Fl_ClrErr_Message:=true;
    Form1.btnDelAllClick(nil);
    Fl_ClrErr_Message:=false;

end;

//------------------------  Flash STM UpGrade  ------------------------------
// âñïîìîãàòåëüíûå ïðîöåäóðû SpeedButton1Click
//---------------------------------------------------------------------------
procedure TForm1.Button54Click(Sender: TObject);
begin
   if Sender = Button54 then
   begin
        Form1.Label327.Caption:='';
        OpenDialog1.FileName:=ProgSTM_File;
        Opendialog1.InitialDir:=ExtractFilePath(ProgSTM_File);
        OpenDialog1.Filter:='bin|*.bin';
        if Opendialog1.Execute and  FileExists(Opendialog1.FileName) then
        begin
            ProgSTM_File:=Opendialog1.FileName;
            if ProgSTM_File<>'' then
            begin
                DiagIni.WriteString('Ôàèë ïðîãðàììèðîâàíèÿ STM','STMbin_File',ProgSTM_File);
                Label327.Caption:=ProgSTM_File;
            end;
        end;
   end;

   //if Sender = ELM1 then
   //begin
   //     Form1.Label664.Caption:='';
   //     OpenDialog1.FileName:=ProgSTM2_File;
   //     Opendialog1.InitialDir:=ExtractFilePath(ProgSTM2_File);
   //     OpenDialog1.Filter:='bin|*.bin';
   //     if Opendialog1.Execute and  FileExists(Opendialog1.FileName) then
   //     begin
   //         ProgSTM2_File:=Opendialog1.FileName;
   //         if ProgSTM2_File<>'' then
   //         begin
   //             DiagIni.WriteString('Ôàèë ïðîãðàììèðîâàíèÿ STM','STM2bin_File',ProgSTM2_File);
   //             Label664.Caption:=ProgSTM2_File;
   //         end;
   //     end;
   //end;
end;

//-------------------------------Load_STMbin_File------------------------------
function  Load_STMbin_File(BinName:String):boolean;
Var RomFile :File of Byte;
    i:Integer;
    sr: TSearchRec;
begin
    if MsgBox('Óâåðåíû â Çàïèñè Flash STM ?',
            'Ïðåäóïðåæäåíèå', MB_OKCANCEL	+MB_ICONASTERISK +MB_APPLMODAL)
       = IDCANCEL	 then
    begin
        Load_STMbin_File:=false;
        Exit;
    end;
    if (FindFirst(BinName, faAnyFile, sr) <> 0) then
    begin
        MsgBox( PChar('STMbin_File íå íàéäåí.'),
              'Îøèáêà', MB_OK+MB_ICONERROR+MB_APPLMODAL);
        Load_STMbin_File:=false;
        exit;
    end;
    AssignFile(RomFile,BinName);
    Reset(RomFile);
//
    Form1.Memo3.Lines.Add('Çàãðóçêà ôàéëà '+BinName);
    // çàïîëíÿåì áóôåð $FF ò.ê. â ôàéëå 0
    for i:=0 to (SizeFlashSTM-1) do BINBuff[i]:= $FF; //
    i:=0;
    Size_File:= FileSize(RomFile);
    while not Eof(RomFile) do
    begin
       Read(RomFile, BINBuff[i]);
       i:=i+1;
    end;
    Size_Buf:= i-1;
    LastByte:= BINBuff[Size_Buf];
    CloseFile(RomFile);
    if not Form1.CheckBox332.Visible then
    begin
    // íàõîäèì êîíåö îáëàñòè ïðîãðàììû  not v8
      i:=SizeFlashSTM -1;
      while BINBuff[i]=0 do
      begin
        i:= i-1;
      end;
      Size_Buf:= i; //SizeFlashSTM
      ProgramSTM_Start:= Start_ProgramSTM;
    end
    else ProgramSTM_Start:= Start_ProgramSTM_v8;
    //
    ProgramSTM_End:=((Size_Buf div SizeSectorSTM)+1)*SizeSectorSTM;
    SectorStart:= Round(ProgramSTM_Start/SizeSectorSTM);
    Load_STMbin_File:=true;
end;

// ------------------------Init_ProgUpGrate--------------------------------
procedure  Init_ProgUpGrate(ChB:boolean);
begin
      Fl_ProgLoaderSTM:= false;
      Fl_ProgCAN_STM:= false;
      if not ChB then
         FormISO.InitProgramm_Flash
      else //CAN
      begin
         Fl_ProgLoaderSTM:= true;
         Fl_ProgCAN_STM:= true;
         Tip_Block := 8;
         FormISO.Command_CANUSB($200A); // ïåðåâîä CANUSB â ïðîãðàììèðîâàíèå STM
         repeat Application.ProcessMessages until Cmd_CANUSB_Ask;
         if CANUSB_Error then
         begin
           Form1.Memo3.Lines.Add('Íåò îòâåòà CANUSB');
           PGM_Error_Ask:=true; // ïðè âûõîäå áóäåò goto Label_End;
         end
         else FormISO.InitProgramm_STM;
      end;
end;
// ---------------------------------ëîäûðü------------------------------------
procedure  Init_ProgLoader(ChB:boolean);
Var
    MCnum_Find:boolean;
    MC:Integer;
begin
     Tip_Block := 8;
     Fl_ProgLoaderSTM:= true;
     Fl_ProgCAN_STM:= false;
     if not ChB then
     begin
       Com_Init;
       Com_Baudrate(115200);
       Form1.Memo3.Lines.Add('Âêëþ÷èòå áëîê');
       Repeat_Cnt:=0;
       STM_Cnt:=0;
       // æäåì îòâåòà ïëàòû
       repeat
           LBool:= ReadFile(hCOM,Link_ProcBufIn,2,Bytes,nil);
           if (Bytes = 2) and (Link_ProcBufIn[2] = $33) then STM_Cnt:=STM_Cnt+1;
           if (Bytes = 2) and (Link_ProcBufIn[2] = $34) then STM_Cnt:=STM_Cnt+1;
           Link_ProcBufIn[2]:=0;
           Repeat_Cnt:=Repeat_Cnt+1;
       until ((STM_Cnt = 2) or (Repeat_Cnt = 100));
       // èíèöèàëèçàöèÿ
       Link_ProcBufOut[1]:=$73;
       Link_ProcBufOut[2]:=MCnum;//
       WriteFile(hCOM,Link_ProcBufOut,2,Bytes,nil);
       ReadFile(hCOM,Link_ProcBufIn,18,Bytes,nil);
       if ((Link_ProcBufIn[3] <> Init_Programm_Flash) or
           (Bytes <> 18))
       then PGM_Error_Ask:=true
       else PGM_Error_Ask:=false;
       InitProg_Ask:= true;
     end
     else
     begin  //CAN
     // äîëæíî ñòîÿòü ïåðåä CANUSB($200A) ò.ê. òàì CAN_Send_IniSTM_1();
       Form1.Memo3.Lines.Add('Âêëþ÷èòå áëîê');
       Repeat_Cnt:=0;
       MCnum_Find:=False;
       // æäåì îòâåòà ïëàòû 2x2=4
       repeat
           LBool:= ReadFile(hCOM,Link_ProcBufIn,4,Bytes,nil);
           if (Bytes = 4) and (Link_ProcBufIn[1] = $73)
                          and (Link_ProcBufIn[2] = MCnum) then MCnum_Find:=true;
           Repeat_Cnt:=Repeat_Cnt+1;
  //     until (MCnum_Find or  (Repeat_Cnt = 100));
       until ((Bytes = 4) or  (Repeat_Cnt = 100));
       // ïåðåâîä CANUSB â ïðîãðàììèðîâàíèå STM
  {     if(not MCnum_Find) then
       begin
         Form1.Memo3.Lines.Add('Íåò CAN îòâåòà STM '+IntToStr(MCnum));
         PGM_Error_Ask:=true;
       end
       else   }
  //            sleep(50);
       begin
       Fl_ProgCAN_STM:= true;
       FormISO.Command_CANUSB($200A); // ïåðåâîä CANUSB â ïðîãðàììèðîâàíèå STM
       repeat Application.ProcessMessages until Cmd_CANUSB_Ask;
       if CANUSB_Error then
       begin
           Form1.Memo3.Lines.Add('Íåò îòâåòà CANUSB');
           PGM_Error_Ask:=true;   //  ïðè âûõîäå áóäåò goto Label_End;
       end
       else FormISO.InitProgramm_STM;
       end;
    end;
end;

//---------------------îñíîâíàÿ ïðîöåóðà---------------------------------
procedure TForm1.SpeedButton1Click(Sender: TObject);
Var RomFile :File of Byte;
    TestString,BinName,T:String;
    Loop,Adr,ByteCounter,RepeatCounter, i,PN:Integer;
    sr: TSearchRec;
    ie : boolean;
    LB : LongBool;
Label Label_Repeat,Label_End;

begin
    Form1.Memo3.Clear;
    //---------------------STM1-----------------------------------
  if Sender = Form1.SpeedButton1 then
  begin
    Form1.Memo3.Lines.Add('ÏÐÎÃÐÀÌÌÈÐÎÂÀÍÈÅ STM 1');
    if (not(Com_Connected_F)) and (not(CheckBox332.Checked)) and
                                  (not(CheckBox335.Checked)) then
    begin
        Memo3.Lines.Add('Íå ìîãó çàïðîãðàììèðîâàòü !!! Îòñóòñòâóåò ñâÿçü ñ áëîêîì.');
        SpeedButton1.Down:=false;
        Exit;
    end;
    if (Com_Connected_F and (CheckBox332.Checked or
                             CheckBox335.Checked)) then
    begin
      Form1.BtnStopClick(nil);
      if CheckBox332.Checked then
      begin
        if MsgBox('Íåîáõîäèìî âûêëþ÷èòü áëîê',
            'Ïðåäóïðåæäåíèå', MB_OKCANCEL	+MB_ICONASTERISK +MB_APPLMODAL)
           = IDCANCEL	 then
        begin
          SpeedButton1.Down:=false;
          Exit;
        end;
      end;
    end;
    // çàãðóçêà STMbin_File
    if not Load_STMbin_File(ProgSTM_File) then
        begin
          SpeedButton1.Down:=false;
          Exit;
        end;
    // ïîäêëþ÷àåì CANUSB àäàïòåð
    if CheckBox335.Checked then
    begin
       if (USBopen.Caption='Closed') then
       Form1.USBopenClick(nil);

       if USBopen.Caption='Open'
       then Form1.Memo3.Lines.Add('Ïîäêëþ÷åí CANUSB àäàïòåð')
       else
       begin
          Form1.Memo3.Lines.Add('CANUSB àäàïòåð Íå ïîäêëþ÷åí!');
          SpeedButton1.Down:=false;
          Exit;
       end;
    end;
    // çàïîëíÿåì
    Label340.Caption:='EndAdrress =  0x08'+
                       ByteToHexStr( ProgramSTM_End div 65536)+
                       ByteToHexStr((ProgramSTM_End mod 65536) div 256)+
                       ByteToHexStr((ProgramSTM_End mod 65536)mod 256);
    Label339.Caption:='StartAdrress = 0x0800'+
                       ByteToHexStr(ProgramSTM_Start div 256)+
                       ByteToHexStr(ProgramSTM_Start mod 256);
    // Èíèöèàëèçàöèÿ
    Form1.Memo3.Lines.Add('Èíèöèàëèçàöèÿ');
    SpeedButton1.Down:=true;
    Form1.FormDisable; //çàïðåò Form1
    Fl_ProgSTM:=true;      // çàïðåøàåì ïîòîê Com
    Fl_ComThread :=false;  // çàïðåøàåì ïîòîê Com
    InitProg_Ask :=false;
    MCnum := $33; // $33 - STM
    // æåëåçî
    if (not(Form1.CheckBox332.Checked)) then
         Init_ProgUpGrate(Form1.CheckBox335.Checked)
    else // ------ëîäûðü--------
          Init_ProgLoader(Form1.CheckBox335.Checked);
    if (PGM_Error_Ask and Form1.CheckBox335.Checked)
    then goto Label_End;
   end; // end if Sender = Form1.SpeedButton1

   //---------------------STM2-----------------------------------
   if Sender = Form1.btn1 then
   begin
    Form1.Memo3.Lines.Add('ÏÐÎÃÐÀÌÌÈÐÎÂÀÍÈÅ STM 2');
    if (not(Com_Connected_F) and (not Form1.chk3.Checked) and
                                 (not(CheckBox334.Checked))) then
    begin
        Memo3.Lines.Add('Íå ìîãó çàïðîãðàììèðîâàòü !!! Îòñóòñòâóåò ñâÿçü ñ áëîêîì.');
        Form1.btn1.Down:=false;
        Exit;
    end;
    if (Com_Connected_F and (Form1.chk3.Checked or
                             CheckBox334.Checked)) then
    begin
      if MsgBox('Íåîáõîäèìî âûêëþ÷èòü áëîê',
            'Ïðåäóïðåæäåíèå', MB_OKCANCEL	+MB_ICONASTERISK +MB_APPLMODAL)
           = IDCANCEL	 then
      begin
        Form1.btn1.Down:=false;
        Exit;
      end;
    end;
    // çàãðóçêà STMbin_File
    if not Load_STMbin_File(ProgSTM2_File) then
    begin
        Form1.btn1.Down:=false;
        Exit;
    end;
    // ïîäêëþ÷àåì CANUSB àäàïòåð
    if CheckBox334.Checked then
    begin
       if (USBopen.Caption='Closed') then
       Form1.USBopenClick(nil);
       if USBopen.Caption='Open'
       then Form1.Memo3.Lines.Add('Ïîäêëþ÷åí CANUSB àäàïòåð')
       else
       begin
          Form1.Memo3.Lines.Add('CANUSB àäàïòåð Íå ïîäêëþ÷åí!');
          Form1.btn1.Down:=false;
          Exit;
       end;
    end;
    // çàïîëíÿåì
    Label667.Caption:='EndAdrress =  0x08'+
                       ByteToHexStr( ProgramSTM_End div 65536)+
                       ByteToHexStr((ProgramSTM_End mod 65536) div 256)+
                       ByteToHexStr((ProgramSTM_End mod 65536)mod 256);
    Label666.Caption:='StartAdrress = 0x0800'+
                       ByteToHexStr(ProgramSTM_Start div 256)+
                       ByteToHexStr(ProgramSTM_Start mod 256);
    // Èíèöèàëèçàöèÿ
    Form1.Memo3.Lines.Add('Èíèöèàëèçàöèÿ');
    btn1.Down:=true;
    Form1.FormDisable; //çàïðåò Form1
    Fl_ProgSTM:=true;      // çàïðåøàåì ïîòîê Com
    Fl_ComThread :=false;  // çàïðåøàåì ïîòîê Com
    InitProg_Ask :=false;
    MCnum := $34; // $34 - STM 2
    // æåëåçî
    if (not(Form1.chk3.Checked)) then
         Init_ProgUpGrate(Form1.CheckBox334.Checked)
    else // ------ëîäûðü--------
          Init_ProgLoader(Form1.CheckBox334.Checked);
    if (PGM_Error_Ask and Form1.CheckBox334.Checked)
    then goto Label_End;
   end;

   // ---------------------PGM-------------------------------
    repeat Application.ProcessMessages until InitProg_Ask;
    if PGM_Error_Ask then
    begin
        Form1.Memo3.Lines.Add('Ïîëó÷åí îòâåò îøèáêà '+IntToStr(Repeat_Cnt));
        Repeat_Cnt:=0;
        goto Label_End;
    end
    else
    begin
        Form1.Memo3.Lines.Add('Ïîëó÷åí îòâåò');
        Fl2_ProgSTM:=true;
  //     sleep(10);
    end;
    // ProgressBar
    Form2.Caption:='Çàïèñü âo Flash STM';
    Form2.Label1.Caption:='Èäåò çàïèñü Flash';
    if Tip_Block < 7
    then T:= IntToStr(Round(ProgramSTM_End/3000))
    else
    begin
      if not Fl_ProgCAN_STM then
             T:= IntToStr(Round(ProgramSTM_End/4500))
     else    T:= IntToStr(Round(ProgramSTM_End/3200));
    end;
    Form2.Label2.Caption:='Ïîæàëóéñòà ïîäîæäèòå '+T+' ñåêóíä';
    Form2.ProgressBar1.Position:=0;
    Form2.Visible:=True;
    SectorNUM:=Round(ProgramSTM_End/SizeSectorSTM);
    PaketNum:=Round(SizeSectorSTM/SizePaketSTM);    //  256
    //  çàïèñü

    if CheckBox337.Checked then
    begin
      //ïðîãðàìèðîâàíèå àäàïòåðîì áåç ÝÕÎ Tx - 39(0x27)  Rx - 2
      // StendSKU
      Fl_ProgLoaderSTM:=True;
      Fl_ProgCAN_STM:=True;
    end;

    Form1.Memo3.Lines.Add('Çàïèñü âo Flash');
    sleep(50);
    for Sector:=SectorStart to (SectorNUM-1) do      //   11...30
    begin
      Form2.ProgressBar1.Position:=Round(Sector *1.5);
      Repeat_Cnt:=0;
Label_Repeat:
      SectorAdr:=Sector * SizeSectorSTM;
      FormISO.Send_Programm_STM(Moto_ClearFlashEEPROM,SectorAdr);  // ñòèðàíèå ñåòîðà
      repeat Application.ProcessMessages until CmdProg_Ask;
// çàïèñü ñåêòîðà
      for Paket:=0 to (PaketNum-1) do   //  0...63
      begin  // çàïèñü ïàêåòà
	       PaketAdr:=SectorAdr+Paket*SizePaketSTM;  //àäðåñ â ïàêåòå
         for i:=0 to (SizePaketSTM-1) do PaketData[i]:= BINBuff[PaketAdr+i];
         FormISO.Send_Programm_STM(Moto_WriteFlashEEPROM,PaketAdr); // çàïèñü ïàêåòà
         repeat Application.ProcessMessages until CmdProg_Ask;
         // îáðàáîòêà îøèáêè
         if PGM_Error_Ask then
         begin
             PGM_Error_Ask:=false;
             Form1.FormEnable;     //ðàçðåøåíèå Form1
             Form1.Memo3.Lines.Add('Îøèáêà â ñåêòîðå '+IntToStr(Sector));
             Repeat_Cnt:=Repeat_Cnt+1;
             if Repeat_Cnt > 5 then
             begin
                Form1.Memo3.Lines.Add('UpGrade Failed');
                goto Label_End;
             end;
	           goto Label_Repeat;
         end;
      end;
    end;

// çàâåðøåíî
    FormISO.Send_Programm_STM($6E,SectorAdr); //êîìàíäà çàâåðøåíèÿ
    repeat Application.ProcessMessages until CmdProg_Ask;
    if not PGM_Error_Ask then
    sleep(50);
    Form1.Memo3.Lines.Add('Çàïèñü âûïîëíåíà');
// âûõîä
Label_End:
    Form1.Close_Form2;    // çàêðûâàåì ôîðìó 2
    Fl_ProgSTM:=false;    // ðàçðåøàåì ïîòîê Com
    Fl_ComThread :=true;  // ðàçðåøàåì  ïîòîê Com
    Fl2_ProgSTM:=false;
    SpeedButton1.Down:=false;
    Form1.btn1.Down:=false;
    Form1.FormEnable;     //ðàçðåøåíèå Form1
    if ((USBopen.Caption='Open') and (Fl_ProgCAN_STM)) then
        Form1.USBopenClick(nil)
    else
    if Fl_ProgLoaderSTM then
         Com_Close
    else
    begin
// ñòèðàíèå îøèáîê
// çàäåðæêà 1,5ñ íà ðåñòàðò STM
      ClrErr_Cnt:=0;
      repeat Application.ProcessMessages until ClrErr_Cnt>15;
      FormISO.EraseError_EPROM;
      if Tip_Block < 7 then
      begin
// âêëþ÷åíèå ðåëå ïîñëå Ðåñòàðòà
      ReleON_After_Reset;
      Kl15inh_Cnt_Clr;
      end;
    end;

end;

//------------------------  Flash PA UpGrade  ------------------------------
procedure TForm1.Button55Click(Sender: TObject);
begin
        Form1.Label328.Caption:='';
        OpenDialog1.FileName:=ProgPA_File;
        Opendialog1.InitialDir:=ExtractFilePath(ProgPA_File);
        OpenDialog1.Filter:='abs.s19|*.abs.s19';
        if Opendialog1.Execute and  FileExists(Opendialog1.FileName) then
        begin
            ProgPA_File:=Opendialog1.FileName;
            if ProgPA_File<>'' then
            begin
                DiagIni.WriteString('Ôàèë ïðîãðàììèðîâàíèÿ PA','PA_s19_File',ProgPA_File);
                Label328.Caption:=ProgPA_File;
            end;
        end;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
Var RomFile :TextFile;
    TestString,s19name:String;
    Loop,Adr,ByteCounter,RepeatCounter, i:Integer;
    sr: TSearchRec;
Label Label_End;

begin
    Form1.Memo3.Clear;
    Form1.Label337.Caption:='----';
    Fl_ProgStart:=false;
    Form1.Memo3.Lines.Add('ÏÐÎÃÐÀÌÌÈÐÎÂÀÍÈÅ PA');
    if not(Com_Connected_F) then
    begin
        Memo3.Lines.Add('Íå ìîãó çàïðîãðàììèðîâàòü !!! Îòñóòñòâóåò ñâÿçü ñ áëîêîì.');
        SpeedButton2.Down:=false;
        Exit;
    end;

    s19name:=ProgPA_File;
    if (FindFirst(s19name, faAnyFile, sr) <> 0) then
    begin
        MsgBox( PChar('Ôàéë skuPA_v03.abs.s19 íå íàéäåí.'),
              'Îøèáêà', MB_OK+MB_ICONERROR+MB_APPLMODAL);
        exit;
    end;
    AssignFile(RomFile,s19name);
    Reset(RomFile);
//
    SpeedButton2.Down:=true;
    Form1.FormDisable; //çàïðåò Form1
// ñîõðàíåíèå äàííûõ S19 â áóôåðå
    Form1.Memo3.Lines.Add('Çàãðóçêà ôàéëà '+s19name);
// çàïîëíÿåì áóôåð $FF ò.ê. â ôàéëå 0
    for i:=0 to (SizeFlashPA-1) do S19Buff[i]:= $FF; //
// çàïèñûâàåì òîëüêî îáëàñòü ïðîãðàììû c 0x3200
    TestString:=ProgPA_File;
    Delete(TestString,1,Pos('skuPA',TestString)+2);
    Delete(TestString,Pos('_v',TestString),Length(TestString));
    if TestString = 'PA32' then
    begin
      if MsgBox('Óâåðåíû â Çàïèñè Flash PA32 ?',
         'Ïðåäóïðåæäåíèå', MB_OKCANCEL	+MB_ICONASTERISK +MB_APPLMODAL)
        = IDCANCEL	 then
      begin
        SpeedButton2.Down:=false;
        Exit;
      end;
      ProgramPA_Start:= Start_ProgramPA32
    end
    else
    begin
      if MsgBox('Óâåðåíû â Çàïèñè Flash PA60 ?',
         'Ïðåäóïðåæäåíèå', MB_OKCANCEL	+MB_ICONASTERISK +MB_APPLMODAL)
        = IDCANCEL	 then
      begin
        SpeedButton2.Down:=false;
        Exit;
      end;
      ProgramPA_Start:= Start_ProgramPA;
    end;
    S19Start:=ProgramPA_Start;

    Repeat
     ReadLn(RomFile,TestString);
     if Pos('S1',TestString)<>0 then
     begin
       ByteCounter:=-3+HexToByte(TestString[3])*16+HexToByte(TestString[4]);
       Adr:= HexToByte(TestString[5])*4096+HexToByte(TestString[6])*256+
             HexToByte(TestString[7])*16+HexToByte(TestString[8]);
       if Adr >= S19Start then
         for loop:=0 to ByteCounter-1 do
         S19Buff[Adr+loop]:= HexToByte(TestString[9+Loop*2])*16+
                             HexToByte(TestString[10+Loop*2]);
     end;
    Until Eof(RomFile);  //Pos('S1',TestString)=0; íåëüçÿ â ôàéëå S0
    CloseFile(RomFile);

// ÷òåíèå TRIM è CRC32 â FormISO.ReadCRC32STM âûâîä â Form1.PGM_Osc
    S19Buff[adrNVFTRIM_PA]:= 1;
    S19Buff[adrNVFTRIM_PA+1]:= TRIM_PA;

// íàõîäèì êîíåö îáëàñòè ïðîãðàììû
    i:=$FF00; //SizeFlashPA-SizeSectorPA-1;
    while S19Buff[i]=$FF do
    begin
       i:= i-1;
       LastByte:= S19Buff[i-3];
    end;
    LastByte:= i;

    ProgramPA_End:=round(i/SizeSectorPA+1)*SizeSectorPA;
    Label330.Caption:='EndAdrress =  0x'+ ByteToHexStr(ProgramPA_End div 256)+
                                          ByteToHexStr(ProgramPA_End mod 256);
    Label331.Caption:='StartAdrress = 0x'+ ByteToHexStr(ProgramPA_Start div 256)+
                                           ByteToHexStr(ProgramPA_Start mod 256);
// âûêëþ÷åíèå ðåëå ïîñëå Ðåñòàðòà
    ReleOFF_After_Reset;
    Kl15inh_Cnt_Set;
// Èíèöèàëèçàöèÿ
    Form2.Caption:='Çàïèñü âo Flash PA';
    Form2.Label1.Caption:='Èäåò çàïèñü Flash';
    Form2.Label2.Caption:='Ïîæàëóéñòà ïîäîæäèòå 20 ñåêóíä';
    Form2.ProgressBar1.Position:=0;
    Form2.Visible:=True;
    Repeat_Cnt:=0;
    Form1.Memo3.Lines.Add('Èíèöèàëèçàöèÿ');
    Fl_ProgSTM:=true;    // çàïðåøàåì ïîòîê Com
    Fl_ComThread :=false;  // çàïðåøàåì ïîòîê Com
    InitProg_Ask :=false;
    MCnum := $22; // $22 - PA
    FormISO.InitProgramm_Flash;
    repeat Application.ProcessMessages until InitProg_Ask;
    if PGM_Error_Ask then
    begin
        Form1.Memo3.Lines.Add('Ïîëó÷åí îòâåò îøèáêà');
        goto Label_End;
    end
    else
    begin
        Form1.Memo3.Lines.Add('Ïîëó÷åí îòâåò');
        Fl_ProgPA:=true;
        sleep(100);
    end;
//
    // êîëè÷åñòâî çàïèñûâàåìûõ ñåêòîðîâ
    SectorNUM:=Round((ProgramPA_End-ProgramPA_Start)/SizeSectorPA);//  45
    PaketNum:=Round(SizeSectorPA/SizePaketPA);         //  64 = 512/8
    NumAllSector:= Round(SizeFlashPA/SizeSectorPA);    // 128 = 65536/512
    //íà÷àëüíûé ñåêòîð
    SectorStart:= Round(ProgramPA_Start/SizeSectorPA); // 25 = $3200 /512

//  çàïèñü
    Form1.Memo3.Lines.Add('Çàïèñü âo Flash');
    for Sector:=SectorStart to (SectorStart+SectorNUM-1) do  //   25...45
    begin
      Form1.PA_Write;
    end;
//  çàïèñü ñåêòîða âåêòîðîâ
     Form1.Memo3.Lines.Add('Çàïèñü Ñåêòîða âåêòîðîâ');
     Sector := NumAllSector-1; // ñåêòîð âåêòîðîâ 0xFE00
     Form1.PA_Write;

// çàâåðøåíî
    for i:=0 to (SizePaketPA-1) do PaketData[i]:= 0;
    SectorAdr:=$F000; // âòîðàÿ ïðîâåðêà çàâåðøåíèÿ
    FormISO.Send_Programm_PA($6E,SectorAdr); //êîìàíäà çàâåðøåíèÿ
    repeat Application.ProcessMessages until CmdProg_Ask;
    if not PGM_Error_Ask then
    sleep(50);
    Form1.Memo3.Lines.Add('Çàïèñü âûïîëíåíà');
    
// âûõîä
Label_End:
    Form1.Close_Form2;    // çàêðûâàåì ôîðìó 2
    Fl_ProgSTM:=false;    // ðàçðåøàåì ïîòîê Com
    Fl_ComThread :=true;  // ðàçðåøàåì  ïîòîê Com
    Fl_ProgPA:=false;
    Form1.FormEnable;     //ðàçðåøåíèå Form1
    SpeedButton2.Down:=false;
// ñòèðàíèå îøèáîê
// çàäåðæêà 0,5ñ íà ðåñòàðò PA
    ClrErr_Cnt:=0;
    repeat Application.ProcessMessages until ClrErr_Cnt > 5;
    FormISO.EraseError_EPROM;
// âêëþ÷åíèå ðåëå ïîñëå Ðåñòàðòà
    ReleON_After_Reset;
end;

procedure TForm1.PA_Write;
Label Label_Repeat;
begin
Label_Repeat:
      Form2.ProgressBar1.Position:=Sector;
      SectorAdr:=Sector * SizeSectorPA;
// ñòèðàíèå ñåòîðà
      for i:=0 to (SizePaketPA-1) do   //  0...31
                   PaketData[i]:= 0;
      // çàïîëíÿåì ïàêåò òàê ÷òîáû XOR íå áûë $AA
      PaketData[0]:= $A0;
      PaketData[1]:= $60;
      PaketData[2]:= Hi(SectorAdr);
      PaketData[3]:= Lo(SectorAdr);
      FormISO.Send_Programm_PA(Moto_ClearFlashEEPROM,SectorAdr);  // ñòèðàíèå ñåòîðà
      repeat Application.ProcessMessages until CmdProg_Ask;
      // îáðàáîòêà îøèáêè
      if PGM_Error_Ask then
      begin
           PGM_Error_Ask:=false;
           Form1.Memo3.Lines.Add('Íå ñòåðò ñåêòîð '+
                                 IntToStr(Sector));
            // æäåì ïðèõîäà îò DZ îäíîãî áàéòà
           FormISO.PGM_Read_Null;
           repeat Application.ProcessMessages until PGM_Null_Ask;
	         goto Label_Repeat;
      end;
      sleep(50);  // çàäåðæêà íà ñòèðàíèå
// çàïèñü ñåêòîðà
      for Paket:=0 to (PaketNum-1) do   //  0...63
      begin  // çàïèñü ïàêåòà
	       PaketAdr:=SectorAdr+Paket*SizePaketPA;  //àäðåñ â ïàêåòå
         for i:=0 to (SizePaketPA-1) do PaketData[i]:= S19Buff[PaketAdr+i];
         FormISO.Send_Programm_PA(Moto_WriteFlashEEPROM,PaketAdr); // çàïèñü ïàêåòà
         repeat Application.ProcessMessages until CmdProg_Ask;
         // îáðàáîòêà îøèáêè
         if PGM_Error_Ask then
         begin
            PGM_Error_Ask:=false;
            Form1.Memo3.Lines.Add('Îøèáêà â ñåêòîðå '+
                                    IntToStr(Sector));
            // æäåì ïðèõîäà îò DZ îäíîãî áàéòà
            FormISO.PGM_Read_Null;
            repeat Application.ProcessMessages until PGM_Null_Ask;
	          goto Label_Repeat;
         end;
      end;
end;

procedure TForm1.CheckBox135Click(Sender: TObject);
begin
    if Form1.CheckBox135.Checked  then
    begin
          Form1.CheckBox134.Checked:=true;
          Form1.CheckBox134.Visible:=false;
    end
    else  Form1.CheckBox134.Visible:=true;
end;


procedure TForm1.LProbegClick(Sender: TObject);
begin
    if Not(Com_Connected_F) then Exit;
    if Tip_Block < 8  then
    begin
    FormISO.ReadCANVAR2;
    RunWay:= Round(CAN_HDRH_Distance/20);
    if MsgBox('Óâåðåíû â Çàïèñè Ïðîáåãà',
            'Ïðåäóïðåæäåíèå', MB_OKCANCEL	+MB_ICONASTERISK +MB_APPLMODAL)
       = IDCANCEL	 then Exit;
      if CAN_HDRH_Distance > 0 then FormISO.RunawaySave;
    end
    else
    begin
     if MsgBox('Óâåðåíû â Çàïèñè Ïðîáåãà',
            'Ïðåäóïðåæäåíèå', MB_OKCANCEL	+MB_ICONASTERISK +MB_APPLMODAL)
       = IDCANCEL	 then Exit;
     FormISO.RunawaySave;
    end;  
end;

procedure TForm1.Button58Click(Sender: TObject);
begin
     Fl_ProgROM:=true;   // îñòàíîâêà îáìåíà â Com_Thread
     Fl_ProgS19:=false;
     Form1.Memo1.Clear;
     Button58.Enabled:=false;
     Form1.Memo1.Lines.Add('Cíÿòèå çàùèòû Flash');
// ñíÿòèå çàùèòû Flash
     Flash_UnProtected_All:=false; // Ïðîãðàììà çàùèùåíà
     Flash_UnProtected_CFG:=false;
     FlashUnProtected;
     Form1.Memo1.Lines.Add('Çàùèòà Flash ñíÿòà');
     Fl_ProgROM:=false; // ðàçðåøàåì ïîòîê Com
     Fl_ProgS19:=false;
     Button58.Enabled:=true;
end;

procedure TForm1.Button57Click(Sender: TObject);
begin
     Fl_ProgROM:=true;   // îñòàíîâêà îáìåíà â Com_Thread
     Fl_ProgS19:=false;
     Form1.Memo1.Clear;
     Button57.Enabled:=false;
     Form1.Memo1.Lines.Add('Óñòàíîâêà çàùèòû Flash');
//Óñòàíîâêà çàùèòû Flash
     FlashProtected;
     if Fl_FlashProtect_Compleet then
     begin
       Form1.Memo1.Lines.Add('Çàùèòà Flash óñòàíîâëåíà');
     end;
     Fl_ProgROM:=false; // ðàçðåøàåì ïîòîê Com
     Fl_ProgS19:=false;
     Button57.Enabled:=true;
end;

procedure  TForm1.CheckBox_140;
begin
       if CheckBox140.Checked then
             CheckBox140.Caption:='Çíàê ïîïðàâêè +'
       else  CheckBox140.Caption:='Çíàê ïîïðàâêè --';
       if CheckBox228.Checked then
             CheckBox228.Caption:='Deccel  50 - 15 km/h'
       else  CheckBox228.Caption:='Deccel  45 - 15 km/h';
       if CheckBox232.Checked then
             CheckBox232.Caption:='Äèñê'
       else  CheckBox232.Caption:='Áàðàáàí';
       if CheckBox233.Checked then
             CheckBox233.Caption:='Äèñê'
       else  CheckBox233.Caption:='Áàðàáàí';
       if CheckBox241.Checked then
             CheckBox241.Caption:='Çíàê  +  Koef  dP(P)'
       else  CheckBox241.Caption:='Çíàê  --  Koef  dP(P)';
       if CheckBox257.Checked then
             CheckBox257.Caption:='6 m/c2'
       else  CheckBox257.Caption:='4 m/c2';
       if CheckBox136.Checked then
             begin
             CheckBox136.Caption:='Press (Load_Fz)';
             Edit190.Enabled:=false;
             Edit191.Enabled:=false;
             end
       else  begin
             CheckBox136.Caption:='Press (Load_K1)';
             Edit190.Enabled:=true;
             Edit191.Enabled:=true;
             end;
       if CheckBox264.Checked then
             CheckBox264.Caption:='Brake Tout Îãðàíè÷åíèå Plim'
       else  CheckBox264.Caption:='Brake Tout Âûêëþ÷åíèå  Poff';
       if CheckBox158.Checked then
             CheckBox158.Caption:='TSC êîíòðîëü îáîðîòîâ'
       else  CheckBox158.Caption:='TSC êîíòðîëü ìîìåíòà';
       if CheckBox265.Checked then
             CheckBox265.Caption:='TCO Stop Disable ASR'
       else  CheckBox265.Caption:='TCO Stop Enable ASR';
       if CheckBox267.Checked then
             begin
             CheckBox267.Caption:='PWM on';
             Edit192.Enabled:=true;
             Edit193.Enabled:=true;
             Edit69.Enabled:=true;
             Edit63.Enabled:=true;
             Edit105.Enabled:=true;
             end
       else  begin
             CheckBox267.Caption:='PWM off';
             Edit192.Enabled:=false;
             Edit193.Enabled:=false;
             Edit69.Enabled:=false;
             Edit63.Enabled:=false;
             Edit105.Enabled:=false;
             end;
       if CheckBox218.Checked then
             CheckBox218.Caption:='OFF dAy '+ Edit99.Text+'m/c2'
       else  CheckBox218.Caption:='OFF dAy 0.25m/c2';

       if CheckBox269.Checked then
             begin
             CheckBox269.Caption:='Äàâëåíèå îò çàãðóçêè  Ê';
             Edit298.Enabled:=true;
             end
       else  begin
             CheckBox269.Caption:='Çàãðóçêà íå ó÷èòûâàåòñÿ'; //Çàâèñèìîñòü Load Off
             Edit298.Enabled:=false;
             end;

       if CheckBox212.Checked then
             begin
             CheckBox212.Caption:='Çàäàííàÿ ïîäêà÷êà';
             Edit97.Enabled:=true;
             Edit164.Enabled:=true;
             end
       else  begin
             CheckBox212.Caption:='Ïîäêà÷êà îò çàãðóçêè';
             Edit97.Enabled:=false;
             Edit164.Enabled:=False;
             end;

       if CheckBox263.Checked then
             begin
             CheckBox263.Caption:='           Äàâëåíèÿ  K';
             Edit335.Enabled:=true;
             end
       else  begin
             CheckBox263.Caption:='Ìîìåíò îò äàâëåíèÿ';
             Edit335.Enabled:=false;
             end;
       if CheckBox166.Checked then
             CheckBox166.Caption:='ModelStr StatusPA'
       else  CheckBox166.Caption:='ModelStr StatusKL';
       if CheckBox115.Checked then
             CheckBox115.Caption:='Vx Ôèëüòð 1Hz'
       else  CheckBox115.Caption:='Vx Ôèëüòð 2Hz';
       if CheckBox216.Checked then
             CheckBox216.Caption:='MIR always'
       else  CheckBox216.Caption:='MIR Low Mu';
       if CheckBox225.Checked then
             CheckBox225.Caption:='ExhM Ph3 only'
       else  CheckBox225.Caption:='ExhM Clasic';
       if CheckBox274.Checked then
             CheckBox274.Caption:='TP2  My_Main'
       else  CheckBox274.Caption:='TP2  My_Tick';
         if CheckBox174.Checked then
             CheckBox174.Caption:='Kîíòðîëü îáîðîòîâ'
       else  CheckBox174.Caption:='Kîíòðîëü ìîìåíòà';
       if CheckBox239.Checked then
             CheckBox239.Caption:='Ìîäåëü'
       else  CheckBox239.Caption:='Êîíñòàíòà';
       if CheckBox288.Checked then
             CheckBox288.Caption:='Always'
       else  CheckBox288.Caption:='Only Brake';
       if CheckBox293.Checked then
             CheckBox293.Caption:='GearBox Automatic'
       else  CheckBox293.Caption:='GearBox Mechanical';
       if CheckBox294.Checked then
             CheckBox294.Caption:='Çàäàíèå TSC Torque'
       else  CheckBox294.Caption:='Îãðàíè÷åíèå TSC Torque';
       if CheckBox208.Checked then
             CheckBox208.Caption:='Trailer Press Sens AUX2'
       else  begin
             CheckBox208.Caption:='Trailer Press Sens Stop';
             CheckBox209.Caption:='Break Press Sens CAN';
             CheckBox209.Checked:= true;
             end;
       if CheckBox209.Checked then
             CheckBox209.Caption:='Break Press Sens CAN'
       else  begin
             CheckBox209.Caption:='Break Press Sens Stop';
             CheckBox208.Caption:='Trailer Press Sens AUX2';
             CheckBox208.Checked:= true;
             end;

       if CheckBox299.Checked then
       begin
             CheckBox299.Caption:='Ðàçúåì íàçàä';
             CheckBox299.Color:=clBtnFace;
             CheckBox73.Checked:= true;
             CheckBox81.Checked:= true;
    //         DumpMOT[58]:=DumpMOT[58] or 192;
       end
       else
       begin
             CheckBox299.Caption:='Ðàçúåì âïåðåä';
             CheckBox299.Color:=clAqua;
             CheckBox73.Checked:= false;
             CheckBox81.Checked:= false;
     //        DumpMOT[58]:=DumpMOT[58] and 63;
       end;
       // Ñåíñîð SAS
       if CheckBox357.Checked then
       begin
             CheckBox357.Caption:='Ðàçúåì Ââåðõ';
             CheckBox357.Color:=clBtnFace;
             CheckBox80.Checked:= true;
       end
       else
       begin
             CheckBox357.Caption:='Ðàçúåì Âíèç';
             CheckBox357.Color:=clAqua;
             CheckBox80.Checked:= false;
       end;

       if CheckBox302.Checked then
             CheckBox302.Caption:='BPS íà Óñêîðèòåëüíîì êëàïàíå'
       else  CheckBox302.Caption:='BPS íà Òîðìîçíîì êðàíå';

       if CheckBox131.Checked  then
       begin
           CheckBox131.Caption:='Ïíåâìî ïîäâåñêà';
           Label364.Visible:=true;
           Edit405.Visible:=true;
       end
       else
       begin
           CheckBox131.Caption:='Ðåññîðíàÿ';
           Label364.Visible:=false;
           Edit405.Visible:=false;
       end;

       if CheckBox328.Checked then
             CheckBox328.Caption:='ïî äàò÷èêó'
       else  CheckBox328.Caption:='ïî ìîäåëè';

end;

procedure TForm1.CheckBox140Click(Sender: TObject);
begin
       Form1.CheckBox_140;
       Form1.ParamChange(nil);
end;

procedure TForm1.Button60Click(Sender: TObject);
begin
     WriteTrailerPress(StrToInt(Form1.Edit229.Text));
     DSCPulsPress_Com:=35;
     FormISO.DSC_PulsPress;
end;

procedure TForm1.Button61Click(Sender: TObject);
begin
     if Tip_Block < 8
     then DSCPulsPress_Com:=36
     else DSCPulsPress_Com:=34;
     FormISO.DSC_PulsPress;
     ShowMessage('Ïðîâåðüòå âûïîëíåíèå â Tåñòû Òÿãà÷ VDC');
end;

procedure TForm1.Button62Click(Sender: TObject);
begin
     if Tip_Block < 8
     then DSCPulsPress_Com:=37
     else DSCPulsPress_Com:=32;
     FormISO.DSC_PulsPress;
     ShowMessage('Ïðîâåðüòå âûïîëíåíèå â Tåñòû Òÿãà÷ VDC');
end;

procedure TForm1.Button65Click(Sender: TObject);
begin
     clrStateAGS := True;
     Form1.Button1Click(Sender);
     Form1.Dump_SKU_CFG;
end;

procedure TForm1.Button69Click(Sender: TObject);
begin
     // Êàëèáðîâêè ECAS Ps
     if Sender = Button69 then DSCPulsPress_Com:=39;
     //Áëîêèðîâêà Èíèöèàëèçàöèè
     if Sender = Wr2 then DSCPulsPress_Com:=48;
     //Ñáðîñ ñàìîíàñòðîåê
     if Sender = Wr3 then DSCPulsPress_Com:=49;
     //äèàãíîñòè÷åñêàÿ óñòàíîâêà ïðîáåãà
     if Sender = Wr4 then DSCPulsPress_Com:=71;
     FormISO.DSC_PulsPress;
end;

procedure TForm1.Button72Click(Sender: TObject);
begin
     clrStateAGS := True;
     Fl_Clr_VIN:= True;
     Form1.Label32.Caption:='Íåò èíôîðìàöèè';
     Form1.Label38.Caption:='Íåò èíôîðìàöèè';
     Form1.Label39.Caption:='Íåò èíôîðìàöèè';
     Form1.Label33.Caption:='Íåò èíôîðìàöèè';
     Form1.Button1Click(Sender);
end;

procedure TForm1.Label513Click(Sender: TObject);
begin
     //Ââîä â ýêñïëóàòàöèþ
     Fl_Message_VIN:=true;
     Authorized_Cmpl:=false;
     Form9.Left:=Form1.Left+Form1.Width+6;
     Form9.Top:=Form1.Top;
     Form9.Visible:=true;
     Form1.stat1.SimpleText:='Âûïîëíÿåòñÿ Ââîä â ýêñïëóàòàöèþ';
end;

procedure TForm1.Label20Click(Sender: TObject);
begin
    //Ìîäåëü
    Exit;
    GroupBox151.Visible:=true;
 //   GroupBox153.Visible:=true;
    FL_Vehicle:=false;
    GroupBox153.Caption:='';
    Ok.Enabled:=false;
end;

procedure TForm1.Label21Click(Sender: TObject);
begin
    // VIN
    Exit;
    GroupBox152.Visible:=true;
    GroupBox153.Visible:=true;
    FL_Vehicle:=false;
    GroupBox153.Caption:='';
    Button64.Enabled:=false;
end;

procedure TForm1.OkClick(Sender: TObject);
var Eng, WMI, Year :string;
begin
    FL_Model:=false;
    FL_VIN:=false;
    if (Form1.Edit255.Text <> '') and
       (Form1.Edit256.Text <> '') and
       (Form1.Edit257.Text <> '') and
       (Form1.Edit258.Text <> '') then
    begin
       VehicleModel:=StrToInt(Form1.Edit255.Text);
       Eng:= Form1.Edit256.Text;
       if Eng = 'C0' then  VehicleEngine:=1;
       if Eng = '28' then  VehicleEngine:=2; // Weichai Power China
       if Eng = '18' then  VehicleEngine:=3; // Mersedes-Benz 435 ë.ñ. Euro-3
       if Eng = '19' then  VehicleEngine:=4; // Mersedes-Benz 435 ë.ñ. Euro-34
       if Eng = 'B2' then  VehicleEngine:=5; // Euro-4 230 ë.ñ.
       if Eng = 'B3' then  VehicleEngine:=6; // Euro-4 250 ë.ñ.
       if Eng = 'B5' then  VehicleEngine:=7; // Euro-4 330 ë.ñ.
       if Eng = 'B8' then  VehicleEngine:=8; // Euro-4 400 ë.ñ.
       if Eng = 'B9' then  VehicleEngine:=9; // Euro-4 412 ë.ñ.
       if Eng = 'E2' then  VehicleEngine:=10; // Euro-5 230 ë.ñ.
       if Eng = 'E3' then  VehicleEngine:=11; // Euro-5 250 ë.ñ.
       if Eng = 'E5' then  VehicleEngine:=12; // Euro-5 330 ë.ñ.
       if Eng = 'E8' then  VehicleEngine:=13; // Euro-5 400 ë.ñ.
       if Eng = 'E9' then  VehicleEngine:=14; // Euro-5 412 ë.ñ.
       if Eng = '40' then  VehicleEngine:=15; // Weichai Power China WP4.1NQ190E50
       VehicleComplect:=StrToInt(Form1.Edit257.Text);
       VehicleModif:=StrToInt(Form1.Edit258.Text);

//   VehicleModel
     DumpMOT[224]:= VehicleModel div 256;
     DumpMOT[225]:= VehicleModel mod 256;
//   VehicleComplect
     DumpMOT[226]:= VehicleComplect div 256;
     DumpMOT[227]:= VehicleComplect mod 256;
// VehicleModif
     DumpMOT[228] := VehicleModif;
//  VehicleEngine
     DumpMOT[229] := VehicleEngine;

       FL_Model:=true;
   //    ViewModel;
       if not FL_Vehicle then
       GroupBox151.Visible:=false;
    end;

    if (Form1.Edit262.Text <> '') and
       (Form1.Edit259.Text <> '') and
       (Form1.Edit260.Text <> '') and
       (Form1.Edit261.Text <> '') and
       (Form1.Edit263.Text <> '') then
    begin
       WMI:= Form1.Edit262.Text;
       if WMI = 'NAE' then  VehicleManuf:=1 //Maziran Co (IR) Èðàí
       else
       if WMI = 'XTM' then  VehicleManuf:=2 //Íå èñïîëüçóåòñÿ
       else
       if WMI = 'Y3M' then  VehicleManuf:=3 //ÌÀÇ ÀÎ (BLR)
       else
       if WMI = 'Y6D' then  VehicleManuf:=4 // ÇÀÇ ÇÀÎ Óêðàèíà
       else
       begin
       end;
       Year:= Form1.Edit263.Text;
       //G H I J K L M N O P Q R S T V X Y Z
       VehicleYear:=16;
       if Year = 'H' then  VehicleYear:=17;
       if Year = 'J' then  VehicleYear:=18;
       if Year = 'K' then  VehicleYear:=19;
       if Year = 'L' then  VehicleYear:=20;
       if Year = 'M' then  VehicleYear:=21;
       if Year = 'N' then  VehicleYear:=22;
       if Year = 'P' then  VehicleYear:=23;
       if Year = 'R' then  VehicleYear:=24;
       if Year = 'S' then  VehicleYear:=25;
       if Year = 'T' then  VehicleYear:=26;
       if Year = 'V' then  VehicleYear:=27;
       if Year = 'W' then  VehicleYear:=28;
       if Year = 'X' then  VehicleYear:=29;
       if Year = 'Y' then  VehicleYear:=30;
       if Year = '1' then  VehicleYear:=31;
       if Year = '2' then  VehicleYear:=32;
       if Year = '3' then  VehicleYear:=33;
       if Year = '4' then  VehicleYear:=34;
       if Year = '5' then  VehicleYear:=35;
       if Year = '6' then  VehicleYear:=36;
       if Year = '7' then  VehicleYear:=37;
       if Year = '8' then  VehicleYear:=38;
       if Year = '9' then  VehicleYear:=39;
       if Year = 'A' then  VehicleYear:=40;
       if Year = 'B' then  VehicleYear:=41;
       if Year = 'C' then  VehicleYear:=42;
       if Year = 'D' then  VehicleYear:=43;
       if Year = 'E' then  VehicleYear:=44;
       if Year = 'F' then  VehicleYear:=45;
       if Year = 'G' then  VehicleYear:=46;

       VehicleNumber:=StrToInt(Form1.Edit261.Text);
//  VehicleManuf
     DumpMOT[230] := VehicleManuf;
// VehicleYear
     DumpMOT[231] := VehicleYear;
// VehicleNumber
     DumpMOT[232] := (VehicleNumber  div 65536) div 256;
     DumpMOT[233] := (VehicleNumber  div 65536) mod 256;
     DumpMOT[234] := (VehicleNumber  mod 65536) div 256;
     DumpMOT[235] := (VehicleNumber  mod 65536) mod 256;
       FL_VIN:=true;
       ViewVIN;
       if not FL_Vehicle then
       GroupBox152.Visible:=false;
    end;
    if not FL_Vehicle then
       GroupBox153.Visible:=false;
end;

procedure TForm1.Edit264Enter(Sender: TObject);
begin
 {   if Form1.Edit265.Text <>'' then
          CFG_SetCod:=StrToInt(Form1.Edit265.Text)
    else  CFG_SetCod:=0;
    if (CFG_SetCod <> 0) and (CFG_SetCod <> 255) then
         Button64.Enabled:=true
    else
    Button64.Enabled:=false;  }
end;

procedure TForm1.ViewVIN;
 Var   n: integer;
       C: string;
begin
   if Com_Connected_F then
   begin
    Fl_MAN_Poz:=False;
    if VIN_Manuf = 'NAE' then
    begin
       Form1.Label38.Caption:='MazIran Co (IR) Èðàí';
       if (VIN_Model <> #0#0#0#0) then
       Form1.Label32.Caption:='MazIran '+VIN_Model+'-'+VIN_Engine;
    end;
    if (VIN_Manuf = 'XTM') or
       (VIN_Manuf = 'Y3M') then
    begin
       Form1.Label38.Caption:='ÌÀÇ ÀÎ (BLR)';
       if (VIN_Model <> #0#0#0#0) then
       Form1.Label32.Caption:='ÌÀÇ '+VIN_Model+'-'+VIN_Engine;
    end;

    if VIN_Manuf = 'Y6D' then
    begin
       Form1.Label38.Caption:='ÇÀÇ ÇÀÎ Óêðàèíà';
       if (VIN_Model <> #0#0#0#0) then
       Form1.Label32.Caption:='ÌÀÇ ÇÀÇ '+VIN_Model+'-'+VIN_Engine;
    end;
    if (VIN_Manuf = 'Y3F') or
       (VIN_Manuf = 'Y3K') then
    begin
       Form1.Label38.Caption:='ÎÀÎ ÌÇÊÒ (BLR)';
       if (VIN_Model <> #0#0#0#0) then
       Form1.Label32.Caption:='ÌÇÊÒ '+VIN_Model+'-'+VIN_Engine;
    end;
    if VIN_Manuf = 'Y3J' then
    begin
       Form1.Label38.Caption:='BKM HOLDING (BLR) ';
       if (VIN_Model <> #0#0#0#0) then
       Form1.Label32.Caption:='BKM '+VIN_Model+'-'+VIN_Engine;
    end;
    if VIN_Manuf = 'Y3N' then
    begin
       Form1.Label38.Caption:='ÑÏ ÇÀÎ ÌÀÇ-ÌÀÍ (BLR) ';
       if (VIN_Model <> #0#0#0#0) then
       Form1.Label32.Caption:='ÌÀÇ-ÌÀÍ '+VIN_Model+'-'+VIN_Engine;
       Fl_MAN_Poz:=True;
    end;
    Form1.Label32.Refresh;

    //Vehicle_Modification
    if  ((Pos('-',Vehicle_Modification)<>0) and
         (VIN_Model <> #0#0#0#0))
    then
    begin
      if Fl_MAN_Poz
      then Form1.Label643.Left:= 225
      else Form1.Label643.Left:= 200;
      Form1.Label643.Caption:= Vehicle_Modification;
    end
    else
    begin
      Form1.Label643.Left:= 220;
      Form1.Label643.Caption:= '';
    end;

    if VIN_Year ='H'  then Form1.Label39.Caption:='2017';
    if VIN_Year ='J'  then Form1.Label39.Caption:='2018';
    if VIN_Year ='K'  then Form1.Label39.Caption:='2019';
    if VIN_Year ='L'  then Form1.Label39.Caption:='2020';
    if VIN_Year ='M'  then Form1.Label39.Caption:='2021';
    if VIN_Year ='N'  then Form1.Label39.Caption:='2022';
    if VIN_Year ='P'  then Form1.Label39.Caption:='2023';
    if VIN_Year ='R'  then Form1.Label39.Caption:='2024';
    if VIN_Year ='S'  then Form1.Label39.Caption:='2025';
    if VIN_Year ='T'  then Form1.Label39.Caption:='2026';
    if VIN_Year ='V'  then Form1.Label39.Caption:='2027';
    if VIN_Year ='W'  then Form1.Label39.Caption:='2028';
    if VIN_Year ='X'  then Form1.Label39.Caption:='2029';
    if VIN_Year ='Y'  then Form1.Label39.Caption:='2030';
    if VIN_Year ='1'  then Form1.Label39.Caption:='2031';
    if VIN_Year ='2'  then Form1.Label39.Caption:='2032';
    if VIN_Year ='3'  then Form1.Label39.Caption:='2033';
    if VIN_Year ='4'  then Form1.Label39.Caption:='2034';
    if VIN_Year ='5'  then Form1.Label39.Caption:='2035';
    if VIN_Year ='6'  then Form1.Label39.Caption:='2036';
    if VIN_Year ='7'  then Form1.Label39.Caption:='2037';
    if VIN_Year ='8'  then Form1.Label39.Caption:='2038';
    if VIN_Year ='9'  then Form1.Label39.Caption:='2039';
    if VIN_Year ='A'  then Form1.Label39.Caption:='2040';
    if VIN_Year ='B'  then Form1.Label39.Caption:='2041';
    if VIN_Year ='C'  then Form1.Label39.Caption:='2042';
    if VIN_Year ='D'  then Form1.Label39.Caption:='2043';
    if VIN_Year ='E'  then Form1.Label39.Caption:='2044';
    if VIN_Year ='F'  then Form1.Label39.Caption:='2045';
    if VIN_Year ='G'  then Form1.Label39.Caption:='2046';
    // VIN
    if Vehicle_VIN <> '00000000000000000' then
         Form1.Label33.Caption:=Vehicle_VIN
    else Form1.Label33.Caption:='Íåò èíôîðìàöèè';

    if (SetCod <> 0) and
       (SetCod <> 255) and
       (Vehicle_VIN <> '00000000000000000') and
       (VIN_Manuf<> '000') and
       (VIN_Model<> '0000') and
   //    (VIN_Engine <> '00') and
       (VIN_Year<> '0') and
       (VIN_Num<> '0000000')
        then
    begin
      if SetCod < 10 then C:= '00'+ IntToStr(SetCod)
      else
      if SetCod < 100 then C:= '0'+ IntToStr(SetCod)
      else C:= IntToStr(SetCod);
      Label514.Color:=clBtnFace;
      Label514.Caption:='Âûïîëíåí'+' êîä '+C;
    end
    else
    begin
       if not Fl_VIN_CFG then Label514.Color:=clRed
                         else Label514.Color:=clBtnFace;
       Label514.Caption:='Íå âûïîëíåí';
       if (not Fl_Message_VIN) and
          (not Fl_Clr_VIN)  then
       begin
         Form1.Label513Click(nil);
       end;
    end;
    // Êàëèáðîâêà äàò÷èêîâ
    if (DSC_Flags4s and 3) = 3 then
    begin
      Label520.Color:=clBtnFace;
      Label520.Caption:='Âûïîëíåíà';
 //     Authorized_Cmpl:=true;
    end
    else
    begin
      if not Fl_VIN_CFG then Label520.Color:=clRed
                        else Label520.Color:=clBtnFace;
      Label520.Caption:='Íå âûïîëíåíà';
    end;
   end;
end;

procedure TForm1.Button64Click(Sender: TObject);
begin
     Form1.SaveVIN;
end;

procedure TForm1.SaveVIN;
var
   CFG_File,CFG_Model,TestString:String;
   Loop:Integer;
begin
    if not Com_Connected_F then
    begin
       ShowMessage('Íåîáõîäèìî óñòàíîâèòü ñâÿçü ñ áëîêîì');
       exit;
    end;
{    if (CFG_SetCod = 0) or
       (CFG_SetCod = 255) then
    begin
       ShowMessage('Íåâåðíûå äàííûå ïðîòîêîëà');
       exit;
    end;}
    //
    Form1.stat1.SimpleText:='Âûïîëíÿåòñÿ Çàïèñü Êîíôèãóðàöèè. Ïîäîæäèòå 10ñ.';
    if Vehicle_VIN_CFG_F9 <> ''
    then Vehicle_VIN_CFG:= Vehicle_VIN_CFG_F9
    else Vehicle_VIN_CFG:= Form1.Edit262.Text+Form1.Edit259.Text+
                           Form1.Edit260.Text+Form1.Edit263.Text+
                           Form1.Edit261.Text;
    if (Length(Vehicle_VIN_CFG) < 17) or
       (Length(Vehicle_VIN_CFG) > 17) then
    begin
       ShowMessage('Íåâåðíûé VIN');
       exit;
    end;
    // çàãðóçêà êîíôèãóðàöèè
    if VIN_Model_F9 <> ''
    then CFG_Model:= VIN_Model_F9
    else CFG_Model:= Form1.Edit259.Text+Form1.Edit260.Text;
    if Type_VIN_New
    then CFG_File:= CFGfile_Path+CFGfile_Name+'.asm'
    else CFG_File:= IniPath+'CFG_MAZ_'+CFG_Model+'_v0'+IntToStr(VER_PO)+'.asm';
    if FileExists(CFG_File) then
    begin
       AssignFile(ConfigFile,CFG_File);
       Reset(ConfigFile);
       for Loop:=0 to SizeDumpMOT do
       begin
          ReadLn(ConfigFile,TestString);
          DumpMOT[Loop]:=StrToInt(TestString);
       end;//
       CloseFile(ConfigFile);
       Fl_VIN_CFG:=true;
       TabSheet8Show(nil);
    end
    else
    begin
       ShowMessage('Ôàéë êîíôèãóðàöèè íå íàéäåí');
       exit;
    end;
    if not Type_VIN_New then
    begin
      if MsgBox(Pchar('Çàãðóæåí Ôàéë êîíôèãóðàöèè '+CFG_Model),
        'Ïðåäóïðåæäåíèå', MB_OkCancel+MB_ICONASTERISK+MB_APPLMODAL) = idCancel
      then Exit;
    end;
    CFG_SetCod:=StrToInt(Form9.Edit265.Text);
    Form1.FormDisable;
    Form1.Button1Click(nil); //Óñòàíîâèòü
    Form1.FormEnable;
           TabSheet8Show(nil);
end;

procedure TForm1.TabSheet8Exit(Sender: TObject);
begin
     Form1.TabSheet8.Highlighted :=False;
     Form1.TabSheet26.Highlighted :=false;
     Form1.TabSheet22.Highlighted :=false;
     Form1.TabSheet18.Highlighted :=false;
     Form1.TabSheet14.Highlighted :=false;
     Form1.TabSheet13.Highlighted :=false;
     Form1.TabSheet10.Highlighted :=false;
     Form1.TabSheet9.Highlighted  :=false;
     Form1.TabSheet19.Highlighted :=false;
     Form1.TabSheet20.Highlighted :=false;
     Form1.TabSheet21.Highlighted :=false;
     Form1.TabSheet15.Highlighted :=false;
     Form1.TabSheet25.Highlighted :=false; //Êîíôèãóðàöèÿ
     Form1.TabSheet27.Highlighted :=false; // Ïíåâìàòèêà
     Form1.TabSheet24.Highlighted :=false; //  ABS
     Form1.TabSheet31.Highlighted :=false; //  Validation
     Form1.TabSheet30.Highlighted :=false; //  UTIL
     Form1.TabSheet28.Highlighted :=false; //   Not Used
     Form1.TabSheet29.Highlighted :=false; //  AGS
end;

procedure TForm1.TabSheet8Enter(Sender: TObject);
begin
   Form1.TabSheet8.Highlighted :=true;
end;

procedure TForm1.Highlight(TabSheet: TTabSheet);
begin
    if   TabSheet.Enabled
    then TabSheet.Highlighted :=true  // 
    else TabSheet.Highlighted :=false;
end;


procedure TForm1.PageControl2Change(Sender: TObject);
begin
     Form1.TabSheet26.Highlighted :=false;
     Form1.TabSheet22.Highlighted :=false;
     Form1.TabSheet18.Highlighted :=false;
     Form1.TabSheet14.Highlighted :=false;
     Form1.TabSheet13.Highlighted :=false;
     Form1.TabSheet10.Highlighted :=false;
     Form1.TabSheet9.Highlighted  :=false;
     case PageControl2.ActivePage.PageIndex of
     0: Highlight(TabSheet9);   //Form1.TabSheet9.Highlighted :=true;
     1: Highlight(TabSheet10);  //Form1.TabSheet10.Highlighted :=true;
     2: Highlight(TabSheet13);  // Íàñòðîéêà ABS
     3: Highlight(TabSheet18);  // Íàñòðîéêà ESP
     4: Highlight(TabSheet14);  // Íàñòðîéêà ÀSR
     5: Highlight(TabSheet26);  // Íàñòðîéêà EBL
     6: Highlight(TabSheet22);  // Expert
     end;
end;

procedure TForm1.PageControl4Change(Sender: TObject);
begin
        Form1.TabSheet8.Highlighted :=true;
        Form1.TabSheet18.Highlighted :=true;  // Íàñòðîéêà ESP
        Form1.TabSheet19.Highlighted :=false;
        Form1.TabSheet20.Highlighted :=false;
        Form1.TabSheet21.Highlighted :=false;
        Form1.TabSheet15.Highlighted :=false;
        case PageControl4.ActivePage.PageIndex of
          0: Highlight(TabSheet19);  //Ïàðàìåòðû
          1: Highlight(TabSheet20);  //ROP
          2: Highlight(TabSheet21);  //DYC
          3: Highlight(TabSheet15);  //Form1.TabSheet15.Highlighted :=true;
        end;
end;

procedure TForm1.PageControl5Change(Sender: TObject);
begin
        Form1.TabSheet8.Highlighted :=true;
        Form1.TabSheet22.Highlighted :=true; //Expert
        Form1.TabSheet25.Highlighted :=false; //Êîíôèãóðàöèÿ
        Form1.TabSheet27.Highlighted :=false; // Ïíåâìàòèêà
        Form1.TabSheet24.Highlighted :=false; //  ABS
        Form1.TabSheet31.Highlighted :=false; //  Validation
        Form1.TabSheet30.Highlighted :=false; //  UTIL
        Form1.TabSheet28.Highlighted :=false; //   Not Used
        Form1.TabSheet29.Highlighted :=false; //  AGS
        Form1.TabSheet32.Highlighted :=false; //  SAS
        Form1.ts1.Highlighted :=false; //  LIM
        case PageControl5.ActivePage.PageIndex of
          0: Highlight(TabSheet25);  //Kîíôèãóðàöèÿ
          1: Highlight(TabSheet27);  // Ïíåâìàòèêà
          2: Highlight(TabSheet24);  //  ABS
          3: Highlight(TabSheet31);  //  Validation
          4: Highlight(TabSheet30);  //  UTIL
          5: Highlight(TabSheet28);  //  Not Used
          6: Highlight(TabSheet29);  //  AGS
          7: Highlight(TabSheet32);  //  SAS
          8: Highlight(ts1);  //  LIM
        end;
end;

procedure TForm1.CheckBox227Click(Sender: TObject);
begin
    if  Form1.CheckBox227.Checked  then  GroupBox187.Visible:=true
                                   else  GroupBox187.Visible:=false;
end;


procedure TForm1.rg1Click(Sender: TObject);
begin
        case rg1.ItemIndex of
          0: Form1.Edit343.Text :='0,75';  // 215/75R17.5
          1: Form1.Edit343.Text :='0,78';  // 235/75R17.5
          2: Form1.Edit343.Text :='0,83';  // 245/70R19.5
          3: Form1.Edit343.Text :='0,94';  // 275/70R22.5
          4: Form1.Edit343.Text :='1,03';  // 295/80R22.5
          5: Form1.Edit343.Text :='1,00';  // 315/70R22.5
          6: Form1.Edit343.Text :='1,06';  // 315/80R22.5
          7: Form1.Edit343.Text :='0,99';  // 385/55R22.5
          8: Form1.Edit343.Text :='1,07';  // 385/65R22.5
        end;
end;

procedure TForm1.Edit27Click(Sender: TObject);
begin
          Form1.Edit27.Text := Form1.Edit343.Text;
end;

procedure TForm1.Edit22Click(Sender: TObject);
begin
         Form1.Edit22.Text := Form1.Edit343.Text;
end;

procedure TForm1.Edit175Click(Sender: TObject);
begin
        Form1.Edit175.Text := Form1.Edit343.Text;
end;


procedure TForm1.Edit343Click(Sender: TObject);
begin
    Form1.Edit343.Text := FloatToStrF(
                          ((StrToInt(Form1.Edit344.Text) *
                            StrToInt(Form1.Edit345.Text) /50 +
                            StrToFloat(Form1.Edit346.Text) * 25.4)/1000),
                           ffFixed,5,2);
end;


procedure TForm1.Button66Click(Sender: TObject);
begin
     DSCPulsPress_Com:=129;
     FormISO.DSC_PulsPress;
end;

procedure TForm1.Button67Click(Sender: TObject);
begin
 //    CAN_VIN_DA:=StrToInt(Form1.Edit361.Text);
     CAN_DA_Fl:= False;
     Adr_CAN_DA:= StrToInt(Form1.Edit361.Text);;
     FormISO.WriteVIN_DA;
     repeat Application.ProcessMessages until CAN_DA_Fl;
     DSCPulsPress_Com:=130;
     FormISO.DSC_PulsPress;
end;

procedure TForm1.Button68Click(Sender: TObject);
begin
     DSCPulsPress_Com:=131;
     FormISO.DSC_PulsPress;
end;

procedure TForm1.Edit229Change(Sender: TObject);
begin
     Form1.ConfigOsc;
end;

procedure TForm1.Button70Click(Sender: TObject);
begin
     DSCPulsPress_Com:=132;
     FormISO.DSC_PulsPress;
end;

procedure TForm1.Button71Click(Sender: TObject);
begin
 //    Adr_CAN_ECUID_DA:=StrToInt(Form1.Edit370.Text);
     CAN_DA_Fl:= False;
     Adr_CAN_DA:= StrToInt(Form1.Edit370.Text);
     FormISO.WriteVIN_DA;
     repeat Application.ProcessMessages until CAN_DA_Fl;
     DSCPulsPress_Com:=133;
     FormISO.DSC_PulsPress;
end;


procedure TForm1.Button73Click(Sender: TObject);
begin
     GroupBox153.Visible:=false;
end;

procedure TForm1.ButtonXBR2Click(Sender: TObject);
begin
     GroupBox151.Visible:=false;
end;

procedure TForm1.rg5Click(Sender: TObject);
begin
  Case rg5.ItemIndex of
       0: Form1.Edit142.Text:='33'; //
       1: Form1.Edit142.Text:='39'; //
       2: Form1.Edit142.Text:='33'; //
   end;
end;

procedure TForm1.Test2Click(Sender: TObject);
Var Cnt,Loop: integer;
Label Label_Repeat;
begin
    Cnt:=0;
    if Test2.Caption = 'Stop'then
    begin
      Test2.Caption := 'Start';
      FormISO.Command_CANUSB($2005);
      repeat Application.ProcessMessages until Cmd_CANUSB_Ask;
    end
    else
    begin
      Test2.Caption := 'Stop';
      FormISO.Command_CANUSB($2006);
      repeat Application.ProcessMessages until Cmd_CANUSB_Ask;
    end;
end;

//------------------------  Flash CANUSB UpGrade  ----------------------------
procedure TForm1.UpGradeClick(Sender: TObject);
Var RomFile :File of Byte;
    TestString,BinName:String;
    Loop,Adr,ByteCounter,RepeatCounter, i:Integer;
    sr: TSearchRec;
    ie : boolean;

Label Label_Repeat,Label_End, Label_Ask;

begin
    if Fl_UpGradeSTM then exit;
    MainStatBar.Panels[0].Text := 'UpGrade CANUSB àäàïòåðà';
    if not CAN_USB_Open then
    begin
        MainStatBar.Panels[0].Text := 'Îòñóòñòâóåò ñâÿçü ñ CAN_USB';
        MainStatBar.Refresh;
        Exit;
    end;
    Fl_CAN_USB:=False;
    Test1.Caption:='Stop';
    Test3.Caption:='Stop';
    if Test2.Caption = 'Start'then
       Form1.Test2Click(nil);
    Test2.Enabled:=False;
    USBopen.Enabled:=False;
    Test1.Enabled:=False;
    Test3.Enabled:=False;
    sleep(50);
    // Ôàéë ïðîãðàììèðîâàíèÿ CANUSB àäàïòåðà
    if UpGrade_File <> '' then
         BinName:= UpGrade_File
    else begin
       MainStatBar.Panels[0].Text := 'CAN_USB.bin File íå íàéäåí';
       exit;
     //   BinName:='G:\!23_Projekt\CAN_USB_Adapter\CAN_USB\Debug\CAN_USB.bin';
    end;
    if (FindFirst(BinName, faAnyFile, sr) <> 0) then
    begin
        MsgBox( PChar('CAN_USB.bin File íå íàéäåí.'),
              'Îøèáêà', MB_OK+MB_ICONERROR+MB_APPLMODAL);
        goto Label_End;
    end;
    AssignFile(RomFile,BinName);
    Reset(RomFile);
    UpGrade_File:=BinName;
    Size_FlashSTM:= 61440;  //$F000
    Size_SectorSTM:= 2048;  //Edit380.Text:=IntToStr(Size_SectorSTM);
    if Edit380.Text <> '' then Size_SectorSTM:=StrToInt(Edit380.Text)
    else begin
       MainStatBar.Panels[0].Text := 'Íå çàäàí FLASH PAGE SIZE';
       goto Label_End;;
    end;
// çàïîëíÿåì áóôåð 0
    for i:=0 to Size_FlashSTM do BINBuff[i]:= 0; //

    i:=0;
    Size_File:= FileSize(RomFile);
    while not Eof(RomFile) do
    begin
       Read(RomFile, BINBuff[i]);
       i:=i+1;
    end;
    CloseFile(RomFile);
// çàïîëíÿåì êîíåö áóôåðà $FF ò.ê. â ôàéëå 0
    i:=Size_FlashSTM-Size_SectorSTM-1;
    while BINBuff[i] = 0 do
    begin
       BINBuff[i]:= $FF;
       i:= i-1;
    end;
    Size_Buf:= i+1;
    LastByte:= BINBuff[i];
    //
    ProgramSTM_Start:=Start_ProgramSTM;
    ProgramSTM_End:=(Round(Size_Buf/Size_SectorSTM)+1)*Size_SectorSTM;
    SectorStart:= Round(ProgramSTM_Start/Size_SectorSTM);
    SectorNUM:=Round(ProgramSTM_End/Size_SectorSTM);
    PaketNum:=Round(Size_SectorSTM/SizePaketSTM);    //  32
    Edit377.Text:=IntToStr(ProgramSTM_End);
    if ProgramSTM_End >= Size_FlashSTM then
    begin
      MainStatBar.Panels[0].Text := 'UpGrade Failed';
      goto Label_End;
    end;
// Èíèöèàëèçàöèÿ
    FormISO.Init_UpGrade;
    repeat Application.ProcessMessages until InitProg_Ask;
    if PGM_Error_Ask then
    begin
        MainStatBar.Panels[0].Text := 'Ïîëó÷åí îòâåò îøèáêà';
        goto Label_End;
    end;
     sleep(20);
     Fl_UpGradeSTM:=True;
//
    Form2.Caption:='Çàïèñü âo Flash STM CANUSB';
    Form2.Label1.Caption:='Èäåò çàïèñü Flash';
    Form2.Label2.Caption:='Ïîæàëóéñòà ïîäîæäèòå';
    Form2.ProgressBar1.Position:=0;
    Form2.Visible:=True;

//  çàïèñü  CANUSB àäàïòåðà
    for Sector:=SectorStart to (SectorNUM-1) do      //   11...30
    begin
      Form2.ProgressBar1.Position:=Round(Sector *1.5);
      Repeat_Cnt:=0;
Label_Repeat:
 // ñòèðàíìå ñåêòîðà
      SectorAdr:=Sector * Size_SectorSTM;
      FormISO.Command_UpGrade(Moto_ClearFlashEEPROM,SectorAdr);  // ñòèðàíèå ñåòîðà
      repeat Application.ProcessMessages until CmdProg_Ask;
 // çàïèñü ñåêòîðà
      for Paket:=0 to (PaketNum-1) do   //  0...63
      begin  // çàïèñü ïàêåòà
	       PaketAdr:=SectorAdr+Paket*SizePaketSTM;  //àäðåñ â ïàêåòå
         for i:=0 to (SizePaketSTM-1) do PaketData[i]:= BINBuff[PaketAdr+i];
         FormISO.Command_UpGrade(Moto_WriteFlashEEPROM,PaketAdr); // çàïèñü ïàêåòà
         repeat Application.ProcessMessages until CmdProg_Ask;
         // îáðàáîòêà îøèáêè
         if PGM_Error_Ask then
         begin
             PGM_Error_Ask:=false;
             Form1.FormEnable;     //ðàçðåøåíèå Form1
             MainStatBar.Panels[0].Text := 'Îøèáêà â ñåêòîðå '+IntToStr(Sector);
             Repeat_Cnt:=Repeat_Cnt+1;
             if Repeat_Cnt > 5 then
             begin
                MainStatBar.Panels[0].Text := 'UpGrade Failed';
                goto Label_End;
             end;
	           goto Label_Repeat;
         end;
      end;
    end;
// çàâåðøåíî CANUSB
    FormISO.Command_UpGrade($6E,SectorAdr); //êîìàíäà çàâåðøåíèÿ
    repeat Application.ProcessMessages until CmdProg_Ask;
    Form1.USBopenClick(nil); // çàêðûâàåì ïîðò COM2
    MainStatBar.Panels[0].Text := 'Çàïèñü CANUSB âûïîëíåíà';
// âûõîä
Label_End:
    Form1.Close_Form2; // çàêðûâàåì ôîðìó 2
    USBopen.Enabled:=true;
    Fl_CAN_USB:=true;
end;


procedure TForm1.Edit378DblClick(Sender: TObject);
begin
        OpenDialog1.FileName:=UpGrade_File;
        Opendialog1.InitialDir:=ExtractFilePath(UpGrade_File);
        OpenDialog1.Filter:='bin|*.bin';
        if Opendialog1.Execute and  FileExists(Opendialog1.FileName)
        then
        begin
            UpGrade_File:=Opendialog1.FileName;
            if UpGrade_File <>'' then
            begin
                DiagIni.WriteString('Ôàéë ïðîãðàììèðîâàíèÿ CANUSB àäàïòåðà','Bin_File',UpGrade_File);
                Edit378.Text:=UpGrade_File;
            end;
        end;
end;

procedure TForm1.Edit374DblClick(Sender: TObject);
begin
    if MsgBox('Èçìåíèòü íîìåð Com ?',
            'Ïðåäóïðåæäåíèå', MB_OKCANCEL	+MB_ICONASTERISK +MB_APPLMODAL)
       = IDCANCEL	 then Exit
    else
    begin
       UpGrade_ComNum:= StrToInt(Edit374.Text);
       DiagIni.WriteInteger('UpGrade_Serial', 'Com', UpGrade_ComNum);
    end;
end;

procedure TForm1.Edit379DblClick(Sender: TObject);
begin
    if MsgBox('Èçìåíèòü Baudrate ?',
            'Ïðåäóïðåæäåíèå', MB_OKCANCEL	+MB_ICONASTERISK +MB_APPLMODAL)
       = IDCANCEL	 then Exit
    else
    begin
       UpGrade_ComBaudrate:= StrToInt(Edit379.Text);
       DiagIni.WriteInteger('UpGrade_Serial', 'Baudrate', UpGrade_ComBaudrate);
    end;
end;

procedure TForm1.USBopenClick(Sender: TObject);
Var
  Loop: integer;
  Str: string;
begin
    if USBopen.Caption='Closed' then
    begin
       MainStatBar.Panels[0].Text := '';
       Edit374.Text:=IntToStr(UpGrade_ComNum);
       Com2_Init;
       Edit379.Text:=IntToStr(UpGrade_ComBaudrate);
       Com_Baudrate(UpGrade_ComBaudrate);
       if Fl_ComCreate then  CAN_USB_Open:=true
       else
       begin
         MainStatBar.Panels[0].Text := 'Com'+Edit374.Text+' not Open';
         CAN_USB_Open:=false;
         exit;
       end;
       Test2.Enabled:=True;
       Test1.Enabled:=True;
       Test3.Enabled:=True;
       UpGrade.Enabled:=True;
       CANUSB_Rx_Cnt:=0;
       //repeat
          FormISO.Command_CANUSB($2001);
          repeat Application.ProcessMessages until Cmd_CANUSB_Ask;
      // until not CANUSB_Error;
       if CANUSB_Error then
       begin
         MainStatBar.Panels[0].Text := 'CANUSB àäàïòåð íå îòâå÷àåò';
 //        exit;
       end;
       MainStatBar.Panels[0].Text := 'Ïîäêëþ÷åí CANUSB àäàïòåð';
       USBopen.Caption:='Open';
       // ÷òåíèå UID
       FormISO.Command_CANUSB($2002);
       repeat Application.ProcessMessages until Cmd_CANUSB_Ask;
       if not CANUSB_Error then
       begin
         Str:='';
         for Loop:=1 to 4 do
         Str:=Str+ByteToHexStr(Buf.Osc[Loop+1]);
         Chip_WAF_NUM:=Str;
         Str:='';
         for Loop:=5 to 8 do //12 do
         begin
           if Buf.Osc[Loop+1] > 31 then
         Str:=Str+Chr(Buf.Osc[Loop+1]);
         end;
         Chip_LOT_NUM:=Str;
         Label612.Caption:=Chip_WAF_NUM+' '+Chip_LOT_NUM;
       end;
       // ÷òåíèå CRC
       FormISO.Command_CANUSB($2003);
       repeat Application.ProcessMessages until Cmd_CANUSB_Ask;
       if not CANUSB_Error then
       begin
         Str:='0x';
         For Loop:=1 to 4 do
         Str:=Str+ByteToHexStr(Buf.Osc[Loop+1]);
         Edit376.Text:= Str;
         Size_SectorSTM:= Buf.Osc[6]*256 +Buf.Osc[7];
         Edit380.Text:=IntToStr(Size_SectorSTM);
         Str:='0x';
         For Loop:=1 to 4 do
         Str:=Str+ByteToHexStr(Buf.Osc[Loop+7]);
         Edit449.Text:= Str;
       end;
    end
    else
    begin
       if Test2.Caption = 'Start'
       then Form1.Test2Click(nil);
       Com_Close;
       CAN_USB_Open:=false;
       Fl_CAN_USB:=false;
       Fl_UpGradeSTM:=false;
       USBopen.Caption:='Closed';
       Test1.Caption:='Stop';
       Test3.Caption:='Stop';
       Test2.Caption:='Stop';
       MainStatBar.Panels[0].Text:= '';
       Test2.Enabled:=False;
       Test1.Enabled:=False;
       Test3.Enabled:=False;
       UpGrade.Enabled:=False;
    end;
end;

procedure TForm1.Test1Click(Sender: TObject);
Var Loop: integer;
    Str: string;
Label Label_Repeat;
begin
    if Test1.Caption='Stop' then
    begin
       if CAN_USB_Open then  Fl_CAN_USB:=true;
Label_Repeat:
       if Fl_CAN_USB then
       begin
         Test1.Caption:='Start';
         FormISO.Command_CANUSB($2004);
         repeat Application.ProcessMessages until Cmd_CANUSB_Ask;
         if not CANUSB_Error then
  {     Link_ProcBufOut[1]:=$55;
        WriteFile(hCOM,Link_ProcBufOut,1,Bytes,nil);  }
           begin
           Edit375.Text:=IntToStr(CANUSB_Rx_Cnt);
           Str:='';
           For Loop:=1 to 13 do
           Str:=Str+IntToStr(Buf.Osc[Loop])+' ';
           Label613.Caption:=Str;
           SinxrRoadTest:=True;
           Form1.CANOsc;
         end;
         goto Label_Repeat;
       end
    end
    else
    begin
       Fl_CAN_USB:=False;
       Test1.Caption:='Stop';
    end;
end;

procedure TForm1.Test3Click(Sender: TObject);
Var Cnt,Loop: integer;
Label Label_Repeat;
begin
    Cnt:=0;
    if Test3.Caption = 'Stop'then
    begin
      Test3.Caption := 'Start';
      FormISO.Command_CANUSB($2007);
      repeat Application.ProcessMessages until Cmd_CANUSB_Ask;
    end
    else
    begin
      Test3.Caption := 'Stop';
      FormISO.Command_CANUSB($2008);
      repeat Application.ProcessMessages until Cmd_CANUSB_Ask;
    end;
end;

//------------------------  Flash AGS UpGrade  ------------------------------
procedure TForm1.Button80Click(Sender: TObject);
begin
        Form1.Edit384.Text:='';
        OpenDialog1.FileName:=AGS_UpGrade_File;
        Opendialog1.InitialDir:=ExtractFilePath(AGS_UpGrade_File);
        OpenDialog1.Filter:='bin|*.bin';
        if Opendialog1.Execute and  FileExists(Opendialog1.FileName) then
        begin
            AGS_UpGrade_File:=Opendialog1.FileName;
            if AGS_UpGrade_File<>'' then
            begin
                DiagIni.WriteString('Ôàéë ïðîãðàììèðîâàíèÿ AGS','Bin_File',AGS_UpGrade_File);
                Form1.Edit384.Text:=AGS_UpGrade_File;
            end;
        end;
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
Var RomFile :File of Byte;
    BinName, T, Str:String;
    Loop,Adr,ByteCounter,RepeatCounter, i:Integer;
    sr: TSearchRec;
    ie : boolean;

Label Label_Repeat,Label_End;

begin
    Form1.Memo4.Clear;
    SpeedButton4.Down:=true;
    Form1.Memo4.Lines.Add('ÏÐÎÃÐÀÌÌÈÐÎÂÀÍÈÅ AGS');
    if not AGS_UpGrade_CANUSB then
    begin
      if not(Com_Connected_F) then
      begin
        Memo4.Lines.Add('Íå ìîãó çàïðîãðàììèðîâàòü !!! Îòñóòñòâóåò ñâÿçü ñ áëîêîì.');
        SpeedButton4.Down:=false;
        Exit;
      end;
    end
    else
    begin
      if not CAN_USB_Open then
      begin
        Memo4.Lines.Add('Íå ìîãó çàïðîãðàììèðîâàòü !!! Îòñóòñòâóåò ñâÿçü ñ CAN_USB.');
        SpeedButton4.Down:=false;
        Exit;
      end;
    end;
    if MsgBox('Óâåðåíû â Çàïèñè Flash AGS ?',
            'Ïðåäóïðåæäåíèå', MB_OKCANCEL	+MB_ICONASTERISK +MB_APPLMODAL)
       = IDCANCEL	 then
    begin
        SpeedButton4.Down:=false;
        Exit;
    end;
    BinName:=AGS_UpGrade_File;
    if (FindFirst(BinName, faAnyFile, sr) <> 0) then
    begin
        MsgBox( PChar('AGS bin_File íå íàéäåí.'),
              'Îøèáêà', MB_OK+MB_ICONERROR+MB_APPLMODAL);
        SpeedButton4.Down:=false;
        exit;
    end;
    AssignFile(RomFile,BinName);
    Reset(RomFile);
//
    Size_FlashSTM:= _End_PGM_AGS;//61440;  //$F000    7400
    Size_SectorSTM:= _SizeSector_AGS;//1024;
    if Edit382.Text <> '' then Size_SectorSTM:=StrToInt(Edit382.Text)
    else begin
       Form1.Memo4.Lines.Add('Íå çàäàí FLASH PAGE SIZE');
       goto Label_End;;
    end;
    Form1.Memo4.Lines.Add('Çàãðóçêà ôàéëà ');//('Çàãðóçêà ôàéëà '+BinName);
// çàïîëíÿåì áóôåð 0
    for i:=0 to Size_FlashSTM do BINBuff[i]:= 0; //
// çàïîëíÿåì áóôåð èç ôàéëà
    i:=0;
    Size_File:= FileSize(RomFile);
    while not Eof(RomFile) do
    begin
       Read(RomFile, BINBuff[i]);
       i:=i+1;
    end;
    CloseFile(RomFile);
// çàïîëíÿåì êîíåö áóôåðà $FF ò.ê. â ôàéëå 0
    i:=Size_FlashSTM-Size_SectorSTM-1;
    while BINBuff[i] = 0 do
    begin
       BINBuff[i]:= $FF;
       i:= i-1;
    end;
    Size_Buf:= i+1;
    LastByte:= BINBuff[i];

    Str:='0x'+ByteToHexStr(BINBuff[Size_Buf-1])+
              ByteToHexStr(BINBuff[Size_Buf-2])+
              ByteToHexStr(BINBuff[Size_Buf-3])+
              ByteToHexStr(BINBuff[Size_Buf-4]);
    Form1.Edit383.Text:=Str;
    // ïàðàìåòðû
    ProgramSTM_Start:=Start_ProgramSTM;
    ProgramSTM_End:=((Size_Buf div Size_SectorSTM)+1)*Size_SectorSTM;
    SectorStart:= Round(ProgramSTM_Start/Size_SectorSTM);
    SectorNUM:=Round(ProgramSTM_End/Size_SectorSTM);
    PaketNum:=Round(Size_SectorSTM/SizePaketSTM);    //  32
    UpGrade_InPro:=True;
    Edit381.Text:=IntToStr(ProgramSTM_End);
    T:= IntToStr(Round(ProgramSTM_End/1000));
    if ProgramSTM_End >= Size_FlashSTM then
    begin
      Form1.Memo4.Lines.Add('UpGrade Failed');
      goto Label_End;
    end;

// Èíèöèàëèçàöèÿ
    Form1.Memo4.Lines.Add('Èíèöèàëèçàöèÿ');
    Fl_ComThread :=false;  // çàïðåøàåì ïîòîê Com
    Form1.FormDisable;     //çàïðåò Form1
    Fl2_ProgSTM:=true;  //çàïðåò  Com_Link_Command Error
 //  ProgressBar
    Form2.Caption:='Çàïèñü âo Flash AGS';
    Form2.Label1.Caption:='Èäåò çàïèñü Flash';
    Form2.Label2.Caption:='Ïîæàëóéñòà ïîäîæäèòå '+T+' ñåêóíä';
    Form2.ProgressBar1.Position:=0;
    Form2.Visible:=True;
    if not AGS_UpGrade_CANUSB then
    begin
    // UpGrade AGS ÷åðåç ABS_SKU
    InitProg_Ask :=false;
    MCnum := $44; // MCnum := $44; // - UpGrade AGS
    FormISO.InitProgramm_Flash;
    repeat Application.ProcessMessages until InitProg_Ask;
    if PGM_Error_Ask then
    begin
        Form4.Memo4.Lines.Add('Ïîëó÷åí îòâåò îøèáêà');
        goto Label_End;
    end;
    sleep(50);
    // ñèíõðîíèçàöèÿ ñ AGS
    if Tip_Block > 7 then
    begin
      Fl_ProgLoaderSTM:=true; // ëîäûðü  UART
      Fl_ProgCAN_STM:=false;
      Form1.chk1.Caption:=
      Form1.chk1.Caption +' '+ IntToStr(Tip_Block);
    // ïðè ýòîì â FormISO.Send_Programm_STM
    // ïåðåäàåòñÿ 39 Bytes ïðèíèìàåòñÿ 41 Bytes
    end;
    for i:=0 to (SizePaketSTM-1) do PaketData[i]:= 0;
    FormISO.Send_Programm_STM(STM_ReSixrUart,$FFFF);  //
    repeat Application.ProcessMessages until CmdProg_Ask;
    end

    else
    begin
      // UpGrade AGS ÷åðåç CANUSB
      //ïåðåâîä Àäàïòåðà â ðåæèì AGS_UpGrade
      FormISO.Command_CANUSB($200A);
      repeat Application.ProcessMessages until Cmd_CANUSB_Ask;
      if CANUSB_Error then
      begin
        Form1.Memo4.Lines.Add('Íåò îòâåòà CANUSB');
        goto Label_End;
      end;
      InitProg_Ask :=false;
      MCnum := $44; // - UpGrade AGS
      FormISO.InitProgramm_STM; ///////
      repeat Application.ProcessMessages until InitProg_Ask;
      if PGM_Error_Ask then
      begin
        Form1.Memo4.Lines.Add('Ïîëó÷åí îòâåò îøèáêà');
        goto Label_End;
      end;
      if AGS_UpGrade_CANUSB then
      begin
        Fl_ProgLoaderSTM:=true; // ëîäûðü
        Fl_ProgCAN_STM:=true;   // CAN
        // ïðè ýòîì â FormISO.Send_Programm_STM
        // ïåðåäàåòñÿ 39 Bytes ïðèíèìàåòñÿ 2 Bytes
      end;
      // ñèíõðîíèçàöèÿ ñ AGS
      FormISO.Send_Programm_STM(STM_ReSixrUart,$FFFF);
      repeat Application.ProcessMessages until CmdProg_Ask;
    end;
    // ñèíõðîíèçàöèÿ ñ AGS
    if PGM_Error_Ask then
    begin
        Form1.Memo4.Lines.Add('ÍÅÒ îòâåòà îò AGS');
        goto Label_End;
    end
    else Form1.Memo4.Lines.Add('Ïîëó÷åí îòâåò');

    //  çàïèñü AGS
    for Sector:=SectorStart to (SectorNUM-1) do      //   11...30
    begin
      Form2.ProgressBar1.Position:=Round(Sector *1.5);
      Repeat_Cnt:=0;
Label_Repeat:
      SectorAdr:=Sector * Size_SectorSTM;
      FormISO.Send_Programm_STM(Moto_ClearFlashEEPROM,SectorAdr);  // ñòèðàíèå ñåòîðà
      repeat Application.ProcessMessages until CmdProg_Ask;
// çàïèñü ñåêòîðà
      for Paket:=0 to (PaketNum-1) do   //  0...31
      begin  // çàïèñü ïàêåòà
	       PaketAdr:=SectorAdr+Paket*SizePaketSTM;  //àäðåñ â ïàêåòå
         for i:=0 to (SizePaketSTM-1) do PaketData[i]:= BINBuff[PaketAdr+i];
         FormISO.Send_Programm_STM(Moto_WriteFlashEEPROM,PaketAdr); // çàïèñü ïàêåòà
         repeat Application.ProcessMessages until CmdProg_Ask;
         // îáðàáîòêà îøèáêè
         if PGM_Error_Ask then
         begin
             PGM_Error_Ask:=false;
             Form1.Memo4.Lines.Add('Îøèáêà â ñåêòîðå '+IntToStr(Sector));
             Repeat_Cnt:=Repeat_Cnt+1;
             if Repeat_Cnt > 10 then
             begin
                Form1.Memo4.Lines.Add('UpGrade Failed');
                goto Label_End;
             end;
	           goto Label_Repeat;
         end;
      end;
    end;
// çàâåðøåíî
    FormISO.Send_Programm_STM($6E,(SectorAdr+Size_SectorSTM));
    repeat Application.ProcessMessages until CmdProg_Ask;
    if not PGM_Error_Ask then
    Form1.Memo4.Lines.Add('ÇÀÏÈÑÜ ÂÛÏÎËÍÅÍÀ');
// âûõîä
Label_End:
    Form1.Close_Form2;       // çàêðûâàåì ôîðìó 2
    UpGrade_InPro:=False;
    Fl_ProgSTM:=false;       // ðàçðåøàåì ïîòîê Com
    Fl_ComThread :=true;     // ðàçðåøàåì  ïîòîê Com
    Fl2_ProgSTM:=false;
    SpeedButton4.Down:=false;
    Form1.FormEnable;        //ðàçðåøåíèå Form1

end;

procedure TForm1.Edit384DblClick(Sender: TObject);
begin
    Form1.Edit384.Text:='';
    OpenDialog1.FileName:=AGS_UpGrade_File;
    Opendialog1.InitialDir:=ExtractFilePath(AGS_UpGrade_File);
    OpenDialog1.Filter:='bin|*.bin';
    if Opendialog1.Execute and  FileExists(Opendialog1.FileName) then
    begin
       AGS_UpGrade_File:=Opendialog1.FileName;
       if AGS_UpGrade_File<>'' then
       begin
          DiagIni.WriteString('Ôàéë ïðîãðàììèðîâàíèÿ AGS','Bin_File',
                              AGS_UpGrade_File);
          Form1.Edit384.Text:=AGS_UpGrade_File;
       end;
    end;
end;

procedure TForm1.Button81Click(Sender: TObject);
 Var Loop, i, Temp,TmpH,TmpL : integer;
     Str, hexstr : string;
begin
   hexstr := '0123456789ABCDEF';
   Str:= Edit385.Text;
   if Str <> '' then
   begin
      for i := 1 to 16 do
      begin
        if Str[1] = hexstr[i] then TmpH:=i;
        if Str[2] = hexstr[i] then TmpL:=i;
      end;
      AGS_Read_Adr:= ((TmpH-1)*16+TmpL-1)*256;
   end
   else AGS_Read_Adr:=_Start_CFG_AGS;//$F800;   // íà÷àëî CFG AGS

   if AGS_CFG_CRC <> ''
   then Edit386.Text:=AGS_CFG_CRC;
   AGS_SizeSector:=StrToInt(Edit382.Text);
   AGS_Read_InProcess:=True;  // óïðàâëÿåò ôîðìîé Dump
   AGS_CFG_Start:=AGS_Read_Adr;
   AGS_CFG_End:=AGS_Read_Adr+AGS_SizeSector;

   Form6.Visible:=True;
   Form6.FormShow(nil);
end;

// âñïîìîãàòåëüíûå ïðîöåäóðû CFG AGS
procedure  QffSetG(A:Integer;E:String);
Var B: integer;
begin
   B:=Round(StrToFloat(E)*pi/180*8192);
   if B < 0  then B:= B+65536;
   AGS_CFG_Buff[A+1]:= B div 256;
   AGS_CFG_Buff[A]:= B mod 256
end;
procedure  QffSetA(A:Integer;E:String);
Var B: integer;
begin
   B:=Round(StrToFloat(E)*2048);
   if B < 0  then B:= B+65536;
   AGS_CFG_Buff[A+1]:= B div 256;
   AGS_CFG_Buff[A]:= B mod 256
end;
function   gQffSet(A:Integer):String;
Var B: integer;
begin
    B:=AGS_CFG_Buff[A]+AGS_CFG_Buff[A+1]*256;
    if B >= 32768  then B:= B-65536;
    gQffSet:= FloatToStrF(B/pi*180/8192,ffFixed,5,2);
end;
function   aQffSet(A:Integer):String;
Var B: integer;
begin
    B:=AGS_CFG_Buff[A]+AGS_CFG_Buff[A+1]*256;
    if B >= 32768  then B:= B-65536;
    aQffSet:= FloatToStrF(B/2048,ffFixed,5,2);
end;


procedure TForm1.Edit407Change(Sender: TObject);
Var A,B: integer;
    E:String;
begin
     if  Sender = Edit407 then QffSetG($70,Edit407.Text);
     if  Sender = Edit408 then QffSetG($74,Edit408.Text);
     if  Sender = Edit409 then QffSetG($78,Edit409.Text);
     if  Sender = Edit410 then QffSetA($80,Edit410.Text);
     if  Sender = Edit411 then QffSetA($84,Edit411.Text);
     if  Sender = Edit412 then QffSetA($88,Edit412.Text);
end;
procedure TForm1.CheckBox320Click(Sender: TObject);
Var A,B: integer;
begin
    B:=0;
    if CheckBox320.Checked then B:= B or 1;
    if CheckBox321.Checked then B:= B or 2;
    if CheckBox322.Checked then B:= B or 4;
    if CheckBox323.Checked then B:= B or 8;
    if CheckBox324.Checked then B:= B or 16;
    if CheckBox325.Checked then B:= B or 32;
    if CheckBox326.Checked then B:= B or 64;
    A:=$50; // ADDR_CFG_1
    AGS_CFG_Buff[A]:=B;
end;
procedure TForm1.ViewAGS;
Var A,B: integer;
begin
    if Com_Connected_F  and not AGS_Make_PGM and
       ((Active_Errors_Array[23] and 1) = 0) then  // m_CAN_AGS_Fail      equ     %00000001
    begin
      Form1.GroupBox1100.Enabled:=True;
      Form1.Label640.Color:=clLime;
      Form1.Label640.Caption:='Connect';
      // Error
      if AGS_Err_Lo = 0 then Form1.Edit406.Color:= clWindow
                        else Form1.Edit406.Color:= clRed;
      Form1.Edit406.Text:=IntToStr(AGS_Err_Lo);
      if AGS_Err_Hi = 0 then Form1.Edit413.Color:= clWindow
                        else Form1.Edit413.Color:= clRed;
      Form1.Edit413.Text:=IntToStr(AGS_Err_Hi);
      Form1.Edit414.Text:=IntToStr(AGS_CFG1_B0); // ÷èòàåò áëîê èç AGS ïðè âêëþ÷åíèè
      Form1.Edit416.Text:=IntToStr(AGS_STM_TEMP);
      Form1.Edit415.Text:=IntToStr(AGS_IAM_TEMP);
      if AGS_CFG_ReadCmpl then
      begin
        GroupBox1101.Enabled:=True;
        A:=$50; // ADDR_CFG_1
        B:=AGS_CFG_Buff[A];
        Form1.Edit424.Text:=IntToStr(B);
        if (B and 1)=1  then CheckBox320.Checked:=true
                        else CheckBox320.Checked:=false;
        if (B and 2)=2  then CheckBox321.Checked:=true
                        else CheckBox321.Checked:=false;
        if (B and 4)=4  then CheckBox322.Checked:=true
                        else CheckBox322.Checked:=false;
        if (B and 8)=8  then CheckBox323.Checked:=true
                        else CheckBox323.Checked:=false;
        if (B and 16)=16  then CheckBox324.Checked:=true
                          else CheckBox324.Checked:=false;
        if (B and 32)=32  then CheckBox325.Checked:=true
                          else CheckBox325.Checked:=false;
        if (B and 64)=64  then CheckBox326.Checked:=true
                          else CheckBox326.Checked:=false;
        Form1.Edit407.Text:= gQffSet($70); //ADDR_GX_OffSet
        Form1.Edit408.Text:= gQffSet($74); //ADDR_GY_OffSet
        Form1.Edit409.Text:= gQffSet($78); //ADDR_GZ_OffSet
        Form1.Edit410.Text:= aQffSet($80); //ADDR_AX_OffSet
        Form1.Edit411.Text:= aQffSet($84); //ADDR_AY_OffSet
        Form1.Edit412.Text:= aQffSet($88); //ADDR_AY_OffSet
      end
      else
      begin
        GroupBox1101.Enabled:=False;
      end;
    end
    else
    begin
        Form1.Label640.Color:=clRed;
        Form1.Label640.Caption:='Disconnect';
        Form1.GroupBox1100.Enabled:=False;
        Form1.calibrSB.Color := clBtnFace;
 //       Form1.calibrSB.SimpleText:='';
    end;
end;

procedure TForm1.View_AGS_CFG;
Var Loop, i,A: integer;
    Str: string;
begin
      A:=_SizeSector_AGS-4;
      //CRC
      Str:='';
      for Loop:=0 to 3 do
  //    Str:=Str+ByteToHexStr(AGS_CFG_Buff[(AGS_CFG_End-AGS_CFG_Start)-4+Loop]);
      Str:=Str+ByteToHexStr(AGS_CFG_Buff[A+Loop]);
      AGS_CFG_CRC:='0x'+Str;
      Edit386.Text:=AGS_CFG_CRC;
      //UID
// 16 80 12 00    04    57 32 46 31 38 34 20
// XY-êîîðäèíàòû  íîìåð
// ÷èïà íà âàôëå  âàôëè     íîìåð ëîòà
      A:=$20;
      Str:='0x';
      for Loop:=0 to 4 do
      Str:=Str+ByteToHexStr(AGS_CFG_Buff[A+Loop]);
      Chip_WAF_NUM:=Str;
      Edit387.Text:=Chip_WAF_NUM;
 //     NUM_Chip_WAF:=StrToInt(Str);
      Str:='';
      for Loop:=5 to 11 do
      begin
      if AGS_CFG_Buff[A+Loop] > 31 then
      Str:=Str+Chr(AGS_CFG_Buff[A+Loop]);
      end;
      Chip_LOT_NUM:=Str;
      Edit392.Text:=Chip_LOT_NUM;

      A:=$40;
      //ðåâèçèÿ ìèêðîêîíòðîëëåðà
      Edit390.Text:= ByteToHexStr(AGS_CFG_Buff[A+1] shr 4)+'.'+
                     ByteToHexStr(AGS_CFG_Buff[A] shr 4);
      //12 áèò êîä ìèêðîêîíòðîëëåðà
      Edit388.Text:= '0x'+ByteToHexStr(AGS_CFG_Buff[A+3])+
                          ByteToHexStr(AGS_CFG_Buff[A+2]);
      //ðàçìåð ôëàø-ïàìÿòè â Êáàéòàõ.
      Chip_FLASH_Size:= AGS_CFG_Buff[A+5]*256 +
                        AGS_CFG_Buff[A+4];
      Edit389.Text:=IntToStr(Chip_FLASH_Size);
      //ðàçìåð ñòðàíèöû ôëàø-ïàìÿòè.
      Chip_PAGE_Size:= AGS_CFG_Buff[A+7]*256 +
                       AGS_CFG_Buff[A+6];
      Edit391.Text:=IntToStr(Chip_PAGE_Size);

      //ADUI
      A:=$60;
      Str:='';
      for Loop:=0 to 14 do
      Str:=Str+Chr(AGS_CFG_Buff[A+Loop]);
      Edit393.Text:= Str;
      //Chip_ICM
      A:=$90;
      Str:='';
      for Loop:=0 to 7 do
      Str:=Str+Chr(AGS_CFG_Buff[A+Loop]);
      Edit417.Text:= Str;

      //Write Cnt
      A:=_SizeSector_AGS-8;
      Label618.Caption:=IntToStr(
                    AGS_CFG_Buff[A+3]*16777216 +
                    AGS_CFG_Buff[A+2]*65536 +
                    AGS_CFG_Buff[A+1]*256 +
                    AGS_CFG_Buff[A]);
      //Âåðñèÿ ÏÎ
      A:=$10;
      Str:=IntToStr(AGS_CFG_Buff[A+4])+'.'+
           IntToStr(AGS_CFG_Buff[A])+'.'+'20'+
           IntToStr(AGS_CFG_Buff[A+2]*10+
                    AGS_CFG_Buff[A+3]);
      Edit394.Text:= Str;
      //CRC
      Str:='0x';
      for Loop:=0 to 3 do
      Str:=Str+ByteToHexStr(AGS_CFG_Buff[A+8+Loop]);
      Edit395.Text:= Str;
      // Íîìåð
      Str:=IntToStr(AGS_CFG_Buff[7])+'.'+
           IntToStr(AGS_CFG_Buff[4]+
                    AGS_CFG_Buff[5]*256+
                    AGS_CFG_Buff[6]*65536);
      Edit397.Text:=Str;
      // Äàòà âûïóñêà
      Str:=IntToStr(AGS_CFG_Buff[0])+'.'+'20'+
           IntToStr(AGS_CFG_Buff[2]*10+
                    AGS_CFG_Buff[3]);
      Edit396.Text:=Str;
end;

procedure TForm1.chk2Click(Sender: TObject);
//Var Lot, Num: integer;
begin
    if not AGS_CFG_ReadCmpl then
    begin
       if MsgBox('Íåò äàííûõ, Ïðî÷èòàòü CFG ?',
            'Ïðåäóïðåæäåíèå', MB_OKCANCEL	+MB_ICONASTERISK +MB_APPLMODAL)
          = IDCANCEL	 then Exit
       else Form1.RdCFGClick(nil);
    end;
    AGS_Num:=DiagIni.ReadInteger('NumBlock','AGSLastN',1);
    AGS_Lot:=DiagIni.ReadInteger('NumBlock','AGSLot',1);
    if chk2.Checked then
    begin
       Form1.Edit399.Text:=IntToStr(AGS_Lot); //ïàðòèÿ
       Form1.Edit400.Text:=IntToStr(AGS_Num); //
       WrNum.Enabled:=True;
    end
    else WrNum.Enabled:=False;
end;

procedure TForm1.WrNumClick(Sender: TObject);
//Var Lot, Num: integer;
begin
    if chk2.Checked then
    begin
   //    if CheckBox319.Checked then
   //    begin
   //      AGS_Num:=DiagIni.ReadInteger('NumBlock','AGSLastN',1);
   //      AGS_Lot:=DiagIni.ReadInteger('NumBlock','AGSLot',1);
   //    Num:=Num+1;
    //     Form1.Edit399.Text:=IntToStr(AGS_Lot); //ïàðòèÿ
   //      Form1.Edit400.Text:=IntToStr(AGS_Num); //
   //      AGS_Num:= StrToInt(Form1.Edit400.Text);
   //    end;
       AGS_Num:= StrToInt(Form1.Edit400.Text);
       AGS_Num:=AGS_Num+1;
       Form1.Edit400.Text:=IntToStr(AGS_Num);
       AGS_Lot:= StrToInt(Form1.Edit399.Text);
       // ãàñèì
       Edit397.Text:= '';     // Íîìåð SN
       Edit396.Text:= '';     // Äàòà âûïóñêà
       Label618.Caption:= ''; // Ñ÷åò÷èê çàïèñåé
       Form1.Edit424.Text:= ''; //AGS CFG_1
       calibrSB.Color := clBtnFace;
       AGS_Write_Cmpl:=False;
       Form1.WrCFGClick(nil);
       if calibrSB.SimpleText = 'Oøèáêà çàïèñè CFG AGS' then
       begin
          calibrSB.Color := clRed;
          AGS_Num:=AGS_Num-1;
          Form1.Edit400.Text:=IntToStr(AGS_Num);
          Exit;
       end;
       AGS_Write_Cmpl:=True;
       AGS_CFG_ReadCmpl:=False;
       Form1.RdCFGClick(nil);
   //    if calibrSB.SimpleText = 'ÂÛÏÎËÍÅÍÀ çàïèñü CFG AGS' then
       begin
//         if CheckBox319.Checked then
         begin
      //     AGS_Num:= StrToInt(Form1.Edit400.Text);
       //    AGS_Num:=AGS_Num+1;
       //    AGS_Lot:= StrToInt(Form1.Edit399.Text); //ïàðòèÿ
           DiagIni.WriteInteger('NumBlock','AGSLastN',AGS_Num);
           DiagIni.WriteInteger('NumBlock','AGSLot',AGS_Lot);
         end;
       end;
    end;
end;

procedure TForm1.WrCFGClick(Sender: TObject);
Var Loop, i, Num, Lot, N: integer;
    Str: string;
    DateTime : TDateTime;
    Year, Month, Day : Word;
Label Label_Repeat, Label_End, Label_SkipWrite;
Const
    __AGS_CFG_WrNum = 200;
begin
    if not Com_Connected_F then
    begin
        calibrSB.SimpleText:='! Îòñóòñòâóåò ñâÿçü ñ áëîêîì.';
        Exit;
    end;
 //   WrCFG.Enabled:=false;
    // ïðîâåðêà íàëè÷èÿ äàííûõ
    N:=0;
    for i:=0 to 512 do
    begin
       if AGS_CFG_Buff[i] <> 0 then N:=N+1;
    end;
    if N = 0 then
    begin
  {     if MsgBox('Íåò äàííûõ, Ïðî÷èòàòü CFG ?',
            'Ïðåäóïðåæäåíèå', MB_OKCANCEL	+MB_ICONASTERISK +MB_APPLMODAL)
          = IDCANCEL	 then Exit
       else Form1.RdCFGClick(nil);  }
    end;
    // Íîìåð
    if chk2.Checked then
    begin
      if Form1.Edit400.Text <> ''
      then  Num:= StrToInt(Form1.Edit400.Text)
      else  Num:= 0;
      if Form1.Edit400.Text <> ''
      then  Lot:= StrToInt(Form1.Edit399.Text) //ïàðòèÿ
      else  Lot:= 0;
      if (Num = 0) or (Lot = 0) then
      if MsgBox('Íå ââåäåí íîìåð ',
            'Ïðåäóïðåæäåíèå', MB_OKCANCEL	+MB_ICONASTERISK +MB_APPLMODAL)
            = IDCANCEL	 then Exit
      else
      begin
         NumLot:=false;
         GroupBox225.Focused;
         chk2.Color:=clBtnHighlight;
         repeat Application.ProcessMessages until NumLot;
      end;
      AGS_CFG_Buff[6]:= Num div 65536;
      AGS_CFG_Buff[5]:=(Num mod 65536) div 256;
      AGS_CFG_Buff[4]:=(Num mod 65536) mod 256;
      AGS_CFG_Buff[7]:= Lot;
    end;
    calibrSB.SimpleText:='Çàïèñü CFG AGS';
 //  ProgressBar
    Form2.Caption:='Çàïèñü CFG AGS';
    Form2.Label1.Caption:='Èäåò çàïèñü Flash';
    Form2.Label2.Caption:='Ïîæàëóéñòà ïîäîæäèòå';
    Form2.ProgressBar1.Position:=0;
    Form2.Visible:=True;
    // Äàòà âûïóñêà
    DateTime := Now;
    DecodeDate(DateTime, Year, Month, Day);
    if Year<2000 then Year :=0
    else Year := Year - 2000;
    AGS_CFG_Buff[0]:=Month;
    AGS_CFG_Buff[1]:=0;
    AGS_CFG_Buff[2]:=Year div 10;
    AGS_CFG_Buff[3]:=Year mod 10;
    //
    BrCAN_Adr:=0;
    AGS_CFG_End:=BrCAN_Adr+__AGS_CFG_WrNum;//_SizeSector_AGS-8; //
    BrCAN_DA:=3;
    Fl_ComThread :=false;  // çàïðåøàåì ïîòîê Com
    Form1.FormDisable;     //çàïðåò Form1
    //
    while BrCAN_Adr < AGS_CFG_End do
    begin
      N:=0;
      for i:=0 to 7 do
      begin
         BrCAN_OutBuf[i]:=AGS_CFG_Buff[BrCAN_Adr+i];
         if BrCAN_OutBuf[i] <>0 then N:=N+1;
      end;
  //    if N = 0 then goto Label_SkipWrite;
      N:=0;
Label_Repeat:
      FormISO.Write_BridgeCAN;
      repeat Application.ProcessMessages until BrCAN_Write_Cmpl;
Label_SkipWrite:
      if BrCAN_Write_Error then
      begin
        calibrSB.SimpleText:='?';
        N:=N+1;
        if N < 3 then goto Label_Repeat
        else
        begin
          calibrSB.SimpleText:='Oøèáêà çàïèñè CFG AGS';
          goto Label_End;
        end;
      end
      else
      begin
        BrCAN_Adr:=BrCAN_Adr+8;
        if BrCAN_Adr = (AGS_CFG_End-8) then
        begin
             BrCAN_DA:=BrCAN_DA or $40;
             ComTimeOut.ReadTotalTimeoutConstant:=300;
        end
        else ComTimeOut.ReadTotalTimeoutConstant:=50;
        Form2.ProgressBar1.Position:=Round((BrCAN_Adr)*0.05);
      end;
    end;
    calibrSB.SimpleText:='ÂÛÏÎËÅÍÀ çàïèñü CFG AGS';
    sleep(100);
    //CRC
//    Edit386DblClick(nil);
    //num
    Edit397DblClick(nil);
Label_End:
    ComTimeOut.ReadTotalTimeoutConstant:=50;
    WrCFG.Enabled:=true;
    Form1.Close_Form2;    // çàêðûâàåì ôîðìó 2
    Form1.FormEnable;     // ðàçðåøåíèå Form1
    Fl_ComThread :=True;  // ðàçðåøàåì ïîòîê Com
end;

procedure TForm1.ReadCRC_AGS;
begin
    if not Com_Connected_F then Exit;
    FormISO.Read_CFG_AGS(_Start_CFG_AGS-2);
    repeat Application.ProcessMessages until AGS_Read_Cmpl;
    if not AGS_Read_Error then
    begin
      AGS_PGM_CRC:= AGS_Read_Data[1]*16777216+
                    AGS_Read_Data[2]*65536+
                    AGS_Read_Data[3]*256+
                    AGS_Read_Data[4];
      Form1.Edit383.Text:='0x'+ByteToHexStr(AGS_PGM_CRC);
      AGS_Sise_Sector:=AGS_Read_Data[5]*256+
                       AGS_Read_Data[6];
      Form1.Edit382.Text:=IntToStr(AGS_Sise_Sector);
    end;
end;

procedure TForm1.RdCFGClick(Sender: TObject);
Var Loop, i, N: integer;
    Str: string;
Label Label_Repeat,Label_End;
Const
    __AGS_CFG_RdNum = 200;
begin
    if not Com_Connected_F then
    begin
        calibrSB.SimpleText:='!Îòñóòñòâóåò ñâÿçü ñ áëîêîì!';
        Exit;
    end;
    calibrSB.Color := clBtnFace;
    calibrSB.SimpleText:='×òåíèå CFG AGS';
    Fl_ComThread :=false;  // çàïðåøàåì ïîòîê Com
    Form1.FormDisable;     //çàïðåò Form1
 //  ProgressBar
    Form2.Caption:='×òåíèå DUMP CFG AGS';
    Form2.Label1.Caption:='Èäåò ×òåíèå';
    Form2.Label2.Caption:='Ïîæàëóéñòà ïîäîæäèòå';
    Form2.ProgressBar1.Position:=0;
    if AGS_RdCFG_ProgressBar then
    Form2.Visible:=True;
    BrCAN_Adr:=0;
    AGS_CFG_End:=BrCAN_Adr+__AGS_CFG_RdNum;//_SizeSector_AGS;
    BrCAN_DA:=3;

    Fl_ComThread :=false;  // çàïðåøàåì ïîòîê Com
    Form1.FormDisable;     // çàïðåò Form1

    while BrCAN_Adr < AGS_CFG_End do
    begin
      N:=0;
Label_Repeat:
      FormISO.Read_BridgeCAN;
      repeat Application.ProcessMessages until BrCAN_Read_Cmpl;
      if BrCAN_Read_Error then
      begin
        calibrSB.SimpleText:='?';
        N:=N+1;
        if N <3 then goto Label_Repeat
        else
        begin
          calibrSB.SimpleText:='Oøèáêà ÷òåíèÿ CFG AGS';
          goto Label_End;
        end;
      end
      else
      begin
        for i:=0 to 7 do
        AGS_CFG_Buff[BrCAN_Adr+i]:=BrCAN_InBuf[i];
        BrCAN_Adr:=BrCAN_Adr+8;
        Form2.ProgressBar1.Position:=Round((BrCAN_Adr)*0.05);
        N:=0;
      end;
    end;
    Form1.RdCFG_AGS(_SizeSector_AGS-8);
    Form1.Edit383DblClick(nil);
    Form1.View_AGS_CFG;
    AGS_CFG_ReadCmpl:=True;
    if not AGS_Write_Cmpl then
    calibrSB.SimpleText:='ÂÛÏÎËÍÅÍÎ ÷òåíèå CFG AGS'
    else
    begin
       AGS_Write_Cmpl:= False;
       calibrSB.Color := clMoneyGreen;
       calibrSB.SimpleText:='ÂÛÏÎËÍÅÍ Ââîä íîìåðà SN'
    end;
Label_End:
    Form1.Close_Form2;    // çàêðûâàåì ôîðìó 2
    Form1.FormEnable;     // ðàçðåøåíèå Form1
    Fl_ComThread :=True;  // ðàçðåøàåì ïîòîê Com
end;

procedure TForm1.chk1Click(Sender: TObject);
begin
    if chk1.Checked then
    begin
        chk1.Caption:='Adapter CAN USB';
        chk1.Color:=clAqua;
        AGS_UpGrade_CANUSB:=True;
    end
    else
    begin
        chk1.Caption:='Adapter ABS SKU';
        chk1.Color:=clBtnFace;
        AGS_UpGrade_CANUSB:=False;
    end;
end;

procedure TForm1.RdCFG_AGS(A:integer);
Var Loop: integer;
    Str: string;
begin
    BrCAN_Adr:= A;
    FormISO.Read_BridgeCAN;
    repeat Application.ProcessMessages until BrCAN_Read_Cmpl;
    if not BrCAN_Read_Error then
    begin
      for Loop:=0 to 7 do
      begin
        AGS_CFG_Buff[A+Loop]:=BrCAN_InBuf[Loop];
      end;
    end;
    Str:='';
end;

procedure TForm1.Edit383DblClick(Sender: TObject);
Var Loop, A: integer;
    Str: string;
begin
      if not Com_Connected_F then
    begin
        calibrSB.SimpleText:='!Îòñóòñòâóåò ñâÿçü ñ áëîêîì!';
        Exit;
    end;
    A:=$10;
    BrCAN_DA:=3 or $20;
    BrCAN_Adr:=$05 *65536 + //cCAN_KEY1
               $01 *256  ;  //Com_Rd_CRC
    FormISO.Read_BridgeCAN;
    repeat Application.ProcessMessages until BrCAN_Read_Cmpl;
    if not BrCAN_Read_Error then
    begin
      Str:='0x';
      for Loop:=0 to 3 do
      begin
        Str:=Str+ByteToHexStr(BrCAN_InBuf[Loop+4]);
        AGS_CFG_Buff[A+8+Loop]:=BrCAN_InBuf[Loop+4];
      end;
      Form1.Edit383.Text:=Str;
    end;
end;

procedure TForm1.GroupBox225DblClick(Sender: TObject);
begin
    NumLot:=true;
    chk2.Color:= clBtnFace;
end;

procedure TForm1.Edit386DblClick(Sender: TObject);
Var Loop, A: integer;
    Str: string;
begin
   if not Com_Connected_F then
    begin
        calibrSB.SimpleText:='!Îòñóòñòâóåò ñâÿçü ñ áëîêîì!';
        Exit;
    end;
    BrCAN_DA:= 3;     // AGS
    BrCAN_Adr:= $3F8; // ADDR_CFG_WrCnt
    FormISO.Read_BridgeCAN;
    repeat Application.ProcessMessages until BrCAN_Read_Cmpl;
    if not BrCAN_Read_Error then
    begin
      Str:='0x';
      for Loop:=0 to 3 do
      begin
        Str:=Str+ByteToHexStr(BrCAN_InBuf[Loop+4]);
        AGS_CFG_Buff[A+8+Loop]:=BrCAN_InBuf[Loop+4];
      end;
      Form1.Edit386.Text:=Str;
      A:=  BrCAN_InBuf[0] + BrCAN_InBuf[1]*256 +
          (BrCAN_InBuf[2] + BrCAN_InBuf[3]*256)*65536;
      Form1.Label618.Caption:= IntToStr(A);
    end;
end;

procedure TForm1.Edit397DblClick(Sender: TObject);
Var Loop, A: integer;
    Str: string;
begin
    BrCAN_DA:= 3;   // AGS
    BrCAN_Adr:= 0;  // ADDR_CFG_Num
    FormISO.Read_BridgeCAN;
    repeat Application.ProcessMessages until BrCAN_Read_Cmpl;
    if not BrCAN_Read_Error then
    begin
      // Íîìåð
      Str:=IntToStr(BrCAN_InBuf[7])+'.'+
           IntToStr(BrCAN_InBuf[4]+
                    BrCAN_InBuf[5]*256+
                    BrCAN_InBuf[6]*65536);
      Edit397.Text:=Str;
      // Äàòà âûïóñêà
      Str:=IntToStr(BrCAN_InBuf[0])+'.'+'20'+
           IntToStr(BrCAN_InBuf[2]*10+
                    BrCAN_InBuf[3]);
      Edit396.Text:=Str;
    end;
end;

procedure  Word_Row(Row:Integer;Str1,Str2,Str3:String);
begin
  if Str1 <>'' then
      Doc.Tables.Item(1).Cell(Row,1).Range.Text:=Str1;
  if Str2 <>'' then
      Doc.Tables.Item(1).Cell(Row,2).Range.Text:=Str2;
  if Str3 <>'' then
      Doc.Tables.Item(1).Cell(Row,3).Range.Text:=Str3;
end;


procedure TForm1.ButtonXBR1Click(Sender: TObject);
var
    ConfigFile:TextFile;
    TestString,TestString2,FileName:String;
    TempInt,Loop,R:Integer;
    FileTemplate:RawByteString;
begin
 //    FormProtocol.Button1Click(nil);
 {
  try
    MsWord := GetActiveOleObject('Word.Application');
    MsWord.Visible := True;
  except
    try
      MsWord := CreateOleObject('Word.Application');
      MsWord.Visible := True;
    except
      Exception.Create('Error');
    end;
  end;
}
      MsWord := CreateOleObject('Word.Application');
      MsWord.Visible := True;
  Fl_Word_CFG := True;

  FileTemplate :=ExtractFilePath(Application.ExeName) +
                'CFG.docx';
  MsWord.Documents.Open(FileTemplate);

  Doc:=MsWord.ActiveDocument;
  MsWord.Selection.Font.Size := 12;

//  Form1.Button39Click(Sender);
      Form1.Opendialog1.InitialDir:=IniPath;
      Form1.Opendialog1.Filter:='asm|*.asm';
      if Form1.Opendialog1.Execute and
         FileExists(Form1.Opendialog1.FileName) then
      begin
        Config_File:=Form1.Opendialog1.FileName;
        AssignFile(ConfigFile,Config_File);
        Reset(ConfigFile);
        for Loop:=0 to SizeDumpMOT do
        begin
           ReadLn(ConfigFile,TestString);
           DumpMOT[Loop]:=StrToInt(TestString);
        end;
        CloseFile(ConfigFile);
      end;

  Form1.View_SKU_CFG;
  Form1.CheckBox_140;
        TestString:=Config_File;
        Delete(TestString,1,Pos('\CFG',TestString)+4);
        Delete(TestString,Pos('.asm',TestString),Length(TestString)
                                            -Pos('.asm',TestString)+1);
        FileName:= TestString;
  R:=0;
  Word_Row(R+1, FileName,'','');
  Word_Row(R+2, 'Ïàðàìåòðû àâòîìîáèëÿ','','');
  Word_Row(R+3, 'Äâèãàòåëü','','');
  Word_Row(R+4, 'Ìàêñèìàëüíûé ìîìåíò',Edit125.Text,'Nm');
  Word_Row(R+5, 'Óïðàâëåíèå äâèãàòåëåì',RadioGroup1.Items.Strings
                                     [RadioGroup1.ItemIndex],'');
  Word_Row(R+6, 'Êîðîáêà ïåðåäà÷',CheckBox293.Caption,'');
  if CheckBox131.Checked then TestString:='Ïíåâìî ïîäâåñêà'+' Òèï '+Edit405.Text
                         else TestString:='Ðåñîðíàÿ';
  Word_Row(R+7, 'Ïîäâåñêà çàäíåé îñè',CheckBox131.Caption,'');
  Word_Row(R+8, 'Êîëè÷åñòâî çàäíèõ îñåé ',Edit178.Text,'');
  Word_Row(R+9, 'Òîðìîçà ïåðåäíåé îñè',CheckBox232.Caption,'');
  Word_Row(R+10, 'Òîðìîçíàÿ êàìåðà ïåðåäíåé îñè','Òèï '+Edit269.Text,'');
  Word_Row(R+11, 'Òîðìîçà çàäíåé îñè',CheckBox233.Caption,'');
  Word_Row(R+12, 'Òîðìîçíàÿ êàìåðà çàäíåé îñè','Òèï '+Edit270.Text,'');
  Word_Row(R+13, RadioGroup7.Items.Strings
                [RadioGroup7.ItemIndex],'','');
  if CheckBox66.Checked then TestString:='Åñòü'
                         else TestString:='Íåò';
  Word_Row(R+14, 'Äèô. Êëàïàí ïåðåäíåé îñè',TestString,'');
  if CheckBox33.Checked then TestString:='Åñòü'
                         else TestString:='Íåò';
  Word_Row(R+15, 'Äèô. Êëàïàí çàäíåé îñè',TestString,'');
  Word_Row(R+16, 'Êîíòðîëü äàâëåíèÿ ïðèöåïà',RadioGroup9.Items.Strings
                                            [RadioGroup9.ItemIndex],'');
  if CheckBox83.Checked then TestString:='Åñòü'
                         else TestString:='Íåò';
  if CheckBox209.Checked then TestString2:='CAN'
                         else TestString2:='Àíàëîã.';
  Word_Row(R+17, 'Äàò÷èê äàâëåíèÿ Òîðìîæåíèÿ',TestString,TestString2);
  if CheckBox231.Checked then TestString:='Åñòü'
                         else TestString:='Íåò';
  Word_Row(R+18, 'Äàò÷èê äàâëåíèÿ ïðèöåïà',TestString,'');
  if CheckBox229.Checked then TestString:='Åñòü'
                         else TestString:='Íåò';
  Word_Row(R+19, 'Äàò÷èê äàâëåíèÿ ECAS',TestString,'');
  Word_Row(R+20, 'Äèàìåòð êîëåñ ïåðåäíåé îñè',Edit27.Text,'ì');
  Word_Row(R+21, 'Èíäóêòîð äàò÷èêà ïåðåäíåé îñè',Edit26.Text,'çóáîâ');
  Word_Row(R+22, 'Äèàìåòð êîëåñ çàäíåé îñè',Edit22.Text,'ì');
  Word_Row(R+23, 'Èíäóêòîð äàò÷èêà çàäíåé îñè',Edit21.Text,'çóáîâ');
  Word_Row(R+24, 'Ñåíñîð AGS',CheckBox299.Caption,'');
  if CheckBox119.Checked then
                              TestString:='Åñòü'
                         else TestString:='Íåò';
  if CheckBox49.Checked then TestString2:='CAN'
                         else TestString2:='   ';
  Word_Row(R+25, 'Ýëåêòðîííûé Òàõîãðàô ñ CAN',TestString,TestString2);
  Word_Row(R+26, 'Ïðèáîðíàÿ ïàíåëü',rg5.Items.Strings
                                   [rg5.ItemIndex],'');
  Word_Row(R+27, 'Ïåðåêëþ÷àòåëü ABS OffRoad',RadioGroup2.Items.Strings
                                            [RadioGroup2.ItemIndex],'');
  Word_Row(R+28, 'Ïåðåêëþ÷àòåëü ASR VDC',RadioGroup3.Items.Strings
                                        [RadioGroup3.ItemIndex],'');
  Word_Row(R+29, 'Ïåðåêëþ÷àòåëü TSET',RadioGroup6.Items.Strings
                                     [RadioGroup6.ItemIndex],'');
  if CheckBox40.Checked then TestString:='Åñòü'
                         else TestString:='Íåò';
  Word_Row(R+30, 'Ñèãíàëüíàÿ ëàìïà ABS',TestString,'');
  if CheckBox31.Checked then TestString:='Åñòü'
                         else TestString:='Íåò';
  Word_Row(R+31, 'Ñèãíàëüíàÿ ëàìïà ASR',TestString,'');
  if CheckBox39.Checked then TestString:='Åñòü'
                         else TestString:='Íåò';
  Word_Row(R+32, 'Ðåëå ìîòîðíîãî òîðìîçà',TestString,'');
  if CheckBox53.Checked then TestString:='Åñòü'
                        else TestString:='Íåò';
  Word_Row(R+33, 'Áëîêèðîâêà äèôôåðåíöèàëà âåäóùåãî ìîñòà',TestString,'');
  if CheckBox295.Checked then TestString:='Åñòü'
                        else TestString:='Íåò';
  Word_Row(R+34, 'Äàò÷èê ñöåïëåíèÿ',TestString,'');
  Word_Row(R+35, 'Ïåðåäàòî÷íîå ÷èñëî ðóëåâîãî ìåõàíèçìà',Edit48.Text,'');
  Word_Row(R+36, 'Êîýôôèöèåíò òðàïåöèè ðóëåâîãî ìåõàíèçìà',Edit226.Text,'%');

  R:=37;
  Word_Row(R, 'Áàçà àâòîìîáèëÿ',Edit49.Text,'ì');
  Word_Row(R+1, 'Áàçà ïîâîðîòà',Edit293.Text,'ì');
  Word_Row(R+2, 'Êîëåÿ ïåðåäíåé îñè',Edit73.Text,'ì');
  Word_Row(R+3, 'Öåíòð ñöåïêè ',Edit53.Text,'ì');
  Word_Row(R+4, 'Âûñîòà öåíòðà ìàññ',Edit330.Text,'ì');
  Word_Row(R+5, 'Íàãðóçêà ïåðåäíåé îñè',Edit169.Text,'êã');
  Word_Row(R+6, 'Íàãðóçêà çàäíåé îñè',Edit170.Text,'êã');
  Word_Row(R+7, 'Ñíàðÿæåííàÿ ìàññà',Edit154.Text,'êã');
  Word_Row(R+8, 'Ìàêñèìàëüíàÿ íàãðóçêà',Edit168.Text,'êã');
  Word_Row(R+9, 'Îðèåíòàöèÿ Áëîêà',RadioGroup11.Items.Strings
                                    [RadioGroup11.ItemIndex],'');
  Word_Row(R+10, 'Ãðàäèåíò  Kus',Edit50.Text,' deg/g');
  Word_Row(R+11, 'Çàäåðæêà ðàñ÷åòíîé YawRate',Edit128.Text,'ñ');

  R:=49;
  Word_Row(R, 'Ïàðàìåòðû ìîäåëè äàâëåíèé','','');
  Word_Row(R+1, 'Òîðìîçíîé êðàí îãðàíè÷åíèå ãðàäèåíòà ïîäúåìà',Edit195.Text,'àòì/ñ');
  Word_Row(R+2, 'Òîðìîçíîé êðàí Kîýô. ñíèæåíèÿ',Edit221.Text,'');
  Word_Row(R+3, 'Äèô. êëàïàí ïåðåäíåé îñè Kîýô. ïîäúåìà',Edit67.Text,'');
  Word_Row(R+4, 'Äèô. êëàïàí ïåðåäíåé îñè Kîýô. ñíèæåíèÿ',Edit71.Text,'');
  Word_Row(R+5, 'Äèô. êëàïàí ïåðåäíåé îñè Çàäåðæêà',Edit198.Text,'');
  Word_Row(R+6, 'Äèô. êëàïàí çàäíåé îñè Kîýô. ïîäúåìà',Edit68.Text,'');
  Word_Row(R+7, 'Äèô. êëàïàí çàäíåé îñè Kîýô. ñíèæåíèÿ',Edit72.Text,'');
  Word_Row(R+8, 'Äèô. êëàïàí çàäíåé îñè Çàäåðæêà',Edit199.Text,'');
  Word_Row(R+9, 'Çàäåðæêà ïîäúåìà Ìîäóëÿòîðà Kîýô. Ko',Edit228.Text,'');
  Word_Row(R+10, 'Çàäåðæêà ïîäúåìà Ìîäóëÿòîðà Kîýô. K{dP}',Edit248.Text,'');
  Word_Row(R+11, 'Çàäåðæêà âûïóñêà Ìîäóëÿòîðà Kîýô. Ko',Edit227.Text,'');
  Word_Row(R+12, 'Çàäåðæêà âûïóñêà Ìîäóëÿòîðà Kîýô. K{dP}',Edit247.Text,'');
  Word_Row(R+13, 'Ìîäóëÿòîðà ïåðåäíåé îñè Kîýô. ïîäúåìà',Edit76.Text,'');
  Word_Row(R+14, 'Ìîäóëÿòîðà ïåðåäíåé îñè Kîýô. ñíèæåíèÿ',Edit75.Text,'');
  Word_Row(R+15, 'Äàâëåíèå êîíòàêòà êîëîäîê ïåðåäíåé îñè',Edit197.Text,'àòì');
  Word_Row(R+16, 'Ìîäóëÿòîðà ïåðåäíåé îñè ëåâûé Ãðàäèåíò ïîäúåìà',Edit324.Text,'');
  Word_Row(R+17, 'Ìîäóëÿòîðà ïåðåäíåé îñè ïðàâûé Ãðàäèåíò ïîäúåìà',Edit253.Text,'');
  Word_Row(R+18, 'Ìîäóëÿòîðà ïåðåäíåé îñè Ãðàäèåíò ñíèæåíèÿ',Edit254.Text,'');
  Word_Row(R+19, 'Ìîäóëÿòîðà çàäíåé îñè Kîýô. ïîäúåìà',Edit77.Text,'');
  Word_Row(R+20, 'Ìîäóëÿòîðà çàäíåé îñè Kîýô. ñíèæåíèÿ',Edit78.Text,'');
  Word_Row(R+21, 'Äàâëåíèå êîíòàêòà êîëîäîê çàäíåé îñè',Edit196.Text,'àòì');
  Word_Row(R+22, 'Ìîäóëÿòîðà çàäíåé îñè Ãðàäèåíò ïîäúåìà',Edit266.Text,'');
  Word_Row(R+23, 'Ìîäóëÿòîðà çàäíåé îñè Ãðàäèåíò ñíèæåíèÿ',Edit267.Text,'');
  Word_Row(R+24, 'Äàâëåíèå ïîäúåìà ïåðåäíåé îñè Po',Edit299.Text,'àòì');
  Word_Row(R+25, 'Ïîäúåì äàâëåíèÿ ïåðåäíåé îñè  Kîýô. dP{P}',Edit301.Text,'');
  Word_Row(R+26, 'Ìèíèìàëüíîå âðåìÿ ïîäúåìà Ìîäóëÿòîðà ïåðåäíåé îñè',Edit332.Text,'ìñ');
  Word_Row(R+27, 'Äàâëåíèå ïîäúåìà çàäíåé îñè Po',Edit300.Text,'àòì');
  Word_Row(R+28, 'Ïîäúåì äàâëåíèÿ çàäíåé îñè  Kîåô. dP{P}',Edit302.Text,'');
  Word_Row(R+29, 'Ìèíèìàëüíîå âðåìÿ ïîäúåìà Ìîäóëÿòîðà çàäíåé îñè',Edit333.Text,'ìñ');

  R:=80;
  Word_Row(R, 'Ïàðàìåòðû ðàñ÷åòà çàãðóçêè','','');
  Word_Row(R+1, 'Ìîìåíò õîëîñòîãî õîäà äâèãàòåëÿ ',Edit245.Text,'%');
  Word_Row(R+2, 'Ïîòåðè äâèãàòåëÿ Kîýô. ïåðâàÿ ñòåïåíü Ê1',Edit215.Text,'');
  Word_Row(R+3, 'Ïîòåðè äâèãàòåëÿ Kîýô. âòîðàÿ ñòåïåíü Ê2',Edit216.Text,'');
  Word_Row(R+4, 'Çàìåäëåíèå âûáåãà  ',Edit113.Text,'ì/c2');
  Word_Row(R+5, 'Ýôôåêòèâíîñòü ÊÏÄ òðàíñìèññèè',Edit273.Text,'%');
  Word_Row(R+6, 'Ìèíèìàëüíàÿ ñêîðîñòü ðàçãîíà',Edit218.Text,'êì/÷àñ');
  Word_Row(R+7, 'Ìàêñèìàëüíàÿ ñêîðîñòü ðàçãîíà',Edit364.Text,'êì/÷àñ');
  Word_Row(R+8, 'Çàäåðæêà ìîìåíòà äâèãàòåëÿ',Edit202.Text,'ñ');
  if CheckBox153.Checked then TestString:='Äà'
                         else TestString:='Íåò';
  Word_Row(R+9, 'Ðàçãîí Ïðèîðèòåò Ìåòîä 2',TestString,'');
  if CheckBox278.Checked then TestString:='Äà'
                         else TestString:='Íåò';
  Word_Row(R+10, 'Îãðàíè÷åíèå ðàçíèöû çàìåðîâ',TestString,'');
  if CheckBox270.Checked then TestString:='Èñïîëüçóåòñÿ'
                         else TestString:='Íå èñïîëüçóåòñÿ';
  Word_Row(R+11, 'Êîýôôèöèåíò Îáîðîòû Ñêîðîñòü KTS',TestString,'');
  Word_Row(R+12, 'Äàâëåíèå àêòèâàöèè ïðè òîðìîæåíèè',Edit334.Text,'àòì');
  Word_Row(R+13, 'Çàäåðæêà äàâëåíèÿ ïðè òîðìîæåíèè',Edit220.Text,'ñ');
  if CheckBox152.Checked then TestString:='Äà'
                         else TestString:='Íåò';
  Word_Row(R+14, 'Òîðìîæåíèå Ïðèîðèòåò Ìåòîä 2',TestString,'');
  if CheckBox312.Checked then TestString:='Äà'
                         else TestString:='Íåò';
  Word_Row(R+15, 'Ó÷èòûâàòü òîðìîæåíèå Ðåòàðäåðà',TestString,'');
  Word_Row(R+16, 'Êîýôôèöèåíò ìîìåíòà Ðåòàðäåðà',Edit403.Text,'');
  if CheckBox276.Checked then TestString:='Èñïîëüçóåòñÿ'
                         else TestString:='Íå èñïîëüçóåòñÿ';
  Word_Row(R+17, 'Ôèëüòð ìåäèàíà',TestString,'');

  R:=99;
  Word_Row(R, 'Ðåãóëÿòîð òîðìîçíûõ ñèë EBL','','');
  Word_Row(R+1, 'Äàâëåíèå îòñå÷êè Po',Edit163.Text,'àòì');
  Word_Row(R+2, CheckBox212.Caption,Edit97.Text,'àòì');
  Word_Row(R+3, 'Ïîðîã ñëåæåíèÿ äàâëåíèÿ dP',Edit164.Text,'àòì');
  Word_Row(R+4, 'Ïîïðàâêà êîýôôèöèåíòà ðåãóëÿòîðà',Edit172.Text,'%');
  if CheckBox140.Checked then TestString:='Ïëþñ'
                         else TestString:='Ìèíóñ';
  Word_Row(R+5, 'Çíàê ïîïðàâêè êîýôôèöèåíòà ðåãóëÿòîðà',TestString,'');
  Word_Row(R+6, 'Ïîðîã Ïðîñêàëüçûâàíèÿ óìåíüøåíèÿ äàâëåíèÿ',Edit171.Text,'%');
  if CheckBox213.Checked then TestString:='Åñòü'
                         else TestString:='Íåò';
  Word_Row(R+7, 'Êîððåêöèÿ êîýôôèöèåíòà ðåãóëÿòîðà ïî ïðîñêàëüçûâàíèþ',TestString,'');
  if CheckBox211.Checked then TestString:='Åñòü'
                         else TestString:='Íåò';
  Word_Row(R+8, 'Îòêëþ÷åíèå ðåãóëÿòîðà ïðè ñèëüíîì òîðìîæåíèè',TestString,'');
  if CheckBox234.Checked then TestString:='Ó÷èòûâàåòñÿ'
                         else TestString:='Íå ó÷èòûâàåòñÿ';
  Word_Row(R+9, 'Ïåðåðàñïðåäåëåíèå òîðìîçíûõ ñèë Fz ',TestString,'');
  Word_Row(R+10, 'Ñêîðîñòü îòêëþ÷åíèÿ ðåãóëÿòîðà EBL',Edit116.Text,'êì/÷àñ');

  R:=111;
  Word_Row(R, 'Íàñòðîéêà ÀBS','','');
  if CheckBox164.Checked then TestString:='Ðàçðåøåí'
                         else TestString:='Çàïðåùåí';
  Word_Row(R+1, 'Ðåæèì ÀBS',TestString,'');
  Word_Row(R+2, 'Ìèíèìàëüíàÿ ñêîðîñòü àêòèâàöèè',Edit320.Text,'êì/÷àñ');
  Word_Row(R+3, 'Ïîðîã óñêîðåíèÿ àêòèâàöèè ïåðåäíåé îñè',Edit282.Text,'ì/ñ2');
  Word_Row(R+4, 'Ïîðîã ïðîñêàëüçûâàíèÿ àêòèâàöèè ïåðåäíåé îñè',Edit289.Text,'%');
  Word_Row(R+5, 'Ïîðîã óñêîðåíèÿ àêòèâàöèè çàäíåé îñè',Edit288.Text,'ì/ñ2');
  Word_Row(R+6, 'Ïîðîã ïðîñêàëüçûâàíèÿ àêòèâàöèè çàäíåé îñè',Edit290.Text,'%');
  Word_Row(R+7, 'Çîíà íå÷óâñòâèòåëüíîñòè ïåðåäíåé îñè',Edit349.Text,'êì/÷àñ');
  Word_Row(R+8, 'Íå÷óâñòâèòåëüíîñòü ïîäêà÷åê ïåðåäíåé îñè',Edit314.Text,'êì/÷àñ');
  Word_Row(R+9, 'Çîíà íå÷óâñòâèòåëüíîñòè çàäíåé îñè',Edit350.Text,'êì/÷àñ');
  Word_Row(R+10, 'Íå÷óâñòâèòåëüíîñòü ïîäêà÷åê çàäíåé îñè',Edit348.Text,'êì/÷àñ');
  if CheckBox222.Checked then TestString:='Åñòü'
                         else TestString:='Íåò';
  Word_Row(R+11, 'Íå÷óâñòâèòåëüíîñòü ïðè àêòèâíîì ÀBS',TestString,'');
  if CheckBox173.Checked then TestString:='Åñòü'
                         else TestString:='Íåò';
  Word_Row(R+12, 'Íå÷óâñòâèòåëüíîñòü ïðè òîðìîæåíèè äâèãàòåëåì',TestString,'');
  if CheckBox160.Checked then TestString:='Ó÷èòûâàåòñÿ'
                         else TestString:='Íå ó÷èòûâàåòñÿ';
  Word_Row(R+13, 'Ñîáûòèå òîðìîæåíèÿ äî àêòèâàöèè ÀBS',TestString,'');
  if CheckBox165.Checked then TestString:='Ó÷èòûâàåòñÿ'
                         else TestString:='Íå ó÷èòûâàåòñÿ';
  Word_Row(R+14, 'Ñîáûòèå òîðìîæåíèÿ ïðè àêòèâíîì ÀBS',TestString,'');
  if CheckBox181.Checked then TestString:='Åñòü'
                         else TestString:='Íåò';
  Word_Row(R+15, 'Äîïîëíèòåëüíûé âûïóñê ïî âðåìåíè â ôàçå 1',TestString,'');
  if CheckBox217.Checked then TestString:='Åñòü'
                         else TestString:='Íåò';
  Word_Row(R+16, 'Ïåðåõîä ñ âûñîêîãî íà íèçêîå ñöåïëåíèå TAI',TestString,'');
  if CheckBox161.Checked then TestString:='Åñòü'
                         else TestString:='Íåò';
  Word_Row(R+17, 'Óêîðà÷èâàíèå âûïóñêà',TestString,'');
  if CheckBox214.Checked then TestString:='Åñòü'
                         else TestString:='Íåò';
  Word_Row(R+18, 'Óêîðà÷èâàíèå âûïóñêà ïðè íèçêîì ñöåïëåíèè',TestString,'');
  Word_Row(R+19, 'Êîýôôèöèåíò óêîðà÷èâàíèå âûïóñêà ïåðåäíåé îñè',Edit325.Text,'');
  Word_Row(R+20, 'Çàäåðæêà óêîðà÷èâàíèÿ âûïóñêà ïåðåäíåé îñè',Edit323.Text,'ìñ');
  Word_Row(R+21, 'Êîýôôèöèåíò óêîðà÷èâàíèå âûïóñêà çàäíåé îñè',Edit337.Text,'');
  Word_Row(R+22, 'Çàäåðæêà óêîðà÷èâàíèÿ âûïóñêà çàäíåé îñè',Edit338.Text,'ìñ');
  Word_Row(R+23, 'Ïîðîã îïòèìàëüíîãî ïðîñêàëüçûâàíèÿ',Edit321.Text,'%');
  Word_Row(R+24, 'Ïîðîã ïðîñêàëüçûâàíèÿ âûïóñêà â ôàçå 3',Edit304.Text,'%');
  if CheckBox219.Checked then TestString:='Äà'
                         else TestString:='Íåò';
  Word_Row(R+25, 'Âûõîä èç ôàçû 3 ïî îïòèì. ïðîñêàëüçûâàíèþ',TestString,'');
  if CheckBox184.Checked then TestString:='Äà'
                         else TestString:='Íåò';
  Word_Row(R+26, 'Âûõîä èç ôàçû 3 ïî áîëüøîìó óñêîðåíèþ',TestString,'');
  Word_Row(R+27, 'Óñêîðåíèå âûõîä èç ôàçû 3',Edit316.Text,'ì/ñ2');
  if CheckBox182.Checked then TestString:='Åñòü'
                         else TestString:='Íåò';
  Word_Row(R+28, 'Çîíà ðàñêðóòêè',TestString,'');
  if CheckBox142.Checked then TestString:='Åñòü'
                         else TestString:='Íåò';
  Word_Row(R+29, 'Çîíà ðàñêðóòêè ïåðåäíåé îñè',TestString,'');
  Word_Row(R+30, 'Ïîðîã çîíû ðàñêðóòêè',Edit318.Text,'êì/÷àñ');
  Word_Row(R+31, 'Êîýô. çàâèñèìîñòè ïîäêà÷åê îò äàâëåíèÿ ïåðåäíÿÿ îñü',Edit274.Text,'');
  Word_Row(R+32, 'Êîýô. çàâèñèìîñòè ïîäêà÷åê îò äàâëåíèÿ çàäíÿÿ îñü',Edit275.Text,'');
  if CheckBox183.Checked then TestString:='Åñòü'
                         else TestString:='Íåò';
  Word_Row(R+33, 'Ðåêóðñèÿ ïåðâîé ïîäêà÷êè',TestString,'');
  Word_Row(R+34, 'Êîýôôèöèåíò ðåêóðñèè',Edit279.Text,'');
  Word_Row(R+35, 'Ïàóçà â ïîäêà÷êàõ',Edit283.Text,'ìñ');
  if CheckBox142.Checked then TestString:='Åñòü'
                         else TestString:='Íåò';
  Word_Row(R+36, 'Çàâèñèìîñòü ïàóçû ïîäêà÷åê îò ïðîñêàëüçûâàíèÿ',TestString,'');
  Word_Row(R+37, 'Êîýôôèöèåíò ïàóçû ïîäêà÷åê',Edit365.Text,'');
  if CheckBox226.Checked then TestString:='Åñòü'
                         else TestString:='Íåò';
  Word_Row(R+38, 'Çàâèñèìîñòü ïîäêà÷åê îò íîìåðà',TestString,'');
  Word_Row(R+39, 'Êîýôôèöèåíò ïîäêà÷åê îò íîìåðà',Edit278.Text,'');
  if CheckBox224.Checked then TestString:='Åñòü'
                         else TestString:='Íåò';
  Word_Row(R+40, 'Çàâèñèìîñòü ïîäêà÷åê îò ñöåïëåíèÿ Mu',TestString,'');
  Word_Row(R+41, 'Êîýôôèöèåíò âûñîêîãî ñöåïëåíèÿ Mu',Edit317.Text,'');
  if CheckBox167.Checked then TestString:='Çàïðåùåíî'
                         else TestString:='Ðàçðåøåíî';
  Word_Row(R+42, 'Ìîäèôèöèðîâàííîå Ðåãóëèðîâàíèå ïåðåäíåé îñè MIR',TestString,'');
  Word_Row(R+43, 'Òèï MIR ïåðåäíåé îñè ',CheckBox216.Caption,'');
  Word_Row(R+44, 'Ñíèæåíèÿ äàâëåíèÿ ñèëüíîãî êîëåñà MIR ',CheckBox225.Caption,'');
  if CheckBox220.Checked then TestString:='Åñòü'
                         else TestString:='Íåò';
  Word_Row(R+45, 'Ñëåæåíèå çà Yaw Rate â MIR',TestString,'');
  Word_Row(R+46, 'Ïîðîã Yaw Rate',Edit326.Text,'ãðàä/ñ');
  if CheckBox112.Checked then TestString:='Åñòü'
                         else TestString:='Íåò';
  Word_Row(R+47, 'Ñîîòíîøåíèå äàâëåíèé ïî áîðòàì MIR',TestString,'');
  Word_Row(R+48, 'Êîýôôèöèåíò äàâëåíèé ïî áîðòàì MIR',Edit322.Text,'');
  Word_Row(R+49, 'Äàâëåíèå MIR ñèëüíûé ëåâûé áîðò dPîL',Edit286.Text,'àòì');
  Word_Row(R+50, 'Äàâëåíèå MIR ñèëüíûé ïðàâûé áîðò dPîR',Edit284.Text,'àòì');
  Word_Row(R+51, 'Êîýôôèöèåíò çàâèñèìîñòè äàâëåíèå MIR dP{T}',Edit285.Text,'');
  Word_Row(R+52, 'Ìàêñèìàëüíîå ïðèðàùåíèå äàâëåíèÿ MIR dPmax',Edit327.Text,'àòì');

  R:=165;
  Word_Row(R, 'Ðåãóëèðîâàíèå ìîòîðíûì òîðìîçîì DBR','','');
  if CheckBox240.Checked then TestString:='Ðàçðåøåíî'
                         else TestString:='Çàïðåùåíî';
  Word_Row(R+1, 'Ðåãóëèðîâàíèå ìîòîðíûì òîðìîçîì DBR',TestString,'');
  Word_Row(R+2, 'Êîíòðîëü ìîìåíòà CAN', CheckBox294.Caption,'');
  Word_Row(R+3, 'Ïðîñêàëüçûâàíèå âûêëþ÷åíèÿ òîðìîæåíèÿ DBR',Edit339.Text,'%');
  Word_Row(R+4, 'Ïðîñêàëüçûâàíèå âîññòàíîâëåíèÿ òîðìîæåíèÿ DBR',Edit340.Text,'%');
  Word_Row(R+5, 'Ìèíèìàëüíàÿ ñêîðîñòü ðåãóëèðîâàíèÿ DBR',Edit341.Text,'êì/÷àñ');
  if CheckBox311.Checked then TestString:='Åñòü'
                         else TestString:='Íåò';
  Word_Row(R+6, 'Êîíòðîëü çàìåäëåíèÿ òîðìîæåíèÿ DBR',TestString,'');
  Word_Row(R+7, 'Æåëàåìîå ïðîäîëüíîå çàìåäëåíèå',Edit401.Text,'ì/ñ2');
  Word_Row(R+8, 'Îãðàíè÷åíèå íà÷àëüíîãî ìîìåíòà',Edit402.Text,'%');

  R:=175;
  Word_Row(R, 'Íàñòðîéêà ÀSR','','');
  if CheckBox155.Checked then TestString:='Ðàçðåøåí'
                         else TestString:='Çàïðåùåí';
  Word_Row(R+1, 'Ðåæèì ÀSR',TestString,'');
  if CheckBox156.Checked then TestString:='Ðàçðåøåíî'
                         else TestString:='Çàïðåùåíî';
  Word_Row(R+2, 'Óïðàâëåíèå òîðìîçàìè',TestString,'');
  if CheckBox157.Checked then TestString:='Ðàçðåøåíî'
                         else TestString:='Çàïðåùåíî';
  Word_Row(R+3, 'Óïðàâëåíèå äâèãàòåëåì',TestString,'');
  Word_Row(R+4, 'Êîíòðîëü äâèãàòåëÿ CAN',CheckBox158.Caption,'');
  Word_Row(R+5, 'Çàäåðæêà ðåãóëèðîâàíèÿ äâèãàòåëÿ',Edit356.Text,'ìñ');
  Word_Row(R+6, 'Ïðîïîðöèîíàëüíûé Êîýô. PID ðåãóëÿòîðà Ìîìåíòà',Edit357.Text,'');
  Word_Row(R+7, 'Äèôôåðåíöèàëüíûé Êîýô. PID ðåãóëÿòîðà Ìîìåíòà',Edit358.Text,'');
  Word_Row(R+8, 'Èíòåãðàëüíûé + Êîýô. PID ðåãóëÿòîðà Ìîìåíòà',Edit359.Text,'');
  Word_Row(R+9, 'Èíòåãðàëüíûé - Êîýô. PID ðåãóëÿòîðà Ìîìåíòà',Edit360.Text,'');
  if CheckBox263.Checked then TestString:='Åñòü'
                         else TestString:='Íåò';
  Word_Row(R+10, 'Ñîñòàâëÿþùàÿ îò äàâëåíèÿ ðåãóëÿòîðà Ìîìåíòà',TestString,'');
  Word_Row(R+11, 'Êîýôôèöèåíò äàâëåíèÿ ðåãóëÿòîðà Ìîìåíòà',Edit335.Text,'');
  Word_Row(R+12, 'Íà÷àëüíûé ìîìåíò ðåãóëÿòîðà îò çàäàíèÿ âîäèòåëÿ',Edit315.Text,'%');
  if CheckBox259.Checked then TestString:='Åñòü'
                         else TestString:='Íåò';
  Word_Row(R+13, 'Time Out ðåãóëèðîâàíèÿ äâèãàòåëÿ',TestString,'');
  Word_Row(R+14, 'Time Out ðåãóëèðîâàíèÿ äâèãàòåëÿ',Edit353.Text,'ñ');
  if CheckBox176.Checked then TestString:='Åñòü'
                         else TestString:='Íåò';
  Word_Row(R+15, 'Oãðàíè÷åíèå ãðàäèåòà íàðàñòàíèÿ îáîðîòîâ äâèãàòåëÿ',TestString,'');
  if CheckBox177.Checked then TestString:='Åñòü'
                         else TestString:='Íåò';
  Word_Row(R+16, 'Ôèëüòðàöèÿ îáîðîòîâ äâèãàòåëÿ',TestString,'');
  if CheckBox178.Checked then TestString:='Åñòü'
                         else TestString:='Íåò';
  Word_Row(R+17, 'Oãðàíè÷åíèå óìåíüøåíèÿ çàäàíèÿ îáîðîòîâ',TestString,'');
  Word_Row(R+18, 'Ïîðîã óìåíüøåíèÿ çàäàíèÿ îáîðîòîâ',Edit246.Text,'îá/ìèí');
  if CheckBox171.Checked then TestString:='Åñòü'
                         else TestString:='Íåò';
  Word_Row(R+19, 'Ïîäñòðîéêà Êîýôôèöèåíòà Îáîðîòû Ñêîðîñòü Adjst KTS',TestString,'');

  Word_Row(R+20, 'Ïîðîã ñëåæåíèÿ ðåãóëèðîâàíèÿ äàâëåíèÿ',Edit291.Text,'àòì');
  Word_Row(R+21, 'Ïîäêà÷êà äàâëåíèÿ',Edit292.Text,'àòì');
  Word_Row(R+22, 'Ìàêñèìàëüíîå äàâëåíèÿ',Edit351.Text,'àòì');
  Word_Row(R+23, CheckBox269.Caption,Edit298.Text,'');
  Word_Row(R+24, 'Ïðîïîðöèîíàëüíûé Êîýô. PID ðåãóëÿòîðà äàâëåíèÿ',Edit295.Text,'');
  Word_Row(R+25, 'Äèôôåðåíöèàëüíûé Êîýô. PID ðåãóëÿòîðà äàâëåíèÿ',Edit296.Text,'');
  Word_Row(R+26, 'Èíòåãðàëüíûé + Êîýô. PID ðåãóëÿòîðà äàâëåíèÿ',Edit297.Text,'');
  Word_Row(R+27, 'Èíòåãðàëüíûé - Êîýô. PID ðåãóëÿòîðà äàâëåíèÿ',Edit362.Text,'');
  Word_Row(R+28, 'Êîýôôèöèåíò îòíîñèòåëüíîãî ïîðîãà',Edit363.Text,'');
  if CheckBox258.Checked then TestString:='Åñòü'
                         else TestString:='Íåò';
  Word_Row(R+29, 'Time Out ðåãóëèðîâàíèÿ äàâëåíèÿ',TestString,'');
  Word_Row(R+30, 'Time Out ðåãóëèðîâàíèÿ äàâëåíèÿ',Edit352.Text,'ñ');
  if CheckBox264.Checked then TestString:='Îòêëþ÷åíèå'
                         else TestString:='Îãðàíè÷åíèå';
  Word_Row(R+31, 'Ðåãóëèðîâàíèÿ äàâëåíèÿ ïðè TimeOut',TestString,'');
  if CheckBox172.Checked then TestString:='Äà'
                         else TestString:='Íåò';
  Word_Row(R+32, 'Òîðìîæåíèå âîäèòåëåì ïðåðûâàåò ÀSR',TestString,'');
  if CheckBox236.Checked then TestString:='Åñòü'
                         else TestString:='Íåò';
  Word_Row(R+33, 'Ïðîâåðêà äîñòîâåðíîñòè ñêîðîñòåé êîëåñ Safe',TestString,'');
  if CheckBox265.Checked then TestString:='Åñòü'
                         else TestString:='Íåò';
  Word_Row(R+34, 'Çàïðåò ÀSR ïðè îòñóòñòâèè ñêîðîñòè òàõîãðàôà TCO',TestString,'');
  if CheckBox266.Checked then TestString:='Åñòü'
                         else TestString:='Íåò';
  Word_Row(R+35, 'Çàïðåò ÀSR ïðè øóìå äàò÷èêà ñêîðîñòè Noice',TestString,'');

  R:=212;
  Word_Row(R, 'Íàñòðîéêà ESP','','');
  if CheckBox55.Checked then TestString:='Ðàçðåøåí'
                         else TestString:='Çàïðåùåí';
  Word_Row(R+1, 'Ðåæèì ESP',TestString,'');
  R:=213;
  Word_Row(R+1, 'Roll Over Protection ROP','','');
  if CheckBox61.Checked then TestString:='Ðàçðåøåí'
                         else TestString:='Çàïðåùåí';
  Word_Row(R+2, 'Ðåæèì ROP',TestString,'');
  Word_Row(R+3, 'Ïîðîã ïîïåðå÷íîãî óñêîðåíèÿ àêòèâàöèè ROP AyON',Edit98.Text,'ì/ñ2');
  Word_Row(R+4, 'Êîýô. çàâèñèìîñòè ïîðîãà îò ñêîðîñòè K_Vx',Edit79.Text,'');
  Word_Row(R+5, 'Êîýô. ïîðîãà îò ãðàäèåíòà ïîïåðå÷íîãî óñêîðåíèÿ K_dAy',Edit51.Text,'');
  Word_Row(R+6, 'Êîýô. ïîðîãà îò çàãðóçêè K_Load',Edit65.Text,'');
  Word_Row(R+7, 'Æåëàåìîå ïðîäîëüíîå çàìåäëåíèå Aõ',Edit80.Text,'ì/ñ2');
  Word_Row(R+8, 'Ðàçíèöà èçìåðåííîãî è ðàñ÷åòíîãî óñêîðåíèÿ Ay',Edit222.Text,'ì/ñ2');
  Word_Row(R+9, 'Ñêîðîñòü ïðîõîæäåíèÿ êðóãà ðàäèóñà 20ì Ñíàðÿæåííîå',Edit110.Text,'êì/÷àñ');
  Word_Row(R+10, 'Ñêîðîñòü ïðîõîæäåíèÿ êðóãà ðàäèóñà 20ì Ãðóæåííîå',Edit107.Text,'êì/÷àñ');
  Word_Row(R+11, 'Ìèíèìàëüíàÿ ñêîðîñòü àêòèâàöèè ROP',Edit122.Text,'êì/÷àñ');
  Word_Row(R+12, 'Çîíà ñêîðîñòè âûõîäà îòíîñèòåëüíî ðàñ÷åòíîé',Edit120.Text,'êì/÷àñ');
  Word_Row(R+13, 'Îòíîñèòåëüíûé ïîðîã àêòèâàöèè Ðåãóëèðîâàíèÿ äâèãàòåëÿ',Edit99.Text,'ì/ñ2');
  Word_Row(R+14, 'Ïîðîã âûêëþ÷åíèÿ ðåãóëèðîâàíèÿ äâèãàòåëÿ',Edit124.Text,'ì/ñ2');
  if CheckBox137.Checked then TestString:='Åñòü'
                         else TestString:='Íåò';
  Word_Row(R+15, 'Èçìåíåíèå ïîðîãà âûêëþ÷åíèÿ ðåãóëèðîâàíèÿ äâèãàòåëÿ',TestString,'');
  Word_Row(R+16, 'Êîíòðîëü äâèãàòåëÿ CAN',CheckBox174.Caption,'');
  if CheckBox117.Checked then TestString:='Åñòü'
                         else TestString:='Íåò';
  Word_Row(R+17, 'Êîíòðîëü äâèãàòåëÿ ïðè ROP ïðèöåïà',TestString,'');
  Word_Row(R+18, 'Íà÷àëüíûé ìîìåíò ðåãóëÿòîðà îò çàäàíèÿ âîäèòåëÿ',Edit117.Text,'%');
  Word_Row(R+19, 'Ìèíèìàëüíûé ìîìåíò ðåãóëÿòîðà',Edit119.Text,'%');
  Word_Row(R+19, 'Òåìï èçìåíåíèÿ ðåãóëÿòîðà ìîìåíòà',Edit118.Text,'');
  if CheckBox116.Checked then TestString:='Åñòü'
                         else TestString:='Íåò';
  Word_Row(R+20, 'Êîíòðîëü ïðåäåëüíîãî óñêîðåíèÿ Tilting  5,5ì/c2',TestString,'');
  if CheckBox118.Checked then TestString:='Åñòü'
                         else TestString:='Íåò';
  Word_Row(R+21, 'Ó÷åò ðàñ÷åòíîé ñêîðîñòè âûõîäà ïðè àêòèâàöèè ROP',TestString,'');
  if CheckBox218.Checked then TestString:=Edit99.Text
                         else TestString:='0,25';
  Word_Row(R+22, 'Çîíà ïîïåðå÷íîãî óñêîðåíèÿ âûêëþ÷åíèÿ ROP',TestString,'ì/ñ2');
  Word_Row(R+23, 'Íà÷àëüíîå äàâëåíèå ðåãóëèðîâàíèÿ ïåðåäíåé îñè Po',Edit52.Text,'àòì');
  Word_Row(R+24, 'Ìàêñèìàëüíîå äàâëåíèå ðåãóëèðîâàíèÿ ïåðåäíåé îñè Pm',Edit176.Text,'àòì');
  Word_Row(R+25, 'Äàâëåíèå ïîäêà÷êè ïåðåäíåé îñè dPpump',Edit70.Text,'àòì');
  Word_Row(R+26, 'Äàâëåíèå âûïóñêà ïåðåäíåé îñè dPexh',Edit101.Text,'àòì');
  Word_Row(R+27, 'Íà÷àëüíîå äàâëåíèå ðåãóëèðîâàíèÿ çàäíåé îñè Po',Edit55.Text,'àòì');
  Word_Row(R+28, 'Ìàêñèìàëüíîå äàâëåíèå ðåãóëèðîâàíèÿ çàäíåé îñè Pm',Edit177.Text,'àòì');
  Word_Row(R+29, 'Äàâëåíèå ïîäêà÷êè çàäíåé îñè dPpump',Edit64.Text,'àòì');
  Word_Row(R+30, 'Äàâëåíèå âûïóñêà çàäíåé îñè dPexh',Edit57.Text,'àòì');
  if CheckBox120.Checked then TestString:='Íåò'
                         else TestString:='Åñòü';
  Word_Row(R+31, 'Ìîäóëÿöèÿ óâåëè÷åíèÿ äàâëåíèÿ',TestString,'');
  Word_Row(R+32, 'Ðåãóëÿòîð äàâëåíèÿ ó÷åò çàãðóçêè',CheckBox136.Caption,'');
  Word_Row(R+33, 'Êîýô. îò çàãðóçêè ðåãóëÿòîðà ïåðåäíåé îñè',Edit190.Text,'');
  Word_Row(R+34, 'Êîýô. îò çàãðóçêè ðåãóëÿòîðà çàäíåé îñè',Edit191.Text,'');
  if CheckBox154.Checked then TestString:='Åñòü'
                         else TestString:='Íåò';
  Word_Row(R+35, 'Ïðåêðàùåíèå óâåëè÷åíèÿ äàâëåíèÿ ïî ïðîñêàëüçûâàíèþ',TestString,'');
  Word_Row(R+36, 'Ïîðîã ïðîñêàëüçûâàíèÿ ïåðåäíåé îñè',Edit56.Text,'%');
  Word_Row(R+37, 'Ïîðîã ïðîñêàëüçûâàíèÿ çàäíåé îñè',Edit58.Text,'%');
  Word_Row(R+38, 'Íîðìèðîâàííîå ïðîñêàëüçûâàíèÿ â ôàçå 3',Edit143.Text,'%');
  Word_Row(R+39, 'Êîýôôèöèåíò óâåëè÷åíèÿ Ìàêñ. äàâëåíèÿ îò ñêîðîñòè',Edit165.Text,'');
  Word_Row(R+40, 'Êîýôôèöèåíò ñíèæåíèÿ äàâëåíèÿ â ôàçå 3',Edit109.Text,'%');
  Word_Row(R+41, 'Ïàóçà â ïîäêà÷êàõ',Edit108.Text,'ìñ');
  if CheckBox70.Checked then TestString:='Åñòü'
                        else TestString:='Íåò';
  Word_Row(R+42, 'Êîíòðîëü äàâëåíèÿ Ïðèöåïà',TestString,'');
  Word_Row(R+43, 'Çàäàííîå äàâëåíèå ïðèöåïà',Edit141.Text,'àòì');
  Word_Row(R+44, 'Êîýô. îò çàãðóçêè ðåãóëÿòîðà äàâëåíèÿ ïðèöåïà K3',Edit194.Text,'');
  Word_Row(R+45, 'Ñíèæåíèå äàâëåíèÿ ïðèöåïà ïðè æåëàåìîì çàìåäëåíèå',Edit139.Text,'%');
  Word_Row(R+46, 'Çîíà ñëåæåíèÿ ðåãóëÿòîðà äàâëåíèÿ ïðèöåïà',Edit144.Text,'àòì');
  if CheckBox150.Checked then TestString:='Åñòü'
                         else TestString:='Íåò';
  Word_Row(R+47, 'Óïðåæäåíèå òîðìîæåíèÿ ïðèöåïà',TestString,'');
  Word_Row(R+48, 'Äàâëåíèå óïðåæäåíèÿ ïðèöåïà',Edit214.Text,'àòì');
  if CheckBox242.Checked then TestString:='Äà'
                         else TestString:='Íåò';
  Word_Row(R+49, 'Âêëþ÷åíèå ñòîï-ñèãíàëîâ ïðèöåïà ïðè òîðìîæåíèè ESP',TestString,'');
  if CheckBox123.Checked then TestString:='Åñòü'
                         else TestString:='Íåò';
  Word_Row(R+50, 'Ôèëüòðàöèÿ ñèãíàëà äàò÷èêà äàâëåíèÿ ïðèöåïà',TestString,'');

  R:=265;
  Word_Row(R, 'Direct Yaw Control   DYC','','');
  if CheckBox59.Checked then TestString:='Ðàçðåøåí'
                         else TestString:='Çàïðåùåí';
  Word_Row(R+1, 'Yaw Control òîðìîæåíèåì ',TestString,'');
  if CheckBox60.Checked then TestString:='Ðàçðåøåí'
                         else TestString:='Çàïðåùåí';
  Word_Row(R+2, 'Yaw Control äâèãàòåëåì  ',TestString,'');
  if CheckBox44.Checked then TestString:='Äà'
                         else TestString:='Íåò';
  Word_Row(R+3, 'Òîðìîæåíèè âîäèòåëåì ïðåðûâàåò DYC',TestString,'');
  Word_Row(R+4, 'Äàâëåíèå òîðìîæåíèÿ ïðåðûâàþùåå DYC',Edit103.Text,'àòì');
  Word_Row(R+5, 'Äàâëåíèå èìïóëüñà òîðìîæåíèÿ ïåðåäíåé îñè',Edit61.Text,'àòì');
  Word_Row(R+6, 'Äàâëåíèå èìïóëüñà òîðìîæåíèÿ çàäíåé îñè',Edit62.Text,'àòì');
  Word_Row(R+7, 'Óäåðæàíèå äàâëåíèÿ èìïóëüñà òîðìîæåíèÿ',Edit66.Text,'ìñ');
  if CheckBox69.Checked then TestString:='Åñòü'
                        else TestString:='Íåò';
  Word_Row(R+8, 'Êîíòðîëü äàâëåíèÿ  òîðìîæåíèÿ ïðèöåïà',TestString,'');
  Word_Row(R+9, 'Çàäàííîå äàâëåíèå ïðèöåïà',Edit140.Text,'àòì');
  if CheckBox52.Checked then TestString:='Åñòü'
                        else TestString:='Íåò';
  Word_Row(R+10, 'Ïðîòèâ Ñêëàäûâàíèå àâòîïîåçäà',TestString,'');
  if CheckBox129.Checked then TestString:='Äà'
                         else TestString:='Íåò';
  Word_Row(R+11, 'Êîíòðîëü òîðìîæåíèÿ ïðèöåïà Òèï 2',TestString,'');
  Word_Row(R+12, 'Ïðîïîðöèîíàëüíûé Êîýô. PD ðåãóëÿòîðà äàâëåíèÿ',Edit92.Text,'');
  Word_Row(R+13, 'Äèôôåðåíöèàëüíûé Êîýô. PD ðåãóëÿòîðà äàâëåíèÿ',Edit93.Text,'');
  Word_Row(R+14, 'Ðàçíèöà èçìåðåííîãî YawRate  è ðàñ÷åòíîãî Ackermann',Edit106.Text,'ãðàä/ñ');
  if CheckBox121.Checked then TestString:='Åñòü'
                        else TestString:='Íåò';
  Word_Row(R+15, 'Íîðìèðîâàíèå PD ðåãóëÿòîðà ïî ñöåïëåíèþ äîðîãè',TestString,'');
  if CheckBox145.Checked then TestString:='Êðóã'
                         else TestString:='Âñåãäà';
  Word_Row(R+16, 'Àêòèâàöèÿ ðåæèìà Under Steering',TestString,'');
  Word_Row(R+17, 'Ïîïåðå÷íîå óñêîðåíèå çàïðåòà Under Steering',Edit126.Text,'ì/ñ2');
  if CheckBox125.Checked then TestString:='Äà'
                         else TestString:='Íåò';
  Word_Row(R+18, 'Ó÷åò ïðîèçâîäíîé Ackermann',TestString,'');
  Word_Row(R+19, 'Ïîðîã ïðîèçâîäíîé Ackermann',Edit123.Text,'');
  Word_Row(R+20, 'Ïîðîã ïðîèçâîäíîé YawRate',Edit102.Text,'');
  Word_Row(R+21, 'Îãðàíè÷åíèå âõîäà PD ðåãóëÿòîðà Under Steering',Edit121.Text,'ãðàä/ñ');
  Word_Row(R+22, 'Ïîðîã PD ðåãóëÿòîðà Under Steering',Edit104.Text,'');
  Word_Row(R+23, 'Ïîðîã ñìåùåíèÿ Yaw Bias',Edit111.Text,'ãðàä/ñ');
  Word_Row(R+24, 'Ïîðîã PD ðåãóëÿòîðà Over Steering',Edit94.Text,'');
  if CheckBox114.Checked then TestString:='Äà'
                         else TestString:='Íåò';
  Word_Row(R+25, 'Ïðîäîëüíîå çàìåäëåíèå Aõ â ñöåïëåíèè äîðîãè',TestString,'');
  if CheckBox130.Checked then TestString:='Äà'
                         else TestString:='Íåò';
  Word_Row(R+26, 'Êîððåêöèÿ  áàçîâîé ñêîðîñòè',TestString,'');
  if CheckBox179.Checked then TestString:='Äà'
                         else TestString:='Íåò';
  Word_Row(R+27, 'Àêòèâíîå ABS ïðåðûâàåò DYC',TestString,'');
  if CheckBox210.Checked then TestString:='Äà'
                         else TestString:='Íåò';
  Word_Row(R+28, 'Îøèáêà âàëèäàöèè ïðåðûâàåò DYC',TestString,'');
  if CheckBox273.Checked then TestString:='Äà'
                         else TestString:='Íåò';
  Word_Row(R+29, 'Îøèáêà àêòèâàöèÿ ESP íà ñòîÿùåé ìàøèíå ',TestString,'');

  R:=296;
  Word_Row(R, 'Íàñòðîéêà Hill Holder','','');
  if CheckBox244.Checked then TestString:='Ðàçðåøåí'
                         else TestString:='Çàïðåùåí';
  Word_Row(R+1, 'Ðåæèì Hill Holder',TestString,'');
  if CheckBox254.Checked then TestString:='Äà'
                         else TestString:='Íåò';
  Word_Row(R+2, 'Àêòèâàöèÿ ñèëüíûì íàæàòèåì òîðìîçà',TestString,'');
  if CheckBox253.Checked then TestString:='Äà'
                         else TestString:='Íåò';
  Word_Row(R+3, 'Àêòèâàöèÿ ñèãíàëîì EBC1 Hill Holder Switch',TestString,'');
  if CheckBox57.Checked then TestString:='Äà'
                         else TestString:='Íåò';
  Word_Row(R+4, 'Àêòèâàöèÿ ïåðåêëþ÷àòåëåì TSET',TestString,'');
  if CheckBox246.Checked then TestString:='Åñòü'
                         else TestString:='Íåò';
  Word_Row(R+5, 'Òîðìîæåíèå çàäíåé îñüþ',TestString,'');
  if CheckBox245.Checked then TestString:='Äà'
                         else TestString:='Íåò';
  Word_Row(R+6, 'Èíäèêàòîð ESP',TestString,'');
  Word_Row(R+7, 'Âðåìÿ óäåðæàíèÿ',Edit347.Text,'ñ');

  R:=304;
  Word_Row(R, 'Íàñòðîéêà XBR','','');
  if CheckBox307.Checked then TestString:='Ðàçðåøåí'
                         else TestString:='Çàïðåùåí';
  Word_Row(R+1, 'Ðåæèì XBR',TestString,'');

  R:=307;
  Word_Row(R, 'Íàñòðîéêà Halt Brake','','');
  if CheckBox304.Checked then TestString:='Ðàçðåøåí'
                         else TestString:='Çàïðåùåí';
  Word_Row(R+1, 'Ðåæèì Halt Brake',TestString,'');
  if CheckBox305.Checked then TestString:='Äà'
                         else TestString:='Íåò';
  Word_Row(R+2, 'Àêòèâíîñòü ïî ñîñòîÿíèþ äâåðåé SPN 1821',TestString,'');
  if CheckBox306.Checked then TestString:='Äà'
                         else TestString:='Íåò';
  Word_Row(R+3, 'Ó÷èòûâàòü íàæàòèå àêñåëåðàòîðà',TestString,'');

  R:=312;
  Word_Row(R, 'Íàñòðîéêà CAN','','');
  Word_Row(R+1, 'Ïðèîðèòåò Êîíòðîëÿ Ìîìåíò/Ñêîðîñòü TSC1',ComboBox5.Text,'');
  Word_Row(R+2, 'Îñíîâíîé Àäðåñ ñîîáùåíèé SA',Edit30.Text,'');
  if CheckBox94.Checked then TestString:='62'
                        else TestString:=Edit30.Text;
  Word_Row(R+3, 'Àäðåñ ñîîáùåíèé VDC1,VDC2',TestString,'');
  Word_Row(R+4, 'Àäðåñ Ïðèáîðíîé ïàíåëè',Edit142.Text,'');
  if CheckBox42.Checked then TestString:='Äà'
                         else TestString:='Íåò';
  Word_Row(R+5, 'Çàïðîñ äâèãàòåëþ TSC1 ïîñòîÿííî',TestString,'');
  if CheckBox126.Checked then TestString:='Äà'
                         else TestString:='Íåò';
  Word_Row(R+6, 'Àêòèâíûå íåèñïðàâíîñòè DM1 ïîñòîÿííî',TestString,'');
  if CheckBox25.Checked then TestString:='Åñòü'
                        else TestString:='Íåò';
  Word_Row(R+7, 'Àðáèòðàæ çàïðîñîâ äâèãàòåëþ TSC1',TestString,'');
  if CheckBox49.Checked then TestString:='Åñòü'
                        else TestString:='Íåò';
  Word_Row(R+8, 'Êàíàë CAN Òàõîãðàôà',TestString,'');
  if CheckBox141.Checked then TestString:='Äà'
                         else TestString:='Íåò';
  Word_Row(R+9, 'Ñòàòóñû CCVS èñïîëüçóþòñÿ',TestString,'');
  if CheckBox175.Checked then TestString:='Èñïîëüçóåòñÿ'
                         else TestString:='Íå èñïîëüçóåòñÿ';
  Word_Row(R+10, 'Êîíôèãóðàöèÿ äâèãàòåëÿ EC1 ',TestString,'');
  if CheckBox297.Checked then TestString:='Åñòü'
                        else TestString:='Íåò';
  Word_Row(R+11, 'Ïîëîæåíèå òîðìîçíîé ïåäàëè SPN521 EBC1',TestString,'');
  if CheckBox308.Checked then TestString:='Êàæäóþ ñåêóíäó'
                        else TestString:='Ïî çàïðîñó';
  Word_Row(R+12, 'Ïåðåäà÷à Vehicle Weight VW',TestString,'');
  if CheckBox59.Checked then TestString:='Ðàçðåøåí'
                         else TestString:='Çàïðåùåí';
  Word_Row(R+13, 'Îäíîïðîâîäíûé CAN ISO11992 ïðèöåïà',TestString,'');
  if CheckBox124.Checked then TestString:='Åñòü'
                        else TestString:='Íåò';
  Word_Row(R+14, 'Ïåðåäà÷à äàâëåíèÿ ïðèöåïà â EBS11',TestString,'');
  if CheckBox143.Checked then TestString:='Åñòü'
                        else TestString:='Íåò';
  Word_Row(R+15, 'Ïåðåäà÷à Curvature â EBS12',TestString,'');
  if CheckBox71.Checked then TestString:='Èñïîëüçóåòñÿ'
                        else TestString:='Íå èñïîëüçóåòñÿ';
  Word_Row(R+16, 'Ñòàòóñû EBS21 EBS22',TestString,'');
  if CheckBox74.Checked then TestString:='Äà'
                        else TestString:='Íåò';
  Word_Row(R+17, 'Íàïðàâëÿòü ñîîáùåíèÿ CAN ISO11992 â CAN J1939',TestString,'');

end;

procedure TForm1.Button77Click(Sender: TObject);
begin
    MakeCFG.Visible:=True;
    MakeCFG.Clr_Make_CFG;
end;

procedure TForm1.Wr1Click(Sender: TObject);
Var
  i:integer;
  Str:string;
begin
    if not Com_Connected_F then  exit;
    Form1.ViewVIN;
    Protocol_Save:=true;
    //FormProtocol.FormShow(nil);
    Protocol_Save:=false;
end;

procedure TForm1.PCB_Test;
begin
    if FormPCB.Visible and Com_Connected_F then
    begin
    FormPCB.PCB_Test;
    FormPCB.Sens_Test;
    FormPCB.MDT_Var;
    Pcb_Test_Cnt1:=Pcb_Test_Cnt1+1;
    FormPCB.Label92.Caption:=IntToStr(Pcb_Test_Cnt1);
    FormPCB.Label93.Caption:=IntToStr(Pcb_Test_Cnt2);
    end;
end;

//procedure TForm1.ELMbutClick(Sender: TObject);
//begin
//     FormELM.Visible:=True;
//end;

procedure TForm1._SelOss_GridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
    Form1.Edit100.Text:=IntToStr(ARow);
    Form1.PageControl1Change(nil);
    FormISO.DownLoadOscAddress;
end;

procedure TForm1.CheckBox327Click(Sender: TObject);
begin
  if Form1.CheckBox327.Checked
  then
  begin
    if ECU_Ver_PO = '' then ECU_Ver_PO:='1';
    // Pcb_Test ïîøåë ñ 6 âåðñèè
    if ((Tip_Block < 8) and (VER_PO >=6)) or
       ((Tip_Block >= 8) and (StrToInt(ECU_Ver_PO) > 1))
    then FormPCB.Visible:=True
    else
    begin
       FormPCB.Visible:=False;
       MsgBox( PChar('Âåðñèÿ ÏÎ áëîêà '+IntToStr(VER_PO)+' íå ïîääåðæèâàåò Pcb Test'),
              'Îøèáêà', MB_OK+MB_ICONERROR+MB_APPLMODAL);
       Form1.CheckBox327.Checked:=False;
    end;
  end
  else  FormPCB.Visible:=False;
end;

procedure TForm1.ComboBox4Change(Sender: TObject);
var
    TempStr:string;
begin
   case  ComboBox4.ItemIndex of
    0: TempStr:='Òèï íåîïðåäåëåí';
    1: TempStr:='TipPnevmo1';
    2: TempStr:='TipPnevmo2';
   end;
    if ComboBox4.ItemIndex>0 then
    begin
    Edit33.Text:=IntToStr(DiagIni.ReadInteger(TempStr,'KUI',38));
    Edit34.Text:=IntToStr(DiagIni.ReadInteger(TempStr,'U0HI',31) *256 +
                          DiagIni.ReadInteger(TempStr,'U0LI',5));
    Edit36.Text:=IntToStr(DiagIni.ReadInteger(TempStr,'KUD',1));
    Edit37.Text:=IntToStr(DiagIni.ReadInteger(TempStr,'U0HD',13));
 //   Edit39.Text:=IntToStr(DiagIni.ReadInteger(TempStr,'U0LD',211));
    end;
end;
//    CREATE_NEW_CONSOLE or
//---------------------------------------------------------------------------
function RunProcess(FileName: string; ShowCmd: DWORD;
                    ProcInfo: TProcessInformation;
                    ProcID: PDWORD): Longword;
var
  StartupInfo: TStartupInfo;
//  ProcessInfo: TProcessInformation;
  ExitCode: DWORD;
begin
  FillChar(StartupInfo, SizeOf(StartupInfo), #0);
  StartupInfo.cb := SizeOf(StartupInfo);
  StartupInfo.dwFlags := STARTF_USESHOWWINDOW or STARTF_FORCEONFEEDBACK;
  StartupInfo.wShowWindow := ShowCmd;
  if not CreateProcess(nil,
    @Filename[1],
    nil,
    nil,
    True,
    CREATE_NEW_CONSOLE or
    HIGH_PRIORITY_CLASS,
    nil,
    nil,
    StartupInfo,
    ProcInfo)
    then
    Result := WAIT_FAILED
  else
  begin
  //    if ProcID <> nil then
   //     ProcID^ := ProcessInfo.dwProcessId;
  //    result^ := ProcessInfo;
      result := 0;
   //   exit;}
  end;
end;

procedure TForm1.btn2Click(Sender: TObject);
var
    Path, Com, Bin:string;
    FileName_STM: string;
    StartupInfo_STM: TStartupInfo;
    ProcessInfo_STM: TProcessInformation;
    Result_STM: Cardinal;
    Cnt_Process_STM,Cnt1: DWORD;

Label Label_Repeat,Label_End;
begin

    AGS_Make_PGM:=true;
    Form1.Label640.Color:=clRed;
    Form1.Label640.Caption:='Disconnect';
    Form1.Label640.Repaint;
    Form1.btn2.Down:=True;
    Form1.btn2.Enabled:=False;
    Memo4.Font.Color:=clWindowText;
    Memo4.Clear;
    Make_Sound_Ok:=PChar('C:\Windows\Media\chimes.wav');
    Make_Sound_Err:=PChar('C:\Windows\Media\chord.wav');
    //       C:\Program Files (x86)\STMicroelectronics\STM32 ST-LINK Utility\ST-LINK Utility
    Path:= '"C:\Program Files (x86)\STMicroelectronics\STM32 ST-LINK Utility\ST-LINK Utility\ST-LINK_CLI.exe"';
    Bin:= Form1.Edit384.Text;
    // +ST_LINK_SN+ íå ðàáîòàåò
    Case Form1.rg2.ItemIndex of
       0: Com:=' -c  SN=39FF6D065041393433220343 SWD UR Hrst -p '+Bin+' 0x08000000 -Rst';// ñòàðàÿ ïëàòà
       1: Com:=' -c  SN=39FF6E065041393443360143 SWD UR Hrst -p '+Bin+' 0x08000000 -Rst';// CKU + DUE
       2: Com:=' -c  SN=39FF71065041393443330143 SWD UR Hrst -p '+Bin+' 0x08000000 -Rst';//
    end;
    FileName_STM:= PChar(Path + Com);
    FillChar(StartupInfo_STM, SizeOf(StartupInfo_STM), #0);
    StartupInfo_STM.cb := SizeOf(StartupInfo_STM);
    StartupInfo_STM.dwFlags := STARTF_USESHOWWINDOW or STARTF_FORCEONFEEDBACK;
    StartupInfo_STM.wShowWindow := SW_HIDE;//SW_SHOW;
    if not
      CreateProcess
      (nil,
       @Filename_STM[1],
       nil,
       nil,
       false,
       NORMAL_PRIORITY_CLASS,
       nil,
       nil,
       StartupInfo_STM,
       ProcessInfo_STM)
    then exit;
    // æäåì çàâåðøåíèÿ èíèöèàëèçàöèè
    Result_STM:=WaitForInputIdle(ProcessInfo_STM.hProcess, 100);
    Cnt_Process_STM:=0;
    //  Progress
    Form2.Caption:='Çàïèñü ïðîãðàììû AGS';
    Form2.Label1.Caption:='Èäåò çàïèñü Flash';
    Form2.Label2.Caption:='Ïîæàëóéñòà ïîäîæäèòå';
    Form2.ProgressBar1.Position:=0;
    Form2.Visible:=True;
    //
    repeat
       Application.ProcessMessages;
       WaitForSingleObject(ProcessInfo_STM.hProcess, 100);
       GetExitCodeProcess(ProcessInfo_STM.hProcess, Result_STM);
       Cnt_Process_STM:=Cnt_Process_STM+1;
       Form2.ProgressBar1.Position:=Round(Cnt_Process_STM*0.5);
       if (Result_STM <> 259) and
          (Result_STM <> 0)
       then
       begin
         Memo3.Lines.Add('Îøèáêà '+ IntToStr(Result_STM));
         goto Label_End;//exit;
       end;
    Until Result_STM = 0;
    //
Label_End:
    if ProcessInfo_STM.hProcess <> 0
    then CloseHandle(ProcessInfo_STM.hProcess);
    if ProcessInfo_STM.hThread <> 0
    then CloseHandle(ProcessInfo_STM.hThread);

    AGS_Make_PGM:=false;
    Form1.btn2.Down:=False;
    Form1.btn2.Enabled:=True;
    Form1.Close_Form2;    // çàêðûâàåì ôîðìó 2
    Cnt1:=0;
    if Result_STM = 0 then
    begin
      repeat
      Application.ProcessMessages;
      sleep(10);
      Cnt1:=Cnt1+1;
      Until (Form1.Label640.Caption = 'Connect') or (Cnt1 > 100);//
      //PlaySound(Make_Sound_Ok,0,SND_ASYNC);
      if Form1.Label640.Caption = 'Connect'
      then
      begin
        Form1.WrNumClick(nil);
        AGS_Make_Num:=AGS_Make_Num+1;
        Memo4.Lines.Add('Ñäåëàíà çà '+FloatToStrF(Cnt_Process_STM/10,ffFixed,4,2)+'c');
        Memo4.Lines.Add('ïëàòà ¹ '+IntToStr(AGS_Make_Num)+'  Íîìåð SN = ' +Form1.Edit400.Text);
        if (AGS_Err_Lo <> 0) or
           (AGS_Err_Hi <> 0) then
        begin
           Memo4.Font.Color:=clRed;
           Memo4.Lines.Add('Ïðîáëåìû ñ ïëàòîé ICM');
        end;
      end
      else
      begin

        Memo4.Font.Color:=clRed;
        Memo4.Lines.Add('Ïðîáëåìû ñ ïëàòîé CAN');
        Form1.Close_Form2;    // çàêðûâàåì ôîðìó 2
      end;
    end
    else
    begin
      //PlaySound(Make_Sound_Err,0,SND_ASYNC);
      Memo4.Font.Color:=clRed;
      Memo4.Lines.Add('Ïðîáëåìû ïðîãðàììèðîâàíèÿ');
    end;
end;

procedure TForm1.btn4Click(Sender: TObject);
var
    Path, Com, Bin:string;
    FileName_STM: string;
    StartupInfo_STM: TStartupInfo;
    ProcessInfo_STM: TProcessInformation;
    Result_STM: Cardinal;
    Cnt_Process_STM: DWORD;

Label Label_Repeat,Label_End;

begin
    Form1.btn4.Down:=True;
 //  Form1.btn4.Enabled:=False;
    Path:= '"C:\Program Files (x86)\STMicroelectronics\STM32 ST-LINK Utility\ST-LINK Utility\ST-LINK_CLI.exe"';
    Bin:= ProgSTM_File;
    // +ST_LINK_SN+ íå ðàáîòàåò
    Case Form1.rg2.ItemIndex of
       0: Com:=' -c  SN=39FF6D065041393433220343 SWD UR Hrst -p '+Bin+' 0x08000000 -Rst';// ñòàðàÿ ïëàòà
       1: Com:=' -c  SN=39FF6E065041393443360143 SWD UR Hrst -p '+Bin+' 0x08000000 -Rst';//CKU + DUE
    end;
    FileName_STM:= PChar(Path + Com);
    FillChar(StartupInfo_STM, SizeOf(StartupInfo_STM), #0);
    StartupInfo_STM.cb := SizeOf(StartupInfo_STM);
    StartupInfo_STM.dwFlags := STARTF_USESHOWWINDOW or STARTF_FORCEONFEEDBACK;
    StartupInfo_STM.wShowWindow := SW_HIDE;//SW_SHOW;
    if not
      CreateProcess
      (nil,
       @Filename_STM[1],
       nil,
       nil,
       false,
       NORMAL_PRIORITY_CLASS,
       nil,
       nil,
       StartupInfo_STM,
       ProcessInfo_STM)
    then exit;
    // æäåì çàâåðøåíèÿ èíèöèàëèçàöèè
    Result_STM:=WaitForInputIdle(ProcessInfo_STM.hProcess, 100);
    Cnt_Process_STM:=0;
    Form1.Memo3.Clear;
    //  ProgressBar
    Form2.Caption:='Çàïèñü ïðîãðàììû STM';
    Form2.Label1.Caption:='Èäåò çàïèñü Flash';
    Form2.Label2.Caption:='Ïîæàëóéñòà ïîäîæäèòå';
    Form2.ProgressBar1.Position:=0;
    Form2.Visible:=True;
    //
    repeat
       Application.ProcessMessages;
       WaitForSingleObject(ProcessInfo_STM.hProcess, 100);
       GetExitCodeProcess(ProcessInfo_STM.hProcess, Result_STM);
       Cnt_Process_STM:=Cnt_Process_STM+1;
       Form2.ProgressBar1.Position:=Round(Cnt_Process_STM*0.5);
       if (Result_STM <> 259) and
          (Result_STM <> 0)
        {  (Result_STM = 21) or // BDM_RC_SYNC_TIMEOUT
          (Result_STM = 102)   // PROGRAMMING_RC_ERROR_WRONG_SDID }
       then
       begin
         Memo3.Lines.Add('Îøèáêà '+ IntToStr(Result_STM));
         goto Label_End;//exit;
       end;
    Until Result_STM = 0;
    //
Label_End:
    if ProcessInfo_STM.hProcess <> 0
    then CloseHandle(ProcessInfo_STM.hProcess);
    if ProcessInfo_STM.hThread <> 0
    then CloseHandle(ProcessInfo_STM.hThread);

    Form1.btn4.Down:=False;
    Form1.btn4.Enabled:=True;
    Form1.Close_Form2;    // çàêðûâàåì ôîðìó 2
    Memo3.Lines.Add('Ñäåëàíà Çàïèñü STM çà '+
                    FloatToStrF(Cnt_Process_STM/10,ffFixed,4,1)+'c');
end;

procedure TForm1.btn5Click(Sender: TObject);
var
    Path, Com, Bin:string;
    FileName_DZ: string;
    StartupInfo_DZ: TStartupInfo;
    ProcessInfo_DZ: TProcessInformation;
    Result_DZ: Cardinal;
    Cnt_Process_DZ: DWORD;

Label Label_Repeat,Label_End;
begin

    Form1.btn5.Down:=True;
 //  Form1.btn5.Enabled:=False;

    Path:= '"C:\Program Files (x86)\pgo\USBDM 4.12.1.230\UsbdmFlashProgrammer.exe"';
    Bin:= ProgDZ_File;
  //  Com:=' -bdm=0002 -target=HCS08 -vdd=5V -device=MC9S08DZ60 -nvloc=FFAE  -trim=35.25 -securityValue=7E -program -verify '+Bin;
 //   Com:=' -bdm=-0002 -target=HCS08 -device=MC9S08DZ60 -eraseMass -program -verify '+Bin;
    Case Form1.rg2.ItemIndex of
       0: Com:=' -bdm=0002 -target=HCS08 -device=MC9S08DZ60 -eraseMass -program -verify  '+Bin;// ñòàðàÿ ïëàòà
       1: Com:=' -bdm=-0002 -target=HCS08 -device=MC9S08DZ60 -eraseMass -program -verify  '+Bin;//CKU + DUE
    end;

    FileName_DZ:= PChar(Path + Com);
    FillChar(StartupInfo_DZ, SizeOf(StartupInfo_DZ), #0);
    StartupInfo_DZ.cb := SizeOf(StartupInfo_DZ);
    StartupInfo_DZ.dwFlags := STARTF_USESHOWWINDOW or STARTF_FORCEONFEEDBACK;
    StartupInfo_DZ.wShowWindow := SW_HIDE;//SW_SHOW;
    if not CreateProcess
      (nil,
       @Filename_DZ[1],
       nil,
       nil,
       false,
       NORMAL_PRIORITY_CLASS,
       nil,
       nil,
       StartupInfo_DZ,
       ProcessInfo_DZ)
    then exit;
    Cnt_Process_DZ:=0;
    Form1.Memo3.Clear;
    //  ProgressBar
    Form2.Caption:='Çàïèñü ïðîãðàììû DZ';
    Form2.Label1.Caption:='Èäåò çàïèñü Flash';
    Form2.Label2.Caption:='Ïîæàëóéñòà ïîäîæäèòå';
    Form2.ProgressBar1.Position:=0;
    Form2.Visible:=True;
    //
    repeat
       Application.ProcessMessages;
       WaitForSingleObject(ProcessInfo_DZ.hProcess, 100);
       GetExitCodeProcess(ProcessInfo_DZ.hProcess, Result_DZ);
       Cnt_Process_DZ:=Cnt_Process_DZ+1;
       Form2.ProgressBar1.Position:=Round(Cnt_Process_DZ*0.5);
       if (Result_DZ = 21) or // BDM_RC_SYNC_TIMEOUT
          (Result_DZ = 102)   // PROGRAMMING_RC_ERROR_WRONG_SDID
       then
       begin
         Memo3.Lines.Add('Îøèáêà '+ IntToStr(Result_DZ));
         goto Label_End;//exit;
       end;
    Until Result_DZ = 0;
    //
Label_End:
    if ProcessInfo_DZ.hProcess <> 0
    then CloseHandle(ProcessInfo_DZ.hProcess);
    if ProcessInfo_DZ.hThread <> 0
    then CloseHandle(ProcessInfo_DZ.hThread);
    //
    Form1.btn5.Down:=False;
    Form1.btn5.Enabled:=True;
    Form1.Close_Form2;    // çàêðûâàåì ôîðìó 2
    Memo3.Lines.Add('Ñäåëàíà Çàïèñü DZ çà '+
                    FloatToStrF(Cnt_Process_DZ/10,ffFixed,4,1)+'c');
end;

procedure TForm1.btn6Click(Sender: TObject);
var
    Path, Com, Bin:string;
    FileName_PA: string;
    StartupInfo_PA: TStartupInfo;
    ProcessInfo_PA: TProcessInformation;
    Result_PA: Cardinal;
    Cnt_Process_PA: DWORD;

Label Label_Repeat,Label_End;
begin
    Form1.btn6.Down:=True;
 //  Form1.btn6.Enabled:=False;
    Path:= '"C:\Program Files (x86)\pgo\USBDM 4.12.1.230\UsbdmFlashProgrammer.exe"';
    Bin:= ProgPA_File;
    Com:=' -bdm=-0001 -target=HCS08  -device=MC9S08PA32 -eraseMass -program ' + Bin;
 //   Com:=' -bdm=USBDM-JS16-SWD_SER0001 -target=HCS08  -device=MC9S08PA32 -eraseMass  -program -verify ' + Bin;
    FileName_PA:= PChar(Path + Com);
    FillChar(StartupInfo_PA, SizeOf(StartupInfo_PA), #0);
    StartupInfo_PA.cb := SizeOf(StartupInfo_PA);
    StartupInfo_PA.dwFlags := STARTF_USESHOWWINDOW or STARTF_FORCEONFEEDBACK;
    StartupInfo_PA.wShowWindow := SW_SHOW;
    if not CreateProcess
      (nil,
       @Filename_PA[1],
       nil,
       nil,
       false,
       NORMAL_PRIORITY_CLASS,
       nil,
       nil,
       StartupInfo_PA,
       ProcessInfo_PA)
    then exit;
    // æäåì çàâåðøåíèÿ èíèöèàëèçàöèè
    Result_PA:=WaitForInputIdle(ProcessInfo_PA.hProcess, 100);
 //   sleep(5);
    Cnt_Process_PA:=0;
    Form1.Memo3.Clear;
    //  ProgressBar
    Form2.Caption:='Çàïèñü ïðîãðàììû PA';
    Form2.Label1.Caption:='Èäåò çàïèñü Flash';
    Form2.Label2.Caption:='Ïîæàëóéñòà ïîäîæäèòå';
    Form2.ProgressBar1.Position:=0;
    Form2.Visible:=True;
    //
    repeat
       Application.ProcessMessages;
       WaitForSingleObject(ProcessInfo_PA.hProcess, 100);
       GetExitCodeProcess(ProcessInfo_PA.hProcess, Result_PA);
       Cnt_Process_PA:=Cnt_Process_PA+1;
       Form2.ProgressBar1.Position:=Round(Cnt_Process_PA*0.5);
       if (Result_PA = 21) or // BDM_RC_SYNC_TIMEOUT
          (Result_PA = 102)   // PROGRAMMING_RC_ERROR_WRONG_SDID
       then
       begin
         Memo3.Lines.Add('Îøèáêà '+ IntToStr(Result_PA));
         goto Label_End;//exit;
       end;
    Until Result_PA = 0;

Label_End:
    //
    if ProcessInfo_PA.hProcess <> 0
    then CloseHandle(ProcessInfo_PA.hProcess);
    if ProcessInfo_PA.hThread <> 0
    then CloseHandle(ProcessInfo_PA.hThread);
    //
    Form1.btn6.Down:=False;
    Form1.btn6.Enabled:=True;
    Form1.Close_Form2;    // çàêðûâàåì ôîðìó 2
    Memo3.Lines.Add('Ñäåëàíà Çàïèñü PA çà '+
                    FloatToStrF(Cnt_Process_PA/10,ffFixed,4,1)+'c');
end;

procedure TForm1.btn3Click(Sender: TObject);
var
    Path, Com, Bin:string;
    FileName_DZ: string;
    StartupInfo_DZ: TStartupInfo;
    ProcessInfo_DZ: TProcessInformation;
    Result_DZ: Cardinal;
    Cnt_Process_DZ: DWORD;

    FileName_STM: string;
    StartupInfo_STM: TStartupInfo;
    ProcessInfo_STM: TProcessInformation;
    Result_STM: Cardinal;
    Cnt_Process_STM: DWORD;

    FileName_PA: string;
    StartupInfo_PA: TStartupInfo;
    ProcessInfo_PA: TProcessInformation;
    Result_PA: Cardinal;
    Cnt_Process_PA: DWORD;

    FileName_GD1: string;
    StartupInfo_GD1: TStartupInfo;
    ProcessInfo_GD1: TProcessInformation;
    Result_GD1: Cardinal;
    Cnt_Process_GD1: DWORD;

    FileName_GD2: string;
    StartupInfo_GD2: TStartupInfo;
    ProcessInfo_GD2: TProcessInformation;
    Result_GD2: Cardinal;
    Cnt_Process_GD2: DWORD;

    Compleet_STM, Compleet_DZ, Compleet_PA,
    Compleet_GD1, Compleet_GD2 :Boolean;
    Time_Out: WORD;
Label Label_End;
begin
    Form1.btn3.Down:=True;
 //  Form1.btn3.Enabled:=False;
    Form1.Memo3.Clear;
    Path:= '"C:\Program Files (x86)\pgo\USBDM 4.12.1.230\UsbdmFlashProgrammer.exe"';
    //-----------PA-------------
    if Form1.CheckBox353.Checked then
    begin
    Bin:= ProgPA_File;//'"D:\!!!PROG!!!\!SKU_v06_7_6_8\skuPA32_v05\FLASH\skuPA32_v05.abs.S19"';
 //   Com:=' -bdm=-0001 -target=HCS08 -vdd=5V -device=MC9S08PA60 -nvloc=FF6E  -trim=35.25 -program -unsecure -verify ' + Bin;
 //   Com:=' -bdm=-0001 -target=HCS08  -device=MC9S08PA60 -eraseMass  -program -verify ' + Bin;
    Com:=' -bdm=-0001 -target=HCS08  -device=MC9S08PA60 -eraseMass  -program ' + Bin;

    FileName_PA:= PChar(Path + Com);
    FillChar(StartupInfo_PA, SizeOf(StartupInfo_PA), #0);
    StartupInfo_PA.cb := SizeOf(StartupInfo_PA);
    StartupInfo_PA.dwFlags := STARTF_USESHOWWINDOW or STARTF_FORCEONFEEDBACK;
    StartupInfo_PA.wShowWindow := SW_HIDE;
    if not CreateProcess
      (nil,
       @Filename_PA[1],
       nil,
       nil,
       false,
       NORMAL_PRIORITY_CLASS,
       nil,
       nil,
       StartupInfo_PA,
       ProcessInfo_PA)
    then exit;
    // æäåì çàâåðøåíèÿ èíèöèàëèçàöèè
    Result_PA:=WaitForInputIdle(ProcessInfo_PA.hProcess, 100);
    Cnt_Process_PA:=0;
    Compleet_PA:= False;
    end;
    //-----------DZ-------------
    if Form1.CheckBox352.Checked then
    begin
    Bin:= ProgDZ_File;
  //  Com:=' -bdm=0002 -target=HCS08 -vdd=5V -device=MC9S08DZ60 -nvloc=FFAE  -trim=35.25 -securityValue=7E -program -verify '+Bin;
  //  Com:=' -bdm=0002 -target=HCS08 -device=MC9S08DZ60  -eraseMass -securityValue=7E -program -verify '+Bin;

    Case Form1.rg2.ItemIndex of
       0: Com:=' -bdm=0002 -target=HCS08 -device=MC9S08DZ60 -eraseMass -program -verify  '+Bin;// ñòàðàÿ ïëàòà
       1: Com:=' -bdm=-0002 -target=HCS08 -device=MC9S08DZ60 -eraseMass  -nvloc=FFAE -trim=35.25 -securityValue=7E -program -verify  '+Bin;//CKU + DUE
    end;
    FileName_DZ:= PChar(Path + Com);
    FillChar(StartupInfo_DZ, SizeOf(StartupInfo_DZ), #0);
    StartupInfo_DZ.cb := SizeOf(StartupInfo_DZ);
    StartupInfo_DZ.dwFlags := STARTF_USESHOWWINDOW or STARTF_FORCEONFEEDBACK;
    StartupInfo_DZ.wShowWindow := SW_HIDE;
    if not CreateProcess
      (nil,
       @Filename_DZ[1],
       nil,
       nil,
       false,
       NORMAL_PRIORITY_CLASS,
       nil,
       nil,
       StartupInfo_DZ,
       ProcessInfo_DZ)
    then exit;
    // æäåì çàâåðøåíèÿ èíèöèàëèçàöèè
    Result_DZ:=WaitForInputIdle(ProcessInfo_PA.hProcess, 100);
    Cnt_Process_DZ:=0;
    Compleet_DZ:= False;
    end;

    //-----------STM-------------
    if Form1.CheckBox351.Checked then
    begin
    Path:= '"C:\Program Files (x86)\STMicroelectronics\STM32 ST-LINK Utility\ST-LINK Utility\ST-LINK_CLI.exe"';
    Bin:= ProgSTM_File;
    Case Form1.rg2.ItemIndex of
       0: Com:=' -c  SN=39FF6D065041393433220343 SWD UR Hrst -p '+Bin+' 0x08000000 -Rst';// ñòàðàÿ ïëàòà
       1: Com:=' -c  SN=39FF6E065041393443360143 SWD UR Hrst -p '+Bin+' 0x08000000 -Rst';//CKU + DUE
    end;
    FileName_STM:= PChar(Path + Com);
    FillChar(StartupInfo_STM, SizeOf(StartupInfo_STM), #0);
    StartupInfo_STM.cb := SizeOf(StartupInfo_STM);
    StartupInfo_STM.dwFlags := STARTF_USESHOWWINDOW or STARTF_FORCEONFEEDBACK;
    StartupInfo_STM.wShowWindow := SW_HIDE;
    if not
      CreateProcess
      (nil,
       @Filename_STM[1],
       nil,
       nil,
       false,
       NORMAL_PRIORITY_CLASS,
       nil,
       nil,
       StartupInfo_STM,
       ProcessInfo_STM)
    then exit;
    // æäåì çàâåðøåíèÿ èíèöèàëèçàöèè
    Result_STM:=WaitForInputIdle(ProcessInfo_STM.hProcess, 100);
    Cnt_Process_STM:=0;
    Compleet_STM:= False;
    end;

    //-----------GD1-------------
    if Form1.CheckBox354.Checked then
    begin
    Path:= '"'+Path_STLINK_CLI+'\STM32 ST-LINK Utility\ST-LINK Utility\ST-LINK_CLI.exe"';
    Bin:= ProgSTM_File;
    Case Form1.rg4.ItemIndex of
       0: Com:=' -c  SN=39FF72065041393440350143 SWD UR Hrst -p '+Bin+' 0x08000000 -Rst';// PROG 1
       1: Com:=' -c  SN=39FF72065041393440350143 SWD UR Hrst -p '+Bin+' 0x08000000 -Rst';// PROG 2    end;
    end;
    FileName_GD1:= PChar(Path + Com);
    FillChar(StartupInfo_GD1, SizeOf(StartupInfo_GD1), #0);
    StartupInfo_GD1.cb := SizeOf(StartupInfo_GD1);
    StartupInfo_GD1.dwFlags := STARTF_USESHOWWINDOW or STARTF_FORCEONFEEDBACK;
    StartupInfo_GD1.wShowWindow := SW_HIDE;
    if not
      CreateProcess
      (nil,
       @Filename_GD1[1],
       nil,
       nil,
       false,
       NORMAL_PRIORITY_CLASS,
       nil,
       nil,
       StartupInfo_GD1,
       ProcessInfo_GD1)
    then exit;
    // æäåì çàâåðøåíèÿ èíèöèàëèçàöèè
    Result_GD1:=WaitForInputIdle(ProcessInfo_GD1.hProcess, 100);
    Cnt_Process_GD1:=0;
    Compleet_GD1:= False;
    end;

    //-----------GD2-------------
    if Form1.CheckBox355.Checked then
    begin
    Path:= '"'+Path_STLINK_CLI+'\STM32 ST-LINK Utility\ST-LINK Utility\ST-LINK_CLI.exe"';
    Bin:= ProgSTM2_File;
    Case Form1.rg4.ItemIndex of
       0: Com:=' -c  SN=39FF72065041393443340143 SWD UR Hrst -p '+Bin+' 0x08000000 -Rst';// ñòàðàÿ ïëàòà
       1: Com:=' -c  SN=39FF6E065041393443360143 SWD UR Hrst -p '+Bin+' 0x08000000 -Rst';//CKU + DUE
    end;
    FileName_GD2:= PChar(Path + Com);
    FillChar(StartupInfo_GD2, SizeOf(StartupInfo_GD2), #0);
    StartupInfo_GD2.cb := SizeOf(StartupInfo_GD2);
    StartupInfo_GD2.dwFlags := STARTF_USESHOWWINDOW or STARTF_FORCEONFEEDBACK;
    StartupInfo_GD2.wShowWindow := SW_HIDE;
    if not
      CreateProcess
      (nil,
       @Filename_GD2[1],
       nil,
       nil,
       false,
       NORMAL_PRIORITY_CLASS,
       nil,
       nil,
       StartupInfo_GD2,
       ProcessInfo_GD2)
    then exit;
    // æäåì çàâåðøåíèÿ èíèöèàëèçàöèè
    Result_GD2:=WaitForInputIdle(ProcessInfo_GD2.hProcess, 100);
    Cnt_Process_GD2:=0;
    Compleet_GD2:= False;
    end;

    //  ProgressBar
    Form2.Caption:='Çàïèñü ïðîãðàìì SKU';
    Form2.Label1.Caption:='Èäåò çàïèñü Flash';
    Form2.Label2.Caption:='Ïîæàëóéñòà ïîäîæäèòå';
    Form2.ProgressBar1.Position:=0;
    Form2.Visible:=True;
    Time_Out:=33;
    //
    repeat
       Application.ProcessMessages;

       if Form1.CheckBox352.Checked then
       begin
       if not Compleet_DZ then
       begin
         WaitForSingleObject(ProcessInfo_DZ.hProcess, Time_Out);
         GetExitCodeProcess(ProcessInfo_DZ.hProcess, Result_DZ);
         if  Result_DZ = 0 then Compleet_DZ:=True;
         if (Result_DZ = 21) or // BDM_RC_SYNC_TIMEOUT
            (Result_DZ = 102)   // PROGRAMMING_RC_ERROR_WRONG_SDID
         then
         begin
           Memo3.Lines.Add('Îøèáêà DZ '+ IntToStr(Result_DZ));
           Compleet_DZ:=True;
         end;
         Cnt_Process_DZ:=Cnt_Process_DZ+1;
       end;
       end
       else Compleet_DZ:=True;

       if Form1.CheckBox353.Checked then
       begin
       if not Compleet_PA then
       begin
         WaitForSingleObject(ProcessInfo_PA.hProcess, Time_Out);
         GetExitCodeProcess(ProcessInfo_PA.hProcess, Result_PA);
         if  Result_PA = 0 then Compleet_PA:=True;
         if (Result_PA = 21) or // BDM_RC_SYNC_TIMEOUT
            (Result_PA = 102)   // PROGRAMMING_RC_ERROR_WRONG_SDID
         then
         begin
           Memo3.Lines.Add('Îøèáêà PA '+ IntToStr(Result_DZ));
           Compleet_PA:=True;
         end;
         Cnt_Process_PA:=Cnt_Process_PA+1;
       end;
       end
       else Compleet_PA:=True;

       if Form1.CheckBox351.Checked then
       begin
       if not Compleet_STM then
       begin
         WaitForSingleObject(ProcessInfo_STM.hProcess, Time_Out);
         GetExitCodeProcess(ProcessInfo_STM.hProcess, Result_STM);
         Cnt_Process_STM:=Cnt_Process_STM+1;
         if  Result_STM = 0 then Compleet_STM:=True;
         if (Result_STM <> 259) and
            (Result_STM <> 0)
         then
         begin
           Memo3.Lines.Add('Îøèáêà STM '+ IntToStr(Result_STM));
           Compleet_STM:=True;
         end;
       end;
       end
       else Compleet_STM:=True;

       if Form1.CheckBox354.Checked then
       begin
       if not Compleet_GD1 then
       begin
         WaitForSingleObject(ProcessInfo_GD1.hProcess, Time_Out);
         GetExitCodeProcess(ProcessInfo_GD1.hProcess, Result_GD1);
         Cnt_Process_GD1:=Cnt_Process_GD1+1;
         if  Result_GD1 = 0 then Compleet_GD1:=True;
         if (Result_GD1 <> 259) and
            (Result_GD1 <> 0)
         then
         begin
           Memo3.Lines.Add('Îøèáêà GD1 '+ IntToStr(Result_GD1));
           Compleet_GD1:=True;
         end;
       end;
       end
       else Compleet_GD1:=True;

       if Form1.CheckBox355.Checked then
       begin
       if not Compleet_GD2 then
       begin
         WaitForSingleObject(ProcessInfo_GD2.hProcess, Time_Out);
         GetExitCodeProcess(ProcessInfo_GD2.hProcess, Result_GD2);
         Cnt_Process_GD2:=Cnt_Process_GD2+1;
         if  Result_GD2 = 0 then Compleet_GD2:=True;
         if (Result_GD2 <> 259) and
            (Result_GD2 <> 0)
         then
         begin
           Memo3.Lines.Add('Îøèáêà GD2 '+ IntToStr(Result_GD2));
           Compleet_GD2:=True;
         end;
       end;
       end
       else Compleet_GD2:=True;

       if Compleet_PA then Time_Out:=50;
       if Compleet_STM then Time_Out:=100;
       if Compleet_GD1 then Time_Out:=100;
       if Form1.CheckBox352.Checked then
       Form2.ProgressBar1.Position:=Round(Cnt_Process_DZ*0.5);
       if Form1.CheckBox354.Checked or
          Form1.CheckBox355.Checked then
       Form2.ProgressBar1.Position:=Round(Cnt_Process_GD1*0.5);

    Until (Compleet_DZ and Compleet_STM and Compleet_PA and
           Compleet_GD1 and Compleet_GD2);//Result_DZ = 0;
    //
Label_End:
    if Form1.CheckBox352.Checked then
    begin
    if ProcessInfo_DZ.hProcess <> 0
    then CloseHandle(ProcessInfo_DZ.hProcess);
    if ProcessInfo_DZ.hThread <> 0
    then CloseHandle(ProcessInfo_DZ.hThread);
    end;

    if Form1.CheckBox351.Checked then
    begin
    if ProcessInfo_STM.hProcess <> 0
    then CloseHandle(ProcessInfo_STM.hProcess);
    if ProcessInfo_STM.hThread <> 0
    then CloseHandle(ProcessInfo_STM.hThread);
    end;

    if Form1.CheckBox353.Checked then
    begin
    if ProcessInfo_PA.hProcess <> 0
    then CloseHandle(ProcessInfo_PA.hProcess);
    if ProcessInfo_PA.hThread <> 0
    then CloseHandle(ProcessInfo_PA.hThread);
    end;

    if Form1.CheckBox354.Checked then
    begin
    if ProcessInfo_GD1.hProcess <> 0
    then CloseHandle(ProcessInfo_GD1.hProcess);
    if ProcessInfo_GD1.hThread <> 0
    then CloseHandle(ProcessInfo_GD1.hThread);
    end;

    if Form1.CheckBox355.Checked then
    begin
    if ProcessInfo_GD2.hProcess <> 0
    then CloseHandle(ProcessInfo_GD2.hProcess);
    if ProcessInfo_GD2.hThread <> 0
    then CloseHandle(ProcessInfo_GD2.hThread);
    end;
    //
    Form1.btn3.Down:=False;
    Form1.btn3.Enabled:=True;
    Form1.Close_Form2;    // çàêðûâàåì ôîðìó 2
    if Form1.CheckBox352.Checked then
    Memo3.Lines.Add('Ñäåëàíà Çàïèñü çà '+
                    FloatToStrF(Cnt_Process_DZ/10,ffFixed,4,1)+'c');
    if Form1.CheckBox354.Checked then
    Memo3.Lines.Add('Ñäåëàíà Çàïèñü çà '+
                    FloatToStrF(Cnt_Process_GD1/10,ffFixed,4,1)+'c');
end;

procedure TForm1.rg2Click(Sender: TObject);
begin
    DiagIni.WriteString('UpGrade_Serial','Programmator',IntToStr(Form1.rg2.ItemIndex));
end;

procedure TForm1.Prop1Click(Sender: TObject);
begin
  Form1.Opendialog1.Filter:='wav|*.wav';
  form1.Opendialog1.InitialDir:='C:\Windows\Media';
  if OpenDialog1.Execute then
  begin
      Make_Sound_Ok:= PChar(OpenDialog1.FileName);
      //PlaySound(Make_Sound_Ok,0,SND_ASYNC);
  end;
end;
//---------------------------SAS-----------------------------------------------
procedure TForm1.SAS_FileClick(Sender: TObject);
begin
        Form1.Edit431.Text:='';
        OpenDialog1.FileName:=SAS_UpGrade_File;
        Opendialog1.InitialDir:=ExtractFilePath(SAS_UpGrade_File);
        OpenDialog1.Filter:='bin|*.bin';
        if Opendialog1.Execute and  FileExists(Opendialog1.FileName) then
        begin
            SAS_UpGrade_File:=Opendialog1.FileName;
            if SAS_UpGrade_File<>'' then
            begin
                DiagIni.WriteString('Ôàéë ïðîãðàììèðîâàíèÿ SAS','Bin_File',SAS_UpGrade_File);
                Form1.Edit431.Text:=SAS_UpGrade_File;
            end;
        end;
end;

procedure TForm1.CheckBox336Click(Sender: TObject);
begin
    if CheckBox336.Checked then
    begin
        CheckBox336.Caption:='Adapter CAN USB';
        CheckBox336.Color:=clAqua;
        SAS_UpGrade_CANUSB:=True;
    end
    else
    begin
        CheckBox336.Caption:='Adapter ABS SKU';
        CheckBox336.Color:=clBtnFace;
        SAS_UpGrade_CANUSB:=False;
    end;
end;

procedure TForm1.SpeedButton5Click(Sender: TObject);

Var RomFile :File of Byte;
    BinName, T, Str:String;
    Loop,Adr,ByteCounter,RepeatCounter, i:Integer;
    sr: TSearchRec;
    ie : boolean;

Label Label_Repeat,Label_End;

begin
    Form1.Memo5.Clear;
    SpeedButton5.Down:=true;
    Form1.Memo5.Lines.Add('ÏÐÎÃÐÀÌÌÈÐÎÂÀÍÈÅ SAS');
    if not SAS_UpGrade_CANUSB then
    begin
      if not(Com_Connected_F) then
      begin
        Memo5.Lines.Add('Íå ìîãó çàïðîãðàììèðîâàòü !!! Îòñóòñòâóåò ñâÿçü ñ áëîêîì.');
        SpeedButton5.Down:=false;
        Exit;
      end;
    end
    else
    begin
      if not CAN_USB_Open then
      begin
        Memo5.Lines.Add('Íå ìîãó çàïðîãðàììèðîâàòü !!! Îòñóòñòâóåò ñâÿçü ñ CAN_USB.');
        SpeedButton5.Down:=false;
        Exit;
      end;
    end;
    if MsgBox('Óâåðåíû â Çàïèñè Flash SAS ?',
            'Ïðåäóïðåæäåíèå', MB_OKCANCEL	+MB_ICONASTERISK +MB_APPLMODAL)
       = IDCANCEL	 then
    begin
        SpeedButton5.Down:=false;
        Exit;
    end;
    BinName:=SAS_UpGrade_File;
    if (FindFirst(BinName, faAnyFile, sr) <> 0) then
    begin
        MsgBox( PChar('SAS bin_File íå íàéäåí.'),
              'Îøèáêà', MB_OK+MB_ICONERROR+MB_APPLMODAL);
        SpeedButton5.Down:=false;
        exit;
    end;
    AssignFile(RomFile,BinName);
    Reset(RomFile);
//
    Size_FlashSTM:= _End_PGM_SAS;//61440;  //$F000    7400
    Size_SectorSTM:= _SizeSector_SAS;//1024;
    if Edit429.Text <> '' then Size_SectorSTM:=StrToInt(Edit429.Text)
    else begin
       Form1.Memo5.Lines.Add('Íå çàäàí FLASH PAGE SIZE');
       goto Label_End;;
    end;
    Form1.Memo5.Lines.Add('Çàãðóçêà ôàéëà ');//('Çàãðóçêà ôàéëà '+BinName);
// çàïîëíÿåì áóôåð 0
    for i:=0 to Size_FlashSTM do BINBuff[i]:= 0; //
// çàïîëíÿåì áóôåð èç ôàéëà
    i:=0;
    Size_File:= FileSize(RomFile);
    while not Eof(RomFile) do
    begin
       Read(RomFile, BINBuff[i]);
       i:=i+1;
    end;
    CloseFile(RomFile);
// çàïîëíÿåì êîíåö áóôåðà $FF ò.ê. â ôàéëå 0
    i:=Size_FlashSTM-Size_SectorSTM-1;
    while BINBuff[i] = 0 do
    begin
       BINBuff[i]:= $FF;
       i:= i-1;
    end;
    Size_Buf:= i+1;
    LastByte:= BINBuff[i];

    Str:='0x'+ByteToHexStr(BINBuff[Size_Buf-1])+
              ByteToHexStr(BINBuff[Size_Buf-2])+
              ByteToHexStr(BINBuff[Size_Buf-3])+
              ByteToHexStr(BINBuff[Size_Buf-4]);
    Form1.Edit430.Text:=Str;
    // ïàðàìåòðû
    ProgramSTM_Start:=Start_ProgramSTM;
    ProgramSTM_End:=((Size_Buf div Size_SectorSTM)+1)*Size_SectorSTM;
    SectorStart:= Round(ProgramSTM_Start/Size_SectorSTM);
    SectorNUM:=Round(ProgramSTM_End/Size_SectorSTM);
    PaketNum:=Round(Size_SectorSTM/SizePaketSTM);    //  32
    UpGrade_InPro:=True;
    Edit428.Text:=IntToStr(ProgramSTM_End);
    T:= IntToStr(Round(ProgramSTM_End/1000));
    if ProgramSTM_End >= Size_FlashSTM then
    begin
      Form1.Memo5.Lines.Add('UpGrade Failed');
      goto Label_End;
    end;

// Èíèöèàëèçàöèÿ
    Form1.Memo5.Lines.Add('Èíèöèàëèçàöèÿ');
    Fl_ComThread :=false;  // çàïðåøàåì ïîòîê Com
    Form1.FormDisable;     //çàïðåò Form1
    Fl2_ProgSTM:=true;  //çàïðåò  Com_Link_Command Error
 //  ProgressBar
    Form2.Caption:='Çàïèñü âo Flash SAS';
    Form2.Label1.Caption:='Èäåò çàïèñü Flash';
    Form2.Label2.Caption:='Ïîæàëóéñòà ïîäîæäèòå '+T+' ñåêóíä';
    Form2.ProgressBar1.Position:=0;
    Form2.Visible:=True;
    Tip_Block:=8;
    if not SAS_UpGrade_CANUSB then
    begin
    // UpGrade SAS ÷åðåç ABS_SKU
    InitProg_Ask :=false;
    MCnum := $45; // - UpGrade SAS
    FormISO.InitProgramm_Flash;
    repeat Application.ProcessMessages until InitProg_Ask;
    if PGM_Error_Ask then
    begin
        Form4.Memo5.Lines.Add('Ïîëó÷åí îòâåò îøèáêà');
        goto Label_End;
    end;
    sleep(50);
    // ñèíõðîíèçàöèÿ ñ SAS
    if Tip_Block > 7 then
    begin
      Fl_ProgLoaderSTM:=true; // ëîäûðü  UART
      Fl_ProgCAN_STM:=false;
      Form1.chk1.Caption:=
      Form1.chk1.Caption +' '+ IntToStr(Tip_Block);
    // ïðè ýòîì â FormISO.Send_Programm_STM
    // ïåðåäàåòñÿ 39 Bytes ïðèíèìàåòñÿ 41 Bytes
    end;
    for i:=0 to (SizePaketSTM-1) do PaketData[i]:= 0;
    FormISO.Send_Programm_STM(STM_ReSixrUart,$FFFF);  //
    repeat Application.ProcessMessages until CmdProg_Ask;
    end
    else
    begin
      // UpGrade SAS ÷åðåç CANUSB
      //ïåðåâîä Àäàïòåðà â ðåæèì AGS_UpGrade
      FormISO.Command_CANUSB($200A);
      repeat Application.ProcessMessages until Cmd_CANUSB_Ask;
      if CANUSB_Error then
      begin
        Form1.Memo5.Lines.Add('Íåò îòâåòà CANUSB');
        goto Label_End;
      end;
      InitProg_Ask :=false;
      MCnum := $45; // - UpGrade
      FormISO.InitProgramm_STM; ///////
      repeat Application.ProcessMessages until InitProg_Ask;
      if PGM_Error_Ask then
      begin
        Form1.Memo5.Lines.Add('Ïîëó÷åí îòâåò îøèáêà');
        goto Label_End;
      end;
      if SAS_UpGrade_CANUSB then
      begin
        Fl_ProgLoaderSTM:=true; // ëîäûðü
        Fl_ProgCAN_STM:=true;   // CAN
        // ïðè ýòîì â FormISO.Send_Programm_STM
        // ïåðåäàåòñÿ 39 Bytes ïðèíèìàåòñÿ 2 Bytes
      end;
      // ñèíõðîíèçàöèÿ ñ SAS
      FormISO.Send_Programm_STM(STM_ReSixrUart,$FFFF);
      repeat Application.ProcessMessages until CmdProg_Ask;
    end;
    // ñèíõðîíèçàöèÿ ñ SAS
    if PGM_Error_Ask then
    begin
        Form1.Memo5.Lines.Add('ÍÅÒ îòâåòà îò SAS');
        goto Label_End;
    end
    else Form1.Memo5.Lines.Add('Ïîëó÷åí îòâåò');

    //  çàïèñü SAS
    for Sector:=SectorStart to (SectorNUM-1) do      //   11...30
    begin
      Form2.ProgressBar1.Position:=Round(Sector *1.5);
      Repeat_Cnt:=0;
Label_Repeat:
      SectorAdr:=Sector * Size_SectorSTM;
      FormISO.Send_Programm_STM(Moto_ClearFlashEEPROM,SectorAdr);  // ñòèðàíèå ñåòîðà
      repeat Application.ProcessMessages until CmdProg_Ask;
// çàïèñü ñåêòîðà
      for Paket:=0 to (PaketNum-1) do   //  0...31
      begin  // çàïèñü ïàêåòà
	       PaketAdr:=SectorAdr+Paket*SizePaketSTM;  //àäðåñ â ïàêåòå
         for i:=0 to (SizePaketSTM-1) do PaketData[i]:= BINBuff[PaketAdr+i];
         FormISO.Send_Programm_STM(Moto_WriteFlashEEPROM,PaketAdr); // çàïèñü ïàêåòà
         repeat Application.ProcessMessages until CmdProg_Ask;
         // îáðàáîòêà îøèáêè
         if PGM_Error_Ask then
         begin
             PGM_Error_Ask:=false;
             Form1.Memo5.Lines.Add('Îøèáêà â ñåêòîðå '+IntToStr(Sector));
             Repeat_Cnt:=Repeat_Cnt+1;
             if Repeat_Cnt > 10 then
             begin
                Form1.Memo5.Lines.Add('UpGrade Failed');
                goto Label_End;
             end;
	           goto Label_Repeat;
         end;
      end;
    end;
// çàâåðøåíî
    FormISO.Send_Programm_STM($6E,(SectorAdr+Size_SectorSTM));
    repeat Application.ProcessMessages until CmdProg_Ask;
    if not PGM_Error_Ask then
    Form1.Memo5.Lines.Add('ÇÀÏÈÑÜ ÂÛÏÎËÍÅÍÀ');
// âûõîä
Label_End:
    Form1.Close_Form2;       // çàêðûâàåì ôîðìó 2
    UpGrade_InPro:=False;
    Fl_ProgSTM:=false;       // ðàçðåøàåì ïîòîê Com
    Fl_ComThread :=true;     // ðàçðåøàåì  ïîòîê Com
    Fl2_ProgSTM:=false;
    SpeedButton5.Down:=false;
    Form1.FormEnable;        //ðàçðåøåíèå Form1
end;

procedure TForm1.RdCFGSASClick(Sender: TObject);
Var Loop, i, N: integer;
    Str: string;
Label Label_Repeat,Label_End;
Const
    __SAS_CFG_RdNum = 200;
begin
    if not Com_Connected_F then
    begin
        calibrSB.SimpleText:='!Îòñóòñòâóåò ñâÿçü ñ áëîêîì!';
        Exit;
    end;
    calibrSB.Color := clBtnFace;
    calibrSB.SimpleText:='×òåíèå CFG SAS';
    Fl_ComThread :=false;  // çàïðåøàåì ïîòîê Com
    Form1.FormDisable;     //çàïðåò Form1
 //  ProgressBar
    Form2.Caption:='×òåíèå DUMP CFG AGS';
    Form2.Label1.Caption:='Èäåò ×òåíèå';
    Form2.Label2.Caption:='Ïîæàëóéñòà ïîäîæäèòå';
    Form2.ProgressBar1.Position:=0;
    if AGS_RdCFG_ProgressBar then
    Form2.Visible:=True;

    BrCAN_Adr:=0;
    SAS_CFG_End:=BrCAN_Adr+__SAS_CFG_RdNum;//_SizeSector_AGS;
    BrCAN_DA:=4;

    Fl_ComThread :=false;  // çàïðåøàåì ïîòîê Com
    Form1.FormDisable;     // çàïðåò Form1

    while BrCAN_Adr < SAS_CFG_End do
    begin
      N:=0;
Label_Repeat:
      FormISO.Read_BridgeCAN;
      repeat Application.ProcessMessages until BrCAN_Read_Cmpl;
      if BrCAN_Read_Error then
      begin
        calibrSB.SimpleText:='?';
        N:=N+1;
        if N <3 then goto Label_Repeat
        else
        begin
          calibrSB.SimpleText:='Oøèáêà ÷òåíèÿ CFG SAS';
          goto Label_End;
        end;
      end
      else
      begin
        for i:=0 to 7 do
        SAS_CFG_Buff[BrCAN_Adr+i]:=BrCAN_InBuf[i];
        BrCAN_Adr:=BrCAN_Adr+8;
        Form2.ProgressBar1.Position:=Round((BrCAN_Adr)*0.05);
        N:=0;
      end;
    end;
    Form1.RdCFG_SAS(_SizeSector_SAS-8); // //ñòåíèå CRC CFG
    Form1.Edit438DblClick(nil); //ñòåíèå CRC ïðîãðàììû
    Form1.View_SAS_CFG;
    SAS_CFG_ReadCmpl:=True;
    if not SAS_Write_Cmpl then
    calibrSB.SimpleText:='ÂÛÏÎËÍÅÍÎ ÷òåíèå CFG SAS'
    else
    begin
       SAS_Write_Cmpl:= False;
       calibrSB.Color := clMoneyGreen;
       calibrSB.SimpleText:='ÂÛÏÎËÍÅÍ Ââîä íîìåðà SN'
    end;
Label_End:
    Form1.Close_Form2;    // çàêðûâàåì ôîðìó 2
    Form1.FormEnable;     // ðàçðåøåíèå Form1
    Fl_ComThread :=True;  // ðàçðåøàåì ïîòîê Combegin
end;

procedure TForm1.RdCFG_SAS(A:integer);
Var Loop: integer;
    Str: string;
begin
    BrCAN_Adr:= A;
    FormISO.Read_BridgeCAN;
    repeat Application.ProcessMessages until BrCAN_Read_Cmpl;
    if not BrCAN_Read_Error then
    begin
      for Loop:=0 to 7 do
      begin
        SAS_CFG_Buff[A+Loop]:=BrCAN_InBuf[Loop];
      end;
    end;
    Str:='';
end;

procedure TForm1.Edit430DblClick(Sender: TObject);
Var Loop, A: integer;
    Str: string;
begin
    A:=$10;
    BrCAN_DA:=4 or $20;
    BrCAN_Adr:=$05 *65536 + //cCAN_KEY1
               $01 *256  ;  //Com_Rd_CRC
    FormISO.Read_BridgeCAN;
    repeat Application.ProcessMessages until BrCAN_Read_Cmpl;
    if not BrCAN_Read_Error then
    begin
      Str:='0x';
      for Loop:=0 to 3 do
      begin
        Str:=Str+ByteToHexStr(BrCAN_InBuf[Loop+4]);
        SAS_CFG_Buff[A+8+Loop]:=BrCAN_InBuf[Loop+4];
      end;
      Form1.Edit430.Text:=Str;
    end;
end;

procedure TForm1.View_SAS_CFG;
Var Loop, i,A: integer;
    Str: string;
begin
      A:=_SizeSector_SAS-4;
      //CRC
      Str:='';
      for Loop:=0 to 3 do
      Str:=Str+ByteToHexStr(SAS_CFG_Buff[A+Loop]);
      SAS_CFG_CRC:='0x'+Str;
      Edit442.Text:=SAS_CFG_CRC;
      //UID
// 16 80 12 00    04    57 32 46 31 38 34 20
// XY-êîîðäèíàòû  íîìåð
// ÷èïà íà âàôëå  âàôëè     íîìåð ëîòà
      A:=$20;
      Str:='0x';
      for Loop:=0 to 4 do
      Str:=Str+ByteToHexStr(SAS_CFG_Buff[A+Loop]);
      SAS_Chip_WAF_NUM:=Str;
      Edit435.Text:=SAS_Chip_WAF_NUM;
 //     NUM_Chip_WAF:=StrToInt(Str);
      Str:='';
      for Loop:=5 to 11 do
      begin
         if SAS_CFG_Buff[A+Loop] > 31 then
         Str:=Str+Chr(SAS_CFG_Buff[A+Loop]);
      end;
      SAS_Chip_LOT_NUM:=Str;
      Edit436.Text:=SAS_Chip_LOT_NUM;

      A:=$40;
      //ðåâèçèÿ ìèêðîêîíòðîëëåðà
      Edit434.Text:= ByteToHexStr(SAS_CFG_Buff[A+1] shr 4)+'.'+
                     ByteToHexStr(SAS_CFG_Buff[A] shr 4);
      //12 áèò êîä ìèêðîêîíòðîëëåðà
      Edit433.Text:= '0x'+ByteToHexStr(SAS_CFG_Buff[A+3])+
                          ByteToHexStr(SAS_CFG_Buff[A+2]);
      //ðàçìåð ôëàø-ïàìÿòè â Êáàéòàõ.
      SAS_Chip_FLASH_Size:= SAS_CFG_Buff[A+5]*256 +
                            SAS_CFG_Buff[A+4];
      Edit443.Text:=IntToStr(SAS_Chip_FLASH_Size);
      //ðàçìåð ñòðàíèöû ôëàø-ïàìÿòè.
      SAS_Chip_PAGE_Size:= SAS_CFG_Buff[A+7]*256 +
                       SAS_CFG_Buff[A+6];
      Edit444.Text:=IntToStr(SAS_Chip_PAGE_Size);

      //ADUI
      A:=$60;
      Str:='';
      for Loop:=0 to 14 do
      Str:=Str+Chr(SAS_CFG_Buff[A+Loop]);
      Edit432.Text:= Str;
      //Write Cnt
      A:=_SizeSector_SAS-8;
      Label683.Caption:=IntToStr(
                    SAS_CFG_Buff[A+3]*16777216 +
                    SAS_CFG_Buff[A+2]*65536 +
                    SAS_CFG_Buff[A+1]*256 +
                    SAS_CFG_Buff[A]);
      //Âåðñèÿ ÏÎ
      A:=$10;
      Str:=IntToStr(SAS_CFG_Buff[A+4])+'.'+
           IntToStr(SAS_CFG_Buff[A])+'.'+'20'+
           IntToStr(SAS_CFG_Buff[A+2]*10+
                    SAS_CFG_Buff[A+3]);
      Edit437.Text:= Str;
      //CRC
      Str:='0x';
      for Loop:=0 to 3 do
      Str:=Str+ByteToHexStr(SAS_CFG_Buff[A+8+Loop]);
      Edit438.Text:= Str;
      // Íîìåð
      Str:=IntToStr(SAS_CFG_Buff[7])+'.'+
           IntToStr(SAS_CFG_Buff[4]+
                    SAS_CFG_Buff[5]*256+
                    SAS_CFG_Buff[6]*65536);
      Edit440.Text:=Str;
      // Äàòà âûïóñêà
      Str:=IntToStr(SAS_CFG_Buff[0])+'.'+'20'+
           IntToStr(SAS_CFG_Buff[2]*10+
                    SAS_CFG_Buff[3]);
      Edit439.Text:=Str;
end;

procedure TForm1.Button41Click(Sender: TObject);
 Var Loop, i, Temp,TmpH,TmpL : integer;
     Str, hexstr : string;
begin
   hexstr := '0123456789ABCDEF';
   Str:= Edit441.Text;
   if Str <> '' then
   begin
      for i := 1 to 16 do
      begin
        if Str[1] = hexstr[i] then TmpH:=i;
        if Str[2] = hexstr[i] then TmpL:=i;
      end;
      SAS_Read_Adr:= ((TmpH-1)*16+TmpL-1)*256;
   end
   else SAS_Read_Adr:=_Start_CFG_SAS;//$F800;   // íà÷àëî CFG AGS

   if SAS_CFG_CRC <> ''
   then Edit442.Text:=SAS_CFG_CRC;
   SAS_SizeSector:=StrToInt(Edit429.Text);
   SAS_Read_InProcess:=True;  // óïðàâëÿåò ôîðìîé Dump
   SAS_CFG_Start:=SAS_Read_Adr;
   SAS_CFG_End:=SAS_Read_Adr+SAS_SizeSector;

   Form6.Visible:=True;
   Form6.FormShow(nil);
end;

procedure TForm1.ViewSAS;
Var A,B: integer;
begin
    if Com_Connected_F  and not AGS_Make_PGM and
       ((Active_Errors_Array[22] and 1) = 0) then  // m_CAN_SAS_Fail equ  %00000001
    begin
      Form1.GroupBox251.Enabled:=True;
      Form1.Label686.Color:=clLime;
      Form1.Label686.Caption:='Connect';
      // Error
      if SAS_Err_Lo = 0 then Form1.Edit445.Color:= clWindow
                        else Form1.Edit445.Color:= clRed;
      Form1.Edit445.Text:=IntToStr(SAS_Err_Lo);
      if SAS_Err_Hi = 0 then Form1.Edit446.Color:= clWindow
                        else Form1.Edit446.Color:= clRed;
      Form1.Edit446.Text:=IntToStr(SAS_Err_Hi);
      if SAS_CFG_ReadCmpl then
      begin
  //      GroupBox251.Enabled:=True;
        A:=$50; // ADDR_CFG_1
        B:=SAS_CFG_Buff[A];
        Form1.Edit454.Text:=IntToStr(B);
        if (B and 2)=2  then CheckBox338.Checked:=true
                        else CheckBox338.Checked:=false;
        if (B and 4)=4  then CheckBox339.Checked:=true
                        else CheckBox339.Checked:=false;
        Form1.Edit447.Text:= sQffSet($70); //ADDR_GX_OffSet
        Form1.Edit448.Text:= sQffSet($74); //ADDR_GY_OffSet
      end
      else
      begin
        GroupBox251.Enabled:=False;
      end;
    end
    else
    begin
        Form1.Label686.Color:=clRed;
        Form1.Label686.Caption:='Disconnect';
        Form1.GroupBox251.Enabled:=False;
        Form1.calibrSB.Color := clBtnFace;
 //       Form1.calibrSB.SimpleText:='';
    end;
end;


procedure TForm1.Edit438DblClick(Sender: TObject);
Var Loop, A: integer;
    Str: string;
begin
    if not Com_Connected_F then
    begin
        calibrSB.SimpleText:='!Îòñóòñòâóåò ñâÿçü ñ áëîêîì!';
        Exit;
    end;
    A:=$10;
    BrCAN_DA:=4 or $20;
    BrCAN_Adr:=$05 *65536 + //cCAN_KEY1
               $01 *256  ;  //Com_Rd_CRC
    FormISO.Read_BridgeCAN;
    repeat Application.ProcessMessages until BrCAN_Read_Cmpl;
    if not BrCAN_Read_Error then
    begin
      Str:='0x';
      for Loop:=0 to 3 do
      begin
        Str:=Str+ByteToHexStr(BrCAN_InBuf[Loop+4]);
        SAS_CFG_Buff[A+8+Loop]:=BrCAN_InBuf[Loop+4];
      end;
      Form1.Edit438.Text:=Str;
    end;
end;

procedure TForm1.Button78Click(Sender: TObject);
begin
    if not Com_Connected_F then
    begin
        calibrSB.SimpleText:='!Îòñóòñòâóåò ñâÿçü ñ áëîêîì!';
        Exit;
    end;
    if CheckBox345.Checked then
    begin
       SAS_Num:= StrToInt(Form1.Edit456.Text);
       SAS_Num:=SAS_Num+1;
       Form1.Edit456.Text:=IntToStr(SAS_Num);
       AGS_Lot:= StrToInt(Form1.Edit455.Text);
       // ãàñèì
       Edit440.Text:= '';     // Íîìåð SN
       Edit439.Text:= '';     // Äàòà âûïóñêà
       Label683.Caption:= ''; // Ñ÷åò÷èê çàïèñåé
       Form1.Edit454.Text:= ''; //SAS CFG_1
       calibrSB.Color := clBtnFace;
       SAS_Write_Cmpl:=False;
       Form1.btnWrCFGSASClick(nil);
       if calibrSB.SimpleText = 'Oøèáêà çàïèñè CFG SAS' then
       begin
          calibrSB.Color := clRed;
          SAS_Num:=SAS_Num-1;
          Form1.Edit456.Text:=IntToStr(SAS_Num);
          Exit;
       end;
       SAS_Write_Cmpl:=True;
       SAS_CFG_ReadCmpl:=False;
       Form1.RdCFGSASClick(nil);
   //    if calibrSB.SimpleText = 'ÂÛÏÎËÍÅÍÀ çàïèñü CFG AGS' then
       begin
//         if CheckBox319.Checked then
         begin
      //     AGS_Num:= StrToInt(Form1.Edit400.Text);
       //    AGS_Num:=AGS_Num+1;
       //    AGS_Lot:= StrToInt(Form1.Edit399.Text); //ïàðòèÿ
           DiagIni.WriteInteger('NumBlock','SASLastN',SAS_Num);
           DiagIni.WriteInteger('NumBlock','SASLot',SAS_Lot);
         end;
       end;
    end;
end;


procedure TForm1.CheckBox345Click(Sender: TObject);
begin
    if not AGS_CFG_ReadCmpl then
    begin
       if MsgBox('Íåò äàííûõ, Ïðî÷èòàòü CFG ?',
            'Ïðåäóïðåæäåíèå', MB_OKCANCEL	+MB_ICONASTERISK +MB_APPLMODAL)
          = IDCANCEL	 then Exit
       else Form1.RdCFGSASClick(nil);
    end;
    SAS_Num:=DiagIni.ReadInteger('NumBlock','SASLastN',1);
    SAS_Lot:=DiagIni.ReadInteger('NumBlock','SASLot',1);
    if CheckBox345.Checked then
    begin
       Form1.Edit455.Text:=IntToStr(SAS_Lot); //ïàðòèÿ
       Form1.Edit456.Text:=IntToStr(SAS_Num); //
       WrNum.Enabled:=True;
    end
    else WrNum.Enabled:=False;
end;

procedure TForm1.btnWrCFGSASClick(Sender: TObject);
Var Loop, i, Num, Lot, N: integer;
    Str: string;
    DateTime : TDateTime;
    Year, Month, Day : Word;
Label Label_Repeat, Label_End, Label_SkipWrite;
Const
    __SAS_CFG_WrNum = 200;
begin
    if not Com_Connected_F then
    begin
        calibrSB.SimpleText:='! Îòñóòñòâóåò ñâÿçü ñ áëîêîì.';
        Exit;
    end;
 //   WrCFG.Enabled:=false;
    // ïðîâåðêà íàëè÷èÿ äàííûõ
    N:=0;
    for i:=0 to 512 do
    begin
       if SAS_CFG_Buff[i] <> 0 then N:=N+1;
    end;
    if N = 0 then
    begin
  {     if MsgBox('Íåò äàííûõ, Ïðî÷èòàòü CFG ?',
            'Ïðåäóïðåæäåíèå', MB_OKCANCEL	+MB_ICONASTERISK +MB_APPLMODAL)
          = IDCANCEL	 then Exit
       else Form1.RdCFGClick(nil);  }
    end;
    // Íîìåð
    if CheckBox345.Checked then
    begin
      if Form1.Edit456.Text <> ''
      then  Num:= StrToInt(Form1.Edit456.Text)
      else  Num:= 0;
      if Form1.Edit455.Text <> ''
      then  Lot:= StrToInt(Form1.Edit455.Text) //ïàðòèÿ
      else  Lot:= 0;
      if (Num = 0) or (Lot = 0) then
      if MsgBox('Íå ââåäåí íîìåð ',
            'Ïðåäóïðåæäåíèå', MB_OKCANCEL	+MB_ICONASTERISK +MB_APPLMODAL)
            = IDCANCEL	 then Exit
      else
      begin
         NumLot:=false;
         GroupBox252.Focused;
         CheckBox345.Color:=clBtnHighlight;
         repeat Application.ProcessMessages until NumLot;
      end;
      SAS_CFG_Buff[6]:= Num div 65536;
      SAS_CFG_Buff[5]:=(Num mod 65536) div 256;
      SAS_CFG_Buff[4]:=(Num mod 65536) mod 256;
      SAS_CFG_Buff[7]:= Lot;
    end;
    calibrSB.SimpleText:='Çàïèñü CFG SAS';
 //  ProgressBar
    Form2.Caption:='Çàïèñü CFG SAS';
    Form2.Label1.Caption:='Èäåò çàïèñü Flash';
    Form2.Label2.Caption:='Ïîæàëóéñòà ïîäîæäèòå';
    Form2.ProgressBar1.Position:=0;
    Form2.Visible:=True;
    // Äàòà âûïóñêà
    DateTime := Now;
    DecodeDate(DateTime, Year, Month, Day);
    if Year<2000 then Year :=0
    else Year := Year - 2000;
    SAS_CFG_Buff[0]:=Month;
    SAS_CFG_Buff[1]:=0;
    SAS_CFG_Buff[2]:=Year div 10;
    SAS_CFG_Buff[3]:=Year mod 10;
    //
    BrCAN_Adr:=0;
    SAS_CFG_End:=BrCAN_Adr+__SAS_CFG_WrNum;//_SizeSector_AGS-8; //
    BrCAN_DA:=4;
    Fl_ComThread :=false;  // çàïðåøàåì ïîòîê Com
    Form1.FormDisable;     //çàïðåò Form1
    //
    while BrCAN_Adr < SAS_CFG_End do
    begin
      N:=0;
      for i:=0 to 7 do
      begin
         BrCAN_OutBuf[i]:=SAS_CFG_Buff[BrCAN_Adr+i];
         if BrCAN_OutBuf[i] <>0 then N:=N+1;
      end;
  //    if N = 0 then goto Label_SkipWrite;
      N:=0;
Label_Repeat:
      FormISO.Write_BridgeCAN;
      repeat Application.ProcessMessages until BrCAN_Write_Cmpl;
Label_SkipWrite:
      if BrCAN_Write_Error then
      begin
        calibrSB.SimpleText:='?';
        N:=N+1;
        if N < 3 then goto Label_Repeat
        else
        begin
          calibrSB.SimpleText:='Oøèáêà çàïèñè CFG SAS';
          goto Label_End;
        end;
      end
      else
      begin
        BrCAN_Adr:=BrCAN_Adr+8;
        if BrCAN_Adr = (SAS_CFG_End-8) then
        begin
             BrCAN_DA:=BrCAN_DA or $40;
             ComTimeOut.ReadTotalTimeoutConstant:=300;
        end
        else ComTimeOut.ReadTotalTimeoutConstant:=50;
        Form2.ProgressBar1.Position:=Round((BrCAN_Adr)*0.05);
      end;
    end;
    calibrSB.SimpleText:='ÂÛÏÎËÅÍÀ çàïèñü CFG SAS';
    sleep(100);
    //num
    Edit440DblClick(nil);
Label_End:
    ComTimeOut.ReadTotalTimeoutConstant:=50;
    WrCFG.Enabled:=true;
    Form1.Close_Form2;    // çàêðûâàåì ôîðìó 2
    Form1.FormEnable;     // ðàçðåøåíèå Form1
    Fl_ComThread :=True;  // ðàçðåøàåì ïîòîê Com
end;

procedure TForm1.Edit440DblClick(Sender: TObject);
Var Loop, A: integer;
    Str: string;
begin
    BrCAN_DA:= 4;   // SAS
    BrCAN_Adr:= 0;  // ADDR_CFG_Num
    FormISO.Read_BridgeCAN;
    repeat Application.ProcessMessages until BrCAN_Read_Cmpl;
    if not BrCAN_Read_Error then
    begin
      // Íîìåð
      Str:=IntToStr(BrCAN_InBuf[7])+'.'+
           IntToStr(BrCAN_InBuf[4]+
                    BrCAN_InBuf[5]*256+
                    BrCAN_InBuf[6]*65536);
      Edit440.Text:=Str;
      // Äàòà âûïóñêà
      Str:=IntToStr(BrCAN_InBuf[0])+'.'+'20'+
           IntToStr(BrCAN_InBuf[2]*10+
                    BrCAN_InBuf[3]);
      Edit439.Text:=Str;
    end;
end;

procedure TForm1.CheckBox338Click(Sender: TObject);
Var A,B: integer;
begin
    B:=0;
    if CheckBox338.Checked then B:= B or 2;
    if CheckBox339.Checked then B:= B or 4;
    A:=$50; // ADDR_CFG_1
    SAS_CFG_Buff[A]:=B;
end;

procedure  QffSetS(A:Integer;E:String);
Var B: integer;
begin
//   B:=Round(StrToFloat(E)*2048);
//   if B < 0  then B:= B+65536;
   B:= StrToInt(E);
   SAS_CFG_Buff[A+1]:= B div 256;
   SAS_CFG_Buff[A]:= B mod 256
end;
function   sQffSet(A:Integer):String;
Var B: integer;
begin
    B:=SAS_CFG_Buff[A]+SAS_CFG_Buff[A+1]*256;
//    if B >= 32768  then B:= B-65536;
//    sQffSet:= FloatToStrF(B/2048,ffFixed,5,2);
    sQffSet:= IntToStr(B);
end;
procedure TForm1.Edit447Change(Sender: TObject);
begin
     if  Sender = Form1.Edit447 then QffSetS($70,Form1.Edit447.Text);
     if  Sender = Form1.Edit448 then QffSetS($74,Form1.Edit448.Text);
end;


procedure TForm1.TabSheet6Show(Sender: TObject);
begin
   Pcb_Test_Disable:=True;
end;

procedure TForm1.Button76Click(Sender: TObject);
Var Loop: integer;
    Str: string;
Label Label_Repeat;
begin
    if USBopen.Caption='Closed' then
    begin
       MainStatBar.Panels[0].Text := '';
       Edit374.Text:=IntToStr(UpGrade_ComNum);
       Com2_Init;
       TruckSim_ComBaudrate:=460800;
       Edit379.Text:=IntToStr(TruckSim_ComBaudrate);
       Com_Baudrate(TruckSim_ComBaudrate);
       if Fl_ComCreate then  CAN_USB_Open:=true
       else
       begin
         MainStatBar.Panels[0].Text := 'Com'+Edit374.Text+' not Open';
         CAN_USB_Open:=false;
         exit;
       end;
       USBopen.Caption:='Open';
       if CAN_USB_Open then  Fl_CAN_USB:=true;
Label_Repeat:
       if Fl_CAN_USB then
       begin
         FormISO.Test_TruckSim;
         repeat Application.ProcessMessages until Cmd_CANUSB_Ask;
         if not CANUSB_Error then
         begin
           Edit375.Text:=IntToStr(CANUSB_Rx_Cnt);
           Str:='';
           For Loop:=1 to 13 do
           Str:=Str+IntToStr(Buf.Osc[Loop])+' ';
           Label613.Caption:=Str;
           SinxrRoadTest:=True;
           Form1.CANOsc;
         end;
         goto Label_Repeat;
       end;
    end
    else
    begin
       Com_Close;
       CAN_USB_Open:=false;
       Fl_CAN_USB:=false;
       Fl_UpGradeSTM:=false;
       USBopen.Caption:='Closed';
       Test1.Caption:='Stop';
       Test3.Caption:='Stop';
       Test2.Caption:='Stop';
       MainStatBar.Panels[0].Text:= '';
       Test2.Enabled:=False;
       Test1.Enabled:=False;
       Test3.Enabled:=False;
       UpGrade.Enabled:=False;
    end;
end;

procedure TForm1._SelRoad_GridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
    Form1.Edit418.Text:=IntToStr(ARow);
    FormISO.DownLoadOscAddress;
end;

procedure TForm1.rg3Click(Sender: TObject);
begin
     if Form1.rg3.ItemIndex = 0
     then  DIA_MC_Num:= 1
     else  DIA_MC_Num:= 2;

end;

procedure TForm1.Label34DblClick(Sender: TObject);
begin
    if Not(Com_Connected_F) then Exit;
    RunWay:= 0;
    if MsgBox('Óâåðåíû â Ñòèðàíèè Ïðîáåãà',
            'Ïðåäóïðåæäåíèå', MB_OKCANCEL	+MB_ICONASTERISK +MB_APPLMODAL)
       = IDCANCEL	 then Exit;
    FormISO.RunawaySave;
end;

procedure TForm1.btn_GD1Click(Sender: TObject);
var
    Path, Com, Bin:string;
    FileName_STM: string;
    StartupInfo_STM: TStartupInfo;
    ProcessInfo_STM: TProcessInformation;
    Result_STM: Cardinal;
    Cnt_Process_STM: DWORD;

Label Label_Repeat,Label_End;

begin
    if not ProgGD1_Checked then
    begin
        Memo3.Lines.Add('Íå ìîãó çàïðîãðàììèðîâàòü !!! Íåò ïòè÷êè GD1_Checked');
        Exit;
    end; 
    Form1.btn_GD1.Down:=True;
    //Path:= '"C:\Program Files (x86)\STMicroelectronics\STM32 ST-LINK Utility\ST-LINK Utility\ST-LINK_CLI.exe"';
    Path:= '"'+Path_STLINK_CLI+'\STM32 ST-LINK Utility\ST-LINK Utility\ST-LINK_CLI.exe"';
    Bin:= ProgSTM_File;
    // +ST_LINK_SN+ íå ðàáîòàåò  39FF72065041393440350143
    Case Form1.rg4.ItemIndex of
       0: Com:=' -c  SN=39FF72065041393440350143 SWD UR Hrst -p '+Bin+' 0x08000000 -Rst';// PROG 1
       1: Com:=' -c  SN=39FF72065041393440350143 SWD UR Hrst -p '+Bin+' 0x08000000 -Rst';// PROG 2
    end;
    FileName_STM:= PChar(Path + Com);
    FillChar(StartupInfo_STM, SizeOf(StartupInfo_STM), #0);
    StartupInfo_STM.cb := SizeOf(StartupInfo_STM);
    StartupInfo_STM.dwFlags := STARTF_USESHOWWINDOW or STARTF_FORCEONFEEDBACK;
    StartupInfo_STM.wShowWindow := SW_HIDE;// SW_SHOW;//
    if not
      CreateProcess
      (nil,
       @Filename_STM[1],
       nil,
       nil,
       false,
       NORMAL_PRIORITY_CLASS,
       nil,
       nil,
       StartupInfo_STM,
       ProcessInfo_STM)
    then exit;
    // æäåì çàâåðøåíèÿ èíèöèàëèçàöèè
    Result_STM:=WaitForInputIdle(ProcessInfo_STM.hProcess, 100);
    Cnt_Process_STM:=0;
    Form1.Memo3.Clear;
    //  ProgressBar
    Form2.Caption:='Çàïèñü ïðîãðàììû GD1';
    Form2.Label1.Caption:='Èäåò çàïèñü Flash';
    Form2.Label2.Caption:='Ïîæàëóéñòà ïîäîæäèòå';
    Form2.ProgressBar1.Position:=0;
    Form2.Visible:=True;
    //
    repeat
       Application.ProcessMessages;
       WaitForSingleObject(ProcessInfo_STM.hProcess, 100);
       GetExitCodeProcess(ProcessInfo_STM.hProcess, Result_STM);
       Cnt_Process_STM:=Cnt_Process_STM+1;
       Form2.ProgressBar1.Position:=Round(Cnt_Process_STM*0.5);
       if (Result_STM <> 259) and
          (Result_STM <> 0)
        {  (Result_STM = 21) or // BDM_RC_SYNC_TIMEOUT
          (Result_STM = 102)   // PROGRAMMING_RC_ERROR_WRONG_SDID }
       then
       begin
         Memo3.Lines.Add('Îøèáêà '+ IntToStr(Result_STM));
         goto Label_End;//exit;
       end;
    Until Result_STM = 0;
    //
Label_End:
    if ProcessInfo_STM.hProcess <> 0
    then CloseHandle(ProcessInfo_STM.hProcess);
    if ProcessInfo_STM.hThread <> 0
    then CloseHandle(ProcessInfo_STM.hThread);

    Form1.btn_GD1.Down:=False;
    Form1.btn_GD1.Enabled:=True;
    Form1.Close_Form2;    // çàêðûâàåì ôîðìó 2
    Memo3.Lines.Add('Ñäåëàíà Çàïèñü GD1 çà '+
                    FloatToStrF(Cnt_Process_STM/10,ffFixed,4,1)+'c');
end;

procedure TForm1.btn_GD2Click(Sender: TObject);
var
    Path, Com, Bin:string;
    FileName_STM: string;
    StartupInfo_STM: TStartupInfo;
    ProcessInfo_STM: TProcessInformation;
    Result_STM: Cardinal;
    Cnt_Process_STM: DWORD;

Label Label_Repeat,Label_End;

begin
    if not ProgGD2_Checked then
    begin
        Memo3.Lines.Add('Íå ìîãó çàïðîãðàììèðîâàòü !!! Íåò ïòè÷êè GD2_Checked');
        Exit;
    end;
    Form1.btn_GD2.Down:=True;
 //   Path:= '"C:\Program Files (x86)\STMicroelectronics\STM32 ST-LINK Utility\ST-LINK Utility\ST-LINK_CLI.exe"';
    Path:= '"'+Path_STLINK_CLI+'\STM32 ST-LINK Utility\ST-LINK Utility\ST-LINK_CLI.exe"';
    Bin:= ProgSTM2_File;
    // +ST_LINK_SN+ íå ðàáîòàåò
    Case Form1.rg4.ItemIndex of
       0: Com:=' -c  SN=39FF72065041393443340143 SWD UR Hrst -p '+Bin+' 0x08000000 -Rst';// ñòàðàÿ ïëàòà
       1: Com:=' -c  SN=39FF6E065041393443360143 SWD UR Hrst -p '+Bin+' 0x08000000 -Rst';//CKU + DUE
    end;
    FileName_STM:= PChar(Path + Com);
    FillChar(StartupInfo_STM, SizeOf(StartupInfo_STM), #0);
    StartupInfo_STM.cb := SizeOf(StartupInfo_STM);
    StartupInfo_STM.dwFlags := STARTF_USESHOWWINDOW or STARTF_FORCEONFEEDBACK;
    StartupInfo_STM.wShowWindow := SW_HIDE;// SW_SHOW;//
    if not
      CreateProcess
      (nil,
       @Filename_STM[1],
       nil,
       nil,
       false,
       NORMAL_PRIORITY_CLASS,
       nil,
       nil,
       StartupInfo_STM,
       ProcessInfo_STM)
    then exit;
    // æäåì çàâåðøåíèÿ èíèöèàëèçàöèè
    Result_STM:=WaitForInputIdle(ProcessInfo_STM.hProcess, 100);
    Cnt_Process_STM:=0;
    Form1.Memo3.Clear;
    //  ProgressBar
    Form2.Caption:='Çàïèñü ïðîãðàììû GD2';
    Form2.Label1.Caption:='Èäåò çàïèñü Flash';
    Form2.Label2.Caption:='Ïîæàëóéñòà ïîäîæäèòå';
    Form2.ProgressBar1.Position:=0;
    Form2.Visible:=True;
    //
    repeat
       Application.ProcessMessages;
       WaitForSingleObject(ProcessInfo_STM.hProcess, 100);
       GetExitCodeProcess(ProcessInfo_STM.hProcess, Result_STM);
       Cnt_Process_STM:=Cnt_Process_STM+1;
       Form2.ProgressBar1.Position:=Round(Cnt_Process_STM*0.5);
       if (Result_STM <> 259) and
          (Result_STM <> 0)
        {  (Result_STM = 21) or // BDM_RC_SYNC_TIMEOUT
          (Result_STM = 102)   // PROGRAMMING_RC_ERROR_WRONG_SDID }
       then
       begin
         Memo3.Lines.Add('Îøèáêà '+ IntToStr(Result_STM));
         goto Label_End;//exit;
       end;
    Until Result_STM = 0;
    //
Label_End:
    if ProcessInfo_STM.hProcess <> 0
    then CloseHandle(ProcessInfo_STM.hProcess);
    if ProcessInfo_STM.hThread <> 0
    then CloseHandle(ProcessInfo_STM.hThread);

    Form1.btn_GD2.Down:=False;
    Form1.btn_GD2.Enabled:=True;
    Form1.Close_Form2;    // çàêðûâàåì ôîðìó 2
    Memo3.Lines.Add('Ñäåëàíà Çàïèñü GD2 çà '+
                    FloatToStrF(Cnt_Process_STM/10,ffFixed,4,1)+'c');
end;

procedure TForm1.CheckBox354Click(Sender: TObject);
begin
   if Form1.CheckBox354.Checked then
         ProgGD1_Checked:=True
   else  ProgGD1_Checked:=False;
   DiagIni.WriteBool('UpGrade_Serial','ProgGD1_Checked',ProgGD1_Checked);
end;

procedure TForm1.CheckBox355Click(Sender: TObject);
begin
   if Form1.CheckBox355.Checked then
         ProgGD2_Checked:=True
   else  ProgGD2_Checked:=False;
   DiagIni.WriteBool('UpGrade_Serial','ProgGD2_Checked',ProgGD2_Checked)
end;

procedure TForm1.rg4Click(Sender: TObject);
begin
    DiagIni.WriteString('UpGrade_Serial','ProgrammatorNEW',IntToStr(Form1.rg4.ItemIndex));
end;

function TTabSheetHelper.GetHighlighted: Boolean;
begin
  Result := fsBold in Self.Font.Style;
end;

procedure TTabSheetHelper.SetHighlighted(const Value: Boolean);
begin
  if Value then
    Self.Font.Style := Self.Font.Style + [fsBold]
  else
    Self.Font.Style := Self.Font.Style - [fsBold];
end;

function MsgBox(const Text, Caption: string; Flags: Longint): Integer;
begin
  // UTF8Encode(UnicodeString) -> UTF8String (AnsiString CP_UTF8)
  // PAnsiChar(...) — явно PAnsiChar, потому что PChar в этом модуле = PWideChar
  Result := Application.MessageBox(
              PAnsiChar(UTF8Encode(Text)),
              PAnsiChar(UTF8Encode(Caption)),
              Flags);
end;

//function GetClickedLegendIndex(Chart: TChart; X, Y: Integer): Integer;
//var
//  i: Integer;
//  Li: TLegendItem;
//  R: TRect;
//begin
//  Result := -1;
//  if (Chart = nil) or (Chart.Legend = nil) then Exit;
//
//  for i := 0 to Chart.Legend.ItemCount - 1 do
//  begin
//    Li := Chart.Legend.Item[i];
//    if Li = nil then Continue;
//
//    R := Rect(Li.Left, Li.Top,
//              Li.Left + Li.Width,
//              Li.Top  + Li.Height);
//
//    if PtInRect(R, Point(X, Y)) then
//    begin
//      Result := i;
//      Exit;
//    end;
//  end;
//end;

end.

