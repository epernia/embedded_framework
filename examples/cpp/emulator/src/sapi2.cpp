#include <sapi2.h>
#include <stdio.h>

#include <iostream>
#include <chrono>
#include <thread>
 
bool pin[10] = {false};


volatile bool thread1On = true;

void thread1()
{
   while(thread1On) {  
      // gpioToggle(PIN2);
      // delay(500);
   }
}


class dummy{
   public: dummy(){
      printf("Inicializacion\n");
      fflush(stdout);
      th1 = std::thread(thread1);    
   }
   ~dummy(){
      thread1On = false;
      th1.join();
      printf("Finish\n");
      fflush(stdout);
   }
   std::thread th1;
};

dummy dummyVar;


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