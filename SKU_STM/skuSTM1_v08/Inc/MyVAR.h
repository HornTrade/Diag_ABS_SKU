/*
  * MyVAR.h
  ******************************************************************************
  * @brief   Header file of  module.
  * @author  Burdykin
  * Created on: 20.02.2022 г.
  *
  * @attention
  * last modified	20.02.2022 г.
  ******************************************************************************
  */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MY_VAR_H
#define __MY_VAR_H

/* -------------------Exported types -----------------------------------------*/
typedef  union {
      uint8_t Byte;
  struct {
	  uint8_t Gap_Fail:1;
	  uint8_t Short_Bat:1;
	  uint8_t Short_Gnd:1;
	  uint8_t Cut_Sens:1;
	  uint8_t Short_Sens:1;
	  uint8_t Speed_Zero:1;
	  uint8_t Wrong_Speed:1;
	  uint8_t Wrong_T:1;
    } Bits;
} _SS_Err0_;

typedef  union {
      uint8_t Byte;
  struct {
	  uint8_t Tire_Fail:1;
	  uint8_t Rack_Fail:1;
	  uint8_t Whip_Fail:1;
	  uint8_t Mod_TimeOut:1;
	  uint8_t Flop_Fail:1;
    } Bits;
} _SS_Err1_;

typedef  union {
     uint16_t Word;
  struct {
   	  uint8_t Gap_Fail:1;
   	  uint8_t Short_Bat:1;
   	  uint8_t Short_Gnd:1;
   	  uint8_t Cut_Sens:1;
   	  uint8_t Short_Sens:1;
   	  uint8_t Speed_Zero:1;
   	  uint8_t Wrong_Speed:1;
   	  uint8_t Wrong_T:1;

	  uint8_t Tire_Fail:1;
	  uint8_t Rack_Fail:1;
	  uint8_t Whip_Fail:1;
	  uint8_t Mod_TimeOut:1;
	  uint8_t Flop_Fail:1;;
	  uint8_t b13:1;
	  uint8_t b14:1;
	  uint8_t b15:1;
    } Bits;
} _SS_Err_;

// неисправности не дающие сигнала датчика
#define  __Mask_Err_ZeroSp  0x001F

#define  __Mask_Tire_Fail   0xFEFF

typedef  union {
      uint16_t Word;
  struct {
	  uint8_t NC_GND:1;
	  uint8_t SCV:1;
	  uint8_t SB_AV:1;
	  uint8_t SB_EV:1;
	  uint8_t NC_AV:1;
	  uint8_t NC_EV:1;
	  uint8_t SC_AV:1;
	  uint8_t SC_EV:1;

	  uint8_t TimeOut:1;
	  uint8_t ERR_Ton:1;
	  uint8_t ERR_Com:1;
	  uint8_t SC_Mod_Mod:1;
	  uint8_t b13:1;
	  uint8_t b14:1;
	  uint8_t b15:1;
    } Bits;
} _MOD_Err_;
#define __Mask_ModErr_SB  0x0C
#define __Mask_ModErr_SC  0xC0

typedef  union {
      uint8_t Byte;
  struct {
	  uint8_t NC_GND:1;
	  uint8_t SCV:1;
	  uint8_t SB_AV:1;
	  uint8_t SB_EV:1;
	  uint8_t NC_AV:1;
	  uint8_t NC_EV:1;
	  uint8_t SC_AV:1;
	  uint8_t SC_EV:1;
    } Bits;
} _MOD_Err0_;

typedef  union {
      uint8_t Byte;
  struct {
	  uint8_t TimeOut:1;
	  uint8_t ERR_Ton:1;
	  uint8_t ERR_Com:1;
	  uint8_t SC_Mod_Mod:1;
    } Bits;
} _MOD_Err1_;


typedef  union {
      uint8_t Byte;
  struct {
	  uint8_t NC:1;
	  uint8_t SC:1;
	  uint8_t SB:1;
	  uint8_t ERR_Ton:1;
	  uint8_t e4:1;
	  uint8_t e5:1;
	  uint8_t e6:1;
	  uint8_t e7:1;
    } Bits;
} _DIF_Err_;

typedef  union {
      uint8_t Byte;
  struct {
	  uint8_t NC:1;
	  uint8_t SC:1;
	  uint8_t SB:1;
	  uint8_t ERR_Ton:1;
	  uint8_t e4:1;
	  uint8_t e5:1;
	  uint8_t e6:1;
	  uint8_t e7:1;
    } Bits;
} _LSSw_Err_;

typedef struct
{
    uint16_t   Truck_ECAS;
    uint16_t   Truck_Front;
    uint16_t   Truck_Rear;
    uint16_t   Truck_Engine;
    uint16_t   Truck_Brake;
    uint16_t   Truck_Hitch;
    uint16_t   Train;
    uint16_t   Trailer;
    uint16_t   Cargo;
    uint16_t   Rear_Axis;
}TypeDef_Weght;

TypeDef_Weght Weght;

