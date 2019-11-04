    .org 0x0
    .global _start
    .set noat
    .set noreorder
    .set nomacro
_start:
    lui  $0, 0x17e6			# $0=0x17e60000
    ori  $0, $0, 0xb2f2			# $0=0x0000b2f2
    lui  $1, 0x2406			# $1=0x24060000
    ori  $1, $1, 0x390a			# $1=0x2406390a
    lui  $2, 0x9bc6			# $2=0x9bc60000
    ori  $2, $2, 0x9264			# $2=0x9bc69264
    lui  $3, 0x5da2			# $3=0x5da20000
    ori  $3, $3, 0x9738			# $3=0x5da29738
    lui  $4, 0x00ee			# $4=0x00ee0000
    ori  $4, $4, 0xb9fc			# $4=0x00eeb9fc
    lui  $5, 0xfa61			# $5=0xfa610000
    ori  $5, $5, 0x3855			# $5=0xfa613855
    lui  $6, 0x760c			# $6=0x760c0000
    ori  $6, $6, 0xa444			# $6=0x760ca444
    lui  $7, 0x5d85			# $7=0x5d850000
    ori  $7, $7, 0x59d6			# $7=0x5d8559d6
    lui  $8, 0x3505			# $8=0x35050000
    ori  $8, $8, 0xfd12			# $8=0x3505fd12
    lui  $9, 0x238f			# $9=0x238f0000
    ori  $9, $9, 0xdab7			# $9=0x238fdab7
    lui  $10, 0x0cc1			# $10=0x0cc10000
    ori  $10, $10, 0xf9ec			# $10=0x0cc1f9ec
    lui  $11, 0xe907			# $11=0xe9070000
    ori  $11, $11, 0x5bcf			# $11=0xe9075bcf
    lui  $12, 0xc744			# $12=0xc7440000
    ori  $12, $12, 0x1a02			# $12=0xc7441a02
    lui  $13, 0x9d44			# $13=0x9d440000
    ori  $13, $13, 0x4049			# $13=0x9d444049
    lui  $14, 0xeee6			# $14=0xeee60000
    ori  $14, $14, 0x08b7			# $14=0xeee608b7
    lui  $15, 0x88f9			# $15=0x88f90000
    ori  $15, $15, 0x0367			# $15=0x88f90367
    lui  $16, 0x617f			# $16=0x617f0000
    ori  $16, $16, 0x08c5			# $16=0x617f08c5
    lui  $17, 0x8a6b			# $17=0x8a6b0000
    ori  $17, $17, 0x6005			# $17=0x8a6b6005
    lui  $18, 0x70dc			# $18=0x70dc0000
    ori  $18, $18, 0x5d26			# $18=0x70dc5d26
    lui  $19, 0xec07			# $19=0xec070000
    ori  $19, $19, 0x5960			# $19=0xec075960
    lui  $20, 0x57e9			# $20=0x57e90000
    ori  $20, $20, 0x0b4b			# $20=0x57e90b4b
    lui  $21, 0x0f8d			# $21=0x0f8d0000
    ori  $21, $21, 0xdbec			# $21=0x0f8ddbec
    lui  $22, 0x1bcc			# $22=0x1bcc0000
    ori  $22, $22, 0x2ce0			# $22=0x1bcc2ce0
    lui  $23, 0x4b68			# $23=0x4b680000
    ori  $23, $23, 0x51e8			# $23=0x4b6851e8
    lui  $24, 0x8f37			# $24=0x8f370000
    ori  $24, $24, 0xe82f			# $24=0x8f37e82f
    lui  $25, 0x88c7			# $25=0x88c70000
    ori  $25, $25, 0xbe5d			# $25=0x88c7be5d
    lui  $26, 0xdeff			# $26=0xdeff0000
    ori  $26, $26, 0xdfde			# $26=0xdeffdfde
    lui  $27, 0x7cca			# $27=0x7cca0000
    ori  $27, $27, 0x7b3b			# $27=0x7cca7b3b
    lui  $28, 0x3ede			# $28=0x3ede0000
    ori  $28, $28, 0xa612			# $28=0x3edea612
    lui  $29, 0x7944			# $29=0x79440000
    ori  $29, $29, 0x912f			# $29=0x7944912f
    lui  $30, 0x3f60			# $30=0x3f600000
    ori  $30, $30, 0xf5a5			# $30=0x3f60f5a5
    lui  $31, 0x3752			# $31=0x37520000
    ori  $31, $31, 0xc909			# $31=0x3752c909
    movn  $17, $11, $10			# $17=0xe9075bcf
    movn  $9, $21, $7			# $9=0x0f8ddbec
    movn  $7, $19, $0			# skip
    movn  $9, $6, $17			# $9=0x760ca444
    movn  $25, $4, $26			# $25=0x00eeb9fc
    movn  $0, $28, $8			# $0=0x3edea612
    movn  $4, $31, $22			# $4=0x3752c909
    movn  $5, $3, $7			# $5=0x5da29738
    movn  $29, $0, $10			# $29=0x00000000
    movn  $11, $11, $6			# $11=0xe9075bcf
    movn  $23, $18, $7			# $23=0x70dc5d26
    movn  $9, $4, $21			# $9=0x3752c909
    movn  $10, $17, $21			# $10=0xe9075bcf
    movn  $7, $0, $10			# $7=0x00000000
    movn  $25, $27, $30			# $25=0x7cca7b3b
    movn  $21, $12, $16			# $21=0xc7441a02
    movn  $0, $21, $18			# $0=0xc7441a02
    movn  $17, $20, $0			# skip
    movn  $30, $12, $29			# skip
    movn  $26, $9, $21			# $26=0x3752c909
