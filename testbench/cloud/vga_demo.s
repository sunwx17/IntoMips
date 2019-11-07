    .org 0x0
    .global _start
    .set noat
    .set noreorder
    .set nomacro
_start:
    lui     $1, 0xba00

    ori     $2, $0, 800
    ori     $3, $0, 600

    ori     $4, $0, 0x0     #v
    ori     $5, $0, 0x0     #h

    ori     $6, $0, 0x0007  #red
    ori     $7, $0, 0x00c0  #blue

    ori     $8, $0, 800  #$8 = 800 
    ori     $9, $0, 600  #$9 = 600

    ori     $10, $0, 0x190
    mul     $10, $10, $10      #$10 = 400 * 400
_render_v:
    ori     $5, $0, 0x0
_render_h:
    mul     $11, $8, $4
    addu    $11, $11, $5
    addu    $11, $11, $1    #$11 = cur_addr

    mul     $12, $4, $4
    mul     $13, $5, $5
    addu    $14, $12, $13
    subu    $14, $14, $10

    sb      $7, 0x0($11)
    bgtz    $14, _update
    nop

    sb      $6, 0x0($11)
_update:
    addiu   $5, $5, 0x1
    bne     $5, $8, _render_h
    nop

    addiu   $4, $4, 0x1
    bne     $4, $9, _render_v
    nop

_exit:
    j _exit
    nop




