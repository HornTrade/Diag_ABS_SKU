/* ----- SKU_v08 ------------*/
#include "MyTypeDef.h"
#include "main.h"
#include "stm32f1xx.h"
#include "MySystem.h"
#include "MyPGM.h"

//*****************************************************
#define   __Er_Command    0x60
#define   __Wr_Command    0x61
#define   __End_Command   0x6E  // команда завершения
#define   __ReSixrUart_Command   0x7E  //
#define   __SizePaketSTM  32
#define   __SizePageSTM   2048
//!!!!!!!!!!!!!!!!
// при изменении FLASH (rx) : ORIGIN = 0x8001000
// обязательно изменить "system_stm32f1xx.c"
// #define VECT_TAB_OFFSET  0x00001000U
#define FLASH_APP_START_ADDRESS 0x08001000u
#define   __PGM_StartAddres 0x00001000   //  _mydata
//!!!!!!!!!!!!!!!!
#define   __PGM_EndAddres   0x0001F800   // myConstTab
#define   __PGM_NumPage ((__PGM_EndAddres - __PGM_StartAddres)/__SizePageSTM)//21

#define __TopOfStack 0x20010000
const volatile uint32_t  TopOfStack myPGMdata = __TopOfStack; //0x2000F000;//
const volatile FUN_Ptr_t MyPGMTab[4] myPGMtab = {
		Test_PGM,      // 0
		PGM_Main_UART, // 1
		PGM_Main_CAN,  // 2
		Jump_To_App    // 3
};

#define   CAN  CAN1

// Test Point  macros
#ifdef __TP1_PB2
#define   __TP_On    GPIOB->BSRR = TstPoint_Pin;
#define   __TP_Off   GPIOB->BSRR = (uint32_t)TstPoint_Pin << 16U;
#endif
#ifdef __TP1_PC13
#define   __TP_On    GPIOC->BSRR = TstPoint_Pin;
#define   __TP_Off   GPIOC->BSRR = (uint32_t)TstPoint_Pin << 16U;
#endif

//для отладки
//#define PGM_Disable

/*****************************************************************************
-------------------------- STM UPGRADE ---------------------------------------
*****************************************************************************/
void   Test_PGM (void)
{
#define   __StartDelay   340000 // 400mc // 1цикл 0,67мкс
#define   __USART1_Delay 170000
// меньше не работает лодырь
// STM стартуют с разницей	100мс  ????????

	uint32_t   StartDelay = __StartDelay;
    uint8_t    Uart_RxData[__PGM_Rx_Length];
    uint8_t    Uart_TxData[__PGM_Tx_Length];
    TypeDef_CanRxTx  CAN_Rx0;
    TypeDef_CanRxTx  CAN_Tx;
    uint8_t    PGM_Step1_Ask = 0;

    __disable_irq();
    // Check fetches the top-of-stack
    if(*(uint32_t*)FLASH_BASE != TopOfStack)
    { //загружаем в регистр sp (stack pointer) верхнее значение RAM.
     	__set_MSP(TopOfStack);
    }

    // инициализация RCC UART IWDG GPIO CAN
    PGM_Init();
    __TP_On //GPIOB->BSRR = TstPoint_Pin;

    // инициализации PGM
    while(StartDelay--)
    {
	  IWDG->KR = IWDG_KEY_RELOAD;
	  if(StartDelay == __USART1_Delay)
	  { // отсылаем в USART1
	    Uart_TxData[0] = 85;
	    Uart_TxData[1] = Pgm_STM;//170;
	    UART_Transmit(Uart_TxData, 2);
	    // отсылаем в CAN1
	    CAN_Tx.ExtId = _ExtID_make(PGM_Pri,PGM_PGN5,ECU_SA);
	    for (uint8_t i = 2; i < 8; i++)
		{CAN_Tx.Data[i] = 85;}
		CAN_Tx.Data[0] = 0x73;
		CAN_Tx.Data[1] =  Pgm_STM;
		Transmit_CAN_frame(&CAN_Tx);
	  }
	  //принимаем из CAN1
	  if(CAN_Receive_frame(&CAN_Rx0))
	  { if(CAN_Rx0.ExtId == _ExtID_make(PGM_Pri,PGM_PGN3,Dia_Adr) && // 0xF043
		   CAN_Rx0.Data[0] == __Rx_Head) //Head)
	    { if(CAN_Rx0.Data[1] == __PGM_Key1)
		  { //принято STM программатор инициализация 1 step
		    if(CAN_Rx0.Data[2] == __PGM_Step1) // обязательно байты инициализации!
			{ PGM_Step1_Ask = 1;
			  CAN_Ask_Send(&CAN_Rx0, &CAN_Tx);
			}
		  }
		  else
		  if(CAN_Rx0.Data[1] == __PGM_Key2)
		  { //принято STM программатор инициализация 2 step
		    if(PGM_Step1_Ask &&
		      CAN_Rx0.Data[2] == __PGM_Step2 &&
		      CAN_Rx0.Data[3] == Pgm_STM)
			{ //ответ на инициализацию
		      CAN_Ask_Send(&CAN_Rx0, &CAN_Tx);
		      // переход на программирование STM
		      PGM_CAN();
			}
		  }
	    }  // end PGM_PGN3  0xF043
	  }
	  //принимаем из USART1
      if((USART1->SR & USART_SR_RXNE) !=0)
	  {	Uart_RxData[0] = (uint8_t)(USART1->DR & (uint8_t)0x00FF);
	    if(Uart_RxData[0] == 0x73)
	    { UART_Receive(Uart_RxData, 1U, 1);
	      Uart_TxData[0] = Uart_RxData[0]; // ответ
   		  Uart_TxData[1] = Uart_RxData[1]; //
   	      if(Uart_RxData[1] == Pgm_STM)
	      { // отсылаем в USART1 ответ
   	   	    UART_Transmit(Uart_TxData, __DIA_Rx_Length+1);
   	    	// переход на программирование STM
   	   	    PGM_UART();
	      }
	    }
	  }
 	} // скобка от while
    __TP_Off //
    Jump_To_App();//MyPGMTab[3]();

} // end Test_PGM()

