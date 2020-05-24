#ifndef __SAPI_DATATYPES_H__
#define __SAPI_DATATYPES_H__

#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>

#ifdef __cplusplus
   extern "C" {
#endif

#ifdef bool
   typedef bool bool_t;
#else
   typedef uint8_t bool_t;
#endif

typedef uint64_t tick_t;

#ifdef __cplusplus
   }
#endif

#endif // __SAPI_DATATYPES_H__
