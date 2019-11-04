    .org 0x0
    .global _start
    .set noat
    .set noreorder
    .set nomacro
_start:
    lui  $0, 0xc687			# $0=0xc6870000
    ori  $0, $0, 0xbe68			# $0=0x0000be68
    lui  $1, 0x48ac			# $1=0x48ac0000
    ori  $1, $1, 0xed75			# $1=0x48aced75
    lui  $2, 0x9e82			# $2=0x9e820000
    ori  $2, $2, 0x65f3			# $2=0x9e8265f3
    lui  $3, 0x1408			# $3=0x14080000
    ori  $3, $3, 0xad4d			# $3=0x1408ad4d
    lui  $4, 0xda70			# $4=0xda700000
    ori  $4, $4, 0x4212			# $4=0xda704212
    lui  $5, 0xd806			# $5=0xd8060000
    ori  $5, $5, 0x3689			# $5=0xd8063689
    lui  $6, 0x0246			# $6=0x02460000
    ori  $6, $6, 0xcd24			# $6=0x0246cd24
    lui  $7, 0x66ec			# $7=0x66ec0000
    ori  $7, $7, 0x3ff9			# $7=0x66ec3ff9
    lui  $8, 0x2746			# $8=0x27460000
    ori  $8, $8, 0xb450			# $8=0x2746b450
    lui  $9, 0x1b7f			# $9=0x1b7f0000
    ori  $9, $9, 0xf3f5			# $9=0x1b7ff3f5
    lui  $10, 0x17c5			# $10=0x17c50000
    ori  $10, $10, 0xc656			# $10=0x17c5c656
    lui  $11, 0x8811			# $11=0x88110000
    ori  $11, $11, 0xb82b			# $11=0x8811b82b
    lui  $12, 0x3be3			# $12=0x3be30000
    ori  $12, $12, 0x656b			# $12=0x3be3656b
    lui  $13, 0x39ec			# $13=0x39ec0000
    ori  $13, $13, 0xa642			# $13=0x39eca642
    lui  $14, 0xe563			# $14=0xe5630000
    ori  $14, $14, 0x7f79			# $14=0xe5637f79
    lui  $15, 0xd71d			# $15=0xd71d0000
    ori  $15, $15, 0xb112			# $15=0xd71db112
    lui  $16, 0xedb7			# $16=0xedb70000
    ori  $16, $16, 0xc27f			# $16=0xedb7c27f
    lui  $17, 0x3320			# $17=0x33200000
    ori  $17, $17, 0x0ba8			# $17=0x33200ba8
    lui  $18, 0xff76			# $18=0xff760000
    ori  $18, $18, 0x033d			# $18=0xff76033d
    lui  $19, 0xd80e			# $19=0xd80e0000
    ori  $19, $19, 0xd384			# $19=0xd80ed384
    lui  $20, 0x3c55			# $20=0x3c550000
    ori  $20, $20, 0x0eab			# $20=0x3c550eab
    lui  $21, 0xa001			# $21=0xa0010000
    ori  $21, $21, 0x578a			# $21=0xa001578a
    lui  $22, 0x87ab			# $22=0x87ab0000
    ori  $22, $22, 0x3058			# $22=0x87ab3058
    lui  $23, 0x7941			# $23=0x79410000
    ori  $23, $23, 0xb6da			# $23=0x7941b6da
    lui  $24, 0x241c			# $24=0x241c0000
    ori  $24, $24, 0x5bb3			# $24=0x241c5bb3
    lui  $25, 0xcd1e			# $25=0xcd1e0000
    ori  $25, $25, 0x4bf0			# $25=0xcd1e4bf0
    lui  $26, 0x2a56			# $26=0x2a560000
    ori  $26, $26, 0xb3b7			# $26=0x2a56b3b7
    lui  $27, 0xd424			# $27=0xd4240000
    ori  $27, $27, 0x3c3e			# $27=0xd4243c3e
    lui  $28, 0xd86d			# $28=0xd86d0000
    ori  $28, $28, 0xe1a9			# $28=0xd86de1a9
    lui  $29, 0xbee0			# $29=0xbee00000
    ori  $29, $29, 0x019f			# $29=0xbee0019f
    lui  $30, 0x39c3			# $30=0x39c30000
    ori  $30, $30, 0xab65			# $30=0x39c3ab65
    lui  $31, 0xb773			# $31=0xb7730000
    ori  $31, $31, 0x05f2			# $31=0xb77305f2
    mtlo  $2			# hi=0x00000000,lo=0x9e8265f3
    mtlo  $20			# hi=0x00000000,lo=0x3c550eab
    mtlo  $26			# hi=0x00000000,lo=0x2a56b3b7
    mtlo  $2			# hi=0x00000000,lo=0x9e8265f3
    mtlo  $20			# hi=0x00000000,lo=0x3c550eab
    mtlo  $12			# hi=0x00000000,lo=0x3be3656b
    mtlo  $20			# hi=0x00000000,lo=0x3c550eab
    mtlo  $19			# hi=0x00000000,lo=0xd80ed384
    mtlo  $24			# hi=0x00000000,lo=0x241c5bb3
    mtlo  $7			# hi=0x00000000,lo=0x66ec3ff9
    mtlo  $14			# hi=0x00000000,lo=0xe5637f79
    mtlo  $7			# hi=0x00000000,lo=0x66ec3ff9
    mtlo  $17			# hi=0x00000000,lo=0x33200ba8
    mtlo  $10			# hi=0x00000000,lo=0x17c5c656
    mtlo  $1			# hi=0x00000000,lo=0x48aced75
    mtlo  $20			# hi=0x00000000,lo=0x3c550eab
    mtlo  $5			# hi=0x00000000,lo=0xd8063689
    mtlo  $17			# hi=0x00000000,lo=0x33200ba8
    mtlo  $21			# hi=0x00000000,lo=0xa001578a
    mtlo  $0			# hi=0x00000000,lo=0x00000000
