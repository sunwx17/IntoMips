    .org 0x0
    .global _start
    .set noat
    .set noreorder
    .set nomacro
_start:
    lui  $0, 0xb8f3			# $0=0xb8f30000
    ori  $0, $0, 0x4dc2			# $0=0x00004dc2
    lui  $1, 0x47c4			# $1=0x47c40000
    ori  $1, $1, 0x9f10			# $1=0x47c49f10
    lui  $2, 0x3f5d			# $2=0x3f5d0000
    ori  $2, $2, 0x4941			# $2=0x3f5d4941
    lui  $3, 0xa604			# $3=0xa6040000
    ori  $3, $3, 0x2db7			# $3=0xa6042db7
    lui  $4, 0x84eb			# $4=0x84eb0000
    ori  $4, $4, 0x83e3			# $4=0x84eb83e3
    lui  $5, 0x3231			# $5=0x32310000
    ori  $5, $5, 0xf7a4			# $5=0x3231f7a4
    lui  $6, 0x8c04			# $6=0x8c040000
    ori  $6, $6, 0xd1f2			# $6=0x8c04d1f2
    lui  $7, 0x43fe			# $7=0x43fe0000
    ori  $7, $7, 0x51e8			# $7=0x43fe51e8
    lui  $8, 0x9cf8			# $8=0x9cf80000
    ori  $8, $8, 0x1244			# $8=0x9cf81244
    lui  $9, 0x1a2c			# $9=0x1a2c0000
    ori  $9, $9, 0x45d2			# $9=0x1a2c45d2
    lui  $10, 0x6b76			# $10=0x6b760000
    ori  $10, $10, 0x5e49			# $10=0x6b765e49
    lui  $11, 0xa824			# $11=0xa8240000
    ori  $11, $11, 0x8e5a			# $11=0xa8248e5a
    lui  $12, 0xe939			# $12=0xe9390000
    ori  $12, $12, 0xd4ad			# $12=0xe939d4ad
    lui  $13, 0xb9e1			# $13=0xb9e10000
    ori  $13, $13, 0x8b5e			# $13=0xb9e18b5e
    lui  $14, 0x96b3			# $14=0x96b30000
    ori  $14, $14, 0xba8d			# $14=0x96b3ba8d
    lui  $15, 0x0871			# $15=0x08710000
    ori  $15, $15, 0xd309			# $15=0x0871d309
    lui  $16, 0x4656			# $16=0x46560000
    ori  $16, $16, 0x531c			# $16=0x4656531c
    lui  $17, 0x5e5e			# $17=0x5e5e0000
    ori  $17, $17, 0x0136			# $17=0x5e5e0136
    lui  $18, 0x3b01			# $18=0x3b010000
    ori  $18, $18, 0x8b84			# $18=0x3b018b84
    lui  $19, 0xfc6a			# $19=0xfc6a0000
    ori  $19, $19, 0xe3d7			# $19=0xfc6ae3d7
    lui  $20, 0x4fe6			# $20=0x4fe60000
    ori  $20, $20, 0x1e28			# $20=0x4fe61e28
    lui  $21, 0x4d64			# $21=0x4d640000
    ori  $21, $21, 0xebd6			# $21=0x4d64ebd6
    lui  $22, 0xc4e3			# $22=0xc4e30000
    ori  $22, $22, 0x7846			# $22=0xc4e37846
    lui  $23, 0x0e63			# $23=0x0e630000
    ori  $23, $23, 0xf012			# $23=0x0e63f012
    lui  $24, 0x734d			# $24=0x734d0000
    ori  $24, $24, 0x839f			# $24=0x734d839f
    lui  $25, 0x6616			# $25=0x66160000
    ori  $25, $25, 0xf29f			# $25=0x6616f29f
    lui  $26, 0x8317			# $26=0x83170000
    ori  $26, $26, 0xf7f7			# $26=0x8317f7f7
    lui  $27, 0xaa32			# $27=0xaa320000
    ori  $27, $27, 0x4b35			# $27=0xaa324b35
    lui  $28, 0xe5c6			# $28=0xe5c60000
    ori  $28, $28, 0xd262			# $28=0xe5c6d262
    lui  $29, 0x3238			# $29=0x32380000
    ori  $29, $29, 0xd8e8			# $29=0x3238d8e8
    lui  $30, 0x5176			# $30=0x51760000
    ori  $30, $30, 0x195f			# $30=0x5176195f
    lui  $31, 0x7602			# $31=0x76020000
    ori  $31, $31, 0xabdf			# $31=0x7602abdf
    ori  $23, $15, 0x3726			# $23=0x0871f72f
    ori  $1, $24, 0x0f98			# $1=0x734d8f9f
    ori  $16, $3, 0x10da			# $16=0xa6043dff
    ori  $30, $3, 0x1dd6			# $30=0xa6043df7
    ori  $31, $23, 0x264b			# $31=0x0871f76f
    ori  $13, $17, 0xdd36			# $13=0x5e5edd36
    ori  $15, $13, 0x33f7			# $15=0x5e5efff7
    ori  $10, $8, 0x054f			# $10=0x9cf8174f
    ori  $18, $14, 0x07b2			# $18=0x96b3bfbf
    ori  $16, $16, 0xc54c			# $16=0xa604fdff
    ori  $13, $12, 0x7ed7			# $13=0xe939feff
    ori  $23, $0, 0xf5cb			# $23=0x0000f5cb
    ori  $29, $21, 0xda3b			# $29=0x4d64fbff
    ori  $4, $26, 0xcc48			# $4=0x8317ffff
    ori  $23, $18, 0x9aa2			# $23=0x96b3bfbf
    ori  $12, $11, 0x3ca0			# $12=0xa824befa
    ori  $24, $12, 0x415f			# $24=0xa824ffff
    ori  $18, $5, 0xb25e			# $18=0x3231f7fe
    ori  $12, $14, 0xf61a			# $12=0x96b3fe9f
    ori  $22, $25, 0xbddf			# $22=0x6616ffdf
    ori  $27, $0, 0xbbc2			# $27=0x0000bbc2
    ori  $14, $22, 0x38bf			# $14=0x6616ffff
    ori  $4, $15, 0x24fc			# $4=0x5e5effff
    ori  $0, $22, 0x30a5			# $0=0x6616ffff
    ori  $5, $11, 0x67e1			# $5=0xa824effb
    ori  $7, $26, 0x50ca			# $7=0x8317f7ff
    ori  $16, $7, 0x5208			# $16=0x8317f7ff
    ori  $20, $2, 0x59f0			# $20=0x3f5d59f1
    ori  $23, $16, 0x60d9			# $23=0x8317f7ff
    ori  $17, $24, 0x5045			# $17=0xa824ffff
    ori  $15, $6, 0x465a			# $15=0x8c04d7fa
    ori  $18, $28, 0x1809			# $18=0xe5c6da6b
    ori  $20, $18, 0x9132			# $20=0xe5c6db7b
    ori  $11, $15, 0xd739			# $11=0x8c04d7fb
    ori  $26, $8, 0xb9af			# $26=0x9cf8bbef
    ori  $18, $23, 0xd155			# $18=0x8317f7ff
    ori  $28, $29, 0xd0cd			# $28=0x4d64fbff
    ori  $9, $5, 0xedde			# $9=0xa824efff
    ori  $4, $23, 0xdef3			# $4=0x8317ffff
    ori  $12, $13, 0x99b6			# $12=0xe939ffff
    ori  $19, $0, 0xa71b			# $19=0x0000a71b
    ori  $28, $6, 0xa995			# $28=0x8c04f9f7
    ori  $1, $30, 0x0c9b			# $1=0xa6043dff
    ori  $20, $24, 0x68b0			# $20=0xa824ffff
    ori  $5, $23, 0x0a3a			# $5=0x8317ffff
    ori  $1, $27, 0xac73			# $1=0x0000bff3
    ori  $24, $21, 0x5b24			# $24=0x4d64fbf6
    ori  $31, $28, 0x9ae1			# $31=0x8c04fbf7
    ori  $1, $18, 0xc221			# $1=0x8317f7ff
    ori  $4, $1, 0xae80			# $4=0x8317ffff
    ori  $5, $24, 0xbda7			# $5=0x4d64fff7
    ori  $4, $30, 0xdb04			# $4=0xa604fff7
    ori  $27, $4, 0x732e			# $27=0xa604ffff
    ori  $10, $23, 0x9446			# $10=0x8317f7ff
    ori  $22, $31, 0xee42			# $22=0x8c04fff7
    ori  $23, $29, 0xbb76			# $23=0x4d64fbff
    ori  $23, $9, 0x6760			# $23=0xa824efff
    ori  $5, $27, 0xa3b0			# $5=0xa604ffff
    ori  $30, $12, 0x4664			# $30=0xe939ffff
    ori  $4, $28, 0xef7d			# $4=0x8c04ffff
    ori  $31, $19, 0x3952			# $31=0x0000bf5b
    ori  $20, $6, 0xf207			# $20=0x8c04f3f7
    ori  $21, $15, 0x0971			# $21=0x8c04dffb
    ori  $8, $17, 0x23ac			# $8=0xa824ffff
    ori  $20, $10, 0xece4			# $20=0x8317ffff
    ori  $15, $12, 0x8343			# $15=0xe939ffff
    ori  $7, $25, 0x167c			# $7=0x6616f6ff
    ori  $20, $21, 0x9516			# $20=0x8c04dfff
    ori  $22, $14, 0x0323			# $22=0x6616ffff
    ori  $20, $11, 0xee7c			# $20=0x8c04ffff
    ori  $8, $13, 0x6c03			# $8=0xe939feff
    ori  $7, $22, 0xd3e7			# $7=0x6616ffff
    ori  $5, $13, 0x5342			# $5=0xe939ffff
    ori  $10, $24, 0x2552			# $10=0x4d64fff6
    ori  $20, $18, 0x3146			# $20=0x8317f7ff
    ori  $18, $9, 0x96ec			# $18=0xa824ffff
    ori  $16, $11, 0xffdb			# $16=0x8c04fffb
    ori  $12, $8, 0x12c2			# $12=0xe939feff
    ori  $11, $22, 0x94b1			# $11=0x6616ffff
    ori  $2, $6, 0x0ed0			# $2=0x8c04dff2
    ori  $6, $28, 0x02a7			# $6=0x8c04fbf7
    ori  $26, $6, 0x654d			# $26=0x8c04ffff
    ori  $26, $25, 0xfff1			# $26=0x6616ffff
    ori  $11, $25, 0x8f68			# $11=0x6616ffff
    ori  $25, $27, 0xe152			# $25=0xa604ffff
    ori  $12, $7, 0xa57f			# $12=0x6616ffff
    ori  $17, $8, 0x332d			# $17=0xe939ffff
    ori  $6, $18, 0x1877			# $6=0xa824ffff
    ori  $15, $25, 0x0d96			# $15=0xa604ffff
    ori  $1, $30, 0xf3d2			# $1=0xe939ffff
    ori  $6, $10, 0xb06d			# $6=0x4d64ffff
    ori  $9, $18, 0x11eb			# $9=0xa824ffff
    ori  $4, $19, 0x64e5			# $4=0x0000e7ff
    ori  $20, $27, 0xcf99			# $20=0xa604ffff
    ori  $8, $11, 0xea64			# $8=0x6616ffff
    ori  $24, $13, 0x4586			# $24=0xe939ffff
    ori  $0, $13, 0xcabc			# $0=0xe939feff
    ori  $2, $13, 0xc114			# $2=0xe939ffff
    ori  $1, $11, 0x1a4f			# $1=0x6616ffff
    ori  $10, $10, 0x7e65			# $10=0x4d64fff7