//-----самонастройка параметров---------------
//-----self-tuning parameters  STP -----------
typedef struct
{  struct
   {  uint8_t   PTxx; // момент ХХ в процентах
      uint8_t  Loss_K1;
      uint8_t  Loss_K2;
      uint16_t PeakTorque;
   } Engine;
   struct
   {  uint16_t K_PsAx;
      uint8_t  K_Pb; //Edit219;
   } Break;

} TypeDef_SelfTun;

typedef struct
{
	int16_t   Value;
	int16_t   Roll;
	int16_t   OmegaZ;       // боковое ускорение через Omega_Z_est
	int16_t   DelSpF;	    // через скорости передних колес
	int16_t   WzD;
	int32_t   Integ;
	int16_t   OffSet;
	int16_t   Cnt;
	int32_t   OffSetG;
	int32_t   OffSetA;
	int16_t   A;
	int16_t   G;
	int16_t   Gf;      //
	int16_t   Pitch;

	int16_t   Last;
    uint16_t  Fail;  // счетчик недостоверных значений
} TypeDef_Accel;


typedef struct
{
	uint8_t   Sign_Akker;
	uint8_t   Sign_OmegaZ;
	uint8_t   Sign_AccY;
    uint8_t   Sign_AccX;
    uint8_t   Delay_Cnt;
    int16_t   AccY;
    int16_t   AccX;
    int16_t   OmegaZ;
    uint16_t  BreakPress;
    int16_t   Akker;
    int16_t   SteerAngle;
    uint16_t  Taxo;
    uint8_t   Rx_Data[10];
    uint8_t   Tx_Data[10];
    int16_t   TetaAcker;
    int16_t   AngleAcker;
} TypeDef_Emul;

typedef struct
{ uint16_t  Mu;
  int16_t   Wz;
  int16_t   OmegaZ;  // предельная OmegaZ определяемая дорогой
  uint16_t  MuF;
  uint16_t  MuBr;
} TypeDef_Road;

typedef struct {
    int16_t  Ref;
    int16_t  Min;
    int16_t  Max;
    int16_t  Base;
    int32_t  Sum;
    uint8_t  Cnt;
    uint8_t  Abort;
    int8_t   Cplt;
    int16_t  Reliable; // достоверные значения
    int16_t  Delta;    // порог изменения
    int16_t  Change;   // величина изменения от предыдущего
 //   int16_t  Val;  Bag!
    int32_t  Val;
    int16_t  OffSet;
    int32_t  SumNR;
} OffsetTypeDef;

typedef struct {
	int16_t  Value;
    int16_t  Last;
    int16_t  OffSet;
    int32_t  Integ;
    int16_t  Weight;
    int16_t  OffSetCnt;
    int16_t  SignCnt;
    int16_t  ValueCnt;
    int16_t  GradCnt;
    int16_t  OkCnt;
    _ByteBits_  Bad;

} ValidityTypeDef;

typedef struct {
	 int16_t  WeightWzThr;
	 int16_t  WeightKnorm;
	 int16_t  WeightSum;
	 uint16_t  RefCnt;
	 ValidityTypeDef Wz1; //Omega_Z_est
	 ValidityTypeDef Wz2; //OmegaZ_Des
	 ValidityTypeDef Wz3; //OmegaZ_AccY
	 ValidityTypeDef Wz4; //OmegaZ_Vf

//	 int16_t  VxCnt1;
	 uint16_t  VxCnt;
	 uint8_t  RefOkCnt;
} TypeDef_Validity;

//#define __Size_DelayTaxo_Buff 45
#define __Delay_Taxo     10
#define __KTS_Koef       988 // равен __Kload_MeNeVxAx	//2048
#define __KTS_Oss        64 //__KTS_Koef/64

typedef struct
{
	uint16_t  Taxo;
	uint16_t  TS;
	uint16_t  KoefTaxoSpeed;
	uint16_t  Last;
	uint16_t  Delta;
	uint16_t  Range;
	uint8_t   OnCnt;
	uint8_t   LastCnt;
	uint8_t   TrOn;
} TypeDef_KTS;

typedef struct {
	_ByteBits_  Flags;
	int32_t     IntWz;
	int16_t     TruckAngle;
	int16_t     WzPoz_Angle;
	int16_t     WzNeg_Angle;
} TypeDef_Maneuver;

TypeDef_Maneuver Maneuver;
#define     Maneuver_Flags   Maneuver.Flags.Byte
#define     No_Maneuver      Maneuver.Flags.Bits.b0
#define     Yes_Maneuver     Maneuver.Flags.Bits.b1
#define     LineChange_Right Maneuver.Flags.Bits.b2
#define     LineChange_Left  Maneuver.Flags.Bits.b3
#define     Circle_Left      Maneuver.Flags.Bits.b4
#define     Circle_Right     Maneuver.Flags.Bits.b5
#define     Yaw_Bias         Maneuver.Flags.Bits.b6
#define     Move_Direct      Maneuver.Flags.Bits.b7

typedef struct
{
	int32_t Xn;
	int32_t Xn_1;
	int32_t Xn_2;
	int32_t Yn_1;
	int32_t Yn_2;
} _Filtr_Buffer_;

typedef struct
{
	int32_t Xn;
	int32_t Xn_1;
	int32_t Xn_2;
	int32_t Xn_3;
	int32_t Yn_1;
	int32_t Yn_2;
	int32_t Yn_3;
} _Filtr2_Buf_;

