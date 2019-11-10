    .org 0x0
    .global _start
    .set noat
    .set noreorder
    .set nomacro
_start:
    ori $1, $0, 1
    ori $4, $0, 1
    ori $5, $0, 10

    ori $3, $0, 0x0030

    lui $6, 0x8040

WRITESERIAL:                    
    lui $2, %hi(0xBFD003FC)
.TESTW:
    lb $1, %lo(0xBFD003FC)($2)  
    andi $1, $1, 0x0001         
    bne $1, $0, .WSERIAL        
    nop
    j .TESTW                    
    nop
.WSERIAL:
    lui $2, %hi(0xBFD003F8)
    sb $3, %lo(0xBFD003F8)($2)  
    nop
    sb $3, 0x0($6)
    nop
    addiu $6, $6, 1

    addiu $4, $4, 1
    addiu $3, $3, 1
    j  WRITESERIAL
    nop
_loop:
    j		_loop				# jump to _loop
    nop
