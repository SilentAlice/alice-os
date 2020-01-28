OS = alice

ifndef PLAT
        PLAT = vexpress-a9
        ARCH = arm
        CPU = cortex-a9
endif

COMPILE_PREFIX = arm-none-eabi-

# tools
AR = $(COMPILE_PREFIX)ar
AS = $(COMPILE_PREFIX)as
CC = $(COMPILE_PREFIX)gcc
LD = $(COMPILE_PREFIX)ld
OBJCOPY = $(COMPILE_PREFIX)objcopy
OBJDUMP = $(COMPILE_PREFIX)objdump

# flags
CFLAGS = -mcpu=$(CPU) -gstabs -marm \
         -std=c99 -pedantic \
         -Wall -Wextra -Wno-overlength-strings \
         -msoft-float -fPIC -mapcs-frame \
         -fno-builtin-printf -fno-builtin-strcpy \
         -fno-builtin-exit

ASFLAGS = -mcpu=$(CPU) -g

OBJS :=

include kernel/build.mk

all: $(OS).bin

$(OS).bin: $(OBJS) $(OS).ld
	$(LD) -T $(OS).ld $(OBJS) -o $(OS).elf
	$(OBJCOPY) -O binary $(OS).elf $(OS).bin
	$(OBJDUMP) -D $(OS).elf > $(OS).dump.asm

QEMU_FLAGS = -M $(PLAT) -cpu $(CPU) -m 512M -nographic

qemu: $(OS).bin
	qemu-system-arm $(QEMU_FLAGS) -kernel $(OS).bin

qemu-gdb: $(OS).bin
	qemu-system-arm $(QEMU_FLAGS) -gdb tcp::1234 -S -kernel $(OS).bin

qemu-telnet: $(OS).bin
	qemu-system-arm $(QEMU_FLAGS) -monitor telnet:127.0.0.1:1234,server,nowait -kernel $(OS).bin

clean:
	rm -f $(OBJS) $(EXTRA_CLEAN)
	rm -f $(OS).elf $(OS).bin $(OS).asm
