    .org 0x0
    .global _start
    .set noat
    .set noreorder
    .set nomacro
_start:
    lui $2, 0x8100
    lh  $3, 0x0($2)
    lh  $3, 0x2($2)
    lh  $3, 0x4($2)
    lh  $3, 0x6($2)
    lh  $3, 0x8($2)
    nop
_loop:
    j _loop
    nop
    nop
    