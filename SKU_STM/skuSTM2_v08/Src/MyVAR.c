#include "MyTypeDef.h"
#include "main.h"
#include "stm32f1xx.h"
#include "MySystem.h"
#include "MyFunc.h"

#include "MyPGM.h"

TypeDef_Weght     Weght;
TypeDef_Accel     AccelY;
TypeDef_Accel     AccelX;
ValidityTypeDef   AxValid;
ValidityTypeDef   AyValid;
TypeDef_Road      Road;
TypeDef_Validity  Validity;
TypeDef_KTS       KTS;
TypeDef_Load      Load;
TypeDef_Maneuver  Maneuver;
TypeDef_Body      Body;
TypeDef_Retarder  Retarder;
TypeDef_Emul      Emul;
TypeDef_TCO       TCO;
TypeDef_Brake     Brake;
TypeDef_Base      Base;
TypeDef_SelfTun   SelfTun;

WheelTypeDef     Wheel_FL;
WheelTypeDef     Wheel_FR;
WheelTypeDef     Wheel_RL;
WheelTypeDef     Wheel_RR;
WheelTypeDef     Wheel_3L;
WheelTypeDef     Wheel_3R;

DifTypeDef      FrontDif;
DifTypeDef      RearDif;
DifTypeDef      TrailerDif;
DifTypeDef      Axis3Dif;

LSSwTypeDef    BSP75_WL;
LSSwTypeDef    BSP75_LASR;
LSSwTypeDef    BSP75_DBR;
LSSwTypeDef    BTS142_GNDF;
LSSwTypeDef    BTS142_GNDR;

AccGiroTypeDef  Invense; // сенсор на плате

/* --------------  CFG VAR DSC  --- -----------------*/
uint32_t   W01_Coef;
uint8_t    Rounds_PHM_W01;
uint32_t   W23_Coef;
uint8_t    Rounds_PHM_W23;
uint32_t   W45_Coef;
uint8_t    Rounds_PHM_W45;
uint8_t    TSCAE_Prior1;
uint8_t    TSCAE_Prior2;
uint8_t    Norm_Weel_Coef;
uint8_t    ABS_Config;
/*
Set_2S_1M        equ     1  ;
Set_2S_2M        equ     2  ;
Set_4S_2M        equ     3  ;
Set_4S_3M        equ     4  ;
Set_4S_3M_2A     equ     5  ;
Set_4S_4M        equ     6  ;
Set_6S_3M        equ     7  ;
                            ;
Set_6S_4M        equ     8  ;
Set_6S_4M_13A    equ     9  ;
Set_6S_5M        equ   $0A  ;
Set_6S_5M_3A     equ   $0B  ;
Set_6S_6M        equ   $0C  ;
*/
int16_t    IEE_DSC_Const[SizeCFGBuf]; // буфер чтения констант из FlashCFG
// Константы машины и настроек
uint16_t   DSC_Ratio_Steer;
uint16_t   DSC_K_l_Acker;
uint16_t   DSC_K_Q_Acker;
uint16_t   DSC_Car_Base;
uint16_t   DSC_Car_Hcg;       //высота центра гравитации
int16_t    DSC_OffSet_AccY;
int16_t    DSC_OffSet_AccX;
//uint16_t   Koef_FySa; //2511;  // переменная Koef_FySa стифнес
uint16_t   Koef_AccY_dVf; //19712 0x4D00 переменная
// Acc_Y через скорости передних колес зависит от передней колеи
int16_t    Sen_Steer_DigMax;
uint8_t    Yaw_Delay;
uint8_t    Koef_Steer;

// Настройки регулирования
_ByteBits_  _DSC_Config_1;
_ByteBits_  _DSC_Config_2;
_ByteBits_  _DSC_Config_3;
_ByteBits_  _DSC_Config_4;
_ByteBits_  _DSC_Config_5;
_ByteBits_  _DSC_Config_6;
_ByteBits_  _DSC_Config_7;
_ByteBits_  _DSC_Config_8;
_ByteBits_  _DSC_Config_9;
_ByteBits_  _DSC_Config_10;
_ByteBits_  _DSC_Config_11;
_ByteBits_  _DSC_Config_12;
_ByteBits_  _DSC_Config_13;
_ByteBits_  _DSC_Config_14;
_ByteBits_  _DSC_Config_15;
_ByteBits_  _DSC_Config_16;
_ByteBits_  _DSC_Config_17;
_ByteBits_  _DSC_Config_18;
_ByteBits_  _DSC_Config_19;
_ByteBits_  _DSC_Config_20;
_ByteBits_  _DSC_AOS_Config;

int16_t   Derivative_VY_est;
int16_t   Derivative_VX_est;
uint16_t  Speed_VX_est;
uint16_t  Speed_VX_TCO;
uint16_t  Speed_FrontAxel;  //
uint16_t  Speed_RearAxel;   //
//uint32_t  Sum_AllSpeed;     // сумма всех скоростей колес
uint16_t  SpeedVX_RearAxel;
uint16_t  Speed_VX_Wh;
uint8_t   KL_Status1_MC2;
int16_t   Derivative_OmegaZ;
int16_t   Derivative_Akker;
int16_t   Derivative_DeltaWz;
int16_t   Derivative_AccY;
int16_t   Derivative_AccY_OzD;

int16_t   Omega_Z_sen;
int16_t   Omega_X_sen;
int16_t   Omega_Y_sen;

int16_t   Omega_Z_est;
int16_t   OmegaZ_Des;  // желаемая OmegaZ
int16_t   Delta_OmegaZ;
int16_t   OmegaZ_Des_MC2;

int16_t   OmegaZ_Vf;   // OmegaZ через скорости передних колес MODEL3
int16_t   OmegaZ_AccY; // OmegaZ через боковое ускорение MODEL2
int16_t   OmegaZ_Ref;  // OmegaZ Эталонная
int16_t   dSpAx;

int16_t   Acc_Y_est;
int16_t   Acc_X_est;  //??

int16_t   Steer_sen;  // угол поворота руля
int16_t   Steering_Angle;   // выходной угол поворота руля
int16_t   Teta_Steering_Wheel;
int16_t   Teta_for_Ackermann;
int16_t   OmegaZ_Acker;
int32_t   CosinusTeta;
int16_t   OmegaZ_Steer;

int32_t   Roll_Integrator;
int16_t   Roll_Angle;
int32_t   Pitch_Integrator;
int16_t   Pitch_Angle;

uint8_t   ManeuverN_Cnt;
uint8_t   Sharp_Rot_Cnt;
uint8_t   ManeuverY_Cnt;
uint8_t   YawBias_Cnt;
uint16_t  ReverseON_Cnt;

uint16_t  TrailerPress;
uint16_t  AUX1Value;
uint16_t  AUX2Value;
int16_t   Press_Sen1;
int16_t   Press_Sen2;
int16_t   Press_Sen3;
int16_t   Press_Sen4;
uint16_t  DZ_Press_Stop;

uint16_t  Pmax = 0x9B00; //155 - 7,5atm

int16_t   Acc_X_sen;
int16_t   Acc_Y_sen;
int16_t   Acc_Z_sen;

int32_t   Derivative_VY;
int32_t   Integrator_VY;
int16_t   Sa_Front;
int16_t   Sa_Rear;
int16_t   Speed_VY_est;

int16_t    DelayBuf_DerVx[SizeDelayBuff];
int16_t    DelayBuf_OmegaZAcker[SizeDelayBuff]; // буфер задержки
int16_t    DelayBuf_Steer[SizeDelayBuff];       // буфер задержки
int16_t    DelayBuf_OmegaZ_Steer[SizeDelayBuff]; //
int16_t    DelayBuf_Taxo[SizeDelayBuff];
int16_t    DelayBuf_Torque[SizeDelayBuff];
int16_t    DelayBuf_Press[SizeDelayBuff];

#define    SizeDerivativeAccY   0x28 //40
uint16_t   BuffDer_VX[SizeDerivativeAccY];
uint16_t   BuffBase_Ax[80];

#define    SizeAccWxxBuff   0x0A //0x05

OffsetTypeDef GyroX;
OffsetTypeDef GyroY;
OffsetTypeDef GyroZ;
OffsetTypeDef SASdrift;
OffsetTypeDef BrakeP;
OffsetTypeDef TrailerP;
OffsetTypeDef AdcAUX1;
OffsetTypeDef AdcAUX2;
OffsetTypeDef PSen1;
OffsetTypeDef PSen2;
OffsetTypeDef PSen3;
OffsetTypeDef PSen4;
OffsetTypeDef SASval;

_Filtr_Buffer_  Filter_TrailerPress;
_Filtr_Buffer_  Filter_BrakeDemand;
_Filtr_Buffer_  Filter_RoadOmegaZ;
_Filtr_Buffer_  Filter_Speed_VX; //* uint
_Filtr_Buffer_  Filter_KTS;
_Filtr_Buffer_  Filter_Torque;
_Filtr_Buffer_  Filter_Press;
_Filtr_Buffer_  Filter_VX_TCO;   //
_Filtr_Buffer_  Filter_RearVX;   //
_Filtr_Buffer_  Filter_FrontVX;  //
_Filtr_Buffer_  Filter_Speed_FL;
_Filtr_Buffer_  Filter_Speed_FR;
_Filtr_Buffer_  Filter_Speed_RL;
_Filtr_Buffer_  Filter_Speed_RR;
_Filtr_Buffer_  Filter_Speed_3L;
_Filtr_Buffer_  Filter_Speed_3R;
_Filtr_Buffer_  Filter_Vx_Base;

extern  TypeDef_SAS        SAS;
extern  DYCTypeDef         DYC;
extern  TypeDef_CAN_Engine CAN_Engine;
extern  TypeDef_CCVS       CCVS;
extern  TypeDef_ECAS       ECAS;
extern  TypeDef_Engine     Engine;
extern  TypeDef_Vehicle    Vehicle;
extern  TypeDef_ECAS       ECAS;
extern  CANTTypeDef        Trailer1;
extern  TypeDef_ASR    ASR;
extern  TypeDef_EBL    EBL;
extern  ROPTypeDef     ROP;
extern  DYCTypeDef     DYC;
extern  SSCTypeDef     SSC;
extern  TypeDef_MIR    MIR_Front;
extern  TrailerTypeDef Trailer;
extern  uint32_t   Config_Cnt;	  // счетчик записей CFG
extern  _ByteBits_  _DSC_Flags4;

extern  ButtonTypeDef SW_ABS;
extern  ButtonTypeDef SW_ASR;
extern  ButtonTypeDef SW_TSET;
extern  ButtonTypeDef SW_DIA;

extern  UartTypeDef    UartDIA;
extern  TorqueTypeDef  EngineTorque;

#ifdef   __AxisF_Compile
extern  TypeDef_AGS        AGS;
extern  TypeDef_CANS   CANS;
extern  _Filtr_Buffer_  Filter_dVf;
int16_t   Acc_X_MC2;
extern  uint16_t   Pcb_Test_BrPS_Val;
//extern  uint8_t    TruckSim_Cnt;
//extern  uint8_t    TruckSim_PA;
#else
//extern  uint16_t   Speed_VX_Front;
#endif

#ifdef  __LIM_Speed
extern  TypeDef_LIM LIM;
_Filtr_Buffer_  Filter_Vx_B7;
#endif

/* ----------------- Filter ---------------------*/

// -------------- Type1 ---------------------------

//-----Sampling time: 0.005---------------
/*  коэффиценты фильтра Fc=1Hz задержка 95ms 140
0.0009632 + 0.001926 z^-1 + 0.0009632 z^-2
------------------------------------------
       1 - 1.915 z^-1 + 0.9192 z^-2
Sampling time: 0.005
*/
volatile const uint16_t Koef_Filtr1Hz[5] = {
     0x01EA, 0x00EB, 0x0040, 0x0080, 0x0040
     };

/*  коэффиценты фильтра Fc=2Hz
Transfer function:
0.004868 + 0.009735 z^-1 + 0.004868 z^-2
----------------------------------------
      1 - 1.793 z^-1 + 0.8126 z^-2
Sampling time: 0.005
*/
volatile const uint16_t Koef_Filtr2Hz[5] = {
     0x01CB, 0x00D0, 0x0140, 0x0280, 0x0140
     };

/* коэффиценты фильтра Fp=5Hz Rp=0.22 задержка 30ms
Transfer function:
0.0117 + 0.0234 z^-1 + 0.0117 z^-2
----------------------------------
   1 - 1.698 z^-1 + 0.7464 z^-2
*/
volatile const uint16_t Koef_Filtr5Hz[5] = {
     0x01B3, 0x00BF, 0x0300, 0x0600, 0x0300
     };

/*  коэффиценты фильтра Fp=10Hz Rp=0.07 задержка 15ms
Transfer function:
0.07402 + 0.148 z^-1 + 0.07402 z^-2
-----------------------------------
   1 - 1.121 z^-1 + 0.4189 z^-2
*/
volatile const uint16_t Koef_Filtr10Hz[5] = {
     0x011F, 0x006B, 0x1300, 0x2600, 0x1300
     };

/*  коэффиценты фильтра Fc=14.05Hz
Transfer function:
0.07474 + 0.1495 z^-1 + 0.07474 z^-2
------------------------------------
    1 - 1.137 z^-1 + 0.4425 z^-2
Sampling time: 0.005
*/
volatile const uint16_t Koef_Filtr14Hz[5] = {
     0x0123, 0x0071, 0x1380, 0x2700, 0x1380
     };

//-----Sampling time: 0.001---------------
/*
Transfer function:
0.00212 + 0.00424 z^-1 + 0.00212 z^-2
-------------------------------------
     1 - 1.867 z^-1 + 0.875 z^-2

Sampling time: 0.001 Fs = 3.296 задержка 15ms
33Hz 0.2
*/
volatile const uint16_t Koef_Filt1_7Hz[5] = {
//	478	      224     128     256     128
     0x01DE, 0x00E0, 0x0080, 0x0100, 0x0080
     };

/*
Transfer function:
0.00393 + 0.00786 z^-1 + 0.00393 z^-2
-------------------------------------
    1 - 1.816 z^-1 + 0.8319 z^-2
Sampling time: 0.001 Fs = 4.517 задержка 10ms
33Hz 0.36
*/
volatile const uint16_t Koef_Filt1_10Hz[5] = {
//	465	      213     256     512     256
     0x01D1, 0x00D5, 0x0100, 0x0200, 0x0100
     };
/*
Transfer function:
0.006873 + 0.01375 z^-1 + 0.006873 z^-2
---------------------------------------
     1 - 1.754 z^-1 + 0.7812 z^-2

Sampling time: 0.001 Fs = 6.104 задержка 8ms
33Hz 0.57
*/
volatile const uint16_t Koef_Filt1_14Hz[5] = {
//	449	       200     448     896     448
     0x01C1, 0x00C8, 0x01C0, 0x0380, 0x01C0
     };

/*
Transfer function:
0.01047 + 0.02094 z^-1 + 0.01047 z^-2
-------------------------------------
    1 - 1.692 z^-1 + 0.7342 z^-2

Sampling time: 0.001 Fs = 6.104 задержка 6ms
33Hz 0.75
*/
volatile const uint16_t Koef_Filt1_20Hz[5] = {
//	433	       188     704     1408     704
     0x01B1, 0x00BC, 0x02C0, 0x0580, 0x02C0
     };

/*
Transfer function:
0.01664 + 0.03328 z^-1 + 0.01664 z^-2
-------------------------------------
    1 - 1.606 z^-1 + 0.6722 z^-2

Sampling time: 0.001 Fs = 6.104 задержка 5ms
33Hz 0.85
*/
volatile const uint16_t Koef_Filt1_25Hz[5] = {
//	411	       172     1088     2176     1088
     0x019B, 0x00AC, 0x0440, 0x0880, 0x0440
     };

/*
Transfer function:
0.02822 + 0.05644 z^-1 + 0.02822 z^-2
-------------------------------------
    1 - 1.473 z^-1 + 0.5856 z^-2

Sampling time: 0.0001 Fs = 6.104 задержка 4ms
33Hz 0.57
*/
volatile const uint16_t Koef_Filt1_30Hz[5] = {
//	377	       150     1856     3712     1856
     0x0179, 0x0096, 0x0740, 0x0E80, 0x0740
     };

// -------------- Type2 -----------------------------
/*  коэффиценты фильтра Fc=7Hz задержка 30ms
Transfer function:
0.03094 - 0.009544 z^-1 - 0.009544 z^-2 + 0.03094 z^-3
------------------------------------------------------
       1 - 2.24 z^-1 + 1.745 z^-2 - 0.4627 z^-3
Sampling time: 0.005
*/
volatile const uint16_t Koef_Filt2_7Hz[7] = {
     0x023B, 0x01BB, 0x0075,
	 0x07EF, 0x026F, 0x026F, 0x07EF
     };

//-----------------------Gear--------------------------------
//-----------------------ZF16--------------------------------
//   13,8  11,54  9,49 7,93 6,53 5,46 4,57 3,82 3,02 2,53 2,08 1,74 1,43 1,20 1,0  0,84
//14,93|12,67|10,51|8,71|7,23|6,0 |5,02|4,19|3,42|2,76|2,3 |1,91|1,58|1,31|1,1 |0,92|0,76
// 3822  3243  2690 2230 1851 1536 1285 1074 876  710  590  489  406  337  287  236  195
const volatile uint16_t GearZF16_Data[17] myData = {
     0x0EEE, 0x0CAB, 0x0A82, 0x08B6,
	 0x073B, 0x0600, 0x0505, 0x0432,
     0x036C, 0x02C6, 0x024E, 0x01E9,
	 0x0196, 0x0151, 0x011F, 0x00EC,
	 0x00C3
     };
// ----------5-ти ступенчатая КПП ЯМЗ-236--------------------
//   5,2  2,9 1,52  1,0  0,66
//6,35|4,05|2,21|1,26|0,83|0,49
//1625 1036 565  322  212  125
const volatile uint16_t YMZ236_Data[6] myData = {
     0x0659, 0x040C, 0x0235, 0x0142, 0x00D4,
	 0x007D
     };
//end -------------------Gear--------------------------------

/* -----   ********Oss*********  -----------------*/
struct
{
//	uint8_t   Speed_VX;
	uint8_t   Teta_Steer;
	uint8_t   OmegaZ_Sens;
    uint8_t   OmegaZ_Acker;
    uint8_t   Speed_VY;
    uint8_t   Sa_Front;
    uint8_t   Sa_Rear;
    uint8_t   AccY_sen;
    uint8_t   AccX_sen;
    uint8_t   OmegaZ_Des;
    uint8_t   Delta_OmegaZ;
    uint8_t   AccY_dVf;
    uint8_t   AccY_OzD;
    uint8_t   CAN_KTS;
    uint8_t   ROP_KTS;
    uint8_t   Derivative_OmegaZ;
    uint8_t   Derivative_Akker;
    uint8_t   Engine_DragOn_Tresh;
    uint8_t   Engine_DragOFF_Tresh;
    uint8_t   KL15Value;
    uint8_t   PWRValue;
    uint8_t   SPLValue;
    uint8_t   SASDrift;
    uint8_t   SASDynOffset;
    uint8_t   SASValue;
    uint8_t   SASOffSet;
    uint8_t   AngleAcker;
    uint8_t   ROPoffAccY;
    uint8_t   ROPonAccY;
    uint8_t   ROPoffEAy;
    uint8_t   EBLload;
    uint8_t   OmegaZ_Vf;
    uint8_t   OmegaZ_AccY;
    uint8_t   OmegaZ_Ref;
    uint8_t   RefSpeed_FL;
    uint8_t   RefSpeed_FR;
    uint8_t   RefSpeed_RL;
    uint8_t   RefSpeed_RR;
    uint8_t   Validity_Wz1;
    uint8_t   Validity_Wz2;
    uint8_t   Validity_Wz3;
    uint8_t   Validity_Wz4;
	uint8_t   SpeedVX_est;
	uint8_t   SpeedVX_mot;
	uint8_t   Derivative_VX;
    uint8_t   AccX_est;
    uint8_t   AccX_Pitch;
    uint8_t   AkkerK;
    uint8_t   AccY_est;
    uint8_t   AccY_Roll;
    uint8_t   AccY_OffSet;
    uint8_t   AccY_Wz;
    uint8_t   RollAngle;
    uint8_t   PitchAngle;
    uint8_t   AccX_OffSet;
    uint8_t   SpeedFL;
    uint8_t   SpeedFR;
    uint8_t   SpeedRL;
    uint8_t   SpeedRR;
    uint8_t   SpeedVX_TCO;
    uint8_t   OmegaZ_Akk;
    uint8_t   SASWz;
    uint8_t   GyroX;
    uint8_t   GyroY;
    uint8_t   DerAy_OzD;
    uint8_t   ROP_SpThrR;
    uint8_t   ROP_SpThrF;
    uint8_t   OvSt_WzLim;
    uint8_t   ROP_VrefL;
    uint8_t   ROP_VrefR;
    uint8_t   ROP_AxRm;
    uint8_t   ROP_VxEnd;
    uint8_t   ROP_VxPh3;
    uint8_t   MuRoad;
    uint8_t   RoadWz;
    uint8_t   UnSt_WzMax;
    uint8_t   UnSt_AkThr;
    uint8_t   UnSt_WzThr;
    uint8_t   SteerAngleOss;
    uint8_t   SASAngleOss;
} Graph;

void GraphCalc(void)
{

	if(Acc_Y_est > 0)
		 Graph.ROPonAccY = _OssA(ROP.ON_AccY);
	else Graph.ROPonAccY = -_OssA(ROP.ON_AccY);
	if(Omega_Z_est > 0)
		 Graph.RoadWz = _OssW(Road.OmegaZ);
	else Graph.RoadWz = -_OssW(Road.OmegaZ);
	if(OmegaZ_Ref > 0)
		 Graph.OmegaZ_Ref = _OssW(OmegaZ_Ref);
	else Graph.OmegaZ_Ref = -_OssW(OmegaZ_Ref);

} // end GraphCalc()

int16_t  Delay(int16_t Delay_Buff[SizeDelayBuff], int16_t Xn, uint8_t D)
{
	for (uint8_t i = SizeDelayBuff-1; i > 0; i--)
		 Delay_Buff[i] = Delay_Buff[i-1];
	Delay_Buff[0] = Xn;
	if(D < (SizeDelayBuff-1)) return Delay_Buff[D];
	else return Delay_Buff[SizeDelayBuff-1];
}  // end Delay()

int16_t  Filter_Cheb(_Filtr_Buffer_* Filter_Buf, volatile const uint16_t* Filter_Koef)
{
int64_t Tmp; // обязательно 64 чтобы не переполнялся Tmp
    Tmp = (Filter_Buf->Yn_1 * (int64_t)Filter_Koef[0]);	    // Yn_1 * K[0]
	Tmp -= (Filter_Buf->Yn_2* (int64_t)Filter_Koef[1]);	    // Yn_2 * K[1]
	Tmp += (Filter_Buf->Xn * (int64_t)Filter_Koef[2]);  	// Xn * K[3]
	Tmp += (Filter_Buf->Xn_1 * (int64_t)Filter_Koef[3]);	// Xn_1 * K[4]
	Tmp += (Filter_Buf->Xn_2 * (int64_t)Filter_Koef[4]);	// Xn_2 * K[5]
	// рекомбинация буфера
	Filter_Buf->Yn_2 = Filter_Buf->Yn_1;
	Filter_Buf->Yn_1 = Tmp / 256;
	Filter_Buf->Xn_2 = Filter_Buf->Xn_1;
	Filter_Buf->Xn_1 = Filter_Buf->Xn;
	return (Filter_Buf->Yn_1 / 256);
} // end Filter_Cheb() T=5,5mks

int16_t  Filter_Cheb2(_Filtr2_Buf_* Filter_Buf, volatile const uint16_t* Filter_Koef)
{
int64_t Tmp;
	Tmp = (Filter_Buf->Yn_1 *  (int64_t)Filter_Koef[0]);	// Yn_1 * K[0]
    Tmp -= (Filter_Buf->Yn_2 * (int64_t)Filter_Koef[1]);	// Yn_2 * K[1]
	Tmp += (Filter_Buf->Yn_3 * (int64_t)Filter_Koef[2]);	// Yn_3 * K[2]
	Tmp += (Filter_Buf->Xn *   (int64_t)Filter_Koef[3]); 	// Xn * K[3]
	Tmp -= (Filter_Buf->Xn_1 * (int64_t)Filter_Koef[4]);	// Xn_1 * K[4]
	Tmp += (Filter_Buf->Xn_3 * (int64_t)Filter_Koef[6]);	// Xn_3 * K[6]
	Tmp -= (Filter_Buf->Xn_2 * (int64_t)Filter_Koef[5]);	// Xn_2 * K[5]
	// рекомбинация буфера
	Filter_Buf->Yn_3 = Filter_Buf->Yn_2;
	Filter_Buf->Yn_2 = Filter_Buf->Yn_1;
	Filter_Buf->Yn_1 = Tmp / 256;
	Filter_Buf->Xn_3 = Filter_Buf->Xn_2;
	Filter_Buf->Xn_2 = Filter_Buf->Xn_1;
	Filter_Buf->Xn_1 = Filter_Buf->Xn;
	return (Filter_Buf->Yn_1 / 256);
} // end Filter_Cheb2()  T=7,5mks

uint16_t  Mediana(uint16_t Buff[], uint8_t Size, uint16_t M)
{
uint8_t  i;
uint8_t  j;
uint16_t tmp;
uint8_t  P;

    // заносим в буфер новое значение
    Buff[0] = M;
	// ранжир
	// метод «пузырька»
	//самый большой элемент массива окажется на последнем месте
    for(i = 0 ; i < Size - 1; i++)
    { // сравниваем два соседних элемента.
      for(j = 0 ; j < Size - i - 1 ; j++)
      { if(Buff[j] > Buff[j+1])
    	{ // если они идут в неправильном порядке, то меняем их местами.
    	  tmp = Buff[j];
    	  Buff[j] = Buff[j+1] ;
    	  Buff[j+1] = tmp;
        }
      }
    }
    // находим положение первого не нулевого элемента
    for(i = 0 ; i < Size - 1; i++)
    { if(Buff[i]) break; }
    // номер середины в массиве
    P = (Size + i)/2;

    return Buff[P];

}  // end Mediana()

int16_t  DeriVative(int16_t* Accel_Buf, uint8_t Size)
{// не менять
	int16_t Accel = Accel_Buf[0] - Accel_Buf[Size-1];
	for (int8_t i = Size-1; i > 0; i--)
		Accel_Buf[i] = Accel_Buf[i-1];
	return (Accel);
}  // end DeriVative

int32_t  DeriVative_U16(uint16_t* Accel_Buf, uint8_t Size)
{
	int32_t Accel = Accel_Buf[0] - Accel_Buf[Size-1];
	for (int8_t i = Size-1; i > 0; i--)
		Accel_Buf[i] = Accel_Buf[i-1];
	return (Accel);
}
uint16_t int_sqrt32(uint32_t x) // 10mks
{
    uint16_t res=0;
    uint16_t add= 0x8000;
    int i;
    for(i=0; i<16; i++)
    {
        uint16_t temp=res | add;
        uint32_t g2=temp*temp;
        if (x>=g2)
        {
            res=temp;
        }
        add>>=1;
    }
    return res;
}

int32_t SinusGrad(int16_t Angle)
{// sinX = X - X^3 / 3!	 (3! = 1*2*3 =6)
// Angle размерность 1град - 256 lsb
// Коeф. __K_DegRad = 180 / Pi * 256
#define   __K_DegRad   14668
	return (Angle - ((((Angle * Angle) / __K_DegRad) *
	    		     Angle) / __K_DegRad)/ 6);
} // end SinusGrad(int16_t Angle)

int32_t CosinusRad(int16_t Angle)
{// cosX = 1 - X^2 / 2! + X^4 / 4!
// Angle размерность 1рад  - 8192 lsb
// Cosinus размерность 1 - 65536
#define   __Cosinus0     65536  // 8192*8
#define   __K_CosRad     2048  // 8192 * 2 / 8	(2 - 2!)
	return ((int32_t)__Cosinus0 - ((Angle * Angle) /__K_CosRad));
} // end CosinusRad(int16_t Angle)


void Sensor_OFFSET(OffsetTypeDef* OS, int16_t INx)
{
#define   CpltNum     5U  // признак завершения OffSet
  if(OS->Cplt < CpltNum)
  {	if(!OS->Cplt) OS->SumNR = 0;
	if(OS->Cnt == 0) //NU
	{	OS->Sum = 0;
		OS->Min = INx;
		OS->Max = INx;
		OS->Base = INx;
		OS->Abort = 0;
	}
	if(INx < OS->Min) OS->Min = INx;
	if(INx > OS->Max) OS->Max = INx;
/*  два условия признака изменения Gyro
*  или дельта макс. мин. при колебаниях больше двойного порога
*  или отклонение макс. мин. от базовой при изменении в одну сторону
*/
	if(((OS->Max - OS->Min) > (OS->Delta<<1)) ||
	   ((OS->Max - OS->Min) < -(OS->Delta<<1)) ||
       ((OS->Max - OS->Base) > OS->Delta) ||
	   ((OS->Min - OS->Base) < -OS->Delta) ||
	   (INx > OS->Reliable) || (INx < -OS->Reliable))
	{	OS->Abort = 1;
		OS->Cplt = 0;
	}
	//
	OS->Sum += INx;
	OS->Cnt++;
	if((OS->Cnt == 0) && !OS->Abort)
	{
		int16_t NewRef = (int16_t)(OS->Sum /256);
		int16_t TmpP = OS->Ref + OS->Change; // плюс приращение
		int16_t TmpM = OS->Ref - OS->Change; // минус приращение
		if(NewRef > TmpP)
		{	OS->Ref = TmpP;
			if(OS->Cplt > 0) OS->Cplt--;
		}
		else
		if(NewRef < TmpM)
		{	OS->Ref = TmpM;
			if(OS->Cplt > 0) OS->Cplt--;
		}
		else
		{	if(OS->Cplt == (CpltNum-1U))
			{	OS->OffSet = OS->SumNR / (CpltNum-1U);
				OS->Cplt++;  // завершено
			}
			else
			{	OS->Cplt++;
			    OS->SumNR+= NewRef;
			}
		}
	}
  }
}  // end Sensor_OFFSET()

//------------------------------------------------------------------------

uint16_t  PressCANSensor(OffsetTypeDef* PS, uint16_t In)
{
	PS->Delta = __PSCAN_Delta;
	PS->Reliable = __PSCAN_Reliable;
	PS->Change = __PSCAN_Change;
    Sensor_OFFSET(PS, In);
    if(Press_OffSet &&
       PS->Cplt==5)
       PS->Cplt = 0;
	int16_t Val = In;
	if(AOS_BreakP_Enable)
	   Val -= PS->OffSet;
	if(Val < 0)
	   Val = 0;
	return (Val * (uint32_t)__K_PS_CAN)/256;
}

uint16_t PressAnalogSensor(OffsetTypeDef* PS, uint16_t In)
{
// приводим BrakeDemandValue к размерности 5/256 kPa/bit
// делитель 1:2
// Kup_MPX 1,111= 5/4,5   4,5V - 10atm
// k = 200*256 /(4096*(4,5/2)/3,3)
// k = 51200/2793 = 18,333 = 4693/256  Analog AIN1  v8
#define __K_Analog_BPS_v8  4928  // ??
#define __P_Val_Lim        3191  // 12atm

	PS->Delta = __PSA_Delta;
	PS->Reliable = __PSA_Reliable;
	PS->Change = __PSA_Change;
    Sensor_OFFSET(PS, In);
    if(Press_OffSet && //CFG
       PS->Cplt==5)
       PS->Cplt = 0;
	int16_t Val = In;
	if(AOS_BreakP_Enable)
	   Val -= PS->OffSet;
	// отрицательные значения обнуляем
	if(Val < 0)
	   Val = 0;
    // ограничиваем возможно переполнение
    // было при не пропаяном делителе
    if(Val > __P_Val_Lim)
	   Val = __P_Val_Lim;
	return (Val * (uint32_t)__K_Analog_BPS_v8)/256;
}

void  AccelX_Estimate(void)
{ // разметность 1m/c^2 - 8Msb
#ifdef   __AxisF_Compile
// ------------------- Определение угла тангаж  ---------------------
// медленный OffSet GyroY
//	интегрируем GyroY.Val c OffSet
//	без условий чтобы не возникала ошибка в угле
	Pitch_Integrator += GyroY.Val;
//  дельта
	AccelX.A = Derivative_VX_est - AccelX.Value + AccelX.OffSet;
// притягиваем Pitch_Angle к 0
// если AccelX.A меньше 0.5m/c^2 соответстует 3 градуса уклона
#define __PitchAngle_AxThr   0x0300  //  0.5m/c^2 3градуса уклона
#define   __K_intPitch_dec   0x00000050
	if(AccelX.A < __PitchAngle_AxThr &&
	   AccelX.A > -__PitchAngle_AxThr)
	{ if(Pitch_Integrator > __K_intPitch_dec)
	     Pitch_Integrator -= __K_intPitch_dec;
	  if(Pitch_Integrator < -__K_intPitch_dec)
	     Pitch_Integrator += __K_intPitch_dec;
	}

    if(!Speed_VX_est) Pitch_Integrator = 0; //стоит
// разметность 1град - 256lsb
// __K_AngleInt = 65536*256/(8192*pi/180*200)=586,7
#define __K_AngleInteg       587 // было 602
	Pitch_Angle = _Hi_32(Pitch_Integrator * __K_AngleInteg);

// ограничение	Pitch_Angle
#define __PitchAngle_lim    0x0AC3	 //уклон 10,76град - 19%
	if(Pitch_Angle > __PitchAngle_lim)
	{  Pitch_Angle = __PitchAngle_lim; BadPitchAngle = 1; }
	if(Pitch_Angle < -__PitchAngle_lim)
	{  Pitch_Angle = -__PitchAngle_lim; BadPitchAngle = 1; }

// --------- определение поправки  AccX от угла тангажа ------------
// !!!!  положитительный угол проецируется на отрицательную ось
// из-за угла уклона Teta   Ax,measured + g sin(Teta)
// Коeф. __K_Ax_Pitch_Angle такой же как Roll
#define   __K_Ax_Pitch_Angle    350
	AccelX.Pitch = (SinusGrad(Pitch_Angle) * __K_Ax_Pitch_Angle) /256;

//--------------------Определение Acc_X_est -------------------------
	if(DSC_Emul_Fl)
	   Acc_X_est = AccelX.Value;
	else
	{
	  AccelX.OffSet = _Hi_32(AccelX.Integ);
	  Acc_X_est = AccelX.Value - AccelX.OffSet; //Acc_X_est с Offset
	  if(AccX_Pitch_Enable) // CFG
		Acc_X_est += AccelX.Pitch;

// находим OffsetAx
#define   __K_IntOffsetAccX 0x0020 //0x0100
#define   __OffsetAxThr     0x0400     // 0x0800 1,5м/с^2
// на 3,35m/c2 стаится ошибка
#define   __OffsetAxLim     0x1C000000 // 3,5м/с^2 0x10000000 // 2м/с^2
#define   __IntdAccXLim     0x0400     // 0,5м/с^2
	// дериватива Vx запаздывает на 30мс
	// 200/2дериватива + 30 фильтр Vx - 100 фильтр AGS
	int16_t AccXdel;
	if(FiltrVx1Hz)
		 AccXdel= Delay(DelayBuf_DerVx, Acc_X_est, 12);
	else AccXdel= Delay(DelayBuf_DerVx, Acc_X_est, 6);

	// интегрируем разницу деривативы Speed_VX и Acc_X_est с запаздыванием
	  if(Derivative_VX_est < __OffsetAxThr &&	 // ускорение меньше 0,5м/с^2
	     Derivative_VX_est > -__OffsetAxThr &&
	     !Control_Active &&         // нет регулирования
	     No_Maneuver && // нет маневра (реальная скорость Vx меньше измеренной)
		 !Bad_AccX &&
	     !BadVX && !ReverseON) // если стоит тоже
	  { // дельтa
	    int16_t dAccX = AccXdel - Derivative_VX_est;
	    // ограничение дельты
	    if(dAccX > __IntdAccXLim)
	       dAccX = __IntdAccXLim;
	    if(dAccX < -__IntdAccXLim)
	       dAccX = -__IntdAccXLim;
	    AccelX.Integ += dAccX * __K_IntOffsetAccX;
	    // ограничение OffSetAx
        if(AccelX.Integ > __OffsetAxLim)
           AccelX.Integ = __OffsetAxLim;
	    if(AccelX.Integ < -__OffsetAxLim)
	       AccelX.Integ = -__OffsetAxLim;
	  }
	}
#endif
	if(Bad_AccX)    // не достоверные данные AGS
	{ // берем Base.AccX
	  if(AccX_Fail_Enable)
	   Acc_X_est = Base.AccX;
	}
} // end AccelX_Estimate()

