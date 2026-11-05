/*
 * Invense_Sensor.h
 *
 *  Created on: 4 îêò. 2017 ã.
 *      Author: Àäìèíèñòðàòîð
 */

#ifndef INVENSE_SENSOR_H_
#define INVENSE_SENSOR_H_

//#define  MPU6000
//#define  MPU6500


//#define  ICM20689
#define  ICM20602

#if defined(ICM20602)
#include "ICM20602.h"
#endif

#if defined(MPU6500)
#include "MPU6500.h"
#define SELF_TEST_X_GYRO		MPU6500_RA_ST_X_GYRO
#define SELF_TEST_Y_GYRO		MPU6500_RA_ST_Y_GYRO
#define SELF_TEST_Z_GYRO		MPU6500_RA_ST_Z_GYRO
#define SELF_TEST_X_ACCEL 		MPU6500_RA_ST_X_ACCEL
#define SELF_TEST_Y_ACCEL		MPU6500_RA_ST_Y_ACCEL
#define SELF_TEST_Z_ACCEL		MPU6500_RA_ST_Z_ACCEL
#define XG_OFFSET_H 			MPU6500_RA_XG_OFFS_USRH
#define XG_OFFSET_L 			MPU6500_RA_XG_OFFS_USRL
#define YG_OFFSET_H				MPU6500_RA_YG_OFFS_USRH
#define YG_OFFSET_L 			MPU6500_RA_YG_OFFS_USRL
#define ZG_OFFSET_H				MPU6500_RA_ZG_OFFS_USRH
#define ZG_OFFSET_L				MPU6500_RA_ZG_OFFS_USRL
#define SMPLRT_DIV				MPU6500_RA_SMPLRT_DIV
#define CONFIG					MPU6500_RA_CONFIG
#define GYRO_CONFIG				MPU6500_RA_GYRO_CONFIG
#define ACCEL_CONFIG			MPU6500_RA_ACCEL_CONFIG
#define ACCEL_CONFIG_2			MPU6500_RA_ACCEL_CONFIG_2
#define LP_ACCEL_ODR			MPU6500_RA_LP_ACCEL_ODR
#define WOM_THR					MPU6500_RA_WOM_THR
#define FIFO_EN					MPU6500_RA_FIFO_EN
#define I2C_MST_CTRL			MPU6500_RA_I2C_MST_CTRL
#define I2C_SLV0_ADDR			MPU6500_RA_I2C_SLV0_ADDR
#define I2C_SLV0_REG     		MPU6500_RA_I2C_SLV0_REG
#define I2C_SLV0_CTRL    		MPU6500_RA_I2C_SLV0_CTRL
#define I2C_SLV1_ADDR			MPU6500_RA_I2C_SLV1_ADDR
#define I2C_SLV1_REG			MPU6500_RA_I2C_SLV1_REG
#define I2C_SLV1_CTRL			MPU6500_RA_I2C_SLV1_CTRL
#define I2C_SLV2_ADDR			MPU6500_RA_I2C_SLV2_ADDR
#define I2C_SLV2_REG     		MPU6500_RA_I2C_SLV2_REG
#define I2C_SLV2_CTRL   		MPU6500_RA_I2C_SLV2_CTRL
#define I2C_SLV3_ADDR			MPU6500_RA_I2C_SLV3_ADDR
#define I2C_SLV3_REG			MPU6500_RA_I2C_SLV3_REG
#define I2C_SLV3_CTRL			MPU6500_RA_I2C_SLV3_CTRL
#define I2C_SLV4_ADDR			MPU6500_RA_I2C_SLV4_ADDR
#define I2C_SLV4_REG			MPU6500_RA_I2C_SLV4_REG
#define I2C_SLV4_DO   			MPU6500_RA_I2C_SLV4_DO
#define I2C_SLV4_CTRL  			MPU6500_RA_I2C_SLV4_CTRL
#define I2C_SLV4_DI				MPU6500_RA_I2C_SLV4_DI
#define I2C_MST_STATUS			MPU6500_RA_I2C_MST_STATUS
#define INT_PIN_CFG				MPU6500_RA_INT_PIN_CFG
#define INT_ENABLE				MPU6500_RA_INT_ENABLE
#define DMP_INT_STATUS			MPU6500_RA_DMP_INT_STATUS
#define INT_STATUS				MPU6500_RA_INT_STATUS
#define ACCEL_XOUT_H			MPU6500_RA_ACCEL_XOUT_H
#define ACCEL_XOUT_L			MPU6500_RA_ACCEL_XOUT_L
#define ACCEL_YOUT_H			MPU6500_RA_ACCEL_YOUT_H
#define ACCEL_YOUT_L			MPU6500_RA_ACCEL_YOUT_L
#define ACCEL_ZOUT_H			MPU6500_RA_ACCEL_ZOUT_H
#define ACCEL_ZOUT_L			MPU6500_RA_ACCEL_ZOUT_L
#define TEMP_OUT_H				MPU6500_RA_TEMP_OUT_H
#define TEMP_OUT_L				MPU6500_RA_TEMP_OUT_L
#define GYRO_XOUT_H				MPU6500_RA_GYRO_XOUT_H
#define GYRO_XOUT_L				MPU6500_RA_GYRO_XOUT_L
#define GYRO_YOUT_H				MPU6500_RA_GYRO_YOUT_H
#define GYRO_YOUT_L				MPU6500_RA_GYRO_YOUT_L
#define GYRO_ZOUT_H				MPU6500_RA_GYRO_ZOUT_H
#define GYRO_ZOUT_L				MPU6500_RA_GYRO_ZOUT_L
#define EXT_SENS_DATA_00		MPU6500_RA_EXT_SENS_DATA_00
#define EXT_SENS_DATA_01		MPU6500_RA_EXT_SENS_DATA_01
#define EXT_SENS_DATA_02		MPU6500_RA_EXT_SENS_DATA_02
#define EXT_SENS_DATA_03		MPU6500_RA_EXT_SENS_DATA_03
#define EXT_SENS_DATA_04		MPU6500_RA_EXT_SENS_DATA_04
#define EXT_SENS_DATA_05		MPU6500_RA_EXT_SENS_DATA_05
#define EXT_SENS_DATA_06		MPU6500_RA_EXT_SENS_DATA_06
#define EXT_SENS_DATA_07		MPU6500_RA_EXT_SENS_DATA_07
#define EXT_SENS_DATA_08		MPU6500_RA_EXT_SENS_DATA_08
#define EXT_SENS_DATA_09		MPU6500_RA_EXT_SENS_DATA_09
#define EXT_SENS_DATA_10		MPU6500_RA_EXT_SENS_DATA_10
#define EXT_SENS_DATA_11		MPU6500_RA_EXT_SENS_DATA_11
#define EXT_SENS_DATA_12		MPU6500_RA_EXT_SENS_DATA_12
#define EXT_SENS_DATA_13		MPU6500_RA_EXT_SENS_DATA_13
#define EXT_SENS_DATA_14		MPU6500_RA_EXT_SENS_DATA_14
#define EXT_SENS_DATA_15		MPU6500_RA_EXT_SENS_DATA_15
#define EXT_SENS_DATA_16		MPU6500_RA_EXT_SENS_DATA_16
#define EXT_SENS_DATA_17		MPU6500_RA_EXT_SENS_DATA_17
#define EXT_SENS_DATA_18		MPU6500_RA_EXT_SENS_DATA_18
#define EXT_SENS_DATA_19		MPU6500_RA_EXT_SENS_DATA_19
#define EXT_SENS_DATA_20		MPU6500_RA_EXT_SENS_DATA_20
#define EXT_SENS_DATA_21		MPU6500_RA_EXT_SENS_DATA_21
#define EXT_SENS_DATA_22		MPU6500_RA_EXT_SENS_DATA_22
#define EXT_SENS_DATA_23		MPU6500_RA_EXT_SENS_DATA_23
#define MOT_DETECT_STATUS		MPU6500_RA_MOT_DETECT_STATUS
#define I2C_SLV0_DO				MPU6500_RA_I2C_SLV0_DO
#define I2C_SLV1_DO				MPU6500_RA_I2C_SLV1_DO
#define I2C_SLV2_DO				MPU6500_RA_I2C_SLV2_DO
#define I2C_SLV3_DO				MPU6500_RA_I2C_SLV3_DO
#define I2C_MST_DELAY_CTRL		MPU6500_RA_I2C_MST_DELAY_CTRL
#define SIGNAL_PATH_RESET		MPU6500_RA_SIGNAL_PATH_RESET
#define ACCEL_INTEL_CTRL		MPU6500_RA_MOT_DETECT_CTRL
#define USER_CTRL				MPU6500_RA_USER_CTRL
#define PWR_MGMT_1				MPU6500_RA_PWR_MGMT_1
#define PWR_MGMT_2				MPU6500_RA_PWR_MGMT_2
#define BANK_SEL				MPU6500_RA_BANK_SEL
#define MEM_START_ADDR			MPU6500_RA_MEM_START_ADDR
#define MEM_R_W					MPU6500_RA_MEM_R_W
#define DMP_CFG_1				MPU6500_RA_DMP_CFG_1
#define DMP_CFG_2				MPU6500_RA_DMP_CFG_2
#define FIFO_COUNTH				MPU6500_RA_FIFO_COUNTH
#define FIFO_COUNTL				MPU6500_RA_FIFO_COUNTL
#define FIFO_R_W				MPU6500_RA_FIFO_R_W
#define WHO_AM_I				MPU6500_RA_WHO_AM_I
#define XA_OFFSET_H				MPU6500_RA_XA_OFFSET_H
#define XA_OFFSET_L				MPU6500_RA_XA_OFFSET_L
#define YA_OFFSET_H				MPU6500_RA_YA_OFFSET_H
#define YA_OFFSET_L				MPU6500_RA_YA_OFFSET_L
#define ZA_OFFSET_H				MPU6500_RA_ZA_OFFSET_H
#define ZA_OFFSET_L				MPU6500_RA_ZA_OFFSET_L
// MPU-6500
//Room Temperature Offset = 0 (21°C)
//Temp_Sensitivity = 333.87 LSB/°C
#define INV_TEMP_Sensitivity  334
#define INV_TEMP_Offset       21
#endif /* MPU6500 */

