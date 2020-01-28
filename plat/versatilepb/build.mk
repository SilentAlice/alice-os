PLAT_DIR = plat/versatilepb

CUROBJS := startup.o

OBJS += $(addprefix $(PLAT_DIR)/, $(CUROBJS))
