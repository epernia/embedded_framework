#include <board.h>

static void initHardware(void);

static uint32_t cnt = 0;

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

void delay(uint32_t n)
{
   auto start = load_volatile(&cnt);
   while ((load_volatile(&cnt) - start) < n) {
      __WFI();
   }
}

int main(void)
{
   Board_Init();
   SystemCoreClockUpdate();
   SysTick_Config(SystemCoreClock / 1000);

   while (1) {
      Board_LED_Toggle(LED_1);
      delay(200);
   }
}

extern "C"
void SysTick_Handler(void)
{
   auto v = load_volatile(&cnt);
   v++;
   store_volatile(&cnt, v);
}
