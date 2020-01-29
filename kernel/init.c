/*
 * Copyright (C) SilentAlice All rights reserved.
 * Author: SilentAlice <https://www.silentming.net>
 * Create:  Wed Jan 29 17:45:38 2020
 */
#include <alice/compiler.h>

void init(unsigned long kernel_load_address)
{
	asm volatile(".word 0xdeadbeef");
}
