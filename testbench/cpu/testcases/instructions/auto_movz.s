    .org 0x0
    .global _start
    .set noat
    .set noreorder
    .set nomacro
_start:
    lui  $0, 0x996c			# $0=0x996c0000
    ori  $0, $0, 0x1821			# $0=0x00001821
    lui  $1, 0x5ade			# $1=0x5ade0000
    ori  $1, $1, 0xbadc			# $1=0x5adebadc
    lui  $2, 0x911d			# $2=0x911d0000
    ori  $2, $2, 0x56fa			# $2=0x911d56fa
    lui  $3, 0x51db			# $3=0x51db0000
    ori  $3, $3, 0x7c43			# $3=0x51db7c43
    lui  $4, 0x0bfd			# $4=0x0bfd0000
    ori  $4, $4, 0x4741			# $4=0x0bfd4741
    lui  $5, 0x85ce			# $5=0x85ce0000
    ori  $5, $5, 0xecd7			# $5=0x85ceecd7
    lui  $6, 0xa1e1			# $6=0xa1e10000
    ori  $6, $6, 0x8a3a			# $6=0xa1e18a3a
    lui  $7, 0x555d			# $7=0x555d0000
    ori  $7, $7, 0xe371			# $7=0x555de371
    lui  $8, 0x8f83			# $8=0x8f830000
    ori  $8, $8, 0x069e			# $8=0x8f83069e
    lui  $9, 0xc693			# $9=0xc6930000
    ori  $9, $9, 0xb8e7			# $9=0xc693b8e7
    lui  $10, 0x10fd			# $10=0x10fd0000
    ori  $10, $10, 0xbe24			# $10=0x10fdbe24
    lui  $11, 0x0168			# $11=0x01680000
    ori  $11, $11, 0xe46d			# $11=0x0168e46d
    lui  $12, 0xe0af			# $12=0xe0af0000
    ori  $12, $12, 0x38a3			# $12=0xe0af38a3
    lui  $13, 0xcd49			# $13=0xcd490000
    ori  $13, $13, 0xade2			# $13=0xcd49ade2
    lui  $14, 0xae89			# $14=0xae890000
    ori  $14, $14, 0x6264			# $14=0xae896264
    lui  $15, 0xb559			# $15=0xb5590000
    ori  $15, $15, 0x6004			# $15=0xb5596004
    lui  $16, 0xe1c5			# $16=0xe1c50000
    ori  $16, $16, 0x63a9			# $16=0xe1c563a9
    lui  $17, 0xcf29			# $17=0xcf290000
    ori  $17, $17, 0x277b			# $17=0xcf29277b
    lui  $18, 0x8a73			# $18=0x8a730000
    ori  $18, $18, 0xb5b8			# $18=0x8a73b5b8
    lui  $19, 0x45dc			# $19=0x45dc0000
    ori  $19, $19, 0x21f9			# $19=0x45dc21f9
    lui  $20, 0xd9d6			# $20=0xd9d60000
    ori  $20, $20, 0x8b1e			# $20=0xd9d68b1e
    lui  $21, 0x8d41			# $21=0x8d410000
    ori  $21, $21, 0x11f1			# $21=0x8d4111f1
    lui  $22, 0x346a			# $22=0x346a0000
    ori  $22, $22, 0x9e45			# $22=0x346a9e45
    lui  $23, 0xb789			# $23=0xb7890000
    ori  $23, $23, 0xc357			# $23=0xb789c357
    lui  $24, 0x33c6			# $24=0x33c60000
    ori  $24, $24, 0xb799			# $24=0x33c6b799
    lui  $25, 0x769f			# $25=0x769f0000
    ori  $25, $25, 0xd100			# $25=0x769fd100
    lui  $26, 0x1c9e			# $26=0x1c9e0000
    ori  $26, $26, 0xd4ef			# $26=0x1c9ed4ef
    lui  $27, 0xe564			# $27=0xe5640000
    ori  $27, $27, 0x7b3a			# $27=0xe5647b3a
    lui  $28, 0xd98f			# $28=0xd98f0000
    ori  $28, $28, 0xc65e			# $28=0xd98fc65e
    lui  $29, 0xe98f			# $29=0xe98f0000
    ori  $29, $29, 0x8c77			# $29=0xe98f8c77
    lui  $30, 0x9901			# $30=0x99010000
    ori  $30, $30, 0x89e2			# $30=0x990189e2
    lui  $31, 0xfb50			# $31=0xfb500000
    ori  $31, $31, 0x24f3			# $31=0xfb5024f3
    movz  $7, $12, $17			# skip
    movz  $25, $18, $20			# skip
    movz  $31, $29, $21			# skip
    movz  $7, $31, $8			# skip
    movz  $2, $26, $8			# skip
    movz  $28, $1, $5			# skip
    movz  $1, $1, $29			# skip
    movz  $17, $24, $19			# skip
    movz  $18, $25, $14			# skip
    movz  $17, $9, $21			# skip
    movz  $22, $19, $2			# skip
    movz  $19, $14, $26			# skip
    movz  $12, $9, $5			# skip
    movz  $13, $31, $25			# skip
    movz  $5, $21, $30			# skip
    movz  $29, $9, $11			# skip
    movz  $13, $3, $26			# skip
    movz  $17, $21, $25			# skip
    movz  $15, $29, $9			# skip
    movz  $3, $26, $28			# skip
