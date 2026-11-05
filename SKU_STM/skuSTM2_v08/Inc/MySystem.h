/*
  * My_System.h
  ******************************************************************************
  * @brief   Header file of  module.
  * @author  Burdykin
  * Created on: 3 окт. 2021 г.
  *
  * @attention
  * last modified	12 октября 2017 г.
  ******************************************************************************
  */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MY_SYS_H
#define __MY_SYS_H

/* USER CODE BEGIN Includes */
#include "MyTypeDef.h"
#include "MyVAR.h"

/* ----------------Exported types --------------------*/
#define mySYS   __attribute__((section(".myCodesection")))
#define myCode  __attribute__((section(".myCodesection")))
#define myData  __attribute__((section(".mydata")))
#define myPGM   __attribute__((section(".myPGMsection")))
#define myTab   __attribute__((section(".myConstTab")))
#define myCRC   __attribute__((section(".myCRCsection")))

typedef  void (*FUN_Ptr_t) ();

typedef struct {
	uint32_t   Sum;
	uint8_t    N;
	uint16_t   Val;
} MidTypeDef;

typedef struct
{
	uint8_t   Tx_Cnt;
	uint8_t   Tx_State;
	uint8_t   Rx_Cnt;
	uint8_t   Rx_State;
	uint8_t   Err_Cnt;
	uint16_t  Err_State;
} vcbTypeDef;

#define  __DIA_Rx_Length     15// 5
//#define __EHO     0  // 15 // 5
#define  __W_Execute     0x08
#define  __DIA_AckError  0x05
#define  __Koss             16
#define  __UartSCI_Bad      10  // количество повторов для ошибки SCI2_Bad

#define  UartSCI_Tx_Length  0x47 // 0x37 //
#define  UartSCI_Rx_Length  0x47 // 0x37 //
// количество принимаемых из программатора STM
#define   __PGM_Rx_Length   0x27 // 39 3+4+__SizePaketSTM
// количество передаваемых в программаторa STM
#define   __PGM_Tx_Length   0x02
#define   __End_Command     0x6E  // команда завершения

typedef struct {
    uint8_t  Tx_Len;
    uint8_t  Rx_Len;
    uint16_t TimeOut;
    uint8_t  Tx_data[UartSCI_Tx_Length+1];
    uint8_t  TxBuff[UartSCI_Rx_Length+1];
    uint8_t  Rx_data[UartSCI_Rx_Length+1];
    uint8_t  Tx_XOR;
    uint8_t  Rx_XOR;
    uint8_t  Bad_Cnt;
    uint8_t  pBuff;
    uint8_t  Rx_DMA;
    uint8_t  Tx_DMA;
} UartTypeDef;

#define  __Errors_Num_OLd  26
#define  __Errors_Num      41  // Active_Faults[41] //резерв
#define  __EPROM_Size      595 //768 // 1024
#define  __PageSize        0x20 // 32 bytes,
#define  __Write_EPROM_Tout  10

// Table 9. INSTRUCTION SET
#define  __WREN   0x06  //0000 0110 Enable Write Operations
#define  __WRDI   0x04  //0000 0100 Disable Write Operations
#define  __RDSR   0x05  //0000 0101 Read Status Register
#define  __WRSR   0x01  //0000 0001 Write Status Register
#define  __READ   0x03  //0000 0011 Read Data from Memory
#define  __WRITE  0x02  //0000 0010 Write Data to Memory

// Адреса массивов в EPROM
#define __EPROM_Adr_PaseErr   0
#define __EPROM_Adr_TimeErr   0x0030 //48
#define __EPROM_Adr_LastErr   0x0060 //96
#define __EPROM_Adr_CntErr    0x0070 //112
#define __EPROM_Adr_EndErr    0x01C0 //448 112+336(8*42)
#define __EPROM_Adr_SysVar    0x01C0
#define __EPROM_Adr_ODO       0x01D0
#define __EPROM_Adr_WorkTime  0x01F0
#define __EPROM_Adr_BlockON_Cnt   0x0220 //752
#define __EPROM_Adr_Write_Cnt     0x0224 //756
#define __EPROM_Adr_RunaWay       0x0228 //455
#define __EPROM_Adr_OperatingTime 0x022C //459
#define __EPROM_Adr_CSum          0x023C //760

uint8_t  Active_Faults[__Errors_Num+1];
uint8_t Passive_Faults[__Errors_Num+1];

typedef struct {
		uint16_t   Addr;
		uint16_t   Page;
		uint8_t    Phase;
		uint8_t    OpCode;
		uint8_t    Buff[__EPROM_Size+3];
		uint16_t   Size;
		_ByteBits_ SR;	  // Status Register
 		uint8_t    Cmpl;
		uint8_t    SPI_Busy;
		uint8_t    Request;
		uint16_t   Ne;     // номер байта неисправности
		uint16_t   Pe;     // позиция бита неисправности
		uint32_t   CSum;   // контрольная сумма
		uint32_t   Cnt;    // счетчик записей
		uint8_t    Tout;

} TypeDef_EPROM;

typedef struct {
	uint8_t    B0_NL;  // младший нибл 1 байта счетчика
	uint16_t   B0_NH;  // старший нибл 1 байта счетчика
	uint16_t   B1;     // 2 байта счетчика
	uint16_t   B2;     // 3 байта счетчика
	uint16_t   B3;     // 4 байта счетчика
	uint8_t    Mask_WR;
} TypeDef_4byte;

struct {
 TypeDef_EPROM RD;
 TypeDef_EPROM WR;
	_ByteBits_ Request;
	_ByteBits_ Request1;
	_ByteBits_ Compleet;
	uint16_t   Time_Cnt;
	uint32_t   ODO_Last;
	uint8_t    Phase;
	uint16_t   DM3_Addr;
	uint8_t    DM3Ph;
//	uint16_t   Mask_Pages; // битовое отображение записываемых страниц
 TypeDef_4byte ODO;
 TypeDef_4byte WorkTime;
	uint32_t   Cnt_10minut;
	uint8_t    Data[__EPROM_Size+3];
	uint8_t    ErrPh;
	uint32_t   CSum;     // контрольная сумма
	uint32_t   WriteCnt; // счетчик записей
	uint32_t   BlockON_Cnt; //
	uint8_t    BlockOFF_WR_Cmpl;
} EPROM;

#define  EPROM_RD_Status  EPROM.RD.SR.Byte
#define  EPROM_Busy       EPROM.RD.SR.Bits.b0

#define  EPROM_WR_Status  EPROM.WR.SR.Byte
#define  EPROM_WPEN       EPROM.WR.SR.Bits.b7
#define  EPROM_BP1        EPROM.WR.SR.Bits.b3
#define  EPROM_BP0        EPROM.WR.SR.Bits.b2

#define  EPROM_Request    EPROM.Request.Byte
#define  Request_WR_Time  EPROM.Request.Bits.b0
#define  Request_WR_ERROR EPROM.Request.Bits.b1
#define  Request_WR_DIA   EPROM.Request.Bits.b2
#define  Request_WR_ODO   EPROM.Request.Bits.b3
#define  Request_WR_DM3   EPROM.Request.Bits.b4
#define  Request_WR_BlOff EPROM.Request.Bits.b5
#define  Request_Wr_CSsum EPROM.Request.Bits.b6
#define  Request_RD_All   EPROM.Request.Bits.b7

#define  EPROM_Compleet    EPROM.Compleet.Byte
#define  WR_EPROM_Compleet EPROM.Compleet.Bits.b0
#define  RD_EPROM_Compleet EPROM.Compleet.Bits.b1
#define  WR_ERROR_Compleet EPROM.Compleet.Bits.b2
#define  Fail_EPROM_CS     EPROM.Compleet.Bits.b3
#define  WR_EPROM_Tout     EPROM.Compleet.Bits.b7

#define __PGM_Sign_Addr   0x20009000
#define   PGM_Sign   (*(volatile uint32_t*) (__PGM_Sign_Addr)) // признак
#define __PGM_Sign_Data   33


#define   __Valid8   0xFA    //
#define   __Valid16  0xFAFF  //
#define   __OffSet8  0x7D    //
#define   __OffSet16 0x7D7F  //
#define   __Error8   0xFE    //
#define   __Error16  0xFEFF  //
#define   __NotDef8   0xFF    //
#define   __NotDef16  0xFFFF  //
#define   __Delay_1s  948  //19     // в циклах по 50мс на 1 меньше
#define   __BAM_Head  0x20   //
#define   __VIN_Num_Byte    0x11 //17
#define   __ECUID_Num_Byte  0x28 //40
#define   __Yes_ACK   0
#define   __No_ACK    1

#define   __CANJ_VDC_WabcoSA 0x3E

#define __DA_ERC1_RD   0x10    // DA ретардер трансмиссия
#define __DA_ERC1_RE   0x0F    // DA ретардер двигателя
#define __DA_ERC1_RG   0x03    // DA ретардер коробки передач
#define __DA_ERC1_REX  0x29    // DA ретардер горный тормоз

#define __TSC_AR_Prior1   0x0F // ограничение момента
#define __TSC_AR_Prior2   0x0E // задание момента
#define __TSC_AR_Prior3   0xFC //  Nul
#define __TSC_AR_Dat_End  0x00 // 0x7D Nul

#define __TSC_AE_Prior1   0x0E // 11101110 Torque Control
#define __TSC_AE_Prior2   0x0F // 11101111 Speed/Torque Limit
#define __TSC_AE_Prior3   0xFC // 11111100 nul

#define __SA_Body_Controller   0x27    // SA  Body Controller
#define __SA_DashBoard   0x21    // SA панель приборов

/* ----- определение CAN identifier -j1939---*/
#define EBC1_Pri    6        // приоритет
#define EBC1_PGN    0xF001   // PGN
#define EBC2_Pri    6        // приоритет
#define EBC2_PGN    0xFEBF   // PGN
#define EBC5_Pri    6        // приоритет
#define EBC5_PGN    0xFDC4   // PGN
#define DM1_Pri     6        // приоритет
#define DM1_PGN     0xFECA   // PGN
#define DM2_Pri     6        // приоритет
#define DM2_PGN     0xFECB   // PGN
#define DM3_Pri     6        // приоритет
#define DM3_PGN     0xFECC   // PGN
#define DM11_Pri    6        // приоритет
#define DM11_PGN    0xFED3   // PGN
#define BAM_Pri     6        // приоритет
#define BAM_PGN     0xECFF   // PGN
#define TPD_Pri     6        // приоритет
#define TPD_PGN     0xEBFF   // PGN
#define ACK_Pri     6        // приоритет
#define ACK_PGN     0xE8FF   // PGN
#define VIN_Pri     6        // приоритет
#define VIN_PGN     0xFEEC   // PGN
#define ECUID_Pri   6        // приоритет
#define ECUID_PGN   0xFDC5   // PGN
#define VW_Pri      6        // приоритет
#define VW_PGN      0xFEEA   // PGN
#define TC1_Pri     3        // приоритет
#define TC1_PGN     0x0103   // PGN
#define VDC1_Pri    6        // приоритет
#define VDC1_PGN    0xFE4F   // PGN
#define HRW_Pri     2        // приоритет
#define HRW_PGN     0xFE6E   // PGN
#define ASC4_Pri    6        // приоритет
#define ASC4_PGN    0xFE58   // PGN
#define TSC1_Pri    3        // приоритет
#define TSC1_PGN    0x0000   // PGN
#define ACM_Pri     6        // приоритет
#define ACM_PGN     0xFFFF   // PGN
// принимаемые
#define ESC1_Pri    3        // приоритет
#define ESC1_PGN    0xF00B   // PGN

#define ReqPGN_Pri  6        // приоритет
#define ReqPGN_PGN  0xEA00   // PGN
#define EEC1_Pri    3        // приоритет
#define EEC1_PGN    0xF004   // PGN
#define EEC2_Pri    3        // приоритет
#define EEC2_PGN    0xF003   // PGN
#define EC1_Pri     6        // приоритет
#define EC1_PGN     0xFEE3   // PGN
#define CCVS_Pri    6        // приоритет
#define CCVS_PGN    0xFEF1   // PGN
#define ERC1_Pri    6        // приоритет
#define ERC1_PGN    0xF000   // PGN
#define ETC1_Pri    3        // приоритет
#define ETC1_PGN    0xF002   // PGN
#define ETC2_Pri    3        // приоритет
#define ETC2_PGN    0xF005   // PGN
#define TCO1_Pri    3        // приоритет
#define TCO1_PGN    0xFE6C   // PGN
#define VDHR_Pri    6        // приоритет
#define VDHR_PGN    0xFEC1   // PGN
#define ASC1_Pri    6        // приоритет
#define ASC1_PGN    0xFE5A   // PGN
#define DC1_Pri     6        // приоритет
#define DC1_PGN     0xFE4E   // PGN
#define AIR1_Pri    6        // приоритет
#define AIR1_PGN    0xFEAE   // PGN
#define XBR_Pri     3        // приоритет
#define XBR_PGN     0x0400   // PGN
#define PGN_FF20_Pri    6        // приоритет
#define PGN_FF20_PGN    0xFF20   // PGN
#define PGN_FF21_Pri    6        // приоритет
#define PGN_FF21_PGN    0xFF21   // PGN
#define PGN_FF22_Pri    6        // приоритет
#define PGN_FF22_PGN    0xFF22   // PGN
#define PGN_FF23_Pri    6        // приоритет
#define PGN_FF23_PGN    0xFF23   // PGN

typedef  union {
      uint8_t Byte;
  struct {
	  uint8_t bit1_2:2;
	  uint8_t bit3_4:2;
	  uint8_t bit5_6:2;
	  uint8_t bit7_8:2;
    } Bits;
} _CANBits_;

#define   __Bit12       0x01
#define   __Bit34       0x04
#define   __Bit56       0x10
#define   __Bit78       0x40
#define   __NotDefinedByte   0xFF
#define   __NotDefinedBit78  0xC0
#define   __NotDefinedBit56  0x30
#define   __NotDefinedBit34  0x0C
#define   __NotDefinedBit12  0x03
#define   __BitsOFF     0x00
#define   __BitsON      0x01
#define   __BitsErr     0x02
#define   __BitsNot     0x03

#define   __Inactive    0
#define   __Active      1

typedef  union {
      uint8_t Byte;
  struct {
	  uint8_t bit1_4:4;
	  uint8_t bit5_8:4;
    } Bits;
} _CANBits44_;

typedef struct {
	_CANBits_ Status;
	 uint16_t Speed;
} TypeDef_CCVS;

TypeDef_CCVS CCVS;
#define    CCVS_Parking_Active CCVS.Status.Bits.bit3_4
#define    CCVS_Brake_Active   CCVS.Status.Bits.bit5_6
#define    CCVS_Clutch_Active  CCVS.Status.Bits.bit7_8

typedef struct {
	 uint32_t ID;
	 uint8_t  D[8];
} TypeDef_Frame;

typedef struct {
	 uint8_t  SA;
	 uint16_t Acc_Demand;
	_CANBits_ Status;
	 uint8_t  Urgency;
	 uint8_t  Cnt;
	 uint8_t  CS;
} TypeDef_CAN_XBR;

typedef struct
{  _CANBits44_  Mode;
   uint8_t   Driver;
   uint8_t   Torque;
   uint16_t  Taxo;
   uint8_t   ControlSA;
   _CANBits44_ Starter;
   uint8_t   EDT;

} TypeDef_CAN_EEC1;

typedef struct
{
	TypeDef_Frame Stack[10];
	uint8_t  Ptr_Stack;

    struct
    {  uint8_t  CAN_ASR_Mul;
       uint8_t  TSC_AR_Dat;
       uint8_t  CAN_Adress;
       uint8_t  SA_DashBoard;
    } CFG;

    struct
    {  uint8_t  DM2;
       uint8_t  DM3;
       uint8_t  DM11;
       uint8_t  VIN;
       uint8_t  ECUID;
       uint8_t  VW;
       uint8_t  NACK;
    } ReqPGN_SA;

    struct
    {  uint8_t  Retarder_Sel;
       uint8_t  AE_Message_Cnt;
       uint8_t  ARD_Message_Cnt;
       uint8_t  ARE_Message_Cnt;
       uint8_t  ARG_Message_Cnt;
       uint8_t  AREX_Message_Cnt;
       uint8_t  CheckSum;
    } TSC;

    struct
    {  uint8_t  SPN928; //Axle Location
       uint16_t SPN582; //Axle Weight
       uint8_t  Num_F;
       uint8_t  Num_R;
    } VW;

    struct
    {  uint8_t  Ptr;
       uint8_t  Num; // номер
       uint8_t  Pos; // позиция
       uint8_t  Qty; // количество
       uint8_t  Buff[50];
       uint8_t  Lamp;
    } DTC;

    struct
    {  uint8_t  Byte_Count;
       uint8_t  Num_Pack; // номер пакета
       uint8_t  Sum_Pack; // количество Пакетов
       uint8_t  Buff[4];
       uint8_t  Phase;
       uint16_t PGN;
       uint16_t IDpgn;
    } TPD;

    struct
    {  uint32_t ExtID;
       uint16_t PGN;
       uint8_t  SA;
       uint8_t  Data[8];
       uint16_t ReqPGN;
    } Rx;
/*
    struct
    {  _CANBits44_  Mode;
       uint8_t   Driver;
       uint8_t   Torque;
       uint16_t  Taxo;
       uint8_t   ControlSA;
       _CANBits44_ Starter;
       uint8_t   EDT;
    } EEC1;
*/
    TypeDef_CAN_EEC1 EEC1;
    TypeDef_CAN_EEC1 EEC1_81; // левый эл.мотор
    TypeDef_CAN_EEC1 EEC1_82; // правый эл.мотор

    struct
    {  _CANBits_  B1;
       uint8_t   Accelerator;
       uint8_t   Torque;
    } EEC2;

    struct
    {  uint8_t   BAM;
       uint8_t   PackNum;
       uint16_t  TaxoP1;
       uint16_t  TaxoP2;
       uint8_t   TorqueP1;
       uint8_t   TorqueP5;
       uint16_t  RefTorque;
    } EC1;

    struct
    {  uint8_t   SA;
       _CANBits_ B1;
       uint16_t  Speed;
       _CANBits_ B4;
       struct
       {  _CANBits_ B1;
          uint16_t  Speed;
          _CANBits_ B4;
       } Engine;
       struct
       {  _CANBits_ B1;
          uint16_t  Speed;
          _CANBits_ B4;
       } Body;
       struct
       {  _CANBits_ B1;
          uint16_t  Speed;
          _CANBits_ B4;
       } Dash;
    } CCVS;

    struct
    {  uint8_t   SA;
       struct
       {  _CANBits44_  Mode;
          uint8_t   Torque;
       } RE;
       struct
       {  _CANBits44_  Mode;
          uint8_t   Torque;
       } RD;
       struct
       {  _CANBits44_  Mode;
          uint8_t   Torque;
       } RG;
       struct
       {  _CANBits44_  Mode;
          uint8_t   Torque;
       } REX;
    } ERC1;

    struct
    {  _CANBits_  B1;
       uint16_t   TaxoOut;
       uint16_t   InTaxo;
       uint8_t   ControlSA;
    } ETC1;

    struct
    {  uint16_t  Ratio;
       uint16_t  Range;
       uint8_t   Gear;
    } ETC2;
    struct
    {  _CANBits_  B1;
       _CANBits_  B4;
       uint16_t  TaxoOut;
       uint16_t  Speed;
       uint16_t  Speed_Last;
    } TCO1;

    struct
    {  uint16_t  Bellow_Press_FL;
       uint16_t  Bellow_Press_FR;
       uint16_t  Bellow_Press_RL;
       uint16_t  Bellow_Press_RR;
    } ASC4;

    struct
    {  _CANBits44_  B1;
       _CANBits_    B2;
       _CANBits_    B3;
       _CANBits44_  B4;
       _CANBits_    B5;
       _CANBits_    B6;
       _CANBits_    B7;
       _CANBits44_  B8;
    } ASC1;

    struct
    {  uint16_t  Circuit1_Press;
       uint16_t  Circuit2_Press;
    } AIR1;

    struct
    {  uint8_t    SA;
       _CANBits_    B3;
       _CANBits_    B6;
       _CANBits44_  B8;
    } EBC1;

    TypeDef_CAN_XBR  XBR_1;
    TypeDef_CAN_XBR  XBR_2;

    struct {
    	 uint8_t  SA;
    	 uint16_t Taxo;
    	 uint16_t Taxo_Des;
    	 uint16_t Taxo_Lim;
    	_CANBits_ Mode;
    	 uint8_t  Torque;
    	 uint8_t  Torq_Des;
    	 uint8_t  Torq_Lim;
    	 uint8_t  Cnt;
    	 uint8_t  CS;
    	 uint8_t  Active;
    	 uint8_t  Many;  // Много
    } TSC_AE;

    struct {
    	 uint8_t   SA;
     	_CANBits_  B2;
    	_CANBits_  B3;
     	_CANBits_  B4;
    	_CANBits_  B5;
    	_CANBits_  B6;
     	_CANBits_  B7;
    	_CANBits_  B8;
    	 uint8_t  Status1;
    	 uint8_t  Status2;
     } PGN_FF20;

     struct {
     	 uint8_t   SA;
      	_CANBits_  B1;
     	_CANBits_  B2;
     	_CANBits_  B5;
     	_CANBits_  B6;
      	_CANBits_  B7;
     	 uint8_t  Status1;
      } PGN_FF21;

      struct {
      	 uint8_t  SA;
      	 uint16_t Taxo;
      	 uint8_t  Temp;
      	 uint8_t  AIR1;
      	 uint8_t  AIR2;
      } PGN_FF22;

      struct {
      	 uint8_t  SA;
      	 uint8_t  Ubat;
      } PGN_FF23;

    struct
      {  TypeDef_CAN_EEC1 EEC1_81;
         TypeDef_CAN_EEC1 EEC1_82;
      } ESC1;

    struct
    {  uint16_t  TPD;
       uint16_t  EEC1;
       uint16_t  EEC2;
       uint16_t  EC1;
       uint16_t  CCVS_Eng;
       uint16_t  CCVS_Dash;
       uint16_t  CCVS_Body;
       uint16_t  ERC1_RD;
       uint16_t  ERC1_RE;
       uint16_t  ERC1_RG;
       uint16_t  ERC1_REX;
       uint16_t  ETC1;
       uint16_t  ETC2;
       uint16_t  TCO1;
       uint16_t  VDHR;
       uint16_t  ASC4;
       uint16_t  ASC1;
       uint16_t  DC1;
       uint16_t  AIR1;
       uint16_t  EBC1;
       uint16_t  XBR_1;
       uint16_t  XBR_2;
       uint16_t  TSC_AE;
       uint16_t  PGN_FF20;
       uint16_t  PGN_FF21;
       uint16_t  PGN_FF22;
       uint16_t  PGN_FF23;
       uint16_t  ESC1;
       uint16_t  EEC1_81;
       uint16_t  EEC1_82;
    } Tout;

    uint8_t  DM_Buff[4]; //a,b,c,d
    uint8_t  Traffic_Cnt;
    uint8_t  BUSY_TX_Cnt;
    uint8_t  NoEmptyBOX_Cnt;
	uint8_t  Timer_1ms;
	uint16_t Delay_1s;
    uint16_t EBC2_FrontSpeed;
    uint32_t VDHR_Distance;
    _CANBits_ DC1_Status;

    CanTxMsgTypeDef Tx_Message;
//    CanRxMsgTypeDef Rx_Message;

    _ByteBits_ Flags;
    _ByteBits_ Flags1;
    _ByteBits_ Flags2;

    _ByteBits_ ReqPGN;
    _ByteBits_ Message1;
    _ByteBits_ Message2;
    uint16_t  BusOff_Cnt;

} TypeDef_CANJ;

