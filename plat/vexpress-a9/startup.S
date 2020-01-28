

.global entry
entry:
	mov r0, pc
	# R5 save PC
	mov r5, r0

	# make r0 4k aligned
	mov r0, pc
	bic r0, r0, #0xFF0
	bic r0, r0, #0xF

	# This is the .L_stack_start
	add r0, #0x2000
	mov sp, r0
	ldr r1, =.L_stack_start
	ldr r2, =#kernel_stack_start
	mov r3, sp
	push {r0}
	mov r4, sp
	.word 0xdeadbeef

	.align
	.section ".stack", "aw"
.L_stack: .space 4096
.L_stack_start:
