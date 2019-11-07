    .org 0x0
    .global _start
    .set noat
    .set noreorder
    .set nomacro
_start:
    lui     $1, 0xba00

    lui     $2, 0x0007
    ori     $2, $2, 0x5300

    ori     $3, $0, 0x0007 #red

    ori     $4, $0, 0x0
    ori     $6, $0, 0xffff
_render:
    addu    $5, $4, $1

    subu    $7, $4, $6
    bgtz    $7, _update
    nop

    sb      $3, 0x0($5)
_update:
    addiu   $4, $4, 0x1 
    bne     $4, $2, _render
    nop
    nop
_exit:
    j   _exit
    nop

