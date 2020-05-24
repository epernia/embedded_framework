#include <sapi_tick.h>

volatile bool tickThreadOn = true;

void tickThread()
{
   while(tickThreadOn) {  
      // gpioToggle(PIN2);
      // delay(500);
   }
}