typedef struct
{
	uint16_t  Ton_Cnt;
	uint16_t  NC_Cnt;
	uint16_t  SC_Cnt;
	uint16_t  SB_Cnt;
	uint16_t  NCO_Cnt;
	uint16_t  SCV_Cnt;  // замыкание обмоток
	uint16_t  SCM_Cnt;  // замыкание между мод.
	uint8_t   Repeat;   // повтор теста модулятора
} ErrTypeDef;

typedef struct
{
	uint16_t  Press;
	uint8_t   CutM;
	uint8_t   On;
	uint16_t  Pdes;
	uint16_t  dP;
	uint16_t  ON_Time;
	uint16_t  AirPress;
	uint16_t  K_Inject;
	uint16_t  K_Exhaust;
	uint16_t  P_Full;

	uint8_t   St_On;      // состояние ON-1  Off-0
	uint16_t* ADC_Ch;
//	uint16_t  ADC_On_Val;
//	uint16_t  ADC_Off_Val;
	struct
	{	uint16_t  On_Val;
		uint16_t  Off_Val;
	} ADC;
	struct
	{	uint16_t  On_Val;
		uint16_t  Off_Val;
	} Oss;
	ErrTypeDef Fail;
	_DIF_Err_  Error;
} DifTypeDef;

typedef struct
{   uint8_t    In;      // состояние ON-1  Off-0
	uint16_t*  ADC_Ch;
	struct {
		uint16_t   On_Val;
		uint16_t   Off_Val;
	} ADC;
	struct {
		uint16_t   On_Val;
		uint16_t   Off_Val;
	} Oss;
	ErrTypeDef Fail;
	_LSSw_Err_ Error;
	uint16_t   NC_Level;
	uint16_t   SC_Level;
	uint16_t   SB_Level;
//	FUN_Ptr1_t OnOff;   // указатель на функцию переключения ключа
	uint16_t   OFF_Cnt;
//	uint8_t    TstDis;  // запрет тестов
} LSSwTypeDef;

typedef struct // BrakeAxis
{
	struct {
		uint16_t   dPva;        // ограничение ускорителя
		uint16_t   K_Pva;		// Коефф. ускорителя
		uint8_t    Chamber_Tip; // в дюймах
		uint16_t   Grad_Pump;   // ограничение градиентa подкачки
		uint16_t   Grad_Exh;    // ограничение градиентa выпуска
		int16_t    GradPump_L;  // отличие градиентa подкачки левого переднего колеса
		uint16_t   MDT_Pdes;    // задание давления пневмо теста
	} CFG;

	uint16_t  Pin;
	uint16_t  Pva;   // давление после ускорителя
	uint16_t  Air;   // давление в ресиверe
	uint16_t  AirCAN;

	uint16_t  Drop_L;
	uint16_t  Drop_R;
	_Filtr_Buffer_  Filt_AirDrop;

} TypeDef_BrakeAxis;

typedef struct // Brake
{
	TypeDef_BrakeAxis Front;
	TypeDef_BrakeAxis Rear;
	TypeDef_BrakeAxis Axis3;

	uint16_t  DemandValue;
	struct
	{
		uint16_t   K_ExhTap;   // градиент выпуск через кран
		int32_t    Grad_BP;    // ограничение градиентa кранa
		struct {
			uint8_t    Exh_To;
			uint16_t   Exh_Kp;
			uint8_t    Pump_To;
			uint16_t   Pump_Kp;
		} Delay; // задержка модулятора
		uint16_t   AsistP;
		uint16_t   AsistT;
		uint16_t   HillHoldT;
		uint16_t   HillHold_Pdes;
	} CFG;
	struct
	{
		uint16_t   StopCnt;  // лягушка
		uint16_t   OffFail;
		uint16_t   OnFail;
		uint16_t   CntNC;
	} Pedal;

	struct
	{	uint16_t   Tout;
		uint16_t   DelayOff;
		uint16_t   U;
		uint16_t   NC_Thr;
		uint16_t   OffFail;
		uint16_t   OnFail;
		uint16_t   CntNC;
	} Light;

	struct
	{   uint8_t    Phase;
		uint16_t   Time;
		uint8_t    PressCnt;
		uint16_t   CntTSET;
		uint8_t    CntSW;
		uint8_t    LampCnt;
		uint8_t    VxCnt;
		uint8_t    Torque;
		uint16_t   Taxo;
		uint16_t   Press;
	    uint16_t   Pdes;
	    uint16_t   CntClutch; //
		_ByteBits_ State;
		_ByteBits_ Flags;
	} HillHold;

	struct
	{	uint8_t    Phase;
		uint16_t   Time;
	} Asist;

	struct
	{   uint8_t    CntSW;
	    uint8_t    CntAuto;
	    uint16_t   Pdes;
	    uint16_t   Tout;
		uint8_t    Torque;
		uint16_t   Taxo;
		_ByteBits_ Flags;
	} Halt;

} TypeDef_Brake;

