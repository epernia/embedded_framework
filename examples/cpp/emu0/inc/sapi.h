#ifndef __SAPI_H__
#define __SAPI_H__

#include <stdbool.h>
#include <stdint.h>


#ifdef __cplusplus
   extern "C" {
#endif


#ifdef bool
   typedef bool bool_t;
#else
   typedef uint8_t bool_t;
#endif

typedef enum{
    PIN0 =  0,
    PIN1 =  1,
    PIN2 =  2,
    PIN3 =  3,
    PIN4 =  4,
    PIN5 =  5,
    PIN6 =  6,
    PIN7 =  7,
    PIN8 =  8,
    PIN9 =  9,
   PIN10 = 10,
   PIN11 = 11,
   PIN12 = 12,
   PIN13 = 13,
   PIN14 = 14,
   PIN15 = 15,
} Pin_t;


bool_t gpioRead( Pin_t pinIdx );
bool_t gpioWrite( Pin_t pinIdx, bool_t value );
bool_t gpioToggle( Pin_t pinIdx );


void delay( int time );

#ifdef __cplusplus
   }
#endif

#endif // __SAPI_H__
