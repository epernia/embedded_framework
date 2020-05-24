#include <sapi_uart.h>

#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <termios.h>
#include <unistd.h>
#include <stdint.h>
#include <stdbool.h>

struct termios orig_termios;

void disableRawMode()
{
   tcsetattr (STDIN_FILENO, TCSAFLUSH, &orig_termios);
}

void enableRawMode()
{
   tcgetattr (STDIN_FILENO, &orig_termios);
   atexit (disableRawMode);

   struct termios raw = orig_termios;
   raw.c_lflag &= ~(ECHO | ICANON);

   tcsetattr (STDIN_FILENO, TCSAFLUSH, &raw);
}

void uartInit( int uart, int baudRate )
{
   enableRawMode();
}

bool_t uartReadByte( int uart, uint8_t* data )
{
   char c;
   if( read (STDIN_FILENO, &c, 1) == 1 ){
      *data = c;
      return true;
   }
   return false;
}

void uartWriteByte( int uart, uint8_t data )
{
   if( data == 10 ) {
      printf ( "\n" );
   } else if( iscntrl(data) ) {
      printf ( "%d\n", data );
   } else {
      printf ( "%c", data );
   }
   fflush(stdout);
}