#ifdef ICM20689
#include "ICM20689.h"
#define SELF_TEST_X_GYRO		ICM20689_RA_ST_X_GYRO
#define SELF_TEST_Y_GYRO		ICM20689_RA_ST_Y_GYRO
#define SELF_TEST_Z_GYRO		ICM20689_RA_ST_Z_GYRO
#define SELF_TEST_X_ACCEL 		ICM20689_RA_ST_X_ACCEL
#define SELF_TEST_Y_ACCEL		ICM20689_RA_ST_Y_ACCEL
#define SELF_TEST_Z_ACCEL		MICM20689_RA_ST_Z_ACCEL
#define XG_OFFSET_H 			ICM20689_RA_XG_OFFS_USRH
#define XG_OFFSET_L 			ICM20689_RA_XG_OFFS_USRL
#define YG_OFFSET_H				ICM20689_RA_YG_OFFS_USRH
#define YG_OFFSET_L 			ICM20689_RA_YG_OFFS_USRL
#define ZG_OFFSET_H				ICM20689_RA_ZG_OFFS_USRH
#define ZG_OFFSET_L				ICM20689_RA_ZG_OFFS_USRL
#define SMPLRT_DIV				ICM20689_RA_SMPLRT_DIV
#define CONFIG					ICM20689_RA_CONFIG
#define GYRO_CONFIG				ICM20689_RA_GYRO_CONFIG
#define ACCEL_CONFIG			ICM20689_RA_ACCEL_CONFIG
#define ACCEL_CONFIG_2			ICM20689_RA_ACCEL_CONFIG_2
#define LP_LP_MODE_CFG			ICM20689_RA_LP_MODE_CFG
#define WOM_THR					ICM20689_RA_WOM_THR
#define FIFO_EN					ICM20689_RA_FIFO_EN
#define FSINC_INT				ICM20689_RA_FSINC_INT
#define INT_PIN_CFG				ICM20689_RA_INT_PIN_CFG
#define INT_ENABLE				ICM20689_RA_INT_ENABLE
#define DMP_INT_STATUS			ICM20689_RA_DMP_INT_STATUS
#define INT_STATUS				ICM20689_RA_INT_STATUS
#define ACCEL_XOUT_H			ICM20689_RA_ACCEL_XOUT_H
#define ACCEL_XOUT_L			ICM20689_RA_ACCEL_XOUT_L
#define ACCEL_YOUT_H			ICM20689_RA_ACCEL_YOUT_H
#define ACCEL_YOUT_L			ICM20689_RA_ACCEL_YOUT_L
#define ACCEL_ZOUT_H			ICM20689_RA_ACCEL_ZOUT_H
#define ACCEL_ZOUT_L			ICM20689_RA_ACCEL_ZOUT_L
#define TEMP_OUT_H				ICM20689_RA_TEMP_OUT_H
#define TEMP_OUT_L				ICM20689_RA_TEMP_OUT_L
#define GYRO_XOUT_H				ICM20689_RA_GYRO_XOUT_H
#define GYRO_XOUT_L				ICM20689_RA_GYRO_XOUT_L
#define GYRO_YOUT_H				ICM20689_RA_GYRO_YOUT_H
#define GYRO_YOUT_L				ICM20689_RA_GYRO_YOUT_L
#define GYRO_ZOUT_H				ICM20689_RA_GYRO_ZOUT_H
#define GYRO_ZOUT_L				ICM20689_RA_GYRO_ZOUT_L
#define SIGNAL_PATH_RESET		ICM20689_RA_SIGNAL_PATH_RESET
#define ACCEL_INTEL_CTRL		ICM20689_RA_ACCEL_INTEL_CTRL
#define USER_CTRL				ICM20689_RA_USER_CTRL
#define PWR_MGMT_1				ICM20689_RA_PWR_MGMT_1
#define PWR_MGMT_2				ICM20689_RA_PWR_MGMT_2
#define FIFO_COUNTH				ICM20689_RA_FIFO_COUNTH
#define FIFO_COUNTL				ICM20689_RA_FIFO_COUNTL
#define FIFO_R_W				ICM20689_RA_FIFO_R_W
#define WHO_AM_I				ICM20689_RA_WHO_AM_I
#define XA_OFFSET_H				ICM20689_RA_XA_OFFSET_H
#define XA_OFFSET_L				ICM20689_RA_XA_OFFSET_L
#define YA_OFFSET_H				ICM20689_RA_YA_OFFSET_H
#define YA_OFFSET_L				ICM20689_RA_YA_OFFSET_L
#define ZA_OFFSET_H				ICM20689_RA_ZA_OFFSET_H
#define ZA_OFFSET_L				ICM20689_RA_ZA_OFFSET_L
//IAM-20680//ICM-20689
//Room Temperature Offset = 0 (25°C)
//Temp_Sensitivity = 326.8 LSB/°C
#define INV_TEMP_Sensitivity  327
#define INV_TEMP_Offset       25
#endif /* ICM20689 */