TypeDef_CANJ CANJ;

#define     CANJ_Flags            CANJ.Flags.Byte
#define     DM2_In_Process        CANJ.Flags.Bits.b0
#define     Transmit_Fail         CANJ.Flags.Bits.b1
#define     CANJ_Transmit_Cmpl    CANJ.Flags.Bits.b2
#define     CANJ_Transmit_Request CANJ.Flags.Bits.b3
#define     TSC1_AE_100ms_Repeat  CANJ.Flags.Bits.b4
#define     ACM_Transmit_Cmpl     CANJ.Flags.Bits.b5
#define     TSC1_EM12_Fl          CANJ.Flags.Bits.b6
#define     CANJ_BusOFF           CANJ.Flags.Bits.b7

#define     Disable_TPD      CANJ.Flags1.Byte
#define     Disable_DM1      CANJ.Flags1.Bits.b0
#define     Disable_DM2      CANJ.Flags1.Bits.b1
#define     Disable_DM1_Zero CANJ.Flags1.Bits.b2
#define     Disable_DM1_BAM  CANJ.Flags1.Bits.b3

#define     CANJ_Flags2       CANJ.Flags2.Byte
#define     XBR_1_CS_Fail     CANJ.Flags2.Bits.b4
#define     XBR_2_CS_Fail     CANJ.Flags2.Bits.b5
#define     XBR_1_Cnt_Fail    CANJ.Flags2.Bits.b6
#define     XBR_2_Cnt_Fail    CANJ.Flags2.Bits.b7

#define     Request_PGN      CANJ.ReqPGN.Byte
#define     Request_PGN_DM2  CANJ.ReqPGN.Bits.b0
#define     Request_PGN_DM3  CANJ.ReqPGN.Bits.b1
#define     Request_PGN_DM11 CANJ.ReqPGN.Bits.b2
#define     Request_PGN_VIN  CANJ.ReqPGN.Bits.b3
#define     Request_PGN_ECUID CANJ.ReqPGN.Bits.b4
#define     Request_PGN_VW   CANJ.ReqPGN.Bits.b5
#define     Request_PGN_NACK CANJ.ReqPGN.Bits.b6

#define    Messages_1        CANJ.Message1.Byte
// частые посылки
#define    Message_TSC1_AE   CANJ.Message1.Bits.b0
#define    Message_VDC2      CANJ.Message1.Bits.b1
#define    Message_HRW       CANJ.Message1.Bits.b2
// редкие посылки
#define    Message_TSC1_AR   CANJ.Message1.Bits.b3
#define    Message_EBC2      CANJ.Message1.Bits.b4
#define    Message_TC1       CANJ.Message1.Bits.b5
#define    Message_EBC5      CANJ.Message1.Bits.b6
#define    Message_TPD       CANJ.Message1.Bits.b7

#define    Messages_2        CANJ.Message2.Byte
#define    Message_VDC1      CANJ.Message2.Bits.b0
#define    Message_EBC1      CANJ.Message2.Bits.b1
#define    Message_ASC4      CANJ.Message2.Bits.b2

//Engine Torque Mode SPN899
/* 0101 ASR control
   0110 Transmission control
   0111 ABS control
   1000 Torque limiting*/
#define  EEC1_Torque_Mode   CANJ.EEC1.Mode.Bits.bit1_4

// Engine Starter Mode SPN1675
/*
0000 start not requested
0001 starter active, gear not engaged
0010 starter active, gear engaged
 */
#define  EEC1_Starter    CANJ.EEC1.Starter.Bits.bit1_4

typedef struct {
	_CANBits_    B1;
	 uint8_t     B2;
	_CANBits_    B3;
	_CANBits_    B6;
	_CANBits_    B8;
	 uint8_t     SA_Adr;
} TypeDef_EBC1;

TypeDef_EBC1 EBC1;

#define    EBC1_B1      EBC1.B1.Byte
#define    ASR_Engine   EBC1.B1.Bits.bit1_2 //
#define    ASR_Brake    EBC1.B1.Bits.bit3_4 //
#define    ABS_Activ    EBC1.B1.Bits.bit5_6 //

#define    EBC1_B3      EBC1.B3.Byte
#define    ABS_SW       EBC1.B3.Bits.bit1_2 // ABS Off-road Switch
#define    ASR_SW       EBC1.B3.Bits.bit3_4 // ASR Off-road Switch
#define    HillHold_SW  EBC1.B3.Bits.bit5_6 // ASR "Hill Holder" Switch
#define    TSC_SW       EBC1.B3.Bits.bit7_8 // Traction Control Override Switch

#define    EBC1_B6        EBC1.B6.Byte
//8.3 2 bits Halt brake switch SPN 2911
#define    EBC1_B8        EBC1.B8.Byte
#define   HaltSW_SPN2911  EBC1.B8.Bits.bit3_4 // Halt brake switch

typedef struct
{
    struct
    {  uint16_t   Speed_Set;
       uint8_t    B7_Puls_Const;
       uint16_t   Set_Min;
       struct
       { uint8_t  Ku;
         uint16_t Ko;
         uint8_t  dKu;
         uint8_t  dDKo;
         uint8_t  Period;// период mc
         uint8_t  Kvolt; // изменение скважности от напряжения
         uint8_t  Kper;  // изменение периода
       } PWM_PK;
    } CFG;
    struct
    {  uint16_t Duration;   // длительность импульса
       uint32_t Period;     // период импульса
       uint16_t Tim_HiCnt;  // старшие байты таймера Tim4
       uint32_t Tim_Capt;   // захваченный период Tim4
	   uint32_t Const;
	   uint32_t Channel;   // htim Capture.Channel
       uint8_t  ZS_Cnt;
       uint16_t FirstCapt;
       uint16_t Speed;
       uint16_t NC_Cnt;
       uint16_t FailI_Cnt;
       uint16_t FailT_Cnt;
       _ByteBits_  Flags;
    } B7;
    struct
    { struct
      { uint16_t*  Ch;  // указатель на канал ADC
  	    uint16_t   On_Val;
  	    uint16_t   Off_Val;
      } ADC;
      struct
      { uint16_t   On_Val;
  	    uint16_t   Off_Val;
  	    uint16_t   Period;    //
  	    uint16_t   DutyCycle; // скважность PWM
      } Oss;
      struct
      { uint16_t OnTime;
        uint16_t OffTime;
        uint16_t Period;
        uint16_t Adj;       // выход ADJ
        uint16_t Des;       // выход регулятора  скорости
        uint16_t In;        // вход регулятора F(In,U)
        uint16_t Kin;       // коефф. от входной величины
        uint16_t Ku;        // коефф. от напряжения
        uint32_t Kdc;       // коефф. скважности
      } PWM;
      ErrTypeDef   Fail;
      _ByteBits_   Flags;
    } PK;
    struct
    { uint16_t  ThresHold;
      uint16_t  TSET;
      uint16_t  Est;
      uint16_t  Max;
      uint16_t  Min;
      uint16_t  Buf[53]; //DeriVative
      int16_t   DeriVative;
      int16_t   delta;
      uint16_t  dThr;
      uint16_t  Set;
    } Speed;
    struct
    {  int32_t   Integ;
	   int32_t   Out;
    } PID;
    struct
    {  int32_t   Integ;
	   int32_t   Out;
	   uint16_t  Adj;       // выход ADJ
	   uint16_t  Tout;
	   uint16_t  Max;
	   uint16_t  Min;
	   uint16_t  PWM;
    } ADJ;
    struct
    {  uint8_t   Torque;
	   uint16_t  Taxo;
    } Engine;
    uint8_t  Phase;
    uint16_t Off_Cnt;
    uint8_t  Delay;
    _Filtr_Buffer_  Filter_PWM;

} TypeDef_LIM;

TypeDef_LIM LIM;

#define  LIM_PK_Flags      LIM.PK.Flags.Byte
#define  LIM_Sign_PWM      LIM.PK.Flags.Bits.b0
#define  LIM_PK_ON         LIM.PK.Flags.Bits.b1
#define  LIM_PK_Active     LIM.PK.Flags.Bits.b2
//#define  DIA_PK_Active     LIM.PK.Flags.Bits.b3
#define  LIM_TSET_keep     LIM.PK.Flags.Bits.b5
#define  PK_Test_Disable   LIM.PK.Flags.Bits.b6
#define  LIM_PK_Find       LIM.PK.Flags.Bits.b7

#define  LIM_B7_Flags      LIM.B7.Flags.Byte
#define  LIM_B7_Find       LIM.B7.Flags.Bits.b0
#define  LIM_B7_Puls_Fail  LIM.B7.Flags.Bits.b1
#define  LIM_Engine_Event  LIM.B7.Flags.Bits.b2
#define  LIM_TSET_Active   LIM.B7.Flags.Bits.b3
#define  LIM_EngineActive  LIM.B7.Flags.Bits.b4

#define  __B7_Test_Impuls         4000    //
#define  __B7_ZS_Const            100
#define  __B7_Puls_Max            0x2D00
#define  __B7_Puls_Min            0x0500
#define  __B7_Min_Speed           20
#define  __B7_Max_Speed           0xC800  //200km/h
#define  __B7_Fail_Repeat         100
#define  __B7_NC_Fail_Repeat      50

#define __PK_State_Off  1
#define __PK_State_On   0

typedef struct
{
    struct
    {  uint16_t  PeakTorq;
       uint8_t   TorqXX;
       uint16_t  K1_TL;
       uint16_t  K2_TL;
    } CFG;
    uint16_t   Torque;
    uint16_t   TorqXX;
    uint16_t   TorqLoss;
    uint16_t   PercentLoss;
    uint16_t   K1_TL;
    uint16_t   K2_TL;
    uint16_t   TaxoXX;
    uint16_t   TaxoMax;
    uint16_t   PeakTorq;
} TypeDef_Engine;

typedef  struct
{
    struct
    {
       uint8_t   Phase;
       uint8_t   Eho_Len;
       uint8_t   Head;
       uint8_t   Command;
       uint8_t   Data[40];
       uint8_t   Num_MC;
    } RX;
    struct
    {  uint8_t   Select;
       uint8_t   Road;
       uint8_t   Data[20];
    } Oss;
    uint8_t   Phase;
	uint8_t   Cnt_200mc;
	uint8_t   Nbit_5bod;
	uint16_t  Mask_5bod;
	_ByteBits_  Flags;

	uint16_t RdRAM_Sel;
	uint16_t WrRAM_Sel;
	uint16_t RdCFG_Addr;
	uint16_t WrCFG_Addr;
	uint8_t  TP_Select;

    struct
    {  uint16_t RD_Addr;
       uint16_t WR_Addr;
       uint8_t  Data[32];
       uint8_t  Size;
    } EPROM;

    struct
    { uint8_t   UartFlag;
      uint8_t   SCI_Rx_Cnt;
      uint8_t   SCI_Tx_Cnt;
      uint8_t   SCI_Rx_data_0;
      uint8_t   SCI_Loss_Sinchro;
      uint8_t   TestRx;
      uint8_t   RX_Command;
      uint8_t   Phase;
      uint8_t   XOR_Tx;
      uint8_t   Rx_Cnt;
    } MC2;

} DIATypeDef;

DIATypeDef DIA;
#define     DIA_Flags          DIA.Flags.Byte
#define     WR_BufCFG_MC2      DIA.Flags.Bits.b0
#define     WR_CFG_MC2_Req     DIA.Flags.Bits.b1
#define     WR_CFG_DIA_Ask_Req DIA.Flags.Bits.b2
#define     DIA_MCx_Send       DIA.Flags.Bits.b3
#define     DIA_MCx_Init       DIA.Flags.Bits.b4

typedef struct
{
	uint16_t SS_1L; //
	uint16_t SS_1R;
	uint16_t SS_2L;
	uint16_t SS_2R;
	uint16_t MCU;
	uint8_t  Power;
	uint16_t MD_1L;
	uint16_t MD_1R;
	uint16_t MD_2L;
	uint16_t MD_2R;
	uint16_t DIF;
	uint16_t CAN;  // +B7
	uint16_t LSSW; // Lamp DBR
	uint8_t  GND;  // Old  26

	uint16_t SS_3L; // New
	uint16_t SS_3R;
	uint8_t  R1; // MC3
	uint16_t MD_3L;
	uint16_t MD_3R;
	uint8_t  SAS;
	uint8_t  AGS;
	uint16_t R2; // DifT
	uint8_t  PS;
	uint16_t R3; // CANT

} TypeDef_Err;

typedef struct
{
	uint8_t   EEC1_Status;
	uint16_t  Taxo;
	uint8_t   TaxoN;
	uint8_t   Driver;
	uint8_t   Torque;
	uint8_t   Accelerator;
	uint8_t   Load;
	struct
    {  _CANBits_  Status;
		uint8_t   Num;
		uint16_t  Out_Taxo;
    } Gear;

	struct
	{ uint16_t  RefTorque;
	  uint16_t  TaxoPoint1;  //XX
	  uint8_t   TorquePoint1;
	  uint8_t   TorquePoint5;
	  uint16_t  PeakTorque;
	  uint16_t  TaxoPoint2;  //Max
	} EC1; //Engine Configuration 1

	_ByteBits_  Fail;

} TypeDef_CAN_Engine;

TypeDef_CAN_Engine  CAN_Engine;

#define   Driver_Fail    CAN_Engine.Fail.Bits.b0
#define   Torque_Fail    CAN_Engine.Fail.Bits.b1
#define   Taxo_Fail      CAN_Engine.Fail.Bits.b2
#define   Door_Fail      CAN_Engine.Fail.Bits.b3
#define   EBC1_Fail      CAN_Engine.Fail.Bits.b4
#define   CAN_XBR_Fail   CAN_Engine.Fail.Bits.b5
#define  CAN_TSC_AE_Fail CAN_Engine.Fail.Bits.b6

#define   CAN_Gear_Status    CAN_Engine.Gear.Status.Byte
#define   Gear_Shift    CAN_Engine.Gear.Status.Bits.bit5_6 // Transmission Shift In Process
// наследие от DZ
//#define   Gear_OkCAN    CAN_Engine.Gear.Status.Bits.bit7_8 // __BitsON - Ok
													       //__BitsNot - Tout

typedef struct
{
	struct {
	   uint16_t Kmp;
	   uint16_t Susp_Mass;
	   uint16_t PS_OffSet;
	   uint8_t  Tip;
	} CFG;

	struct
	{ // BPS - Bellow Pressure Sensor
	   uint16_t BellowPress;
	   uint16_t SensPress;
	   uint16_t BPS_CAN;
	   int16_t  Ps_Empty; //показания датчика снаряженной
	   int16_t  Pb_Empty; //давление в балоне снаряженной
	   _Filtr_Buffer_  Filtr_BPS;
	} ASC4;

	uint16_t PS_OffSet;
	int16_t  Load_Rear;

} TypeDef_ECAS;

typedef struct
{
	uint8_t     CntNART;
	uint8_t     Phase;
	uint8_t     Mode;
	uint16_t    TrCnt;
	uint16_t    Tout;
	uint16_t    Cnt1s;
	uint8_t     TxErrCnt; // счетчик ошибок передачи
	uint16_t    Cnt5ms;
	_ByteBits_  Flags;
} TypeDef_CANT;

TypeDef_CANT CANT;

#define     CANT_Flags     CANT.Flags.Byte
//#define     CANT_Enable    CANT.Flags.Bits.b0 //
//#define     CANT_TxOk      CANT.Flags.Bits.b1 //
//#define     CANT_RxOk      CANT.Flags.Bits.b2 //
#define     CANT_Ok        CANT.Flags.Bits.b3 //
#define     CANT_Mode      CANT.Flags.Bits.b4 //
#define     CANT_NART      CANT.Flags.Bits.b5 // не менять
//#define     CANTH_Fail     CANT.Flags.Bits.b6 // замыкания CANTH
//#define     CANTL_Fail     CANT.Flags.Bits.b7 // замыкания CANTL

#define	__TwoWire  0
#define __H_mode   1
#define __L_mode   2

#define __1_Tr    10   //
#define __2_Tr    15   // 15mc
#define __5_Tr    49   // 50mc  ! минус 1 !
#define __10_Tr   99   // 100mc
#define __20_Tr   199  //
#define __30_Tr   59   // 300mc
#define __50_Tr   499  // 500mc
#define __100_Tr  999  // 1c

typedef struct
{
	uint8_t  Tx_data[16];
	uint8_t  Rx_data[16];
	uint8_t  Adr;
	uint8_t  Sise;
	uint8_t  Cmd;          // селектор команд чтения ACC_GIRO
} TxRx_TypeDef;

typedef struct
{
	uint8_t   Fail_Flag;
	int8_t    Fail_Cnt;
	int32_t   Rx_ID;
	uint8_t   Rx_Tout;
	uint8_t   Tx_Tout;

} CANxTypeDef;

