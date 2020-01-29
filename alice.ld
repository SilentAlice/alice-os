INCLUDE linker.ld

ENTRY(entry)

SECTIONS
{
	. = kernel_start_address;

	.text : AT(kernel_load_address) { *(.text) }
	PROVIDE(etext = .);

	.stab : {
		PROVIDE(STAB_BEGIN = .);
		*(.stab);
		PROVIDE(STAB_END = .);
		BYTE(0);
	}

	.stabstr : {
		PROVIDE(STABSTR_BEGIN = .);
		*(.stabstr);
		PROVIDE(STABSTR_END = .);
		BYTE(0);
	}

	.data : { *(.data) }
	PROVIDE(edata = .);

	.bss : { *(.bss COMMON) }
	. = ALIGN(4096);

	.stack : {
		*(.stack);
	}
	kernel_stack_start = .;

	PROVIDE(ekernel_stack_start = .);

	PROVIDE(kernel_end = .);
}
