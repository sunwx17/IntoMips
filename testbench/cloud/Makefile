ARCH = mips-mti-elf-


COMPILATION = $(wildcard *.s)
BIN = $(COMPILATION:.s=.bin)
MEM = $(COMPILATION:.s=.mem)


all: $(BIN) $(MEM)

%.bin: %.o
	$(ARCH)objcopy -O binary -j .text $<  $@

%.o: %.s
	$(ARCH)as -O0 -mips32 -EL $^ -o $@
	
%.mem: %.bin
	cat $< | xxd -c 4 -g 1 | cut -d " " -f 2,3,4,5 > $@

.PHONY: clean
clean:
	-rm *.bin *.mem
