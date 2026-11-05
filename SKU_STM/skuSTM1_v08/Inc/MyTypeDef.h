/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MY_TypeDef_H
#define __MY_TypeDef_H

#include <sys\_stdint.h>

#define myCode  __attribute__((section(".myCodesection")))

typedef  union {
     uint8_t Byte;
  struct {
	  uint8_t b0:1;
	  uint8_t b1:1;
	  uint8_t b2:1;
	  uint8_t b3:1;
	  uint8_t b4:1;
	  uint8_t b5:1;
	  uint8_t b6:1;
	  uint8_t b7:1;
    } Bits;
} _ByteBits_;

//************** ОПРЕДЕЛЯЕМ ТИП ПРОЦЕССОРА ************
#define __MC_GD
//#define __MC_STM
//*****************************************************
//************** ОПРЕДЕЛЯЕМ ТИП ПЛАТЫ *****************
//#define __Square_Board       // квадратная плата
#define __Rectangular_Board  // прямоугольная плата
//*****************************************************
//***************ОПРЕДЕЛЯЕМ STM ***********************
#define __STM1
//*****************************************************

#ifdef __Square_Board
//*********************Projekt ************************
#define _Version_PO_Projekt    10
//*****************************************************
//***********************STM1 *************************
#define _Version_PO_MC1        3
//*****************************************************
// размер    PGM  98852 byte
//***********************STM2**************************
#define _Version_PO_MC2        3
//*****************************************************
// размер    PGM  98852 byte
//*****************************************************
#define _CRC_PGM_MC1      0x28EB1A9C
//*****************************************************
//*****************************************************
#define _CRC_PGM_MC2      0xA85F645B
//*****************************************************

#ifdef  __STM1
//*****************************************************
#define _CRC_PGM        _CRC_PGM_MC1
//*****************************************************

#define __PGM_USART1
//#define __LIM_Speed   // размер 2924 byte
#define __Diag_Kline  // размер 3972 byte
#define __AGS_SAS     // размер 6256 byte
#define __CAN_j1939   // размер 10608 byte
//#define __CAN_Trailer // размер 2244 byte
#define __Invense     // размер 708 byte
#define __EEPROM      // размер 3940 byte
//#define  __Torque_Compile
//#define   __DBR_Compile        //  размер 340  byte
//#define   __ASR_Compile        //  размер 3464  byte
//#define   __EBL_Compile        //  размер 1616  byte
//#define   __TrailerVDC_Compile //  размер 860 byte
#define   __AxisF_Compile      //  размер 1672  byte
//#define   __AxisR_Compile      //  размер 756  byte
//#define   __Axis3_Compile      //  размер 1256 byte
//#define   __HaltBrake_Compile  //  размер 884 byte
//#define   __XBR_Compile        //  размер 1068 byte
//#define   __HillHolder_Compile //  размер 1636 byte
#define   __Power_Compile      //  размер  byte
#define   __SPI_Compile

uint16_t ADC_Data[20];//16

#define ADC_Sila       ADC_Data[0]
#define ADC_DBR        ADC_Data[1]
#define ADC_GNDF       ADC_Data[1]
#define ADC_WL         ADC_Data[2]
#define ADC_DIFF       ADC_Data[3]
#define ADC_AUX2       ADC_Data[4] // ADC_BPS2
#define ADC_Press      ADC_Data[5] // ADC_BPS1
#define ADC_Kl15       ADC_Data[6]
#define ADC_EV_FR      ADC_Data[7]  // STA_M_FR
#define ADC_AV_FR      ADC_Data[7]
#define ADC_S2_FL      ADC_Data[8]
#define ADC_S1_FL      ADC_Data[9]

#define ADC_EV_FL      ADC_Data[13]// STA_M_FL
#define ADC_AV_FL      ADC_Data[13]
#define ADC_S1_FR      ADC_Data[14]
#define ADC_S2_FR      ADC_Data[15]

#define ADC_SW_ABS     ADC_Data[11]

#define TstPoint_Pin       TstPoint_1_Pin
#define TstPoint_GPIO_Port TstPoint_1_GPIO_Port

#define ADC_Ubat   ADC_Kl15
#define Pgm_STM    Pgm_STM1 // 0x33
#define __DIA_Num_MC  Dia_STM1 // 0x00
#endif