#if defined(MPU6000)
#include "MPU6000.h"
#define SELF_TEST_X 		MPU6000_RA_SELF_TEST_X
#define SELF_TEST_Y			MPU6000_RA_SELF_TEST_Y
#define SELF_TEST_Z			MPU6000_RA_SELF_TEST_Z
#define SELF_TEST_A			MPU6000_RA_SELF_TEST_A

#define SMPLRT_DIV			MPU6000_RA_SMPLRT_DIV
#define CONFIG				MPU6000_RA_CONFIG
#define GYRO_CONFIG			MPU6000_RA_GYRO_CONFIG
#define ACCEL_CONFIG		MPU6000_RA_ACCEL_CONFIG

#define FIFO_EN				MPU6000_RA_FIFO_EN

#define INT_PIN_CFG			MPU6000_RA_INT_PIN_CFG
#define INT_ENABLE			MPU6000_RA_INT_ENABLE

#define INT_STATUS			MPU6000_RA_INT_STATUS
#define ACCEL_XOUT_H		MPU6000_RA_ACCEL_XOUT_H
#define ACCEL_XOUT_L		MPU6000_RA_ACCEL_XOUT_L
#define ACCEL_YOUT_H		MPU6000_RA_ACCEL_YOUT_H
#define ACCEL_YOUT_L		MPU6000_RA_ACCEL_YOUT_L
#define ACCEL_ZOUT_H		MPU6000_RA_ACCEL_ZOUT_H
#define ACCEL_ZOUT_L		MPU6000_RA_ACCEL_ZOUT_L
#define TEMP_OUT_H			MPU6000_RA_TEMP_OUT_H
#define TEMP_OUT_L			MPU6000_RA_TEMP_OUT_L
#define GYRO_XOUT_H			MPU6000_RA_GYRO_XOUT_H
#define GYRO_XOUT_L			MPU6000_RA_GYRO_XOUT_L
#define GYRO_YOUT_H			MPU6000_RA_GYRO_YOUT_H
#define GYRO_YOUT_L			MPU6000_RA_GYRO_YOUT_L
#define GYRO_ZOUT_H			MPU6000_RA_GYRO_ZOUT_H
#define GYRO_ZOUT_L			MPU6000_RA_GYRO_ZOUT_L