void  AccelY_Estimate(void)
{
#ifdef   __AxisF_Compile
// ------ определение угла крена  ---------
#define __K_InfluenceAccGyro   0x0B40

	GyroX.Val += (GyroZ.Val * __K_InfluenceAccGyro) / 65536;
//	интегрируем GyroX.Val c OffSet
//	без условий чтобы не возникала ошибка в угле
    Roll_Integrator += GyroX.Val;

// притягиваем Roll_Angle к 0
// если AccelX.A меньше 0.5m/c^2 соответстует 3 градуса уклона
#define __RollAngle_AyThr   0x1000  //  0.5m/c^2 3градуса уклона
#define   __K_intRoll_dec   0x00000080
	if(AccelY.OmegaZ < __RollAngle_AyThr &&
	   AccelY.OmegaZ > -__RollAngle_AyThr)
	{ if(Roll_Integrator > __K_intRoll_dec)
		 Roll_Integrator -= __K_intRoll_dec;
	  if(Roll_Integrator < -__K_intRoll_dec)
		 Roll_Integrator += __K_intRoll_dec;
	}
	if(!Speed_VX_est) Roll_Integrator = 0;

	// __K_AngleInt определен в Pitch
	Roll_Angle = _Hi_32(Roll_Integrator * __K_AngleInteg);
// ограничение	Roll_Angle
#define __RollAngle_lim    0x0AC3	 //крена 10,76град
	if(Roll_Angle > __RollAngle_lim)
	{  Roll_Angle = __RollAngle_lim; BadRollAngle = 1; }
	if(Roll_Angle < -__RollAngle_lim)
	{  Roll_Angle = -__RollAngle_lim; BadRollAngle = 1; }

// ------ определение поправки  AccY от угла крена ------------
// накапливается ошибка в угле при __K_Ay_VxWz = 3686
// видимо из-за угла крена fi   Ay,measured - g sin(fi)
// если взять на 19% меньше ошибки нет
// 9,81* sin(1,2grad) = 0,2m/c^2	т.е. 20% от 1m/c^2 на базальте
// !!!! нужно использовать	Roll_Angle размерность 1град - 256lsb
//	 sin(1deg) * 9,81 * град
// Коeф. __K_Ay_Roll_Angle = 0,01745 * 9,81 / 256 * 2048
#define   __K_Ay_Roll_Angle    350
	AccelY.Roll = (SinusGrad(Roll_Angle) * __K_Ay_Roll_Angle) /256;

// ------ определение OffSet  AccY  ------------
// определение AccY_Wz  через Omega_Z_est
// !!!возможна ошибка гироскопа
// AccY_Wz = Omega_Z_est * Vx
// Koef_AccY_Wz = 2048 * 65536 / 3,6 / 8192
#define   __Koef_AccY_Wz        0x11C7
	AccelY.OmegaZ = _Hi_32(((Speed_VX_est * __Koef_AccY_Wz)/256)* Omega_Z_est);

// определяем OffSet AccelY
#define   __Kint_OffsetAccY  0x0010  // 0x0020
#define   __OffsetAyThr      0x0400 //0,5м/с^2  0x0800
#define   __OffsetAyLim      0x10000000 // 2м/с^2
#define   __IntdAccYLim      0x0400		// 0,5м/с^2   0x0800 // 1м/с^2

	AccelY.OffSet = _Hi_32(AccelY.Integ);
	//Acc_Y_est с Offset
	Acc_Y_est = AccelY.Value - AccelY.OffSet;
	if(AccY_Roll_Enable) Acc_Y_est -= AccelY.Roll;

	if(AccelY.OmegaZ < __OffsetAyThr &&  // малое ускорение
	   AccelY.OmegaZ > -__OffsetAyThr &&
	   !WZ_Fail &&
	   !Control_Active &&         // нет регулирования
	   Forward_Move)
	{ // интегрируем разницу Acc_Y_est и AccY_Wz
	   int16_t dAccY = Acc_Y_est - AccelY.OmegaZ;
	  // ограничение разницу
	   if(dAccY >__IntdAccYLim) dAccY =__IntdAccYLim;
	   if(dAccY <-__IntdAccYLim) dAccY =-__IntdAccYLim;
	   AccelY.Integ += dAccY * __Kint_OffsetAccY;
	  // ограничение OffSetAx
	   if(AccelY.Integ > __OffsetAyLim) AccelY.Integ = __OffsetAyLim;
	   if(AccelY.Integ < -__OffsetAyLim) AccelY.Integ = -__OffsetAyLim;
	 }
#endif
} // end AccelY_Estimate()

int16_t   Ackermann_OmegaZ(int16_t Teta)
{
	return _Lo_32((int32_t)(((((int32_t)Teta *
	              (int32_t)DSC_K_Q_Acker)/256) * (int32_t)Speed_VX_est) /
	              (int32_t)(((int32_t)Speed_VX_est * (int32_t)Speed_VX_est) /65536 +
	              (uint32_t)DSC_K_l_Acker)));
}

void    Ackermann(void)
{
// обратный Ackermann через Omega_Z_est InverseAcker
	if(Forward_Move)
	{ //обратный Ackermann через Omega_Z_est для угла колес
	  SAS.TetaAcker = ((((int32_t)Speed_VX_est * (int32_t)Speed_VX_est) /65536 +
				        (int32_t)DSC_K_l_Acker) * (int32_t)Omega_Z_est) /
				        ((int32_t)Speed_VX_est * (int32_t)DSC_K_Q_Acker /256);
	  //определяем угол руля вычисленного через обратный Ackermann
	  SAS.AngleAcker  = ((int32_t)SAS.TetaAcker * 65536) /
			            (int32_t)SAS.Ratio;
	  //определяем отклонение угла руля
	  SAS.Drift = SAS.Steering - SAS.AngleAcker;
// определяем OffSet
#define   __Kint_OffsetSteer  0x0020  // 0x0100
#define   __OffSetSteerThr    0x0324     // 45deg
#define   __OffSetSteerLim    0x06480000 // 90deg
#define   __IntDriftLim       0x0165	 // 20deg
	  if(SAS.AngleAcker < __OffSetSteerThr &&  // малый угол руля
 		 SAS.AngleAcker > -__OffSetSteerThr &&
		 !Control_Active)             // нет регулирования
	  { // интегрируем отклонение угла руля  SAS.Drift
		int16_t delta =  SAS.Drift;
		// ограничение разницу
		if(delta >__IntDriftLim) delta =__IntDriftLim;
		if(delta <-__IntDriftLim) delta =-__IntDriftLim;
        SAS.Integ += delta * (int32_t)__Kint_OffsetSteer;
		// ограничение OffsetSteer
		if(SAS.Integ > __OffSetSteerLim) SAS.Integ = __OffSetSteerLim;
		if(SAS.Integ < -__OffSetSteerLim) SAS.Integ = -__OffSetSteerLim;
	  }
 	  SASdrift.Delta = SASval_Delta;
 	  SASdrift.Reliable = SASval_Reliable;
 	  SASdrift.Change = SASval_Change;
 	  Sensor_OFFSET(&SASdrift, SAS.Drift);
 	  if(SASdrift.Cplt==5) SASdrift.Cplt=0; //повторный запуск
	}
// определяем Offset
	SAS.OffSet = _Hi_32(SAS.Integ);
// угол  с Offset
	Steering_Angle = Steer_sen;
//o	if(AOS_Acker_Enable) Steering_Angle -= SAS.OffSet;

// задержка для акермана и Offset
	SAS.Steering = Delay(DelayBuf_Steer , Steer_sen, Yaw_Delay); //CFG
//o	if(AOS_Acker_Enable) SAS.Steering -= SAS.OffSet;

// угол поворота рулевого колеса CAN  1bit - 1/1024 рад
// переводим угол поворота рулевого колеса в угол колес
// DSC_Ratio_Steer -  обратнaя величина iрм - передаточное число Steer
// iрм - передаточное число рулевого механизма
// Ratio_Steer = 8*65536/iрм
// размерность Teta_Steering_Wheel 1рад  - 8192 lsb
//                                 1grad  - 143 lsb

// -------------- учет рулевой трапеции ------------------
// Koef_Steer CFG  коэффициент трапеции
// !!!!!!!!!!!!    НЕ УЧИТЫВАЕМ  !!!!!!!!!!!!!!!!!!

// на больших углах Ratio_Steer уменьшается К увеличивается
// 65536 *256 /8 /12868  (720grad)
//#define   __K_Ratio   326  //1304
/*	SAS.KoefRatio = 65536 + SAS.AngleA * // абсолютная величина угла
			        (int32_t)__K_Ratio * Koef_Steer /65536;
	SAS.Ratio = (int32_t)DSC_Ratio_Steer * SAS.KoefRatio / 65536;

// при повороте вправо  нужно уменьшать SAS.Ratio !!!
// 500 grad 1.05
// 65536 * 0.05 / 8936 / 50	* 65536
#define   __K_Ratio_Sign   480
	SAS.Ratio_Ksign = 65536;
	if(SAS.Steering < 0)
	   SAS.Ratio_Ksign -= SAS.AngleA * // абсолютная величина угла
	                     (int32_t)__K_Ratio_Sign * Koef_Steer /65536;
	SAS.Ratio = (int32_t)DSC_Ratio_Steer * SAS.Ratio_Ksign / 65536;
*/
	// !!!!!!!!!!!! настройка !!!!!!!!!!!!!!
    // Увеличение iрм - передаточное число Steer
	// Уменьшает  Yaw rate
	SAS.Ratio = DSC_Ratio_Steer;
	Teta_for_Ackermann = ((int32_t)SAS.Steering * (int32_t)SAS.Ratio) /65536;

	Teta_Steering_Wheel = ((int32_t)Steering_Angle * (int32_t)SAS.Ratio) /65536;
	CosinusTeta = CosinusRad(Teta_Steering_Wheel);

	/*=== оценка Yaw rate формула Ackermann ===*/
// размерность OmegaZ_Acker 1рад/c  - 8192 lsb
// DSC_K_l_Acker 16640	DSC_K_Q_Acker 8236
	OmegaZ_Acker = Ackermann_OmegaZ(Teta_for_Ackermann);

// Yaw rate формула Ackermann без задержки
	OmegaZ_Steer = Ackermann_OmegaZ(Teta_Steering_Wheel);

// Emulation
	if(!DSC_Emul_Fl)
      OmegaZ_Des = OmegaZ_Acker;  // желаемая OmegaZ
	else
    { OmegaZ_Des = Emul.Akker;
      OmegaZ_Steer = OmegaZ_Des;
    }
	Delay(DelayBuf_OmegaZ_Steer , OmegaZ_Steer, 80);

} // end Ackermann()

void    Road_Estimate (void)
{
//-----------определение Road.Mu---------------------------------
	int16_t   Ay = Acc_Y_est;
	if(Ay < 0) Ay = -Acc_Y_est;
	int16_t   Ax = Acc_X_est;
	if(Ax < 0) Ax = -Acc_X_est;
	if(DYC_RoadAx_Enable) // разрешено использование Ax
	{
	  uint32_t   AyAx = Ay * Ay + Ax * Ax;
      Road.Mu = int_sqrt32(AyAx);
	}
	else Road.Mu = Ay;

// ограничение минимального Mu
#define   __MuRoad_Min    0x0667  //  0.8m/c^2
	if(Road.Mu < __MuRoad_Min) Road.Mu = __MuRoad_Min;
// ограничиваем уменьшение Mu
#define  __RoadMuGrad  0x0007  //0x000E
	if(Road.Mu < (Road.MuF - __RoadMuGrad))
	   Road.Mu = Road.MuF - __RoadMuGrad;
	if(Road.Mu > (Road.MuF + __RoadMuGrad))
	   Road.Mu = Road.MuF + __RoadMuGrad;
	Road.MuF = Road.Mu;

#define   __VxRoadMin    0x0500	 // 5km/h
#define   __WzRoadAyMin  0x0A4D  // 18.4deg/c -- 0.8m/c^2 при 5km/h  ??????
    if(Speed_VX_est > __VxRoadMin) // деление на VX
    {  Road.Wz = (Road.Mu * (int32_t)65536) /
    		     (((int32_t)Speed_VX_est * __Koef_AccY_OzD) / 256);
    }
    else  Road.Wz = __WzRoadAyMin;
// фильтруем
    Filter_RoadOmegaZ.Xn = (int32_t)Road.Wz;
    Road.OmegaZ = Filter_Cheb(&Filter_RoadOmegaZ, Koef_Filtr2Hz);//Koef_Filtr1Hz
// на больших скоростях Road.OmegaZ понижается !!!
// ограничиваем минимум
#define   __WzRoadMin  __4dps  // 4deg/c
    if(Road.OmegaZ <__WzRoadMin) Road.OmegaZ = __WzRoadMin;

    // сцеплениe дороги	при торможении
    Road.MuBr = Ax;
    if(Road.MuBr < __MuRoad_Min)
       Road.MuBr = __MuRoad_Min;
} // end  Road_Estimate ()

//-------------------------------------------------------------

void    VDC_Input_Var(void)
{
#ifdef  __AGS_SAS
// ---------------обрабатываем  AGS------------------------------
	if(!AGS_NotReady)
	{ if(DSC_Omega_Z_neg) Omega_Z_sen = -CANS.SENS.GyroZ;
	  else                Omega_Z_sen = CANS.SENS.GyroZ;
	  // Accel_Y
	  if(DSC_Accel_Y_neg)
	  { Acc_Y_sen = -CANS.SENS.AccelY;
		Omega_Y_sen = -CANS.SENS.GyroY;
	  }
	  else
	  { Acc_Y_sen = CANS.SENS.AccelY;
		Omega_Y_sen = CANS.SENS.GyroY;
	  }
	  Acc_Y_sen -= DSC_OffSet_AccY;
	  // Accel_X
	  if(DSC_Accel_X_neg)
	  { Acc_X_sen = -CANS.SENS.AccelX;
		Omega_X_sen = -CANS.SENS.GyroX;
	  }
	  else
	  { Acc_X_sen = CANS.SENS.AccelX;
		Omega_X_sen = CANS.SENS.GyroX;
	  }
	  Acc_X_sen -= DSC_OffSet_AccX;
	  // Accel_Z
	  Acc_Z_sen = CANS.SENS.AccelZ;
	  // Yaw Rate
	  GyroZ.Delta = Gyro_Delta;
	  GyroZ.Reliable = Gyro_Reliable;
	  GyroZ.Change = Gyro_Change;
	  Sensor_OFFSET(&GyroZ, Omega_Z_sen);
	  if(AOS_OmegaZ_Enable)
		   GyroZ.Val = Omega_Z_sen - GyroZ.OffSet;
	  else GyroZ.Val = Omega_Z_sen;
	  // Roll Rate
	  GyroX.Delta = Gyro_Delta1;
	  GyroX.Reliable = Gyro_Reliable1;
	  GyroX.Change = Gyro_Change1;
	  Sensor_OFFSET(&GyroX, Omega_X_sen);
	  GyroX.Val = Omega_X_sen - GyroX.OffSet;
	  if(GyroX.Cplt==5) GyroX.Cplt = 0; //повторный запуск
	  // Pitch Rate
	  GyroY.Delta = Gyro_Delta1;
	  GyroY.Reliable = Gyro_Reliable1;
	  GyroY.Change = Gyro_Change1;
	  Sensor_OFFSET(&GyroY, Omega_Y_sen);
	  if(AccX_WyOS_Enable)
	  { GyroY.Val = Omega_Y_sen - GyroY.OffSet;
		if(GyroY.Cplt==5)// && AccX_WyOS_Repeat)
		   GyroY.Cplt = 0;   //повторный запуск
	  }
	  else GyroY.Val = Omega_Y_sen;
	}
    else  // AGS_NotReady
	{ Acc_X_sen = 0; Acc_Y_sen = 0;
	  Omega_Z_sen = 0; Omega_X_sen = 0; Omega_Y_sen = 0;
	  GyroZ.Val = 0; GyroX.Val = 0; GyroY.Val = 0;
    }
// ---------------обрабатываем  SAS------------------------------
    if(AGS_Upit_ON)
    {
	  if(DSC_Steer_neg)  SAS.Angle = -SAS.value;
	  else				 SAS.Angle = SAS.value;
	  // пилы с датчика руля
// размерность Steer Angle    1 deg	 - 17,87 bit
#define     Steer_Reliable_Value 0x1800 // достоверные значения датчика руля 344 deg
// первый метод определения Teta_Dr_sen
	  if(!SASdata_Fail && !CAN_SAS_Fail)
	  { SAS_Not_Fail = 1;
	    // определение Range_Detection
	    if(!Range_Detection)
	    { if(SAS.Angle > 0 &&
             SAS.Angle < Steer_Reliable_Value)
		  { Range_Detection = 1;
		    Steer_Pos_Ok = 1;
		    Steer_Neg_Ok = 0;
		  }
		  if(SAS.Angle < 0 &&
		     SAS.Angle > -Steer_Reliable_Value)
		  { Range_Detection = 1;
		    Steer_Neg_Ok = 1;
		    Steer_Pos_Ok = 0;
		  }
		}
	    else //????
	    {// смена знака
	      if(Steer_Pos_Ok)
		  { if(SAS.Angle < 0 &&
		       SAS.Angle > -Steer_Reliable_Value &&
			   Steer_sen < Sen_Steer_DigMax)
		    { Steer_Neg_Ok = 1;
		      Steer_Pos_Ok = 0;
		    }
		  }
		  if(Steer_Neg_Ok)
		  {	if(SAS.Angle > 0 &&
		       SAS.Angle < Steer_Reliable_Value &&
			   Steer_sen > -Sen_Steer_DigMax)
		    { Steer_Pos_Ok = 1;
		      Steer_Neg_Ok = 0;
		    }
		  }
	    }
	  }
	  else Steering_Flags &= ~__Clr_Steer_Flags;// ошибки CAN
	  // преобразование пил с датчика в угол руля
	  if(Steer_Pos_Ok)
	  {  Steer_Reliable = 1;
	    if(SAS.Angle >= 0) Steer_sen = SAS.Angle;
		else
		{ Steer_sen = (Sen_Steer_DigMax<<1)+ SAS.Angle;
		  if(SAS.Angle > -Steer_Reliable_Value) Range_Fail = 1;
	    }
	  }
	  else
	  if(Steer_Neg_Ok)
	  {  Steer_Reliable = 1;
		if(SAS.Angle <= 0) Steer_sen = SAS.Angle;
		else
		{ Steer_sen = -(Sen_Steer_DigMax<<1)+ SAS.Angle;
		  if(SAS.Angle < Steer_Reliable_Value) Range_Fail = 1;
		}
	  }
	  else
	  { Steer_sen = 0; // нет Steer_Pos_Ok и Steer_Neg_Ok
	    Steer_Reliable = 0;
	  }
    } // end if(!AGS_UpitOff)
	else
	{ Steering_Flags &= ~__Clr_Steer_Flags;
	  Steer_sen = 0;
    }
// --------- обрабатываем  PS на CANS ---------------
//----------ECAS----------------
    // выход фильтра используется для обнуления отрицательных uint16_t
    uint16_t FiltOut;
    int16_t  Val;
    if(ECAS_PS_Install)
    { // Bellow Pressure Resolution: 0.1 kPa/bit,
	  // приводим BellowPress к размерности 5/256 kPa/bit
      // k = 50 *13,8768
#define __K_Bellow_CAN   694
	  if(!CAN_ECAS_PS_Fail)
	  { Val = CANS.BPS.Value - ECAS.CFG.PS_OffSet;
	    if(Val > 0)
	         ECAS.ASC4.BPS_CAN = Val;
	    else ECAS.ASC4.BPS_CAN = 0;
	  }
	  else ECAS.ASC4.BPS_CAN = 0;
      // фильтруем BellowPress
	  ECAS.ASC4.Filtr_BPS.Xn = ECAS.ASC4.BPS_CAN *
			              (uint32_t)__K_Bellow_CAN /256;
      FiltOut = Filter_Cheb(&ECAS.ASC4.Filtr_BPS, Koef_Filtr2Hz);
	  if(FiltOut < __uintYnMinus)
		   ECAS.ASC4.SensPress = FiltOut;
	  else ECAS.ASC4.SensPress = 0;   // отрицательные значения обнуляем

      if(ECAS_PS_Calibr)
 	  { // давление в балоне снаряженной машины
 	    ECAS.ASC4.Pb_Empty = (Load.CFG.Truck.Empty_Axis_Rear / //*
 			                Load.CFG.Truck.Num_RearAxis -
 				            (uint32_t)ECAS.CFG.Susp_Mass) * 64 /
 				    	   ECAS.CFG.Kmp;
 	    if( ECAS.ASC4.Pb_Empty > 0)
 	    { // показания датчика снаряженной машины
 		  ECAS.ASC4.Ps_Empty = ECAS.ASC4.Pb_Empty * 256 /
 				            __K_Bellow_CAN;
 		  // находим офсет для Hitch_Fz = 0
 		  Val = CANS.BPS.Value - ECAS.ASC4.Ps_Empty;
 		  if(Val > 0)
 			   ECAS.PS_OffSet = Val;
 		  else ECAS.PS_OffSet = 0;
 	    }
 	    else
 	    ECAS.PS_OffSet = BrakeP.OffSet;
 	  }
    }
    else
    {  ECAS.ASC4.SensPress = 0;
       ECAS.PS_OffSet = 0;
    }
//----------измерительные датчики давления------------
    Press_Sen1 = PressCANSensor(&PSen1, CANS.BPS.PS1);
    Press_Sen2 = PressCANSensor(&PSen2, CANS.BPS.PS2); //
    Press_Sen3 = PressCANSensor(&PSen3, CANS.BPS.PS3);
    Press_Sen4 = PressCANSensor(&PSen4, CANS.BPS.PS4); //
#endif //__AGS_SAS

// ---------------обрабатываем  BPS-----------------
#ifdef   __AxisF_Compile

    if(Break_PS_CAN)
    { // BPS CAN
      if(!CAN_BPS_Fail && DSC_BPS_Install)
    	   BrakeP.Val = PressCANSensor(&BrakeP, CANS.BPS.Value);
      else BrakeP.Val = 0;
      Pcb_Test_BrPS_Val = PressAnalogSensor(&BrakeP, ADC_Press);
    }
    else
	{ // BPS !!Stop!!
      BrakeP.Val = PressAnalogSensor(&BrakeP, ADC_Press);
      Pcb_Test_BrPS_Val = (uint16_t)BrakeP.Val;
	}

#endif //__AxisF

// ---------------обрабатываем  Trailer PS------------------------
#ifdef 	 ADC_AUX2
#ifdef 	 __Rectangular_Board
    // выход фильтра используется для обнуления отрицательных uint16_t
    uint16_t FiltOut;
#endif
    TrailerP.Val = PressAnalogSensor(&TrailerP, ADC_AUX2);
    // фильтруем TrailerPress
	Filter_TrailerPress.Xn = TrailerP.Val;
	if(FiltrTrailerPress_Enable)
	{
	   FiltOut = Filter_Cheb(&Filter_TrailerPress, Koef_Filtr14Hz);
	   if(FiltOut < __uintYnMinus)
		    TrailerPress = FiltOut;
	   else TrailerPress = 0;   // отрицательные значения обнуляем
	}
	else TrailerPress = _Lo_32(Filter_TrailerPress.Xn);
#endif

// -------------обрабатываем что приняли от CAN_j1939------------------
#ifdef __CAN_j1939
    // принимаемые данные по двигателю
	// EEC1
    CAN_Engine.Taxo = CANJ.EEC1.Taxo;
    CAN_Engine.TaxoN = CAN_Engine.Taxo / 80; // 1 bit - 10 об/мин
    if(CANJ.EEC1.Driver >= 0x7D && //125
	   CANJ.EEC1.Driver <= 0xFA &&   //250
		 Find_EEC1 && !Tout_EEC1)
    { CAN_Engine.Driver = CANJ.EEC1.Driver - 0x7D;
	  Driver_Fail = 0;
    }
    else
    { CAN_Engine.Driver = 0;
	  Driver_Fail = 1;
    }
    if(CANJ.EEC1.Torque >= 0x7D && //125
	   CANJ.EEC1.Torque <= 0xFA &&   //250
		 Find_EEC1 && !Tout_EEC1)
    { CAN_Engine.Torque = CANJ.EEC1.Torque - 0x7D;
	  Torque_Fail = 0;
    }
    else
    { CAN_Engine.Torque = 0;
	  Torque_Fail = 1;
    }
	//-EEC2-
    if(Find_EEC2 && !Tout_EEC2 &&
	   CANJ.EEC2.Accelerator <= 0xFA) //250
    	 CAN_Engine.Accelerator = CANJ.EEC2.Accelerator/2; // 0 - 125%
    else CAN_Engine.Accelerator = 0;
    if(Find_EEC2 && !Tout_EEC2 &&
       CANJ.EEC2.Torque <= 0xFA) //250
         CAN_Engine.Load = CANJ.EEC2.Torque;
    else CAN_Engine.Load = 0;
    // New для нужна птичка
    if(CAN_Engine.Driver < CAN_Engine.Accelerator)
       CAN_Engine.Driver = CAN_Engine.Accelerator;

    // принимаемые данные XBR
	if(Dia_HBR)
	{ XBR.AccDemand = 0x697F-_CAN_int16_Offset;
	  XBR_Mode =    0x20;
	  XBR.Urgency = 0xFA; // 100 %
	  CAN_XBR_Fail = 0;
    }
    else
    if((Find_XBR_1 || Find_XBR_1) &&
       !Tout_XBR_1 && !Tout_XBR_1)
    { XBR.AccDemand = CANJ.XBR_1.Acc_Demand - _CAN_int16_Offset;
	  XBR_Mode = CANJ.XBR_1.Status.Byte;
	  XBR.Urgency = CANJ.XBR_1.Urgency;
	  CAN_XBR_Fail = 0;
    }
    else CAN_XBR_Fail = 1;

    // Body
	CANJ.PGN_FF20.Status1 = 0;
	CANJ.PGN_FF20.Status2 = 0;
	if(Find_PGN_FF20 && !Tout_PGN_FF20)
	{ if(CANJ.PGN_FF20.B2.Bits.bit7_8 ==__BitsON)
		 CANJ.PGN_FF20.Status1 |= 0x01; // SPN 70 Parking
	  if(CANJ.PGN_FF20.B3.Bits.bit1_2 ==__BitsON)
		 CANJ.PGN_FF20.Status1 |= 0x02; // неисправность торм.системы
	  if(CANJ.PGN_FF20.B4.Bits.bit5_6 ==__BitsON)
		 CANJ.PGN_FF20.Status1 |= 0x04; // неисправность торм.контур 1
	  if(CANJ.PGN_FF20.B4.Bits.bit7_8 ==__BitsON)
		 CANJ.PGN_FF20.Status1 |= 0x08; // неисправность торм.контур 2
	  if(CANJ.PGN_FF20.B5.Bits.bit5_6 ==__BitsON)
		 CANJ.PGN_FF20.Status1 |= 0x10; // межколесный дифференциал
	  if(CANJ.PGN_FF20.B5.Bits.bit7_8 ==__BitsON)
		 CANJ.PGN_FF20.Status1 |= 0x20; // межосевой дифференциал
	  if(CANJ.PGN_FF20.B8.Bits.bit5_6 ==__BitsON)
		 CANJ.PGN_FF20.Status1 |= 0x40; // нейтраль
	  if(CANJ.PGN_FF20.B3.Bits.bit3_4 ==__BitsON)
		 CANJ.PGN_FF20.Status1 |= 0x80; // демультиприкатор повышенные
	  // Status2
	  if(CANJ.PGN_FF20.B3.Bits.bit5_6 ==__BitsON)
		 CANJ.PGN_FF20.Status2 |= 0x01; // износ тормозных накладок
	  if(CANJ.PGN_FF20.B7.Bits.bit1_2 ==__BitsON)
		 CANJ.PGN_FF20.Status2 |= 0x02; // критическая неисправность EDC
	  if(CANJ.PGN_FF20.B8.Bits.bit3_4 ==__BitsON)
		 CANJ.PGN_FF20.Status2 |= 0x04; // НЕ критическая неисправность EDC
	  if(CANJ.PGN_FF20.B7.Bits.bit3_4 ==__BitsON)
		 CANJ.PGN_FF20.Status2 |= 0x08; // SPN 595 Cruise Control Active
	  if(CANJ.PGN_FF20.B6.Bits.bit7_8 ==__BitsON)
		 CANJ.PGN_FF20.Status2 |= 0x10; // разряд АКБ
	  if(CANJ.PGN_FF20.B7.Bits.bit7_8 ==__BitsON)
		 CANJ.PGN_FF20.Status2 |= 0x20; // режим помощъ при трогании
	  if(CANJ.PGN_FF20.B4.Bits.bit1_2 ==__BitsON)
		 CANJ.PGN_FF20.Status2 |= 0x40; // SPN 5082 ?
	}
	CANJ.PGN_FF21.Status1 = 0;
	if(Find_PGN_FF21 && !Tout_PGN_FF21)
	{ if(CANJ.PGN_FF21.B1.Bits.bit3_4 ==__BitsON)
		 CANJ.PGN_FF21.Status1 |= 0x01; // износ тормозных накладок
	  if(CANJ.PGN_FF21.B2.Bits.bit1_2 ==__BitsON)
		 CANJ.PGN_FF21.Status1 |= 0x02; // не транспортное положение
	  if(CANJ.PGN_FF21.B2.Bits.bit3_4 ==__BitsON)
		 CANJ.PGN_FF21.Status1 |= 0x04; // нейтраль раздатки
	  if(CANJ.PGN_FF21.B5.Bits.bit5_6 ==__BitsON)
		 CANJ.PGN_FF21.Status1 |= 0x08; // делитель пониженные передачи
	  if(CANJ.PGN_FF21.B6.Bits.bit3_4 ==__BitsON)
		 CANJ.PGN_FF21.Status1 |= 0x10; // дифференциал переднего моста
	  if(CANJ.PGN_FF21.B6.Bits.bit5_6 ==__BitsON)
		 CANJ.PGN_FF21.Status1 |= 0x20; // межосевой дифференциал раздатки
	  if(CANJ.PGN_FF21.B1.Bits.bit7_8 ==__BitsON)
		 CANJ.PGN_FF21.Status1 |= 0x40; // SPN 520 замедлитель
	  if((CANJ.PGN_FF21.B7.Bits.bit3_4 ==__BitsON) &&
		 (CANJ.PGN_FF21.B7.Bits.bit5_6 ==__BitsON))
		 CANJ.PGN_FF21.Status1 |= 0x80; // неисправность руля
	}
	if(Find_PGN_FF22 && !Tout_PGN_FF22)
	{ if(CANJ.PGN_FF22.AIR1 <__Error8) // SPN117 Brake Primary Pressure
		 Body.PGN_FF22_AIR1 = CANJ.PGN_FF22.AIR1;
	  if(CANJ.PGN_FF22.AIR2 <__Error8) // SPN118 Brake Secondary Pressure
	     Body.PGN_FF22_AIR2 = CANJ.PGN_FF22.AIR2;
	  if(CANJ.PGN_FF22.Temp <__Error8) // SPN110 Engine Coolant Temperature
	     Body.PGN_FF22_Temp = CANJ.PGN_FF22.Temp;
	  if(CANJ.PGN_FF22.Taxo <__Error16) //
	     Body.PGN_FF22_Taxo = CANJ.PGN_FF22.Taxo;
	}
	if(Find_PGN_FF23 && !Tout_PGN_FF23 &&
	   CANJ.PGN_FF23.Ubat <__Error8)
	   Body.PGN_FF23_Ubat = CANJ.PGN_FF23.Ubat;
	Body_PGN_FF20_Status1 = CANJ.PGN_FF20.Status1;
	Body_PGN_FF20_Status2 = CANJ.PGN_FF20.Status2;
	Body_PGN_FF21_Status1 = CANJ.PGN_FF21.Status1;
    // Halt brake switch EBC1
    if(Find_EBC1 && !Tout_EBC1)
    { EBC1_B8 = CANJ.EBC1.B8.Byte;
	  EBC1_B3 = CANJ.EBC1.B3.Byte;
	  EBC1_Fail = 0;
	  if(HaltSW_SPN2911 ==__BitsON)
	       HaltBrake_Switch = 1;
	  else HaltBrake_Switch = 0;
    }
    else
    { EBC1_B8  = 0xFF;
	  EBC1_B3  = 0xFF;
	  EBC1_Fail = 1;
    }
// давление в ресиверах
// Resolution:  8 kPa/bit  ??4
#define __K_AirPress    268 //410
// ограничиваем градиент уменьшения
// из-за некорректных показаний
// 1,05атм за 5сек
#define __Dec_Air_Grad  100//10
#define __AirPress_Max    0x8C00; // 7,0atm
    // давление контура 1 Front
    if(CANJ.AIR1.Circuit1_Press < __Error8 &&  // достоверно
       CANJ.AIR1.Circuit1_Press > 0x14 &&
		   Find_AIR1)    // >2atm
    {    Brake.Front.AirCAN = CANJ.AIR1.Circuit1_Press * __K_AirPress;
      if((Brake.Front.AirCAN +__Dec_Air_Grad) <
          Brake.Front.Air)
           Brake.Front.Air -=__Dec_Air_Grad;
      else Brake.Front.Air = Brake.Front.AirCAN;
    }
    else Brake.Front.Air = __AirPress_Max;
    FrontDif.AirPress = Brake.Front.Air;
    // давление контура 2 Rear
    if(CANJ.AIR1.Circuit2_Press < __Error8 &&  // достоверно
       CANJ.AIR1.Circuit2_Press > 0x14 &&
		   Find_AIR1)    // >2atm
    {     Brake.Rear.AirCAN = CANJ.AIR1.Circuit2_Press * __K_AirPress;
      if((Brake.Rear.AirCAN +__Dec_Air_Grad) <
          Brake.Rear.Air)
           Brake.Rear.Air -=__Dec_Air_Grad;
      else Brake.Rear.Air = Brake.Rear.AirCAN;
    }
    else Brake.Rear.Air = __AirPress_Max;
    RearDif.AirPress = Brake.Rear.Air;
    // состояниe дверей
    if(Find_DC1 && !Tout_DC1)
    { Door_Status = CANJ.DC1_Status.Byte;
	  Door_Fail = 0;
    }
    else
    { Door_Status = 0xFF;
	  Door_Fail = 1;
    }
    // давление в подушках пневмоподвески
    uint16_t Bellow = CANJ.ASC4.Bellow_Press_RR;
    if(Bellow < __Error16 &&
	   Bellow > 0x0100 &&
	   Find_ASC4)
    {  ECAS.ASC4.BellowPress = Bellow;
//	   ECAS.ASC4.Find = 1;
    }
    else
    { if(ECAS_PS_Install &&
		 ECAS.ASC4.SensPress)
		   ECAS.ASC4.BellowPress = ECAS.ASC4.SensPress;
	  else ECAS.ASC4.BellowPress = 0;
    }
    // CCVS
    CCVS.Status.Byte = 0;
    CCVS.Speed = 0;
    if(Find_CCVS_Eng && !Tout_CCVS_Eng)
    { if(CANJ.CCVS.Engine.B1.Bits.bit3_4  ==__BitsON)
    	 CCVS.Status.Byte |= __Bit34;  // Parking Brake Switch SPN70
      if(CANJ.CCVS.Engine.B4.Bits.bit5_6  ==__BitsON)
    	 CCVS.Status.Byte |= __Bit56; // Brake Switch SPN597
      if(CANJ.CCVS.Engine.B4.Bits.bit7_8  ==__BitsON)
         CCVS.Status.Byte |= __Bit78; // Clutch Switch SPN598
      if((CANJ.CCVS.Engine.Speed < __Error16) &&
	     (CANJ.CCVS.Engine.Speed > CCVS.Speed)) // наибольшая ??
    	CCVS.Speed = CANJ.CCVS.Engine.Speed; // Wheel-Based Vehicle Speed SPN84
    }
    if(Find_CCVS_Body && !Tout_CCVS_Body)
    { if(CANJ.CCVS.Body.B1.Bits.bit3_4  ==__BitsON)
    	 CCVS.Status.Byte |= __Bit34;  // Parking Brake Switch SPN70
      if(CANJ.CCVS.Body.B4.Bits.bit5_6  ==__BitsON)
    	 CCVS.Status.Byte |= __Bit56; // Brake Switch SPN597
      if(CANJ.CCVS.Body.B4.Bits.bit7_8  ==__BitsON)
         CCVS.Status.Byte |= __Bit78; // Clutch Switch SPN598
      if((CANJ.CCVS.Body.Speed < __Error16) &&
	     (CANJ.CCVS.Body.Speed > CCVS.Speed)) // наибольшая ??
    	CCVS.Speed = CANJ.CCVS.Body.Speed; // Wheel-Based Vehicle Speed SPN84
    }
    if(Find_CCVS_Dash && !Tout_CCVS_Dash)
    { if(CANJ.CCVS.Dash.B1.Bits.bit3_4  ==__BitsON)
    	 CCVS.Status.Byte |= __Bit34;  // Parking Brake Switch SPN70
      if(CANJ.CCVS.Dash.B4.Bits.bit5_6  ==__BitsON)
    	 CCVS.Status.Byte |= __Bit56; // Brake Switch SPN597
      if(CANJ.CCVS.Dash.B4.Bits.bit7_8  ==__BitsON)
         CCVS.Status.Byte |= __Bit78; // Clutch Switch SPN598
      if((CANJ.CCVS.Dash.Speed < __Error16) &&
	     (CANJ.CCVS.Dash.Speed > CCVS.Speed)) // наибольшая ??
    	CCVS.Speed = CANJ.CCVS.Dash.Speed; // Wheel-Based Vehicle Speed SPN84
    }

    // TCO
    if(Find_TCO1 && !Tout_TCO1)
    { TCO.Status = 0;
      // Vehicle motion SPN1611
      if(CANJ.TCO1.B1.Bits.bit7_8  ==__BitsON)
              TCO.Status |= __Bit56; // сдвинуто вправо
	  // System event SPN1622
	  if(CANJ.TCO1.B4.Bits.bit1_2  ==__BitsON)
	          TCO.Status |= __Bit12;
	  // Direction indicator SPN1619
	  // 00 - Forward   01 - Reverse
	  if(CANJ.TCO1.B4.Bits.bit7_8  ==__BitsON)
	          TCO.Status |= __Bit78;
	  // Tachograph vehicle speed SPN1624
	  if(CANJ.TCO1.Speed < __Error16)
		      TCO.Speed = CANJ.TCO1.Speed;
      // Tachograph output shaft speed SPN1623
	  TCO.Taxo = CANJ.TCO1.TaxoOut;  // используется в TransmissionKTS()
	}
    else
    {
        TCO.Status = 0;
        TCO.Speed =  __Error16;
    }
    // Total Vehicle Distance SPN917
	if(Find_VDHR && !Tout_VDHR)
	  TCO.HDRH_Distance = CANJ.VDHR_Distance;
    // замедлитель кардана
    Retarder.D_10h.Torque = CANJ.ERC1.RD.Torque;
    Retarder.D_10h.Status = CANJ.ERC1.RD.Mode.Byte;
    // замедлитель двигателя
    Retarder.E_0Fh.Torque = CANJ.ERC1.RE.Torque;
    Retarder.E_0Fh.Status = CANJ.ERC1.RE.Mode.Byte;
    // замедлитель горный тормоз
    Retarder.M_29h.Torque = CANJ.ERC1.REX.Torque;
    Retarder.M_29h.Status = CANJ.ERC1.REX.Mode.Byte;
    // замедлитель трансмиссия (коробка-автомат)
    Retarder.T_03h.Torque = CANJ.ERC1.RG.Torque;
    Retarder.T_03h.Status = CANJ.ERC1.RG.Mode.Byte;
    // трансмиссия (коробка-автомат)
    if(Find_ETC2 && ! Tout_ETC2)
         CAN_Engine.Gear.Num = CANJ.ETC2.Gear;
    else CAN_Engine.Gear.Num = 0;
    if(Find_ETC1 && ! Tout_ETC1)
         CAN_Gear_Status = CANJ.ETC1.B1.Byte;
    else CAN_Gear_Status = 0;
    // EC1
    if(Find_EC1)
    { CAN_Engine.EC1.RefTorque = CANJ.EC1.RefTorque;
      if(CANJ.EC1.TorqueP1 >= 0x7D &&
	     CANJ.EC1.TorqueP1 < 0xFE)
		   CAN_Engine.EC1.TorquePoint1 = CANJ.EC1.TorqueP1 - 0x7D; // это не XX
	  else CAN_Engine.EC1.TorquePoint1 = 0;
	  if(CANJ.EC1.TorqueP5 >= 0x7D &&
		 CANJ.EC1.TorqueP5  < 0xFE)
		   CAN_Engine.EC1.TorquePoint5 = CANJ.EC1.TorqueP5 - 0x7D; // это не XX
	  else CAN_Engine.EC1.TorquePoint5 = 0;
      CAN_Engine.EC1.TaxoPoint1 = CANJ.EC1.TaxoP1;
#define __Taxo_Point1  0x15E0  //700rpm
#define __Taxo_P1_Min  0x0C80  //400rpm
#define __Taxo_P1_Max  0x1F40  //1000rpm
	  if(CAN_Engine.EC1.TaxoPoint1 > __Taxo_P1_Min &&
	     CAN_Engine.EC1.TaxoPoint1 < __Taxo_P1_Max &&
	     Engine_EC1_Enable)
		   Engine.TaxoXX = CAN_Engine.EC1.TaxoPoint1;
	  else Engine.TaxoXX = __Taxo_Point1;
      CAN_Engine.EC1.TaxoPoint2 = CANJ.EC1.TaxoP2;
#define __Taxo_Point2  0x41A0  //2100rpm
#define __Taxo_P2_Min  0x3200  //1600rpm
#define __Taxo_P2_Max  0x5140  //2600rpm
	  if(CAN_Engine.EC1.TaxoPoint2 > __Taxo_P2_Min &&
	     CAN_Engine.EC1.TaxoPoint2 < __Taxo_P2_Max &&
	     Engine_EC1_Enable)
		   Engine.TaxoMax = CAN_Engine.EC1.TaxoPoint2;
	  else Engine.TaxoMax = __Taxo_Point2;
  	  // PeakTorque для Diag
  	  CAN_Engine.EC1.PeakTorque = (uint32_t)CAN_Engine.EC1.RefTorque *
                                            CAN_Engine.EC1.TorquePoint5 /100;
    }
    else
    { CAN_Engine.EC1.PeakTorque = 0;
      Engine.TaxoXX = __Taxo_Point1;
      Engine.TaxoMax = __Taxo_Point2;
    }
	// PeakTorque для расчетов
	if(CAN_Engine.EC1.PeakTorque &&
	   Engine_EC1_Enable)
	     Engine.PeakTorq = CAN_Engine.EC1.PeakTorque;
	else Engine.PeakTorq = Engine.CFG.PeakTorq;
#endif
#ifdef   __AxisF_Compile
// ------------------- Emul_Input_Var------------------
    if(!DSC_Emul_Fl)
    { if(Dia_Emul_Fl)
      {  //Dia_Emul_Fl = 0;
	     if(Emul.Delay_Cnt++ > 10) // задержка на включенние Эмуляции
	     DSC_Emul_Fl = 1;
		 if(Emul.Rx_Data[1] < 127)
		      Emul.Sign_Akker = 0;
		 else Emul.Sign_Akker = 1;
		 if(Emul.Rx_Data[2] < 127)
			  Emul.Sign_OmegaZ = 0;
		 else Emul.Sign_OmegaZ = 1;
		 if(Emul.Rx_Data[3] < 127)
			  Emul.Sign_AccY = 0;
		 else Emul.Sign_AccY = 1;
		 if(Emul.Rx_Data[4] < 127)
			  Emul.Sign_AccX = 0;
		 else Emul.Sign_AccX = 1;
      }
      else
      if(Emul.Delay_Cnt)
    	 Emul.Delay_Cnt--;
    }
	else // задержка на выключенние
	{ if(Emul.Delay_Cnt)
	  {  Emul.Delay_Cnt--;
	    if(!Emul.Delay_Cnt)
	    {
		    Wheel_FL.SpeedI = 0;
		    Wheel_FR.SpeedI = 0;
	    }
	  }
	  else
	  { DSC_Emul_Fl = 0;
	    Dia_Emul_Fl = 0;
	  }
	}

	if(DSC_Emul_Fl)
	{ //PrBr,DSC_Akker,DSC_OmegaZ,DSC_AccY,DSC_AccX
	  //	EmulDSC_Data[0]
	  if(Emul.Rx_Data[1]<5 && Emul.Sign_Akker)    Emul.Sign_Akker = 0;
	  if(Emul.Rx_Data[1]>247 && !Emul.Sign_Akker) Emul.Sign_Akker = 1;
	  if(!Emul.Sign_Akker)
		   Emul.Akker = (int16_t)Emul.Rx_Data[1] * 32;
	  else Emul.Akker = (int16_t)Emul.Rx_Data[1] * 32 - 0x2000; // 256*32

	  if(Emul.Rx_Data[2]<5 && Emul.Sign_OmegaZ)    Emul.Sign_OmegaZ = 0;
	  if(Emul.Rx_Data[2]>250 && !Emul.Sign_OmegaZ) Emul.Sign_OmegaZ = 1;
	  if(!Emul.Sign_OmegaZ)
		   Emul.OmegaZ = (int16_t)Emul.Rx_Data[2] * 32;
	  else Emul.OmegaZ = (int16_t)Emul.Rx_Data[2] * 32 - 0x2000;
	  //!! Не используется
	  uint8_t Ax;
	  uint8_t Ay;
	  if(!Emul_AccX_AccY) // птичка Expert -> Validation -> Utils
	  { Ax = Emul.Rx_Data[4];
	    Ay = Emul.Rx_Data[3];
	  }
	  else
	  { Ax = Emul.Rx_Data[3];
	    Ay = Emul.Rx_Data[4];
	  }
	  if(Ax < 5 && Emul.Sign_AccX)    Emul.Sign_AccX = 0;
	  if(Ax > 250 && !Emul.Sign_AccX) Emul.Sign_AccX = 1;
	  if(!Emul.Sign_AccX)
		   Emul.AccX = ((int32_t)Ax * 0xCCCD)/256;// /1,25
	  else Emul.AccX = ((int32_t)Ax * 0xCCCD)/256 - 0xCCCD;

	  if(Ay < 5 && Emul.Sign_AccY)    Emul.Sign_AccY = 0;
	  if(Ay > 250 && !Emul.Sign_AccY) Emul.Sign_AccY = 1;
	  if(!Emul.Sign_AccY)
		   Emul.AccY = ((int32_t)Ay * 0xCCCD)/256;// /1,25
	  else Emul.AccY = ((int32_t)Ay * 0xCCCD)/256 - 0xCCCD;

	  Emul.BreakPress = Emul.Rx_Data[0]*256;

	  // эмулируемые величины
	  Omega_Z_est = Emul.OmegaZ;
	  AccelY.Value = Emul.AccY;
	  AccelX.Value = Emul.AccX;
	  Brake.DemandValue = Emul.BreakPress;
	  Range_Detection = 1;

	  Emul.Tx_Data[0] = KL_Status_1 | KL_Status1_MC2; // передаем KL_Status_STM
	  Emul.Tx_Data[1] = _Hi_16(Wheel_FL.Press);
	  Emul.Tx_Data[2] = _Hi_16(Wheel_FR.Press);
	  Emul.Tx_Data[3] = _Hi_16(Wheel_RL.Press);
	  Emul.Tx_Data[4] = _Hi_16(Wheel_RR.Press);
	}
	else
	{ // входная (измеренная) величина
	  uint16_t Ps = BrakeP.Val;
	  Omega_Z_est = GyroZ.Val;
	  AccelY.Value = Acc_Y_sen;
	  AccelX.Value = Acc_X_sen;

// если Нет сигнала датчика торможения
// ABS нет будет нормально подкачивать !!!!!!!
#define   __BP_OnFail_DecX   0x1400	// 2,5m/c^2 // 0,8m/c^2 проблемы Retarder AntiGaz
#define   __BP_OnFail_Pmin   0x0B00	// 0,55atm
#define   __BP_OnFail_Pmax   0x8C00	// 7atm
// коефф. перевода замедления в давление
// Load.Truck.LadenMass/Load.CFG.K_Pr/64
#define   __K_BP_Ax    4  // 5atm на 3m/c2
	if(FailPS_PressEst) // CFG
	{
	  if((ABS_Active ||							   // активно ABS или
		  Acc_X_est < -__BP_OnFail_DecX) &&        // замедляется 2,5m/c2
		 !DYC_BrakeActive &&					   // нет ESP
		 !ROP_BrakeActive &&
		 Speed_VX_est > __PS_Fail_Speed &&         // Едет 5km/h
		 Ps < __PS_Fail_Pmin &&                    // нет сигнала датчика
		 ((s_PrS_Error & __Mask_Err_BPS_ABS) ||    // Error BPS
		  (CCVS_Brake_Active == __BitsON &&	       // включен стоп-сигнал
	       !Stop_Switch_Fail)))                    // и нет ошибки Stop_Signal
	  {
		Brake_M_Fail = 1;
	    if(TrailerPress > __PS_Fail_Pmin)
			  Ps = TrailerPress; // берем давление прицепа
		else
		{ // вычисляем давление через замедление
		   Ps = -Acc_X_est *__K_BP_Ax;
		   if(Ps < __BP_OnFail_Pmin)
		      Ps = __BP_OnFail_Pmin; // минимальные если вклячена лягушка
		   if(Ps > __BP_OnFail_Pmax)
		      Ps = __BP_OnFail_Pmax;
		}
	  }
	  else  Brake_M_Fail = 0;
	}
//	ограничиваем градиент BrakeDemand
#define   __BP_Grad_Dec 0x0400

  	if(BP_Grad_Enable &&
  	   Ps > (Filter_BrakeDemand.Xn + Brake.CFG.Grad_BP/256))
  	Filter_BrakeDemand.Xn += Brake.CFG.Grad_BP/256;
    else
	{ // ограничиваем градиент уменьшения
      if(BP_Grad_Enable &&
    	 (Ps + __BP_Grad_Dec ) < Filter_BrakeDemand.Xn)
      	   Filter_BrakeDemand.Xn -= __BP_Grad_Dec;
      else Filter_BrakeDemand.Xn = (int32_t)Ps;
	}
    // фильтруем Brake.DemandValue
	FiltOut = Filter_Cheb(&Filter_BrakeDemand, Koef_Filtr14Hz);
    if(FiltOut  > __uintYnMinus)
       FiltOut = 0;
    if(Filtr_Brake_Enable)
         Brake.DemandValue = FiltOut;
    else Brake.DemandValue = Filter_BrakeDemand.Xn;
  }

    s_MC1_Error = MC_Error;
#else
    s_MC2_Error = MC_Error;
#endif
} // end VDC_Input_Var()

