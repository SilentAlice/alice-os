ENTRY(entry)

start_address = 0x0;

SECTIONS
{
	. = 0x80000000 + start_address;

	.text : AT(start_address) { *(.text) }
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
