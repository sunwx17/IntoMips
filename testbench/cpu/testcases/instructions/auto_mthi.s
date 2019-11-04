    .org 0x0
    .global _start
    .set noat
    .set noreorder
    .set nomacro
_start:
    lui  $0, 0x19e5			# $0=0x19e50000
    ori  $0, $0, 0x3b0f			# $0=0x00003b0f
    lui  $1, 0x63ea			# $1=0x63ea0000
    ori  $1, $1, 0xb211			# $1=0x63eab211
    lui  $2, 0x6ef6			# $2=0x6ef60000
    ori  $2, $2, 0x7131			# $2=0x6ef67131
    lui  $3, 0xe9a3			# $3=0xe9a30000
    ori  $3, $3, 0xd5b1			# $3=0xe9a3d5b1
    lui  $4, 0x7c8f			# $4=0x7c8f0000
    ori  $4, $4, 0xef2c			# $4=0x7c8fef2c
    lui  $5, 0xc4eb			# $5=0xc4eb0000
    ori  $5, $5, 0xbb79			# $5=0xc4ebbb79
    lui  $6, 0x52e8			# $6=0x52e80000
    ori  $6, $6, 0x1770			# $6=0x52e81770
    lui  $7, 0xe7f2			# $7=0xe7f20000
    ori  $7, $7, 0x1f29			# $7=0xe7f21f29
    lui  $8, 0x7fc7			# $8=0x7fc70000
    ori  $8, $8, 0x60ac			# $8=0x7fc760ac
    lui  $9, 0x234e			# $9=0x234e0000
    ori  $9, $9, 0xb606			# $9=0x234eb606
    lui  $10, 0xfdbf			# $10=0xfdbf0000
    ori  $10, $10, 0x2737			# $10=0xfdbf2737
    lui  $11, 0x33bb			# $11=0x33bb0000
    ori  $11, $11, 0xc437			# $11=0x33bbc437
    lui  $12, 0xefe6			# $12=0xefe60000
    ori  $12, $12, 0xca0b			# $12=0xefe6ca0b
    lui  $13, 0x1000			# $13=0x10000000
    ori  $13, $13, 0xc503			# $13=0x1000c503
    lui  $14, 0x9755			# $14=0x97550000
    ori  $14, $14, 0xb7a1			# $14=0x9755b7a1
    lui  $15, 0x43e2			# $15=0x43e20000
    ori  $15, $15, 0x037e			# $15=0x43e2037e
    lui  $16, 0xd019			# $16=0xd0190000
    ori  $16, $16, 0xa55a			# $16=0xd019a55a
    lui  $17, 0x114b			# $17=0x114b0000
    ori  $17, $17, 0x6656			# $17=0x114b6656
    lui  $18, 0x8218			# $18=0x82180000
    ori  $18, $18, 0xa714			# $18=0x8218a714
    lui  $19, 0xb19d			# $19=0xb19d0000
    ori  $19, $19, 0x4c64			# $19=0xb19d4c64
    lui  $20, 0x09ac			# $20=0x09ac0000
    ori  $20, $20, 0x523f			# $20=0x09ac523f
    lui  $21, 0x7c03			# $21=0x7c030000
    ori  $21, $21, 0x0944			# $21=0x7c030944
    lui  $22, 0x614e			# $22=0x614e0000
    ori  $22, $22, 0xb35f			# $22=0x614eb35f
    lui  $23, 0xe0fa			# $23=0xe0fa0000
    ori  $23, $23, 0xe0cd			# $23=0xe0fae0cd
    lui  $24, 0x5495			# $24=0x54950000
    ori  $24, $24, 0x3409			# $24=0x54953409
    lui  $25, 0x5f12			# $25=0x5f120000
    ori  $25, $25, 0x3ab4			# $25=0x5f123ab4
    lui  $26, 0xa856			# $26=0xa8560000
    ori  $26, $26, 0x844d			# $26=0xa856844d
    lui  $27, 0xf447			# $27=0xf4470000
    ori  $27, $27, 0xea9e			# $27=0xf447ea9e
    lui  $28, 0xf8bc			# $28=0xf8bc0000
    ori  $28, $28, 0x09a8			# $28=0xf8bc09a8
    lui  $29, 0x5494			# $29=0x54940000
    ori  $29, $29, 0xb4d9			# $29=0x5494b4d9
    lui  $30, 0x0804			# $30=0x08040000
    ori  $30, $30, 0x23fc			# $30=0x080423fc
    lui  $31, 0x98bb			# $31=0x98bb0000
    ori  $31, $31, 0xd6c7			# $31=0x98bbd6c7
    mthi  $4			# hi=0x7c8fef2c,lo=0x00000000
    mthi  $31			# hi=0x98bbd6c7,lo=0x00000000
    mthi  $3			# hi=0xe9a3d5b1,lo=0x00000000
    mthi  $16			# hi=0xd019a55a,lo=0x00000000
    mthi  $19			# hi=0xb19d4c64,lo=0x00000000
    mthi  $8			# hi=0x7fc760ac,lo=0x00000000
    mthi  $27			# hi=0xf447ea9e,lo=0x00000000
    mthi  $23			# hi=0xe0fae0cd,lo=0x00000000
    mthi  $25			# hi=0x5f123ab4,lo=0x00000000
    mthi  $1			# hi=0x63eab211,lo=0x00000000
    mthi  $17			# hi=0x114b6656,lo=0x00000000
    mthi  $4			# hi=0x7c8fef2c,lo=0x00000000
    mthi  $14			# hi=0x9755b7a1,lo=0x00000000
    mthi  $7			# hi=0xe7f21f29,lo=0x00000000
    mthi  $12			# hi=0xefe6ca0b,lo=0x00000000
    mthi  $10			# hi=0xfdbf2737,lo=0x00000000
    mthi  $5			# hi=0xc4ebbb79,lo=0x00000000
    mthi  $29			# hi=0x5494b4d9,lo=0x00000000
    mthi  $2			# hi=0x6ef67131,lo=0x00000000
    mthi  $5			# hi=0xc4ebbb79,lo=0x00000000
