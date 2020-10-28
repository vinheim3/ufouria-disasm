
func_b_0000:
B11_0000:		sta $06b4, x	; 9d b4 06
B11_0003:		dex				; ca 
B11_0004:		bpl B11_0000 ; 10 fa

B11_0006:		lda #$e0		; a9 e0
B11_0008:		sta $0505		; 8d 05 05
B11_000b:		lda #$0b		; a9 0b
B11_000d:		jmp displayTextIdxedA		; 4c 72 87


B11_0010:		lda #$20		; a9 20
B11_0012:		sta $1a			; 85 1a
B11_0014:		lda #$f0		; a9 f0
B11_0016:		sta $15			; 85 15
B11_0018:		lda #$38		; a9 38
B11_001a:		sta $1b			; 85 1b
B11_001c:		lda #$0c		; a9 0c
B11_001e:		jsr displayTextIdxedA		; 20 72 87
B11_0021:		lda #$31		; a9 31
B11_0023:		jsr func_08fa		; 20 fa e8
B11_0026:		lda #$ff		; a9 ff
B11_0028:		sta $97			; 85 97
B11_002a:		rts				; 60 


B11_002b:		lda #$00		; a9 00
B11_002d:		jsr func_13ef		; 20 ef f3
B11_0030:		dec $1b			; c6 1b
B11_0032:		bne B11_003c ; d0 08

B11_0034:		lda #$01		; a9 01
B11_0036:		sta $1a			; 85 1a
B11_0038:		lda #$00		; a9 00
B11_003a:		sta $15			; 85 15
B11_003c:		rts				; 60 


B11_003d:		lda #$6a		; a9 6a
B11_003f:		sta wShadow1KBChrBank3.w		; 8d 6e 01
B11_0042:		jsr $a0b6		; 20 b6 a0
B11_0045:		lda $050a		; ad 0a 05
B11_0048:		and #$20		; 29 20
B11_004a:		bne B11_004f ; d0 03

B11_004c:		jmp $a4fc		; 4c fc a4


B11_004f:		lda #$02		; a9 02
B11_0051:		sta $1a			; 85 1a
B11_0053:		lda #$5c		; a9 5c
B11_0055:		jmp setGlobalFlag		; 4c f0 e7


B11_0058:		jsr $a0b6		; 20 b6 a0
B11_005b:		lda $18			; a5 18
B11_005d:		cmp #$58		; c9 58
B11_005f:		beq B11_00a0 ; f0 3f

B11_0061:		lda $10			; a5 10
B11_0063:		cmp #$3e		; c9 3e
B11_0065:		bne B11_0078 ; d0 11

B11_0067:		lda $050a		; ad 0a 05
B11_006a:		and #$20		; 29 20
B11_006c:		beq B11_008c ; f0 1e

B11_006e:		lda #$97		; a9 97
B11_0070:		sta $4f			; 85 4f
B11_0072:		lda wEntityWramOffset.w		; ad 5b 01
B11_0075:		sta $c3			; 85 c3
B11_0077:		rts				; 60 


B11_0078:		cmp #$2a		; c9 2a
B11_007a:		bne B11_008c ; d0 10

B11_007c:		lda $050b		; ad 0b 05
B11_007f:		and #$ef		; 29 ef
B11_0081:		sta $050b		; 8d 0b 05
B11_0084:		lda #$5c		; a9 5c
B11_0086:		jsr unsetGlobalFlag		; 20 fc e7
B11_0089:		jmp $8824		; 4c 24 88


B11_008c:		lda #$10		; a9 10
B11_008e:		sta $14			; 85 14
B11_0090:		lda #$00		; a9 00
B11_0092:		jsr func_13ef		; 20 ef f3
B11_0095:		lda $10			; a5 10
B11_0097:		sta $0484		; 8d 84 04
B11_009a:		lda $11			; a5 11
B11_009c:		sta $0485		; 8d 85 04
B11_009f:		rts				; 60 


B11_00a0:		lda $10			; a5 10
B11_00a2:		cmp #$6a		; c9 6a
B11_00a4:		bne B11_008c ; d0 e6

B11_00a6:		lda $050b		; ad 0b 05
B11_00a9:		and #$ef		; 29 ef
B11_00ab:		sta $050b		; 8d 0b 05
B11_00ae:		lda #$5c		; a9 5c
B11_00b0:		jsr unsetGlobalFlag		; 20 fc e7
B11_00b3:		jmp $8824		; 4c 24 88


B11_00b6:		lda $015a		; ad 5a 01
B11_00b9:		and #$04		; 29 04
B11_00bb:		bne B11_00c1 ; d0 04

B11_00bd:		lda #$50		; a9 50
B11_00bf:		bne B11_00c3 ; d0 02

B11_00c1:		lda #$4f		; a9 4f
B11_00c3:		jmp updateEntity_wOam		; 4c 67 f5


B11_00c6:		jsr $81c2		; 20 c2 81
B11_00c9:		lda $015d		; ad 5d 01
B11_00cc:		beq B11_00cf ; f0 01

B11_00ce:		rts				; 60 


B11_00cf:		lda #$04		; a9 04
B11_00d1:		jsr func_1b72		; 20 72 fb
B11_00d4:		lda #$05		; a9 05
B11_00d6:		jsr func_19a7		; 20 a7 f9
B11_00d9:		lda $11			; a5 11
B11_00db:		sta $00			; 85 00
B11_00dd:		lda $10			; a5 10
B11_00df:		asl $00			; 06 00
B11_00e1:		rol a			; 2a
B11_00e2:		and #$03		; 29 03
B11_00e4:		tay				; a8 
B11_00e5:		lda $a1d4, y	; b9 d4 a1
B11_00e8:		jsr updateEntity_wOam		; 20 67 f5
B11_00eb:		bit $1a			; 24 1a
B11_00ed:		bmi B11_0144 ; 30 55

B11_00ef:		bvs B11_0155 ; 70 64

B11_00f1:		lda #$18		; a9 18
B11_00f3:		and $1a			; 25 1a
B11_00f5:		beq B11_0101 ; f0 0a

B11_00f7:		and #$10		; 29 10
B11_00f9:		beq B11_00fe ; f0 03

B11_00fb:		jmp $a1b5		; 4c b5 a1


B11_00fe:		jmp $a173		; 4c 73 a1


B11_0101:		lda #$09		; a9 09
B11_0103:		jsr func_1aac		; 20 ac fa
B11_0106:		bcs B11_010c ; b0 04

B11_0108:		lda #$e8		; a9 e8
B11_010a:		sta $14			; 85 14
B11_010c:		ldx #$10		; a2 10
B11_010e:		lda $12			; a5 12
B11_0110:		cmp #$0c		; c9 0c
B11_0112:		bne B11_0118 ; d0 04

B11_0114:		lda $13			; a5 13
B11_0116:		bpl B11_0120 ; 10 08

B11_0118:		lda #$c0		; a9 c0
B11_011a:		jsr func_13ef		; 20 ef f3
B11_011d:		jmp $86ef		; 4c ef 86


B11_0120:		lda #$18		; a9 18
B11_0122:		sta $10			; 85 10
B11_0124:		lda #$c0		; a9 c0
B11_0126:		sta $11			; 85 11
B11_0128:		lda #$0c		; a9 0c
B11_012a:		sta $12			; 85 12
B11_012c:		lda #$00		; a9 00
B11_012e:		sta $13			; 85 13
B11_0130:		lda #$00		; a9 00
B11_0132:		sta $14			; 85 14
B11_0134:		sta $15			; 85 15
B11_0136:		lda #$08		; a9 08
B11_0138:		sta $1a			; 85 1a
B11_013a:		lda #$31		; a9 31
B11_013c:		jsr func_08fa		; 20 fa e8
B11_013f:		lda #$ff		; a9 ff
B11_0141:		sta $97			; 85 97
B11_0143:		rts				; 60 


B11_0144:		jsr $89ce		; 20 ce 89
B11_0147:		lda $00			; a5 00
B11_0149:		cmp #$20		; c9 20
B11_014b:		bcs B11_0154 ; b0 07

B11_014d:		jsr func_a_0789		; 20 89 87
B11_0150:		lda #$40		; a9 40
B11_0152:		sta $1a			; 85 1a
B11_0154:		rts				; 60 


B11_0155:		lda #$56		; a9 56
B11_0157:		jsr checkGlobalFlag		; 20 e9 e7
B11_015a:		bne B11_016c ; d0 10

B11_015c:		lda #$0b		; a9 0b
B11_015e:		jsr checkGlobalFlag		; 20 e9 e7
B11_0161:		bne B11_016d ; d0 0a

B11_0163:		lda #$0a		; a9 0a
B11_0165:		jsr displayTextIdxedA		; 20 72 87
B11_0168:		lda #$00		; a9 00
B11_016a:		sta $1a			; 85 1a
B11_016c:		rts				; 60 


B11_016d:		lda #$0b		; a9 0b
B11_016f:		jsr displayTextIdxedA		; 20 72 87
B11_0172:		rts				; 60 


B11_0173:		lda #$08		; a9 08
B11_0175:		jsr $8b04		; 20 04 8b
B11_0178:		lda #$05		; a9 05
B11_017a:		sta $1c			; 85 1c
B11_017c:		lda #$4f		; a9 4f
B11_017e:		jsr copyStaticLayoutIdxedYForNMIDataCopying		; 20 86 fc
B11_0181:		lda #$10		; a9 10
B11_0183:		jsr $8b04		; 20 04 8b
B11_0186:		lda $0f			; a5 0f
B11_0188:		clc				; 18 
B11_0189:		adc #$20		; 69 20
B11_018b:		sta $0f			; 85 0f
B11_018d:		lda $0e			; a5 0e
B11_018f:		adc #$00		; 69 00
B11_0191:		sta $0e			; 85 0e
B11_0193:		lda #$4f		; a9 4f
B11_0195:		jsr copyStaticLayoutIdxedYForNMIDataCopyingAtCurrPPUAddr		; 20 96 fc
B11_0198:		lda #$10		; a9 10
B11_019a:		jsr $8b04		; 20 04 8b
B11_019d:		dec $1c			; c6 1c
B11_019f:		bne B11_0186 ; d0 e5

B11_01a1:		lda #$10		; a9 10
B11_01a3:		sta $1a			; 85 1a
B11_01a5:		lda #$88		; a9 88
B11_01a7:		sta $4f			; 85 4f
B11_01a9:		lda $10			; a5 10
B11_01ab:		clc				; 18 
B11_01ac:		adc #$80		; 69 80
B11_01ae:		sta $10			; 85 10
B11_01b0:		lda #$0b		; a9 0b
B11_01b2:		jmp setGlobalFlag		; 4c f0 e7


B11_01b5:		lda $06b8		; ad b8 06
B11_01b8:		cmp #$0a		; c9 0a
B11_01ba:		bne B11_01c4 ; d0 08

B11_01bc:		lda #$01		; a9 01
B11_01be:		sta $06b8		; 8d b8 06
B11_01c1:		sta $06c8		; 8d c8 06
B11_01c4:		lda $06b9		; ad b9 06
B11_01c7:		cmp #$0a		; c9 0a
B11_01c9:		bne B11_01d3 ; d0 08

B11_01cb:		lda #$01		; a9 01
B11_01cd:		sta $06b9		; 8d b9 06
B11_01d0:		sta $06c9		; 8d c9 06
B11_01d3:		rts				; 60 


B11_01d4:		adc ($62, x)	; 61 62
B11_01d6:	.db $63
B11_01d7:	.db $64
B11_01d8:		ldx #$04		; a2 04
B11_01da:		lda #$80		; a9 80
B11_01dc:		jsr func_13ef		; 20 ef f3
B11_01df:		jsr $86ef		; 20 ef 86
B11_01e2:		jsr func_0709		; 20 09 e7
B11_01e5:		dec $1a			; c6 1a
B11_01e7:		beq B11_01fe ; f0 15

B11_01e9:		lda $015d		; ad 5d 01
B11_01ec:		bne B11_01fe ; d0 10

B11_01ee:		lda $1a			; a5 1a
B11_01f0:		lsr a			; 4a
B11_01f1:		lsr a			; 4a
B11_01f2:		lsr a			; 4a
B11_01f3:		tay				; a8 
B11_01f4:		lda #$00		; a9 00
B11_01f6:		sta $2a			; 85 2a
B11_01f8:		lda $a207, y	; b9 07 a2
B11_01fb:		jmp func_1596		; 4c 96 f5


B11_01fe:		lda #$00		; a9 00
B11_0200:		sta $19			; 85 19
B11_0202:		lda #$46		; a9 46
B11_0204:		jmp unsetGlobalFlag		; 4c fc e7


B11_0207:		sbc $f7f8, y	; f9 f8 f7
B11_020a:		inc $20, x		; f6 20
.ifdef ROM_JP
	ldy $e7
.else
B11_020c:		ora #$e7		; 09 e7
.endif
B11_020e:		lda $015d		; ad 5d 01
B11_0211:		beq B11_0223 ; f0 10

B11_0213:		lda #$00		; a9 00
B11_0215:		sta $19			; 85 19
B11_0217:		lda $18			; a5 18
B11_0219:		cmp #$28		; c9 28
B11_021b:		bne B11_0222 ; d0 05

B11_021d:		lda $1e			; a5 1e
B11_021f:		jmp unsetGlobalFlag		; 4c fc e7


B11_0222:		rts				; 60 


B11_0223:		lda $18			; a5 18
B11_0225:		cmp #$28		; c9 28
B11_0227:		beq B11_024c ; f0 23

B11_0229:		lda #$5b		; a9 5b
B11_022b:		jsr checkGlobalFlag		; 20 e9 e7
B11_022e:		bne B11_024c ; d0 1c

B11_0230:		lda $015a		; ad 5a 01
B11_0233:		and #$01		; 29 01
B11_0235:		bne B11_024c ; d0 15

B11_0237:		dec $1c			; c6 1c
B11_0239:		bne B11_024c ; d0 11

B11_023b:		lda $1a			; a5 1a
B11_023d:		and #$20		; 29 20
B11_023f:		beq B11_0249 ; f0 08

B11_0241:		lda $050b		; ad 0b 05
B11_0244:		and #$fe		; 29 fe
B11_0246:		sta $050b		; 8d 0b 05
B11_0249:		jmp $8838		; 4c 38 88


B11_024c:		lda #$20		; a9 20
B11_024e:		bit $1a			; 24 1a
B11_0250:		beq B11_0255 ; f0 03

B11_0252:		jmp $a286		; 4c 86 a2


B11_0255:		bvc B11_025a ; 50 03

B11_0257:		jmp $a2ef		; 4c ef a2


B11_025a:		ldx #$0c		; a2 0c
B11_025c:		lda #$c0		; a9 c0
B11_025e:		jsr func_13ef		; 20 ef f3
B11_0261:		bit $1a			; 24 1a
B11_0263:		bpl B11_0268 ; 10 03

B11_0265:		jmp $a307		; 4c 07 a3


B11_0268:		jsr $a32a		; 20 2a a3
B11_026b:		jsr $a355		; 20 55 a3
B11_026e:		lda $18			; a5 18
B11_0270:		cmp #$28		; c9 28
B11_0272:		beq B11_0281 ; f0 0d

B11_0274:		lda $1e			; a5 1e
B11_0276:		bne B11_027c ; d0 04

B11_0278:		lda #$81		; a9 81
B11_027a:		sta $2b			; 85 2b
B11_027c:		lda #$6a		; a9 6a
B11_027e:		jmp updateEntity_wOam		; 4c 67 f5


B11_0281:		lda #$6b		; a9 6b
B11_0283:		jmp updateEntity_wOam		; 4c 67 f5


B11_0286:		lda $050a		; ad 0a 05
B11_0289:		and #$09		; 29 09
B11_028b:		bne B11_02bd ; d0 30

B11_028d:		lda $0503		; ad 03 05
B11_0290:		clc				; 18 
B11_0291:		adc #$c0		; 69 c0
B11_0293:		sta $13			; 85 13
B11_0295:		lda $0502		; ad 02 05
B11_0298:		adc #$ff		; 69 ff
B11_029a:		sta $12			; 85 12
B11_029c:		lda $0509		; ad 09 05
B11_029f:		and #$02		; 29 02
B11_02a1:		bne B11_02aa ; d0 07

B11_02a3:		ldx #$ff		; a2 ff
B11_02a5:		lda #$60		; a9 60
B11_02a7:		jmp $a2ae		; 4c ae a2


B11_02aa:		ldx #$00		; a2 00
B11_02ac:		lda #$a0		; a9 a0
B11_02ae:		clc				; 18 
B11_02af:		adc $0501		; 6d 01 05
B11_02b2:		sta $11			; 85 11
B11_02b4:		txa				; 8a 
B11_02b5:		adc $0500		; 6d 00 05
B11_02b8:		sta $10			; 85 10
B11_02ba:		jmp $a26e		; 4c 6e a2


B11_02bd:		lda wChosenCharacter.w		; ad 10 05
B11_02c0:		and #$03		; 29 03
B11_02c2:		beq B11_02e8 ; f0 24

B11_02c4:		cmp #$01		; c9 01
B11_02c6:		beq B11_02e8 ; f0 20

B11_02c8:		cmp #$02		; c9 02
B11_02ca:		beq B11_028d ; f0 c1

B11_02cc:		lda $0503		; ad 03 05
B11_02cf:		clc				; 18 
B11_02d0:		adc #$e0		; 69 e0
B11_02d2:		sta $13			; 85 13
B11_02d4:		lda $0502		; ad 02 05
B11_02d7:		adc #$ff		; 69 ff
B11_02d9:		sta $12			; 85 12
B11_02db:		lda $0500		; ad 00 05
B11_02de:		sta $10			; 85 10
B11_02e0:		lda $0501		; ad 01 05
B11_02e3:		sta $11			; 85 11
B11_02e5:		jmp $a26e		; 4c 6e a2


B11_02e8:		lda #$40		; a9 40
B11_02ea:		sta $1a			; 85 1a
B11_02ec:		jmp $a26e		; 4c 6e a2


B11_02ef:		lda $050b		; ad 0b 05
B11_02f2:		and #$fe		; 29 fe
B11_02f4:		sta $050b		; 8d 0b 05
B11_02f7:		lda $1a			; a5 1a
B11_02f9:		and #$df		; 29 df
B11_02fb:		sta $1a			; 85 1a
B11_02fd:		ldx #$0c		; a2 0c
B11_02ff:		lda #$40		; a9 40
B11_0301:		jsr func_13ef		; 20 ef f3
B11_0304:		jmp $a26e		; 4c 6e a2


B11_0307:		dec $1b			; c6 1b
B11_0309:		bne B11_0311 ; d0 06

B11_030b:		lda $1a			; a5 1a
B11_030d:		and #$7f		; 29 7f
B11_030f:		sta $1a			; 85 1a
B11_0311:		lda $1b			; a5 1b
B11_0313:		cmp #$0f		; c9 0f
B11_0315:		bne B11_031b ; d0 04

B11_0317:		ldx #$c0		; a2 c0
B11_0319:		stx $15			; 86 15
B11_031b:		lsr a			; 4a
B11_031c:		lsr a			; 4a
B11_031d:		tay				; a8 
B11_031e:		lda $a324, y	; b9 24 a3
B11_0321:		jmp updateEntity_wOam		; 4c 67 f5


B11_0324:		ror a			; 6a
B11_0325:		adc #$68		; 69 68
B11_0327:	.db $67
B11_0328:		ror $65			; 66 65
B11_032a:		jsr $86ef		; 20 ef 86
B11_032d:		bit $4a			; 24 4a
B11_032f:		bmi B11_0347 ; 30 16

B11_0331:		bvc B11_0354 ; 50 21

B11_0333:		lda $14			; a5 14
B11_0335:		beq B11_0354 ; f0 1d

B11_0337:		lda #$2a		; a9 2a
B11_0339:		jsr func_08fa		; 20 fa e8
B11_033c:		lda $14			; a5 14
B11_033e:		eor #$ff		; 49 ff
B11_0340:		sta $14			; 85 14
B11_0342:		inc $14			; e6 14
B11_0344:		jmp $a354		; 4c 54 a3


B11_0347:		lda $1d			; a5 1d
B11_0349:		clc				; 18 
B11_034a:		adc #$04		; 69 04
B11_034c:		bmi B11_0350 ; 30 02

B11_034e:		lda #$00		; a9 00
B11_0350:		sta $1d			; 85 1d
B11_0352:		sta $15			; 85 15
B11_0354:		rts				; 60 


B11_0355:		lda $050b		; ad 0b 05
B11_0358:		and #$03		; 29 03
B11_035a:		bne B11_039b ; d0 3f

B11_035c:		lda $14			; a5 14
B11_035e:		bpl B11_0365 ; 10 05

B11_0360:		eor #$ff		; 49 ff
B11_0362:		clc				; 18 
B11_0363:		adc #$01		; 69 01
B11_0365:		cmp #$18		; c9 18
B11_0367:		bcs B11_039b ; b0 32

B11_0369:		lda #$0c		; a9 0c
B11_036b:		sta $00			; 85 00
B11_036d:		sta $01			; 85 01
B11_036f:		jsr func_1a95		; 20 95 fa
B11_0372:		bcs B11_039b ; b0 27

B11_0374:		bit wJoy1NewButtonsPressed.w		; 2c 54 01
B11_0377:		bvc B11_039b ; 50 22

B11_0379:		lda $0509		; ad 09 05
B11_037c:		and #$10		; 29 10
B11_037e:		bne B11_039b ; d0 1b

B11_0380:		lda #$46		; a9 46
B11_0382:		jsr checkGlobalFlag		; 20 e9 e7
B11_0385:		bne B11_039b ; d0 14

B11_0387:		lda wEntityWramOffset.w		; ad 5b 01
B11_038a:		sta $0517		; 8d 17 05
B11_038d:		lda $050b		; ad 0b 05
B11_0390:		ora #$01		; 09 01
B11_0392:		sta $050b		; 8d 0b 05
B11_0395:		lda $1a			; a5 1a
B11_0397:		ora #$20		; 09 20
B11_0399:		sta $1a			; 85 1a
B11_039b:		rts				; 60 


B11_039c:		jsr func_0709		; 20 09 e7
B11_039f:		lda $015d		; ad 5d 01
B11_03a2:		beq B11_03a9 ; f0 05

B11_03a4:		lda #$00		; a9 00
B11_03a6:		sta $19			; 85 19
B11_03a8:		rts				; 60 


B11_03a9:		lda #$20		; a9 20
B11_03ab:		bit $1a			; 24 1a
B11_03ad:		beq B11_03b2 ; f0 03

B11_03af:		jmp $a286		; 4c 86 a2


B11_03b2:		bvc B11_03b7 ; 50 03

B11_03b4:		jmp $a2ef		; 4c ef a2


B11_03b7:		ldx #$0c		; a2 0c
B11_03b9:		lda #$c0		; a9 c0
B11_03bb:		jsr func_13ef		; 20 ef f3
B11_03be:		lda #$10		; a9 10
B11_03c0:		bit $1a			; 24 1a
B11_03c2:		bpl B11_03c7 ; 10 03

B11_03c4:		jmp $a307		; 4c 07 a3


B11_03c7:		bne B11_0418 ; d0 4f

B11_03c9:		jsr $a32a		; 20 2a a3
B11_03cc:		jsr $a448		; 20 48 a4
B11_03cf:		jsr $a355		; 20 55 a3
B11_03d2:		jsr $a3da		; 20 da a3
B11_03d5:		lda #$6a		; a9 6a
B11_03d7:		jmp updateEntity_wOam		; 4c 67 f5


B11_03da:		lda wEntityStructs.byteC.w		; ad 0c 04
B11_03dd:		bne B11_0417 ; d0 38

B11_03df:		lda $14			; a5 14
B11_03e1:		bpl B11_03e8 ; 10 05

B11_03e3:		eor #$ff		; 49 ff
B11_03e5:		clc				; 18 
B11_03e6:		adc #$01		; 69 01
B11_03e8:		cmp #$10		; c9 10
B11_03ea:		bcs B11_0417 ; b0 2b

B11_03ec:		lda #$0c		; a9 0c
B11_03ee:		sta $00			; 85 00
B11_03f0:		sta $01			; 85 01
B11_03f2:		lda #$00		; a9 00
B11_03f4:		sta $0163		; 8d 63 01
B11_03f7:		lda $015d		; ad 5d 01
B11_03fa:		bne B11_0417 ; d0 1b

B11_03fc:		lda wEntityStructs.byte7.w		; ad 07 04
B11_03ff:		sta $02			; 85 02
B11_0401:		lda wEntityStructs.byte6.w		; ad 06 04
B11_0404:		jsr func_170b		; 20 0b f7
B11_0407:		bcs B11_0417 ; b0 0e

