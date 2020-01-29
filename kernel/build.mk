KERNEL_DIR = kernel

CUROBJS := init.o

OBJS += $(addprefix $(KERNEL_DIR)/, $(CUROBJS))