uint8_t  CAN_Receive_frame(TypeDef_CanRxTx* pRxMsg)
{
   if(CAN->RF0R & CAN_RF0R_FMP0)
   { // Поступление данных
     pRxMsg->ExtId = (0xFFFFFFF8U & CAN->sFIFOMailBox[0].RIR) >> CAN_RI0R_EXID_Pos;
     pRxMsg->Data[0] = (CAN_RDL0R_DATA0 & CAN->sFIFOMailBox[0].RDLR) >> CAN_RDL0R_DATA0_Pos;
     pRxMsg->Data[1] = (CAN_RDL0R_DATA1 & CAN->sFIFOMailBox[0].RDLR) >> CAN_RDL0R_DATA1_Pos;
     pRxMsg->Data[2] = (CAN_RDL0R_DATA2 & CAN->sFIFOMailBox[0].RDLR) >> CAN_RDL0R_DATA2_Pos;
     pRxMsg->Data[3] = (CAN_RDL0R_DATA3 & CAN->sFIFOMailBox[0].RDLR) >> CAN_RDL0R_DATA3_Pos;
     pRxMsg->Data[4] = (CAN_RDH0R_DATA4 & CAN->sFIFOMailBox[0].RDHR) >> CAN_RDH0R_DATA4_Pos;
     pRxMsg->Data[5] = (CAN_RDH0R_DATA5 & CAN->sFIFOMailBox[0].RDHR) >> CAN_RDH0R_DATA5_Pos;
     pRxMsg->Data[6] = (CAN_RDH0R_DATA6 & CAN->sFIFOMailBox[0].RDHR) >> CAN_RDH0R_DATA6_Pos;
     pRxMsg->Data[7] = (CAN_RDH0R_DATA7 & CAN->sFIFOMailBox[0].RDHR) >> CAN_RDH0R_DATA7_Pos;
     // освобождениe почтового ящика FIFO
     CAN->RF0R = CAN_RF0R_RFOM0; //Release FIFO 0
     return 1;
   }
   else return 0;
} // end

void   Receive_CAN_frame(TypeDef_CanRxTx* pRxMsg)
{
   // Ждем поступления данных
   while(!(CAN->RF0R & CAN_RF0R_FMP0));
   pRxMsg->ExtId = (0xFFFFFFF8U & CAN->sFIFOMailBox[0].RIR) >> CAN_RI0R_EXID_Pos;
   pRxMsg->Data[0] = (CAN_RDL0R_DATA0 & CAN->sFIFOMailBox[0].RDLR) >> CAN_RDL0R_DATA0_Pos;
   pRxMsg->Data[1] = (CAN_RDL0R_DATA1 & CAN->sFIFOMailBox[0].RDLR) >> CAN_RDL0R_DATA1_Pos;
   pRxMsg->Data[2] = (CAN_RDL0R_DATA2 & CAN->sFIFOMailBox[0].RDLR) >> CAN_RDL0R_DATA2_Pos;
   pRxMsg->Data[3] = (CAN_RDL0R_DATA3 & CAN->sFIFOMailBox[0].RDLR) >> CAN_RDL0R_DATA3_Pos;
   pRxMsg->Data[4] = (CAN_RDH0R_DATA4 & CAN->sFIFOMailBox[0].RDHR) >> CAN_RDH0R_DATA4_Pos;
   pRxMsg->Data[5] = (CAN_RDH0R_DATA5 & CAN->sFIFOMailBox[0].RDHR) >> CAN_RDH0R_DATA5_Pos;
   pRxMsg->Data[6] = (CAN_RDH0R_DATA6 & CAN->sFIFOMailBox[0].RDHR) >> CAN_RDH0R_DATA6_Pos;
   pRxMsg->Data[7] = (CAN_RDH0R_DATA7 & CAN->sFIFOMailBox[0].RDHR) >> CAN_RDH0R_DATA7_Pos;
   // освобождениe почтового ящика FIFO
   CAN->RF0R = CAN_RF0R_RFOM0; //Release FIFO 0

} // end Receive_CAN_frame(pRxMsg);

void   CAN_Receive(TypeDef_CanRxTx* pRxMsg, uint8_t *RxData)
{
uint8_t i;
#define End_n ((__Rx_Length-5)/8)

    pRxMsg->ExtId = 0;
    while(pRxMsg->ExtId !=_ExtID_make(PGM_Pri,PGM_PGN0,Dia_Adr))
    Receive_CAN_frame(pRxMsg);
    for (i = 0; i < 6; i++)
    RxData[i] = pRxMsg->Data[i];
    for (uint8_t n = 0; n < 4; n++)
    { pRxMsg->ExtId = 0;
      while(pRxMsg->ExtId !=_ExtID_make(PGM_Pri,PGM_PGN1,Dia_Adr))
      Receive_CAN_frame(pRxMsg);
      for (i = 0; i < 8; i++)
      RxData[i+n*8+6] = pRxMsg->Data[i];
    }
} // end CAN_Receive(&CAN_Rx0, Rx_Data)