#define    HillHold_State      Brake.HillHold.State.Byte
#define    TSET_Switch_ON      Brake.HillHold.State.Bits.b0
#define    TSET_Switch_Tout    Brake.HillHold.State.Bits.b1
#define    EBC1_Switch_ON      Brake.HillHold.State.Bits.b2
#define    HHR_Vx_Stop         Brake.HillHold.State.Bits.b3
#define    HHR_Press_Ch        Brake.HillHold.State.Bits.b4
#define    HHR_Press_High      Brake.HillHold.State.Bits.b5
#define    HHR_Clutch_Off      Brake.HillHold.State.Bits.b6
#define    HHR_Clutch_On       Brake.HillHold.State.Bits.b7

#define    HillHold_Flags      Brake.HillHold.Flags.Byte
#define    HHR_Lamp_State      Brake.HillHold.Flags.Bits.b0
#define    HHR_Switch_Request  Brake.HillHold.Flags.Bits.b1
#define    HHR_Press_Request   Brake.HillHold.Flags.Bits.b2
#define    HHR_Switch_Ch       Brake.HillHold.Flags.Bits.b3
#define    HHR_Switch_On       Brake.HillHold.Flags.Bits.b4
#define    HHR_Deactivate      Brake.HillHold.Flags.Bits.b5
#define    HHR_Fail            Brake.HillHold.Flags.Bits.b6
#define    HillHold_Disable    Brake.HillHold.Flags.Bits.b7

#define    Halt_Flags            Brake.Halt.Flags.Byte
#define    Halt_SW_Activate      Brake.Halt.Flags.Bits.b0
#define    Halt_SW_DeActivate    Brake.Halt.Flags.Bits.b1
#define    Halt_Auto_Activate    Brake.Halt.Flags.Bits.b2
#define    Halt_Auto_DeActivate  Brake.Halt.Flags.Bits.b3
#define    WantToMove            Brake.Halt.Flags.Bits.b4
#define    DoorsIsOpen           Brake.Halt.Flags.Bits.b5

#define    Halt_Disable          Brake.Halt.Flags.Bits.b7

typedef struct
{
	uint8_t    Status;
	uint8_t    Torque;
} TypeDef_ReT;

typedef struct
{
	struct {
		uint16_t   Slip_On;   //
		uint16_t   Slip_Off;  //
		uint16_t   Speed;     //
		uint16_t   Deccel;    //
		uint8_t    Torque;
	} CFG;

	TypeDef_ReT D_10h; // замедлитель кардана
	TypeDef_ReT E_0Fh; // замедлитель двигателя
	TypeDef_ReT M_29h; // замедлитель горный тормоз
	TypeDef_ReT T_03h; // замедлитель трансмиссия (коробка-автомат)

	struct {
    	uint8_t    Value;
    	uint8_t    Phase;
    	uint16_t   Cnt;
    	uint8_t    Val_MC2;
	} Torque;

	struct {
		uint16_t   Thr_On;   //
		uint16_t   Thr_Off;  //
	} DBR;

    _ByteBits_ Flags;

}TypeDef_Retarder;
TypeDef_Retarder Retarder; // прототип нужен

#define    Retarder_Flags     Retarder.Flags.Byte
// перенесено в Rear_Flags2 т.к. реле у STM1
//#define    DBR_Request        Retarder.Flags.Bits.b0
#define    DBR_Failure        Retarder.Flags.Bits.b1
#define    DBR_Deccel_Event   Retarder.Flags.Bits.b2
#define    DBR_Slip_Event     Retarder.Flags.Bits.b3
#define    DBR_Disable        Retarder.Flags.Bits.b7

typedef struct
{
	int16_t   Ax;   // с ограничением -1мс/c2
	int16_t   AccX; // без ограничения
	int16_t   Ax_dV;
	uint16_t  Vx;
	uint32_t  Sum;
	uint8_t   N;
}TypeDef_Base;

typedef struct
{
    uint16_t  VX;
    uint16_t  Koef;
    uint16_t  Koef_Last;
	uint16_t  Cnt;
	uint32_t  Sum1; // сумма скорости оси
	uint32_t  Sum2; // сумма опорная скорость

}TypeDef_KOEF;

typedef struct
{
	uint8_t   Status;
	uint16_t  Speed;
	uint16_t  Taxo;
	uint16_t  Taxo_Est;
	uint32_t  HDRH_Distance;

	struct
	{ uint8_t   Num;
	  uint16_t  Koef;
	} Gear;

	uint16_t  RearRPM;
	uint16_t  RefVX; // опорная скорость
	uint16_t  FailCnt;

	TypeDef_KOEF Front;
	TypeDef_KOEF Rear;
	uint16_t  KOEF;
} TypeDef_TCO;



