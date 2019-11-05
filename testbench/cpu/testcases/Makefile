ARCH = mips-mti-elf-

STDOUT = $(shell ls /dev/stdout)
MEM_MAKE_1 = $(ARCH)objcopy --dump-section .text=/dev/stdout $< | xxd -c 4 -g 32 | cut -f 2 -d " " > $@	
MEM_MAKE_2 = 
ifeq ($?, 0)
	MEM_MAKE_1 = $(ARCH)objcopy --dump-section .text=/dev/stdout $< | xxd -c 4 -g 32 | cut -f 2 -d " " > $@	
	MEM_MAKE_2 = 
else
	MEM_MAKE_1 = $(ARCH)objcopy -O binary -j .text $< $@ 
	MEM_MAKE_2 = cat $@ | xxd -c 4 -g 4 | cut -d " " -f 2 > $@
endif

TARGETDIR = instructions

COMPILATION = $(wildcard $(TARGETDIR)/*.s)
MEMORY = $(COMPILATION:.s=.mem)
ANSWER = $(COMPILATION:.s=.ans)

all: $(MEMORY) $(ANSWER)

%.mem : %.o
	$(MEM_MAKE_1)
	$(MEM_MAKE_2)

%.o : %.s    
	$(ARCH)as -O0 -mips32 -EL $^ -o $@

%.ans : %.s make_answer.py
	python make_answer.py -i $< -o $@


.PHONY : clean
clean :
	-rm $(TARGETDIR)/*.mem $(TARGETDIR)/*.ans $(TARGETDIR)/auto_*.s