typedef struct {
	uint8_t Press_1L; //Brake cylinder pressure first axle left wheel
	uint8_t Press_1R; //Brake cylinder pressure first axle right wheel
	uint8_t Press_2L; //Brake cylinder pressure second axle left wheel
	uint8_t Press_2R; //Brake cylinder pressure second axle right wheel
	uint8_t Press_3L; //Brake cylinder pressure third  axle left wheel
	uint8_t Press_3R; //Brake cylinder pressure third  axle right wheel
	uint8_t Status5;
} _TypeDefEBS25;

typedef struct {
	_CANBits_ Status1;
	_CANBits_ Status2;
	 uint16_t Speed;
	 int8_t   AccY;
} _TypeDefEBS21;

#define    EBS21_Status1        EBS21.Status1.Byte
#define    EBS21_ABS_Active     EBS21.Status1.Bits.bit1_2
#define    EBS21_Brake_Active   EBS21.Status1.Bits.bit5_6
#define    EBS21_Status2        EBS21.Status2.Byte
#define    EBS21_VDC_Active     EBS21.Status2.Bits.bit1_2

typedef struct {
	_CANBits_ Status1;
	_CANBits_ Status2;
	_CANBits_ Status3;
	_CANBits_ Status4;
	 uint16_t  AxleLoadSum;
	 int16_t  RetarderTorque;
} _TypeDefEBS22;

#define    EBS22_Status1        EBS22.Status1.Byte
#define    EBS22_ABS_Active     EBS22.Status1.Bits.bit1_2
#define    EBS22_Brake_Active   EBS22.Status1.Bits.bit5_6
#define    EBS22_Status2        EBS22.Status2.Byte
#define    EBS22_UpitOk         EBS22.Status2.Bits.bit1_2
#define    EBS22_RedWarn        EBS22.Status2.Bits.bit3_4
#define    EBS22_AmberWarn      EBS22.Status2.Bits.bit5_6
#define    EBS22_Status3        EBS22.Status3.Byte
#define    EBS22_Status4        EBS22.Status4.Byte
#define    EBS22_SupplyBrakeReq EBS22.Status4.Bits.bit3_4
#define    EBS22_StopLampReq    EBS22.Status4.Bits.bit5_6

typedef struct
{  	 uint8_t  ToutEBS21;
 	 uint8_t  ToutEBS22;
	 _TypeDefEBS21  EBS21;
	 _TypeDefEBS22  EBS22;
	 _TypeDefEBS25  EBS25;
} CANTTypeDef;

typedef struct // ------Trailer------
{
  uint16_t  Press;
  uint16_t  InPr;
  uint16_t  AirPress;
  uint16_t  PS_Fail_Cnt;
  uint16_t  PS_NC_Cnt;
  uint16_t  Pnevmo_Cnt;
  uint16_t  StopTout;
  uint16_t  EngineTout;
  uint8_t   BrakeDemandLeft;
  uint8_t   BrakeDemandRight;

  struct
  { uint16_t  K_Inject;
    uint16_t  K_Exhaust;
    uint16_t  DYC_Pdes;
    uint16_t  ROP_Pdes;
    uint16_t  dP;
    uint16_t  ROP_Po;
    uint16_t  K_Ax;
  } CFG;
  struct
  { uint16_t  Time;
    uint16_t  Pdes;
  } ROP;
  struct
  { uint8_t   Phase;
    uint16_t  Pdes;
    uint16_t  Tout;
  } DYC;
  _ByteBits_  Flags;

  _MOD_Err0_  MOD_Err0;
  _MOD_Err1_  MOD_Err1;

} TrailerTypeDef;

TrailerTypeDef Trailer;

#define    Trailer_Flags        Trailer.Flags.Byte
#define    DYC_TrailerBreak     Trailer.Flags.Bits.b0
#define    ROP_TrailerBreak     Trailer.Flags.Bits.b1
#define    Trailer_Before_ROP   Trailer.Flags.Bits.b2
#define    Trailer_Folding      Trailer.Flags.Bits.b3
#define    Trailer_Stop_Request Trailer.Flags.Bits.b4
#define    Trailer_Break_Active Trailer.Flags.Bits.b5

typedef struct
{
	int16_t AccelX;
	int16_t AccelY;
	int16_t AccelZ;
	int16_t Temp;
	int16_t GyroX;
	int16_t GyroY;
	int16_t GyroZ;
	uint8_t Data[8];
} AccGiroTypeDef;

typedef struct {
	struct {
		uint8_t   Acc_Tout;
		uint8_t   Gyro_Tout;
		uint8_t   IAM_TEMP;
		uint8_t   STM_TEMP;
		uint16_t  Error;
		uint8_t   Rx_Com;
		uint8_t   Rx_Key;
		uint8_t   Com_Ask;
	} AGS;

	AccGiroTypeDef SENS; //

	struct {
		uint8_t   Tout;
		uint8_t   Data[8];
		uint16_t  Error;
	}SAS;

	struct {
		uint8_t   Tout;
		uint16_t  Value;
		uint16_t  PS1;
		uint16_t  PS2;
		uint16_t  PS3;
		uint16_t  PS4;
		uint8_t   PSadr;
	}BPS;

	uint8_t   Stend_Test[8];

}TypeDef_CANS;

typedef struct
{
	uint8_t   CAN_DA;
	uint8_t   Phase;
	    uint8_t   PhRet;
	    uint32_t  CAN_ExtID;
	uint8_t   CAN_TxData[8];
	uint8_t   CAN_RxData[8];
		uint8_t   CAN_RxCnt;
		uint16_t  Tout;
		uint8_t   Command;
		uint32_t  SectorAdr;
		uint8_t   Paket[__PGM_Rx_Length];
		uint8_t   PaketNum;
		uint8_t   UartCnt; // для отладки
	_ByteBits_  Flags;

} TypeDef_UpGrade;

TypeDef_UpGrade UpGrade;
TypeDef_UpGrade CAN_USB;

#define  UpGrade_Flags    UpGrade.Flags.Byte
#define  UpGrade_CAN_USB  UpGrade.Flags.Bits.b0
#define  UpGrade_UartRx   UpGrade.Flags.Bits.b1
#define  UpGrade_CAN_Rx   UpGrade.Flags.Bits.b2  //не менять

#define  AGS_UpGrade_Request  UpGrade.Flags.Bits.b4
#define  AGS_UpGrade_Active   UpGrade.Flags.Bits.b5
#define  SAS_UpGrade_Request  UpGrade.Flags.Bits.b6
#define  SAS_UpGrade_Active   UpGrade.Flags.Bits.b7

typedef struct
{
	struct
	{	uint8_t   Phase;
	    uint16_t  Delay; // задержка калибровки после RST
	    int32_t   AccX_OffSet_Sum;
	    int32_t   AccY_OffSet_Sum;
	    int16_t   AccX_OffSet;
	    int16_t   AccY_OffSet;
	    int16_t   Tout;
	} Calibr;

	uint8_t   CAN_TxData[8]; // используется в CANS
	uint8_t   CAN_RxData[8]; // используется при калибровке
	uint16_t  MountFail_Cnt;     // ориентация Ok
	uint16_t  WZ_FailCnt;
	uint16_t  WY_FailCnt;
	uint16_t  WX_FailCnt;
	uint16_t  AccX_FailCnt;
	uint16_t  AccY_FailCnt;

	_ByteBits_  Fail;

}TypeDef_AGS;

TypeDef_AGS AGS;

#define  AGS_Fail     AGS.Fail.Byte
#define  WZ_Fail      AGS.Fail.Bits.b0
#define  WY_Fail      AGS.Fail.Bits.b1
#define  WX_Fail      AGS.Fail.Bits.b2
#define  Gyro_Zero    AGS.Fail.Bits.b3
#define  AccX_Fail    AGS.Fail.Bits.b4
#define  AccY_Fail    AGS.Fail.Bits.b5
#define  CFG_Ax_Fail  AGS.Fail.Bits.b6
#define  CFG_Ay_Fail  AGS.Fail.Bits.b7

#define AGSzero_PhEnd     12
#define AGSzeroNew_Ph1	  13
#define AGSzeroNew_Ph2	  14
#define AGSzeroNew_Ph3	  15

typedef struct
{
	int16_t   value;      // принят из CAN
	int16_t   Value_First;
	int16_t   Angle;      //
	uint8_t   MDC_Phase;  // MDC -  mechanical damage check
	int16_t   MDCfail_Cnt;

	struct
	{	uint8_t   Phase;  // установка нуля
		uint16_t  Fail_Cnt; //
		int32_t   SumAngle;
		uint16_t  Time;
		int16_t   Angle;  // угол когда едет прямо
		uint16_t  Wz;	  //CFG
		uint16_t  SAng;	  //CFG
		uint16_t  ZeroD_Cnt; //
	} Zero;

	int16_t   TetaAcker;
	int16_t   Steering;   // угол руля с Offset
	int16_t   AngleAcker;
	int16_t   Drift;
	int16_t   DriftFail_Cnt;
	int32_t   Integ;
	int16_t   OffSet;
	int32_t   Koef_Poz;
	int32_t   Koef_Neg;
	int8_t    Data_Cnt;
	uint16_t  Range_Cnt; //
	uint16_t  Ok_Delay; //

	struct
	{ uint8_t  Phase;
	  int16_t  AkPmax; //
	  int16_t  AkNmax; //
	  int16_t  WzPmax; //
	  int16_t  WzNmax; //
	  int32_t  Poz;    //
	  int32_t  Neg;
	  int32_t  Sum; //
	  int16_t  Cnt; //
	} K;

	int16_t   OmegaZ;
	uint16_t  Ratio;
	uint32_t  KoefRatio;
	uint32_t  Ratio_Kangle; // зависимость от угла
	uint32_t  Ratio_Ksign;	// зависимость от знака
	uint16_t  AngleA;       // абсолютная величина угла

	_ByteBits_  Fail;

} TypeDef_SAS;

TypeDef_SAS SAS;

#define  SAS_Fail_Flags       SAS.Fail.Byte
#define  SAS_DWZ_Fail         SAS.Fail.Bits.b0
#define  SAS_ZeroDirect_Fail  SAS.Fail.Bits.b1
#define  SAS_Range_Fail       SAS.Fail.Bits.b2
#define  VDCsens_Ok_Delay     SAS.Fail.Bits.b3
#define  SAS_Test_Disable     SAS.Fail.Bits.b4

typedef struct
{
	struct
	{
	  uint32_t  WMI;  // World Manufacturer Identifier Производитель
	  uint32_t  Model;
      uint16_t  Engine;
      uint8_t   Year; // год выпуска 2000 - 0
      uint64_t  Number;
      uint8_t   Code;
	} VIN;
	struct
	{
	  uint64_t  Num1;
      uint8_t   D;
	  uint32_t  Num2;
	} Modif;

	struct
	{ uint8_t   Cod_Y;
	  uint8_t   Cod_M;
	  uint8_t   Cod_D;
	  uint32_t  Cod;
	  uint8_t   SN_Y;
	  uint8_t   SN_M;
	  uint8_t   Lot;
	  uint16_t  SNum;
	  uint8_t   Ver_PO;
	  uint8_t   PO_MC1;
	  uint8_t   PO_MC2;
	  uint32_t  CRC_PGM_MC1;
	  uint32_t  CRC_PGM_MC2;
	} ECU;

    uint8_t   StateAGS;
    uint8_t   StateSAS;
    uint8_t   Gear;

    uint32_t  Front_ODO;
    uint32_t  Rear_ODO;
    uint32_t  RunaWay;
    uint32_t  WorkTime;

} TypeDef_Vehicle;

typedef struct
{
	uint8_t   Command;
	uint8_t   Last_Command;
	uint16_t  Delay;
	uint16_t  Pdes;

} TypeDef_Diag;

typedef struct
{
	MidTypeDef Mid;
	uint16_t*  ADC_Ch;
} ADC_Power;

typedef struct
{
	uint16_t  ADC_cmpl_Cnt;
	uint16_t  SPL_dU_Cnt;
	uint16_t  KL15Value;
	uint16_t  PWRValue;
	uint16_t  Fuse_Cnt;
	uint16_t  Over_Cnt;
	uint16_t  High_Cnt;
	uint16_t  Low_Cnt;
	uint16_t  INH_Cnt;
	uint16_t  ON_Cnt;

	ADC_Power  KL15;
	ADC_Power  KL30;

	struct {
		MidTypeDef Mid;
		uint16_t*  ADC_Ch;
	} KL_15;
	struct {
		MidTypeDef Mid;
		uint16_t*  ADC_Ch;
	} KL_30;
	struct
	{ uint16_t  PWM_Value;
	  uint16_t  ON_Cnt;
	  uint8_t   Pgm_OFF;
	} Rele;
} TypeDef_Power;

typedef struct
{
	uint8_t   DA;
	uint8_t   SA;
	uint8_t   InBuf[8];
	uint8_t   OutBuf[8];
	uint32_t  Adr;
	uint8_t   Phase;
	uint16_t  Tout;
	uint8_t   TxCnt;
	struct
	{ uint32_t  ExtID;
	  uint8_t   TxData[8];
	  uint8_t   RxData[8];
	} Frame;
	_ByteBits_  Flags;

} TypeDef_BridgeCAN;

TypeDef_BridgeCAN BridgeCAN;

#define    BridgeCAN_Flags    BridgeCAN.Flags.Byte
#define    Uart_BridgeCAN     BridgeCAN.Flags.Bits.b0
#define    BridgeCAN_DZ       BridgeCAN.Flags.Bits.b1
#define    BridgeCAN_WrReq    BridgeCAN.Flags.Bits.b2
#define    BridgeCAN_KEY      BridgeCAN.Flags.Bits.b3
#define    BridgeCAN_Ask      BridgeCAN.Flags.Bits.b4
#define    BridgeCAN_Uart     BridgeCAN.Flags.Bits.b5
#define    BridgeCAN_Fail     BridgeCAN.Flags.Bits.b6
#define    BridgeCAN_Active   BridgeCAN.Flags.Bits.b7

/* ----- определение CAN identifier ------Bridge ------*/
#define Bridge_Pri   3       // приоритет
#define BrCom_PGN    0xEF00  // PGN Com
#define BrData_PGN   0xEE00  // PGN Data
#define Bridge_Adr   0x3E    // адрес

typedef struct
{
    uint8_t    Condition;    // состояние ON-1  Off-0
	uint16_t*  ADC_Ch;
	struct {
		MidTypeDef Mid;
		uint8_t    State;  // состояние ON-0  Off-1 > Off_Level
		uint16_t   On_Val;
		uint16_t   Off_Val;
	} ADC;
	struct {
		uint16_t   On_Val;
		uint16_t   Off_Val;
		uint8_t    Mid_Val;
	} Oss;
	uint16_t   On_Level;  // порог включения
	uint16_t   Off_Level; // порог выключения
	uint8_t    Up_Fl;     // кнопка была отпущена
	uint8_t    Delay;     // счетчик задержки
	uint8_t    Install;   // есть в CFG
	uint8_t    Button;	  // 1-кнопка  0-выключатель

} ButtonTypeDef;

/*  ------------- END Exported types -------------------------------*/

/* ---------------------------Exported constants -----------------------------*/
#define Blank    0xFFFFFFFFU
#define __Blank_16    0xFFFFU
/* ----- определение Invense CMD --------------------*/
#define InvSpi_CMD_Read  0x80
#define Inv_CMD_Nul      0x00
#define Inv_CMD_Read_AG  0x02
#define Inv_CMD_ST_OTP   0x04
#define Inv_CMD_A_OS     0x06

#define WhileCplt		 0x01
#define UnWhileCplt		 0x00

#define GyroLim		     0x6658	// ограничение giro 200deg/s 3,59 рад/с
#define AccelLim	     0x6000	// ограничение Accel 1,5G
/* поперечное ускорение датчика
VDC2  1m/c^2 - 2048 lsb	  -+15,687 m/c^2  -+1,6G
MPU   1m/c^2 - 1670 lsb
K = 2048/1670 = 1,226
*/
#define AccYScale	     0x139F1 // масштабирование Accel_Y VDC2
#define AccZScale		AccYScale
/* продольное ускорение датчика
VDC2  1m/c^2 - 2560 lsb	(10msb)
MPU   1m/c^2 - 1670 lsb
K = 2560/1670 = 1,533
*/
#define AccXScale	     AccYScale //0x1886E // масштабирование Accel_X VDC2

/* угловая скорость вращения вокруг оси Z Yaw Rate
VDC2  1рад/c  -  8192 lsb  -+3,921 рад/c  -+224deg/s
MPU   1рад/c  -  7505 lsb
K = 8192/7505 = 1,0915
*/
#define GyroZScale	     0x1176F
#define GyroXScale		GyroZScale
#define GyroYScale		GyroZScale
/*
 ** диапазон для CAN 0-0xFAFE Offset 0x7D7F
 ** ограничения минимальное отрицательное  Neg_min
 **             максимальное положительное Poz_max 2
*/
#define   _CAN_int16_Offset    0x7D7F
#define   _CAN_int8_Offset     0x7D

#define   _CAN_Acc_Y_max    0x63C5  // 25541  = 0x7D7F/1.25644
#define   _CAN_Omega_Z_max  0x6465  // 25701  = 0x7D7F/1.25042
#define   _CAN_Acc_X_max    0x4FEA

/* ----- определение CAN identifier -ISO 11992---*/
#define EBS11_Pri    3        // приоритет
#define EBS11_PGN     0x0200  // PGN
#define EBS12_Pri    6        // приоритет
#define EBS12_PGN     0xFEC9  // PGN
#define EBS21_Pri    3        // приоритет
#define EBS21_PGN     0x0300  // PGN
#define EBS22_Pri    6        // приоритет
#define EBS22_PGN     0xFEC4  // PGN
#define EBS23_Pri    6        // приоритет
#define EBS23_PGN     0xFEC6  // PGN
#define EBS25_Pri    6        // приоритет
#define EBS25_PGN     0xF020  // PGN

#define Truck_Adr      0x20
#define Trailer1_Adr   0xC8
#define Trailer2_Adr   0xC0
#define Trailer3_Adr   0xB8
#define Trailer4_Adr   0xB0
#define Trailer5_Adr   0xA8

/* ----- определение CAN identifier ------PS ------*/
#define PS_Pri   6       // приоритет
#define PS_PGN   0xFF00  // PGN
#define PS_Adr   0xD0    // адрес

#define IPS_Pri  0       // приоритет
#define IPS_PGN  0xFF00  // PGN
#define IPS_Adr  0xC8    // адрес

#define PS1_Adr  0xD6    // адрес PS1
#define PS2_Adr  0xD7    // адрес PS1
#define PS3_Adr  0xD8    // адрес PS1
#define PS4_Adr  0xD9    // адрес PS1

/* ----- определение CAN identifier ------SAS ------*/
#define Steer_Pri   6       // приоритет
#define Steer_PGN   0xFF00  // PGN
#define Steer_Adr   0xE8    // адрес
/* ----- определение CAN identifier ------SAS zero--*/
#define SASzeroPri   0       // приоритет
#define SASzeroPGN   0xFF00  // PGN
#define SASzeroAdr   0xC8    // адрес

/* ----- определение CAN identifier ------GIRO ------*/
#define GYRO_Pri   6       // приоритет
#define GYRO_PGN   0xFF20  // PGN
#define GYRO_Adr   0xDC    // адрес
/* ----- определение CAN identifier -----ACCEL ------*/
#define ACCEL_Pri  6       // приоритет
#define ACCEL_PGN  0xFF10  // PGN
#define ACCEL_Adr  0xDC    // адрес
/* ----- определение CAN identifier ------VDC2 ------*/
#define VDC2_Pri   6       // приоритет
#define VDC2_PGN   0xF009  // PGN
#define VDC2_Adr   0x3E    // адрес
/* ----- определение CAN identifier ------RdCFG------*/
//#define RdCFG_Pri   3       // приоритет
//#define RdCFG_PGN   0xFE02  // PGN
//#define RdCFG_Adr   0xDC    // адрес
/* ----- определение CAN identifier ------WrCFG ------*/
#define WrCFG_Pri   3       // приоритет
#define WrCFG_PGN   0xFE03  // PGN
#define WrCFG_Adr   0xDC    // адрес
/* ----- определение CAN identifier ------ RdCAN ----*/
#define RdCAN_Pri   3       // приоритет
#define RdCAN_PGN   0xFE01  // PGN
#define RdCAN_Adr   0xDC    // адрес
#define cCAN_KEY1   0x05    // 1 БАЙТ ключ Test
#define cCAN_KEY2   0x07    // 1 БАЙТ ключ Conf
#define cCAN_KEY3   0x09    // 1 БАЙТ ключ команд
// команды чтения тестов KEY1
#define Com_Rd_CRC    0x01
#define Com_Rd_STA    0x02
#define Com_Rd_STG    0x03
// команды области конфигурации KEY2
#define Com_Rd_CONF   0x04  // командa чтения
#define Com_Wr_CONF   0x05  // командa записи
#define Com_Er_CONF   0x06
#define Com_Wr_CFGCRC 0x07  // запись CFGCRC

