    .org 0x0
    .global _start
    .set noat
    .set noreorder
    .set nomacro
_start:
    lui     $1, 0xba00
    
    ori     $2, $0, 0x0048
    sw      $2, 0x0($1)
    lui     $2, 0xe0
    ori     $2, $2, 0xe065
    sw      $2, 0x1($1)
    ori     $2, $0, 0xe06c
    sw      $2, 0x2($1)
    sw      $2, 0x3($1)
    ori     $2, $0, 0xe06f
    sw      $2, 0x4($1)
    ori     $2, $0, 0xe02c
    sw      $2, 0x5($1)

    ori     $2, $0, 0xe077
    sw      $2, 0x6($1)
    ori     $2, $0, 0xe06f
    sw      $2, 0x7($1)
    ori     $2, $0, 0xe072
    sw      $2, 0x8($1)
    ori     $2, $0, 0xe06c
    sw      $2, 0x9($1)
    ori     $2, $0, 0xe064
    sw      $2, 0xa($1)
    nop
    nop
    nop
    nop
    nop
_loop:
    j _loop
    nop
    nop

