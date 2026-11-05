/*
  * My_Func.h
  ******************************************************************************
  * @brief   Header file of  module.
  * @author  Burdykin
  * Created on: 3 окт. 2017 г.
  *
  * @attention
  * last modified	12 октября 2017 г.
  ******************************************************************************
  */
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MY_FUNC_H
#define __MY_FUNC_H

/* USER CODE BEGIN Includes */
#include "MyTypeDef.h"
#include "MySystem.h"
#include "MyVAR.h"

/* Exported types ------------------------------------------------------------*/

typedef  union {
      uint8_t Byte;
  struct {
	  uint8_t bit1_2:2;
	  uint8_t bit3_5:3;
	  uint8_t bit6_8:3;
    } Bits;
} _EBC5_B1;

typedef  union {
      uint8_t Byte;
  struct {
	  uint8_t bit1_2:2;
	  uint8_t bit3_4:2;
	  uint8_t bit5_8:4;
    } Bits;
} _EBC5_B2;

typedef struct {
	_EBC5_B1   Status1;
	_EBC5_B2   Status2;
	 int8_t    XBR_AccLim;
	 _CANBits_ Status3;
} TypeDef_EBC5;

//Electronic Brake Controller 5
TypeDef_EBC5 EBC5;

#define    EBC5_Status1        EBC5.Status1.Byte
#define    EBC5_SPN3839        EBC5.Status1.Bits.bit1_2 //The temperature warning
#define    EBC5_SPN2913        EBC5.Status1.Bits.bit3_5 //Halt brake mode
#define    EBC5_SPN2912        EBC5.Status1.Bits.bit6_8 //Hill holder mode

#define    EBC5_Status2        EBC5.Status2.Byte
#define    EBC5_SPN2919        EBC5.Status2.Bits.bit1_2 // Foundation Brake Use
#define    EBC5_SPN2917        EBC5.Status2.Bits.bit3_4 // XBR System State
#define    EBC5_SPN2918        EBC5.Status2.Bits.bit5_8 // XBR Active Control Mode

#define    EBC5_Status3        EBC5.Status3.Byte
#define    EBC5_SPN5275        EBC5.Status3.Bits.bit1_2
#define    EBC5_SPN5847        EBC5.Status3.Bits.bit3_4 // Emergency_Brake Аварийный_тормоз
#define    EBC5_SPN7942        EBC5.Status3.Bits.bit5_6

typedef struct  //Press_Reg
{
	   int16_t   Cnt;
	   uint16_t  Pdes;	 // Задание давления
	   uint16_t  TrP;    // зона слежения
	   uint16_t  Ppump;
	   uint16_t  dPpump; // подкачкa давления
	   uint8_t   KL;     // состояние клапанов
	   uint16_t  CutT;   // время отсечки
	   uint16_t  Ks;     // коеффициент коррекции по проскадьзыванию
	   int16_t   Slip;   // проскальзывание относительно переда

} TypeDef_Press_Reg;

typedef struct {
	uint16_t   Pdes;
	uint8_t    Phase;
	uint16_t   Time;
} TypeDef_XBR_Brake;

typedef struct {
	 int16_t    AccDemand; //SPN2920
	 uint8_t    Urgency;   //SPN4099
	 _CANBits_  Mode;
	 _ByteBits_ Flags;
	 int16_t    AccPress;
	 int16_t    AccDes;
	 int16_t    AccLim;
	 int8_t    AccLim_SPN2921;

	 uint16_t   Kload;
	 uint8_t    Phase;
	 struct {

		 uint32_t   Pin;
		 uint32_t   Pout;
		 int32_t    Pint;
		 uint16_t   KdP;
		 uint16_t   Mass;

		 uint16_t   Grad;
		 uint16_t   Kos;

	 } REG;
	 struct {
		TypeDef_Press_Reg  REG_FL;
		TypeDef_Press_Reg  REG_FR;
	    TypeDef_Press_Reg  REG_RL;
	    TypeDef_Press_Reg  REG_RR;

	    TypeDef_XBR_Brake  Front;
	    TypeDef_XBR_Brake  Rear;
	 } Brake;

} TypeDef_XBR;

TypeDef_XBR XBR;

#define    XBR_Mode            XBR.Mode.Byte
#define    XBR_EBI_SPN2914     XBR.Mode.Bits.bit1_2
#define    XBR_Prior_SPN2915   XBR.Mode.Bits.bit3_4
#define    XBR_Mode_SPN2916    XBR.Mode.Bits.bit5_6

#define    XBR_Flags           XBR.Flags.Byte
#define    Retarder_Enable     XBR.Flags.Bits.b0
#define    Brake_Enable        XBR.Flags.Bits.b1
#define    Accel_ADD           XBR.Flags.Bits.b2
#define    Accel_MAX           XBR.Flags.Bits.b3
#define    Retarder_Request    XBR.Flags.Bits.b4
#define    Brake_Request       XBR.Flags.Bits.b5
#define    XBR_Abort           XBR.Flags.Bits.b6
#define    XBR_Disable         XBR.Flags.Bits.b7

