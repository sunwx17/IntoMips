    .org 0x0
    .global _start
    .set noat
    .set noreorder
    .set nomacro
_start:
    lui  $0, 0x4922			# $0=0x49220000
    ori  $0, $0, 0xae69			# $0=0x0000ae69
    lui  $1, 0xdaed			# $1=0xdaed0000
    ori  $1, $1, 0xd257			# $1=0xdaedd257
    lui  $2, 0x15d6			# $2=0x15d60000
    ori  $2, $2, 0x945e			# $2=0x15d6945e
    lui  $3, 0x7b50			# $3=0x7b500000
    ori  $3, $3, 0x1325			# $3=0x7b501325
    lui  $4, 0x8ebe			# $4=0x8ebe0000
    ori  $4, $4, 0x001c			# $4=0x8ebe001c
    lui  $5, 0x9fd6			# $5=0x9fd60000
    ori  $5, $5, 0x2d73			# $5=0x9fd62d73
    lui  $6, 0x5651			# $6=0x56510000
    ori  $6, $6, 0x0ff0			# $6=0x56510ff0
    lui  $7, 0x38d2			# $7=0x38d20000
    ori  $7, $7, 0xcc1b			# $7=0x38d2cc1b
    lui  $8, 0x5fd9			# $8=0x5fd90000
    ori  $8, $8, 0x68a9			# $8=0x5fd968a9
    lui  $9, 0x733d			# $9=0x733d0000
    ori  $9, $9, 0x1a6e			# $9=0x733d1a6e
    lui  $10, 0x571d			# $10=0x571d0000
    ori  $10, $10, 0x195f			# $10=0x571d195f
    lui  $11, 0xd7f5			# $11=0xd7f50000
    ori  $11, $11, 0x25f3			# $11=0xd7f525f3
    lui  $12, 0x179a			# $12=0x179a0000
    ori  $12, $12, 0xfd7b			# $12=0x179afd7b
    lui  $13, 0xc71b			# $13=0xc71b0000
    ori  $13, $13, 0x7abc			# $13=0xc71b7abc
    lui  $14, 0xd55e			# $14=0xd55e0000
    ori  $14, $14, 0x5df0			# $14=0xd55e5df0
    lui  $15, 0x4283			# $15=0x42830000
    ori  $15, $15, 0xabd0			# $15=0x4283abd0
    lui  $16, 0x1cc4			# $16=0x1cc40000
    ori  $16, $16, 0x6be7			# $16=0x1cc46be7
    lui  $17, 0xcbe7			# $17=0xcbe70000
    ori  $17, $17, 0x6d59			# $17=0xcbe76d59
    lui  $18, 0xca16			# $18=0xca160000
    ori  $18, $18, 0x6b45			# $18=0xca166b45
    lui  $19, 0xe550			# $19=0xe5500000
    ori  $19, $19, 0x9057			# $19=0xe5509057
    lui  $20, 0x091b			# $20=0x091b0000
    ori  $20, $20, 0x0f9b			# $20=0x091b0f9b
    lui  $21, 0xa086			# $21=0xa0860000
    ori  $21, $21, 0x8ec5			# $21=0xa0868ec5
    lui  $22, 0xb37b			# $22=0xb37b0000
    ori  $22, $22, 0x0111			# $22=0xb37b0111
    lui  $23, 0x7cd1			# $23=0x7cd10000
    ori  $23, $23, 0xefc6			# $23=0x7cd1efc6
    lui  $24, 0x0d4d			# $24=0x0d4d0000
    ori  $24, $24, 0x6f45			# $24=0x0d4d6f45
    lui  $25, 0x003d			# $25=0x003d0000
    ori  $25, $25, 0x744d			# $25=0x003d744d
    lui  $26, 0xbf1f			# $26=0xbf1f0000
    ori  $26, $26, 0xf6b4			# $26=0xbf1ff6b4
    lui  $27, 0x5fa9			# $27=0x5fa90000
    ori  $27, $27, 0x9af5			# $27=0x5fa99af5
    lui  $28, 0xb2bd			# $28=0xb2bd0000
    ori  $28, $28, 0x6f4f			# $28=0xb2bd6f4f
    lui  $29, 0xa2cf			# $29=0xa2cf0000
    ori  $29, $29, 0x1e20			# $29=0xa2cf1e20
    lui  $30, 0x7441			# $30=0x74410000
    ori  $30, $30, 0x0853			# $30=0x74410853
    lui  $31, 0x9c27			# $31=0x9c270000
    ori  $31, $31, 0x9c14			# $31=0x9c279c14
    mult  $25, $26			# hi=0x002de171,lo=0xc14ac424
    mult  $18, $29			# hi=0x8085afca,lo=0x4a2a7ea0
    mult  $15, $4			# hi=0x2516670e,lo=0x2ac6cac0
    mult  $5, $17			# hi=0x7f4f5492,lo=0xf694c3fb
    mult  $30, $16			# hi=0x0d104fb3,lo=0x88b533e5
    mult  $16, $1			# hi=0x1899fd5d,lo=0x821f2981
    mult  $30, $12			# hi=0x0ab839fa,lo=0x976706e1
    mult  $25, $8			# hi=0x00170259,lo=0x48160ed5
    mult  $21, $6			# hi=0x36200887,lo=0xbad863b0
    mult  $22, $21			# hi=0x708b3725,lo=0x87254015
    mult  $10, $14			# hi=0x489b52c2,lo=0x99614c10
    mult  $16, $3			# hi=0x0ddb5f60,lo=0x7195bd63
    mult  $25, $21			# hi=0x002688fd,lo=0x461b3541
    mult  $7, $6			# hi=0x1328cecd,lo=0x461fee50
    mult  $26, $9			# hi=0x5608fa2c,lo=0x03ae4958
    mult  $26, $25			# hi=0x002de171,lo=0xc14ac424
    mult  $0, $31			# hi=0x00000000,lo=0x00000000
    mult  $23, $30			# hi=0x38aed602,lo=0xa0d4ed32
    mult  $8, $22			# hi=0x43331209,lo=0xab0b9c39
    mult  $19, $28			# hi=0xa01bb48b,lo=0xc0ad43d9