/*
 ** ===================================================================
 **     Method      :  Pressure_estimate
 **  расчет давления в тормозных камерах
 **  при подкачке P=Pn-1 + (Pmax - Pn-1)*K_Inject
 **  при сливе    P=Pn-1 - Pn-1*K_Exhaust
 ** ===================================================================
 */
#define   __Pd_Thr      0x2000  //0x2800
#define   __dP_Min      0x0A00  //0x1A00
#define   __dP_Max      0x6400  //? ограничение больше 5атм
#define   __P_Max       0x8C00 // 7atm

#define   __Mod_Ke_Inject  0x0129 //0x0229 //
#define   __Dif_Ke_Inject  0x0066

void    DifInject(DifTypeDef* xDif)
{
uint32_t dP;
uint16_t K;

	if(xDif->AirPress > xDif->Press)
		 dP = xDif->AirPress - xDif->Press;
	else dP = 0;
    if(xDif->Press > xDif->P_Full)
    	 K = xDif->K_Inject;
	else K = __Dif_Ke_Inject;
    if(xDif->CutM) K *= 2; // если  закрыт модулятор
    xDif->Press += _Hi_32(dP * K);

} // end DifInject(DifTypeDef* xDif)

void    DifExhaust(DifTypeDef* xDif)
{
	xDif->Press -=_Hi_32(xDif->Press * xDif->K_Exhaust);

} // end DifExhaust(DifTypeDef* xDif)

// процедура выпуска модулятора
void    Exhaust(WheelTypeDef* Wheelx)
{
uint16_t KdP;
	if(Wheelx->DelExh)
	   Wheelx->DelExh--; //
	else
	{ KdP = (uint32_t)Wheelx->Press * Wheelx->K_Exhaust / 65536;
	  if(KdP > Wheelx->Grad_Exh)
		 KdP = Wheelx->Grad_Exh;
	  if(Wheelx->Press > KdP)
	     Wheelx->Press -= KdP;
	  else Wheelx->Press = 0;
	}
	Wheelx->PumpT = 0;
	Wheelx->ExhT++;
}

void    ExhTap(WheelTypeDef* Wheelx)
{
uint16_t dP = (uint32_t)Wheelx->Press -
		      (uint32_t)Wheelx->In_Press;
 int32_t P = Wheelx->Press;

     P -= _Hi_32((uint32_t)dP * Brake.CFG.K_ExhTap);
     if(P < 0) P = 0;
    Wheelx->Press = P;
    Wheelx->PumpT = 0;
}

void    Inject(WheelTypeDef* Wheelx)
{
int32_t dP = (uint32_t)Wheelx->In_Press -
		     (uint32_t)Wheelx->Press;
      if(dP < 0) dP = 0;
	  if(Wheelx->Press > Wheelx->P_Full)
      	   Wheelx->dP_1mc = dP * (uint32_t)Wheelx->K_Inject / 65536;
      else Wheelx->dP_1mc = dP * (uint32_t)Wheelx->K_Inject / 2 / 65536;
      if(Wheelx->dP_1mc > Wheelx->Grad_Pump)
    	 Wheelx->dP_1mc = Wheelx->Grad_Pump; // ограничение
      if(Wheelx->DelInj)
  		 Wheelx->DelInj--;
  	  else
      Wheelx->Press += Wheelx->dP_1mc;
      Wheelx->dPmin = Wheelx->dP_1mc * (Wheelx->CFG.TpumpMin - 1);
      if(Wheelx->dPmin > Wheelx->ABS.CFG.Po)
	     Wheelx->dPmin = Wheelx->ABS.CFG.Po;

} // end Inject(WheelTypeDef* Wheelx)

uint8_t Delay_ModExh (WheelTypeDef* Wheelx)
{
// выпуск не сразу начинается
// зависит от перепада давления на входе и выходе
// задержка учитывается в процедуре выпуска
	uint8_t    Delay = Brake.CFG.Delay.Exh_To;
	int16_t    dP = (uint32_t)Wheelx->In_Press -
			        (uint32_t)Wheelx->Press;
	if(dP > 0)
	       Delay += ((dP * (uint32_t)Brake.CFG.Delay.Exh_Kp / 256) /
		                                             __P_Max); //7atm
  	else   Delay = 0;
	return Delay;

} // end Delay_ModExh(&Wheel_XX)

uint8_t Delay_ModPump (WheelTypeDef* Wheelx)
{
// зависит от давления на выходе
// задержка учитывается в модели давления

int16_t    Delay = Brake.CFG.Delay.Pump_To;
int16_t    dP =  (uint32_t)Wheelx->Press -
		         (uint32_t)Wheelx->ABS.CFG.Pm; // точка перелома
       	if(dP > 0)
       	   Delay -= (dP * (uint32_t)Brake.CFG.Delay.Pump_Kp / __P_Max);  //7atm
        if(Delay < 0)
    	   Delay = 0;
	return Delay;

} // end Delay_ModPump(&Wheel_XX)

uint16_t Pnevmo_AirFlow (WheelTypeDef* Wheelx,
		                 TypeDef_BrakeAxis* BrakeAxis, uint8_t EV)
{ // вызывается в IncValve

	int32_t dP = (uint32_t)BrakeAxis->Pin -
			     (uint32_t)Wheelx->Press;
	if(!EV && // подкачкa
       dP > 0)
    { // определяем падение давления
	  // с учетом коефф. дроселя
	  uint32_t P = dP * BrakeAxis->CFG.K_Pva / 256;
	  // ограничение типа скорость звука
      if(P > BrakeAxis->CFG.dPva)
	     P = BrakeAxis->CFG.dPva;
      // зависимость от вход. дав.
#define   __Kp_P1  0x2800 // 2atm
#define   __Kp_P2  0x5A00 // 4,5atm
      dP = 65536 * (BrakeAxis->Pin -__Kp_P1) /
    	                  (__Kp_P2 -__Kp_P1);
      if(dP < 0) dP = 0;
      if(dP > 65536) dP = 65536;
      P = (uint32_t)P *dP/65536;
	  return P;
    }
    else return 0;
}

uint16_t IncValve (TypeDef_BrakeAxis* BrakeAxis)
{
	uint16_t  P = BrakeAxis->Pin;
	int32_t dP = 0;

	if(!IncValve_Model)
	{ if(P < __P_Max)
	  { if(P > __Pd_Thr)
        { dP = ((uint32_t)P - (uint32_t)__Pd_Thr) / 2;
          if(dP > BrakeAxis->CFG.dPva)
    	     dP = BrakeAxis->CFG.dPva;
        }
      }
      P += dP;
	}
	else
	{ // ---------------- модель --------------------------------------
      if(BrakeAxis == &(Brake.Front))
      { // передняя ось
        // левое
    	BrakeAxis->Drop_L = Pnevmo_AirFlow(&Wheel_FL, BrakeAxis, EV_FL);
        // правое
    	BrakeAxis->Drop_R = Pnevmo_AirFlow(&Wheel_FR, BrakeAxis, EV_FR);
      }
      if(BrakeAxis == &(Brake.Rear))
      { // задняя ось
        // левое
      	BrakeAxis->Drop_L = Pnevmo_AirFlow(&Wheel_RL, BrakeAxis, EV_RL);
        // правое
      	BrakeAxis->Drop_R = Pnevmo_AirFlow(&Wheel_RR, BrakeAxis, EV_RR);

      }
  	  // обшее
  	  P = BrakeAxis->Drop_L +
  		  BrakeAxis->Drop_R;
  	  // фильтрация
  	  if(Filt_AirDrop_Enable)
  	  { BrakeAxis->Filt_AirDrop.Xn = P;
uint16_t Fout = Filter_Cheb(&BrakeAxis->Filt_AirDrop, Koef_Filt1_20Hz);//10Hz
  	    if(Fout < __uintYnMinus)
  		     P = Fout;
  	    else P = 0;
  	  }
  	  // поправка Pin на расход
 	  if(BrakeAxis->Pin > 0x6000)
 		BrakeAxis->Pin += 0x0300;

 	  // с учетом AirDrop
  	  if(BrakeAxis->Pin > P)
  	        P = BrakeAxis->Pin - P;
  	  else  P = BrakeAxis->Pin;
	}
	// ограничение ресивера
    if(P > BrakeAxis->Air)
       P = BrakeAxis->Air;
    return P;

} // end IncValve(&Brake.Axis)

void  ManeuverFlags(void)
{
// флаг отсутствия маневрирования
#define   __NoManeuver_WzThr   0x00F0 //1.68deg/c
#define   __NoManeuver_Delay   0x28   //0.2c
	if(Omega_Z_est > __NoManeuver_WzThr  ||
	   Omega_Z_est < -__NoManeuver_WzThr ||
	   Yes_Maneuver)
	{ // есть маневрирование
		No_Maneuver = 0;
		ManeuverN_Cnt = __NoManeuver_Delay;
	}
	else if(!No_Maneuver && (--ManeuverN_Cnt == 0)) No_Maneuver = 1;

// флаг маневрирования
// ? как  сбросить если руль не в нуле bank  можно через !DYC_Active
#define   __YesManeuver_ThrON   __6dps //__7dps
#define   __YesManeuver_ThrOFF  __3dps //__2dps
#define   __YesManeuver_Delay   0x64   //0.5c
	if(!Yes_Maneuver)
	{ // установка
	  if(Omega_Z_est > __YesManeuver_ThrON ||
		 Omega_Z_est < -__YesManeuver_ThrON ||
		 OmegaZ_Steer > __YesManeuver_ThrON ||
		 OmegaZ_Steer < -__YesManeuver_ThrON)
	  { Yes_Maneuver = 1; ManeuverY_Cnt = __YesManeuver_Delay; }
	}
	else
	{ // сброс
	  if(Omega_Z_est < __YesManeuver_ThrOFF &&
		 Omega_Z_est > -__YesManeuver_ThrOFF &&
		 OmegaZ_Steer < __YesManeuver_ThrOFF &&
	     OmegaZ_Steer > -__YesManeuver_ThrOFF)
      {// меньше порога
		if(--ManeuverY_Cnt == 0) Yes_Maneuver = 0;
	  }
	  else
	  {// больше порога
		if(ManeuverY_Cnt < __YesManeuver_Delay)
		   ManeuverY_Cnt++;
	  }
	}

// ---------флаг разницы Ackermann и OmegaZ-----------------
//#define  __YawBias_dWzThrON   __5dps //__6dps
#define  __YawBias_dWzThrOFF  __2dps  //0x0165  //2,5deg/c
#define  __YawBias_Delay   0x64       //0.5c
	if(!Yaw_Bias)
	{ // установка
	  if(Delta_OmegaZ > DYC.CFG.YawBias  ||
		 Delta_OmegaZ < -DYC.CFG.YawBias)
	  {	Yaw_Bias = 1;
		YawBias_Cnt = __YawBias_Delay;
	  }
	}
	else
	{ // сброс
	  if(Delta_OmegaZ < __YawBias_dWzThrOFF &&
		 Delta_OmegaZ > -__YawBias_dWzThrOFF)
      {// меньше порога
		if(--YawBias_Cnt == 0) Yaw_Bias = 0;
	  }
	  else
	  {// больше порога
		if(YawBias_Cnt < __YawBias_Delay)
		   YawBias_Cnt++;
	  }
	}

//------------------------- курсовой угол  ------------------------------
// размерность курсового углa 1град - 1msb
// 65536 *256 / 200 /143
#define	__K_ManeuverAngle  587
// ограничение при движении по кругу
#define	__Angle_180grad    0xB400 //180 град
#define	__Fold_OmegaZ_Thr  __2dps //0x0165  //2,5deg/c
	if(No_Maneuver ||                         // нет маневра
	   Maneuver.TruckAngle > __Angle_180grad || // едет в обратную стророну
	   Maneuver.TruckAngle < -__Angle_180grad)
	{
	   Maneuver.IntWz = 0;
	   Maneuver.WzPoz_Angle = 0;
	   Maneuver.WzNeg_Angle = 0;
	}
	else Maneuver.IntWz += Omega_Z_est;

    //  курсовой угол тягача
	Maneuver.TruckAngle = (Maneuver.IntWz * __K_ManeuverAngle) /65536;
    // курсовой угол влево
	if(Omega_Z_est > __Fold_OmegaZ_Thr)
	{ if(Maneuver.TruckAngle > 0)
		   Maneuver.WzPoz_Angle = Maneuver.TruckAngle;
	  else Maneuver.WzPoz_Angle = 0;
	}
    // курсовой угол вправо
	if(Omega_Z_est < -__Fold_OmegaZ_Thr)
	{ if(Maneuver.TruckAngle < 0)
		   Maneuver.WzNeg_Angle = Maneuver.TruckAngle;
	  else Maneuver.WzNeg_Angle = 0;
	}
    if(Maneuver.WzPoz_Angle && Maneuver.WzNeg_Angle)
    { Maneuver.WzNeg_Angle = 0;
      Maneuver.WzPoz_Angle = 0;
    }

// условия установки флага:
// при смене направления наблюдается резкое падение AccY до нуля
#define	__Fold_AccY_Thr 0x0400 // 0,5m/s^2 0x0266 // 0,3m/s^2
// курсовой угол и Omega_Z имеют разные знаки
#define	__Fold_Angle_Thr 0x0900 //10grad
// Omega_Z превышает Mu дороги
// большая Delta Wz	> 6dps
#define	__Fold_DeltaWz_Thr __6dps

	// смена полосы влево
	if(!LineChange_Left)
	{ if(Acc_Y_est < __Fold_AccY_Thr &&
		 Maneuver.WzPoz_Angle > __Fold_Angle_Thr &&
	//     Omega_Z_est < -Road.OmegaZ &&
		 Omega_Z_est < -__Fold_OmegaZ_Thr &&
		 Delta_OmegaZ < -__Fold_DeltaWz_Thr)
		LineChange_Left = 1;
	}
	else if(!Maneuver.WzPoz_Angle) LineChange_Left = 0;

	// смена полосы вправо
	if(!LineChange_Right)
	{ if(Acc_Y_est > -__Fold_AccY_Thr &&
		Maneuver.WzNeg_Angle < -__Fold_Angle_Thr &&
	//     Omega_Z_est > Road.OmegaZ &&
		Omega_Z_est > __Fold_OmegaZ_Thr &&
		 Delta_OmegaZ > __Fold_DeltaWz_Thr)
		LineChange_Right = 1;
	}
	else if(!Maneuver.WzNeg_Angle) LineChange_Right = 0;

	// флаг движения прямо
	int32_t dSpF = (uint32_t)Wheel_FL.Speed -
			       (uint32_t)Wheel_FR.Speed;
#define   __dSpF_Thr      0x0100 //1km/h
#define   __SpeedX_Move   0x0A00
	if(Speed_VX_est > __SpeedX_Move &&  // едет > 10km/h
	   ((Omega_Z_est < SAS.Zero.Wz &&   // мала Omega_Z
	     Omega_Z_est > -SAS.Zero.Wz) ||
	    (dSpF < __dSpF_Thr && // одинаковы скорости передних колес
		 dSpF > -__dSpF_Thr)))
	     Move_Direct = 1;
	else Move_Direct = 0;
// флаг завершения маневра
//	Compl_Maneuver

} // end ManeuverFlags()

void    Pressure_Estimate(void)
{
	//------------- ПЕРЕД ------------------
#ifdef   __AxisF_Compile
	// флаг открытия обеих модуляторов
	if(Dif_CutM_Enable)
	{ if(!EV_FL && !EV_FR)
		   FrontDif.CutM = 0;
	  else FrontDif.CutM = 1;
	}
	// модель дифф. клапана
	if(Dif_F)
 		  DifInject(&FrontDif);
	else  DifExhaust(&FrontDif);
    //  определяем входное давление в модель
	// Двух-магистральный клапан
    if(FrontDif.Press > Brake.DemandValue)
    	 Brake.Front.Pin =  FrontDif.Press;
    else Brake.Front.Pin =  Brake.DemandValue;
	// давление после ускорительного клапана
    if(!BPS_onAccValve)
	     Brake.Front.Pva = IncValve(&(Brake.Front)); // BPS на Тормозном кране
    else Brake.Front.Pva = Brake.Front.Pin;    // BPS на Ускорительном клапане

    //FL
	Wheel_FL.Grad_Exh = Brake.Front.CFG.Grad_Exh;
	Wheel_FL.Grad_Pump = Brake.Front.CFG.GradPump_L; // особый градиент
    Wheel_FL.In_Press = Brake.Front.Pin;

    if(EV_FL && AV_FL) Exhaust(&Wheel_FL); // выпуск через модулятор
    else
    { // задержка на выпуск модулятора
      Wheel_FL.DelExh = Delay_ModExh(&Wheel_FL);
      if(Wheel_FL.Press < Wheel_FL.In_Press)
      { if(!EV_FL)                             // подкачкa
        { // Входное давление для подкачек при торможении
    	  if(Brake.DemandValue == Brake.Front.Pin ||
    		 IncValve_Always)
    	     Wheel_FL.In_Press = Brake.Front.Pva;
          Inject(&Wheel_FL);
        }
        else // задержка  подкачки модулятора
            Wheel_FL.DelInj = Delay_ModPump(&Wheel_FL);
      }
      else ExhTap(&Wheel_FL);                       // выпуск через кран
    }
    //FR
	Wheel_FR.Grad_Exh = Brake.Front.CFG.Grad_Exh;
	Wheel_FR.Grad_Pump = Brake.Front.CFG.Grad_Pump;
    Wheel_FR.In_Press = Brake.Front.Pin;
    if(EV_FR && AV_FR) Exhaust(&Wheel_FR); // выпуск через модулятор
    else
    { // задержка на выпуск модулятора
      Wheel_FR.DelExh = Delay_ModExh(&Wheel_FR);
      if(Wheel_FR.Press < Wheel_FR.In_Press)
      { if(!EV_FR)                             // подкачкa
        { // Входное давление для подкачек при торможении
    	  if(Brake.DemandValue == Brake.Front.Pin ||
    	     IncValve_Always)
    	     Wheel_FR.In_Press = Brake.Front.Pva;
      	  Inject(&Wheel_FR);
        }
        else // задержка подкачку модулятора
            Wheel_FR.DelInj = Delay_ModPump(&Wheel_FR);
      }
      else ExhTap(&Wheel_FR);                       // выпуск через кран
    }
#endif
    //---------------- ЗАД -----------------
#ifdef   __AxisR_Compile
	if(Dif_CutM_Enable)
	{ if(!EV_RL && !EV_RR)
		   RearDif.CutM = 0;
	  else RearDif.CutM = 1;
	}
	// модель дифф. клапана
	if(Dif_R)	 // от DZ
          DifInject(&RearDif);
	else  DifExhaust(&RearDif);
	//  определяем входное давление в модель
	// Двух-магистральный клапан
    if(RearDif.Press > Brake.DemandValue)
    	 Brake.Rear.Pin =  RearDif.Press;
    else Brake.Rear.Pin =  Brake.DemandValue;
	// давление после ускорительного клапана
	Brake.Rear.Pva = IncValve(&(Brake.Rear));

    // RL
	Wheel_RL.Grad_Exh = Brake.Rear.CFG.Grad_Exh;
	Wheel_RL.Grad_Pump = Brake.Rear.CFG.Grad_Pump;
    Wheel_RL.In_Press = Brake.Rear.Pin;
    if(EV_RL && AV_RL) Exhaust(&Wheel_RL); // выпуск через модулятор
    else
    { // задержка на выпуск модулятора
      Wheel_RL.DelExh = Delay_ModExh(&Wheel_RL);
      if(Wheel_RL.Press < Wheel_RL.In_Press) //нельзя Brake.PincV_R
      { if(!EV_RL)                             // подкачкa
        { // Входное давление для подкачек при торможении
    	  if(Brake.DemandValue == Brake.Rear.Pin ||
    	     IncValve_Always)
    	     Wheel_RL.In_Press = Brake.Rear.Pva;
    	  Inject(&Wheel_RL);
        }
        else // задержка подкачку модулятора
            Wheel_RL.DelInj = Delay_ModPump(&Wheel_RL);
      }
      else ExhTap(&Wheel_RL);                      // выпуск через кран
    }
    // RR
	Wheel_RR.Grad_Exh = Brake.Rear.CFG.Grad_Exh;
	Wheel_RR.Grad_Pump = Brake.Rear.CFG.Grad_Pump;
    Wheel_RR.In_Press = Brake.Rear.Pin;
    if(EV_RR && AV_RR) Exhaust(&Wheel_RR); // выпуск через модулятор
    else
    { // задержка на выпуск модулятора
      Wheel_RR.DelExh = Delay_ModExh(&Wheel_RR);
      if(Wheel_RR.Press < Wheel_RR.In_Press)
      { if(!EV_RR)                             // подкачкa
        { // Входное давление для подкачек при торможении
    	  if(Brake.DemandValue == Brake.Rear.Pin ||
    	     IncValve_Always)
    	     Wheel_RR.In_Press = Brake.Rear.Pva;
    	  Inject(&Wheel_RR);
        }
        else // задержка на подкачку модулятора
            Wheel_RR.DelInj = Delay_ModPump(&Wheel_RR);

      }
      else ExhTap(&Wheel_RR);                       // выпуск через кран
    }

    //-------- Pressure Trailer-----------------------------
#define   __PdifT_Full    0x1100
	uint16_t Kinj;
    if(Trailer.Press > __PdifT_Full)
  	     Kinj = Trailer.CFG.K_Inject;
    else Kinj = ((uint32_t)Trailer.CFG.K_Inject*150)/256;

	uint16_t dP = Trailer.InPr - Trailer.Press;

	if(DSC_DifT_Install)
    { // установлен DifKl прицепа
		Trailer.AirPress = RearDif.AirPress;
	  if(Dif_T)
		   Trailer.InPr = Trailer.AirPress;//Pmax;
	  else Trailer.InPr = 0;
	  if(Brake.DemandValue > Trailer.InPr) Trailer.InPr = Brake.DemandValue;

	  if(Trailer.Press < Trailer.InPr)
	  {
	      dP = Trailer.InPr - Trailer.Press;
	      Trailer.Press += _Hi_32(((uint32_t)dP) * (uint32_t)Kinj);
	  }
	  else Trailer.Press -= _Hi_32(Trailer.Press * (uint32_t)Trailer.CFG.K_Exhaust); //слив
	  if(Trailer.Press  > __uintYnMinus) Trailer.Press = 0;
    }
    else
    if(DSC_ModT_Install)
    { // установлен Модулятор прицепа
      Trailer.AirPress = FrontDif.AirPress;
      Trailer.InPr = Brake.Front.Pin;

      if(DSC_EV_MT && DSC_AV_MT)
    	   Trailer.Press -= _Hi_32(Trailer.Press * (uint32_t)Trailer.CFG.K_Exhaust); //слив
      else
      { if(Trailer.Press < Trailer.InPr)
        { if(!DSC_EV_MT)
          {// подкачкa
        	dP = Trailer.InPr - Trailer.Press;
        	Trailer.Press += _Hi_32(((uint32_t)dP) * (uint32_t)Kinj);
          }
        }
        else
        { dP = Trailer.Press - Trailer.InPr;
#define   __K_ExhSlow   0x1200  //градиент выпуск через кран
          Trailer.Press -= _Hi_32(dP * __K_ExhSlow);    //
        }
      }
    }
#endif

} // end PressureEstimate()