typedef struct  // Load
{
  struct //CFG
  {
	uint16_t  AxRunOut; //выбег
    uint8_t   Efficiency;
    uint8_t   Delay_Torq;
    uint16_t  Vx_Min;
    uint16_t  Vx_Max;
    uint16_t  K_Pr;
    uint8_t   Delay_Press;
    uint16_t  P_Start;
    uint16_t  K_RET;
    struct
    {
    	uint16_t  Hitch_A;          // растояние А сцепки от передней оси
        uint16_t  Hitch_MaxLoad;    // Нагрузка на сцепку
        uint16_t  Empty_Axis_Rear;  //Нагрузка на переднюю ось снаряженная
        uint16_t  Empty_Axis_Front; //Нагрузка на заднюю ось снаряженная
        uint8_t   Num_RearAxis;
       uint8_t   Num_FrontAxis;
    } Truck;
  } CFG;

  struct // Truck
  {
	  uint16_t  CG_A;              // растояние А центра масс от передней оси
	  uint16_t  EmptyMass;         // снаряженная масса тягача
	  uint16_t  LadenMass;         // масса груженого тягача
	  uint16_t  Front_Fz;
	  uint16_t  Front2_Fz;
	  uint16_t  Rear_Fz;           // нагрузка
	  uint16_t  Axis3_Fz;
	  uint16_t  Hitch_Fz;
	  uint16_t  Mass_ECAS;         // масса тягача через ECAS
	  uint16_t  Mass_est;          // масса тягача
  } Truck;

  struct // Trailer
  {
	  struct
	  {	uint16_t  EmptyMass;        // снаряженная масса прицепа
		uint16_t  K4;
	  } CFG;
	 uint16_t  Mass;           // масса прицепа
	 uint16_t  Cargo;          // груз прицепа
	 uint16_t  Axis_Fz;		   // суммарная нагрузка на оси
  } Trailer;

  struct  // Est Break
  {
     uint16_t   P;
     uint16_t   FP;
     uint32_t   F_Brake;   // тормозная сила
     uint32_t   F_TorqRET; // сила торможения ретардера
     uint32_t   Force;
     int16_t    Ax;
     uint16_t   M;		// текущая масса
     uint32_t   SumM1;
     uint16_t   T1;
     uint16_t   M1;     // средняя масса 1 способ

     uint16_t   Vx_Start;
     uint16_t   Time;
     uint32_t   SumP;
     uint16_t   Press;
     int16_t    Acc;
     uint16_t   M2;

	 uint32_t   SumM2;
	 uint16_t   Num;   // количество замеров
	 uint16_t   Ms;    // средняя масса 2 способ
	 uint16_t   Mass;  // результирующая масса 2 способ
	 uint16_t   BufM[10];
	 uint16_t   Mm;    // масса Mediana
	  uint16_t   BufM2[10];
	  uint16_t   Num2;
	  uint16_t   Ms2;   // средняя масса через буфер

  } Brake;

  struct // Est Engine
  {
	  int32_t    Force; // Force Engine
	  uint32_t   Msum;
	  uint16_t   SumT;
	  uint16_t   M1;    // средняя масса
	  uint16_t   M;		// текущая масса

	  uint16_t   Ax_V;
	  uint16_t   Ax_T;
	  int16_t    Ax;

	  uint16_t   Vx_Start;
	  uint16_t   Time;
	  uint64_t   SumF;
	  uint32_t   Torque;
	  int16_t    Acc;
	  uint16_t   M2;    // масса 2 способ
	  uint32_t   SumM2;
	  uint16_t   Num;   // количество замеров
	  uint16_t   Ms;    // средняя масса 2 способ
	  uint16_t   Mass;  // результирующая масса 2 способ

	  uint16_t   BufM[10];
	  uint16_t   BufM2[10];
	  uint16_t   Num2;
	  uint16_t   Ms2;   // средняя масса через буфер
	  uint16_t   Mm;    // масса Mediana
  } Engine;

  uint16_t  MassEst_Max;
  uint16_t  MassEst_Min;
  uint16_t  TrainEmptyMass;        // снаряженная масса автопоезда
  uint16_t  TrainMass;             // масса автопоезда
  uint16_t  Koef;                  // коеф. загрузки
  uint32_t  K;                     // коеф. загрузки без Empty
  _ByteBits_  Flags;

} TypeDef_Load;

TypeDef_Load  Load;
#define     LoadEst_Flags     Load.Flags.Byte
#define     Brake_M_Oss       Load.Flags.Bits.b0
#define     Engine_Gaz        Load.Flags.Bits.b1
#define     Engine_M1_Cmpl    Load.Flags.Bits.b2
#define     Engine_M_Pro      Load.Flags.Bits.b3

#define     Brake_M1_Cmpl     Load.Flags.Bits.b4
#define     Brake_M_Pro       Load.Flags.Bits.b5
#define     Brake_M_Fail      Load.Flags.Bits.b6
#define     Gear_Shifting     Load.Flags.Bits.b7

typedef struct  // EBL
{
   struct {
	  uint16_t  dP;
	  uint16_t  P0;
	  uint16_t  Slip;
	  uint8_t   Kcor;   //Корекция коэффициента
	  uint16_t  dPump;
	  uint16_t  Vmin;
   } CFG;
   struct {
	   int16_t  CntL;
	   int16_t  CntR;
	   uint16_t P_In;
	   uint16_t Pmin;
	   uint16_t Pdes;
	   uint16_t Pdes_L;
	   uint16_t Pdes_R;
	   uint16_t Pdes_3L;
	   uint16_t Pdes_3R;
	   uint16_t dPpump;
	   uint16_t dP;
	   uint16_t Ppump_L;
	   uint16_t Ppump_R;
	   uint16_t Ppump_3L;
	   uint16_t Ppump_3R;
	   uint16_t P0;

 	   uint16_t RearAxle_LoadMax;
 	   uint16_t Axis3_LoadMax;
	   int16_t  Delay;

	   uint32_t  Koef;	// коеффициент регулятора
	   uint16_t  Ks_L;  // коеффициент коррекции по проскадьзыванию
	   uint16_t  Ks_R;
	   uint16_t  Kabs_L;  // коеффициент коррекции по ABS
	   uint16_t  Kabs_R;
	   int16_t  Slip_RL; // проскальзывание относительно переда
	   int16_t  Slip_RR;
	   uint16_t Koef_Min;
	   uint16_t KFz_R;  // коэффициент изменения реакций при торможении
	   uint16_t P_Hg;  // изменениe  Pdes от  перераспределение  Fz

   } REG;

   TypeDef_Press_Reg  REG_RL;
   TypeDef_Press_Reg  REG_RR;
   TypeDef_Press_Reg  REG_3L;
   TypeDef_Press_Reg  REG_3R;

} TypeDef_EBL;

typedef struct
{
	   uint16_t  Cnt;
	   uint16_t  Pdes;	 // Задание давления
	   uint16_t  TrP;    // зона слежения
	   uint16_t  Ppump;
	   uint16_t  dPpump; // подкачеa давления
	   uint8_t   KL;     // состояние клапанов

	   uint16_t  Ref;
	   int16_t   dSp;
	   int16_t   Delta;
	   int16_t   DeltaF;
	   int32_t   Integrator;
	   int16_t   Diff;
	   int32_t   PID;
	   int16_t   AccBuf[20];
	   _Filtr_Buffer_  Filt_Delta;
	   uint16_t  RefSl;
	   uint8_t   Slip_Fl;
	   uint16_t  Tout;

} TypeDef_ASRB;

#define   __Size_AccBuf		21
#define   __ASRE_Diff_T     20 //100mc

