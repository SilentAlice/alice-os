include arch/arm/config.mk

CPU := arm926ej-s
PLAT_CFLAGS := -mcpu=$(CPU)

PLAT_QEMU_FLAGS := -M $(PLAT) -cpu arm926 -m 256M