void   Transmit_CAN_frame(TypeDef_CanRxTx* pTxMsg)
{
	uint32_t TxMB = CAN_TXSTATUS_NOMAILBOX; //transmitmailbox
    // Select one empty transmit mailbox
	if(CAN->TSR & CAN_TSR_TME0)
    	 TxMB = CAN_TXMAILBOX_0;
    else
    if (CAN->TSR &  CAN_TSR_TME1)
    	 TxMB = CAN_TXMAILBOX_1;
    else TxMB = CAN_TXMAILBOX_2;
	// Set up the Id
	CAN->sTxMailBox[TxMB].TIR = (pTxMsg->ExtId << CAN_TI0R_EXID_Pos |
			                     CAN_ID_EXT | CAN_RTR_DATA);
	// Set up the DLC
	CAN->sTxMailBox[TxMB].TDTR &= 0xFFFFFFF0U;
	CAN->sTxMailBox[TxMB].TDTR |= 8;
	// Set up the data field
	CAN->sTxMailBox[TxMB].TDLR = pTxMsg->Data[0] << CAN_TDL0R_DATA0_Pos |
			                     pTxMsg->Data[1] << CAN_TDL0R_DATA1_Pos |
			                     pTxMsg->Data[2] << CAN_TDL0R_DATA2_Pos |
			                     pTxMsg->Data[3] << CAN_TDL0R_DATA3_Pos;
	CAN->sTxMailBox[TxMB].TDHR = pTxMsg->Data[4] << CAN_TDL0R_DATA0_Pos |
			                     pTxMsg->Data[5] << CAN_TDL0R_DATA1_Pos |
			                     pTxMsg->Data[6] << CAN_TDL0R_DATA2_Pos |
			                     pTxMsg->Data[7] << CAN_TDL0R_DATA3_Pos;
	// Request transmission
	SET_BIT(CAN->sTxMailBox[TxMB].TIR, CAN_TI0R_TXRQ);
	// Check End of transmission
	if(TxMB == CAN_TSR_TME0)
	{	 while(!(CAN->TSR & (CAN_TSR_RQCP0 | CAN_TSR_TME0))){};}
	else
	if(TxMB == CAN_TSR_TME1)
	{	 while(!(CAN->TSR & (CAN_TSR_RQCP1 | CAN_TSR_TME1))){};}
	else while(!(CAN->TSR & (CAN_TSR_RQCP2 | CAN_TSR_TME2))){};
}  // end Transmit_CAN_frame(pRxMsg);

void   CAN_Transmit(TypeDef_CanRxTx* pTxMsg, uint8_t *TxData)
{
	pTxMsg->ExtId = _ExtID_make(PGM_Pri,PGM_PGN2,ECU_SA);
//	for (uint8_t i = 0; i < 8; i++)
	for (uint8_t i = 0; i < 2; i++)
	pTxMsg->Data[i] = TxData[i];
	Transmit_CAN_frame(pTxMsg);
} // end CAN_Transmit(&CAN_Tx, Tx_Data)

void CAN_Ask_Send(TypeDef_CanRxTx*  CAN_Rx,
                  TypeDef_CanRxTx*  CAN_Tx)
{ // используется в CAN  инициализации PGM
    CAN_Tx->ExtId = _ExtID_make(PGM_Pri,PGM_PGN4,ECU_SA);
    for (uint8_t i = 0; i < 8; i++)
	{CAN_Tx->Data[i] = CAN_Rx->Data[i];}
	Transmit_CAN_frame(CAN_Tx);
} // end CAN_Ask_Send

void PGM_UART(void)
{
   uint8_t i;
   uint8_t     Rx_Data[__PGM_Rx_Length];
   uint8_t     Tx_Data[__PGM_Tx_Length];
   uint8_t     Error = 0;
   uint8_t     OpCnt = 0;
#define   __UnLock_Fail   0x01
#define   __HeadRX_Fail   0x02
#define   __Erase_Fail    0x04
#define   __Blank_Fail    0x08
#define   __Write_Fail    0x10

   TypeDef_PGM PGM;

   #define     PGM_Flags      PGM.Flags.Byte
   #define     PGM_Command    PGM.Flags.Bits.b4
   #define     PGM_Sinxr      PGM.Flags.Bits.b5
   PGM_Sinxr = 1;

   // запрет всех прерываний
   __disable_irq(); // setting the I-bit in the CPSR.
   //Делаем память открытой
   if(FLASH->CR & FLASH_CR_LOCK)
   { /* Authorize the FLASH Registers access */
	 WRITE_REG(FLASH->KEYR, FLASH_KEY1);
	 WRITE_REG(FLASH->KEYR, FLASH_KEY2);
   }
   // Infinite loop
   while (1)
   {
	 if(PGM_Sinxr)
     { UART_Receive(Rx_Data, 0U, __PGM_Rx_Length);
       // анализируем что приняли
       if(Rx_Data[0] == 0xAF &&
     	  Rx_Data[1] == 0xA0)
       { //принято STM программируется
    	   IWDG->KR = IWDG_KEY_RELOAD;  // IWDG Reload
    	   Error &= ~__HeadRX_Fail;
    	   for (i = 0; i < __PGM_Rx_Length; i++)
   	       PGM.RxData[i] = Rx_Data[i];
     	   PGM.Command =   PGM.RxData[2]; // командa
     	   PGM.SectorAdr = PGM.RxData[3]*65536 +
     	    		       PGM.RxData[4]*256 +
     					   PGM.RxData[5];
     	  __TP_On //GPIOB->BSRR = TstPoint_Pin; //	_TP_On; нельзя
     	   // проверка адреса
     	   if(PGM.SectorAdr < __PGM_StartAddres ||
     	      PGM.SectorAdr > __PGM_EndAddres)
     		  PGM.Command = 5; //ошибка
     	   else
     	   //флаг выполнение команд программирования
     	   if(PGM.Command == __Er_Command ||
     	      PGM.Command == __Wr_Command ||
     	      PGM.Command == __End_Command)
     	      PGM_Command = 1;
       }
       else
       { // неправильный заголовок
    	   PGM_Sinxr = 0;
     	   PGM_Command = 0;
     	   Error |= __HeadRX_Fail;
     	   UART_Receive(Rx_Data, 0U, 1U); //прием одного байта
       }
     }
     else // not Sinxr_Flag
     { if(Rx_Data[0] == 0xAF)
       { PGM_Sinxr = 1;
     	 UART_Receive(Rx_Data, 1U, (__PGM_Rx_Length-1)); // прием остальных
       }
       else  UART_Receive(Rx_Data, 0U, 1U);
     }

     // выполнение команд программирования
     if(PGM_Command)
     {
       if(PGM.Command == __Er_Command)
       { //обработка команды Стирание Flash
    	 PGM_Command = 0;
#ifndef  PGM_Disable
    	 if(FLASH_Erase_Page(PGM.SectorAdr))//40mc
    		  Error |= __Erase_Fail;
    	 // Blank
    	 uint32_t Adr = PGM.SectorAdr + FLASH_BASE;
       	 while (Adr < (PGM.SectorAdr + FLASH_BASE + FLASH_PAGE_SIZE))
    	 { if(*(uint32_t*)(Adr) != 0xFFFFFFFF)
    		  Error |= __Blank_Fail;
    	   Adr +=4;
       	 }
#endif
       }
       else
       if(PGM.Command == __Wr_Command)
       { //обработка команды Запись Flash
    	 PGM_Command = 0;
    	 PGM.PaketAdr = PGM.SectorAdr;
    	 for (i = 0; i < (__SizePaketSTM/4); i++)
    	 { // Little Indian !!!!
  	       PGM.PaketData[i] = (PGM.RxData[6+i*4]  +
    	        		       PGM.RxData[7+i*4] * 256 +
    					       PGM.RxData[8+i*4] * 65536 +
    					       PGM.RxData[9+i*4] * 16777216);
    	   PGM.Adr = PGM.PaketAdr + FLASH_BASE;
#ifndef  PGM_Disable
    	   FLASH_Write_Word(PGM.Adr, PGM.PaketData[i]);
    	   // верификация
    	   if(*(uint32_t*)(PGM.Adr) != PGM.PaketData[i])
    		    Error |=  __Write_Fail;
#endif
    	   PGM.PaketAdr += 4;
    	 }
       }
     }
     OpCnt++;
 	 //здесь возврашаем команду и ошибку
 	 Tx_Data[0] = Error;
     if(Error)
    	  Tx_Data[1] = 5;
     else Tx_Data[1] = PGM.Command;
     UART_Transmit(Tx_Data, __PGM_Tx_Length);
 	 //обработка команды Завершено
     if(PGM.Command == __End_Command)
     { // после передачи ответа
       // признак программирования для EPROM CSsum
         PGM_Sign = __PGM_Sign_Data;
         SPI1->CRCPR = 33;
         MyPGMTab[3](); // Jump_To_App();
     }
     __TP_Off //
   } // end Infinite loop
} // end PGM_Main()

