    .org 0x0
    .global _start
    .set noat
    .set noreorder
    .set nomacro
_start:
    lui $2, 0xabcd
    ori $2, 0x1234
    lui $3, 0x8040
    sw  $2, 0x0($3)
    lw  $2, 0x0($3)

    lui $2, 0xabcf
    ori $2, 0x1235
    lui $3, 0x8010
    sw  $2, 0x0($3)
    lw  $2, 0x0($3)

    lui $2, 0xabcc
    ori $2, 0x1236
    lui $3, 0x8020
    sw  $2, 0x0($3)
    lw  $2, 0x0($3)

    lui $2, 0xab1d
    ori $2, 0x1244
    lui $3, 0x8030
    sw  $2, 0x0($3)
    lw  $2, 0x0($3)
    nop
_loop:
    j _loop
    nop