typedef struct
{
   struct {
	   uint16_t  ThrP;    // порог слежения давления
 	   uint16_t  dPump;   // давление подкачки
 	   uint16_t  Slip;
 	   uint16_t  dTaxoLim;

 	   uint16_t  Kpro; // пропорциональная состaвляющая PID регулятора
 	   uint16_t  Kdif; // дифференциальная состaвляющая PID регулятора
 	   uint16_t  KintI; // интегральная состaвляющая увеличения
 	   uint16_t  KintD; // уменьшения
 	   uint16_t  PThrK; // коефф. порога регулятора давления
 	   uint16_t  Kload;
 	   uint16_t  Speed;
 	   uint16_t  BrakeTout;
 	   uint16_t  EngineTout;
 	   uint16_t  Pmax;   //
 	   uint16_t  OnDelay;   //
   } CFG;

   struct {
	   uint16_t  dPump;
	   uint16_t  ThrP;
	   uint16_t  Kload;
	   uint16_t  Pmax;

	   uint16_t  Thr;
	   uint16_t  ThrSl;
	   uint16_t  Tout;

	   TypeDef_ASRB RL;
	   TypeDef_ASRB RR;
	   TypeDef_Press_Reg  REG_RL;
	   TypeDef_Press_Reg  REG_RR;
   } Brake;

   struct {
	   struct {
	 	   uint16_t  Kpro; // пропорциональная состaвляющая PID регулятора
	 	   uint16_t  Kdif; // дифференциальная состaвляющая PID регулятора
	 	   uint16_t  KintI; // интегральная состaвляющая PID регулятора
	 	   uint16_t  KintD;
	 	   uint16_t  Kpress;
	 	   uint8_t   Kgaz;
	   } CFG;
	   uint8_t   Torque;
	   uint16_t  Taxo;
	   uint16_t  KTS;

	   uint16_t  AdjThr;
	   uint16_t  Taxo_1;

	   uint16_t  Slip;
	   uint16_t  Thr;
	   uint16_t  Ref;
	   uint16_t  RefTaxo;

	   int16_t   dSp;
	   int16_t   Delta;
	   int32_t   Integrator;
	   int16_t   Diff;
	   int32_t   PID;
	   uint16_t  Torq_fP;
	   uint16_t  Torq_kP;
	   uint16_t  OffCnt;
	   uint16_t  Delay;  // задержка на установку и снятие Event
	   uint16_t  Tout;
	   uint16_t  SpF_Zcnt; // счетчик нулевой скорости переда

	   _Filtr_Buffer_  Filt_Delta;
	   _Filtr_Buffer_  Filt_Torq;
	   _Filtr_Buffer_  Filt_Taxo;
	   _Filtr_Buffer_  Filt_Ref;
	   _Filtr_Buffer_  Filt_Ref2;
	   int16_t   AccBuf[__Size_AccBuf];

	   uint8_t   Torq_EM1;
	   uint8_t   Torq_EM2;
   } Engine;

   uint16_t  FrontSpeed;
   uint16_t  RearSpeed;
//   uint16_t  FrontKoef;
//   uint16_t  Base;
   uint16_t  FrontBase;
} TypeDef_ASR;

typedef struct{
	struct
	{
	    uint8_t   Pause;
	    uint16_t   Pause_SlipK;
	    uint16_t  SlipExh; // порог проскальзывания выпуска Ph3
	    uint8_t   K_NumP;
	    uint8_t   Recursya;
		uint16_t  MaxAcc;   //порог ускорения колеса 5G
		uint16_t  High_Mu;
	//	uint16_t  Low_Mu;
		uint8_t   K_Slip;
		uint16_t  SpeedOFF;
		uint16_t  SlipOptim; // порог проскальзывания
		uint16_t  SpThr_Con_F; // константа
		uint16_t  SpThr_Con_R;
		uint16_t  SpThr_dPpump_F; // добавка от подкачек
		uint16_t  SpThr_dPpump_R;
		uint16_t  PromSp;
	} CFG;

    uint16_t SpeedOFF;
    uint16_t OffCnt;
    _ByteBits_  _Flags;
    uint16_t   RefSpeed;
//    uint16_t   RefRear;
//    uint16_t   RefFront;
//    uint16_t   RefAxis3;
    uint16_t   RefHigh;
    uint16_t   RefLim;
    struct
    {
        uint16_t   High;
        uint16_t   High_Front;
        uint16_t   High_Rear;
    	uint16_t   Koef;
    	uint16_t   K;
    	uint32_t   SumK;
    	uint16_t   T;
    	uint8_t    Cmpl;
    	uint16_t   Midl;
        uint16_t   Lim;
//        uint16_t   Min;
        uint32_t   Sum;
        uint8_t    N;
    } Base;

#define Util_Buf_Size  3
    struct
    {   uint8_t    Phase;
    	uint16_t   Cnt;
    	uint16_t   SpHigh;
    	uint16_t   SpLow;
    	uint16_t   Time[Util_Buf_Size];
    	uint16_t   Deccel[Util_Buf_Size];
    } Util;
} TypeDef_ABS;

TypeDef_ABS ABS;

#define ABS_Flags        ABS._Flags.Byte
#define ABS_OffRoad      ABS._Flags.Bits.b0
//#define ABS_Rear_Fl      ABS._Flags.Bits.b1
//#define ABS_Front_Active ABS._Flags.Bits.b2
//#define ABS_Rear_Active  ABS._Flags.Bits.b3
//#define ABS_Axis3_Active ABS._Flags.Bits.b4

typedef struct{ // MIR
	struct
	{
	    uint16_t  dP0_L;
	    uint16_t  dP0_R;
	    uint16_t  KdP;
	    uint16_t  dWz;
	    uint16_t  dPmax;
	    uint16_t  ThrdP;   //?
	} CFG;

	uint8_t   Phase;
	uint16_t  Ph_Cnt;
	uint16_t  Time;

	uint16_t  dP;
	uint16_t  dP0;
	uint16_t  CutT;

	uint16_t  Dis_L;  // счетчик акивности ABS
	uint16_t  Dis_R;
	uint16_t  KdP_L; // коеф. соотношения давлений
	uint16_t  KdP_R;
	uint16_t  RegCnt;
    _ByteBits_  Flags;

} TypeDef_MIR;

TypeDef_MIR    MIR_Front;

#define MIR_Front_Flags   MIR_Front.Flags.Byte
#define MIR_Front_Active  MIR_Front.Flags.Bits.b0
#define MIR_Front_Req_L   MIR_Front.Flags.Bits.b1
#define MIR_Front_Req_R   MIR_Front.Flags.Bits.b2
#define MIR_Front_Req     MIR_Front.Flags.Bits.b3
//#define MIR_Front_dWz_L   MIR_Front.Flags.Bits.b4
//#define MIR_Front_dWz_R   MIR_Front.Flags.Bits.b5

TypeDef_MIR    MIR_Rear;

#define MIR_Rear_Flags   MIR_Rear.Flags.Byte
#define MIR_Rear_Active  MIR_Rear.Flags.Bits.b0
#define MIR_Rear_Req_L   MIR_Rear.Flags.Bits.b1
#define MIR_Rear_Req_R   MIR_Rear.Flags.Bits.b2
#define MIR_Rear_Req     MIR_Rear.Flags.Bits.b3
//#define MIR_Rear_dWz_L   MIR_Rear.Flags.Bits.b4
//#define MIR_Rear_dWz_R   MIR_Rear.Flags.Bits.b5

typedef struct
{
	uint8_t   Cnt;
	uint8_t   Phase;
	uint8_t   Value;
	uint16_t  Tout;
	uint16_t  Taxo;
	uint16_t  KTS;//KoefTaxoSpeed;
	uint16_t  TSC_Taxo;
	uint8_t   Fl;
} TorqueTypeDef;

typedef struct  // --- ROPBrake ----
{
	struct // CFG
    {
	   uint16_t  Slip;
	   uint16_t  dPpump; // ограничение давления подкачки
	   uint16_t  dPexh;  // ограничение давления выпуска

    } CFG;
	   uint8_t   Phase; //
	   int16_t   Axm;
	   uint16_t  SpThr;
	   uint16_t  Vref;
   	   uint16_t  Time;
	   uint16_t  Pmax;
	   uint16_t  Po;
	   uint8_t   DifOn;
	   uint16_t  Ph3_dP;
	   uint8_t   Poff; //флаг выхода по давлению

} ROPBrakeTypeDef;

