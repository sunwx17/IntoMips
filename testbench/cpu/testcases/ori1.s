    .org 0x0
    .global _start
    .set noat
_start:
    ori $1, $0, 0x1100  # $1=0x00001100
    ori $2, $0, 0x1111  # $2=0x00001111
    ori $3, $1, 0xff00  # $3=0x0000ff00
    ori $4, $2, 0xff0f  # $4=0x0000ff1f
    