    .org 0x0
    .global _start
    .set noat
    .set noreorder
    .set nomacro
_start:
    lui  $0, 0x6676			# $0=0x66760000
    ori  $0, $0, 0x91ff			# $0=0x000091ff
    lui  $1, 0xd323			# $1=0xd3230000
    ori  $1, $1, 0xaa5d			# $1=0xd323aa5d
    lui  $2, 0x1b62			# $2=0x1b620000
    ori  $2, $2, 0x9162			# $2=0x1b629162
    lui  $3, 0x6466			# $3=0x64660000
    ori  $3, $3, 0x0ef8			# $3=0x64660ef8
    lui  $4, 0x0c1e			# $4=0x0c1e0000
    ori  $4, $4, 0x039b			# $4=0x0c1e039b
    lui  $5, 0x3776			# $5=0x37760000
    ori  $5, $5, 0x6903			# $5=0x37766903
    lui  $6, 0xf622			# $6=0xf6220000
    ori  $6, $6, 0xced4			# $6=0xf622ced4
    lui  $7, 0xa320			# $7=0xa3200000
    ori  $7, $7, 0x91a7			# $7=0xa32091a7
    lui  $8, 0x7afd			# $8=0x7afd0000
    ori  $8, $8, 0xc434			# $8=0x7afdc434
    lui  $9, 0xa171			# $9=0xa1710000
    ori  $9, $9, 0x7261			# $9=0xa1717261
    lui  $10, 0x734f			# $10=0x734f0000
    ori  $10, $10, 0x8776			# $10=0x734f8776
    lui  $11, 0x4f42			# $11=0x4f420000
    ori  $11, $11, 0x62d1			# $11=0x4f4262d1
    lui  $12, 0xa8c7			# $12=0xa8c70000
    ori  $12, $12, 0x7b66			# $12=0xa8c77b66
    lui  $13, 0x83ff			# $13=0x83ff0000
    ori  $13, $13, 0x4aa9			# $13=0x83ff4aa9
    lui  $14, 0xc4d5			# $14=0xc4d50000
    ori  $14, $14, 0xca2e			# $14=0xc4d5ca2e
    lui  $15, 0xc262			# $15=0xc2620000
    ori  $15, $15, 0x2ef6			# $15=0xc2622ef6
    lui  $16, 0x525f			# $16=0x525f0000
    ori  $16, $16, 0xd783			# $16=0x525fd783
    lui  $17, 0xa12c			# $17=0xa12c0000
    ori  $17, $17, 0xffd5			# $17=0xa12cffd5
    lui  $18, 0x4ee6			# $18=0x4ee60000
    ori  $18, $18, 0xa74c			# $18=0x4ee6a74c
    lui  $19, 0xa2d6			# $19=0xa2d60000
    ori  $19, $19, 0xfdb5			# $19=0xa2d6fdb5
    lui  $20, 0x3d92			# $20=0x3d920000
    ori  $20, $20, 0xa0a1			# $20=0x3d92a0a1
    lui  $21, 0x8b22			# $21=0x8b220000
    ori  $21, $21, 0xcadd			# $21=0x8b22cadd
    lui  $22, 0x3c4e			# $22=0x3c4e0000
    ori  $22, $22, 0xb1e3			# $22=0x3c4eb1e3
    lui  $23, 0xc034			# $23=0xc0340000
    ori  $23, $23, 0x842f			# $23=0xc034842f
    lui  $24, 0xe850			# $24=0xe8500000
    ori  $24, $24, 0x095e			# $24=0xe850095e
    lui  $25, 0xafc1			# $25=0xafc10000
    ori  $25, $25, 0x83a8			# $25=0xafc183a8
    lui  $26, 0xe8a2			# $26=0xe8a20000
    ori  $26, $26, 0xdc7e			# $26=0xe8a2dc7e
    lui  $27, 0x540e			# $27=0x540e0000
    ori  $27, $27, 0x7cce			# $27=0x540e7cce
    lui  $28, 0xbdbc			# $28=0xbdbc0000
    ori  $28, $28, 0xaa6a			# $28=0xbdbcaa6a
    lui  $29, 0x08ce			# $29=0x08ce0000
    ori  $29, $29, 0xcf1c			# $29=0x08cecf1c
    lui  $30, 0x5b68			# $30=0x5b680000
    ori  $30, $30, 0xf4c5			# $30=0x5b68f4c5
    lui  $31, 0x94a0			# $31=0x94a00000
    ori  $31, $31, 0x2181			# $31=0x94a02181
    mult  $19, $16			# hi=0xe205fc9f,lo=0x0341d69f
    mult  $15, $4			# hi=0xfd1560d6,lo=0xe0d350f2
    mult  $23, $14			# hi=0x0ebe6a54,lo=0xf0d7d672
    mult  $10, $24			# hi=0xf554985f,lo=0x67d6e354
    mult  $20, $2			# hi=0x06962c0a,lo=0x17beaea2
    mult  $16, $22			# hi=0x1367c8f3,lo=0xace7ac29
    mult  $28, $19			# hi=0x181d1378,lo=0x236b3ef2
    mult  $23, $12			# hi=0x15bc3ca2,lo=0x68f83fba
    mult  $22, $29			# hi=0x02132dac,lo=0x771c01d4
    mult  $26, $19			# hi=0x08809406,lo=0x7c626b16
    mult  $15, $20			# hi=0xf12e1a86,lo=0x036548b6
    mult  $1, $15			# hi=0x0acc2829,lo=0xfe7c6b5e
    mult  $13, $26			# hi=0x0b512dbf,lo=0xc2c1fb2e
    mult  $26, $14			# hi=0x05665160,lo=0x3c150aa4
    mult  $21, $31			# hi=0x310438de,lo=0x26ceb65d
    mult  $2, $24			# hi=0xfd77522c,lo=0xc3edd3fc
    mult  $5, $31			# hi=0xe8bcbcf6,lo=0x94144d83
    mult  $9, $22			# hi=0xe9b985ab,lo=0x2d3b7d03
    mult  $16, $6			# hi=0xfcd374dc,lo=0xd82fe27c
    mult  $7, $8			# hi=0xd361756b,lo=0x9a2c71ec
