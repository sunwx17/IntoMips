    .org 0x0
    .global _start
    .set noat
    .set noreorder
    .set nomacro
_start:
    lui $2, 0xBE00  #将0x81000000到0x81400000的内容复制到0x80000000到0x80400000
    lui $3, 0x8000
    lui $4, 0x8040
_load:
    lw $5, 0x0($2)
    addiu $2, $2, 0x4
    sw $5, 0x0($3)
    addiu $3, $3, 0x4
    bne $3, $4, _load
    nop
_init:
    lui $2, 0x8000
    jr $2
    nop
