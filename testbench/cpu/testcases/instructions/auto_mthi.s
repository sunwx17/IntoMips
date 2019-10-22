    .org 0x0
    .global _start
    .set noat
    .set noreorder
    .set nomacro
_start:
    lui  $0, 0x73f8			# $0=0x73f80000
    ori  $0, $0, 0x1581			# $0=0x00001581
    lui  $1, 0x9929			# $1=0x99290000
    ori  $1, $1, 0x7df6			# $1=0x99297df6
    lui  $2, 0xded7			# $2=0xded70000
    ori  $2, $2, 0xb472			# $2=0xded7b472
    lui  $3, 0x0dcd			# $3=0x0dcd0000
    ori  $3, $3, 0x7410			# $3=0x0dcd7410
    lui  $4, 0x6f08			# $4=0x6f080000
    ori  $4, $4, 0x58ec			# $4=0x6f0858ec
    lui  $5, 0xfdcc			# $5=0xfdcc0000
    ori  $5, $5, 0x0837			# $5=0xfdcc0837
    lui  $6, 0xee90			# $6=0xee900000
    ori  $6, $6, 0x9aab			# $6=0xee909aab
    lui  $7, 0x690d			# $7=0x690d0000
    ori  $7, $7, 0xacea			# $7=0x690dacea
    lui  $8, 0x3181			# $8=0x31810000
    ori  $8, $8, 0x64eb			# $8=0x318164eb
    lui  $9, 0x4e80			# $9=0x4e800000
    ori  $9, $9, 0x934d			# $9=0x4e80934d
    lui  $10, 0x97b9			# $10=0x97b90000
    ori  $10, $10, 0x3b38			# $10=0x97b93b38
    lui  $11, 0xc45f			# $11=0xc45f0000
    ori  $11, $11, 0x1eb2			# $11=0xc45f1eb2
    lui  $12, 0x83ab			# $12=0x83ab0000
    ori  $12, $12, 0xb6c1			# $12=0x83abb6c1
    lui  $13, 0x798c			# $13=0x798c0000
    ori  $13, $13, 0x2b26			# $13=0x798c2b26
    lui  $14, 0x2b47			# $14=0x2b470000
    ori  $14, $14, 0xb679			# $14=0x2b47b679
    lui  $15, 0x26c2			# $15=0x26c20000
    ori  $15, $15, 0x6754			# $15=0x26c26754
    lui  $16, 0x048e			# $16=0x048e0000
    ori  $16, $16, 0xc612			# $16=0x048ec612
    lui  $17, 0x1138			# $17=0x11380000
    ori  $17, $17, 0xe7d0			# $17=0x1138e7d0
    lui  $18, 0xb6b0			# $18=0xb6b00000
    ori  $18, $18, 0x5fe7			# $18=0xb6b05fe7
    lui  $19, 0xb78f			# $19=0xb78f0000
    ori  $19, $19, 0xb7c4			# $19=0xb78fb7c4
    lui  $20, 0xa63a			# $20=0xa63a0000
    ori  $20, $20, 0x9591			# $20=0xa63a9591
    lui  $21, 0x34d6			# $21=0x34d60000
    ori  $21, $21, 0x372d			# $21=0x34d6372d
    lui  $22, 0x734f			# $22=0x734f0000
    ori  $22, $22, 0x64db			# $22=0x734f64db
    lui  $23, 0x74c4			# $23=0x74c40000
    ori  $23, $23, 0x4ceb			# $23=0x74c44ceb
    lui  $24, 0x7935			# $24=0x79350000
    ori  $24, $24, 0x381e			# $24=0x7935381e
    lui  $25, 0xe5d8			# $25=0xe5d80000
    ori  $25, $25, 0xca89			# $25=0xe5d8ca89
    lui  $26, 0x529e			# $26=0x529e0000
    ori  $26, $26, 0x404d			# $26=0x529e404d
    lui  $27, 0xc020			# $27=0xc0200000
    ori  $27, $27, 0x6b0a			# $27=0xc0206b0a
    lui  $28, 0xc5f2			# $28=0xc5f20000
    ori  $28, $28, 0x8cbc			# $28=0xc5f28cbc
    lui  $29, 0xbea5			# $29=0xbea50000
    ori  $29, $29, 0x966f			# $29=0xbea5966f
    lui  $30, 0xa10a			# $30=0xa10a0000
    ori  $30, $30, 0xae0b			# $30=0xa10aae0b
    lui  $31, 0x2d01			# $31=0x2d010000
    ori  $31, $31, 0xe4be			# $31=0x2d01e4be
    lui  $0, 0xdfcf			# $0=0xdfcf0000
    ori  $0, $0, 0x1428			# $0=0x00001428
    lui  $1, 0x4504			# $1=0x45040000
    ori  $1, $1, 0x1099			# $1=0x45041099
    lui  $2, 0x1221			# $2=0x12210000
    ori  $2, $2, 0xac97			# $2=0x1221ac97
    lui  $3, 0x6738			# $3=0x67380000
    ori  $3, $3, 0x0d5e			# $3=0x67380d5e
    lui  $4, 0xce0e			# $4=0xce0e0000
    ori  $4, $4, 0xd998			# $4=0xce0ed998
    lui  $5, 0xb287			# $5=0xb2870000
    ori  $5, $5, 0x73cf			# $5=0xb28773cf
    lui  $6, 0x24cb			# $6=0x24cb0000
    ori  $6, $6, 0x4bf0			# $6=0x24cb4bf0
    lui  $7, 0x6a90			# $7=0x6a900000
    ori  $7, $7, 0xa563			# $7=0x6a90a563
    lui  $8, 0x06e3			# $8=0x06e30000
    ori  $8, $8, 0x0f0e			# $8=0x06e30f0e
    lui  $9, 0xe17b			# $9=0xe17b0000
    ori  $9, $9, 0xf378			# $9=0xe17bf378
    lui  $10, 0x63fa			# $10=0x63fa0000
    ori  $10, $10, 0x4dda			# $10=0x63fa4dda
    lui  $11, 0x1b99			# $11=0x1b990000
    ori  $11, $11, 0xb4fc			# $11=0x1b99b4fc
    lui  $12, 0x26b7			# $12=0x26b70000
    ori  $12, $12, 0xc6ba			# $12=0x26b7c6ba
    lui  $13, 0xb516			# $13=0xb5160000
    ori  $13, $13, 0xe24b			# $13=0xb516e24b
    lui  $14, 0xaa3c			# $14=0xaa3c0000
    ori  $14, $14, 0x7054			# $14=0xaa3c7054
    lui  $15, 0x1969			# $15=0x19690000
    ori  $15, $15, 0xba47			# $15=0x1969ba47
    lui  $16, 0x971e			# $16=0x971e0000
    ori  $16, $16, 0xf1e1			# $16=0x971ef1e1
    lui  $17, 0x7d59			# $17=0x7d590000
    ori  $17, $17, 0xc92e			# $17=0x7d59c92e
    lui  $18, 0x7b87			# $18=0x7b870000
    ori  $18, $18, 0x9ee5			# $18=0x7b879ee5
    lui  $19, 0x7b11			# $19=0x7b110000
    ori  $19, $19, 0x1bc3			# $19=0x7b111bc3
    lui  $20, 0x710b			# $20=0x710b0000
    ori  $20, $20, 0x7bd8			# $20=0x710b7bd8
    lui  $21, 0xcfad			# $21=0xcfad0000
    ori  $21, $21, 0x2676			# $21=0xcfad2676
    lui  $22, 0xfba5			# $22=0xfba50000
    ori  $22, $22, 0x96d4			# $22=0xfba596d4
    lui  $23, 0xbda1			# $23=0xbda10000
    ori  $23, $23, 0x7731			# $23=0xbda17731
    lui  $24, 0x673d			# $24=0x673d0000
    ori  $24, $24, 0x8e31			# $24=0x673d8e31
    lui  $25, 0x71ad			# $25=0x71ad0000
    ori  $25, $25, 0x61bf			# $25=0x71ad61bf
    lui  $26, 0x17d5			# $26=0x17d50000
    ori  $26, $26, 0xa7fc			# $26=0x17d5a7fc
    lui  $27, 0x7f30			# $27=0x7f300000
    ori  $27, $27, 0x9cf4			# $27=0x7f309cf4
    lui  $28, 0x4d09			# $28=0x4d090000
    ori  $28, $28, 0xb9e2			# $28=0x4d09b9e2
    lui  $29, 0x66b1			# $29=0x66b10000
    ori  $29, $29, 0x00e5			# $29=0x66b100e5
    lui  $30, 0x4bcb			# $30=0x4bcb0000
    ori  $30, $30, 0x9867			# $30=0x4bcb9867
    lui  $31, 0x9531			# $31=0x95310000
    ori  $31, $31, 0xe05b			# $31=0x9531e05b
    lui  $0, 0x7e7a			# $0=0x7e7a0000
    ori  $0, $0, 0xa500			# $0=0x0000a500
    lui  $1, 0x4259			# $1=0x42590000
    ori  $1, $1, 0x5615			# $1=0x42595615
    lui  $2, 0x2808			# $2=0x28080000
    ori  $2, $2, 0x5771			# $2=0x28085771
    lui  $3, 0x5974			# $3=0x59740000
    ori  $3, $3, 0x5d87			# $3=0x59745d87
    lui  $4, 0x24c0			# $4=0x24c00000
    ori  $4, $4, 0xfcd6			# $4=0x24c0fcd6
    lui  $5, 0x0200			# $5=0x02000000
    ori  $5, $5, 0x63e9			# $5=0x020063e9
    lui  $6, 0x8fce			# $6=0x8fce0000
    ori  $6, $6, 0x35af			# $6=0x8fce35af
    lui  $7, 0x828f			# $7=0x828f0000
    ori  $7, $7, 0x53c7			# $7=0x828f53c7
    lui  $8, 0x1b09			# $8=0x1b090000
    ori  $8, $8, 0x9965			# $8=0x1b099965
    lui  $9, 0x8b1e			# $9=0x8b1e0000
    ori  $9, $9, 0x9168			# $9=0x8b1e9168
    lui  $10, 0x77f9			# $10=0x77f90000
    ori  $10, $10, 0x597a			# $10=0x77f9597a
    lui  $11, 0x4677			# $11=0x46770000
    ori  $11, $11, 0xb2da			# $11=0x4677b2da
    lui  $12, 0x47da			# $12=0x47da0000
    ori  $12, $12, 0xf715			# $12=0x47daf715
    lui  $13, 0x8636			# $13=0x86360000
    ori  $13, $13, 0xf6e3			# $13=0x8636f6e3
    lui  $14, 0xbd52			# $14=0xbd520000
    ori  $14, $14, 0xc047			# $14=0xbd52c047
    lui  $15, 0xb408			# $15=0xb4080000
    ori  $15, $15, 0xeef6			# $15=0xb408eef6
    lui  $16, 0x0d23			# $16=0x0d230000
    ori  $16, $16, 0x0849			# $16=0x0d230849
    lui  $17, 0x800d			# $17=0x800d0000
    ori  $17, $17, 0xddf1			# $17=0x800dddf1
    lui  $18, 0x6b57			# $18=0x6b570000
    ori  $18, $18, 0xd148			# $18=0x6b57d148
    lui  $19, 0x42b6			# $19=0x42b60000
    ori  $19, $19, 0xbb2b			# $19=0x42b6bb2b
    lui  $20, 0x3d50			# $20=0x3d500000
    ori  $20, $20, 0xc6c8			# $20=0x3d50c6c8
    lui  $21, 0x2b69			# $21=0x2b690000
    ori  $21, $21, 0x489a			# $21=0x2b69489a
    lui  $22, 0x2568			# $22=0x25680000
    ori  $22, $22, 0x9b03			# $22=0x25689b03
    lui  $23, 0x2103			# $23=0x21030000
    ori  $23, $23, 0xc3a2			# $23=0x2103c3a2
    lui  $24, 0x70ff			# $24=0x70ff0000
    ori  $24, $24, 0x0ab8			# $24=0x70ff0ab8
    lui  $25, 0x1863			# $25=0x18630000
    ori  $25, $25, 0x270b			# $25=0x1863270b
    lui  $26, 0xf04d			# $26=0xf04d0000
    ori  $26, $26, 0x6c32			# $26=0xf04d6c32
    lui  $27, 0xa467			# $27=0xa4670000
    ori  $27, $27, 0x4485			# $27=0xa4674485
    lui  $28, 0x1be5			# $28=0x1be50000
    ori  $28, $28, 0x73ac			# $28=0x1be573ac
    lui  $29, 0x5dbb			# $29=0x5dbb0000
    ori  $29, $29, 0x81dc			# $29=0x5dbb81dc
    lui  $30, 0x8359			# $30=0x83590000
    ori  $30, $30, 0x53bd			# $30=0x835953bd
    lui  $31, 0x6d32			# $31=0x6d320000
    ori  $31, $31, 0xab63			# $31=0x6d32ab63
    mthi  $5			# hi=0x020063e9,lo=0x00000000
    mthi  $23			# hi=0x2103c3a2,lo=0x00000000
    mthi  $8			# hi=0x1b099965,lo=0x00000000
    mthi  $28			# hi=0x1be573ac,lo=0x00000000
    mthi  $17			# hi=0x800dddf1,lo=0x00000000
    mthi  $25			# hi=0x1863270b,lo=0x00000000
    mthi  $18			# hi=0x6b57d148,lo=0x00000000
    mthi  $8			# hi=0x1b099965,lo=0x00000000
    mthi  $10			# hi=0x77f9597a,lo=0x00000000
    mthi  $23			# hi=0x2103c3a2,lo=0x00000000
    mthi  $24			# hi=0x70ff0ab8,lo=0x00000000
    mthi  $4			# hi=0x24c0fcd6,lo=0x00000000
    mthi  $20			# hi=0x3d50c6c8,lo=0x00000000
    mthi  $20			# hi=0x3d50c6c8,lo=0x00000000
    mthi  $21			# hi=0x2b69489a,lo=0x00000000
    mthi  $18			# hi=0x6b57d148,lo=0x00000000
    mthi  $19			# hi=0x42b6bb2b,lo=0x00000000
    mthi  $11			# hi=0x4677b2da,lo=0x00000000
    mthi  $11			# hi=0x4677b2da,lo=0x00000000
    mthi  $10			# hi=0x77f9597a,lo=0x00000000
    mthi  $25			# hi=0x1863270b,lo=0x00000000
    mthi  $17			# hi=0x800dddf1,lo=0x00000000
    mthi  $19			# hi=0x42b6bb2b,lo=0x00000000
    mthi  $10			# hi=0x77f9597a,lo=0x00000000
    mthi  $8			# hi=0x1b099965,lo=0x00000000
    mthi  $29			# hi=0x5dbb81dc,lo=0x00000000
    mthi  $17			# hi=0x800dddf1,lo=0x00000000
    mthi  $18			# hi=0x6b57d148,lo=0x00000000
    mthi  $9			# hi=0x8b1e9168,lo=0x00000000
    mthi  $4			# hi=0x24c0fcd6,lo=0x00000000
    mthi  $22			# hi=0x25689b03,lo=0x00000000
    mthi  $10			# hi=0x77f9597a,lo=0x00000000
    mthi  $0			# hi=0x00000000,lo=0x00000000
    mthi  $10			# hi=0x77f9597a,lo=0x00000000
    mthi  $25			# hi=0x1863270b,lo=0x00000000
    mthi  $26			# hi=0xf04d6c32,lo=0x00000000
    mthi  $14			# hi=0xbd52c047,lo=0x00000000
    mthi  $26			# hi=0xf04d6c32,lo=0x00000000
    mthi  $19			# hi=0x42b6bb2b,lo=0x00000000
    mthi  $0			# hi=0x00000000,lo=0x00000000
    mthi  $21			# hi=0x2b69489a,lo=0x00000000
    mthi  $30			# hi=0x835953bd,lo=0x00000000
    mthi  $13			# hi=0x8636f6e3,lo=0x00000000
    mthi  $3			# hi=0x59745d87,lo=0x00000000
    mthi  $24			# hi=0x70ff0ab8,lo=0x00000000
    mthi  $8			# hi=0x1b099965,lo=0x00000000
    mthi  $29			# hi=0x5dbb81dc,lo=0x00000000
    mthi  $3			# hi=0x59745d87,lo=0x00000000
    mthi  $10			# hi=0x77f9597a,lo=0x00000000
    mthi  $2			# hi=0x28085771,lo=0x00000000
    mthi  $4			# hi=0x24c0fcd6,lo=0x00000000
    mthi  $2			# hi=0x28085771,lo=0x00000000
    mthi  $29			# hi=0x5dbb81dc,lo=0x00000000
    mthi  $8			# hi=0x1b099965,lo=0x00000000
    mthi  $6			# hi=0x8fce35af,lo=0x00000000
    mthi  $19			# hi=0x42b6bb2b,lo=0x00000000
    mthi  $6			# hi=0x8fce35af,lo=0x00000000
    mthi  $5			# hi=0x020063e9,lo=0x00000000
    mthi  $28			# hi=0x1be573ac,lo=0x00000000
    mthi  $20			# hi=0x3d50c6c8,lo=0x00000000
    mthi  $23			# hi=0x2103c3a2,lo=0x00000000
    mthi  $28			# hi=0x1be573ac,lo=0x00000000
    mthi  $4			# hi=0x24c0fcd6,lo=0x00000000
    mthi  $21			# hi=0x2b69489a,lo=0x00000000
    mthi  $15			# hi=0xb408eef6,lo=0x00000000
    mthi  $8			# hi=0x1b099965,lo=0x00000000
    mthi  $7			# hi=0x828f53c7,lo=0x00000000
    mthi  $3			# hi=0x59745d87,lo=0x00000000
    mthi  $26			# hi=0xf04d6c32,lo=0x00000000
    mthi  $19			# hi=0x42b6bb2b,lo=0x00000000
    mthi  $11			# hi=0x4677b2da,lo=0x00000000
    mthi  $28			# hi=0x1be573ac,lo=0x00000000
    mthi  $18			# hi=0x6b57d148,lo=0x00000000
    mthi  $28			# hi=0x1be573ac,lo=0x00000000
    mthi  $6			# hi=0x8fce35af,lo=0x00000000
    mthi  $6			# hi=0x8fce35af,lo=0x00000000
    mthi  $6			# hi=0x8fce35af,lo=0x00000000
    mthi  $22			# hi=0x25689b03,lo=0x00000000
    mthi  $13			# hi=0x8636f6e3,lo=0x00000000
    mthi  $15			# hi=0xb408eef6,lo=0x00000000
    mthi  $5			# hi=0x020063e9,lo=0x00000000
    mthi  $19			# hi=0x42b6bb2b,lo=0x00000000
    mthi  $27			# hi=0xa4674485,lo=0x00000000
    mthi  $9			# hi=0x8b1e9168,lo=0x00000000
    mthi  $18			# hi=0x6b57d148,lo=0x00000000
    mthi  $30			# hi=0x835953bd,lo=0x00000000
    mthi  $15			# hi=0xb408eef6,lo=0x00000000
    mthi  $6			# hi=0x8fce35af,lo=0x00000000
    mthi  $8			# hi=0x1b099965,lo=0x00000000
    mthi  $17			# hi=0x800dddf1,lo=0x00000000
    mthi  $22			# hi=0x25689b03,lo=0x00000000
    mthi  $4			# hi=0x24c0fcd6,lo=0x00000000
    mthi  $28			# hi=0x1be573ac,lo=0x00000000
    mthi  $23			# hi=0x2103c3a2,lo=0x00000000
    mthi  $21			# hi=0x2b69489a,lo=0x00000000
    mthi  $15			# hi=0xb408eef6,lo=0x00000000
    mthi  $28			# hi=0x1be573ac,lo=0x00000000
    mthi  $15			# hi=0xb408eef6,lo=0x00000000
    mthi  $19			# hi=0x42b6bb2b,lo=0x00000000
    mthi  $24			# hi=0x70ff0ab8,lo=0x00000000
