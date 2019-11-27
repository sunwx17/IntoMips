    .org 0x0
    .global _start
    .set noat
    .set noreorder
    .set nomacro
_start:
    lui $5, 0xabcd
    ori $5, 0x1234
    lui $6, 0x7fc1