typedef struct // WheelTypeDef
{
	struct   // CFG
	{
	  uint16_t  K_Inject;
	  uint16_t  K_Exhaust;
	  uint8_t   Nz;
	  uint8_t   Radius;
	  uint16_t  Inertia;
	  uint8_t   K_dP4;
	  uint8_t   K_AcP4;
	  uint16_t  TpumpMin;  // минимальное время подкачки
	} CFG;

	uint16_t  Inertia;    // момент инерции колеса
    uint16_t  Fz;         // вертикальная сила

    uint16_t  K_Inject;
	uint16_t  K_Exhaust;
	uint16_t  P_Full;
	uint16_t  PumpT;     // время подкачки
	uint16_t  Ppump;     // заданное давление подкачки
	uint16_t  ExhT;
	uint8_t   DelExh;
	uint8_t   DelInj;
	uint16_t  Grad_Pump; // ограничение градиентa подкачки
	uint16_t  Grad_Exh;  // ограничение градиентa выпуска
	uint16_t  PumpToss;
	uint16_t  dP_1mc;
	uint16_t  dPmin;
	uint16_t  In_Press;
	uint16_t  Press;
	uint16_t  dPlim; //Test AirFlow


	_Filtr_Buffer_  Filt_Speed;
	_Filtr_Buffer_  Filt_Accel;

    uint16_t  ZeroCnt;
	uint16_t  SpeedI; // входная скорость от DZ, TruckSim, Emul
	uint16_t  Speed;  // выходная фильтрованная скорость
	uint16_t  Base;
	uint16_t  Ref;
	uint16_t  CntI;
	uint16_t  CntD;
	int16_t   Buff_Accel[8];
	int16_t   Acc_InF; // ускорение на фходе фильтра
	int16_t   Accel;
	uint16_t  Slip;
	uint16_t  Start;

	uint32_t  Tire_Koef;
	uint8_t   Tire_Once_F; // флаг один раз


    struct{
    	uint16_t  Koef;
    	uint16_t  Thr;
    	uint16_t  Ki;
    	uint32_t  Ki_Sum;
    	uint16_t  T;
    	uint16_t  Clamp; //счетчик прижима
    } BaseMax;

	struct // ABS
	{
		struct
		{
		    uint16_t  AccelOn;  // порог ускорения ABS_Searching
		    uint16_t  SlipOn;   // порог проскальзывания ABS_Searching
			uint16_t  Po;
			uint16_t  KdP;
			uint16_t  Pm;		 // точка перелома
	//		uint8_t   Disk;      // особое ABS дискового тормоза
			uint8_t   T_ShExh;   // время начала укорачивания
			uint8_t   K_ShExh;   // коэфф. укорачивания
			uint16_t  PromSp;    //порог раскрутки promotion
	    } CFG;

	    uint8_t   Phase;
	    uint8_t   KL;
	    uint16_t  Tout;
	    uint16_t  Base;
	    uint16_t  Pdes;
	    uint16_t  dP;
	    uint16_t  SpThr;
	    int16_t   SlipThr;
	    int16_t   AccThr;
	    uint16_t  BcThr;
	    uint16_t  TAI;
	    uint16_t  Pause;
	    uint16_t  Time;
	    uint16_t  LockTout;
	    uint16_t  MaxAcc; //порог ускорения колеса 5G
	    uint16_t  ProM;   //порог раскрутки promotion

	    struct{
	    	int32_t  Base;
	    	uint16_t Slip;
	    	int16_t  Accel;
	    	int16_t  Decel;
	    	uint16_t Speed;
	    	uint16_t Press;
	    	uint16_t CutCnt;
	    	uint16_t ExhCnt;
	    	int16_t  SlAcc;
	    } Ph1;
	    struct{
	    	int32_t  Base;
//	    	uint16_t SlipEnd;
	    	uint16_t Accel;
	    	uint16_t Speed;
	    } Ph3;
	    struct{
	    	uint16_t dPa; //приращение давления от ускорения
	    	uint16_t dPr; //приращение давления от рекурсии
	    	uint16_t dP;
	    } Ph4;
	    struct{
	    	uint16_t Press;
	    	uint8_t  NumP;
		    uint16_t dP;
		    uint16_t ddP;
	    } Ph6;

	    _ByteBits_  Flags; // флаги цикла сбрасываются Searching
	    uint8_t  Active;   // Searching
	    uint8_t  Failure;  //
	} ABS;

	struct {  // MDT тест модуляторов
		uint16_t PressSen;
		uint16_t PressCut;
		uint16_t dP;
		uint16_t Ppump;
		uint16_t Pexh;
		uint16_t CntPump;
		uint16_t CntExh;
		uint16_t CntCut;
		uint16_t DelayPump;
		uint16_t DelayExh;
		uint8_t  Exh;
		uint8_t  Pump;
		uint16_t PumpTime;
		uint16_t ExhTime;
		uint8_t  Phase;
	    struct
		{   uint8_t    On;      // состояние ON-1  Off-0
			ErrTypeDef Err;
		 	struct
			{ uint8_t  On_Val;
			  uint8_t  Off_Val;
		 	} Oss;
	    } AV;
	    struct
		{   uint8_t    On;      // состояние ON-1  Off-0
			ErrTypeDef Err;
		 	struct
			{ uint8_t  On_Val;
			  uint8_t  Off_Val;
		 	} Oss;
	    } EV;
	 	uint8_t    TwoNC;
	} MDT;

	struct
	{
//		uint8_t   Req;     // запрос активации
		uint8_t   Phase;
	    uint16_t  Ph_Cnt;
	    uint16_t  PumpSet;  // ограничение давления подкачки
	    uint16_t  ExhSet;
	    uint16_t  TcutSet;
	    uint16_t  TpumpSet;
	    uint16_t  TexhSet;
	    uint16_t  Tout;
	    uint8_t   Active;
	    uint16_t  Delay;
	} Puls;

	struct{
		uint32_t Const;
		uint32_t Channel;  // htim Capture.Channel
		uint16_t Buf[16];
		uint8_t  Cnt;	   // счетчик Capture
		uint8_t  CntZ;     // счетчик обнуления скорости
		uint16_t Period;   //
		uint16_t Speed;
		uint16_t Nz;       // номер зуба
	    uint16_t  A1_Upoz;
	    uint16_t  A1_Uneg;
	    uint16_t  A2_Upoz;
	    uint16_t  A2_Uneg;
	    uint16_t  Uamp1;
	    uint16_t  Uamp2;

		uint16_t FailTcirc;  // счетчик оборотов ошибки FailT
        uint16_t FailTcnt;   // счетчик FailT на обороте
	    uint16_t Safe_dT_Cnt;// счетчик сброса флага Safe_dT
        uint16_t Sp;   //o
        uint16_t CntT; //o
	    uint16_t Top;  // опорный период на предыдущем выч.скорости
        uint32_t Thigh;
        int32_t  Tlow;
        uint8_t  Pisk;
        uint16_t DelT;
        uint8_t  Polarity;
	} Capture;

	struct
	{   uint16_t  Noise_Cnt;
	    uint16_t  Zero_Cnt;

	    uint16_t  Ua_c;
	    uint32_t  Ua_Sum;
	    uint16_t  Ua_N;
	    uint16_t  Ua_Cnt;
	    uint16_t  Uamp;
	    uint16_t  UampN;
	    uint16_t  A1_U0;
	    uint16_t  A2_U0;

	    uint16_t  NC_Cnt;
	    uint16_t  SB_Cnt;
	    uint16_t  SC_Cnt;
	    uint16_t  GND_Cnt;
	    uint16_t  Gap_Cnt;

		_Filtr_Buffer_  Filt_Uamp;
		// тест биения
		uint16_t  Ua_Min;
		uint16_t  Ua_Max;
	    uint16_t  WT_MinMax;
	    uint16_t  WT_Cnt;
	    // тест зубчатки
	    uint16_t  TzBuf[120];
	    uint16_t  Tref;
	    uint16_t  Nz_Fail;  // количество дефектных зубов на обороте
	    uint16_t  Rack_Cnt; // количество событий дефекта зубчатки
	    // тест предельной скорости
	    uint16_t  SpeedMax_Cnt;
	    // тест провалы скорости
	    uint16_t  SpeedZero_Cnt;
	    uint16_t  SafeSp_Cnt; // количество SafeSp на обороте
	    uint16_t  Flop_Cnt;   // счетчик неисправности провалы скорости
	    // тест Tire
	    uint16_t  TireKoef;
	    uint16_t  TireFail_Cnt;
	    // тест дребезгa
	    uint16_t  FailT_Cnt;
	    // Флаги лучше uint8_t чем _ByteBits_
	    uint8_t   CircleDone;
	    uint8_t   SpeedStab; // скорость постоянна на обороте колеса
	    // pcb
		struct
		{ uint8_t  Uamp;
		  uint8_t  A1_U0;
		  uint8_t  A2_U0;
		  uint8_t  WT_MinMax;
		  uint8_t  A1_Ua;
		  uint8_t  A2_Ua;
		} Oss;
	} Test;

	struct
	{
	  uint16_t  Pdes;
	} XBR;

	struct
	{ uint16_t   N;
	  uint16_t*  A1_Ch;  // указатель на канал ADC
	  uint32_t   A1_Sum; // сумма N значений
	  uint16_t*  A2_Ch;
	  uint32_t   A2_Sum;
	  uint16_t*  AV_Ch;
	  uint16_t*  EV_Ch;
	  uint16_t   AV_On_Val;
	  uint16_t   AV_Off_Val;
	  uint16_t   EV_On_Val;
	  uint16_t   EV_Off_Val;
	} ADC;
	struct   // CFG
	{ uint8_t  FRW_100m; // full rotation of the wheel 100m
	  uint8_t  Cnt_FRW;
	  uint32_t Distance;
	  uint8_t  NU_Cmpl;  // флаг завершения начальной установки
	  uint8_t  Dia;      // флаг диагностической установки пробега
	} Way;

	_SS_Err0_  Sen_Err0;
	_SS_Err1_  Sen_Err1;
	_SS_Err_   Sen_Err;

	_MOD_Err0_  MOD_Err0;
	_MOD_Err1_  MOD_Err1;
	_MOD_Err_   MOD_Err;

    _ByteBits_  State;

} WheelTypeDef;

