#ifndef __SAPI2_H__
#define __SAPI2_H__

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
   PIN0 = 0,
   PIN1 = 1,
   PIN2 = 2,
   PIN3 = 3,
   PIN4 = 4,
   PIN5 = 5,
   PIN6 = 6,
   PIN7 = 7,
} Pin_t;


bool_t gpioRead( Pin_t pinIdx );
bool_t gpioWrite( Pin_t pinIdx, bool_t value );
bool_t gpioToggle( Pin_t pinIdx );


void delay( int time );

#ifdef __cplusplus
   }
#endif

#endif // __SAPI2_H__