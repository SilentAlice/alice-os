PLAT_DIR = plat/vexpress-a9

CUROBJS := startup.o

OBJS += $(addprefix $(PLAT_DIR)/, $(CUROBJS))
