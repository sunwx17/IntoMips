    .org 0x0
    .global _start
    .set noat
    .set noreorder
    .set nomacro
_start:
    lw   $1, 0x20($0)
    lw   $1, 0x18($0)
    lw   $1, 0x14($0)
    lw   $1, 0x10($0)
    lw   $1, 0x8($0)
    lw   $1, 0x4($0)
    lw   $1, 0x0($0)
    lui  $1, 0x0011
    ori  $1, 0x2233
    sw   $1, 0x0($0)
    lui  $1, 0x4455
    ori  $1, 0x6677
    sw   $1, 0x4($0)
    lui  $1, 0x8899
    ori  $1, 0xaabb
    sw   $1, 0x8($0)
    nop                         # $0=0x00000000
    nop                         # $0=0x00000000
    nop                         # $0=0x00000000
    nop                         # $0=0x00000000
    nop                         # $0=0x00000000
    nop                         # $0=0x00000000
    nop                         # $0=0x00000000
    nop                         # $0=0x00000000
    nop                         # $0=0x00000000
    nop                         # $0=0x00000000
    nop                         # $0=0x00000000
    nop                         # $0=0x00000000
    nop                         # $0=0x00000000
    nop                         # $0=0x00000000
    nop                         # $0=0x00000000
    nop                         # $0=0x00000000
    nop                         # $0=0x00000000
    nop                         # $0=0x00000000
    nop                         # $0=0x00000000
    nop                         # $0=0x00000000


