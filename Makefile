OS = alice

ifndef PLAT
        PLAT = vexpress-a9
endif

include plat/$(PLAT)/config.mk

COMPILE_PREFIX = arm-none-eabi-

# tools
AR = $(COMPILE_PREFIX)ar
AS = $(COMPILE_PREFIX)as
CC = $(COMPILE_PREFIX)gcc
LD = $(COMPILE_PREFIX)ld
OBJCOPY = $(COMPILE_PREFIX)objcopy
OBJDUMP = $(COMPILE_PREFIX)objdump

# flags
CFLAGS = $(PLAT_CFLAGS) $(ARCH_CFLAGS) -gstabs \
         -std=c99 -pedantic -msoft-float -fPIC \
         -Wall -Wextra -Wno-overlength-strings \
         -fno-builtin-printf -fno-builtin-strcpy -fno-builtin-exit \
         -I kernel/include \
         -I arch/$(ARCH)/include \
         -I plat/$(PLAT)/include

ASFLAGS = -mcpu=$(CPU) -g \
          -I kernel/include \
          -I arch/$(ARCH)/include \
          -I plat/$(PLAT)/include

OBJS :=

include plat/$(PLAT)/build.mk
include arch/$(ARCH)/build.mk
include kernel/build.mk

all: $(OS).bin

$(OS).bin: $(OBJS) $(OS).ld
	$(LD) -L plat/$(PLAT) -T $(OS).ld $(OBJS) -o $(OS).elf
	$(OBJCOPY) -O binary $(OS).elf $(OS).bin
	$(OBJDUMP) -D $(OS).elf > $(OS).dump.asm

QEMU_FLAGS = $(PLAT_QEMU_FLAGS) -nographic

qemu: $(OS).bin
	qemu-system-$(ARCH) $(QEMU_FLAGS) -kernel $(OS).bin

qemu-gdb: $(OS).bin
	qemu-system-$(ARCH) $(QEMU_FLAGS) -gdb tcp::1234 -S -kernel $(OS).bin

qemu-telnet: $(OS).bin
	qemu-system-$(ARCH) $(QEMU_FLAGS) -monitor telnet:127.0.0.1:1234,server,nowait -kernel $(OS).bin

clean:
	rm -f $(OBJS) $(EXTRA_CLEAN)
	rm -f $(OS).elf $(OS).bin $(OS).dump.asm