void PGM_CAN(void)
{
   uint8_t i;
   uint8_t     Rx_Data[__PGM_Rx_Length];
   uint8_t     Tx_Data[__PGM_Tx_Length];
   uint8_t     Error = 0;
   uint8_t     OpCnt = 0;
#define   __UnLock_Fail   0x01
#define   __HeadRX_Fail   0x02
#define   __Erase_Fail    0x04
#define   __Blank_Fail    0x08
#define   __Write_Fail    0x10
   TypeDef_CanRxTx  CAN_Rx0;
   TypeDef_CanRxTx  CAN_Tx;
   TypeDef_PGM PGM;

   #define     PGM_Flags      PGM.Flags.Byte
   #define     PGM_Command    PGM.Flags.Bits.b4
   #define     PGM_Sinxr      PGM.Flags.Bits.b5
   PGM_Sinxr = 1;

   // запрет всех прерываний
   __disable_irq(); // setting the I-bit in the CPSR.

   //Делаем память открытой
   if(FLASH->CR & FLASH_CR_LOCK)
   { /* Authorize the FLASH Registers access */
	 WRITE_REG(FLASH->KEYR, FLASH_KEY1);
	 WRITE_REG(FLASH->KEYR, FLASH_KEY2);
   }
   // Infinite loop
   while (1)
   {
     CAN_Receive(&CAN_Rx0, Rx_Data);
     // анализируем что приняли
     if(Rx_Data[0] == 0xAF &&
        Rx_Data[1] == 0xA0)
     { //принято STM программируется
    	   IWDG->KR = IWDG_KEY_RELOAD;  // IWDG Reload
    	   Error &= ~__HeadRX_Fail;
    	   for (i = 0; i < __PGM_Rx_Length; i++)
   	       PGM.RxData[i] = Rx_Data[i];
     	   PGM.Command =   PGM.RxData[2]; // командa
     	   PGM.SectorAdr = PGM.RxData[3]*65536 +
     	    		       PGM.RxData[4]*256 +
     					   PGM.RxData[5];
     	  __TP_On //GPIOB->BSRR = TstPoint_Pin; //	_TP_On; нельзя
     	   // проверка адреса
     	   if(PGM.SectorAdr < __PGM_StartAddres ||
     	      PGM.SectorAdr > __PGM_EndAddres)
     		  PGM.Command = 5; //ошибка
     	   else
     	   //флаг выполнение команд программирования
     	   if(PGM.Command == __Er_Command ||
     	      PGM.Command == __Wr_Command ||
     	      PGM.Command == __End_Command)
     	      PGM_Command = 1;
     }
     // выполнение команд программирования
     if(PGM_Command)
     {
       if(PGM.Command == __Er_Command)
       { //обработка команды Стирание Flash
    	 PGM_Command = 0;
#ifndef  PGM_Disable
    	 if(FLASH_Erase_Page(PGM.SectorAdr))//40mc
    		  Error |= __Erase_Fail;
    	 // Blank
    	 uint32_t Adr = PGM.SectorAdr + FLASH_BASE;
       	 while (Adr < (PGM.SectorAdr + FLASH_BASE + FLASH_PAGE_SIZE))
    	 { if(*(uint32_t*)(Adr) != 0xFFFFFFFF)
    		  Error |= __Blank_Fail;
    	   Adr +=4;
       	 }
#endif
       }
       else
       if(PGM.Command == __Wr_Command)
       { //обработка команды Запись Flash
    	 PGM_Command = 0;
    	 PGM.PaketAdr = PGM.SectorAdr;
    	 for (i = 0; i < (__SizePaketSTM/4); i++)
    	 { // Little Indian !!!!
  	       PGM.PaketData[i] = (PGM.RxData[6+i*4]  +
    	        		       PGM.RxData[7+i*4] * 256 +
    					       PGM.RxData[8+i*4] * 65536 +
    					       PGM.RxData[9+i*4] * 16777216);
    	   PGM.Adr = PGM.PaketAdr + FLASH_BASE;
#ifndef  PGM_Disable
    	   FLASH_Write_Word(PGM.Adr, PGM.PaketData[i]);
    	   // верификация
    	   if(*(uint32_t*)(PGM.Adr) != PGM.PaketData[i])
    		    Error |=  __Write_Fail;
#endif
    	   PGM.PaketAdr += 4;
    	 }
       }
     }
     OpCnt++;
 	 //здесь возврашаем команду и ошибку
 	 Tx_Data[0] = Error;
     if(Error)
    	  Tx_Data[1] = 5;
     else Tx_Data[1] = PGM.Command;

     {   for (i = 2; i < 8; i++)
  	     CAN_Tx.Data[i] = PGM.RxData[i+29]; // последний пакет данных
         CAN_Tx.Data[7] = OpCnt;
         CAN_Transmit(&CAN_Tx, Tx_Data);
     }
 	 //обработка команды Завершено
     if(PGM.Command == __End_Command)
     { // после передачи ответа
       // признак программирования для EPROM CSsum
         PGM_Sign = __PGM_Sign_Data;
         SPI1->CRCPR = 33;
         break;
     }
     __TP_Off //GPIOB->BSRR = (uint32_t)TstPoint_Pin << 16U; //_TP_Off;
   } // end Infinite loop
} // end PGM_Main()

