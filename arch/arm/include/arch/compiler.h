/*
 * Copyright (C) SilentAlice All rights reserved.
 * Author: SilentAlice <https://www.silentming.net>
 * Create:  Wed Jan 29 17:23:28 2020
 */

#ifndef ARCH_ARM_COMPILER_H
#define ARCH_ARM_COMPILER_H

#include <plat/config.h>

#if ARM_VERSION >= 7
#define isb(option)	__asm__ __volatile__ ("isb " #option : : : "memory")
#define dsb(option) 	__asm__ __volatile__ ("dsb " #option : : : "memory")
#define dmb(option) 	__asm__ __volatile__ ("dmb " #option : : : "memory")
#define wfe()		__asm__ __volatile__ ("wfe" : : : "memory")
#define wfi()		__asm__ __volatile__ ("wfi" : : : "memory")

#else
/* ARM_VERSION 5 */
#define isb(x) __asm__ __volatile__ ("" : : : "memory")
#define dsb(x) __asm__ __volatile__ ("mcr p15, 0, %0, c7, c10, 4" \
				     : : "r" (0) : "memory")
#define dmb(x) __asm__ __volatile__ ("" : : : "memory")
#define wfe()
#define wfi() __asm__ __volatile__ ("mcr p15, 0, %0, c7, c0, 4" \
				    : : "r" (0) : "memory")
#endif

#endif
