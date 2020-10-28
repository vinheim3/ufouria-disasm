

// an enemy update function?
func_a_0000:

B10_0000:		ldx #$00		; a2 00
B10_0002:		ldy #$10		; a0 10
@loop1:
B10_0004:		lda $0309, x	; bd 09 03
B10_0007:		beq B10_0012 ; f0 09

B10_0009:		jsr func_a_0b25		; 20 25 8b
B10_000c:		jsr func_a_00b1		; 20 b1 80
B10_000f:		jsr func_a_0bd3		; 20 d3 8b

B10_0012:		txa				; 8a 
B10_0013:		clc				; 18 
B10_0014:		adc #$10		; 69 10
B10_0016:		tax				; aa 
B10_0017:		dey				; 88 
B10_0018:		bne B10_0004 ; @loop1

// now 8 entities
B10_001a:		ldy #$08		; a0 08
@loop2:
B10_001c:		lda wEntityStructs.byte9.w, x	; bd 09 04
B10_001f:		beq B10_002a ; f0 09

	jsr loadEntityDataInto0page
B10_0024:		jsr func_a_00b1		; 20 b1 80
	jsr saveEntityDataToWram

B10_002a:		txa				; 8a 
B10_002b:		clc				; 18 
B10_002c:		adc #EntityStruct.size		; 69 10
B10_002e:		tax				; aa 
B10_002f:		dey				; 88 
B10_0030:		bne B10_001c ; @loop2

B10_0032:		rts				; 60 


initEntityA:
	asl a
	tay
	lda wBank_a000
	sta wTempBank_a000_duringEntityBank7func

	lda #:initEntity
	jsr setrombank_a000
	jsr initEntity

	lda wTempBank_a000_duringEntityBank7func
	jmp setrombank_a000


// todo: entity update funcs for
func_a_0046:
B10_0046:		asl a			; 0a
B10_0047:		tay				; a8 
B10_0048:		lda wBank_a000			; a5 40
B10_004a:		sta wTempBank_a000_duringEntityBank7func			; 85 c6

B10_004c:		lda #:func_7_000d		; a9 07
B10_004e:		jsr setrombank_a000		; 20 fd fc
B10_0051:		jsr func_7_000d		; 20 0d a0

B10_0054:		lda wTempBank_a000_duringEntityBank7func			; a5 c6
B10_0056:		jmp setrombank_a000		; 4c fd fc


func_a_0059:
B10_0059:		lda $7d			; a5 7d
B10_005b:		cmp $32			; c5 32
B10_005d:		bne B10_007a ; d0 1b

B10_005f:		lda $33			; a5 33
B10_0061:		cmp #$10		; c9 10
B10_0063:		bcs B10_0080 ; b0 1b

B10_0065:		lda #$00		; a9 00
B10_0067:		sta $35			; 85 35
B10_0069:		sta $33			; 85 33
B10_006b:		lda $30			; a5 30
B10_006d:		cmp $7c			; c5 7c
B10_006f:		bne B10_0084 ; d0 13

B10_0071:		lda $31			; a5 31
B10_0073:		bne B10_0084 ; d0 0f

B10_0075:		lda #$56		; a9 56
B10_0077:		jmp unsetGlobalFlag		; 4c fc e7


B10_007a:		bcc B10_0080 ; 90 04

B10_007c:		lda #$10		; a9 10
B10_007e:		bne B10_0082 ; d0 02

B10_0080:		lda #$f0		; a9 f0
B10_0082:		sta $35			; 85 35
B10_0084:		lda $7c			; a5 7c
B10_0086:		cmp $30			; c5 30
B10_0088:		bne B10_00a6 ; d0 1c

B10_008a:		lda $31			; a5 31
B10_008c:		cmp #$10		; c9 10
B10_008e:		bcs B10_00ac ; b0 1c

B10_0090:		lda #$00		; a9 00
B10_0092:		sta $34			; 85 34
B10_0094:		sta $31			; 85 31
B10_0096:		lda $32			; a5 32
B10_0098:		cmp $7d			; c5 7d
B10_009a:		bne B10_00a5 ; d0 09

B10_009c:		lda $33			; a5 33
B10_009e:		bne B10_00a5 ; d0 05

B10_00a0:		lda #$56		; a9 56
B10_00a2:		jmp unsetGlobalFlag		; 4c fc e7


B10_00a5:		rts				; 60 


B10_00a6:		bcc B10_00ac ; 90 04

B10_00a8:		lda #$10		; a9 10
B10_00aa:		bne B10_00ae ; d0 02

B10_00ac:		lda #$f0		; a9 f0
B10_00ae:		sta $34			; 85 34
B10_00b0:		rts				; 60 


func_a_00b1:
// double idx for init or update
B10_00b1:		lda wCachedEntityStruct.id			; a5 18
B10_00b3:		asl a			; 0a
B10_00b4:		tay				; a8 

//
B10_00b5:		lda wCachedEntityStruct.byte9			; a5 19
B10_00b7:		bpl B10_00c5 ; 10 0c

// updated for the 1st time
B10_00b9:		and #$7f		; 29 7f
B10_00bb:		sta wCachedEntityStruct.byte9			; 85 19

// has jumptable idxed y
B10_00bd:		lda #:initEntity		; a9 07
B10_00bf:		jsr setrombank_a000		; 20 fd fc
B10_00c2:		jmp initEntity		; 4c 00 a0

// updated not for the 1st time
B10_00c5:		lda $04ea		; ad ea 04
B10_00c8:		and #$02		; 29 02
B10_00ca:		bne B10_00de ; @done

B10_00cc:		lda #$0b		; a9 0b
B10_00ce:		jsr setrombank_a000		; 20 fd fc

B10_00d1:		lda data_a_00df.w, y	; b9 df 80
B10_00d4:		sta wNonGenericJumpTableAddr			; 85 00
B10_00d6:		lda data_a_00df.w+1, y	; b9 e0 80
B10_00d9:		sta wNonGenericJumpTableAddr+1			; 85 01
B10_00db:		jmp (wNonGenericJumpTableAddr)
@done:
B10_00de:		rts				; 60

data_a_00df:
	.dw func_a_1657
	.dw func_a_1695
	.dw func_a_170d
	.dw func_a_173a
	.dw stub_a_1656
	.dw func_a_1879
	.dw func_a_189a
	.dw func_a_19e4
	.dw stub_a_1656
	.dw stub_a_1656
	.dw func_a_1a08
	.dw stub_a_1656
	.dw func_a_1a68
	.dw func_a_1aff
	.dw func_a_1c35
	.dw enUpdate_treasureChest
	.dw stub_b_1043
	.dw func_b_1045
	.dw $9dd3
	.dw $9e60
	.dw $9f11
	.dw $9f3a
	.dw $a0c6
	.dw $b04f
	.dw $b0ba
	.dw $b181
	.dw $b1fb
	.dw $b272
	.dw $b32a
	.dw $b349
	.dw $b3ae
	.dw $b3b1
	.dw $b470
	.dw $b044
	.dw enUpdate_freeonFight
	.dw $b4d6
	.dw $b4db
	.dw $a1d8
	.dw $a20b
	.dw $a4ec
	.dw $a20b
	.dw $a4fb
	.dw $a53a
	.dw $a688
	.dw $a722
	.dw $a8ac
	.dw $a959
	.dw $a9a8
	.dw $a9b9
	.dw $a9f6
	.dw $aab9
	.dw $aba6
	.dw $b4e0
	.dw $b4e5
	.dw $b545
	.dw $b548
	.dw $abd0
	.dw $b5e9
	.dw $b7cd
	.dw $b7d2
	.dw $b7d7
	.dw $b9b4
	.dw $b9b9
	.dw $b9be
	.dw $ac85
	.dw $ad46
	.dw $ad83
	.dw $a39c
	.dw $b9df
	.dw $bc12
	.dw $bc7e
	.dw $af1c
	.dw $af1d
	.dw $af6b
	.dw $af9c
	.dw $af9d
	.dw $afcc
	.dw $bcc0
	.dw $bcc3
	.dw $bd27
	.dw $ae6c
	.dw $ae7e
	.dw $aebb
	.dw $bd7c
	.dw $bdc9
	.dw $be4b
	.dw $be92
	.dw $adb2
	.dw $9f3a
	.dw enUpdate_dialog
	.dw $bf0e
B10_0195:		ora ($bf), y	; 11 bf
B10_0197:	.db $14
B10_0198:	.db $bf
B10_0199:	.db $34
B10_019a:		bcs B10_01d5 ; b0 39

B10_019c:		bcs B10_01dc ; b0 3e

B10_019e:		.db $b0


func_a_019f:
	lda $1f
B10_01a1:		and #$07		; 29 07
B10_01a3:		tay				; a8 
B10_01a4:		lda data_a_01ba.w, y	; b9 ba 81
B10_01a7:		sta $1e			; 85 1e
B10_01a9:		jsr checkGlobalFlag		; 20 e9 e7
B10_01ac:		beq B10_01b5 ; f0 07

B10_01ae:		lda #$00		; a9 00
B10_01b0:		sta $19			; 85 19
B10_01b2:		pla				; 68 
B10_01b3:		pla				; 68 
B10_01b4:		rts				; 60 


B10_01b5:		lda $1e			; a5 1e
B10_01b7:		jmp setGlobalFlag		; 4c f0 e7

data_a_01ba:
	.db $80 $81 $82 $83 $84 $85 $86 $87


func_a_01c2:
B10_01c2:		jsr func_0709		; 20 09 e7
B10_01c5:		lda $015d		; ad 5d 01
B10_01c8:		bpl B10_01d5 ; 10 0b

B10_01ca:		pla				; 68 
B10_01cb:		pla				; 68 
B10_01cc:		lda #$00		; a9 00
B10_01ce:		sta $19			; 85 19
B10_01d0:		lda $1e			; a5 1e
B10_01d2:		jmp unsetGlobalFlag		; 4c fc e7


B10_01d5:		rts				; 60 


B10_01d6:		jsr func_0709		; 20 09 e7
B10_01d9:		lda $015d		; ad 5d 01
B10_01dc:		beq B10_01e9 ; f0 0b

B10_01de:		pla				; 68 
B10_01df:		pla				; 68 
B10_01e0:		lda #$00		; a9 00
B10_01e2:		sta $19			; 85 19
B10_01e4:		lda $1e			; a5 1e
B10_01e6:		jmp unsetGlobalFlag		; 4c fc e7


B10_01e9:		rts				; 60 


func_a_01ea:
B10_01ea:		lda $4a			; a5 4a
B10_01ec:		and #$03		; 29 03
B10_01ee:		beq B10_0213 ; f0 23

B10_01f0:		cmp #$01		; c9 01
B10_01f2:		beq B10_0203 ; f0 0f

B10_01f4:		cmp #$02		; c9 02
B10_01f6:		bne B10_0213 ; d0 1b

B10_01f8:		lda $19			; a5 19
B10_01fa:		and #$fd		; 29 fd
B10_01fc:		sta $19			; 85 19
B10_01fe:		lda $14			; a5 14
B10_0200:		bmi B10_020d ; 30 0b

B10_0202:		rts				; 60 


B10_0203:		lda $19			; a5 19
B10_0205:		ora #$02		; 09 02
B10_0207:		sta $19			; 85 19
B10_0209:		lda $14			; a5 14
B10_020b:		bmi B10_0213 ; 30 06

B10_020d:		eor #$ff		; 49 ff
B10_020f:		sta $14			; 85 14
B10_0211:		inc $14			; e6 14
B10_0213:		rts				; 60 


func_a_0214:
B10_0214:		sta $14			; 85 14
B10_0216:		lda $19			; a5 19
B10_0218:		and #$02		; 29 02
B10_021a:		beq B10_0224 ; @done

B10_021c:		lda $14			; a5 14
B10_021e:		eor #$ff		; 49 ff
B10_0220:		sta $14			; 85 14
B10_0222:		inc $14			; e6 14
@done:
B10_0224:		rts				; 60 


func_a_0225:
B10_0225:		bit $4a			; 24 4a
B10_0227:		bvc B10_023b ; 50 12

B10_0229:		lda $19			; a5 19
B10_022b:		and #$02		; 29 02
B10_022d:		bne B10_0235 ; d0 06

B10_022f:		lda $19			; a5 19
B10_0231:		ora #$02		; 09 02
B10_0233:		bne B10_0239 ; d0 04

B10_0235:		lda $19			; a5 19
B10_0237:		and #$fd		; 29 fd
B10_0239:		sta $19			; 85 19
B10_023b:		rts				; 60 


B10_023c:		lda $00			; a5 00
B10_023e:		sec				; 38 
B10_023f:		sbc $16			; e5 16
B10_0241:		bcs B10_0260 ; b0 1d

B10_0243:		eor #$ff		; 49 ff
B10_0245:		clc				; 18 
B10_0246:		adc #$01		; 69 01
B10_0248:		sta $02			; 85 02
B10_024a:		lda $01			; a5 01
B10_024c:		sec				; 38 
B10_024d:		sbc $17			; e5 17
B10_024f:		bcs B10_025b ; b0 0a

B10_0251:		eor #$ff		; 49 ff
B10_0253:		clc				; 18 
B10_0254:		adc #$01		; 69 01
B10_0256:		ldy #$30		; a0 30
B10_0258:		jmp $8270		; 4c 70 82


B10_025b:		ldy #$20		; a0 20
B10_025d:		jmp $82c4		; 4c c4 82


B10_0260:		sta $02			; 85 02
B10_0262:		lda $17			; a5 17
B10_0264:		sec				; 38 
B10_0265:		sbc $01			; e5 01
B10_0267:		bcs B10_02c2 ; b0 59

B10_0269:		eor #$ff		; 49 ff
B10_026b:		clc				; 18 
B10_026c:		adc #$01		; 69 01
B10_026e:		ldy #$10		; a0 10
B10_0270:		cmp $02			; c5 02
B10_0272:		bcc B10_0280 ; 90 0c

B10_0274:		sta $03			; 85 03
B10_0276:		tya				; 98 
B10_0277:		ora #$08		; 09 08
B10_0279:		tay				; a8 
B10_027a:		lda $03			; a5 03
B10_027c:		lsr a			; 4a
B10_027d:		jmp $8282		; 4c 82 82


B10_0280:		lsr $02			; 46 02
B10_0282:		cmp $02			; c5 02
B10_0284:		bcs B10_02a2 ; b0 1c

B10_0286:		lsr $02			; 46 02
B10_0288:		cmp $02			; c5 02
B10_028a:		bcs B10_0295 ; b0 09

B10_028c:		lsr $02			; 46 02
B10_028e:		cmp $02			; c5 02
B10_0290:		bcc B10_0293 ; 90 01

B10_0292:		iny				; c8 
B10_0293:		tya				; 98 
B10_0294:		rts				; 60 


B10_0295:		lsr a			; 4a
B10_0296:		cmp $02			; c5 02
B10_0298:		bcs B10_029e ; b0 04

B10_029a:		tya				; 98 
B10_029b:		ora #$02		; 09 02
B10_029d:		rts				; 60 


B10_029e:		tya				; 98 
B10_029f:		ora #$03		; 09 03
B10_02a1:		rts				; 60 


B10_02a2:		lsr a			; 4a
B10_02a3:		cmp $02			; c5 02
B10_02a5:		bcs B10_02b5 ; b0 0e

B10_02a7:		lsr $02			; 46 02
B10_02a9:		cmp $02			; c5 02
B10_02ab:		bcs B10_02b1 ; b0 04

B10_02ad:		tya				; 98 
B10_02ae:		ora #$04		; 09 04
B10_02b0:		rts				; 60 


B10_02b1:		tya				; 98 
B10_02b2:		ora #$05		; 09 05
B10_02b4:		rts				; 60 


B10_02b5:		lsr a			; 4a
B10_02b6:		cmp $02			; c5 02
B10_02b8:		bcs B10_02be ; b0 04

B10_02ba:		tya				; 98 
B10_02bb:		ora #$06		; 09 06
B10_02bd:		rts				; 60 


B10_02be:		tya				; 98 
B10_02bf:		ora #$07		; 09 07
B10_02c1:		rts				; 60 


B10_02c2:		ldy #$00		; a0 00
B10_02c4:		cmp $02			; c5 02
B10_02c6:		bcs B10_02d5 ; b0 0d

B10_02c8:		sta $03			; 85 03
B10_02ca:		tya				; 98 
B10_02cb:		ora #$08		; 09 08
B10_02cd:		tay				; a8 
B10_02ce:		lda $03			; a5 03
B10_02d0:		lsr $02			; 46 02
B10_02d2:		jmp $82d6		; 4c d6 82


B10_02d5:		lsr a			; 4a
B10_02d6:		cmp $02			; c5 02
B10_02d8:		bcs B10_02fb ; b0 21

B10_02da:		lsr $02			; 46 02
B10_02dc:		cmp $02			; c5 02
B10_02de:		bcs B10_02ee ; b0 0e

B10_02e0:		lsr $02			; 46 02
B10_02e2:		cmp $02			; c5 02
B10_02e4:		bcs B10_02ea ; b0 04

B10_02e6:		tya				; 98 
B10_02e7:		ora #$07		; 09 07
B10_02e9:		rts				; 60 


B10_02ea:		tya				; 98 
B10_02eb:		ora #$06		; 09 06
B10_02ed:		rts				; 60 


B10_02ee:		lsr a			; 4a
B10_02ef:		cmp $02			; c5 02
B10_02f1:		bcs B10_02f7 ; b0 04

B10_02f3:		tya				; 98 
B10_02f4:		ora #$05		; 09 05
B10_02f6:		rts				; 60 


B10_02f7:		tya				; 98 
B10_02f8:		ora #$04		; 09 04
B10_02fa:		rts				; 60 


B10_02fb:		lsr a			; 4a
B10_02fc:		cmp $02			; c5 02
B10_02fe:		bcs B10_030e ; b0 0e

B10_0300:		lsr $02			; 46 02
B10_0302:		cmp $02			; c5 02
B10_0304:		bcs B10_030a ; b0 04

B10_0306:		tya				; 98 
B10_0307:		ora #$03		; 09 03
B10_0309:		rts				; 60 


B10_030a:		tya				; 98 
B10_030b:		ora #$02		; 09 02
B10_030d:		rts				; 60 


B10_030e:		lsr a			; 4a
B10_030f:		cmp $02			; c5 02
B10_0311:		bcs B10_0314 ; b0 01

B10_0313:		iny				; c8 
B10_0314:		tya				; 98 
B10_0315:		rts				; 60 


B10_0316:		sta $02			; 85 02
B10_0318:		lda #$00		; a9 00
B10_031a:		asl $02			; 06 02
B10_031c:		rol a			; 2a
B10_031d:		asl $02			; 06 02
B10_031f:		rol a			; 2a
B10_0320:		sta $03			; 85 03
B10_0322:		lda $02			; a5 02
B10_0324:		clc				; 18 
B10_0325:		adc $8332		; 6d 32 83
B10_0328:		sta $00			; 85 00
B10_032a:		lda $03			; a5 03
B10_032c:		adc $8333		; 6d 33 83
B10_032f:		sta $01			; 85 01
B10_0331:		rts				; 60 


B10_0332:	.db $34
B10_0333:	.db $83
B10_0334:		.db $00				; 00
B10_0335:		.db $00				; 00
B10_0336:		.db $00				; 00
B10_0337:		bpl B10_02c8 ; 10 8f

B10_0339:		.db $00				; 00
B10_033a:		inc $1e0f, x	; fe 0f 1e
B10_033d:		ora ($f6, x)	; 01 f6
B10_033f:	.db $0f
B10_0340:		ldy $ea01		; ac 01 ea
B10_0343:	.db $0f
B10_0344:	.db $3a
B10_0345:	.db $02
B10_0346:		cld				; d8 
B10_0347:	.db $0f
B10_0348:	.db $c7
B10_0349:	.db $02
B10_034a:	.db $c2
B10_034b:	.db $0f
B10_034c:	.db $54
B10_034d:	.db $03
B10_034e:		ldx $0f			; a6 0f
B10_0350:	.db $df
B10_0351:	.db $03
B10_0352:		stx $0f			; 86 0f
B10_0354:		adc #$04		; 69 04
B10_0356:		adc ($0f, x)	; 61 0f
B10_0358:	.db $f2
B10_0359:	.db $04
B10_035a:		sec				; 38 
B10_035b:	.db $0f
B10_035c:		adc $0905, y	; 79 05 09
B10_035f:	.db $0f
B10_0360:		inc $d605, x	; fe 05 d6
B10_0363:		asl $0682		; 0e 82 06
B10_0366:	.db $9e
B10_0367:		asl $0704		; 0e 04 07
B10_036a:		adc ($0e, x)	; 61 0e
B10_036c:	.db $83
B10_036d:	.db $07
B10_036e:		and ($0e, x)	; 21 0e
B10_0370:		.db $00				; 00
B10_0371:		php				; 08 
B10_0372:	.db $db
B10_0373:		ora $087b		; 0d 7b 08
B10_0376:	.db $92
B10_0377:		ora $08f2		; 0d f2 08
B10_037a:	.db $44
B10_037b:		ora $0968		; 0d 68 09
B10_037e:	.db $f2
B10_037f:	.db $0c
B10_0380:	.db $da
B10_0381:		ora #$9c		; 09 9c
B10_0383:	.db $0c
B10_0384:		eor #$0a		; 49 0a
B10_0386:	.db $42
B10_0387:	.db $0c
B10_0388:		lda $0a, x		; b5 0a
B10_038a:		cpx $0b			; e4 0b
B10_038c:		ora $820b, x	; 1d 0b 82
B10_038f:	.db $0b
B10_0390:	.db $82
B10_0391:	.db $0b
B10_0392:		ora $e40b, x	; 1d 0b e4
B10_0395:	.db $0b
B10_0396:		lda $0a, x		; b5 0a
B10_0398:	.db $42
B10_0399:	.db $0c
B10_039a:		eor #$0a		; 49 0a
B10_039c:	.db $9c
B10_039d:	.db $0c
B10_039e:	.db $da
B10_039f:		ora #$f2		; 09 f2
B10_03a1:	.db $0c
B10_03a2:		pla				; 68 
B10_03a3:		ora #$44		; 09 44
B10_03a5:		ora $08f2		; 0d f2 08
B10_03a8:	.db $92
B10_03a9:		ora $087b		; 0d 7b 08
B10_03ac:	.db $db
B10_03ad:		ora $0800		; 0d 00 08
B10_03b0:		and ($0e, x)	; 21 0e
B10_03b2:	.db $83
B10_03b3:	.db $07
B10_03b4:		adc ($0e, x)	; 61 0e
B10_03b6:	.db $04
B10_03b7:	.db $07
B10_03b8:	.db $9e
B10_03b9:		asl $0682		; 0e 82 06
B10_03bc:		dec $0e, x		; d6 0e
B10_03be:		inc $0905, x	; fe 05 09
B10_03c1:	.db $0f
B10_03c2:		adc $3805, y	; 79 05 38
B10_03c5:	.db $0f
B10_03c6:	.db $f2
B10_03c7:	.db $04
B10_03c8:		adc ($0f, x)	; 61 0f
B10_03ca:		adc #$04		; 69 04
B10_03cc:		stx $0f			; 86 0f
B10_03ce:	.db $df
B10_03cf:	.db $03
B10_03d0:		ldx $0f			; a6 0f
B10_03d2:	.db $54
B10_03d3:	.db $03
B10_03d4:	.db $c2
B10_03d5:	.db $0f
B10_03d6:	.db $c7
B10_03d7:	.db $02
B10_03d8:		cld				; d8 
B10_03d9:	.db $0f
B10_03da:	.db $3a
B10_03db:	.db $02
B10_03dc:		nop				; ea 
B10_03dd:	.db $0f
B10_03de:		ldy $f601		; ac 01 f6
B10_03e1:	.db $0f
B10_03e2:		asl $fe01, x	; 1e 01 fe
B10_03e5:	.db $0f
B10_03e6:	.db $8f
B10_03e7:		.db $00				; 00
B10_03e8:		.db $00				; 00
B10_03e9:		bpl B10_03eb ; 10 00

B10_03eb:		.db $00				; 00
B10_03ec:		inc $710f, x	; fe 0f 71
B10_03ef:	.db $ff
B10_03f0:		inc $0f, x		; f6 0f
B10_03f2:	.db $e2
B10_03f3:		inc $0fea, x	; fe ea 0f
B10_03f6:	.db $54
B10_03f7:		inc $0fd8, x	; fe d8 0f
B10_03fa:		dec $fd			; c6 fd
B10_03fc:	.db $c2
B10_03fd:	.db $0f
B10_03fe:		and $a6fd, y	; 39 fd a6
B10_0401:	.db $0f
B10_0402:		ldy $86fc		; ac fc 86
B10_0405:	.db $0f
B10_0406:		and ($fc, x)	; 21 fc
B10_0408:		adc ($0f, x)	; 61 0f
B10_040a:	.db $97
B10_040b:	.db $fb
B10_040c:		sec				; 38 
B10_040d:	.db $0f
B10_040e:		asl $09fb		; 0e fb 09
B10_0411:	.db $0f
B10_0412:	.db $87
B10_0413:	.db $fa
B10_0414:		dec $0e, x		; d6 0e
B10_0416:	.db $02
B10_0417:	.db $fa
B10_0418:	.db $9e
B10_0419:		asl $f97e		; 0e 7e f9
B10_041c:		adc ($0e, x)	; 61 0e
B10_041e:	.db $fc
B10_041f:		sed				; f8 
B10_0420:		and ($0e, x)	; 21 0e
B10_0422:		adc $dbf8, x	; 7d f8 db
B10_0425:		ora $f800		; 0d 00 f8
B10_0428:	.db $92
B10_0429:		ora $f785		; 0d 85 f7
B10_042c:	.db $44
B10_042d:		ora $f70e		; 0d 0e f7
B10_0430:	.db $f2
B10_0431:	.db $0c
B10_0432:		tya				; 98 
B10_0433:		inc $9c, x		; f6 9c
B10_0435:	.db $0c
B10_0436:		rol $f6			; 26 f6
B10_0438:	.db $42
B10_0439:	.db $0c
B10_043a:	.db $b7
B10_043b:		sbc $e4, x		; f5 e4
B10_043d:	.db $0b
B10_043e:	.db $4b
B10_043f:		sbc $82, x		; f5 82
B10_0441:	.db $0b
B10_0442:	.db $e3
B10_0443:	.db $f4
B10_0444:		ora $7e0b, x	; 1d 0b 7e
B10_0447:	.db $f4
B10_0448:		lda $0a, x		; b5 0a
B10_044a:	.db $1c
B10_044b:	.db $f4
B10_044c:		eor #$0a		; 49 0a
B10_044e:		ldx $daf3, y	; be f3 da
B10_0451:		ora #$64		; 09 64
B10_0453:	.db $f3
B10_0454:		pla				; 68 
B10_0455:		ora #$0e		; 09 0e
B10_0457:	.db $f3
B10_0458:	.db $f2
B10_0459:		php				; 08 
B10_045a:		ldy $7bf2, x	; bc f2 7b
B10_045d:		php				; 08 
B10_045e:	.db $6e $f2 $00
B10_0461:		php				; 08 
B10_0462:		and $f2			; 25 f2
B10_0464:	.db $83
B10_0465:	.db $07
B10_0466:	.db $df
B10_0467:		sbc ($04), y	; f1 04
B10_0469:	.db $07
B10_046a:	.db $9f
B10_046b:		sbc ($82), y	; f1 82
B10_046d:		asl $62			; 06 62
B10_046f:		sbc ($fe), y	; f1 fe
B10_0471:		ora $2a			; 05 2a
B10_0473:		sbc ($79), y	; f1 79
B10_0475:		ora $f7			; 05 f7
B10_0477:		beq B10_046b ; f0 f2

B10_0479:	.db $04
B10_047a:		iny				; c8 
B10_047b:		;removed
	.db $f0 $69

B10_047d:	.db $04
B10_047e:	.db $9f
B10_047f:		;removed
	.db $f0 $df

B10_0481:	.db $03
B10_0482:	.db $7a
B10_0483:		beq B10_04d9 ; f0 54

B10_0485:	.db $03
B10_0486:	.db $5a
B10_0487:		;removed
	.db $f0 $c7

B10_0489:	.db $02
B10_048a:		rol $3af0, x	; 3e f0 3a
B10_048d:	.db $02
B10_048e:		plp				; 28 
B10_048f:		beq B10_043d ; f0 ac

B10_0491:		ora ($16, x)	; 01 16
B10_0493:		;removed
	.db $f0 $1e

B10_0495:		ora ($0a, x)	; 01 0a
B10_0497:		beq B10_0428 ; f0 8f

B10_0499:		.db $00				; 00
B10_049a:	.db $02
B10_049b:		beq B10_049d ; f0 00

B10_049d:		.db $00				; 00
B10_049e:		.db $00				; 00
B10_049f:		beq B10_0512 ; f0 71

B10_04a1:	.db $ff
B10_04a2:	.db $02
B10_04a3:		beq B10_0487 ; f0 e2

B10_04a5:		inc $f00a, x	; fe 0a f0
B10_04a8:	.db $54
B10_04a9:		inc $f016, x	; fe 16 f0
B10_04ac:		dec $fd			; c6 fd
B10_04ae:		plp				; 28 
B10_04af:		beq B10_04ea ; f0 39

B10_04b1:		sbc $f03e, x	; fd 3e f0
B10_04b4:		ldy $5afc		; ac fc 5a
B10_04b7:		beq B10_04da ; f0 21

B10_04b9:	.db $fc
B10_04ba:	.db $7a
B10_04bb:		beq B10_0454 ; f0 97

B10_04bd:	.db $fb
B10_04be:	.db $9f
B10_04bf:		;removed
	.db $f0 $0e

B10_04c1:	.db $fb
B10_04c2:		iny				; c8 
B10_04c3:		beq B10_044c ; f0 87

B10_04c5:	.db $fa
B10_04c6:	.db $f7
B10_04c7:		beq B10_04cb ; f0 02

B10_04c9:	.db $fa
B10_04ca:		rol a			; 2a
B10_04cb:		sbc ($7e), y	; f1 7e
B10_04cd:		sbc $f162, y	; f9 62 f1
B10_04d0:	.db $fc
B10_04d1:		sed				; f8 
B10_04d2:	.db $9f
B10_04d3:		sbc ($7d), y	; f1 7d
B10_04d5:		sed				; f8 
B10_04d6:	.db $df
B10_04d7:		sbc ($00), y	; f1 00
B10_04d9:		sed				; f8 
B10_04da:		and $f2			; 25 f2
B10_04dc:		sta $f7			; 85 f7
B10_04de:		ror $0ef2		; 6e f2 0e
B10_04e1:	.db $f7
B10_04e2:		ldy $98f2, x	; bc f2 98
B10_04e5:		inc $0e, x		; f6 0e
B10_04e7:	.db $f3
B10_04e8:		rol $f6			; 26 f6
B10_04ea:	.db $64
B10_04eb:	.db $f3
B10_04ec:	.db $b7
B10_04ed:		sbc $be, x		; f5 be
B10_04ef:	.db $f3
B10_04f0:	.db $4b
B10_04f1:		sbc $1c, x		; f5 1c
B10_04f3:	.db $f4
B10_04f4:	.db $e3
B10_04f5:	.db $f4
B10_04f6:		ror $7ef4, x	; 7e f4 7e
B10_04f9:	.db $f4
B10_04fa:	.db $e3
B10_04fb:	.db $f4
B10_04fc:	.db $1c
B10_04fd:	.db $f4
B10_04fe:	.db $4b
B10_04ff:		sbc $be, x		; f5 be
B10_0501:	.db $f3
B10_0502:	.db $b7
B10_0503:		sbc $64, x		; f5 64
B10_0505:	.db $f3
B10_0506:		rol $f6			; 26 f6
B10_0508:		asl $98f3		; 0e f3 98
B10_050b:		inc $bc, x		; f6 bc
B10_050d:	.db $f2
B10_050e:		asl $6ef7		; 0e f7 6e
B10_0511:	.db $f2
B10_0512:		sta $f7			; 85 f7
B10_0514:		and $f2			; 25 f2
B10_0516:		.db $00				; 00
B10_0517:		sed				; f8 
B10_0518:	.db $df
B10_0519:		sbc ($7d), y	; f1 7d
B10_051b:		sed				; f8 
B10_051c:	.db $9f
B10_051d:		sbc ($fc), y	; f1 fc
B10_051f:		sed				; f8 
B10_0520:	.db $62
B10_0521:		sbc ($7e), y	; f1 7e
B10_0523:		sbc $f12a, y	; f9 2a f1
B10_0526:	.db $02
B10_0527:	.db $fa
B10_0528:	.db $f7
B10_0529:		;removed
	.db $f0 $87

B10_052b:	.db $fa
B10_052c:		iny				; c8 
B10_052d:		;removed
	.db $f0 $0e

B10_052f:	.db $fb
B10_0530:	.db $9f
B10_0531:		beq B10_04ca ; f0 97

B10_0533:	.db $fb
B10_0534:	.db $7a
B10_0535:		beq B10_0558 ; f0 21

B10_0537:	.db $fc
B10_0538:	.db $5a
B10_0539:		beq B10_04e7 ; f0 ac

B10_053b:	.db $fc
B10_053c:		rol $39f0, x	; 3e f0 39
B10_053f:		sbc $f028, x	; fd 28 f0
B10_0542:		dec $fd			; c6 fd
B10_0544:		asl $f0, x		; 16 f0
B10_0546:	.db $54
B10_0547:		inc $f00a, x	; fe 0a f0
B10_054a:	.db $e2
B10_054b:		inc $f002, x	; fe 02 f0
B10_054e:		adc ($ff), y	; 71 ff
B10_0550:		.db $00				; 00
B10_0551:		beq B10_0553 ; f0 00

B10_0553:		.db $00				; 00
B10_0554:	.db $02
B10_0555:		;removed
	.db $f0 $8f

B10_0557:		.db $00				; 00
B10_0558:		asl a			; 0a
B10_0559:		beq B10_0579 ; f0 1e

B10_055b:		ora ($16, x)	; 01 16
B10_055d:		beq B10_050b ; f0 ac

B10_055f:		ora ($28, x)	; 01 28
B10_0561:		beq B10_059d ; f0 3a

B10_0563:	.db $02
B10_0564:		rol $c7f0, x	; 3e f0 c7
B10_0567:	.db $02
B10_0568:	.db $5a
B10_0569:		beq B10_05bf ; f0 54

B10_056b:	.db $03
B10_056c:	.db $7a
B10_056d:		beq B10_054e ; f0 df

B10_056f:	.db $03
B10_0570:	.db $9f
B10_0571:		beq B10_05dc ; f0 69

B10_0573:	.db $04
B10_0574:		iny				; c8 
B10_0575:		beq B10_0569 ; f0 f2

B10_0577:	.db $04
B10_0578:	.db $f7
B10_0579:		beq B10_05f4 ; f0 79

B10_057b:		ora $2a			; 05 2a
B10_057d:		sbc ($fe), y	; f1 fe
B10_057f:		ora $62			; 05 62
B10_0581:		sbc ($82), y	; f1 82
B10_0583:		asl $9f			; 06 9f
B10_0585:		sbc ($04), y	; f1 04
B10_0587:	.db $07
B10_0588:	.db $df
B10_0589:		sbc ($83), y	; f1 83
B10_058b:	.db $07
B10_058c:		and $f2			; 25 f2
B10_058e:		.db $00				; 00
B10_058f:		php				; 08 
B10_0590:		ror $7bf2		; 6e f2 7b
B10_0593:		php				; 08 
B10_0594:		ldy $f2f2, x	; bc f2 f2
B10_0597:		php				; 08 
B10_0598:		asl $68f3		; 0e f3 68
B10_059b:		ora #$64		; 09 64
B10_059d:	.db $f3
B10_059e:	.db $da
B10_059f:		ora #$be		; 09 be
B10_05a1:	.db $f3
B10_05a2:		eor #$0a		; 49 0a
B10_05a4:	.db $1c
B10_05a5:	.db $f4
B10_05a6:		lda $0a, x		; b5 0a
B10_05a8:		ror $1df4, x	; 7e f4 1d
B10_05ab:	.db $0b
B10_05ac:	.db $e3
B10_05ad:	.db $f4
B10_05ae:	.db $82
B10_05af:	.db $0b
B10_05b0:	.db $4b
B10_05b1:		sbc $e4, x		; f5 e4
B10_05b3:	.db $0b
B10_05b4:	.db $b7
B10_05b5:		sbc $42, x		; f5 42
B10_05b7:	.db $0c
B10_05b8:		rol $f6			; 26 f6
B10_05ba:	.db $9c
B10_05bb:	.db $0c
B10_05bc:		tya				; 98 
B10_05bd:		inc $f2, x		; f6 f2
B10_05bf:	.db $0c
B10_05c0:		asl $44f7		; 0e f7 44
B10_05c3:		ora $f785		; 0d 85 f7
B10_05c6:	.db $92
B10_05c7:		ora $f800		; 0d 00 f8
B10_05ca:	.db $db
B10_05cb:		ora $f87d		; 0d 7d f8
B10_05ce:		and ($0e, x)	; 21 0e
B10_05d0:	.db $fc
B10_05d1:		sed				; f8 
B10_05d2:		adc ($0e, x)	; 61 0e
B10_05d4:		ror $9ef9, x	; 7e f9 9e
B10_05d7:		asl $fa02		; 0e 02 fa
B10_05da:		dec $0e, x		; d6 0e
B10_05dc:	.db $87
B10_05dd:	.db $fa
B10_05de:		ora #$0f		; 09 0f
B10_05e0:		asl $38fb		; 0e fb 38
B10_05e3:	.db $0f
B10_05e4:	.db $97
B10_05e5:	.db $fb
B10_05e6:		adc ($0f, x)	; 61 0f
B10_05e8:		and ($fc, x)	; 21 fc
B10_05ea:		stx $0f			; 86 0f
B10_05ec:		ldy $a6fc		; ac fc a6
B10_05ef:	.db $0f
B10_05f0:		and $c2fd, y	; 39 fd c2
B10_05f3:	.db $0f
B10_05f4:		dec $fd			; c6 fd
B10_05f6:		cld				; d8 
B10_05f7:	.db $0f
B10_05f8:	.db $54
B10_05f9:		inc $0fea, x	; fe ea 0f
B10_05fc:	.db $e2
B10_05fd:		inc $0ff6, x	; fe f6 0f
B10_0600:		adc ($ff), y	; 71 ff
B10_0602:		inc $850f, x	; fe 0f 85
B10_0605:		.db $00				; 00
B10_0606:		and #$0f		; 29 0f
B10_0608:		asl a			; 0a
B10_0609:		tay				; a8 
B10_060a:		lda $01			; a5 01
B10_060c:		beq B10_061d ; f0 0f

B10_060e:		cmp #$01		; c9 01
B10_0610:		beq B10_0618 ; f0 06

B10_0612:		tya				; 98 
B10_0613:		clc				; 18 
B10_0614:		adc #$40		; 69 40
B10_0616:		bne B10_061c ; d0 04

B10_0618:		tya				; 98 
B10_0619:		clc				; 18 
B10_061a:		adc #$20		; 69 20
B10_061c:		tay				; a8 
B10_061d:		lda $00			; a5 00
B10_061f:		and #$20		; 29 20
B10_0621:		bne B10_0644 ; d0 21

B10_0623:		lda $00			; a5 00
B10_0625:		and #$10		; 29 10
B10_0627:		bne B10_0634 ; d0 0b

B10_0629:		lda $866f, y	; b9 6f 86
B10_062c:		sta $01			; 85 01
B10_062e:		lda $8670, y	; b9 70 86
B10_0631:		sta $02			; 85 02
B10_0633:		rts				; 60 


B10_0634:		lda $866f, y	; b9 6f 86
B10_0637:		sta $02			; 85 02
B10_0639:		lda $8670, y	; b9 70 86
B10_063c:		eor #$ff		; 49 ff
B10_063e:		clc				; 18 
B10_063f:		adc #$01		; 69 01
B10_0641:		sta $01			; 85 01
B10_0643:		rts				; 60 


B10_0644:		lda $00			; a5 00
B10_0646:		and #$10		; 29 10
B10_0648:		bne B10_065f ; d0 15

B10_064a:		lda $866f, y	; b9 6f 86
B10_064d:		eor #$ff		; 49 ff
B10_064f:		clc				; 18 
B10_0650:		adc #$01		; 69 01
B10_0652:		sta $01			; 85 01
B10_0654:		lda $8670, y	; b9 70 86
B10_0657:		eor #$ff		; 49 ff
B10_0659:		clc				; 18 
B10_065a:		adc #$01		; 69 01
B10_065c:		sta $02			; 85 02
B10_065e:		rts				; 60 


B10_065f:		lda $866f, y	; b9 6f 86
B10_0662:		eor #$ff		; 49 ff
B10_0664:		clc				; 18 
B10_0665:		adc #$01		; 69 01
B10_0667:		sta $02			; 85 02
B10_0669:		lda $8670, y	; b9 70 86
B10_066c:		sta $01			; 85 01
B10_066e:		rts				; 60 


B10_066f:		.db $00				; 00
B10_0670:		;removed
	.db $f0 $01

B10_0672:		;removed
	.db $f0 $03

B10_0674:		sbc ($04), y	; f1 04
B10_0676:		sbc ($06), y	; f1 06
B10_0678:	.db $f2
B10_0679:	.db $07
B10_067a:	.db $f2
B10_067b:		ora #$f3		; 09 f3
B10_067d:		asl a			; 0a
B10_067e:	.db $f4
B10_067f:	.db $0b
B10_0680:		sbc $0c, x		; f5 0c
B10_0682:		inc $0d, x		; f6 0d
B10_0684:	.db $f7
B10_0685:		asl $0ef9		; 0e f9 0e
B10_0688:	.db $fa
B10_0689:	.db $0f
B10_068a:	.db $fc
B10_068b:	.db $0f
B10_068c:		sbc $ff10, x	; fd 10 ff
B10_068f:		.db $00				; 00
B10_0690:		cpx #$03		; e0 03
B10_0692:		cpx #$06		; e0 06
B10_0694:		sbc ($09, x)	; e1 09
B10_0696:		sbc ($0c, x)	; e1 0c
B10_0698:	.db $e2
B10_0699:	.db $0f
B10_069a:		cpx $12			; e4 12
B10_069c:		sbc $14			; e5 14
B10_069e:	.db $e7
B10_069f:		asl $e9, x		; 16 e9
B10_06a1:		clc				; 18 
B10_06a2:	.db $eb
B10_06a3:	.db $1a
B10_06a4:		inc $f01c		; ee 1c f0
B10_06a7:		ora $1ef3, x	; 1d f3 1e
B10_06aa:		inc $1f, x		; f6 1f
B10_06ac:		sbc $fd20, y	; f9 20 fd
B10_06af:		.db $00				; 00
B10_06b0:		;removed
	.db $d0 $04

B10_06b2:		bne B10_06bd ; d0 09

B10_06b4:	.db $d2
B10_06b5:		ora $12d2		; 0d d2 12
B10_06b8:	.db $d4
B10_06b9:		asl $d6, x		; 16 d6
B10_06bb:	.db $1b
B10_06bc:		cld				; d8 
B10_06bd:		asl $21db, x	; 1e db 21
B10_06c0:		dec $d724, x	; de 24 d7
B10_06c3:	.db $27
B10_06c4:		sbc $2a			; e5 2a
B10_06c6:		sbc #$2b		; e9 2b
B10_06c8:		sbc $f22d		; ed2d f2
B10_06cb:		rol $30f6		; 2e f6 30
B10_06ce:	.db $fc
B10_06cf:		.db $00				; 00
B10_06d0:		cpy #$06		; c0 06
B10_06d2:		cpy #$0d		; c0 0d
B10_06d4:		cmp ($13, x)	; c1 13
B10_06d6:	.db $c3
B10_06d7:		ora $1fc5, y	; 19 c5 1f
B10_06da:		iny				; c8 
B10_06db:		bit $cb			; 24 cb
B10_06dd:		and #$cf		; 29 cf
B10_06df:		and $31d3		; 2d d3 31
B10_06e2:	.db $d7
B10_06e3:		and $dc, x		; 35 dc
B10_06e5:		sec				; 38 
B10_06e6:		sbc ($3b, x)	; e1 3b
B10_06e8:	.db $e7
B10_06e9:		and $3fed, x	; 3d ed 3f
B10_06ec:	.db $f3
B10_06ed:		rti				; 40 


B10_06ee:	.db $fa
B10_06ef:		lda $14			; a5 14
B10_06f1:		beq B10_06f7 ; f0 04

B10_06f3:		bmi B10_06f8 ; 30 03

B10_06f5:		dec $14			; c6 14
B10_06f7:		rts				; 60 


B10_06f8:		inc $14			; e6 14
B10_06fa:		rts				; 60 


B10_06fb:		jsr $8714		; 20 14 87
B10_06fe:		lda $01			; a5 01
B10_0700:		bmi B10_0709 ; 30 07

B10_0702:		clc				; 18 
B10_0703:		adc $17			; 65 17
B10_0705:		bcs B10_0712 ; b0 0b

B10_0707:		bcc B10_070e ; 90 05

B10_0709:		clc				; 18 
B10_070a:		adc $17			; 65 17
B10_070c:		bcc B10_0712 ; 90 04

B10_070e:		sta $17			; 85 17
B10_0710:		clc				; 18 
B10_0711:		rts				; 60 


B10_0712:		sec				; 38 
B10_0713:		rts				; 60 


B10_0714:		lda $00			; a5 00
B10_0716:		bmi B10_071f ; 30 07

B10_0718:		clc				; 18 
B10_0719:		adc $16			; 65 16
B10_071b:		bcs B10_0728 ; b0 0b

B10_071d:		bcc B10_0724 ; 90 05

B10_071f:		clc				; 18 
B10_0720:		adc $16			; 65 16
B10_0722:		bcc B10_0728 ; 90 04

B10_0724:		sta $16			; 85 16
B10_0726:		clc				; 18 
B10_0727:		rts				; 60 


B10_0728:		sec				; 38 
B10_0729:		rts				; 60 


B10_072a:		lda #$00		; a9 00
B10_072c:		sta $0504		; 8d 04 05
B10_072f:		sta $00			; 85 00
B10_0731:		lda $0506		; ad 06 05
B10_0734:		asl a			; 0a
B10_0735:		rol $00			; 26 00
B10_0737:		asl a			; 0a
B10_0738:		rol $00			; 26 00
B10_073a:		asl a			; 0a
B10_073b:		rol $00			; 26 00
B10_073d:		asl a			; 0a
B10_073e:		rol $00			; 26 00
B10_0740:		clc				; 18 
B10_0741:		adc $31			; 65 31
B10_0743:		sta $0501		; 8d 01 05
B10_0746:		lda $30			; a5 30
B10_0748:		adc $00			; 65 00
B10_074a:		sta $0500		; 8d 00 05
B10_074d:		rts				; 60 


B10_074e:		lda #$00		; a9 00
B10_0750:		sta $0505		; 8d 05 05
B10_0753:		sta $00			; 85 00
B10_0755:		lda $0507		; ad 07 05
B10_0758:		asl a			; 0a
B10_0759:		rol $00			; 26 00
B10_075b:		asl a			; 0a
B10_075c:		rol $00			; 26 00
B10_075e:		asl a			; 0a
B10_075f:		rol $00			; 26 00
B10_0761:		asl a			; 0a
B10_0762:		rol $00			; 26 00
B10_0764:		clc				; 18 
B10_0765:		adc $33			; 65 33
B10_0767:		sta $0503		; 8d 03 05
B10_076a:		lda $32			; a5 32
B10_076c:		adc $00			; 65 00
B10_076e:		sta $0502		; 8d 02 05
B10_0771:		rts				; 60 


displayTextIdxedA:
B10_0772:		sta $7e			; 85 7e
B10_0774:		jsr func_a_079a		; 20 9a 87
B10_0777:		lda $16			; a5 16
B10_0779:		pha				; 48 
B10_077a:		lda $17			; a5 17
B10_077c:		pha				; 48 
B10_077d:		jsr func_1ca6		; 20 a6 fc
B10_0780:		pla				; 68 
B10_0781:		sta $17			; 85 17
B10_0783:		pla				; 68 
B10_0784:		sta $16			; 85 16
B10_0786:		jmp $de21		; 4c 21 de


func_a_0789:
B10_0789:		lda $10			; a5 10
B10_078b:		and #$f0		; 29 f0
B10_078d:		sta $7c			; 85 7c
B10_078f:		lda $12			; a5 12
B10_0791:		and #$f0		; 29 f0
B10_0793:		sta $7d			; 85 7d
B10_0795:		lda #$56		; a9 56
B10_0797:		jmp setGlobalFlag		; 4c f0 e7


func_a_079a:
B10_079a:		ldx $0165		; ae 65 01
B10_079d:		lda #$f8		; a9 f8
B10_079f:		dex				; ca 
B10_07a0:		dex				; ca 
B10_07a1:		dex				; ca 
B10_07a2:		dex				; ca 
B10_07a3:		sta $0200, x	; 9d 00 02
B10_07a6:		bne B10_079f ; d0 f7

B10_07a8:		lda #$00		; a9 00
B10_07aa:		sta $27			; 85 27
B10_07ac:		sta $28			; 85 28
B10_07ae:		jsr func_052e		; 20 2e e5
B10_07b1:		lda #$7c		; a9 7c
B10_07b3:		sta wShadow2KBChrBank1.w		; 8d 6a 01
B10_07b6:		lda #$0a		; a9 0a
B10_07b8:		sta $0d			; 85 0d
B10_07ba:		lda $30			; a5 30
B10_07bc:		and #$10		; 29 10
B10_07be:		bne B10_07c4 ; d0 04

B10_07c0:		lda #$20		; a9 20
B10_07c2:		bne B10_07c6 ; d0 02

B10_07c4:		lda #$24		; a9 24
B10_07c6:		sta $0e			; 85 0e
B10_07c8:		lda #$84		; a9 84
B10_07ca:		sta $0f			; 85 0f
B10_07cc:		lda #$2c		; a9 2c
B10_07ce:		jsr copyStaticLayoutIdxedYForNMIDataCopyingAtCurrPPUAddr		; 20 96 fc
B10_07d1:		jsr func_052e		; 20 2e e5
B10_07d4:		lda #$20		; a9 20
B10_07d6:		clc				; 18 
B10_07d7:		adc $0f			; 65 0f
B10_07d9:		sta $0f			; 85 0f
B10_07db:		lda $0e			; a5 0e
B10_07dd:		adc #$00		; 69 00
B10_07df:		sta $0e			; 85 0e
B10_07e1:		lda #$2d		; a9 2d
B10_07e3:		dec $0d			; c6 0d
B10_07e5:		bpl B10_07ce ; 10 e7

B10_07e7:		lda #$2e		; a9 2e
B10_07e9:		jsr copyStaticLayoutIdxedYForNMIDataCopyingAtCurrPPUAddr		; 20 96 fc
B10_07ec:		jsr func_052e		; 20 2e e5
B10_07ef:		lda $0e			; a5 0e
B10_07f1:		ora #$03		; 09 03
B10_07f3:		sta $0e			; 85 0e
B10_07f5:		lda #$c9		; a9 c9
B10_07f7:		sta $0f			; 85 0f
B10_07f9:		lda #$33		; a9 33
B10_07fb:		jsr copyStaticLayoutIdxedYForNMIDataCopyingAtCurrPPUAddr		; 20 96 fc
B10_07fe:		jsr func_052e		; 20 2e e5
B10_0801:		lda #$d1		; a9 d1
B10_0803:		sta $0f			; 85 0f
B10_0805:		lda #$33		; a9 33
B10_0807:		jsr copyStaticLayoutIdxedYForNMIDataCopyingAtCurrPPUAddr		; 20 96 fc
B10_080a:		jsr func_052e		; 20 2e e5
B10_080d:		lda #$d9		; a9 d9
B10_080f:		sta $0f			; 85 0f
B10_0811:		lda #$33		; a9 33
B10_0813:		jsr copyStaticLayoutIdxedYForNMIDataCopyingAtCurrPPUAddr		; 20 96 fc
B10_0816:		jmp func_052e		; 4c 2e e5


B10_0819:		sta $05			; 85 05
B10_081b:		lda #$40		; a9 40
B10_081d:		jmp initEntityA		; 4c 33 80


B10_0820:		lda #$00		; a9 00
B10_0822:		sta $1e			; 85 1e
B10_0824:		lda #$02		; a9 02
B10_0826:		sta $18			; 85 18
B10_0828:		lda #$24		; a9 24
B10_082a:		jsr func_08fa		; 20 fa e8
B10_082d:		lda #$80		; a9 80
B10_082f:		ora $19			; 05 19
B10_0831:		sta $19			; 85 19
B10_0833:		lda $1e			; a5 1e
B10_0835:		jmp unsetGlobalFlag		; 4c fc e7


B10_0838:		lda #$02		; a9 02
B10_083a:		sta $18			; 85 18
B10_083c:		lda #$80		; a9 80
B10_083e:		ora $19			; 05 19
B10_0840:		sta $19			; 85 19
B10_0842:		lda #$24		; a9 24
B10_0844:		jmp func_08fa		; 4c fa e8


B10_0847:		sta $04			; 85 04
B10_0849:		lda #$00		; a9 00
B10_084b:		sta $0163		; 8d 63 01
B10_084e:		lda $00			; a5 00
B10_0850:		sta $05			; 85 05
B10_0852:		lda $18			; a5 18
B10_0854:		cmp #$5d		; c9 5d
B10_0856:		beq B10_085f ; f0 07

B10_0858:		lda #$46		; a9 46
B10_085a:		jsr checkGlobalFlag		; 20 e9 e7
B10_085d:		bne B10_08a1 ; d0 42

B10_085f:		lda #$55		; a9 55
B10_0861:		jsr checkGlobalFlag		; 20 e9 e7
B10_0864:		bne B10_08a1 ; d0 3b

B10_0866:		lda $05			; a5 05
B10_0868:		sta $00			; 85 00
B10_086a:		lda $04			; a5 04
B10_086c:		bpl B10_087a ; 10 0c

B10_086e:		lda $0509		; ad 09 05
B10_0871:		and #$10		; 29 10
B10_0873:		bne B10_08a1 ; d0 2c

B10_0875:		lda $051c		; ad 1c 05
B10_0878:		bne B10_08a1 ; d0 27

B10_087a:		lda $03			; a5 03
B10_087c:		jsr func_170b		; 20 0b f7
B10_087f:		bcs B10_08a1 ; b0 20

B10_0881:		ldx #$ff		; a2 ff
B10_0883:		stx $0163		; 8e 63 01
B10_0886:		inx				; e8 
B10_0887:		stx $19			; 86 19
B10_0889:		lda $04			; a5 04
B10_088b:		bpl B10_08a3 ; 10 16

B10_088d:		jsr func_1c24		; 20 24 fc
B10_0890:		lda #$c0		; a9 c0
B10_0892:		sta $0505		; 8d 05 05
B10_0895:		lda #$23		; a9 23
B10_0897:		jsr func_08fa		; 20 fa e8
B10_089a:		lda #$09		; a9 09
B10_089c:		sta $0511		; 8d 11 05
B10_089f:		clc				; 18 
B10_08a0:		rts				; 60 


B10_08a1:		sec				; 38 
B10_08a2:		rts				; 60 


B10_08a3:		sta $0519		; 8d 19 05
B10_08a6:		clc				; 18 
B10_08a7:		rts				; 60 


B10_08a8:		lda $17			; a5 17
B10_08aa:		sec				; 38 
B10_08ab:		sbc $01			; e5 01
B10_08ad:		beq B10_0902 ; f0 53

B10_08af:		bpl B10_08b6 ; 10 05

B10_08b1:		eor #$ff		; 49 ff
B10_08b3:		clc				; 18 
B10_08b4:		adc #$01		; 69 01
B10_08b6:		cmp #$10		; c9 10
B10_08b8:		bcs B10_08e8 ; b0 2e

B10_08ba:		lda $17			; a5 17
B10_08bc:		cmp $01			; c5 01
B10_08be:		bcc B10_08d4 ; 90 14

B10_08c0:		lda $15			; a5 15
B10_08c2:		bpl B10_08ce ; 10 0a

B10_08c4:		cmp #$e8		; c9 e8
B10_08c6:		beq B10_0925 ; f0 5d

B10_08c8:		bcs B10_08ce ; b0 04

B10_08ca:		lda #$e8		; a9 e8
B10_08cc:		bne B10_0923 ; d0 55

B10_08ce:		sec				; 38 
B10_08cf:		sbc #$01		; e9 01
B10_08d1:		jmp $8923		; 4c 23 89


B10_08d4:		lda $15			; a5 15
B10_08d6:		bmi B10_08e2 ; 30 0a

B10_08d8:		cmp #$18		; c9 18
B10_08da:		beq B10_0925 ; f0 49

B10_08dc:		bcs B10_08e2 ; b0 04

B10_08de:		lda #$18		; a9 18
B10_08e0:		bne B10_0923 ; d0 41

B10_08e2:		clc				; 18 
B10_08e3:		adc #$01		; 69 01
B10_08e5:		jmp $8923		; 4c 23 89


B10_08e8:		lda $17			; a5 17
B10_08ea:		cmp $01			; c5 01
B10_08ec:		bcc B10_0912 ; 90 24

B10_08ee:		lda $15			; a5 15
B10_08f0:		bpl B10_08fc ; 10 0a

B10_08f2:		cmp #$d0		; c9 d0
B10_08f4:		beq B10_0925 ; f0 2f

B10_08f6:		bcs B10_08fc ; b0 04

B10_08f8:		lda #$d0		; a9 d0
B10_08fa:		bne B10_0923 ; d0 27

B10_08fc:		sec				; 38 
B10_08fd:		sbc $02			; e5 02
B10_08ff:		jmp $8923		; 4c 23 89


B10_0902:		lda $15			; a5 15
B10_0904:		beq B10_0925 ; f0 1f

B10_0906:		bpl B10_090d ; 10 05

B10_0908:		inc $15			; e6 15
B10_090a:		jmp $8925		; 4c 25 89


B10_090d:		dec $15			; c6 15
B10_090f:		jmp $8925		; 4c 25 89


B10_0912:		lda $15			; a5 15
B10_0914:		bmi B10_0920 ; 30 0a

B10_0916:		cmp #$30		; c9 30
B10_0918:		beq B10_0925 ; f0 0b

B10_091a:		bcc B10_0920 ; 90 04

B10_091c:		lda #$30		; a9 30
B10_091e:		bne B10_0923 ; d0 03

B10_0920:		clc				; 18 
B10_0921:		adc $02			; 65 02
B10_0923:		sta $15			; 85 15
B10_0925:		lda $16			; a5 16
B10_0927:		sec				; 38 
B10_0928:		sbc $00			; e5 00
B10_092a:		beq B10_097f ; f0 53

B10_092c:		bpl B10_0933 ; 10 05

B10_092e:		eor #$ff		; 49 ff
B10_0930:		clc				; 18 
B10_0931:		adc #$01		; 69 01
B10_0933:		cmp #$10		; c9 10
B10_0935:		bcs B10_0965 ; b0 2e

B10_0937:		lda $16			; a5 16
B10_0939:		cmp $00			; c5 00
B10_093b:		bcc B10_0951 ; 90 14

B10_093d:		lda $14			; a5 14
B10_093f:		bpl B10_094b ; 10 0a

B10_0941:		cmp #$e8		; c9 e8
B10_0943:		beq B10_099e ; f0 59

B10_0945:		bcs B10_094b ; b0 04

B10_0947:		lda #$e8		; a9 e8
B10_0949:		bne B10_099c ; d0 51

B10_094b:		sec				; 38 
B10_094c:		sbc #$01		; e9 01
B10_094e:		jmp $899c		; 4c 9c 89


B10_0951:		lda $14			; a5 14
B10_0953:		bmi B10_095f ; 30 0a

B10_0955:		cmp #$18		; c9 18
B10_0957:		beq B10_099e ; f0 45

B10_0959:		bcs B10_095f ; b0 04

B10_095b:		lda #$18		; a9 18
B10_095d:		bne B10_099c ; d0 3d

B10_095f:		clc				; 18 
B10_0960:		adc #$01		; 69 01
B10_0962:		jmp $899c		; 4c 9c 89


B10_0965:		lda $16			; a5 16
B10_0967:		cmp $00			; c5 00
B10_0969:		bcc B10_098b ; 90 20

B10_096b:		lda $14			; a5 14
B10_096d:		bpl B10_0979 ; 10 0a

B10_096f:		cmp #$d0		; c9 d0
B10_0971:		beq B10_099e ; f0 2b

B10_0973:		bcs B10_0979 ; b0 04

B10_0975:		lda #$d0		; a9 d0
B10_0977:		bne B10_099c ; d0 23

B10_0979:		sec				; 38 
B10_097a:		sbc $02			; e5 02
B10_097c:		jmp $899c		; 4c 9c 89


B10_097f:		lda $14			; a5 14
B10_0981:		beq B10_099e ; f0 1b

B10_0983:		bpl B10_0988 ; 10 03

B10_0985:		inc $14			; e6 14
B10_0987:		rts				; 60 


B10_0988:		dec $14			; c6 14
B10_098a:		rts				; 60 


B10_098b:		lda $14			; a5 14
B10_098d:		bmi B10_0999 ; 30 0a

B10_098f:		cmp #$30		; c9 30
B10_0991:		beq B10_099e ; f0 0b

B10_0993:		bcc B10_0999 ; 90 04

B10_0995:		lda #$30		; a9 30
B10_0997:		bne B10_099c ; d0 03

B10_0999:		clc				; 18 
B10_099a:		adc $02			; 65 02
B10_099c:		sta $14			; 85 14
B10_099e:		rts				; 60 


B10_099f:		lda #$00		; a9 00
B10_09a1:		sta $01			; 85 01
B10_09a3:		lda $16			; a5 16
B10_09a5:		and #$f0		; 29 f0
B10_09a7:		sta $00			; 85 00
B10_09a9:		lda $0506		; ad 06 05
B10_09ac:		and #$f0		; 29 f0
B10_09ae:		cmp $00			; c5 00
B10_09b0:		bne B10_09b6 ; d0 04

B10_09b2:		lda #$40		; a9 40
B10_09b4:		sta $01			; 85 01
B10_09b6:		lda $17			; a5 17
B10_09b8:		and #$f0		; 29 f0
B10_09ba:		sta $00			; 85 00
B10_09bc:		lda $0507		; ad 07 05
B10_09bf:		and #$f0		; 29 f0
B10_09c1:		cmp $00			; c5 00
B10_09c3:		bne B10_09cb ; d0 06

B10_09c5:		lda #$80		; a9 80
B10_09c7:		ora $01			; 05 01
B10_09c9:		bne B10_09cd ; d0 02

B10_09cb:		lda $01			; a5 01
B10_09cd:		rts				; 60 


B10_09ce:		lda $0506		; ad 06 05
B10_09d1:		sec				; 38 
B10_09d2:		sbc $16			; e5 16
B10_09d4:		bcs B10_09db ; b0 05

B10_09d6:		eor #$ff		; 49 ff
B10_09d8:		clc				; 18 
B10_09d9:		adc #$01		; 69 01
B10_09db:		sta $00			; 85 00
B10_09dd:		lda $0507		; ad 07 05
B10_09e0:		sec				; 38 
B10_09e1:		sbc $17			; e5 17
B10_09e3:		bcs B10_09ea ; b0 05

B10_09e5:		eor #$ff		; 49 ff
B10_09e7:		clc				; 18 
B10_09e8:		adc #$01		; 69 01
B10_09ea:		sta $01			; 85 01
B10_09ec:		rts				; 60 


B10_09ed:		lda $1d			; a5 1d
B10_09ef:		bmi B10_09fe ; 30 0d

B10_09f1:		inc $15			; e6 15
B10_09f3:		lda $15			; a5 15
B10_09f5:		cmp $1d			; c5 1d
B10_09f7:		bne B10_09fd ; d0 04

B10_09f9:		ora #$80		; 09 80
B10_09fb:		sta $1d			; 85 1d
B10_09fd:		rts				; 60 


B10_09fe:		dec $15			; c6 15
B10_0a00:		lda $1d			; a5 1d
B10_0a02:		eor #$7f		; 49 7f
B10_0a04:		clc				; 18 
B10_0a05:		adc #$01		; 69 01
B10_0a07:		cmp $15			; c5 15
B10_0a09:		bne B10_0a11 ; d0 06

B10_0a0b:		lda $1d			; a5 1d
B10_0a0d:		and #$7f		; 29 7f
B10_0a0f:		sta $1d			; 85 1d
B10_0a11:		rts				; 60 


B10_0a12:		lda $0506		; ad 06 05
B10_0a15:		cmp $16			; c5 16
B10_0a17:		bcs B10_0a1f ; b0 06

B10_0a19:		lda $19			; a5 19
B10_0a1b:		ora #$02		; 09 02
B10_0a1d:		bne B10_0a23 ; d0 04

B10_0a1f:		lda $19			; a5 19
B10_0a21:		and #$fd		; 29 fd
B10_0a23:		sta $19			; 85 19
B10_0a25:		rts				; 60 


func_a_0a26:
B10_0a26:		lda $0500		; ad 00 05
B10_0a29:		cmp $10			; c5 10
B10_0a2b:		bcs B10_0a3f ; b0 12

B10_0a2d:		lda $14			; a5 14
B10_0a2f:		bmi B10_0a39 ; 30 08

B10_0a31:		beq B10_0a39 ; f0 06

B10_0a33:		eor #$ff		; 49 ff
B10_0a35:		sta $14			; 85 14
B10_0a37:		inc $14			; e6 14
B10_0a39:		lda $19			; a5 19
B10_0a3b:		ora #$02		; 09 02
B10_0a3d:		bne B10_0a54 ; d0 15

B10_0a3f:		lda $0501		; ad 01 05
B10_0a42:		cmp $11			; c5 11
B10_0a44:		bcc B10_0a2d ; 90 e7

B10_0a46:		lda $14			; a5 14
B10_0a48:		bpl B10_0a50 ; 10 06

B10_0a4a:		eor #$ff		; 49 ff
B10_0a4c:		sta $14			; 85 14
B10_0a4e:		inc $14			; e6 14
B10_0a50:		lda $19			; a5 19
B10_0a52:		and #$fd		; 29 fd
B10_0a54:		sta $19			; 85 19
B10_0a56:		rts				; 60 


func_a_0a57:
B10_0a57:		sta $01			; 85 01
B10_0a59:		and #$3f		; 29 3f
B10_0a5b:		sta $00			; 85 00
B10_0a5d:		asl a			; 0a
B10_0a5e:		clc				; 18 
B10_0a5f:		adc $00			; 65 00
B10_0a61:		tay				; a8 
B10_0a62:		lda $01			; a5 01
B10_0a64:		and #$c0		; 29 c0
B10_0a66:		lsr a			; 4a
B10_0a67:		lsr a			; 4a
B10_0a68:		lsr a			; 4a
B10_0a69:		lsr a			; 4a
B10_0a6a:		tax				; aa 
B10_0a6b:		lda $8a87, y	; b9 87 8a
B10_0a6e:		sta $0191, x	; 9d 91 01
B10_0a71:		sta $01b1, x	; 9d b1 01
B10_0a74:		lda $8a88, y	; b9 88 8a
B10_0a77:		sta $0192, x	; 9d 92 01
B10_0a7a:		sta $01b2, x	; 9d b2 01
B10_0a7d:		lda $8a89, y	; b9 89 8a
B10_0a80:		sta $0193, x	; 9d 93 01
B10_0a83:		sta $01b3, x	; 9d b3 01
B10_0a86:		rts				; 60 


B10_0a87:		jsr $0f10		; 20 10 0f
B10_0a8a:	.db $37
B10_0a8b:		and #$0f		; 29 0f
B10_0a8d:		and ($22), y	; 31 22
B10_0a8f:	.db $0f
B10_0a90:		and ($22), y	; 31 22
B10_0a92:	.db $0f
B10_0a93:	.db $27
B10_0a94:	.db $17
B10_0a95:	.db $0f
B10_0a96:		;removed
	.db $30 $21

B10_0a98:	.db $0f
B10_0a99:		;removed
	.db $30 $26

B10_0a9b:	.db $0f
B10_0a9c:		bmi B10_0ac3 ; 30 25

B10_0a9e:	.db $0f
B10_0a9f:		bmi B10_0aca ; 30 29

B10_0aa1:	.db $0f
B10_0aa2:		sec				; 38 
B10_0aa3:		plp				; 28 
B10_0aa4:	.db $0f
B10_0aa5:	.db $27
B10_0aa6:	.db $17
B10_0aa7:	.db $0f
B10_0aa8:	.db $33
B10_0aa9:	.db $22
B10_0aaa:	.db $0f
B10_0aab:		and ($23), y	; 31 23
B10_0aad:	.db $0f
B10_0aae:	.db $32
B10_0aaf:		and ($0f, x)	; 21 0f
B10_0ab1:		jsr $0f10		; 20 10 0f
B10_0ab4:		sec				; 38 
B10_0ab5:	.db $27
B10_0ab6:	.db $0f
B10_0ab7:		jsr $0f31		; 20 31 0f
B10_0aba:		bmi B10_0abd ; 30 01

B10_0abc:	.db $0f
B10_0abd:		bmi B10_0ae7 ; 30 28

B10_0abf:	.db $0f
B10_0ac0:		jsr $0f22		; 20 22 0f
B10_0ac3:	.db $37
B10_0ac4:		bit $0f			; 24 0f
B10_0ac6:	.db $37
B10_0ac7:	.db $22
B10_0ac8:	.db $0f
B10_0ac9:	.db $37
B10_0aca:		rol $0f			; 26 0f
B10_0acc:		and ($28), y	; 31 28
B10_0ace:	.db $0f
B10_0acf:	.db $37
B10_0ad0:	.db $27
B10_0ad1:	.db $0f
B10_0ad2:		and $15, x		; 35 15
B10_0ad4:	.db $0f
B10_0ad5:	.db $37
B10_0ad6:		plp				; 28 
B10_0ad7:	.db $0f
B10_0ad8:		jsr $0f28		; 20 28 0f
B10_0adb:		;removed
	.db $30 $2b

B10_0add:	.db $0f
B10_0ade:		bmi B10_0b17 ; 30 37

B10_0ae0:	.db $0f
B10_0ae1:		;removed
	.db $30 $27

B10_0ae3:	.db $0f
B10_0ae4:		bmi B10_0b06 ; 30 20

B10_0ae6:	.db $1f
B10_0ae7:		and ($10, x)	; 21 10
B10_0ae9:	.db $0f
B10_0aea:		ldy #$03		; a0 03
B10_0aec:		lda $0191, x	; bd 91 01
B10_0aef:		sta $0175, x	; 9d 75 01
B10_0af2:		inx				; e8 
B10_0af3:		dey				; 88 
B10_0af4:		bpl B10_0aec ; 10 f6

B10_0af6:		rts				; 60 


B10_0af7:		ldy #$03		; a0 03
B10_0af9:		lda $0175, x	; bd 75 01
B10_0afc:		sta $0191, x	; 9d 91 01
B10_0aff:		inx				; e8 
B10_0b00:		dey				; 88 
B10_0b01:		bpl B10_0af9 ; 10 f6

B10_0b03:		rts				; 60 


B10_0b04:		sta $1b			; 85 1b
B10_0b06:		jsr $8b11		; 20 11 8b
B10_0b09:		jsr func_052e		; 20 2e e5
B10_0b0c:		dec $1b			; c6 1b
B10_0b0e:		bne B10_0b06 ; d0 f6

B10_0b10:		rts				; 60 


B10_0b11:		lda $015a		; ad 5a 01
B10_0b14:		lsr a			; 4a
B10_0b15:		lsr a			; 4a
B10_0b16:		lsr a			; 4a
B10_0b17:		and #$03		; 29 03
B10_0b19:		tay				; a8 
B10_0b1a:		lda $8b21, y	; b9 21 8b
B10_0b1d:		sta wShadow2KBChrBank1.w		; 8d 6a 01
B10_0b20:		rts				; 60 


B10_0b21:		rol $24			; 26 24
B10_0b23:	.db $22
B10_0b24:		.db $20


func_a_0b25:
	stx wEntityWramOffset.w
	sty wEntityIdxReversed.w
	lda $0300, x
B10_0b2e:		sta $10			; 85 10
B10_0b30:		lda $0301, x	; bd 01 03
B10_0b33:		sta $11			; 85 11
B10_0b35:		lda $0302, x	; bd 02 03
B10_0b38:		sta $12			; 85 12
B10_0b3a:		lda $0303, x	; bd 03 03
B10_0b3d:		sta $13			; 85 13
B10_0b3f:		lda $0304, x	; bd 04 03
B10_0b42:		sta $14			; 85 14
B10_0b44:		lda $0305, x	; bd 05 03
B10_0b47:		sta $15			; 85 15
B10_0b49:		lda $0306, x	; bd 06 03
B10_0b4c:		sta $16			; 85 16
B10_0b4e:		lda $0307, x	; bd 07 03
B10_0b51:		sta $17			; 85 17
B10_0b53:		lda $0308, x	; bd 08 03
B10_0b56:		sta $18			; 85 18
B10_0b58:		lda $0309, x	; bd 09 03
B10_0b5b:		sta $19			; 85 19
B10_0b5d:		lda $030a, x	; bd 0a 03
B10_0b60:		sta $1a			; 85 1a
B10_0b62:		lda $030b, x	; bd 0b 03
B10_0b65:		sta $1b			; 85 1b
B10_0b67:		lda $030c, x	; bd 0c 03
B10_0b6a:		sta $1c			; 85 1c
B10_0b6c:		lda $030d, x	; bd 0d 03
B10_0b6f:		sta $1d			; 85 1d
B10_0b71:		lda $030e, x	; bd 0e 03
B10_0b74:		sta $1e			; 85 1e
B10_0b76:		lda $030f, x	; bd 0f 03
B10_0b79:		sta $1f			; 85 1f
B10_0b7b:		rts				; 60 


loadEntityDataInto0page:
	stx wEntityWramOffset.w
	sty wEntityIdxReversed.w

.rept EntityStruct.size index count
	lda wEntityStructs.w+count, x
	sta wCachedEntityStruct+count
.endr
	rts


func_a_0bd3:
B10_0bd3:		ldx wEntityWramOffset.w		; ae 5b 01
B10_0bd6:		ldy wEntityIdxReversed.w		; ac 5c 01
B10_0bd9:		lda $19			; a5 19
B10_0bdb:		bne B10_0be1 ; d0 04

B10_0bdd:		sta $0309, x	; 9d 09 03
B10_0be0:		rts				; 60 


B10_0be1:		lda $10			; a5 10
B10_0be3:		sta $0300, x	; 9d 00 03
B10_0be6:		lda $11			; a5 11
B10_0be8:		sta $0301, x	; 9d 01 03
B10_0beb:		lda $12			; a5 12
B10_0bed:		sta $0302, x	; 9d 02 03
B10_0bf0:		lda $13			; a5 13
B10_0bf2:		sta $0303, x	; 9d 03 03
B10_0bf5:		lda $14			; a5 14
B10_0bf7:		sta $0304, x	; 9d 04 03
B10_0bfa:		lda $15			; a5 15
B10_0bfc:		sta $0305, x	; 9d 05 03
B10_0bff:		lda $16			; a5 16
B10_0c01:		sta $0306, x	; 9d 06 03
B10_0c04:		lda $17			; a5 17
B10_0c06:		sta $0307, x	; 9d 07 03
B10_0c09:		lda $18			; a5 18
B10_0c0b:		sta $0308, x	; 9d 08 03
B10_0c0e:		lda $19			; a5 19
B10_0c10:		sta $0309, x	; 9d 09 03
B10_0c13:		lda $1a			; a5 1a
B10_0c15:		sta $030a, x	; 9d 0a 03
B10_0c18:		lda $1b			; a5 1b
B10_0c1a:		sta $030b, x	; 9d 0b 03
B10_0c1d:		lda $1c			; a5 1c
B10_0c1f:		sta $030c, x	; 9d 0c 03
B10_0c22:		lda $1d			; a5 1d
B10_0c24:		sta $030d, x	; 9d 0d 03
B10_0c27:		lda $1e			; a5 1e
B10_0c29:		sta $030e, x	; 9d 0e 03
B10_0c2c:		lda $1f			; a5 1f
B10_0c2e:		sta $030f, x	; 9d 0f 03
B10_0c31:		rts				; 60 


saveEntityDataToWram:
	ldx wEntityWramOffset.w
	ldy wEntityIdxReversed.w

B10_0c38:		lda wCachedEntityStruct.byte9			; a5 19
B10_0c3a:		bne B10_0c40 ; @save

B10_0c3c:		sta wEntityStructs.byte9.w, x	; 9d 09 04
B10_0c3f:		rts				; 60 

B10_0c40
@save:
.rept EntityStruct.size index count
	lda wCachedEntityStruct+count
	sta wEntityStructs.w+count, x
.endr
	rts


B10_0c91:		lda $1b			; a5 1b
B10_0c93:		beq B10_0ca0 ; f0 0b

B10_0c95:		cmp #$40		; c9 40
B10_0c97:		bcc B10_0c9e ; 90 05

B10_0c99:		ldy #$00		; a0 00
B10_0c9b:		jsr $8cdc		; 20 dc 8c
B10_0c9e:		dec $1b			; c6 1b
B10_0ca0:		lda $1c			; a5 1c
B10_0ca2:		beq B10_0caf ; f0 0b

B10_0ca4:		cmp #$40		; c9 40
B10_0ca6:		bcc B10_0cad ; 90 05

B10_0ca8:		ldy #$02		; a0 02
B10_0caa:		jsr $8cdc		; 20 dc 8c
B10_0cad:		dec $1c			; c6 1c
B10_0caf:		lda $1d			; a5 1d
B10_0cb1:		beq B10_0cd5 ; f0 22

B10_0cb3:		cmp #$40		; c9 40
B10_0cb5:		bcc B10_0cbc ; 90 05

B10_0cb7:		ldy #$04		; a0 04
B10_0cb9:		jsr $8cdc		; 20 dc 8c
B10_0cbc:		dec $1d			; c6 1d
B10_0cbe:		lda $1d			; a5 1d
B10_0cc0:		cmp #$40		; c9 40
B10_0cc2:		beq B10_0cce ; f0 0a

B10_0cc4:		bcc B10_0cd3 ; 90 0d

B10_0cc6:		and #$07		; 29 07
B10_0cc8:		bne B10_0cd3 ; d0 09

B10_0cca:		lda #$3f		; a9 3f
B10_0ccc:		bne B10_0cd0 ; d0 02

B10_0cce:		lda #$24		; a9 24
B10_0cd0:		jsr func_08fa		; 20 fa e8
B10_0cd3:		sec				; 38 
B10_0cd4:		rts				; 60 


B10_0cd5:		lda $1e			; a5 1e
B10_0cd7:		jsr unsetGlobalFlag		; 20 fc e7
B10_0cda:		clc				; 18 
B10_0cdb:		rts				; 60 


B10_0cdc:		and #$fe		; 29 fe
B10_0cde:		sta $00			; 85 00
B10_0ce0:		and #$0f		; 29 0f
B10_0ce2:		lsr a			; 4a
B10_0ce3:		lsr a			; 4a
B10_0ce4:		tax				; aa 
B10_0ce5:		lda $16			; a5 16
B10_0ce7:		pha				; 48 
B10_0ce8:		lda $17			; a5 17
B10_0cea:		pha				; 48 
B10_0ceb:		lda $8d20, y	; b9 20 8d
B10_0cee:		sta $02			; 85 02
B10_0cf0:		lda $8d21, y	; b9 21 8d
B10_0cf3:		sta $03			; 85 03
B10_0cf5:		lda $00			; a5 00
B10_0cf7:		and #$30		; 29 30
B10_0cf9:		lsr a			; 4a
B10_0cfa:		lsr a			; 4a
B10_0cfb:		lsr a			; 4a
B10_0cfc:		tay				; a8 
B10_0cfd:		lda ($02), y	; b1 02
B10_0cff:		sta $00			; 85 00
B10_0d01:		iny				; c8 
B10_0d02:		lda ($02), y	; b1 02
B10_0d04:		sta $01			; 85 01
B10_0d06:		jsr $86fb		; 20 fb 86
B10_0d09:		bcs B10_0d15 ; b0 0a

B10_0d0b:		lda #$01		; a9 01
B10_0d0d:		sta $2a			; 85 2a
B10_0d0f:		lda $8d1c, x	; bd 1c 8d
B10_0d12:		jsr updateEntity_wOam		; 20 67 f5
B10_0d15:		pla				; 68 
B10_0d16:		sta $17			; 85 17
B10_0d18:		pla				; 68 
B10_0d19:		sta $16			; 85 16
B10_0d1b:		rts				; 60 


B10_0d1c:	.db $04
B10_0d1d:	.db $03
B10_0d1e:	.db $02
B10_0d1f:		.db $00				; 00
B10_0d20:		rol $8d			; 26 8d
B10_0d22:		rol $368d		; 2e 8d 36
B10_0d25:		sta $fcf8		; 8d f8 fc
B10_0d28:	.db $f4
B10_0d29:		cpx $f8f0		; ec f0 f8
B10_0d2c:		sed				; f8 
B10_0d2d:		sbc $f80a		; ed0a f8
B10_0d30:	.db $f2
B10_0d31:		sbc $1006		; ed06 10
B10_0d34:	.db $f4
B10_0d35:		php				; 08 
B10_0d36:		;removed
	.db $10 $18

B10_0d38:		asl a			; 0a
B10_0d39:	.db $fc
B10_0d3a:	.db $fa
B10_0d3b:		clc				; 18 
B10_0d3c:		bpl B10_0d28 ; 10 ea

B10_0d3e:		ldx #$08		; a2 08
B10_0d40:		lda #$c0		; a9 c0
B10_0d42:		jsr func_13ef		; 20 ef f3
B10_0d45:		lda $1a			; a5 1a
B10_0d47:		and #$03		; 29 03
B10_0d49:		beq B10_0d84 ; f0 39

B10_0d4b:		lda $19			; a5 19
B10_0d4d:		and #$04		; 29 04
B10_0d4f:		bne B10_0d81 ; d0 30

B10_0d51:		dec $1c			; c6 1c
B10_0d53:		bne B10_0d70 ; d0 1b

B10_0d55:		lda $1a			; a5 1a
B10_0d57:		and #$fc		; 29 fc
B10_0d59:		sta $1a			; 85 1a
B10_0d5b:		lda $18			; a5 18
B10_0d5d:		cmp #$3b		; c9 3b
B10_0d5f:		bne B10_0d65 ; d0 04

B10_0d61:		lda #$10		; a9 10
B10_0d63:		bne B10_0d6a ; d0 05

B10_0d65:		ldy $1f			; a4 1f
B10_0d67:		lda $8e55, y	; b9 55 8e
B10_0d6a:		jsr func_a_0214		; 20 14 82
B10_0d6d:		jmp $8d84		; 4c 84 8d


B10_0d70:		lda $1a			; a5 1a
B10_0d72:		and #$02		; 29 02
B10_0d74:		bne B10_0d81 ; d0 0b

B10_0d76:		lda $1c			; a5 1c
B10_0d78:		cmp #$20		; c9 20
B10_0d7a:		bne B10_0d81 ; d0 05

B10_0d7c:		lda #$26		; a9 26
B10_0d7e:		jsr initEntityA		; 20 33 80
B10_0d81:		jmp $8dfb		; 4c fb 8d


B10_0d84:		lda $18			; a5 18
B10_0d86:		cmp #$3b		; c9 3b
B10_0d88:		bne B10_0d9b ; d0 11

B10_0d8a:		lda $19			; a5 19
B10_0d8c:		and #$04		; 29 04
B10_0d8e:		bne B10_0d9b ; d0 0b

B10_0d90:		lda $015a		; ad 5a 01
B10_0d93:		and #$3f		; 29 3f
B10_0d95:		bne B10_0d9b ; d0 04

B10_0d97:		lda #$c0		; a9 c0
B10_0d99:		sta $15			; 85 15
B10_0d9b:		jsr func_a_0225		; 20 25 82
B10_0d9e:		bit $4a			; 24 4a
B10_0da0:		bvc B10_0daa ; 50 08

B10_0da2:		lda $14			; a5 14
B10_0da4:		eor #$ff		; 49 ff
B10_0da6:		sta $14			; 85 14
B10_0da8:		inc $14			; e6 14
B10_0daa:		lda #$09		; a9 09
B10_0dac:		jsr func_1888		; 20 88 f8
B10_0daf:		lda #$09		; a9 09
B10_0db1:		jsr func_1aac		; 20 ac fa
B10_0db4:		bcs B10_0dcb ; b0 15

B10_0db6:		lda $1a			; a5 1a
B10_0db8:		ora #$01		; 09 01
B10_0dba:		sta $1a			; 85 1a
B10_0dbc:		lda #$00		; a9 00
B10_0dbe:		sta $14			; 85 14
B10_0dc0:		sta $15			; 85 15
B10_0dc2:		lda #$40		; a9 40
B10_0dc4:		sta $1c			; 85 1c
B10_0dc6:		inc $1f			; e6 1f
B10_0dc8:		jmp $8dfb		; 4c fb 8d


B10_0dcb:		lda #$09		; a9 09
B10_0dcd:		jsr func_1745		; 20 45 f7
B10_0dd0:		bcc B10_0dfb ; 90 29

B10_0dd2:		lda $1f			; a5 1f
B10_0dd4:		bpl B10_0deb ; 10 15

B10_0dd6:		lda #$40		; a9 40
B10_0dd8:		sta $1a			; 85 1a
B10_0dda:		lda #$d3		; a9 d3
B10_0ddc:		sta $1b			; 85 1b
B10_0dde:		lda #$d7		; a9 d7
B10_0de0:		sta $1c			; 85 1c
B10_0de2:		lda #$db		; a9 db
B10_0de4:		sta $1d			; 85 1d
B10_0de6:		lda #$5d		; a9 5d
B10_0de8:		jmp setGlobalFlag		; 4c f0 e7


B10_0deb:		lda $1a			; a5 1a
B10_0ded:		ora #$02		; 09 02
B10_0def:		sta $1a			; 85 1a
B10_0df1:		lda #$40		; a9 40
B10_0df3:		sta $1c			; 85 1c
B10_0df5:		lda #$00		; a9 00
B10_0df7:		sta $14			; 85 14
B10_0df9:		sta $15			; 85 15
B10_0dfb:		ldy #$00		; a0 00
B10_0dfd:		lda $18			; a5 18
B10_0dff:		cmp #$3b		; c9 3b
B10_0e01:		bne B10_0e05 ; d0 02

B10_0e03:		ldy #$02		; a0 02
B10_0e05:		lda $1a			; a5 1a
B10_0e07:		and #$03		; 29 03
B10_0e09:		beq B10_0e0f ; f0 04

B10_0e0b:		tya				; 98 
B10_0e0c:		ora #$04		; 09 04
B10_0e0e:		tay				; a8 
B10_0e0f:		lda $8e41, y	; b9 41 8e
B10_0e12:		sta $01			; 85 01
B10_0e14:		lda $8e42, y	; b9 42 8e
B10_0e17:		sta $02			; 85 02
B10_0e19:		lda $1a			; a5 1a
B10_0e1b:		and #$03		; 29 03
B10_0e1d:		bne B10_0e30 ; d0 11

B10_0e1f:		lda $11			; a5 11
B10_0e21:		sta $00			; 85 00
B10_0e23:		lda $10			; a5 10
B10_0e25:		asl $00			; 06 00
B10_0e27:		rol a			; 2a
B10_0e28:		and #$03		; 29 03
B10_0e2a:		tay				; a8 
B10_0e2b:		lda ($01), y	; b1 01
B10_0e2d:		jmp updateEntity_wOam		; 4c 67 f5


B10_0e30:		lsr a			; 4a
B10_0e31:		tay				; a8 
B10_0e32:		beq B10_0e3b ; f0 07

B10_0e34:		lda $015a		; ad 5a 01
B10_0e37:		and #$01		; 29 01
B10_0e39:		bne B10_0e40 ; d0 05

B10_0e3b:		lda ($01), y	; b1 01
B10_0e3d:		jmp updateEntity_wOam		; 4c 67 f5


B10_0e40:		rts				; 60 


B10_0e41:		eor #$8e		; 49 8e
B10_0e43:		eor $518e		; 4d 8e 51
B10_0e46:		stx $8e53		; 8e 53 8e
B10_0e49:		adc $76, x		; 75 76
B10_0e4b:	.db $77
B10_0e4c:		ror $b9, x		; 76 b9
B10_0e4e:		tsx				; ba 
B10_0e4f:		ldy $78ba, x	; bc ba 78
B10_0e52:		adc $bdbb, y	; 79 bb bd
B10_0e55:		jsr $181c		; 20 1c 18
B10_0e58:	.db $14
B10_0e59:		bpl B10_0e7b ; 10 20

B10_0e5b:		sta ($8c), y	; 91 8c
B10_0e5d:		bcs B10_0e6c ; b0 0d

B10_0e5f:		lda #$20		; a9 20
B10_0e61:		sta $1a			; 85 1a
B10_0e63:		lda #$88		; a9 88
B10_0e65:		sta $1c			; 85 1c
B10_0e67:		lda #$07		; a9 07
B10_0e69:		jmp func_08e5		; 4c e5 e8


B10_0e6c:		lda $1d			; a5 1d
B10_0e6e:		cmp #$40		; c9 40
B10_0e70:		bcc B10_0e8f ; 90 1d

B10_0e72:		lda $015a		; ad 5a 01
B10_0e75:		and #$01		; 29 01
B10_0e77:		bne B10_0e8f ; d0 16

B10_0e79:		lda #$03		; a9 03
B10_0e7b:		sta $2a			; 85 2a
B10_0e7d:		ldy #$05		; a0 05
B10_0e7f:		lda $8e90, y	; b9 90 8e
B10_0e82:		cmp $18			; c5 18
B10_0e84:		beq B10_0e89 ; f0 03

B10_0e86:		dey				; 88 
B10_0e87:		bne B10_0e7f ; d0 f6

B10_0e89:		lda $8e96, y	; b9 96 8e
B10_0e8c:		jmp updateEntity_wOam		; 4c 67 f5


B10_0e8f:		rts				; 60 


B10_0e90:	.db $34
B10_0e91:	.db $3a
B10_0e92:	.db $3b
B10_0e93:	.db $3c
B10_0e94:		and $7944, x	; 3d 44 79
B10_0e97:		clv				; b8 
B10_0e98:		lda $cc9e, x	; bd 9e cc
B10_0e9b:		lda ($ad), y	; b1 ad
B10_0e9d:	.db $5a
B10_0e9e:		ora ($29, x)	; 01 29
B10_0ea0:	.db $03
B10_0ea1:		bne B10_0ecd ; d0 2a

B10_0ea3:		dec $1c			; c6 1c
B10_0ea5:		bne B10_0ecd ; d0 26

B10_0ea7:		jsr $de74		; 20 74 de
B10_0eaa:		lda #$5d		; a9 5d
B10_0eac:		jsr unsetGlobalFlag		; 20 fc e7
B10_0eaf:		jsr $df5b		; 20 5b df
B10_0eb2:		lda #$00		; a9 00
B10_0eb4:		sta $19			; 85 19
B10_0eb6:		ldy #$06		; a0 06
B10_0eb8:		lda $8ece, y	; b9 ce 8e
B10_0ebb:		cmp $18			; c5 18
B10_0ebd:		beq B10_0ec2 ; f0 03

B10_0ebf:		dey				; 88 
B10_0ec0:		bne B10_0eb8 ; d0 f6

B10_0ec2:		lda $8ed5, y	; b9 d5 8e
B10_0ec5:		jsr setGlobalFlag		; 20 f0 e7
B10_0ec8:		lda #$4d		; a9 4d
B10_0eca:		jmp unsetGlobalFlag		; 4c fc e7


B10_0ecd:		rts				; 60 


B10_0ece:	.db $34
B10_0ecf:		and $3b3a, y	; 39 3a 3b
B10_0ed2:	.db $3c
B10_0ed3:		and $2044, x	; 3d 44 20
B10_0ed6:		and ($22, x)	; 21 22
B10_0ed8:	.db $23
B10_0ed9:		bit $25			; 24 25
B10_0edb:		rol $85			; 26 85
B10_0edd:		.db $00				; 00
B10_0ede:		lda $19			; a5 19
B10_0ee0:		and #$02		; 29 02
B10_0ee2:		beq B10_0ef6 ; f0 12

B10_0ee4:		dec $14			; c6 14
B10_0ee6:		lda $00			; a5 00
B10_0ee8:		eor #$ff		; 49 ff
B10_0eea:		sta $00			; 85 00
B10_0eec:		inc $00			; e6 00
B10_0eee:		lda $14			; a5 14
B10_0ef0:		cmp $00			; c5 00
B10_0ef2:		bcc B10_0efe ; 90 0a

B10_0ef4:		bcs B10_0f02 ; b0 0c

B10_0ef6:		inc $14			; e6 14
B10_0ef8:		lda $14			; a5 14
B10_0efa:		cmp $00			; c5 00
B10_0efc:		bcc B10_0f02 ; 90 04

B10_0efe:		lda $00			; a5 00
B10_0f00:		sta $14			; 85 14
B10_0f02:		rts				; 60 


B10_0f03:		sta $00			; 85 00
B10_0f05:		lda $19			; a5 19
B10_0f07:		and #$02		; 29 02
B10_0f09:		bne B10_0f1a ; d0 0f

B10_0f0b:		inc $14			; e6 14
B10_0f0d:		lda $14			; a5 14
B10_0f0f:		bmi B10_0f19 ; 30 08

B10_0f11:		cmp $00			; c5 00
B10_0f13:		bcc B10_0f19 ; 90 04

B10_0f15:		lda $00			; a5 00
B10_0f17:		sta $14			; 85 14
B10_0f19:		rts				; 60 


B10_0f1a:		lda $00			; a5 00
B10_0f1c:		eor #$ff		; 49 ff
B10_0f1e:		sta $00			; 85 00
B10_0f20:		inc $00			; e6 00
B10_0f22:		dec $14			; c6 14
B10_0f24:		lda $14			; a5 14
B10_0f26:		bpl B10_0f30 ; 10 08

B10_0f28:		cmp $00			; c5 00
B10_0f2a:		bcs B10_0f30 ; b0 04

B10_0f2c:		lda $00			; a5 00
B10_0f2e:		sta $14			; 85 14
B10_0f30:		rts				; 60 


enUpdate_friendFight:
B10_0f31:		jsr func_a_01c2		; 20 c2 81
B10_0f34:		lda #$03		; a9 03
B10_0f36:		sta $2a			; 85 2a
B10_0f38:		lda #$56		; a9 56
B10_0f3a:		jsr checkGlobalFlag		; 20 e9 e7
B10_0f3d:		beq B10_0f40 ; f0 01

B10_0f3f:		rts				; 60 

B10_0f40:		bit $1a			; 24 1a
B10_0f42:		bpl B10_0f47 ; 10 03

B10_0f44:		jmp B10_0fae		; 4c ae 8f

B10_0f47:		bvc B10_0f4c ; 50 03

B10_0f49:		jmp B10_1004		; 4c 04 90

B10_0f4c:		lda $1a			; a5 1a
B10_0f4e:		and #$38		; 29 38
B10_0f50:		beq B10_0f63 ; f0 11

B10_0f52:		and #$18		; 29 18
B10_0f54:		bne B10_0f59 ; d0 03

B10_0f56:		jmp B10_10e8		; 4c e8 90

B10_0f59:		and #$08		; 29 08
B10_0f5b:		bne B10_0f60 ; d0 03

B10_0f5d:		jmp B10_1074		; 4c 74 90

B10_0f60:		jmp B10_1161		; 4c 61 91

B10_0f63:		lda $2d			; a5 2d
B10_0f65:		and #$0f		; 29 0f
B10_0f67:		bne B10_0f92 ; d0 29

B10_0f69:		lda $1a			; a5 1a
B10_0f6b:		ora #$40		; 09 40
B10_0f6d:		sta $1a			; 85 1a
B10_0f6f:		lda $038a		; ad 8a 03
B10_0f72:		ora #$40		; 09 40
B10_0f74:		sta $038a		; 8d 8a 03
B10_0f77:		lda #$e8		; a9 e8
B10_0f79:		sta $15			; 85 15
B10_0f7b:		lda #$0c		; a9 0c
B10_0f7d:		sta $14			; 85 14
B10_0f7f:		lda $0384		; ad 84 03
B10_0f82:		bpl B10_0f8c ; 10 08

B10_0f84:		lda $14			; a5 14
B10_0f86:		eor #$ff		; 49 ff
B10_0f88:		sta $14			; 85 14
B10_0f8a:		inc $14			; e6 14
B10_0f8c:		lda #$3f		; a9 3f
// todo: ??
B10_0f8e:		sta func_08fa.w		; 8d fa e8
B10_0f91:		rts				; 60 

B10_0f92:		lda $2c			; a5 2c
B10_0f94:		and #$0f		; 29 0f
B10_0f96:		bne B10_0fab ; d0 13

B10_0f98:		lda $1a			; a5 1a
B10_0f9a:		ora #$20		; 09 20
B10_0f9c:		sta $1a			; 85 1a
B10_0f9e:		lda $038a		; ad 8a 03
B10_0fa1:		ora #$40		; 09 40
B10_0fa3:		sta $038a		; 8d 8a 03
B10_0fa6:		lda #$5d		; a9 5d
B10_0fa8:		jmp setGlobalFlag		; 4c f0 e7

B10_0fab:		jmp $9220		; 4c 20 92

B10_0fae:		lda $1c			; a5 1c
B10_0fb0:		cmp #$50		; c9 50
B10_0fb2:		beq B10_0fe3 ; f0 2f

B10_0fb4:		dec $1c			; c6 1c
B10_0fb6:		bne B10_0fd4 ; d0 1c

B10_0fb8:		lda $1a			; a5 1a
B10_0fba:		and #$03		; 29 03
B10_0fbc:		sta $1a			; 85 1a
B10_0fbe:		tay				; a8 
B10_0fbf:		lda $91ce, y	; b9 ce 91
B10_0fc2:		jsr displayTextIdxedA		; 20 72 87
B10_0fc5:		lda #$5b		; a9 5b
B10_0fc7:		jsr setGlobalFlag		; 20 f0 e7
B10_0fca:		lda #$43		; a9 43
B10_0fcc:		jsr initEntityA		; 20 33 80
B10_0fcf:		lda #$5d		; a9 5d
B10_0fd1:		jsr unsetGlobalFlag		; 20 fc e7
B10_0fd4:		lda #$83		; a9 83
B10_0fd6:		sta $2b			; 85 2b
B10_0fd8:		lda $1a			; a5 1a
B10_0fda:		and #$03		; 29 03
B10_0fdc:		tay				; a8 
B10_0fdd:		lda $91d7, y	; b9 d7 91
B10_0fe0:		jmp func_1596		; 4c 96 f5

B10_0fe3:		dec $1c			; c6 1c
B10_0fe5:		ldx #$04		; a2 04
B10_0fe7:		lda $1a			; a5 1a
B10_0fe9:		and #$03		; 29 03
B10_0feb:		asl a			; 0a
B10_0fec:		tay				; a8 
B10_0fed:		beq B10_0ffe ; f0 0f

B10_0fef:		lda $9204, y	; b9 04 92
B10_0ff2:		jsr $8819		; 20 19 88
B10_0ff5:		lda $1a			; a5 1a
B10_0ff7:		and #$03		; 29 03
B10_0ff9:		asl a			; 0a
B10_0ffa:		tay				; a8 
B10_0ffb:		iny				; c8 
B10_0ffc:		ldx #$04		; a2 04
B10_0ffe:		lda $9204, y	; b9 04 92
B10_1001:		jmp $8819		; 4c 19 88

B10_1004:		ldx #$0a		; a2 0a
B10_1006:		lda #$c8		; a9 c8
B10_1008:		jsr func_13ef		; 20 ef f3
B10_100b:		lda $0509		; ad 09 05
B10_100e:		and #$04		; 29 04
B10_1010:		bne B10_101e ; d0 0c

B10_1012:		lda #$5d		; a9 5d
B10_1014:		jsr checkGlobalFlag		; 20 e9 e7
B10_1017:		bne B10_101e ; d0 05

B10_1019:		lda #$5d		; a9 5d
B10_101b:		jsr setGlobalFlag		; 20 f0 e7
B10_101e:		lda $19			; a5 19
B10_1020:		and #$04		; 29 04
B10_1022:		bne B10_104b ; d0 27

B10_1024:		lda $14			; a5 14
B10_1026:		beq B10_1035 ; f0 0d

B10_1028:		lda $015a		; ad 5a 01
B10_102b:		and #$07		; 29 07
B10_102d:		bne B10_104b ; d0 1c

B10_102f:		jsr $86ef		; 20 ef 86
B10_1032:		jmp $904b		; 4c 4b 90

B10_1035:		lda $0389		; ad 89 03
B10_1038:		bne B10_104b ; d0 11

B10_103a:		lda $1a			; a5 1a
B10_103c:		and #$03		; 29 03
B10_103e:		ora #$10		; 09 10
B10_1040:		sta $1a			; 85 1a
B10_1042:		lda #$b0		; a9 b0
B10_1044:		sta $1c			; 85 1c
B10_1046:		lda #$07		; a9 07
B10_1048:		jsr func_08e5		; 20 e5 e8
B10_104b:		lda #$83		; a9 83
B10_104d:		sta $2b			; 85 2b
B10_104f:		lda $19			; a5 19
B10_1051:		and #$04		; 29 04
B10_1053:		bne B10_1069 ; d0 14

B10_1055:		lda $1a			; a5 1a
B10_1057:		and #$03		; 29 03
B10_1059:		asl a			; 0a
B10_105a:		tay				; a8 
B10_105b:		lda $015a		; ad 5a 01
B10_105e:		and #$08		; 29 08
B10_1060:		bne B10_1063 ; d0 01

B10_1062:		iny				; c8 
B10_1063:		lda $91da, y	; b9 da 91
B10_1066:		jmp func_1596		; 4c 96 f5

B10_1069:		lda $1a			; a5 1a
B10_106b:		and #$03		; 29 03
B10_106d:		tay				; a8 
B10_106e:		lda $9201, y	; b9 01 92
B10_1071:		jmp func_1596		; 4c 96 f5

B10_1074:		lda $015a		; ad 5a 01
B10_1077:		and #$03		; 29 03
B10_1079:		bne B10_10be ; d0 43

B10_107b:		dec $1c			; c6 1c
B10_107d:		bne B10_10a3 ; d0 24

B10_107f:		jsr $de74		; 20 74 de
B10_1082:		lda #$5d		; a9 5d
B10_1084:		jsr unsetGlobalFlag		; 20 fc e7
B10_1087:		lda #$4d		; a9 4d
B10_1089:		jsr unsetGlobalFlag		; 20 fc e7
B10_108c:		lda $1a			; a5 1a
B10_108e:		and #$03		; 29 03
B10_1090:		tay				; a8 
B10_1091:		lda friendFightWon_globalFlagsSet.w, y	; b9 0a 92
B10_1094:		jsr setGlobalFlag		; 20 f0 e7
B10_1097:		lda #$00		; a9 00
B10_1099:		sta $19			; 85 19
B10_109b:		lda #$87		; a9 87
B10_109d:		jsr unsetGlobalFlag		; 20 fc e7
B10_10a0:		jmp $df5b		; 4c 5b df

B10_10a3:		lda $1c			; a5 1c
B10_10a5:		cmp #$20		; c9 20
B10_10a7:		bne B10_10be ; d0 15

B10_10a9:		lda #$5b		; a9 5b
B10_10ab:		jsr unsetGlobalFlag		; 20 fc e7
B10_10ae:		lda $1a			; a5 1a
B10_10b0:		and #$03		; 29 03
B10_10b2:		tay				; a8 
	lda friendFightWon_textIdxes.w, y
	jsr displayTextIdxedA
B10_10b9:		lda #$38		; a9 38
B10_10bb:		jsr func_08fa		; 20 fa e8
B10_10be:		lda $1c			; a5 1c
B10_10c0:		cmp #$20		; c9 20
B10_10c2:		bcs B10_10cf ; b0 0b

B10_10c4:		cmp #$08		; c9 08
B10_10c6:		bcc B10_10e7 ; 90 1f

B10_10c8:		lda $015a		; ad 5a 01
B10_10cb:		and #$01		; 29 01
B10_10cd:		bne B10_10e7 ; d0 18

B10_10cf:		lda #$83		; a9 83
B10_10d1:		sta $2b			; 85 2b
B10_10d3:		lda $1a			; a5 1a
B10_10d5:		and #$03		; 29 03
B10_10d7:		asl a			; 0a
B10_10d8:		tay				; a8 
B10_10d9:		lda $015a		; ad 5a 01
B10_10dc:		and #$08		; 29 08
B10_10de:		bne B10_10e1 ; d0 01

B10_10e0:		iny				; c8 
B10_10e1:		lda $91da, y	; b9 da 91
B10_10e4:		jmp func_1596		; 4c 96 f5

B10_10e7:		rts				; 60 

B10_10e8:		ldx #$0a		; a2 0a
B10_10ea:		lda $1a			; a5 1a
B10_10ec:		and #$01		; 29 01
B10_10ee:		beq B10_10f4 ; f0 04

B10_10f0:		lda #$c8		; a9 c8
B10_10f2:		bne B10_10f6 ; d0 02

B10_10f4:		lda #$c0		; a9 c0
B10_10f6:		jsr func_13ef		; 20 ef f3
B10_10f9:		jsr func_a_0225		; 20 25 82
B10_10fc:		lda #$10		; a9 10
B10_10fe:		jsr func_a_0214		; 20 14 82
B10_1101:		lda $19			; a5 19
B10_1103:		and #$04		; 29 04
B10_1105:		bne B10_1128 ; d0 21

B10_1107:		jsr $89ce		; 20 ce 89
B10_110a:		lda $00			; a5 00
B10_110c:		cmp #$40		; c9 40
B10_110e:		bcc B10_1128 ; 90 18

B10_1110:		lda #$00		; a9 00
B10_1112:		sta $14			; 85 14
B10_1114:		jsr $8a12		; 20 12 8a
B10_1117:		lda $1a			; a5 1a
B10_1119:		and #$03		; 29 03
B10_111b:		ora #$08		; 09 08
B10_111d:		sta $1a			; 85 1a
B10_111f:		lda #$a0		; a9 a0
B10_1121:		sta $1c			; 85 1c
B10_1123:		lda #$06		; a9 06
B10_1125:		jsr func_08e5		; 20 e5 e8
B10_1128:		lda #$83		; a9 83
B10_112a:		sta $2b			; 85 2b
B10_112c:		lda $19			; a5 19
B10_112e:		and #$04		; 29 04
B10_1130:		bne B10_1156 ; d0 24

B10_1132:		lda $1a			; a5 1a
B10_1134:		and #$03		; 29 03
B10_1136:		asl a			; 0a
B10_1137:		tay				; a8 
B10_1138:		lda $91e0, y	; b9 e0 91
B10_113b:		sta $01			; 85 01
B10_113d:		lda $91e1, y	; b9 e1 91
B10_1140:		sta $02			; 85 02
B10_1142:		lda $11			; a5 11
B10_1144:		sta $00			; 85 00
B10_1146:		lda $10			; a5 10
B10_1148:		asl $00			; 06 00
B10_114a:		rol a			; 2a
B10_114b:		asl $00			; 06 00
B10_114d:		rol a			; 2a
B10_114e:		and #$07		; 29 07
B10_1150:		tay				; a8 
B10_1151:		lda ($01), y	; b1 01
B10_1153:		jmp func_1596		; 4c 96 f5

B10_1156:		lda $1a			; a5 1a
B10_1158:		and #$03		; 29 03
B10_115a:		tay				; a8 
B10_115b:		lda $91fe, y	; b9 fe 91
B10_115e:		jmp func_1596		; 4c 96 f5

B10_1161:		lda $015a		; ad 5a 01
B10_1164:		and #$03		; 29 03
B10_1166:		bne B10_11bf ; d0 57

B10_1168:		dec $1c			; c6 1c
B10_116a:		bne B10_11a9 ; d0 3d

B10_116c:		lda wFilledHeartContainers.w		; ad e3 04
B10_116f:		and #$07		; 29 07
B10_1171:		lsr a			; 4a
B10_1172:		sta $00			; 85 00
B10_1174:		lda wFilledHeartContainers.w		; ad e3 04
B10_1177:		and #$f8		; 29 f8
B10_1179:		ora $00			; 05 00
B10_117b:		sta wFilledHeartContainers.w		; 8d e3 04
B10_117e:		jsr $de74		; 20 74 de
B10_1181:		lda #$00		; a9 00
B10_1183:		sta $0504		; 8d 04 05
B10_1186:		sta $0505		; 8d 05 05
B10_1189:		lda #$5d		; a9 5d
B10_118b:		jsr unsetGlobalFlag		; 20 fc e7
B10_118e:		lda #$4d		; a9 4d
B10_1190:		jsr unsetGlobalFlag		; 20 fc e7
B10_1193:		lda #$00		; a9 00
B10_1195:		sta $19			; 85 19
B10_1197:		lda $1a			; a5 1a
B10_1199:		and #$03		; 29 03
B10_119b:		tay				; a8 
B10_119c:		lda $920d, y	; b9 0d 92
B10_119f:		sta $4f			; 85 4f
B10_11a1:		lda #$87		; a9 87
B10_11a3:		jsr unsetGlobalFlag		; 20 fc e7
B10_11a6:		jmp $df5b		; 4c 5b df

B10_11a9:		lda $1c			; a5 1c
B10_11ab:		cmp #$20		; c9 20
B10_11ad:		bne B10_11bf ; d0 10

B10_11af:		lda #$5b		; a9 5b
B10_11b1:		jsr unsetGlobalFlag		; 20 fc e7
B10_11b4:		lda $1a			; a5 1a
B10_11b6:		and #$03		; 29 03
B10_11b8:		tay				; a8 
B10_11b9:		lda $91d4, y	; b9 d4 91
B10_11bc:		jsr displayTextIdxedA		; 20 72 87
B10_11bf:		lda #$83		; a9 83
B10_11c1:		sta $2b			; 85 2b
B10_11c3:		lda $1a			; a5 1a
B10_11c5:		and #$03		; 29 03
B10_11c7:		tay				; a8 
B10_11c8:		lda $91d7, y	; b9 d7 91
B10_11cb:		jmp func_1596		; 4c 96 f5


B10_11ce:		.db $00				; 00
B10_11cf:	.db $02
B10_11d0:	.db $04


friendFightWon_textIdxes:
	.db $01 $03 $05


B10_11d4:		.db $23
B10_11d5:		bit $25			; 24 25
B10_11d7:	.db $c2
B10_11d8:	.db $42
B10_11d9:	.db $82
B10_11da:	.db $da
B10_11db:	.db $db
B10_11dc:		rts				; 60 


B10_11dd:		adc ($a1, x)	; 61 a1
B10_11df:		ldx #$e6		; a2 e6
B10_11e1:		sta ($ee), y	; 91 ee
B10_11e3:		sta ($f6), y	; 91 f6
B10_11e5:		sta ($c0), y	; 91 c0
B10_11e7:		cmp ($c2, x)	; c1 c2
B10_11e9:	.db $c3
B10_11ea:		cpy $c3			; c4 c3
B10_11ec:	.db $c2
B10_11ed:		cmp ($40, x)	; c1 40
B10_11ef:		eor ($42, x)	; 41 42
B10_11f1:	.db $43
B10_11f2:	.db $44
B10_11f3:	.db $43
B10_11f4:	.db $42
B10_11f5:		eor ($80, x)	; 41 80
B10_11f7:		sta ($82, x)	; 81 82
B10_11f9:	.db $83
B10_11fa:		sty $83			; 84 83
B10_11fc:	.db $82
B10_11fd:		sta ($d5, x)	; 81 d5
B10_11ff:		eor $95, x		; 55 95
B10_1201:	.db $e2
B10_1202:		adc $99			; 65 99
B10_1204:	.db $80
B10_1205:	.db $80
B10_1206:	.db $80
B10_1207:		sta ($8e, x)	; 81 8e
B10_1209:	.db $8f


friendFightWon_globalFlagsSet:
	.db GF_freeon
	.db GF_shades
	.db GF_gil


B10_120d:		sty $95, x		; 94 95
B10_120f:		stx $85, y		; 96 85
B10_1211:	.db $14
B10_1212:		lda $0384		; ad 84 03
B10_1215:		bpl B10_121f ; 10 08

B10_1217:		lda $14			; a5 14
B10_1219:		eor #$ff		; 49 ff
B10_121b:		sta $14			; 85 14
B10_121d:		inc $14			; e6 14
B10_121f:		rts				; 60 


B10_1220:		ldx #$0a		; a2 0a
B10_1222:		lda $1a			; a5 1a
B10_1224:		and #$01		; 29 01
B10_1226:		beq B10_122c ; f0 04

B10_1228:		lda #$c8		; a9 c8
B10_122a:		bne B10_122e ; d0 02

B10_122c:		lda #$c0		; a9 c0
B10_122e:		jsr func_13ef		; 20 ef f3
B10_1231:		bit $1b			; 24 1b
B10_1233:		bvc B10_123f ; 50 0a

B10_1235:		dec $1c			; c6 1c
B10_1237:		bne B10_123f ; d0 06

B10_1239:		lda $1b			; a5 1b
B10_123b:		and #$bf		; 29 bf
B10_123d:		sta $1b			; 85 1b
B10_123f:		lda $1b			; a5 1b
B10_1241:		and #$20		; 29 20
B10_1243:		beq B10_1267 ; f0 22

B10_1245:		lda $1a			; a5 1a
B10_1247:		and #$01		; 29 01
B10_1249:		beq B10_124f ; f0 04

B10_124b:		lda $15			; a5 15
B10_124d:		bmi B10_1264 ; 30 15

B10_124f:		dec $1d			; c6 1d
B10_1251:		bne B10_1259 ; d0 06

B10_1253:		lda $1b			; a5 1b
B10_1255:		and #$df		; 29 df
B10_1257:		sta $1b			; 85 1b
B10_1259:		lda $1d			; a5 1d
B10_125b:		cmp #$08		; c9 08
B10_125d:		bne B10_1264 ; d0 05

B10_125f:		lda #$03		; a9 03
B10_1261:		jsr initEntityA		; 20 33 80
B10_1264:		jmp $9362		; 4c 62 93


B10_1267:		bit $1b			; 24 1b
B10_1269:		bpl B10_12c7 ; 10 5c

B10_126b:		lda $19			; a5 19
B10_126d:		and #$04		; 29 04
B10_126f:		bne B10_12ba ; d0 49

B10_1271:		lda $1a			; a5 1a
B10_1273:		and #$03		; 29 03
B10_1275:		beq B10_1285 ; f0 0e

B10_1277:		lda $051c		; ad 1c 05
B10_127a:		bne B10_12ba ; d0 3e

B10_127c:		jsr $89ce		; 20 ce 89
B10_127f:		lda $00			; a5 00
B10_1281:		cmp #$80		; c9 80
B10_1283:		bcs B10_12ba ; b0 35

B10_1285:		lda $015a		; ad 5a 01
B10_1288:		and #$3f		; 29 3f
B10_128a:		bne B10_12ba ; d0 2e

B10_128c:		lda $1b			; a5 1b
B10_128e:		ora #$20		; 09 20
B10_1290:		sta $1b			; 85 1b
B10_1292:		lda #$17		; a9 17
B10_1294:		sta $1d			; 85 1d
B10_1296:		lda $1a			; a5 1a
B10_1298:		and #$03		; 29 03
B10_129a:		bne B10_12a7 ; d0 0b

B10_129c:		lda $015a		; ad 5a 01
B10_129f:		bpl B10_12a4 ; 10 03

B10_12a1:		jsr $9493		; 20 93 94
B10_12a4:		jmp $9362		; 4c 62 93


B10_12a7:		lda $0509		; ad 09 05
B10_12aa:		and #$04		; 29 04
B10_12ac:		beq B10_12b1 ; f0 03

B10_12ae:		jsr $9493		; 20 93 94
B10_12b1:		lda $00			; a5 00
B10_12b3:		cmp #$30		; c9 30
B10_12b5:		bcc B10_12ba ; 90 03

B10_12b7:		jsr $8a12		; 20 12 8a
B10_12ba:		lda $015a		; ad 5a 01
B10_12bd:		and #$7f		; 29 7f
B10_12bf:		bne B10_12c4 ; d0 03

B10_12c1:		jsr $9493		; 20 93 94
B10_12c4:		jmp $9362		; 4c 62 93


B10_12c7:		lda $050b		; ad 0b 05
B10_12ca:		and #$01		; 29 01
B10_12cc:		bne B10_1328 ; d0 5a

B10_12ce:		jsr $94ac		; 20 ac 94
B10_12d1:		bcs B10_12f5 ; b0 22

B10_12d3:		lda $1a			; a5 1a
B10_12d5:		and #$03		; 29 03
B10_12d7:		bne B10_12e2 ; d0 09

B10_12d9:		lda $015a		; ad 5a 01
B10_12dc:		and #$3f		; 29 3f
B10_12de:		beq B10_12ef ; f0 0f

B10_12e0:		bne B10_12f2 ; d0 10

B10_12e2:		lda $00			; a5 00
B10_12e4:		cmp #$60		; c9 60
B10_12e6:		bcs B10_12f2 ; b0 0a

B10_12e8:		lda $0387		; ad 87 03
B10_12eb:		cmp #$90		; c9 90
B10_12ed:		bcs B10_12f2 ; b0 03

B10_12ef:		jsr $9493		; 20 93 94
B10_12f2:		jmp $9362		; 4c 62 93


B10_12f5:		lda $1a			; a5 1a
B10_12f7:		and #$01		; 29 01
B10_12f9:		bne B10_1301 ; d0 06

B10_12fb:		lda $19			; a5 19
B10_12fd:		and #$04		; 29 04
B10_12ff:		bne B10_1325 ; d0 24

B10_1301:		lda $1a			; a5 1a
B10_1303:		and #$03		; 29 03
B10_1305:		tay				; a8 
B10_1306:		lda $948a, y	; b9 8a 94
B10_1309:		cmp $00			; c5 00
B10_130b:		bcs B10_1310 ; b0 03

B10_130d:		jsr $94c6		; 20 c6 94
B10_1310:		lda $015a		; ad 5a 01
B10_1313:		and #$7f		; 29 7f
B10_1315:		bne B10_1325 ; d0 0e

B10_1317:		lda $1a			; a5 1a
B10_1319:		and #$03		; 29 03
B10_131b:		bne B10_1322 ; d0 05

B10_131d:		lda $015a		; ad 5a 01
B10_1320:		bne B10_1325 ; d0 03

B10_1322:		jsr $9493		; 20 93 94
B10_1325:		jmp $9362		; 4c 62 93


B10_1328:		lda $1a			; a5 1a
B10_132a:		and #$01		; 29 01
B10_132c:		bne B10_1348 ; d0 1a

B10_132e:		lda $19			; a5 19
B10_1330:		and #$04		; 29 04
B10_1332:		bne B10_1362 ; d0 2e

B10_1334:		lda $1a			; a5 1a
B10_1336:		and #$03		; 29 03
B10_1338:		bne B10_1348 ; d0 0e

B10_133a:		lda $015a		; ad 5a 01
B10_133d:		and #$7f		; 29 7f
B10_133f:		bne B10_1362 ; d0 21

B10_1341:		lda $015a		; ad 5a 01
B10_1344:		bpl B10_135f ; 10 19

B10_1346:		bmi B10_1354 ; 30 0c

B10_1348:		lda $015a		; ad 5a 01
B10_134b:		and #$3f		; 29 3f
B10_134d:		bne B10_1362 ; d0 13

B10_134f:		lda $015a		; ad 5a 01
B10_1352:		bpl B10_135a ; 10 06

B10_1354:		lda $19			; a5 19
B10_1356:		eor #$02		; 49 02
B10_1358:		sta $19			; 85 19
B10_135a:		bit $015a		; 2c 5a 01
B10_135d:		bvc B10_1362 ; 50 03

B10_135f:		jsr $9493		; 20 93 94
B10_1362:		lda $19			; a5 19
B10_1364:		and #$04		; 29 04
B10_1366:		bne B10_1377 ; d0 0f

B10_1368:		jsr func_a_0225		; 20 25 82
B10_136b:		bit $4a			; 24 4a
B10_136d:		bvc B10_1377 ; 50 08

B10_136f:		lda $14			; a5 14
B10_1371:		eor #$ff		; 49 ff
B10_1373:		sta $14			; 85 14
B10_1375:		inc $14			; e6 14
B10_1377:		lda #$10		; a9 10
B10_1379:		jsr $8f03		; 20 03 8f
B10_137c:		bit $1b			; 24 1b
B10_137e:		bvs B10_138e ; 70 0e

B10_1380:		lda #$01		; a9 01
B10_1382:		jsr func_1888		; 20 88 f8
B10_1385:		lda #$01		; a9 01
B10_1387:		jsr func_1aac		; 20 ac fa
B10_138a:		bcs B10_138e ; b0 02

B10_138c:		inc $1f			; e6 1f
B10_138e:		lda $1b			; a5 1b
B10_1390:		and #$20		; 29 20
B10_1392:		beq B10_13c5 ; f0 31

B10_1394:		ldy #$00		; a0 00
B10_1396:		lda $1d			; a5 1d
B10_1398:		cmp #$10		; c9 10
B10_139a:		bcs B10_13a4 ; b0 08

B10_139c:		ldy #$03		; a0 03
B10_139e:		cmp #$08		; c9 08
B10_13a0:		bcs B10_13a4 ; b0 02

B10_13a2:		ldy #$06		; a0 06
B10_13a4:		lda $1a			; a5 1a
B10_13a6:		and #$03		; 29 03
B10_13a8:		sta $00			; 85 00
B10_13aa:		tya				; 98 
B10_13ab:		clc				; 18 
B10_13ac:		adc $00			; 65 00
B10_13ae:		tay				; a8 
B10_13af:		bit $1b			; 24 1b
B10_13b1:		bvc B10_13ba ; 50 07

B10_13b3:		lda $015a		; ad 5a 01
B10_13b6:		and #$01		; 29 01
B10_13b8:		bne B10_13c4 ; d0 0a

B10_13ba:		lda #$83		; a9 83
B10_13bc:		sta $2b			; 85 2b
B10_13be:		lda $9475, y	; b9 75 94
B10_13c1:		jmp func_1596		; 4c 96 f5


B10_13c4:		rts				; 60 


B10_13c5:		lda $19			; a5 19
B10_13c7:		and #$04		; 29 04
B10_13c9:		beq B10_1403 ; f0 38

B10_13cb:		ldy #$09		; a0 09
B10_13cd:		bit $1b			; 24 1b
B10_13cf:		bmi B10_13dc ; 30 0b

B10_13d1:		ldy #$00		; a0 00
B10_13d3:		lda $015a		; ad 5a 01
B10_13d6:		and #$08		; 29 08
B10_13d8:		bne B10_13dc ; d0 02

B10_13da:		ldy #$03		; a0 03
B10_13dc:		lda $15			; a5 15
B10_13de:		bmi B10_13e2 ; 30 02

B10_13e0:		ldy #$06		; a0 06
B10_13e2:		lda $1a			; a5 1a
B10_13e4:		and #$03		; 29 03
B10_13e6:		sta $00			; 85 00
B10_13e8:		tya				; 98 
B10_13e9:		clc				; 18 
B10_13ea:		adc $00			; 65 00
B10_13ec:		tay				; a8 
B10_13ed:		bit $1b			; 24 1b
B10_13ef:		bvc B10_13f8 ; 50 07

B10_13f1:		lda $015a		; ad 5a 01
B10_13f4:		and #$01		; 29 01
B10_13f6:		bne B10_1402 ; d0 0a

B10_13f8:		lda #$83		; a9 83
B10_13fa:		sta $2b			; 85 2b
B10_13fc:		lda $947e, y	; b9 7e 94
B10_13ff:		jmp func_1596		; 4c 96 f5


B10_1402:		rts				; 60 


B10_1403:		lda $1a			; a5 1a
B10_1405:		and #$03		; 29 03
B10_1407:		asl a			; 0a
B10_1408:		tay				; a8 
B10_1409:		lda $943f, y	; b9 3f 94
B10_140c:		sta $01			; 85 01
B10_140e:		lda $9440, y	; b9 40 94
B10_1411:		sta $02			; 85 02
B10_1413:		lda $11			; a5 11
B10_1415:		sta $00			; 85 00
B10_1417:		lda $10			; a5 10
B10_1419:		asl $00			; 06 00
B10_141b:		rol a			; 2a
B10_141c:		asl $00			; 06 00
B10_141e:		rol a			; 2a
B10_141f:		and #$07		; 29 07
B10_1421:		tay				; a8 
B10_1422:		bit $1b			; 24 1b
B10_1424:		bpl B10_142a ; 10 04

B10_1426:		tya				; 98 
B10_1427:		ora #$08		; 09 08
B10_1429:		tay				; a8 
B10_142a:		bit $1b			; 24 1b
B10_142c:		bvc B10_1435 ; 50 07

B10_142e:		lda $015a		; ad 5a 01
B10_1431:		and #$01		; 29 01
B10_1433:		bne B10_143e ; d0 09

B10_1435:		lda #$83		; a9 83
B10_1437:		sta $2b			; 85 2b
B10_1439:		lda ($01), y	; b1 01
B10_143b:		jmp func_1596		; 4c 96 f5


B10_143e:		rts				; 60 


B10_143f:		eor $94			; 45 94
B10_1441:		eor $94, x		; 55 94
B10_1443:		adc $94			; 65 94
B10_1445:		cpy #$c1		; c0 c1
B10_1447:	.db $c2
B10_1448:	.db $c3
B10_1449:		cpy $c3			; c4 c3
B10_144b:	.db $c2
B10_144c:		cmp ($d0, x)	; c1 d0
B10_144e:		cmp ($d2), y	; d1 d2
B10_1450:	.db $d3
B10_1451:	.db $d4
B10_1452:	.db $d3
B10_1453:	.db $d2
B10_1454:		cmp ($40), y	; d1 40
B10_1456:		eor ($42, x)	; 41 42
B10_1458:	.db $43
B10_1459:	.db $44
B10_145a:	.db $43
B10_145b:	.db $42
B10_145c:		eor ($50, x)	; 41 50
B10_145e:		eor ($52), y	; 51 52
B10_1460:	.db $53
B10_1461:	.db $54
B10_1462:	.db $53
B10_1463:	.db $52
B10_1464:		eor ($80), y	; 51 80
B10_1466:		sta ($82, x)	; 81 82
B10_1468:	.db $83
B10_1469:		sty $83			; 84 83
B10_146b:	.db $82
B10_146c:		sta ($90, x)	; 81 90
B10_146e:		sta ($92), y	; 91 92
B10_1470:	.db $93
B10_1471:		sty $93, x		; 94 93
B10_1473:	.db $92
B10_1474:		sta ($cd), y	; 91 cd
B10_1476:		eor $ce8d		; 4d 8d ce
B10_1479:		lsr $cf8e		; 4e 8e cf
B10_147c:	.db $4f
B10_147d:	.db $8f
B10_147e:		cmp #$49		; c9 49
B10_1480:	.db $89
B10_1481:		dex				; ca 
B10_1482:		lsr a			; 4a
B10_1483:		txa				; 8a 
B10_1484:	.db $cb
B10_1485:	.db $4b
B10_1486:	.db $8b
B10_1487:		cmp $55, x		; d5 55
B10_1489:		sta $40, x		; 95 40
B10_148b:		clc				; 18 
B10_148c:		rti				; 40 


B10_148d:		;removed
	.db $b0 $c0

B10_148f:		cpx $ec			; e4 ec
B10_1491:		bcs B10_1453 ; b0 c0

B10_1493:		lda $19			; a5 19
B10_1495:		and #$04		; 29 04
B10_1497:		bne B10_14ab ; d0 12

B10_1499:		lda $1a			; a5 1a
B10_149b:		and #$03		; 29 03
B10_149d:		asl a			; 0a
B10_149e:		tay				; a8 
B10_149f:		lda $1b			; a5 1b
B10_14a1:		and #$20		; 29 20
B10_14a3:		bne B10_14a6 ; d0 01

B10_14a5:		iny				; c8 
B10_14a6:		lda $948d, y	; b9 8d 94
B10_14a9:		sta $15			; 85 15
B10_14ab:		rts				; 60 


B10_14ac:		lda $0386		; ad 86 03
B10_14af:		sec				; 38 
B10_14b0:		sbc $16			; e5 16
B10_14b2:		bcs B10_14b9 ; b0 05

B10_14b4:		eor #$ff		; 49 ff
B10_14b6:		clc				; 18 
B10_14b7:		adc #$01		; 69 01
B10_14b9:		sta $00			; 85 00
B10_14bb:		lda $0384		; ad 84 03
B10_14be:		cmp #$10		; c9 10
B10_14c0:		bcc B10_14c4 ; 90 02

B10_14c2:		clc				; 18 
B10_14c3:		rts				; 60 


B10_14c4:		sec				; 38 
B10_14c5:		rts				; 60 


B10_14c6:		lda $0386		; ad 86 03
B10_14c9:		cmp $16			; c5 16
B10_14cb:		bcs B10_14d3 ; b0 06

B10_14cd:		lda $19			; a5 19
B10_14cf:		ora #$02		; 09 02
B10_14d1:		bne B10_14d7 ; d0 04

B10_14d3:		lda $19			; a5 19
B10_14d5:		and #$fd		; 29 fd
B10_14d7:		sta $19			; 85 19
B10_14d9:		rts				; 60 


func_a_14da:
B10_14da:		jsr func_a_01c2		; 20 c2 81
B10_14dd:		ldy $1b			; a4 1b
B10_14df:		ldx data_a_155b.w, y	; be 5b 95
B10_14e2:		lda #$c0		; a9 c0
B10_14e4:		jsr func_13ef		; 20 ef f3
B10_14e7:		jsr func_a_01ea		; 20 ea 81
B10_14ea:		jsr func_a_0225		; 20 25 82
B10_14ed:		lda #$08		; a9 08
B10_14ef:		jsr func_a_0214		; 20 14 82

B10_14f2:		ldy $1b			; a4 1b
B10_14f4:		lda data_a_155e.w, y	; b9 5e 95
B10_14f7:		jsr func_1888		; 20 88 f8
B10_14fa:		ldy $1b			; a4 1b
B10_14fc:		lda data_a_155e.w, y	; b9 5e 95
B10_14ff:		jsr func_1aac		; 20 ac fa
B10_1502:		ldy $1b			; a4 1b
B10_1504:		lda data_a_155e.w, y	; b9 5e 95
B10_1507:		jsr func_1745		; 20 45 f7
B10_150a:		bcc B10_1515 ; 90 09

B10_150c:		lda $1f			; a5 1f
B10_150e:		bpl B10_1515 ; 10 05

B10_1510:		lda #$27		; a9 27
B10_1512:		jmp initEntityA		; 4c 33 80

B10_1515:		lda $1b			; a5 1b
B10_1517:		asl a			; 0a
B10_1518:		tay				; a8 
B10_1519:		lda data_a_1549.w, y	; b9 49 95
B10_151c:		sta $01			; 85 01
B10_151e:		lda data_a_1549.w+1, y	; b9 4a 95
B10_1521:		sta $02			; 85 02
B10_1523:		lda $1b			; a5 1b
B10_1525:		cmp #$01		; c9 01
B10_1527:		bne B10_1535 ; d0 0c

B10_1529:		ldy #$00		; a0 00
B10_152b:		bit $11			; 24 11
B10_152d:		bvs B10_1530 ; 70 01

B10_152f:		iny				; c8 
B10_1530:		lda ($01), y	; b1 01
B10_1532:		jmp updateEntity_wOam		; 4c 67 f5

// entity timer vals to cycle through 0 to 3
B10_1535:		lda $11			; a5 11
B10_1537:		sta $00			; 85 00
B10_1539:		lda $10			; a5 10
B10_153b:		asl $00			; 06 00
B10_153d:		rol a			; 2a
B10_153e:		asl $00			; 06 00
B10_1540:		rol a			; 2a
B10_1541:		and #$03		; 29 03
B10_1543:		tay				; a8 
B10_1544:		lda ($01), y	; b1 01
B10_1546:		jmp updateEntity_wOam		; 4c 67 f5


data_a_1549:
	.dw @entry0
	.dw @entry1
	.dw @entry2

@entry0:
	.db $37 $38 $39 $38

@entry1:
	.db $cf $d0 $cf $d0

@entry2:
	.db $e7 $e8 $e9 $e8


data_a_155b:
	.db $0c $0c $0a
	
data_a_155e:	
	.db $00 $06 $01


func_a_1561:
B10_1561:		jsr func_a_01c2		; 20 c2 81
B10_1564:		ldy $1b			; a4 1b
B10_1566:		ldx $961f, y	; be 1f 96
B10_1569:		lda $18			; a5 18
B10_156b:		cmp #$11		; c9 11
B10_156d:		beq B10_1577 ; f0 08

B10_156f:		cmp #$56		; c9 56
B10_1571:		beq B10_1577 ; f0 04

B10_1573:		lda #$80		; a9 80
B10_1575:		bne B10_1579 ; d0 02

B10_1577:		lda #$00		; a9 00
B10_1579:		jsr func_13ef		; 20 ef f3
B10_157c:		lda $18			; a5 18
B10_157e:		cmp #$1e		; c9 1e
B10_1580:		beq B10_158f ; f0 0d

B10_1582:		jsr $89ed		; 20 ed 89
B10_1585:		lda $18			; a5 18
B10_1587:		cmp #$11		; c9 11
B10_1589:		beq B10_15a4 ; f0 19

B10_158b:		cmp #$56		; c9 56
B10_158d:		beq B10_15a4 ; f0 15

B10_158f:		jsr func_a_0225		; 20 25 82
B10_1592:		lda #$10		; a9 10
B10_1594:		jsr func_a_0214		; 20 14 82
B10_1597:		lda $015a		; ad 5a 01
B10_159a:		bne B10_15a4 ; d0 08

B10_159c:		ldy $1b			; a4 1b
B10_159e:		lda $961c, y	; b9 1c 96
B10_15a1:		jsr initEntityA		; 20 33 80
B10_15a4:		ldy $1b			; a4 1b
B10_15a6:		lda $9624, y	; b9 24 96
B10_15a9:		jsr func_1888		; 20 88 f8
B10_15ac:		ldy $1b			; a4 1b
B10_15ae:		lda $9624, y	; b9 24 96
B10_15b1:		jsr func_1aac		; 20 ac fa
B10_15b4:		ldy $1b			; a4 1b
B10_15b6:		lda $9624, y	; b9 24 96
B10_15b9:		jsr func_1745		; 20 45 f7
B10_15bc:		bcc B10_15c7 ; 90 09

B10_15be:		lda $1f			; a5 1f
B10_15c0:		bpl B10_15c7 ; 10 05

B10_15c2:		lda #$27		; a9 27
B10_15c4:		jmp initEntityA		; 4c 33 80


B10_15c7:		lda $1b			; a5 1b
B10_15c9:		asl a			; 0a
B10_15ca:		tay				; a8 
B10_15cb:		lda $95fe, y	; b9 fe 95
B10_15ce:		sta $01			; 85 01
B10_15d0:		lda $95ff, y	; b9 ff 95
B10_15d3:		sta $02			; 85 02
B10_15d5:		lda $18			; a5 18
B10_15d7:		cmp #$11		; c9 11
B10_15d9:		beq B10_15f0 ; f0 15

B10_15db:		cmp #$56		; c9 56
B10_15dd:		beq B10_15f0 ; f0 11

B10_15df:		lda $11			; a5 11
B10_15e1:		sta $00			; 85 00
B10_15e3:		lda $10			; a5 10
B10_15e5:		asl $00			; 06 00
B10_15e7:		rol a			; 2a
B10_15e8:		and #$03		; 29 03
B10_15ea:		tay				; a8 
B10_15eb:		lda ($01), y	; b1 01
B10_15ed:		jmp updateEntity_wOam		; 4c 67 f5


B10_15f0:		lda $015a		; ad 5a 01
B10_15f3:		and #$18		; 29 18
B10_15f5:		lsr a			; 4a
B10_15f6:		lsr a			; 4a
B10_15f7:		lsr a			; 4a
B10_15f8:		tay				; a8 
B10_15f9:		lda ($01), y	; b1 01
B10_15fb:		jmp updateEntity_wOam		; 4c 67 f5


B10_15fe:		php				; 08 
B10_15ff:		stx $0c, y		; 96 0c
B10_1601:		stx $10, y		; 96 10
B10_1603:		stx $14, y		; 96 14
B10_1605:		stx $18, y		; 96 18
B10_1607:		stx $53, y		; 96 53
B10_1609:	.db $54
B10_160a:		eor $54, x		; 55 54
B10_160c:		adc $7f7e, x	; 7d 7e 7f
B10_160f:		ror $e5e4, x	; 7e e4 e5
B10_1612:		inc $e5			; e6 e5
B10_1614:	.db $37
B10_1615:		sec				; 38 
B10_1616:		and $e138, y	; 39 38 e1
B10_1619:	.db $e2
B10_161a:		sbc ($e2, x)	; e1 e2
B10_161c:	.db $4b
B10_161d:	.db $3f
B10_161e:	.db $07
B10_161f:	.db $0c
B10_1620:		;removed
	.db $10 $0a

B10_1622:	.db $0c
B10_1623:		asl a			; 0a
B10_1624:	.db $03
B10_1625:		asl $02			; 06 02
B10_1627:		.db $00				; 00
B10_1628:	.db $02
B10_1629:		lda $1d			; a5 1d
B10_162b:		bmi B10_163e ; 30 11

B10_162d:		inc $15			; e6 15
B10_162f:		lda $15			; a5 15
B10_1631:		cmp $1d			; c5 1d
B10_1633:		bne B10_163a ; d0 05

B10_1635:		ora #$80		; 09 80
B10_1637:		sta $1d			; 85 1d
B10_1639:		rts				; 60 


B10_163a:		dey				; 88 
B10_163b:		bne B10_162d ; d0 f0

B10_163d:		rts				; 60 


B10_163e:		dec $15			; c6 15
B10_1640:		lda $1d			; a5 1d
B10_1642:		eor #$7f		; 49 7f
B10_1644:		clc				; 18 
B10_1645:		adc #$01		; 69 01
B10_1647:		cmp $15			; c5 15
B10_1649:		bne B10_1652 ; d0 07

B10_164b:		lda $1d			; a5 1d
B10_164d:		and #$7f		; 29 7f
B10_164f:		sta $1d			; 85 1d
B10_1651:		rts				; 60 


B10_1652:		dey				; 88 
B10_1653:		bne B10_163e ; d0 e9

B10_1655:		rts				; 60 


stub_a_1656:
B10_1656:		rts				; 60 


func_a_1657:
B10_1657:		jsr func_a_01c2		; 20 c2 81
B10_165a:		lda #$00		; a9 00
B10_165c:		jsr func_1b72		; 20 72 fb
B10_165f:		lda #$06		; a9 06
B10_1661:		jsr func_19a7		; 20 a7 f9
B10_1664:		lda $015a		; ad 5a 01
B10_1667:		and #$01		; 29 01
B10_1669:		beq B10_1690 ; f0 25

B10_166b:		lda wEntityWramOffset.w		; ad 5b 01
B10_166e:		lsr a			; 4a
B10_166f:		lsr a			; 4a
B10_1670:		lsr a			; 4a
B10_1671:		lsr a			; 4a
B10_1672:		tax				; aa 
B10_1673:		lda $e0, x		; b5 e0
B10_1675:		sec				; 38 
B10_1676:		sbc #$01		; e9 01
B10_1678:		sta $e0, x		; 95 e0
B10_167a:		beq B10_1687 ; f0 0b

B10_167c:		lda $e0, x		; b5 e0
B10_167e:		cmp #$10		; c9 10
B10_1680:		bcs B10_1690 ; b0 0e

B10_1682:		and #$01		; 29 01
B10_1684:		beq B10_1690 ; f0 0a

B10_1686:		rts				; 60 


B10_1687:		lda $e8, x		; b5 e8
B10_1689:		sta $18			; 85 18
B10_168b:		ldx #$04		; a2 04
B10_168d:		jsr $8af7		; 20 f7 8a
B10_1690:		lda #$28		; a9 28
B10_1692:		jmp updateEntity_wOam		; 4c 67 f5


func_a_1695:
B10_1695:		lda #$01		; a9 01
B10_1697:		sta $2a			; 85 2a
B10_1699:		lda $1b			; a5 1b
B10_169b:		beq B10_169f ; f0 02

B10_169d:		dec $1b			; c6 1b
B10_169f:		ldx #$14		; a2 14
B10_16a1:		lda #$c0		; a9 c0
B10_16a3:		jsr func_13ef		; 20 ef f3
B10_16a6:		jsr func_0709		; 20 09 e7
B10_16a9:		lda $015d		; ad 5d 01
B10_16ac:		beq B10_16b7 ; f0 09

B10_16ae:		lda #$00		; a9 00
B10_16b0:		sta $19			; 85 19
B10_16b2:		lda #$46		; a9 46
B10_16b4:		jmp unsetGlobalFlag		; 4c fc e7


B10_16b7:		bit $4a			; 24 4a
B10_16b9:		bvs B10_16c3 ; 70 08

B10_16bb:		bpl B10_16cc ; 10 0f

B10_16bd:		lda #$00		; a9 00
B10_16bf:		sta $14			; 85 14
B10_16c1:		beq B10_16cc ; f0 09

B10_16c3:		lda $14			; a5 14
B10_16c5:		eor #$ff		; 49 ff
B10_16c7:		clc				; 18 
B10_16c8:		adc #$01		; 69 01
B10_16ca:		sta $14			; 85 14
B10_16cc:		dec $1a			; c6 1a
B10_16ce:		bne B10_16fc ; d0 2c

B10_16d0:		lda #$24		; a9 24
B10_16d2:		jsr func_08fa		; 20 fa e8
B10_16d5:		lda #$61		; a9 61
B10_16d7:		sta wShadow1KBChrBank1.w		; 8d 6c 01
B10_16da:		ldx #$04		; a2 04
B10_16dc:		jsr $8aea		; 20 ea 8a
B10_16df:		lda #$46		; a9 46
B10_16e1:		jsr $8a57		; 20 57 8a
B10_16e4:		lda #$03		; a9 03
B10_16e6:		sta $18			; 85 18
B10_16e8:		lda #$33		; a9 33
B10_16ea:		sta $1a			; 85 1a
B10_16ec:		lda #$37		; a9 37
B10_16ee:		sta $1b			; 85 1b
B10_16f0:		lda #$3b		; a9 3b
B10_16f2:		sta $1c			; 85 1c
B10_16f4:		lda #$3f		; a9 3f
B10_16f6:		sta $1d			; 85 1d
B10_16f8:		lda #$0f		; a9 0f
B10_16fa:		sta $1e			; 85 1e
B10_16fc:		lda $1a			; a5 1a
B10_16fe:		and #$0f		; 29 0f
B10_1700:		cmp #$08		; c9 08
B10_1702:		bcs B10_1708 ; b0 04

B10_1704:		lda #$0c		; a9 0c
B10_1706:		bne B10_170a ; d0 02

B10_1708:		lda #$0b		; a9 0b
B10_170a:		jmp updateEntity_wOam		; 4c 67 f5


func_a_170d:
B10_170d:		jsr func_0709		; 20 09 e7
B10_1710:		lda $015d		; ad 5d 01
B10_1713:		bne B10_1719 ; d0 04

B10_1715:		dec $1a			; c6 1a
B10_1717:		bne B10_171e ; d0 05

B10_1719:		lda #$00		; a9 00
B10_171b:		sta $19			; 85 19
B10_171d:		rts				; 60 


B10_171e:		lda wEntityWramOffset.w		; ad 5b 01
B10_1721:		lsr a			; 4a
B10_1722:		lsr a			; 4a
B10_1723:		lsr a			; 4a
B10_1724:		lsr a			; 4a
B10_1725:		eor $1a			; 45 1a
B10_1727:		and #$01		; 29 01
B10_1729:		bne B10_171d ; d0 f2

B10_172b:		lda $1a			; a5 1a
B10_172d:		lsr a			; 4a
B10_172e:		lsr a			; 4a
B10_172f:		tay				; a8 
B10_1730:		lda $9736, y	; b9 36 97
B10_1733:		jmp updateEntity_wOam		; 4c 67 f5


B10_1736:		asl a			; 0a
B10_1737:		ora #$08		; 09 08
B10_1739:		.db $06


func_a_173a:
	lda #$61
	sta wShadow1KBChrBank1.w
	lda #$01
	sta $2a
B10_1743:		jsr func_0709		; 20 09 e7
B10_1746:		lda $015d		; ad 5d 01
B10_1749:		beq B10_175f ; f0 14

B10_174b:		nop				; ea 
B10_174c:		lda #$00		; a9 00
B10_174e:		sta $19			; 85 19
B10_1750:		lda #$0f		; a9 0f
B10_1752:		jsr $977a		; 20 7a 97
B10_1755:		ldx #$04		; a2 04
B10_1757:		jsr $8af7		; 20 f7 8a
B10_175a:		lda #$46		; a9 46
B10_175c:		jmp unsetGlobalFlag		; 4c fc e7


B10_175f:		lda $1e			; a5 1e
B10_1761:		lsr a			; 4a
B10_1762:		tay				; a8 
B10_1763:		lda $1e			; a5 1e
B10_1765:		bmi B10_176f ; 30 08

B10_1767:		dec $1e			; c6 1e
B10_1769:		lda $9793, y	; b9 93 97
B10_176c:		jsr $977a		; 20 7a 97
B10_176f:		jsr $979b		; 20 9b 97
B10_1772:		jsr $abe2		; 20 e2 ab
B10_1775:		lda $19			; a5 19
B10_1777:		beq B10_1750 ; f0 d7

B10_1779:		rts				; 60 


B10_177a:		sta $0180		; 8d 80 01
B10_177d:		sta $0184		; 8d 84 01
B10_1780:		sta $0188		; 8d 88 01
B10_1783:		sta $018c		; 8d 8c 01
B10_1786:		sta $0190		; 8d 90 01
B10_1789:		sta $0194		; 8d 94 01
B10_178c:		sta $0198		; 8d 98 01
B10_178f:		sta $019c		; 8d 9c 01
B10_1792:		rts				; 60 


B10_1793:	.db $0f
B10_1794:		jsr $200f		; 20 0f 20
B10_1797:	.db $0f
B10_1798:		jsr $200f		; 20 0f 20
B10_179b:		lda $0100		; ad 00 01
B10_179e:		cmp #$20		; c9 20
B10_17a0:		bcs B10_17fe ; b0 5c

B10_17a2:		lda #$08		; a9 08
B10_17a4:		sta $0c			; 85 0c
B10_17a6:		lda $9853		; ad 53 98
B10_17a9:		sta $0a			; 85 0a
B10_17ab:		lda $9854		; ad 54 98
B10_17ae:		sta $0b			; 85 0b
B10_17b0:		ldy #$00		; a0 00
B10_17b2:		lda ($0a), y	; b1 0a
B10_17b4:		clc				; 18 
B10_17b5:		adc $13			; 65 13
B10_17b7:		iny				; c8 
B10_17b8:		lda ($0a), y	; b1 0a
B10_17ba:		adc $12			; 65 12
B10_17bc:		sta $08			; 85 08
B10_17be:		and #$0f		; 29 0f
B10_17c0:		cmp #$0f		; c9 0f
B10_17c2:		bne B10_17c9 ; d0 05

B10_17c4:		inc $08			; e6 08
B10_17c6:		jmp $97d3		; 4c d3 97


B10_17c9:		lda $08			; a5 08
B10_17cb:		eor $32			; 45 32
B10_17cd:		and #$f0		; 29 f0
B10_17cf:		beq B10_17d3 ; f0 02

B10_17d1:		inc $08			; e6 08
B10_17d3:		lda $08			; a5 08
B10_17d5:		asl a			; 0a
B10_17d6:		asl a			; 0a
B10_17d7:		asl a			; 0a
B10_17d8:		asl a			; 0a
B10_17d9:		sta $0d			; 85 0d
B10_17db:		iny				; c8 
B10_17dc:		lda ($0a), y	; b1 0a
B10_17de:		clc				; 18 
B10_17df:		adc $11			; 65 11
B10_17e1:		iny				; c8 
B10_17e2:		lda ($0a), y	; b1 0a
B10_17e4:		adc $10			; 65 10
B10_17e6:		sta $09			; 85 09
B10_17e8:		and #$0f		; 29 0f
B10_17ea:		ora $0d			; 05 0d
B10_17ec:		tax				; aa 
B10_17ed:		sta $07			; 85 07
B10_17ef:		iny				; c8 
B10_17f0:		lda $0600, x	; bd 00 06
B10_17f3:		cmp #$1b		; c9 1b
B10_17f5:		bne B10_17fa ; d0 03

B10_17f7:		jsr $97ff		; 20 ff 97
B10_17fa:		dec $0c			; c6 0c
B10_17fc:		bpl B10_17b2 ; 10 b4

B10_17fe:		rts				; 60 


B10_17ff:		sty $06			; 84 06
B10_1801:		lda #$00		; a9 00
B10_1803:		sta $0600, x	; 9d 00 06
B10_1806:		jsr func_0832		; 20 32 e8
B10_1809:		bne B10_181f ; d0 14

B10_180b:		lda $09			; a5 09
B10_180d:		sta $0300, x	; 9d 00 03
B10_1810:		lda $08			; a5 08
B10_1812:		sta $0302, x	; 9d 02 03
B10_1815:		lda #$12		; a9 12
B10_1817:		sta $0308, x	; 9d 08 03
B10_181a:		lda #$81		; a9 81
B10_181c:		sta $0309, x	; 9d 09 03
B10_181f:		lda $07			; a5 07
B10_1821:		and #$0f		; 29 0f
B10_1823:		asl a			; 0a
B10_1824:		sta $0f			; 85 0f
B10_1826:		lda #$00		; a9 00
B10_1828:		sta $0e			; 85 0e
B10_182a:		lda $07			; a5 07
B10_182c:		and #$f0		; 29 f0
B10_182e:		asl a			; 0a
B10_182f:		rol $0e			; 26 0e
B10_1831:		asl a			; 0a
B10_1832:		rol $0e			; 26 0e
B10_1834:		ora $0f			; 05 0f
B10_1836:		sta $0f			; 85 0f
B10_1838:		lda $09			; a5 09
B10_183a:		and #$10		; 29 10
B10_183c:		beq B10_1842 ; f0 04

B10_183e:		lda #$24		; a9 24
B10_1840:		bne B10_1844 ; d0 02

B10_1842:		lda #$20		; a9 20
B10_1844:		ora $0e			; 05 0e
B10_1846:		sta $0e			; 85 0e
B10_1848:		lda #$29		; a9 29
B10_184a:		jsr copyStaticLayoutIdxedYForNMIDataCopyingAtCurrPPUAddr		; 20 96 fc
B10_184d:		jsr func_052e		; 20 2e e5
B10_1850:		ldy $06			; a4 06
B10_1852:		rts				; 60 


B10_1853:		eor $98, x		; 55 98
B10_1855:	.db $80
B10_1856:	.db $ff
B10_1857:		.db $00				; 00
B10_1858:		.db $00				; 00
B10_1859:	.db $80
B10_185a:		inc $ff00, x	; fe 00 ff
B10_185d:	.db $80
B10_185e:	.db $fe $00 $00
B10_1861:	.db $80
B10_1862:		inc $0100, x	; fe 00 01
B10_1865:	.db $80
B10_1866:	.db $ff
B10_1867:		.db $00				; 00
B10_1868:	.db $ff
B10_1869:	.db $80
B10_186a:	.db $ff
B10_186b:		.db $00				; 00
B10_186c:		ora ($80, x)	; 01 80
B10_186e:		.db $00				; 00
B10_186f:		.db $00				; 00
B10_1870:	.db $ff
B10_1871:	.db $80
B10_1872:		.db $00				; 00
B10_1873:		.db $00				; 00
B10_1874:		.db $00				; 00
B10_1875:	.db $80
B10_1876:		.db $00				; 00
B10_1877:		.db $00				; 00
B10_1878:		.db $01


func_a_1879:
	jsr func_0709
B10_187c:		lda $015d		; ad 5d 01
B10_187f:		beq B10_1886 ; f0 05

B10_1881:		lda #$00		; a9 00
B10_1883:		sta $19			; 85 19
B10_1885:		rts				; 60 


B10_1886:		dec $1a			; c6 1a
B10_1888:		beq B10_1881 ; f0 f7

B10_188a:		lda $1a			; a5 1a
B10_188c:		lsr a			; 4a
B10_188d:		lsr a			; 4a
B10_188e:		lsr a			; 4a
B10_188f:		tay				; a8 
B10_1890:		lda $9896, y	; b9 96 98
B10_1893:		jmp updateEntity_wOam		; 4c 67 f5


B10_1896:	.db $17
B10_1897:		asl $15, x		; 16 15
B10_1899:	.db $14


func_a_189a:
B10_189a:		lda #$00		; a9 00
B10_189c:		jsr func_13ef		; 20 ef f3
B10_189f:		jsr func_0709		; 20 09 e7
B10_18a2:		lda $015d		; ad 5d 01
B10_18a5:		beq B10_18aa ; f0 03

B10_18a7:		jmp $991f		; 4c 1f 99


B10_18aa:		lda $015a		; ad 5a 01
B10_18ad:		and #$03		; 29 03
B10_18af:		bne B10_18bb ; d0 0a

B10_18b1:		jsr func_0832		; 20 32 e8
B10_18b4:		bne B10_18bb ; d0 05

B10_18b6:		lda #$17		; a9 17
B10_18b8:		jsr func_0860		; 20 60 e8
B10_18bb:		bit $1a			; 24 1a
B10_18bd:		bvs B10_18f8 ; 70 39

B10_18bf:		dec $1b			; c6 1b
B10_18c1:		beq B10_18eb ; f0 28

B10_18c3:		lda $015a		; ad 5a 01
B10_18c6:		and #$01		; 29 01
B10_18c8:		bne B10_18d1 ; d0 07

B10_18ca:		jsr $9928		; 20 28 99
B10_18cd:		lda $00			; a5 00
B10_18cf:		sta $1c			; 85 1c
B10_18d1:		ldx $1c			; a6 1c
B10_18d3:		bmi B10_18eb ; 30 16

B10_18d5:		lda wEntityStructs.byte6.w, x	; bd 06 04
B10_18d8:		sta $00			; 85 00
B10_18da:		lda wEntityStructs.byte7.w, x	; bd 07 04
B10_18dd:		sta $01			; 85 01
B10_18df:		lda #$04		; a9 04
B10_18e1:		sta $02			; 85 02
B10_18e3:		jsr $88a8		; 20 a8 88
B10_18e6:		lda #$77		; a9 77
B10_18e8:		jmp func_1596		; 4c 96 f5


B10_18eb:		lda #$40		; a9 40
B10_18ed:		sta $1a			; 85 1a
B10_18ef:		lda #$80		; a9 80
B10_18f1:		sta $1b			; 85 1b
B10_18f3:		lda #$77		; a9 77
B10_18f5:		jmp func_1596		; 4c 96 f5


B10_18f8:		dec $1b			; c6 1b
B10_18fa:		beq B10_191f ; f0 23

B10_18fc:		lda $0506		; ad 06 05
B10_18ff:		sta $00			; 85 00
B10_1901:		lda $0507		; ad 07 05
B10_1904:		sta $01			; 85 01
B10_1906:		lda #$08		; a9 08
B10_1908:		sta $02			; 85 02
B10_190a:		jsr $88a8		; 20 a8 88
B10_190d:		lda #$08		; a9 08
B10_190f:		sta $00			; 85 00
B10_1911:		lda #$10		; a9 10
B10_1913:		sta $01			; 85 01
B10_1915:		jsr func_1a95		; 20 95 fa
B10_1918:		bcc B10_191f ; 90 05

B10_191a:		lda #$77		; a9 77
B10_191c:		jmp func_1596		; 4c 96 f5


B10_191f:		lda #$00		; a9 00
B10_1921:		sta $19			; 85 19
B10_1923:		lda #$46		; a9 46
B10_1925:		jmp unsetGlobalFlag		; 4c fc e7


B10_1928:		ldx #$00		; a2 00
B10_192a:		lda wEntityStructs.byte9.w, x	; bd 09 04
B10_192d:		beq B10_1933 ; f0 04

B10_192f:		and #$20		; 29 20
B10_1931:		beq B10_1941 ; f0 0e

B10_1933:		txa				; 8a 
B10_1934:		clc				; 18 
B10_1935:		adc #$10		; 69 10
B10_1937:		tax				; aa 
B10_1938:		cmp #$80		; c9 80
B10_193a:		bne B10_192a ; d0 ee

B10_193c:		lda #$80		; a9 80
B10_193e:		sta $00			; 85 00
B10_1940:		rts				; 60 


B10_1941:		ldy $99c9		; ac c9 99
B10_1944:		lda wEntityStructs.id.w, x	; bd 08 04
B10_1947:		cmp $99ca, y	; d9 ca 99
B10_194a:		beq B10_1952 ; f0 06

B10_194c:		dey				; 88 
B10_194d:		bpl B10_1947 ; 10 f8

B10_194f:		jmp $9933		; 4c 33 99


B10_1952:		stx $00			; 86 00
B10_1954:		lda $16			; a5 16
B10_1956:		sec				; 38 
B10_1957:		sbc wEntityStructs.byte6.w, x	; fd 06 04
B10_195a:		bpl B10_1961 ; 10 05

B10_195c:		eor #$ff		; 49 ff
B10_195e:		clc				; 18 
B10_195f:		adc #$01		; 69 01
B10_1961:		sta $02			; 85 02
B10_1963:		lda $17			; a5 17
B10_1965:		sec				; 38 
B10_1966:		sbc wEntityStructs.byte7.w, x	; fd 07 04
B10_1969:		bpl B10_1970 ; 10 05

B10_196b:		eor #$ff		; 49 ff
B10_196d:		clc				; 18 
B10_196e:		adc #$01		; 69 01
B10_1970:		clc				; 18 
B10_1971:		adc $02			; 65 02
B10_1973:		sta $02			; 85 02
B10_1975:		lda $0419, x	; bd 19 04
B10_1978:		beq B10_197e ; f0 04

B10_197a:		and #$20		; 29 20
B10_197c:		beq B10_1988 ; f0 0a

B10_197e:		txa				; 8a 
B10_197f:		clc				; 18 
B10_1980:		adc #$10		; 69 10
B10_1982:		tax				; aa 
B10_1983:		cmp #$70		; c9 70
B10_1985:		bcc B10_1975 ; 90 ee

B10_1987:		rts				; 60 


B10_1988:		ldy $99c9		; ac c9 99
B10_198b:		lda $0418, x	; bd 18 04
B10_198e:		cmp $99ca, y	; d9 ca 99
B10_1991:		beq B10_1999 ; f0 06

B10_1993:		dey				; 88 
B10_1994:		bpl B10_198e ; 10 f8

B10_1996:		jmp $997e		; 4c 7e 99


B10_1999:		stx $01			; 86 01
B10_199b:		lda $16			; a5 16
B10_199d:		sec				; 38 
B10_199e:		sbc $0416, x	; fd 16 04
B10_19a1:		bpl B10_19a8 ; 10 05

B10_19a3:		eor #$ff		; 49 ff
B10_19a5:		clc				; 18 
B10_19a6:		adc #$01		; 69 01
B10_19a8:		sta $03			; 85 03
B10_19aa:		lda $17			; a5 17
B10_19ac:		sec				; 38 
B10_19ad:		sbc $0417, x	; fd 17 04
B10_19b0:		bpl B10_19b7 ; 10 05

B10_19b2:		eor #$ff		; 49 ff
B10_19b4:		clc				; 18 
B10_19b5:		adc #$01		; 69 01
B10_19b7:		clc				; 18 
B10_19b8:		adc $03			; 65 03
B10_19ba:		cmp $02			; c5 02
B10_19bc:		bcs B10_197e ; b0 c0

B10_19be:		sta $02			; 85 02
B10_19c0:		txa				; 8a 
B10_19c1:		clc				; 18 
B10_19c2:		adc #$10		; 69 10
B10_19c4:		sta $00			; 85 00
B10_19c6:		jmp $997e		; 4c 7e 99


B10_19c9:		ora $1711, y	; 19 11 17
B10_19cc:		clc				; 18 
B10_19cd:		ora $1b1a, y	; 19 1a 1b
B10_19d0:	.db $1c
B10_19d1:		ora $1f1e, x	; 1d 1e 1f
B10_19d4:		jsr $3635		; 20 35 36
B10_19d7:	.db $37
B10_19d8:	.db $3c
B10_19d9:		rol $4e45, x	; 3e 45 4e
B10_19dc:	.db $4f
B10_19dd:	.db $53
B10_19de:	.db $54
B10_19df:		eor $56, x		; 55 56
B10_19e1:	.db $5a
B10_19e2:	.db $5b
B10_19e3:	.db $5c


func_a_19e4:
B10_19e4:		ldx #$00		; a2 00
B10_19e6:		lda #$80		; a9 80
B10_19e8:		jsr func_13ef		; 20 ef f3
B10_19eb:		lda $4a			; a5 4a
B10_19ed:		bne B10_19fe ; d0 0f

B10_19ef:		lda $015a		; ad 5a 01
B10_19f2:		and #$01		; 29 01
B10_19f4:		bne B10_1a02 ; d0 0c

B10_19f6:		jsr func_0709		; 20 09 e7
B10_19f9:		lda $015d		; ad 5d 01
B10_19fc:		beq B10_1a03 ; f0 05

B10_19fe:		lda #$00		; a9 00
B10_1a00:		sta $19			; 85 19
B10_1a02:		rts				; 60 


B10_1a03:		lda #$12		; a9 12
B10_1a05:		jmp updateEntity_wOam		; 4c 67 f5


func_a_1a08:
B10_1a08:		lda $10			; a5 10
B10_1a0a:		sec				; 38 
B10_1a0b:		sbc $30			; e5 30
B10_1a0d:		bpl B10_1a14 ; 10 05

B10_1a0f:		eor #$ff		; 49 ff
B10_1a11:		clc				; 18 
B10_1a12:		adc #$01		; 69 01
B10_1a14:		cmp #$12		; c9 12
B10_1a16:		bcs B10_1a28 ; b0 10

B10_1a18:		lda $12			; a5 12
B10_1a1a:		sec				; 38 
B10_1a1b:		sbc $32			; e5 32
B10_1a1d:		bpl B10_1a24 ; 10 05

B10_1a1f:		eor #$ff		; 49 ff
B10_1a21:		clc				; 18 
B10_1a22:		adc #$01		; 69 01
B10_1a24:		cmp #$10		; c9 10
B10_1a26:		bcc B10_1a2d ; 90 05

B10_1a28:		lda #$00		; a9 00
B10_1a2a:		sta $19			; 85 19
B10_1a2c:		rts				; 60 


B10_1a2d:		lda #$80		; a9 80
B10_1a2f:		sta $16			; 85 16
B10_1a31:		lda #$30		; a9 30
B10_1a33:		sta $17			; 85 17
B10_1a35:		lda $015a		; ad 5a 01
B10_1a38:		and #$10		; 29 10
B10_1a3a:		bne B10_1a3d ; d0 01

B10_1a3c:		rts				; 60 


B10_1a3d:		lda $015a		; ad 5a 01
B10_1a40:		and #$0f		; 29 0f
B10_1a42:		bne B10_1a49 ; d0 05

B10_1a44:		lda #$30		; a9 30
B10_1a46:		jsr func_08fa		; 20 fa e8
B10_1a49:		lda $1f			; a5 1f
B10_1a4b:		and #$c0		; 29 c0
B10_1a4d:		beq B10_1a5b ; f0 0c

B10_1a4f:		cmp #$40		; c9 40
B10_1a51:		beq B10_1a5f ; f0 0c

B10_1a53:		cmp #$80		; c9 80
B10_1a55:		beq B10_1a63 ; f0 0c

B10_1a57:		lda #$10		; a9 10
B10_1a59:		bne B10_1a65 ; d0 0a

B10_1a5b:		lda #$0d		; a9 0d
B10_1a5d:		bne B10_1a65 ; d0 06

B10_1a5f:		lda #$0e		; a9 0e
B10_1a61:		bne B10_1a65 ; d0 02

B10_1a63:		lda #$0f		; a9 0f
B10_1a65:		jmp updateEntity_wOam		; 4c 67 f5


func_a_1a68:
B10_1a68:		lda #$10		; a9 10
B10_1a6a:		sta $00			; 85 00
B10_1a6c:		lda #$e0		; a9 e0
B10_1a6e:		sta $02			; 85 02
B10_1a70:		lda #$f0		; a9 f0
B10_1a72:		sta $01			; 85 01
B10_1a74:		lda #$20		; a9 20
B10_1a76:		sta $03			; 85 03
B10_1a78:		jsr func_0735		; 20 35 e7
B10_1a7b:		lda $015d		; ad 5d 01
B10_1a7e:		bpl B10_1a89 ; 10 09

B10_1a80:		lda #$00		; a9 00
B10_1a82:		sta $19			; 85 19
B10_1a84:		lda $1e			; a5 1e
B10_1a86:		jmp unsetGlobalFlag		; 4c fc e7


B10_1a89:		lda $14			; a5 14
B10_1a8b:		bpl B10_1a92 ; 10 05

B10_1a8d:		eor #$ff		; 49 ff
B10_1a8f:		clc				; 18 
B10_1a90:		adc #$01		; 69 01
B10_1a92:		jsr func_a_0214		; 20 14 82
B10_1a95:		ldx #$00		; a2 00
B10_1a97:		lda #$00		; a9 00
B10_1a99:		jsr func_13ef		; 20 ef f3
B10_1a9c:		ldy $1f			; a4 1f
B10_1a9e:		lda $19			; a5 19
B10_1aa0:		and #$02		; 29 02
B10_1aa2:		bne B10_1ab7 ; d0 13

B10_1aa4:		lda $11			; a5 11
B10_1aa6:		sec				; 38 
B10_1aa7:		sbc $9add, y	; f9 dd 9a
B10_1aaa:		lda $10			; a5 10
B10_1aac:		sbc $9ade, y	; f9 de 9a
B10_1aaf:		bmi B10_1aca ; 30 19

B10_1ab1:		lda $19			; a5 19
B10_1ab3:		ora #$02		; 09 02
B10_1ab5:		bne B10_1ac8 ; d0 11

B10_1ab7:		lda $11			; a5 11
B10_1ab9:		sec				; 38 
B10_1aba:		sbc $9adb, y	; f9 db 9a
B10_1abd:		lda $10			; a5 10
B10_1abf:		sbc $9adc, y	; f9 dc 9a
B10_1ac2:		bpl B10_1aca ; 10 06

B10_1ac4:		lda $19			; a5 19
B10_1ac6:		and #$fd		; 29 fd
B10_1ac8:		sta $19			; 85 19
B10_1aca:		lda #$00		; a9 00
B10_1acc:		jsr func_19a7		; 20 a7 f9
B10_1acf:		bcs B10_1ad6 ; b0 05

B10_1ad1:		lda #$22		; a9 22
B10_1ad3:		jmp updateEntity_wOam		; 4c 67 f5


B10_1ad6:		lda #$e3		; a9 e3
B10_1ad8:		jmp updateEntity_wOam		; 4c 67 f5


B10_1adb:	.db $80
B10_1adc:		rol $80, x		; 36 80
B10_1ade:	.db $3f
B10_1adf:	.db $80
B10_1ae0:	.db $42
B10_1ae1:	.db $80
B10_1ae2:		eor $80			; 45 80
B10_1ae4:	.db $82
B10_1ae5:		.db $00				; 00
B10_1ae6:	.db $8b
B10_1ae7:	.db $80
B10_1ae8:	.db $04
B10_1ae9:	.db $80
B10_1aea:	.db $0c
B10_1aeb:	.db $80
B10_1aec:	.db $04
B10_1aed:	.db $80
B10_1aee:	.db $0c
B10_1aef:	.db $80
B10_1af0:	.db $04
B10_1af1:	.db $80
B10_1af2:	.db $0c
B10_1af3:	.db $80
B10_1af4:	.db $04
B10_1af5:	.db $80
B10_1af6:	.db $0c
B10_1af7:	.db $80
B10_1af8:	.db $02
B10_1af9:		.db $00				; 00
B10_1afa:	.db $0b
B10_1afb:	.db $80
B10_1afc:	.db $43
B10_1afd:		.db $00				; 00
B10_1afe:		.db $4c


func_a_1aff:
	lda #$f0
B10_1b01:		sta $00			; 85 00
B10_1b03:		lda #$10		; a9 10
B10_1b05:		sta $02			; 85 02
B10_1b07:		sta $01			; 85 01
B10_1b09:		sta $03			; 85 03
B10_1b0b:		jsr func_0735		; 20 35 e7
B10_1b0e:		lda $015d		; ad 5d 01
B10_1b11:		bmi B10_1b21 ; 30 0e

B10_1b13:		lda $11			; a5 11
B10_1b15:		sec				; 38 
B10_1b16:		sbc $31			; e5 31
B10_1b18:		lda $10			; a5 10
B10_1b1a:		sbc $30			; e5 30
B10_1b1c:		and #$f0		; 29 f0
B10_1b1e:		beq B10_1b2a ; f0 0a

B10_1b20:		rts				; 60 


B10_1b21:		lda #$00		; a9 00
B10_1b23:		sta $19			; 85 19
B10_1b25:		lda $1e			; a5 1e
B10_1b27:		jmp unsetGlobalFlag		; 4c fc e7


B10_1b2a:		lda $17			; a5 17
B10_1b2c:		sta $1d			; 85 1d
B10_1b2e:		lda $1c			; a5 1c
B10_1b30:		and #$3f		; 29 3f
B10_1b32:		tax				; aa 
B10_1b33:		lda $015d		; ad 5d 01
B10_1b36:		bne B10_1b41 ; d0 09

B10_1b38:		txa				; 8a 
B10_1b39:		pha				; 48 
B10_1b3a:		lda #$20		; a9 20
B10_1b3c:		jsr updateEntity_wOam		; 20 67 f5
B10_1b3f:		pla				; 68 
B10_1b40:		tax				; aa 
B10_1b41:		dex				; ca 
B10_1b42:		bmi B10_1b67 ; 30 23

B10_1b44:		lda $17			; a5 17
B10_1b46:		clc				; 18 
B10_1b47:		adc #$10		; 69 10
B10_1b49:		sta $17			; 85 17
B10_1b4b:		bcc B10_1b33 ; 90 e6

B10_1b4d:		lda $015d		; ad 5d 01
B10_1b50:		bne B10_1b5b ; d0 09

B10_1b52:		jsr $9bfc		; 20 fc 9b
B10_1b55:		dec $015d		; ce 5d 01
B10_1b58:		jmp $9b33		; 4c 33 9b


B10_1b5b:		lda $17			; a5 17
B10_1b5d:		sta $1d			; 85 1d
B10_1b5f:		lda #$00		; a9 00
B10_1b61:		sta $015d		; 8d 5d 01
B10_1b64:		jmp $9b33		; 4c 33 9b


B10_1b67:		bit $1c			; 24 1c
B10_1b69:		bvs B10_1bdd ; 70 72

B10_1b6b:		lda $17			; a5 17
B10_1b6d:		clc				; 18 
B10_1b6e:		adc $1b			; 65 1b
B10_1b70:		sta $17			; 85 17
B10_1b72:		bcc B10_1b8b ; 90 17

B10_1b74:		lda $015d		; ad 5d 01
B10_1b77:		bne B10_1b82 ; d0 09

B10_1b79:		jsr $9bfc		; 20 fc 9b
B10_1b7c:		dec $015d		; ce 5d 01
B10_1b7f:		jmp $9b8b		; 4c 8b 9b


B10_1b82:		lda $17			; a5 17
B10_1b84:		sta $1d			; 85 1d
B10_1b86:		lda #$00		; a9 00
B10_1b88:		sta $015d		; 8d 5d 01
B10_1b8b:		lda #$48		; a9 48
B10_1b8d:		jsr checkGlobalFlag		; 20 e9 e7
B10_1b90:		bne B10_1bcd ; d0 3b

B10_1b92:		lda $1c			; a5 1c
B10_1b94:		bmi B10_1bb0 ; 30 1a

B10_1b96:		inc $1b			; e6 1b
B10_1b98:		lda $1b			; a5 1b
B10_1b9a:		cmp #$10		; c9 10
B10_1b9c:		bne B10_1bcd ; d0 2f

B10_1b9e:		lda #$00		; a9 00
B10_1ba0:		sta $1b			; 85 1b
B10_1ba2:		inc $1c			; e6 1c
B10_1ba4:		lda $1c			; a5 1c
B10_1ba6:		cmp $1a			; c5 1a
B10_1ba8:		bne B10_1bcd ; d0 23

B10_1baa:		lda #$40		; a9 40
B10_1bac:		ora $1c			; 05 1c
B10_1bae:		bne B10_1bc7 ; d0 17

B10_1bb0:		lda $1b			; a5 1b
B10_1bb2:		sec				; 38 
B10_1bb3:		sbc #$02		; e9 02
B10_1bb5:		sta $1b			; 85 1b
B10_1bb7:		bcs B10_1bcd ; b0 14

B10_1bb9:		lda #$10		; a9 10
B10_1bbb:		sta $1b			; 85 1b
B10_1bbd:		dec $1c			; c6 1c
B10_1bbf:		lda $1c			; a5 1c
B10_1bc1:		cmp #$7f		; c9 7f
B10_1bc3:		bne B10_1bcd ; d0 08

B10_1bc5:		lda #$c0		; a9 c0
B10_1bc7:		sta $1c			; 85 1c
B10_1bc9:		lda #$20		; a9 20
B10_1bcb:		sta $1b			; 85 1b
B10_1bcd:		lda $015d		; ad 5d 01
B10_1bd0:		beq B10_1bd3 ; f0 01

B10_1bd2:		rts				; 60 


B10_1bd3:		jsr $9bfc		; 20 fc 9b
B10_1bd6:		inc $17			; e6 17
B10_1bd8:		lda #$21		; a9 21
B10_1bda:		jmp updateEntity_wOam		; 4c 67 f5


B10_1bdd:		dec $1b			; c6 1b
B10_1bdf:		bne B10_1bcd ; d0 ec

B10_1be1:		lda $1c			; a5 1c
B10_1be3:		bmi B10_1bf1 ; 30 0c

B10_1be5:		ldx #$10		; a2 10
B10_1be7:		dec $1c			; c6 1c
B10_1be9:		lda $1c			; a5 1c
B10_1beb:		and #$3f		; 29 3f
B10_1bed:		ora #$80		; 09 80
B10_1bef:		bne B10_1bf5 ; d0 04

B10_1bf1:		ldx #$00		; a2 00
B10_1bf3:		and #$3f		; 29 3f
B10_1bf5:		sta $1c			; 85 1c
B10_1bf7:		stx $1b			; 86 1b
B10_1bf9:		jmp $9bcd		; 4c cd 9b


