    .org 0x0
    .global _start
    .set noat
    .set noreorder
    .set nomacro
_start:
    lui  $0, 0x81e4			# $0=0x81e40000
    ori  $0, $0, 0x5e68			# $0=0x00005e68
    lui  $1, 0xc767			# $1=0xc7670000
    ori  $1, $1, 0x5269			# $1=0xc7675269
    lui  $2, 0xdc1c			# $2=0xdc1c0000
    ori  $2, $2, 0x04eb			# $2=0xdc1c04eb
    lui  $3, 0x2bac			# $3=0x2bac0000
    ori  $3, $3, 0x9111			# $3=0x2bac9111
    lui  $4, 0xc128			# $4=0xc1280000
    ori  $4, $4, 0x2964			# $4=0xc1282964
    lui  $5, 0xdec1			# $5=0xdec10000
    ori  $5, $5, 0x998f			# $5=0xdec1998f
    lui  $6, 0xbc02			# $6=0xbc020000
    ori  $6, $6, 0x69e2			# $6=0xbc0269e2
    lui  $7, 0xe297			# $7=0xe2970000
    ori  $7, $7, 0x2e95			# $7=0xe2972e95
    lui  $8, 0x9ba5			# $8=0x9ba50000
    ori  $8, $8, 0xf510			# $8=0x9ba5f510
    lui  $9, 0x6ac5			# $9=0x6ac50000
    ori  $9, $9, 0x0bb8			# $9=0x6ac50bb8
    lui  $10, 0xaaef			# $10=0xaaef0000
    ori  $10, $10, 0x089f			# $10=0xaaef089f
    lui  $11, 0x746c			# $11=0x746c0000
    ori  $11, $11, 0xa3b5			# $11=0x746ca3b5
    lui  $12, 0x9bcc			# $12=0x9bcc0000
    ori  $12, $12, 0x3010			# $12=0x9bcc3010
    lui  $13, 0x048c			# $13=0x048c0000
    ori  $13, $13, 0x693e			# $13=0x048c693e
    lui  $14, 0x089f			# $14=0x089f0000
    ori  $14, $14, 0x3c87			# $14=0x089f3c87
    lui  $15, 0x551d			# $15=0x551d0000
    ori  $15, $15, 0xa06b			# $15=0x551da06b
    lui  $16, 0xe1e2			# $16=0xe1e20000
    ori  $16, $16, 0x4fe3			# $16=0xe1e24fe3
    lui  $17, 0x2e6f			# $17=0x2e6f0000
    ori  $17, $17, 0x970f			# $17=0x2e6f970f
    lui  $18, 0x989a			# $18=0x989a0000
    ori  $18, $18, 0x7145			# $18=0x989a7145
    lui  $19, 0x14ff			# $19=0x14ff0000
    ori  $19, $19, 0x8f1c			# $19=0x14ff8f1c
    lui  $20, 0x668b			# $20=0x668b0000
    ori  $20, $20, 0x33ec			# $20=0x668b33ec
    lui  $21, 0x713f			# $21=0x713f0000
    ori  $21, $21, 0x9d94			# $21=0x713f9d94
    lui  $22, 0x847e			# $22=0x847e0000
    ori  $22, $22, 0x40fa			# $22=0x847e40fa
    lui  $23, 0xf785			# $23=0xf7850000
    ori  $23, $23, 0x8cb8			# $23=0xf7858cb8
    lui  $24, 0x95a5			# $24=0x95a50000
    ori  $24, $24, 0x07e7			# $24=0x95a507e7
    lui  $25, 0x80c4			# $25=0x80c40000
    ori  $25, $25, 0x629b			# $25=0x80c4629b
    lui  $26, 0x5a4f			# $26=0x5a4f0000
    ori  $26, $26, 0x31e1			# $26=0x5a4f31e1
    lui  $27, 0xaf2a			# $27=0xaf2a0000
    ori  $27, $27, 0xeb05			# $27=0xaf2aeb05
    lui  $28, 0x41d8			# $28=0x41d80000
    ori  $28, $28, 0x0944			# $28=0x41d80944
    lui  $29, 0x98c2			# $29=0x98c20000
    ori  $29, $29, 0x93a8			# $29=0x98c293a8
    lui  $30, 0xa94f			# $30=0xa94f0000
    ori  $30, $30, 0x383e			# $30=0xa94f383e
    lui  $31, 0xee9b			# $31=0xee9b0000
    ori  $31, $31, 0xe0bd			# $31=0xee9be0bd
    multu  $12, $28			# hi=0x28125220,lo=0x2d6d5440
    multu  $23, $3			# hi=0x2a3a48a0,lo=0x88329038
    multu  $28, $31			# hi=0x3d5ef038,lo=0x78c65734
    multu  $25, $16			# hi=0x719e7038,lo=0x10674471
    multu  $5, $19			# hi=0x12457f5d,lo=0xa364aca4
    multu  $26, $22			# hi=0x2ebd5f9e,lo=0x8e8cf5ba
    multu  $16, $13			# hi=0x04036ddf,lo=0xc3b773fa
    multu  $29, $25			# hi=0x4cd679a4,lo=0x06f5b6b8
    multu  $2, $7			# hi=0xc2d2b8eb,lo=0x81ce16c7
    multu  $8, $22			# hi=0x508e558c,lo=0x5b3551a0
    multu  $10, $8			# hi=0x67ed89ea,lo=0x45abb4f0
    multu  $2, $1			# hi=0xab729df3,lo=0xe89e4a63
    multu  $26, $7			# hi=0x4fef3f2d,lo=0xd8c575f5
    multu  $23, $16			# hi=0xda6731d1,lo=0xa4488f28
    multu  $7, $21			# hi=0x643d0a3d,lo=0xf2a34f24
    multu  $12, $16			# hi=0x8978311e,lo=0xa7038e30
    multu  $28, $8			# hi=0x28087ce2,lo=0x0332a840
    multu  $14, $10			# hi=0x05c1cb25,lo=0x7cd3cfd9
    multu  $14, $23			# hi=0x085622dd,lo=0xfab05508
    multu  $26, $3			# hi=0x0f682dc3,lo=0x28aec0f1
