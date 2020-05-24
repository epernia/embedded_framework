#include <sapi.h>
#include <stdio.h>

#include <iostream>
#include <chrono>
#include <thread>
 
bool pin[16] = {false};


volatile bool tickThreadOn = true;

void tickThread()
{
   while(tickThreadOn) {  
      // gpioToggle(PIN2);
      // delay(500);
   }
}


class Sapi{
   public: Sapi(){
      printf("Simulation initialized\n");
      fflush(stdout);
      tickThreadObj = std::thread(tickThread);    
   }
   ~Sapi(){
      tickThreadOn = false;
      tickThreadObj.join();
      printf("Simulation terminated\n");
      fflush(stdout);
   }
   std::thread tickThreadObj;
};

Sapi sapiVar;


template<typename T>
inline T load_volatile(T *addr)
{
   return *reinterpret_cast<volatile T*>(addr);
}

template<typename T>
inline void store_volatile(T *addr, T val)
{
   *reinterpret_cast<volatile T*>(addr) = val;
}



extern "C"
bool_t gpioRead( Pin_t pinIdx )
{
   printf("PIN%d readed value is %d\n", pinIdx, pin[pinIdx]);
   fflush(stdout);
   return pin[pinIdx];
}

extern "C"
bool_t gpioWrite( Pin_t pinIdx, bool_t value )
{
   pin[pinIdx] = value;
   printf("PIN%d set to %d\n", pinIdx, pin[pinIdx]);
   fflush(stdout);
   return pin[pinIdx];
}

extern "C"
bool_t gpioToggle( Pin_t pinIdx )
{
   pin[pinIdx] = !pin[pinIdx];
   printf("PIN%d is toggle to %d\n", pinIdx, pin[pinIdx]);
   fflush(stdout);
   return pin[pinIdx];
}

extern "C" 
void delay( int time )
{
   std::chrono::milliseconds dura( time );
   std::this_thread::sleep_for( dura );
}
