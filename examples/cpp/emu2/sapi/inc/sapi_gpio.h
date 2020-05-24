#ifndef __SAPI_GPIO_H__
#define __SAPI_GPIO_H__

#include <sapi_datatypes.h>

#ifdef __cplusplus
   extern "C" {
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
} GpioMap_t;

bool_t gpioRead( GpioMap_t pin );
bool_t gpioWrite( GpioMap_t pin, bool_t value );
bool_t gpioToggle( GpioMap_t pin );

#ifdef __cplusplus
   }
#endif

#endif // __SAPI_GPIO_H__