uint8_t   Koef_SAS(void)
{
// ------ определение коэффициентов руля---------------------------
// порог выбрать больше чем для SAS.OffSet
#define __Ksas_WzThr   0x0165 //2.5deg/c  0x00F0 //1.68deg/c
#define __Ksas_Default     0x00010000
#define __Ksas_CpltDelta   0x00000CCC //5%
#define __Ksas_Change      0x0000028F //1%
#define __Ksas_Tout1       0x0028     //0.2c
#define __Ksas_Tout2       0x0190     //2c

#define __Ksas_HighThr     0x00013333 // +20%
#define __Ksas_LowThr      0x0000CCCC // -20%

// OmegaZ_Des с коэффициентом подстройки
   if(OmegaZ_Des > 0) SAS.OmegaZ = OmegaZ_Des * SAS.Koef_Poz /65536;
   else               SAS.OmegaZ = OmegaZ_Des * SAS.Koef_Neg /65536;
   if(SAS.K.Phase != 11) // определение коэффициентов не заверщено
   {
     if(Bad_Wz_Des ||
		Control_Active ||     // есть регулирование
		// учесть скользкую дорогу
	   	ReverseON || !Forward_Move)	    // задний ход или стоит
    	                   SAS.K.Phase = 0; // запрет
     else if(!SAS.K.Phase) SAS.K.Phase = 1; // выход из запрета

	 switch (SAS.K.Phase)
	 {
		case 0: //abort
			break;
		case 1: // условия запуска
			if(Omega_Z_est > __Ksas_WzThr &&
			   SAS.OmegaZ > __Ksas_WzThr)
			{ SAS.K.Phase = 2; SAS.K.AkPmax = 0; SAS.K.WzPmax = 0;}
			if(Omega_Z_est < -__Ksas_WzThr &&
			   SAS.OmegaZ < -__Ksas_WzThr)
			{ SAS.K.Phase = 6; SAS.K.AkNmax = 0; SAS.K.WzNmax = 0;}
			break;

		case 2: //нахождение положительных максиумов
			if(SAS.K.WzPmax < Omega_Z_est)
			   SAS.K.WzPmax = Omega_Z_est;
			if(SAS.K.AkPmax < SAS.OmegaZ)
			   SAS.K.AkPmax = SAS.OmegaZ;
			if(SAS.K.AkPmax > SAS.OmegaZ)
			{ SAS.K.Phase++;
			  SAS.K.Cnt = 0;
			  SAS.K.Sum = 0;
			}
			break;
		case 3 : // нахождение стеднего значение
			SAS.K.Sum += ((Omega_Z_est * (int32_t)__Ksas_Default)/ SAS.OmegaZ);
			if(++SAS.K.Cnt > __Ksas_Tout1 ||
			   (Omega_Z_est < 0 && SAS.OmegaZ < 0))
			{ SAS.K.Phase++;
			  SAS.K.Sum = SAS.K.Sum / SAS.K.Cnt;
			}
			break;
		case 4: //нахождение положительного коэффициента
			if(!SAS.K.Poz)
				SAS.K.Poz = __Ksas_Default;
			if(SAS.K.Poz > (SAS.K.Sum + __Ksas_Change))
			   SAS.K.Poz -= __Ksas_Change;
			else
			if(SAS.K.Poz < (SAS.K.Sum - __Ksas_Change))
			   SAS.K.Poz += __Ksas_Change;
			else SAS.K.Poz = SAS.K.Sum;
			SAS.K.Phase++;
			break;
		case 5 : //
			if((Omega_Z_est < 0 &&
				SAS.OmegaZ < 0) ||
			   ++SAS.K.Cnt > __Ksas_Tout2)
				SAS.K.Phase = 10;
			break;

		case 6: //нахождение отрицательных максиумов
			if(SAS.K.WzNmax > Omega_Z_est)
			   SAS.K.WzNmax = Omega_Z_est;
			if(SAS.K.AkNmax > SAS.OmegaZ)
			   SAS.K.AkNmax = SAS.OmegaZ;
			if(SAS.K.AkNmax < SAS.OmegaZ)
			{ SAS.K.Phase++;
			  SAS.K.Cnt = 0;
			  SAS.K.Sum = 0;
			}
			break;
		case 7 : // нахождение стеднего значение
			SAS.K.Sum += (((-Omega_Z_est) * (int32_t)__Ksas_Default)/ (-SAS.OmegaZ));
			if(++SAS.K.Cnt > __Ksas_Tout1 || (Omega_Z_est > 0 && SAS.OmegaZ > 0))
			{ SAS.K.Phase++;
			  SAS.K.Sum = SAS.K.Sum / SAS.K.Cnt;
			}
			break;
		case 8: //нахождение отрицательного коэффициента
			if(!SAS.K.Neg)
				SAS.K.Neg = __Ksas_Default;
			if(SAS.K.Neg > (SAS.K.Sum + __Ksas_Change))
			   SAS.K.Neg -= __Ksas_Change;
			else
			if(SAS.K.Neg < (SAS.K.Sum - __Ksas_Change))
			   SAS.K.Neg += __Ksas_Change;
			else SAS.K.Neg = SAS.K.Sum;
			SAS.K.Phase++;
			break;
		case 9 : //
			if((Omega_Z_est > 0 && SAS.OmegaZ > 0) ||
			   ++SAS.K.Cnt > __Ksas_Tout2) SAS.K.Phase = 10;
			break;
		case 10: //проверка завершения
			if(SAS.K.Poz && SAS.K.Neg &&
			   SAS.K.Poz < (SAS.Koef_Poz + __Ksas_CpltDelta) &&
			   SAS.K.Poz > (SAS.Koef_Poz - __Ksas_CpltDelta) &&
			   SAS.K.Neg < (SAS.Koef_Neg + __Ksas_CpltDelta) &&
			   SAS.K.Neg > (SAS.Koef_Neg - __Ksas_CpltDelta)
			  )  SAS.K.Phase = 1;//9; // заверщено
			else SAS.K.Phase = 1; // новый запуск
		    break;
		case 11 : // определение коэффициентов заверщено
			break;
     }
   }
// плавно приближаем SAS.Koef_X к SAS.K.X
   if(SAS.K.Poz)
   { if(SAS.Koef_Poz < SAS.K.Poz &&
	    SAS.Koef_Poz < __Ksas_HighThr)
	    SAS.Koef_Poz++;
     if(SAS.Koef_Poz > SAS.K.Poz &&
    	SAS.Koef_Poz > __Ksas_LowThr)
    	SAS.Koef_Poz--;
   }
   if(SAS.K.Neg)
   { if(SAS.Koef_Neg < SAS.K.Neg &&
	    SAS.Koef_Neg < __Ksas_HighThr)
	    SAS.Koef_Neg++;
     if(SAS.Koef_Neg > SAS.K.Neg &&
    	SAS.Koef_Neg > __Ksas_LowThr)
    	SAS.Koef_Neg--;
   }
// проверка границ коэффициентов
	if(SAS.Koef_Poz > __Ksas_HighThr ||
	   SAS.Koef_Poz < __Ksas_LowThr ||
	   SAS.Koef_Neg > __Ksas_HighThr ||
	   SAS.Koef_Neg < __Ksas_LowThr)
		 return 1;
	else return 0;

} // end KoefSAS()

#define   __Wz_max        0x10C2  //30 deg/c
#define   __Sign_OmegaZ   0x011E  // 2deg/c    0x01AD  // 3deg/c
#define   __SignErrTime   0x0190 // 2c
#define   __Sign_Delay   0x64    // 0,5c
#define   __Valid_VxThrLow   0x0A00  // 10 km/h
// max Vx при движении задним ходом
#define   __Valid_VxThrHigh  0x1900  // 25 km/h

uint8_t  Validity_OmegaZ  (ValidityTypeDef* WzX)
{
// фгаг
#define Bad_Sign    WzX->Bad.Bits.b0
#define Bad_Val     WzX->Bad.Bits.b1
#define Bad_Grad    WzX->Bad.Bits.b2
#define Bad_OffSet  WzX->Bad.Bits.b3
//#define Ok_OffSet   WzX->Bad.Bits.b4

// проверяем знак
// при движении задним ходом знак Omega_Z_est инвертирован !!!!!!!
// Сравнение знака Omega_Z_est и знака Omega_Z_est со знаком OmegaZ_Vf
// условия - скорость больше 10км/ч
// выполняется поворот
// нет быстрого вращения руля

	if((OmegaZ_Ref < -__Sign_OmegaZ &&
		 WzX->Value > __Sign_OmegaZ) || //поворот вправо
	    (OmegaZ_Ref > __Sign_OmegaZ &&
		 WzX->Value < -__Sign_OmegaZ))  //поворот влево
	{// неправильный знак
	  if(//!SteerSharpRotate &&     // нет быстрого вращения руля
		 Forward_Move)
	  {
		if(WzX->SignCnt < __SignErrTime)
		   WzX->SignCnt++;
		else Bad_Sign = 1;
	  }
	}
	else
	{
		if(WzX->SignCnt)
		   WzX->SignCnt--;
		else Bad_Sign = 0;
	}

// проверяем величину
#define   __ValueErrTime       0x0190     // 2c
//#define   __Value_Delay        0x64       // 0,5c
	if((WzX->Value > __Wz_max ||
		WzX->Value < -__Wz_max) &&
		OmegaZ_Ref < __Wz_max &&
		OmegaZ_Ref > -__Wz_max)
	{ // не нормальная величина
		if(WzX->ValueCnt < __ValueErrTime)
		   WzX->ValueCnt++;
		else Bad_Val = 1;
	}
	else
	{	if(WzX->ValueCnt)
		    WzX->ValueCnt--;
	    else Bad_Val = 0;
	}

// проверяем градиент
#define   __Grad_Thr     0x0861  //15 deg/c
#define   __Grad_Delay   0xC8    // 1c
	if(Speed_VX_est > __Valid_VxThrLow)
	{ int16_t Grad = WzX->Value - WzX->Last;
	    if(Grad > __Grad_Thr ||
	       Grad < -__Grad_Thr)
	    { // был скачок
	    	WzX->GradCnt = __Grad_Delay;
	    	Bad_Grad = 1;
	    }
	    else
	    {	if(WzX->GradCnt)
	    	   WzX->GradCnt--;
	        else Bad_Grad = 0;
	    }
	}
	WzX->Last = WzX->Value;

// проверяем OffSet
// условия - скорость больше 10км/ч
// нет Флага неправильного знака
// отклонение от опорной OmegaZ_Ref меньше 15 deg/c
#define   __OffSetdWzDec        0x8000 //0x0100
#define   __OffSetIntMul        12     //3dps за 10c
#define   __OffSetIntLim        0x023C0000 //4 deg/c 0x04300000 //7,5 deg/c
#define   __OffSetFailThr       0x01AD     //3 deg/c
#define   __OffSetdWz_Lim      __8dps
#define   __OffSetdWz_Thr      __4dps
#define   __dWz_Ok_Thr      __2dps
#define   __dWz_Ok_Time_On   1000 //5c
#define   __dWz_Ok_Time_Off  4000 //20c
	// проверка отклонения
	int16_t dWz= WzX->Value - WzX->OffSet - OmegaZ_Ref;
	  if(dWz > __OffSetdWz_Lim)
		 dWz = __OffSetdWz_Lim;
	  if(dWz < -__OffSetdWz_Lim)
		 dWz = -__OffSetdWz_Lim;

	if(Forward_Move &&
	   !Bad_Sign &&
	   (dWz > __OffSetdWz_Thr ||
		dWz < -__OffSetdWz_Thr))
	       WzX->Integ += (dWz * (uint32_t)__OffSetIntMul);
	else
	{ if(!Bad_OffSet)
	  {
	    if(WzX->Integ > __OffSetdWzDec)
		   WzX->Integ -= __OffSetdWzDec;
	    if(WzX->Integ < -__OffSetdWzDec)
		   WzX->Integ += __OffSetdWzDec;
	  }
	}
// ограничение интегратора
	if(WzX->Integ > __OffSetIntLim)
	   WzX->Integ = __OffSetIntLim;
	if(WzX->Integ < -__OffSetIntLim)
	   WzX->Integ = -__OffSetIntLim;
	WzX->OffSet = _Hi_32(WzX->Integ);

	dWz= WzX->Value - OmegaZ_Ref;
	if(Forward_Move &&
	   !Bad_Sign)
	{ if(dWz < __dWz_Ok_Thr &&
		 dWz > -__dWz_Ok_Thr)
	  { if(WzX->OkCnt <__dWz_Ok_Time_Off)
		   WzX->OkCnt++;
	  }
	  else
	  { if(WzX->OkCnt)
		   WzX->OkCnt--;
	  }
	}

	if((WzX->OffSet > __OffSetFailThr ||
	    WzX->OffSet < -__OffSetFailThr) &&
	    WzX->OkCnt <__dWz_Ok_Time_On)
		 Bad_OffSet = 1;
	else Bad_OffSet = 0;

	if(WzX->Bad.Byte)
		 return 1;
	else return 0;
} // end Validity_OmegaZ


int16_t  WeightOmegaZ (int16_t Wz1, int16_t Wz2)
{
int16_t dWz;
int16_t WWz;
	if(Wz1 < __Wz_max &&
	   Wz1 > -__Wz_max &&
	   Wz2 < __Wz_max &&
	   Wz2 > -__Wz_max)
	{
	  dWz = Wz1 - Wz2;
	  if(dWz < 0)
		 dWz = - dWz;
	  WWz = ((Validity.WeightWzThr - dWz) *
             (int32_t)Validity.WeightKnorm) / 256;
	  if(WWz < 0)
		 WWz = 0;
	}
	else WWz = 0;

	return  WWz;
} // end WeightOmegaZ(dWz)

void    SignalValidity(void)
{ //ссылка на файл Sensor Validation.docx
#ifdef   __AxisF_Compile
// --------определение AccY через скорости передних колес-----------
// значение больше 1,09 видимо из-за изменения колеи 1.09*256 = 278
// AccY_dVf = Vx*dVf/Tf
// Koef_Acc_Y_dVf = 2048 * 256 / 3,6 /3,6 / T
// фильтруем dVf
// при регулировании OmegaZ_Vf неправильная !!!
// bag
//	Filter_dVf.Xn = (uint32_t)Wheel_FR.Ref -
//			        (uint32_t)Wheel_FL.Ref;
	Filter_dVf.Xn = (uint32_t)Wheel_FR.Speed -
			        (uint32_t)Wheel_FL.Speed;
	int16_t dVf = Filter_Cheb(&Filter_dVf, Koef_Filtr2Hz); //!!!1Hz
	AccelY.DelSpF = _Hi_32((int32_t)(
			        ((int32_t)Speed_VX_est *
			     //    (int32_t)Koef_Acc_Y_dVf) /278 * dVf));
			         (int32_t)Koef_AccY_dVf) /256 * dVf));

	if(Speed_VX_est > 0x0100) // деление на VX
	{
// MODEL 3	 через скорости передних колес
// определение OmegaZ_Vf через AccY_dVf
// OmegaZ_Vf =AccY_dVf / Vx
// Koef_OmegaZ_AccY = 8192 * 65536 / 2048 * 3,6 * 256
//#define   __Koef_OmegaZ_AccY    0x0E666667

//	  OmegaZ_Vf = _Hi_32(__Koef_OmegaZ_AccY /(int32_t)Speed_VX_est *
//			                                 (int32_t)AccelY.DelSpF);
#define   __Koef_OmegaZ_AccY   3686
	  OmegaZ_Vf = __Koef_OmegaZ_AccY * (int32_t)AccelY.DelSpF /
			                           (int32_t)Speed_VX_est;
// MODEL2 через боковое ускорение
// значение больше 1,21 видимо из-за наклона датчика	!!!!
//#define   __Koef_OmegaZ_AyK    0x0BDBDBDC // __Koef_OmegaZ_AccY /1,21
#define   __Koef_OmegaZ_AyK    3046 //3686

	  OmegaZ_AccY = __Koef_OmegaZ_AyK * (int32_t)Acc_Y_est /
			                            (int32_t)Speed_VX_est;
	}
	else // скорость ноль
	{ OmegaZ_Vf = 0;
	  OmegaZ_AccY = 0;
	}

// определяем эталонную скорость рыскания
// находим вес Omega_i  1...3
#define   __WeightOmegaZ_Thresh  0x02CB  //5 deg/c 0x03E9  //7 deg/c
// чтобы не изменялся вес при изменении __WeightOmegaZ_Thresh
// нормируем вес так чтобы сумма весов не превышала 0x7FFF
// KnormWeight = 0x7800 / 16 * 256
#define   __KnormWeight  0x00078000

	Validity.WeightWzThr = __WeightOmegaZ_Thresh;
	Validity.WeightKnorm = (int32_t)__KnormWeight / Validity.WeightWzThr;
// сравниваем OmegaZ и определяем веса
	int16_t W12 = WeightOmegaZ(Omega_Z_est,OmegaZ_Des);
	int16_t W13 = WeightOmegaZ(Omega_Z_est,OmegaZ_AccY);
	int16_t W23 = WeightOmegaZ(OmegaZ_Des,OmegaZ_AccY);
	int16_t W14 = WeightOmegaZ(Omega_Z_est,OmegaZ_Vf);
	int16_t W24 = WeightOmegaZ(OmegaZ_Des,OmegaZ_Vf);
	int16_t W34 = WeightOmegaZ(OmegaZ_AccY,OmegaZ_Vf);
	int16_t W15 = WeightOmegaZ(Omega_Z_est,OmegaZ_Ref);
	int16_t W25 = WeightOmegaZ(OmegaZ_Des,OmegaZ_Ref);
	int16_t W35 = WeightOmegaZ(OmegaZ_AccY,OmegaZ_Ref);
	int16_t W45 = WeightOmegaZ(OmegaZ_Vf,OmegaZ_Ref);
// MODEL 3 2 дают неправильный результат если BadVX
// MODEL 4 дает неправильный результат если	ABS
	if(BadVX && W34 < 0x0800) W34 = 0;
	if(ABS_Active)
	{ W14 = 0;
	  W24 = 0;
	  W34 = 0;
	  W45 = 0;
	}
	Validity.Wz1.Weight = W12 + W13 + W14 + W15;
	Validity.Wz2.Weight = W12 + W23 + W24 + W25;
	Validity.Wz3.Weight = W13 + W23 + W34 + W35;
	Validity.Wz4.Weight = W14 + W24 + W34 + W45;
	Validity.WeightSum = Validity.Wz1.Weight + Validity.Wz2.Weight +
			             Validity.Wz3.Weight + Validity.Wz4.Weight;
// определяем опорную OmegaZ
	OmegaZ_Ref = ((int32_t)Validity.Wz1.Weight * Omega_Z_est +
			      (int32_t)Validity.Wz2.Weight * OmegaZ_Des +
				  (int32_t)Validity.Wz3.Weight * OmegaZ_AccY +
				  (int32_t)Validity.Wz4.Weight * OmegaZ_Vf) /
				 Validity.WeightSum;

// выполняем проверку достоверности опорной OmegaZ
#define   __OmegaZ_Ref_Thresh  0x0166  //2,5 deg/c
	int16_t HighThr = OmegaZ_Ref + __OmegaZ_Ref_Thresh;
	int16_t LowThr = OmegaZ_Ref - __OmegaZ_Ref_Thresh;
	uint8_t RefOkCnt = 0;

	if((Omega_Z_est < HighThr) && (Omega_Z_est > LowThr)) RefOkCnt++;
	if((OmegaZ_Des < HighThr) && (OmegaZ_Des > LowThr)) RefOkCnt++;
	if((OmegaZ_AccY < HighThr) && (OmegaZ_AccY > LowThr)) RefOkCnt++;
	if((OmegaZ_Vf < HighThr) && (OmegaZ_Vf > LowThr)) RefOkCnt++;
	Validity.RefOkCnt = RefOkCnt;
// если совпадений больше 3 и вес большой нормально
#define   __WeightOkThresh  0x2000
#define   __Ref_ErrTime     0x0190	// 2c

	if(RefOkCnt < 3 &&
	   Validity.WeightSum < __WeightOkThresh)
	{
	  if(Validity.RefCnt < __Ref_ErrTime)
		 Validity.RefCnt++;
	  else WzRef_Ok = 0;
	}
	else
	{ if(Validity.RefCnt)
		 Validity.RefCnt--;
	  else WzRef_Ok = 1;
	}

//  OmegaZ_Validity
	Validity.Wz1.Value = Omega_Z_est;
	Validity.Wz2.Value = OmegaZ_Des;
	Validity.Wz3.Value = OmegaZ_AccY;
	Validity.Wz4.Value = OmegaZ_Vf;

	Bad_Wz_Est = Validity_OmegaZ(&(Validity.Wz1));
	// при UnSt ставится Bad_Wz_Des
	Bad_Wz_Des = Validity_OmegaZ(&(Validity.Wz2));
	Bad_Wz_AccY= Validity_OmegaZ(&(Validity.Wz3));
	Bad_Wz_dVf = Validity_OmegaZ(&(Validity.Wz4));
	// не достоверность AccelX.Value
	if(!Truck_VDC_Active &&
	   (Bad_Wz_Est  || //
	    Bad_Wz_Des ||
	    Bad_Wz_AccY || //
	    Bad_Wz_dVf))    //
	     ValidWz_Fail = 1;
	else ValidWz_Fail = 0;
//--------------------Validity Acc_X_est ----------------------------
#define Bad_Sign_Ax    AxValid.Bad.Bits.b0
#define Bad_Val_Ax     AxValid.Bad.Bits.b1
#define Bad_Grad_Ax    AxValid.Bad.Bits.b2
#define Bad_OffSet_Ax  AxValid.Bad.Bits.b3

#define   __Ax_Fail_T  	 600 //3c
#define   __Ax_Grad_dA   0x5000 //10m/c2
// Validity недостоверных значений
// предыдущее значение AccelX.Last определяется в System.c
// void myHAL_CAN_RxCpltCallback	AGS_Upit_ON &&
	if(AccelX.Last == AccelX.Value || // данныe не изменяются
	   (AccelX.Last - AccelX.Value) >__Ax_Grad_dA || // скачок
	   (AccelX.Last - AccelX.Value) <-__Ax_Grad_dA)
	{ // данныe не изменяются
	  if(AxValid.GradCnt < __Ax_Fail_T)
		 AxValid.GradCnt++;
	  else Bad_Grad_Ax = 1;
	}
	else
	{ if(AxValid.GradCnt)
	     AxValid.GradCnt--;
	  else Bad_Grad_Ax = 0;
	}

#define   __Sign_Ax_Vx     0x1400
	if(Speed_VX_est > __Sign_Ax_Vx)
	{ // условия - скорость больше 20км/ч
	  // проверяем знак
#define   __Sign_Ax_Dec    0x1000 //2м/с^2
#define   __Sign_Ax_Inc    0x0800 //1м/с^2
	  if(Forward_Move &&
		 ((Base.AccX < -__Sign_Ax_Dec &&
		   AccelX.Value > __Sign_Ax_Dec) || //торможение
		  (Base.AccX > __Sign_Ax_Inc &&
		   AccelX.Value < -__Sign_Ax_Inc)))   //разгон
	  { // неправильный знак
		if(AxValid.SignCnt < __Ax_Fail_T)
		   AxValid.SignCnt++;
		else Bad_Sign_Ax = 1;
	  }
	  if((Base.AccX < -__Sign_Ax_Dec &&
		  AccelX.Value < -__Sign_Ax_Dec) || //торможение
		 (Base.AccX > __Sign_Ax_Inc &&
		  AccelX.Value > __Sign_Ax_Inc))   //разгон
	  { // правильный знак
		if(AxValid.SignCnt)
		   AxValid.SignCnt--;
		else Bad_Sign_Ax = 0;
	  }

	  if(!Bad_Sign_Ax)
	  {// проверяем отклонение
#define   __OffSet_dAx    0x1000 //2м/с^2
		if((Base.AccX - AccelX.Value) > __OffSet_dAx ||
		   (Base.AccX - AccelX.Value) < -__OffSet_dAx)
		{
		  if(AxValid.OffSetCnt < __Ax_Fail_T)
		     AxValid.OffSetCnt++;
		  else Bad_OffSet_Ax = 1;
		}
		else
		{
	      if(AxValid.OffSetCnt)
			 AxValid.OffSetCnt--;
		  else Bad_OffSet_Ax = 0;
		}
	  }
	}
	// не достоверность AccelX.Value
	if(CAN_AGS_Fail || // нет CAN данных
	   Bad_Grad_Ax  || // данныe не изменяются
	   Bad_Sign_Ax)    // не верный знак
	{  Bad_AccX = 1;
	   ValidAccX_Fail = 1;
	}
	else
	{  Bad_AccX = 0;
	   ValidAccX_Fail = 0;
	}
// Bad_Sign_Ax участвует в неисправности ориентации AGS

//--------------------Validity Acc_Y_est ----------------------------
#define Bad_Sign_Ay    AyValid.Bad.Bits.b0
#define Bad_Val_Ay     AyValid.Bad.Bits.b1
#define Bad_Grad_Ay    AyValid.Bad.Bits.b2
#define Bad_OffSet_Ay  AyValid.Bad.Bits.b3

#define   __Ay_Fail_T  	 600 //3c
#define   __Ay_Grad_dA   0x5000 //10m/c2
// Validity недостоверных значений
// предыдущее значение AccelX.Last определяется в System.c
// void myHAL_CAN_RxCpltCallback	AGS_Upit_ON &&
	if(AccelY.Last == AccelY.Value || // данныe не изменяются
	   (AccelY.Last - AccelY.Value) >__Ay_Grad_dA || // скачок
	   (AccelY.Last - AccelY.Value) <-__Ay_Grad_dA)
	{ // данныe не изменяются
	  if(AyValid.GradCnt < __Ay_Fail_T)
		 AyValid.GradCnt++;
	  else Bad_Grad_Ay = 1;
	}
	else
	{
	  if(AyValid.GradCnt)
	     AyValid.GradCnt--;
	  else Bad_Grad_Ay = 0;
	}
#define   __Sign_Ay_Vx     0x1400
	if(Speed_VX_est > __Sign_Ay_Vx &&
	   !Truck_VDC_Active &&
	   !ABS_Active)
	{ // условия - скорость больше 20км/ч
	  // используем AccY через скорости передних колес
	  //	AccelY.DelSpF
	  // проверяем знак
#define   __Sign_Ay_Thr    0x0C00 //1,5м/с^2
	  if(Forward_Move &&
		 ((AccelY.DelSpF < -__Sign_Ay_Thr &&
		   AccelY.Value > __Sign_Ay_Thr) ||   //влево
		  (AccelY.DelSpF > __Sign_Ay_Thr &&
		   AccelY.Value < -__Sign_Ay_Thr)))   //вправо
	  { // неправильный знак
		if(AyValid.SignCnt < __Ay_Fail_T)
		   AyValid.SignCnt++;
		else Bad_Sign_Ay = 1;
	  }
	  if((AccelY.DelSpF < -__Sign_Ay_Thr &&
		  AccelY.Value < -__Sign_Ay_Thr) || //вправо
		 (AccelY.DelSpF > __Sign_Ay_Thr &&
		  AccelY.Value > __Sign_Ay_Thr))    //влево
	  { // правильный знак
		if(AyValid.SignCnt)
		   AyValid.SignCnt--;
		else Bad_Sign_Ay = 0;
	  }

	  if(!Bad_Sign_Ay && // правильный знак и поворот
		 (AccelY.Value < -__Sign_Ay_Thr ||  // вправо
		  AccelY.Value > __Sign_Ay_Thr))    // влево
	  {// проверяем отклонение
	   // используем AccY через OmegaZ_Des
#define   __OffSet_dAy    0x1000 //2м/с^2
		if((ROP.AccY_OzD - AccelY.Value) > __OffSet_dAy ||
		   (ROP.AccY_OzD - AccelY.Value) < -__OffSet_dAy)
		{
		  if(AyValid.OffSetCnt < __Ay_Fail_T)
		     AyValid.OffSetCnt++;
		  else Bad_OffSet_Ay = 1;
		}
		else
		{
	      if(AyValid.OffSetCnt)
			 AyValid.OffSetCnt--;
		  else Bad_OffSet_Ay = 0;
		}
	  }
	}

	// не достоверность AccelY.Value
	if(CAN_AGS_Fail || // нет CAN данных
	   Bad_Grad_Ay  || // данныe не изменяются
	   Bad_Sign_Ay)    // не верный знак
	{  Bad_AccY = 1;
	   ValidAccY_Fail = 1;
	}
	else
	{  Bad_AccY = 0;
	   ValidAccY_Fail = 0;
	}
// Bad_Sign_Ay участвует в неисправности ориентации AGS

// проверка и ограничение границ коэффициентов руля для Аккермана
    BadKsas = Koef_SAS();

// проверка Speed_VX
// сравниваем с средней скоростью передней оси
#define   __LowVX_Terr   0x03E8	// 5c
#define   __LowVX_Tdel   0x0028	// 0,2c
#define   __LowVX_Tok    0x000A	// 0,05c
#define   __LowVXThr     0x0500	// 5km/h

	if( Speed_FrontAxel >
	   (Speed_VX_est + __LowVXThr))
	{ if(Validity.VxCnt < __LowVX_Terr)
		 Validity.VxCnt++;
	}
	else
	{   if(Validity.VxCnt > __LowVX_Tdel)
		   Validity.VxCnt = __LowVX_Tdel;
		if(Validity.VxCnt)
		   Validity.VxCnt--;
	}
	// ?????????????
	if(Validity.VxCnt > __LowVX_Tok)
    // общий задатчик ниже средней скорости передней оси
	      BadVX = 1;
	else  BadVX = 0;
#endif
} // end SignalValidity()


void    ReverseCheck (void)
{ // определение движения задним ходом
// при повороте	Omega_Z_est имеет другой знак
// по абсолютной величине одинаковы
#define   __Reverse_WzThr1  0x011E  // 2deg/c
#define   __Reverse_WzThr2  0x008F  // 1deg/c
#define   __Reverse_VxMin   0x0200	// 2km/h
// max Vx при движении задним ходом
#define   __Reverse_VxMax  0x1B00  // 27 km/h
#define   __Reverse_Delay   40      // 0,2c

	if(Speed_VX_est > __Reverse_VxMin) // при движении
	{ if(Speed_VX_est > __Reverse_VxMax)
	  { // скорости больше 27 km/h
		ReverseON = 0;
	    ReverseON_Cplt = 1;
	  }
	  else
	  if(!ReverseON_Cplt)
	  { // установка флага
	    if(((OmegaZ_Des > __Reverse_WzThr1 && // поворот влево
		     Omega_Z_est < -__Reverse_WzThr2) ||
		    (OmegaZ_Des < -__Reverse_WzThr1 && // поворот вправо
		     Omega_Z_est > __Reverse_WzThr2)))
	    { if(ReverseON_Cnt < __Reverse_Delay)
	         ReverseON_Cnt++;
	      else
	      {  ReverseON = 1;
	         ReverseON_Cplt = 1;
	      }
	    }
	    // сброс флага
	    if((OmegaZ_Des > __Reverse_WzThr2 && // поворот влево
		    Omega_Z_est > __Reverse_WzThr2) ||
		   (OmegaZ_Des < -__Reverse_WzThr2 && // поворот вправо
		    Omega_Z_est < -__Reverse_WzThr2))
	    { if(ReverseON_Cnt)
		     ReverseON_Cnt--;
	      else ReverseON = 0;
	    }
	  }
	}
	else // стоит
	{ ReverseON = 0;
	  ReverseON_Cplt = 0;
	  ReverseON_Cnt = 0;
	}

	if(GearBox_AutoMatic)
	{
	  if(CAN_Engine.Gear.Num < 0x7D &&
	     CAN_Engine.Gear.Num > 0x7A)  // 122 -3
		  Gear_Reverse = 1;
	  if(CAN_Engine.Gear.Num > 0x7D &&
		 CAN_Engine.Gear.Num < 0x91)   //145 +20
		  Gear_Reverse = 0;
	}
} // end ReverseCheck()

void    WheelSpeedBase(WheelTypeDef* Wheelx)
{
#define   __dVbase_A   0x002A // 0x0015 //4,2m/c^2
#define   __K_dV_Ax   148
	int16_t dVx; // приращение скорости
	  if(Wheelx->ABS.Phase == __ABS_Phase1 || // в 1 и
	     Wheelx->ABS.Phase == __ABS_Phase3)   // 3 фазах замедление Ax_Base
		   dVx = Base.Ax * (uint32_t)__K_dV_Ax / 65536;
	  else dVx = Base.Ax_dV;
	int32_t dBase = (uint32_t)Wheelx->Speed -
			        (uint32_t)Wheelx->Base;
	if(dBase > 0 &&        // скорость выше
	   dBase > __dVbase_A) // ограничиваем ускорение
	   dBase = __dVbase_A;
	else
	if(dBase < 0 &&        // скорость ниже
	   dBase < dVx)        // ограничиваем замедление
	   dBase = dVx;

	// базовая скорость
	int32_t Bx = Wheelx->Base + dBase;
	if(Bx < 0)
	   Bx = 0; // минус обнуляем
	Wheelx->Base = Bx;

	// среднее значение
    if(Wheelx->Base &&
       !Safe_dT && !Safe_Sp)
    {
    	Base.Sum += Wheelx->Base;
    	Base.N ++;
    }
} // end WheelSpeedBase(&Wheelx)

void    WheelSpeedRef(WheelTypeDef* Wheel_XX)
{
#define   __dVref_An    0x000A //2,1m/c^2 0x0007 //1,5m/c^2
#define   __dVref_Am    0x0015 //4,2m/c^2 0x0012 //3,9m/c^2
// компенсируем AccX от смещения и наклонов
#define   __dVref_C     0x0007 //1,07 m/c^2  0x0003 //0,64 m/c^2
#define   __Tmax        0x00F0  // 1,2c
#define   __TI          0x000F  // c
#define   __TD          40      // 0,2c

// !!! Wheel_XX->Ref - uint16_t вводим переменную int32_t Ref
	int32_t Ref = Wheel_XX->Ref; // предыдущее значение
	int32_t RefA = Ref + dSpAx;  // текущее значение
	if(RefA < 0)
	   RefA = 0;
	int32_t RefI;
	int32_t RefD;

// Bag Ref не становятся нулями
	if(!_Hi_16(Wheel_XX->ABS.Base))
	{
		if(Ref > 0)
			Ref -= __dVref_C;
		if(Ref < 0)
		   Ref = 0;
	}
	else
	{ if(Wheel_XX->ABS.Base < Wheel_XX->Ref) // замедляется
	{
      if(!Wheel_XX->ABS.Active ||
    	 All_Speed_Zero)
	  {
	    if(Wheel_XX->CntD < __Tmax)
	    {  Wheel_XX->CntD++;
	    	 RefD = Ref - __dVref_An;
	    }
	    else RefD = Ref - __dVref_Am;
	   if(RefD < 0)
		  RefD = 0;

	   if(RefD < RefA && Wheel_XX->CntD > __TD)
		   Ref = RefD;
	   else
	   {   if(Wheel_XX->CntD) RefA -= __dVref_C;
		   Ref = RefA;
	   }
	   Wheel_XX->CntI = 0;
	  }
      else
      { // ABS активно
#define   __Ref_Sleep   0xC000 // 25%
    	// сделать прижим к задатчику колес
    	if(Wheel_XX->Ref * (uint32_t)__Ref_Sleep /65536 >
	       Wheel_XX->ABS.Base)
    		RefA -= __dVref_An;
 	    if(RefA < 0)
 		   RefA = 0;
    	Ref = RefA;
      }
	}
	else
	if(Wheel_XX->ABS.Base > Wheel_XX->Ref)  // ускоряется
	{ // вставить ASR
	  if(!Wheel_XX->ABS.Active)
	  {
	    if(Wheel_XX->CntI < __Tmax)
	    {  Wheel_XX->CntI++;
	         RefI = Ref + __dVref_An;
	    }
	    else RefI = Ref + __dVref_Am;

        if(RefI > RefA && Wheel_XX->CntI > __TI)
		    Ref = RefI;
	    else
	    {   if(Wheel_XX->CntI > 1)  RefA += __dVref_C;
		   Ref = RefA;
	    }
	  }
	  else Ref += __dVref_Am;

	  Wheel_XX->CntD = 0;
	}
	}
	if(Ref < 0)
	   Ref = 0; // минус обнуляем
	Wheel_XX->Ref = Ref;

	// в нуле сбрасываем счетчики
	if(!Wheel_XX->Ref &&
	   !Wheel_XX->Speed)
	{  Wheel_XX->CntI = 0;
	   Wheel_XX->CntD = 0;
	}
} // end WheelSpeedRef(&Wheel_XX)

//----------------- макрос _Ref_Sum ----------------------
// ограничиваем верх от вылета и
// ограничиваем низ от нулевой скорости !!!
#define _Ref_Sum(XX) {				\
     if(Wheel_##XX.Ref > RefLow &&  \
        Wheel_##XX.Ref < RefHigh)	\
     { SumRef += (uint32_t)Wheel_##XX.Ref;	\
       SumNum++;}					\
} //end macroc

// средняя скорость передней оси
uint16_t Speed_Axis(uint16_t Wheel_XL, uint16_t Wheel_XR)
{
	uint16_t Speed;
	if(Wheel_XL && Wheel_XR)
    	Speed = ((uint32_t)Wheel_XL +
    			 (uint32_t)Wheel_XR) / 2;
    else
    { if(!Wheel_XL && Wheel_XR)
		  Speed = Wheel_XR;
	  else
	  if(!Wheel_XR && Wheel_XL)
		   Speed = Wheel_XL;
	  else Speed = 0;
    }
	return Speed;
}

void    SpeedX_Estimate(void)
{
// выход фильтра используется для обнуления отрицательных uint16_t
uint16_t FiltOut;
    // средняя скорость передней оси
    Speed_FrontAxel = Speed_Axis(Wheel_FL.Speed, Wheel_FR.Speed);
    // средняя скорость задней оси
    Speed_RearAxel = Speed_Axis(Wheel_RL.Speed, Wheel_RR.Speed);


//--------------- приращение скорости Vx за 5мс ---------------------
// коефициент перевода ускорения в приращение скорости за 5мс
// 1m/c^2 - 2048 __K_dV_Ax = 3,6 * 256 / 2048 * (256 /200) * 65536 = 37748
#define   __K_dV_Ax   148
	     dSpAx = Acc_X_est * (uint32_t)__K_dV_Ax / 65536;

// скорости типа базовой в ABS
// Вычисляются в каждом прцессоре для ВСЕХ колес
// при пробуксовке задние могут быть выше
// если CntI = 0  будет использоваться акселерометр

	if((Wheel_RL.Speed > (Wheel_FL.Ref + 0x0300) ||
		ASR_EngineActive) && //ASR_EngineActive
	    Wheel_RL.Ref > Wheel_FL.Ref)
		Wheel_RL.CntI = 0;
	if((Wheel_RR.Speed > (Wheel_FR.Ref + 0x0300) ||
		ASR_EngineActive) &&
	    Wheel_RR.Ref > Wheel_FR.Ref)
		Wheel_RR.CntI = 0;

	WheelSpeedRef(&Wheel_FL);
	WheelSpeedRef(&Wheel_FR);
	WheelSpeedRef(&Wheel_RL);
	WheelSpeedRef(&Wheel_RR);

// находим общий задатчик
// при разгоне может отстать от средней скорости передней оси
#define   __RefHigh_Thr   0x0500
#define   __RefLow_Thr    0x0700
int32_t SumRef = 0;
int16_t SumNum = 0;
uint16_t RefHigh = Speed_VX_est + __RefHigh_Thr;
uint16_t RefLow;
     if(Speed_VX_est > __RefLow_Thr)
          RefLow = Speed_VX_est - __RefLow_Thr;
     else RefLow = 0;
    _Ref_Sum(FL)
    _Ref_Sum(FR)
	_Ref_Sum(RL)
	_Ref_Sum(RR)
	if(SumNum)
		 Filter_Speed_VX.Xn = SumRef / SumNum;
	else // все нулевые или разбежались на повороте
	{ if(Speed_FrontAxel && Speed_RearAxel)
		 Filter_Speed_VX.Xn = ((uint32_t)Speed_FrontAxel +
			                   (uint32_t)Speed_RearAxel) /2;
	  else
	  if(Speed_FrontAxel)
		   Filter_Speed_VX.Xn = Speed_FrontAxel;
	  else Filter_Speed_VX.Xn = Speed_RearAxel;
	}
// фильтруем Speed_VX
// отрицательные значения обнуляем
	if(FiltrVx1Hz)
	     FiltOut = Filter_Cheb(&Filter_Speed_VX, Koef_Filtr1Hz);
	else FiltOut = Filter_Cheb(&Filter_Speed_VX, Koef_Filtr2Hz);
	if(FiltOut < __uintYnMinus) Speed_VX_est = FiltOut;
	else                        Speed_VX_est = 0;
// находим деривативу Speed_VX
//	1m/c^2 - 2048lsb  K = 2048/3.6*1000/(40*5)
#define   __K_RefAcc   0x0B1C
	BuffDer_VX[0] =  Speed_VX_est;
	Derivative_VX_est = (DeriVative_U16(BuffDer_VX, 40) * __K_RefAcc) / 256;
	// базовые скорости с ограничением 1G

#define   __Base_Ax     0x4400 //8,5m/c^2 0x4E7B //9,8m/c^2
#define   __Base_Ax_Min 0x0733 //0,9m/c^2
#define   __K_BaseAcc   1870	// 70 1625 +15%
	Base.Ax_dV = -(uint32_t)__Base_Ax * __K_dV_Ax / 65536;
	Base.Sum = 0;
	Base.N = 0;
	WheelSpeedBase(&Wheel_FL);
	WheelSpeedBase(&Wheel_FR);
	WheelSpeedBase(&Wheel_RL);
	WheelSpeedBase(&Wheel_RR);

#ifdef   __AxisR_Compile
	if(!ABS_Active)
	{ // ограничение ASR
	  if(Wheel_RL.Base > Wheel_FL.Base)
		 Wheel_RL.Base = Wheel_FL.Base;
	  if(Wheel_RR.Base > Wheel_FR.Base)
		 Wheel_RR.Base = Wheel_FR.Base;
	}
#endif

    if(Base.N)
    	 Base.Vx = Base.Sum / Base.N;
    else Base.Vx = 0;
	Filter_Vx_Base.Xn = Base.Vx;
	FiltOut = Filter_Cheb(&Filter_Vx_Base, Koef_Filtr5Hz);
	if(FiltOut < __uintYnMinus) Speed_VX_Wh = FiltOut;
	else                        Speed_VX_Wh = 0;
	BuffBase_Ax[0] =  Speed_VX_Wh;
	Base.Ax = (DeriVative_U16(BuffBase_Ax, 70) * __K_BaseAcc) / 256; //350mc
	// Продольное ускорение без ограничения
	Base.AccX = Base.Ax;
	//  Продольное ускорение с ограничением -1мс/c2
	if(Base.Ax > -__Base_Ax_Min && ABS_Active)
	   Base.Ax = -__Base_Ax_Min;

#ifdef   __AxisR_Compile
// ---------------- находим пробег  -----------------------------
/*	uint32_t D = 0;
	if(!Wheel_RL.Sen_Err.Word)
	{ D = Wheel_RL.Way.Distance;
	  if(!Wheel_RR.Sen_Err.Word)
	  D = (D + Wheel_RR.Way.Distance)/2;
	}
	else
	{ if(!Wheel_RR.Sen_Err.Word)
	  D = Wheel_RR.Way.Distance;
	}
	Vehicle.Rear_ODO = D;*/
	// наибольший
	Vehicle.Rear_ODO = Wheel_RL.Way.Distance;
	if(Vehicle.Rear_ODO < Wheel_RR.Way.Distance)
	   Vehicle.Rear_ODO = Wheel_RR.Way.Distance;

#endif
} // end SpeedX_Estimate()

