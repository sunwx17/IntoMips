    .org 0x0
    .global _start
    .set noat
    .set noreorder
    .set nomacro
_start:
    ori  $1, $0, 0x100      # 1:$1=0x00000100
    jr   $1                 # 2:$0=0x00000000
    nop                     # 3:$0=0x00000000

    .org 0x40
    ori  $1, $0, 0x8000     # 11:$1=0x00008000
    ori  $1, $0, 0x9000     # 12:$1=0x00009000
    mfc0 $1, $14, 0x0       # 13:$1=0x0000010c
    addi $1, $1, 0x4        # 14:$1=0x00000110
    mtc0 $1, $14, 0x0       # 15:cp0.$14=0x00000110
    eret                    # 16:skip
                            # 17:skip
                            # 18:skip
                            # 19:$0=0x00000000
    nop

    .org 0x100
    ori  $1, $0, 0x1000     # 4:$1=0x00001000
    sw   $1, 0x0100($0)     # 5:skip
    mthi $1                 # 6:hi=0x00001000,lo=0x00000000

    syscall                 # 7:skip
                            # 8:skip
                            # 9:skip
                            # 10:$0=0x00000000

    lw   $1, 0x0100($0)     # 20:$1=0x00001000
    mfhi $2                 # 21:$2=0x00001000

