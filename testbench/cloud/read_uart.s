    .org 0x0
    .global _start
    .set noat
    .set noreorder
    .set nomacro
_start:
READSERIAL:                 
    lui $20, 0x8050       
    lui $2, %hi(SerialStat)
.TESTR:
    lb $1, %lo(SerialStat)($2)     
    andi $1, $1, 0x0002           
    
    bne $1, $0, .RSERIAL         
    nop
    j .TESTR                       
    nop
.RSERIAL:
    or $13, $0, $1
    addiu $13, $13, 0x30
    jal WRITESERIAL
    nop


    lui $2, %hi(SerialData)
    lb $3, %lo(SerialData)($2)     
    
    sw  $20, 0x20($20)
    sb  $3, 0x30($20)

    j READSERIAL
    nop


WRITESERIAL:                    
    lui $12, %hi(0xBFD003FC)
.TESTW:
    lb $11, %lo(0xBFD003FC)($12)  
    andi $11, $11, 0x0001         
    bne $11, $0, .WSERIAL        
    nop
    j .TESTW                    
    nop
.WSERIAL:
    lui $12, %hi(0xBFD003F8)
    sb $13, %lo(0xBFD003F8)($12)  
    nop
    jr $31
    nop
_loop:
    j		_loop				# jump to _loop
    nop










    nop
