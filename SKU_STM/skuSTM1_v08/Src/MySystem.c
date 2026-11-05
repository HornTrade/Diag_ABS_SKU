/* ----- SKU_v10 ------------*/
#include "MyTypeDef.h"
#include "main.h"
#include "stm32f1xx.h"
#include "MyPGM.h"
#include "MySystem.h"
#include "MyFunc.h"
#include "MyVAR.h"
#include "Invense_Sensor.h"

// ---------------Условная компиляция------------------
/* // - отключен Graph */
//#define __Graph1_Enable
//#define __Graph2_Enable
/* // - отключена проверка PVD */
#define __PVD_Enable
//#define __MainLoop_Check
/* // - отключена проверка CRC программы */
//#define __CRC_PGM_Enable

//const volatile char strFlashCRC[] myCRC  = "CRC PGM";
const volatile uint32_t constFlashCRC myCRC = _CRC_PGM;

const volatile FUN_Ptr_t MyHallTab[20] myData = {
		myHAL_ADC_ConvCpltCallback,          //0
		myHAL_CAN_ErrorCallback,             //1
		myHAL_CAN_RxCpltCallback,            //2
		myHAL_CAN_TxCpltCallback,            //3
		myHAL_DMAcrc_CpltCallback,           //4
		myHAL_FLASH_EndOfOperationCallback,  //5
		myHAL_FLASH_OperationErrorCallback,  //6
		myHAL_TIM_PeriodElapsedCallback,     //7
		myHAL_UART_ErrorCallback,            //8
		myHAL_UART_RxCpltCallback,           //9
		myHAL_UART_TxCpltCallback,           //10
		myHAL_ADC_ErrorCallback,             //11
		myHAL_PWR_PVDCallback,               //12
		myHAL_TIM_OC_DelayElapsedCallback,   //13
		My_Init,							 //14
		My_Main,							 //15
		My_Tick,						     //16
		myHAL_ADC_ErrorCallback,	         //17
		myHAL_TIM_IC_CaptureCallback,	     //18
		My_UpGrade_STM                       //19
        };

const volatile uint8_t SASzeroData[8] myData = {
     0x00, 0x40, 0x20, 0x00, 0x00, 0x00, 0x02,0x01
     };
const volatile uint8_t SAS_ChAdrData[8] myData = {
     0x00, 0x00, 0x20, 0x10, 0x00, 0x00, 0x02,0x01
     };
const volatile uint8_t PS_CMD[8] myData = {
	 0x00, 0x00, 0x20, 0x10, 0x00, 0x00, 0x02,0x00
     };

const volatile uint8_t DIA_Length_TX[24] myData = {
     0x01, 0x01, 0x01, 0x19, 0x01, 0x01, 0x06, 0x06, //0x19 6 строк Oss
	 0x09, 0x01, 0x01, 0x09, 0x01, 0x1B, 0x02, 0x09,
	 0x01, 0x01, 0x03, 0x01, 0x01, 0x11, 0x01, 0x09
     };

const char ADUI[] = __ADUI;
const char ECUT[] = "CAB*ABSVDC*"; // 11

#ifdef __Square_Board
const char ADUI_DM[] = __ADUI_DM;
#endif

#if defined __CAN_j1939
const volatile uint16_t DM_SPN_Tab[41] myData = {
		789,789, // Wheel Sensor ABS Axle 1 Left
		790,790, // Wheel Sensor ABS Axle 1 Right
		791,791, // Wheel Sensor ABS Axle 2 Left
		792,792, // Wheel Sensor ABS Axle 2 Right
		629,   // SPN MC1_Error Controller #1
		609,   // SPN MC2_Error Controller #2
		627,   // SPN Power Power Supply (Obsolete)
		795,795, // Pressure Modulation Valve ABS Axle 1 Left
		796,796, // Pressure Modulation Valve ABS Axle 1 Right
		797,797, // Pressure Modulation Valve ABS Axle 2 Left
		798,798, // Pressure Modulation Valve ABS Axle 2 Right
		697,  // SPN PK Auxiliary PWM Driver #1
		806,  // SPN Dif ABV_FA, ABV_RA Dif 1 - ASR Valve
		639,  // SPN CAN J1939 Network #1, Primary Vehicle Network
		810,  // SPN B7  Speed Signal Input
		811,  // SPN WLamp Warning Light Bulb
		801,  // SPN DBR Retarder Control Relay
		701,  // SPN GND_Error Auxiliary I/O #01
		793,793, // Wheel Sensor ABS Axle 3 Left
		794,794, // Wheel Sensor ABS Axle 3 Right
		5109, // SPN MC3_Error Controller #3
		799,799, // Pressure Modulation Valve ABS Axle 2 Left
		800,800, // Pressure Modulation Valve ABS Axle 2 Right
		1812, // SPN Sreer SAS  Steering Wheel Angle Sensor Type
		1808, // SPN GIRO_ACC    Yaw Rate
		847,847, // Pneumatic Control Unit (PCU) Trailer, Tag, Or Push Solenoid
		1058, // SPN Press_Error  Brake Pressure Sensing, Trailer Control
		1042  // SPN CANT_Error  Electronic Tractor/Trailer Interface (ISO 11992)
};
const volatile uint8_t FMI_Sen_Err0[8] myData = {
		7, // FMI_Gap_Error         ;
		3, // FMI_Short_Bat_Error   ; K-2 W-3
		4, // FMI_Short_Gnd_Error   ; K-2 W-4
		5, // FMI_Cut_Sens_Error    ; K-2 W-5
		6, // FMI_Short_Sens_Error  ; K-2 W-6
		10,// FMI_Speed_Speace_Error; K-10 W-10
		16,// FMI_Wrong_Speed       ;      W-12
		8  // FMI_Wrong_T           ; K-8  W-11
};
const volatile uint8_t FMI_Sen_Err1[8] myData = {
		22, // FMI_Tire_Error       ;
		27, // FMI_Rack_Error       ; K-7 W-7
		23, // FMI_Whip_Error       ;
		24, // FMI_Mod_TimeOut      ;
		11, // FMI_W0_Not_Err_4
		11, // FMI_W0_Not_Err_5
		11, // FMI_W0_Not_Err_6
		11  // FMI_W0_Not_Err_7
};
const volatile uint8_t FMI_MC_Err[8] myData = {
		2, // FMI_SPI_Bad       ;
		25, // FMI_RAM_Bad       ; K-7 W-7
		23, // FMI_ROM_Bad       ;
		24, // FMI_EPROM_Bad      ;
		22, // FMI_Config_Bad
		26, // FMI_SCI2_Tout
		27, // FMI_SCI2_Bad
		14  // FMI_Model_Install_Fail Special instructions
};
const volatile uint8_t FMI_Power_Err[8] myData = {
		11, // FMI_Pow_NotErr_0
		11, // FMI_Pow_NotErr_1
		5,  // FMI_K30_Fuse_Cut   or open circuit
		4,  // FMI_K15_Is_Low
		3,  // FMI_K15_Is_High
		11, // FMI_Pow_NotErr_5
		16, // FMI_OverVoltage
		11  // FMI_Pow_NotErr_7
};
const volatile uint8_t FMI_Mod_Err0[8] myData = {
		22, //FMI_NC_GND_MOD
		26, //FMI_SCV_MOD
		3,  //FMI_SB_AV_MOD    ; K-3 W-3
		23, //FMI_SB_EV_MOD    ; K-3 W-3
		5,  //FMI_NC_AV_MOD    ; K-5 W-5
		25, //FMI_NC_EV_MOD    ; K-5 W-5
		4,  //FMI_SC_AV_MOD    ; K-4 W-6
		24  //FMI_SC_EV_MOD    ; K-4 W-6
};
const volatile uint8_t FMI_Mod_Err1[8] myData = {
		9,  //FMI_MOD_Activ_Time
		27, //FMI_ERR_Ton_MOD
		28, //FMI_ERR_Com_MOD
		29, //FMI_SC_Mod_Mod
		11, //FMI_MOD_NotErr_4 ; Root cause not known
		11, //FMI_MOD_NotErr_5
		11, //FMI_MOD_NotErr_6
		11  //FMI_MOD_NotErr_7
};
const volatile uint8_t FMI_PK_Err[8] myData = {
		5,  //FMI_NC_PK
		4,  //FMI_SC_PK
		3,  //FMI_SB_PK
		11, //FMI_PK_Not_Err_3
		11, //FMI_PK_Not_Err_4
		11, //FMI_PK_Not_Err_5
		11, //FMI_PK_Not_Err_6
		11  //FMI_PK_Not_Err_7
};
const volatile uint8_t FMI_Dif_Err[8] myData = {
		5,  //FMI_NC_DifR     ;
		4,  //FMI_SC_DifR     ; Voltage below normal, or shorted to low source
		3,  //FMI_SB_DifR     ; Voltage above normal, or shorted to high source
		9,  //FMI_Tout_DifR   ; Abnormal update rate
		25, //FMI_NC_DifF     ; +20
		24, //FMI_SC_DifF     ; для переднего нужен SPN 807
		23, //FMI_SB_DifF
		29  //FMI_Tout_DifF
};
const volatile uint8_t FMI_CANJ_Err[8] myData = {
		19, //FMI_CAN_Bus_OFF
		22, //FMI_CAN_AdrErr
		2,  //FMI_CAN_TimeOut  ; Data intermittent прерывистые
		23, //FMI_CAN_Trafic
		11, //FMI_CAN_NotErr_4
		11, //FMI_CAN_NotErr_5
		11, //FMI_CAN_NotErr_6
		11  //FMI_CAN_NotErr_7
};
const volatile uint8_t FMI_B7_Err[8] myData = {
		5,  //FMI_NC_B7
		8,  //FMI_FAIL_IMP_B7   ; Abnormal Pulse Width, or Period
		2,  //FMI_FAIL_FREQ_B7  ; Data erratic,
		21, //FMI_TCO1_Sp_Fail  ; Data drifted low
		19, //FMI_TCO1_CAN_Fail
		11, //FMI_B7_Not_Err_3
		11, //FMI_B7_Not_Err_4
		11  //FMI_B7_Not_Err_5
};
const volatile uint8_t FMI_Lamp_Err[8] myData = {
		5,  //FMI_WarnLamp_NC
		3,  //FMI_WarnLamp_SB
		25, //FMI_ASRLamp_NC
		23, //FMI_ASRLamp_SB
		22, //FMI_StopSign_NC
		19, //FMI_CAN_Stop_Fail
		26, //FMI_Stop_Light_NC
		27  //FMI_AGS_Tout
};
const volatile uint8_t FMI_DBR_Err[8] myData = {
		5,  //FMI_DBR_Error_NC
		3,  //FMI_DBR_Error_SB   ; K-3 W-3
		11, //FMI_DBR_NotErr_1
		11, //FMI_DBR_NotErr_2
		11, //FMI_DBR_NotErr_3
		11, //FMI_DBR_NotErr_4
		11, //FMI_DBR_NotErr_5
		11  //FMI_DBR_NotErr_6
};
const volatile uint8_t FMI_GND_Err[8] myData = {
		11, //FMI_GND_NoErr_1
		11, //FMI_GND_NoErr_2
		5,  //FMI_GndWL_NC
		25, //FMI_Kl31_NC
		4,  //FMI_GndF_SC
		3,  //FMI_GndF_SB
		24, //FMI_GndR_SC
		23  //FMI_GndR_SB
};
const volatile uint8_t FMI_SAS_Err[8] myData = {
		19, //FMI_CAN_SAS_Fail
		12, //FMI_SASdata_Fail    ; Bad intelligent devise or component
		22, //FMI_SASmech_Fail
		13, //FMI_SASzero_Fail    ; Out of calibration
		23, //FMI_SASdrift_Fail   ; *Not Used
		11, //FMI_SAS_NoErr_5
		11, //FMI_SAS_NoErr_6
		14  //FMI_SAS_Install_Fail
};
const volatile uint8_t FMI_AGS_Err[8] myData = {
		19, //FMI_CAN_Fail
		13, //FMI_Zero_Fail
		22, //FMI_CFG_Fail
		9,  //FMI_Data_Fail      ; Abnormal update rate
		23, //FMI_CRC_Fail
		24, //FMI_Mount_Fail
		25, //FMI_ST_Fail
		14  //FMI_Install_Fail   ; Special instructions
};
const volatile uint8_t FMI_Press_Err[8] myData = {
		19, //FMI_CAN_BPS_Fail
		22, //FMI_CAN_ECAS_PS_Fail
		23, //FMI_Brake_PS_OffFail
		24, //FMI_Brake_PS_OnFail
		5,  //FMI_Brake_PS_NC
		26, //FMI_Stop_Switch_Fail
		27, //FMI_TrailerBPS_Fail
		25  //FMI_TrailerBPS_NC
};
const volatile uint8_t FMI_CANT_Err[8] myData = {
		19, //FMI_CANT_Fail
		22, //FMI_CANT_res_1
		2,  //FMI_CANT_res_2
		5,  //FMI_CANT_res_3
		25, //FMI_CANT_res_4
		3,  //FMI_CANT_res_5
		23, //FMI_CANT_res_6
		11  //FMI_CANT_res_7
};
const volatile uint8_t* FMI_Tab[41] myData = {
		FMI_Sen_Err0, FMI_Sen_Err1,
		FMI_Sen_Err0, FMI_Sen_Err1,
		FMI_Sen_Err0, FMI_Sen_Err1,
		FMI_Sen_Err0, FMI_Sen_Err1,
		FMI_MC_Err, FMI_MC_Err,
		FMI_Power_Err,
		FMI_Mod_Err0, FMI_Mod_Err1,
		FMI_Mod_Err0, FMI_Mod_Err1,
		FMI_Mod_Err0, FMI_Mod_Err1,
		FMI_Mod_Err0, FMI_Mod_Err1,
		FMI_PK_Err,
		FMI_Dif_Err,
		FMI_CANJ_Err,
		FMI_B7_Err,
		FMI_Lamp_Err,
		FMI_DBR_Err,
		FMI_GND_Err,
		FMI_Sen_Err0, FMI_Sen_Err1,
		FMI_Sen_Err0, FMI_Sen_Err1,
		FMI_MC_Err,
		FMI_Mod_Err0, FMI_Mod_Err1,
		FMI_Mod_Err0, FMI_Mod_Err1,
		FMI_SAS_Err,
		FMI_AGS_Err,
		FMI_Mod_Err0, FMI_Mod_Err1,
		FMI_Press_Err,
		FMI_CANT_Err
};

const volatile uint8_t ACM_Data[8] myData = {
		0,0,11,0,0,0,0,0
};
#endif

//--------------------------------------------------------

HAL_StatusTypeDef HAL_Status;

/* ----- Var CAN j1939 ------------*/
extern CAN_HandleTypeDef hcan1; // объявлен CubeMX в main.c
#define hCANJ   hcan1
CanTxMsgTypeDef  CANJ_Tx_Message;
CanRxMsgTypeDef  CANJ_Rx0_Message;
vcbTypeDef      cCANJ;
CANxTypeDef     vCANJ;

/* ----- Var CAN sensors ------------*/
extern CAN_HandleTypeDef hcan2; // объявлен CubeMX в main.c
#define hCANS   hcan2
TypeDef_CANS     CANS;
CanTxMsgTypeDef  CANS_Tx_Message;
CanRxMsgTypeDef  CANS_Rx0_Message;
vcbTypeDef      cCANS;
CANxTypeDef     vCANS;

/* ----- Var CAN trailer ------------*/
#define hCANT   hcan2
CanTxMsgTypeDef  CANT_Tx_Message;
CanRxMsgTypeDef  CANT_Rx0_Message;
TypeDef_CANT     CANT;
vcbTypeDef      cCANT;
CANxTypeDef     vCANT;
uint8_t   CANT_Enable;

/* ----- UART4 -com STM--------------*/
// 200 kbod Frame 10bit  Tfr= 50mkc
extern UART_HandleTypeDef huart4; // объявлен CubeMX в main.c
#define huartSCI  huart4
vcbTypeDef    cUartSCI;
UartTypeDef      SCI;
uint8_t     SCI_Err_SR;
uint16_t    SCI_Loss_Sinchro;
uint8_t     SCI_ICM_AG_Cnt;
uint8_t     SCI_TX_Data_Sel;
uint8_t     SCI_RX_Data_Sel;
uint8_t     SCI_RARE_Sel;
uint8_t     SCI_Rx_Cnt;
uint8_t     SCI_Rx_Cmpl;
uint8_t   SCI_RxBuff[UartSCI_Rx_Length+1];
//uint8_t   SCI_TxBuff[UartSCI_Tx_Length+1];

uint16_t   DSC_Const_Buf[SizeCFGBuf];
uint16_t   DSC_Const_Adr;

/* ----- UART1 -com DIA--------------*/
// 115 kbod Frame 10bit  Tfr= 80mkc
extern UART_HandleTypeDef huart1; // объявлен CubeMX в main.c
#define huartKline  huart1
vcbTypeDef       cUartDIA;
UartTypeDef      UartDIA;
DIATypeDef DIA;

extern TIM_HandleTypeDef htim4; // объявлен CubeMX в main.c
#define     htimPK       htim4
#define     PK_CHANNEL   TIM_CHANNEL_1
int16_t   Tim_Cnt;

extern TIM_HandleTypeDef htim1; // объявлен CubeMX в main.c
/* ----- TIM6 --------------------*/
extern TIM_HandleTypeDef htim6; // объявлен CubeMX в main.c
vcbTypeDef       cTIM6;
/* ----- TIM7 --------------------*/
extern TIM_HandleTypeDef htim7; // объявлен CubeMX в main.c
vcbTypeDef       cTIM7;

extern TIM_HandleTypeDef htim3;  // объявлен CubeMX в main.c
#define hTimSS  htim3

extern TIM_HandleTypeDef htim2;  // объявлен CubeMX в main.c
#define htimB7     htim2
#define B7_CHANNEL TIM_CHANNEL_3
// разные настройки таймера STM1 STM2

extern CRC_HandleTypeDef hcrc; // объявлен CubeMX в main.c
extern DMA_HandleTypeDef hdma_memtomem_dma1_channel6;// 2объявлен CubeMX в main.c
#define hdma_crc  hdma_memtomem_dma1_channel6

#define    FlashStartAdr 	FLASH_BASE                  // начало FLASH
#define    FlashEndAdr   ((uint32_t)&constFlashCRC) -4	// конец FLASH
#define    CRC_BufferLength 0x40U //нельзя sizeof(CRC_Buff)
#define    CRC_WordLength   0x04U // ALIGN(4)
#define    CRC_DMALength   (CRC_BufferLength * CRC_WordLength)
uint32_t   CRC_Buff[64];
uint32_t   Flash_CRC;	 	// результат
uint32_t   CRC_Addr;		// адрес блока DMA
uint32_t   CRC_BlSize;		// размер блоков CRC_DMA
uint8_t    CRC_Sel;
uint16_t   CRC_Ok_Cnt;
#define    PGM_CRC_Start   1
#define    PGM_CRC_Cont    2
#define    PGM_CRC_End     3
#define    CFG_CRC_Start   4
#define    CFG_CRC_Cont    5
#define    CFG_CRC_End     6

uint32_t   PGM_CRC_MC1;
uint32_t   PGM_CRC_MC2;

/* ----- ADC & DMA -----------------*/
extern ADC_HandleTypeDef hadc1; // объявлен CubeMX в main.c
//extern DMA_HandleTypeDef hdma_adc;
#define hadc    hadc1
vcbTypeDef       cADC;
uint16_t ADC_Data[20];//16

#ifdef   __SPI_Compile
extern SPI_HandleTypeDef hspi1; // объявлен CubeMX в main.c
#endif
vcbTypeDef       cSPI1;
TxRx_TypeDef     SPI_AG;
uint8_t   AG_Tout_Cnt;
uint8_t   SPI_TX_Data[40];

vcbTypeDef   cICM;
AccGiroTypeDef ICM_20602;			// структура Accel_Temp_Giro в MPU65
AccGiroTypeDef ICM_AG;

/* Temperature sensor calibration value address */
#define TEMP110_CAL_ADDR ((uint16_t*) ((uint32_t) 0x1FFFF7C2))
#define TEMP30_CAL_ADDR  ((uint16_t*) ((uint32_t) 0x1FFFF7B8))
#define VREFINT_CAL_ADDR ((uint16_t*) ((uint32_t) 0x1FFFF7BA))
/* will contain the temperature in degrees Celsius */

//IAM-20680//ICM-20689
//TEMP_degC   = ((TEMP_OUT –
//RoomTemp_Offset)/Temp_Sensitivity) + 25degC (21degC)

/* -----CONFIG Flash --------------------*/
FLASH_EraseInitTypeDef pEraseInit;

uint32_t    CONFIG_DATA;
uint32_t    CONFIG_ADDR;
vcbTypeDef  cCONFIG;
uint8_t    FLASH_Cplt;
uint8_t    FLASH_Erase;

uint8_t    CFG_WrData_Cnt;
#define    DSC_CFG_Erase_S   1
#define    DSC_CFG_Erase_E   2
#define    DSC_CFG_WrData_S  3
#define    DSC_CFG_WrData_E  4
#define    DSC_CFG_WrCnt_S   5
#define    DSC_CFG_WrCnt_E   6
#define    DSC_CFG_Delay     7
#define    DSC_CFG_WrCRC_S   8
#define    DSC_CFG_WrCRC_E   9

// CRC
//#define  ConfigStartAdr (FLASH_BASE + CONFIG_START_ADDR)   // начало CONFIG
//#define  ConfigEndAdr   (ConfigStartAdr + FlashPageSize - 0x004U)// конец CONFIG
#define  SASzeroDoneAdr (ConfigEndAdr - 0x000CU)//
uint32_t   Config_CRC;	  // результат
uint32_t   Config_CRC_MC2;
uint8_t    DSC_CFG_Sel;
uint8_t    CFG_WrData_Cnt;
uint32_t   Config_Cnt;	  // счетчик записей CFG

/* -----   IWDG   -----------------*/
extern IWDG_HandleTypeDef hiwdg; // объявлен CubeMX в main.c
// !!!!!!!!!!MX_IWDG_Init() start watchdog

/* -----   PVD    -----------------*/
PWR_PVDTypeDef sConfigPVD;
/*
000: 2.2V
001: 2.3V
010: 2.4V
011: 2.5V
100: 2.6V
101: 2.7V
110: 2.8V
111: 2.9V*/

/* RE define------------------------------------------------------------*/
#define hTim1ms   htim7
#define hTim5ms   htim6
/* end RE define--------------------------------------------------------*/

_ByteBits_  _ABS_System_F0;
_ByteBits_  _ABS_System_F5;

_ByteBits_  _DSC_Flags;
_ByteBits_  _DSC_Flags1;
_ByteBits_  _DSC_Flags2;
_ByteBits_  _DSC_Flags3;
_ByteBits_  _Brake_Flags;
_ByteBits_  _Diag_Flags;
_ByteBits_  _Diag_Flags2;

_ByteBits_  _Validity_Flags;
_ByteBits_  _Validity_Flags2;
_ByteBits_  _Validity_Flags3;

_ByteBits_  _Steering_Flags;
_ByteBits_  _CalibSens_DSC;
_ByteBits_  _TorqueMode; //
_ByteBits_  _TrailerStatus; //
_ByteBits_  _TrailerFind; //
_ByteBits_  _EBS11_Status; //принимается от DZ
_ByteBits_  _Upit_Flags;

// выходное состояние клапанов передаваемое в PA
_ByteBits_ _KL_Status_1;
_ByteBits_ _KL_Status_2;
// входное состояние клапанов принимаемое от PA
_ByteBits_ _KL_Status_PA;
_ByteBits_ _KL_Status_PA2;
// состояние клапанов для модели давления
_ByteBits_ _KL_Status_Mot;
_ByteBits_ _KL_Status_Mot2;

//----------------------------Error-----------------
_ByteBits_  _s_MC3_Error;
_ByteBits_  _s_SAS_Error;
_ByteBits_  _s_AGS_Error;
_ByteBits_  _s_PrS_Error;
_ByteBits_  _s_CANT_Error;
_ByteBits_  _Power_Error;

//--------структура Util смены адреса----------
struct
{ uint8_t    Phase;
  uint8_t    Cnt;
  uint8_t    Adr;
  uint8_t    CAN_TxData[8];
} PS;

TypeDef_Vehicle   Vehicle;
TypeDef_Engine    Engine;
TypeDef_SAS       SAS;
TypeDef_AGS       AGS;
TypeDef_Body      Body;
TypeDef_EBC1      EBC1;
TypeDef_CCVS      CCVS;
TypeDef_ECAS        ECAS;
TypeDef_CAN_Engine  CAN_Engine;
TypeDef_BridgeCAN   BridgeCAN;
TrailerTypeDef      Trailer;

CANTTypeDef   Trailer1;
CANTTypeDef   Trailer2;
CANTTypeDef   Trailer3;
CANTTypeDef   Trailer4;
CANTTypeDef   Trailer5;

TypeDef_Diag   Diag;
TypeDef_Power  Power;

uint16_t  TestDisable_Cnt;

uint8_t   MainLoop_5ms_Flag;
uint8_t   MainLoop_Stop;
uint8_t   Flag_Reset;     // флаг рестарта
uint8_t   My_Tick_Enable; // HAL_InitTick делается первым до Сlk

uint8_t   EBS11Cnt;
uint8_t   EBS12Cnt;
uint8_t   EBS21Cnt;
uint8_t   EBS22Cnt;
uint8_t   EBS25Cnt;

ButtonTypeDef SW_ABS;
ButtonTypeDef SW_ASR;
ButtonTypeDef SW_TSET;
ButtonTypeDef SW_DIA;

uint8_t    MC2_Other_Error;
uint8_t    MC2_GND_Error;
uint16_t   Speed_VX_Front;
uint8_t    XBR_CS;

//=============== объявлен  в MyFunc.c =========================
extern  TypeDef_EBL    EBL;
extern  TorqueTypeDef  EngineTorque;
extern  TypeDef_LSSw   LSSw;
extern  TypeDef_ASR    ASR;
extern  DYCTypeDef     DYC;

//=============== объявлен  в MyVAR.c =========================
extern  ROPTypeDef     ROP;
extern  TypeDef_TCO        TCO;
extern  TypeDef_Brake      Brake;
extern  TypeDef_Retarder   Retarder;
extern  TypeDef_Body  Body;
extern  uint16_t  TrailerPress;
extern  uint16_t  Speed_VX_est;
extern  WheelTypeDef     Wheel_FL;
extern  WheelTypeDef     Wheel_FR;
extern  WheelTypeDef     Wheel_RL;
extern  WheelTypeDef     Wheel_RR;
extern  int16_t   Omega_Z_est;
extern  int16_t   Acc_Y_est;
extern  int16_t   Acc_X_est;  //??
extern  TypeDef_Emul     Emul;
extern  WheelTypeDef     Wheel_3L;
extern  WheelTypeDef     Wheel_3R;
extern  DifTypeDef      TrailerDif;
extern  DifTypeDef      RearDif;
extern  int16_t   Omega_Z_est;
extern  int16_t   Steer_sen;  // угол поворота руля
extern  TypeDef_EBC5   EBC5;
extern  LSSwTypeDef    BSP75_LASR;
extern  LSSwTypeDef    BTS142_GNDR;
extern  uint8_t    Dif_Error_MC1;
extern  uint8_t    Dif_Error_MC2;
extern  uint16_t  SpeedVX_RearAxel;
extern  int16_t   Press_Sen1;
extern  int16_t   Press_Sen2;
extern  int16_t   Omega_Z_sen;
extern  int16_t   Omega_X_sen;
extern  int16_t   Omega_Y_sen;
extern  int16_t   Acc_X_sen;
extern  int16_t   Acc_Y_sen;
extern  int16_t   Acc_Z_sen;
extern  TypeDef_SelfTun   SelfTun;
extern  DifTypeDef        FrontDif;
extern  LSSwTypeDef    BSP75_WL;
extern  LSSwTypeDef    BSP75_DBR;
extern  int16_t    IEE_DSC_Const[1024]; // буфер чтения констант из FlashCFG

#ifdef   __AxisF_Compile
extern  uint16_t  Speed_VX_TCO;
extern  int16_t   Steering_Angle;   // выходной угол поворота руля
extern  OffsetTypeDef  BrakeP;
extern  LSSwTypeDef    BSP75_WL;
extern  LSSwTypeDef    BSP75_DBR;
extern  TypeDef_Weght Weght;
extern  TypeDef_Load   Load;
extern TIM_HandleTypeDef htim2;  // объявлен CubeMX в main.c
extern  uint8_t   KL_Status1_MC2;
extern  TypeDef_Accel      AccelX;
extern  TypeDef_Accel      AccelY;
extern  ValidityTypeDef   AxValid;
extern  ValidityTypeDef   AyValid;
extern  int16_t   DSC_OffSet_AccY;
extern  int16_t   DSC_OffSet_AccX;
extern  int16_t   Delta_OmegaZ;
extern  int16_t   Derivative_VX_est;
extern  LSSwTypeDef    BTS142_GNDF;
extern  OffsetTypeDef SASdrift;
extern  int16_t   OmegaZ_Des_MC2;
extern  int16_t   Acc_X_MC2;
int16_t   Acc_Y_est_MC2;
uint8_t   DSC_Flags2_MC2;
#endif

#ifdef   __AxisR_Compile
extern  uint8_t    TSCAE_Prior1;
extern  uint16_t   Speed_FrontAxel;
extern  int16_t   OmegaZ_Des;  // желаемая OmegaZ
extern  DifTypeDef      RearDif;
extern  DifTypeDef      TrailerDif;
extern  OffsetTypeDef TrailerP;
extern  LSSwTypeDef   BSP75_LASR;
extern  LSSwTypeDef   BTS142_GNDR;
#endif

/* ----- Определения программирования Flash ------------*/
//extern volatile TypeDef_PGM PGM;  // объявлен  в PGM.c
_ByteBits_  _PGM_Flags;
#define     PGM_Flags        _PGM_Flags.Byte
//#define     PGM_STM2_Step1   _PGM_Flags.Bits.b0
//#define     PGM_STM2_Step2   _PGM_Flags.Bits.b1
#define     PGM_Ask          _PGM_Flags.Bits.b2
#define     PGM_Request_V8   _PGM_Flags.Bits.b3
#define     PGM_Active_V8    _PGM_Flags.Bits.b4
#define     PGM_STM2_Request _PGM_Flags.Bits.b5
#define     PGM_STM2_Active  _PGM_Flags.Bits.b6
#define     PGM_Disable_CANJ _PGM_Flags.Bits.b7

uint8_t   PGM_Active = 0;
uint8_t   STM2_PGM_Active = 0;
uint8_t   PGM_Interface;     // Выбранный интерфейс

#ifdef __Square_Board
_ByteBits_  _SPI_Flags;
#define      SPI_Flags        _SPI_Flags.Byte
#define      ICM_Int_Request  _SPI_Flags.Bits.b0
#define      WR_EPROM_Request _SPI_Flags.Bits.b1
#define      RD_EPROM_Request _SPI_Flags.Bits.b2
#endif

uint16_t   Pcb_Test_BrPS_Val;
uint8_t    TruckSim_Cnt;
uint8_t    TruckSim_PA;
uint8_t    CANS_InitState;
/* -----   ********************  -----------------*/
void   HAL_ADC_ConvCpltCallback(ADC_HandleTypeDef* hadc)
{
 	 if(!PGM_Active)
	 MyHallTab[0](hadc);
}
void   HAL_ADC_ErrorCallback(ADC_HandleTypeDef *hadc)
{
	if(!PGM_Active)
	MyHallTab[17](hadc);
}
/*  CAN Error callback. */
void HAL_CAN_ErrorCallback(CAN_HandleTypeDef* hcan)
{
	if(!PGM_Active)
	MyHallTab[1](hcan);
}
/*  CAN Receives complete callback in non blocking mode */
void HAL_CAN_RxCpltCallback(CAN_HandleTypeDef* hcan)
{
	if(!PGM_Active)
	MyHallTab[2](hcan);
}
/* CAN Transmission complete callback in non blocking mode */
void HAL_CAN_TxCpltCallback(CAN_HandleTypeDef* hcan)
{
	if(!PGM_Active)
	MyHallTab[3](hcan);
}
/* memtomem_dma1_channel2 complete callback in non blocking mode */
void HAL_DMAcrc_CpltCallback(DMA_HandleTypeDef *hdma)
{
	if(!PGM_Active)
	MyHallTab[4](hdma);
}
void HAL_FLASH_EndOfOperationCallback(uint32_t ReturnValue)
{
	if(!PGM_Active)
	      MyHallTab[5](ReturnValue);
//	else  PGM_FLASH_EndOfOperation(ReturnValue);
}
void HAL_FLASH_OperationErrorCallback(uint32_t ReturnValue)
{
	if(!PGM_Active)
	      MyHallTab[6](ReturnValue);
//	else  PGM_FLASH_Error(ReturnValue);
}
void HAL_PWR_PVDCallback(void)
{
	if(!PGM_Active)
	MyHallTab[12]();
}
/*TIM Update event callback */
void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim)
{
	if(!PGM_Active)
	MyHallTab[7](htim);
}

void HAL_TIM_OC_DelayElapsedCallback(TIM_HandleTypeDef *htim)
{
	if(!PGM_Active)
	MyHallTab[13](htim);
}
/* Input Capture callback in non blocking mode  */
void HAL_TIM_IC_CaptureCallback(TIM_HandleTypeDef *htim)
{
	if(!PGM_Active)
	MyHallTab[18](htim);
}

/*  UART_Error callback. */
void HAL_UART_ErrorCallback(UART_HandleTypeDef *huart)
{
	if(!PGM_Active)
	     MyHallTab[8](huart);
}
/*  UART Rx Transfer completed callback. */
void HAL_UART_RxCpltCallback(UART_HandleTypeDef *huart)
{
	if(!PGM_Active)
		 MyHallTab[9](huart);
}
/* UART Tx Transfer completed callback. */
void HAL_UART_TxCpltCallback(UART_HandleTypeDef *huart)
{
	if(!PGM_Active)
	     MyHallTab[10](huart);
}

//------------------------------------------------------------------
void     ADC_Wheel(WheelTypeDef* Wheelx)
{
	Wheelx->ADC.A1_Sum += (uint16_t)*(Wheelx->ADC.A1_Ch);
	Wheelx->ADC.A2_Sum += (uint16_t)*(Wheelx->ADC.A2_Ch);
	Wheelx->ADC.N++;
} // end ADC_Wheel()

void     ADC_MDT(WheelTypeDef* Wheelx)
{
	// для теста модуляторов
	if(Wheelx->MDT.AV.On)
	{  Wheelx->ADC.AV_On_Val = (uint16_t)*(Wheelx->ADC.AV_Ch);
	   Wheelx->MDT.AV.Oss.On_Val = Wheelx->ADC.AV_On_Val /__Koss;
	}
	else
	{  Wheelx->ADC.AV_Off_Val = (uint16_t)*(Wheelx->ADC.AV_Ch);
	   Wheelx->MDT.AV.Oss.Off_Val = Wheelx->ADC.AV_Off_Val /__Koss;
	}
	if(Wheelx->MDT.EV.On)
	{  Wheelx->ADC.EV_On_Val = (uint16_t)*(Wheelx->ADC.EV_Ch);
	   Wheelx->MDT.EV.Oss.On_Val = Wheelx->ADC.EV_On_Val /__Koss;
	}
	else
	{  Wheelx->ADC.EV_Off_Val = (uint16_t)*(Wheelx->ADC.EV_Ch);
	   Wheelx->MDT.EV.Oss.Off_Val = Wheelx->ADC.EV_Off_Val /__Koss;
	}
} // end ADC_MDT()

void     ADC_Dif(DifTypeDef* Dif)
{
	if(Dif->St_On)
	{ Dif->ADC.On_Val = (uint16_t)*(Dif->ADC_Ch);
      Dif->Oss.On_Val =	Dif->ADC.On_Val /__Koss;
	}
	else
    { Dif->ADC.Off_Val = (uint16_t)*(Dif->ADC_Ch);
      Dif->Oss.Off_Val = Dif->ADC.Off_Val /__Koss;
    }
}  // end ADC_MDT()

void     ADC_GNDsw (LSSwTypeDef* Sw)
{
	if(Sw->In)
	{  Sw->ADC.On_Val = (uint16_t)*(Sw->ADC_Ch); // снимаем ADC
	   Sw->Oss.On_Val = Sw->ADC.On_Val /__Koss;
	   GNDsw_Test_Analysis(Sw); // обрабатываем данные ацепирования
	   if(Test_GND_Active)    // смена состояния при тестах
	        Sw->In = 0;      // смена On -> Off
	}
	else
	{  Sw->ADC.Off_Val  = (uint16_t)*(Sw->ADC_Ch); // снимаем ADC
	   Sw->Oss.Off_Val = Sw->ADC.Off_Val /__Koss;
	   GNDsw_Test_Analysis(Sw); // обрабатываем данные ацепирования
	   if(Test_GND_Active)    // смена состояния при тестах
	        Sw->In = 1;      // смена Off -> On
	}
#ifdef   __AxisF_Compile
	BTS142_GNDF_OnOff();
#else
	BTS142_GNDR_OnOff();
#ifdef __Square_Board
	BSP75_LASR_OnOff();
#endif
#endif
}   // end ADC_GNDsw()

void   myHAL_ADC_Start_DMA(ADC_HandleTypeDef* hadc, uint32_t* pData, uint32_t Length)
{ // замена библиотечной HAL_ADC_Start_DMA
	// время выполнения 3mks выигрыш 4мкс
    /* Enable ADC DMA mode */
    SET_BIT(hadc->Instance->CR2, ADC_CR2_DMA);
    /* Start the DMA channel */
    __HAL_DMA_DISABLE(hadc->DMA_Handle);
    hadc->DMA_Handle->Instance->CNDTR = 16;
    hadc->DMA_Handle->Instance->CPAR = (uint32_t)&hadc->Instance->DR;
    hadc->DMA_Handle->Instance->CMAR = (uint32_t)pData;
    __HAL_DMA_ENABLE_IT(hadc->DMA_Handle, (DMA_IT_TC | DMA_IT_TE));
    /* Enable the Peripheral */
    __HAL_DMA_ENABLE(hadc->DMA_Handle);
}

void   myHAL_ADC_ConvCpltCallback(ADC_HandleTypeDef* hadc)
{ // время выполнения 3,3mks
  // ADC clock 9MHz
  // время повторения 150мкс при ADC_SAMPLETIME_71CYCLES_5
  // время повторения 100мкс при ADC_SAMPLETIME_41CYCLES_5
	if(DIA.TP_Select == 2)	_TP_On;
	cADC.Rx_Cnt++;
#ifdef   __AxisF_Compile
	ADC_Wheel(&Wheel_FL);
	ADC_Wheel(&Wheel_FR);
	ADC_Button(&SW_ABS);
	ADC_Button(&SW_DIA);
	Power_ADC();
#endif
#ifdef   __AxisR_Compile
	ADC_Wheel(&Wheel_RL);
	ADC_Wheel(&Wheel_RR);
	ADC_Button(&SW_ASR);
	ADC_Button(&SW_TSET);
#endif
#ifdef   __Axis3_Compile
	ADC_Wheel(&Wheel_3L);
	ADC_Wheel(&Wheel_3R);
#endif
	myHAL_ADC_Start_DMA(hadc, (uint32_t*)ADC_Data, (uint32_t)0x10U); // 5mks
	if(DIA.TP_Select == 2) _TP_Off;
} // end myHAL_ADC_ConvCpltCallback()

void   myHAL_ADC_ErrorCallback(ADC_HandleTypeDef *hadc)
{
	cADC.Err_Cnt++;
}

void myHAL_CAN_ErrorCallback(CAN_HandleTypeDef* hcan)
{
#if defined __CAN_j1939
	if(hcan == &hCANJ) // ДАТЧИКИ
	{
		cCANJ.Err_Cnt++;
		cCANJ.Err_State = HAL_CAN_GetError(hcan);
		if(!vCANJ.Fail_Flag)
		{
	    // чтобы не долбил передатчик
	    // Set the no automatic retransmission
			SET_BIT(hcan->Instance->MCR, CAN_MCR_NART);
			vCANJ.Fail_Flag = 1; // признак нарушения CAN
		}
		__HAL_CAN_ENABLE_IT(hcan, CAN_IT_FMP0);
	}
#endif
#if defined __AGS_SAS
	if(hcan == &hCANS) // ДАТЧИКИ
	{
		cCANS.Err_Cnt++;
		if(!vCANS.Fail_Flag)
		{
	    // чтобы не долбил передатчик
	    // Set the no automatic retransmission
			SET_BIT(hcan->Instance->MCR, CAN_MCR_NART);
			vCANS.Fail_Flag = 1; // признак нарушения CAN
		}
		__HAL_CAN_ENABLE_IT(hcan, CAN_IT_FMP1);
	}
#endif
#ifdef __CAN_Trailer
	if(hcan == &hCANT) // ПРИЦЕП
	{
		cCANT.Err_Cnt++;
		cCANT.Err_State = _Lo_32(hcan->ErrorCode);
		__HAL_CAN_ENABLE_IT(hcan, CAN_IT_FMP1);        // нужно ?
	}
#endif
} // END HAL_CAN_ErrorCallback


void myHAL_CAN_RxCpltCallback(CAN_HandleTypeDef* hcan)
{
#if defined __CAN_j1939
	if(hcan == &hCANJ) // ДАТЧИКИ
	{  // время выполнения 6,5mks
		if(DIA.TP_Select == 12)	_TP_On;
		cCANJ.Rx_State = HAL_CAN_GetState(hcan);
		cCANJ.Rx_Cnt++;
		CANJ_Receive();
		// Enable FIFO 0 overrun and message pending Interrupt
		__HAL_CAN_ENABLE_IT(hcan, CAN_IT_FMP0);
		if(DIA.TP_Select == 12)	_TP_Off;
    } // end CAN_j1939
#endif


#if defined __AGS_SAS

//--------------------ДАТЧИКИ---------------------------
	 // время выполнения 3,5mks
	if(hcan == &hCANS) // ДАТЧИКИ
	{   if(DIA.TP_Select == 13)	_TP_On;
		cCANS.Rx_State = HAL_CAN_GetState(hcan);
		cCANS.Rx_Cnt++;
		vCANS.Rx_ID = CANS_Rx0_Message.ExtId;
		vCANS.Rx_Tout = 0; //Time Out приема
		// анализируем что приняли
		if(vCANS.Rx_ID == _ExtID_make(ACCEL_Pri,ACCEL_PGN,ACCEL_Adr))
		{
			for(uint8_t i = 0; i < 8; ++i)
				CANS.SENS.Data[i] = CANS_Rx0_Message.Data[i];
			// Accel ось X
			AccelX.Last = AccelX.Value;
			CANS.SENS.AccelX = ((int16_t)CANS_Rx0_Message.Data[1]<<8) +
			                    (int16_t)CANS_Rx0_Message.Data[0];
			// Accel ось Y
			AccelY.Last = AccelY.Value;
			CANS.SENS.AccelY = ((int16_t)CANS_Rx0_Message.Data[3]<<8) +
			                   (int16_t)CANS_Rx0_Message.Data[2];
			// Accel ось Z
			CANS.SENS.AccelZ = ((int16_t)CANS_Rx0_Message.Data[5]<<8) +
			                   (int16_t)CANS_Rx0_Message.Data[4];
			CANS.AGS.STM_TEMP = CANS_Rx0_Message.Data[6];
			CANS.AGS.IAM_TEMP = CANS_Rx0_Message.Data[7];
			CANS.AGS.Acc_Tout = 0;
		} // end Accel
		if(vCANS.Rx_ID == _ExtID_make(GYRO_Pri,GYRO_PGN,GYRO_Adr))
		{
			// Gyro ось X
			CANS.SENS.GyroX = ((int16_t)CANS_Rx0_Message.Data[1]<<8) +
			                   (int16_t)CANS_Rx0_Message.Data[0];
			// Gyro ось Y
			CANS.SENS.GyroY = ((int16_t)CANS_Rx0_Message.Data[3]<<8) +
			                   (int16_t)CANS_Rx0_Message.Data[2];
			// Gyro ось Z
			CANS.SENS.GyroZ = ((int16_t)CANS_Rx0_Message.Data[5]<<8) +
			                   (int16_t)CANS_Rx0_Message.Data[4];
			CANS.AGS.Error = ((int16_t)CANS_Rx0_Message.Data[7]<<8) +
	                          (int16_t)CANS_Rx0_Message.Data[6];
			CANS.AGS.Gyro_Tout = 0;
		} // end Gyro
		if(vCANS.Rx_ID == _ExtID_make(Steer_Pri,Steer_PGN,Steer_Adr))
		{	CANS.SAS.Tout = 0;
		    CAN_SAS_Fail = 0;
			int16_t SA = ((int16_t)CANS_Rx0_Message.Data[1]<<8) +
                          (int16_t)CANS_Rx0_Message.Data[0];
			int16_t ER = ((int16_t)CANS_Rx0_Message.Data[3]<<8) +
                          (int16_t)CANS_Rx0_Message.Data[2];
			if((_Hi_16(SA) != 0x7F) ||
			   (ER == 0xFFFF))
			{ // нет признаков ошибки
			  SASdata_Fail = 0;
			  SAS.value = SA;
			  if(!SAS.MDC_Phase)
			      SAS.MDC_Phase = 3; // фаза сравнения
			}
			else
			{ SASdata_Fail = 1;
			  SAS.value = 0;
			}
			for(uint8_t i = 0; i < 8; ++i)
			CANS.SAS.Data[i] = CANS_Rx0_Message.Data[i];
			CANS.SAS.Error = CANS.SAS.Data[6]*256+
					         CANS.SAS.Data[7];
		} // end SAS

		if(vCANS.Rx_ID == _ExtID_make(PS_Pri,PS_PGN,PS_Adr))
		{   CANS.BPS.Tout = 0;
		    CAN_BPS_Fail = 0;
		    CAN_ECAS_PS_Fail = 0;
		    CANS.BPS.Value = ((uint16_t)CANS_Rx0_Message.Data[1]<<8) +
			                  (uint16_t)CANS_Rx0_Message.Data[0];
		    // флаг TruckSim_Active по счетчику TruckSim_Cnt
		    TruckSim_PA = CANS_Rx0_Message.Data[2];
		    TruckSim_Cnt = CANS_Rx0_Message.Data[3];
		    if(TruckSim_Cnt == 4) TruckSim_Active = 1;
		    if(!TruckSim_Cnt)     TruckSim_Active = 0;
		    // BPS используется как датчик ECAS
		    ECAS_PS_Find = 1;
		} // end PS

		// STEND TruckSim
		if(vCANS.Rx_ID == _ExtID_make(VDC2_Pri,VDC2_PGN,VDC2_Adr))
		{
		  for(uint8_t i = 0; i < 8; ++i)
			 CANS.Stend_Test[i] = CANS_Rx0_Message.Data[i];
		}

		// измерительные датчики давления
		if(vCANS.Rx_ID == _ExtID_make(PS_Pri,PS_PGN,PS1_Adr))
		{  CANS.BPS.PS1 = ((uint16_t)CANS_Rx0_Message.Data[1]<<8) +
			               (uint16_t)CANS_Rx0_Message.Data[0];
		   CANS.BPS.PSadr = PS1_Adr;
		} // end PS1
		if(vCANS.Rx_ID == _ExtID_make(PS_Pri,PS_PGN,PS2_Adr))
		{  CANS.BPS.PS2 = ((uint16_t)CANS_Rx0_Message.Data[1]<<8) +
			               (uint16_t)CANS_Rx0_Message.Data[0];
		   CANS.BPS.PSadr = PS2_Adr;
		} // end PS2
		if(vCANS.Rx_ID == _ExtID_make(PS_Pri,PS_PGN,PS3_Adr))
		{  CANS.BPS.PS3 = ((uint16_t)CANS_Rx0_Message.Data[1]<<8) +
			               (uint16_t)CANS_Rx0_Message.Data[0];
		   CANS.BPS.PSadr = PS3_Adr;
		} // end PS3
		if(vCANS.Rx_ID == _ExtID_make(PS_Pri,PS_PGN,PS4_Adr))
		{  CANS.BPS.PS4 = ((uint16_t)CANS_Rx0_Message.Data[1]<<8) +
			               (uint16_t)CANS_Rx0_Message.Data[0];
		   CANS.BPS.PSadr = PS4_Adr;
		} // end PS4

		if(vCANS.Rx_ID == _ExtID_make(RdCAN_Pri,RdCAN_PGN,RdCAN_Adr))
		{  for (uint8_t i = 0; i < 8; i++)
		   AGS.CAN_RxData[i] = CANS_Rx0_Message.Data[i];
		} // end RdCAN

		// UpGrade AGS  SAS
		if(vCANS.Rx_ID == _ExtID_make(PGM_Pri,PGM_PGN3,AGS_SA) || //Ask init AGS
		   vCANS.Rx_ID == _ExtID_make(PGM_Pri,PGM_PGN2,AGS_SA) || //Ask PGM  AGS
		   vCANS.Rx_ID == _ExtID_make(PGM_Pri,PGM_PGN3,SAS_SA) || //Ask init SAS
		   vCANS.Rx_ID == _ExtID_make(PGM_Pri,PGM_PGN2,SAS_SA))   //Ask PGM  SAS
		{
		   UpGrade_CAN_Rx = 1;
		   for (uint8_t i = 0; i < 8; i++)
		   UpGrade.CAN_RxData[i] = CANS_Rx0_Message.Data[i];
		   UpGrade.CAN_RxCnt++;
		}

		// Ask Write_IEE
		if(vCANS.Rx_ID == _ExtID_make(WrCFG_Pri,WrCFG_PGN,AGS_SA) ||
		   vCANS.Rx_ID == _ExtID_make(WrCFG_Pri,WrCFG_PGN,SAS_SA))
		{
		  BridgeCAN_Ask = 1;
		}
		//Ask BrData
		if(vCANS.Rx_ID == _ExtID_make(Bridge_Pri,(BrData_PGN | AGS_SA),AGS_SA) ||
		   vCANS.Rx_ID == _ExtID_make(RdCAN_Pri,RdCAN_PGN,AGS_SA) ||
		   vCANS.Rx_ID == _ExtID_make(Bridge_Pri,(BrData_PGN | SAS_SA),SAS_SA) ||
	       vCANS.Rx_ID == _ExtID_make(RdCAN_Pri,RdCAN_PGN,SAS_SA)) //
		{ BridgeCAN_Ask = 1;
		  for (uint8_t i = 0; i < 8; i++)
		  BridgeCAN.OutBuf[i] = CANS_Rx0_Message.Data[i];
		}

	// Enable FIFO 1 overrun and message pending Interrupt
		__HAL_CAN_ENABLE_IT(hcan, CAN_IT_FMP1);
		if(DIA.TP_Select == 13)	_TP_Off;
	} // end ДАТЧИКИ
#endif
//-------------------------------------------------------
#ifdef __CAN_Trailer
	if(hcan == &hCANT) // ПРИЦЕП
	{   if(DIA.TP_Select == 12)	_TP_On;
		cCANT.Rx_State = HAL_CAN_GetState(hcan);
		cCANT.Rx_Cnt++;
		TrailerCAN_Receive();
		// Enable FIFO 1 overrun and message pending Interrupt
		__HAL_CAN_ENABLE_IT(hcan, CAN_IT_FMP1);
		if(DIA.TP_Select == 12)	_TP_Off;
	} // end ПРИЦЕП
#endif
}

void myHAL_CAN_TxCpltCallback(CAN_HandleTypeDef* hcan)
{
#if defined __CAN_j1939
	if(hcan == &hCANJ) // ДАТЧИКИ
	{	cCANJ.Tx_State = HAL_CAN_GetState(hcan);
		cCANJ.Tx_Cnt++;
		vCANJ.Tx_Tout = 0;
	// сбрасываем флаг и восстанавливаем нормальную работу
		if(vCANJ.Fail_Flag)
		{  vCANJ.Fail_Flag = 0;
		   // при BusOff перестаются вырабатываться Rx Int
		   __HAL_CAN_ENABLE_IT(hcan, CAN_IT_FMP0);
		   // CLR the no automatic retransmission
		   CLEAR_BIT(hcan->Instance->MCR, CAN_MCR_NART);
		}
		CANJ_Transmit_Cmpl = 1;
	}
#endif
#if defined __AGS_SAS
	if(hcan == &hCANS) // ДАТЧИКИ
	{	cCANS.Tx_State = HAL_CAN_GetState(hcan);
		cCANS.Tx_Cnt++;
		vCANS.Tx_Tout = 0;
	// сбрасываем флаг и восстанавливаем нормальную работу
		if(vCANS.Fail_Flag)
		{  vCANS.Fail_Flag = 0;
			// при BusOff перестаются вырабатываться Rx Int
			__HAL_CAN_ENABLE_IT(hcan, CAN_IT_FMP0);
			// CLR the no automatic retransmission
			CLEAR_BIT(hcan->Instance->MCR, CAN_MCR_NART);
		}
	}
#endif
#if defined __CAN_Trailer
	if(hcan == &hCANT) // ПРИЦЕП
	{	cCANT.Tx_State = HAL_CAN_GetState(hcan);
		cCANT.Tx_Cnt++;
		vCANT.Tx_Tout = 0;
		__HAL_CAN_ENABLE_IT(hcan, CAN_IT_FMP1);  // нужно
	}
#endif
}

#define   __CRC_Ok_Thr     5 //2c
void myHAL_DMAcrc_CpltCallback(DMA_HandleTypeDef *hdma)
{ // время выполнения 10mks 15
	if(DIA.TP_Select == 3)	_TP_On;
	switch(CRC_Sel)
	{
	case PGM_CRC_Cont:
	case CFG_CRC_Cont:
		HAL_CRC_Accumulate(&hcrc, CRC_Buff, CRC_BlSize);
		break;
	case PGM_CRC_End:
		Flash_CRC = HAL_CRC_Accumulate(&hcrc, CRC_Buff, (uint32_t)CRC_BlSize);
#ifdef __CRC_PGM_Enable
		if(Flash_CRC != constFlashCRC)
		{ PgmCRC_Fail = 1;
		  CRC_Ok_Cnt = 0;
		}
		else
		{ if(PgmCRC_Fail &&
			 CRC_Ok_Cnt++ > __CRC_Ok_Thr)
			PgmCRC_Fail = 0;
		}
#endif
		CRC_Sel = CFG_CRC_Start;
		break;
	case CFG_CRC_End:
		Config_CRC = HAL_CRC_Accumulate(&hcrc, CRC_Buff, (uint32_t)CRC_BlSize);
		uint32_t Tmp = CONFIG_Read(ADDR_CFG_CRC);
		if(Tmp != Blank)
		{ if(Config_CRC != Tmp)
			 CfgCRC_Fail = 1;
		}
		CRC_Sel = PGM_CRC_Start;
		cCONFIG.Rx_Cnt++;
		break;
	}
	if(DIA.TP_Select == 3)	_TP_Off;
}

void myHAL_PWR_PVDCallback(void)
{
	if(__HAL_PWR_GET_FLAG(PWR_FLAG_PVDO))	VDD_Fail = 1;
	else	VDD_Fail = 0;
}

void myHAL_FLASH_EndOfOperationCallback(uint32_t ReturnValue)
{
//ReturnValue
//- Pages Erase: Address of the page which has been erased
//(if 0xFFFFFFFF, it means that all the selected pages have been erased)
//- Program: Address which was selected for data program
///	HAL_GPIO_WritePin(CANTH_EN_GPIO_Port, CANTH_EN_Pin, GPIO_PIN_RESET);
	cCONFIG.Tx_Cnt++;
	cCONFIG.Tx_State = _B1_32(ReturnValue);
	FLASH_Cplt = 1;

	//!!!!!запустить HAL_FLASH_Program_IT  нельзя т.к. в HAL_FLASH_IRQHandler
	// в конце запрещаются прерывания
    // !!!!!Нельзя HAL_FLASH_Lock();?????
}

void myHAL_FLASH_OperationErrorCallback(uint32_t ReturnValue)
{
// возникает при записи в не стертую ячейку
	cCONFIG.Err_Cnt++;
	FLASH_Cplt = 1;
}

void myHAL_TIM_OC_DelayElapsedCallback(TIM_HandleTypeDef *htim)
{
	if(htim == &htim4)
	{ // приоритет 2 субприор 2
	  if(htim->Channel == HAL_TIM_ACTIVE_CHANNEL_3)
	  {	// время выполнения 12-18mks
		  if(DIA.TP_Select == 4)	_TP_On;
		  MDT_Results_ADC();
		  HAL_TIM_OC_Stop(htim, TIM_CHANNEL_3);
		  if(DIA.TP_Select == 4)	_TP_Off;
	  }
	  if(htim->Channel == HAL_TIM_ACTIVE_CHANNEL_2)
	  {   // время выполнения 3mks
		  if(DIA.TP_Select == 5)	_TP_On;
		  LowSide_Impuls();
	      LSSw_Test_Active = 0; // после
	      HAL_TIM_OC_Stop(htim, TIM_CHANNEL_2);
		  if(DIA.TP_Select == 5)	_TP_Off;
	  }
#ifdef  __LIM_Speed
	  if(htim->Channel == HAL_TIM_ACTIVE_CHANNEL_4)
	  {  Proportion_Valve();
	//     HAL_TIM_OC_Stop(htim, PK_CHANNEL);
	  }
#endif
	}
	if(htim == &htim1)
	{ // время выполнения 3mks
	  if(DIA.TP_Select == 6)	_TP_On;
#ifdef   __AxisF_Compile
	  if(htim->Channel == HAL_TIM_ACTIVE_CHANNEL_1)
	  {	 WheelADC (&Wheel_FL, &hTimSS);
	     HAL_TIM_OC_Stop(htim, TIM_CHANNEL_1);
	  }
	  if(htim->Channel == HAL_TIM_ACTIVE_CHANNEL_2)
	  {  WheelADC (&Wheel_FR, &hTimSS);
         HAL_TIM_OC_Stop(htim, TIM_CHANNEL_2);
	  }
#endif
#ifdef   __AxisR_Compile
	  if(htim->Channel == HAL_TIM_ACTIVE_CHANNEL_1)
	  {	 WheelADC (&Wheel_RL, &hTimSS);
         HAL_TIM_OC_Stop(htim, TIM_CHANNEL_1);
      }
	  if(htim->Channel == HAL_TIM_ACTIVE_CHANNEL_2)
	  {  WheelADC (&Wheel_RR, &hTimSS);
         HAL_TIM_OC_Stop(htim, TIM_CHANNEL_2);
	  }
#endif
#ifdef   __Axis3_Compile

#endif
	  if(DIA.TP_Select == 6)	_TP_Off;
	}
}

void myHAL_TIM_IC_CaptureCallback(TIM_HandleTypeDef *htim)
{
	if(htim == &hTimSS)
	{
	  if(htim->Channel == HAL_TIM_ACTIVE_CHANNEL_1)
	  { //_TP2_On;
#ifdef   __AxisF_Compile
        WheelCapture (&Wheel_FL, &hTimSS);
#else
        WheelCapture (&Wheel_RL, &hTimSS);
#endif
	  }
	  if(htim->Channel == HAL_TIM_ACTIVE_CHANNEL_2)
	  {
#ifdef   __AxisF_Compile
        WheelCapture (&Wheel_FR, &hTimSS);
#else
        WheelCapture (&Wheel_RR, &hTimSS);
#endif
	  }
	}
#ifdef   __Axis3_Compile

#endif
	if(htim == &htimB7)
	{
	  if(htim->Channel == HAL_TIM_ACTIVE_CHANNEL_3)
	  {
#ifdef   __LIM_Speed
		 TerminalB7_Capture (htim);
#endif
	  }
	}
#ifdef __Invense
	if(htim == &htim4)
	{
#ifdef __Rectangular_Board  // прямоугольная плата
	  if(htim->Channel == HAL_TIM_ACTIVE_CHANNEL_1)
	  {
		SPI_AG.Adr = ACCEL_XOUT_H;
		SPI_AG.Sise  = 15;
		ICM_SPI1_Read(&SPI_AG);
	  }
#endif
	}
#endif
}

// __IO uint32_t CCER;            /*!< TIM capture/compare enable register
/* ------- Get TIM IC polarity -----------
0: capture is done on a rising edge of IC
1: capture is done on a falling edge of IC
*/
#define __HAL_TIM_GET_CAPTUREPOLARITY(__HANDLE__, __CHANNEL__)             \
   (__HANDLE__)->Instance->CCER & (uint32_t)(TIM_CCER_CC1P << __CHANNEL__) \

void Set_Capture (WheelTypeDef* WheelXX)
{
   // Sets the TIM Capture x input polarity on runtime
   __HAL_TIM_SET_CAPTUREPOLARITY(&hTimSS, WheelXX->Capture.Channel,
	                              TIM_INPUTCHANNELPOLARITY_FALLING);
} // end Set_Capture(&Wheel_XX)
void     WheelSetCompare (WheelTypeDef* WheelXX, TIM_HandleTypeDef* htim)
{
	WheelXX->Capture.DelT =  (uint16_t)__HAL_TIM_GET_COUNTER(htim) +
			                              WheelXX->Capture.Period /4;
	if(WheelXX->Capture.Channel == TIM_CHANNEL_1)
	{
		__HAL_TIM_SET_COMPARE(htim, TIM_CHANNEL_1, WheelXX->Capture.DelT);
		     HAL_TIM_OC_Start(htim, TIM_CHANNEL_1);
		 HAL_TIM_OC_Start_IT (htim, TIM_CHANNEL_1);
	}
	if(WheelXX->Capture.Channel == TIM_CHANNEL_2)
	{
		__HAL_TIM_SET_COMPARE(htim, TIM_CHANNEL_2, WheelXX->Capture.DelT);
	         HAL_TIM_OC_Start(htim, TIM_CHANNEL_2);
		 HAL_TIM_OC_Start_IT (htim, TIM_CHANNEL_2);
	}
}

void     WheelADC (WheelTypeDef* WheelXX, TIM_HandleTypeDef* htim)
{
	if(WheelXX->Capture.Polarity)//__HAL_TIM_GET_CAPTUREPOLARITY(htim, WheelXX->Capture.Channel))
	{ // --- capture falling edge ---
      WheelXX->Capture.A1_Upoz = (uint16_t)*(WheelXX->ADC.A1_Ch);
      WheelXX->Capture.A2_Upoz = (uint16_t)*(WheelXX->ADC.A2_Ch);
	}
    else
    { // --- capture rising edge ---
      WheelXX->Capture.A1_Uneg = (uint16_t)*(WheelXX->ADC.A1_Ch);
      WheelXX->Capture.A2_Uneg = (uint16_t)*(WheelXX->ADC.A2_Ch);
      int32_t Tmp = WheelXX->Capture.A1_Upoz - WheelXX->Capture.A1_Uneg;
      // определение амплитуды
      if(Tmp > 0)
      	   WheelXX->Capture.Uamp1 = Tmp;
      else WheelXX->Capture.Uamp1 = 0;
      Tmp = WheelXX->Capture.A2_Uneg - WheelXX->Capture.A2_Upoz;
      if(Tmp > 0)
      	   WheelXX->Capture.Uamp2 = Tmp;
      else WheelXX->Capture.Uamp2 = 0;
      // амплитуда на входе фильтра
	  WheelXX->Test.Ua_c = WheelXX->Capture.Uamp1 + WheelXX->Capture.Uamp2;
	  WheelXX->Test.Ua_Sum += WheelXX->Test.Ua_c;
	  WheelXX->Test.Ua_N++;
    }
}
uint16_t  Wheel_Safe_dT (WheelTypeDef* WheelXX)
{
#define   __Cnt_Safe_dT_Const 0x11F200  //0x21F200  //75*5 при 23km/h
#define   __Cnt_Safe_dT_Sp    0x1700	//23km/h
#define   __Period_Max  0xFFFF
#define   __Period_Min  0x0300 //155km/h 0x0200 //232km/h
#define   __K1_Tdec   66   //17000/256
#define   __K2_Tdec   358  //1,4*256
#define   __K1_Tinc   33   //8600/256
#define   __K2_Tinc   384  //1,5*256
#define   __Kch_Tinc  308  // 61m/c2 282  // 17m/c2
#define   __Kch_Tdec  200  //2G 230 /256; // 6m/c2
#define   __Tfirst_Min    0x7530 //4km/h
    uint16_t kT;
    uint8_t  dTfail = 0;
    uint16_t T = WheelXX->Capture.Period;

  if(WheelXX->Capture.Top)
  { // разгон уменьшение периода T2:=Round(T0/((T0/17000)+1,4));
    kT = WheelXX->Capture.Top / __K1_Tdec + __K2_Tdec;
    // нижняя граница периода
	WheelXX->Capture.Tlow = (uint32_t)WheelXX->Capture.Top *256 / kT;
	if(WheelXX->Capture.Speed)
	{
	  if(WheelXX->Capture.Tlow <__Period_Min)
	     WheelXX->Capture.Tlow =__Period_Min;
	  // торможение увеличение периода T2:=Round(T0*((T0/8600)+1,5));
	  kT = WheelXX->Capture.Top / __K1_Tinc + __K2_Tinc;
      // верхняя граница периода
	  WheelXX->Capture.Thigh = (uint32_t)WheelXX->Capture.Top * kT /256;
	  if(WheelXX->Capture.Thigh >__Period_Max)
	     WheelXX->Capture.Thigh =__Period_Max;
      // проверка периода и замена периода если dTfail
	  if(T > WheelXX->Capture.Thigh)
	  {  T = (uint32_t)WheelXX->Capture.Top * __Kch_Tinc /256;
	    dTfail = 1;
	  }
	  if(T < WheelXX->Capture.Tlow)
	  {  T = (uint32_t)WheelXX->Capture.Top * __Kch_Tdec /256;
	    dTfail = 1;
	  }
      if(dTfail &&
    	 !WheelXX->ABS.Active)
      { // не нормальный период
	    WheelXX->Capture.FailTcnt++;   // счетчик для ошибки
	    WheelXX->State.Bits.b5 = 1;    // флаг Safe_dT
	    // установка счетчика сброса флага Safe_dT
	    uint16_t Sp = WheelXX->Capture.Speed;
	    if(Sp < __Cnt_Safe_dT_Sp)
		   Sp = __Cnt_Safe_dT_Sp;
	    WheelXX->Capture.Safe_dT_Cnt = (uint32_t)__Cnt_Safe_dT_Const / Sp;
      }
	}
	else
	{ // при блокировке ограничиваем первое вычисление скорости 4км/ч
	    if(T < __Tfirst_Min)
	       T = __Tfirst_Min;
	}
  }
    WheelXX->Capture.Top = T;
	return T;
}
void     WheelCapture (WheelTypeDef* WheelXX, TIM_HandleTypeDef* htim)
{	// 5 mks
#define   __Zero_Time    45 //  2,64km/h // 30 4km/h

	if(WheelXX->Capture.Cnt)
	{
	  if(__HAL_TIM_GET_CAPTUREPOLARITY(htim, WheelXX->Capture.Channel))
	  { // --- capture falling edge ---
		WheelXX->Capture.Polarity = 1;
		// смена CAPTURE POLARITY
	    __HAL_TIM_SET_CAPTUREPOLARITY(htim, WheelXX->Capture.Channel,
			  		                   TIM_INPUTCHANNELPOLARITY_RISING);
	    // перенос захвата в буфер
        WheelXX->Capture.Buf[WheelXX->Capture.Cnt] =
        		HAL_TIM_ReadCapturedValue(htim, WheelXX->Capture.Channel);
        // вычисление скорости
        WheelXX->Capture.Period = WheelXX->Capture.Buf[WheelXX->Capture.Cnt] -
     		                      WheelXX->Capture.Buf[0];
        // сохраняем период
        WheelXX->Test.TzBuf[WheelXX->Capture.Nz] = WheelXX->Capture.Period;
 	    // проверка периода
        WheelXX->Capture.Period = Wheel_Safe_dT(WheelXX);
        // скорость за период
        WheelXX->Capture.Speed = WheelXX->Capture.Const /
        		                 WheelXX->Capture.Period;
        // рекомбинация буфера
        WheelXX->Capture.Buf[0] = WheelXX->Capture.Buf[WheelXX->Capture.Cnt];
        WheelXX->Capture.Cnt = 1;
        // счетчик зубов
        if(WheelXX->Capture.Nz++ > WheelXX->CFG.Nz)
        { // сделан оборот колеса
          WheelXX->Capture.Nz = 0;
          WheelXX->Test.CircleDone = 1;
        }
        // запуск компаратора для сьемa ADC амплитуды
        WheelSetCompare (WheelXX, &htim1);
        // счетчик обнуления скорости
        WheelXX->Capture.CntZ = __Zero_Time; //45mc 2,64km/h
      }
      else
	  { WheelXX->Capture.Polarity = 0;
    	// --- capture rising edge ---
		 __HAL_TIM_SET_CAPTUREPOLARITY(htim, WheelXX->Capture.Channel,
				                        TIM_INPUTCHANNELPOLARITY_FALLING);
	    // перенос захвата в буфер
	    WheelXX->Capture.Buf[WheelXX->Capture.Cnt] =
	    		HAL_TIM_ReadCapturedValue(htim, WheelXX->Capture.Channel);
	    WheelXX->Capture.Cnt++;
        // запуск компаратора для сьемa ADC амплитуды
	    WheelSetCompare (WheelXX, &htim1);
	  }
	}
	else
	{ // первый захват
 	  if(__HAL_TIM_GET_CAPTUREPOLARITY(htim, WheelXX->Capture.Channel))
	  {  // --- capture falling edge ---
	     __HAL_TIM_SET_CAPTUREPOLARITY(htim, WheelXX->Capture.Channel,
		  		                         TIM_INPUTCHANNELPOLARITY_RISING);
	     WheelXX->Capture.Buf[0] = HAL_TIM_ReadCapturedValue(htim,
	 				                        WheelXX->Capture.Channel);
	     WheelXX->Capture.Cnt = 1;
         WheelXX->Capture.CntZ = __Zero_Time;
	  }
	}
	HAL_TIM_IC_Start_IT(htim, WheelXX->Capture.Channel);

} // end WheelCapture(&Wheel_XX)

void myHAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim)
{
	if(htim == &hTim5ms) // 5ms
	{   cTIM6.Tx_Cnt++;
		cTIM6.Tx_State = htim->State;
		MainLoop_5ms_Flag = 1;
	} // end if(htim == &hTim5ms)

	if(htim == &hTim1ms) // 1ms
	{

	} // end if(htim == &hTim1ms)

#ifdef   __AxisR_Compile
	if(htim == &htim4) // таймер компараторов задержек ключей
	{
		LIM.B7.Tim_HiCnt++;  // таймер B7
	}
#endif
}


void myHAL_UART_ErrorCallback(UART_HandleTypeDef *huart)
{
// ??????  возникает при CONGIG_ERASE   ????

	if(huart == &huartSCI) // UartDZ коммуникация с DD1
	{ if(cUartSCI.Err_Cnt <255)
		 cUartSCI.Err_Cnt++;
	  SCI_Err_SR = huart->Instance->SR>>1;
	  __HAL_UART_CLEAR_FLAG(huart, UART_FLAG_ORE | UART_FLAG_NE  |
	  			                   UART_FLAG_FE | UART_FLAG_PE);
	  __HAL_UART_CLEAR_PEFLAG(huart);
	  HAL_UART_Receive_DMA(huart, SCI.Rx_data + SCI.pBuff, SCI.Rx_Len);
	}// end UartSCI коммуникация с STM2

#ifdef __Diag_Kline
	if(huart == &huartKline)
	{ if(cUartDIA.Err_Cnt <255)
	 	 cUartDIA.Err_Cnt++;
	     __HAL_UART_CLEAR_PEFLAG(huart);
	  HAL_UART_Receive_DMA(huart, UartDIA.Rx_data, UartDIA.Rx_Len);
	}
#endif
}

void myHAL_UART_RxCpltCallback(UART_HandleTypeDef *huart)
{
//----------------UartSCI коммуникация с другим STM--------------------
uint8_t i;
    if(huart == &huartSCI) //
    { // время выполнения 17mks
      cUartSCI.Rx_Cnt++;
	  cUartSCI.Rx_State = huart->RxState;
	  if(DIA.TP_Select == 7)	_TP_On;
      if(cUartSCI.Rx_State == HAL_UART_STATE_READY)
      {
   	    SCI.pBuff = 0;
		if(UartSCI_Sinxr_Flag)
	    { // анализируем первый байт заголовка
	      if(SCI.Rx_data[0] == __SCI_Head_B0)
	      {// копируем в буфер и находим XOR
	        SCI_Rx_Cnt++;
	  	    SCI.Rx_XOR = 0;
	  	    for (i = 0; i < UartSCI_Rx_Length-2; i++)
	  	    { SCI_RxBuff[i] = SCI.Rx_data[i];
	  		  SCI.Rx_XOR ^= SCI_RxBuff[i];
	  	    }
		    if(SCI.Rx_XOR != SCI.Rx_data[UartSCI_Rx_Length-1])
		    { // не прошла проверка XOR
		      if(SCI.Bad_Cnt < __UartSCI_Bad)
		    	 SCI.Bad_Cnt++;
		      else SCI2_Bad = 1;
		    }
		    else
		    {  // нормальный прием
		       if(SCI.Bad_Cnt)
		    	  SCI.Bad_Cnt--;
		       else SCI2_Bad = 0;
	  	       // анализируем второй байт заголовка
#ifdef   __AxisR_Compile
	  	       if(SCI_RxBuff[1] == __SCI_Head_B1_CB)
	  	       { // приняты константы регулирования
	  	         // DSC_Const_Buf -Big Indian  HI:LO
	  	    	 DSC_Const_Adr = SCI_RxBuff[2]*256 +
	  	    			         SCI_RxBuff[3];
	             for (i = 0; i < 10; i++)
	             DSC_Const_Buf[i+DSC_Const_Adr] =	    // адрес
	            		         SCI_RxBuff[2*i+4]*256+
								 SCI_RxBuff[2*i+5];
	  	       }
	  	       else
	  	       if(SCI_RxBuff[1] == __SCI_Head_B1_CW)
	  	       {  Config_Cnt = SCI_RxBuff[2]*16777216+
	  	    	               SCI_RxBuff[3]*65536+
				               SCI_RxBuff[4]*256+
				               SCI_RxBuff[5];

	  			  DSC_Const_WrIEE_req = 1;
	  	       }
	  	       else
#endif
	           if(SCI.Rx_data[1] == __SCI_Head_B1_N)  // обязательно в конце игнорируются
	           //приняты переменные
	 	       UartSTM_Receive(); // анализируем что приняли
		    }

	        // инициализируем прием
            SCI.Rx_Len = UartSCI_Rx_Length;
            SCI2_Tout = 0;
     	    SCI.TimeOut = 0;
	      }
	      else // not SCI.Rx_data[0] == __SCI_Head_B0
	      { SCI_Loss_Sinchro++;
		    UartSCI_Sinxr_Flag = 0;                // нет синхронизации
		    SCI.Rx_Len = 1;
	      }
	    }
	    else // not Sinxr_Flag
	    { // синхронизация по байту  заголовка
	      if( SCI.Rx_data[0] == __SCI_Head_B0)
	      { UartSCI_Sinxr_Flag = 1;      // есть синхронизация
		    //прием со первого остальных байт
	        SCI.pBuff = 1;
	        SCI.Rx_Len = UartSCI_Rx_Length - 1;
	      }
	      else SCI.Rx_Len = 1;// прием одного байтa
	    } // Sinxr_Flag
	    // запуск приема
		HAL_UART_Receive_DMA(&huartSCI, SCI.Rx_data + SCI.pBuff, SCI.Rx_Len);
      } // end HAL_UART_STATE_READY
	  if(DIA.TP_Select == 7)	_TP_Off;
	} // end UartSCI коммуникация с другим STM
//--------------------------------------------------------------------------

#ifdef __Diag_Kline
	if(huart == &huartKline) // коммуникация с DiagnoseISO9141
	{ // время выполнения 18mks
	  if(DIA.TP_Select == 8)	_TP_On;
	  cUartDIA.Rx_Cnt++;
	  cUartDIA.Rx_State = huart->RxState;
	  if(cUartDIA.Rx_State == HAL_UART_STATE_READY)
	  {
		if(UartDIA_Sinxr_Flag)
		{ UartDIA.TimeOut = 0;
		  DIA.RX.Command = UartDIA.Rx_data[0];
		  DIA.RX.Num_MC = DIA.RX.Command & 0x80;
		  for (i = 0; i < __PGM_Rx_Length; i++)
		  DIA.RX.Data[i] = UartDIA.Rx_data[i];
		  if(DIA.Phase == 5)
		  { // Селектор команд диагностики
		    UartDIA_Receive();
		    UartDIA.Tx_Len = DIA_Length_TX[DIA.RX.Command & 0x1F];// +__EHO;
		    if(DIA.RX.Num_MC == __DIA_Num_MC &&
		       !Uart_BridgeCAN  &&    // ответ в Bridge_CAN() -> case __AGS_WaitDZ_Phase:
		       !AGS_UpGrade_Active && // ответ в AGS_UpGrade  -> UpGrade_UART_Ask();
			   !SAS_UpGrade_Active && // ответ в SAS_UpGrade  -> UpGrade_UART_Ask();
			   !PGM_STM2_Active &&
			   !PGM_Active &&
			   !Dia_Emul_Fl &&
			   !WR_CFG_DIA_Ask_Req) // ответ в Write_DSC_Const() -> case DSC_CFG_WrCRC_E:
	        UartDIA_Send(UartDIA.Tx_Len);
		  }
		}
	  }
	  if(DIA.TP_Select == 8)	_TP_Off;

	} // end UartDIA коммуникация с ISO9141
#endif
} // end myHAL_UART_RxCpltCallback

void myHAL_UART_TxCpltCallback(UART_HandleTypeDef *huart)
{
	if(__HAL_UART_GET_FLAG(huart, UART_FLAG_TXE))
	{  __HAL_UART_CLEAR_FLAG(huart, UART_FLAG_TXE);
	   __HAL_UART_DISABLE_IT(huart, UART_IT_TXE);
	}
	if(__HAL_UART_GET_FLAG(huart, UART_FLAG_TC))
	{  __HAL_UART_CLEAR_FLAG(huart, UART_FLAG_TC);
	  if(huart == &huartSCI) // UartSCI коммуникация с DD1
	  {	// 1mks
		cUartSCI.Tx_State = huart->gState;
		cUartSCI.Tx_Cnt++;
		UartSCI_Tx_BUSY = 0;  //???????
	  } // end TxCplt UartSCI коммуникация с другим STM

#ifdef __Diag_Kline
	  if(huart == &huartKline) //  UartDIA коммуникация с ISO9141
	  { // время выполнения 5mks
		if(DIA.TP_Select == 10)	_TP_On;
	    cUartDIA.Tx_State = huart->gState;
		cUartDIA.Tx_Cnt++;

		UartDIA_Tx_BUSY = 0;
		_Port_On(MCx_TX);
		// разрешение приемника
		USART1->CR1 |= UART_MODE_RX;
		//
		if(AGS_UpGrade_Request)
		   AGS_UpGrade_Active = 1;
		if(SAS_UpGrade_Request)
		   SAS_UpGrade_Active = 1;
		if(AGS_UpGrade_Active ||
		   SAS_UpGrade_Active)
			 UartDIA.Rx_Len = __PGM_Rx_Length;
		else UartDIA.Rx_Len = __DIA_Rx_Length;
	    HAL_UART_Receive_DMA(&huartKline, UartDIA.Rx_data, UartDIA.Rx_Len);
	  }
	  if(DIA.TP_Select == 10)	_TP_Off;
#endif
	}
} // end  myHAL_UART_TxCpltCallback

/* end HAL function  -----------------------------------------------*/

/* Private function  -----------------------------------------------*/


uint32_t CONFIG_Read(uint16_t ADDR)
{
	return *(uint32_t*)(ConfigStartAdr + (uint32_t)ADDR);
}

void CONFIG_Erase(void)
{
	FLASH_Cplt = 0;
	FLASH_Erase = 1;
	pEraseInit.Banks = FLASH_BANK_1;
	pEraseInit.NbPages = 1UL;
	pEraseInit.TypeErase = FLASH_TYPEERASE_PAGES;
	pEraseInit.PageAddress = ConfigStartAdr;

	HAL_FLASHEx_Erase_IT(&pEraseInit); // Proceed to erase the page
}

void CONFIG_Write(void)
{
	FLASH_Cplt = 0;
	cCONFIG.Rx_State = 0;
	HAL_FLASH_Program_IT(FLASH_TYPEPROGRAM_WORD, CONFIG_ADDR, (uint64_t)CONFIG_DATA);
}

void    Write_DSC_Const(void)
{  // 60mc
	// 30 byte  0 - 29 (0x1D)
	switch(DSC_CFG_Sel)
	{
		case 0:
			 if(DSC_Const_WrIEE_req) DSC_CFG_Sel = DSC_CFG_Erase_S;
			 break;
		case DSC_CFG_Erase_S:
			 if(DIA.TP_Select == 15)	_TP_On;
		     DSC_CFG_Sel = DSC_CFG_Erase_E;
		     HAL_FLASH_Unlock(); //Делаем память открытой
			 CONFIG_Erase();
			 break;
		case DSC_CFG_Erase_E:
			 if(FLASH_Cplt) // стирание завершено
    		 {  DSC_CFG_Sel = DSC_CFG_WrData_S;
				CONFIG_ADDR = ConfigStartAdr;
				CFG_WrData_Cnt = 0;
			 }
	         break;
		case DSC_CFG_WrData_S:
			 DSC_CFG_Sel = DSC_CFG_WrData_E;
			 CONFIG_DATA = (uint32_t)(DSC_Const_Buf[CFG_WrData_Cnt+1U]*65536) +
			 	 	       (uint32_t)DSC_Const_Buf[CFG_WrData_Cnt];
			 CONFIG_Write(); // запись
	         break;
		case DSC_CFG_WrData_E:
			 if(FLASH_Cplt)
			 {	FLASH_Cplt = 0;
				CFG_WrData_Cnt+= 2U;
				CONFIG_ADDR+= 4U;
				if(CFG_WrData_Cnt < (SizeCFGBuf - 1))
					 DSC_CFG_Sel = DSC_CFG_WrData_S; // следующая запись
				else DSC_CFG_Sel = DSC_CFG_WrCnt_S;//DSC_CFG_Delay;    // завершено
			 }
	         break;
		case DSC_CFG_WrCnt_S:
			// запись счетчика записей
			 CONFIG_ADDR = ConfigEndAdr-4;
#ifdef   __AxisF_Compile
			 CONFIG_DATA = ++Config_Cnt;
#else
			 CONFIG_DATA = Config_Cnt;
#endif
			 CONFIG_Write();  // запись
			 DSC_CFG_Sel = DSC_CFG_WrCnt_E;
	         break;
		case DSC_CFG_WrCnt_E:
			 if(FLASH_Cplt)
			 {	FLASH_Cplt = 0;
			    DSC_CFG_Sel = DSC_CFG_Delay;     // завершено
			 }
	         break;
		case DSC_CFG_Delay:
			 // запускаем вычислениe CRC CFG
			 Config_CRC = 0;
			 CRC_Sel = CFG_CRC_Start;
			 DSC_CFG_Sel = DSC_CFG_WrCRC_S;
	         break;
		case DSC_CFG_WrCRC_S:
			// ждем окончание вычисления CRC
			 if(Config_CRC != 0)
			 {	// запись  CRC
				CONFIG_ADDR = ConfigEndAdr;
				CONFIG_DATA = Config_CRC;
				CONFIG_Write();  // запись
				DSC_CFG_Sel = DSC_CFG_WrCRC_E;
			 }
	         break;
		case DSC_CFG_WrCRC_E:
			 if(FLASH_Cplt)
			 {	DSC_CFG_Sel = 0;  //  по нему передается состояние Write_DSC_Const
			    DSC_Const_WrIEE_req = 0; // сброс сдесь
			    HAL_FLASH_Lock(); //Делаем память залокированой
#ifdef __AxisF_Compile
			    if(WR_CFG_DIA_Ask_Req)// нет калибровки AGS вызов из DIA_Write_CFG()
			    {  WR_CFG_DIA_Ask_Req = 0; // флаг запроса ответа DIA
			    //////////////////////////////////////
			      HAL_UART_Abort(&huartKline);
			   ///////////////////////////////////////
			      UartDIA.Tx_data[0] = DIA.RX.Command;
			      UartDIA_Send(UartDIA.Tx_Len);
			    }
			    WR_BufCFG_MC2 = 1;
			    DSC_Const_Adr = 0;
#endif
			    Read_IEE_VDC_Const(); // чтение буфера констант из FlashCFG
				if(DIA.TP_Select == 15)	_TP_Off;
			 }
	         break;
	}
}  // end Write_DSC_Const()


void My_PVD_Init(void)
{
	sConfigPVD.PVDLevel = PWR_PVDLEVEL_1;//2.3V  PWR_PVDLEVEL_7; //2.9V
	sConfigPVD.Mode = PWR_PVD_MODE_IT_RISING_FALLING;
	//PWR_PVD_MODE_IT_FALLING;// PWR_PVD_MODE_IT_RISING
	HAL_PWR_ConfigPVD(&sConfigPVD);
	HAL_PWR_EnablePVD();
	//HAL_PWREx_EnableVddio2Monitor();
}

void My_DMA_Init(void)
{
	hdma_crc.XferCpltCallback = HAL_DMAcrc_CpltCallback;
	HAL_ADC_Start_DMA(&hadc, (uint32_t*)ADC_Data, (uint32_t)0x10U); //
}

void My_CRC_Init(void)
{
/* FlashEndAdr is what the linker thinks is the end of the image */
//	FlashEndAdr = (uint32_t)((uint32_t)&_etext + (uint32_t)&_edata -
//                             (uint32_t)&_sdata);
    CRC_Sel = PGM_CRC_Start;  // запуск вычисления CRC
}

void My_TIM_Init(void)
{
	HAL_TIM_Base_Start_IT(&htim7);  // Starts the TIM Base generation in interrupt mode.
	HAL_TIM_Base_Start_IT(&htim6);  // Starts the TIM Base generation in interrupt mode.

	HAL_TIM_Base_Start_IT(&htim4);
	HAL_TIM_OC_Start_IT (&htim4, TIM_CHANNEL_2);
	HAL_TIM_OC_Start_IT (&htim4, TIM_CHANNEL_3);

	HAL_TIM_Base_Start_IT(&htim1);
#ifdef   __AxisF_Compile
	Wheel_FL.Capture.Channel = TIM_CHANNEL_1;
	Wheel_FR.Capture.Channel = TIM_CHANNEL_2;
    //	включение PWM реле
	HAL_TIM_PWM_Start(&htim2, TIM_CHANNEL_4);
#endif
#ifdef   __AxisR_Compile
	Wheel_RL.Capture.Channel = TIM_CHANNEL_1;
	Wheel_RR.Capture.Channel = TIM_CHANNEL_2;
	LIM.B7.Channel = B7_CHANNEL;
	HAL_TIM_IC_Start_IT (&htimB7, B7_CHANNEL);
	HAL_TIM_IC_Start_IT (&htim4, TIM_CHANNEL_1);
	HAL_TIM_OC_Start_IT (&htim4, TIM_CHANNEL_4);
#endif
	//Starts the TIM Input Capture measurement in interrupt mode.
	HAL_TIM_IC_Start_IT (&hTimSS, TIM_CHANNEL_1);
	HAL_TIM_IC_Start_IT (&hTimSS, TIM_CHANNEL_2);

} // end My_TIM_Init()

void My_UART_Init(void)
{
// первый SCI_Sinxr сразу второй ждет прихода
#ifdef   __AxisF_Compile
	UartSCI_Sinxr_Flag = 1;
#endif
	// запуск приема SCI
	HAL_UART_Receive_DMA(&huartSCI, SCI.Rx_data, UartSCI_Rx_Length);
}

void My_CAN_Init(void)
{
CAN_FilterConfTypeDef sFilterConfig;
/* CAN filter init */
/* Configure the CAN Filter 0 for FIFO 0 accept every message */
	sFilterConfig.FilterNumber = 0U;
	sFilterConfig.FilterMode = CAN_FILTERMODE_IDMASK;
	sFilterConfig.FilterScale = CAN_FILTERSCALE_32BIT;
	sFilterConfig.FilterIdHigh = 0x0000;     // every message
	sFilterConfig.FilterIdLow = 0x0000;
	sFilterConfig.FilterMaskIdHigh = 0x0000; // every message
	sFilterConfig.FilterMaskIdLow = 0x0000;
	sFilterConfig.FilterFIFOAssignment = CAN_FIFO0;
	sFilterConfig.FilterActivation = ENABLE;
	// define the first bank for CAN2 filter
	// STM Не меняется = 14
	// GD меняется 1...27
	sFilterConfig.BankNumber = 14U;
	HAL_CAN_ConfigFilter(&hcan1, &sFilterConfig);

/* Configure the CAN Filter 14 FIFO 1 accept every message */
// !!!!! фильтры CAN2 BankNumber 14-27 конфигурируются через CAN1
	sFilterConfig.FilterNumber = 14U;
	sFilterConfig.FilterFIFOAssignment = CAN_FIFO1;
	HAL_CAN_ConfigFilter(&hcan1, &sFilterConfig);

#ifdef __AGS_SAS
/* Configure the CAN Tx */
	hCANS.pTxMsg = &CANS_Tx_Message;
	hCANS.pTxMsg->RTR = CAN_RTR_DATA;
	hCANS.pTxMsg->IDE = CAN_ID_EXT;
	hCANS.pTxMsg->DLC = 8;
#endif
#ifdef __CAN_Trailer
/* Configure the CAN Tx */
	hCANT.pTxMsg = &CANT_Tx_Message;
	hCANT.pTxMsg->RTR = CAN_RTR_DATA;
	hCANT.pTxMsg->IDE = CAN_ID_EXT;
	hCANT.pTxMsg->DLC = 8;
#endif
#ifdef __CAN_j1939
/* Configure the CAN Tx */
	hCANJ.pTxMsg = &CANJ_Tx_Message;
	hCANJ.pTxMsg->RTR = CAN_RTR_DATA;
	hCANJ.pTxMsg->IDE = CAN_ID_EXT;
	hCANJ.pTxMsg->DLC = 8;
#endif

#ifdef __CAN_j1939
	/* Configure the CAN Rx0_Message */
	hCANJ.pRx1Msg =&CANJ_Rx0_Message;
	hCANJ.pRxMsg = &CANJ_Rx0_Message;
	HAL_CAN_Receive_IT(&hCANJ, CAN_FIFO0);
#endif
#ifdef __AGS_SAS
/* Configure the CAN Rx0_Message */
	hCANS.pRx1Msg =&CANS_Rx0_Message;
	hCANS.pRxMsg = &CANS_Rx0_Message;
	HAL_CAN_Receive_IT(&hCANS, CAN_FIFO1);
#endif
#ifdef __CAN_Trailer
	hCANT.pRx1Msg =&CANT_Rx0_Message;
	hCANT.pRxMsg = &CANT_Rx0_Message;
	HAL_CAN_Receive_IT(&hCANT, CAN_FIFO1);
#endif
#ifdef   __AxisR_Compile
	CANJ_Transmit_Cmpl = 1;  // нужно иначе передается кадр с нулями ??
#endif
} // end My_CAN_Init();

void My_FLASH_Init(void)
{
// FLASH LATENCY настраивается в HAL_RCC_OscConfig
	HAL_FLASH_Lock(); //Делаем память залокированой
} // end My_FLASH_Init();

void My_Port_Init(void)
{
#ifdef  WP_EPROM_Pin
	_Port_Off(WP_EPROM);  // WP_EPROM в ноль
#endif

#ifdef __Rectangular_Board
	LSSw_Handling = 1; // обработка LAMP
	SW_Handling = 1; // обработка Button
#endif

#ifdef __Square_Board
	LSSw_Handling = 0; // обработка LAMP
	SW_Handling = 0; // обработка Button
#endif
} // end My_Port_Init()

void My_VAR_Init(void)
{
	  SAS.Koef_Poz = 0x00010000;
	  SAS.Koef_Neg = 0x00010000;
	  TCO.Front.Koef = __Koef_Default;
	  TCO.Rear.Koef	= __Koef_Default;
	  EBL.REG.Ks_L	= __Koef_Default;
	  EBL.REG.Ks_R	= __Koef_Default;
	  EngineTorque.TSC_Taxo = 0xFFFF;
	  Door_Status = 0xFF;  //??
	  EBC1_B3 = 0xFF;
	  EBC1_B8 = 0xFF;

	  Vehicle.ECU.Ver_PO = _Version_PO_Projekt;
	  Vehicle.ECU.PO_MC1 = _Version_PO_MC1;
	  Vehicle.ECU.PO_MC2 = _Version_PO_MC2;

	  // указатели на ADC
#ifdef   __AxisF_Compile
	  Wheel_FL.ADC.A1_Ch = &ADC_S1_FL;
	  Wheel_FL.ADC.A2_Ch = &ADC_S2_FL;
	  Wheel_FR.ADC.A1_Ch = &ADC_S1_FR;
	  Wheel_FR.ADC.A2_Ch = &ADC_S2_FR;

	  Wheel_FL.ADC.AV_Ch = &ADC_AV_FL;
	  Wheel_FL.ADC.EV_Ch = &ADC_EV_FL;
	  Wheel_FR.ADC.AV_Ch = &ADC_AV_FR;
	  Wheel_FR.ADC.EV_Ch = &ADC_EV_FR;
	  FrontDif.ADC_Ch = &ADC_DIFF;
	  Power.KL15.ADC_Ch = &ADC_Ubat;
	  Power.KL30.ADC_Ch = &ADC_Sila;
	  BTS142_GNDF.ADC_Ch = &ADC_GNDF;

	  BSP75_WL.ADC_Ch =  &ADC_WL;
	  SW_DIA.ADC_Ch = &ADC_WL;
	  BSP75_DBR.ADC_Ch = &ADC_DBR;
	  SW_ABS.ADC_Ch = &ADC_SW_ABS;

#endif
#ifdef   __AxisR_Compile
	  Wheel_RL.ADC.A1_Ch = &ADC_S1_RL;
	  Wheel_RL.ADC.A2_Ch = &ADC_S2_RL;
	  Wheel_RR.ADC.A1_Ch = &ADC_S1_RR;
	  Wheel_RR.ADC.A2_Ch = &ADC_S2_RR;

	  Wheel_RL.ADC.AV_Ch = &ADC_AV_RL;
	  Wheel_RL.ADC.EV_Ch = &ADC_EV_RL;
	  Wheel_RR.ADC.AV_Ch = &ADC_AV_RR;
	  Wheel_RR.ADC.EV_Ch = &ADC_EV_RR;
	  RearDif.ADC_Ch =     &ADC_DIFR;
	  TrailerDif.ADC_Ch =  &ADC_DIFT;
	  BTS142_GNDR.ADC_Ch = &ADC_GNDR;

	  BSP75_LASR.ADC_Ch =  &ADC_LASR;
	  SW_ASR.ADC_Ch =  &ADC_SW_ASR;
	  SW_TSET.ADC_Ch = &ADC_SW_TSET;
	  LIM.PK.ADC.Ch =  &ADC_PropKl;
#endif
#ifdef   __Axis3_Compile
	  Wheel_3L.ADC.A1_Ch = &ADC_S1_3L;
	  Wheel_3L.ADC.A2_Ch = &ADC_S2_3L;
	  Wheel_3R.ADC.A1_Ch = &ADC_S1_3R;
	  Wheel_3R.ADC.A2_Ch = &ADC_S2_3R;

	  Wheel_3L.ADC.AV_Ch = &ADC_AV_3L;
	  Wheel_3L.ADC.EV_Ch = &ADC_EV_3L;
	  Wheel_3R.ADC.AV_Ch = &ADC_AV_3R;
	  Wheel_3R.ADC.EV_Ch = &ADC_EV_3R;
#endif

} // end My_VAR_Init()

//-----------------------------AGS-------------------------------------------
#if defined __AGS_SAS

void CAN_Send_SASzero(void)
{
	CANS_Tx_Message.ExtId = _ExtID_make(SASzeroPri,SASzeroPGN,SASzeroAdr);
	for (uint8_t i = 0; i < 8; i++)
		CANS_Tx_Message.Data[i] = SASzeroData[i];
	HAL_CAN_Transmit_IT(&hCANS);   // запуск передачи

} // end CAN_Send_SASzero();

void CAN_Send_AGS(void)
{
	CANS_Tx_Message.ExtId = _ExtID_make(RdCAN_Pri,RdCAN_PGN,RdCAN_Adr);
	for (uint8_t i = 0; i < 8; i++)
	{   CANS_Tx_Message.Data[i] = AGS.CAN_TxData[i];
		AGS.CAN_RxData[i] = 0;
	}
	HAL_CAN_Transmit_IT(&hCANS);   // запуск передачи

} // end CAN_Send_AGS();

#define Delay_Ask           50
#define AGSzero_Tout        3000 	 // 15c

#define Delay_Wr_OffSet     20  //20  // задержка на запись 0,1c
#define Delay_Erase_CONF    50  //50  // задержка на стирание 0,25c
//#define Delay_RST           700   //2700  // задержка на рестарт 3,5c
#define __Delay_Calibr_RST  2000 //5c
#define __AGS_Calibr_Tout   3000 // 15c  2500  12sec

void AGS_Calibration(void)
{
	// запрос на калибровку
	if(!AGS_Calibr_Cmpl &&
	   !AGS_Not_CAN_Ask)
	{ // не выполнена калибровка AGS // условия запросa
      if(BlockON_Complete)
      {	// задержка после RST
	    if(AGS.Calibr.Delay < __Delay_Calibr_RST)
	       AGS.Calibr.Delay++;
	    if(AGS.Calibr.Delay ==__Delay_Calibr_RST && // задержка
	       Model_Instal)             // выполнена установка VIN
	    	 AGSzero_Request = 1;//AGS_Calibr_Req = 1;
	    else AGSzero_Request = 0;//AGS_Calibr_Req = 0;
      }
	}
	// автомат калибровки
	switch(AGS.Calibr.Phase)
	{
	  case 0 :
		  AGSzero_Request = 0;// AGS_Calibr_Req = 0;
		  if(!AGS_NotReady)
			  AGS.Calibr.Phase++;
		  break;
	  case 1 :
		  if(AGSzero_Request)
			 AGS.Calibr.Phase++;
		  break;
	  case 2 :
		  // калибровка гироскопа
		  for (uint8_t i = 0; i < 8; i++) AGS.CAN_TxData[i] = 0;
		  // определяем версию прошивки AGS
		  AGS.CAN_TxData[0] = cCAN_KEY3;      // 1 БАЙТ ключ команд
		  AGS.CAN_TxData[1] = Com_OffSet_AG;  // 2 БАЙТ командa OffSet
		  AGS.CAN_TxData[2] = Set_OffSet_G;   // 3 БАЙТ командa установки OffSet GYRO
		  CAN_Send_AGS();
		  AGS.Calibr.Tout = 0;
		  AGS.Calibr.Phase++;
		  break;
	  case 3 : // ждем ответ командa установки OffSet GYRO
		  if(++AGS.Calibr.Tout > 20) // задержка
		  { if(AGS.CAN_RxData[0] == cCAN_KEY3 &&
			   AGS.CAN_RxData[1] == Com_OffSet_AG &&
			   AGS.CAN_RxData[2] == Set_OffSet_G &&
			   AGS.CAN_RxData[3] == 85)
			{ // есть ответ новой прошивки AGS
			   AGS.Calibr.AccX_OffSet_Sum = 0;
			   AGS.Calibr.AccY_OffSet_Sum = 0;
			   AGS.Calibr.Tout = 0;
			   AGS.Calibr.Phase++;
			}
			else
			{  AGS.Calibr.Phase = 0; // нет ответа
			   AGS_Not_CAN_Ask = 1;
			}
		  }
		  break;
	  case 4 :  // ждем завершения калибровки гироскопа
		  AGS.Calibr.AccX_OffSet_Sum += (Acc_X_sen + DSC_OffSet_AccX);
		  AGS.Calibr.AccY_OffSet_Sum += (Acc_Y_sen + DSC_OffSet_AccY);

		  if(AGS.Calibr.Tout++ > __AGS_Calibr_Tout)
			 AGS.Calibr.Phase =  AGSzeroNew_Ph3; //ошибка
		  else
		  { // Ожидаем завершение ASK
			if(AGS.CAN_RxData[2] == AGS_Ask &&
			   AGS.CAN_RxData[3] == AGS_Ask &&
			   AGS.CAN_RxData[7] == AGS_Zero_Ok)
			{ // есть ответ Ok
			  // находим сренее отклонение AccX и AccY от нуля
			  AGS.Calibr.AccX_OffSet = AGS.Calibr.AccX_OffSet_Sum /
				    		           AGS.Calibr.Tout;
		      AGS.Calibr.AccY_OffSet = AGS.Calibr.AccY_OffSet_Sum /
				    		           AGS.Calibr.Tout;
		      AGS.Calibr.Phase++;
		    }
		  }
		  break;
	  case 5 :
#define	 __CFG_Calibr_ADDR   106    // DSC_OffSet_AccY = _Lo_16(IEE_DSC_Const[106])
#define	 __AGS_Calibr_Sign	 0x0033 //  признак выполнения калибровки AGS
#define	 __AGS_Sign_ADDR	 111	// _Lo_16(IEE_DSC_Const[111])
          // заполняем буфер
		  for (uint8_t i = 0; i < SizeCFGBuf; i++)
			   DSC_Const_Buf[i] = IEE_DSC_Const[i];
		  // новые значения OffSet в буфере геморой из-за
		  // IEE_DSC_Const смещен на 1байт по сравнению с DumpMOT[]
		  uint16_t Tmp = DSC_Const_Buf[__CFG_Calibr_ADDR];
		  Tmp = (Tmp & 0xFF00) | _Hi_16(AGS.Calibr.AccY_OffSet);
		  DSC_Const_Buf[__CFG_Calibr_ADDR] = Tmp;
		  DSC_Const_Buf[__CFG_Calibr_ADDR+1] = ((_Lo_16(AGS.Calibr.AccY_OffSet))<<8) +
				                                 _Hi_16(AGS.Calibr.AccX_OffSet);
		  Tmp = DSC_Const_Buf[__CFG_Calibr_ADDR+2];
		  Tmp = (Tmp & 0x00FF) | (_Lo_16(AGS.Calibr.AccX_OffSet))<<8;
		  DSC_Const_Buf[__CFG_Calibr_ADDR+2] = Tmp;
		  // признак выполнения калибровки AGS
		  Tmp = DSC_Const_Buf[__AGS_Sign_ADDR];
		  Tmp = (Tmp & 0xFF00) | __AGS_Calibr_Sign;
		  DSC_Const_Buf[__AGS_Sign_ADDR] = Tmp;
		  // запрос на запись CFG
		  DSC_Const_WrIEE_req = 1;
		  AGS.Calibr.Tout = 0;
		  AGS.Calibr.Phase++;
		  break;
	  case 6 :  // ждем завершения записи CFG
		  if(AGS.Calibr.Tout++ > __AGS_Calibr_Tout)
			 AGS.Calibr.Phase = AGSzeroNew_Ph3; //ошибка
		  else
		  if(AGS_Calibr_Cmpl)	//Ok
		  {  AGS.Calibr.Phase = AGSzeroNew_Ph2;	//Ok
			 AGS.Calibr.Tout = 0;
		  }
		  break;
	 // оставляем от старой процедуры AGS_DoneZero()
	  case AGSzero_PhEnd :
		  AGS.CAN_TxData[0] = cCAN_KEY3;      // 1 БАЙТ ключ команд
		  AGS.CAN_TxData[1] = Com_RST_MPU;   //  2 БАЙТ командa рестарта
		  CAN_Send_AGS();
		  AGS.Calibr.Phase = 0;
		  break;
	  case AGSzeroNew_Ph2 :	//Ok
	  case AGSzeroNew_Ph3 :	//ошибка
		 if(++AGS.Calibr.Tout > Delay_Ask)
			 AGS.Calibr.Phase = AGSzero_PhEnd;
		 break;
	}
} // end AGS_Calibration();

// пустой/сервисный dummy-пакет
void     CANS_Send_Dummy(void)
{
	CANS_Tx_Message.ExtId = _ExtID_make(RdCAN_Pri,RdCAN_PGN,RdCAN_Adr);
	CANS_Tx_Message.Data[0] = cCAN_KEY1;  // 1 БАЙТ ключ команд
	CANS_Tx_Message.Data[1] = Com_Rd_CRC; // 2 БАЙТ командa чтения CRC;
	HAL_CAN_Transmit_IT(&hCANS);   // запуск передачи
}

#define   UpGrade_Wait_Request    1
#define   UpGrade_Init_Step1      2
#define   UpGrade_Init_Step2      3
#define   UpGrade_Wait_RxUART     4
#define   UpGrade_Send_Head       5
#define   UpGrade_Send_Paket      6
#define   UpGrade_Wait_RxCAN	  7
#define   UpGrade_PhTout          8
#define   UpGrade_Wait_TxUART     9
#define   UpGrade_PhEnd           10
#define   UpGrade_TimeOut        100 //mc


void CANS_Send_UpGrade(TypeDef_UpGrade* UpGrade)
{
	CANS_Tx_Message.ExtId = UpGrade->CAN_ExtID;
	for (uint8_t i = 0; i < 8; i++)
	CANS_Tx_Message.Data[i] = UpGrade->CAN_TxData[i];
	UpGrade->Flags.Bits.b2 = 0; //UpGrade_CAN_Rx
    UpGrade->Tout = 0;
	HAL_CAN_Transmit_IT(&hCANS);   // запуск передачи

} // end CAN_Send_UpGrade();

void CANJ_Send_UpGrade(TypeDef_UpGrade* UpGrade)
{
	CANJ_Tx_Message.ExtId = UpGrade->CAN_ExtID;
	for (uint8_t i = 0; i < 8; i++)
	CANJ_Tx_Message.Data[i] = UpGrade->CAN_TxData[i];
	UpGrade->Flags.Bits.b2 = 0; //AGS_UpGrade_CAN_Rx
    UpGrade->Tout = 0;
	HAL_CAN_Transmit_IT(&hCANJ);   // запуск передачи

} // end CANJ_Send_UpGrade();
void UpGrade_CANJ_Ask(TypeDef_UpGrade* UpGrade)
{
	CANJ_Tx_Message.ExtId = _ExtID_make(PGM_Pri,PGM_PGN2,ECU_SA);
	CANJ_Tx_Message.Data[1] = UpGrade->CAN_RxData[0];// AGS.UpGrade.Command;//
	CANJ_Tx_Message.Data[0] = UpGrade->CAN_RxData[1];// у AGS наоборот чем у SKU!!!

    UpGrade->Tout = 0;
    HAL_CAN_Transmit_IT(&hCANJ);   // запуск передачи

}
void UpGrade_UART_Ask(TypeDef_UpGrade* UpGrade)
{
	UartDIA.Tx_data[0] = UpGrade->CAN_RxData[1];
    UartDIA.Tx_data[1] = UpGrade->CAN_RxData[0];// UpGrade.Command;//
	UpGrade->Tout = 0;
    UartDIA_Send(__PGM_Tx_Length);

} // end UpGrade_UART_Ask()

uint8_t  UpGrade_Tout(TypeDef_UpGrade* UpGrade)
{
	if(UpGrade->Tout < UpGrade_TimeOut)
	{  UpGrade->Tout++;
	   return 0;
	}
	else
	{  UpGrade->PhRet = UpGrade->Phase;
	   UpGrade->Phase = UpGrade_PhTout;
	   return 1;
	}
} // end  UpGrade_Tout()

void     AGS_SAS_UpGrade(void)
{
	uint8_t i;

	switch(UpGrade.Phase)
	{
	case 0 :
		if(AGS_Upit_ON)
			UpGrade.Phase = 1;
		break;
	case UpGrade_Wait_Request:
        if(AGS_UpGrade_Request ||
           SAS_UpGrade_Request)
		{	// UpGrade инициализация  1 step
			UpGrade.CAN_ExtID = _ExtID_make(PGM_Pri,PGM_PGN3,UpGrade.CAN_DA);
			UpGrade.CAN_TxData[0] = __Rx_Head; //Head)
			UpGrade.CAN_TxData[1] = __PGM_Key1;
			UpGrade.CAN_TxData[2] = __PGM_Step1;
			UpGrade.CAN_TxData[3] = CAN_USB.CAN_TxData[3];
			CANS_Send_UpGrade(&UpGrade);
			UpGrade.Phase++;
		}
		break;
	case UpGrade_Init_Step1: // здесь ждем ответ инициализации Step1
		if(!UpGrade_Tout(&UpGrade))
		{ if(UpGrade_CAN_Rx &&      //
		     UpGrade.CAN_RxData[0] == __Rx_Head &&
		     UpGrade.CAN_RxData[1] == __PGM_Key1)
		  { // UpGrade инициализация 2 step
		    UpGrade.CAN_TxData[0] = __Rx_Head; //Head)
		    UpGrade.CAN_TxData[1] = __PGM_Key2;
		    UpGrade.CAN_TxData[2] = __PGM_Step2;
		    CANS_Send_UpGrade(&UpGrade);
		    UpGrade.Phase++;
		  }
		}
		break;
	case UpGrade_Init_Step2: // здесь ждем ответ инициализации Step2
		if(!UpGrade_Tout(&UpGrade))
		{ if(UpGrade_CAN_Rx &&
		     UpGrade.CAN_RxData[0] == __Rx_Head &&
		     UpGrade.CAN_RxData[1] == __PGM_Key2)
		  { // UpGrade инициализация завершена
			if(UpGrade_CAN_USB)
			{ // ответ на инициализацию адаптер CAN_USB
			  UpGrade.CAN_ExtID = _ExtID_make(PGM_Pri,PGM_PGN4,ECU_SA);
			  for (uint8_t i = 0; i < 8; i++)
			  UpGrade.CAN_TxData[i] = CAN_USB.CAN_TxData[i];
			  CANJ_Send_UpGrade(&UpGrade);
			  if(AGS_UpGrade_Request)
				 AGS_UpGrade_Active = 1;
			  if(SAS_UpGrade_Request)
				 SAS_UpGrade_Active = 1;
			}
		    UpGrade.Phase++;
		    UpGrade_UartRx = 0;
		    UpGrade.UartCnt = 0;
		  }
		}
		break;

	case UpGrade_Wait_RxUART: // здесь ждем приема пакета в UART
        if(UpGrade_UartRx)
        {  UpGrade_UartRx = 0;
           UpGrade.UartCnt++;
           UpGrade.Phase++;
        }
		break;
	case UpGrade_Send_Head :
		// посылка в CANS команды и адреса
		UpGrade.CAN_ExtID = _ExtID_make(PGM_Pri,PGM_PGN0,UpGrade.CAN_DA);
	    UpGrade.CAN_TxData[0] = __End_Command;//__Rx_Head_PGM;
	    for (i = 0; i < 6; i++)
	    UpGrade.CAN_TxData[i+1] = UpGrade.Paket[i+2];
	    // для отладки
	    UpGrade.CAN_TxData[7] = UpGrade.UartCnt;
	    CANS_Send_UpGrade(&UpGrade);
		UpGrade.PaketNum = 0;
		UpGrade.Phase++;
		break;
	case UpGrade_Send_Paket:
		// посылка в CAN 4 пакетов данных
	    UpGrade.CAN_ExtID = _ExtID_make(PGM_Pri,PGM_PGN1,UpGrade.CAN_DA);//
	    { for (i = 0; i < 8; i++)
	      UpGrade.CAN_TxData[i] =
	      UpGrade.Paket[i+6+UpGrade.PaketNum*8];
	      CANS_Send_UpGrade(&UpGrade);
	    }
	    if(++UpGrade.PaketNum == 4)
		{  UpGrade.Phase = UpGrade_Wait_RxCAN;
		   UpGrade_CAN_Rx = 0;
		}
	    else {}
		break;
	case UpGrade_Wait_RxCAN: // ждем ответ от AGS
		// ответ в UART отправляется в myHAL_CAN_RxCpltCallback
		if(!UpGrade_Tout(&UpGrade))
		{ if(UpGrade_CAN_Rx)
		  {  UpGrade_UartRx = 0;
			if(UpGrade_CAN_USB)
			   UpGrade_CANJ_Ask(&UpGrade); // отправляется ответ в CANJ
			else
		    UpGrade_UART_Ask(&UpGrade); // отправляется ответ в UART
			if(UpGrade.Command !=__End_Command)
			     UpGrade.Phase = UpGrade_Wait_RxUART;
		    else UpGrade.Phase = UpGrade_Wait_TxUART;
		  }
		}
		break;

	case UpGrade_PhTout :
		if(UpGrade.PhRet == UpGrade_Wait_RxCAN)
		{ // отошлем в UART ошибку
			UpGrade.CAN_RxData[0] = 5;
			UpGrade.CAN_RxData[1] = 5;
			if(UpGrade_CAN_USB)
			   UpGrade_CANJ_Ask(&UpGrade); // отправляется ответ в CANJ
			else
		    UpGrade_UART_Ask(&UpGrade); // отправляется ответ в UART
		}
		else UpGrade.Phase++;
		break;

	case UpGrade_Wait_TxUART:
		if(!UartDIA_Tx_BUSY ||
			UpGrade.Tout++ > UpGrade_TimeOut)
			UpGrade.Phase++; // = UpGrade_PhEnd;
		break;
	case UpGrade_PhEnd : // фаза завершения
		UpGrade_Flags = 0;
		UpGrade.Tout = 0;
		UpGrade.Phase = 0;
		break;
	}
} // end AGS_SAS_UpGrade()


void     Bridge_CAN_Send(void)
{
	CANS_Tx_Message.ExtId = BridgeCAN.Frame.ExtID;
	for (uint8_t i = 0; i < 8; i++)
	CANS_Tx_Message.Data[i] = BridgeCAN.Frame.TxData[i];
	BridgeCAN_Ask = 0;
	BridgeCAN.Tout = 0;
	HAL_CAN_Transmit_IT(&hCANS);   // запуск передачи
}

uint8_t  Bridge_Wait_TimeOut(uint16_t  Tout)
{
#define __BrCAN_AGS_RdTout    20   //mc
#define __BrCAN_AGS_WrTout    50   //mc

    if(!BridgeCAN_Ask)
    { if(BridgeCAN.Tout++ > Tout)
      {  BridgeCAN_Fail = 1;
       // BridgeCAN_Ask = 1;  //??
        return 2;
      }
      else return 0;
    }
    else return 1;
}

void     Bridge_CAN(void)
{
#define __BridgeTo_AGS        3
#define __BridgeTo_SAS        4

#define __AGS_CAN_SA          0xDC
#define __SAS_CAN_SA          0xE8

#define __AGS_Bridge_Phase    1
#define __AGS_BrWrite_SendPh  2
#define __AGS_BrWrite_WaitPh1 3
#define __AGS_BrWrite_WaitPh2 4
#define __AGS_BrRead_WaitPh   5
#define __AGS_KEY_Send_Phase  6
#define __AGS_KEY_Wait_Phase  7
#define __AGS_UartDIA_SendPh  8
#define __AGS_Bridge_End      9

// Если нет __Diag_Kline то и нет Bridge_CAN()
#if defined __Diag_Kline

uint16_t PGN;

	switch(BridgeCAN.Phase)
	{ case 0:
		if(BridgeCAN_Active)
		{ if((BridgeCAN.DA & 0x0F) == __BridgeTo_AGS) //AGS
			  BridgeCAN.SA = __AGS_CAN_SA;
		 else BridgeCAN.SA = __SAS_CAN_SA;
		   if(BridgeCAN.DA & 0x20)
		   {  BridgeCAN_KEY = 1;
		      BridgeCAN.Phase = __AGS_KEY_Send_Phase;
		   }
		   else
		   BridgeCAN.Phase = __AGS_Bridge_Phase;
		}
	  break;

	  case __AGS_Bridge_Phase: // AGS
		  BridgeCAN.Tout = 0;
		  BridgeCAN.Frame.TxData[0] = cCAN_KEY2;      // 1 БАЙТ ключ команд
		  if(BridgeCAN.DA & 0x80)
		       BridgeCAN.Frame.TxData[1] = Com_Wr_CONF; // 2 БАЙТ командa Com_Wr_CONF
		  else BridgeCAN.Frame.TxData[1] = Com_Rd_CONF;
		  BridgeCAN.Frame.TxData[2] = _B2_32(BridgeCAN.Adr);   // Hi адрес
		  BridgeCAN.Frame.TxData[3] = _B1_32(BridgeCAN.Adr);   //
		  BridgeCAN.Frame.TxData[4] = _B0_32(BridgeCAN.Adr);   // Lo адрес
		  BridgeCAN.Frame.TxData[5] = BridgeCAN.DA;
		  BridgeCAN.Frame.TxData[6] = 0;
		  BridgeCAN.Frame.TxData[7] = BridgeCAN.TxCnt++;
		  PGN = (BrCom_PGN & 0xFF00) | BridgeCAN.SA;
		  BridgeCAN.Frame.ExtID = _ExtID_make(Bridge_Pri,PGN,Bridge_Adr);
		  Bridge_CAN_Send(); //0xCEFDC3E
		  if(BridgeCAN.DA & 0x80)
		  { // переход в фазу передача данных при записи
		    BridgeCAN.Phase =__AGS_BrWrite_SendPh;
		  }
		  else // переход в фазу ожидания ответа при чтении
		      BridgeCAN.Phase =__AGS_BrRead_WaitPh;
	  break;
	  case __AGS_BrWrite_SendPh:
	      { // передача данных при записи
	        for (uint8_t i = 0; i < 8; i++)
	        BridgeCAN.Frame.TxData[i] = BridgeCAN.InBuf[i];
	        PGN = (BrData_PGN & 0xFF00) | BridgeCAN.SA;
	        BridgeCAN.Frame.ExtID = _ExtID_make(Bridge_Pri,PGN,Bridge_Adr);
	        Bridge_CAN_Send(); //0xCEFEC3E
	        // переход в фазу ожидания ответа при записи
	        BridgeCAN.Phase =__AGS_BrWrite_WaitPh1;
	      }
	  break;
	  case __AGS_BrWrite_WaitPh1: // AGS Write_WaitPh1
		  // ждем ответ  при записи
		  if(Bridge_Wait_TimeOut(__BrCAN_AGS_RdTout))
		  { if(BridgeCAN.DA & 0x40)
			 // переход в фазу ожидания завершении  Write_IEE_Const
		    {  BridgeCAN_Ask = 0;
		       BridgeCAN.Tout = 0;
		       BridgeCAN.Phase =__AGS_BrWrite_WaitPh2;
		    }
            else BridgeCAN.Phase = __AGS_UartDIA_SendPh;
		  }
	  break;
	  case __AGS_BrWrite_WaitPh2: // AGS Write_WaitPh2
		  // ждем ответ о завершении  Write_IEE_Const
		  if(Bridge_Wait_TimeOut(__BrCAN_AGS_WrTout))
		     BridgeCAN.Phase = __AGS_UartDIA_SendPh;
	  break;
	  case __AGS_BrRead_WaitPh: // AGS Read_WaitPh
		  // ждем ответ при чтении
		  if(Bridge_Wait_TimeOut(__BrCAN_AGS_RdTout))
		     BridgeCAN.Phase = __AGS_UartDIA_SendPh;

	  break;

	  case __AGS_KEY_Send_Phase: //
		  BridgeCAN.Frame.TxData[0] = _B2_32(BridgeCAN.Adr); // 1 БАЙТ ключ команд
		  BridgeCAN.Frame.TxData[1] = _B1_32(BridgeCAN.Adr); // команды
		  BridgeCAN.Frame.TxData[2] = _B0_32(BridgeCAN.Adr); //
		  if(BridgeCAN.SA == __SAS_CAN_SA)
			   BridgeCAN.Frame.ExtID = _ExtID_make(RdCAN_Pri,RdCAN_PGN,__SAS_CAN_SA);
		  else BridgeCAN.Frame.ExtID = _ExtID_make(RdCAN_Pri,RdCAN_PGN,Bridge_Adr);
		  Bridge_CAN_Send();
  		  BridgeCAN.Tout = 0;
  		  BridgeCAN.Phase++;
	  break;
	  case __AGS_KEY_Wait_Phase: //
		  // ждем ответ при чтении
		  if(Bridge_Wait_TimeOut(__BrCAN_AGS_RdTout))
  		     BridgeCAN.Phase++;
	  break;

	  case __AGS_UartDIA_SendPh: // передача ответа в
		  if(!BridgeCAN_Fail)
		  { // ответил BridgeCAN
			  UartDIA.Tx_data[0] = DIA.RX.Command; //первым
		      for (uint8_t i = 0; i < 8; i++)
			  UartDIA.Tx_data[i+1] = BridgeCAN.OutBuf[i];
		  }
		  else UartDIA.Tx_data[0] = __DIA_AckError; //первым
		  UartDIA_Send(UartDIA.Tx_Len);
		  BridgeCAN_Flags = 0;
		  BridgeCAN.Phase = 0;
	  break;
	}
#endif
} // end Bridge_CAN()

void SAS_DoneZero(void)
{
// Vehicle.StateSAS = _Hi_16(IEE_DSC_Const[112]);
#define	 __SAS_Calibr_Sign	 0xCC00 // признак выполнения калибровки SAS
#define	 __SAS_Sign_ADDR	 112	//

	// запрос на калибровку
	// условия запросa
	if(AGS_Calibr_Cmpl &&  // выполнена калибровка AGS
	   !SAS_Calibr_Cmpl && // не выполнена калибровка SAS
	   Model_Instal &&     // выполнена установка VIN
	   Forward_Move &&     // должна  ехать
	   !CAN_SAS_Fail &&    // нет ошибки SAS
	   AGS_Upit_ON)        // есть питание датчика
		 SASzero_Request = 1;//SAS_Calibr_Req = 1;
	else SASzero_Request = 0;//SAS_Calibr_Req = 0;

	// возможна установка SAS с углом больше Reliable
	// показания Steer_sen будут ноль
	if(SAS.value &&
	   !Steer_sen &&
	   SAS_Not_Fail &&     // нет Fail
	   !Steer_Reliable &&  // нет Reliable
	   !SAS_Calibr_Cmpl && // нет калибровки
	   Forward_Move &&     // едет
	   No_Maneuver &&	   // нет Maneuver
	   !SASzero_Request3)  // не было калибровки на текущем включении
	{   SASzero_Request3 = 1;
	    CAN_Send_SASzero();
	}

	// машина установки нуля
	if(!AGS_Upit_ON) SAS.Zero.Phase = 0;
	switch(SAS.Zero.Phase)
	{
	case 0 :
		SASzero_InProcess = 0;
		if(AGS_Upit_ON)  SAS.Zero.Phase++;
		break;
	case 1 :
		if(SASzero_Request2)
		{ // поступил запрос 2 от диагностики
		  SAS.Zero.Phase = 3;
		  SASzero_InProcess = 1;
		}
		if(SASzero_Request)
		{ // поступил запрос
		  SAS.Zero.SumAngle = 0;
		  SAS.Zero.Time  = 0;
		  SAS.Zero.Phase = 2;
		  SASzero_InProcess = 1;
		}
		break;
	case 2 :
#define   __SASzero_Time     256
		if(SASzero_Request2) SAS.Zero.Phase = 3;
	   // нахождение нуля SAS для калибровки
	    if(!CAN_SAS_Fail &&
	       Move_Direct && // флаг движения прямо
	       Steer_sen)
	    { if(SAS.Zero.Time < __SASzero_Time)
  	      {  SAS.Zero.SumAngle += Steer_sen;
  	         SAS.Zero.Time++;
  	      }
	      else // найден угол
	      { SAS.Zero.Angle = SAS.Zero.SumAngle /__SASzero_Time;
	  	    // проверяем  SAng - порог CFG
		    if(Steer_sen < (SAS.Zero.Angle + SAS.Zero.SAng) &&
		       Steer_sen > (SAS.Zero.Angle - SAS.Zero.SAng))
		         SAS.Zero.Phase++;   // идем дальше
		    else SAS.Zero.Phase = 1; // возврат на повтор
	      }
	    }
		break;
	case 3 :  // посылаем в CANS
		CAN_Send_SASzero();
		if(SASzero_Request2)
			 SAS.Zero.Phase = 6; // пропускаем запись признака
		else SAS.Zero.Phase++;
		break;
	case 4 : // запись в CFG признака выполнения калибровки
	    // заполняем буфер
	    for (uint8_t i = 0; i < SizeCFGBuf; i++)
		   DSC_Const_Buf[i] = IEE_DSC_Const[i];
	    // признак выполнения калибровки SAS
	    uint16_t Tmp = DSC_Const_Buf[__SAS_Sign_ADDR];
		Tmp = (Tmp & 0x00FF) | __SAS_Calibr_Sign;
		DSC_Const_Buf[__SAS_Sign_ADDR] = Tmp;
		// запрос на запись CFG
		DSC_Const_WrIEE_req = 1;
	    SAS.Zero.Phase++;
		break;
	case 5 :
	    // ждем завершения записи CFG
		if(SAS_Calibr_Cmpl) 	//Ok
		   SAS.Zero.Phase++;
		break;
	case 6 :// end
		SAS.Zero.Phase = 0;
		SASzero_Request = 0;
		SASzero_Request2 = 0;
		break;
	}
} // end SAS_DoneSero()

void CheckError_AGS(void) // ошибки AGS
{
// при рестарте выключается реле
// ставятся ошибки по CAN и Upit ??
// вводим запрет при выключении реле
#define   __TestDis_Time   400    // 2c

    if(AGS_Upit_ON)
    { if(TestDisable_Cnt)
    	 TestDisable_Cnt--;
      else TestSVDC_Disable = 0;
    }
    else
    { TestDisable_Cnt = __TestDis_Time;
      TestSVDC_Disable = 1; // общий запрет тестов для подключенных к SPL
    }
	// задержка на  установку флага Ok
#define   __VDCsens__Ok_Delay  200     // 1c
	if(SAS.Ok_Delay < __VDCsens__Ok_Delay)
	   SAS.Ok_Delay++;
	else VDCsens_Ok_Delay = 1;

	//---------------------------------------
	if(DSC_AGS_Install &&
	   !AGSzero_InProcess &&
	   !TestSVDC_Disable)
	{ // включено реле и есть в конфигурации
// TimeOut CAN не присоединен
// AGS запускается 0.3c  ???
#define _BusOffTimeAGS    100   //0.5c
#define _BusOnTime        2

		if(!CAN_AGS_Fail)
		{  if((CANS.AGS.Acc_Tout++ > _BusOffTimeAGS) ||
		      (CANS.AGS.Gyro_Tout++ > _BusOffTimeAGS))
			CAN_AGS_Fail = 1;
		}
		else
		{  if((CANS.AGS.Acc_Tout < _BusOnTime) &&
			  (CANS.AGS.Gyro_Tout < _BusOnTime))
			CAN_AGS_Fail = 0;
		}
// Self Test AGS
		if(CANS.AGS.Error & (ST_AccelX_Fail | ST_AccelY_Fail | ST_AccelZ_Fail |
    		                 ST_GyroX_Fail | ST_GyroY_Fail | ST_GyroZ_Fail))
			 AGS_ST_Fail = 1;
		else AGS_ST_Fail = 0;
// CRC AGS
		if(CANS.AGS.Error & Flash_CRC_Fail)
			 AGS_CRC_Fail = 1;
		else AGS_CRC_Fail = 0;
		if(CANS.AGS.Error & Config_CRC_Fail)
			 AGS_CFG_Fail = 1;
		else AGS_CFG_Fail = 0;

// Upit AGS
// без Upit_Low
		if(CANS.AGS.Error & (Upit_High | Upit_Over | VDD_Low))
			 AGS_Upit_Fail = 1;
		else AGS_Upit_Fail = 0;
// INT_Fail AGS
		if(CANS.AGS.Error & AG_INT_Fail)
			 AGS_Data_Fail = 1;
		else AGS_Data_Fail = 0;

// AGS_NotReady
		if((CANS.AGS.Error & AG_Not_Ready) || //пришло от AGS
			!AGS_Upit_ON ||                  // нет питания
			CAN_AGS_Fail)                   // нет CAN
			 AGS_NotReady = 1;
		else AGS_NotReady = 0;

// AGS_Zero_Fail  ошибка калибровки
// ставится если машина стоит и
// гироскоп показывает больше 3dps
// акселерометр показывает больше 3m/c2
#define   __dWz_Zero_Fail   0x01AD  //3deg/c //0x0100  //1,8dps
#define   __Acc_Zero_Fail   0x1B00  //3,35m/c2	20град
#define   __Zero_Fail_Time 	   600  //3c
#define   __Acc_CFG_Fail    0x0990  //1,2m/c2	7град

		if(!Speed_VX_est &&  // появляется с 3км/ч
		   !Speed_VX_TCO)
		{ // Omega_Z
		  if(Omega_Z_est > __dWz_Zero_Fail ||
			 Omega_Z_est < -__dWz_Zero_Fail)
		  { if(AGS.WZ_FailCnt < __Zero_Fail_Time)
			   AGS.WZ_FailCnt++;
			else WZ_Fail = 1;
		  }
		  else
		  {	if(AGS.WZ_FailCnt)
			   AGS.WZ_FailCnt--;
		    else WZ_Fail = 0;
		  }
		  // Omega_Y
		  if(Omega_Y_sen > __dWz_Zero_Fail ||
		     Omega_Y_sen < -__dWz_Zero_Fail)
		  { if(AGS.WY_FailCnt < __Zero_Fail_Time)
		 	   AGS.WY_FailCnt++;
		    else WY_Fail = 1;
		  }
		  else
		  {	if(AGS.WY_FailCnt)
		 	   AGS.WY_FailCnt--;
		    else WY_Fail = 0;
		  }
		  // Omega_X
		  if(Omega_X_sen > __dWz_Zero_Fail ||
		     Omega_X_sen < -__dWz_Zero_Fail)
		  { if(AGS.WX_FailCnt < __Zero_Fail_Time)
		 	   AGS.WX_FailCnt++;
		    else WX_Fail = 1;
		  }
		  else
		  {	if(AGS.WX_FailCnt)
		 	   AGS.WX_FailCnt--;
		    else WX_Fail = 0;
		  }
		  // Accel_X
		  if(AccelX.Value > __Acc_Zero_Fail ||
			 AccelX.Value < -__Acc_Zero_Fail)
		  {
			if(AGS.AccX_FailCnt < __Zero_Fail_Time)
			   AGS.AccX_FailCnt++;
			else AccX_Fail = 1;
		  }
		  else
		  {	if(AGS.AccX_FailCnt)
			   AGS.AccX_FailCnt--;
		    else AccX_Fail = 0;
		  }
		  if(DSC_OffSet_AccX > __Acc_CFG_Fail ||
			 DSC_OffSet_AccX < -__Acc_CFG_Fail)
			   CFG_Ax_Fail = 1;
		  else CFG_Ax_Fail = 0;
		  // Accel_Y
		  if(AccelY.Value > __Acc_Zero_Fail ||
			 AccelY.Value < -__Acc_Zero_Fail)
		  {
			if(AGS.AccY_FailCnt < __Zero_Fail_Time)
			   AGS.AccY_FailCnt++;
			else AccY_Fail = 1;
		  }
		  else
		  {	if(AGS.AccY_FailCnt)
			   AGS.AccY_FailCnt--;
		    else AccY_Fail = 0;
		  }
		  if(DSC_OffSet_AccY > __Acc_CFG_Fail ||
			 DSC_OffSet_AccY < -__Acc_CFG_Fail)
			   CFG_Ay_Fail = 1;
		  else CFG_Ay_Fail = 0;
		}
		if(AGS_ZeroFail_Enable &&
		   (WZ_Fail ||
			AccX_Fail ||
			AccY_Fail ||
			CFG_Ax_Fail ||
			CFG_Ay_Fail))
			 AGS_Zero_Fail = 1;
		else AGS_Zero_Fail = 0;

// AGS_Mount_Fail  ошибка ориентации
// ставится если  AccZ < 1G
#define   __AccZ_1G_ThrHigh  0x5200  // 10,25m/c2
#define   __AccZ_1G_ThrLow   0x4A00  // 9,25m/c2  20град
#define   __Mount_Fail_Time  1000	 // 5c

#define Bad_Sign_Ax    AxValid.Bad.Bits.b0
#define Bad_Sign_Ay    AyValid.Bad.Bits.b0

	    if(!AGS_NotReady)
		{
		   if(Acc_Z_sen < __AccZ_1G_ThrHigh &&
		      Acc_Z_sen > __AccZ_1G_ThrLow &&
			  !Bad_Sign_Ax &&
			  !Bad_Sign_Ay)
		   {
			   if(AGS.MountFail_Cnt)
				  AGS.MountFail_Cnt--;
			   else AGS_Mount_Fail = 0;
		   }
		   else
		   {
			 if(AGS.MountFail_Cnt < __Mount_Fail_Time)
				AGS.MountFail_Cnt++;
			 else
			 { if(AGS_MountFail_Enable)
				  AGS_Mount_Fail = 1;
			 }
		   }
		}
	}
	else
	// при выключенном реле ставятся ошибки	CAN
	{ //CANS.AGS.Acc_Tout = 0;
	  //CANS.AGS.Gyro_Tout = 0;
	  CAN_AGS_Fail = 0;
	}

	// флаг AGS_Ok
	// VDC_FullOp=0 раньше обнаружения ошибки
	// зажигание лампы и запрет регулирования
	// если AGS_Ok=1 сбрасываются ошибки предыдущего включения
#define   __AGS_NotOk_Time     100     // 0,5c
#define   __SpeedX_AGS         0x0A00

	// сброс
    if(AGS_NotReady ||  // включено реле
       s_AGS_Error	||
	   Vehicle.StateAGS != __AGS_Calibrate ||
	   AGS.MountFail_Cnt > __AGS_NotOk_Time)
    	AGS_Ok = 0;
    else
    if(Speed_VX_est > __SpeedX_AGS && // не было ошибки на предыдущем включении
       VDCsens_Ok_Delay &&
	   !AGS.MountFail_Cnt)
    	AGS_Ok = 1;

	// самокалибровка гироскопа
	if(GYRO_Zero_Enable &&
	   !Speed_VX_est &&
	   !Gyro_Zero &&
	   (WZ_Fail ||
	    WY_Fail ||
		WX_Fail))
	{ Gyro_Zero = 1;
	  AGSzero_Request = 1;
	}
} // end CheckError_AGS(); // ошибки AGS

void CheckError_SAS(void) // ошибки SAS
{
	// флаг SAS_Test_Disable
	if(DSC_SAS_Install &&
	   !SASzero_InProcess &&
	   !TestSVDC_Disable)
		 SAS_Test_Disable = 0;
	else SAS_Test_Disable = 1;

	if(!SAS_Test_Disable)
	{ // включено реле и есть в конфигурации
      // TimeOut CAN не присоединен
// SAS запускается 0.1c
#define _BusOffTimeSAS    50   //0.25c

	  if(!CAN_SAS_Fail &&
		  CANS.SAS.Tout++ > _BusOffTimeSAS)
		  CAN_SAS_Fail = 1;

      // тестирование отсутствия сигнала(облом пупсика)
#define __MDCfail_Time         0x0258 // 3c
#define __MDCvalue_Threshold   0x0003
	  switch(SAS.MDC_Phase)
	  {
		case 0 :
		case 1 :
			break;
		case 2 : // сравнение
			if(!SASdata_Fail)
			{ if((SAS.value > (SAS.Value_First + __MDCvalue_Threshold)) ||
			     (SAS.value < (SAS.Value_First - __MDCvalue_Threshold)))
				// было изменение
			  { SAS.MDC_Phase = 1;
				SASmech_Fail = 0;
			  }
			  else
			  { if(!SASmech_Fail)
			    { if(Forward_Move) SAS.MDCfail_Cnt++;
			      if((SAS.MDCfail_Cnt > __MDCfail_Time) && !SASdata_Fail)
				    SASmech_Fail = 1;
			    }
			  }
			}
			//эмуляция и TruckSim ставит ошибку
			if(DSC_Emul_Fl || DSC_TruckSim) SAS.MDC_Phase = 1;
			break;
		case 3 :// если в начале посылается не  известно что
			if((SAS.MDCfail_Cnt++ > 10) &&
			   !SASdata_Fail)
			{  SAS.MDCfail_Cnt = 0;
			   SAS.Value_First = SAS.value;
			   SAS.MDC_Phase = 2;
			}
			break;
	  }

//тестирование не установленного нуля (не калиброван)
// нет ошибок ; нормальное питание ;
#define   _DWZ_Fail_Thresh    0x01AD  // 3deg/c
#define   __ZeroFail_Time     0x0258  // 3c
#define   __SpeedX_SAS        0x0A00
	  if(Speed_VX_est > __SpeedX_SAS)
	  {
		if(!(s_SAS_Error & __Mask_SAS_Error) &&
		   !(s_AGS_Error & __Mask_AGS_Error) &&
			No_Maneuver &&
		    !DSC_Emul_Fl) //эмуляция ставит ошибку
		{
		  //проверяем отклонение руля от угла вычисленного через обратный Ackermann
		  if((Delta_OmegaZ > _DWZ_Fail_Thresh) ||
			 (Delta_OmegaZ < -_DWZ_Fail_Thresh) ||
			 (SAS.Drift > SASdrift.Reliable) ||
			 (SAS.Drift < -SASdrift.Reliable))
		  {
		    if(SAS.Zero.Fail_Cnt < __ZeroFail_Time)
			   SAS.Zero.Fail_Cnt++;
		    else SAS_DWZ_Fail = 1;
		  }
		  else
		  { if(SAS.Zero.Fail_Cnt)
			   SAS.Zero.Fail_Cnt--;
			else SAS_DWZ_Fail = 0;
		  }
		}
		// движениe прямо
		if(Move_Direct) // флаг движения прямо
		{ // флаг большого руля при движении прямо
    	  // проблема с боковым уклоном или ветром
#define   __SAS_Direct_Thr   1620    //90*18
#define   __ZeroDirect_Time  1000    // 5c
  		  if(Steer_sen > __SAS_Direct_Thr ||
  		     Steer_sen < -__SAS_Direct_Thr)
  		  {
  			if(SAS.Zero.ZeroD_Cnt <__ZeroDirect_Time)
  			   SAS.Zero.ZeroD_Cnt++;
  		    else SAS_ZeroDirect_Fail = 1;
  		  }
  		  else
  		  {	if(SAS.Zero.ZeroD_Cnt)
  			   SAS.Zero.ZeroD_Cnt--;
  		    else SAS_ZeroDirect_Fail = 0;
  		  }
  		  // проверяем Range_Detection
#define   __RangeFail_Time     200     // 1c
  		  if(!Steer_sen ||
  			 !Range_Detection)
  		  { // нет сигнала и едет
  			if(SAS.Range_Cnt < __RangeFail_Time)
  			   SAS.Range_Cnt++;
  			else SAS_Range_Fail = 1;
  		  }
  		  else
  		  { SAS.Range_Cnt = 0;
  		    SAS_Range_Fail = 0;
  		  }
		} // end движениe прямо
	  }  // end if(Speed_VX}
	}
	else
	// при выключенном реле ставятся ошибки	CAN
    { // CANS.SAS.Tout = 0;
      // SAS.Range_Cnt = 0;
       CAN_SAS_Fail = 0;
       SAS_Range_Fail = 0;
    }

	// флаг SAS_Ok
	// VDC_FullOp=0 раньше обнаружения ошибки
	// зажигание лампы и запрет регулирования
	// если SAS_Ok=1 сбрасываются ошибки предыдущего включения
#define   __SAS_NotOk_Time     100     // 0,5c

	// сброс
    if(SAS_Test_Disable ||  // выключено питание
       s_SAS_Error	||
	   Vehicle.StateSAS != __SAS_Calibrate ||
	   SAS_Range_Fail)
	   SAS_Ok = 0;
    else
    // установка
    if(Speed_VX_est > __SpeedX_SAS && // не было ошибки на предыдущем включении
       VDCsens_Ok_Delay)
	   SAS_Ok = 1;

	// установка ошибки SASzero_Fail
	if(SAS_ZeroFail_Enable &&
	   SAS_DWZ_Fail)        // отклонение руля от Ackermann
	     SASzero_Fail = 1;
	else SASzero_Fail = 0;

} // end CheckError_SAS(); // ошибки SAS

#endif
//------------------------------End Block AGS---------------------------------

//-----------------------------    Block __CAN_Trailer -----------------------
#ifdef __CAN_Trailer

void EBS25data(_TypeDefEBS25* EBS25)
{
	EBS25->Press_1L = CANT_Rx0_Message.Data[0];
	EBS25->Press_1R = CANT_Rx0_Message.Data[1];
	EBS25->Press_2L = CANT_Rx0_Message.Data[2];
	EBS25->Press_2R = CANT_Rx0_Message.Data[3];
	EBS25->Press_3L = CANT_Rx0_Message.Data[4];
	EBS25->Press_3R = CANT_Rx0_Message.Data[5];
	EBS25->Status5 =  CANT_Rx0_Message.Data[6];
}

#define _EBS22data(N) {\
	Trailer##N.ToutEBS22 = 0;\
	FindTrailer##N = 1;\
} //end macroc

void EBS22data(_TypeDefEBS22* EBS22)
{
	EBS22->Status1.Byte = CANT_Rx0_Message.Data[0];
    EBS22->Status2.Byte = CANT_Rx0_Message.Data[1];
    EBS22->Status3.Byte = CANT_Rx0_Message.Data[2];
    EBS22->Status4.Byte = CANT_Rx0_Message.Data[3];
    EBS22->AxleLoadSum = ((int16_t)CANT_Rx0_Message.Data[5]<<8) +
	                      (int16_t)CANT_Rx0_Message.Data[4];
}

#define _EBS21Tout(N) {\
	Trailer##N.ToutEBS21 = 0;\
} //end macroc

void EBS21data(_TypeDefEBS21* EBS21)
{
	EBS21->Status1.Byte = CANT_Rx0_Message.Data[0];
	EBS21->Status2.Byte = CANT_Rx0_Message.Data[1];
	EBS21->Speed = ((int16_t)CANT_Rx0_Message.Data[3]<<8) +
			        (int16_t)CANT_Rx0_Message.Data[2];
	EBS21->AccY =  CANT_Rx0_Message.Data[7];
} //end EBS21data()


void CANT_Send_EBS11(void)
{//Transmission repetition time: 10 ms
#define   _Status2_VehicleType     0x00  //?????
	EBS11Cnt++;
	CANT_Tx_Message.ExtId = _ExtID_make(EBS11_Pri,(EBS11_PGN | Trailer1_Adr),Truck_Adr);
// Status1
	CANT_Tx_Message.Data[0] = 0;
	if(ABS_Active) CANT_Tx_Message.Data[0] |= __Bit12;  // ABS_Active
	if(RetarderActive) CANT_Tx_Message.Data[0] |= __Bit34; // RetarderActive;
	if(ASR_Brake_Active) CANT_Tx_Message.Data[0] |= __Bit56; // ASRbrakeActive;
	if(ASR_EngineActive) CANT_Tx_Message.Data[0] |= __Bit78;// ASRengineActive;
// Status2
	CANT_Tx_Message.Data[1] = _Status2_VehicleType | __NotDefinedBit78;
	if(Stop_Request) CANT_Tx_Message.Data[1] |= __Bit12; //Brake light switch;
	if(Truck_VDC_Active)  CANT_Tx_Message.Data[1] |= __Bit56; //VDCActive;
// Service brake demand value
// Resolution:  5/256 kPa/bit gain, 0 kPa offset
// Data range:  0 kPa to 1255 kPa
	if(EBS11_Trailer_PS &&             // разрешено в конфигурации
	   !Trailer_BPS_Fail)// && !Trailer_BPS_Fail2) // нет ошибок
//	   !LoadResist_Enable)      // достоверен сигнал датчика
	{ CANT_Tx_Message.Data[2] = _Lo_16(TrailerPress);
	  CANT_Tx_Message.Data[3] = _Hi_16(TrailerPress);
	}
	else
	{ if(Trailer.Press &&     //есть регулирование
		 Trailer.Press > Brake.DemandValue)
	  { CANT_Tx_Message.Data[2] = _Lo_16(Trailer.Press);
	    CANT_Tx_Message.Data[3] = _Hi_16(Trailer.Press);

	  }
	  else
	  { if(!(CAN_BPS_Fail && Break_PS_CAN) &&
		   !Brake_PS_OffFail &&
		   !Brake_PS_OnFail)
	    { CANT_Tx_Message.Data[2] = _Lo_16(Brake.DemandValue);
	      CANT_Tx_Message.Data[3] = _Hi_16(Brake.DemandValue);
	    }
	    else // ошибка
	    { CANT_Tx_Message.Data[2] = 0xFF;
	      CANT_Tx_Message.Data[3] = 0xFE;
	    }
	  }
	}
// Park brake demand value
	CANT_Tx_Message.Data[4] = 0;
// Retarder demand value
	CANT_Tx_Message.Data[5] = 0x7D;
// Relative brake demand value for front or left vehicle side
// Data range:  0 % to 100 %
	CANT_Tx_Message.Data[6] = Trailer.BrakeDemandLeft;
// Relative brake demand value for	rear or right vehicle side
	CANT_Tx_Message.Data[7] = Trailer.BrakeDemandRight;

// запуск передачи в соответствующем режиме
	CANT_Switch_Mode(&CANT);

} // end CAN_Send_EBS11()

void CANT_Send_EBS12(void)
{//Transmission repetition time: 100 ms
	EBS12Cnt++;
	CANT_Tx_Message.ExtId = _ExtID_make(EBS12_Pri,EBS12_PGN,Truck_Adr);
// Byte 1
	CANT_Tx_Message.Data[0] = __NotDefinedBit78;
	if(RetarderActive)    CANT_Tx_Message.Data[0] |= __Bit12; // RetarderActive;
	if(!ASR_SW_Condition)
	{ if(DSC_Roll_Enable)    CANT_Tx_Message.Data[0] |= __Bit34; // ROP Enable;
	  if(CFG_DYC_Break_Enable && CFG_DYC_Engine_Enable)
		                     CANT_Tx_Message.Data[0] |= __Bit56; // DYC Enable;
	}
// Byte 2
	CANT_Tx_Message.Data[1] = __NotDefinedBit56 | __NotDefinedBit78;
	if(!ASR_SW_Condition)
	{ CANT_Tx_Message.Data[1] |= __Bit12; // ROP Trailer Enable;
	  CANT_Tx_Message.Data[1] |= __Bit34; // DYC Trailer Enable;
	}
// Byte 3
	CANT_Tx_Message.Data[2] = __NotDefinedBit78 || __NotDefinedBit12;
	if(ABS_OffRoad) CANT_Tx_Message.Data[2] |= __Bit34; // ABSoffRoad Switch
	CANT_Tx_Message.Data[2] |= __Bit56; //	Pneumatic control line
// Byte 4
	CANT_Tx_Message.Data[3] = __NotDefinedByte;
// Byte 5-6 Road Curvature
	if(Curvature_Enable)            // разрешено в конфигурации
	{ CANT_Tx_Message.Data[4] = _Lo_16(ROP.Turn.Curvature);
	  CANT_Tx_Message.Data[5] = _Hi_16(ROP.Turn.Curvature);
	}
	else
	{ CANT_Tx_Message.Data[4] = __NotDefinedByte;
	  CANT_Tx_Message.Data[5] = __NotDefinedByte;
	}
// Byte 7-8 Wheel Based Vehicle Speed
	CANT_Tx_Message.Data[6] = _Lo_16(Speed_VX_est);
	CANT_Tx_Message.Data[7] = _Hi_16(Speed_VX_est);

// запуск передачи в соответствующем режиме
	CANT_Switch_Mode(&CANT);

} // end CAN_Send_EBS12()

//-----------------макрос Set Phase Mode----------------------
#define _SetPhMode(Ph,M) {\
	  CANT.Phase = Ph; \
	  CANT.Mode = M;   \
} //end macroc
//------------макрос переход в 100tr--------------------------
#define _Set100Tr(Ph) {\
	  CANT.Phase = Ph;      \
	  CANT.TrCnt = __100_Tr;\
} //end macroc
//------------------------------------------------------------
void CheckError_CANT(void)
{
#define __BusOffTimeCANT       500 //100   //0.5c
#define __BusOnTimeCANT        20 // 2
	if(CANT_Enable)
	{
// Счетчик ошибок передачи пакетов
	  CANT.TxErrCnt = _B2_32(hCANT.Instance->ESR);
// TimeOut CAN не присоединен
/*	  if(!CANT_Fail)
	  {
		  if(TrailerFind &&                // найден CAN прицеп
		     CANT.TxErrCnt > 127 &&
		     CANT.Tout++ > __BusOffTimeCANT)
		     CANT_Fail = 1;
	  }
	  else if(CANT.Tout < __BusOnTimeCANT)  CANT_Fail = 0;
*/
	  if(CANT.Tout < __BusOffTimeCANT)
		 CANT.Tout++;
	  if(TrailerFind &&                // найден CAN прицеп
		 CANT.TxErrCnt > 127 &&
	 	 CANT.Tout == __BusOffTimeCANT)
	 	 CANT_Fail = 1;
	  if(CANT_Fail && CANT.Tout < __BusOnTimeCANT)
		 CANT_Fail = 0;

// флаг нормальной работы CANT
//	  if(CANT.Tout < __2_Tr) CANT_Ok = 1;
//	  else CANT_Ok = 0;

	  if(CANT.Tout > (__1_Tr+2))
		   CANT_Ok = 0;
	  else CANT_Ok = 1;

// счетчик 1 секунды
	  if(CANT_Ok)
	       CANT.Cnt1s++;
	  else CANT.Cnt1s = 0;

// --------машина переключения на одно-прoводной режим--------
// локальная дает меньше кода в switch
      uint8_t OkCAN = CANT_Ok;
	  switch (CANT.Phase)
	  {	case 0:
		    if(!OkCAN && OneWire_Enable)
	        { CANT.Phase = 1;
	          CANT.TrCnt = __5_Tr;
	        }
			else CANT.Mode = __TwoWire;
			break;
			// 1 2 3 1
	    case 1: // 5tr наблюдениe
			if(!CANT.TrCnt--)
		    { if(OkCAN) CANT.Phase = 0;
	    	  else
		    { CANT.TrCnt = __10_Tr;
    	      _SetPhMode(2,__H_mode)  // 10tr однопроводный режим CANTH
		    }
		    }
			break;
	    case 2:                      // 10tr однопроводный режим CANTH
	    	CANT_Mode = 0;           // Mode H_Wire
	    	if(OkCAN) _Set100Tr(4)   // переход в 100tr CANTH
			if(!CANT.TrCnt--)
			{ CANT.TrCnt = __10_Tr;
			  _SetPhMode(3,__L_mode) // переход в 10tr однопроводный режим CANTL
			}
	    	break;
	    case 3:                      // 10tr однопроводный режим CANTL
	    	CANT_Mode = 1;           // Mode L_Wire
	    	if(OkCAN) _Set100Tr(5)   // переход в 100tr CANTL
	    	if(!CANT.TrCnt--)
	    	{ CANT.TrCnt = __5_Tr;
    	      _SetPhMode(1,__TwoWire) //переход в 5tr наблюдениe двухпроводный режим ^
	    	}
			break;

	    case 4: // 100tr возобновление режим CANTH
	    case 5: // 100tr возобновление режим CANTL
	    	if(CANT.TrCnt) CANT.TrCnt--;
	    	if(!OkCAN && CANT.TrCnt < (__100_Tr-__20_Tr))
	    	{ // втечение 1с возникла ошибка
	    	  // переход в другой однопроводный режим
		      CANT.TrCnt = __10_Tr;
	    	  if(CANT_Mode)
				   _SetPhMode(2,__H_mode)  //10tr однопроводный режим CANTH
	    	  else _SetPhMode(3,__L_mode)  //10tr однопроводный режим CANTL
	    	}
	    	if(CANT.Cnt1s > (__100_Tr-__1_Tr))
	    	{  CANT.TrCnt = __5_Tr;
			  _SetPhMode(6,__TwoWire)  // 5tr двухпроводный режим
	    	}
			break;
	    case 6: // 5tr двухпроводный режим после нормального однопроводного
	    	if(!CANT.TrCnt--)
	    	{ if(OkCAN)  CANT.Phase = 0;	// двухпроводный режим Ok
	    	  else
	    	  { // возврат в однопроводный режим который был
		        if(!CANT_Mode)
		        { CANT.Mode = __H_mode;
		          _Set100Tr(4)   // переход в 100tr CANTH
		        }
		        else
		        { CANT.Mode = __L_mode;
		          _Set100Tr(5)   // переход в 100tr CANTL
		        }
	    	  }
	    	}
			break;
	  }
	}
	else s_CANT_Error = 0;

} // end CheckError_CANT()

void CANT_Switch_Mode(TypeDef_CANT* CANT)
{
	if(CANT_Enable)
	{ // выбор режима
 	  switch (CANT->Mode)
	  {	case __TwoWire:
		        _CANTH_Enable;
		        _CANTL_Enable;
	            break;
	    case __H_mode:
	    	    _CANTH_Enable;
		        _CANTL_Disable;
		        break;
	    case __L_mode:
	    	    _CANTL_Enable;
		        _CANTH_Disable;
		        break;
	  }
	// Set the no automatic retransmission
	// нельзя при обрывах не работает
 	/*
	if(CANT->Flags.Bits.b5) // CANT_NART
		  SET_BIT(hCANT.Instance->MCR, CAN_MCR_NART);
	else  CLEAR_BIT(hCANT.Instance->MCR, CAN_MCR_NART);
	*/
	  // запуск передачи
	  HAL_CAN_Transmit_IT(&hCANT);
	}
} // end  CANT_Switch_Mode(&CANT)

#define	__ToutEBS21  0x14   // 100mc
#define	__ToutEBS22  0xC8   // 1000mc
#define _ToutRxCANT(N) {\
     if(Trailer##N.ToutEBS21 < __ToutEBS21) \
		Trailer##N.ToutEBS21++;\
     else {Trailer##N.EBS21_Status1 = 0xFF; \
           Trailer##N.EBS21_Status2 = 0xFF;}\
     if(Trailer##N.ToutEBS22 < __ToutEBS22)  \
	    Trailer##N.ToutEBS22++;\
     else {Trailer##N.EBS22_Status1 = 0xFF; \
		   Trailer##N.EBS22_Status2 = 0xFF; \
		   Trailer##N.EBS22_Status4 = 0xFF; \
		   Trailer##N.EBS22.AxleLoadSum = 0xFE00;}\
} //end macroc

#define _EBS21_Flags(Name) {\
     if(Trailer1.EBS21_##Name == __BitsON || \
        Trailer2.EBS21_##Name == __BitsON || \
        Trailer3.EBS21_##Name == __BitsON || \
        Trailer4.EBS21_##Name == __BitsON || \
        Trailer5.EBS21_##Name == __BitsON )  \
	          Trailer_##Name = 1; \
        else  Trailer_##Name = 0; \
} //end macroc

#define _EBS22_Flags(Name) {\
     if(Trailer1.EBS22_##Name == __BitsON ||\
        Trailer2.EBS22_##Name == __BitsON ||\
        Trailer3.EBS22_##Name == __BitsON ||\
        Trailer4.EBS22_##Name == __BitsON ||\
        Trailer5.EBS22_##Name == __BitsON )  \
	          Trailer_##Name = 1; \
        else  Trailer_##Name = 0; \
} //end macroc

void    TrailerCAN_Analysis(void)
{   // Time Out
	_ToutRxCANT(1);
	_ToutRxCANT(2);
	_ToutRxCANT(3);
	_ToutRxCANT(4);
	_ToutRxCANT(5);
	if((FindTrailer1 && (Trailer1.ToutEBS22 < __ToutEBS22)) ||
	   (FindTrailer2 && (Trailer2.ToutEBS22 < __ToutEBS22)) ||
       (FindTrailer3 && (Trailer3.ToutEBS22 < __ToutEBS22)) ||
       (FindTrailer4 && (Trailer4.ToutEBS22 < __ToutEBS22)) ||
       (FindTrailer5 && (Trailer5.ToutEBS22 < __ToutEBS22)))
          Trailer_StatusOk = 1;
	else  Trailer_StatusOk = 0;     //bit 1
	// статусы
	if(CANT_Enable && StatusTrailer_Enable)  // СAN прицепа установлен
	{
		_EBS21_Flags(ABS_Active);   //bit 5
		_EBS21_Flags(Brake_Active); //bit 3
		_EBS21_Flags(VDC_Active);   //bit 6
//		_EBS22_Flags(RedWarn);
		if(Trailer1.EBS22_RedWarn == __BitsON ||
		   Trailer1.EBS22_AmberWarn == __BitsON)
	          Trailer_RedWarn = 1;  //bit 4
        else  Trailer_RedWarn = 0;

		_EBS22_Flags(StopLampReq);   //bit 0
		_EBS22_Flags(SupplyBrakeReq);//bit 2
	}
	else  TrailerStatus &= 0x80; // без Stop_Request

} // end TrailerCAN_Analysis()

void     TrailerCAN_Receive(void)
{
	vCANT.Rx_ID = CANT_Rx0_Message.ExtId;
	CANT.Tout = 0;
	// анализируем что приняли
	if((vCANT.Rx_ID == _ExtID_make(EBS21_Pri,(EBS21_PGN | Truck_Adr),Trailer1_Adr)) ||
	   (vCANT.Rx_ID == _ExtID_make(EBS21_Pri,(EBS21_PGN | Truck_Adr),Trailer2_Adr)) ||
	   (vCANT.Rx_ID == _ExtID_make(EBS21_Pri,(EBS21_PGN | Truck_Adr),Trailer3_Adr)) ||
	   (vCANT.Rx_ID == _ExtID_make(EBS21_Pri,(EBS21_PGN | Truck_Adr),Trailer4_Adr)) ||
	   (vCANT.Rx_ID == _ExtID_make(EBS21_Pri,(EBS21_PGN | Truck_Adr),Trailer5_Adr)))
	{  //кадр EBS21
	   EBS21Cnt++;
	   switch(_B0_32(vCANT.Rx_ID))
	   {   case Trailer1_Adr: EBS21data(&(Trailer1.EBS21));
	                          _EBS21Tout(1);
	                          break;
		   case Trailer2_Adr: EBS21data(&(Trailer2.EBS21));
			                  _EBS21Tout(2);
			                  break;
		   case Trailer3_Adr: EBS21data(&(Trailer3.EBS21));
			                  _EBS21Tout(3);
			                  break;
		   case Trailer4_Adr: EBS21data(&(Trailer4.EBS21));
			                  _EBS21Tout(4);
			                  break;
		   case Trailer5_Adr: EBS21data(&(Trailer5.EBS21));
			                  _EBS21Tout(5);
			                  break;
	   }
	} // end EBS21
	if((vCANT.Rx_ID == _ExtID_make(EBS22_Pri,EBS22_PGN,Trailer1_Adr)) ||
	   (vCANT.Rx_ID == _ExtID_make(EBS22_Pri,EBS22_PGN,Trailer2_Adr)) ||
	   (vCANT.Rx_ID == _ExtID_make(EBS22_Pri,EBS22_PGN,Trailer3_Adr)) ||
	   (vCANT.Rx_ID == _ExtID_make(EBS22_Pri,EBS22_PGN,Trailer4_Adr)) ||
	   (vCANT.Rx_ID == _ExtID_make(EBS22_Pri,EBS22_PGN,Trailer5_Adr)))
	{ //кадр EBS22
	   EBS22Cnt++;
	   switch(_B0_32(vCANT.Rx_ID))
	   {   case Trailer1_Adr: EBS22data(&(Trailer1.EBS22));
	                          _EBS22data(1);
	                          break;
		   case Trailer2_Adr: EBS22data(&(Trailer2.EBS22));
           	   	   	   	   	  _EBS22data(2);
                              break;
		   case Trailer3_Adr: EBS22data(&(Trailer3.EBS22));
                              _EBS22data(3);
                              break;
		   case Trailer4_Adr: EBS22data(&(Trailer4.EBS22));
                              _EBS22data(4);
                              break;
		   case Trailer5_Adr: EBS22data(&(Trailer5.EBS22));
                              _EBS22data(5);
                              break;
	   }
	} // end EBS22
	if((vCANT.Rx_ID == _ExtID_make(EBS25_Pri,EBS25_PGN,Trailer1_Adr)) ||
	   (vCANT.Rx_ID == _ExtID_make(EBS25_Pri,EBS25_PGN,Trailer2_Adr)) ||
	   (vCANT.Rx_ID == _ExtID_make(EBS25_Pri,EBS25_PGN,Trailer3_Adr)) ||
	   (vCANT.Rx_ID == _ExtID_make(EBS25_Pri,EBS25_PGN,Trailer4_Adr)) ||
	   (vCANT.Rx_ID == _ExtID_make(EBS25_Pri,EBS25_PGN,Trailer5_Adr)))
	{ //кадр EBS25 Wabco - 100ms
	   EBS25Cnt++;
       switch(_B0_32(vCANT.Rx_ID))
       {    case Trailer1_Adr: EBS25data(&(Trailer1.EBS25)); break;
            case Trailer2_Adr: EBS25data(&(Trailer2.EBS25)); break;
            case Trailer3_Adr: EBS25data(&(Trailer3.EBS25)); break;
            case Trailer4_Adr: EBS25data(&(Trailer4.EBS25)); break;
            case Trailer5_Adr: EBS25data(&(Trailer5.EBS25)); break;
       }
	} // end EBS25
} // end TrailerCAN_Receive()

void     TrailerCAN_Send(void)
{
	CANT.Cnt5ms ++;
// флаг разрешения передачи в CANT
    if((CANT.Cnt5ms > __30_Tr &&
        DSC_CANT_Install) ||
    	TrailerFind)
    	CANT_Enable = 1;
// передачи  в CANT
    if(CANT_Enable)
	{
      if(!(CANT.Cnt5ms & 0x01)) // четные
 		   CANT_Send_EBS11(); // посылка EBS11 в CANT раз в 10мс
      else
      if(CANT.Cnt5ms == 19)
      {  CANT.Cnt5ms = 0xFF;
    	 CANT_Send_EBS12(); // посылка EBS12 в CANT раз в 100мс
      }
	}
} // end TrailerCAN_Send()
#endif
//------------------------------End Block __CAN_Trailer -----------------------

void CheckError_BPS(void) // ошибки BPS
{ //5mc
#define __BusOffTimeBPS       50  // 0.25c
#define	__PS_Fail_PressOff 0x1400 // 1atm
#define	__PS_Fail_PressOn  0x2800 // 2atm
#define	__PS_Fail_Time    1000    // 5c
#define	__PS_ClrFail_T    200     // 1c
#define __Brake_AccX   0x0800     // 1m/c^2
#define __Brake_DecX   0x1000     // 2m/c^2 проблемы Retarder AntiGaz
#define	__PS_NC_Level 	8
// нужно использовать BreakP.Val  а не Brake.DemandValue
#ifdef   __AxisF_Compile
// -------------------- Parking_ON -----------------------------
// Parking может не ставиться а TrailerPress будет при ручнике
// CCVS_Parking_Active Parking brake not set !!! не ставится
    if(!Speed_VX_est &&                                // машина не может ехать на ручнике
  	   ((Trailer.AirPress > __PS_Fail_PressOn &&                 // Есть давления ресивера
  	     Trailer.AirPress < (TrailerPress +__PS_Fail_PressOff) && // Есть давлениe прицепа
		 BrakeP.Val < __PS_Fail_PressOff)  ||                  // Не нажата педаль тормоза
  	    Body_Parking_Active ||                  // Dash Board
	    CCVS_Parking_Active ==__BitsON))        // CCVS
  	     Parking_ON = 1;
    else Parking_ON = 0;

	if(TestSVDC_Disable)
	{ // выключено питание
	  s_PrS_Error = 0;
	  CANS.BPS.Tout = 0;
	}
	else
	{ // включено реле и есть в конфигурации
      if(Press_Validation)
	  {
// TimeOut CAN не присоединен
		if(CANS.BPS.Tout < __BusOffTimeBPS)
		   CANS.BPS.Tout++;
		else
	    { if(DSC_BPS_Install &&     // есть в конфигурации
	    	 Break_PS_CAN)
	    	   CAN_BPS_Fail = 1;     // CAN BPS
	      else CAN_BPS_Fail = 0;
	      if(ECAS_PS_Install)
	      { if(Air_Suspension &&
	    	   !Find_ASC4) // ошибка не ставится если ECAS имеет CAN
	    	   CAN_ECAS_PS_Fail = 1; // CAN ECAS PS
	      }
	      else CAN_ECAS_PS_Fail = 0;
	      // сброс в myHAL_CAN_RxCpltCallback
	    }
//-----------------проверка обрывa BPS -------------
	    if(!Break_PS_CAN)
	    { if(ADC_Press < __PS_NC_Level)
	      { if(Brake.Pedal.CntNC < __PS_Fail_Time)
	           Brake.Pedal.CntNC++;
	        else Brake_PS_NC = 1;
	      }
	      else
	      { if(Brake.Pedal.CntNC)
		       Brake.Pedal.CntNC--;
	        else Brake_PS_NC = 0;
	      }
	    }
	    else Brake_PS_NC = 0;
	  }
	  else // not Press_Validation
	  {  CAN_BPS_Fail = 0;
	     CAN_ECAS_PS_Fail = 0;
	     Brake_PS_NC = 0;
	  }

// проверка достоверности стоп-сигнала
// может быть включен при отпушенной педали тормоза
      if(CCVS_Brake_Active == __BitsON)
	  { // включен
         if(Stop_Switch_Test &&                 // CFG
        	Speed_VX_est > __PS_Fail_Speed &&   // Едет
			BrakeP.Val < __PS_Fail_Pmin &&
			!Brake_PS_OnFail) // сначала
         {
   		   if(Brake.Pedal.StopCnt < (__PS_Fail_Time +200))
   		      Brake.Pedal.StopCnt++;
   	       else Stop_Switch_Fail = 1;
         }
	  }
	  else
	  { if(Stop_Switch_Fail &&
		   Brake.Pedal.StopCnt > __PS_ClrFail_T)
		   Brake.Pedal.StopCnt = __PS_ClrFail_T;
		if(Brake.Pedal.StopCnt)
		   Brake.Pedal.StopCnt--;
	    else Stop_Switch_Fail = 0;
	  }

// проверка достоверности сигнала датчика давления Brake Pedal
// есть показания датчика когда не нажат тормоз
	  if(BrakeP.Val > __PS_Fail_PressOn) // Есть сигнал датчика Brake Pedal
	  { if(!DSC_Emul_Fl &&
		   Brake_PS_Off_Test &&   // CFG
		   (!CCVS_Brake_Active && //||		        // Не нажата педаль тормоза
		    (Speed_VX_est > __PS_Fail_Speed &&      // Едет
		     Derivative_VX_est > __Brake_AccX &&	// разгоняется 1m/c^2
		     CAN_Engine.Driver > __Driver_Gaz_On))) // нажат газ
		{
		  if(Brake.Pedal.OffFail < __PS_Fail_Time)
		     Brake.Pedal.OffFail++;
	      else Brake_PS_OffFail = 1; // Неисправен датчик тормозной педали
		}
	  }
	  else
	  { if(Brake_PS_OffFail &&
		   Brake.Pedal.OffFail > __PS_ClrFail_T)
		   Brake.Pedal.OffFail = __PS_ClrFail_T;
		if(Brake.Pedal.OffFail)
		   Brake.Pedal.OffFail--;
	    else Brake_PS_OffFail = 0;
	  }

// Нет показаний датчика когда нажат тормоз или при замедлении
	  if(BrakeP.Val < __PS_Fail_Pmin &&
		 BrakeP.Val)     // Нет сигнал датчика Brake Pedal
	  { if(Brake_PS_On_Test &&    // CFG
		   Speed_VX_est > __PS_Fail_Speed &&     // Едет
		   ((CCVS_Brake_Active == __BitsON &&	 // включен стоп-сигнал
			 !Stop_Switch_Fail) ||               // нет ошибки Stop_Signal
		    ((Derivative_VX_est < -__Brake_DecX || // замедляется 2m/c^2
		      Wheel_FL.ABS.Active ||             // ABS_Active нельзя
		      Wheel_FR.ABS.Active) &&
		     !ROP_BrakeActive &&
		  	 !DYC_BrakeActive)))
	    {
		  if(Brake.Pedal.OnFail < __PS_Fail_Time)
	    	 Brake.Pedal.OnFail++;
	      else Brake_PS_OnFail = 1;
	    }
	  }
	  else
	  { if(Brake_PS_OnFail &&
		   Brake.Pedal.OnFail > __PS_ClrFail_T)
		   Brake.Pedal.OnFail = __PS_ClrFail_T;
		if(Brake.Pedal.OnFail)
		   Brake.Pedal.OnFail--;
	    else Brake_PS_OnFail = 0;
	  }
	}
#endif

#ifdef 	 ADC_AUX2
//----------------      Trailer_PS_AUX2   ---------------
// проверка соответсвия сигналов
// неисправность платы DZ
#define	__PS_Fail_DeltaPress  0x3C00 // 3atm
// существует разница давлений
// давление прицепа больше давления Brake Pedal на 3атм
	if(TestSVDC_Disable)
	{ // выключено питание
	  s_PrS_Error = 0;
	  CANS.BPS.Tout = 0;
	}
	else
	{ // включено реле и есть в конфигурации
      if(Trailer_PS_Install)
      {
//------- проверка обрывa Trailer PS --------------
  	    if(Trailer_NC_Test)
  	    { if(ADC_AUX2 < __PS_NC_Level)
	      {
		    if(Trailer.PS_NC_Cnt < __PS_Fail_Time)
		       Trailer.PS_NC_Cnt++;
	        else Trailer_BPS_NC = 1;
	      }
	      else
	      { if(Trailer.PS_NC_Cnt)
		       Trailer.PS_NC_Cnt--;
	        else Trailer_BPS_NC = 0;
	      }
  	    }
  	    else Trailer_BPS_NC = 0;

    	if(Trailer_PS_Test)
        {
// проверка достоверности сигнала датчика давления прицепа
          if(Trailer_PS_Test &&
             !Parking_ON &&       // не ручнике
    	     Speed_VX_est > __PS_Fail_Speed &&   // Едет
		     !Trailer.Press &&    // Нет давления модели
		     (s_PrS_Error & __Mask_Err_Trailer_BPS) && // Нет ошибок
		     ((Brake.DemandValue - TrailerPress) > __PS_Fail_DeltaPress ||
		      (Brake.DemandValue - TrailerPress) < -__PS_Fail_DeltaPress))
	//		 ((BrakeP.Val - TrailerPress) > __PS_Fail_DeltaPress ||
	//	      (BrakeP.Val - TrailerPress) < -__PS_Fail_DeltaPress))
	      {
    	    if(Trailer.PS_Fail_Cnt < __PS_Fail_Time)
		       Trailer.PS_Fail_Cnt++;
	        else Trailer_BPS_Fail = 1;
	      }
	      else
	      { if(Trailer.PS_Fail_Cnt)
		       Trailer.PS_Fail_Cnt--;
	        else  Trailer_BPS_Fail = 0;
	      }
//------- проверка давления прицепа---------------
#define	__Trailer_Air_Press  0x6400 // 5atm
#define	__Trailer_Press_Min  0x1400 // 1atm

  	      if(Trailer_PS_On_Test &&
  	    	 !Trailer_BPS_NC &&       // нет ошибки обрывa
  	    	  Brake.Front.Air >
		      __Trailer_Air_Press &&  // нормальное давление в рессивере
		     ((HHR_Vx_Stop  &&
			   Parking_ON) ||	        // стоит нa ручнике
		      (!Brake_PS_OffFail &&
//		        BrakeP.Val > __PS_Fail_PressOn)) && // нажат тормоз
		        Brake.DemandValue > __PS_Fail_PressOn)) && // нажат тормоз
		     TrailerPress <__Trailer_Press_Min)  // нет показаний датчика прицепа
  	      {
      	    if(Trailer.Pnevmo_Cnt < __PS_Fail_Time)
  		       Trailer.Pnevmo_Cnt++;
  	        else Trailer_BPS_Fail = 1;
  	      }
	      else
	      { if(Trailer.Pnevmo_Cnt)
		       Trailer.Pnevmo_Cnt--;
	        else Trailer_BPS_Fail = 0;
	      }
        }
      }
      else // Trailer_BPS not CFG
      { Trailer_BPS_Fail = 0;
        Trailer_BPS_NC = 0;
        Trailer_BPS_Fail = 0;
      }
	}
#endif
} // end CheckError_BPS(); // ошибки BPS

#ifdef   __PS_ChangeADR
void     CAN_Send_PS_Cmd(void)
{
	CANS_Tx_Message.ExtId = _ExtID_make(IPS_Pri,IPS_PGN,IPS_Adr);
	for (uint8_t i = 0; i < 8; i++)
		CANS_Tx_Message.Data[i] = PS.CAN_TxData[i];
	HAL_CAN_Transmit_IT(&hCANS);   // запуск передачи

} // end CAN_Send_PS_Cmd();

// процедура смены адреса CAN датчика давления
void PS_ChangeADR(void)
{
	switch(PS.Phase)
	{
	case 0 :
		if(PS_Adr_Request)
		{ PS_Adr_InProcess = 1;
		  PS_Adr_Request = 0;
#ifdef   EN_SPL_Pin
		  _SENS_Upit_Off;
#endif
		  PS.Adr = _Hi_16(Diag.Pdes); //адрес
		  PS.Cnt = 100;
		  PS.Phase++;
		}
		break;
	case 1 :
		if(!PS.Cnt--)
		{
#ifdef   EN_SPL_Pin
		 _SENS_Upit_On;
#endif
		  PS.Phase++;
		  PS.Cnt = 9;
		}
		break;
	case 2 :
		if(!PS.Cnt--)
		{ for (uint8_t i = 0; i < 8; i++)
		  PS.CAN_TxData[i] = PS_CMD[i];
		  CAN_Send_PS_Cmd();
	      PS.Phase++;
	      PS.Cnt = 9;
		}
		break;
	case 3 :
		if(!PS.Cnt--)
		{
		  PS.CAN_TxData[0] = PS.Adr;
		  CAN_Send_PS_Cmd();
	      PS.Phase = 0;
	      PS_Adr_InProcess = 0;
		}
		break;
	}
} // end PS_ChangeADR();
#endif

void CRC_Calc_Start(uint32_t  StartAdr)
{
	CRC_Sel++; // x_CRC_Cont
//	WRITE_REG(hcrc.Instance->INIT, DEFAULT_CRC_INITVALUE);
// Resets the CRC calculation unit and sets the data register to 0xFFFF FFFF
	__HAL_CRC_DR_RESET(&hcrc);
	CRC_Addr = StartAdr;
	CRC_BlSize = (uint32_t)CRC_BufferLength;
}
void CRC_Calc_ContEnd(uint32_t  EndAdr)
{
	CRC_Addr+= (uint32_t)CRC_DMALength;
	if((CRC_Addr + (uint32_t)CRC_DMALength) < EndAdr)
	{
		CRC_BlSize = (uint32_t)CRC_BufferLength;
	}
	else
	{   // конечное значение BlSize
		CRC_BlSize = (uint32_t)(EndAdr - CRC_Addr) / (uint32_t)CRC_WordLength;
		CRC_Sel++; // x_CRC_End
	}
}

void CRC_Flash_Calc(void)
{
	//3,5mkc
	switch(CRC_Sel)
	{
	case PGM_CRC_Start :
		CRC_Calc_Start(FlashStartAdr);
		break;
	case PGM_CRC_Cont :
		CRC_Calc_ContEnd(FlashEndAdr);
		break;
	case CFG_CRC_Start :
		CRC_Calc_Start(ConfigStartAdr);
		break;
	case CFG_CRC_Cont :
		CRC_Calc_ContEnd(ConfigEndAdr);
		break;
	}
	HAL_DMA_Start_IT(&hdma_crc, (uint32_t)CRC_Addr, (uint32_t)CRC_Buff, (uint32_t)CRC_BlSize);
}

#ifdef   __AxisF_Compile
void     Power_ADC (void)
{ //вызывается в myHAL_ADC_ConvCpltCallback
	Power.KL15.Mid.Sum += (uint16_t)*(Power.KL15.ADC_Ch);
	Power.KL15.Mid.N++;
	Power.KL30.Mid.Sum += (uint16_t)*(Power.KL30.ADC_Ch);
	Power.KL30.Mid.N++;
} // End ADC_Power()
#endif

void   Power_Test(void)
{ // вызывается в My_Tick  1mc
	// делитель дает 95,8 LSB/V
	// приводим величины напряжений к размерности 100 LSB/V
	// Ku = 100/95,8 = 1,044 = 68412/65536
#define   __Ku_1lsb_10mV  68412
#define   VD1_dU          85    // 0,76V
#define   __Ubat_18V      1750  // 17,5V
#define   __Ubat_31V      3150  // 31,5V
#define   __Ubat_40V      4096  // 41V
#define   __Upit_Over_T   500	//0,25c
#define   __Upit_High_T   1000	//0,5c
#define   __Upit_Low_T    2000	//1c 1000	//0,5c
#define   __Upit_Low_T1   8000	//4c 4000	//2c
#define   __Fuse_Cut_T    1000	//0,5c

#define   __Kl15_Off_Level 700  // 7V
#define   __Kl30_Off_Level 300  // 3V

	Power.ADC_cmpl_Cnt = cADC.Rx_Cnt;
	cADC.Rx_Cnt = 0;
#ifdef   __STM1
	// находим среднее значени ацепирования за 1mc
	Power.KL15.Mid.Val = ADC_Middle_Value(&(Power.KL15.Mid));
	Power.KL15.Mid.Sum = 0;
	Power.KL15.Mid.N = 0;
	Power.KL30.Mid.Val = ADC_Middle_Value(&(Power.KL30.Mid));
	Power.KL30.Mid.Sum = 0;
	Power.KL30.Mid.N = 0;

	// учесть падение в диоде
	Power.KL15Value =_Hi_32((uint32_t)Power.KL15.Mid.Val * __Ku_1lsb_10mV) + VD1_dU;
	Power.PWRValue =_Hi_32((uint32_t)Power.KL30.Mid.Val * __Ku_1lsb_10mV);
//---------------------------------------------
	// тест питания
	if(Power.KL15Value > __Kl15_Off_Level)
    {  // включено зажигание
	  AGS_Upit_ON = 1;

	  if(Rele_STM1_ON && Rele_STM2_ON &&
		 Power.PWRValue < __Kl30_Off_Level)
	  { // K30_Fuse_Cut
		if(Power.Fuse_Cnt < __Upit_Over_T)
		   Power.Fuse_Cnt++;
	    else K30_Fuse_Cut = 1;
	  }
	  else
	  { if(Power.Fuse_Cnt)
		   Power.Fuse_Cnt--;
	    else K30_Fuse_Cut = 0;
	  }
	  if(Power.KL15Value > __Ubat_40V)
	  { // перенапряжение
		if(Power.Over_Cnt < __Upit_Over_T)
		   Power.Over_Cnt++;
		else Ubat_Over = 1;
	  }
	  else
	  if(Power.KL15Value > __Ubat_31V)
	  { // повышенное напряжение
		if(Power.High_Cnt < __Upit_High_T)
		   Power.High_Cnt++;
		else Ubat_High = 1;
	  }
	  else
	  if(Power.KL15Value < __Ubat_18V)
	  { // пониженнное напряжение
#define   __Engine_Taxo_Start   3600  // 450rpm 2400  // 300rpm
#define   __Engine_Taxo_Stop    400	  // 50rpm
	    if(CAN_Engine.Taxo > __Engine_Taxo_Start)
		   	   Engine_Started = 1; // двигатель заведен
		if(CAN_Engine.Taxo < __Engine_Taxo_Stop)
			   Engine_Started = 0;
		uint16_t  LowT =__Upit_Low_T;
		if(!Engine_Started) // двигатель не заведен
			LowT =__Upit_Low_T1;
		if(Power.Low_Cnt < LowT)
		   Power.Low_Cnt++;
		else Ubat_Low = 1;
	  }
	  else
	  {	// норма
		if(Power.Over_Cnt)
		   Power.Over_Cnt--;
	    else Ubat_Over = 0;
		if(Power.High_Cnt)
		   Power.High_Cnt--;
		else Ubat_High = 0;
		if(Power.Low_Cnt)
		   Power.Low_Cnt++;
	    else Ubat_Low = 0;
	  }
    } // end if(ADC_Ubat > Kl15_Off_Level)
	else AGS_Upit_ON = 0;


#define __5V_Off_Time 500
#define __5V_On_Time  500
#define __BlocOn_Delay         3500  //3,5c
#define __Fail_EPROM_CS_Time   700

	// флаг включения блока
	if(Power.ON_Cnt < __Blank_16)
	   Power.ON_Cnt++;
	if(Power.ON_Cnt > __BlocOn_Delay)
       BlockON_Complete = 1;

	//  установки ошибки EPROM_CSsum_
	// из-за стенда
	if(Power.ON_Cnt == __Fail_EPROM_CS_Time &&
	   AGS_Upit_ON &&						//
    //  !(s_MC1_Error & __MC_Fatal_Error) && //	 включено реле
	   Rele_STM1_ON &&	                    //
	   Power.PWRValue > __Kl30_Off_Level && // Kl30 стенда включается через 1с
	   Fail_EPROM_CS) // флаг для установки ошибки
	 EPROM_CSsum_Fail = 1;

	// определяем событие выключения блока
    if(Power.ON_Cnt >__5V_On_Time &&
       !AGS_Upit_ON)// ||  // Kl15 Off
	 //   (Rele_Sila_ON &&
	 //    Power.PWRValue <__Kl30_Off_Level))) // нет напряжения после реле
         Block_Is_Off = 1;
    else Block_Is_Off = 0;

    // управление EN_5V_Pin
    if(Block_Is_Off)
	{ // блок выключается
	  if(Power.INH_Cnt)
		 Power.INH_Cnt--;
	  if(Power.INH_Cnt == (__5V_Off_Time -10))
		 Request_WR_BlOff = 1; // запрос записи счетчика WR и контрольной
	  if(!Power.INH_Cnt ||
 		 EPROM.BlockOFF_WR_Cmpl)
	  {  _Port_Off(EN_5V);

	  }
	}
    else
    { //_Port_On(EN_5V);
	  Power.INH_Cnt = __5V_Off_Time;
	}

	// управление реле
//__PWM_U_Koef=PWM_Period_Max/(3000 - PWM_ADCPWR_Min)*256
#ifdef __MC_GD
#define PWM1_PERIOD_VALUE   5400   // 50mkc
#define PWM_Period_Max      4500   // больше нельзя
#define __PWM_U_Koef        512
#else
#define PWM1_PERIOD_VALUE   3600   // 50mkc
#define PWM_Period_Max      3200   // больше нельзя
#define __PWM_U_Koef        408
#endif
#define __PWM_U_Min         1000   // 10V
#define __Rele_ON_Time      5      // 5mc

	if(!Rele_STM1_ON) // было выключено реле
		Power.Rele.ON_Cnt = __Rele_ON_Time;
	else
	{  if(Power.Rele.ON_Cnt)
		  Power.Rele.ON_Cnt--;
	}

	if((s_MC1_Error & __MC_Fatal_Error) ||
		Power.Rele.Pgm_OFF ||
		!Rele_STM2_ON)                     // выключено реле MC2
	{ Rele_STM1_ON = 0; // выключено реле
	  Power.Rele.PWM_Value = PWM1_PERIOD_VALUE+1;
	}
	else
	{ Rele_STM1_ON = 1;
	  if(Power.KL15Value < __PWM_U_Min || // мало напряжение
		 Power.Rele.ON_Cnt)               // Реле включается
         Power.Rele.PWM_Value = 0; // без PWM полное напряжение
	  else
	  {	// зависимость PWM от напряжения
	    Power.Rele.PWM_Value = (Power.KL15Value - __PWM_U_Min) *
	    		                                  __PWM_U_Koef/256;
	    if(Power.Rele.PWM_Value > PWM_Period_Max)
	       Power.Rele.PWM_Value = PWM_Period_Max;
	  }
	}
	__HAL_TIM_SET_COMPARE(&htim2, TIM_CHANNEL_4, Power.Rele.PWM_Value);

#else
	if(s_MC2_Error & __MC_Fatal_Error)
	{   Rele_STM2_ON = 0; // выключено реле
	    _Port_Off(RELE_D2);
	}
	else
	{   Rele_STM2_ON = 1;
	    _Port_On(RELE_D2);
	}
#endif
} // end Power_Test();


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

void     UartSTM_Receive(void)
{ // время выполнения 2mks
    if(DIA.TP_Select == 14)	_TP_On;
// Данные лежат в SCI_RxBuff
#ifdef   __AxisF_Compile
    Wheel_RL.Speed = (uint16_t)(SCI_RxBuff[2]<<8) +
    		          (uint16_t)SCI_RxBuff[3];
    Wheel_RR.Speed = (uint16_t)(SCI_RxBuff[4]<<8) +
    		          (uint16_t)SCI_RxBuff[5];
    Wheel_RL.ABS.Phase = (SCI_RxBuff[6] & 0x0F);
    Wheel_RL.State.Byte= (SCI_RxBuff[6] & 0xF0);
    Wheel_RR.ABS.Phase = (SCI_RxBuff[7] & 0x0F);
    Wheel_RR.State.Byte= (SCI_RxBuff[7] & 0xF0);
    if(Wheel_RL.ABS.Phase)
    	 Wheel_RL.ABS.Active = 1;
    else Wheel_RL.ABS.Active = 0;
    if(Wheel_RR.ABS.Phase)
    	 Wheel_RR.ABS.Active = 1;
    else Wheel_RR.ABS.Active = 0;

    KL_Status1_MC2 = SCI_RxBuff[8];
    TorqueMode = SCI_RxBuff[9];
    EngineTorque.Value = SCI_RxBuff[10];
    EngineTorque.Phase = SCI_RxBuff[11];
    DSC_Flags_MC2 = SCI_RxBuff[12];

    Wheel_RL.Press = (uint16_t)(SCI_RxBuff[14]<<8);
    Wheel_RR.Press = (uint16_t)(SCI_RxBuff[15]<<8);
#ifdef 	 __Rectangular_Board
    TrailerPress  =  (uint16_t)(SCI_RxBuff[16]<<8);
#endif
    Rear_Flags2 = SCI_RxBuff[17];
    TSET_SW_Condition = TSET_Switch; // от STM2
    Rear_Flags  = SCI_RxBuff[18];

    // прием через селектор
    SCI_RX_Data_Sel = SCI_RxBuff[19];
    // изменяемые переменные MC2 раз в 35mc
    switch (SCI_RX_Data_Sel)
    {
      case 0:
        Trailer1.EBS22_Status1 = SCI_RxBuff[20];
    	Trailer1.EBS22_Status2 = SCI_RxBuff[21];
        Trailer1.EBS22_Status3 = SCI_RxBuff[22];
    	Trailer1.EBS22_Status4 = SCI_RxBuff[23];
        Trailer1.EBS25.Press_1L = SCI_RxBuff[24];
    	Trailer1.EBS25.Press_1R = SCI_RxBuff[25];
        Trailer1.EBS25.Press_2L = SCI_RxBuff[26];
    	Trailer1.EBS25.Press_2R = SCI_RxBuff[27];
        Trailer1.EBS25.Press_3L = SCI_RxBuff[28];
    	Trailer1.EBS25.Press_3R = SCI_RxBuff[29];
        Trailer1.EBS25.Status5 = SCI_RxBuff[30];
    	EBS25Cnt = SCI_RxBuff[31];
        Trailer1.EBS21_Status1 = SCI_RxBuff[32];
    	Trailer1.EBS21_Status2 = SCI_RxBuff[33];
        Trailer1.EBS21.Speed = (uint16_t)(SCI_RxBuff[34]<<8) +
    		                    (uint16_t)SCI_RxBuff[35];
    	break;
      case 1:
        CANT.Mode = SCI_RxBuff[20];
    	EBS22Cnt =  SCI_RxBuff[21];
    	Trailer1.EBS22.AxleLoadSum = (uint16_t)(SCI_RxBuff[22]<<8) +
    		                          (uint16_t)SCI_RxBuff[23];
        TrailerFind = SCI_RxBuff[24];
    	TrailerStatus = SCI_RxBuff[25];
	    EBL.REG.Koef = ((uint32_t)SCI_RxBuff[26]<<8) +
						          SCI_RxBuff[27];
        EBC5_Status1 = SCI_RxBuff[28];
    	EBC5_Status2 = SCI_RxBuff[29];
        EBC5_Status3 = SCI_RxBuff[30];
    	EBC5.XBR_AccLim = SCI_RxBuff[31];
	    LIM.PK.Oss.On_Val =  SCI_RxBuff[32];
	    LIM.PK.Oss.Off_Val = SCI_RxBuff[33];
    	System_F2_MC2 = SCI_RxBuff[34];
    	System_F2 = (System_F2 &~__SysF2_MC2_Mask) |
    			    (System_F2_MC2 &__SysF2_MC2_Mask); // GndR_On LampASR_ON
	    Pcb_Test_3_MC2 = SCI_RxBuff[35];
    	break;

       case 2: // TMD & PCB_Test
    	Wheel_RL.MDT.AV.Oss.Off_Val= SCI_RxBuff[20];
    	Wheel_RR.MDT.AV.Oss.Off_Val= SCI_RxBuff[21];
    	Wheel_RL.MDT.AV.Oss.On_Val = SCI_RxBuff[22];
    	Wheel_RR.MDT.AV.Oss.On_Val = SCI_RxBuff[23];
    	Wheel_RL.MDT.EV.Oss.Off_Val= SCI_RxBuff[24];
    	Wheel_RR.MDT.EV.Oss.Off_Val= SCI_RxBuff[25];
    	Wheel_RL.MDT.EV.Oss.On_Val = SCI_RxBuff[26];
    	Wheel_RR.MDT.EV.Oss.On_Val = SCI_RxBuff[27];
    	RearDif.Oss.Off_Val =    SCI_RxBuff[28]; //**
     	RearDif.Oss.On_Val =     SCI_RxBuff[29];
    	TrailerDif.Oss.Off_Val = SCI_RxBuff[30];
    	TrailerDif.Oss.On_Val =  SCI_RxBuff[31];
    	BSP75_LASR.Oss.Off_Val = SCI_RxBuff[32];
    	BSP75_LASR.Oss.On_Val =  SCI_RxBuff[33];
    	BTS142_GNDR.Oss.Off_Val= SCI_RxBuff[34];
    	BTS142_GNDR.Oss.On_Val = SCI_RxBuff[35];
    	break;

      case 3: // SS  Sens Test  & PCB_Test
    	Wheel_RL.Test.Oss.A1_U0 = SCI_RxBuff[20];
    	Wheel_RL.Test.Oss.A2_U0 = SCI_RxBuff[21];
    	Wheel_RL.Test.Oss.Uamp =  SCI_RxBuff[22];
    	Wheel_RL.Test.Oss.WT_MinMax = SCI_RxBuff[23];
    	Wheel_RR.Test.Oss.A1_U0 = SCI_RxBuff[24];
    	Wheel_RR.Test.Oss.A2_U0 = SCI_RxBuff[25];
    	Wheel_RR.Test.Oss.Uamp =  SCI_RxBuff[26];
    	Wheel_RR.Test.Oss.WT_MinMax = SCI_RxBuff[27];
    	Wheel_RL.Test.Oss.A1_Ua = SCI_RxBuff[28];
    	Wheel_RL.Test.Oss.A2_Ua = SCI_RxBuff[29];
    	Wheel_RR.Test.Oss.A1_Ua = SCI_RxBuff[30];
    	Wheel_RR.Test.Oss.A2_Ua = SCI_RxBuff[31];
    	SW_ASR.Oss.Mid_Val =  SCI_RxBuff[32];
    	SW_TSET.Oss.Mid_Val = SCI_RxBuff[33];
    	System_F  &= 0xEF;
    	System_F  |= (SCI_RxBuff[34] & 0x18); // ASR_SW ABS_Fail
    	System_F4 &= 0xF3;
    	System_F4 |= (SCI_RxBuff[35] & 0x0C);
    	break;
	  case 4:
		 Wheel_RL.Sen_Err0.Byte = SCI_RxBuff[20];
		 Wheel_RL.Sen_Err1.Byte = SCI_RxBuff[21];
		 Wheel_RR.Sen_Err0.Byte = SCI_RxBuff[22];
		 Wheel_RR.Sen_Err1.Byte = SCI_RxBuff[23];
		 Wheel_RL.MOD_Err0.Byte = SCI_RxBuff[24];
		 Wheel_RL.MOD_Err1.Byte = SCI_RxBuff[25];
		 Wheel_RR.MOD_Err0.Byte = SCI_RxBuff[26];
		 Wheel_RR.MOD_Err1.Byte = SCI_RxBuff[27];
		 s_MC2_Error   = SCI_RxBuff[28];
		 s_Prop_Error  = SCI_RxBuff[29];
		 Dif_Error_MC2 = SCI_RxBuff[30];
         s_B7_TCO_Error= SCI_RxBuff[31];
         MC2_Other_Error=SCI_RxBuff[32];
         MC2_GND_Error = SCI_RxBuff[33];
		 s_ModT_Error  = SCI_RxBuff[34];
		 s_CANT_Error  = SCI_RxBuff[35];
		 break;

	  case 5:
		 PGM_CRC_MC2 =  ((uint32_t)SCI_RxBuff[20]<<24) +
			            ((uint32_t)SCI_RxBuff[21]<<16) +
			            ((uint32_t)SCI_RxBuff[22]<<8) +
						           SCI_RxBuff[23];
		 Config_CRC_MC2=((uint32_t)SCI_RxBuff[24]<<24) +
				        ((uint32_t)SCI_RxBuff[25]<<16) +
				        ((uint32_t)SCI_RxBuff[26]<<8) +
							       SCI_RxBuff[27];
	     Vehicle.Rear_ODO = ((uint32_t)SCI_RxBuff[28]<<24) +
			                ((uint32_t)SCI_RxBuff[29]<<16) +
			                ((uint32_t)SCI_RxBuff[30]<<8) +
						               SCI_RxBuff[31];
		 Pcb_Test_8_MC2 = SCI_RxBuff[32];
		 TCO.Rear.Koef = (uint16_t)(SCI_RxBuff[33]<<8) +
                         (uint16_t)SCI_RxBuff[34];
		 DSC_Flags1_MC2 = SCI_RxBuff[35];
		 DSC_Flags1 |= (DSC_Flags1_MC2 & 0xF0);
		 break;
      case 6:
		 Wheel_3L.MDT.AV.Oss.Off_Val= SCI_RxBuff[20];
		 Wheel_3R.MDT.AV.Oss.Off_Val= SCI_RxBuff[21];
		 Wheel_3L.MDT.AV.Oss.On_Val = SCI_RxBuff[22];
		 Wheel_3R.MDT.AV.Oss.On_Val = SCI_RxBuff[23];
		 Wheel_3L.MDT.EV.Oss.Off_Val= SCI_RxBuff[24];
		 Wheel_3R.MDT.EV.Oss.Off_Val= SCI_RxBuff[25];
		 Wheel_3L.MDT.EV.Oss.On_Val = SCI_RxBuff[26];
		 Wheel_3R.MDT.EV.Oss.On_Val = SCI_RxBuff[27];
		 Wheel_3L.MOD_Err0.Byte = SCI_RxBuff[28];
		 Wheel_3L.MOD_Err1.Byte = SCI_RxBuff[29];
		 Wheel_3R.MOD_Err0.Byte = SCI_RxBuff[30];
		 Wheel_3R.MOD_Err1.Byte = SCI_RxBuff[31];

		 break;
	   case 7:
		  Wheel_3L.Sen_Err0.Byte = SCI_RxBuff[21];
		  Wheel_3L.Sen_Err1.Byte = SCI_RxBuff[22];
		  Wheel_3R.Sen_Err0.Byte = SCI_RxBuff[23];
		  Wheel_3R.Sen_Err1.Byte = SCI_RxBuff[24];
	      Wheel_3L.Test.Oss.A1_U0 = SCI_RxBuff[25];
	      Wheel_3L.Test.Oss.A2_U0 = SCI_RxBuff[26];
	      Wheel_3L.Test.Oss.Uamp =  SCI_RxBuff[27];
	      Wheel_3L.Test.Oss.WT_MinMax = SCI_RxBuff[28];
	      Wheel_3R.Test.Oss.A1_U0 = SCI_RxBuff[29];
	      Wheel_3R.Test.Oss.A2_U0 = SCI_RxBuff[30];
	      Wheel_3R.Test.Oss.Uamp =  SCI_RxBuff[31];
	      Wheel_3R.Test.Oss.WT_MinMax = SCI_RxBuff[32];
	      TCO.Rear.VX = SCI_RxBuff[33]*256+SCI_RxBuff[34];
	   break;
    } //end SCI_RX_Data_Sel

uint8_t DYC_Situation_Rear = SCI_RxBuff[47] & __DYC_Situation_Rear;
	DYC_Situation &= ~__DYC_Situation_Rear;
	DYC_Situation |= DYC_Situation_Rear;
    Retarder_Flags = SCI_RxBuff[48];
    Acc_X_MC2 = SCI_RxBuff[49]*256+SCI_RxBuff[50];
    Acc_Y_est_MC2 = SCI_RxBuff[51]*256+SCI_RxBuff[52];

    // прием для диагностики DIA_Oss()
	switch (DIA.Oss.Select)
    { case 0://    	  DIA_Default_Oss();
		switch (DIA.Oss.Road) //
	    {case 0: //  отладка активации режимов
	         DSC_Flags_MC2 = SCI_RxBuff[53];
	         DSC_Flags4 = SCI_RxBuff[54];
		  break;
		  case 1: // отладка ROP
		     Turn_Radius_MC2 = SCI_RxBuff[54]*256;
		     ROP.BrakeR.Phase= SCI_RxBuff[55];
		     ROP_AccY_OzD_MC2= SCI_RxBuff[56]*256+SCI_RxBuff[57];
		  break;
	      case 2: //  отладка DYC
		     OmegaZ_Des_MC2 = SCI_RxBuff[53]*256+SCI_RxBuff[54];
		     DYC.UnSt.PDOut = SCI_RxBuff[55]*256;
		  break;
		  case 3: // отладка ABS 4Ch
		     Wheel_RL.PumpToss = SCI_RxBuff[53];
		     Wheel_RR.PumpToss = SCI_RxBuff[54];
		     ABS_Failures_MC2  = SCI_RxBuff[55];
		  break;
	      case 4: // отладка ASR
		     ASR_Flags = SCI_RxBuff[53];
		     ASR.Engine.Ref= SCI_RxBuff[54]*256+SCI_RxBuff[55];
		     ASR.RearSpeed = SCI_RxBuff[56]*256+SCI_RxBuff[57];
		     ASR.Engine.Torque = SCI_RxBuff[58];
		     ASR.Engine.PID = SCI_RxBuff[59]*256;
		     ASR.Engine.Torq_EM1 = SCI_RxBuff[60];
		     ASR.Engine.Torq_EM2 = SCI_RxBuff[61];
		     ASR.FrontBase = SCI_RxBuff[62]*256+SCI_RxBuff[63];
		     REG_Failures_MC2 = SCI_RxBuff[64];
	      break;
		  case 5: // отладка Ref
		     SpeedVX_RearAxel = SCI_RxBuff[53]*256+SCI_RxBuff[54];
	      break;
		  case 8: // отладка XBR
		     XBR.Brake.Rear.Pdes = SCI_RxBuff[54]*265;
		     XBR.Brake.Rear.Phase = SCI_RxBuff[56];
		  break;
		  case 9: // отладка ABS TAI
		     Wheel_RR.State.Byte = SCI_RxBuff[53];//TAI_Flag  Wheelx->State.Bits.b4
		     Wheel_RR.State.Byte = SCI_RxBuff[54];
		  break;
	      case 10: // отладка Load
// берется от зада ????
/*		   Load.Brake.M = SCI_RxBuff[54]*256;
		   Load.Brake.Mass = SCI_RxBuff[55]*256;
		   Load.Engine.M = SCI_RxBuff[56]*256;
		   Load.Engine.Mass = SCI_RxBuff[57]*256;
*/
	      break;
	      case 11: // отладка EBL
	         EBL_Flags = SCI_RxBuff[53];
	         EBL.REG.Koef = SCI_RxBuff[54]*256;
	         EBL.REG.P_Hg = SCI_RxBuff[55]*256;
	         EBL.REG_RL.Pdes = SCI_RxBuff[56]*256;
	         EBL.REG_RR.Pdes = SCI_RxBuff[57]*256;
	      break;

		  case 13: // отладка HillHold
             HillHold_Flags = SCI.Tx_data[53];
             EBC5_Status1 = SCI.Tx_data[54]; //Hill holder mode
             DSC_Flags4 = SCI.Tx_data[55]; //HillHolder_Active _DSC_Flags4.Bits.b4
             DSC_Flags5 = SCI.Tx_data[56]; //HillHolder_Lamp _DSC_Flags5.Bits.b0
             Brake.HillHold.Press = SCI.Tx_data[57]*256;
		  break;
		  case 15: // отладка PumpToss
			 Wheel_RL.PumpToss = SCI.Tx_data[53];
			 Wheel_RR.PumpToss = SCI.Tx_data[54];
		  break;
		} break;

/*	  case 1://       DIA_MDT_Oss();  // MyFunc.c
          break;
	  case 2://	      DIA_SST1_Oss();  // MyVAR.c
	      break;
	  case 3://		  DIA_SST2_Oss();  // MyVAR.c
	      break;
	  case 4:	      break;*/
	  case 5://	      DIA_SCI_Oss();
	      DIA.MC2.UartFlag = SCI_RxBuff[53];
	      DIA.MC2.SCI_Rx_data_0 = SCI_RxBuff[54];
	      DIA.MC2.SCI_Rx_Cnt = SCI_RxBuff[55];
	      DIA.MC2.SCI_Tx_Cnt = SCI_RxBuff[56];
	 	  DIA.MC2.Rx_Cnt = SCI_RxBuff[57];
	 	  DIA.MC2.Phase = SCI_RxBuff[58];
	 	  DIA.MC2.RX_Command = SCI_RxBuff[59];
	 	  DIA.MC2.XOR_Tx = SCI_RxBuff[60];
	 	  DIA.MC2.SCI_Loss_Sinchro = SCI_RxBuff[61];
	      DIA.MC2.TestRx = SCI_RxBuff[69];
	      break;
//	  case 6://		  DIA_LSSw_Oss();  // MyFunc.c
//          break;
	  case 7://		  DIA_CANJ_Oss();  // MySystem.c
		  CANT.TxErrCnt = SCI_RxBuff[53];
		  CANT.Phase =    SCI_RxBuff[54];
		  CANT.Tout =     SCI_RxBuff[55];
		  CANT_Flags =    SCI_RxBuff[56];
		  CANT.TrCnt =    SCI_RxBuff[57];
		  CANT.TxErrCnt = SCI_RxBuff[58];
	      break;
/*	  case 8://		  DIA_Button_Oss();// MySystem.c
	      break;
	  case 9://		  DIA_EPROM_Oss(); // MySystem.c
	      break;*/
	  case 10://		  DIA_LIM_Oss();
	      LIM.B7.Tim_HiCnt= (uint32_t)SCI_RxBuff[53];
	      LIM.B7.Period =  ((uint32_t)SCI_RxBuff[54]<<16) +
	 			           ((uint32_t)SCI_RxBuff[55]<<8);// +
	 					           //   SCI_RxBuff[56];
	      LIM.PK.PWM.OffTime = ((uint16_t)SCI_RxBuff[56]<<8);
	      LIM.B7.Duration= ((uint16_t)SCI_RxBuff[57]<<8);// +
	 							   //   SCI_RxBuff[58];
	      LIM.Phase = SCI_RxBuff[58];
	      LIM.B7.Speed =   ((uint16_t)SCI_RxBuff[59]<<8) +
	    	 		 				  SCI_RxBuff[60];
	      LIM.Speed.Est =  ((uint16_t)SCI_RxBuff[61]<<8);// +
	    	 		 				     //SCI_RxBuff[30];
		  LIM.PK.PWM.Period=((uint16_t)SCI_RxBuff[62]<<8);
	      LIM.PID.Out = SCI_RxBuff[63];
	      LIM_B7_Flags = SCI_RxBuff[64];
	      LIM_PK_Flags = SCI_RxBuff[65];
	      LIM.Speed.ThresHold=((uint16_t)SCI_RxBuff[66]<<8);
	      LIM.PK.PWM.Des  =   ((uint16_t)SCI_RxBuff[67]<<8);
	      LIM.PK.PWM.OnTime = ((uint16_t)SCI_RxBuff[68]<<8);
	//	  LIM.Phase =  SCI_RxBuff[69];
	      break;
	  case 11://	      DIA_ICM_AG_Oss();
#ifdef __Rectangular_Board  // прямоугольная плата
		 ICM_AG.AccelX = (int16_t)(SCI_RxBuff[53]<<8) +
		                  (int16_t)SCI_RxBuff[54];
 		 ICM_AG.AccelY = (int16_t)(SCI_RxBuff[55]<<8) +
 				          (int16_t)SCI_RxBuff[56];
 		 ICM_AG.AccelZ = (int16_t)(SCI_RxBuff[57]<<8) +
 				          (int16_t)SCI_RxBuff[58];
		 ICM_AG.GyroX =  (int16_t)(SCI_RxBuff[59]<<8) +
				          (int16_t)SCI_RxBuff[60];
		 ICM_AG.GyroY =  (int16_t)(SCI_RxBuff[61]<<8) +
				          (int16_t)SCI_RxBuff[62];
		 ICM_AG.GyroZ =  (int16_t)(SCI_RxBuff[63]<<8) +
		                  (int16_t)SCI_RxBuff[64];
		 ICM_AG.Temp =   (int16_t)(SCI_RxBuff[65]<<8) +
 				          (int16_t)SCI_RxBuff[66];
		 SCI_ICM_AG_Cnt = SCI_RxBuff[34];
#endif
	      break;
/*	  case 12://		  DIA_SAS_Oss(); // MySystem.c
	      break;
	  case 13://          DIA_MDT_Oss6();  // MyFunc.c
          break;*/
	  case 14://          DIA_Validity_Oss();
          break;
	  case 15://          DIA_Validity_Oss();
          break;
    }

#else
    Wheel_FL.Speed = (uint16_t)(SCI_RxBuff[2]<<8) +
    		          (uint16_t)SCI_RxBuff[3];
    Wheel_FR.Speed = (uint16_t)(SCI_RxBuff[4]<<8) +
    		          (uint16_t)SCI_RxBuff[5];
    Wheel_FL.ABS.Phase = (SCI_RxBuff[6] & 0x0F);
    Wheel_FL.State.Byte= (SCI_RxBuff[6] & 0xF0);
    Wheel_FR.ABS.Phase = (SCI_RxBuff[7] & 0x0F);
    Wheel_FR.State.Byte= (SCI_RxBuff[7] & 0xF0);
    if(Wheel_FL.ABS.Phase)
    	 Wheel_FL.ABS.Active = 1;
    else Wheel_FL.ABS.Active = 0;
    if(Wheel_FR.ABS.Phase)
    	 Wheel_FR.ABS.Active = 1;
    else Wheel_FR.ABS.Active = 0;

    Omega_Z_est =    (uint16_t)(SCI_RxBuff[8]<<8) +
    		          (uint16_t)SCI_RxBuff[9];
    Steer_sen =   (uint16_t)(SCI_RxBuff[10]<<8) + //Steering_Angle
    		         (uint16_t)SCI_RxBuff[11];
    Acc_Y_est =   (uint16_t)(SCI_RxBuff[12]<<8) + //Acc_Y_sen
    		         (uint16_t)SCI_RxBuff[13];
    Acc_X_est =   (uint16_t)(SCI_RxBuff[14]<<8) + //Acc_X_sen
    		         (uint16_t)SCI_RxBuff[15];
    Brake.DemandValue = (uint16_t)(SCI_RxBuff[16]<<8) +
    		             (uint16_t)SCI_RxBuff[17];
    Front_Flags = SCI_RxBuff[18];
    Front_Flags2 = SCI_RxBuff[19];

uint8_t DYC_Situation_Front = SCI_RxBuff[36] & __DYC_Situation_Front;
	DYC_Situation &= ~__DYC_Situation_Front;
	DYC_Situation |= DYC_Situation_Front;
    Power.PWRValue = (uint16_t)(SCI_RxBuff[37]<<8) +
		              (uint16_t)SCI_RxBuff[38];
    Power.KL15Value= (uint16_t)(SCI_RxBuff[39]<<8) +
		              (uint16_t)SCI_RxBuff[40];
    Wheel_FL.Press= (uint16_t)(SCI_RxBuff[41]<<8) +
                     (uint16_t)SCI_RxBuff[42];
    Wheel_FR.Press= (uint16_t)(SCI_RxBuff[43]<<8) +
		             (uint16_t)SCI_RxBuff[44];
	System_F5 = SCI_RxBuff[45];
	Speed_VX_Front = (uint16_t)(SCI_RxBuff[46]<<8) +
                      (uint16_t)SCI_RxBuff[47];
	Validity_Flags = SCI_RxBuff[48];

	if(DSC_Emul_Fl) //Front_Flags.Bits.b0
	{  Wheel_RL.SpeedI = SCI_RxBuff[49]*256 +
                         SCI_RxBuff[50];
	   Wheel_RR.SpeedI = SCI_RxBuff[51]*256 +
	                     SCI_RxBuff[52];
	   Emul.Delay_Cnt = 10; // по счетчику будет обнуление скорости
	}
	else
	{ Wheel_RL.SpeedI = 0;
	  Wheel_RR.SpeedI = 0;
	  if(Emul.Delay_Cnt)
		 Emul.Delay_Cnt--;
#ifdef __Square_Board
	  TrailerPress = SCI_RxBuff[49]*256 +
                     SCI_RxBuff[50];
#endif
	}

	DIA.Oss.Select= SCI_RxBuff[53];
	DIA.Oss.Road  = SCI_RxBuff[54];
#endif
    if(DIA.TP_Select == 14)	_TP_Off;
} // end UartSTM_Receive()

void    UartSTM_TX_Data(void)
{
#ifdef   __AxisF_Compile
	SCI.Tx_data[2] = _Hi_16(Wheel_FL.Speed);
	SCI.Tx_data[3] = _Lo_16(Wheel_FL.Speed);
	SCI.Tx_data[4] = _Hi_16(Wheel_FR.Speed);
	SCI.Tx_data[5] = _Lo_16(Wheel_FR.Speed);
	SCI.Tx_data[6] = ((Wheel_FL.ABS.Phase & 0x0F) |
			          (Wheel_FL.State.Byte & 0xF0));
	SCI.Tx_data[7] = ((Wheel_FR.ABS.Phase & 0x0F) |
			          (Wheel_FR.State.Byte & 0xF0));
	SCI.Tx_data[8] = _Hi_16(Omega_Z_est);
	SCI.Tx_data[9] = _Lo_16(Omega_Z_est);
    SCI.Tx_data[10] = _Hi_16(Steer_sen);//Steering_Angle
	SCI.Tx_data[11] = _Lo_16(Steer_sen);
    SCI.Tx_data[12] = _Hi_16(Acc_Y_est);
	SCI.Tx_data[13] = _Lo_16(Acc_Y_est);
	SCI.Tx_data[14] = _Hi_16(Acc_X_est);
	SCI.Tx_data[15] = _Lo_16(Acc_X_est);
	SCI.Tx_data[16] = _Hi_16(Brake.DemandValue);
	SCI.Tx_data[17] = _Lo_16(Brake.DemandValue);
	SCI.Tx_data[18] = Front_Flags; //
	SCI.Tx_data[19] = Front_Flags2; //

	SCI.Tx_data[36] = DYC_Situation;
	SCI.Tx_data[37] = _Hi_16(MDT.U_Sila);
	SCI.Tx_data[38] = _Lo_16(MDT.U_Sila);
	SCI.Tx_data[39] = _Hi_16(LSSw.U_bat);
	SCI.Tx_data[40] = _Lo_16(LSSw.U_bat);
	SCI.Tx_data[41] = _Hi_16(Wheel_FL.Press);
	SCI.Tx_data[42] = _Lo_16(Wheel_FL.Press);
	SCI.Tx_data[43] = _Hi_16(Wheel_FR.Press);
	SCI.Tx_data[44] = _Lo_16(Wheel_FR.Press);
    SCI.Tx_data[45] = System_F5;
    SCI.Tx_data[46] = _Hi_16(Speed_VX_est);
    SCI.Tx_data[47] = _Lo_16(Speed_VX_est);
    SCI.Tx_data[48] = Validity_Flags;


	if(DSC_Emul_Fl)
	{
		SCI.Tx_data[49] = _Hi_16(Wheel_RL.SpeedI);
		SCI.Tx_data[50] = _Lo_16(Wheel_RL.SpeedI);
		SCI.Tx_data[51] = _Hi_16(Wheel_RR.SpeedI);
		SCI.Tx_data[52] = _Lo_16(Wheel_RR.SpeedI);
	}
	else
	{
#ifdef __Square_Board
		SCI.Tx_data[49] = _Hi_16(TrailerPress);
		SCI.Tx_data[50] = _Lo_16(TrailerPress);
#endif
	}
    
	SCI.Tx_data[53] = DIA.Oss.Select;
	SCI.Tx_data[54] = DIA.Oss.Road;
    // последний
    //SCI.Tx_data[69]
#else
	// сообщения передаются раз в 5mc
	SCI.Tx_data[2] = _Hi_16(Wheel_RL.Speed);
	SCI.Tx_data[3] = _Lo_16(Wheel_RL.Speed);
	SCI.Tx_data[4] = _Hi_16(Wheel_RR.Speed);
	SCI.Tx_data[5] = _Lo_16(Wheel_RR.Speed);
	SCI.Tx_data[6] = ((Wheel_RL.ABS.Phase & 0x0F) |
			          (Wheel_RL.State.Byte & 0xF0));
	SCI.Tx_data[7] = ((Wheel_RR.ABS.Phase & 0x0F) |
			          (Wheel_RR.State.Byte & 0xF0));

	SCI.Tx_data[8] = KL_Status_1;
	SCI.Tx_data[9] = TorqueMode;//
    SCI.Tx_data[10] = EngineTorque.Value;
	SCI.Tx_data[11] = EngineTorque.Phase;
	SCI.Tx_data[12] = DSC_Flags;

	SCI.Tx_data[14] = _Hi_16(Wheel_RL.Press);
	SCI.Tx_data[15] = _Hi_16(Wheel_RR.Press);
    SCI.Tx_data[16] = _Hi_16(TrailerPress);      // не менять
	SCI.Tx_data[17] = Rear_Flags2;
	SCI.Tx_data[18] = Rear_Flags;
	SCI.Tx_data[19] = SCI_TX_Data_Sel;
	// изменяемые переменные
	switch (SCI_TX_Data_Sel++)
    { // сообщения передаются раз в 35mc
	  case 0:
    	 SCI.Tx_data[20] = Trailer1.EBS22_Status1;
		 SCI.Tx_data[21] = Trailer1.EBS22_Status2;
    	 SCI.Tx_data[22] = Trailer1.EBS22_Status3;
		 SCI.Tx_data[23] = Trailer1.EBS22_Status4;
    	 SCI.Tx_data[24] = Trailer1.EBS25.Press_1L;
		 SCI.Tx_data[25] = Trailer1.EBS25.Press_1R;
    	 SCI.Tx_data[26] = Trailer1.EBS25.Press_2L;
		 SCI.Tx_data[27] = Trailer1.EBS25.Press_2R;
    	 SCI.Tx_data[28] = Trailer1.EBS25.Press_3L;
		 SCI.Tx_data[29] = Trailer1.EBS25.Press_3R;
    	 SCI.Tx_data[30] = Trailer1.EBS25.Status5;
		 SCI.Tx_data[31] = EBS25Cnt;
    	 SCI.Tx_data[32] = Trailer1.EBS21_Status1;
		 SCI.Tx_data[33] = Trailer1.EBS21_Status2;
    	 SCI.Tx_data[34] = _Hi_16(Trailer1.EBS21.Speed);
		 SCI.Tx_data[35] = _Lo_16(Trailer1.EBS21.Speed);
		 break;
	  case 1:
    	 SCI.Tx_data[20] = CANT.Mode;
		 SCI.Tx_data[21] = EBS22Cnt;
    	 SCI.Tx_data[22] = _Hi_16(Trailer1.EBS22.AxleLoadSum);
		 SCI.Tx_data[23] = _Lo_16(Trailer1.EBS22.AxleLoadSum);
    	 SCI.Tx_data[24] = TrailerFind;
		 SCI.Tx_data[25] = TrailerStatus;
	     SCI.Tx_data[26] = _B1_32(EBL.REG.Koef);//
	     SCI.Tx_data[27] = _B0_32(EBL.REG.Koef);//
    	 SCI.Tx_data[28] = EBC5_Status1;
		 SCI.Tx_data[29] = EBC5_Status2;
    	 SCI.Tx_data[30] = EBC5_Status3;
		 SCI.Tx_data[31] = EBC5.XBR_AccLim;
	     SCI.Tx_data[32] = LIM.PK.Oss.On_Val;
	     SCI.Tx_data[33] = LIM.PK.Oss.Off_Val;
		 SCI.Tx_data[34] = System_F2;
	  	 SCI.Tx_data[35] = Pcb_Test_3;
		 break;
	  case 2: // TMD & PCB_Test
	  	 SCI.Tx_data[20] = Wheel_RL.MDT.AV.Oss.Off_Val;
	  	 SCI.Tx_data[21] = Wheel_RR.MDT.AV.Oss.Off_Val;
	  	 SCI.Tx_data[22] = Wheel_RL.MDT.AV.Oss.On_Val;
	  	 SCI.Tx_data[23] = Wheel_RR.MDT.AV.Oss.On_Val;
	  	 SCI.Tx_data[24] = Wheel_RL.MDT.EV.Oss.Off_Val;
	  	 SCI.Tx_data[25] = Wheel_RR.MDT.EV.Oss.Off_Val;
	  	 SCI.Tx_data[26] = Wheel_RL.MDT.EV.Oss.On_Val;
	  	 SCI.Tx_data[27] = Wheel_RR.MDT.EV.Oss.On_Val;
	  	 SCI.Tx_data[28] = RearDif.Oss.Off_Val;
	  	 SCI.Tx_data[29] = RearDif.Oss.On_Val;
	  	 SCI.Tx_data[30] = TrailerDif.Oss.Off_Val;
	  	 SCI.Tx_data[31] = TrailerDif.Oss.On_Val;
	  	 SCI.Tx_data[32] = BSP75_LASR.Oss.Off_Val;
	  	 SCI.Tx_data[33] = BSP75_LASR.Oss.On_Val;
	  	 SCI.Tx_data[34] = BTS142_GNDR.Oss.Off_Val;
	  	 SCI.Tx_data[35] = BTS142_GNDR.Oss.On_Val;
	  	 break;
	  case 3: // SS  Sens Test  & PCB_Test
	  	 SCI.Tx_data[20] = Wheel_RL.Test.Oss.A1_U0;
	  	 SCI.Tx_data[21] = Wheel_RL.Test.Oss.A2_U0;
	  	 SCI.Tx_data[22] = Wheel_RL.Test.Oss.Uamp;
	  	 SCI.Tx_data[23] = Wheel_RL.Test.Oss.WT_MinMax;
	  	 SCI.Tx_data[24] = Wheel_RR.Test.Oss.A1_U0;
	  	 SCI.Tx_data[25] = Wheel_RR.Test.Oss.A2_U0;
	  	 SCI.Tx_data[26] = Wheel_RR.Test.Oss.Uamp;
	  	 SCI.Tx_data[27] = Wheel_RR.Test.Oss.WT_MinMax;
	  	 SCI.Tx_data[28] = Wheel_RL.Test.Oss.A1_Ua;
	  	 SCI.Tx_data[29] = Wheel_RL.Test.Oss.A2_Ua;
	  	 SCI.Tx_data[30] = Wheel_RR.Test.Oss.A1_Ua;
	  	 SCI.Tx_data[31] = Wheel_RR.Test.Oss.A2_Ua;
	 	 SCI.Tx_data[32] = SW_ASR.Oss.Mid_Val;
	 	 SCI.Tx_data[33] = SW_TSET.Oss.Mid_Val;
	 	 SCI.Tx_data[34] = System_F;
	 	 SCI.Tx_data[35] = System_F4;
	  	 break;

	  case 4:
		 SCI.Tx_data[20] = Wheel_RL.Sen_Err0.Byte;
		 SCI.Tx_data[21] = Wheel_RL.Sen_Err1.Byte;
		 SCI.Tx_data[22] = Wheel_RR.Sen_Err0.Byte;
		 SCI.Tx_data[23] = Wheel_RR.Sen_Err1.Byte;
		 SCI.Tx_data[24] = Wheel_RL.MOD_Err0.Byte;
		 SCI.Tx_data[25] = Wheel_RL.MOD_Err1.Byte;
		 SCI.Tx_data[26] = Wheel_RR.MOD_Err0.Byte;
		 SCI.Tx_data[27] = Wheel_RR.MOD_Err1.Byte;
		 SCI.Tx_data[28] = s_MC2_Error;
		 SCI.Tx_data[29] = s_Prop_Error;
		 SCI.Tx_data[30] = Dif_Error_MC2;        //s_Diff_Error;
		 SCI.Tx_data[31] = s_B7_TCO_Error;
		 SCI.Tx_data[32] = s_Other_Error;  //BSP75_LASR.Error.Byte;
		 SCI.Tx_data[33] = s_GND_Error;
		 SCI.Tx_data[34] = s_ModT_Error; //Trailer.MOD_Err0.Byte;
		 SCI.Tx_data[35] = s_CANT_Error;
		 break;
	  case 5:
 	     PGM_CRC_MC2 = Flash_CRC;
 	     SCI.Tx_data[20] = _B3_32(PGM_CRC_MC2); // MC2
 	     SCI.Tx_data[21] = _B2_32(PGM_CRC_MC2);
 	     SCI.Tx_data[22] = _B1_32(PGM_CRC_MC2);
 	     SCI.Tx_data[23] = _B0_32(PGM_CRC_MC2);
 	     SCI.Tx_data[24] = _B3_32(Config_CRC); // MC2
 	     SCI.Tx_data[25] = _B2_32(Config_CRC);
 	     SCI.Tx_data[26] = _B1_32(Config_CRC);
 	     SCI.Tx_data[27] = _B0_32(Config_CRC);
	     SCI.Tx_data[28] = _B3_32(Vehicle.Rear_ODO); // MC2
	     SCI.Tx_data[29] = _B2_32(Vehicle.Rear_ODO);
	     SCI.Tx_data[30] = _B1_32(Vehicle.Rear_ODO);
	     SCI.Tx_data[31] = _B0_32(Vehicle.Rear_ODO);
	  	 SCI.Tx_data[32] = Pcb_Test_8;
	  	 SCI.Tx_data[33] = _Hi_16(TCO.Rear.Koef);
	  	 SCI.Tx_data[34] = _Lo_16(TCO.Rear.Koef);
	  	 SCI.Tx_data[35] = DSC_Flags1;
	     break;
	  case 6:
	  	 SCI.Tx_data[20] = Wheel_3L.MDT.AV.Oss.Off_Val;
	  	 SCI.Tx_data[21] = Wheel_3R.MDT.AV.Oss.Off_Val;
	  	 SCI.Tx_data[22] = Wheel_3L.MDT.AV.Oss.On_Val;
	  	 SCI.Tx_data[23] = Wheel_3R.MDT.AV.Oss.On_Val;
	  	 SCI.Tx_data[24] = Wheel_3L.MDT.EV.Oss.Off_Val;
	  	 SCI.Tx_data[25] = Wheel_3R.MDT.EV.Oss.Off_Val;
	  	 SCI.Tx_data[26] = Wheel_3L.MDT.EV.Oss.On_Val;
	  	 SCI.Tx_data[27] = Wheel_3R.MDT.EV.Oss.On_Val;
		 SCI.Tx_data[28] = Wheel_3L.MOD_Err0.Byte;
		 SCI.Tx_data[29] = Wheel_3L.MOD_Err1.Byte;
		 SCI.Tx_data[30] = Wheel_3R.MOD_Err0.Byte;
		 SCI.Tx_data[31] = Wheel_3R.MOD_Err1.Byte;
	  	 break;
	  case 7:
		 SCI.Tx_data[21] = Wheel_3L.Sen_Err0.Byte;
		 SCI.Tx_data[22] = Wheel_3L.Sen_Err1.Byte;
		 SCI.Tx_data[23] = Wheel_3R.Sen_Err0.Byte;
		 SCI.Tx_data[24] = Wheel_3R.Sen_Err1.Byte;
		 SCI.Tx_data[25] = Wheel_3L.Test.Oss.A1_U0;
		 SCI.Tx_data[26] = Wheel_3L.Test.Oss.A2_U0;
	     SCI.Tx_data[27] = Wheel_3L.Test.Oss.Uamp;
		 SCI.Tx_data[28] = Wheel_3L.Test.Oss.WT_MinMax;
		 SCI.Tx_data[29] = Wheel_3R.Test.Oss.A1_U0;
	     SCI.Tx_data[30] = Wheel_3R.Test.Oss.A2_U0;
		 SCI.Tx_data[31] = Wheel_3R.Test.Oss.Uamp;
		 SCI.Tx_data[32] = Wheel_3R.Test.Oss.WT_MinMax;
	  	 SCI.Tx_data[33] = _Hi_16(TCO.Rear.VX);
	  	 SCI.Tx_data[34] = _Lo_16(TCO.Rear.VX);
		 SCI_TX_Data_Sel = 0;
		 break;
    } // end SCI_TX_Data_Sel

	SCI.Tx_data[47] = DYC_Situation;
	SCI.Tx_data[48] = Retarder_Flags;
	SCI.Tx_data[49] = _Hi_16(Acc_X_est);
	SCI.Tx_data[50] = _Lo_16(Acc_X_est);
	SCI.Tx_data[51] = _Hi_16(Acc_Y_est);//0;
	SCI.Tx_data[52] = _Lo_16(Acc_Y_est);//0;

    // передача для диагностики DIA_Oss()
	switch (DIA.Oss.Select)
    { case 0://    	  DIA_Default_Oss();
		switch (DIA.Oss.Road) //
		{ case 0: //  отладка активации режимов
		   SCI.Tx_data[53] = DSC_Flags;
		   SCI.Tx_data[54] = DSC_Flags4;
		  break;
		   case 1: // отладка ROP
		   SCI.Tx_data[53] = ROP_Flags;
		   SCI.Tx_data[54] = _Hi_16(ROP.Turn.Radius);
		   SCI.Tx_data[55] = ROP.BrakeR.Phase;
		   SCI.Tx_data[56] = _Hi_16(ROP.AccY_OzD);
		   SCI.Tx_data[57] = _Lo_16(ROP.AccY_OzD);
		  break;
	      case 2: //  отладка DYC
		   SCI.Tx_data[53] = _Hi_16(OmegaZ_Des);
		   SCI.Tx_data[54] = _Lo_16(OmegaZ_Des);
		   SCI.Tx_data[55] =  DYC.UnSt.PDOut/256;
		  break;
		   case 3: // отладка ABS
		   SCI.Tx_data[53] = Wheel_RL.PumpToss;
		   SCI.Tx_data[54] = Wheel_RR.PumpToss;
		   SCI.Tx_data[55] = ABS_Failures;
		  break;
	      case 4: // отладка ASR
		   SCI.Tx_data[53] = ASR_Flags;
		   SCI.Tx_data[54] = _Hi_16(ASR.Engine.Ref);
		   SCI.Tx_data[55] = _Lo_16(ASR.Engine.Ref);
		   SCI.Tx_data[56] = _Hi_16(ASR.RearSpeed);
		   SCI.Tx_data[57] = _Lo_16(ASR.RearSpeed);
		   SCI.Tx_data[58] = ASR.Engine.Torque;
		   SCI.Tx_data[59] = ASR.Engine.PID/256;
		   SCI.Tx_data[60] = ASR.Engine.Torq_EM1;
		   SCI.Tx_data[61] = ASR.Engine.Torq_EM2;
		   SCI.Tx_data[62] = _Hi_16(ASR.FrontBase);
		   SCI.Tx_data[63] = _Lo_16(ASR.FrontBase);
		   SCI.Tx_data[64] = REG_Failures;
	      break;
		  case 5: // отладка Ref
		   SCI.Tx_data[53] = _Hi_16(SpeedVX_RearAxel);
		   SCI.Tx_data[54] = _Lo_16(SpeedVX_RearAxel);
		  break;
		  case 8: // отладка XBR
		   SCI.Tx_data[53] = XBR_Flags;
		   SCI.Tx_data[54] = _Hi_16(XBR.Brake.Rear.Pdes);
		   SCI.Tx_data[55] = XBR_Mode;
		   SCI.Tx_data[56] = XBR.Brake.Rear.Phase;
		  break;
		  case 9: // отладка ABS TAI
		   SCI.Tx_data[53] = Wheel_RL.State.Byte;
		   SCI.Tx_data[54] = Wheel_RR.State.Byte;
		  break;
		  case 10: // отладка Load
           SCI.Tx_data[53] = _Hi_16(Load.Brake.P);
		   SCI.Tx_data[54] = _Hi_16(Load.Brake.M);
		   SCI.Tx_data[55] = _Hi_16(Load.Brake.Mass);//_Hi_16(Load.Brake.M2);
		   SCI.Tx_data[56] = _Hi_16(Load.Engine.M);
		   SCI.Tx_data[57] = _Hi_16(Load.Engine.Mass);//_Hi_16(Load.Engine.Ms);
		  break;
		  case 11: // отладка EBL
           SCI.Tx_data[53] = EBL_Flags;
		   SCI.Tx_data[54] = _B1_32(EBL.REG.Koef);
		   SCI.Tx_data[55] = _Hi_16(EBL.REG.P_Hg);
		   SCI.Tx_data[56] = _Hi_16(EBL.REG_RL.Pdes);
		   SCI.Tx_data[57] = _Hi_16(EBL.REG_RR.Pdes);
		  break;
		  case 16://          DIA_Validity_Oss();
	       SCI.Tx_data[53] = _Hi_16(Wheel_RL.Slip);
		   SCI.Tx_data[54] = _Lo_16(Wheel_RL.Slip);
		   SCI.Tx_data[55] = _Hi_16(Wheel_RL.ABS.SlipThr);
		   SCI.Tx_data[56] = _Lo_16(Wheel_RL.ABS.SlipThr);
		   SCI.Tx_data[57] = _Hi_16(Wheel_RR.Slip);
		   SCI.Tx_data[58] = _Lo_16(Wheel_RR.Slip);
		   SCI.Tx_data[59] = _Hi_16(Wheel_RR.ABS.SlipThr);
		   SCI.Tx_data[60] = _Lo_16(Wheel_RR.ABS.SlipThr);
	       break;
		} break;
/*	  case 1://       DIA_MDT_Oss();
          break;
	  case 2://	      DIA_SST1_Oss();
	      break;
	  case 3://		  DIA_SST2_Oss();
	      break;
	  case 4:
	      break;*/
	  case 5://	      DIA_SCI_Oss();
		  SCI.Tx_data[53] = Uart_Flag;
		  SCI.Tx_data[54] = SCI.Rx_data[0];
		  SCI.Tx_data[55] = cUartSCI.Rx_Cnt;
		  SCI.Tx_data[56] = cUartSCI.Tx_Cnt;
	      SCI.Tx_data[57] = cUartDIA.Rx_Cnt;
	      SCI.Tx_data[58] = DIA.Phase;
	      SCI.Tx_data[59] = DIA.RX.Command;
	      SCI.Tx_data[60] = SCI.Tx_XOR;
		  SCI.Tx_data[61] = SCI_Loss_Sinchro;
	      break;
//	  case 6://		  DIA_LSSw_Oss();
//          break;
	  case 7://		  DIA_CANJ_Oss();
		  SCI.Tx_data[53] = CANT.TxErrCnt;
		  SCI.Tx_data[54] = CANT.Phase;
		  SCI.Tx_data[55] = CANT.Tout;
		  SCI.Tx_data[56] = CANT_Flags;
		  SCI.Tx_data[57] = cCANT.Rx_Cnt;//CANT.TrCnt;
		  SCI.Tx_data[58] = CANT.TxErrCnt;
	      break;
/*	  case 8://		  DIA_Button_Oss();
	      break;
	  case 9://		  DIA_EPROM_Oss();
	      break;*/
	  case 10://		  DIA_LIM_Oss();
	  	  SCI.Tx_data[53] = _Hi_16(LIM.Speed.DeriVative);//LIM.B7.Tim_HiCnt;
	  	  SCI.Tx_data[54] = _B2_32(LIM.B7.Period);
	  	  SCI.Tx_data[55] = _B1_32(LIM.B7.Period);
	//  	  SCI.Tx_data[56] = _B0_32(LIM.B7.Period);
	  	  SCI.Tx_data[56] =  _Hi_16(LIM.PK.PWM.OffTime);
	  	  SCI.Tx_data[57] = _Hi_16(LIM.B7.Duration);
	//  	  SCI.Tx_data[58] = _Lo_16(LIM.B7.Duration);
	  	  SCI.Tx_data[58] = LIM.Phase;
 		  SCI.Tx_data[59] = _Hi_16(LIM.B7.Speed);
	      SCI.Tx_data[60] = _Lo_16(LIM.B7.Speed);
 		  SCI.Tx_data[61] = _Hi_16(LIM.Speed.Est);
 	      SCI.Tx_data[62] = _Hi_16(LIM.PK.PWM.Period);//
	      SCI.Tx_data[63] = LIM.PID.Out;//_Lo_16(LIM.Speed.Est);
	      SCI.Tx_data[64] = LIM_B7_Flags;
		  SCI.Tx_data[65] = LIM_PK_Flags,
		  SCI.Tx_data[66] = _Hi_16(LIM.Speed.ThresHold);
		  SCI.Tx_data[67] = _Hi_16(LIM.PK.PWM.Des);
		  // последний [68]
		  SCI.Tx_data[68] = _Hi_16(LIM.PK.PWM.OnTime);
	//	  SCI.Tx_data[69] = LIM.Phase;//
	      break;
	  case 11:  //      DIA_ICM_AG_Oss();
#ifdef __Rectangular_Board  // прямоугольная плата
    	  SCI.Tx_data[53] = _Hi_16(ICM_AG.AccelX);
		  SCI.Tx_data[54] = _Lo_16(ICM_AG.AccelX);
		  SCI.Tx_data[55] = _Hi_16(ICM_AG.AccelY);
		  SCI.Tx_data[56] = _Lo_16(ICM_AG.AccelY);
		  SCI.Tx_data[57] = _Hi_16(ICM_AG.AccelZ);
		  SCI.Tx_data[58] = _Lo_16(ICM_AG.AccelZ);
		  SCI.Tx_data[59] = _Hi_16(ICM_AG.GyroX);
		  SCI.Tx_data[60] = _Lo_16(ICM_AG.GyroX);
		  SCI.Tx_data[61] = _Hi_16(ICM_AG.GyroY);
		  SCI.Tx_data[62] = _Lo_16(ICM_AG.GyroY);
		  SCI.Tx_data[63] = _Hi_16(ICM_AG.GyroY);
		  SCI.Tx_data[64] = _Lo_16(ICM_AG.GyroY);
		  SCI.Tx_data[65] = _Hi_16(ICM_AG.Temp);
		  SCI.Tx_data[66] = _Lo_16(ICM_AG.Temp);
	  	  SCI.Tx_data[67] = cSPI1.Rx_Cnt;
#endif
	      break;
/*	  case 12://		  DIA_SAS_Oss();
	      break;
	  case 13://          DIA_MDT_Oss6();
          break;*/
	  case 14://          DIA_Validity_Oss();
          break;
	  case 15://          DIA_Validity_Oss();
          break;
    }
#endif
} // end UartSTM_TX_Data()

void    UartSTM_Send(void)
{
//#define __SCI_Send_Delay 400U  // задержка начала связи
#define __SCI_ToutFail   200U  // Tout потери связи
	// TimeOut приема от другого STM и ошибка 1c
    if(SCI.TimeOut < __SCI_ToutFail)
       SCI.TimeOut++;
    else SCI2_Tout = 1;
    // сброс ошибки в myHAL_UART_RxCpltCallback

#ifdef   __AxisF_Compile
    //готовим данные
    SCI.Tx_data[0] = __SCI_Head_B0;      //заголовок
    if(WR_BufCFG_MC2)
	{ // передаем буфер CFG
	   SCI.Tx_data[1] = __SCI_Head_B1_CB; // второй байт
	   SCI.Tx_data[2] = _Hi_16(DSC_Const_Adr);
	   SCI.Tx_data[3] = _Lo_16(DSC_Const_Adr);
       for (uint8_t i = 0; i < 10; i++)
	   {
	     SCI.Tx_data[i*2+4] = _Hi_16(DSC_Const_Buf[i + DSC_Const_Adr]);
	     SCI.Tx_data[i*2+5] = _Lo_16(DSC_Const_Buf[i + DSC_Const_Adr]);
	   }
	   if(DSC_Const_Adr > SizeCFGBuf)
	   { WR_BufCFG_MC2 = 0;
	     WR_CFG_MC2_Req = 1;
	   }
	   else DSC_Const_Adr += 10;
	}
	else
	if(WR_CFG_MC2_Req)
	{  WR_CFG_MC2_Req = 0;
	   SCI.Tx_data[1] = __SCI_Head_B1_CW;
	   // передаем счетчик чтобы были одинаковы СRC
	   SCI.Tx_data[2] = _B3_32(Config_Cnt);
	   SCI.Tx_data[3] = _B2_32(Config_Cnt);
	   SCI.Tx_data[4] = _B1_32(Config_Cnt);
	   SCI.Tx_data[5] = _B0_32(Config_Cnt);
    }
    else
	{ // обычный кадр SCI
	      SCI.Tx_data[1] = __SCI_Head_B1_N;
	      UartSTM_TX_Data();
	}

	SCI.Tx_XOR = 0; // определяем передаваемый XOR
    for (uint8_t i = 0; i < (UartSCI_Tx_Length-1); i++)
	{  SCI.TxBuff[i] = SCI.Tx_data[i];
	   SCI.Tx_XOR ^= SCI.TxBuff[i];
	}
	SCI.TxBuff[UartSCI_Tx_Length-1] = SCI.Tx_XOR;
	// запуск передачи
    HAL_UART_Transmit_IT(&huartSCI, SCI.TxBuff, UartSCI_Tx_Length);
//    HAL_UART_Transmit_DMA(&huartSCI, SCI.TxBuff, UartSCI_Tx_Length);
#else  // STM2 UartSTM_Send()

	SCI.Tx_data[0] = __SCI_Head_B0;    //заголовок
    //готовим данные
	SCI.Tx_data[1] = __SCI_Head_B1_N;
	UartSTM_TX_Data();
	SCI.Tx_XOR = 0; // определяем передаваемый XOR
	for (uint8_t i = 0; i < (UartSCI_Tx_Length-1); i++)
	{  SCI.TxBuff[i] = SCI.Tx_data[i];
		  SCI.Tx_XOR ^= SCI.TxBuff[i];
	}
	SCI.TxBuff[UartSCI_Tx_Length-1] = SCI.Tx_XOR;
	// запуск передачи
	HAL_UART_Transmit_IT(&huartSCI, SCI.TxBuff, UartSCI_Tx_Length);
//    HAL_UART_Transmit_DMA(&huartSCI, SCI.TxBuff, UartSCI_Tx_Length);
#endif
} // end UartSTM_Send()


/*  GPIO_EXTI  callback in non blocking mode */
void HAL_GPIO_EXTI_Callback(uint16_t Pin)
{
//#ifdef   __AxisR_Compile
	GPIO_PinState MCx_RX_State;
	//определяем состояние   MCx_RX_Pin
	MCx_RX_State = HAL_GPIO_ReadPin(MCx_RX_GPIO_Port, MCx_RX_Pin);
	if(Pin == MCx_RX_Pin)
	{ // поступило прерывание от MCx_RX_Pin
	if(UartDIA_Sinxr_Flag)
	{
	  if(MCx_RX_State == GPIO_PIN_RESET)
	  { DIA_MCx_Send = 1;
        USART1->CR1 &= ~UART_MODE_RX;  // запрет приемника
	    if(DIA.TP_Select == 16)	_TP_Off;
	  }
	  else
	  { DIA_MCx_Send = 0;
        // разрешение приемника
        USART1->CR1 |= UART_MODE_RX;

		if(AGS_UpGrade_Request)
		{  // AGS и SAS UpGrade по одному флагу
			AGS_UpGrade_Active = 1;
        }
		if(AGS_UpGrade_Active)
		{ if(UpGrade.Command == 0x6E)
			 UpGrade_Flags = 0;
			UartDIA.Rx_Len = __PGM_Rx_Length;
		}
		else UartDIA.Rx_Len = __DIA_Rx_Length;
	    HAL_UART_Receive_DMA(&huartKline, UartDIA.Rx_data, UartDIA.Rx_Len);

	    if(DIA.TP_Select == 16)	_TP_On;
	  }
	}
	}
//#endif
#ifdef __Invense
#ifdef __Square_Board
	if(Pin == INT_ICM_Pin)
	{ // поступило прерывание от ICM
	  if(HAL_GPIO_ReadPin(INT_ICM_GPIO_Port, INT_ICM_Pin) == GPIO_PIN_RESET)
	  { // конфликт с EPROM
		if(HAL_GPIO_ReadPin(CS_EPROM_GPIO_Port, CS_EPROM_Pin) == GPIO_PIN_SET)
			ICM_Int_Request = 1; // SPI1 занят ставим запрос
	  }
	}
#endif
#endif
}

#if defined __Diag_Kline
void     Buffer_Active_Error(void)
{ // Связывает Буфер Active_Faults[] с активными неиспраностями
  // Структуру не менять
	s_Diff_Error = Dif_Error_MC1 | (Dif_Error_MC2 & 0x0F);
	s_GND_Error |= MC2_GND_Error;
	s_Other_Error |= (MC2_Other_Error& 0x07)<<3;
	Active_Faults[0] = Wheel_FL.Sen_Err0.Byte;
	Active_Faults[1] = Wheel_FL.Sen_Err1.Byte;
	Active_Faults[2] = Wheel_FR.Sen_Err0.Byte;
	Active_Faults[3] = Wheel_FR.Sen_Err1.Byte;
	Active_Faults[4] = Wheel_RL.Sen_Err0.Byte;
	Active_Faults[5] = Wheel_RL.Sen_Err1.Byte;
	Active_Faults[6] = Wheel_RR.Sen_Err0.Byte;
	Active_Faults[7] = Wheel_RR.Sen_Err1.Byte;
	Active_Faults[8] = s_MC1_Error;
	Active_Faults[9] = s_MC2_Error;
	Active_Faults[10] = Power_Error;
	Active_Faults[11] = Wheel_FL.MOD_Err0.Byte;
	Active_Faults[12] = Wheel_FL.MOD_Err1.Byte;
	Active_Faults[13] = Wheel_FR.MOD_Err0.Byte;
	Active_Faults[14] = Wheel_FR.MOD_Err1.Byte;
	Active_Faults[15] = Wheel_RL.MOD_Err0.Byte;
	Active_Faults[16] = Wheel_RL.MOD_Err1.Byte;
	Active_Faults[17] = Wheel_RR.MOD_Err0.Byte;
	Active_Faults[18] = Wheel_RR.MOD_Err1.Byte;
	Active_Faults[19] = s_Prop_Error;
	Active_Faults[20] = s_Diff_Error;
	Active_Faults[21] = s_CANJ_Error;
	Active_Faults[22] = s_B7_TCO_Error;
	Active_Faults[23] = s_Other_Error;
	Active_Faults[24] = s_DBR_Error;
	Active_Faults[25] = s_GND_Error;
    // New Additive Error
	Active_Faults[26] = Wheel_3L.Sen_Err0.Byte;
	Active_Faults[27] = Wheel_3L.Sen_Err1.Byte;
	Active_Faults[28] = Wheel_3R.Sen_Err0.Byte;
	Active_Faults[29] = Wheel_3R.Sen_Err1.Byte;
	Active_Faults[30] = 0;//s_MC3_Error;
	Active_Faults[31] = Wheel_3L.MOD_Err0.Byte;
	Active_Faults[32] = Wheel_3L.MOD_Err1.Byte;
	Active_Faults[33] = Wheel_3R.MOD_Err0.Byte;
	Active_Faults[34] = Wheel_3R.MOD_Err1.Byte;
	Active_Faults[35] = s_SAS_Error;
	Active_Faults[36] = s_AGS_Error;
	Active_Faults[37] = s_ModT_Error;//Trailer.MOD_Err0.Byte;
	Active_Faults[38] = 0;//Trailer.MOD_Err1.Byte;
	Active_Faults[39] = s_PrS_Error;
	Active_Faults[40] = s_CANT_Error;
	Active_Faults[41] = 0; //резерв
} // end Buffer_Active_Error();

//--------------------------------DIA_ISO-----------------------------------

void     Clear_Active_Error(void)
{
    for (uint8_t i = 0; i < __Errors_Num; i++)
    {
    	Active_Faults[i] = 0;
    }
} // end Clear_Active_Error();
void     Clear_Passive_Error(void)
{
    for (uint8_t i = 0; i < __Errors_Num; i++)
    {
    	Passive_Faults[i] = 0;
    }
} // end Clear_Passive_Error();

#define __Cod_5bod      10  //11
#define __ISO_Synchro   0x55   //85
#define __ISO_Key_1     0x47   //71
#define __ISO_Key_2     0x19   //25
#define __DIA_AckError  0x05
#define __Trans_Ident   0x72

#define __DIA_TimeOut   200   //1c
#define __Err_Num_Old   0x1A    //  - 26 - 4 ch
#define __Err_Num_New   0x2A    //  - 42 - 6 ch + SKU

#define __Period_5bod   37 //200
#define __dT_5bod       3 //10     //5%
//-----------------------------------------------------------

void     Diagnose_ISO9141(void)
{
	GPIO_PinState  KlineRxPin;

	//определяем состояние Kline_RX_Pin
	KlineRxPin = HAL_GPIO_ReadPin(GPIOA, Kline_RX_Pin);
	if(DIA.Cnt_200mc++ > __Period_5bod)
	   DIA.Cnt_200mc = 0;
	//
	switch (DIA.Phase)
	{
	   case 0: // установления высокого уровня при включении
		   if(KlineRxPin) DIA.Phase++;
	   break;
	   case 1: // ожидаем фронт имульса старт
		   if(!KlineRxPin)
		   {  DIA.Cnt_200mc = 0;
		      DIA.Phase++;
		   }
	   break;
	   case 2: // ожидаем завершение имульса старт
		   if(KlineRxPin &&
		      DIA.Cnt_200mc < (__Period_5bod - __dT_5bod))
		   { // ошибка сброс
			 DIA.Phase = 0;
		   }
	       if(DIA.Cnt_200mc == __Period_5bod)
		   {  DIA.Nbit_5bod = 0;
		      DIA.Phase++;
		   }
	   break;
	   case 3: // пием бит
		   if(DIA.Cnt_200mc == __Period_5bod/2)
		   {  DIA.Mask_5bod = ((__Cod_5bod | 0x100) & (1<<DIA.Nbit_5bod));
			  if((KlineRxPin == GPIO_PIN_SET   && DIA.Mask_5bod) ||  // единицы
	             (KlineRxPin == GPIO_PIN_RESET && !DIA.Mask_5bod))  // нули
	          {	if(DIA.Nbit_5bod++ > 7) // стоповый бит Nbit = 8
	            { // принят код 5bod
#ifdef   __AxisF_Compile
	        	  UartDIA_Sinxr_Flag =  1;
	        	  UartDIA.TimeOut = 0;
	        	  DIA.RX.Command = 0;
	        	  HAL_UART_Abort(&huartKline);
	        	  HAL_UART_Receive_DMA(&huartKline, UartDIA.Rx_data, 2);
#else
	        	  HAL_UART_Abort(&huartKline);
	        	  HAL_UART_Receive_DMA(&huartKline, UartDIA.Rx_data, 5);
#endif
	        	  DIA.Phase++;
	            }
	          }
			}
	   break;
	   case 4: // ---------  прием инициализации ------------------
		   if(UartDIA.TimeOut++ < 100)
		   {
#ifdef   __AxisF_Compile
		     if(DIA.RX.Command == 0x72) // Moto_Ident
		     {
			   UartDIA.Tx_data[0] = __ISO_Synchro;
			   UartDIA.Tx_data[1] = __ISO_Key_1;
			   UartDIA.Tx_data[2] = __ISO_Key_2;
			   UartDIA_Send(3);
			   DIA.Phase++;
		     }
#else
		     if(UartDIA.Rx_data[0] == 0x72 &&  // Moto_Ident
		        UartDIA.Rx_data[1] == 2 &&
			    UartDIA.Rx_data[2] == __ISO_Synchro &&
			    UartDIA.Rx_data[3] == __ISO_Key_1 &&
			    UartDIA.Rx_data[4] == __ISO_Key_2)
		     {
			   DIA.Phase++;
			   UartDIA_Sinxr_Flag =  1;
		       UartDIA.TimeOut = 0;
			   UartDIA.Rx_Len = __DIA_Rx_Length;
			   HAL_UART_Receive_DMA(&huartKline, UartDIA.Rx_data, UartDIA.Rx_Len);
		     }
#endif
		   }
		   else DIA.Phase = 0; // сброс превышено время ожидания Moto_Ident
	   break;
	   case 5: // ---------  прием ----------------------
			   // ---------  TimeOut ----------------------
		   if(UartDIA.TimeOut >= __DIA_TimeOut)
		   { UartDIA_Sinxr_Flag = 0;
			 DIA.Phase = 0;
			 DIA.RX.Command = 0;
			 UpGrade_Flags = 0;
			 BridgeCAN_Flags = 0;
			 PGM_Flags = 0;   // обязательно иначе не будет ISO
			 HAL_UART_Abort(&huartKline);
			 _Port_On(MCx_TX);
		   }
		   else
		   { UartDIA.TimeOut++;
#ifdef   __AxisF_Compile
		     if(Dia_Emul_Fl)
		     {  Dia_Emul_Fl = 0;
			   UartDIA_Send(UartDIA.Tx_Len);
			 }
#endif
		   }
	   break; //case 5:
	}
} // end Diagnose_ISO9141()

// Селектор команд диагностики
void UartDIA_Receive(void)
{
#ifdef   __AxisF_Compile
	uint8_t i;
	if(DIA.RX.Command == 0xAF) //175
	{
	  if(AGS_UpGrade_Active ||
	     SAS_UpGrade_Active)
      { //принят Paket AGS UpGrade
	    for (i = 0; i < __PGM_Rx_Length; i++)
	    UpGrade.Paket[i]= DIA.RX.Data[i];
	    UpGrade.Command = DIA.RX.Data[2];
	    UpGrade_UartRx = 1; // флаг что принято
      }
	}
	else // нет прораммирования
#endif
	switch (DIA.RX.Command & 0x1F)
    {
#ifdef   __AxisF_Compile
	   case 0: // Clr Flash
		   DIA_Write_CFG();
	   break;
       case 1: // --- Wr Flash---
    	   DIA_WrBuf_CFG();
   	   break;

       case 2:  // Reload_Address
	   case 8:  // Reload_SenTest  !!!not Used
	   case 14: // Reload_PGM
       case 17: // Reload_Security
	   break;

	   case 3: // ---Reload_Osc---
		   DIA_Oss();
	   break;
	   case 4: // Reload_Diag_Stop

	   break;
	   case 5: // Reload_Start_Speed
//		   DSC_Emul_Fl = 1;
	   break;
	   case 6: // Road_Emul_DSC
	   case 7: // Reload_Poly
		   // W1,W2,W3,W4,PrBr,DSC_Akker,DSC_OmegaZ,DSC_AccY,DSC_AccX
		    Dia_Emul_Fl = 1;
		    if(DSC_Emul_Fl) Emul.Delay_Cnt = 10;
			Wheel_FL.SpeedI = ((uint16_t)DIA.RX.Data[1]*256 + DIA.RX.Data[2]) * 4;
			Wheel_FR.SpeedI = ((uint16_t)DIA.RX.Data[3]*256 + DIA.RX.Data[4]) * 4;
			Wheel_RL.SpeedI = ((uint16_t)DIA.RX.Data[5]*256 + DIA.RX.Data[6]) * 4;
			Wheel_RR.SpeedI = ((uint16_t)DIA.RX.Data[7]*256 + DIA.RX.Data[8]) * 4;
			for (i = 0; i < 5; i++)
			{  // принимаем
			   Emul.Rx_Data[i] = DIA.RX.Data[i+9];
			   // передаем
			   UartDIA.Tx_data[i] = Emul.Tx_Data[i];
			}
	   break;
	   case 9: //----Reload_Mod_Diag----
			MDT.ISO_N = DIA.RX.Data[1];
	        break;
	   case 10: //Reload_Reset
			Flag_Reset = 1;
	        break;
	   case 11: //----Reload_RD_EEPROM----
		    DIA_Read_EPROM();
	        break;
	   case 12: //----Reload_WR_EEPROM----
		    DIA_Write_EPROM();
	        break;
	   case 13: //----Reload_Active_Err----
		    DIA_Error();
	        break;
	   case 15: //----Reload_RD_RAM----
		    DIA_Read_RAM();
	        break;
	   case 16: //----Reload_WR_RAM----
		    DIA_Write_RAM();
	        break;
	   case 19: //----ProgFlash_Init---
		    if( UartDIA.Rx_data[1] == __Pgm_AGS_Init)
		    {  // программирование AGS
		       AGS_UpGrade_Request = 1;
		       UpGrade.CAN_DA = PGM_AGS_Adr;
		       UartDIA.Tx_data[0] = 0x73; // ответ обязателен!!!
		       UartDIA.Tx_data[1] = __Pgm_AGS_Init;
		    }
		    else
		    if( UartDIA.Rx_data[1] == __Pgm_SAS_Init)
		    {  // программирование SAS
		       SAS_UpGrade_Request = 1;
		       UpGrade.CAN_DA = PGM_SAS_Adr;
			   UartDIA.Tx_data[0] = 0x73; // ответ обязателен!!!
			   UartDIA.Tx_data[1] = __Pgm_SAS_Init;
		    }
		    else
		    if( UartDIA.Rx_data[1] == Pgm_STM1)// 0x33
		    { // программирование STM1
		      // здесь выключаем реле в Power_Test
		      __HAL_TIM_SET_COMPARE(&htim2, TIM_CHANNEL_4, PWM1_PERIOD_VALUE+1);
              PGM_Interface = UART_Selected;
			  HAL_UART_Abort(&huartKline); //обязательно иначе плохо принимает ?
			  PGM_Active = 1;
		    }
		    else
		    if( UartDIA.Rx_data[1] == Pgm_STM2)// 0x34
		    { // программирование STM2
		      // запуск в самом  STM2
		      // здесь выключаем реле в Power_Test
		      __HAL_TIM_SET_COMPARE(&htim2, TIM_CHANNEL_4, PWM1_PERIOD_VALUE+1);
			  PGM_STM2_Active = 1; // запрещяет ответ в UartDIA
			  UartDIA_Sinxr_Flag = 0;
      		  HAL_UART_Abort(&huartKline);
		    }
	        break;
	   case 20: //--Erase_Error_EPROM
			DIA_Erase_EPROM();
		    break;
	   case 21: //----Reload_Active_Err----
		    DIA_AddError();
	        break;
	   case 22: //Reload_TestPulsDSC
		    Diag.Command = DIA.RX.Data[1];
	        break;
	   case 23: //---Reload_Bridge_CAN---
		   Uart_BridgeCAN = 1;
		   BridgeCAN.DA = UartDIA.Rx_data[1];
		   BridgeCAN.Adr= UartDIA.Rx_data[2]*65536 +
					      UartDIA.Rx_data[3]*256 +
					      UartDIA.Rx_data[4];
		   for (i = 0; i < 8; i++)
			    BridgeCAN.InBuf[i] = UartDIA.Rx_data[i+5];
		   BridgeCAN_Active = 1;
	       break;
#else
	   case 3: // ---Reload_Osc---
		    DIA_Oss();
	        break;
	   case 9: //----Reload_Mod_Diag----
			MDT.ISO_N = DIA.RX.Data[1];
	        break;
	   case 15: //----Reload_RD_RAM----
		    DIA_Read_RAM();
	        break;
	   case 16: //----Reload_WR_RAM----
		   DIA_Write_RAM();
	   break;
	   case 19: //----ProgFlash_Init---
		    if( UartDIA.Rx_data[1] == __Pgm_AGS_Init ||
		        UartDIA.Rx_data[1] == __Pgm_SAS_Init)
			    AGS_UpGrade_Request = 1; // по одному флагу
		    else
		    if( UartDIA.Rx_data[1] == 0x34)
		    { // программирование STM2
		      // здесь выключаем реле
 		      _Port_Off(RELE_D2);
	          PGM_Interface = UART_Selected;
			  __disable_irq();
			  HAL_UART_Abort(&huartKline); //обязательно иначе плохо принимает ?
			  PGM_Active = 1;
		    }
	   break;
	   case 22: //Reload_TestPulsDSC
		   Diag.Command = DIA.RX.Data[1];
	   break;
#endif
    }
} // end UartDIA_Receive();


void     DIA_SAS_Oss(void)
{ // вызывается в DIA_Oss() MySystem.c
#ifdef   __AxisF_Compile
	// первая строка в Осциллографе
	UartDIA.Tx_data[0] = (CANS.SENS.Data[0]*256+CANS.SENS.Data[1])/16;
	UartDIA.Tx_data[3] = 0;
	UartDIA.Tx_data[6] = (CANS.SENS.Data[4]*256+CANS.SENS.Data[5])/16;
	UartDIA.Tx_data[9] = (CANS.SENS.Data[6]*256+CANS.SENS.Data[7])/16;
	// вторая строка в Осциллографе
	UartDIA.Tx_data[1] = CANS.SAS.Data[2];
	UartDIA.Tx_data[4] = CANS.SAS.Data[3];
	UartDIA.Tx_data[7] = (CANS.SAS.Data[4]*256+CANS.SAS.Data[5])/16;
	UartDIA.Tx_data[10]= (CANS.SAS.Data[6]*256+CANS.SAS.Data[7])/16;
	// третья строка в Осциллографе
	UartDIA.Tx_data[2] = _Hi_16(SAS.value);
	UartDIA.Tx_data[5] = _Lo_16(SAS.value);
	UartDIA.Tx_data[8] = CANS.SENS.Data[2];
	UartDIA.Tx_data[11]= CANS.SENS.Data[3];
	// четвертая строка в Осциллографе
	UartDIA.Tx_data[12] = _Hi_16(Steer_sen);
	UartDIA.Tx_data[13] = _Lo_16(Steer_sen);
	UartDIA.Tx_data[14] = _Hi_16(CANS.SAS.Error);//Test_2;
	UartDIA.Tx_data[15] = _Lo_16(CANS.SAS.Error);//Test_1;
	// пятая строка в Осциллографе
	UartDIA.Tx_data[16] = _Hi_16(Steering_Angle);
	UartDIA.Tx_data[17] = _Lo_16(Steering_Angle);
	UartDIA.Tx_data[18] = _Hi_16(SAS.OffSet);
	UartDIA.Tx_data[19] = _Lo_16(SAS.OffSet);
	// шестая строка в Осциллографе
	UartDIA.Tx_data[20] = _Hi_16(SAS.Steering);
	UartDIA.Tx_data[21] = _Lo_16(SAS.Steering);
	UartDIA.Tx_data[22] = _Hi_16(SAS.Ratio);
	UartDIA.Tx_data[23] = _Lo_16(SAS.Ratio);
#endif
} //END  DIA_CANJ_Oss();

void     DIA_Oss(void)
{
	switch (DIA.Oss.Select)
    { default:
	  case 0:
    	  DIA_Default_Oss();  // MyVAR.c
  	      break;
	  case 1:
          DIA_MDT_Oss();  // MyFunc.c
          break;
	  case 2:
	      DIA_SST1_Oss();  // MyVAR.c
	      break;
	  case 3:
		  DIA_SST2_Oss();  // MyVAR.c
	      break;
	  case 4:
	      DIA_CRC_Oss();  // MySystem.c
	      break;
	  case 5:
	      DIA_SCI_Oss();  // MySystem.c
	      break;
	  case 6:
		  DIA_LSSw_Oss();  // MyFunc.c
          break;
	  case 7:
		  DIA_CANJ_Oss();  // MySystem.c
	      break;
	  case 8:
		  DIA_Button_Oss();// MySystem.c
	      break;
	  case 9:
		  DIA_EPROM_Oss(); // MySystem.c
	      break;
	  case 10:
		  DIA_LIM_Oss();   // MySystem.c
	      break;
	  case 11:
	      DIA_ICM_AG_Oss(); // MySystem.c
	      break;
	  case 12:
		  DIA_SAS_Oss(); // MySystem.c
	      break;
	  case 13:
          DIA_MDT_Oss6();  // MyFunc.c
          break;
	  case 14:
          DIA_Validity_Oss(); // MyVAR.c
          break;
	  case 15:
		  DIA_AGS_Oss(); // MyVAR.c
          break;
    }
} // end DIA_Oss()

void     DIA_Error(void)
{
	for (uint8_t i = 0; i < 26; i++)
    UartDIA.Tx_data[i] = Active_Faults[i];

} // end DIA_Error()

void     DIA_AddError(void)
{
	for (uint8_t i = 0; i < 16; i++)
    UartDIA.Tx_data[i] = Active_Faults[i+26];

} // end DIA_AddError()

void     DIA_Read_RAM(void)
{
   if(DIA.RX.Data[1] == 0)
   {
	 DIA.RdRAM_Sel = DIA.RX.Data[1]*256 + DIA.RX.Data[2];
	 switch (DIA.RdRAM_Sel)
     {
	  case 1: // AdrLamp
		    UartDIA.Tx_data[0] = System_F;  // SW_ASR
		    UartDIA.Tx_data[1] = Front_Flags2; // ABS_System_F0 and 1 Rele_ON
		    UartDIA.Tx_data[2] = System_F1; // SW_ABS
		    UartDIA.Tx_data[3] = System_F2; // LampABS
		    UartDIA.Tx_data[4] = Front_Flags;
		    UartDIA.Tx_data[5] = System_F4; // SW_TSET
		    UartDIA.Tx_data[6] = 5;//
		    UartDIA.Tx_data[7] = System_F5; // LampVDC
	  break;
	  case 2: // AdrStop
		    UartDIA.Tx_data[0] = Brake.Front.Air;
		    UartDIA.Tx_data[1] = Brake.Rear.Air;
		    UartDIA.Tx_data[2] = _Hi_16(Brake.DemandValue);
		    UartDIA.Tx_data[3] = _Hi_16(TrailerPress);
		    UartDIA.Tx_data[4] = _Hi_16(ECAS.ASC4.BellowPress);
		    UartDIA.Tx_data[5] = _Hi_16(ECAS.ASC4.SensPress);
		    UartDIA.Tx_data[6] = _Hi_16(Press_Sen1);
		    UartDIA.Tx_data[7] = _Hi_16(Press_Sen2);
	  break;
	  case 3: // AdrDSC_Flags
		    UartDIA.Tx_data[0] = DSC_Flags;
		    UartDIA.Tx_data[1] = Front_Flags;
		    UartDIA.Tx_data[2] = Rear_Flags;
		    UartDIA.Tx_data[3] = DSC_Flags4;
		    UartDIA.Tx_data[4] = TorqueMode;
		    UartDIA.Tx_data[5] = DSC_Flags3;
		    UartDIA.Tx_data[6] = DSC_Flags2;
		    UartDIA.Tx_data[7] = DSC_Flags5;
	  break;
	  case 4: // AdrECUID_Dat0
		  // сделать ADUI для DM
		   for (uint8_t i = 0; i < 8; i++)
		     UartDIA.Tx_data[i] = (char)ADUI[i];
	  break;
	  case 5: // AdrECUID_Dat8
		   for (uint8_t i = 0; i < 8; i++)
		     UartDIA.Tx_data[i] = (char)ADUI[i+8];
	  break;
	  case 6: // AdrPcb_Test_1
		    UartDIA.Tx_data[0] = Pcb_Test_1;
		    UartDIA.Tx_data[1] = Pcb_Test_2;
		    UartDIA.Tx_data[2] = Pcb_Test_3;
		    UartDIA.Tx_data[3] = Pcb_Test_4;
		    UartDIA.Tx_data[4] = Pcb_Test_5;
		    UartDIA.Tx_data[5] = Pcb_Test_6;
		    UartDIA.Tx_data[6] = Pcb_Test_7;
		    UartDIA.Tx_data[7] = Pcb_Test_8;
	  break;
	  case 7: // adrCRC32_MC3
		  	PGM_CRC_MC1 = Flash_CRC;
		    UartDIA.Tx_data[0] = _B3_32(PGM_CRC_MC1); // MC1
		    UartDIA.Tx_data[1] = _B2_32(PGM_CRC_MC1);
		    UartDIA.Tx_data[2] = _B1_32(PGM_CRC_MC1);
		    UartDIA.Tx_data[3] = _B0_32(PGM_CRC_MC1);
		    UartDIA.Tx_data[4] = _B3_32(PGM_CRC_MC2); // MC2
		    UartDIA.Tx_data[5] = _B2_32(PGM_CRC_MC2);
		    UartDIA.Tx_data[6] = _B1_32(PGM_CRC_MC2);
		    UartDIA.Tx_data[7] = _B0_32(PGM_CRC_MC2);
	  break;
	  case 8: // AdrRunaway_0
		    UartDIA.Tx_data[0] = _B2_32(Vehicle.RunaWay);
		    UartDIA.Tx_data[1] = _B1_32(Vehicle.RunaWay);
		    UartDIA.Tx_data[2] = _B0_32(Vehicle.RunaWay);
		    UartDIA.Tx_data[3] = _B2_32(Vehicle.WorkTime);
		    UartDIA.Tx_data[4] = _B1_32(Vehicle.WorkTime);
		    UartDIA.Tx_data[5] = _B0_32(Vehicle.WorkTime);

		    UartDIA.Tx_data[7] = Pcb_Test_9;
	  break;

	  case 14: // CAN_HDRH_Adr
		    UartDIA.Tx_data[0] = _B3_32(TCO.HDRH_Distance);
		    UartDIA.Tx_data[1] = _B2_32(TCO.HDRH_Distance);
		    UartDIA.Tx_data[2] = _B1_32(TCO.HDRH_Distance);
		    UartDIA.Tx_data[3] = _B0_32(TCO.HDRH_Distance);
		    UartDIA.Tx_data[4] = _Hi_16(Body.Ambient_Temperature);
		    UartDIA.Tx_data[5] = _Lo_16(Body.Ambient_Temperature);
		    UartDIA.Tx_data[6] = CAN_PGN_Find1;
		    UartDIA.Tx_data[7] = CAN_PGN_Tout1;
	  break;
	  case 15: // CAN_HDRH_Adr+8
		    UartDIA.Tx_data[0] = _Hi_16(ECAS.ASC4.BellowPress);
		    UartDIA.Tx_data[1] = _Lo_16(ECAS.ASC4.BellowPress);
		    UartDIA.Tx_data[2] = _Hi_16(CAN_Engine.EC1.TaxoPoint1);
		    UartDIA.Tx_data[3] = _Lo_16(CAN_Engine.EC1.TaxoPoint1);
		    UartDIA.Tx_data[4] = CAN_Engine.EC1.TorquePoint1;
		    UartDIA.Tx_data[5] = CAN_Engine.EC1.TorquePoint5;
		    UartDIA.Tx_data[6] = _Hi_16(CAN_Engine.EC1.TaxoPoint2);
		    UartDIA.Tx_data[7] = _Lo_16(CAN_Engine.EC1.TaxoPoint2);
	  break;
	  case 16: // CAN_HDRH_Adr+16
		    UartDIA.Tx_data[0] = 0;
		    UartDIA.Tx_data[1] = Validity_Flags;
		    UartDIA.Tx_data[2] = _Hi_16(Weght.Truck_Front);
		    UartDIA.Tx_data[3] = _Lo_16(Weght.Truck_Front);
		    UartDIA.Tx_data[4] = _Hi_16(Engine.Torque);
		    UartDIA.Tx_data[5] = _Lo_16(Engine.Torque);
		    UartDIA.Tx_data[6] = _Hi_16(Weght.Truck_ECAS);
		    UartDIA.Tx_data[7] = _Lo_16(Weght.Truck_ECAS);
	  break;
	  case 17: // CAN_VAR4_Adr
		    UartDIA.Tx_data[0] = EBC1_B3;
		    UartDIA.Tx_data[1] = EBC1_B6;
		    UartDIA.Tx_data[2] = EBC1_B8;
		    UartDIA.Tx_data[3] = EBC1.SA_Adr;
		    UartDIA.Tx_data[4] = CAN_PGN_Find2;
		    UartDIA.Tx_data[5] = Body.PGN_FF23_Ubat;
		    UartDIA.Tx_data[6] = Body.PGN_FF22_Fuel;
		    UartDIA.Tx_data[7] = DSC_Flags5;
	  break;
	  case 18: // CAN_VAR4_Adr+8
		    UartDIA.Tx_data[0] = Body_PGN_FF20_Status1;
		    UartDIA.Tx_data[1] = Body_PGN_FF20_Status2;
		    UartDIA.Tx_data[2] = Body_PGN_FF21_Status1;
		    UartDIA.Tx_data[3] = Body.PGN_FF22_AIR1;
		    UartDIA.Tx_data[4] = Body.PGN_FF22_AIR2;
		    UartDIA.Tx_data[5] = Body.PGN_FF22_Temp;
		    UartDIA.Tx_data[6] = _Hi_16(Body.PGN_FF22_Taxo);
		    UartDIA.Tx_data[7] = _Lo_16(Body.PGN_FF22_Taxo);
	  break;
	  case 19: // CAN_VAR4_Adr+16
		    UartDIA.Tx_data[0] = CAN_Gear_Status;
		    UartDIA.Tx_data[1] = CAN_Engine.Gear.Num;
		    UartDIA.Tx_data[2] = _Hi_16(CAN_Engine.Gear.Out_Taxo);
		    UartDIA.Tx_data[3] = _Lo_16(CAN_Engine.Gear.Out_Taxo);
		    UartDIA.Tx_data[4] = Door_Status;
		    UartDIA.Tx_data[5] = Body.CAN_DC1_SA;
		    UartDIA.Tx_data[6] = Load.Brake.Num;
		    UartDIA.Tx_data[7] = Load.Engine.Num;
	  break;
	  case 20: // VDCTestVAR_Adr
		    UartDIA.Tx_data[0] = _Hi_16(TCO.Rear.Koef);
		    UartDIA.Tx_data[1] = _Lo_16(TCO.Rear.Koef);
		    UartDIA.Tx_data[2] = CCVS.Status.Byte;
		    UartDIA.Tx_data[3] = _Hi_16(Config_Cnt);
		    UartDIA.Tx_data[4] = _Lo_16(Config_Cnt);
		    UartDIA.Tx_data[5] = _Hi_16(Weght.Truck_Rear);
		    UartDIA.Tx_data[6] = _Lo_16(Weght.Truck_Rear);
		    UartDIA.Tx_data[7] = TCO.Gear.Num;
	  break;
	  case 21: // VDCTestVAR_Adr+8
		    UartDIA.Tx_data[0] = Trailer1.EBS25.Press_1L;
		    UartDIA.Tx_data[1] = Trailer1.EBS25.Press_1R;
		    UartDIA.Tx_data[2] = Trailer1.EBS25.Press_2L;
		    UartDIA.Tx_data[3] = Trailer1.EBS25.Press_2R;
		    UartDIA.Tx_data[4] = Trailer1.EBS25.Press_3L;
		    UartDIA.Tx_data[5] = Trailer1.EBS25.Press_3R;
		    UartDIA.Tx_data[6] = Trailer1.EBS25.Status5;
		    UartDIA.Tx_data[7] = EBS25Cnt;
	  break;
	  case 22: // VDCTestVAR_Adr+16
		    UartDIA.Tx_data[0] = _Hi_16(Weght.Train);
		    UartDIA.Tx_data[1] = _Lo_16(Weght.Train);
		    UartDIA.Tx_data[2] = _Hi_16(Brake.Front.Pin);
		    UartDIA.Tx_data[3] = _Hi_16(Brake.Rear.Pin);
		    UartDIA.Tx_data[4] = _Hi_16(Trailer1.EBS21.Speed);
		    UartDIA.Tx_data[5] = _Lo_16(Trailer1.EBS21.Speed);
		    UartDIA.Tx_data[6] = CANT.Mode;//CANT_Mode;
		    UartDIA.Tx_data[7] = _Hi_16(Trailer.Press);
	  break;
	  case 23: // VDCTestVAR_Adr+24 Weght.Truck_Brake
		    UartDIA.Tx_data[0] = _Hi_16(Weght.Truck_Brake);
		    UartDIA.Tx_data[1] = _Lo_16(Weght.Truck_Brake);
		    UartDIA.Tx_data[2] = _B1_32(EBL.REG.Koef);
		    UartDIA.Tx_data[3] = _Hi_16(Weght.Truck_Hitch);
		    UartDIA.Tx_data[4] = _Lo_16(Weght.Truck_Hitch);
		    UartDIA.Tx_data[5] = _Hi_16(Weght.Truck_Engine);
		    UartDIA.Tx_data[6] = _Lo_16(Weght.Truck_Engine);
		    UartDIA.Tx_data[7] = _Hi_16(Load.Koef);
	  break;
	  case 24: // Test_VAR5_Adr
		    UartDIA.Tx_data[0] = _Hi_16(SelfTun.Engine.PeakTorque);
		    UartDIA.Tx_data[1] = _Lo_16(SelfTun.Engine.PeakTorque);
		    UartDIA.Tx_data[2] = SelfTun.Break.K_Pb;
		    // здесь передаются параметры торможения !!!!!!
		    UartDIA.Tx_data[3] = _Lo_16(ABS.Util.Time[0]);  //
		    UartDIA.Tx_data[4] = _Hi_16(ABS.Util.Deccel[0]);//
		    UartDIA.Tx_data[5] = _Lo_16(ABS.Util.Deccel[0]);//
		    UartDIA.Tx_data[6] = _Hi_16(Engine.TorqLoss);
		    UartDIA.Tx_data[7] = _Lo_16(Engine.TorqLoss);
	  break;
	  case 25: // Test_VAR5_Adr+8
		    UartDIA.Tx_data[0] = _Hi_16(ECAS.ASC4.SensPress);
		    UartDIA.Tx_data[1] = _Lo_16(ECAS.ASC4.SensPress);
		    UartDIA.Tx_data[2] = DSC_Flags3; // не менять
		    UartDIA.Tx_data[3] = _Hi_16(Engine.PercentLoss);
		    UartDIA.Tx_data[4] = _Hi_16(SAS.Zero.Angle);
		    UartDIA.Tx_data[5] = _Lo_16(SAS.Zero.Angle);
		    UartDIA.Tx_data[6] = _Hi_16(CAN_Engine.EC1.PeakTorque);
		    UartDIA.Tx_data[7] = _Lo_16(CAN_Engine.EC1.PeakTorque);
	  break;
	  case 26: // Test_VAR5_Adr+16
		    UartDIA.Tx_data[0] = _Hi_16(TCO.Front.Koef);
		    UartDIA.Tx_data[1] = _Lo_16(TCO.Front.Koef);
		    UartDIA.Tx_data[2] = CANS.BPS.PSadr;
		    UartDIA.Tx_data[3] = DSC_Flags1;
		    UartDIA.Tx_data[4] = _Lo_16(ECAS.PS_OffSet);
		    UartDIA.Tx_data[5] = Vehicle.ECU.PO_MC1;
		    UartDIA.Tx_data[6] = Vehicle.ECU.PO_MC2;
		    UartDIA.Tx_data[7] = Vehicle.ECU.Ver_PO; //для всего блока
	  break;
	  case 27: // Test_VAR5_Adr+24
		  	   // VDC Test VAR 8
		    UartDIA.Tx_data[0] = SelfTun.Engine.Loss_K1;
		    UartDIA.Tx_data[1] = SelfTun.Engine.Loss_K2;
		    UartDIA.Tx_data[2] = SelfTun.Engine.PTxx;  // перенесено
		    UartDIA.Tx_data[3] = _Hi_16(TCO.Rear.Koef);
		    UartDIA.Tx_data[4] = _Lo_16(TCO.Rear.Koef);
		    UartDIA.Tx_data[5] = _Hi_16(Pcb_Test_BrPS_Val);
		    UartDIA.Tx_data[6] = Trailer1.EBS21_Status1;//
		    UartDIA.Tx_data[7] = Trailer1.EBS21_Status2;//
	  break;
	  case 28: // Test_VAR5_Adr+32
		    UartDIA.Tx_data[0] = _Hi_16(CANS.AGS.Error);
		    UartDIA.Tx_data[1] = _Lo_16(CANS.AGS.Error);
		    UartDIA.Tx_data[2] = 0; //AGS_CFG1_B0  ?? где взять
		    UartDIA.Tx_data[3] = _Hi_16(CANS.SAS.Error);
		    UartDIA.Tx_data[4] = _Lo_16(CANS.SAS.Error);
		    UartDIA.Tx_data[5] = CANS.AGS.STM_TEMP;
		    UartDIA.Tx_data[6] = CANS.AGS.IAM_TEMP;
		    UartDIA.Tx_data[7] = 0;//   -------- Резерв --------------
	  break;
	  case 29: // Wheel0_Speed
		    UartDIA.Tx_data[0] = _Hi_16(Wheel_FL.Speed);
		    UartDIA.Tx_data[1] = _Lo_16(Wheel_FL.Speed);
		    UartDIA.Tx_data[2] = _Hi_16(Wheel_FR.Speed);
		    UartDIA.Tx_data[3] = _Lo_16(Wheel_FR.Speed);
		    UartDIA.Tx_data[4] = _Hi_16(Wheel_RL.Speed);
		    UartDIA.Tx_data[5] = _Lo_16(Wheel_RL.Speed);
		    UartDIA.Tx_data[6] = _Hi_16(Wheel_RR.Speed);
		    UartDIA.Tx_data[7] = _Lo_16(Wheel_RR.Speed);
	  break;
	  case 30: // W0_Gap_Value
		    UartDIA.Tx_data[0] = (Wheel_FL.Test.Oss.Uamp);
		    UartDIA.Tx_data[1] = (Wheel_FR.Test.Oss.Uamp);
		    UartDIA.Tx_data[2] = (Wheel_RL.Test.Oss.Uamp);
		    UartDIA.Tx_data[3] = (Wheel_RR.Test.Oss.Uamp);
		    UartDIA.Tx_data[4] = (Wheel_FL.Test.Oss.A1_U0);
		    UartDIA.Tx_data[5] = (Wheel_FR.Test.Oss.A1_U0);
		    UartDIA.Tx_data[6] = (Wheel_RL.Test.Oss.A1_U0);
		    UartDIA.Tx_data[7] = (Wheel_RR.Test.Oss.A1_U0);
	  break;
	  case 31: // W0_A2_U0
		    UartDIA.Tx_data[0] = (Wheel_FL.Test.Oss.A2_U0);
		    UartDIA.Tx_data[1] = (Wheel_FR.Test.Oss.A2_U0);
		    UartDIA.Tx_data[2] = (Wheel_RL.Test.Oss.A2_U0);
		    UartDIA.Tx_data[3] = (Wheel_RR.Test.Oss.A2_U0);
		    UartDIA.Tx_data[4] = (Wheel_FL.Test.Oss.WT_MinMax);
		    UartDIA.Tx_data[5] = (Wheel_FR.Test.Oss.WT_MinMax);
		    UartDIA.Tx_data[6] = (Wheel_RL.Test.Oss.WT_MinMax);
		    UartDIA.Tx_data[7] = (Wheel_RR.Test.Oss.WT_MinMax);
	  break;
	  case 32: // AGS_Buf_Adr
		    UartDIA.Tx_data[0] = _Hi_16(Omega_X_sen);
		    UartDIA.Tx_data[1] = _Lo_16(Omega_X_sen);
		    UartDIA.Tx_data[2] = _Hi_16(Omega_Y_sen);
		    UartDIA.Tx_data[3] = _Lo_16(Omega_Y_sen);
		    UartDIA.Tx_data[4] = _Hi_16(Omega_Z_sen);
		    UartDIA.Tx_data[5] = _Lo_16(Omega_Z_sen);
		    UartDIA.Tx_data[6] = _Hi_16(Acc_X_sen);
		    UartDIA.Tx_data[7] = _Lo_16(Acc_X_sen);
	  break;
	  case 33: // AGS_Buf_Adr+8
		    UartDIA.Tx_data[0] = _Hi_16(Acc_Y_sen);
		    UartDIA.Tx_data[1] = _Lo_16(Acc_Y_sen);
		    UartDIA.Tx_data[2] = _Hi_16(Acc_Z_sen);
		    UartDIA.Tx_data[3] = _Lo_16(Acc_Z_sen);
		    UartDIA.Tx_data[4] = _Hi_16(Steer_sen);
		    UartDIA.Tx_data[5] = _Lo_16(Steer_sen);
		    UartDIA.Tx_data[6] = AGS.Calibr.Phase;//AGS.Calibr.Status;
	  break;
	  case 34: // EBS22_Buf_Adr
		    UartDIA.Tx_data[0] = Trailer1.EBS22_Status1;
		    UartDIA.Tx_data[1] = Trailer1.EBS22_Status2;
		    UartDIA.Tx_data[2] = Trailer1.EBS22_Status3;
		    UartDIA.Tx_data[3] = Trailer1.EBS22_Status4;
		    UartDIA.Tx_data[4] = _Hi_16(Trailer1.EBS22.AxleLoadSum);
		    UartDIA.Tx_data[5] = _Lo_16(Trailer1.EBS22.AxleLoadSum);
		    UartDIA.Tx_data[6] = TrailerFind;
		    UartDIA.Tx_data[7] = EBS22Cnt;
	  break;
	  case 35: // CAN_Buff_Adr
		    UartDIA.Tx_data[0] = _Hi_16(Brake.Front.Air);
		    UartDIA.Tx_data[1] = _Hi_16(Brake.Rear.Air);
		    UartDIA.Tx_data[2] = CAN_Engine.Driver + _CAN_int8_Offset; //0x7D
		    UartDIA.Tx_data[3] = CAN_Engine.Torque + _CAN_int8_Offset;
		    UartDIA.Tx_data[4] = CAN_Engine.TaxoN;
		    UartDIA.Tx_data[5] = CAN_Engine.Accelerator;
		    UartDIA.Tx_data[6] = CCVS.Status.Byte;
		    UartDIA.Tx_data[7] = _Hi_16(CCVS.Speed);
	  break;
	  case 36: // TCO_Koef_Adr
		    UartDIA.Tx_data[0] = _Hi_16(TCO.Taxo);
		    UartDIA.Tx_data[1] = _Lo_16(TCO.Taxo);
		    UartDIA.Tx_data[2] = _Hi_16(TCO.Speed);
		    UartDIA.Tx_data[3] = _Lo_16(TCO.Speed);
		    UartDIA.Tx_data[4] = TCO.Status;
		    UartDIA.Tx_data[5] = 0;//CAN_ASC1_Status
		    UartDIA.Tx_data[6] = _Hi_16(CAN_Engine.EC1.RefTorque);
		    UartDIA.Tx_data[7] = _Lo_16(CAN_Engine.EC1.RefTorque);
	  break;
	  case 40: // AdrVarMDT_v8  VarMDT_Ptr=0
		    UartDIA.Tx_data[0] = Wheel_FL.MDT.AV.Oss.On_Val;
		    UartDIA.Tx_data[1] = Wheel_FL.MDT.AV.Oss.Off_Val;
		    UartDIA.Tx_data[2] = Wheel_FL.MDT.EV.Oss.On_Val;
		    UartDIA.Tx_data[3] = Wheel_FL.MDT.EV.Oss.Off_Val;
		    UartDIA.Tx_data[4] = Wheel_FR.MDT.AV.Oss.On_Val;
		    UartDIA.Tx_data[5] = Wheel_FR.MDT.AV.Oss.Off_Val;
		    UartDIA.Tx_data[6] = Wheel_FR.MDT.EV.Oss.On_Val;
		    UartDIA.Tx_data[7] = Wheel_FR.MDT.EV.Oss.Off_Val;
	  break;
	  case 41: // AdrVarMDT_v8  VarMDT_Ptr=1
		    UartDIA.Tx_data[0] = Wheel_RL.MDT.AV.Oss.On_Val;
		    UartDIA.Tx_data[1] = Wheel_RL.MDT.AV.Oss.Off_Val;
		    UartDIA.Tx_data[2] = Wheel_RL.MDT.EV.Oss.On_Val;
		    UartDIA.Tx_data[3] = Wheel_RL.MDT.EV.Oss.Off_Val;
		    UartDIA.Tx_data[4] = Wheel_RR.MDT.AV.Oss.On_Val;
		    UartDIA.Tx_data[5] = Wheel_RR.MDT.AV.Oss.Off_Val;
		    UartDIA.Tx_data[6] = Wheel_RR.MDT.EV.Oss.On_Val;
		    UartDIA.Tx_data[7] = Wheel_RR.MDT.EV.Oss.Off_Val;
	  break;
	  case 42: // AdrVarMDT_v8  VarMDT_Ptr=2
		    UartDIA.Tx_data[0] = LIM.PK.Oss.On_Val;
		    UartDIA.Tx_data[1] = LIM.PK.Oss.Off_Val;
		    UartDIA.Tx_data[2] = BSP75_WL.Oss.On_Val;
		    UartDIA.Tx_data[3] = BSP75_WL.Oss.Off_Val;
		    UartDIA.Tx_data[4] = BSP75_LASR.Oss.On_Val;
		    UartDIA.Tx_data[5] = BSP75_LASR.Oss.Off_Val;
		    UartDIA.Tx_data[6] = BSP75_DBR.Oss.On_Val;
		    UartDIA.Tx_data[7] = BSP75_DBR.Oss.Off_Val;
	  break;
	  case 43: // AdrVarMDT_v8  VarMDT_Ptr=3
		    UartDIA.Tx_data[0] = TrailerDif.Oss.On_Val;
		    UartDIA.Tx_data[1] = TrailerDif.Oss.Off_Val;
		    UartDIA.Tx_data[2] = Power.PWRValue/16;
		    UartDIA.Tx_data[3] = Power.KL15Value/16;
		    UartDIA.Tx_data[4] = FrontDif.Oss.On_Val;
		    UartDIA.Tx_data[5] = FrontDif.Oss.Off_Val;
		    UartDIA.Tx_data[6] = RearDif.Oss.On_Val;
		    UartDIA.Tx_data[7] = RearDif.Oss.Off_Val;
	  break;

	  case 51: // Wheel5_Speed
		    UartDIA.Tx_data[0] = _Hi_16(Wheel_3L.Speed);
		    UartDIA.Tx_data[1] = _Lo_16(Wheel_3L.Speed);
		    UartDIA.Tx_data[2] = _Hi_16(Wheel_3R.Speed);
		    UartDIA.Tx_data[3] = _Lo_16(Wheel_3R.Speed);
		    UartDIA.Tx_data[4] = (Wheel_3L.Test.Oss.Uamp);
		    UartDIA.Tx_data[5] = (Wheel_3R.Test.Oss.Uamp);
	  break;
	  case 52: // Wheel5_Speed+1
		    UartDIA.Tx_data[0] = (Wheel_3L.Test.Oss.A1_U0);
		    UartDIA.Tx_data[1] = (Wheel_3R.Test.Oss.A1_U0);
		    UartDIA.Tx_data[2] = (Wheel_3L.Test.Oss.A2_U0);
		    UartDIA.Tx_data[3] = (Wheel_3R.Test.Oss.A2_U0);
		    UartDIA.Tx_data[4] = (Wheel_3L.Test.Oss.WT_MinMax);
		    UartDIA.Tx_data[5] = (Wheel_3R.Test.Oss.WT_MinMax);
	  break;

     }
   }
   // чтение буфера настроек CFG
   if(DIA.RX.Data[1] & 0x80)
   {
	 DIA.RdCFG_Addr = ((DIA.RX.Data[1] & 0x7F)*256 + DIA.RX.Data[2])/2;
	 for (uint8_t i = 0; i < 4; i++)
	 {  UartDIA.Tx_data[i*2] =   _Hi_16(IEE_DSC_Const[DIA.RdCFG_Addr+i]);
	    UartDIA.Tx_data[i*2+1] = _Lo_16(IEE_DSC_Const[DIA.RdCFG_Addr+i]);
	 }
   }
} // end DIA_Read_RAM()

void     DIA_WrBuf_CFG(void)
{
//	DSC_Const_Buf -Big Indian  HI:LO
//	IEE_DSC_Const смещен на 1байт по сравнению с DumpMOT[]
	DIA.WrCFG_Addr = (DIA.RX.Data[1]*256 + DIA.RX.Data[2])/2;
	for (uint8_t i = 0; i < 4; i++)
	DSC_Const_Buf[i + DIA.WrCFG_Addr] = DIA.RX.Data[i*2+3]*256 +
		 	                            DIA.RX.Data[i*2+4];
    UartDIA.Tx_data[0] = DIA.RX.Command;

} // DIA_WrBuf_CFG()

void     DIA_Write_CFG(void)
{
    if(DIA.RX.Data[1] == 0x55 &&
       DIA.RX.Data[2] == 0x77)
    {
	  DSC_Const_WrIEE_req = 1; // запрос запись CFG
	  WR_CFG_DIA_Ask_Req = 1;  // запрос поступил от DIA
	  AGS.Calibr.Delay = 0; // нужно сбросить счетчик Delay
	  // иначе при сбросе калибровки сразу запускается Write_DSC_Const
    }
} // DIA_Write_CFG()

void     DIA_Read_EPROM(void)
{
	DIA.EPROM.RD_Addr = DIA.RX.Data[1]*256 + DIA.RX.Data[2];
    for (uint8_t i = 0; i < 8; i++)
    { if(DIA.EPROM.RD_Addr <__EPROM_Size)
           UartDIA.Tx_data[i] = EPROM.Data[i+DIA.EPROM.RD_Addr];
      else UartDIA.Tx_data[i] = 0; // незанятые области
    }
}  // end DIA_Read_EPROM();

void     DIA_Write_EPROM(void)
{
	DIA.EPROM.WR_Addr = DIA.RX.Data[1]*256 + DIA.RX.Data[2];
	DIA.EPROM.Data[0] = DIA.RX.Data[3];
	DIA.EPROM.Size = 1;
	Request_WR_DIA = 1; // установка запроса на запись

}  // end DIA_Write_EPROM();

void     DIA_Erase_EPROM(void)
{
	DIA.EPROM.WR_Addr = DIA.RX.Data[1]*256 + DIA.RX.Data[2];
	DIA.EPROM.Size = 8;
    for (uint8_t i = 0; i < DIA.EPROM.Size; i++)
        DIA.EPROM.Data[i] = 0;
	Request_WR_DIA = 1; // установка запроса на запись

}  // end DIA_Erase_EPROM();

void     DIA_Write_RAM(void)
{
	DIA.WrRAM_Sel = DIA.RX.Data[1]*256 + DIA.RX.Data[2];
	switch (DIA.WrRAM_Sel)
    {
	  case 1: // AdrLamp

	  break;
	  case 4: // AdrLamp + 3
		  System_F2 = DIA.RX.Data[3];
		  if(DIA_LampABS_ON)
			   LampABS_ON = 1;
		  else LampABS_ON = 0;
	  break;
	  case 8: // AdrRunaway_0
		  if(TCO.HDRH_Distance)
		  { Dia_RunaWay = 1; // общий флаг
		    Vehicle.RunaWay = TCO.HDRH_Distance;
		  }
	  break;
	  case 37: // Road_Sel_Adr
		  DIA.Oss.Select =  DIA.RX.Data[3]; // селектор сценариев Oss
		  DIA.Oss.Road =  DIA.RX.Data[4]; // изменяемые переменные RoadTest
	  break;
	  case 38: // AdrPWM
		  if(DIA.RX.Data[3] > 2)
		  { Diag.Pdes = DIA.RX.Data[3] * 256;
		    Dia_Prop_Kl = 1;
		  }
		  else
		  { Diag.Pdes = 0;
		    Dia_Prop_Kl = 0;
		  }
	  break;
	  case 39: // AdrTP_Select
		  DIA.TP_Select =  DIA.RX.Data[3];
	  break;
	  case 50: // DiagTest_VAR_Adr_v8
		  Diag.Pdes =  DIA.RX.Data[3] * 256;
	  break;
    }
}  // end DIA_Write_RAM()

void UartDIA_Send(uint8_t Length)
{
    // инициализируем прием второго контроллера
	_Port_Off(MCx_TX);
	UartDIA_Tx_BUSY = 1;
	// запрет приемника
	USART1->CR1 &= ~UART_MODE_RX;
	HAL_UART_Transmit_DMA(&huartKline, UartDIA.Tx_data, Length);

} // end UartDIA_Send()
#endif //__Diag_Kline
//-------------------end UartDIA----------------------------

// Обработка диагностических команд
void Diagnose_Command(void)
{	// ?? если Truck Sim и нет платы почему-то
	// вызывается PulsPress 2R - Command_Diag = 4
	// пока не нашел вводим задержку на прием Command_Dia_DSC
#define __Delay_Diag_DSC       0x0190 //2c
	if(Diag.Delay <__Delay_Diag_DSC)
	   Diag.Delay++;

	if(//ROP_Event || ROP_Engine_Event || ROP_TrailerBreak ||
	   //DYC_Situation || DYC_Engine_Event ||
	   Diag.Delay <__Delay_Diag_DSC ||
	   !Diagnose_Enable)
	{ Diag_Flags = 0;  // регулирование запрет
	  Diag_Flags2 = 0;
	}
	else
	if(Diag.Command)
    { Diag.Last_Command = Diag.Command;
	  switch (Diag.Command)
	  {
		case 1: Dia_Puls_FL = 1;
				break;
		case 2: Dia_Puls_FR = 1;
				break;
		case 3: Dia_Puls_RL = 1;
				break;
		case 4: Dia_Puls_RR = 1;
				break;
		case 7:   //All
			    Dia_Puls_FL = 1;
			    Dia_Puls_FR = 1;
			    Dia_Puls_RL = 1;
			    Dia_Puls_RR = 1;
		    	break;
		case 8:
			    MDT_Stair_Req = 1;
		    	break;
		case 9:
			    Pneum_Req_Fl = 1; // тестирование динамики пневматики
		    	break;
		case 10:
			    BrakePed_Req_Fl = 1;
		    	break;
		case 11:
			    BrakeDif_Req_Fl = 1; // торможение включением Dif.Kl
		    	break;
		case 12:
			    Dia_HillHold = 1;
		    	break;
		case 13:
			    Dia_HaltBrake = 1;
		    	break;
		case 14:
			    Dia_HBR = 1;
		    	break;
		case 17:  //VDC_TestLamp On
			    DIA_VDC_Lamp = 1;
		    	break;
	    case 18:  //VDC_TestLamp Off
		        DIA_VDC_Lamp = 0;
	    	    break;
	    case 19:  //
	    	    Brake_Only_Front = 1;
	    	    break;
	    case 20:  //
	    	    Brake_Only_Rear = 1;
	    	    break;
	    case 21:  //
	    	    Brake_Only_Front = 0;
	    	    Brake_Only_Rear = 0;
	    	    break;
#ifdef   __AxisF_Compile
		case 32:
			    SASzero_Request2 = 1;
		    	break;
		case 33:
			    SASzero_Request = 1;
		    	break;
		case 34:
			    AGSzero_Request = 1;
		    	break;
		case 35:
			    PS_Adr_Request = 1;
		    	break;
	    // case 36: // Com_Calibr_AGS
	    // case 37: // Com_Calibr_SAS
	    // case 38: сброс калибровки
		// case 39: Com_Calibr_ECAS
#endif
		case 41:
			    Dia_TorqueLim = 1;
				break;
		case 42:
			    Dia_TorqueDrag = 1;
				break;
		case 43: // диагностическая установка пробега
			    Dia_RunaWay = 1;
				break;
		case 48: //блокировка ошибок инициализации
			    Block_ErrInst = 1;
		    	break;
		case 49: //сброс самонастроек
			    Reset_SefTuning = 1;
		    	break;
		case 51:
				Dia_Retarder_On = 1;  // задание момента
				break;
		case 52:
			    Dia_Retarder_Off = 1; // ограничение момента
				break;
		case 53:
			    Dia_Stop_Light = 1;
		    	break;
		case 54:
			    Dia_Emergency = 1;
		    	break;

		case 61:
				Dia_DifFront = 1;
				break;
		case 62:
			    Dia_DifRear = 1;
     			break;
		case 63:
     			Dia_DifTrailer = 1;
     			break;
		case 64:
			    Dia_Prop_Kl = 1;
     			break;

		case 15:  // Reset
		case 45:  // сброс Engine
		case 55:  // сброс Retarder
		case 65:
				Diag_Flags = 0;
				Diag_Flags2 = 0;
				Diag_Flags3 = 0; // не было
				Diag.Pdes = 0;
				MDT_Flags2 &= MDT_Off_mask2;
	    	    Brake_Only_Front = 0;
	    	    Brake_Only_Rear = 0;
 			    break;
	  }
      Diag.Command = 0;
	}
} // end Diagnose_Command()

uint8_t   Pcb_Sensor(WheelTypeDef* Wheelx)
{ uint8_t R = 0;

// стенд Экран 86 61
// стенд ABS   86 71
//			  106	77

#define   __SS_A1_U0_Hi  110 //99  // +15%
#define   __SS_A1_U0_Lo  82  //73  // -15%
#define   __SS_A2_U0_Hi  80  //78  // +28% +10%
#define   __SS_A2_U0_Lo  55  // -10% -29%
	//
	if(Wheelx->Test.Oss.A1_U0 < __SS_A1_U0_Hi &&
	   Wheelx->Test.Oss.A1_U0 > __SS_A1_U0_Lo)
		R = 0x01;
	if(Wheelx->Test.Oss.A2_U0 < __SS_A2_U0_Hi &&
	   Wheelx->Test.Oss.A2_U0 > __SS_A2_U0_Lo)
		R |= 0x10;
	return R;
}
uint8_t   Pcb_Sen_Ua(WheelTypeDef* Wheelx)
{ uint8_t R = 0;

// 20
#define   __SS_Uamp_Hi     24//   48  // +20%
#define   __SS_Uamp_Lo     16//   32  // -20%
#define   __SS_WT_MinMax_Hi   20  // +10%

	if(Wheelx->Test.Oss.Uamp < __SS_Uamp_Hi &&
	   Wheelx->Test.Oss.Uamp > __SS_Uamp_Lo)
		R = 0x01;
	if(Wheelx->Test.Oss.WT_MinMax < __SS_WT_MinMax_Hi)
		R |= 0x10;
	return R;
}
uint8_t   Pcb_Mod_AV(WheelTypeDef* Wheelx)
{ uint8_t R = 0;
#ifdef __MDT_ADC_1line
#define   __Mod_AV_On_Hi   85
#define   __Mod_AV_On_Lo   65
#define   __Mod_AV_Off_Hi  7
#else
#define   __Mod_AV_On_Hi   152
#define   __Mod_AV_On_Lo   132
#define   __Mod_AV_Off_Hi   13
#endif

	if(Wheelx->MDT.AV.Oss.On_Val < __Mod_AV_On_Hi &&
	   Wheelx->MDT.AV.Oss.On_Val > __Mod_AV_On_Lo)
		R = 0x01;
	if(Wheelx->MDT.AV.Oss.Off_Val < __Mod_AV_Off_Hi)
		R |= 0x02;
	return R;
}
uint8_t   Pcb_Mod_EV(WheelTypeDef* Wheelx)
{ uint8_t R = 0;
#ifdef __MDT_ADC_1line
#define   __Mod_EV_On_Hi   85
#define   __Mod_EV_On_Lo   65
#define   __Mod_EV_Off_Hi  7
#else
#define   __Mod_EV_On_Hi   152
#define   __Mod_EV_On_Lo   132
#define   __Mod_EV_Off_Hi   13
#endif

	if(Wheelx->MDT.EV.Oss.On_Val < __Mod_EV_On_Hi &&
	   Wheelx->MDT.EV.Oss.On_Val > __Mod_EV_On_Lo)
		R = 0x01;
	if(Wheelx->MDT.EV.Oss.Off_Val < __Mod_EV_Off_Hi)
		R |= 0x02;
	return R;
}
uint8_t   Pcb_Dif(DifTypeDef* Dif)
{ uint8_t R = 0;
#define   __Dif_On_Hi   152
#define   __Dif_On_Lo   132
#define   __Dif_Off_Hi   13

	if(Dif->Oss.On_Val < __Dif_On_Hi &&
	   Dif->Oss.On_Val > __Dif_On_Lo)
		R = 0x01;
	if(Dif->Oss.Off_Val < __Dif_Off_Hi)
		R |= 0x02;
	return R;
}
uint8_t   Pcb_LSSW(LSSwTypeDef* SW)
{ uint8_t R = 0;
#define   __LSSW_Off_Hi   147
#define   __LSSW_Off_Lo   127
#define   __LSSW_On_Hi    13

	if(SW->Oss.Off_Val < __LSSW_Off_Hi &&
	   SW->Oss.Off_Val > __LSSW_Off_Lo &&
	   SW->Oss.On_Val < __LSSW_On_Hi)
		R = 0x01;
	return R;
}
void   Pcb_Test(void)
{
#define   __Ubat_24_5V      2500 // +/-4%
#define   __Ubat_23_5V      2300
#define   __BreakPS_Val_Hi  0xDC00 //220
#define   __BreakPS_Val_Lo  0xAA00  //170

#ifdef   __CAN_Trailer
    if(TrailerFind && // найден CAN прицеп
	   CANT_Ok)
         Pcb_Test_CANT_Ok = 1;
    else Pcb_Test_CANT_Ok = 0;
#endif
#ifdef   __AGS_SAS
    if(!(s_AGS_Error & 0x7F) &&
       !(s_SAS_Error & 0x7F))
         Pcb_Test_CANS_Ok = 1; // исправен CAN датчиков
    else Pcb_Test_CANS_Ok = 0;
#endif

#ifdef   __AxisF_Compile

    if(Power.PWRValue < __Ubat_24_5V &&
       Power.PWRValue > __Ubat_23_5V)
    	 Pcb_Test_PWR_Ok = 1;
    else Pcb_Test_PWR_Ok = 0;
    if(Power.KL15Value < __Ubat_24_5V &&
       Power.KL15Value > __Ubat_23_5V)
    	 Pcb_Test_KL15_Ok = 1;
    else Pcb_Test_KL15_Ok = 0;
    //
    Pcb_Test_SPL_Ok = 1;
    //
    if(!(s_MC1_Error & 0x77) &&
       !(s_MC2_Error & 0x7F)) // без Model_Install_Fail
         Pcb_Test_MC3_Ok = 1; // исправен MC3
    else Pcb_Test_MC3_Ok = 0;

    if(Pcb_Test_BrPS_Val < __BreakPS_Val_Hi &&
       Pcb_Test_BrPS_Val > __BreakPS_Val_Lo)
    	 Pcb_Test_BrPS_Ok = 1;
    else Pcb_Test_BrPS_Ok = 0;
    Pcb_Test_8 &=~0x88;
    Pcb_Test_8 |= (Pcb_Test_8_MC2 & 0x88);
    if(!Trailer_PS_Install)
    Pcb_Test_TrPS_Ok = 1;

    // Pcb_Test_1
    Pcb_Test_1  =  Pcb_Mod_AV(&Wheel_FL);
    Pcb_Test_1 |= (Pcb_Mod_AV(&Wheel_FR))<<2;
    Pcb_Test_1 |= (Pcb_Mod_AV(&Wheel_RL))<<4;
    Pcb_Test_1 |= (Pcb_Mod_AV(&Wheel_RR))<<6;
    // Pcb_Test_2
    Pcb_Test_2  =  Pcb_Mod_EV(&Wheel_FL);
    Pcb_Test_2 |= (Pcb_Mod_EV(&Wheel_FR))<<2;
    Pcb_Test_2 |= (Pcb_Mod_EV(&Wheel_RL))<<4;
    Pcb_Test_2 |= (Pcb_Mod_EV(&Wheel_RR))<<6;
    // Pcb_Test_3
    if(DifT_Install)
    Pcb_Test_3  =  Pcb_Dif(&TrailerDif);
    else Pcb_Test_3  =  0x03;
    Pcb_Test_3 |= (Pcb_Dif(&FrontDif))<<2;
    Pcb_Test_3 |= (Pcb_Dif(&RearDif))<<4;
    if(Prop_Kl_install)
    Pcb_Test_3 |= (Pcb_Test_3_MC2 & 0xC0);
    else Pcb_Test_3 |= 0xC0;
    // Pcb_Test_4
    Pcb_Test_4  = 0x60;
    Pcb_Test_4 |= (Pcb_Test_8 & 0x03); // Power
    if(LSSw_Handling)
    {
    Pcb_Test_4 |= (Pcb_LSSW(&BSP75_WL))<<2;
    Pcb_Test_4 |= (Pcb_LSSW(&BSP75_LASR))<<3;
    Pcb_Test_4 |= (Pcb_LSSW(&BSP75_DBR))<<4;
    }
    else
    Pcb_Test_4 |= 0x1C;

    if(!s_CANJ_Error)
    Pcb_Test_4 |= 0x80;
    // Pcb_Test_5
    Pcb_Test_5  =  Pcb_Sensor(&Wheel_FL);
    Pcb_Test_5 |= (Pcb_Sensor(&Wheel_FR))<<1;
    Pcb_Test_5 |= (Pcb_Sensor(&Wheel_RL))<<2;
    Pcb_Test_5 |= (Pcb_Sensor(&Wheel_RR))<<3;
    // Pcb_Test_6
    Pcb_Test_6 = 0;
    if(ABS_SW_Condition)  Pcb_Test_6 |= 0x01;
    if(ASR_SW_Condition)  Pcb_Test_6 |= 0x02;
    if(TSET_SW_Condition) Pcb_Test_6 |= 0x04;
    if(DIA_SW_Condition)  Pcb_Test_6 |= 0x08;
    for (uint8_t i = 0; i < 4; i++)
    if(Active_Faults[i])  Pcb_Test_6 |= 0x10;
    if(!Pcb_Test_MC3_Ok)  Pcb_Test_6 |= 0x10;
    for (uint8_t i = 10; i < 26; i++)
    if(Active_Faults[i])  Pcb_Test_6 |= 0x10;
    if(!Pcb_Test_CANS_Ok ||
             s_PrS_Error) Pcb_Test_6 |= 0x20;
    // Pcb_Test_7
    Pcb_Test_7 = 0;
    Pcb_Test_7  =  Pcb_Sen_Ua(&Wheel_FL);
    Pcb_Test_7 |= (Pcb_Sen_Ua(&Wheel_FR))<<1;
    Pcb_Test_7 |= (Pcb_Sen_Ua(&Wheel_RL))<<2;
    Pcb_Test_7 |= (Pcb_Sen_Ua(&Wheel_RR))<<3;

#ifdef   __Rectangular_Board  // прямоугольная плата
    Pcb_Test_9 = 255;
#else // квадратная плата
    Pcb_Test_9  =  Pcb_Mod_AV(&Wheel_3L);
    Pcb_Test_9 |= (Pcb_Mod_AV(&Wheel_3R))<<2;
    Pcb_Test_9 |= (Pcb_Mod_EV(&Wheel_3L))<<4;
    Pcb_Test_9 |= (Pcb_Mod_EV(&Wheel_3R))<<6;
#endif
#endif
#ifdef   __AxisR_Compile

    if((uint16_t)TrailerP.Val < __BreakPS_Val_Hi &&
       (uint16_t)TrailerP.Val > __BreakPS_Val_Lo)
    	 Pcb_Test_TrPS_Ok = 1;
    else Pcb_Test_TrPS_Ok = 0;
    if(Prop_Kl_install)
    {
    Pcb_Test_3 = 0;
	if(LIM.PK.Oss.On_Val < __Dif_On_Hi &&
	   LIM.PK.Oss.On_Val > __Dif_On_Lo)
    Pcb_Test_3 |= 0x40;
	if(LIM.PK.Oss.Off_Val < __Dif_Off_Hi)
	Pcb_Test_3 |= 0x80;
    }
    else Pcb_Test_3 = 0xC0;

#endif

} // end Pcb_Test();

//-----------------------------CAN_j1939------------------------------------
#if defined __CAN_j1939

uint8_t  CANJ_Rx_TSC_Checksum(uint8_t Cnt)
{ // вызывается при приеме  TSC1_PGN
// SPN 4206 (R) Message Counter from 0 to 7
// SPN 4207 (R) Message Checksum
	uint8_t CS = 0;
	Cnt &= 0x07;
	for (uint8_t i = 0; i < 6; i++)
    CS += CANJ.Rx.Data[i];
	CS += Cnt & 0x0F;
	CS += _B0_32(CANJ.Rx.ExtID);
	CS += _B1_32(CANJ.Rx.ExtID);
	CS += _B2_32(CANJ.Rx.ExtID);
	CS += _B3_32(CANJ.Rx.ExtID);
	CS = (Cnt & 0x0F) + (((((CS >> 6) + (CS >>3) + CS) & 0x07) << 4) & 0xF0);
	return CS;
}

void CAN_Send_Ask(void)
{
	CANJ.Tx_Message.ExtId = _ExtID_make(PGM_Pri,PGM_PGN4,ECU_SA);
	for (uint8_t i = 0; i < 8; i++)
		CANJ.Tx_Message.Data[i] = CANJ.Rx.Data[i];
  	//  Запрос на передачу
	CANJ_Transmit_Request = 1;
}

void     CANJ_TxD_Buf_0xFF(void)
{ // заполнение буфера передачи 0xFF
	for (uint8_t i = 0; i < 8; i++)
		CANJ.Tx_Message.Data[i] = 0xFF;
}// end CANJ_TxD_Buf_0xFF();

// Address Claim Message
void     CANJ_Send_ACM(void)
{ // Сообщение о требовании адреса
#ifdef   __AxisF_Compile
	CANJ.Tx_Message.ExtId =
			   _ExtID_make(ACM_Pri,ACM_PGN,CANJ.CFG.CAN_Adress);
    for (uint8_t i = 0; i < 8; i++)
		  CANJ.Tx_Message.Data[i] = ACM_Data[i];
	//  Запрос на передачу
    CANJ_Transmit_Cmpl = 1; // нужно т.к. не было передач буфер нулевой и пошлются 0
    CANJ_Transmit_Request = 1;
    ACM_Transmit_Cmpl = 1;
#else
#define  __ACM_Cmpl_Delay 599
	if(CANJ.Delay_1s++ > __ACM_Cmpl_Delay)
	{  CANJ.Delay_1s = 0;
		ACM_Transmit_Cmpl = 1;
	}
#endif
} // end CANJ_Send_ACM();

#ifdef   __AxisF_Compile

//PGN 61449 Vehicle Dynamic Stability Control 2 - VDC2
void     CANJ_Send_VDC2(void)
{ //Transmission Repetition Rate: 10 ms
//1-2 2 bytes Steering Wheel Angle 1807  Resolution:
//3.1 6 bits Steering Wheel Turn Counter 1811
//3.7 2 bits Steering Wheel Angle Sensor Type 1812
//4-5 2 bytes Yaw Rate 1808
//6-7 2 bytes Lateral Acceleration 1809
//8 1 byte Longitudinal Acceleration 1810
	CANJ_TxD_Buf_0xFF();
	if(!CAN_VDC1_Wabco)
         CANJ.Tx_Message.ExtId = _ExtID_make(VDC2_Pri,VDC2_PGN,CANJ.CFG.CAN_Adress);
	else CANJ.Tx_Message.ExtId = _ExtID_make(VDC2_Pri,VDC2_PGN,__CANJ_VDC_WabcoSA);
	int32_t  Tmp;
	AGS_Ok = 1;
	SAS_Ok = 1;
	if(SAS_Ok)
	{	Tmp = Steer_sen +__OffSet16;
		if(Tmp < 0) Tmp = 0;
		else if(Tmp > __Valid16) Tmp = __Valid16;
	}
	else Tmp = __Error16;
	CANJ.Tx_Message.Data[0] = _Lo_16(Tmp); // SPN 1807
    CANJ.Tx_Message.Data[1] = _Hi_16(Tmp);
    CANJ.Tx_Message.Data[2] = __NotDefinedByte; // SPN 1811
	if(AGS_Ok)
	{	Tmp = Omega_Z_sen +__OffSet16;
		if(Tmp < 0) Tmp = 0;
		else if(Tmp > __Valid16) Tmp = __Valid16;
	}
	else Tmp = __Error16;
	CANJ.Tx_Message.Data[3] = _Lo_16(Tmp); // SPN 1808
    CANJ.Tx_Message.Data[4] = _Hi_16(Tmp);
	if(AGS_Ok)
	{	Tmp = Acc_Y_sen +__OffSet16;
		if(Tmp < 0) Tmp = 0;
		else if(Tmp > __Valid16) Tmp = __Valid16;
	}
	else Tmp = __Error16;
	CANJ.Tx_Message.Data[5] = _Lo_16(Tmp); // SPN 1809
    CANJ.Tx_Message.Data[6] = _Hi_16(Tmp);
	if(AGS_Ok)
	{	Tmp = (int32_t)Acc_X_sen*10/2048 +__OffSet8;
		if(Tmp < 0) Tmp = 0;
		else if(Tmp > __Valid8) Tmp = __Valid8;
	}
	else Tmp = __Error8;
	CANJ.Tx_Message.Data[7] = Tmp; // SPN 1810
	//  Запрос на передачу
	CANJ_Transmit_Request = 1;
} // end  CANJ_Send_VDC2()

void     CANJ_Send_TPD(void)
	{
	switch (CANJ.TPD.Phase)
	{
	   case 0:
		   // обработка запросов PGN
		   if(Request_PGN_VIN) CANJ.TPD.Phase = 5; //VIN BAM
		   else
		   if(Request_PGN_ECUID) CANJ.TPD.Phase = 7; //ECUID BAM
		   else
		   if(Request_PGN_DM3) CANJ.TPD.Phase = 9; //DM3 Ack
		   else
		   if(Request_PGN_DM11) CANJ.TPD.Phase = 10; //DM11 Ack
		   else
		   if(Request_PGN_VW)
		   {  CANJ.VW.Num_F = 0;
		      CANJ.VW.Num_R = 0;
			  CANJ.TPD.Phase = 11; // VW
		   }
		   else
		   {
             if(Request_PGN_DM2)
             { DM2_In_Process = 1;
               Disable_TPD = 0;
             }
		     DTC_Check();
		     if(!CANJ.DTC.Qty && !Disable_DM1_Zero)
		    	 CANJ.TPD.Phase = 1; //DM Zero
		     if(CANJ.DTC.Qty == 1 && !Disable_DM1)
		    	CANJ.TPD.Phase = 2; //DM
		     if(CANJ.DTC.Qty > 1 && !Disable_DM1_BAM)
		    	CANJ.TPD.Phase = 3; //DM BAM
		   }
	   break;
	   case 1: //DM1 DM2 Zero
		   if(!DM2_In_Process)
		   { Disable_DM1_Zero = 1;
		     CANJ.Delay_1s = __Delay_1s;
			 CANJ.Tx_Message.ExtId =
			 _ExtID_make(DM1_Pri,DM1_PGN,CANJ.CFG.CAN_Adress);
		   }
		   else
		   { DM2_In_Process = 0;
		     CANJ.Tx_Message.ExtId =
		     _ExtID_make(DM2_Pri,DM2_PGN,CANJ.CFG.CAN_Adress);
		   }

		   for (uint8_t i = 0; i < 4; i++)
		    CANJ.DM_Buff[i] = 0;
		   CANJ_Send_DM();
		   CANJ.TPD.Phase = 0;
	   break;
	   case 2: //DM1 DM2
		   if(!DM2_In_Process)
		   { Disable_DM1 = 1;
		     CANJ.Delay_1s = __Delay_1s;
			 CANJ.Tx_Message.ExtId =
			 _ExtID_make(DM1_Pri,DM1_PGN,CANJ.CFG.CAN_Adress);
		   }
		   else
		   { DM2_In_Process = 0;
		     CANJ.Tx_Message.ExtId =
		     _ExtID_make(DM2_Pri,DM2_PGN,CANJ.CFG.CAN_Adress);
		   }
		   // Byte 3,4,5,6
		   DM_SPN_FMI(CANJ.DTC.Num,CANJ.DTC.Pos);
		   CANJ_Send_DM();
		   CANJ.TPD.Phase = 0;
	   break;
	   case 3: //DM1 DM2 BAM
		   if(!DM2_In_Process)
		   { Disable_DM1_BAM = 1;
		     CANJ.Delay_1s = __Delay_1s;
			 CANJ.TPD.PGN = DM1_PGN;
			 CANJ.TPD.IDpgn = BAM_PGN;
		   }
		   else
		   { DM2_In_Process = 0;
		     CANJ.TPD.PGN = DM2_PGN;
		     CANJ.TPD.IDpgn = (BAM_PGN & 0xFF00) + CANJ.ReqPGN_SA.DM2;
		   }
		   CANJ.TPD.Byte_Count = CANJ.DTC.Qty*4 +2;
		   CANJ_Send_BAM(CANJ.TPD.IDpgn);
		   CANJ.TPD.Phase++;
	   break;
	   case 4: //DM1 DM2 TPD
		   if(!DM2_In_Process)
			    CANJ.TPD.IDpgn = TPD_PGN;
		   else CANJ.TPD.IDpgn = (TPD_PGN & 0xFF00) + CANJ.ReqPGN_SA.DM2;
		   // флаг DM2_In_Process снимется в CANJ_DM_TPD по завершению !!
		   CANJ_DM_TPD(CANJ.TPD.IDpgn);
	   break;

	   case 5: //VIN BAM
		   // переносим VIN данные в буфер
		   for (uint8_t i = 0; i < 9; i++)
		   {  CANJ.DTC.Buff[i*2] =  _Hi_16(IEE_DSC_Const[112+i]);
		      CANJ.DTC.Buff[i*2+1] =_Lo_16(IEE_DSC_Const[112+i]);
		   }
		   // конец  ?
		   for (uint8_t i = 0; i < 4; i++)
		   CANJ.DTC.Buff[i+18] = 0xFF;
           //
		   Request_PGN_VIN = 0;
		   CANJ.TPD.Byte_Count = __VIN_Num_Byte +2;
		   CANJ.TPD.PGN = VIN_PGN;
		   CANJ.TPD.IDpgn = (BAM_PGN & 0xFF00) + CANJ.ReqPGN_SA.VIN;
		   CANJ_Send_BAM(CANJ.TPD.IDpgn);
		   CANJ.TPD.Phase++;
	   break;
	   case 6: //VIN TPD
		   CANJ.TPD.IDpgn = (TPD_PGN & 0xFF00) + CANJ.ReqPGN_SA.VIN;
		   CANJ_Buff_TPD(CANJ.TPD.IDpgn);
	   break;
	   case 7: //ECUID BAM
		   // переносим ECUID данные в буфер
		   // ECU Part Number SPN 2901
		   for (uint8_t i = 0; i < 16; i++)
			   CANJ.DTC.Buff[i+1] = (char)ADUI[i];
		   // ECU Serial Number SPN 2902
		   uint16_t Tmp = Digit_To_ASCII(Vehicle.ECU.SN_M);
		   CANJ.DTC.Buff[17] =  _Hi_16(Tmp);
		   CANJ.DTC.Buff[18] =  _Lo_16(Tmp);
		   Tmp = Digit_To_ASCII(Vehicle.ECU.SN_Y);
		   CANJ.DTC.Buff[19] =  _Hi_16(Tmp);
		   CANJ.DTC.Buff[20] =  _Lo_16(Tmp);
		   Tmp = Digit_To_ASCII(Vehicle.ECU.Lot);
		   CANJ.DTC.Buff[21] =  _Hi_16(Tmp);
		   CANJ.DTC.Buff[22] =  _Lo_16(Tmp);
		   // номер 5 цифр 0...65536
		   // тысячи
		   Tmp =  Digit_To_ASCII((uint32_t)Vehicle.ECU.SNum / 1000);
		   CANJ.DTC.Buff[23] =  _Hi_16(Tmp);
		   CANJ.DTC.Buff[24] =  _Lo_16(Tmp);
		   // сотни 1 знак
		   Tmp =  Digit_To_ASCII((uint32_t)Vehicle.ECU.SNum % 1000 / 100);
		   CANJ.DTC.Buff[25] =  _Lo_16(Tmp);
		   // остаток от сотен 2 знака
		   Tmp =  Digit_To_ASCII((uint32_t)Vehicle.ECU.SNum % 1000 % 100);
		   CANJ.DTC.Buff[26] =  _Hi_16(Tmp);
		   CANJ.DTC.Buff[27] =  _Lo_16(Tmp);
		   CANJ.DTC.Buff[28] =  (char)('*');
		   // ECU Location SPN 2903 ECU Type SPN 2904
		   for (uint8_t i = 0; i < 11; i++)
   			   CANJ.DTC.Buff[i+29] = ECUT[i];
		   // конец  ?
		   for (uint8_t i = 0; i < 3; i++)
		   CANJ.DTC.Buff[i+40] = 0xFF;
		   //
		   Request_PGN_ECUID = 0;
		   CANJ.TPD.Byte_Count = __ECUID_Num_Byte +2;
		   CANJ.TPD.PGN = ECUID_PGN;
		   CANJ.TPD.IDpgn = (BAM_PGN & 0xFF00) + CANJ.ReqPGN_SA.ECUID;
		   CANJ_Send_BAM(CANJ.TPD.IDpgn);
		   CANJ.TPD.Phase++;
	   break;
	   case 8: //ECUID TPD
		   CANJ.TPD.IDpgn = (TPD_PGN & 0xFF00) + CANJ.ReqPGN_SA.ECUID;
		   CANJ_Buff_TPD(CANJ.TPD.IDpgn);
	   break;

	   case 9: //DM3 Ack стирание пассивных ошибок
		   Request_PGN_DM3 = 0;
		   Clear_Passive_Error();
		   Request_WR_DM3 = 1;
		   CANJ.TPD.IDpgn = (ACK_PGN & 0xFF00) + CANJ.ReqPGN_SA.DM3;
		   CANJ_Send_ACK(DM3_PGN, CANJ.ReqPGN_SA.DM3, __Yes_ACK);
	   break;
	   case 10: //DM11 Ack стирание активных ошибок
		   Request_PGN_DM11 = 0;
		   Clear_Active_Error();
		   CANJ.TPD.IDpgn = (ACK_PGN & 0xFF00) + CANJ.ReqPGN_SA.DM11;
		   CANJ_Send_ACK(DM11_PGN, CANJ.ReqPGN_SA.DM11, __Yes_ACK);
	   break;
	   case 11: //VW Vehicle Weight
		   CANJ_Send_VW();
	   break;
	}
} // end  CANJ_Send_TPD()

void     CANJ_Send_VW(void)
{
// SPN 928 Axle Location
// The high order 4 bits represent a position number,
// counting front to back on the vehicle.
// It is recommended add 1 to the position number (range 1 to 15)
#define   __SPN928_OffSet   1
// SPN 582 Resolution: 0.5 kg/bit !! !!(*2)

	CANJ.Tx_Message.ExtId = _ExtID_make(VW_Pri,VW_PGN,CANJ.CFG.CAN_Adress);
	if(CANJ.VW.Num_F < Load.CFG.Truck.Num_FrontAxis)
	{ if(!CANJ.VW.Num_F)
	       CANJ.VW.SPN582 = Load.Truck.Front_Fz*2;
	  else CANJ.VW.SPN582 = Load.Truck.Front2_Fz*2;
	  CANJ.VW.SPN928 = (CANJ.VW.Num_F +__SPN928_OffSet) << 4;
	  CANJ.VW.Num_F++;
	}
	else
	if(CANJ.VW.Num_R < Load.CFG.Truck.Num_RearAxis)
	{ // для балансирной тележки одинаковы
	  // в Load определяется нагрузка всех осей
	  CANJ.VW.SPN582 = Load.Truck.Rear_Fz*2;
	  if(Load.CFG.Truck.Num_RearAxis > 1)
	  CANJ.VW.SPN582 /= Load.CFG.Truck.Num_RearAxis; // 2-пополам
	  CANJ.VW.SPN928 = (CANJ.VW.Num_F + CANJ.VW.Num_R +__SPN928_OffSet)<< 4;
	  if(CANJ.VW.Num_F++ == Load.CFG.Truck.Num_RearAxis)
	  {  CANJ.TPD.Phase = 0;
		 Request_PGN_VW = 0;
	  }
	}
	CANJ.Tx_Message.Data[0] = CANJ.VW.SPN928;  // SPN 928
    CANJ.Tx_Message.Data[1] = _Lo_16(CANJ.VW.SPN582);
    CANJ.Tx_Message.Data[2] = _Hi_16(CANJ.VW.SPN582);
    // SPN 180 Resolution: 2 kg/bit  !!(/2)
    CANJ.Tx_Message.Data[3] = _Lo_16(Load.Trailer.Mass/2); // SPN 180
    CANJ.Tx_Message.Data[4] = _Hi_16(Load.Trailer.Mass/2);
    // Cargo Weight SPN 181 Resolution: 2 kg/bit,
    // Масса перевезенного груза.
    CANJ.Tx_Message.Data[5] = _Lo_16(Load.Trailer.Cargo/2); // SPN 181
    CANJ.Tx_Message.Data[6] = _Hi_16(Load.Trailer.Cargo/2);
	CANJ.Tx_Message.Data[7] = __NotDefinedByte;
	//  Запрос на передачу
	CANJ_Transmit_Request = 1;
} // end CANJ_Send_VW()

void     DM_SPN_FMI(uint8_t NE, uint8_t NB)
{
//	a. Suspect Parameter Number (SPN) 19 bits
//	b. Failure Mode Identifier  (FMI) 5 bits
//	c. Occurrence Count      (OC) 7 bits
//	d. SPN Conversion Method (CM) 1 bit  SPN1706
	uint16_t SPN = DM_SPN_Tab[NE];
	uint8_t FMI = *(uint8_t*)(*(uint32_t*)(&FMI_Tab[NE])+NB);
	uint8_t Cnt = EPROM.Data[__EPROM_Adr_CntErr + NE*8 +NB];
	if(Cnt > 127) // старший бит CM = 0
	   Cnt = 127;
	CANJ.DM_Buff[0] =  _Lo_16(SPN);
	CANJ.DM_Buff[1] =  _Hi_16(SPN);
	CANJ.DM_Buff[2] =  FMI*8; // занимает 5 старших бит
	CANJ.DM_Buff[3] =  Cnt;
} // end DM_SPN_FMI();

#define   __CANJ_DM_Lamp  195 //   ;? W-11000011 K-00000000
//bits 8-7 Malfunction Indicator Lamp SPN 1213
//bits 6-5 Red Stop Lamp  SPN 623
//bits 2-1 Protect Lamp  SPN 987

void     CANJ_Send_DM(void)
{
	CANJ_TxD_Buf_0xFF();
	// Byte 1
	CANJ.Tx_Message.Data[0] = __CANJ_DM_Lamp;
	if(LampABS_ON) CANJ.Tx_Message.Data[0] |= __Bit34; // Amber Warning Lamp SPN 624
	// Byte 2 Reserved for SAE assignment Lamp Status
	// Byte 3,4,5,6
    for (uint8_t i = 0; i < 4; i++)
    CANJ.Tx_Message.Data[i+2] = CANJ.DM_Buff[i];
	//  Запрос на передачу
	CANJ_Transmit_Request = 1;
} // end CANJ_Send_DM()

// проверка наличия активных немсправностей
void     DTC_Check(void)
{	// DTC Diagnostic Trouble Code
	// Диагностический код неисправности
	CANJ.DTC.Qty = 0;
	for (uint8_t i = 0; i < __Errors_Num; i++)
	{
		CANJ.DTC.Buff[i] =  Active_Faults[i];
		if(DM2_In_Process)
		  CANJ.DTC.Buff[i] ^= Passive_Faults[i]; //XOR
		if(CANJ.DTC.Buff[i] != 0)
		{ // есть  DTC
		  CANJ.DTC.Num = i;  // номер DTC
		  uint8_t E = CANJ.DTC.Buff[i];
		  uint8_t M = 0x01;
		  for (uint8_t k = 0; k < 8; k++)
		  { if((E & (M << k)) !=0)
		    { CANJ.DTC.Qty++;   // количество DTC
		      CANJ.DTC.Pos = k; // позиция
		    }
		  }
		}
	}
	CANJ.DTC.Lamp = __CANJ_DM_Lamp;
	if(LampABS_ON) CANJ.DTC.Lamp |= __Bit34; // Amber Warning Lamp SPN 624
} // end  DTC_Check()

void     DTC_SPN_FMI(void)
{
	for (uint8_t i = 0; i < __Errors_Num; i++)
	{ if(CANJ.DTC.Buff[i] != 0)
	  { // есть  DTC
	    CANJ.DTC.Num = i;  // номер DTC
		for (uint8_t k = 0; k < 8; k++)
		{ uint8_t M = 0x01 << k; // маска
		  if((CANJ.DTC.Buff[i] & M) !=0)
		  { // есть позиция
		    CANJ.DTC.Pos = k; // позиция
		    CANJ.DTC.Buff[i] &=~M; //гасим ошибку в буфере
		    DM_SPN_FMI(CANJ.DTC.Num,CANJ.DTC.Pos);
		    goto Exit;
		  }
		}
	  }
	  else
	  { for (uint8_t i = 0; i < 4; i++)
	    CANJ.DM_Buff[i] = 0xFF;
	  }
	}
	Exit: ; // метка выхода
} // end DTC_SPN_FMI()

void     CANJ_Send_BAM(uint16_t IDpgn)
{
	CANJ.Tx_Message.ExtId = _ExtID_make(BAM_Pri,IDpgn,CANJ.CFG.CAN_Adress);
	CANJ.Tx_Message.Data[0] = __BAM_Head;
	CANJ.Tx_Message.Data[1] = CANJ.TPD.Byte_Count; // количество байт
	CANJ.Tx_Message.Data[2] = 0;
	CANJ.TPD.Sum_Pack = (uint32_t)CANJ.TPD.Byte_Count / 7;
	if(((uint32_t)CANJ.TPD.Byte_Count % 7))
		CANJ.TPD.Sum_Pack++;
	CANJ.Tx_Message.Data[3] = CANJ.TPD.Sum_Pack; // количество Пакетов
	CANJ.Tx_Message.Data[4] = __NotDefinedByte;
	CANJ.Tx_Message.Data[5] = _Lo_16(CANJ.TPD.PGN);
	CANJ.Tx_Message.Data[6] = _Hi_16(CANJ.TPD.PGN);
	CANJ.Tx_Message.Data[7] = 0;
	CANJ.TPD.Num_Pack = 1;  // номер пакета
	//  Запрос на передачу
	CANJ_Transmit_Request = 1;
} // end  CANJ_Send_BAM()

void     CANJ_DM_TPD(uint16_t IDpgn)
{ // транспорт DM1 DM2
	CANJ.Tx_Message.ExtId = _ExtID_make(TPD_Pri,IDpgn,CANJ.CFG.CAN_Adress);
	CANJ_TxD_Buf_0xFF();
	CANJ.Tx_Message.Data[0] = CANJ.TPD.Num_Pack;
  if(CANJ.TPD.Num_Pack < CANJ.TPD.Sum_Pack+1)
  {
	if(CANJ.TPD.Num_Pack == 1)
	{ CANJ.Tx_Message.Data[1] = CANJ.DTC.Lamp;
	  CANJ.Tx_Message.Data[2] = __NotDefinedByte;
	  DTC_SPN_FMI();
	  for (uint8_t i = 0; i < 4; i++)
	  CANJ.Tx_Message.Data[i+3] = CANJ.DM_Buff[i];
	  DTC_SPN_FMI();
	  CANJ.Tx_Message.Data[7] = CANJ.DM_Buff[0];
	}
	else
	{if((CANJ.TPD.Num_Pack & 0x03) == 2)
	{ for (uint8_t i = 0; i < 3; i++)
	  CANJ.Tx_Message.Data[i+1] = CANJ.DM_Buff[i+1];
	  DTC_SPN_FMI();
	  for (uint8_t i = 0; i < 4; i++)
	  CANJ.Tx_Message.Data[i+4] = CANJ.DM_Buff[i];
	}
	else
	if((CANJ.TPD.Num_Pack & 0x03) == 3)
	{ DTC_SPN_FMI();
	  for (uint8_t i = 0; i < 4; i++)
	  CANJ.Tx_Message.Data[i+1] = CANJ.DM_Buff[i];
	  DTC_SPN_FMI();
	  for (uint8_t i = 0; i < 3; i++)
	  CANJ.Tx_Message.Data[i+5] = CANJ.DM_Buff[i];
	}
	else
	if((CANJ.TPD.Num_Pack & 0x03) == 0)
	{ CANJ.Tx_Message.Data[1] = CANJ.DM_Buff[3];
	  DTC_SPN_FMI();
	  for (uint8_t i = 0; i < 4; i++)
	  CANJ.Tx_Message.Data[i+2] = CANJ.DM_Buff[i];
	  DTC_SPN_FMI();
	  CANJ.Tx_Message.Data[6] = CANJ.DM_Buff[0];
	  CANJ.Tx_Message.Data[7] = CANJ.DM_Buff[1];
	}
	else
	if((CANJ.TPD.Num_Pack & 0x03) == 1)
	{ CANJ.Tx_Message.Data[1] = CANJ.DM_Buff[2];
	  CANJ.Tx_Message.Data[2] = CANJ.DM_Buff[3];
	  DTC_SPN_FMI();
	  for (uint8_t i = 0; i < 4; i++)
	  CANJ.Tx_Message.Data[i+3] = CANJ.DM_Buff[i];
	  DTC_SPN_FMI();
	  CANJ.Tx_Message.Data[7] = CANJ.DM_Buff[0];
    }
	}
	CANJ.TPD.Num_Pack++;
	//  Запрос на передачу
	CANJ_Transmit_Request = 1;
  }
  else
  { // все передано
	   CANJ.TPD.Phase = 0;
	   DM2_In_Process = 0;
  }
} // end  CANJ_DM_TPD()

void     CANJ_Buff_TPD(uint16_t IDpgn)
{ // транспорт DM1 DM2
	CANJ.Tx_Message.ExtId = _ExtID_make(TPD_Pri,IDpgn,CANJ.CFG.CAN_Adress);
	CANJ_TxD_Buf_0xFF();
	CANJ.Tx_Message.Data[0] = CANJ.TPD.Num_Pack;
	if(CANJ.TPD.Num_Pack < CANJ.TPD.Sum_Pack+1)
	{
	  for (uint8_t i = 0; i < 7; i++)
	  CANJ.Tx_Message.Data[i+1]=  CANJ.DTC.Buff[i+1+(CANJ.TPD.Num_Pack-1)*7];
	  CANJ.TPD.Num_Pack++;
	  //  Запрос на передачу
	  CANJ_Transmit_Request = 1;
	}
	else
	{ // все передано
	  CANJ.TPD.Phase = 0;
	}
} // end  CANJ_Buff_TPD()

#define __ASCII_0  48
// перевод чисел 0...99 в два символа ASCII
uint16_t Digit_To_ASCII(uint16_t  Dig)
{
	uint16_t D;
	if(Dig < 10)
		 D = __ASCII_0*256 + (__ASCII_0+ Dig);
	else D = (Dig/10+__ASCII_0)*256 + (Dig%10+__ASCII_0);
	return D;
}

void     CANJ_Send_ACK(uint16_t PGN, uint8_t SA, uint8_t ACK)
{ //ACKnowledge  - подтверждать
	CANJ.Tx_Message.ExtId = _ExtID_make(TPD_Pri,CANJ.TPD.IDpgn,CANJ.CFG.CAN_Adress);
	CANJ_TxD_Buf_0xFF();
	CANJ.Tx_Message.Data[0] = ACK; // 0-Yes_ACK  1-Yes_NACK
	CANJ.Tx_Message.Data[4] = SA;  // Адрес источника запроса
	CANJ.Tx_Message.Data[5] = _Lo_16(PGN); // запрошенный PGN
	CANJ.Tx_Message.Data[6] = _Hi_16(PGN);
	CANJ.Tx_Message.Data[7] = 0;
	//  Запрос на передачу
	CANJ_Transmit_Request = 1;
	CANJ.TPD.Phase = 0;
} // end CANJ_Send_ASK()

//PGN 61441 Electronic Brake Controller 1 EBC1
void     CANJ_Send_EBC1(void)
{
	CANJ.Tx_Message.ExtId = _ExtID_make(EBC1_Pri,EBC1_PGN,CANJ.CFG.CAN_Adress);
	CANJ_TxD_Buf_0xFF();
	// Byte 1
	CANJ.Tx_Message.Data[0] =__NotDefinedBit78; // EBS Brake Switch  //SPN 1121
	if(ASR_EngineActive) CANJ.Tx_Message.Data[0] |= __Bit12; //SPN 561
	if(ASR_Brake_Active)    CANJ.Tx_Message.Data[0] |= __Bit34; //SPN 562
	if(ABS_Active) CANJ.Tx_Message.Data[0] |= __Bit56; //SPN 563
	// Byte 2
    //SPN 521 Brake Pedal Position
	if(EBC1_SPN521_Enable)
	{ CANJ.Tx_Message.Data[1] = Brake.DemandValue / 128;
	  if(CANJ.Tx_Message.Data[1] > __Valid8)
		 CANJ.Tx_Message.Data[1] = __Valid8;
	}
	// Byte 3
	CANJ.Tx_Message.Data[2] = 0;
	if(ABS_SW_Condition) CANJ.Tx_Message.Data[2] |= __Bit12; //SPN 575 ABS Off-road Switch
	if(DIA_LampASR_ON) CANJ.Tx_Message.Data[2] |= __Bit34; //SPN 576 ASR Off-road Switch
	if(TSET_HHR_Sw_Enable)
	{ if(TSET_SW_Condition)
		 CANJ.Tx_Message.Data[2] |= __Bit56; //SPN 577 ASR "Hill Holder" Switch
	}
	else CANJ.Tx_Message.Data[2] |= __NotDefinedBit56;
	if(ASR_SW_Condition) CANJ.Tx_Message.Data[2] |= __Bit78; //SPN 1238 Traction Control Override Switch
	// Byte 6
	CANJ.Tx_Message.Data[5] = __NotDefinedBit34; // EBS Red Warning Signal SPN1439
	if(!ABS_Fail)  CANJ.Tx_Message.Data[5] |= __Bit12; // ABS Fully Operational SPN1243
	if(LampABS_ON) CANJ.Tx_Message.Data[5] |= __Bit56; // ABS/EBS Amber Warning Signal SPN1438
	if(LampASR_ON) CANJ.Tx_Message.Data[5] |= __Bit78; // ATC/ASR Information Signal SPN1793
	// Byte 7
	CANJ.Tx_Message.Data[6] = CANJ.CFG.CAN_Adress; // Source Address of Controlling Device for
	                                       // Brake Control SPN1481
	// Byte 8
	CANJ.Tx_Message.Data[7] = __NotDefinedBit12;
	if(Halt_Brake_Enable &&
	   HaltBrake_Switch)
		 CANJ.Tx_Message.Data[7] |= __Bit34; //Halt brake switch SPN2911
	else CANJ.Tx_Message.Data[7] |= __NotDefinedBit34 ;//0x0F;
	if(Trailer_StatusOk)
	{ if(Trailer_ABS_Active) CANJ.Tx_Message.Data[7] |= __Bit56; //Trailer ABS Status SPN1836
	  if(Trailer_RedWarn) CANJ.Tx_Message.Data[7] |= __Bit78; //Trailer ABS Warning Signal SPN1792
	}
	else CANJ.Tx_Message.Data[7]= __NotDefinedBit56 | __NotDefinedBit78;
	//  Запрос на передачу
	CANJ_Transmit_Request = 1;
} // end CANJ_Send_EBC1();

#else

uint8_t  WSI_Relative_Speed(WheelTypeDef* WheelXX)
{// Resolution:1/16 km/h per bit
 // -7.8125 km/h offset
	if(!WheelXX->Sen_Err0.Byte &&
	   !WheelXX->Sen_Err1.Byte)
	{
	  int16_t dSp = ((int32_t)WheelXX->Speed -
			         (int32_t)Speed_FrontAxel) /16 +__OffSet8;
	  if(dSp < 0)
	     dSp = 0;
	  else
	  if(dSp > __Valid8)
	     dSp = __Valid8;
	  return dSp;
	}
	else return __NotDefinedByte;
} // WSI_Relative_Speed();

void     CANJ_Send_EBC2(void)
{
	CANJ.Tx_Message.ExtId = _ExtID_make(EBC2_Pri,EBC2_PGN,CANJ.CFG.CAN_Adress);
	CANJ.EBC2_FrontSpeed = Speed_FrontAxel; // определена в SignalValidity()
	//Front Axle Speed SPN 904
	CANJ.Tx_Message.Data[0] =  _Lo_16(Speed_FrontAxel);
	CANJ.Tx_Message.Data[1] =  _Hi_16(Speed_FrontAxel);
	//Relative Speed; Front Axle, Left Wheel SPN 905
	CANJ.Tx_Message.Data[2] = WSI_Relative_Speed(&Wheel_FL);
	//Relative Speed; Front Axle, Right Wheel SPN 906
	CANJ.Tx_Message.Data[3] = WSI_Relative_Speed(&Wheel_FR);
	//Relative Speed; Rear Axle #1,, Left Wheel SPN 907
	CANJ.Tx_Message.Data[4] = WSI_Relative_Speed(&Wheel_RL);
	//Relative Speed; Rear Axle #1,, Right Wheel SPN 908
	CANJ.Tx_Message.Data[5] = WSI_Relative_Speed(&Wheel_RR);
	CANJ.Tx_Message.Data[6] = __NotDefinedByte;
    CANJ.Tx_Message.Data[7] = __NotDefinedByte;
	//  Запрос на передачу
	CANJ_Transmit_Request = 1;
} // end CANJ_Send_EBC2();


// PGN 256 (R) Transmission Control 1 - TC1
void     CANJ_Send_TC1(void)
{
// SPN 681 Transmission Gear Shift Inhibit Request
// SPN 682 Transmission Torque Converter Lockup Disable Request
// SPN 682 Disengage Driveline Request
// SPN 685 Disengage Differential Lock Request - Front Axle 1
// SPN 689 Disengage Differential Lock Request - Central
	if(GearBox_AutoMatic)
	{ CANJ_TxD_Buf_0xFF();
	  CANJ.Tx_Message.ExtId = _ExtID_make(TC1_Pri,TC1_PGN,CANJ.CFG.CAN_Adress);
	  CANJ.Tx_Message.Data[0] = __NotDefinedBit78;
	  CANJ.Tx_Message.Data[3] =  0;
	  CANJ.Tx_Message.Data[4] = __NotDefinedBit78;
	  if(ABS_Active)
	  { CANJ.Tx_Message.Data[0] |= (__Bit34 | // SPN 682 отключение блокировки гидротрансформатора
			                        __Bit56); // SPN 683 отключение привод
		CANJ.Tx_Message.Data[3] = (__Bit12 |  // SPN 685 отключение блокировки дифференциала ось 1
				                   __Bit34 |  // SPN 686 передняя ось 2
				                   __Bit56 |  // SPN 687 Задний мост 1
			                       __Bit78);  // SPN 688 Задний мост 2
		CANJ.Tx_Message.Data[4] |= (__Bit12 | // SPN 689 дифференциал раздатки
				                    __Bit34 | // SPN 690 межосевой передний
				                    __Bit56); // SPN 691 межосевой задний
	  }
	  if(ASR_Brake_Active)
		CANJ.Tx_Message.Data[0] |= __Bit12; //SPN 681 Блокировка переключения передач
	  //  Запрос на передачу
	  CANJ_Transmit_Request = 1;
	}
} // end CANJ_Send_TC1()

//PGN 64964 Electronic Brake Controller 5 - EBC5
void     CANJ_Send_EBC5(void)
{
	CANJ_TxD_Buf_0xFF();
	CANJ.Tx_Message.ExtId = _ExtID_make(EBC5_Pri,EBC5_PGN,CANJ.CFG.CAN_Adress);
    CANJ.Tx_Message.Data[0] = EBC5_Status1; // Halt brake Hill holder
    CANJ.Tx_Message.Data[1] = EBC5_Status2; //  XBR System
    CANJ.Tx_Message.Data[2] = EBC5.XBR_AccLim;
    CANJ.Tx_Message.Data[3] = EBC5_Status3;
	//  Запрос на передачу
	CANJ_Transmit_Request = 1;
} // end CANJ_Send_EBC5()

//PGN 65103 Vehicle Dynamic Stability Control 1 - VDC1
void     CANJ_Send_VDC1(void)
{
// VDC Information Signal 1813
// VDC Fully Operational 1814
// VDC brake light request 1815
// ROP Engine Control active 1816
// ROP Brake Control active 1818
// YC Engine Control active 1817
// YC Brake Control active 1819
	CANJ_TxD_Buf_0xFF();
	if(!CAN_VDC1_Wabco)
         CANJ.Tx_Message.ExtId = _ExtID_make(VDC1_Pri,VDC1_PGN,CANJ.CFG.CAN_Adress);
	else CANJ.Tx_Message.ExtId = _ExtID_make(VDC1_Pri,VDC1_PGN,__CANJ_VDC_WabcoSA);
    CANJ.Tx_Message.Data[0] = __NotDefinedBit78;
    if(VDC_LampOn) CANJ.Tx_Message.Data[0] |=__Bit12;// SPN 1813
    if(VDC_FullOp) CANJ.Tx_Message.Data[0] |=__Bit34;// SPN 1814
    if(ROP_BrakeActive ||
       DYC_BrakeActive ||
	   Stop_Request) // TrailerStatus Bit7
    	CANJ.Tx_Message.Data[0] |=__Bit56;// SPN 1815

    CANJ.Tx_Message.Data[1] = 0;
 //   Состояние «Активно» означает, что ROP фактически
 //   регулирует давление в тормозных системах транспортного средства
 //   или автопоезда
 //  для прицепа CANT не имеет признака ROP только VDC_Active !!
    // поэтому берем только тягач без прицепа
    if(ROP_Active)
    { if(ROP_EngineActive) CANJ.Tx_Message.Data[1] |=__Bit12;// SPN 1816
      if(ROP_BrakeActive)  CANJ.Tx_Message.Data[1] |=__Bit34;// SPN 1818
    }
    else
    if(DYC_Active)
    { if(DYC_EngineActive) CANJ.Tx_Message.Data[1] |=__Bit56;// SPN 1817
      if(DYC_BrakeActive)  CANJ.Tx_Message.Data[1] |=__Bit78;// SPN 1819
    }
	//  Запрос на передачу
	CANJ_Transmit_Request = 1;
} // end CANJ_Send_VDC1()

// PGN 65134 High Resolution Wheel Speed - HRW
void     CANJ_Send_HRW(void)
{
	CANJ.Tx_Message.ExtId = _ExtID_make(HRW_Pri,HRW_PGN,CANJ.CFG.CAN_Adress);
	CANJ.Tx_Message.Data[0] = _Lo_16(Wheel_FL.Speed); // SPN 1592
    CANJ.Tx_Message.Data[1] = _Hi_16(Wheel_FL.Speed);
	CANJ.Tx_Message.Data[2] = _Lo_16(Wheel_FR.Speed); // SPN 1593
    CANJ.Tx_Message.Data[3] = _Hi_16(Wheel_FR.Speed);
	CANJ.Tx_Message.Data[4] = _Lo_16(Wheel_RL.Speed); // SPN 1594
    CANJ.Tx_Message.Data[5] = _Hi_16(Wheel_RL.Speed);
	CANJ.Tx_Message.Data[6] = _Lo_16(Wheel_RR.Speed); // SPN 1595
    CANJ.Tx_Message.Data[7] = _Hi_16(Wheel_RR.Speed);
	//  Запрос на передачу
	CANJ_Transmit_Request = 1;
} // end CANJ_Send_HRW()

//PGN 65112 Air Suspension Control 4 - ASC4
void     CANJ_Send_ASC4(void)
{
// Bellow Pressure Front Axle Left 1725
// Bellow Pressure Front Axle Right 1726
// Bellow Pressure Rear Axle Left 1727
// Bellow Pressure Rear Axle Right 1728
	// Resolution: 0.1 kPa/bit
	if(!Find_ASC4 &&
	   ECAS_PS_Install)
	{
	   CANJ_TxD_Buf_0xFF();
	   CANJ.Tx_Message.ExtId = _ExtID_make(ASC4_Pri,ASC4_PGN,CANJ.CFG.CAN_Adress);
	   uint32_t  Tmp = (uint32_t)ECAS.ASC4.SensPress*50/256;
	   if(Tmp > __Valid16) Tmp = __Valid16;
	   CANJ.Tx_Message.Data[4] = _Lo_16(Tmp); // SPN 1727
	   CANJ.Tx_Message.Data[5] = _Hi_16(Tmp);
	   CANJ.Tx_Message.Data[6] = _Lo_16(Tmp); // SPN 1728
	   CANJ.Tx_Message.Data[7] = _Hi_16(Tmp);
	   //  Запрос на передачу
	   CANJ_Transmit_Request = 1;
	}
} // end  CANJ_Send_ASC4()

uint8_t  CANJ_TSC_Checksum(CanTxMsgTypeDef*  Message, uint8_t Cnt)
{ // вызывается при передаче TSC1_PGN
// SPN 4206 (R) Message Counter from 0 to 7
// SPN 4207 (R) Message Checksum
	uint8_t CS = 0;
	Cnt &= 0x07;
	for (uint8_t i = 0; i < 6; i++)
		CS += Message->Data[i];
	CS += Cnt & 0x0F;
	CS += _B0_32(Message->ExtId);
	CS += _B1_32(Message->ExtId);
	CS += _B2_32(Message->ExtId);
	CS += _B3_32(Message->ExtId);
	CS = (Cnt & 0x0F) + (((((CS >> 6) + (CS >>3) + CS) & 0x07) << 4) & 0xF0);
	return CS;
} // end  CANJ_TSC_Checksum()

void     CANJ_Send_TSC1_Engine(void)
{
	CANJ_TxD_Buf_0xFF();
	CANJ.Tx_Message.ExtId =
	_ExtID_make(TSC1_Pri,TSC1_PGN,CANJ.CFG.CAN_Adress);

	if(Torque_Drag)  // увеличение момента
	{ CANJ.Tx_Message.Data[0] = __TSC_AE_Prior1 |    // Torque Control
				               (TSCAE_Prior1 & 0xF0);
	  TSC1_AE_100ms_Repeat = 0;
	}
	else
	if(Torque_Lim) // ограничение момента или оборотов
	{ CANJ.Tx_Message.Data[0] = __TSC_AE_Prior2 |    // Speed/Torque Limit
			                   (TSCAE_Prior1 & 0xF0);
	  TSC1_AE_100ms_Repeat = 0;
	}
	else // Null
	{ CANJ.Tx_Message.Data[0] = __TSC_AE_Prior3;
	  TSC1_AE_100ms_Repeat = 1;
	}
	CANJ.Tx_Message.Data[2] = _Lo_16(EngineTorque.TSC_Taxo);
	CANJ.Tx_Message.Data[2] = _Hi_16(EngineTorque.TSC_Taxo);
	// ???? EngineTorque.Value 0...125;
	if(!ASR_EngineActive || !ASR_Two_Engine)
	CANJ.Tx_Message.Data[3] = EngineTorque.Value + __OffSet8;
	else
	{
	if(TSC1_EM12_Fl)
	{  TSC1_EM12_Fl = 0;
	   CANJ.Tx_Message.Data[3] = ASR.Engine.Torq_EM1 + __OffSet8;
	}
	else
	{  TSC1_EM12_Fl = 1;
	   CANJ.Tx_Message.Data[3] = ASR.Engine.Torq_EM2 + __OffSet8;
	}
	}

	CANJ.TSC.AE_Message_Cnt++;
	CANJ.Tx_Message.Data[7] = CANJ_TSC_Checksum(&CANJ.Tx_Message,
			                                     CANJ.TSC.AE_Message_Cnt);
	//  Запрос на передачу
	CANJ_Transmit_Request = 1;
} // end CANJ_Send_TSC1_Engine()

//PGN 0 (R) Torque/Speed Control 1 - TSC1
void     CANJ_Send_TSC1_Retarder(void)
{ //Transmission Repetition Rate: 50 ms
// 5.1 3 bits TSC1 Transmission Rate SPN 3349
// Transmission Rate parameter	is not applicable for retarders.
	uint16_t PGN = TSC1_PGN;
	uint8_t Cnt = 0x07;
	CANJ_TxD_Buf_0xFF();
	switch (CANJ.TSC.Retarder_Sel)
	{ // передаются всегда
	  case 0: PGN |=__DA_ERC1_RD;  // DA ретардер трансмиссия
	          Cnt = CANJ.TSC.ARD_Message_Cnt++;
	  break;
	  case 1: PGN |=__DA_ERC1_RE;  // DA ретардер двигателя
	          Cnt = CANJ.TSC.ARE_Message_Cnt++;
	  break;
	  // передаются если найдены в CAN
	  case 2:
		  if(Find_ERC1_RG)
		  {	  PGN |=__DA_ERC1_RG; // DA ретардер коробки передач
		      Cnt = CANJ.TSC.ARG_Message_Cnt++;
		  }
	  break;
	  case 3:
		  if(Find_ERC1_REX)
		  {	  PGN |=__DA_ERC1_REX; // DA ретардер горный тормоз
		      Cnt = CANJ.TSC.AE_Message_Cnt++;
		  }
	  break;
	}
	if(PGN != TSC1_PGN)
	{ // есть в PGN адрес ретардера DA
	  CANJ.Tx_Message.ExtId = _ExtID_make(TSC1_Pri,PGN,CANJ.CFG.CAN_Adress);
	  if(Retarder_Off) // замедлитель выключается
	  { CANJ.Tx_Message.Data[0] = __TSC_AR_Prior1 |    // ограничение момента
			                   (TSCAE_Prior1 & 0xF0);
	  }
	  else
	  if(Retarder_Brake) // замедлитель тормозит с заданным моментом
	  { CANJ.Tx_Message.Data[0] = __TSC_AR_Prior2 |    // задание момента
			                   (TSCAE_Prior1 & 0xF0);
	  }
	  else CANJ.Tx_Message.Data[0] = __TSC_AR_Prior3;
	  CANJ.Tx_Message.Data[3] = Retarder.Torque.Value;
	  CANJ.Tx_Message.Data[7] = CANJ_TSC_Checksum(&CANJ.Tx_Message, Cnt);
	  //  Запрос на передачу
	  CANJ_Transmit_Request = 1;
	}
	if(CANJ.TSC.Retarder_Sel++ > 3)
	{   CANJ.TSC.Retarder_Sel = 0;
	    Message_TSC1_AR = 0;
	}
} // end CANJ_Send_TSC1_Retarder()

#endif

void     CANJ_Send_XBR(void)
	{
	   CANJ_TxD_Buf_0xFF();
	   CANJ.Tx_Message.ExtId = _ExtID_make(XBR_Pri,(XBR_PGN | CANJ.CFG.CAN_Adress),
			                        0x77);
	   int16_t AccDemand = 0x697F;//_CAN_int16_Offset -0x2000;
	   CANJ.Tx_Message.Data[0] = _Lo_16(AccDemand); //2,5m/c2
	   CANJ.Tx_Message.Data[1] = _Hi_16(AccDemand);
	   CANJ.Tx_Message.Data[2] = 0x20;  // XBR_Mode
	   CANJ.Tx_Message.Data[3] = 0xFA;  // Urgency

		uint8_t CS = 0;
		uint8_t Cnt = 2;
		for (uint8_t i = 0; i < 6; i++)
			CS +=  CANJ.Tx_Message.Data[i];
		CS += Cnt & 0x0F;
		CS += _B0_32(CANJ.Tx_Message.ExtId);
		CS += _B1_32(CANJ.Tx_Message.ExtId);
		CS += _B2_32(CANJ.Tx_Message.ExtId);
		CS += _B3_32(CANJ.Tx_Message.ExtId);
		CS = (Cnt & 0x0F) + (((((CS >>4) + CS) & 0x0F) << 4) & 0xF0);

	   CANJ.Tx_Message.Data[7] = CS;
	   //  Запрос на передачу
	   CANJ_Transmit_Request = 1;

} // end  CANJ_Send_XBR()

void     CANJ_Send_Manager(void)
{// Вызывается в My_Tick()
#define __CANJ_BusOffTime    500   //0.5c
	// Fail_Flag ставится если обрыв  проводов CANJ
	//  CAN_ErrorCallback
// Err_State
// HAL_CAN_ERROR_EWG       0x00000001U    EWG error
// HAL_CAN_ERROR_EPV       0x00000002U    EPV error
// HAL_CAN_ERROR_BOF       0x00000004U    BOF error
	if( vCANJ.Fail_Flag &&        // признак нарушения CAN
       (cCANJ.Err_State & HAL_CAN_ERROR_EWG)) // ERROR_EWG
	{ // на стенде Экран ставится ошибка при включении
	  // Возможен вариант что при Вкл. KL15 никто не ответит Ask
		if(BlockON_Complete)
		CANJ_Bus_OFF_Err = 1; //ошибка
	    CANJ_BusOFF = 1;      // флаг
	    CANJ.BusOff_Cnt = __CANJ_BusOffTime;
	}
	else
	{ if(CANJ.BusOff_Cnt)
		 CANJ.BusOff_Cnt--;
	  else
	  {	CANJ_Bus_OFF_Err = 0;
	    CANJ_BusOFF = 0;
	  }
	}
	// объявление адреса
	if(!ACM_Transmit_Cmpl)
		CANJ_Send_ACM();
	else
	{ if(CANJ.Delay_1s) // задержка для передачи 1 раз в секунду
	     CANJ.Delay_1s--;
	  else Disable_TPD = 0;
	  // занято
	  // 0  2  4  5
	  // 10 12 15
	  // 20 22 24 25
	  // 30 32 35
	  // 40 42 44
	  // 50 52 53 55
	  // 60 62 64 65
	  // 70 72 75
	  // 80 82 84 85
	  // 90 92 95 99
	if(!PGM_Disable_CANJ)
	{ switch (CANJ.Timer_1ms++)
	  {
#ifdef   __AxisF_Compile
	   case 2:   //
	   case 12:
	   case 22:
	   case 32:
	   case 42:
	   case 52:
	   case 62:
	   case 72:
	   case 82:
	   case 92:  Message_VDC2 = 1; break;
	   case 25:  //
	   case 75:  Message_TPD = 1;  break;
	   case 99:  Message_EBC1 = 1;
		         CANJ.Timer_1ms = 0;
		  	     break;

#else
	   case 0:  //
	   case 10:
	   case 20:
	   case 30:
	   case 40:
	   case 50:
	   case 60:
	   case 70:
	   case 80: if(TSC1_AE_100ms_Repeat) goto Exit;
	            else Message_TSC1_AE = 1; break;
	   case 90:  Message_TSC1_AE = 1; break;

	   case 4:   //
	   case 24:
	   case 44:
	   case 64:
	   case 84:  Message_HRW = 1; break;
	   case 5:   //
	   case 55:  Message_EBC2 = 1; break;
	   case 53:  Message_ASC4 = 1; break;
	   case 15:  //
	   case 65:  Message_TC1 = 1;  break;

	   case 35:  Message_EBC5 = 1; break;
	   case 85:  Message_VDC1 = 1; break;

	   case 45:
	   case 95:  Message_TSC1_AR = 1; break;
//	   case 97:  CANJ_Send_XBR(); break;
	   case 99:	 CANJ.Timer_1ms = 0;  break;
Exit:;
#endif
	   } //end switch
      // передача идет с интервалом 2 мс !
	   //   1ms         2ms         3ms        4ms
	   // Polling    Transmit     Polling    Transmit
	   if(CANJ_Transmit_Request) // запрос от CANJ_Send_XXX  процедур
		   CANJ_Transmit();
	   else CANJ_Message_Polling();
	   CANJ_TimeOut();
    }
   }
} // end CANJ_Send_Manager();

void     CANJ_Transmit(void)
{
	if(HAL_CAN_GetState(&hCANJ) == HAL_CAN_STATE_BUSY_TX) // != HAL_CAN_STATE_READY)
		   CANJ.BUSY_TX_Cnt++;
	else
	{ if(CANJ_Transmit_Cmpl) // вызван CAN_TxCpltCallback т.е. завершена передача
	  {  CANJ_Transmit_Cmpl = 0;
	     CANJ_Transmit_Request = 0; // разрешаем полинг
	     // двойной буфер
	     CANJ_Tx_Message.ExtId = CANJ.Tx_Message.ExtId;
	     for (uint8_t i = 0; i < 8; i++)
			CANJ_Tx_Message.Data[i] = CANJ.Tx_Message.Data[i];
	     if(HAL_CAN_Transmit_IT(&hCANJ) == HAL_ERROR)
	    	CANJ.NoEmptyBOX_Cnt++; // нет пустых TxMailBox
	  }
	  else
	  {	// нет CAN_TxCpltCallback завершение предыдущего кадра
		HAL_CAN_Transmit_IT(&hCANJ);
	    CANJ.Traffic_Cnt++;
	  }
	}
}// end CANJ_Transmit();  HAL_CAN_STATE_ERROR

void     CANJ_Message_Polling(void)
{ // обработка запросов на передачу сообщений
#ifdef   __AxisF_Compile
	if(Message_VDC2)
	{  Message_VDC2 = 0;
	   CANJ_Send_VDC2();
	}
	else
    if(Message_TPD)
	{  Message_TPD = 0;
	   CANJ_Send_TPD();
	}
	if(Message_EBC1)
	{  Message_EBC1 = 0;
	  CANJ_Send_EBC1();
	}
#else
	if(Message_TSC1_AE)
	{  Message_TSC1_AE = 0;
	   CANJ_Send_TSC1_Engine();
	}
	else
    if(Message_HRW)
	{  Message_HRW = 0;
	   CANJ_Send_HRW();
	}
    else
    if(Message_TSC1_AR)
    {// запрос снимается в процедуре;
      CANJ_Send_TSC1_Retarder();
    }
	else
    if(Message_EBC2)
	{  Message_EBC2 = 0;
	   CANJ_Send_EBC2();
	}
	else
    if(Message_EBC5)
	{  Message_EBC5 = 0;
	   CANJ_Send_EBC5();
	}
	else
    if(Message_TC1)
	{  Message_TC1 = 0;
	   CANJ_Send_TC1();
	}
	else
    if(Message_VDC1)
	{  Message_VDC1 = 0;
	   CANJ_Send_VDC1();
	}
	else
    if(Message_ASC4)
	{  Message_ASC4 = 0;
	   CANJ_Send_ASC4();
	}
#endif
}  // end CANJ_Message_Polling();

void     CANJ_Receive(void)
{ // Вызывается в myHAL_CAN_RxCpltCallback
	uint8_t i;
	// сохраняем принятое
	CANJ.Rx.ExtID = CANJ_Rx0_Message.ExtId;
	CANJ.Rx.PGN=_PGN_make(CANJ_Rx0_Message.ExtId);
	CANJ.Rx.SA =   _B0_32(CANJ_Rx0_Message.ExtId);
	for (i = 0; i < 8; i++)
		CANJ.Rx.Data[i]	= CANJ_Rx0_Message.Data[i];
	//
	if(CANJ.Ptr_Stack < 8)
	{  CANJ.Ptr_Stack++;
	  CANJ.Stack[CANJ.Ptr_Stack].ID = CANJ.Rx.ExtID;
	  for (i = 0; i < 8; i++)
	  CANJ.Stack[CANJ.Ptr_Stack].D[i] = CANJ_Rx0_Message.Data[i];
	}
	// анализируем принятое
#ifdef   __AxisF_Compile
	//--------------------- UpGrade STM ------------------------------
	// Rx PGN инициализация PGM
    if(CANJ.Rx.ExtID == _ExtID_make(PGM_Pri,PGM_PGN3,Dia_Adr) && // 0xF043
       CANJ.Rx.Data[0] == __Rx_Head) //Head)
    { if(CANJ.Rx.Data[1] == __PGM_Key1)
      { //принято STM программатор инициализация 1 step
	    if(CANJ.Rx.Data[2] == __PGM_Step1) // обязательно байты инициализации!
	    { PGM_Ask = 1;
		  CAN_Send_Ask();
	    }
	  }
	  else
	  if(CANJ.Rx.Data[1] == __PGM_Key2)
	  { //принято STM программатор инициализация 2 step
	    if(CANJ.Rx.Data[2] == __PGM_Step2 && PGM_Ask)
	    {  CANJ.Rx.Data[5] = 1;
	       CANJ.Rx.Data[6] = 2;
	       CANJ.Rx.Data[7] = 3;
	       PGM_Ask = 0;
	      if(CANJ.Rx.Data[3] == Pgm_STM)
	      { //ответ на инициализацию делается в  PGM_Main_CAN()
	        // здесь выключаем реле в Power_Test
	        Power.Rele.Pgm_OFF = 1;
	        __disable_irq();
	        PGM_Interface = CAN_Selected;
	        PGM_Active = 1;
	      }
	      else
	      if(CANJ.Rx.Data[3] == Pgm_STM2)
	      { // программирование STM2
	        PGM_Disable_CANJ = 1;
	        Power.Rele.Pgm_OFF = 1;
	      }
	      else
	      if(CANJ.Rx.Data[3] ==__Pgm_AGS_Init)
	      { // программирование AGS
	    	PGM_Disable_CANJ = 1;
	    	AGS_UpGrade_Request = 1;
	    	UpGrade_CAN_USB = 1;  // флаг UpGrade через адаптер CAN_USB
	    	UpGrade.CAN_DA = PGM_AGS_Adr;
	        // ответ на инициализацию CANJ_Send_UpGrade(&AGS.UpGrade)
	    	//  делается в AGS_UpGrade()
	    	for (i = 0; i < 8; i++)
	    	CAN_USB.CAN_TxData[i] = CANJ.Rx.Data[i];
	      }
	      else
		  if(CANJ.Rx.Data[3] ==__Pgm_SAS_Init)
		  { // программирование SAS
		    PGM_Disable_CANJ = 1;
		    SAS_UpGrade_Request = 1;
		    UpGrade_CAN_USB = 1; // флаг UpGrade через адаптер CAN_USB
		    UpGrade.CAN_DA = PGM_SAS_Adr;
	        // ответ на инициализацию CANJ_Send_UpGrade(&SAS.UpGrade)
		    //  делается в SAS_UpGrade()
		    for (i = 0; i < 8; i++)
		    CAN_USB.CAN_TxData[i] = CANJ.Rx.Data[i];
		  }
	    }
	  }
	}  // end PGM_PGN3  0xF043

    // Rx PGN Command & SectorAdr
	if(CANJ.Rx.ExtID == _ExtID_make(PGM_Pri,PGM_PGN0,Dia_Adr)) // 0xF040
	{ // AF A0
	  if(AGS_UpGrade_Active ||
		 SAS_UpGrade_Active)
	  { //принят Paket AGS UpGrade
	    for (i = 0; i < 6; i++)
		{ UpGrade.Paket[i] = CANJ.Rx.Data[i];}
		  UpGrade.Command = CANJ.Rx.Data[2];
		  UpGrade.PaketNum = 1;
	  }
	  if(CANJ.Rx.Data[2] == 0x6E)
	  {
		   PGM_Disable_CANJ = 0;
		  Power.Rele.Pgm_OFF = 0;
	  }
	  else PGM_Disable_CANJ = 1;
    }   // end PGM_PGN0  0xF040

    // Rx PGN PaketData
	if(CANJ.Rx.ExtID == _ExtID_make(PGM_Pri,PGM_PGN1,Dia_Adr)) // 0xF041
	{ if(UpGrade.PaketNum)
	  { for (i = 0; i < 8; i++)
	    UpGrade.Paket[i+UpGrade.PaketNum*8-2] = CANJ.Rx.Data[i]; //хитро Num-1 +6]
	    if(++UpGrade.PaketNum > 4)
	    {  UpGrade.PaketNum = 0;
	       UpGrade_UartRx = 1; // флаг что принято
	    }
	  }
	}    // end PGM_PGN1  0xF041

	//------------------ReqPGN_PGN----------------------
	if(CANJ.Rx.PGN == (ReqPGN_PGN | CANJ.CFG.CAN_Adress))
	{ // принят запрос PGN
	  // запрашиваемый  PGN
	  CANJ.Rx.ReqPGN = CANJ.Rx.Data[3] +
			           CANJ.Rx.Data[4]*256;
	  if(CANJ.Rx.ReqPGN == DM2_PGN)
	  { // запрос DM2
		CANJ.ReqPGN_SA.DM2 = CANJ.Rx.SA;
		Request_PGN_DM2 = 1;
	  }
	  else
	  if(CANJ.Rx.ReqPGN == DM3_PGN)
	  { // запрос DM3
		CANJ.ReqPGN_SA.DM3 = CANJ.Rx.SA;
		Request_PGN_DM3 = 1;
	  }
	  else
	  if(CANJ.Rx.ReqPGN == DM11_PGN)
	  { // запрос DM11
		CANJ.ReqPGN_SA.DM11 = CANJ.Rx.SA;
		Request_PGN_DM11 = 1;
	  }
	  else
	  if(CANJ.Rx.ReqPGN == VIN_PGN)
	  { // запрос VIN
		CANJ.ReqPGN_SA.VIN = CANJ.Rx.SA;
		Request_PGN_VIN = 1;
	  }
	  else
	  if(CANJ.Rx.ReqPGN == ECUID_PGN)
	  { // запрос ECUID
		CANJ.ReqPGN_SA.ECUID = CANJ.Rx.SA;
		Request_PGN_ECUID = 1;
	  }
	  else
	  if(CANJ.Rx.ReqPGN == VW_PGN)
	  { // запрос VW
		CANJ.ReqPGN_SA.VW = CANJ.Rx.SA;
		Request_PGN_VW = 1;
	  }
	  else
	  { // принят не обрабатываемый PGN
		CANJ.ReqPGN_SA.NACK = CANJ.Rx.SA;
		Request_PGN_NACK = 1;
	  }
	} // end запрос PGN
#endif
#ifdef   __AxisR_Compile
	//-----------------------------ACM-------------------------------
	if(CANJ.Rx.ExtID == _ExtID_make(ACM_Pri,ACM_PGN,CANJ.CFG.CAN_Adress) &&
	   CANJ.Rx.Data[2] == CANJ.CFG.CAN_Adress)
	{
		ACM_Transmit_Cmpl = 1;
	}
	//--------------------- UpGrade STM ------------------------------
	// Rx PGN инициализация PGM
	    if(CANJ.Rx.ExtID == _ExtID_make(PGM_Pri,PGM_PGN3,Dia_Adr) && // 0xF043
	       CANJ.Rx.Data[0] == __Rx_Head) //Head)
	    { if(CANJ.Rx.Data[1] == __PGM_Key1)
	      { //принято STM программатор инициализация 1 step
		    if(CANJ.Rx.Data[2] == __PGM_Step1) // обязательно байты инициализации!
		    { PGM_Ask = 1;
			  CAN_Send_Ask();
		    }
		  }
		  else
		  if(CANJ.Rx.Data[1] == __PGM_Key2)
		  { //принято STM программатор инициализация 2 step
		    if(CANJ.Rx.Data[2] == __PGM_Step2 && PGM_Ask)
		    {  CANJ.Rx.Data[5] = 1;
		       CANJ.Rx.Data[6] = 2;
		       CANJ.Rx.Data[7] = 3;
		      if(CANJ.Rx.Data[3] == Pgm_STM)
	          { //ответ на инициализацию делается в  PGM_Main_CAN()
		         // здесь выключаем реле в Power_Test
		         Power.Rele.Pgm_OFF = 1;
	            __disable_irq();
	            PGM_Interface = CAN_Selected;
	            PGM_Active = 1;
		      }
		      else
		      { PGM_Ask = 0;
		        PGM_Disable_CANJ = 1;
		      }
		    }
		  }
		}  // end PGM_PGN3  0xF043
	if(CANJ.Rx.ExtID == _ExtID_make(PGM_Pri,PGM_PGN0,Dia_Adr))
	{
	  if(CANJ.Rx.Data[2] == 0x6E)
		   PGM_Disable_CANJ = 0;
	  else PGM_Disable_CANJ = 1;
	}

	//-----------------------TSC_AE-------------------------
	if(CANJ.Rx.PGN == TSC1_PGN)
	{ // PGN 0 (R) Torque/Speed Control 1 - TSC1
	  // запрос двигателю от другого источника
	  Find_TSC_AE = 1;
	  Tout_TSC_AE = 0;
	  CANJ.Tout.TSC_AE = 0; // сброс тайм аута
	  CANJ.TSC_AE.SA = CANJ.Rx.SA;
	  CANJ.TSC_AE.Mode.Byte = CANJ.Rx.Data[0];
	  CANJ.TSC_AE.Taxo = CANJ.Rx.Data[2] +
                         CANJ.Rx.Data[3]*256;
	  CANJ.TSC_AE.Torque = CANJ.Rx.Data[4];
	  if(CANJ.Rx.Data[7] !=__NotDef8)
	  {  CANJ.TSC_AE.Cnt = CANJ.Rx.Data[7] & 0x0F;
	     CANJ.TSC_AE.CS = CANJ.Rx.Data[7] & 0xF0;
	     // проверка CS
	     if(CANJ.Rx.Data[7] !=
	        CANJ_Rx_TSC_Checksum(CANJ.TSC_AE.Cnt))
	    	  CAN_TSC_AE_Fail = 1;
	     else CAN_TSC_AE_Fail = 0;
	  }
	  if(m_TSC_AE_Arbitrage)
	  { // SPN 695 Engine Override Control Mode
	    //00 Override disabled
		if(CANJ.TSC_AE.Mode.Bits.bit1_2)
		{  CANJ.TSC_AE.Active = 1;
		   if(CANJ.TSC_AE.Mode.Bits.bit1_2 == 1 &&
			  CANJ.TSC_AE.Taxo < __Valid16)
		   { // 01 Speed control “desired speed”
			 CANJ.TSC_AE.Taxo_Des = CANJ.TSC_AE.Taxo;
			 CANJ.TSC_AE.Taxo_Lim = __NotDef16;
		   }
		   if(CANJ.TSC_AE.Mode.Bits.bit1_2 == 2 &&
			  CANJ.TSC_AE.Torque < __Valid8)
		   { // 10 Torque control - “desired torque”
			 CANJ.TSC_AE.Torq_Des = CANJ.TSC_AE.Torque;
			 CANJ.TSC_AE.Torq_Lim = __NotDef8;
		   }
		   if(CANJ.TSC_AE.Mode.Bits.bit1_2 == 3)
		   { // 11 Speed/torque limit control
			 if(CANJ.TSC_AE.Taxo < __Valid16)
				  CANJ.TSC_AE.Taxo_Lim = CANJ.TSC_AE.Taxo;
			 else CANJ.TSC_AE.Taxo_Lim =  __NotDef16;
			 if(CANJ.TSC_AE.Torque < __Valid8)
				  CANJ.TSC_AE.Torq_Lim = CANJ.TSC_AE.Torque;
			 else CANJ.TSC_AE.Torq_Lim =  __NotDef8;
		   }
		}
		else CANJ.TSC_AE.Active = 0;
	  }
	  else
	  {

	  }
	} // end TSC_AE
#endif
	//-----------------------MAZ 5450----------------------
	//-----------------------ESC1--------------------------
	if(CANJ.Rx.PGN == ESC1_PGN)
	{ // PGN 61451 Electronic Steering Control - ESC1
	  Find_ESC1 = 1;
	  Tout_ESC1 = 0;
	  CANJ.Tout.ESC1 = 0; // сброс тайм аута
	}


	//-----------------------EEC1--------------------------
	if(CANJ.Rx.PGN == EEC1_PGN)
	{ // PGN 61444 (R) Electronic Engine Controller 1 - EEC1
//	  Find_EEC1 = 1;
//	  Tout_EEC1 = 0;
//	  CANJ.Tout.EEC1 = 0; // сброс тайм аута
	  //
	  { Find_EEC1 = 1;
	    Tout_EEC1 = 0;
	    CANJ.Tout.EEC1 = 0; // сброс тайм аута
	    CANJ.EEC1.Mode.Byte = CANJ.Rx.Data[0];
	    // Driver's Demand Engine - Percent Torque SPN512
	    CANJ.EEC1.Driver = CANJ.Rx.Data[1];
	    // Actual Engine - Percent Torque SPN513
	    CANJ.EEC1.Torque = CANJ.Rx.Data[2];
	    // Engine Speed SPN190
	    CANJ.EEC1.Taxo = CANJ.Rx.Data[3] +
			             CANJ.Rx.Data[4]*256;
	    // Source Address of Controlling Device for Engine Control SPN1483
	    CANJ.EEC1.ControlSA = CANJ.Rx.Data[5];
        // Engine Starter Mode SPN1675
	    CANJ.EEC1.Starter.Byte = CANJ.Rx.Data[6];
	    // SPN 2432 – Engine Demand - Percent Torque
	    CANJ.EEC1.EDT = CANJ.Rx.Data[7];
	  }
	  // левый эл.мотор
	  if(CANJ.Rx.SA == EM1_SA)
	  {
		Find_EEC1_81 = 1;
		Tout_EEC1_81 = 0;
		CANJ.Tout.EEC1_81 = 0; // сброс тайм аута
		CANJ.EEC1_81.Mode.Byte = CANJ.Rx.Data[0];
		// Driver's Demand Engine - Percent Torque SPN512
		CANJ.EEC1_81.Driver = CANJ.Rx.Data[1];
		// Actual Engine - Percent Torque SPN513
		CANJ.EEC1_81.Torque = CANJ.Rx.Data[2];
		// Engine Speed SPN190
		CANJ.EEC1_81.Taxo = CANJ.Rx.Data[3] +
					             CANJ.Rx.Data[4]*256;
		// Source Address of Controlling Device for Engine Control SPN1483
		CANJ.EEC1_81.ControlSA = CANJ.Rx.Data[5];
		// Engine Starter Mode SPN1675
		CANJ.EEC1_81.Starter.Byte = CANJ.Rx.Data[6];
	    // SPN 2432 – Engine Demand - Percent Torque
		CANJ.EEC1_81.EDT = CANJ.Rx.Data[7];
	  }
	  // правый эл.мотор
	  if(CANJ.Rx.SA == EM2_SA)
	  {
		Find_EEC1_82 = 1;
		Tout_EEC1_82 = 0;
		CANJ.Tout.EEC1_82 = 0; // сброс тайм аута
		CANJ.EEC1_82.Mode.Byte = CANJ.Rx.Data[0];
		// Driver's Demand Engine - Percent Torque SPN512
		CANJ.EEC1_82.Driver = CANJ.Rx.Data[1];
		// Actual Engine - Percent Torque SPN513
		CANJ.EEC1_82.Torque = CANJ.Rx.Data[2];
		// Engine Speed SPN190
		CANJ.EEC1_82.Taxo = CANJ.Rx.Data[3] +
					             CANJ.Rx.Data[4]*256;
		// Source Address of Controlling Device for Engine Control SPN1483
		CANJ.EEC1_82.ControlSA = CANJ.Rx.Data[5];
		// Engine Starter Mode SPN1675
		CANJ.EEC1_82.Starter.Byte = CANJ.Rx.Data[6];
	    // SPN 2432 – Engine Demand - Percent Torque
		CANJ.EEC1_82.EDT = CANJ.Rx.Data[7];
	  }
	} // end EEC1
	//-----------------------EEC2--------------------------
	if(CANJ.Rx.PGN == EEC2_PGN)
	{ //  PGN 61443 Electronic Engine Controller 2 - EEC2
	  Find_EEC2 = 1;
	  Tout_EEC2 = 0;
	  CANJ.Tout.EEC2 = 0; // сброс тайм аута
	  if(CANJ.Rx.SA == EM_SA)
	  { Find_EEC2_EM = 1;
	    Tout_EEC2_EM = 0;
	  }
	  if( CANJ.Rx.SA == EM_SA ||
	     (CANJ.Rx.SA == 0 && !Find_EEC2_EM)) // для дизеля
	  {
	  CANJ.EEC2.B1.Byte = CANJ.Rx.Data[0];
	  // Accelerator Pedal Position 1 SPN91
	  CANJ.EEC2.Accelerator = CANJ.Rx.Data[1];
	  // Engine Percent Load At Current Speed SPN92
	  CANJ.EEC2.Torque = CANJ.Rx.Data[2];
	  }
	} // end EEC2

	//-----------------------EC1--------------------------
	// PGN  65251  Engine Configuration 1  - EC1
	// Every 5s. Data Length: 39
	if(CANJ.Rx.PGN == BAM_PGN &&
	  !CANJ.Rx.SA &&    // двигатель
	  (CANJ.Rx.Data[5] + CANJ.Rx.Data[6]*256) == EC1_PGN)
	{  CANJ.EC1.BAM = 1; // принят BAM от двигателя на передачу EC1
	   CANJ.Tout.TPD = 0; // сброс тайм аута
	}
	if(CANJ.EC1.BAM)
	{ // разбор пакетов TPD
	  if(CANJ.Rx.PGN == TPD_PGN)
	  {  CANJ.EC1.PackNum = CANJ.Rx.Data[0];
	     CANJ.Tout.TPD = 0; // сброс тайм аута
	    if(CANJ.EC1.PackNum == 1)
	    { // есть 1 пакет
	      // Engine Speed At Idle, Point 1  SPN188
	      CANJ.EC1.TaxoP1 = CANJ.Rx.Data[1] +
	    		            CANJ.Rx.Data[2]*256;
	      // Engine Percent Torque At Idle, Point 1 SPN539
	      CANJ.EC1.TorqueP1 = CANJ.Rx.Data[3];
	      // Engine Speed At Point 2 SPN528
	      CANJ.EC1.TaxoP2 = CANJ.Rx.Data[4] +
	    		            CANJ.Rx.Data[5]*256;
	    }
	    if(CANJ.EC1.PackNum == 3)
	    { // есть 3 пакет
	      // Engine Percent Torque At Point 5 SPN543
	      CANJ.EC1.TorqueP5 = CANJ.Rx.Data[1];
	      // Engine Reference Torque SPN544
	      CANJ.EC1.RefTorque = CANJ.Rx.Data[6] +
	    		               CANJ.Rx.Data[7]*256;
	  	  Find_EC1 = 1;
	  	  Tout_EC1 = 0;
	  	  CANJ.Tout.EC1 = 0; // сброс тайм аута
	    }
	  }
	} // end EC1
	//----------------------CCVS--------------------------
	if(CANJ.Rx.PGN == CCVS_PGN)
	{ //  PGN 65265 Cruise Control/Vehicle Speed - CCVS
	  CANJ.CCVS.SA = CANJ.Rx.SA;
	  if(!CANJ.CCVS.SA)
	  { // CCVS от двигателя
		  CANJ.CCVS.Engine.B1.Byte = CANJ.Rx.Data[0];
		  // Wheel-Based Vehicle Speed SPN84
		  CANJ.CCVS.Engine.Speed = CANJ.Rx.Data[1] +
	                               CANJ.Rx.Data[2]*256;
		  CANJ.CCVS.Engine.B4.Byte = CANJ.Rx.Data[3];
		  Find_CCVS_Eng = 1;
		  Tout_CCVS_Eng = 0;
		  CANJ.Tout.CCVS_Eng = 0; // сброс тайм аута
	  }
	  if(CANJ.CCVS.SA == __SA_Body_Controller)
	  { // CCVS от Body Controller
		  CANJ.CCVS.Body.B1.Byte = CANJ.Rx.Data[0];
		  // Wheel-Based Vehicle Speed SPN84
		  CANJ.CCVS.Body.Speed = CANJ.Rx.Data[1] +
	                             CANJ.Rx.Data[2]*256;
		  CANJ.CCVS.Body.B4.Byte = CANJ.Rx.Data[3];
		  Find_CCVS_Body = 1;
		  Tout_CCVS_Body = 0;
		  CANJ.Tout.CCVS_Body = 0; // сброс тайм аута
	  }
	  if(CANJ.CCVS.SA == __SA_DashBoard ||
		 CANJ.CCVS.SA == CANJ.CFG.SA_DashBoard)
	  { // CCVS от панель приборов
		  CANJ.CCVS.Dash.B1.Byte = CANJ.Rx.Data[0];
		  // Wheel-Based Vehicle Speed SPN84
		  CANJ.CCVS.Dash.Speed = CANJ.Rx.Data[1] +
	                             CANJ.Rx.Data[2]*256;
		  CANJ.CCVS.Dash.B4.Byte = CANJ.Rx.Data[3];
		  Find_CCVS_Dash = 1;
		  Tout_CCVS_Dash = 0;
		  CANJ.Tout.CCVS_Body = 0; // сброс тайм аута
	  }
	  Find_CCVS = Find_CCVS_Eng | Find_CCVS_Dash | Find_CCVS_Body;
	} // end CCVS
	//----------------------ERC1--------------------------
	if(CANJ.Rx.PGN == ERC1_PGN)
	{ //PGN 61440 (R) Electronic Retarder Controller 1 - ERC1
	  CANJ.ERC1.SA = CANJ.Rx.SA;
	  if(CANJ.ERC1.SA == __DA_ERC1_RD)
	  { // ERC1_RD ретардер трансмиссия
		//4 bits Retarder Torque Mode SPN900
		CANJ.ERC1.RD.Mode.Byte = CANJ.Rx.Data[0];
		// Actual Retarder - Percent Torque SPN520
		CANJ.ERC1.RD.Torque  = CANJ.Rx.Data[1];
		Find_ERC1_RD = 1;
		Tout_ERC1_RD = 0;
		CANJ.Tout.ERC1_RD = 0; // сброс тайм аута
	  } // end ERC1_RD
	  if(CANJ.ERC1.SA == __DA_ERC1_RE)
	  { // ERC1_RE ретардер двигателя
		CANJ.ERC1.RE.Mode.Byte = CANJ.Rx.Data[0];
		CANJ.ERC1.RE.Torque  = CANJ.Rx.Data[1];
		Find_ERC1_RE = 1;
		Tout_ERC1_RE = 0;
		CANJ.Tout.ERC1_RE = 0; // сброс тайм аута
	  } // end ERC1_RE
	  if(CANJ.ERC1.SA == __DA_ERC1_RG)
	  { // ERC1_RG ретардер коробки передач
		CANJ.ERC1.RG.Mode.Byte = CANJ.Rx.Data[0];
		CANJ.ERC1.RG.Torque  = CANJ.Rx.Data[1];
		Find_ERC1_RG = 1;
		Tout_ERC1_RG = 0;
		CANJ.Tout.ERC1_RG = 0; // сброс тайм аута
	  } // end ERC1_RG
	  if(CANJ.ERC1.SA == __DA_ERC1_REX)
	  { // ERC1_REX ретардер горный тормоз
		CANJ.ERC1.REX.Mode.Byte = CANJ.Rx.Data[0];
		CANJ.ERC1.REX.Torque  = CANJ.Rx.Data[1];
		Find_ERC1_REX = 1;
		Tout_ERC1_REX = 0;
		CANJ.Tout.ERC1_REX = 0; // сброс тайм аута
	  } // end ERC1_REX
	} // end ERC1
	//-----------------------ETC1--------------------------
	if(CANJ.Rx.PGN == ETC1_PGN)
	{ // PGN 61442 Electronic Transmission Controller 1 - ETC1
	  Find_ETC1 = 1;
	  Tout_ETC1 = 0;
	  CANJ.Tout.ETC1 = 0; // сброс тайм аута
	  CANJ.ETC1.B1.Byte = CANJ.Rx.Data[0];
	  // Transmission Output Shaft Speed SPN191
	  CANJ.ETC1.TaxoOut = CANJ.Rx.Data[1] +
                          CANJ.Rx.Data[2]*256;
	  // Transmission Input Shaft Speed SPN161
	  CANJ.ETC1.InTaxo = CANJ.Rx.Data[5] +
                         CANJ.Rx.Data[6]*256;
	  // Source Address of Controlling Device for Transmission Control SPN1482
	  CANJ.ETC1.ControlSA = CANJ.Rx.Data[7];
	} // end ETC1
	//-----------------------ETC2--------------------------
	if(CANJ.Rx.PGN == ETC2_PGN)
	{ // PGN 61445 Electronic Transmission Controller 2 - ETC2
	  Find_ETC2 = 1;
	  Tout_ETC2 = 0;
	  CANJ.Tout.ETC2 = 0; // сброс тайм аута
	  // Transmission Actual Gear Ratio SPN526
	  // ratio of input shaft speed to output shaft speed.
	  // Resolution: 0.001/bit
	  CANJ.ETC2.Ratio = CANJ.Rx.Data[1] +
                        CANJ.Rx.Data[2]*256;
	  // Transmission Current Gear SPN523
	  // zero is neutral. 251 (0xFB) is park.
	  // 126 (0x7E) forward 1  125 (0x7D) reverse 1
	  CANJ.ETC2.Gear = CANJ.Rx.Data[3];
	  // Transmission Current Range SPN163
	  CANJ.ETC2.Range = CANJ.Rx.Data[6] +
                         CANJ.Rx.Data[7]*256;
	} // end ETC2
	//-----------------------TCO1--------------------------
	if(CANJ.Rx.PGN == TCO1_PGN)
	{ // PGN 65132 Tachograph - TCO1
	  Find_TCO1 = 1;
	  Tout_TCO1 = 0;
	  CANJ.Tout.TCO1 = 0; // сброс тайм аута
	  CANJ.TCO1.B1.Byte = CANJ.Rx.Data[0];
	  CANJ.TCO1.B4.Byte = CANJ.Rx.Data[3];
	  // Tachograph output shaft speed SPN1623
	  CANJ.TCO1.TaxoOut = CANJ.Rx.Data[4] +
                          CANJ.Rx.Data[5]*256;
	  // Tachograph vehicle speed SPN1624
	  CANJ.TCO1.Speed_Last = CANJ.TCO1.Speed;
	  CANJ.TCO1.Speed = CANJ.Rx.Data[6] +
                        CANJ.Rx.Data[7]*256;
	} // end TCO1
	//-----------------------VDHR--------------------------
	if(CANJ.Rx.PGN == VDHR_PGN)
	{ // PGN 65217 High Resolution Vehicle Distance - VDHR
	  Find_VDHR = 1;
	  Tout_VDHR = 0;
	  CANJ.Tout.VDHR = 0; // сброс тайм аута
	  // 4 bytes High Resolution Total Vehicle Distance SPN917
	  CANJ.VDHR_Distance =
			  CANJ.Rx.Data[0] +
              CANJ.Rx.Data[1]*256 +
              CANJ.Rx.Data[2]*65536 +
              CANJ.Rx.Data[3]*16777216;
	} // end VDHR
	//-----------------------ASC4--------------------------
	if(CANJ.Rx.PGN == ASC4_PGN)
	{ // PGN 65112 Air Suspension Control 4 - ASC4
	  Find_ASC4 = 1;
	  Tout_ASC4 = 0;
	  CANJ.Tout.ASC4 = 0; // сброс тайм аута
	  // Bellow Pressure Front Axle Left SPN1725
	  CANJ.ASC4.Bellow_Press_FL = CANJ.Rx.Data[0] +
                                  CANJ.Rx.Data[1]*256;
	  // Bellow Pressure Front Axle Right SPN1726
	  CANJ.ASC4.Bellow_Press_FR = CANJ.Rx.Data[2] +
                                  CANJ.Rx.Data[3]*256;
	  // Bellow Pressure Rear Axle Left SPN1727
	  CANJ.ASC4.Bellow_Press_RL = CANJ.Rx.Data[4] +
                                  CANJ.Rx.Data[5]*256;
	  // Bellow Pressure Rear Axle Right SPN1728
	  CANJ.ASC4.Bellow_Press_RR = CANJ.Rx.Data[6] +
                                  CANJ.Rx.Data[7]*256;
	} // end ASC4
	//-----------------------ASC1--------------------------
	if(CANJ.Rx.PGN == ASC1_PGN)
	{ // PGN 65112 Air Suspension Control 4 - ASC4
	  Find_ASC1 = 1;
	  Tout_ASC1 = 0;
	  CANJ.Tout.ASC1 = 0; // сброс тайм аута
	  CANJ.ASC1.B1.Byte = CANJ.Rx.Data[0];
	  CANJ.ASC1.B2.Byte = CANJ.Rx.Data[1];
	  CANJ.ASC1.B3.Byte = CANJ.Rx.Data[2];
	  CANJ.ASC1.B4.Byte = CANJ.Rx.Data[3];
	  CANJ.ASC1.B5.Byte = CANJ.Rx.Data[4];
	  CANJ.ASC1.B6.Byte = CANJ.Rx.Data[5];
	  CANJ.ASC1.B7.Byte = CANJ.Rx.Data[6];
	  CANJ.ASC1.B8.Byte = CANJ.Rx.Data[7];
	} // end ASC1
	//-----------------------DC1--------------------------
	if(CANJ.Rx.PGN == DC1_PGN)
	{ // PGN 65102 Door Control 1 - DC1
	  Find_DC1 = 1;
	  Tout_DC1 = 0;
	  CANJ.Tout.DC1 = 0; // сброс тайм аута
	  CANJ.DC1_Status.Byte = CANJ.Rx.Data[0];
	} // end DC1
	//-----------------------AIR1--------------------------
	if(CANJ.Rx.PGN == AIR1_PGN)
	{ // PGN 65198 Air Supply Pressure - AIR1
	  Find_AIR1 = 1;
	  Tout_AIR1 = 0;
	  CANJ.Tout.AIR1 = 0; // сброс тайм аута
	  // Service Brake Circuit 1 Air Pressure SPN1087
	  CANJ.AIR1.Circuit1_Press = CANJ.Rx.Data[2];
	  // Service Brake Circuit 2 Air Pressure SPN1088
	  CANJ.AIR1.Circuit2_Press = CANJ.Rx.Data[3];
	} // end AIR1
	//-----------------------EBC1--------------------------
	if(CANJ.Rx.PGN == EBC1_PGN)
	{ //PGN 61441 Electronic Brake Controller 1 - EBC1
	  Find_EBC1 = 1;
	  Tout_EBC1 = 0;
	  CANJ.Tout.EBC1 = 0; // сброс тайм аута
	  CANJ.EBC1.SA = CANJ.Rx.SA;
	  CANJ.EBC1.B3.Byte =  CANJ.Rx.Data[2];
	  CANJ.EBC1.B6.Byte =  CANJ.Rx.Data[5];
	  CANJ.EBC1.B8.Byte =  CANJ.Rx.Data[7];
	  // ABS_SW_Condition из принятого EBC1
	  if((CANJ.EBC1.B3.Byte & 0x03) ==__Bit12) //SPN 575 ABS Off-road Switch
		   ABS_SW_EBC1 = 1;
	  else ABS_SW_EBC1 = 0;
	} // end EBC1
	//-----------------------XBR--------------------------
	if(CANJ.Rx.PGN == (XBR_PGN | CANJ.CFG.CAN_Adress))
	{ // PGN 1024 External Brake Request - XBR
	  if(!CANJ.XBR_1.SA ||
		  CANJ.XBR_1.SA == CANJ.Rx.SA)
	  { // от первого источника
	    CANJ.XBR_1.SA = CANJ.Rx.SA;
	    Find_XBR_1 = 1;
		Tout_XBR_1 = 0;
	    CANJ.Tout.XBR_1 = 0; // сброс тайм аута
	    // External Acceleration Demand SPN2920
	    CANJ.XBR_1.Acc_Demand = CANJ.Rx.Data[0] +
                                CANJ.Rx.Data[1]*256;
	    //
	    CANJ.XBR_1.Status.Byte =  CANJ.Rx.Data[2];
	    // XBR urgency SPN4099 (срочность)
	    CANJ.XBR_1.Urgency =  CANJ.Rx.Data[3];
	    // XBR Message Counter SPN3189
	    CANJ.XBR_1.Cnt = CANJ.Rx.Data[7] & 0x0F;
	    // XBR Message Checksum SPN3188
	    CANJ.XBR_1.CS = (CANJ.Rx.Data[7] & 0xF0)>>4;
	    XBR_CS = CANJ_XBR_Checksum(CANJ.XBR_1.Cnt);
	    if(CANJ.XBR_1.CS != CANJ_XBR_Checksum(CANJ.XBR_1.Cnt))
	    	 XBR_1_CS_Fail = 1;
	    else XBR_1_CS_Fail = 0;
	  }
/*
	  if(!CANJ.XBR_2.SA ||
		  CANJ.XBR_2.SA == CANJ.Rx.SA)
	  { // от второго источника
	    CANJ.XBR_2.SA = CANJ.Rx.SA;
	    Find_XBR_2 = 1;
		Tout_XBR_2 = 0;
	    CANJ.Tout.XBR_2 = 0; // сброс тайм аута
	    // External Acceleration Demand SPN2920
	    CANJ.XBR_2.Acc_Demand = CANJ.Rx.Data[0] +
                                CANJ.Rx.Data[1]*256;
	    //
	    CANJ.XBR_2.Status.Byte =  CANJ.Rx.Data[2];
	    // XBR urgency SPN4099 (срочность)
	    CANJ.XBR_2.Urgency =  CANJ.Rx.Data[3];
	    // XBR Message Counter SPN3189
	    CANJ.XBR_2.Cnt = CANJ.Rx.Data[7] & 0x0F;
	    // XBR Message Checksum SPN3188
	    CANJ.XBR_2.CS = CANJ.Rx.Data[7] & 0xF0;
	    if(CANJ.XBR_2.CS != CANJ_XBR_Checksum(2))
	    	 XBR_2_CS_Fail = 1;
	    else XBR_2_CS_Fail = 0;
	  }*/
	} // end XBR
	//-----------------------FF20_PGN--------------------------
	if(CANJ.Rx.PGN == PGN_FF20_PGN)
	{ //
	  Find_PGN_FF20 = 1;
	  Find_Body_PGN = 1;
	  Tout_PGN_FF20 = 0;
	  CANJ.Tout.PGN_FF20 = 0; // сброс тайм аута
	  CANJ.PGN_FF20.SA = CANJ.Rx.SA;
	  CANJ.PGN_FF20.B2.Byte =  CANJ.Rx.Data[1];
	  CANJ.PGN_FF20.B3.Byte =  CANJ.Rx.Data[2];
	  CANJ.PGN_FF20.B4.Byte =  CANJ.Rx.Data[3];
	  CANJ.PGN_FF20.B5.Byte =  CANJ.Rx.Data[4];
	  CANJ.PGN_FF20.B6.Byte =  CANJ.Rx.Data[5];
	  CANJ.PGN_FF20.B7.Byte =  CANJ.Rx.Data[6];
	  CANJ.PGN_FF20.B8.Byte =  CANJ.Rx.Data[7];
	} // end PGN_FF20
	if(CANJ.Rx.PGN == PGN_FF21_PGN)
	{ //
	  Find_PGN_FF21 = 1;
	  Tout_PGN_FF21 = 0;
	  CANJ.Tout.PGN_FF21 = 0; // сброс тайм аута
	  CANJ.PGN_FF21.SA = CANJ.Rx.SA;
	  CANJ.PGN_FF21.B1.Byte =  CANJ.Rx.Data[0];
	  CANJ.PGN_FF21.B2.Byte =  CANJ.Rx.Data[1];
	  CANJ.PGN_FF21.B5.Byte =  CANJ.Rx.Data[4];
	  CANJ.PGN_FF21.B6.Byte =  CANJ.Rx.Data[5];
	  CANJ.PGN_FF21.B7.Byte =  CANJ.Rx.Data[6];
	} // end PGN_FF21
	if(CANJ.Rx.PGN == PGN_FF22_PGN)
	{ //
	  Find_PGN_FF22 = 1;
	  Tout_PGN_FF22 = 0;
	  CANJ.Tout.PGN_FF22 = 0; // сброс тайм аута
	  CANJ.PGN_FF22.SA = CANJ.Rx.SA;
	  CANJ.PGN_FF22.AIR1 =  CANJ.Rx.Data[0];
	  CANJ.PGN_FF22.AIR2 =  CANJ.Rx.Data[1];
	  CANJ.PGN_FF22.Temp =  CANJ.Rx.Data[4];
	  CANJ.PGN_FF22.Taxo = CANJ.Rx.Data[6] +
                           CANJ.Rx.Data[7]*256;
	} // end PGN_FF22
	if(CANJ.Rx.PGN == PGN_FF23_PGN)
	{ //
	  Find_PGN_FF23 = 1;
	  Tout_PGN_FF23 = 0;
	  CANJ.Tout.PGN_FF23 = 0; // сброс тайм аута
	  CANJ.PGN_FF23.SA = CANJ.Rx.SA;
	  CANJ.PGN_FF23.Ubat =  CANJ.Rx.Data[0];
	} // end PGN_FF23
} // end CANJ_Receive();

uint8_t  CANJ_XBR_Checksum(uint8_t Cnt)
{
// XBR Message Counter SPN3189 from 0 to 15
// XBR Message Checksum SPN3188

	uint16_t CS = 0;
	for (uint8_t i = 0; i < 6; i++)
		CS += CANJ.Rx.Data[i];
	CS += Cnt & 0x0F;
	CS += _B0_32(CANJ.Rx.ExtID);
	CS += _B1_32(CANJ.Rx.ExtID);
	CS += _B2_32(CANJ.Rx.ExtID);
	CS += _B3_32(CANJ.Rx.ExtID);
	CS = (((CS >>4) + CS) & 0x0F);
	return CS;

} // end  CANJ_XBR_Checksum()

// EEC1 Transmission Repetition Rate: 10 ms
#define __Tout_EEC1   500//300    // 0,15c стенд
// EEC2 Transmission Repetition Rate: 50 ms
#define __Tout_EEC2   300    // 0,15c
#define __Tout_EC1    15000  // 15c
#define __Tout_TPD    600    // 0,6c
// CCVS Transmission Repetition Rate: 100 ms
#define __Tout_CCVS   300    // 0,3c
// ERC1 Transmission Repetition Rate: 100 ms
#define __Tout_ERC1   300    // 0,3c
// ETC1 Transmission Repetition Rate: 10 ms
#define __Tout_ETC1   250    // 0,15c
// ETC2 Transmission Repetition Rate: 100 ms
#define __Tout_ETC2   300    // 0,3c
// TCO1 Transmission Repetition Rate: 50 ms
#define __Tout_TCO1   250    // 0,15c
// VDHR Transmission Repetition Rate: 1s
#define __Tout_VDHR    5000  // 5c
// ASC4 Transmission Repetition Rate: 100 ms
#define __Tout_ASC4   300    // 0,3c
// ASC1 Transmission Repetition Rate: 100 ms
#define __Tout_ASC1   300    // 0,3c
// DC1 Transmission Repetition Rate: 100 ms
#define __Tout_DC1    300    // 0,3c
// AIR1 Transmission Repetition Rate: 1s
#define __Tout_AIR1    5000  // 5c
// EBC1 Transmission Repetition Rate: 100 ms
#define __Tout_EBC1   300    // 0,3c
// XBR Transmission Repetition Rate: when active: 20 ms; else 200 ms
#define __Tout_XBR    600    // 0,6c
#define __Tout2_XBR   250    // 0,15c
// TSC_AE Transmission Repetition Rate: when active: 10 ms; else 100 ms
#define __Tout_TSC_AE  300    // 0,3c
// PGN_FF2x Transmission Repetition Rate: 1s
#define __Tout_PGN_FF20    5000  // 5c
#define __Tout_PGN_FF21    5000  // 5c
#define __Tout_PGN_FF22    5000  // 5c
#define __Tout_PGN_FF23    5000  // 5c
void     CANJ_TimeOut(void)
{
	if(!CANJ_BusOFF)
	{
	  if(Find_EEC1_81) // левый эл.мотор
	  { if(CANJ.Tout.EEC1_81 > __Tout_EEC1)
	      Tout_EEC1_81 = 1; // сработал TimeOut EEC1
	    else CANJ.Tout.EEC1_81++;
	  }
	  if(Find_EEC1_82)
	  { if(CANJ.Tout.EEC1_82 > __Tout_EEC1)
		  Tout_EEC1_82 = 1; // сработал TimeOut EEC1
		else CANJ.Tout.EEC1_82++;
	  }
	  if(Tout_EEC1_81 || Tout_EEC1_82)
		   CANJ_ToutEM_Err = 1;
	  else CANJ_ToutEM_Err = 0;

	  if(Find_EEC1)  //???
	  { if(!CANJ.Tout.EEC1)
	    { // обнуляется если пришел кадр
		  CANJ_ToutEEC1_Err = 0;
	    }
		if(CANJ.Tout.EEC1 > __Tout_EEC1)
	    { // сработал TimeOut EEC1
		  Tout_EEC1 = 1;
		  CANJ_ToutEEC1_Err = 1;
	    }
	    else CANJ.Tout.EEC1++;
	  }

	  if(Find_EEC2)
	  { if(CANJ.Tout.EEC2 > __Tout_EEC2)
		    Tout_EEC2 = 1; // сработал TimeOut EEC1
	    else CANJ.Tout.EEC2++;
	  }
	  if(Find_EC1)
	  { if(CANJ.Tout.EC1 > __Tout_EC1)
		    Tout_EC1 = 1; // сработал TimeOut EEC1
	    else CANJ.Tout.EC1++;
	  }
	  if(CANJ.EC1.BAM)
	  { if(CANJ.Tout.TPD > __Tout_TPD)
	    { CANJ.EC1.BAM = 0;
		  Tout_TPD = 1; // сработал TimeOut TPD
	    }
	    else CANJ.Tout.TPD++;
	  }
	  if(Find_CCVS_Eng)
	  { if(CANJ.Tout.CCVS_Eng > __Tout_CCVS)
	    {  Tout_CCVS_Eng = 1; // сработал TimeOut CCVS_Eng
	       CANJ.CCVS.Engine.Speed = __Error16;
	       CANJ.CCVS.Engine.B4.Byte =__NotDefinedByte;
	    }
	    else CANJ.Tout.CCVS_Eng++;
	  }
	  if(Find_CCVS_Body)
	  { if(CANJ.Tout.CCVS_Body > __Tout_CCVS)
	    {  Tout_CCVS_Body = 1; // сработал TimeOut CCVS_Body
	       CANJ.CCVS.Body.Speed = __Error16;
	       CANJ.CCVS.Body.B4.Byte =__NotDefinedByte;
	    }
	    else CANJ.Tout.CCVS_Body++;
	  }
	  if(Find_CCVS_Dash)
	  { if(CANJ.Tout.CCVS_Dash > __Tout_CCVS)
	    {  Tout_CCVS_Dash = 1; // сработал TimeOut CCVS_Dash
	       CANJ.CCVS.Dash.Speed = __Error16;
	       CANJ.CCVS.Dash.B4.Byte =__NotDefinedByte;
	    }
	    else CANJ.Tout.CCVS_Dash++;
	  }
	  if(Find_ERC1_RD)
	  { if(CANJ.Tout.ERC1_RD > __Tout_ERC1)
	      Tout_ERC1_RD = 1; // сработал TimeOut ERC1_RD
	    else CANJ.Tout.ERC1_RD++;
	  }
	  if(Find_ERC1_RE)
	  { if(CANJ.Tout.ERC1_RE > __Tout_ERC1)
	      Tout_ERC1_RE = 1; // сработал TimeOut ERC1_RE
	    else CANJ.Tout.ERC1_RE++;
	  }
	  if(Find_ERC1_RG)
	  { if(CANJ.Tout.ERC1_RG > __Tout_ERC1)
	      Tout_ERC1_RG = 1; // сработал TimeOut ERC1_RG
	    else CANJ.Tout.ERC1_RG++;
	  }
	  if(Find_ERC1_REX)
	  { if(CANJ.Tout.ERC1_REX > __Tout_ERC1)
	      Tout_ERC1_REX = 1; // сработал TimeOut ERC1_REX
	    else CANJ.Tout.ERC1_REX++;
	  }
	  if(Find_ETC1)
	  { if(CANJ.Tout.ETC1 > __Tout_ETC1)
	    { // сработал TimeOut ETC1
		  Tout_ETC1 = 1;
		  CANJ.ETC1.B1.Byte =__NotDefinedByte;
	    }
	    else CANJ.Tout.ETC1++;
	  }
	  if(Find_ETC2)
	  { if(CANJ.Tout.ETC2 > __Tout_ETC2)
	    { // сработал TimeOut ETC2
		  Tout_ETC2 = 1;
		  CANJ.ETC2.Gear =__NotDefinedByte;
	    }
	    else CANJ.Tout.ETC2++;
	  }
	  if(Find_TCO1)
	  { if(!CANJ.Tout.TCO1)
	    { // обнуляется если пришел кадр
		  TCO_CAN_Fail = 0;
	    }
		if(CANJ.Tout.TCO1 > __Tout_TCO1)
	    { // сработал TimeOut TCO1
		  Tout_TCO1 = 1;
		  TCO_CAN_Fail = 1; // ошибка в s_B7_TCO_Error
		  CANJ.TCO1.Speed = __Error16;
	    }
	    else CANJ.Tout.TCO1++;
	  }
	  if(Find_VDHR)
	  { if(CANJ.Tout.VDHR > __Tout_VDHR)
	    { // сработал TimeOut VDHR
		  Tout_VDHR = 1;
	    }
	    else CANJ.Tout.VDHR++;
	  }
	  if(Find_ASC4)
	  { if(CANJ.Tout.ASC4 > __Tout_ASC4)
	    { // сработал TimeOut ASC4
		  Tout_ASC4 = 1;
	    }
	    else CANJ.Tout.ASC4++;
	  }
	  if(Find_ASC1)
	  { if(CANJ.Tout.ASC1 > __Tout_ASC1)
	    { // сработал TimeOut ASC1
		  Tout_ASC1 = 1;
	    }
	    else CANJ.Tout.ASC1++;
	  }
	  if(Find_DC1)
	  { if(CANJ.Tout.DC1 > __Tout_DC1)
	    { // сработал TimeOut DC1
		  Tout_DC1 = 1;
	    }
	    else CANJ.Tout.DC1++;
	  }
	  if(Find_AIR1)
	  { if(CANJ.Tout.AIR1 > __Tout_AIR1)
	    { // сработал TimeOut AIR1
		  Tout_AIR1 = 1;
	    }
	    else CANJ.Tout.AIR1++;
	  }
	  if(Find_EBC1)
	  { if(CANJ.Tout.EBC1 > __Tout_EBC1)
	    { // сработал TimeOut EBC1
		  Tout_EBC1 = 1;
		  ABS_SW_EBC1 = 0;
	    }
	    else CANJ.Tout.EBC1++;
	  }
	  if(Find_XBR_1)
	  { if(CANJ.Tout.XBR_1 > __Tout_XBR)
	    { // сработал TimeOut XBR_1
		  Tout_XBR_1 = 1;
	    }
	    else CANJ.Tout.XBR_1++;
	  }
	  if(Find_XBR_2)
	  { if(CANJ.Tout.XBR_2 > __Tout_XBR)
	    { // сработал TimeOut XBR_1
		  Tout_XBR_2 = 1;
	    }
	    else CANJ.Tout.XBR_2++;
	  }
	  if(Find_TSC_AE)
	  { if(CANJ.Tout.TSC_AE > __Tout_TSC_AE)
	    { // сработал TimeOut TSC_AE
		  Tout_TSC_AE = 1;
		  CANJ.TSC_AE.Active = 0;
		  CANJ.TSC_AE.Taxo_Des = __NotDef16;
		  CANJ.TSC_AE.Taxo_Lim = __NotDef16;
		  CANJ.TSC_AE.Torq_Des = __NotDef8;
		  CANJ.TSC_AE.Torq_Lim = __NotDef8;
	    }
	    else CANJ.Tout.TSC_AE++;
	  }
	  if(Find_PGN_FF20)
	  { if(CANJ.Tout.PGN_FF20 > __Tout_PGN_FF20)
	    { // сработал TimeOut PGN_FF20
		  Tout_PGN_FF20 = 1;
	    }
	    else CANJ.Tout.PGN_FF20++;
	  }
	  if(Find_PGN_FF21)
	  { if(CANJ.Tout.PGN_FF21 > __Tout_PGN_FF21)
	    { // сработал TimeOut PGN_FF21
		  Tout_PGN_FF21 = 1;
	    }
	    else CANJ.Tout.PGN_FF21++;
	  }
	  if(Find_PGN_FF22)
	  { if(CANJ.Tout.PGN_FF22 > __Tout_PGN_FF22)
	    { // сработал TimeOut PGN_FF22
		  Tout_PGN_FF22 = 1;
	    }
	    else CANJ.Tout.PGN_FF22++;
	  }
	  if(Find_PGN_FF23)
	  { if(CANJ.Tout.PGN_FF23 > __Tout_PGN_FF23)
	    { // сработал TimeOut PGN_FF23
		  Tout_PGN_FF23 = 1;
	    }
	    else CANJ.Tout.PGN_FF23++;
	  }
	  if(Tout_PGN_FF20 || Tout_PGN_FF21 ||
	     Tout_PGN_FF22 || Tout_PGN_FF23)
		   Tout_Body_PGN = 1;
	  else Tout_Body_PGN = 0;
	} // end if(!CANJ_BusOFF)
	else
	{ // нужно сбросить счетчики Tout чтобы
	  // не выставилась ошибка при восстановлении CANJ
		CANJ.Tout.EEC1 = 0;
	}
} // end CANJ_TimeOut();

void     DIA_CANJ_Oss(void)
{ // вызывается в DIA_Oss() MySystem.c
    /*
	if(CANJ.Ptr_Stack)
	{ uint8_t  Ptr = CANJ.Ptr_Stack;
	  CANJ.Ptr_Stack--;
	  // идентификатор
	  // первая строка в Осциллографе
	  UartDIA.Tx_data[0] = _B3_32(CANJ.Stack[Ptr].ID);
	  UartDIA.Tx_data[3] = _B2_32(CANJ.Stack[Ptr].ID);
	  UartDIA.Tx_data[6] = _B1_32(CANJ.Stack[Ptr].ID);
	  UartDIA.Tx_data[9] = _B0_32(CANJ.Stack[Ptr].ID);
	  // данные
	  // вторая строка в Осциллографе
	  UartDIA.Tx_data[1] = CANJ.Stack[Ptr].D[0];
	  UartDIA.Tx_data[4] = CANJ.Stack[Ptr].D[1];
	  UartDIA.Tx_data[7] = CANJ.Stack[Ptr].D[2];
	  UartDIA.Tx_data[10]= CANJ.Stack[Ptr].D[3];
	  // третья строка в Осциллографе
	  UartDIA.Tx_data[2] = CANJ.Stack[Ptr].D[4];
	  UartDIA.Tx_data[5] = CANJ.Stack[Ptr].D[5];
	  UartDIA.Tx_data[8] = CANJ.Stack[Ptr].D[6];
	  UartDIA.Tx_data[11]= CANJ.Stack[Ptr].D[7];
    }
	*/
	  // первая строка в Осциллографе
	  UartDIA.Tx_data[0] = CAN_Engine.Driver;
	  UartDIA.Tx_data[3] = EngineTorque.Value+__OffSet8;//0x7D;//
	  UartDIA.Tx_data[6] = CAN_Engine.Torque;
	  UartDIA.Tx_data[9] = CAN_Engine.TaxoN;
	  // данные
	  // вторая строка в Осциллографе
	  UartDIA.Tx_data[1] = CANJ.EEC1_81.Driver;
	  UartDIA.Tx_data[4] = 81;
	  UartDIA.Tx_data[7] = CANJ.EEC1_81.Torque;
	  UartDIA.Tx_data[10]= CANJ.EEC1_81.Taxo / 80; // 1 bit - 10 об/мин
	  // третья строка в Осциллографе
	  UartDIA.Tx_data[2] = CANJ.EEC1_82.Driver;
	  UartDIA.Tx_data[5] = 82;
	  UartDIA.Tx_data[8] = CANJ.EEC1_82.Torque;
	  UartDIA.Tx_data[11]= CANJ.EEC1_82.Taxo / 80; // 1 bit - 10 об/мин

	// четвертая строка в Осциллографе
	UartDIA.Tx_data[12] = CAN_PGN_Tout1;
	UartDIA.Tx_data[13] = CAN_PGN_Tout2;
	UartDIA.Tx_data[14] = CAN_PGN_Find2;
	UartDIA.Tx_data[15] = CANJ_Flags2;
	// пятая строка в Осциллографе
	UartDIA.Tx_data[16] = cCANJ.Rx_Cnt;//cCANJ.Tx_State;
	UartDIA.Tx_data[17] = cCANJ.Tx_Cnt;
	UartDIA.Tx_data[18] = CANT.TxErrCnt;//cCANJ.Err_Cnt;//cCANJ.Rx_State;
	UartDIA.Tx_data[19] = CANT.TrCnt;//vCANJ.Fail_Flag;//cCANJ.Rx_Cnt;
	// шестая строка в Осциллографе
	UartDIA.Tx_data[20] = CANT.Mode;//
	UartDIA.Tx_data[21] = CANT.Phase;//
	UartDIA.Tx_data[22] = CANT.Tout;
	UartDIA.Tx_data[23] = CANT_Flags;//CANT.TxErrCnt;

} //END  DIA_CANJ_Oss();
#endif
//---------------------------End CAN_j1939----------------------------------

uint16_t     ADC_Middle_Value(MidTypeDef* Mid)
{uint16_t V=0;
 uint32_t S;
 uint8_t  N;

	 N = Mid->N;
 	 S = Mid->Sum;
 	 if(N != Mid->N)
 	 { // значения изменились был ADC_ConvCpltCallback
 		 N = Mid->N;
 	 	 S = Mid->Sum;
 	 }
 	 if(N)
 	 V = S / N;
	return V;
}
void     ADC_Button(ButtonTypeDef* SW)
{ //вызывается в myHAL_ADC_ConvCpltCallback
	SW->ADC.Mid.Sum += (uint16_t)*(SW->ADC_Ch);
	SW->ADC.Mid.N++;
}

#define __Button_Delay          20   // 100mc
#define __Button_OffLevel_Koef  128  // U_Kl15 / 2
#define __Button_OnLevel_Koef   32   // U_Kl15 / 8

void     State_Button(ButtonTypeDef* SW)
{
#define __SW_State_Off  1
#define __SW_State_On   0
	// среднее значение ацепирования
	SW->ADC.Mid.Val = ADC_Middle_Value(&(SW->ADC.Mid));
	SW->ADC.Mid.Sum = 0;
	SW->ADC.Mid.N = 0;
	SW->Oss.Mid_Val = SW->ADC.Mid.Val /__Koss;
	//
	if(SW->ADC.State ==__SW_State_On)
	{ // включен
	  SW->ADC.On_Val = SW->ADC.Mid.Val;
	  SW->Oss.On_Val = SW->ADC.Mid.Val /__Koss;
	  if(SW->ADC.Mid.Val > SW->Off_Level)
	  { if(SW->Delay)
		   SW->Delay--;
	    else // смена состояния
	    { SW->ADC.State = __SW_State_Off; // Off
	      SW->Delay = __Button_Delay;
	    }
	  }
	  else SW->Delay = __Button_Delay;
	}
	else // выключен
	{ SW->ADC.Off_Val = SW->ADC.Mid.Val;
	  SW->Oss.Off_Val = SW->ADC.Mid.Val /__Koss;
	  if(SW->ADC.Mid.Val < SW->On_Level)
	  { if(SW->Delay)
		   SW->Delay--;
	    else // смена состояния
	    { SW->ADC.State = __SW_State_On; // On
	      SW->Delay = __Button_Delay;
	    }
	  }
	  else SW->Delay = __Button_Delay;
	}
	// определение состояния
	if(SW->Install)// &&
	{ if(SW->Button)
	  { // CFG кнопка
		if(SW->ADC.State == __SW_State_On)
		{ // кнопка нажата
		  if(SW->Up_Fl)  // кнопка была отпущена
		  { if(SW->Condition)
			      SW->Condition = 0;
		    else  SW->Condition = 1;
		  }
		  SW->Up_Fl = 0;
		}
		else SW->Up_Fl = 1;  // кнопка отпущена
	  }
	  else // CFG выключатель
	  { if(SW->ADC.State == __SW_State_On)
		     SW->Condition = 1; // On
	    else SW->Condition = 0; // Off
	  }
	}
	else SW->Condition = 0; // Off
} // end State_Button

#define __OffRoad_Speed_Lim  0x2800  //40km/h
void     Button_Switch(void)
{
uint16_t   Off_Level = (uint32_t)LSSw.U_bat *__Button_OffLevel_Koef /256;
uint16_t   On_Level =  (uint32_t)LSSw.U_bat *__Button_OnLevel_Koef /256;

#ifdef   __AxisF_Compile
	// переключатель ABS
	SW_ABS.Off_Level = Off_Level;
	SW_ABS.On_Level =  On_Level;
    if(SW_Handling)
    {
	  State_Button(&SW_ABS);
	  ABS_SW_Condition = SW_ABS.Condition;
    }
	// ABS_OffRoad
	if(ABS_OffRoad_Enable &&           // CFG
	   Speed_VX_est < __OffRoad_Speed_Lim && // сkорость меньше 40km/h
	   (ABS_SW_Condition || // Switch
		ABS_SW_EBC1))  // ABS_SW_Condition из принятого EBC1
		 ABS_OffRoad = 1;
	else ABS_OffRoad = 0;

	// переключатель DIA
    if(LSSw_Handling)
    {
	  if(BSP75_WL.ADC.Off_Val < On_Level)
	  { if(SW_DIA.Delay < __Button_Delay)
		   SW_DIA.Delay++;
	    else SW_DIA.Condition = 1;
	  }
	  else
	  { if(SW_DIA.Delay)
		   SW_DIA.Delay--;
	    else SW_DIA.Condition = 0;
	  }
	  DIA_SW_Condition = SW_DIA.Condition; // для диагностики
    }
#endif
#ifdef   __AxisR_Compile
	SW_ASR.Off_Level = Off_Level;
	SW_ASR.On_Level = On_Level;
	SW_TSET.Off_Level = Off_Level;
	SW_TSET.On_Level = On_Level;
	State_Button(&SW_ASR);
    if(SW_Handling)
    {
	  ASR_SW_Condition = SW_ASR.Condition;
	  State_Button(&SW_TSET);
	  TSET_SW_Condition = SW_TSET.Condition;
	  TSET_Switch = TSET_SW_Condition; // для STM1
    }
#endif
} // end Button_Switch()

void     DIA_Button_Oss(void)
{ // вызывается в DIA_Oss() MySystem.c
	// первая строка в Осциллографе
	UartDIA.Tx_data[0] = AGS.Calibr.Tout;
	UartDIA.Tx_data[3] = AGS.Calibr.Phase;
	UartDIA.Tx_data[6] = Vehicle.StateAGS;
	UartDIA.Tx_data[9] = Vehicle.StateSAS;
	// вторая строка в Осциллографе
	UartDIA.Tx_data[1] = SAS.Zero.Time;
	UartDIA.Tx_data[4] = SAS.Zero.Phase;
	UartDIA.Tx_data[7] = _Hi_16(SAS.Zero.Angle);
	UartDIA.Tx_data[10]= _Lo_16(SAS.Zero.Angle);
	// третья строка в Осциллографе
	UartDIA.Tx_data[2] = SW_ABS.Oss.Mid_Val;
	UartDIA.Tx_data[5] = SW_ASR.Oss.Mid_Val;
	UartDIA.Tx_data[8] = SW_TSET.Oss.Mid_Val;
	UartDIA.Tx_data[11]= BSP75_WL.ADC.Off_Val/__Koss;
	// четвертая строка в Осциллографе
	UartDIA.Tx_data[12] = ABS_SW_Condition;
	UartDIA.Tx_data[13] = ASR_SW_Condition;
	UartDIA.Tx_data[14] = TSET_SW_Condition;
	UartDIA.Tx_data[15] = DIA_SW_Condition;
	// пятая строка в Осциллографе
	UartDIA.Tx_data[16] = LSSw.U_bat/__Koss;
	UartDIA.Tx_data[17] = SW_ABS.Off_Level/__Koss;
	UartDIA.Tx_data[18] = SW_ABS.On_Level/__Koss;
	UartDIA.Tx_data[19] = Power.INH_Cnt;
	// шестая строка в Осциллографе
	UartDIA.Tx_data[20] = 1;//;
	UartDIA.Tx_data[21] = 2;//;
	UartDIA.Tx_data[22] = SW_ASR.Off_Level/__Koss;
	UartDIA.Tx_data[23] = SW_ASR.On_Level/__Koss;

} //END  DIA_Button_Oss();


void My_UpGrade_STM(void)
{
	if(PGM_Interface == CAN_Selected)
		 MyPGMTab[2](); //PGM_Main_CAN
    else MyPGMTab[1](); //PGM_Main_UART
} //END My_UpGrade_STM();

/* Initialize all peripherals */
void My_Init(void)
{	  //калибровка ADC
	  HAL_Status = HAL_ADCEx_Calibration_Start(&hadc);
	  My_DMA_Init();
	  My_CRC_Init();
	  My_CAN_Init();
	  My_UART_Init();
	  My_TIM_Init();
#ifdef __PVD_Enable
	  My_PVD_Init();
#endif
	  My_FLASH_Init();
	  My_Port_Init();
	  My_VAR_Init();
#ifdef  __EEPROM
	  My_EPROM_Init();
#endif

#ifdef  __Invense
	  My_INV_Init();
#endif
	  Read_IEE_VDC_Const(); // чтение буфера констант из FlashCFG
	  My_Tick_Enable = 1;   // флаг что можно обрабатывать My_Tick
#ifdef  __AGS_SAS
	  CANS_Send_Dummy(); // Проблема с CAN на микроконтроллерах GD32
#endif
} // end My_Init()

void UART_Rx_NotInit(UART_HandleTypeDef *huart, UartTypeDef* UARTx, uint8_t pBuff, uint16_t Size)
{
	if(UARTx->Rx_DMA)
	{ if(huart->RxState != HAL_UART_STATE_BUSY_RX)
	  { UARTx->Rx_DMA = 0;
	    HAL_UART_Receive_DMA(huart, UARTx->Rx_data + pBuff, SCI.Rx_Len);
	  }
	}
}

/* Infinite loop */
void My_Main(void)
{
	if(MainLoop_5ms_Flag)
	{	if(DIA.TP_Select == 1)	_TP_On;
		MainLoop_5ms_Flag = 0;
	    MainLoop_Stop = 0;
	    UartSTM_Send(); // передача в другой STM
		VDC_Input_Var();// должно  стоять до Diagnose_ISO9141()
						// синхронизация Dia_Emul_Fl
#ifdef  __Diag_Kline
#ifdef   __AxisF_Compile
		Buffer_Active_Error(); // Связывает Буфер Active_Faults[] с активными неиспраностями
#endif
	    Diagnose_ISO9141();
#endif
//		VDC_Input_Var();
		TransmissionKTS();
		KoefSpeed();
#ifdef  __AGS_SAS
		AccelX_Estimate();
		AccelY_Estimate();
#endif
		Ackermann();
		SpeedX_Estimate();
		ManeuverFlags();
		SideSlip_Estimate();
		SideSlip_Control();
		Road_Estimate();

		Direct_Yaw_Control();  // DYC
		RollOverProtection();  // ROP
		ABS_Regulate();
#ifdef   __TrailerVDC_Compile
     	TrailerVDC();
#endif
#ifdef  __EBL_Compile
		EBL_Regulate();
#endif
#ifdef   __ASR_Compile
		ASR_Regulate();
#endif
#ifdef   __DBR_Compile
		DBR_Regulate();
		Retarder_Torque_Control();
#endif
#ifdef   __Torque_Compile
		Engine_Torque_Control();
#endif
#ifdef  __HillHolder_Compile
		Hill_Holder_Control();
#endif
#ifdef  __HaltBrake_Compile
		Halt_Brake_Control();
#endif
		Brake_Asist_Control();
#ifdef  __XBR_Compile
		XBR_Control();
#endif
		VDC_Flags();
#ifdef  __AGS_SAS
		CheckError_AGS();     // ошибки AGS
		CheckError_SAS();     // ошибки SAS
		SAS_DoneZero();
		AGS_Calibration();
#endif
		CheckError_BPS();     // ошибки BPS
#ifdef   __PS_ChangeADR
		PS_ChangeADR();
#endif
#ifdef  __CAN_Trailer
		TrailerCAN_Analysis();
		TrailerCAN_Send();
#endif
		SignalValidity();
		ReverseCheck();
		Vehicle_Load();
		GraphCalc();
		Self_Tuning();
		Stop_Light();
		Pcb_Test();
#ifdef  __LIM_Speed
        Speed_Terminal_B7();
        Test_Terminal_B7();
        Limitation_Speed();
//        Proportion_Valve();
#endif
		Button_Switch();
#ifdef  __EEPROM
	    EPROM_Manager();
#endif
	  if(DIA.TP_Select == 1)  _TP_Off;
	}
 	Write_DSC_Const();
	if(!Flag_Reset)	HAL_IWDG_Refresh(&hiwdg);
	UART_Rx_NotInit(&huartSCI, &SCI, SCI.pBuff, SCI.Rx_Len);

} // end My_Main()

void My_Tick(void) // 1ms
{ // HAL_InitTick делается в HAL_Init() первым до всего !!!!
  // введен флаг что можно обрабатывать My_Tick
  // устанавливается в My_Init
	if(My_Tick_Enable)
	{
	  if(DIA.TP_Select == 0) _TP_On;
#ifdef __Invense
#ifdef __Square_Board
	  ICM_SPI1_Read(&SPI_AG);
#endif
#endif
#if defined __AGS_SAS
	  AGS_SAS_UpGrade();
	  Bridge_CAN();
#endif
#if defined __CAN_j1939
      CANJ_Send_Manager();
#endif
      CRC_Flash_Calc();  // 3,5mkc
#if defined __CAN_Trailer
	  CheckError_CANT(); // ошибки CANT 20mkc
#endif
#ifdef __MainLoop_Check
#define   __MainLoop_T	   100    // 0,1c
	  if(MainLoop_Stop < __MainLoop_T)
		 MainLoop_Stop++;
	  if(MainLoop_Stop > __2_Tr)
	  {  MainLoop_Fail = 1;
	     MainLoop_Stop = 200;
	  }
#endif
#ifdef __Invense
	 Invense_AG();
#endif
	 Power_Test();
	 Speed_Wheels();
	 Wheel_Sensor_Test();
	 Diagnose_Command();    // должно стоять перед Switch_Valve()
#ifdef  __EBL_Compile
	 EBL_Press_Control();
#endif
#ifdef   __ASR_Compile
	 ASR_Press_Control();
#endif
	 ABS_Press_Control();
#ifdef   __XBR_Compile
	 XBR_Press_Control();
#endif
	 Modulator_Test();
	 Switch_Valve();
	 LowSide_Switch();   // за Modulator_Test
	 Pressure_Estimate();// модель давления в тормозных камерах
	 Work_Time();        // должно стоять здесь
#ifdef  __EEPROM
	 EPROM_Machine();
#endif
	 if(DIA.TP_Select == 0) _TP_Off;
	}
} // end My_Tick()

#ifdef __Invense
//-----------------------------Invense---------------------------------

void ICM_IniSPI_Write(uint16_t  Delay)
{
	uint8_t  N = (uint32_t)Delay /10;

    //Transmit an amount of data in blocking mode.
// выходит после передачи последнего байта
	SPI_AG.Tx_data[0] = (SPI_AG.Adr) & ~InvSpi_CMD_Read;
	HAL_GPIO_WritePin(CS_ICM_GPIO_Port, CS_ICM_Pin, GPIO_PIN_RESET);
	HAL_SPI_Transmit(&hspi1, SPI_AG.Tx_data, SPI_AG.Sise+1, 10);
	HAL_GPIO_WritePin(CS_ICM_GPIO_Port, CS_ICM_Pin, GPIO_PIN_SET);
	// требуемая задержка
    while(N--) HAL_Delay(10);
  	HAL_IWDG_Refresh(&hiwdg); // Refresh watchdog
} // end ICM_IniSPI_Write

void ICM_SPI1_Read(TxRx_TypeDef*  Spi)
{ // вызывается в myHAL_TIM_IC_CaptureCallback
	Spi->Adr = ACCEL_XOUT_H;
    Spi->Sise  = 15;
	Spi->Tx_data[0] = (Spi->Adr) | InvSpi_CMD_Read;
//	Spi->Cmd |= InvSpi_CMD_Read;
//	HAL_GPIO_WritePin(CS_ICM_GPIO_Port, CS_ICM_Pin, GPIO_PIN_RESET);
	_Port_Off(CS_ICM);   // CS в 0
	HAL_SPI_TransmitReceive_DMA(&hspi1, Spi->Tx_data, Spi->Rx_data, Spi->Sise);

} // end ICM_SPI1_Read()

void My_INV_Init(void)
{
/*
the I2C interface should be disabled by setting the
I2C_IF_DIS configuration bit.
Setting this bit should be performed immediately after waiting
for the time specified by the “Start Up Time for Register Read/Write”
in Section 6.3.
For further information regarding the I2C_IF_DIS
bit, please refer to the MPU-6500 Register Map and
Register Descriptions document.
When using SPI interface, user should use PWR_MGMT_1 (register 107) as well as
SIGNAL_PATH_RESET (register 104) to ensure the reset is performed properly. The sequence
used should be:
1.  Set H_RESET = 1 (register PWR_MGMT_1)
2.  Wait 100ms
3.  Set GYRO_RST = ACCEL_RST = TEMP_RST = 1 (register SIGNAL_PATH_RESET)
4.  Wait 100ms
*/
  // reset the device  the bit will auto clear
	SPI_AG.Adr = PWR_MGMT_1;
	SPI_AG.Tx_data[1] = CLKSEL_20MHz | // Internal 20 MHz oscillator
			            DEVICE_RESET;
	SPI_AG.Sise  = 1;
	ICM_IniSPI_Write(100);  // page 42 - delay 100ms
  // reset gyro, accel, temp
	SPI_AG.Adr = SIGNAL_PATH_RESET;
#if defined(ICM20602)
	SPI_AG.Tx_data[1] = ACCEL_RST | TEMP_RST;
#else
	SPI_AG.Tx_data[1] = GYRO_RST | ACCEL_RST | TEMP_RST;
#endif
	SPI_AG.Sise  = 1;
	ICM_IniSPI_Write(100);

  // set SPI mode by setting I2C_IF_DIS  ; reset DMP, FIFO, SIG ; enable FIFO
#if defined(ICM20602)
	SPI_AG.Adr = USER_CTRL;
	SPI_AG.Tx_data[1] = FIFO_ENABLE | FIFO_RST;// | SIG_COND_RST;
	SPI_AG.Tx_data[2] = CLKSEL_PLL; // обязательно сбросить SLEEP !!!! ICM
	SPI_AG.Sise  = 2;
	ICM_IniSPI_Write(10);
	SPI_AG.Adr = I2C_IF;
	SPI_AG.Tx_data[1] = I2C_DIS; // отличается от других
	SPI_AG.Sise  = 1;
	ICM_IniSPI_Write(10);
#else
	SPI_AG.Adr = USER_CTRL;
	SPI_AG.Tx_data[1] = FIFO_ENABLE |I2C_IF_DIS  | FIFO_RST;// | SIG_COND_RST;
	SPI_AG.Tx_data[2] = CLKSEL_PLL; // обязательно сбросить SLEEP !!!! ICM
	SPI_AG.Sise  = 2;
	ICM_IniSPI_Write(10);
#endif
  // Set Gyro : 2G scale, 1kHz  sampling, 5Hz bandwidth
  // Set Accel: 2G scale, 1kHz sampling, 5Hz cutoff
	SPI_AG.Adr = CONFIG;
	SPI_AG.Tx_data[1] = FIFO_overWrite | EXT_SYNC_disable | GYRO_DLPF_CFG_5HZ;
	SPI_AG.Tx_data[2] = GYRO_FS_250DPS;
	SPI_AG.Tx_data[3] = ACCEL_FS_2G;
	SPI_AG.Tx_data[4] = ACCEL_DLPF_CFG_5HZ;  //нет MPU6000
	SPI_AG.Sise  = 4;
    ICM_IniSPI_Write(10);
// set ODR SAMPLE_RATE = 1 kHz
	SPI_AG.Adr = SMPLRT_DIV;
	SPI_AG.Tx_data[1] = ODR_1000HZ;//ODR_500HZ;
	SPI_AG.Sise  = 1;
    ICM_IniSPI_Write(10);
  // enable temperature, gyro, and accelerometer FIFO output
	SPI_AG.Adr = FIFO_EN;
#if defined(ICM20602)
    SPI_AG.Tx_data[1] = GYRO_FIFO_EN | ACCEL_FIFO_EN;
#else
    SPI_AG.Tx_data[1] = TEMP_FIFO_EN | GYRO_X_FIFO_EN | GYRO_Y_FIFO_EN | GYRO_Z_FIFO_EN | ACCEL_FIFO_EN;
#endif
    SPI_AG.Sise  = 1;
    ICM_IniSPI_Write(10);
  // set INT_PIN_CFG & INT_ENABLE
	SPI_AG.Adr = INT_PIN_CFG;
    SPI_AG.Tx_data[1] =
    	PUSHPULL |
				        ACTL |            // The logic level for INT/DRDY pin is active low.
		                INT_ANYRD_2CLEAR; // Interrupt status is cleared
                                          // if any read operation is performed.
    SPI_AG.Tx_data[2] = RAW_RDY_EN; // DATA_RDY_INT_EN 0x38 регистр INT_ENABLE
    SPI_AG.Sise  = 2;
    ICM_IniSPI_Write(10);
    // speed up to take data 9MBits/s
    hspi1.Init.BaudRatePrescaler = SPI_BAUDRATEPRESCALER_4;
    HAL_SPI_Init(&hspi1);

} // End My_INV_Init()

void Invense_AG(void)
{ // вызывается в My_Tick()

	  ICM_AG.Temp = (int32_t)ICM_20602.Temp / INV_TEMP_Sensitivity +
				                                       INV_TEMP_Offset;
	  // масштабирование
	  ICM_AG.AccelX = ((int32_t)ICM_20602.AccelX * (int32_t)AccXScale)/65536;
	  ICM_AG.AccelY = ((int32_t)ICM_20602.AccelY * (int32_t)AccYScale)/65536;
	  ICM_AG.AccelZ = ((int32_t)ICM_20602.AccelZ * (int32_t)AccZScale)/65536;
	  ICM_AG.GyroX = ((int32_t)ICM_20602.GyroX * (int32_t)GyroXScale)/65536;
	  ICM_AG.GyroY = ((int32_t)ICM_20602.GyroY * (int32_t)GyroYScale)/65536;
	  ICM_AG.GyroZ = ((int32_t)ICM_20602.GyroZ * (int32_t)GyroZScale)/65536;

} // End Invense_AG()
#endif
//------------------------End Invense--------------------------------

void     DIA_ICM_AG_Oss(void)
{ // вызывается в DIA_Oss() MySystem.c
	// первая строка в Осциллографе
	UartDIA.Tx_data[0] = _Hi_16(ICM_AG.AccelX);
	UartDIA.Tx_data[3] = _Hi_16(ICM_AG.AccelY);
	UartDIA.Tx_data[6] = _Hi_16(ICM_AG.AccelZ);
	UartDIA.Tx_data[9] = _Hi_16(ICM_AG.Temp);//=0
	// вторая строка в Осциллографе
	UartDIA.Tx_data[1] = _Lo_16(ICM_AG.AccelX);
	UartDIA.Tx_data[4] = _Lo_16(ICM_AG.AccelY);
	UartDIA.Tx_data[7] = _Lo_16(ICM_AG.AccelZ);
	UartDIA.Tx_data[10] =_Lo_16(ICM_AG.Temp);
	// третья строка в Осциллографе
	UartDIA.Tx_data[2] = _Hi_16(ICM_AG.GyroX);
	UartDIA.Tx_data[5] = _Hi_16(ICM_AG.GyroY);
	UartDIA.Tx_data[8] = _Hi_16(ICM_AG.GyroZ);
	UartDIA.Tx_data[11]= SCI_ICM_AG_Cnt;
	// четвертая строка в Осциллографе
	UartDIA.Tx_data[12] =_Lo_16(ICM_AG.GyroX);
	UartDIA.Tx_data[13] =_Lo_16(ICM_AG.GyroY);
	UartDIA.Tx_data[14] =_Lo_16(ICM_AG.GyroZ);
	UartDIA.Tx_data[15] = SAS.Zero.Phase;//SCI_RxBuff[48];//(UartSCI_Rx_Length-1)];
	// пятая строка в Осциллографе
	UartDIA.Tx_data[16] = 5;//_Hi_16(Acc_X_sen);
	UartDIA.Tx_data[17] = cICM.Tx_Cnt;
	UartDIA.Tx_data[18] = cICM.Rx_Cnt;
	UartDIA.Tx_data[19] = AGS.Calibr.Phase;
	// шестая строка в Осциллографе
	UartDIA.Tx_data[20] = 6;
	UartDIA.Tx_data[21] = cSPI1.Tx_Cnt;
	UartDIA.Tx_data[22] = cSPI1.Rx_Cnt;
}

void     DIA_AGS_Oss(void)
{ // вызывается в DIA_Oss() MySystem.c
	// первая строка в Осциллографе
	UartDIA.Tx_data[0] = _Hi_16(CANS.SENS.AccelX);
	UartDIA.Tx_data[3] = _Hi_16(CANS.SENS.AccelY);
	UartDIA.Tx_data[6] = _Hi_16(CANS.SENS.AccelZ);
	UartDIA.Tx_data[9] = _Hi_16(CANS.SENS.Temp);//=0
	// вторая строка в Осциллографе
	UartDIA.Tx_data[1] = _Lo_16(CANS.SENS.AccelX);
	UartDIA.Tx_data[4] = _Lo_16(CANS.SENS.AccelY);
	UartDIA.Tx_data[7] = _Lo_16(CANS.SENS.AccelZ);
	UartDIA.Tx_data[10] =_Lo_16(CANS.SENS.Temp);
	// третья строка в Осциллографе
	UartDIA.Tx_data[2] = _Hi_16(CANS.SENS.GyroX);
	UartDIA.Tx_data[5] = _Hi_16(CANS.SENS.GyroY);
	UartDIA.Tx_data[8] = _Hi_16(CANS.SENS.GyroZ);
	UartDIA.Tx_data[11]= cCANS.Rx_Cnt;
	// четвертая строка в Осциллографе
	UartDIA.Tx_data[12] =_Lo_16(CANS.SENS.GyroX);
	UartDIA.Tx_data[13] =_Lo_16(CANS.SENS.GyroY);
	UartDIA.Tx_data[14] =_Lo_16(CANS.SENS.GyroZ);
	UartDIA.Tx_data[15] = SAS.Zero.Phase;//SCI_RxBuff[48];//(UartSCI_Rx_Length-1)];
	// пятая строка в Осциллографе
	UartDIA.Tx_data[16] = _OssW(CANS.SENS.GyroX);
	UartDIA.Tx_data[17] = _OssW(CANS.SENS.GyroY);
	UartDIA.Tx_data[18] = _OssW(CANS.SENS.GyroZ);
	UartDIA.Tx_data[19] = AGS.Calibr.Phase;
	// шестая строка в Осциллографе
	UartDIA.Tx_data[20] = _OssA(CANS.SENS.AccelX);//;
	UartDIA.Tx_data[21] = _OssA(CANS.SENS.AccelY);//;
	UartDIA.Tx_data[22] = _OssA(CANS.SENS.AccelZ);//;
	UartDIA.Tx_data[23] = CANS.AGS.IAM_TEMP;//6;
}

void     DIA_CRC_Oss(void)
{ // вызывается в DIA_Oss() MySystem.c
	// первая строка в Осциллографе
	UartDIA.Tx_data[0] = _B3_32(Config_CRC_MC2);
	UartDIA.Tx_data[3] = _B2_32(Config_CRC_MC2);
	UartDIA.Tx_data[6] = _B1_32(Config_CRC_MC2);
	UartDIA.Tx_data[9] = _B0_32(Config_CRC_MC2);
	// вторая строка в Осциллографе
	UartDIA.Tx_data[1] = _B3_32(Config_CRC);
	UartDIA.Tx_data[4] = _B2_32(Config_CRC);
	UartDIA.Tx_data[7] = _B1_32(Config_CRC);
	UartDIA.Tx_data[10] =_B0_32(Config_CRC);
	// третья строка в Осциллографе
	UartDIA.Tx_data[2] = CRC_Sel;
	UartDIA.Tx_data[5] = cCONFIG.Rx_Cnt; // счетчик DMAcrc_Cplt
	UartDIA.Tx_data[8] = _B1_32(EPROM.CSum);
	UartDIA.Tx_data[11]= _B0_32(EPROM.CSum);
	// четвертая строка в Осциллографе
	UartDIA.Tx_data[12] = _B3_32(Flash_CRC);
	UartDIA.Tx_data[13] = _B2_32(Flash_CRC);
	UartDIA.Tx_data[14] = _B1_32(Flash_CRC);
	UartDIA.Tx_data[15] = _B0_32(Flash_CRC);
	// пятая строка в Осциллографе
	UartDIA.Tx_data[16] = _B3_32(PGM_CRC_MC2);
	UartDIA.Tx_data[17] = _B2_32(PGM_CRC_MC2);
	UartDIA.Tx_data[18] = _B1_32(PGM_CRC_MC2);
	UartDIA.Tx_data[19] = _B0_32(PGM_CRC_MC2);//8;
}
void     DIA_SCI_Oss(void)
{ // вызывается в DIA_Oss() MySystem.c
	// первая строка в Осциллографе
	UartDIA.Tx_data[0] = SCI_RxBuff[0];
	UartDIA.Tx_data[3] = _Lo_16(SCI_Loss_Sinchro);
	UartDIA.Tx_data[6] = cUartDIA.Err_Cnt;
	UartDIA.Tx_data[9] = DIA.MC2.XOR_Tx; //XOR Tx MC2
	// вторая строка в Осциллографе
	UartDIA.Tx_data[1] = DIA.MC2.SCI_Rx_data_0;
	UartDIA.Tx_data[4] = DIA.MC2.SCI_Loss_Sinchro;
	UartDIA.Tx_data[7] = cUartSCI.Err_Cnt;//
	UartDIA.Tx_data[10] = SCI.Rx_XOR;
	// третья строка в Осциллографе
	UartDIA.Tx_data[2] = SCI_Err_SR; //статус ошибки
	UartDIA.Tx_data[5] = SCI.TimeOut;
	UartDIA.Tx_data[8] = SCI_Rx_Cnt;
	UartDIA.Tx_data[11]= cUartSCI.Tx_Cnt;
	// четвертая строка в Осциллографе
	UartDIA.Tx_data[12] = Uart_Flag;
	UartDIA.Tx_data[13] = cUartDIA.Rx_Cnt;
	UartDIA.Tx_data[14] = DIA.MC2.SCI_Rx_Cnt;
	UartDIA.Tx_data[15] = DIA.MC2.SCI_Tx_Cnt;
	// пятая строка в Осциллографе
	UartDIA.Tx_data[16] = DIA.MC2.UartFlag;
	UartDIA.Tx_data[17] = DIA.MC2.Rx_Cnt;
	UartDIA.Tx_data[18] = DIA.MC2.Phase;
	UartDIA.Tx_data[19] = DIA.MC2.RX_Command;
	// шестая строка в Осциллографе
	UartDIA.Tx_data[20] = DIA.RX.Num_MC;
	UartDIA.Tx_data[21] = UpGrade.Phase;//2;
	UartDIA.Tx_data[22] = DIA.Phase;
	UartDIA.Tx_data[23] = DIA.RX.Command;
}
void     DIA_EPROM_Oss(void)
{ // вызывается в DIA_Oss() MySystem.c
	// первая строка в Осциллографе
	UartDIA.Tx_data[0] = EPROM_Request;
	UartDIA.Tx_data[3] = EPROM_Compleet;
	UartDIA.Tx_data[6] = EPROM.WR.Tout;
	UartDIA.Tx_data[9] = (*(volatile uint32_t*) (0x20009000));//1;
	// вторая строка в Осциллографе
	UartDIA.Tx_data[1] = EPROM.Phase;
	UartDIA.Tx_data[4] = EPROM.RD.Phase;
	UartDIA.Tx_data[7] = EPROM.WR.Phase;
	UartDIA.Tx_data[10]= EPROM.BlockON_Cnt;//System_F5;
	// третья строка в Осциллографе
	UartDIA.Tx_data[2] = _B1_32(EPROM.CSum);
	UartDIA.Tx_data[5] = _B0_32(EPROM.CSum);
	UartDIA.Tx_data[8] = _B1_32(EPROM.WR.CSum);
	UartDIA.Tx_data[11]= _B0_32(EPROM.WR.CSum);
	// четвертая строка в Осциллографе
	UartDIA.Tx_data[12] = 0;//_B1_32(Power.EN5V_State);//Active_Faults[35];
	UartDIA.Tx_data[13] = 0;//Power.Phase;
	UartDIA.Tx_data[14] = EPROM.WR.Pe;
	UartDIA.Tx_data[15] = EPROM.WR.Ne;
	// пятая строка в Осциллографе
	UartDIA.Tx_data[16] = _B3_32(Vehicle.WorkTime);
	UartDIA.Tx_data[17] = _B2_32(Vehicle.WorkTime);
	UartDIA.Tx_data[18] = _B1_32(Vehicle.WorkTime);
	UartDIA.Tx_data[19] = _B0_32(Vehicle.WorkTime);//8;
	// шестая строка в Осциллографе
	UartDIA.Tx_data[20] = 1;
	UartDIA.Tx_data[21] = 2;
	UartDIA.Tx_data[22] = 3;
	UartDIA.Tx_data[23] = CANS.Stend_Test[4];//EngineTorque.Value +__OffSet8;
}
void     DIA_LIM_Oss(void)
{ // вызывается в DIA_Oss() MySystem.c
	// первая строка в Осциллографе
	UartDIA.Tx_data[0] = _Hi_16(LIM.B7.Duration);
	UartDIA.Tx_data[3] = _B2_32(LIM.B7.Period);//_Lo_16(LIM.B7.Duration);
	UartDIA.Tx_data[6] = _B1_32(LIM.B7.Period);//s_B7_TCO_Error;
	UartDIA.Tx_data[9] = LIM_B7_Flags;
	// вторая строка в Осциллографе
	UartDIA.Tx_data[1] = _Hi_16(LIM.B7.Speed);//_Lo_16(LIM.B7.Tim_HiCnt);
	UartDIA.Tx_data[4] = _Lo_16(LIM.B7.Speed);//_B2_32(LIM.B7.Period);
	UartDIA.Tx_data[7] = _Hi_16(LIM.Speed.Est);//_B1_32(LIM.B7.Period);
	UartDIA.Tx_data[10]= s_B7_TCO_Error;//_B0_32(LIM.B7.Period);
	// третья строка в Осциллографе
	UartDIA.Tx_data[2] = _Hi_16(LIM.Speed.ThresHold);//_Hi_16(LIM.B7.Speed);
	UartDIA.Tx_data[5] = _Hi_16(LIM.Speed.DeriVative);//_Lo_16(LIM.B7.Speed);
	UartDIA.Tx_data[8] = _Hi_16(LIM.PK.PWM.Des);//;
	UartDIA.Tx_data[11]= LIM.Phase;//_Lo_16(LIM.Speed.Est);
	// четвертая строка в Осциллографе
    UartDIA.Tx_data[12] = _Hi_16(LIM.PK.PWM.Period);
    UartDIA.Tx_data[13] = _Hi_16(LIM.PK.PWM.OffTime);
    UartDIA.Tx_data[14] = _Hi_16(LIM.PK.PWM.OnTime);
    UartDIA.Tx_data[15] = LIM_PK_Flags;
	// пятая строка в Осциллографе
	UartDIA.Tx_data[16] = Wheel_FL.Capture.Speed /64;//LIM.Phase;
	UartDIA.Tx_data[17] = Wheel_FL.Speed /64;//_Hi_16(LIM.PK.PWM.Period);
	UartDIA.Tx_data[18] = LIM.PK.Oss.On_Val;
	UartDIA.Tx_data[19] = LIM.PK.Oss.Off_Val;
	// шестая строка в Осциллографе
	UartDIA.Tx_data[20] = CANS.Stend_Test[6];//_Hi_16(Wheel_RL.Speed);
	UartDIA.Tx_data[21] = CANS.Stend_Test[7];//_Lo_16(Wheel_RL.Speed);
	UartDIA.Tx_data[22] =  Wheel_FL.Capture.Period / 8;
	UartDIA.Tx_data[23] = CANS.Stend_Test[4];//EngineTorque.Value +__OffSet8;
}

// Page Write 32 bytes
#define  __Phase_Start    1
#define  __Phase_EnableWR 2
#define  __Phase_RD_SR    3
#define  __Phase_Write    4
#define  __Phase_Busy     5
#define  __Phase_Lock     6
#define  __Phase_End      7

#ifdef  __SPI_Compile
void HAL_SPI_TxCpltCallback(SPI_HandleTypeDef *hspi)
{
	cSPI1.Tx_State = HAL_SPI_GetState(hspi);
	cSPI1.Tx_Cnt++;
#ifdef  __Invense
	// сбрасываем SPI CS  если была запись в ACC_GIRO
	if(!(SPI_AG.Cmd & InvSpi_CMD_Read))		//MPU
	{
		HAL_GPIO_WritePin(CS_ICM_GPIO_Port, CS_ICM_Pin, GPIO_PIN_SET);
		SPI_AG.Cmd = Inv_CMD_Nul;
	}
#endif
}

void HAL_SPI_TxRxCpltCallback(SPI_HandleTypeDef *hspi)
{
	// время выполнения 2mks
	if(DIA.TP_Select == 9)	_TP_On;
	cSPI1.Rx_State =HAL_SPI_GetState(hspi);
	cSPI1.Tx_Cnt++;

#ifdef  __EEPROM
	 // время выполнения 1,5mks
    if(HAL_GPIO_ReadPin(CS_EPROM_GPIO_Port, CS_EPROM_Pin) == GPIO_PIN_RESET)
    {    _Port_On(CS_EPROM);   // CS в единицу
	  if(EPROM.WR.Phase)
	  { //  EEPROM_Write_Page();
		EPROM.WR.Phase = __Phase_Busy;
	  }
	  if(EPROM.RD.Phase)
	  {  EPROM.RD.Cmpl = 1;
	     cSPI1.Rx_Cnt++;
	  }
    }
#endif
#ifdef  __Invense
    if(HAL_GPIO_ReadPin(CS_ICM_GPIO_Port, CS_ICM_Pin) == GPIO_PIN_RESET)
    { // сбрасываем SPI CS
      // время выполнения 1,5mks
      _Port_On(CS_ICM);   // CS в единицу
      ICM_20602.AccelX = (int16_t)(SPI_AG.Rx_data[1]<<8) + (int16_t)SPI_AG.Rx_data[2];
      ICM_20602.AccelY = (int16_t)(SPI_AG.Rx_data[3]<<8) + (int16_t)SPI_AG.Rx_data[4];
      ICM_20602.AccelZ = (int16_t)(SPI_AG.Rx_data[5]<<8) + (int16_t)SPI_AG.Rx_data[6];
      ICM_20602.Temp =   (int16_t)(SPI_AG.Rx_data[7]<<8) + (int16_t)SPI_AG.Rx_data[8];
      ICM_20602.GyroX =  (int16_t)(SPI_AG.Rx_data[9]<<8) + (int16_t)SPI_AG.Rx_data[10];
      ICM_20602.GyroY = (int16_t)(SPI_AG.Rx_data[11]<<8) + (int16_t)SPI_AG.Rx_data[12];
      ICM_20602.GyroZ = (int16_t)(SPI_AG.Rx_data[13]<<8) + (int16_t)SPI_AG.Rx_data[14];
      cICM.Rx_Cnt++;
    }
#endif
    if(DIA.TP_Select == 9)	_TP_Off;
}

void HAL_SPI_ErrorCallback(SPI_HandleTypeDef *hspi)
{
	cSPI1.Err_Cnt++;
}
#endif

#ifdef  __EEPROM
//------------------------   EEPROM  --------------------------------
// SPI Modes (0,0)
// Clock polarity (CPOL) and clock phase (CPHA)specified as '0'
// 	Baud Rate 9.0 MBits/s

void EPROM_Write_Status(void)
{  // время выполнения 8,5мкс  IT
    _Port_Off(CS_EPROM);
    SPI_TX_Data[0] = __WRSR; // Write Status Register
    SPI_TX_Data[1] = EPROM_WR_Status;
    HAL_SPI_TransmitReceive(&hspi1, SPI_TX_Data, EPROM.RD.Buff,2,2);
	_Port_On(CS_EPROM);   // CS в единицу
} // end EEPROM_Write_Status()

// Read Status Register
void    EPROM_RDSR(void)
{
	_Port_Off(CS_EPROM);
    SPI_TX_Data[0] = __RDSR; // Read Status Register
    SPI_TX_Data[1] = 85;
    HAL_SPI_TransmitReceive(&hspi1, SPI_TX_Data, EPROM.RD.Buff,2,2);
    EPROM_RD_Status = EPROM.RD.Buff[1];
	_Port_On(CS_EPROM);   // CS в единицу

} // end EEPROM_RDSR()

void EPROM_Write_Page(void)
{ // вызывается в SPI_TxRxCpltCallback
  //              EEPROM_Manager()
	// После завершения цикла записи
	// автоматически возвращается в состояние запрета записи.
	// разрешаем запись
    _Port_Off(CS_EPROM);
    SPI_TX_Data[0] = __WREN; // Write Status Register
    HAL_SPI_TransmitReceive(&hspi1, SPI_TX_Data, EPROM.RD.Buff,1,2);
	_Port_On(CS_EPROM);   // CS в единицу
	//запись
	SPI_TX_Data[0] = __WRITE; // Write Data to Memory
	SPI_TX_Data[1] = _Hi_16(EPROM.WR.Addr);
	SPI_TX_Data[2] = _Lo_16(EPROM.WR.Addr);
	for (uint8_t i = 0; i < EPROM.WR.Size; i++)
    SPI_TX_Data[3+i] = EPROM.WR.Buff[i];
	EPROM.WR.SPI_Busy = 1;
	EPROM_Busy = 1;
	EPROM.WR.Tout = 15; //3
	_Port_Off(CS_EPROM);  // CS в ноль
	HAL_SPI_TransmitReceive_DMA(&hspi1, SPI_TX_Data, EPROM.RD.Buff,(EPROM.WR.Size+3));

} // end EPROM_Write_Page()

void EPROM_Faults(void)
{	// установка запроса на запись неисправностей
	if(!Request_WR_ERROR &&
	   !EPROM.Phase)
	for (uint8_t i = 0; i < __Errors_Num; i++)
	{ // проверяем активные неисправности
	  if(((Active_Faults[i] ^ Passive_Faults[i]) &
		   Active_Faults[i]))
	  { // есть новые активные неисправности
		for (uint8_t k = 0; k < 8; k++)  // позиция неисправности
		{ uint16_t M = 0x01 << k; // маска
		  if((Active_Faults[i] & M) &&   // есть в активных
		   !(Passive_Faults[i] & M))     // нет в пассивных
		  { // есть незаписанные активные неисправности
		    EPROM.WR.Ne = i; // номер неисправности
		    EPROM.WR.Pe = k; // позиция бита неисправности
			Request_WR_ERROR = 1;
			goto Exit;
		  }
		}
	  }
	}
	Exit: ; // метка выхода
} // end EPROM_Faults();

#define  __Mask_WR_B0_NL    1
#define  __Mask_WR_B0_NH    2
#define  __Mask_WR_B123     4
void EPROM_WR_4byte(TypeDef_4byte* S)
{
	S->Mask_WR = 0;
	S->B0_NL++;
	S->Mask_WR |= __Mask_WR_B0_NL; // признак записи B0_NL
    if(S->B0_NL > 0x0F)
	{ S->B0_NL = 0;
	  S->B0_NH += 0x10;
	  S->Mask_WR |= __Mask_WR_B0_NH; // признак записи B0_NH
	  if(S->B0_NH > 0x0F0)
	  { S->B0_NH = 0;
	    S->B1++;
	    S->Mask_WR |= __Mask_WR_B123; // признак записи B123
	    if(S->B1 > 0x0F0)
	    { S->B1 = 0;
	      S->B2++;
	      if(S->B2 > 0x0F0)
	      { S->B2 = 0;
	        S->B3++;
	      }
	    }
	  }
	}
} // end EPROM_WR_4byte

uint32_t  EPROM_RD_4byte(TypeDef_4byte* S, uint16_t A, uint8_t NL)
{
	{ S->B3 = EPROM.Data[A+0];
	  S->B2 = EPROM.Data[A+1];
	  S->B1 = EPROM.Data[A+2];
	  S->B0_NH = EPROM.Data[A+3];
	  S->B0_NL = EPROM.Data[A+16+(S->B0_NH/16)];
	}
	uint32_t Ret =
	   ((uint32_t)S->B3 << 24) + // B3
	   ((uint32_t)S->B2 << 16) + // B2
	   ((uint32_t)S->B1 << 8) +  // B1
	   (uint32_t)S->B0_NH;       // B0_NH
    if(NL) Ret +=S->B0_NL;	     // B0_NL
	return Ret;
} // end EPROM_RD_4byte

void EPROM_Odometer(void)
{
	uint8_t ChD = 0;
	//  установкa пробега
	if(Dia_RunaWay)
	{  Dia_RunaWay = 0; // общий флаг установки пробега
	  if(TCO.HDRH_Distance)
	  { Wheel_FL.Way.Dia = 1;
	    Wheel_FR.Way.Dia = 1;
	    Wheel_RL.Way.Dia = 1;
	    Wheel_RR.Way.Dia = 1;
	    Vehicle.RunaWay = TCO.HDRH_Distance;
	    ChD = 1;
	  }
	}
	// находим пробег
	Vehicle.Front_ODO = Wheel_FL.Way.Distance;
	if(Vehicle.Front_ODO < Wheel_FR.Way.Distance)
	   Vehicle.Front_ODO = Wheel_FR.Way.Distance;
	// наибольший
	if(Vehicle.RunaWay < Vehicle.Rear_ODO)
	   Vehicle.RunaWay = Vehicle.Rear_ODO;
	if(Vehicle.RunaWay < Vehicle.Front_ODO)
	   Vehicle.RunaWay = Vehicle.Front_ODO;

	// установка запроса на запись пробега
    if(ChD ||              // диагностическая установкa пробега
      EPROM.ODO_Last < Vehicle.RunaWay) // произошло изменение
	{ EPROM.ODO_Last = Vehicle.RunaWay;
	  EPROM_WR_4byte(&EPROM.ODO);
	  Request_WR_ODO = 1;
	}
} // end EPROM_Odometer();

#define  __Phase_WR_RunaWay    1
#define  __Phase_WR_WorkTime   2
#define  __Phase_WR_DIA        3
#define  __Phase_WR_DM3        4
#define  __Phase_WR_ERROR      5
#define  __Phase_WR_ErrTime    6
#define  __Phase_WR_ErrCnt     7
#define  __Phase_WR_LastErr    8
#define  __Phase_WR_BlockOFF   9
#define  __Phase_WR_CSsum      10
#define  __Phase_RD_All        11

void EPROM_Manager(void)
{
    uint16_t   A;
    TypeDef_4byte Tmp_4byte;
	if(BlockON_RD_EPROM)//RD_EPROM_Compleet)
	{ //  установка запроса записи Work_Time
	  Work_Time();
	  // установка запроса на запись пробега
	  EPROM_Odometer();
	  // установка запроса на запись неисправностей
	  EPROM_Faults();
	}

	if(EPROM.RD.Phase == 2 &&
	   EPROM.RD.Cmpl)
	{ // вторая фаза выполняется 150мкс !!!
        //  копируем и определяем контрольную сумму
        EPROM.RD.CSum = 0;
        for (A = 0; A < __EPROM_Size; A++)
        { // копируем
         EPROM.Data[A] = EPROM.RD.Buff[A+3];
         if(A < __EPROM_Adr_CSum)
  	     EPROM.RD.CSum += EPROM.Data[A];
        }
      // обсуживание по включению блока
      if(!BlockON_RD_EPROM)
      {   BlockON_RD_EPROM = 1;
        // контрольная сумма
  	  EPROM.WR.CSum = EPROM.RD.CSum; // для диагностики
  	  EPROM.CSum = EPROM_RD_4byte(&Tmp_4byte, __EPROM_Adr_CSum, 0);
        // проверяем контрольную сумму
  	  // после программирования выставляется ошибка
  	  // стенд ставит ошибку см. Power_Test
  	  if(EPROM.CSum != EPROM.RD.CSum && // не верна контрольная сумма
  		    PGM_Sign!= __PGM_Sign_Data) // признак программирования
	      // ошибки датчиков предыдущего включения
        for (uint16_t i = 0; i < 6; i++) // 6
        { uint8_t M = 0x01 << i;         // маска
          if(EPROM.Data[__EPROM_Adr_LastErr+i*2] ||
             EPROM.Data[__EPROM_Adr_LastErr+i*2+1])
      	   WSS_Last_Error |= M;
        }
        // инициализируем пробег из EPROM
        Vehicle.RunaWay = EPROM_RD_4byte(&EPROM.ODO, __EPROM_Adr_ODO, 1);
        if(Vehicle.RunaWay == Blank)
           Vehicle.RunaWay = 0;
        EPROM.ODO_Last = Vehicle.RunaWay;
        NU_RunaWay_Fl = 1; // будет записан пробег в колеса
        // инициализируем время наработки из EPROM
        Vehicle.WorkTime = EPROM_RD_4byte(&EPROM.WorkTime, __EPROM_Adr_WorkTime, 1);
        // инициализируем счетчик записей из EPROM
        EPROM.WriteCnt = EPROM_RD_4byte(&Tmp_4byte, __EPROM_Adr_Write_Cnt, 0);
        // инициализируем счетчик включений блока из EPROM
        EPROM.BlockON_Cnt = EPROM_RD_4byte(&Tmp_4byte, __EPROM_Adr_BlockON_Cnt, 0);
      }
      EPROM.Phase = 0;
      EPROM.RD.Phase = 0;
    }
}
void EPROM_Machine(void)
{// вызывается в My_Main() не работает ??
	uint8_t i;

    // Машина EPROM
	if(EPROM.WR.Phase)
	{ // обработка записи
      // ждем завершения записи в CAT25080
	  if(EPROM.WR.Phase ==__Phase_Busy)
	     EPROM_RDSR(); // чтениe Статус Регистра
	  if((!EPROM.WR.Tout--) || // выход по Tout
		  !EPROM_Busy)         // выход по Busy
      { // запись выполнена
		EPROM.WR.Phase = 0; //__Phase_End;
		EPROM.WriteCnt++;
		if(Request_WR_ERROR)
		{ if(EPROM.ErrPh)
		     EPROM.Phase = EPROM.ErrPh;
 		  else   // была запись неисправности
		  {  EPROM.Phase = 0;
			 Request_WR_ERROR = 0;
		  }
		}
		else
		if(Request_WR_DM3)
		{ if(EPROM.DM3Ph)
		     EPROM.Phase = EPROM.DM3Ph;
 		  else   // была запись DM3
		  {  EPROM.Phase = 0;
		     Request_WR_DM3 = 0;
		  }
		}
		else // была запись выключения блока
	    if(Request_WR_BlOff)
		{  Request_WR_BlOff = 0;
		   Request_Wr_CSsum = 1;
		   Request_RD_All = 1;  // нужно прочитать чтобы получить CSsum
		   EPROM.Phase = 0;
		}
	    else
	    if(Request_Wr_CSsum)
	    {  Request_Wr_CSsum = 0;
		   EPROM.BlockOFF_WR_Cmpl = 1; // для снятия подпоры 5В
	    }
 		else   // завершение записи
 		{  EPROM.Phase = 0;
	       Request_RD_All = 1; // после записи читаем EPROM
	    }
      }
	}
	else// нет записи
	{ if(!EPROM.Phase && !EPROM.RD.Phase)
	  { // машина свободна
		if(Request_RD_All)  // обработка запроса  чтение
		{  Request_RD_All = 0;
		  EPROM.Phase = __Phase_RD_All;
	      EPROM.RD.Phase = 1; // обходим заглушку
		}
		else
		// обработка запросов записи
		if(Request_WR_ODO)  // обработка запроса записи RunaWay
		{  Request_WR_ODO = 0;
		   EPROM.Phase = __Phase_WR_RunaWay;
		   goto EPROM_Phase;
		}
		else
		if(Request_WR_Time)  // обработка запроса записи Work_Time
		{  Request_WR_Time = 0;
		   EPROM.Phase = __Phase_WR_WorkTime;
		   goto EPROM_Phase;
		}
		else
		if(Request_WR_DIA)  // обработка запроса записи из Diagnose_ISO9141
		{  Request_WR_DIA = 0;
		   EPROM.Phase = __Phase_WR_DIA;
		   goto EPROM_Phase;
		}
		else
		if(Request_WR_DM3) // обработка запроса стирания неисправностей
		{ // Request_WR_DM3 сбросится после записи
		   EPROM.DM3_Addr = __EPROM_Adr_PaseErr;
		   EPROM.Phase = __Phase_WR_DM3;
		   goto EPROM_Phase;
		}
		else
		if(Request_WR_ERROR)  // обработка запроса записи неисправностей
		{//  Request_WR_ERROR  сбросится после записи неисправности
		   EPROM.Phase = __Phase_WR_ERROR;
		   goto EPROM_Phase;
		}
		else
		if(Request_WR_BlOff)  // обработка запроса записи счетчика WR
		{  // пишется раз в 10 минут на 11 лет
		   // будем писать при выключении блок
		   EPROM.Phase = __Phase_WR_BlockOFF;
		   goto EPROM_Phase;
		}
		else
		if(Request_Wr_CSsum)
		   EPROM.Phase = __Phase_WR_CSsum;
	  }
	  EPROM_Phase: ;
	  switch (EPROM.Phase)
      { case 0:

    	    break;
        case __Phase_WR_RunaWay:
          	if(EPROM.ODO.Mask_WR & __Mask_WR_B0_NH) // признак записи B0_NH
            { EPROM.ODO.Mask_WR &=~__Mask_WR_B0_NH;
              EPROM.WR.Addr = __EPROM_Adr_ODO;
         	  EPROM.WR.Size = 4;
         	  EPROM.WR.Buff[0] = EPROM.ODO.B3;
         	  EPROM.WR.Buff[1] = EPROM.ODO.B2;
         	  EPROM.WR.Buff[2] = EPROM.ODO.B1;
        	  EPROM.WR.Buff[3] = EPROM.ODO.B0_NH;
        	  EPROM.WR.Request = 1;
            }
          	else
            if(EPROM.ODO.Mask_WR & __Mask_WR_B0_NL) // признак записи B0_NL
            { EPROM.ODO.Mask_WR &=~__Mask_WR_B0_NL;
              // скользящий адрес определяется B0_NH
              EPROM.WR.Addr =__EPROM_Adr_ODO + 16 + EPROM.ODO.B0_NH /16;
              EPROM.WR.Size = 1;
              EPROM.WR.Buff[0] = EPROM.ODO.B0_NL;
              EPROM.Phase = 0;
              EPROM.WR.Request = 1;
            }
            break;
        case __Phase_WR_WorkTime:
          	if(EPROM.WorkTime.Mask_WR & __Mask_WR_B0_NH) // признак записи B0_NH
            { EPROM.WorkTime.Mask_WR &=~__Mask_WR_B0_NH;
              EPROM.WR.Addr = __EPROM_Adr_WorkTime;
         	  EPROM.WR.Size = 4;
         	  EPROM.WR.Buff[0] = EPROM.WorkTime.B3;
         	  EPROM.WR.Buff[1] = EPROM.WorkTime.B2;
         	  EPROM.WR.Buff[2] = EPROM.WorkTime.B1;
        	  EPROM.WR.Buff[3] = EPROM.WorkTime.B0_NH;
        	  EPROM.WR.Request = 1;
            }
          	else
            if(EPROM.WorkTime.Mask_WR & __Mask_WR_B0_NL) // признак записи B0_NL
            { EPROM.WorkTime.Mask_WR &=~__Mask_WR_B0_NL;
              EPROM.WR.Addr =__EPROM_Adr_WorkTime + 16 + EPROM.WorkTime.B0_NH /16;
              EPROM.WR.Size = 1;
              EPROM.WR.Buff[0] = EPROM.WorkTime.B0_NL;
              EPROM.WR.Request = 1;
            }
            break;
        case __Phase_WR_DIA:
     	    EPROM.WR.Addr = DIA.EPROM.WR_Addr;
     	    EPROM.WR.Size = DIA.EPROM.Size;
     	    for (uint8_t i = 0; i < DIA.EPROM.Size; i++)
     	    EPROM.WR.Buff[i] = DIA.EPROM.Data[i];
     	    EPROM.WR.Request = 1;
            break;
        case __Phase_WR_DM3:
        	EPROM.WR.Addr = EPROM.DM3_Addr;
        	EPROM.WR.Size = __PageSize;
     	    for (uint8_t i = 0; i < __PageSize; i++)
     	    EPROM.WR.Buff[i] = 0;
     	    EPROM.DM3_Addr += __PageSize;
     	    if(EPROM.DM3_Addr < __EPROM_Adr_EndErr)
      	    {  EPROM.WR.Request = 1;
      	       EPROM.DM3Ph = __Phase_WR_DM3;
      	    }
     	    else EPROM.DM3Ph = 0;
            break;
        case __Phase_WR_ERROR:
        	// EPROM.WR.M номер неисправности
     	    EPROM.WR.Addr = __EPROM_Adr_PaseErr + EPROM.WR.Ne;
     	    EPROM.WR.Size = 1;
     	    EPROM.WR.Buff[0] = EPROM.Data[EPROM.WR.Addr] |
     	    		           Active_Faults[EPROM.WR.Ne];
		    Passive_Faults[EPROM.WR.Ne] = EPROM.WR.Buff[0];
      	    EPROM.ErrPh = __Phase_WR_ErrTime; // на запись ErrTime
      	    EPROM.WR.Request = 1;
            break;
        case __Phase_WR_ErrTime:
      	    EPROM.WR.Addr = __EPROM_Adr_TimeErr + EPROM.WR.Ne;
     	    EPROM.WR.Size = 1;
     	    EPROM.WR.Buff[0] =_B1_32(Vehicle.WorkTime); // часы
     	    EPROM.ErrPh = __Phase_WR_ErrCnt; // на запись ErrCnt
     	    EPROM.WR.Request = 1;
            break;
        case __Phase_WR_ErrCnt: //
        	EPROM.WR.Addr = __EPROM_Adr_CntErr + EPROM.WR.Ne *8;
        	EPROM.WR.Size = 8;
        	for (i = 0; i < 8; i++)  // позиция бита неисправности
        	{ uint16_t D = EPROM.Data[EPROM.WR.Addr + i]; // счетчик
        	  if(i == EPROM.WR.Pe) D++;
        	  EPROM.WR.Buff[i] = D;
        	}
    		if(EPROM.WR.Ne < 8 ||
    		  (EPROM.WR.Ne > 25 &&  EPROM.WR.Ne < 29))
    	 	     EPROM.ErrPh = __Phase_WR_LastErr; // на запись LastErr
    		else EPROM.ErrPh = 0; // на ВЫХОД
    		EPROM.WR.Request = 1;
            break;
        case __Phase_WR_LastErr:
        	EPROM.WR.Addr = __EPROM_Adr_LastErr + EPROM.WR.Ne;
        	EPROM.WR.Size = 1;
        	EPROM.WR.Buff[0] =  EPROM.Data[EPROM.WR.Addr] |
  		                        Active_Faults[EPROM.WR.Ne];
        	if(EPROM.WR.Ne > 25 &&  EPROM.WR.Ne < 29)
       	       EPROM.WR.Addr -= 14; // 14 = -26 +8
        	EPROM.ErrPh = 0;  // на ВЫХОД
      	    EPROM.WR.Request = 1;
            break;
        case __Phase_WR_BlockOFF:  // счетчик записей в EPROM
     	    // счетчик включений блока
     	    EPROM.BlockON_Cnt++;
       	    EPROM.WR.Buff[0] = _B3_32(EPROM.BlockON_Cnt);
       	    EPROM.WR.Buff[1] = _B2_32(EPROM.BlockON_Cnt);
       	    EPROM.WR.Buff[2] = _B1_32(EPROM.BlockON_Cnt);
       	    EPROM.WR.Buff[3] = _B0_32(EPROM.BlockON_Cnt);
     	    // счетчик записей
       	    EPROM.WR.Buff[4] = _B3_32(EPROM.WriteCnt);
       	    EPROM.WR.Buff[5] = _B2_32(EPROM.WriteCnt);
       	    EPROM.WR.Buff[6] = _B1_32(EPROM.WriteCnt);
       	    EPROM.WR.Buff[7] = _B0_32(EPROM.WriteCnt);
       	    // пробег
      	    EPROM.WR.Buff[8] = _B3_32(Vehicle.RunaWay);
       	    EPROM.WR.Buff[9] = _B2_32(Vehicle.RunaWay);
       	    EPROM.WR.Buff[10]= _B1_32(Vehicle.RunaWay);
       	    EPROM.WR.Buff[11]= _B0_32(Vehicle.RunaWay);
       	    //  время наработки
      	    EPROM.WR.Buff[12]= _B3_32(Vehicle.WorkTime);
       	    EPROM.WR.Buff[13]= _B2_32(Vehicle.WorkTime);
       	    EPROM.WR.Buff[14]= _B1_32(Vehicle.WorkTime);
       	    EPROM.WR.Buff[15]= _B0_32(Vehicle.WorkTime);
       	    // Front_ODO
       	    EPROM.WR.Buff[16]= _B3_32(Vehicle.Front_ODO);
       	    EPROM.WR.Buff[17]= _B2_32(Vehicle.Front_ODO);
       	    EPROM.WR.Buff[18]= _B1_32(Vehicle.Front_ODO);
            EPROM.WR.Buff[19]= _B0_32(Vehicle.Front_ODO);
       	    // Rear_ODO
       	    EPROM.WR.Buff[20]= _B3_32(Vehicle.Rear_ODO);
       	    EPROM.WR.Buff[21]= _B2_32(Vehicle.Rear_ODO);
       	    EPROM.WR.Buff[22]= _B1_32(Vehicle.Rear_ODO);
            EPROM.WR.Buff[23]= _B0_32(Vehicle.Rear_ODO);
        	EPROM.WR.Addr = __EPROM_Adr_BlockON_Cnt;
     	    EPROM.WR.Size = 24;
      	    EPROM.WR.Request = 1;
      	    break;
        case __Phase_WR_CSsum:
       	    // контрольная сумма
      	    EPROM.WR.Buff[0]= _B3_32(EPROM.RD.CSum);
       	    EPROM.WR.Buff[1]= _B2_32(EPROM.RD.CSum);
       	    EPROM.WR.Buff[2]= _B1_32(EPROM.RD.CSum);
       	    EPROM.WR.Buff[3]= _B0_32(EPROM.RD.CSum);
        	EPROM.WR.Addr = __EPROM_Adr_CSum;
     	    EPROM.WR.Size = 4;
      	    EPROM.WR.Request = 1;
            break;
        case __Phase_RD_All:  // чтение всего EPROM
			// выполняется 2мс 1 читает 2 обрабатывает
        	EPROM_Read_All();
            break;
      }
	  // если машина записи поставила EPROM.WR.Request запускаем
	  if(EPROM.WR.Request)
	  {  EPROM.WR.Request = 0;
	     // запуск записи в SPI
	     RD_EPROM_Compleet = 0;
	     EPROM.WR.Phase = __Phase_Start;
	     EPROM_Write_Page();
	  }
	}
} // end EPROM_Manager();

void EPROM_Read_All(void)
{
	switch (EPROM.RD.Phase)
    { case 0:  // фаза заглушка
          break;
	  case 1: // чтение
		  EPROM.RD.Addr = __EPROM_Adr_PaseErr;
		  EPROM.RD.Size = __EPROM_Size;//
    	  EPROM.WR.Buff[0] = __READ;   // Read Data from Memory
		  EPROM.WR.Buff[1] = _Hi_16(EPROM.RD.Addr);
		  EPROM.WR.Buff[2] = _Lo_16(EPROM.RD.Addr);
		  _Port_Off(CS_EPROM);  // CS в ноль
		  HAL_SPI_TransmitReceive_DMA(&hspi1, EPROM.WR.Buff, EPROM.RD.Buff, EPROM.RD.Size);
          EPROM.RD.Cmpl = 0;
          EPROM.RD.Phase++;
		  break;
	  case 2: // ожидаем завершение передачи SPI
		  break;
    }
} // end EPROM_Read_Page()

void My_EPROM_Init(void)
{
	// устанавливаем Pin WP_EPROM в 1
#ifdef  WP_EPROM_Pin
	_Port_Off(WP_EPROM);
#endif
	// устанавливаем Status Register
	// WPEN=0 BP1=0 BP0=0
    EPROM_WR_Status = 2;
    EPROM_Write_Status();
    // устанавливаем запрос на чтение всего EPROM
    BlockON_RD_EPROM = 0;
 	Request_RD_All = 1;
} // end My_EPROM_Init()

#endif
//------------------------End EEPROM --------------------------------

void     Work_Time(void)
{
#ifdef   __AxisF_Compile
// Work_Time вызывается в 5мс и 1мс
#define  __Time_Cnt_Set 33750 //30000 //36000*5/6
#else
// Work_Time вызывается в  1мс
#define  __Time_Cnt_Set 36000
#endif
	if(EPROM.Time_Cnt++ > __Time_Cnt_Set)
	{  EPROM.Time_Cnt = 0;

	  Vehicle.WorkTime++;
#ifdef  __EEPROM
	  EPROM_WR_4byte(&EPROM.WorkTime);
	  Request_WR_Time = 1;//  установка запроса записи Work_Time
#endif
	}
} // end Work_Time();

//-------------------------LIM_Speed-------------------------------
#ifdef  __LIM_Speed
#define  __B7_FailImp_Cnt_Err   10
#define  __B7_Const_Min  0x05000000
#define  __B7_Period_Min 0x0888  //(__B7_Const_Min / 0x9600 (150km/h))
void     TerminalB7_Capture (TIM_HandleTypeDef* htim)
{
// проблема у htim2 нет прерывания при переполнении
// поэтому каптуры используем для определения B7.Duration
// а для определения B7.Period используем htim2 !!!

	uint16_t Capt = HAL_TIM_ReadCapturedValue(htim, LIM.B7.Channel);
	uint32_t T4Capt = LIM.B7.Tim_HiCnt * (uint32_t)0x10000 + // Hi 2byte
			          __HAL_TIM_GET_COUNTER(&htim4);         // Lo 2byte

	if(__HAL_TIM_GET_CAPTUREPOLARITY(htim, LIM.B7.Channel))
	{ // --- capture falling edge ---
	  // смена CAPTURE POLARITY
	  __HAL_TIM_SET_CAPTUREPOLARITY(htim, LIM.B7.Channel,
			  		     TIM_INPUTCHANNELPOLARITY_RISING);
	  if(LIM.B7.FirstCapt)
	  { // определение длительности импульса B7
		LIM.B7.Duration = Capt - LIM.B7.FirstCapt;
		// проверка валидности
		if(LIM.B7.Duration > __B7_Puls_Max ||
		   LIM.B7.Duration < __B7_Puls_Min)
		{  LIM_B7_Puls_Fail = 1;
		   if(LIM.B7.FailI_Cnt < __B7_FailImp_Cnt_Err)
			  LIM.B7.FailI_Cnt++;
		   else B7_Imp_Fail = 1;
		}
		else
		{  LIM_B7_Puls_Fail = 0;
		   if(LIM.B7.FailI_Cnt)
			  LIM.B7.FailI_Cnt--;
		   else B7_Imp_Fail = 0;
		   LIM.B7.Const = LIM.CFG.B7_Puls_Const * LIM.B7.Duration *256;
		}
	  }
	  LIM_B7_Find = 1; // флаг что определена B7
	}
	else
	{ // --- capture rising edge ---
	  // смена CAPTURE POLARITY
	  __HAL_TIM_SET_CAPTUREPOLARITY(htim, LIM.B7.Channel,
				        TIM_INPUTCHANNELPOLARITY_FALLING);
	  if(LIM.B7.Tim_Capt)
	  { // определение периода импульса B7
		LIM.B7.Period = T4Capt - LIM.B7.Tim_Capt;
        // проверка валидности периода
		if(LIM.B7.Period < __B7_Period_Min)
		{ if(LIM.B7.FailT_Cnt <__B7_FailImp_Cnt_Err)
			 LIM.B7.FailT_Cnt++;
		  else B7_Freq_Fail = 1;
		}
		else
		{ if(LIM.B7.FailT_Cnt)
			 LIM.B7.FailT_Cnt--;
		  else B7_Freq_Fail = 0;
		}
		if(LIM.B7.Period)
		{ // вычисление скорости
		  LIM.B7.Speed = LIM.B7.Const / LIM.B7.Period;
		  // счетчик обнуления скорости
		}
		}
	  // сохраняем для следующего импульса B7
	  LIM.B7.FirstCapt = Capt;
	  LIM.B7.Tim_Capt = T4Capt;
	  // счетчик обнуления скорости
	  LIM.B7.ZS_Cnt = __B7_ZS_Const;
	}
	HAL_TIM_IC_Start_IT (&htimB7, B7_CHANNEL);
} // END TerminalB7_Capture (TIM_HandleTypeDef* htim)

void     ADC_PK(void)
{ // вызывается в myHAL_TIM_OC_DelayElapsedCallback
//#define __PK_State_Off  1
//#define __PK_State_On   0

	if(LIM_PK_ON)
	{ LIM.PK.ADC.On_Val = (uint16_t)*(LIM.PK.ADC.Ch);
	  LIM.PK.Oss.On_Val = LIM.PK.ADC.On_Val /__Koss;
	}
	else
	{ LIM.PK.ADC.Off_Val = (uint16_t)*(LIM.PK.ADC.Ch);
	  LIM.PK.Oss.Off_Val = LIM.PK.ADC.Off_Val /__Koss;
	}
} // end  ADC_PK()

#endif
//------------------------End LIM_Speed -----------------------------

/*****END OF FILE****/

