    .org 0x0
    .global _start
    .set noat
    .set noreorder
    .set nomacro
_start:
    lui  $0, 0xdec4			# $0=0xdec40000
    ori  $0, $0, 0xc478			# $0=0x0000c478
    lui  $1, 0x1b00			# $1=0x1b000000
    ori  $1, $1, 0xd3bc			# $1=0x1b00d3bc
    lui  $2, 0xd7a3			# $2=0xd7a30000
    ori  $2, $2, 0x132a			# $2=0xd7a3132a
    lui  $3, 0xee1d			# $3=0xee1d0000
    ori  $3, $3, 0x39ca			# $3=0xee1d39ca
    lui  $4, 0x1d9f			# $4=0x1d9f0000
    ori  $4, $4, 0x0cd5			# $4=0x1d9f0cd5
    lui  $5, 0x0b12			# $5=0x0b120000
    ori  $5, $5, 0x7a2f			# $5=0x0b127a2f
    lui  $6, 0xebfa			# $6=0xebfa0000
    ori  $6, $6, 0xcb2b			# $6=0xebfacb2b
    lui  $7, 0x685e			# $7=0x685e0000
    ori  $7, $7, 0xf83f			# $7=0x685ef83f
    lui  $8, 0x966b			# $8=0x966b0000
    ori  $8, $8, 0xcbf5			# $8=0x966bcbf5
    lui  $9, 0x3e24			# $9=0x3e240000
    ori  $9, $9, 0x77de			# $9=0x3e2477de
    lui  $10, 0x67af			# $10=0x67af0000
    ori  $10, $10, 0xdac9			# $10=0x67afdac9
    lui  $11, 0x4851			# $11=0x48510000
    ori  $11, $11, 0xab31			# $11=0x4851ab31
    lui  $12, 0xcd7b			# $12=0xcd7b0000
    ori  $12, $12, 0xb253			# $12=0xcd7bb253
    lui  $13, 0x8f5a			# $13=0x8f5a0000
    ori  $13, $13, 0x44c7			# $13=0x8f5a44c7
    lui  $14, 0x5135			# $14=0x51350000
    ori  $14, $14, 0x14ce			# $14=0x513514ce
    lui  $15, 0x93a7			# $15=0x93a70000
    ori  $15, $15, 0xd658			# $15=0x93a7d658
    lui  $16, 0x0b79			# $16=0x0b790000
    ori  $16, $16, 0x7a4f			# $16=0x0b797a4f
    lui  $17, 0x0daf			# $17=0x0daf0000
    ori  $17, $17, 0xc78b			# $17=0x0dafc78b
    lui  $18, 0x45b0			# $18=0x45b00000
    ori  $18, $18, 0x602a			# $18=0x45b0602a
    lui  $19, 0xca07			# $19=0xca070000
    ori  $19, $19, 0x306b			# $19=0xca07306b
    lui  $20, 0x5f76			# $20=0x5f760000
    ori  $20, $20, 0xda14			# $20=0x5f76da14
    lui  $21, 0x1826			# $21=0x18260000
    ori  $21, $21, 0x636d			# $21=0x1826636d
    lui  $22, 0x2f13			# $22=0x2f130000
    ori  $22, $22, 0x7ca4			# $22=0x2f137ca4
    lui  $23, 0x0cfb			# $23=0x0cfb0000
    ori  $23, $23, 0x39d6			# $23=0x0cfb39d6
    lui  $24, 0xee93			# $24=0xee930000
    ori  $24, $24, 0xf111			# $24=0xee93f111
    lui  $25, 0x495b			# $25=0x495b0000
    ori  $25, $25, 0xb3fd			# $25=0x495bb3fd
    lui  $26, 0xdf4f			# $26=0xdf4f0000
    ori  $26, $26, 0x26b2			# $26=0xdf4f26b2
    lui  $27, 0x7343			# $27=0x73430000
    ori  $27, $27, 0xf8e8			# $27=0x7343f8e8
    lui  $28, 0xaf5c			# $28=0xaf5c0000
    ori  $28, $28, 0xd263			# $28=0xaf5cd263
    lui  $29, 0xe835			# $29=0xe8350000
    ori  $29, $29, 0x165f			# $29=0xe835165f
    lui  $30, 0x797d			# $30=0x797d0000
    ori  $30, $30, 0x43e2			# $30=0x797d43e2
    lui  $31, 0x7940			# $31=0x79400000
    ori  $31, $31, 0x39d5			# $31=0x794039d5
    addiu  $12, $28, 0x5b17			# $12=0xaf5d2d7a
    addiu  $23, $21, 0x4f62			# $23=0x1826b2cf
    addiu  $13, $28, 0x21ce			# $13=0xaf5cf431
    addiu  $11, $27, 0x859a			# $11=0x73437e82
    addiu  $28, $6, 0x9dfe			# $28=0xebfa6929
    addiu  $22, $20, 0x9c99			# $22=0x5f7676ad
    addiu  $29, $17, 0xbf7b			# $29=0x0daf8706
    addiu  $2, $26, 0xff87			# $2=0xdf4f2639
    addiu  $19, $13, 0x8a14			# $19=0xaf5c7e45
    addiu  $1, $17, 0x1eaf			# $1=0x0dafe63a
    addiu  $26, $29, 0xeafa			# $26=0x0daf7200
    addiu  $18, $2, 0x27ab			# $18=0xdf4f4de4
    addiu  $23, $23, 0x3183			# $23=0x1826e452
    addiu  $16, $19, 0x3396			# $16=0xaf5cb1db
    addiu  $17, $22, 0x9f2e			# $17=0x5f7615db
    addiu  $21, $17, 0xfc2f			# $21=0x5f76120a
    addiu  $17, $7, 0x618d			# $17=0x685f59cc
    addiu  $5, $21, 0xf781			# $5=0x5f76098b
    addiu  $26, $1, 0xe8a4			# $26=0x0dafcede
    addiu  $21, $7, 0x13ea			# $21=0x685f0c29
