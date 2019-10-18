    .org 0x0
    .global _start
    .set noat
_start:
    or   $1, $0, 0xffff     # $1=0x0000ffff
    sll  $1, $1, 16         # $1=0xffff0000
    slt  $2, $1, $0         # $2=0x00000001
    sltu $2, $1, $0         # $2=0x00000000
    slti $2, $1, 0x8000     # $2=0x00000001
    sltiu $2, $1, 0x8000    # $2=0x00000001

