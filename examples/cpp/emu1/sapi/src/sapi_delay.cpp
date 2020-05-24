#include <sapi_delay.h>
#include <sapi_threads.h>

void delay( tick_t time )
{
   std::chrono::milliseconds dura( time );
   std::this_thread::sleep_for( dura );
}
