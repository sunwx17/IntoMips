    .org 0x0
    .global _start
    .set noat
    .set noreorder
    .set nomacro
_start:
    lui  $0, 0x82e9			# $0=0x82e90000
    ori  $0, $0, 0x3bda			# $0=0x00003bda
    lui  $1, 0xb6a8			# $1=0xb6a80000
    ori  $1, $1, 0x7525			# $1=0xb6a87525
    lui  $2, 0x0f8a			# $2=0x0f8a0000
    ori  $2, $2, 0xadfc			# $2=0x0f8aadfc
    lui  $3, 0xd74c			# $3=0xd74c0000
    ori  $3, $3, 0x2d8b			# $3=0xd74c2d8b
    lui  $4, 0xf3ac			# $4=0xf3ac0000
    ori  $4, $4, 0x6de2			# $4=0xf3ac6de2
    lui  $5, 0x4438			# $5=0x44380000
    ori  $5, $5, 0x7b72			# $5=0x44387b72
    lui  $6, 0x685b			# $6=0x685b0000
    ori  $6, $6, 0x2c43			# $6=0x685b2c43
    lui  $7, 0x9ff6			# $7=0x9ff60000
    ori  $7, $7, 0xd927			# $7=0x9ff6d927
    lui  $8, 0x8d9b			# $8=0x8d9b0000
    ori  $8, $8, 0x96e9			# $8=0x8d9b96e9
    lui  $9, 0xec24			# $9=0xec240000
    ori  $9, $9, 0x0639			# $9=0xec240639
    lui  $10, 0xebcf			# $10=0xebcf0000
    ori  $10, $10, 0xf792			# $10=0xebcff792
    lui  $11, 0x922d			# $11=0x922d0000
    ori  $11, $11, 0x5bac			# $11=0x922d5bac
    lui  $12, 0x1bcb			# $12=0x1bcb0000
    ori  $12, $12, 0x342a			# $12=0x1bcb342a
    lui  $13, 0xbc73			# $13=0xbc730000
    ori  $13, $13, 0xc01a			# $13=0xbc73c01a
    lui  $14, 0xbe62			# $14=0xbe620000
    ori  $14, $14, 0xae12			# $14=0xbe62ae12
    lui  $15, 0xfdc4			# $15=0xfdc40000
    ori  $15, $15, 0xb4d6			# $15=0xfdc4b4d6
    lui  $16, 0xf581			# $16=0xf5810000
    ori  $16, $16, 0x3527			# $16=0xf5813527
    lui  $17, 0x8ec0			# $17=0x8ec00000
    ori  $17, $17, 0x4bed			# $17=0x8ec04bed
    lui  $18, 0x1a6a			# $18=0x1a6a0000
    ori  $18, $18, 0x4016			# $18=0x1a6a4016
    lui  $19, 0x21d8			# $19=0x21d80000
    ori  $19, $19, 0xf184			# $19=0x21d8f184
    lui  $20, 0xbb5f			# $20=0xbb5f0000
    ori  $20, $20, 0x2452			# $20=0xbb5f2452
    lui  $21, 0xd9ef			# $21=0xd9ef0000
    ori  $21, $21, 0x6972			# $21=0xd9ef6972
    lui  $22, 0x0966			# $22=0x09660000
    ori  $22, $22, 0xe2d8			# $22=0x0966e2d8
    lui  $23, 0xb043			# $23=0xb0430000
    ori  $23, $23, 0x5589			# $23=0xb0435589
    lui  $24, 0x9811			# $24=0x98110000
    ori  $24, $24, 0xfc7d			# $24=0x9811fc7d
    lui  $25, 0x7137			# $25=0x71370000
    ori  $25, $25, 0x3a2f			# $25=0x71373a2f
    lui  $26, 0x61f9			# $26=0x61f90000
    ori  $26, $26, 0x6a30			# $26=0x61f96a30
    lui  $27, 0x97a4			# $27=0x97a40000
    ori  $27, $27, 0x6498			# $27=0x97a46498
    lui  $28, 0x08e4			# $28=0x08e40000
    ori  $28, $28, 0x3722			# $28=0x08e43722
    lui  $29, 0x2326			# $29=0x23260000
    ori  $29, $29, 0xc5dc			# $29=0x2326c5dc
    lui  $30, 0xafc8			# $30=0xafc80000
    ori  $30, $30, 0x8d5f			# $30=0xafc88d5f
    lui  $31, 0x38bd			# $31=0x38bd0000
    ori  $31, $31, 0x8506			# $31=0x38bd8506
    mthi  $8			# hi=0x8d9b96e9,lo=0x00000000
    mthi  $11			# hi=0x922d5bac,lo=0x00000000
    mthi  $12			# hi=0x1bcb342a,lo=0x00000000
    mthi  $6			# hi=0x685b2c43,lo=0x00000000
    mthi  $11			# hi=0x922d5bac,lo=0x00000000
    mthi  $30			# hi=0xafc88d5f,lo=0x00000000
    mthi  $25			# hi=0x71373a2f,lo=0x00000000
    mthi  $18			# hi=0x1a6a4016,lo=0x00000000
    mthi  $31			# hi=0x38bd8506,lo=0x00000000
    mthi  $18			# hi=0x1a6a4016,lo=0x00000000
    mthi  $26			# hi=0x61f96a30,lo=0x00000000
    mthi  $11			# hi=0x922d5bac,lo=0x00000000
    mthi  $16			# hi=0xf5813527,lo=0x00000000
    mthi  $12			# hi=0x1bcb342a,lo=0x00000000
    mthi  $26			# hi=0x61f96a30,lo=0x00000000
    mthi  $28			# hi=0x08e43722,lo=0x00000000
    mthi  $18			# hi=0x1a6a4016,lo=0x00000000
    mthi  $16			# hi=0xf5813527,lo=0x00000000
    mthi  $28			# hi=0x08e43722,lo=0x00000000
    mthi  $10			# hi=0xebcff792,lo=0x00000000
