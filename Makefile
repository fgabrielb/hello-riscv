CC=riscv64-elf-gcc
OBJCOPY=riscv64-elf-objcopy
CFLAGS=-march=rv32ima -mabi=ilp32 -nostdlib -ffreestanding -O2
LDFLAGS=-T linker.ld

.PHONY: all clean run

all: hello.elf hello.bin

hello.elf: start.S main.c
	$(CC) $(CFLAGS) $(LDFLAGS) $^ -o $@

hello.bin: hello.elf
	$(OBJCOPY) -O binary $< $@

run: hello.bin
	qemu-system-riscv32 -nographic -machine virt -bios none -kernel hello.bin

clean:
	rm -f hello.elf hello.bin