#ifdef  __STM2
//*****************************************************
#define _CRC_PGM        _CRC_PGM_MC2
//*****************************************************
#define __LIM_Speed   // размер 2924 byte
#define __Diag_Kline  // размер 3972 byte
//#define __AGS_SAS     // размер 6256 byte
#define __CAN_j1939   // размер 10608 byte
#define __CAN_Trailer // размер 2244 byte
//#define __Invense     // размер 708 byte
//#define __EEPROM      // размер 708 byte
#define   __Torque_Compile
//#define   __DBR_Compile        //  размер 340  byte
#define   __ASR_Compile        //  размер 3464  byte
#define   __EBL_Compile        //  размер 1616  byte
#define   __TrailerVDC_Compile //  размер 860 byte
//#define   __AxisF_Compile      //  размер 1672  byte
#define   __AxisR_Compile      //  размер 756  byte
#define   __Axis3_Compile      //  размер 1256 byte
#define   __HaltBrake_Compile  //  размер 884 byte
#define   __XBR_Compile        //  размер 1068 byte
#define   __HillHolder_Compile //  размер 1636 byte
#define   __Power_Compile      //  размер  byte
//#define   __SPI_Compile

uint16_t ADC_Data[20];//16
#define ADC_S1_RL      ADC_Data[0]
#define ADC_S1_RR      ADC_Data[1]
#define ADC_S2_RR      ADC_Data[2]
#define ADC_GNDR       ADC_Data[3]
#define ADC_LASR       ADC_Data[4]
#define ADC_S2_3L      ADC_Data[5]
#define ADC_S1_3L      ADC_Data[6]
#define ADC_S1_3R      ADC_Data[7]
#define ADC_EV_3R      ADC_Data[8] // STA_M_3R
#define ADC_AV_3R      ADC_Data[8]
#define ADC_EV_3L      ADC_Data[9] // STA_M_3L
#define ADC_AV_3L      ADC_Data[9]
#define ADC_EV_RL      ADC_Data[10] // STA_M_RL
#define ADC_AV_RL      ADC_Data[10]
#define ADC_EV_RR      ADC_Data[11] // STA_M_RR
#define ADC_AV_RR      ADC_Data[11]
#define ADC_DIFR       ADC_Data[12]
#define ADC_S2_RL      ADC_Data[13]
#define ADC_S2_3R      ADC_Data[14]
#define ADC_DIFT       ADC_Data[15]

#define ADC_SW_TSET    ADC_EV_3L
#define ADC_SW_ASR     ADC_AV_3R

#define TstPoint_Pin       TstPoint_1_Pin
#define TstPoint_GPIO_Port TstPoint_1_GPIO_Port

#define ADC_PropKl       ADC_DIFT //ADC_EV_T
#define IN_PK_Pin        IN_EVT_Pin
#define IN_PK_GPIO_Port  IN_EVT_GPIO_Port

#define Pgm_STM       Pgm_STM2 // 0x34
#define __DIA_Num_MC  Dia_STM2
#endif

#define   __MDT_ADC_1line
//#define   __GNDsw_IN_Inverted

#define   __TP1_PC13

#ifdef   __Axis3_Compile
#define   __ADUI   "АДЮИ.687254.061*" //6
#else
#define   __ADUI   "АДЮИ.687254.059*" //4
#endif
#define   __ADUI_DM   "АДЮИ.687254.060*"//DM

#endif // end __Square_Board

#ifdef __Rectangular_Board
//*********************Projekt ************************
#define _Version_PO_Projekt    8
//*****************************************************
//***********************STM1 *************************
#define _Version_PO_MC1        3
//*****************************************************
// размер    PGM  118720 byte
//***********************STM2**************************
#define _Version_PO_MC2        3
//*****************************************************
// размер    PGM  115360 byte
//*****************************************************
#define _CRC_PGM_MC1      0x6FD79BFA
//*****************************************************
//*****************************************************
#define _CRC_PGM_MC2      0x3CF243E2
//*****************************************************

#ifdef  __STM1
//*****************************************************
#define _CRC_PGM        _CRC_PGM_MC1
//*****************************************************
// размер    PGM  98852 byte

#define __PGM_USART1
//#define __LIM_Speed   // размер 2924 byte
#define __Diag_Kline  // размер 3972 byte
#define __AGS_SAS     // размер 6256 byte
#define __CAN_j1939   // размер 10608 byte
//#define __CAN_Trailer // размер 2244 byte
//#define __Invense     // размер 708 byte
#define __EEPROM      // размер 3940 byte
//#define  __Torque_Compile
//#define   __DBR_Compile        //  размер 340  byte
//#define   __ASR_Compile        //  размер 3464  byte
//#define   __EBL_Compile        //  размер 1616  byte
//#define   __TrailerVDC_Compile //  размер 860 byte
#define   __AxisF_Compile      //  размер 1672  byte
//#define   __AxisR_Compile      //  размер 756  byte
//#define   __Axis3_Compile      //  размер 1256 byte
#define   __HaltBrake_Compile  //  размер 884 byte
#define   __XBR_Compile        //  размер 1068 byte
#define   __HillHolder_Compile //  размер 1636 byte
#define   __Power_Compile      //  размер  byte
#define   __SPI_Compile

