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
    lui  $0, 0x33c0			# $0=0x33c00000
    ori  $0, $0, 0xd08d			# $0=0x0000d08d
    lui  $1, 0x0a74			# $1=0x0a740000
    ori  $1, $1, 0xcd00			# $1=0x0a74cd00
    lui  $2, 0xbfc1			# $2=0xbfc10000
    ori  $2, $2, 0xbf7b			# $2=0xbfc1bf7b
    lui  $3, 0xcf34			# $3=0xcf340000
    ori  $3, $3, 0x0907			# $3=0xcf340907
    lui  $4, 0x94a1			# $4=0x94a10000
    ori  $4, $4, 0x23c5			# $4=0x94a123c5
    lui  $5, 0x3c1a			# $5=0x3c1a0000
    ori  $5, $5, 0x7eab			# $5=0x3c1a7eab
    lui  $6, 0xce84			# $6=0xce840000
    ori  $6, $6, 0x7082			# $6=0xce847082
    lui  $7, 0x4a32			# $7=0x4a320000
    ori  $7, $7, 0x1137			# $7=0x4a321137
    lui  $8, 0xbaba			# $8=0xbaba0000
    ori  $8, $8, 0x8066			# $8=0xbaba8066
    lui  $9, 0xf4b3			# $9=0xf4b30000
    ori  $9, $9, 0x1733			# $9=0xf4b31733
    lui  $10, 0x606e			# $10=0x606e0000
    ori  $10, $10, 0x4d5a			# $10=0x606e4d5a
    lui  $11, 0x30f3			# $11=0x30f30000
    ori  $11, $11, 0x5b84			# $11=0x30f35b84
    lui  $12, 0x645f			# $12=0x645f0000
    ori  $12, $12, 0xb372			# $12=0x645fb372
    lui  $13, 0xebb3			# $13=0xebb30000
    ori  $13, $13, 0xa9d7			# $13=0xebb3a9d7
    lui  $14, 0x6c85			# $14=0x6c850000
    ori  $14, $14, 0x8913			# $14=0x6c858913
    lui  $15, 0xbaca			# $15=0xbaca0000
    ori  $15, $15, 0xce0c			# $15=0xbacace0c
    lui  $16, 0xb17f			# $16=0xb17f0000
    ori  $16, $16, 0xad93			# $16=0xb17fad93
    lui  $17, 0x63ea			# $17=0x63ea0000
    ori  $17, $17, 0x7d7c			# $17=0x63ea7d7c
    lui  $18, 0xb8d8			# $18=0xb8d80000
    ori  $18, $18, 0x2085			# $18=0xb8d82085
    lui  $19, 0x7704			# $19=0x77040000
    ori  $19, $19, 0x3426			# $19=0x77043426
    lui  $20, 0x10ba			# $20=0x10ba0000
    ori  $20, $20, 0xa383			# $20=0x10baa383
    lui  $21, 0x7332			# $21=0x73320000
    ori  $21, $21, 0xddbe			# $21=0x7332ddbe
    lui  $22, 0x256c			# $22=0x256c0000
    ori  $22, $22, 0x370f			# $22=0x256c370f
    lui  $23, 0x51d6			# $23=0x51d60000
    ori  $23, $23, 0x70d8			# $23=0x51d670d8
    lui  $24, 0x021c			# $24=0x021c0000
    ori  $24, $24, 0x4387			# $24=0x021c4387
    lui  $25, 0xce72			# $25=0xce720000
    ori  $25, $25, 0x7341			# $25=0xce727341
    lui  $26, 0x9e3b			# $26=0x9e3b0000
    ori  $26, $26, 0xe09d			# $26=0x9e3be09d
    lui  $27, 0xb6a1			# $27=0xb6a10000
    ori  $27, $27, 0x29aa			# $27=0xb6a129aa
    lui  $28, 0x8766			# $28=0x87660000
    ori  $28, $28, 0x7ef5			# $28=0x87667ef5
    lui  $29, 0x6596			# $29=0x65960000
    ori  $29, $29, 0xe4b2			# $29=0x6596e4b2
    lui  $30, 0xe6d4			# $30=0xe6d40000
    ori  $30, $30, 0xcd6d			# $30=0xe6d4cd6d
    lui  $31, 0x9ba4			# $31=0x9ba40000
    ori  $31, $31, 0x7603			# $31=0x9ba47603
    lui  $0, 0x3f3a			# $0=0x3f3a0000
    ori  $0, $0, 0x2447			# $0=0x00002447
    lui  $1, 0xae7f			# $1=0xae7f0000
    ori  $1, $1, 0x44d6			# $1=0xae7f44d6
    lui  $2, 0x6998			# $2=0x69980000
    ori  $2, $2, 0x503d			# $2=0x6998503d
    lui  $3, 0x9b4a			# $3=0x9b4a0000
    ori  $3, $3, 0x9888			# $3=0x9b4a9888
    lui  $4, 0x2a29			# $4=0x2a290000
    ori  $4, $4, 0x3184			# $4=0x2a293184
    lui  $5, 0x5a81			# $5=0x5a810000
    ori  $5, $5, 0x1f64			# $5=0x5a811f64
    lui  $6, 0xbfcb			# $6=0xbfcb0000
    ori  $6, $6, 0xe26e			# $6=0xbfcbe26e
    lui  $7, 0xa906			# $7=0xa9060000
    ori  $7, $7, 0xdf7e			# $7=0xa906df7e
    lui  $8, 0xe50b			# $8=0xe50b0000
    ori  $8, $8, 0xb9d3			# $8=0xe50bb9d3
    lui  $9, 0x312d			# $9=0x312d0000
    ori  $9, $9, 0x9a2e			# $9=0x312d9a2e
    lui  $10, 0xd46f			# $10=0xd46f0000
    ori  $10, $10, 0x539f			# $10=0xd46f539f
    lui  $11, 0xc4df			# $11=0xc4df0000
    ori  $11, $11, 0x89c9			# $11=0xc4df89c9
    lui  $12, 0x8d73			# $12=0x8d730000
    ori  $12, $12, 0x60b9			# $12=0x8d7360b9
    lui  $13, 0x1835			# $13=0x18350000
    ori  $13, $13, 0xf747			# $13=0x1835f747
    lui  $14, 0x3d89			# $14=0x3d890000
    ori  $14, $14, 0xe267			# $14=0x3d89e267
    lui  $15, 0x29bc			# $15=0x29bc0000
    ori  $15, $15, 0xa498			# $15=0x29bca498
    lui  $16, 0x9cc9			# $16=0x9cc90000
    ori  $16, $16, 0xd607			# $16=0x9cc9d607
    lui  $17, 0xe1ea			# $17=0xe1ea0000
    ori  $17, $17, 0xe3a6			# $17=0xe1eae3a6
    lui  $18, 0x65f6			# $18=0x65f60000
    ori  $18, $18, 0xde40			# $18=0x65f6de40
    lui  $19, 0x35fa			# $19=0x35fa0000
    ori  $19, $19, 0xffce			# $19=0x35faffce
    lui  $20, 0x0296			# $20=0x02960000
    ori  $20, $20, 0x2ce9			# $20=0x02962ce9
    lui  $21, 0xd684			# $21=0xd6840000
    ori  $21, $21, 0x171c			# $21=0xd684171c
    lui  $22, 0x8857			# $22=0x88570000
    ori  $22, $22, 0x5c3b			# $22=0x88575c3b
    lui  $23, 0x62d6			# $23=0x62d60000
    ori  $23, $23, 0xcdff			# $23=0x62d6cdff
    lui  $24, 0xfe4a			# $24=0xfe4a0000
    ori  $24, $24, 0xf867			# $24=0xfe4af867
    lui  $25, 0xdaab			# $25=0xdaab0000
    ori  $25, $25, 0x5966			# $25=0xdaab5966
    lui  $26, 0xae60			# $26=0xae600000
    ori  $26, $26, 0x9c16			# $26=0xae609c16
    lui  $27, 0x25de			# $27=0x25de0000
    ori  $27, $27, 0xc05b			# $27=0x25dec05b
    lui  $28, 0x4a89			# $28=0x4a890000
    ori  $28, $28, 0x49d1			# $28=0x4a8949d1
    lui  $29, 0x861c			# $29=0x861c0000
    ori  $29, $29, 0x0482			# $29=0x861c0482
    lui  $30, 0x609c			# $30=0x609c0000
    ori  $30, $30, 0x184c			# $30=0x609c184c
    lui  $31, 0x3761			# $31=0x37610000
    ori  $31, $31, 0x98e4			# $31=0x376198e4
    mthi  $31			# hi=0x376198e4,lo=0x00000000
    mthi  $23			# hi=0x62d6cdff,lo=0x00000000
    mthi  $18			# hi=0x65f6de40,lo=0x00000000
    mthi  $21			# hi=0xd684171c,lo=0x00000000
    mthi  $0			# hi=0x00000000,lo=0x00000000
    mthi  $7			# hi=0xa906df7e,lo=0x00000000
    mthi  $2			# hi=0x6998503d,lo=0x00000000
    mthi  $18			# hi=0x65f6de40,lo=0x00000000
    mthi  $10			# hi=0xd46f539f,lo=0x00000000
    mthi  $23			# hi=0x62d6cdff,lo=0x00000000
    mthi  $28			# hi=0x4a8949d1,lo=0x00000000
    mthi  $9			# hi=0x312d9a2e,lo=0x00000000
    mthi  $7			# hi=0xa906df7e,lo=0x00000000
    mthi  $10			# hi=0xd46f539f,lo=0x00000000
    mthi  $23			# hi=0x62d6cdff,lo=0x00000000
    mthi  $3			# hi=0x9b4a9888,lo=0x00000000
    mthi  $19			# hi=0x35faffce,lo=0x00000000
    mthi  $0			# hi=0x00000000,lo=0x00000000
    mthi  $12			# hi=0x8d7360b9,lo=0x00000000
    mthi  $25			# hi=0xdaab5966,lo=0x00000000
    mthi  $30			# hi=0x609c184c,lo=0x00000000
    mthi  $3			# hi=0x9b4a9888,lo=0x00000000
    mthi  $25			# hi=0xdaab5966,lo=0x00000000
    mthi  $0			# hi=0x00000000,lo=0x00000000
    mthi  $27			# hi=0x25dec05b,lo=0x00000000
    mthi  $22			# hi=0x88575c3b,lo=0x00000000
    mthi  $17			# hi=0xe1eae3a6,lo=0x00000000
    mthi  $22			# hi=0x88575c3b,lo=0x00000000
    mthi  $5			# hi=0x5a811f64,lo=0x00000000
    mthi  $10			# hi=0xd46f539f,lo=0x00000000
    mthi  $21			# hi=0xd684171c,lo=0x00000000
    mthi  $28			# hi=0x4a8949d1,lo=0x00000000
    mthi  $4			# hi=0x2a293184,lo=0x00000000
    mthi  $10			# hi=0xd46f539f,lo=0x00000000
    mthi  $30			# hi=0x609c184c,lo=0x00000000
    mthi  $21			# hi=0xd684171c,lo=0x00000000
    mthi  $29			# hi=0x861c0482,lo=0x00000000
    mthi  $28			# hi=0x4a8949d1,lo=0x00000000
    mthi  $21			# hi=0xd684171c,lo=0x00000000
    mthi  $18			# hi=0x65f6de40,lo=0x00000000
    mthi  $8			# hi=0xe50bb9d3,lo=0x00000000
    mthi  $6			# hi=0xbfcbe26e,lo=0x00000000
    mthi  $27			# hi=0x25dec05b,lo=0x00000000
    mthi  $15			# hi=0x29bca498,lo=0x00000000
    mthi  $24			# hi=0xfe4af867,lo=0x00000000
    mthi  $14			# hi=0x3d89e267,lo=0x00000000
    mthi  $26			# hi=0xae609c16,lo=0x00000000
    mthi  $12			# hi=0x8d7360b9,lo=0x00000000
    mthi  $11			# hi=0xc4df89c9,lo=0x00000000
    mthi  $16			# hi=0x9cc9d607,lo=0x00000000
    mthi  $6			# hi=0xbfcbe26e,lo=0x00000000
    mthi  $11			# hi=0xc4df89c9,lo=0x00000000
    mthi  $29			# hi=0x861c0482,lo=0x00000000
    mthi  $3			# hi=0x9b4a9888,lo=0x00000000
    mthi  $27			# hi=0x25dec05b,lo=0x00000000
    mthi  $7			# hi=0xa906df7e,lo=0x00000000
    mthi  $0			# hi=0x00000000,lo=0x00000000
    mthi  $8			# hi=0xe50bb9d3,lo=0x00000000
    mthi  $30			# hi=0x609c184c,lo=0x00000000
    mthi  $6			# hi=0xbfcbe26e,lo=0x00000000
    mthi  $6			# hi=0xbfcbe26e,lo=0x00000000
    mthi  $6			# hi=0xbfcbe26e,lo=0x00000000
    mthi  $7			# hi=0xa906df7e,lo=0x00000000
    mthi  $18			# hi=0x65f6de40,lo=0x00000000
    mthi  $18			# hi=0x65f6de40,lo=0x00000000
    mthi  $3			# hi=0x9b4a9888,lo=0x00000000
    mthi  $27			# hi=0x25dec05b,lo=0x00000000
    mthi  $20			# hi=0x02962ce9,lo=0x00000000
    mthi  $27			# hi=0x25dec05b,lo=0x00000000
    mthi  $9			# hi=0x312d9a2e,lo=0x00000000
    mthi  $28			# hi=0x4a8949d1,lo=0x00000000
    mthi  $24			# hi=0xfe4af867,lo=0x00000000
    mthi  $22			# hi=0x88575c3b,lo=0x00000000
    mthi  $12			# hi=0x8d7360b9,lo=0x00000000
    mthi  $9			# hi=0x312d9a2e,lo=0x00000000
    mthi  $30			# hi=0x609c184c,lo=0x00000000
    mthi  $19			# hi=0x35faffce,lo=0x00000000
    mthi  $2			# hi=0x6998503d,lo=0x00000000
    mthi  $23			# hi=0x62d6cdff,lo=0x00000000
    mthi  $21			# hi=0xd684171c,lo=0x00000000
    mthi  $25			# hi=0xdaab5966,lo=0x00000000
    mthi  $28			# hi=0x4a8949d1,lo=0x00000000
    mthi  $24			# hi=0xfe4af867,lo=0x00000000
    mthi  $28			# hi=0x4a8949d1,lo=0x00000000
    mthi  $8			# hi=0xe50bb9d3,lo=0x00000000
    mthi  $7			# hi=0xa906df7e,lo=0x00000000
    mthi  $4			# hi=0x2a293184,lo=0x00000000
    mthi  $18			# hi=0x65f6de40,lo=0x00000000
    mthi  $28			# hi=0x4a8949d1,lo=0x00000000
    mthi  $4			# hi=0x2a293184,lo=0x00000000
    mthi  $13			# hi=0x1835f747,lo=0x00000000
    mthi  $15			# hi=0x29bca498,lo=0x00000000
    mthi  $26			# hi=0xae609c16,lo=0x00000000
    mthi  $4			# hi=0x2a293184,lo=0x00000000
    mthi  $2			# hi=0x6998503d,lo=0x00000000
    mthi  $18			# hi=0x65f6de40,lo=0x00000000
    mthi  $5			# hi=0x5a811f64,lo=0x00000000
    mthi  $6			# hi=0xbfcbe26e,lo=0x00000000
    mthi  $27			# hi=0x25dec05b,lo=0x00000000
    mthi  $7			# hi=0xa906df7e,lo=0x00000000