#define SIGNAL_PATH_RESET	MPU6000_RA_SIGNAL_PATH_RESET

#define USER_CTRL			MPU6000_RA_USER_CTRL
#define PWR_MGMT_1			MPU6000_RA_PWR_MGMT_1
#define PWR_MGMT_2			MPU6000_RA_PWR_MGMT_2

#define FIFO_COUNTH			MPU6000_RA_FIFO_COUNTH
#define FIFO_COUNTL			MPU6000_RA_FIFO_COUNTL
#define FIFO_R_W			MPU6000_RA_FIFO_R_W
#define WHO_AM_I			MPU6000_RA_WHO_AM_I

#endif /* MPU6000 */

/* Configuration mask MPU6500 */
/*
 * 		SMPLRT_DIV
 * */
/* The data output rate of the DLPF filter block
 * can be further reduced by a factor of 1/(1+SMPLRT_DIV)
 */
#define ODR_1000HZ						0x00
#define ODR_500HZ						0x01
#define ODR_330HZ						0x02	//?
#define ODR_250HZ						0x03
#define ODR_125HZ						0x07

/*
 * 		CONFIG
 * */
#define FIFO_overWrite					0x00
#define FIFO_notWrite					0x40
#define EXT_SYNC_disable				0x00
#define EXT_SYNC_TEMP					0x08
#define EXT_SYNC_GYRO_X 				0x10
#define EXT_SYNC_GYRO_Y 				0x18
#define EXT_SYNC_GYRO_Z 				0x20
#define EXT_SYNC_ACCEL_X				0x28
#define EXT_SYNC_ACCEL_Y				0x30
#define EXT_SYNC_ACCEL_Z				0x38
//DLPF is configured by DLPF_CFG, when FCHOICE_B [1:0] = 2b’00
#define GYRO_DLPF_CFG_250HZ_NOLPF2  	0x00 //Fs 8kHz
#define GYRO_DLPF_CFG_184HZ         	0x01 //Fs 1kHz
#define GYRO_DLPF_CFG_92HZ          	0x02
#define GYRO_DLPF_CFG_41HZ          	0x03
#define GYRO_DLPF_CFG_20HZ          	0x04
#define GYRO_DLPF_CFG_10HZ          	0x05
#define GYRO_DLPF_CFG_5HZ           	0x06
#define GYRO_DLPF_CFG_3600HZ_NOLPF  	0x07 //Fs 8kHz
/*
 * 		GYRO_CONFIG
 * */