// команды управления KEY3
#define Com_ST_AG     0x08  // командa запуска тестов AG
#define Com_RST_MPU   0x09  // командa рестарта
#define Com_OffSet_AG 0x0A  // командa  OffSet
// 3 БАЙТ командa чтения OffSet
#define Rd_OffSet_GX  0x01  // командa чтения OffSet GYRO X
#define Rd_OffSet_GY  0x02  // командa чтения OffSet GYRO Y
#define Rd_OffSet_GZ  0x03  // командa чтения OffSet GYRO Z
#define Wr_OffSet_GX  0x04  // командa записи OffSet GYRO X
#define Wr_OffSet_GY  0x05  // командa записи OffSet GYRO Y
#define Wr_OffSet_GZ  0x06  // командa записи OffSet GYRO Z
#define Rd_OffSet_AX  0x07  // командa чтения OffSet Accel X
#define Rd_OffSet_AY  0x08  // командa чтения OffSet Accel Y
#define Rd_OffSet_AZ  0x09  // командa чтения OffSet Accel Z
#define Set_OffSet_G  0x0A  // командa установки OffSet GYRO для новой прошивки AGS

#define AGS_Ask       0x55
#define AGS_Zero_Ok   0x0D //0x0D

/* -- адреса констант конфигурации --*/
#define ADDR_Ident      0x0000  //
#define ADDR_PO_ID_D    0x0010  //
#define ADDR_PO_ID_V    0x0014  //
#define ADDR_PO_CRC     0x0018  //
#define ADDR_UID0       0x0020  //
#define ADDR_UID1       0x0024  //
#define ADDR_UID2       0x0028  //
#define ADDR_MCU_ID     0x0040  //
#define ADDR_MCU_SIZE   0x0044  //
#define ADDR_CFG_1      0x0050  //
#define ADDR_ADUI       0x0060  //
#define ADDR_GX_OffSet  0x0070  //
#define ADDR_GY_OffSet  0x0074  //
#define ADDR_GZ_OffSet  0x0078  //
#define ADDR_AX_OffSet  0x0080  //
#define ADDR_AY_OffSet  0x0084  //

#define ADDR_CFG_WrCnt  0x03F8
#define ADDR_CFG_CRC    0x03FC  //(FLASH_PAGE_SIZE - 4UL)

/* -- определение ADDR_CFG_1 --*/
#define F_ST_IniOn    0x00000001  // запуск теста при включении
#define F_GX_Offset   0x00000002  // запись XG_OFFSET при инициализации
#define F_GY_Offset   0x00000004  // запись XY_OFFSET при инициализации
#define F_GZ_Offset   0x00000008  // запись XZ_OFFSET при инициализации

/* ----- определение Failure ------*/
#define   Flash_CRC_Fail   0x0001
#define   AG_INT_Fail      0x0002
#define   CANS_Fail        0x0004
#define   AG_Not_Ready     0x0008

#define   ST_AccelX_Fail   0x0010
#define   ST_AccelY_Fail   0x0020
#define   ST_AccelZ_Fail   0x0040

#define   Config_CRC_Fail  0x0080

#define   ST_GyroX_Fail    0x0100
#define   ST_GyroY_Fail    0x0200
#define   ST_GyroZ_Fail    0x0400
//#define   CANT_Fail        0x0800

#define   Upit_Low         0x1000  //меньше 18В
#define   Upit_High        0x2000  //больше 31В
#define   Upit_Over        0x4000  //больше 60В
#define   VDD_Low          0x8000

#define   Mask_ST_ClrFail  0x0770
/* ----- определение уставок тестов ------*/
#define   AG_Tout_Set      0x55
//делитель 1:21  59,1 LSB/V
//#define   ADC_Upit_18V     0x0427
//#define   ADC_Upit_31V     0x0728
//#define   ADC_Upit_60V     0x0DDA
//#define   Upit_Over_Tset1  0x1388	//5000
//#define   Upit_Over_Tset2  0x000A	//10
//#define   Upit_High_Tset   0x03E8	//1000
//#define   Upit_Low_Tset    0xF830	//-2000

#define   STA_ThMul        0x11EB  //7%
#define   STG_ThMul        0x11EB  //7%

//****************************************************************************
// аналоговые датчики давления
#define   __PSA_Change      0x0028 // величина изменения от предыдущего
#define   __PSA_Reliable    0x00A3 // достоверные значения 0.8atm  4096/25,113=163
#define   __PSA_Delta       0x0051 // порог изменения
// CAN датчики давления
// размерности 5/256 kPa/bit
// k = 64000/4612 =13,8768 = 3552/256 CAN
#define   __K_PS_CAN        3552
#define   __PSCAN_Change    0x0049 // величина изменения от предыдущего
#define   __PSCAN_Reliable  0x0127 // достоверные значения 0.8atm 4096/13,8768 = 295
#define   __PSCAN_Delta     0x0093 // порог изменения

#define   Gyro_Change       0x0005 // величина изменения от предыдущего
#define   Gyro_Reliable     0x0A3C // достоверные значения Gyro +-20dps
#define   Gyro_Delta        0x0020 //порог изменения

#define   Gyro_Change1      0x0009 // величина изменения от предыдущего
#define   Gyro_Reliable1    0x0A3C // достоверные значения Gyro +-20dps
#define   Gyro_Delta1       0x0050 //порог изменения

#define   SASval_Change     0x010C // величина изменения от предыдущего 15deg
#define   SASval_Reliable   0x0648 // достоверные значения SAS 90deg
#define   SASval_Delta      0x02A0 // порог изменения	37,6deg

//---------------------------------------------------------------------------
#define __LoadEmpty_Koef  8192
#define __PS_OffSet       0x008C
//давление выключение модуляторов без провала скорости
#define __DYC_DifPressOff   0x1000 //0x1500
#define __ROP_DifPressOff   0x1400 //0x2000
#define __Dif_dPoff         0x0500
// обмен с другим процессором
#define __SCI_Head        0x55
#define __SCI_EOF         0x3C

#define __SCI_Head_B0     0xAF
#define __SCI_Head_B1_CB  0x05
#define __SCI_Head_B1_CW  0x10
#define __SCI_Head_B1_P1  0xC0
#define __SCI_Head_B2_P1  0x55
#define __SCI_Head_B3_P1  0xAA
#define __SCI_Head_B1_P2  0xB0
#define __SCI_Head_B2_P2  0x22
#define __SCI_Head_B3_P2  0x32
#define __SCI_Head_B1_N   0x20

#define   __uintXnMax      0xD000  // 208msb
#define   __uintYnMinus    0xE800  // 208msb

// AccY_OzD = Vx*OmegaZ_Des
// Koef_AccY_OzD = 2048 * 65536 / 3,6 / 8192
#define   __Koef_AccY_OzD        0x11C7

// -----   dps  -----------------
#define   __1dps  0x008F  //1deg/c
#define   __2dps  0x011E  //2deg/c
#define   __3dps  0x01AD  //3deg/c
#define   __4dps  0x023C  //4deg/c
#define   __5dps  0x02CB  //5deg/c
#define   __6dps  0x035A  //6deg/c
#define   __7dps  0x03E9  //7deg/c
#define   __8dps  0x0478  //8deg/c
#define   __12dps 0x06B4  //

#define __GearZF16	 1
#define __YMZ236	 2

//----------Exported constants Func.c  ------------

const volatile uint32_t constFlashCRC;
const volatile uint8_t SASzeroData[8];
const volatile uint8_t PS_CMD[8];
const volatile FUN_Ptr_t MyHallTab[20];

/* End of exported constants ------------------------------------------------*/

/* ------------Exported define _ByteBits_ -----------------------------------*/
_ByteBits_  _Uart_Flag;
#define     Uart_Flag          _Uart_Flag.Byte
#define   DSC_Const_WrIEE_req  _Uart_Flag.Bits.b0 //
#define   UartSCI_Sinxr_Flag   _Uart_Flag.Bits.b1 //
//#define   UartSCI_Enable       _Uart_Flag.Bits.b2 //
#define   UartSCI_Tx_BUSY      _Uart_Flag.Bits.b3 //

#define   UartDIA_Sinxr_Flag   _Uart_Flag.Bits.b4 //
#define   UartDIA_Head_Flag    _Uart_Flag.Bits.b5 //
#define   UartDIA_Cmpl_Flag    _Uart_Flag.Bits.b6 //
#define   UartDIA_Tx_BUSY      _Uart_Flag.Bits.b7 //

_ByteBits_  _Uart_Flag_MC2;
#define     Uart_Flag_MC2      _Uart_Flag_MC2.Byte
//-----------Настройки регулирования Config---------------------------------
_ByteBits_  _Block_Config;
#define     Block_Config        _Block_Config.Byte
#define     Tahograf_CAN        _Block_Config.Bits.b4
#define     Off_CAN             _Block_Config.Bits.b5
#define     Engine_CAN          _Block_Config.Bits.b6
#define     Engine_PK           _Block_Config.Bits.b7

_ByteBits_  _Button_Config;
#define     Button_Config       _Button_Config.Byte
#define     ABS_SW_Button       _Button_Config.Bits.b0
#define     ASR_SW_Button       _Button_Config.Bits.b1
#define     StopEnable          _Button_Config.Bits.b2
#define     StopSensor          _Button_Config.Bits.b3
#define     ASR_Two_Engine      _Button_Config.Bits.b4
#define     Psens_install       _Button_Config.Bits.b5 // измерительные датчки давления
// Not Used OLD -- можно переназначать

//#define     DBREnable          _Button_Config.Bits.b6   ;// Not Used OLD
//#define     ACPT_Enable        _Button_Config.Bits.b7   ;// Not Used OLD

_ByteBits_  _Def_Config_1;
#define     Def_Config_1        _Def_Config_1.Byte
#define     ReleDBR_install     _Def_Config_1.Bits.b0
#define     LampASR_install     _Def_Config_1.Bits.b1
#define     Prop_Kl_install     _Def_Config_1.Bits.b2
#define     DifR_Install        _Def_Config_1.Bits.b3
#define     B7_install          _Def_Config_1.Bits.b4
#define     Lim_Speed_Enable    _Def_Config_1.Bits.b5
#define     ABS_SW_install      _Def_Config_1.Bits.b6
#define     ASR_SW_install      _Def_Config_1.Bits.b7

_ByteBits_  _Def_Config_2;
#define     Def_Config_2        _Def_Config_2.Byte
#define     EBL_Enable          _Def_Config_2.Bits.b0
#define     LampABS_install     _Def_Config_2.Bits.b1
#define     DTC_Enable          _Def_Config_2.Bits.b2
#define     TSET_SW_Button      _Def_Config_2.Bits.b3
#define     TSET_SW_install     _Def_Config_2.Bits.b4
#define     LIM_TSET_Enable     _Def_Config_2.Bits.b5
#define     CAN_TSCAE_Mode1     _Def_Config_2.Bits.b6
#define     m_Truck             _Def_Config_2.Bits.b7

_ByteBits_  _Def_Config_3;
#define     Def_Config_3        _Def_Config_3.Byte
#define     m_Upit_24V          _Def_Config_3.Bits.b0
#define     New_Key_Old_Block   _Def_Config_3.Bits.b1
#define     CAN_DM1_Mode1       _Def_Config_3.Bits.b2
#define     LampTrail_install   _Def_Config_3.Bits.b3
#define     Poly_Enable         _Def_Config_3.Bits.b4
#define     CAN_VDC1_Wabco      _Def_Config_3.Bits.b5
#define     ASR_Tout_Enable     _Def_Config_3.Bits.b6
#define     Block_6S_6M         _Def_Config_3.Bits.b7

_ByteBits_  _DiffLock_Config;
#define     Lock_Diff_Config     _DiffLock_Config.Byte
#define     Lock_DIF_Axel1      _DiffLock_Config.Bits.b0
#define     Lock_DIF_Axel2      _DiffLock_Config.Bits.b1
#define     Lock_DIF_Axel3      _DiffLock_Config.Bits.b2

_ByteBits_  _DSC_Config_1;
#define     DSC_Config_1        _DSC_Config_1.Byte
#define     DSC_Enable          _DSC_Config_1.Bits.b0
#define     DSC_Lamp_Inst       _DSC_Config_1.Bits.b1 //*not Used
#define     TSET_HHR_Sw_Enable  _DSC_Config_1.Bits.b2
#define     DifF_Install        _DSC_Config_1.Bits.b3
#define     CFG_DYC_Break_Enable _DSC_Config_1.Bits.b4 // Yaw Control тормозами включен
#define     CFG_DYC_Engine_Enable _DSC_Config_1.Bits.b5 // Yaw Control двигателем включен
#define     DSC_Roll_Enable      _DSC_Config_1.Bits.b6 // Roll Control включен
#define     DSC_SideSleep_Enable _DSC_Config_1.Bits.b7 // SideSleep Control включен

_ByteBits_  _DSC_Config_2;
#define     DSC_Config_2        _DSC_Config_2.Byte
#define     DSC_Brake_Light     _DSC_Config_2.Bits.b0 // VDC brake light  активируется
#define     DSC_TruckSim        _DSC_Config_2.Bits.b1 // Эмуляция TruckSim
#define     DSC_ModT_Install    _DSC_Config_2.Bits.b2 // Модулятор прицепа установлен
#define     DSC_DifT_Install    _DSC_Config_2.Bits.b3 // DifKl прицепа установлен
#define     DSC_AGS_Install     _DSC_Config_2.Bits.b4 // Сенсор AGS установлен
#define     DSC_SAS_Install     _DSC_Config_2.Bits.b5 // Сенсор SAS установлен
#define     DSC_CANT_Install    _DSC_Config_2.Bits.b6 // СAN прицепа установлен
#define     DSC_BPS_Install     _DSC_Config_2.Bits.b7 // Сенсор давления установлен

_ByteBits_  _DSC_Config_3;
#define     DSC_Config_3     _DSC_Config_3.Byte
#define     Route_CANT			_DSC_Config_3.Bits.b0  // используется
#define     DSC_MC3_Install     _DSC_Config_3.Bits.b1  // MC1
#define     MDT_Right_Enable    _DSC_Config_3.Bits.b2  //
#define     DYC_TrailerPress    _DSC_Config_3.Bits.b3  //используется
#define     DSC_Steer_neg       _DSC_Config_3.Bits.b4
#define     DSC_Omega_Z_neg     _DSC_Config_3.Bits.b5
#define     DSC_Accel_Y_neg     _DSC_Config_3.Bits.b6
#define     DSC_Accel_X_neg     _DSC_Config_3.Bits.b7

_ByteBits_  _DSC_Config_4;
#define     DSC_Config_4        _DSC_Config_4.Byte
#define     Tire_Koef_Enable    _DSC_Config_4.Bits.b0
#define     AccX_WyOS_Enable    _DSC_Config_4.Bits.b1
#define     AccX_Pitch_Enable   _DSC_Config_4.Bits.b2
#define     ASR_Torq_Filtr      _DSC_Config_4.Bits.b3  // DZ
#define     MDT_DifON_Enable    _DSC_Config_4.Bits.b4
#define     ABS_Rear_Drag       _DSC_Config_4.Bits.b5
#define     ROP_notMIR          _DSC_Config_4.Bits.b6  // DZ
#define     MIR_Rear_Enable     _DSC_Config_4.Bits.b7

_ByteBits_  _DSC_Config_5;
#define     DSC_Config_5        _DSC_Config_5.Byte
#define     DYC_RoadAx_Enable   _DSC_Config_5.Bits.b0
#define     FiltrVx1Hz          _DSC_Config_5.Bits.b1
#define     ROP_Tilting_Enable  _DSC_Config_5.Bits.b2
#define     TrailerROP_Engine   _DSC_Config_5.Bits.b3
#define     ROP_CheckVx_Enable  _DSC_Config_5.Bits.b4
#define     TCO_Install     _DSC_Config_5.Bits.b5
#define     ROP_Ph2R_Pcont      _DSC_Config_5.Bits.b6
#define     DYC_PDout_Norm      _DSC_Config_5.Bits.b7

_ByteBits_  _DSC_Config_6;
#define     DSC_Config_6        _DSC_Config_6.Byte
#define     FiltrTrailerPress_Enable _DSC_Config_6.Bits.b0
#define     EBS11_Trailer_PS         _DSC_Config_6.Bits.b1
#define     UnSt_Der_Akk             _DSC_Config_6.Bits.b2
#define     UnSt_Drag_Act            _DSC_Config_6.Bits.b3
#define     Trailer_Preg_Tip2        _DSC_Config_6.Bits.b4
#define     Wheel_Ref_Correct        _DSC_Config_6.Bits.b5
#define     SSA_OmegaZ_Enable        _DSC_Config_6.Bits.b6
#define     Air_Suspension           _DSC_Config_6.Bits.b7

_ByteBits_  _DSC_Config_7;
#define     DSC_Config_7       _DSC_Config_7.Byte
#define     ROP_RegP_Tip2      _DSC_Config_7.Bits.b0
#define     ROP_Eng_Off        _DSC_Config_7.Bits.b1
#define     EBL_Sleep_Enable   _DSC_Config_7.Bits.b2
#define     EBL_Koef_Enable    _DSC_Config_7.Bits.b3
#define     EBL_Koef_Sign      _DSC_Config_7.Bits.b4
#define     CAN_CCVS_Enable    _DSC_Config_7.Bits.b5
#define     ABS_PromExh_Front  _DSC_Config_7.Bits.b6
#define     Dif_CutM_Enable    _DSC_Config_7.Bits.b7

_ByteBits_  _DSC_Config_8;
#define     DSC_Config_8       _DSC_Config_8.Byte
#define     Curvature_Enable   _DSC_Config_8.Bits.b0 //
#define     OneWire_Enable     _DSC_Config_8.Bits.b1
#define     m_TSC_AE_Arbitrage _DSC_Config_8.Bits.b2 //DZ
#define     Break_Abort_DYC    _DSC_Config_8.Bits.b3
#define     Drag_LowMu_Enable  _DSC_Config_8.Bits.b4
#define     AntiFold_Enable    _DSC_Config_8.Bits.b5
#define     UnSt_Only_Circle   _DSC_Config_8.Bits.b6
#define     AccY_Roll_Enable   _DSC_Config_8.Bits.b7

_ByteBits_  _DSC_Config_9;
#define     DSC_Config_9       _DSC_Config_9.Byte
#define     Press_Validation   _DSC_Config_9.Bits.b0 //
#define     Press_OffSet       _DSC_Config_9.Bits.b1 //
#define     Trailer_Before_ROP_Enable _DSC_Config_9.Bits.b2 //
#define     LoadKoef_Enable    _DSC_Config_9.Bits.b3 //
#define     Load_Break_Metod2  _DSC_Config_9.Bits.b4 //
#define     Load_Engine_Metod2 _DSC_Config_9.Bits.b5 //
#define     ROP_Ph1Sleep_Enable _DSC_Config_9.Bits.b6 //
#define     PS_OffSet_Enable    _DSC_Config_9.Bits.b7

_ByteBits_  _DSC_Config_10;
#define     DSC_Config_10      _DSC_Config_10.Byte
#define     ASR_Engine_Enable  _DSC_Config_10.Bits.b0 //
#define     ASR_Break_Enable   _DSC_Config_10.Bits.b1 //
#define     ASR_Enable         _DSC_Config_10.Bits.b2 //
#define     ASR_Engine_Taxo    _DSC_Config_10.Bits.b3 //
#define     BC_notABS_Enable   _DSC_Config_10.Bits.b4 //
#define     ExhShort_Enable    _DSC_Config_10.Bits.b5 // упреждения отсечки
#define     ABS_Enable         _DSC_Config_10.Bits.b6 //
#define     BC_actABS_Enable   _DSC_Config_10.Bits.b7 //

