    .org 0x0
    .global _start
    .set noat
_start:
    ori $1, $0, 0x1100  # $1=0x00001100
    ori $2, $1, 0x0020  # $2=0x00001120
    ori $3, $2, 0xff00  # $3=0x0000ff20
    ori $4, $3, 0x005f  # $4=0x0000ff7f
    