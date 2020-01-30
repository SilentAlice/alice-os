/*
 * Copyright (C) SilentAlice All rights reserved.
 * Author: SilentAlice <https://www.silentming.net>
 * Create:  Wed Jan 29 17:23:28 2020
 */

#ifndef ARCH_ARM_SYSREG_H
#define ARCH_ARM_SYSREG_H

#include <arch/type.h>
#include <alice/compiler.h>

#define SCTLR			"0, %0, c1, c0, 0"
#define SCTLR_M			(0x1 << 0)		/* enable MMU */
#define DACR			"0, %0, c3, c0, 0"

#define TTBR0			"0, %0, c2, c0, 0"

#define TTBR1			"0, %0, c2, c0, 1"
#define TTBCR			"0, %0, c2, c0, 2"
#define TTBCR_N			(0x7)

#define sysreg_read32(name, var) do {				\
	uint32_t __val;						\
	asm volatile("mrc p15, " name : "=r" (__val));		\
	var = __val;						\
} while (0)

#define sysreg_write32(name, val) do {				\
	uint32_t __val = val;					\
	asm volatile("mcr p15, " name :: "r" (__val) : "cc");	\
	isb();							\
} while (0)

#endif