void     Speed_Wheels(void)
{
#ifdef   __AxisF_Compile
	 if(KoefSpeed_Enable)  // разрешен учет Tire_Koef в скорости
	 {
	   if(!Wheel_FL.Tire_Once_F)
	   {   Wheel_FL.Tire_Once_F = 1; // флаг один раз
	      Wheel_FL.Tire_Koef = TCO.Front.Koef * 2;
	   }
	 }
	 else Wheel_FL.Tire_Koef = 65536;
	 Wheel_FR.Tire_Koef = Wheel_FL.Tire_Koef;

	 Speed_Filter(&Wheel_FL);
	 Speed_Filter(&Wheel_FR);
#endif
#ifdef   __AxisR_Compile
	 if(KoefSpeed_Enable)  // разрешен учет Tire_Koef в скорости
	 {
	   if(!Wheel_RL.Tire_Once_F)
	   {   Wheel_RL.Tire_Once_F = 1; // флаг один раз
	      Wheel_RL.Tire_Koef = TCO.Rear.Koef * 2;
	   }
	 }
	 else Wheel_RL.Tire_Koef = 65536;
	 Wheel_RR.Tire_Koef = Wheel_RL.Tire_Koef;

	 Speed_Filter(&Wheel_RL);
	 Speed_Filter(&Wheel_RR);
#endif
#ifdef   __Axis3_Compile
	 if(KoefSpeed_Enable)  // разрешен учет Tire_Koef в скорости
	 Speed_Filter(&Wheel_3L);
	 Speed_Filter(&Wheel_3R);
#endif
}

void  Test_WheelSensor (WheelTypeDef* Wheelx, uint8_t SenXX_Install)
{ // вызывается в Wheel_Sensor_Test 1mc
// размерность  ADC Ax 3040 2.5V 1V - 1216lsb   1lsb - 0,000822 V
// тест повторяется по количеству ADC.N
// время ADC 100мкс	 myHAL_ADC_ConvCpltCallback
//	0,125c / 100мкс
#define __SS_Test_ADC_N 1250

#define __A1_NC_Level 3500
#define __A2_NC_Level 1216 //1V
#define __NC_Time     8//1000

#define __A1_SB_Level 4000
#define __A2_SB_Level 4000
#define __SB_Time     8//1000

#define __A1_GND_Level 800
#define __A2_GND_Level 800
#define __GND_Time    8//1000

#define __dU_SC_Level 100
#define __SC_Time     8//1000

#define Gap_Fail	Wheelx->Sen_Err.Bits.Gap_Fail
#define Cut_Sens	Wheelx->Sen_Err.Bits.Cut_Sens
#define Short_Bat	Wheelx->Sen_Err.Bits.Short_Bat
#define Short_Gnd	Wheelx->Sen_Err.Bits.Short_Gnd
#define Short_Sens	Wheelx->Sen_Err.Bits.Short_Sens
#define Speed_Zero  Wheelx->Sen_Err.Bits.Speed_Zero
#define Wrong_Speed	Wheelx->Sen_Err.Bits.Wrong_Speed
#define Wrong_T 	Wheelx->Sen_Err.Bits.Wrong_T

#define Tire_Fail   Wheelx->Sen_Err.Bits.Tire_Fail
#define Whip_Fail   Wheelx->Sen_Err.Bits.Whip_Fail
#define Rack_Fail   Wheelx->Sen_Err.Bits.Rack_Fail
#define Flop_Fail   Wheelx->Sen_Err.Bits.Flop_Fail

	// фильтрация амплитуды Wheel_Sensor
	Wheelx->Test.Filt_Uamp.Xn = Wheelx->Test.Ua_c;
	uint16_t Fout = Filter_Cheb(&Wheelx->Test.Filt_Uamp, Koef_Filt1_7Hz);
	if(Fout < __uintYnMinus)
	     Wheelx->Test.Uamp = Fout;
	else Wheelx->Test.Uamp = 0;
	// среднее значение амплитуды за 100мс
#define   __Ua_Mid_Time     100
	if(Wheelx->Test.Ua_Cnt <__Ua_Mid_Time)
	   Wheelx->Test.Ua_Cnt++;
	else
	{ if(Wheelx->Test.Ua_N)
	  { // было определение амплитуды
		   Wheelx->Test.UampN = Wheelx->Test.Ua_Sum /
				                Wheelx->Test.Ua_N;
	  }
	  else Wheelx->Test.UampN = 0;
	  Wheelx->Test.Ua_N = 0;
	  Wheelx->Test.Ua_Sum = 0;
	  Wheelx->Test.Ua_Cnt = 0;
	}
	// -------------- электрический тест-----------------------
	if(Wheelx->ADC.N > __SS_Test_ADC_N) //0,25c
	{  Wheelx->Test.A1_U0 = Wheelx->ADC.A1_Sum / Wheelx->ADC.N;
	   Wheelx->Test.A2_U0 = Wheelx->ADC.A2_Sum / Wheelx->ADC.N;
	   Wheelx->ADC.A1_Sum = 0;
	   Wheelx->ADC.A2_Sum = 0;
	   Wheelx->ADC.N = 0;
	  // неисправность Cut_Sens
	  // при обрыве в движении выставляется замыкание на землю
	  if(Wheelx->Test.A1_U0 > __A1_NC_Level &&
		 Wheelx->Test.A2_U0 < __A2_NC_Level)
	  { if(Wheelx->Test.NC_Cnt < __NC_Time)
		   Wheelx->Test.NC_Cnt++;
		else Cut_Sens = 1;
	  }
	  else
	  { // нет обрыва
		if(Wheelx->Test.NC_Cnt)
		   Wheelx->Test.NC_Cnt--;
	    else Cut_Sens = 0;
		// неисправность Short_Bat
		if(Wheelx->Test.A1_U0 > __A1_SB_Level &&
		   Wheelx->Test.A2_U0 > __A1_SB_Level)
		{ if(Wheelx->Test.SB_Cnt < __SB_Time)
		     Wheelx->Test.SB_Cnt++;
		  else Short_Bat = 1;
		}
		else
		{ if(Wheelx->Test.SB_Cnt)
			 Wheelx->Test.SB_Cnt--;
		  else Short_Bat = 0;
		  // неисправность Short_Gnd
		  if(Wheelx->Test.A1_U0 < __A1_GND_Level ||
		     Wheelx->Test.A2_U0 < __A1_GND_Level)// &&
			//	  !Wheelx->Test.NC_Cnt)
		  { if(Wheelx->Test.GND_Cnt < __GND_Time)
			   Wheelx->Test.GND_Cnt++;
		    else Short_Gnd = 1;
		  }
		  else
		  { if(Wheelx->Test.GND_Cnt)
			   Wheelx->Test.GND_Cnt--;
		    else Short_Gnd = 0;
		// неисправность Short_Sens
		// при Short_Bat и Short_Gnd dU0 = 0 и выставляется Short_Sens
		// поэтому проверка после else Short_Bat и else Short_Gnd
int32_t dU0 = Wheelx->Test.A1_U0 - Wheelx->Test.A2_U0;

            if((dU0 < 0 ||
		       dU0 < __dU_SC_Level) &&
               !_Hi_16(Wheelx->Speed))  // нет скорости
		    { if(Wheelx->Test.SC_Cnt < __SC_Time)
			     Wheelx->Test.SC_Cnt++;
		      else Short_Sens = 1;
		    }
		    else
		    { if(Wheelx->Test.SC_Cnt)
			     Wheelx->Test.SC_Cnt--;
		      else Short_Sens = 0;
		    }
		  }
	    }
	  }
	} // end --- электрический тест ---------------------------

	// -------------------- тест зазора -----------------------
#define __Gap_Speed_Low    0x0700 //  7km/h
#define __Gap_Speed_High   0x6400 //100km/h
#define __Gap_Uamp_Thr     230    // Ua=100mv
#define __Gap_Time         1000   // 10
// с увеличением скорости падает Gap_Uamp_Thr

	// при Short_Bat A2 выставляется зазор
	if(Wheelx->Speed >__Gap_Speed_Low &&
	   Wheelx->Speed <__Gap_Speed_High &&
	   Wheelx->Test.A2_U0 < __A1_SB_Level)
	{
	  if(Wheelx->Test.Uamp < __Gap_Uamp_Thr)
	  { if(Wheelx->Test.Gap_Cnt < __Gap_Time)
		   Wheelx->Test.Gap_Cnt++;
	    else Gap_Fail = 1;  // установка неисправности Gap_Fail
	  }
	  else
	  { if(Wheelx->Test.Gap_Cnt)
		   Wheelx->Test.Gap_Cnt--;
	    else Gap_Fail = 0;  // сброс неисправности Gap_Fail
	  }
	}

uint16_t i;
uint32_t  P = 0;
uint16_t  Tref;

    if(Wheelx->Test.CircleDone)
    {
       Wheelx->Way.Cnt_FRW++;  // для пробега
       // определение стабильности колеса
	   for (i = 0; i < Wheelx->CFG.Nz; i++)
		      P += Wheelx->Test.TzBuf[i];
	   //средний период за оборот
	   Tref = P  / Wheelx->CFG.Nz;
	   // порог стабильности
#define   __dTref_Thr   10//5 //2%
	   P = Wheelx->Test.Tref *__dTref_Thr / 256;
	   // проверяем изменение среднего периода
	   if(Tref < (Wheelx->Test.Tref + P) &&
		  Tref > (Wheelx->Test.Tref - P))
		    Wheelx->Test.SpeedStab = 1;
	   else Wheelx->Test.SpeedStab = 0;
	   // сохраняем для следующего оборота
	   Wheelx->Test.Tref = Tref;

     if(!Control_Active &&               // нет регулирования
        Wheelx->Speed >__Gap_Speed_Low && // едет со скоростью > 7km/h
  //   !Wheelx->Test.Gap_Cnt
		!Gap_Fail)      // нормальный зазор
	 { if(Wheelx->Test.SpeedStab)        // скорость постоянна
  	   { // будут выполняться тесты: зубчатки, биения

	// -------------- тест зубчатки ---------------------
#define   __dTzub_Thr   0x0500 //5%
#define   __Rack_NzFail  3  // минимальное число дефектных зубов
#define   __Rack_Ncirc   5 //10 // количество оборотов ошибки
#define   __Rack_FailT   5  //
int32_t   dT;
uint16_t  dTp;
uint16_t  Nzf = 0;

	     for (i = 0; i < Wheelx->CFG.Nz; i++)
	     { // отклонение от среднего периода
	       dT = Wheelx->Test.TzBuf[i] - Tref;
		   if(dT < 0)
			  dT = -dT; // абсолютная величина отклонения
		   // отклонение относительно среднего периода
		   dTp = dT * (uint32_t)__100_percent /  Tref;
		   if(dTp > __dTzub_Thr) Nzf++;
	     }
		 // количество дефектных зубов на обороте колеса
		 Wheelx->Test.Nz_Fail = Nzf;
		 // установка ошибки
	     if(Wheelx->Test.Nz_Fail > __Rack_NzFail &&
	        Wheelx->Capture.FailTcnt < __Rack_FailT) // конфликт с дребезг периода
	     {
	       if(Wheelx->Test.Rack_Cnt < __Rack_Ncirc)
	       	  Wheelx->Test.Rack_Cnt++;
	       else Rack_Fail = 1;  // установка неисправности  Rack_Fail
	     }
	     else
	     { if(Wheelx->Test.Rack_Cnt)
	       	  Wheelx->Test.Rack_Cnt--;
	       else Rack_Fail = 0;  // сброс неисправности Rack_Fail
	     }
	// -------------- тест биения -----------------------

#define   __WT_MinMax_Thr   0x5000 //80% 0x9600 //150%
#define   __WT_Ncirc   5//10 // количество оборотов ошибки
#define   __WT_FailT_Thr    3  // порог FailT
	     uint16_t  Ua_Mid = (Wheelx->Test.Ua_Max + Wheelx->Test.Ua_Min)/2;
         if(Ua_Mid > __Gap_Uamp_Thr &&  // конфликт с зазором
            Wheelx->Capture.FailTcnt < __WT_FailT_Thr && // конфликт с дребезгом
		    Wheelx->Test.Ua_Max > Wheelx->Test.Ua_Min)
	     { // разница амплитуд приведенная к среднему значению
           Wheelx->Test.WT_MinMax = (Wheelx->Test.Ua_Max - Wheelx->Test.Ua_Min) *
    			                   (uint32_t)(__100_percent) / Ua_Mid;
	       // установка ошибки
	       if(  Wheelx->Test.WT_MinMax > __WT_MinMax_Thr)
	       { if(Wheelx->Test.WT_Cnt < __WT_Ncirc)
	       	    Wheelx->Test.WT_Cnt++;
	       	 else Whip_Fail = 1;
	       }
	       else
	       { if(Wheelx->Test.WT_Cnt)
	       	    Wheelx->Test.WT_Cnt--;
	         else Whip_Fail = 0;
	       }
	     }
	   } // end SpeedStab

       //  -------------- тест  дребезг периода ---------------------
// взято из DZ
// если на обороте колеса
// если  WheelXX->Capture.FailTcnt > 6
// увеличивается счетчик FailTcirc до 10 и ставится ошибка
// если  WheelXX->Capture.FailTcnt < 6 и
// нет ошибки FailTcirc обнуляется           //*
// иначе уменьшается счетчик FailTcirc до 0 и снимается ошибка
#define   __FailT_Ncirc   5 //10 // количество оборотов ошибки
#define   __FailT_Thr     6  // порог FailT на обороте
         if(Wheelx->Capture.FailTcnt < __FailT_Thr)
         { if(Wrong_T)
           { if(Wheelx->Test.FailT_Cnt)
        	    Wheelx->Test.FailT_Cnt--;
             else Wrong_T = 0; // сброс неисправности Wrong_T
           }
           else Wheelx->Test.FailT_Cnt = 0; //*
         }
         else                      // достаточно событий FailT
         { if(Wheelx->Test.FailT_Cnt <__FailT_Ncirc)
     	      Wheelx->Test.FailT_Cnt++;
           else Wrong_T = 1; // установка неисправности Wrong_T
         }
       // -------------- тест провалы скорости ------------
// возможен конфликт с ABS на малых скоростях
// при увеличенном зазоре
// при периодических неисправностях
#define   __FlopFail_Ncirc   5  // количество оборотов ошибки
#define   __FlopFail_Thr     3  // порог SafeSp_Cnt на обороте
       if(Wheelx->Test.SafeSp_Cnt < __FlopFail_Thr)
       { // недостаточно событий Safe_Sp на обороте
    	 if(Flop_Fail)
         { if(Wheelx->Test.Flop_Cnt)
    	      Wheelx->Test.Flop_Cnt--;
           else Flop_Fail = 0; // сброс неисправности Flop_Fail
         }
         else Wheelx->Test.Flop_Cnt = 0; //*
       }
       else // достаточно событий Safe_Sp
       { if(Wheelx->Test.Flop_Cnt <__FlopFail_Ncirc)
   	        Wheelx->Test.Flop_Cnt++;
         else Flop_Fail = 1; // установка неисправности Flop_Fail
       }
     }
     Wheelx->Test.SafeSp_Cnt = 0;
     Wheelx->Capture.FailTcnt = 0;
     Wheelx->Test.CircleDone = 0;
     Wheelx->Test.Ua_Max = 0;
     Wheelx->Test.Ua_Min = 0xF000;
    } // конец тестов на обороте колеса
    else
    { // определение Max и Min амплитуды
      if(Wheelx->Test.Ua_Min > Wheelx->Test.Uamp)
    	 Wheelx->Test.Ua_Min = Wheelx->Test.Uamp;
      if(Wheelx->Test.Ua_Max < Wheelx->Test.Uamp)
         Wheelx->Test.Ua_Max = Wheelx->Test.Uamp;
    }

    // -------------- тест отсутствия скорости -------------------
    // причина очень большой зазор
// возможен конфликт с ASR если отключено
// при неисправностях не дающих сигнала датчика
#define   __WxZero_Speed     0x1400  // 20км/ч
#define   __WxZeroSp_Time    10000 //10c  //60000  // 1минута
#define   __WxZeroSp_Tlow    3000 // 3c
#define   __WxZero_TclrErr   1500 // 1,5c

    if(_Hi_16(Wheelx->Speed) ||    // есть скорость
       ((Wheelx->ABS.Active ||
    	 All_Speed_Zero) && // стоит и
    	!Speed_Zero))     // нет ошибки декремент Cnt
    { if(Wheelx->Test.SpeedZero_Cnt > __WxZero_TclrErr)
         Wheelx->Test.SpeedZero_Cnt = __WxZero_TclrErr;
      if(Wheelx->Test.SpeedZero_Cnt)
      	 Wheelx->Test.SpeedZero_Cnt--;
      else Speed_Zero =  0; // сброс неисправности Speed_Speace
    }
    else // нет скорости
    if(Speed_VX_est > __WxZero_Speed &&  // скорость > 20км/ч
       !(Wheelx->Sen_Err0.Byte &
    	 __Mask_Err_ZeroSp)) // неисправности не дающие сигнала датчика
    { uint16_t WxZeroSp_T = __WxZeroSp_Time;
      if(Speed_FrontAxel > __WxZero_Speed)
    	       WxZeroSp_T = __WxZeroSp_Tlow;
      if(Wheelx->Test.SpeedZero_Cnt <WxZeroSp_T)
     	 Wheelx->Test.SpeedZero_Cnt++;
      else Speed_Zero =  1; // установка неисправности Speed_Speace
    }

    // -------------- тест Tire_Fail -------------------
#define   __Tire_VxMin       0x0F00	// 15km/h
#define   __Tire_VxMax       0x5000	// 80km/h
#define   __Tire_Time        1000   // 5c
#define   __TireKoef_Norm   0x8000U
#define   __TireKoef_Max    42598 //81920 //0x9332U  //+15%
#define   __TireKoef_Min    24576 //49152 //0x6CCBU  //-15%

	if( Tire_Koef_Enable &&             // разрешено в конфигурации
	    Speed_VX_TCO > __Tire_VxMin &&  // скорость больше 15 km/h
		Speed_VX_TCO < __Tire_VxMax &&  // max	80km/h
		!Wheelx->Sen_Err0.Byte &&       // нет неисправности
		!Control_Active)                // любое регулирование
	{ //Wheelx->Test.TireKoef = (uint32_t)Wheelx->Capture.Speed *
		//                        __TireKoef_Norm / Speed_VX_TCO;
	  Wheelx->Test.TireKoef = Wheelx->Tire_Koef /2;
	  if(Wheelx->Test.TireKoef >__TireKoef_Max ||
		 Wheelx->Test.TireKoef <__TireKoef_Min)
	  { if(Wheelx->Test.TireFail_Cnt < __Tire_Time)
		   Wheelx->Test.TireFail_Cnt++;
	    else Tire_Fail = 1; // установка неисправности Tire_Fail
	  }
	  else
	  { if(Wheelx->Test.TireFail_Cnt)
		   Wheelx->Test.TireFail_Cnt--;
	    else Tire_Fail = 0; // сброс неисправности Tire_Fail
	  }
	}
    // -------------- тест предельной скорости -------------------
#define   __WxMax_Speed     0x8400  // 132км/ч
#define   __WxMaxSp_Time    1000    // 1c
    if(Wheelx->Speed > __WxMax_Speed)
    { if(Wheelx->Test.SpeedMax_Cnt < __WxMaxSp_Time)
    	 Wheelx->Test.SpeedMax_Cnt++;
      else Wrong_Speed = 1; // установка неисправности Wrong_Speed
    }
    else
    { if(Wheelx->Test.SpeedMax_Cnt)
    	 Wheelx->Test.SpeedMax_Cnt--;
      else Wrong_Speed = 0; // сброс неисправности Wrong_Speed
    }
	 // сброс флага Safe_Sp
// флаг Safe_Sp сбрасывается если сорость достигнет базовую
// или ABS или стоит
#define   __SafeSp_dBase  0x0A00	//0x0300	// 3km/h
	 if(All_Speed_Zero ||     // машина стоит
	    Wheelx->ABS.Active ||    //  ABS
	    (Wheelx->Capture.Speed + __SafeSp_dBase) >
	     Speed_VX_est)//Wheelx->Base)  // скорость достила базовую
	     Wheelx->State.Bits.b6 = 0;    //Safe_Sp

    // сброс флага Safe_dT
    if(Wheelx->Capture.Safe_dT_Cnt) // счетчик сброса
	   Wheelx->Capture.Safe_dT_Cnt--;
    else Wheelx->State.Bits.b5 = 0;    //Safe_dT

    if(SenXX_Install)
    {
      Wheelx->Sen_Err0.Byte =_Lo_16(Wheelx->Sen_Err.Word);
      Wheelx->Sen_Err1.Byte =_Hi_16(Wheelx->Sen_Err.Word);
      if(Wheelx->Sen_Err0.Byte)
    	   Error0 = 1;
      else Error0 = 0;
    }
    // переменные для осциллографа
#define __Test_Uamp_Koef  24  // 26  // 44
#define __Test_U0_Koef    24  // 32
#define __WT_MinMax_Koef  128
    Wheelx->Test.Oss.A1_U0 = Wheelx->Test.A1_U0 /__Test_U0_Koef;
    Wheelx->Test.Oss.A2_U0 = Wheelx->Test.A2_U0 /__Test_U0_Koef;
    Wheelx->Test.Oss.Uamp = Wheelx->Test.Uamp /__Test_Uamp_Koef;
    Wheelx->Test.Oss.WT_MinMax = Wheelx->Test.WT_MinMax /__WT_MinMax_Koef;
//o
    Wheelx->Test.Oss.A1_Ua = Wheelx->Capture.A1_Upoz/32;//Uamp1 /__Test_Uamp_Koef;
    Wheelx->Test.Oss.A2_Ua = Wheelx->Capture.A1_Uneg/32;//Uamp2 /__Test_Uamp_Koef;
} // end Test_WheelSensor

void Wheel_Sensor_Test(void)
{ // вызывается в My_Tick(void) // 1ms
	if(!DSC_Emul_Fl)
	{
#ifdef   __AxisF_Compile
	Test_WheelSensor(&Wheel_FL, SenFL_Install);
	Test_WheelSensor(&Wheel_FR, SenFL_Install);
#endif
#ifdef   __AxisR_Compile
	Test_WheelSensor(&Wheel_RL, SenRL_Install);
	Test_WheelSensor(&Wheel_RR, SenRR_Install);
#endif
#ifdef   __Axis3_Compile
	Test_WheelSensor(&Wheel_3L, Sen3L_Install);
	Test_WheelSensor(&Wheel_3R, Sen3R_Install);
#endif
	}
} // end Wheel_Sensor_Test()

//#ifdef   __AxisF_Compile
void     DIA_SST1_Oss(void)
{ // вызывается в DIA_Oss() MySystem.c
	// первая строка в Осциллографе
	UartDIA.Tx_data[0] = Wheel_FL.Speed/64;
	UartDIA.Tx_data[3] = Wheel_FR.Speed/64;
	UartDIA.Tx_data[6] = Wheel_RL.Speed/64;
	UartDIA.Tx_data[9] = Wheel_RR.Speed/64;
	// вторая строка в Осциллографе
	UartDIA.Tx_data[1] = Wheel_FL.Test.Oss.A1_U0;
	UartDIA.Tx_data[4] = Wheel_FR.Test.Oss.A1_U0;
	UartDIA.Tx_data[7] = Wheel_RL.Test.Oss.A1_U0;
	UartDIA.Tx_data[10]= Wheel_RR.Test.Oss.A1_U0;
	// третья строка в Осциллографе
	UartDIA.Tx_data[2] =  Wheel_FL.Test.Oss.A2_U0;
	UartDIA.Tx_data[5]  = Wheel_FR.Test.Oss.A2_U0;
	UartDIA.Tx_data[8]  = Wheel_RL.Test.Oss.A2_U0;
	UartDIA.Tx_data[11] = Wheel_RR.Test.Oss.A2_U0;
	// четвертая строка в Осциллографе
	UartDIA.Tx_data[12] = Wheel_FL.Test.Oss.Uamp;
	UartDIA.Tx_data[13] = Wheel_FR.Test.Oss.Uamp;
	UartDIA.Tx_data[14] = Wheel_RL.Test.Oss.Uamp;
	UartDIA.Tx_data[15] = Wheel_RR.Test.Oss.Uamp;
	// пятая строка в Осциллографе
	UartDIA.Tx_data[16] = Wheel_FL.Test.Oss.WT_MinMax;
	UartDIA.Tx_data[17] = Wheel_FR.Test.Oss.WT_MinMax;
	UartDIA.Tx_data[18] = Wheel_RL.Test.Oss.WT_MinMax;
	UartDIA.Tx_data[19] = Wheel_RR.Test.Oss.WT_MinMax;
	// шестая строка в Осциллографе
	UartDIA.Tx_data[20] = _Hi_16(Wheel_RR.Test.SpeedZero_Cnt);
	UartDIA.Tx_data[21] = _Lo_16(Wheel_RR.Test.SpeedZero_Cnt);
	UartDIA.Tx_data[22] = Wheel_RR.Sen_Err0.Byte;
	UartDIA.Tx_data[23] = Speed_VX_est / 64;
}
void     DIA_SST2_Oss(void)
{ // вызывается в DIA_Oss() MySystem.c
	// первая строка в Осциллографе
	UartDIA.Tx_data[0] = Wheel_FL.Speed/64;
	UartDIA.Tx_data[3] = Wheel_FR.Speed/64;
	UartDIA.Tx_data[6] = Wheel_FL.Test.SpeedStab;
	UartDIA.Tx_data[9] = Wheel_FR.Test.SpeedStab;
	// вторая строка в Осциллографе
	UartDIA.Tx_data[1] = Wheel_FL.Test.Gap_Cnt;
	UartDIA.Tx_data[4] = Wheel_FR.Test.Gap_Cnt;
	UartDIA.Tx_data[7] =  Wheel_FL.Test.UampN/__Test_Uamp_Koef;
	UartDIA.Tx_data[10] = Wheel_FR.Test.UampN/__Test_Uamp_Koef;
	// третья строка в Осциллографе
	UartDIA.Tx_data[2] =  Wheel_FL.Test.Nz_Fail;
	UartDIA.Tx_data[5]  = Wheel_FR.Test.Nz_Fail;
	UartDIA.Tx_data[8]  = Wheel_FL.Test.Rack_Cnt;
	UartDIA.Tx_data[11] = Wheel_FR.Test.Rack_Cnt;
	// четвертая строка в Осциллографе
	UartDIA.Tx_data[12] = Wheel_FL.Capture.FailTcnt;//Test.FailT_Cnt;
	UartDIA.Tx_data[13] = Wheel_FR.Capture.FailTcnt;
	UartDIA.Tx_data[14] = Wheel_FL.Test.FailT_Cnt;
	UartDIA.Tx_data[15] = Wheel_FR.Test.FailT_Cnt;
	// пятая строка в Осциллографе
	UartDIA.Tx_data[16] = Wheel_FL.Test.Ua_Min/__Test_Uamp_Koef;
	UartDIA.Tx_data[17] = Wheel_FR.Test.Ua_Min/__Test_Uamp_Koef;
	UartDIA.Tx_data[18] = Wheel_FL.Test.Ua_Max/__Test_Uamp_Koef;
	UartDIA.Tx_data[19] = Wheel_FR.Test.Ua_Max/__Test_Uamp_Koef;
	// шестая строка в Осциллографе
	UartDIA.Tx_data[20] = Wheel_FL.State.Byte;
	UartDIA.Tx_data[21] = Wheel_FR.State.Byte;
	UartDIA.Tx_data[22] = Wheel_RL.State.Byte;
	UartDIA.Tx_data[23] = Wheel_RR.State.Byte;
}
void     DIA_Validity_Oss(void)
{ // вызывается в DIA_Oss() MySystem.c
	// первая строка в Осциллографе
	UartDIA.Tx_data[0] = _OssA(AccelY.DelSpF);
	UartDIA.Tx_data[3] = _OssA(Acc_Y_est);
	UartDIA.Tx_data[6] = Wheel_RL.Speed/64;
	UartDIA.Tx_data[9] = _OssW(OmegaZ_Des);
	// вторая строка в Осциллографе
	UartDIA.Tx_data[1] = _OssW(Omega_Z_est);
	UartDIA.Tx_data[4] = _OssW(OmegaZ_Vf);
	UartDIA.Tx_data[7] = _OssW(OmegaZ_AccY);
	UartDIA.Tx_data[10]= _OssW(OmegaZ_Ref);
	// третья строка в Осциллографе
	UartDIA.Tx_data[2] =  Validity.Wz1.Weight/256;
	UartDIA.Tx_data[5]  = Validity.Wz2.Weight/256;
	UartDIA.Tx_data[8]  = Validity.Wz3.Weight/256;
	UartDIA.Tx_data[11] = Validity.Wz4.Weight/256;
	// четвертая строка в Осциллографе
	UartDIA.Tx_data[12] = Validity.RefOkCnt;
	UartDIA.Tx_data[13] = Validity_Flags;
	UartDIA.Tx_data[14] = Validity_Flags2;
	UartDIA.Tx_data[15] = Validity.RefCnt/2;
	// пятая строка в Осциллографе
	UartDIA.Tx_data[16] = AxValid.Bad.Byte;
	UartDIA.Tx_data[17] = _Hi_16(Koef_AccY_dVf);
	UartDIA.Tx_data[18] = _OssA(AccelX.Value);
	UartDIA.Tx_data[19] = _OssA(Base.AccX);
	// шестая строка в Осциллографе
	UartDIA.Tx_data[20] = AyValid.Bad.Byte;
	UartDIA.Tx_data[21] = _OssA(AccelY.Value);
	UartDIA.Tx_data[22] = _OssA(AccelY.DelSpF);
	UartDIA.Tx_data[23] = _OssA(ROP.AccY_OzD);
}
//#endif

void  TransmissionKTS(void)
{
//-------------------------- KoefTaxoSpeed --------------------------
#define __TrOn_Speed  0x0300 //3km/h
#define __KTS_Max     0x7F00

	KTS.Taxo = Delay(DelayBuf_Taxo, CAN_Engine.Taxo,__Delay_Taxo);

	if(Speed_RearAxel > __TrOn_Speed)
	{
	   KTS.TS = KTS.Taxo * (uint32_t)__KTS_Koef /
			    Speed_RearAxel;
	   if(KTS.TS > __KTS_Max)
		  KTS.TS = __KTS_Max;
	}
	else  KTS.TS = 0;

    // фильтруем KoefTaxoSpeed
	Filter_KTS.Xn = KTS.TS;
	KTS.KoefTaxoSpeed = Filter_Cheb(&Filter_KTS, Koef_Filtr1Hz);

// ----------------- определение TransmissionON ---------------------------
#define __KTS_Delta      280   //140
#define __TransON_Time   40    // 0.2c
#define __TransOFF_Time  100   // 0.5c
#define __TrOn_TaxoXX    0x0FA0 //500 об/мин
#define __TrOn_TorqueXX  0x05   // 130-125
#define __TrOn_AccX      0x0400  // 0,5m/c^2
#define __KTS_Speed      0x2000  // 32 km/h

    // Delta изменения KTS
	if(KTS.KoefTaxoSpeed > KTS.Last)
		 KTS.Delta = KTS.KoefTaxoSpeed - KTS.Last;
	else KTS.Delta = KTS.Last -	KTS.KoefTaxoSpeed;

    // порог изменения KTS
	KTS.Range = __KTS_Delta;

    // Cчетчик KTS_Last
    if(KTS.LastCnt++ > __TransOFF_Time ||// счетчик больше ON_Time
       (KTS.Delta > (KTS.Range * 2) &&  // Изменение KTS превысило  два порога
    	KTS.LastCnt > __TransON_Time)) // и счетчик больше OFF_Time
    	KTS.LastCnt = 0;              // сброс счетчика

    // Изменение значения  KTS Last
    if(((KTS.OnCnt == (__TransON_Time/2)) && // счетчик On равен ON_Time/2
   	     Acc_X_est > __TrOn_AccX &&          // и машина разгоняетя
		 TransmissionON) ||                  // и трансмисия включена
   	   !KTS.LastCnt)                    // счетчик Last нуль
    	KTS.Last = KTS.KoefTaxoSpeed;   // новое значение KTS Last

    // проверка изменения KTS
    if( KTS.Delta > KTS.Range ||
	   !KTS.KoefTaxoSpeed ||
	   !KTS.Last ||
	   !Speed_RearAxel)
    	 KTS.TrOn = 0;  //
    else KTS.TrOn = 1;  // нормальное KTS

    // определение TransmissionON
     if(!TransmissionON)
     { // выключена
       if(Speed_RearAxel > __TrOn_Speed && // едет
    	  CAN_Engine.Taxo > __TrOn_TaxoXX) // мотор заведен
       { // условия определения выполнены
    	 if(KTS.TrOn)
    	 { if(KTS.OnCnt < __TransON_Time)
    		  KTS.OnCnt++;
    	   else   TransmissionON = 1;
    	 }
    	 else
    	 if(!KTS.TrOn && KTS.OnCnt) KTS.OnCnt--;
       }
     }
     else
     { // включена
      if(!KTS.TrOn)
      { if(!KTS.OnCnt--)
        {   KTS.OnCnt = 0;
    	  if(Acc_X_est < __TrOn_AccX) TransmissionON = 0;
        }
      }
      else
      if( Acc_X_est > __TrOn_AccX &&
    	  KTS.OnCnt < __TransON_Time)
    	  KTS.OnCnt++;
     }

#ifdef   __AxisF_Compile
    // определение TransmissionON
   if(!GearBox_AutoMatic)//!Control_Active)   // нет регулирования
   { if(CCVS_Clutch_Active ==__BitsON &&
 	    CAN_CCVS_Enable) // Clutch_Active
 	     TransmissionON = 0;
   } // END определение TransmissionON коробка механика
   else
   { // коробка автомат
	 if((Find_ETC1 && Tout_ETC1 && Gear_Shift) ||
		CAN_Engine.Gear.Num == 0x7D || // zero is neutral.
		CAN_Engine.Gear.Num == 0xFB)  // (0xFB) is park.
		  TransmissionON = 0;
	 else TransmissionON = 1;
   }

   if(DSC_Emul_Fl && !Emul_Taxo)    TransmissionON = 1;

//-------------------------------------------------------------------------
// !!!!! через 	TCO.Taxo можно определить передачу !!!!
// TCO.Taxo есть не у всех машин
// частота вращения задних колес
// 100/Pi/3,6*60 = 530
#define __K_RearRPM  530
	uint16_t Taxo;
	TCO.RearRPM = Speed_RearAxel * (uint32_t)__K_RearRPM /
			      Wheel_RL.CFG.Radius /256;
//	маз 643028-8529-012 Передаточное число ведущего моста 4,59
#define __N_rear  1175
	TCO.Taxo_Est = TCO.RearRPM * (uint32_t)__N_rear / 32;

	if(TCO.Taxo < 0xFE00 &&
	   TCO.Taxo) // достоверны
		 Taxo = TCO.Taxo;
	else Taxo = TCO.Taxo_Est;

// передаточное число коробки передач
	TCO.Gear.Koef = ((uint32_t)CAN_Engine.Taxo * 256) / Taxo;
	/*
	if(!GearBox_AutoMatic)
	{ // коробка механика
	  if(CAN_Engine.Taxo < 0xFE00 && // достоверны
	     CAN_Engine.Taxo &&
	     Speed_RearAxel) // заведена и едет
	  {
// передаточное число коробки передач
	   TCO.Gear.Koef = ((uint32_t)CAN_Engine.Taxo * 256) / Taxo;

// определяем передачу
#define __K_ThrGK_High     0x0127	//  115%
#define __K_ThrGK_Low      0x00D9	//  85%
	    uint8_t Gear_Num = 0;
	    uint8_t i;

	    switch (Vehicle.Gear)
	    { case __GearZF16:
		  for (i = 0; i < 16; i++)
		  { if(TCO.Gear.Koef < GearZF16_Data[i] &&
			   TCO.Gear.Koef > GearZF16_Data[i+1])
  			  Gear_Num = i+1; // найдена
          }
		  break;
		  case __YMZ236:
		  for (i = 0; i < 5; i++)
		  { if(TCO.Gear.Koef < YMZ236_Data[i] &&
			   TCO.Gear.Koef > YMZ236_Data[i+1])
	  		  Gear_Num = i+1; // найдена
	      }
		  break;
	    }
	    if(Gear_Num)
	    { // объеденяем с ReverseON -b6 TransmissionON- b5
	       TCO.Gear.Num = (DSC_Flags1 & 0x60) | (Gear_Num);
	    }
	    else TCO.Gear.Num = 0;//18;  // нейтраль
	  }
	  else   TCO.Gear.Num = 0xFF;//0x80; //не достоверны
	}
	else
	{ //  коробка автомат
	  if(!Gear_Shift &&
	      Gear_OkCAN == __BitsON)
	  {
// negative values are reverse gears, < 125
// positive values are forward gears,
// zero is neutral. 251 (0xFB) is park.
#define __CAN_Gear_OffSet   0x7D
		TCO.Gear.Num = CAN_Engine.Gear.Num -
				     __CAN_Gear_OffSet;
		// объеденяем с ReverseON -b6 TransmissionON- b5
		if(TCO.Gear.Num != 126) // Parking
		TCO.Gear.Num |= (DSC_Flags1 & 0x60);
	  }
	}
*/
#endif
}  // end TransmissionKTS()