//----------------------------------------
//  назначение бит регистра ABS.Flags
//----------------------------------------
// порядок не менять!!
// фгаг Ref_End выход из фазы при малом Ref
//#define Ref_End   Wheelx->ABS.Flags.Bits.b0
// флаг Ph5_Stop синхронизация MIR
#define Ph5_Stop   Wheelx->ABS.Flags.Bits.b1
// фгаг High_Acc большого ускорения раскрутки
#define High_Acc   Wheelx->ABS.Flags.Bits.b2
// фгаг Lock_Flag блокировки колеса
#define Lock_Flag  Wheelx->ABS.Flags.Bits.b3
// Pump_Flag
#define Pump_Flag  Wheelx->ABS.Flags.Bits.b4
// First_Flag
#define First_Flag Wheelx->ABS.Flags.Bits.b5

//----------------------------------------
//  назначение бит регистра Wheelx.State
//----------------------------------------
#define Active1   Wheelx->State.Bits.b0
#define BaseFail  Wheelx->State.Bits.b3

#define TAI_Flag  Wheelx->State.Bits.b4
#define Safe_dT   Wheelx->State.Bits.b5  //*
#define Safe_Sp   Wheelx->State.Bits.b6  //*
#define Error0    Wheelx->State.Bits.b7

#define Mask_Safe  0xE0  // Check_Safe

