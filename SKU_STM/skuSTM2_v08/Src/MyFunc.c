/* ----- SKU_v10 ------------*/
#include "MyTypeDef.h"
#include "main.h"
#include "stm32f1xx.h"
#include "MySystem.h"
#include "MyFunc.h"
#include "MyVAR.h"


TypeDef_ASR    ASR;
TypeDef_EBL    EBL;
TypeDef_MDT    MDT;
TypeDef_LSSw   LSSw;
ROPTypeDef     ROP;
DYCTypeDef     DYC;
SSCTypeDef     SSC;
TypeDef_ABS    ABS;
TypeDef_MIR    MIR_Front;
TypeDef_EBC5   EBC5;
TypeDef_XBR    XBR;
TorqueTypeDef  EngineTorque;

_ByteBits_  _EBL_Flags;
_ByteBits_  _EBL_DZ_Status;
_ByteBits_  _ASR_Flags;
_ByteBits_  _ROP_Flags;

_ByteBits_  _KL_Status_ABS;
_ByteBits_  _KL_Status_ABS2;
_ByteBits_  _KL_Status_ASR;
_ByteBits_  _KL_Status_ASR2;
_ByteBits_  _KL_Status_DSC;
_ByteBits_  _KL_Status_2;
_ByteBits_  _KL_Status_EBL;
_ByteBits_  _SCI_PA_Status;

_Filtr_Buffer_  Filter_dVf;
_Filtr_Buffer_  Filter_DeltaOmegaZ;
_Filtr_Buffer_  Filter_OmegaZ;
_Filtr_Buffer_  Filter_Akker;

#define    SizeDerivativeAccY   0x28 //40
int16_t    BuffDer_AccY[SizeDerivativeAccY];
int16_t    BuffDer_AccY_OzD[SizeDerivativeAccY];

#define    SizeDerivativeOmegaZBuff   0x14 //20
int16_t    BuffAcc_OmegaZ[SizeDerivativeOmegaZBuff];
int16_t    BuffAcc_Akker[SizeDerivativeOmegaZBuff];

int16_t    Base_Accel;
uint16_t   BaseAcc_Buf[53];
#define  __BaseAcc_T   50// 30 //за 150mc

//(3,6*1000/(5*__BaseAcc_T)) /8  90/T
#define __K_BaseAccel  8 //11
//#define  __BaseAcc_T   18 //за 90mc

uint16_t   DifPressOff;
uint8_t    Dif_Error_MC1;
uint8_t    Dif_Error_MC2;

uint16_t   DSC_Break_Abort_Delay;

extern TIM_HandleTypeDef htim4; // объявлен CubeMX в main.c
#define     htimPK       htim4
#define     PK_CHANNEL   TIM_CHANNEL_4

/* ----------------- Filter ---------------------*/
extern volatile const uint16_t Koef_Filtr5Hz[5];
//-------------------------------------------------
extern  DifTypeDef        FrontDif;
extern  DifTypeDef        RearDif;
extern  TypeDef_Maneuver  Maneuver;
extern  TypeDef_Road      Road;
extern  TypeDef_SAS     SAS;
extern  TypeDef_Accel   AccelY;
extern  TypeDef_Brake   Brake;
extern  TypeDef_Load    Load;
extern  TypeDef_Diag    Diag;
extern  WheelTypeDef    Wheel_FL;
extern  WheelTypeDef    Wheel_FR;
extern  WheelTypeDef    Wheel_RL;
extern  WheelTypeDef    Wheel_RR;
extern  TypeDef_Power   Power;
extern  UartTypeDef    UartDIA;
extern  LSSwTypeDef    BSP75_WL;
extern  LSSwTypeDef    BSP75_DBR;
extern  LSSwTypeDef    BTS142_GNDF;
extern  DifTypeDef     TrailerDif;
extern  LSSwTypeDef    BTS142_GNDR;
extern  LSSwTypeDef    BSP75_LASR;

#ifdef   __AxisR_Compile
extern  uint16_t   Speed_VX_Front;
extern  TypeDef_Retarder  Retarder;
extern  TypeDef_KTS       KTS;
extern  TypeDef_Engine    Engine;
extern  OffsetTypeDef  TrailerP;
extern  TypeDef_TCO    TCO;
extern  DifTypeDef     TrailerDif;
extern volatile const uint16_t Koef_Filtr1Hz[5];
extern volatile const uint16_t Koef_Filtr2Hz[5];
extern  LSSwTypeDef    BSP75_LASR;
extern  LSSwTypeDef    BTS142_GNDR;
#endif

#ifdef   __Axis3_Compile
extern WheelTypeDef    Wheel_3L;
extern WheelTypeDef    Wheel_3R;
#endif

#ifdef __Square_Board
extern WheelTypeDef    Wheel_3L;
extern WheelTypeDef    Wheel_3R;
#endif

#ifdef   __EBL_Compile
extern uint16_t   DSC_Car_Hcg;       //высота центра гравитации
#endif

extern uint16_t  Speed_VX_est;
extern int16_t   Acc_Y_est;
extern int16_t   Acc_X_est;  //??
extern int16_t   Steering_Angle;   // выходной угол поворота руля
extern int16_t   OmegaZ_Des;  // желаемая OmegaZ
extern int16_t   Omega_Z_est;
extern int32_t   Derivative_VY;
extern int32_t   Integrator_VY;
extern int16_t   Sa_Front;
extern int16_t   Sa_Rear;
extern int16_t   Delta_OmegaZ;
extern int16_t   Speed_VY_est;
extern int16_t   Teta_Steering_Wheel;
extern int16_t   dSpAx;
extern int16_t   Derivative_OmegaZ;
extern int16_t   Derivative_Akker;
extern int16_t   Derivative_DeltaWz;
extern int16_t   Derivative_AccY;
extern int16_t   Derivative_AccY_OzD;

extern uint16_t   DSC_Ratio_Steer;
extern uint16_t   DSC_Car_Base;
extern uint16_t   Speed_FrontAxel;  //
extern uint16_t   Speed_RearAxel;   //

extern _ByteBits_  _DSC_Config_6;
extern _ByteBits_  _DSC_Config_7;
extern _ByteBits_  _DSC_Config_9;
extern _ByteBits_  _DSC_Config_10;
extern _ByteBits_  _DSC_Config_11;
//extern _ByteBits_  _DSC_Config_12;
extern _ByteBits_  _DSC_Config_13;
extern _ByteBits_  _DSC_Config_14;
extern _ByteBits_  _DSC_Config_15;
extern _ByteBits_  _DSC_Config_16;
extern _ByteBits_  _DSC_Config_17;

extern _ByteBits_  _DSC_Flags;
extern _ByteBits_  _DSC_Flags2;
extern _ByteBits_  _DSC_Flags3;

extern uint8_t  CANS_InitState;
extern vcbTypeDef      cCANS;
#define __KL_Ret_NU     0
#define __KL_Ret_Pump   1
#define __KL_Ret_Cut    2
#define __KL_Ret_Exh    3

//**************************************************************************
uint8_t  Check_Safe(WheelTypeDef* Wheelx)
{
	if(Check_Safe_Enable &&                   // CFG
	   (Safe_dT || Safe_Sp || Error0 ||
	    !_Hi_16(Wheelx->Speed)))              // Wx zero
		 return 1;
    else return 0;
}

// отслеживание увеличения давления
uint8_t  Check_Pump(WheelTypeDef* Wheelx)
{
	if( Wheelx->PumpT >= Wheelx->CFG.TpumpMin && // больше минимального времени
	    Wheelx->Press > Wheelx->Ppump)           // достигнуто заданное давление
    {	Wheelx->PumpToss = Wheelx->PumpT;
        Wheelx->PumpT = 0; //хрень для EBL ??????????????????
		return 1;
	}
	else
	{   Wheelx->PumpT++;
        Wheelx->ExhT = 0;
		return 0;
	}
} // end Check_Pump(&Wheelx)

// зависимость подкачек от уровня давления
uint16_t Pump_dP (WheelTypeDef* Wheelx)
{
//  T   dPo( F-16)  dPo( R-11)
//  9       0,23    0,16
//  10      0,25    0,18
//  11      0,28	0,19
//  12      0,31	0,21
#define   __Pump_dP_Max  0x0E00  //0,7atm
#define   __Pump_ddP_Lim 0x5000  //4atm

	int16_t dP = Wheelx->ABS.CFG.Po;
	// приращение от уровня давления
	int32_t ddP = (uint32_t)Wheelx->Press -
		          (uint32_t)Wheelx->ABS.CFG.Pm;
	if(ddP > __Pump_ddP_Lim)
	   ddP = __Pump_ddP_Lim;

	ddP = ddP * Wheelx->ABS.CFG.KdP / 65536;
	// знак приращения
	if(ddP > 0)
	{
	  if(ABS_Sign_KdP) // знак коефф. CFG
	    dP += ddP;
	  else
	  { // уменьшается с ростом давления
		dP -= ddP;
	    // ограничение минимума
	    if(dP < Wheelx->dPmin)
		   dP = Wheelx->dPmin;
	  }
	}
	// ограничение максимума
	if(dP > __Pump_dP_Max)
	   dP = __Pump_dP_Max;
	return dP;
} // end Pump_dP (Wheelx)

void     Press_Control(WheelTypeDef* Wheelx, TypeDef_Press_Reg* REG)
{ // общая процедура EBL_IR   ASR.Brake.REG   XBR_Press_Control
  // для нормального слежения нужно задать
  // давлениe Pdes
  // dPump подкачки
  // TrP зона слежения
  // CutT время отсечки

	uint16_t dPp;

		if(REG->KL == __KL_Ret_Exh)
		{ // выполнение выпуска
     	   if(REG->Pdes > Wheelx->Press) // контроль выпуска
     		  REG->KL = __KL_Ret_Cut;    // отсечка
		}
        else
        if(REG->KL == __KL_Ret_Cut)
        { // выполнение отсечки
          Wheelx->PumpT = 0;
          if((REG->Pdes + REG->TrP) < Wheelx->Press)
        	  REG->KL = __KL_Ret_Exh; // выпуск
	      else
          if(++REG->Cnt > REG->CutT)
          { REG->Cnt = 0;
            dPp = REG->Pdes - Wheelx->Press;
              if(dPp > REG->dPpump)
           	     dPp = REG->dPpump;
			  REG->Ppump = Wheelx->Press + dPp;
              if((REG->Pdes - REG->TrP) > Wheelx->Press)
              {	//  Wheelx->PumpT = 0;
            	  REG->KL = __KL_Ret_Pump;  // подкачка
              }
            }
          }
        else
        { // выполнение подкачки
 //    	 if(REG->Ppump > REG->Pdes) // понизилось задание
 //    		REG->Ppump = REG->Pdes;
     	 Wheelx->Ppump = REG->Ppump; // передаем в процедуру Ppump
     	 if(Check_Pump(Wheelx))
     		REG->KL = __KL_Ret_Cut;  // отсечка
        }
} // End  Press_Control()

#ifdef  __EBL_Compile
//----------- макрос Slip_RF проскальзывание относительно переда ---------
#define _Slip_RF(Fx ,Rx) {								              \
  int32_t dS = (int32_t)Wheel_##Fx.Speed - (int32_t)Wheel_##Rx.Speed; \
  if(dS < - Wheel_##Fx.Speed) dS = - Wheel_##Fx.Speed;                \
  if(Wheel_##Fx.Speed) EBL.REG.Slip_##Rx = (dS * (int32_t)0x6400) /   \
                                                 Wheel_##Fx.Speed;    \
  else EBL.REG.Slip_##Rx = 0; \
} //end macroc

//-----------------------------------------------------------------------

void EBL_Regulate(void)
{
#define   __EBL_P0_Thr     0x1400   // порог нажатия 1atm
#define   __EBL_VxZero     0x0800   //8km/h 0x0400   //4km/h
#define   __EBL_Cut_Delay  0x50   //
#define   __EBL_Tpump_Min  10
#define   __EBL_Vx_Sleep   0x0E00   //15km/h
//----------------------Flags------------------------------
     // Oбрабатывание проскальзывания
     if(EBL_Sleep_Enable &&   //CFG
        Wheel_RL.Ref > __EBL_VxZero &&
  	    Wheel_RL.Slip > EBL.CFG.Slip)
          EBL_SleepL = 1;
     else EBL_SleepL = 0;

     if(EBL_Sleep_Enable &&   //CFG
        Wheel_RR.Ref > __EBL_VxZero &&
  	    Wheel_RR.Slip > EBL.CFG.Slip)
          EBL_SleepR = 1;
     else EBL_SleepR = 0;

     // EBL_Disable
#define   __EBL_Vx_Disable     0x0A00   //10km/h
#define   __EBL_Disable_Delay  20
// если OvSt возникает при ABS торможении и
// снято Brake Abort DYC
// может срабатывать псевдо регулятор
// вводим счетчик задержки запрета после ABS_On и BrakeActive

     if(ABS_Front_Active ||     // ABS_On
   	    ROP_BrakeActive ||         // VDC
		DYC_BrakeActive)           // BrakeActive
    	    EBL.REG.Delay = __EBL_Disable_Delay;
     else
     {   if(EBL.REG.Delay)
    	    EBL.REG.Delay--;
     }

     // Условия выхода
     if(Brake.DemandValue < __EBL_P0_Thr  // отпустили тормоз
        || (Speed_VX_est < EBL.CFG.Vmin)  // стоит
        || EBL_Failed       // неисправности, регулирование,Tout
		|| Brake_PS_OffFail // Неисправен датчик тормозной педали
        || EBL.REG.Delay > __EBL_Disable_Delay/2 //
        || s_MC2_Error  //
		|| !EBL_Enable) // CFG
     {
    	  EBL_Disable = 1;
     }
     else EBL_Disable = 0;

//-------------- Задание давления регулятора -----------------
     EBL.REG.P_In = Brake.DemandValue;
     // максимальная нагрузка задней оси
     EBL.REG.RearAxle_LoadMax = ((uint32_t)Load.CFG.Truck.Hitch_MaxLoad *
    		                     (uint32_t)Load.CFG.Truck.Hitch_A /
								 (uint32_t)DSC_Car_Base) +
    		                    Load.CFG.Truck.Empty_Axis_Rear;
     // коеффициент регулятора

     EBL.REG.Koef = ((uint32_t)Load.Truck.Rear_Fz * 65536) / // Hагрузка задней оси
					 EBL.REG.RearAxle_LoadMax;
     // Корекция коэффициента
     if(EBL_Koef_Enable)
     { if(EBL_Koef_Sign)
    	    EBL.REG.Koef += ((uint32_t)EBL.REG.Koef * EBL.CFG.Kcor)/256;
       else EBL.REG.Koef -= ((uint32_t)EBL.REG.Koef * EBL.CFG.Kcor)/256;
     }

     // ограничение махсимума
     if(EBL.REG.Koef > 0x0000FFFF)
    	EBL.REG.Koef = 0x0000FFFF;
     // ограничение минимума
     // минимум коеффициентa регулятора Empty
     EBL.REG.Koef_Min = ((int32_t)Load.CFG.Truck.Empty_Axis_Rear * 65536) /
    		             (int32_t)EBL.REG.RearAxle_LoadMax;
     if(EBL.REG.Koef < EBL.REG.Koef_Min)
    	EBL.REG.Koef = EBL.REG.Koef_Min;

     // Задание давления регулятора
     EBL.REG.Pdes = ((int32_t)EBL.REG.P_In * EBL.REG.Koef) / 65536;
     // ограничение не больше входного
     if(EBL.REG.Pdes > EBL.REG.P_In)
        EBL.REG.Pdes = EBL.REG.P_In;
     // ограничение не меньше снаряженного
     EBL.REG.Pmin = ((uint32_t)EBL.CFG.P0 *
    		           EBL.REG.Koef_Min) / 65536;
     if(EBL.REG.Pdes < EBL.REG.Pmin)
        EBL.REG.Pdes = EBL.REG.Pmin;

     // сильное нажатие тормоза
#define   __EBL_K_HighLoad   0xC000 //75%
 	 if(EBL_HighP_Enable &&     //CFG
 	    Brake.DemandValue > EBL.CFG.P0 &&
		EBL.REG.Koef > __EBL_K_HighLoad)
          EBL_High_Press = 1;
 	 else EBL_High_Press = 0;
     // при большой загрузе и сильном нажатии
     if(EBL_High_Press)
        EBL.REG.Pdes = EBL.REG.P_In;

#define   __Acc_1G  0x4E7A  //9,81m/c2
// коэффициент изменения реакций при торможении
// Ax*Hg/L  размерность 1-20000
     if(Acc_X_est < 0 &&
        EBL_FzHg_Enable)
     { // изменениe  Pdes от  перераспределение  Fz
    	 EBL.REG.KFz_R = -Acc_X_est *
    			          DSC_Car_Hcg / DSC_Car_Base;
    	 EBL.REG.P_Hg = EBL.REG.Pdes *
    			        EBL.REG.KFz_R / __Acc_1G;
     }
     else EBL.REG.P_Hg = 0;
     // уменьшение  Pdes от  перераспределение  Fz
     EBL.REG.Pdes -= EBL.REG.P_Hg;

// Корекция  коэффициента по проскальзыванию
#define   __EBL_Sleep_dP     8   //0,6atm
#define   __EBL_Ks_Max       0x88F4   //+7%
#define   __EBL_Ks_Min       0x7709   //-7%
#define   __EBL_Ks_Slip      0x0500   //0,25km/h
#define   __EBL_K_ABS        190 //0,75

     // проскальзывание относительно переда
     _Slip_RF(FL ,RL)
     _Slip_RF(FR ,RR)

     if(Speed_VX_est > __EBL_Vx_Sleep &&
        EBL_Ks_Enable &&   //CFG
        EBL_Active &&
		!EBL_High_Press)
     {
         if(EBL.REG.Slip_RL < -__EBL_Ks_Slip &&
        	EBL.REG.Ks_L < __EBL_Ks_Max)
    	    EBL.REG.Ks_L += __EBL_Sleep_dP;
         if(EBL.REG.Slip_RL > __EBL_Ks_Slip &&
            EBL.REG.Ks_L > __EBL_Ks_Min)
            EBL.REG.Ks_L -= __EBL_Sleep_dP;
         if(EBL.REG.Slip_RR < -__EBL_Ks_Slip &&
            EBL.REG.Ks_R < __EBL_Ks_Max)
    	    EBL.REG.Ks_R += __EBL_Sleep_dP;
         if(EBL.REG.Slip_RR > __EBL_Ks_Slip &&
            EBL.REG.Ks_R > __EBL_Ks_Min)
            EBL.REG.Ks_R -= __EBL_Sleep_dP;
     }
     // коррекция по ABS  NEW!!
     if(EBL_Active)
     {
       if(Wheel_RL.ABS.Active)
    	   EBL_ABS_L = 1;
       if(Wheel_RR.ABS.Active)
    	   EBL_ABS_R = 1;
     }
     else
     { EBL_ABS_L = 0;
       EBL_ABS_R = 0;
     }

     // задание по бортам с учетом
     // коеффициентa коррекции по проскадьзыванию
     // и скольжения
     // Left
     EBL.REG.Pdes_L = (int32_t)EBL.REG.Pdes *
    		                   EBL.REG.Ks_L /__Koef_Default;
     if(EBL_SleepL) EBL.REG.Pdes_L -= EBL.REG.dP;
     if(EBL_ABS_L) EBL.REG.Pdes_L = EBL.REG.Pdes_L *__EBL_K_ABS /256;

     // Right
     EBL.REG.Pdes_R = (int32_t)EBL.REG.Pdes *
    		                   EBL.REG.Ks_R /__Koef_Default;
     if(EBL_SleepR) EBL.REG.Pdes_R -= EBL.REG.dP;
     if(EBL_ABS_R) EBL.REG.Pdes_R = EBL.REG.Pdes_R *__EBL_K_ABS /256;

     EBL.REG_RL.Pdes = EBL.REG.Pdes_L;
     EBL.REG_RR.Pdes = EBL.REG.Pdes_R;

//-----dPpump подкачки и зона слежения dP ----------------
#define   __EBL_dPpump_Max 0x0A00  //0,5atm
// __EBL_dPp_Koef = EBL.CFG.P0 / __EBL_dPpump_Max
//#define   __EBL_dPp_Koef   12
#define   __EBL_TrP_Koef   192 //75  225     //88%
     // Начальное давления регулятора
     EBL.REG.P0 = ((uint32_t)EBL.CFG.P0 *
    		                 EBL.REG.Koef) / 65536;
     // dP подкачки
     if(EBL_Pump_dP_CFG)
     { // задается в конфигурации
       EBL.REG.dPpump = EBL.CFG.dPump; // dPump подкачки
       EBL.REG.dP = EBL.CFG.dP;        // dP зона слежения
     }
     else
     { // зависимость подкачек от уровня давления
       EBL.REG.dPpump = (uint32_t)EBL.REG.Pdes /
    		           ((uint32_t)EBL.CFG.P0 /__EBL_dPpump_Max); //dPp_Koef
       // ограничение максимума
       if(EBL.REG.dPpump > __EBL_dPpump_Max)
     	  EBL.REG.dPpump = __EBL_dPpump_Max;
       // ограничение минимума
       if(EBL.REG.dPpump < EBL.CFG.dPump)
     	  EBL.REG.dPpump = EBL.CFG.dPump;
       // зона слежения
       EBL.REG.dP = EBL.REG.dPpump * (uint32_t)__EBL_TrP_Koef /256;
     }
     EBL.REG_RL.dPpump = EBL.REG.dPpump;
     EBL.REG_RR.dPpump = EBL.REG.dPpump;
     EBL.REG_RL.TrP = EBL.REG.dP;
     EBL.REG_RR.TrP = EBL.REG.dP;

} // end ElecBreakLoad()

//----------------- макрос EBL Switch ----------------------
#define _EBL_Switch(M) {						 	       \
  if(EBL.REG_##M.KL == __KL_Ret_Cut) { EBL_EV_##M = 1;  \
                                          EBL_AV_##M = 0;} \
  if(EBL.REG_##M.KL == __KL_Ret_Exh) { EBL_EV_##M = 1;  \
                                          EBL_AV_##M = 1;} \
  if(EBL.REG_##M.KL == __KL_Ret_Pump){ EBL_EV_##M = 0;  \
                                          EBL_AV_##M = 0;} \
} //end macroc

void     EBL_Brake_NU (WheelTypeDef* Wheelx, TypeDef_Press_Reg* REG)
{
	REG->Cnt = 0;
	REG->Ppump = Wheelx->Press;
	REG->KL = __KL_Ret_Pump;  // подкачка
}

void     EBL_IR(WheelTypeDef* Wheelx, TypeDef_Press_Reg* REG)
{
	 if(!Wheelx->ABS.Phase)
		  Press_Control(Wheelx, REG);
	 else EBL_Brake_NU (Wheelx, REG);
}

//--------------------EBL регулятор----------------------------------------

void     EBL_Press_Control(void)
{
// вызывается в My_Tick каждые 1ms
// клапана переключаются через REG->KL в _EBL_Switch(XX)

     if(!EBL_Active)
     {  if(!EBL_Disable &&
  	       (EBL.REG.P_In > EBL.REG.P0 ||
  	    	!EBL_PoCut_Enable) &&
           Speed_VX_est > __EBL_Vx_Disable &&
	       (Wheel_RL.Press > EBL.REG.Pdes_L || // по давлению
		    Wheel_RR.Press > EBL.REG.Pdes_R ||
			EBL_SleepL ||			           // по проскадьзыванию
			EBL_SleepR))
        { // активация
    	  EBL_Active = 1;
          EBL_EV_RL = 1;
          EBL_EV_RR = 1;
        }
        else
        { EBL_Brake_NU(&Wheel_RL, &EBL.REG_RL);
          EBL_Brake_NU(&Wheel_RR, &EBL.REG_RR);
#ifdef   __Axis3_Compile
          EBL_Brake_NU(&Wheel_3L, &EBL.REG_3L);
          EBL_Brake_NU(&Wheel_3R, &EBL.REG_3R);
#endif
        }
     }
     else // активирован регулятор
     { if(EBL_Disable)
       { EBL_Active = 0;
         EBL_KL_Status = 0;
         EBL_KL_Status2 = 0;
       }
       else
       { EBL_IR(&Wheel_RL, &EBL.REG_RL);
    	 EBL_IR(&Wheel_RR, &EBL.REG_RR);
    	 _EBL_Switch(RL)
    	 _EBL_Switch(RR)
       }
     }
} // end EBL_Press_Control()

#endif
//-----------------end EBL------------------------------

#define __MDT_Del_dP     0x0300
#define __MDT_Del_Pmin   0x0A00
#define __MDT_DelayOn    1500
#define __MDT_Sp_Time    100
#define __MDT_KL_Pause   950
#define __MDT_KL_Switch  50

#define __MDT_KL_CutAll   0xAA  //All  Mod-Cut
#define __MDT_KL_CutRear  0xA0  //Rear Mod-Cut
#define __MDT_KL_ExhRear  0xF0  //Rear Mod-Exh
#define __MDT_KL_CutFront 0x0A  //Front Mod-Cut
#define __MDT_KL_ExhFront 0x0F  //Front Mod-Exh
#define __MDT_KL_ExhAll   0xFF  //All  Mod-Exh
#define __MDT_KL2_DifOn   0x3A  //All  Mod-Cut  Dif-On
#define __MDT_KL2_DifOff  0x0F  //All  Mod-Exh  Dif-Off

#define __MDT_Ret_Pump   1
#define __MDT_Ret_Cut    2
#define __MDT_Ret_Exh    3
#define __MDT_Pdes_Grad  20 //30
#define __MDT_Pexh_Time  500   //100
#define __MDT_Pdes_Time  2500  //2000
#define __MDT_Off_Time   4400  //3900
#define __MDT_DifOFF_Time 4200 //3700
#define __MDT_Pdes_Max    0x9600  //7,5atm 0x8800  //6,8atm
#define __MDT_Press       0x1400
#define __MDT_Press05     0x0A00
#define __MDT_Pdes_dP     0x0800
//#ifdef   __AxisF_Compile
void     DIA_MDT_Oss(void)
{ // вызывается в DIA_Oss() MySystem.c
#ifdef   __AxisF_Compile
	// первая строка в Осциллографе
	UartDIA.Tx_data[0] = Wheel_FL.MDT.AV.Oss.Off_Val;
	UartDIA.Tx_data[3] = Wheel_FL.MDT.EV.Oss.Off_Val;
	UartDIA.Tx_data[6] = Wheel_FR.MDT.AV.Oss.Off_Val;
	UartDIA.Tx_data[9] = Wheel_FR.MDT.EV.Oss.Off_Val;
	// вторая строка в Осциллографе
	UartDIA.Tx_data[1] =  Wheel_FL.MDT.AV.Oss.On_Val;
	UartDIA.Tx_data[4]  = Wheel_FL.MDT.EV.Oss.On_Val;
	UartDIA.Tx_data[7]  = Wheel_FR.MDT.AV.Oss.On_Val;
	UartDIA.Tx_data[10] = Wheel_FR.MDT.EV.Oss.On_Val;
#else
	// первая строка в Осциллографе
	UartDIA.Tx_data[0] = Wheel_RL.MOD_Err0.Byte;
	UartDIA.Tx_data[3] = Wheel_RR.MOD_Err0.Byte;
	UartDIA.Tx_data[6] = MDT_KL;
	UartDIA.Tx_data[9] = System_F2;
	// вторая строка в Осциллографе
	UartDIA.Tx_data[1] =  Wheel_RL.MDT.AV.Err.SB_Cnt;
	UartDIA.Tx_data[4]  = Wheel_RR.MDT.AV.Err.SB_Cnt;
	UartDIA.Tx_data[7]  = KL_Status_1;
	UartDIA.Tx_data[10] = KL_Status_2;
#endif
	// третья строка в Осциллографе
	UartDIA.Tx_data[2] = Wheel_RL.MDT.AV.Oss.Off_Val;
	UartDIA.Tx_data[5] = Wheel_RL.MDT.EV.Oss.Off_Val;
	UartDIA.Tx_data[8] = Wheel_RR.MDT.AV.Oss.Off_Val;
	UartDIA.Tx_data[11]= Wheel_RR.MDT.EV.Oss.Off_Val;
	// четвертая строка в Осциллографе
	UartDIA.Tx_data[12] = Wheel_RL.MDT.AV.Oss.On_Val;
	UartDIA.Tx_data[13] = Wheel_RL.MDT.EV.Oss.On_Val;
	UartDIA.Tx_data[14] = Wheel_RR.MDT.EV.Oss.On_Val;
	UartDIA.Tx_data[15] = Wheel_RR.MDT.EV.Oss.On_Val;
	// пятая строка в Осциллограф
	UartDIA.Tx_data[16] = LIM.PK.Oss.On_Val;
	UartDIA.Tx_data[17] = LIM.PK.Oss.Off_Val;//
	UartDIA.Tx_data[18] = MDT.Fl.Byte;
	UartDIA.Tx_data[19] = MDT.Phase;
	// шестая строка в Осциллографе
	UartDIA.Tx_data[20] = Power.PWRValue/32; //;
	UartDIA.Tx_data[21] = Power.KL15Value/32;//;
	UartDIA.Tx_data[22] = Power.Rele.PWM_Value/32;//;
	UartDIA.Tx_data[23] = 140; // PWM_Period_Max
}
void     DIA_MDT_Oss6(void)
{ // вызывается в DIA_Oss() MySystem.c
#ifdef __Square_Board
	UartDIA.Tx_data[0] = Wheel_FL.MDT.AV.Oss.Off_Val;
	UartDIA.Tx_data[3] = Wheel_FL.MDT.EV.Oss.Off_Val;
	UartDIA.Tx_data[6] = Wheel_FR.MDT.AV.Oss.Off_Val;
	UartDIA.Tx_data[9] = Wheel_FR.MDT.EV.Oss.Off_Val;

	UartDIA.Tx_data[1] =  Wheel_FL.MDT.AV.Oss.On_Val;
	UartDIA.Tx_data[4]  = Wheel_FL.MDT.EV.Oss.On_Val;
	UartDIA.Tx_data[7]  = Wheel_FR.MDT.AV.Oss.On_Val;
	UartDIA.Tx_data[10] = Wheel_FR.MDT.EV.Oss.On_Val;

	UartDIA.Tx_data[2] = Wheel_RL.MDT.AV.Oss.Off_Val;
	UartDIA.Tx_data[5] = Wheel_RL.MDT.EV.Oss.Off_Val;
	UartDIA.Tx_data[8] = Wheel_RR.MDT.AV.Oss.Off_Val;
	UartDIA.Tx_data[11]= Wheel_RR.MDT.EV.Oss.Off_Val;

	UartDIA.Tx_data[12] = Wheel_RL.MDT.AV.Oss.On_Val;
	UartDIA.Tx_data[13] = Wheel_RL.MDT.EV.Oss.On_Val;
	UartDIA.Tx_data[14] = Wheel_RR.MDT.EV.Oss.On_Val;
	UartDIA.Tx_data[15] = Wheel_RR.MDT.EV.Oss.On_Val;

	UartDIA.Tx_data[16] = Wheel_3L.MDT.AV.Oss.Off_Val;
	UartDIA.Tx_data[17] = Wheel_3L.MDT.EV.Oss.Off_Val;
	UartDIA.Tx_data[18] = Wheel_3R.MDT.AV.Oss.Off_Val;
	UartDIA.Tx_data[19] = Wheel_3R.MDT.EV.Oss.Off_Val;

	UartDIA.Tx_data[20] = Wheel_3L.MDT.AV.Oss.On_Val;
	UartDIA.Tx_data[21] = Wheel_3L.MDT.EV.Oss.On_Val;
	UartDIA.Tx_data[22] = Wheel_3R.MDT.EV.Oss.On_Val;
	UartDIA.Tx_data[23] = Wheel_3R.MDT.EV.Oss.On_Val;
#endif
}

void     MDT_Abort(void)
{
	  MDT_KL = 0;
	  MDT_KL2 = 0;
	  MDT.Phase = 0;
	  MDT.Pdes = 0;
	  // чтобы работали электрические тесты в движении
	  if(MDT_Valve_Fl)
		   MDT_Flags &= MDT_Off_mask1; //без MDT_Valve_Fl и MDT_Active
	  else MDT_Flags = 0;
	  MDT_Flags2 &= MDT_Off_mask2; // без MDT_Req_Valve MDT_Cmpl_Fl и MDT_Abort_Fl
} // end MDT_Abort()

void  MDT_Switch (WheelTypeDef* WheelXX, uint8_t EV, uint8_t AV)
{
	if(EV)
    { if(AV)
      { // выполнение выпуска
   	    if(WheelXX->Press < WheelXX->MDT.Pexh) // контроль выпуска
   	       WheelXX->MDT.Phase = __MDT_Ret_Cut; // отсечка
      }
      else
      { // выполнение отсечки
    	WheelXX->PumpT = 0;
        if(WheelXX->Press > (MDT.Pdes + MDT.dPexh))
        {  WheelXX->MDT.Pexh = MDT.Pdes;
           WheelXX->MDT.Phase = __MDT_Ret_Exh;  // выпуск
        }
        else
        { WheelXX->MDT.dP = Pump_dP(WheelXX);
          if(MDT.Pdes > (WheelXX->Press + MDT.dPpump))
          {   WheelXX->MDT.Ppump = WheelXX->Press +  WheelXX->MDT.dP;
              WheelXX->MDT.Phase = __MDT_Ret_Pump; // подкачка
          }
        }
      }
    }
    else
    { // выполнение подкачки
   	  WheelXX->Ppump = WheelXX->MDT.Ppump;
   	  if(Check_Pump(WheelXX))
   		 WheelXX->MDT.Phase = __MDT_Ret_Cut; // отсечка
    }
} // end MDT_Switch(&WheelXX,EV_FL,AV_FL)

//----------------- макрос Switch ----------------------
#define _MOD_Switch(M) {								      \
  if(Wheel_##M.MDT.Phase == __MDT_Ret_Cut) { MDT_EV_##M = 1;  \
		                                     MDT_AV_##M = 0;} \
  if(Wheel_##M.MDT.Phase == __MDT_Ret_Exh) { MDT_EV_##M = 1;  \
									         MDT_AV_##M = 1;} \
  if(Wheel_##M.MDT.Phase == __MDT_Ret_Pump){ MDT_EV_##M = 0;  \
									         MDT_AV_##M = 0;} \
} //end macroc

void     Modulator_Test(void)
{
//	MOD_CFG = 15;
// для конфигурации 2S_2M меняются местами модуляторы 1 и 2 осей
//         ldx     ABS_Config
//         cbeqx   #Set_2S_2M,SynKl_ModTst_2
//         Set_2S_2M        equ     2  ; Одна Ось Модулятор на Датчик (2S/2M)

    // флаг нулевой скорости сбрасывается с задержкой
    if(_Hi_16(Speed_FrontAxel) ||
       _Hi_16(Speed_RearAxel))
    { if(MDT.SpZ_Cnt)
    	 MDT.SpZ_Cnt--;
      else All_Speed_Zero = 0;
    }
    else
    { All_Speed_Zero = 1;  // все нулевые
      MDT.SpZ_Cnt = __MDT_Sp_Time;
    }

    if(TestMod_Enable && // запрет теста модуляторов при регулировании
       BlockON_Complete &&
	   Rele_STM1_ON && Rele_STM1_ON &&
	   !MDT_Pro_Fl &&  //не Активен звуковой тест (стукалки)
	   !ISO_Fl &&      //нет ISO тестирования модуляторов
	   !MDT_Stair_Req) //нет тестирования динамики модуляторов
         TestMod_Disable = 0;
    else TestMod_Disable = 1;

    // задержка после включения реле
    if(Rele_STM1_ON && Rele_STM2_ON)
    { if(MDT.Delay < __MDT_DelayOn)
	     MDT.Delay++;
    }
    else MDT.Delay = 0;

    if(!MDT_Stair_Req) //нет тестирования динамики модуляторов
    { if(All_Speed_Zero)
      { // обработка запросов
	   if(__HAL_RCC_GET_FLAG(RCC_FLAG_PORRST) &&
	      !__HAL_RCC_GET_FLAG(RCC_FLAG_IWDGRST) &&
	      MDT.Delay == __MDT_DelayOn &&
	      !MDT_Cmpl_Fl && !MDT_Abort_Fl &&
	      All_Speed_Zero)
	     MDT_Req_Fl = 1;

	   if(MDT.ISO_N)
	   { if(!ISO_Fl) MDT.Phase = MDT.ISO_N;
	         ISO_Fl = 1;
	   }
	   else  ISO_Fl = 0;

	   if(MDT_Req_Fl || ISO_Fl)
       {
		// машина звуковых тестов модуляторов
	    if(MDT.Cnt) MDT.Cnt--;
	    else
	    {if(MDT_KL || MDT_KL2)
	     { if(MDT.Phase != 7) // тест перепутывания AV EV
	       MDT_KL = 0;
	       MDT_KL2 = 0;
	       MDT.Cnt = __MDT_KL_Pause;
	     }
	     else
	     { // обработка фаз
		  switch (MDT.Phase++)
		  {
		  case 0:
			  if(!MDT_Req_Fl)
			  { MDT_KL = 0;
			    MDT_KL2 = 0;
			    MDT.Phase--;
			  }
			  else MDT_Pro_Fl = 1;
		  break;
		  case 1: // MDT_FL
			  if(ModFL_Install)
			  {  MDT_EV_FL = 1;
			     if(ISO_Fl) MDT_AV_FL = 1;
			  }
	      break;
		  case 2: // MDT_FR
			  if(ModFR_Install)
			  {  MDT_EV_FR = 1;
			     if(ISO_Fl) MDT_AV_FR = 1;
			  }
	      break;
		  case 3: // MDT_RL
			  if(ModRL_Install)
			  {  MDT_EV_RL = 1;
			     if(ISO_Fl) MDT_AV_RL = 1;
			  }
	      break;
		  case 4: // MDT_RR
			  if(ModRR_Install)
			  {  MDT_EV_RR = 1;
			     if(ISO_Fl) MDT_AV_RR = 1;
			  }
	      break;
		  case 5: // MDT_3L
			  if(Mod3L_Install)
			  {  MDT_EV_3L = 1;
			     if(ISO_Fl) MDT_AV_3L = 1;
			  }
	      break;
		  case 6: // MDT_3R
			  if(Mod3R_Install)
			  {  MDT_EV_3R = 1;
			     if(ISO_Fl) MDT_AV_3R = 1;
			  }
	      break;
		  case 7: // All тест перепутывания AV EV
			  if(MDT_DifON_Enable)
			  { MDT_KL = __MDT_KL_CutAll;
			    MDT_KL2 = __MDT_KL2_DifOn;
			  }
			  else MDT.Phase++; // на 9
	      break;
		  case 8: // All
			  MDT_KL = __MDT_KL_ExhAll;
			  MDT_KL2 = __MDT_KL2_DifOff;
	      break;
		  case 9: // завершено
			  MDT_Cmpl_Fl = 1;
			  MDT_Abort();
	      break;
		  }// end switch
		  if(MDT_KL || MDT_KL2) MDT.Cnt = __MDT_KL_Switch;
		  if(ISO_Fl && MDT.Phase) MDT.Phase--;
	     } // end else обработка фаз
	    }  // end if(MDT.Cnt) else
       }   // end машина звуковых тестов модуляторов
      }    // end if(All_Speed_Zero)
      else
      { // аборт теста есть скорость
    	if(!MDT_Abort_Fl)
	    {   MDT_Abort_Fl = 1;
    		MDT_Abort();
        }
      }
    }     // end if(!MDT_Pdes_Req)

    // тестирование динамики модуляторов
    if(MDT_Stair_Req)
    {
      MDT.dPpump = Wheel_FL.ABS.CFG.Po;
      MDT.dPexh =  0x0F00;//Brake.CFG.dP_Exh;
      // задание давления
      MDT.Cnt2++;
      if(MDT.Cnt2 < __MDT_Pdes_Time &&
    	 MDT.Pdes < __MDT_Pdes_Max &&   //7,5atm
		 (MDT.Pdes + __MDT_Pdes_dP) < FrontDif.AirPress &&
		 (MDT.Pdes + __MDT_Pdes_dP) < RearDif.AirPress &&
		 (MDT.Pdes < Brake.DemandValue ||     // от тормоза
		  Brake.DemandValue < __MDT_Press))
          MDT.Pdes += __MDT_Pdes_Grad;

      if(MDT.Cnt2 > __MDT_Pdes_Time &&
    	 MDT.Pdes > __MDT_Pdes_Grad)
         MDT.Pdes -= __MDT_Pdes_Grad;

      if(MDT.Cnt2 > __MDT_Off_Time)
      {  MDT.Cnt2 = 0;
    	 MDT_Abort(); // exit
      }
      // отслеживание давления
      if(MDT.Cnt2)
      { // макроса
    	if(MDT.Cnt2 <__MDT_DifOFF_Time &&
    	   Brake.DemandValue < __MDT_Press) // 1atm
    	{ MDT_Dif_F = 1;
          MDT_Dif_R = 1;
    	}
    	else
    	{ MDT_Dif_F = 0;
          MDT_Dif_R = 0;
    	}

        if(MDT.Cnt2 < __MDT_Pexh_Time)
        {	MDT_KL = __MDT_KL_ExhAll;
            MDT.Pdes = 0x0500;//
        }
        else
        { if(MDT.Cnt2 == __MDT_Pexh_Time)
        	MDT_KL = __MDT_KL_CutAll;
          else
  	      {
#ifdef   __AxisF_Compile
        	if(MDT_Left_Enable)
  	        {  MDT_Switch (&Wheel_FL, MDT_EV_FL, MDT_AV_FL);
      	      _MOD_Switch(FL)
  	        }
  	        if(MDT_Right_Enable)
    	    {  MDT_Switch (&Wheel_FR, MDT_EV_FR, MDT_AV_FR);
              _MOD_Switch(FR)
    	    }
#endif
#ifdef   __AxisR_Compile
  	        if(MDT_Left_Enable)
  	        {  MDT_Switch (&Wheel_RL, MDT_EV_RL, MDT_AV_RL);
      	      _MOD_Switch(RL)
  	        }
    	    if(MDT_Right_Enable)
    	    {  MDT_Switch (&Wheel_RR, MDT_EV_RR ,MDT_AV_RR);
              _MOD_Switch(RR)
    	    }
#endif
  	      }
        }
      }
    }
    else
    {// тестирование динамики пневматики
#define __KL_On_Time     850
#define __KL_Off_Time    1850
#define __DifOFF_Time    2350
#define __Pneum_Off_Time 2700
      if(Pneum_Req_Fl)
      {
    	MDT.CntP++;
        // Dif
        if(MDT.CntP < __KL_On_Time)
        {
          if(Brake.DemandValue < __MDT_Press)
          {
        	MDT_Dif_F = 1;
            MDT_Dif_R = 1;
          }
          MDT_KL = __MDT_KL_ExhAll;
        }
        else
        if(MDT.CntP > __DifOFF_Time)
        { MDT_Dif_F = 0;
          MDT_Dif_R = 0;
        }
        //Kl
        if(MDT.CntP > __KL_On_Time &&
    	   MDT.CntP < __KL_Off_Time)
   	       MDT_KL = 0;
        else
        if(MDT.CntP > __KL_Off_Time)
           MDT_KL = __MDT_KL_ExhAll;
        // exit
        if(MDT.CntP > __Pneum_Off_Time)
        {  MDT.CntP = 0;
           MDT_Abort(); // exit
        }
      }
      else
      {
#define __Brake_Axis_Press 0x7800 //6 atm
#define __Brake_Axis_Speed 0x1000

    	if(BrakeOneAxis_Enable) //  разрешен в CFG
        { // обработка запросов
    	  if(BrakeDif_Req_Fl)
    	  { // запрос теста без нажатия тормоза
    		// торможение включением Dif.Kl
    	    BrakeDif_Pro_Fl = 1;
     	  }
    	  else
    	  if(BrakePed_Req_Fl)
    	  { // запрос теста от нажатия тормоза
    		if(Brake.DemandValue > __MDT_Press)
    	    { // запуск
    		   BrakePed_Pro_Fl = 1;
    	    }
 	        else
 	        if(BrakePed_Pro_Fl)
 	        { // останов
 	           BrakePed_Pro_Fl = 0;
 	           MDT_Abort();
 	        }
    	  }
    	  // выполнение теста
    	  if(BrakeDif_Pro_Fl ||
    	     BrakePed_Pro_Fl)
    	  { // задание давления
    		if(Diag.Pdes)
    		     MDT.Pdes = Diag.Pdes;
    		else MDT.Pdes = __MDT_Pdes_Max;
       		// Отработка давления
#ifdef   __AxisF_Compile
    		if(MDT_Front_Enable)
    		{
    		  if(BrakeDif_Pro_Fl) MDT_Dif_F = 1;
      	      if(Wheel_FL.Press > MDT.Pdes ||
      		     (Brake.Front.CFG.MDT_Pdes &&
      		      Brake.Front.CFG.MDT_Pdes <
  			      Wheel_FL.Press))
      	         MDT_EV_FL = 1;
      	      if(Wheel_FR.Press > MDT.Pdes ||
      		     (Brake.Front.CFG.MDT_Pdes &&
      		      Brake.Front.CFG.MDT_Pdes <
  			      Wheel_FR.Press))
      	         MDT_EV_FR = 1;
    		}
    		else MDT_KL |= __MDT_KL_ExhFront;
#endif
#ifdef   __AxisR_Compile
    		if(MDT_Rear_Enable)
    		{
    		  if(BrakeDif_Pro_Fl) MDT_Dif_R = 1;
      	      if(Wheel_RL.Press > MDT.Pdes ||
      		     (Brake.Rear.CFG.MDT_Pdes &&
      		      Brake.Rear.CFG.MDT_Pdes <
  			      Wheel_RL.Press))
      	         MDT_EV_RL = 1;
      	      if(Wheel_RR.Press > MDT.Pdes ||
      		     (Brake.Rear.CFG.MDT_Pdes &&
      		      Brake.Rear.CFG.MDT_Pdes <
  			      Wheel_RR.Press))
      	         MDT_EV_RR = 1;
    		}
    		else MDT_KL |= __MDT_KL_ExhRear;
#endif
    	  }
        }
        else
        { BrakePed_Pro_Fl = 0;
          BrakeDif_Pro_Fl = 0;
        }
      }
    }

// -------------------Электрический тест клапанов ---------------------
#define __MDT_Valve_Period   500  //0,5c
// задержка на переключение BTS5215
#define __MDT_Valve_Delay    300  //300 mkc

#define __MDT_LevelSC_Koef   42     // 1/6
#define __MDT_LevelSB_Koef   170    // 2/3
#define __MDT_LevelNC_Koef   85     // 1/3
#define __MDT_ErrTon_Time    15000  // 15c
#ifdef __MDT_ADC_1line
#define __MDT_SetErr_Time    20     //
#define __MDT_ErrCnt_Max     30     //
#else
#define __MDT_SetErr_Time    250 //500 //1000   // 1c
#define __MDT_ErrCnt_Max     300 //600 //2000   //  __MDT_SetErr_Time * 2
#endif
#define __MDT_SetErr_TimeI   20     // 0,3c   max  __MDT_SetErr_Time / 6
#define __MDT_ErrCnt_MaxI    22     // __MDT_SetErr_TimeI + 2
#define __MDT_2NC_Time       250 //600   //100 не ставит 2 обрыва

#define __DIF_ErrCnt_Max     600 //2000
#define __DIF_SetErr_Time    500 //1000
#define __DIF_SetErr_TimeI   20
#define __DIF_ErrCnt_MaxI    22

#define __MDT_LevelSC2_Koef      22     // 1/6

#define __MDT_Level1H_SB_Koef   138	 // 121
#define __MDT_Level1L_SB_Koef   105
#define __MDT_Level2H_SB_Koef   255	 // 238
#define __MDT_Level2L_SB_Koef   222
#define __MDT_Level3H_SB_Koef   20

#define __MDT_Level1H_NC_Koef   69   // 59
#define __MDT_Level1L_NC_Koef   49
#define __MDT_Level2H_NC_Koef   140  // 123
#define __MDT_Level2L_NC_Koef   106

#define __MDT_Level4H_NC_Koef   148  // 138
#define __MDT_Level4L_NC_Koef   128

#define __MDT_Level3H_NC_Koef   198  // 180
#define __MDT_Level3L_NC_Koef   163


    MDT.U_Sila = Power.PWRValue;
// пороги
    MDT.Sw.NC_Level = (uint32_t)MDT.U_Sila *__MDT_LevelNC_Koef /256;
    MDT.Sw.SC_Level = (uint32_t)MDT.U_Sila *__MDT_LevelSC_Koef /256;
    MDT.Sw.SB_Level = (uint32_t)MDT.U_Sila *__MDT_LevelSB_Koef /256;
    MDT.Sw.SB_Level2_L = (uint32_t)MDT.U_Sila *__MDT_Level2L_SB_Koef /256;

#ifdef __MDT_ADC_1line
    // пороги для тестирования по объединенным STA_XX
    MDT.Sw.NC_Level1_H = (uint32_t)MDT.U_Sila *__MDT_Level1H_NC_Koef /256;
    MDT.Sw.NC_Level1_L = (uint32_t)MDT.U_Sila *__MDT_Level1L_NC_Koef /256;
    MDT.Sw.NC_Level2_H = (uint32_t)MDT.U_Sila *__MDT_Level2H_NC_Koef /256;
    MDT.Sw.NC_Level2_L = (uint32_t)MDT.U_Sila *__MDT_Level2L_NC_Koef /256;
    MDT.Sw.NC_Level3_H = (uint32_t)MDT.U_Sila *__MDT_Level3H_NC_Koef /256;
    MDT.Sw.NC_Level3_L = (uint32_t)MDT.U_Sila *__MDT_Level3L_NC_Koef /256;
    MDT.Sw.NC_Level4_H = (uint32_t)MDT.U_Sila *__MDT_Level4H_NC_Koef /256;
    MDT.Sw.NC_Level4_L = (uint32_t)MDT.U_Sila *__MDT_Level4L_NC_Koef /256;

    MDT.Sw.SC2_Level = (uint32_t)MDT.U_Sila *__MDT_LevelSC2_Koef /256;
    MDT.Sw.SB_Level1_H = (uint32_t)MDT.U_Sila *__MDT_Level1H_SB_Koef /256;
    MDT.Sw.SB_Level1_L = (uint32_t)MDT.U_Sila *__MDT_Level1L_SB_Koef /256;
    MDT.Sw.SB_Level2_H = (uint32_t)MDT.U_Sila *__MDT_Level2H_SB_Koef /256;
    MDT.Sw.SB_Level2_L = (uint32_t)MDT.U_Sila *__MDT_Level2L_SB_Koef /256;
    MDT.Sw.SB_Level3_H = (uint32_t)MDT.U_Sila *__MDT_Level3H_SB_Koef /256;
#endif

    if(!TestMod_Disable) //нет запретa теста модуляторов
    { // периодичность тестов
	    if(MDT.Sw.Cnt++ >__MDT_Valve_Period)
	    {  MDT.Sw.Cnt = 0;
	       MDT_Valve_Fl = 1;
	       MDT_Check_Error(); // только здесь
	    }
	  }
	  else
    { // Abort MDT_Valve
	  // после регулирования сразу запустится тест
	  // иначе при __MDT_ADC_1line наацепирует что поставится ошибка SCV
	  MDT.Sw.Cnt = __MDT_Valve_Period-1; //0;
      if(MDT_Valve_Fl)
      {	 MDT_Valve_Fl = 0;
    	MDT.Sw.Sel = 0;
    	MDT.Sw.On = 0;
    	MDT.Sw.Repeat = 0;
      }
    }
    // переключение ключей для теста
	if(MDT_Valve_Fl)
	{ // Активен тест
	  MDT_KL = 0;
	  MDT_KL2 = 0;
	  switch (MDT.Sw.Sel++)
	  {
	    case 0:
	    	     Test_GND_Active = 1;
	             break;
#ifdef   __AxisF_Compile
	    case 1:   MDT.Sw.On = 1;
	              MDT.Sw.Repeat = 0;
	    	      MDT_AV_FL = 1; break;
	    case 2:   MDT_EV_FL = 1; break;
	    case 3:   MDT_AV_FR = 1; break;
	    case 4:   MDT_EV_FR = 1; break;
	    case 5:   MDT_Dif_F = 1; break;
	    case 6:   MDT.Sw.Sel = 0;
	    	      if(!MDT.Sw.Repeat)
	              { MDT_Valve_Fl = 0;
	                MDT.Sw.On = 0;
	              }
	    	      break;
#endif
#ifdef   __AxisR_Compile
#ifdef   __Axis3_Compile
	    case 1:  MDT.Sw.On = 1;
	             MDT.Sw.Repeat = 0;
	             MDT_AV_RL = 1; break;
	    case 2:  MDT_EV_RL = 1; break;
	    case 3:  MDT_AV_RR = 1; break;
	    case 4:  MDT_EV_RR = 1; break;
	    case 5:  MDT_AV_3L = 1; break;
	    case 6:  MDT_EV_3L = 1; break;
	    case 7:  MDT_AV_3R = 1; break;
	    case 8:  MDT_EV_3R = 1; break;
	    case 9:  MDT_Dif_R = 1; break;
	    case 10:  MDT_Dif_T = 1; break;
	    case 11:  MDT.Sw.Sel = 0;
	    	     if(!MDT.Sw.Repeat)
	             { MDT_Valve_Fl = 0;
	               MDT.Sw.On = 0;
	             }
	    	     break;
#else
	    case 1:  MDT.Sw.On = 1;
	             MDT.Sw.Repeat = 0;
	             MDT_AV_RL = 1; break;
	    case 2:  MDT_EV_RL = 1; break;
	    case 3:  MDT_AV_RR = 1; break;
	    case 4:  MDT_EV_RR = 1; break;
	    case 5:  MDT_Dif_R = 1; break;
	    case 6:  if(!LIM_PK_Active)
	             MDT_PK = 1;
	    		 break;
	    case 7:  MDT_Dif_T = 1; break;
	    case 8:  MDT.Sw.Sel = 0;
	    	     if(!MDT.Sw.Repeat)
	             { MDT_Valve_Fl = 0;
	               MDT.Sw.On = 0;
	             }
	    	     break;
#endif
#endif
      }
	}
    // флаг разрешения передавать в порт
    if(MDT_Valve_Fl ||  // Активен Электрический тест клапанов
       MDT_Pro_Fl ||    // Активен звуковой тест (стукалки)
	   ISO_Fl ||
       MDT_Stair_Req || Pneum_Req_Fl ||
       BrakePed_Pro_Fl || BrakeDif_Pro_Fl)
         MDT_Active = 1;
    else MDT_Active = 0;

} // end Modulator_Test();

void    MDT_Check_Error(void)
{
#ifdef   __AxisF_Compile
    // Обработка результатов Электрический тест
// результаты теста в Word
// а  везде используется старая структура из двух Byte
    if(ModFL_Install)
    { Wheel_FL.MOD_Err.Word = Error_MDT(&Wheel_FL).Word;
      Wheel_FL.MOD_Err0.Byte =_Lo_16(Wheel_FL.MOD_Err.Word);
      Wheel_FL.MOD_Err1.Byte =_Hi_16(Wheel_FL.MOD_Err.Word);
    }
    if(ModFR_Install)
    { Wheel_FR.MOD_Err.Word = Error_MDT(&Wheel_FR).Word;
      Wheel_FR.MOD_Err0.Byte =_Lo_16(Wheel_FR.MOD_Err.Word);
      Wheel_FR.MOD_Err1.Byte =_Hi_16(Wheel_FR.MOD_Err.Word);
    }
    if(DifF_Install)
    {  FrontDif.Error = Error_Dif(&FrontDif);
	   Dif_Error_MC1 = (FrontDif.Error.Byte  << 4) & 0xF0;
    }
#endif
#ifdef   __AxisR_Compile

    // Обработка результатов Электрический тест
    if(ModRL_Install)
    { Wheel_RL.MOD_Err.Word = Error_MDT(&Wheel_RL).Word;
      Wheel_RL.MOD_Err0.Byte =_Lo_16(Wheel_RL.MOD_Err.Word);
      Wheel_RL.MOD_Err1.Byte =_Hi_16(Wheel_RL.MOD_Err.Word);
    }
    if(ModRR_Install)
    { Wheel_RR.MOD_Err.Word = Error_MDT(&Wheel_RR).Word;
      Wheel_RR.MOD_Err0.Byte =_Lo_16(Wheel_RR.MOD_Err.Word);
      Wheel_RR.MOD_Err1.Byte =_Hi_16(Wheel_RR.MOD_Err.Word);
    }
    if(DifR_Install)
    { RearDif.Error = Error_Dif(&RearDif);
      Dif_Error_MC2 = (RearDif.Error.Byte & 0x0F);
    }
    if(DifT_Install)
    { TrailerDif.Error = Error_Dif(&TrailerDif);
      s_ModT_Error = TrailerDif.Error.Byte;
    }
    if(Prop_Kl_install) // CFG установлен
    	 s_Prop_Error = Error_PK().Byte;
    else s_Prop_Error = 0; // нужно ??
#endif
#ifdef   __Axis3_Compile
    // Обработка результатов Электрический тест
    if(Mod3L_Install)
    { Wheel_3L.MOD_Err.Word = Error_MDT(&Wheel_3L).Word;
      Wheel_3L.MOD_Err0.Byte =_Lo_16(Wheel_3L.MOD_Err.Word);
      Wheel_3L.MOD_Err1.Byte =_Hi_16(Wheel_3L.MOD_Err.Word);
    }
    if(Mod3R_Install)
    { Wheel_3R.MOD_Err.Word = Error_MDT(&Wheel_3R).Word;
      Wheel_3R.MOD_Err0.Byte =_Lo_16(Wheel_3R.MOD_Err.Word);
      Wheel_3R.MOD_Err1.Byte =_Hi_16(Wheel_3R.MOD_Err.Word);
    }
#endif
} // end MDT_Check_Error()

_MOD_Err_  Error_MDT (WheelTypeDef* WheelXX)
{
	_MOD_Err_ GPR0;
	GPR0.Word = 0;

	if(WheelXX->MDT.AV.Err.Ton_Cnt == __MDT_ErrTon_Time ||
	   WheelXX->MDT.EV.Err.Ton_Cnt == __MDT_ErrTon_Time)
		     GPR0.Bits.ERR_Ton = 1; // превышено время активации
	else     GPR0.Bits.ERR_Ton = 0;

#ifdef __MDT_ADC_1line
	if(WheelXX->MDT.AV.Err.SCV_Cnt > __MDT_SetErr_Time)
		   GPR0.Bits.SCV = 1;    // замыкание клапанов
//	else
	if(WheelXX->MDT.AV.Err.NCO_Cnt > __MDT_SetErr_Time)
		   GPR0.Bits.NC_GND = 1; // обрыв общего провода
	else
	{ if(WheelXX->MDT.AV.Err.SB_Cnt > __MDT_SetErr_Time)//*I
           GPR0.Bits.SB_AV = 1;  // замыканиe на + клапанa AV
	  else
	  if(WheelXX->MDT.AV.Err.NC_Cnt > __MDT_SetErr_Time)
		   GPR0.Bits.NC_AV = 1;  // обрыв клапанa AV
	  else
	  if(WheelXX->MDT.AV.Err.SC_Cnt > __MDT_SetErr_TimeI)
		   GPR0.Bits.SC_AV = 1;  // замыканиe клапанa AV

	  if(WheelXX->MDT.EV.Err.SB_Cnt > __MDT_SetErr_Time)//*I
		   GPR0.Bits.SB_EV = 1;  // замыканиe на + клапанa EV
	  else
	  if(WheelXX->MDT.EV.Err.NC_Cnt > __MDT_SetErr_Time)
		   GPR0.Bits.NC_EV = 1;  // обрыв клапанa EV
	  else
	  if(WheelXX->MDT.EV.Err.SC_Cnt > __MDT_SetErr_TimeI)
		   GPR0.Bits.SC_EV = 1;  // замыканиe клапанa EV
	}
#else
	if(WheelXX->MDT.AV.Err.SCV_Cnt > __MDT_SetErr_TimeI &&
	   WheelXX->MDT.EV.Err.SCV_Cnt > __MDT_SetErr_TimeI)
	{ // два варианта
	  if(WheelXX->MDT.TwoNC)
		   GPR0.Bits.NC_GND = 1; // обрыв общего провода
	  else // нет обрывов
		   GPR0.Bits.SCV = 1;    // замыкание клапанов
	}
	else
	{ if(WheelXX->MDT.AV.Err.SB_Cnt > __MDT_SetErr_Time)
		   GPR0.Bits.SB_AV = 1;  // замыканиe на + клапанa AV
	  else
	  if(WheelXX->MDT.AV.Err.NC_Cnt > __MDT_SetErr_Time)
		   GPR0.Bits.NC_AV = 1;  // обрыв клапанa AV
	  else
	  if(WheelXX->MDT.AV.Err.SC_Cnt > __MDT_SetErr_TimeI)
		   GPR0.Bits.SC_AV = 1;  // замыканиe клапанa AV

	  if(WheelXX->MDT.EV.Err.SB_Cnt > __MDT_SetErr_Time)
		   GPR0.Bits.SB_EV = 1;  // замыканиe на + клапанa EV
	  else
	  if(WheelXX->MDT.EV.Err.NC_Cnt > __MDT_SetErr_Time)
		   GPR0.Bits.NC_EV = 1;  // обрыв клапанa EV
	  else
	  if(WheelXX->MDT.EV.Err.SC_Cnt > __MDT_SetErr_TimeI)
		   GPR0.Bits.SC_EV = 1;  // замыканиe клапанa EV
    }
	// флаг TwoNC сбрасываем когда обнулились счетчики SCV
	// иначе после ошибки NC_GND выставится SCV
    if(!WheelXX->MDT.AV.Err.SCV_Cnt &&
       !WheelXX->MDT.EV.Err.SCV_Cnt)
        WheelXX->MDT.TwoNC = 0;
#endif
    return GPR0;

} // end Error_MDT

_DIF_Err_ Error_Dif (DifTypeDef* Dif)
{
_DIF_Err_ GPR0;
    GPR0.Byte = 0;
	if(Dif->Fail.Ton_Cnt == __MDT_ErrTon_Time)
	         GPR0.Bits.ERR_Ton = 1; // превышено время активации
	if(Dif->Fail.NC_Cnt > __DIF_SetErr_Time)
		     GPR0.Bits.NC = 1;      // обрыв клапанa
	else
	if(Dif->Fail.SC_Cnt > __DIF_SetErr_TimeI)
			 GPR0.Bits.SC = 1;      // замыканиe клапанa
	else
	if(Dif->Fail.SB_Cnt > __DIF_SetErr_Time)
			 GPR0.Bits.SB = 1;      // замыканиe на +
	return GPR0;
} // end Error_Dif

#define _AV_ErrCnt_IncI(E) {             \
{	if(WheelXX->MDT.AV.Err.E##_Cnt <__MDT_ErrCnt_MaxI)   \
	{  WheelXX->MDT.AV.Err.E##_Cnt++;    \
	   WheelXX->MDT.AV.Err.Repeat = 1;}} \
} //end macroc
#define _AV_ErrCnt_DecI(E) {             \
{   if(WheelXX->MDT.AV.Err.E##_Cnt <__MDT_SetErr_TimeI)\
	   WheelXX->MDT.AV.Err.E##_Cnt = 0;  \
    else WheelXX->MDT.AV.Err.E##_Cnt--;} \
} //end macroc
#define _AV_ErrCnt_Inc(E) {              \
{	if(WheelXX->MDT.AV.Err.E##_Cnt <__MDT_ErrCnt_Max)  \
	   WheelXX->MDT.AV.Err.E##_Cnt++; }  \
} //end macroc
#define _AV_ErrCnt_Dec(E)   {            \
	if(WheelXX->MDT.AV.Err.E##_Cnt)      \
	   WheelXX->MDT.AV.Err.E##_Cnt--;    \
} //end macroc

#define _EV_ErrCnt_IncI(E) {             \
{	if(WheelXX->MDT.EV.Err.E##_Cnt <__MDT_ErrCnt_MaxI)   \
	{  WheelXX->MDT.EV.Err.E##_Cnt++;    \
	   WheelXX->MDT.EV.Err.Repeat = 1;}} \
} //end macroc
#define _EV_ErrCnt_DecI(E) {             \
{   if(WheelXX->MDT.EV.Err.E##_Cnt <__MDT_SetErr_TimeI)\
	   WheelXX->MDT.EV.Err.E##_Cnt = 0;  \
    else WheelXX->MDT.EV.Err.E##_Cnt--;} \
} //end macroc
#define _EV_ErrCnt_Inc(E) {              \
{	if(WheelXX->MDT.EV.Err.E##_Cnt <__MDT_ErrCnt_Max)  \
	   WheelXX->MDT.EV.Err.E##_Cnt++; }  \
} //end macroc
#define _EV_ErrCnt_Dec(E)   {            \
	if(WheelXX->MDT.EV.Err.E##_Cnt)      \
	   WheelXX->MDT.EV.Err.E##_Cnt--;    \
} //end macroc

void     Analysis_MDT (WheelTypeDef* WheelXX)
{ // вызывается  MDT_Results_ADC() которая в myHAL_TIM_OC_DelayElapsedCallback
#ifdef __MDT_ADC_1line
	// тестированиe по объединенным STA_XX
#ifdef IN_GNDF_Pin
	if(!BTS142_GND_On)
	{ // выключена земля клапанов
	  if(WheelXX->ADC.AV_Off_Val < MDT.Sw.SB_Level3_H)
	  {  _AV_ErrCnt_Dec(SB)
		if(!WheelXX->MDT.AV.Err.SB_Cnt)
			WheelXX->MOD_Err0.Bits.SB_AV = 0;
	  }
      if(WheelXX->ADC.EV_Off_Val < MDT.Sw.SB_Level3_H)
      {  _EV_ErrCnt_Dec(SB)
		if(!WheelXX->MDT.AV.Err.SB_Cnt)
			WheelXX->MOD_Err0.Bits.SB_AV = 0;
      }
	}
  else
#endif
  { // земля клапанов включена
	// проверка замыкания клапанов SCV
    if(WheelXX->ADC.AV_Off_Val < MDT.Sw.SB_Level3_H &&
	   WheelXX->ADC.EV_Off_Val < MDT.Sw.SB_Level3_H &&
	   WheelXX->ADC.AV_On_Val > MDT.Sw.SB_Level2_L &&
	   WheelXX->ADC.AV_On_Val < MDT.Sw.SB_Level2_H &&
	   WheelXX->ADC.EV_On_Val > MDT.Sw.SB_Level2_L &&
	   WheelXX->ADC.EV_On_Val < MDT.Sw.SB_Level2_H)
		 _AV_ErrCnt_Inc(SCV)
    else _AV_ErrCnt_Dec(SCV)
	// проверка обрыва общего провода
    if(WheelXX->ADC.AV_Off_Val < MDT.Sw.SB_Level1_H &&
	   WheelXX->ADC.EV_Off_Val < MDT.Sw.SB_Level1_H &&
	   WheelXX->ADC.AV_Off_Val > MDT.Sw.SB_Level3_H &&
	   WheelXX->ADC.EV_Off_Val > MDT.Sw.SB_Level3_H &&
	   WheelXX->ADC.AV_On_Val > MDT.Sw.SB_Level2_L &&
	   WheelXX->ADC.AV_On_Val < MDT.Sw.SB_Level2_H &&
	   WheelXX->ADC.EV_On_Val > MDT.Sw.SB_Level2_L &&
	   WheelXX->ADC.EV_On_Val < MDT.Sw.SB_Level2_H)
	     _AV_ErrCnt_Inc(NCO)
    else _AV_ErrCnt_Dec(NCO)
	// проверка двух обрываов
    if(WheelXX->ADC.AV_Off_Val > MDT.Sw.NC_Level2_L &&
	   WheelXX->ADC.AV_Off_Val < MDT.Sw.NC_Level2_H &&
	   WheelXX->ADC.EV_Off_Val > MDT.Sw.NC_Level2_L &&
	   WheelXX->ADC.EV_Off_Val < MDT.Sw.NC_Level2_H &&
	   WheelXX->ADC.AV_On_Val > MDT.Sw.NC_Level3_L &&
	   WheelXX->ADC.AV_On_Val < MDT.Sw.NC_Level3_H &&
	   WheelXX->ADC.EV_On_Val > MDT.Sw.NC_Level3_L &&
	   WheelXX->ADC.EV_On_Val < MDT.Sw.NC_Level3_H)
    {
	   _AV_ErrCnt_Inc(NC)
	   _EV_ErrCnt_Inc(NC)
    }
    else // проверка двух замыканий на +
    { if(WheelXX->ADC.AV_Off_Val > MDT.Sw.SB_Level2_L &&
	     WheelXX->ADC.AV_Off_Val < MDT.Sw.SB_Level2_H &&
		 WheelXX->ADC.EV_Off_Val > MDT.Sw.SB_Level2_L &&
		 WheelXX->ADC.EV_Off_Val < MDT.Sw.SB_Level2_H &&
		 WheelXX->ADC.AV_On_Val > MDT.Sw.SB_Level2_L &&
		 WheelXX->ADC.AV_On_Val < MDT.Sw.SB_Level2_H &&
		 WheelXX->ADC.EV_On_Val > MDT.Sw.SB_Level2_L &&
		 WheelXX->ADC.EV_On_Val < MDT.Sw.SB_Level2_H)
	  { _AV_ErrCnt_Inc(SB)
		_EV_ErrCnt_Inc(SB)
	  }
	  else
	  { // клапан AV
	    WheelXX->MDT.AV.Err.Repeat = 0;
	    if(WheelXX->MDT.AV.On)
	    { // включен клапан AV
	      // проверка замыкания
	      if(WheelXX->ADC.AV_On_Val < MDT.Sw.SC2_Level)
	           _AV_ErrCnt_IncI(SC)
	      else _AV_ErrCnt_DecI(SC)
	      // время активации
	      if(WheelXX->MDT.AV.Err.Ton_Cnt < __MDT_ErrTon_Time)
		     WheelXX->MDT.AV.Err.Ton_Cnt++;
	    }
	    else // выключен клапан AV
	    { // время активации
	      WheelXX->MDT.AV.Err.Ton_Cnt = 0;
	      // проверка обрыва
	      if(WheelXX->ADC.AV_Off_Val > MDT.Sw.NC_Level1_L &&
		     WheelXX->ADC.AV_Off_Val < MDT.Sw.NC_Level1_H &&
		     WheelXX->ADC.AV_On_Val > MDT.Sw.NC_Level2_L &&
	         WheelXX->ADC.AV_On_Val < MDT.Sw.NC_Level2_H &&
		     WheelXX->ADC.EV_On_Val > MDT.Sw.NC_Level3_L &&
	         WheelXX->ADC.EV_On_Val < MDT.Sw.NC_Level3_H)
	           _AV_ErrCnt_Inc(NC)
	      else _AV_ErrCnt_Dec(NC)
	      // проверка замыкания на +
	      // выполняется только если все выключены
	      if(!MDT.Sw.On)  // все модуляторы выключены
	      { if(WheelXX->ADC.AV_Off_Val > MDT.Sw.SB_Level1_L &&
             WheelXX->ADC.AV_Off_Val < MDT.Sw.SB_Level1_H &&
		       WheelXX->ADC.AV_On_Val > MDT.Sw.SB_Level1_L &&
		       WheelXX->ADC.AV_On_Val < MDT.Sw.SB_Level1_H &&
             WheelXX->ADC.EV_On_Val > MDT.Sw.SB_Level2_L &&
             WheelXX->ADC.EV_On_Val < MDT.Sw.SB_Level2_H)
               _AV_ErrCnt_Inc(SB)
	        else _AV_ErrCnt_Dec(SB)
	      }
	    }
      // клапан EV
	    WheelXX->MDT.EV.Err.Repeat = 0;
	    if(WheelXX->MDT.EV.On)
	    { // включен клапан EV
	      // проверка замыкания
	      if(WheelXX->ADC.EV_On_Val < MDT.Sw.SC2_Level)
	           _EV_ErrCnt_IncI(SC)
	      else _EV_ErrCnt_DecI(SC)
	      // время активации
	      if(WheelXX->MDT.EV.Err.Ton_Cnt < __MDT_ErrTon_Time)
		     WheelXX->MDT.EV.Err.Ton_Cnt++;
	    }
	    else  // выключен клапан EV
	    { // время активации
	      WheelXX->MDT.EV.Err.Ton_Cnt = 0;
	      // проверка обрыва
	      if(WheelXX->ADC.EV_Off_Val > MDT.Sw.NC_Level1_L &&
		     WheelXX->ADC.EV_Off_Val < MDT.Sw.NC_Level1_H &&
		     WheelXX->ADC.EV_On_Val > MDT.Sw.NC_Level2_L &&
		     WheelXX->ADC.EV_On_Val < MDT.Sw.NC_Level2_H &&
		     WheelXX->ADC.AV_On_Val > MDT.Sw.NC_Level3_L &&
		     WheelXX->ADC.AV_On_Val < MDT.Sw.NC_Level3_H)
	           _EV_ErrCnt_Inc(NC)
	      else _EV_ErrCnt_Dec(NC)
	      // проверка замыкания на +
	      // выполняется только если все выключены
	      if(!MDT.Sw.On)  // все модуляторы выключены
	      { if(WheelXX->ADC.EV_Off_Val > MDT.Sw.SB_Level1_L &&
             WheelXX->ADC.EV_Off_Val < MDT.Sw.SB_Level1_H &&
		       WheelXX->ADC.EV_On_Val > MDT.Sw.SB_Level1_L &&
		       WheelXX->ADC.EV_On_Val < MDT.Sw.SB_Level1_H &&
             WheelXX->ADC.AV_On_Val > MDT.Sw.SB_Level2_L &&
             WheelXX->ADC.AV_On_Val < MDT.Sw.SB_Level2_H)
               _EV_ErrCnt_Inc(SB)
	        else _EV_ErrCnt_Dec(SB)
	      }
	    }
	    // запросы на повтор теста
	    if(WheelXX->MDT.AV.Err.Repeat ||
	       WheelXX->MDT.EV.Err.Repeat)
		MDT.Sw.Repeat = 1; //  будет повторяться тест модулятора
	  }
    }
  }
#else
  // тестированиe по раздельным STA_XX
#ifdef IN_GNDF_Pin
  if(!BTS142_GND_On)
  { // выключена земля клапанов
	if(WheelXX->ADC.AV_Off_Val <MDT.Sw.SB_Level2_L)//MDT.Sw.SB_Level)
	{  _AV_ErrCnt_Dec(SB)
		if(!WheelXX->MDT.AV.Err.SB_Cnt)
			WheelXX->MOD_Err0.Bits.SB_AV = 0;
	}
    if(WheelXX->ADC.EV_Off_Val < MDT.Sw.SB_Level2_L)//MDT.Sw.SB_Level)
    {  _EV_ErrCnt_Dec(SB)
		if(!WheelXX->MDT.AV.Err.SB_Cnt)
			WheelXX->MOD_Err0.Bits.SB_AV = 0;
    }
  }
  else
#endif
  { // клапан AV
    WheelXX->MDT.AV.Err.Repeat = 0;
	if(WheelXX->MDT.AV.On)
	{ // включен клапан AV
	  // проверка замыкания
	  if(WheelXX->ADC.AV_On_Val < MDT.Sw.SC_Level)
	       _AV_ErrCnt_IncI(SC)
	  else _AV_ErrCnt_DecI(SC)
	  // время активации
	  if(WheelXX->MDT.AV.Err.Ton_Cnt < __MDT_ErrTon_Time)
		 WheelXX->MDT.AV.Err.Ton_Cnt++;
	}
	else
	{ // выключен клапан AV
	  // время активации
	  WheelXX->MDT.AV.Err.Ton_Cnt = 0;
	  // проверка обрыва
	  if(WheelXX->ADC.AV_Off_Val > MDT.Sw.NC_Level &&
		 WheelXX->ADC.AV_Off_Val < MDT.Sw.SB_Level)
	  {  
#ifdef   __AxisF_Compile
         if(!WheelXX->MDT.TwoNC && GndF_On)
#else
         if(!WheelXX->MDT.TwoNC && GndR_On)
#endif
		 // при выключенном BTS142_GND не тестируем NC
		 // при двух NC останавливаем счетчики обрывов
		 // иначе после ошибки NC_GND выставится NC
	       _AV_ErrCnt_Inc(NC)
	  }
	  else _AV_ErrCnt_Dec(NC)
	  // проверка замыкания на +
	  // выполняется только если все выключены
	  if(!MDT.Sw.On)  // все модуляторы выключены
	  { // SB повышен уровень до 222/256 иначе ставятся SB других модуляторов
        if(WheelXX->ADC.AV_Off_Val > MDT.Sw.SB_Level2_L)//MDT.Sw.SB_Level)
        { // при SB отключается BTS142 и ставятся другого модулятора
#ifdef   __AxisF_Compile
         if(GndF_On)
#else
         if(GndR_On)
#endif
        	 _AV_ErrCnt_Inc(SB)
        }
 	    else _AV_ErrCnt_Dec(SB)
	  }
	  else
	  { if(WheelXX->MDT.EV.On) // другой клапан модулятора
		{ // другой клапан модулятора включен
		  // проверка замыкания клапанов SCV
	      if(WheelXX->ADC.AV_Off_Val > MDT.Sw.SB_Level2_L)//MDT.Sw.SB_Level)
	           _AV_ErrCnt_IncI(SCV)
	 	  else _AV_ErrCnt_DecI(SCV)
		}
	  }
	}
    // клапан EV
	WheelXX->MDT.EV.Err.Repeat = 0;
	if(WheelXX->MDT.EV.On)
	{ // включен клапан EV
	  // проверка замыкания
	  if(WheelXX->ADC.EV_On_Val < MDT.Sw.SC_Level)
	       _EV_ErrCnt_IncI(SC)
	  else _EV_ErrCnt_DecI(SC)
	  // время активации
	  if(WheelXX->MDT.EV.Err.Ton_Cnt < __MDT_ErrTon_Time)
		 WheelXX->MDT.EV.Err.Ton_Cnt++;
	}
	else
	{ // выключен клапан EV
	  // время активации
	  WheelXX->MDT.EV.Err.Ton_Cnt = 0;
	  // проверка обрыва
	  if(WheelXX->ADC.EV_Off_Val > MDT.Sw.NC_Level &&
		 WheelXX->ADC.EV_Off_Val < MDT.Sw.SB_Level)
	  {  
#ifdef   __AxisF_Compile
              if(!WheelXX->MDT.TwoNC && GndF_On)
#else
              if(!WheelXX->MDT.TwoNC && GndR_On)
#endif
	       _EV_ErrCnt_Inc(NC)
	  }
	  else _EV_ErrCnt_Dec(NC)
	  // проверка замыкания на +
	  // выполняется только если все выключены
	  if(!MDT.Sw.On)  // все модуляторы выключены
	  { // SB
        if(WheelXX->ADC.EV_Off_Val > MDT.Sw.SB_Level2_L)//MDT.Sw.SB_Level)
        {  
#ifdef   __AxisF_Compile
         if(GndF_On)
#else
         if(GndR_On)
#endif
        	 _EV_ErrCnt_Inc(SB)
        }
 	    else _EV_ErrCnt_Dec(SB)
	  }
	  else
	  {	if(WheelXX->MDT.AV.On) // другой клапан модулятора
		{ // другой клапан модулятора включен
		  // проверка замыкания клапанов SCV
	      if(WheelXX->ADC.EV_Off_Val > MDT.Sw.SB_Level2_L)//MDT.Sw.SB_Level)
	 	       _EV_ErrCnt_IncI(SCV)
	 	  else _EV_ErrCnt_DecI(SCV)
		}
	  }
	}
	// при двух обрывах ставим флаг TwoNC
	if(WheelXX->MDT.AV.Err.NC_Cnt > __MDT_2NC_Time &&
	   WheelXX->MDT.EV.Err.NC_Cnt > __MDT_2NC_Time)
	   WheelXX->MDT.TwoNC = 1;
	// запросы на повтор теста
	if(WheelXX->MDT.AV.Err.Repeat ||
	   WheelXX->MDT.EV.Err.Repeat)
		MDT.Sw.Repeat = 1; //  будет повторяться тест модулятора
  }
#endif
} // end Analysis_MDT

#define _Dif_ErrCnt_Inc(E) {\
{	if(Dif->Fail.E##_Cnt <__DIF_ErrCnt_Max) \
	   Dif->Fail.E##_Cnt++;  }              \
} //end macroc
#define _Dif_ErrCnt_Dec(E) {\
	if(Dif->Fail.E##_Cnt)                   \
	   Dif->Fail.E##_Cnt--;                 \
} //end macroc
#define _Dif_ErrCnt_IncI(E) {\
{	if(Dif->Fail.E##_Cnt <__DIF_ErrCnt_MaxI) \
	{  Dif->Fail.E##_Cnt++;  				 \
       Dif->Fail.Repeat = 1; }}              \
} //end macroc
#define _Dif_ErrCnt_DecI(E) {\
{   if(Dif->Fail.E##_Cnt <__DIF_SetErr_TimeI) \
	   Dif->Fail.E##_Cnt = 0;                \
    else Dif->Fail.E##_Cnt--;}				 \
} //end macro
void     Analysis_Dif (DifTypeDef* Dif)
{
	if(!BTS142_GND_On)
	{ // выключена земля клапанов
	  if(Dif->ADC.Off_Val < MDT.Sw.SB_Level)
	  { _Dif_ErrCnt_Dec(SB)
		if(!Dif->Fail.SB_Cnt)
			Dif->Error.Bits.SB = 0;
	  }
    }
    else
	{ Dif->Fail.Repeat = 0;
	  if(Dif->St_On)
	  { // включен клапан
	    // время активации
	    if(Dif->Fail.Ton_Cnt < __MDT_ErrTon_Time)
		   Dif->Fail.Ton_Cnt++;
	    // проверка замыкания
	    if(Dif->ADC.On_Val < MDT.Sw.SC_Level)
		     _Dif_ErrCnt_IncI(SC)
	    else _Dif_ErrCnt_DecI(SC)
	  }
	  else
	  { // выключен клапан
	    // время активации
	    Dif->Fail.Ton_Cnt = 0;
	    // проверка обрыва
	    if(Dif->ADC.Off_Val > MDT.Sw.NC_Level &&
		   Dif->ADC.Off_Val < MDT.Sw.SB_Level)
	    {
#ifdef   __AxisF_Compile
         if(GndF_On)
#else
         if(GndR_On)
#endif
	    	 _Dif_ErrCnt_Inc(NC)
	    }
	    else _Dif_ErrCnt_Dec(NC)
	    { // проверка замыкания на +
		  // выполняется только если все выключены
		  if(Dif->ADC.Off_Val > MDT.Sw.SB_Level)
	      { // при SB отключается BTS142 и ставятся другого модулятора
#ifdef   __AxisF_Compile
         if(GndF_On)
#else
         if(GndR_On)
#endif
	           _Dif_ErrCnt_Inc(SB)
	      }
		  else _Dif_ErrCnt_Dec(SB)
	    }
	  }
	  if(Dif->Fail.Repeat)
		 MDT.Sw.Repeat = 1; //  будет повторяться тест модулятора
    }
} // end Analysis_Dif

// по резальтатам ADC устанавливает счетчики неисправностей
void     MDT_Results_ADC (void)
{  // вызывается в myHAL_TIM_OC_DelayElapsedCallback

#ifdef   __AxisF_Compile
// снимаем ADC
	    ADC_MDT(&Wheel_FL);
	    ADC_MDT(&Wheel_FR);
	    ADC_Dif(&FrontDif);
	    ADC_GNDsw (&BTS142_GNDF);
	    Test_GND_Active = 0;
	    // выключаем клапана
	    if(MDT_Valve_Fl)
	    {  MDT_KL = 0;
	       MDT_KL2 = 0;
	       _Port_Off(AVFL); // 0 To Port
	       _Port_Off(EVFL); // 0 To Port
	       _Port_Off(AVFR); // 0 To Port
	       _Port_Off(EVFR); // 0 To Port
	       _Port_Off(IN_DIFF); // 0 To Port
	    }
// обрабатываем данные ацепирования
	    Analysis_MDT(&Wheel_FL);
	    Analysis_MDT(&Wheel_FR);
	    Analysis_Dif(&FrontDif);
#endif

#ifdef   __AxisR_Compile
#ifdef   __Axis3_Compile
// снимаем ADC
	    ADC_MDT(&Wheel_RL);
	    ADC_MDT(&Wheel_RR);
	    ADC_MDT(&Wheel_3L);
	    ADC_MDT(&Wheel_3R);
	    ADC_Dif(&RearDif);
	    ADC_Dif(&TrailerDif);
	    if(!LIM_PK_Active) ADC_PK();
	    ADC_GNDsw (&BTS142_GNDR);
#ifdef __Square_Board
	    if(!LSSw_Handling)
	    ADC_GNDsw (&BSP75_LASR);
#endif
	    Test_GND_Active = 0;
	    // выключаем клапана
	    if(MDT_Valve_Fl)
	    {  MDT_KL = 0;
	       MDT_KL2 = 0;
	       _Port_Off(AVRL); // 0 To Port
	       _Port_Off(EVRL); // 0 To Port
	       _Port_Off(AVRR); // 0 To Port
	       _Port_Off(EVRR); // 0 To Port
	       _Port_Off(AV3L); // 0 To Port
	       _Port_Off(EV3L); // 0 To Port
	       _Port_Off(AV3R); // 0 To Port
	       _Port_Off(EV3R); // 0 To Port
	       _Port_Off(IN_DIFR); // 0 To Port
	       _Port_Off(IN_DIFT); // 0 To Port
	       _Port_Off(IN_PK); // 0 To Port
	    }
// обрабатываем данные ацепирования
	    Analysis_MDT(&Wheel_RL);
	    Analysis_MDT(&Wheel_RR);
	    Analysis_MDT(&Wheel_3L);
	    Analysis_MDT(&Wheel_3R);
	    Analysis_Dif(&RearDif);
	    Analysis_Dif(&TrailerDif);
	    Analysis_Test_PK();
#else
	    ADC_MDT(&Wheel_RL);
	    ADC_MDT(&Wheel_RR);
	    ADC_Dif(&RearDif);
	    ADC_Dif(&TrailerDif);
	    if(!LIM_PK_Active) ADC_PK();
	    ADC_GNDsw (&BTS142_GNDR);
#ifdef __Square_Board
	    if(!LSSw_Handling)
	    ADC_GNDsw (&BSP75_LASR);
#endif
	    Test_GND_Active = 0;
	    // выключаем клапана
	    if(MDT_Valve_Fl)
	    {  MDT_KL = 0;
	       MDT_KL2 = 0;
	       _Port_Off(AVRL); // 0 To Port
	       _Port_Off(EVRL); // 0 To Port
	       _Port_Off(AVRR); // 0 To Port
	       _Port_Off(EVRR); // 0 To Port
	       _Port_Off(IN_DIFR); // 0 To Port
	       _Port_Off(IN_DIFT); // 0 To Port
	       _Port_Off(IN_PK); // 0 To Port
	    }
// обрабатываем данные ацепирования
	    Analysis_MDT(&Wheel_RL);
	    Analysis_MDT(&Wheel_RR);
	    Analysis_Dif(&RearDif);
	    Analysis_Dif(&TrailerDif);
	    Analysis_Test_PK();
#endif
#endif
} // end MDT_Analiz_ADC()

//********************************************************************
//                      LowSide_Switch
//********************************************************************
#define __LSSw_SetErr_Time    1000
#define __LSSw_SetErr_TimeI   4
#define __LSSw_ErrCnt_Max     2000
#define __LSSw_ErrCnt_MaxI    6

#define __GNDsw_SetErr_TimeI   __MDT_SetErr_TimeI + 3
#define __GNDsw_ErrCnt_MaxI    __MDT_ErrCnt_MaxI + 3

#define __LSSw_Test_Period    500  //0,5c
// задержка на переключение BTS5215
#define __LSSw_Valve_Delay    300  //300 mkc
#define __LSSw_LevelSC_Koef   42  // 1/6
#define __LSSw_LevelSB_Koef   200 //170 // 2/3
#define __LSSw_LevelNC_Koef   85  // 1/3

#define __LSSwGND_LevelNC   1500  // ??
#define __LSSwGND_LevelSC   200  // ??
//#define __LSSwGND_LevelSB   10  // ??

#define __LSSw_Ubat_Min  20  //

//-----------------ФУНКЦИИ переключения LSSw --------------------
#ifdef   IN_WL_Pin
void     BSP75_WL_OnOff (void)
{
	if(BSP75_WL.In) _Port_On(IN_WL); // состояние On 1 To Port
	else           _Port_Off(IN_WL); //состояние  Off 0 To Port
} // end BSP75_WL_OnOff()
#endif

#ifdef  IN_DBR_Pin
void     BSP75_DBR_OnOff (void)
{
	if(BSP75_DBR.In) _Port_On(IN_DBR); // состояние On 1 To Port
	else            _Port_Off(IN_DBR); //состояние  Off 0 To Port
} // end BSP75_DBR_OnOff()
#endif

#ifdef  IN_GNDF_Pin
void     BTS142_GNDF_OnOff (void)
{
#ifdef   __GNDsw_IN_Inverted
// сигнал BTS142_In инвертирован
	if(BTS142_GNDF.In) _Port_Off(IN_GNDF); // состояние On 0 To Port
	else                _Port_On(IN_GNDF); //состояние Off 1 To Port
#else
// новый квадратный блок
	if(BTS142_GNDF.In) _Port_On(IN_GNDF); // состояние On 1 To Port
	else               _Port_Off(IN_GNDF); //состояние Off 0 To Port
#endif
} // end BTS142_GNDF_OnOff()
#endif

#ifdef   IN_LASR_Pin
void     BSP75_LASR_OnOff (void)
{
	if(BSP75_LASR.In) _Port_On(IN_LASR); // состояние On 1 To Port
	else             _Port_Off(IN_LASR); //состояние  Off 0 To Port
} // end BSP75_LASR_OnOff()
#endif

#ifdef   IN_GNDR_Pin
void     BTS142_GNDR_OnOff (void)
{
#ifdef   __GNDsw_IN_Inverted
// сигнал BTS142_In инвертирован
	if(BTS142_GNDR.In) _Port_Off(IN_GNDR); // состояние On 0 To Port
	else                _Port_On(IN_GNDR); //состояние  Off 1 To Port
#else
// новый квадратный блок
	if(BTS142_GNDR.In)  _Port_On(IN_GNDR); // состояние On 1 To Port
	else               _Port_Off(IN_GNDR); //состояние Off 0 To Port
#endif
} // end BTS142_GNDR_OnOff()
#endif

// основная процедура нижних ключей
void     LowSide_Switch (void)
{ // вызывается в My_Tick() // 1ms

// ----------перенос из DZ System ----------------------------------
#define __BlocOn_Delay         3500  //3,5c
#define __OffRoad_Lamp_Cycle   1000  //1c
#define __ASR_BlinkLamp_Cycle  1000  //1c
#define __MDT_Req_GndOff_Cycle 5000  //5c
#ifdef   __AxisR_Compile
	// для зада нужно
	if(LSSw.BlocOn_Cnt < __BlocOn_Delay)
	   LSSw.BlocOn_Cnt++;
	else BlockON_Complete = 1;
#endif
	//--------------------- Test ----------------------------------------
	// пороги
	LSSw.U_bat = Power.KL15Value;
	LSSw.Test.NC_Level = (uint32_t)LSSw.U_bat *__LSSw_LevelNC_Koef /256;
	LSSw.Test.SC_Level = (uint32_t)LSSw.U_bat *__LSSw_LevelSC_Koef /256;
	LSSw.Test.SB_Level = (uint32_t)LSSw.U_bat *__LSSw_LevelSB_Koef /256;
	// Test_Enable
	if(LSSw.U_bat >__LSSw_Ubat_Min &&
	   BlockON_Complete)
		 LSSw_Test_Enable = 1;
	else LSSw_Test_Enable = 0;
	// запуск теста
    if(LSSw_Test_Enable )
    { if(LSSw.Test.Cnt++ > __LSSw_Test_Period)
      { LSSw.Test.Cnt = 0;
        LSSw_Test_Active = 1;
      }
    }

#ifdef   __AxisF_Compile
	// ------------обработка лампы ABS  WL--------------
	if(!BlockON_Complete || // горит 3,5c после влючения
	   Fatal_Failure)
		LampABS_ON = 1;
	else
	{ if(BlinkCode_Active)
	  { // обработка мигающий код неиспраностей

	  }
	  else // ?? можно вместе
	  if(DIA_Lamps_Fl)     // режим диагностики
	  { if(DIA_LampABS_ON) // ставится в Diagnose_Command()
		     LampABS_ON = 1;
	    else LampABS_ON = 0;
	  }
	  else
	  if(ABS_OffRoad) // моргание при  OFF_Road
	  { if(LSSw.OffRoad_Cnt++ < __OffRoad_Lamp_Cycle)
	    { if(LSSw.OffRoad_Cnt < __OffRoad_Lamp_Cycle/2)
	    	   LampABS_ON = 1;
	      else LampABS_ON = 0;
	    }
	    else LSSw.OffRoad_Cnt = 0;
	  }
	  else
	  { // сканирование неиспраностей
        if(WSS_Last_Error) LampABS_ON = 1;
        else
        { uint8_t E = (s_PrS_Error & __Mask_ErrPrS_WL);
          E |= s_Diff_Error;
          E |= s_ModT_Error;
          for (uint8_t i = 0; i < 19; i++)
        	  E |= Active_Faults[i];
          for (uint8_t i = 26; i < 34; i++)
        	  E |= Active_Faults[i];
          if(AGS_Install_Fail) E = 1;
          if(E) LampABS_ON = 1;
          else  LampABS_ON = 0;
        }
	  }
	}
	BSP75_WL.NC_Level = LSSw.Test.NC_Level;
	BSP75_WL.SC_Level = LSSw.Test.SC_Level;
	BSP75_WL.SB_Level = LSSw.Test.SB_Level;

	// ------------обработка DBR ------------------------
	BSP75_DBR.NC_Level = LSSw.Test.NC_Level;
	BSP75_DBR.SC_Level = LSSw.Test.SC_Level;
	BSP75_DBR.SB_Level = LSSw.Test.SB_Level;

	// ------------обработка  BTS142_GNDF---------------------
#ifdef __Rectangular_Board
	if(FrontDif.Error.Bits.SB ||
      ((Wheel_FL.MOD_Err0.Byte |
	    Wheel_FR.MOD_Err0.Byte) & __Mask_ModErr_SB))
#else
	if(FrontDif.Error.Bits.SB)
#endif
	     GndF_On = 0;
    else GndF_On = 1; // включен
	if(MDT_Valve_Fl)
	     GndF_On = 1;
	BTS142_GNDF.NC_Level = __LSSwGND_LevelNC;
	BTS142_GNDF.SC_Level = __LSSwGND_LevelSC;
	BTS142_GNDF.SB_Level = LSSw.Test.SB_Level;

	//-------------- Логика блока DM------------------------
#ifdef __Square_Board
	if(!LSSw_Handling)
	{
      BTS142_GND_On = GndF_On;
	  BTS142_GNDF.In = BTS142_GND_On;
	  ADC_GNDsw (&BTS142_GNDF);
	  //WL_Pin используется как CANT_H
	  // нужно  выключить ключ
	  BSP75_WL.In = 0;
	}
#else
    BTS142_GND_On = GndF_On;
	BTS142_GNDF.In = BTS142_GND_On;
	ADC_GNDsw (&BTS142_GNDF);
#endif
	if(LSSw_Handling)
	{ if(!BSP75_DBR.Error.Bits.SB)
		   BSP75_DBR.In = DBR_Request;
	  else BSP75_DBR.In = 0; 	// от нагрева ключа
	  if(!BSP75_WL.Error.Bits.SB)
		   BSP75_WL.In = LampABS_ON;
	  else BSP75_WL.In = 0; // от нагрева ключа
    }

	// -------- обработка результатов тестов ---------------
	BTS142_GNDF.Error = LSSw_Errors(&BTS142_GNDF);
	//MC1_GND_Error
	s_GND_Error = BTS142_GNDF.Error.Byte;

	if(LSSw_Handling)
	{
	  if(LampABS_install)
	  { BSP75_WL.Error = LSSw_Errors(&BSP75_WL);
	    if(Blink_Code_Enable)
	    BSP75_WL.Error.Bits.SC = 0;
	  }
	  s_Other_Error = BSP75_WL.Error.Byte;
	  if(ReleDBR_install)
		  BSP75_DBR.Error = LSSw_Errors(&BSP75_DBR);
	  s_DBR_Error = BSP75_DBR.Error.Byte;
	}
#endif

#ifdef   __AxisR_Compile
	// -------------обработка лампы ABS  WL-------------------
	if(!BlockON_Complete) // горит 3,5c после влючения
		LampASR_ON = 1;
	else
	{ if(DIA_Lamps_Fl)     // режим диагностики
	  { if(DIA_LampASR_ON) // ставится в Diagnose_Command()
		    LampASR_ON = 1;
	   else LampASR_ON = 0;
	  }
	  else
	  { // сканирование неиспраностей
        // ошибки горят всегда
		if(Fatal_Failure ||
		   ASR_SW_Condition ||  //выключен SW_ASR выключателем  ASR_disable
		   s_CANJ_Error ||
		   s_Prop_Error )
		  LampASR_ON = 1;
        else
		{ // моргание при  ASR_On
          if(ASR_EngineActive ||
        	 ASR_Brake_Active)
	      { if(LSSw.LASR_Cnt++ < __ASR_BlinkLamp_Cycle)
	        { if(LSSw.LASR_Cnt < __ASR_BlinkLamp_Cycle/2)
	    	       LampASR_ON = 1;
	          else LampASR_ON = 0;
	        }
	      else LSSw.LASR_Cnt = 0;
	    }
	      else
	      {	  LSSw.LASR_Cnt = 0;
		LampASR_ON = 0;
	      }
	    }
	  }
	}
	BSP75_LASR.NC_Level = LSSw.Test.NC_Level;
	BSP75_LASR.SC_Level = LSSw.Test.SC_Level;
	BSP75_LASR.SB_Level = LSSw.Test.SB_Level;

	// -------------обработка  BTS142_GNDR-----------------------
#ifdef __Rectangular_Board
	if(RearDif.Error.Bits.SB ||
	   TrailerDif.Error.Bits.SB ||
	   PropKL_SB ||                 // ;!!!!!!!!!  PK
	   ((Wheel_RL.MOD_Err0.Byte |
		 Wheel_RR.MOD_Err0.Byte) & __Mask_ModErr_SB))
#else
	if(RearDif.Error.Bits.SB)
#endif
		 GndR_On = 0;
    else GndR_On = 1;   // включен
	// при тестировании модуляторов включаем BTS142
	// !! не пугаться !! при SB стукает модулятор
	if(MDT_Valve_Fl)
      GndR_On = 1;

	BTS142_GNDR.NC_Level = __LSSwGND_LevelNC;//LSSw.Test.NC_Level;
	BTS142_GNDR.SC_Level = __LSSwGND_LevelSC;
	BTS142_GNDR.SB_Level = LSSw.Test.SB_Level;

#ifdef __Square_Board
	if(!TrailerDif.Error.Bits.SB ||
	   MDT_Valve_Fl)
		 GndT_On = 1;   // включен
	else GndT_On = 0;
#endif

	//-------------- Логика блока DM------------------------
	// LSSw задней оси используется всегда
	BTS142_GND_On = GndR_On;
	BTS142_GNDR.In = BTS142_GND_On;//GndR_On;
	ADC_GNDsw (&BTS142_GNDR);

	if(LSSw_Handling)
	{ // используется как LASR
	  if(BSP75_LASR.Error.Bits.SB)
		   BSP75_LASR.In = 0; // от нагрева ключа
	  else BSP75_LASR.In = LampASR_ON;
	}
	else
	{ // используется как DifT_Gnd
	  BSP75_LASR.In = GndT_On;
	  ADC_GNDsw (&BSP75_LASR);
	}

	// -------- обработка результатов тестов --------------
	BTS142_GNDR.Error = LSSw_Errors(&BTS142_GNDR);
	//MC2_GND_Error
	s_GND_Error = (BTS142_GNDR.Error.Byte & 0x07)<<3;

	if(LSSw_Handling)
	{ if(LampASR_install)
		BSP75_LASR.Error = LSSw_Errors(&BSP75_LASR);
	    s_Other_Error = (BSP75_LASR.Error.Byte & 0x07)<<3;
	}
	else
	{ // неисправности DifT_Gnd
	  // обрыв не поместился
	  BSP75_LASR.Error = LSSw_Errors(&BSP75_LASR);
	  s_GND_Error |= ((BSP75_LASR.Error.Byte & 0x06)>>1)<<6;
	}

#endif

    if(LSSw_Test_Active)
    { // запуск компаратора для формирования задержки включения ключа
      LSSw.Test.Delay =  (uint16_t)__HAL_TIM_GET_COUNTER(&htim4) +
        				           __LSSw_Valve_Delay;
      __HAL_TIM_SET_COMPARE(&htim4, TIM_CHANNEL_2, LSSw.Test.Delay);
      HAL_TIM_OC_Start(&htim4, TIM_CHANNEL_2);
      LSSw.Test.Cnt++;
    }
    // здесь обрабатываем данные ацепирования
    //       смена состояния при тестах
    //       передача состояния в порт
    LowSide_Impuls();
} // end LowSide_Switch()

void     LSSw_Test_Impuls (LSSwTypeDef* Sw)
{
	if(Sw->In)
	{  Sw->ADC.On_Val = (uint16_t)*(Sw->ADC_Ch); // снимаем ADC
	   Sw->Oss.On_Val = Sw->ADC.On_Val /__Koss;
	   LSSw_Test_Analysis(Sw); // обрабатываем данные ацепирования
	   if(LSSw_Test_Active)   // смена состояния при тестах
		    Sw->In = 0;     // смена On -> Off
	}
	else
	{  Sw->ADC.Off_Val  = (uint16_t)*(Sw->ADC_Ch); // снимаем ADC
	   Sw->Oss.Off_Val = Sw->ADC.Off_Val /__Koss;
	   LSSw_Test_Analysis(Sw); // обрабатываем данные ацепирования
	   if(LSSw_Test_Active)   // смена состояния при тестах
		    Sw->In = 1;     // смена Off -> On
       // не изменяем состояние
	}
} // end LSSw_Test_Impuls()

void     LowSide_Impuls (void)
{ // объединеные LSSw_Test_Impuls
  // вызывается в myHAL_TIM_OC_DelayElapsedCallback
  //		  и в LowSide_Switch()
	LSSw.Test.Cnt++;
#ifdef   IN_WL_Pin
	if(LSSw_Handling)
	LSSw_Test_Impuls(&BSP75_WL);
	// иначе WL_Pin используется как CANT_H
	BSP75_WL_OnOff();    // передача состояния в порт
#endif
#ifdef  IN_DBR_Pin
	if(LSSw_Handling)
	{  LSSw_Test_Impuls(&BSP75_DBR);
	  BSP75_DBR_OnOff();   // передача состояния в порт
	}
	// иначе IN_GNDF подключен к DBR
#endif
#ifdef   IN_LASR_Pin
	if(LSSw_Handling)
	{  LSSw_Test_Impuls(&BSP75_LASR);
	   BSP75_LASR_OnOff();
	}
	// иначе LASR является Gnd_DifT
	// на стенде TruckCim	соеденены Gnd_DifT и  Gnd_DifR
#endif
} // end LowSide_Impuls()

#define _LSSw_ErrCnt_Inc(E) {\
{	if(Sw->Fail.E##_Cnt <__LSSw_ErrCnt_Max) \
	   Sw->Fail.E##_Cnt++;  }               \
} //end macroc
#define _LSSw_ErrCnt_Dec(E) {\
	if(Sw->Fail.E##_Cnt)                    \
	   Sw->Fail.E##_Cnt--;                  \
} //end macroc
#define _LSSw_ErrCnt_IncI(E) {             \
{	if(Sw->Fail.E##_Cnt <__LSSw_ErrCnt_MaxI)   \
	{  Sw->Fail.E##_Cnt++;    \
	   Sw->Fail.Repeat = 1;}} \
} //end macroc
#define _LSSw_ErrCnt_DecI(E) {             \
{   if(Sw->Fail.E##_Cnt <__LSSw_SetErr_TimeI) \
	   Sw->Fail.E##_Cnt = 0;  \
    else Sw->Fail.E##_Cnt--;} \
} //end macroc
#define _GNDsw_ErrCnt_IncI(E) {             \
{	if(Sw->Fail.E##_Cnt <__GNDsw_ErrCnt_MaxI)   \
	{  Sw->Fail.E##_Cnt++;    \
	   Sw->Fail.Repeat = 1;}} \
} //end macroc
#define _GNDsw_ErrCnt_DecI(E) {             \
{   if(Sw->Fail.E##_Cnt <__GNDsw_SetErr_TimeI) \
	   Sw->Fail.E##_Cnt = 0;  \
    else Sw->Fail.E##_Cnt--;} \
} //end macroc

void     LSSw_Test_Analysis (LSSwTypeDef* Sw)
{ if(LSSw_Test_Enable)
{
	if(Sw->In)
	{ // включен клапан
	  // проверка замыкания на +
	  if(Sw->ADC.On_Val > Sw->SB_Level)
		   _LSSw_ErrCnt_IncI(SB)
	  else _LSSw_ErrCnt_DecI(SB)
	}
	else // выключен клапан
	{ // проверка обрыва
	  if(Sw->ADC.Off_Val > Sw->NC_Level &&
	     Sw->ADC.Off_Val < Sw->SB_Level)
		   _LSSw_ErrCnt_IncI(NC)
	  else _LSSw_ErrCnt_DecI(NC)
	  // проверка замыкания на землю
	  if(Sw->ADC.Off_Val < Sw->SC_Level)
    	   _LSSw_ErrCnt_IncI(SC)
	  else _LSSw_ErrCnt_DecI(SC)
	}
  }
} // end LSSw_Test_Analysis()

void     GNDsw_Test_Analysis (LSSwTypeDef* Sw)
{
	if(Sw->In)
	{ // включен клапан
	  // проверка замыкания на +
	  if(Sw->ADC.On_Val > Sw->SB_Level)
		   _GNDsw_ErrCnt_IncI(SB)
	  else _GNDsw_ErrCnt_DecI(SB)
	}
	else // выключен клапан
	{ // проверка обрыва
	  if(Sw->ADC.Off_Val > Sw->NC_Level &&
	     Sw->ADC.Off_Val < Sw->SB_Level)
		   _GNDsw_ErrCnt_IncI(NC)
	  else _GNDsw_ErrCnt_DecI(NC)
	  // проверка замыкания на землю
	  if(Sw->ADC.Off_Val < Sw->SC_Level)
#ifdef   __AxisF_Compile
	  { if(!FrontDif.Error.Bits.SC &&
		   !((Wheel_FL.MOD_Err0.Byte |
		      Wheel_FR.MOD_Err0.Byte) &
				      __Mask_ModErr_SC))
#else
	  { if(!RearDif.Error.Bits.SC &&
		   !TrailerDif.Error.Bits.SC &&
		   !PropKL_SC &&
		   !((Wheel_RL.MOD_Err0.Byte |
		      Wheel_RR.MOD_Err0.Byte) &
				      __Mask_ModErr_SC))
#endif
		   _GNDsw_ErrCnt_IncI(SC)
	  }
	  else _GNDsw_ErrCnt_DecI(SC)
	}
} // end GNDsw_Test_Analysis

_LSSw_Err_  LSSw_Errors (LSSwTypeDef* Sw)
{
_LSSw_Err_ GPR0;
uint16_t  Terr = __LSSw_SetErr_TimeI;
#ifdef   __AxisF_Compile
    if(Sw == &BTS142_GNDF)
    	  Terr = __GNDsw_SetErr_TimeI;
#else
    if(Sw == &BTS142_GNDR)
    	  Terr = __GNDsw_SetErr_TimeI;
#endif
    GPR0.Byte = 0;
	if(Sw->Fail.NC_Cnt > Terr)
			     GPR0.Bits.NC = 1;      // обрыв клапанa
	else
	if(Sw->Fail.SC_Cnt > Terr)
				 GPR0.Bits.SC = 1;      // замыканиe клапанa
	else
	if(Sw->Fail.SB_Cnt > Terr)
				 GPR0.Bits.SB = 1;      // замыканиe на +
	return GPR0;
}  // end LSSw_Errors

//#ifdef   __AxisF_Compile
void     DIA_LSSw_Oss(void)
{ // вызывается в DIA_Oss() MySystem.c
	// первая строка в Осциллографе
	UartDIA.Tx_data[0] = FrontDif.Oss.On_Val;
	UartDIA.Tx_data[3] = RearDif.Oss.On_Val;
	UartDIA.Tx_data[6] = TrailerDif.Oss.On_Val;
	UartDIA.Tx_data[9] = BTS142_GNDF.Oss.Off_Val;
	// вторая строка в Осциллографе
	UartDIA.Tx_data[1] = FrontDif.Oss.Off_Val;
	UartDIA.Tx_data[4] = RearDif.Oss.Off_Val;
	UartDIA.Tx_data[7] = TrailerDif.Oss.Off_Val;
	UartDIA.Tx_data[10]= BTS142_GNDF.Oss.On_Val;
	// третья строка в Осциллографе
	UartDIA.Tx_data[2] = BSP75_WL.Oss.Off_Val;
	UartDIA.Tx_data[5] = BSP75_LASR.Oss.Off_Val;
	UartDIA.Tx_data[8] = BSP75_DBR.Oss.Off_Val;
	UartDIA.Tx_data[11]= BTS142_GNDR.Oss.Off_Val;
	// четвертая строка в Осциллографе
	UartDIA.Tx_data[12] = BSP75_WL.Oss.On_Val;
	UartDIA.Tx_data[13] = BSP75_LASR.Oss.On_Val;
	UartDIA.Tx_data[14] = BSP75_DBR.Oss.On_Val;
	UartDIA.Tx_data[15] = BTS142_GNDR.Oss.On_Val;
	// пятая строка в Осциллографе
	UartDIA.Tx_data[16] = LSSw.U_bat /__Koss;
	UartDIA.Tx_data[17] = LSSw.Test.SB_Level /__Koss;//TestMod_Enable;//LSSw.Test.Cnt;
	UartDIA.Tx_data[18] = System_F2; // | System_F2_MC2; // GndF_On LampABS_ON
	UartDIA.Tx_data[19] = System_F1; // SW_Condition
	// шестая строка в Осциллографе
	UartDIA.Tx_data[20] = CANS_InitState;
	UartDIA.Tx_data[21] = cCANS.Rx_Cnt;
	UartDIA.Tx_data[22] = 3;//;
	UartDIA.Tx_data[23] = 4;//6;

} // End DIA_LSSw_Oss()
//#endif

#ifdef   __ASR_Compile
//********************************************************************
//                       ASR
//********************************************************************
#define   __ASRB_Cut_Delay  100   //
#define   __ASRB_Thr_Mul    256//180//384   //+50%
#define   __ASRB_Thr_Sleep  487   //+90%
#define   __ASRB_Thr_Acc    20
#define   __ASRB_Diff_T     10 //за 50mc
#define   __ASRB_Int_Dec    0x00006000
//#define   __ASRB_Int_Max    0x003C0000 //3atm
#define   __ASRB_Delta_Lim  0x0800 // 0x0200
#define   __ASRB_Demph_T    20
#define   __ASR_DifPressOff 0x1000

void     ASR_Brake_PID(TypeDef_ASRB* ASRB_XX)
{
	// фильтрация Delta
	ASRB_XX->Filt_Delta.Xn = (int32_t)ASRB_XX->dSp;
	ASRB_XX->Delta = Filter_Cheb(&ASRB_XX->Filt_Delta, Koef_Filtr2Hz);//1Hz

    // Определение производной ASRB_XX->Delta
	ASRB_XX->AccBuf[0] = ASRB_XX->Delta;
	ASRB_XX->Diff = DeriVative(ASRB_XX->AccBuf, __ASRB_Diff_T); //за 75mc

	// ограничения Delta
	int16_t D = ASRB_XX->Delta;
	if(D > __ASRB_Delta_Lim)
	   D = __ASRB_Delta_Lim;

	//  PID интегратор
	if(D > 0)
		 ASRB_XX->Integrator += D * ASR.CFG.KintI /256;
	else ASRB_XX->Integrator += D * ASR.CFG.KintD /256;
	// убавление интегратора если отпущен газ
	if(!CAN_Engine.Torque &&
	    ASR.Engine.Torque &&
		ASRB_XX->Integrator > 0)
	    ASRB_XX->Integrator -= __ASRB_Int_Dec;
	// ограничения интегратора
	if(ASRB_XX->Integrator < 0)
	   ASRB_XX->Integrator = 0;
	if(ASRB_XX->Integrator > ASR.Brake.Pmax*256)
	   ASRB_XX->Integrator = ASR.Brake.Pmax*256;

	// интегральная состaвляющая PID регулятора
	ASRB_XX->PID = ASRB_XX->Integrator / 256;

	// пропорциональная состaвляющая PID регулятора
	ASRB_XX->PID += D * ASR.CFG.Kpro /256;

	// дифференциальная состaвляющая PID регулятора
	ASRB_XX->PID += ASRB_XX->Diff * ASR.CFG.Kdif /256;

	// ограничения выхода регулятора
	if(ASRB_XX->PID < 0)
	   ASRB_XX->PID = 0;
	else
	if(ASRB_XX->PID > (uint32_t)ASR.Brake.Pmax)
	   ASRB_XX->PID = (uint32_t)ASR.Brake.Pmax;

} // end ASR_Break_PID

#define   __ASRE_Sp_Thr     0x1700 // 23km/h
#define   __ASRE_Sl_K       20 //33
#define   __ASRE_Thr_Con    0x0180 // 1.5km/h  23 14%
#define   __ASRE_Thr_Con2   0x0380 // 3.5km/h
#define   __ASRE_dSp_ON     0x0040 // 0,25km/h
#define   __ASRE_dSp_OFF    0x0180 // 1,5km/h
// размерность ускорения колеса 1м/c^2 - 5lsb
#define   __ASRE_WxAcc_ON   0x000F // 3m/c2
#define   __ASRE_OFF_Delay  70 //40
#define   __ASRE_Int_Min    0x00020000
#define   __ASRE_Int_Max    0x00780000
#define   __ASRE_PID_Max    0x00007D00

void     ASR_Regulate(void)
{ //5ms

    // Check_ASR_Failures
    if((Check_Safe(&Wheel_FL) && Wheel_FL.State.Bits.b7 &&
        Check_Safe(&Wheel_FR) && Wheel_FR.State.Bits.b7) ||
    	Fatal_Failure ||
		(!KoefSpeed_Enable )) // определены оба TCO.Front.Koef
    { // полное отключение ASR
      // обе передние нулевые и
      // есть неисправности по датчику
      ASR_Brake_Failed = 1;
      ASR_Engine_Failed = 1;
    }
    else
    { if(s_Prop_Error ||
   		 s_CANJ_Error)
    	   ASR_Engine_Failed = 1;
      else ASR_Engine_Failed = 0;
      // здесь будет ASR_Brake_Failed
      if(RearDif.Error.Byte ||
         Wheel_RL.MOD_Err0.Byte || // неисправности модуляторов
         Wheel_RR.MOD_Err0.Byte ||
		 Wheel_RL.Sen_Err0.Byte || // неисправности по датчику
		 Wheel_RR.Sen_Err0.Byte)
    	   ASR_Brake_Failed = 1; // неисправности модуляторов
      else ASR_Brake_Failed = 0;
    }

// Определение  скоростей осей
// не нулевые и без ошибок и Safe

	// скорость передней оси
    if( Check_Safe(&Wheel_FR) &&
       !Check_Safe(&Wheel_FL))
    	 ASR.FrontSpeed = Wheel_FL.Speed;
    else
    if( Check_Safe(&Wheel_FL) &&
       !Check_Safe(&Wheel_FR))
    	 ASR.FrontSpeed = Wheel_FR.Speed;
    else
    { // нет ошибок и Safe берем наибольшую
      if(Wheel_FL.Speed > Wheel_FR.Speed)
    	   ASR.FrontSpeed = Wheel_FL.Speed;
      else ASR.FrontSpeed = Wheel_FR.Speed;
    }

	// средняя скорость задней оси
    if(Check_Safe(&Wheel_RL) && Wheel_RR.Speed)
    	 ASR.RearSpeed = Wheel_RR.Speed;
    else
    if(Check_Safe(&Wheel_RR) && Wheel_RL.Speed)
    	 ASR.RearSpeed = Wheel_RL.Speed;
    else ASR.RearSpeed = ((uint32_t)Wheel_RL.Speed +
			              (uint32_t)Wheel_RR.Speed) / 2;
// Определение  порога
	ASR.Engine.Thr = (uint32_t)ASR.FrontSpeed * ASR.CFG.Slip /65536;
	ASR.Engine.Thr += __ASRE_Thr_Con;
	uint16_t ThrMin = (uint32_t)__ASRE_Sp_Thr * ASR.CFG.Slip /65536 +
			          __ASRE_Thr_Con;
	if(ASR.Engine.Thr < ThrMin)
	   ASR.Engine.Thr = ThrMin; // порог
	// первая точка перелома +3
	if(ASR.FrontSpeed < __ASRE_Sp_Thr)
	   ASR.Engine.Thr += (((uint32_t)__ASRE_Sp_Thr -
			               (uint32_t)ASR.FrontSpeed) * __ASRE_Sl_K /256);
	// добавка если отсутствует скорость передней оси
	if(ASR.FrontSpeed < __ASRE_Thr_Con2)
	   ASR.Engine.Thr += __ASRE_Thr_Con2;

	// опорная  скоростъ
	// добавить птичку
	ASR.Engine.Filt_Ref.Xn = (uint32_t)ASR.FrontSpeed + ASR.Engine.Thr;
	ASR.Engine.Ref = Filter_Cheb(&ASR.Engine.Filt_Ref, Koef_Filtr5Hz); //Koef_Filtr1Hz

//------------- определение события Engine ASR------------------
	if(ASR_Engine_Enable &&  // ASR_Engine разрещен в конфигурации
	   !ASR_Disable &&       // нет запретов
	   !ASR_Engine_Failed)   // нет неисправностей
	{
   	  if(!ASR_Engine_Event)
   	  { // Активация
   		uint16_t Thr_On = ASR.Engine.Ref + __ASRE_dSp_ON;
   	    if(ASR.RearSpeed > Thr_On ||
   		   ( Wheel_RL.Speed > Thr_On &&
   		    !Wheel_RL.State.Bits.b5 && // нет Safe_dT
   		    Wheel_RL.Accel > __ASRE_WxAcc_ON) ||    //Acc > 3m/c2
		   ( Wheel_RR.Speed > Thr_On &&
		    !Wheel_RR.State.Bits.b5 &&   // нет Safe
		    Wheel_RR.Accel > __ASRE_WxAcc_ON))
   	    { if(ASR.Engine.Delay++ > ASR.CFG.OnDelay)  //__ASRE_ON_Delay
   	      {
   	    	ASR_Engine_Event = 1;
   	    	ASR.Engine.Delay = __ASRE_OFF_Delay;
   	      }
   	    }
   	    else
   	    if(ASR.Engine.Delay)
   	       ASR.Engine.Delay--;
   	  }
   	  else
   	  { // Деактивация
   		uint16_t Thr_Off = ASR.Engine.Ref - __ASRE_dSp_OFF;
   	    if((ASR.RearSpeed < Thr_Off &&
   	        Wheel_RL.Speed < Thr_Off &&
		    Wheel_RR.Speed < Thr_Off) )
   	    {
   	      if(!--ASR.Engine.Delay)
   	    	ASR_Engine_Event = 0;
   	    }
  	    else
  	    if(ASR.Engine.Delay < __ASRE_OFF_Delay)
  	       ASR.Engine.Delay++;
   	  }
	}
	else ASR_Engine_Event = 0;

 	// --------------  Engine Tout ------------------
	// счетчик нулевой скорости переда
	if(!ASR.FrontSpeed)
	{ if(ASR_Engine_Event && // нет скорости переда и активно событие ASR_Engine
	     ASR.Engine.SpF_Zcnt < ASR.CFG.EngineTout)
		 ASR.Engine.SpF_Zcnt++;
	}
	else
	{ if(ASR.Engine.SpF_Zcnt)
		 ASR.Engine.SpF_Zcnt--;
	}
	// Engine Tout
	if(ASR_EngTout_Enable)
	{
	  if(ASR_Engine_Event)
	  {
	    if(ASR.Engine.Tout < ASR.CFG.EngineTout)
	       ASR.Engine.Tout++;
	    else ASR_Engine_Tout = 1;
	  }
	  else // не активно событие ASR_Engine
	  { if(ASR.Engine.SpF_Zcnt < ASR.CFG.EngineTout &&
		   ASR_Engine_Tout) // сбрасываем если счетчик не набрал макс.значения
		   ASR.Engine.Tout = 0;
	    if(ASR.Engine.Tout)
		   ASR.Engine.Tout--;
	    else ASR_Engine_Tout = 0;
	  }
	}

	// вызов процедуры ASR_Engine_Regulate()
	if(ASR_Enable)
	   ASR_Engine_Regulate();
	else
	{ ASR.Engine.Torque = 0x7D;
	  ASR.Engine.Torq_EM1 = 0x7D;
	  ASR.Engine.Torq_EM2 = 0x7D;
	  ASR.Engine.Taxo = 0xFFFF;
	}
	//
	ASR_Brake_Regulate();
}

//--------------------- ASR_Engine_Regulate ----------------------------
void     ASR_Engine_Regulate(void)
{
	uint16_t   FiltOut;

	// рассогласование скоростей
	ASR.Engine.dSp = (int32_t)ASR.Engine.Ref -
			         (int32_t)ASR.RearSpeed;
	// Фильтруем дельту
	ASR.Engine.Filt_Delta.Xn = ASR.Engine.dSp;
	ASR.Engine.Delta = Filter_Cheb(&ASR.Engine.Filt_Delta, Koef_Filtr1Hz);
	//  Определение производной ASR.Engine.Delta
 	ASR.Engine.AccBuf[0] = ASR.Engine.Delta;
	ASR.Engine.Diff = DeriVative(ASR.Engine.AccBuf, __ASRE_Diff_T); //за 100mc

	//----------------PID регулятор------------------------------------
	// интегратор PID регулятора
	if(!ASR_EngineActive)
        ASR.Engine.Integrator = CAN_Engine.Torque * ASR.Engine.CFG.Kgaz * 256;
	else
	{ int32_t dI;
	  if(ASR.Engine.dSp > 0)
		   dI = (int32_t)ASR.Engine.dSp *
		                  ASR.Engine.CFG.KintI /256;
	  else dI = (int32_t)ASR.Engine.dSp *
			              ASR.Engine.CFG.KintD /256;
	  ASR.Engine.Integrator += dI;
	  // ограничения интегратора
	  if(ASR.Engine.Integrator < __ASRE_Int_Min)
	     ASR.Engine.Integrator = __ASRE_Int_Min;
	  if(ASR.Engine.Integrator > __ASRE_Int_Max)
	     ASR.Engine.Integrator = __ASRE_Int_Max;
	}

	// пропорциональная состaвляющая PID регулятора
	ASR.Engine.PID = (int32_t)ASR.Engine.Delta *
			                  ASR.Engine.CFG.Kpro /256;

	// интегральная состaвляющая PID регулятора
	ASR.Engine.PID += ASR.Engine.Integrator / 256;

	// дифференциальная состaвляющая PID регулятора
	ASR.Engine.PID += (int32_t)ASR.Engine.Diff *
			                   ASR.Engine.CFG.Kdif /256;

	//состaвляющая от давления
	// через коеффициент
	ASR.Engine.Torq_kP = ASR.Engine.CFG.Kpress *
		                (ASR.Brake.RL.Integrator +
		                 ASR.Brake.RR.Integrator) /65536;
    // через расчет момента
	if(ASR_Brake_Active)
	{    ASR.Engine.Torq_fP = Torque_Press(&Wheel_RL);
	     ASR.Engine.Torq_fP += Torque_Press(&Wheel_RR);
	}
	else ASR.Engine.Torq_fP = 0;

	if(ASR_Torq_KoefPress) //CFG
		 ASR.Engine.PID +=ASR.Engine.Torq_kP;
	else ASR.Engine.PID +=ASR.Engine.Torq_fP;

	// ограничения выхода регулятора
	if(ASR.Engine.PID < 0)
	   ASR.Engine.PID = 0;
	else
	if(ASR.Engine.PID > __ASRE_PID_Max)
	   ASR.Engine.PID = __ASRE_PID_Max;

	// фильтрация
	if(ASR_Torq_Filtr)  // CFG фильтрация момента
	{
	  ASR.Engine.Filt_Torq.Xn = ASR.Engine.PID;
	  FiltOut = Filter_Cheb(&ASR.Engine.Filt_Torq, Koef_Filtr5Hz);
      if(FiltOut < __uintYnMinus)
    	   ASR.Engine.Torque = FiltOut /256;
	  else ASR.Engine.Torque = 0;
	}
	else   ASR.Engine.Torque = ASR.Engine.PID/256;

	// индивидуальное регулирование моментов
	// для двух эл.моторов MAZ 5450

	if(ASR_Two_Engine && // CFG
	   Find_EEC1_81 && // левый эл.мотор
	   Find_EEC1_82)  // правый эл.мотор
	{
#define   __ASRE_Torq_Force  40
	if(!ASR_Brake_Left && !!ASR_Brake_Right)
	{ ASR.Engine.Torq_EM1 = ASR.Engine.Torque;
	  ASR.Engine.Torq_EM2 = ASR.Engine.Torque;
	}
	else
	{ if(ASR_Brake_Left)
	  {  ASR.Engine.Torq_EM1 = ASR.Engine.Torque;
	     if(ASR.Engine.Torque <__ASRE_Torq_Force)
	          ASR.Engine.Torq_EM2 =__ASRE_Torq_Force;
	     else ASR.Engine.Torq_EM2 = ASR.Engine.Torque;
	  }
	  if(ASR_Brake_Left)
	  {	 ASR.Engine.Torq_EM2 = ASR.Engine.Torque;
	     if(ASR.Engine.Torque <__ASRE_Torq_Force)
	          ASR.Engine.Torq_EM1 =__ASRE_Torq_Force;
	     else ASR.Engine.Torq_EM1 = ASR.Engine.Torque;
	  }
	}
	}

//--------------------- Engine Taxo   ----------------------------------
#define   __ASR_RefTaxo_Min 0x0600 // 6km/h
#define   __ASR_RefTaxo_SpI 0x1700 // 23km/h
#define   __ASR_RefTaxo_K   100
#define   __ASR_OFF_Delay   200  // 0,5c
#define   __ASR_OFF_dTaxo  1600	//200rpm
#define   __ASR_KTS_AdjThr    200

	uint16_t Taxo;

	// --------опорная  скоростъ---------------------------

	ASR.Engine.Slip = ASR.CFG.Slip;//__ASRE_Sl_K1*256;
	if(ASR.FrontSpeed < __ASR_RefTaxo_SpI)
	   ASR.Engine.Slip +=((uint32_t)__ASR_RefTaxo_SpI -
				          (uint32_t)ASR.FrontSpeed) * __ASR_RefTaxo_K /32;

	uint16_t  Ref2 = ASR.FrontSpeed;
	Ref2 += (uint32_t)ASR.FrontSpeed *
			          ASR.Engine.Slip /65536;
	if(Ref2 < __ASR_RefTaxo_Min)
	   Ref2 = __ASR_RefTaxo_Min;

	// опорная  скоростъ
	ASR.Engine.Filt_Ref2.Xn = (uint32_t)Ref2;
	ASR.Engine.RefTaxo = Filter_Cheb(&ASR.Engine.Filt_Ref2, Koef_Filtr5Hz);


	if(!ASR_Engine_Event)
	{ // фаза ожидания ASR_Event
		ASR_KTS_Adj = 0;
	}

	if(ASR_EngineActive)
	{
	  if(ASR_Engine_Event)
	  {
		ASR.Engine.OffCnt = 0;
	    if(!ASR_KTS_Adj)
		{ // фаза адаптация KTS
		  ASR_KTS_Adj = 1;
		  ASR.Engine.KTS = (uint32_t)CAN_Engine.Taxo * __KTS_Koef /
					              ASR.Engine.RefTaxo;
		}
	    else
	    { // фаза регулирование оборотов
          if(ASR_KTS_Adj_Enable)
          { ASR.Engine.AdjThr = ASR.Engine.KTS * 10/256;
            if(ASR.Engine.KTS > (KTS.KoefTaxoSpeed + ASR.Engine.AdjThr))
        		 ASR.Engine.KTS-=5;
            if((ASR.Engine.KTS + ASR.Engine.AdjThr) < KTS.KoefTaxoSpeed)
        		 ASR.Engine.KTS+=5;
          }
          else
          ASR.Engine.KTS = KTS.KoefTaxoSpeed;//(uint32_t)CAN_Engine.Taxo * __KTS_Koef /
		                    				 //ASR.RearSpeed;
	    }
	  }
	  else
	  { // фаза выхода
	    if(ASR.Engine.OffCnt++ > __ASR_OFF_Delay ||       // выход после задержки
		   ASR.Engine.Taxo > (CAN_Engine.Taxo +__ASR_OFF_dTaxo)) // обороты уменьшились
		   ASR_EngineActive = 0; // выключение
	  }
	  // задание оборотов
	  Taxo = (uint32_t)ASR.Engine.KTS *
			           ASR.Engine.RefTaxo / __KTS_Koef;
	  if(ASR_dTaxo_Lim &&
		 Taxo <(CAN_Engine.Taxo - ASR.CFG.dTaxoLim))
		 Taxo = CAN_Engine.Taxo - ASR.CFG.dTaxoLim;
	}
    else Taxo = CAN_Engine.Taxo;

	// ограничение градиета нарастания
#define   __ASR_Taxo_Grad  60 // 1000rpm/c
	int16_t dTaxo = Taxo - ASR.Engine.Taxo_1;
	if(dTaxo > __ASR_Taxo_Grad) dTaxo = __ASR_Taxo_Grad;
	if(ASR_Taxo_Grad)
	Taxo = ASR.Engine.Taxo_1 + dTaxo;
	ASR.Engine.Taxo_1 = Taxo;

    // ограничение
	if(Engine.TaxoXX &&
	   Taxo < Engine.TaxoXX)
	   Taxo = Engine.TaxoXX;
	if(Engine.TaxoMax &&
	   Taxo > Engine.TaxoMax)
	   Taxo = Engine.TaxoMax;

	// фильтрация
	 ASR.Engine.Filt_Taxo.Xn = Taxo;
	 if(ASR_Taxo_Filtr)
	      ASR.Engine.Taxo = Filter_Cheb(&(ASR.Engine).Filt_Taxo, Koef_Filtr5Hz);
	 else ASR.Engine.Taxo = Taxo;

} // end ASR_Engine_Regulate()

void     ASR_Brake_Abort(void)
{
	if(ASR_Brake_Active)
	{  ASR_Brake_Active = 0;
	   ASR.Brake.RL.Pdes = 0;
	   ASR.Brake.RR.Pdes = 0;
	   ASR_Brake_Left = 0;
	   ASR_Brake_Right = 0;
	   ASR_KL_Status1 = 0;
	   ASR_KL_Status2 = 0;
	}
}  // end ASR_Break_Abort()

//-----------------ASR_Brake_Regulate------------------------------
// вызывается в ASR_Regulate() каждые  5mc
void     ASR_Brake_Regulate(void)
{
	// Определение события проскальзывания колеса
	// относительно переднего колеса борта
    // порог скольжения
    ASR.Brake.ThrSl = (uint32_t)ASR.Engine.Thr *
			          (uint32_t)__ASRB_Thr_Sleep /256;
    // левое колесо
    ASR.Brake.RL.RefSl = Wheel_FL.Speed + ASR.Brake.ThrSl;
    if(Wheel_RL.Speed > ASR.Brake.RL.RefSl)// &&
     //  Wheel_RL.Accel > __ASRB_Thr_Acc)
    	 ASR.Brake.RL.Slip_Fl = 1;
    else ASR.Brake.RL.Slip_Fl = 0;
    // правое колесо
    ASR.Brake.RR.RefSl = Wheel_FR.Speed + ASR.Brake.ThrSl;
    if(Wheel_RR.Speed > ASR.Brake.RR.RefSl)// &&
     //  Wheel_RR.Accel > __ASRB_Thr_Acc)
    	 ASR.Brake.RR.Slip_Fl = 1;
    else ASR.Brake.RR.Slip_Fl = 0;
//!!!!!!!ASR.Break.RR.Sleep_Fl  пока не используется

    // Определение  порога относительно задних колес
    ASR.Brake.Thr = (uint32_t)ASR.Engine.Thr *
			        (uint32_t)ASR.CFG.PThrK /256; //

    // левое колесо
    // опорная  скоростъ
    ASR.Brake.RL.Ref = Wheel_RR.Speed + ASR.Brake.Thr;
    // рассогласование скоростей
    ASR.Brake.RL.dSp = (uint32_t)Wheel_RL.Speed -
			           (uint32_t)ASR.Brake.RL.Ref;
	// PID регулятор
    ASR_Brake_PID(&ASR.Brake.RL);

    // правое колесо
	// опорная  скоростъ
	ASR.Brake.RR.Ref = Wheel_RL.Speed + ASR.Brake.Thr;
	// рассогласование скоростей
	ASR.Brake.RR.dSp = (uint32_t)Wheel_RR.Speed -
			           (uint32_t)ASR.Brake.RR.Ref;
	// PID регулятор
	ASR_Brake_PID(&ASR.Brake.RR);

	// параметры регулирования давления
	// в зависимости загрузки
	// минимум коеффициентa регулятора Empty EBL.REG.Koef_Min
	ASR.Brake.Kload = EBL.REG.Koef_Min;
	if(ASR_Kload_Enable) // CFG
	   ASR.Brake.Kload += (((uint32_t)EBL.REG.Koef -
			                (uint32_t)EBL.REG.Koef_Min) *
			               ASR.CFG.Kload /256);  //k=0.375(96/256)
	// порог слежения
	ASR.Brake.ThrP = (uint32_t)ASR.CFG.ThrP * ASR.Brake.Kload /
			                                  EBL.REG.Koef_Min;
	// давление подкачки
    ASR.Brake.dPump = (uint32_t)ASR.CFG.dPump * ASR.Brake.Kload /
			                                    EBL.REG.Koef_Min;
    // максимальное давление
    ASR.Brake.Pmax = (uint32_t)ASR.CFG.Pmax * ASR.Brake.Kload /
                                              EBL.REG.Koef_Min;
	ASR.Brake.REG_RL.TrP = ASR.Brake.ThrP;
	ASR.Brake.REG_RL.dPpump = ASR.Brake.dPump;
	ASR.Brake.REG_RL.CutT =__ASRB_Cut_Delay;
	ASR.Brake.REG_RR.TrP = ASR.Brake.ThrP;
	ASR.Brake.REG_RR.dPpump = ASR.Brake.dPump;
	ASR.Brake.REG_RR.CutT =__ASRB_Cut_Delay;

    //--- Выработка задания давления ----
	if(!ASR_Disable &&		 // общий запрет
	   !ASR_Brake_Failed &&  // Fail
	    ASR_Break_Enable)    // CFG
	{  // активация
	   if(Speed_VX_est < ASR.CFG.Speed &&  // сkорость меньше 40km/h
		  ASR_EngineActive)                // только если активен ASR_Engine
	   {
		 if(ASR.Brake.RL.PID > ASR.Brake.ThrP*2)
		  	ASR_Brake_Left = 1; // активация Break_Left
	     if(ASR.Brake.RR.PID > ASR.Brake.ThrP*2)
	        ASR_Brake_Right = 1; // активация Break_Right
	   }
	   // деактивация
	   if(ASR.Brake.RL.PID < ASR.Brake.ThrP ||
		  ASR.Brake.RR.PID > ASR.Brake.ThrP)
	  	  ASR_Brake_Left = 0; // деактивация Break_Left
	   if(ASR.Brake.RR.PID < ASR.Brake.ThrP ||
		  ASR.Brake.RL.PID > ASR.Brake.ThrP)
	   	  ASR_Brake_Right = 0; // деактивация Break_Right

	   // заданиe давления
	   ASR.Brake.RL.Pdes = ASR.Brake.RL.PID * ASR.Brake.Kload /EBL.REG.Koef_Min;
	   ASR.Brake.RR.Pdes = ASR.Brake.RR.PID * ASR.Brake.Kload /EBL.REG.Koef_Min;
	   if(ASR_BrTout_Tip2 && // CFG
		  ASR_Brake_Tout)
	   { // ограничение задания при Tout
		 if(ASR.Brake.RL.Pdes > ASR.CFG.Pmax)
		    ASR.Brake.RL.Pdes = ASR.CFG.Pmax;
		 if(ASR.Brake.RR.Pdes > ASR.CFG.Pmax)
		    ASR.Brake.RR.Pdes = ASR.CFG.Pmax;
	   }
	}
	else // ASR запрет
	     ASR_Brake_Abort();

	// --------------  Brake Tout ------------------
#define   __ASR_Brake_Tout  6000  //30c
	if(ASR_BrTout_Enable)
	{ // Left
	  if(ASR_Brake_Left)
	  { if(ASR.Brake.RL.Tout < ASR.CFG.BrakeTout)
		   ASR.Brake.RL.Tout++;
	  }
	  else ASR.Brake.RL.Tout = 0;
	  // Right
	  if(ASR_Brake_Right)
	  { if(ASR.Brake.RR.Tout < ASR.CFG.BrakeTout)
	  	   ASR.Brake.RR.Tout++;
	  }
	  else ASR.Brake.RR.Tout = 0;
	  // общий Brake Tout
	  uint16_t  T = ASR.CFG.BrakeTout * 10;
	  if((ASR.Brake.RL.Tout == ASR.CFG.BrakeTout ||
		  ASR.Brake.RR.Tout == ASR.CFG.BrakeTout) &&
		 !ASR_SW_Condition)  // сброс Brake Tout выключателем
	  {
	  	if(ASR.Brake.Tout < T)
	  	   ASR.Brake.Tout++;
	  	ASR_Brake_Tout = 1;
	  }
	  else
	  { // нет RL.Tout и RR.Tout
		if(ASR.Brake.Tout != T)
	    { // Tout не достиг не сбрасываемого времени
	      if(ASR.Brake.Tout)
	    	 ASR.Brake.Tout--;
	      ASR_Brake_Tout = 0;
	    }
	  }
	  // не сбрасываемый Tout можно сбросить кнопкой ASR
#define   __ASR_All_Tout_T  200  //1c
	  if(ASR_SW_Condition)
	  { if(ASR.Brake.Tout > __ASR_All_Tout_T)
	  	   ASR.Brake.Tout = __ASR_All_Tout_T;
	  }
	}
} // end ASR_Press_Regulate()

void     ASR_Brake_NU (TypeDef_Press_Reg* REG)
{
	REG->Cnt = __ASRB_Cut_Delay; // нет задержки на подкачку
	REG->Ppump = ASR.Brake.dPump;
}

//----------------- макрос ASR Switch ----------------------
#define _ASR_Switch(M) {						 	       \
  if(ASR.Brake.REG_##M.KL == __KL_Ret_Cut) { ASR_EV_##M = 1;  \
                                       ASR_AV_##M = 0;} \
  if(ASR.Brake.REG_##M.KL == __KL_Ret_Exh) { ASR_EV_##M = 1;  \
                                       ASR_AV_##M = 1;} \
  if(ASR.Brake.REG_##M.KL == __KL_Ret_Pump){ ASR_EV_##M = 0;  \
                                       ASR_AV_##M = 0;} \
} //end macroc

void     ASR_Press_Control(void)
{ // 444Byte
   if(!ASR_Brake_Active)
   {
       ASR_Brake_NU(&(ASR.Brake.REG_RL));
       ASR_Brake_NU(&(ASR.Brake.REG_RR));
	   if(ASR_Brake_Left ||
		  ASR_Brake_Right)
          ASR_Brake_Active = 1; // активация Break
       else	  ASR_Brake_Abort();
   }
   else // активирован регулятор
   {
	 if((!ASR_Brake_Left &&
		 !ASR_Brake_Right) ||  // нет запросов
		  (ASR_Brake_Tout && !ASR_BrTout_Tip2) ||  // Tout
		  ASR_Disable)         // общий запрет
     { // фаза выключения
	   if(!ASR_Disable)
	   {
		  ASR_Dif_Rear = 0;
         _ASR_Exh(RL) // выпуск
         _ASR_Exh(RR) // выпуск
         if(RearDif.Press < __ASR_DifPressOff)
         { ASR_KL_Status1 = 0;
       	   ASR_Brake_Active = 0;
         }
	   }
	   else  ASR_Brake_Abort(); // ASR прервано
     }
     else
     { ASR_Dif_Rear = 1;
       // ----- машина регулятора левое колесо ------
       if(ASR_Brake_Left)
       {
    	 ASR.Brake.REG_RL.Pdes = ASR.Brake.RL.Pdes;
    	 Press_Control(&Wheel_RL, &(ASR.Brake.REG_RL));
       }
       else
       {  ASR_Brake_NU(&(ASR.Brake.REG_RL));
    	  ASR.Brake.REG_RL.KL = __KL_Ret_Cut;
       }
  	   _ASR_Switch(RL)

       // ----- машина регулятора правое колесо ------
       if(ASR_Brake_Right)
       {
    	 ASR.Brake.REG_RR.Pdes = ASR.Brake.RR.Pdes;
    	 Press_Control(&Wheel_RR, &(ASR.Brake.REG_RR));
       }
       else
       {  ASR_Brake_NU(&(ASR.Brake.REG_RR));
    	  ASR.Brake.REG_RR.KL = __KL_Ret_Cut;
       }
  	   _ASR_Switch(RR)
     }
   }
} // end ASR_Press_Control()
#endif

#define   __EngineTorque_Max       0x7D //0xFA
#define   __EngTorq_Adj_Max        0x50
#define   __EngineTorqueB_Inc      0x00//0x01
#define   __EngTorqBrake_Inc1      0x02//0x01
#define   __EngineTorqueD_Inc      0x02//0x03

#define   __Engine_Drag_Tout          150
#define   __Engine_Drag_Tmin          70      //0.35c

#define   __ROPEngOFF_dAyThr          0x0680  //  0.75m/c^2 0x0800  //  1m/c^2
#define   __ROP_EngineDriver  0x0F
#define   __ROPEngON_dAxThr  0x0100
#define   __ROPEng_AyThr     0x1D99  //  3.7m/c^2

#ifdef  __Torque_Compile
void TorqueLim_Activate(void)
{
	if(!Torque_Lim)
	{   Torque_Lim = 1;
	    Torque_Drag = 0;
		if(EngineTorque.Phase) EngineTorque.Phase = 0;
	}
}

void TorqueDrag_Activate(void)
{
	if(!Torque_Drag)
	{   Torque_Drag = 1;
		Torque_Lim = 0;
    	EngineTorque.Value = CAN_Engine.Torque; //
		EngineTorque.Taxo = CAN_Engine.Taxo;
		EngineTorque.KTS = KTS.KoefTaxoSpeed;
		if(EngineTorque.Phase) EngineTorque.Phase = 0;
	}
}

void    ROP_EngineChangePhase (void)
{    ROP.Engine.Speed = Speed_VX_est;
     ROP.Engine.Int = 0;
	 if(CAN_Engine.Driver > __ROP_EngineDriver)
	 { if(ROP_EngAfterBrake)
	   { ROP.Engine.Phase = 4; // фаза адаптации момента
	     ROP.Engine.Torque = ROP.CFG.TorqueMin;
	   }
	   else //регулирование до срабатывания тормозов
	   { ROP.Engine.Phase = 5;
	     ROP.Engine.Torque = CAN_Engine.Driver * ROP.CFG.Kgaz / 256;
	   }
	 }
	 else
	 { ROP.Engine.Phase = 3; // отпущен газ
	   ROP.Engine.Torque = ROP.CFG.TorqueMin;
	 }
}

void    ROP_Engine_Regulate (void)
{
	//-----------------------EVENTS---------------------------------

	//------------- определение события Engine ROP------------------
	//#define   __AccY_OzD_Thr      0x1400  // 2,5m/s^2
	#define   __ROP_EngON_AyMax   0x1E00  // 0x1C00 3,5m/c2
	   	if(!ROP_Engine_Event)
	   	{ // Определение  порога ускорения включения ROP Engine
		  ROP.Engine.ON_AccY = ROP.ON_AccY  - ROP.CFG.EngON_dAy;
		  if(ROP.Engine.ON_AccY > __ROP_EngON_AyMax)
			 ROP.Engine.ON_AccY = __ROP_EngON_AyMax;
//		  ROP.Ay_OffSet = 0x0600;

	   	  if(Speed_VX_est > ROP.CFG.SpeedON &&
	   		 !ROP.Engine.ONcnt &&
	         (ROP_CheckActivate(ROP.Engine.ON_AccY)||
	          ROP_BrakeActive))       // регулирование тормозов активно
		  { ROP_Engine_Event = 1;
		    DYC_Engine_Event = 0;
		    // флаг упреждения ROP прицепа Trailer_Before_ROP
		    if(Trailer_Before_ROP_Enable)
		    {  Trailer_Before_ROP = 1;
		       Trailer.ROP.Time = 100;
		    }
		  }
	   	}
	    else
	    { // Определение  порога ускорения выключения ROP Engine
	      // если не активировались тормоза
		  ROP.Engine.OFF_AccY = ROP.CFG.ThrAyON -
				                ROP.CFG.EngOFF_dAy;
	      if( ROP_Eng_Off &&
	    	 !ROP_EngAfterBrake)
	          ROP.Engine.OFF_AccY += ROP.CFG.EngOFF_dAy / 2;

	      if((Acc_Y_est < ROP.Engine.OFF_AccY  &&
	          Acc_Y_est > -ROP.Engine.OFF_AccY &&
			  ROP.AccY_OzD < ROP.Engine.OFF_AccY  &&   //???
			  ROP.AccY_OzD > -ROP.Engine.OFF_AccY &&
			  !ROP_BrakeActive) ||
	    	 Speed_VX_est < (ROP.CFG.SpeedON - 0x0500)) // - 5km/h
	         ROP_Engine_Event = 0;
	    }
//-------------------------------------------------------------------------
// ----------------------регулирование момента-----------------------------
	// переменные
//	if(Acc_Y_est > 0) ROP.Engine.AccYs = Acc_Y_est;
//	else ROP.Engine.AccYs = -Acc_Y_est;  // абсолютная величина
	ROP.Engine.TorgMax = ROP.CFG.Kgaz / 2;  //43% - 55
	// флаг ASR
#define   __ROP_ASR_Sleep  0x00E6  //10%
	if(((Wheel_RL.Speed * __ROP_ASR_Sleep)/256) > Wheel_FL.Speed ||
	   ((Wheel_RR.Speed * __ROP_ASR_Sleep)/256) > Wheel_FR.Speed)
		 ROP_ASR = 1;
	else ROP_ASR = 0;
	// счетчик задержки
	if(DYC_BrakeActive)
	{ //DYC.Engine.OFFcnt = 100; // счетчик задержки выхода DYC Engine
		ROP.Engine.ONcnt = 100;  // счетчик задержки входа ROP Engine
	}
	else if(ROP.Engine.ONcnt) ROP.Engine.ONcnt--;

	// флаг большого бокового ускорения
	if(Acc_Y_est > __ROPEng_AyThr  ||  //
	   Acc_Y_est < -__ROPEng_AyThr)
		 Engine_AccY_High = 1;
    else Engine_AccY_High = 0;

// ----------------Engine Torque Control Mashine----------------------
	if(!EngineActive)  // выключение режима
	   ROP.Engine.Phase = 0;
	else
	if(ROP_BrakeActive) // активен тормоз
	   ROP.Engine.Phase = 1;
	else
	if(EngineTrailer_Request)  // активен ROP Trailer
	   ROP.Engine.Phase = 2;
	else
	if(CAN_Engine.Driver < __ROP_EngineDriver && //отпущен газ
	   ROP.Engine.Phase > 3)
	   ROP.Engine.Phase = 3;

	switch (ROP.Engine.Phase)
	{
	  case 0:
		  if(EngineActive)  // включение режима
		      ROP_EngineChangePhase();
		  break;
	  case 1: // активен тормоз
		  ROP.Engine.Torque = 0;
		  ROP_EngAfterBrake = 1;
		  if(!ROP_BrakeActive) // фаза завершена
			  ROP_EngineChangePhase();
		  break;
	  case 2: //регулирование при ROP прицепа
		  ROP.Engine.Torque = 5;//ROP.CFG.TorqueMin; // ROP прицепа регулятор
		  if(!EngineTrailer_Request) ROP_EngineChangePhase();
		  break;
	  case 3: //отпущен газ
		  // снижение момента
		  if(ROP.Engine.Torque > ROP.CFG.TorqueMin) ROP.Engine.Torque--;
		  if(CAN_Engine.Driver > __ROP_EngineDriver) // фаза завершена
			  ROP_EngineChangePhase();
		  break;
	 // после активности тормозов
	  case 4: // фаза адаптации момента
		  if(ROP.Engine.Int++ > __EngTorqBrake_Inc1)
		  {	 ROP.Engine.Int = 0;
		     ROP.Engine.Torque++;
		  }
	      if(Speed_VX_est > (ROP.Engine.Speed + 0x0040) || Acc_X_est > -0x0200 ||
	         ROP_ASR || Engine_AccY_High ||
	    	// ROP.Engine.Torque > __EngTorq_Adj_Max )  //завершена адаптация
			 ROP.Engine.Torque > ROP.Engine.TorgMax)  //завершена адаптация
		  { ROP.Engine.Phase = 5;
		    ROP.Engine.Torque /= 2; // середина приращения
		    ROP.Engine.Speed = Speed_VX_est;
		    ROP.Engine.Int = 0;
		  }
		  break;
	  case 5: // фаза  ПОДДЕРЖАНИЕ СКОРОСТИ
		  // возможна раскрутка вывешенного заднего колеса
		  if(!ROP_ASR &&                     // нет пробуксовки
		     !Engine_AccY_High)              // мало ускорение
		       ROP.Engine.Int += (-ROP.Engine.Speed + Speed_VX_est);
		  else ROP.Engine.Int += (int32_t)ROP.CFG.EngKi/2;

		  if(ROP.Engine.Int > (int32_t)ROP.CFG.EngKi)
		  { // снижение момента
			if(ROP.Engine.Torque >  ROP.CFG.TorqueMin) ROP.Engine.Torque--;
			ROP.Engine.Int = 0;
		  }
		  else
		  if(ROP.Engine.Int < -(int32_t)ROP.CFG.EngKi)
		  { // увеличение момента
		    if(ROP.Engine.Torque++ > (CAN_Engine.Driver))
		       ROP.Engine.Torque = CAN_Engine.Driver;   // ограничение водителем
		    if(ROP.Engine.Torque >  ROP.Engine.TorgMax)
		       ROP.Engine.Torque =  ROP.Engine.TorgMax; // ограничение CFG
			ROP.Engine.Int = 0;
		  }
	      break;
	}
//-------------------------------------------------------------------------
// ----------------------регулирование оборотов----------------------------
	// задание оборотов
	if(!EngineActive)
	{ ROP.Engine.KTS = KTS.KoefTaxoSpeed;
	  ROP.Engine.Speed = Speed_VX_est;
	  ROP.Engine.Taxo = CAN_Engine.Taxo;
	  ROP.Engine.Driver = CAN_Engine.Driver;
	  ROP.Engine.OFFcnt = 0;
	}
	else
	{
	  if(!ROP_BrakeActive)
	  { ROP.Engine.Taxo = (uint32_t)ROP.Engine.KTS * ROP.Engine.Speed / __KTS_Koef;
	    // отслеживание педали газа
	    // Speed/Torque Limit
	  }
	  else ROP.Engine.Taxo = Engine.TaxoXX;

	  if(!ROP_Engine_Event &&
		 !EngineTrailer_Request)
	  {
#define   __ROP_EngineOff_Delay  100
		// выключение
		if(ROP.Engine.OFFcnt++ > __ROP_EngineOff_Delay)
			EngineActive = 0;
	  }
	  else ROP.Engine.OFFcnt = 0;
	}

} // end ROP_Torque_Regulate()


void Engine_Torque_Control(void)
{
//-----------------------EVENTS---------------------------------

//-------------- определение события Engine DYC ----------------
	if(CFG_DYC_Engine_Enable &&   // DYC_Engine разрещен в конфигурации
	   DYC_Enable)
    { if(!DYC_Engine_Event)
   	  { if(!ROP_EngineActive &&
   		   (DYC_BrakeActive || DYC_TrailerBreak)) // регулирование тормозов активно
   	      DYC_Engine_Event = 1;
   	  }
      else
      { if(!DYC_BrakeActive &&
    	   !DYC_TrailerBreak &&
		   No_Maneuver)
        DYC_Engine_Event = 0;
      }
	}
	else DYC_Engine_Event = 0;

//------Определение необходимости увеличения момента двигателя----
// 1 - при Rear_Break UnSt
// 2 - на дороге с низким Mu при отпущеном газе
// при активном DYC в DZ отключается Drag

#define   __Drag_LowMu   0x0C00 // 1,5m/s^2
#define   __Drag_Vx_Min    0x1800    // 24km/h
#define   __Engine_DragOn_Sleep		  0x1E    //12%
#define   __Engine_DragOn_dSp_Min     0x0300  //3km/h
#define   __Engine_DragOff_Sleep	  0x0D    //5%  0x08    //3%
#define   __Engine_DragOff_dSp_Min    0x0200  //2km/h
#define   __Drag_Brake_Thr            0x1A00  // 1,3atm

	if(CFG_DYC_Engine_Enable &&   // DYC_Engine разрещен в конфигурации
	   Speed_VX_est > __Drag_Vx_Min &&
	   !ABS_Front_Active &&  // ABS_Active нельзя
	   ((!No_Maneuver &&
		 (DYC_pozWz_UnSt ||
          DYC_negWz_UnSt)) ||
	    (TransmissionON &&         // включена трансмисия
		 Road.Mu < __Drag_LowMu &&  // малое ускорениe	LowMu
		 !CAN_Engine.Driver)))     // отпущен газ
		 DYC.Drag.Poss = 1;  // флаг возможен Drag
	else DYC.Drag.Poss = 0;
	// Определение  порога скорости включения Drag
    DYC.Drag.ThrON = Speed_VX_est * __Engine_DragOn_Sleep / 256;
   	if(DYC.Drag.ThrON <__Engine_DragOn_dSp_Min)
   	   DYC.Drag.ThrON = __Engine_DragOn_dSp_Min;
    // Определение порога скорости выключения Drag
    DYC.Drag.ThrOFF = Speed_VX_est *__Engine_DragOff_Sleep / 256;
    if(DYC.Drag.ThrOFF <__Engine_DragOff_dSp_Min)
       DYC.Drag.ThrOFF = __Engine_DragOff_dSp_Min;
    //
    if(!ABS_Rear_Active)
    {
    if(!EngineDrag_Request)
    { // активация  если скорость заднего колеса ниже порога
      // и не нулевая (провал) **
      if(DYC.Drag.Poss &&
    	 Brake.DemandValue < __Drag_Brake_Thr && // нет торможения < 0,7atm &&
         ((Wheel_FL.Speed > (Wheel_RL.Speed + DYC.Drag.ThrON) &&
           Wheel_RL.Speed > __Engine_DragOn_dSp_Min) || // **
    	  (Wheel_FR.Speed > (Wheel_RR.Speed + DYC.Drag.ThrON) &&
		   Wheel_RR.Speed > __Engine_DragOn_dSp_Min)))  // **
	   		    EngineDrag_Request = 1; // включение DYC_EngineDrag
    }
	else
    { // деактивация если скорости задних колес в норме
      if(Wheel_FL.Speed < (Wheel_RL.Speed + DYC.Drag.ThrOFF) &&
         Wheel_FR.Speed < (Wheel_RR.Speed + DYC.Drag.ThrOFF))
	   			EngineDrag_Request = 0; // выключение режима
    }
    }
/*   else
    { if(ABS_Rear_Ph3_Drag && // CFG
    	 ABS_Front_Active &&
		 !ASR_EngineActive)
      { if(Wheel_RL.ABS.Phase == __ABS_Phase3 ||
    	   Wheel_RR.ABS.Phase == __ABS_Phase3)
    	     EngineDrag_Request = 1;
        else EngineDrag_Request = 0;
      }
    }
*/
#ifdef   __AxisF_Compile
	if(Torque_Drag_MC2)         // есть DYC торможение зада
	    EngineDrag_Request = 1;
#else
	if(DSC_Emul_Fl)
	{ if(DYC_Engine_Event &&
	     DYC_Rear_Break)
		EngineDrag_Request = 1;
	}
#endif
	//-----Определение необходимости снижения момента двигателя-------
#ifdef   __AxisF_Compile
	if(!EngineLim_Request)
	{	// активация
		if(DYC_Engine_Event ||
		   ROP_Engine_Event ||
		   Torque_Lim_MC2)
			EngineLim_Request = 1;
	}
	else
	{ // деактивация
	    if(!ROP_Engine_Event && !ROP_BrakeActive &&
	       !DYC_Engine_Event && !DYC_BrakeActive &&
		   !Torque_Lim_MC2)
	    	EngineLim_Request = 0;
	}
#else
	if(!EngineLim_Request)
	{	// активация
		if(DYC_Engine_Event ||
		   ROP_Engine_Event ||
		   LIM_Engine_Event ||
		   (ASR_Engine_Event && !ASR_Engine_Tout)) // нет Tout
			EngineLim_Request = 1;
	}
	else
	{ // деактивация
	    if(!ROP_Engine_Event && !ROP_BrakeActive &&
	       !DYC_Engine_Event && !DYC_BrakeActive &&
		   !ROP_Engine_Event &&
		   (!ASR_Engine_Event || ASR_Engine_Tout))
	    	EngineLim_Request = 0;
	}
#endif
// Обработка запросов на управление моментом
    if(DSC_Roll_Enable &&
	   (ROP_Engine_Event ||
	    EngineTrailer_Request))
    { // Активация ROP_Engine
    	ROP_EngineActive = 1;
        DYC_EngineActive = 0;
        ASR_EngineActive = 0;
        TorqueLim_Activate();
    }
    else
    { if(EngineDrag_Request ||	Dia_TorqueDrag)
      { // Активация Drag_Engine
    	DYC_EngineActive = 1;
        TorqueDrag_Activate();
      }
	  else
	  if(EngineLim_Request || Dia_TorqueLim)
      {
		if((DYC_Engine_Event || Dia_TorqueLim) &&
		   !DYC_EngineActive)
        { // Активация DYC_Engine
          DYC_EngineActive = 1;
      	  TorqueLim_Activate();
    	}
#ifdef   __AxisF_Compile
	    if(ASR_Eng_Event && !ASR_EngineActive)
#else
	    if(ASR_Engine_Event && !ASR_EngineActive)
#endif
        { // Активация ASR_Engine
          ASR_EngineActive = 1;
      	  TorqueLim_Activate();
        }
#ifdef   __AxisR_Compile
	    if(LIM_Engine_Event && !LIM_EngineActive)
        { // Активация LIM_Engine
		  LIM_EngineActive = 1;
  	      TorqueLim_Activate();
        }
#endif
	  }
    }

// Определение выключения
    if(!EngineDrag_Request &&
       !EngineLim_Request &&
       !EngineTrailer_Request &&
	   !Dia_TorqueLim  &&
	   !Dia_TorqueDrag)
	   	  EngineActive = 0;
    else  EngineActive = 1;

// ----------------Engine Torque Control Mashine----------------------
#define   __Dia_Taxo           0x1F40 //  1000 об/мин
#define   __Dia_Drag_Torque    20
#define   __Dia_Drag_Inc       0x02
#define   __Dia_Drag_Dec       0x05

	switch (EngineTorque.Phase)
	{
	  case 0:
		  if(!DYC_EngineActive &&
			 !ROP_EngineActive &&
			 !LIM_EngineActive &&
			 !ASR_EngineActive)
		  {
			EngineTorque.Value = __EngineTorque_Max;
			ASR.Engine.Torq_EM1 = EngineTorque.Value;
			ASR.Engine.Torq_EM2 = EngineTorque.Value;
		    EngineTorque.TSC_Taxo = 0xFFFF;
		    Torque_Lim = 0;
		    Torque_Drag =0;
		  }
		  else
		  {	if(Torque_Drag)
			{ EngineTorque.Phase = 3;
			  if(!Dia_TorqueDrag)
			       EngineTorque.Value = DYC.CFG.Eng.DragMin;
			  else EngineTorque.Value = Engine.CFG.TorqXX;
			}
			else
			if(Torque_Lim) EngineTorque.Phase = 1;
		  }
		  EngineTorque.Cnt = 0;
		  EngineTorque.Tout = 0;
		  EngineTorque.Fl = 0;
	      break;

	  case 1: // ограничение момента
		  Torque_Drag = 0;
		  EngineTorque.Tout = 0;

		  // ROP регулятор двигателя
		  if(ROP_EngineActive)
		  {
			if(!ROP_Engine_Taxo)
			{ // регулирование момента
		 	  // перенесено
//			  ROP_Torque_Regulate(); // ROP регулятор момента двигателя
		      EngineTorque.Value = ROP.Engine.Torque;
		      EngineTorque.TSC_Taxo = 0xFFFF;
			}
			else
			{ // регулирование оборотов
		      EngineTorque.TSC_Taxo = ROP.Engine.Taxo;
		      EngineTorque.Value = 0x7D;
			}
		  }
		  else

		  // DYC регулятор двигателя
		  if(DYC_EngineActive)
		  {
		    if(Dia_TorqueLim)
			{ if(!ASR_Engine_Taxo)  // разрешено в CFG
			  { EngineTorque.Value = 0;
			    EngineTorque.TSC_Taxo = 0xFFFF;
			  }
			  else
			  { // регулирование оборотов Dia
			    EngineTorque.TSC_Taxo = __Dia_Taxo; //1000 об/мин
			    EngineTorque.Value = 0x7D;
			  }
		    }
		    else
		    // здесь регулятор
		    if(UnSt_Drag_Act)
		         EngineTorque.Value = DYC.CFG.Eng.DragMin;
		    else EngineTorque.Value = ROP.CFG.TorqueMin;   //
		  }
		  else

		  // ASR регулятор двигателя
		  if(ASR_EngineActive)
		  {
    	     if(ASR_Enable &&
    	    	!ASR_Engine_Failed)
		     { if(!ASR_Engine_Taxo)  // разрешено в CFG
		       { // регулирование момента
#ifdef   __AxisF_Compile
		    	 EngineTorque.Value = EngineTorq_MC2.Value;
#else
		    	 EngineTorque.Value = ASR.Engine.Torque;
#endif
		    	 EngineTorque.TSC_Taxo = 0xFFFF;
		       }
		       else
		       { // регулирование оборотов
#ifdef   __AxisF_Compile
		    	 EngineTorque.TSC_Taxo = EngineTorq_MC2.TSC_Taxo;
#else
		    	 EngineTorque.TSC_Taxo = ASR.Engine.Taxo;
#endif
		    	 EngineTorque.Value = 0x7D;
		       }
		     }
		     else
		     { EngineTorque.Value = 0x7D;
		       EngineTorque.TSC_Taxo = 0xFFFF;
		     }
		  }

		  if(LIM_EngineActive)
		  {
			  EngineTorque.Value = LIM.Engine.Torque;
			  EngineTorque.TSC_Taxo = 0xFFFF;
		  }


		  if(!EngineActive && !Dia_TorqueLim)  // выключение режима
	  	  { EngineTorque.Phase = 2;
	  	    EngineTorque.Cnt = 0;
	  	  }
	      break;

	  case 2:  // фаза выключения
		  if((ASR_EngineActive && !ASR_Engine_Taxo ) ||
		     (ROP_EngineActive && !ROP_Engine_Taxo ) ||
			 DYC_EngineActive)
		  { // выход по моменту
			EngineTorque.TSC_Taxo = 0xFFFF;
		    if(EngineTorque.Cnt++ > __EngineTorqueB_Inc)
		    {  EngineTorque.Cnt = 0;
		      if(EngineTorque.Value < __EngineTorque_Max)
		      { EngineTorque.Value++;
		        ASR.Engine.Torq_EM1 = EngineTorque.Value;
		        ASR.Engine.Torq_EM2 = EngineTorque.Value;
		      }
		      else
		      { // выключение режима
			    EngineTorque.Phase = 0;
			    DYC_EngineActive = 0;
			    ROP_EngineActive = 0;
			    ASR_EngineActive = 0;
		      }
		    }
		  }
		  else  // выход по оборотам
		  {
			if(ROP_EngineActive && !ROP_Engine_Event)
			   ROP_EngineActive = 0;
			if(!ASR_EngineActive &&
			   !ROP_EngineActive)
			  EngineTorque.Phase = 0;
		  }

		  if(EngineActive) EngineTorque.Phase = 0;
	      break;

	  case 3: // увеличение момента
		  Torque_Lim = 0;
		  EngineTorque.TSC_Taxo = 0xFFFF;
// при выключенной трансмиссии контролируем возрастание оборотов
#define   __DragOff_DeltaTaxo          0x0640  // *8  200 об/мин
		  if(!Dia_TorqueDrag)
		  { if(!Brake_Rear_Drag)
		    {// режим VDC
		    //проверка возрастания оборотов
		    if(CAN_Engine.Taxo > (EngineTorque.Taxo +__DragOff_DeltaTaxo) ||
		       !EngineDrag_Request)
		    { TransmissionON = 0; // ?
		  	  EngineActive = 0;   // выключение режима
		  	  Torque_Drag = 0;
		  	  EngineTorque.Phase = 0;
		    }
			if(EngineTorque.Cnt++ > __EngineTorqueD_Inc)
			{ EngineTorque.Cnt = 0; //
			  if(EngineTorque.Value < DYC.CFG.Eng.DragMax)
				 EngineTorque.Value++; // увеличение момента
			}
		    }
		    else
		    { // режим Drag Brake Rear
		      EngineTorque.Value = DYC.CFG.Eng.DragMin;
		      EngineTorque.Tout = 0;
		    }
		  }
		  else
		  { // диагностика
#define   __DragTorq_DiaT  67  // 9 - 18 3c
#define   __DragTorq_Dia_dTorq  3
			if(EngineTorque.Cnt++ > __DragTorq_DiaT)
			{ EngineTorque.Cnt = 0;
			  if(CAN_Engine.Taxo < __Dia_Taxo) //1000 об/мин
			  { // увеличение момента
				if(EngineTorque.Fl)
				   EngineTorque.Value += __DragTorq_Dia_dTorq; //скачок
				EngineTorque.Fl = 0;
			    if(EngineTorque.Value < DYC.CFG.Eng.DragMax)
				   EngineTorque.Value++;
			  }
			  else
			  { // уменьшение момента
			    if(!EngineTorque.Fl)
					EngineTorque.Value -= __DragTorq_Dia_dTorq; //скачок
				EngineTorque.Fl = 1;
			    if(EngineTorque.Value)
				   EngineTorque.Value--;
			  }
			}
		  }
		  // проверка выключение режима
	  	  if(!EngineActive  ||
	  	     (EngineTorque.Tout++ > __Engine_Drag_Tout &&
	  	      !Brake_Rear_Drag &&
	  		  !Dia_TorqueDrag))    // выключение режима
	  	  { EngineDrag_Request = 0; // нужно сбросить т.к. скорость может 0
	  		Torque_Drag = 0;
	  		Torque_Lim = 1;
	        EngineTorque.Phase = 1;
	  	  }
	  break;
	}
} // end EngineTorque_Control()
#endif

//********************************************************************
//                     Retarder
//********************************************************************
#define   __RET_Torque_Max     0     // максимальный   момент -125%
#define   __RET_Torque_Null    0x7D  // нет торможение момент 0%
#define   __RET_Torque_50      0x4B  // 50%
#define   __RET_Torque_100     0x19  // 100%
//#define   __RET_Torque_20      0x69    // 20%
#define   __RET_Brake_Thr      0x1A00  // 1,3atm
#define   __RET_dAx_Thr        0x0266  // 0,3m/c2

#ifdef   __DBR_Compile
void  DBR_Regulate(void)
{
	if(DBR_Enable &&     // разрешено CFG
	   !Model_Install_Fail &&
	   !DBR_Failure &&
	   !DBR_Failed &&    // ошибки DZ
	    Speed_VX_est > Retarder.CFG.Speed)
		 DBR_Disable = 0;
	else DBR_Disable = 1;

	// определяем событие большого замедления
	int16_t AxThr = -(Retarder.CFG.Deccel - __RET_dAx_Thr);
	if(DBR_Torque_LimDec &&                           // CFG
	   Retarder.D_10h.Torque < Retarder.CFG.Torque && // есть момент ретардера >20%
	   Brake.DemandValue < __RET_Brake_Thr &&         // нет торможения < 0,7atm
	   Acc_X_est < AxThr)                             // замедление большое > 1m/c2
		DBR_Deccel_Event = 1;
	else
	if(Retarder.D_10h.Torque  > Retarder.CFG.Torque ||
	   Brake.DemandValue > __RET_Brake_Thr)
		DBR_Deccel_Event = 0;

	// определяем событие большого проскальзывания
	if(Wheel_RL.Slip > Retarder.CFG.Slip_On ||
	   Wheel_RR.Slip > Retarder.CFG.Slip_On)
		DBR_Slip_Event = 1;
	if(Wheel_RL.Slip < Retarder.CFG.Slip_Off &&
	   Wheel_RR.Slip < Retarder.CFG.Slip_Off)
		DBR_Slip_Event = 0;

	if(!DBR_Disable &&
       (DBR_Slip_Event ||
	    DBR_Deccel_Event))
		 DBR_Request = 1;
	else DBR_Request = 0;

	// ABS активно запрос всегда
 	if(ABS_Active) DBR_Request = 1;

} // end DBR_Regulate()

void  Retarder_Torque_Control(void)
{
// обработка запросов
	if(DBR_Request)
	{ // при активном регулировании запрет диагностики
	  Dia_Retarder_On = 0;
	  Dia_Retarder_Off = 0;
	}
// запрос ограничение момента
	if(!Retarder_Off &&
	   ((DBR_Request &&      // регулирование
	    !DBR_Torque_Set) ||  // ограничение момента
		Dia_Retarder_Off))   // диагностикa
	{
		Retarder_Off = 1;
	    Dia_Retarder_On = 0;
	    Retarder_Brake = 0;
	    Retarder.Torque.Phase = 0;
	}
// запрос на создание момента
	if(!Retarder_Brake &&
	   ((DBR_Request &&     // регулирование
		 DBR_Torque_Set) || // задание момента
	    Dia_Retarder_On))   // диагностикa
	{
		Retarder_Brake = 1;
	    Dia_Retarder_Off = 0;
	    Retarder_Off = 0;
	    Retarder.Torque.Phase = 0;
	}
// Определение выключения
    if(!Dia_Retarder_On  &&
	   !Dia_Retarder_Off &&
	   !DBR_Request)
    	  RetarderActive = 0;
    else  RetarderActive = 1;

// --------------Retarder Torque Control Mashine--------------------
	switch (Retarder.Torque.Phase)
	{
	  case 0:
		  if(RetarderActive) // включение режима
		  {
			if(Retarder_Off)
			{ if(DBR_Slip_Event || ABS_Active)
			  { // выключение торможения
				Retarder.Torque.Phase = 1;
			    Retarder.Torque.Value = __RET_Torque_Null;
			  }
			  if(DBR_Deccel_Event)
			  { // торможение с ограничением замедления
				Retarder.Torque.Phase = 2;
			    Retarder.Torque.Value = Retarder.CFG.Torque; //__RET_Torque_20;
			    Retarder.Torque.Cnt = 0;
			  }
			}
			if(Retarder_Brake)
			{ // включение торможения
			   Retarder.Torque.Phase = 3;
			   Retarder.Torque.Value = __RET_Torque_Null;
			}
		  }
		  else
		  { // ретардер тормозит без ограничений
			Retarder.Torque.Value = __RET_Torque_Max;
		    Retarder_Brake = 0;
		    Retarder_Off = 0;
		  }
	  break;
// ограничение момента
	  case 1:
		  Retarder_Brake = 0;
		  Retarder.Torque.Value = __RET_Torque_Null;  // здесь регулятор
	  	  if(!RetarderActive)  // выключение режима
	  	     Retarder.Torque.Phase = 4;
	  break;
// торможение с ограничением замедления
	  case 2:
		  Retarder_Brake = 0;
		  if(Retarder.Torque.Cnt++ > 2)
		  {  Retarder.Torque.Cnt = 0;
		     if(Retarder.Torque.Value)
		     {  if(Acc_X_est > -Retarder.CFG.Deccel)
		        Retarder.Torque.Value--;
		     }
		  }
		  if(DBR_Slip_Event)
			 Retarder.Torque.Phase = 1;
	  	  if(!RetarderActive)  // выключение режима
	  	     Retarder.Torque.Phase = 4;
	  break;
// задание момента
	  case 3:
		  Retarder_Off = 0;
		  if(!Dia_Retarder_On)
		  {  // здесь регулятор
			  if(DBR_Request)
			       Retarder.Torque.Value = __RET_Torque_Null;
			  else Retarder.Torque.Value =  __RET_Torque_50;
		  }
		  else
		  {  // диагностика задания момента
			  uint8_t T = _Hi_16(Diag.Pdes);
			  if(T > __RET_Torque_Null)
				 T = __RET_Torque_Null;
			  if(T < __RET_Torque_100)
				 T = __RET_Torque_100;
			  Retarder.Torque.Value = T;
		  }
	  	  if(!RetarderActive)  // выключение режима
	  	     Retarder.Torque.Phase = 4;
	  break;

	  case 4: // выключение режима
		  Retarder.Torque.Value = __RET_Torque_Max;
		  Retarder_Brake = 0;
		  Retarder_Off = 0;
	  	  Retarder.Torque.Phase =0;
	  break;
	}
} // end Retarder_Torque_Control()
#endif

//********************************************************************
//                       ROP
//********************************************************************
// функция активации ROP
uint8_t    ROP_CheckActivate(int16_t AyThr)
{  // при проверке обязательно одинаковые знаки AccY !!!
   // 	Acc_Y_est на груженой меньне ROP.AccY_OzD ??
	if((Acc_Y_est > AyThr &&   // проверка poz AccY
        ROP.AccY_OzD > (AyThr - ROP.Ay_OffSet))  ||
	   (Acc_Y_est < -AyThr &&  // проверка neg AccY
	    ROP.AccY_OzD < -(AyThr - ROP.Ay_OffSet)))
		 return 1;
	else return 0;
}

void    RollOverProtection(void)
{
#define   __ROP_OFFcnt_Delay 10
// -------------определяем радиус поворота----------------------------
// TurnRadius = DSC_Car_Base / sin(Teta)
// размерность DSC_Car_Base 1m - 1024 bit
// размерность Teta_Steering_Wheel 1рад  - 8192lsb 1град - 143
//	SinusGrad(int16_t Angle)
// Angle размерность 1град - 256 lsb

// угол поворота рулевого колеса
	int16_t Angle = Steering_Angle;
	if(Angle < 0) Angle = -Steering_Angle;
// абсолютная величина угла
	SAS.AngleA = Angle;
// ограничиваем минимум чтобы не было деления на 0
#define   __Angle_Min  0x0005
	if(Angle < __Angle_Min)
	   Angle = __Angle_Min;

//	__K_Angle = 65536 * ( 8192 * Pi /180 ) / 256  = 36602
#define   __K_Angle  36602
	ROP.Turn.Teta = ((uint32_t)Angle * (uint32_t)DSC_Ratio_Steer) / //SAS.Ratio
				     (uint32_t)__K_Angle;
	ROP.Turn.SinTeta = SinusGrad(ROP.Turn.Teta);
// размерность Turn_OO	1m - 1024 bit
// размерность TurnRadius 1m - 256 bit
#define   __K_TurnRadius  3667  // 65536 / 4 / 4,4678 (sin1grad *256)
	int32_t TurnRadius = ((uint32_t)ROP.CFG.Turn_OO *
	                      (uint32_t)__K_TurnRadius) /
	                    		   ROP.Turn.SinTeta;
	if(TurnRadius < 0x0000FA00)
		 ROP.Turn.Radius = TurnRadius;
	else ROP.Turn.Radius = 0xFA00;
	if(DSC_Emul_Fl)
		 ROP.Turn.Radius = 0x1400; //20m;

// находим Road Curvature pазмерность	1/km
#define   __K_Curvature  0x03E80000 //1000*65536
#define   __K_Radius_Min 0x0800	    // 8m - Curvature 0x7D00
	if(TurnRadius > __K_Radius_Min)
	     ROP.Turn.Curvature = __K_Curvature / TurnRadius;
	else ROP.Turn.Curvature = 0x7D00;
// знак Curvature определяется Steering_Angle
	if(Steering_Angle < 0) ROP.Turn.Curvature += 0x7D00; //OffSet

// находим квадрат скорости для нормального поворота
// Vx^2 = AyNorm * TurnRadius
#define   __K_Brake_VxVx   415   // 256 /8 *3.6 *3.6
#define   __K_Brake_AyEnd  8300  // 0x1400(20m) / 256 * 415(__K_Brake_VxVx)
// VxNormR20m зависит от загрузки
// зависимость 	VxR20 = Vo - K* Load.Koef/__LoadEmpty_Koef
// Vo = VxR20mEmpty
// K = dV(5km/h) / 1,5 (2,5-1) 2,5-изменение коеф. загрузки
#define   __K_VxR20  853  // 5*256/1,5

	ROP.Brake.VxR20 = ROP.CFG.VxR20mEmpty  -
		((uint32_t)__K_VxR20 * Load.K / __LoadEmpty_Koef); // уменьшаем если прицеп
    if(ROP.Brake.VxR20 < ROP.CFG.VxR20mLaden)
       ROP.Brake.VxR20 = ROP.CFG.VxR20mLaden;
 	ROP.Brake.AyEnd = ((uint32_t)ROP.Brake.VxR20 *
 			           (uint32_t)ROP.Brake.VxR20) /
 			           (uint16_t)__K_Brake_AyEnd;
 	ROP.Brake.VxVx = (((uint32_t)ROP.Brake.AyEnd *
 			           (uint32_t)ROP.Turn.Radius) / 256) *
 				       (uint16_t)__K_Brake_VxVx ;
	ROP.Brake.VxEnd = int_sqrt32(ROP.Brake.VxVx);

	if(ROP.Brake.VxEnd > Speed_VX_est)
	   ROP.Brake.VxEnd = Speed_VX_est;

// -------определение AccY через OmegaZ_Des-------------------------
// AccY_OzD = Vx*OmegaZ_Des
// Koef_AccY_OzD = 2048 * 65536 / 3,6 / 8192
//#define   __Koef_AccY_OzD        0x11C7   определен в MySystem.h !!
#ifdef   __AxisF_Compile
	ROP.AccY_OzD = _Hi_32((((uint32_t)Speed_VX_est *
#else
	ROP.AccY_OzD = _Hi_32((((uint32_t)Speed_VX_Front *
#endif
			     __Koef_AccY_OzD) /256) * OmegaZ_Des);

// определяем производную поперечного ускорения AccY
	BuffDer_AccY[0] = Acc_Y_est;
	int16_t dAccY = DeriVative(BuffDer_AccY, 40);
	if(Acc_Y_est > 0)
		 Derivative_AccY = dAccY;
	else Derivative_AccY = -dAccY;

	BuffDer_AccY_OzD[0] = ROP.AccY_OzD;
	dAccY = DeriVative(BuffDer_AccY_OzD, 40);
	if(ROP.AccY_OzD > 0)
		 Derivative_AccY_OzD = dAccY;
	else Derivative_AccY_OzD = -dAccY;

// -------------определяем порог включения ROP-----------------------
	ROP.ON_AccY = ROP.CFG.ThrAyON; //константа
// порог зависит от скорости автомобиля
// (VxR20m - VX)* SpK
//#define   __ROP_ON_Sp50          0x3200  // 50 km/h
#define   __ROP_ON_dAySp_Max     0x0600  // 0,75m/c2

 	ROP.ON.Sp = (((uint32_t)ROP.CFG.VxR20mEmpty -
 			      (uint32_t)Speed_VX_est) *
                 (uint32_t)ROP.CFG.ThrON_SpK) /256;

 	if(ROP.ON.Sp < 0 ||
 	   ROP.ON_ThrAdd)
 	   ROP.ON.Sp = 0;

 	if(ROP.ON.Sp > __ROP_ON_dAySp_Max)
 	   ROP.ON.Sp = __ROP_ON_dAySp_Max;

	ROP.ON_AccY += ROP.ON.Sp;

// порог зависит от скорости нарастания AccY
// т.к. есть задержка снижения AccY после активации ROP
	ROP.ON.dAyD = (Derivative_AccY_OzD *
			       (uint32_t)ROP.CFG.ThrON_dAyK) /256;
	ROP.ON_AccY -= ROP.ON.dAyD;

// порог зависит от загрузки
	ROP.ON.dAyL = (uint32_t)ROP.CFG.ThrON_LoadK * 4 *
			      ((uint32_t)Load.Koef - (uint32_t)__LoadEmpty_Koef) /
			      (uint32_t)__LoadEmpty_Koef;

	ROP.ON_AccY -= ROP.ON.dAyL;

// ограничиваем минимальное значение порога
#define   __ROP_ON_AyMin       0x18CD // 3.1m/c2    минимум порога
	if(ROP.ON_AccY < __ROP_ON_AyMin)
	   ROP.ON_AccY = __ROP_ON_AyMin;

// -------добавка при деактивации ROP_Break // ROP_AccY_Tilting------
// новое определение ROP.ON.ThrAdd
	if(ROP_Active)
	{
	  if(ROP_ThrOnAdd)     //
      {  ROP_ThrOnAdd = 0;  // сброс флага
         ROP.ON.ThrAyD = ROP.AccY_OzD; //второй флаг запуска
      }

	  if(ROP.ON.ThrAyD)
	  { // определяем добавку к порогу
		// разница AccY_OzD и порог активации
	    if(ROP.AccY_OzD > 0)
		     ROP.ON.ThrAdd =  ROP.AccY_OzD - ROP.ON_AccY;
	    else ROP.ON.ThrAdd = -ROP.AccY_OzD - ROP.ON_AccY;

	    // добавкa к порогу = разница + константа
#define   __ROP_ThrAdd_Con    0x0600  // 0.75m/c2 0x0400  // 0.5m/c2
	    if(ROP.CFG.Ay_OffSet > __ROP_ThrAdd_Con)
		     ROP.ON.ThrAdd += ROP.CFG.Ay_OffSet;
	    else ROP.ON.ThrAdd +=  __ROP_ThrAdd_Con;

	    // минус обнуляем чтобы порог не стал ниже 3.5m/c2
	    if(ROP.ON.ThrAdd < 0)
	       ROP.ON.ThrAdd = 0;

	    //????
	    if(!ROP_Event)
	    	ROP.ON.ThrAdd += 0x0100;

	    // ограничиваем чтобы порог ROP.ON_AccY не превысил 5m/c2
#define   __ROP_ThrAdd_Max  0x0A00 	 // 1,250m/c2 //0x0C00 	 // 1,5m/c2
	    if( ROP.ON.ThrAdd > __ROP_ThrAdd_Max)
	    	ROP.ON.ThrAdd = __ROP_ThrAdd_Max;

	  //обнуляем если малое ускорение ROP.AccY_OzD
#define   __ROP_ThrAdd_zAy   0x0E00	 // 2m/c2 0x1400	 // 2.5m/c2
	    if( ROP.AccY_OzD < __ROP_ThrAdd_zAy &&
	        ROP.AccY_OzD > -__ROP_ThrAdd_zAy )
	    	ROP.ON.ThrAdd = 0;
	  }
	}
    else
    { ROP_ThrOnAdd = 0;  // сброс флага
      ROP.ON.ThrAyD = 0; //
      if(ROP.ON.ThrAdd > 0)
    	 ROP.ON.ThrAdd -= 5; //декремент снижения
	}

// определяем порог включения ROP
	ROP.ON_AccY += ROP.ON.ThrAdd;

// определяем порог выключения ROP
#define   __ROP_OFF_dAy 0x0200 // 0.25m/c2
	if(!ROP_dAyOFF_Enable)
	     ROP.OFF_AccY = ROP.ON_AccY - __ROP_OFF_dAy;
	else ROP.OFF_AccY = ROP.ON_AccY - ROP.CFG.EngON_dAy;

// определяем порог скорости перехода в Ph3
	ROP.Brake.VxPh3 = (uint32_t)ROP.Brake.VxEnd +
			          (uint32_t)ROP.CFG.VxPh3;

	if(!ROP_BrakeActive)
		 ROP.Ay_OffSet = ROP.CFG.Ay_OffSet;
	else ROP.Ay_OffSet = 0;

// -------------- Tilting -------------------------
#define   __ROP_AyTilting     0x2E67 // 5,8m/c2
    if(ROP_Tilting_Enable &&
	   (Acc_Y_est > __ROP_AyTilting ||
	    Acc_Y_est < -__ROP_AyTilting))
	   ROP_Tilting = 1;
#define   __ROP_Tilting_Clt   0x2667 // 4,8m/c2
	if(Acc_Y_est < __ROP_Tilting_Clt &&
	   Acc_Y_est > -__ROP_Tilting_Clt)
       ROP_Tilting = 0;

// флаг ускорения Acc_X больше 3.5м/c
#define   __ROP_dAccXmax   0x0333 // 0,4m/c2
	if(Acc_X_est < -ROP.CFG.AccXdes)
	       ROP_AccX_Max = 1;
	else
	if(Acc_X_est > -(ROP.CFG.AccXdes - __ROP_dAccXmax))
	       ROP_AccX_Max = 0;

// -------------определяем событие активации тормозов ----------------
	if(ROP_Enable)
	{ if(!ROP_Event)
	  { //фаза ожидания активации
#define   __ROP_ON_VxAdd     0x0500  // 5km/h VxEnd
	    if((!ROP_CheckVx_Enable ||         // проверка Vx
	    	Speed_VX_est > ROP.Brake.VxPh3) &&
	       ROP_CheckActivate(ROP.ON_AccY)) // проверка AccY
		{ // есть условия активации
           ROP_Event = 1;
           ROP_Active = 1;
		   ROP.Speed = Speed_VX_est;
		}
	  } // end if(!ROP_Event)
	  else
	  { //фаза дeактивации ROP
#define   __ROP_OFF_VxAdd      0x0100  // 1 km/h
#define   __ROP_BrakeOFF_Delay 60		 // 0,3c
	    if(ROP.Brake.Time > __ROP_BrakeOFF_Delay &&


	       ((ROP.AccY_OzD < ROP.OFF_AccY && // выход по порогу ускорения AyOzD
	 	     ROP.AccY_OzD > -ROP.OFF_AccY &&
	 		 Acc_Y_est < ROP.ON_AccY &&    // выход по порогу ускорения Ay
	 		 Acc_Y_est > -ROP.ON_AccY) ||

		    Speed_VX_est < (ROP.Brake.VxEnd + __ROP_OFF_VxAdd) || // выход по скорости
#ifdef   __AxisF_Compile
			ROP.BrakeF.Poff))  // выход по давлению
#else
	    	ROP.BrakeR.Poff))  // выход по давлению
#endif
		{
			ROP.OFF_Cnt = __ROP_OFFcnt_Delay;
			ROP_Flags = 0;
			ROP_ThrOnAdd = 1;
		}
	  }
	} // end ROP_Enable
	else
	{	ROP_Event = 0;
#ifdef   __AxisF_Compile
	    if(ROP.BrakeF.Phase)
	    {  ROP.BrakeF.Phase = 0;
	       ROP.BrakeF.DifOn = 0;
	       Wheel_FL.Puls.Phase = 0;
	       Wheel_FR.Puls.Phase = 0;
	    }
#else
	    if(ROP.BrakeR.Phase)
	    {  ROP.BrakeR.Phase = 0;
	       ROP.BrakeR.DifOn = 0;
	       Wheel_RL.Puls.Phase = 0;
	       Wheel_RR.Puls.Phase = 0;
	    }
#endif
	}
	ROP_Press_Regulate();
#ifdef   __Torque_Compile
	ROP_Engine_Regulate(); // ROP регулятор момента двигателя
#endif
} // end Roll_Over_Protection()

void  ROP_Pump (WheelTypeDef* WheelXX, uint16_t P)
{
	if(WheelXX->Puls.Phase != 1)
	{  WheelXX->Puls.PumpSet = P;
	   WheelXX->Puls.Ph_Cnt = 0;
	   WheelXX->Puls.Phase = 1;
	}
}

void  ROP_Exh (WheelTypeDef* WheelXX, uint16_t dP)
{
#define   __Exh_Pmin 0x0A00 //0,5atm
	uint16_t  Pexh;
	if(WheelXX->Puls.Phase != 4)
	{
	   Pexh = WheelXX->Press - dP;
	   if(dP > WheelXX->Press ||
		  Pexh < __Exh_Pmin)
		  Pexh = __Exh_Pmin;
	   WheelXX->Puls.ExhSet = Pexh;
	   WheelXX->Puls.Ph_Cnt = 0;
	   WheelXX->Puls.Phase = 4;
	}
}

#define __ROP_BrakePh0   0
#define __ROP_BrakePh1   1
#define __ROP_BrakePh2   2
#define __ROP_BrakePh3   3
#define __ROP_BrakePh4   4

#define  __ROP_Slip1     0x0780
#define  __ROP_Slip2     0x0A00
#define  __ROP_Ph2_dPms  0x0D00 //0,65atm
#define  __ROP_Ph2_Pmin  0x0A00 //0,5atm
#define  __ROP_Ph4_Poff  0x0D00 //0,65atm 0x1400 // 1atm

#define   __ROP_Ph1_Tout  200
#define   __ROP_Ph2_Tout  500
#define   __ROP_Ph3_Tout  800
#define  __ROP_dT1        10

// фаза ожидания ROP_Event
void    ROP_Phase0 (WheelTypeDef* Wheel_Ws, WheelTypeDef* Wheel_Wm,
		            ROPBrakeTypeDef* ROPBrakeA)
{   if(ROP_Event)
    {
	  if(!ROP.OFF_Cnt)
	  { ROP.Brake.Time = 0;
		Wheel_Ws->Puls.TcutSet = ROP.CFG.Tcut;
	    Wheel_Wm->Puls.TcutSet = ROP.CFG.Tcut;
	    ROPBrakeA->Phase = __ROP_BrakePh1;
	    ROPBrakeA->DifOn = 1;
	    ROPBrakeA->Time = 0;
	    ROPBrakeA->Poff = 0;

	    if(Wheel_Ref_Correct &&
	       ROP_Ph1Sleep_Enable)
	    {Wheel_RL.Ref = Wheel_RL.Speed; // коррекция  базовой скорости
	     Wheel_RR.Ref = Wheel_RR.Speed;
	    }
	  }
    }
} // end ROP_Phase0()

// фаза подъемa давления Po
void    ROP_Phase1 (WheelTypeDef* Wheel_Ws, WheelTypeDef* Wheel_Wm,
		            ROPBrakeTypeDef* ROPBrakeA)
{
    ROP_Pump(Wheel_Ws, (ROPBrakeA->Po));
	ROP_Pump(Wheel_Wm, (ROPBrakeA->Po));

    if( Wheel_Ws->Speed < ROPBrakeA->SpThr ||
        Wheel_Ws->Press >= ROPBrakeA->Po ||
		ROP.Brake.Time > __ROP_Ph1_Tout)
    {
      ROPBrakeA->Phase = __ROP_BrakePh2;
      Wheel_Ws->Puls.Phase = 2;
      Wheel_Wm->Puls.Phase = 2;
      Wheel_Ws->Puls.Ph_Cnt = 0;
      Wheel_Wm->Puls.Ph_Cnt = 0;
    }
} // end ROP_Phase1

// фаза адаптации P
void    ROP_Phase2 (WheelTypeDef* Wheel_Ws, WheelTypeDef* Wheel_Wm,
		            ROPBrakeTypeDef* ROPBrakeA)
{
	if((Speed_VX_est < ROP.Brake.VxPh3 &&
		!ROP_Tilting) ||
		ROP.Brake.Time > __ROP_Ph2_Tout)
    {
	  ROPBrakeA->Phase = __ROP_BrakePh3; // переход в следующую фазу
      ROPBrakeA->Ph3_dP = (uint32_t)Wheel_Wm->Press *
    		               ROP.CFG.K_dPexh /256;
      Wheel_Wm->Puls.Phase = 2;
      Wheel_Ws->Puls.Phase = 2;
      Wheel_Wm->Puls.TcutSet = ROP.CFG.Tcut;
      Wheel_Ws->Puls.TcutSet = ROP.CFG.Tcut;
      Wheel_Wm->Puls.Ph_Cnt = Wheel_Wm->Puls.TcutSet-__ROP_dT1;
      Wheel_Ws->Puls.Ph_Cnt = Wheel_Ws->Puls.TcutSet-__ROP_dT1;
    }
    else
    { // сильное колесо
      if(Wheel_Wm->Speed > ROPBrakeA->SpThr)
      {
    	if(ROPBrakeA->Axm < ROP.CFG.AccXdes &&
    	   !ROP_AccX_Max &&
    	   Wheel_Wm->Slip < __ROP_Slip1 &&
   	       Wheel_Wm->Press < ROPBrakeA->Pmax)
    	{
    	   if(Wheel_Wm->Puls.Ph_Cnt >=
    		  (Wheel_Wm->Puls.TcutSet-__ROP_dT1) ||
    		  ROP_Ph2R_Pcont)
              ROP_Pump(Wheel_Wm, (Wheel_Wm->Press + ROPBrakeA->CFG.dPpump));
    	}
       else Wheel_Wm->Puls.Phase = 2;
      }
      else
      { if( Wheel_Wm->Puls.Ph_Cnt >=
    	   (Wheel_Wm->Puls.TcutSet-__ROP_dT1))
        {
    	  if(Wheel_Wm->Slip > __ROP_Slip2 &&
    		 Wheel_Wm->Press > __ROP_Ph2_Pmin)
     		   ROP_Exh(Wheel_Wm, ROPBrakeA->CFG.dPexh);
          else Wheel_Wm->Puls.Phase = 2;
        }
      }
      // слабое колесо
      // WheelXX->Ref может быть завышенным
      if((Wheel_Ws->Speed) > ROPBrakeA->SpThr)
      {
    	if( Wheel_Ws->Puls.Ph_Cnt >=
    	   (Wheel_Ws->Puls.TcutSet -__ROP_dT1) &&
    	    Wheel_Ws->Slip < __ROP_Slip1 &&   // проскальзывание меньше 7,5%
     	    !ROP_AccX_Max &&					// не достигнуто замедление Ax 3,5m/c2
     	   (Wheel_Ws->Press + __ROP_Ph2_dPms) <
		    Wheel_Wm->Press &&					// P меньше сильного на 0,65atm
            ROP.Brake.Time < 100)
    	  ROP_Pump(Wheel_Ws, (Wheel_Ws->Press + ROPBrakeA->CFG.dPpump));
      }
      else
      {
    	 if((Wheel_Ws->Puls.Ph_Cnt >=
    	    (Wheel_Ws->Puls.TcutSet -__ROP_dT1)) &&
    		 Wheel_Ws->Press > __ROP_Ph2_Pmin)
    		 ROP_Exh(Wheel_Ws, ROPBrakeA->CFG.dPexh);
      }
	}
} // end ROP_Phase2

// фаза ожидания выхода
void    ROP_Phase3 (WheelTypeDef* Wheel_Ws, WheelTypeDef* Wheel_Wm,
		            ROPBrakeTypeDef* ROPBrakeA)
{
	ROPBrakeA->DifOn = 0;
	if(ROP.Brake.Time > __ROP_Ph3_Tout ||
	   (Wheel_Wm->Press < __ROP_Ph4_Poff &&
	    Wheel_Wm->Slip < __ROP_Slip2 &&
		!ROP_Event)) // !!нужно ROP_Event
	{
	  ROPBrakeA->Phase = __ROP_BrakePh4;
	}
	else
	{
      if( Wheel_Wm->Puls.Ph_Cnt >=
         (Wheel_Wm->Puls.TcutSet -__ROP_dT1))
      {
        if(Wheel_Wm->Press > __ROP_Ph2_Pmin)
           ROP_Exh(Wheel_Wm, ROPBrakeA->Ph3_dP);
    //    else
    //    	ROPBrakeA->Poff = 1;
        if(Wheel_Ws->Press > __ROP_Ph2_Pmin)
           ROP_Exh(Wheel_Ws, ROPBrakeA->Ph3_dP);
      }
	}
}

// фаза выхода
void    ROP_Phase4 (WheelTypeDef* Wheel_Ws, WheelTypeDef* Wheel_Wm,
			        ROPBrakeTypeDef* ROPBrakeA)
{
	if(Wheel_Ws->Press > __ROP_Ph4_Poff)
	   ROP_Exh(Wheel_Ws, (Wheel_Ws->Press -__ROP_Ph4_Poff));
	if(Wheel_Wm->Press > __ROP_Ph4_Poff)
	   ROP_Exh(Wheel_Wm, (Wheel_Wm->Press -__ROP_Ph4_Poff));
	else
	{ // фаза выхода

		Wheel_Ws->Puls.Phase = 0;
		Wheel_Wm->Puls.Phase = 0;
		ROPBrakeA->Phase = 0;
		ROPBrakeA->Poff = 1;
	}
}

void   ROP_SpThr (ROPBrakeTypeDef* ROPBrakeA, WheelTypeDef* Wheel_XX)
{
    if(ROPBrakeA->Phase < __ROP_BrakePh2)
       ROPBrakeA->SpThr = ((uint32_t)Wheel_XX->Ref *
				   	       (uint32_t)ROPBrakeA->CFG.Slip) / 65536;
    else
       ROPBrakeA->SpThr = ((uint32_t)Wheel_XX->Ref *
	   				   	   (uint32_t)ROP.CFG.SlipN) / 65536;
}

// коеффициент определения ускорения AxRm
// 2048 / 256 * 200 / 3.6
#define   __K_AxRef       444
#define   __ROP_TAx_Delay 5   //25mc
void   ROP_TimeAx (ROPBrakeTypeDef* ROPBrakeA, WheelTypeDef* Wheel_XX)
{	if(ROPBrakeA->Phase > __ROP_BrakePh1)
    {  ROPBrakeA->Time++;
       if(ROPBrakeA->Time > __ROP_TAx_Delay)
       ROPBrakeA->Axm = (((uint32_t)ROPBrakeA->Vref -
    		              (uint32_t)Wheel_XX->Speed) *
			              (uint32_t)__K_AxRef) /
						  (uint32_t)ROPBrakeA->Time;
    }
    else
    {  ROPBrakeA->Time = 0; //
       ROPBrakeA->Axm = 0;
    }
	if(ROPBrakeA->Time < __ROP_TAx_Delay)
	   ROPBrakeA->Vref = Wheel_XX->Speed;
}

//------------------------------------------------------------------------
// Регулирование давления ROP
void    ROP_Press_Regulate (void)
{
// вызов MainLoop_5ms ROP_OFF_Press
	 if(ROP.BrakeF.Phase ||
		ROP.BrakeR.Phase)
		ROP.Brake.Time ++;
	 else
	 {  ROP.Brake.Time = 0;
	   if(ROP.OFF_Cnt)
		  ROP.OFF_Cnt--;
  	 }
#ifdef   __AxisF_Compile
	// ----------- перед ----------------------------
	// управление диф. клапаном
	// начальное давление диф.клапанов
	// в зависимости от загрузки
	ROP.dPdif = ROP.CFG.dPdif;
	ROP.Pdif_F = Brake.Front.Air;
	ROP.BrakeF.Po = (uint32_t)ROP.CFG.PoF * Load.Truck.Front_Fz /
	 			                  Load.CFG.Truck.Empty_Axis_Front;
	ROP.BrakeF.Pmax = ((uint32_t)ROP.CFG.PmaxF + (uint32_t)ROP.Brake.dP_Vx) *
			Load.Truck.Front_Fz / Load.CFG.Truck.Empty_Axis_Front;
	if(Acc_Y_est > 0) // поворот влево нагружен R
	{ // определяем порог скорости слабого колеса
	  ROP_SpThr (&(ROP.BrakeF), &Wheel_FL);
	  // определяем замедление сильного колеса
	  ROP_TimeAx (&(ROP.BrakeF), &Wheel_FR);
      switch (ROP.BrakeF.Phase)
      { case __ROP_BrakePh0: // фаза ожидания ROP_Event
		       ROP_Phase0 (&Wheel_FL, &Wheel_FR, &(ROP.BrakeF));
        break;
        case __ROP_BrakePh1: // фаза подъема до Po
			   ROP_Phase1 (&Wheel_FL, &Wheel_FR, &(ROP.BrakeF));
        break;
        case __ROP_BrakePh2: // фаза адаптации P
			   ROP_Phase2 (&Wheel_FL, &Wheel_FR, &(ROP.BrakeF));
	   	break;
        case __ROP_BrakePh3: // фаза ожидания выхода
			   ROP_Phase3(&Wheel_FL, &Wheel_FR, &(ROP.BrakeF));
	   	break;
        case __ROP_BrakePh4: // фаза выхода
			   ROP_Phase4(&Wheel_FL, &Wheel_FR, &(ROP.BrakeF));
	    break;
      }
	}
	else  // поворот вправо нагружен L
	{ // определяем порог скорости слабого колеса
	  ROP_SpThr (&(ROP.BrakeF), &Wheel_FR);
	  // определяем замедление сильного колеса
	  ROP_TimeAx (&(ROP.BrakeF), &Wheel_FL);
      switch (ROP.BrakeF.Phase)
      { case __ROP_BrakePh0: // фаза ожидания ROP_Event
		       ROP_Phase0 (&Wheel_FL, &Wheel_FR, &(ROP.BrakeF));
        break;
        case __ROP_BrakePh1: // фаза подъема до Po
 		       ROP_Phase1 (&Wheel_FR, &Wheel_FL, &(ROP.BrakeF));
        break;
        case __ROP_BrakePh2: // фаза адаптации P
			   ROP_Phase2 (&Wheel_FR, &Wheel_FL, &(ROP.BrakeF));
	   	break;
        case __ROP_BrakePh3: // фаза ожидания выхода
			   ROP_Phase3(&Wheel_FR, &Wheel_FL, &(ROP.BrakeF));
	   	break;
        case __ROP_BrakePh4: // фаза выхода
			   ROP_Phase4(&Wheel_FR, &Wheel_FL, &(ROP.BrakeF));
	    break;
      }
	}
#endif
#ifdef   __AxisR_Compile
	// --------------- зад -----------------------
	// управление диф. клапаном
	// начальное давление диф.клапанa
	// в зависимости от загрузки
	ROP.Pdif_R = Brake.Rear.Air;
	{ ROP.BrakeR.Po = (int32_t)ROP.CFG.PoR * Load.Truck.Rear_Fz /
		              (int32_t)Load.CFG.Truck.Empty_Axis_Rear;
	  ROP.BrakeR.Pmax = (ROP.CFG.PmaxR + ROP.Brake.dP_Vx) * Load.Truck.Rear_Fz /
			            (int32_t)Load.CFG.Truck.Empty_Axis_Rear;
	}

	if(Acc_Y_est > 0) // поворот влево нагружен R
	{ // определяем порог скорости слабого колеса
	  ROP_SpThr (&(ROP.BrakeR), &Wheel_RL);
	  // определяем замедление сильного колеса
	  ROP_TimeAx (&(ROP.BrakeR), &Wheel_RR);
      switch (ROP.BrakeR.Phase)
      { case __ROP_BrakePh0: // фаза ожидания ROP_Event
		       ROP_Phase0 (&Wheel_RL, &Wheel_RR, &(ROP.BrakeR));
	    break;
        case __ROP_BrakePh1: // фаза подъема до Po
			   ROP_Phase1(&Wheel_RL, &Wheel_RR, &(ROP.BrakeR));
	   	break;
        case __ROP_BrakePh2: // фаза адаптации P
			   ROP_Phase2 (&Wheel_RL, &Wheel_RR, &(ROP.BrakeR));
	    break;
        case __ROP_BrakePh3: // фаза ожидания выхода
			   ROP_Phase3 (&Wheel_RL, &Wheel_RR, &(ROP.BrakeR));
		break;
        case __ROP_BrakePh4: // фаза выхода
			   ROP_Phase4 (&Wheel_RL, &Wheel_RR, &(ROP.BrakeR));
	    break;
      }
	}
	else  // поворот вправо нагружен L
	{ // определяем порог скорости слабого колеса
	  ROP_SpThr (&(ROP.BrakeR), &Wheel_RR);
	  // определяем замедление сильного колеса
	  ROP_TimeAx (&(ROP.BrakeR), &Wheel_RL);
      switch (ROP.BrakeR.Phase)
	  { case __ROP_BrakePh0: // фаза ожидания ROP_Event
			   ROP_Phase0 (&Wheel_RL, &Wheel_RR, &(ROP.BrakeR));
		break;
	    case __ROP_BrakePh1: // фаза подъема до Po
		       ROP_Phase1 (&Wheel_RR, &Wheel_RL, &(ROP.BrakeR));
        break;
	    case __ROP_BrakePh2: // фаза адаптации P
			   ROP_Phase2 (&Wheel_RR, &Wheel_RL, &(ROP.BrakeR));
		break;
	    case __ROP_BrakePh3: // фаза ожидания выхода
			   ROP_Phase3 (&Wheel_RR, &Wheel_RL, &(ROP.BrakeR));
		break;
	    case __ROP_BrakePh4: // фаза выхода
			   ROP_Phase4 (&Wheel_RR, &Wheel_RL, &(ROP.BrakeR));
		 break;
	  }
	}
#endif
} // end ROP_PressReg()

//********************************************************************
//                       SSC
//********************************************************************

void  SideSlip_Estimate(void)
{
/* ===================================================================
	**    === Oценка поперечной скорости ===
	**    используя три переменные Acc_Y, Omega_Z_sen, Speed_VX_est
	**    Derivative_VY = (Acc_Y_sen - Speed_VX_est * Omega_Z_sen)
	**    интегрируем  Derivative_VY
** =================================================================== */

// находим Derivative_VY
// 1m/c^2 - 35720lsb
// Коeф. приведения размерности Vx*Wz к Ay
// __K_Ay_VxWz = 65536/__Koef_AccY_Wz (0x11C7)
#define   __K_Ay_VxWz    3686 //
//------------------основная проблема------------------------------
// Acc_Y_est зависит от крена
	Derivative_VY = Acc_Y_est - AccelY.OmegaZ + AccelY.OffSet;
// притягиваем интегратор к 0 если нет бокового скольжения
// условие - мала Delta_OmegaZ   SSC.CFG.dWz_SA
// не нужное притягивание при пересечении Omeg
// вводим задержку 0,3c
#define   __SA_dWz_Delay    60
#define   __IntVY_dec  0x00000472 //0x00004000 //0x00001900
	if(Delta_OmegaZ < SSC.CFG.dWz_SA &&
	   Delta_OmegaZ > -SSC.CFG.dWz_SA)
	{ if(SSC.Cnt < __SA_dWz_Delay)
		 SSC.Cnt++;
	}
	else SSC.Cnt = 0;
	if(SSC.Cnt == __SA_dWz_Delay ||
	   (Acc_Y_est < 0x0100 &&
		Acc_Y_est > -0x0100))
	{ // притягиваем интегратор к 0
	  if(Integrator_VY > __IntVY_dec) Integrator_VY -= __IntVY_dec;
	  if(Integrator_VY < -__IntVY_dec) Integrator_VY += __IntVY_dec;
	}
	else  // интегрируем Derivative_VY
	Integrator_VY += Derivative_VY;

// ограничение переполнения по Vy 10,3км/час
// 	IntVY_max = 20*256*256*__K_SpeedVY_Integ (2621)
#define   __IntVY_max    0x00120000 //0x7FF00000 //
	if(Integrator_VY > __IntVY_max)
	{  Integrator_VY = __IntVY_max; BadVY = 1; }
	else
	if(Integrator_VY < -__IntVY_max)
	{  Integrator_VY = -__IntVY_max; BadVY = 1; }
	else BadVY = 0;

// обнуление интегратора если стоит или не достоверна Speed_VX_est
    if(!Forward_Move)	Integrator_VY = 0;

// находим Speed_VY_est
// размерность Vy 1км/час  256lsb
//  K_SpeedVY_Integ = 65536 * 256 / 8192 /200 * 256
#define   __K_SpeedVY_Integ 147//2621
    Speed_VY_est = _Hi_32(Integrator_VY * (int32_t)__K_SpeedVY_Integ);

/* ===================================================================
	**    === Oценка тангенса угла бокового скольжения перед   ======
	**    Sa_Front = ((Speed_VY_est * _Ktg_Vy) + (Ktg_aWz * Omega_Z_est) /
	**                 Speed_VX_Sim)  - (Teta_Dr_sen)
	**    пренебрегаем тангенс суммы != сум.тан.
	**    размерность 1рад  - 8192 lsb
** =================================================================== */
#define	  _Ktg_Vy        8192
// кэффициет уменьшения веса Omega_Z в угле
//#define	  __Ktg_Koef     71  //256/3.6
	if(Forward_Move)
	{
      SSC.Ktg_aWz = ((int32_t)Load.Truck.CG_A * (int32_t)SSC.CFG.Ktg_Koef)/256;
      if(SSA_OmegaZ_Enable)
    	   SSC.OmegaZ_Ktg = (int32_t)Omega_Z_est * SSC.Ktg_aWz;
      else SSC.OmegaZ_Ktg = 0;
      int32_t SAF = ((int32_t)Speed_VY_est * (int32_t)_Ktg_Vy +    // (Speed_VY * _Ktg_Vy)
		                 SSC.OmegaZ_Ktg) / (int32_t)Speed_VX_est - // (Ktg_aWz * Omega_Z)
		                (int32_t)Teta_Steering_Wheel;
      Sa_Front = _Lo_32(SAF);
/* ===================================================================
	**    === Oценка тангенса угла бокового скольжения  зад  ======
	**    Sa_Rear = ((Speed_VY_est * _Ktg_Vy) - (Ktg_bWz * Omega_Z_est) /
	**                 Speed_VX_Sim)
	**   размерность Sa_Rear 1рад  - 8192 lsb
	**   Ktg_bWz = 3.6* 256 * B(m)
** =================================================================== */
	  SSC.Ktg_bWz = (((int32_t)DSC_Car_Base - (int32_t)Load.Truck.CG_A)*
			          (int32_t)SSC.CFG.Ktg_Koef)/256;
      if(SSA_OmegaZ_Enable)
    	   SSC.OmegaZ_Ktg = (int32_t)Omega_Z_est * SSC.Ktg_bWz;
      else SSC.OmegaZ_Ktg = 0;
	  Sa_Rear = _Lo_32(((int32_t)Speed_VY_est * (int32_t)_Ktg_Vy - // (Speed_VY * _Ktg_Vy)
		                SSC.OmegaZ_Ktg) / (int32_t)Speed_VX_est);  // (Ktg_bWz * Omega_Z)

	}
	else {Sa_Front = 0; Sa_Rear = 0;}
} // end SideSlip_Estimate()

void  SideSlip_Control(void)
{
// размерность Sa_Rear 1рад  - 8192 lsb
#define   __SpeedVY_Act0N	0x0200
//#define   __SSC_Thr_SA	    0x0430 //7,5grad

	if(CFG_DYC_Break_Enable &&   // DYC_Break разрещен в конфигурации
	   DYC_Enable &&			 // Нет запрета
	   DSC_SideSleep_Enable)     //	SideSleep  разрещен в конфигурации
	{ // поворот влево OverSteering
      // проверка условий активации
	  if(Omega_Z_est > Road.OmegaZ &&
		 Speed_VY_est < -__SpeedVY_Act0N &&
		 Sa_Rear <-SSC.CFG.Thr_SA)
		    DYC_pozWz_SSA = 1;
	  else  DYC_pozWz_SSA = 0;

	  // поворот влево OverSteering
	  // проверка условий активации
	  if(Omega_Z_est < -Road.OmegaZ &&
	     Speed_VY_est > __SpeedVY_Act0N &&
	     Sa_Rear > SSC.CFG.Thr_SA)
	  		DYC_negWz_SSA = 1;
	  else  DYC_negWz_SSA = 0;

	}
	else
	{ DYC_pozWz_SSA = 0;
	  DYC_negWz_SSA = 0;
	}
} // end SideSlip_Control()

//********************************************************************
//                       DYC
//********************************************************************
uint8_t  DYC_Break_Activate(WheelTypeDef* Wheel_XX)
{
	if(!Wheel_XX->Puls.Active)
	{
	  Wheel_XX->Puls.Active = 1;
	  Wheel_XX->Puls.Phase = 1;
	  Wheel_XX->Puls.TcutSet = DYC.CFG.TcutSet;
	  if(Wheel_Ref_Correct &&
	     Wheel_XX->Ref > Wheel_XX->Speed)
	     Wheel_XX->Ref = Wheel_XX->Speed; // коррекция  базовой скорости
         return 1;
    }
    else return 0;
}
uint8_t  DYC_Break_DeActivate(WheelTypeDef* Wheel_XX)
{
	if(Wheel_XX->Puls.Active &&
	   Wheel_XX->Puls.Phase == 6)
	{  Wheel_XX->Puls.Phase = 0;
	   Wheel_XX->Puls.Active = 0;
         return 1;
	}
	else return 0;
}

uint16_t    PumpSet_Diag(void)
{
#define __Dia_PpumpSet   0x6E00  // 5,5atm
#define __Dia_PdifSet    0xA000; // 8atm

	uint16_t P = __Dia_PpumpSet;
    if(Diag.Pdes) P = Diag.Pdes;
    return P;
}

void    Direct_Yaw_Control (void)
{ // 5mc
//-------------------------------------------------------------------

// разница желаемой и с датчика
    int16_t dWz = OmegaZ_Des - Omega_Z_est;
// фильтруем разницу
	Filter_DeltaOmegaZ.Xn = (int32_t)dWz;
	Delta_OmegaZ = Filter_Cheb(&Filter_DeltaOmegaZ, Koef_Filtr5Hz);

// производная OmegaZ
// фильтруем OmegaZ
	Filter_OmegaZ.Xn = (int32_t)Omega_Z_est;
	BuffAcc_OmegaZ[0] = Filter_Cheb(&Filter_OmegaZ, Koef_Filtr5Hz);
	Derivative_OmegaZ = DeriVative(BuffAcc_OmegaZ, 15); //за 75mc

// производная OmegaZ_Des
// фильтруем OmegaZ_Des
	Filter_Akker.Xn = OmegaZ_Des;
	BuffAcc_Akker[0] = Filter_Cheb(&Filter_Akker, Koef_Filtr5Hz); //5Hz);
	Derivative_Akker = DeriVative(BuffAcc_Akker, 15); //за 75mc

// флаг быстрого вращения руля
#define   __DerAkkerThr  0x0080
	if((Derivative_Akker > -__DerAkkerThr) &&
	   (Derivative_Akker < __DerAkkerThr))
		 SteerSharpRotate = 0;
	else SteerSharpRotate = 1;
// производная Delta_OmegaZ
	Derivative_DeltaWz = Derivative_Akker - Derivative_OmegaZ;

//	регулятор
//  ограничиваем дельту DYC.CFG.dWzLim
	if(DYC.CFG.dWzLim)
	{
	  if(Delta_OmegaZ > DYC.CFG.dWzLim)
		 Delta_OmegaZ = DYC.CFG.dWzLim;
	  if(Delta_OmegaZ < -DYC.CFG.dWzLim)
		 Delta_OmegaZ = -DYC.CFG.dWzLim;
	}
// Пропорциональная составляющая
	DYC.PD_Pro = (int32_t)DYC.CFG.PD_Kpro *  Delta_OmegaZ;
// Дифференциальная составляющая
	DYC.PD_Dif = (int32_t)DYC.CFG.PD_Kdif * Derivative_DeltaWz;

//	-------------регулятор для Under Steering---------------------
	int32_t PDout = DYC.PD_Pro + DYC.PD_Dif;
// Нормирование
#define   __Wz_Norm 0x08F0 //0x0B2C //20dps__12dps //__7dps //__5dps
	int32_t RoadWz = Road.OmegaZ;
	if(RoadWz <__Wz_Norm) RoadWz = __Wz_Norm;
	if(DYC_PDout_Norm) PDout = (PDout * __Wz_Norm) / RoadWz;
// переполнение
#define   __PDout_Lim   0x00007F00
	if(PDout > __PDout_Lim)  PDout = __PDout_Lim;
	if(PDout < -__PDout_Lim) PDout = -__PDout_Lim;
	DYC.UnSt.PDOut = _Lo_32(PDout);

#ifdef   __AxisF_Compile
//	---------------регулятор для Over Steering--------------------
	if((Omega_Z_est > 0 && Delta_OmegaZ > 0) ||  // поворот влево
	   (Omega_Z_est < 0 && Delta_OmegaZ < 0))    // поворот вправо
	     PDout = DYC.PD_Dif;  // без пропорциональной составляющей
	else PDout = DYC.PD_Pro + DYC.PD_Dif;
// Нормирование
	if(DYC_PDout_Norm) PDout = (PDout * __Wz_Norm) / RoadWz;
// переполнение
	if(PDout > __PDout_Lim)
	   PDout = __PDout_Lim;
	if(PDout < -__PDout_Lim)
	   PDout = -__PDout_Lim;
//	if(Yaw_Bias)
		 DYC.OvSt.PDOut = _Lo_32(PDout);
//	else DYC.OvSt.PDOut = 0;

    // флаг активации OvSt
#define   __OvStAct0FF_T    20
    if(DYC_pozWz_OvSt ||
       DYC_negWz_OvSt)
    {  DYC_OvSt_Active = 1;
       DYC.OvSt.Act_Cnt = __OvStAct0FF_T;
    }
    else
    { if(DYC.OvSt.Act_Cnt)
    	 DYC.OvSt.Act_Cnt--;
      else  DYC_OvSt_Active = 0;
    }
#define   __WzOvStAct0N    __5dps  //5
#define   __WzOvStAct0N1   __4dps  //5
#define   __WzOvStAct0FF   __3dps //0x0165  //2,5deg/c __3dps
	// порог для OmegaZ
    if(!DYC_OvSt_Active)
    { if(!Yaw_Bias)
		   DYC.OvSt.WzThr = __WzOvStAct0N;
	  else DYC.OvSt.WzThr = __WzOvStAct0N1;
    }
	else   DYC.OvSt.WzThr = __WzOvStAct0FF;
#endif
// ---------------    DYC_Situation_Detect    ---------------
	if(CFG_DYC_Break_Enable &&   // DYC_Break разрещен в конфигурации
	   DYC_Enable)			     // Нет запрета
	{
//----------------------  OverSteering-----------------------
// условия активации
// 1 - OmegaZ больше порога
// 2 - PDOut больше порога или
// перебор OmegaZ относительно дороги DYC_OvSt_Active
#ifdef   __AxisF_Compile
// ------Определение необходимости снижения плюс Omega_Z-----
	  if(!DYC_pozWz_UnSt && !DYC_negWz_UnSt)
	  { // поворот влево OverSteering
	    if(!DYC_negWz_OvSt)
        { if(!DYC_pozWz_OvSt)
	      { // проверка условий активации
	        if(!Wheel_FR.Puls.Delay &&
	           Yaw_Bias &&
	            Omega_Z_est > DYC.OvSt.WzThr &&
//			   (OmegaZ_Des > DYC.OvSt.WzThr /2 ||
//				DYC_OvSt_Active) &&
	           (DYC.OvSt.PDOut < - DYC.CFG.OvSt.PD_Thr ||    // регулятор PD
	            DYC_pozWz_SSA))        // перебор OmegaZ относительно дороги
	           DYC_pozWz_OvSt = 1;
	      }
	    } else DYC_pozWz_OvSt = 0;

// ------Определение необходимости снижения минус Omega_Z-----
	    // поворот вправо Oversteering
	    if(!DYC_pozWz_OvSt)
        { if(!DYC_negWz_OvSt)
	      { // проверка условий активации
		    if(!Wheel_FL.Puls.Delay &&
		    	Yaw_Bias &&
			    Omega_Z_est < -DYC.OvSt.WzThr &&
	//		   (OmegaZ_Des < -(DYC.OvSt.WzThr /2) ||
	//			DYC_OvSt_Active) &&
		       (DYC.OvSt.PDOut >  DYC.CFG.OvSt.PD_Thr ||    // регулятор PD
		        DYC_negWz_SSA))    // перебор OmegaZ относительно дороги
		        DYC_negWz_OvSt = 1;
	      }
	    } else  DYC_negWz_OvSt = 0;

      }
      else // активен UnderSteering
      { DYC_pozWz_OvSt = 0;
        DYC_negWz_OvSt = 0;
      }
#endif
//--------------------- UnderSteering ------------------------------------
// условия активации
// одинаковые знаки нельзя
// малое ускорение  ???

// -------------      Определение порогов DYC.UnSt   ---------------------
// Определение порога для Ackermana !!! множитель 1.45 Road.OmegaZ
	  int16_t AkkThrAdd = ((int16_t)DYC.CFG.UnSt.Kakk * Road.OmegaZ)/256;
// ограничиваем минимум 2deg/c больше нельзя
#define   __UnSt_DWZ_min     0x011E // 2deg/c
	  if(AkkThrAdd < __UnSt_DWZ_min)
	     AkkThrAdd = __UnSt_DWZ_min;
        DYC.UnSt.AkThr = Road.OmegaZ + AkkThrAdd;
// Определение порога для
	  DYC.UnSt.WzThr = Road.OmegaZ + DYC.CFG.UnSt.dWzON;

	  if(!DYC_pozWz_OvSt && !DYC_negWz_OvSt)
	  {
//-------Определение необходимости увеличения плюс Omega_Z----------------
#define   __UnSt_Path_Angle	0x0F00 //15grad 0x2000 //32grad
        // поворот влево UnderSteering
        if(!DYC_pozWz_UnSt)
        { if(!Wheel_RL.Puls.Delay &&
 			 Omega_Z_est > 0 &&
			 Omega_Z_est < DYC.UnSt.WzThr &&
    	     OmegaZ_Des > DYC.UnSt.AkThr &&
   		     Delta_OmegaZ > DYC.CFG.UnSt.dWzON &&


		   //  !DYC.UnSt.Delay && !LineChange_Right &&
//			 (Maneuver.WzPoz_Angle > __UnSt_Path_Angle || !UnSt_Only_Circle) &&
		     Road.Mu < DYC.CFG.UnSt.AyOn &&     // малое ускорениe
//o   		     Sa_Rear > -SSC.CFG.Thr_SA/3 &&  //3grad
//		     Derivative_OmegaZ < DYC.CFG.UnSt.DerWz &&    //Малая DerivativeOmegaZ
		     (Derivative_Akker > -DYC.CFG.UnSt.DerWz ||
		      !UnSt_Der_Akk) &&                           //Прямой ход руля
		     DYC.UnSt.PDOut > DYC.CFG.UnSt.PD_Thr)
    	   DYC_pozWz_UnSt = 1;
        }

//------ Определение необходимости увеличения минус Omega_Z--------------------
	    // поворот вправо UnderSteering
        if(!DYC_negWz_UnSt)
        { if(!Wheel_RR.Puls.Delay &&
 			 Omega_Z_est < 0 &&
			 Omega_Z_est > -DYC.UnSt.WzThr &&
		     OmegaZ_Des < -DYC.UnSt.AkThr &&
		     Delta_OmegaZ < -DYC.CFG.UnSt.dWzON &&

		  //   !DYC.UnSt.Delay && !LineChange_Left &&
//			 (Maneuver.WzNeg_Angle < -__UnSt_Path_Angle || !UnSt_Only_Circle) &&
		     Road.Mu < DYC.CFG.UnSt.AyOn &&     // малое ускорениe
//o 		     Sa_Rear < SSC.CFG.Thr_SA/3 &&     //3grad
//		     Derivative_OmegaZ > -DYC.CFG.UnSt.DerWz && //Малая DerivativeOmegaZ
		     (Derivative_Akker < DYC.CFG.UnSt.DerWz ||
		      !UnSt_Der_Akk) &&               //Прямой ход руля
		     DYC.UnSt.PDOut < -DYC.CFG.UnSt.PD_Thr)
           DYC_negWz_UnSt = 1;
        }
	  }
      else // активен OvSt
      { DYC_pozWz_UnSt = 0;
        DYC_negWz_UnSt = 0;
      }
	}
	else
	{ // запрещен DYC_Break
        DYC_Situation = 0; // Trailer
	}
//-----------      end  DYC_Situation -------------------
#define   __UnSt_Delay 	1750 //1,75c;
#define   __OvSt_Delay 	300

    // Находим начальное давление диф.клапанов
    DYC.dPdif = DYC.CFG.Dif_dP;
    if(DIF_PWM_Enable)
    { DYC.Pdif_F = DYC.CFG.Dif_PoF;
	  DYC.Pdif_R = DYC.CFG.Dif_PoR;
    }
    else
    { DYC.Pdif_F = Brake.Front.Air;
	  DYC.Pdif_R = Brake.Rear.Air;
    }
    // Находим давление Puls_Press
	// перед не зависит от загрузки и от Mu дороги
    DYC.Ppuls_F = DYC.CFG.PumpSetF;
    // зад
    DYC.Ppuls_R = DYC.CFG.PumpSetR;
#ifdef   __AxisF_Compile
// поворот вправо OverSteering -> пульс давления в переднем левом
	if(DYC_negWz_OvSt || Dia_Puls_FL)
	{ // активация
	  if(!Dia_Puls_FL)
		   Wheel_FL.Puls.PumpSet = DYC.Ppuls_F;
	  else Wheel_FL.Puls.PumpSet = PumpSet_Diag();
	  if(DYC_Break_Activate(&Wheel_FL))
	   	   Wheel_FL.Puls.Delay = __OvSt_Delay;
    }
	// деактивация
    if(DYC_Break_DeActivate(&Wheel_FL))
	{  DYC_negWz_OvSt = 0;
	   Dia_Puls_FL = 0;
	}

// поворот влево OverSteering -> пульс давления в переднем  правом
    if(DYC_pozWz_OvSt || Dia_Puls_FR)
    { // активация
	  if(!Dia_Puls_FR)
		   Wheel_FR.Puls.PumpSet = DYC.Ppuls_F;
	  else Wheel_FR.Puls.PumpSet = PumpSet_Diag();
	  if(DYC_Break_Activate(&Wheel_FR))
	       Wheel_FR.Puls.Delay = __OvSt_Delay;
    }
    // деактивация
	if(DYC_Break_DeActivate(&Wheel_FR))
    {  DYC_pozWz_OvSt = 0;
	   Dia_Puls_FR = 0;
	}
#endif

//поворот влево UnderSteering -> пульс давления в заднем левом
	if(DYC_pozWz_UnSt || Dia_Puls_RL)
    { // активация
	  if(!Dia_Puls_RL)
		   Wheel_RL.Puls.PumpSet = DYC.Ppuls_R;
	  else Wheel_RL.Puls.PumpSet = PumpSet_Diag();
	  if(DYC_Break_Activate(&Wheel_RL))
		   Wheel_RL.Puls.Delay = __UnSt_Delay;
	}
    // деактивация
	if(DYC_Break_DeActivate(&Wheel_RL))
    { if(!Dia_Puls_RL)
		Wheel_RL.Puls.Delay = __UnSt_Delay;
	    DYC_pozWz_UnSt = 0;
	    Dia_Puls_RL = 0;
    }

//поворот вправо UnderSteering -> пульс давления в заднем правом
    if(DYC_negWz_UnSt || Dia_Puls_RR)
	{ // активация
	  if(!Dia_Puls_RR)
		   Wheel_RR.Puls.PumpSet = DYC.Ppuls_R;
	  else Wheel_RR.Puls.PumpSet = PumpSet_Diag();
	  if(DYC_Break_Activate(&Wheel_RR))
	       Wheel_RR.Puls.Delay = __UnSt_Delay;
	}
    // деактивация
    if(DYC_Break_DeActivate(&Wheel_RR))
	{ if(!Dia_Puls_RR)
	    Wheel_RR.Puls.Delay = __UnSt_Delay;
		DYC_negWz_UnSt = 0;
		Dia_Puls_RR = 0;
	}
} // end Direct_Yaw_Control()

//********************************************************************
//                      TrailerVDC
//********************************************************************
#ifdef   __TrailerVDC_Compile

void    TrailerVDC(void)
{
// ----------------складывание прицепа----------------------------------
// флаг складывания прицепа
	if((LineChange_Left ||
		LineChange_Right) &&  //
	    AntiFold_Enable)      // разрешен в конфигурации
	     Trailer_Folding = 1;
	else Trailer_Folding = 0;
// флаг упреждения ROP прицепа Trailer_Before_ROP
// сброс установка в EngineTorque_Control
	if(Trailer.ROP.Time) Trailer.ROP.Time--;
	if(!ROP_Engine_Event ||
		ROP.BrakeR.Phase ||  // активен ROP Brake
	   !Trailer.ROP.Time)    // Tout
	  Trailer_Before_ROP = 0;

//--------------------- управление давлением ----------------------------
#define __ROP_BrakePh3   3
#define __Trailer_Pnevmo_Press    0x8C00; // 7,0atm
// управление давлением прицепа ROP
	if(ROP_Enable && ROP_Trailer_Break_Enable &&
	  ((ROP.BrakeR.Phase &&
		ROP.BrakeR.Phase < __ROP_BrakePh3) ||  //ROP_Event
	   Trailer_Before_ROP))
	{ // ROP Разрешен и есть  ROP_Event  активация
 	  // задание давления прицепа
	  if(Trailer_Before_ROP) Trailer.ROP.Pdes = Trailer.CFG.ROP_Po;
	  else
	  { ROP_TrailerBreak = 1; // событие торможения прицепа
		Trailer.ROP.Pdes = (((Trailer.CFG.ROP_Pdes * Load.Koef) /
		    		       (int32_t)__LoadEmpty_Koef) * ROP.CFG.K3) /256;
	    // уменьшаем давление если достигнут AccX_Max
	    if(Acc_X_est < -ROP.CFG.AccXdes)
		  Trailer.ROP.Pdes = Trailer.ROP.Pdes * Trailer.CFG.K_Ax /256;
	  }
	}
	else // ROP запрешен или нет ROP_Event
    { ROP_TrailerBreak = 0;
      if(Dia_DifTrailer && Diag.Pdes)
    	   Trailer.ROP.Pdes = Diag.Pdes;
      else Trailer.ROP.Pdes = 0;
    }

// управление давлением прицепа DYC
	if(DYC_Enable && DYC_TrailerPress &&
	   ((!Trailer_Preg_Tip2 && (DYC_negWz_OvSt || DYC_pozWz_OvSt)) ||
	    Trailer_Folding ||
		(Trailer_Preg_Tip2 && (Wheel_FL.Puls.Phase == 1 ||
				               Wheel_FR.Puls.Phase == 1))))
	{ if(!DYC_TrailerBreak)
	  {  // активация
		DYC_TrailerBreak = 1; // событие торможения прицепа
		Trailer.DYC.Pdes = Trailer.CFG.DYC_Pdes;// задание давления
	  }
	}
	else
	{ Trailer.DYC.Pdes = 0; // задание давления Trailer_Folding
      DYC_TrailerBreak = 0;
	}
//
	if(Trailer.ROP.Pdes ||
           Trailer.DYC.Pdes)
	{ Trailer.BrakeDemandLeft = 100;  // Relative brake demand value for left vehicle side
	  Trailer.BrakeDemandRight = 100; // Relative brake demand value for right vehicle side
    }
	else
	{ Trailer.BrakeDemandLeft = 0;
	  Trailer.BrakeDemandRight = 0;
    }

// отработка давления прицепа
uint16_t TrP;
	if(Trailer_Pmodel)
		 TrP = Trailer.Press; // model
	else TrP = TrailerP.Val;  // датчик
	//TrailerP.Val
	if(DSC_Dif_Trailer)
	{ if(((Trailer.ROP.Pdes + Trailer.CFG.dP) < TrP ||
		  !Trailer.ROP.Pdes) &&
		 ((Trailer.DYC.Pdes + Trailer.CFG.dP) < TrP ||
		  !Trailer.DYC.Pdes))
		DSC_Dif_Trailer = 0;
	}
	else
	if(Trailer.ROP.Pdes > TrP ||
	   Trailer.DYC.Pdes > TrP)
		DSC_Dif_Trailer = 1;

	// управление двигателем при ROP прицепа
#define __TrailerEngine_Tout 150 //0,75c
	if(//!Truck_VDC_Active &&
	   Trailer_VDC_Active &&
	   TrailerROP_Engine &&      //конфигурация
	   (Speed_VX_est > ROP.CFG.SpeedON))
	{   //Time Out
		if(Trailer.EngineTout < __TrailerEngine_Tout)
		{ Trailer.EngineTout++;
		     EngineTrailer_Request = 1;
		}
		else EngineTrailer_Request = 0;
	}
	else
	{ EngineTrailer_Request = 0;
	  Trailer.EngineTout = 0;
	}
	// управление стоп-сигналом тягача
	// CFG флаг DSC_Brake_Light отключает при Trailer_VDC_Active
	// Trailer_StopReq передается в DZ а тот передает VDC1
#define __TrailerStop_Tout  600 //3c
	if(Trailer_Stop_Light &&  // CFG
	   Trailer_StopLampReq &&
	   Trailer_VDC_Active)
	{   //Time Out
		if(Trailer.StopTout < __TrailerStop_Tout)
		{  Trailer.StopTout++;
		   Trailer_Stop_Request = 1;
		}
		else Trailer_Stop_Request = 0;
	}
	else
	{ Trailer_Stop_Request = 0;
	  Trailer.StopTout = 0;
	}

	// флаг  Trailer_Break
		if( Trailer.ROP.Pdes ||
			Trailer.DYC.Pdes ||
		    Dia_DifTrailer)
		     Trailer_Break = 1;
		else
		if(Trailer.Press < (DifPressOff - __Dif_dPoff)) // ?? затягивает
			 Trailer_Break = 0;

} // end TrailerVDC()

#endif

// управление стоп-сигналом тягача
void    Stop_Light(void)
{
#define __Stop_Light_Tout     6000 //30c
#define __Stop_Light_DelayOff 200 //1c
// запрос посылаемый в CAN VDC1
	if(DSC_Brake_Light &&       // CFG
	   Brake.Light.Tout != __Stop_Light_Tout && // нет Tout
	   (ROP_BrakeActive ||      // активен ROP тягача
	    DYC_BrakeActive ||	    // активен DYC тягача
		HillHolder_Active ||    // активен Hill Holder
		HaltBrake_Active ||     // активен Halt Brake
	    Trailer_Break ||        // воздействие тягача на прицеп при VDC
	    Trailer_Stop_Request || // запрос Stop от Trailer
		Dia_Stop_Light))        // диагностика
	{
		if(Brake.Light.Tout < __Stop_Light_Tout)
		{  Brake.Light.Tout++;
		   Stop_Request = 1;
		   Brake.Light.DelayOff = __Stop_Light_DelayOff;
		}
	}
	else
	{   Brake.Light.Tout = 0;
	    if(Brake.Light.DelayOff)
		   Brake.Light.DelayOff--;
	    else	 Stop_Request = 0;
	}
} // end Stop_Light()


//********************************************************************
//                             ABS
//********************************************************************
void   Failure_ABS (WheelTypeDef* Wheelx)
{
//  без Short_Gnd, Wrong_Speed, Wrong_T, Tire_Fail, Rack_Fail, Whip_Fail
#define   __Mask_Sen_Err    0x003B //

	if(((Wheelx->Sen_Err.Word & __Mask_Sen_Err) ||
	     Wheelx->MOD_Err.Word ||
		 Fatal_Failure ||
		 !Model_Instal) &&
		 !DSC_Emul_Fl)
		            Wheelx->ABS.Failure = 1;// Failure = 1;
	else // было при активном ABS не сбрасывалось
	if(!ABS_Active) Wheelx->ABS.Failure = 0;//Failure = 0;
}

void   Base_Sum (WheelTypeDef* Wheelx)
{
#define   __ABS_Base_Min  0x0100
    if(//!BaseFail &&
    	!Safe_dT &&
	    Wheelx->ABS.Base > __ABS_Base_Min)
    {
    	ABS.Base.Sum += (uint32_t)Wheelx->ABS.Base;
        ABS.Base.N++;
    }
}
void   Base_High (WheelTypeDef* Wheelx)
{
    if(!BaseFail &&
      // !Safe_dT &&
	    Wheelx->ABS.Base > ABS.Base.High)
       ABS.Base.High = Wheelx->ABS.Base;
}

//----------------- макрос _Ref_Max ----------------------
// ограничиваем верх от вылета и
// ограничиваем низ от нулевой скорости !!!
#define _Ref_High(XX) {				    \
     if(Wheel_##XX.Ref > ABS.RefHigh)	\
	    ABS.RefHigh = Wheel_##XX.Ref;	\
} //end macroc
//New
/*
uint16_t   Ref_High (WheelTypeDef* Wheelx)
{
    if(//!BaseFail &&
       !Safe_dT &&
	   Wheelx->Ref < ABS.RefLim	&&
	   Wheelx->Ref > ABS.RefHigh)
    	 return Wheelx->Ref;
    else return 0;
}
*/
// размерность ускорения колеса 1м/c^2 - 5lsb
#define __ABS_Ret_Pump   1
#define __ABS_Ret_Cut    2
#define __ABS_Ret_Exh    3

void     ABS_Regulate(void)
{  // 5mc
// -------------    Failure    ----------------
#define   __Mask_Power_Error   0xBC
// Ubat_Over  Ubat_High  Ubat_LowUbat _Low K30_Fuse_Cut

	if(((s_MC1_Error |
		 s_MC2_Error) & __MC_Fatal_Error) ||
	   (Power_Error & __Mask_Power_Error))
		 Fatal_Failure = 1;
	else Fatal_Failure = 0;
	// по колесам
#ifdef   __AxisF_Compile
	Failure_ABS(&Wheel_FL);
	Failure_ABS(&Wheel_FR);
	Failure_ABS(&Wheel_RL);
	Failure_ABS(&Wheel_RR);
#endif
#ifdef   __AxisR_Compile
	Failure_ABS(&Wheel_RL);
	Failure_ABS(&Wheel_RR);
#endif

// ------------определяем порог скорости выхода----------------
#define   __ABS_Speed_On   0x0B80 //11,5km/h
#define   __Off_Acc_min    5120   //2,5m/c^2
//__Kacc_SpOn = 8192*V/A
//#define   __Kacc_SpOn      15700 // 11,5km/h при 6m/c^2
//#define   __Kacc_SpOn      10923 // 10km/h при 7,5m/c^2
#define   __Kacc_SpOn      12561 // 11,5km/h при 7,5m/c^2
#define   __Speed_OffRoad  0x0A00 //10km/h
#define   __Speed_On_Thr   0x0080 //0,5km/h 0x0180 //1,5km/h

   // скорость выхода зависит от замедления авто
int16_t       Ax = Acc_X_est;
   if(Ax < 0) Ax = -Acc_X_est;
   if(Ax < __Off_Acc_min)
	  Ax = __Off_Acc_min;
   ABS.SpeedOFF = Ax * (uint32_t)__Kacc_SpOn /65536;
   if(ABS.SpeedOFF > __ABS_Speed_On)
      ABS.SpeedOFF = __ABS_Speed_On;
   if(ABS.SpeedOFF < ABS.CFG.SpeedOFF)
	  ABS.SpeedOFF = ABS.CFG.SpeedOFF;
   if(ABS_OffRoad)
	  ABS.SpeedOFF += __Speed_OffRoad;

//----------------- базовая скорость------------------
   // защита от дребезга 04_21 Drebezg ABC.road
   // порог ограничения от выбросов скорости
#define   __BaseHigh_Thr   0x0A00
//#define   __BaseHigh_Sleep  63570  //3%
   ABS.Base.Lim =  ABS.Base.Midl + __BaseHigh_Thr;
   ABS_Base(&Wheel_FL);
   ABS_Base(&Wheel_FR);
   ABS_Base(&Wheel_RL);
   ABS_Base(&Wheel_RR);


   if(ABS_BaseRtoF && //  CFG
	  ABS_Rear_Active)
   {
	 Wheel_RL.ABS.Base = ABS.Base.High_Front;
	 Wheel_RR.ABS.Base = ABS.Base.High_Front;
   }

   // верхняя базовая скорость переда
   ABS.Base.High_Front = Wheel_FL.ABS.Base;
   if(Wheel_FR.ABS.Base > ABS.Base.High_Front)
   ABS.Base.High_Front = Wheel_FR.ABS.Base;
   // верхняя базовая скорость зада
   ABS.Base.High_Rear = Wheel_RL.ABS.Base;
   if(Wheel_RR.ABS.Base > ABS.Base.High_Rear)
   ABS.Base.High_Rear = Wheel_RR.ABS.Base;


   // средняя базовая скорость
   // без 0 и Fail
   ABS.Base.Sum = 0;
   ABS.Base.N = 0;
   Base_Sum(&Wheel_FL);
   Base_Sum(&Wheel_FR);
   Base_Sum(&Wheel_RL);
   Base_Sum(&Wheel_RR);
   if(ABS.Base.N)
	       ABS.Base.Midl = ABS.Base.Sum / ABS.Base.N;
   else    ABS.Base.Midl = ((uint32_t)Speed_FrontAxel);// +
                          //  (uint32_t)Speed_RearAxel) /2;

   // верхняя базовая скорость
   // max Wheelx->ABS.Base
   ABS.Base.High = 0;
   Base_High(&Wheel_FL);
   Base_High(&Wheel_FR);
   if(ABS_Active)
   {
   Base_High(&Wheel_RL);
   Base_High(&Wheel_RR);
   }

   ABS.RefHigh = 0;
   _Ref_High(FL)
   _Ref_High(FR)
   _Ref_High(RL)
   _Ref_High(RR)

// нижний закритический порог от верхней Ref скорости
// используется в  ABS_Searching и  ABS_Phase3
#define   __ABS_dRef_Min   0x0280 //2,5km/h
#define   __Slip_100p      0x6400
#define   __Ref_Sleep      0x0510  //5%

 int32_t RefSpeed = ABS.RefHigh;
 uint16_t dRef = (RefSpeed * ABS.CFG.SlipExh)/__Slip_100p;//ABS.CFG.SlipOptim

   if(dRef < __ABS_dRef_Min)
	  dRef = __ABS_dRef_Min;
   RefSpeed -= dRef;
   if(RefSpeed > 0)
	    ABS.RefSpeed = RefSpeed;
   else ABS.RefSpeed = 0;

   // Not Used
   // ускорение через ABS_Base_Speed
   // разметность 1m/c^2 - 8Msb
   BaseAcc_Buf[0] = ABS.Base.Midl;
   Base_Accel = __K_BaseAccel * DeriVative_U16(BaseAcc_Buf, __BaseAcc_T);

// --------Утилита расчета замедления---------
#define   __Util_BrDec_Press    0x1400 //1atm
#define   __Util_SpHigh_55   0x3700 //55km/h
#define   __Util_SpHigh_45   0x2D00 //45km/h
#define   __Util_SpHigh_40   0x2800 //40km/h
#define   __Util_SpLow_15    0x0F00 //15km/h
#define   __Util_SpLow_20    0x1400 //20km/h
// размерность Dec 0,05m/c2 - 1msb
// Koef = 20/3,6*200
//#define   __Util_Dec_Koef  1111
// размерность Dec 0,005m/c2 - 1msb
#define   __Util_Dec_Koef  11110

   if(Util_Dec_55_15) //CFG
   {
	 ABS.Util.SpHigh = __Util_SpHigh_55;
     ABS.Util.SpLow = __Util_SpLow_15;
   }
   else
   {
//	 ABS.Util.SpHigh = __Util_SpHigh_40;
//     ABS.Util.SpLow = __Util_SpLow_20;
	 ABS.Util.SpHigh = __Util_SpHigh_45;
	 ABS.Util.SpLow = __Util_SpLow_15;
   }

   if(Brake.DemandValue < __Util_BrDec_Press ||
	  !ABS_Active)  // ??сделать без давления
	       ABS.Util.Phase = 0;

   switch (ABS.Util.Phase)
	{
     case 0:
    	   if(Speed_VX_est > ABS.Util.SpHigh)
    		   ABS.Util.Phase++;
   	       break;
	 case 1:
  	       if(Speed_VX_est < ABS.Util.SpHigh)
  		   {
  	    	 ABS.Util.Cnt = 0;
  	    	 ABS.Util.Phase++;
  		   }
	   	   break;
	 case 2:
	       ABS.Util.Cnt++;
		   if(Speed_VX_est < ABS.Util.SpLow)
	  	    	 ABS.Util.Phase++;
	   	   break;
	 case 3:
	       for (int8_t i = (Util_Buf_Size-1); i > 0; i--)
	       {  ABS.Util.Time[i] = ABS.Util.Time[i-1];
	    	  ABS.Util.Deccel[i] = ABS.Util.Deccel[i-1];
	       }
	       // размерность Time 0,05c - 1msb
	       if(ABS.Util.Cnt < 2550) //максимальное Time 12,75с
		   ABS.Util.Time[0] = ABS.Util.Cnt/10;
	       else ABS.Util.Time[0] = 0xFF;
		   ABS.Util.Deccel[0] = ((uint32_t)ABS.Util.SpHigh -
				                 (uint32_t)ABS.Util.SpLow) *
				                 (uint32_t)__Util_Dec_Koef /
				                 ABS.Util.Cnt;
		   ABS.Util.Phase = 0;
	   	   break;
	}
} // end ABS_Regulate()

void     Brake_Asist_Control(void)
{
// -------------   Brake Asist ----------------
#define   __Asist_SpeedON   0x2800  // 40km/h
#define   __Asist_SpeedOFF  0x1E00  // 30km/h
#define   __Asist_DeccelON  0x2800  // 5m/c2
#define   __Asist_DeccelOFF 0x1000  // 2m/c2
#define   __Asist_dPressOFF 0x1E00  // 1,5atm

    // признак деактивации
    uint8_t AsistOFF;
    int16_t Poff = (uint32_t)Brake.CFG.AsistP -
    		       (uint32_t)__Asist_dPressOFF;
    if(Speed_VX_est <__Asist_SpeedOFF ||
       Brake.DemandValue < Poff ||
	   Acc_X_est > -__Asist_DeccelOFF ||
       !ABS_Active)
    	 AsistOFF = 1;
    else AsistOFF = 0;

    // манина Brake Asist
	switch (Brake.Asist.Phase)
	{
	   case 0:
		   if(Brake_Asist_Enable &&  // CFG
			  Brake.DemandValue >
  	          Brake.CFG.AsistP &&    // давление > 5bar
			  ABS_Active &&		     // активно ABS
			  Speed_VX_est >__Asist_SpeedON && // скорость > 40km/h
			  Acc_X_est < -__Asist_DeccelON)   // замедление -5m/c2
		   { // активация
			 Brake_Asist_Active = 1;
			 XBR_Dif_Front = 1;
			 XBR_Dif_Rear = 1;
			 Brake.Asist.Time = 0;
			 Brake.Asist.Phase++;
		   }
		   break;
	   case 1:
		   if(Brake.Asist.Time < Brake.CFG.AsistT &&
		      !AsistOFF)
			  Brake.Asist.Time++;
		   else
		   { // деактивация
			 XBR_Dif_Front = 0;
			 XBR_Dif_Rear = 0;
			 Brake_Asist_Active = 0;
			 Brake.Asist.Phase++;
		   }
		   break;
	   case 2:
		   if(AsistOFF)
			 Brake.Asist.Phase = 0;
		   break;
	}
} // end Brake_Asist_Control()

//----------------- макрос ABS Switch ----------------------
#define _ABS_Switch(M) {						 	       \
  if(Wheel_##M.ABS.KL == __ABS_Ret_Cut) { ABS_EV_##M = 1;  \
                                          ABS_AV_##M = 0;} \
  if(Wheel_##M.ABS.KL == __ABS_Ret_Exh) { ABS_EV_##M = 1;  \
                                          ABS_AV_##M = 1;} \
  if(Wheel_##M.ABS.KL == __ABS_Ret_Pump){ ABS_EV_##M = 0;  \
                                          ABS_AV_##M = 0;} \
} //end macroc

void     ABS_Press_Control(void)
{
// вызывается в My_Tick каждые 1ms
#define   __ABS_Off_Delay  300 // 100

	if(ABS_Enable)  //CFG
	{
#ifdef   __AxisF_Compile
	  if(!Brake_Only_Front)
	  {
		ABS_IR(&Wheel_FL);
		ABS_IR(&Wheel_FR);
		ABS_MIR_Front();
	  }
	  else
	  { if(Brake.DemandValue > 0x0500)
	    { //ABS_Ph5_Set(&Wheel_FL);
	      //ABS_Ph5_Set(&Wheel_FR);
		  Wheel_FL.ABS.Phase = __ABS_Phase5;
		  Wheel_FL.ABS.KL = __ABS_Ret_Exh;
		  Wheel_FR.ABS.Phase = __ABS_Phase5;
		  Wheel_FR.ABS.KL = __ABS_Ret_Exh;
	    }
	    else
	    { Wheel_FL.ABS.Phase = __ABS_Phase0;
	      Wheel_FL.ABS.KL = __ABS_Ret_Pump;
	      Wheel_FR.ABS.Phase = __ABS_Phase0;
	      Wheel_FR.ABS.KL = __ABS_Ret_Pump;
	    }
	  }
	    if(Wheel_FL.ABS.Phase ||
		   Wheel_FR.ABS.Phase)
			 ABS_Front_Active = 1;
		else ABS_Front_Active = 0;
		// состояние клапанов модуляторов
		_ABS_Switch(FL)
		_ABS_Switch(FR)
#endif
#ifdef   __AxisR_Compile
	  if(!Brake_Only_Rear)
	  {
		if(!ASR_EngineActive || ABS_Front_Active)
		{ // перед не в ABS и ASR обходим ABS зада
		  ABS_IR(&Wheel_RL);
		  ABS_IR(&Wheel_RR);
		}
		ABS_MIR_Rear();
	  }
	  else
	  { if(Brake.DemandValue > 0x0500)
	    { //ABS_Ph5_Set(&Wheel_RL);
		  //ABS_Ph5_Set(&Wheel_RR);
		  Wheel_RL.ABS.Phase = __ABS_Phase5;
		  Wheel_RL.ABS.KL = __ABS_Ret_Exh;
		  Wheel_RR.ABS.Phase = __ABS_Phase5;
		  Wheel_RR.ABS.KL = __ABS_Ret_Exh;
	    }
	    else
	    { Wheel_RL.ABS.Phase = __ABS_Phase0;
		  Wheel_RL.ABS.KL = __ABS_Ret_Pump;
		  Wheel_RR.ABS.Phase = __ABS_Phase0;
		  Wheel_RR.ABS.KL = __ABS_Ret_Pump;
	    }
	  }
	  if(Wheel_RL.ABS.Phase ||
		 Wheel_RR.ABS.Phase)
		   ABS_Rear_Active = 1;
	  else ABS_Rear_Active = 0;
		// состояние клапанов модуляторов
		_ABS_Switch(RL)
		_ABS_Switch(RR)
#endif
	  // флаг активации ABS
	  if(ABS_Front_Active ||
		 ABS_Rear_Active)
	  {  ABS_Active = 1;
	     ABS.OffCnt = 0;
	  }
	  else
	  if(ABS_Active &&
		 ABS.OffCnt++ > __ABS_Off_Delay)
	  {	 ABS_Active = 0;
	     ABS.OffCnt = 0;
	  }
	}
	else
	{ // запрещено в конфигурации
	  ABS_KL_Status1 = 0;
	  ABS_KL_Status2 = 0;
	  ABS_Active = 0;
	}
} // end ABS_Press_Control()


uint8_t     ABS_Searching(WheelTypeDef* Wheelx)
{
//----------------------------------------
//  назначение бит регистра ABS.Flags
//----------------------------------------
/*
// фгаг Ref_End выход из фазы при малом Ref
//#define Ref_End   Wheelx->ABS.Flags.Bits.b0
// флаг Ph5_Stop синхронизация MIR
#define Ph5_Stop  Wheelx->ABS.Flags.Bits.b1
// фгаг High_Acc большого ускорения раскрутки
#define High_Acc  Wheelx->ABS.Flags.Bits.b2
// фгаг Lock_Flag блокировки колеса
#define Lock_Flag Wheelx->ABS.Flags.Bits.b3
// фгаг Mu_Split делить на части
//#define Mu_Split  Wheelx->ABS.Flags.Bits.b4
*/
//---------------- пороги активации --------------
// --------------- скорость входа ----------------
   uint16_t  SpOn = ABS.SpeedOFF; // скорость входа
   if(!Wheelx->ABS.Active) SpOn += __Speed_On_Thr; // ABS не активна

// ---------- проскальзывание входа --------------
   Wheelx->ABS.SlipThr = Wheelx->ABS.CFG.SlipOn;
// изменение порога
// на высоком Mu уменьшаем 20%
// на малых скоростях увеличиваем
#define   __SlipThr_Speed    0x1900 // 0x1000 //16km/h
#define   __SlipThr_K_Speed  200 //30

int16_t dSlThr = 0;
uint16_t dSlLim = Wheelx->ABS.CFG.SlipOn /2;

   if(ABS_SlipThr_Change)
   { if(Road.MuBr > __Road_Low_Mu)
     {   dSlThr = (__Road_Low_Mu - Road.MuBr) *
    			   ABS.CFG.K_Slip /256;
    	 if(dSlThr <  -dSlLim)
    	    dSlThr =  -dSlLim;
     }
     Wheelx->ABS.SlipThr += dSlThr; // уменьшаем
     if(Wheelx->Ref < __SlipThr_Speed)
     { 	 dSlThr = ((uint32_t)__SlipThr_Speed -
    			   (uint32_t)Wheelx->Ref) *
    			   __SlipThr_K_Speed /256;
         Wheelx->ABS.SlipThr += dSlThr; // увеличиваем
     }
   }
   // птичка ЗР3 Slip Optim
   if(ABS_Search_SlipOpt &&
      !Wheelx->ABS.Active &&
	   Wheelx->ABS.SlipThr < ABS.CFG.SlipOptim)
  	   Wheelx->ABS.SlipThr = ABS.CFG.SlipOptim;

   // упреждение для компенсации задержки модулятора
   // может вызывать стабатывание в 4 5 фазах
// 3,6*256/1000  *0x6400 /5
#define   __SlipThr_K_AccVx  4718   //922
#define   __SlipThr_dSl_Max  0x0480 //4,5%
   if(Wheelx->Accel < 0 &&
	  (!Wheelx->ABS.Phase ||
		Wheelx->ABS.Phase > __ABS_Phase4))
   { int32_t dS = -Wheelx->Accel * __SlipThr_K_AccVx *
		           Wheelx->DelExh;
     dSlThr = dS / (int32_t)Wheelx->Ref;
     if(dSlThr > __SlipThr_dSl_Max)
        dSlThr = __SlipThr_dSl_Max;  // ограничение
     Wheelx->ABS.Ph1.SlAcc = dSlThr;
     if(ABS_SlipDec_Change)
	   Wheelx->ABS.SlipThr -= dSlThr; //
   }
#define   __ABS_OffRoad_SlipK  100
   if(ABS_OffRoad)
      Wheelx->ABS.SlipThr += Wheelx->ABS.SlipThr *
	                         __ABS_OffRoad_SlipK /256;

   // проверка условий активации
   if(Wheelx->Ref > SpOn &&        // проверка скорости входа
	  Wheelx->Ref > Wheelx->Start &&
      Wheelx->Speed < Wheelx->ABS.SpThr && // порог активации
	  ((Wheelx->Slip > Wheelx->ABS.SlipThr &&
	    Wheelx->Accel < 0 &&
		Wheelx->Accel < - Wheelx->ABS.CFG.AccelOn)
	   ||
	   (!DYC_BrakeActive && // !ROP_BrakeActive &&
		Wheelx->Speed < ABS.RefSpeed &&
	    Road.MuBr < __Road_Low_Mu)))
   {
#define   __ABS_Ph1_Base_dSp    0x0100 //0x0140
	  Wheelx->ABS.Phase = __ABS_Phase1;
	  Wheelx->ABS.Active = 1;
	  Wheelx->ABS.Ph1.Speed= Wheelx->Speed;
	  Wheelx->ABS.Ph1.Base = Wheelx->Speed + __ABS_Ph1_Base_dSp;
	  Wheelx->ABS.Ph1.Slip = Wheelx->Slip;
	  Wheelx->ABS.Ph1.Decel= Wheelx->Accel;
	  Wheelx->ABS.Ph1.Press= Wheelx->Press;
	  Wheelx->ABS.Ph1.Accel = 0;
	  Wheelx->ABS.Ph1.CutCnt = 0;
	  Wheelx->ABS.Ph1.ExhCnt = 0;
	  Wheelx->ABS.Ph6.NumP = 0;
	  Wheelx->ABS.Tout = 0;
	  Wheelx->ABS.LockTout = 0;
	  Wheelx->ABS.Time = 0;
	  Wheelx->ABS.Flags.Byte = 0;      // сброс флагов
      Wheelx->ABS.KL =  __ABS_Ret_Exh; // выпуск
        return 1;
   }
   else return 0;

} // end ABS_Searching(Wheelx)


void     ABS_Base(WheelTypeDef* Wheelx)
{
#define   __dBase_Thr   0x0040  // 0,25km/h
#define   __dBase_Thr1  0x0140  // 1,25km/h

// 1m/c2	- 4,6
// раскрутка
#define   __dSp_AxPoz_Norm   15 // 3,25m/c2
#define   __dSp_AxPoz_Max    25 // 5,4m/c2
// торможение
#define   __dSp_AxNeg_Max    36 // 7,8 m/c2
#define   __dSp_AxNeg_Norm   18 // 3,9 m/c2
#define   __dSp_AxNeg_Min    5  // 1,08m/c2 7// 1,52m/c2

int32_t	dBase;
int16_t Acc = dSpAx;

// прижим Base к Speed
// нужно сильнее до ABS
// на большом замедлении

// !!!Bag!!  Base не становятся нулями
#define   __Wheel_Zero_Time   1000 //5c
#define   __Wheel_Zero_T1     40 //0,2c
	if(!_Hi_16(Wheelx->Speed))
	{ if(Wheelx->Test.Zero_Cnt < __Wheel_Zero_Time)
		 Wheelx->Test.Zero_Cnt++;
	}
	else
	{ if(All_Speed_Zero)
		 Wheelx->Test.Zero_Cnt = 0;
	  else
	  if(Wheelx->Test.Zero_Cnt)
		 Wheelx->Test.Zero_Cnt--;
	}

    dBase = (uint32_t)Wheelx->ABS.Base -
    		(uint32_t)Wheelx->Speed;
 	if(dBase > __dBase_Thr)
	{ // базовая скорость выше
	  if((Wheelx->ABS.Phase != __ABS_Phase1 && // в 1 и
	      Wheelx->ABS.Phase != __ABS_Phase3 && // 3 фазах нет коррекции
		  !Safe_Sp) )//||
	//	  All_Speed_Zero)                             //
	  {
		if(dBase > __dBase_Thr1)
		{ // базовая скорость выше больше 1,25km/h
		  if(Wheelx->ABS.Active)
			   Acc = -(__dSp_AxNeg_Max + dSpAx)/2;
		  else Acc = -__dSp_AxNeg_Max;

	      if(Wheelx->ABS.Phase == __ABS_Phase4 &&
	    	 Road.MuBr > ABS.CFG.High_Mu)
	    	   Acc = -__dSp_AxNeg_Max;
		}
		else
		{ // базовая скорость выше меньше 1,25km/h
		  if(Wheelx->ABS.Active ||
			 Road.MuBr < ABS.CFG.High_Mu)
			   Acc = -(__dSp_AxNeg_Norm + dSpAx)/2;
		  else Acc = -__dSp_AxNeg_Norm;
		}
/*

		{ // базовая скорость выше больше 1,25km/h
		  if(!Wheelx->ABS.Active ||                // нужно сильнее до ABS
		     (Wheelx->ABS.Phase == __ABS_Phase4 && // 4 фаза ABS и
	    	  Road.MuBr > ABS.CFG.High_Mu))        // большое замедление
			   Acc = -__dSp_AxNeg_Max;
		}
		else
		{ // базовая скорость выше меньше 1,25km/h
		  if(!Wheelx->ABS.Active)
			   Acc = -__dSp_AxNeg_Norm;
		}
*/
		if(Acc > dSpAx) //
		   Acc = dSpAx;
	  }
	  else
	  { // в 1 и 3 фазах нет коррекции
		Acc = dSpAx;
		if(Acc > -__dSp_AxNeg_Min)
		   Acc = -__dSp_AxNeg_Min;
	  }
	}
	else
	if(dBase < -__dBase_Thr)
	{ // базовая скорость ниже
	  if(dBase < -__dBase_Thr1 &&
			   !Safe_dT)
		   Acc = __dSp_AxPoz_Max;
	  else Acc = __dSp_AxPoz_Norm;
	  if(Acc < dSpAx)
		 Acc = dSpAx;
	}
	// базовая скорость
	dBase = Wheelx->ABS.Base + Acc;
	if(dBase < 0)
	   dBase = 0;  // минус обнуляем
	Wheelx->ABS.Base = dBase;
#ifndef   __ABS_Base_New
	// Ограничение по верху
	if(Wheelx->Speed > ABS.Base.Lim)
	{ if(Wheelx->ABS.Active)
	  {	// Wheelx->ABS.Base = ABS.Base.Midl;
	     BaseFail = 1;
	  }
	}
	else BaseFail = 0;
#endif
}// end ABS_Base(&Wheelx)

void  ABS_BreakCondition(WheelTypeDef* Wheelx)
{
//---------------Break Condition--------------
#define   __BC_Sleep     3278  // 5%
#define   __BC_SleepA    1966  // 3%
#define   __BC_SleepM    4587  // 7%
#define   __BC_Speed   0x2800  // 40km/h
#define   __BC_Grad    8	   // 1G  9	   // 1G

    int16_t BC;
    if(!Wheelx->ABS.Active)
    { 	 BC = (uint32_t)Wheelx->Ref *__BC_Sleep /65536;
      if(BC < __BC_Speed *__BC_Sleep /65536)
    	 BC = __BC_Speed *__BC_Sleep /65536;
    }
    else
    {	 BC = (uint32_t)Wheelx->Ref *__BC_SleepA /65536;
      if(BC < __BC_Speed *__BC_SleepA /65536)
  	     BC = __BC_Speed *__BC_SleepA /65536;
    }

    BC += ((uint32_t)Wheelx->Speed -
    	   (uint32_t)Wheelx->Ref);
    if(BC < 0)
       BC = 0;

    // ограничение максимума
    if(BC > __BC_Speed *__BC_SleepM/65536)
	   BC = __BC_Speed *__BC_SleepM/65536;

    // ограничение градиента уменьшения BC
    int16_t dBC = Wheelx->ABS.BcThr - BC;
    if(dBC > __BC_Grad)
       dBC = __BC_Grad;
    Wheelx->ABS.BcThr -= dBC;

} // ABS_BreakCondition(& Wheelx)

void  ABS_SpeedThresh(WheelTypeDef* Wheelx)
{  //-------определение порог активации-------
#define   __SpThr_Sleep   0xF333 // 5%
#define   __SpThr_SleepA  0xF999  // 2,5% 0xFC00  // 1,5%
#define   __SpThr_Speed   0x2800 // 40km/h
#define   __SpThr_SleepH  0xE666 // 10%
#define   __SpThr_Press   0x0500
#define   __Ts_Pump_T1    33
#define   __Ts_Pump_T2    49

    int16_t   Thr = Wheelx->ABS.Base;
    int16_t   dSp;

    if(Wheelx->ABS.Active)
    { // ABS активна
      if(ABS_SpThr_Enable)
      {
        Thr = Wheelx->ABS.Base *
       		 (uint32_t)__SpThr_SleepA /65536;
#ifdef   __AxisF_Compile
        {  // для переда
    	  Thr -=ABS.CFG.SpThr_Con_F;    // 1,25km/h
          dSp = ABS.CFG.SpThr_dPpump_F; // 1,3km/h
        }
#else
        {  // для зада
    	  Thr -=ABS.CFG.SpThr_Con_R;    // 1,0km/h
          dSp = ABS.CFG.SpThr_dPpump_R; // 0,6km/h
        }
#endif
        // добавка от подкачек
        if(Wheelx->ABS.Phase >= __ABS_Phase4 &&
     //      Wheelx->Press > __Ts_Pump_P &&
           Road.MuBr > __Road_Low_Mu &&
           Wheelx->ABS.Ph6.NumP < 3 &&
           Wheelx->ABS.Tout < __Ts_Pump_T2)
	    {
          if(Wheelx->ABS.Tout < __Ts_Pump_T1)
         	   Thr -= (Wheelx->ABS.Tout * dSp /__Ts_Pump_T1);
          else Thr -= dSp;
	    }
	    if(BC_actABS_Enable)
	      Thr -= Wheelx->ABS.BcThr;
      }
    }
    else
    { // ABS не активна
#ifdef   __AxisF_Compile
      Thr = Wheelx->ABS.Base * (uint32_t)__SpThr_Sleep /65536;  //5%
#else
      if(BC_AntiGAZ_Enable &&
		 Brake.DemandValue < __SpThr_Press)   // нет торможения для зада
    	   Thr = Wheelx->ABS.Base * (uint32_t)__SpThr_SleepH /65536; //10%
      else Thr = Wheelx->ABS.Base * (uint32_t)__SpThr_Sleep /65536;  //5%
#endif
	  if(BC_notABS_Enable) Thr -= Wheelx->ABS.BcThr; // птичкa
    }
    // обнуляем отрицательные значения
	if(Thr < 0)
	   Thr = 0;
	Wheelx->ABS.SpThr = Thr;

    // при ROP увеличиваем порог  ???? нужно ли
#define   __ROP_SpThr   0x0200 // 2km/h
	if(ROP_BrakeActive) // ROP регулирование тормозов активно
		Wheelx->ABS.SpThr -= (uint32_t)__ROP_SpThr;

} // end ABS_SpeedThresh(Wheelx)

// --------------колесо в блоке------------
uint8_t   ABS_Wheel_Lock(WheelTypeDef* Wheelx)
{
// Tout убрал
#define   __Lock_Speed        0x0100  //1km/h	 обязательно не ноль
#define   __Lock_TAI_Speed    0x0A00  //10km/h

    if(Wheelx->Speed < __Lock_Speed ||    // колесо в блоке
       !Wheelx->Capture.Speed ||
       (TAI_Flag &&           // переход
        Wheelx->Speed < __Lock_TAI_Speed))
	{   // обслуживание колесо в блоке
        Lock_Flag = 1;
		Wheelx->ABS.LockTout++;
        if(Wheelx->Ref > Wheelx->Start)
	    	 Wheelx->ABS.KL =  __ABS_Ret_Exh;  // выпуск
	    else Wheelx->ABS.KL =  __ABS_Ret_Cut;  // отсечкa
        return 1;
	}
	else
	{ Lock_Flag = 0;
      return 0;
	}
} // end ABS_Wheel_Lock(Wheelx)

// --------- фаза ожидания ABS_Event --------
void  ABS_Phase0(WheelTypeDef* Wheelx)
{
	// сброс флагов
	if(!ABS_Active && !ABS.OffCnt)
	{
	  TAI_Flag = 0;
	  Wheelx->ABS.TAI = 0;
	  First_Flag = 0;
	  Wheelx->ABS.Active = 0;
	}
	// состояние клапанов
	Wheelx->ABS.KL =  __ABS_Ret_Pump; // подкачка
	// проверка активации
	if(!Safe_dT &&
	   !Safe_Sp &&  // вход в ABS если нет Safe
	   !Wheelx->ABS.Failure) // и нет неисправностей
		ABS_Searching(Wheelx);

} // end ABS_Phase0(Wheelx);

// --------- фаза разблокирования --------
void  ABS_Phase1(WheelTypeDef* Wheelx)
{
	// время цикла ABS
	Wheelx->ABS.Time++;

	// порог выхода ABS.Ph1.Base
#define   __Ph1_Base_Dec    9       // 9,8 m/c2
#define   __Ph1_Koef_dSpAcc	7  // 5 //  для 30мс
	Wheelx->ABS.Ph1.Base -= __Ph1_Base_Dec;
	if(Wheelx->ABS.Ph1.Base < 0)
	   Wheelx->ABS.Ph1.Base = 0;

    // проверка условий выхода
#define   __Ph1_TimeOut     650     // 0.65c
	if(Wheelx->Speed >= Wheelx->ABS.Ph1.Base || // достигнут порог
	   (Lock_Flag &&                            // или блок колеса и
	   Wheelx->ABS.KL == __ABS_Ret_Cut) ||      // отсечкa при Ref < Start
	   Wheelx->ABS.Tout++ > __Ph1_TimeOut)      // выход по TimeOut
	{
		//---------------- фаза 1 завершена ------------------------
	    // максимальное ускорение раскрутки
		// при переходе TAI возможен дребезг
#define   __Ph1_TAITime     175     // 0.175c
		if(!TAI_Flag)
		    Wheelx->ABS.Ph3.Accel = Wheelx->ABS.Ph1.Accel;
		else
		{   Wheelx->ABS.Ph3.Accel = 0;
			// сброс флага TAI если быстро вышло < 0.175c
			if(Wheelx->ABS.Tout < __Ph1_TAITime)
			{  TAI_Flag = 0;
			   Wheelx->ABS.TAI = 0; // обязательно
			}
		}
		Wheelx->ABS.Phase = __ABS_Phase3;
		Wheelx->ABS.Tout = 0;
		Wheelx->ABS.LockTout = 0;
		Wheelx->ABS.KL =  __ABS_Ret_Cut; // отсечкa
	}
	else
	{
	  //---------------- выполнение фазы 1 -----------------------
	  // максимальное проскальзывание
	  if(Wheelx->Slip > 0 &&
		 Wheelx->Slip > Wheelx->ABS.Ph1.Slip)
		 Wheelx->ABS.Ph1.Slip = Wheelx->Slip;
	  // максимальное замедление
	  if(Wheelx->Accel < 0 &&
		 Wheelx->Accel < Wheelx->ABS.Ph1.Decel)
		 Wheelx->ABS.Ph1.Decel = Wheelx->Accel;
	  // максимальное ускорение
	  if(Wheelx->Accel > 0 &&
		 Wheelx->Accel > Wheelx->ABS.Ph1.Accel)
		 Wheelx->ABS.Ph1.Accel = Wheelx->Accel;
	  // фгаг High_Acc большого ускорения раскрутки
	  if(Wheelx->ABS.Ph1.Accel > // ускорение раскрутки больше 5G
         Wheelx->ABS.MaxAcc)
	       High_Acc = 1;
	  // минимальная скорость
	  if(Wheelx->Speed < Wheelx->ABS.Ph1.Speed)
	  {  Wheelx->ABS.Ph1.Speed = Wheelx->Speed;
		 // порог скорости раскрутки promotion
		 // минимальная скорость плюс порог
		 Wheelx->ABS.Ph3.Speed = (uint32_t)Wheelx->ABS.Ph1.Speed +
				                 (uint32_t)ABS.CFG.PromSp;
	  }

      // флаг перехода с высокого нa низкое сцепление
#define   __K_TAI          900	    // 3,6*1000/4
#define   __RefSpeed_TAI    0x2000  // 32km/h
#define   __WheelSpeed_TAI  0x1000  // 16km/h
#define   __Ph1_Decel_TAI   750     // 150m/c2 15,5G  1225    // 245m/c2 25G
#define   __Ph1_Slip_TAI    0x2600  // 38%            0x4000  // 64%


#ifdef   __AxisF_Compile
	  // только для переда
	  	  if(!TAI_Flag &&
		  Wheelx->Ref > __RefSpeed_TAI &&
		  Wheelx->Speed > __WheelSpeed_TAI &&
		  Wheelx->ABS.Ph1.Decel < -__Ph1_Decel_TAI &&
		  Wheelx->Slip > __Ph1_Slip_TAI)   // большое проскальзывание
      {  // есть переход асфальт лед
		 TAI_Flag = 1;
		 Wheelx->ABS.TAI = (uint32_t)__K_TAI * DSC_Car_Base /
		                              Speed_VX_est;
	  }
#endif
	  //-----------------exhaust shortening---------------------
// перевод ускорения X разметность 1m/c^2 - 8Msb // 2048/5
#define   __K_AccW_X       410
#define   __Ph1_Cut_T      24  //20mc
#define   __Ph1_Decel_Lim  100  // 2G

	  Wheelx->ABS.AccThr = 0;      // нет укорачивания
	  if(ExhShort_Enable &&        // разрещен в конфигурации
		 (Road.MuBr > __Road_Low_Mu ||
		  ExhShort_Ais))           // на льду
	  { // порог упреждения отсечки
	    if( Wheelx->ABS.Ph1.CutCnt < __Ph1_Cut_T && // не превышено время отсечки
		   !TAI_Flag &&          // нет перехода с высокого нa низкое
		    Wheelx->ABS.Time > Wheelx->ABS.CFG.T_ShExh) // время фазы больше 15mc
	    { // порог определяется переломом замедления колеса
	      int32_t  D = Wheelx->ABS.Ph1.Decel;
	      // ограничение замедления колеса
	      if(D < -__Ph1_Decel_Lim)
	    	 D = -__Ph1_Decel_Lim;
		  Wheelx->ABS.AccThr = D * Wheelx->ABS.CFG.K_ShExh / 256;
	    }
	    else // порог определяется замедлением авто
	    { Wheelx->ABS.AccThr = (int32_t)Acc_X_est * Wheel_FL.Inertia /
	                               Wheelx->Inertia /__K_AccW_X;
	    }
	  }

	  // ------------состояние клапанов---------------------
#define   __Ph1_TAI_Exh_T   110  // гарантированное время выпуска TAI
#define   __Ph1_dExh_T1     300
#define   __Ph1_dExh_T2     350
#define   __Ph1_dExh_Accel  100 //49     // 9,81m/c2 1G

	  if(!ABS_Wheel_Lock(Wheelx)) 	  // колесо не в блоке
	  {
	    if((Wheelx->Accel < 0 &&                  // колесо замедляется
		    Wheelx->Accel < Wheelx->ABS.AccThr)
	       ||
	       (Wheelx->Slip >
	        Wheelx->ABS.SlipThr &&   // большое проскальзывание
	    	((ABS_dExh1_Enable &&                  // разрешен CFG
	    	  Wheelx->ABS.Time > __Ph1_dExh_T1 &&  // доп. выпуск от времени фазы
	    	  Wheelx->ABS.Time < __Ph1_dExh_T2 &&  //
	    	  Wheelx->Accel < __Ph1_dExh_Accel)     //20m/c2 2G

#ifdef   __AxisF_Compile
	    	 ||
	    	 (ABS_ExhTAI_Enable &&
	    	  TAI_Flag &&                     // первые 100мс при переходе
	    	  Wheelx->Slip > __Ph1_Slip_TAI &&  // большое проскальзывание
	    	  Wheelx->ABS.Tout < __Ph1_TAI_Exh_T)
			 ||	// Prom Exh
	    	 (ABS_PromExh_Enable &&              // разрешен CFG
	    	  ABS_PromExh_Front &&           // CFG для переда
			   Road.MuBr < __Road_Low_Mu &&   // на льду
  		       Wheelx->Speed <              // доп. выпуск от слабой раскрутки
			   Wheelx->ABS.Ph3.Speed))))
#else
			 ||	// Prom Exh для зада всегда
	    	 (ABS_PromExh_Enable &&          // разрешен CFG
			  Road.MuBr < __Road_Low_Mu &&  // на льду
 		      Wheelx->Speed <              // доп. выпуск от слабой раскрутки
			   Wheelx->ABS.Ph3.Speed))))
#endif
	    {
	       Wheelx->ABS.KL =  __ABS_Ret_Exh;    // выпуск
	       Wheelx->ABS.Ph1.ExhCnt++;  // счетчик выпускa
	    }
	    else
	    {
		  Wheelx->ABS.KL =  __ABS_Ret_Cut;     // отсечкa
		  Wheelx->ABS.Ph1.CutCnt++;    // счетчик отсечки
	    }
	  }
	}
} // end ABS_Phase1(Wheelx);

void  ABS_Ph2_Set(WheelTypeDef* Wheelx)
{
    Wheelx->ABS.Phase = __ABS_Phase2;
    Wheelx->ABS.Tout = 0;
	Wheelx->ABS.Pdes = Wheelx->Press;
    // состояние клапанов
    Wheelx->ABS.KL =  __ABS_Ret_Cut; // отсечка

}  // end ABS_Ph2_Set(Wheelx);

//-------фаза отслеживания давления MIR -------
void  ABS_Phase2(WheelTypeDef* Wheelx)
{
#define   __Ph2_TimeOut     1050     // 1.05c

      if(!ABS_Searching(Wheelx))
      { // выполнение фазы 2
    	if(Wheelx->ABS.Tout++ > __Ph2_TimeOut)    // выход по TimeOut
    	{
      		Wheelx->ABS.Phase = __ABS_Phase0;
      		// состояние клапанов
      		Wheelx->ABS.KL =  __ABS_Ret_Pump; // подкачка
    	}
    	else
    	if(!ABS_Wheel_Lock(Wheelx)) 	  // колесо не в блоке
    	{
        // состояние клапанов
        if(Wheelx->Press > Wheelx->ABS.Pdes)
    	     Wheelx->ABS.KL =  __ABS_Ret_Exh; // выпуск
        else Wheelx->ABS.KL =  __ABS_Ret_Cut; // отсечка
    	}
      }
} // end ABS_Phase2(Wheelx);

void  ABS_Ph4_Set(WheelTypeDef* Wheelx)
{
// !!MAKE вопрос с корректировкой задатчика

    Wheelx->ABS.Phase = __ABS_Phase4;
    Wheelx->ABS.Tout = 0;
    Wheelx->PumpT = 0;
    Pump_Flag = 0;
    // состояние клапанов
    Wheelx->ABS.KL =  __ABS_Ret_Pump; // подкачка
}

void  ABS_Ph5_Set(WheelTypeDef* Wheelx)
{
	Wheelx->ABS.Phase = __ABS_Phase5;
	// не останавливаем счетчик Wheelx->ABS.Tout
	Wheelx->ABS.Pause = ABS.CFG.Pause;//__Pause_Time;
    // состояние клапанов
    Wheelx->ABS.KL =  __ABS_Ret_Cut; // отсечка
}

// приращение давления от ускорения раскрутки
// включает зависимость от инерции колеса
void  ABS_Ph4_dPa(WheelTypeDef* Wheelx)
{
    Wheelx->ABS.Ph4.dPa = (uint32_t)Wheelx->CFG.K_AcP4 *
			                     Wheelx->ABS.Ph3.Accel / 64 *
			   			         Wheelx->Inertia /
			   					 Wheel_FL.Inertia;
} // end ABS_Ph4_dPa(Wheelx);

//-------фаза раскрутки колеса -------
void  ABS_Phase3(WheelTypeDef* Wheelx)
{
#define   __Ph3_Base_dSp      0x01C0 // 1,75km/h
#define   __Ph3_Exh_T1        50
#define   __Ph3_Exh_T2        120
#define   __Ph3_TimeOut       1500    // 1.5c   800    // 0.8c
#define   __Ph3_Lock_Tout     250    // 0.25c
#define   __Ph3_Accel_Lim     50    // 1G

	// время цикла
	Wheelx->ABS.Time++;

    // проверка условий выхода
	if((Wheelx->Speed >= ABS.RefSpeed  &&     // скорость выше нижнего
	    (((Wheelx->Speed +__Ph3_Base_dSp) >  // закритического порога и
	       Wheelx->ABS.Base &&             // скорость выше порога и
		   Wheelx->Accel <                // ускорение меньше половины
		   Wheelx->ABS.AccThr) ||        // максимального раскрутки
#ifdef   __AxisF_Compile
		 (ABS_Ph3end_Slip  &&             // или для переда
		  Road.MuBr < ABS.CFG.High_Mu) ||   // на льду
		 ( ABS_Ph3end_Acc &&         // или разрешено в CFG и
		  !TAI_Flag &&              // нет перехода
		  High_Acc)	||             // ускорение раскрутки больше 5G
#endif
		 Wheelx->Slip < Wheelx->ABS.CFG.SlipOn)) // или мало проскальзывание
	   ||
	  	 (Lock_Flag &&                               // или блок колеса и
	    Wheelx->ABS.KL == __ABS_Ret_Cut)     // отсечкa при Ref < Start
	   ||
	   Wheelx->ABS.Tout++ > __Ph3_TimeOut) // выход по TimeOut
	{
	  //-------------- фаза 3 завершена --------------------------
      // определение задания первой подкачки
	  // зависимость подкачек от уровня давления
	  Wheelx->ABS.dP = Pump_dP(Wheelx);

	  // приращение давления
      // приращение  от CFG K_P ?????малая величина
	  Wheelx->ABS.dP += (Wheelx->ABS.dP *
			             Wheelx->CFG.K_dP4 /256);

	  // рекурсия
	  // только для переда ??
#ifdef   __AxisF_Compile
	  if(ABS_Ph4Rec_Enable &&    // CFG
		 !TAI_Flag)              // нет перехода
	  {  // приращение давления от рекурсии
		 Wheelx->ABS.Ph4.dPr = ((uint32_t)Wheelx->ABS.Ph1.Press -
		                        (uint32_t)Wheelx->Press) *
		                        ABS.CFG.Recursya /256;
	     // приращение давления от ускорения раскрутки
		 ABS_Ph4_dPa(Wheelx);
		 // общее приращение давления
		 Wheelx->ABS.Ph4.dP = Wheelx->ABS.Ph4.dPr +
				              Wheelx->ABS.Ph4.dPa;
		 // сравниваем с приращением  от CFG K_P
	     if(Wheelx->ABS.dP < Wheelx->ABS.Ph4.dP)
	        Wheelx->ABS.dP = Wheelx->ABS.Ph4.dP; // рекурсия больше
	     else
	       Wheelx->ABS.Ph4.dPr = 0; // рекурсия меньше
	  }
	  else Wheelx->ABS.Ph4.dPr = 0; // если не было рекурсии
#else

#endif

	  // заданиe первой подкачки
	  Wheelx->ABS.Pdes = Wheelx->Press +
			             Wheelx->ABS.dP;
	  // переход в 4 фазу
	  ABS_Ph4_Set(Wheelx);
	}
	else
    {
	  //------------- выполнение фазы 3------------------------
	  Wheelx->ABS.Pdes = Wheelx->Press;
	  // максимальное ускорение
	  if(Wheelx->Accel > 0 &&
	     Wheelx->Accel > Wheelx->ABS.Ph3.Accel)
	     Wheelx->ABS.Ph3.Accel = Wheelx->Accel;

	  // фгаг High_Acc большого ускорения раскрутки
	  if(Wheelx->ABS.Ph3.Accel > // ускорение раскрутки больше 5G
         Wheelx->ABS.MaxAcc)
	       High_Acc = 1;

	  // минимальная скорость
	  if(Wheelx->Speed < Wheelx->ABS.Ph1.Speed)
	  {  // скорость понизилась
		 Wheelx->ABS.Ph1.Speed = Wheelx->Speed;
		 // порог скорости раскрутки promotion
		 Wheelx->ABS.Ph3.Speed = (uint32_t)Wheelx->ABS.Ph1.Speed +
		 				         (uint32_t)Wheelx->ABS.ProM;
	  }

	  // порог ускорения выхода
	  int32_t  A = Wheelx->ABS.Ph3.Accel;
	  	      // ограничение замедления колеса
	  	      if(A > __Ph3_Accel_Lim)
	  	    	 A = __Ph3_Accel_Lim;
	  Wheelx->ABS.AccThr = A /2;

	  // состояние клапанов
	  if(!ABS_Wheel_Lock(Wheelx)) 	  // колесо не в блоке
	  {
	  if((Wheelx->ABS.Tout > __Ph3_Exh_T1 && //за 50mc должно достигнуть ускорения
		  Wheelx->ABS.Tout < __Ph3_Exh_T2 &&
		  Wheelx->Speed <
		  Wheelx->ABS.Ph3.Speed)  // скорость не достигла порога ?Slip
		 ||
		 (Wheelx->Slip > ABS.CFG.SlipExh &&
		  Wheelx->Accel < 0))              // большое проскальзывани и замедляется
	       Wheelx->ABS.KL =  __ABS_Ret_Exh; // выпуск
	  else Wheelx->ABS.KL =  __ABS_Ret_Cut; // отсечка
	  }
    }
} // end ABS_Phase3(Wheelx);

// --------фаза первой подкачки-------
void  ABS_Phase4(WheelTypeDef* Wheelx)
{
#define   __Ph4_TimeOut       70 // 0.07c
    if(!ABS_Searching(Wheelx))
    { // выполнение фазы 4
      First_Flag = 1;
   	  // максимальное ускорение
  	  if(Wheelx->Accel > 0 &&
  	     Wheelx->Accel > Wheelx->ABS.Ph3.Accel)
  	     Wheelx->ABS.Ph3.Accel = Wheelx->Accel;
      // приращение давления от ускорения раскрутки
 	  ABS_Ph4_dPa(Wheelx);
   	  // проверка завершения
 	  Wheelx->Ppump = Wheelx->ABS.Pdes + Wheelx->ABS.Ph4.dPa;
 	  if(Wheelx->ABS.Tout++ > __Ph4_TimeOut ||
 		 Check_Pump(Wheelx))
 	  { // фаза завершена
     	ABS_Ph5_Set(Wheelx);
 	  }
    }
} // end ABS_Phase4(Wheelx);

void  ABS_Pause(WheelTypeDef* Wheelx)
{
#define   __Pause_Max      140 //mc
#define   __Pause_Slip_Min 0x0380 //2%
	Wheelx->ABS.Pause = ABS.CFG.Pause;
	if(ABS_Ph5_PauseSlip &&
	   Wheelx->Ref > ABS.SpeedOFF &&
	   Wheelx->Slip >__Pause_Slip_Min)
	{  Wheelx->ABS.Pause += (uint32_t)ABS.CFG.Pause *
		                    (Wheelx->Slip - __Pause_Slip_Min)*
							ABS.CFG.Pause_SlipK /65536;
	   if(Wheelx->ABS.Pause > __Pause_Max)
	      Wheelx->ABS.Pause = __Pause_Max;
	}
}

void  ABS_Phase5(WheelTypeDef* Wheelx)
{
#define   __Ph5_TimeOut    150 //mc
// флаг Ph5_Stop синхронизация MIR ABS.Flags.Bits.b1

	Wheelx->ABS.Tout++; //??
	ABS_Pause(Wheelx);
    if(!ABS_Searching(Wheelx))
    { // выполнение фазы 5
      if((!Ph5_Stop && Wheelx->ABS.Tout > Wheelx->ABS.Pause) ||
          (Ph5_Stop && Wheelx->ABS.Tout > __Ph5_TimeOut))
  	  { // фаза завершена
  	    Wheelx->ABS.Phase = __ABS_Phase6;
  	    Wheelx->ABS.Tout = 0;
        Wheelx->PumpT = 0;
  	    Wheelx->ABS.Ph6.NumP = 0; // счетчик циклов подкачки
  	    // зависимость подкачек от уровня давления
  	    Wheelx->ABS.dP = Pump_dP(Wheelx);
  	    Wheelx->ABS.Ph6.dP = Wheelx->ABS.dP;
  	    // задание давления
  	    Wheelx->ABS.Pdes = Wheelx->Press + Wheelx->ABS.dP;
        // состояние клапанов
        Wheelx->ABS.KL =  __ABS_Ret_Pump; // подкачка
      }
    }
} // end ABS_Phase5(Wheelx);

void  ABS_Phase6(WheelTypeDef* Wheelx)
{
#define   __Ph6_TimeOut  45 // меньше __Pause_Time 55  // 0.0055c

    if(!ABS_Searching(Wheelx))
    { // выполнение фазы 6
   	  Wheelx->Ppump = Wheelx->ABS.Pdes;
   	  if(Wheelx->ABS.Tout++ > __Ph6_TimeOut ||
   		 Check_Pump(Wheelx))
  	  { // фаза завершена
  	    Wheelx->ABS.Phase = __ABS_Phase7;
  	    Wheelx->ABS.Ph6.NumP++;    // счетчик циклов подкачки
  	    Pump_Flag = 1;
  	    // не останавливаем счетчик Wheelx->ABS.Tout
// !!MAKE Время паузы увеличивается со счетчиком циклов
  	    Wheelx->ABS.Pause = ABS.CFG.Pause;
        // состояние клапанов
        Wheelx->ABS.KL =  __ABS_Ret_Cut; // отсечка
//    	Wheelx->PumpToss = Wheelx->PumpT;
      }
    }
} // end ABS_Phase6(Wheelx);

void  ABS_Phase7(WheelTypeDef* Wheelx)
{
#define   __Number_Pump       6
#define   __Ph7_TimeOut       95
#define   __Ph7_dPo_SlipK     205 //80%

#define   __Ph8_Speed    0x1B00 //27km/h
#define   __Ph8_NumP      3

	ABS_Pause(Wheelx);
    if(!ABS_Searching(Wheelx))
    { // выполнение фазы 7
      if(Wheelx->ABS.Tout++ > Wheelx->ABS.Pause)
  	  { // фаза завершена
  	    Wheelx->PumpT = 0;
  	    Wheelx->ABS.Tout = 0;
    	// счетчик циклов подкачки
    	if(Wheelx->ABS.Ph6.NumP < __Number_Pump)
    	{
#ifdef   __AxisF_Compile
    	 // Ph8 только для переда
    	  if(ABS_End_Tip2 &&				// CFG
    		 Road.MuBr > ABS.CFG.High_Mu && // на высоком сцеплении
     		 Wheelx->Ref <__Ph8_Speed &&    //скорость меньше 27km/h
			 Wheelx->Ref > ABS.SpeedOFF &&  // но больше V выхода
			 Wheelx->ABS.Ph6.NumP > __Ph8_NumP)
    	  {
    		  Wheelx->ABS.Pdes = Wheelx->Press -
    				             Wheelx->ABS.dP *__Ph8_NumP;
    		  Wheelx->ABS.Phase = __ABS_Phase8;
    	  }
    	  else Wheelx->ABS.Phase = __ABS_Phase6;
#else
    	  Wheelx->ABS.Phase = __ABS_Phase6;
#endif
    	}
    	else Wheelx->ABS.Phase = 0; // Цикл ABS завершен

  	    // -------------задание давления------------------
    	// New
    	// если проскальзывание приближается к опт. порогу то Po
    	Wheelx->ABS.dP = Wheelx->ABS.Ph6.dP;
    	if(Ph6_ddP_Enable &&
    	   Wheelx->Slip >
    	   Wheelx->ABS.CFG.SlipOn *__Ph7_dPo_SlipK /256)
    	{
	      // изменение с номером подкачки
	      Wheelx->ABS.Ph6.ddP = ((Wheelx->ABS.dP -
	    		                  Wheelx->dPmin) * ABS.CFG.K_NumP /1024) *
	    		                  Wheelx->ABS.Ph6.NumP;
	      // давлениe подкачки  N=1...3
	      // давлениe  подкачки N=4...6 не уменьшается
	      if(Wheelx->ABS.Ph6.NumP < (__Number_Pump-2) ||
	         Road.MuBr > ABS.CFG.High_Mu) // на высоком сцеплении все
	      {
	        if((Wheelx->ABS.Ph6.dP -
	    	    Wheelx->ABS.Ph6.ddP) >
	            Wheelx->dPmin)
	             Wheelx->ABS.dP -= Wheelx->ABS.Ph6.ddP;
	        else Wheelx->ABS.dP = Wheelx->dPmin;
	      }
    	}
	    //-----------------------------------------------
	    Wheelx->ABS.Pdes = Wheelx->Press + Wheelx->ABS.dP;
        // состояние клапанов
    	Wheelx->ABS.KL =  __ABS_Ret_Pump; // подкачка
      }
    }
} // end ABS_Phase7(Wheelx);

void  ABS_Phase8(WheelTypeDef* Wheelx)
{
#define   __Ph8_TimeOut       27 //20

    if(!ABS_Searching(Wheelx))
    { // выполнение фазы 8
      if(Wheelx->ABS.Tout++ >__Ph8_TimeOut ||
    	 Wheelx->Press < Wheelx->ABS.Pdes)
  	  { // фаза завершена
        ABS_Ph5_Set(Wheelx);
      }
      else
      { // состояние клапанов
    	Wheelx->ABS.KL =  __ABS_Ret_Exh; // выпуск
      }
    }
} // end ABS_Phase8(Wheelx);

void     ABS_IR(WheelTypeDef* Wheelx)
{
	// вызывается через 1mc
	// Break Condition
	ABS_BreakCondition(Wheelx);
    // определение порог активации
	ABS_SpeedThresh(Wheelx);

	// порог большого ускорения раскрутки High_Acc 50m/c2 5G
    Wheelx->ABS.MaxAcc = (uint32_t)ABS.CFG.MaxAcc *
    		                     Wheel_FL.Inertia /
						         Wheelx->Inertia;
	// порог скорости раскрутки promotion в CFG для зада
    // для переда меньше
    // NEW
    Wheelx->ABS.ProM = (uint32_t)ABS.CFG.PromSp;// *
//    		            Wheelx->Inertia / Wheel_RL.Inertia;
//    Wheelx->ABS.ProM = (uint32_t)ABS.CFG.PromSp;
//-------------- машина ABS ----------------------
#ifdef   __AxisF_Compile

    if(Wheelx->ABS.TAI)
       Wheelx->ABS.TAI--;
    else TAI_Flag = 0;


#endif
    if(Wheelx->ABS.Failure)
       Wheelx->ABS.Phase = __ABS_Phase0;
    switch (Wheelx->ABS.Phase)
	{
      case __ABS_Phase0: // фаза ожидания ABS_Event
		     ABS_Phase0(Wheelx);
    	   break;
	  case __ABS_Phase1: // фаза разблокирования
		     ABS_Phase1(Wheelx);
		   break;
	  case __ABS_Phase2: // фаза MIR
		     ABS_Phase2(Wheelx);
		   break;
	  case __ABS_Phase3: // фаза раскрутки колеса
		     ABS_Phase3(Wheelx);
		   break;
	  case __ABS_Phase4: // фаза первой подкачки
		     ABS_Phase4(Wheelx);
		   break;
	  case __ABS_Phase5: // фаза отсечки
		     ABS_Phase5(Wheelx);
		   break;
	  case __ABS_Phase6: // фаза Pump цикла подкачек
		     ABS_Phase6(Wheelx);
		   break;
	  case __ABS_Phase7: // фаза отсечки цикла подкачек
		     ABS_Phase7(Wheelx);
		   break;
	  case __ABS_Phase8: // фаза выпуска цикла Tip2
		     ABS_Phase8(Wheelx);
		   break;
	}
} // end ABS_IR(&Wheelx)

#ifdef   __AxisF_Compile
// ----------------- проверкa активации MIR -----------------------
uint8_t  ABS_MIRF_Searching(WheelTypeDef* WheelM, WheelTypeDef* WheelS)
{
#define   __MIRF_Press   0x3C00 // 3atm
    if(WheelM->Press <	__MIRF_Press &&
       WheelM->ABS.Phase == __ABS_Phase1 &&
	   WheelS->ABS.Phase != __ABS_Phase1 &&
	   WheelM->Speed < WheelS->Speed)
         return 1;
    else return 0;
}

// ----------------- фаза активации MIR ----------------------------
void  ABS_MIRF_Phase0(void)
{ // вызывается в ABS_MIR_Front каждые 1ms
	if((ABS_MIRF_Searching(&Wheel_FR, &Wheel_FL) &&
	    !MIR_Front.Dis_L) ||  // счетчики акивности ABS
	   MIR_Front_Req_L)
	{ // сильное левое колесо
	  MIR_Front.Phase = __MIR_PhaseL;
	  MIR_Front.dP0 = MIR_Front.CFG.dP0_L;
	  ABS_Ph2_Set(&Wheel_FL);
//	  if(MIR_Front_Req_L) Wheel_FR.ABS.First = 0;
	}
	else
	if((ABS_MIRF_Searching(&Wheel_FL, &Wheel_FR) &&
	    !MIR_Front.Dis_R) ||  // счетчики акивности ABS
	    MIR_Front_Req_R)
    { // сильное правое колесо
  	  MIR_Front.Phase = __MIR_PhaseR;
  	  MIR_Front.dP0 = MIR_Front.CFG.dP0_R;
  	  ABS_Ph2_Set(&Wheel_FR);
//  	  if(MIR_Front_Req_R) Wheel_FL.ABS.First = 0;
    }
    MIR_Front.Ph_Cnt = 0;
} // end ABS_MIRF_Phase0()

// ----------- фаза изменения давления сильного колеса-------------
void     ABS_MIRF_Phase1(WheelTypeDef* WheelM, WheelTypeDef* WheelS)
{ // вызывается в ABS_MIR_Front каждые 1ms
	// M сильное
	// S слабое
// ---------------------- вычисление dP ----------------------------
#define   __MIR_Time_1c    1000
// размерность Steering_Angle 1deg	 - 17,87 bit
#define   __MIR_Steer_1c   1608 //90grad
#define   __MIR_Steer_Max  2680 //150grad
#define   __MIR_Cut_Time   75 //75
#define   __MIR_Cut_T2     20 //40

	if(MIR_Front_Req)
		MIR_Front.Time = 0;

	MIR_Front.dP = MIR_Front.dP0 +
	    		   (uint32_t)MIR_Front.Time *
	               MIR_Front.CFG.KdP / 256;
    if(MIR_Front.dP > MIR_Front.CFG.dPmax)
	   MIR_Front.dP = MIR_Front.CFG.dPmax;
    MIR_Front.CutT = __MIR_Cut_Time;

	if((MIR_Front.Time < __MIR_Time_1c &&        // меньше 1с
	    (Steering_Angle > __MIR_Steer_1c ||      // руль больше 90град
		 Steering_Angle < -__MIR_Steer_1c ||
		 !WheelS->ABS.Flags.Bits.b5 ||	// First_Flag	на первом цикле ABS
		 (MIR_Front.CFG.dWz &&                   // CFG большая Delta_OmegaZ
		  (Delta_OmegaZ < -MIR_Front.CFG.dWz ||  // отрицательная Delta_OmegaZ
		   Delta_OmegaZ > MIR_Front.CFG.dWz))))  // положительная Delta_OmegaZ
		||
		(MIR_Front.Time > __MIR_Time_1c &&       // больше 1с
		 (Steering_Angle > __MIR_Steer_Max ||    // руль больше 150град
		  Steering_Angle < -__MIR_Steer_Max)))
	{ // не нормально уменьшаем dP
	    MIR_Front.dP /= 2;
	    MIR_Front.CutT = __MIR_Cut_T2;
	}

//------------------выполнение фазы MIR------------------------
#define   __MIRF_WS_dP    0x0200   // 0,1atm
#define   __MIRF_Moff_Vx  0x0300

	 uint16_t Pdes = WheelS->ABS.Pdes + MIR_Front.dP;
	 uint16_t Plow = Pdes - __MIRF_WS_dP;

	 if(WheelS->ABS.Phase > __ABS_Phase3 ||
	   !WheelS->ABS.Phase)
	 { // выполнение выхода
	   if(WheelM->ABS.Phase == __ABS_Phase1)
	    	 MIR_Front.Phase = 0;
	   if(WheelM->ABS.Phase == __ABS_Phase2 &&
	      (WheelS->Ref > (__MIRF_Moff_Vx) || // задержка выхода сильного из ABS
	  //    (WheelS->Ref > (ABS.SpeedOFF + 0x0100)|| // задержка выхода сильного из ABS
		   WheelM->Speed < __MIRF_Moff_Vx))         // чтобы не было разворота
	   { // отслеживаем давление сильного колеса
	     if(WheelM->Press < Plow ||
	        WheelS->ABS.Phase > __ABS_Phase5) // слабоe колесo перешло в Phase6
	     { // перевод сильное колесо в 4 фазу
	       // берем приращение dP слабого
	       WheelM->ABS.Pdes = WheelM->Press +
	    			          WheelS->ABS.dP;
	       ABS_Ph4_Set(WheelM);
	     }
	     else
	     if(WheelM->Press < Pdes && //Phigh
	        WheelM->Press > Plow)
	     { // перевод сильное колесо в 5 фазу
	       ABS_Ph5_Set(WheelM);
	       WheelM->ABS.Tout = 0;
	     }
	     // здесь останется в ABS_Phase2 будет выпуск
	   }
	 }
     else
     { // выполнение фазы слабое S - Ph1,Ph3
       // контролируем время
       MIR_Front.Ph_Cnt++;
       if(WheelM->ABS.Phase == __ABS_Phase2)
       { // сильное в фазе 2
         if(WheelS->ABS.Phase > __ABS_Phase1 ||    // слабое в 3 фазе
        	MIR_Front.CutT == __MIR_Cut_T2 ||      // большая Delta_OmegaZ
			MIR_Front_Req ||
        	((!MIRF_Exh_Tip2 ||
        	  MIR_Front.Time < __MIR_Time_1c) &&
        	 (MIR_Front.Ph_Cnt > MIR_Front.CutT ||
        	  WheelS->ABS.KL !=__ABS_Ret_Exh)))
    	      WheelM->ABS.Pdes = WheelS->Press + MIR_Front.dP; // выпуск
         else WheelM->ABS.Pdes = WheelM->Press;         // будет отсечка
       }
       else // сильное побывало в 1 фазе
       { if(WheelM->ABS.Phase >= __ABS_Phase3)
    	   ABS_Ph2_Set(WheelM);
       }
	 }
//-------------------------------------------------------------
	 // проверка выхода
     if((WheelM->ABS.Phase > __ABS_Phase3 &&
         WheelS->ABS.Phase > __ABS_Phase3) ||
    	(WheelM->ABS.Phase == __ABS_Phase1 &&
    	 WheelS->ABS.Phase == __ABS_Phase1))
     {  // оба в ABS_Phase4 выход
    	MIR_Front.Phase = 0;
       // MIR_Front.Ph_Cnt = 0;
     }
}  // end ABS_MIRF_Phase1

// ------ модификация ABS IR управляемой оси-------
void     ABS_MIR_Front(void)
{ // вызывается в ABS_Press_Control каждые 1ms
//-----------------модификация при DSC--------------------
    if(DSC_Front_Break)
	{
	   ABS_MIR_DSC(&Wheel_FL);
	   ABS_MIR_DSC(&Wheel_FR);
	}
	else // нет DSC
//-----------------модификация при ABS--------------------
	if(ABS_MIRF_Disable ||     // CFG
      Wheel_FL.State.Bits.b7 ||    // Неисправности
	  Wheel_FR.State.Bits.b7 ||
	   (!Wheel_FL.ABS.Phase && // нет Торможения
	    !Wheel_FR.ABS.Phase))
	{ // MIR ABS запрешен
	   MIR_Front.Phase = 0;
	   MIR_Front.Time  = 0;
	   MIR_Front.Dis_L = 0;
	   MIR_Front.Dis_R = 0;
	   MIR_Front_Flags = 0;
	}
	else
	{ // MIR разрешен
	  // счетчик времени торможeния
	  MIR_Front.Time++;

	  // Сброс флага Ph5_Stop синхронизация MIR
  	  if(Wheel_FL.ABS.Phase > __ABS_Phase5)
  		 Wheel_FR.ABS.Flags.Bits.b1 = 0;
  	  if(Wheel_FR.ABS.Phase > __ABS_Phase5)
  	     Wheel_FL.ABS.Flags.Bits.b1 = 0;

  	  // счетчики акивности ABS
  	  // для запрета MIR
#define   __MIR_Tnot      400 //0,4c
#define   __MIR_Ph1_Tnot   40
  	  if(Wheel_FL.ABS.Phase == __ABS_Phase1)
  	  { if(!MIRF_Always &&
  		   Wheel_FL.ABS.Tout > __MIR_Ph1_Tnot)
  		  MIR_Front.Dis_L = __MIR_Tnot;
  	  }
  	  else if(MIR_Front.Dis_L)
  		      MIR_Front.Dis_L--;

  	  if(Wheel_FR.ABS.Phase == __ABS_Phase1)
  	  { if(!MIRF_Always &&
  		   Wheel_FR.ABS.Tout > __MIR_Ph1_Tnot)
  		  MIR_Front.Dis_R = __MIR_Tnot;
  	  }
  	  else if(MIR_Front.Dis_R)
  		      MIR_Front.Dis_R--;

  	  // коеф. соотношения давлений
#define   __MIR_KdP_Norm   2048
#define   __MIR_Req_Time   30
  	uint32_t MIR_dP;
  	  if(Wheel_FL.Press > Wheel_FR.Press)
  	  {
  		MIR_dP = Wheel_FL.Press - Wheel_FR.Press;
  		MIR_Front.KdP_L = MIR_dP * __MIR_KdP_Norm /
  				          Wheel_FR.Press;
  		MIR_Front.KdP_R = 0;
  	  }
  	  else
  	  {
	    MIR_dP = Wheel_FR.Press - Wheel_FL.Press;
	    MIR_Front.KdP_R = MIR_dP * __MIR_KdP_Norm /
			              Wheel_FL.Press;
	    MIR_Front.KdP_L = 0;
  	  }
  	  if(ROP_notMIR) // CFG  Relation Press  K
  	  {
  	    if(MIR_Front.KdP_L > MIR_Front.CFG.ThrdP)
  	    {   MIR_Front.RegCnt = __MIR_Req_Time;
  	    	MIR_Front_Req_L = 1;
  	    }
  	    else MIR_Front_Req_L = 0;
  	    if(MIR_Front.KdP_R > MIR_Front.CFG.ThrdP)
  	    {   MIR_Front.RegCnt = __MIR_Req_Time;
  	    	MIR_Front_Req_R = 1;
  	    }
  	    else MIR_Front_Req_R = 0;
  	    if(MIR_Front.RegCnt)
  	    {  MIR_Front.RegCnt--;
  	       MIR_Front_Req = 1;
  	    }
  	    else MIR_Front_Req = 0;
   	  }

	  // ----------MIR_Selector----------------
	  switch (MIR_Front.Phase)
	  {
	    case __MIR_Phase0:
	    	ABS_MIRF_Phase0();
	    break;

	    case __MIR_PhaseL: // сильное левое колесо L слабое правое R
	    	      ABS_MIRF_Phase1(&Wheel_FL, &Wheel_FR);
	    break;

	    case __MIR_PhaseR: // сильное правое колесо R слабое правое L
	    	      ABS_MIRF_Phase1(&Wheel_FR, &Wheel_FL);
	    break;
	  }
	}
} // end ABS_MIR_Front()

#endif

// ------ модификация ABS IR при активном DSC-------
void     ABS_MIR_DSC(WheelTypeDef* Wheelx)
{
// порог скорости выхода
#define   __DSC_Sleep_Thr   0xC888  // 21,6%
	uint16_t SpThr = Wheelx->Ref * (uint32_t)__DSC_Sleep_Thr / 65536;

	// условия прекращения ABS цикла
	if((DYC_BrakeActive && 						// активен DYC
		(Wheelx->ABS.Phase > __ABS_Phase3 ||	// выход в 4 фазе
	    (Wheelx->ABS.Phase == __ABS_Phase3 &&	// или в 3 фазе
         Wheelx->Speed > SpThr)))  			    // если скорость выше порога
	   ||
	   (ROP_BrakeActive && 						// активен ROP
	    Wheelx->ABS.Phase >= __ABS_Phase3))     // выход в 3 фазе
	{
		Wheelx->ABS.Phase = 0;
	    // состояние клапанов
	    Wheelx->ABS.KL =  __ABS_Ret_Pump; // подкачка
	}
} // end ABS_MIR_DSC(WheelTypeDef* Wheelx)

#ifdef   __AxisR_Compile
void     ABS_MIRR_TAI (WheelTypeDef* WheelF, WheelTypeDef* WheelR)
{
#define   __TAI_Tout       500	//300
#define   __TAI_TnotPump   300 //150 //0,15c
#define   __TAI_Tevent     200 //100 //0,1c
#define   __K_TAI          900	    //3,6*1000/4

    // установка флага флаг перехода для зада
    if(WheelF->State.Bits.b4) // TAI_Flag
    { // есть флаг переда
      if(WheelF->ABS.TAI)
    	 WheelF->ABS.TAI--;
      else
      { // расчет времени перехода зада
    	  WheelF->ABS.TAI = (uint32_t)__K_TAI * DSC_Car_Base /
                             Speed_VX_est;
      }
      if(!WheelR->State.Bits.b4) // TAI_Flag
      { // нет флага зада
        if(WheelR->ABS.Phase > __ABS_Phase3 &&
           WheelR->Press > WheelF->Press &&
           WheelF->ABS.TAI < __TAI_TnotPump)
        {  // если подкачки за 150мс до момента перехода
           // переводим зад в __ABS_Phase2 с отсечкой
    	   ABS_Ph2_Set(WheelR);
        }
        // определение момента перехода
        if(WheelF->ABS.TAI < __TAI_Tevent)
        {  // 0,1c до момента перехода
    	   WheelR->State.Bits.b4 = 1; // TAI_Flag
    	   WheelR->ABS.TAI = __TAI_Tout;
    	   ABS_Ph2_Set(WheelR); // перевод  в __ABS_Phase2
    	   // будем задавать давление до переднего
    	   WheelR->ABS.Pdes = WheelF->Press;  // после Set
        }
      }
      else // есть флаг зада
      { // определение завершения
        if((!WheelF->ABS.TAI &&  // момент перехода
        	((WheelR->Speed + __Ph3_Base_dSp) >
              WheelR->ABS.Base ||               // скорость выше порога
            WheelR->Press < WheelR->ABS.Pdes))  // достигнуто давление
		   ||!WheelR->ABS.TAI--)                  // Tout
        { // выход через снятие флага переда!
    	  WheelF->State.Bits.b4 = 0;  // TAI_Flag флага переда
        }
        else
        { // зад может выйти из __ABS_Phase2
          // контролируем давление
          if(WheelR->Press > WheelR->ABS.Pdes)
        	 WheelR->ABS.KL =  __ABS_Ret_Exh; // выпуск
        }
      }
    }
    else
    { // нет флага переда
      // возможен сброс флага TAI в фазе 1
      if(WheelR->ABS.Phase == __ABS_Phase2 &&
    	 !MIR_Rear_Enable)
	  {  ABS_Ph5_Set(WheelR); // перевод зад в 5 фазу
	     WheelR->ABS.Tout = 0;
	  }
      WheelR->State.Bits.b4 = 0; // TAI_Flag
      WheelR->ABS.TAI = 0;
      WheelF->ABS.TAI = 0;
    }
} // end ABS_MIRR_TAI

void     ABS_MIRR_ABSF (WheelTypeDef* Wheelx)
{
// не активные задние переводим в 5 фазу ??????
// вопрос с корректировкой задатчика
// возможен вариант 4-1-4-1.....
  	if(!Wheelx->ABS.Active)
    {   Wheelx->ABS.Active = 1;
        Wheelx->ABS.Pdes = Wheelx->Press +
        		           Wheelx->ABS.CFG.Po;
  	    ABS_Ph5_Set(Wheelx); //  переход в 5 фазу
    }
} // end ABS_MIRR_ABSF

void     ABS_MIRR_ABSR (WheelTypeDef* Wheelx)
{
// активные задние переводим в 0 фазу
  	if(Wheelx->ABS.Active)
    {
  	  if(Wheelx->ABS.Phase >__ABS_Phase5)
  	  {
  		Wheelx->ABS.Active = 0;
  		Wheelx->ABS.Phase = __ABS_Phase0;
  		// состояние клапанов
  		Wheelx->ABS.KL =  __ABS_Ret_Pump; // подкачка
  	  }
    }
} // end ABS_MIRR_ABSF

void     ABS_MIRR_Phase0(void)
{
	if(MIR_Rear_Enable &&   //CFG
	   ABS_Rear_Active)
	{
	  if(Wheel_RL.ABS.Phase == __ABS_Phase1 &&
		 Wheel_RR.ABS.Phase >= __ABS_Phase3)
	  { // левое в фазе 1 правое перешло в фазу 3
		MIR_Rear_Active = 1;
		ABS_Ph2_Set(&Wheel_RR);        // перевод  в __ABS_Phase2
		MIR_Rear.Phase = __MIR_PhaseR;
	  }
	  if(Wheel_RR.ABS.Phase == __ABS_Phase1 &&
	     Wheel_RL.ABS.Phase >= __ABS_Phase3)
	  { // правое в фазе 1 левое перешло в фазу 3
	    MIR_Rear_Active = 1;
		ABS_Ph2_Set(&Wheel_RL);        // перевод  в __ABS_Phase2
		MIR_Rear.Phase = __MIR_PhaseL;
	  }
	}
	else MIR_Rear.Phase = __MIR_Phase0;
} // end ABS_MIRF_Phase0()

void     ABS_MIRR_Phase1(WheelTypeDef* WheelM, WheelTypeDef* WheelS)
{
	if(WheelM->ABS.Phase  == __ABS_Phase2)
	{
		if(WheelS->ABS.Phase  == __ABS_Phase4)
		{ // другое колесо перешло  в фазу 4
		  MIR_Rear_Active = 0;  // завершен
		  MIR_Rear.Phase = __MIR_Phase0;
		  ABS_Ph4_Set(WheelM);  // перевод  в __ABS_Phase4
		}
		else
		{ // отслеживание давления
#define   __MIRR_dP_Thr   0x0300 // 0,15atm
			if(WheelM->Press > (WheelS->Press +__MIRR_dP_Thr))
			   WheelM->ABS.Pdes = WheelS->Press;
		}
	}
} // end ABS_MIRF_Phase1()

// ------ модификация ABS IR ведущей оси------------------
void     ABS_MIR_Rear(void)
{
//-----------------модификация при DSC--------------------
	if(DSC_Rear_Break)
	{
		  ABS_MIR_DSC(&Wheel_RL);
		  ABS_MIR_DSC(&Wheel_RR);
	}
	else
//-----------------модификация при ABS--------------------
    if(ABS_Active)
    { // ------активно ABS переда--------------
      if(ABS_Front_Active)
      { // не активные задние переводим в 5 фазу
        if(!DYC_BrakeActive)
        { ABS_MIRR_ABSF (&Wheel_RL);
    	  ABS_MIRR_ABSF (&Wheel_RR);
        }
      }
      else
      { // не активные передние //???
        if(!MIR_Rear.Phase &&
           (EBL_Active ||                     //
            Brake.DemandValue < EBL.REG.Pdes)) //
    	{ // активные задние переводим в 0 фазу
//          ABS_MIRR_ABSR (&Wheel_RL);
//          ABS_MIRR_ABSR (&Wheel_RR);
    	}
      }
//--------модификация при переходе асфальт лед TAI -------

      ABS_MIRR_TAI(&Wheel_FL,&Wheel_RL);
      ABS_MIRR_TAI(&Wheel_FR,&Wheel_RR);

//--------------- псевдо регулятор EBL -------------------

//------- модификация при блокировке дифференциала -------
	  switch (MIR_Rear.Phase)
	  {
	    case __MIR_Phase0:
	    	ABS_MIRR_Phase0();
	    break;

	    case __MIR_PhaseL: // сильное левое колесо L слабое правое R
	    	ABS_MIRR_Phase1(&Wheel_RL, &Wheel_RR);
	    break;

	    case __MIR_PhaseR: // сильное правое колесо R слабое правое L
	    	ABS_MIRR_Phase1(&Wheel_RR, &Wheel_RL);
	    break;
	  }
    }
} // end ABS_MIR_Rear()
#endif

#ifdef   __HaltBrake_Compile
//********************************************************************
//                        Halt Brake
//********************************************************************
// Когда переключатель стопорного тормоза на приборной панели активирован,
// или, если этого требует блок управления дверью, команда
// «Активировать стояночный тормоз» передается

// Если команда стоп-тормоза деактивирована переключателем
// или через электронный блок двери, а затем
// педаль движения активирована
// команда «Стоп-тормоз» отменяется

// Halt brake mode
// EBC5_SPN2913 = __NotAvailable;
//000 Inactive
//001 Active
//010 Active, but not functioning properly. (This mode may be used to warn the driver)

void     Halt_Brake_Control (void)
{
#define   __HaltBrake_Inactive    0
#define   __HaltBrake_Active      1
#define   __HaltBrake_NotProperly 2
#define   __NotAvailable          7

#define   __Halt_SW_Delay    10
#define   __Halt_Auto_Delay  5
#define   __Halt_TimeOut         60   // 0,3c
// определение состояния трогания деактивации HaltBrake
#define   __HB_Torq_Thr           5    // 5%
#define   __HB_Taxo_Thr           400  // 50 rpm
#define   __HaltBrake_Press       0x3200  //2,5atm

	if(Halt_Brake_Enable)
	{ // зеркалим Halt brake switch SPN 2911
	  if(HaltSW_SPN2911 ==__BitsON) // Halt brake switch EBC1
		   HaltBrake_Switch = 1;
	  else HaltBrake_Switch = 0;

	  if(!Halt_SW_Activate)
	  { // проверка активации выключателем
		if(HaltBrake_Switch)
		{ if(Brake.Halt.CntSW <__Halt_SW_Delay)
			   Brake.Halt.CntSW++;
		  else
		  {  Halt_SW_Activate = 1;
		     Halt_SW_DeActivate = 0;
		  }
		}
		else
		{ if(Brake.Halt.CntSW)
			 Brake.Halt.CntSW--;
		}
	  }
	  else
	  { // проверка деактивации выключателем
		if(!HaltBrake_Switch)
		{ if(Brake.Halt.CntSW)
			 Brake.Halt.CntSW--;
		  else
		  {  Halt_SW_Activate = 0;
			 Halt_SW_DeActivate = 1;
		  }
		}
		else
		{ if(Brake.Halt.CntSW <__Halt_SW_Delay)
		     Brake.Halt.CntSW++;
		}
	  }

	  // диагностический тест
	  if(Dia_HaltBrake)
	  { SPN_1821 = 0; // door is open
	    Door_Fail = 0;// нет CANJ DC1
	  }
	  // определение состояния дверей
	  if(!SPN_1821)
		   DoorsIsOpen = 1; // двери открыты
	  else DoorsIsOpen = 0; // двери закрыты

	  // определение состояния коробки передач

	  // определение неисправностей блокирующих "HaltBrake"
	  if((MC_Error &__XBR_Fail_Mask) ||
		 Driver_Fail ||
		 Door_Fail)
		   Halt_Disable = 1;
	  else Halt_Disable = 0;

	  // проверка в автоматическом режиме
	  if(Halt_Brake_Auto) // разрешен в конфигурации
	  {
	    if(!Halt_Auto_Activate)
	    { // проверка активации Auto
	   	  if(!CAN_Engine.Driver && // отпущен газ
	   	     HHR_Vx_Stop &&        // стоит
			 !Halt_Disable &&
			 DoorsIsOpen)          // двери открыты
		  { if(Brake.Halt.CntAuto <__Halt_Auto_Delay)
			   Brake.Halt.CntAuto++;
		    else
			{  Halt_Auto_Activate = 1;
			   Halt_Auto_DeActivate = 0;
			   // порoги трогание без нажатия газа
			   Brake.Halt.Torque = CAN_Engine.Torque + __HB_Torq_Thr;
			   Brake.Halt.Taxo = CAN_Engine.Taxo - __HB_Taxo_Thr;
			}
		  }
		  else
		  { if(Brake.Halt.CntAuto)
			   Brake.Halt.CntAuto--;
		  }
	    }
	    else
	    { // определение состояние трогания
		  if(CAN_Engine.Driver || // нажат газ         трогание без нажатия газа
			 CAN_Engine.Torque > Brake.Halt.Torque || // возрос момент двигателя
			 CAN_Engine.Taxo < Brake.Halt.Taxo)       // упали обороты двигателя
			   WantToMove = 1;
		  else WantToMove = 0;
		  // проверка деактивации Auto
		  if((WantToMove ||         // происходит трогание
			  !Halt_Check_Gaz) &&   // или не отслеживается газ
			 !DoorsIsOpen)	        // двери закрыты
		  { if(Brake.Halt.CntAuto)
			   Brake.Halt.CntAuto--;
		    else
			{  Halt_Auto_Activate = 0;
			   Halt_Auto_DeActivate = 1;
			}
		  }
		  else
		  { if(Brake.Halt.CntAuto <__Halt_Auto_Delay)
			Brake.Halt.CntAuto++;
		  }
	    }
	  }

	  // определение активности HaltBrake
	  if(HaltBrake_Active)
	  { // активен
		if(Halt_SW_DeActivate ||
		   Halt_Auto_DeActivate)
	    { // выключение
		  XBR_Dif_Front = 0;
		  XBR_Dif_Rear = 0;
		  // ждем снижения давления
		  if(!XBR_KL_Status1 ||
		     Brake.Halt.Tout++ > __Halt_TimeOut)
		  { HaltBrake_Active = 0;
	        EBC5_SPN2913 = __HaltBrake_Inactive;
		  }
	    }
	    else EBC5_SPN2913 = __HaltBrake_Active;
	  }
  	  else
  	  { // не активен
  		if(Halt_SW_Activate ||
  		   Halt_Auto_Activate)
  	    { HaltBrake_Active = 1;
  	      XBR_Dif_Front = 1;
  	      XBR_Dif_Rear = 1;
  	      XBR_KL_Status1 = 0;
  	      Brake.Halt.Tout = 0;
  	      // задание давления
  	      Brake.Halt.Pdes = __HaltBrake_Press;
  		  EBC5_SPN2913 = __HaltBrake_Active;
  	    }
  	    else EBC5_SPN2913 = __HaltBrake_Inactive;
  	  }
	}
	else // нет в конфигурации
	{ EBC5_SPN2913 = __NotAvailable;
	  HaltBrake_Switch = 0;
	}
	// EBC5_Status1
	// Brake Temperature Warning
	EBC5_SPN3839 = __BitsNot;//__Inactive; //The temperature warning Not Active

} // end Halt_Brake_Control()
#endif

// установка заданного давления
void      Set_Press_Desired (uint16_t Pdes)
{
#define   __HaltBrake_DifPress_Off 0x1200  //0,9atm
	  if(XBR_Dif_Front)
	  { if(Wheel_FL.Press > Pdes) XBR_EV_FL = 1;
	    if(Wheel_FR.Press > Pdes) XBR_EV_FR = 1;
	  }
	  else
	  { if(FrontDif.Press > __HaltBrake_DifPress_Off)
           XBR_KL_Status1 |=_XBR_Front_Exh;
	    else XBR_KL_Status1 &=~_XBR_Front_Exh;
	  }
	  if(XBR_Dif_Rear)
	  { if(Wheel_RL.Press > Pdes) XBR_EV_RL = 1;
	    if(Wheel_RR.Press > Pdes) XBR_EV_RR = 1;
	  }
	  else
	  { if(RearDif.Press > __HaltBrake_DifPress_Off)
           XBR_KL_Status1 |=_XBR_Rear_Exh;
	    else XBR_KL_Status1 &=~_XBR_Rear_Exh;
	  }
} // end Set_Press_Desired (Pdes)

//----------------- макрос XBR Switch ----------------------
#define _XBR_Switch(M) {						 	       \
  if(XBR.Brake.REG_##M.KL == __KL_Ret_Cut) { XBR_EV_##M = 1;  \
  	  	  	  	  	  	  	  	  	  	     XBR_AV_##M = 0;} \
  if(XBR.Brake.REG_##M.KL == __KL_Ret_Exh) { XBR_EV_##M = 1;  \
                                             XBR_AV_##M = 1;} \
  if(XBR.Brake.REG_##M.KL == __KL_Ret_Pump){ XBR_EV_##M = 0;  \
                                             XBR_AV_##M = 0;} \
} //end macroc

void     XBR_Press_Control(void)
{ // вызывается в My_Tick каждые 1ms
  // управление давлением Halt_Brake
	if(HaltBrake_Active)
	{ // установка заданного давления
	  Set_Press_Desired(Brake.Halt.Pdes);
	}
	else
    if(HillHolder_Active)
    { // установка заданного давления
  	  Set_Press_Desired(Brake.HillHold.Pdes);
    }
    else
    if(XBR_System_Active)
    {
#define   __AccDes_Brake_Off    0x0600 //0,1m/c2
#define   __Pdes_Brake_Off      0x0A00 //0,5bar
#define   __XBR_Ph1_Tmin        50
#define   __XBR_DifPressOff     0x1400 //1 bar

#ifdef   __AxisF_Compile
      // ------- XDR передней оси ----------------
      if((XBR.AccDes > -__AccDes_Brake_Off ||
    	  XBR_Abort) &&
  //  	 XBR.Brake.Front.Pdes < __Pdes_Brake_Off &&
		 (XBR.Brake.Front.Phase == 1 ||
		  XBR.Brake.Front.Phase == 2))
    	  XBR.Brake.Front.Phase = 3; // выключение

      switch (XBR.Brake.Front.Phase) //
      { case 0:
    	   if(Brake_Request)
    	   { XBR_Dif_Front = 1;  // состояние клапанов
    	     XBR_KL_Status1 &= ~_XBR_Front_Exh;
    	     XBR.Brake.Front.Phase++;
    	     XBR.Brake.Front.Time = 0;
    	   }
		   break;
        case 1:    // установка заданного давления
           XBR.Brake.Front.Time++;
           if((XBR.Brake.Front.Time > __XBR_Ph1_Tmin) &&
        	  (XBR.Brake.REG_FL.Pdes < Wheel_FL.Press) &&
        	  (XBR.Brake.REG_FR.Pdes < Wheel_FR.Press))
        	   XBR.Brake.Front.Phase++;  // фаза завершена
      	   break;
        case 2:   // отсллеживание заданного давления
           Press_Control( &Wheel_FL, &(XBR.Brake.REG_FL));
           _XBR_Switch(FL)
           Press_Control( &Wheel_FR, &(XBR.Brake.REG_FR));
           _XBR_Switch(FR)
      	   break;
        case 3: // выключение XBR торможения
           XBR.AccDemand = 0;
           XBR_Dif_Front = 0;         // выключение Dif_Front
           XBR_KL_Status1 |= _XBR_Front_Exh; // выпуск
           if(FrontDif.Press < __XBR_DifPressOff)
           { // // выключение XBR
        	 XBR_Flags = 0;
        	 XBR_Disable = 1;
             XBR.Brake.Front.Phase = 0;
           }
      	   break;
      }
#endif
      //---------------- XBR задней оси ---------------------
#ifdef   __AxisR_Compile
      if((XBR.AccDes > -__AccDes_Brake_Off ||
          XBR_Abort) &&
		 (XBR.Brake.Rear.Phase == 1 ||
		  XBR.Brake.Rear.Phase == 2))
    	  XBR.Brake.Rear.Phase = 3; // выключение

      switch (XBR.Brake.Rear.Phase) //
      { case 0:
    	   if(Brake_Request)
    	   { XBR_Dif_Rear = 1;   // состояние клапанов
    	     XBR_KL_Status1 &= ~_XBR_Rear_Exh;
    	     XBR.Brake.Rear.Phase++;
    	     XBR.Brake.Rear.Time = 0;
    	   }
		   break;
        case 1:    // установка заданного давления
           XBR.Brake.Rear.Time++;
           if((XBR.Brake.Rear.Time > __XBR_Ph1_Tmin) &&
         	  (XBR.Brake.REG_RL.Pdes < Wheel_RL.Press) &&
         	  (XBR.Brake.REG_RR.Pdes < Wheel_RR.Press))
         	   XBR.Brake.Rear.Phase++;  // фаза завершена
      	   break;
        case 2:    // отсллеживание заданного давления
           Press_Control( &Wheel_RL, &(XBR.Brake.REG_RL));
           _XBR_Switch(RL)
           Press_Control( &Wheel_RR, &(XBR.Brake.REG_RR));
           _XBR_Switch(RR)
      	   break;
        case 3: // выключение XBR торможения
            XBR.AccDemand = 0;
            XBR_Dif_Rear = 0;                // выключение Dif
            XBR_KL_Status1 |= _XBR_Rear_Exh; // выпуск
            if(RearDif.Press < __XBR_DifPressOff)
            { // // выключение XBR
         	  XBR_Flags = 0;
         	  XBR_Disable = 1;
              XBR.Brake.Rear.Phase = 0;
            }
          break;
      }
#endif
    }
    else
    if(Brake_Asist_Active)
    {

    }
    else
    { XBR_KL_Status1 = 0;
      XBR_KL_Status2 = 0;
    }
} // end XBR_Press_Control()

#ifdef   __XBR_Compile
//********************************************************************
//                 eXternal Brake Request (XBR)
//********************************************************************
//  eXternal Brake Request (XBR) система внешнего запроса на торможение
//  associated to the vehicle Collision Mitigation System (CMS)
//  связанное с системой предотвращения столкновений автомобиля (CMS)

void     XBR_Control (void)
{
#define   __XBR_NotAvailable   0xF
//-------------------- принимаемые SPN---------------------------------
/*SPN 2914 XBR EBI Mode (Endurance Brake Integration)
использование тормоза длительного действия, такие как ретардеры или моторные тормоза
00 - Интеграция тормоза Endurance Brake запрещена
Требуемое ускорение должно быть реализовано только основных тормозов.
01 - Разрешены только ретардеры или моторные тормоза.
Запрещается использовать сам фундаментный тормоз.
10 - Разрешена интеграция тормоза Endurance Brake
Требуемое ускорение может быть реализовано с помощью основных тормозов
и/или путем запроса ретардеры или моторные тормоза.

SPN 2915 XBR Priority управления приоритетом перекрытия внешних и внутренних тормозов.
00 — Высший приоритет — используется для экстренных ситуаций,
для системы предотвращения столкновений.
Этот режим отменяет любые меры по защите тормозов тормозной системы.
10 - Средний приоритет – используется для систем ACC.
Этот режим не отменяет мер защиты тормоза
11 — Низкий приоритет — используется в режиме «отменa отключенa».

SPN 2916 XBR Control Mode определяет, как внешний запрос на ускорение должен выполняться.
00 — отменa — отключить любой существующий элемент управления
01 - Добавьте требование ускорения XBR к требованию ускорения водителя.
10 - Выполнить требование ускорения XBR, если оно выше, чем у водителя

SPN 4099 XBR urgency
Resolution: 0.4 %/bit, 0 offset
0% - Ситуация не критическая; допустима низкая динамика ретардера.
Активация фундаментных тормозов через некоторое время, если замедлитель
производительность недостаточна
y % — более быстрое срабатывание основных тормозов для компенсации работы тормоза-замедлителя,
линейная интерполяция от 0 до 100 %.
100% - Низкая динамика замедлителя должна быть полностью компенсирована фундаментными тормозами
*/
	// обрабатываем принимаемые SPN
	if(!CAN_XBR_Fail &&
	   XBR_EBI_SPN2914 != __BitsNot)
	{
	  // SPN 2914 XBR EBI Mode (Endurance Brake Integration)
	  if(!XBR_EBI_SPN2914)
	  {   Brake_Enable = 1; // только тормоза
		  Retarder_Enable = 0;
	  }
	  else
	  if(XBR_EBI_SPN2914 == __BitsON)
	  {   Brake_Enable = 0;    // тормоза запрешены
		  Retarder_Enable = 1; // только ретардеры
	  }
	  else // все разрешено
	  {   Brake_Enable = 1;
	      Retarder_Enable = 1;
	  }
	  // SPN 2916 XBR Control Mode
	  if(!XBR_Mode_SPN2916 ||
		  XBR_Mode_SPN2916 ==__BitsNot)
	  {	  XBR_Abort = 1;
	      Accel_ADD = 0;
	      Accel_MAX = 0;
	  }
	  else
	  {  XBR_Abort = 0;
	     if(XBR_Mode_SPN2916  == __BitsON)
	     {  Accel_ADD = 1; // Выполняется режим добавления
	        Accel_MAX = 0;
	     }
	     else
	     {  Accel_ADD = 0;
	        Accel_MAX = 1; // Выполняется максимальный режим
	     }
	  }
	  // обработка неисправносте  блокирующих XBR
	  if(!Dia_HBR &&
		 ((MC_Error &__XBR_Fail_Mask) ||
		  s_AGS_Error))
	       XBR_Disable = 1;
	  else XBR_Disable = 0;
	}
	else
	{ if(!XBR_System_Active)
	{	XBR_Flags = 0;
		XBR_Disable = 1;
		XBR_Mode = 0xFF;
	  }
	  else XBR_Abort = 1;
	}
	// масса автомобиля
	XBR.REG.Mass = Load.Truck.Front_Fz +
			       Load.Truck.Rear_Fz;
	// коэффициент учета регулятора EBL
	XBR.Kload =((uint32_t)65536 + (uint32_t)EBL.REG.Koef) / 512;
	// определение замедления через давление водителя
	XBR.AccPress = -(Brake.DemandValue * (uint32_t)Load.CFG.K_Pr /
			         XBR.REG.Mass / 2);
	if(XBR.AccPress < -_CAN_int16_Offset) //0x7D7F
	   XBR.AccPress = -_CAN_int16_Offset;
	// определение заданного замедления
	if(Accel_ADD)
		XBR.AccDes = XBR.AccPress + XBR.AccDemand;
	else
	{ if(XBR.AccDemand < XBR.AccPress)
		   XBR.AccDes = XBR.AccDemand;// замедлениe XBR
	  else XBR.AccDes = XBR.AccPress; // замедлениe водителя
	}
	// определение ограничения замедления
    // сделать температуру тормозов
#define   __XBR_AccLim_Default    0x1400 //2,5m/c2
#define   __XBR_AccLim_Emergency  0x3000 // 6m/c2
	if(!XBR_Prior_SPN2915)
	{ // Высший приоритет для экстренных ситуаций
	  if(XBR.AccDemand < -__XBR_AccLim_Emergency)
		    XBR.AccLim = -__XBR_AccLim_Emergency;
	  else
	  { if(XBR.AccDemand > -_CAN_int16_Offset)
		     XBR.AccLim = XBR.AccDemand;
	    else XBR.AccLim = -_CAN_int16_Offset;
	  }
	}
	else   XBR.AccLim = -__XBR_AccLim_Default;
	// EBC5.HBR_AccLim
// Resolution:  0.1 m/s² per bit, -12.5 m/s² offset
// k = 256 * 12,5 /15,687
#define   __Koef_SPN2921   204
	XBR.AccLim_SPN2921 = XBR.AccLim /__Koef_SPN2921 +
			             _CAN_int8_Offset;

	// ---------- регулятор задания давления ----------------
	// входное давление
#define   __XBR_Pin_Max   0x8C00  // 7,0atm
//	K_Pr в два раза меньшше
	if(!XBR_Disable &&
	   Brake_Request)
	{	 XBR.REG.Pin = (-XBR.AccDes) * (uint32_t)XBR.REG.Mass / 2 / // * 2 /
		                Load.CFG.K_Pr;
	  if(XBR.REG.Pin > __XBR_Pin_Max)
	     XBR.REG.Pin = __XBR_Pin_Max;
	}
	else XBR.REG.Pin = 0;

	//коеффициет зависящий от Urgency SPN4099
#define   __Urgency_Min   10
#define   __Koef_KdP    15 //  10
	uint8_t    U = XBR.Urgency;
	if(U < __Urgency_Min)
	   U = __Urgency_Min;
	XBR.REG.KdP = U * __Koef_KdP;
	//интегрирование
	XBR.REG.Pout = XBR.REG.Pint /256;
	int32_t   dP = XBR.REG.Pin - XBR.REG.Pout;
	XBR.REG.Pint += (dP * XBR.REG.KdP /256);
	if(XBR.REG.Pint < 0)
	   XBR.REG.Pint = 0;
	XBR.Brake.Front.Pdes = XBR.REG.Pout;
	XBR.Brake.Rear.Pdes = XBR.REG.Pout * EBL.REG.Koef / 65536;
#ifdef   __AxisF_Compile
	// Задание давления
    XBR.Brake.REG_FL.Pdes =	XBR.Brake.Front.Pdes;
    XBR.Brake.REG_FR.Pdes =	XBR.Brake.Front.Pdes;
    // параметры слежения берем как у EBL
    XBR.Brake.REG_FL.dPpump = EBL.CFG.dPump; // dPump подкачки
    XBR.Brake.REG_FL.CutT = ROP.CFG.Tcut;
    XBR.Brake.REG_FL.TrP = EBL.CFG.dP;       // TrP зона слежения
    XBR.Brake.REG_FR.dPpump = XBR.Brake.REG_FL.dPpump;
    XBR.Brake.REG_FR.CutT = XBR.Brake.REG_FL.CutT;
    XBR.Brake.REG_FR.TrP = XBR.Brake.REG_FL.TrP;
#else
	// Задание давления
    XBR.Brake.REG_RL.Pdes =	XBR.Brake.Rear.Pdes;
    XBR.Brake.REG_RR.Pdes =	XBR.Brake.Rear.Pdes;
    // параметры слежения берем как у EBL
    XBR.Brake.REG_RL.dPpump = EBL.CFG.dPump; // dPump подкачки
    XBR.Brake.REG_RL.CutT = ROP.CFG.Tcut;
    XBR.Brake.REG_RL.TrP = EBL.CFG.dP;       // TrP зона слежения
    XBR.Brake.REG_RR.dPpump = XBR.Brake.REG_RL.dPpump;
    XBR.Brake.REG_RR.CutT = XBR.Brake.REG_RL.CutT;
    XBR.Brake.REG_RR.TrP = XBR.Brake.REG_RL.TrP;
#endif
//-----------------------------------------------------------
	// запросы
#define   __AccDes_Brake_ON    0x0600 //0,75m/c2
#define   __AccDes_Retarder_ON 0x0200 //0,25m/c2
	// запрос торможение
	if(!XBR_Disable &&
	   Brake_Enable &&
	   XBR.AccDes < -__AccDes_Brake_ON)
		 Brake_Request = 1;
//    else Brake_Request = 0;
	// запрос ретардерам
	if(!XBR_Disable &&
	   Retarder_Enable &&
	   XBR.AccDes < -__AccDes_Retarder_ON)
		 Retarder_Request = 1;
    else Retarder_Request = 0;
	//
	if(XBR_Enable) // CFG
	{ // разрешен в конфигурации
	  if(Brake_Request ||
		 Retarder_Request)
		   XBR_System_Active = 1;
	  else XBR_System_Active = 0;
/*
-------------------- передаваемые SPN---------------------------------
SPN 2917 XBR System State
00 - Любой внешний запрос на торможение будет принят (тормозная система полностью исправна)
01 - Будет принят только внешний запрос на торможение с наивысшим приоритетом XBR (00)
(например, превышен предел температуры тормоза)
10 - Внешний запрос на торможение не принимается
(например, из-за неисправности тормозной системы)

SPN 2918 XBR Active Control Mode
0000 Запрос на торможение не выполняется (режим по умолчанию)
0001 Запрос на торможение со стороны водителя выполняется,
     внешний запрос на торможение отсутствует
0010 Выполняется режим добавления управления ускорением XBR
0011 Выполняется максимальный режим управления ускорением XBR

SPN 2919 Foundation Brake Use используют в настоящее время основные тормоза.
00 Фундаментальные тормоза не используются
01 Фундаментные тормоза используются
*/
	  // передаваемые SPN EBC5_Status2 XBR
      if(XBR_Disable)
	       EBC5_SPN2917 = __BitsErr; // неисправности тормозной системы
      else EBC5_SPN2917 = 0; //Любой внешний запрос на торможение будет принят
// превышен предел температуры тормоза Not Used
#define   __BrakeDemand_Pon   0x0A00 // 0,5atm
#define   __HBR_DifPress_Off  0x1200  //0,9atm
      if((Brake.DemandValue > __BrakeDemand_Pon ||  // нажат тормоз
    	  FrontDif.Press > __HBR_DifPress_Off ||    // ESP
		  RearDif.Press > __HBR_DifPress_Off        // ASR
          ) &&
         !Brake_Request) 		 // и нет запроса торможения от XBR
      { EBC5_SPN2919 = __Active; // Foundation brakes in use
        EBC5_SPN2918 = 1; //Driver's brake demand being executed, no XBR brake demand
      }
      else
      if(Brake_Request)
      { // торможения от XBR
        EBC5_SPN2919 = __Active; //тормоза используются
        if(Accel_MAX) EBC5_SPN2918 = 3; // Выполняется максимальный режим
        if(Accel_ADD) EBC5_SPN2918 = 2; // Выполняется режим добавления
      }
      else
      { EBC5_SPN2919 = 0; // Фундаментальные тормоза не используются
        EBC5_SPN2918 = 0; // торможение не выполняется
      }
	  EBC5.XBR_AccLim = XBR.AccLim_SPN2921;
	}
	else
	{ // нет в конфигурации
	  EBC5_SPN2919 = __BitsNot;          // not available
	  EBC5_SPN2917 = __BitsNot;          // not available
	  EBC5_SPN2918 = __XBR_NotAvailable; //
	  EBC5.XBR_AccLim = 0xFF;
	  XBR_System_Active = 0;
	}
} // end HBR_Control()
#endif

#ifdef   __HillHolder_Compile
//********************************************************************
//                        Hill Holder
//********************************************************************
void    Hill_Holder_Control (void)
{
/*
SPN 2912  (R)  Hill holder mode
Signal which indicates the currentmode of the hill holder function.
000 Inactive
001 Active
010 Active, but will change to inactive ina short time. (This mode may be used to warn the driver)
011 - 101 Reserved
110 Hill holder not functional
111 Not available
*/
#define   __HillHolder_Inactive   0
#define   __HillHolder_Active     1
#define   __HillHolder_ActChange  2
#define   __NotAvailable          7
/*
Сигнал, который указывает на ситуацию экстренного торможения
(Ссылка. Регламент ECE 13 пункт 5.2.1.31) с высокими значениями замедления.
Этот сигнал может быть использован для активации огней опасности (Регламент Ref ECE 48 пункт 6.23).
5.2.1.31.1 Сигнал должен активизироваться при значениях замедления, вызванного воздействием
рабочей тормозной системы, не менее:
- для ТС категорий М1, и N1, — 6 м /с2;
- для ТС категорий М2, М3, N2 и N3 — 4 м /с2.
Для всех ТС сигнал должен прекращать свое действие не позднее момента падения замедления
ниже 2,5 м/с2
*/
#define   __SPN5847_Deccel_6    0x3000 // 6m/c2
#define   __SPN5847_Deccel_4    0x2000 // 4m/c2
#define   __SPN5847_Deccel_Off  0x1400 // 2,5m/c2
#define   __SPN5847_Press_Off   0x1400 // 1atm

	EBC5_Status3 = 0xFF;
	if(EBC5_SPN5847_Enable || //CFG  Активируется Emergency Brake
	   Dia_Emergency)
	{   // активация
		if(((SPN5847_Deccel_6 &&
			 Acc_X_est < -__SPN5847_Deccel_6) ||
		    (!SPN5847_Deccel_6 &&
			 Acc_X_est < -__SPN5847_Deccel_4)) &&
		   Brake.DemandValue > Brake.CFG.AsistP)
		   Emergency_Brake = 1;
		// деактивация
		if(Emergency_Brake &&
		   (Acc_X_est > -__SPN5847_Deccel_Off ||
		    Brake.DemandValue < __SPN5847_Press_Off))
		   Emergency_Brake = 0;
		//
		if(Emergency_Brake ||
		   Dia_Emergency)
			 EBC5_SPN5847 =__BitsON;
		else EBC5_SPN5847 = 0;
	}

	// --------------------------------------------------
	// определение машина стоит
#define   __HHR_Speed_Thr 0x0500 // 5km/h
#define   __Vx_HillHold_Delay     20 //100mc

	if(Speed_VX_est	< __HHR_Speed_Thr)
	{
	  if(Brake.HillHold.VxCnt < __Vx_HillHold_Delay)
		 Brake.HillHold.VxCnt++;
	  else HHR_Vx_Stop = 1;
	}
	else
	{ if(Brake.HillHold.VxCnt)
		 Brake.HillHold.VxCnt--;
	  else HHR_Vx_Stop = 0;
	}

	// определение состояния TSET_Switch
	// TSET_Switch определен в STM2
#define   __TSET_HHR_Sw_Delay     10  //50mc
#define   __TSET_HHR_Sw_Tout     1000 //5c
	if(TSET_Switch)
	{
	  if(Brake.HillHold.CntTSET <__TSET_HHR_Sw_Tout)
	  {  Brake.HillHold.CntTSET++;
	    if(Brake.HillHold.CntTSET > __TSET_HHR_Sw_Delay)
	      TSET_Switch_ON = 1; //
	  }
	  else // Tout
	  {	  TSET_Switch_ON = 0;
	      TSET_Switch_Tout = 1; //
	  }
	}
	else // выключен
	{ if(Brake.HillHold.CntTSET > __TSET_HHR_Sw_Delay)
		 Brake.HillHold.CntTSET = __TSET_HHR_Sw_Delay;
	  if(Brake.HillHold.CntTSET)
	     Brake.HillHold.CntTSET--;
	  else // выключен
	  {	  TSET_Switch_ON = 0;
	      TSET_Switch_Tout = 0;
	  }
	}

	if(HillHold_SW == __Active)
		 EBC1_Switch_ON = 1;
	else EBC1_Switch_ON = 0;
	// определение состояния "Hill Holder" Switch
#define   __SW_HillHold_Delay     10 //50mc
    if((EBC1_Switch_ON &&            // EBC1 Hill Holder Switch
	    EBC1_HHR_Sw_Enable) ||       // CFG
	   (TSET_Switch_ON &&            // TSET Hill Holder Switch
		!TSET_Switch_Tout &&	     // нет Tout
	    TSET_HHR_Sw_Enable))         // CFG
    {
	  if(Brake.HillHold.CntSW <__SW_HillHold_Delay)
		 Brake.HillHold.CntSW++;
	  else HHR_Switch_On = 1; // включено
    }
    else // выключено
	{ if(Brake.HillHold.CntSW)
		 Brake.HillHold.CntSW--;
	  else HHR_Switch_On = 0; //
	  if(HillHolder_Active &&
	     HHR_Switch_On)
		   HHR_Switch_Ch = 1; // ставим флаг
	  else HHR_Switch_Ch = 0;
	}
	// флаг запроса активации Switch
	if(HHR_Switch_On &&
	   HHR_Vx_Stop)
		 HHR_Switch_Request = 1;
	else HHR_Switch_Request = 0;

	// состояние тормоза
#define   __HHR_Phigh_Thr  0x6400	// 5atm
#define   __HHR_Plow_Thr   0x2800	// 2atm
#define   __Press_Low_Delay  50     //250mc
#define   __HHR_Press_Thr  10	// 1atm / 2,56c
#define   __HHR_dP_Ch_Thr  0x2800	// 2atm

	if(Brake.DemandValue < __HHR_Plow_Thr)
	{ if(Brake.HillHold.PressCnt < __Press_Low_Delay)
		 Brake.HillHold.PressCnt++;
	  else	HHR_Press_High = 0; // отпущенный тормоз
	}
	else
	if(Brake.DemandValue > __HHR_Phigh_Thr)
	{ if(Brake.HillHold.PressCnt)
		 Brake.HillHold.PressCnt--;
	  else HHR_Press_High = 1;    // тормоз нажат
	}

	// относительное давление активации
	if(!HHR_Vx_Stop)
	     Brake.HillHold.Press = __HHR_Phigh_Thr;
	else
	{ if(Brake.HillHold.Press > Brake.DemandValue)
	     Brake.HillHold.Press = Brake.DemandValue;  //миниум
	  else // медлено увеличиваем
		 Brake.HillHold.Press +=__HHR_Press_Thr;
	}
	if(Brake.DemandValue >
	  (Brake.HillHold.Press +__HHR_dP_Ch_Thr))
		 HHR_Press_Ch = 1;
	else HHR_Press_Ch = 0;

	// флаг запроса от тормоза
	// ставится если отпустить и резко нажать
	if(HHR_Press_Enable && // CFG
	   HHR_Vx_Stop &&
//	   HHR_Press_Low &&    // пока не снялся флаг
	   HHR_Press_Ch &&
	   HHR_Press_High)
		 HHR_Press_Request = 1;
	else HHR_Press_Request = 0;

	// определение состояния сцепления
#define   __HHR_Clutch_Releas  250 // 1,25c
	if(Sens_Clutch_Instal)
	{
	  if(CCVS_Clutch_Active ==__BitsON) // сцепление выжато
	  { if(Brake.HillHold.CntClutch < __HHR_Clutch_Releas)
		   Brake.HillHold.CntClutch++;
	    else HHR_Clutch_Off = 1;
	  }
	  else
	  if(CCVS_Clutch_Active ==__BitsOFF) // сцепление отпущено
	  { if(HHR_Clutch_Off)
	    { if(Brake.HillHold.CntClutch)
		     Brake.HillHold.CntClutch++;
	      else HHR_Clutch_On = 1;
	    }
	  }
	}
	else HHR_Clutch_On = 1;

	// определение неисправностей блокирующих "Hill Holder"
	if(HillHold_Fail_Enable &&                 // Fault_Mask
	   (((s_PrS_Error & __Mask_Err_BPS_HHR) && // ошибкa Press
		 HHR_Press_Enable) ||
		Driver_Fail))
		 HHR_Fail = 1;
	else HHR_Fail = 0;

    // флаг Hill_Holder_Disable
	if(Hill_Holder_Enable &&    // разрешено в конфигурации
	   ((//CAN_Engine.Taxo &&     // заведен мотор
//o	     !CAN_Engine.Driver &&	// отпущен газ
		 !Parking_ON &&         // не нa ручника
		 HHR_Vx_Stop &&         // стоит
		 !MDT_Stair_Req &&      // нет тестов модуляторов
		 !Pneum_Req_Fl &&
	     !HHR_Fail) ||			// нет неисправностей
	     Dia_HillHold))    // блокируем флаг при диагностике
		 HillHold_Disable = 0;
	else HillHold_Disable = 1;

	// определение состояния деактивации Hill Holder
	if(HillHolder_Active)
	{
	  if(HillHold_Disable || // деактивация
	     (HHR_Switch_Ch &&
		  HHR_Switch_On) ||  // деактивация по Switch второе нажатие
		 Brake.HillHold.Time >
	     Brake.CFG.HillHoldT || // деактивация по времени
		 (CAN_Engine.Driver > 30 && // нажат газ
		  HHR_Clutch_On))     // и сцепление отпущено
	     HHR_Deactivate = 1; //
	}
	else HHR_Deactivate = 0; //

	// ---------------машина Hill Holder-----------
#define   __HillHolder_ToutToff   300 //1,5c
#define   __HillHolder_DeActToff  60  //0,3c
#define   __HillHolder_LampT      100 //0,5c
#define   __HillHold_Press        0x3200  //2,5atm

	switch (Brake.HillHold.Phase)
	{
	   case 0:
		   HHR_Lamp_State = 0;
		   if(!Hill_Holder_Enable)
		        EBC5_SPN2912 = __NotAvailable;
		   else EBC5_SPN2912 = __HillHolder_Inactive;

		   if((!HillHold_Disable &&
			   (HHR_Switch_Request ||   // активация "Hill Holder" Switch
			    HHR_Press_Request)) ||  // педалью тормоза
			   Dia_HillHold)            // диагностика
		   { // активация
			   Brake.HillHold.Time = 0;
			   Brake.HillHold.LampCnt = 0;
			   HHR_Lamp_State = 1;
			   HillHolder_Active = 1;
			   EBC5_SPN2912 = __HillHolder_Active;
	  	       // задание давления
			   Brake.HillHold.Pdes = __HillHold_Press;
			   // состояние клапанов
			   XBR_Dif_Front = 1;
			   if(HHR_DifR_Enable)
			   XBR_Dif_Rear = 1;
			   Brake.HillHold.Phase++;
		   }
	   break;

	   case 1:  // HillHolder активен
		   if((!HHR_Press_High &&       // отпущена педаль тормоза
			   !HHR_Switch_On) ||       // выключен Switch
			  Dia_HillHold)
			  Brake.HillHold.Time++; // пошел отсчет времени
	   	   if(HHR_Deactivate)
	   	   { // деактивация
			 HHR_Lamp_State = 1;
	   		 EBC5_SPN2912 = __HillHolder_ActChange;
	   		 if(HHR_Deactivate)
	   		 { XBR_Dif_Front = 0;
	   		   XBR_Dif_Rear = 0;
	   			  Brake.HillHold.Time = __HillHolder_DeActToff;
	   		 }
	   		 else Brake.HillHold.Time = __HillHolder_ToutToff;
	   		 Brake.HillHold.Phase++;
	   	   }
	   	   else  // обсуживание лампы HillHolder
	   	   if(Brake.HillHold.LampCnt++ >__HillHolder_LampT)
	   	   {  Brake.HillHold.LampCnt = 0;
	   		  if(HHR_Lamp_State)
	   			   HHR_Lamp_State = 0;
	   		  else HHR_Lamp_State = 1;
	   	   }
	   break;

	   case 2:
	   	   if(!--Brake.HillHold.Time)
	   	   { // завершено
	   		 XBR_Dif_Front = 0;
	   		 XBR_Dif_Rear = 0;
	   		 HillHolder_Active = 0;
	   		 Dia_HillHold = 0;
	   		 HillHold_Flags &= 0xC0;
		   	 EBC5_SPN2912 = __HillHolder_Inactive;
		   	 Brake.HillHold.Phase = 0;
	   	   }
	   break;
	}
	// обсуживание лампы HillHolder
	// уйдет в VDC1 через VDC_Lamp_MC2
	if(HHR_Lamp_Enable && //CFG
	   HHR_Lamp_State)
		 HillHolder_Lamp = 1;
	else HillHolder_Lamp = 0;

} // end Hill_Holder_Control()
#endif

// управление диф. клапаном
uint8_t    DifKL_Regulate (DifTypeDef* Dif)
{
	uint16_t Pd;
#define   __Dif_Pgrad   60
#define   __Dif_PWM_P   0x6400 // 5atm
	if(!Dif->Pdes)
	{
		Dif->ON_Time = 0;
	    Dif->On =0;
	}
	else
	{
	  Pd = (int32_t)Dif->Pdes;
	  if(Dif->Press > Dif->Pdes)
	  { Dif->ON_Time++;
	    Pd+= (int32_t)Dif->ON_Time * __Dif_Pgrad;
	  }

	  if((Dif->Press > (Pd + Dif->dP)) &&
		  Dif->Press < __Dif_PWM_P)
		  Dif->On = 0;
	  else
	  if(Dif->Press < Pd)
		  Dif->On = 1;
	}

	return Dif->On;
} // end DifKL_Regulate

void    Switch_Valve (void)
{// вызывается в My_Tick каждые 1ms

#ifdef   __AxisF_Compile
	Puls_Press(&Wheel_FL);
	Puls_Press(&Wheel_FR);
#endif
#ifdef   __AxisR_Compile
	Puls_Press(&Wheel_RL);
	Puls_Press(&Wheel_RR);
#endif

	// давление выключения режимов
	if(DYC_BrakeActive)
	     DifPressOff = __DYC_DifPressOff;
    else DifPressOff = __ROP_DifPressOff;

// флаг DSC_Disable перенесено ниже
//	if(!DSC_Disable)
    {
#ifdef   __AxisF_Compile
      // DifValve_Front
      if(ROP.BrakeF.DifOn)                // ROP
      { FrontDif.Pdes = ROP.Pdif_F;
        FrontDif.dP = ROP.dPdif;
      }
      else
      if(Wheel_FL.Puls.Phase == 1 ||
    	 Wheel_FR.Puls.Phase == 1 ||     // DYC
		 Dia_DifFront)                   // Diag
      {	FrontDif.Pdes = DYC.Pdif_F;
        FrontDif.dP = DYC.dPdif;
      }
      else   FrontDif.Pdes = 0;

  	  // управление диф. клапаном
      DSC_Dif_Front = DifKL_Regulate(&FrontDif);

      // флаг наличия давления после диф. клапана
      // управляет выпуском или подкачкой в фазе 0
      if((DSC_Dif_Front ||
          FrontDif.Press > DifPressOff) &&
    	 !Dia_DifFront) // при Dia_Dif клапана держим открытыми
    	   Front_Dif_Press = 1;
      else Front_Dif_Press = 0;

      // управление модуляторами
      switch (Wheel_FL.Puls.Phase) {
			      case 0:
			    	  if(Front_Dif_Press)
			    	  {    _DSC_Exh(FL);}
			    	  else _DSC_Pump(FL);  break;
			      case 1:  _DSC_Pump(FL);  break;
			      case 2:
			      case 3:  _DSC_Cut(FL);   break;
			      case 4:
			      case 5:  _DSC_Exh(FL);   break;
	  }
	  switch (Wheel_FR.Puls.Phase) {
			      case 0:
			    	  if(Front_Dif_Press)
			    	  {    _DSC_Exh(FR);}
			    	  else _DSC_Pump(FR);  break;
			      case 1:  _DSC_Pump(FR);  break;
			      case 2:
			      case 3:  _DSC_Cut(FR);   break;
			      case 4:
			      case 5:  _DSC_Exh(FR);   break;
	  }
	  if(ROP.BrakeF.Phase)
		   ROP_Front_Break = 1;
	  else ROP_Front_Break = 0;
	  if(Wheel_FL.Puls.Phase ||
	  	 Wheel_FR.Puls.Phase)
		   DYC_Front_Break = 1;
	  else DYC_Front_Break = 0;

	  // флаг Front_Break
	  if(ROP_Front_Break ||
		 DYC_Front_Break ||
	  	 Dia_DifFront)
	  		DSC_Front_Break = 1;
	  else
	  if(FrontDif.Press < (DifPressOff - __Dif_dPoff))
	      	DSC_Front_Break = 0;
#endif
#ifdef   __AxisR_Compile
	  //DifValve_Rear
      if(ROP.BrakeR.DifOn)          // ROP
      { RearDif.Pdes = ROP.Pdif_R;
        RearDif.dP = ROP.dPdif;
      }
      else
      if(Wheel_RL.Puls.Phase == 1 ||
         Wheel_RR.Puls.Phase == 1 || // DYC
		 Dia_DifRear)                // Diag
      {	RearDif.Pdes = DYC.Pdif_R;
        RearDif.dP = DYC.dPdif;
      }
      else   RearDif.Pdes = 0;
  	  // управление диф. клапаном
      DSC_Dif_Rear = DifKL_Regulate(&RearDif);

      // флаг наличия давления после диф. клапана
      if((DSC_Dif_Rear ||
    	 RearDif.Press > DifPressOff) &&
    	 !Dia_DifRear)
    	   Rear_Dif_Press = 1;
      else Rear_Dif_Press = 0;

      // управление модуляторами
      switch (Wheel_RL.Puls.Phase) {
			      case 0:
			    	  if(Rear_Dif_Press)
			    	  {    _DSC_Exh(RL); }
			    	  else _DSC_Pump(RL);  break;
			      case 1:  _DSC_Pump(RL);  break;
			      case 2:
			      case 3:  _DSC_Cut(RL);   break;
			      case 4:
			      case 5:  _DSC_Exh(RL);   break;
	  }
	  switch (Wheel_RR.Puls.Phase) {
			      case 0:
			    	  if(Rear_Dif_Press)
			    	  {    _DSC_Exh(RR);}
			    	  else _DSC_Pump(RR);  break;
			      case 1:  _DSC_Pump(RR);  break;
			      case 2:
			      case 3:  _DSC_Cut(RR);   break;
			      case 4:
			      case 5:  _DSC_Exh(RR);   break;
	  }
	  if(ROP.BrakeR.Phase)
		   ROP_Rear_Break = 1;
	  else ROP_Rear_Break = 0;
	  if(Wheel_RL.Puls.Phase ||
	  	 Wheel_RR.Puls.Phase)
		   DYC_Rear_Break = 1;
	  else DYC_Rear_Break = 0;

	  // флаг Rear_Break
	  if(ROP_Rear_Break ||
		 DYC_Rear_Break ||
	  	 Dia_DifRear)
	  		DSC_Rear_Break = 1;
	  	else
	  {	if(RearDif.Press < (DifPressOff - __Dif_dPoff))
	  		DSC_Rear_Break = 0;
	  }
#endif
    } // end  if(!DSC_Disable)
//    else
    if(DSC_Disable)
    { // DSC_Disable
       DSC_KL_Status1 = 0;     // выключаем клапана
       DSC_KL_Status2 = 0;
       DSC_Front_Break = 0;    // снимаем флаг обязательно!
    }

    // изменено
    if(Brake_Asist_Active ||
	   HillHolder_Active ||
	   XBR_System_Active ||
	   HaltBrake_Active)
    	 XBR_KL_Active = 1;
    else XBR_KL_Active = 0;

#ifdef   __AxisF_Compile
	if(!ABS_Active)
	{
	  ABS_KL_Status1 = 0;
	  ABS_KL_Status2 = 0;
	}

    if( DSC_Front_Break)
	{
      KL_Status_1 = DSC_KL_Status1;
	  KL_Status_2 = DSC_KL_Status2;
	  if(ABS_Active)
	  {
	    KL_Status_1 |= ABS_KL_Status1;
	    KL_Status_2 |= ABS_KL_Status2;
	  }
	  TestMod_Enable = 0; // запрет теста модуляторов
	}
	else
    if(ABS_Active ||
	   XBR_KL_Active)
    {  KL_Status_1 = ABS_KL_Status1;
       KL_Status_2 = ABS_KL_Status2;
 	   if(XBR_KL_Active)
 	   { KL_Status_1 |= XBR_KL_Status1;
 	     KL_Status_2 |= XBR_KL_Status2;
 	   }
       TestMod_Enable = 0; // запрет теста модуляторов
    }
    else
    { TestMod_Enable = 1;
      if(MDT_Active) // состояние клапанов для тестов
	  { KL_Status_1 = MDT_KL;
	    KL_Status_2 = MDT_KL2;
	  }
	  else
	  { KL_Status_1 = 0;
	    KL_Status_2 = 0;
	  }
    }
	 // состояние клапанов To Port
	 // модулятор левый борт
	 if(AV_FL)
	 { Wheel_FL.MDT.AV.On = 1;
	   _Port_On(AVFL); // 1 To Port
	 }
	 else
	 { Wheel_FL.MDT.AV.On = 0;
	   _Port_Off(AVFL); // 0 To Port
	 }
	 if(EV_FL)
	 { Wheel_FL.MDT.EV.On = 1;
	   _Port_On(EVFL); // 1 To Port
	 }
	 else
	 { Wheel_FL.MDT.EV.On = 0;
	   _Port_Off(EVFL); // 0 To Port
	 }
	 // модулятор правый борт
	 if(AV_FR)
	 { Wheel_FR.MDT.AV.On = 1;
	   _Port_On(AVFR); // 1 To Port
	 }
	 else
	 { Wheel_FR.MDT.AV.On = 0;
	   _Port_Off(AVFR); // 0 To Port
	 }
	 if(EV_FR)
	 { Wheel_FR.MDT.EV.On = 1;
	   _Port_On(EVFR); // 1 To Port
	 }
	 else
	 { Wheel_FR.MDT.EV.On = 0;
	   _Port_Off(EVFR); // 0 To Port
	 }
	 // диф. клапан передней оси
	 if(Dif_F)
	 { FrontDif.St_On = 1;
	   _Port_On(IN_DIFF); // 1 To Port
	 }
	 else
	 { FrontDif.St_On = 0;
	   _Port_Off(IN_DIFF); // 0 To Port
	 }
#endif
#ifdef   __AxisR_Compile

	if(!ABS_Active &&
	   !EBL_Active)
	{
	  ABS_KL_Status1 = 0;
	  ABS_KL_Status2 = 0;
	}
	if(!DSC_Break_Abort &&    //
	   (DSC_Rear_Break ||
		Trailer_Break))
	{
	  KL_Status_1 = DSC_KL_Status1;
	  KL_Status_2 = DSC_KL_Status2;
	  if(ABS_Active)
	  {
	    KL_Status_1 |= ABS_KL_Status1;
	    KL_Status_2 |= ABS_KL_Status2;
	  }
	  TestMod_Enable = 0; // запрет теста модуляторов
	}
	else
    if(ABS_Active ||
       EBL_Active ||
	   ASR_Brake_Active ||
	   XBR_KL_Active)
    {
       KL_Status_1 = ABS_KL_Status1;
       KL_Status_2 = ABS_KL_Status2;
       if(EBL_Active)
       { KL_Status_1 |= EBL_KL_Status;
         KL_Status_2 |= EBL_KL_Status2;
       }
 	   if(ASR_Brake_Active)
 	   { KL_Status_1 |= ASR_KL_Status1;
 	     KL_Status_2 |= ASR_KL_Status2;
 	   }
 	   if(XBR_KL_Active)
 	   { KL_Status_1 |= XBR_KL_Status1;
 	     KL_Status_2 |= XBR_KL_Status2;
 	   }
       TestMod_Enable = 0; // запрет теста модуляторов
    }
    else
    { TestMod_Enable = 1;
      if(MDT_Active) // состояние клапанов для тестов
	{ KL_Status_1 = MDT_KL;
	  KL_Status_2 = MDT_KL2;
	}
	else
	{ KL_Status_1 = 0;
	  KL_Status_2 = 0;
	  }
	}
	 // состояние клапанов To Port
	 // модулятор левый борт
	 if(AV_RL)
	 { Wheel_RL.MDT.AV.On = 1;
	   _Port_On(AVRL); // 1 To Port
	 }
	 else
	 { Wheel_RL.MDT.AV.On = 0;
	   _Port_Off(AVRL); // 0 To Port
	 }
	 if(EV_RL)
	 { Wheel_RL.MDT.EV.On = 1;
	   _Port_On(EVRL); // 1 To Port
	 }
	 else
	 { Wheel_RL.MDT.EV.On = 0;
	   _Port_Off(EVRL); // 0 To Port
	 }
	 // модулятор правый борт
	 if(AV_RR)
	 { Wheel_RR.MDT.AV.On = 1;
	   _Port_On(AVRR); // 1 To Port
	 }
	 else
	 { Wheel_RR.MDT.AV.On = 0;
	   _Port_Off(AVRR); // 0 To Port
	 }
	 if(EV_RR)
	 { Wheel_RR.MDT.EV.On = 1;
	   _Port_On(EVRR); // 1 To Port
	 }
	 else
	 { Wheel_RR.MDT.EV.On = 0;
	   _Port_Off(EVRR); // 0 To Port
	 }
#ifdef   __Axis3_Compile
// третья ось
	 // модулятор левый борт
	 if(AV_3L)
	 { Wheel_3L.MDT.AV.On = 1;
	   _Port_On(AV3L); // 1 To Port
	 }
	 else
	 { Wheel_3L.MDT.AV.On = 0;
	   _Port_Off(AV3L); // 0 To Port
	 }
	 if(EV_3L)
	 { Wheel_3L.MDT.EV.On = 1;
	   _Port_On(EV3L); // 1 To Port
	 }
	 else
	 { Wheel_3L.MDT.EV.On = 0;
	   _Port_Off(EV3L); // 0 To Port
	 }
	 // модулятор правый борт
	 if(AV_3R)
	 { Wheel_3R.MDT.AV.On = 1;
	   _Port_On(AV3R); // 1 To Port
	 }
	 else
	 { Wheel_3R.MDT.AV.On = 0;
	   _Port_Off(AV3R); // 0 To Port
	 }
	 if(EV_3R)
	 { Wheel_3R.MDT.EV.On = 1;
	   _Port_On(EV3R); // 1 To Port
	 }
	 else
	 { Wheel_3R.MDT.EV.On = 0;
	   _Port_Off(EV3R); // 0 To Port
	 }
#endif
	 // диф. клапан задней оси
	 if(Dif_R)
	 { RearDif.St_On = 1;
	   _Port_On(IN_DIFR); // 1 To Port
	 }
	 else
	 { RearDif.St_On = 0;
	   _Port_Off(IN_DIFR); // 0 To Port
	 }
	 // диф. клапан прицепа
	 if(Dif_T)
	 { TrailerDif.St_On = 1;
	   _Port_On(IN_DIFT); // 1 To Port
	 }
	 else
	 { TrailerDif.St_On = 0;
	   _Port_Off(IN_DIFT); // 0 To Port
	 }
	 // проп. клапан
	 if(!LIM_PK_Active)
	 {
	   if(Prop_KL)
	   { LIM_PK_ON = 1;
	    _Port_On(IN_PK); // 1 To Port
	   }
	   else
	   { LIM_PK_ON = 0;
	    _Port_Off(IN_PK); // 0 To
	   }
	 }
#endif
	  // запуск компаратора для формирования задержки включения ключа
	  MDT.Sw.Delay =  (uint16_t)__HAL_TIM_GET_COUNTER(&htim4) +
				         __MDT_Valve_Delay;
      __HAL_TIM_SET_COMPARE(&htim4, TIM_CHANNEL_3, MDT.Sw.Delay);
      HAL_TIM_OC_Start(&htim4, TIM_CHANNEL_3);
} // end Switch_Valve ()

void    Puls_Press (WheelTypeDef* WheelXX)
{
#define   __DYC_dT_Req     200 //230
#define   __Tehx_Max       300
#define   __Tpump_Max      300
#define   __PulsOff_Press  0x1000 // 0,8atm
#define   __Ph6_Tout       100

	if(WheelXX->Puls.Delay)
	   WheelXX->Puls.Delay--;

	switch (WheelXX->Puls.Phase)
	{
	  case 0: // запрос
		  WheelXX->Puls.Ph_Cnt = 0;
	  break;

	  case 1: // pump
		  // ограничение давления
		  if(WheelXX->Press > WheelXX->Puls.PumpSet ||
		     WheelXX->Puls.Ph_Cnt++ >= __Tpump_Max)
		  {  WheelXX->Puls.Phase = 2;
		     WheelXX->Puls.Ph_Cnt = 0;
		  }
          // активировалось ABS
		  if(WheelXX->ABS.Phase == 1)
			 WheelXX->Puls.Phase = 3;
	  break;

	  case 2: //cut
		   if(WheelXX->ABS.Phase == 1)
		   { // активировалось ABS с ограничением давления
			   WheelXX->Puls.Phase = 3;
			   WheelXX->Puls.Ph_Cnt = 0;
		   }
		   else
		   if(WheelXX->Puls.Ph_Cnt++ >
		      WheelXX->Puls.TcutSet)   // ограничение времени
		   {
			 WheelXX->Puls.Ph_Cnt = 0;
			 // при ROP остаемся в фазе
			 if(DYC_BrakeActive)
		       WheelXX->Puls.Phase = 5;//0;
		   }
	  break;

	  case 3: //cut ABS
		   WheelXX->Puls.Delay = 0;
		   WheelXX->Puls.Ph_Cnt++;
		   // ожидаем выхода ABS из 1 3 фазы
		   if(!WheelXX->ABS.Phase)
		   {
		     if(DYC_BrakeActive)
		     {
		       WheelXX->Puls.Phase = 6;
		       WheelXX->Puls.Ph_Cnt = 0;
		     }
		     if(ROP_BrakeActive)
		       WheelXX->Puls.Phase = 2;
		   }
	  break;

	  case 4: //exh ROP
		  // ограничение давления
		  if(WheelXX->Press < WheelXX->Puls.ExhSet ||
			 WheelXX->Puls.Ph_Cnt++ >= __Tehx_Max)   //Tout
		  {
			 WheelXX->Puls.Phase = 2;
		     WheelXX->Puls.Ph_Cnt = 0;
		  }
	  break;

	  case 5: //
		   if(WheelXX->ABS.Phase == 1)
		   { // активировалось ABS
			  WheelXX->Puls.Phase = 3;
			  WheelXX->Puls.Ph_Cnt = 0;
		   }
		   else
		  { // ждем снижения давления
            if(WheelXX->Press < __PulsOff_Press ||
       		   WheelXX->Puls.Ph_Cnt++ >= __Tehx_Max)
            {  WheelXX->Puls.Phase = 6;
               WheelXX->Puls.Ph_Cnt = 0;
            }
		  }
		  break;

	  case 6: // пульс Press завершен
		  if(WheelXX->Puls.Ph_Cnt++ >= __Ph6_Tout)
			 WheelXX->Puls.Phase = 0;
		  break;
	}
} // end Puls_Press()

void    VDC_Flags (void)
{
// ------перенесено из VDC_Flags-------
//  флаг ROP_BreakActive
	if( ROP_Front_Break ||
	    ROP_Rear_Break)
	{
	  ROP_BrakeActive = 1;
	  DYC_BrakeActive = 0;
    }
    else
//  флаг DYC_BreakActive
    if( DYC_Front_Break || // обязательно
    	DYC_Rear_Break )
    {
      DYC_BrakeActive = 1;
      ROP_BrakeActive = 0;
    }
//  сброс флагов DYC_BreakActive и ROP_BreakActive
	if( !DSC_Front_Break &&
	    !DSC_Rear_Break)
	{
		DYC_BrakeActive = 0;
		ROP_BrakeActive = 0;
	}
//---------------------------------
// смена ROP_EngineActive при возникновении DYC_BreakActive
    if(ROP_EngineActive && DYC_BrakeActive)
	{
      ROP_EngineActive = 0;
	  DYC_EngineActive = 1;
	  ROP.Engine.Phase = 0;
	  ROP_Engine_Event = 0;
	}

// смена DYC_EngineActive при возникновении ROP_BreakActive
    if(DYC_EngineActive &&
       ROP_BrakeActive)
	{
      DYC_EngineActive = 0;
	  ROP_EngineActive = 1;
	  DYC_Engine_Event = 0;
	}

//  флаг DYC_Active
	if(DYC_EngineActive ||
	   DYC_BrakeActive)
		 DYC_Active = 1;
	else DYC_Active = 0;

// флаг ROP_Active
	if(ROP_EngineActive ||
	   ROP_BrakeActive)
		ROP_Active = 1;
	else
	{   ROP_Active = 0;
	  ROP_EngAfterBrake = 0;
	}

// флаг Truck_VDC_Active
// флаг управляет лампой VDC
	if(DYC_Active ||
	   ROP_Active ||
	   DYC_TrailerBreak)
		 Truck_VDC_Active = 1;
	else Truck_VDC_Active = 0;

// флаг  Control_Active любое регулирование активно
	if(Truck_VDC_Active ||
	   ABS_Active ||
	   EBL_Active ||
	   ASR_Brake_Active ||
	   ASR_EngineActive)
		 Control_Active = 1;
	else Control_Active = 0;

// флаг ввода в эксплуатацию
	if((AGS_Calibr_Cmpl &&
	    SAS_Calibr_Cmpl &&
	    Model_Instal) ||
	   Block_ErrInst)     //блокировкa ошибок инициализации
		 VDC_Instal_Cmpl = 1;
	else VDC_Instal_Cmpl = 0;

	// ABS Fully Operational SPN1243
	if(Wheel_FL.ABS.Failure || //State.Bits.b7 ||    // ABS Failure
	   Wheel_FR.ABS.Failure || //State.Bits.b7 ||
	   Wheel_RL.ABS.Failure || //State.Bits.b7 ||    // ABS Failure
	   Wheel_RR.ABS.Failure)   //State.Bits.b7)
		 ABS_Fail = 1;
	else ABS_Fail = 0;

#ifdef   __AxisF_Compile

// флаг DSC_Break_Abort
// ставится если BrakeActive когда нет Enable
// установка с задержкой чтобы работал Diag
#define   __DSC_Break_Abort_Delay     40 //200mc
	if(((DYC_BrakeActive && !DYC_Enable) ||
	    (ROP_BrakeActive && !ROP_Enable)) &&
	   !Diag_Flags)
	{	if( DSC_Break_Abort_Delay < __DSC_Break_Abort_Delay)
		    DSC_Break_Abort_Delay++;
	    else DSC_Break_Abort = 1;
	}
	else
	{	DSC_Break_Abort_Delay = 0;
		DSC_Break_Abort = 0;
	}

// флаг VDC_FullOp
	if(!AGSzero_InProcess &&
	    VDC_Instal_Cmpl &&    // выполнена калибровка
	   !ASR_SW_Condition &&	  // не отключена выключателем
	   !s_SAS_Error &&
	   !s_AGS_Error &&
	   !(s_PrS_Error & __Mask_PrS_Error) &&
	   !s_CANJ_Error &&
	   !s_MC3_Error &&
//	   !ABS_Fail &&           // нет ошибок ABS
	   !Fatal_Failure)
		 VDC_FullOp = 1;
	else VDC_FullOp = 0;

// флаг DSC_Disable
	if(DSC_Enable &&      // разрешено в конфигурации
	   VDC_FullOp &&      // нет неисправностей
	   Range_Detection && // руль нормальный SAS_Ok
	   !DSC_Break_Abort &&
	   !ReverseON)
		 DSC_Disable = 0;
	else DSC_Disable = 1;
#endif
// Для зада DSC_Disable берется из флага Front_Flags

#ifdef   __AxisF_Compile
	if(VDC_FullOp &&
	   !Truck_VDC_Active)
		 VDC_Lamp_MC1 = 0;
	else VDC_Lamp_MC1 = 1;
	// для диагностики
	VDC_LampOn = VDC_Lamp_MC1 | VDC_Lamp_MC2;
#else
	if(!VDC_Lamp_MC1 &&
	   !DIA_VDC_Lamp &&
	   !Truck_VDC_Active &&
	   !Trailer_VDC_Active &&
	   !HillHolder_Lamp)
	     VDC_Lamp_MC2 = 0;
	else VDC_Lamp_MC2 = 1;
	// для CAN_VDC1
	VDC_LampOn = VDC_Lamp_MC2;
#endif

// флаг ROP_Enable
#define   __ROP_OFF_BrakeP      0x5A00 // 4,5 Atm
#define   __ROP_OFF_DeltaSpeed  0x0500  // 5 km/h

	 if(!DSC_Disable &&
		 DSC_Roll_Enable &&      //CFG
	    Brake.DemandValue < __ROP_OFF_BrakeP) // нет Торможения
	 { if(Speed_VX_est > ROP.CFG.SpeedON)
		  ROP_Enable = 1;   // установка
	   if(Speed_VX_est < (ROP.CFG.SpeedON -__ROP_OFF_DeltaSpeed))
		  ROP_Enable = 0;
	 }
	 else ROP_Enable = 0;

// флаг DYC_Enable
// проблема DYC OvSt может включиться при ABS торможении
//задержка после ROP_BreakActive
     if(DYC.Delay)
    	DYC.Delay--;
     if(ROP_BrakeActive ||         // ROP_BreakActive
    	( Break_Abort_DYC &&	   // разрешено в CFG
    	  Brake.DemandValue > DYC.CFG.Poff) || // нажат тормоз >1,5Atm
		( ABS_DYC_Disable &&       // разрешено в CFG
#ifdef   __AxisF_Compile
		  ABS_Front_Active
#else
		  ABS_Rear_Active
#endif
		) ||
		(Validity_Abort_DYC &&
		 (Bad_Wz_Est || Bad_Wz_Des)))
    	DYC.Delay = 160; //0,8c

	 if(!DSC_Disable &&
		!No_Maneuver &&
	    !DYC.Delay)                        // нет ROP_Break
	 {
	   if(Speed_VX_est > __DYC_ON_Speed)
		  DYC_Enable = 1;   // установка
	   if(Speed_VX_est < __DYC_OFF_Speed)
	 	  DYC_Enable = 0;
	 }
	 else DYC_Enable = 0;

#ifdef   __ASR_Compile
// ----- вход в ASR проверка скорости TCO ---------
#define   __ASRE_Thr_Min    0x02CD // 2.8km/h
if(!ASRon_Check_TCO ||  // проверка запрещена
//	   !TCO_Koef_Enable || // TCO нет в конфигурации
   (!TCO_Speed_Fail &&  // или нет ошибки TCO
    !TCO_CAN_Fail &&    //
    TCO.Speed > __ASRE_Thr_Min)) // и есть скорость
	 ASR_TCO_Disable = 0;  // вход в ASR разрешен
else ASR_TCO_Disable = 1;  // вход в ASR запрещен

// флаг ASR_Disable
#define   __ASR_BrakeValue  0x3C00 //3Atm  0x1E00 //1,5Atm
	 if(ASR_Enable &&           // разрешено в конфигурации
		!ASR_SW_Condition &&    // выкл. Switch
//			    !((Wheel_FL.State.Byte & Mask_Safe) &&
//				  (Wheel_FR.State.Byte & Mask_Safe)) && // обе передние Safe
//		!ASR_TCO_Disable &&     // нет запрета от TCO
		!(Brake.DemandValue > __ASR_BrakeValue && // не нажат тормоз
		  ASR_Abort_Brake) &&
		!ABS_Front_Active && //  нет ABS
		!EBL_Active &&
		!ROP_BrakeActive &&  // не активен ROP
		!Model_Install_Fail) //
		  ASR_Disable = 0;
	 else ASR_Disable = 1;
#endif

// флаг нормального движения вперед Forward_Move
#define   __SpeedX_Rel 0x0800
	 if(Speed_VX_est > __SpeedX_Rel &&
		!ReverseON) Forward_Move = 1;
	 else           Forward_Move = 0;

	// ошибки VDC активируются на стоящей машине
#define   __VDC_Fail_T   300  // 1,5c
	if(VDC_Fail_Enable &&     // CFG // VDC Active on Stop Fail  Enable
	   !Diag_Flags &&         // в диагностике ставится DYC_Active
	   Speed_VX_est < 0x0100) // Стоит
	{
	  if(DYC_Active)
	  { if(DYC.Fail_Cnt < __VDC_Fail_T)
		   DYC.Fail_Cnt++;
	   else VDC_DYC_Fail = 1;
	  }
	  else
	  { if(DYC.Fail_Cnt)
		   DYC.Fail_Cnt--;
      }
      if(ROP_Active)
	  { if(ROP.Fail_Cnt < __VDC_Fail_T)
	       ROP.Fail_Cnt++;
	    else VDC_ROP_Fail = 1;
	  }
	  else
	  { if(ROP.Fail_Cnt)
		   ROP.Fail_Cnt--;
	  }
	}
} // end  VDC_Flags()

#ifdef  __LIM_Speed
//void    LIM_Failures(void)
//{
//}

#define   __LIM_CFG_KintI    716
#define   __LIM_CFG_KintD    1022
#define   __LIM_PID_Integ_Min    0x00020000
#define   __LIM_PID_Integ_Max    0x00780000
#define   __LIM_CFG_Kpro    616  //24*256/10
#define   __LIM_CFG_Kdif    409  //16*256/10
#define   __LIM_PID_Max     0x00007D00

#define   __LIM_Event_ON_Thr   25600 //100 // порог активации
#define   __LIM_Event_OFF_Thr   50 // порог деактивации
#define   __LIM_Adj_dSp_Thr1   0x0180  //1,5km/h
#define   __LIM_Adj_dSp_Thr2   0x0480
#define   __LIM_Adj_Thr_Time   200  //1c
#define   __Mc_KmH    1180
#define   __LIM_Adj_PWM_Inc    0x3333 // PID_Max за 3cек
#define   __LIM_Adj_PWM_Dec    0x1EB8 // 0 за 5cек
#define   __LIM_Adj_Rupture_dSp   0x0080
#define   __LIM_Ph1_Tout   1000
#define   __LIM_Ph2_Tout   1000
#define   __LIM_Ph3_Tout   100
#define   __LIM_Ph4_OFF_Time   600  //3c

#define LIM_Phase_1  1
#define LIM_Phase_2  2
#define LIM_Phase_3  3
#define LIM_Phase_4  4
#define LIM_Phase_5  5
//---------------------------------------------------------------------
void     Limitation_Speed(void)
{ // 5mc
	// выход фильтра используется для обнуления отрицательных uint16_t
	uint16_t FiltOut;
	//
#define   __LIM_Off_Press 0x0900 //0,45atm
#define   __LIM_Off_Delay 20
	if(((CCVS_Brake_Active == __BitsON ||
		 CCVS_Clutch_Active == __BitsON) &&
	     CAN_CCVS_Enable) ||                   // нажатa педаль сцепления
	   (Brake.DemandValue > __LIM_Off_Press && // нажат тормоз
		!Brake_M_Fail && !Brake_PS_OffFail) || // исправен датчик тормозной педали
		(LIM_TSET_Active && !TSET_SW_Condition)) // активен LIM TSET и выключен TSET_SW
	{ if(LIM.Delay <__LIM_Off_Delay)
		 LIM.Delay++;
	}
	else
	{ if(LIM.Delay)
		 LIM.Delay--;
	}
	// регулятор  скорости

	// Расчет порога скорости
	// delta V = (U_PWM_Stab_Max - U_PWM_Stab_Min )/ Lim_Adj_Prop_Coef +
	// Car_Accel_dT * T(0,4 - задержка наполнения + 0,3 -запаздывание реакции)
	if(TSET_SW_install)
	{ if(TSET_SW_Condition)
	  { // захват TSET_SW
		if(LIM.Speed.Est > LIM.CFG.Set_Min &&
		  !LIM_TSET_keep)
		{ LIM_TSET_keep = 1;
		  LIM_TSET_Active = 1;
		  LIM.Speed.TSET = LIM.Speed.Est;
    	}
	  }
	  else LIM_TSET_keep = 0; // флаг захвата TSET_SW
	}
	// определяет порог
	if(LIM.Speed.TSET && LIM_TSET_Active)
		 LIM.Speed.ThresHold = LIM.Speed.TSET;
	else LIM.Speed.ThresHold = LIM.CFG.Speed_Set;
	// ускорение LIM.Speed.DeriVative в B7

	// управление в фазе адаптации через интегратор PID
	switch (LIM.Phase)
	{ case 0: // фаза ожидания LIM_Engine_Event
		 if(LIM.Speed.DeriVative > 0) //разгон
		 {LIM.Speed.dThr = LIM.Speed.DeriVative * __Mc_KmH *
			            __LIM_Adj_Thr_Time /256;
		   if(LIM.Speed.dThr > __LIM_Adj_dSp_Thr2)
			  LIM.Speed.dThr = __LIM_Adj_dSp_Thr2;
		   if(LIM.Speed.dThr < __LIM_Adj_dSp_Thr1)
			  LIM.Speed.dThr = __LIM_Adj_dSp_Thr1;
		 }
		 if(LIM.Speed.Est > (LIM.Speed.ThresHold - LIM.Speed.dThr))
		 { LIM.Speed.Max = LIM.Speed.Est;
		   LIM.ADJ.Tout = 0;
		   LIM.PID.Integ = __LIM_PID_Integ_Max/2;
		   LIM_Engine_Event = 1;
		   LIM.Phase++;
		 }
	     break;
	  case LIM_Phase_1: // фаза
		 // убираем газ до перелома скорости
	     LIM.ADJ.Tout++;
		 if(LIM.Speed.Max < LIM.Speed.Est)
		 { LIM.Speed.Max = LIM.Speed.Est;
		    if(LIM.PID.Integ < __LIM_PID_Integ_Max)
		  	   LIM.PID.Integ +=__LIM_Adj_PWM_Inc;
		 }
		 else
		 { // наступил перелом
		   if((LIM.Speed.Max - LIM.Speed.Est) >
			  __LIM_Adj_Rupture_dSp)
		   { if(LIM.Speed.Est < LIM.Speed.ThresHold)
			 { // перелом наступил ниже порога скорости
				LIM.Phase = LIM_Phase_3;
			 }
			 else
			 { // перелом наступил выше порога скорости
				LIM.Phase = LIM_Phase_2;
			 }
		     LIM.ADJ.Max = LIM.PK.PWM.Des;
		     LIM.Speed.Min = LIM.Speed.Est;
		   }
		   LIM.ADJ.Tout = 0;
		 }
	     break;
	  case LIM_Phase_2: // фаза
		  // тормозим до порога скорости
		 if(LIM.Speed.Est < LIM.Speed.ThresHold ||
		    LIM.ADJ.Tout++ > __LIM_Ph2_Tout)
		 {	LIM.Phase++;
		    LIM.Speed.Min = LIM.Speed.Est;
		    LIM.ADJ.Tout = 0;
		 }
		 break;
	  case LIM_Phase_3: // фаза
		 // добавляем газ до до перелома скорости
		 LIM.ADJ.Tout++;
		 if(LIM.Speed.Min > LIM.Speed.Est)
		 { LIM.Speed.Min = LIM.Speed.Est;
		    if(LIM.PID.Integ)
		  	   LIM.PID.Integ -=__LIM_Adj_PWM_Dec;
		 }
		 else
		 { // наступил перелом
		   if((LIM.Speed.Est -LIM.Speed.Min) >
			    __LIM_Adj_Rupture_dSp)
		   {
             LIM.Phase = LIM_Phase_4;
			 LIM.ADJ.Min = LIM.PK.PWM.Des;
			 LIM.ADJ.PWM = (LIM.ADJ.Max + LIM.ADJ.Min) / 2;
			 LIM.PID.Integ = LIM.ADJ.PWM * 256;
			 LIM.Off_Cnt = 0;
		   }
		 }
		 break;
	  case LIM_Phase_4: // фаза
		 // адаптация завершена
		  if (LIM.Speed.Est <
		  	 (LIM.Speed.ThresHold -__LIM_Adj_dSp_Thr2))
		  { if(LIM.Off_Cnt < __LIM_Ph4_OFF_Time)
			   LIM.Off_Cnt++;
			if(LIM.Off_Cnt == __LIM_Ph4_OFF_Time || // Tout
			   LIM.Delay ==__LIM_Off_Delay || // выход 1- отпустили газ
		  	   LIM.PK.PWM.Des < LIM.ADJ.Min)  // нажат тормоз
		    { // выход
			  LIM_Engine_Event = 0;
		      LIM.Phase = 0;
		      LIM_TSET_Active = 0;
		        LIM.Engine.Torque = 0x7D;
		        LIM.Engine.Taxo = 0xFFFF;
		    }
		  }
		  else
		  { LIM.Off_Cnt = 0;

		  }
		 break;
	} // End LIM_Phase
	//----------------PID регулятор------------------------------------
	LIM.Speed.delta = (int32_t)LIM.Speed.Est -
			          (int32_t)LIM.Speed.ThresHold;
	// интегратор PID регулятора
	if(!LIM_Engine_Event)
        LIM.PID.Integ = 0;
	else
	{ int32_t dI;
	  if(LIM.Speed.delta > 0)
		   dI = (int32_t)LIM.Speed.delta * __LIM_CFG_KintI /256;
	  else dI = (int32_t)LIM.Speed.delta * __LIM_CFG_KintD /256;
	  LIM.PID.Integ += dI;
	  // ограничения интегратора
	  if(LIM.PID.Integ < __LIM_PID_Integ_Min)
		 LIM.PID.Integ = __LIM_PID_Integ_Min;
	  if(LIM.PID.Integ > __LIM_PID_Integ_Max)
		 LIM.PID.Integ = __LIM_PID_Integ_Max;
	}
	// пропорциональная состaвляющая PID регулятора
	LIM.PID.Out = (int32_t)LIM.Speed.delta *__LIM_CFG_Kpro /256;
	// интегральная состaвляющая PID регулятора
	LIM.PID.Out += LIM.PID.Integ / 256;
	// дифференциальная состaвляющая PID регулятора
	LIM.PID.Out += (int32_t)LIM.Speed.DeriVative *__LIM_CFG_Kdif /256;
	// ограничения выхода регулятора
	if(LIM.PID.Out < 0)
	   LIM.PID.Out = 0;
	else
	if(LIM.PID.Out > __LIM_PID_Max)
	   LIM.PID.Out = __LIM_PID_Max;

	// выход регулятора - задание PWM.Des
	if(Dia_Prop_Kl)
	     LIM.PK.PWM.Des = Diag.Pdes;
	else
	if(Lim_Speed_Enable && // режим включен CFG
		 LIM_Engine_Event) //
	     LIM.PK.PWM.Des = LIM.PID.Out;// /256;
	else LIM.PK.PWM.Des = 0;

	// фильтрация задания
	if(LIM_Engine_Event || Dia_Prop_Kl)
	   LIM.Filter_PWM.Xn = LIM.PK.PWM.Des;
    else
	if(ASR_Engine_Event)
	{ // перевод ASR.Engine.Torque в LIM.PK.PWM
	  LIM.Filter_PWM.Xn = ASR.Engine.Torque;
	}
    else
	{ // выход
      LIM.PK.PWM.Des = 0;
      LIM.Filter_PWM.Xn = 0;
	}
	FiltOut = Filter_Cheb(&LIM.Filter_PWM, Koef_Filtr5Hz);
	if(FiltOut < __uintYnMinus)
		 LIM.PK.PWM.In = FiltOut;
	else LIM.PK.PWM.In = 0;

	// определяем LIM_Sign_PWM
	int16_t D = LIM.PK.PWM.In - LIM.Filter_PWM.Yn_2;
	if(D > 0) LIM_Sign_PWM = 0; // нарастающая ветвь
	else      LIM_Sign_PWM = 1; // спадающая ветвь
    // регулятор PWM функция  F(In,U)
    // состaвляющая от входной величины PWM
	if(LIM_Sign_PWM)
	// спадающая ветвь
	LIM.PK.PWM.Kin = (LIM.CFG.PWM_PK.Ku - LIM.CFG.PWM_PK.dKu) *
	                  LIM.PK.PWM.In/256 + LIM.CFG.PWM_PK.Ko;
	else // нарастающая ветвь
	LIM.PK.PWM.Kin = (LIM.CFG.PWM_PK.Ku + LIM.CFG.PWM_PK.dKu) *
	                  LIM.PK.PWM.In/256 + LIM.CFG.PWM_PK.Ko;
	// состaвляющая от напряжения
#define __PWM_Voltage_Max  3150 //31,5
#define __PWM_Voltage_Min  1800 //18
#define __PWM_Voltage_Ku   85   //max 85
#define __PWM_Voltage_Ko   0x5700 // Mul*Nom
	uint16_t U = Power.PWRValue;
	if(U > __PWM_Voltage_Max)
	   U = __PWM_Voltage_Max;
	if(U < __PWM_Voltage_Min)
	   U = __PWM_Voltage_Min;
	if(LIM.CFG.PWM_PK.Kvolt <__PWM_Voltage_Ku) // CFG
	   LIM.CFG.PWM_PK.Kvolt =__PWM_Voltage_Ku;
	LIM.PK.PWM.Ku = ((__PWM_Voltage_Max - U) * LIM.CFG.PWM_PK.Kvolt) +
			                                   __PWM_Voltage_Ko;
	// изменение скважности
	LIM.PK.PWM.Kdc = LIM.PK.PWM.Kin * LIM.PK.PWM.Ku;
	LIM.PK.PWM.OnTime = (uint32_t)(LIM.PK.PWM.Kdc / 65536 * LIM.PK.PWM.In) /65536;

	// изменение периода
//#define __PWM_Period_Max  30000  //33 Hz
//#define __PWM_Period_Koef 15//32 //33-46 Hz

	LIM.PK.PWM.Period = LIM.CFG.PWM_PK.Period * 1000 -
	 	 ((uint32_t)LIM.PK.PWM.In * LIM.CFG.PWM_PK.Kper / 256);
	LIM.PK.PWM.OffTime = LIM.PK.PWM.Period - LIM.PK.PWM.OnTime;
	//	LIM.PK.Oss.DutyCycle = LIM.PK.PWM.OnTime;
	// активация
#define   __LIM_PK_PWM_ON_Thr   2560
#define   __LIM_PK_PWM_Off_Thr   256
	if(LIM.PK.PWM.In >__LIM_PK_PWM_ON_Thr)
	{ if(!LIM_PK_Active)
	  {	  LIM_PK_Active = 1;
		  Proportion_Valve();
	  }
	}
	if(LIM.PK.PWM.In <__LIM_PK_PWM_Off_Thr)
	 PK_Abort();
} // end Limitation_Speed()

void     Proportion_Valve(void)
{  // вызывается в myHAL_TIM_OC_DelayElapsedCallback
	// 33 Hz T=30mc
	// тестирование выполняется вместе с модуляторами

	uint16_t OC;
	if(LIM_PK_Active)
	{ ADC_PK();
	  if(!LIM_PK_ON)
	  { // выключен клапан
		LIM_PK_ON	= 1;
		OC =  LIM.PK.PWM.OnTime;
		_Port_On(IN_PK); // состояние On 1 To Port
	  }
	  else // включен клапан
	  {	LIM_PK_ON	= 0;
	    OC =  LIM.PK.PWM.OffTime;
	    _Port_Off(IN_PK); // состояние Off 0 To Port
	  }
	  OC += __HAL_TIM_GET_COUNTER(&htimPK);
	  // запуск компаратора
	  __HAL_TIM_SET_COMPARE(&htimPK, PK_CHANNEL, OC);
	       HAL_TIM_OC_Start(&htimPK, PK_CHANNEL);
	    HAL_TIM_OC_Start_IT(&htimPK, PK_CHANNEL);
	}
//	else PK_Abort();

} // end Proportion_Valve()

void     PK_Abort(void)
{
	if(LIM_PK_Active)
	{  LIM_PK_Active = 0;
       LIM_PK_ON = 0;
      _Port_Off(IN_PK);
      HAL_TIM_OC_Stop(&htimPK, PK_CHANNEL);
	}
}

#define _PK_ErrCnt_IncI(E) {\
{	if(LIM.PK.Fail.E##_Cnt <__MDT_ErrCnt_MaxI) \
	{  LIM.PK.Fail.E##_Cnt++;                  \
	   LIM.PK.Fail.Repeat = 1; }}			   \
} //end macroc
#define _PK_ErrCnt_Inc(E) {\
{	if(LIM.PK.Fail.E##_Cnt <__MDT_ErrCnt_Max) \
	   LIM.PK.Fail.E##_Cnt++;  }              \
} //end macroc
#define _PK_ErrCnt_Dec(E) {\
	if(LIM.PK.Fail.E##_Cnt)                   \
	   LIM.PK.Fail.E##_Cnt--;                 \
} //end macroc
#define _PK_ErrCnt_DecI(E) {\
	if(LIM.PK.Fail.E##_Cnt <__DIF_SetErr_TimeI) \
	   LIM.PK.Fail.E##_Cnt = 0;                 \
    else LIM.PK.Fail.E##_Cnt--;                 \
} //end macroc
void     Analysis_Test_PK (void)
{
	if(!BTS142_GND_On)
	{ // выключена земля клапанов
	  if(LIM.PK.ADC.Off_Val < MDT.Sw.SB_Level)
	  { _PK_ErrCnt_Dec(SB)
		if(!LIM.PK.Fail.SB_Cnt)
			PropKL_SB = 0;
	  }
    }
    else
	{ LIM.PK.Fail.Repeat = 0;
	if(LIM_PK_ON)
	{ // включен клапан
	  // время активации
	  if(LIM.PK.Fail.Ton_Cnt < __MDT_ErrTon_Time)
		 LIM.PK.Fail.Ton_Cnt++;
	  // проверка замыкания
	  if(LIM.PK.ADC.On_Val < MDT.Sw.SC_Level)
		     _PK_ErrCnt_IncI(SC)
	    else _PK_ErrCnt_DecI(SC)
	}
	else
	{ // выключен клапан
	  // время активации
	//    if(LIM.PK.Fail.Ton_Cnt < __MDT_ErrTon_Time)
	//	   LIM.PK.Fail.Ton_Cnt--;
	    LIM.PK.Fail.Ton_Cnt = 0;
	  // проверка обрыва
	    if(LIM.PK.ADC.Off_Val > MDT.Sw.NC_Level &&
	 	   LIM.PK.ADC.On_Val < MDT.Sw.SB_Level)
	    { if(GndR_On)
		     _PK_ErrCnt_Inc(NC)
	    }
	    else _PK_ErrCnt_Dec(NC)
	    // проверка замыкания на +
		// выполняется только если все выключены
		if(LIM.PK.ADC.Off_Val > MDT.Sw.SB_Level)
		{ if(GndR_On)
			 _PK_ErrCnt_Inc(SB)
		}
		else _PK_ErrCnt_Dec(SB)
	  }
	  if(LIM.PK.Fail.Repeat)
		 MDT.Sw.Repeat = 1; //  будет повторяться тест модулятора
	}
} // end Analysis_PK

_DIF_Err_ Error_PK (void)
{
_DIF_Err_ GPR0;
    GPR0.Byte = 0;
	if(LIM.PK.Fail.Ton_Cnt == __MDT_ErrTon_Time)
	         GPR0.Bits.ERR_Ton = 1; // превышено время активации
	if(LIM.PK.Fail.NC_Cnt > __DIF_SetErr_Time)
		     GPR0.Bits.NC = 1;      // обрыв клапанa
	else
	if(LIM.PK.Fail.SC_Cnt > __DIF_SetErr_TimeI)
			 GPR0.Bits.SC = 1;      // замыканиe клапанa
	else
	if(LIM.PK.Fail.SB_Cnt > __DIF_SetErr_Time)
			 GPR0.Bits.SB = 1;      // замыканиe на +
	return GPR0;
} // end Error_PK
//---------------------------------------------------------------------
#endif

/*****END OF FILE****/

