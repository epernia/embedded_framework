/* Copyright 2020, Franco Bucafusco
 * All rights reserved.
 *
 * This file is part of sAPI Library.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 *
 * 3. Neither the name of the copyright holder nor the names of its
 *    contributors may be used to endorse or promote products derived from this
 *    software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */

#ifndef FREERTOS_CONFIG_H
#define FREERTOS_CONFIG_H

#define configUSE_PREEMPTION                         1
#define configUSE_TICKLESS_IDLE                      0

#define configCPU_CLOCK_HZ                           40000000
#define configTICK_RATE_HZ                           ( ( TickType_t ) 1000 ) // 1000 ticks per second => 1ms tick rate
#define configMAX_PRIORITIES                         ( 7 )
#define configMINIMAL_STACK_SIZE                     90
#define configTOTAL_HEAP_SIZE                        ( ( size_t ) ( 8 * 1024 ) )    /* 85 Kbytes. */
#define configMAX_TASK_NAME_LEN                      ( 16 )
#define configUSE_TRACE_FACILITY                     1
#define configUSE_16_BIT_TICKS                       0
#define configIDLE_SHOULD_YIELD                      1
#define configUSE_MUTEXES                            1
#define configQUEUE_REGISTRY_SIZE                    8

#define configUSE_RECURSIVE_MUTEXES                  1

#define configUSE_APPLICATION_TASK_TAG               0
#define configUSE_COUNTING_SEMAPHORES                1
#define configGENERATE_RUN_TIME_STATS                0
#define configSUPPORT_STATIC_ALLOCATION              0
#define configOVERRIDE_DEFAULT_TICK_CONFIGURATION    1
#define configRECORD_STACK_HIGH_ADDRESS              1

// Hooks
#define configUSE_DAEMON_TASK_STARTUP_HOOK           0
#define configUSE_MALLOC_FAILED_HOOK                 0
#define configUSE_IDLE_HOOK                          0
#define configUSE_TICK_HOOK                          0

// runtime checks
#define configCHECK_FOR_STACK_OVERFLOW               2

// Add old API compatibility
#define configENABLE_BACKWARD_COMPATIBILITY          1

/* Co-routine definitions. */
#define configUSE_CO_ROUTINES                        0
#define configMAX_CO_ROUTINE_PRIORITIES              ( 2 )

/* Software timer definitions. */
#define configUSE_TIMERS                             0
#define configTIMER_TASK_PRIORITY                    ( configMAX_PRIORITIES - 3 )
#define configTIMER_QUEUE_LENGTH                     10
#define configTIMER_TASK_STACK_DEPTH                 ( configMINIMAL_STACK_SIZE * 4 )

/* Set the following definitions to 1 to include the API function, or zero
 * to exclude the API function. */
#define INCLUDE_vTaskPrioritySet                     0
#define INCLUDE_uxTaskPriorityGet                    0
#define INCLUDE_vTaskDelete                          0
#define INCLUDE_vTaskCleanUpResources                0
#define INCLUDE_vTaskSuspend                         0
#define INCLUDE_vTaskDelayUntil                      1
#define INCLUDE_vTaskDelay                           1
#define INCLUDE_xTaskGetSchedulerState               0
#define INCLUDE_xTimerPendFunctionCall               0
#define INCLUDE_xSemaphoreGetMutexHolder             0


#define configUSE_COMMON_INTERRUPT_ENTRY_POINT       1


/* The lowest interrupt priority that can be used in a call to a "set priority"
 * function. */
#define configLIBRARY_LOWEST_INTERRUPT_PRIORITY         0x7

/* The highest interrupt priority that can be used by any interrupt service
 * routine that makes calls to interrupt safe FreeRTOS API functions.  DO NOT CALL
 * INTERRUPT SAFE FREERTOS API FUNCTIONS FROM ANY INTERRUPT THAT HAS A HIGHER
 * PRIORITY THAN THIS! (higher priorities are lower numeric values. */
#define configLIBRARY_MAX_SYSCALL_INTERRUPT_PRIORITY    5

/* Interrupt priorities used by the kernel port layer itself.  These are generic
* to all Cortex-M ports, and do not rely on any particular library functions. */
#define configKERNEL_INTERRUPT_PRIORITY \
	( configLIBRARY_LOWEST_INTERRUPT_PRIORITY << ( 8 - configPRIO_BITS ) )

/* !!!! configMAX_SYSCALL_INTERRUPT_PRIORITY must not be set to zero !!!!
 * See http://www.FreeRTOS.org/RTOS-Cortex-M3-M4.html. */
#define configMAX_SYSCALL_INTERRUPT_PRIORITY \
	( configLIBRARY_MAX_SYSCALL_INTERRUPT_PRIORITY << ( 8 - configPRIO_BITS ) )

/* Normal assert() semantics without relying on the provision of an assert.h
 * header file. */
#define configASSERT( x )                                       \
	if( ( x ) == 0 ) { taskDISABLE_INTERRUPTS(); for( ;; ) {; } \
	}

/* Map the FreeRTOS printf() to the logging task printf. */
#define configPRINTF( x )          vLoggingPrintf x

/* Map the logging task's printf to the board specific output function. */
#define configPRINT_STRING    DbgConsole_Printf

/* Sets the length of the buffers into which logging messages are written - so
 * also defines the maximum length of each log message. */
#define configLOGGING_MAX_MESSAGE_LENGTH            100

/* Set to 1 to prepend each log message with a message number, the task name,
 * and a time stamp. */
#define configLOGGING_INCLUDE_TIME_AND_TASK_NAME    1




#define configPRE_STOP_PROCESSING     vMainPreStopProcessing
#define configPOST_STOP_PROCESSING    vMainPostStopProcessing



/*********************************************
 * FreeRTOS specific demos
 ********************************************/

#define configISR_STACK_SIZE          100000
#define configSUPPORT_FPU             0



#endif /* FREERTOS_CONFIG_H */