//----------------------------------------
//  назначение бит регистра Error2
//----------------------------------------
//#define Noise_Fail  Wheelx->Error2.Bits.b4

typedef  union {
      uint8_t Byte;
  struct {
	  uint8_t bit1_2:2;
	  uint8_t bit3_4:2;
	  uint8_t bit5_6:2;
	  uint8_t bit7_8:2;
    } Bits;
} _CANBits;

typedef  union {
      uint8_t Byte;
  struct {
	  uint8_t bit1_4:4;
	  uint8_t bit5_6:2;
	  uint8_t bit7_8:2;
    } Bits;
} _CAN_DC1;

typedef struct {
	_ByteBits_  PGN_FF20_Status1;
	_ByteBits_  PGN_FF20_Status2;
	_ByteBits_  PGN_FF21_Status1;
	 uint8_t    PGN_FF22_AIR1; // Brake Primary Pressure
	 uint8_t    PGN_FF22_AIR2; // Brake Secondary Pressure
	 uint8_t    PGN_FF22_Temp; //
	 uint16_t   PGN_FF22_Taxo; // Engine Speed
	 uint16_t   Ambient_Temperature;
	 uint8_t    PGN_FF23_Ubat;
	 uint8_t    PGN_FF22_Fuel;
	 _CAN_DC1   Door;
	 uint8_t    CAN_DC1_SA;
} TypeDef_Body;

TypeDef_Body  Body;

//-------------------------------------------------------------
#define    Body_PGN_FF20_Status1  Body.PGN_FF20_Status1.Byte
//
#define    Body_Parking_Active    Body.PGN_FF20_Status1.Bits.b0
// неисправность тормозной системы
#define    BreakError             Body.PGN_FF20_Status1.Bits.b1
// неисправность торм.сист. контур 1
#define    ErrorBreak_Front       Body.PGN_FF20_Status1.Bits.b2
// неисправность торм.сист. контур 2
#define    ErrorBreak_Rear        Body.PGN_FF20_Status1.Bits.b3
// межколесный дифференциал
#define    CrossAxle_Diff_lock    Body.PGN_FF20_Status1.Bits.b4
// межосевой дифференциал
#define    RearCenter_Diff_lock   Body.PGN_FF20_Status1.Bits.b5
// нейтраль
#define    Neutral_Gear           Body.PGN_FF20_Status1.Bits.b6
// демультипликатор повышенной передачи
#define    OverDrive_Demultiplier Body.PGN_FF20_Status1.Bits.b7

//-------------------------------------------------------------
#define    Body_PGN_FF20_Status2  Body.PGN_FF20_Status2.Byte
// износ тормозных накладок
#define    Brake_Pad_Wear         Body.PGN_FF20_Status2.Bits.b0
// критическая неисправность EDC
#define    Critical_Fault_EDC     Body.PGN_FF20_Status2.Bits.b1
// не критичная неисправность EDC
#define    Non_critical_Fault_EDC Body.PGN_FF20_Status2.Bits.b2
// SPN 595 Cruise Control Active
#define    Cruise_Control_Active  Body.PGN_FF20_Status2.Bits.b3
// разряд АКБ
#define    Battery_Discharge      Body.PGN_FF20_Status2.Bits.b4
// режим помощь при трогании
#define    Traction_Help_Mode     Body.PGN_FF20_Status2.Bits.b5
// SPN 5082
#define    SPN_5082               Body.PGN_FF20_Status2.Bits.b6

//-------------------------------------------------------------
#define    Body_PGN_FF21_Status1  Body.PGN_FF21_Status1.Byte
// износ тормозных накладок
#define    Brake_Pad_Wear2        Body.PGN_FF21_Status1.Bits.b0
// не транспортное положение
#define    Not_Transport_Position Body.PGN_FF21_Status1.Bits.b1
// нейтраль раздатки
#define    Transfer_Case_Neutral  Body.PGN_FF21_Status1.Bits.b2
// делитель пониженные передачи
#define    Downshift_Divider      Body.PGN_FF21_Status1.Bits.b3
// диференциал переднего моста
#define    FrontAxle_Diff_lock    Body.PGN_FF21_Status1.Bits.b4
// межосевой диференциал раздатки
#define    FrontCenter_Diff_lock  Body.PGN_FF21_Status1.Bits.b5
// SPN 520 замедлитель
#define    SPN_520_Retarder       Body.PGN_FF21_Status1.Bits.b6
// неисправность руля1
#define    Steering_alfunction    Body.PGN_FF21_Status1.Bits.b7

