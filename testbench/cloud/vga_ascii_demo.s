    .org 0x0
    .global _start
    .set noat
    .set noreorder
    .set nomacro
_start:
    lui     $1, 0xba00
    
    ori     $2, $0, 0x48
    sb      $2, 0x0($1)
    ori     $2, $0, 0x65
    sb      $2, 0x1($1)
    ori     $2, $0, 0x6c
    sb      $2, 0x2($1)
    sb      $2, 0x3($1)
    ori     $2, $0, 0x6f
    sb      $2, 0x4($1)
    ori     $2, $0, 0x77
    sb      $2, 0x5($1)
    ori     $2, $0, 0x2c
    sb      $2, 0x6($1)

    ori     $2, $0, 0x77
    sb      $2, 0x7($1)
    ori     $2, $0, 0x6f
    sb      $2, 0x8($1)
    ori     $2, $0, 0x72
    sb      $2, 0x9($1)
    ori     $2, $0, 0x6c
    sb      $2, 0xa($1)
    ori     $2, $0, 0x64
    sb      $2, 0xb($1)
    nop
    nop
    nop
    nop
    nop
    nop
    nop
_loop:
    j _loop
    nop
    nop

