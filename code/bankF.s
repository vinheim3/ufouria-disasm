
resetVector:
	sei
// reset ppu ctrl, mask, set stack
	ldx #$00
	stx PPUCTRL
	stx PPUMASK
	dex
	txs

// wait 4 vblanks
	ldx #$02
@next2vblanks:
-	bit PPUSTATUS
	bpl -
-	bit PPUSTATUS
	bmi -
	dex
	bne @next2vblanks

	jsr initRamNametablesSoundJoyAndBanks
B15_001d:		jsr func_052e		; 20 2e e5
B15_0020:		lda #$01		; a9 01
B15_0022:		jsr func_0578		; 20 78 e5
B15_0025:		jsr func_e_1fda		; hides all ppu mask
B15_0028:		jmp begin		; 4c 33 e0


B15_002b:		lda #$0c		; a9 0c
B15_002d:		jsr swapLower2romBanksIdxedA		; 20 0c fd
B15_0030:		jsr func_d_1261		; 20 61 b2

begin:
	lda #$0c
	jsr swapLower2romBanksIdxedA

B15_0038:		jsr func_d_035b		; 20 5b a3
	jsr setNametableMirroringToVertical
B15_003e:		jsr func_1257		; 20 57 f2
B15_0041:		jsr func_1297		; 20 97 f2
@titleScreenMainLoop:
B15_0044:		jsr func_12fe		; 20 fe f2
B15_0047:		jsr func_e_1fc1		; 20 c1 df
B15_004a:		jsr func_e_1fcf		; 20 cf df
B15_004d:		lda #$02		; a9 02
B15_004f:		sta wScanlineIRQSetup			; 85 28
B15_0051:		lda #$02		; a9 02
B15_0053:		jsr func_05cb		; 20 cb e5
B15_0056:		jsr func_0060		; 20 60 e0
B15_0059:		lda #$00		; a9 00
	sta wScanlineIRQSetup
B15_005d:		jmp $e044		; @titleScreenMainLoop?


// game main loop?
func_0060:
B15_0060:		lda #$02		; a9 02
B15_0062:		sta wScanlineIRQSetup			; 85 28

B15_0064:		jsr func_036b		; 20 6b e3
B15_0067:		lda #$56		; a9 56
B15_0069:		jsr checkGlobalFlag		; 20 e9 e7
B15_006c:		beq B15_0076 ; f0 08

B15_006e:		lda #$0a		; a9 0a
B15_0070:		jsr swapLower2romBanksIdxedA		; 20 0c fd
B15_0073:		jsr func_a_0059		; 20 59 80
B15_0076:		lda $f8			; a5 f8
B15_0078:		bne B15_00b3 ; d0 39

B15_007a:		lda #$0c		; a9 0c
B15_007c:		jsr swapLower2romBanksIdxedA		; 20 0c fd
B15_007f:		jsr func_d_04b9		; 20 b9 a4
B15_0082:		bcs B15_0087 ; b0 03

B15_0084:		jmp func_0060		; 4c 60 e0

B15_0087:		lda $051f		; ad 1f 05
B15_008a:		bpl B15_008f ; 10 03

B15_008c:		jsr func_e_1f29		; 20 29 df
B15_008f:		jsr func_1386		; 20 86 f3
B15_0092:		jsr func_e_1793		; 20 93 d7

// player state/oam/etc???
B15_0095:		lda #:func_c_0000		; a9 0c
B15_0097:		jsr swapLower2romBanksIdxedA		; 20 0c fd
B15_009a:		jsr func_c_0000		; 20 00 80

B15_009d:		lda #:func_a_0000		; a9 0a
B15_009f:		jsr swapLower2romBanksIdxedA		; 20 0c fd
B15_00a2:		jsr func_a_0000		; 20 00 80

B15_00a5:		lda #:func_4_0880		; a9 04
B15_00a7:		jsr swapLower2romBanksIdxedA		; 20 0c fd
B15_00aa:		jsr func_4_0880		; 20 80 88

B15_00ad:		jsr func_e_1f09		; 20 09 df
	jmp +

B15_00b3:		jsr func_e_1793		; 20 93 d7

+	jsr func_02e3		; 20 e3 e2
B15_00b9:		jsr func_052e		; 20 2e e5
B15_00bc:		jmp func_0060		; 4c 60 e0


nmiVector:
	sei

// preserve vars
	pha
	stx wNMIVectorTempX
	sty wNMIVectorTempY
	lda wBankSelect
	pha

	jsr setScanlineIRQSetup
B15_00cb:		lda wShouldWaitForMajorNMIInterruptFuncs			; a5 f9
B15_00cd:		cmp #$55		; c9 55
B15_00cf:		bne B15_010a ; d0 39

// oam dma transfer
	lda #$00
	sta OAMADDR
	lda #>wOam
	sta OAMDMA

	jsr copyDataToDisplayFromVramQueue
	jsr loadInternalPalettesFromWramPalettes1

	lda wPPUCtrl
	sta PPUCTRL
	lda wPPUMask
	sta PPUMASK

// reset latch
	lda PPUSTATUS

// set scroll
	lda wPPUScrollX
	ldx wPPUScrollY
	sta PPUSCROLL
	stx PPUSCROLL

	cli
	jsr setChrBankDataFromWram
B15_00fc:		jsr func_043e		; polls input, etc
B15_00ff:		dec $015a		; ce 5a 01
B15_0102:		lda #$00		; a9 00
B15_0104:		sta $0174		; 8d 74 01
	jmp +
// jumped from above
B15_010a:		cli				; 58
+
// lower 2 banks are 8 and 9
	ldx #$08
	lda #BS_8000
	sta wBankSelect
	sta BANK_SELECT
	stx BANK_DATA

.ifdef ROM_JP
	inx
	lda #BS_a000
	sta wBankSelect
	sta BANK_SELECT
.else
	lda #BS_a000
	sta wBankSelect
	sta BANK_SELECT
	inx
.endif

	stx BANK_DATA

B15_0122:		lda $97			; a5 97
	beq +

B15_0126:		dec $97			; c6 97
+
.ifndef ROM_JP
B15_0128:		inc $f7			; e6 f7
B15_012a:		lda $f7			; a5 f7
B15_012c:		cmp #$05		; c9 05
B15_012e:		bcc B15_0137 ; 90 07

B15_0130:		lda #$00		; a9 00
B15_0132:		sta $f7			; 85 f7
B15_0134:		jsr func_8_0000		; 20 00 80
.endif

B15_0137:		jsr func_8_0000		; 20 00 80

// restore low 2 banks
	ldx wBank_8000
	lda #BS_8000
	sta wBankSelect
	sta BANK_SELECT
	stx BANK_DATA

	ldx wBank_a000
	lda #BS_a000
	sta wBankSelect
	sta BANK_SELECT
	stx BANK_DATA

	lda #$00
	sta wShouldWaitForMajorNMIInterruptFuncs

// restore vars
	pla
	sta wBankSelect
	sta BANK_SELECT
	ldy wNMIVectorTempY
	ldx wNMIVectorTempX
	pla
	rti


irqVector:
	sei
	pha
	txa
	pha
	tya
	pha
.ifdef ROM_JP
	ldx #$00
	lda #$0d
	sta $8000
	stx $a000
.else
	sta IRQ_DISABLE
	sta IRQ_ENABLE
.endif
	jmp (wIRQVectorFunc)

setIRQVectorFunc:
	and #$07
	asl a
	tay
	lda irqVectorFuncs.w, y
	sta wIRQVectorFunc
	lda irqVectorFuncs.w+1, y
	sta wIRQVectorFunc+1
	rts

irqVectorFuncs:
	.dw irqVectorFunc0 // disable irq, set bank select
	.dw irqVectorFunc1
	.dw irqVectorFunc2
	.dw irqVectorFunc3
	.dw irqVectorFunc4
	.dw irqVectorFunc5
	.dw irqVectorFunc6
	.dw irqVectorFunc7

irqVectorFunc0:
.ifndef ROM_JP
	sta IRQ_DISABLE
.endif
	lda #$00
	jsr setIRQVectorFunc
	lda wBankSelect
	sta BANK_SELECT
	pla
	tay
	pla
	tax
	pla
	cli
	rti

irqVectorFunc1:
B15_01a4:		bit $04eb		; 2c eb 04
B15_01a7:		bvs B15_01b0 ; 70 07

// if bit 6 not set of 4eb, disable and set to 0
// todo: when locked in battle?
.ifndef ROM_JP
B15_01a9:		sta IRQ_DISABLE		; 8d 00 e0
.endif
B15_01ac:		lda #$00		; a9 00
B15_01ae:		beq B15_01b7 ; f0 07

// else, do func 3 at $90
.ifdef ROM_JP
B15_01b0:	lda #$40
	sta $26
	lda #$00
	sta $25
	ldx $25
	lda #$0e
	sta $8000
	stx $a000
	ldx $26
	lda #$0f
	sta $8000
	stx $a000
	ldx #$81
	lda #$0d
	sta $8000
	stx $a000
.else
B15_01b0:		lda #$90		; a9 90
B15_01b2:		sta IRQ_LATCH		; 8d 00 c0
.endif

B15_01b5:		lda #$03		; a9 03
B15_01b7:		jsr setIRQVectorFunc		; 20 71 e1
B15_01ba:		lda $0174		; ad 74 01
B15_01bd:		bne B15_01d2 ; d0 13

// $0174 is 0
B15_01bf:		lda #$ff		; a9 ff
B15_01c1:		sta $0174		; 8d 74 01
B15_01c4:		lda wShadow1KBChrBank0.w		; ad 6b 01
B15_01c7:		sta $0173		; 8d 73 01
B15_01ca:		ldx $0171		; ae 71 01
B15_01cd:		stx w1KBChrBank0			; 86 44
B15_01cf:		jmp B15_01d5		; 4c d5 e1

B15_01d2:		ldx $0173		; ae 73 01

B15_01d5:		lda #BS_1KB_CHR_0		; a9 02
B15_01d7:		sta BANK_SELECT		; 8d 00 80
B15_01da:		stx BANK_DATA		; 8e 01 80
B15_01dd:		jmp irqSetBankSelectEnd		; 4c 02 e2

irqVectorFunc2:
.ifdef ROM_JP
	lda #$10
	sta $26
	lda #$00
	sta $25
	ldx $25
	lda #$0e
	sta $8000
	stx $a000
	ldx $26
	lda #$0f
	sta $8000
	stx $a000
	ldx #$81
	lda #$0d
	sta $8000
	stx $a000
.else
B15_01e0:		lda #$20		; a9 20
B15_01e2:		sta IRQ_LATCH		; 8d 00 c0
.endif

B15_01e5:		lda #$01		; a9 01
B15_01e7:		jsr setIRQVectorFunc		; 20 71 e1
B15_01ea:		lda w1KBChrBank0			; a5 44
B15_01ec:		sta $0171		; 8d 71 01
B15_01ef:		lda $04e8		; ad e8 04
B15_01f2:		and #$04		; 29 04
B15_01f4:		bne irqSetBankSelectEnd ; d0 0c

B15_01f6:		ldx #$7f		; a2 7f
B15_01f8:		stx w1KBChrBank0			; 86 44
.ifdef ROM_JP
	lda #$04
.else
B15_01fa:		lda #$02		; a9 02
.endif
B15_01fc:		sta BANK_SELECT		; 8d 00 80
B15_01ff:		stx BANK_DATA		; 8e 01 80

irqSetBankSelectEnd:
	lda wBankSelect
	sta BANK_SELECT
	pla
	tay
	pla
	tax
	pla
	cli
	rti

irqVectorFunc3:
.ifndef ROM_JP
B15_020e:		sta IRQ_DISABLE		; 8d 00 e0
.endif
B15_0211:		ldx #$40		; a2 40
B15_0213:		dex				; ca 
B15_0214:		bpl B15_0213 ; 10 fd

B15_0216:		ldx #$0b		; a2 0b
B15_0218:		lda #$00		; a9 00
B15_021a:		stx PPUADDR		; 8e 06 20
B15_021d:		sta PPUADDR		; 8d 06 20

B15_0220:		lda wPPUCtrl			; a5 ff
B15_0222:		sta PPUCTRL		; 8d 00 20

B15_0225:		lda PPUSTATUS		; ad 02 20

B15_0228:		lda wPPUScrollX			; a5 fd
B15_022a:		ldx wPPUScrollY			; a6 fc
B15_022c:		sta PPUSCROLL		; 8d 05 20
B15_022f:		stx PPUSCROLL		; 8e 05 20

B15_0232:		jmp irqSetBankSelectEnd		; 4c 02 e2

irqVectorFunc4:
.ifndef ROM_JP
B15_0235:		sta IRQ_DISABLE		; 8d 00 e0
.endif
B15_0238:		ldx #$14		; a2 14
B15_023a:		stx w2KBChrBank0			; 86 42

B15_023c:		lda #$00		; a9 00
B15_023e:		sta BANK_SELECT		; 8d 00 80
B15_0241:		stx BANK_DATA		; 8e 01 80

.ifdef ROM_JP
	ldx #$15
	lda #$01
	sta $8000
	sta $a000
.endif

B15_0244:		ldx #$16		; a2 16
B15_0246:		stx w2KBChrBank1			; 86 43
B15_0248:		lda #$01		; a9 01
B15_024a:		sta BANK_SELECT		; 8d 00 80
B15_024d:		stx BANK_DATA		; 8e 01 80

.ifdef ROM_JP
	ldx #$17
	lda #$03
	sta $8000
	stx $a000
.endif

B15_0250:		jmp irqSetBankSelectEnd		; 4c 02 e2

// eg after waiting at title screen
irqVectorFunc5:
.ifdef ROM_JP
	lda #$26
	sta $26
	lda #$00
	sta $25
	ldx $25
	lda #$0e
	sta $8000
	stx $a000
	ldx $26
	lda #$0f
	sta $8000
	stx $a000
	ldx #$81
	lda #$0d
	sta $8000
	stx $a000
.else
B15_0253:		lda #$58		; a9 58
B15_0255:		sta IRQ_LATCH		; 8d 00 c0
.endif

B15_0258:		lda #$06		; a9 06
B15_025a:		jsr setIRQVectorFunc		; 20 71 e1
B15_025d:		lda $d1			; a5 d1
B15_025f:		sta PPUSCROLL		; 8d 05 20
B15_0262:		lda #$00		; a9 00
B15_0264:		sta PPUSCROLL		; 8d 05 20
B15_0267:		lda $d2			; a5 d2
B15_0269:		sta PPUCTRL		; 8d 00 20
B15_026c:		jmp irqSetBankSelectEnd		; 4c 02 e2

irqVectorFunc6:
.ifdef ROM_JP
	ldx #$06
	stx $26
	ldy #$00
	sty $25
	lda #$0e
	sta $8000
	sty $a000
	lda #$0f
	sta $8000
	stx $a000
	ldx #$81
	lda #$0d
	sta $8000
	stx $a000
.else
B15_026f:		lda #$0c		; a9 0c
B15_0271:		sta IRQ_LATCH		; 8d 00 c0
.endif

B15_0274:		lda #$07		; a9 07
B15_0276:		jsr setIRQVectorFunc		; 20 71 e1
// set adjusted scroll from wram
B15_0279:		lda wPPUScrollX			; a5 fd
B15_027b:		sta PPUSCROLL		; 8d 05 20
B15_027e:		lda wPPUScrollY			; a5 fc
B15_0280:		sta PPUSCROLL		; 8d 05 20
B15_0283:		jmp irqSetBankSelectEnd		; 4c 02 e2

irqVectorFunc7:
.ifndef ROM_JP
B15_0286:		sta IRQ_DISABLE		; 8d 00 e0
.endif
B15_0289:		lda $0178		; ad 78 01
B15_028c:		bne B15_029a ; d0 0c

B15_028e:		ldx #$7c		; a2 7c
B15_0290:		stx w2KBChrBank1			; 86 43

.ifdef ROM_JP
	lda #$02
	sta $8000
	stx $a000
	ldx #$7d
	lda #$03
	sta $8000
	stx $a000
.else
B15_0292:		lda #BS_2KB_CHR_1		; a9 01
B15_0294:		sta BANK_SELECT		; 8d 00 80
B15_0297:		stx BANK_DATA		; 8e 01 80
.endif

// reset scroll and ppu ctrl
B15_029a:		lda #$00		; a9 00
B15_029c:		sta PPUSCROLL		; 8d 05 20
B15_029f:		sta PPUSCROLL		; 8d 05 20
B15_02a2:		lda wPPUCtrl			; a5 ff
B15_02a4:		sta PPUCTRL		; 8d 00 20
// wram scroll x += 2
B15_02a7:		lda wPPUScrollX			; a5 fd
B15_02a9:		clc				; 18 
B15_02aa:		adc #$02		; 69 02
B15_02ac:		sta wPPUScrollX			; 85 fd
B15_02ae:		jmp irqSetBankSelectEnd		; 4c 02 e2


B15_02b1:		jsr pushLower2romBanks		; 20 43 fc
B15_02b4:		lda #$0c		; a9 0c
B15_02b6:		jsr swapLower2romBanksIdxedA		; 20 0c fd
B15_02b9:		jsr $b7f5		; 20 f5 b7

.ifdef ROM_JP
	lda #$00
	jsr $fda7
	jsr $aae3
	ldx #$00
	jsr func_05cb
	ldx #$00
	jsr func_05cb
	ldx #$00
	jsr func_05cb
	ldx #$00
	jsr func_05cb
	ldx #$80
	jsr func_05cb
	lda #$0c
.else
B15_02bc:		ldx #$00		; a2 00
B15_02be:		jsr func_0530		; 20 30 e5
B15_02c1:		lda #$10		; a9 10
B15_02c3:		jsr func_0578		; 20 78 e5
B15_02c6:		lda #$00		; a9 00
.endif

B15_02c8:		jsr swapLower2romBanksIdxedA		; 20 0c fd
B15_02cb:		jsr func_1_0ae3		; 20 e3 aa

B15_02ce:		jsr func_052e		; 20 2e e5
B15_02d1:		lda wJoy1ButtonsPressed.w		; ad 50 01
B15_02d4:		and #PADF_START		; 29 10
B15_02d6:		beq B15_02ce ; f0 f6

B15_02d8:		lda #$10		; a9 10
B15_02da:		jsr func_0578		; 20 78 e5
B15_02dd:		jsr pullAndSetLower2romBanks		; 20 5b fc
B15_02e0:		jmp resetVector		; 4c 00 e0


func_02e3:
B15_02e3:		lda $f8			; a5 f8
B15_02e5:		bne B15_0302 ; d0 1b

B15_02e7:		lda $015a		; ad 5a 01
B15_02ea:		and #$01		; 29 01
B15_02ec:		beq B15_02f1 ; f0 03

B15_02ee:		jsr func_0302		; 20 02 e3
B15_02f1:		lda #$f8		; a9 f8
B15_02f3:		ldy wNextUsableOamIdx.w		; ac 58 01
B15_02f6:		beq B15_0301 ; f0 09

B15_02f8:		sta $0200, y	; 99 00 02
B15_02fb:		iny				; c8 
B15_02fc:		iny				; c8 
B15_02fd:		iny				; c8 
B15_02fe:		iny				; c8 
B15_02ff:		bne B15_02f8 ; d0 f7

B15_0301:		rts				; 60 


func_0302:
B15_0302:		ldy $0159		; ac 59 01
B15_0305:		cpy wNextUsableOamIdx.w		; cc 58 01
B15_0308:		beq B15_036a ; @done

B15_030a:		ldy $0166		; ac 66 01
B15_030d:		lda wNextUsableOamIdx.w		; ad 58 01
B15_0310:		sec				; 38 
B15_0311:		sbc #$04		; e9 04
B15_0313:		tax				; aa 
B15_0314:		sta $00			; 85 00
B15_0316:		cpy $00			; c4 00
B15_0318:		bcs B15_036a ; b0 50

B15_031a:		lda $0200, x	; bd 00 02
B15_031d:		sta $00			; 85 00
B15_031f:		lda $0201, x	; bd 01 02
B15_0322:		sta $01			; 85 01
B15_0324:		lda $0202, x	; bd 02 02
B15_0327:		sta $02			; 85 02
B15_0329:		lda $0203, x	; bd 03 02
B15_032c:		sta $03			; 85 03

B15_032e:		lda $0200, y	; b9 00 02
B15_0331:		sta $0200, x	; 9d 00 02
B15_0334:		lda $0201, y	; b9 01 02
B15_0337:		sta $0201, x	; 9d 01 02
B15_033a:		lda $0202, y	; b9 02 02
B15_033d:		sta $0202, x	; 9d 02 02
B15_0340:		lda $0203, y	; b9 03 02
B15_0343:		sta $0203, x	; 9d 03 02
B15_0346:		lda $00			; a5 00
B15_0348:		sta $0200, y	; 99 00 02
B15_034b:		lda $01			; a5 01
B15_034d:		sta $0201, y	; 99 01 02
B15_0350:		lda $02			; a5 02
B15_0352:		sta $0202, y	; 99 02 02
B15_0355:		lda $03			; a5 03
B15_0357:		sta $0203, y	; 99 03 02
B15_035a:		txa				; 8a 
B15_035b:		sec				; 38 
B15_035c:		sbc #$04		; e9 04
B15_035e:		tax				; aa 
B15_035f:		tya				; 98 
B15_0360:		clc				; 18 
B15_0361:		adc #$04		; 69 04
B15_0363:		tay				; a8 
B15_0364:		sta $00			; 85 00
B15_0366:		cpx $00			; e4 00
B15_0368:		bcs B15_031a ; b0 b0

B15_036a:		rts				; 60 


func_036b:
B15_036b:		lda #$00		; a9 00
B15_036d:		sta wNextUsableOamIdx.w		; 8d 58 01
B15_0370:		sta $0159		; 8d 59 01
B15_0373:		lda #$48		; a9 48
B15_0375:		jsr checkGlobalFlag		; 20 e9 e7
B15_0378:		bne B15_038f ; d0 15

B15_037a:		lda #$53		; a9 53
B15_037c:		jsr checkGlobalFlag		; 20 e9 e7
B15_037f:		bne B15_038f ; d0 0e

B15_0381:		lda #$5d		; a9 5d
B15_0383:		jsr checkGlobalFlag		; 20 e9 e7
B15_0386:		bne B15_038f ; d0 07

B15_0388:		lda $04ec		; ad ec 04
B15_038b:		and #$0f		; 29 0f
B15_038d:		beq B15_0394 ; f0 05

B15_038f:		lda #$00		; a9 00
B15_0391:		sta $f8			; 85 f8
B15_0393:		rts				; 60 


B15_0394:		lda wJoy1NewButtonsPressed.w		; ad 54 01
B15_0397:		ora wJoy2NewButtonsPressed.w		; 0d 55 01
B15_039a:		and #$10		; 29 10
B15_039c:		beq B15_03aa ; f0 0c

B15_039e:		lda $f8			; a5 f8
B15_03a0:		beq B15_03ab ; f0 09

B15_03a2:		lda #$00		; a9 00
B15_03a4:		sta $f8			; 85 f8
B15_03a6:		lda #$80		; a9 80
B15_03a8:		sta $81			; 85 81
B15_03aa:		rts				; 60 


B15_03ab:		lda #$ff		; a9 ff
B15_03ad:		sta $f8			; 85 f8
B15_03af:		lda #$33		; a9 33
B15_03b1:		sta $80			; 85 80
B15_03b3:		lda #$81		; a9 81
B15_03b5:		sta $81			; 85 81
B15_03b7:		lda #$fc		; a9 fc
B15_03b9:		sta $0159		; 8d 59 01
B15_03bc:		ldy #$02		; a0 02
B15_03be:		ldx #$00		; a2 00
B15_03c0:		dex				; ca 
B15_03c1:		bne B15_03c0 ; d0 fd

B15_03c3:		dey				; 88 
B15_03c4:		bne B15_03c0 ; d0 fa

B15_03c6:		rts				; 60 


B15_03c7:		rts				; 60 


func_03c8:
B15_03c8:		rts				; 60 


loadFollowingDataIntoInternalPalettes2BG:
// get return address (-1)
	pla
	sta wInlinePaletteDataPtr
	pla
	sta wInlinePaletteDataPtr+1

// get 1st byte from return addr, store in 4th color for bg/spr
// (transparent/shared colour)
	ldy #$01
	ldx #$00
	lda (wInlinePaletteDataPtr), y
-	sta wInternalPalettes_2.w, x
	inx
	inx
	inx
	inx
	cpx #$20
	bne -

// indexes to start reading/storing next bytes
	ldy #$02
	ldx #$01

// 4 (number of outer loops - num palettes)
// 3 (number of inner loops - non-shared palettes)
	lda #$04
	sta wNumInlinePaletteGroups

@nextPaletteGroup:
	lda #$03
	sta wNumInlinePalettesPerGroup

// inner loop, get 2nd byte+ after return address, store in eg $01a1-3
-	lda (wInlinePaletteDataPtr), y
	sta wInternalPalettes_2.w, x
	iny
	inx
	dec wNumInlinePalettesPerGroup
	bne -

// outer loop, inx to skip past 1st byte per 4 bytes
	inx
	dec wNumInlinePaletteGroups
	bne @nextPaletteGroup

// jump past the data
	lda wInlinePaletteDataPtr
	clc
	adc #$0e
	sta wInlinePaletteDataPtr
	lda wInlinePaletteDataPtr+1
	adc #$00
	sta wInlinePaletteDataPtr+1

	jmp (wInlinePaletteDataPtr)


loadFollowingDataIntoInternalPalettes2Spr:
// $00/$01 is return address (-1)
	pla
	sta wInlinePaletteDataPtr
	pla
	sta wInlinePaletteDataPtr+1

// indexes to start reading/storing in palettes
// 1 - 1 byte after return address to start
// $11 - start from spr palette 0 colour 1
	ldy #$01
	ldx #$11

	lda #$04
	sta wNumInlinePaletteGroups
@nextPaletteGroup:
	lda #$03
	sta wNumInlinePalettesPerGroup
-	lda (wInlinePaletteDataPtr), y
	sta wInternalPalettes_2.w, x
	inx
	iny
	dec wNumInlinePalettesPerGroup
	bne -

	inx
	dec wNumInlinePaletteGroups
	bne @nextPaletteGroup

// jump past the palette data
	lda wInlinePaletteDataPtr
	clc
	adc #$0d
	sta wInlinePaletteDataPtr
	lda wInlinePaletteDataPtr+1
	adc #$00
	sta wInlinePaletteDataPtr+1
	jmp (wInlinePaletteDataPtr)


func_043e:
// keep note of previous buttons pressed
	lda wJoy1ButtonsPressed.w
	sta wJoy1OldButtonsPressed.w
	lda wJoy2ButtonsPressed.w
	sta wJoy2OldButtonsPressed.w

// reset buttons pressed
	lda #$00
	sta wJoy1ButtonsPressed.w
	sta wJoy2ButtonsPressed.w

// get input and store in buttonsPressed
	jsr pollInput
	jsr combineButtonsPressedBits

@readUntilStable:
	ldy wJoy1ButtonsPressed.w
	lda wJoy2ButtonsPressed.w

	pha
	jsr pollInput
	jsr combineButtonsPressedBits
	pla
	cmp wJoy2ButtonsPressed.w
	bne @readUntilStable

	cpy wJoy1ButtonsPressed.w
	bne @readUntilStable

// buttons stable - get new buttons pressed
	lda wJoy1ButtonsPressed.w
	eor wJoy1OldButtonsPressed.w
	and wJoy1ButtonsPressed.w
	sta wJoy1NewButtonsPressed.w

	lda wJoy2ButtonsPressed.w
	eor wJoy2OldButtonsPressed.w
	and wJoy2ButtonsPressed.w
	sta wJoy2NewButtonsPressed.w

B15_0488:		lda #$5a		; a9 5a
B15_048a:		jsr checkGlobalFlag		; 20 e9 e7
B15_048d:		bne B15_0490 ; d0 01

B15_048f:		rts				; 60 

B15_0490:		lda wJoy1ButtonsPressed.w		; ad 50 01
B15_0493:		and #$10		; 29 10
B15_0495:		ora $d2			; 05 d2
B15_0497:		sta wJoy1ButtonsPressed.w		; 8d 50 01

B15_049a:		eor wJoy1OldButtonsPressed.w		; 4d 51 01
B15_049d:		and wJoy1ButtonsPressed.w		; 2d 50 01
B15_04a0:		sta wJoy1NewButtonsPressed.w		; 8d 54 01

B15_04a3:		dec $d1			; c6 d1
B15_04a5:		bne B15_04c4 ; d0 1d

B15_04a7:		lda #$08		; a9 08
B15_04a9:		jsr swapLower2romBanksIdxedA		; 20 0c fd
B15_04ac:		ldy #$0c		; a0 0c
B15_04ae:		lda ($d4), y	; b1 d4
B15_04b0:		sta $d1			; 85 d1
B15_04b2:		iny				; c8 
B15_04b3:		lda ($d4), y	; b1 d4
B15_04b5:		sta $d2			; 85 d2
B15_04b7:		lda $d4			; a5 d4
B15_04b9:		clc				; 18 
B15_04ba:		adc #$02		; 69 02
B15_04bc:		sta $d4			; 85 d4
B15_04be:		lda $d5			; a5 d5
B15_04c0:		adc #$00		; 69 00
B15_04c2:		sta $d5			; 85 d5
B15_04c4:		rts				; 60 


pollInput:
// 1 then 0 to joy1
	ldx #$00
	inx
	stx JOY1
	dex
	stx JOY1

	ldx #$08
@nextButton:
	lda JOY1
	lsr a
	rol wJoy1ButtonsPressedBit0.w
	lsr a
	rol wJoy1ButtonsPressedBit1.w

	lda JOY2
	lsr a
	rol wJoy2ButtonsPressedBit0.w
	lsr a
	rol wJoy2ButtonsPressedBit1.w
	dex
	bne @nextButton

	rts

combineButtonsPressedBits:
	lda wJoy1ButtonsPressedBit1.w
	ora wJoy1ButtonsPressedBit0.w
	sta wJoy1ButtonsPressed.w

	lda wJoy2ButtonsPressedBit1.w
	ora wJoy2ButtonsPressedBit0.w
	sta wJoy2ButtonsPressed.w
	rts


loadInternalPalettesFromWramPalettes1:
	lda wShouldLoadInternalPalettes
	beq @done

// copy $20 bytes
	lda #>$3f00
	ldx #<$3f00
	sta PPUADDR
	stx PPUADDR
	ldx #$00
-	lda wInternalPalettes_1.w, x
	sta PPUDATA
	inx
	cpx #$20
	bne -

// dummy read
	lda #$3f
	sta PPUADDR
	lda #$00
	sta PPUADDR
	sta PPUADDR
	sta PPUADDR
	lda #$00
	sta wShouldLoadInternalPalettes

@done:
	rts


func_052e:
B15_052e:		ldx #$01		; a2 01
func_0530:
	lda #$55
	sta wShouldWaitForMajorNMIInterruptFuncs

// update internal palettes
	lda #$ff
	sta wShouldLoadInternalPalettes

// wait for nmi stuff to be done
-	lda wShouldWaitForMajorNMIInterruptFuncs
	bne -

B15_053c:		lda $9c			; a5 9c
B15_053e:		bpl B15_054c ; 10 0c

// 9c bit 7 set, return if start pressed
B15_0540:		lda wJoy1NewButtonsPressed.w		; ad 54 01
B15_0543:		and #PADF_START		; 29 10
B15_0545:		beq B15_054c ; f0 05

B15_0547:		lda #$ff		; a9 ff
B15_0549:		sta $9c			; 85 9c
B15_054b:		rts				; 60 

B15_054c:		dex				; ca 
B15_054d:		bne func_0530 ; d0 e1

B15_054f:		rts				; 60 


B15_0550:		lda wJoy1NewButtonsPressed.w		; ad 54 01
B15_0553:		ora wJoy2NewButtonsPressed.w		; 0d 55 01
B15_0556:		and #PADF_START		; 29 10
B15_0558:		bne B15_0569 ; d0 0f

B15_055a:		lda #$55		; a9 55
B15_055c:		sta wShouldWaitForMajorNMIInterruptFuncs			; 85 f9
B15_055e:		lda #$ff		; a9 ff
B15_0560:		sta wShouldLoadInternalPalettes			; 85 24
-	lda wShouldWaitForMajorNMIInterruptFuncs			; a5 f9
	bne -

B15_0566:		dex				; ca 
B15_0567:		bne B15_0550 ; d0 e7

B15_0569:		rts				; 60 


wOam_outOfYbounds:
	ldx #$00
	lda #$f0
-	sta wOam.w, x
	inx
	inx
	inx
	inx
	bne -

	rts


func_0578:
// fade out all palettes later
B15_0578:		ldx #$ff		; a2 ff
B15_057a:		stx wBitmapOfPalettesToFadeOut.w		; 8e 5f 01

B15_057d:		sta $9f			; 85 9f
B15_057f:		tax				; aa 
B15_0580:		jsr func_0530		; 20 30 e5

// num loops
B15_0583:		ldy #$04		; a0 04
@loop:
B15_0585:		tya				; 98 
B15_0586:		pha				; 48

B15_0587:		jsr fadeOutPalettesIn015f		; 20 95 e5
B15_058a:		ldx $9f			; a6 9f
B15_058c:		jsr func_0530		; 20 30 e5

B15_058f:		pla				; 68
B15_0590:		tay				; a8 
B15_0591:		dey				; 88 
B15_0592:		bne B15_0585 ; @loop

B15_0594:		rts				; 60 


fadeOutPalettesIn015f:
	ldx #$00

// check bits of 015f
	lda wBitmapOfPalettesToFadeOut.w
	sta wBitsToCheckForPaletteFading

// num outer loops
	lda #$08
	sta wPaletteFadePaletteIdx

@outerLoop:
// bit set, do inner loops
	lsr wBitsToCheckForPaletteFading
	bcs @fadeColoursInPalette

// bit not set, offset += 4 (skip group of palettes)
	txa
	clc
	adc #$04
	tax
	jmp @toNextPalette

// num inner loops
@fadeColoursInPalette:
	lda #$04
	sta wPaletteFadePaletteColourIdx

@innerLoop:
// palette value -= $10 (get darker)
	lda wInternalPalettes_1.w, x
	sec
	sbc #$10
	bcs +
// carry clear (palette < 0), set back to $0f
	lda #$0f
+	sta wInternalPalettes_1.w, x
// next palette's colour
	inx
	dec wPaletteFadePaletteColourIdx
	bne @innerLoop

@toNextPalette:
	dec wPaletteFadePaletteIdx
	bne @outerLoop

	lda #$ff
	sta wShouldLoadInternalPalettes
	rts


func_05cb:
B15_05cb:		ldx #$ff		; a2 ff
B15_05cd:		stx wBitmapOfPalettesToFadeOut.w		; 8e 5f 01

B15_05d0:		sta $9f			; 85 9f
B15_05d2:		tax				; aa 
B15_05d3:		jsr func_0530		; 20 30 e5
B15_05d6:		ldx #$00		; a2 00
B15_05d8:		lda wBitmapOfPalettesToFadeOut.w		; ad 5f 01
B15_05db:		sta $02			; 85 02
B15_05dd:		lda #$08		; a9 08
B15_05df:		sta $00			; 85 00
B15_05e1:		lsr $02			; 46 02
B15_05e3:		bcs B15_05ed ; b0 08

B15_05e5:		txa				; 8a 
B15_05e6:		clc				; 18 
B15_05e7:		adc #$04		; 69 04
B15_05e9:		tax				; aa 
B15_05ea:		jmp B15_05fe		; 4c fe e5

B15_05ed:		lda #$04		; a9 04
B15_05ef:		sta $01			; 85 01
B15_05f1:		lda wInternalPalettes_2.w, x	; bd a0 01
B15_05f4:		and #$0f		; 29 0f
B15_05f6:		sta wInternalPalettes_1.w, x	; 9d 80 01
B15_05f9:		inx				; e8 
B15_05fa:		dec $01			; c6 01
B15_05fc:		bne B15_05f1 ; d0 f3

B15_05fe:		dec $00			; c6 00
B15_0600:		bne B15_05e1 ; d0 df

B15_0602:		ldx $9f			; a6 9f
B15_0604:		jsr func_0530		; 20 30 e5
B15_0607:		ldy #$03		; a0 03
B15_0609:		tya				; 98 
B15_060a:		pha				; 48 
B15_060b:		ldx #$00		; a2 00
B15_060d:		lda wBitmapOfPalettesToFadeOut.w		; ad 5f 01
B15_0610:		sta $02			; 85 02
B15_0612:		lda #$08		; a9 08
B15_0614:		sta $00			; 85 00
B15_0616:		lsr $02			; 46 02
B15_0618:		bcs B15_0622 ; b0 08

B15_061a:		txa				; 8a 
B15_061b:		clc				; 18 
B15_061c:		adc #$04		; 69 04
B15_061e:		tax				; aa 
B15_061f:		jmp B15_0639		; 4c 39 e6

B15_0622:		lda #$04		; a9 04
B15_0624:		sta $01			; 85 01
B15_0626:		lda wInternalPalettes_1.w, x	; bd 80 01
B15_0629:		cmp wInternalPalettes_2.w, x	; dd a0 01
B15_062c:		beq B15_0634 ; f0 06

B15_062e:		clc				; 18 
B15_062f:		adc #$10		; 69 10
B15_0631:		sta wInternalPalettes_1.w, x	; 9d 80 01
B15_0634:		inx				; e8 
B15_0635:		dec $01			; c6 01
B15_0637:		bne B15_0626 ; d0 ed

B15_0639:		dec $00			; c6 00
B15_063b:		bne B15_0616 ; d0 d9

B15_063d:		ldx $9f			; a6 9f
B15_063f:		jsr func_0530		; 20 30 e5
B15_0642:		pla				; 68 
B15_0643:		tay				; a8 
B15_0644:		dey				; 88 
B15_0645:		bne B15_0609 ; d0 c2

B15_0647:		rts				; 60 


copyDataToDisplayFromVramQueue:
	ldx #$00

@copyNextGroup:
	lda wNMIDataCopyStruct.w, x
	bpl @copyData

// bit 7 set of first byte ($ff?)
	sta wNMIDataCopyStruct.w		; 8d 01 01
	ldx #$00		; a2 00
	stx wNMIDataCopyStructNextIdx.w		; 8e 00 01

	lda wPPUCtrl
	sta PPUCTRL
	rts

// first load 2 big-endian bytes into ppu addr
@copyData:
	sta PPUADDR
	inx
	lda wNMIDataCopyStruct.w, x
	sta PPUADDR

// if bit 7 of next byte not set, copy going across
	inx
	ldy #$b0
	lda wNMIDataCopyStruct.w, x
	bpl +

// either way, use lower 7 bits of that byte for times to copy
	ldy #$b4
	and #$7f
+
	inx
	sty PPUCTRL

// y is num bytes
	tay
-	lda wNMIDataCopyStruct.w, x
	sta PPUDATA
	inx
	dey
	bne -

	beq @copyNextGroup


func_0684:
B15_0684:		inc $015e		; ee 5e 01
B15_0687:		lda $11			; a5 11
B15_0689:		and #$10		; 29 10
B15_068b:		bne B15_0690 ; d0 03

B15_068d:		rol $015e		; 2e 5e 01
B15_0690:		lda $015e		; ad 5e 01
B15_0693:		bmi B15_06a1 ; 30 0c

B15_0695:		eor $015a		; 4d 5a 01
B15_0698:		clc				; 18 
B15_0699:		adc $16			; 65 16
B15_069b:		adc $31			; 65 31
B15_069d:		sta $015e		; 8d 5e 01
B15_06a0:		rts				; 60

B15_06a1:		eor #$ff		; 49 ff
B15_06a3:		jmp $e698		; 4c 98 e6


jumpTable:
	asl a
	tay
	iny
	pla
	sta wJumpTableAddr
	pla
	sta wJumpTableAddr+1
	lda (wJumpTableAddr), y
	tax
	iny
	lda (wJumpTableAddr), y
	sta wJumpTableAddr+1
	stx wJumpTableAddr
	jmp (wJumpTableAddr)


jumpTable_retFollowing:
// save a
	sta wJumpTableRetIdx

	ldy #$02

// get return addr-1
	pla
	sta wJumpTableAddr
	pla
	sta wJumpTableAddr+1

// store high byte of return addr (the following word)
	lda (wJumpTableAddr), y
	sta wJumpTableRetAddr

// get low byte of return addr, -1 so we return properly
	dey
	lda (wJumpTableAddr), y
	sec
	sbc #$01
	sta wJumpTableRetAddr+1
	lda wJumpTableRetAddr
	sbc #$00
// then push to return to after jump
	pha
	lda wJumpTableRetAddr+1
	pha

// regular jump table functionality with +2 iny due to ret func
	lda wJumpTableRetIdx
	asl a
	tay
	iny
	iny
	iny
	lda (wJumpTableAddr), y
	tax
	iny
	lda (wJumpTableAddr), y
	sta wJumpTableAddr+1
	stx wJumpTableAddr
	jmp (wJumpTableAddr)


clearAllEntities:
B15_06ee:		ldx #$00		; a2 00
-	lda #$00		; a9 00
B15_06f2:		sta $0309, x	; 9d 09 03
B15_06f5:		txa				; 8a 
B15_06f6:		clc				; 18 
B15_06f7:		adc #$10		; 69 10
B15_06f9:		tax				; aa 
	bne -

-	lda #$00		; a9 00
B15_06fe:		sta wEntityStructs.byte9.w, x	; 9d 09 04
B15_0701:		txa				; 8a 
B15_0702:		clc				; 18 
B15_0703:		adc #$10		; 69 10
B15_0705:		tax				; aa 
	bne -

B15_0708:		rts				; 60 


func_0709:
B15_0709:		lda #$c0		; a9 c0
B15_070b:		sta $00			; 85 00
B15_070d:		sta $02			; 85 02
B15_070f:		lda #$3f		; a9 3f
B15_0711:		sta $01			; 85 01
B15_0713:		sta $03			; 85 03
B15_0715:		jmp func_0735		; 4c 35 e7


B15_0718:		lda #$10		; a9 10
B15_071a:		sta $00			; 85 00
B15_071c:		sta $02			; 85 02
B15_071e:		lda #$f0		; a9 f0
B15_0720:		sta $01			; 85 01
B15_0722:		lda #$08		; a9 08
B15_0724:		sta $03			; 85 03
B15_0726:		jmp func_0735		; 4c 35 e7


B15_0729:		lda #$08		; a9 08
B15_072b:		sta $00			; 85 00
B15_072d:		sta $02			; 85 02
B15_072f:		lda #$f8		; a9 f8
B15_0731:		sta $01			; 85 01
B15_0733:		sta $03			; 85 03

func_0735:
B15_0735:		lda wChosenCharacter.w		; ad 10 05
B15_0738:		bmi B15_0746 ; 30 0c

B15_073a:		lda $31			; a5 31
B15_073c:		and #$f0		; 29 f0
B15_073e:		tax				; aa 
B15_073f:		lda $33			; a5 33
B15_0741:		and #$f0		; 29 f0
B15_0743:		jmp $e74a		; 4c 4a e7


B15_0746:		ldx $31			; a6 31
B15_0748:		lda $33			; a5 33
B15_074a:		stx $04			; 86 04
B15_074c:		sta $05			; 85 05
B15_074e:		lda #$00		; a9 00
B15_0750:		sta $015d		; 8d 5d 01
B15_0753:		lda $19			; a5 19
B15_0755:		and #$df		; 29 df
B15_0757:		sta $19			; 85 19
B15_0759:		lda $11			; a5 11
B15_075b:		sec				; 38 
B15_075c:		sbc $04			; e5 04
B15_075e:		sta $16			; 85 16
B15_0760:		lda $10			; a5 10
B15_0762:		sbc $30			; e5 30
B15_0764:		lsr a			; 4a
B15_0765:		ror $16			; 66 16
B15_0767:		lsr a			; 4a
B15_0768:		ror $16			; 66 16
B15_076a:		lsr a			; 4a
B15_076b:		ror $16			; 66 16
B15_076d:		lsr a			; 4a
B15_076e:		ror $16			; 66 16
B15_0770:		cmp #$00		; c9 00
B15_0772:		beq B15_0795 ; f0 21

B15_0774:		cmp #$01		; c9 01
B15_0776:		beq B15_0784 ; f0 0c

B15_0778:		cmp #$0f		; c9 0f
B15_077a:		bne B15_07d2 ; d0 56

B15_077c:		lda $16			; a5 16
B15_077e:		cmp $00			; c5 00
B15_0780:		bcc B15_07d2 ; 90 50

B15_0782:		bcs B15_078a ; b0 06

B15_0784:		lda $16			; a5 16
B15_0786:		cmp $01			; c5 01
B15_0788:		bcs B15_07d2 ; b0 48

B15_078a:		lda #$7f		; a9 7f
B15_078c:		sta $015d		; 8d 5d 01
B15_078f:		lda $19			; a5 19
B15_0791:		ora #$20		; 09 20
B15_0793:		sta $19			; 85 19
B15_0795:		lda $13			; a5 13
B15_0797:		sec				; 38 
B15_0798:		sbc $05			; e5 05
B15_079a:		sta $17			; 85 17
B15_079c:		lda $12			; a5 12
B15_079e:		sbc $32			; e5 32
B15_07a0:		lsr a			; 4a
B15_07a1:		ror $17			; 66 17
B15_07a3:		lsr a			; 4a
B15_07a4:		ror $17			; 66 17
B15_07a6:		lsr a			; 4a
B15_07a7:		ror $17			; 66 17
B15_07a9:		lsr a			; 4a
B15_07aa:		ror $17			; 66 17
B15_07ac:		cmp #$00		; c9 00
B15_07ae:		beq B15_07d1 ; f0 21

B15_07b0:		cmp #$01		; c9 01
B15_07b2:		beq B15_07c0 ; f0 0c

B15_07b4:		cmp #$0f		; c9 0f
B15_07b6:		bne B15_07d2 ; d0 1a

B15_07b8:		lda $17			; a5 17
B15_07ba:		cmp $02			; c5 02
B15_07bc:		bcc B15_07d2 ; 90 14

B15_07be:		bcs B15_07c6 ; b0 06

B15_07c0:		lda $17			; a5 17
B15_07c2:		cmp $03			; c5 03
B15_07c4:		bcs B15_07d2 ; b0 0c

B15_07c6:		lda #$7f		; a9 7f
B15_07c8:		sta $015d		; 8d 5d 01
B15_07cb:		lda $19			; a5 19
B15_07cd:		ora #$20		; 09 20
B15_07cf:		sta $19			; 85 19
B15_07d1:		rts				; 60 


B15_07d2:		lda #$ff		; a9 ff
B15_07d4:		sta $015d		; 8d 5d 01
B15_07d7:		lda $19			; a5 19
B15_07d9:		ora #$20		; 09 20
B15_07db:		sta $19			; 85 19
B15_07dd:		rts				; 60 


clearAllGlobalFlags:
	ldx #$1f
	lda #$00
-	sta wGlobalFlags.w, x
	dex
	bpl -

	rts


checkGlobalFlag:
	jsr splitAintoByteOffsetYAndBitToCheckA
	and wGlobalFlags.w, y
	rts


setGlobalFlag:
	jsr splitAintoByteOffsetYAndBitToCheckA
_setGlobalFlag:
	lda wBitToCheck
	ora wGlobalFlags.w, y
	sta wGlobalFlags.w, y
	rts


unsetGlobalFlag:
	jsr splitAintoByteOffsetYAndBitToCheckA
_unsetGlobalFlag:
	eor #$ff
	and wGlobalFlags.w, y
	sta wGlobalFlags.w, y
	rts


// Unused?
toggleGlobalFlag:
	jsr splitAintoByteOffsetYAndBitToCheckA
	lda wBitToCheck
	and wGlobalFlags.w, y
	beq _setGlobalFlag ; f0 e1

	lda wBitToCheck
	jmp _unsetGlobalFlag


splitAintoByteOffsetYAndBitToCheckA:
	sta wBitToCheck

// low 3 bits in x, used later for bitTable
	and #$07
	tax

// y to be upper 5 bits shifted right 3 times as an offset
	lsr wBitToCheck
	lsr wBitToCheck
	lsr wBitToCheck
	ldy wBitToCheck

	lda bitTable.w, x
	sta wBitToCheck
	rts

bitTable:
	.db $01 $02 $04 $08 $10 $20 $40 $80


func_0832:
B15_0832:		ldy #$08		; a0 08
B15_0834:		ldx #$80		; a2 80
B15_0836:		bne B15_083c ; d0 04

func_0838:
B15_0838:		ldy #$08		; a0 08
B15_083a:		ldx #$00		; a2 00
B15_083c:		lda $0309, x	; bd 09 03
B15_083f:		beq B15_084b ; f0 0a

B15_0841:		txa				; 8a 
B15_0842:		clc				; 18 
B15_0843:		adc #$10		; 69 10
B15_0845:		tax				; aa 
B15_0846:		dey				; 88 
B15_0847:		bne B15_083c ; d0 f3

B15_0849:		lda #$ff		; a9 ff
B15_084b:		rts				; 60 


B15_084c:		ldy #$08		; a0 08
B15_084e:		ldx #$00		; a2 00
B15_0850:		lda wEntityStructs.byte9.w, x	; bd 09 04
B15_0853:		beq B15_085f ; f0 0a

B15_0855:		txa				; 8a 
B15_0856:		clc				; 18 
B15_0857:		adc #$10		; 69 10
B15_0859:		tax				; aa 
B15_085a:		dey				; 88 
B15_085b:		bne B15_0850 ; d0 f3

B15_085d:		lda #$ff		; a9 ff
B15_085f:		rts				; 60 


func_0860:
B15_0860:		sta $00			; 85 00
B15_0862:		jsr pushLower2romBanks		; 20 43 fc
B15_0865:		lda #$0c		; a9 0c
B15_0867:		jsr swapLower2romBanksIdxedA		; 20 0c fd
B15_086a:		lda $00			; a5 00
B15_086c:		jsr $b5a9		; 20 a9 b5
B15_086f:		jmp pullAndSetLower2romBanks		; 4c 5b fc


func_0872:
B15_0872:		sta $01			; 85 01
B15_0874:		lda #$00		; a9 00
B15_0876:		sta $07			; 85 07
B15_0878:		lda $00			; a5 00
B15_087a:		and #$0f		; 29 0f
B15_087c:		sta $02			; 85 02
B15_087e:		lda $00			; a5 00
B15_0880:		and #$70		; 29 70
B15_0882:		sta $03			; 85 03
B15_0884:		lda $01			; a5 01
B15_0886:		and #$f0		; 29 f0
B15_0888:		sta $04			; 85 04
B15_088a:		lda $00			; a5 00
B15_088c:		bmi B15_08bd ; 30 2f

B15_088e:		lda $01			; a5 01
B15_0890:		and #$0f		; 29 0f
B15_0892:		clc				; 18 
B15_0893:		adc $02			; 65 02
B15_0895:		sta $05			; 85 05
B15_0897:		cmp #$0a		; c9 0a
B15_0899:		bcc B15_08aa ; 90 0f

B15_089b:		clc				; 18 
B15_089c:		adc #$06		; 69 06
B15_089e:		cmp #$0f		; c9 0f
B15_08a0:		bcc B15_08aa ; 90 08

B15_08a2:		and #$0f		; 29 0f
B15_08a4:		sta $05			; 85 05
B15_08a6:		lda #$10		; a9 10
B15_08a8:		sta $07			; 85 07
B15_08aa:		lda $07			; a5 07
B15_08ac:		clc				; 18 
B15_08ad:		adc $03			; 65 03
B15_08af:		adc $04			; 65 04
B15_08b1:		cmp #$4a		; c9 4a
B15_08b3:		bcc B15_08ba ; 90 05

B15_08b5:		clc				; 18 
B15_08b6:		adc #$b0		; 69 b0
B15_08b8:		and #$f0		; 29 f0
B15_08ba:		ora $05			; 05 05
B15_08bc:		rts				; 60 


B15_08bd:		lda $01			; a5 01
B15_08bf:		and #$0f		; 29 0f
B15_08c1:		sec				; 38 
B15_08c2:		sbc $02			; e5 02
B15_08c4:		sta $05			; 85 05
B15_08c6:		bcs B15_08d2 ; b0 0a

B15_08c8:		sbc #$05		; e9 05
B15_08ca:		and #$0f		; 29 0f
B15_08cc:		sta $05			; 85 05
B15_08ce:		lda #$10		; a9 10
B15_08d0:		sta $07			; 85 07
B15_08d2:		lda $04			; a5 04
B15_08d4:		sec				; 38 
B15_08d5:		sbc $03			; e5 03
B15_08d7:		sec				; 38 
B15_08d8:		sbc $07			; e5 07
B15_08da:		cmp #$4a		; c9 4a
B15_08dc:		bcc B15_08e2 ; 90 04

B15_08de:		sbc #$b0		; e9 b0
B15_08e0:		and #$f0		; 29 f0
B15_08e2:		ora $05			; 05 05
B15_08e4:		rts				; 60 


func_08e5:
B15_08e5:		sta $94			; 85 94
B15_08e7:		lda $81			; a5 81
B15_08e9:		bne B15_08f9 ; d0 0e

B15_08eb:		lda $97			; a5 97
B15_08ed:		bne B15_08f9 ; d0 0a

B15_08ef:		lda $94			; a5 94
B15_08f1:		sta $80			; 85 80
B15_08f3:		sta $c7			; 85 c7
B15_08f5:		lda #$03		; a9 03
B15_08f7:		sta $81			; 85 81
B15_08f9:		rts				; 60 


func_08fa:
B15_08fa:		sta $94			; 85 94
B15_08fc:		cmp #$37		; c9 37
B15_08fe:		beq B15_0904 ; f0 04

B15_0900:		lda $81			; a5 81
B15_0902:		bne B15_0910 ; @done

B15_0904:		lda $97			; a5 97
B15_0906:		bne B15_0910 ; @done

B15_0908:		lda $94			; a5 94
B15_090a:		sta $80			; 85 80
B15_090c:		lda #$01		; a9 01
B15_090e:		sta $81			; 85 81
@done:
B15_0910:		rts				; 60 


func_0911:
B15_0911:		stx $0e			; 86 0e
B15_0913:		lda #$4f		; a9 4f
B15_0915:		jsr unsetGlobalFlag		; 20 fc e7
B15_0918:		jsr pushLower2romBanks		; 20 43 fc
B15_091b:		lda $48			; a5 48
B15_091d:		jsr swapLower2romBanksIdxedA		; 20 0c fd
B15_0920:		lda #$00		; a9 00
B15_0922:		sta $4a			; 85 4a
B15_0924:		sta $15			; 85 15
B15_0926:		lda wChosenCharacter.w		; ad 10 05
B15_0929:		bpl B15_093a ; 10 0f

B15_092b:		lda $1a			; a5 1a
B15_092d:		and #$f0		; 29 f0
B15_092f:		sta $1a			; 85 1a
B15_0931:		lda $1b			; a5 1b
B15_0933:		and #$e7		; 29 e7
B15_0935:		sta $1b			; 85 1b
B15_0937:		jmp $e981		; 4c 81 e9

B15_093a:		lda $3d			; a5 3d
B15_093c:		sec				; 38 
B15_093d:		sbc $31			; e5 31
B15_093f:		sta $00			; 85 00
B15_0941:		lda $3c			; a5 3c
B15_0943:		sbc $30			; e5 30
B15_0945:		asl $00			; 06 00
B15_0947:		rol a			; 2a
B15_0948:		asl $00			; 06 00
B15_094a:		rol a			; 2a
B15_094b:		asl $00			; 06 00
B15_094d:		rol a			; 2a
B15_094e:		asl $00			; 06 00
B15_0950:		rol a			; 2a
B15_0951:		bcs B15_097c ; b0 29

B15_0953:		cmp #$20		; c9 20
B15_0955:		bcc B15_097c ; 90 25

B15_0957:		cmp #$e0		; c9 e0
B15_0959:		bcs B15_097c ; b0 21

B15_095b:		lda $3f			; a5 3f
B15_095d:		sec				; 38 
B15_095e:		sbc $33			; e5 33
B15_0960:		sta $00			; 85 00
B15_0962:		lda $3e			; a5 3e
B15_0964:		sbc $32			; e5 32
B15_0966:		asl $00			; 06 00
B15_0968:		rol a			; 2a
B15_0969:		asl $00			; 06 00
B15_096b:		rol a			; 2a
B15_096c:		asl $00			; 06 00
B15_096e:		rol a			; 2a
B15_096f:		asl $00			; 06 00
B15_0971:		rol a			; 2a
B15_0972:		bcs B15_097c ; b0 08

B15_0974:		cmp #$20		; c9 20
B15_0976:		bcc B15_097c ; 90 04

B15_0978:		cmp #$d0		; c9 d0
B15_097a:		bcc B15_0981 ; 90 05

B15_097c:		lda #$4f		; a9 4f
B15_097e:		jsr setGlobalFlag		; 20 f0 e7
B15_0981:		lda $0b			; a5 0b
B15_0983:		beq B15_0998 ; f0 13

B15_0985:		lda $0b			; a5 0b
B15_0987:		bmi B15_098d ; 30 04

B15_0989:		ldy #$02		; a0 02
B15_098b:		bne B15_098f ; d0 02

B15_098d:		ldy #$00		; a0 00
B15_098f:		lda #$00		; a9 00
B15_0991:		sta $0c			; 85 0c
B15_0993:		jsr func_09bf		; 20 bf e9
B15_0996:		bcs B15_09bc ; b0 24

B15_0998:		lda $14			; a5 14
B15_099a:		bmi B15_09b3 ; 30 17

B15_099c:		bne B15_09af ; d0 11

B15_099e:		lda wChosenCharacter.w		; ad 10 05
B15_09a1:		bpl B15_09af ; 10 0c

B15_09a3:		bit $1a			; 24 1a
B15_09a5:		bvc B15_09af ; 50 08

B15_09a7:		ldx $051e		; ae 1e 05
B15_09aa:		lda wEntityStructs.byte4.w, x	; bd 04 04
B15_09ad:		bmi B15_09b3 ; 30 04

B15_09af:		ldy #$06		; a0 06
B15_09b1:		bne B15_09b5 ; d0 02

B15_09b3:		ldy #$04		; a0 04
B15_09b5:		lda #$80		; a9 80
B15_09b7:		sta $0c			; 85 0c
B15_09b9:		jsr func_09bf		; 20 bf e9
B15_09bc:		jmp pullAndSetLower2romBanks		; 4c 5b fc


func_09bf:
B15_09bf:		ldx $0e			; a6 0e
B15_09c1:		lda $eff4, x	; bd f4 ef
B15_09c4:		sta $02			; 85 02
B15_09c6:		lda $eff5, x	; bd f5 ef
B15_09c9:		sta $03			; 85 03
B15_09cb:		lda ($02), y	; b1 02
B15_09cd:		sta $00			; 85 00
B15_09cf:		iny				; c8 
B15_09d0:		lda ($02), y	; b1 02
B15_09d2:		sta $01			; 85 01
B15_09d4:		ldy #$00		; a0 00
B15_09d6:		lda ($00), y	; b1 00
B15_09d8:		sta $0a			; 85 0a
B15_09da:		iny				; c8 
B15_09db:		lda ($00), y	; b1 00
B15_09dd:		sta $0d			; 85 0d
B15_09df:		iny				; c8 
B15_09e0:		lda ($00), y	; b1 00
B15_09e2:		clc				; 18 
B15_09e3:		adc $3f			; 65 3f
B15_09e5:		sta $07			; 85 07
B15_09e7:		iny				; c8 
B15_09e8:		lda ($00), y	; b1 00
B15_09ea:		adc $3e			; 65 3e
B15_09ec:		sta $06			; 85 06
B15_09ee:		and #$0f		; 29 0f
B15_09f0:		cmp #$0f		; c9 0f
B15_09f2:		bne B15_09f9 ; d0 05

B15_09f4:		inc $06			; e6 06
B15_09f6:		jmp $ea03		; 4c 03 ea


B15_09f9:		lda $06			; a5 06
B15_09fb:		eor $32			; 45 32
B15_09fd:		and #$f0		; 29 f0
B15_09ff:		beq B15_0a03 ; f0 02

B15_0a01:		inc $06			; e6 06
B15_0a03:		lda $04e9		; ad e9 04
B15_0a06:		bmi B15_0a0b ; 30 03

B15_0a08:		jmp $ea8a		; 4c 8a ea


B15_0a0b:		lda $04e9		; ad e9 04
B15_0a0e:		and #$20		; 29 20
B15_0a10:		bne B15_0a08 ; d0 f6

B15_0a12:		iny				; c8 
B15_0a13:		lda ($00), y	; b1 00
B15_0a15:		iny				; c8 
B15_0a16:		clc				; 18 
B15_0a17:		adc $3d			; 65 3d
B15_0a19:		sta $05			; 85 05
B15_0a1b:		lda ($00), y	; b1 00
B15_0a1d:		adc $3c			; 65 3c
B15_0a1f:		sta $04			; 85 04
B15_0a21:		iny				; c8 
B15_0a22:		sty $08			; 84 08
B15_0a24:		lda $04			; a5 04
B15_0a26:		lsr a			; 4a
B15_0a27:		lsr a			; 4a
B15_0a28:		lsr a			; 4a
B15_0a29:		lsr a			; 4a
B15_0a2a:		sta $0f			; 85 0f
B15_0a2c:		lda $06			; a5 06
B15_0a2e:		and #$f0		; 29 f0
B15_0a30:		ora $0f			; 05 0f
B15_0a32:		tay				; a8 
B15_0a33:		lda ($58), y	; b1 58
B15_0a35:		sta $0f			; 85 0f
B15_0a37:		lda #$00		; a9 00
B15_0a39:		lsr $0f			; 46 0f
B15_0a3b:		ror a			; 6a
B15_0a3c:		lsr $0f			; 46 0f
B15_0a3e:		ror a			; 6a
B15_0a3f:		clc				; 18 
B15_0a40:		adc $50			; 65 50
B15_0a42:		sta $02			; 85 02
B15_0a44:		lda $0f			; a5 0f
B15_0a46:		adc $51			; 65 51
B15_0a48:		sta $03			; 85 03
B15_0a4a:		lda $04			; a5 04
B15_0a4c:		and #$0e		; 29 0e
B15_0a4e:		lsr a			; 4a
B15_0a4f:		sta $0f			; 85 0f
B15_0a51:		lda $06			; a5 06
B15_0a53:		and #$0e		; 29 0e
B15_0a55:		asl a			; 0a
B15_0a56:		asl a			; 0a
B15_0a57:		ora $0f			; 05 0f
B15_0a59:		tay				; a8 
B15_0a5a:		lda ($02), y	; b1 02
B15_0a5c:		sta $0f			; 85 0f
B15_0a5e:		lda $04			; a5 04
B15_0a60:		and #$01		; 29 01
B15_0a62:		tay				; a8 
B15_0a63:		lda $06			; a5 06
B15_0a65:		and #$01		; 29 01
B15_0a67:		beq B15_0a6e ; f0 05

B15_0a69:		tya				; 98 
B15_0a6a:		clc				; 18 
B15_0a6b:		adc #$02		; 69 02
B15_0a6d:		tay				; a8 
B15_0a6e:		tya				; 98 
B15_0a6f:		asl a			; 0a
B15_0a70:		tay				; a8 
B15_0a71:		lda ($52), y	; b1 52
B15_0a73:		sta $70			; 85 70
B15_0a75:		iny				; c8 
B15_0a76:		lda ($52), y	; b1 52
B15_0a78:		sta $71			; 85 71
B15_0a7a:		ldy $0f			; a4 0f
B15_0a7c:		lda ($70), y	; b1 70
B15_0a7e:		tay				; a8 
B15_0a7f:		lda #$00		; a9 00
B15_0a81:		sta $0f			; 85 0f
B15_0a83:		lda ($56), y	; b1 56
B15_0a85:		lsr a			; 4a
B15_0a86:		lsr a			; 4a
B15_0a87:		jmp $eaac		; 4c ac ea


B15_0a8a:		iny				; c8 
B15_0a8b:		lda ($00), y	; b1 00
B15_0a8d:		clc				; 18 
B15_0a8e:		adc $3d			; 65 3d
B15_0a90:		sta $05			; 85 05
B15_0a92:		iny				; c8 
B15_0a93:		lda ($00), y	; b1 00
B15_0a95:		adc $3c			; 65 3c
B15_0a97:		sta $04			; 85 04
B15_0a99:		and #$0f		; 29 0f
B15_0a9b:		sta $09			; 85 09
B15_0a9d:		iny				; c8 
B15_0a9e:		sty $08			; 84 08
B15_0aa0:		lda $06			; a5 06
B15_0aa2:		asl a			; 0a
B15_0aa3:		asl a			; 0a
B15_0aa4:		asl a			; 0a
B15_0aa5:		asl a			; 0a
B15_0aa6:		ora $09			; 05 09
B15_0aa8:		tay				; a8 
B15_0aa9:		lda $0600, y	; b9 00 06
B15_0aac:		sta $95			; 85 95
B15_0aae:		jsr jumpTable		; 20 a6 e6
	.dw $eb31
	.dw $eba7
	.dw $ec92
	.dw $eced
	.dw $ed32
	.dw $ed9f
	.dw $edab
	.dw $edbd
	.dw $edcc
	.dw $eddc
	.dw $ede9
	.dw $ee23
	.dw $eba7
	.dw $ede9
	.dw $ee66
	.dw $ef73
	.dw $ef73
	.dw $eeae
	.dw $eebc
	.dw $eeca
	.dw $eed8
	.dw $eee6
	.dw $eef4
	.dw $ef02
	.dw $eced
	.dw $eced
	.dw $ef10
	.dw $eba7
	.dw $ee23
	.dw $ef3c
	.dw $ef73
	.dw $eba7
	.dw $ef73
	.dw $ef56
	.dw $ef73
	.dw $ef73
	.dw $ef73
	.dw $ef73
	.dw $ef76
	.dw $ef87
	.dw $ed9f
	.dw $edab
	.dw $edbd
	.dw $edcc
	.dw $eddc
	.dw $ef73
	.dw $ef73
	.dw $ef73
	.dw $ef73
	.dw $efe3
	.dw $ef73
	.dw $ef73
	.dw $ef73
	.dw $ee23
	.dw $ef73
	.dw $ef73
	.dw $ef73
	.dw $ef73
	.dw $ef73
	.dw $ef73
	.dw $ef73
	.dw $ef73
	.dw $ef73
	.dw $ef73


B15_0b31:		lda $0c			; a5 0c
B15_0b33:		bmi B15_0b49 ; 30 14

B15_0b35:		lda $0d			; a5 0d
B15_0b37:		cmp #$05		; c9 05
B15_0b39:		beq B15_0b43 ; f0 08

B15_0b3b:		cmp #$06		; c9 06
B15_0b3d:		bne B15_0b49 ; d0 0a

B15_0b3f:		lda #$02		; a9 02
B15_0b41:		bne B15_0b45 ; d0 02

B15_0b43:		lda #$01		; a9 01
B15_0b45:		ora $4a			; 05 4a
B15_0b47:		sta $4a			; 85 4a
B15_0b49:		ldy $08			; a4 08
B15_0b4b:		dec $0a			; c6 0a
B15_0b4d:		beq B15_0b52 ; f0 03

B15_0b4f:		jmp $e9db		; 4c db e9

B15_0b52:		lda $0c			; a5 0c
B15_0b54:		bpl B15_0b60 ; 10 0a

B15_0b56:		lda $3c			; a5 3c
B15_0b58:		sta $10			; 85 10
B15_0b5a:		lda $3d			; a5 3d
B15_0b5c:		sta $11			; 85 11
B15_0b5e:		clc				; 18 
B15_0b5f:		rts				; 60 


B15_0b60:		lda $4a			; a5 4a
B15_0b62:		bmi B15_0b8f ; 30 2b

B15_0b64:		lda $19			; a5 19
B15_0b66:		and #$40		; 29 40
B15_0b68:		bne B15_0b91 ; d0 27

B15_0b6a:		lda wChosenCharacter.w		; ad 10 05
B15_0b6d:		bpl B15_0b7d ; 10 0e

B15_0b6f:		lda $0b			; a5 0b
B15_0b71:		bmi B15_0b7d ; 30 0a

B15_0b73:		bit $1a			; 24 1a
B15_0b75:		bvs B15_0b83 ; 70 0c

B15_0b77:		lda $1b			; a5 1b
B15_0b79:		and #$fd		; 29 fd
B15_0b7b:		sta $1b			; 85 1b
B15_0b7d:		lda $19			; a5 19
B15_0b7f:		ora #$04		; 09 04
B15_0b81:		sta $19			; 85 19
B15_0b83:		lda $3e			; a5 3e
B15_0b85:		sta $12			; 85 12
B15_0b87:		lda $3f			; a5 3f
B15_0b89:		sta $13			; 85 13
B15_0b8b:		lda $0b			; a5 0b
B15_0b8d:		sta $15			; 85 15
B15_0b8f:		clc				; 18 
B15_0b90:		rts				; 60 


B15_0b91:		lda #$00		; a9 00
B15_0b93:		sta $13			; 85 13
B15_0b95:		inc $3e			; e6 3e
B15_0b97:		lda $3e			; a5 3e
B15_0b99:		and #$0f		; 29 0f
B15_0b9b:		cmp #$0f		; c9 0f
B15_0b9d:		bne B15_0ba1 ; d0 02

B15_0b9f:		inc $3e			; e6 3e
B15_0ba1:		lda $3e			; a5 3e
B15_0ba3:		sta $12			; 85 12
B15_0ba5:		clc				; 18 
B15_0ba6:		rts				; 60 


B15_0ba7:		lda $0d			; a5 0d
B15_0ba9:		cmp #$02		; c9 02
B15_0bab:		bne B15_0bb4 ; d0 07

B15_0bad:		lda wChosenCharacter.w		; ad 10 05
B15_0bb0:		bmi B15_0bb4 ; 30 02

B15_0bb2:		sec				; 38 
B15_0bb3:		rts				; 60 


B15_0bb4:		lda $0c			; a5 0c
B15_0bb6:		bpl B15_0c1a ; 10 62

B15_0bb8:		lda $0d			; a5 0d
B15_0bba:		cmp #$01		; c9 01
B15_0bbc:		bne B15_0bc1 ; d0 03

B15_0bbe:		jmp $eb31		; 4c 31 eb


B15_0bc1:		lda $0d			; a5 0d
B15_0bc3:		cmp #$03		; c9 03
B15_0bc5:		beq B15_0c12 ; f0 4b

B15_0bc7:		lda $14			; a5 14
B15_0bc9:		bmi B15_0bde ; 30 13

B15_0bcb:		bne B15_0bee ; d0 21

B15_0bcd:		lda wChosenCharacter.w		; ad 10 05
B15_0bd0:		bpl B15_0bee ; 10 1c

B15_0bd2:		bit $1a			; 24 1a
B15_0bd4:		bvc B15_0bee ; 50 18

B15_0bd6:		ldx $051e		; ae 1e 05
B15_0bd9:		lda wEntityStructs.byte4.w, x	; bd 04 04
B15_0bdc:		bpl B15_0bee ; 10 10

B15_0bde:		lda $3d			; a5 3d
B15_0be0:		clc				; 18 
B15_0be1:		adc #$7f		; 69 7f
B15_0be3:		sta $3d			; 85 3d
B15_0be5:		lda $3c			; a5 3c
B15_0be7:		adc #$00		; 69 00
B15_0be9:		sta $3c			; 85 3c
B15_0beb:		jmp $ebee		; 4c ee eb


B15_0bee:		lda $3c			; a5 3c
B15_0bf0:		sta $10			; 85 10
B15_0bf2:		lda $3d			; a5 3d
B15_0bf4:		and #$80		; 29 80
B15_0bf6:		sta $11			; 85 11
B15_0bf8:		lda wChosenCharacter.w		; ad 10 05
B15_0bfb:		bpl B15_0c12 ; 10 15

B15_0bfd:		bit $19			; 24 19
B15_0bff:		bvs B15_0c12 ; 70 11

B15_0c01:		lda #$00		; a9 00
B15_0c03:		sta $14			; 85 14
B15_0c05:		sta $34			; 85 34
B15_0c07:		beq B15_0c12 ; f0 09

B15_0c09:		lda $14			; a5 14
B15_0c0b:		eor #$ff		; 49 ff
B15_0c0d:		clc				; 18 
B15_0c0e:		adc #$01		; 69 01
B15_0c10:		sta $14			; 85 14
B15_0c12:		lda #$40		; a9 40
B15_0c14:		ora $4a			; 05 4a
B15_0c16:		sta $4a			; 85 4a
B15_0c18:		clc				; 18 
B15_0c19:		rts				; 60 


B15_0c1a:		lda #$80		; a9 80
B15_0c1c:		ora $4a			; 05 4a
B15_0c1e:		sta $4a			; 85 4a
B15_0c20:		lda wChosenCharacter.w		; ad 10 05
B15_0c23:		bpl B15_0c61 ; 10 3c

B15_0c25:		lda $1a			; a5 1a
B15_0c27:		and #$20		; 29 20
B15_0c29:		bne B15_0c31 ; d0 06

B15_0c2b:		lda $19			; a5 19
B15_0c2d:		and #$04		; 29 04
B15_0c2f:		beq B15_0c3b ; f0 0a

B15_0c31:		lda $0b			; a5 0b
B15_0c33:		bpl B15_0c3b ; 10 06

B15_0c35:		lda #$00		; a9 00
B15_0c37:		sta $20			; 85 20
B15_0c39:		sec				; 38 
B15_0c3a:		rts				; 60 


B15_0c3b:		lda wJoy1ButtonsPressed.w		; ad 50 01
B15_0c3e:		and #$03		; 29 03
B15_0c40:		bne B15_0c61 ; d0 1f

B15_0c42:		lda $19			; a5 19
B15_0c44:		and #$04		; 29 04
B15_0c46:		beq B15_0c61 ; f0 19

B15_0c48:		lda $1a			; a5 1a
B15_0c4a:		and #$03		; 29 03
B15_0c4c:		bne B15_0c61 ; d0 13

B15_0c4e:		lda #$00		; a9 00
B15_0c50:		sta $14			; 85 14
B15_0c52:		lda $0511		; ad 11 05
B15_0c55:		bne B15_0c61 ; d0 0a

B15_0c57:		lda #$03		; a9 03
B15_0c59:		sta $0511		; 8d 11 05
B15_0c5c:		lda #$06		; a9 06
B15_0c5e:		sta $0512		; 8d 12 05
B15_0c61:		lda $19			; a5 19
B15_0c63:		and #$bb		; 29 bb
B15_0c65:		sta $19			; 85 19
B15_0c67:		lda $0b			; a5 0b
B15_0c69:		bmi B15_0c78 ; 30 0d

B15_0c6b:		lda $3e			; a5 3e
B15_0c6d:		sta $12			; 85 12
B15_0c6f:		lda $3f			; a5 3f
B15_0c71:		and #$80		; 29 80
B15_0c73:		sta $13			; 85 13
B15_0c75:		jmp $ec87		; 4c 87 ec


B15_0c78:		lda $3f			; a5 3f
B15_0c7a:		clc				; 18 
B15_0c7b:		adc #$7f		; 69 7f
B15_0c7d:		and #$80		; 29 80
B15_0c7f:		sta $13			; 85 13
B15_0c81:		lda $3e			; a5 3e
B15_0c83:		adc #$00		; 69 00
B15_0c85:		sta $12			; 85 12
B15_0c87:		ldy $08			; a4 08
B15_0c89:		dec $0a			; c6 0a
B15_0c8b:		beq B15_0c90 ; f0 03

B15_0c8d:		jmp $e9db		; 4c db e9


B15_0c90:		clc				; 18 
B15_0c91:		rts				; 60 


B15_0c92:		lda $0d			; a5 0d
B15_0c94:		cmp #$01		; c9 01
B15_0c96:		bne B15_0c9d ; d0 05

B15_0c98:		lda wChosenCharacter.w		; ad 10 05
B15_0c9b:		bmi B15_0cb0 ; 30 13

B15_0c9d:		lda $18			; a5 18
B15_0c9f:		cmp #$32		; c9 32
B15_0ca1:		bne B15_0cad ; d0 0a

B15_0ca3:		lda #$0a		; a9 0a
B15_0ca5:		jsr swapLower2romBanksIdxedA		; 20 0c fd
B15_0ca8:		lda #$08		; a9 08
B15_0caa:		jsr $8033		; 20 33 80
B15_0cad:		jmp $eb31		; 4c 31 eb


B15_0cb0:		lda #$46		; a9 46
B15_0cb2:		jsr checkGlobalFlag		; 20 e9 e7
B15_0cb5:		bne B15_0c9d ; d0 e6

B15_0cb7:		lda #$85		; a9 85
B15_0cb9:		sta $0519		; 8d 19 05
B15_0cbc:		lda #$23		; a9 23
B15_0cbe:		jsr func_08fa		; 20 fa e8
B15_0cc1:		lda #$10		; a9 10
B15_0cc3:		sta $051a		; 8d 1a 05
B15_0cc6:		lda $19			; a5 19
B15_0cc8:		ora #$10		; 09 10
B15_0cca:		sta $19			; 85 19
B15_0ccc:		lda $19			; a5 19
B15_0cce:		ora #$04		; 09 04
B15_0cd0:		sta $19			; 85 19
B15_0cd2:		lda #$11		; a9 11
B15_0cd4:		sta $0511		; 8d 11 05
B15_0cd7:		lda $3c			; a5 3c
B15_0cd9:		sta $10			; 85 10
B15_0cdb:		lda $3d			; a5 3d
B15_0cdd:		sta $11			; 85 11
B15_0cdf:		lda $3e			; a5 3e
B15_0ce1:		sta $12			; 85 12
B15_0ce3:		lda $3f			; a5 3f
B15_0ce5:		sta $13			; 85 13
B15_0ce7:		lda #$c0		; a9 c0
B15_0ce9:		sta $15			; 85 15
B15_0ceb:		clc				; 18 
B15_0cec:		rts				; 60 


B15_0ced:		lda $0c			; a5 0c
B15_0cef:		bpl B15_0cf4 ; 10 03

B15_0cf1:		jmp $eb56		; 4c 56 eb


B15_0cf4:		lda $0b			; a5 0b
B15_0cf6:		bmi B15_0cfc ; 30 04

B15_0cf8:		lda $3f			; a5 3f
B15_0cfa:		bpl B15_0cff ; 10 03

B15_0cfc:		jmp $eb60		; 4c 60 eb


B15_0cff:		lda wChosenCharacter.w		; ad 10 05
B15_0d02:		bpl B15_0d0f ; 10 0b

B15_0d04:		lda wJoy1ButtonsPressed.w		; ad 50 01
B15_0d07:		and #$03		; 29 03
B15_0d09:		bne B15_0d0f ; d0 04

B15_0d0b:		lda #$00		; a9 00
B15_0d0d:		sta $14			; 85 14
B15_0d0f:		lda #$80		; a9 80
B15_0d11:		ora $4a			; 05 4a
B15_0d13:		sta $4a			; 85 4a
B15_0d15:		lda $19			; a5 19
B15_0d17:		and #$04		; 29 04
B15_0d19:		beq B15_0d26 ; f0 0b

B15_0d1b:		lda $19			; a5 19
B15_0d1d:		and #$bb		; 29 bb
B15_0d1f:		sta $19			; 85 19
B15_0d21:		lda wChosenCharacter.w		; ad 10 05
B15_0d24:		bpl B15_0d26 ; 10 00

B15_0d26:		lda $3e			; a5 3e
B15_0d28:		sta $12			; 85 12
B15_0d2a:		lda $3f			; a5 3f
B15_0d2c:		and #$80		; 29 80
B15_0d2e:		sta $13			; 85 13
B15_0d30:		clc				; 18 
B15_0d31:		rts				; 60 


B15_0d32:		lda #$04		; a9 04
B15_0d34:		ora $4a			; 05 4a
B15_0d36:		sta $4a			; 85 4a
B15_0d38:		lda $3d			; a5 3d
B15_0d3a:		eor #$ff		; 49 ff
B15_0d3c:		tay				; a8 
B15_0d3d:		lda $0d			; a5 0d
B15_0d3f:		cmp #$01		; c9 01
B15_0d41:		beq B15_0d46 ; f0 03

B15_0d43:		jmp $eb31		; 4c 31 eb


B15_0d46:		lda $19			; a5 19
B15_0d48:		and #$04		; 29 04
B15_0d4a:		beq B15_0d56 ; f0 0a

B15_0d4c:		cpy $07			; c4 07
B15_0d4e:		bcc B15_0d56 ; 90 06

B15_0d50:		jsr $eb56		; 20 56 eb
B15_0d53:		jmp $eb60		; 4c 60 eb


B15_0d56:		lda #$80		; a9 80
B15_0d58:		ora $4a			; 05 4a
B15_0d5a:		sta $4a			; 85 4a
B15_0d5c:		lda $0c			; a5 0c
B15_0d5e:		bmi B15_0d7b ; 30 1b

B15_0d60:		sty $13			; 84 13
B15_0d62:		lda wChosenCharacter.w		; ad 10 05
B15_0d65:		bpl B15_0d74 ; 10 0d

B15_0d67:		lda wJoy1ButtonsPressed.w		; ad 50 01
B15_0d6a:		and #$03		; 29 03
B15_0d6c:		bne B15_0d89 ; d0 1b

B15_0d6e:		lda $1a			; a5 1a
B15_0d70:		and #$02		; 29 02
B15_0d72:		bne B15_0d89 ; d0 15

B15_0d74:		lda #$00		; a9 00
B15_0d76:		sta $14			; 85 14
B15_0d78:		jmp $ed89		; 4c 89 ed


B15_0d7b:		sty $13			; 84 13
B15_0d7d:		cpy #$00		; c0 00
B15_0d7f:		beq B15_0d89 ; f0 08

B15_0d81:		lda $19			; a5 19
B15_0d83:		and #$40		; 29 40
B15_0d85:		bne B15_0d89 ; d0 02

B15_0d87:		dec $3e			; c6 3e
B15_0d89:		lda $3e			; a5 3e
B15_0d8b:		sta $12			; 85 12
B15_0d8d:		lda $3d			; a5 3d
B15_0d8f:		sta $11			; 85 11
B15_0d91:		lda $3c			; a5 3c
B15_0d93:		sta $10			; 85 10
B15_0d95:		lda $19			; a5 19
B15_0d97:		ora #$40		; 09 40
B15_0d99:		and #$fb		; 29 fb
B15_0d9b:		sta $19			; 85 19
B15_0d9d:		sec				; 38 
B15_0d9e:		rts				; 60 


B15_0d9f:		lda #$14		; a9 14
B15_0da1:		ora $4a			; 05 4a
B15_0da3:		sta $4a			; 85 4a
B15_0da5:		lda $3d			; a5 3d
B15_0da7:		tay				; a8 
B15_0da8:		jmp $ed3d		; 4c 3d ed


B15_0dab:		lda #$08		; a9 08
B15_0dad:		ora $4a			; 05 4a
B15_0daf:		sta $4a			; 85 4a
B15_0db1:		lda $3d			; a5 3d
B15_0db3:		eor #$ff		; 49 ff
B15_0db5:		lsr a			; 4a
B15_0db6:		clc				; 18 
B15_0db7:		adc #$80		; 69 80
B15_0db9:		tay				; a8 
B15_0dba:		jmp $ed3d		; 4c 3d ed


B15_0dbd:		lda #$08		; a9 08
B15_0dbf:		ora $4a			; 05 4a
B15_0dc1:		sta $4a			; 85 4a
B15_0dc3:		lda $3d			; a5 3d
B15_0dc5:		eor #$ff		; 49 ff
B15_0dc7:		lsr a			; 4a
B15_0dc8:		tay				; a8 
B15_0dc9:		jmp $ed3d		; 4c 3d ed


B15_0dcc:		lda #$18		; a9 18
B15_0dce:		ora $4a			; 05 4a
B15_0dd0:		sta $4a			; 85 4a
B15_0dd2:		lda $3d			; a5 3d
B15_0dd4:		lsr a			; 4a
B15_0dd5:		clc				; 18 
B15_0dd6:		adc #$80		; 69 80
B15_0dd8:		tay				; a8 
B15_0dd9:		jmp $ed3d		; 4c 3d ed


B15_0ddc:		lda #$18		; a9 18
B15_0dde:		ora $4a			; 05 4a
B15_0de0:		sta $4a			; 85 4a
B15_0de2:		lda $3d			; a5 3d
B15_0de4:		lsr a			; 4a
B15_0de5:		tay				; a8 
B15_0de6:		jmp $ed3d		; 4c 3d ed


B15_0de9:		lda $0d			; a5 0d
B15_0deb:		cmp #$02		; c9 02
B15_0ded:		bne B15_0e06 ; d0 17

B15_0def:		lda wChosenCharacter.w		; ad 10 05
B15_0df2:		bpl B15_0e06 ; 10 12

B15_0df4:		lda $20			; a5 20
B15_0df6:		and #$07		; 29 07
B15_0df8:		sta $20			; 85 20
B15_0dfa:		lda $1a			; a5 1a
B15_0dfc:		ora #$01		; 09 01
B15_0dfe:		sta $1a			; 85 1a
B15_0e00:		lda $95			; a5 95
B15_0e02:		cmp #$0d		; c9 0d
B15_0e04:		beq B15_0e09 ; f0 03

B15_0e06:		jmp $eb31		; 4c 31 eb


B15_0e09:		lda $051c		; ad 1c 05
B15_0e0c:		beq B15_0e11 ; f0 03

B15_0e0e:		jmp $eb31		; 4c 31 eb


B15_0e11:		lda #$90		; a9 90
B15_0e13:		sta $0519		; 8d 19 05
B15_0e16:		lda #$23		; a9 23
B15_0e18:		jsr func_08fa		; 20 fa e8
B15_0e1b:		lda #$10		; a9 10
B15_0e1d:		sta $051c		; 8d 1c 05
B15_0e20:		jmp $eb31		; 4c 31 eb


B15_0e23:		lda $0d			; a5 0d
B15_0e25:		cmp #$02		; c9 02
B15_0e27:		bne B15_0e59 ; d0 30

B15_0e29:		lda wChosenCharacter.w		; ad 10 05
B15_0e2c:		bpl B15_0e59 ; 10 2b

B15_0e2e:		lda $1a			; a5 1a
B15_0e30:		ora #$09		; 09 09
B15_0e32:		sta $1a			; 85 1a
B15_0e34:		lda $051d		; ad 1d 05
B15_0e37:		and #$09		; 29 09
B15_0e39:		bne B15_0e50 ; d0 15

B15_0e3b:		lda $15			; a5 15
B15_0e3d:		cmp #$20		; c9 20
B15_0e3f:		bcc B15_0e59 ; 90 18

B15_0e41:		jsr func_0832		; 20 32 e8
B15_0e44:		bne B15_0e59 ; d0 13

B15_0e46:		lda #$22		; a9 22
B15_0e48:		jsr func_08fa		; 20 fa e8
B15_0e4b:		lda #$07		; a9 07
B15_0e4d:		jsr func_0860		; 20 60 e8
B15_0e50:		lda $95			; a5 95
B15_0e52:		cmp #$1c		; c9 1c
B15_0e54:		bne B15_0e63 ; d0 0d

B15_0e56:		jmp $ee09		; 4c 09 ee


B15_0e59:		lda $18			; a5 18
B15_0e5b:		cmp #$07		; c9 07
B15_0e5d:		bne B15_0e63 ; d0 04

B15_0e5f:		lda #$00		; a9 00
B15_0e61:		sta $19			; 85 19
B15_0e63:		jmp $eb31		; 4c 31 eb


B15_0e66:		lda $0d			; a5 0d
B15_0e68:		cmp #$02		; c9 02
B15_0e6a:		bne B15_0eab ; d0 3f

B15_0e6c:		lda wChosenCharacter.w		; ad 10 05
B15_0e6f:		bpl B15_0eab ; 10 3a

B15_0e71:		and #$03		; 29 03
B15_0e73:		cmp #$02		; c9 02
B15_0e75:		beq B15_0e87 ; f0 10

B15_0e77:		cmp #$03		; c9 03
B15_0e79:		bne B15_0e9f ; d0 24

B15_0e7b:		lda $1b			; a5 1b
B15_0e7d:		and #$08		; 29 08
B15_0e7f:		beq B15_0e84 ; f0 03

B15_0e81:		jmp $eb31		; 4c 31 eb


B15_0e84:		jmp $ee90		; 4c 90 ee


B15_0e87:		lda $1b			; a5 1b
B15_0e89:		and #$08		; 29 08
B15_0e8b:		beq B15_0e90 ; f0 03

B15_0e8d:		jmp $eb31		; 4c 31 eb


B15_0e90:		lda $1a			; a5 1a
B15_0e92:		ora #$01		; 09 01
B15_0e94:		sta $1a			; 85 1a
B15_0e96:		lda $1b			; a5 1b
B15_0e98:		ora #$08		; 09 08
B15_0e9a:		sta $1b			; 85 1b
B15_0e9c:		jmp $eb31		; 4c 31 eb


B15_0e9f:		lda $3d			; a5 3d
B15_0ea1:		bmi B15_0ea7 ; 30 04

B15_0ea3:		lda #$e0		; a9 e0
B15_0ea5:		bne B15_0ea9 ; d0 02

B15_0ea7:		lda #$20		; a9 20
B15_0ea9:		sta $14			; 85 14
B15_0eab:		jmp $eb31		; 4c 31 eb


B15_0eae:		lda wChosenCharacter.w		; ad 10 05
B15_0eb1:		bpl B15_0eb9 ; 10 06

B15_0eb3:		lda $1a			; a5 1a
B15_0eb5:		ora #$02		; 09 02
B15_0eb7:		sta $1a			; 85 1a
B15_0eb9:		jmp $eba7		; 4c a7 eb


B15_0ebc:		lda wChosenCharacter.w		; ad 10 05
B15_0ebf:		bpl B15_0ec7 ; 10 06

B15_0ec1:		lda $1a			; a5 1a
B15_0ec3:		ora #$02		; 09 02
B15_0ec5:		sta $1a			; 85 1a
B15_0ec7:		jmp $ed32		; 4c 32 ed


B15_0eca:		lda wChosenCharacter.w		; ad 10 05
B15_0ecd:		bpl B15_0ed5 ; 10 06

B15_0ecf:		lda $1a			; a5 1a
B15_0ed1:		ora #$02		; 09 02
B15_0ed3:		sta $1a			; 85 1a
B15_0ed5:		jmp $ed9f		; 4c 9f ed


B15_0ed8:		lda wChosenCharacter.w		; ad 10 05
B15_0edb:		bpl B15_0ee3 ; 10 06

B15_0edd:		lda $1a			; a5 1a
B15_0edf:		ora #$02		; 09 02
B15_0ee1:		sta $1a			; 85 1a
B15_0ee3:		jmp $edab		; 4c ab ed


B15_0ee6:		lda wChosenCharacter.w		; ad 10 05
B15_0ee9:		bpl B15_0ef1 ; 10 06

B15_0eeb:		lda $1a			; a5 1a
B15_0eed:		ora #$02		; 09 02
B15_0eef:		sta $1a			; 85 1a
B15_0ef1:		jmp $edbd		; 4c bd ed


B15_0ef4:		lda wChosenCharacter.w		; ad 10 05
B15_0ef7:		bpl B15_0eff ; 10 06

B15_0ef9:		lda $1a			; a5 1a
B15_0efb:		ora #$02		; 09 02
B15_0efd:		sta $1a			; 85 1a
B15_0eff:		jmp $edcc		; 4c cc ed


B15_0f02:		lda wChosenCharacter.w		; ad 10 05
B15_0f05:		bpl B15_0f0d ; 10 06

B15_0f07:		lda $1a			; a5 1a
B15_0f09:		ora #$02		; 09 02
B15_0f0b:		sta $1a			; 85 1a
B15_0f0d:		jmp $eddc		; 4c dc ed


B15_0f10:		lda $0d			; a5 0d
B15_0f12:		cmp #$02		; c9 02
B15_0f14:		bne B15_0f39 ; d0 23

B15_0f16:		lda wChosenCharacter.w		; ad 10 05
B15_0f19:		bpl B15_0f39 ; 10 1e

B15_0f1b:		bit $20			; 24 20
B15_0f1d:		bvs B15_0f39 ; 70 1a

B15_0f1f:		lda $3d			; a5 3d
B15_0f21:		cmp #$20		; c9 20
B15_0f23:		bcc B15_0f39 ; 90 14

B15_0f25:		cmp #$e0		; c9 e0
B15_0f27:		bcs B15_0f39 ; b0 10

B15_0f29:		lda $1b			; a5 1b
B15_0f2b:		ora #$10		; 09 10
B15_0f2d:		sta $1b			; 85 1b
B15_0f2f:		lda $3c			; a5 3c
B15_0f31:		sta $0484		; 8d 84 04
B15_0f34:		lda #$80		; a9 80
B15_0f36:		sta $0485		; 8d 85 04
B15_0f39:		jmp $eb31		; 4c 31 eb


B15_0f3c:		lda wChosenCharacter.w		; ad 10 05
B15_0f3f:		bpl B15_0f50 ; 10 0f

B15_0f41:		lda $04ec		; ad ec 04
B15_0f44:		and #$0f		; 29 0f
B15_0f46:		beq B15_0f53 ; f0 0b

B15_0f48:		lda $04e8		; ad e8 04
B15_0f4b:		ora #$10		; 09 10
B15_0f4d:		sta $04e8		; 8d e8 04
B15_0f50:		jmp $eb31		; 4c 31 eb


B15_0f53:		jmp $eba7		; 4c a7 eb


B15_0f56:		lda $0d			; a5 0d
B15_0f58:		cmp #$02		; c9 02
B15_0f5a:		bne B15_0f70 ; d0 14

B15_0f5c:		lda wChosenCharacter.w		; ad 10 05
B15_0f5f:		bpl B15_0f70 ; 10 0f

B15_0f61:		lda $04ec		; ad ec 04
B15_0f64:		and #$0f		; 29 0f
B15_0f66:		beq B15_0f70 ; f0 08

B15_0f68:		lda $04e8		; ad e8 04
B15_0f6b:		ora #$10		; 09 10
B15_0f6d:		sta $04e8		; 8d e8 04
B15_0f70:		jmp $eb31		; 4c 31 eb


B15_0f73:		jmp $eb31		; 4c 31 eb


B15_0f76:		lda wChosenCharacter.w		; ad 10 05
B15_0f79:		bmi B15_0f84 ; 30 09

B15_0f7b:		lda $18			; a5 18
B15_0f7d:		cmp #$32		; c9 32
B15_0f7f:		bne B15_0f84 ; d0 03

B15_0f81:		jmp $eba7		; 4c a7 eb


B15_0f84:		jmp $eb31		; 4c 31 eb


B15_0f87:		lda wChosenCharacter.w		; ad 10 05
B15_0f8a:		bmi B15_0fc8 ; 30 3c

B15_0f8c:		lda $18			; a5 18
B15_0f8e:		cmp #$32		; c9 32
B15_0f90:		bne B15_0fc5 ; d0 33

B15_0f92:		lda #$0a		; a9 0a
B15_0f94:		jsr swapLower2romBanksIdxedA		; 20 0c fd
B15_0f97:		lda #$08		; a9 08
B15_0f99:		jsr $8033		; 20 33 80
B15_0f9c:		lda $051e		; ad 1e 05
B15_0f9f:		bpl B15_0fc5 ; 10 24

B15_0fa1:		and #$7f		; 29 7f
B15_0fa3:		cmp wEntityWramOffset.w		; cd 5b 01
B15_0fa6:		bne B15_0fc5 ; d0 1d

B15_0fa8:		lda #$46		; a9 46
B15_0faa:		jsr checkGlobalFlag		; 20 e9 e7
B15_0fad:		bne B15_0fc5 ; d0 16

B15_0faf:		lda $0509		; ad 09 05
B15_0fb2:		and #$10		; 29 10
B15_0fb4:		bne B15_0fc5 ; d0 0f

B15_0fb6:		lda $051c		; ad 1c 05
B15_0fb9:		bne B15_0fc5 ; d0 0a

B15_0fbb:		lda #$f8		; a9 f8
B15_0fbd:		sta $0504		; 8d 04 05
B15_0fc0:		lda #$85		; a9 85
B15_0fc2:		jmp $ecb9		; 4c b9 ec


B15_0fc5:		jmp $eb31		; 4c 31 eb


B15_0fc8:		lda #$46		; a9 46
B15_0fca:		jsr checkGlobalFlag		; 20 e9 e7
B15_0fcd:		bne B15_0fc5 ; d0 f6

B15_0fcf:		lda $19			; a5 19
B15_0fd1:		and #$10		; 29 10
B15_0fd3:		bne B15_0fc5 ; d0 f0

B15_0fd5:		lda $051c		; ad 1c 05
B15_0fd8:		bne B15_0fc5 ; d0 eb

B15_0fda:		lda #$f8		; a9 f8
B15_0fdc:		sta $14			; 85 14
B15_0fde:		lda #$85		; a9 85
B15_0fe0:		jmp $ecb9		; 4c b9 ec


B15_0fe3:		lda $0d			; a5 0d
B15_0fe5:		cmp #$02		; c9 02
B15_0fe7:		bne B15_0ff1 ; d0 08

B15_0fe9:		lda $04e8		; ad e8 04
B15_0fec:		ora #$10		; 09 10
B15_0fee:		sta $04e8		; 8d e8 04
B15_0ff1:		jmp $eb31		; 4c 31 eb


B15_0ff4:		asl a			; 0a
B15_0ff5:		beq B15_1058 ; f0 61

B15_0ff7:		;removed
	.db $f0 $ae

B15_0ff9:		;removed
	.db $f0 $bc

B15_0ffb:		;removed
	.db $f0 $dc

B15_0ffd:		beq B15_1014 ; f0 15

B15_0fff:		sbc ($4e), y	; f1 4e
B15_1001:		sbc ($87), y	; f1 87
B15_1003:		sbc ($c5), y	; f1 c5
B15_1005:		sbc ($fe), y	; f1 fe
B15_1007:		sbc ($37), y	; f1 37
B15_1009:	.db $f2
B15_100a:	.db $12
B15_100b:		beq B15_102f ; f0 22

B15_100d:		beq B15_1046 ; f0 37

B15_100f:		beq B15_105d ; f0 4c

B15_1011:		beq B15_1016 ; f0 03

B15_1013:	.db $02
B15_1014:		.db $00				; 00
B15_1015:		.db $00				; 00
B15_1016:		.db $00				; 00
B15_1017:		.db $00				; 00
B15_1018:		.db $00				; 00
B15_1019:	.db $80
B15_101a:	.db $ff
B15_101b:		rti				; 40 


B15_101c:		.db $00				; 00
B15_101d:		.db $00				; 00
B15_101e:	.db $80
B15_101f:	.db $ff
B15_1020:		cpy #$ff		; c0 ff
B15_1022:	.db $04
B15_1023:	.db $02
B15_1024:		.db $00				; 00
B15_1025:		.db $00				; 00
B15_1026:		.db $00				; 00
B15_1027:		.db $00				; 00
B15_1028:		ora ($00, x)	; 01 00
B15_102a:		ora ($00, x)	; 01 00
B15_102c:		.db $00				; 00
B15_102d:		ora $00			; 05 00
B15_102f:		ora ($50, x)	; 01 50
B15_1031:		.db $00				; 00
B15_1032:		asl $00			; 06 00
B15_1034:		ora ($b0, x)	; 01 b0
B15_1036:	.db $ff
B15_1037:	.db $04
B15_1038:	.db $02
B15_1039:		.db $00				; 00
B15_103a:		.db $00				; 00
B15_103b:		.db $00				; 00
B15_103c:		.db $00				; 00
B15_103d:		ora ($f0, x)	; 01 f0
B15_103f:		.db $00				; 00
B15_1040:		.db $00				; 00
B15_1041:		.db $00				; 00
B15_1042:		.db $00				; 00
B15_1043:		cpy #$00		; c0 00
B15_1045:	.db $80
B15_1046:	.db $ff
B15_1047:		.db $00				; 00
B15_1048:		cpx #$ff		; e0 ff
B15_104a:	.db $80
B15_104b:	.db $ff
B15_104c:	.db $04
B15_104d:	.db $02
B15_104e:		.db $00				; 00
B15_104f:		.db $00				; 00
B15_1050:		.db $00				; 00
B15_1051:		.db $00				; 00
B15_1052:		ora ($f0, x)	; 01 f0
B15_1054:		.db $00				; 00
B15_1055:		.db $00				; 00
B15_1056:		.db $00				; 00
B15_1057:		.db $00				; 00
B15_1058:		cpy #$00		; c0 00
B15_105a:	.db $80
B15_105b:		.db $00				; 00
B15_105c:		.db $00				; 00
B15_105d:		cpx #$ff		; e0 ff
B15_105f:	.db $80
B15_1060:		.db $00				; 00
B15_1061:		adc #$f0		; 69 f0
B15_1063:		adc $8ef0, y	; 79 f0 8e
B15_1066:		;removed
	.db $f0 $9e

B15_1068:		beq B15_106d ; f0 03

B15_106a:	.db $02
B15_106b:		.db $00				; 00
B15_106c:		.db $00				; 00
B15_106d:		.db $00				; 00
B15_106e:		.db $00				; 00
B15_106f:		.db $00				; 00
B15_1070:		.db $00				; 00
B15_1071:		.db $00				; 00
B15_1072:		rti				; 40 


B15_1073:		.db $00				; 00
B15_1074:		.db $00				; 00
B15_1075:		.db $00				; 00
B15_1076:		.db $00				; 00
B15_1077:		cpy #$ff		; c0 ff
B15_1079:	.db $04
B15_107a:	.db $02
B15_107b:		.db $00				; 00
B15_107c:		.db $00				; 00
B15_107d:		.db $00				; 00
B15_107e:		.db $00				; 00
B15_107f:		ora ($00, x)	; 01 00
B15_1081:		ora ($00, x)	; 01 00
B15_1083:		.db $00				; 00
B15_1084:		ora $00			; 05 00
B15_1086:		ora ($70, x)	; 01 70
B15_1088:		.db $00				; 00
B15_1089:		asl $00			; 06 00
B15_108b:		ora ($90, x)	; 01 90
B15_108d:	.db $ff
B15_108e:	.db $03
B15_108f:		ora ($f0, x)	; 01 f0
B15_1091:		.db $00				; 00
B15_1092:		.db $00				; 00
B15_1093:		.db $00				; 00
B15_1094:		.db $00				; 00
B15_1095:	.db $80
B15_1096:		.db $00				; 00
B15_1097:	.db $80
B15_1098:	.db $ff
B15_1099:		.db $00				; 00
B15_109a:		jsr $8000		; 20 00 80
B15_109d:	.db $ff
B15_109e:	.db $03
B15_109f:		ora ($f0, x)	; 01 f0
B15_10a1:		.db $00				; 00
B15_10a2:		.db $00				; 00
B15_10a3:		.db $00				; 00
B15_10a4:		.db $00				; 00
B15_10a5:	.db $80
B15_10a6:		.db $00				; 00
B15_10a7:	.db $80
B15_10a8:		.db $00				; 00
B15_10a9:		.db $00				; 00
B15_10aa:		jsr $8000		; 20 00 80
B15_10ad:		.db $00				; 00
B15_10ae:		ldx $f0, y		; b6 f0
B15_10b0:		ldx $f0, y		; b6 f0
B15_10b2:		ldx $f0, y		; b6 f0
B15_10b4:		ldx $f0, y		; b6 f0
B15_10b6:		ora ($03, x)	; 01 03
B15_10b8:		.db $00				; 00
B15_10b9:		.db $00				; 00
B15_10ba:		.db $00				; 00
B15_10bb:		.db $00				; 00
B15_10bc:		cpy $f0			; c4 f0
B15_10be:		dex				; ca 
B15_10bf:		beq B15_1091 ; f0 d0

B15_10c1:		beq B15_1099 ; f0 d6

B15_10c3:		beq B15_10c6 ; f0 01

B15_10c5:		.db $00				; 00
B15_10c6:		.db $00				; 00
B15_10c7:		.db $00				; 00
B15_10c8:		.db $00				; 00
B15_10c9:		.db $00				; 00
B15_10ca:		ora ($00, x)	; 01 00
B15_10cc:	.db $80
B15_10cd:		.db $00				; 00
B15_10ce:		.db $00				; 00
B15_10cf:		.db $00				; 00
B15_10d0:		ora ($00, x)	; 01 00
B15_10d2:		rti				; 40 


B15_10d3:		.db $00				; 00
B15_10d4:		cpy #$ff		; c0 ff
B15_10d6:		ora ($00, x)	; 01 00
B15_10d8:		rti				; 40 


B15_10d9:		.db $00				; 00
B15_10da:		rti				; 40 


B15_10db:		.db $00				; 00
B15_10dc:		cpx $f0			; e4 f0
B15_10de:	.db $ef
B15_10df:		;removed
	.db $f0 $ff

B15_10e1:		;removed
	.db $f0 $0a

B15_10e3:		sbc ($02), y	; f1 02
B15_10e5:	.db $02
B15_10e6:		.db $00				; 00
B15_10e7:		.db $00				; 00
B15_10e8:		.db $00				; 00
B15_10e9:		.db $00				; 00
B15_10ea:		.db $00				; 00
B15_10eb:	.db $80
B15_10ec:	.db $fe $00 $00
B15_10ef:	.db $03
B15_10f0:	.db $02
B15_10f1:		.db $00				; 00
B15_10f2:		.db $00				; 00
B15_10f3:		.db $00				; 00
B15_10f4:		.db $00				; 00
B15_10f5:		ora $80			; 05 80
B15_10f7:		ora ($80, x)	; 01 80
B15_10f9:		.db $00				; 00
B15_10fa:		asl $80			; 06 80
B15_10fc:		ora ($80, x)	; 01 80
B15_10fe:	.db $ff
B15_10ff:	.db $02
B15_1100:		.db $00				; 00
B15_1101:		cpx #$00		; e0 00
B15_1103:		.db $00				; 00
B15_1104:	.db $ff
B15_1105:		.db $00				; 00
B15_1106:	.db $20 $ff $00
B15_1109:	.db $ff
B15_110a:	.db $02
B15_110b:		.db $00				; 00
B15_110c:		cpx #$00		; e0 00
B15_110e:		.db $00				; 00
B15_110f:		ora ($00, x)	; 01 00
B15_1111:	.db $20 $ff $00
B15_1114:		ora ($1d, x)	; 01 1d
B15_1116:		sbc ($28), y	; f1 28
B15_1118:		sbc ($38), y	; f1 38
B15_111a:		sbc ($43), y	; f1 43
B15_111c:		sbc ($02), y	; f1 02
B15_111e:	.db $02
B15_111f:		.db $00				; 00
B15_1120:		.db $00				; 00
B15_1121:		.db $00				; 00
B15_1122:		.db $00				; 00
B15_1123:		.db $00				; 00
B15_1124:		.db $00				; 00
B15_1125:	.db $ff
B15_1126:		.db $00				; 00
B15_1127:		.db $00				; 00
B15_1128:	.db $03
B15_1129:	.db $02
B15_112a:		.db $00				; 00
B15_112b:		.db $00				; 00
B15_112c:		.db $00				; 00
B15_112d:		.db $00				; 00
B15_112e:		ora $00			; 05 00
B15_1130:		ora ($40, x)	; 01 40
B15_1132:		.db $00				; 00
B15_1133:		asl $00			; 06 00
B15_1135:		ora ($c0, x)	; 01 c0
B15_1137:	.db $ff
B15_1138:	.db $02
B15_1139:		.db $00				; 00
B15_113a:		cpx #$00		; e0 00
B15_113c:	.db $80
B15_113d:	.db $ff
B15_113e:		.db $00				; 00
B15_113f:		jsr $80ff		; 20 ff 80
B15_1142:	.db $ff
B15_1143:	.db $02
B15_1144:		.db $00				; 00
B15_1145:		cpx #$00		; e0 00
B15_1147:	.db $80
B15_1148:		.db $00				; 00
B15_1149:		.db $00				; 00
B15_114a:		jsr $80ff		; 20 ff 80
B15_114d:		.db $00				; 00
B15_114e:		lsr $f1, x		; 56 f1
B15_1150:		adc ($f1, x)	; 61 f1
B15_1152:		adc ($f1), y	; 71 f1
B15_1154:	.db $7c
B15_1155:		sbc ($02), y	; f1 02
B15_1157:	.db $02
B15_1158:		.db $00				; 00
B15_1159:		.db $00				; 00
B15_115a:		.db $00				; 00
B15_115b:		.db $00				; 00
B15_115c:		.db $00				; 00
B15_115d:	.db $80
B15_115e:	.db $ff
B15_115f:		.db $00				; 00
B15_1160:		.db $00				; 00
B15_1161:	.db $03
B15_1162:	.db $02
B15_1163:		.db $00				; 00
B15_1164:		.db $00				; 00
B15_1165:		.db $00				; 00
B15_1166:		.db $00				; 00
B15_1167:		ora $80			; 05 80
B15_1169:		.db $00				; 00
B15_116a:		rti				; 40 


B15_116b:		.db $00				; 00
B15_116c:		asl $80			; 06 80
B15_116e:		.db $00				; 00
B15_116f:		cpy #$ff		; c0 ff
B15_1171:	.db $02
B15_1172:		.db $00				; 00
B15_1173:		rts				; 60 


B15_1174:		.db $00				; 00
B15_1175:	.db $80
B15_1176:	.db $ff
B15_1177:		.db $00				; 00
B15_1178:		ldy #$ff		; a0 ff
B15_117a:	.db $80
B15_117b:	.db $ff
B15_117c:	.db $02
B15_117d:		.db $00				; 00
B15_117e:		rts				; 60 


B15_117f:		.db $00				; 00
B15_1180:	.db $80
B15_1181:		.db $00				; 00
B15_1182:		.db $00				; 00
B15_1183:		ldy #$ff		; a0 ff
B15_1185:	.db $80
B15_1186:		.db $00				; 00
B15_1187:	.db $8f
B15_1188:		sbc ($95), y	; f1 95
B15_118a:		sbc ($a5), y	; f1 a5
B15_118c:		sbc ($b5), y	; f1 b5
B15_118e:		sbc ($01), y	; f1 01
B15_1190:		.db $00				; 00
B15_1191:	.db $80
B15_1192:	.db $ff
B15_1193:		.db $00				; 00
B15_1194:		.db $00				; 00
B15_1195:	.db $03
B15_1196:		ora ($00, x)	; 01 00
B15_1198:		ora ($00, x)	; 01 00
B15_119a:		.db $00				; 00
B15_119b:		ora $00			; 05 00
B15_119d:		ora ($40, x)	; 01 40
B15_119f:		.db $00				; 00
B15_11a0:		asl $00			; 06 00
B15_11a2:		ora ($c0, x)	; 01 c0
B15_11a4:	.db $ff
B15_11a5:	.db $03
B15_11a6:		ora ($f0, x)	; 01 f0
B15_11a8:		.db $00				; 00
B15_11a9:		.db $00				; 00
B15_11aa:		.db $00				; 00
B15_11ab:		.db $00				; 00
B15_11ac:	.db $80
B15_11ad:		.db $00				; 00
B15_11ae:	.db $80
B15_11af:	.db $ff
B15_11b0:		.db $00				; 00
B15_11b1:		cpy #$ff		; c0 ff
B15_11b3:	.db $80
B15_11b4:	.db $ff
B15_11b5:	.db $03
B15_11b6:		ora ($f0, x)	; 01 f0
B15_11b8:		.db $00				; 00
B15_11b9:		.db $00				; 00
B15_11ba:		.db $00				; 00
B15_11bb:		.db $00				; 00
B15_11bc:	.db $80
B15_11bd:		.db $00				; 00
B15_11be:	.db $80
B15_11bf:		.db $00				; 00
B15_11c0:		.db $00				; 00
B15_11c1:		cpy #$ff		; c0 ff
B15_11c3:	.db $80
B15_11c4:		.db $00				; 00
B15_11c5:		cmp $d8f1		; cd f1 d8
B15_11c8:		sbc ($e8), y	; f1 e8
B15_11ca:		sbc ($f3), y	; f1 f3
B15_11cc:		sbc ($02), y	; f1 02
B15_11ce:	.db $02
B15_11cf:		.db $00				; 00
B15_11d0:		.db $00				; 00
B15_11d1:		.db $00				; 00
B15_11d2:		.db $00				; 00
B15_11d3:		.db $00				; 00
B15_11d4:		.db $00				; 00
B15_11d5:	.db $ff
B15_11d6:		.db $00				; 00
B15_11d7:		.db $00				; 00
B15_11d8:	.db $03
B15_11d9:	.db $02
B15_11da:		.db $00				; 00
B15_11db:		.db $00				; 00
B15_11dc:		.db $00				; 00
B15_11dd:		.db $00				; 00
B15_11de:		ora $00			; 05 00
B15_11e0:		ora ($80, x)	; 01 80
B15_11e2:		.db $00				; 00
B15_11e3:		asl $00			; 06 00
B15_11e5:		ora ($80, x)	; 01 80
B15_11e7:	.db $ff
B15_11e8:	.db $02
B15_11e9:		.db $00				; 00
B15_11ea:		cpx #$00		; e0 00
B15_11ec:		.db $00				; 00
B15_11ed:	.db $ff
B15_11ee:		.db $00				; 00
B15_11ef:	.db $20 $ff $00
B15_11f2:	.db $ff
B15_11f3:	.db $02
B15_11f4:		.db $00				; 00
B15_11f5:		cpx #$00		; e0 00
B15_11f7:		.db $00				; 00
B15_11f8:		ora ($00, x)	; 01 00
B15_11fa:	.db $20 $ff $00
B15_11fd:		ora ($06, x)	; 01 06
B15_11ff:	.db $f2
B15_1200:		ora ($f2), y	; 11 f2
B15_1202:		and ($f2, x)	; 21 f2
B15_1204:		bit $02f2		; 2c f2 02
B15_1207:	.db $02
B15_1208:		.db $00				; 00
B15_1209:		.db $00				; 00
B15_120a:		.db $00				; 00
B15_120b:		.db $00				; 00
B15_120c:		.db $00				; 00
B15_120d:		.db $00				; 00
B15_120e:	.db $fe $00 $00
B15_1211:	.db $03
B15_1212:	.db $02
B15_1213:		.db $00				; 00
B15_1214:		.db $00				; 00
B15_1215:		.db $00				; 00
B15_1216:		.db $00				; 00
B15_1217:		ora $00			; 05 00
B15_1219:	.db $02
B15_121a:	.db $80
B15_121b:		.db $00				; 00
B15_121c:		asl $00			; 06 00
B15_121e:	.db $02
B15_121f:	.db $80
B15_1220:	.db $ff
B15_1221:	.db $02
B15_1222:		.db $00				; 00
B15_1223:		cpx #$00		; e0 00
B15_1225:		.db $00				; 00
B15_1226:	.db $ff
B15_1227:		.db $00				; 00
B15_1228:	.db $20 $ff $00
B15_122b:	.db $ff
B15_122c:	.db $02
B15_122d:		.db $00				; 00
B15_122e:		cpx #$00		; e0 00
B15_1230:		.db $00				; 00
B15_1231:		ora ($00, x)	; 01 00
B15_1233:	.db $20 $ff $00
B15_1236:		ora ($3f, x)	; 01 3f
B15_1238:	.db $f2
B15_1239:		eor $f2			; 45 f2
B15_123b:	.db $4b
B15_123c:	.db $f2
B15_123d:		eor ($f2), y	; 51 f2
B15_123f:		ora ($00, x)	; 01 00
B15_1241:		.db $00				; 00
B15_1242:		.db $00				; 00
B15_1243:		.db $00				; 00
B15_1244:		.db $00				; 00
B15_1245:		ora ($00, x)	; 01 00
B15_1247:		.db $00				; 00
B15_1248:		.db $00				; 00
B15_1249:		.db $00				; 00
B15_124a:		.db $00				; 00
B15_124b:		ora ($00, x)	; 01 00
B15_124d:		cpy #$ff		; c0 ff
B15_124f:		cpy #$ff		; c0 ff
B15_1251:		ora ($00, x)	; 01 00
B15_1253:		cpy #$ff		; c0 ff
B15_1255:		rti				; 40 


B15_1256:		.db $00				; 00


func_1257:
B15_1257:		lda #$58		; a9 58
B15_1259:		jsr checkGlobalFlag		; 20 e9 e7
B15_125c:		bne B15_126c ; d0 0e

B15_125e:		lda #$00		; a9 00
B15_1260:		sta wCurrRoomGroup.w		; 8d 62 01
B15_1263:		sta $017d		; 8d 7d 01
B15_1266:		jsr clearAllGlobalFlags		; 20 de e7
B15_1269:		jmp B15_127d		; 4c 7d f2

// global flag 58 set
B15_126c:		lda #$58		; a9 58
B15_126e:		jsr unsetGlobalFlag		; 20 fc e7
// clear all global flags
B15_1271:		ldx #$08		; a2 08
B15_1273:		lda #$00		; a9 00
-	sta wGlobalFlags.w, x	; 9d e0 04
B15_1278:		inx				; e8 
B15_1279:		cpx #$20		; e0 20
	bne -

B15_127d:		lda #$10		; a9 10
B15_127f:		sta wPlayerHealth.w		; 8d e5 04
B15_1282:		lda #$00		; a9 00
B15_1284:		sta $34			; 85 34
B15_1286:		sta $35			; 85 35
B15_1288:		ldx #$1f		; a2 1f
-	sta $0500, x	; 9d 00 05
B15_128d:		dex				; ca 
	bpl -

B15_1290:		lda #$ff		; a9 ff
B15_1292:		sta $c7			; 85 c7
B15_1294:		jmp clearAllEntities		; 4c ee e6


func_1297:
B15_1297:		lda #$01		; a9 01
B15_1299:		sta $81			; 85 81
B15_129b:		jsr func_052e		; 20 2e e5
B15_129e:		jsr wOam_outOfYbounds		; 20 6a e5
B15_12a1:		lda #$60		; a9 60
B15_12a3:		sta wShadow1KBChrBank1.w		; 8d 6c 01
B15_12a6:		lda #$7a		; a9 7a
B15_12a8:		sta wShadow1KBChrBank2.w		; 8d 6d 01
B15_12ab:		lda wCurrRoomGroup.w		; ad 62 01
B15_12ae:		cmp #$0a		; c9 0a
B15_12b0:		bne B15_12c1 ; d0 0f

// group 0a
B15_12b2:		lda $04e1		; ad e1 04
B15_12b5:		and #$08		; 29 08
B15_12b7:		bne B15_12bf ; d0 06

B15_12b9:		lda wCurrRoomGroup.w		; ad 62 01
B15_12bc:		jmp B15_12c1		; 4c c1 f2

B15_12bf:		lda #$08		; a9 08

B15_12c1:		asl a			; 0a
B15_12c2:		tay				; a8 
B15_12c3:		lda roomGroupStartingPositionXY.w, y	; b9 e8 f2
B15_12c6:		sta $0500		; 8d 00 05
B15_12c9:		and #$f0		; 29 f0
B15_12cb:		sta $30			; 85 30

B15_12cd:		lda roomGroupStartingPositionXY.w+1, y	; b9 e9 f2
B15_12d0:		sta $0502		; 8d 02 05
B15_12d3:		and #$f0		; 29 f0
B15_12d5:		sta $32			; 85 32

B15_12d7:		lda #$00		; a9 00
B15_12d9:		sta $31			; 85 31
B15_12db:		sta $33			; 85 33
B15_12dd:		lda #$5a		; a9 5a
B15_12df:		jsr checkGlobalFlag		; 20 e9 e7
B15_12e2:		bne B15_12e7 ; d0 03

B15_12e4:		jmp $df5b		; 4c 5b df


B15_12e7:		rts				; 60 


// nybbles are room, then tile idx
roomGroupStartingPositionXY:
	.db $18 $29
	.db $04 $3b
	.db $0c $1b
	.db $04 $1b
	.db $0c $0b
	.db $5e $3b
	.db $00 $00
	.db $04 $1b
	.db $de $8b
	.db $28 $0b
	.db $5e $8b


func_12fe:
// update palettes based on character
	lda wChosenCharacter.w
B15_1301:		and #$03		; 29 03
B15_1303:		asl a			; 0a
B15_1304:		asl a			; 0a
B15_1305:		tay				; a8 
B15_1306:		lda $f327, y	; b9 27 f3
B15_1309:		sta $01b1		; 8d b1 01
B15_130c:		lda $f328, y	; b9 28 f3
B15_130f:		sta $01b2		; 8d b2 01
B15_1312:		lda $f329, y	; b9 29 f3
B15_1315:		sta $01b3		; 8d b3 01

//
B15_1318:		lda $31			; a5 31
B15_131a:		sta $37			; 85 37
B15_131c:		lda $33			; a5 33
B15_131e:		sta $39			; 85 39

B15_1320:		jsr loadRoomGroupData		; 20 d7 d6
B15_1323:		jmp func_e_1d6d		; 4c 6d dd


B15_1326:	.db $0f
B15_1327:		;removed
	.db $30 $21

B15_1329:	.db $0f
B15_132a:	.db $0f
B15_132b:		.db $30 $25

B15_132d:	.db $0f
B15_132e:	.db $0f
B15_132f:		.db $30 $29

B15_1331:	.db $0f
B15_1332:	.db $0f
B15_1333:		;removed
	.db $30 $26

B15_1335:	.db $0f


initRamNametablesSoundJoyAndBanks:
B15_1336:		lda #$00		; a9 00
B15_1338:		sta $0160		; 8d 60 01
B15_133b:		sta DMC_FREQ		; 8d 10 40
B15_133e:		sta JOY1		; 8d 16 40

B15_1341:		lda #$0f		; a9 0f
B15_1343:		sta SND_CHN		; 8d 15 40

B15_1346:		lda #$40		; a9 40
B15_1348:		sta JOY2		; 8d 17 40

	jsr initBanksAndMirroring

B15_134e:		lda #$01		; a9 01
B15_1350:		sta $81			; 85 81

// marker for no nmi bytes to copy
	lda #$ff
	sta wNMIDataCopyDest.w

// clear page 0 wram
	lda #$00
	tax
-	sta wWramPageToClear, x
	inx
	bne -

// clear the rest of wram, except stack
	lda #>wOam
	sta wWramPageToClear+1
	lda #<wOam
	sta wWramPageToClear

// 6 so end when high byte is >$0800
	ldy #$00
	ldx #$06
-	sta (wWramPageToClear), y
	iny
	bne -
	inc wWramPageToClear+1
	dex
	bne -

// dont show bg/spr except left 8 pixels
	lda #$06
	sta wPPUMask
	sta PPUMASK

// nmi, 8x16 sprites, bg $0000
	lda #$a8
	sta wPPUCtrl
	sta PPUCTRL

	jmp fillFirst3nametablesWithA_clearPalettes


func_1386:
B15_1386:		lda #$5e		; a9 5e
B15_1388:		jsr checkGlobalFlag		; 20 e9 e7
B15_138b:		beq B15_138e ; f0 01

B15_138d:		rts				; 60 

B15_138e:		jsr pushLower2romBanks		; 20 43 fc
B15_1391:		lda #$0c		; a9 0c
B15_1393:		jsr swapLower2romBanksIdxedA		; 20 0c fd
B15_1396:		jsr $ba9a		; 20 9a ba
B15_1399:		jmp pullAndSetLower2romBanks		; 4c 5b fc


func_139c:
B15_139c:		lda $30			; a5 30
B15_139e:		sta $00			; 85 00
B15_13a0:		lda $32			; a5 32
B15_13a2:		sta $02			; 85 02
B15_13a4:		lda $00			; a5 00
B15_13a6:		pha				; 48 
B15_13a7:		jsr pushLower2romBanks		; 20 43 fc
B15_13aa:		lda $02			; a5 02
B15_13ac:		and #$f0		; 29 f0
B15_13ae:		sta $00			; 85 00
B15_13b0:		pla				; 68 
B15_13b1:		lsr a			; 4a
B15_13b2:		lsr a			; 4a
B15_13b3:		lsr a			; 4a
B15_13b4:		lsr a			; 4a
B15_13b5:		ora $00			; 05 00
B15_13b7:		tay				; a8 
B15_13b8:		lda #$04		; a9 04
B15_13ba:		jsr swapLower2romBanksIdxedA		; 20 0c fd
B15_13bd:		lda ($5e), y	; b1 5e
B15_13bf:		sta $4b			; 85 4b
B15_13c1:		lda ($4d), y	; b1 4d
B15_13c3:		bmi B15_13ce ; 30 09

B15_13c5:		sta $4c			; 85 4c
B15_13c7:		lda #$00		; a9 00
B15_13c9:		sta $4f			; 85 4f
B15_13cb:		jmp pullAndSetLower2romBanks		; 4c 5b fc

B15_13ce:		sta $4f			; 85 4f
B15_13d0:		and #$7f		; 29 7f
B15_13d2:		tay				; a8 
B15_13d3:		lda $f3db, y	; b9 db f3
B15_13d6:		sta $4c			; 85 4c
B15_13d8:		jmp pullAndSetLower2romBanks		; 4c 5b fc


B15_13db:		.db $00				; 00
B15_13dc:		php				; 08 
B15_13dd:		asl $04			; 06 04
B15_13df:		asl $04			; 06 04
B15_13e1:		php				; 08 
B15_13e2:		php				; 08 
B15_13e3:		.db $00				; 00
B15_13e4:	.db $07
B15_13e5:	.db $04
B15_13e6:	.db $0b
B15_13e7:	.db $04
B15_13e8:	.db $0b
B15_13e9:		ora ($00, x)	; 01 00
B15_13eb:	.db $04
B15_13ec:	.db $0c
B15_13ed:	.db $04
B15_13ee:	.db $0c


func_13ef:
B15_13ef:		sta $0172		; 8d 72 01
B15_13f2:		bit $04eb		; 2c eb 04
B15_13f5:		bpl B15_13fe ; 10 07

B15_13f7:		lda $18			; a5 18
B15_13f9:		cmp #$0f		; c9 0f
B15_13fb:		beq B15_13fe ; f0 01

B15_13fd:		rts				; 60 

B15_13fe:		jsr $f421		; 20 21 f4
B15_1401:		jsr $f517		; 20 17 f5
B15_1404:		lda $0172		; ad 72 01
B15_1407:		bpl B15_140c ; 10 03

B15_1409:		jmp func_0911		; 4c 11 e9

B15_140c:		lda $0b			; a5 0b
B15_140e:		sta $15			; 85 15
B15_1410:		lda $3c			; a5 3c
B15_1412:		sta $10			; 85 10
B15_1414:		lda $3d			; a5 3d
B15_1416:		sta $11			; 85 11
B15_1418:		lda $3e			; a5 3e
B15_141a:		sta $12			; 85 12
B15_141c:		lda $3f			; a5 3f
B15_141e:		sta $13			; 85 13
B15_1420:		rts				; 60 


B15_1421:		lda #$20		; a9 20
B15_1423:		bit $0172		; 2c 72 01
B15_1426:		bvs B15_142d ; 70 05

B15_1428:		lda $15			; a5 15
B15_142a:		jmp $f457		; 4c 57 f4


B15_142d:		beq B15_1432 ; f0 03

B15_142f:		jmp $f4b5		; 4c b5 f4


B15_1432:		lda $0172		; ad 72 01
B15_1435:		and #$10		; 29 10
B15_1437:		bne B15_1481 ; d0 48

B15_1439:		lda $0172		; ad 72 01
B15_143c:		and #$08		; 29 08
B15_143e:		beq B15_1443 ; f0 03

B15_1440:		jmp $f4da		; 4c da f4


B15_1443:		lda $04e8		; ad e8 04
B15_1446:		bmi B15_146f ; 30 27

B15_1448:		lda $15			; a5 15
B15_144a:		bmi B15_1454 ; 30 08

B15_144c:		cmp #$3c		; c9 3c
B15_144e:		bcc B15_1454 ; 90 04

B15_1450:		lda #$3c		; a9 3c
B15_1452:		bne B15_1457 ; d0 03

B15_1454:		clc				; 18 
B15_1455:		adc #$04		; 69 04
B15_1457:		sta $0b			; 85 0b
B15_1459:		sta $01			; 85 01
B15_145b:		clc				; 18 
B15_145c:		adc $13			; 65 13
B15_145e:		sta $3f			; 85 3f
B15_1460:		lda $0b			; a5 0b
B15_1462:		bmi B15_1468 ; 30 04

B15_1464:		lda #$00		; a9 00
B15_1466:		beq B15_146a ; f0 02

B15_1468:		lda #$ff		; a9 ff
B15_146a:		adc $12			; 65 12
B15_146c:		sta $3e			; 85 3e
B15_146e:		rts				; 60 


B15_146f:		lda $15			; a5 15
B15_1471:		bpl B15_147b ; 10 08

B15_1473:		cmp #$c4		; c9 c4
B15_1475:		bcc B15_147b ; 90 04

B15_1477:		lda #$c4		; a9 c4
B15_1479:		bne B15_1457 ; d0 dc

B15_147b:		sec				; 38 
B15_147c:		sbc #$04		; e9 04
B15_147e:		jmp $f457		; 4c 57 f4


B15_1481:		lda $04e8		; ad e8 04
B15_1484:		bmi B15_14a2 ; 30 1c

B15_1486:		lda $1b			; a5 1b
B15_1488:		and #$08		; 29 08
B15_148a:		beq B15_148f ; f0 03

B15_148c:		jmp $f443		; 4c 43 f4


B15_148f:		lda $15			; a5 15
B15_1491:		bmi B15_149c ; 30 09

B15_1493:		cmp #$18		; c9 18
B15_1495:		bcc B15_149c ; 90 05

B15_1497:		lda #$18		; a9 18
B15_1499:		jmp $f457		; 4c 57 f4


B15_149c:		clc				; 18 
B15_149d:		adc #$01		; 69 01
B15_149f:		jmp $f457		; 4c 57 f4


B15_14a2:		lda $15			; a5 15
B15_14a4:		bpl B15_14af ; 10 09

B15_14a6:		cmp #$e8		; c9 e8
B15_14a8:		bcs B15_14af ; b0 05

B15_14aa:		lda #$e8		; a9 e8
B15_14ac:		jmp $f457		; 4c 57 f4


B15_14af:		sec				; 38 
B15_14b0:		sbc #$01		; e9 01
B15_14b2:		jmp $f457		; 4c 57 f4


B15_14b5:		lda $04e8		; ad e8 04
B15_14b8:		bmi B15_14c7 ; 30 0d

B15_14ba:		lda $15			; a5 15
B15_14bc:		bmi B15_1454 ; 30 96

B15_14be:		cmp #$6c		; c9 6c
B15_14c0:		bcc B15_1454 ; 90 92

B15_14c2:		lda #$6c		; a9 6c
B15_14c4:		jmp $f457		; 4c 57 f4


B15_14c7:		lda $15			; a5 15
B15_14c9:		bpl B15_14d4 ; 10 09

B15_14cb:		cmp #$94		; c9 94
B15_14cd:		bcs B15_14d4 ; b0 05

B15_14cf:		lda #$94		; a9 94
B15_14d1:		jmp $f457		; 4c 57 f4


B15_14d4:		sec				; 38 
B15_14d5:		sbc #$04		; e9 04
B15_14d7:		jmp $f457		; 4c 57 f4


B15_14da:		lda $015a		; ad 5a 01
B15_14dd:		and #$01		; 29 01
B15_14df:		bne B15_150c ; d0 2b

B15_14e1:		lda $04e8		; ad e8 04
B15_14e4:		bmi B15_14f9 ; 30 13

B15_14e6:		lda $15			; a5 15
B15_14e8:		bmi B15_14f3 ; 30 09

B15_14ea:		cmp #$3c		; c9 3c
B15_14ec:		bcc B15_14f3 ; 90 05

B15_14ee:		lda #$3c		; a9 3c
B15_14f0:		jmp $f457		; 4c 57 f4


B15_14f3:		clc				; 18 
B15_14f4:		adc #$01		; 69 01
B15_14f6:		jmp $f457		; 4c 57 f4


B15_14f9:		lda $15			; a5 15
B15_14fb:		bpl B15_1506 ; 10 09

B15_14fd:		cmp #$c4		; c9 c4
B15_14ff:		bcs B15_1506 ; b0 05

B15_1501:		lda #$c4		; a9 c4
B15_1503:		jmp $f457		; 4c 57 f4


B15_1506:		sec				; 38 
B15_1507:		sbc #$01		; e9 01
B15_1509:		jmp $f457		; 4c 57 f4


B15_150c:		lda $15			; a5 15
B15_150e:		bne B15_1514 ; d0 04

B15_1510:		lda #$01		; a9 01
B15_1512:		sta $15			; 85 15
B15_1514:		jmp $f457		; 4c 57 f4


B15_1517:		lda $14			; a5 14
B15_1519:		clc				; 18 
B15_151a:		adc $11			; 65 11
B15_151c:		sta $3d			; 85 3d
B15_151e:		lda $14			; a5 14
B15_1520:		bmi B15_1526 ; 30 04

B15_1522:		lda #$00		; a9 00
B15_1524:		beq B15_1528 ; f0 02

B15_1526:		lda #$ff		; a9 ff
B15_1528:		adc $10			; 65 10
B15_152a:		sta $3c			; 85 3c
B15_152c:		rts				; 60 


B15_152d:		lda #$00		; a9 00
B15_152f:		sta $015d		; 8d 5d 01
B15_1532:		jsr func_154e		; 20 4e f5

func_1535:
B15_1535:		lda $15			; a5 15
B15_1537:		bmi B15_1540 ; 30 07

B15_1539:		clc				; 18 
B15_153a:		adc $17			; 65 17
B15_153c:		bcs B15_1548 ; b0 0a

B15_153e:		bcc B15_1545 ; 90 05

B15_1540:		clc				; 18 
B15_1541:		adc $17			; 65 17
B15_1543:		bcc B15_1548 ; 90 03

B15_1545:		sta $17			; 85 17
B15_1547:		rts				; 60 


B15_1548:		lda #$ff		; a9 ff
B15_154a:		sta $015d		; 8d 5d 01
B15_154d:		rts				; 60 


func_154e:
B15_154e:		lda $14			; a5 14
B15_1550:		bmi B15_1559 ; 30 07

B15_1552:		clc				; 18 
B15_1553:		adc $16			; 65 16
B15_1555:		bcs B15_1561 ; b0 0a

B15_1557:		bcc B15_155e ; 90 05

B15_1559:		clc				; 18 
B15_155a:		adc $16			; 65 16
B15_155c:		bcc B15_1561 ; 90 03

B15_155e:		sta $16			; 85 16
B15_1560:		rts				; 60 


B15_1561:		lda #$ff		; a9 ff
B15_1563:		sta $015d		; 8d 5d 01
B15_1566:		rts				; 60 


updateEntity_wOam:
B15_1567:		sta $00			; 85 00
B15_1569:		jsr pushLower2romBanks		; 20 43 fc
B15_156c:		dec $17			; c6 17
B15_156e:		lda #$05		; a9 05
B15_1570:		jsr swapLower2romBanksIdxedA		; 20 0c fd
B15_1573:		lda $015d		; ad 5d 01
B15_1576:		sta $07			; 85 07
B15_1578:		lda $00			; a5 00
B15_157a:		asl a			; 0a
B15_157b:		tay				; a8 
B15_157c:		bcs B15_1589 ; b0 0b

B15_157e:		lda entityOamSpecs.w, y	; b9 00 82
B15_1581:		sta wCurrPlayerOrEntityOamSpecAddr			; 85 00
B15_1583:		lda entityOamSpecs.w+1, y	; b9 01 82
B15_1586:		jmp B15_1591		; 4c 91 f5

B15_1589:		lda data_5_0300.w, y	; b9 00 83
B15_158c:		sta wCurrPlayerOrEntityOamSpecAddr			; 85 00
B15_158e:		lda data_5_0300.w+1, y	; b9 01 83

B15_1591:		sta wCurrPlayerOrEntityOamSpecAddr+1			; 85 01
B15_1593:		jmp updatePlayerOrEntity_wOam		; 4c c0 f5


func_1596:
B15_1596:		sta $00			; 85 00
B15_1598:		jsr pushLower2romBanks		; 20 43 fc
B15_159b:		lda #$05		; a9 05
B15_159d:		jsr swapLower2romBanksIdxedA		; 20 0c fd

//
B15_15a0:		lda $015d		; ad 5d 01
B15_15a3:		sta $07			; 85 07
B15_15a5:		lda $00			; a5 00
B15_15a7:		asl a			; 0a
B15_15a8:		tay				; a8 
B15_15a9:		bcs B15_15b6 ; b0 0b

// address of tiles gotten from 8000/8100
B15_15ab:		lda data_5_0000.w, y	; b9 00 80
B15_15ae:		sta wCurrPlayerOrEntityOamSpecAddr			; 85 00
B15_15b0:		lda data_5_0000.w+1, y	; b9 01 80
B15_15b3:		jmp B15_15be		; 4c be f5

B15_15b6:		lda $8100, y	; b9 00 81
B15_15b9:		sta wCurrPlayerOrEntityOamSpecAddr			; 85 00
B15_15bb:		lda $8101, y	; b9 01 81

B15_15be:		sta wCurrPlayerOrEntityOamSpecAddr+1			; 85 01

updatePlayerOrEntity_wOam:
//
B15_15c0:		ldy #$00		; a0 00
B15_15c2:		lda (wCurrPlayerOrEntityOamSpecAddr), y	; b1 00
B15_15c4:		bmi B15_15cd ; 30 07

B15_15c6:		ldx #$00		; a2 00
B15_15c8:		stx $2a			; 86 2a
B15_15ca:		jmp B15_15f3		; 4c f3 f5

B15_15cd:		and #$7f		; 29 7f
B15_15cf:		ldx $2a			; a6 2a
B15_15d1:		sta wShadow1KBBanks.w, x	; 9d 6b 01
// $2a /= 8, into $2a/a
B15_15d4:		lda #$00		; a9 00
B15_15d6:		lsr $2a			; 46 2a
B15_15d8:		ror a			; 6a
B15_15d9:		lsr $2a			; 46 2a
B15_15db:		ror a			; 6a
B15_15dc:		sta $2a			; 85 2a
// 2nd byte
B15_15de:		iny				; c8 
B15_15df:		lda (wCurrPlayerOrEntityOamSpecAddr), y	; b1 00
B15_15e1:		bpl B15_15f3 ; 10 10

B15_15e3:		asl a			; 0a
B15_15e4:		tax				; aa 
B15_15e5:		lda $8400, x	; bd 00 84
B15_15e8:		sta $00			; 85 00
B15_15ea:		lda $8401, x	; bd 01 84
B15_15ed:		sta $01			; 85 01
B15_15ef:		ldy #$00		; a0 00
B15_15f1:		lda ($00), y	; b1 00

B15_15f3:		sta $0f			; 85 0f

// start updating at next usable oam idx
B15_15f5:		ldx wNextUsableOamIdx.w		; ae 58 01

//
B15_15f8:		iny				; c8
B15_15f9:		lda $07			; a5 07
B15_15fb:		sta $016f		; 8d 6f 01
B15_15fe:		lda (wCurrPlayerOrEntityOamSpecAddr), y	; b1 00
B15_1600:		sta $02			; 85 02

//
B15_1602:		iny				; c8 
B15_1603:		lda (wCurrPlayerOrEntityOamSpecAddr), y	; b1 00
B15_1605:		sta $04			; 85 04

//
B15_1607:		iny				; c8 
B15_1608:		lda $19			; a5 19
B15_160a:		and #$08		; 29 08
B15_160c:		bne B15_1616 ; d0 08

B15_160e:		lda (wCurrPlayerOrEntityOamSpecAddr), y	; b1 00
B15_1610:		clc				; 18 
B15_1611:		adc $17			; 65 17
B15_1613:		jmp B15_161b		; 4c 1b f6

B15_1616:		lda $17			; a5 17
B15_1618:		sec				; 38 
B15_1619:		sbc (wCurrPlayerOrEntityOamSpecAddr), y	; f1 00

@storeIn03:
B15_161b:		sta $03			; 85 03

//
B15_161d:		iny				; c8 
B15_161e:		bit $2b			; 24 2b
B15_1620:		bpl B15_162f ; 10 0d

B15_1622:		lda (wCurrPlayerOrEntityOamSpecAddr), y	; b1 00
B15_1624:		and #$fc		; 29 fc
B15_1626:		ora $2b			; 05 2b
B15_1628:		and #$7f		; 29 7f
B15_162a:		sta $05			; 85 05
B15_162c:		jmp B15_1631		; 4c 31 f6

B15_162f:		lda (wCurrPlayerOrEntityOamSpecAddr), y	; b1 00

@storeIn05:
B15_1631:		sta $05			; 85 05
// part of global flags ($40-$47)
B15_1633:		lda $04e8		; ad e8 04
B15_1636:		and #$10		; 29 10
B15_1638:		beq B15_1640 ; f0 06

B15_163a:		lda $05			; a5 05
B15_163c:		ora #$20		; 09 20
B15_163e:		sta $05			; 85 05

//
B15_1640:		iny				; c8 
B15_1641:		lda $19			; a5 19
B15_1643:		and #$02		; 29 02
B15_1645:		beq B15_1661 ; f0 1a

B15_1647:		lda $04			; a5 04
B15_1649:		clc				; 18 
B15_164a:		adc #$08		; 69 08
B15_164c:		eor #$ff		; 49 ff
B15_164e:		clc				; 18 
B15_164f:		adc #$01		; 69 01
B15_1651:		sta $04			; 85 04
B15_1653:		lda $05			; a5 05
B15_1655:		bit $05			; 24 05
B15_1657:		bvs B15_165d ; 70 04

B15_1659:		ora #$40		; 09 40
B15_165b:		bne B15_165f ; d0 02

B15_165d:		and #$bf		; 29 bf
B15_165f:		sta $05			; 85 05

B15_1661:		lda $19			; a5 19
B15_1663:		and #$08		; 29 08
B15_1665:		beq B15_1673 ; f0 0c

B15_1667:		lda $05			; a5 05
B15_1669:		bmi B15_166f ; 30 04

B15_166b:		ora #$80		; 09 80
B15_166d:		bne B15_1671 ; d0 02

B15_166f:		and #$7f		; 29 7f
B15_1671:		sta $05			; 85 05
B15_1673:		lda $04			; a5 04
B15_1675:		sta $06			; 85 06
B15_1677:		clc				; 18 
B15_1678:		adc $16			; 65 16
B15_167a:		sta $04			; 85 04
B15_167c:		lda $016f		; ad 6f 01
B15_167f:		bne B15_168e ; d0 0d

B15_1681:		lda $06			; a5 06
B15_1683:		bmi B15_1692 ; 30 0d

B15_1685:		bcc B15_1694 ; 90 0d

B15_1687:		lda #$7f		; a9 7f
B15_1689:		sta $016f		; 8d 6f 01
B15_168c:		bne B15_16b5 ; d0 27

B15_168e:		lda $06			; a5 06
B15_1690:		bmi B15_1685 ; 30 f3

B15_1692:		bcc B15_1687 ; 90 f3

B15_1694:		lda #$00		; a9 00
B15_1696:		sta $016f		; 8d 6f 01
B15_1699:		lda $03			; a5 03
B15_169b:		sta wOam.Y.w, x	; 9d 00 02

B15_169e:		lda (wCurrPlayerOrEntityOamSpecAddr), y	; b1 00
B15_16a0:		clc				; 18 
B15_16a1:		adc $2a			; 65 2a
B15_16a3:		sta wOam.tile.w, x	; 9d 01 02

// player attr and x
B15_16a6:		lda $05			; a5 05
B15_16a8:		sta wOam.attr.w, x	; 9d 02 02
B15_16ab:		lda $04			; a5 04
B15_16ad:		sta wOam.X.w, x	; 9d 03 02
B15_16b0:		txa				; 8a 
B15_16b1:		clc				; 18 
B15_16b2:		adc #$04		; 69 04
B15_16b4:		tax				; aa 
B15_16b5:		iny				; c8 
B15_16b6:		lda $19			; a5 19
B15_16b8:		and #$02		; 29 02
B15_16ba:		bne B15_16c0 ; d0 04

B15_16bc:		lda #$08		; a9 08
B15_16be:		bne B15_16c2 ; d0 02

B15_16c0:		lda #$f8		; a9 f8
B15_16c2:		sta $06			; 85 06
B15_16c4:		clc				; 18 
B15_16c5:		adc $04			; 65 04
B15_16c7:		sta $04			; 85 04
B15_16c9:		lda $016f		; ad 6f 01
B15_16cc:		bne B15_1703 ; d0 35

B15_16ce:		lda $06			; a5 06
B15_16d0:		bmi B15_1707 ; 30 35

B15_16d2:		bcc B15_16df ; 90 0b

B15_16d4:		lda #$7f		; a9 7f
B15_16d6:		sta $016f		; 8d 6f 01
B15_16d9:		dec $02			; c6 02
B15_16db:		bne B15_16b5 ; d0 d8

B15_16dd:		beq B15_16e8 ; f0 09

B15_16df:		lda #$00		; a9 00
B15_16e1:		sta $016f		; 8d 6f 01
B15_16e4:		dec $02			; c6 02
B15_16e6:		bne B15_1699 ; d0 b1

B15_16e8:		dec $0f			; c6 0f
B15_16ea:		beq B15_16ef ; f0 03
// continue drawing player tiles???
B15_16ec:		jmp B15_15f9		; 4c f9 f5

B15_16ef:		stx wNextUsableOamIdx.w		; 8e 58 01
B15_16f2:		lda #$00		; a9 00
B15_16f4:		sta $2b			; 85 2b
B15_16f6:		inc $17			; e6 17
B15_16f8:		lda $04e8		; ad e8 04
B15_16fb:		and #$ef		; 29 ef
B15_16fd:		sta $04e8		; 8d e8 04
B15_1700:		jmp pullAndSetLower2romBanks		; 4c 5b fc

B15_1703:		lda $06			; a5 06
B15_1705:		bmi B15_16d2 ; 30 cb

B15_1707:		bcc B15_16d4 ; 90 cb

B15_1709:		bcs B15_16df ; b0 d4

func_170b:
B15_170b:		sec				; 38 
B15_170c:		sbc $16			; e5 16
B15_170e:		bcs B15_1715 ; b0 05

B15_1710:		eor #$ff		; 49 ff
B15_1712:		clc				; 18 
B15_1713:		adc #$01		; 69 01
B15_1715:		cmp $00			; c5 00
B15_1717:		bcs B15_1727 ; b0 0e

B15_1719:		lda $02			; a5 02
B15_171b:		sec				; 38 
B15_171c:		sbc $17			; e5 17
B15_171e:		bcs B15_1725 ; b0 05

B15_1720:		eor #$ff		; 49 ff
B15_1722:		clc				; 18 
B15_1723:		adc #$01		; 69 01
B15_1725:		cmp $01			; c5 01
B15_1727:		rts				; 60 


;;
B15_1728:		sec				; 38 
B15_1729:		sbc $04			; e5 04
B15_172b:		bcs B15_1732 ; b0 05

B15_172d:		eor #$ff		; 49 ff
B15_172f:		clc				; 18 
B15_1730:		adc #$01		; 69 01
B15_1732:		cmp $00			; c5 00
B15_1734:		bcs B15_1744 ; b0 0e

B15_1736:		lda $02			; a5 02
B15_1738:		sec				; 38 
B15_1739:		sbc $05			; e5 05
B15_173b:		bcs B15_1742 ; b0 05

B15_173d:		eor #$ff		; 49 ff
B15_173f:		clc				; 18 
B15_1740:		adc #$01		; 69 01
B15_1742:		cmp $01			; c5 01
B15_1744:		rts				; 60 


func_1745:
B15_1745:		asl a			; 0a
B15_1746:		tay				; a8 
B15_1747:		lda #$00		; a9 00
B15_1749:		sta $0163		; 8d 63 01
B15_174c:		lda $015d		; ad 5d 01
B15_174f:		beq B15_1753 ; f0 02

B15_1751:		clc				; 18 
B15_1752:		rts				; 60 


B15_1753:		lda $fb52, y	; b9 52 fb
B15_1756:		sta $00			; 85 00
B15_1758:		lda $fb53, y	; b9 53 fb
B15_175b:		sta $01			; 85 01
B15_175d:		ldx #$80		; a2 80
B15_175f:		lda $0309, x	; bd 09 03
B15_1762:		beq B15_17c8 ; f0 64

B15_1764:		lda $0308, x	; bd 08 03
B15_1767:		cmp #$26		; c9 26
B15_1769:		beq B15_176f ; f0 04

B15_176b:		cmp #$43		; c9 43
B15_176d:		bne B15_17d1 ; d0 62

B15_176f:		lda $030a, x	; bd 0a 03
B15_1772:		and #$40		; 29 40
B15_1774:		bne B15_17c8 ; d0 52

B15_1776:		lda $0304, x	; bd 04 03
B15_1779:		bpl B15_1780 ; 10 05

B15_177b:		eor #$ff		; 49 ff
B15_177d:		clc				; 18 
B15_177e:		adc #$01		; 69 01
B15_1780:		cmp #$08		; c9 08
B15_1782:		bcc B15_17c8 ; 90 44

B15_1784:		lda $0307, x	; bd 07 03
B15_1787:		sta $02			; 85 02
B15_1789:		lda $0306, x	; bd 06 03
B15_178c:		jsr func_170b		; 20 0b f7
B15_178f:		bcs B15_17c8 ; b0 37

B15_1791:		lda #$25		; a9 25
B15_1793:		jsr func_08fa		; 20 fa e8
B15_1796:		lda $19			; a5 19
B15_1798:		ora #$10		; 09 10
B15_179a:		sta $19			; 85 19
B15_179c:		dec $0163		; ce 63 01
B15_179f:		lda $0308, x	; bd 08 03
B15_17a2:		cmp #$26		; c9 26
B15_17a4:		bne B15_17be ; d0 18

B15_17a6:		lda #$e0		; a9 e0
B15_17a8:		sta $0305, x	; 9d 05 03
B15_17ab:		lda $030a, x	; bd 0a 03
B15_17ae:		ora #$40		; 09 40
B15_17b0:		sta $030a, x	; 9d 0a 03
B15_17b3:		clc				; 18 
B15_17b4:		lda $0304, x	; bd 04 03
B15_17b7:		bpl B15_17ba ; 10 01

B15_17b9:		sec				; 38 
B15_17ba:		ror a			; 6a
B15_17bb:		sta $0304, x	; 9d 04 03
B15_17be:		lda $1f			; a5 1f
B15_17c0:		sec				; 38 
B15_17c1:		sbc $030f, x	; fd 0f 03
B15_17c4:		sta $1f			; 85 1f
B15_17c6:		sec				; 38 
B15_17c7:		rts				; 60 


B15_17c8:		txa				; 8a 
B15_17c9:		clc				; 18 
B15_17ca:		adc #$10		; 69 10
B15_17cc:		tax				; aa 
B15_17cd:		bne B15_175f ; d0 90

B15_17cf:		clc				; 18 
B15_17d0:		rts				; 60 


B15_17d1:		cmp #$31		; c9 31
B15_17d3:		bne B15_17d8 ; d0 03

B15_17d5:		jmp $f7e9		; 4c e9 f7


B15_17d8:		cmp #$06		; c9 06
B15_17da:		bne B15_17df ; d0 03

B15_17dc:		jmp $f7fd		; 4c fd f7


B15_17df:		cmp #$25		; c9 25
B15_17e1:		bne B15_17e6 ; d0 03

B15_17e3:		jmp $f80f		; 4c 0f f8


B15_17e6:		jmp $f7c8		; 4c c8 f7


B15_17e9:		lda #$0c		; a9 0c
B15_17eb:		sta $0e			; 85 0e
B15_17ed:		lda #$18		; a9 18
B15_17ef:		jsr $f82c		; 20 2c f8
B15_17f2:		bcs B15_17fa ; b0 06

B15_17f4:		jsr $f84e		; 20 4e f8
B15_17f7:		jmp $f78f		; 4c 8f f7


B15_17fa:		jmp $f7c8		; 4c c8 f7


B15_17fd:		lda #$10		; a9 10
B15_17ff:		sta $0e			; 85 0e
B15_1801:		jsr $f82c		; 20 2c f8
B15_1804:		bcs B15_180c ; b0 06

B15_1806:		jsr $f84e		; 20 4e f8
B15_1809:		jmp $f78f		; 4c 8f f7


B15_180c:		jmp $f7c8		; 4c c8 f7


B15_180f:		lda #$10		; a9 10
B15_1811:		sta $0e			; 85 0e
B15_1813:		lda #$20		; a9 20
B15_1815:		jsr $f82c		; 20 2c f8
B15_1818:		bcs B15_17c8 ; b0 ae

B15_181a:		jsr pushLower2romBanks		; 20 43 fc
B15_181d:		lda #$0a		; a9 0a
B15_181f:		jsr swapLower2romBanksIdxedA		; 20 0c fd
B15_1822:		lda #$00		; a9 00
B15_1824:		jsr $8033		; 20 33 80
B15_1827:		jsr pullAndSetLower2romBanks		; 20 5b fc
B15_182a:		clc				; 18 
B15_182b:		rts				; 60 


B15_182c:		sta $0f			; 85 0f
B15_182e:		lda $00			; a5 00
B15_1830:		pha				; 48 
B15_1831:		lda $01			; a5 01
B15_1833:		pha				; 48 
B15_1834:		lda $0e			; a5 0e
B15_1836:		sta $00			; 85 00
B15_1838:		lda $0f			; a5 0f
B15_183a:		sta $01			; 85 01
B15_183c:		lda $0307, x	; bd 07 03
B15_183f:		sta $02			; 85 02
B15_1841:		lda $0306, x	; bd 06 03
B15_1844:		jsr func_170b		; 20 0b f7
B15_1847:		pla				; 68 
B15_1848:		sta $01			; 85 01
B15_184a:		pla				; 68 
B15_184b:		sta $00			; 85 00
B15_184d:		rts				; 60 


B15_184e:		ldy #$00		; a0 00
B15_1850:		lda $f865		; ad 65 f8
B15_1853:		sta $0d			; 85 0d
B15_1855:		lda $f866, y	; b9 66 f8
B15_1858:		cmp $18			; c5 18
B15_185a:		bne B15_185e ; d0 02

B15_185c:		clc				; 18 
B15_185d:		rts				; 60 


B15_185e:		iny				; c8 
B15_185f:		dec $0d			; c6 0d
B15_1861:		bpl B15_1855 ; 10 f2

B15_1863:		sec				; 38 
B15_1864:		rts				; 60 


B15_1865:		and ($11, x)	; 21 11
B15_1867:	.db $17
B15_1868:		clc				; 18 
B15_1869:		ora $1b1a, y	; 19 1a 1b
B15_186c:	.db $1c
B15_186d:		ora $1f1e, x	; 1d 1e 1f
B15_1870:		jsr $3429		; 20 29 34
B15_1873:		and $36, x		; 35 36
B15_1875:	.db $37
B15_1876:		eor #$3a		; 49 3a
B15_1878:	.db $3b
B15_1879:	.db $3c
B15_187a:		rol $453f, x	; 3e 3f 45
B15_187d:	.db $47
B15_187e:		eor $4f4e		; 4d 4e 4f
B15_1881:	.db $53
B15_1882:	.db $54
B15_1883:		eor $56, x		; 55 56
B15_1885:	.db $5a
B15_1886:	.db $5b
B15_1887:	.db $5c


func_1888:
B15_1888:		asl a			; 0a
B15_1889:		sta $0f			; 85 0f
B15_188b:		lda #$53		; a9 53
B15_188d:		jsr checkGlobalFlag		; 20 e9 e7
B15_1890:		bne B15_18a4 ; d0 12

B15_1892:		lda #$46		; a9 46
B15_1894:		jsr checkGlobalFlag		; 20 e9 e7
B15_1897:		beq B15_18a6 ; f0 0d

B15_1899:		lda wChosenCharacter.w		; ad 10 05
B15_189c:		and #$03		; 29 03
B15_189e:		beq B15_18a4 ; f0 04

B15_18a0:		cmp #$01		; c9 01
B15_18a2:		bne B15_18a6 ; d0 02

B15_18a4:		sec				; 38 
B15_18a5:		rts				; 60 


B15_18a6:		lda #$00		; a9 00
B15_18a8:		sta $0163		; 8d 63 01
B15_18ab:		lda $015d		; ad 5d 01
B15_18ae:		bne B15_18ca ; d0 1a

B15_18b0:		lda $051a		; ad 1a 05
B15_18b3:		bne B15_18ca ; d0 15

B15_18b5:		lda $051c		; ad 1c 05
B15_18b8:		bne B15_18ca ; d0 10

B15_18ba:		lda #$55		; a9 55
B15_18bc:		jsr checkGlobalFlag		; 20 e9 e7
B15_18bf:		bne B15_18ca ; d0 09

B15_18c1:		lda $0509		; ad 09 05
B15_18c4:		bmi B15_18ca ; 30 04

B15_18c6:		and #$30		; 29 30
B15_18c8:		beq B15_18cc ; f0 02

B15_18ca:		sec				; 38 
B15_18cb:		rts				; 60 


B15_18cc:		ldy $0f			; a4 0f
B15_18ce:		lda $fb52, y	; b9 52 fb
B15_18d1:		sta $00			; 85 00
B15_18d3:		lda $fb53, y	; b9 53 fb
B15_18d6:		sta $01			; 85 01
B15_18d8:		lda $050b		; ad 0b 05
B15_18db:		and #$02		; 29 02
B15_18dd:		beq B15_18e6 ; f0 07

B15_18df:		lda $01			; a5 01
B15_18e1:		sec				; 38 
B15_18e2:		sbc #$04		; e9 04
B15_18e4:		sta $01			; 85 01
B15_18e6:		lda $0507		; ad 07 05
B15_18e9:		sta $02			; 85 02
B15_18eb:		lda $0506		; ad 06 05
B15_18ee:		jsr func_170b		; 20 0b f7
B15_18f1:		bcs B15_18ca ; b0 d7

B15_18f3:		lda #$c0		; a9 c0
B15_18f5:		sta $0505		; 8d 05 05
B15_18f8:		lda #$ff		; a9 ff
B15_18fa:		sta $0163		; 8d 63 01
B15_18fd:		lda #$09		; a9 09
B15_18ff:		sta $0511		; 8d 11 05
B15_1902:		lda $050b		; ad 0b 05
B15_1905:		and #$01		; 29 01
B15_1907:		beq B15_1919 ; f0 10

B15_1909:		ldx $0517		; ae 17 05
B15_190c:		lda #$00		; a9 00
B15_190e:		sta $030a, x	; 9d 0a 03
B15_1911:		lda $050b		; ad 0b 05
B15_1914:		and #$fe		; 29 fe
B15_1916:		sta $050b		; 8d 0b 05
B15_1919:		lda $050a		; ad 0a 05
B15_191c:		and #$df		; 29 df
B15_191e:		sta $050a		; 8d 0a 05
B15_1921:		lda #$5b		; a9 5b
B15_1923:		jsr checkGlobalFlag		; 20 e9 e7
B15_1926:		bne B15_192b ; d0 03

B15_1928:		jmp $f93d		; 4c 3d f9


B15_192b:		jsr func_1c27		; 20 27 fc
B15_192e:		lda $2c			; a5 2c
B15_1930:		sec				; 38 
B15_1931:		sbc #$01		; e9 01
B15_1933:		sta $2c			; 85 2c
B15_1935:		and #$0f		; 29 0f
B15_1937:		bne B15_193b ; d0 02

B15_1939:		clc				; 18 
B15_193a:		rts				; 60 


B15_193b:		sec				; 38 
B15_193c:		rts				; 60 


B15_193d:		ldx $f956		; ae 56 f9
B15_1940:		lda $18			; a5 18
B15_1942:		cmp $f957, x	; dd 57 f9
B15_1945:		beq B15_194c ; f0 05

B15_1947:		dex				; ca 
B15_1948:		bpl B15_1942 ; 10 f8

B15_194a:		clc				; 18 
B15_194b:		rts				; 60 


B15_194c:		lda $f97f, x	; bd 7f f9
B15_194f:		ora #$80		; 09 80
B15_1951:		jsr func_1c24		; 20 24 fc
B15_1954:		clc				; 18 
B15_1955:		rts				; 60 


B15_1956:	.db $27
B15_1957:		ora ($17), y	; 11 17
B15_1959:		clc				; 18 
B15_195a:		ora $1b1a, y	; 19 1a 1b
B15_195d:	.db $1c
B15_195e:		ora $1f1e, x	; 1d 1e 1f
B15_1961:		jsr $3429		; 20 29 34
B15_1964:		and $36, x		; 35 36
B15_1966:	.db $37
B15_1967:		and $3b3a, y	; 39 3a 3b
B15_196a:	.db $3c
B15_196b:		and $3f3e, x	; 3d 3e 3f
B15_196e:	.db $44
B15_196f:		eor $46			; 45 46
B15_1971:		eor $4f4e		; 4d 4e 4f
B15_1974:	.db $52
B15_1975:	.db $53
B15_1976:	.db $54
B15_1977:		eor $56, x		; 55 56
B15_1979:		cli				; 58 
B15_197a:	.db $5a
B15_197b:	.db $5b
B15_197c:	.db $5c
B15_197d:		lsr $025f, x	; 5e 5f 02
B15_1980:	.db $02
B15_1981:	.db $03
B15_1982:	.db $03
B15_1983:	.db $02
B15_1984:		.db $00				; 00
B15_1985:		.db $00				; 00
B15_1986:	.db $03
B15_1987:		ora $05			; 05 05
B15_1989:	.db $03
B15_198a:	.db $03
B15_198b:		ora $05			; 05 05
B15_198d:	.db $03
B15_198e:		ora $08			; 05 08
B15_1990:		php				; 08 
B15_1991:		php				; 08 
B15_1992:		bpl B15_19a4 ; 10 10

B15_1994:		;removed
	.db $10 $01

B15_1996:		;removed
	.db $10 $05

B15_1998:	.db $02
B15_1999:		ora $03			; 05 03
B15_199b:	.db $03
B15_199c:		ora $03, x		; 15 03
B15_199e:		ora $02			; 05 02
B15_19a0:	.db $03
B15_19a1:		ora $03			; 05 03
B15_19a3:	.db $03
B15_19a4:	.db $03
B15_19a5:		ora $15, x		; 15 15

func_19a7:
B15_19a7:		asl a			; 0a
B15_19a8:		tay				; a8 
B15_19a9:		lda $015d		; ad 5d 01
B15_19ac:		bne B15_19b3 ; d0 05

B15_19ae:		lda $0505		; ad 05 05
B15_19b1:		bpl B15_19b4 ; 10 01

B15_19b3:		rts				; 60 


B15_19b4:		lda $fa55, y	; b9 55 fa
B15_19b7:		sta $08			; 85 08
B15_19b9:		lda $fa56, y	; b9 56 fa
B15_19bc:		sta $09			; 85 09
B15_19be:		ldy #$00		; a0 00
B15_19c0:		lda $16			; a5 16
B15_19c2:		clc				; 18 
B15_19c3:		adc ($08), y	; 71 08
B15_19c5:		sta $04			; 85 04
B15_19c7:		iny				; c8 
B15_19c8:		lda $17			; a5 17
B15_19ca:		clc				; 18 
B15_19cb:		adc ($08), y	; 71 08
B15_19cd:		sta $05			; 85 05
B15_19cf:		iny				; c8 
B15_19d0:		lda ($08), y	; b1 08
B15_19d2:		sta $00			; 85 00
B15_19d4:		iny				; c8 
B15_19d5:		lda ($08), y	; b1 08
B15_19d7:		sta $01			; 85 01
B15_19d9:		lda $0507		; ad 07 05
B15_19dc:		sta $02			; 85 02
B15_19de:		lda $0506		; ad 06 05
B15_19e1:		jsr $f728		; 20 28 f7
B15_19e4:		bcs B15_1a3e ; b0 58

B15_19e6:		iny				; c8 
B15_19e7:		lda ($08), y	; b1 08
B15_19e9:		clc				; 18 
B15_19ea:		adc $13			; 65 13
B15_19ec:		sta $0503		; 8d 03 05
B15_19ef:		iny				; c8 
B15_19f0:		lda ($08), y	; b1 08
B15_19f2:		adc $12			; 65 12
B15_19f4:		sta $0502		; 8d 02 05
B15_19f7:		lda $050a		; ad 0a 05
B15_19fa:		ora #$40		; 09 40
B15_19fc:		sta $050a		; 8d 0a 05
B15_19ff:		lda $18			; a5 18
B15_1a01:		beq B15_1a28 ; f0 25

B15_1a03:		lda $14			; a5 14
B15_1a05:		clc				; 18 
B15_1a06:		adc $0501		; 6d 01 05
B15_1a09:		sta $0501		; 8d 01 05
B15_1a0c:		lda $14			; a5 14
B15_1a0e:		bpl B15_1a14 ; 10 04

B15_1a10:		lda #$ff		; a9 ff
B15_1a12:		bne B15_1a16 ; d0 02

B15_1a14:		lda #$00		; a9 00
B15_1a16:		adc $0500		; 6d 00 05
B15_1a19:		sta $0500		; 8d 00 05
B15_1a1c:		lda wJoy1ButtonsPressed.w		; ad 50 01
B15_1a1f:		and #$03		; 29 03
B15_1a21:		bne B15_1a28 ; d0 05

B15_1a23:		lda #$00		; a9 00
B15_1a25:		sta $0504		; 8d 04 05
B15_1a28:		lda #$00		; a9 00
B15_1a2a:		sta $0505		; 8d 05 05
B15_1a2d:		lda $0509		; ad 09 05
B15_1a30:		and #$fb		; 29 fb
B15_1a32:		sta $0509		; 8d 09 05
B15_1a35:		lda wEntityWramOffset.w		; ad 5b 01
B15_1a38:		ora #$80		; 09 80
B15_1a3a:		sta $d0			; 85 d0
B15_1a3c:		sec				; 38 
B15_1a3d:		rts				; 60 


B15_1a3e:		lda $d0			; a5 d0
B15_1a40:		and #$7f		; 29 7f
B15_1a42:		cmp wEntityWramOffset.w		; cd 5b 01
B15_1a45:		bne B15_1a53 ; d0 0c

B15_1a47:		lda #$00		; a9 00
B15_1a49:		sta $d0			; 85 d0
B15_1a4b:		lda $050a		; ad 0a 05
B15_1a4e:		and #$bf		; 29 bf
B15_1a50:		sta $050a		; 8d 0a 05
B15_1a53:		clc				; 18 
B15_1a54:		rts				; 60 


B15_1a55:		adc $fa			; 65 fa
B15_1a57:	.db $6b
B15_1a58:	.db $fa
B15_1a59:		adc ($fa), y	; 71 fa
B15_1a5b:	.db $77
B15_1a5c:	.db $fa
B15_1a5d:		adc $83fa, x	; 7d fa 83
B15_1a60:	.db $fa
B15_1a61:	.db $89
B15_1a62:	.db $fa
B15_1a63:	.db $8f
B15_1a64:	.db $fa
B15_1a65:		.db $00				; 00
B15_1a66:		nop				; ea 
B15_1a67:		bpl B15_1a6d ; 10 04

B15_1a69:	.db $80
B15_1a6a:		inc $f800, x	; fe 00 f8
B15_1a6d:	.db $0c
B15_1a6e:	.db $04
B15_1a6f:		rts				; 60 


B15_1a70:	.db $ff
B15_1a71:		.db $00				; 00
B15_1a72:	.db $f2
B15_1a73:	.db $0c
B15_1a74:	.db $04
B15_1a75:		.db $00				; 00
B15_1a76:	.db $ff
B15_1a77:		.db $00				; 00
B15_1a78:	.db $f2
B15_1a79:	.db $0c
B15_1a7a:	.db $04
B15_1a7b:		.db $00				; 00
B15_1a7c:	.db $ff
B15_1a7d:		.db $00				; 00
B15_1a7e:		inc $10, x		; f6 10
B15_1a80:	.db $04
B15_1a81:		rti				; 40 


B15_1a82:	.db $ff
B15_1a83:		.db $00				; 00
B15_1a84:	.db $e2
B15_1a85:		bpl B15_1a8b ; 10 04

B15_1a87:		.db $00				; 00
B15_1a88:		inc $ea00, x	; fe 00 ea
B15_1a8b:	.db $0c
B15_1a8c:	.db $04
B15_1a8d:	.db $80
B15_1a8e:		inc $f200, x	; fe 00 f2
B15_1a91:		bpl B15_1a97 ; 10 04

B15_1a93:		.db $00				; 00
B15_1a94:	.db $ff


func_1a95:
B15_1a95:		lda #$00		; a9 00
B15_1a97:		sta $0163		; 8d 63 01
B15_1a9a:		lda $015d		; ad 5d 01
B15_1a9d:		bne B15_1aaa ; d0 0b

