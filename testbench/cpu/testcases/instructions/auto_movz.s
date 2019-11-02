    .org 0x0
    .global _start
    .set noat
    .set noreorder
    .set nomacro
_start:
    lui  $0, 0xf76e			# $0=0xf76e0000
    ori  $0, $0, 0x6661			# $0=0x00006661
    lui  $1, 0xb8be			# $1=0xb8be0000
    ori  $1, $1, 0xcb82			# $1=0xb8becb82
    lui  $2, 0xc4ad			# $2=0xc4ad0000
    ori  $2, $2, 0x8bfe			# $2=0xc4ad8bfe
    lui  $3, 0xff3c			# $3=0xff3c0000
    ori  $3, $3, 0x6b43			# $3=0xff3c6b43
    lui  $4, 0x8bbc			# $4=0x8bbc0000
    ori  $4, $4, 0x45c0			# $4=0x8bbc45c0
    lui  $5, 0x8d1f			# $5=0x8d1f0000
    ori  $5, $5, 0xcd28			# $5=0x8d1fcd28
    lui  $6, 0x612f			# $6=0x612f0000
    ori  $6, $6, 0xce65			# $6=0x612fce65
    lui  $7, 0x798a			# $7=0x798a0000
    ori  $7, $7, 0x6faa			# $7=0x798a6faa
    lui  $8, 0xee8d			# $8=0xee8d0000
    ori  $8, $8, 0x9b74			# $8=0xee8d9b74
    lui  $9, 0xcf0a			# $9=0xcf0a0000
    ori  $9, $9, 0x61d3			# $9=0xcf0a61d3
    lui  $10, 0x2367			# $10=0x23670000
    ori  $10, $10, 0x949d			# $10=0x2367949d
    lui  $11, 0xe564			# $11=0xe5640000
    ori  $11, $11, 0xa49a			# $11=0xe564a49a
    lui  $12, 0x32b0			# $12=0x32b00000
    ori  $12, $12, 0xb8bb			# $12=0x32b0b8bb
    lui  $13, 0xbf2b			# $13=0xbf2b0000
    ori  $13, $13, 0xd06f			# $13=0xbf2bd06f
    lui  $14, 0xde84			# $14=0xde840000
    ori  $14, $14, 0xfcbe			# $14=0xde84fcbe
    lui  $15, 0x0869			# $15=0x08690000
    ori  $15, $15, 0x793b			# $15=0x0869793b
    lui  $16, 0x875f			# $16=0x875f0000
    ori  $16, $16, 0xd464			# $16=0x875fd464
    lui  $17, 0xcdb3			# $17=0xcdb30000
    ori  $17, $17, 0xa5ca			# $17=0xcdb3a5ca
    lui  $18, 0x56b6			# $18=0x56b60000
    ori  $18, $18, 0x22d4			# $18=0x56b622d4
    lui  $19, 0xcf0e			# $19=0xcf0e0000
    ori  $19, $19, 0x6d80			# $19=0xcf0e6d80
    lui  $20, 0x089e			# $20=0x089e0000
    ori  $20, $20, 0xca51			# $20=0x089eca51
    lui  $21, 0x2f44			# $21=0x2f440000
    ori  $21, $21, 0xc8f8			# $21=0x2f44c8f8
    lui  $22, 0xd0ca			# $22=0xd0ca0000
    ori  $22, $22, 0x7b6a			# $22=0xd0ca7b6a
    lui  $23, 0x7eb6			# $23=0x7eb60000
    ori  $23, $23, 0x4cf2			# $23=0x7eb64cf2
    lui  $24, 0x278c			# $24=0x278c0000
    ori  $24, $24, 0x60d5			# $24=0x278c60d5
    lui  $25, 0xd793			# $25=0xd7930000
    ori  $25, $25, 0x2c0f			# $25=0xd7932c0f
    lui  $26, 0xd58e			# $26=0xd58e0000
    ori  $26, $26, 0xd718			# $26=0xd58ed718
    lui  $27, 0xc3f9			# $27=0xc3f90000
    ori  $27, $27, 0x411f			# $27=0xc3f9411f
    lui  $28, 0xc6aa			# $28=0xc6aa0000
    ori  $28, $28, 0xb54f			# $28=0xc6aab54f
    lui  $29, 0x5628			# $29=0x56280000
    ori  $29, $29, 0x40de			# $29=0x562840de
    lui  $30, 0xebbb			# $30=0xebbb0000
    ori  $30, $30, 0x6582			# $30=0xebbb6582
    lui  $31, 0x4c46			# $31=0x4c460000
    ori  $31, $31, 0xbd02			# $31=0x4c46bd02
    movz  $30, $8, $16			# skip
    movz  $26, $2, $21			# skip
    movz  $6, $30, $14			# skip
    movz  $9, $21, $24			# skip
    movz  $2, $21, $25			# skip
    movz  $27, $24, $31			# skip
    movz  $14, $14, $25			# skip
    movz  $25, $29, $13			# skip
    movz  $5, $13, $23			# skip
    movz  $24, $24, $12			# skip
    movz  $31, $13, $14			# skip
    movz  $28, $26, $5			# skip
    movz  $14, $14, $11			# skip
    movz  $17, $14, $1			# skip
    movz  $31, $8, $18			# skip
    movz  $9, $28, $15			# skip
    movz  $23, $2, $15			# skip
    movz  $28, $7, $20			# skip
    movz  $23, $19, $19			# skip
    movz  $10, $23, $1			# skip
