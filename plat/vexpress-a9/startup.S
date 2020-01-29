#include <plat/memory.h>

.global entry
entry:
	# get load address
	mov r0, pc
	sub r0, r0, #8

	# calculate real stack address
	ldr r1, =#kernel_stack_start
	sub r1, r1, #KERNEL_START_ADDRESS
	add r1, r1, r0

	# set stack
	mov sp, r1

	# r0 is load address
	bl init

	.align
	.section ".stack", "aw"
.L_stack: .space 4096
.L_stack_start:
