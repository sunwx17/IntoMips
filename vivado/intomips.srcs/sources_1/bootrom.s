    .org 0x0
    .global _start
    .set noat
    .set noreorder
    .set nomacro
_start:
    lui $2, 0x8000
    jr $2
    nop
