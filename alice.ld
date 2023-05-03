INCLUDE linker.ld

ENTRY(entry)

SECTIONS
{
	. = kernel_start_address;

	.text : AT(kernel_load_address) {
		*(.text)
		. = ALIGN(16384);
		PROVIDE(kernel_vector_start = .);
		*(.vector)
	}
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

	.data : {
		*(.data)
		. = ALIGN(4096);
		PROVIDE(kernel_stack_start = .);
		*(.stack);
		PROVIDE(ekernel_stack_start = .);
	}

	PROVIDE(edata = .);

	.bss : { *(.bss COMMON) }
	PROVIDE(kernel_end = .);
}
