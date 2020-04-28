#include "sapi2.h"

int main()
{
   int i=0;
   for(i=0;i<10;i++){
      gpioToggle(PIN1);
      delay(1000);
   }
   return 0;
}

/*
   int i=0;
   for(i=0;i<10;i++){


   while(true) {
*/