// Момент двигателя компенсирующий Давление заднего тормоза
// используется в ASR_Engine_Regulate
uint16_t Torque_Press (WheelTypeDef* Wheelx)
{
#define __K_Torque_Press	 256 //1024 // __Percent_To_Nm*256
uint32_t T;
	if(!KTS.TS ||  // нефильтрованный KoefTaxoSpeed
	   Wheelx->Press < Wheelx->P_Full)
		 return 0;
	else
	{ T = ((uint32_t)Wheelx->Press -
		   (uint32_t)Wheelx->P_Full) *
		  Load.CFG.Truck.Num_RearAxis *
		  Load.CFG.K_Pr /
		  KTS.TS;

	  return T * __K_Torque_Press /
			 Engine.PeakTorq;
	}
} // end Torque_Press(&Wheel_XX)

void  Vehicle_Load(void)
{
// выход фильтра используется для обнуления отрицательных uint16_t
uint16_t FiltOut;
// ---Определение загрузки через ESTIMATION  Разгон----------
// m = Te * n * 2*Pi * 3,6 / Vx	/ Ax
// размерности
// PeakTorque 1Nm -	lsb
// CAN_Engine.Torque 1% - lsb
// Engine.Taxo 0.125 rpm / lsb  /8/60  1/c - lsb
// Derivative_VX_est	1m/c^2 - 2048lsb
// CAR_Load  1kg - lsb
// __Kload_MeNeVxAx
// 65536 / 100 / 8 /60 * 2 * Pi * 3.6 * 8 *4 = 988
#define __Kload_MeNeVxAx 988
#define __Percent_To_Nm	 4 //4*100
/*
then data is transmited in indicated torque as a percent of peak engine  torque
indicated torque developed in the cilinder it is defined
as the sum of the net brake torque and friction torque
затем данные передаются с указанным крутящим моментом
в процентах от пикового момента двигателя.
Указанный крутящий момент, развиваемый в цилиндре, определяется
как сумма чистого тормозного момента и момента трения.
 */

	int32_t Torq = CAN_Engine.Torque * (uint32_t)Engine.PeakTorq /
			       __Percent_To_Nm;

// зависимость потерь от оборотов ЯМЗ-5344
// 700 1000 1500 2000  об/мин
// 9    9	 15   28    %
#define __Taxo_P4  0x1F40  //1000rpm *8
#define __Taxo_XX  0x1770  //750rpm
#define __Taxo_P1  0x2EE0  //1500rpm *8
#define __Taxo_P2  0x4330  //2150rpm
//  Engine.PeakTorq
	// момент XX двигателя
	Engine.TorqXX = (uint32_t)Engine.PeakTorq *
			        (uint32_t)Engine.CFG.TorqXX / __Percent_To_Nm;
	// момент потерь в двигателе
	uint16_t  dTaxo = 0;
	if(CAN_Engine.Taxo > __Taxo_P4) dTaxo = CAN_Engine.Taxo - __Taxo_P4;
	// percent
	Engine.PercentLoss = dTaxo * Engine.CFG.K1_TL / 256 +  // первая степень
			            (dTaxo * dTaxo / 32) *
				                 Engine.CFG.K2_TL / 65536; // вторая степень
	Engine.TorqLoss = (uint32_t)Engine.PercentLoss * Engine.PeakTorq /
			          __Percent_To_Nm / 256 + Engine.TorqXX; // без потерь ХХ
	Torq -= Engine.TorqLoss; // без потерь
	if(Torq < 0) Torq = 0;
	// фильтруем Engine.Torque
	Filter_Torque.Xn = Torq;
	uint16_t FT = Filter_Cheb(&Filter_Torque, Koef_Filtr5Hz);//1Hz
    // задержка
	if(Load.CFG.Delay_Torq > SizeDelayBuff-2)
	   Load.CFG.Delay_Torq = SizeDelayBuff-2;
	Engine.Torque = Delay(DelayBuf_Torque,FT,Load.CFG.Delay_Torq);

// аэро сопротивление  и сопротивление шин
// учитывается в выбеге

// условия запуска расчета
#define  __Speed_VX_Min  0x0A00
#define  __Load_AxThrOn  0x004E  // 0,3m/c^2
#define  __Load_AxThrOff 0x001A  // 0,1m/c^2
#define  __Load_Time_Min   200	//1c
#define  __LoadMassEst_Kmax 300 //+17%
#define  __LoadMassEst_Kmin 230 //-10%
#define   __Load_AxT_Thr    55 // 0,277c  1m/c2 - dV 1km/h

	// ограничение
    Load.MassEst_Max = Load.Truck.LadenMass *
	    		      (uint32_t)__LoadMassEst_Kmax /256;
    Load.MassEst_Min = Load.Truck.EmptyMass  *
	    		(uint32_t)__LoadMassEst_Kmin /256;

    // определение ускорения Разгон
    if(++Load.Engine.Ax_T > __Load_AxT_Thr)
    { if(Load.Engine.Ax_V)
  	  {  Load.Engine.Ax = (uint32_t)Speed_FrontAxel -
  	                      (uint32_t)Load.Engine.Ax_V;
  	  }
      Load.Engine.Ax_V = Speed_FrontAxel;
      Load.Engine.Ax_T = 0;
    }

    if(Speed_VX_est > __Speed_VX_Min)   // едет Vx > 10km/h
    { // сила тяги двигателем
      if(Load_KTS)
      {  Load.Engine.Force = (uint32_t)Engine.Torque *
    	                     KTS.KoefTaxoSpeed *
			                  Load.CFG.Efficiency /100;
      }
      else
  	  { Load.Engine.Force = ((((int32_t)Engine.Torque *
  			                   (int32_t)__Kload_MeNeVxAx) *
  		                      (int64_t)CAN_Engine.Taxo) /
  		                     (int32_t)Speed_RearAxel) *
		                    Load.CFG.Efficiency /100;
  	  }
  	  // текущая масса
  	  if(Acc_X_est > Load.CFG.AxRunOut)     // ускоряется
  	  {	Load.Engine.M =  (uint32_t)Load.Engine.Force /
                         (Acc_X_est - Load.CFG.AxRunOut);
  	    if(Load.Engine.M > Load.MassEst_Max)
  	       Load.Engine.M = Load.MassEst_Max;
  	    if(Load.Engine.M < Load.MassEst_Min)
  	       Load.Engine.M = Load.MassEst_Min;
  	  }
  	  else Load.Engine.M = 0;
    }
    else
    { Load.Engine.M = 0;
      Load.Engine.Force = 0;
    }
    // определение состояния педали газа
    if(Load.Engine.Force >
       Load.Truck.EmptyMass *__Load_AxThrOn )
         Engine_Gaz = 1;
    else Engine_Gaz = 0;
    // определение состояния трансмиссии
    if(GearBox_AutoMatic &&
       Find_ETC1 && !Tout_ETC1 && // найдена в CAN
       Gear_Shift ==__Active)   // Transmission Shift In Process
    	 Gear_Shifting = 1;
    else Gear_Shifting = 0;

    // условия запуска расчета
    // при TruckSim ставится Control_Active засчет ABS
	if((!Control_Active || TruckSim_Active) &&   // нет регулирования
	   Speed_VX_est > Load.CFG.Vx_Min &&    // скорость больше 15km/h
	   Engine_Gaz &&                        // нажат газ
	   !Gear_Shifting &&	  // автоматическа коробка включена
	   Load.Engine.Ax > __Load_AxThrOn)     // ускорение больше 0,3m/c^2
	   Engine_M_Pro = 1;  // запуск
	if(Load.Engine.Ax < __Load_AxThrOff ||  // мало ускорение < 0,1m/c^2
//	   Control_Active ||   // возникло регулирование
	   Gear_Shifting)     // автоматическа коробка переключается
	   Engine_M_Pro = 0; // остановка

    // -----масса автомобиля Разгон Первый способ ----------
    if(Load.Engine.M &&
       Engine_M_Pro)
    { // среднее значение
   	  if(Load.Engine.SumT < 0x3000) //10минут
      { Load.Engine.SumT++;
    	Load.Engine.Msum += Load.Engine.M;
    	Load.Engine.M1 = Load.Engine.Msum /
    	    		     Load.Engine.SumT;
        if(Load.Engine.SumT > __Load_Time_Min)
        	Engine_M1_Cmpl = 1;
      }
    }
    // -----масса автомобиля Разгон Второй способ ----------
// Koef = 8/3,6*200
#define   __Load_Dec_Koef   444
	if(!Load.Engine.Vx_Start)
	{ // ожижаем разгон
  	  if(Engine_M_Pro &&
  		 Speed_VX_est < Load.CFG.Vx_Max)
  	  { // NU
  		Load.Engine.Vx_Start = Speed_VX_est;
  		Load.Engine.SumF = 0;
  	    Load.Engine.Time = 0;
  	  }
	}
	else
	{ Load.Engine.Time++;
  	  Load.Engine.SumF += Load.Engine.Force;
  	  // проверка завершения
  	  if(Speed_VX_est < Load.Engine.Vx_Start)
  		   Load.Engine.Vx_Start = 0; // нет разгона
  	  else
  	  { if(!Engine_M_Pro)
  	    { if(Load.Engine.Time > __Load_Time_Min)
  		  { // end Ok
  			Load.Engine.Acc = ((uint32_t)Speed_VX_est -
  						       (uint32_t)Load.Engine.Vx_Start) *__Load_Dec_Koef /
  					               Load.Engine.Time;
  			Load.Engine.Torque = Load.Engine.SumF /
  					             Load.Engine.Time;
  		    Load.Engine.M2 = Load.Engine.Torque /
  						      (Load.Engine.Acc - Load.CFG.AxRunOut);
  		    Load.Engine.Vx_Start = 0;
  		    // ограничение
  		    if(Load.Engine.M2 > Load.MassEst_Max)
  			   Load.Engine.M2 = Load.MassEst_Max;
  		    if(Load.Engine.M2 < Load.MassEst_Min)
  			   Load.Engine.M2 = Load.MassEst_Min;
  		    // среднее значение замеров
  		    Load.Engine.Num++;
  		    if(Load_DeltaMass_Lim &&
  		       Load.Engine.Num > 2)
  		    {
#define   __DeltaMass_Lim   2000
  		      if(Load.Engine.M2 > (Load.Engine.Ms +__DeltaMass_Lim))
  		    	 Load.Engine.M2 = (Load.Engine.Ms +__DeltaMass_Lim);
  		      if(Load.Engine.M2 < (Load.Engine.Ms -__DeltaMass_Lim))
  		    	 Load.Engine.M2 = (Load.Engine.Ms -__DeltaMass_Lim);
  		    }
  			Load.Engine.SumM2 += Load.Engine.M2;
  			Load.Engine.Ms = Load.Engine.SumM2 /
  					         Load.Engine.Num;
  			// New буфер
  			if(Load.Engine.Num2 < (sizeof(Load.Engine.BufM2 -1)))
  			   Load.Engine.Num2++;
  			Load.Engine.BufM2[Load.Engine.Num2-1] = Load.Engine.M2;
uint32_t   SumBufM2 = 0;
            for (uint8_t i = 0; i < Load.Engine.Num2; i++)
            	SumBufM2 += Load.Engine.BufM2[i];
            Load.Engine.Ms2 = SumBufM2 / Load.Engine.Num2;

  			// Mediana
  			Load.Engine.Mm = Mediana(Load.Engine.BufM, 6, Load.Engine.M2);
  		  }
  		  else Load.Engine.Vx_Start = 0; // not Ok
  		}
  	  }
	}

    if(Load_Engine_Metod2 &&
       Load.Engine.Ms)
    { if(!Mediana_Enable)
      { if(!Load_Engine_Buf)
    	    Load.Engine.Mass = Load.Engine.Ms; // усредненная Второй способ
        else Load.Engine.Mass = Load.Engine.Ms2;
      }
      else  Load.Engine.Mass = Load.Engine.Mm;
    }
    else
    { if(Engine_M1_Cmpl)
    	Load.Engine.Mass = Load.Engine.M1; // усредненная первый способ
    }

// --- Определение загрузки через ESTIMATION  Торможение ----------
// учесть:
// задержку Acc_X_est
// давление от стяжных пружин тормоза
// нелинейную характеристику момента от давления тормоза
// EBL.Kbr = __EBL_Ko - __EBL_Kp1 * P
//#define   __Load_Pprug   0x0500 //0.25atm

//#define __Load_ThrPon    0x2000 //1,65atm
#define __Load_ThrPoff   0x1000 //0,8atm
#define __Brake_AxThr    0x0600  // 0,75m/c^2
#define __Brake_VxThrOn  0x2000	 // 32km/h
#define __Brake_VxThrOff 0x0800	 // 8km/h
#define __LoadBrake_OssT 200	 // 1c

    // давление передней оси без стяжных пружин
	int32_t Ps = (uint32_t)Wheel_FL.Press +
				 (uint32_t)Wheel_FR.Press -
				 (uint32_t)Wheel_FL.P_Full * 2;
    if(Ps < 0)
       Ps = 0;
    // приведение к Chamber_Tip
    Ps = Ps * (uint16_t)Brake.Front.CFG.Chamber_Tip /
              (uint16_t)Brake.Rear.CFG.Chamber_Tip;
    // давление задней оси
	Ps += ((uint32_t)Wheel_RL.Press +
		   (uint32_t)Wheel_RR.Press -
           (uint32_t)Wheel_RL.P_Full * 2) *
		  Load.CFG.Truck.Num_RearAxis;
    if(Ps < 0)
       Ps = 0;

	// фильтруем обшее давление в тормозах
	Filter_Press.Xn = Ps / 2 / (1 + Load.CFG.Truck.Num_RearAxis);
	FiltOut = Filter_Cheb(&Filter_Press, Koef_Filtr5Hz); // 1Hz
	uint16_t FP;// = 0;
	if(FiltOut  < __uintYnMinus)
		 FP = FiltOut;
	else FP = 0;
	Load.Brake.FP = FP;
    // задержка
	Load.Brake.P = Delay(DelayBuf_Press,FP,Load.CFG.Delay_Press);

    // сила торможения ретардера
#define __KTF_RET 256 // Koef.Torque Force
    if(Retarder.D_10h.Torque < 0x7D)
         Load.Brake.F_TorqRET = (0x7D-Retarder.D_10h.Torque) * 256 *
	                            (uint32_t)Load.CFG.K_RET;
    else Load.Brake.F_TorqRET = 0;

	// тормозная сила
    // удваиваем обшее давление
    Load.Brake.F_Brake = Load.Brake.P * 2 * (uint32_t)Load.CFG.K_Pr;
    Load.Brake.Force = Load.Brake.F_Brake;
    // учет торможения ретардером для автобусов
    if(DBR_Load_Brake)            // CFG
    Load.Brake.Force += Load.Brake.F_TorqRET;

    // Текущее ускорение
    Load.Brake.Ax = Base.AccX;    // Продольное ускорение без ограничения
    if(!Bad_AccX &&
       Load.Brake.Ax < Acc_X_est) // Acc_X_est больше
       Load.Brake.Ax = Acc_X_est;

    // условия запуска расчета
	if(Brake.DemandValue > Load.CFG.P_Start && // давление больше 1,65atm
	   Speed_VX_est > __Brake_VxThrOn &&      // скорость больше 32km/h
	   Load.Brake.Ax < -__Brake_AxThr)       // ускорение больше 0,75m/c^2
	  Brake_M_Pro = 1;  // запуск

	if(Brake.DemandValue < (Load.CFG.P_Start /2) ||
	   Speed_VX_est < __Brake_VxThrOff)
	  Brake_M_Pro = 0; // остановка

    // ----------------Первый способ Торможение ----------------
	if(Brake_M_Pro &&
	   Load.Brake.Ax < -__Brake_AxThr)
	{
	  Load.Brake.M = Load.Brake.Force /
			         (-Load.Brake.Ax);
	  if(Load.Brake.M < Load.MassEst_Max &&
		 Load.Brake.M > Load.MassEst_Min &&
		 Load.Brake.T1 < 0x3000)
	  { // среднее значение
        Load.Brake.T1++;
        Load.Brake.SumM1 += Load.Brake.M;
    	Load.Brake.M1 = Load.Brake.SumM1 / Load.Brake.T1;
    	if(Load.Brake.T1 > __Load_Time_Min)
    		Brake_M1_Cmpl = 1;
	  }
    }
    // ----------------Второй способ Торможение -----------------
    if(!Load.Brake.Vx_Start)
	{ // ожидаем торможения
	  if(Brake_M_Pro)
	  { //NU
		Load.Brake.Vx_Start = Speed_VX_est;
		Load.Brake.SumP = 0;
	    Load.Brake.Time = 0;
	  }
	}
    else
	{ Load.Brake.Time++;
	  Load.Brake.SumP += Load.Brake.FP; // без задержки
	  if(!Brake_M_Pro)
	  { if(Load.Brake.Time > __Load_Time_Min)
		{ // end Ok
		  Load.Brake.Acc = ((uint32_t)Load.Brake.Vx_Start -
				            (uint32_t)Speed_VX_est) *__Load_Dec_Koef /
				             Load.Brake.Time;
		  Load.Brake.Press = Load.Brake.SumP /
				             Load.Brake.Time;
		  Load.Brake.M2 = (Load.Brake.Press * 2 *
				           (uint32_t)Load.CFG.K_Pr) /
					       Load.Brake.Acc;
		  // ограничение
		  if(Load.Brake.M2 > Load.MassEst_Max)
			 Load.Brake.M2 = Load.MassEst_Max;
		  if(Load.Brake.M2 < Load.MassEst_Min)
			 Load.Brake.M2 = Load.MassEst_Min;
		  // среднее значение замеров
		  Load.Brake.Num++;
		  Load.Brake.SumM2 += Load.Brake.M2;
		  Load.Brake.Ms = Load.Brake.SumM2 /
					      Load.Brake.Num;
		  //
		  Load.Brake.Vx_Start = 0;
		  Load.Brake.Time =__LoadBrake_OssT;

		 // New буфер
		 if(Load.Brake.Num2 < (sizeof(Load.Brake.BufM2 -1)))
			Load.Brake.Num2++;
		 Load.Brake.BufM2[Load.Brake.Num2-1] = Load.Brake.M2;
uint32_t    SumBufM2 = 0;
         for (uint8_t i = 0; i < Load.Brake.Num2; i++)
          	SumBufM2 += Load.Brake.BufM2[i];
         Load.Brake.Ms2 = SumBufM2 / Load.Brake.Num2;

		  // Mediana
		  Load.Brake.Mm = Mediana(Load.Brake.BufM, 6, Load.Brake.M2);
		}
		else //  end not Ok
		Load.Brake.Vx_Start = 0;
	  }
	}
    // флаг осциллографа
    if(Brake_M_Pro)
    	   Brake_M_Oss = 1;
    else
    {
      if(Load.Brake.Time)
    	 Load.Brake.Time--;
      else Brake_M_Oss = 0;
    }
    // результат эстимации торможение
    if(Load_Break_Metod2 && // приоритет Metod2
		Load.Brake.Ms) // есть среднее значение
    { if(!Mediana_Enable)
      {	if(!Load_Brake_Buf)
    	   Load.Brake.Mass = Load.Brake.Ms; // усредненная Второй способ
        else Load.Brake.Mass = Load.Brake.Ms2;
      }
      else Load.Brake.Mass = Load.Brake.Mm;
    }
    else
    { if(Brake_M1_Cmpl)
    	Load.Brake.Mass = Load.Brake.M1;
    }
    //----------------------------------------

// ----------Определение загрузки через ECAS-------------------------
// подвеска дает подрессоренную массу
// нужно учесть вес моста __Rear_Susp_Mass  1449 //1385 //кг
	if(ECAS.ASC4.BellowPress &&
	   Air_Suspension)
	{ // нагрузка на заднюю ось
	  Load.Truck.Rear_Fz =((uint32_t)ECAS.CFG.Susp_Mass +
                           (uint32_t)ECAS.CFG.Kmp *
						   (uint32_t)ECAS.ASC4.BellowPress /64) *
                		              Load.CFG.Truck.Num_RearAxis;
      // масса груза на задней оси
	  ECAS.Load_Rear = (uint32_t)Load.Truck.Rear_Fz -
    		           (uint32_t)Load.CFG.Truck.Empty_Axis_Rear;
      // масса на сцепном устройстве
      if(ECAS.Load_Rear > 0)
           Load.Truck.Hitch_Fz = ECAS.Load_Rear * (uint32_t)DSC_Car_Base /
		                               (uint32_t)Load.CFG.Truck.Hitch_A;
      else Load.Truck.Hitch_Fz = 0;
      Load.Truck.Mass_ECAS =  Load.Truck.Hitch_Fz +
    		                  Load.Truck.EmptyMass;
	}
	else
	{
	  Load.Truck.Mass_ECAS = 0;
	  // определение нагрузок через ESTIMATION Load.Mass
/*	  if(Load.Truck.Mass_est > Load.Truck.EmptyMass)
		   Load.Truck.Hitch_Fz = Load.Truck.Mass_est - Load.Truck.EmptyMass;
	  else Load.Truck.Hitch_Fz = 0;
      // нагрузка на заднюю ось
	  Load.Truck.Rear_Fz = Load.CFG.Truck.Empty_Axis_Rear + Load.Truck.Hitch_Fz *
                        ((uint32_t)Load.CFG.Truck.Hitch_A) / (uint32_t)DSC_Car_Base;
                        */
	}
    //----------------------------------------

    // результат эстимации приоритет торможение
	if(Load.Brake.Mass && !Brake_M_Fail)
	     Load.Truck.Mass_est = Load.Brake.Mass;
	else
	{ if(Load.Engine.Mass)
		   Load.Truck.Mass_est = Load.Engine.Mass;
	  else Load.Truck.Mass_est = Load.Truck.LadenMass;
	}
    // NEW приоритет Mass_ECAS
	if(Load.Truck.Mass_ECAS)
           Load.Truck.Mass_est = Load.Truck.Mass_ECAS;
// --------------- end est ----------------------------------------

// снаряженная масса тягача
	Load.Truck.EmptyMass = Load.CFG.Truck.Empty_Axis_Front +
			               Load.CFG.Truck.Empty_Axis_Rear;
// масса груженого тягача
	Load.Truck.LadenMass = Load.Truck.EmptyMass +
                           Load.CFG.Truck.Hitch_MaxLoad;
// Определение центрa масс А 1,208m
	Load.Truck.CG_A = ((uint32_t)DSC_Car_Base *
			           (int32_t)Load.CFG.Truck.Empty_Axis_Rear) /
			          (uint32_t)Load.Truck.EmptyMass;

    // нагрузка на переднюю ось
    Load.Truck.Front_Fz = Load.CFG.Truck.Empty_Axis_Front + Load.Truck.Hitch_Fz *
  		                  ((uint32_t)DSC_Car_Base - (uint32_t)Load.CFG.Truck.Hitch_A) /
						   (uint32_t)DSC_Car_Base;

    // нагрузка на заднюю ось
    Load.Truck.Rear_Fz = Load.CFG.Truck.Empty_Axis_Rear + Load.Truck.Hitch_Fz *
                      ((uint32_t)Load.CFG.Truck.Hitch_A) / (uint32_t)DSC_Car_Base;

    // нагрузка на колеса
    Wheel_FL.Fz = (uint32_t)__LoadEmpty_Koef * Load.Truck.Front_Fz /
    		      Load.CFG.Truck.Empty_Axis_Front;
    if(Wheel_FL.Fz < __LoadEmpty_Koef)
       Wheel_FL.Fz = __LoadEmpty_Koef;
    Wheel_FR.Fz = Wheel_FL.Fz;

    Wheel_RL.Fz = (uint32_t)__LoadEmpty_Koef * Load.Truck.Rear_Fz /
		           Load.CFG.Truck.Empty_Axis_Rear;
    if(Wheel_RL.Fz < __LoadEmpty_Koef)
       Wheel_RL.Fz = __LoadEmpty_Koef;
    Wheel_RR.Fz = Wheel_RL.Fz;

//-------------------------------------------------------------------

// ---------- Определение загрузки через Trailer --------------------
	// снаряженная масса автопоезда
	Load.TrainEmptyMass = Load.Truck.EmptyMass;
	// масса тягача
	Load.TrainMass = Load.Truck.EmptyMass +   // снаряженная масса тягача
			         Load.Truck.Hitch_Fz;     // Hitch

	if(Load.Trailer.CFG.EmptyMass)
	{ //есть прицеп в конфигурации
	  Load.TrainEmptyMass += Load.Trailer.CFG.EmptyMass;
// определение массы прицепа через Hitch_Fz
// TA_Fz = (H_Fz + Fz0)*K4  K4=1,7
// решение уравнений (1610+Fz0)*K = 6290
//                   (10500+Fz0)*K = 21400
#define __TA_Fz0  2088
      Load.Trailer.Axis_Fz = (uint32_t)((Load.Truck.Hitch_Fz + __TA_Fz0) *
    		                             Load.Trailer.CFG.K4) /64;// /256;
	  // масса автопоезда
      int32_t Cargo;
      if(Trailer1.EBS22.AxleLoadSum <  0xFE00)
      {	 Load.TrainMass += Trailer1.EBS22.AxleLoadSum; // прицеп
         // для CANJ.VW
         Cargo = (int32_t)(Trailer1.EBS22.AxleLoadSum +
      	                   Load.Truck.Hitch_Fz);
      }
      else
      {  Load.TrainMass += Load.Trailer.Axis_Fz;
         // для CANJ.VW
         Cargo = (int32_t)(Load.Trailer.Axis_Fz +
    	                   Load.Truck.Hitch_Fz);
      }
      // масса прицепа
      Load.Trailer.Mass = Cargo;
      Cargo -= (int32_t)Load.Trailer.CFG.EmptyMass;
      if(Cargo < 0) Cargo = 0;
      // груз прицепа
      Load.Trailer.Cargo = Cargo;
	}
// ----------Определение коеффициента загрузки -------------------
	if(LoadKoef_Enable)
	{	 Load.Koef = Load.TrainMass * (int32_t)__LoadEmpty_Koef /
		             Load.TrainEmptyMass;
	if(Load.Koef < __LoadEmpty_Koef)
		 Load.Koef = __LoadEmpty_Koef;
	}
	else Load.Koef = __LoadEmpty_Koef;

	// связанные с Load.Koef
	Load.K = (uint32_t)Load.Koef - (uint32_t)__LoadEmpty_Koef;

// если Load.Mass < 24т машина снаряженная

    // веса размeрностью 10кг - бит
	Weght.Train = Load.TrainMass /10;
	Weght.Truck_Brake = Load.Brake.Mass /10;
	Weght.Truck_Engine = Load.Engine.Mass /10;
	Weght.Truck_Hitch = Load.Truck.Hitch_Fz /10;
	Weght.Truck_Rear = Load.Truck.Rear_Fz /10;
	Weght.Truck_Front = Load.Truck.Front_Fz /10;
	Weght.Truck_ECAS = Load.Truck.Mass_ECAS /10;
	Weght.Rear_Axis = Load.Truck.Rear_Fz /
			          Load.CFG.Truck.Num_RearAxis /10;
	if(Load.Trailer.Mass)
	{ Weght.Trailer = Load.Trailer.Mass /10;
	  Weght.Cargo = Load.Trailer.Cargo /10;
	}
	else
	{ Weght.Trailer = 0xFFFF;
	  Weght.Cargo = 0xFFFF;
	}
} // VehicleLoad()

void     Self_Tuning(void)
{
	// двигатель
	if(!Speed_VX_est)     // машина стоит
	{ if(CAN_Engine.Taxo) // двигатель заведен
	  { if(CAN_Engine.Taxo < (__Taxo_XX + 400))
	    { // момент ХХ в процентах
		  SelfTun.Engine.PTxx = CAN_Engine.Torque;
	    }
	    else
	    if(CAN_Engine.Taxo > __Taxo_P1 &&
	       CAN_Engine.Taxo < (__Taxo_P1 + 400) && //50rpm
		   SelfTun.Engine.PTxx &&
		   CAN_Engine.Torque > SelfTun.Engine.PTxx)
	    { // первая степень
#define __K_Loss_K1  1334	//  8*500(__Taxo_P1-__Taxo_P4)/3 = 1334
	      uint32_t K1 = (CAN_Engine.Torque - SelfTun.Engine.PTxx) *
	    	            (uint32_t)__K_Loss_K1 * Engine.K1_TL /
	    			    (CAN_Engine.Taxo - (uint32_t)__Taxo_P4);
	      if(K1 > 0xFF) K1 = 0xFF;
	  	  SelfTun.Engine.Loss_K1 = _B0_32(K1);
	    }
	    else
	    if(CAN_Engine.Taxo > __Taxo_P2 &&
	       CAN_Engine.Taxo < (__Taxo_P2 + 400) &&
		   SelfTun.Engine.PTxx &&
	//	   SelfTun.Engine.Loss_K1 &&
		   CAN_Engine.Torque > SelfTun.Engine.PTxx)
	    { // вторая степень
#define __K_Loss_K2  0x008B8249	//(__Taxo_P2-__Taxo_P4)=1150// 8*1000*8*1000/7 = 9142857
	       uint32_t dTaxo = (uint32_t)CAN_Engine.Taxo -
	    			        (uint32_t)__Taxo_P4;
	       uint32_t K2 = (CAN_Engine.Torque - SelfTun.Engine.PTxx -
	    			  //    dTaxo * SelfTun.Engine.Loss_K1 * 2 / 65536) *
	    			      dTaxo * Engine.K1_TL * 2 / 65536) *
	    	             (uint32_t)__K_Loss_K2 / dTaxo * Engine.K2_TL / dTaxo;
	       if(K2 > 0xFF) K2 = 0xFF;
	  	   SelfTun.Engine.Loss_K2 = _B0_32(K2);
	    }
	  }
	}

	// самонастройка  тормоза
#define __Mass_Thr 	2000
    if(Load.Brake.Mass)
	{ if( Load.Brake.Mass >
         (Load.Truck.LadenMass - __Mass_Thr))
    	SelfTun.Break.K_PsAx = (uint32_t)Load.Truck.LadenMass *
		                                 Load.CFG.K_Pr /
		                                 Load.Brake.Mass;
	  else
	  if( Load.Brake.Mass <
	     (Load.Truck.EmptyMass + __Mass_Thr))
	    SelfTun.Break.K_PsAx = (uint32_t)Load.Truck.EmptyMass *
		                                 Load.CFG.K_Pr /
			                             Load.Brake.Mass;
	  SelfTun.Break.K_Pb = SelfTun.Break.K_PsAx /64;
	}

	// самонастройка  Engine PeakTorq
    // снаряженная масса тягача
    if(Engine_M1_Cmpl && Load.Engine.M1)
	{ SelfTun.Engine.PeakTorque = (uint32_t)Load.Truck.EmptyMass * Engine.PeakTorq /
		                          Load.Engine.M1;
	}
} // end Self_Tuning()

void Speed_Filter(WheelTypeDef* WheelXX)
{
#define   __StartSp_Max 0x0800
	// for Period test
  if(!DSC_Emul_Fl)
  { if(WheelXX->Capture.CntZ)
	{  WheelXX->Capture.CntZ--;
       // начальная скорость
	   if( !WheelXX->Start ||
		    WheelXX->Capture.Speed <
		    WheelXX->Start)
	   {    WheelXX->Start = WheelXX->Capture.Speed;
		 if(WheelXX->Start > __StartSp_Max)
			WheelXX->Start = __StartSp_Max;
	   }
	}
	else // WheelXX->Capture.CntZ == 0
	{ // обнуление скорости если нет Capture
	  if(WheelXX->Capture.Cnt)
	  {	 WheelXX->Capture.Cnt = 0;
	     // начальная скорость при останове
	     if(WheelXX->Start > WheelXX->Capture.Speed &&
	    	WheelXX->Capture.Speed)
	        WheelXX->Start = WheelXX->Capture.Speed;
	     // обнуление скорости
	     WheelXX->Capture.Speed = 0;
	     // Sets the TIM Capture x input polarity FALLING
	     Set_Capture(WheelXX);

	     // установка флага Safe_Sp
// флаг Safe_Sp устанавливактся если сорость больше 11км/ч
// и ускорение больше -2м/c2 и нет ABS и нет Capture
#define __SafeSp_SpeedMin 0x0B00 	// 11km/h
//#define __SafeSp_АссMin   0x0400
	     if( WheelXX->Speed >__SafeSp_SpeedMin &&
	        !WheelXX->ABS.Active)  //
	     {	 WheelXX->State.Bits.b6 = 1;    //Safe_Sp
	         WheelXX->Test.SafeSp_Cnt++;
	     }
	  }
	}
  }
// ------------- обработка скорости --------------------------
	if(DSC_Emul_Fl)
	{ // режим эмуляции
	  WheelXX->Capture.Speed = WheelXX->SpeedI;
	  WheelXX->Speed = WheelXX->Capture.Speed;
	}
	else
	{ //
	  // экстаполяция скорости
	  if(SpeedExt_Enable &&				   // разрешено CFG
		 WheelXX->ABS.Phase == __ABS_Phase1 && // ABS в фазе 1
		 WheelXX->Speed < 0x1000 &&        // скорость < 11km/h
		 WheelXX->Accel < 0 &&             // замедляется
		 WheelXX->Capture.Speed &&         // есть скорость
		 WheelXX->Capture.Speed ==         // текущая скорость
		 WheelXX->Filt_Speed.Xn)           // равна предыдущей
	  {
#define   __SpeedExt_DecN    10  // 1G
#define   __SpeedExt_DecM    29  //	3G
int16_t dSp = __SpeedExt_DecN;
        if(SpeedExt_Accel)
        { dSp = -WheelXX->Accel /5;
          if(dSp > __SpeedExt_DecM)
      	     dSp = __SpeedExt_DecM;
          if(dSp < __SpeedExt_DecN)
        	 dSp = __SpeedExt_DecN;
        }
        if(WheelXX->Capture.Speed > dSp)
           WheelXX->Capture.Speed -= dSp;
        else WheelXX->Capture.Speed = 0;
	  }
	  // фильтрация скорости
//	  WheelXX->Filt_Speed.Xn = WheelXX->Capture.Speed;
	  WheelXX->Filt_Speed.Xn = (WheelXX->Capture.Speed * WheelXX->Tire_Koef) / 65536;
uint16_t Fout = Filter_Cheb(&WheelXX->Filt_Speed, Koef_Filt1_14Hz);
	  if(Fout < __uintYnMinus)
		   WheelXX->Speed = Fout;
	  else WheelXX->Speed = 0;
	}

// --------------- находим ускорение ----------------------------
// размерность ускорения колеса 1м/c^2 - 5lsb
#define   __Accel_Lim   0x7000 // 585G
#define   __Acc_T         6    // за 5мс
//  размерность	1м/c^2 -3,6*256/1000*5 = 4,608lsb
// коеф. приведения размерности к 1м/c^2 - 5lsb
// 5/4,608*256  1000/3,6
#define   __Accel_Norm  0x000115C7  // 71111
	int32_t Acc;
	WheelXX->Buff_Accel[0] = WheelXX->Capture.Speed;
    if(!WheelXX->Capture.Cnt &&
       !DSC_Emul_Fl)
    	 Acc = 0;
    else Acc = DeriVative(WheelXX->Buff_Accel, __Acc_T);
	// ограничение
	if(Acc > __Accel_Lim)  Acc = __Accel_Lim;
	if(Acc < -__Accel_Lim) Acc = -__Accel_Lim;
    // приведение к размерности
	WheelXX->Acc_InF = Acc * __Accel_Norm /65536;
	// фильтрация
	WheelXX->Filt_Accel.Xn = WheelXX->Acc_InF;
	WheelXX->Accel = Filter_Cheb(&WheelXX->Filt_Accel, Koef_Filt1_14Hz);

// ---------------- находим проскальзывания колес -----------------------
//размерность 1% - 1msb
//#define   __100_percent   0x6400
	int32_t dS = (uint32_t)WheelXX->Ref -
			     (uint32_t)WheelXX->Speed;
	if(dS < 0)
	   dS = 0;
	if(WheelXX->Ref)
	   WheelXX->Slip = (dS *__100_percent) / WheelXX->Ref;

// ---------------- находим пробег колеса -----------------------------
// full rotation of the wheel 100m
// Radius - диаметр в сантиметрах
//__FRW_100m = 100*100/Pi
#define   __FRW_100m   3183
    // количество оборотов колеса на пробеге 100м
	WheelXX->Way.FRW_100m = (uint32_t)__FRW_100m / WheelXX->CFG.Radius-1;

	if(WheelXX->Way.Cnt_FRW > WheelXX->Way.FRW_100m)
	{  WheelXX->Way.Cnt_FRW =0;
	   WheelXX->Way.Distance++;
	}
	// установка значения пробега из EPROM при включении
	if(NU_RunaWay_Fl &&
	  !WheelXX->Way.NU_Cmpl)
	{ NU_RunaWay_Fl = 0;
	  if(!WheelXX->Way.NU_Cmpl)
	  {   WheelXX->Way.NU_Cmpl = 1;
	      WheelXX->Way.Distance = Vehicle.RunaWay;
	  }
	}
	// диагностическая установка пробега
	if(WheelXX->Way.Dia)
	{  WheelXX->Way.Dia = 0;
	   WheelXX->Way.Distance = Vehicle.RunaWay;
	}
} // end

