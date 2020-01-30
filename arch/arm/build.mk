ARCH_DIR = arch/arm

CUROBJS := init.o startup_table.o

OBJS += $(addprefix $(ARCH_DIR)/, $(CUROBJS))
