unit ABSGlobal;

{$mode delphi}{$H+}
{$modeswitch unicodestrings}
{$WARN SYMBOL_PLATFORM OFF}
{$WARN 5024 OFF}

interface

uses
  {$IFDEF MSWINDOWS}
  Windows,
  {$ELSE}
  LCLType, LMessages,
  {$ENDIF}
  SysUtils, Classes, Graphics, Controls, StdCtrls, Buttons, IniFiles,
  Variants;   // FileFrame*, ComBuf

type
  OscType = record
    PreviousYPosition: Byte;
    PreviousXPosition: Word;
    Color: TColor;
    Enabled: boolean;
    OscLabel: TLabel;
  end;

  DMath  = single;
  DSave  = single;
  DFloat = single;

  MSpar = record
    C1: DMath;
    C2: DMath;
    C3: DMath;
  end;

  BType = record
    M0,M1,M2,M3,
    V0,V1,V2,V3,J0,J1,J2,J3,
    P0,P1,P2,P3,V,J,i: DSave;
    OSS1,OSS2,OSS3,OSS4,OSS5,OSS6: Byte;
  end;

  TFooClass = class(TControl);

const
  Modif_Size           = 12;
  Const_Image_Err_New  = 26;
  Const_Image_Err_Old  = 16;
  Number_Error_Old     = 26;
  Number_Error_New     = 42;
  Const_EEPROMSize_New = 1024;
  Const_EEPROMSize_Old = 256;

  NumberOsc_Old        = 12;
  NumberOsc_Old16      = 16;
  NumberOsc_New        = 20;
  NumberOsc_New24      = 24;

  SizeDumpMOT          = 767;

  FlashSectorSize_New  = 768;
  FlashSectorSize_Old  = 128;

  SizePaketSTM         = 32;
  SizeSectorSTM        = 2048;
  SizeFlashSTM         = 126976;
  Start_ProgramSTM     = 0;
  Start_ProgramSTM_v8  = $1000;
  SizeSectorSTM042     = 1024;

  SizePaketPA          = 8;
  SizeSectorPA         = 512;
  SizeFlashPA          = 65536;
  Start_ProgramPA      = $3200;
  Start_ProgramPA32    = $8600;

  _SizeSector_AGS      = 1024;
  _Start_CFG_AGS       = $7C00;
  _End_PGM_AGS         = $7400;

  _SizeSector_SAS      = 1024;
  _Start_CFG_SAS       = $7C00;
  _End_PGM_SAS         = $7400;

  ConstRunaway         = 10;
  ConstWorkTime        = 128;
  ParamCod             = '1';

