    .org 0x0
    .global _start
    .set noat
    .set noreorder
    .set nomacro
_start:
    lui  $0, 0xdffa			# $0=0xdffa0000
    ori  $0, $0, 0xf6a2			# $0=0x0000f6a2
    lui  $1, 0x8675			# $1=0x86750000
    ori  $1, $1, 0x1e1f			# $1=0x86751e1f
    lui  $2, 0x5e6b			# $2=0x5e6b0000
    ori  $2, $2, 0x39c7			# $2=0x5e6b39c7
    lui  $3, 0xc25d			# $3=0xc25d0000
    ori  $3, $3, 0x0a3f			# $3=0xc25d0a3f
    lui  $4, 0x64c9			# $4=0x64c90000
    ori  $4, $4, 0x47d2			# $4=0x64c947d2
    lui  $5, 0xfc5e			# $5=0xfc5e0000
    ori  $5, $5, 0xf0c9			# $5=0xfc5ef0c9
    lui  $6, 0x3e4f			# $6=0x3e4f0000
    ori  $6, $6, 0xaa2e			# $6=0x3e4faa2e
    lui  $7, 0x7cd7			# $7=0x7cd70000
    ori  $7, $7, 0x3e89			# $7=0x7cd73e89
    lui  $8, 0x6aaf			# $8=0x6aaf0000
    ori  $8, $8, 0xda29			# $8=0x6aafda29
    lui  $9, 0xad08			# $9=0xad080000
    ori  $9, $9, 0x0841			# $9=0xad080841
    lui  $10, 0x6f53			# $10=0x6f530000
    ori  $10, $10, 0x6e73			# $10=0x6f536e73
    lui  $11, 0x2c3e			# $11=0x2c3e0000
    ori  $11, $11, 0xe662			# $11=0x2c3ee662
    lui  $12, 0x301d			# $12=0x301d0000
    ori  $12, $12, 0x0d74			# $12=0x301d0d74
    lui  $13, 0x14b5			# $13=0x14b50000
    ori  $13, $13, 0xa03e			# $13=0x14b5a03e
    lui  $14, 0x0185			# $14=0x01850000
    ori  $14, $14, 0xf408			# $14=0x0185f408
    lui  $15, 0x5407			# $15=0x54070000
    ori  $15, $15, 0x47ad			# $15=0x540747ad
    lui  $16, 0x3786			# $16=0x37860000
    ori  $16, $16, 0x8c73			# $16=0x37868c73
    lui  $17, 0x81b2			# $17=0x81b20000
    ori  $17, $17, 0x8971			# $17=0x81b28971
    lui  $18, 0xf492			# $18=0xf4920000
    ori  $18, $18, 0xc7da			# $18=0xf492c7da
    lui  $19, 0x70a3			# $19=0x70a30000
    ori  $19, $19, 0x9012			# $19=0x70a39012
    lui  $20, 0xc335			# $20=0xc3350000
    ori  $20, $20, 0x2ddd			# $20=0xc3352ddd
    lui  $21, 0x8697			# $21=0x86970000
    ori  $21, $21, 0x2d4b			# $21=0x86972d4b
    lui  $22, 0xa655			# $22=0xa6550000
    ori  $22, $22, 0xd933			# $22=0xa655d933
    lui  $23, 0xb740			# $23=0xb7400000
    ori  $23, $23, 0xfc1e			# $23=0xb740fc1e
    lui  $24, 0xd55c			# $24=0xd55c0000
    ori  $24, $24, 0xc7a7			# $24=0xd55cc7a7
    lui  $25, 0xac9d			# $25=0xac9d0000
    ori  $25, $25, 0x97ee			# $25=0xac9d97ee
    lui  $26, 0xcc5c			# $26=0xcc5c0000
    ori  $26, $26, 0x869c			# $26=0xcc5c869c
    lui  $27, 0xc6f9			# $27=0xc6f90000
    ori  $27, $27, 0x9754			# $27=0xc6f99754
    lui  $28, 0xa4c7			# $28=0xa4c70000
    ori  $28, $28, 0x4cc5			# $28=0xa4c74cc5
    lui  $29, 0x45fd			# $29=0x45fd0000
    ori  $29, $29, 0x6214			# $29=0x45fd6214
    lui  $30, 0x28ca			# $30=0x28ca0000
    ori  $30, $30, 0xd2a4			# $30=0x28cad2a4
    lui  $31, 0x5d17			# $31=0x5d170000
    ori  $31, $31, 0x5c72			# $31=0x5d175c72
    multu  $25, $22			# hi=0x7028134b,lo=0xbf34026a
    multu  $1, $29			# hi=0x24c2a660,lo=0x7651386c
    multu  $0, $28			# hi=0x00000000,lo=0x00000000
    multu  $28, $0			# hi=0x00000000,lo=0x00000000
    multu  $7, $16			# hi=0x1b13db97,lo=0xf59a038b
    multu  $16, $25			# hi=0x257094d5,lo=0x627567ea
    multu  $16, $7			# hi=0x1b13db97,lo=0xf59a038b
    multu  $27, $22			# hi=0x814891d0,lo=0xebe359bc
    multu  $5, $20			# hi=0xc070be47,lo=0x82e63285
    multu  $24, $1			# hi=0x70102d03,lo=0x5ef4bf39
    multu  $26, $4			# hi=0x5074d28f,lo=0xedb7aff8
    multu  $19, $7			# hi=0x36edeeaa,lo=0x9b8a75a2
    multu  $24, $5			# hi=0xd2567548,lo=0x3457521f
    multu  $17, $0			# hi=0x00000000,lo=0x00000000
    multu  $12, $22			# hi=0x1f42f930,lo=0xe5b5021c
    multu  $11, $21			# hi=0x17430d85,lo=0x34bab8b6
    multu  $11, $2			# hi=0x1051a0de,lo=0xad26e82e
    multu  $9, $21			# hi=0x5af862ab,lo=0xff24d80b
    multu  $22, $11			# hi=0x1cbf9fd0,lo=0x2c5af786
    multu  $27, $6			# hi=0x306e5df1,lo=0x8a42f918
