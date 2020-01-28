KERNEL_DIR = kernel

CUROBJS := startup.o

OBJS += $(addprefix $(KERNEL_DIR)/, $(CUROBJS))
