#include "sapi.h"

int main()
{
   //boardInit();
   while(true){
      gpioToggle(LED);
      delay(100);
   }
   return 0;
}