#define    Door_Status            Body.Door.Byte
#define   SPN_1821                Body.Door.Bits.bit1_4
#define   SPN_1822                Body.Door.Bits.bit5_6
#define   SPN_3411                Body.Door.Bits.bit7_8

/* END Exported types ------------------------------------------------------ -*/

#define    SizeDelayBuff       0x55 //0   // 80 - 400ms
#define   __Koef_Default       0x8000 //0x7FFF
#define   __100_percent        0x6400
/* ---------------Exported functions ----------------------------------------*/
void     AccelX_Estimate(void) myCode;
void     AccelY_Estimate(void) myCode;
void     Ackermann(void) myCode;
int16_t  Ackermann_OmegaZ(int16_t Teta) myCode;
void     ManeuverFlags(void) myCode;
void     VDC_Input_Var(void) myCode;
void     Road_Estimate (void) myCode;
uint16_t PressCANSensor(OffsetTypeDef* PS, uint16_t In) myCode;
uint16_t PressAnalogSensor(OffsetTypeDef* PS, uint16_t In) myCode;
void     DifInject(DifTypeDef* xDif) myCode;
void     DifExhaust(DifTypeDef* xDif) myCode;
void     Exhaust(WheelTypeDef* Wheelx) myCode;
void     ExhTap(WheelTypeDef* Wheelx) myCode;
void     Inject(WheelTypeDef* Wheelx) myCode;
uint8_t  Delay_ModExh (WheelTypeDef* Wheelx) myCode;
uint8_t  Delay_ModPump (WheelTypeDef* Wheelx) myCode;
uint16_t IncValve (TypeDef_BrakeAxis* BrakeAxis) myCode;
uint16_t Pnevmo_AirFlow (WheelTypeDef* Wheelx,
		                 TypeDef_BrakeAxis* BrakeAxis, uint8_t EV) myCode;
void     Pressure_Estimate(void) myCode;

void     ReverseCheck (void) myCode;
void     TransmissionKTS(void) myCode;
void     Vehicle_Load(void) myCode;
void     RoadTest_VAR(void) myCode;
void     GraphCalc(void) myCode;
void     Sensor_OFFSET(OffsetTypeDef* OS, int16_t INx) myCode;
int16_t  WeightOmegaZ (int16_t Wz1, int16_t Wz2) myCode;
uint8_t  Validity_OmegaZ  (ValidityTypeDef* WzX) myCode;
void     SignalValidity(void) myCode;
void     Read_IEE_VDC_Const(void) myCode;
void     Self_Tuning(void) myCode;
uint8_t  Koef_SAS(void) myCode;

void     WheelSpeedRef(WheelTypeDef* Wheel_XX) myCode;
void     WheelSpeedBase(WheelTypeDef* Wheelx) myCode;
void     SpeedX_Estimate(void) myCode;
void     Speed_Filter(WheelTypeDef* WheelXX) myCode;
void     Speed_Wheels(void) myCode;
uint8_t  Koef_TCO(TypeDef_KOEF* Axis) myCode;
void     KoefSpeed(void) myCode;
uint16_t Speed_Axis(uint16_t Wheel_XL, uint16_t Wheel_XR) myCode;

uint16_t Torque_Press (WheelTypeDef* Wheelx) myCode;
int16_t  Delay(int16_t Delay_Buff[SizeDelayBuff], int16_t Xn, uint8_t D) myCode;
int16_t  Filter_Cheb(_Filtr_Buffer_* Filter_Buf, volatile const uint16_t* Filter_Koef) myCode;
int16_t  Filter_Cheb2(_Filtr2_Buf_* Filter_Buf, volatile const uint16_t* Filter_Koef) myCode;
uint16_t Mediana(uint16_t Buff[], uint8_t Size, uint16_t M) myCode;
int16_t  DeriVative(int16_t* Accel_Buf, uint8_t Size) myCode;
uint16_t int_sqrt32(uint32_t x) myCode;
int32_t  SinusGrad(int16_t Angle) myCode;
int32_t  CosinusRad(int16_t Angle) myCode;

void     Test_WheelSensor(WheelTypeDef* Wheelx, uint8_t SenXX_Install) myCode;
void     Wheel_Sensor_Test(void) myCode;
void     DIA_Default_Oss(void) myCode;
void     DIA_SST1_Oss(void) myCode;
void     DIA_SST2_Oss(void) myCode;
void     DIA_Validity_Oss(void) myCode;

void     Speed_Terminal_B7(void) myCode;
void     Test_Terminal_B7(void) myCode;

int32_t  DeriVative_U16(uint16_t* Accel_Buf, uint8_t Size) myCode;
extern  void     Set_Capture (WheelTypeDef* WheelXX);

/* End of exported functions -------------------------------------------------*/

#endif /* __MY_VAR_H */