B11_0409:		lda wEntityStructs.byteB.w		; ad 0b 04
B11_040c:		ora #$80		; 09 80
B11_040e:		sta wEntityStructs.byteB.w		; 8d 0b 04
B11_0411:		lda $1a			; a5 1a
B11_0413:		ora #$10		; 09 10
B11_0415:		sta $1a			; 85 1a
B11_0417:		rts				; 60 


B11_0418:		lda wEntityStructs.subY.w		; ad 03 04
B11_041b:		clc				; 18 
B11_041c:		adc #$c0		; 69 c0
B11_041e:		sta $13			; 85 13
B11_0420:		lda wEntityStructs.tileY.w		; ad 02 04
B11_0423:		adc #$ff		; 69 ff
B11_0425:		sta $12			; 85 12
B11_0427:		lda wEntityStructs.byte9.w		; ad 09 04
B11_042a:		and #$02		; 29 02
B11_042c:		bne B11_0435 ; d0 07

B11_042e:		ldx #$ff		; a2 ff
B11_0430:		lda #$60		; a9 60
B11_0432:		jmp $a439		; 4c 39 a4


B11_0435:		ldx #$00		; a2 00
B11_0437:		lda #$a0		; a9 a0
B11_0439:		clc				; 18 
B11_043a:		adc wEntityStructs.subX.w		; 6d 01 04
B11_043d:		sta $11			; 85 11
B11_043f:		txa				; 8a 
B11_0440:		adc wEntityStructs.tileX.w		; 6d 00 04
B11_0443:		sta $10			; 85 10
B11_0445:		jmp $a3d5		; 4c d5 a3


B11_0448:		lda #$00		; a9 00
B11_044a:		sta $0163		; 8d 63 01
B11_044d:		lda $14			; a5 14
B11_044f:		bpl B11_0456 ; 10 05

B11_0451:		eor #$ff		; 49 ff
B11_0453:		clc				; 18 
B11_0454:		adc #$01		; 69 01
B11_0456:		cmp #$18		; c9 18
B11_0458:		bcc B11_04b6 ; 90 5c

B11_045a:		lda #$0c		; a9 0c
B11_045c:		sta $00			; 85 00
B11_045e:		lda $1a			; a5 1a
B11_0460:		and #$01		; 29 01
B11_0462:		bne B11_04b8 ; d0 54

B11_0464:		lda $051c		; ad 1c 05
B11_0467:		bne B11_04b6 ; d0 4d

B11_0469:		lda $050b		; ad 0b 05
B11_046c:		and #$02		; 29 02
B11_046e:		beq B11_047c ; f0 0c

B11_0470:		lda $0507		; ad 07 05
B11_0473:		clc				; 18 
B11_0474:		adc #$08		; 69 08
B11_0476:		sta $02			; 85 02
B11_0478:		lda #$0c		; a9 0c
B11_047a:		bne B11_0483 ; d0 07

B11_047c:		lda $0507		; ad 07 05
B11_047f:		sta $02			; 85 02
B11_0481:		lda #$12		; a9 12
B11_0483:		sta $01			; 85 01
B11_0485:		lda $0506		; ad 06 05
B11_0488:		jsr func_170b		; 20 0b f7
B11_048b:		bcs B11_04b6 ; b0 29

B11_048d:		lda #$23		; a9 23
B11_048f:		jsr func_08fa		; 20 fa e8
B11_0492:		lda #$60		; a9 60
B11_0494:		sta $051c		; 8d 1c 05
B11_0497:		lda $2c			; a5 2c
B11_0499:		sec				; 38 
B11_049a:		sbc #$01		; e9 01
B11_049c:		sta $2c			; 85 2c
B11_049e:		and #$0f		; 29 0f
B11_04a0:		bne B11_04b6 ; d0 14

B11_04a2:		lda #$c0		; a9 c0
B11_04a4:		sta $0505		; 8d 05 05
B11_04a7:		lda #$ff		; a9 ff
B11_04a9:		sta $0163		; 8d 63 01
B11_04ac:		lda #$09		; a9 09
B11_04ae:		sta $0511		; 8d 11 05
B11_04b1:		jsr func_1c27		; 20 27 fc
B11_04b4:		clc				; 18 
B11_04b5:		rts				; 60 


B11_04b6:		sec				; 38 
B11_04b7:		rts				; 60 


B11_04b8:		bit wEntityStructs.byteB.w		; 2c 0b 04
B11_04bb:		bvs B11_04ea ; 70 2d

B11_04bd:		lda #$12		; a9 12
B11_04bf:		sta $01			; 85 01
B11_04c1:		lda wEntityStructs.byte7.w		; ad 07 04
B11_04c4:		sta $02			; 85 02
B11_04c6:		lda wEntityStructs.byte6.w		; ad 06 04
B11_04c9:		jsr func_170b		; 20 0b f7
B11_04cc:		bcs B11_04ea ; b0 1c

B11_04ce:		lda #$23		; a9 23
B11_04d0:		jsr func_08fa		; 20 fa e8
B11_04d3:		lda #$40		; a9 40
B11_04d5:		sta wEntityStructs.byteB.w		; 8d 0b 04
B11_04d8:		lda #$40		; a9 40
B11_04da:		sta wEntityStructs.byteC.w		; 8d 0c 04
B11_04dd:		lda $2d			; a5 2d
B11_04df:		sec				; 38 
B11_04e0:		sbc #$01		; e9 01
B11_04e2:		sta $2d			; 85 2d
B11_04e4:		and #$0f		; 29 0f
B11_04e6:		bne B11_04ea ; d0 02

B11_04e8:		clc				; 18 
B11_04e9:		rts				; 60 


B11_04ea:		sec				; 38 
B11_04eb:		rts				; 60 


B11_04ec:		jsr $81d6		; 20 d6 81
B11_04ef:		ldx #$0c		; a2 0c
B11_04f1:		lda #$40		; a9 40
B11_04f3:		jsr func_13ef		; 20 ef f3
B11_04f6:		lda $1a			; a5 1a
B11_04f8:		jmp updateEntity_wOam		; 4c 67 f5


B11_04fb:		rts				; 60 


B11_04fc:		lda $17			; a5 17
B11_04fe:		pha				; 48 
B11_04ff:		clc				; 18 
B11_0500:		adc #$28		; 69 28
B11_0502:		sta $17			; 85 17
B11_0504:		lda #$0c		; a9 0c
B11_0506:		sta $01			; 85 01
B11_0508:		lda #$08		; a9 08
B11_050a:		sta $00			; 85 00
B11_050c:		lda $0507		; ad 07 05
B11_050f:		sta $02			; 85 02
B11_0511:		lda $0506		; ad 06 05
B11_0514:		jsr func_170b		; 20 0b f7
B11_0517:		bcs B11_052e ; b0 15

B11_0519:		bit $20			; 24 20
B11_051b:		bvs B11_052e ; 70 11

B11_051d:		lda $10			; a5 10
B11_051f:		sta $0484		; 8d 84 04
B11_0522:		lda $11			; a5 11
B11_0524:		sta $0485		; 8d 85 04
B11_0527:		lda $050b		; ad 0b 05
B11_052a:		ora #$10		; 09 10
B11_052c:		bne B11_0533 ; d0 05

B11_052e:		lda $050b		; ad 0b 05
B11_0531:		and #$ef		; 29 ef
B11_0533:		sta $050b		; 8d 0b 05
B11_0536:		pla				; 68 
B11_0537:		sta $17			; 85 17
B11_0539:		rts				; 60 


B11_053a:		jsr $81c2		; 20 c2 81
B11_053d:		bit $1a			; 24 1a
B11_053f:		bmi B11_05bc ; 30 7b

B11_0541:		bvs B11_057a ; 70 37

B11_0543:		lda #$03		; a9 03
B11_0545:		jsr func_1b72		; 20 72 fb
B11_0548:		lda #$04		; a9 04
B11_054a:		jsr func_19a7		; 20 a7 f9
B11_054d:		lda #$0c		; a9 0c
B11_054f:		sta $00			; 85 00
B11_0551:		lda #$10		; a9 10
B11_0553:		sta $01			; 85 01
B11_0555:		jsr func_1a95		; 20 95 fa
B11_0558:		bcc B11_055f ; 90 05

B11_055a:		lda #$ca		; a9 ca
B11_055c:		jmp updateEntity_wOam		; 4c 67 f5


B11_055f:		lda #$31		; a9 31
B11_0561:		jsr func_08fa		; 20 fa e8
B11_0564:		lda #$ff		; a9 ff
B11_0566:		sta $97			; 85 97
B11_0568:		lda #$01		; a9 01
B11_056a:		sta $1a			; 85 1a
B11_056c:		lda #$5d		; a9 5d
B11_056e:		jsr setGlobalFlag		; 20 f0 e7
B11_0571:		lda #$80		; a9 80
B11_0573:		sta $1a			; 85 1a
B11_0575:		lda #$cb		; a9 cb
B11_0577:		jmp updateEntity_wOam		; 4c 67 f5


B11_057a:		lda $050a		; ad 0a 05
B11_057d:		and #$bf		; 29 bf
B11_057f:		sta $050a		; 8d 0a 05
B11_0582:		lda #$56		; a9 56
B11_0584:		jsr copyStaticLayoutIdxedYForNMIDataCopying		; 20 86 fc
B11_0587:		lda #$0e		; a9 0e
B11_0589:		jsr setGlobalFlag		; 20 f0 e7
B11_058c:		lda #$5d		; a9 5d
B11_058e:		jsr unsetGlobalFlag		; 20 fc e7
B11_0591:		ldy #$17		; a0 17
B11_0593:		lda $a652, y	; b9 52 a6
B11_0596:		tax				; aa 
B11_0597:		lda #$00		; a9 00
B11_0599:		sta $0600, x	; 9d 00 06
B11_059c:		dey				; 88 
B11_059d:		bpl B11_0593 ; 10 f4

B11_059f:		ldy #$13		; a0 13
B11_05a1:		lda $a66a, y	; b9 6a a6
B11_05a4:		tax				; aa 
B11_05a5:		lda #$01		; a9 01
B11_05a7:		sta $0600, x	; 9d 00 06
B11_05aa:		dey				; 88 
B11_05ab:		bpl B11_05a1 ; 10 f4

B11_05ad:		lda #$8f		; a9 8f
B11_05af:		sta $4f			; 85 4f
B11_05b1:		lda $050a		; ad 0a 05
B11_05b4:		and #$bf		; 29 bf
B11_05b6:		sta $050a		; 8d 0a 05
B11_05b9:		jmp $8824		; 4c 24 88


B11_05bc:		lda #$cb		; a9 cb
B11_05be:		jsr updateEntity_wOam		; 20 67 f5
B11_05c1:		ldy #$03		; a0 03
B11_05c3:		lda $1b			; a5 1b
B11_05c5:		cmp $a67e, y	; d9 7e a6
B11_05c8:		beq B11_05ec ; f0 22

B11_05ca:		dey				; 88 
B11_05cb:		bpl B11_05c5 ; 10 f8

B11_05cd:		ldy #$02		; a0 02
B11_05cf:		cmp $a682, y	; d9 82 a6
B11_05d2:		beq B11_05d9 ; f0 05

B11_05d4:		dey				; 88 
B11_05d5:		bpl B11_05cf ; 10 f8

B11_05d7:		bmi B11_0616 ; 30 3d

B11_05d9:		sty $1c			; 84 1c
B11_05db:		lda $a684, y	; b9 84 a6
B11_05de:		jsr copyStaticLayoutIdxedYForNMIDataCopying		; 20 86 fc
B11_05e1:		ldy $1c			; a4 1c
B11_05e3:		lda $a686, y	; b9 86 a6
B11_05e6:		jsr copyStaticLayoutIdxedYForNMIDataCopying		; 20 86 fc
B11_05e9:		jmp $a616		; 4c 16 a6


B11_05ec:		tya				; 98 
B11_05ed:		asl a			; 0a
B11_05ee:		tay				; a8 
B11_05ef:		lda $a63f, y	; b9 3f a6
B11_05f2:		sta $0e			; 85 0e
B11_05f4:		lda $a63e, y	; b9 3e a6
B11_05f7:		sta $0f			; 85 0f
B11_05f9:		sty $1c			; 84 1c
B11_05fb:		lda #$48		; a9 48
B11_05fd:		jsr copyStaticLayoutIdxedYForNMIDataCopyingAtCurrPPUAddr		; 20 96 fc
B11_0600:		ldy $1c			; a4 1c
B11_0602:		lda $a647, y	; b9 47 a6
B11_0605:		sta $0e			; 85 0e
B11_0607:		lda $a646, y	; b9 46 a6
B11_060a:		sta $0f			; 85 0f
B11_060c:		lsr $1c			; 46 1c
B11_060e:		ldy $1c			; a4 1c
B11_0610:		lda $a64e, y	; b9 4e a6
B11_0613:		jsr copyStaticLayoutIdxedYForNMIDataCopyingAtCurrPPUAddr		; 20 96 fc
B11_0616:		lda $1b			; a5 1b
B11_0618:		cmp #$14		; c9 14
B11_061a:		beq B11_0639 ; f0 1d

B11_061c:		lda $015a		; ad 5a 01
B11_061f:		and #$1f		; 29 1f
B11_0621:		bne B11_063d ; d0 1a

B11_0623:		lda $1b			; a5 1b
B11_0625:		sta $0f			; 85 0f
B11_0627:		lda #$57		; a9 57
B11_0629:		jsr $8033		; 20 33 80
B11_062c:		inc $1b			; e6 1b
B11_062e:		lda $1b			; a5 1b
B11_0630:		and #$07		; 29 07
B11_0632:		sta $0f			; 85 0f
B11_0634:		lda #$38		; a9 38
B11_0636:		jmp $8033		; 4c 33 80


B11_0639:		lda #$40		; a9 40
B11_063b:		sta $1a			; 85 1a
B11_063d:		rts				; 60 


B11_063e:		php				; 08 
B11_063f:		bit $48			; 24 48
B11_0641:		bit $88			; 24 88
B11_0643:		bit $c8			; 24 c8
B11_0645:		bit $c2			; 24 c2
B11_0647:	.db $27
B11_0648:	.db $c2
B11_0649:	.db $27
B11_064a:		dex				; ca 
B11_064b:	.db $27
B11_064c:		dex				; ca 
B11_064d:	.db $27
B11_064e:		eor $56, x		; 55 56
B11_0650:		eor $56, x		; 55 56
B11_0652:	.db $04
B11_0653:		ora $06			; 05 06
B11_0655:	.db $07
B11_0656:	.db $14
B11_0657:		ora $16, x		; 15 16
B11_0659:	.db $17
B11_065a:		bit $25			; 24 25
B11_065c:		rol $27			; 26 27
B11_065e:	.db $34
B11_065f:		and $36, x		; 35 36
B11_0661:	.db $37
B11_0662:	.db $44
B11_0663:		eor $46			; 45 46
B11_0665:	.db $47
B11_0666:	.db $54
B11_0667:		eor $56, x		; 55 56
B11_0669:	.db $57
B11_066a:		cpy $c5			; c4 c5
B11_066c:		dec $c7			; c6 c7
B11_066e:		iny				; c8 
B11_066f:		cmp #$ca		; c9 ca
B11_0671:	.db $cb
B11_0672:		cpy $d4cd		; cc cd d4
B11_0675:		cmp $d6, x		; d5 d6
B11_0677:	.db $d7
B11_0678:		cld				; d8 
B11_0679:		cmp $dbda, y	; d9 da db
B11_067c:	.db $dc
B11_067d:		cmp $0a05, x	; dd 05 0a
B11_0680:	.db $0f
B11_0681:	.db $14
B11_0682:		ora #$13		; 09 13
B11_0684:		bvc B11_06d7 ; 50 51

B11_0686:	.db $52
B11_0687:		lsr $20, x		; 56 20
B11_0689:	.db $c2
B11_068a:		sta ($24, x)	; 81 24
B11_068c:	.db $1a
B11_068d:		bmi B11_06c4 ; 30 35

B11_068f:		bvs B11_06d8 ; 70 47

B11_0691:		lda #$03		; a9 03
B11_0693:		jsr func_1b72		; 20 72 fb
B11_0696:		lda #$04		; a9 04
B11_0698:		jsr func_19a7		; 20 a7 f9
B11_069b:		lda #$08		; a9 08
B11_069d:		sta $00			; 85 00
B11_069f:		lda #$0e		; a9 0e
B11_06a1:		sta $01			; 85 01
B11_06a3:		jsr func_1a95		; 20 95 fa
B11_06a6:		bcc B11_06ad ; 90 05

B11_06a8:		lda #$bf		; a9 bf
B11_06aa:		jmp updateEntity_wOam		; 4c 67 f5


B11_06ad:		lda #$31		; a9 31
B11_06af:		jsr func_08fa		; 20 fa e8
B11_06b2:		lda #$ff		; a9 ff
B11_06b4:		sta $97			; 85 97
B11_06b6:		lda #$c0		; a9 c0
B11_06b8:		sta $0505		; 8d 05 05
B11_06bb:		lda #$40		; a9 40
B11_06bd:		sta $1a			; 85 1a
B11_06bf:		lda #$c0		; a9 c0
B11_06c1:		jmp updateEntity_wOam		; 4c 67 f5


B11_06c4:		jsr $89ce		; 20 ce 89
B11_06c7:		lda $00			; a5 00
B11_06c9:		cmp #$14		; c9 14
B11_06cb:		bcs B11_06d7 ; b0 0a

B11_06cd:		lda $01			; a5 01
B11_06cf:		cmp #$12		; c9 12
B11_06d1:		bcs B11_06d7 ; b0 04

B11_06d3:		lda #$00		; a9 00
B11_06d5:		sta $1a			; 85 1a
B11_06d7:		rts				; 60 


B11_06d8:		lda #$c0		; a9 c0
B11_06da:		jsr updateEntity_wOam		; 20 67 f5
B11_06dd:		ldx #$00		; a2 00
B11_06df:		lda #$0f		; a9 0f
B11_06e1:		sta $01b0		; 8d b0 01
B11_06e4:		sta $01b4		; 8d b4 01
B11_06e7:		sta $01b8		; 8d b8 01
B11_06ea:		sta $01bc		; 8d bc 01
B11_06ed:		lda $a712, x	; bd 12 a7
B11_06f0:		sta $01a0, x	; 9d a0 01
B11_06f3:		inx				; e8 
B11_06f4:		cpx #$10		; e0 10
B11_06f6:		bne B11_06ed ; d0 f5

B11_06f8:		lda #$18		; a9 18
B11_06fa:		jsr func_05cb		; 20 cb e5
B11_06fd:		lda #$20		; a9 20
B11_06ff:		jsr $8b04		; 20 04 8b
B11_0702:		jsr $8824		; 20 24 88
B11_0705:		lda $050a		; ad 0a 05
B11_0708:		and #$bf		; 29 bf
B11_070a:		sta $050a		; 8d 0a 05
B11_070d:		lda #$0f		; a9 0f
B11_070f:		jmp setGlobalFlag		; 4c f0 e7


B11_0712:	.db $0f
B11_0713:		rol $05			; 26 05
B11_0715:		plp				; 28 
B11_0716:	.db $0f
B11_0717:	.db $17
B11_0718:		and #$31		; 29 31
B11_071a:	.db $0f
B11_071b:		;removed
	.db $30 $22

B11_071d:		and ($0f), y	; 31 0f
B11_071f:		;removed
	.db $30 $01

B11_0721:		and ($20), y	; 31 20
B11_0723:	.db $c2
B11_0724:		sta ($a9, x)	; 81 a9
B11_0726:		jsr $1a24		; 20 24 1a
B11_0729:		bmi B11_0767 ; 30 3c

B11_072b:		bvc B11_0730 ; 50 03

B11_072d:		jmp $a82b		; 4c 2b a8


B11_0730:		beq B11_073e ; f0 0c

B11_0732:		jsr $89ce		; 20 ce 89
B11_0735:		lda $00			; a5 00
B11_0737:		cmp #$40		; c9 40
B11_0739:		bcs B11_073e ; b0 03

B11_073b:		jmp $a883		; 4c 83 a8


B11_073e:		lda #$03		; a9 03
B11_0740:		jsr func_19a7		; 20 a7 f9
B11_0743:		lda #$06		; a9 06
B11_0745:		sta $00			; 85 00
B11_0747:		lda #$12		; a9 12
B11_0749:		sta $01			; 85 01
B11_074b:		jsr func_1a95		; 20 95 fa
B11_074e:		bcc B11_0755 ; 90 05

B11_0750:		lda #$c1		; a9 c1
B11_0752:		jmp updateEntity_wOam		; 4c 67 f5


B11_0755:		lda #$31		; a9 31
B11_0757:		jsr func_08fa		; 20 fa e8
B11_075a:		lda #$ff		; a9 ff
B11_075c:		sta $97			; 85 97
B11_075e:		lda #$80		; a9 80
B11_0760:		sta $1a			; 85 1a
B11_0762:		lda #$c2		; a9 c2
B11_0764:		jmp updateEntity_wOam		; 4c 67 f5


B11_0767:		lda $16			; a5 16
B11_0769:		sec				; 38 
B11_076a:		sbc #$08		; e9 08
B11_076c:		sta $16			; 85 16
B11_076e:		lda $17			; a5 17
B11_0770:		clc				; 18 
B11_0771:		adc #$10		; 69 10
B11_0773:		sta $17			; 85 17
B11_0775:		lda #$22		; a9 22
B11_0777:		sta $1d			; 85 1d
B11_0779:		lda #$52		; a9 52
B11_077b:		sta $1f			; 85 1f
B11_077d:		jsr $8b11		; 20 11 8b
B11_0780:		lda #$00		; a9 00
B11_0782:		sta $00			; 85 00
B11_0784:		lda #$01		; a9 01
B11_0786:		sta $01			; 85 01
B11_0788:		jsr $86fb		; 20 fb 86
B11_078b:		bcs B11_0797 ; b0 0a

B11_078d:		lda #$80		; a9 80
B11_078f:		sta wNextUsableOamIdx.w		; 8d 58 01
B11_0792:		lda #$c3		; a9 c3
B11_0794:		jsr updateEntity_wOam		; 20 67 f5
B11_0797:		jsr func_052e		; 20 2e e5
B11_079a:		dec $1b			; c6 1b
B11_079c:		bne B11_077d ; d0 df

B11_079e:		lda #$08		; a9 08
B11_07a0:		sta $1b			; 85 1b
B11_07a2:		dec $1c			; c6 1c
B11_07a4:		beq B11_07c2 ; f0 1c

B11_07a6:		lda $1d			; a5 1d
B11_07a8:		sta $0e			; 85 0e
B11_07aa:		lda $1f			; a5 1f
B11_07ac:		sta $0f			; 85 0f
B11_07ae:		lda $1c			; a5 1c
B11_07b0:		eor #$03		; 49 03
B11_07b2:		and #$03		; 29 03
B11_07b4:		clc				; 18 
B11_07b5:		adc #$3c		; 69 3c
B11_07b7:		jsr copyStaticLayoutIdxedYForNMIDataCopyingAtCurrPPUAddr		; 20 96 fc
B11_07ba:		lda #$20		; a9 20
B11_07bc:		jsr $a892		; 20 92 a8
B11_07bf:		jmp $a77d		; 4c 7d a7


B11_07c2:		lda #$40		; a9 40
B11_07c4:		jsr $8b04		; 20 04 8b
B11_07c7:		lda #$06		; a9 06
B11_07c9:		sta $1c			; 85 1c
B11_07cb:		lda #$23		; a9 23
B11_07cd:		sta $1d			; 85 1d
B11_07cf:		sta $0e			; 85 0e
B11_07d1:		lda #$68		; a9 68
B11_07d3:		sta $1f			; 85 1f
B11_07d5:		sta $0f			; 85 0f
B11_07d7:		lda #$4b		; a9 4b
B11_07d9:		jsr copyStaticLayoutIdxedYForNMIDataCopyingAtCurrPPUAddr		; 20 96 fc
B11_07dc:		jsr func_052e		; 20 2e e5
B11_07df:		lda #$04		; a9 04
B11_07e1:		jsr $a892		; 20 92 a8
B11_07e4:		lda #$4b		; a9 4b
B11_07e6:		jsr copyStaticLayoutIdxedYForNMIDataCopyingAtCurrPPUAddr		; 20 96 fc
B11_07e9:		jsr func_052e		; 20 2e e5
B11_07ec:		lda #$04		; a9 04
B11_07ee:		jsr $a892		; 20 92 a8
B11_07f1:		lda #$4c		; a9 4c
B11_07f3:		jsr copyStaticLayoutIdxedYForNMIDataCopyingAtCurrPPUAddr		; 20 96 fc
B11_07f6:		jsr func_052e		; 20 2e e5
B11_07f9:		lda #$04		; a9 04
B11_07fb:		jsr $a892		; 20 92 a8
B11_07fe:		lda #$4b		; a9 4b
B11_0800:		jsr copyStaticLayoutIdxedYForNMIDataCopyingAtCurrPPUAddr		; 20 96 fc
B11_0803:		jsr func_052e		; 20 2e e5
B11_0806:		lda #$04		; a9 04
B11_0808:		jsr $a892		; 20 92 a8
B11_080b:		lda #$4e		; a9 4e
B11_080d:		jsr copyStaticLayoutIdxedYForNMIDataCopyingAtCurrPPUAddr		; 20 96 fc
B11_0810:		jsr func_052e		; 20 2e e5
B11_0813:		lda #$d0		; a9 d0
B11_0815:		jsr $a892		; 20 92 a8
B11_0818:		lda #$20		; a9 20
B11_081a:		jsr $8b04		; 20 04 8b
B11_081d:		dec $1c			; c6 1c
B11_081f:		bne B11_07d7 ; d0 b6