void PGM_Main_UART(void)
{
uint8_t     Tx_Data[__PGM_Tx_Length];
    //ответ на инициализацию
	Tx_Data[0] = 0x73;
	UART_Transmit(Tx_Data, 1);//UartDIA.Tx_Len);
	PGM_UART();
} // end PGM_Main_UART()

void PGM_Main_CAN(void)
{
TypeDef_CanRxTx  CAN_Tx;
   //ответ на инициализацию
	CAN_Tx.Data[0] = __Rx_Head;
	CAN_Tx.Data[1] = __PGM_Key2;
	CAN_Tx.Data[2] = __PGM_Step2;
	CAN_Tx.Data[3] = Pgm_STM;
	CAN_Tx.Data[4] = 0x73;
	CAN_Tx.ExtId = _ExtID_make(PGM_Pri,PGM_PGN4,ECU_SA);
	Transmit_CAN_frame(&CAN_Tx);
	PGM_CAN();
} // end PGM_Main_CAN()

void Jump_To_App(void)
{ // взято из
  // Собственный Bootloader для stm32. Не запускаются прерывания

  // Function pointer for jumping to user application.
   FUN_Ptr_t jump_to_app =
	(FUN_Ptr_t)(*(volatile uint32_t*) (FLASH_APP_START_ADDRESS+4u));

   //HAL_DeInit();
   RCC->APB1RSTR = 0xFFFFFFFFU;
   RCC->APB1RSTR = 0x00;
   RCC->APB2RSTR = 0xFFFFFFFFU;
   RCC->APB2RSTR = 0x00;
   //SysTick DeInit
   SysTick->CTRL=0;
   SysTick->VAL=0;
   SysTick->LOAD=0;
   __disable_irq();
   //NVIC DeInit
   __set_BASEPRI(0);
   __set_CONTROL(0);
   NVIC->ICER[0]=0xFFFFFFFF;
   NVIC->ICPR[0]=0xFFFFFFFF;
   NVIC->ICER[1]=0xFFFFFFFF;
   NVIC->ICPR[1]=0xFFFFFFFF;
   NVIC->ICER[2]=0xFFFFFFFF;
   NVIC->ICPR[2]=0xFFFFFFFF;
   __enable_irq();
   // Change the main and local  stack pointer.
  __set_MSP(*(volatile uint32_t*)FLASH_APP_START_ADDRESS);
  // Vector Table Offset Register
   SCB->VTOR = FLASH_APP_START_ADDRESS;
   jump_to_app();
} // end Jump_To_App()

