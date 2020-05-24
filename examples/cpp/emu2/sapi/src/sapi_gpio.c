#include <sapi_gpio.h>

bool pins[16] = {false};

bool_t gpioRead( GpioMap_t pin )
{
   printf("PIN%d readed value is %d\n", pin, pins[pin]);
   fflush(stdout);
   return pins[pin];
}

bool_t gpioWrite( GpioMap_t pin, bool_t value )
{
   pins[pin] = value;
   printf("PIN%d set to %d\n", pin, pins[pin]);
   fflush(stdout);
   return pins[pin];
}

bool_t gpioToggle( GpioMap_t pin )
{
   pins[pin] = !pins[pin];
   printf("PIN%d is toggle to %d\n", pin, pins[pin]);
   fflush(stdout);
   return pins[pin];
}