B11_0821:		lda #$80		; a9 80
B11_0823:		jsr $8b04		; 20 04 8b
B11_0826:		lda #$40		; a9 40
B11_0828:		sta $1a			; 85 1a
B11_082a:		rts				; 60 


B11_082b:		lda #$0d		; a9 0d
B11_082d:		jsr setGlobalFlag		; 20 f0 e7
B11_0830:		lda #$22		; a9 22
B11_0832:		sta $1d			; 85 1d
B11_0834:		sta $0e			; 85 0e
B11_0836:		lda #$52		; a9 52
B11_0838:		sta $1f			; 85 1f
B11_083a:		sta $0f			; 85 0f
B11_083c:		lda #$4d		; a9 4d
B11_083e:		jsr copyStaticLayoutIdxedYForNMIDataCopyingAtCurrPPUAddr		; 20 96 fc
B11_0841:		lda #$40		; a9 40
B11_0843:		jsr $a892		; 20 92 a8
B11_0846:		lda #$10		; a9 10
B11_0848:		jsr $8b04		; 20 04 8b
B11_084b:		lda #$4d		; a9 4d
B11_084d:		jsr copyStaticLayoutIdxedYForNMIDataCopyingAtCurrPPUAddr		; 20 96 fc
B11_0850:		lda #$3e		; a9 3e
B11_0852:		jsr $a892		; 20 92 a8
B11_0855:		lda #$10		; a9 10
B11_0857:		jsr $8b04		; 20 04 8b
B11_085a:		lda #$4b		; a9 4b
B11_085c:		jsr copyStaticLayoutIdxedYForNMIDataCopyingAtCurrPPUAddr		; 20 96 fc
B11_085f:		lda #$a0		; a9 a0
B11_0861:		jsr $8b04		; 20 04 8b
B11_0864:		lda #$81		; a9 81
B11_0866:		sta $4f			; 85 4f
B11_0868:		lda $10			; a5 10
B11_086a:		and #$0f		; 29 0f
B11_086c:		ora #$c0		; 09 c0
B11_086e:		sta $10			; 85 10
B11_0870:		lda $12			; a5 12
B11_0872:		and #$0f		; 29 0f
B11_0874:		ora #$30		; 09 30
B11_0876:		sta $12			; 85 12
B11_0878:		lda $050a		; ad 0a 05
B11_087b:		and #$bf		; 29 bf
B11_087d:		sta $050a		; 8d 0a 05
B11_0880:		jmp $8824		; 4c 24 88


B11_0883:		lda #$08		; a9 08
B11_0885:		jsr displayTextIdxedA		; 20 72 87
B11_0888:		lda #$c1		; a9 c1
B11_088a:		jsr updateEntity_wOam		; 20 67 f5
B11_088d:		lda #$00		; a9 00
B11_088f:		sta $1a			; 85 1a
B11_0891:		rts				; 60 


B11_0892:		sta $00			; 85 00
B11_0894:		clc				; 18 
B11_0895:		adc $1f			; 65 1f
B11_0897:		sta $1f			; 85 1f
B11_0899:		sta $0f			; 85 0f
B11_089b:		lda $00			; a5 00
B11_089d:		bmi B11_08a8 ; 30 09

B11_089f:		lda #$00		; a9 00
B11_08a1:		adc $1d			; 65 1d
B11_08a3:		sta $1d			; 85 1d
B11_08a5:		sta $0e			; 85 0e
B11_08a7:		rts				; 60 


B11_08a8:		lda #$ff		; a9 ff
B11_08aa:		bne B11_08a1 ; d0 f5

B11_08ac:		jsr $81c2		; 20 c2 81
B11_08af:		lda #$56		; a9 56
B11_08b1:		jsr checkGlobalFlag		; 20 e9 e7
B11_08b4:		bne B11_08ce ; d0 18

B11_08b6:		bit $1a			; 24 1a
B11_08b8:		bmi B11_08cf ; 30 15

B11_08ba:		lda #$20		; a9 20
B11_08bc:		sta $00			; 85 00
B11_08be:		lda #$20		; a9 20
B11_08c0:		sta $01			; 85 01
B11_08c2:		jsr func_1a95		; 20 95 fa
B11_08c5:		bcs B11_08ce ; b0 07

B11_08c7:		lda #$80		; a9 80
B11_08c9:		sta $1a			; 85 1a
B11_08cb:		jmp func_a_0789		; 4c 89 87


B11_08ce:		rts				; 60 


B11_08cf:		lda #$05		; a9 05
B11_08d1:		jsr checkGlobalFlag		; 20 e9 e7
B11_08d4:		beq B11_08e4 ; f0 0e

B11_08d6:		lda #$06		; a9 06
B11_08d8:		jsr checkGlobalFlag		; 20 e9 e7
B11_08db:		beq B11_08e4 ; f0 07

B11_08dd:		lda #$07		; a9 07
B11_08df:		jsr checkGlobalFlag		; 20 e9 e7
B11_08e2:		bne B11_08f2 ; d0 0e

B11_08e4:		lda #$11		; a9 11
B11_08e6:		jsr displayTextIdxedA		; 20 72 87
B11_08e9:		lda #$00		; a9 00
B11_08eb:		sta $19			; 85 19
B11_08ed:		lda $1e			; a5 1e
B11_08ef:		jmp unsetGlobalFlag		; 4c fc e7


B11_08f2:		lda #$12		; a9 12
B11_08f4:		jsr displayTextIdxedA		; 20 72 87
B11_08f7:		lda #$31		; a9 31
B11_08f9:		jsr func_08fa		; 20 fa e8
B11_08fc:		lda #$ff		; a9 ff
B11_08fe:		sta $97			; 85 97
B11_0900:		lda #$40		; a9 40
B11_0902:		jsr copyStaticLayoutIdxedYForNMIDataCopying		; 20 86 fc
B11_0905:		jsr func_052e		; 20 2e e5
B11_0908:		lda #$41		; a9 41
B11_090a:		jsr copyStaticLayoutIdxedYForNMIDataCopying		; 20 86 fc
B11_090d:		ldx #$10		; a2 10
B11_090f:		jsr func_0530		; 20 30 e5
B11_0912:		lda #$42		; a9 42
B11_0914:		jsr copyStaticLayoutIdxedYForNMIDataCopying		; 20 86 fc
B11_0917:		jsr func_052e		; 20 2e e5
B11_091a:		lda #$43		; a9 43
B11_091c:		jsr copyStaticLayoutIdxedYForNMIDataCopying		; 20 86 fc
B11_091f:		ldx #$10		; a2 10
B11_0921:		jsr func_0530		; 20 30 e5
B11_0924:		lda #$44		; a9 44
B11_0926:		jsr copyStaticLayoutIdxedYForNMIDataCopying		; 20 86 fc
B11_0929:		jsr func_052e		; 20 2e e5
B11_092c:		lda #$45		; a9 45
B11_092e:		jsr copyStaticLayoutIdxedYForNMIDataCopying		; 20 86 fc
B11_0931:		ldx #$10		; a2 10
B11_0933:		jsr func_0530		; 20 30 e5
B11_0936:		lda #$46		; a9 46
B11_0938:		jsr copyStaticLayoutIdxedYForNMIDataCopying		; 20 86 fc
B11_093b:		jsr func_052e		; 20 2e e5
B11_093e:		lda #$47		; a9 47
B11_0940:		jsr copyStaticLayoutIdxedYForNMIDataCopying		; 20 86 fc
B11_0943:		ldx #$40		; a2 40
B11_0945:		jsr func_0530		; 20 30 e5
B11_0948:		lda #$00		; a9 00
B11_094a:		sta $19			; 85 19
B11_094c:		lda $1e			; a5 1e
B11_094e:		jsr unsetGlobalFlag		; 20 fc e7
.ifdef ROM_JP
	ldx #$c0
.else
B11_0951:		ldx #$98		; a2 98
.endif
B11_0953:		jsr func_0530		; 20 30 e5
B11_0956:		jmp $df17		; 4c 17 df


B11_0959:		jsr $81c2		; 20 c2 81
B11_095c:		bit $1a			; 24 1a
B11_095e:		bmi B11_099b ; 30 3b

B11_0960:		lda #$6d		; a9 6d
B11_0962:		jsr updateEntity_wOam		; 20 67 f5
B11_0965:		lda #$02		; a9 02
B11_0967:		jsr func_19a7		; 20 a7 f9
B11_096a:		lda #$00		; a9 00
B11_096c:		jsr func_1b72		; 20 72 fb
B11_096f:		lda #$46		; a9 46
B11_0971:		jsr checkGlobalFlag		; 20 e9 e7
B11_0974:		bne B11_099a ; d0 24

B11_0976:		lda $051a		; ad 1a 05
B11_0979:		bne B11_099a ; d0 1f

B11_097b:		lda #$0c		; a9 0c
B11_097d:		sta $00			; 85 00
B11_097f:		lda #$12		; a9 12
B11_0981:		sta $01			; 85 01
B11_0983:		jsr func_1a95		; 20 95 fa
B11_0986:		bcs B11_099a ; b0 12

B11_0988:		lda #$53		; a9 53
B11_098a:		jsr setGlobalFlag		; 20 f0 e7
B11_098d:		lda #$80		; a9 80
B11_098f:		sta $1a			; 85 1a
B11_0991:		lda #$40		; a9 40
B11_0993:		sta $1b			; 85 1b
B11_0995:		lda #$3e		; a9 3e
B11_0997:		jsr func_08fa		; 20 fa e8
B11_099a:		rts				; 60 


B11_099b:		dec $1b			; c6 1b
B11_099d:		bne B11_09a3 ; d0 04

B11_099f:		lda #$00		; a9 00
B11_09a1:		sta $1a			; 85 1a
B11_09a3:		lda #$6e		; a9 6e
B11_09a5:		jmp updateEntity_wOam		; 4c 67 f5


B11_09a8:		dec $1b			; c6 1b
B11_09aa:		bne B11_09b1 ; d0 05

B11_09ac:		lda #$00		; a9 00
B11_09ae:		sta $19			; 85 19
B11_09b0:		rts				; 60 


B11_09b1:		lda #$06		; a9 06
B11_09b3:		jsr updateEntity_wOam		; 20 67 f5
B11_09b6:		jmp func_0709		; 4c 09 e7


B11_09b9:		dec $1b			; c6 1b
B11_09bb:		bne B11_09c5 ; d0 08

B11_09bd:		jsr $8838		; 20 38 88
B11_09c0:		lda #$4a		; a9 4a
B11_09c2:		jmp unsetGlobalFlag		; 4c fc e7


B11_09c5:		lda #$00		; a9 00
B11_09c7:		jsr func_13ef		; 20 ef f3
B11_09ca:		jsr func_0709		; 20 09 e7
B11_09cd:		lda $015d		; ad 5d 01
B11_09d0:		beq B11_09d3 ; f0 01

B11_09d2:		rts				; 60 


B11_09d3:		lda $0506		; ad 06 05
B11_09d6:		sta $00			; 85 00
B11_09d8:		lda $0507		; ad 07 05
B11_09db:		sec				; 38 
B11_09dc:		sbc #$14		; e9 14
B11_09de:		sta $01			; 85 01
B11_09e0:		lda #$06		; a9 06
B11_09e2:		sta $02			; 85 02
B11_09e4:		jsr $88a8		; 20 a8 88
B11_09e7:		lda $1b			; a5 1b
B11_09e9:		cmp #$20		; c9 20
B11_09eb:		bcs B11_09f1 ; b0 04

B11_09ed:		and #$01		; 29 01
B11_09ef:		bne B11_09d2 ; d0 e1

B11_09f1:		lda #$6c		; a9 6c
B11_09f3:		jmp updateEntity_wOam		; 4c 67 f5


B11_09f6:		lda #$00		; a9 00
B11_09f8:		jsr func_13ef		; 20 ef f3
B11_09fb:		jsr func_0709		; 20 09 e7
B11_09fe:		lda $015d		; ad 5d 01
B11_0a01:		beq B11_0a06 ; f0 03

B11_0a03:		jmp $aa33		; 4c 33 aa


B11_0a06:		bit $1a			; 24 1a
B11_0a08:		bpl B11_0a3c ; 10 32

B11_0a0a:		lda $0506		; ad 06 05
B11_0a0d:		sta $00			; 85 00
B11_0a0f:		lda $0507		; ad 07 05
B11_0a12:		sta $01			; 85 01
B11_0a14:		jsr $823c		; 20 3c 82
B11_0a17:		ldx #$03		; a2 03
B11_0a19:		stx $01			; 86 01
B11_0a1b:		jsr $8604		; 20 04 86
B11_0a1e:		lda $01			; a5 01
B11_0a20:		sta $14			; 85 14
B11_0a22:		lda $02			; a5 02
B11_0a24:		sta $15			; 85 15
B11_0a26:		lda #$08		; a9 08
B11_0a28:		sta $00			; 85 00
B11_0a2a:		lda #$10		; a9 10
B11_0a2c:		sta $01			; 85 01
B11_0a2e:		jsr func_1a95		; 20 95 fa
B11_0a31:		bcs B11_0a65 ; b0 32

B11_0a33:		lda #$00		; a9 00
B11_0a35:		sta $19			; 85 19
B11_0a37:		lda #$46		; a9 46
B11_0a39:		jmp unsetGlobalFlag		; 4c fc e7


B11_0a3c:		lda $16			; a5 16
B11_0a3e:		sec				; 38 
B11_0a3f:		sbc $0506		; ed06 05
B11_0a42:		bpl B11_0a49 ; 10 05

B11_0a44:		eor #$ff		; 49 ff
B11_0a46:		clc				; 18 
B11_0a47:		adc #$01		; 69 01
B11_0a49:		cmp #$40		; c9 40
B11_0a4b:		bcs B11_0a61 ; b0 14

B11_0a4d:		lda $17			; a5 17
B11_0a4f:		sec				; 38 
B11_0a50:		sbc #$08		; e9 08
B11_0a52:		sec				; 38 
B11_0a53:		sbc $0507		; ed07 05
B11_0a56:		bpl B11_0a5d ; 10 05

B11_0a58:		eor #$ff		; 49 ff
B11_0a5a:		clc				; 18 
B11_0a5b:		adc #$01		; 69 01
B11_0a5d:		cmp #$40		; c9 40
B11_0a5f:		bcc B11_0a65 ; 90 04

B11_0a61:		lda #$80		; a9 80
B11_0a63:		sta $1a			; 85 1a
B11_0a65:		lda $0506		; ad 06 05
B11_0a68:		sec				; 38 
B11_0a69:		sbc $16			; e5 16
B11_0a6b:		bcc B11_0a72 ; 90 05

B11_0a6d:		lsr a			; 4a
B11_0a6e:		lsr a			; 4a
B11_0a6f:		jmp $aa76		; 4c 76 aa


B11_0a72:		sec				; 38 
B11_0a73:		ror a			; 6a
B11_0a74:		sec				; 38 
B11_0a75:		ror a			; 6a
B11_0a76:		sta $1d			; 85 1d
B11_0a78:		lda $0507		; ad 07 05
B11_0a7b:		sec				; 38 
B11_0a7c:		sbc $17			; e5 17
B11_0a7e:		bcc B11_0a85 ; 90 05

B11_0a80:		lsr a			; 4a
B11_0a81:		lsr a			; 4a
B11_0a82:		jmp $aa89		; 4c 89 aa


B11_0a85:		sec				; 38 
B11_0a86:		ror a			; 6a
B11_0a87:		sec				; 38 
B11_0a88:		ror a			; 6a
B11_0a89:		sta $1e			; 85 1e
B11_0a8b:		lda $16			; a5 16
B11_0a8d:		pha				; 48 
B11_0a8e:		lda $17			; a5 17
B11_0a90:		pha				; 48 
B11_0a91:		lda $1c			; a5 1c
B11_0a93:		pha				; 48 
B11_0a94:		lda $16			; a5 16
B11_0a96:		clc				; 18 
B11_0a97:		adc $1d			; 65 1d
B11_0a99:		sta $16			; 85 16
B11_0a9b:		lda $17			; a5 17
B11_0a9d:		clc				; 18 
B11_0a9e:		adc $1e			; 65 1e
B11_0aa0:		sta $17			; 85 17
B11_0aa2:		lda #$3a		; a9 3a
B11_0aa4:		jsr func_1596		; 20 96 f5
B11_0aa7:		dec $1c			; c6 1c
B11_0aa9:		bne B11_0a94 ; d0 e9

B11_0aab:		pla				; 68 
B11_0aac:		sta $1c			; 85 1c
B11_0aae:		pla				; 68 
B11_0aaf:		sta $17			; 85 17
B11_0ab1:		pla				; 68 
B11_0ab2:		sta $16			; 85 16
B11_0ab4:		lda #$3b		; a9 3b
B11_0ab6:		jmp func_1596		; 4c 96 f5


B11_0ab9:		jsr $81c2		; 20 c2 81
B11_0abc:		bit $1a			; 24 1a
B11_0abe:		bmi B11_0afe ; 30 3e

B11_0ac0:		ldx #$0e		; a2 0e
B11_0ac2:		lda #$c0		; a9 c0
B11_0ac4:		jsr func_13ef		; 20 ef f3
B11_0ac7:		lda $18			; a5 18
B11_0ac9:		cmp #$02		; c9 02
B11_0acb:		bne B11_0ace ; d0 01

B11_0acd:		rts				; 60 


B11_0ace:		bit $4a			; 24 4a
B11_0ad0:		bvc B11_0ae4 ; 50 12

B11_0ad2:		lda $1a			; a5 1a
B11_0ad4:		and #$02		; 29 02
B11_0ad6:		bne B11_0ade ; d0 06

B11_0ad8:		lda $1a			; a5 1a
B11_0ada:		ora #$02		; 09 02
B11_0adc:		bne B11_0ae2 ; d0 04

B11_0ade:		lda $1a			; a5 1a
B11_0ae0:		and #$fd		; 29 fd
B11_0ae2:		sta $1a			; 85 1a
B11_0ae4:		lda $4a			; a5 4a
B11_0ae6:		and #$1c		; 29 1c
B11_0ae8:		sta $00			; 85 00
B11_0aea:		lda $1a			; a5 1a
B11_0aec:		and #$e3		; 29 e3
B11_0aee:		ora $00			; 05 00
B11_0af0:		sta $1a			; 85 1a
B11_0af2:		and #$02		; 29 02
B11_0af4:		beq B11_0afa ; f0 04

B11_0af6:		lda #$e0		; a9 e0
B11_0af8:		bne B11_0afc ; d0 02

B11_0afa:		lda #$20		; a9 20
B11_0afc:		sta $14			; 85 14
B11_0afe:		lda $1a			; a5 1a
B11_0b00:		and #$0c		; 29 0c
B11_0b02:		beq B11_0b17 ; f0 13

B11_0b04:		lda $1a			; a5 1a
B11_0b06:		and #$10		; 29 10
B11_0b08:		beq B11_0b11 ; f0 07

B11_0b0a:		lda $19			; a5 19
B11_0b0c:		and #$fd		; 29 fd
B11_0b0e:		jmp $ab15		; 4c 15 ab


B11_0b11:		lda $19			; a5 19
B11_0b13:		ora #$02		; 09 02
B11_0b15:		sta $19			; 85 19
B11_0b17:		bit $1a			; 24 1a
B11_0b19:		bvs B11_0b30 ; 70 15

B11_0b1b:		ldy #$00		; a0 00
B11_0b1d:		lda $1a			; a5 1a
B11_0b1f:		and #$0c		; 29 0c
B11_0b21:		beq B11_0b25 ; f0 02

B11_0b23:		ldy #$02		; a0 02
B11_0b25:		lda $11			; a5 11
B11_0b27:		bmi B11_0b2a ; 30 01

B11_0b29:		iny				; c8 
B11_0b2a:		lda $aba2, y	; b9 a2 ab
B11_0b2d:		jsr updateEntity_wOam		; 20 67 f5
B11_0b30:		lda $051e		; ad 1e 05
B11_0b33:		bpl B11_0b3c ; 10 07

B11_0b35:		and #$7f		; 29 7f
B11_0b37:		cmp wEntityWramOffset.w		; cd 5b 01
B11_0b3a:		bne B11_0b81 ; d0 45

B11_0b3c:		lda $015d		; ad 5d 01
B11_0b3f:		bne B11_0b81 ; d0 40

B11_0b41:		lda #$01		; a9 01
B11_0b43:		jsr func_1b72		; 20 72 fb
B11_0b46:		lda #$01		; a9 01
B11_0b48:		jsr func_19a7		; 20 a7 f9
B11_0b4b:		bcc B11_0b82 ; 90 35

B11_0b4d:		lda wEntityWramOffset.w		; ad 5b 01
B11_0b50:		ora #$80		; 09 80
B11_0b52:		sta $051e		; 8d 1e 05
B11_0b55:		lda #$40		; a9 40
B11_0b57:		ora $1a			; 05 1a
B11_0b59:		and #$7f		; 29 7f
B11_0b5b:		sta $1a			; 85 1a
B11_0b5d:		lda $10			; a5 10
B11_0b5f:		sta $0500		; 8d 00 05
B11_0b62:		lda $11			; a5 11
B11_0b64:		sta $0501		; 8d 01 05
B11_0b67:		lda $050b		; ad 0b 05
B11_0b6a:		and #$01		; 29 01
B11_0b6c:		beq B11_0b81 ; f0 13

B11_0b6e:		lda $050b		; ad 0b 05
B11_0b71:		and #$fe		; 29 fe
B11_0b73:		sta $050b		; 8d 0b 05
B11_0b76:		ldx $0517		; ae 17 05
B11_0b79:		lda $030a, x	; bd 0a 03
B11_0b7c:		and #$df		; 29 df
B11_0b7e:		sta $030a, x	; 9d 0a 03
B11_0b81:		rts				; 60 


B11_0b82:		lda $051e		; ad 1e 05
B11_0b85:		bpl B11_0ba1 ; 10 1a

B11_0b87:		and #$7f		; 29 7f
B11_0b89:		cmp wEntityWramOffset.w		; cd 5b 01
B11_0b8c:		bne B11_0ba1 ; d0 13

B11_0b8e:		lda #$00		; a9 00
B11_0b90:		sta $051e		; 8d 1e 05
B11_0b93:		lda $1a			; a5 1a
B11_0b95:		and #$bf		; 29 bf
B11_0b97:		sta $1a			; 85 1a
B11_0b99:		lda $050a		; ad 0a 05
B11_0b9c:		and #$bf		; 29 bf
B11_0b9e:		sta $050a		; 8d 0a 05
B11_0ba1:		rts				; 60 


B11_0ba2:	.db $6f
B11_0ba3:		bvs B11_0c18 ; 70 73

B11_0ba5:	.db $74
B11_0ba6:		jsr $81c2		; 20 c2 81
B11_0ba9:		lda #$08		; a9 08
B11_0bab:		sta $00			; 85 00
B11_0bad:		lda #$14		; a9 14
B11_0baf:		sta $01			; 85 01
B11_0bb1:		jsr func_1a95		; 20 95 fa
B11_0bb4:		bcc B11_0bb7 ; 90 01

B11_0bb6:		rts				; 60 


B11_0bb7:		lda wJoy1NewButtonsPressed.w		; ad 54 01
B11_0bba:		and #$08		; 29 08
B11_0bbc:		beq B11_0bb6 ; f0 f8

B11_0bbe:		lda #$46		; a9 46
B11_0bc0:		jsr unsetGlobalFlag		; 20 fc e7
B11_0bc3:		lda wEntityWramOffset.w		; ad 5b 01
B11_0bc6:		ora #$80		; 09 80
B11_0bc8:		sta $051f		; 8d 1f 05
B11_0bcb:		lda #$38		; a9 38
B11_0bcd:		jmp func_08fa		; 4c fa e8


