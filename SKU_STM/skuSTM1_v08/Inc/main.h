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

#define EVFL_Pin GPIO_PIN_14
#define EVFL_GPIO_Port GPIOC
#define AVFL_Pin GPIO_PIN_15
#define AVFL_GPIO_Port GPIOC
#define STA_GNDF_Pin GPIO_PIN_0
#define STA_GNDF_GPIO_Port GPIOC
#define A_SW_ABS_Pin GPIO_PIN_1
#define A_SW_ABS_GPIO_Port GPIOC
#define STA_KL15_Pin GPIO_PIN_2
#define STA_KL15_GPIO_Port GPIOC
#define A_BPS1_Pin GPIO_PIN_3
#define A_BPS1_GPIO_Port GPIOC
#define STA_WL_Pin GPIO_PIN_0
#define STA_WL_GPIO_Port GPIOA
#define STA_DBR_Pin GPIO_PIN_1
#define STA_DBR_GPIO_Port GPIOA
#define STA_SILA_Pin GPIO_PIN_2
#define STA_SILA_GPIO_Port GPIOA
#define STA_DIFF_Pin GPIO_PIN_3
#define STA_DIFF_GPIO_Port GPIOA
#define STA_EV_FL_Pin GPIO_PIN_4
#define STA_EV_FL_GPIO_Port GPIOA
#define STA_AV_FL_Pin GPIO_PIN_5
#define STA_AV_FL_GPIO_Port GPIOA
#define STA_EV_FR_Pin GPIO_PIN_6
#define STA_EV_FR_GPIO_Port GPIOA
#define STA_AV_FR_Pin GPIO_PIN_7
#define STA_AV_FR_GPIO_Port GPIOA
#define A1_S1R_Pin GPIO_PIN_4
#define A1_S1R_GPIO_Port GPIOC
#define A2_S1R_Pin GPIO_PIN_5
#define A2_S1R_GPIO_Port GPIOC
#define A2_S1L_Pin GPIO_PIN_0
#define A2_S1L_GPIO_Port GPIOB
#define A1_S1L_Pin GPIO_PIN_1
#define A1_S1L_GPIO_Port GPIOB
#define TstPoint_1_Pin GPIO_PIN_2
#define TstPoint_1_GPIO_Port GPIOB
#define EN_5V_Pin GPIO_PIN_10
#define EN_5V_GPIO_Port GPIOB
#define RELE_D1_Pin GPIO_PIN_11
#define RELE_D1_GPIO_Port GPIOB
#define EVFR_Pin GPIO_PIN_14
#define EVFR_GPIO_Port GPIOB
#define AVFR_Pin GPIO_PIN_15
#define AVFR_GPIO_Port GPIOB
#define SEN_1L_Pin GPIO_PIN_6
#define SEN_1L_GPIO_Port GPIOC
#define SEN_1R_Pin GPIO_PIN_7
#define SEN_1R_GPIO_Port GPIOC
#define IN_GNDF_Pin GPIO_PIN_8
#define IN_GNDF_GPIO_Port GPIOC
#define Kline_TX_Pin GPIO_PIN_9
#define Kline_TX_GPIO_Port GPIOA
#define Kline_RX_Pin GPIO_PIN_10
#define Kline_RX_GPIO_Port GPIOA
#define SCI_TX_Pin GPIO_PIN_10
#define SCI_TX_GPIO_Port GPIOC
#define SCI_RX_Pin GPIO_PIN_11
#define SCI_RX_GPIO_Port GPIOC
#define WP_EPROM_Pin GPIO_PIN_12
#define WP_EPROM_GPIO_Port GPIOC
#define CS_EPROM_Pin GPIO_PIN_2
#define CS_EPROM_GPIO_Port GPIOD
#define SCK_EPROM_Pin GPIO_PIN_3
#define SCK_EPROM_GPIO_Port GPIOB
#define MISO_EPROM_Pin GPIO_PIN_4
#define MISO_EPROM_GPIO_Port GPIOB
#define MOSI_EPROM_Pin GPIO_PIN_5
#define MOSI_EPROM_GPIO_Port GPIOB
#define IN_DIFF_Pin GPIO_PIN_7
#define IN_DIFF_GPIO_Port GPIOB
#define IN_DBR_Pin GPIO_PIN_8
#define IN_DBR_GPIO_Port GPIOB
#define IN_WL_Pin GPIO_PIN_9
#define IN_WL_GPIO_Port GPIOB

#define MC1_TX_Pin        GPIO_PIN_8
#define MC1_TX_GPIO_Port  GPIOA
#define MC1_RX_Pin        GPIO_PIN_6
#define MC1_RX_GPIO_Port  GPIOB
#define PB6_EXTI_IRQn EXTI9_5_IRQn
/* ########################## Assert Selection ############################## */
/**
  * @brief Uncomment the line below to expanse the "assert_param" macro in the 
  *        HAL drivers code
  */
/* #define USE_FULL_ASSERT    1U */

/* USER CODE BEGIN Private defines */
#define MCx_TX_Pin       MC1_TX_Pin      // PA8
#define MCx_TX_GPIO_Port MC1_TX_GPIO_Port
#define MCx_RX_Pin       MC1_RX_Pin      // PB6
#define MCx_RX_GPIO_Port MC1_RX_GPIO_Port
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
