    .org 0x0
    .global _start
    .set noat
    .set noreorder
    .set nomacro
_start:
    ori $1, $0, 0x1234      # $1=0x00001234
    sw  $1, 0x0($0)         # skip
    ori $2, $0, 0x1234      # $2=0x00001234
    ori $1, $0, 0x0         # $1=0x00000000
    lw  $1, 0x0($0)         # $1=0x00001234
    beq $1, $2, Label       # skip
                            # skip
    nop                     # $0=0x00000000 
    ori $1, $0, 0x4567      
    nop                     
Label:
    ori $1, $0, 0x89ab      # $1=0x000089ab
    nop
    