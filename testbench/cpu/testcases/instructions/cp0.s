    .org 0x0
    .global _start
    .set noat
    .set noreorder
    .set nomacro
_start:
    ori  $1, $0, 0xf        # $1=0x0000000f
    mtc0 $1, $11, 0x0       # cp0.$11=0x0000000f

    lui  $1, 0x1000         # $1=0x10000000
    ori  $1, $1, 0x401      # $1=0x10000401
    mtc0 $1, $12, 0x0       # cp0.$12=0x10000401
    mfc0 $2, $12, 0x0       # $2=0x10000401