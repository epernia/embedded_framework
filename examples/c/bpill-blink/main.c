#include <stm32f1xx.h>

static volatile int ticks = 0;

void SysTick_Handler()
{
   ticks++;
}

static void waitTicks(int t)
{
   int start = ticks;
   while ((ticks - start) < t) {
      __WFI();
   }
}

int main()
{
   SystemCoreClockUpdate();
   SysTick_Config(SystemCoreClock / 1000);

   RCC->APB2ENR    |= RCC_APB2ENR_IOPCEN;                      // enable clock
   GPIOC->CRH      &=  ~(GPIO_CRH_MODE13 | GPIO_CRH_CNF13);    // reset PC13
   GPIOC->CRH      |= (GPIO_CRH_MODE13_1 | GPIO_CRH_MODE13_0); // config PC13

   for (;;) {
      GPIOC->BSRR = GPIO_BSRR_BS13;   // led on - active low
      waitTicks(500);
      GPIOC->BRR = GPIO_BRR_BR13;   // led off
      waitTicks(500);
   }

   return 0;
}
