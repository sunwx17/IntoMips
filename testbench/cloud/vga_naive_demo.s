    .org 0x0
    .global _start
    .set noat
    .set noreorder
    .set nomacro
_start:
    lui     $1, 0xba00

    lui     $2, 0xba07
    ori     $2, $2, 0x5300

    ori     $3, $0, 0x0007

    lui     $4, 0x8040
    ori     $4, $4, 0x0
_render:
    sb      $3, 0x0($1)
    sb      $3, 0x0($4)
    addiu   $1, $1, 0x1 
    bne     $1, $2, _render
    nop
    nop
_exit:
    j   _exit
    nop