//-----------------------------------------------------------------
#define   __Koef_VxMin       0x0F00	// 15km/h
#define   __Koef_VxMax       0x5000	// 80km/h
#define   __Koef_Time        1000   // 5c
#define   __deltaKoefThr     0x00A4U  //0,5%
#define   __DerivativeAccThr  0x0900 // 1,125m/c^2
#define   __DerivativeDecThr  0x0400 // 0,5m/c^2
#define   __SpeedKoef_Max    42598 //0x9332U  //+15%
#define   __SpeedKoef_Min    24576 //0x6CCBU  //-15%

uint8_t     Koef_TCO(TypeDef_KOEF* Axis)
{
	uint8_t  Cplt = 0;

	if(Axis->Cnt < __Koef_Time)
    {  Axis->Cnt++;
       Axis->Sum1 += (uint32_t)Axis->VX;  // средняя задняя скорость
       Axis->Sum2 += (uint32_t)Speed_VX_TCO; // скорость с тахогрофа
    }
    else
    { Axis->Koef = ((Axis->Sum2 /__Koef_Time) * __Koef_Default) /
	                (Axis->Sum1 /__Koef_Time);
	  if(Axis->Koef < (Axis->Koef_Last +__deltaKoefThr) &&
		 Axis->Koef > (Axis->Koef_Last -__deltaKoefThr))
		  Cplt = 1; // заверщено
	  Axis->Koef_Last = Axis->Koef;
	  Axis->Sum1 = 0;
	  Axis->Sum2 = 0;
	  Axis->Cnt = 0;
    }
	return Cplt;
}

void   KoefSpeed(void)
{
	// выход фильтра используется для обнуления отрицательных uint16_t
	uint16_t FiltOut;

// Определяем опорную скорость для нахождения коефф.
    if(Find_TCO1 &&
       !Tout_TCO1 &&
       !TCO_CAN_Fail &&
	   !TCO_Speed_Fail)
    	 TCO.RefVX = TCO.Speed;
    else
    if(Find_CCVS &&
       !Tout_CCVS &&
	   CCVS.Speed)
    	 TCO.RefVX = CCVS.Speed;
    else
    // нет TCO.RefVX и TCO.RefVX
    // берем TCO.Rear.VX чтобы получить расчет
    	TCO.RefVX = TCO.Rear.VX;

// фильтруем Speed_VX_TCO
	Filter_VX_TCO.Xn = (int32_t)TCO.RefVX;
// ограничиваем входную величину фильтра 208msb
	if(Filter_VX_TCO.Xn > __uintXnMax)
	   Filter_VX_TCO.Xn = __uintXnMax;
	FiltOut = Filter_Cheb(&Filter_VX_TCO, Koef_Filtr5Hz);//2Hz
// отрицательные значения обнуляем
	if(FiltOut < __uintYnMinus) Speed_VX_TCO = FiltOut;
	                       else Speed_VX_TCO = 0;

// находим коэффициенты скоростей колес
// условия нет поворота, нет торможения и разгона
// ? с разгоном при пробуксовке !!!!!!!!!!!!!laga!!!!!!!!!!!!!!!!!!

//------------------------Front Koef--------------------------
#ifdef   __AxisF_Compile
// фильтруем Front Speed
	Filter_FrontVX.Xn = Speed_Axis(Wheel_FL.Capture.Speed,
                                   Wheel_FR.Capture.Speed);
// ограничиваем входную величину фильтра 208msb
	if(Filter_FrontVX.Xn > __uintXnMax)
	   Filter_FrontVX.Xn = __uintXnMax;
	FiltOut = Filter_Cheb(&Filter_FrontVX, Koef_Filtr5Hz);//2Hz
// отрицательные значения обнуляем
	if(FiltOut < __uintYnMinus)
		 TCO.Front.VX = FiltOut;
	else TCO.Front.VX = 0;

	//  находим коэффициент Front
	if(Speed_VX_TCO > __Koef_VxMin &&  // скорость больше 15 km/h
	   Speed_VX_TCO < __Koef_VxMax &&  // max	80km/h
//	   !Control_Active &&
	   TCO.Front.VX > __Koef_VxMin &&
	   TCO.Front.VX < __Koef_VxMax  &&
	   Acc_X_est < __DerivativeAccThr && // 1,125m/c^2
	   Acc_X_est > -__DerivativeDecThr)  // 0,5m/c^2
	{
	  if(Koef_TCO(&TCO.Front))
	  {	 KoefFront_Cplt = 1;
	     TireFront_Cplt = 1; // для диагностики
	  }
	}

// проверка границ коэффициентa TCO
	if(TCO.Front.Koef > __SpeedKoef_Max)
	{  TCO.Front.Koef = __SpeedKoef_Max;
	     BadKTCO = 1; }
	else
	if(TCO.Front.Koef < __SpeedKoef_Min)
	{  TCO.Front.Koef = __SpeedKoef_Min;
	     BadKTCO = 1; }
	else BadKTCO = 0;
#else
//-------------------------Rear Koef--------------------------
// фильтруем Rear Speed
	Filter_RearVX.Xn = Speed_Axis(Wheel_RL.Capture.Speed,
			                      Wheel_RR.Capture.Speed);
// ограничиваем входную величину фильтра 208msb
	if(Filter_RearVX.Xn > __uintXnMax)
	   Filter_RearVX.Xn = __uintXnMax;
	FiltOut = Filter_Cheb(&Filter_RearVX, Koef_Filtr5Hz);//2Hz
// отрицательные значения обнуляем
	if(FiltOut < __uintYnMinus)
		 TCO.Rear.VX = FiltOut;
	else TCO.Rear.VX = 0;

	// находим коэффициент Rear
	if(Speed_VX_TCO > __Koef_VxMin &&  // скорость больше 15 km/h
	   Speed_VX_TCO < __Koef_VxMax &&  // max	80km/h
//	   !Control_Active &&
	   TCO.Rear.VX > __Koef_VxMin &&
	   TCO.Rear.VX < __Koef_VxMax)
	{
	  if(Koef_TCO(&TCO.Rear))
	  {	 KoefRear_Cplt = 1;
	     TireRear_Cplt = 1; // для диагностики
	  }
	}
// проверка границ коэффициентa TCO
	if(TCO.Rear.Koef > __SpeedKoef_Max)
	{  TCO.Rear.Koef = __SpeedKoef_Max;
	     BadKTCO = 1; }
	else
	if(TCO.Rear.Koef < __SpeedKoef_Min)
	{  TCO.Rear.Koef = __SpeedKoef_Min;
	     BadKTCO = 1; }
	else BadKTCO = 0;

//-----------------------------------------------------------------
	// ошибки скорости TCO

	// MAZ 5450 01
	// 1случай - отсутствиe скорости
	// 2случай - не изменяются показания скорости
	// 3случай - скорость превышает реальную в разы

#define	  __TCO_KOEF_Max   0xBF86  // 49030
#define	  __TCO_KOEF_Min   0x551F  //21791
#define   __TCO_FailTime   200     // 1c

	if(TCO_Install) // CFG тахограф TCO установлен
	{
	  // соотношение скоростей RearAxel и TCO
	  if(CANJ.TCO1.Speed > __Koef_VxMin)
		TCO.KOEF = Speed_RearAxel *__Koef_Default / CANJ.TCO1.Speed;
	  else TCO.KOEF = 0;
	  //
	  if((Speed_RearAxel > __Koef_VxMin && // едет ?
		  Find_TCO1 && !Tout_TCO1 &&  // определился в CAN и нет Tout
		  TCO.Speed < __Error16 &&   // достоверный диапазон TCO.Speed
		  !TCO.Speed) ||            // отсутствиe скорости TCO
		 (CANJ.TCO1.Speed &&  // не изменяются показания скорости TCO
		  CANJ.TCO1.Speed == CANJ.TCO1.Speed_Last) ||
		 ( TCO.KOEF &&
		  (TCO.KOEF >__TCO_KOEF_Max	|| // соотношение скоростей
		   TCO.KOEF <__TCO_KOEF_Min))) // превышает 1,5
	  {
		if(TCO.FailCnt < __TCO_FailTime)
		   TCO.FailCnt++;
	    else TCO_Speed_Fail = 1;
	  }
      else
	  { if(TCO.FailCnt)
		   TCO.FailCnt--;
	    else TCO_Speed_Fail = 0;
	  }
	}
//-----------------------------------------------------------
#endif
	// флаг разрешения учета Tire_Koef в скорости
	if(Tire_Koef_Enable && // разрешено в конфигурации
	   KoefFront_Cplt &&  // определены оба TCO.Front.Koef
	   KoefRear_Cplt)    //  и TCO.Rear.Koef
		 KoefSpeed_Enable = 1;
	else KoefSpeed_Enable = 0;

} // end KoefSpeed(&Wheel_XX)

void     DIA_Default_Oss(void)
{// вызывается в DIA_Oss() MySystem.c
	// постоянно выводимые переменные
	// скорости
	UartDIA.Tx_data[0] = Wheel_FL.Speed / 64;
    UartDIA.Tx_data[3] = Wheel_FR.Speed / 64;
    UartDIA.Tx_data[6] = Wheel_RL.Speed / 64;
    UartDIA.Tx_data[9] = Wheel_RR.Speed / 64;
    // 2 строка
    UartDIA.Tx_data[1] = Steering_Angle/16;//
    UartDIA.Tx_data[4] = EngineTorque.Value+__OffSet8;//0x7D;//
    //последняя позиция
    UartDIA.Tx_data[10]= _Hi_16(Brake.DemandValue);
	// изменяемые переменные  RoadTest_VAR();
    // изменяемые переменные 2 строка
//    UartDIA.Tx_data[7] =
    // изменяемые переменные 3 строка
//    UartDIA.Tx_data[2] =
//    UartDIA.Tx_data[5] =
//    UartDIA.Tx_data[8] =
//    UartDIA.Tx_data[11] =
    //ESP       4 строка
    UartDIA.Tx_data[12] = _OssW(OmegaZ_Des);
    UartDIA.Tx_data[13] = _OssW(Omega_Z_est);
    UartDIA.Tx_data[14] = _OssA(Acc_X_est);
    UartDIA.Tx_data[15] = _OssA(Acc_Y_est);
    // давления 5 строка
    UartDIA.Tx_data[16] = _Hi_16(Wheel_FL.Press);
    UartDIA.Tx_data[17] = _Hi_16(Wheel_FR.Press);
    UartDIA.Tx_data[18] = _Hi_16(Wheel_RL.Press);
    UartDIA.Tx_data[19] = _Hi_16(Wheel_RR.Press);
    RoadTest_VAR();
    // изменяемые переменные 6 строка
    if(Psens_install) // измерительные датчики давления
    { UartDIA.Tx_data[20] = _Hi_16(Press_Sen1);
      UartDIA.Tx_data[21] = _Hi_16(Press_Sen2);
      UartDIA.Tx_data[22] = _Hi_16(Press_Sen3);
      UartDIA.Tx_data[23] = _Hi_16(Press_Sen4);
    }
} // end DIA_Default_Oss()

void     RoadTest_VAR(void)
{
	// изменяемые переменные
	switch (DIA.Oss.Road) //
	{  case 0: //  отладка активации режимов
		   /*
#define     RetarderActive   _DSC_Flags.Bits.b0
#define     DYC_Active       _DSC_Flags.Bits.b1
#define     ROP_Active       _DSC_Flags.Bits.b2
#define     DYC_BrakeActive  _DSC_Flags.Bits.b3
#define     ROP_BrakeActive  _DSC_Flags.Bits.b4
#define     DYC_EngineActive _DSC_Flags.Bits.b5
#define     ROP_EngineActive _DSC_Flags.Bits.b6
#define     ABS_Active	     _DSC_Flags.Bits.b7
*/
		    UartDIA.Tx_data[7] = DSC_Flags;
/*
#define     VDC_Lamp_MC1     _Front_Flags.Bits.b0
#define     DSC_Front_Break  _Front_Flags.Bits.b1
#define     DSC_Disable      _Front_Flags.Bits.b2
#define     DYC_Front_Break  _Front_Flags.Bits.b3
#define     ROP_Front_Break  _Front_Flags.Bits.b4
#define     NU_RunaWay_Fl    _Front_Flags.Bits.b5
#define     DSC_Emul_Fl      _Front_Flags.Bits.b6
#define    ABS_Front_Active  _Front_Flags.Bits.b7
*/
		    UartDIA.Tx_data[2] = Front_Flags;
/*
#define     VDC_Lamp_MC2     _Rear_Flags.Bits.b0
#define     DSC_Rear_Break   _Rear_Flags.Bits.b1
#define     Trailer_Break    _Rear_Flags.Bits.b2
#define     DYC_Rear_Break   _Rear_Flags.Bits.b3
#define     ROP_Rear_Break   _Rear_Flags.Bits.b4
#define     ASR_Brake_Active _Rear_Flags.Bits.b5
#define     ASR_EngineActive _Rear_Flags.Bits.b6
#define    ABS_Rear_Active   _Rear_Flags.Bits.b7
*/
		    UartDIA.Tx_data[5] = Rear_Flags;
/*
#define     Truck_VDC_Active _DSC_Flags4.Bits.b0 // флаг  Truck_VDC активно
												 // не менять управляет лампой VDC
#define     Control_Active   _DSC_Flags4.Bits.b1 // флаг  Control_Active любое регулирование активно
#define     EBL_Active       _DSC_Flags4.Bits.b2
#define    XBR_System_Active _DSC_Flags4.Bits.b3
#define     HillHolder_Active _DSC_Flags4.Bits.b4
#define     HaltBrake_Active _DSC_Flags4.Bits.b5
#define     Emergency_Brake  _DSC_Flags4.Bits.b6
#define   Brake_Asist_Active _DSC_Flags4.Bits.b7
*/
		    UartDIA.Tx_data[8] = DSC_Flags4;
/*
#define    Torque_Lim           _TorqueMode.Bits.b0
#define    Torque_Drag          _TorqueMode.Bits.b1
#define    Retarder_Brake       _TorqueMode.Bits.b2
#define    Retarder_Off         _TorqueMode.Bits.b3
#define    EngineLim_Request    _TorqueMode.Bits.b4
#define    EngineDrag_Request   _TorqueMode.Bits.b5

#define  EngineTrailer_Request  _TorqueMode.Bits.b7
*/
		    UartDIA.Tx_data[11] = TorqueMode;
		  break;
	   case 1: // отладка ROP
		    // изменяемые переменные 2 строка
		    UartDIA.Tx_data[7] = Speed_VX_est/64;//Trailer.Press;
		    // изменяемые переменные 3 строка
		    UartDIA.Tx_data[2] = _Hi_16(ROP.Turn.Radius);
		    UartDIA.Tx_data[5] = _OssV(ROP.Brake.VxEnd);
		    UartDIA.Tx_data[8] = Graph.ROPonAccY;
		    UartDIA.Tx_data[11] =_OssA(ROP.AccY_OzD);
		    // переменные 6 строка
		    UartDIA.Tx_data[20] = CAN_Engine.TaxoN;//_Hi_16(Turn_Radius_MC2);
		    UartDIA.Tx_data[21] = ROP.BrakeF.Phase;
		    UartDIA.Tx_data[22] = ROP.BrakeR.Phase;
		    UartDIA.Tx_data[23] = ROP_Flags;//_OssA(ROP_AccY_OzD_MC2);
		    break;
	   case 2: //  отладка DYC
		    UartDIA.Tx_data[7]  = TorqueMode;
		    // переменные 3 строка
		    UartDIA.Tx_data[2]  = EngineTorque.Phase;
		    UartDIA.Tx_data[5] = DSC_Flags_MC2;//Derivative_OmegaZ;
		    UartDIA.Tx_data[8] = _Hi_16(DYC.UnSt.PDOut);//_Hi_16(DYC.PD_Dif);
		    UartDIA.Tx_data[11] = _OssW(OmegaZ_Des_MC2);
		    // переменные 6 строка
			UartDIA.Tx_data[20] = DYC_Situation;
		    UartDIA.Tx_data[21] = Graph.RoadWz;
		    UartDIA.Tx_data[22] = _Hi_16(DYC.OvSt.PDOut);
		    UartDIA.Tx_data[23] = _OssU(Sa_Rear);
			break;
	   case 3: // отладка ABS 4Ch
		    UartDIA.Tx_data[7]  = Speed_VX_est/64;//
		    // переменные 3 строка
		    UartDIA.Tx_data[2] = Wheel_FL.ABS.Phase;
		    UartDIA.Tx_data[5] = Wheel_FR.ABS.Phase;
		    UartDIA.Tx_data[8]  = Wheel_RL.ABS.Phase;
		    UartDIA.Tx_data[11] = Wheel_RR.ABS.Phase;
		    // переменные 6 строка
		    UartDIA.Tx_data[20] = Wheel_FL.Ref/64;//Wheel_FL.ABS.Base/64;
		    UartDIA.Tx_data[21] = Wheel_FR.Ref/64;//Wheel_FR.ABS.Base/64;
		    UartDIA.Tx_data[22] = Wheel_RL.Ref/64;//Wheel_RL.ABS.Base/64;
		    UartDIA.Tx_data[23] = Wheel_RR.Ref/64;//Wheel_RR.ABS.Base/64;
		    break;
	   case 4: // отладка ASR
		    UartDIA.Tx_data[7] = ASR_Flags;//
		    // переменные 3 строка
		    UartDIA.Tx_data[2] = ASR.Engine.Ref/64;
		    UartDIA.Tx_data[5] = ASR.RearSpeed/64;
			if(ASR_Engine_Taxo)  // разрешено в CFG
		    { // регулирование оборотов
			  UartDIA.Tx_data[8] = ASR.Engine.KTS /__KTS_Oss;
		      UartDIA.Tx_data[11]= ASR.Engine.Taxo /80;//CAN_Engine.TaxoN;
		    }
		    else
		    { // регулирование момента
		      UartDIA.Tx_data[8] = ASR.Engine.Torque;
		      UartDIA.Tx_data[11]= ASR.Engine.PID/256;
			}
			// переменные 6 строка
			UartDIA.Tx_data[20] = _Hi_16(Press_Sen3);//
		    UartDIA.Tx_data[21] = _Hi_16(Press_Sen4);//
		    UartDIA.Tx_data[22] = ASR.Engine.Torq_EM1+125;
		    UartDIA.Tx_data[23] = ASR.Engine.Torq_EM2+125;
		    break;
	   case 5: // отладка Ref
		    UartDIA.Tx_data[7] = Speed_VX_est/64;//
		    // переменные 3 строка
		    UartDIA.Tx_data[2] = Wheel_FL.ABS.Base/64;//SpeedVX_RearAxel/64;
		    UartDIA.Tx_data[5] = Wheel_FR.ABS.Base/64;//Wheel_FL.ABS.Base/64;
		    UartDIA.Tx_data[8] = Wheel_RL.ABS.Base/64;//ABS.Base.Min/64;
		    UartDIA.Tx_data[11]= Wheel_RR.ABS.Base/64;//Wheel_RL.ABS.Base/64;
			// переменные 6 строка
			UartDIA.Tx_data[20] = Wheel_FL.Ref/64;
		    UartDIA.Tx_data[21] = Wheel_FR.Ref/64;
		    UartDIA.Tx_data[22] = Wheel_RL.Ref/64;
		    UartDIA.Tx_data[23] = Wheel_RR.Ref/64;
		    break;
	   case 6: // отладка Validity
		    UartDIA.Tx_data[7] = Validity_Flags2;
		    // переменные 3 строка
		    UartDIA.Tx_data[2] = _OssW(Omega_Z_est); //
		    UartDIA.Tx_data[5] = _OssW(OmegaZ_Vf); //
		    UartDIA.Tx_data[8] = _OssW(OmegaZ_AccY);
		    UartDIA.Tx_data[11]= _OssW(OmegaZ_Ref);
			// переменные 6 строка
			UartDIA.Tx_data[20] = Validity_Flags;
		    UartDIA.Tx_data[21] = Validity_Flags2;
		    UartDIA.Tx_data[22] = AyValid.Bad.Byte;//Wheel_RL.Ref/64;
		    UartDIA.Tx_data[23] = AxValid.Bad.Byte;//Wheel_RR.Ref/64;
		    break;
	   case 7: // отладка Trailer
		    UartDIA.Tx_data[7] = TrailerStatus;//
		    // переменные 3 строка
		    UartDIA.Tx_data[2] = TrailerFind;
		    UartDIA.Tx_data[5] = Trailer1.EBS21_Status1; //
		    UartDIA.Tx_data[8] = Trailer1.EBS22_Status1;
		    UartDIA.Tx_data[11]= Trailer1.EBS22_Status3;
			// переменные 6 строка
			UartDIA.Tx_data[20] = Wheel_FL.Ref/64;
		    UartDIA.Tx_data[21] = Wheel_FR.Ref/64;
		    UartDIA.Tx_data[22] = Wheel_RL.Ref/64;
		    UartDIA.Tx_data[23] = Wheel_RR.Ref/64;
		    break;
	   case 8: // отладка XBR
		    UartDIA.Tx_data[7] = XBR_Flags;
		    // переменные 3 строка
		    UartDIA.Tx_data[2] = _Hi_16(XBR.Brake.Front.Pdes);//_Hi_16(XBR.Brake.PdesF);
		    UartDIA.Tx_data[5] = EBC5_Status2; // DSC_Flags4;
		    UartDIA.Tx_data[8] = XBR_Mode; //XBR.AccPress
		    UartDIA.Tx_data[11]= XBR.Brake.Front.Phase;//_Hi_16(XBR.REG.Pin);
			// переменные 6 строка
			UartDIA.Tx_data[20] = _OssA(XBR.AccDes);
		    UartDIA.Tx_data[21] = XBR.Urgency;
		    UartDIA.Tx_data[22] = _Hi_16(XBR.Brake.REG_RR.Pdes);
		    UartDIA.Tx_data[23] = XBR.Brake.Rear.Phase;
		    break;
	   case 9: // отладка ABS TAI
		    UartDIA.Tx_data[7] = Speed_VX_est/64;//
		    // переменные 3 строка
		    UartDIA.Tx_data[2] = Wheel_FL.State.Byte;
		    UartDIA.Tx_data[5] = Wheel_RL.ABS.Phase;
		    UartDIA.Tx_data[8] = Wheel_RL.State.Byte;
		    UartDIA.Tx_data[11]= Wheel_RR.State.Byte;
			// переменные 6 строка
			UartDIA.Tx_data[20] = Wheel_FL.Ref/64;
		    UartDIA.Tx_data[21] = Wheel_FR.Ref/64;
		    UartDIA.Tx_data[22] = Wheel_RL.Ref/64;
		    UartDIA.Tx_data[23] = Wheel_RR.Ref/64;
		    break;
	   case 10: // отладка Load
		    UartDIA.Tx_data[2] = LoadEst_Flags;
		    // переменные 3 строка
		    if(Brake_M_Oss)
		    { // Определение загрузки через Торможение
		      UartDIA.Tx_data[7] = _Hi_16(Load.Brake.P); //обшее давление c задержкой
		      UartDIA.Tx_data[5] = _Hi_16(Load.Brake.M);
		      UartDIA.Tx_data[8] = _Hi_16(Load.Brake.M1);
		      UartDIA.Tx_data[11]= _Hi_16(Load.Brake.Mass);
		    }
		    else
		    { // Определение загрузки Разгон
		      UartDIA.Tx_data[7] = CAN_Engine.Torque;
		      UartDIA.Tx_data[5] = Engine.Torque / 64; // 1Nm -	8sb
		      UartDIA.Tx_data[8] = _Hi_16(Load.Engine.M); // 1t - 4sb
		      UartDIA.Tx_data[11]= _Hi_16(Load.Engine.Mass);
		    }
			// переменные 6 строка
			UartDIA.Tx_data[20] = Load.Trailer.Cargo;
		    UartDIA.Tx_data[21] = _Hi_16(Load.Truck.Hitch_Fz);
		    UartDIA.Tx_data[22] = _Hi_16(Load.Trailer.Axis_Fz);//
		    UartDIA.Tx_data[23] = _Hi_16(Load.Trailer.CFG.EmptyMass);//
		    break;
	   case 11: // отладка EBL
		    UartDIA.Tx_data[7] = EBL_Flags;
		    // переменные 3 строка
		    UartDIA.Tx_data[2] = _B1_32(EBL.REG.Koef);
		    UartDIA.Tx_data[5] = _Hi_16(EBL.REG.P_Hg);
		    UartDIA.Tx_data[8] = _Hi_16(EBL.REG_RL.Pdes);
		    UartDIA.Tx_data[11]= _Hi_16(EBL.REG_RR.Pdes);
			// переменные 6 строка
		    UartDIA.Tx_data[20] = Wheel_RL.ABS.Phase;
		    UartDIA.Tx_data[21] = Wheel_RR.ABS.Phase;
		    UartDIA.Tx_data[22] = Press_Sen3;
		    UartDIA.Tx_data[23] = Press_Sen4;
		    break;
	   case 12: // отладка KTS
		    UartDIA.Tx_data[7] = DSC_Flags1;
		    // переменные 3 строка
		    UartDIA.Tx_data[2] = ReverseON_Cnt;
		    UartDIA.Tx_data[5] = CAN_Engine.TaxoN;
		    UartDIA.Tx_data[8] = KTS.KoefTaxoSpeed /__KTS_Oss;
		    UartDIA.Tx_data[11]= KTS.Last /__KTS_Oss;
			// переменные 6 строка
		    UartDIA.Tx_data[20] = Wheel_FL.Ref/64;
		    UartDIA.Tx_data[21] = Wheel_FR.Ref/64;
		    UartDIA.Tx_data[22] = Wheel_RL.Ref/64;
		    UartDIA.Tx_data[23] = Wheel_RR.Ref/64;
		    break;
	   case 13: // отладка HillHold
		    UartDIA.Tx_data[7] = HillHold_State;
		    // переменные 3 строка
		    UartDIA.Tx_data[2] = HillHold_Flags;
		    UartDIA.Tx_data[5] = EBC5_Status1; //Hill holder mode
		    UartDIA.Tx_data[8] = DSC_Flags4; //HillHolder_Active _DSC_Flags4.Bits.b4
		    UartDIA.Tx_data[11]= DSC_Flags5; //HillHolder_Lamp _DSC_Flags5.Bits.b0
			// переменные 6 строка
		    UartDIA.Tx_data[20] = CAN_Engine.Driver;
		    UartDIA.Tx_data[21] = CAN_Engine.TaxoN;
		    UartDIA.Tx_data[22] = CAN_Engine.Torque;
		    UartDIA.Tx_data[23] = _Hi_16(Brake.HillHold.Press);//DSC_Flags2; //Parking_ON _DSC_Flags2.Bits.b7
		    break;
	   case 14: // отладка Speed FL
		    UartDIA.Tx_data[7] = ABS.Base.High/64;
		    // переменные 3 строка
		    UartDIA.Tx_data[2] = Wheel_FL.Ref/64;
		    UartDIA.Tx_data[5] = Wheel_FL.Accel;
		    UartDIA.Tx_data[8] = _Hi_16(Wheel_FL.Slip);
		    UartDIA.Tx_data[11]= Wheel_FL.State.Byte;
		    // переменные 6 строка
		    UartDIA.Tx_data[20] = Wheel_FR.Ref/64;
		    UartDIA.Tx_data[21] = Wheel_FR.Accel;
		    UartDIA.Tx_data[22] = _Hi_16(Wheel_FR.Slip);
		    UartDIA.Tx_data[23] = Wheel_FR.State.Byte;
		    break;
	   case 15: // отладка PumpToss
		    UartDIA.Tx_data[7] = ABS.Base.High/64;
		    // переменные 3 строка
		    UartDIA.Tx_data[2] = Wheel_FL.PumpToss;
		    UartDIA.Tx_data[5] = Wheel_FR.PumpToss;
		    UartDIA.Tx_data[8] = Wheel_RL.PumpToss;
		    UartDIA.Tx_data[11]= Wheel_RR.PumpToss;
		    // переменные 6 строка
		    UartDIA.Tx_data[20] = Wheel_FL.Ref/64;//Wheel_FL.ABS.Base/64;
		    UartDIA.Tx_data[21] = Wheel_FR.Ref/64;//Wheel_FR.ABS.Base/64;
		    UartDIA.Tx_data[22] = Wheel_RL.Ref/64;//Wheel_RL.ABS.Base/64;
		    UartDIA.Tx_data[23] = Wheel_RR.Ref/64;//Wheel_RR.ABS.Base/64;
		    break;
	   case 16: // отладка ABS 6Ch
		    UartDIA.Tx_data[7]  = Speed_VX_est/64;//
		    // переменные 3 строка
		    UartDIA.Tx_data[2]  = Wheel_FL.ABS.Phase;
		    UartDIA.Tx_data[5]  = Wheel_FR.ABS.Phase;
		    UartDIA.Tx_data[8]  = Wheel_RL.ABS.Phase;
		    UartDIA.Tx_data[11] = Wheel_RR.ABS.Phase;
		    // переменные 6 строка
		    UartDIA.Tx_data[20] = Wheel_3L.ABS.Phase;
		    UartDIA.Tx_data[21] = Wheel_3R.ABS.Phase;
		    UartDIA.Tx_data[22] = _Hi_16(Wheel_3L.Press);
		    UartDIA.Tx_data[23] = _Hi_16(Wheel_3R.Press);
		    break;
	   case 17: // отладка Press_Sen
		    UartDIA.Tx_data[7]  = Speed_VX_est/64;//
		    // переменные 3 строка
		    UartDIA.Tx_data[2]  = _Hi_16(Press_Sen1);
		    UartDIA.Tx_data[5]  = _Hi_16(Press_Sen2);
		    UartDIA.Tx_data[8]  = _Hi_16(Press_Sen3);
		    UartDIA.Tx_data[11] = _Hi_16(Press_Sen4);
		    // переменные 6 строка
		    UartDIA.Tx_data[20] = Wheel_FL.PumpToss;
		    UartDIA.Tx_data[21] = Wheel_FR.PumpToss;
		    UartDIA.Tx_data[22] = Wheel_RL.PumpToss;
		    UartDIA.Tx_data[23] = Wheel_RR.PumpToss;
		    break;
	   case 18: // отладка CANJ EEC1
		    UartDIA.Tx_data[7]  = Speed_VX_est/64;//
		    // переменные 3 строка
		    UartDIA.Tx_data[2] = CANJ.EEC1_81.Driver;
		    UartDIA.Tx_data[5] = CANJ.EEC1_81.Torque;
		    UartDIA.Tx_data[8] = CANJ.EEC1_82.Driver;
		    UartDIA.Tx_data[11]= CANJ.EEC1_82.Torque;
   		    // переменные 6 строка
		    UartDIA.Tx_data[20] = CANJ.EEC1_81.Taxo / 80; // 1 bit - 10 об/мин
		    UartDIA.Tx_data[21] = CANJ.EEC1_82.Taxo / 80; // 1 bit - 10 об/мин
		    UartDIA.Tx_data[22] = Wheel_RL.ABS.Phase;
		    UartDIA.Tx_data[23] = Wheel_RR.ABS.Phase;
		    break;

	   case 23: //  для совместимости с с SKU_v18_01
		   break;
	}
}
//#endif

