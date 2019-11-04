    .org 0x0
    .global _start
    .set noat
    .set noreorder
    .set nomacro
_start:
    lui  $0, 0xe32e			# $0=0xe32e0000
    ori  $0, $0, 0xc768			# $0=0x0000c768
    lui  $1, 0xff9a			# $1=0xff9a0000
    ori  $1, $1, 0x9669			# $1=0xff9a9669
    lui  $2, 0xbc9d			# $2=0xbc9d0000
    ori  $2, $2, 0x03e3			# $2=0xbc9d03e3
    lui  $3, 0x01b1			# $3=0x01b10000
    ori  $3, $3, 0x1c7a			# $3=0x01b11c7a
    lui  $4, 0x745c			# $4=0x745c0000
    ori  $4, $4, 0x15e7			# $4=0x745c15e7
    lui  $5, 0x596d			# $5=0x596d0000
    ori  $5, $5, 0x1f76			# $5=0x596d1f76
    lui  $6, 0xe7e8			# $6=0xe7e80000
    ori  $6, $6, 0x9779			# $6=0xe7e89779
    lui  $7, 0x2e51			# $7=0x2e510000
    ori  $7, $7, 0x776f			# $7=0x2e51776f
    lui  $8, 0xfa17			# $8=0xfa170000
    ori  $8, $8, 0xffca			# $8=0xfa17ffca
    lui  $9, 0xb017			# $9=0xb0170000
    ori  $9, $9, 0x5824			# $9=0xb0175824
    lui  $10, 0xcb1d			# $10=0xcb1d0000
    ori  $10, $10, 0x8692			# $10=0xcb1d8692
    lui  $11, 0x3bc2			# $11=0x3bc20000
    ori  $11, $11, 0x9de9			# $11=0x3bc29de9
    lui  $12, 0xb8b9			# $12=0xb8b90000
    ori  $12, $12, 0x44d9			# $12=0xb8b944d9
    lui  $13, 0x9ae0			# $13=0x9ae00000
    ori  $13, $13, 0xd8b3			# $13=0x9ae0d8b3
    lui  $14, 0xae56			# $14=0xae560000
    ori  $14, $14, 0x1b3a			# $14=0xae561b3a
    lui  $15, 0x63e1			# $15=0x63e10000
    ori  $15, $15, 0x3916			# $15=0x63e13916
    lui  $16, 0x7382			# $16=0x73820000
    ori  $16, $16, 0x2ede			# $16=0x73822ede
    lui  $17, 0x956c			# $17=0x956c0000
    ori  $17, $17, 0x9a11			# $17=0x956c9a11
    lui  $18, 0x4f48			# $18=0x4f480000
    ori  $18, $18, 0xfca8			# $18=0x4f48fca8
    lui  $19, 0xb1f1			# $19=0xb1f10000
    ori  $19, $19, 0xce3c			# $19=0xb1f1ce3c
    lui  $20, 0x66a0			# $20=0x66a00000
    ori  $20, $20, 0xe828			# $20=0x66a0e828
    lui  $21, 0xe880			# $21=0xe8800000
    ori  $21, $21, 0x166d			# $21=0xe880166d
    lui  $22, 0x8467			# $22=0x84670000
    ori  $22, $22, 0xa6fa			# $22=0x8467a6fa
    lui  $23, 0x01bd			# $23=0x01bd0000
    ori  $23, $23, 0x2fb9			# $23=0x01bd2fb9
    lui  $24, 0x5d6c			# $24=0x5d6c0000
    ori  $24, $24, 0xa70b			# $24=0x5d6ca70b
    lui  $25, 0x2529			# $25=0x25290000
    ori  $25, $25, 0xfa87			# $25=0x2529fa87
    lui  $26, 0x1641			# $26=0x16410000
    ori  $26, $26, 0x2bb3			# $26=0x16412bb3
    lui  $27, 0xb7e2			# $27=0xb7e20000
    ori  $27, $27, 0xa569			# $27=0xb7e2a569
    lui  $28, 0x0366			# $28=0x03660000
    ori  $28, $28, 0x12d6			# $28=0x036612d6
    lui  $29, 0xfeaf			# $29=0xfeaf0000
    ori  $29, $29, 0x784d			# $29=0xfeaf784d
    lui  $30, 0xcf93			# $30=0xcf930000
    ori  $30, $30, 0xf196			# $30=0xcf93f196
    lui  $31, 0xa4ae			# $31=0xa4ae0000
    ori  $31, $31, 0x765a			# $31=0xa4ae765a
    multu  $17, $3			# hi=0x00fccd4f,lo=0xad5c481a
    multu  $4, $16			# hi=0x348089e7,lo=0x58188052
    multu  $21, $8			# hi=0xe322e1b7,lo=0x81334502
    multu  $26, $21			# hi=0x14363223,lo=0x2500fd37
    multu  $11, $12			# hi=0x2b1f2135,lo=0xef4abe81
    multu  $30, $31			# hi=0x85883d49,lo=0x775212bc
    multu  $8, $29			# hi=0xf8cf3bb8,lo=0xc0349fc2
    multu  $10, $6			# hi=0xb8002f5e,lo=0x1da4b902
    multu  $31, $1			# hi=0xa46d3998,lo=0x9d0b46ea
    multu  $30, $31			# hi=0x85883d49,lo=0x775212bc
    multu  $11, $11			# hi=0x0df348bd,lo=0x1c8b9e11
    multu  $5, $18			# hi=0x1bb22ba8,lo=0x5dc4cd70
    multu  $15, $3			# hi=0x00a8fb0d,lo=0xc9c99c7c
    multu  $5, $10			# hi=0x46f3d851,lo=0x4111b54c
    multu  $8, $17			# hi=0x91fa1083,lo=0x86af806a
    multu  $5, $28			# hi=0x012fef6d,lo=0x587298a4
    multu  $11, $4			# hi=0x1b29ae9b,lo=0x374c9a3f
    multu  $23, $6			# hi=0x01934a8a,lo=0x9839ad71
    multu  $27, $18			# hi=0x38f35e45,lo=0xb417e8e8
    multu  $29, $17			# hi=0x94a82c52,lo=0x09814f1d