B11_0bd0:		lda #$61		; a9 61
B11_0bd2:		sta wShadow1KBChrBank1.w		; 8d 6c 01
B11_0bd5:		lda #$46		; a9 46
B11_0bd7:		jsr $8a57		; 20 57 8a
B11_0bda:		lda #$01		; a9 01
B11_0bdc:		sta $2a			; 85 2a
B11_0bde:		lda $1e			; a5 1e
B11_0be0:		lsr a			; 4a
B11_0be1:		tay				; a8 
B11_0be2:		lda $1a			; a5 1a
B11_0be4:		beq B11_0bed ; f0 07

B11_0be6:		ldy #$00		; a0 00
B11_0be8:		jsr $ac19		; 20 19 ac
B11_0beb:		dec $1a			; c6 1a
B11_0bed:		lda $1b			; a5 1b
B11_0bef:		beq B11_0bf8 ; f0 07

B11_0bf1:		ldy #$02		; a0 02
B11_0bf3:		jsr $ac19		; 20 19 ac
B11_0bf6:		dec $1b			; c6 1b
B11_0bf8:		lda $1c			; a5 1c
B11_0bfa:		beq B11_0c03 ; f0 07

B11_0bfc:		ldy #$04		; a0 04
B11_0bfe:		jsr $ac19		; 20 19 ac
B11_0c01:		dec $1c			; c6 1c
B11_0c03:		lda $1d			; a5 1d
B11_0c05:		beq B11_0c14 ; f0 0d

B11_0c07:		ldy #$06		; a0 06
B11_0c09:		jsr $ac19		; 20 19 ac
B11_0c0c:		dec $1d			; c6 1d
B11_0c0e:		bne B11_0c13 ; d0 03

B11_0c10:		jsr func_03c8		; 20 c8 e3
B11_0c13:		rts				; 60 


B11_0c14:		lda #$00		; a9 00
B11_0c16:		sta $19			; 85 19
B11_0c18:		rts				; 60 


B11_0c19:		and #$fe		; 29 fe
B11_0c1b:		sta $00			; 85 00
B11_0c1d:		and #$0f		; 29 0f
B11_0c1f:		lsr a			; 4a
B11_0c20:		lsr a			; 4a
B11_0c21:		tax				; aa 
B11_0c22:		lda $16			; a5 16
B11_0c24:		pha				; 48 
B11_0c25:		lda $17			; a5 17
B11_0c27:		pha				; 48 
B11_0c28:		lda $ac5d, y	; b9 5d ac
B11_0c2b:		sta $02			; 85 02
B11_0c2d:		lda $ac5e, y	; b9 5e ac
B11_0c30:		sta $03			; 85 03
B11_0c32:		lda $00			; a5 00
B11_0c34:		and #$f0		; 29 f0
B11_0c36:		lsr a			; 4a
B11_0c37:		lsr a			; 4a
B11_0c38:		lsr a			; 4a
B11_0c39:		tay				; a8 
B11_0c3a:		lda ($02), y	; b1 02
B11_0c3c:		sta $00			; 85 00
B11_0c3e:		iny				; c8 
B11_0c3f:		lda ($02), y	; b1 02
B11_0c41:		sta $01			; 85 01
B11_0c43:		jsr $86fb		; 20 fb 86
B11_0c46:		bcs B11_0c52 ; b0 0a

B11_0c48:		lda #$01		; a9 01
B11_0c4a:		sta $2a			; 85 2a
B11_0c4c:		lda $ac59, x	; bd 59 ac
B11_0c4f:		jsr updateEntity_wOam		; 20 67 f5
B11_0c52:		pla				; 68 
B11_0c53:		sta $17			; 85 17
B11_0c55:		pla				; 68 
B11_0c56:		sta $16			; 85 16
B11_0c58:		rts				; 60 


B11_0c59:	.db $04
B11_0c5a:	.db $03
B11_0c5b:	.db $02
B11_0c5c:		.db $00				; 00
B11_0c5d:		adc $ac			; 65 ac
B11_0c5f:		adc $75ac		; 6d ac 75
B11_0c62:		ldy $ac7d		; ac 7d ac
B11_0c65:		.db $00				; 00
B11_0c66:	.db $f4
B11_0c67:		sed				; f8 
B11_0c68:		.db $00				; 00
B11_0c69:	.db $fc
B11_0c6a:		beq B11_0c74 ; f0 08

B11_0c6c:		sed				; f8 
B11_0c6d:		php				; 08 
B11_0c6e:	.db $fc
B11_0c6f:		.db $00				; 00
B11_0c70:	.db $f4
B11_0c71:		inc $fc00, x	; fe 00 fc
B11_0c74:	.db $fc
B11_0c75:	.db $fc
B11_0c76:		sed				; f8 
B11_0c77:	.db $04
B11_0c78:	.db $f4
B11_0c79:		.db $00				; 00
B11_0c7a:	.db $f4
B11_0c7b:		sed				; f8 
B11_0c7c:	.db $fc
B11_0c7d:		.db $00				; 00
B11_0c7e:		.db $00				; 00
B11_0c7f:	.db $fc
B11_0c80:		;removed
	.db $f0 $08

B11_0c82:		.db $00				; 00
B11_0c83:		sed				; f8 
B11_0c84:	.db $fc
B11_0c85:		bit $1b			; 24 1b
B11_0c87:		bmi B11_0cbc ; 30 33

B11_0c89:		inc $1c			; e6 1c
B11_0c8b:		lda $1c			; a5 1c
B11_0c8d:		lsr a			; 4a
B11_0c8e:		lsr a			; 4a
B11_0c8f:		lsr a			; 4a
B11_0c90:		lsr a			; 4a
B11_0c91:		beq B11_0cbc ; f0 29

B11_0c93:		cmp $1a			; c5 1a
B11_0c95:		beq B11_0cbd ; f0 26

B11_0c97:		cmp $1d			; c5 1d
B11_0c99:		bcc B11_0cbc ; 90 21

B11_0c9b:		beq B11_0cbc ; f0 1f

B11_0c9d:		sta $1d			; 85 1d
B11_0c9f:		lda $12			; a5 12
B11_0ca1:		sta $0e			; 85 0e
B11_0ca3:		lda $13			; a5 13
B11_0ca5:		sta $0f			; 85 0f
B11_0ca7:		lda #$2b		; a9 2b
B11_0ca9:		jsr copyStaticLayoutIdxedYForNMIDataCopyingAtCurrPPUAddr		; 20 96 fc
B11_0cac:		jsr $accc		; 20 cc ac
B11_0caf:		lda $13			; a5 13
B11_0cb1:		clc				; 18 
B11_0cb2:		adc #$40		; 69 40
B11_0cb4:		sta $13			; 85 13
B11_0cb6:		lda $12			; a5 12
B11_0cb8:		adc #$00		; 69 00
B11_0cba:		sta $12			; 85 12
B11_0cbc:		rts				; 60 


B11_0cbd:		lda $1c			; a5 1c
B11_0cbf:		ora #$07		; 09 07
B11_0cc1:		sta $1c			; 85 1c
B11_0cc3:		lda #$80		; a9 80
B11_0cc5:		sta $1b			; 85 1b
B11_0cc7:		lda $1a			; a5 1a
B11_0cc9:		jmp $ac9f		; 4c 9f ac


B11_0ccc:		ldx #$00		; a2 00
B11_0cce:		lda $13			; a5 13
B11_0cd0:		and #$02		; 29 02
B11_0cd2:		beq B11_0cd5 ; f0 01

B11_0cd4:		inx				; e8 
B11_0cd5:		lda $13			; a5 13
B11_0cd7:		and #$40		; 29 40
B11_0cd9:		beq B11_0cdd ; f0 02

B11_0cdb:		inx				; e8 
B11_0cdc:		inx				; e8 
B11_0cdd:		lda $12			; a5 12
B11_0cdf:		sta $00			; 85 00
B11_0ce1:		lda $13			; a5 13
B11_0ce3:		lsr $00			; 46 00
B11_0ce5:		ror a			; 6a
B11_0ce6:		lsr $00			; 46 00
B11_0ce8:		ror a			; 6a
B11_0ce9:		lsr a			; 4a
B11_0cea:		lsr a			; 4a
B11_0ceb:		and #$38		; 29 38
B11_0ced:		sta $00			; 85 00
B11_0cef:		lda $13			; a5 13
B11_0cf1:		lsr a			; 4a
B11_0cf2:		lsr a			; 4a
B11_0cf3:		and #$07		; 29 07
B11_0cf5:		ora $00			; 05 00
B11_0cf7:		tay				; a8 
B11_0cf8:		clc				; 18 
B11_0cf9:		adc #$c0		; 69 c0
B11_0cfb:		sta $00			; 85 00
B11_0cfd:		lda $30			; a5 30
B11_0cff:		and #$10		; 29 10
B11_0d01:		beq B11_0d0c ; f0 09

B11_0d03:		tya				; 98 
B11_0d04:		clc				; 18 
B11_0d05:		adc #$40		; 69 40
B11_0d07:		tay				; a8 
B11_0d08:		lda #$27		; a9 27
B11_0d0a:		bne B11_0d0e ; d0 02

B11_0d0c:		lda #$23		; a9 23
B11_0d0e:		sta $01			; 85 01
B11_0d10:		lda $0520, y	; b9 20 05
B11_0d13:		and $ad3e, x	; 3d 3e ad
B11_0d16:		ora $ad42, x	; 1d 42 ad
B11_0d19:		sta $0520, y	; 99 20 05
B11_0d1c:		ldy wNMIDataCopyStructNextIdx.w		; ac 00 01
B11_0d1f:		sta $0104, y	; 99 04 01
B11_0d22:		lda $01			; a5 01
B11_0d24:		sta $0101, y	; 99 01 01
B11_0d27:		lda $00			; a5 00
B11_0d29:		sta $0102, y	; 99 02 01
B11_0d2c:		lda #$01		; a9 01
B11_0d2e:		sta $0103, y	; 99 03 01
B11_0d31:		lda #$ff		; a9 ff
B11_0d33:		sta $0105, y	; 99 05 01
B11_0d36:		tya				; 98 
B11_0d37:		clc				; 18 
B11_0d38:		adc #$04		; 69 04
B11_0d3a:		sta wNMIDataCopyStructNextIdx.w		; 8d 00 01
B11_0d3d:		rts				; 60 


B11_0d3e:	.db $fc
B11_0d3f:	.db $f3
B11_0d40:	.db $cf
B11_0d41:	.db $3f
B11_0d42:	.db $03
B11_0d43:	.db $0c
B11_0d44:		;removed
	.db $30 $c0

B11_0d46:		lda #$48		; a9 48
B11_0d48:		jsr checkGlobalFlag		; 20 e9 e7
B11_0d4b:		bne B11_0d82 ; d0 35

B11_0d4d:		jsr $81c2		; 20 c2 81
B11_0d50:		lda $04ec		; ad ec 04
B11_0d53:		and #$0f		; 29 0f
B11_0d55:		bne B11_0d82 ; d0 2b

B11_0d57:		lda #$20		; a9 20
B11_0d59:		sta $00			; 85 00
B11_0d5b:		sta $01			; 85 01
B11_0d5d:		jsr func_1a95		; 20 95 fa
B11_0d60:		bcs B11_0d82 ; b0 20

B11_0d62:		lda #$20		; a9 20
B11_0d64:		bit $1f			; 24 1f
B11_0d66:		bmi B11_0d78 ; 30 10

B11_0d68:		bvs B11_0d74 ; 70 0a

B11_0d6a:		bne B11_0d70 ; d0 04

B11_0d6c:		lda #$60		; a9 60
B11_0d6e:		bne B11_0d7a ; d0 0a

B11_0d70:		lda #$61		; a9 61
B11_0d72:		bne B11_0d7a ; d0 06

B11_0d74:		lda #$62		; a9 62
B11_0d76:		bne B11_0d7a ; d0 02

B11_0d78:		lda #$63		; a9 63
B11_0d7a:		jsr setGlobalFlag		; 20 f0 e7
B11_0d7d:		lda #$3e		; a9 3e
B11_0d7f:		jsr func_08fa		; 20 fa e8
B11_0d82:		rts				; 60 


B11_0d83:		lda #$02		; a9 02
B11_0d85:		sta $01			; 85 01
B11_0d87:		lda #$00		; a9 00
B11_0d89:		sta $00			; 85 00
B11_0d8b:		jsr $86fb		; 20 fb 86
B11_0d8e:		bcs B11_0d98 ; b0 08

B11_0d90:		jsr $ad9d		; 20 9d ad
B11_0d93:		lda #$a0		; a9 a0
B11_0d95:		jmp updateEntity_wOam		; 4c 67 f5


B11_0d98:		lda #$00		; a9 00
B11_0d9a:		sta $19			; 85 19
B11_0d9c:		rts				; 60 


B11_0d9d:		lda #$08		; a9 08
B11_0d9f:		sta $00			; 85 00
B11_0da1:		sta $01			; 85 01
B11_0da3:		lda $0507		; ad 07 05
B11_0da6:		sta $02			; 85 02
B11_0da8:		lda $0506		; ad 06 05
B11_0dab:		sta $03			; 85 03
B11_0dad:		lda #$82		; a9 82
B11_0daf:		jmp $8847		; 4c 47 88


B11_0db2:		lda $1a			; a5 1a
B11_0db4:		bmi B11_0dcd ; 30 17

B11_0db6:		lda #$00		; a9 00
B11_0db8:		sta $00			; 85 00
B11_0dba:		lda #$02		; a9 02
B11_0dbc:		sta $01			; 85 01
B11_0dbe:		jsr $86fb		; 20 fb 86
B11_0dc1:		lda $17			; a5 17
B11_0dc3:		cmp $1c			; c5 1c
B11_0dc5:		bne B11_0de8 ; d0 21

B11_0dc7:		lda #$80		; a9 80
B11_0dc9:		sta $1a			; 85 1a
B11_0dcb:		bne B11_0de8 ; d0 1b

B11_0dcd:		lda #$00		; a9 00
B11_0dcf:		sta $01			; 85 01
B11_0dd1:		lda $19			; a5 19
B11_0dd3:		and #$02		; 29 02
B11_0dd5:		bne B11_0ddb ; d0 04

B11_0dd7:		lda #$02		; a9 02
B11_0dd9:		bne B11_0ddd ; d0 02

B11_0ddb:		lda #$fe		; a9 fe
B11_0ddd:		sta $00			; 85 00
B11_0ddf:		jsr $86fb		; 20 fb 86
B11_0de2:		lda $16			; a5 16
B11_0de4:		cmp $1b			; c5 1b
B11_0de6:		beq B11_0e09 ; f0 21

B11_0de8:		lda $16			; a5 16
B11_0dea:		cmp #$d8		; c9 d8
B11_0dec:		bcs B11_0df2 ; b0 04

B11_0dee:		cmp #$48		; c9 48
B11_0df0:		bcs B11_0e04 ; b0 12

B11_0df2:		lda $19			; a5 19
B11_0df4:		and #$02		; 29 02
B11_0df6:		bne B11_0dfe ; d0 06

B11_0df8:		lda #$02		; a9 02
B11_0dfa:		ora $19			; 05 19
B11_0dfc:		bne B11_0e02 ; d0 04

B11_0dfe:		lda $19			; a5 19
B11_0e00:		and #$fd		; 29 fd
B11_0e02:		sta $19			; 85 19
B11_0e04:		lda #$c7		; a9 c7
B11_0e06:		jmp updateEntity_wOam		; 4c 67 f5


B11_0e09:		lda #$00		; a9 00
B11_0e0b:		sta $19			; 85 19
B11_0e0d:		ldx #$00		; a2 00
B11_0e0f:		lda $16			; a5 16
B11_0e11:		and #$10		; 29 10
B11_0e13:		beq B11_0e16 ; f0 01

B11_0e15:		inx				; e8 
B11_0e16:		lda $17			; a5 17
B11_0e18:		and #$10		; 29 10
B11_0e1a:		beq B11_0e1e ; f0 02

B11_0e1c:		inx				; e8 
B11_0e1d:		inx				; e8 
B11_0e1e:		lda $17			; a5 17
B11_0e20:		and #$e0		; 29 e0
B11_0e22:		lsr a			; 4a
B11_0e23:		lsr a			; 4a
B11_0e24:		sta $01			; 85 01
B11_0e26:		lda $16			; a5 16
B11_0e28:		lsr a			; 4a
B11_0e29:		lsr a			; 4a
B11_0e2a:		lsr a			; 4a
B11_0e2b:		lsr a			; 4a
B11_0e2c:		lsr a			; 4a
B11_0e2d:		ora $01			; 05 01
B11_0e2f:		tay				; a8 
B11_0e30:		lda $0560, y	; b9 60 05
B11_0e33:		and $ae68, x	; 3d 68 ae
B11_0e36:		sta $0560, y	; 99 60 05
B11_0e39:		ldx wNMIDataCopyStructNextIdx.w		; ae 00 01
B11_0e3c:		sta $0104, x	; 9d 04 01
B11_0e3f:		lda #$27		; a9 27
B11_0e41:		sta $0101, x	; 9d 01 01
B11_0e44:		tya				; 98 
B11_0e45:		ora #$c0		; 09 c0
B11_0e47:		sta $0102, x	; 9d 02 01
B11_0e4a:		lda #$01		; a9 01
B11_0e4c:		sta $0103, x	; 9d 03 01
B11_0e4f:		lda #$ff		; a9 ff
B11_0e51:		sta $0105, x	; 9d 05 01
B11_0e54:		inx				; e8 
B11_0e55:		inx				; e8 
B11_0e56:		inx				; e8 
B11_0e57:		inx				; e8 
B11_0e58:		stx wNMIDataCopyStructNextIdx.w		; 8e 00 01
B11_0e5b:		lda #$27		; a9 27
B11_0e5d:		sta $0e			; 85 0e
B11_0e5f:		lda $1d			; a5 1d
B11_0e61:		sta $0f			; 85 0f
B11_0e63:		lda #$4a		; a9 4a
B11_0e65:		jmp copyStaticLayoutIdxedYForNMIDataCopyingAtCurrPPUAddr		; 4c 96 fc


B11_0e68:	.db $fc
B11_0e69:	.db $f3
B11_0e6a:	.db $cf
B11_0e6b:	.db $3f
B11_0e6c:		jsr $81c2		; 20 c2 81
B11_0e6f:		lda #$00		; a9 00
B11_0e71:		jsr func_1b72		; 20 72 fb
B11_0e74:		lda #$06		; a9 06
B11_0e76:		jsr func_19a7		; 20 a7 f9
B11_0e79:		lda #$c8		; a9 c8
B11_0e7b:		jmp updateEntity_wOam		; 4c 67 f5


B11_0e7e:		lda #$f8		; a9 f8
B11_0e80:		sta $00			; 85 00
B11_0e82:		lda #$10		; a9 10
B11_0e84:		sta $02			; 85 02
B11_0e86:		lda #$08		; a9 08
B11_0e88:		sta $01			; 85 01
B11_0e8a:		sta $03			; 85 03
B11_0e8c:		jsr func_0735		; 20 35 e7
B11_0e8f:		lda $015d		; ad 5d 01
B11_0e92:		bpl B11_0e9d ; 10 09

B11_0e94:		lda #$00		; a9 00
B11_0e96:		sta $19			; 85 19
B11_0e98:		lda $1e			; a5 1e
B11_0e9a:		jmp unsetGlobalFlag		; 4c fc e7


B11_0e9d:		dec $1b			; c6 1b
B11_0e9f:		bne B11_0eb2 ; d0 11

B11_0ea1:		inc $1c			; e6 1c
B11_0ea3:		lda $1c			; a5 1c
B11_0ea5:		and #$07		; 29 07
B11_0ea7:		tay				; a8 
B11_0ea8:		lda $aeb3, y	; b9 b3 ae
B11_0eab:		sta $1b			; 85 1b
B11_0ead:		lda #$52		; a9 52
B11_0eaf:		jmp $8033		; 4c 33 80


B11_0eb2:		rts				; 60 


B11_0eb3:	.db $20 $20 $00
B11_0eb6:	.db $20 $20 $00
B11_0eb9:		jsr $a9a0		; 20 a0 a9
B11_0ebc:		sed				; f8 
B11_0ebd:		sta $00			; 85 00
B11_0ebf:		lda #$10		; a9 10
B11_0ec1:		sta $02			; 85 02
B11_0ec3:		lda #$08		; a9 08
B11_0ec5:		sta $01			; 85 01
B11_0ec7:		sta $03			; 85 03
B11_0ec9:		jsr func_0735		; 20 35 e7
B11_0ecc:		lda $015d		; ad 5d 01
B11_0ecf:		bpl B11_0ed6 ; 10 05

B11_0ed1:		lda #$00		; a9 00
B11_0ed3:		sta $19			; 85 19
B11_0ed5:		rts				; 60 


B11_0ed6:		ldx #$10		; a2 10
B11_0ed8:		lda #$c0		; a9 c0
B11_0eda:		jsr func_13ef		; 20 ef f3
B11_0edd:		bit $4a			; 24 4a
B11_0edf:		bpl B11_0ee4 ; 10 03

B11_0ee1:		jmp $8838		; 4c 38 88


B11_0ee4:		lda #$04		; a9 04
B11_0ee6:		jsr func_1888		; 20 88 f8
B11_0ee9:		bcs B11_0ef0 ; b0 05

B11_0eeb:		lda #$88		; a9 88
B11_0eed:		jsr func_1c24		; 20 24 fc
B11_0ef0:		lda $051c		; ad 1c 05
B11_0ef3:		bne B11_0f0d ; d0 18

B11_0ef5:		lda #$55		; a9 55
B11_0ef7:		jsr checkGlobalFlag		; 20 e9 e7
B11_0efa:		bne B11_0f0d ; d0 11

B11_0efc:		lda $0509		; ad 09 05
B11_0eff:		and #$30		; 29 30
B11_0f01:		bne B11_0f0d ; d0 0a

B11_0f03:		lda $015d		; ad 5d 01
B11_0f06:		bne B11_0f0d ; d0 05

B11_0f08:		lda #$05		; a9 05
B11_0f0a:		jsr func_19a7		; 20 a7 f9
B11_0f0d:		lda $12			; a5 12
B11_0f0f:		and #$03		; 29 03
B11_0f11:		tay				; a8 
B11_0f12:		lda $af18, y	; b9 18 af
B11_0f15:		jmp updateEntity_wOam		; 4c 67 f5


B11_0f18:		adc ($62, x)	; 61 62
B11_0f1a:	.db $63
B11_0f1b:	.db $64
B11_0f1c:		rts				; 60 


B11_0f1d:		jsr $81c2		; 20 c2 81
B11_0f20:		bit $1a			; 24 1a
B11_0f22:		bvs B11_0f53 ; 70 2f

B11_0f24:		bmi B11_0f34 ; 30 0e

B11_0f26:		lda $1b			; a5 1b
B11_0f28:		beq B11_0f2d ; f0 03

B11_0f2a:		dec $1b			; c6 1b
B11_0f2c:		rts				; 60 


B11_0f2d:		lda $1d			; a5 1d
B11_0f2f:		sta $15			; 85 15
B11_0f31:		jmp $af3e		; 4c 3e af


B11_0f34:		lda $015a		; ad 5a 01
B11_0f37:		and #$03		; 29 03
B11_0f39:		bne B11_0f3e ; d0 03

B11_0f3b:		jsr $89ed		; 20 ed 89
B11_0f3e:		lda #$00		; a9 00
B11_0f40:		jsr func_13ef		; 20 ef f3
B11_0f43:		lda #$00		; a9 00
B11_0f45:		jsr func_19a7		; 20 a7 f9
B11_0f48:		bcc B11_0f4e ; 90 04

B11_0f4a:		lda #$40		; a9 40
B11_0f4c:		sta $1a			; 85 1a
B11_0f4e:		lda #$c9		; a9 c9
B11_0f50:		jmp updateEntity_wOam		; 4c 67 f5


B11_0f53:		lda $1c			; a5 1c
B11_0f55:		beq B11_0f5b ; f0 04

B11_0f57:		dec $1c			; c6 1c
B11_0f59:		bne B11_0f3e ; d0 e3

B11_0f5b:		inc $15			; e6 15
B11_0f5d:		lda $15			; a5 15
B11_0f5f:		bmi B11_0f3e ; 30 dd

B11_0f61:		cmp #$40		; c9 40
B11_0f63:		bcc B11_0f3e ; 90 d9

B11_0f65:		lda #$40		; a9 40
B11_0f67:		sta $15			; 85 15
B11_0f69:		bne B11_0f3e ; d0 d3

