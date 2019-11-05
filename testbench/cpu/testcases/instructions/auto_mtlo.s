    .org 0x0
    .global _start
    .set noat
    .set noreorder
    .set nomacro
_start:
    lui  $0, 0xc509			# $0=0xc5090000
    ori  $0, $0, 0x5a53			# $0=0x00005a53
    lui  $1, 0x072c			# $1=0x072c0000
    ori  $1, $1, 0x301a			# $1=0x072c301a
    lui  $2, 0x3a7d			# $2=0x3a7d0000
    ori  $2, $2, 0x50c9			# $2=0x3a7d50c9
    lui  $3, 0x7e99			# $3=0x7e990000
    ori  $3, $3, 0xd3d6			# $3=0x7e99d3d6
    lui  $4, 0x7f77			# $4=0x7f770000
    ori  $4, $4, 0x8312			# $4=0x7f778312
    lui  $5, 0x35c9			# $5=0x35c90000
    ori  $5, $5, 0xfbe3			# $5=0x35c9fbe3
    lui  $6, 0xe93e			# $6=0xe93e0000
    ori  $6, $6, 0x64a4			# $6=0xe93e64a4
    lui  $7, 0xe3bc			# $7=0xe3bc0000
    ori  $7, $7, 0xaf8a			# $7=0xe3bcaf8a
    lui  $8, 0x1527			# $8=0x15270000
    ori  $8, $8, 0x5738			# $8=0x15275738
    lui  $9, 0xed3f			# $9=0xed3f0000
    ori  $9, $9, 0xc556			# $9=0xed3fc556
    lui  $10, 0x3afd			# $10=0x3afd0000
    ori  $10, $10, 0x4169			# $10=0x3afd4169
    lui  $11, 0xf4b2			# $11=0xf4b20000
    ori  $11, $11, 0x7ef5			# $11=0xf4b27ef5
    lui  $12, 0x47c9			# $12=0x47c90000
    ori  $12, $12, 0xa303			# $12=0x47c9a303
    lui  $13, 0x3a6e			# $13=0x3a6e0000
    ori  $13, $13, 0x27f2			# $13=0x3a6e27f2
    lui  $14, 0xe100			# $14=0xe1000000
    ori  $14, $14, 0x53b5			# $14=0xe10053b5
    lui  $15, 0xff99			# $15=0xff990000
    ori  $15, $15, 0xce6e			# $15=0xff99ce6e
    lui  $16, 0xd438			# $16=0xd4380000
    ori  $16, $16, 0x2dbd			# $16=0xd4382dbd
    lui  $17, 0xbd24			# $17=0xbd240000
    ori  $17, $17, 0x65a5			# $17=0xbd2465a5
    lui  $18, 0xd421			# $18=0xd4210000
    ori  $18, $18, 0x23ee			# $18=0xd42123ee
    lui  $19, 0xd32c			# $19=0xd32c0000
    ori  $19, $19, 0xb3b7			# $19=0xd32cb3b7
    lui  $20, 0x2ef1			# $20=0x2ef10000
    ori  $20, $20, 0xe3fd			# $20=0x2ef1e3fd
    lui  $21, 0xa7f6			# $21=0xa7f60000
    ori  $21, $21, 0x4ee6			# $21=0xa7f64ee6
    lui  $22, 0x300f			# $22=0x300f0000
    ori  $22, $22, 0x57a7			# $22=0x300f57a7
    lui  $23, 0xbd57			# $23=0xbd570000
    ori  $23, $23, 0x6cb4			# $23=0xbd576cb4
    lui  $24, 0x61db			# $24=0x61db0000
    ori  $24, $24, 0xd9c8			# $24=0x61dbd9c8
    lui  $25, 0xb84f			# $25=0xb84f0000
    ori  $25, $25, 0x52b6			# $25=0xb84f52b6
    lui  $26, 0xe9ca			# $26=0xe9ca0000
    ori  $26, $26, 0x3c7c			# $26=0xe9ca3c7c
    lui  $27, 0x9aae			# $27=0x9aae0000
    ori  $27, $27, 0xcd5a			# $27=0x9aaecd5a
    lui  $28, 0x1591			# $28=0x15910000
    ori  $28, $28, 0xa1f4			# $28=0x1591a1f4
    lui  $29, 0xe076			# $29=0xe0760000
    ori  $29, $29, 0xf45d			# $29=0xe076f45d
    lui  $30, 0x1d07			# $30=0x1d070000
    ori  $30, $30, 0x10d4			# $30=0x1d0710d4
    lui  $31, 0x8ce7			# $31=0x8ce70000
    ori  $31, $31, 0xce88			# $31=0x8ce7ce88
    mtlo  $0			# hi=0x00000000,lo=0x00000000
    mtlo  $12			# hi=0x00000000,lo=0x47c9a303
    mtlo  $15			# hi=0x00000000,lo=0xff99ce6e
    mtlo  $29			# hi=0x00000000,lo=0xe076f45d
    mtlo  $10			# hi=0x00000000,lo=0x3afd4169
    mtlo  $5			# hi=0x00000000,lo=0x35c9fbe3
    mtlo  $20			# hi=0x00000000,lo=0x2ef1e3fd
    mtlo  $5			# hi=0x00000000,lo=0x35c9fbe3
    mtlo  $10			# hi=0x00000000,lo=0x3afd4169
    mtlo  $4			# hi=0x00000000,lo=0x7f778312
    mtlo  $19			# hi=0x00000000,lo=0xd32cb3b7
    mtlo  $9			# hi=0x00000000,lo=0xed3fc556
    mtlo  $26			# hi=0x00000000,lo=0xe9ca3c7c
    mtlo  $5			# hi=0x00000000,lo=0x35c9fbe3
    mtlo  $2			# hi=0x00000000,lo=0x3a7d50c9
    mtlo  $2			# hi=0x00000000,lo=0x3a7d50c9
    mtlo  $18			# hi=0x00000000,lo=0xd42123ee
    mtlo  $17			# hi=0x00000000,lo=0xbd2465a5
    mtlo  $2			# hi=0x00000000,lo=0x3a7d50c9
    mtlo  $13			# hi=0x00000000,lo=0x3a6e27f2
