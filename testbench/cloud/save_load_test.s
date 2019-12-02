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
    lw  $4, 0x0($3)

    lui $3, 0x8010
    sw  $2, 0x0($3)
    lw  $4, 0x0($3)

    lui $3, 0x8020
    sw  $2, 0x0($3)
    lw  $4, 0x0($3)

    lui $3, 0x8030
    sw  $2, 0x0($3)
    lw  $4, 0x0($3)
    nop
_loop:
    j _loop
    nop