_ByteBits_  _DSC_Config_11;
#define     DSC_Config_11      _DSC_Config_11.Byte
#define     RearTire_Tandem    _DSC_Config_11.Bits.b0 //
#define     DopTire_Tandem     _DSC_Config_11.Bits.b1 //
#define     PressEst_StatusPA  _DSC_Config_11.Bits.b2 //
#define     ABS_MIRF_Disable   _DSC_Config_11.Bits.b3 //
#define     Emul_AccX_AccY     _DSC_Config_11.Bits.b4 //
#define     Emul_Taxo          _DSC_Config_11.Bits.b5 //
#define     Speed_HalfPeriod   _DSC_Config_11.Bits.b6 //
#define     ASR_KTS_Adj_Enable _DSC_Config_11.Bits.b7 //

_ByteBits_  _DSC_Config_12;
#define     DSC_Config_12      _DSC_Config_12.Byte
#define     BC_AntiGAZ_Enable  _DSC_Config_12.Bits.b0 //
#define     ASR_Abort_Brake    _DSC_Config_12.Bits.b1 //
#define     ROP_Engine_Taxo    _DSC_Config_12.Bits.b2 //
#define     Engine_EC1_Enable  _DSC_Config_12.Bits.b3 //
#define     ASR_Taxo_Grad      _DSC_Config_12.Bits.b4 //
#define     ASR_Taxo_Filtr     _DSC_Config_12.Bits.b5 //
#define     ASR_dTaxo_Lim      _DSC_Config_12.Bits.b6 //
#define     Diagnose_Enable    _DSC_Config_12.Bits.b7 //

_ByteBits_  _DSC_Config_13;
#define     DSC_Config_13      _DSC_Config_13.Byte
#define     ABS_DYC_Disable    _DSC_Config_13.Bits.b0 //
#define     ABS_dExh1_Enable   _DSC_Config_13.Bits.b1 //
#define     ABS_PromExh_Enable _DSC_Config_13.Bits.b2 //
#define     ABS_Ph4Rec_Enable  _DSC_Config_13.Bits.b3 //
#define     ABS_Ph3end_Acc     _DSC_Config_13.Bits.b4 //
#define     Trailer_PS_AUX2    _DSC_Config_13.Bits.b5 //
#define     Break_PS_CAN       _DSC_Config_13.Bits.b6 //
#define     Validity_Abort_DYC _DSC_Config_13.Bits.b7

_ByteBits_  _DSC_Config_14;
#define     DSC_Config_14      _DSC_Config_14.Byte
#define     EBL_HighP_Enable   _DSC_Config_14.Bits.b0 //
#define     EBL_Pump_dP_CFG    _DSC_Config_14.Bits.b1 //
#define     EBL_Ks_Enable      _DSC_Config_14.Bits.b2 //
#define     ExhShort_Ais       _DSC_Config_14.Bits.b3 //
#define     Speed_Mashtab      _DSC_Config_14.Bits.b4 //
#define     MIRF_Always        _DSC_Config_14.Bits.b5 //
#define     ABS_ExhTAI_Enable  _DSC_Config_14.Bits.b6 //
#define     ROP_dAyOFF_Enable  _DSC_Config_14.Bits.b7 //

_ByteBits_  _DSC_Config_15;
#define     DSC_Config_15      _DSC_Config_15.Byte
#define     ABS_Ph3end_Slip    _DSC_Config_15.Bits.b0 //
#define     MIRF_dWZ_Enable    _DSC_Config_15.Bits.b1 //
#define     ABS_SlipThr_Change _DSC_Config_15.Bits.b2
#define     ABS_SpThr_Enable   _DSC_Config_15.Bits.b3
#define     ABS_SlipDec_Change _DSC_Config_15.Bits.b4 //
#define     ABS_End_Tip2       _DSC_Config_15.Bits.b5 //
#define     MIRF_Exh_Tip2      _DSC_Config_15.Bits.b6 //
#define     Ph6_ddP_Enable     _DSC_Config_15.Bits.b7 //

_ByteBits_  _DSC_Config_16;
#define     DSC_Config_16      _DSC_Config_16.Byte
#define     ECAS_PS_Install    _DSC_Config_16.Bits.b0 //
#define     Util_Dec_55_15     _DSC_Config_16.Bits.b1 //
#define     ABS_AxFail_Enable  _DSC_Config_16.Bits.b2 //
#define     Trailer_PS_Install _DSC_Config_16.Bits.b3 //
#define     TipBrake_Front     _DSC_Config_16.Bits.b4 // 1-диск 0-барабан
#define     TipBrake_Rear      _DSC_Config_16.Bits.b5 // 1-диск 0-барабан
#define     EBL_FzHg_Enable    _DSC_Config_16.Bits.b6 // изменениe реакций при торможении
#define     BrakeOneAxis_Enable _DSC_Config_16.Bits.b7

_ByteBits_  _DSC_Config_17;
#define     DSC_Config_17      _DSC_Config_17.Byte
#define     Check_Safe_Enable  _DSC_Config_17.Bits.b0 //
#define     Brake_Asist_Enable _DSC_Config_17.Bits.b1 //
#define     EBL_PoCut_Enable   _DSC_Config_17.Bits.b2 //
#define     IncValve_Model     _DSC_Config_17.Bits.b3 //
#define     DBR_Enable         _DSC_Config_17.Bits.b4 //
#define     ABS_Sign_KdP       _DSC_Config_17.Bits.b5 //
#define     Trailer_Stop_Light _DSC_Config_17.Bits.b6 //
#define     Rele_Stop_Install  _DSC_Config_17.Bits.b7 //

_ByteBits_  _DSC_Config_18;
#define     DSC_Config_18      _DSC_Config_18.Byte
#define     Hill_Holder_Enable _DSC_Config_18.Bits.b0 //
#define     HHR_Lamp_Enable    _DSC_Config_18.Bits.b1 //
#define     HHR_DifR_Enable    _DSC_Config_18.Bits.b2 //
#define     EBC1_HHR_Sw_Enable _DSC_Config_18.Bits.b3 //
#define     HHR_Press_Enable   _DSC_Config_18.Bits.b4 //
#define     EBC5_SPN5847_Enable _DSC_Config_18.Bits.b5 //
#define     SPN5847_Deccel_6   _DSC_Config_18.Bits.b6 //
#define     Test_GndWL_Enable  _DSC_Config_18.Bits.b7 //  не менять

_ByteBits_  _DSC_Config_19;
#define     DSC_Config_19      _DSC_Config_19.Byte
#define     ASR_BrTout_Enable  _DSC_Config_19.Bits.b0 //
#define     ASR_EngTout_Enable _DSC_Config_19.Bits.b1 //
#define     AccX_Fail_Enable   _DSC_Config_19.Bits.b2 //
#define     ASR_Torq_KoefPress _DSC_Config_19.Bits.b3 //
#define     ASR_BrTout_Tip2    _DSC_Config_19.Bits.b4 //
#define     ASRon_Check_TCO    _DSC_Config_19.Bits.b5 //
#define     ASR_ErrRWS_Enable  _DSC_Config_19.Bits.b6 //
#define     ASR_Kload_Enable   _DSC_Config_19.Bits.b7 //

_ByteBits_  _DSC_Config_20;
#define     DSC_Config_20      _DSC_Config_20.Byte
#define     DIF_PWM_Enable     _DSC_Config_20.Bits.b0 //
#define     BP_Grad_Enable     _DSC_Config_20.Bits.b1 //
#define     FailPS_PressEst    _DSC_Config_20.Bits.b2 //
#define     Load_KTS           _DSC_Config_20.Bits.b3 //
#define     SpeedExt_Enable    _DSC_Config_20.Bits.b4 //
#define     SpeedExt_Accel     _DSC_Config_20.Bits.b5 //
#define     VDC_Fail_Enable    _DSC_Config_20.Bits.b6 //
#define     TP2_My_Main        _DSC_Config_20.Bits.b7 //

_ByteBits_  _DSC_Config_21;
#define     DSC_Config_21      _DSC_Config_21.Byte
#define     Mediana_Enable     _DSC_Config_21.Bits.b0 //
#define     Filtr_Brake_Enable _DSC_Config_21.Bits.b1 //
#define     Load_DeltaMass_Lim _DSC_Config_21.Bits.b2 //
#define     Stop_Switch_Test   _DSC_Config_21.Bits.b3 //
#define     Brake_PS_Off_Test  _DSC_Config_21.Bits.b4 //
#define     Brake_PS_On_Test   _DSC_Config_21.Bits.b5 //
#define     Trailer_PS_Test    _DSC_Config_21.Bits.b6 //
#define     Trailer_NC_Test    _DSC_Config_21.Bits.b7 //

_ByteBits_  _DSC_Config_22;
#define     DSC_Config_22      _DSC_Config_22.Byte
#define     Stop_Light_Test    _DSC_Config_22.Bits.b0 //
#define     Trailer_PS_On_Test _DSC_Config_22.Bits.b1 //
#define     ABS_Ph5_PauseSlip  _DSC_Config_22.Bits.b2 //
#define     ABS_Search_SlipOpt _DSC_Config_22.Bits.b3 //
#define     IncValve_Always    _DSC_Config_22.Bits.b4 //
#define     Filt_AirDrop_Enable _DSC_Config_22.Bits.b5 //
#define     MDT_Left_Enable    _DSC_Config_22.Bits.b6 //
#define     Stop_Switch_Instal _DSC_Config_22.Bits.b7 // *Not Used

_ByteBits_  _DSC_Config_23;
#define     DSC_Config_23      _DSC_Config_23.Byte
#define     MDT_Front_Enable   _DSC_Config_23.Bits.b0 //
#define     MDT_Rear_Enable    _DSC_Config_23.Bits.b1 //
#define     GearBox_AutoMatic  _DSC_Config_23.Bits.b2 //
#define     DBR_Torque_Set     _DSC_Config_23.Bits.b3 //
#define     Sens_Clutch_Instal _DSC_Config_23.Bits.b4 //
#define     ECAS_PS_Calibr     _DSC_Config_23.Bits.b5 //
#define     EBC1_SPN521_Enable _DSC_Config_23.Bits.b6 // DZ Brake Demand
#define     ABS_OffRoad_Enable _DSC_Config_23.Bits.b7 //

_ByteBits_  _DSC_Config_24;
#define     DSC_Config_24      _DSC_Config_24.Byte
#define     DashBoard_Tip_b0   _DSC_Config_24.Bits.b0 // не менять
#define     DashBoard_Tip_b1   _DSC_Config_24.Bits.b1 //
#define     DashBoard_Tip_b2   _DSC_Config_24.Bits.b2 //
#define     DiaSW_Kline_Enable _DSC_Config_24.Bits.b3 // не менять
#define     BPS_onAccValve     _DSC_Config_24.Bits.b4
#define     Halt_Check_Gaz     _DSC_Config_24.Bits.b5
#define     Halt_Brake_Enable  _DSC_Config_24.Bits.b6 // не менять
#define     Halt_Brake_Auto    _DSC_Config_24.Bits.b7 //

_ByteBits_  _DSC_Config_25;
#define     DSC_Config_25      _DSC_Config_25.Byte
#define     PlataAGS_Mount_b0  _DSC_Config_25.Bits.b0 // не менять
#define     PlataAGS_Mount_b1  _DSC_Config_25.Bits.b1 //
#define     PlataAGS_Mount_b2  _DSC_Config_25.Bits.b2 // не менять
#define     PlataAGS_Enable    _DSC_Config_25.Bits.b3
#define     XBR_Enable         _DSC_Config_25.Bits.b4
#define     ABS_BaseRtoF       _DSC_Config_25.Bits.b5
#define     CAN_VW_Enable      _DSC_Config_25.Bits.b6
#define     GYRO_Zero_Enable   _DSC_Config_25.Bits.b7

_ByteBits_  _DSC_Config_26;
#define     DSC_Config_26      _DSC_Config_26.Byte
#define     VDC_LastError      _DSC_Config_26.Bits.b0 // не менять
#define     DBR_Torque_LimDec  _DSC_Config_26.Bits.b1 //
#define     DBR_Load_Brake     _DSC_Config_26.Bits.b2
#define     Load_Brake_Buf     _DSC_Config_26.Bits.b3
#define     Load_Engine_Buf    _DSC_Config_26.Bits.b4
#define     Trailer_Pmodel     _DSC_Config_26.Bits.b5
#define     Blink_Code_Enable  _DSC_Config_26.Bits.b6
#define     Axis3Tire_Tandem   _DSC_Config_26.Bits.b7 //

_ByteBits_  _DSC_AOS_Config;
#define     DSC_AOS_Config     _DSC_AOS_Config.Byte
#define     AOS_BreakP_Enable  _DSC_AOS_Config.Bits.b0 //*Yes
#define     ROP_Trailer_Break_Enable _DSC_AOS_Config.Bits.b1 //
#define     StatusTrailer_Enable     _DSC_AOS_Config.Bits.b2 //
#define     AOS_Acker_Enable   _DSC_AOS_Config.Bits.b3 //
#define     AOS_Steer_Enable   _DSC_AOS_Config.Bits.b4 //
#define     AOS_OmegaZ_Enable  _DSC_AOS_Config.Bits.b5 //
#define     AOS_AccY_Enable    _DSC_AOS_Config.Bits.b6 //*
#define     AOS_AccX_Enable    _DSC_AOS_Config.Bits.b7 //

_ByteBits_  _MOD_Config;
#define     MOD_Config         _MOD_Config.Byte
#define     ModFL_Install        _MOD_Config.Bits.b0
#define     ModFR_Install        _MOD_Config.Bits.b1
#define     ModRL_Install        _MOD_Config.Bits.b2
#define     ModRR_Install        _MOD_Config.Bits.b3
#define     Mod3L_Install        _MOD_Config.Bits.b4
#define     Mod3R_Install        _MOD_Config.Bits.b5
#define     ModT_Install         _MOD_Config.Bits.b6
#define     DifT_Install         _MOD_Config.Bits.b7

_ByteBits_  _WheelSens_Config;
#define     WheelSens_Config   _WheelSens_Config.Byte
#define     SenFL_Install      _WheelSens_Config.Bits.b0
#define     SenFR_Install      _WheelSens_Config.Bits.b1
#define     SenRL_Install      _WheelSens_Config.Bits.b2
#define     SenRR_Install      _WheelSens_Config.Bits.b3
#define     Sen3L_Install      _WheelSens_Config.Bits.b4
#define     Sen3R_Install      _WheelSens_Config.Bits.b5

_ByteBits_  _Fault_Mask;
#define     Fault_Mask         _Fault_Mask.Byte
#define     AGS_ZeroFail_Enable    _Fault_Mask.Bits.b0
#define     AGS_MountFail_Enable   _Fault_Mask.Bits.b1
#define     AGS_InstallFail_Enable _Fault_Mask.Bits.b2
#define     SAS_ZeroFail_Enable    _Fault_Mask.Bits.b3
#define     SAS_InstallFail_Enable _Fault_Mask.Bits.b4
#define     Model_InstFail_Enable  _Fault_Mask.Bits.b5
#define     Install_Fail_LampOff   _Fault_Mask.Bits.b6
#define     HillHold_Fail_Enable   _Fault_Mask.Bits.b7

//----end Config--------------------------------------------

_ByteBits_  _CAN_PGN_Find1;
#define     CAN_PGN_Find1     _CAN_PGN_Find1.Byte
#define     Find_ASC4         _CAN_PGN_Find1.Bits.b0
#define     Find_TCO1         _CAN_PGN_Find1.Bits.b1
#define     Find_CCVS         _CAN_PGN_Find1.Bits.b2
#define     Find_EEC2         _CAN_PGN_Find1.Bits.b3
#define     Find_EEC1         _CAN_PGN_Find1.Bits.b4
#define     Find_AMB          _CAN_PGN_Find1.Bits.b5
#define     Find_VDHR         _CAN_PGN_Find1.Bits.b6
#define     Find_AIR1         _CAN_PGN_Find1.Bits.b7

_ByteBits_  _CAN_PGN_Find2;
#define     CAN_PGN_Find2     _CAN_PGN_Find2.Byte
#define     Find_ASC1         _CAN_PGN_Find2.Bits.b0
#define     Find_EC1          _CAN_PGN_Find2.Bits.b1
#define     Find_EBC1         _CAN_PGN_Find2.Bits.b2
#define     Find_Body_PGN     _CAN_PGN_Find2.Bits.b3
#define     Find_DC1          _CAN_PGN_Find2.Bits.b4
#define     Find_ESC1         _CAN_PGN_Find2.Bits.b5
#define     Find_XBR_1        _CAN_PGN_Find2.Bits.b6
#define     Find_XBR_2        _CAN_PGN_Find2.Bits.b7

_ByteBits_  _CAN_PGN_Find3;
#define     CAN_PGN_Find3     _CAN_PGN_Find3.Byte
#define     Find_ERC1_RD      _CAN_PGN_Find3.Bits.b0
#define     Find_ERC1_RE      _CAN_PGN_Find3.Bits.b1
#define     Find_ERC1_RG      _CAN_PGN_Find3.Bits.b2
#define     Find_ERC1_REX     _CAN_PGN_Find3.Bits.b3
#define     Find_CCVS_Eng     _CAN_PGN_Find3.Bits.b4
#define     Find_CCVS_Body    _CAN_PGN_Find3.Bits.b5
#define     Find_CCVS_Dash    _CAN_PGN_Find3.Bits.b6
#define     Find_ETC1         _CAN_PGN_Find3.Bits.b7

_ByteBits_  _CAN_PGN_Find4;
#define     CAN_PGN_Find4     _CAN_PGN_Find4.Byte
#define     Find_ETC2         _CAN_PGN_Find4.Bits.b0
#define     Find_TSC_AE       _CAN_PGN_Find4.Bits.b1
#define     Find_PGN_FF20     _CAN_PGN_Find4.Bits.b2
#define     Find_PGN_FF21     _CAN_PGN_Find4.Bits.b3
#define     Find_PGN_FF22     _CAN_PGN_Find4.Bits.b4
#define     Find_PGN_FF23     _CAN_PGN_Find4.Bits.b5
#define     Find_EEC1_81      _CAN_PGN_Find4.Bits.b6
#define     Find_EEC1_82      _CAN_PGN_Find4.Bits.b7

_ByteBits_  _CAN_PGN_Find5;
#define     CAN_PGN_Find5     _CAN_PGN_Find5.Byte
#define     Find_EEC2_EM      _CAN_PGN_Find5.Bits.b0

_ByteBits_  _CAN_PGN_Tout1;
#define     CAN_PGN_Tout1     _CAN_PGN_Tout1.Byte
#define     Tout_ASC4         _CAN_PGN_Tout1.Bits.b0
#define     Tout_TCO1         _CAN_PGN_Tout1.Bits.b1
#define     Tout_CCVS         _CAN_PGN_Tout1.Bits.b2
#define     Tout_EEC2         _CAN_PGN_Tout1.Bits.b3
#define     Tout_EEC1         _CAN_PGN_Tout1.Bits.b4
#define     Tout_AMB          _CAN_PGN_Tout1.Bits.b5
#define     Tout_VDHR         _CAN_PGN_Tout1.Bits.b6
#define     Tout_AIR1         _CAN_PGN_Tout1.Bits.b7

_ByteBits_  _CAN_PGN_Tout2;
#define     CAN_PGN_Tout2     _CAN_PGN_Tout2.Byte
#define     Tout_ASC1         _CAN_PGN_Tout2.Bits.b0
#define     Tout_EC1          _CAN_PGN_Tout2.Bits.b1
#define     Tout_EBC1         _CAN_PGN_Tout2.Bits.b2
#define     Tout_Body_PGN     _CAN_PGN_Tout2.Bits.b3
#define     Tout_DC1          _CAN_PGN_Tout2.Bits.b4
#define     Tout_ESC1         _CAN_PGN_Tout2.Bits.b5
#define     Tout_XBR_1        _CAN_PGN_Tout2.Bits.b6
#define     Tout_XBR_2        _CAN_PGN_Tout2.Bits.b7

