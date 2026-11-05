/*
  * My_PGM.h
  ******************************************************************************
  * @brief   Header file of  module.
  * @author  Burdykin
  * Created on: 21 дес. 2021 г.
  *
  * @attention
  * last modified	12 октября 2022 г.
  ******************************************************************************
  */
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MY_PGM_H
#define __MY_PGM_H

/* USER CODE BEGIN Includes */
#include "MyTypeDef.h"
/* Exported types ------------------------------------------------------------*/
#define myRAM1  __attribute__((section("._user_RAM1")))

typedef  void (*FUN_Ptr_t) ();

typedef struct {
	_ByteBits_  Flags;
	uint32_t    SectorAdr;
	uint8_t     Command;
	uint32_t    PaketAdr;
	uint32_t    PaketData[12];
	uint8_t     RxData[48]; // UartDZ_Rx_Length
	uint8_t     TxData[4];
	uint32_t    Adr;
	uint8_t     Ask;
} TypeDef_PGM;

typedef struct
{
  uint32_t ExtId;       //!< Specifies the extended identifier.
  uint8_t Data[8];      //!< Contains the data to be received.
} TypeDef_CanRxTx;

/* End of exported types -------------------------------------------------*/

/* End of exported constants ------------------------------------------------*/
/* int16_t register access macros   */
#define _Hi_16(reg)    ((reg & 0xFF00) >> 8)
#define _Lo_16(reg)    (reg & 0x00FF)

/* ---------------Exported functions ----------------------------------------*/
#define myPGM   __attribute__((section(".myPGMsection")))
#define myPGMdata   __attribute__((section(".myPGMdata")))
#define myPGMtab   __attribute__((section(".myPGMtab")))

const volatile FUN_Ptr_t MyPGMTab[4];

void  PGM_UART(void) myPGM;
void  PGM_CAN(void) myPGM;

void  PGM_Main_UART(void) myPGM;
void  PGM_Main_CAN(void) myPGM;
void  PGM_Init(void) myPGM;
void  Jump_To_App (void) myPGM;
void  Test_PGM (void) myPGM;
void  DelayMs(uint32_t mdelay) myPGM;

uint8_t  FLASH_Erase_Page(uint32_t PageAddress) myPGM;
void  FLASH_Write_Word(uint32_t Address, uint32_t Data) myPGM;
//uint8_t  FLASH_Program_HalfWord(uint32_t Address, uint16_t Data) myPGM;
void  Wait_Completed(void) myPGM;

void  UART_Transmit(uint8_t *TxData, uint16_t Size) myPGM;
void  UART_Receive(uint8_t *RxData, uint8_t pBuff, uint16_t Size) myPGM;
uint32_t UART_BRR_SAMPL(uint32_t PCLK ,uint32_t BAUD) myPGM;

uint8_t  CAN_Receive_frame(TypeDef_CanRxTx* pRxMsg) myPGM;
void  Receive_CAN_frame(TypeDef_CanRxTx* pRxMsg) myPGM;
void  CAN_Receive(TypeDef_CanRxTx* pRxMsg, uint8_t *RxData) myPGM;
void  Transmit_CAN_frame(TypeDef_CanRxTx* pTxMsg) myPGM;
void  CAN_Transmit(TypeDef_CanRxTx* pTxMsg, uint8_t *TxData) myPGM;
void  CAN_Ask_Send(TypeDef_CanRxTx*  CAN_Rx,
                   TypeDef_CanRxTx*  CAN_Tx) myPGM;

#define  UART_Selected  0
#define  USB_Selected   1
#define  CAN_Selected   2

#define    __PMA_RxBufAddr   0x0110 //
#define    __PMA_TxBufAddr   0x00C0
/* End of exported functions -------------------------------------------------*/
// для настройки GPIO
#define  GPIO_CR_MODE_INPUT         0x00000000U /*!< 00: Input mode (reset state)  */
#define  GPIO_CR_CNF_ANALOG         0x00000000U /*!< 00: Analog mode  */
#define  GPIO_CR_CNF_INPUT_FLOATING 0x00000004U /*!< 01: Floating input (reset state)  */
#define  GPIO_CR_CNF_INPUT_PU_PD    0x00000008U /*!< 10: Input with pull-up / pull-down  */
#define  GPIO_CR_CNF_GP_OUTPUT_PP   0x00000000U /*!< 00: General purpose output push-pull  */
#define  GPIO_CR_CNF_GP_OUTPUT_OD   0x00000004U /*!< 01: General purpose output Open-drain  */
#define  GPIO_CR_CNF_AF_OUTPUT_PP   0x00000008U /*!< 10: Alternate function output Push-pull  */
#define  GPIO_CR_CNF_AF_OUTPUT_OD   0x0000000CU /*!< 11: Alternate function output Open-drain  */

#endif /* __MY_PGM_H */
