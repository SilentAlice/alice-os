/*
 * Copyright (C) SilentAlice All rights reserved.
 * Author: SilentAlice <https://www.silentming.net>
 * Create:  Wed Jan 29 17:23:28 2020
 */

#ifndef ARCH_ARM_SYSREG_H
#define ARCH_ARM_SYSREG_H

#include <arch/type.h>
#include <alice/compiler.h>

#define SCTLR	"0, %0, c1, c0, 0"

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
