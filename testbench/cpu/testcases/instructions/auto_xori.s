    .org 0x0
    .global _start
    .set noat
    .set noreorder
    .set nomacro
_start:
    lui  $0, 0x7fbf			# $0=0x7fbf0000
    ori  $0, $0, 0x331a			# $0=0x0000331a
    lui  $1, 0x83bd			# $1=0x83bd0000
    ori  $1, $1, 0xca33			# $1=0x83bdca33
    lui  $2, 0x4995			# $2=0x49950000
    ori  $2, $2, 0x193e			# $2=0x4995193e
    lui  $3, 0x7ae5			# $3=0x7ae50000
    ori  $3, $3, 0xce95			# $3=0x7ae5ce95
    lui  $4, 0xa9ba			# $4=0xa9ba0000
    ori  $4, $4, 0x0ec2			# $4=0xa9ba0ec2
    lui  $5, 0x37f8			# $5=0x37f80000
    ori  $5, $5, 0x7890			# $5=0x37f87890
    lui  $6, 0x70a1			# $6=0x70a10000
    ori  $6, $6, 0x820e			# $6=0x70a1820e
    lui  $7, 0x7c3e			# $7=0x7c3e0000
    ori  $7, $7, 0xa0a9			# $7=0x7c3ea0a9
    lui  $8, 0xf9e7			# $8=0xf9e70000
    ori  $8, $8, 0x3410			# $8=0xf9e73410
    lui  $9, 0x2174			# $9=0x21740000
    ori  $9, $9, 0x97ee			# $9=0x217497ee
    lui  $10, 0x0187			# $10=0x01870000
    ori  $10, $10, 0xd079			# $10=0x0187d079
    lui  $11, 0xd38b			# $11=0xd38b0000
    ori  $11, $11, 0x2275			# $11=0xd38b2275
    lui  $12, 0xf2ca			# $12=0xf2ca0000
    ori  $12, $12, 0x7d2f			# $12=0xf2ca7d2f
    lui  $13, 0x3888			# $13=0x38880000
    ori  $13, $13, 0x7918			# $13=0x38887918
    lui  $14, 0x13b7			# $14=0x13b70000
    ori  $14, $14, 0x7c9c			# $14=0x13b77c9c
    lui  $15, 0x8cbc			# $15=0x8cbc0000
    ori  $15, $15, 0x7300			# $15=0x8cbc7300
    lui  $16, 0xdcef			# $16=0xdcef0000
    ori  $16, $16, 0xcede			# $16=0xdcefcede
    lui  $17, 0x5dd5			# $17=0x5dd50000
    ori  $17, $17, 0x1098			# $17=0x5dd51098
    lui  $18, 0x6510			# $18=0x65100000
    ori  $18, $18, 0x41ea			# $18=0x651041ea
    lui  $19, 0x8937			# $19=0x89370000
    ori  $19, $19, 0x5dd4			# $19=0x89375dd4
    lui  $20, 0xe63b			# $20=0xe63b0000
    ori  $20, $20, 0xda70			# $20=0xe63bda70
    lui  $21, 0x7cb9			# $21=0x7cb90000
    ori  $21, $21, 0xce2e			# $21=0x7cb9ce2e
    lui  $22, 0x5439			# $22=0x54390000
    ori  $22, $22, 0x9f3a			# $22=0x54399f3a
    lui  $23, 0x0529			# $23=0x05290000
    ori  $23, $23, 0x50df			# $23=0x052950df
    lui  $24, 0xda42			# $24=0xda420000
    ori  $24, $24, 0x9356			# $24=0xda429356
    lui  $25, 0xef45			# $25=0xef450000
    ori  $25, $25, 0x939a			# $25=0xef45939a
    lui  $26, 0x349d			# $26=0x349d0000
    ori  $26, $26, 0x4104			# $26=0x349d4104
    lui  $27, 0x4a2c			# $27=0x4a2c0000
    ori  $27, $27, 0xb882			# $27=0x4a2cb882
    lui  $28, 0xb035			# $28=0xb0350000
    ori  $28, $28, 0xedf4			# $28=0xb035edf4
    lui  $29, 0x79c4			# $29=0x79c40000
    ori  $29, $29, 0xb8e2			# $29=0x79c4b8e2
    lui  $30, 0x1278			# $30=0x12780000
    ori  $30, $30, 0xfe13			# $30=0x1278fe13
    lui  $31, 0x3ba9			# $31=0x3ba90000
    ori  $31, $31, 0xfb58			# $31=0x3ba9fb58
    xori  $31, $31, 0xef97			# $31=0x3ba914cf
    xori  $9, $19, 0x4a51			# $9=0x89371785
    xori  $18, $21, 0xb788			# $18=0x7cb979a6
    xori  $1, $30, 0xc8bf			# $1=0x127836ac
    xori  $16, $15, 0xf310			# $16=0x8cbc8010
    xori  $21, $5, 0x89ea			# $21=0x37f8f17a
    xori  $31, $7, 0xc174			# $31=0x7c3e61dd
    xori  $3, $18, 0x905c			# $3=0x7cb9e9fa
    xori  $1, $7, 0x4af3			# $1=0x7c3eea5a
    xori  $8, $21, 0xf74a			# $8=0x37f80630
    xori  $0, $7, 0x0722			# $0=0x7c3ea78b
    xori  $17, $2, 0xf18f			# $17=0x4995e8b1
    xori  $11, $14, 0xa431			# $11=0x13b7d8ad
    xori  $20, $3, 0x73d8			# $20=0x7cb99a22
    xori  $19, $9, 0xc92f			# $19=0x8937deaa
    xori  $19, $0, 0xd978			# $19=0x0000d978
    xori  $15, $21, 0x7ab3			# $15=0x37f88bc9
    xori  $13, $1, 0x4605			# $13=0x7c3eac5f
    xori  $28, $22, 0x1f11			# $28=0x5439802b
    xori  $27, $24, 0xc109			# $27=0xda42525f
