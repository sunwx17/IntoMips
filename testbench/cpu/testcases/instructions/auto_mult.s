    .org 0x0
    .global _start
    .set noat
    .set noreorder
    .set nomacro
_start:
    lui  $0, 0x470c			# $0=0x470c0000
    ori  $0, $0, 0x6b0d			# $0=0x00006b0d
    lui  $1, 0xc0b5			# $1=0xc0b50000
    ori  $1, $1, 0xb442			# $1=0xc0b5b442
    lui  $2, 0xc67a			# $2=0xc67a0000
    ori  $2, $2, 0x1d1b			# $2=0xc67a1d1b
    lui  $3, 0xcf94			# $3=0xcf940000
    ori  $3, $3, 0xeedf			# $3=0xcf94eedf
    lui  $4, 0xbb94			# $4=0xbb940000
    ori  $4, $4, 0x1e12			# $4=0xbb941e12
    lui  $5, 0x1b49			# $5=0x1b490000
    ori  $5, $5, 0x59db			# $5=0x1b4959db
    lui  $6, 0x7c3a			# $6=0x7c3a0000
    ori  $6, $6, 0x76a7			# $6=0x7c3a76a7
    lui  $7, 0x1c56			# $7=0x1c560000
    ori  $7, $7, 0x2752			# $7=0x1c562752
    lui  $8, 0xf79b			# $8=0xf79b0000
    ori  $8, $8, 0xb584			# $8=0xf79bb584
    lui  $9, 0xb9e5			# $9=0xb9e50000
    ori  $9, $9, 0x06a1			# $9=0xb9e506a1
    lui  $10, 0x71d1			# $10=0x71d10000
    ori  $10, $10, 0x2dff			# $10=0x71d12dff
    lui  $11, 0xd6dc			# $11=0xd6dc0000
    ori  $11, $11, 0x3889			# $11=0xd6dc3889
    lui  $12, 0xb26d			# $12=0xb26d0000
    ori  $12, $12, 0xbbdd			# $12=0xb26dbbdd
    lui  $13, 0x7b9e			# $13=0x7b9e0000
    ori  $13, $13, 0x9b2b			# $13=0x7b9e9b2b
    lui  $14, 0xa3b7			# $14=0xa3b70000
    ori  $14, $14, 0x1e8c			# $14=0xa3b71e8c
    lui  $15, 0x67ec			# $15=0x67ec0000
    ori  $15, $15, 0x994b			# $15=0x67ec994b
    lui  $16, 0x914b			# $16=0x914b0000
    ori  $16, $16, 0x9159			# $16=0x914b9159
    lui  $17, 0x3a98			# $17=0x3a980000
    ori  $17, $17, 0x057d			# $17=0x3a98057d
    lui  $18, 0xb36d			# $18=0xb36d0000
    ori  $18, $18, 0x17f2			# $18=0xb36d17f2
    lui  $19, 0x607d			# $19=0x607d0000
    ori  $19, $19, 0x499c			# $19=0x607d499c
    lui  $20, 0x9866			# $20=0x98660000
    ori  $20, $20, 0x5e5a			# $20=0x98665e5a
    lui  $21, 0x85a2			# $21=0x85a20000
    ori  $21, $21, 0xd82c			# $21=0x85a2d82c
    lui  $22, 0x2d43			# $22=0x2d430000
    ori  $22, $22, 0x0c18			# $22=0x2d430c18
    lui  $23, 0x9856			# $23=0x98560000
    ori  $23, $23, 0xea4f			# $23=0x9856ea4f
    lui  $24, 0x3cc7			# $24=0x3cc70000
    ori  $24, $24, 0xd7d7			# $24=0x3cc7d7d7
    lui  $25, 0x052b			# $25=0x052b0000
    ori  $25, $25, 0x843e			# $25=0x052b843e
    lui  $26, 0x3450			# $26=0x34500000
    ori  $26, $26, 0x55c1			# $26=0x345055c1
    lui  $27, 0xedb8			# $27=0xedb80000
    ori  $27, $27, 0x9998			# $27=0xedb89998
    lui  $28, 0xf85c			# $28=0xf85c0000
    ori  $28, $28, 0x9d10			# $28=0xf85c9d10
    lui  $29, 0xdc4a			# $29=0xdc4a0000
    ori  $29, $29, 0xb6d8			# $29=0xdc4ab6d8
    lui  $30, 0x407d			# $30=0x407d0000
    ori  $30, $30, 0xdc0d			# $30=0x407ddc0d
    lui  $31, 0x9ec4			# $31=0x9ec40000
    ori  $31, $31, 0x8bc8			# $31=0x9ec48bc8
    mult  $21, $19			# hi=0xd1e12e64,lo=0xec5c46d0
    mult  $27, $8			# hi=0x00996468,lo=0xbecfaa60
    mult  $7, $28			# hi=0xff278f1e,lo=0x2cf7bf20
    mult  $27, $1			# hi=0x0484e03f,lo=0xae0e7930
    mult  $17, $11			# hi=0xf69576ae,lo=0xd1fa47e5
    mult  $14, $16			# hi=0x27e85c01,lo=0xe1faeaac
    mult  $23, $20			# hi=0x29f33d3c,lo=0xbc1161c6
    mult  $5, $21			# hi=0xf2f51d49,lo=0x380239a4
    mult  $22, $31			# hi=0xeecf156a,lo=0xd6527ac0
    mult  $22, $23			# hi=0xedac2109,lo=0x90ceab68
    mult  $19, $25			# hi=0x01f2d953,lo=0x618043c8
    mult  $22, $11			# hi=0xf8b9efa1,lo=0x5826b8d8
    mult  $31, $11			# hi=0x0fa01c80,lo=0x45a28e08
    mult  $14, $17			# hi=0xeae0afab,lo=0x5f22a65c
    mult  $0, $22			# hi=0x00000000,lo=0x00000000
    mult  $16, $23			# hi=0x2cd3b703,lo=0x95133477
    mult  $12, $2			# hi=0x116e22e9,lo=0xb52cd94f
    mult  $27, $7			# hi=0xfdfa0a01,lo=0x7d975ab0
    mult  $4, $19			# hi=0xe6360eec,lo=0xf99f74f8
    mult  $27, $13			# hi=0xf72c5ea6,lo=0x86d0d488
