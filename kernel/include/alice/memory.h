/*
 * Copyright (C) SilentAlice All rights reserved.
 * Author: SilentAlice <https://www.silentming.net>
 * Create:  Wed Jan 29 17:45:38 2020
 */

#ifndef ALICE_MEMORY_H
#define ALICE_MEMORY_H

#include <arch/memory.h>
#include <alice/type.h>

#define __KERNEL_VA_PA_OFFSET		(KERNEL_START_VADDR - KERNEL_LOAD_PADDR)

#define ROUND_DOWN(x,alignment)		((x) & ~(alignment - 1))
#define ROUND_UP(x,alignment)		(((x) + alignment - 1) & ~(alignment - 1))

#define MEMORY_1M_SIZE			(0x1 << 20)
#define MEMORY_4K_SIZE			(0x1 << 12)

#define va2pa(va)			(va - __KERNEL_VA_PA_OFFSET)
#define pa2va(pa)			(va + __KERNEL_VA_PA_OFFSET)

#endif
