    .org 0x0
    .global _start
    .set noat
    .set noreorder
    .set nomacro
_start:
    lui  $0, 0xfa1b			# $0=0xfa1b0000
    ori  $0, $0, 0xe7fd			# $0=0x0000e7fd
    lui  $1, 0x9d1d			# $1=0x9d1d0000
    ori  $1, $1, 0xd7e9			# $1=0x9d1dd7e9
    lui  $2, 0xae64			# $2=0xae640000
    ori  $2, $2, 0x74f8			# $2=0xae6474f8
    lui  $3, 0xe74f			# $3=0xe74f0000
    ori  $3, $3, 0xa5fe			# $3=0xe74fa5fe
    lui  $4, 0x990c			# $4=0x990c0000
    ori  $4, $4, 0x6abf			# $4=0x990c6abf
    lui  $5, 0x2488			# $5=0x24880000
    ori  $5, $5, 0x1121			# $5=0x24881121
    lui  $6, 0x75ab			# $6=0x75ab0000
    ori  $6, $6, 0x4632			# $6=0x75ab4632
    lui  $7, 0xeec8			# $7=0xeec80000
    ori  $7, $7, 0x183b			# $7=0xeec8183b
    lui  $8, 0xb2ed			# $8=0xb2ed0000
    ori  $8, $8, 0xf20a			# $8=0xb2edf20a
    lui  $9, 0xe7ad			# $9=0xe7ad0000
    ori  $9, $9, 0xe3af			# $9=0xe7ade3af
    lui  $10, 0xada4			# $10=0xada40000
    ori  $10, $10, 0xed85			# $10=0xada4ed85
    lui  $11, 0x666c			# $11=0x666c0000
    ori  $11, $11, 0x09c3			# $11=0x666c09c3
    lui  $12, 0x16ed			# $12=0x16ed0000
    ori  $12, $12, 0x7742			# $12=0x16ed7742
    lui  $13, 0xb99c			# $13=0xb99c0000
    ori  $13, $13, 0x2762			# $13=0xb99c2762
    lui  $14, 0x8390			# $14=0x83900000
    ori  $14, $14, 0xe873			# $14=0x8390e873
    lui  $15, 0xcc29			# $15=0xcc290000
    ori  $15, $15, 0xf8f3			# $15=0xcc29f8f3
    lui  $16, 0x402e			# $16=0x402e0000
    ori  $16, $16, 0x1f98			# $16=0x402e1f98
    lui  $17, 0x7549			# $17=0x75490000
    ori  $17, $17, 0x598e			# $17=0x7549598e
    lui  $18, 0xc36a			# $18=0xc36a0000
    ori  $18, $18, 0x449d			# $18=0xc36a449d
    lui  $19, 0x5187			# $19=0x51870000
    ori  $19, $19, 0xb604			# $19=0x5187b604
    lui  $20, 0x38c5			# $20=0x38c50000
    ori  $20, $20, 0x7f05			# $20=0x38c57f05
    lui  $21, 0x631d			# $21=0x631d0000
    ori  $21, $21, 0x1a9f			# $21=0x631d1a9f
    lui  $22, 0xf5bf			# $22=0xf5bf0000
    ori  $22, $22, 0x5792			# $22=0xf5bf5792
    lui  $23, 0x9d27			# $23=0x9d270000
    ori  $23, $23, 0x153f			# $23=0x9d27153f
    lui  $24, 0x8cdd			# $24=0x8cdd0000
    ori  $24, $24, 0xb19f			# $24=0x8cddb19f
    lui  $25, 0x48ab			# $25=0x48ab0000
    ori  $25, $25, 0x7690			# $25=0x48ab7690
    lui  $26, 0x16c2			# $26=0x16c20000
    ori  $26, $26, 0xe75c			# $26=0x16c2e75c
    lui  $27, 0x0276			# $27=0x02760000
    ori  $27, $27, 0x17dd			# $27=0x027617dd
    lui  $28, 0x9194			# $28=0x91940000
    ori  $28, $28, 0x7c81			# $28=0x91947c81
    lui  $29, 0xa052			# $29=0xa0520000
    ori  $29, $29, 0xa4a3			# $29=0xa052a4a3
    lui  $30, 0xb842			# $30=0xb8420000
    ori  $30, $30, 0x298e			# $30=0xb842298e
    lui  $31, 0x5579			# $31=0x55790000
    ori  $31, $31, 0x9938			# $31=0x55799938
    lui  $0, 0x25d3			# $0=0x25d30000
    ori  $0, $0, 0x5d39			# $0=0x00005d39
    lui  $1, 0xd3d8			# $1=0xd3d80000
    ori  $1, $1, 0x1dd8			# $1=0xd3d81dd8
    lui  $2, 0x35f2			# $2=0x35f20000
    ori  $2, $2, 0x0016			# $2=0x35f20016
    lui  $3, 0x6eca			# $3=0x6eca0000
    ori  $3, $3, 0xc3aa			# $3=0x6ecac3aa
    lui  $4, 0xfbdd			# $4=0xfbdd0000
    ori  $4, $4, 0x4ebe			# $4=0xfbdd4ebe
    lui  $5, 0x5153			# $5=0x51530000
    ori  $5, $5, 0xc388			# $5=0x5153c388
    lui  $6, 0x33de			# $6=0x33de0000
    ori  $6, $6, 0xdf23			# $6=0x33dedf23
    lui  $7, 0x7000			# $7=0x70000000
    ori  $7, $7, 0xb042			# $7=0x7000b042
    lui  $8, 0x9dd7			# $8=0x9dd70000
    ori  $8, $8, 0x8dca			# $8=0x9dd78dca
    lui  $9, 0xdc6a			# $9=0xdc6a0000
    ori  $9, $9, 0x767a			# $9=0xdc6a767a
    lui  $10, 0x69a3			# $10=0x69a30000
    ori  $10, $10, 0x1f2a			# $10=0x69a31f2a
    lui  $11, 0x8950			# $11=0x89500000
    ori  $11, $11, 0x82ba			# $11=0x895082ba
    lui  $12, 0x892e			# $12=0x892e0000
    ori  $12, $12, 0x2fe3			# $12=0x892e2fe3
    lui  $13, 0xf1ad			# $13=0xf1ad0000
    ori  $13, $13, 0x9d89			# $13=0xf1ad9d89
    lui  $14, 0x8dab			# $14=0x8dab0000
    ori  $14, $14, 0x5a17			# $14=0x8dab5a17
    lui  $15, 0x513e			# $15=0x513e0000
    ori  $15, $15, 0x2f21			# $15=0x513e2f21
    lui  $16, 0xa1e4			# $16=0xa1e40000
    ori  $16, $16, 0xdf2d			# $16=0xa1e4df2d
    lui  $17, 0x9766			# $17=0x97660000
    ori  $17, $17, 0x6492			# $17=0x97666492
    lui  $18, 0x9046			# $18=0x90460000
    ori  $18, $18, 0x1c1e			# $18=0x90461c1e
    lui  $19, 0xbe3b			# $19=0xbe3b0000
    ori  $19, $19, 0xeb8b			# $19=0xbe3beb8b
    lui  $20, 0x5f38			# $20=0x5f380000
    ori  $20, $20, 0xe8f0			# $20=0x5f38e8f0
    lui  $21, 0xc8f4			# $21=0xc8f40000
    ori  $21, $21, 0x353c			# $21=0xc8f4353c
    lui  $22, 0x4d57			# $22=0x4d570000
    ori  $22, $22, 0x4221			# $22=0x4d574221
    lui  $23, 0xdc30			# $23=0xdc300000
    ori  $23, $23, 0x72ce			# $23=0xdc3072ce
    lui  $24, 0x8d11			# $24=0x8d110000
    ori  $24, $24, 0x9be0			# $24=0x8d119be0
    lui  $25, 0x6583			# $25=0x65830000
    ori  $25, $25, 0xf9e4			# $25=0x6583f9e4
    lui  $26, 0xd3d9			# $26=0xd3d90000
    ori  $26, $26, 0x40ef			# $26=0xd3d940ef
    lui  $27, 0x4c56			# $27=0x4c560000
    ori  $27, $27, 0xd868			# $27=0x4c56d868
    lui  $28, 0x2bd6			# $28=0x2bd60000
    ori  $28, $28, 0xd2d2			# $28=0x2bd6d2d2
    lui  $29, 0x4a51			# $29=0x4a510000
    ori  $29, $29, 0x21da			# $29=0x4a5121da
    lui  $30, 0x5835			# $30=0x58350000
    ori  $30, $30, 0x44f5			# $30=0x583544f5
    lui  $31, 0x8d19			# $31=0x8d190000
    ori  $31, $31, 0xf628			# $31=0x8d19f628
    lui  $0, 0xd3c5			# $0=0xd3c50000
    ori  $0, $0, 0xa5aa			# $0=0x0000a5aa
    lui  $1, 0xeda5			# $1=0xeda50000
    ori  $1, $1, 0x81bf			# $1=0xeda581bf
    lui  $2, 0x6409			# $2=0x64090000
    ori  $2, $2, 0x29c7			# $2=0x640929c7
    lui  $3, 0x943a			# $3=0x943a0000
    ori  $3, $3, 0x4b69			# $3=0x943a4b69
    lui  $4, 0x7cab			# $4=0x7cab0000
    ori  $4, $4, 0x0a03			# $4=0x7cab0a03
    lui  $5, 0xa113			# $5=0xa1130000
    ori  $5, $5, 0x5ee4			# $5=0xa1135ee4
    lui  $6, 0x2b41			# $6=0x2b410000
    ori  $6, $6, 0xa55c			# $6=0x2b41a55c
    lui  $7, 0x077b			# $7=0x077b0000
    ori  $7, $7, 0x18a8			# $7=0x077b18a8
    lui  $8, 0x53fb			# $8=0x53fb0000
    ori  $8, $8, 0x8b7e			# $8=0x53fb8b7e
    lui  $9, 0xffff			# $9=0xffff0000
    ori  $9, $9, 0xe368			# $9=0xffffe368
    lui  $10, 0x7b61			# $10=0x7b610000
    ori  $10, $10, 0xcd9a			# $10=0x7b61cd9a
    lui  $11, 0x8cf7			# $11=0x8cf70000
    ori  $11, $11, 0x0e8c			# $11=0x8cf70e8c
    lui  $12, 0xcf4b			# $12=0xcf4b0000
    ori  $12, $12, 0xd749			# $12=0xcf4bd749
    lui  $13, 0xbb87			# $13=0xbb870000
    ori  $13, $13, 0x9dda			# $13=0xbb879dda
    lui  $14, 0x1485			# $14=0x14850000
    ori  $14, $14, 0x9d1c			# $14=0x14859d1c
    lui  $15, 0x026c			# $15=0x026c0000
    ori  $15, $15, 0xb40c			# $15=0x026cb40c
    lui  $16, 0x3b2b			# $16=0x3b2b0000
    ori  $16, $16, 0xa02e			# $16=0x3b2ba02e
    lui  $17, 0x0795			# $17=0x07950000
    ori  $17, $17, 0x7de7			# $17=0x07957de7
    lui  $18, 0x687b			# $18=0x687b0000
    ori  $18, $18, 0x62fb			# $18=0x687b62fb
    lui  $19, 0x22d6			# $19=0x22d60000
    ori  $19, $19, 0xb6f7			# $19=0x22d6b6f7
    lui  $20, 0x2ae1			# $20=0x2ae10000
    ori  $20, $20, 0x4db3			# $20=0x2ae14db3
    lui  $21, 0x8329			# $21=0x83290000
    ori  $21, $21, 0x31b2			# $21=0x832931b2
    lui  $22, 0x4c6a			# $22=0x4c6a0000
    ori  $22, $22, 0xf0be			# $22=0x4c6af0be
    lui  $23, 0x62c4			# $23=0x62c40000
    ori  $23, $23, 0xbbe4			# $23=0x62c4bbe4
    lui  $24, 0x04c0			# $24=0x04c00000
    ori  $24, $24, 0xf8a2			# $24=0x04c0f8a2
    lui  $25, 0x23ef			# $25=0x23ef0000
    ori  $25, $25, 0xa5da			# $25=0x23efa5da
    lui  $26, 0x018f			# $26=0x018f0000
    ori  $26, $26, 0xd457			# $26=0x018fd457
    lui  $27, 0xbf5e			# $27=0xbf5e0000
    ori  $27, $27, 0x60ef			# $27=0xbf5e60ef
    lui  $28, 0x7815			# $28=0x78150000
    ori  $28, $28, 0x2189			# $28=0x78152189
    lui  $29, 0xa550			# $29=0xa5500000
    ori  $29, $29, 0xc768			# $29=0xa550c768
    lui  $30, 0x4954			# $30=0x49540000
    ori  $30, $30, 0x0cad			# $30=0x49540cad
    lui  $31, 0x2d35			# $31=0x2d350000
    ori  $31, $31, 0x174b			# $31=0x2d35174b
    mthi  $8			# hi=0x53fb8b7e,lo=0x00000000
    mthi  $23			# hi=0x62c4bbe4,lo=0x00000000
    mthi  $24			# hi=0x04c0f8a2,lo=0x00000000
    mthi  $29			# hi=0xa550c768,lo=0x00000000
    mthi  $11			# hi=0x8cf70e8c,lo=0x00000000
    mthi  $23			# hi=0x62c4bbe4,lo=0x00000000
    mthi  $18			# hi=0x687b62fb,lo=0x00000000
    mthi  $12			# hi=0xcf4bd749,lo=0x00000000
    mthi  $14			# hi=0x14859d1c,lo=0x00000000
    mthi  $4			# hi=0x7cab0a03,lo=0x00000000
    mthi  $4			# hi=0x7cab0a03,lo=0x00000000
    mthi  $13			# hi=0xbb879dda,lo=0x00000000
    mthi  $14			# hi=0x14859d1c,lo=0x00000000
    mthi  $9			# hi=0xffffe368,lo=0x00000000
    mthi  $25			# hi=0x23efa5da,lo=0x00000000
    mthi  $18			# hi=0x687b62fb,lo=0x00000000
    mthi  $24			# hi=0x04c0f8a2,lo=0x00000000
    mthi  $17			# hi=0x07957de7,lo=0x00000000
    mthi  $0			# hi=0x00000000,lo=0x00000000
    mthi  $9			# hi=0xffffe368,lo=0x00000000
    mthi  $8			# hi=0x53fb8b7e,lo=0x00000000
    mthi  $10			# hi=0x7b61cd9a,lo=0x00000000
    mthi  $14			# hi=0x14859d1c,lo=0x00000000
    mthi  $5			# hi=0xa1135ee4,lo=0x00000000
    mthi  $13			# hi=0xbb879dda,lo=0x00000000
    mthi  $0			# hi=0x00000000,lo=0x00000000
    mthi  $0			# hi=0x00000000,lo=0x00000000
    mthi  $18			# hi=0x687b62fb,lo=0x00000000
    mthi  $3			# hi=0x943a4b69,lo=0x00000000
    mthi  $29			# hi=0xa550c768,lo=0x00000000
    mthi  $13			# hi=0xbb879dda,lo=0x00000000
    mthi  $14			# hi=0x14859d1c,lo=0x00000000
    mthi  $25			# hi=0x23efa5da,lo=0x00000000
    mthi  $25			# hi=0x23efa5da,lo=0x00000000
    mthi  $5			# hi=0xa1135ee4,lo=0x00000000
    mthi  $23			# hi=0x62c4bbe4,lo=0x00000000
    mthi  $5			# hi=0xa1135ee4,lo=0x00000000
    mthi  $0			# hi=0x00000000,lo=0x00000000
    mthi  $6			# hi=0x2b41a55c,lo=0x00000000
    mthi  $13			# hi=0xbb879dda,lo=0x00000000
    mthi  $20			# hi=0x2ae14db3,lo=0x00000000
    mthi  $4			# hi=0x7cab0a03,lo=0x00000000
    mthi  $25			# hi=0x23efa5da,lo=0x00000000
    mthi  $18			# hi=0x687b62fb,lo=0x00000000
    mthi  $24			# hi=0x04c0f8a2,lo=0x00000000
    mthi  $17			# hi=0x07957de7,lo=0x00000000
    mthi  $17			# hi=0x07957de7,lo=0x00000000
    mthi  $18			# hi=0x687b62fb,lo=0x00000000
    mthi  $11			# hi=0x8cf70e8c,lo=0x00000000
    mthi  $20			# hi=0x2ae14db3,lo=0x00000000
    mthi  $30			# hi=0x49540cad,lo=0x00000000
    mthi  $22			# hi=0x4c6af0be,lo=0x00000000
    mthi  $22			# hi=0x4c6af0be,lo=0x00000000
    mthi  $3			# hi=0x943a4b69,lo=0x00000000
    mthi  $2			# hi=0x640929c7,lo=0x00000000
    mthi  $18			# hi=0x687b62fb,lo=0x00000000
    mthi  $24			# hi=0x04c0f8a2,lo=0x00000000
    mthi  $25			# hi=0x23efa5da,lo=0x00000000
    mthi  $29			# hi=0xa550c768,lo=0x00000000
    mthi  $31			# hi=0x2d35174b,lo=0x00000000
    mthi  $1			# hi=0xeda581bf,lo=0x00000000
    mthi  $22			# hi=0x4c6af0be,lo=0x00000000
    mthi  $20			# hi=0x2ae14db3,lo=0x00000000
    mthi  $1			# hi=0xeda581bf,lo=0x00000000
    mthi  $25			# hi=0x23efa5da,lo=0x00000000
    mthi  $1			# hi=0xeda581bf,lo=0x00000000
    mthi  $4			# hi=0x7cab0a03,lo=0x00000000
    mthi  $24			# hi=0x04c0f8a2,lo=0x00000000
    mthi  $12			# hi=0xcf4bd749,lo=0x00000000
    mthi  $26			# hi=0x018fd457,lo=0x00000000
    mthi  $16			# hi=0x3b2ba02e,lo=0x00000000
    mthi  $2			# hi=0x640929c7,lo=0x00000000
    mthi  $0			# hi=0x00000000,lo=0x00000000
    mthi  $5			# hi=0xa1135ee4,lo=0x00000000
    mthi  $6			# hi=0x2b41a55c,lo=0x00000000
    mthi  $16			# hi=0x3b2ba02e,lo=0x00000000
    mthi  $31			# hi=0x2d35174b,lo=0x00000000
    mthi  $12			# hi=0xcf4bd749,lo=0x00000000
    mthi  $20			# hi=0x2ae14db3,lo=0x00000000
    mthi  $2			# hi=0x640929c7,lo=0x00000000
    mthi  $2			# hi=0x640929c7,lo=0x00000000
    mthi  $4			# hi=0x7cab0a03,lo=0x00000000
    mthi  $2			# hi=0x640929c7,lo=0x00000000
    mthi  $19			# hi=0x22d6b6f7,lo=0x00000000
    mthi  $11			# hi=0x8cf70e8c,lo=0x00000000
    mthi  $20			# hi=0x2ae14db3,lo=0x00000000
    mthi  $3			# hi=0x943a4b69,lo=0x00000000
    mthi  $18			# hi=0x687b62fb,lo=0x00000000
    mthi  $24			# hi=0x04c0f8a2,lo=0x00000000
    mthi  $18			# hi=0x687b62fb,lo=0x00000000
    mthi  $12			# hi=0xcf4bd749,lo=0x00000000
    mthi  $28			# hi=0x78152189,lo=0x00000000
    mthi  $14			# hi=0x14859d1c,lo=0x00000000
    mthi  $21			# hi=0x832931b2,lo=0x00000000
    mthi  $15			# hi=0x026cb40c,lo=0x00000000
    mthi  $2			# hi=0x640929c7,lo=0x00000000
    mthi  $3			# hi=0x943a4b69,lo=0x00000000
    mthi  $21			# hi=0x832931b2,lo=0x00000000
    mthi  $11			# hi=0x8cf70e8c,lo=0x00000000
    mthi  $1			# hi=0xeda581bf,lo=0x00000000
