    .org 0x0
    .global _start
    .set noat
    .set noreorder
    .set nomacro
_start:
    lui  $0, 0x7676			# $0=0x76760000
    ori  $0, $0, 0xbe73			# $0=0x0000be73
    lui  $1, 0x9cbd			# $1=0x9cbd0000
    ori  $1, $1, 0x1b54			# $1=0x9cbd1b54
    lui  $2, 0x3a95			# $2=0x3a950000
    ori  $2, $2, 0x321c			# $2=0x3a95321c
    lui  $3, 0x4e1b			# $3=0x4e1b0000
    ori  $3, $3, 0xad05			# $3=0x4e1bad05
    lui  $4, 0x6f9a			# $4=0x6f9a0000
    ori  $4, $4, 0x4179			# $4=0x6f9a4179
    lui  $5, 0x5b28			# $5=0x5b280000
    ori  $5, $5, 0xd79b			# $5=0x5b28d79b
    lui  $6, 0xebf6			# $6=0xebf60000
    ori  $6, $6, 0x6530			# $6=0xebf66530
    lui  $7, 0x0aaa			# $7=0x0aaa0000
    ori  $7, $7, 0x428e			# $7=0x0aaa428e
    lui  $8, 0xcedc			# $8=0xcedc0000
    ori  $8, $8, 0xe82e			# $8=0xcedce82e
    lui  $9, 0x66d6			# $9=0x66d60000
    ori  $9, $9, 0xc70e			# $9=0x66d6c70e
    lui  $10, 0x872a			# $10=0x872a0000
    ori  $10, $10, 0x4ae0			# $10=0x872a4ae0
    lui  $11, 0xa987			# $11=0xa9870000
    ori  $11, $11, 0x03d2			# $11=0xa98703d2
    lui  $12, 0x5606			# $12=0x56060000
    ori  $12, $12, 0x838a			# $12=0x5606838a
    lui  $13, 0xe5f3			# $13=0xe5f30000
    ori  $13, $13, 0xc479			# $13=0xe5f3c479
    lui  $14, 0xc2d9			# $14=0xc2d90000
    ori  $14, $14, 0xd3b4			# $14=0xc2d9d3b4
    lui  $15, 0x9fb7			# $15=0x9fb70000
    ori  $15, $15, 0x2576			# $15=0x9fb72576
    lui  $16, 0xe465			# $16=0xe4650000
    ori  $16, $16, 0xe2c1			# $16=0xe465e2c1
    lui  $17, 0x53f8			# $17=0x53f80000
    ori  $17, $17, 0xcd6c			# $17=0x53f8cd6c
    lui  $18, 0x5c94			# $18=0x5c940000
    ori  $18, $18, 0x8621			# $18=0x5c948621
    lui  $19, 0x2c5a			# $19=0x2c5a0000
    ori  $19, $19, 0xc705			# $19=0x2c5ac705
    lui  $20, 0x4e0b			# $20=0x4e0b0000
    ori  $20, $20, 0x4ab3			# $20=0x4e0b4ab3
    lui  $21, 0xc5eb			# $21=0xc5eb0000
    ori  $21, $21, 0x9d8e			# $21=0xc5eb9d8e
    lui  $22, 0x4dfd			# $22=0x4dfd0000
    ori  $22, $22, 0xe2b2			# $22=0x4dfde2b2
    lui  $23, 0x3252			# $23=0x32520000
    ori  $23, $23, 0x23a6			# $23=0x325223a6
    lui  $24, 0x37e1			# $24=0x37e10000
    ori  $24, $24, 0x6ca3			# $24=0x37e16ca3
    lui  $25, 0x752e			# $25=0x752e0000
    ori  $25, $25, 0xdc37			# $25=0x752edc37
    lui  $26, 0xd268			# $26=0xd2680000
    ori  $26, $26, 0x0b5e			# $26=0xd2680b5e
    lui  $27, 0x55b5			# $27=0x55b50000
    ori  $27, $27, 0x7328			# $27=0x55b57328
    lui  $28, 0x062f			# $28=0x062f0000
    ori  $28, $28, 0x0ff9			# $28=0x062f0ff9
    lui  $29, 0x4d7b			# $29=0x4d7b0000
    ori  $29, $29, 0x49f0			# $29=0x4d7b49f0
    lui  $30, 0x3e1f			# $30=0x3e1f0000
    ori  $30, $30, 0xfe12			# $30=0x3e1ffe12
    lui  $31, 0xbfc4			# $31=0xbfc40000
    ori  $31, $31, 0x64a4			# $31=0xbfc464a4
    mtlo  $9			# hi=0x00000000,lo=0x66d6c70e
    mtlo  $12			# hi=0x00000000,lo=0x5606838a
    mtlo  $9			# hi=0x00000000,lo=0x66d6c70e
    mtlo  $12			# hi=0x00000000,lo=0x5606838a
    mtlo  $8			# hi=0x00000000,lo=0xcedce82e
    mtlo  $7			# hi=0x00000000,lo=0x0aaa428e
    mtlo  $20			# hi=0x00000000,lo=0x4e0b4ab3
    mtlo  $29			# hi=0x00000000,lo=0x4d7b49f0
    mtlo  $4			# hi=0x00000000,lo=0x6f9a4179
    mtlo  $27			# hi=0x00000000,lo=0x55b57328
    mtlo  $1			# hi=0x00000000,lo=0x9cbd1b54
    mtlo  $9			# hi=0x00000000,lo=0x66d6c70e
    mtlo  $30			# hi=0x00000000,lo=0x3e1ffe12
    mtlo  $16			# hi=0x00000000,lo=0xe465e2c1
    mtlo  $2			# hi=0x00000000,lo=0x3a95321c
    mtlo  $4			# hi=0x00000000,lo=0x6f9a4179
    mtlo  $31			# hi=0x00000000,lo=0xbfc464a4
    mtlo  $23			# hi=0x00000000,lo=0x325223a6
    mtlo  $29			# hi=0x00000000,lo=0x4d7b49f0
    mtlo  $16			# hi=0x00000000,lo=0xe465e2c1