B11_0f6b:		ldx #$04		; a2 04
B11_0f6d:		lda #$00		; a9 00
B11_0f6f:		jsr func_13ef		; 20 ef f3
B11_0f72:		jsr $af87		; 20 87 af
B11_0f75:		jsr func_0709		; 20 09 e7
B11_0f78:		lda $015d		; ad 5d 01
B11_0f7b:		beq B11_0f82 ; f0 05

B11_0f7d:		lda #$00		; a9 00
B11_0f7f:		sta $19			; 85 19
B11_0f81:		rts				; 60 


B11_0f82:		lda #$07		; a9 07
B11_0f84:		jmp updateEntity_wOam		; 4c 67 f5


B11_0f87:		lda #$08		; a9 08
B11_0f89:		sta $00			; 85 00
B11_0f8b:		sta $01			; 85 01
B11_0f8d:		lda $0507		; ad 07 05
B11_0f90:		sta $02			; 85 02
B11_0f92:		lda $0506		; ad 06 05
B11_0f95:		sta $03			; 85 03
B11_0f97:		lda #$81		; a9 81
B11_0f99:		jmp $8847		; 4c 47 88


B11_0f9c:		rts				; 60 


B11_0f9d:		lda #$00		; a9 00
B11_0f9f:		jsr func_13ef		; 20 ef f3
B11_0fa2:		jsr func_0709		; 20 09 e7
B11_0fa5:		jsr $afb7		; 20 b7 af
B11_0fa8:		lda $015d		; ad 5d 01
B11_0fab:		beq B11_0fb2 ; f0 05

B11_0fad:		lda #$00		; a9 00
B11_0faf:		sta $19			; 85 19
B11_0fb1:		rts				; 60 


B11_0fb2:		lda #$56		; a9 56
B11_0fb4:		jmp updateEntity_wOam		; 4c 67 f5


B11_0fb7:		lda #$08		; a9 08
B11_0fb9:		sta $00			; 85 00
B11_0fbb:		sta $01			; 85 01
B11_0fbd:		lda $0507		; ad 07 05
B11_0fc0:		sta $02			; 85 02
B11_0fc2:		lda $0506		; ad 06 05
B11_0fc5:		sta $03			; 85 03
B11_0fc7:		lda #$81		; a9 81
B11_0fc9:		jmp $8847		; 4c 47 88


B11_0fcc:		ldx #$04		; a2 04
B11_0fce:		lda #$00		; a9 00
B11_0fd0:		jsr func_13ef		; 20 ef f3
B11_0fd3:		jsr $afe8		; 20 e8 af
B11_0fd6:		jsr func_0709		; 20 09 e7
B11_0fd9:		lda $015d		; ad 5d 01
B11_0fdc:		beq B11_0fe3 ; f0 05

B11_0fde:		lda #$00		; a9 00
B11_0fe0:		sta $19			; 85 19
B11_0fe2:		rts				; 60 


B11_0fe3:		lda #$87		; a9 87
B11_0fe5:		jmp updateEntity_wOam		; 4c 67 f5


B11_0fe8:		lda #$10		; a9 10
B11_0fea:		sta $00			; 85 00
B11_0fec:		sta $01			; 85 01
B11_0fee:		lda $0507		; ad 07 05
B11_0ff1:		sta $02			; 85 02
B11_0ff3:		lda $0506		; ad 06 05
B11_0ff6:		sta $03			; 85 03
B11_0ff8:		lda #$81		; a9 81
B11_0ffa:		jmp $8847		; 4c 47 88


enUpdate_dialog:
B11_0ffd:		lda #$56		; a9 56
B11_0fff:		jsr checkGlobalFlag		; 20 e9 e7
B11_1002:		bne B11_102b ; @done

B11_1004:		jsr func_0709		; 20 09 e7
B11_1007:		lda $015d		; ad 5d 01
B11_100a:		bpl B11_1015 ; 10 09

func_b_100c:
B11_100c:		lda #$00		; a9 00
B11_100e:		sta $19			; 85 19
B11_1010:		lda $1e			; a5 1e
B11_1012:		jmp unsetGlobalFlag		; 4c fc e7

B11_1015:		bit $1a			; 24 1a
B11_1017:		bmi B11_102c ; 30 13

B11_1019:		lda #$40		; a9 40
B11_101b:		sta $00			; 85 00
B11_101d:		sta $01			; 85 01
B11_101f:		jsr func_1a95		; 20 95 fa
B11_1022:		bcs B11_102b ; @done

B11_1024:		lda #$80		; a9 80
B11_1026:		sta $1a			; 85 1a
B11_1028:		jsr func_a_0789		; 20 89 87

@done:
B11_102b:		rts				; 60 

B11_102c:		lda $1b			; a5 1b
B11_102e:		jsr displayTextIdxedA		; 20 72 87
B11_1031:		jmp func_b_100c		; 4c 0c b0


B11_1034:		lda #$0a		; a9 0a
B11_1036:		jmp func_a_0046		; 4c 46 80


B11_1039:		lda #$08		; a9 08
B11_103b:		jmp func_a_0046		; 4c 46 80


B11_103e:		lda #$09		; a9 09
B11_1040:		jmp func_a_0046		; 4c 46 80


stub_b_1043:
B11_1043:		rts				; 60 


B11_1044:		rts				; 60 


func_b_1045:
B11_1045:		lda $1a			; a5 1a
B11_1047:		bmi B11_104c ; 30 03

B11_1049:		jmp func_a_14da		; 4c da 94

B11_104c:		jmp func_a_1561		; 4c 61 95


B11_104f:		jsr $81c2		; 20 c2 81
B11_1052:		lda $19			; a5 19
B11_1054:		and #$04		; 29 04
B11_1056:		bne B11_106c ; d0 14

B11_1058:		lda #$00		; a9 00
B11_105a:		sta $14			; 85 14
B11_105c:		lda $015a		; ad 5a 01
B11_105f:		and #$7f		; 29 7f
B11_1061:		bne B11_106c ; d0 09

B11_1063:		lda #$10		; a9 10
B11_1065:		jsr $8214		; 20 14 82
B11_1068:		lda #$d0		; a9 d0
B11_106a:		sta $15			; 85 15
B11_106c:		ldx #$0c		; a2 0c
B11_106e:		lda #$c0		; a9 c0
B11_1070:		jsr func_13ef		; 20 ef f3
B11_1073:		lda $19			; a5 19
B11_1075:		and #$04		; 29 04
B11_1077:		beq B11_1088 ; f0 0f

B11_1079:		jsr $8225		; 20 25 82
B11_107c:		bit $4a			; 24 4a
B11_107e:		bvc B11_1088 ; 50 08

B11_1080:		lda $14			; a5 14
B11_1082:		eor #$ff		; 49 ff
B11_1084:		sta $14			; 85 14
B11_1086:		inc $14			; e6 14
B11_1088:		lda #$00		; a9 00
B11_108a:		jsr func_1888		; 20 88 f8
B11_108d:		lda #$00		; a9 00
B11_108f:		jsr func_1aac		; 20 ac fa
B11_1092:		lda #$00		; a9 00
B11_1094:		jsr func_1745		; 20 45 f7
B11_1097:		bcc B11_10a2 ; 90 09

B11_1099:		lda $1f			; a5 1f
B11_109b:		bpl B11_10a2 ; 10 05

B11_109d:		lda #$27		; a9 27
B11_109f:		jmp $8033		; 4c 33 80


B11_10a2:		ldy #$00		; a0 00
B11_10a4:		lda $19			; a5 19
B11_10a6:		and #$04		; 29 04
B11_10a8:		bne B11_10b1 ; d0 07

B11_10aa:		lda $015a		; ad 5a 01
B11_10ad:		and #$06		; 29 06
B11_10af:		bne B11_10b2 ; d0 01

B11_10b1:		iny				; c8 
B11_10b2:		lda $b0b8, y	; b9 b8 b0
B11_10b5:		jmp updateEntity_wOam		; 4c 67 f5


B11_10b8:		sec				; 38 
B11_10b9:	.db $37
B11_10ba:		jsr $81c2		; 20 c2 81
B11_10bd:		bit $1a			; 24 1a
B11_10bf:		bmi B11_10cc ; 30 0b

B11_10c1:		bvs B11_10ee ; 70 2b

B11_10c3:		lda $015a		; ad 5a 01
B11_10c6:		bne B11_111b ; d0 53

B11_10c8:		lda #$80		; a9 80
B11_10ca:		sta $1a			; 85 1a
B11_10cc:		lda $015a		; ad 5a 01
B11_10cf:		and #$0f		; 29 0f
B11_10d1:		bne B11_10eb ; d0 18

B11_10d3:		jsr $86ef		; 20 ef 86
B11_10d6:		lda $14			; a5 14
B11_10d8:		bpl B11_10df ; 10 05

B11_10da:		eor #$ff		; 49 ff
B11_10dc:		clc				; 18 
B11_10dd:		adc #$01		; 69 01
B11_10df:		cmp #$04		; c9 04
B11_10e1:		bcs B11_10eb ; b0 08

B11_10e3:		lda #$40		; a9 40
B11_10e5:		sta $1a			; 85 1a
B11_10e7:		lda #$00		; a9 00
B11_10e9:		sta $14			; 85 14
B11_10eb:		jmp $b11b		; 4c 1b b1


B11_10ee:		dec $1c			; c6 1c
B11_10f0:		bne B11_1102 ; d0 10

B11_10f2:		lda #$00		; a9 00
B11_10f4:		sta $1a			; 85 1a
B11_10f6:		lda #$40		; a9 40
B11_10f8:		sta $1c			; 85 1c
B11_10fa:		lda #$0c		; a9 0c
B11_10fc:		jsr $8edc		; 20 dc 8e
B11_10ff:		jmp $b11b		; 4c 1b b1


B11_1102:		lda $1c			; a5 1c
B11_1104:		cmp #$20		; c9 20
B11_1106:		bne B11_111b ; d0 13

B11_1108:		lda $19			; a5 19
B11_110a:		and #$02		; 29 02
B11_110c:		bne B11_1112 ; d0 04

B11_110e:		lda #$02		; a9 02
B11_1110:		bne B11_1114 ; d0 02

B11_1112:		lda #$06		; a9 06
B11_1114:		sta $0f			; 85 0f
B11_1116:		lda #$49		; a9 49
B11_1118:		jsr $8033		; 20 33 80
B11_111b:		jsr $89ed		; 20 ed 89
B11_111e:		ldx #$0a		; a2 0a
B11_1120:		lda #$80		; a9 80
B11_1122:		jsr func_13ef		; 20 ef f3
B11_1125:		bit $1a			; 24 1a
B11_1127:		bvs B11_1141 ; 70 18

B11_1129:		jsr $8225		; 20 25 82
B11_112c:		bit $4a			; 24 4a
B11_112e:		bvc B11_1138 ; 50 08

B11_1130:		lda $14			; a5 14
B11_1132:		eor #$ff		; 49 ff
B11_1134:		sta $14			; 85 14
B11_1136:		inc $14			; e6 14
B11_1138:		bit $1a			; 24 1a
B11_113a:		bmi B11_1141 ; 30 05

B11_113c:		lda #$0c		; a9 0c
B11_113e:		jsr $8edc		; 20 dc 8e
B11_1141:		lda #$01		; a9 01
B11_1143:		jsr func_1888		; 20 88 f8
B11_1146:		lda #$01		; a9 01
B11_1148:		jsr func_1aac		; 20 ac fa
B11_114b:		lda #$01		; a9 01
B11_114d:		jsr func_1745		; 20 45 f7
B11_1150:		bcc B11_115b ; 90 09

B11_1152:		lda $1f			; a5 1f
B11_1154:		bpl B11_115b ; 10 05

B11_1156:		lda #$27		; a9 27
B11_1158:		jsr $8033		; 20 33 80
B11_115b:		bit $1a			; 24 1a
B11_115d:		bvs B11_116c ; 70 0d

B11_115f:		ldy #$00		; a0 00
B11_1161:		bit $11			; 24 11
B11_1163:		bvs B11_1166 ; 70 01

B11_1165:		iny				; c8 
B11_1166:		lda $b17f, y	; b9 7f b1
B11_1169:		jmp updateEntity_wOam		; 4c 67 f5


B11_116c:		lda $1c			; a5 1c
B11_116e:		cmp #$20		; c9 20
B11_1170:		bcs B11_117a ; b0 08

B11_1172:		cmp #$10		; c9 10
B11_1174:		bcc B11_117a ; 90 04

B11_1176:		lda #$3d		; a9 3d
B11_1178:		bne B11_117c ; d0 02

B11_117a:		lda #$3b		; a9 3b
B11_117c:		jmp updateEntity_wOam		; 4c 67 f5


B11_117f:	.db $3b
B11_1180:	.db $3c
B11_1181:		jsr $81c2		; 20 c2 81
B11_1184:		lda $015a		; ad 5a 01
B11_1187:		and #$7f		; 29 7f
B11_1189:		bne B11_1190 ; d0 05

B11_118b:		lda #$06		; a9 06
B11_118d:		jsr $8033		; 20 33 80
B11_1190:		jsr $89ce		; 20 ce 89
B11_1193:		lda $00			; a5 00
B11_1195:		cmp #$10		; c9 10
B11_1197:		bcc B11_119c ; 90 03

B11_1199:		jsr $8a12		; 20 12 8a
B11_119c:		bit $1a			; 24 1a
B11_119e:		bpl B11_11a8 ; 10 08

B11_11a0:		dec $1c			; c6 1c
B11_11a2:		bne B11_11a8 ; d0 04

B11_11a4:		lda #$00		; a9 00
B11_11a6:		sta $1a			; 85 1a
B11_11a8:		ldx #$0a		; a2 0a
B11_11aa:		lda #$c0		; a9 c0
B11_11ac:		jsr func_13ef		; 20 ef f3
B11_11af:		lda #$02		; a9 02
B11_11b1:		jsr func_1888		; 20 88 f8
B11_11b4:		bcs B11_11be ; b0 08

B11_11b6:		lda #$80		; a9 80
B11_11b8:		sta $1a			; 85 1a
B11_11ba:		lda #$40		; a9 40
B11_11bc:		sta $1c			; 85 1c
B11_11be:		lda #$02		; a9 02
B11_11c0:		jsr func_1aac		; 20 ac fa
B11_11c3:		bcs B11_11cd ; b0 08

B11_11c5:		lda #$80		; a9 80
B11_11c7:		sta $1a			; 85 1a
B11_11c9:		lda #$40		; a9 40
B11_11cb:		sta $1c			; 85 1c
B11_11cd:		lda #$02		; a9 02
B11_11cf:		jsr func_1745		; 20 45 f7
B11_11d2:		bcc B11_11e5 ; 90 11

B11_11d4:		lda #$80		; a9 80
B11_11d6:		sta $1a			; 85 1a
B11_11d8:		lda #$40		; a9 40
B11_11da:		sta $1c			; 85 1c
B11_11dc:		lda $1f			; a5 1f
B11_11de:		bpl B11_11e5 ; 10 05

B11_11e0:		lda #$27		; a9 27
B11_11e2:		jsr $8033		; 20 33 80
B11_11e5:		ldy #$00		; a0 00
B11_11e7:		bit $1a			; 24 1a
B11_11e9:		bpl B11_11f3 ; 10 08

B11_11eb:		lda $015a		; ad 5a 01
B11_11ee:		and #$08		; 29 08
B11_11f0:		bne B11_11f3 ; d0 01

B11_11f2:		iny				; c8 
B11_11f3:		lda $b1f9, y	; b9 f9 b1
B11_11f6:		jmp updateEntity_wOam		; 4c 67 f5


B11_11f9:	.db $3f
B11_11fa:		rti				; 40 


B11_11fb:		jsr $81c2		; 20 c2 81
B11_11fe:		lda $19			; a5 19
B11_1200:		and #$04		; 29 04
B11_1202:		bne B11_121a ; d0 16

B11_1204:		lda #$00		; a9 00
B11_1206:		sta $14			; 85 14
B11_1208:		lda $015a		; ad 5a 01
B11_120b:		and #$3f		; 29 3f
B11_120d:		bne B11_121a ; d0 0b

B11_120f:		lda #$0c		; a9 0c
B11_1211:		jsr $8214		; 20 14 82
B11_1214:		lda #$d0		; a9 d0
B11_1216:		sta $15			; 85 15
B11_1218:		inc $1b			; e6 1b
B11_121a:		ldx #$0c		; a2 0c
B11_121c:		lda #$c0		; a9 c0
B11_121e:		jsr func_13ef		; 20 ef f3
B11_1221:		lda $19			; a5 19
B11_1223:		and #$04		; 29 04
B11_1225:		beq B11_1236 ; f0 0f

B11_1227:		jsr $8225		; 20 25 82
B11_122a:		bit $4a			; 24 4a
B11_122c:		bvc B11_1236 ; 50 08

B11_122e:		lda $14			; a5 14
B11_1230:		eor #$ff		; 49 ff
B11_1232:		sta $14			; 85 14
B11_1234:		inc $14			; e6 14
B11_1236:		lda #$00		; a9 00
B11_1238:		jsr func_1888		; 20 88 f8
B11_123b:		lda #$00		; a9 00
B11_123d:		jsr func_1aac		; 20 ac fa
B11_1240:		lda #$00		; a9 00
B11_1242:		jsr func_1745		; 20 45 f7
B11_1245:		bcc B11_1250 ; 90 09

B11_1247:		lda $1f			; a5 1f
B11_1249:		bpl B11_1250 ; 10 05

B11_124b:		lda #$27		; a9 27
B11_124d:		jmp $8033		; 4c 33 80


B11_1250:		lda $19			; a5 19
B11_1252:		and #$04		; 29 04
B11_1254:		beq B11_125a ; f0 04

B11_1256:		lda #$43		; a9 43
B11_1258:		bne B11_126d ; d0 13

B11_125a:		ldy #$00		; a0 00
B11_125c:		lda $1b			; a5 1b
B11_125e:		and #$03		; 29 03
B11_1260:		bne B11_126a ; d0 08

B11_1262:		lda $015a		; ad 5a 01
B11_1265:		and #$08		; 29 08
B11_1267:		bne B11_126a ; d0 01

B11_1269:		iny				; c8 
B11_126a:		lda $b270, y	; b9 70 b2
B11_126d:		jmp updateEntity_wOam		; 4c 67 f5


B11_1270:		eor ($42, x)	; 41 42
B11_1272:		jsr $81c2		; 20 c2 81
B11_1275:		bit $1a			; 24 1a
B11_1277:		bmi B11_128c ; 30 13

B11_1279:		bvs B11_12b2 ; 70 37

B11_127b:		lda $015a		; ad 5a 01
B11_127e:		bne B11_12c1 ; d0 41

B11_1280:		lda #$80		; a9 80
B11_1282:		sta $1a			; 85 1a
B11_1284:		lda #$00		; a9 00
B11_1286:		sta $14			; 85 14
B11_1288:		lda #$40		; a9 40
B11_128a:		sta $1c			; 85 1c
B11_128c:		dec $1c			; c6 1c
B11_128e:		bne B11_12a3 ; d0 13

B11_1290:		lda #$40		; a9 40
B11_1292:		sta $1a			; 85 1a
B11_1294:		jsr $8a12		; 20 12 8a
B11_1297:		lda #$10		; a9 10
B11_1299:		jsr $8214		; 20 14 82
B11_129c:		lda #$b0		; a9 b0
B11_129e:		sta $15			; 85 15
B11_12a0:		jmp $b2c1		; 4c c1 b2


B11_12a3:		lda $1c			; a5 1c
B11_12a5:		and #$0f		; 29 0f
B11_12a7:		bne B11_12af ; d0 06

B11_12a9:		lda $19			; a5 19
B11_12ab:		eor #$02		; 49 02
B11_12ad:		sta $19			; 85 19
B11_12af:		jmp $b2c1		; 4c c1 b2


B11_12b2:		lda $19			; a5 19
B11_12b4:		and #$04		; 29 04
B11_12b6:		bne B11_12c1 ; d0 09

B11_12b8:		lda #$00		; a9 00
B11_12ba:		sta $1a			; 85 1a
B11_12bc:		lda #$08		; a9 08
B11_12be:		jsr $8214		; 20 14 82
B11_12c1:		ldx #$0a		; a2 0a
B11_12c3:		lda #$c0		; a9 c0
B11_12c5:		jsr func_13ef		; 20 ef f3
B11_12c8:		bit $1a			; 24 1a
B11_12ca:		bmi B11_12de ; 30 12

B11_12cc:		jsr $81ea		; 20 ea 81
B11_12cf:		jsr $8225		; 20 25 82
B11_12d2:		bit $4a			; 24 4a
B11_12d4:		bvc B11_12de ; 50 08

B11_12d6:		lda $14			; a5 14
B11_12d8:		eor #$ff		; 49 ff
B11_12da:		sta $14			; 85 14
B11_12dc:		inc $14			; e6 14
B11_12de:		lda #$02		; a9 02
B11_12e0:		jsr func_1888		; 20 88 f8
B11_12e3:		lda #$02		; a9 02
B11_12e5:		jsr func_1aac		; 20 ac fa
B11_12e8:		lda #$02		; a9 02
B11_12ea:		jsr func_1745		; 20 45 f7
B11_12ed:		bcc B11_12f8 ; 90 09

B11_12ef:		lda $1f			; a5 1f
B11_12f1:		bpl B11_12f8 ; 10 05

B11_12f3:		lda #$27		; a9 27
B11_12f5:		jmp $8033		; 4c 33 80


B11_12f8:		bit $1a			; 24 1a
B11_12fa:		bvs B11_1317 ; 70 1b

B11_12fc:		bpl B11_1302 ; 10 04

B11_12fe:		lda #$46		; a9 46
B11_1300:		bne B11_1314 ; d0 12

B11_1302:		lda $11			; a5 11
B11_1304:		sta $00			; 85 00
B11_1306:		lda $10			; a5 10
B11_1308:		asl $00			; 06 00
B11_130a:		rol a			; 2a
B11_130b:		asl $00			; 06 00
B11_130d:		rol a			; 2a
B11_130e:		and #$03		; 29 03
B11_1310:		tay				; a8 
B11_1311:		lda $b324, y	; b9 24 b3
B11_1314:		jmp updateEntity_wOam		; 4c 67 f5


B11_1317:		ldy #$00		; a0 00
B11_1319:		bit $15			; 24 15
B11_131b:		bmi B11_131e ; 30 01

B11_131d:		iny				; c8 
B11_131e:		lda $b328, y	; b9 28 b3
B11_1321:		jmp updateEntity_wOam		; 4c 67 f5


B11_1324:		eor $46			; 45 46
B11_1326:	.db $47
B11_1327:		lsr $4a			; 46 4a
B11_1329:	.db $4b
B11_132a:		jsr $81c2		; 20 c2 81
B11_132d:		ldx #$0c		; a2 0c
B11_132f:		lda #$c0		; a9 c0
B11_1331:		jsr func_13ef		; 20 ef f3
B11_1334:		jsr $8225		; 20 25 82
B11_1337:		lda #$03		; a9 03
B11_1339:		jsr func_1888		; 20 88 f8
B11_133c:		lda $10			; a5 10
B11_133e:		and #$01		; 29 01
B11_1340:		tay				; a8 
B11_1341:		lda $b347, y	; b9 47 b3
B11_1344:		jmp updateEntity_wOam		; 4c 67 f5


B11_1347:	.db $3b
B11_1348:	.db $3c
B11_1349:		jsr $81c2		; 20 c2 81
B11_134c:		lda $015a		; ad 5a 01
B11_134f:		and #$03		; 29 03
B11_1351:		bne B11_136a ; d0 17

B11_1353:		jsr $86ef		; 20 ef 86
B11_1356:		lda $14			; a5 14
B11_1358:		bpl B11_1361 ; 10 07

B11_135a:		lda $14			; a5 14
B11_135c:		eor #$ff		; 49 ff
B11_135e:		clc				; 18 
B11_135f:		adc #$01		; 69 01
B11_1361:		cmp #$08		; c9 08
B11_1363:		bcs B11_136a ; b0 05

B11_1365:		lda #$20		; a9 20
B11_1367:		jsr $8214		; 20 14 82
B11_136a:		ldx #$10		; a2 10
B11_136c:		lda #$80		; a9 80
B11_136e:		jsr func_13ef		; 20 ef f3
B11_1371:		jsr $8225		; 20 25 82
B11_1374:		bit $4a			; 24 4a
B11_1376:		bvc B11_1380 ; 50 08

B11_1378:		lda $14			; a5 14
B11_137a:		eor #$ff		; 49 ff
B11_137c:		sta $14			; 85 14
B11_137e:		inc $14			; e6 14
B11_1380:		lda #$06		; a9 06
B11_1382:		jsr func_1888		; 20 88 f8
B11_1385:		lda #$06		; a9 06
B11_1387:		jsr func_1aac		; 20 ac fa
B11_138a:		lda #$06		; a9 06
B11_138c:		jsr func_1745		; 20 45 f7
B11_138f:		bcc B11_139a ; 90 09

