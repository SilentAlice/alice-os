include arch/arm/config.mk

CPU := cortex-a9
ARCH_CFLAGS := -mcpu=$(CPU)

PLAT_QEMU_FLAGS := -M $(PLAT) -cpu $(CPU) -m 512M
