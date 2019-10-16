    .org 0x0
    .global _start
    .set noat
_start:
    ori $1, $0, 0x1100  # $1=0x00001100
    ori $2, $0, 0x0020  # $2=0x00000020
    ori $3, $0, 0xff00  # $3=0x0000ff00
    ori $4, $0, 0xffff  # $4=0x0000ffff
    