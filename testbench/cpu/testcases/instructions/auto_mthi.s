    .org 0x0
    .global _start
    .set noat
    .set noreorder
    .set nomacro
_start:
    lui  $0, 0xe645			# $0=0xe6450000
    ori  $0, $0, 0xa78c			# $0=0x0000a78c
    lui  $1, 0x7997			# $1=0x79970000
    ori  $1, $1, 0x49dd			# $1=0x799749dd
    lui  $2, 0xce03			# $2=0xce030000
    ori  $2, $2, 0x38fb			# $2=0xce0338fb
    lui  $3, 0xf634			# $3=0xf6340000
    ori  $3, $3, 0x5873			# $3=0xf6345873
    lui  $4, 0x4a5f			# $4=0x4a5f0000
    ori  $4, $4, 0x3244			# $4=0x4a5f3244
    lui  $5, 0x412d			# $5=0x412d0000
    ori  $5, $5, 0xba5b			# $5=0x412dba5b
    lui  $6, 0xf0c3			# $6=0xf0c30000
    ori  $6, $6, 0xcfca			# $6=0xf0c3cfca
    lui  $7, 0x3864			# $7=0x38640000
    ori  $7, $7, 0x4c82			# $7=0x38644c82
    lui  $8, 0xcf00			# $8=0xcf000000
    ori  $8, $8, 0xb19d			# $8=0xcf00b19d
    lui  $9, 0xef33			# $9=0xef330000
    ori  $9, $9, 0xb2e7			# $9=0xef33b2e7
    lui  $10, 0x9819			# $10=0x98190000
    ori  $10, $10, 0xa89f			# $10=0x9819a89f
    lui  $11, 0x29bf			# $11=0x29bf0000
    ori  $11, $11, 0x0fdf			# $11=0x29bf0fdf
    lui  $12, 0xe7ac			# $12=0xe7ac0000
    ori  $12, $12, 0x9207			# $12=0xe7ac9207
    lui  $13, 0x779f			# $13=0x779f0000
    ori  $13, $13, 0xab37			# $13=0x779fab37
    lui  $14, 0xabf6			# $14=0xabf60000
    ori  $14, $14, 0xda3d			# $14=0xabf6da3d
    lui  $15, 0x565f			# $15=0x565f0000
    ori  $15, $15, 0xe0eb			# $15=0x565fe0eb
    lui  $16, 0xc3a3			# $16=0xc3a30000
    ori  $16, $16, 0x765e			# $16=0xc3a3765e
    lui  $17, 0xd6b3			# $17=0xd6b30000
    ori  $17, $17, 0x1048			# $17=0xd6b31048
    lui  $18, 0x7e9e			# $18=0x7e9e0000
    ori  $18, $18, 0xe1e8			# $18=0x7e9ee1e8
    lui  $19, 0xf361			# $19=0xf3610000
    ori  $19, $19, 0xf8b3			# $19=0xf361f8b3
    lui  $20, 0xabd4			# $20=0xabd40000
    ori  $20, $20, 0x0c52			# $20=0xabd40c52
    lui  $21, 0xd949			# $21=0xd9490000
    ori  $21, $21, 0xf817			# $21=0xd949f817
    lui  $22, 0xc220			# $22=0xc2200000
    ori  $22, $22, 0xa314			# $22=0xc220a314
    lui  $23, 0x8894			# $23=0x88940000
    ori  $23, $23, 0x29c0			# $23=0x889429c0
    lui  $24, 0x72c9			# $24=0x72c90000
    ori  $24, $24, 0x0511			# $24=0x72c90511
    lui  $25, 0xedbd			# $25=0xedbd0000
    ori  $25, $25, 0x08fd			# $25=0xedbd08fd
    lui  $26, 0x6401			# $26=0x64010000
    ori  $26, $26, 0x2a39			# $26=0x64012a39
    lui  $27, 0xd166			# $27=0xd1660000
    ori  $27, $27, 0xf627			# $27=0xd166f627
    lui  $28, 0x07f4			# $28=0x07f40000
    ori  $28, $28, 0x863d			# $28=0x07f4863d
    lui  $29, 0xd148			# $29=0xd1480000
    ori  $29, $29, 0x0648			# $29=0xd1480648
    lui  $30, 0x88e1			# $30=0x88e10000
    ori  $30, $30, 0xe90f			# $30=0x88e1e90f
    lui  $31, 0x2c68			# $31=0x2c680000
    ori  $31, $31, 0x77e3			# $31=0x2c6877e3
    lui  $0, 0x6f8b			# $0=0x6f8b0000
    ori  $0, $0, 0x11b2			# $0=0x000011b2
    lui  $1, 0x6878			# $1=0x68780000
    ori  $1, $1, 0x84c7			# $1=0x687884c7
    lui  $2, 0x746e			# $2=0x746e0000
    ori  $2, $2, 0xa613			# $2=0x746ea613
    lui  $3, 0x0ed4			# $3=0x0ed40000
    ori  $3, $3, 0x3c00			# $3=0x0ed43c00
    lui  $4, 0x2d74			# $4=0x2d740000
    ori  $4, $4, 0x7f61			# $4=0x2d747f61
    lui  $5, 0x50f5			# $5=0x50f50000
    ori  $5, $5, 0xdf4f			# $5=0x50f5df4f
    lui  $6, 0xfe38			# $6=0xfe380000
    ori  $6, $6, 0x5692			# $6=0xfe385692
    lui  $7, 0xa47b			# $7=0xa47b0000
    ori  $7, $7, 0xd08c			# $7=0xa47bd08c
    lui  $8, 0x511c			# $8=0x511c0000
    ori  $8, $8, 0x2ef8			# $8=0x511c2ef8
    lui  $9, 0x6344			# $9=0x63440000
    ori  $9, $9, 0x8588			# $9=0x63448588
    lui  $10, 0x5525			# $10=0x55250000
    ori  $10, $10, 0xd914			# $10=0x5525d914
    lui  $11, 0x06f4			# $11=0x06f40000
    ori  $11, $11, 0x92ce			# $11=0x06f492ce
    lui  $12, 0xb76c			# $12=0xb76c0000
    ori  $12, $12, 0x9510			# $12=0xb76c9510
    lui  $13, 0x1d79			# $13=0x1d790000
    ori  $13, $13, 0x44f0			# $13=0x1d7944f0
    lui  $14, 0x8b5e			# $14=0x8b5e0000
    ori  $14, $14, 0xbea4			# $14=0x8b5ebea4
    lui  $15, 0x0fbb			# $15=0x0fbb0000
    ori  $15, $15, 0x55fa			# $15=0x0fbb55fa
    lui  $16, 0xdec0			# $16=0xdec00000
    ori  $16, $16, 0x6737			# $16=0xdec06737
    lui  $17, 0x10da			# $17=0x10da0000
    ori  $17, $17, 0x4019			# $17=0x10da4019
    lui  $18, 0x1826			# $18=0x18260000
    ori  $18, $18, 0xf297			# $18=0x1826f297
    lui  $19, 0xd617			# $19=0xd6170000
    ori  $19, $19, 0x629c			# $19=0xd617629c
    lui  $20, 0x2690			# $20=0x26900000
    ori  $20, $20, 0x9ede			# $20=0x26909ede
    lui  $21, 0xae5f			# $21=0xae5f0000
    ori  $21, $21, 0x02e8			# $21=0xae5f02e8
    lui  $22, 0x84bf			# $22=0x84bf0000
    ori  $22, $22, 0x781b			# $22=0x84bf781b
    lui  $23, 0x422a			# $23=0x422a0000
    ori  $23, $23, 0x8a2d			# $23=0x422a8a2d
    lui  $24, 0x0c96			# $24=0x0c960000
    ori  $24, $24, 0x2e04			# $24=0x0c962e04
    lui  $25, 0x85f8			# $25=0x85f80000
    ori  $25, $25, 0x5ab4			# $25=0x85f85ab4
    lui  $26, 0xaf12			# $26=0xaf120000
    ori  $26, $26, 0xe9da			# $26=0xaf12e9da
    lui  $27, 0x1583			# $27=0x15830000
    ori  $27, $27, 0x338d			# $27=0x1583338d
    lui  $28, 0x1b81			# $28=0x1b810000
    ori  $28, $28, 0x4d84			# $28=0x1b814d84
    lui  $29, 0xe641			# $29=0xe6410000
    ori  $29, $29, 0xe119			# $29=0xe641e119
    lui  $30, 0x1f5d			# $30=0x1f5d0000
    ori  $30, $30, 0xb349			# $30=0x1f5db349
    lui  $31, 0x113b			# $31=0x113b0000
    ori  $31, $31, 0x26d3			# $31=0x113b26d3
    lui  $0, 0xf06f			# $0=0xf06f0000
    ori  $0, $0, 0x2a4c			# $0=0x00002a4c
    lui  $1, 0x17c7			# $1=0x17c70000
    ori  $1, $1, 0x8a19			# $1=0x17c78a19
    lui  $2, 0x55c2			# $2=0x55c20000
    ori  $2, $2, 0x052e			# $2=0x55c2052e
    lui  $3, 0x72fe			# $3=0x72fe0000
    ori  $3, $3, 0x7306			# $3=0x72fe7306
    lui  $4, 0xd9fd			# $4=0xd9fd0000
    ori  $4, $4, 0x455d			# $4=0xd9fd455d
    lui  $5, 0x7fb8			# $5=0x7fb80000
    ori  $5, $5, 0xa81d			# $5=0x7fb8a81d
    lui  $6, 0xc0de			# $6=0xc0de0000
    ori  $6, $6, 0x7096			# $6=0xc0de7096
    lui  $7, 0x441c			# $7=0x441c0000
    ori  $7, $7, 0xe7d8			# $7=0x441ce7d8
    lui  $8, 0xe212			# $8=0xe2120000
    ori  $8, $8, 0xdd65			# $8=0xe212dd65
    lui  $9, 0x086e			# $9=0x086e0000
    ori  $9, $9, 0xf8b5			# $9=0x086ef8b5
    lui  $10, 0x7b29			# $10=0x7b290000
    ori  $10, $10, 0x5229			# $10=0x7b295229
    lui  $11, 0x18cf			# $11=0x18cf0000
    ori  $11, $11, 0xbd21			# $11=0x18cfbd21
    lui  $12, 0xab59			# $12=0xab590000
    ori  $12, $12, 0x0015			# $12=0xab590015
    lui  $13, 0x8f01			# $13=0x8f010000
    ori  $13, $13, 0x752c			# $13=0x8f01752c
    lui  $14, 0x0f9f			# $14=0x0f9f0000
    ori  $14, $14, 0x1802			# $14=0x0f9f1802
    lui  $15, 0x58b9			# $15=0x58b90000
    ori  $15, $15, 0x60c6			# $15=0x58b960c6
    lui  $16, 0x94f5			# $16=0x94f50000
    ori  $16, $16, 0xdbe4			# $16=0x94f5dbe4
    lui  $17, 0x533f			# $17=0x533f0000
    ori  $17, $17, 0x570f			# $17=0x533f570f
    lui  $18, 0x4648			# $18=0x46480000
    ori  $18, $18, 0xa4fc			# $18=0x4648a4fc
    lui  $19, 0x0cd5			# $19=0x0cd50000
    ori  $19, $19, 0x8f87			# $19=0x0cd58f87
    lui  $20, 0xff65			# $20=0xff650000
    ori  $20, $20, 0xc83e			# $20=0xff65c83e
    lui  $21, 0x2135			# $21=0x21350000
    ori  $21, $21, 0xb9ed			# $21=0x2135b9ed
    lui  $22, 0xf817			# $22=0xf8170000
    ori  $22, $22, 0xb82e			# $22=0xf817b82e
    lui  $23, 0x4c3e			# $23=0x4c3e0000
    ori  $23, $23, 0x297f			# $23=0x4c3e297f
    lui  $24, 0x13d0			# $24=0x13d00000
    ori  $24, $24, 0xc522			# $24=0x13d0c522
    lui  $25, 0x442d			# $25=0x442d0000
    ori  $25, $25, 0x777b			# $25=0x442d777b
    lui  $26, 0xe315			# $26=0xe3150000
    ori  $26, $26, 0x7208			# $26=0xe3157208
    lui  $27, 0x3879			# $27=0x38790000
    ori  $27, $27, 0xd860			# $27=0x3879d860
    lui  $28, 0xc4dd			# $28=0xc4dd0000
    ori  $28, $28, 0x8bc8			# $28=0xc4dd8bc8
    lui  $29, 0x2638			# $29=0x26380000
    ori  $29, $29, 0x0b72			# $29=0x26380b72
    lui  $30, 0x4230			# $30=0x42300000
    ori  $30, $30, 0xe537			# $30=0x4230e537
    lui  $31, 0xc6c2			# $31=0xc6c20000
    ori  $31, $31, 0xe470			# $31=0xc6c2e470
    mthi  $24			# hi=0x13d0c522,lo=0x00000000
    mthi  $24			# hi=0x13d0c522,lo=0x00000000
    mthi  $9			# hi=0x086ef8b5,lo=0x00000000
    mthi  $0			# hi=0x00000000,lo=0x00000000
    mthi  $21			# hi=0x2135b9ed,lo=0x00000000
    mthi  $31			# hi=0xc6c2e470,lo=0x00000000
    mthi  $13			# hi=0x8f01752c,lo=0x00000000
    mthi  $25			# hi=0x442d777b,lo=0x00000000
    mthi  $18			# hi=0x4648a4fc,lo=0x00000000
    mthi  $26			# hi=0xe3157208,lo=0x00000000
    mthi  $23			# hi=0x4c3e297f,lo=0x00000000
    mthi  $7			# hi=0x441ce7d8,lo=0x00000000
    mthi  $18			# hi=0x4648a4fc,lo=0x00000000
    mthi  $23			# hi=0x4c3e297f,lo=0x00000000
    mthi  $22			# hi=0xf817b82e,lo=0x00000000
    mthi  $14			# hi=0x0f9f1802,lo=0x00000000
    mthi  $17			# hi=0x533f570f,lo=0x00000000
    mthi  $31			# hi=0xc6c2e470,lo=0x00000000
    mthi  $16			# hi=0x94f5dbe4,lo=0x00000000
    mthi  $30			# hi=0x4230e537,lo=0x00000000
    mthi  $31			# hi=0xc6c2e470,lo=0x00000000
    mthi  $18			# hi=0x4648a4fc,lo=0x00000000
    mthi  $19			# hi=0x0cd58f87,lo=0x00000000
    mthi  $16			# hi=0x94f5dbe4,lo=0x00000000
    mthi  $24			# hi=0x13d0c522,lo=0x00000000
    mthi  $15			# hi=0x58b960c6,lo=0x00000000
    mthi  $29			# hi=0x26380b72,lo=0x00000000
    mthi  $15			# hi=0x58b960c6,lo=0x00000000
    mthi  $23			# hi=0x4c3e297f,lo=0x00000000
    mthi  $30			# hi=0x4230e537,lo=0x00000000
    mthi  $5			# hi=0x7fb8a81d,lo=0x00000000
    mthi  $15			# hi=0x58b960c6,lo=0x00000000
    mthi  $2			# hi=0x55c2052e,lo=0x00000000
    mthi  $4			# hi=0xd9fd455d,lo=0x00000000
    mthi  $6			# hi=0xc0de7096,lo=0x00000000
    mthi  $18			# hi=0x4648a4fc,lo=0x00000000
    mthi  $1			# hi=0x17c78a19,lo=0x00000000
    mthi  $22			# hi=0xf817b82e,lo=0x00000000
    mthi  $18			# hi=0x4648a4fc,lo=0x00000000
    mthi  $29			# hi=0x26380b72,lo=0x00000000
    mthi  $0			# hi=0x00000000,lo=0x00000000
    mthi  $17			# hi=0x533f570f,lo=0x00000000
    mthi  $0			# hi=0x00000000,lo=0x00000000
    mthi  $20			# hi=0xff65c83e,lo=0x00000000
    mthi  $15			# hi=0x58b960c6,lo=0x00000000
    mthi  $7			# hi=0x441ce7d8,lo=0x00000000
    mthi  $31			# hi=0xc6c2e470,lo=0x00000000
    mthi  $14			# hi=0x0f9f1802,lo=0x00000000
    mthi  $29			# hi=0x26380b72,lo=0x00000000
    mthi  $4			# hi=0xd9fd455d,lo=0x00000000
    mthi  $6			# hi=0xc0de7096,lo=0x00000000
    mthi  $10			# hi=0x7b295229,lo=0x00000000
    mthi  $3			# hi=0x72fe7306,lo=0x00000000
    mthi  $25			# hi=0x442d777b,lo=0x00000000
    mthi  $29			# hi=0x26380b72,lo=0x00000000
    mthi  $8			# hi=0xe212dd65,lo=0x00000000
    mthi  $8			# hi=0xe212dd65,lo=0x00000000
    mthi  $14			# hi=0x0f9f1802,lo=0x00000000
    mthi  $30			# hi=0x4230e537,lo=0x00000000
    mthi  $17			# hi=0x533f570f,lo=0x00000000
    mthi  $10			# hi=0x7b295229,lo=0x00000000
    mthi  $20			# hi=0xff65c83e,lo=0x00000000
    mthi  $15			# hi=0x58b960c6,lo=0x00000000
    mthi  $20			# hi=0xff65c83e,lo=0x00000000
    mthi  $31			# hi=0xc6c2e470,lo=0x00000000
    mthi  $31			# hi=0xc6c2e470,lo=0x00000000
    mthi  $31			# hi=0xc6c2e470,lo=0x00000000
    mthi  $13			# hi=0x8f01752c,lo=0x00000000
    mthi  $0			# hi=0x00000000,lo=0x00000000
    mthi  $4			# hi=0xd9fd455d,lo=0x00000000
    mthi  $18			# hi=0x4648a4fc,lo=0x00000000
    mthi  $12			# hi=0xab590015,lo=0x00000000
    mthi  $24			# hi=0x13d0c522,lo=0x00000000
    mthi  $5			# hi=0x7fb8a81d,lo=0x00000000
    mthi  $12			# hi=0xab590015,lo=0x00000000
    mthi  $6			# hi=0xc0de7096,lo=0x00000000
    mthi  $10			# hi=0x7b295229,lo=0x00000000
    mthi  $23			# hi=0x4c3e297f,lo=0x00000000
    mthi  $27			# hi=0x3879d860,lo=0x00000000
    mthi  $11			# hi=0x18cfbd21,lo=0x00000000
    mthi  $30			# hi=0x4230e537,lo=0x00000000
    mthi  $29			# hi=0x26380b72,lo=0x00000000
    mthi  $6			# hi=0xc0de7096,lo=0x00000000
    mthi  $27			# hi=0x3879d860,lo=0x00000000
    mthi  $13			# hi=0x8f01752c,lo=0x00000000
    mthi  $4			# hi=0xd9fd455d,lo=0x00000000
    mthi  $9			# hi=0x086ef8b5,lo=0x00000000
    mthi  $8			# hi=0xe212dd65,lo=0x00000000
    mthi  $3			# hi=0x72fe7306,lo=0x00000000
    mthi  $11			# hi=0x18cfbd21,lo=0x00000000
    mthi  $29			# hi=0x26380b72,lo=0x00000000
    mthi  $29			# hi=0x26380b72,lo=0x00000000
    mthi  $28			# hi=0xc4dd8bc8,lo=0x00000000
    mthi  $14			# hi=0x0f9f1802,lo=0x00000000
    mthi  $13			# hi=0x8f01752c,lo=0x00000000
    mthi  $20			# hi=0xff65c83e,lo=0x00000000
    mthi  $8			# hi=0xe212dd65,lo=0x00000000
    mthi  $24			# hi=0x13d0c522,lo=0x00000000
    mthi  $23			# hi=0x4c3e297f,lo=0x00000000
    mthi  $20			# hi=0xff65c83e,lo=0x00000000
