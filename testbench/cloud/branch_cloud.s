    .org 0x0
    .global _start
    .set noat
    .set noreorder
    .set nomacro
_start:
    jal work
    nop
    j _loop
    nop
work:
    ori $3, $0, 0x05
    addiu $3, $3, -1
    bne $3, $0, -8
    nop
    nop
    jr $31
    nop
_loop:
    j _loop
    nop