void PGM_Init(void)
{
   // Initializes the CPU, AHB and APB busses clocks
	/*------------------------------- HSE Configuration ------------------------*/
    SET_BIT(RCC->CR, RCC_CR_HSEON);
    /* Wait till HSE is ready */
    while(__HAL_RCC_GET_FLAG(RCC_FLAG_HSERDY) == RESET) {}
    /*------------------------------ LSI Configuration -------------------------*/
    /* Enable the Internal Low Speed oscillator (LSI). */
    *(__IO uint32_t *) RCC_CSR_LSION_BB = ENABLE;
	/* Wait till LSI is ready */
	while(__HAL_RCC_GET_FLAG(RCC_FLAG_LSIRDY) == RESET) {}
	/*  To have a fully stabilized clock in the specified range, a software delay of 1ms
	          should be added.*/
	DelayMs(1);
	/*-------------------------------- PLL2 Configuration -----------------------*/
    /* Disable the main PLL2. */
	*(__IO uint32_t *) RCC_CR_PLL2ON_BB = DISABLE;
    /* Wait till PLL2 is disabled */
    while(__HAL_RCC_GET_FLAG(RCC_FLAG_PLL2RDY) != RESET) {}
    /* Configure the HSE prediv2 factor --------------------------------*/
    MODIFY_REG(RCC->CFGR2, RCC_CFGR2_PREDIV2, RCC_HSE_PREDIV2_DIV2);
    /* Configure the main PLL2 multiplication factors. */
    MODIFY_REG(RCC->CFGR2, RCC_CFGR2_PLL2MUL, RCC_PLL2_MUL10);
    /* Enable the main PLL2. */
    *(__IO uint32_t *) RCC_CR_PLL2ON_BB = ENABLE;
    /* Wait till PLL2 is ready */
    while(__HAL_RCC_GET_FLAG(RCC_FLAG_PLL2RDY)  == RESET) {}
    /*-------------------------------- PLL Configuration -----------------------*/
    /* Disable the main PLL. */
    *(__IO uint32_t *) RCC_CR_PLLON_BB = DISABLE;
    /* Wait till PLL is disabled */
    while(__HAL_RCC_GET_FLAG(RCC_FLAG_PLLRDY)  != RESET) {}
    /* Set PREDIV1 source */
    SET_BIT(RCC->CFGR2, RCC_PREDIV1_SOURCE_PLL2);
    /* Configure the main PLL2 multiplication factors. */
    MODIFY_REG(RCC->CFGR2, RCC_CFGR2_PLL2MUL, RCC_PLL2_MUL10);
    /* Set PREDIV1 Value */
    MODIFY_REG(RCC->CFGR2, RCC_CFGR2_PREDIV1, RCC_HSE_PREDIV_DIV5);
    /* Configure the main PLL clock source and multiplication factors. */
    MODIFY_REG(RCC->CFGR, (RCC_CFGR_PLLSRC | RCC_CFGR_PLLMULL),
  		                (RCC_PLLSOURCE_HSE | RCC_PLL_MUL9));
    /* Enable the main PLL. */
    *(__IO uint32_t *) RCC_CR_PLLON_BB = ENABLE;
    /* Wait till PLL is ready */
    while(__HAL_RCC_GET_FLAG(RCC_FLAG_PLLRDY)  == RESET) {}

    /* Program the new number of wait states to the LATENCY bits in the FLASH_ACR register */
    uint32_t *FMC_WSEN;
    FMC_WSEN = (uint32_t*)0x400220FC;
    FLASH->KEYR = FLASH_KEY1;
    FLASH->KEYR = FLASH_KEY2;
    *FMC_WSEN = (uint32_t)1U;
    FLASH->ACR = FLASH_ACR_PRFTBE;
    FLASH->ACR &= (uint32_t)((uint32_t)~FLASH_ACR_LATENCY);
    FLASH->ACR |= (uint32_t)FLASH_LATENCY_2;
    /*-------------------------- HCLK Configuration --------------------------*/
    MODIFY_REG(RCC->CFGR, RCC_CFGR_HPRE, RCC_SYSCLK_DIV1);
    /*------------------------- SYSCLK Configuration ---------------------------*/
    MODIFY_REG(RCC->CFGR, RCC_CFGR_SW, RCC_SYSCLKSOURCE_PLLCLK);
    while ((uint32_t)(READ_BIT(RCC->CFGR,RCC_CFGR_SWS)) !=
  		   RCC_SYSCLKSOURCE_STATUS_PLLCLK) {}
    /*-------------------------- PCLK1 Configuration ---------------------------*/
    MODIFY_REG(RCC->CFGR, RCC_CFGR_PPRE1,RCC_HCLK_DIV4);
    /*-------------------------- PCLK2 Configuration ---------------------------*/
    MODIFY_REG(RCC->CFGR, RCC_CFGR_PPRE2, (RCC_HCLK_DIV2 << 3));
 //     SystemCoreClock = 72000000U;
    // ----------------------- IWDG ----------------------------------------
    IWDG->KR = IWDG_KEY_ENABLE;
    IWDG->KR = IWDG_KEY_WRITE_ACCESS_ENABLE;
    IWDG->PR = IWDG_PRESCALER_32; // Prescaler
    IWDG->RLR = 4095;             // Reload values
    /* Wait for register to be updated */
    while (IWDG->SR != RESET) { }
    /* Reload IWDG counter with value defined in the reload register */
    IWDG->KR = IWDG_KEY_RELOAD;

    uint32_t position, RegOffSet;
//__IO uint32_t *configregister = (position < 8) ? &GPIOA->CRL     : &GPIOA->CRH;
//	    uint32_t RegOffSet = (position < 8) ? (position << 2U) : ((position - 8U) << 2U);

    // GPIO Ports Clock Enable
    SET_BIT(RCC->APB2ENR, RCC_APB2ENR_IOPAEN);
    SET_BIT(RCC->APB2ENR, RCC_APB2ENR_IOPCEN);
    SET_BIT(RCC->APB2ENR, RCC_APB2ENR_USART1EN);
    SET_BIT(RCC->APB1ENR, RCC_APB1ENR_UART4EN);
#ifdef __TP1_PB2
    // TstPoint_1  GPIO Configuration
    SET_BIT(RCC->APB2ENR, RCC_APB2ENR_IOPBEN);
    position = 2; // IO position PB2 TstPoint_1
    RegOffSet = (position << 2U);
    MODIFY_REG(GPIOB->CRL, ((GPIO_CRL_MODE0 | GPIO_CRL_CNF0) << RegOffSet),
	       ((GPIO_SPEED_FREQ_LOW + GPIO_CR_CNF_GP_OUTPUT_PP) << RegOffSet));
#endif
#ifdef __TP1_PC13
    position = 13; // IO position PC13 TstPoint_1
    RegOffSet = ((position - 8U) << 2U);
    MODIFY_REG(GPIOC->CRH, ((GPIO_CRL_MODE0 | GPIO_CRL_CNF0) << RegOffSet),
	       ((GPIO_SPEED_FREQ_LOW + GPIO_CR_CNF_GP_OUTPUT_PP) << RegOffSet));
#endif
    // USART1
    // USART1 GPIO Configuration
    position = 9; // IO position PA9     ------> USART1_TX
    RegOffSet = ((position - 8U) << 2U);
    MODIFY_REG(GPIOA->CRH, ((GPIO_CRL_MODE0 | GPIO_CRL_CNF0) << RegOffSet),
	      ((GPIO_SPEED_FREQ_HIGH + GPIO_CR_CNF_AF_OUTPUT_OD) << RegOffSet));//_PP
    position = 10; // IO position PA10   ------> USART1_RX
    RegOffSet = ((position - 8U) << 2U);
    MODIFY_REG(GPIOA->CRH, ((GPIO_CRL_MODE0 | GPIO_CRL_CNF0) << RegOffSet),
	      ((GPIO_CR_MODE_INPUT + GPIO_CR_CNF_INPUT_FLOATING) << RegOffSet));
    USART1->CR1 =  UART_MODE_TX_RX;
    USART1->BRR = (uint32_t) 312U;//USART_DIV;
    USART1->CR1 |=  USART_CR1_UE;
/*
    // UART4
    // UART4 GPIO Configuration
    position = 10; // IO position PC10   ------> UART4_TX
    RegOffSet = ((position - 8U) << 2U);
    MODIFY_REG(GPIOC->CRH, ((GPIO_CRL_MODE0 | GPIO_CRL_CNF0) << RegOffSet),
	      ((GPIO_SPEED_FREQ_HIGH + GPIO_CR_CNF_AF_OUTPUT_PP) << RegOffSet));
    position = 11; // IO position PC11   ------> UART4_RX
    RegOffSet = ((position - 8U) << 2U);
    MODIFY_REG(GPIOC->CRH, ((GPIO_CRL_MODE0 | GPIO_CRL_CNF0) << RegOffSet),
	      ((GPIO_CR_MODE_INPUT + GPIO_CR_CNF_INPUT_FLOATING) << RegOffSet));
    UART4->CR1 =  UART_MODE_TX_RX;
    UART4->BRR = (uint32_t) 240U; //150000
    UART4->CR1 |=  USART_CR1_UE;
*/
    PGM_Sign = 0; //  признак программирования для EPROM CSsum
//CAN
    uint32_t tmp_mcr = 0U;
    // Peripheral clock enable
    __HAL_RCC_CAN1_CLK_ENABLE();
    // Exit from sleep mode
    CLEAR_BIT(CAN1->MCR, CAN_MCR_SLEEP);
    // Request initialisation
    SET_BIT(CAN1->MCR, CAN_MCR_INRQ);
    // Wait the acknowledge
    while(HAL_IS_BIT_CLR(CAN1->MSR, CAN_MSR_INAK)) {}
    // Check acknowledge
    if ((CAN1->MSR & CAN_MSR_INAK) == CAN_MSR_INAK)
    { // Set the automatic bus-off management
      SET_BIT(tmp_mcr, CAN_MCR_ABOM);
      // Update register MCR
      MODIFY_REG(CAN1->MCR,
                 CAN_MCR_TTCM |
                 CAN_MCR_ABOM |
                 CAN_MCR_AWUM |
                 CAN_MCR_NART |
                 CAN_MCR_RFLM |
                 CAN_MCR_TXFP,
                 tmp_mcr);
      // Set the bit timing register Fbus =36MHz
      WRITE_REG(CAN1->BTR, (uint32_t)(CAN_MODE_NORMAL |
    		                          CAN_SJW_1TQ     |
									  CAN_BS1_9TQ     |
									  CAN_BS2_8TQ     |
                                      3)); // Prescaler = 4;
      // Request leave initialisation
      CLEAR_BIT(CAN1->MCR, CAN_MCR_INRQ);
    }
    /* Wait the acknowledge */
    while(HAL_IS_BIT_SET(CAN1->MSR, CAN_MSR_INAK)) {}
    // CAN filter init
    // Configure the CAN Filter 0 for FIFO 0 accept every message
    uint32_t filternbrbitpos = 1U;// FilterNumber = 0U;

    // Initialisation mode for the filter
    // Select the start slave bank/
    MODIFY_REG(CAN1->FMR,CAN_FMR_CAN2SB,
    	                 CAN_FMR_FINIT | (uint32_t)(14U << 8U));//BankNumber = 14U;
    // Filter Deactivation
    CLEAR_BIT(CAN1->FA1R, filternbrbitpos);// FilterNumber = 0U;
    // Filter Scale
    // 32-bit scale for the filter
	SET_BIT(CAN1->FS1R, filternbrbitpos);
	// 32-bit identifier or First 32-bit identifier
	CAN1->sFilterRegister[0].FR1 = 0;//
//	       ((0x0000FFFFU & (uint32_t)0x0000) << 16U) |
//	        (0x0000FFFFU & (uint32_t)0x0000);
	// 32-bit mask or Second 32-bit identifier
	CAN1->sFilterRegister[0].FR2 = 0;//
//	       ((0x0000FFFFU & (uint32_t)0x0000) << 16U) |
//	        (0x0000FFFFU & (uint32_t)0x0000);
    // Filter ModeCAN_FILTERMODE_IDMASK
	CLEAR_BIT(CAN1->FM1R, filternbrbitpos);
    // Filter FIFO assignment  CAN_FIFO0
    CLEAR_BIT(CAN1->FFA1R, filternbrbitpos);
    // Filter activation
    SET_BIT(CAN1->FA1R, filternbrbitpos);
    // Leave the initialisation mode for the filter
    CLEAR_BIT(CAN1->FMR, ((uint32_t)CAN_FMR_FINIT));

    // Configure the CAN Tx делается в Transmit_CAN_frame()
    //	hCANJ.pTxMsg->RTR = CAN_RTR_DATA;   TIR
    // 	hCANJ.pTxMsg->IDE = CAN_ID_EXT;
    //	hCANJ.pTxMsg->DLC = 8;              TDTR
    // Configure the CAN Rx делается в Receive_CAN_frame()
    //	hCANJ.pRxMsg->IDE = CAN_ID_EXT;
    //	hCANJ.pRxMsg->DLC = 8;

    //CAN1 GPIO Configuration
    position = 11; // IO position PA11     ------> CAN1_RX
    RegOffSet = ((position - 8U) << 2U);
    MODIFY_REG(GPIOA->CRH, ((GPIO_CRL_MODE0 | GPIO_CRL_CNF0) << RegOffSet),
	      ((GPIO_CR_MODE_INPUT + GPIO_CR_CNF_INPUT_FLOATING) << RegOffSet));
    position = 12; // IO position PA12     ------> CAN1_TX
    RegOffSet = ((position - 8U) << 2U);
    MODIFY_REG(GPIOA->CRH, ((GPIO_CRL_MODE0 | GPIO_CRL_CNF0) << RegOffSet),
	      ((GPIO_SPEED_FREQ_HIGH + GPIO_CR_CNF_AF_OUTPUT_OD) << RegOffSet));

} // End PGM_Init()