B10_1bfc:		lda $17			; a5 17
B10_1bfe:		pha				; 48 
B10_1bff:		sec				; 38 
B10_1c00:		sbc $1d			; e5 1d
B10_1c02:		lsr a			; 4a
B10_1c03:		sta $01			; 85 01
B10_1c05:		clc				; 18 
B10_1c06:		adc $1d			; 65 1d
B10_1c08:		sta $17			; 85 17
B10_1c0a:		lda #$0c		; a9 0c
B10_1c0c:		sta $00			; 85 00
B10_1c0e:		lda $0507		; ad 07 05
B10_1c11:		sta $02			; 85 02
B10_1c13:		lda $0506		; ad 06 05
B10_1c16:		jsr func_170b		; 20 0b f7
B10_1c19:		bcs B10_1c31 ; b0 16

B10_1c1b:		bit $20			; 24 20
B10_1c1d:		bvs B10_1c31 ; 70 12

B10_1c1f:		lda $10			; a5 10
B10_1c21:		sta $0484		; 8d 84 04
B10_1c24:		lda $11			; a5 11
B10_1c26:		sta $0485		; 8d 85 04
B10_1c29:		lda $050b		; ad 0b 05
B10_1c2c:		ora #$10		; 09 10
B10_1c2e:		sta $050b		; 8d 0b 05
B10_1c31:		pla				; 68 
B10_1c32:		sta $17			; 85 17
B10_1c34:		rts				; 60 


func_a_1c35:
B10_1c35:		jsr func_a_01c2		; 20 c2 81
B10_1c38:		lda #$0c		; a9 0c
B10_1c3a:		sta $00			; 85 00
B10_1c3c:		lda #$1c		; a9 1c
B10_1c3e:		sta $01			; 85 01
B10_1c40:		jsr func_1a95		; 20 95 fa
B10_1c43:		bcc B10_1c46 ; 90 01

B10_1c45:		rts				; 60 


B10_1c46:		lda $0500		; ad 00 05
B10_1c49:		and #$0f		; 29 0f
B10_1c4b:		cmp #$08		; c9 08
B10_1c4d:		bcs B10_1c5c ; b0 0d

B10_1c4f:		lda wJoy1ButtonsPressed.w		; ad 50 01
B10_1c52:		and #$02		; 29 02
B10_1c54:		bne B10_1c6a ; d0 14

B10_1c56:		lda $0504		; ad 04 05
B10_1c59:		bmi B10_1c6a ; 30 0f

B10_1c5b:		rts				; 60 


B10_1c5c:		lda wJoy1ButtonsPressed.w		; ad 50 01
B10_1c5f:		and #$01		; 29 01
B10_1c61:		bne B10_1c6a ; d0 07

B10_1c63:		lda $0504		; ad 04 05
B10_1c66:		beq B10_1c77 ; f0 0f

B10_1c68:		bmi B10_1c77 ; 30 0d

B10_1c6a:		lda #$46		; a9 46
B10_1c6c:		jsr unsetGlobalFlag		; 20 fc e7
B10_1c6f:		lda wEntityWramOffset.w		; ad 5b 01
B10_1c72:		ora #$80		; 09 80
B10_1c74:		sta $051f		; 8d 1f 05
B10_1c77:		rts				; 60 


enUpdate_treasureChest:
B10_1c78:		jsr func_0709		; 20 09 e7
B10_1c7b:		lda $015d		; ad 5d 01
B10_1c7e:		bpl B10_1c89 ; 10 09

B10_1c80:		lda #$00		; a9 00
B10_1c82:		sta $19			; 85 19
B10_1c84:		lda #$89		; a9 89
B10_1c86:		jmp unsetGlobalFlag		; 4c fc e7

B10_1c89:		lda #$55		; a9 55
B10_1c8b:		jsr checkGlobalFlag		; 20 e9 e7
B10_1c8e:		beq B10_1c93 ; f0 03

B10_1c90:		jmp B10_1d51		; 4c 51 9d

B10_1c93:		lda #$20		; a9 20
B10_1c95:		bit $1a			; 24 1a
B10_1c97:		bmi B10_1d0e ; 30 75

B10_1c99:		bvc B10_1c9e ; 50 03

B10_1c9b:		jmp B10_1d35		; 4c 35 9d

B10_1c9e:		bne B10_1cfa ; d0 5a

B10_1ca0:		lda $051a		; ad 1a 05
B10_1ca3:		beq B10_1ca8 ; f0 03

B10_1ca5:		jmp B10_1d51		; 4c 51 9d

B10_1ca8:		lda #$0c		; a9 0c
B10_1caa:		sta $00			; 85 00
B10_1cac:		lda #$0c		; a9 0c
B10_1cae:		sta $01			; 85 01
B10_1cb0:		jsr func_1a95		; 20 95 fa
B10_1cb3:		bcc B10_1cb8 ; 90 03

B10_1cb5:		jmp B10_1d51		; 4c 51 9d

B10_1cb8:		lda #$3a		; a9 3a
B10_1cba:		jsr func_08fa		; 20 fa e8
B10_1cbd:		lda #$0f		; a9 0f
B10_1cbf:		sta $0511		; 8d 11 05
B10_1cc2:		lda #$78		; a9 78
B10_1cc4:		sta $0512		; 8d 12 05
B10_1cc7:		lda #$5f		; a9 5f
B10_1cc9:		jsr setGlobalFlag		; 20 f0 e7
B10_1ccc:		lda $0500		; ad 00 05
B10_1ccf:		sta $10			; 85 10
B10_1cd1:		lda $0501		; ad 01 05
B10_1cd4:		sta $11			; 85 11
B10_1cd6:		lda #$80		; a9 80
B10_1cd8:		sta $1a			; 85 1a

// gives password crystal
B10_1cda:		lda wCachedEntityStruct.byteD			; a5 1d
B10_1cdc:		jsr setGlobalFlag		; 20 f0 e7

B10_1cdf:		lda #$89		; a9 89
B10_1ce1:		jsr unsetGlobalFlag		; 20 fc e7

B10_1ce4:		lda $1f			; a5 1f
B10_1ce6:		cmp #$12		; c9 12
B10_1ce8:		bcc B10_1d41 ; 90 57

B10_1cea:		cmp #$14		; c9 14
B10_1cec:		beq B10_1d41 ; f0 53

B10_1cee:		sec				; 38 
B10_1cef:		sbc #$12		; e9 12
B10_1cf1:		clc				; 18 
B10_1cf2:		adc #$e0		; 69 e0
B10_1cf4:		jsr setGlobalFlag		; 20 f0 e7
B10_1cf7:		jmp func_a_1d41		; 4c 41 9d

B10_1cfa:		lda #$56		; a9 56
B10_1cfc:		jsr checkGlobalFlag		; 20 e9 e7
B10_1cff:		beq B10_1d02 ; f0 01

B10_1d01:		rts				; 60 

B10_1d02:		lda #$00		; a9 00
B10_1d04:		sta $19			; 85 19
B10_1d06:		ldy $1f			; a4 1f
B10_1d08:		lda treasureChest_textIdxes.w, y	; b9 bb 9d
B10_1d0b:		jmp displayTextIdxedA		; 4c 72 87

B10_1d0e:		ldx #$06		; a2 06
B10_1d10:		lda #$c0		; a9 c0
B10_1d12:		jsr func_13ef		; 20 ef f3
B10_1d15:		dec $1b			; c6 1b
B10_1d17:		bne B10_1d29 ; d0 10

B10_1d19:		lda $1f			; a5 1f
B10_1d1b:		cmp #$04		; c9 04
B10_1d1d:		bcs B10_1d22 ; b0 03

B10_1d1f:		jsr stub_a_1d75		; 20 75 9d
B10_1d22:		lda #$20		; a9 20
B10_1d24:		sta $1a			; 85 1a
B10_1d26:		jmp $8789		; 4c 89 87

B10_1d29:		lda $1b			; a5 1b
B10_1d2b:		cmp #$48		; c9 48
B10_1d2d:		bne B10_1d41 ; d0 12

B10_1d2f:		lda #$40		; a9 40
B10_1d31:		sta $1a			; 85 1a
B10_1d33:		bne B10_1d41 ; d0 0c

B10_1d35:		dec $1b			; c6 1b
B10_1d37:		lda $1b			; a5 1b
B10_1d39:		cmp #$10		; c9 10
B10_1d3b:		bne B10_1d41 ; d0 04

B10_1d3d:		lda #$80		; a9 80
B10_1d3f:		sta $1a			; 85 1a

func_a_1d41:
B10_1d41:		lda $1f			; a5 1f
B10_1d43:		asl a			; 0a
B10_1d44:		tay				; a8 
B10_1d45:		lda data_a_1d76.w+1, y	; b9 77 9d
B10_1d48:		jsr func_a_1d5b		; 20 5b 9d
B10_1d4b:		lda data_a_1d76.w, y	; b9 76 9d
B10_1d4e:		jmp updateEntity_wOam		; 4c 67 f5

B10_1d51:		lda #$01		; a9 01
B10_1d53:		jsr func_a_1d5b		; 20 5b 9d
B10_1d56:		lda #$30		; a9 30
B10_1d58:		jmp updateEntity_wOam		; 4c 67 f5


func_a_1d5b:
B10_1d5b:		sta $00			; 85 00
B10_1d5d:		asl a			; 0a
B10_1d5e:		clc				; 18 
B10_1d5f:		adc $00			; 65 00
B10_1d61:		tax				; aa 
B10_1d62:		lda data_a_1da6.w, x	; bd a6 9d
B10_1d65:		sta $0195		; 8d 95 01
B10_1d68:		lda data_a_1da6.w+1, x	; bd a7 9d
B10_1d6b:		sta $0196		; 8d 96 01
B10_1d6e:		lda data_a_1da6.w+2, x	; bd a8 9d
B10_1d71:		sta $0197		; 8d 97 01
B10_1d74:		rts				; 60 

stub_a_1d75:
B10_1d75:		rts				; 60 


// treasure chest entity oam spec idx and ...?
data_a_1d76:
	.db $2c $02
	.db $2c $02
	.db $2c $02
	.db $2c $02
	.db $33 $06
	.db $33 $05
	.db $33 $04
	.db $2d $00
	.db $2e $00
	.db $2d $02
	.db $2d $03
	.db $2c $00
	.db $2d $00
	.db $2c $03
	.db $2f $02
	.db $32 $06
	.db $32 $05
	.db $32 $04
	.db $2f $06
	.db $2f $04
	.db $31 $06
	.db $2f $06
	.db $2f $06
	.db $2f $06

// 3 palette colours
data_a_1da6:
	.db $20 $21 $0f
	.db $37 $26 $0f
	.db $20 $25 $0f
	.db $20 $29 $0f
	.db $20 $25 $0f
	.db $20 $29 $0f
	.db $20 $21 $0f


treasureChest_textIdxes:
	.db $16
	.db $16
	.db $16
	.db $16
	.db $20
	.db $21
	.db $22
	.db $18
	.db $1e
	.db $1d
	.db $1f
	.db $17
	.db $13
	.db $14
	.db $15
	.db $19
	.db $19
	.db $19
	.db $1a
	.db $1b
	.db $1c
	.db $1a
	.db $1a
	.db $1a
	
	
B10_1dd3:		jsr $9e50		; 20 50 9e
B10_1dd6:		ldx $10			; a6 10
B10_1dd8:		ldy $11			; a4 11
B10_1dda:		lda #$fe		; a9 fe
B10_1ddc:		jsr $9e1e		; 20 1e 9e
B10_1ddf:		stx $10			; 86 10
B10_1de1:		sty $11			; 84 11
B10_1de3:		ldx $12			; a6 12
B10_1de5:		ldy $13			; a4 13
B10_1de7:		lda #$02		; a9 02
B10_1de9:		jsr $9e1e		; 20 1e 9e
B10_1dec:		stx $12			; 86 12
B10_1dee:		sty $13			; 84 13
B10_1df0:		ldx $15			; a6 15
B10_1df2:		lda $1e			; a5 1e
B10_1df4:		sta $15			; 85 15
B10_1df6:		stx $1e			; 86 1e
B10_1df8:		jsr $9e50		; 20 50 9e
B10_1dfb:		ldx $1a			; a6 1a
B10_1dfd:		ldy $1b			; a4 1b
B10_1dff:		lda #$ff		; a9 ff
B10_1e01:		jsr $9e1e		; 20 1e 9e
B10_1e04:		stx $1a			; 86 1a
B10_1e06:		sty $1b			; 84 1b
B10_1e08:		ldx $1c			; a6 1c
B10_1e0a:		ldy $1d			; a4 1d
B10_1e0c:		lda #$01		; a9 01
B10_1e0e:		jsr $9e1e		; 20 1e 9e
B10_1e11:		stx $1c			; 86 1c
B10_1e13:		sty $1d			; 84 1d
B10_1e15:		ldx $15			; a6 15
B10_1e17:		lda $1e			; a5 1e
B10_1e19:		sta $15			; 85 15
B10_1e1b:		stx $1e			; 86 1e
B10_1e1d:		rts				; 60 


B10_1e1e:		stx $16			; 86 16
B10_1e20:		sty $17			; 84 17
B10_1e22:		sta $14			; 85 14
B10_1e24:		lda $015a		; ad 5a 01
B10_1e27:		and #$07		; 29 07
B10_1e29:		bne B10_1e2e ; d0 03

B10_1e2b:		jsr func_154e		; 20 4e f5
B10_1e2e:		jsr func_1535		; 20 35 f5
B10_1e31:		lda $015d		; ad 5d 01
B10_1e34:		beq B10_1e3b ; f0 05

B10_1e36:		lda #$00		; a9 00
B10_1e38:		sta $19			; 85 19
B10_1e3a:		rts				; 60 


B10_1e3b:		lda $015a		; ad 5a 01
B10_1e3e:		and #$08		; 29 08
B10_1e40:		bne B10_1e46 ; d0 04

B10_1e42:		lda #$1b		; a9 1b
B10_1e44:		bne B10_1e48 ; d0 02

B10_1e46:		lda #$1c		; a9 1c
B10_1e48:		jsr updateEntity_wOam		; 20 67 f5
B10_1e4b:		ldx $16			; a6 16
B10_1e4d:		ldy $17			; a4 17
B10_1e4f:		rts				; 60 


B10_1e50:		lda $015a		; ad 5a 01
B10_1e53:		and #$03		; 29 03
B10_1e55:		bne B10_1e5f ; d0 08

B10_1e57:		lda $15			; a5 15
B10_1e59:		cmp #$04		; c9 04
B10_1e5b:		beq B10_1e5f ; f0 02

B10_1e5d:		inc $15			; e6 15
B10_1e5f:		rts				; 60 


B10_1e60:		bit wJoy1ButtonsPressed.w		; 2c 50 01
B10_1e63:		bvc B10_1ea3 ; 50 3e

B10_1e65:		lda $0509		; ad 09 05
B10_1e68:		and #$10		; 29 10
B10_1e6a:		bne B10_1ea3 ; d0 37

B10_1e6c:		inc $1b			; e6 1b
B10_1e6e:		lda $1b			; a5 1b
B10_1e70:		cmp $1a			; c5 1a
B10_1e72:		bne B10_1eb5 ; d0 41

B10_1e74:		lda #$49		; a9 49
B10_1e76:		jsr unsetGlobalFlag		; 20 fc e7
B10_1e79:		lda #$43		; a9 43
B10_1e7b:		jsr unsetGlobalFlag		; 20 fc e7
B10_1e7e:		lda #$4a		; a9 4a
B10_1e80:		jsr checkGlobalFlag		; 20 e9 e7
B10_1e83:		beq B10_1e8a ; f0 05

B10_1e85:		lda #$00		; a9 00
B10_1e87:		sta $19			; 85 19
B10_1e89:		rts				; 60 


B10_1e8a:		lda wEntityWramOffset.w		; ad 5b 01
B10_1e8d:		cmp #$e0		; c9 e0
B10_1e8f:		bne B10_1e85 ; d0 f4

B10_1e91:		lda #$81		; a9 81
B10_1e93:		sta $19			; 85 19
B10_1e95:		lda #$30		; a9 30
B10_1e97:		sta $18			; 85 18
B10_1e99:		lda #$44		; a9 44
B10_1e9b:		jsr func_08fa		; 20 fa e8
B10_1e9e:		lda #$4a		; a9 4a
B10_1ea0:		jmp setGlobalFlag		; 4c f0 e7


B10_1ea3:		lda #$34		; a9 34
B10_1ea5:		jsr func_08fa		; 20 fa e8
B10_1ea8:		lda #$00		; a9 00
B10_1eaa:		sta $0516		; 8d 16 05
B10_1ead:		jsr $8838		; 20 38 88
B10_1eb0:		lda #$49		; a9 49
B10_1eb2:		jmp unsetGlobalFlag		; 4c fc e7


B10_1eb5:		jsr func_0709		; 20 09 e7
B10_1eb8:		lda #$00		; a9 00
B10_1eba:		jsr func_13ef		; 20 ef f3
B10_1ebd:		lda $0509		; ad 09 05
B10_1ec0:		and #$02		; 29 02
B10_1ec2:		beq B10_1eca ; f0 06

B10_1ec4:		lda $19			; a5 19
B10_1ec6:		ora #$02		; 09 02
B10_1ec8:		bne B10_1ece ; d0 04

B10_1eca:		lda $19			; a5 19
B10_1ecc:		and #$fd		; 29 fd
B10_1ece:		sta $19			; 85 19
B10_1ed0:		lda wEntityWramOffset.w		; ad 5b 01
B10_1ed3:		lsr a			; 4a
B10_1ed4:		lsr a			; 4a
B10_1ed5:		lsr a			; 4a
B10_1ed6:		lsr a			; 4a
B10_1ed7:		eor $015a		; 4d 5a 01
B10_1eda:		and #$01		; 29 01
B10_1edc:		bne B10_1eeb ; d0 0d

B10_1ede:		lda $015a		; ad 5a 01
B10_1ee1:		lsr a			; 4a
B10_1ee2:		and #$03		; 29 03
B10_1ee4:		tay				; a8 
B10_1ee5:		lda $9f0d, y	; b9 0d 9f
B10_1ee8:		jsr updateEntity_wOam		; 20 67 f5
B10_1eeb:		lda $1c			; a5 1c
B10_1eed:		jsr $8316		; 20 16 83
B10_1ef0:		ldy #$01		; a0 01
B10_1ef2:		lda ($00), y	; b1 00
B10_1ef4:		asl a			; 0a
B10_1ef5:		asl a			; 0a
B10_1ef6:		sta $14			; 85 14
B10_1ef8:		ldy #$03		; a0 03
B10_1efa:		lda ($00), y	; b1 00
B10_1efc:		asl a			; 0a
B10_1efd:		asl a			; 0a
B10_1efe:		sta $15			; 85 15
B10_1f00:		inc $1c			; e6 1c
B10_1f02:		lda $1c			; a5 1c
B10_1f04:		cmp #$b4		; c9 b4
B10_1f06:		bne B10_1f0c ; d0 04

B10_1f08:		lda #$00		; a9 00
B10_1f0a:		sta $1c			; 85 1c
B10_1f0c:		rts				; 60 


B10_1f0d:		jmp ($8d8c)		; 6c 8c 8d


B10_1f10:		stx $1bc6		; 8e c6 1b
B10_1f13:		bne B10_1f32 ; d0 1d

B10_1f15:		lda $1e			; a5 1e
B10_1f17:		jsr unsetGlobalFlag		; 20 fc e7
B10_1f1a:		lda #$00		; a9 00
B10_1f1c:		sta $19			; 85 19
B10_1f1e:		jsr func_0684		; 20 84 e6
B10_1f21:		lda $015e		; ad 5e 01
B10_1f24:		and #$03		; 29 03
B10_1f26:		bne B10_1f2d ; d0 05

B10_1f28:		lda #$5d		; a9 5d
B10_1f2a:		jmp initEntityA		; 4c 33 80


B10_1f2d:		lda #$26		; a9 26
B10_1f2f:		jmp initEntityA		; 4c 33 80


B10_1f32:		jsr $81d6		; 20 d6 81
B10_1f35:		lda $1a			; a5 1a
B10_1f37:		jmp updateEntity_wOam		; 4c 67 f5


B10_1f3a:		jsr func_a_01c2		; 20 c2 81
B10_1f3d:		lda $1a			; a5 1a
B10_1f3f:		lsr a			; 4a
B10_1f40:		bcc B10_1f45 ; 90 03

B10_1f42:		jmp $a03d		; 4c 3d a0


B10_1f45:		lsr a			; 4a
B10_1f46:		bcc B10_1f4b ; 90 03

B10_1f48:		jmp $a058		; 4c 58 a0


B10_1f4b:		lda #$4e		; a9 4e
B10_1f4d:		jsr updateEntity_wOam		; 20 67 f5
B10_1f50:		lda #$56		; a9 56
B10_1f52:		jsr checkGlobalFlag		; 20 e9 e7
B10_1f55:		bne B10_1f64 ; d0 0d

B10_1f57:		lda #$20		; a9 20
B10_1f59:		bit $1a			; 24 1a
B10_1f5b:		bmi B10_1f65 ; 30 08

B10_1f5d:		bvs B10_1f87 ; 70 28

B10_1f5f:		beq B10_1f64 ; f0 03

B10_1f61:		jmp $a02b		; 4c 2b a0


B10_1f64:		rts				; 60 


B10_1f65:		lda $18			; a5 18
B10_1f67:		cmp #$58		; c9 58
B10_1f69:		beq B10_1f7e ; f0 13

B10_1f6b:		lda $0502		; ad 02 05
B10_1f6e:		cmp #$0b		; c9 0b
B10_1f70:		bne B10_1f64 ; d0 f2

B10_1f72:		lda $0503		; ad 03 05
B10_1f75:		bne B10_1f64 ; d0 ed

B10_1f77:		lda #$40		; a9 40
B10_1f79:		sta $1a			; 85 1a
B10_1f7b:		jmp $8789		; 4c 89 87


B10_1f7e:		lda $0502		; ad 02 05
B10_1f81:		cmp #$1a		; c9 1a
B10_1f83:		bne B10_1f64 ; d0 df

B10_1f85:		beq B10_1f72 ; f0 eb

B10_1f87:		lda $18			; a5 18
B10_1f89:		cmp #$58		; c9 58
B10_1f8b:		beq B10_1ff1 ; f0 64

B10_1f8d:		lda $050b		; ad 0b 05
B10_1f90:		and #$01		; 29 01
B10_1f92:		beq B10_1f9e ; f0 0a

B10_1f94:		ldx $0517		; ae 17 05
B10_1f97:		lda $0308, x	; bd 08 03
B10_1f9a:		cmp #$28		; c9 28
B10_1f9c:		beq B10_1fae ; f0 10

B10_1f9e:		lda #$0c		; a9 0c
B10_1fa0:		jsr checkGlobalFlag		; 20 e9 e7
B10_1fa3:		bne B10_1fd1 ; d0 2c

B10_1fa5:		lda #$00		; a9 00
B10_1fa7:		sta $1a			; 85 1a
B10_1fa9:		lda #$06		; a9 06
B10_1fab:		jmp displayTextIdxedA		; 4c 72 87


B10_1fae:		lda $050b		; ad 0b 05
B10_1fb1:		and #$fe		; 29 fe
B10_1fb3:		sta $050b		; 8d 0b 05
B10_1fb6:		ldx $0517		; ae 17 05
B10_1fb9:		lda #$24		; a9 24
B10_1fbb:		jsr func_08fa		; 20 fa e8
B10_1fbe:		lda #$02		; a9 02
B10_1fc0:		sta $0308, x	; 9d 08 03
B10_1fc3:		lda #$80		; a9 80
B10_1fc5:		ora $0309, x	; 1d 09 03
B10_1fc8:		sta $0309, x	; 9d 09 03
B10_1fcb:		lda $030e, x	; bd 0e 03
B10_1fce:		jsr unsetGlobalFlag		; 20 fc e7
B10_1fd1:		lda #$20		; a9 20
B10_1fd3:		sta $1a			; 85 1a
B10_1fd5:		lda #$f0		; a9 f0
B10_1fd7:		sta $15			; 85 15
B10_1fd9:		lda #$38		; a9 38
B10_1fdb:		sta $1b			; 85 1b
B10_1fdd:		lda #$07		; a9 07
B10_1fdf:		jsr displayTextIdxedA		; 20 72 87
B10_1fe2:		lda #$0c		; a9 0c
B10_1fe4:		jsr setGlobalFlag		; 20 f0 e7
B10_1fe7:		lda #$31		; a9 31
B10_1fe9:		jsr func_08fa		; 20 fa e8
B10_1fec:		lda #$ff		; a9 ff
B10_1fee:		sta $97			; 85 97
B10_1ff0:		rts				; 60 


B10_1ff1:		lda #$0c		; a9 0c
B10_1ff3:		jsr checkGlobalFlag		; 20 e9 e7
B10_1ff6:		;removed
	.db $d0 $18

B10_1ff8:		lda #$00		; a9 00
B10_1ffa:		sta $1a			; 85 1a
B10_1ffc:		ldx #$07		; a2 07
		.db $a9
