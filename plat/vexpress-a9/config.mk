ARCH := arm
CPU := cortex-a9
PLAT_QEMU_FLAGS := -M $(PLAT) -cpu $(CPU) -m 512M
ARCH_CFLAGS := -mcpu=$(CPU) -marm -mapcs-frame
