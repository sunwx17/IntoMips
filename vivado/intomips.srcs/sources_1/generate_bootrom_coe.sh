INIT_RADIX="16"
INIT_TEXT="memory_initialization_radix = "$INIT_RADIX";\nmemory_initialization_vector =" 
BOOTROM="bootrom"

echo $INIT_TEXT > ${BOOTROM}.coe

mips-mti-elf-as -O0 -mips32 -EB ${BOOTROM}.s -o ${BOOTROM}.o
mips-mti-elf-objcopy -O binary -j .text ${BOOTROM}.o ${BOOTROM}.bin
cat ${BOOTROM}.bin | xxd -c 4 -g 4 | cut -d " " -f 2 >> ${BOOTROM}.coe


rm *.o *.bin