B11_1391:		lda $1f			; a5 1f
B11_1393:		bpl B11_139a ; 10 05

B11_1395:		lda #$27		; a9 27
B11_1397:		jmp $8033		; 4c 33 80


B11_139a:		lda $11			; a5 11
B11_139c:		sta $00			; 85 00
B11_139e:		lda $10			; a5 10
B11_13a0:		asl $00			; 06 00
B11_13a2:		rol a			; 2a
B11_13a3:		and #$01		; 29 01
B11_13a5:		tay				; a8 
B11_13a6:		lda $b3ac, y	; b9 ac b3
B11_13a9:		jmp updateEntity_wOam		; 4c 67 f5


B11_13ac:		eor ($52), y	; 51 52
B11_13ae:		jmp $9561		; 4c 61 95


B11_13b1:		jsr $81c2		; 20 c2 81
B11_13b4:		bit $1a			; 24 1a
B11_13b6:		bpl B11_13dc ; 10 24

B11_13b8:		lda $015a		; ad 5a 01
B11_13bb:		and #$07		; 29 07
B11_13bd:		bne B11_13d9 ; d0 1a

B11_13bf:		jsr $86ef		; 20 ef 86
B11_13c2:		lda $14			; a5 14
B11_13c4:		bpl B11_13cb ; 10 05

B11_13c6:		eor #$ff		; 49 ff
B11_13c8:		clc				; 18 
B11_13c9:		adc #$01		; 69 01
B11_13cb:		cmp #$0a		; c9 0a
B11_13cd:		bcs B11_13d9 ; b0 0a

B11_13cf:		lda #$00		; a9 00
B11_13d1:		sta $1a			; 85 1a
B11_13d3:		jsr $8a12		; 20 12 8a
B11_13d6:		jmp $b408		; 4c 08 b4


B11_13d9:		jmp $b400		; 4c 00 b4


B11_13dc:		jsr $89ce		; 20 ce 89
B11_13df:		lda $00			; a5 00
B11_13e1:		cmp #$40		; c9 40
B11_13e3:		bcs B11_1408 ; b0 23

B11_13e5:		cmp #$10		; c9 10
B11_13e7:		bcc B11_1408 ; 90 1f

B11_13e9:		lda $015a		; ad 5a 01
B11_13ec:		and #$1f		; 29 1f
B11_13ee:		bne B11_1408 ; d0 18

B11_13f0:		lda #$80		; a9 80
B11_13f2:		sta $1a			; 85 1a
B11_13f4:		jsr $8a12		; 20 12 8a
B11_13f7:		lda #$14		; a9 14
B11_13f9:		jsr $8214		; 20 14 82
B11_13fc:		lda #$d0		; a9 d0
B11_13fe:		sta $15			; 85 15
B11_1400:		lda #$10		; a9 10
B11_1402:		sta $1c			; 85 1c
B11_1404:		lda #$06		; a9 06
B11_1406:		bne B11_140e ; d0 06

B11_1408:		lda #$0a		; a9 0a
B11_140a:		sta $1c			; 85 1c
B11_140c:		lda #$02		; a9 02
B11_140e:		sta $1d			; 85 1d
B11_1410:		ldx $1c			; a6 1c
B11_1412:		lda #$c0		; a9 c0
B11_1414:		jsr func_13ef		; 20 ef f3
B11_1417:		jsr $8225		; 20 25 82
B11_141a:		bit $1a			; 24 1a
B11_141c:		bmi B11_1429 ; 30 0b

B11_141e:		jsr $81ea		; 20 ea 81
B11_1421:		lda #$06		; a9 06
B11_1423:		jsr $8214		; 20 14 82
B11_1426:		jmp $b435		; 4c 35 b4


B11_1429:		bit $4a			; 24 4a
B11_142b:		bvc B11_1435 ; 50 08

B11_142d:		lda $14			; a5 14
B11_142f:		eor #$ff		; 49 ff
B11_1431:		sta $14			; 85 14
B11_1433:		inc $14			; e6 14
B11_1435:		lda $1d			; a5 1d
B11_1437:		jsr func_1888		; 20 88 f8
B11_143a:		lda $1d			; a5 1d
B11_143c:		jsr func_1aac		; 20 ac fa
B11_143f:		lda $1d			; a5 1d
B11_1441:		jsr func_1745		; 20 45 f7
B11_1444:		bcc B11_144f ; 90 09

B11_1446:		lda $1f			; a5 1f
B11_1448:		bpl B11_144f ; 10 05

B11_144a:		lda #$27		; a9 27
B11_144c:		jmp $8033		; 4c 33 80


B11_144f:		lda $1a			; a5 1a
B11_1451:		bpl B11_1457 ; 10 04

B11_1453:		lda #$5a		; a9 5a
B11_1455:		bne B11_1469 ; d0 12

B11_1457:		lda $11			; a5 11
B11_1459:		sta $00			; 85 00
B11_145b:		lda $10			; a5 10
B11_145d:		asl $00			; 06 00
B11_145f:		rol a			; 2a
B11_1460:		asl $00			; 06 00
B11_1462:		rol a			; 2a
B11_1463:		and #$03		; 29 03
B11_1465:		tay				; a8 
B11_1466:		lda $b46c, y	; b9 6c b4
B11_1469:		jmp updateEntity_wOam		; 4c 67 f5


B11_146c:	.db $57
B11_146d:		cli				; 58 
B11_146e:		eor $2058, y	; 59 58 20
B11_1471:	.db $c2
B11_1472:		sta ($a2, x)	; 81 a2
B11_1474:		asl a			; 0a
B11_1475:		lda #$c0		; a9 c0
B11_1477:		jsr func_13ef		; 20 ef f3
B11_147a:		lda $19			; a5 19
B11_147c:		and #$04		; 29 04
B11_147e:		bne B11_1485 ; d0 05

B11_1480:		lda #$00		; a9 00
B11_1482:		sta $19			; 85 19
B11_1484:		rts				; 60 


B11_1485:		lda #$02		; a9 02
B11_1487:		jsr func_1888		; 20 88 f8
B11_148a:		lda #$02		; a9 02
B11_148c:		jsr func_1aac		; 20 ac fa
B11_148f:		bcs B11_14a7 ; b0 16

B11_1491:		lda $1f			; a5 1f
B11_1493:		bne B11_14a7 ; d0 12

B11_1495:		ldx $1b			; a6 1b
B11_1497:		lda #$00		; a9 00
B11_1499:		sta wEntityStructs.byte9.w, x	; 9d 09 04
B11_149c:		lda $18			; a5 18
B11_149e:		sta $1a			; 85 1a
B11_14a0:		lda #$14		; a9 14
B11_14a2:		sta $18			; 85 18
B11_14a4:		jmp $8033		; 4c 33 80


B11_14a7:		lda #$02		; a9 02
B11_14a9:		jsr func_1745		; 20 45 f7
B11_14ac:		bcc B11_14bf ; 90 11

B11_14ae:		lda $1f			; a5 1f
B11_14b0:		bne B11_14bf ; d0 0d

B11_14b2:		ldx wEntityWramOffset.w		; ae 5b 01
B11_14b5:		lda #$00		; a9 00
B11_14b7:		sta wEntityStructs.byte9.w, x	; 9d 09 04
B11_14ba:		lda #$27		; a9 27
B11_14bc:		jmp $8033		; 4c 33 80


B11_14bf:		ldy #$00		; a0 00
B11_14c1:		lda $015a		; ad 5a 01
B11_14c4:		and #$08		; 29 08
B11_14c6:		bne B11_14c9 ; d0 01

B11_14c8:		iny				; c8 
B11_14c9:		lda $b4cf, y	; b9 cf b4
B11_14cc:		jmp updateEntity_wOam		; 4c 67 f5


B11_14cf:	.db $da
B11_14d0:	.db $db


enUpdate_freeonFight:
B11_14d1:		lda #$00		; a9 00
B11_14d3:		jmp func_a_0046		; 4c 46 80


B11_14d6:		lda #$01		; a9 01
B11_14d8:		jmp func_a_0046		; 4c 46 80


B11_14db:		lda #$02		; a9 02
B11_14dd:		jmp func_a_0046		; 4c 46 80


B11_14e0:		lda #$03		; a9 03
B11_14e2:		jmp func_a_0046		; 4c 46 80


B11_14e5:		jsr $81c2		; 20 c2 81
B11_14e8:		bit $1a			; 24 1a
B11_14ea:		bpl B11_14f7 ; 10 0b

B11_14ec:		dec $1c			; c6 1c
B11_14ee:		bne B11_14f4 ; d0 04

B11_14f0:		lda #$00		; a9 00
B11_14f2:		sta $1a			; 85 1a
B11_14f4:		jmp $b503		; 4c 03 b5


B11_14f7:		jsr $89ce		; 20 ce 89
B11_14fa:		lda $00			; a5 00
B11_14fc:		cmp #$10		; c9 10
B11_14fe:		bcc B11_1503 ; 90 03

B11_1500:		jsr $8a12		; 20 12 8a
B11_1503:		ldx #$10		; a2 10
B11_1505:		lda #$c0		; a9 c0
B11_1507:		jsr func_13ef		; 20 ef f3
B11_150a:		lda #$05		; a9 05
B11_150c:		jsr func_1888		; 20 88 f8
B11_150f:		lda #$05		; a9 05
B11_1511:		jsr func_1aac		; 20 ac fa
B11_1514:		bcs B11_151e ; b0 08

B11_1516:		lda #$80		; a9 80
B11_1518:		sta $1a			; 85 1a
B11_151a:		lda #$10		; a9 10
B11_151c:		sta $1c			; 85 1c
B11_151e:		lda #$05		; a9 05
B11_1520:		jsr func_1745		; 20 45 f7
B11_1523:		bcc B11_1536 ; 90 11

B11_1525:		lda $1f			; a5 1f
B11_1527:		bpl B11_152e ; 10 05

B11_1529:		lda #$27		; a9 27
B11_152b:		jmp $8033		; 4c 33 80


B11_152e:		lda #$80		; a9 80
B11_1530:		sta $1a			; 85 1a
B11_1532:		lda #$10		; a9 10
B11_1534:		sta $1c			; 85 1c
B11_1536:		ldy #$00		; a0 00
B11_1538:		bit $1a			; 24 1a
B11_153a:		bpl B11_153d ; 10 01

B11_153c:		iny				; c8 
B11_153d:		lda $b543, y	; b9 43 b5
B11_1540:		jmp updateEntity_wOam		; 4c 67 f5


B11_1543:	.db $7a
B11_1544:	.db $7c
B11_1545:		jmp $9561		; 4c 61 95


B11_1548:		jsr $81c2		; 20 c2 81
B11_154b:		bit $1a			; 24 1a
B11_154d:		bmi B11_1561 ; 30 12

B11_154f:		lda $015a		; ad 5a 01
B11_1552:		and #$7f		; 29 7f
B11_1554:		bne B11_1583 ; d0 2d

B11_1556:		lda #$80		; a9 80
B11_1558:		sta $1a			; 85 1a
B11_155a:		jsr $8a12		; 20 12 8a
B11_155d:		lda #$00		; a9 00
B11_155f:		sta $14			; 85 14
B11_1561:		dec $1c			; c6 1c
B11_1563:		bne B11_1578 ; d0 13

B11_1565:		lda #$00		; a9 00
B11_1567:		sta $1a			; 85 1a
B11_1569:		lda #$60		; a9 60
B11_156b:		sta $1c			; 85 1c
B11_156d:		jsr $8a12		; 20 12 8a
B11_1570:		lda #$10		; a9 10
B11_1572:		jsr $8214		; 20 14 82
B11_1575:		jmp $b583		; 4c 83 b5


B11_1578:		lda $1c			; a5 1c
B11_157a:		cmp #$20		; c9 20
B11_157c:		bne B11_1583 ; d0 05

B11_157e:		lda #$4c		; a9 4c
B11_1580:		jsr $8033		; 20 33 80
B11_1583:		ldx #$08		; a2 08
B11_1585:		lda #$c0		; a9 c0
B11_1587:		jsr func_13ef		; 20 ef f3
B11_158a:		bit $1a			; 24 1a
B11_158c:		bmi B11_15a0 ; 30 12

B11_158e:		jsr $81ea		; 20 ea 81
B11_1591:		jsr $8225		; 20 25 82
B11_1594:		bit $4a			; 24 4a
B11_1596:		bvc B11_15a0 ; 50 08

B11_1598:		lda $14			; a5 14
B11_159a:		eor #$ff		; 49 ff
B11_159c:		sta $14			; 85 14
B11_159e:		inc $14			; e6 14
B11_15a0:		lda #$09		; a9 09
B11_15a2:		jsr func_1888		; 20 88 f8
B11_15a5:		lda #$09		; a9 09
B11_15a7:		jsr func_1aac		; 20 ac fa
B11_15aa:		lda #$09		; a9 09
B11_15ac:		jsr func_1745		; 20 45 f7
B11_15af:		bcc B11_15ba ; 90 09

B11_15b1:		lda $1f			; a5 1f
B11_15b3:		bpl B11_15ba ; 10 05

B11_15b5:		lda #$27		; a9 27
B11_15b7:		jmp $8033		; 4c 33 80


B11_15ba:		bit $1a			; 24 1a
B11_15bc:		bmi B11_15d0 ; 30 12

B11_15be:		lda $11			; a5 11
B11_15c0:		sta $00			; 85 00
B11_15c2:		lda $10			; a5 10
B11_15c4:		asl $00			; 06 00
B11_15c6:		rol a			; 2a
B11_15c7:		and #$03		; 29 03
B11_15c9:		tay				; a8 
B11_15ca:		lda $b5e3, y	; b9 e3 b5
B11_15cd:		jmp updateEntity_wOam		; 4c 67 f5


B11_15d0:		ldy #$00		; a0 00
B11_15d2:		lda $1c			; a5 1c
B11_15d4:		cmp #$30		; c9 30
B11_15d6:		bcs B11_15dd ; b0 05

B11_15d8:		cmp #$10		; c9 10
B11_15da:		bcc B11_15dd ; 90 01

B11_15dc:		iny				; c8 
B11_15dd:		lda $b5e7, y	; b9 e7 b5
B11_15e0:		jmp updateEntity_wOam		; 4c 67 f5


B11_15e3:		sta ($82, x)	; 81 82
B11_15e5:	.db $83
B11_15e6:	.db $82
B11_15e7:		sty $85			; 84 85
B11_15e9:		jsr $81c2		; 20 c2 81
B11_15ec:		lda #$03		; a9 03
B11_15ee:		sta $2a			; 85 2a
B11_15f0:		lda #$56		; a9 56
B11_15f2:		jsr checkGlobalFlag		; 20 e9 e7
B11_15f5:		beq B11_15f8 ; f0 01

B11_15f7:		rts				; 60 


B11_15f8:		bit $1a			; 24 1a
B11_15fa:		bmi B11_161f ; 30 23

B11_15fc:		bvs B11_165c ; 70 5e

B11_15fe:		lda $1a			; a5 1a
B11_1600:		and #$3c		; 29 3c
B11_1602:		bne B11_1607 ; d0 03

B11_1604:		jmp $b71a		; 4c 1a b7


B11_1607:		and #$1c		; 29 1c
B11_1609:		bne B11_160e ; d0 03

B11_160b:		jmp $b6a6		; 4c a6 b6


B11_160e:		and #$0c		; 29 0c
B11_1610:		bne B11_1615 ; d0 03

B11_1612:		jmp $b71d		; 4c 1d b7


B11_1615:		and #$04		; 29 04
B11_1617:		bne B11_161c ; d0 03

B11_1619:		jmp $b6de		; 4c de b6


B11_161c:		jmp $b717		; 4c 17 b7


B11_161f:		lda $015a		; ad 5a 01
B11_1622:		and #$01		; 29 01
B11_1624:		bne B11_1639 ; d0 13

B11_1626:		lda $1c			; a5 1c
B11_1628:		cmp #$a8		; c9 a8
B11_162a:		beq B11_164c ; f0 20

B11_162c:		dec $1c			; c6 1c
B11_162e:		bne B11_1639 ; d0 09

B11_1630:		lda #$00		; a9 00
B11_1632:		sta $1a			; 85 1a
B11_1634:		lda #$5d		; a9 5d
B11_1636:		jsr unsetGlobalFlag		; 20 fc e7
B11_1639:		lda $1c			; a5 1c
B11_163b:		cmp #$40		; c9 40
B11_163d:		bcs B11_164b ; b0 0c

B11_163f:		lda $015a		; ad 5a 01
B11_1642:		and #$01		; 29 01
B11_1644:		bne B11_164b ; d0 05

B11_1646:		lda #$76		; a9 76
B11_1648:		jmp updateEntity_wOam		; 4c 67 f5


B11_164b:		rts				; 60 


B11_164c:		dec $1c			; c6 1c
B11_164e:		lda #$00		; a9 00
B11_1650:		ldx #$0c		; a2 0c
B11_1652:		jsr $8819		; 20 19 88
B11_1655:		lda #$0f		; a9 0f
B11_1657:		ldx #$0c		; a2 0c
B11_1659:		jmp $8819		; 4c 19 88


B11_165c:		jsr $8c91		; 20 91 8c
B11_165f:		bcs B11_1676 ; b0 15

B11_1661:		lda #$20		; a9 20
B11_1663:		sta $1a			; 85 1a
B11_1665:		lda #$0c		; a9 0c
B11_1667:		jsr func_08e5		; 20 e5 e8
B11_166a:		lda #$04		; a9 04
B11_166c:		sta $1f			; 85 1f
B11_166e:		lda #$00		; a9 00
B11_1670:		sta $14			; 85 14
B11_1672:		lda #$f0		; a9 f0
B11_1674:		sta $15			; 85 15
B11_1676:		lda $015a		; ad 5a 01
B11_1679:		and #$01		; 29 01
B11_167b:		bne B11_16a5 ; d0 28

B11_167d:		lda $1d			; a5 1d
B11_167f:		cmp #$40		; c9 40
B11_1681:		bcc B11_168c ; 90 09

B11_1683:		lda #$03		; a9 03
B11_1685:		sta $2a			; 85 2a
B11_1687:		lda #$79		; a9 79
B11_1689:		jmp updateEntity_wOam		; 4c 67 f5


B11_168c:		lda #$03		; a9 03
B11_168e:		sta $2a			; 85 2a
B11_1690:		lda #$93		; a9 93
B11_1692:		jsr updateEntity_wOam		; 20 67 f5
B11_1695:		lda #$03		; a9 03
B11_1697:		sta $2a			; 85 2a
B11_1699:		lda $015a		; ad 5a 01
B11_169c:		and #$03		; 29 03
B11_169e:		tay				; a8 
B11_169f:		lda $b7c9, y	; b9 c9 b7
B11_16a2:		jmp updateEntity_wOam		; 4c 67 f5


B11_16a5:		rts				; 60 


B11_16a6:		ldx #$0a		; a2 0a
B11_16a8:		lda #$80		; a9 80
B11_16aa:		jsr func_13ef		; 20 ef f3
B11_16ad:		lda $17			; a5 17
B11_16af:		cmp #$30		; c9 30
B11_16b1:		bcs B11_16c9 ; b0 16

B11_16b3:		lda #$10		; a9 10
B11_16b5:		sta $1a			; 85 1a
B11_16b7:		lda #$5d		; a9 5d
B11_16b9:		jsr unsetGlobalFlag		; 20 fc e7
B11_16bc:		lda #$08		; a9 08
B11_16be:		jsr $8214		; 20 14 82
B11_16c1:		lda #$00		; a9 00
B11_16c3:		sta $15			; 85 15
B11_16c5:		lda #$40		; a9 40
B11_16c7:		sta $1d			; 85 1d
B11_16c9:		lda #$93		; a9 93
B11_16cb:		jsr updateEntity_wOam		; 20 67 f5
B11_16ce:		lda #$03		; a9 03
B11_16d0:		sta $2a			; 85 2a
B11_16d2:		lda $015a		; ad 5a 01
B11_16d5:		and #$03		; 29 03
B11_16d7:		tay				; a8 
B11_16d8:		lda $b7c9, y	; b9 c9 b7
B11_16db:		jmp updateEntity_wOam		; 4c 67 f5


B11_16de:		jsr $8c91		; 20 91 8c
B11_16e1:		bcs B11_16f0 ; b0 0d

B11_16e3:		lda #$04		; a9 04
B11_16e5:		sta $1a			; 85 1a
B11_16e7:		lda #$88		; a9 88
B11_16e9:		sta $1c			; 85 1c
B11_16eb:		lda #$07		; a9 07
B11_16ed:		jmp func_08e5		; 4c e5 e8


B11_16f0:		lda $1d			; a5 1d
B11_16f2:		cmp #$40		; c9 40
B11_16f4:		bcc B11_1716 ; 90 20

B11_16f6:		lda $015a		; ad 5a 01
B11_16f9:		and #$01		; 29 01
B11_16fb:		bne B11_1716 ; d0 19

B11_16fd:		lda #$03		; a9 03
B11_16ff:		sta $2a			; 85 2a
B11_1701:		lda $015a		; ad 5a 01
B11_1704:		and #$03		; 29 03
B11_1706:		tay				; a8 
B11_1707:		lda $b7c9, y	; b9 c9 b7
B11_170a:		jsr updateEntity_wOam		; 20 67 f5
B11_170d:		lda #$03		; a9 03
B11_170f:		sta $2a			; 85 2a
B11_1711:		lda #$98		; a9 98
B11_1713:		jmp updateEntity_wOam		; 4c 67 f5


B11_1716:		rts				; 60 


B11_1717:		jmp $8e9c		; 4c 9c 8e


B11_171a:		jmp $8d3e		; 4c 3e 8d


B11_171d:		ldx #$10		; a2 10
B11_171f:		lda #$80		; a9 80
B11_1721:		jsr func_13ef		; 20 ef f3
B11_1724:		ldy #$02		; a0 02
B11_1726:		jsr $9629		; 20 29 96
B11_1729:		jsr $8225		; 20 25 82
B11_172c:		lda #$08		; a9 08
B11_172e:		jsr $8214		; 20 14 82
B11_1731:		lda $1a			; a5 1a
B11_1733:		and #$03		; 29 03
B11_1735:		beq B11_1753 ; f0 1c

B11_1737:		dec $1c			; c6 1c
B11_1739:		bne B11_1741 ; d0 06

B11_173b:		lda $1a			; a5 1a
B11_173d:		and #$fc		; 29 fc
B11_173f:		sta $1a			; 85 1a
B11_1741:		and #$01		; 29 01
B11_1743:		beq B11_1750 ; f0 0b

B11_1745:		lda $1c			; a5 1c
B11_1747:		cmp #$20		; c9 20
B11_1749:		bne B11_1750 ; d0 05

B11_174b:		lda #$26		; a9 26
B11_174d:		jsr $8033		; 20 33 80
B11_1750:		jmp $b798		; 4c 98 b7


B11_1753:		lda #$08		; a9 08
B11_1755:		jsr func_1888		; 20 88 f8
B11_1758:		lda #$08		; a9 08
B11_175a:		jsr func_1aac		; 20 ac fa
B11_175d:		bcs B11_176e ; b0 0f

B11_175f:		lda $1a			; a5 1a
B11_1761:		ora #$01		; 09 01
B11_1763:		sta $1a			; 85 1a
B11_1765:		inc $1f			; e6 1f
B11_1767:		lda #$40		; a9 40
B11_1769:		sta $1c			; 85 1c
B11_176b:		jmp $b798		; 4c 98 b7


B11_176e:		lda #$08		; a9 08
B11_1770:		jsr func_1745		; 20 45 f7
B11_1773:		bcc B11_1798 ; 90 23

B11_1775:		lda $1f			; a5 1f
B11_1777:		bpl B11_178e ; 10 15

B11_1779:		lda #$08		; a9 08
B11_177b:		sta $1a			; 85 1a
B11_177d:		lda #$d3		; a9 d3
B11_177f:		sta $1b			; 85 1b
B11_1781:		lda #$d7		; a9 d7
B11_1783:		sta $1c			; 85 1c
B11_1785:		lda #$db		; a9 db
B11_1787:		sta $1d			; 85 1d
B11_1789:		lda #$5d		; a9 5d
B11_178b:		jmp setGlobalFlag		; 4c f0 e7


B11_178e:		lda $1a			; a5 1a
B11_1790:		ora #$02		; 09 02
B11_1792:		sta $1a			; 85 1a
B11_1794:		lda #$40		; a9 40
B11_1796:		sta $1c			; 85 1c
B11_1798:		lda $1a			; a5 1a
B11_179a:		and #$03		; 29 03
B11_179c:		tay				; a8 
B11_179d:		and #$02		; 29 02
B11_179f:		beq B11_17a8 ; f0 07

