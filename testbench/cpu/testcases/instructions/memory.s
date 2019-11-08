    .org 0x0
    .global _start
    .set noat
    .set noreorder
    .set nomacro
_start:
    ori  $3, $0, 0xeeff         # $3=0x0000eeff
    sb	 $3, 0x3($0)		    # skip
    srl  $3, $3, 8              # $3=0x000000ee
    sb   $3, 0x2($0)            # skip
    ori  $3, $0, 0xccdd         # $3=0x0000ccdd
    sb   $3, 0x1($0)            # skip
    srl  $3, $3, 8              # $3=0x000000cc
    sb   $3, 0x0($0)            # skip
    lb   $1, 0x3($0)            # $1=0xffffffff
    lbu  $1, 0x2($0)            # $1=0x000000ee

    ori  $3, $0, 0xaabb         # $3=0x0000aabb
    sh   $3, 0x4($0)            # skip
    lhu  $1, 0x4($0)            # $1=0x0000aabb
    lh   $1, 0x4($0)            # $1=0xffffaabb
    ori  $3, $0, 0x8899         # $3=0x00008899
    sh   $3, 0x6($0)            # skip
    lh   $1, 0x6($0)            # $1=0xffff8899
    lhu  $1, 0x6($0)            # $1=0x00008899

    ori  $3, $0, 0x4455         # $3=0x00004455
    sll  $3, $3, 0x10           # $3=0x44550000
    ori  $3, $3, 0x6677         # $3=0x44556677
    sw   $3, 0x8($0)            # skip
    lw   $1, 0x8($0)            # $1=0x44556677

    lh   $2, 0x2($0)            # $2=0xffffffee
    lhu  $2, 0x2($0)            # $2=0x0000ffee
    lb   $2, 0x7($0)            # $2=0xffffff88
    lbu  $2, 0x6($0)            # $2=0x00000099
    
    nop                         # $0=0x00000000

_loop:
    j		_loop				# jump to _loop
    


    nop                         # $0=0x00000000
    nop                         # $0=0x00000000
    nop                         # $0=0x00000000
    nop                         # $0=0x00000000
    nop                         # $0=0x00000000
    nop                         # $0=0x00000000
    nop                         # $0=0x00000000
    nop                         # $0=0x00000000
    nop                         # $0=0x00000000
    nop                         # $0=0x00000000
    nop                         # $0=0x00000000
    nop                         # $0=0x00000000
    nop                         # $0=0x00000000
    nop                         # $0=0x00000000
    nop                         # $0=0x00000000
    nop                         # $0=0x00000000
    nop                         # $0=0x00000000
    nop                         # $0=0x00000000
    nop                         # $0=0x00000000
    nop                         # $0=0x00000000
    nop                         # $0=0x00000000
    nop                         # $0=0x00000000
    nop                         # $0=0x00000000