#define XG_ST						  	0x80 // X Gyro self-test
#define YG_ST						  	0x40 // Y Gyro self-test
#define ZG_ST						  	0x20 // Z Gyro self-test
#define GYRO_FS_250DPS			  	    0x00
#define GYRO_FS_500DPS			  	    0x08
#define GYRO_FS_1000DPS			  	    0x10
#define GYRO_FS_2000DPS			  	    0x18
#define GYRO_bypass1_DLPF		  	    0x01 // Bandwidth 8800Hz
#define GYRO_bypass2_DLPF		  	    0x02 // Bandwidth 3600Hz
/*
 * 		ACCEL_CONFIG
 * */
#define XA_ST						  	0x80 // X Accel self-test
#define YA_ST						  	0x40 // Y Accel self-test
#define ZA_ST						  	0x20 // Z Accel self-test
#define ACCEL_FS_2G			  	    	0x00
#define ACCEL_FS_4G			  	    	0x08
#define ACCEL_FS_8G			    		0x10
#define ACCEL_FS_16G			    	0x18
/*
 * 		ACCEL_CONFIG_2
 * */
#define ACCEL_DLPF		  	    		0x00
#define ACCEL_bypass_DLPF		  	    0x08 // Bandwidth 1130Hz
#define ACCEL_DLPF_CFG_460HZ_NOLPF2  	0x00 //Fs 1kHz
#define ACCEL_DLPF_CFG_184HZ         	0x01 //Fs 1kHz
#define ACCEL_DLPF_CFG_92HZ          	0x02
#define ACCEL_DLPF_CFG_41HZ          	0x03
#define ACCEL_DLPF_CFG_20HZ          	0x04
#define ACCEL_DLPF_CFG_10HZ          	0x05
#define ACCEL_DLPF_CFG_5HZ           	0x06
#define ACCEL_DLPF_CFG_460HZ_NOLPF  	0x07 //Fs 1kHz
/*
 * 		FIFO_EN
 * */