typedef struct // --- ROP ----
{
    struct // CFG
    {
	   uint16_t  PoF;      // начальное давлениe
       uint16_t  PoR;      // начальное давлениe
       uint16_t  Po3A;     // начальное давлениe
	   uint16_t  PmaxF;
	   uint16_t  PmaxR;
	   uint16_t  Pmax3A;

       uint8_t   Tcut;     // длительность отсечки
       uint8_t   K_dPexh;

       uint16_t  SlipN;

   	   uint16_t  ThrAyON;
   	   uint8_t   ThrON_SpK;
   	   uint8_t   ThrON_dAyK;
   	   uint8_t   ThrON_LoadK;
       uint16_t  AyNorm;
       uint16_t  VxR20mLaden;
       uint16_t  VxR20mEmpty;
       uint16_t  AccXdes;

       uint8_t   Kgaz;
       uint16_t  EngKi;
       uint8_t   TorqueMin;
       uint16_t  VxPh3;   // порог скорости перехода в Ph3
       uint16_t  SpeedON;
       uint16_t  EngON_dAy;
       uint16_t  EngOFF_dAy;

       uint8_t   K_PmaxVx;
       uint8_t   K1F;
       uint8_t   K1R;
       uint16_t  dPo;
       uint8_t   K3;
       uint16_t  Ay_OffSet;
       uint16_t  dPdif;
       uint16_t  Turn_OO;

    } CFG;

    ROPBrakeTypeDef BrakeF;
    ROPBrakeTypeDef BrakeR;
    ROPBrakeTypeDef Brake3;

    struct  // Brake
    {
   	   uint16_t  SpeedOFF;
   	   uint16_t  Tout;
   	   uint32_t   VxVx;
   	   uint16_t  VxEnd;
   	   uint16_t  Time;
	   uint16_t  VxPh3;
	   uint16_t   AyEnd;
	   uint16_t  dP_Vx;
	   uint16_t  VxR20;

    } Brake;

    struct // Engine
    {
       uint16_t  Torque;
       uint16_t  Taxo;
       uint8_t   Driver;
       uint16_t  KTS;
       uint16_t  ON_AccY;
       uint16_t  OFF_AccY;
       uint8_t   TorgMax;
       uint8_t   ONcnt;
       int32_t   Int;    // интегратор регулятора
       uint8_t   Phase;
       uint16_t  Speed;
       uint16_t  OFFcnt;
    } Engine;

	struct
	{  int16_t   Teta;
	   int16_t   SinTeta;
	   uint16_t  Radius;
	   int16_t   Curvature;
	   uint16_t  VxEnd;
	} Turn;

	struct
	{ int16_t   ThrAyD; // значение AccY_OzD в конце тормозов
	  int16_t   ThrAdd; // добавка при деактивации ROP_Break
	  int16_t   dAyD;   // порог зависит от ускорения AccY_OzD
	  int16_t   Sp;     // порог зависит от скорости автомобиля
	  int16_t   dAyL;
	} ON;

	int16_t   AccY_OzD;  // AccY через OmegaZ_Des
	int16_t   AyMax;     // максимальная AccY при ROP_Active
	uint16_t  Speed;
	int16_t   ON_AccY;
	int16_t   OFF_AccY;
	int16_t   ON_ThrAdd; // добавка при деактивации ROP_Break
	int16_t   OFF_Cnt;
    uint16_t  Pdif_F;
    uint16_t  Pdif_R;
    uint16_t  Pdif_3A;
    uint16_t  dPdif;
	int16_t   AccY_Wz;
	int16_t   Ay_OffSet;

	uint16_t  Fail_Cnt;

} ROPTypeDef;

uint16_t  Turn_Radius_MC2;
int16_t   ROP_AccY_OzD_MC2;
typedef struct  // --- DYC ----
{
    struct  //CFG
    {   struct
        {  uint8_t   DerWz;
           uint16_t  AyOn;
           uint8_t   Kakk;
     	   uint16_t  dWzON;
           uint16_t  PD_Thr;
         } UnSt;
        struct
        {
           uint16_t  PD_Thr;
        } OvSt;
        struct
        { uint8_t   DragMax;
    	  uint8_t   DragMin;
        } Eng;
        uint16_t   PumpSetF;  // ограничение давления подкачки
        uint16_t   PumpSetR;
        uint16_t   TcutSet;
 //       uint16_t  SlipF;
 //       uint16_t  SlipR;
        uint16_t  dWzLim;
        uint16_t  YawBias;
        uint8_t   PD_Kpro;
        uint8_t   PD_Kdif;
        uint16_t  Dif_PoF;  // начальное давление диф.кл. перед
        uint16_t  Dif_PoR;  // начальное давление диф.кл. зад
        uint16_t  Dif_dP;   // зона регулирования давления
        uint16_t  Poff;     // давлениe тормоза отключения DYC
    } CFG;

    struct
    { uint16_t WzThr;
      int16_t  PDOut;
      uint16_t AkThr;
 //     uint16_t Delay;
    } UnSt;

    struct
    {
 //     int16_t  WzLim; //*не используется
      int16_t  PDOut;
 //     uint16_t Delay; // Задержка OvSt после UnSt  *не используется
      uint16_t WzThr;   // порог для OmegaZ
      uint16_t  Act_Cnt; // задержка сброса DYC_OvSt_Active
    } OvSt;

    struct // Engine
    { uint16_t  TimeOut;
      uint16_t  ThrON;
      uint16_t  ThrOFF;
      uint8_t   Poss;  // флаг возможен Drag
    } Drag;

    struct // Engine
    { int32_t   Int;    // интегратор регулятора
      uint16_t  OFFcnt;
    } Engine;

    uint16_t  Delay;    //задержка после ROP_BreakActive
    uint16_t  Pdif_F;
    uint16_t  Pdif_R;
    uint16_t  Pdif_3A;
    uint16_t  dPdif;
    uint16_t  Ppuls_F;
    uint16_t  Ppuls_R;
    int32_t   PD_Pro;
    int32_t   PD_Dif;
    int32_t   PD_Out;

    uint16_t  Fail_Cnt;

} DYCTypeDef;

typedef struct // --- SSC ----
{
    struct // CFG
    { uint16_t  dWz_SA;  // порог уменьшения угла бокового скольжения
      uint16_t  Thr_SA;  // порог
      uint16_t  Ktg_Koef;// кэффициет уменьшения веса Omega_Z в угле
    } CFG;
    uint8_t   Cnt;
    int32_t    Ktg_aWz;
    int32_t    Ktg_bWz;
	int32_t    OmegaZ_Ktg;
} SSCTypeDef;

/* Private Macros -----------------------------------------------------------*/
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

