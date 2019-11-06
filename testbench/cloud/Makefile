ARCH = mips-mti-elf-


COMPILATION = $(wildcard *.s)
BIN = $(COMPILATION:.s=.bin)


all: $(BIN)

%.bin: %.o
	$(ARCH)objcopy -O binary -j .text $<  $@

%.o: %.s
	$(ARCH)as -O0 -mips32 -EL $^ -o $@

.PHONY: clean
clean:
	-rm *.bin 
