.define PPUCTRL $2000
.define PPUMASK $2001
.define PPUSTATUS $2002
.define OAMADDR $2003
.define PPUSCROLL $2005
.define PPUADDR $2006
.define PPUDATA $2007

.define SQ1_VOL $4000
.define SQ2_VOL $4004
.define TRI_LINEAR $4008
.define NOISE_VOL $400c
.define DMC_FREQ $4010
.define DMC_RAW $4011
.define OAMDMA $4014
.define SND_CHN $4015
.define JOY1 $4016
.define JOY2 $4017

.define NAMETABLE0 $2000
.define NAMETABLE1 $2400
.define NAMETABLE2 $2800
.define NAMETABLE3 $2c00

.define PADF_A      $80
.define PADF_B      $40
.define PADF_SELECT $20
.define PADF_START  $10
.define PADF_UP     $08
.define PADF_DOWN   $04
.define PADF_LEFT   $02
.define PADF_RIGHT  $01

// MMC3
.define BANK_SELECT $8000
.define BS_2KB_CHR_0 $00
.define BS_2KB_CHR_1 $01
.define BS_1KB_CHR_0 $02
.define BS_1KB_CHR_1 $03
.define BS_1KB_CHR_2 $04
.define BS_1KB_CHR_3 $05
.define BS_8000 $06
.define BS_a000 $07

.ifdef ROM_JP
	.define BANK_DATA $a000
.else
	.define BANK_DATA $8001
.endif
.define NAMETABLE_MIRRORING $a000
.define IRQ_LATCH $c000
.define IRQ_RELOAD $c001
.define IRQ_DISABLE $e000
.define IRQ_ENABLE $e001
