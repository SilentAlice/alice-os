/*
 * Copyright (C) SilentAlice All rights reserved.
 * Author: SilentAlice <https://www.silentming.net>
 * Create:  Wed Jan 29 17:45:38 2020
 */

#include <arch/init.h>
#include <arch/sysreg.h>

extern uint32_t startup_table[];

static void __init_paging(void)
{
	uint32_t val;
	/* init DACR, we only use domain 0 */
	val = 0x1;
	sysreg_write32(DACR, val);

#if	ARM_VERSION == 7
	/* bit[31]: EAE 32-bit translation system,
	 * bit[5-4]: Use both TTBR0 and TTBR1,
	 * bit[2-0]: All address translation use TTBR0
	 */
	val = 0x0;
	sysreg_write32(TTBCR, val);
#endif


	val = (uintptr_t)(&startup_table);
	val = va2pa(val);
	sysreg_write32(TTBR0, val);

	/* enable mmu */
	sysreg_read32(SCTLR, val);
	val |= SCTLR_M;
	sysreg_write32(SCTLR, val);

	asm volatile ("mov r7, #0xAA");
	asm volatile (".word 0xdeadbeef");
}

void arch_init(void)
{
	__init_paging();
	/* jump to high address */
	asm volatile (".word 0xdeadbeef");
}
