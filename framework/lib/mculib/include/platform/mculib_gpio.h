/*=====[gpio]==================================================================
 * Copyright 2018, Eric Nicolas Pernia <ericpernia@gmail.com>
 * All rights reserved.
 * License: BSD-3-Clause <https://opensource.org/licenses/BSD-3-Clause>
 * Version: 1.0.0
 * Automatic generated file on: 2018-11-17
 */

/*=====[Avoid multiple inclusion begin]======================================*/

#ifndef _MCULIB_GPIO_H_
#define _MCULIB_GPIO_H_

/*=====[C++ begin]===========================================================*/

#ifdef __cplusplus
extern "C" {
#endif

/*=====[Definition macros of public constants]===============================*/

#ifndef NULL
#define NULL   0
#endif


/*=====[Definitions of public data types]====================================*/

typedef int32_t PortValue_t;

enum PinMode_cl {
   DISABLE = 3,
   INPUT = 1,
   OUTPUT = 0,
   OUTPUT_PP = 0,
   OUTPUT_PUSHPULL = 0,
   OUTPUT_OD = 2,
   OUTPUT_OPEN_DRAIN = 2,
};
typedef enum PinMode_cl PinMode_t;


/*=====[Prototypes (declarations) of public functions]=======================*/

PinMode_t modeGet( Pin_t pin );

void_t modeSet( Pin_t pin, PinMode_t mode );

PinPull_t pullGet( Pin_t pin );

void_t pullSet( Pin_t pin, PinPull_t pull );

bool_t valueGet( Pin_t pin );

void_t valueSet( Pin_t pin, bool_t value );


/*=====[C++ end]=============================================================*/

#ifdef __cplusplus
}
#endif

/*=====[Avoid multiple inclusion end]========================================*/

#endif /* _MCULIB_GPIO_H_ */