var
  // ---- Word/Excel COM ----
  MsWord, MsExcel          : Variant;
  Doc, DocEx, ExcelSheet   : OleVariant;
  CFG_Excel_File           : String;

  // ---- INI ----
  DiagIni, CarIni          : TIniFile;

  // ---- кнопки / лампы ----
  SbArray                  : array [0..30] of TSpeedButton;
  SbColorBuf               : array [0..30] of Byte;
  BufLampOsc               : array [0..16] of Byte;
  MC1_BufLampOsc           : array [0..8] of Byte;
  MC2_BufLampOsc           : array [0..8] of Byte;

  // ---- потоки / таймеры ----
  ThreadHandle, ProcessHandle : tHandle;
  ProcessID                : DWord;
  StartTimer_Value, StopTimer_Value, TimerFreq_Value : Int64;
  ProcessInfo              : TProcessInformation;
  hhhCOM                   : tHandle;
  LBool                    : LongBool;

  // ---- EEPROM ----
  EEPROM_Array             : array[0..4095] of Byte;
  EEPROM_Size, CheckSumRom, CheckSumConst : Integer;
  Moto_EEPROM_Start        : Integer;

  // ---- UI-состояние рисования ----
  X1, Y1, X0, Xa, Ya, Y2   : Integer;
  bPauseDraw, Fl_vert, FlPutFirst : boolean;
  GImage                   : TBitmap;

  // ---- пути и конфиги ----
  Const_File, Prog_File, ConstAT_File, FileCarName, RoadDir : String;
  Config_File, OpenDlg_Path, SaveDlg_Path : String;
  IniPath, ProtDir, System_PSW, str_comb3 : String;

  // ---- misc / общие ----
  EditNum, EditNum1        : TObject;
  EpromCon, EpromName, EpromData : array[0..255] of String;
  EpromConIndex            : array[0..255] of Integer;
  EpromConSize             : Integer;
  EpromAdr, IndCod, DiamKol, CAN_KuASR, CAN_KuDB : String;

  adrEPROM, aEPROM, adEPROM, bEPROM, WorkTime, BaseDec,
  AdrTestDIF, AdrTestLamp  : word;
  dEPROM, dataEPROM, PointDec, DatTestDIF, DatTestLamp,
  TestLampABS, TestLampASR : byte;

  Runaway, Work_Time       : Real;
  RunWay                   : dword;
  SenOscPos, OscPos, OscPosPrevious : Integer;

  // ---- ошибки ----
  Active_Errors_Array      : array[0..30] of Integer;
  NumBit_ErrByte           : array[0..127] of Byte;

  // ---- буферы данных ----
  addrArray, dataArray     : array[0..2047] of byte;
  InidataArray             : array[0..2047] of byte;
  B12addrArray, B12dataArray : array[0..255] of byte;
  DdataArray               : Array [0..255] of Byte;
  DaddrArray               : Array [0..255] of Word;
  DumpNum                  : integer;

  DumpEPROM                : array[0..2047] of Byte;
  DumpMOT                  : array[0..767] of Byte;
  DumpMOTcopy              : array[0..767] of Byte;
  ConfigMOT                : array[0..127] of Byte;
  DumpFlash                : array[0..65536] of Byte;
  RAMMOT                   : array[0..512] of Byte;

  ReadMass                 : array[0..65536] of Byte;
  WriteMass                : array[0..65536] of Byte;

  MotoRam, ATMEL_RAM       : Array[0..2047] of Word;

  // ---- осциллограф / сенсоры ----
  OscArray                 : array[1..32] of OscType;
  OscData                  : array[1..32] of Byte;
  CANData                  : array[1..12] of Byte;
  ADCData                  : array[1..24] of Byte;
  TestData                 : array[1..48] of Byte;
  VarMDT                   : array[1..100] of Byte;
  VarMDT_Ptr               : byte;
  ECUID_Data               : array[1..16] of Byte;
  SenOscArray              : array[1..32] of OscType;
  SenOscData               : array[1..32] of word;
  SenOscTest_Data          : array[1..32] of Real;
  SenOscTest_Thresh        : array[1..32] of Real;
  SenOscTest_Result        : array[1..32] of Byte;

  LABScolor, LASRcolor, LVDCcolor, ABS_System_F0 : byte;

  // ---- адреса DumpMOT ----
  AdrLamp, AdrStop, ATStatus, AdrPWM, PWM, CANAddress,
  AdrDSC_Flags, AdrECUID_Dat0, AdrECUID_Dat8, AdrPcb_Test_1,
  AdrVarMDT_v8, ADCDataBuffer_v8,
  W0_Presure_C, Weel0_Error_Reg0, ConfIndex, AdrSPI_In_Buff,
  AdrTIMER_LOW, AdrRunaway_0, SwASRIndex, SwABSIndex, StopIndex,
  PnevmoIndex, PriorIndex, Adr_W2_Runaway_Buf, Adr_BufRunaway,
  PK_Ku, PK_dKu, PK_KoHi, PK_KoLo, PK_Ko, PK_Kv, PK_dKoD, PK_Tip : Integer;

  // ---- флаги конфигурации ABS ----
  StopEnable, PressEnable, MotorEnable, LIMenable,
  DBREnable, R_DBREnable, TaxoEnable : boolean;
  FunctionIndex            : integer;

  SinxrOsc, SinxrPoly, DrawGridF, SenDrawGridF,
  SinxrSenOsc, SinxrRoadTest, DrawThreadFlag,
  PolyProgress, ProtokolMake, ProtokolSave, CompStend : boolean;

  ModelStr, VehNum, DateSet, PlaceSet, StrModif, StrYear,
  StrManuf, StrModel, StrEngine, StrNumber,
  NumSS1, NumSS2, NumSS3, NumSS4,
  NumMD1, NumMD2, NumMD3, NumMD4, NumPK, NumDIF, Decimal_Number : string;

  // ---- VIN / модификация ----
  VehicleModel, VehicleComplect, SetProtocol : Word;
  VehicleEngine, VehicleManuf, VehicleModif,
  VehicleYear, SetYear, SetMonth, SetDay, SetCod,
  Vehicle_StateAGS, Vehicle_StateSAS,
  DSC_Flags1, DSC_Flags2, DSC_Flags3, DSC_Flags4, DSC_Flags5,
  DSC_Flags6, DSC_Flags7, DSC_Flags8, DSC_Flags4s,
  Engine_PercentLoss : byte;
  VehicleNumber            : integer;
  FL_Vehicle, FL_Model, FL_VIN, FL_ReadVDCVAR : boolean;
  SAS_Zero_Angle, ECAS_PS_Offset, PS_CAN_SA : integer;

  Vehicle_VIN, Vehicle_VIN_CFG, Vehicle_VIN_CFG_F9, VIN_Model_F9,
  VIN_Manuf, VIN_Model, VIN_Engine, VIN_Year, VIN_Num,
  Vehicle_Modification, Vehicle_Modification_F10, DefaultCFG_Name : string;
  Vehicle_VIN_Data         : array[0..20] of Byte;
  Vehicle_Modif_Data       : array[0..15] of Byte;
  CFG_SetCod               : Byte;
  CFG_SetCodV8             : Byte;
  Fl_VIN_CFG, Fl_Word_CFG, Fl_Dump_Fail, Type_VIN_New : boolean;

  // ---- счётчики ----
  StopCNT, DifCNT, Mod1CNT, Mod2CNT, Mod3CNT, Mod4CNT : word;
  AdrStopCNT, AdrDifCNT, AdrMod1CNT,
  AdrMod2CNT, AdrMod3CNT, AdrMod4CNT : byte;
  PolyPhase, EmulCount, connum, B12num, ErrorAT_Num : integer;

  // ---- флаги режима / программирования ----
  constnotfound, RoadEmul_Flag, SinxrEmul, EmulAccel, SinxrE,
  Protocol_Save : boolean;
  Cabel_F, RepeatIni_F, Fl_ATTime, Fl_ATEPROMini,
  fl_change_comp, Fl_ATEPROM_B12, Fl_DumpATLoad, fl_change_Err, Fl_EPROM_Error,
  Fl_EPROM_FPROT, Fl_ResetMCU, Fl_WriteConst, Fl_FlashProtect_Compleet : boolean;
  fl_change_conf, fl_change_mot, fl_Security, fl_Security_Com : boolean;
  fl_change_Press, Fl_FlashLoad, fl_GetMem_CAN, Flash_Protected,
  Flash_UnProtected_All, Flash_UnProtected_CFG : boolean;
  ModCommand               : Byte;

  KeyByte1, KeyByte2, KeyByte3,
  KeyIni1, KeyIni2, KeyIni3,
  nKeyIni1, nKeyIni2, nKeyIni3,
  KeyIni1v10, KeyIni2v10, KeyIni3v10,
  KeyIni1v8, KeyIni2v8, KeyIni3v8,
  KeyIni1v9, KeyIni2v9, KeyIni3v9 : integer;

  fl_PWM_Prop, fl_PWM_Direct, PWM_Emul_Flag, fl_PWM_Sinxr,
  Fl_SendPGMcnt, Fl_SendInhcnt, Plata_SKU_DUE : boolean;
  Cnt_Test_PWM             : integer;

  // ---- адресация Flash / блока ----
  Program_Start, DumpMOTStart, DumpMOTEnd, ConstStart, SpeedConst,
  CFG_OffSet_Dump, W_Errors_Num, adrCheckSumRom : integer;
  ADRE_Y_M, ADRE_M_M, ADRE_Lot_M, ADRE_NH, ADRE_NL, VER_PO, ADRE_Lot_M_V8,
  adrEEPROM_ATMEGA, Tip_Block, NumCh_Block : integer;
  Adr_PassEr_H, Adr_TimeErr_H, Adr_Last_Er_H, Adr_CntErr_H, adrPGMcnt, adrFPROT,
  adrMCGTRM, adrNVFTRIM,
  Adr_CorrKdec_H, Wheel0_Speed, W0_Gap_Value, c_GapMulConst, Tip_CPU : integer;

  BytesSend, BytesReceive  : Byte;
  fl_FlashProg, ABS_Poly, Change_NumBlock, Stend_Fl : boolean;
  PrBr, Command_Buf       : byte;
  ComBaudrate, ComAdapter, EEPROMSize : integer;
  Adr_ProgFlash_Start, Adr_ProgFlash_End, Adr_ProgFlash_SP, AdrSec : integer;
  Fl_fast_load, Fl_Error_Prog, Fl_ProgStart, CheckSumRom_Calc,
  Fl_Abort_ReasError      : boolean;
  DumpFlash_End           : integer;
  Prog_s19, Sec_s19, V_PO_DZ : String;
  hhKey                   : Word;
  Fl_WriteMot_con, Fl_MC1_TestLamp, Fl_MC2_TestLamp, Config_Fail : boolean;
  ADCDataBuffer, GndD_On_Val, Stend_Buf, Stend_Step : integer;
  Stend_Buf_Adr           : word;
  Stend_Buf_Dat           : Byte;
  Fl_ClrErr_Message, Stend_Blok_SEl, Stend_Securyte, Fl_TestStart : boolean;
  LookFl, DumpMOT0, DumpMOT7, DumpMOT126, DumpMOT127 : byte;
  Sens_Config, Mod_Config, DSC_Config_1, DSC_Config_2, DSC_Config_3,
  Def_Config_3, CAN_Oss_TipBlock, DIA_MC_Num : byte;

  // ---- DSC/VDC ----
  Kus, L_base, Akk, Vmc, K_Scale, A_base, B_base, Tfront : Real;
  K_Q_Acker, K_L_Acker, Ratio_Steer, Car_Base, Car_BaseOO,
  Car_CG_A, Car_CG_B, Koef_FySa, Koef_AydVf : integer;
  OffSet_temp, OffSet_YawRate, OffSet_Steer, OffSet_AccY, OffSet_AccX : integer;
  K_Scale_Acc_Y, K_Scale_Omega_Z, K_Scale_Acc_X, K_Scale_Steer_Angle : integer;
  DSC_K_Ay_dVy, EngineTorquePeak, EmptyMass,
  Hitch_MaxLoad, FrontAxis_EmptyLoad, RearAxis_EmptyLoad : integer;

  DSCPulsPress_Com        : Byte;
  Image_Err_Num           : integer;
  Fl_Engine, Fl_Engine_Brake, Fl_Engine_Drag, Fl_VDC_TestLamp,
  clrStateAGS, Fl_VDC_Emergency, Fl_Clr_VIN, Fl_AGS_UpGrade, Fl_VDC_HaltBrake,
  Fl_Retarder, Fl_Retarder_Brake, Fl_Retarder_Off, Fl_VDC_StopLight,
  Fl_DifXX, Fl_DifFront_ON, Fl_DifRear_ON, Fl_MOD_test_ON, Fl_HillHolder_ON,
  Fl_PnevmoTest_ON, Fl_DifTrailer_ON, clrFl_BreakFront_ON, Fl_DefConfigLoad,
  Fl_TabSheet8Show, Fl_ReadFPROT, Fl_VarMDT,
  Fl_BreakFront_ON, Fl_BreakRear_ON, clrFl_BreakRear_ON,
  Fl_HaltBrake_ON, clrFl_HaltBrake_ON, Fl_XBR_ON, clrFl_XBR_ON,
  Fl_Prop, Fl_Prop_On, Fl_MAN_Poz,
  Fl_BrakeFront_Only, Fl_BrakeRear_Only, clrFl_Brake_Only : boolean;

  DSC_Akker, DSC_OmegaZ, DSC_AccY, DSC_AccX : byte;
  AGS_Buf_Adr, Road_Sel_Adr, TestPoint_Sel_Adr : word;
  Omega_X, Omega_Y, Omega_Z, Accel_X, Accel_Y, Accel_Z, Steering_Angle : integer;

  EBS22_Buf_Adr, EBS22_AxleLoadSum, WriteTestVAR_Addres, Wheel5_Speed,
  VDCTestVAR_Adr, CAN_HDRH_Adr, Test_VAR5_Adr, CAN_VAR4_Adr,
  Adr_CAN_DA, Adr_CAN_VIN_DA, DiagTest_VAR_Adr, DiagTest_VAR_Adr_v8,
  Adr_CAN_VIN, Adr_CAN_VIN8, Adr_CAN_VIN16, Adr_CAN_VIN24, Adr_SN : word;

  EBS22_Status1, EBS22_Status2, EBS22_Status3, EBS22_Status4,
  Trailer_Num, EBS22_Cnt, StopPress, EBS21_Status1, EBS21_Status2,
  TrailerPress, BrakeDemand, WriteTestVAR_Byte, CAN_CCVS_Status,
  CAN_Driver, CAN_Torque, CAN_Taxo, CAN_Accelerator,
  CAN_CruCon_Status, CAN_CCVS_Speed, CAN_ASC1_Status,
  CAN_AirPress_1, CAN_AirPress_2, CAN_TCO1_Status,
  Gear_Num, CAN_PGN_Find, CAN_PGN_Tout, Validity_Flags,
  Trailer_Press_1L, Trailer_Press_1R, Trailer_Press_2L,
  Trailer_Press_2R, Trailer_Press_3L, Trailer_Press_3R,
  FrontInPress, RearInPress, EBL_REG_Koef, Load_Koef,
  EBS25_Cnt, EBS25_Status5, CANT_Mode, Trailer_Press,
  SelfTun_Break_KP, Brake_Time1,
  SelfTun_Engine_Loss_K1, SelfTun_Engine_Loss_K2,
  SelfTun_Engine_PTxx, EC1_TorquePoint1, EC1_TorquePoint5,
  FL_Delay_Exh, FL_Delay_Pump, FR_Delay_Exh, FR_Delay_Pump,
  RL_Delay_Exh, RL_Delay_Pump, RR_Delay_Exh, RR_Delay_Pump,
  CAN_EBC1_B3, CAN_EBC1_B6, CAN_EBC1_B7, CAN_EBC1_Adr, CAN_DC1_Adr,
  CAN_Flags7, PGN_FF23_Ubat, PGN_FF20_Status1, PGN_FF20_Status2,
  PGN_FF21_Status1, PGN_FF22_AIR1, PGN_FF22_AIR2,
  PGN_FF22_Temp, PGN_FF22_Fuel, CAN_VIN_DA, DSC_Flags1s,
  CAN_Gear_State, CAN_Gear_Num, Door_Status, Pcb_Test_BrPS_Val,
  Load_Brake_Num, Load_Engine_Num : byte;

  TrainMass, Hitch_Fz, TrailerMass_Est, FrontAxle_Load,
  Mass_Break_Est, Mass_Engine_Est, Truck_Mass_ECAS,
  TCO_Koef, Config_Cnt, TCO_Koef_Adr, CAN_Buff_Adr, BellowPress,
  TCO_KoefFront, TCO_KoefRear,
  RearAxle_Load, CAN_TCO1_Speed, CAN_TCO1_Taxo, CAN_AmbientAir,
  TCO_Gear_Koef, Trailer_Speed, Engine_Torque_Nm, Below_SensPress,
  SelfTun_PeakTorque, Engine_TorqueLoss, EC1_RefTorque, CAN_Gear_OutTaxo,
  EC1_TaxoPoint1, EC1_TaxoPoint2, EC1_PeakTorque, PGN_FF22_Taxo,
  Brake_Deccel1            : word;

  CAN_HDRH_Distance        : dword;

  Find_EEC1, Find_EEC2, Find_CCVS, Find_TCO1,
  Find_VDHR, Find_ASC4, Find_AMB, Find_AIR1,
  Tout_EEC1, Tout_EEC2, Tout_CCVS, Tout_TCO1,
  Tout_VDHR, Tout_ASC4, Tout_AMB, Tout_AIR1, CAN_DA_Fl : boolean;
  NumberOsc                : integer;
  LoadMotoConst_F, Fl_Message_VIN : boolean;

  // ---- Flash STM/PA/DZ общее ----
  S19Buff                  : array[0..65536] of Byte;
  PaketData                : array[0..48] of Byte;
  Sector, SectorStart, PaketAdr, Paket, PaketNum, Repeat_Cnt : Integer;
  SectorNum, SectorAdr, SectorKSUM, S19Start : integer;
  PGM_RAMBufAdr, NVFTRIM   : word;
  MCnum, FPROT, TRIM, PGM_Ask, PGM_Error, Cmd_Error,
  DZ_PGMCnt, DZ_InhCnt, STM_Cnt : Byte;
  AdrStart_F, InitProg_Ask, Fl_ProgROM, Fl_ProgS19,
  Fl_ProgDZ, Fl_ProgPA, Fl2_ProgSTM, Fl_ProgLoaderSTM, Fl_ProgCAN_STM,
  CmdProg_Ask, PGM_Error_Ask, PGM_Null_Ask : boolean;

  SizeFlashSector, ConstSectorNum : integer;

  // ---- UpGrade файлы ----
  SAS_UpGrade_File, CRC_SAS, V_PO_SAS : String;
  SAS_UpGrade_CANUSB      : boolean;

  AGS_UpGrade_File, CRC_AGS, V_PO_AGS : String;
  UpGrade_ComNum, UpGrade_ComBaudrate : integer;
  AGS_UpGrade_CANUSB, UpGrade_InPro : boolean;

  // ---- CFG SAS ----
  SAS_Read_Data            : array[0..7] of Byte;
  SAS_Write_Data, SAS_Err_Hi, SAS_Err_Lo, SAS_CFG1_B0 : Byte;
  SAS_Write_Adr, SAS_Read_Adr,
  SAS_CFG_Start, SAS_CFG_End, SAS_Sise_Sector, SAS_Chip_PAGE_Size,
  SAS_Chip_FLASH_Size, SAS_Chip_REVID, SAS_Chip_DEVID : word;
  SAS_CFG_CRC, SAS_Chip_WAF_NUM, SAS_Chip_LOT_NUM : String;
  SAS_PGM_CRC, SAS_NUM_Chip_WAF, SAS_SizeSector : integer;
  SAS_Read_InProcess, SAS_Write_Active,
  SAS_Read_Cmpl, SAS_Read_Error, SAS_CFG_ReadCmpl,
  SAS_Write_Cmpl, SAS_Write_Error, SAS_NumLot, SAS_Make_PGM : boolean;
  SAS_CFG_Buff             : array[0..1024] of Byte;

  // ---- CFG AGS ----
  AGS_Read_Data            : array[0..7] of Byte;
  AGS_Write_Data, AGS_Err_Hi, AGS_Err_Lo, AGS_CFG1_B0,
  AGS_STM_TEMP, AGS_IAM_TEMP : Byte;
  AGS_Write_Adr, AGS_Read_Adr,
  AGS_CFG_Start, AGS_CFG_End,
  AGS_Sise_Sector, Chip_PAGE_Size,
  Chip_FLASH_Size, Chip_REVID, Chip_DEVID : word;
  AGS_CFG_CRC, Chip_WAF_NUM, Chip_LOT_NUM : String;
  AGS_PGM_CRC, NUM_Chip_WAF, AGS_SizeSector : integer;
  AGS_Read_InProcess, AGS_Write_Active, AGS_RdCFG_ProgressBar,
  AGS_Read_Cmpl, AGS_Read_Error, AGS_CFG_ReadCmpl,
  AGS_Write_Cmpl, AGS_Write_Error, NumLot, AGS_Make_PGM : boolean;
  AGS_CFG_Buff             : array[0..1024] of Byte;

  // ---- Bridge CAN ----
  BrCAN_Write_Cmpl, BrCAN_Write_Error,
  BrCAN_Read_Cmpl, BrCAN_Read_Error,
  BridgeCAN_Active, BridgeCAN_Read,
  BridgeCAN_Write          : boolean;
  BrCAN_InBuf              : array[0..7] of Byte;
  BrCAN_OutBuf             : array[0..7] of Byte;
  BrCAN_DA                 : Byte;
  BrCAN_Adr                : integer;

  ECU_Ver_PO, ECU_PO_MC1, ECU_PO_MC2, PGM_CRC_MC1, PGM_CRC_MC2 : String;
  abPGM_CRC_MC1, abPGM_CRC_MC2 : array[0..3] of Byte;

  // ---- Flash STM UpGrade ----
  ProgSTM_File, ProgSTM2_File, UpGrade_File, CRC_STM, V_PO_STM : String;
  BINBuff                  : array[0..131072] of Byte;
  Size_File, Size_Buf, LastByte, ClrErr_Cnt, Size_SectorSTM,
  Size_FlashSTM            : integer;
  Fl_ProgSTM, Fl_ComThread,
  ProgSTM_Checked, ProgGD1_Checked, ProgGD2_Checked : boolean;
  ProgramSTM_Start, ProgramSTM_End, ProgramSTM_Size : integer;
  FPROT_STM, TRIM_STM      : Byte;
  CRC_pgm_MC3              : array[0..4] of Byte;
  adrCRC32_MC3             : Word;

  // ---- Flash PA UpGrade ----
  ProgPA_File, CRC_PA, V_PO_PA : String;
  ProgramPA_Start, ProgramPA_End, NumAllSector : integer;
  FPROT_PA, TRIM_PA, PA_ADC_PWR : Byte;
  adrTRIM_PA_ICS_C3, adrNVFTRIM_PA : Word;
  CRC_pgm_MC2              : array[0..4] of Byte;

  // ---- Flash DZ UpGrade ----
  ProgDZ_File              : String;
  ProgramDZ_Start, ProgramDZ_End : integer;
  FPROT_DZ, TRIM_DZ        : Byte;

  // ---- Калибровка AGS ----
  Fl_Calibr_Gyro, Calibr_Gyro_Cmpl, Calibr_Gyro_Err,
  Fl_Calibr_Acc, Calibr_Acc_Cmpl, Fl_AGS_Read,
  Fl_Calibr_AGS            : boolean;
  Sum_OffSet_AccY, Sum_OffSet_AccX, Sum_Cnt : integer;
  STM_AGS_Status           : byte;

  // ---- COM-порт адаптера ----
  Fl_ComCreate             : boolean;

  // ---- CANUSB ----
  Fl_CAN_USB, CAN_USB_Open, Fl_UpGradeSTM,
  Cmd_CANUSB_Ask, CANUSB_Error : boolean;
  CANUSB_Rx_Cnt            : integer;
  CANUSB_Data              : array[0..20] of Byte;

  // ---- Pcb Test ----
  Pcb_Test_1, Pcb_Test_2,  Pcb_Test_3, Pcb_Test_4,
  Pcb_Test_5, Pcb_Test_6,  Pcb_Test_7, Pcb_Test_8, Pcb_Test_9,
  WL_Off_Val, WL_On_Val, LASR_Off_Val, LASR_On_Val,
  DBR_Off_Val, DBR_On_Val, Pcb_Test_Cnt1, Pcb_Test_Cnt2 : Byte;
  Pcb_Test_Disable, Pcb_Test_Read_Cmpl : boolean;

  AGS_Lot, AGS_Num, SAS_Lot, SAS_Num, AGS_Make_Num : integer;

  ST_LINK_SN, BDM_PA_SN, BDM_DZ_SN, Path_STLINK_CLI : String;
  PCh, Make_Sound, Make_Sound_Ok, Make_Sound_Err : PChar;

  TruckSim_ComBaudrate     : integer;
  TruckSim_Flag, TruckSim_USB_Open : boolean;

  // ==================================================================
  // Полигон (Poly_Unit)
  // ==================================================================
  Ma, a, b, L, hg, rd, IkF, IkR, Fi : DMath;
  W1, W2, W3, W4           : word;
  MKL, OSS1, OSS2, OSS3, OSS4, OSS5, OSS6 : Byte;

  MSparL, MSparR           : MSpar;
  Ga, KG0F, KG0R, KG1F, KG1R : DMath;
  brakeP                   : DMath;

  QueryStop, Poly_Abort_F  : boolean;
  i                        : integer;
  MaxSizeOnRun             : boolean;
  FullTempName, OriginalWindowName : string;
  qt                       : BType;
  mas_gt                   : array[0..15999] of BType;
  dM_F0, dM_F1, dM_R0, dM_R1 : DMath;

  RMmin, RTmin, RMmax, RTmax, RdTdM, PRegOut : DMath;
  Preciv0, Preciv1, Preciv0st, Preciv1st : DMath;

  Sh, Wkh, Gh, Mti, Mdi, Mj, Mpo, FS, Ph, dWidt, Wki, klap : array[0..3] of extended;
  V0, Vend, dt, kPMF_L, kPMF_R, kPMR, delR, Re, It : DMath;
  Vi, Ja                   : extended;
  g                        : DMath = 9.81;
  cikl                     : integer;
  Pprug, Meng, Mdl         : real;

  Kreciv0                  : DMath = 0.025;
  Kreciv1                  : DMath = 0.025;

  freq, StartF, StopF      : int64;
  TimeF                    : DFloat;
  Tstart2, ModelResult     : integer;

  SumVMed                  : DMath;
  SumJ                     : DMath;
  SumI                     : integer;
  Ncikl                    : integer;

implementation

end.