void  Wait_Completed(void)
{
    /* Wait for last operation to be completed */
    while(__HAL_FLASH_GET_FLAG(FLASH_FLAG_BSY)) { }
    /* Check FLASH End of Operation flag  */
    if (__HAL_FLASH_GET_FLAG(FLASH_FLAG_EOP))
        __HAL_FLASH_CLEAR_FLAG(FLASH_FLAG_EOP);
}

uint8_t  FLASH_Erase_Page(uint32_t PageAddress)
{
	 uint32_t address = PageAddress + FLASH_BASE;//0U;

      /* Proceed to erase the page */
      SET_BIT(FLASH->CR, FLASH_CR_PER);
      WRITE_REG(FLASH->AR, address);
      SET_BIT(FLASH->CR, FLASH_CR_STRT);
      /* Wait for last operation to be completed */
      Wait_Completed();
      /* If the erase operation is completed, disable the PER Bit */
      CLEAR_BIT(FLASH->CR, FLASH_CR_PER);

      if(__HAL_FLASH_GET_FLAG(FLASH_FLAG_WRPERR)  ||
         __HAL_FLASH_GET_FLAG(FLASH_FLAG_OPTVERR) ||
         __HAL_FLASH_GET_FLAG(FLASH_FLAG_PGERR))
    	   return 1;
      else return 0;

} // end Erase_FLASH_Pages(uint32_t PageAddress)
/*
uint8_t  FLASH_Program_HalfWord(uint32_t Address, uint16_t Data)
{
    SET_BIT(FLASH->CR, FLASH_CR_PG);
	// Write data in the address
	*(__IO uint16_t*)Address = Data;
    // Wait for last operation to be completed
    Wait_Completed();
    // If the program operation is completed, disable the PG Bit
    CLEAR_BIT(FLASH->CR, FLASH_CR_PG);
    if(__HAL_FLASH_GET_FLAG(FLASH_FLAG_WRPERR)  ||
       __HAL_FLASH_GET_FLAG(FLASH_FLAG_OPTVERR) ||
       __HAL_FLASH_GET_FLAG(FLASH_FLAG_PGERR))
  	     return 1;
    else return 0;
}
*/
void  FLASH_Write_Word(uint32_t Address, uint32_t Data)
{
	  uint8_t index = 0;
	  uint32_t Addr;
	  uint32_t Dat;

    for (index = 0U; index < FLASH_TYPEPROGRAM_WORD; index++)
    {
      /* Proceed to program the new data */
      SET_BIT(FLASH->CR, FLASH_CR_PG);
      /* Write data in the address */
      Addr = Address + (2U*index);
      Dat = (uint16_t)(Data >> (16U*index));
      *(__IO uint16_t*)(Addr) = Dat;
      /* Wait for last operation to be completed */
      Wait_Completed();
      /* If the program operation is completed, disable the PG Bit */
      CLEAR_BIT(FLASH->CR, FLASH_CR_PG);
      /* In case of error, stop programation procedure */
    }
} // end FLASH_Write_Word()

