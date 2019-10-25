    .org 0x0
    .global _start
    .set noat
    .set noreorder
    .set nomacro
_start:
    lui  $0, 0xe482			# $0=0xe4820000
    ori  $0, $0, 0xe491			# $0=0x0000e491
    lui  $1, 0x6737			# $1=0x67370000
    ori  $1, $1, 0xcd79			# $1=0x6737cd79
    lui  $2, 0x1fc0			# $2=0x1fc00000
    ori  $2, $2, 0x03ca			# $2=0x1fc003ca
    lui  $3, 0x9491			# $3=0x94910000
    ori  $3, $3, 0x33d4			# $3=0x949133d4
    lui  $4, 0xb857			# $4=0xb8570000
    ori  $4, $4, 0x5ff0			# $4=0xb8575ff0
    lui  $5, 0xa944			# $5=0xa9440000
    ori  $5, $5, 0xf6f2			# $5=0xa944f6f2
    lui  $6, 0x6002			# $6=0x60020000
    ori  $6, $6, 0x9f08			# $6=0x60029f08
    lui  $7, 0xc8fe			# $7=0xc8fe0000
    ori  $7, $7, 0x368f			# $7=0xc8fe368f
    lui  $8, 0xbc22			# $8=0xbc220000
    ori  $8, $8, 0x878a			# $8=0xbc22878a
    lui  $9, 0x4a43			# $9=0x4a430000
    ori  $9, $9, 0x36bd			# $9=0x4a4336bd
    lui  $10, 0x9496			# $10=0x94960000
    ori  $10, $10, 0x34a2			# $10=0x949634a2
    lui  $11, 0x253c			# $11=0x253c0000
    ori  $11, $11, 0x5481			# $11=0x253c5481
    lui  $12, 0x2c13			# $12=0x2c130000
    ori  $12, $12, 0xfe38			# $12=0x2c13fe38
    lui  $13, 0x7f2b			# $13=0x7f2b0000
    ori  $13, $13, 0x2547			# $13=0x7f2b2547
    lui  $14, 0x735c			# $14=0x735c0000
    ori  $14, $14, 0x162d			# $14=0x735c162d
    lui  $15, 0x0ac8			# $15=0x0ac80000
    ori  $15, $15, 0xee1a			# $15=0x0ac8ee1a
    lui  $16, 0xac42			# $16=0xac420000
    ori  $16, $16, 0xf438			# $16=0xac42f438
    lui  $17, 0x1417			# $17=0x14170000
    ori  $17, $17, 0x0132			# $17=0x14170132
    lui  $18, 0x4869			# $18=0x48690000
    ori  $18, $18, 0x2695			# $18=0x48692695
    lui  $19, 0xa34b			# $19=0xa34b0000
    ori  $19, $19, 0x6920			# $19=0xa34b6920
    lui  $20, 0xb14d			# $20=0xb14d0000
    ori  $20, $20, 0x769d			# $20=0xb14d769d
    lui  $21, 0xcc3a			# $21=0xcc3a0000
    ori  $21, $21, 0xd132			# $21=0xcc3ad132
    lui  $22, 0x0a05			# $22=0x0a050000
    ori  $22, $22, 0x7fcb			# $22=0x0a057fcb
    lui  $23, 0x6205			# $23=0x62050000
    ori  $23, $23, 0xce77			# $23=0x6205ce77
    lui  $24, 0x9fba			# $24=0x9fba0000
    ori  $24, $24, 0xaba1			# $24=0x9fbaaba1
    lui  $25, 0xf235			# $25=0xf2350000
    ori  $25, $25, 0x3ff4			# $25=0xf2353ff4
    lui  $26, 0xd251			# $26=0xd2510000
    ori  $26, $26, 0x24c7			# $26=0xd25124c7
    lui  $27, 0x46d7			# $27=0x46d70000
    ori  $27, $27, 0x63e3			# $27=0x46d763e3
    lui  $28, 0xf3e1			# $28=0xf3e10000
    ori  $28, $28, 0x3913			# $28=0xf3e13913
    lui  $29, 0x137a			# $29=0x137a0000
    ori  $29, $29, 0x060b			# $29=0x137a060b
    lui  $30, 0x574e			# $30=0x574e0000
    ori  $30, $30, 0x344f			# $30=0x574e344f
    lui  $31, 0x0e19			# $31=0x0e190000
    ori  $31, $31, 0xb83a			# $31=0x0e19b83a
    lui  $0, 0x614e			# $0=0x614e0000
    ori  $0, $0, 0x5245			# $0=0x00005245
    lui  $1, 0xa08c			# $1=0xa08c0000
    ori  $1, $1, 0x091c			# $1=0xa08c091c
    lui  $2, 0x869d			# $2=0x869d0000
    ori  $2, $2, 0x7086			# $2=0x869d7086
    lui  $3, 0x61da			# $3=0x61da0000
    ori  $3, $3, 0x9789			# $3=0x61da9789
    lui  $4, 0x5e19			# $4=0x5e190000
    ori  $4, $4, 0x6b13			# $4=0x5e196b13
    lui  $5, 0x0d41			# $5=0x0d410000
    ori  $5, $5, 0x80ff			# $5=0x0d4180ff
    lui  $6, 0xcb9e			# $6=0xcb9e0000
    ori  $6, $6, 0xd06d			# $6=0xcb9ed06d
    lui  $7, 0x423d			# $7=0x423d0000
    ori  $7, $7, 0x8363			# $7=0x423d8363
    lui  $8, 0xc990			# $8=0xc9900000
    ori  $8, $8, 0x5fde			# $8=0xc9905fde
    lui  $9, 0xdc27			# $9=0xdc270000
    ori  $9, $9, 0xbdf8			# $9=0xdc27bdf8
    lui  $10, 0xd255			# $10=0xd2550000
    ori  $10, $10, 0x4883			# $10=0xd2554883
    lui  $11, 0x4420			# $11=0x44200000
    ori  $11, $11, 0x552d			# $11=0x4420552d
    lui  $12, 0xa09e			# $12=0xa09e0000
    ori  $12, $12, 0xfe8c			# $12=0xa09efe8c
    lui  $13, 0x1015			# $13=0x10150000
    ori  $13, $13, 0x4d07			# $13=0x10154d07
    lui  $14, 0x360d			# $14=0x360d0000
    ori  $14, $14, 0x012f			# $14=0x360d012f
    lui  $15, 0xf049			# $15=0xf0490000
    ori  $15, $15, 0xded1			# $15=0xf049ded1
    lui  $16, 0x1bfb			# $16=0x1bfb0000
    ori  $16, $16, 0x4884			# $16=0x1bfb4884
    lui  $17, 0x1570			# $17=0x15700000
    ori  $17, $17, 0x785e			# $17=0x1570785e
    lui  $18, 0x00de			# $18=0x00de0000
    ori  $18, $18, 0x308d			# $18=0x00de308d
    lui  $19, 0x3ac6			# $19=0x3ac60000
    ori  $19, $19, 0xe3e5			# $19=0x3ac6e3e5
    lui  $20, 0x3f6b			# $20=0x3f6b0000
    ori  $20, $20, 0xe7f4			# $20=0x3f6be7f4
    lui  $21, 0x9c32			# $21=0x9c320000
    ori  $21, $21, 0xa623			# $21=0x9c32a623
    lui  $22, 0x2215			# $22=0x22150000
    ori  $22, $22, 0xb8b8			# $22=0x2215b8b8
    lui  $23, 0xec40			# $23=0xec400000
    ori  $23, $23, 0x9cf1			# $23=0xec409cf1
    lui  $24, 0x1331			# $24=0x13310000
    ori  $24, $24, 0x53df			# $24=0x133153df
    lui  $25, 0x2ca1			# $25=0x2ca10000
    ori  $25, $25, 0x8ec3			# $25=0x2ca18ec3
    lui  $26, 0x0dbc			# $26=0x0dbc0000
    ori  $26, $26, 0xb4ba			# $26=0x0dbcb4ba
    lui  $27, 0xa007			# $27=0xa0070000
    ori  $27, $27, 0xaf2f			# $27=0xa007af2f
    lui  $28, 0x3eed			# $28=0x3eed0000
    ori  $28, $28, 0xd044			# $28=0x3eedd044
    lui  $29, 0xf033			# $29=0xf0330000
    ori  $29, $29, 0xb9cd			# $29=0xf033b9cd
    lui  $30, 0x165a			# $30=0x165a0000
    ori  $30, $30, 0x4484			# $30=0x165a4484
    lui  $31, 0x09d1			# $31=0x09d10000
    ori  $31, $31, 0xc76d			# $31=0x09d1c76d
    lui  $0, 0xbefd			# $0=0xbefd0000
    ori  $0, $0, 0xebb9			# $0=0x0000ebb9
    lui  $1, 0xcbde			# $1=0xcbde0000
    ori  $1, $1, 0x990c			# $1=0xcbde990c
    lui  $2, 0x9d06			# $2=0x9d060000
    ori  $2, $2, 0xc9c6			# $2=0x9d06c9c6
    lui  $3, 0x1d3a			# $3=0x1d3a0000
    ori  $3, $3, 0x94eb			# $3=0x1d3a94eb
    lui  $4, 0xa3ce			# $4=0xa3ce0000
    ori  $4, $4, 0x1e67			# $4=0xa3ce1e67
    lui  $5, 0x62ad			# $5=0x62ad0000
    ori  $5, $5, 0xc970			# $5=0x62adc970
    lui  $6, 0xa21e			# $6=0xa21e0000
    ori  $6, $6, 0xbce1			# $6=0xa21ebce1
    lui  $7, 0x819a			# $7=0x819a0000
    ori  $7, $7, 0xb536			# $7=0x819ab536
    lui  $8, 0xb66b			# $8=0xb66b0000
    ori  $8, $8, 0x35c5			# $8=0xb66b35c5
    lui  $9, 0x1b4f			# $9=0x1b4f0000
    ori  $9, $9, 0x5ad4			# $9=0x1b4f5ad4
    lui  $10, 0x2615			# $10=0x26150000
    ori  $10, $10, 0x36d2			# $10=0x261536d2
    lui  $11, 0x1784			# $11=0x17840000
    ori  $11, $11, 0x0dd6			# $11=0x17840dd6
    lui  $12, 0xe1f6			# $12=0xe1f60000
    ori  $12, $12, 0x0692			# $12=0xe1f60692
    lui  $13, 0x6d9d			# $13=0x6d9d0000
    ori  $13, $13, 0x0f86			# $13=0x6d9d0f86
    lui  $14, 0x5631			# $14=0x56310000
    ori  $14, $14, 0x7842			# $14=0x56317842
    lui  $15, 0x92e8			# $15=0x92e80000
    ori  $15, $15, 0x6ffc			# $15=0x92e86ffc
    lui  $16, 0x15f5			# $16=0x15f50000
    ori  $16, $16, 0xa7df			# $16=0x15f5a7df
    lui  $17, 0x258b			# $17=0x258b0000
    ori  $17, $17, 0x3b48			# $17=0x258b3b48
    lui  $18, 0xc34f			# $18=0xc34f0000
    ori  $18, $18, 0xc8fc			# $18=0xc34fc8fc
    lui  $19, 0xbb03			# $19=0xbb030000
    ori  $19, $19, 0xa2e4			# $19=0xbb03a2e4
    lui  $20, 0x58fa			# $20=0x58fa0000
    ori  $20, $20, 0xb0fd			# $20=0x58fab0fd
    lui  $21, 0xcb4a			# $21=0xcb4a0000
    ori  $21, $21, 0x9bf4			# $21=0xcb4a9bf4
    lui  $22, 0x1cd4			# $22=0x1cd40000
    ori  $22, $22, 0x4aa7			# $22=0x1cd44aa7
    lui  $23, 0xcc66			# $23=0xcc660000
    ori  $23, $23, 0xf7a0			# $23=0xcc66f7a0
    lui  $24, 0xf506			# $24=0xf5060000
    ori  $24, $24, 0x47eb			# $24=0xf50647eb
    lui  $25, 0x483c			# $25=0x483c0000
    ori  $25, $25, 0x31ba			# $25=0x483c31ba
    lui  $26, 0xcf59			# $26=0xcf590000
    ori  $26, $26, 0xa2eb			# $26=0xcf59a2eb
    lui  $27, 0x8fb8			# $27=0x8fb80000
    ori  $27, $27, 0x59a2			# $27=0x8fb859a2
    lui  $28, 0xd734			# $28=0xd7340000
    ori  $28, $28, 0x0c99			# $28=0xd7340c99
    lui  $29, 0x18a4			# $29=0x18a40000
    ori  $29, $29, 0x4a97			# $29=0x18a44a97
    lui  $30, 0x7187			# $30=0x71870000
    ori  $30, $30, 0xaaa1			# $30=0x7187aaa1
    lui  $31, 0x5f1e			# $31=0x5f1e0000
    ori  $31, $31, 0xae14			# $31=0x5f1eae14
    mthi  $8			# hi=0xb66b35c5,lo=0x00000000
    mthi  $20			# hi=0x58fab0fd,lo=0x00000000
    mthi  $4			# hi=0xa3ce1e67,lo=0x00000000
    mthi  $31			# hi=0x5f1eae14,lo=0x00000000
    mthi  $22			# hi=0x1cd44aa7,lo=0x00000000
    mthi  $27			# hi=0x8fb859a2,lo=0x00000000
    mthi  $0			# hi=0x00000000,lo=0x00000000
    mthi  $15			# hi=0x92e86ffc,lo=0x00000000
    mthi  $14			# hi=0x56317842,lo=0x00000000
    mthi  $4			# hi=0xa3ce1e67,lo=0x00000000
    mthi  $24			# hi=0xf50647eb,lo=0x00000000
    mthi  $12			# hi=0xe1f60692,lo=0x00000000
    mthi  $1			# hi=0xcbde990c,lo=0x00000000
    mthi  $28			# hi=0xd7340c99,lo=0x00000000
    mthi  $3			# hi=0x1d3a94eb,lo=0x00000000
    mthi  $11			# hi=0x17840dd6,lo=0x00000000
    mthi  $24			# hi=0xf50647eb,lo=0x00000000
    mthi  $6			# hi=0xa21ebce1,lo=0x00000000
    mthi  $20			# hi=0x58fab0fd,lo=0x00000000
    mthi  $31			# hi=0x5f1eae14,lo=0x00000000
    mthi  $21			# hi=0xcb4a9bf4,lo=0x00000000
    mthi  $1			# hi=0xcbde990c,lo=0x00000000
    mthi  $3			# hi=0x1d3a94eb,lo=0x00000000
    mthi  $13			# hi=0x6d9d0f86,lo=0x00000000
    mthi  $21			# hi=0xcb4a9bf4,lo=0x00000000
    mthi  $13			# hi=0x6d9d0f86,lo=0x00000000
    mthi  $15			# hi=0x92e86ffc,lo=0x00000000
    mthi  $11			# hi=0x17840dd6,lo=0x00000000
    mthi  $3			# hi=0x1d3a94eb,lo=0x00000000
    mthi  $26			# hi=0xcf59a2eb,lo=0x00000000
    mthi  $19			# hi=0xbb03a2e4,lo=0x00000000
    mthi  $8			# hi=0xb66b35c5,lo=0x00000000
    mthi  $25			# hi=0x483c31ba,lo=0x00000000
    mthi  $18			# hi=0xc34fc8fc,lo=0x00000000
    mthi  $5			# hi=0x62adc970,lo=0x00000000
    mthi  $10			# hi=0x261536d2,lo=0x00000000
    mthi  $18			# hi=0xc34fc8fc,lo=0x00000000
    mthi  $5			# hi=0x62adc970,lo=0x00000000
    mthi  $7			# hi=0x819ab536,lo=0x00000000
    mthi  $2			# hi=0x9d06c9c6,lo=0x00000000
    mthi  $16			# hi=0x15f5a7df,lo=0x00000000
    mthi  $9			# hi=0x1b4f5ad4,lo=0x00000000
    mthi  $19			# hi=0xbb03a2e4,lo=0x00000000
    mthi  $15			# hi=0x92e86ffc,lo=0x00000000
    mthi  $4			# hi=0xa3ce1e67,lo=0x00000000
    mthi  $19			# hi=0xbb03a2e4,lo=0x00000000
    mthi  $3			# hi=0x1d3a94eb,lo=0x00000000
    mthi  $22			# hi=0x1cd44aa7,lo=0x00000000
    mthi  $23			# hi=0xcc66f7a0,lo=0x00000000
    mthi  $0			# hi=0x00000000,lo=0x00000000
    mthi  $28			# hi=0xd7340c99,lo=0x00000000
    mthi  $26			# hi=0xcf59a2eb,lo=0x00000000
    mthi  $6			# hi=0xa21ebce1,lo=0x00000000
    mthi  $27			# hi=0x8fb859a2,lo=0x00000000
    mthi  $12			# hi=0xe1f60692,lo=0x00000000
    mthi  $12			# hi=0xe1f60692,lo=0x00000000
    mthi  $6			# hi=0xa21ebce1,lo=0x00000000
    mthi  $18			# hi=0xc34fc8fc,lo=0x00000000
    mthi  $23			# hi=0xcc66f7a0,lo=0x00000000
    mthi  $13			# hi=0x6d9d0f86,lo=0x00000000
    mthi  $23			# hi=0xcc66f7a0,lo=0x00000000
    mthi  $21			# hi=0xcb4a9bf4,lo=0x00000000
    mthi  $31			# hi=0x5f1eae14,lo=0x00000000
    mthi  $16			# hi=0x15f5a7df,lo=0x00000000
    mthi  $8			# hi=0xb66b35c5,lo=0x00000000
    mthi  $30			# hi=0x7187aaa1,lo=0x00000000
    mthi  $13			# hi=0x6d9d0f86,lo=0x00000000
    mthi  $24			# hi=0xf50647eb,lo=0x00000000
    mthi  $1			# hi=0xcbde990c,lo=0x00000000
    mthi  $13			# hi=0x6d9d0f86,lo=0x00000000
    mthi  $3			# hi=0x1d3a94eb,lo=0x00000000
    mthi  $0			# hi=0x00000000,lo=0x00000000
    mthi  $11			# hi=0x17840dd6,lo=0x00000000
    mthi  $8			# hi=0xb66b35c5,lo=0x00000000
    mthi  $21			# hi=0xcb4a9bf4,lo=0x00000000
    mthi  $11			# hi=0x17840dd6,lo=0x00000000
    mthi  $0			# hi=0x00000000,lo=0x00000000
    mthi  $23			# hi=0xcc66f7a0,lo=0x00000000
    mthi  $4			# hi=0xa3ce1e67,lo=0x00000000
    mthi  $21			# hi=0xcb4a9bf4,lo=0x00000000
    mthi  $5			# hi=0x62adc970,lo=0x00000000
    mthi  $21			# hi=0xcb4a9bf4,lo=0x00000000
    mthi  $25			# hi=0x483c31ba,lo=0x00000000
    mthi  $9			# hi=0x1b4f5ad4,lo=0x00000000
    mthi  $5			# hi=0x62adc970,lo=0x00000000
    mthi  $11			# hi=0x17840dd6,lo=0x00000000
    mthi  $2			# hi=0x9d06c9c6,lo=0x00000000
    mthi  $5			# hi=0x62adc970,lo=0x00000000
    mthi  $16			# hi=0x15f5a7df,lo=0x00000000
    mthi  $22			# hi=0x1cd44aa7,lo=0x00000000
    mthi  $31			# hi=0x5f1eae14,lo=0x00000000
    mthi  $12			# hi=0xe1f60692,lo=0x00000000
    mthi  $15			# hi=0x92e86ffc,lo=0x00000000
    mthi  $3			# hi=0x1d3a94eb,lo=0x00000000
    mthi  $0			# hi=0x00000000,lo=0x00000000
    mthi  $23			# hi=0xcc66f7a0,lo=0x00000000
    mthi  $28			# hi=0xd7340c99,lo=0x00000000
    mthi  $9			# hi=0x1b4f5ad4,lo=0x00000000
    mthi  $13			# hi=0x6d9d0f86,lo=0x00000000
    mthi  $1			# hi=0xcbde990c,lo=0x00000000