B11_17a1:		lda $015a		; ad 5a 01
B11_17a4:		and #$01		; 29 01
B11_17a6:		bne B11_17c5 ; d0 1d

B11_17a8:		lda $b7c6, y	; b9 c6 b7
B11_17ab:		jsr updateEntity_wOam		; 20 67 f5
B11_17ae:		lda #$03		; a9 03
B11_17b0:		sta $2a			; 85 2a
B11_17b2:		lda $015a		; ad 5a 01
B11_17b5:		and #$07		; 29 07
B11_17b7:		bit $15			; 24 15
B11_17b9:		bmi B11_17bc ; 30 01

B11_17bb:		lsr a			; 4a
B11_17bc:		and #$03		; 29 03
B11_17be:		tay				; a8 
B11_17bf:		lda $b7c9, y	; b9 c9 b7
B11_17c2:		jmp updateEntity_wOam		; 4c 67 f5


B11_17c5:		rts				; 60 


B11_17c6:	.db $93
B11_17c7:	.db $97
B11_17c8:		tya				; 98 
B11_17c9:		sty $95, x		; 94 95
B11_17cb:		stx $95, y		; 96 95
B11_17cd:		lda #$04		; a9 04
B11_17cf:		jmp func_a_0046		; 4c 46 80


B11_17d2:		lda #$05		; a9 05
B11_17d4:		jmp func_a_0046		; 4c 46 80


B11_17d7:		jsr $81c2		; 20 c2 81
B11_17da:		lda #$03		; a9 03
B11_17dc:		sta $2a			; 85 2a
B11_17de:		lda #$56		; a9 56
B11_17e0:		jsr checkGlobalFlag		; 20 e9 e7
B11_17e3:		beq B11_17e6 ; f0 01

B11_17e5:		rts				; 60 


B11_17e6:		bit $1a			; 24 1a
B11_17e8:		bmi B11_1806 ; 30 1c

B11_17ea:		bvs B11_184b ; 70 5f

B11_17ec:		lda $1a			; a5 1a
B11_17ee:		and #$38		; 29 38
B11_17f0:		bne B11_17f5 ; d0 03

B11_17f2:		jmp $b887		; 4c 87 b8


B11_17f5:		and #$18		; 29 18
B11_17f7:		bne B11_17fc ; d0 03

B11_17f9:		jmp $b884		; 4c 84 b8


B11_17fc:		and #$08		; 29 08
B11_17fe:		bne B11_1803 ; d0 03

B11_1800:		jmp $b881		; 4c 81 b8


B11_1803:		jmp $b92c		; 4c 2c b9


B11_1806:		lda $1c			; a5 1c
B11_1808:		cmp #$a0		; c9 a0
B11_180a:		beq B11_182d ; f0 21

B11_180c:		dec $1c			; c6 1c
B11_180e:		bne B11_1819 ; d0 09

B11_1810:		lda #$00		; a9 00
B11_1812:		sta $1a			; 85 1a
B11_1814:		lda #$5d		; a9 5d
B11_1816:		jmp unsetGlobalFlag		; 4c fc e7


B11_1819:		lda $1c			; a5 1c
B11_181b:		cmp #$50		; c9 50
B11_181d:		bcc B11_1820 ; 90 01

B11_181f:		rts				; 60 


B11_1820:		lda $015a		; ad 5a 01
B11_1823:		and #$01		; 29 01
B11_1825:		bne B11_182c ; d0 05

B11_1827:		lda #$9a		; a9 9a
B11_1829:		jmp updateEntity_wOam		; 4c 67 f5


B11_182c:		rts				; 60 


B11_182d:		dec $1c			; c6 1c
B11_182f:		lda #$80		; a9 80
B11_1831:		ldx #$04		; a2 04
B11_1833:		jsr $8819		; 20 19 88
B11_1836:		lda #$81		; a9 81
B11_1838:		ldx #$04		; a2 04
B11_183a:		jsr $8819		; 20 19 88
B11_183d:		lda #$8e		; a9 8e
B11_183f:		ldx #$04		; a2 04
B11_1841:		jsr $8819		; 20 19 88
B11_1844:		lda #$8f		; a9 8f
B11_1846:		ldx #$04		; a2 04
B11_1848:		jmp $8819		; 4c 19 88


B11_184b:		jsr $8c91		; 20 91 8c
B11_184e:		bcs B11_1862 ; b0 12

B11_1850:		lda #$0c		; a9 0c
B11_1852:		jsr func_08e5		; 20 e5 e8
B11_1855:		lda #$08		; a9 08
B11_1857:		sta $1a			; 85 1a
B11_1859:		lda #$08		; a9 08
B11_185b:		sta $1f			; 85 1f
B11_185d:		lda #$5d		; a9 5d
B11_185f:		jsr unsetGlobalFlag		; 20 fc e7
B11_1862:		lda $1d			; a5 1d
B11_1864:		cmp #$40		; c9 40
B11_1866:		beq B11_1873 ; f0 0b

B11_1868:		bcc B11_1878 ; 90 0e

B11_186a:		lda #$03		; a9 03
B11_186c:		sta $2a			; 85 2a
B11_186e:		lda #$9c		; a9 9c
B11_1870:		jmp updateEntity_wOam		; 4c 67 f5


B11_1873:		lda #$cf		; a9 cf
B11_1875:		jsr $8a57		; 20 57 8a
B11_1878:		lda #$03		; a9 03
B11_187a:		sta $2a			; 85 2a
B11_187c:		lda #$9d		; a9 9d
B11_187e:		jmp updateEntity_wOam		; 4c 67 f5


B11_1881:		jmp $8e5a		; 4c 5a 8e


B11_1884:		jmp $8e9c		; 4c 9c 8e


B11_1887:		ldx #$08		; a2 08
B11_1889:		lda #$c0		; a9 c0
B11_188b:		jsr func_13ef		; 20 ef f3
B11_188e:		lda $015a		; ad 5a 01
B11_1891:		bne B11_189a ; d0 07

B11_1893:		ldx $0506		; ae 06 05
B11_1896:		lda #$42		; a9 42
B11_1898:		bne B11_18a9 ; d0 0f

B11_189a:		and #$1f		; 29 1f
B11_189c:		bne B11_18ac ; d0 0e

B11_189e:		jsr func_0684		; 20 84 e6
B11_18a1:		lda $015e		; ad 5e 01
B11_18a4:		and #$f8		; 29 f8
B11_18a6:		tax				; aa 
B11_18a7:		lda #$42		; a9 42
B11_18a9:		jsr $8033		; 20 33 80
B11_18ac:		lda $1a			; a5 1a
B11_18ae:		and #$03		; 29 03
B11_18b0:		beq B11_18bf ; f0 0d

B11_18b2:		dec $1c			; c6 1c
B11_18b4:		bne B11_1907 ; d0 51

B11_18b6:		lda $1a			; a5 1a
B11_18b8:		and #$fc		; 29 fc
B11_18ba:		sta $1a			; 85 1a
B11_18bc:		jsr $8a12		; 20 12 8a
B11_18bf:		jsr $8225		; 20 25 82
B11_18c2:		lda #$10		; a9 10
B11_18c4:		jsr $8214		; 20 14 82
B11_18c7:		lda #$09		; a9 09
B11_18c9:		jsr func_1888		; 20 88 f8
B11_18cc:		lda #$09		; a9 09
B11_18ce:		jsr func_1aac		; 20 ac fa
B11_18d1:		bcs B11_18d5 ; b0 02

B11_18d3:		inc $1f			; e6 1f
B11_18d5:		lda #$09		; a9 09
B11_18d7:		jsr func_1745		; 20 45 f7
B11_18da:		bcc B11_1907 ; 90 2b

B11_18dc:		lda $1f			; a5 1f
B11_18de:		bpl B11_18f9 ; 10 19

B11_18e0:		lda #$40		; a9 40
B11_18e2:		sta $1a			; 85 1a
B11_18e4:		lda #$00		; a9 00
B11_18e6:		sta $14			; 85 14
B11_18e8:		lda #$d3		; a9 d3
B11_18ea:		sta $1b			; 85 1b
B11_18ec:		lda #$d7		; a9 d7
B11_18ee:		sta $1c			; 85 1c
B11_18f0:		lda #$db		; a9 db
B11_18f2:		sta $1d			; 85 1d
B11_18f4:		lda #$5d		; a9 5d
B11_18f6:		jmp setGlobalFlag		; 4c f0 e7


B11_18f9:		lda $1a			; a5 1a
B11_18fb:		ora #$02		; 09 02
B11_18fd:		sta $1a			; 85 1a
B11_18ff:		lda #$00		; a9 00
B11_1901:		sta $14			; 85 14
B11_1903:		lda #$40		; a9 40
B11_1905:		sta $1c			; 85 1c
B11_1907:		lda $1a			; a5 1a
B11_1909:		and #$02		; 29 02
B11_190b:		bne B11_191f ; d0 12

B11_190d:		lda $11			; a5 11
B11_190f:		sta $00			; 85 00
B11_1911:		lda $10			; a5 10
B11_1913:		asl $00			; 06 00
B11_1915:		rol a			; 2a
B11_1916:		and #$03		; 29 03
B11_1918:		tay				; a8 
B11_1919:		lda $b9ae, y	; b9 ae b9
B11_191c:		jmp updateEntity_wOam		; 4c 67 f5


B11_191f:		lda $015a		; ad 5a 01
B11_1922:		and #$01		; 29 01
B11_1924:		bne B11_192b ; d0 05

B11_1926:		lda #$9b		; a9 9b
B11_1928:		jmp updateEntity_wOam		; 4c 67 f5


B11_192b:		rts				; 60 


B11_192c:		ldx #$08		; a2 08
B11_192e:		lda #$c0		; a9 c0
B11_1930:		jsr func_13ef		; 20 ef f3
B11_1933:		lda $1a			; a5 1a
B11_1935:		and #$03		; 29 03
B11_1937:		beq B11_1943 ; f0 0a

B11_1939:		dec $1c			; c6 1c
B11_193b:		bne B11_1997 ; d0 5a

B11_193d:		lda $1a			; a5 1a
B11_193f:		and #$fc		; 29 fc
B11_1941:		sta $1a			; 85 1a
B11_1943:		jsr $8a12		; 20 12 8a
B11_1946:		lda #$09		; a9 09
B11_1948:		jsr func_1888		; 20 88 f8
B11_194b:		lda #$09		; a9 09
B11_194d:		jsr func_1aac		; 20 ac fa
B11_1950:		bcs B11_1968 ; b0 16

B11_1952:		lda $1f			; a5 1f
B11_1954:		bmi B11_1973 ; 30 1d

B11_1956:		lda $1a			; a5 1a
B11_1958:		ora #$01		; 09 01
B11_195a:		sta $1a			; 85 1a
B11_195c:		lda #$18		; a9 18
B11_195e:		sta $1c			; 85 1c
B11_1960:		lda #$37		; a9 37
B11_1962:		jsr func_08fa		; 20 fa e8
B11_1965:		jmp $b997		; 4c 97 b9


B11_1968:		lda #$09		; a9 09
B11_196a:		jsr func_1745		; 20 45 f7
B11_196d:		bcc B11_1997 ; 90 28

B11_196f:		lda $1f			; a5 1f
B11_1971:		bpl B11_1988 ; 10 15

B11_1973:		lda #$10		; a9 10
B11_1975:		sta $1a			; 85 1a
B11_1977:		lda #$d3		; a9 d3
B11_1979:		sta $1b			; 85 1b
B11_197b:		lda #$d7		; a9 d7
B11_197d:		sta $1c			; 85 1c
B11_197f:		lda #$db		; a9 db
B11_1981:		sta $1d			; 85 1d
B11_1983:		lda #$5d		; a9 5d
B11_1985:		jmp setGlobalFlag		; 4c f0 e7


B11_1988:		lda $1a			; a5 1a
B11_198a:		ora #$02		; 09 02
B11_198c:		sta $1a			; 85 1a
B11_198e:		lda #$18		; a9 18
B11_1990:		sta $1c			; 85 1c
B11_1992:		lda #$37		; a9 37
B11_1994:		jsr func_08fa		; 20 fa e8
B11_1997:		ldy #$00		; a0 00
B11_1999:		lda $1a			; a5 1a
B11_199b:		and #$03		; 29 03
B11_199d:		beq B11_19a7 ; f0 08

B11_199f:		iny				; c8 
B11_19a0:		lda $015a		; ad 5a 01
B11_19a3:		and #$01		; 29 01
B11_19a5:		bne B11_19ad ; d0 06

B11_19a7:		lda $b9b2, y	; b9 b2 b9
B11_19aa:		jmp updateEntity_wOam		; 4c 67 f5


B11_19ad:		rts				; 60 


B11_19ae:		sta $9c9a, y	; 99 9a 9c
B11_19b1:		txs				; 9a 
B11_19b2:		sta $a99e, x	; 9d 9e a9
B11_19b5:		asl $4c			; 06 4c
B11_19b7:		lsr $80			; 46 80
B11_19b9:		lda #$07		; a9 07
B11_19bb:		jmp func_a_0046		; 4c 46 80


B11_19be:		jsr $81d6		; 20 d6 81
B11_19c1:		lda $19			; a5 19
B11_19c3:		and #$04		; 29 04
B11_19c5:		bne B11_19ce ; d0 07

B11_19c7:		dec $1c			; c6 1c
B11_19c9:		bne B11_19ce ; d0 03

B11_19cb:		jmp $8824		; 4c 24 88


B11_19ce:		ldx #$0c		; a2 0c
B11_19d0:		lda #$c0		; a9 c0
B11_19d2:		jsr func_13ef		; 20 ef f3
B11_19d5:		lda #$00		; a9 00
B11_19d7:		jsr func_1888		; 20 88 f8
B11_19da:		lda #$80		; a9 80
B11_19dc:		jmp updateEntity_wOam		; 4c 67 f5


B11_19df:		jsr $81c2		; 20 c2 81
B11_19e2:		lda #$03		; a9 03
B11_19e4:		sta $2a			; 85 2a
B11_19e6:		lda #$56		; a9 56
B11_19e8:		jsr checkGlobalFlag		; 20 e9 e7
B11_19eb:		beq B11_19ee ; f0 01

B11_19ed:		rts				; 60 


B11_19ee:		bit $1a			; 24 1a
B11_19f0:		bmi B11_1a0e ; 30 1c

B11_19f2:		bvs B11_1a50 ; 70 5c

B11_19f4:		lda $1a			; a5 1a
B11_19f6:		and #$38		; 29 38
B11_19f8:		bne B11_19fd ; d0 03

B11_19fa:		jmp $ba90		; 4c 90 ba


B11_19fd:		and #$18		; 29 18
B11_19ff:		bne B11_1a04 ; d0 03

B11_1a01:		jmp $ba8d		; 4c 8d ba


B11_1a04:		and #$08		; 29 08
B11_1a06:		bne B11_1a0b ; d0 03

B11_1a08:		jmp $ba8a		; 4c 8a ba


B11_1a0b:		jmp $bb1f		; 4c 1f bb


B11_1a0e:		lda $1c			; a5 1c
B11_1a10:		cmp #$a0		; c9 a0
B11_1a12:		beq B11_1a32 ; f0 1e

B11_1a14:		dec $1c			; c6 1c
B11_1a16:		bne B11_1a21 ; d0 09

B11_1a18:		lda #$00		; a9 00
B11_1a1a:		sta $1a			; 85 1a
B11_1a1c:		lda #$5d		; a9 5d
B11_1a1e:		jsr unsetGlobalFlag		; 20 fc e7
B11_1a21:		cmp #$50		; c9 50
B11_1a23:		bcs B11_1a31 ; b0 0c

B11_1a25:		lda $015a		; ad 5a 01
B11_1a28:		and #$01		; 29 01
B11_1a2a:		bne B11_1a31 ; d0 05

B11_1a2c:		lda #$ab		; a9 ab
B11_1a2e:		jmp updateEntity_wOam		; 4c 67 f5


B11_1a31:		rts				; 60 


B11_1a32:		dec $1c			; c6 1c
B11_1a34:		lda #$80		; a9 80
B11_1a36:		ldx #$04		; a2 04
B11_1a38:		jsr $8819		; 20 19 88
B11_1a3b:		lda #$81		; a9 81
B11_1a3d:		ldx #$04		; a2 04
B11_1a3f:		jsr $8819		; 20 19 88
B11_1a42:		lda #$8e		; a9 8e
B11_1a44:		ldx #$04		; a2 04
B11_1a46:		jsr $8819		; 20 19 88
B11_1a49:		lda #$8f		; a9 8f
B11_1a4b:		ldx #$04		; a2 04
B11_1a4d:		jmp $8819		; 4c 19 88


B11_1a50:		jsr $8c91		; 20 91 8c
B11_1a53:		bcs B11_1a6f ; b0 1a

B11_1a55:		lda #$08		; a9 08
B11_1a57:		sta $1a			; 85 1a
B11_1a59:		lda #$0c		; a9 0c
B11_1a5b:		jsr func_08e5		; 20 e5 e8
B11_1a5e:		lda #$07		; a9 07
B11_1a60:		sta $1f			; 85 1f
B11_1a62:		lda #$00		; a9 00
B11_1a64:		sta $14			; 85 14
B11_1a66:		sta $15			; 85 15
B11_1a68:		sta $1d			; 85 1d
B11_1a6a:		lda #$5d		; a9 5d
B11_1a6c:		jsr unsetGlobalFlag		; 20 fc e7
B11_1a6f:		lda $015a		; ad 5a 01
B11_1a72:		and #$01		; 29 01
B11_1a74:		bne B11_1a89 ; d0 13

B11_1a76:		lda #$03		; a9 03
B11_1a78:		sta $2a			; 85 2a
B11_1a7a:		lda $1d			; a5 1d
B11_1a7c:		cmp #$40		; c9 40
B11_1a7e:		bcs B11_1a84 ; b0 04

B11_1a80:		lda #$b0		; a9 b0
B11_1a82:		bne B11_1a86 ; d0 02

B11_1a84:		lda #$ab		; a9 ab
B11_1a86:		jmp updateEntity_wOam		; 4c 67 f5


B11_1a89:		rts				; 60 


B11_1a8a:		jmp $8e5a		; 4c 5a 8e


B11_1a8d:		jmp $8e9c		; 4c 9c 8e


B11_1a90:		ldx #$12		; a2 12
B11_1a92:		lda #$80		; a9 80
B11_1a94:		jsr func_13ef		; 20 ef f3
B11_1a97:		ldy #$04		; a0 04
B11_1a99:		jsr $9629		; 20 29 96
B11_1a9c:		lda $15			; a5 15
B11_1a9e:		bne B11_1aa9 ; d0 09

B11_1aa0:		lda $1d			; a5 1d
B11_1aa2:		bmi B11_1aa9 ; 30 05

B11_1aa4:		lda #$45		; a9 45
B11_1aa6:		jsr $8033		; 20 33 80
B11_1aa9:		jsr $8225		; 20 25 82
B11_1aac:		lda #$0c		; a9 0c
B11_1aae:		jsr $8214		; 20 14 82
B11_1ab1:		lda $1a			; a5 1a
B11_1ab3:		and #$03		; 29 03
B11_1ab5:		beq B11_1ac1 ; f0 0a

B11_1ab7:		dec $1c			; c6 1c
B11_1ab9:		bne B11_1b0c ; d0 51

B11_1abb:		lda $1a			; a5 1a
B11_1abd:		and #$fc		; 29 fc
B11_1abf:		sta $1a			; 85 1a
B11_1ac1:		lda #$08		; a9 08
B11_1ac3:		jsr func_1888		; 20 88 f8
B11_1ac6:		lda $17			; a5 17
B11_1ac8:		clc				; 18 
B11_1ac9:		adc #$20		; 69 20
B11_1acb:		sta $17			; 85 17
B11_1acd:		lda #$08		; a9 08
B11_1acf:		jsr func_1888		; 20 88 f8
B11_1ad2:		lda #$08		; a9 08
B11_1ad4:		jsr func_1745		; 20 45 f7
B11_1ad7:		bcc B11_1adb ; 90 02

B11_1ad9:		inc $1f			; e6 1f
B11_1adb:		lda $17			; a5 17
B11_1add:		sec				; 38 
B11_1ade:		sbc #$20		; e9 20
B11_1ae0:		sta $17			; 85 17
B11_1ae2:		lda #$0c		; a9 0c
B11_1ae4:		jsr func_1745		; 20 45 f7
B11_1ae7:		bcc B11_1b0c ; 90 23

B11_1ae9:		lda $1f			; a5 1f
B11_1aeb:		bpl B11_1b02 ; 10 15

B11_1aed:		lda #$40		; a9 40
B11_1aef:		sta $1a			; 85 1a
B11_1af1:		lda #$d3		; a9 d3
B11_1af3:		sta $1b			; 85 1b
B11_1af5:		lda #$d7		; a9 d7
B11_1af7:		sta $1c			; 85 1c
B11_1af9:		lda #$db		; a9 db
B11_1afb:		sta $1d			; 85 1d
B11_1afd:		lda #$5d		; a9 5d
B11_1aff:		jmp setGlobalFlag		; 4c f0 e7


B11_1b02:		lda $1a			; a5 1a
B11_1b04:		ora #$02		; 09 02
B11_1b06:		sta $1a			; 85 1a
B11_1b08:		lda #$40		; a9 40
B11_1b0a:		sta $1c			; 85 1c
B11_1b0c:		lda $1a			; a5 1a
B11_1b0e:		and #$03		; 29 03
B11_1b10:		beq B11_1b19 ; f0 07

B11_1b12:		lda $015a		; ad 5a 01
B11_1b15:		and #$01		; 29 01
B11_1b17:		bne B11_1b1e ; d0 05

B11_1b19:		lda #$ab		; a9 ab
B11_1b1b:		jmp updateEntity_wOam		; 4c 67 f5


B11_1b1e:		rts				; 60 


B11_1b1f:		ldx #$12		; a2 12
B11_1b21:		lda #$c8		; a9 c8
B11_1b23:		jsr func_13ef		; 20 ef f3
B11_1b26:		lda $19			; a5 19
B11_1b28:		and #$04		; 29 04
B11_1b2a:		beq B11_1b39 ; f0 0d

B11_1b2c:		lda $015a		; ad 5a 01
B11_1b2f:		and #$01		; 29 01
B11_1b31:		bne B11_1b38 ; d0 05

B11_1b33:		lda #$b0		; a9 b0
B11_1b35:		jmp updateEntity_wOam		; 4c 67 f5


B11_1b38:		rts				; 60 


B11_1b39:		lda $1a			; a5 1a
B11_1b3b:		and #$03		; 29 03
B11_1b3d:		beq B11_1b5a ; f0 1b

B11_1b3f:		dec $1c			; c6 1c
B11_1b41:		beq B11_1b50 ; f0 0d

B11_1b43:		lda $015a		; ad 5a 01
B11_1b46:		and #$01		; 29 01
B11_1b48:		bne B11_1b4f ; d0 05

B11_1b4a:		lda #$b1		; a9 b1
B11_1b4c:		jmp updateEntity_wOam		; 4c 67 f5


B11_1b4f:		rts				; 60 


B11_1b50:		lda $1a			; a5 1a
B11_1b52:		and #$fc		; 29 fc
B11_1b54:		sta $1a			; 85 1a
B11_1b56:		lda #$a0		; a9 a0
B11_1b58:		sta $1d			; 85 1d
B11_1b5a:		jsr $8225		; 20 25 82
B11_1b5d:		lda #$18		; a9 18
B11_1b5f:		jsr $8214		; 20 14 82
B11_1b62:		lda $015a		; ad 5a 01
B11_1b65:		and #$3f		; 29 3f
B11_1b67:		bne B11_1b6e ; d0 05

B11_1b69:		lda #$46		; a9 46
B11_1b6b:		jsr $8033		; 20 33 80
B11_1b6e:		inc $1d			; e6 1d
B11_1b70:		lda $1d			; a5 1d
B11_1b72:		bpl B11_1b8a ; 10 16

B11_1b74:		lda $1d			; a5 1d
B11_1b76:		cmp #$a0		; c9 a0
B11_1b78:		bcc B11_1b7f ; 90 05

B11_1b7a:		cmp #$e0		; c9 e0
B11_1b7c:		bcs B11_1b7f ; b0 01

B11_1b7e:		rts				; 60 


B11_1b7f:		lda $015a		; ad 5a 01
B11_1b82:		and #$01		; 29 01
B11_1b84:		bne B11_1b89 ; d0 03

B11_1b86:		jmp $bbec		; 4c ec bb


B11_1b89:		rts				; 60 


