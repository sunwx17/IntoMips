    .org 0x0
    .global _start
    .set noat
    .set noreorder
    .set nomacro
_start:
    lui  $0, 0x3c1d			# $0=0x3c1d0000
    ori  $0, $0, 0x3da5			# $0=0x00003da5
    lui  $1, 0xb416			# $1=0xb4160000
    ori  $1, $1, 0x5ee1			# $1=0xb4165ee1
    lui  $2, 0x96c7			# $2=0x96c70000
    ori  $2, $2, 0xe03a			# $2=0x96c7e03a
    lui  $3, 0x4fc6			# $3=0x4fc60000
    ori  $3, $3, 0xfc53			# $3=0x4fc6fc53
    lui  $4, 0x44bc			# $4=0x44bc0000
    ori  $4, $4, 0x833f			# $4=0x44bc833f
    lui  $5, 0x0fce			# $5=0x0fce0000
    ori  $5, $5, 0xd521			# $5=0x0fced521
    lui  $6, 0x3397			# $6=0x33970000
    ori  $6, $6, 0xe3cf			# $6=0x3397e3cf
    lui  $7, 0x4fa0			# $7=0x4fa00000
    ori  $7, $7, 0xbf84			# $7=0x4fa0bf84
    lui  $8, 0xbf47			# $8=0xbf470000
    ori  $8, $8, 0x3c6c			# $8=0xbf473c6c
    lui  $9, 0xc959			# $9=0xc9590000
    ori  $9, $9, 0xb138			# $9=0xc959b138
    lui  $10, 0x235a			# $10=0x235a0000
    ori  $10, $10, 0xc326			# $10=0x235ac326
    lui  $11, 0xa84f			# $11=0xa84f0000
    ori  $11, $11, 0x8450			# $11=0xa84f8450
    lui  $12, 0xf27a			# $12=0xf27a0000
    ori  $12, $12, 0xb1cf			# $12=0xf27ab1cf
    lui  $13, 0xcadf			# $13=0xcadf0000
    ori  $13, $13, 0xb109			# $13=0xcadfb109
    lui  $14, 0xb915			# $14=0xb9150000
    ori  $14, $14, 0xec69			# $14=0xb915ec69
    lui  $15, 0x5cae			# $15=0x5cae0000
    ori  $15, $15, 0x6709			# $15=0x5cae6709
    lui  $16, 0x7a79			# $16=0x7a790000
    ori  $16, $16, 0x4a76			# $16=0x7a794a76
    lui  $17, 0xea56			# $17=0xea560000
    ori  $17, $17, 0x927c			# $17=0xea56927c
    lui  $18, 0x234e			# $18=0x234e0000
    ori  $18, $18, 0x55f9			# $18=0x234e55f9
    lui  $19, 0x4a39			# $19=0x4a390000
    ori  $19, $19, 0x0c88			# $19=0x4a390c88
    lui  $20, 0xf502			# $20=0xf5020000
    ori  $20, $20, 0x71d7			# $20=0xf50271d7
    lui  $21, 0xdff1			# $21=0xdff10000
    ori  $21, $21, 0x96e4			# $21=0xdff196e4
    lui  $22, 0xf19e			# $22=0xf19e0000
    ori  $22, $22, 0x4ce2			# $22=0xf19e4ce2
    lui  $23, 0xecd4			# $23=0xecd40000
    ori  $23, $23, 0x7d46			# $23=0xecd47d46
    lui  $24, 0xe811			# $24=0xe8110000
    ori  $24, $24, 0x0c6f			# $24=0xe8110c6f
    lui  $25, 0xfd04			# $25=0xfd040000
    ori  $25, $25, 0xbc9d			# $25=0xfd04bc9d
    lui  $26, 0x3c00			# $26=0x3c000000
    ori  $26, $26, 0xbda3			# $26=0x3c00bda3
    lui  $27, 0xd8be			# $27=0xd8be0000
    ori  $27, $27, 0x2883			# $27=0xd8be2883
    lui  $28, 0x3aae			# $28=0x3aae0000
    ori  $28, $28, 0xb3d5			# $28=0x3aaeb3d5
    lui  $29, 0xa5e7			# $29=0xa5e70000
    ori  $29, $29, 0x86ac			# $29=0xa5e786ac
    lui  $30, 0x80e7			# $30=0x80e70000
    ori  $30, $30, 0x65c3			# $30=0x80e765c3
    lui  $31, 0x3f0f			# $31=0x3f0f0000
    ori  $31, $31, 0xdbba			# $31=0x3f0fdbba
    lui  $0, 0x9d2f			# $0=0x9d2f0000
    ori  $0, $0, 0xc5ce			# $0=0x0000c5ce
    lui  $1, 0x65c0			# $1=0x65c00000
    ori  $1, $1, 0x578e			# $1=0x65c0578e
    lui  $2, 0xed9b			# $2=0xed9b0000
    ori  $2, $2, 0xb62c			# $2=0xed9bb62c
    lui  $3, 0x9ff2			# $3=0x9ff20000
    ori  $3, $3, 0x26f4			# $3=0x9ff226f4
    lui  $4, 0x5ae8			# $4=0x5ae80000
    ori  $4, $4, 0xb3fa			# $4=0x5ae8b3fa
    lui  $5, 0x8aca			# $5=0x8aca0000
    ori  $5, $5, 0xda63			# $5=0x8acada63
    lui  $6, 0x98d2			# $6=0x98d20000
    ori  $6, $6, 0xf8df			# $6=0x98d2f8df
    lui  $7, 0x35c9			# $7=0x35c90000
    ori  $7, $7, 0x7135			# $7=0x35c97135
    lui  $8, 0x0b62			# $8=0x0b620000
    ori  $8, $8, 0x10ce			# $8=0x0b6210ce
    lui  $9, 0xcb0f			# $9=0xcb0f0000
    ori  $9, $9, 0x22fa			# $9=0xcb0f22fa
    lui  $10, 0x4d36			# $10=0x4d360000
    ori  $10, $10, 0x6072			# $10=0x4d366072
    lui  $11, 0xb56d			# $11=0xb56d0000
    ori  $11, $11, 0x9bc9			# $11=0xb56d9bc9
    lui  $12, 0x9c6a			# $12=0x9c6a0000
    ori  $12, $12, 0x93ee			# $12=0x9c6a93ee
    lui  $13, 0x87ff			# $13=0x87ff0000
    ori  $13, $13, 0x93cd			# $13=0x87ff93cd
    lui  $14, 0x200e			# $14=0x200e0000
    ori  $14, $14, 0xe3c2			# $14=0x200ee3c2
    lui  $15, 0x13ef			# $15=0x13ef0000
    ori  $15, $15, 0x6e79			# $15=0x13ef6e79
    lui  $16, 0xc900			# $16=0xc9000000
    ori  $16, $16, 0xd8f5			# $16=0xc900d8f5
    lui  $17, 0x0971			# $17=0x09710000
    ori  $17, $17, 0xcc4a			# $17=0x0971cc4a
    lui  $18, 0x615f			# $18=0x615f0000
    ori  $18, $18, 0xa29c			# $18=0x615fa29c
    lui  $19, 0x215a			# $19=0x215a0000
    ori  $19, $19, 0xa853			# $19=0x215aa853
    lui  $20, 0x3d61			# $20=0x3d610000
    ori  $20, $20, 0x19e4			# $20=0x3d6119e4
    lui  $21, 0xb3b0			# $21=0xb3b00000
    ori  $21, $21, 0x8ad5			# $21=0xb3b08ad5
    lui  $22, 0x5ddc			# $22=0x5ddc0000
    ori  $22, $22, 0x1cd1			# $22=0x5ddc1cd1
    lui  $23, 0x7b28			# $23=0x7b280000
    ori  $23, $23, 0xd7a7			# $23=0x7b28d7a7
    lui  $24, 0x5436			# $24=0x54360000
    ori  $24, $24, 0x65bc			# $24=0x543665bc
    lui  $25, 0x2822			# $25=0x28220000
    ori  $25, $25, 0xa92f			# $25=0x2822a92f
    lui  $26, 0xcff1			# $26=0xcff10000
    ori  $26, $26, 0x033e			# $26=0xcff1033e
    lui  $27, 0x88d4			# $27=0x88d40000
    ori  $27, $27, 0x13f1			# $27=0x88d413f1
    lui  $28, 0x6235			# $28=0x62350000
    ori  $28, $28, 0x97ff			# $28=0x623597ff
    lui  $29, 0x7602			# $29=0x76020000
    ori  $29, $29, 0xf3c8			# $29=0x7602f3c8
    lui  $30, 0xe641			# $30=0xe6410000
    ori  $30, $30, 0x0179			# $30=0xe6410179
    lui  $31, 0x595f			# $31=0x595f0000
    ori  $31, $31, 0xc69a			# $31=0x595fc69a
    lui  $0, 0x9910			# $0=0x99100000
    ori  $0, $0, 0xc896			# $0=0x0000c896
    lui  $1, 0x43fe			# $1=0x43fe0000
    ori  $1, $1, 0xeb41			# $1=0x43feeb41
    lui  $2, 0xbef9			# $2=0xbef90000
    ori  $2, $2, 0x4332			# $2=0xbef94332
    lui  $3, 0xd649			# $3=0xd6490000
    ori  $3, $3, 0xed9a			# $3=0xd649ed9a
    lui  $4, 0xa61f			# $4=0xa61f0000
    ori  $4, $4, 0xbd28			# $4=0xa61fbd28
    lui  $5, 0xe965			# $5=0xe9650000
    ori  $5, $5, 0x4943			# $5=0xe9654943
    lui  $6, 0x16a0			# $6=0x16a00000
    ori  $6, $6, 0xaf1d			# $6=0x16a0af1d
    lui  $7, 0xff9f			# $7=0xff9f0000
    ori  $7, $7, 0xa960			# $7=0xff9fa960
    lui  $8, 0x6acd			# $8=0x6acd0000
    ori  $8, $8, 0xc517			# $8=0x6acdc517
    lui  $9, 0x8661			# $9=0x86610000
    ori  $9, $9, 0x73f2			# $9=0x866173f2
    lui  $10, 0x26db			# $10=0x26db0000
    ori  $10, $10, 0x637e			# $10=0x26db637e
    lui  $11, 0x1826			# $11=0x18260000
    ori  $11, $11, 0xc25f			# $11=0x1826c25f
    lui  $12, 0x82b6			# $12=0x82b60000
    ori  $12, $12, 0x1999			# $12=0x82b61999
    lui  $13, 0x23a2			# $13=0x23a20000
    ori  $13, $13, 0x23bf			# $13=0x23a223bf
    lui  $14, 0xf7e9			# $14=0xf7e90000
    ori  $14, $14, 0xd6bd			# $14=0xf7e9d6bd
    lui  $15, 0xdd2b			# $15=0xdd2b0000
    ori  $15, $15, 0xe418			# $15=0xdd2be418
    lui  $16, 0x023b			# $16=0x023b0000
    ori  $16, $16, 0x12e9			# $16=0x023b12e9
    lui  $17, 0x125c			# $17=0x125c0000
    ori  $17, $17, 0x5066			# $17=0x125c5066
    lui  $18, 0x4f04			# $18=0x4f040000
    ori  $18, $18, 0x23e9			# $18=0x4f0423e9
    lui  $19, 0xdd7a			# $19=0xdd7a0000
    ori  $19, $19, 0xf53f			# $19=0xdd7af53f
    lui  $20, 0x2eab			# $20=0x2eab0000
    ori  $20, $20, 0xb1e7			# $20=0x2eabb1e7
    lui  $21, 0x5889			# $21=0x58890000
    ori  $21, $21, 0xb7d3			# $21=0x5889b7d3
    lui  $22, 0x2eb8			# $22=0x2eb80000
    ori  $22, $22, 0x5106			# $22=0x2eb85106
    lui  $23, 0x2eba			# $23=0x2eba0000
    ori  $23, $23, 0x0357			# $23=0x2eba0357
    lui  $24, 0xe832			# $24=0xe8320000
    ori  $24, $24, 0x5a7d			# $24=0xe8325a7d
    lui  $25, 0x46ee			# $25=0x46ee0000
    ori  $25, $25, 0xf91e			# $25=0x46eef91e
    lui  $26, 0x299f			# $26=0x299f0000
    ori  $26, $26, 0x2389			# $26=0x299f2389
    lui  $27, 0x6be6			# $27=0x6be60000
    ori  $27, $27, 0x4fe5			# $27=0x6be64fe5
    lui  $28, 0xee76			# $28=0xee760000
    ori  $28, $28, 0xd64b			# $28=0xee76d64b
    lui  $29, 0xd2a1			# $29=0xd2a10000
    ori  $29, $29, 0xeb28			# $29=0xd2a1eb28
    lui  $30, 0xf6e7			# $30=0xf6e70000
    ori  $30, $30, 0xb375			# $30=0xf6e7b375
    lui  $31, 0xa54a			# $31=0xa54a0000
    ori  $31, $31, 0x9130			# $31=0xa54a9130
    mthi  $18			# hi=0x4f0423e9,lo=0x00000000
    mthi  $27			# hi=0x6be64fe5,lo=0x00000000
    mthi  $6			# hi=0x16a0af1d,lo=0x00000000
    mthi  $0			# hi=0x00000000,lo=0x00000000
    mthi  $8			# hi=0x6acdc517,lo=0x00000000
    mthi  $23			# hi=0x2eba0357,lo=0x00000000
    mthi  $7			# hi=0xff9fa960,lo=0x00000000
    mthi  $4			# hi=0xa61fbd28,lo=0x00000000
    mthi  $19			# hi=0xdd7af53f,lo=0x00000000
    mthi  $7			# hi=0xff9fa960,lo=0x00000000
    mthi  $15			# hi=0xdd2be418,lo=0x00000000
    mthi  $23			# hi=0x2eba0357,lo=0x00000000
    mthi  $3			# hi=0xd649ed9a,lo=0x00000000
    mthi  $16			# hi=0x023b12e9,lo=0x00000000
    mthi  $22			# hi=0x2eb85106,lo=0x00000000
    mthi  $20			# hi=0x2eabb1e7,lo=0x00000000
    mthi  $28			# hi=0xee76d64b,lo=0x00000000
    mthi  $4			# hi=0xa61fbd28,lo=0x00000000
    mthi  $6			# hi=0x16a0af1d,lo=0x00000000
    mthi  $20			# hi=0x2eabb1e7,lo=0x00000000
    mthi  $13			# hi=0x23a223bf,lo=0x00000000
    mthi  $10			# hi=0x26db637e,lo=0x00000000
    mthi  $2			# hi=0xbef94332,lo=0x00000000
    mthi  $8			# hi=0x6acdc517,lo=0x00000000
    mthi  $22			# hi=0x2eb85106,lo=0x00000000
    mthi  $28			# hi=0xee76d64b,lo=0x00000000
    mthi  $17			# hi=0x125c5066,lo=0x00000000
    mthi  $6			# hi=0x16a0af1d,lo=0x00000000
    mthi  $18			# hi=0x4f0423e9,lo=0x00000000
    mthi  $15			# hi=0xdd2be418,lo=0x00000000
    mthi  $28			# hi=0xee76d64b,lo=0x00000000
    mthi  $2			# hi=0xbef94332,lo=0x00000000
    mthi  $28			# hi=0xee76d64b,lo=0x00000000
    mthi  $26			# hi=0x299f2389,lo=0x00000000
    mthi  $19			# hi=0xdd7af53f,lo=0x00000000
    mthi  $1			# hi=0x43feeb41,lo=0x00000000
    mthi  $28			# hi=0xee76d64b,lo=0x00000000
    mthi  $1			# hi=0x43feeb41,lo=0x00000000
    mthi  $15			# hi=0xdd2be418,lo=0x00000000
    mthi  $1			# hi=0x43feeb41,lo=0x00000000
    mthi  $6			# hi=0x16a0af1d,lo=0x00000000
    mthi  $27			# hi=0x6be64fe5,lo=0x00000000
    mthi  $0			# hi=0x00000000,lo=0x00000000
    mthi  $23			# hi=0x2eba0357,lo=0x00000000
    mthi  $21			# hi=0x5889b7d3,lo=0x00000000
    mthi  $23			# hi=0x2eba0357,lo=0x00000000
    mthi  $17			# hi=0x125c5066,lo=0x00000000
    mthi  $11			# hi=0x1826c25f,lo=0x00000000
    mthi  $30			# hi=0xf6e7b375,lo=0x00000000
    mthi  $19			# hi=0xdd7af53f,lo=0x00000000
    mthi  $6			# hi=0x16a0af1d,lo=0x00000000
    mthi  $4			# hi=0xa61fbd28,lo=0x00000000
    mthi  $0			# hi=0x00000000,lo=0x00000000
    mthi  $19			# hi=0xdd7af53f,lo=0x00000000
    mthi  $7			# hi=0xff9fa960,lo=0x00000000
    mthi  $12			# hi=0x82b61999,lo=0x00000000
    mthi  $28			# hi=0xee76d64b,lo=0x00000000
    mthi  $1			# hi=0x43feeb41,lo=0x00000000
    mthi  $9			# hi=0x866173f2,lo=0x00000000
    mthi  $19			# hi=0xdd7af53f,lo=0x00000000
    mthi  $17			# hi=0x125c5066,lo=0x00000000
    mthi  $19			# hi=0xdd7af53f,lo=0x00000000
    mthi  $27			# hi=0x6be64fe5,lo=0x00000000
    mthi  $19			# hi=0xdd7af53f,lo=0x00000000
    mthi  $18			# hi=0x4f0423e9,lo=0x00000000
    mthi  $20			# hi=0x2eabb1e7,lo=0x00000000
    mthi  $22			# hi=0x2eb85106,lo=0x00000000
    mthi  $23			# hi=0x2eba0357,lo=0x00000000
    mthi  $9			# hi=0x866173f2,lo=0x00000000
    mthi  $13			# hi=0x23a223bf,lo=0x00000000
    mthi  $25			# hi=0x46eef91e,lo=0x00000000
    mthi  $11			# hi=0x1826c25f,lo=0x00000000
    mthi  $9			# hi=0x866173f2,lo=0x00000000
    mthi  $30			# hi=0xf6e7b375,lo=0x00000000
    mthi  $25			# hi=0x46eef91e,lo=0x00000000
    mthi  $19			# hi=0xdd7af53f,lo=0x00000000
    mthi  $16			# hi=0x023b12e9,lo=0x00000000
    mthi  $15			# hi=0xdd2be418,lo=0x00000000
    mthi  $14			# hi=0xf7e9d6bd,lo=0x00000000
    mthi  $30			# hi=0xf6e7b375,lo=0x00000000
    mthi  $21			# hi=0x5889b7d3,lo=0x00000000
    mthi  $18			# hi=0x4f0423e9,lo=0x00000000
    mthi  $19			# hi=0xdd7af53f,lo=0x00000000
    mthi  $12			# hi=0x82b61999,lo=0x00000000
    mthi  $27			# hi=0x6be64fe5,lo=0x00000000
    mthi  $28			# hi=0xee76d64b,lo=0x00000000
    mthi  $3			# hi=0xd649ed9a,lo=0x00000000
    mthi  $30			# hi=0xf6e7b375,lo=0x00000000
    mthi  $29			# hi=0xd2a1eb28,lo=0x00000000
    mthi  $29			# hi=0xd2a1eb28,lo=0x00000000
    mthi  $24			# hi=0xe8325a7d,lo=0x00000000
    mthi  $21			# hi=0x5889b7d3,lo=0x00000000
    mthi  $3			# hi=0xd649ed9a,lo=0x00000000
    mthi  $28			# hi=0xee76d64b,lo=0x00000000
    mthi  $27			# hi=0x6be64fe5,lo=0x00000000
    mthi  $2			# hi=0xbef94332,lo=0x00000000
    mthi  $11			# hi=0x1826c25f,lo=0x00000000
    mthi  $26			# hi=0x299f2389,lo=0x00000000
    mthi  $23			# hi=0x2eba0357,lo=0x00000000
    mthi  $24			# hi=0xe8325a7d,lo=0x00000000
