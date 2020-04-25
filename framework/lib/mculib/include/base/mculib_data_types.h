/*=====[data_types]============================================================
 * Copyright 2018, Eric Nicolas Pernia <ericpernia@gmail.com>
 * All rights reserved.
 * License: BSD-3-Clause <https://opensource.org/licenses/BSD-3-Clause>
 * Version: 1.0.0
 * Automatic generated file on: 2018-11-16
 */

/*=====[Avoid multiple inclusion begin]======================================*/

#ifndef _MCULIB_DATA_TYPES_H_
#define _MCULIB_DATA_TYPES_H_

/*=====[C++ begin]===========================================================*/

#ifdef __cplusplus
extern "C" {
#endif

/*=====[Definition macros of public constants]===============================*/

#ifndef NULL
#define NULL   0
#endif

#ifndef FALSE
#define FALSE  0
#endif

#ifndef false
#define false  0
#endif

#ifndef TRUE
#define TRUE   (!FALSE)
#endif

#ifndef true
#define true   (!false)
#endif

#ifndef OFF
#define OFF    0
#endif

#ifndef ON
#define ON     (!OFF)
#endif

#ifndef LOW
#define LOW    0
#endif

#ifndef HIGH
#define HIGH   (!LOW)
#endif

#ifndef DISABLE
#define DISABLE 0
#endif

#ifndef ENABLE
#define ENABLE (!DISABLE)
#endif


/*=====[Definitions of public data types]====================================*/

typedef void void_t;

typedef uint8_t bool_t;

typedef uint8_t byte_t;

typedef int32_t int_t;

typedef float float32_t;

typedef float32_t float_t;

typedef void (*Callback_t)(void *);

struct TimeOfDay_vl {
   uint8_t hour;  // 0 to 23
   uint8_t min;   // 0 to 23
   uint8_t sec;   // 0 to 59
   uint16_t msec; // 0 to 999
};
typedef struct TimeOfDay_vl TimeOfDay_t;

struct Date_vl {
   uint16_t year;
   uint8_t month;
   uint8_t mday;
   uint8_t wday;
};
typedef struct Date_vl Date_t;

struct DateAndTime_vl {
   uint8_t hour;  // 0 to 23
   uint8_t min;   // 0 to 23
   uint8_t sec;   // 0 to 59
   uint16_t msec; // 0 to 999
   uint16_t year; // 0 to INF
   uint8_t month; // 1 to 12
   uint8_t mday;  // 1 to 31
   uint8_t wday;  // 0 (moday) to 6 (sunday) TODO: Revisar como es en linux
};
typedef struct DateAndTime_vl DateAndTime_t;


/*=====[Prototypes (declarations) of public functions]=======================*/

void_t nullCallback( void_t* ptr );

/*=====[C++ end]=============================================================*/

#ifdef __cplusplus
}
#endif

/*=====[Avoid multiple inclusion end]========================================*/

#endif /* _MCULIB_DATA_TYPES_H_ */
