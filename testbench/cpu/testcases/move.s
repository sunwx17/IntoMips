    .org 0x0
    .global _start
    .set noat
_start:
    lui  $1, 0x0000     # $1=0x00000000
    lui  $2, 0xffff     # $2=0xffff0000
    lui  $3, 0x0505     # $3=0x05050000
    lui  $4, 0x0000     # $4=0x00000000

    movz $4, $2, $1     # $4=0xffff0000
    movn $4, $3, $1     # skip
    movn $4, $3, $2     # $4=0x05050000
    movz $4, $2, $3     # skip

    mthi $0             # hi=0x00000000,lo=0x00000000
    mthi $2             # hi=0xffff0000,lo=0x00000000
    mthi $3             # hi=0x05050000,lo=0x00000000
    
    mfhi $4             # $4=0x05050000
    
    mtlo $3             # hi=0x05050000,lo=0x05050000
    mtlo $2             # hi=0x05050000,lo=0xffff0000
    mtlo $1             # hi=0x05050000,lo=0x00000000

    mflo $4             # $4=0x00000000
    mfhi $4             # $4=0x05050000
    