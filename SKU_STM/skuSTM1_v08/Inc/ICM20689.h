/*
 * ICM20689.h
 *
 *  Created on: 16 янв. 2018 г.
 *      Author: Администратор
 */

#ifndef _ICM20689_H_
#define _ICM20689_H_

//Product ID Description for 	ICM20689:
#define ICM20689_REV        0x98  //
/* определение адресов регистров ICM20689 */
#define ICM20689_RA_ST_X_GYRO        	0x00
#define ICM20689_RA_ST_Y_GYRO        	0x01
#define ICM20689_RA_ST_Z_GYRO        	0x02
#define ICM20689_RA_ST_X_ACCEL       	0x0D
#define ICM20689_RA_ST_Y_ACCEL       	0x0E
#define ICM20689_RA_ST_Z_ACCEL       	0x0F
#define ICM20689_RA_XG_OFFS_USRH     	0x13 //[15:0] XG_OFFS_USR
#define ICM20689_RA_XG_OFFS_USRL     	0x14
#define ICM20689_RA_YG_OFFS_USRH     	0x15 //[15:0] YG_OFFS_USR
#define ICM20689_RA_YG_OFFS_USRL     	0x16
#define ICM20689_RA_ZG_OFFS_USRH     	0x17 //[15:0] ZG_OFFS_USR
#define ICM20689_RA_ZG_OFFS_USRL     	0x18
#define ICM20689_RA_SMPLRT_DIV       	0x19
#define ICM20689_RA_CONFIG           	0x1A
#define ICM20689_RA_GYRO_CONFIG      	0x1B
#define ICM20689_RA_ACCEL_CONFIG     	0x1C
#define ICM20689_RA_ACCEL_CONFIG_2   	0x1D
#define ICM20689_RA_LP_MODE_CFG     	0x1E
#define ICM20689_RA_WOM_THR          	0x1F
#define ICM20689_RA_FIFO_EN          	0x23
#define ICM20689_RA_FSINC_INT       	0x36
#define ICM20689_RA_INT_PIN_CFG      	0x37
#define ICM20689_RA_INT_ENABLE       	0x38
#define ICM20689_RA_DMP_INT_STATUS   	0x39
#define ICM20689_RA_INT_STATUS       	0x3A
#define ICM20689_RA_ACCEL_XOUT_H     	0x3B
#define ICM20689_RA_ACCEL_XOUT_L     	0x3C
#define ICM20689_RA_ACCEL_YOUT_H     	0x3D
#define ICM20689_RA_ACCEL_YOUT_L     	0x3E
#define ICM20689_RA_ACCEL_ZOUT_H     	0x3F
#define ICM20689_RA_ACCEL_ZOUT_L     	0x40
#define ICM20689_RA_TEMP_OUT_H       	0x41
#define ICM20689_RA_TEMP_OUT_L       	0x42
#define ICM20689_RA_GYRO_XOUT_H      	0x43
#define ICM20689_RA_GYRO_XOUT_L      	0x44
#define ICM20689_RA_GYRO_YOUT_H      	0x45
#define ICM20689_RA_GYRO_YOUT_L      	0x46
#define ICM20689_RA_GYRO_ZOUT_H      	0x47
#define ICM20689_RA_GYRO_ZOUT_L      	0x48
#define ICM20689_RA_SIGNAL_PATH_RESET   0x68
#define ICM20689_RA_ACCEL_INTEL_CTRL    0x69
#define ICM20689_RA_USER_CTRL        	0x6A
#define ICM20689_RA_PWR_MGMT_1       	0x6B
#define ICM20689_RA_PWR_MGMT_2       	0x6C
#define ICM20689_RA_FIFO_COUNTH      	0x72
#define ICM20689_RA_FIFO_COUNTL      	0x73
#define ICM20689_RA_FIFO_R_W         	0x74
#define ICM20689_RA_WHO_AM_I         	0x75
#define ICM20689_RA_XA_OFFSET_H      	0x77
#define ICM20689_RA_XA_OFFSET_L      	0x78
#define ICM20689_RA_YA_OFFSET_H      	0x7A
#define ICM20689_RA_YA_OFFSET_L      	0x7B
#define ICM20689_RA_ZA_OFFSET_H      	0x7D
#define ICM20689_RA_ZA_OFFSET_L      	0x7E

#define ICM20689_DMP_MEMORY_BANKS        8		//?
#define ICM20689_DMP_MEMORY_BANK_SIZE    256	//?
#define ICM20689_DMP_MEMORY_CHUNK_SIZE   16		//?

#endif /* _ICM20689_H_ */
