ARCH_DIR = arch/arm

CUROBJS := init.o

OBJS += $(addprefix $(ARCH_DIR)/, $(CUROBJS))