/* Exported constants --------------------------------------------------------*/
// зависимость потерь от оборотов ЯМЗ-5344
// 700 1000 1500 2000  об/мин
// 9    9	 15   28    %
#define __Taxo_P4  0x1F40  //1000rpm *8
#define __Taxo_XX  0x1770  //750rpm
#define __Taxo_P1  0x2EE0  //1500rpm *8
#define __Taxo_P2  0x4330  //2150rpm

#define __ABS_Phase0   0
#define __ABS_Phase1   1
#define __ABS_Phase2   2
#define __ABS_Phase3   3
#define __ABS_Phase4   4
#define __ABS_Phase5   5
#define __ABS_Phase6   6
#define __ABS_Phase7   7
#define __ABS_Phase8   8

#define __MIR_Phase0   0
#define __MIR_PhaseL   1
#define __MIR_PhaseR   2
//#define __MIR_Phase3   3

#define __ASR_Phase0   0
#define __ASR_Phase1   1
#define __ASR_Phase2   2
#define __ASR_Phase3   3

//#define   __Pump_Tmin      8   // минимальное время подкачки CFG
//#define   __Pause_Time     70  // 0.0070c
#define   __DYC_ON_Speed   0x0A00U
#define   __DYC_OFF_Speed  0x0800U
/* End of exported constants ------------------------------------------------*/

/* ---------------Exported functions ----------------------------------------*/
void     Press_Control(WheelTypeDef* Wheelx, TypeDef_Press_Reg* REG) myCode;

void     XBR_Press_Control(void) myCode;
void     Set_Press_Desired(uint16_t Pdes) myCode;

void     DBR_Regulate(void) myCode;
void     EBL_Regulate(void) myCode;
void     EBL_Brake_NU (WheelTypeDef* Wheelx, TypeDef_Press_Reg* REG) myCode;
void     EBL_IR(WheelTypeDef* Wheelx, TypeDef_Press_Reg* REG) myCode;
void     EBL_Press_Control(void) myCode;

void     ASR_Regulate(void) myCode;
void     ASR_Engine_Regulate(void) myCode;
void     ASR_Brake_Regulate(void) myCode;
void     ASR_Brake_Abort(void) myCode;
//void     ASR_Brake_NU(TypeDef_ASRB* XX) myCode;
void     ASR_Brake_NU (TypeDef_Press_Reg* REG) myCode;
void     ASR_Press_Control(void) myCode;
void     ASR_Brake_PID(TypeDef_ASRB* ASRB_XX) myCode;

void     DIA_MDT_Oss(void) myCode;
void     DIA_MDT_Oss6(void) myCode;
void     Modulator_Test(void) myCode;
void     MDT_Abort(void) myCode;
void     MDT_Delay(WheelTypeDef* WheelXX, uint8_t EV, uint8_t AV) myCode;
void     MDT_Switch (WheelTypeDef* WheelXX, uint8_t EV, uint8_t AV) myCode;
//void     MDT_Control_DZ(void) myCode;

_MOD_Err_   Error_MDT (WheelTypeDef* WheelXX) myCode;
void     Analysis_MDT (WheelTypeDef* WheelXX) myCode;
void     MDT_Results_ADC (void) myCode;
void     MDT_Check_Error (void) myCode;
_DIF_Err_   Error_Dif (DifTypeDef* Dif) myCode;
void     Analysis_Dif (DifTypeDef* Dif) myCode;

void     LowSide_Switch (void) myCode;
void     LowSide_Impuls (void) myCode;
void     LSSw_Test_Impuls (LSSwTypeDef* Sw) myCode;
void     LSSw_Test_Analysis (LSSwTypeDef* Sw) myCode;
void     GNDsw_Test_Analysis (LSSwTypeDef* Sw) myCode;
_LSSw_Err_  LSSw_Errors (LSSwTypeDef* Sw) myCode;
void     BSP75_WL_OnOff (void) myCode;
void     BSP75_DBR_OnOff (void) myCode;
void     BTS142_GNDF_OnOff (void) myCode;
void     BSP75_LASR_OnOff (void) myCode;
void     BTS142_GNDR_OnOff (void) myCode;
void     DIA_LSSw_Oss(void) myCode;

void     ROP_EngineChangePhase (void) myCode;
void     ROP_Engine_Regulate (void) myCode;
void     Engine_Torque_Control(void) myCode;
void     Retarder_Torque_Control(void) myCode;

void     TorqueDrag_Activate(void) myCode;
void     TorqueLim_Activate(void) myCode;

void     RollOverProtection(void) myCode;
void     ROP_Press_Regulate (void) myCode;
void     ROP_Pump (WheelTypeDef* WheelXX, uint16_t P) myCode;
void     ROP_Exh  (WheelTypeDef* WheelXX, uint16_t dP) myCode;
void     ROP_Phase0 (WheelTypeDef* Wheel_Ws, WheelTypeDef* Wheel_Wm,
		             ROPBrakeTypeDef* ROPBrakeA) myCode;
void     ROP_Phase1 (WheelTypeDef* Wheel_Ws, WheelTypeDef* Wheel_Wm,
		             ROPBrakeTypeDef* ROPBrakeA) myCode;
void     ROP_Phase2 (WheelTypeDef* Wheel_Ws, WheelTypeDef* Wheel_Wm,
		             ROPBrakeTypeDef* ROPBrakeA) myCode;
void     ROP_Phase3 (WheelTypeDef* Wheel_Ws, WheelTypeDef* Wheel_Wm,
		             ROPBrakeTypeDef* ROPBrakeA) myCode;
void     ROP_Phase4 (WheelTypeDef* Wheel_Ws, WheelTypeDef* Wheel_Wm,
                     ROPBrakeTypeDef* ROPBrakeA) myCode;
void     ROP_SpThr (ROPBrakeTypeDef* ROPBrakeA, WheelTypeDef* Wheel_XX) myCode;
void     ROP_TimeAx (ROPBrakeTypeDef* ROPBrakeA, WheelTypeDef* Wheel_XX) myCode;
uint8_t  ROP_CheckActivate(int16_t AyThr) myCode;

void     SideSlip_Estimate(void) myCode;
void     SideSlip_Control(void) myCode;
uint8_t  DYC_Break_Activate(WheelTypeDef* Wheel_XX) myCode;
uint8_t  DYC_Break_DeActivate(WheelTypeDef* Wheel_XX) myCode;
void     Direct_Yaw_Control (void) myCode;
void     TrailerVDC(void) myCode;

