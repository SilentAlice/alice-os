/*
 * Copyright (C) SilentAlice All rights reserved.
 * Author: SilentAlice <https://www.silentming.net>
 * Create:  Wed Jan 29 17:45:38 2020
 */
#include <alice/type.h>
#include <alice/init.h>
#include <alice/sysreg.h>
#include <alice/compiler.h>

void init(void)
{
	uint32_t val;

	arch_init();

	sysreg_read32(SCTLR, val);
	asm volatile("mov r5, %0" : "=r" (val));
	sysreg_read32(TTBR0, val);
	asm volatile("mov r6, %0" : "=r" (val));

	asm volatile(".word 0xdeadbeef");
}
