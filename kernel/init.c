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
	arch_init();
	asm volatile(".word 0xdeadbeef");
}
