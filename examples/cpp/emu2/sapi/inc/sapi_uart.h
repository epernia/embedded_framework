#ifndef __SAPI_UART_H__
#define __SAPI_UART_H__

#include <sapi_datatypes.h>

#ifdef __cplusplus
   extern "C" {
#endif

typedef enum{
    UART0
    UART_USB,
    UART_DEBUG,
} UartMap_t;


void uartInit( int uart, int baudRate );
bool_t uartReadByte( int uart, uint8_t* data );
void uartWriteByte( int uart, uint8_t data );

#ifdef __cplusplus
   }
#endif

#endif // __SAPI_UART_H__