void     ABS_Regulate(void) myCode;
uint8_t  ABS_Searching(WheelTypeDef* Wheelx) myCode;
void     ABS_Base(WheelTypeDef* Wheelx) myCode;
void     ABS_Press_Control(void) myCode;
void     ABS_IR(WheelTypeDef* Wheelx) myCode;
void     ABS_MIR_Front(void) myCode;
void     ABS_MIRF_Phase0(void) myCode;
void     ABS_MIRF_Phase1(WheelTypeDef* WheelM, WheelTypeDef* WheelS) myCode;
void     ABS_MIRF_Phase3(WheelTypeDef* WheelM, WheelTypeDef* WheelS) myCode;
uint8_t  ABS_MIRF_Searching(WheelTypeDef* WheelM, WheelTypeDef* WheelS) myCode;
void     ABS_MIR_Rear(void) myCode;
void     ABS_MIR_Axis3(void) myCode;
void     ABS_MIRR_ABSF (WheelTypeDef* Wheelx) myCode;
void     ABS_MIRR_ABSR (WheelTypeDef* Wheelx) myCode;
void     ABS_MIRR_TAI (WheelTypeDef* WheelF, WheelTypeDef* WheelR) myCode;
void     ABS_MIRR_Phase0(void) myCode;
void     ABS_MIRR_Phase1(WheelTypeDef* WheelM, WheelTypeDef* WheelS) myCode;
void     ABS_MIRR_Phase2(WheelTypeDef* WheelM, WheelTypeDef* WheelS) myCode;

void     ABS_BreakCondition(WheelTypeDef* Wheelx) myCode;
void     ABS_SpeedThresh(WheelTypeDef* Wheelx) myCode;
void     ABS_Pause(WheelTypeDef* Wheelx) myCode;
void     ABS_Phase0(WheelTypeDef* Wheelx) myCode;
void     ABS_Phase1(WheelTypeDef* Wheelx) myCode;
void     ABS_Phase2(WheelTypeDef* Wheelx) myCode;
void     ABS_Phase3(WheelTypeDef* Wheelx) myCode;
void     ABS_Phase4(WheelTypeDef* Wheelx) myCode;
void     ABS_Phase5(WheelTypeDef* Wheelx) myCode;
void     ABS_Phase6(WheelTypeDef* Wheelx) myCode;
void     ABS_Phase7(WheelTypeDef* Wheelx) myCode;
void     ABS_Phase8(WheelTypeDef* Wheelx) myCode;
void     ABS_Ph2_Set(WheelTypeDef* Wheelx) myCode;
void     ABS_Ph4_Set(WheelTypeDef* Wheelx) myCode;
void     ABS_Ph5_Set(WheelTypeDef* Wheelx) myCode;
void     ABS_Ph4_dPa(WheelTypeDef* Wheelx) myCode;
void     ABS_MIR_DSC(WheelTypeDef* Wheelx) myCode;
uint8_t  ABS_Wheel_Lock(WheelTypeDef* Wheelx) myCode;
uint8_t  Check_Pump(WheelTypeDef* Wheelx) myCode;

uint8_t  DifKL_Regulate (DifTypeDef* Dif) myCode;
void     Puls_Press (WheelTypeDef* WheelXX) myCode;
uint16_t Pump_dP (WheelTypeDef* Wheelx) myCode;
uint16_t PumpSet_Diag(void) myCode;

void     Switch_Valve (void) myCode;
void     VDC_Flags (void) myCode;
void     Stop_Light(void) myCode;
void     Hill_Holder_Control (void) myCode;
void     Halt_Brake_Control (void) myCode;
void     XBR_Control (void) myCode;
uint8_t  Check_Safe(WheelTypeDef* Wheelx) myCode;

void     Brake_Asist_Control(void) myCode;

void     Base_Sum (WheelTypeDef* Wheelx) myCode;
void     Base_High (WheelTypeDef* Wheelx) myCode;
uint16_t Ref_High (WheelTypeDef* Wheelx) myCode;
void     Failure_ABS (WheelTypeDef* Wheelx) myCode;

void     Limitation_Speed(void) myCode;
void     Proportion_Valve(void) myCode;
void     PK_Abort(void) myCode;
void     Analysis_Test_PK (void) myCode;
_DIF_Err_ Error_PK (void) myCode;

extern uint16_t  Torque_Press (WheelTypeDef* Wheelx);

_ByteBits_  _EBL_Flags;
#define     EBL_Flags        _EBL_Flags.Byte
#define     EBL_SleepL       _EBL_Flags.Bits.b0
#define     EBL_SleepR       _EBL_Flags.Bits.b1
#define     EBL_Sleep3L      _EBL_Flags.Bits.b2
#define     EBL_Sleep3R      _EBL_Flags.Bits.b3
#define     EBL_High_Press   _EBL_Flags.Bits.b4
#define     EBL_ABS_L        _EBL_Flags.Bits.b5
#define     EBL_ABS_R        _EBL_Flags.Bits.b6
//#define     EBL_Tout         _EBL_Flags.Bits.b6	//*not
#define     EBL_Disable      _EBL_Flags.Bits.b7

_ByteBits_  _ASR_Flags;
#define     ASR_Flags        _ASR_Flags.Byte
#define     ASR_KTS_Adj      _ASR_Flags.Bits.b0
#define     ASR_Brake_Left   _ASR_Flags.Bits.b1
#define     ASR_Brake_Right  _ASR_Flags.Bits.b2
#define     ASR_Engine_Event _ASR_Flags.Bits.b3
#define     ASR_Brake_Tout   _ASR_Flags.Bits.b4
#define     ASR_Engine_Tout  _ASR_Flags.Bits.b5
#define     ASR_TCO_Disable  _ASR_Flags.Bits.b6
#define     ASR_Disable      _ASR_Flags.Bits.b7

_ByteBits_ _KL_Status_XBR;
#define     XBR_KL_Status1   _KL_Status_XBR.Byte
#define     XBR_AV_FL        _KL_Status_XBR.Bits.b0
#define     XBR_EV_FL        _KL_Status_XBR.Bits.b1
#define     XBR_AV_FR        _KL_Status_XBR.Bits.b2
#define     XBR_EV_FR        _KL_Status_XBR.Bits.b3
#define     XBR_AV_RL        _KL_Status_XBR.Bits.b4
#define     XBR_EV_RL        _KL_Status_XBR.Bits.b5
#define     XBR_AV_RR        _KL_Status_XBR.Bits.b6
#define     XBR_EV_RR        _KL_Status_XBR.Bits.b7
_ByteBits_ _KL_Status_XBR2;
#define     XBR_KL_Status2   _KL_Status_XBR2.Byte
#define     XBR_AV_M4        _KL_Status_XBR2.Bits.b0
#define     XBR_EV_M4        _KL_Status_XBR2.Bits.b1
#define     XBR_AV_M5        _KL_Status_XBR2.Bits.b2
#define     XBR_EV_M5        _KL_Status_XBR2.Bits.b3
#define     XBR_Dif_Rear     _KL_Status_XBR2.Bits.b4
#define     XBR_Dif_Front    _KL_Status_XBR2.Bits.b5
#define     XBR_EV_MT        _KL_Status_XBR2.Bits.b6  // - отсечка
#define     XBR_AV_MT        _KL_Status_XBR2.Bits.b7  //  - выпуск
#define     XBR_Dif_Trailer  XBR_AV_MT // конфигурация прицепа диф.клапан
#define _XBR_Front_Exh  0x0F
#define _XBR_Rear_Exh   0xF0