void UART_Transmit(uint8_t *TxData, uint16_t Size)
{
	uint8_t *pData = TxData; // pData: Pointer to data buffer
	uint16_t Count = 0;
	// запрет приемника
	USART1->CR1 &= ~UART_MODE_RX;

    while(Count++ < Size)
    {
      while(!(USART1->SR & USART_SR_TXE)){}; //Проверка завершения передачи предыдущих данных
      USART1->DR = (*pData++ & (uint8_t)0xFF);
    }
    while(!(USART1->SR & USART_SR_TC));
    // разрешение приемника
    USART1->CR1 |= UART_MODE_RX;

} // end UART_Transmit()

void UART_Receive(uint8_t *RxData, uint8_t pBuff, uint16_t Size)
{
	uint8_t *pData = RxData + pBuff; // pData: Pointer to data buffer
	uint16_t Count = 0;//Size;

    /* Check the remain data to be received */
    while(Count++ < Size)
    {
      while(!(USART1->SR & USART_SR_RXNE)){}; //Ждем поступления данных
      *pData++ = (uint8_t)(USART1->DR & (uint8_t)0x00FF);
      USART1->SR &=~ USART_SR_RXNE;
    }
}  // end UART_Receive()

/**
  * @brief  This function provides delay (in milliseconds) based on CPU cycles method.
  * @param  mdelay: specifies the delay time length, in milliseconds.
  * @retval None
  */
//static
void DelayMs(uint32_t mdelay)
{
  __IO uint32_t Delay = mdelay * (SystemCoreClock / 19500U);
  do  {__ASM volatile ("nop"); }
  while (Delay --);
}

/*****END OF FILE****/