_ByteBits_  _CAN_PGN_Tout3;
#define     CAN_PGN_Tout3     _CAN_PGN_Tout3.Byte
#define     Tout_ERC1_RD      _CAN_PGN_Tout3.Bits.b0
#define     Tout_ERC1_RE      _CAN_PGN_Tout3.Bits.b1
#define     Tout_ERC1_RG      _CAN_PGN_Tout3.Bits.b2
#define     Tout_ERC1_REX     _CAN_PGN_Tout3.Bits.b3
#define     Tout_TPD          _CAN_PGN_Tout3.Bits.b4
#define     Tout_CCVS_Eng     _CAN_PGN_Tout3.Bits.b5
#define     Tout_CCVS_Body    _CAN_PGN_Tout3.Bits.b6
#define     Tout_CCVS_Dash    _CAN_PGN_Tout3.Bits.b7

_ByteBits_  _CAN_PGN_Tout4;
#define     CAN_PGN_Tout4     _CAN_PGN_Tout4.Byte
#define     Tout_ETC1         _CAN_PGN_Tout4.Bits.b0
#define     Tout_ETC2         _CAN_PGN_Tout4.Bits.b1
#define     Tout_TSC_AE       _CAN_PGN_Tout4.Bits.b2
#define     Tout_PGN_FF20     _CAN_PGN_Tout4.Bits.b3
#define     Tout_PGN_FF21     _CAN_PGN_Tout4.Bits.b4
#define     Tout_PGN_FF22     _CAN_PGN_Tout4.Bits.b5
#define     Tout_PGN_FF23     _CAN_PGN_Tout4.Bits.b6
#define     Tout_EEC1_81      _CAN_PGN_Tout4.Bits.b7

_ByteBits_  _CAN_PGN_Tout5;
#define     CAN_PGN_Tout5     _CAN_PGN_Tout5.Byte
#define     Tout_EEC1_82      _CAN_PGN_Tout5.Bits.b0
#define     Tout_EEC2_EM      _CAN_PGN_Tout5.Bits.b1


//----------- наследие от DZ ------------------------
_ByteBits_  _System_F;
#define     System_F          _System_F.Byte	//BufLampOsc[1]
#define     SPI_Synch         _System_F.Bits.b0
#define     SCI2_Synch        _System_F.Bits.b2
#define     ABS_Fail          _System_F.Bits.b3
#define     ASR_SW_Condition  _System_F.Bits.b4 // не менять в Diag

_ByteBits_  _System_F_MC2;
#define     System_F_MC2     _System_F_MC2.Byte

_ByteBits_  _System_F1;
#define     System_F1         _System_F1.Byte    // BufLampOsc[3]
#define     DIA_SW_Condition  _System_F1.Bits.b2 // не менять в Diag
#define     Stop_SW_Condition _System_F1.Bits.b3
#define     ABS_SW_Condition  _System_F1.Bits.b4 // не менять в Diag
#define     ABS_SW_EBC1       _System_F1.Bits.b5
#define     Lim_Speed_Active  _System_F1.Bits.b6

_ByteBits_  _System_F2_MC2;
#define     System_F2_MC2     _System_F2_MC2.Byte

_ByteBits_  _System_F2;
#define     System_F2         _System_F2.Byte	 //BufLampOsc[4]
#define     GndF_On           _System_F2.Bits.b0
#define     GndR_On           _System_F2.Bits.b1
#define     GndT_On           _System_F2.Bits.b2
#define     LampABS_ON        _System_F2.Bits.b3 // не менять в Diag
#define     LampASR_ON        _System_F2.Bits.b4 // не менять в Diag
#define     DIA_LampABS_ON    _System_F2.Bits.b5
#define     DIA_LampASR_ON    _System_F2.Bits.b6
#define     DIA_Lamps_Fl      _System_F2.Bits.b7
#define   __SysF2_MC2_Mask  0x12	//00010010

_ByteBits_  _System_F4;
#define     System_F4         _System_F4.Byte	 //BufLampOsc[5]
#define     Kline_Condition   _System_F4.Bits.b1
#define     TSET_SW_Condition _System_F4.Bits.b3 // не менять в Diag
#define     LSSw_Test_Enable  _System_F4.Bits.b4
#define     LSSw_Test_Active  _System_F4.Bits.b5
#define     LSSw_Handling     _System_F4.Bits.b6 // обработка LAMP
#define     SW_Handling       _System_F4.Bits.b7 // обработка Button

_ByteBits_  _System_F5;
#define     System_F5         _System_F5.Byte	 //BufLampOsc[8]
#define     VDC_FullOp        _System_F5.Bits.b0
#define     BlockON_Complete  _System_F5.Bits.b1
#define     BlockON_RD_EPROM  _System_F5.Bits.b2
#define     VDC_LampOn        _System_F5.Bits.b3 // не менять в Diag
#define     ISO_Reset         _System_F5.Bits.b4
#define     BlinkCode_Active  _System_F5.Bits.b5
#define     Block_Is_Off      _System_F5.Bits.b6

_ByteBits_  _Last_Error;
#define     WSS_Last_Error   _Last_Error.Byte

_ByteBits_  _Front_Flags;
#define     Front_Flags      _Front_Flags.Byte
#define     VDC_Lamp_MC1     _Front_Flags.Bits.b0
#define     DSC_Front_Break  _Front_Flags.Bits.b1
#define     DSC_Disable      _Front_Flags.Bits.b2
#define     DYC_Front_Break  _Front_Flags.Bits.b3
#define     ROP_Front_Break  _Front_Flags.Bits.b4
#define     NU_RunaWay_Fl    _Front_Flags.Bits.b5
#define     DSC_Emul_Fl      _Front_Flags.Bits.b6
#define    ABS_Front_Active  _Front_Flags.Bits.b7

_ByteBits_  _Front_Flags2;
#define     Front_Flags2     _Front_Flags2.Byte
#define     Rele_STM1_ON     _Front_Flags2.Bits.b0
#define     AGS_Upit_ON      _Front_Flags2.Bits.b1
#define     Front_Dif_Press  _Front_Flags2.Bits.b2
#define     TruckSim_Active  _Front_Flags2.Bits.b3
#define     KoefFront_Cplt   _Front_Flags2.Bits.b4

_ByteBits_  _Rear_Flags;
#define     Rear_Flags       _Rear_Flags.Byte
#define     VDC_Lamp_MC2     _Rear_Flags.Bits.b0
#define     DSC_Rear_Break   _Rear_Flags.Bits.b1
#define     Trailer_Break    _Rear_Flags.Bits.b2
#define     DYC_Rear_Break   _Rear_Flags.Bits.b3
#define     ROP_Rear_Break   _Rear_Flags.Bits.b4
#define     ASR_Brake_Active _Rear_Flags.Bits.b5
#define     ASR_EngineActive _Rear_Flags.Bits.b6
#define    ABS_Rear_Active   _Rear_Flags.Bits.b7

_ByteBits_  _Rear_Flags2;
#define     Rear_Flags2      _Rear_Flags2.Byte
#define     Rele_STM2_ON     _Rear_Flags2.Bits.b0
// TSET_Switch это TSET_HHR_Switch в DZ одинаково TSET_SW_Condition
#define     TSET_Switch      _Rear_Flags2.Bits.b1
#define     Rear_Dif_Press   _Rear_Flags2.Bits.b2
// перенесено из Retarder_Flags т.к. реле у STM1
#define     DBR_Request      _Rear_Flags2.Bits.b3
#define     KoefRear_Cplt   _Front_Flags2.Bits.b4

_ByteBits_  _DSC_Flags_MC2;
#define     DSC_Flags_MC2    _DSC_Flags_MC2.Byte

_ByteBits_  _DSC_Flags;
#define     DSC_Flags        _DSC_Flags.Byte
#define     RetarderActive   _DSC_Flags.Bits.b0
#define     DYC_Active       _DSC_Flags.Bits.b1
#define     ROP_Active       _DSC_Flags.Bits.b2
#define     DYC_BrakeActive  _DSC_Flags.Bits.b3
#define     ROP_BrakeActive  _DSC_Flags.Bits.b4
#define     DYC_EngineActive _DSC_Flags.Bits.b5
#define     ROP_EngineActive _DSC_Flags.Bits.b6
#define     ABS_Active	     _DSC_Flags.Bits.b7

_ByteBits_  _DSC_Flags1_MC2;
#define     DSC_Flags1_MC2   _DSC_Flags1_MC2.Byte
_ByteBits_  _DSC_Flags1;
#define     DSC_Flags1       _DSC_Flags1.Byte
#define     ROP_Enable       _DSC_Flags1.Bits.b0
#define     DYC_Enable       _DSC_Flags1.Bits.b1
#define     KoefSpeed_Enable _DSC_Flags1.Bits.b2 //
#define     TireFront_Cplt   _DSC_Flags1.Bits.b3 //
#define     TireRear_Cplt    _DSC_Flags1.Bits.b4 //
#define     TransmissionON   _DSC_Flags1.Bits.b5 // не менять
#define     ReverseON        _DSC_Flags1.Bits.b6 // позицию
#define     ReverseON_Cplt   _DSC_Flags1.Bits.b7

_ByteBits_  _DSC_Flags2;
#define     DSC_Flags2       _DSC_Flags2.Byte
#define     TestMod_Disable  _DSC_Flags2.Bits.b0
//#define     Rele_Sila_ON     _DSC_Flags2.Bits.b1
#define     AGS_NotReady     _DSC_Flags2.Bits.b2
#define     All_Speed_Zero   _DSC_Flags2.Bits.b3
#define     TestMod_Enable   _DSC_Flags2.Bits.b4
#define     TestSVDC_Disable _DSC_Flags2.Bits.b5 // общий запрет тестов для подключенных к SPL
#define     Forward_Move     _DSC_Flags2.Bits.b6
#define     Parking_ON       _DSC_Flags2.Bits.b7

_ByteBits_  _DSC_Flags3;
#define     DSC_Flags3       _DSC_Flags3.Byte
#define     SAS_Calibr_Cmpl  _DSC_Flags3.Bits.b0 // не менять
#define     AGS_Calibr_Cmpl  _DSC_Flags3.Bits.b1 // калибровка выполнена
#define     Model_Instal     _DSC_Flags3.Bits.b2
#define     VDC_Instal_Cmpl  _DSC_Flags3.Bits.b3
#define     SAS_Ok           _DSC_Flags3.Bits.b4
#define     AGS_Ok           _DSC_Flags3.Bits.b5
#define     DSC_Break_Abort  _DSC_Flags3.Bits.b6
#define     Fatal_Failure    _DSC_Flags3.Bits.b7

_ByteBits_  _DSC_Flags4_MC2;
#define     DSC_Flags4_MC2   _DSC_Flags4_MC2.Byte
_ByteBits_  _DSC_Flags4;
#define     DSC_Flags4       _DSC_Flags4.Byte
#define     Truck_VDC_Active _DSC_Flags4.Bits.b0 // флаг  Truck_VDC активно
												 // не менять управляет лампой VDC
#define     Control_Active   _DSC_Flags4.Bits.b1 // флаг  Control_Active любое регулирование активно
#define     EBL_Active       _DSC_Flags4.Bits.b2
#define    XBR_System_Active _DSC_Flags4.Bits.b3
#define    HillHolder_Active _DSC_Flags4.Bits.b4
#define     HaltBrake_Active _DSC_Flags4.Bits.b5
#define     Emergency_Brake  _DSC_Flags4.Bits.b6
#define   Brake_Asist_Active _DSC_Flags4.Bits.b7

_ByteBits_  _DSC_Flags5;
#define     DSC_Flags5       _DSC_Flags5.Byte
#define     HillHolder_Lamp  _DSC_Flags5.Bits.b0 // флаг включения HillHolder_Lamp
												 // не менять
#define     Brake_Only_Front _DSC_Flags5.Bits.b1
#define     Brake_Only_Rear  _DSC_Flags5.Bits.b2
#define     Brake_Rear_Drag  _DSC_Flags5.Bits.b3

#define     HaltBrake_Switch _DSC_Flags5.Bits.b5
#define     XBR_KL_Active    _DSC_Flags5.Bits.b6

_ByteBits_  _DSC_Flags6;
#define     DSC_Flags6       _DSC_Flags6.Byte
#define     AGS_Not_CAN_Ask  _DSC_Flags6.Bits.b0
#define     ECAS_Calibr_Req  _DSC_Flags6.Bits.b1
#define     ECAS_PS_Find     _DSC_Flags6.Bits.b2
#define     Block_ErrInst    _DSC_Flags6.Bits.b3
#define     Reset_SefTuning  _DSC_Flags6.Bits.b4
#define     Engine_Started   _DSC_Flags6.Bits.b5
#define     BridgeCAN_Cmpl   _DSC_Flags6.Bits.b6
#define     Gear_Reverse     _DSC_Flags6.Bits.b7

_ByteBits_  _Diag_Flags;
#define     Diag_Flags       _Diag_Flags.Byte
#define     Dia_DifRear      _Diag_Flags.Bits.b0
#define     Dia_DifFront     _Diag_Flags.Bits.b1
#define     Dia_DifTrailer   _Diag_Flags.Bits.b2
#define     Dia_Puls_FL      _Diag_Flags.Bits.b3
#define     Dia_Puls_FR      _Diag_Flags.Bits.b4
#define     Dia_Puls_RL      _Diag_Flags.Bits.b5
#define     Dia_Puls_RR      _Diag_Flags.Bits.b6
#define     Dia_HBR          _Diag_Flags.Bits.b7

_ByteBits_  _Diag_Flags2;
#define     Diag_Flags2      _Diag_Flags2.Byte
#define     Dia_Stop_Light   _Diag_Flags2.Bits.b0
#define     Dia_HillHold     _Diag_Flags2.Bits.b1
#define     Dia_Emergency    _Diag_Flags2.Bits.b2
#define     Dia_HaltBrake    _Diag_Flags2.Bits.b3
#define     Dia_TorqueLim    _Diag_Flags2.Bits.b4
#define     Dia_TorqueDrag   _Diag_Flags2.Bits.b5
#define     Dia_Retarder_On  _Diag_Flags2.Bits.b6
#define     Dia_Retarder_Off _Diag_Flags2.Bits.b7

_ByteBits_  _Diag_Flags3;
#define     Diag_Flags3      _Diag_Flags3.Byte
#define     Dia_DifAxis3     _Diag_Flags3.Bits.b0
#define     Dia_Puls_3L      _Diag_Flags3.Bits.b1
#define     Dia_Puls_3R      _Diag_Flags3.Bits.b2
#define     Dia_RunaWay      _Diag_Flags3.Bits.b3
#define     Dia_Prop_Kl      _Diag_Flags3.Bits.b4
#define     DIA_VDC_Lamp     _Diag_Flags3.Bits.b5
#define     Dia_Emul_Fl      _Diag_Flags3.Bits.b6

_ByteBits_  _Steering_Flags;
#define     Steering_Flags    _Steering_Flags.Byte
#define     SteerSharpRotate  _Steering_Flags.Bits.b0 //
#define     SAS_Not_Fail	  _Steering_Flags.Bits.b1 //
#define     Range_Detection   _Steering_Flags.Bits.b2 //
#define     Steer_Reliable    _Steering_Flags.Bits.b3 //
#define     Steer_Pos_Ok      _Steering_Flags.Bits.b4 //
#define     Steer_Neg_Ok      _Steering_Flags.Bits.b5 //
#define     Range_Fail        _Steering_Flags.Bits.b6 //
#define     SASzero_Request3  _Steering_Flags.Bits.b7 //

#define     __Clr_Steer_Flags 0x3F

_ByteBits_  _CalibSens_DSC;
#define     CalibSens_DSC     _CalibSens_DSC.Byte
#define     AGSzero_Request   _CalibSens_DSC.Bits.b0 //
#define     AGSzero_InProcess _CalibSens_DSC.Bits.b1 //
#define     SASzero_Request   _CalibSens_DSC.Bits.b2 //
#define     SASzero_Request2  _CalibSens_DSC.Bits.b3 //
#define     SASzero_InProcess _CalibSens_DSC.Bits.b4 //
#define     SAS_Angle_Cmpl    _CalibSens_DSC.Bits.b5 //
#define     PS_Adr_Request    _CalibSens_DSC.Bits.b6 //
#define     PS_Adr_InProcess  _CalibSens_DSC.Bits.b7 //

_ByteBits_  _Validity_Flags;
#define     Validity_Flags     _Validity_Flags.Byte
// OffSet
#define     Bad_Wz_Est         _Validity_Flags.Bits.b0 //AGS sensor
#define     Bad_Wz_Des         _Validity_Flags.Bits.b1 //Akerman MODEL1
#define     Bad_Wz_AccY        _Validity_Flags.Bits.b2 //AccY    MODEL2
#define     Bad_Wz_dVf         _Validity_Flags.Bits.b3 //AccYdVf MODEL3
#define     Bad_AccX           _Validity_Flags.Bits.b4
#define     Bad_AccY           _Validity_Flags.Bits.b5
#define     BrakePress_Fail    _Validity_Flags.Bits.b6

_ByteBits_  _Validity_Flags2;
#define     Validity_Flags2   _Validity_Flags2.Byte
#define     BadVX             _Validity_Flags2.Bits.b0
#define     BadWeight         _Validity_Flags2.Bits.b1
#define     BadKsas           _Validity_Flags2.Bits.b2
#define     BadRollAngle      _Validity_Flags2.Bits.b3
#define     BadPitchAngle     _Validity_Flags2.Bits.b4
#define     BadVY             _Validity_Flags2.Bits.b5
#define     BadKTCO           _Validity_Flags2.Bits.b6
#define     WzRef_Ok          _Validity_Flags2.Bits.b7  // флаг достоверной OmegaZ_Ref

_ByteBits_  _TorqueMode_MC2; //
#define    TorqueMode_MC2       _TorqueMode_MC2.Byte
#define    Torque_Lim_MC2       _TorqueMode_MC2.Bits.b0
#define    Torque_Drag_MC2      _TorqueMode_MC2.Bits.b1

_ByteBits_  _TorqueMode; //
#define    TorqueMode           _TorqueMode.Byte
#define    Torque_Lim           _TorqueMode.Bits.b0
#define    Torque_Drag          _TorqueMode.Bits.b1
#define    Retarder_Brake       _TorqueMode.Bits.b2
#define    Retarder_Off         _TorqueMode.Bits.b3
#define    EngineLim_Request    _TorqueMode.Bits.b4
#define    EngineDrag_Request   _TorqueMode.Bits.b5

#define  EngineTrailer_Request  _TorqueMode.Bits.b7

_ByteBits_  _TrailerStatus; //
#define    TrailerStatus        _TrailerStatus.Byte
#define    Trailer_StopLampReq  _TrailerStatus.Bits.b0
#define    Trailer_StatusOk     _TrailerStatus.Bits.b1
#define  Trailer_SupplyBrakeReq _TrailerStatus.Bits.b2
#define    Trailer_Brake_Active _TrailerStatus.Bits.b3
#define    Trailer_RedWarn      _TrailerStatus.Bits.b4
#define    Trailer_ABS_Active   _TrailerStatus.Bits.b5
#define    Trailer_VDC_Active   _TrailerStatus.Bits.b6
#define    Stop_Request         _TrailerStatus.Bits.b7 //StopReq передается в VDC1
// флаги может поставить любой прицеп

_ByteBits_  _TrailerFind; //
#define    TrailerFind        _TrailerFind.Byte
#define    FindTrailer1       _TrailerFind.Bits.b0
#define    FindTrailer2       _TrailerFind.Bits.b1
#define    FindTrailer3       _TrailerFind.Bits.b2
#define    FindTrailer4       _TrailerFind.Bits.b3
#define    FindTrailer5       _TrailerFind.Bits.b4

_ByteBits_  _ABS_Failures_MC2;
#define    ABS_Failures_MC2   _ABS_Failures_MC2.Byte
_ByteBits_  _ABS_Failures;
#define    ABS_Failures       _ABS_Failures.Byte
#define    ABS_FL_Failed      _ABS_Failures.Bits.b0
#define    ABS_FR_Failed      _ABS_Failures.Bits.b1
#define    ABS_RL_Failed      _ABS_Failures.Bits.b2
#define    ABS_RR_Failed      _ABS_Failures.Bits.b3
#define    ABS_W4_Failed      _ABS_Failures.Bits.b4
#define    ABS_W5_Failed      _ABS_Failures.Bits.b5
#define    All_ABS_Failed  0x3F