_ByteBits_ _KL_Status_ABS;
#define     ABS_KL_Status1   _KL_Status_ABS.Byte
#define     ABS_AV_FL        _KL_Status_ABS.Bits.b0
#define     ABS_EV_FL        _KL_Status_ABS.Bits.b1
#define     ABS_AV_FR        _KL_Status_ABS.Bits.b2
#define     ABS_EV_FR        _KL_Status_ABS.Bits.b3
#define     ABS_AV_RL        _KL_Status_ABS.Bits.b4
#define     ABS_EV_RL        _KL_Status_ABS.Bits.b5
#define     ABS_AV_RR        _KL_Status_ABS.Bits.b6
#define     ABS_EV_RR        _KL_Status_ABS.Bits.b7
_ByteBits_ _KL_Status_ABS2;
#define     ABS_KL_Status2   _KL_Status_ABS2.Byte
#define     ABS_AV_3L        _KL_Status_ABS2.Bits.b0
#define     ABS_EV_3L        _KL_Status_ABS2.Bits.b1
#define     ABS_AV_3R        _KL_Status_ABS2.Bits.b2
#define     ABS_EV_3R        _KL_Status_ABS2.Bits.b3
#define     ABS_Dif_Rear     _KL_Status_ABS2.Bits.b4
#define     ABS_Dif_Front    _KL_Status_ABS2.Bits.b5
#define     ABS_EV_MT        _KL_Status_ABS2.Bits.b6  // - отсечка
#define     ABS_AV_MT        _KL_Status_ABS2.Bits.b7  //  - выпуск
#define     ABS_Dif_Axis3    ABS_EV_MT
#define     ABS_Dif_Trailer  ABS_AV_MT // конфигурация прицепа диф.клапан

_ByteBits_ _KL_Status_ASR;
#define     ASR_KL_Status1   _KL_Status_ASR.Byte
#define     ASR_AV_FL        _KL_Status_ASR.Bits.b0
#define     ASR_EV_FL        _KL_Status_ASR.Bits.b1
#define     ASR_AV_FR        _KL_Status_ASR.Bits.b2
#define     ASR_EV_FR        _KL_Status_ASR.Bits.b3
#define     ASR_AV_RL        _KL_Status_ASR.Bits.b4
#define     ASR_EV_RL        _KL_Status_ASR.Bits.b5
#define     ASR_AV_RR        _KL_Status_ASR.Bits.b6
#define     ASR_EV_RR        _KL_Status_ASR.Bits.b7
_ByteBits_ _KL_Status_ASR2;
#define     ASR_KL_Status2   _KL_Status_ASR2.Byte
#define     ASR_AV_3L        _KL_Status_ASR2.Bits.b0
#define     ASR_EV_3L        _KL_Status_ASR2.Bits.b1
#define     ASR_AV_3R        _KL_Status_ASR2.Bits.b2
#define     ASR_EV_3R        _KL_Status_ASR2.Bits.b3
#define     ASR_Dif_Rear     _KL_Status_ASR2.Bits.b4
#define     ASR_Dif_Front    _KL_Status_ASR2.Bits.b5
#define     ASR_EV_MT        _KL_Status_ASR2.Bits.b6  // - отсечка
#define     ASR_AV_MT        _KL_Status_ASR2.Bits.b7  //  - выпуск
#define     ASR_Dif_Axis3    ASR_EV_MT
#define     ASR_Dif_Trailer  ASR_AV_MT // конфигурация прицепа диф.клапан

_ByteBits_ _KL_Status_DSC;
#define     DSC_KL_Status1   _KL_Status_DSC.Byte
#define     DSC_AV_FL        _KL_Status_DSC.Bits.b0
#define     DSC_EV_FL        _KL_Status_DSC.Bits.b1
#define     DSC_AV_FR        _KL_Status_DSC.Bits.b2
#define     DSC_EV_FR        _KL_Status_DSC.Bits.b3
#define     DSC_AV_RL        _KL_Status_DSC.Bits.b4
#define     DSC_EV_RL        _KL_Status_DSC.Bits.b5
#define     DSC_AV_RR        _KL_Status_DSC.Bits.b6
#define     DSC_EV_RR        _KL_Status_DSC.Bits.b7

// EV_FR=1 AV_FR=0 EV_FL=1 AV_FL=0
#define _ModFL_ModFR_Cut  0x0A
#define _ModRL_ModRR_Cut  0xA0
#define _Mods_Front_Mask  0x0F
#define _Mods_Rear_Mask   0xF0

_ByteBits_ _KL_Status_DSC2;
#define     DSC_KL_Status2   _KL_Status_DSC2.Byte
#define     DSC_AV_3L        _KL_Status_DSC2.Bits.b0
#define     DSC_EV_3L        _KL_Status_DSC2.Bits.b1
#define     DSC_AV_3R        _KL_Status_DSC2.Bits.b2
#define     DSC_EV_3R        _KL_Status_DSC2.Bits.b3
#define     DSC_Dif_Rear     _KL_Status_DSC2.Bits.b4
#define     DSC_Dif_Front    _KL_Status_DSC2.Bits.b5
#define     DSC_EV_MT        _KL_Status_DSC2.Bits.b6  // - отсечка
#define     DSC_AV_MT        _KL_Status_DSC2.Bits.b7  //  - выпуск
#define     DSC_Dif_Axis3    DSC_EV_MT
#define     DSC_Dif_Trailer  DSC_AV_MT // конфигурация прицепа диф.клапан

_ByteBits_ _KL_Status_EBL;
#define     EBL_KL_Status    _KL_Status_EBL.Byte
#define     EBL_AV_FL        _KL_Status_EBL.Bits.b0
#define     EBL_EV_FL        _KL_Status_EBL.Bits.b1
#define     EBL_AV_FR        _KL_Status_EBL.Bits.b2
#define     EBL_EV_FR        _KL_Status_EBL.Bits.b3   //Cut
#define     EBL_AV_RL        _KL_Status_EBL.Bits.b4
#define     EBL_EV_RL        _KL_Status_EBL.Bits.b5
#define     EBL_AV_RR        _KL_Status_EBL.Bits.b6
#define     EBL_EV_RR        _KL_Status_EBL.Bits.b7

_ByteBits_ _KL_Status_EBL2;
#define     EBL_KL_Status2   _KL_Status_EBL2.Byte
#define     EBL_AV_3L        _KL_Status_EBL2.Bits.b0
#define     EBL_EV_3L        _KL_Status_EBL2.Bits.b1
#define     EBL_AV_3R        _KL_Status_EBL2.Bits.b2
#define     EBL_EV_3R        _KL_Status_EBL2.Bits.b3   //Cut

_ByteBits_  _ROP_Flags;
#define     ROP_Flags         _ROP_Flags.Byte
#define     ROP_AccX_Max      _ROP_Flags.Bits.b0 //
#define     ROP_Tilting       _ROP_Flags.Bits.b1 //
#define     ROP_Event         _ROP_Flags.Bits.b2 //
#define     ROP_ThrOnAdd      _ROP_Flags.Bits.b3 //

