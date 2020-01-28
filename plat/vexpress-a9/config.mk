ARCH := arm
CPU := cortex-a9
ARCH_CFLAGS := -mcpu=$(CPU) -marm -mapcs-frame

PLAT_QEMU_FLAGS := -M $(PLAT) -cpu $(CPU) -m 512M