_ByteBits_  _REG_Failures_MC2;
#define    REG_Failures_MC2   _REG_Failures_MC2.Byte
_ByteBits_  _REG_Failures;
#define    REG_Failures       _REG_Failures.Byte
#define    DTC_Failed         _REG_Failures.Bits.b0
#define    DBR_Failed         _REG_Failures.Bits.b1
#define    LIM_Failed         _REG_Failures.Bits.b2
#define    EBL_Failed         _REG_Failures.Bits.b3

#define    ASR_Brake_Failed   _REG_Failures.Bits.b5
#define    ASR_Engine_Failed  _REG_Failures.Bits.b6

_ByteBits_  _Upit_Flags;
#define    Upit_Flags         _Upit_Flags.Byte
#define    POR_Reset          _Upit_Flags.Bits.b0
#define    K15_is_off         _Upit_Flags.Bits.b1
#define    K15_is_Ok          _Upit_Flags.Bits.b2
#define    Sila_Off           _Upit_Flags.Bits.b3
#define    Skip_Clr_UKxLow    _Upit_Flags.Bits.b4
#define    COP_Reset          _Upit_Flags.Bits.b5
#define    LVW_Event          _Upit_Flags.Bits.b6
#define    Ubat_Hi_36V        _Upit_Flags.Bits.b7

_ByteBits_  _Pcb_Test1;
#define    Pcb_Test_1         _Pcb_Test1.Byte

_ByteBits_  _Pcb_Test2;
#define    Pcb_Test_2         _Pcb_Test2.Byte

_ByteBits_ _Pcb_Test3_MC2;
#define    Pcb_Test_3_MC2     _Pcb_Test3_MC2.Byte
_ByteBits_  _Pcb_Test3;
#define    Pcb_Test_3         _Pcb_Test3.Byte

_ByteBits_  _Pcb_Test4;
#define    Pcb_Test_4         _Pcb_Test4.Byte

_ByteBits_  _Pcb_Test5;
#define    Pcb_Test_5         _Pcb_Test5.Byte

_ByteBits_  _Pcb_Test6;
#define    Pcb_Test_6         _Pcb_Test6.Byte

_ByteBits_  _Pcb_Test7;
#define    Pcb_Test_7         _Pcb_Test7.Byte

_ByteBits_  _Pcb_Test8_MC2;
#define    Pcb_Test_8_MC2     _Pcb_Test8_MC2.Byte

_ByteBits_  _Pcb_Test8;
#define    Pcb_Test_8         _Pcb_Test8.Byte
#define    Pcb_Test_KL15_Ok   _Pcb_Test8.Bits.b0
#define    Pcb_Test_PWR_Ok    _Pcb_Test8.Bits.b1
#define    Pcb_Test_SPL_Ok    _Pcb_Test8.Bits.b2
#define    Pcb_Test_CANT_Ok   _Pcb_Test8.Bits.b3
#define    Pcb_Test_CANS_Ok   _Pcb_Test8.Bits.b4
#define    Pcb_Test_MC3_Ok    _Pcb_Test8.Bits.b5
#define    Pcb_Test_BrPS_Ok   _Pcb_Test8.Bits.b6
#define    Pcb_Test_TrPS_Ok   _Pcb_Test8.Bits.b7

_ByteBits_  _Pcb_Test9;
#define    Pcb_Test_9         _Pcb_Test9.Byte
//---------KL_Status-----------------------------
// выходное состояние клапанов передаваемое в PA
_ByteBits_ _KL_Status_1;
#define     KL_Status_1  _KL_Status_1.Byte
#define     AV_FL        _KL_Status_1.Bits.b0
#define     EV_FL        _KL_Status_1.Bits.b1
#define     AV_FR        _KL_Status_1.Bits.b2
#define     EV_FR        _KL_Status_1.Bits.b3
#define     AV_RL        _KL_Status_1.Bits.b4
#define     EV_RL        _KL_Status_1.Bits.b5
#define     AV_RR        _KL_Status_1.Bits.b6
#define     EV_RR        _KL_Status_1.Bits.b7

_ByteBits_ _KL_Status_2;
#define     KL_Status_2  _KL_Status_2.Byte
#define     AV_3L        _KL_Status_2.Bits.b0
#define     EV_3L        _KL_Status_2.Bits.b1
#define     AV_3R        _KL_Status_2.Bits.b2
#define     EV_3R        _KL_Status_2.Bits.b3
#define     Dif_R        _KL_Status_2.Bits.b4
#define     Dif_F        _KL_Status_2.Bits.b5
#define     EV_MT        _KL_Status_2.Bits.b6
#define     AV_MT        _KL_Status_2.Bits.b7
#define     Dif_T        AV_MT
#define     Prop_KL      EV_MT

//-------------------Error-------------------
_ByteBits_  _s_MC3_Error;
#define    s_MC3_Error   _s_MC3_Error.Byte
#define   ValidWz_Fail   _s_MC3_Error.Bits.b0
#define   ValidAccX_Fail _s_MC3_Error.Bits.b1
#define   ValidAccY_Fail _s_MC3_Error.Bits.b2

_ByteBits_ _MC_Error;
#define     MC_Error       _MC_Error.Byte
#define   SPI_Fail         _MC_Error.Bits.b0
#define   PgmCRC_Fail      _MC_Error.Bits.b1  //*
#define   CfgCRC_Fail      _MC_Error.Bits.b2  //*
#define   EPROM_CSsum_Fail _MC_Error.Bits.b3
#define     SCI2_Tout      _MC_Error.Bits.b4  //*
#define     SCI2_Bad       _MC_Error.Bits.b5  //*
#define   MainLoop_Fail    _MC_Error.Bits.b6
#define Model_Install_Fail _MC_Error.Bits.b7  //*
#define     __XBR_Fail_Mask             0xB6  //*
#define     __MC_Fatal_Error 0x06

_ByteBits_  _s_MC1_Error;
#define      s_MC1_Error   _s_MC1_Error.Byte

_ByteBits_  _s_MC2_Error;
#define      s_MC2_Error     _s_MC2_Error.Byte

_ByteBits_  _s_SAS_Error;
#define    s_SAS_Error   _s_SAS_Error.Byte
#define   CAN_SAS_Fail   _s_SAS_Error.Bits.b0
#define   SASdata_Fail   _s_SAS_Error.Bits.b1
#define   SASmech_Fail   _s_SAS_Error.Bits.b2
#define   SASzero_Fail   _s_SAS_Error.Bits.b3
#define   SASdrift_Fail  _s_SAS_Error.Bits.b4
#define   VDC_ROP_Fail   _s_SAS_Error.Bits.b5
#define   VDC_DYC_Fail   _s_SAS_Error.Bits.b6
#define   SAS_Install_Fail _s_SAS_Error.Bits.b7
#define   __Mask_SAS_Error   1

_ByteBits_  _s_AGS_Error;
#define    s_AGS_Error   _s_AGS_Error.Byte
#define   CAN_AGS_Fail   _s_AGS_Error.Bits.b0
#define   AGS_Zero_Fail  _s_AGS_Error.Bits.b1  //
#define   AGS_CFG_Fail   _s_AGS_Error.Bits.b2
#define   AGS_Data_Fail  _s_AGS_Error.Bits.b3
#define   AGS_CRC_Fail   _s_AGS_Error.Bits.b4
#define   AGS_Mount_Fail _s_AGS_Error.Bits.b5  //
#define   AGS_ST_Fail    _s_AGS_Error.Bits.b6
#define   AGS_Install_Fail _s_AGS_Error.Bits.b7
#define   __Mask_AGS_Error  1

_ByteBits_  _s_PrS_Error;
#define    s_PrS_Error   _s_PrS_Error.Byte
#define    CAN_BPS_Fail      _s_PrS_Error.Bits.b0 // CAN_BPS
#define    CAN_ECAS_PS_Fail  _s_PrS_Error.Bits.b1 // CAN ECAS
#define    Brake_PS_OffFail  _s_PrS_Error.Bits.b2 // Неисправен датчик тормозной педали
#define    Brake_PS_OnFail   _s_PrS_Error.Bits.b3 // Нет сигнала датчика тормозной педали
#define    Brake_PS_NC       _s_PrS_Error.Bits.b4 // Обрыв датчика тормозной педали
#define    Stop_Switch_Fail  _s_PrS_Error.Bits.b5 // Лягушка неисправна
#define    Trailer_BPS_Fail  _s_PrS_Error.Bits.b6 // Нет достоверности сигнала датчика прицепа
#define    Trailer_BPS_NC    _s_PrS_Error.Bits.b7 // Обрыв датчика прицепа
#define   __Mask_PrS_Error  0x11  //без Trailer

#define   __Mask_ErrPrS_WL  0x11
// маски Неисправности датчик тормозной педали
#define    __Mask_Err_Trailer_BPS  0x9D // маска проверка достоверности датчика давления прицепа
										// все Brake_PS и Обрыв датчика прицепа
#define    __Mask_Err_BPS_ABS      0x19 // маска BPS без OffFail
#define    __Mask_Err_BPS_HHR      0x0D //

_ByteBits_  _s_CANT_Error;
#define    s_CANT_Error      _s_CANT_Error.Byte
#define    CANT_Fail         _s_CANT_Error.Bits.b0

_ByteBits_  _s_Other_Error;
#define    s_Other_Error      _s_Other_Error.Byte
/*#define    WLamp_NC_NC        _s_Other_Error.Bits.b0
#define    WLamp_NC_SB        _s_Other_Error.Bits.b1
#define    ASRLamp_NC_NC      _s_Other_Error.Bits.b2
#define    ASRLamp_NC_SB      _s_Other_Error.Bits.b3
#define    StopSign_NC        _s_Other_Error.Bits.b4
#define    Trailer_PS_OnFail  _s_Other_Error.Bits.b5
#define    StopLight_NC       _s_Other_Error.Bits.b6
#define    Invense_Tout       _s_Other_Error.Bits.b7*/
/* Diag ini
0=Лампа ABS oбрыв
1=Лампа ABS замыкание на землю
2=Лампа ABS замыкание на плюс 24V
3=Лампа ASR oбрыв
4=Лампа ASR замыкание на землю
5=Лампа ASR замыкание на плюс 24V
6=Недостоверный CAN сигнал торможения
7=Недостоверен сигнал переключателя Stop
*/
#define    WLamp_NC           _s_Other_Error.Bits.b0
#define    WLamp_SC           _s_Other_Error.Bits.b1
#define    WLamp_SB           _s_Other_Error.Bits.b2
#define    ASRLamp_NC         _s_Other_Error.Bits.b3
#define    ASRLamp_SC         _s_Other_Error.Bits.b4
#define    ASRLamp_SB         _s_Other_Error.Bits.b5
#define    StopSign_NC        _s_Other_Error.Bits.b6
#define    StopLight_NC       _s_Other_Error.Bits.b7

_ByteBits_  _s_B7_Error;
#define    s_B7_TCO_Error    _s_B7_Error.Byte
#define    NC_B7             _s_B7_Error.Bits.b0
#define    B7_Imp_Fail       _s_B7_Error.Bits.b1
#define    B7_Freq_Fail      _s_B7_Error.Bits.b2
#define    TCO_Speed_Fail    _s_B7_Error.Bits.b3
#define    TCO_CAN_Fail      _s_B7_Error.Bits.b4

_ByteBits_  _Power_Error;
#define    Power_Error   _Power_Error.Byte
//#define    SPL_Fail      _Power_Error.Bits.b0  //питание сенсоров
//#define    SPL_SC        _Power_Error.Bits.b1
#define    K30_Fuse_Cut  _Power_Error.Bits.b2
#define    Ubat_Low      _Power_Error.Bits.b3
#define    Ubat_High     _Power_Error.Bits.b4
#define    VDD_Fail      _Power_Error.Bits.b5
#define    Ubat_Over     _Power_Error.Bits.b6
#define    AGS_Upit_Fail _Power_Error.Bits.b7
//#define    __Mask_Ubat    0xF8 //0x07

_ByteBits_  _s_Prop_Error;
#define    s_Prop_Error       _s_Prop_Error.Byte
#define    PropKL_NC		  _s_Prop_Error.Bits.b0  //
#define    PropKL_SC		  _s_Prop_Error.Bits.b1  //
#define    PropKL_SB		  _s_Prop_Error.Bits.b2  //

_ByteBits_  _s_CANJ_Error;
#define    s_CANJ_Error       _s_CANJ_Error.Byte
#define    CANJ_Bus_OFF_Err   _s_CANJ_Error.Bits.b0
#define    CANJ_Addres_Fail   _s_CANJ_Error.Bits.b1
#define    CANJ_ToutEEC1_Err  _s_CANJ_Error.Bits.b2
#define    CANJ_Trafic_Err    _s_CANJ_Error.Bits.b3
#define    CANJ_ToutEM_Err    _s_CANJ_Error.Bits.b4

_ByteBits_  _s_DBR_Error;
#define    s_DBR_Error   _s_DBR_Error.Byte
#define    DBR_NC	     _s_DBR_Error.Bits.b0  //
#define    DBR_SC	     _s_DBR_Error.Bits.b1  //
#define    DBR_SB	     _s_DBR_Error.Bits.b2  //

_ByteBits_  _s_GND_Error;
#define    s_GND_Error   _s_GND_Error.Byte
#define    GndF_NC       _s_GND_Error.Bits.b0
#define    GndF_SC       _s_GND_Error.Bits.b1
#define    GndF_SB       _s_GND_Error.Bits.b2
#define    GndR_NC       _s_GND_Error.Bits.b3
#define    GndR_SC       _s_GND_Error.Bits.b4
#define    GndR_SB       _s_GND_Error.Bits.b5
#define    GndT_SC       _s_GND_Error.Bits.b6
#define    GndT_SB       _s_GND_Error.Bits.b7

_ByteBits_  _s_Diff_Error;
#define     s_Diff_Error        _s_Diff_Error.Byte
#define     NC_DifR			    _s_Diff_Error.Bits.b0  //
#define     SC_DifR             _s_Diff_Error.Bits.b1  //
#define     SB_DifR             _s_Diff_Error.Bits.b2  //
#define     Tout_DifR           _s_Diff_Error.Bits.b3  //
#define     NC_DifF			    _s_Diff_Error.Bits.b4  //
#define     SC_DifF             _s_Diff_Error.Bits.b5  //
#define     SB_DifF             _s_Diff_Error.Bits.b6  //
#define     Tout_DifF           _s_Diff_Error.Bits.b7  //

#define     Mask_Error_DifF     0xF0
#define     Mask_Error_DifR     0x0F

_ByteBits_  _s_ModT_Error;
#define     s_ModT_Error        _s_ModT_Error.Byte
#define     NC_DifT			    _s_ModT_Error.Bits.b0  //
#define     SC_DifT             _s_ModT_Error.Bits.b1  //
#define     SB_DifT             _s_ModT_Error.Bits.b2  //
#define     Tout_DifT           _s_ModT_Error.Bits.b3  //
#define     NC_Dif3A		    _s_ModT_Error.Bits.b4  //
#define     SC_Dif3A            _s_ModT_Error.Bits.b5  //
#define     SB_Dif3A            _s_ModT_Error.Bits.b6  //
#define     Tout_Dif3A          _s_ModT_Error.Bits.b7  //

#define     Mask_Error_DifT     0xF0
#define     Mask_Error_Dif3A    0x0F

/* ------------Exported define _ByteBits_ -----------------------------------*/

/* ------------------Private Macros -----------------------------------------*/
#define _EBL_Exh(M) {\
		EBL_EV_##M = 1; \
		EBL_AV_##M = 1; \
} //end macroc
#define _EBL_Pump(M) {\
		EBL_EV_##M = 0; \
		EBL_AV_##M = 0; \
} //end macroc
#define _EBL_Cut(M) {\
		EBL_EV_##M = 1; \
		EBL_AV_##M = 0; \
} //end macroc

#define _DSC_Exh(M) {\
		DSC_EV_##M = 1; \
		DSC_AV_##M = 1; \
} //end macroc
#define _DSC_Pump(M) {\
		DSC_EV_##M = 0; \
		DSC_AV_##M = 0; \
} //end macroc
#define _DSC_Cut(M) {\
		DSC_EV_##M = 1; \
		DSC_AV_##M = 0; \
} //end macroc

#define _MDT_Exh(M) {\
		MDT_EV_##M = 1; \
		MDT_AV_##M = 1; \
} //end macroc
#define _MDT_Pump(M) {\
		MDT_EV_##M = 0; \
		MDT_AV_##M = 0; \
} //end macroc
#define _MDT_Cut(M) {\
		MDT_EV_##M = 1; \
		MDT_AV_##M = 0; \
} //end macroc

#define _ABS_Exh(M) {\
		ABS_EV_##M = 1; \
		ABS_AV_##M = 1; \
} //end macroc
#define _ABS_Pump(M) {\
		ABS_EV_##M = 0; \
		ABS_AV_##M = 0; \
} //end macroc
#define _ABS_Cut(M) {\
		ABS_EV_##M = 1; \
		ABS_AV_##M = 0; \
} //end macroc

#define _ASR_Exh(M) {\
		ASR_EV_##M = 1; \
		ASR_AV_##M = 1; \
} //end macroc
#define _ASR_Pump(M) {\
		ASR_EV_##M = 0; \
		ASR_AV_##M = 0; \
} //end macroc
#define _ASR_Cut(M) {\
		ASR_EV_##M = 1; \
		ASR_AV_##M = 0; \
} //end macroc

#define _OssV(V)    (V>>6 & 0xFF)  // скорость
#define _OssW(W)    (W>>5 & 0xFF)  // Omega
#define _OssA(A)    ((A+(A>>2))>>8 & 0xFF)  // Accel
// Угол  размерность 1 lsb  - 0,1 град
#define _OssU(U)    (U>>4 & 0xFF)  // Угол

#define _Swap_16(reg) (((uint16_t)*(uint8_t*)(&reg)<<8) + \
		                (uint16_t)*((uint8_t*)(&reg)+1))
/* int16_t register access macros   */
#define _Hi_16(reg)    ((reg & 0xFF00) >> 8)
#define _Lo_16(reg)    (reg & 0x00FF)
/* int32_t register byte access macros   */
#define _B0_32(reg)    (reg & 0xFF)
#define _B1_32(reg)    (reg>>8 & 0xFF)
#define _B2_32(reg)    (reg>>16 & 0xFF)
#define _B3_32(reg)    (reg>>24 & 0xFF)

#define _Hi_32(reg)    ((reg & 0xFFFF0000) >> 16)
#define _Lo_32(reg)    (reg & 0x0000FFFF)

#define _B0_64(reg)    (reg & 0xFF)
#define _B1_64(reg)    (reg>>8 & 0xFF)
#define _B2_64(reg)    (reg>>16 & 0xFF)
#define _B3_64(reg)    (reg>>24 & 0xFF)
#define _B4_64(reg)    (reg>>32 & 0xFF)
#define _B5_64(reg)    (reg>>40 & 0xFF)
#define _B6_64(reg)    (reg>>48 & 0xFF)
#define _B7_64(reg)    (reg>>56 & 0xFF)

#define _Hi_64(reg)    ((reg & 0xFFFFFFFF00000000) >> 32)
#define _Lo_64(reg)    (reg & 0x00000000FFFFFFFF)

/* make int32_t ExtID SAE J1939  macros   */
#define _ExtID_make(pri,pgn,adr) ( \
						(((uint32_t)pri<<26) & 0xFF000000) | \
						(((uint32_t)pgn<<8) & 0x00FFFF00) | \
						(((uint32_t)adr) & 0x000000FF) \
								 )
#define _PGN_make(ID) ( \
		(((uint32_t)ID>>8) & 0x0000FFFF) \
		)
#define _ClrMask(reg,mask) (reg &=mask)

#ifdef __CAN_Trailer
#define _CANTH_Disable HAL_GPIO_WritePin(CANTH_EN_GPIO_Port, CANTH_EN_Pin, GPIO_PIN_RESET)
#define _CANTH_Enable  HAL_GPIO_WritePin(CANTH_EN_GPIO_Port, CANTH_EN_Pin, GPIO_PIN_SET)
#define _CANTL_Disable HAL_GPIO_WritePin(CANTL_EN_GPIO_Port, CANTL_EN_Pin, GPIO_PIN_RESET)
#define _CANTL_Enable  HAL_GPIO_WritePin(CANTL_EN_GPIO_Port, CANTL_EN_Pin, GPIO_PIN_SET)
#endif

