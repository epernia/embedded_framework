#include <sapi.h>
#include <sapi_threads.h>

extern volatile bool tickThreadOn;

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
