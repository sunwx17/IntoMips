    .org 0x0
    .global _start
    .set noat
    .set noreorder
    .set nomacro
_start:
    lui  $0, 0xaf09			# $0=0xaf090000
    ori  $0, $0, 0x74df			# $0=0x000074df
    lui  $1, 0x218f			# $1=0x218f0000
    ori  $1, $1, 0xdd36			# $1=0x218fdd36
    lui  $2, 0x2e9b			# $2=0x2e9b0000
    ori  $2, $2, 0xc2d3			# $2=0x2e9bc2d3
    lui  $3, 0x79aa			# $3=0x79aa0000
    ori  $3, $3, 0xb123			# $3=0x79aab123
    lui  $4, 0x6c93			# $4=0x6c930000
    ori  $4, $4, 0x98c7			# $4=0x6c9398c7
    lui  $5, 0x6d2c			# $5=0x6d2c0000
    ori  $5, $5, 0x8107			# $5=0x6d2c8107
    lui  $6, 0xd291			# $6=0xd2910000
    ori  $6, $6, 0xa8af			# $6=0xd291a8af
    lui  $7, 0xebd2			# $7=0xebd20000
    ori  $7, $7, 0xc4e3			# $7=0xebd2c4e3
    lui  $8, 0xd508			# $8=0xd5080000
    ori  $8, $8, 0x1bce			# $8=0xd5081bce
    lui  $9, 0x21f2			# $9=0x21f20000
    ori  $9, $9, 0xd5c9			# $9=0x21f2d5c9
    lui  $10, 0xb939			# $10=0xb9390000
    ori  $10, $10, 0xe635			# $10=0xb939e635
    lui  $11, 0xfbbe			# $11=0xfbbe0000
    ori  $11, $11, 0x7cd0			# $11=0xfbbe7cd0
    lui  $12, 0x0bab			# $12=0x0bab0000
    ori  $12, $12, 0xcfce			# $12=0x0babcfce
    lui  $13, 0x5d70			# $13=0x5d700000
    ori  $13, $13, 0x9407			# $13=0x5d709407
    lui  $14, 0x7da4			# $14=0x7da40000
    ori  $14, $14, 0x6917			# $14=0x7da46917
    lui  $15, 0x1e9a			# $15=0x1e9a0000
    ori  $15, $15, 0x8e0e			# $15=0x1e9a8e0e
    lui  $16, 0x7ead			# $16=0x7ead0000
    ori  $16, $16, 0xee34			# $16=0x7eadee34
    lui  $17, 0xca09			# $17=0xca090000
    ori  $17, $17, 0xa423			# $17=0xca09a423
    lui  $18, 0x2a80			# $18=0x2a800000
    ori  $18, $18, 0x72e6			# $18=0x2a8072e6
    lui  $19, 0xeb2f			# $19=0xeb2f0000
    ori  $19, $19, 0xdb36			# $19=0xeb2fdb36
    lui  $20, 0x7e94			# $20=0x7e940000
    ori  $20, $20, 0x1d73			# $20=0x7e941d73
    lui  $21, 0x8dfa			# $21=0x8dfa0000
    ori  $21, $21, 0x8c22			# $21=0x8dfa8c22
    lui  $22, 0x2840			# $22=0x28400000
    ori  $22, $22, 0x12ae			# $22=0x284012ae
    lui  $23, 0x5abd			# $23=0x5abd0000
    ori  $23, $23, 0x26a9			# $23=0x5abd26a9
    lui  $24, 0x7707			# $24=0x77070000
    ori  $24, $24, 0x211b			# $24=0x7707211b
    lui  $25, 0xc62b			# $25=0xc62b0000
    ori  $25, $25, 0x1c66			# $25=0xc62b1c66
    lui  $26, 0x0f5a			# $26=0x0f5a0000
    ori  $26, $26, 0xfba4			# $26=0x0f5afba4
    lui  $27, 0xe508			# $27=0xe5080000
    ori  $27, $27, 0x3f02			# $27=0xe5083f02
    lui  $28, 0x6789			# $28=0x67890000
    ori  $28, $28, 0x0241			# $28=0x67890241
    lui  $29, 0x7143			# $29=0x71430000
    ori  $29, $29, 0x0a33			# $29=0x71430a33
    lui  $30, 0xd2d4			# $30=0xd2d40000
    ori  $30, $30, 0x0c9a			# $30=0xd2d40c9a
    lui  $31, 0x0efc			# $31=0x0efc0000
    ori  $31, $31, 0x4f52			# $31=0x0efc4f52
    movz  $7, $0, $11			# skip
    movz  $4, $27, $8			# skip
    movz  $29, $28, $16			# skip
    movz  $5, $7, $15			# skip
    movz  $15, $9, $11			# skip
    movz  $31, $3, $9			# skip
    movz  $10, $17, $23			# skip
    movz  $3, $20, $19			# skip
    movz  $13, $21, $18			# skip
    movz  $13, $11, $4			# skip
    movz  $27, $10, $15			# skip
    movz  $5, $6, $2			# skip
    movz  $6, $0, $8			# skip
    movz  $12, $5, $31			# skip
    movz  $10, $22, $9			# skip
    movz  $19, $7, $25			# skip
    movz  $7, $28, $11			# skip
    movz  $0, $22, $2			# skip
    movz  $3, $16, $2			# skip
    movz  $10, $10, $7			# skip