void    Read_IEE_VDC_Const (void)
{
	uint8_t i;
// счетчик записей CFG
	Config_Cnt = *(uint32_t*)(ConfigEndAdr-4);
// чтение буфера констант из FlashCFG
// IEE_DSC_Const -!!Big Indian!!  HI:LO
uint16_t Adr = 0;
    for (i = 0; i < (SizeCFGBuf/2-1) ; i++)
	{	uint32_t   Tmp = CONFIG_Read(Adr);
		IEE_DSC_Const[2*i] = _Lo_32(Tmp);
		IEE_DSC_Const[2*i+1] = _Hi_32(Tmp);
		Adr+=4U;
	}
//------------------------------------
// IEE_DSC_Const смещен на 1байт по сравнению с DumpMOT[]

// Константы машины и настроек
    Block_Config =   _Lo_16(IEE_DSC_Const[0]);
    Wheel_FL.CFG.Nz =_Hi_16(IEE_DSC_Const[1]);
    Wheel_FR.CFG.Nz = Wheel_FL.CFG.Nz;
    W01_Coef = (_Lo_16(IEE_DSC_Const[1])*256 +
    		    _Hi_16(IEE_DSC_Const[2]))*65536 +
    		   (_Lo_16(IEE_DSC_Const[2])*256 +
    		    _Hi_16(IEE_DSC_Const[3]));
    Rounds_PHM_W01 = _Lo_16(IEE_DSC_Const[3]);
    Button_Config =  _Hi_16(IEE_DSC_Const[4]);
    TSCAE_Prior1 = _Lo_16(IEE_DSC_Const[4]);
    TSCAE_Prior2 = _Hi_16(IEE_DSC_Const[5]);
    Norm_Weel_Coef = _Lo_16(IEE_DSC_Const[5]);
    Def_Config_1 =   _Hi_16(IEE_DSC_Const[6]);
    //_Lo_16(IEE_DSC_Const[6]);
    //_Hi_16(IEE_DSC_Const[7]);
    //_Lo_16(IEE_DSC_Const[7]);
    //_Hi_16(IEE_DSC_Const[8]);
    CANJ.CFG.CAN_ASR_Mul= _Lo_16(IEE_DSC_Const[8]);
    CANJ.CFG.TSC_AR_Dat = _Hi_16(IEE_DSC_Const[9]);
    CANJ.CFG.CAN_Adress = _Lo_16(IEE_DSC_Const[9]);
    LIM.CFG.Speed_Set = IEE_DSC_Const[10];
    LIM.CFG.B7_Puls_Const = _Hi_16(IEE_DSC_Const[11]);
    LIM.CFG.PWM_PK.Ku = _Lo_16(IEE_DSC_Const[11]);
    LIM.CFG.PWM_PK.Ko = IEE_DSC_Const[12];
    LIM.CFG.PWM_PK.dKu =_Hi_16(IEE_DSC_Const[13]);
    LIM.CFG.PWM_PK.dDKo = _Lo_16(IEE_DSC_Const[13]);
    LIM.CFG.PWM_PK.Kvolt = _Hi_16(IEE_DSC_Const[14]);
    Def_Config_2 = _Lo_16(IEE_DSC_Const[14]);
    LIM.CFG.Set_Min = _Hi_16(IEE_DSC_Const[15]);
    Def_Config_3 = _Lo_16(IEE_DSC_Const[15]);
    WheelSens_Config = _Hi_16(IEE_DSC_Const[16]);
    MOD_Config = _Lo_16(IEE_DSC_Const[16]);
    ABS_Config = _Hi_16(IEE_DSC_Const[17]);
    Lock_Diff_Config = _Lo_16(IEE_DSC_Const[17]);
// ------------- Настройки регулирования 1 -------------------
	DSC_Config_1 = _Hi_16(IEE_DSC_Const[18]);
	DSC_Config_2 = _Lo_16(IEE_DSC_Const[18]);
	DSC_Ratio_Steer = IEE_DSC_Const[19];
	DSC_K_l_Acker =   IEE_DSC_Const[20];
	DSC_K_Q_Acker =   IEE_DSC_Const[21];
	DSC_Car_Base =    IEE_DSC_Const[22];
	ROP.CFG.ThrON_dAyK = _Hi_16(IEE_DSC_Const[23]);
	ROP.CFG.PoF = _Lo_16(IEE_DSC_Const[23])*256;
	ROP.CFG.PoR = _Hi_16(IEE_DSC_Const[24])*256;
	ROP.BrakeF.CFG.dPexh = _Lo_16(IEE_DSC_Const[24])*256/5;
	Brake.CFG.Delay.Pump_To = _Hi_16(IEE_DSC_Const[25]);
	Brake.CFG.Delay.Exh_To = _Lo_16(IEE_DSC_Const[25]);
	ASR.Engine.CFG.Kpro = _Hi_16(IEE_DSC_Const[26])*32;
	ASR.Engine.CFG.Kdif = _Lo_16(IEE_DSC_Const[26])*16;
	DSC_Config_4 = _Hi_16(IEE_DSC_Const[27]);
	ROP.BrakeF.CFG.Slip = 0xFFFF - (_Lo_16(IEE_DSC_Const[27])*64); //10%
	ROP.BrakeR.CFG.dPexh =  _Hi_16(IEE_DSC_Const[28])*256/5;
	ROP.BrakeR.CFG.Slip = 0xFFFF - (_Lo_16(IEE_DSC_Const[28])*64); //10%
	DSC_AOS_Config = _Hi_16(IEE_DSC_Const[29]);
	DSC_Config_3 =   _Lo_16(IEE_DSC_Const[29]);
	Load.CFG.Truck.Hitch_A = IEE_DSC_Const[30];
	ASR.Engine.CFG.KintI = _Hi_16(IEE_DSC_Const[31])*64;
	ASR.Engine.CFG.KintD = _Lo_16(IEE_DSC_Const[31])*64;
	ECAS.CFG.Tip = _Hi_16(IEE_DSC_Const[32]);
// _Lo_16(IEE_DSC_Const[32]);

// ------------- Настройки регулирования 2 -------------------
	DYC.CFG.PumpSetF = _Hi_16(IEE_DSC_Const[33])*256;
	DYC.CFG.PumpSetR = _Lo_16(IEE_DSC_Const[33])*256;
	ROP.CFG.ThrON_LoadK = _Hi_16(IEE_DSC_Const[34]);
	DYC.CFG.TcutSet =     _Lo_16(IEE_DSC_Const[34]);
	DYC.CFG.Dif_PoF =  _Hi_16(IEE_DSC_Const[35])*256;
	ROP.BrakeF.CFG.dPpump =  _Lo_16(IEE_DSC_Const[35])*256/5;
	DYC.CFG.Dif_PoR =   _Hi_16(IEE_DSC_Const[36])*256;
	ROP.BrakeR.CFG.dPpump =   _Lo_16(IEE_DSC_Const[36])*256/5;
	FrontDif.K_Inject = _Hi_16(IEE_DSC_Const[37])*16;
	RearDif.K_Inject =  _Lo_16(IEE_DSC_Const[37])*16;
	FrontDif.K_Exhaust =_Hi_16(IEE_DSC_Const[38])*16;
	RearDif.K_Exhaust = _Lo_16(IEE_DSC_Const[38])*16;
	Koef_AccY_dVf = IEE_DSC_Const[39]; //0x4D00;
	Sen_Steer_DigMax = IEE_DSC_Const[40];
	ROP.CFG.ThrON_SpK = _Hi_16(IEE_DSC_Const[41]);
	ROP.CFG.AccXdes =   _Lo_16(IEE_DSC_Const[41])*64;
	Wheel_FL.K_Inject =  _Lo_16(IEE_DSC_Const[42])*16;
	Wheel_FL.K_Exhaust = _Hi_16(IEE_DSC_Const[42])*16;
	Wheel_RL.K_Inject =  _Lo_16(IEE_DSC_Const[43])*16;
	Wheel_RL.K_Exhaust = _Hi_16(IEE_DSC_Const[43])*16;
	Wheel_FR.K_Inject = Wheel_FL.K_Inject;
	Wheel_FR.K_Exhaust = Wheel_FL.K_Exhaust;
	Wheel_RR.K_Inject = Wheel_RL.K_Inject;
	Wheel_RR.K_Exhaust = Wheel_RL.K_Exhaust;
	DYC.CFG.PD_Kpro = _Hi_16(IEE_DSC_Const[44]);
	DYC.CFG.PD_Kdif = _Lo_16(IEE_DSC_Const[44]);
	DYC.CFG.OvSt.PD_Thr  =(_Hi_16(IEE_DSC_Const[45]))*256;
	DYC.CFG.Eng.DragMax =  _Lo_16(IEE_DSC_Const[45]);
	DYC.CFG.Eng.DragMin = _Hi_16(IEE_DSC_Const[46]);
	EBL.CFG.dPump =       _Lo_16(IEE_DSC_Const[46])*256/5;
	ROP.CFG.ThrAyON =    _Hi_16(IEE_DSC_Const[47])*64;
	ROP.CFG.EngON_dAy  = _Lo_16(IEE_DSC_Const[47])*64;
//-----------------------------------------------------------
//_Hi_16(IEE_DSC_Const[48]);
//_Lo_16(IEE_DSC_Const[48]);
//_Hi_16(IEE_DSC_Const[49]);
//_Lo_16(IEE_DSC_Const[49]);
//_Hi_16(IEE_DSC_Const[50]);
    Vehicle.ECU.Cod_Y = _Lo_16(IEE_DSC_Const[50]);
    Vehicle.ECU.Cod_M = _Hi_16(IEE_DSC_Const[51]);
    Vehicle.ECU.Cod_D = _Lo_16(IEE_DSC_Const[51]);
    Vehicle.ECU.Cod =(IEE_DSC_Const[52])*0x100 +
    		         _Hi_16(IEE_DSC_Const[53]);
    Vehicle.ECU.SN_Y = _Lo_16(IEE_DSC_Const[53]);
    Vehicle.ECU.SN_M = _Hi_16(IEE_DSC_Const[54]);
    Vehicle.ECU.SNum = (_Lo_16(IEE_DSC_Const[54]))*256 +
    		            _Hi_16(IEE_DSC_Const[55]);
//    Vehicle.ECU.Ver_PO = _Lo_16(IEE_DSC_Const[55]);
// _Hi_16(IEE_DSC_Const[56]); //not Used
// _Lo_16(IEE_DSC_Const[56]);
    Wheel_RL.CFG.Nz =_Hi_16(IEE_DSC_Const[57]);
    Wheel_RR.CFG.Nz = Wheel_RL.CFG.Nz;
    W23_Coef = (_Lo_16(IEE_DSC_Const[57])*256 +
    		    _Hi_16(IEE_DSC_Const[58]))*65536 +
    		   (_Lo_16(IEE_DSC_Const[58])*256 +
    		    _Hi_16(IEE_DSC_Const[59]));
    Rounds_PHM_W23 = _Lo_16(IEE_DSC_Const[59]);

    Wheel_3L.CFG.Nz =_Hi_16(IEE_DSC_Const[60]);
    Wheel_3R.CFG.Nz = Wheel_3L.CFG.Nz;
    W45_Coef = (_Lo_16(IEE_DSC_Const[60])*256 +
    		    _Hi_16(IEE_DSC_Const[61]))*65536 +
    		   (_Lo_16(IEE_DSC_Const[61])*256 +
    		    _Hi_16(IEE_DSC_Const[62]));
    Rounds_PHM_W45 = _Lo_16(IEE_DSC_Const[62]);
//_Hi_16(IEE_DSC_Const[63])	   //Def_Conf_Res_3
//_Lo_16(IEE_DSC_Const[63])    //Config_ChSum_1
//_Hi_16(IEE_DSC_Const[64])    //Config_ChSum_2
// ------------- Настройки регулирования 3 -------------------
	DYC.CFG.UnSt.DerWz  = _Lo_16(IEE_DSC_Const[64]);
	DYC.CFG.Poff =  _Hi_16(IEE_DSC_Const[65])*256;
	DYC.CFG.UnSt.PD_Thr = _Lo_16(IEE_DSC_Const[65])*256;
	DYC.CFG.Dif_dP = _Hi_16(IEE_DSC_Const[66])*256;
    DYC.CFG.dWzLim = _Lo_16(IEE_DSC_Const[66])*143 / 32;  //max 8dps
	ROP.CFG.VxR20mLaden = _Hi_16(IEE_DSC_Const[67])*256;
	ROP.CFG.Tcut = _Lo_16(IEE_DSC_Const[67]);
	ROP.CFG.K_dPexh = _Hi_16(IEE_DSC_Const[68]);
	ROP.CFG.VxR20mEmpty = _Lo_16(IEE_DSC_Const[68])*256;
	DYC.CFG.YawBias = _Hi_16(IEE_DSC_Const[69])* 143 / 32;  //max 8dps
	SSC.CFG.Thr_SA = _Lo_16(IEE_DSC_Const[69])* 8; // max 14,3 grad
	Load.CFG.AxRunOut =  _Hi_16(IEE_DSC_Const[70])* 16;
	Brake.Front.CFG.MDT_Pdes = _Lo_16(IEE_DSC_Const[70])*256;
	Brake.Rear.CFG.MDT_Pdes = _Hi_16(IEE_DSC_Const[71])*256;
	EBL.CFG.Vmin = _Lo_16(IEE_DSC_Const[71])*16;
	ROP.CFG.Kgaz = _Hi_16(IEE_DSC_Const[72]);
	ROP.CFG.EngKi = _Lo_16(IEE_DSC_Const[72]) * 16;
	ROP.CFG.TorqueMin = _Hi_16(IEE_DSC_Const[73]);
	ROP.CFG.VxPh3 = _Lo_16(IEE_DSC_Const[73])*16;
	DYC.CFG.UnSt.dWzON = _Hi_16(IEE_DSC_Const[74])* 143 / 32;  //max 8dps
	ROP.CFG.SpeedON = _Lo_16(IEE_DSC_Const[74])* 256;
	DYC.CFG.UnSt.Kakk = _Hi_16(IEE_DSC_Const[75]);
	ROP.CFG.EngOFF_dAy  = _Lo_16(IEE_DSC_Const[75]) * 64;
	DSC_Config_5 = _Hi_16(IEE_DSC_Const[76]);
	Engine.CFG.PeakTorq = _Lo_16(IEE_DSC_Const[76])*256+
                          _Hi_16(IEE_DSC_Const[77]);
	DYC.CFG.UnSt.AyOn =_Lo_16(IEE_DSC_Const[77])*64;
	SSC.CFG.dWz_SA = _Hi_16(IEE_DSC_Const[78])* 143 / 32;  //max 8dps
	Yaw_Delay =_Lo_16(IEE_DSC_Const[78]);
	Trailer.CFG.K_Inject =  _Hi_16(IEE_DSC_Const[79])*51;//256;//*16;
	Trailer.CFG.K_Exhaust = _Lo_16(IEE_DSC_Const[79])*51;//256;
	Trailer.CFG.K_Ax = _Hi_16(IEE_DSC_Const[80]);
	Trailer.CFG.DYC_Pdes = _Lo_16(IEE_DSC_Const[80])*256;
	DSC_Config_6 = _Hi_16(IEE_DSC_Const[81]);
	Trailer.CFG.ROP_Pdes = _Lo_16(IEE_DSC_Const[81])*256;
	CANJ.CFG.SA_DashBoard =_Hi_16(IEE_DSC_Const[82]);
	ROP.CFG.SlipN = 0xFFFF - (_Lo_16(IEE_DSC_Const[82]) * 64); //10%
	Trailer.CFG.dP = _Hi_16(IEE_DSC_Const[83])*256;
    ECAS.CFG.Kmp = _Lo_16(IEE_DSC_Const[83])*2;
    EBL.CFG.P0 =   _Hi_16(IEE_DSC_Const[84])*256;
    EBL.CFG.dP =   _Lo_16(IEE_DSC_Const[84])*256/5;
    ROP.CFG.K_PmaxVx = _Hi_16(IEE_DSC_Const[85]);  //106
    BrakeP.OffSet = _Lo_16(IEE_DSC_Const[85]);
    PSen1.OffSet = BrakeP.OffSet;
    PSen2.OffSet = BrakeP.OffSet;
    PSen3.OffSet = BrakeP.OffSet;
    PSen4.OffSet = BrakeP.OffSet;
    TrailerP.OffSet = BrakeP.OffSet;
    ECAS.CFG.PS_OffSet = _Hi_16(IEE_DSC_Const[86]);  // не менять адрес!!
// ------------- Настройки регулирования 4 -------------------
    Load.CFG.Truck.Hitch_MaxLoad = _Lo_16(IEE_DSC_Const[86])*256+
                                   _Hi_16(IEE_DSC_Const[87]);
    Load.CFG.Truck.Empty_Axis_Front = _Lo_16(IEE_DSC_Const[87])*256+
                                      _Hi_16(IEE_DSC_Const[88]);
    Load.CFG.Truck.Empty_Axis_Rear = _Lo_16(IEE_DSC_Const[88])*256+
                                     _Hi_16(IEE_DSC_Const[89]);
    EBL.CFG.Slip = _Lo_16(IEE_DSC_Const[89])*25; //17%
    DSC_Config_7 = _Hi_16(IEE_DSC_Const[90]);
    EBL.CFG.Kcor = _Lo_16(IEE_DSC_Const[90]);
    ROP.CFG.PmaxF = _Hi_16(IEE_DSC_Const[91])*256;
    ROP.CFG.PmaxR = _Lo_16(IEE_DSC_Const[91])*256;
    Load.CFG.Truck.Num_RearAxis = _Hi_16(IEE_DSC_Const[92]);
    DSC_Config_8 = _Lo_16(IEE_DSC_Const[92]);
    SSC.CFG.Ktg_Koef = _Hi_16(IEE_DSC_Const[93]);
    Load.Trailer.CFG.EmptyMass = _Lo_16(IEE_DSC_Const[93])*256+
                                 _Hi_16(IEE_DSC_Const[94]);
    ROP.CFG.K1F = _Lo_16(IEE_DSC_Const[94]);
    ROP.CFG.K1R = _Hi_16(IEE_DSC_Const[95]);
    ROP.CFG.dPdif = _Lo_16(IEE_DSC_Const[95])*256;
    ROP.CFG.dPo = _Hi_16(IEE_DSC_Const[96])*256;
    ROP.CFG.K3 =  _Lo_16(IEE_DSC_Const[96]);
    Brake.CFG.Grad_BP = _Hi_16(IEE_DSC_Const[97])*(uint32_t)1024;
    DSC_Config_9 = _Lo_16(IEE_DSC_Const[97]);
    Wheel_FL.P_Full = _Hi_16(IEE_DSC_Const[98])*256/5;
    Wheel_FR.P_Full = Wheel_FL.P_Full;
    Wheel_RL.P_Full = _Lo_16(IEE_DSC_Const[98])*256/5;
    Wheel_RR.P_Full = Wheel_RL.P_Full;
    FrontDif.P_Full =_Hi_16(IEE_DSC_Const[99])*64;//256;
    RearDif.P_Full = _Lo_16(IEE_DSC_Const[99])*64;//256;
    Brake.CFG.K_ExhTap =  _Hi_16(IEE_DSC_Const[100])*64;
	Koef_Steer = _Lo_16(IEE_DSC_Const[100]);
    Load.CFG.Delay_Torq  =_Hi_16(IEE_DSC_Const[101]);
    Load.Trailer.CFG.K4 = _Lo_16(IEE_DSC_Const[101]);//*2;
    Trailer.CFG.ROP_Po =  _Hi_16(IEE_DSC_Const[102])*256;
	Engine.CFG.K1_TL  = _Lo_16(IEE_DSC_Const[102]); //
	Engine.CFG.K2_TL  = _Hi_16(IEE_DSC_Const[103]);
    Load.CFG.Vx_Min = _Lo_16(IEE_DSC_Const[103])*256;
    Load.CFG.K_Pr =   _Hi_16(IEE_DSC_Const[104])*64;
    Load.CFG.Delay_Press = _Lo_16(IEE_DSC_Const[104]);
	ROP.CFG.Ay_OffSet =    _Hi_16(IEE_DSC_Const[105])*64;
	Brake.Rear.CFG.dPva =  _Lo_16(IEE_DSC_Const[105])*64;
	Brake.Front.CFG.dPva =  _Hi_16(IEE_DSC_Const[106])*64;
	DSC_OffSet_AccY = _Lo_16(IEE_DSC_Const[106])*256+  // не менять адрес!!
			          _Hi_16(IEE_DSC_Const[107]);
	DSC_OffSet_AccX = _Lo_16(IEE_DSC_Const[107])*256+  // не менять адрес!!
			          _Hi_16(IEE_DSC_Const[108]);
// ------------- Настройки регулирования 5 -------------------
	Engine.CFG.TorqXX  = _Lo_16(IEE_DSC_Const[108]); //
	ASR.CFG.Slip = _Hi_16(IEE_DSC_Const[109])*65; // Slip точность 0,1% max 24,9%
	Brake.CFG.Delay.Pump_Kp =	_Lo_16(IEE_DSC_Const[109]);//*64;
	Brake.CFG.Delay.Exh_Kp =	_Hi_16(IEE_DSC_Const[110])*64;
	Brake.Front.CFG.Grad_Pump = _Lo_16(IEE_DSC_Const[110])*2;
	Brake.Front.CFG.Grad_Exh =  _Hi_16(IEE_DSC_Const[111])*8;
	Vehicle.StateAGS = _Lo_16(IEE_DSC_Const[111]);  // не менять адрес!!
	Vehicle.StateSAS = _Hi_16(IEE_DSC_Const[112]);  // не менять адрес!!
	Vehicle.VIN.WMI = _Lo_16(IEE_DSC_Const[112])*0x10000+
			          _Hi_16(IEE_DSC_Const[113])*0x100+
		              _Lo_16(IEE_DSC_Const[113]);
	Vehicle.VIN.Model = IEE_DSC_Const[114]*0x10000+
			            IEE_DSC_Const[115];
    Vehicle.VIN.Engine = IEE_DSC_Const[116];
	Vehicle.VIN.Year = _Hi_16(IEE_DSC_Const[117]);

	Vehicle.VIN.Number = _Lo_16(IEE_DSC_Const[117])*0x1000000000000+
			                    IEE_DSC_Const[118]*0x100000000 +
			                    IEE_DSC_Const[119]*0x10000 +
			                    IEE_DSC_Const[120];
	Vehicle.VIN.Code = _Hi_16(IEE_DSC_Const[121]);
    DSC_Config_10 = _Lo_16(IEE_DSC_Const[121]);
    Load.CFG.Truck.Num_FrontAxis = 1;
//    Wheel_FL.CFG.Nz =     _Hi_16(IEE_DSC_Const[122]); // выше
    Wheel_FL.CFG.Radius = _Lo_16(IEE_DSC_Const[122]);
    Wheel_FR.CFG.Nz = Wheel_FL.CFG.Nz;
    Wheel_FR.CFG.Radius = Wheel_FL.CFG.Radius;
//    Wheel_RL.CFG.Nz =     _Hi_16(IEE_DSC_Const[123]);
    Wheel_RL.CFG.Radius = _Lo_16(IEE_DSC_Const[123]);
    Wheel_RR.CFG.Nz = Wheel_RL.CFG.Nz;
    Wheel_RR.CFG.Radius = Wheel_RL.CFG.Radius;
	Brake.Rear.CFG.Grad_Pump = _Hi_16(IEE_DSC_Const[124])*2;
	Brake.Rear.CFG.Grad_Exh =  _Lo_16(IEE_DSC_Const[124])*8;
	Brake.Front.CFG.Chamber_Tip =_Hi_16(IEE_DSC_Const[125]);
	Brake.Rear.CFG.Chamber_Tip = _Lo_16(IEE_DSC_Const[125]);
	Load.CFG.Efficiency = _Hi_16(IEE_DSC_Const[126]);
	DSC_Config_11 =       _Lo_16(IEE_DSC_Const[126]);
	Wheel_FL.CFG.K_dP4 =  _Hi_16(IEE_DSC_Const[127]);
	Wheel_FR.CFG.K_dP4 = Wheel_FL.CFG.K_dP4;
	Wheel_RL.CFG.K_dP4 =  _Lo_16(IEE_DSC_Const[127]);
	Wheel_RR.CFG.K_dP4 = Wheel_RL.CFG.K_dP4;
	Wheel_FL.CFG.K_AcP4 = _Hi_16(IEE_DSC_Const[128]);
	Wheel_FR.CFG.K_AcP4 = Wheel_FL.CFG.K_AcP4;
	Wheel_RL.CFG.K_AcP4 = _Lo_16(IEE_DSC_Const[128]);
	Wheel_RR.CFG.K_AcP4 = Wheel_RL.CFG.K_AcP4;
	ABS.CFG.K_NumP =  _Hi_16(IEE_DSC_Const[129]);
	ABS.CFG.Recursya =_Lo_16(IEE_DSC_Const[129]);
	Wheel_FL.ABS.CFG.Pm = _Hi_16(IEE_DSC_Const[130])*256;
	Wheel_FR.ABS.CFG.Pm = Wheel_FL.ABS.CFG.Pm;
// ------------- Настройки регулирования 6 -------------------
	Wheel_RL.ABS.CFG.Pm = _Lo_16(IEE_DSC_Const[130])*256;
	Wheel_RR.ABS.CFG.Pm = Wheel_RL.ABS.CFG.Pm;
	Wheel_FL.ABS.CFG.AccelOn = _Hi_16(IEE_DSC_Const[131]); // Wheel Accel точность 0,2m/c2 max 51m/c2
	Wheel_FR.ABS.CFG.AccelOn = Wheel_FL.ABS.CFG.AccelOn;
	ABS.CFG.Pause =  _Lo_16(IEE_DSC_Const[131]);
	MIR_Front.CFG.dP0_L =_Hi_16(IEE_DSC_Const[132])*256/5;
	MIR_Front.CFG.dP0_R =_Lo_16(IEE_DSC_Const[132])*256/5;
	MIR_Front.CFG.KdP = _Hi_16(IEE_DSC_Const[133])*4;
	DSC_Config_12 = _Lo_16(IEE_DSC_Const[133]);
	Wheel_RL.ABS.CFG.AccelOn = _Hi_16(IEE_DSC_Const[134]);
	Wheel_RR.ABS.CFG.AccelOn = Wheel_RL.ABS.CFG.AccelOn;
	ASR.CFG.ThrP =  _Lo_16(IEE_DSC_Const[134])*256/5;
	ASR.CFG.dPump = _Hi_16(IEE_DSC_Const[135])*256/5;
	ROP.CFG.Turn_OO=_Lo_16(IEE_DSC_Const[135])*256+
			         _Hi_16(IEE_DSC_Const[136]);
	Wheel_FL.ABS.CFG.SlipOn = _Lo_16(IEE_DSC_Const[136])*256/10; // Sleep точность 0,1% max 24,9%
	Wheel_FR.ABS.CFG.SlipOn = Wheel_FL.ABS.CFG.SlipOn;
	Wheel_RL.ABS.CFG.SlipOn = _Hi_16(IEE_DSC_Const[137])*256/10;
	Wheel_RR.ABS.CFG.SlipOn = Wheel_RL.ABS.CFG.SlipOn;
	ASR.CFG.dTaxoLim = _Lo_16(IEE_DSC_Const[137])*8;
	DSC_Config_13 =    _Hi_16(IEE_DSC_Const[138]);
	ASR.CFG.Kpro = _Lo_16(IEE_DSC_Const[138])*256/10;//*128;
	ASR.CFG.KintI =_Hi_16(IEE_DSC_Const[139])*256/10;
	ASR.CFG.Kdif = _Lo_16(IEE_DSC_Const[139])*256/10;//*32;
	ASR.CFG.Kload = _Hi_16(IEE_DSC_Const[140]);
	Wheel_FL.ABS.CFG.Po = _Lo_16(IEE_DSC_Const[140])*256/5;
	Wheel_FR.ABS.CFG.Po = Wheel_FL.ABS.CFG.Po;
	Wheel_RL.ABS.CFG.Po = _Hi_16(IEE_DSC_Const[141])*256/5;
	Wheel_RR.ABS.CFG.Po = Wheel_RL.ABS.CFG.Po;
	Wheel_FL.ABS.CFG.KdP = _Lo_16(IEE_DSC_Const[141])*32;
	Wheel_FR.ABS.CFG.KdP = Wheel_FL.ABS.CFG.KdP;
	Wheel_RL.ABS.CFG.KdP = _Hi_16(IEE_DSC_Const[142])*32;
	Wheel_RR.ABS.CFG.KdP = Wheel_RL.ABS.CFG.KdP;
	ASR.CFG.Speed = _Lo_16(IEE_DSC_Const[142])*256;
	ABS.CFG.SlipExh = _Hi_16(IEE_DSC_Const[143])*256/10;
	Fault_Mask = _Lo_16(IEE_DSC_Const[143]);
	ASR.Engine.CFG.Kgaz = _Hi_16(IEE_DSC_Const[144]);
	DSC_Config_14 = _Lo_16(IEE_DSC_Const[144]);
	ABS.CFG.MaxAcc =_Hi_16(IEE_DSC_Const[145])*5;
	DSC_Config_15 = _Lo_16(IEE_DSC_Const[145]);
	ABS.CFG.PromSp = _Hi_16(IEE_DSC_Const[146])*8;
	ABS.CFG.High_Mu =_Lo_16(IEE_DSC_Const[146])*128;
	ABS.CFG.K_Slip = _Hi_16(IEE_DSC_Const[147]);
	ABS.CFG.SpeedOFF = _Lo_16(IEE_DSC_Const[147])*16;
	ABS.CFG.SlipOptim = _Hi_16(IEE_DSC_Const[148])*256/10;
	MIR_Front.CFG.ThrdP = _Lo_16(IEE_DSC_Const[148])*256;
	Wheel_FL.ABS.CFG.T_ShExh = _Hi_16(IEE_DSC_Const[149]);
	Wheel_FR.ABS.CFG.T_ShExh = Wheel_FL.ABS.CFG.T_ShExh;
	Brake.Front.CFG.GradPump_L = _Lo_16(IEE_DSC_Const[149])*2;
	Wheel_FL.ABS.CFG.K_ShExh = _Hi_16(IEE_DSC_Const[150]);
	Wheel_FR.ABS.CFG.K_ShExh = Wheel_FL.ABS.CFG.K_ShExh;
	MIR_Front.CFG.dWz = _Lo_16(IEE_DSC_Const[150])*143 / 32;  //max 8dps
	MIR_Front.CFG.dPmax =_Hi_16(IEE_DSC_Const[151])*256/5;
	ECAS.CFG.Susp_Mass = _Lo_16(IEE_DSC_Const[151])*10;
	DSC_Config_16 = _Hi_16(IEE_DSC_Const[152]);
// ------------- Настройки регулирования 7 -------------------
	DSC_Car_Hcg =_Lo_16(IEE_DSC_Const[152])*1024/100;
	Wheel_FL.CFG.TpumpMin =  _Hi_16(IEE_DSC_Const[153]);
	Wheel_FR.CFG.TpumpMin = Wheel_FL.CFG.TpumpMin;
	Wheel_RL.CFG.TpumpMin =  _Lo_16(IEE_DSC_Const[153]);
	Wheel_RR.CFG.TpumpMin = Wheel_RL.CFG.TpumpMin;
	Load.CFG.P_Start =  _Hi_16(IEE_DSC_Const[154])*256;
	ASR.Engine.CFG.Kpress = _Lo_16(IEE_DSC_Const[154]);
	DSC_Config_17 = _Hi_16(IEE_DSC_Const[155]);
	Brake.CFG.AsistP = _Lo_16(IEE_DSC_Const[155])*256;
	Wheel_RL.ABS.CFG.K_ShExh = _Hi_16(IEE_DSC_Const[156]);
	Wheel_RR.ABS.CFG.K_ShExh = Wheel_RL.ABS.CFG.K_ShExh;
	Wheel_RL.ABS.CFG.T_ShExh = _Lo_16(IEE_DSC_Const[156]);
	Wheel_RR.ABS.CFG.T_ShExh = Wheel_RL.ABS.CFG.T_ShExh;
	Retarder.CFG.Slip_On = _Hi_16(IEE_DSC_Const[157])*256/10;
	Retarder.CFG.Slip_Off =_Lo_16(IEE_DSC_Const[157])*256/10;
	Retarder.CFG.Speed = _Hi_16(IEE_DSC_Const[158])*256;
	Brake.CFG.AsistT = _Lo_16(IEE_DSC_Const[158])*2;
	DSC_Config_18 = _Hi_16(IEE_DSC_Const[159]);
	Brake.CFG.HillHoldT = _Lo_16(IEE_DSC_Const[159])*10;
	ABS.CFG.SpThr_dPpump_F = _Hi_16(IEE_DSC_Const[160])*8;
	ABS.CFG.SpThr_dPpump_R = _Lo_16(IEE_DSC_Const[160])*8;
	ABS.CFG.SpThr_Con_F = _Hi_16(IEE_DSC_Const[161])*8;
	ABS.CFG.SpThr_Con_R = _Lo_16(IEE_DSC_Const[161])*8;
	DSC_Config_19 = _Hi_16(IEE_DSC_Const[162]);
	ASR.CFG.BrakeTout = _Lo_16(IEE_DSC_Const[162])*25;
	ASR.CFG.EngineTout = _Hi_16(IEE_DSC_Const[163])*100;
	ASR.CFG.Pmax =  _Lo_16(IEE_DSC_Const[163])*256;
	SAS.Zero.Wz = _Hi_16(IEE_DSC_Const[164])*143/128;  //max 2dps
	SAS.Zero.SAng = _Lo_16(IEE_DSC_Const[164])*18;
	DSC_Config_20 = _Hi_16(IEE_DSC_Const[165]);
	ASR.CFG.OnDelay =  _Lo_16(IEE_DSC_Const[165]);
	ASR.CFG.KintD = _Hi_16(IEE_DSC_Const[166])*256/10;
	ASR.CFG.PThrK = _Lo_16(IEE_DSC_Const[166]);
	DSC_Config_21 = _Hi_16(IEE_DSC_Const[167]);
	Load.CFG.Vx_Max =  _Lo_16(IEE_DSC_Const[167])*256;
	DSC_Config_22 =  _Hi_16(IEE_DSC_Const[168]);
	ABS.CFG.Pause_SlipK =  _Lo_16(IEE_DSC_Const[168]);
	Brake.Front.CFG.K_Pva =_Hi_16(IEE_DSC_Const[169]);
	Brake.Rear.CFG.K_Pva = _Lo_16(IEE_DSC_Const[169]);
	DSC_Config_23 = _Hi_16(IEE_DSC_Const[170]);
	DSC_Config_24 = _Lo_16(IEE_DSC_Const[170]);
	DSC_Config_25 = _Hi_16(IEE_DSC_Const[171]);
	DSC_Config_26 = _Lo_16(IEE_DSC_Const[171]);
	Retarder.CFG.Deccel = _Hi_16(IEE_DSC_Const[172])*32;
	Retarder.CFG.Torque = _Lo_16(IEE_DSC_Const[172]);
	Load.CFG.K_RET = _Hi_16(IEE_DSC_Const[173]);
	LIM.CFG.PWM_PK.Kper = _Lo_16(IEE_DSC_Const[173]);
	LIM.CFG.PWM_PK.Period=_Hi_16(IEE_DSC_Const[174]);

// ------------- Настройки регулирования 8 -------------------
	Vehicle.Modif.Num1 = _Lo_16(IEE_DSC_Const[174])*0x1000000000000+
			             IEE_DSC_Const[175]*0x100000000+
			             IEE_DSC_Const[176]*0x10000+
			             IEE_DSC_Const[177];

	Vehicle.Modif.D =    _Hi_16(IEE_DSC_Const[178]);
	Vehicle.Modif.Num2 = _Lo_16(IEE_DSC_Const[178])*0x10000 +
			             IEE_DSC_Const[179];
//IEE_DSC_Const[180]);
    Vehicle.ECU.Lot = _Hi_16(IEE_DSC_Const[181]);

    Brake.CFG.HillHold_Pdes = _Lo_16(IEE_DSC_Const[181])*256;

/*    Wheel_FL.ABS.CFG.PromSp = _Lo_16(IEE_DSC_Const[181])*8;
    Wheel_FR.ABS.CFG.PromSp = Wheel_FL.ABS.CFG.PromSp;
     // SleepEnd  точность 0,1% max 24,9%
     Wheel_RL.ABS.Ph3.SlipEnd = _Hi_16(IEE_DSC_Const[182])*256/10;
     Wheel_RR.ABS.Ph3.SlipEnd = Wheel_RL.ABS.Ph3.SlipEnd;
     Wheel_FL.ABS.Ph3.SlipEnd = _Lo_16(IEE_DSC_Const[182])*256/10;
     Wheel_FR.ABS.Ph3.SlipEnd = Wheel_FL.ABS.Ph3.SlipEnd;
*/
//---------- переменные связанные с Radius-------------------
//------------------Speed_Const------------------------------
// Ft =	1000000;
// K = Ft*256*3,6*Pi/100 =  28952917
// размерность R  1lsb - 0,01m
// Const = K*R/Nz
#define   __K_Speed_Const 0x01B9C956
//------------------Wheel Inertia---------------------------
// момент инерции колеса зависит от квадрата радиуса и
// массы J=M*R^2 размерность 1кг.м.м - 1msb
#define   __K_Inertia_Radius  113 // 19/105*65536

#ifdef __AxisF_Compile
    Wheel_FL.Capture.Const = (uint32_t)__K_Speed_Const *
    		                 Wheel_FL.CFG.Radius /  Wheel_FL.CFG.Nz;
    Wheel_FR.Capture.Const = Wheel_FL.Capture.Const;
    Wheel_FL.Inertia = Wheel_FL.CFG.Radius * Wheel_FL.CFG.Radius *
    		           (uint32_t)__K_Inertia_Radius /256;
    Wheel_FR.Inertia = Wheel_FL.Inertia;
#else
    Wheel_RL.Capture.Const = (uint32_t)__K_Speed_Const *
    		                 Wheel_RL.CFG.Radius /  Wheel_RL.CFG.Nz;
    Wheel_RR.Capture.Const = Wheel_RL.Capture.Const;
    Wheel_RL.Inertia = Wheel_RL.CFG.Radius * Wheel_RL.CFG.Radius *
    		           (uint32_t)__K_Inertia_Radius /256;
    if(RearTire_Tandem)  // двойные шины
    	Wheel_RL.Inertia *= 2;
    // Учет инерции трансмиссии !!!!!!!!
#define   __Rear_Axle_Inertia 0x5000  // 80кг.м.м 0x0C00  // 12кг.м.м
    Wheel_RL.Inertia += __Rear_Axle_Inertia;
    Wheel_RR.Inertia = Wheel_RL.Inertia;
#endif
    //
#ifdef __Axis3_Compile
    Wheel_3L.Capture.Const = (uint32_t)__K_Speed_Const *
    		                 Wheel_3L.CFG.Radius /  Wheel_3L.CFG.Nz;
    Wheel_3R.Capture.Const = Wheel_3L.Capture.Const;
    Wheel_3L.Inertia = Wheel_3L.CFG.Radius * Wheel_3L.CFG.Radius *
    		           (uint32_t)__K_Inertia_Radius /256;
    if(Axis3Tire_Tandem)  // двойные шины
    	Wheel_3L.Inertia *= 2;
    Wheel_3R.Inertia = Wheel_3L.Inertia;
#endif
//----------------------------------------------------------
// флаги  ввода в эксплуатацию Model_Instal
	if(!Vehicle.VIN.Model ||
		Vehicle.VIN.Model == 0xFFFFFFFF ||
		Vehicle.VIN.Model == __Model_Default ||
	   !Vehicle.VIN.Number ||
		Vehicle.VIN.Number == 0xFFFFFFFFFFFFFFFF ||
		Vehicle.VIN.Number == __Number_Default)
	{
	  if(Model_InstFail_Enable)
		 Model_Install_Fail = 1;
		 Model_Instal = 0;
	}
	else
	{	 Model_Install_Fail = 0;
	     Model_Instal = 1;
	}
	// флаги  ввода в эксплуатацию
	if(Vehicle.StateSAS != __SAS_Calibrate)
	{ if(SAS_InstallFail_Enable)
	   	 SAS_Install_Fail = 1;
	     SAS_Calibr_Cmpl = 0;
	}
	else
	{	SAS_Calibr_Cmpl = 1;
	    SAS_Install_Fail = 0;
	}
	// флаги  ввода в эксплуатацию
	if(Vehicle.StateAGS != __AGS_Calibrate)
	{ if(AGS_InstallFail_Enable)
		 AGS_Install_Fail = 1;
	     AGS_Calibr_Cmpl = 0;
	}
	else
	{	 AGS_Calibr_Cmpl = 1;
	     AGS_Install_Fail = 0;
	}

	// Конфигурация кнопок
	if(ABS_SW_install)
		 SW_ABS.Install = 1;
	else SW_ABS.Install = 0;
	if(ABS_SW_Button)
		 SW_ABS.Button = 1;
	else SW_ABS.Button = 0;

	if(ASR_SW_install)
		 SW_ASR.Install = 1;
	else SW_ASR.Install = 0;
	if(ASR_SW_Button)
		 SW_ASR.Button = 1;
	else SW_ASR.Button = 0;

	if(TSET_SW_install)
		 SW_TSET.Install = 1;
	else SW_TSET.Install = 0;
	if(TSET_SW_Button)
		 SW_TSET.Button = 1;
	else SW_TSET.Button = 0;

	if(Blink_Code_Enable)
		 SW_DIA.Install = 1;
	else SW_DIA.Install = 0;
	SW_DIA.Button = 0; //выключатель
// проверка Констант

} // end Read_IEE_DSC_Const()

#ifdef  __LIM_Speed
void     Speed_Terminal_B7(void)
{ // 5mc
// выход фильтра используется для обнуления отрицательных uint16_t
uint16_t FiltOut;
	// проверяем достоверность скорости B7
#define __Speed_VX_Releable 0x1400 //
#define __B7_NC_Cnt_Err    200
    if(B7_install)
    { if(Speed_VX_est > __Speed_VX_Releable &&
         !B7_Imp_Fail &&
	     !LIM_B7_Puls_Fail &&
		 LIM_B7_Find)
    { if(!LIM.B7.Speed)
      { if(LIM.B7.NC_Cnt < __B7_NC_Cnt_Err)
    	   LIM.B7.NC_Cnt++;
        else NC_B7 = 1;
      }
      else
      { if(LIM.B7.NC_Cnt)
   	       LIM.B7.NC_Cnt--;
        else NC_B7 = 0;
      }
    }
    }
    else NC_B7 = 0;

	if(LIM.B7.ZS_Cnt)
	{  LIM.B7.ZS_Cnt--;
	  if(!LIM_B7_Puls_Fail)
	  { if(LIM.B7.Speed <__B7_Max_Speed)
		     Filter_Vx_B7.Xn = LIM.B7.Speed;
	    else Filter_Vx_B7.Xn = __B7_Max_Speed;
	  }
	  // else Filter_Vx_B7.Xn = Speed_RearAxel; // средняя скорость задней оси
	  else Filter_Vx_B7.Xn = Speed_VX_est;
	}
	else
	{ // обнуление скорости
	  if(LIM.B7.Speed)
	  {  LIM.B7.Speed = 0;
	  Filter_Vx_B7.Xn = 0;
	     LIM.B7.FirstCapt = 0;
	     LIM.B7.Tim_Capt = 0;
	  }
	}
	// фильтруем Speed_VX
	// отрицательные значения обнуляем
	FiltOut = Filter_Cheb(&Filter_Vx_B7, Koef_Filtr1Hz); // Koef_Filtr2Hz);
	if(FiltOut < __uintYnMinus)
		 LIM.Speed.Est = FiltOut;
	else LIM.Speed.Est = 0;
	// определение производной LIM.Speed
	// разметность 1m/c^2 - 8Msb
#define __T_DeriVative_Vx_B7  50   // за 250mc
#define __K_DeriVative_Vx_B7  3686 //(3,6*1000/(5*__T_DeriVative_Vx_B))*256
 	LIM.Speed.Buf[0] = LIM.Speed.Est;
 	LIM.Speed.DeriVative =((int32_t)__K_DeriVative_Vx_B7 *
 	          DeriVative_U16(LIM.Speed.Buf, __T_DeriVative_Vx_B7)) /256;
 	// Base.Ax Derivative_VX_est
	// определение колебаний скорости
    if(Lim_Speed_Active)
    {
    }
} // end Speed_Terminal_B7()

void     Test_Terminal_B7(void)
{
	if(B7_install ||
	   LIM_B7_Find)  // нет в CFG но определился в тесте
	{

	}
}
#endif

/*****END OF FILE****/
