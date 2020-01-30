/*
 * Copyright (C) SilentAlice All rights reserved.
 * Author: SilentAlice <https://www.silentming.net>
 * Create:  Wed Jan 29 17:45:38 2020
 */

#ifndef ARCH_ARM_SECTION_H
#define ARCH_ARM_SECTION_H

#include <arch/type.h>

/* 4K aligned */
#define SECTION_TABLE_ALIGN	(0x1000U << 2)
#define SECTION_TABLE_SIZE	(0x1000U << 2)

#define STE_RSRV_BITS		(0x2)
#define STE_DOMAIN_SHIFT	5
#define STE_DOMAIN_MASK		(0xF << STE_DOMAIN_SHIFT)
#define STE_DOMAIN(n)		((n << STE_DOMAIN_SHIFT) & STE_DOMAIN_MASK)
#define STE_AP_SHIFT		10
#define STE_AP_MASK		(0x3 << STE_BASE_SHIFT)
#define STE_BASE_SHIFT		20
#define STE_BASE_MASK		0xFFF00000

/* bits[20-31] section base address */

/* section table entry type */
typedef uint32_t ste_t;

#endif