uint16_t ADC_Data[20];//16

#define ADC_WL         ADC_Data[0]
#define ADC_DBR        ADC_Data[1]
#define ADC_Sila       ADC_Data[2]
#define ADC_DIFF       ADC_Data[3]
#define ADC_EV_FL      ADC_Data[4]
#define ADC_AV_FL      ADC_Data[5]
#define ADC_EV_FR      ADC_Data[6]
#define ADC_AV_FR      ADC_Data[7]
#define ADC_S2_FL      ADC_Data[8]
#define ADC_S1_FL      ADC_Data[9]
#define ADC_GNDF       ADC_Data[10]
#define ADC_SW_ABS     ADC_Data[11]
#define ADC_Kl15       ADC_Data[12]
#define ADC_Press      ADC_Data[13]
#define ADC_S1_FR      ADC_Data[14]
#define ADC_S2_FR      ADC_Data[15]

#define TstPoint_Pin       TstPoint_1_Pin
#define TstPoint_GPIO_Port TstPoint_1_GPIO_Port

#define ADC_Ubat      ADC_Kl15
#define Pgm_STM       Pgm_STM1 // 0x33
#define __DIA_Num_MC  Dia_STM1 // 0x00

#endif


#ifdef  __STM2
//*****************************************************
#define _CRC_PGM        _CRC_PGM_MC2
//*****************************************************
#define __LIM_Speed   // размер 2924 byte
#define __Diag_Kline  // размер 3972 byte
//#define __AGS_SAS     // размер 6256 byte
#define __CAN_j1939   // размер 10608 byte
#define __CAN_Trailer // размер 2244 byte

#define __Invense     // размер 708 byte

//#define __EEPROM      // размер 708 byte
#define   __Torque_Compile
#define   __DBR_Compile        //  размер 340  byte
#define   __ASR_Compile        //  размер 3464  byte
#define   __EBL_Compile        //  размер 1616  byte
#define   __TrailerVDC_Compile //  размер 860 byte
//#define   __AxisF_Compile      //  размер 1672  byte
#define   __AxisR_Compile      //  размер 756  byte
//#define   __Axis3_Compile      //  размер 1256 byte
#define   __HaltBrake_Compile  //  размер 884 byte
#define   __XBR_Compile        //  размер 1068 byte
#define   __HillHolder_Compile //  размер 1636 byte
//#define   __Power_Compile      //  размер  byte
#define   __SPI_Compile

uint16_t ADC_Data[20];//16

#define ADC_LASR       ADC_Data[0]
#define ADC_DIFR       ADC_Data[1]
#define ADC_EV_T       ADC_Data[2]
#define ADC_DIFT       ADC_Data[3]
#define ADC_EV_RL      ADC_Data[4]
#define ADC_AV_RL      ADC_Data[5]
#define ADC_EV_RR      ADC_Data[6]
#define ADC_AV_RR      ADC_Data[7]
#define ADC_S2_RL      ADC_Data[8]
#define ADC_S1_RL      ADC_Data[9]
#define ADC_SW_TSET    ADC_Data[10]
#define ADC_SW_ASR     ADC_Data[11]
#define ADC_AUX2       ADC_Data[12]
#define ADC_GNDR       ADC_Data[13]
#define ADC_S1_RR      ADC_Data[14]
#define ADC_S2_RR      ADC_Data[15]

#define TstPoint_Pin       TstPoint_2_Pin
#define TstPoint_GPIO_Port TstPoint_2_GPIO_Port

#define ADC_PropKl         ADC_EV_T
#define IN_PK_Pin        IN_EVT_Pin
#define IN_PK_GPIO_Port  IN_EVT_GPIO_Port

#define Pgm_STM    Pgm_STM2 // 0x34
#define __DIA_Num_MC  Dia_STM2

#endif

//#define   __MDT_ADC_1line
#define   __GNDsw_IN_Inverted

#define   __TP1_PB2

#define   __ADUI   "АДЮИ.453633.025*"

#endif // end __Rectangular_Board

#endif /* __MY_TypeDef_H */
