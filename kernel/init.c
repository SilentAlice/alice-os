/*
 * Copyright (C) SilentAlice All rights reserved.
 * Author: SilentAlice <https://www.silentming.net>
 * Create:  Wed Jan 29 17:45:38 2020
 */
#include <alice/type.h>
#include <alice/init.h>
#include <alice/sysreg.h>
#include <alice/compiler.h>

void init(pa_t kernel_load_address)
{
	uint32_t sctlr;
	sysreg_read32(SCTLR, sctlr);
	sysreg_write32(SCTLR, sctlr);

	asm volatile("mov r3, %0" : "=r" (sctlr));
	asm volatile(".word 0xdeadbeef");
}
