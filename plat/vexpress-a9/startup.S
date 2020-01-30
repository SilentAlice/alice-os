#include <plat/memory.h>

.global entry
entry:
	ldr r0, =#KERNEL_LOAD_PADDR

	# calculate real stack address
	ldr r1, =#kernel_stack_start
	sub r1, r1, #KERNEL_START_VADDR
	add r1, r1, r0

	# set stack
	mov sp, r1

	# r0 is load address
	bl init

	.align
	.section ".stack", "aw"
.L_stack: .space 4096
.L_stack_start:
