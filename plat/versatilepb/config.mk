ARCH := arm
CPU := arm926ej-s
ARCH_CFLAGS := -mcpu=$(CPU) -marm -mapcs-frame

PLAT_QEMU_FLAGS := -M $(PLAT) -cpu arm926 -m 256M