#define _SENS_Upit_Off HAL_GPIO_WritePin(EN_SPL_GPIO_Port, EN_SPL_Pin, GPIO_PIN_SET)
#define _SENS_Upit_On  HAL_GPIO_WritePin(EN_SPL_GPIO_Port, EN_SPL_Pin, GPIO_PIN_RESET)

#define _AT_AUX1_On  HAL_GPIO_WritePin(AT_AUX1_GPIO_Port, AT_AUX1_Pin, GPIO_PIN_RESET)
#define _AT_AUX1_Off HAL_GPIO_WritePin(AT_AUX1_GPIO_Port, AT_AUX1_Pin, GPIO_PIN_SET)
#define _AT_AUX2_On  HAL_GPIO_WritePin(AT_AUX2_GPIO_Port, AT_AUX2_Pin, GPIO_PIN_RESET)
#define _AT_AUX2_Off HAL_GPIO_WritePin(AT_AUX2_GPIO_Port, AT_AUX2_Pin, GPIO_PIN_SET)

/* Test Point  macros   */
#define _TP_Off HAL_GPIO_WritePin(TstPoint_GPIO_Port, TstPoint_Pin, GPIO_PIN_RESET)
#define _TP_On  HAL_GPIO_WritePin(TstPoint_GPIO_Port, TstPoint_Pin, GPIO_PIN_SET)

#define _Port_Off(Vxx) HAL_GPIO_WritePin(Vxx##_GPIO_Port, Vxx##_Pin, GPIO_PIN_RESET)
#define _Port_On(Vxx)  HAL_GPIO_WritePin(Vxx##_GPIO_Port, Vxx##_Pin, GPIO_PIN_SET)
/* End  Private Macros ------------------------------------------------------*/

/* ---------------Exported functions ----------------------------------------*/

uint32_t CONFIG_Read(uint16_t ADDR) mySYS;
void     My_PVD_Init(void) mySYS;
void     My_FLASH_Init(void) mySYS;
void     CONFIG_Erase(void) mySYS;
void     CONFIG_Write(void) mySYS;

void     Write_DSC_Const(void) mySYS;
void     My_DMA_Init(void) mySYS;
void     My_CRC_Init(void) mySYS;
void     CRC_Calc_Start(uint32_t  StartAdr) mySYS;
void     CRC_Calc_ContEnd(uint32_t  EndAdr) mySYS;
void     CRC_Flash_Calc(void) mySYS;
void     My_TIM_Init(void) mySYS;
void     My_UART_Init(void) mySYS;
void     UartSTM_Send(void) mySYS;
void     UartSTM_TX_Data(void) mySYS;
void     UartSTM_Receive(void) mySYS;
void     My_CAN_Init(void) mySYS;
void     CAN_Send_SASzero(void) mySYS;
void     CAN_Send_AGS(void) mySYS;
void     CAN_Send_PS_Cmd(void) mySYS;
void     CANT_Send_EBS11(void) mySYS;
void     CANT_Send_EBS12(void) mySYS;
void     CheckError_CANT(void) mySYS;
void     CheckError_AGS(void) mySYS;
void     CheckError_SAS(void) mySYS;
void     CheckError_BPS(void) mySYS;
void     CANS_Send_Dummy(void) mySYS;
void     CANS_Send_UpGrade(TypeDef_UpGrade* UpGrade) mySYS;
void     CANJ_Send_UpGrade(TypeDef_UpGrade* UpGrade) mySYS;
void     UpGrade_UART_Ask(TypeDef_UpGrade* UpGrade) mySYS;
void     UpGrade_CANJ_Ask(TypeDef_UpGrade* UpGrade) mySYS;
void     AGS_SAS_UpGrade(void) mySYS;
void     AGS_Calibration(void) mySYS;
void     SAS_DoneZero(void) mySYS;

void     Bridge_CAN(void) mySYS;
void     Bridge_CAN_Send(void) mySYS;
uint8_t  Bridge_Wait_TimeOut(uint16_t Tout) mySYS;
uint8_t  UpGrade_Tout(TypeDef_UpGrade* UpGrade) mySYS;
void     PS_ChangeADR(void) mySYS;
void     Diagnose_Command(void) mySYS;
void     TruckSim_Send(void) mySYS;
void     TrailerCAN_Receive(void) mySYS;
void     TrailerCAN_Analysis(void) mySYS;
void     TrailerCAN_Send(void) mySYS;
void     My_Main(void) mySYS;
void     My_Port_Init(void) mySYS;
void     My_VAR_Init(void) mySYS;
void     My_Init(void) mySYS;
void     My_Tick(void) mySYS;
void     My_UpGrade_STM(void) mySYS;
void     myHAL_UART_RxCpltCallback(UART_HandleTypeDef *huart) mySYS;
void     myHAL_ADC_Start_DMA(ADC_HandleTypeDef* hadc,
		                       uint32_t* pData, uint32_t Length) mySYS;
void     myHAL_ADC_ConvCpltCallback(ADC_HandleTypeDef* hadc) mySYS;
void     myHAL_CAN_ErrorCallback(CAN_HandleTypeDef* hcan) mySYS;
void     myHAL_CAN_RxCpltCallback(CAN_HandleTypeDef* hcan) mySYS;
void     myHAL_CAN_TxCpltCallback(CAN_HandleTypeDef* hcan) mySYS;
void     myHAL_DMAcrc_CpltCallback(DMA_HandleTypeDef *hdma) mySYS;
void     myHAL_FLASH_EndOfOperationCallback(uint32_t ReturnValue) mySYS;
void     myHAL_FLASH_OperationErrorCallback(uint32_t ReturnValue) mySYS;
void     myHAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim) mySYS;
void     myHAL_UART_ErrorCallback(UART_HandleTypeDef *huart) mySYS;
void     myHAL_UART_TxCpltCallback(UART_HandleTypeDef *huart)mySYS;
void     myHAL_ADC_ErrorCallback(ADC_HandleTypeDef *hadc) mySYS;
void     myHAL_PWR_PVDCallback(void) mySYS;
void     myHAL_TIM_OC_DelayElapsedCallback(TIM_HandleTypeDef *htim) mySYS;
void     myHAL_TIM_IC_CaptureCallback(TIM_HandleTypeDef *htim) mySYS;
void     EBS21data(_TypeDefEBS21* EBS21) mySYS;
void     EBS22data(_TypeDefEBS22* EBS22) mySYS;
void     EBS25data(_TypeDefEBS25* EBS25) mySYS;
void     CANT_Switch_Mode(TypeDef_CANT* CANT) mySYS;

void     TIM_IC_Init(TIM_HandleTypeDef *htim, uint32_t Channel) mySYS;
void     TIM_OC_Init(TIM_HandleTypeDef *htim, uint32_t Channel) mySYS;
void     WheelCapture (WheelTypeDef* WheelXX, TIM_HandleTypeDef* htim) mySYS;
void     WheelADC (WheelTypeDef* WheelXX, TIM_HandleTypeDef* htim) mySYS;
void     WheelSetCompare (WheelTypeDef* WheelXX, TIM_HandleTypeDef* htim) mySYS;
uint16_t Wheel_Safe_dT (WheelTypeDef* WheelXX) mySYS;
void     Set_Capture (WheelTypeDef* WheelXX) mySYS;
void     Power_Test(void) mySYS;
void     Power_ADC(void) mySYS;
void     Pcb_Test(void) mySYS;
uint8_t  Pcb_Sensor(WheelTypeDef* Wheelx) mySYS;
uint8_t  Pcb_Sen_Ua(WheelTypeDef* Wheelx) mySYS;
uint8_t  Pcb_Mod_AV(WheelTypeDef* Wheelx) mySYS;
uint8_t  Pcb_Mod_EV(WheelTypeDef* Wheelx) mySYS;
uint8_t  Pcb_Dif(DifTypeDef* Dif) mySYS;
uint8_t  Pcb_LSSW(LSSwTypeDef* SW) mySYS;
void     Work_Time(void) mySYS;
void     ADC_Wheel(WheelTypeDef* Wheelx) mySYS;
void     ADC_MDT(WheelTypeDef* Wheelx) mySYS;
void     ADC_Dif(DifTypeDef* Dif) mySYS;
void     ADC_GNDsw (LSSwTypeDef* Sw) mySYS;

void     UART_Rx_Init(UART_HandleTypeDef *huart, UartTypeDef* UARTx,
		              uint8_t pBuff, uint16_t Size) mySYS;
void     UART_Rx_NotInit(UART_HandleTypeDef *huart, UartTypeDef* UARTx,
		              uint8_t pBuff, uint16_t Size)  mySYS;
void     UartDIA_Receive(void) mySYS;
void     UartDIA_Send(uint8_t Length) mySYS;
void     UartDIA_PGMSend(void) mySYS;
void     Diagnose_ISO9141(void) mySYS;

void     DIA_Oss(void) mySYS;
void     DIA_Error(void) mySYS;
void     DIA_AddError(void) mySYS;
void     DIA_Read_RAM(void) mySYS;
void     DIA_Write_RAM(void) mySYS;
void     DIA_Read_EPROM(void) mySYS;
void     DIA_Write_EPROM(void) mySYS;
void     DIA_Erase_EPROM(void) mySYS;
void     DIA_WrBuf_CFG(void) mySYS;
void     DIA_Write_CFG(void) mySYS;

void     CANJ_Send_Manager(void) mySYS;
void     CANJ_Receive(void) mySYS;
void     CANJ_TimeOut(void) mySYS;

void     CANJ_TxD_Buf_0xFF(void) mySYS;
void     CANJ_Send_ACM(void) mySYS;
void     CANJ_Send_EBC1(void) mySYS;
uint8_t  WSI_Relative_Speed(WheelTypeDef* WheelXX) mySYS;
void     CANJ_Send_EBC2(void) mySYS;
void     DM_SPN_FMI(uint8_t NE, uint8_t NB) mySYS;
void     CANJ_Send_DM(void) mySYS;
void     DTC_Check(void) mySYS;
void     DTC_SPN_FMI(void) mySYS;
void     CANJ_Send_TPD(void) mySYS;
void     CANJ_Transmit(void) mySYS;
void     CANJ_Send_BAM(uint16_t IDpgn) mySYS;
void     CANJ_DM_TPD(uint16_t IDpgn) mySYS;
uint16_t Digit_To_ASCII(uint16_t  Dig) mySYS;
void     CANJ_Buff_TPD(uint16_t IDpgn) mySYS;
void     Buffer_Active_Error(void) mySYS;
void     Clear_Active_Error(void) mySYS;
void     Clear_Passive_Error(void) mySYS;
void     CANJ_Send_ACK(uint16_t PGN, uint8_t SA, uint8_t ACK) mySYS;
void     CANJ_Send_VW(void) mySYS;
void     CANJ_Send_TC1(void) mySYS;
void     CANJ_Send_EBC5(void) mySYS;
void     CANJ_Send_VDC1(void) mySYS;
void     CANJ_Send_VDC2(void) mySYS;
void     CANJ_Send_ASC4(void) mySYS;
void     CANJ_Send_TSC1_Engine(void) mySYS;
void     CANJ_Send_TSC1_Retarder(void) mySYS;
void     CANJ_Send_XBR(void) mySYS;
uint8_t  CANJ_TSC_Checksum(CanTxMsgTypeDef* Message, uint8_t Cnt) mySYS;
uint8_t  CANJ_XBR_Checksum(uint8_t Cnt) mySYS;
uint8_t  CANJ_Rx_TSC_Checksum(uint8_t Cnt) mySYS;
void     CANJ_Message_Polling(void) mySYS;
void     DIA_CANJ_Oss(void) mySYS;
void     ICM_IniSPI_Write(uint16_t  Delay) mySYS;
void     ICM_SPI1_Read(TxRx_TypeDef*  Spi) mySYS;
void     My_INV_Init(void) mySYS;
void     Invense_AG(void) mySYS;

void     Button_Switch(void) mySYS;
void     State_Button(ButtonTypeDef* SW) mySYS;
void     ADC_Button(ButtonTypeDef* SW) mySYS;
uint16_t ADC_Middle_Value(MidTypeDef* Mid) mySYS;

void     DIA_SAS_Oss(void) mySYS;

void    EPROM_Write_Status(void) mySYS;
void    EPROM_Write_Page(void) mySYS;
void    EPROM_RDSR(void) mySYS;
void    EPROM_Manager(void) mySYS;
void    EPROM_Machine(void) mySYS;
void    My_EPROM_Init(void) mySYS;
void    EPROM_Faults(void) mySYS;
void    EPROM_Odometer(void) mySYS;
void    EPROM_WR_4byte(TypeDef_4byte* S) mySYS;
uint32_t EPROM_RD_4byte(TypeDef_4byte* S, uint16_t A, uint8_t N) mySYS;
void    EPROM_Read_All(void) mySYS;

void     TerminalB7_Capture (TIM_HandleTypeDef* htim) mySYS;
void     ADC_PK(void) mySYS;
void     DIA_ICM_AG_Oss(void) mySYS;
void     DIA_SCI_Oss(void) mySYS;
void     DIA_CRC_Oss(void) mySYS;
void     DIA_Button_Oss(void) mySYS;
void     DIA_EPROM_Oss(void) mySYS;
void     DIA_LIM_Oss(void) mySYS;
void     DIA_AGS_Oss(void) mySYS;
//----------Exported Func.c functions ------------
extern void  XBR_Press_Control(void);
extern void  EBL_Press_Control(void);
extern void  ASR_Press_Control(void);
extern void  EBL_Regulate(void);
extern void  ASR_Regulate(void);
extern void  Vehicle_Load(void);
extern void  MDT_Switch (WheelTypeDef* WheelXX, uint8_t EV, uint8_t AV);
extern void  Engine_Torque_Control(void);
extern void  TorqueLim_Activate(void);
extern void  RollOverProtection(void);
extern void  SideSlip_Estimate(void);
extern void  SideSlip_Control(void);
extern void  Direct_Yaw_Control (void);
extern void  TrailerVDC(void);
extern void  ABS_Regulate(void);
extern void  ABS_Press_Control(void);
extern void  Switch_Valve (void);
extern void  VDC_Flags (void);
extern void  DBR_Regulate(void);
extern void  Retarder_Torque_Control(void);
extern void  Stop_Light(void);

//----------Exported MyVAR.c functions ------------
extern void  AccelX_Estimate(void);
extern void  AccelY_Estimate(void);
extern void  Ackermann(void);
extern void  ManeuverFlags(void);
extern void  VDC_Input_Var(void);
extern void  Road_Estimate (void);
extern void  Pressure_Estimate(void);
extern void  ReverseCheck (void);
extern void  SignalValidity(void);
extern void  SpeedX_Estimate(void);
extern void  TransmissionKTS(void);
extern void  RoadTest_VAR(void);
extern void  GraphCalc(void);
extern void  Speed_Wheels(void) ;
extern void  KoefSpeed(void);
extern void  Read_IEE_VDC_Const(void);
extern void  Self_Tuning(void);

#define  FlashPageSize  FLASH_PAGE_SIZE //0x0800  - 2k
#define  CONFIG_START_ADDR  0x1F800     //0xF800  // последний сектор
#define  ConfigStartAdr (FLASH_BASE + CONFIG_START_ADDR)   // начало CONFIG
#define  ConfigEndAdr   (ConfigStartAdr + FlashPageSize - 0x004U)// конец CONFIG
//#define  SizeCFGBuf   142     // >2*15+5*22=140word
//#define  SizeCFGBuf   162     // >2*15+6*22=162word
#define  SizeCFGBuf   200     //

// 20066 * Mu
#define   __Road_High_Mu   0x2345 // 0,45 Wet asphalt
#define   __Road_Low_Mu  0x1281 //  0x0D53 // 0,18 Ais  0x1281 // 0,25 Snow
// флаги  ввода в эксплуатацию Model_Instal
#define __AGS_Calibrate   0x33
#define __SAS_Calibrate   0xCC

#define	__Driver_Gaz_On    30 //12%
#define	__SpeedX_10      0x0A00 //10km/h
#define	__PS_Fail_Pmin   0x0900 //0,45atm
#define __PS_Fail_Speed  0x0500	//5km/h

// в ASCII
#define __MAZ_4371   0x34333731
#define __MAZ_4381   0x34333831
#define __MAZ_5440   0x35343430
#define __MAZ_6430   0x36343330
#define __MAZ_6501   0x36353031

#define __Model_Default   0x30303030
#define __Number_Default  0x30303030303030

#define __Rx_Head   0xAF
#define __Rx_EOF    0xFA
#define __Tx_Head   0xAA
#define __PGM_Key1  0xC0
#define __PGM_Key2  0xB0
#define __PGM_Step1 0x55
#define __PGM_Step2 0xAA

#define PGM_Pri   6       // приоритет
#define PGM_PGN0  0xF040  // Rx PGN Command & SectorAdr
#define PGM_PGN1  0xF041  // Rx PGN PaketData
#define PGM_PGN2  0xF042  // Tx PGN PGM.Ask
#define PGM_PGN3  0xF043  // Rx PGN инициализация PGM
#define PGM_PGN4  0xF044  // Tx PGN Send_Ask
#define PGM_PGN5  0xF045  //

#define PGM_AGS_Adr   0x3E    // адрес программирования AGS
#define PGM_SAS_Adr   0xE8    // 0x4D    // адрес программирования SAS
#define AGS_SA    0xDC    // адрес AGS
#define SAS_SA    0xE8    // адрес SAS
#define Dia_Adr   0x70    // адрес DK
#define ECU_SA    0x0B    // адрес ECU
#define EM_SA     0x80    // адрес эл.мотор
#define EM1_SA    0x81    // адрес левый эл.мотор
#define EM2_SA    0x82    // адрес правый эл.мотор

#define Pgm_STM1  0x33
#define Pgm_STM2  0x34
#define __Pgm_AGS_Init   0x44 //?
#define __Pgm_SAS_Init   0x45

#define Dia_STM1  0x00
#define Dia_STM2  0x80

// SPN 237 Vehicle Identification Number
// PGN 65260 Vehicle Identification - VI
// (0xFEEC) 17-character VIN
/*
PGN 65136 Combination Vehicle Weight - CVW
(0xFE70)
1-2 2 bytes Powered Vehicle Weight 1585
Total mass imposed by the tires of the powered vehicle on the road surface.
Does not include the trailer.
3-4 2 bytes Gross Combination Vehicle Weight 1760
The total weight of the truck and all attached trailers.
 */
/* End of exported functions -------------------------------------------------*/

#define DBGMCU_IDCODE 0x40015800
//В старших 16 битах записана ревизия микроконтроллера
//Следующие четыре бита всегда равны 0b0110 (то есть это число 6)
//Младшие 12 бит содержат код микроконтроллера
//HAL_GetREVID() ((DBGMCU->IDCODE) >> DBGMCU_IDCODE_REV_ID_Pos);
//HAL_GetDEVID() ((DBGMCU->IDCODE) & IDCODE_DEVID_MASK);
#define DBGMCU_BASE          0xE0042000U
/*st-flash read DES_UID 0x1FFFF7AC 0x04  ((*((uint32_t *)0x1FFFF7E8U)))
//st-flash read DES_WAF_LOT_NUMBERS 0x1FFFF7B0 0x08
//st-flash read DES_FLASH_SIZE 0x1FFFF7CC 0x02
//st-flash read DBGMCU_IDCODE 0x40015800 0x04
// 16 80 12 00    04          57 32 46 31 38 34 20  10 00
// XY-координаты
//чипа на вафле, номер вафли,     номер лота,    размер флаш-памяти.

//Биты 31:0 UID[31:0]: координаты X и Y на пластине
Биты 31:8 UID[63:40]: LOT_NUM[23:0]
Номер партии (в кодировке ASCII)
Биты 7:0 UID[39:32]: WAF_NUM[7:0]
Номер пластины (8-битное беззнаковое число)
Биты 31:0 UID[95:64]: LOT_NUM[55:24]
Номер партии (в кодировке ASCII)
*/

///------------------отладка убрать-------------------------


#endif /* __MY_SYS_H */
