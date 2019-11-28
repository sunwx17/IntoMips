    .org 0x0
    .global _start
    .set noat
    .set noreorder
    .set nomacro
_start:
    lui $2, 0x8100
    lw  $3, 0x0($2)
    lw  $3, 0x4($2)
    lw  $3, 0x8($2)

    ori $3, $0, 0x1234
    sh  $3, 0x0($2)
    ori $3, $0, 0x5678
    sh  $3, 0x2($2)
    nop
    lw  $4, 0x0($2)
    nop
_loop:
    j _loop
    nop
    nop
    