ARCH = mips-mti-elf-

TARGETDIR = instructions

COMPILATION = $(wildcard $(TARGETDIR)/*.s)
MEMORY = $(COMPILATION:.s=.mem)
ANSWER = $(COMPILATION:.s=.ans)

all: $(MEMORY) $(ANSWER)

%.mem : %.o
	$(ARCH)objcopy -O binary -j .text $< $@ 
	cat $@ | xxd -c 4 -g 4 | cut -d " " -f 2 > $@

%.o : %.s	
	$(ARCH)as -O0 -mips32 -EB $^ -o $@

%.ans : %.s make_answer.py
	python make_answer.py -i $< -o $@




.PHONY : clean
clean :
	-rm $(TARGETDIR)/*.mem $(TARGETDIR)/*.ans $(TARGETDIR)/auto_*.s