B11_1b8a:		jsr $bc02		; 20 02 bc
B11_1b8d:		lda #$0b		; a9 0b
B11_1b8f:		jsr func_1888		; 20 88 f8
B11_1b92:		lda #$0b		; a9 0b
B11_1b94:		jsr func_1aac		; 20 ac fa
B11_1b97:		bcs B11_1bb3 ; b0 1a

B11_1b99:		lda #$37		; a9 37
B11_1b9b:		jsr func_08fa		; 20 fa e8
B11_1b9e:		lda $1f			; a5 1f
B11_1ba0:		bmi B11_1bc3 ; 30 21

B11_1ba2:		lda $1a			; a5 1a
B11_1ba4:		ora #$01		; 09 01
B11_1ba6:		sta $1a			; 85 1a
B11_1ba8:		lda #$00		; a9 00
B11_1baa:		sta $14			; 85 14
B11_1bac:		lda #$40		; a9 40
B11_1bae:		sta $1c			; 85 1c
B11_1bb0:		jmp $bbe9		; 4c e9 bb


B11_1bb3:		lda #$0b		; a9 0b
B11_1bb5:		jsr func_1745		; 20 45 f7
B11_1bb8:		bcc B11_1be9 ; 90 2f

B11_1bba:		lda #$37		; a9 37
B11_1bbc:		jsr func_08fa		; 20 fa e8
B11_1bbf:		lda $1f			; a5 1f
B11_1bc1:		bpl B11_1bdb ; 10 18

B11_1bc3:		jsr $bc0a		; 20 0a bc
B11_1bc6:		lda #$10		; a9 10
B11_1bc8:		sta $1a			; 85 1a
B11_1bca:		lda #$d3		; a9 d3
B11_1bcc:		sta $1b			; 85 1b
B11_1bce:		lda #$d7		; a9 d7
B11_1bd0:		sta $1c			; 85 1c
B11_1bd2:		lda #$db		; a9 db
B11_1bd4:		sta $1d			; 85 1d
B11_1bd6:		lda #$5d		; a9 5d
B11_1bd8:		jmp setGlobalFlag		; 4c f0 e7


B11_1bdb:		lda $1a			; a5 1a
B11_1bdd:		ora #$02		; 09 02
B11_1bdf:		sta $1a			; 85 1a
B11_1be1:		lda #$00		; a9 00
B11_1be3:		sta $14			; 85 14
B11_1be5:		lda #$40		; a9 40
B11_1be7:		sta $1c			; 85 1c
B11_1be9:		jsr $bc0a		; 20 0a bc
B11_1bec:		lda $11			; a5 11
B11_1bee:		sta $00			; 85 00
B11_1bf0:		lda $10			; a5 10
B11_1bf2:		asl $00			; 06 00
B11_1bf4:		rol a			; 2a
B11_1bf5:		and #$03		; 29 03
B11_1bf7:		tay				; a8 
B11_1bf8:		lda $bbfe, y	; b9 fe bb
B11_1bfb:		jmp updateEntity_wOam		; 4c 67 f5


B11_1bfe:	.db $af
B11_1bff:		bcs B11_1bb3 ; b0 b2

B11_1c01:		bcs B11_1ba8 ; b0 a5

B11_1c03:	.db $17
B11_1c04:		clc				; 18 
B11_1c05:		adc #$10		; 69 10
B11_1c07:		sta $17			; 85 17
B11_1c09:		rts				; 60 


B11_1c0a:		lda $17			; a5 17
B11_1c0c:		sec				; 38 
B11_1c0d:		sbc #$10		; e9 10
B11_1c0f:		sta $17			; 85 17
B11_1c11:		rts				; 60 


B11_1c12:		jsr $81c2		; 20 c2 81
B11_1c15:		bit wEntityStructs.byteA.w		; 2c 0a 04
B11_1c18:		bvc B11_1c1f ; 50 05

B11_1c1a:		lda #$00		; a9 00
B11_1c1c:		sta $19			; 85 19
B11_1c1e:		rts				; 60 


B11_1c1f:		ldx #$0a		; a2 0a
B11_1c21:		lda #$c8		; a9 c8
B11_1c23:		jsr func_13ef		; 20 ef f3
B11_1c26:		lda $19			; a5 19
B11_1c28:		and #$04		; 29 04
B11_1c2a:		bne B11_1c34 ; d0 08

B11_1c2c:		jsr $8225		; 20 25 82
B11_1c2f:		lda #$08		; a9 08
B11_1c31:		jsr $8214		; 20 14 82
B11_1c34:		lda #$01		; a9 01
B11_1c36:		jsr func_1888		; 20 88 f8
B11_1c39:		lda #$01		; a9 01
B11_1c3b:		jsr func_1aac		; 20 ac fa
B11_1c3e:		bcs B11_1c51 ; b0 11

B11_1c40:		lda $1f			; a5 1f
B11_1c42:		bpl B11_1c51 ; 10 0d

B11_1c44:		jsr $8824		; 20 24 88
B11_1c47:		lda #$26		; a9 26
B11_1c49:		jsr $8033		; 20 33 80
B11_1c4c:		lda #$00		; a9 00
B11_1c4e:		sta $19			; 85 19
B11_1c50:		rts				; 60 


B11_1c51:		lda $19			; a5 19
B11_1c53:		and #$04		; 29 04
B11_1c55:		beq B11_1c65 ; f0 0e

B11_1c57:		lda $015a		; ad 5a 01
B11_1c5a:		and #$0c		; 29 0c
B11_1c5c:		lsr a			; 4a
B11_1c5d:		lsr a			; 4a
B11_1c5e:		tay				; a8 
B11_1c5f:		lda $bc7a, y	; b9 7a bc
B11_1c62:		jmp updateEntity_wOam		; 4c 67 f5


B11_1c65:		lda $11			; a5 11
B11_1c67:		sta $00			; 85 00
B11_1c69:		lda $10			; a5 10
B11_1c6b:		asl $00			; 06 00
B11_1c6d:		rol a			; 2a
B11_1c6e:		asl $00			; 06 00
B11_1c70:		rol a			; 2a
B11_1c71:		and #$03		; 29 03
B11_1c73:		tay				; a8 
B11_1c74:		lda $bc7a, y	; b9 7a bc
B11_1c77:		jmp updateEntity_wOam		; 4c 67 f5


B11_1c7a:		ldy $aead		; ac ad ae
B11_1c7d:		lda $19a5		; ad a5 19
B11_1c80:		and #$02		; 29 02
B11_1c82:		bne B11_1c88 ; d0 04

B11_1c84:		lda #$06		; a9 06
B11_1c86:		bne B11_1c8a ; d0 02

B11_1c88:		lda #$fa		; a9 fa
B11_1c8a:		sta $00			; 85 00
B11_1c8c:		lda #$00		; a9 00
B11_1c8e:		sta $01			; 85 01
B11_1c90:		jsr $8714		; 20 14 87
B11_1c93:		bcs B11_1ca4 ; b0 0f

B11_1c95:		jsr $86fe		; 20 fe 86
B11_1c98:		bcs B11_1ca4 ; b0 0a

B11_1c9a:		lda #$0e		; a9 0e
B11_1c9c:		jsr $bca9		; 20 a9 bc
B11_1c9f:		lda #$b3		; a9 b3
B11_1ca1:		jmp updateEntity_wOam		; 4c 67 f5


B11_1ca4:		lda #$00		; a9 00
B11_1ca6:		sta $19			; 85 19
B11_1ca8:		rts				; 60 


B11_1ca9:		lda #$14		; a9 14
B11_1cab:		sta $00			; 85 00
B11_1cad:		lda #$08		; a9 08
B11_1caf:		sta $01			; 85 01
B11_1cb1:		lda $0507		; ad 07 05
B11_1cb4:		sta $02			; 85 02
B11_1cb6:		lda $0506		; ad 06 05
B11_1cb9:		sta $03			; 85 03
B11_1cbb:		lda #$83		; a9 83
B11_1cbd:		jmp $8847		; 4c 47 88


B11_1cc0:		jmp $94da		; 4c da 94


B11_1cc3:		jsr $81c2		; 20 c2 81
B11_1cc6:		lda $015a		; ad 5a 01
B11_1cc9:		and #$07		; 29 07
B11_1ccb:		bne B11_1ce4 ; d0 17

B11_1ccd:		inc $1b			; e6 1b
B11_1ccf:		lda $1b			; a5 1b
B11_1cd1:		and #$07		; 29 07
B11_1cd3:		cmp #$04		; c9 04
B11_1cd5:		bcc B11_1cdf ; 90 08

B11_1cd7:		cmp #$07		; c9 07
B11_1cd9:		beq B11_1cdf ; f0 04

B11_1cdb:		lda #$08		; a9 08
B11_1cdd:		bne B11_1ce1 ; d0 02

B11_1cdf:		lda #$00		; a9 00
B11_1ce1:		jsr $8214		; 20 14 82
B11_1ce4:		ldx #$0c		; a2 0c
B11_1ce6:		lda #$c0		; a9 c0
B11_1ce8:		jsr func_13ef		; 20 ef f3
B11_1ceb:		lda $14			; a5 14
B11_1ced:		beq B11_1cfa ; f0 0b

B11_1cef:		jsr $81ea		; 20 ea 81
B11_1cf2:		jsr $8225		; 20 25 82
B11_1cf5:		lda #$08		; a9 08
B11_1cf7:		jsr $8214		; 20 14 82
B11_1cfa:		lda #$03		; a9 03
B11_1cfc:		jsr func_1888		; 20 88 f8
B11_1cff:		lda #$03		; a9 03
B11_1d01:		jsr func_1aac		; 20 ac fa
B11_1d04:		lda #$03		; a9 03
B11_1d06:		jsr func_1745		; 20 45 f7
B11_1d09:		bcc B11_1d14 ; 90 09

B11_1d0b:		lda $1f			; a5 1f
B11_1d0d:		bpl B11_1d14 ; 10 05

B11_1d0f:		lda #$27		; a9 27
B11_1d11:		jmp $8033		; 4c 33 80


B11_1d14:		lda $1b			; a5 1b
B11_1d16:		and #$07		; 29 07
B11_1d18:		tay				; a8 
B11_1d19:		lda $bd1f, y	; b9 1f bd
B11_1d1c:		jmp updateEntity_wOam		; 4c 67 f5


B11_1d1f:	.db $d2
B11_1d20:	.db $d3
B11_1d21:	.db $d4
B11_1d22:		cmp $d5, x		; d5 d5
B11_1d24:	.db $d4
B11_1d25:	.db $d3
B11_1d26:	.db $d2
B11_1d27:		jsr $81c2		; 20 c2 81
B11_1d2a:		bit $1a			; 24 1a
B11_1d2c:		bmi B11_1d32 ; 30 04

B11_1d2e:		lda #$08		; a9 08
B11_1d30:		bne B11_1d34 ; d0 02

B11_1d32:		lda #$f8		; a9 f8
B11_1d34:		sta $15			; 85 15
B11_1d36:		dec $1c			; c6 1c
B11_1d38:		bne B11_1d44 ; d0 0a

B11_1d3a:		lda $1a			; a5 1a
B11_1d3c:		eor #$80		; 49 80
B11_1d3e:		sta $1a			; 85 1a
B11_1d40:		lda #$40		; a9 40
B11_1d42:		sta $1c			; 85 1c
B11_1d44:		ldx #$0a		; a2 0a
B11_1d46:		lda #$80		; a9 80
B11_1d48:		jsr func_13ef		; 20 ef f3
B11_1d4b:		lda #$02		; a9 02
B11_1d4d:		jsr func_1888		; 20 88 f8
B11_1d50:		lda #$02		; a9 02
B11_1d52:		jsr func_1aac		; 20 ac fa
B11_1d55:		lda #$02		; a9 02
B11_1d57:		jsr func_1745		; 20 45 f7
B11_1d5a:		bcc B11_1d65 ; 90 09

B11_1d5c:		lda $1f			; a5 1f
B11_1d5e:		bpl B11_1d65 ; 10 05

B11_1d60:		lda #$27		; a9 27
B11_1d62:		jmp $8033		; 4c 33 80


B11_1d65:		ldy #$00		; a0 00
B11_1d67:		bit $15			; 24 15
B11_1d69:		bmi B11_1d6f ; 30 04

B11_1d6b:		ldy #$01		; a0 01
B11_1d6d:		bne B11_1d74 ; d0 05

B11_1d6f:		bit $13			; 24 13
B11_1d71:		bvc B11_1d74 ; 50 01

B11_1d73:		iny				; c8 
B11_1d74:		lda $bd7a, y	; b9 7a bd
B11_1d77:		jmp updateEntity_wOam		; 4c 67 f5


B11_1d7a:		dec $d7, x		; d6 d7
B11_1d7c:		jsr $81c2		; 20 c2 81
B11_1d7f:		ldx #$0c		; a2 0c
B11_1d81:		lda #$c0		; a9 c0
B11_1d83:		jsr func_13ef		; 20 ef f3
B11_1d86:		lda $0509		; ad 09 05
B11_1d89:		and #$04		; 29 04
B11_1d8b:		beq B11_1da6 ; f0 19

B11_1d8d:		lda #$08		; a9 08
B11_1d8f:		sta $00			; 85 00
B11_1d91:		lda #$40		; a9 40
B11_1d93:		sta $01			; 85 01
B11_1d95:		jsr func_1a95		; 20 95 fa
B11_1d98:		bcs B11_1da6 ; b0 0c

B11_1d9a:		lda $0507		; ad 07 05
B11_1d9d:		cmp $17			; c5 17
B11_1d9f:		bcs B11_1da6 ; b0 05

B11_1da1:		lda #$20		; a9 20
B11_1da3:		jsr $8033		; 20 33 80
B11_1da6:		lda #$00		; a9 00
B11_1da8:		jsr func_1888		; 20 88 f8
B11_1dab:		lda #$00		; a9 00
B11_1dad:		jsr func_1745		; 20 45 f7
B11_1db0:		bcc B11_1db4 ; 90 02

B11_1db2:		inc $1f			; e6 1f
B11_1db4:		ldy #$00		; a0 00
B11_1db6:		ldx wEntityWramOffset.w		; ae 5b 01
B11_1db9:		lda $0309, x	; bd 09 03
B11_1dbc:		and #$04		; 29 04
B11_1dbe:		beq B11_1dc1 ; f0 01

B11_1dc0:		iny				; c8 
B11_1dc1:		lda $bdc7, y	; b9 c7 bd
B11_1dc4:		jmp updateEntity_wOam		; 4c 67 f5


B11_1dc7:		cld				; d8 
B11_1dc8:		cmp $c220, y	; d9 20 c2
B11_1dcb:		sta ($a2, x)	; 81 a2
B11_1dcd:		;removed
	.db $10 $a9

B11_1dcf:		cpy #$20		; c0 20
.ifdef ROM_JP
	txa ; $8a
	.db $f4
.else
B11_1dd1:	.db $ef
B11_1dd2:	.db $f3
.endif
B11_1dd3:		bit $1a			; 24 1a
B11_1dd5:		bpl B11_1df2 ; 10 1b

B11_1dd7:		dec $1c			; c6 1c
B11_1dd9:		bne B11_1de4 ; d0 09

B11_1ddb:		lda $1a			; a5 1a
B11_1ddd:		and #$7f		; 29 7f
B11_1ddf:		sta $1a			; 85 1a
B11_1de1:		jmp $bdf2		; 4c f2 bd


B11_1de4:		lda $1c			; a5 1c
B11_1de6:		cmp #$10		; c9 10
B11_1de8:		bne B11_1def ; d0 05

B11_1dea:		lda #$55		; a9 55
B11_1dec:		jsr $8033		; 20 33 80
B11_1def:		jmp $be16		; 4c 16 be


B11_1df2:		jsr $89ce		; 20 ce 89
B11_1df5:		lda $00			; a5 00
B11_1df7:		cmp #$08		; c9 08
B11_1df9:		bcc B11_1dfe ; 90 03

B11_1dfb:		jsr $8a12		; 20 12 8a
B11_1dfe:		ldx #$70		; a2 70
B11_1e00:		lda wEntityStructs.byte9.w, x	; bd 09 04
B11_1e03:		bne B11_1e16 ; d0 11

B11_1e05:		lda $015a		; ad 5a 01
B11_1e08:		and #$7f		; 29 7f
B11_1e0a:		bne B11_1e16 ; d0 0a

B11_1e0c:		lda $1a			; a5 1a
B11_1e0e:		ora #$80		; 09 80
B11_1e10:		sta $1a			; 85 1a
B11_1e12:		lda #$20		; a9 20
B11_1e14:		sta $1c			; 85 1c
B11_1e16:		lda #$05		; a9 05
B11_1e18:		jsr func_1888		; 20 88 f8
B11_1e1b:		lda #$05		; a9 05
B11_1e1d:		jsr func_1aac		; 20 ac fa
B11_1e20:		lda #$05		; a9 05
B11_1e22:		jsr func_1745		; 20 45 f7
B11_1e25:		bcc B11_1e30 ; 90 09

B11_1e27:		lda $1f			; a5 1f
B11_1e29:		bpl B11_1e30 ; 10 05

B11_1e2b:		lda #$27		; a9 27
B11_1e2d:		jmp $8033		; 4c 33 80


B11_1e30:		bit $1a			; 24 1a
B11_1e32:		bpl B11_1e38 ; 10 04

B11_1e34:		ldy #$02		; a0 02
B11_1e36:		bne B11_1e42 ; d0 0a

B11_1e38:		ldy #$00		; a0 00
B11_1e3a:		lda $015a		; ad 5a 01
B11_1e3d:		and #$08		; 29 08
B11_1e3f:		bne B11_1e42 ; d0 01

B11_1e41:		iny				; c8 
B11_1e42:		lda $be48, y	; b9 48 be
B11_1e45:		jmp updateEntity_wOam		; 4c 67 f5


B11_1e48:	.db $dc
B11_1e49:		cmp $20de, x	; dd de 20
B11_1e4c:	.db $c2
B11_1e4d:		sta ($a2, x)	; 81 a2
B11_1e4f:	.db $0c
B11_1e50:		lda #$c0		; a9 c0
B11_1e52:		jsr func_13ef		; 20 ef f3
B11_1e55:		jsr $89ce		; 20 ce 89
B11_1e58:		lda $00			; a5 00
B11_1e5a:		cmp #$10		; c9 10
B11_1e5c:		bcc B11_1e61 ; 90 03

B11_1e5e:		jsr $8a12		; 20 12 8a
B11_1e61:		lda #$0c		; a9 0c
B11_1e63:		jsr $8214		; 20 14 82
B11_1e66:		lda #$00		; a9 00
B11_1e68:		jsr func_1888		; 20 88 f8
B11_1e6b:		lda #$00		; a9 00
B11_1e6d:		jsr func_1aac		; 20 ac fa
B11_1e70:		lda #$00		; a9 00
B11_1e72:		jsr func_1745		; 20 45 f7
B11_1e75:		bcc B11_1e80 ; 90 09

B11_1e77:		lda $1f			; a5 1f
B11_1e79:		bpl B11_1e80 ; 10 05

B11_1e7b:		lda #$27		; a9 27
B11_1e7d:		jmp $8033		; 4c 33 80


B11_1e80:		ldy #$00		; a0 00
B11_1e82:		lda $015a		; ad 5a 01
B11_1e85:		and #$08		; 29 08
B11_1e87:		bne B11_1e8a ; d0 01

B11_1e89:		iny				; c8 
B11_1e8a:		lda $be90, y	; b9 90 be
B11_1e8d:		jmp updateEntity_wOam		; 4c 67 f5


B11_1e90:	.db $df
B11_1e91:		cpx #$a5		; e0 a5
B11_1e93:	.db $1a
B11_1e94:		bpl B11_1e99 ; 10 03

B11_1e96:		jmp $9561		; 4c 61 95


B11_1e99:		jsr $81c2		; 20 c2 81
B11_1e9c:		ldx #$0a		; a2 0a
B11_1e9e:		lda #$00		; a9 00
B11_1ea0:		jsr func_13ef		; 20 ef f3
B11_1ea3:		lda $015a		; ad 5a 01
B11_1ea6:		and #$01		; 29 01
B11_1ea8:		bne B11_1ee2 ; d0 38

B11_1eaa:		inc $1d			; e6 1d
B11_1eac:		lda $1d			; a5 1d
B11_1eae:		and #$3f		; 29 3f
B11_1eb0:		sta $00			; 85 00
B11_1eb2:		lda $19			; a5 19
B11_1eb4:		and #$02		; 29 02
B11_1eb6:		beq B11_1ec0 ; f0 08

B11_1eb8:		lda $00			; a5 00
B11_1eba:		eor #$ff		; 49 ff
B11_1ebc:		sta $00			; 85 00
B11_1ebe:		inc $00			; e6 00
B11_1ec0:		lda #$00		; a9 00
B11_1ec2:		sta $01			; 85 01
B11_1ec4:		lda $00			; a5 00
B11_1ec6:		jsr $8604		; 20 04 86
B11_1ec9:		lda $19			; a5 19
B11_1ecb:		and #$02		; 29 02
B11_1ecd:		bne B11_1ed7 ; d0 08

B11_1ecf:		lda $01			; a5 01
B11_1ed1:		clc				; 18 
B11_1ed2:		adc #$04		; 69 04
B11_1ed4:		jmp $bedc		; 4c dc be


B11_1ed7:		lda $01			; a5 01
B11_1ed9:		sec				; 38 
B11_1eda:		sbc #$04		; e9 04
B11_1edc:		sta $14			; 85 14
B11_1ede:		lda $02			; a5 02
B11_1ee0:		sta $15			; 85 15
B11_1ee2:		lda #$02		; a9 02
B11_1ee4:		jsr func_1888		; 20 88 f8
B11_1ee7:		lda #$02		; a9 02
B11_1ee9:		jsr func_1aac		; 20 ac fa
B11_1eec:		lda #$02		; a9 02
B11_1eee:		jsr func_1745		; 20 45 f7
B11_1ef1:		bcc B11_1efc ; 90 09

B11_1ef3:		lda $1f			; a5 1f
B11_1ef5:		bpl B11_1efc ; 10 05

B11_1ef7:		lda #$27		; a9 27
B11_1ef9:		jmp $8033		; 4c 33 80


B11_1efc:		ldy #$00		; a0 00
B11_1efe:		lda $015a		; ad 5a 01
B11_1f01:		and #$08		; 29 08
B11_1f03:		bne B11_1f06 ; d0 01

B11_1f05:		iny				; c8 
B11_1f06:		lda $bf0c, y	; b9 0c bf
B11_1f09:		jmp updateEntity_wOam		; 4c 67 f5


B11_1f0c:		sbc ($e2, x)	; e1 e2
B11_1f0e:		jmp $9561		; 4c 61 95


B11_1f11:		jmp $94da		; 4c da 94


B11_1f14:		jsr $81c2		; 20 c2 81
B11_1f17:		ldx #$0a		; a2 0a
B11_1f19:		lda #$c0		; a9 c0
B11_1f1b:		jsr func_13ef		; 20 ef f3
B11_1f1e:		jsr $8225		; 20 25 82
B11_1f21:		lda $19			; a5 19
B11_1f23:		and #$04		; 29 04
B11_1f25:		bne B11_1f35 ; d0 0e

B11_1f27:		lda $015a		; ad 5a 01
B11_1f2a:		and #$7f		; 29 7f
B11_1f2c:		bne B11_1f35 ; d0 07

B11_1f2e:		jsr $8a12		; 20 12 8a
B11_1f31:		lda #$c0		; a9 c0
B11_1f33:		sta $15			; 85 15
B11_1f35:		lda #$10		; a9 10
B11_1f37:		jsr $8214		; 20 14 82
B11_1f3a:		lda #$02		; a9 02
B11_1f3c:		jsr func_1888		; 20 88 f8
B11_1f3f:		lda #$02		; a9 02
B11_1f41:		jsr func_1aac		; 20 ac fa
B11_1f44:		lda #$02		; a9 02
B11_1f46:		jsr func_1745		; 20 45 f7
B11_1f49:		bcc B11_1f54 ; 90 09

B11_1f4b:		lda $1f			; a5 1f
B11_1f4d:		bpl B11_1f54 ; 10 05

B11_1f4f:		lda #$27		; a9 27
B11_1f51:		jmp $8033		; 4c 33 80


B11_1f54:		ldy #$00		; a0 00
B11_1f56:		lda $19			; a5 19
B11_1f58:		and #$04		; 29 04
B11_1f5a:		bne B11_1f61 ; d0 05

B11_1f5c:		bit $11			; 24 11
B11_1f5e:		bvs B11_1f61 ; 70 01

B11_1f60:		iny				; c8 
B11_1f61:		lda $bf67, y	; b9 67 bf
B11_1f64:		jmp updateEntity_wOam		; 4c 67 f5


B11_1f67:	.db $eb
B11_1f68:		nop				; ea