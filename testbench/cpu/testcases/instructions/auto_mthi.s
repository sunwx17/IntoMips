    .org 0x0
    .global _start
    .set noat
    .set noreorder
    .set nomacro
_start:
    lui  $0, 0xc4fe			# $0=0xc4fe0000
    ori  $0, $0, 0xb233			# $0=0x0000b233
    lui  $1, 0xc9f7			# $1=0xc9f70000
    ori  $1, $1, 0xd045			# $1=0xc9f7d045
    lui  $2, 0x6d79			# $2=0x6d790000
    ori  $2, $2, 0xbdbe			# $2=0x6d79bdbe
    lui  $3, 0xe9f6			# $3=0xe9f60000
    ori  $3, $3, 0x933e			# $3=0xe9f6933e
    lui  $4, 0x4583			# $4=0x45830000
    ori  $4, $4, 0xc12e			# $4=0x4583c12e
    lui  $5, 0x1164			# $5=0x11640000
    ori  $5, $5, 0x80ab			# $5=0x116480ab
    lui  $6, 0x54be			# $6=0x54be0000
    ori  $6, $6, 0x1743			# $6=0x54be1743
    lui  $7, 0xd704			# $7=0xd7040000
    ori  $7, $7, 0xa02e			# $7=0xd704a02e
    lui  $8, 0x22aa			# $8=0x22aa0000
    ori  $8, $8, 0x199d			# $8=0x22aa199d
    lui  $9, 0xcbac			# $9=0xcbac0000
    ori  $9, $9, 0xb149			# $9=0xcbacb149
    lui  $10, 0x1bee			# $10=0x1bee0000
    ori  $10, $10, 0x299d			# $10=0x1bee299d
    lui  $11, 0x11c0			# $11=0x11c00000
    ori  $11, $11, 0xf41b			# $11=0x11c0f41b
    lui  $12, 0xa0ae			# $12=0xa0ae0000
    ori  $12, $12, 0x8e47			# $12=0xa0ae8e47
    lui  $13, 0x5271			# $13=0x52710000
    ori  $13, $13, 0x2264			# $13=0x52712264
    lui  $14, 0xd121			# $14=0xd1210000
    ori  $14, $14, 0xced8			# $14=0xd121ced8
    lui  $15, 0xe690			# $15=0xe6900000
    ori  $15, $15, 0x999d			# $15=0xe690999d
    lui  $16, 0xa41a			# $16=0xa41a0000
    ori  $16, $16, 0x9c4c			# $16=0xa41a9c4c
    lui  $17, 0xa6c2			# $17=0xa6c20000
    ori  $17, $17, 0x5d3a			# $17=0xa6c25d3a
    lui  $18, 0x60fd			# $18=0x60fd0000
    ori  $18, $18, 0x7337			# $18=0x60fd7337
    lui  $19, 0xb903			# $19=0xb9030000
    ori  $19, $19, 0xbe0b			# $19=0xb903be0b
    lui  $20, 0x681b			# $20=0x681b0000
    ori  $20, $20, 0xf6bd			# $20=0x681bf6bd
    lui  $21, 0x8910			# $21=0x89100000
    ori  $21, $21, 0x4ab4			# $21=0x89104ab4
    lui  $22, 0x8ce9			# $22=0x8ce90000
    ori  $22, $22, 0xe337			# $22=0x8ce9e337
    lui  $23, 0x1eb6			# $23=0x1eb60000
    ori  $23, $23, 0xf52d			# $23=0x1eb6f52d
    lui  $24, 0xdc18			# $24=0xdc180000
    ori  $24, $24, 0x3fc9			# $24=0xdc183fc9
    lui  $25, 0x8933			# $25=0x89330000
    ori  $25, $25, 0x9f6e			# $25=0x89339f6e
    lui  $26, 0xdf2f			# $26=0xdf2f0000
    ori  $26, $26, 0x5ef5			# $26=0xdf2f5ef5
    lui  $27, 0xdc9a			# $27=0xdc9a0000
    ori  $27, $27, 0xf332			# $27=0xdc9af332
    lui  $28, 0xe7cf			# $28=0xe7cf0000
    ori  $28, $28, 0x31a3			# $28=0xe7cf31a3
    lui  $29, 0x9f30			# $29=0x9f300000
    ori  $29, $29, 0xe05d			# $29=0x9f30e05d
    lui  $30, 0xdb64			# $30=0xdb640000
    ori  $30, $30, 0x8863			# $30=0xdb648863
    lui  $31, 0xac18			# $31=0xac180000
    ori  $31, $31, 0xf3b7			# $31=0xac18f3b7
    mthi  $20			# hi=0x681bf6bd,lo=0x00000000
    mthi  $11			# hi=0x11c0f41b,lo=0x00000000
    mthi  $28			# hi=0xe7cf31a3,lo=0x00000000
    mthi  $20			# hi=0x681bf6bd,lo=0x00000000
    mthi  $20			# hi=0x681bf6bd,lo=0x00000000
    mthi  $28			# hi=0xe7cf31a3,lo=0x00000000
    mthi  $28			# hi=0xe7cf31a3,lo=0x00000000
    mthi  $31			# hi=0xac18f3b7,lo=0x00000000
    mthi  $17			# hi=0xa6c25d3a,lo=0x00000000
    mthi  $17			# hi=0xa6c25d3a,lo=0x00000000
    mthi  $15			# hi=0xe690999d,lo=0x00000000
    mthi  $29			# hi=0x9f30e05d,lo=0x00000000
    mthi  $16			# hi=0xa41a9c4c,lo=0x00000000
    mthi  $19			# hi=0xb903be0b,lo=0x00000000
    mthi  $12			# hi=0xa0ae8e47,lo=0x00000000
    mthi  $10			# hi=0x1bee299d,lo=0x00000000
    mthi  $6			# hi=0x54be1743,lo=0x00000000
    mthi  $17			# hi=0xa6c25d3a,lo=0x00000000
    mthi  $15			# hi=0xe690999d,lo=0x00000000
    mthi  $16			# hi=0xa41a9c4c,lo=0x00000000