B15_1a9f:		lda $0507		; ad 07 05
B15_1aa2:		sta $02			; 85 02
B15_1aa4:		lda $0506		; ad 06 05
B15_1aa7:		jmp func_170b		; 4c 0b f7


B15_1aaa:		sec				; 38 
B15_1aab:		rts				; 60 


func_1aac:
B15_1aac:		asl a			; 0a
B15_1aad:		asl a			; 0a
B15_1aae:		tay				; a8 
B15_1aaf:		lda $015d		; ad 5d 01
B15_1ab2:		bne B15_1b18 ; d0 64

B15_1ab4:		lda $0505		; ad 05 05
B15_1ab7:		bmi B15_1b18 ; 30 5f

B15_1ab9:		bit $04ea		; 2c ea 04
B15_1abc:		bpl B15_1b18 ; 10 5a

B15_1abe:		lda $0509		; ad 09 05
B15_1ac1:		and #$10		; 29 10
B15_1ac3:		bne B15_1b18 ; d0 53

B15_1ac5:		lda $16			; a5 16
B15_1ac7:		clc				; 18 
B15_1ac8:		adc $fb1a, y	; 79 1a fb
B15_1acb:		sta $04			; 85 04
B15_1acd:		lda $17			; a5 17
B15_1acf:		clc				; 18 
B15_1ad0:		adc $fb1b, y	; 79 1b fb
B15_1ad3:		sta $05			; 85 05
B15_1ad5:		lda $fb1c, y	; b9 1c fb
B15_1ad8:		sta $00			; 85 00
B15_1ada:		lda $fb1d, y	; b9 1d fb
B15_1add:		sta $01			; 85 01
B15_1adf:		lda $0507		; ad 07 05
B15_1ae2:		sta $02			; 85 02
B15_1ae4:		lda $0506		; ad 06 05
B15_1ae7:		jsr $f728		; 20 28 f7
B15_1aea:		bcs B15_1b18 ; b0 2c

B15_1aec:		lda #$28		; a9 28
B15_1aee:		jsr func_08fa		; 20 fa e8
B15_1af1:		lda #$c0		; a9 c0
B15_1af3:		sta $0505		; 8d 05 05
B15_1af6:		lda $1f			; a5 1f
B15_1af8:		sec				; 38 
B15_1af9:		sbc #$01		; e9 01
B15_1afb:		sta $1f			; 85 1f
B15_1afd:		bpl B15_1b06 ; 10 07

B15_1aff:		lda #$4d		; a9 4d
B15_1b01:		jsr checkGlobalFlag		; 20 e9 e7
B15_1b04:		beq B15_1b08 ; f0 02

B15_1b06:		clc				; 18 
B15_1b07:		rts				; 60 


B15_1b08:		lda $18			; a5 18
B15_1b0a:		sta $1a			; 85 1a
B15_1b0c:		lda #$14		; a9 14
B15_1b0e:		sta $18			; 85 18
B15_1b10:		lda #$81		; a9 81
B15_1b12:		ora $19			; 05 19
B15_1b14:		sta $19			; 85 19
B15_1b16:		pla				; 68 
B15_1b17:		pla				; 68 
B15_1b18:		sec				; 38 
B15_1b19:		rts				; 60 


B15_1b1a:		.db $00				; 00
B15_1b1b:	.db $f4
B15_1b1c:	.db $0e $0c $00
B15_1b1f:		beq B15_1b2f ; f0 0e

B15_1b21:	.db $0c
B15_1b22:		.db $00				; 00
B15_1b23:		cpx $0c0e		; ec 0e 0c
B15_1b26:		.db $00				; 00
B15_1b27:	.db $f4
B15_1b28:	.db $12
B15_1b29:	.db $0c
B15_1b2a:		.db $00				; 00
B15_1b2b:		beq B15_1b3f ; f0 12

B15_1b2d:	.db $0c
B15_1b2e:		.db $00				; 00
B15_1b2f:		cpx $0c12		; ec 12 0c
B15_1b32:		.db $00				; 00
B15_1b33:	.db $f4
B15_1b34:		asl $0c, x		; 16 0c
B15_1b36:		.db $00				; 00
B15_1b37:		beq B15_1b4f ; f0 16

B15_1b39:	.db $0c
B15_1b3a:		.db $00				; 00
B15_1b3b:		cpx $0c16		; ec 16 0c
B15_1b3e:		.db $00				; 00
B15_1b3f:		inx				; e8 
B15_1b40:		asl $0c, x		; 16 0c
B15_1b42:		.db $00				; 00
B15_1b43:		cpx $16			; e4 16
B15_1b45:	.db $0c
B15_1b46:		.db $00				; 00
B15_1b47:		cpx #$16		; e0 16
B15_1b49:	.db $0c
B15_1b4a:		.db $00				; 00
B15_1b4b:	.db $dc
B15_1b4c:		asl $0c, x		; 16 0c
B15_1b4e:		.db $00				; 00
B15_1b4f:		cpx $0c16		; ec 16 0c
B15_1b52:	.db $0c
B15_1b53:	.db $0c
B15_1b54:	.db $0c
B15_1b55:		bpl B15_1b63 ; 10 0c

B15_1b57:	.db $14
B15_1b58:		bpl B15_1b66 ; 10 0c

B15_1b5a:		bpl B15_1b6c ; 10 10

B15_1b5c:		bpl B15_1b72 ; 10 14

B15_1b5e:	.db $14
B15_1b5f:	.db $0c
B15_1b60:	.db $14
B15_1b61:		;removed
	.db $10 $14

B15_1b63:	.db $14
B15_1b64:	.db $14
B15_1b65:		clc				; 18 
B15_1b66:	.db $14
B15_1b67:	.db $1c
B15_1b68:	.db $14
B15_1b69:		jsr $2414		; 20 14 24
B15_1b6c:		php				; 08 
B15_1b6d:		php				; 08 
B15_1b6e:		;removed
	.db $10 $08

B15_1b70:		bpl B15_1b8e ; 10 1c

func_1b72:
B15_1b72:		sta $0f			; 85 0f
B15_1b74:		lda #$48		; a9 48
B15_1b76:		jsr checkGlobalFlag		; 20 e9 e7
B15_1b79:		beq B15_1b7c ; f0 01

B15_1b7b:		rts				; 60 


B15_1b7c:		lda $0f			; a5 0f
B15_1b7e:		asl a			; 0a
B15_1b7f:		tay				; a8 
B15_1b80:		lda $fbf0, y	; b9 f0 fb
B15_1b83:		sta $00			; 85 00
B15_1b85:		lda $fbf1, y	; b9 f1 fb
B15_1b88:		sta $01			; 85 01
B15_1b8a:		ldy #$00		; a0 00
B15_1b8c:		lda $16			; a5 16
B15_1b8e:		clc				; 18 
B15_1b8f:		adc ($00), y	; 71 00
B15_1b91:		sta $02			; 85 02
B15_1b93:		iny				; c8 
B15_1b94:		lda $17			; a5 17
B15_1b96:		clc				; 18 
B15_1b97:		adc ($00), y	; 71 00
B15_1b99:		sta $03			; 85 03
B15_1b9b:		iny				; c8 
B15_1b9c:		lda $0506		; ad 06 05
B15_1b9f:		sec				; 38 
B15_1ba0:		sbc $02			; e5 02
B15_1ba2:		bcs B15_1ba9 ; b0 05

B15_1ba4:		eor #$ff		; 49 ff
B15_1ba6:		clc				; 18 
B15_1ba7:		adc #$02		; 69 02
B15_1ba9:		cmp ($00), y	; d1 00
B15_1bab:		bcs B15_1bef ; b0 42

B15_1bad:		iny				; c8 
B15_1bae:		lda $0507		; ad 07 05
B15_1bb1:		sec				; 38 
B15_1bb2:		sbc $03			; e5 03
B15_1bb4:		bcs B15_1bbb ; b0 05

B15_1bb6:		eor #$ff		; 49 ff
B15_1bb8:		clc				; 18 
B15_1bb9:		adc #$02		; 69 02
B15_1bbb:		cmp ($00), y	; d1 00
B15_1bbd:		bcs B15_1bef ; b0 30

B15_1bbf:		iny				; c8 
B15_1bc0:		lda $0506		; ad 06 05
B15_1bc3:		cmp $02			; c5 02
B15_1bc5:		beq B15_1bd5 ; f0 0e

B15_1bc7:		bcc B15_1bd5 ; 90 0c

B15_1bc9:		lda $0504		; ad 04 05
B15_1bcc:		bmi B15_1bd0 ; 30 02

B15_1bce:		bne B15_1bef ; d0 1f

B15_1bd0:		iny				; c8 
B15_1bd1:		iny				; c8 
B15_1bd2:		jmp $fbda		; 4c da fb


B15_1bd5:		lda $0504		; ad 04 05
B15_1bd8:		bmi B15_1bef ; 30 15

B15_1bda:		lda ($00), y	; b1 00
B15_1bdc:		clc				; 18 
B15_1bdd:		adc $11			; 65 11
B15_1bdf:		sta $0501		; 8d 01 05
B15_1be2:		iny				; c8 
B15_1be3:		lda ($00), y	; b1 00
B15_1be5:		adc $10			; 65 10
B15_1be7:		sta $0500		; 8d 00 05
B15_1bea:		lda #$00		; a9 00
B15_1bec:		sta $0504		; 8d 04 05
B15_1bef:		rts				; 60 


B15_1bf0:	.db $fc
B15_1bf1:	.db $fb
B15_1bf2:	.db $04
B15_1bf3:	.db $fc
B15_1bf4:	.db $0c
B15_1bf5:	.db $fc
B15_1bf6:	.db $0c
B15_1bf7:	.db $fc
B15_1bf8:	.db $14
B15_1bf9:	.db $fc
B15_1bfa:	.db $1c
B15_1bfb:	.db $fc
B15_1bfc:		.db $00				; 00
B15_1bfd:		php				; 08 
B15_1bfe:		asl $3010		; 0e 10 30
B15_1c01:	.db $ff
B15_1c02:		beq B15_1c04 ; f0 00

B15_1c04:		.db $00				; 00
B15_1c05:		.db $00				; 00
B15_1c06:	.db $14
B15_1c07:	.db $04
B15_1c08:		bne B15_1c08 ; d0 fe

B15_1c0a:		rti				; 40 


B15_1c0b:		ora ($00, x)	; 01 00
B15_1c0d:		php				; 08 
B15_1c0e:	.db $14
B15_1c0f:	.db $0c
B15_1c10:		bne B15_1c10 ; d0 fe

B15_1c12:		rti				; 40 


B15_1c13:		ora ($00, x)	; 01 00
B15_1c15:		.db $00				; 00
B15_1c16:	.db $14
B15_1c17:		;removed
	.db $10 $d0

B15_1c19:		inc $0140, x	; fe 40 01
B15_1c1c:		.db $00				; 00
B15_1c1d:		;removed
	.db $f0 $28

B15_1c1f:		rti				; 40 


B15_1c20:		bcc B15_1c1f ; 90 fd

B15_1c22:		;removed
	.db $90 $02


func_1c24:
B15_1c24:		sta $0519		; 8d 19 05

func_1c27:
B15_1c27:		lda #$60		; a9 60
B15_1c29:		sta $051a		; 8d 1a 05
B15_1c2c:		lda #$60		; a9 60
B15_1c2e:		sta $051c		; 8d 1c 05
B15_1c31:		lda $0509		; ad 09 05
B15_1c34:		ora #$10		; 09 10
B15_1c36:		sta $0509		; 8d 09 05
B15_1c39:		lda #$23		; a9 23
B15_1c3b:		jsr func_08fa		; 20 fa e8
B15_1c3e:		lda #$53		; a9 53
B15_1c40:		jmp unsetGlobalFlag		; 4c fc e7


pushLower2romBanks:
	txa
	pha
	ldx wRomBankPairsOnStack.w
	lda wBank_8000
	sta wRomBankStack_8000.w, x
	lda wBank_a000
	sta wRomBankStack_a000.w, x
	inc wRomBankPairsOnStack.w
	inc wRomBankPairsOnStack.w
	pla
	tax
	rts


pullAndSetLower2romBanks:
	txa
	pha
	dec wRomBankPairsOnStack.w
	dec wRomBankPairsOnStack.w
	ldx wRomBankPairsOnStack.w
	lda wRomBankStack_8000.w, x
	sta wBank_8000
	lda wRomBankStack_a000.w, x
	sta wBank_a000
	jsr swapLower2romBanks
	pla
	tax
	rts


drawStaticLayoutIdxedY:
	asl a
	tay
	jsr pushLower2romBanks
	lda #:drawStaticLayout
	jsr swapLower2romBanksIdxedA
	jsr drawStaticLayout
	jmp pullAndSetLower2romBanks


copyStaticLayoutIdxedYForNMIDataCopying:
	asl a
	tay
	jsr pushLower2romBanks
	lda #:copyStaticLayoutForNMIDataCopying
	jsr swapLower2romBanksIdxedA
	jsr copyStaticLayoutForNMIDataCopying
	jmp pullAndSetLower2romBanks


copyStaticLayoutIdxedYForNMIDataCopyingAtCurrPPUAddr:
	asl a
	tay
	jsr pushLower2romBanks
	lda #:copyStaticLayoutForNMIDataCopyingAtCurrPPUAddr
	jsr swapLower2romBanksIdxedA
	jsr copyStaticLayoutForNMIDataCopyingAtCurrPPUAddr
	jmp pullAndSetLower2romBanks


func_1ca6:
B15_1ca6:		ldx #$00		; a2 00
B15_1ca8:		lda $0200, x	; bd 00 02
B15_1cab:		cmp #$78		; c9 78
B15_1cad:		bcs B15_1cb4 ; b0 05

B15_1caf:		lda #$f8		; a9 f8
B15_1cb1:		sta $0200, x	; 9d 00 02
B15_1cb4:		inx				; e8 
B15_1cb5:		inx				; e8 
B15_1cb6:		inx				; e8 
B15_1cb7:		inx				; e8 
B15_1cb8:		bne B15_1ca8 ; d0 ee

B15_1cba:		lda #$00		; a9 00
B15_1cbc:		sta $0179		; 8d 79 01
B15_1cbf:		lda #$20		; a9 20
B15_1cc1:		sta $0d			; 85 0d
B15_1cc3:		lda #$c6		; a9 c6
B15_1cc5:		sta $0e			; 85 0e

B15_1cc7:		lda $7e			; a5 7e
B15_1cc9:		asl a			; 0a
B15_1cca:		tay				; a8 
B15_1ccb:		lda #$02		; a9 02
B15_1ccd:		sta $a8			; 85 a8
B15_1ccf:		jsr pushLower2romBanks		; 20 43 fc

B15_1cd2:		lda #$00		; a9 00
B15_1cd4:		jsr swapLower2romBanksIdxedA		; 20 0c fd
B15_1cd7:		jsr func_1_0880		; 20 80 a8

B15_1cda:		jmp pullAndSetLower2romBanks		; 4c 5b fc


drawStaticLayoutIdxedYAtCurrPPUAddr:
	asl a
	tay
	jsr pushLower2romBanks
	lda #:drawStaticLayoutAtCurrPPUAddr
	jsr swapLower2romBanksIdxedA
	jsr drawStaticLayoutAtCurrPPUAddr
	jmp pullAndSetLower2romBanks


B15_1ced:		asl a			; 0a
B15_1cee:		tay				; a8 
B15_1cef:		jsr pushLower2romBanks		; 20 43 fc
B15_1cf2:		lda #:func_6_00e4		; a9 06
B15_1cf4:		jsr swapLower2romBanksIdxedA		; 20 0c fd
B15_1cf7:		jsr func_6_00e4		; 20 e4 80
B15_1cfa:		jmp pullAndSetLower2romBanks		; 4c 5b fc


setrombank_a000:
	sta wBank_a000
	lda #BS_a000
	sta wBankSelect
	sta BANK_SELECT
	lda wBank_a000
	sta BANK_DATA
	rts


swapLower2romBanksIdxedA:
	sta wBank_8000
	clc
	adc #$01
	sta wBank_a000

swapLower2romBanks:
	lda #BS_8000
	sta wBankSelect
	sta BANK_SELECT
	lda wBank_8000
	sta BANK_DATA

	lda #BS_a000
	sta wBankSelect
	sta BANK_SELECT
	lda wBank_a000
	sta BANK_DATA

	rts


set_2KB_Chr_0:
	sta w2KBChrBank0
	lda #BS_2KB_CHR_0
	sta wBankSelect
	sta BANK_SELECT
	lda w2KBChrBank0
	sta BANK_DATA
.ifdef ROM_JP
	lda #$01
	sta $22
	sta $8000
	lda $42
	clc
	adc #$01
	sta $a000
.endif
	rts


set_2KB_Chr_1:
	sta w2KBChrBank1
	lda #BS_2KB_CHR_1
	sta wBankSelect
	sta BANK_SELECT
	lda w2KBChrBank1
	sta BANK_DATA
.ifdef ROM_JP
	lda #$03
	sta $22
	sta $8000
	lda $43
	clc
	adc #$01
	sta $a000
.endif
	rts


set_1KB_Chr_0:
	sta w1KBChrBank0
	lda #BS_1KB_CHR_0
	sta wBankSelect
	sta BANK_SELECT
	lda w1KBChrBank0
	sta BANK_DATA
	rts


set_1KB_Chr_1:
	sta w1KBChrBank1
	lda #BS_1KB_CHR_1
	sta wBankSelect
	sta BANK_SELECT
	lda w1KBChrBank1
	sta BANK_DATA
	rts


set_1KB_Chr_2:
	sta w1KBChrBank2
	lda #BS_1KB_CHR_2
	sta wBankSelect
	sta BANK_SELECT
	lda w1KBChrBank2
	sta BANK_DATA
	rts


set_1KB_Chr_3:
	sta w1KBChrBank3
	lda #BS_1KB_CHR_3
	sta wBankSelect
	sta BANK_SELECT
	lda w1KBChrBank3
	sta BANK_DATA
	rts


initBanksAndMirroring:
.ifndef ROM_JP
	sta IRQ_DISABLE
.endif
	lda #$00
	sta wScanlineIRQSetup

.ifndef ROM_JP
B15_1d8d:		ora #$80		; 09 80
.endif
B15_1d8f:		sta wShadow2KBChrBank0.w		; 8d 69 01
B15_1d92:		sta wShadow2KBChrBank1.w		; 8d 6a 01
B15_1d95:		sta wShadow1KBChrBank0.w		; 8d 6b 01
B15_1d98:		sta wShadow1KBChrBank1.w		; 8d 6c 01
B15_1d9b:		sta wShadow1KBChrBank2.w		; 8d 6d 01
B15_1d9e:		sta wShadow1KBChrBank3.w		; 8d 6e 01
// Unused? possibly shadow prg banks
B15_1da1:		sta $0167		; 8d 67 01
B15_1da4:		sta $0168		; 8d 68 01

.ifdef ROM_JP
B15_1e5b:		ldx #$00		; a2 00
-	stx wBankSelect			; 86 22
B15_1e5f:		stx BANK_SELECT		; 8e 00 80
B15_1e62:		lda initialBankData.w, x	; bd 6f fe
B15_1e65:		sta BANK_DATA		; 8d 00 a0
B15_1e68:		inx				; e8
B15_1e69:		cpx #$10		; e0 10
	bne -
.else
// set up initial bank selection for prg and chr
// 2 2kb banks at $1000-$1fff
// 4 1kb bank at $0000-$0fff
	ldx #$80
	ldy #$00
@nextBank:
	stx wBankSelect
	stx BANK_SELECT
	lda initialBankData.w, y
	sta BANK_DATA
	inx
	iny
	cpy #$08
	bne @nextBank

// vertical mirroring
	lda #$00
	sta NAMETABLE_MIRRORING

// set ppu addr 16 times, alternating between $1010 and $0000
B15_1dc1:		lda PPUSTATUS		; ad 02 20
B15_1dc4:		lda #$10		; a9 10
B15_1dc6:		tax				; aa 
-	sta PPUADDR		; 8d 06 20
B15_1dca:		sta PPUADDR		; 8d 06 20
B15_1dcd:		eor #$10		; 49 10
B15_1dcf:		dex				; ca 
	bne -
.endif

	cli
	rts

initialBankData:
.ifdef ROM_JP
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $1c $1d $1e $00 $00 $00 $00
.else
	// $8000 - bank c
	// $a000 - bank d
	.db $00 $00 $00 $00 $00 $00 $1c $1d
.endif


setScanlineIRQSetup:
.ifdef ROM_JP
	lda #$0d
	ldx #$00
	sta $22
	sta $8000
	stx $a000
	lda $28
	and #$0f
.else
	lda wScanlineIRQSetup
	and #$07
.endif

	asl a
	tay
	lda irqSetupFuncs.w, y
	sta wScanlineIRQSetupFuncAddr
	lda irqSetupFuncs.w+1, y
	sta wScanlineIRQSetupFuncAddr+1
	jmp (wScanlineIRQSetupFuncAddr)


irqSetupFuncs:
	.dw @none
	.dw @func1 // trigger IRQ func 4 at scanline val $a0
	.dw @func2 // trigger IRQ func 2->1->3 at scanline $0c
	.dw @func3 // trigger IRQ func 5->6->7 at scanline $2c

.ifdef ROM_JP
@func2:
	ldx #$0c
	stx $26
	ldy #$00
	sty $25
	lda #$0e
	sta $8000
	sty $a000
	lda #$0f
	sta $8000
	stx $a000
	ldx #$81
	lda #$0d
	sta $8000
	stx $a000
	lda #$02
	jsr $e166
	rts

@none:
	lda #$00
	jmp $e166

@func1:
	ldx #$50
	stx $26
	ldy #$00
	sty $25
	lda #$0e
	sta $8000
	sty $a000
	lda #$0f
	sta $8000
	stx $a000
	ldx #$81
	lda #$0d
	sta $8000
	stx $a000
	lda #$04
	jsr $e166
	rts

@func3:
	ldx #$1c
	stx $26
	ldy #$00
	sty $25
	lda #$0e
	sta $8000
	sty $a000
	lda #$0f
	sta $8000
	stx $a000
	ldx #$81
	lda #$0d
	sta $8000
	stx $a000
	lda #$05
	jsr $e166
	rts
.else
@func1:
	lda #$a0
	sta IRQ_LATCH		; 8d 00 c0
	sta IRQ_RELOAD		; 8d 01 c0
	sta IRQ_ENABLE		; 8d 01 e0
	lda #$04		; a9 04
	jsr setIRQVectorFunc		; 20 71 e1
	cli				; 58
	rts				; 60

@func2:
	lda #$0c		; a9 0c
	sta IRQ_LATCH		; 8d 00 c0
	sta IRQ_RELOAD		; 8d 01 c0
	sta IRQ_ENABLE		; 8d 01 e0
	lda #$02		; a9 02
	jsr setIRQVectorFunc		; 20 71 e1
	cli				; 58
	rts				; 60

@none:
	sta IRQ_DISABLE
	lda #$00
	jmp setIRQVectorFunc

@func3:
	lda #$2c		; a9 2c
	sta IRQ_LATCH		; 8d 00 c0
	sta IRQ_RELOAD		; 8d 01 c0
	sta IRQ_ENABLE		; 8d 01 e0
	lda #$05		; a9 05
	jsr setIRQVectorFunc		; 20 71 e1
	cli				; 58
	rts				; 60
.endif


setChrBankDataFromWram:
	lda wShadow2KBChrBank0.w
	jsr set_2KB_Chr_0
	lda wShadow2KBChrBank1.w
	jsr set_2KB_Chr_1
	lda wShadow1KBChrBank0.w
	jsr set_1KB_Chr_0
	lda wShadow1KBChrBank1.w
	jsr set_1KB_Chr_1
	lda wShadow1KBChrBank2.w
	jsr set_1KB_Chr_2
	lda wShadow1KBChrBank3.w
	jmp set_1KB_Chr_3


setNametableMirroringToVertical:
	lda #$00
.ifdef ROM_JP
	lda #$0c
	sta $8000
	stx $a000
.else
	sta NAMETABLE_MIRRORING
.endif
	rts 


// Unused?
setNametableMirroringToHorizontal:
	lda #$01
.ifdef ROM_JP
	lda #$0c
	sta $8000
	stx $a000
.else
	sta NAMETABLE_MIRRORING
.endif
	rts


.org $1ffa
	.dw nmiVector
	.dw resetVector
	.dw irqVector