#define FIFO_disable	  	    		0x00
#define TEMP_FIFO_EN	  	    		0x80
#define GYRO_X_FIFO_EN	  	    		0x40
#define GYRO_Y_FIFO_EN	  	    		0x20
#define GYRO_Z_FIFO_EN	  	    		0x10
#define GYRO_FIFO_EN	  	    		0x10
#define ACCEL_FIFO_EN	  	    		0x08
/*
 * 		INT_PIN_CFG
 * */
#define ACTL			  	    		0x80 // 1 – The logic level for INT pin is active low
#define OPEN			  	    		0x40 // 1 – INT pin is configured as open drain
#define PUSHPULL     					0x00
#define LATCH_INT_EN	  	    		0x20 // 1 – INT pin level held until interrupt status is cleared.
#define INT_ANYRD_2CLEAR  	    		0x10 // 1 – Interrupt status is cleared if any read operation is performed.
/*
 * 		INT_ENABLE
 * */
#define FIFO_OVERFLOW_EN		       	0x10
#define FSYNC_INT_EN			       	0x08
#define RAW_RDY_EN		       			0x01 // ?
//The timing of the interrupt can vary depending on the setting in register 36
//I2C_MST_CTRL, bit [6] WAIT_FOR_ES.

/*
 * 		INT_STATUS
 * */
#define FIFO_OVERFLOW_INT		       	0x10
#define FSYNC_INT_INT			       	0x08
#define DMP_INT			       			0x02
#define RAW_DATA_RDY_INT       			0x01
/*
 * 		SIGNAL_PATH_RESET
 * */
/* Sensor registers are not cleared. Use
 * SIG_COND_RST to clear sensor registers
 */
#define GYRO_RST				       	0x04
#define ACCEL_RST				       	0x02
#define TEMP_RST				       	0x01
/*
 * 		USER_CTRL
 * */
#define DMP_EN					       	0x80
#define FIFO_ENABLE				       	0x40 // Enable FIFO access from serial interface
#define I2C_MST_EN				       	0x20
#define I2C_IF_DIS				       	0x10 // Reset I2C Slave module and put the serial interface in SPI mode only
#define DMP_RST					       	0x08
#define FIFO_RST				       	0x04
#define I2C_MST_RST				       	0x02
#define SIG_COND_RST			       	0x01 // Reset all gyro digital signal path, accel digital signal path, and temp
											 // digital signal path. This bit also clears all the sensor registers
/*
 * 		PWR_MGMT_1
 * */
#define DEVICE_RESET			       	0x80 //  Reset the internal registers and restores the default settings.
#define SLEEP					       	0x40 //  !!!! When set, the chip is set to sleep mode
#define CYCLE					       	0x20
#define GYRO_STANDBY			       	0x10 //
#define TEMP_DIS				       	0x08 //

#define CLKSEL_PLL				       	0x01 //
#define CLKSEL_20MHz			       	0x00 // Internal 20MHz oscillator  MPU6500
#define CLKSEL_8MHz	    		       	0x00 // Internal 8MHz oscillator   MPU6000
#define CLKSEL_RESET			       	0x07 // Stops the clock and keeps timing generator in reset


#endif /* INVENSE_SENSOR_H_ */