_ByteBits_  _DYC_Situation;
#define     DYC_Situation     _DYC_Situation.Byte
#define     DYC_UnSt_Active   _DYC_Situation.Bits.b0 //
#define     DYC_negWz_UnSt    _DYC_Situation.Bits.b1 //
#define     DYC_pozWz_UnSt    _DYC_Situation.Bits.b2 //
#define     DYC_OvSt_Active   _DYC_Situation.Bits.b3 //
#define     DYC_negWz_OvSt    _DYC_Situation.Bits.b4 //
#define     DYC_pozWz_OvSt    _DYC_Situation.Bits.b5 //
#define     DYC_negWz_SSA     _DYC_Situation.Bits.b6 //
#define     DYC_pozWz_SSA     _DYC_Situation.Bits.b7 //
#define     __DYC_Situation_Rear  0x07
#define     __DYC_Situation_Front 0xF8

_ByteBits_  _VDC_Engine_Flags;
#define     VDC_Engine_Flags  _VDC_Engine_Flags.Byte
#define     DYC_Engine_Event  _VDC_Engine_Flags.Bits.b0 //
#define     ROP_Engine_Event  _VDC_Engine_Flags.Bits.b1 //
#define     ROP_EngAfterBrake _VDC_Engine_Flags.Bits.b2 //
#define     ROP_ASR           _VDC_Engine_Flags.Bits.b3 //
#define     DYC_ASR           _VDC_Engine_Flags.Bits.b4 //
#define     DYC_Engine_Enable _VDC_Engine_Flags.Bits.b5 //
#define     Engine_AccY_High  _VDC_Engine_Flags.Bits.b6 //
#define     EngineActive      _VDC_Engine_Flags.Bits.b7 //

typedef struct {
	_ByteBits_  Fl;
	_ByteBits_  Fl2;
 	uint16_t    Cnt;
	uint8_t     Phase;
	uint8_t     ISO_N;
	uint8_t     SpZ_Cnt;
	uint16_t    Delay;
	uint16_t    Pdes;
	uint16_t    dPpump;
	uint16_t    dPexh;
 	uint16_t    Cnt2;
 	uint16_t    CntP;

 	struct
	{ uint8_t     Sel;
 	  uint16_t    Cnt;
 	  uint16_t    Delay;
 	  uint16_t    NC_Level;
 	  uint16_t    SC_Level;
 	  uint16_t    SB_Level;

 	  uint16_t    NC_Level1_H;
 	  uint16_t    NC_Level2_H;
 	  uint16_t    NC_Level3_H;
 	  uint16_t    NC_Level4_H;
 	  uint16_t    NC_Level1_L;
 	  uint16_t    NC_Level2_L;
 	  uint16_t    NC_Level3_L;
 	  uint16_t    NC_Level4_L;

 	  uint16_t    SC2_Level;

	  uint16_t    SB_Level1_H;
 	  uint16_t    SB_Level1_L;
 	  uint16_t    SB_Level2_H;
 	  uint16_t    SB_Level2_L;
 	  uint16_t    SB_Level3_H;

	  uint8_t     On;
	  uint8_t     Repeat;
 	} Sw;
 	uint16_t    U_Sila;
} TypeDef_MDT;

TypeDef_MDT MDT;

//  MDT флаги
#define     MDT_Flags        MDT.Fl.Byte
#define     MDT_Req_Fl       MDT.Fl.Bits.b0
#define     MDT_Pro_Fl       MDT.Fl.Bits.b1 // Активен звуковой тест (стукалки)
#define     ISO_Fl           MDT.Fl.Bits.b2
#define     MDT_Stair_Req    MDT.Fl.Bits.b3  // ступень
#define     Pneum_Req_Fl     MDT.Fl.Bits.b4
#define     BTS142_GND_On    MDT.Fl.Bits.b5
#define     MDT_Valve_Fl     MDT.Fl.Bits.b6 // Электрический тест клапанов
#define     MDT_Active       MDT.Fl.Bits.b7
#define     MDT_Off_mask1   0xE0 //без MDT_Valve_Fl и MDT_Active

#define     MDT_Flags2       MDT.Fl2.Byte
#define     MDT_Cmpl_Fl      MDT.Fl2.Bits.b0
#define     MDT_Abort_Fl     MDT.Fl2.Bits.b1
#define     BrakePed_Req_Fl  MDT.Fl2.Bits.b2
#define     BrakePed_Pro_Fl  MDT.Fl2.Bits.b3
#define     BrakeDif_Req_Fl  MDT.Fl2.Bits.b4
#define     BrakeDif_Pro_Fl  MDT.Fl2.Bits.b5
#define     Test_GND_Active  MDT.Fl2.Bits.b7
#define     MDT_Off_mask2   0x83 //Test_GND_Active MDT_Cmpl_Fl и MDT_Abort_Fl


typedef struct
{   struct
	{
	  uint16_t  Cnt;
	  uint16_t  NC_Level;
	  uint16_t  SC_Level;
	  uint16_t  SB_Level;
	  uint16_t  Delay;
	} Test;
	uint16_t  U_bat;
	uint16_t  BlocOn_Cnt;
	uint16_t  OffRoad_Cnt;
	uint16_t  LASR_Cnt;
} TypeDef_LSSw;

// EV - отсечка
// AV - выпуск

_ByteBits_  _MDT_KL;
#define     MDT_KL           _MDT_KL.Byte
#define     MDT_AV_FL        _MDT_KL.Bits.b0   // Exh
#define     MDT_EV_FL        _MDT_KL.Bits.b1   // Cut
#define     MDT_AV_FR        _MDT_KL.Bits.b2
#define     MDT_EV_FR        _MDT_KL.Bits.b3
#define     MDT_AV_RL        _MDT_KL.Bits.b4   // Exh
#define     MDT_EV_RL        _MDT_KL.Bits.b5   // Cut
#define     MDT_AV_RR        _MDT_KL.Bits.b6
#define     MDT_EV_RR        _MDT_KL.Bits.b7
_ByteBits_  _MDT_KL2;
#define     MDT_KL2          _MDT_KL2.Byte
#define     MDT_AV_3L        _MDT_KL2.Bits.b0   // Exh
#define     MDT_EV_3L        _MDT_KL2.Bits.b1   // Cut
#define     MDT_AV_3R        _MDT_KL2.Bits.b2
#define     MDT_EV_3R        _MDT_KL2.Bits.b3
#define     MDT_Dif_R        _MDT_KL2.Bits.b4
#define     MDT_Dif_F        _MDT_KL2.Bits.b5
#define     MDT_EVT          _MDT_KL2.Bits.b6
#define     MDT_AVT          _MDT_KL2.Bits.b7
#define     MDT_Dif_T        MDT_AVT // конфигурация прицепа диф.клапа
#define     MDT_PK           MDT_EVT

/* End of exported functions -------------------------------------------------*/

#endif /* __MY_FUNC_H */
