/**
  ******************************************************************************
  * @file           : main.h
  * @brief          : Header for main.c file.
  *                   This file contains the common defines of the application.
  ******************************************************************************
  ** This notice applies to any and all portions of this file
  * that are not between comment pairs USER CODE BEGIN and
  * USER CODE END. Other portions of this file, whether 
  * inserted by the user or by software development tools
  * are owned by their respective copyright owners.
  *
  * COPYRIGHT(c) 2025 STMicroelectronics
  *
  * Redistribution and use in source and binary forms, with or without modification,
  * are permitted provided that the following conditions are met:
  *   1. Redistributions of source code must retain the above copyright notice,
  *      this list of conditions and the following disclaimer.
  *   2. Redistributions in binary form must reproduce the above copyright notice,
  *      this list of conditions and the following disclaimer in the documentation
  *      and/or other materials provided with the distribution.
  *   3. Neither the name of STMicroelectronics nor the names of its contributors
  *      may be used to endorse or promote products derived from this software
  *      without specific prior written permission.
  *
  * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
  * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
  * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
  * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
  * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  *
  ******************************************************************************
  */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MAIN_H__
#define __MAIN_H__

/* Includes ------------------------------------------------------------------*/

/* USER CODE BEGIN Includes */
void SystemClock_Config(void);
/* USER CODE END Includes */

/* Private define ------------------------------------------------------------*/

#define EVRL_Pin GPIO_PIN_14
#define EVRL_GPIO_Port GPIOC
#define AVRL_Pin GPIO_PIN_15
#define AVRL_GPIO_Port GPIOC
#define A_SW_TSET_Pin GPIO_PIN_0
#define A_SW_TSET_GPIO_Port GPIOC
#define A_SW_ASR_Pin GPIO_PIN_1
#define A_SW_ASR_GPIO_Port GPIOC
#define A_BPS2_Pin GPIO_PIN_2
#define A_BPS2_GPIO_Port GPIOC
#define STA_GNDR_Pin GPIO_PIN_3
#define STA_GNDR_GPIO_Port GPIOC
#define STA_LASR_Pin GPIO_PIN_0
#define STA_LASR_GPIO_Port GPIOA
#define STA_DIFR_Pin GPIO_PIN_1
#define STA_DIFR_GPIO_Port GPIOA
#define STA_EVT_Pin GPIO_PIN_2
#define STA_EVT_GPIO_Port GPIOA
#define STA_DIFT_Pin GPIO_PIN_3
#define STA_DIFT_GPIO_Port GPIOA
#define STA_EV_RL_Pin GPIO_PIN_4
#define STA_EV_RL_GPIO_Port GPIOA
#define STA_AV_RL_Pin GPIO_PIN_5
#define STA_AV_RL_GPIO_Port GPIOA
#define STA_EV_RR_Pin GPIO_PIN_6
#define STA_EV_RR_GPIO_Port GPIOA
#define STA_AV_RR_Pin GPIO_PIN_7
#define STA_AV_RR_GPIO_Port GPIOA
#define A1_S2R_Pin GPIO_PIN_4
#define A1_S2R_GPIO_Port GPIOC
#define A2_S2R_Pin GPIO_PIN_5
#define A2_S2R_GPIO_Port GPIOC
#define A2_S2L_Pin GPIO_PIN_0
#define A2_S2L_GPIO_Port GPIOB
#define A1_S2L_Pin GPIO_PIN_1
#define A1_S2L_GPIO_Port GPIOB
#define TstPoint_2_Pin GPIO_PIN_2
#define TstPoint_2_GPIO_Port GPIOB
#define IN_B7_Pin GPIO_PIN_10
#define IN_B7_GPIO_Port GPIOB
#define RELE_D2_Pin GPIO_PIN_11
#define RELE_D2_GPIO_Port GPIOB
#define EVRR_Pin GPIO_PIN_14
#define EVRR_GPIO_Port GPIOB
#define AVRR_Pin GPIO_PIN_15
#define AVRR_GPIO_Port GPIOB
#define SEN_2L_Pin GPIO_PIN_6
#define SEN_2L_GPIO_Port GPIOC
#define SEN_2R_Pin GPIO_PIN_7
#define SEN_2R_GPIO_Port GPIOC
#define IN_GNDR_Pin GPIO_PIN_8
#define IN_GNDR_GPIO_Port GPIOC
#define IN_DIFT_Pin GPIO_PIN_9
#define IN_DIFT_GPIO_Port GPIOC
#define IN_EVT_Pin GPIO_PIN_8
#define IN_EVT_GPIO_Port GPIOA
#define Kline_TX_Pin GPIO_PIN_9
#define Kline_TX_GPIO_Port GPIOA
#define Kline_RX_Pin GPIO_PIN_10
#define Kline_RX_GPIO_Port GPIOA
#define CANTL_EN_Pin GPIO_PIN_15
#define CANTL_EN_GPIO_Port GPIOA
#define SCI_TX_Pin GPIO_PIN_10
#define SCI_TX_GPIO_Port GPIOC
#define SCI_RX_Pin GPIO_PIN_11
#define SCI_RX_GPIO_Port GPIOC
#define CANTH_EN_Pin GPIO_PIN_12
#define CANTH_EN_GPIO_Port GPIOC
#define CS_ICM_Pin GPIO_PIN_2
#define CS_ICM_GPIO_Port GPIOD
#define SCK_ICM_Pin GPIO_PIN_3
#define SCK_ICM_GPIO_Port GPIOB
#define MISO_ICM_Pin GPIO_PIN_4
#define MISO_ICM_GPIO_Port GPIOB
#define MOSI_ICM_Pin GPIO_PIN_5
#define MOSI_ICM_GPIO_Port GPIOB
#define INT_ICM_Pin GPIO_PIN_6
#define INT_ICM_GPIO_Port GPIOB
#define IN_DIFR_Pin GPIO_PIN_8
#define IN_DIFR_GPIO_Port GPIOB
#define IN_LASR_Pin GPIO_PIN_9
#define IN_LASR_GPIO_Port GPIOB

//#define PB2_Pin GPIO_PIN_2
//#define PB2_GPIO_Port GPIOB    !Red
#define MC2_TX_Pin       GPIO_PIN_13
#define MC2_TX_GPIO_Port GPIOC
#define MC2_RX_Pin       GPIO_PIN_7
#define MC2_RX_GPIO_Port GPIOB
#define PB7_EXTI_IRQn EXTI9_5_IRQn
/* ########################## Assert Selection ############################## */
/**
  * @brief Uncomment the line below to expanse the "assert_param" macro in the 
  *        HAL drivers code
  */
/* #define USE_FULL_ASSERT    1U */

/* USER CODE BEGIN Private defines */
#define MCx_TX_Pin       MC2_TX_Pin   // PB2
#define MCx_TX_GPIO_Port MC2_TX_GPIO_Port
#define MCx_RX_Pin       MC2_RX_Pin   // PB7
#define MCx_RX_GPIO_Port MC2_RX_GPIO_Port

/* USER CODE END Private defines */

#ifdef __cplusplus
 extern "C" {
#endif
void _Error_Handler(char *, int);

#define Error_Handler() _Error_Handler(__FILE__, __LINE__)
#ifdef __cplusplus
}
#endif

#endif /* __MAIN_H__ */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
