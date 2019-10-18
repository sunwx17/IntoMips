    .org 0x0
    .global _start
    .set noat
_start:
    ori  $1, $0, 0xffff     # $1=0x0000ffff
    sll  $1, $1, 16         # $1=0xffff0000
    ori  $1, $1, 0xfffb     # $1=0xfffffffb
    ori  $2, $0, 6          # $2=0x00000006
    mul  $3, $1, $2         # $3=0xffffffe2

    mult $1, $2             # hi=0xffffffff,lo=0xffffffe2
    multu $1, $2            # hi=0x00000005,lo=0xffffffe2
    nop                     # $0=0x00000000
    nop                     # $0=0x00000000




