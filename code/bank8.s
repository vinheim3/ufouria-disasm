;OR8

// update sound?
func_8_0000:
B8_0000:		jmp func_8_0176		; 4c 76 81


// play?
B8_0003:		jmp func_8_00a5		; 4c a5 80


// init?
B8_0006:		jmp func_8_0009		; 4c 09 80


func_8_0009:
B8_0009:		lda #$1f		; a9 1f
B8_000b:		sta SND_CHN		; 8d 15 40

B8_000e:		lda #$00		; a9 00
B8_0010:		sta DMC_FREQ		; 8d 10 40
B8_0013:		ldx #$00		; a2 00
B8_0015:		lda #$00		; a9 00
B8_0017:		sta $0700, x	; 9d 00 07
B8_001a:		inx				; e8 
B8_001b:		bne B8_0017 ; d0 fa

func_8_001d:
B8_001d:		lda #$10		; a9 10
B8_001f:		sta SQ1_VOL		; 8d 00 40
B8_0022:		sta SQ2_VOL		; 8d 04 40
B8_0025:		sta NOISE_VOL		; 8d 0c 40
B8_0028:		lda #$00		; a9 00
B8_002a:		sta TRI_LINEAR		; 8d 08 40
B8_002d:		lda #$0f		; a9 0f
B8_002f:		sta SND_CHN		; 8d 15 40
B8_0032:		lda #$00		; a9 00
B8_0034:		ldx #$07		; a2 07
B8_0036:		sta $0702, x	; 9d 02 07
B8_0039:		dex				; ca 
B8_003a:		bpl B8_0036 ; 10 fa

B8_003c:		ldx #$01		; a2 01
B8_003e:		sta $07da, x	; 9d da 07
B8_0041:		dex				; ca 
B8_0042:		bpl B8_003e ; 10 fa

B8_0044:		rts				; 60 


func_8_0045:
B8_0045:		lda #$40		; a9 40
B8_0047:		ldx #$04		; a2 04
B8_0049:		sta $8d, x		; 95 8d
B8_004b:		dex				; ca 
B8_004c:		bpl B8_0049 ; 10 fb

B8_004e:		lda $0701		; ad 01 07
B8_0051:		eor #$ff		; 49 ff
B8_0053:		sta $0701		; 8d 01 07
B8_0056:		bmi B8_0081 ; 30 29

B8_0058:		ldx #$07		; a2 07
B8_005a:		lda $0702, x	; bd 02 07
B8_005d:		and #$04		; 29 04
B8_005f:		beq B8_0069 ; f0 08

B8_0061:		lda $0702, x	; bd 02 07
B8_0064:		ora #$80		; 09 80
B8_0066:		sta $0702, x	; 9d 02 07
B8_0069:		dex				; ca 
B8_006a:		bpl B8_005a ; 10 ee

B8_006c:		ldx #$01		; a2 01
B8_006e:		lda $07da, x	; bd da 07
B8_0071:		and #$04		; 29 04
B8_0073:		beq B8_007d ; f0 08

B8_0075:		lda $07da, x	; bd da 07
B8_0078:		ora #$80		; 09 80
B8_007a:		sta $07da, x	; 9d da 07
B8_007d:		dex				; ca 
B8_007e:		bpl B8_006e ; 10 ee

B8_0080:		rts				; 60 

B8_0081:		ldx #$07		; a2 07
B8_0083:		lda $0702, x	; bd 02 07
B8_0086:		bpl B8_008f ; 10 07

B8_0088:		ora #$04		; 09 04
B8_008a:		and #$7f		; 29 7f
B8_008c:		sta $0702, x	; 9d 02 07
B8_008f:		dex				; ca 
B8_0090:		bpl B8_0083 ; 10 f1

B8_0092:		ldx #$01		; a2 01
B8_0094:		lda $07da, x	; bd da 07
B8_0097:		bpl B8_00a0 ; 10 07

B8_0099:		ora #$04		; 09 04
B8_009b:		and #$7f		; 29 7f
B8_009d:		sta $07da, x	; 9d da 07
B8_00a0:		dex				; ca 
B8_00a1:		bpl B8_0094 ; 10 f1

B8_00a3:		rts				; 60 


B8_00a4:		rts				; 60

func_8_00a5:
B8_00a5:		cmp #$ff		; c9 ff
B8_00a7:		bne B8_00ac ; d0 03

B8_00a9:		jmp func_8_0045		; 4c 45 80

B8_00ac:		asl a			; 0a
B8_00ad:		tax				; aa 
B8_00ae:		lda $8966, x	; bd 66 89
B8_00b1:		sta $83			; 85 83
B8_00b3:		lda $8967, x	; bd 67 89
B8_00b6:		sta $84			; 85 84
B8_00b8:		ldy #$00		; a0 00

func_8_00ba:
B8_00ba:		lda ($83), y	; b1 83
B8_00bc:		bmi B8_00a4 ; 30 e6

B8_00be:		tax				; aa 
B8_00bf:		sec				; 38 
B8_00c0:		sbc #$08		; e9 08
B8_00c2:		bcs B8_0122 ; b0 5e

B8_00c4:		iny				; c8 
B8_00c5:		lda ($83), y	; b1 83
B8_00c7:		cmp $071a, x	; dd 1a 07
B8_00ca:		beq B8_00d7 ; f0 0b

B8_00cc:		sty $85			; 84 85
B8_00ce:		tay				; a8 
B8_00cf:		lda #$40		; a9 40
B8_00d1:		sta $8d.w, y
B8_00d4:		tya				; 98 
B8_00d5:		ldy $85			; a4 85
B8_00d7:		iny				; c8 
B8_00d8:		sta $071a, x	; 9d 1a 07
B8_00db:		lda ($83), y	; b1 83
B8_00dd:		sta $070a, x	; 9d 0a 07
B8_00e0:		iny				; c8 
B8_00e1:		lda ($83), y	; b1 83
B8_00e3:		sta $0712, x	; 9d 12 07
B8_00e6:		iny				; c8 
B8_00e7:		lda #$80		; a9 80
B8_00e9:		sta $0702, x	; 9d 02 07
B8_00ec:		sta $077a, x	; 9d 7a 07
B8_00ef:		lda #$01		; a9 01
B8_00f1:		sta $0722, x	; 9d 22 07
B8_00f4:		lda #$00		; a9 00
B8_00f6:		sta $0752, x	; 9d 52 07
B8_00f9:		sta $072a, x	; 9d 2a 07
B8_00fc:		sta $0742, x	; 9d 42 07
B8_00ff:		sta $074a, x	; 9d 4a 07
B8_0102:		sta $0762, x	; 9d 62 07
B8_0105:		sta $075a, x	; 9d 5a 07
B8_0108:		sta $07ba, x	; 9d ba 07
B8_010b:		sta $073a, x	; 9d 3a 07
B8_010e:		lda #$08		; a9 08
B8_0110:		sta $07b2, x	; 9d b2 07
B8_0113:		lda $071a, x	; bd 1a 07
B8_0116:		cmp #$02		; c9 02
B8_0118:		bne func_8_00ba ; d0 a0

B8_011a:		lda #$00		; a9 00
B8_011c:		sta $07b2, x	; 9d b2 07
B8_011f:		jmp func_8_00ba		; 4c ba 80

B8_0122:		tax				; aa 
B8_0123:		iny				; c8 
B8_0124:		lda ($83), y	; b1 83
B8_0126:		sta $07dc, x	; 9d dc 07
B8_0129:		iny				; c8 
B8_012a:		lda ($83), y	; b1 83
B8_012c:		sta $07de, x	; 9d de 07
B8_012f:		iny				; c8 
B8_0130:		lda #$80		; a9 80
B8_0132:		sta $07da, x	; 9d da 07
B8_0135:		lda #$01		; a9 01
B8_0137:		sta $07e0, x	; 9d e0 07
B8_013a:		lda #$00		; a9 00
B8_013c:		sta $07e2, x	; 9d e2 07
B8_013f:		sta $07e8, x	; 9d e8 07
B8_0142:		sta $07ea, x	; 9d ea 07
B8_0145:		sta $07e6, x	; 9d e6 07
B8_0148:		jmp func_8_00ba		; 4c ba 80


func_8_014b:
B8_014b:		ldx #$10		; a2 10
B8_014d:		ldy #$00		; a0 00
B8_014f:		lda $8d			; a5 8d
B8_0151:		bmi B8_0156 ; 30 03

B8_0153:		stx SQ1_VOL		; 8e 00 40
B8_0156:		sty $8d			; 84 8d
B8_0158:		lda $8e			; a5 8e
B8_015a:		bmi B8_015f ; 30 03

B8_015c:		stx SQ2_VOL		; 8e 04 40
B8_015f:		sty $8e			; 84 8e
B8_0161:		lda $8f			; a5 8f
B8_0163:		bmi B8_0168 ; 30 03

B8_0165:		sty TRI_LINEAR		; 8c 08 40
B8_0168:		sty $8f			; 84 8f
B8_016a:		lda $90			; a5 90
B8_016c:		bmi B8_0171 ; 30 03

B8_016e:		stx NOISE_VOL		; 8e 0c 40
B8_0171:		sty $90			; 84 90
B8_0173:		jmp func_8_07c1		; 4c c1 87


func_8_0176:
B8_0176:		lda $81			; a5 81
B8_0178:		beq B8_0197 ; f0 1d

B8_017a:		bpl B8_017f ; 10 03

B8_017c:		jsr func_8_0045		; 20 45 80
B8_017f:		lda $81			; a5 81
B8_0181:		and #$02		; 29 02
B8_0183:		beq B8_0188 ; f0 03

B8_0185:		jsr func_8_001d		; 20 1d 80
B8_0188:		lda $81			; a5 81
B8_018a:		and #$01		; 29 01
B8_018c:		beq B8_0193 ; f0 05

B8_018e:		lda $80			; a5 80
B8_0190:		jsr func_8_00a5		; 20 a5 80
B8_0193:		lda #$00		; a9 00
B8_0195:		sta $81			; 85 81
B8_0197:		ldx #$08		; a2 08

func_8_0199:
B8_0199:		dex				; ca 
B8_019a:		bmi func_8_014b ; 30 af

B8_019c:		lda $0702, x	; bd 02 07
B8_019f:		sta $82			; 85 82
B8_01a1:		bpl B8_0199 ; 10 f6

B8_01a3:		ldy $071a, x	; bc 1a 07
B8_01a6:		lda $8d.w, y
B8_01a9:		sta $8c			; 85 8c
B8_01ab:		and #$40		; 29 40
B8_01ad:		ora $82			; 05 82
B8_01af:		sta $82			; 85 82
B8_01b1:		lda $8c			; a5 8c
B8_01b3:		ora #$80		; 09 80
B8_01b5:		sta $8d.w, y
B8_01b8:		lda $070a, x	; bd 0a 07
B8_01bb:		sta $83			; 85 83
B8_01bd:		lda $0712, x	; bd 12 07
B8_01c0:		sta $84			; 85 84
B8_01c2:		ldy #$00		; a0 00
B8_01c4:		dec $0722, x	; de 22 07
B8_01c7:		bne B8_01e0 ; d0 17

func_8_01c9:
B8_01c9:		lda ($83), y	; b1 83
B8_01cb:		bpl B8_0222 ; 10 55

// a >= $80, assume >= $e0
B8_01cd:		iny				; c8 
B8_01ce:		stx $86			; 86 86
B8_01d0:		tax				; aa 
B8_01d1:		lda data_8_0415_lo.w-$e0, x	; bd 55 83
B8_01d4:		sta $85			; 85 85
B8_01d6:		lda data_8_0415_hi.w-$e0, x	; bd 35 83
B8_01d9:		ldx $86			; a6 86
B8_01db:		sta $86			; 85 86
B8_01dd:		jmp ($85)

B8_01e0:		lda $0792, x	; bd 92 07
B8_01e3:		bmi B8_0209 ; 30 24

B8_01e5:		lda $0752, x	; bd 52 07
B8_01e8:		cmp $0722, x	; dd 22 07
B8_01eb:		bne B8_0209 ; d0 1c

B8_01ed:		lda $82			; a5 82
B8_01ef:		and #$20		; 29 20
B8_01f1:		bne B8_0209 ; d0 16

B8_01f3:		lda $078a, x	; bd 8a 07
B8_01f6:		beq B8_0209 ; f0 11

B8_01f8:		sta $86			; 85 86
B8_01fa:		lda $0782, x	; bd 82 07
B8_01fd:		sta $85			; 85 85
B8_01ff:		ldy #$00		; a0 00
B8_0201:		lda ($85), y	; b1 85
B8_0203:		sta $0792, x	; 9d 92 07
B8_0206:		jmp func_8_029c		; 4c 9c 82

B8_0209:		lda ($83), y	; b1 83
B8_020b:		cmp #$f5		; c9 f5
B8_020d:		bcc B8_0206 ; 90 f7

// a == f5+
B8_020f:		iny				; c8 
B8_0210:		stx $86			; 86 86
B8_0212:		tax				; aa 
B8_0213:		lda data_8_062f_lo.w-$f5, x	; bd 45 85
B8_0216:		sta $85			; 85 85
B8_0218:		lda data_8_062f_hi.w-$f5, x	; bd 3a 85
B8_021b:		ldx $86			; a6 86
B8_021d:		sta $86			; 85 86
B8_021f:		jmp ($85)

B8_0222:		iny				; c8 
B8_0223:		sty $85			; 84 85
B8_0225:		clc				; 18 
B8_0226:		adc $0762, x	; 7d 62 07
B8_0229:		sta $076a, x	; 9d 6a 07
B8_022c:		ldy $071a, x	; bc 1a 07
B8_022f:		cpy #$03		; c0 03
B8_0231:		beq B8_0245 ; f0 12

B8_0233:		tay				; a8 
B8_0234:		lda data_8_06f5_lo.w, y	; b9 5b 87
B8_0237:		adc $077a, x	; 7d 7a 07
B8_023a:		sta $076a, x	; 9d 6a 07
B8_023d:		lda data_8_06f5_hi.w, y	; b9 f5 86
B8_0240:		adc #$00		; 69 00
B8_0242:		sta $0772, x	; 9d 72 07
B8_0245:		ldy $85			; a4 85
B8_0247:		lda $82			; a5 82
B8_0249:		and #$40		; 29 40
B8_024b:		bne B8_0257 ; d0 0a

B8_024d:		lda $82			; a5 82
B8_024f:		ora #$40		; 09 40
B8_0251:		sta $82			; 85 82
B8_0253:		and #$20		; 29 20
B8_0255:		bne func_8_026d ; d0 16

B8_0257:		lda #$00		; a9 00
B8_0259:		sta $07c2, x	; 9d c2 07
B8_025c:		lda $07ca, x	; bd ca 07
B8_025f:		sta $07d2, x	; 9d d2 07
B8_0262:		lda #$01		; a9 01
B8_0264:		sta $0792, x	; 9d 92 07
B8_0267:		lda $0782, x	; bd 82 07
B8_026a:		sta $079a, x	; 9d 9a 07

func_8_026d:
B8_026d:		lda $072a, x	; bd 2a 07
B8_0270:		bne B8_0275 ; d0 03

B8_0272:		lda ($83), y	; b1 83
B8_0274:		iny				; c8 
B8_0275:		sta $0722, x	; 9d 22 07
B8_0278:		lda $075a, x	; bd 5a 07
B8_027b:		beq B8_0290 ; f0 13

B8_027d:		asl a			; 0a
B8_027e:		cmp $0722, x	; dd 22 07
B8_0281:		bcc B8_028a ; 90 07

B8_0283:		lda $0722, x	; bd 22 07
B8_0286:		lsr a			; 4a
	jmp +

B8_028a:		lda $075a, x	; bd 5a 07
+	sta $0752, x	; 9d 52 07

func_8_0290:
B8_0290:		tya				; 98 
B8_0291:		clc				; 18 
B8_0292:		adc $83			; 65 83
B8_0294:		sta $070a, x	; 9d 0a 07
B8_0297:		bcc func_8_029c ; 90 03

B8_0299:		inc $0712, x	; fe 12 07

func_8_029c:
B8_029c:		lda $076a, x	; bd 6a 07
B8_029f:		sta $89			; 85 89
B8_02a1:		lda $0772, x	; bd 72 07
B8_02a4:		sta $8a			; 85 8a
B8_02a6:		lda $07ba, x	; bd ba 07
B8_02a9:		beq B8_02cd ; f0 22

B8_02ab:		sta $86			; 85 86
B8_02ad:		lda $07d2, x	; bd d2 07
B8_02b0:		bne B8_0317 ; d0 65

B8_02b2:		lda $07b2, x	; bd b2 07
B8_02b5:		sta $85			; 85 85
B8_02b7:		ldy $07c2, x	; bc c2 07
B8_02ba:		lda $82			; a5 82
B8_02bc:		and #$08		; 29 08
B8_02be:		bne B8_0321 ; d0 61

@loop_02c0:
B8_02c0:		lda ($85), y	; b1 85
B8_02c2:		bpl B8_02c9 ; 10 05

B8_02c4:		sta $88			; 85 88
B8_02c6:		jmp func_8_034b		; 4c 4b 83

B8_02c9:		tay				; a8 
B8_02ca:		jmp B8_02c0		; @loop_02c0

B8_02cd:		lda $071a, x	; bd 1a 07
B8_02d0:		cmp #$02		; c9 02
B8_02d2:		beq B8_02dc ; f0 08

B8_02d4:		lda $07b2, x	; bd b2 07
B8_02d7:		sta $88			; 85 88
B8_02d9:		jmp func_8_0350		; 4c 50 83

B8_02dc:		lda $82			; a5 82
B8_02de:		ora #$08		; 09 08
B8_02e0:		sta $82			; 85 82
B8_02e2:		lda $07b2, x	; bd b2 07
B8_02e5:		bmi B8_02ff ; 30 18

B8_02e7:		clc				; 18 
B8_02e8:		adc $89			; 65 89
B8_02ea:		sta $89			; 85 89
B8_02ec:		sta $076a, x	; 9d 6a 07
B8_02ef:		bcc B8_0350 ; 90 5f

B8_02f1:		inc $8a			; e6 8a
B8_02f3:		inc $0772, x	; fe 72 07

@loop_02f6:
B8_02f6:		lda $82			; a5 82
B8_02f8:		ora #$40		; 09 40
B8_02fa:		sta $82			; 85 82
B8_02fc:		jmp func_8_0350		; 4c 50 83

B8_02ff:		and #$7f		; 29 7f
B8_0301:		sta $85			; 85 85
B8_0303:		lda $89			; a5 89
B8_0305:		sec				; 38 
B8_0306:		sbc $85			; e5 85
B8_0308:		sta $85			; 85 85
B8_030a:		sta $076a, x	; 9d 6a 07
B8_030d:		bcs B8_0350 ; b0 41

B8_030f:		dec $8a			; c6 8a
B8_0311:		dec $0772, x	; de 72 07
B8_0314:		jmp B8_02f6		; @loop_02f6

B8_0317:		lda #$08		; a9 08
B8_0319:		sta $88			; 85 88
B8_031b:		dec $07d2, x	; de d2 07
B8_031e:		jmp func_8_0350		; 4c 50 83

B8_0321:		lda #$08		; a9 08
B8_0323:		sta $88			; 85 88

@loop_0325:
B8_0325:		lda ($85), y	; b1 85
B8_0327:		bmi B8_0333 ; 30 0a

B8_0329:		clc				; 18 
B8_032a:		adc $89			; 65 89
B8_032c:		bcc B8_0349 ; 90 1b

B8_032e:		lda #$ff		; a9 ff
B8_0330:		jmp func_8_0349		; 4c 49 83

B8_0333:		and #$7f		; 29 7f
B8_0335:		bne B8_033e ; d0 07

B8_0337:		iny				; c8 
B8_0338:		lda ($85), y	; b1 85
B8_033a:		tay				; a8 
B8_033b:		jmp B8_0325		; @loop_0325

B8_033e:		sta $85			; 85 85
B8_0340:		lda $89			; a5 89
B8_0342:		sec				; 38 
B8_0343:		sbc $85			; e5 85
B8_0345:		bcs B8_0349 ; b0 02

B8_0347:		lda #$00		; a9 00

func_8_0349:
B8_0349:		sta $89			; 85 89

func_8_034b:
B8_034b:		iny				; c8 
B8_034c:		tya				; 98 
B8_034d:		sta $07c2, x	; 9d c2 07

func_8_0350:
B8_0350:		lda $078a, x	; bd 8a 07
B8_0353:		beq B8_03ab ; f0 56

B8_0355:		sta $86			; 85 86
B8_0357:		ldy $0792, x	; bc 92 07
B8_035a:		beq B8_038a ; f0 2e

B8_035c:		bmi B8_038a ; 30 2c

B8_035e:		lda $0782, x	; bd 82 07
B8_0361:		sta $85			; 85 85

@loop_0363:
B8_0363:		lda ($85), y	; b1 85
B8_0365:		beq B8_0374 ; f0 0d

B8_0367:		sta $079a, x	; 9d 9a 07
B8_036a:		sta $87			; 85 87
B8_036c:		iny				; c8 
B8_036d:		tya				; 98 
B8_036e:		sta $0792, x	; 9d 92 07
B8_0371:		jmp func_8_03b3		; 4c b3 83

B8_0374:		iny				; c8 
B8_0375:		lda ($85), y	; b1 85
B8_0377:		bmi B8_037d ; 30 04

B8_0379:		tay				; a8 
B8_037a:		jmp B8_0363		; @loop_0363

B8_037d:		and #$7f		; 29 7f
B8_037f:		sta $07a2, x	; 9d a2 07
B8_0382:		sta $07aa, x	; 9d aa 07
B8_0385:		lda #$00		; a9 00
B8_0387:		sta $0792, x	; 9d 92 07
B8_038a:		dec $07aa, x	; de aa 07
B8_038d:		bne B8_03ab ; d0 1c

B8_038f:		lda $079a, x	; bd 9a 07
B8_0392:		and #$0f		; 29 0f
B8_0394:		beq B8_03ab ; f0 15

B8_0396:		sec				; 38 
B8_0397:		sbc #$01		; e9 01
B8_0399:		sta $85			; 85 85
B8_039b:		lda $07a2, x	; bd a2 07
B8_039e:		sta $07aa, x	; 9d aa 07
B8_03a1:		lda $079a, x	; bd 9a 07
B8_03a4:		and #$f0		; 29 f0
B8_03a6:		ora $85			; 05 85
	jmp +

B8_03ab:		lda $079a, x	; bd 9a 07
+	sta $079a, x	; 9d 9a 07
B8_03b1:		sta $87			; 85 87

func_8_03b3:
B8_03b3:		lda $8c			; a5 8c
B8_03b5:		bmi func_8_040b ; 30 54

B8_03b7:		lda $071a, x	; bd 1a 07
B8_03ba:		asl a			; 0a
B8_03bb:		asl a			; 0a
B8_03bc:		tay				; a8 
B8_03bd:		cmp #$08		; c9 08
B8_03bf:		bne B8_03e5 ; d0 24

// actually load the sound registers
B8_03c1:		lda $87			; a5 87
B8_03c3:		sta $4000, y	; 99 00 40
B8_03c6:		lda $82			; a5 82
B8_03c8:		and #$02		; 29 02
B8_03ca:		bne B8_03dd ; d0 11

B8_03cc:		lda $82			; a5 82
B8_03ce:		and #$48		; 29 48
B8_03d0:		beq B8_03e2 ; f0 10

B8_03d2:		and #$40		; 29 40
B8_03d4:		beq B8_03dd ; f0 07

B8_03d6:		lda $8a			; a5 8a
B8_03d8:		ora #$08		; 09 08
B8_03da:		sta $4003, y	; 99 03 40
B8_03dd:		lda $89			; a5 89
B8_03df:		sta $4002, y	; 99 02 40
B8_03e2:		jmp $840b		; 4c 0b 84

B8_03e5:		lda $87			; a5 87
B8_03e7:		sta SQ1_VOL, y	; 99 00 40
B8_03ea:		lda $88			; a5 88
B8_03ec:		sta $4001, y	; 99 01 40
B8_03ef:		lda $82			; a5 82
B8_03f1:		and #$02		; 29 02
B8_03f3:		bne B8_0406 ; d0 11

B8_03f5:		lda $82			; a5 82
B8_03f7:		and #$48		; 29 48
B8_03f9:		beq func_8_040b ; f0 10

B8_03fb:		and #$40		; 29 40
B8_03fd:		beq B8_0406 ; f0 07

B8_03ff:		lda $8a			; a5 8a
B8_0401:		ora #$08		; 09 08
B8_0403:		sta $4003, y	; 99 03 40
B8_0406:		lda $89			; a5 89
B8_0408:		sta $4002, y	; 99 02 40

func_8_040b:
B8_040b:		lda $82			; a5 82
B8_040d:		and #$bf		; 29 bf
B8_040f:		sta $0702, x	; 9d 02 07
B8_0412:		jmp func_8_0199		; 4c 99 81

data_8_0415_hi:
	.db >func_8_0455
	.db >func_8_0455
	.db >func_8_0455
	.db >func_8_045e
	.db >func_8_0467
	.db >func_8_0470
	.db >func_8_0479
	.db >func_8_0498
	.db >func_8_04b3
	.db >func_8_04ce
	.db >func_8_04d7
	.db >func_8_04eb
	.db >func_8_04ff
	.db >func_8_0513
	.db >func_8_0524
	.db >func_8_0532
	.db >func_8_053d
	.db >func_8_0551
	.db >func_8_056d
	.db >func_8_0570
	.db >func_8_0570
	.db >func_8_0570
	.db >func_8_0579
	.db >func_8_0582
	.db >func_8_058a
	.db >func_8_0593
	.db >func_8_059c
	.db >func_8_05b4
	.db >func_8_05c4
	.db >func_8_05d9
	.db >func_8_0604
	.db >func_8_062f // invalid

data_8_0415_lo:
	.db <func_8_0455
	.db <func_8_0455
	.db <func_8_0455
	.db <func_8_045e
	.db <func_8_0467
	.db <func_8_0470
	.db <func_8_0479
	.db <func_8_0498
	.db <func_8_04b3
	.db <func_8_04ce
	.db <func_8_04d7
	.db <func_8_04eb
	.db <func_8_04ff
	.db <func_8_0513
	.db <func_8_0524
	.db <func_8_0532
	.db <func_8_053d
	.db <func_8_0551
	.db <func_8_056d
	.db <func_8_0570
	.db <func_8_0570
	.db <func_8_0570
	.db <func_8_0579
	.db <func_8_0582
	.db <func_8_058a
	.db <func_8_0593
	.db <func_8_059c
	.db <func_8_05b4
	.db <func_8_05c4
	.db <func_8_05d9
	.db <func_8_0604
	.db <func_8_062f

func_8_0455:
B8_0455:		lda ($83), y	; b1 83
B8_0457:		sta $07ca, x	; 9d ca 07
B8_045a:		iny				; c8 
B8_045b:		jmp func_8_01c9		; 4c c9 81

func_8_045e:
B8_045e:		lda $82			; a5 82
B8_0460:		and #$fd		; 29 fd
B8_0462:		sta $82			; 85 82
B8_0464:		jmp func_8_01c9		; 4c c9 81

func_8_0467:
B8_0467:		lda $82			; a5 82
B8_0469:		ora #$02		; 09 02
B8_046b:		sta $82			; 85 82
B8_046d:		jmp func_8_01c9		; 4c c9 81

func_8_0470:
B8_0470:		lda $82			; a5 82
B8_0472:		and #$df		; 29 df
B8_0474:		sta $82			; 85 82
B8_0476:		jmp func_8_01c9		; 4c c9 81

func_8_0479:
B8_0479:		lda $82			; a5 82
B8_047b:		and #$f7		; 29 f7
B8_047d:		sta $82			; 85 82
B8_047f:		lda #$00		; a9 00
B8_0481:		sta $07ba, x	; 9d ba 07
B8_0484:		lda #$08		; a9 08
B8_0486:		sta $07b2, x	; 9d b2 07
B8_0489:		lda $071a, x	; bd 1a 07
B8_048c:		cmp #$02		; c9 02
B8_048e:		bne B8_0495 ; d0 05

B8_0490:		lda #$00		; a9 00
B8_0492:		sta $07b2, x	; 9d b2 07
B8_0495:		jmp func_8_01c9		; 4c c9 81

func_8_0498:
B8_0498:		lda $82			; a5 82
B8_049a:		ora #$08		; 09 08
B8_049c:		sta $82			; 85 82
B8_049e:		lda ($83), y	; b1 83
B8_04a0:		sta $07ca, x	; 9d ca 07
B8_04a3:		iny				; c8 
B8_04a4:		lda ($83), y	; b1 83
B8_04a6:		sta $07b2, x	; 9d b2 07
B8_04a9:		iny				; c8 
B8_04aa:		lda ($83), y	; b1 83
B8_04ac:		sta $07ba, x	; 9d ba 07
B8_04af:		iny				; c8 
B8_04b0:		jmp func_8_01c9		; 4c c9 81

func_8_04b3:
B8_04b3:		lda $82			; a5 82
B8_04b5:		and #$f7		; 29 f7
B8_04b7:		sta $82			; 85 82
B8_04b9:		lda ($83), y	; b1 83
B8_04bb:		sta $07ca, x	; 9d ca 07
B8_04be:		iny				; c8 
B8_04bf:		lda ($83), y	; b1 83
B8_04c1:		sta $07b2, x	; 9d b2 07
B8_04c4:		iny				; c8 
B8_04c5:		lda ($83), y	; b1 83
B8_04c7:		sta $07ba, x	; 9d ba 07
B8_04ca:		iny				; c8 
B8_04cb:		jmp func_8_01c9		; 4c c9 81

func_8_04ce:
B8_04ce:		lda $82			; a5 82
B8_04d0:		ora #$60		; 09 60
B8_04d2:		sta $82			; 85 82
B8_04d4:		jmp func_8_01c9		; 4c c9 81

func_8_04d7:
B8_04d7:		lda ($83), y	; b1 83
B8_04d9:		sta $0782, x	; 9d 82 07
B8_04dc:		iny				; c8 
B8_04dd:		lda ($83), y	; b1 83
B8_04df:		sta $078a, x	; 9d 8a 07
B8_04e2:		lda #$01		; a9 01
B8_04e4:		sta $0792, x	; 9d 92 07
B8_04e7:		iny				; c8 
B8_04e8:		jmp func_8_01c9		; 4c c9 81

func_8_04eb:
B8_04eb:		lda $82			; a5 82
B8_04ed:		and #$f7		; 29 f7
B8_04ef:		sta $82			; 85 82
B8_04f1:		lda #$00		; a9 00
B8_04f3:		sta $07ba, x	; 9d ba 07
B8_04f6:		lda ($83), y	; b1 83
B8_04f8:		sta $07b2, x	; 9d b2 07
B8_04fb:		iny				; c8 
B8_04fc:		jmp func_8_01c9		; 4c c9 81

func_8_04ff:
B8_04ff:		lda #$00		; a9 00
B8_0501:		sta $078a, x	; 9d 8a 07
B8_0504:		sta $0792, x	; 9d 92 07
B8_0507:		lda ($83), y	; b1 83
B8_0509:		sta $0782, x	; 9d 82 07
B8_050c:		sta $079a, x	; 9d 9a 07
B8_050f:		iny				; c8 
B8_0510:		jmp func_8_01c9		; 4c c9 81

func_8_0513:
B8_0513:		lda ($83), y	; b1 83
B8_0515:		sta $07a2, x	; 9d a2 07
B8_0518:		sta $07aa, x	; 9d aa 07
B8_051b:		iny				; c8 
B8_051c:		lda #$ff		; a9 ff
B8_051e:		sta $0792, x	; 9d 92 07
B8_0521:		jmp func_8_026d		; 4c 6d 82

func_8_0524:
B8_0524:		lda #$00		; a9 00
B8_0526:		sta $075a, x	; 9d 5a 07
B8_0529:		lda ($83), y	; b1 83
B8_052b:		sta $0752, x	; 9d 52 07
B8_052e:		iny				; c8 
B8_052f:		jmp func_8_01c9		; 4c c9 81

func_8_0532:
B8_0532:		lda #$00		; a9 00
B8_0534:		sta $0752, x	; 9d 52 07
B8_0537:		sta $075a, x	; 9d 5a 07
B8_053a:		jmp func_8_01c9		; 4c c9 81

func_8_053d:
B8_053d:		lda #$00		; a9 00
B8_053f:		sta $0702, x	; 9d 02 07
B8_0542:		lda $8c			; a5 8c
B8_0544:		bmi B8_054e ; 30 08

B8_0546:		ldy $071a, x	; bc 1a 07
B8_0549:		lda #$40		; a9 40
B8_054b:		sta $8d.w, y
B8_054e:		jmp func_8_0199		; 4c 99 81

func_8_0551:
B8_0551:		lda #$ff		; a9 ff
B8_0553:		sta $0792, x	; 9d 92 07
B8_0556:		lda $071a, x	; bd 1a 07
B8_0559:		cmp #$02		; c9 02
B8_055b:		beq B8_0565 ; f0 08

B8_055d:		lda #$10		; a9 10
B8_055f:		sta $079a, x	; 9d 9a 07
B8_0562:		jmp func_8_026d		; 4c 6d 82

B8_0565:		lda #$00		; a9 00
B8_0567:		sta $079a, x	; 9d 9a 07
B8_056a:		jmp func_8_026d		; 4c 6d 82

func_8_056d:
B8_056d:		jmp func_8_026d		; 4c 6d 82

func_8_0570:
B8_0570:		lda ($83), y	; b1 83
B8_0572:		sta $075a, x	; 9d 5a 07
B8_0575:		iny				; c8 
B8_0576:		jmp func_8_01c9		; 4c c9 81

func_8_0579:
B8_0579:		lda ($83), y	; b1 83
B8_057b:		sta $072a, x	; 9d 2a 07
B8_057e:		iny				; c8 
B8_057f:		jmp func_8_01c9		; 4c c9 81

func_8_0582:
B8_0582:		lda #$00		; a9 00
B8_0584:		sta $072a, x	; 9d 2a 07
B8_0587:		jmp func_8_01c9		; 4c c9 81

func_8_058a:
B8_058a:		lda ($83), y	; b1 83
B8_058c:		sta $077a, x	; 9d 7a 07
B8_058f:		iny				; c8 
B8_0590:		jmp func_8_01c9		; 4c c9 81

func_8_0593:
B8_0593:		lda ($83), y	; b1 83
B8_0595:		sta $0762, x	; 9d 62 07
B8_0598:		iny				; c8 
B8_0599:		jmp func_8_01c9		; 4c c9 81

func_8_059c:
B8_059c:		lda $073a, x	; bd 3a 07
B8_059f:		beq B8_05d6 ; f0 35

B8_05a1:		sta $84			; 85 84
B8_05a3:		sta $0712, x	; 9d 12 07
B8_05a6:		lda $0732, x	; bd 32 07
B8_05a9:		sta $83			; 85 83
B8_05ab:		ldy #$00		; a0 00
B8_05ad:		tya				; 98 
B8_05ae:		sta $073a, x	; 9d 3a 07
B8_05b1:		jmp func_8_01c9		; 4c c9 81

func_8_05b4:
B8_05b4:		tya				; 98 
B8_05b5:		clc				; 18 
B8_05b6:		adc #$02		; 69 02
B8_05b8:		adc $83			; 65 83
B8_05ba:		sta $0732, x	; 9d 32 07
B8_05bd:		lda $84			; a5 84
B8_05bf:		adc #$00		; 69 00
B8_05c1:		sta $073a, x	; 9d 3a 07

func_8_05c4:
B8_05c4:		lda ($83), y	; b1 83
B8_05c6:		sta $85			; 85 85
B8_05c8:		iny				; c8 
B8_05c9:		lda ($83), y	; b1 83
B8_05cb:		sta $0712, x	; 9d 12 07
B8_05ce:		sta $84			; 85 84
B8_05d0:		lda $85			; a5 85
B8_05d2:		sta $83			; 85 83
B8_05d4:		ldy #$00		; a0 00
B8_05d6:		jmp func_8_01c9		; 4c c9 81

func_8_05d9:
B8_05d9:		lda $074a, x	; bd 4a 07
B8_05dc:		beq B8_05e9 ; f0 0b

B8_05de:		dec $074a, x	; de 4a 07
B8_05e1:		bne B8_05ee ; d0 0b

B8_05e3:		iny				; c8 
B8_05e4:		iny				; c8 
B8_05e5:		iny				; c8 
B8_05e6:		jmp func_8_01c9		; 4c c9 81

B8_05e9:		lda ($83), y	; b1 83
B8_05eb:		sta $074a, x	; 9d 4a 07
B8_05ee:		iny				; c8 
B8_05ef:		lda ($83), y	; b1 83
B8_05f1:		sta $85			; 85 85
B8_05f3:		iny				; c8 
B8_05f4:		lda ($83), y	; b1 83
B8_05f6:		sta $0712, x	; 9d 12 07
B8_05f9:		sta $84			; 85 84
B8_05fb:		lda $85			; a5 85
B8_05fd:		sta $83			; 85 83
B8_05ff:		ldy #$00		; a0 00
B8_0601:		jmp func_8_01c9		; 4c c9 81

func_8_0604:
B8_0604:		lda $0742, x	; bd 42 07
B8_0607:		beq B8_0614 ; f0 0b

B8_0609:		dec $0742, x	; de 42 07
B8_060c:		bne B8_0619 ; d0 0b

B8_060e:		iny				; c8 
B8_060f:		iny				; c8 
B8_0610:		iny				; c8 
B8_0611:		jmp func_8_01c9		; 4c c9 81

B8_0614:		lda ($83), y	; b1 83
B8_0616:		sta $0742, x	; 9d 42 07
B8_0619:		iny				; c8 
B8_061a:		lda ($83), y	; b1 83
B8_061c:		sta $85			; 85 85
B8_061e:		iny				; c8 
B8_061f:		lda ($83), y	; b1 83
B8_0621:		sta $0712, x	; 9d 12 07
B8_0624:		sta $84			; 85 84
B8_0626:		lda $85			; a5 85
B8_0628:		sta $83			; 85 83
B8_062a:		ldy #$00		; a0 00
B8_062c:		jmp func_8_01c9		; 4c c9 81

func_8_062f:
	// invalid code $df

data_8_062f_hi:
	.db >func_8_0645
	.db >func_8_064e
	.db >func_8_0657
	.db >func_8_0667
	.db >func_8_0670
	.db >func_8_0679
	.db >func_8_068f
	.db >func_8_069f
	.db >func_8_06ad
	.db >func_8_06d1
	.db >func_8_06f5 // invalid


data_8_062f_lo:
	.db <func_8_0645
	.db <func_8_064e
	.db <func_8_0657
	.db <func_8_0667
	.db <func_8_0670
	.db <func_8_0679
	.db <func_8_068f
	.db <func_8_069f
	.db <func_8_06ad
	.db <func_8_06d1
	.db <func_8_06f5

func_8_0645:
B8_0645:		lda ($83), y	; b1 83
B8_0647:		sta $075a, x	; 9d 5a 07
B8_064a:		iny				; c8 
B8_064b:		jmp func_8_0290		; 4c 90 82

func_8_064e:
B8_064e:		lda ($83), y	; b1 83
B8_0650:		sta $072a, x	; 9d 2a 07
B8_0653:		iny				; c8 
B8_0654:		jmp func_8_0290		; 4c 90 82

func_8_0657:
B8_0657:		lda #$00		; a9 00
B8_0659:		sta $072a, x	; 9d 2a 07
B8_065c:		inc $070a, x	; fe 0a 07
B8_065f:		bne B8_0664 ; d0 03

B8_0661:		inc $0712, x	; fe 12 07
B8_0664:		jmp func_8_029c		; 4c 9c 82

func_8_0667:
B8_0667:		lda ($83), y	; b1 83
B8_0669:		sta $077a, x	; 9d 7a 07
B8_066c:		iny				; c8 
B8_066d:		jmp func_8_0290		; 4c 90 82

func_8_0670:
B8_0670:		lda ($83), y	; b1 83
B8_0672:		sta $0762, x	; 9d 62 07
B8_0675:		iny				; c8 
B8_0676:		jmp func_8_0290		; 4c 90 82

func_8_0679:
B8_0679:		lda $073a, x	; bd 3a 07
B8_067c:		beq B8_065c ; f0 de

B8_067e:		sta $0712, x	; 9d 12 07
B8_0681:		lda $0732, x	; bd 32 07
B8_0684:		sta $070a, x	; 9d 0a 07
B8_0687:		lda #$00		; a9 00
B8_0689:		sta $073a, x	; 9d 3a 07
B8_068c:		jmp func_8_029c		; 4c 9c 82

func_8_068f:
B8_068f:		tya				; 98 
B8_0690:		clc				; 18 
B8_0691:		adc #$02		; 69 02
B8_0693:		adc $83			; 65 83
B8_0695:		sta $0732, x	; 9d 32 07
B8_0698:		lda $84			; a5 84
B8_069a:		adc #$00		; 69 00
B8_069c:		sta $073a, x	; 9d 3a 07

func_8_069f:
B8_069f:		lda ($83), y	; b1 83
B8_06a1:		sta $070a, x	; 9d 0a 07
B8_06a4:		iny				; c8 
B8_06a5:		lda ($83), y	; b1 83
B8_06a7:		sta $0712, x	; 9d 12 07
B8_06aa:		jmp func_8_029c		; 4c 9c 82

func_8_06ad:
B8_06ad:		lda $074a, x	; bd 4a 07
B8_06b0:		beq B8_06bd ; f0 0b

B8_06b2:		dec $074a, x	; de 4a 07
B8_06b5:		bne B8_06c2 ; d0 0b

B8_06b7:		iny				; c8 
B8_06b8:		iny				; c8 
B8_06b9:		iny				; c8 
B8_06ba:		jmp func_8_0290		; 4c 90 82

B8_06bd:		lda ($83), y	; b1 83
B8_06bf:		sta $074a, x	; 9d 4a 07
B8_06c2:		iny				; c8 
B8_06c3:		lda ($83), y	; b1 83
B8_06c5:		sta $070a, x	; 9d 0a 07
B8_06c8:		iny				; c8 
B8_06c9:		lda ($83), y	; b1 83
B8_06cb:		sta $0712, x	; 9d 12 07
B8_06ce:		jmp func_8_029c		; 4c 9c 82

func_8_06d1:
B8_06d1:		lda $0742, x	; bd 42 07
B8_06d4:		beq B8_06e1 ; f0 0b

B8_06d6:		dec $0742, x	; de 42 07
B8_06d9:		bne B8_06e6 ; d0 0b

B8_06db:		iny				; c8 
B8_06dc:		iny				; c8 
B8_06dd:		iny				; c8 
B8_06de:		jmp func_8_0290		; 4c 90 82

B8_06e1:		lda ($83), y	; b1 83
B8_06e3:		sta $0742, x	; 9d 42 07
B8_06e6:		iny				; c8 
B8_06e7:		lda ($83), y	; b1 83
B8_06e9:		sta $070a, x	; 9d 0a 07
B8_06ec:		iny				; c8 
B8_06ed:		lda ($83), y	; b1 83
B8_06ef:		sta $0712, x	; 9d 12 07
B8_06f2:		jmp func_8_029c		; 4c 9c 82

func_8_06f5:
	// invalid control code $ff


// freqs?
data_8_06f5_hi:
.ifdef ROM_JP
	.db >$062e
	.db >$05ce
	.db >$0574
	.db >$051e
	.db >$04cd
	.db >$0481
	.db >$0439
	.db >$03f5
	.db >$03b5
	.db >$0379
	.db >$0340
	.db >$030a
	.db >$02d7
	.db >$02a7
	.db >$027a
	.db >$024f
	.db >$0226
	.db >$0200
	.db >$01dc
	.db >$01ba
	.db >$019a
	.db >$017c
	.db >$0160
	.db >$0145
	.db >$012b
	.db >$0113
	.db >$00fd
	.db >$00e7
	.db >$00d3
	.db >$00c0
	.db >$00ae
	.db >$009d
	.db >$008d
	.db >$007e
	.db >$0070
	.db >$0062
	.db >$0055
	.db >$0049
	.db >$003e
	.db >$0033
	.db >$0029
	.db >$0020
	.db >$0017
	.db >$000e
	.db >$0006
	.db >$ffff
	.db >$fff8
	.db >$fff1
	.db >$ffea
	.db >$ffe4
	.db >$ffdf
	.db >$ffd9
	.db >$ffd4
	.db >$ffd0
	.db >$ffcb
	.db >$ffc7
	.db >$ffc3
	.db >$ffbf
	.db >$ffbc
	.db >$ffb8
	.db >$ffb5
	.db >$ffb2
	.db >$ffaf
	.db >$ffac
	.db >$ffaa
	.db >$ffa8
	.db >$ffa5
	.db >$ffa3
	.db >$ffa1
	.db >$ff9f
	.db >$ff9e
	.db >$ff9c
	.db >$ff9a
	.db >$ff99
	.db >$ff97
	.db >$ff96
	.db >$ff95
	.db >$ff94
	.db >$ff92
	.db >$ff91
	.db >$ff90
	.db >$ff8f
	.db >$ff8e
	.db >$ff8d
	.db >$ff8c
	.db >$ff8b
	.db >$ff8a
	.db >$ff89
	.db >$ff88
	.db >$ff87
	.db >$ff86
	.db >$ff85
	.db >$ff84
	.db >$ff83
	.db >$ff82
	.db >$ff81
	.db >$ff80
.else
	.db >$05b2
	.db >$055a
	.db >$0506
	.db >$04b7
	.db >$046c
	.db >$0425
	.db >$03e3
	.db >$03a3
	.db >$0368
	.db >$0330
	.db >$02fa
	.db >$02c9
	.db >$0299
	.db >$026c
	.db >$0242
	.db >$021a
	.db >$01f5
	.db >$01d2
	.db >$01af
	.db >$0191
	.db >$0173
	.db >$0157
	.db >$013c
	.db >$0124
	.db >$010b
	.db >$00f5
	.db >$00df
	.db >$00cd
	.db >$00ba
	.db >$00a8
	.db >$0098
	.db >$0088
	.db >$0079
	.db >$006b
	.db >$005e
	.db >$0051
	.db >$0045
	.db >$003a
	.db >$0030
	.db >$0026
	.db >$001c
	.db >$0014
	.db >$000b
	.db >$0003
	.db >$fffc
	.db >$fff5
	.db >$ffee
	.db >$ffe8
	.db >$ffe2
	.db >$ffdd
	.db >$ffd7
	.db >$ffd2
	.db >$ffce
	.db >$ffc9
	.db >$ffc5
	.db >$ffc1
	.db >$ffbd
	.db >$ffba
	.db >$ffb7
	.db >$ffb4
	.db >$ffb1
	.db >$ffae
	.db >$ffab
	.db >$ffa9
	.db >$ffa6
	.db >$ffa4
	.db >$ffa2
	.db >$ffa0
	.db >$ff9e
	.db >$ff9c
	.db >$ff9b
	.db >$ff99
	.db >$ffff
	.db >$ffff
	.db >$ffff
	.db >$ffff
	.db >$ffff
	.db >$ffff
	.db >$ffff
	.db >$ffff
	.db >$ffff
	.db >$ffff
	.db >$ffff
	.db >$ffff
	.db >$ffff
	.db >$ffff
	.db >$ffff
	.db >$ffff
	.db >$ffff
	.db >$ffff
	.db >$ffff
	.db >$ffff
	.db >$ffff
	.db >$ffff
	.db >$ffff
	.db >$ffff
	.db >$ffff
	.db >$ffff
	.db >$ffff
	.db >$ffff
	.db >$ffff
	.db >$ffff
.endif


data_8_06f5_lo:
.ifdef ROM_JP
	.db <$062e
	.db <$05ce
	.db <$0574
	.db <$051e
	.db <$04cd
	.db <$0481
	.db <$0439
	.db <$03f5
	.db <$03b5
	.db <$0379
	.db <$0340
	.db <$030a
	.db <$02d7
	.db <$02a7
	.db <$027a
	.db <$024f
	.db <$0226
	.db <$0200
	.db <$01dc
	.db <$01ba
	.db <$019a
	.db <$017c
	.db <$0160
	.db <$0145
	.db <$012b
	.db <$0113
	.db <$00fd
	.db <$00e7
	.db <$00d3
	.db <$00c0
	.db <$00ae
	.db <$009d
	.db <$008d
	.db <$007e
	.db <$0070
	.db <$0062
	.db <$0055
	.db <$0049
	.db <$003e
	.db <$0033
	.db <$0029
	.db <$0020
	.db <$0017
	.db <$000e
	.db <$0006
	.db <$ffff
	.db <$fff8
	.db <$fff1
	.db <$ffea
	.db <$ffe4
	.db <$ffdf
	.db <$ffd9
	.db <$ffd4
	.db <$ffd0
	.db <$ffcb
	.db <$ffc7
	.db <$ffc3
	.db <$ffbf
	.db <$ffbc
	.db <$ffb8
	.db <$ffb5
	.db <$ffb2
	.db <$ffaf
	.db <$ffac
	.db <$ffaa
	.db <$ffa8
	.db <$ffa5
	.db <$ffa3
	.db <$ffa1
	.db <$ff9f
	.db <$ff9e
	.db <$ff9c
	.db <$ff9a
	.db <$ff99
	.db <$ff97
	.db <$ff96
	.db <$ff95
	.db <$ff94
	.db <$ff92
	.db <$ff91
	.db <$ff90
	.db <$ff8f
	.db <$ff8e
	.db <$ff8d
	.db <$ff8c
	.db <$ff8b
	.db <$ff8a
	.db <$ff89
	.db <$ff88
	.db <$ff87
	.db <$ff86
	.db <$ff85
	.db <$ff84
	.db <$ff83
	.db <$ff82
	.db <$ff81
	.db <$ff80
.else
	.db <$05b2
	.db <$055a
	.db <$0506
	.db <$04b7
	.db <$046c
	.db <$0425
	.db <$03e3
	.db <$03a3
	.db <$0368
	.db <$0330
	.db <$02fa
	.db <$02c9
	.db <$0299
	.db <$026c
	.db <$0242
	.db <$021a
	.db <$01f5
	.db <$01d2
	.db <$01af
	.db <$0191
	.db <$0173
	.db <$0157
	.db <$013c
	.db <$0124
	.db <$010b
	.db <$00f5
	.db <$00df
	.db <$00cd
	.db <$00ba
	.db <$00a8
	.db <$0098
	.db <$0088
	.db <$0079
	.db <$006b
	.db <$005e
	.db <$0051
	.db <$0045
	.db <$003a
	.db <$0030
	.db <$0026
	.db <$001c
	.db <$0014
	.db <$000b
	.db <$0003
	.db <$fffc
	.db <$fff5
	.db <$ffee
	.db <$ffe8
	.db <$ffe2
	.db <$ffdd
	.db <$ffd7
	.db <$ffd2
	.db <$ffce
	.db <$ffc9
	.db <$ffc5
	.db <$ffc1
	.db <$ffbd
	.db <$ffba
	.db <$ffb7
	.db <$ffb4
	.db <$ffb1
	.db <$ffae
	.db <$ffab
	.db <$ffa9
	.db <$ffa6
	.db <$ffa4
	.db <$ffa2
	.db <$ffa0
	.db <$ff9e
	.db <$ff9c
	.db <$ff9b
	.db <$ff99
	.db <$ffff
	.db <$ffff
	.db <$ffff
	.db <$ffff
	.db <$ffff
	.db <$ffff
	.db <$ffff
	.db <$ffff
	.db <$ffff
	.db <$ffff
	.db <$ffff
	.db <$ffff
	.db <$ffff
	.db <$ffff
	.db <$ffff
	.db <$ffff
	.db <$ffff
	.db <$ffff
	.db <$ffff
	.db <$ffff
	.db <$ffff
	.db <$ffff
	.db <$ffff
	.db <$ffff
	.db <$ffff
	.db <$ffff
	.db <$ffff
	.db <$ffff
	.db <$ffff
	.db <$ffff
.endif


func_8_07c1:
B8_07c1:		lda #$00		; a9 00
B8_07c3:		sta $8c			; 85 8c
B8_07c5:		ldx #$02		; a2 02

func_8_07c7:
B8_07c7:		dex				; ca 
B8_07c8:		bmi B8_0800 ; 30 36

B8_07ca:		lda $07da, x	; bd da 07
B8_07cd:		sta $82			; 85 82
B8_07cf:		bpl B8_07c7 ; 10 f6

B8_07d1:		dec $07e0, x	; de e0 07
B8_07d4:		bne B8_07f9 ; d0 23

B8_07d6:		lda $07dc, x	; bd dc 07
B8_07d9:		sta $83			; 85 83
B8_07db:		lda $07de, x	; bd de 07
B8_07de:		sta $84			; 85 84
B8_07e0:		ldy #$00		; a0 00

func_8_07e2:
B8_07e2:		lda ($83), y	; b1 83
B8_07e4:		bpl B8_0801 ; 10 1b

// a >= $80, assume >= $f0
B8_07e6:		iny				; c8 
B8_07e7:		stx $86			; 86 86
B8_07e9:		tax				; aa 
B8_07ea:		lda $8783, x	; bd 83 87
B8_07ed:		sta $85			; 85 85
B8_07ef:		lda $8773, x	; bd 73 87
B8_07f2:		ldx $86			; a6 86
B8_07f4:		sta $86			; 85 86
B8_07f6:		jmp ($85)

B8_07f9:		lda #$80		; a9 80
B8_07fb:		sta $8c			; 85 8c
B8_07fd:		jmp func_8_07c7		; 4c c7 87

B8_0800:		rts				; 60 

B8_0801:		sta $85			; 85 85
B8_0803:		iny				; c8 
B8_0804:		lda #$1f		; a9 1f
B8_0806:		sta $87			; 85 87

func_8_0808:
B8_0808:		lda $07e2, x	; bd e2 07
B8_080b:		bne B8_0810 ; d0 03

B8_080d:		lda ($83), y	; b1 83
B8_080f:		iny				; c8 
B8_0810:		sta $07e0, x	; 9d e0 07
B8_0813:		tya				; 98 
B8_0814:		clc				; 18 
B8_0815:		adc $83			; 65 83
B8_0817:		sta $07dc, x	; 9d dc 07
B8_081a:		bcc B8_081f ; 90 03

B8_081c:		inc $07de, x	; fe de 07
B8_081f:		lda $8c			; a5 8c
B8_0821:		bmi B8_07c7 ; 30 a4

B8_0823:		lda $87			; a5 87
B8_0825:		and #$10		; 29 10
B8_0827:		beq B8_0850 ; f0 27

B8_0829:		lda $85			; a5 85
B8_082b:		asl a			; 0a
B8_082c:		asl a			; 0a
B8_082d:		tay				; a8 
B8_082e:		lda $07ec, x	; bd ec 07
B8_0831:		sta $85			; 85 85
B8_0833:		lda $07ee, x	; bd ee 07
B8_0836:		sta $86			; 85 86
B8_0838:		lda ($85), y	; b1 85

// store in more regs
B8_083a:		sta $4010		; 8d 10 40
B8_083d:		iny				; c8 
B8_083e:		lda ($85), y	; b1 85
B8_0840:		sta $4011		; 8d 11 40
B8_0843:		iny				; c8 
B8_0844:		lda ($85), y	; b1 85
B8_0846:		sta $4012		; 8d 12 40
B8_0849:		iny				; c8 
B8_084a:		lda ($85), y	; b1 85
B8_084c:		sta $4013		; 8d 13 40
B8_084f:		iny				; c8 
B8_0850:		lda $87			; a5 87
B8_0852:		and #$0f		; 29 0f
B8_0854:		sta SND_CHN		; 8d 15 40
B8_0857:		lda $87			; a5 87
B8_0859:		sta SND_CHN		; 8d 15 40
B8_085c:		lda #$80		; a9 80
B8_085e:		sta $8c			; 85 8c
B8_0860:		jmp func_8_07c7		; 4c c7 87


funcs_8_0863_hi:
	.db >func_8_0883
	.db >func_8_088b
	.db >func_8_0892
	.db >func_8_08b2
	.db >func_8_08c1
	.db >func_8_08c1
	.db >func_8_08c1
	.db >func_8_08ca
	.db >func_8_08d2
	.db >func_8_08d2
	.db >func_8_08d2
	.db >func_8_08ea
	.db >func_8_08fa
	.db >func_8_090f
	.db >func_8_093a
	.db >func_8_0965

funcs_8_0863_lo:
	.db <func_8_0883
	.db <func_8_088b
	.db <func_8_0892
	.db <func_8_08b2
	.db <func_8_08c1
	.db <func_8_08c1
	.db <func_8_08c1
	.db <func_8_08ca
	.db <func_8_08d2
	.db <func_8_08d2
	.db <func_8_08d2
	.db <func_8_08ea
	.db <func_8_08fa
	.db <func_8_090f
	.db <func_8_093a
	.db <func_8_0965

func_8_0883:
B8_0883:		lda #$00
B8_0885:		sta $07da, x	; 9d da 07
B8_0888:		jmp func_8_07c7		; 4c c7 87

func_8_088b:
B8_088b:		lda #$0f		; a9 0f
B8_088d:		sta $87			; 85 87
B8_088f:		jmp func_8_0808		; 4c 08 88

func_8_0892:
B8_0892:		lda $82			; a5 82
B8_0894:		ora #$10		; 09 10
B8_0896:		sta $82			; 85 82
B8_0898:		lda $07e2, x	; bd e2 07
B8_089b:		bne B8_08a0 ; d0 03

B8_089d:		lda ($83), y	; b1 83
B8_089f:		iny				; c8 
B8_08a0:		sta $07e0, x	; 9d e0 07
B8_08a3:		tya				; 98 
B8_08a4:		clc				; 18 
B8_08a5:		adc $83			; 65 83
B8_08a7:		sta $07dc, x	; 9d dc 07
B8_08aa:		bcc B8_08af ; 90 03

B8_08ac:		inc $07de, x	; fe de 07
B8_08af:		jmp func_8_07c7		; 4c c7 87

func_8_08b2:
B8_08b2:		lda ($83), y	; b1 83
B8_08b4:		sta $07ec, x	; 9d ec 07
B8_08b7:		iny				; c8 
B8_08b8:		lda ($83), y	; b1 83
B8_08ba:		sta $07ee, x	; 9d ee 07
B8_08bd:		iny				; c8 
B8_08be:		jmp func_8_07e2		; 4c e2 87

func_8_08c1:
B8_08c1:		lda ($83), y	; b1 83
B8_08c3:		sta $07e2, x	; 9d e2 07
B8_08c6:		iny				; c8 
B8_08c7:		jmp func_8_07e2		; 4c e2 87

func_8_08ca:
B8_08ca:		lda #$00		; a9 00
B8_08cc:		sta $07e2, x	; 9d e2 07
B8_08cf:		jmp func_8_07e2		; 4c e2 87

func_8_08d2:
B8_08d2:		lda $07e6, x	; bd e6 07
B8_08d5:		beq B8_090c ; f0 35

B8_08d7:		sta $84			; 85 84
B8_08d9:		sta $07de, x	; 9d de 07
B8_08dc:		lda $07e4, x	; bd e4 07
B8_08df:		sta $83			; 85 83
B8_08e1:		ldy #$00		; a0 00
B8_08e3:		tya				; 98 
B8_08e4:		sta $07e6, x	; 9d e6 07
B8_08e7:		jmp func_8_07e2		; 4c e2 87

func_8_08ea:
B8_08ea:		tya				; 98 
B8_08eb:		clc				; 18 
B8_08ec:		adc #$02		; 69 02
B8_08ee:		adc $83			; 65 83
B8_08f0:		sta $07e4, x	; 9d e4 07
B8_08f3:		lda $84			; a5 84
B8_08f5:		adc #$00		; 69 00
B8_08f7:		sta $07e6, x	; 9d e6 07

func_8_08fa:
B8_08fa:		lda ($83), y	; b1 83
B8_08fc:		sta $85			; 85 85
B8_08fe:		iny				; c8 
B8_08ff:		lda ($83), y	; b1 83
B8_0901:		sta $07de, x	; 9d de 07
B8_0904:		sta $84			; 85 84
B8_0906:		lda $85			; a5 85
B8_0908:		sta $83			; 85 83
B8_090a:		ldy #$00		; a0 00
B8_090c:		jmp func_8_07e2		; 4c e2 87

func_8_090f:
B8_090f:		lda $07ea, x	; bd ea 07
B8_0912:		beq B8_091f ; f0 0b

B8_0914:		dec $07ea, x	; de ea 07
B8_0917:		bne B8_0924 ; d0 0b

B8_0919:		iny				; c8 
B8_091a:		iny				; c8 
B8_091b:		iny				; c8 
B8_091c:		jmp func_8_07e2		; 4c e2 87

B8_091f:		lda ($83), y	; b1 83
B8_0921:		sta $07ea, x	; 9d ea 07
B8_0924:		iny				; c8 
B8_0925:		lda ($83), y	; b1 83
B8_0927:		sta $85			; 85 85
B8_0929:		iny				; c8 
B8_092a:		lda ($83), y	; b1 83
B8_092c:		sta $07de, x	; 9d de 07
B8_092f:		sta $84			; 85 84
B8_0931:		lda $85			; a5 85
B8_0933:		sta $83			; 85 83
B8_0935:		ldy #$00		; a0 00
B8_0937:		jmp func_8_07e2		; 4c e2 87

func_8_093a:
B8_093a:		lda $07e8, x	; bd e8 07
B8_093d:		beq B8_094a ; f0 0b

B8_093f:		dec $07e8, x	; de e8 07
B8_0942:		bne B8_094f ; d0 0b

B8_0944:		iny				; c8 
B8_0945:		iny				; c8 
B8_0946:		iny				; c8 
B8_0947:		jmp func_8_07e2		; 4c e2 87

B8_094a:		lda ($83), y	; b1 83
B8_094c:		sta $07e8, x	; 9d e8 07
B8_094f:		iny				; c8 
B8_0950:		lda ($83), y	; b1 83
B8_0952:		sta $85			; 85 85
B8_0954:		iny				; c8 
B8_0955:		lda ($83), y	; b1 83
B8_0957:		sta $07de, x	; 9d de 07
B8_095a:		sta $84			; 85 84
B8_095c:		lda $85			; a5 85
B8_095e:		sta $83			; 85 83
B8_0960:		ldy #$00		; a0 00
B8_0962:		jmp func_8_07e2		; 4c e2 87

func_8_0965:
B8_0965:		rts				; 60 


B8_0966:		eor $488b		; 4d 8b 48
B8_0969:	.db $92
B8_096a:		ora $e995, y	; 19 95 e9
B8_096d:	.db $97
B8_096e:	.db $9c
B8_096f:		tya				; 98 
B8_0970:		inc $9d, x		; f6 9d
B8_0972:		ror $9f			; 66 9f
B8_0974:	.db $b7
B8_0975:		ldy #$52		; a0 52
B8_0977:		ldx #$85		; a2 85
B8_0979:		ldx $e3			; a6 e3
B8_097b:		lda $b2df		; ad df b2
B8_097e:	.db $2b
B8_097f:		lda $4d, x		; b5 4d
B8_0981:	.db $8b
B8_0982:		eor $4d8b		; 4d 8b 4d
B8_0985:	.db $8b
B8_0986:		eor $4d8b		; 4d 8b 4d
B8_0989:	.db $8b
B8_098a:		eor $4d8b		; 4d 8b 4d
B8_098d:	.db $8b
B8_098e:		eor $4d8b		; 4d 8b 4d
B8_0991:	.db $8b
B8_0992:		eor $4d8b		; 4d 8b 4d
B8_0995:	.db $8b
B8_0996:		eor $4d8b		; 4d 8b 4d
B8_0999:	.db $8b
B8_099a:		eor $4d8b		; 4d 8b 4d
B8_099d:	.db $8b
B8_099e:		eor $4d8b		; 4d 8b 4d
B8_09a1:	.db $8b
B8_09a2:		eor $4d8b		; 4d 8b 4d
B8_09a5:	.db $8b
B8_09a6:		dex				; ca 
B8_09a7:		ldx $e9, y		; b6 e9
B8_09a9:		ldx $fd, y		; b6 fd
B8_09ab:		ldx $33, y		; b6 33
B8_09ad:	.db $b7
B8_09ae:	.db $53
B8_09af:	.db $b7
B8_09b0:	.db $7c
B8_09b1:	.db $b7
B8_09b2:		lda $b7			; a5 b7
B8_09b4:		lda $e2b7, y	; b9 b7 e2
B8_09b7:	.db $b7
B8_09b8:	.db $fa
B8_09b9:	.db $b7
B8_09ba:		bpl B8_0974 ; 10 b8

B8_09bc:		plp				; 28 
B8_09bd:		clv				; b8 
B8_09be:	.db $44
B8_09bf:		clv				; b8 
B8_09c0:		adc ($b8, x)	; 61 b8
B8_09c2:	.db $7c
B8_09c3:		clv				; b8 
B8_09c4:		txs				; 9a 
B8_09c5:		clv				; b8 
B8_09c6:		tay				; a8 
B8_09c7:		clv				; b8 
B8_09c8:		cmp #$b8		; c9 b8
B8_09ca:	.db $3c
B8_09cb:		lda $b96b, y	; b9 6b b9
B8_09ce:	.db $a3
B8_09cf:		lda $b9b7, y	; b9 b7 b9
B8_09d2:	.db $f4
B8_09d3:		lda $ba04, y	; b9 04 ba
B8_09d6:		asl $ba, x		; 16 ba
B8_09d8:		bit $4bba		; 2c ba 4b
B8_09db:		tsx				; ba 
B8_09dc:	.db $53
B8_09dd:		tsx				; ba 
B8_09de:		adc $ba			; 65 ba
B8_09e0:		adc $aaba, y	; 79 ba aa
B8_09e3:		tsx				; ba 
B8_09e4:		cpy #$ba		; c0 ba
B8_09e6:		ora ($bb, x)	; 01 bb
B8_09e8:		and $50bb		; 2d bb 50
B8_09eb:	.db $bb
B8_09ec:		stx $bb			; 86 bb
B8_09ee:	.db $9e
B8_09ef:	.db $bb
B8_09f0:		ldy $07bb, x	; bc bb 07
B8_09f3:	.db $34
B8_09f4:		.db $00				; 00
B8_09f5:	.db $3f
B8_09f6:	.db $07
B8_09f7:	.db $34
B8_09f8:		;removed
	.db $30 $3e

B8_09fa:	.db $07
B8_09fb:	.db $34
B8_09fc:		;removed
	.db $10 $3f

B8_09fe:		php				; 08 
B8_09ff:	.db $34
B8_0a00:		bmi B8_0a40 ; 30 3e

B8_0a02:		php				; 08 
B8_0a03:	.db $34
B8_0a04:		bpl B8_0a45 ; 10 3f

B8_0a06:		ora #$34		; 09 34
B8_0a08:		.db $00				; 00
B8_0a09:	.db $3f
B8_0a0a:		asl a			; 0a
B8_0a0b:	.db $34
B8_0a0c:		jsr $0a3f		; 20 3f 0a
B8_0a0f:	.db $34
B8_0a10:		.db $00				; 00
B8_0a11:	.db $3f
B8_0a12:		asl a			; 0a
B8_0a13:	.db $34
B8_0a14:		bmi B8_0a54 ; 30 3e

B8_0a16:		asl a			; 0a
B8_0a17:	.db $34
B8_0a18:		;removed
	.db $10 $3f

B8_0a1a:	.db $0c
B8_0a1b:	.db $34
B8_0a1c:		rti				; 40 


B8_0a1d:		rol $340c, x	; 3e 0c 34
B8_0a20:		jsr $0c3f		; 20 3f 0c
B8_0a23:	.db $34
B8_0a24:		.db $00				; 00
B8_0a25:	.db $3f
B8_0a26:	.db $0c
B8_0a27:	.db $34
B8_0a28:		bmi B8_0a68 ; 30 3e

B8_0a2a:	.db $0c
B8_0a2b:	.db $34
B8_0a2c:		bpl B8_0a6d ; 10 3f

B8_0a2e:		ora $2034		; 0d 34 20
B8_0a31:	.db $3f
B8_0a32:	.db $0d $34 $00
B8_0a35:	.db $3f
B8_0a36:		ora $3034		; 0d 34 30
B8_0a39:		rol $340e, x	; 3e 0e 34
B8_0a3c:		jsr $0e3f		; 20 3f 0e
B8_0a3f:	.db $34
B8_0a40:		.db $00				; 00
B8_0a41:	.db $3f
B8_0a42:		asl $3034		; 0e 34 30
B8_0a45:		rol $340e, x	; 3e 0e 34
B8_0a48:		bpl B8_0a89 ; 10 3f

B8_0a4a:	.db $0f
B8_0a4b:	.db $34
B8_0a4c:		rti				; 40 


B8_0a4d:		rol $340f, x	; 3e 0f 34
B8_0a50:		jsr $0f3f		; 20 3f 0f
B8_0a53:	.db $34
B8_0a54:		.db $00				; 00
B8_0a55:	.db $3f
B8_0a56:	.db $0f
B8_0a57:	.db $34
B8_0a58:		;removed
	.db $30 $3e

B8_0a5a:	.db $0f
B8_0a5b:	.db $34
B8_0a5c:		bpl B8_0a9d ; 10 3f

B8_0a5e:	.db $04
B8_0a5f:	.db $34
B8_0a60:		.db $00				; 00
B8_0a61:	.db $3f
B8_0a62:		asl $5034		; 0e 34 50
B8_0a65:		jsr $340f		; 20 0f 34
B8_0a68:		bvc B8_0a8a ; 50 20

B8_0a6a:		asl $5034		; 0e 34 50
B8_0a6d:		jsr $340c		; 20 0c 34
B8_0a70:		bvc B8_0a92 ; 50 20

B8_0a72:	.db $0f
B8_0a73:		.db $00				; 00
B8_0a74:		cli				; 58 
B8_0a75:	.db $0d $00 $00
B8_0a78:	.db $02
B8_0a79:	.db $04
B8_0a7a:	.db $02
B8_0a7b:		.db $00				; 00
B8_0a7c:		.db $00				; 00
B8_0a7d:	.db $82
B8_0a7e:		sty $82			; 84 82
B8_0a80:	.db $80
B8_0a81:		.db $00				; 00
B8_0a82:		.db $00				; 00
B8_0a83:	.db $02
B8_0a84:	.db $04
B8_0a85:		asl $04			; 06 04
B8_0a87:	.db $02
B8_0a88:		.db $00				; 00
B8_0a89:	.db $82
B8_0a8a:		sty $86			; 84 86
B8_0a8c:		sty $82			; 84 82
B8_0a8e:	.db $80
B8_0a8f:		.db $00				; 00
B8_0a90:		ora ($01, x)	; 01 01
B8_0a92:		sta ($81, x)	; 81 81
B8_0a94:	.db $80
B8_0a95:		.db $00				; 00
B8_0a96:		.db $00				; 00
B8_0a97:		ora ($02, x)	; 01 02
B8_0a99:	.db $03
B8_0a9a:	.db $02
B8_0a9b:		ora ($00, x)	; 01 00
B8_0a9d:		sta ($82, x)	; 81 82
B8_0a9f:	.db $83
B8_0aa0:	.db $82
B8_0aa1:		sta ($80, x)	; 81 80
B8_0aa3:		.db $00				; 00
B8_0aa4:		.db $00				; 00
B8_0aa5:		ora ($02, x)	; 01 02
B8_0aa7:	.db $02
B8_0aa8:		ora ($00, x)	; 01 00
B8_0aaa:		sta ($82, x)	; 81 82
B8_0aac:	.db $82
B8_0aad:		sta ($80, x)	; 81 80
B8_0aaf:		.db $00				; 00
B8_0ab0:		.db $00				; 00
B8_0ab1:		ora ($02, x)	; 01 02
B8_0ab3:	.db $03
B8_0ab4:	.db $04
B8_0ab5:	.db $03
B8_0ab6:	.db $02
B8_0ab7:		ora ($00, x)	; 01 00
B8_0ab9:		sta ($82, x)	; 81 82
B8_0abb:	.db $83
B8_0abc:		sty $83			; 84 83
B8_0abe:	.db $82
B8_0abf:		sta ($80, x)	; 81 80
B8_0ac1:		.db $00				; 00
B8_0ac2:		.db $00				; 00
B8_0ac3:		ora ($02, x)	; 01 02
B8_0ac5:		ora ($00, x)	; 01 00
B8_0ac7:		sta ($82, x)	; 81 82
B8_0ac9:		sta ($80, x)	; 81 80
B8_0acb:		.db $00				; 00
B8_0acc:		.db $00				; 00
B8_0acd:	.db $03
B8_0ace:		ora $08			; 05 08
B8_0ad0:	.db $04
B8_0ad1:		.db $00				; 00
B8_0ad2:		.db $00				; 00
B8_0ad3:	.db $83
B8_0ad4:		sta $88			; 85 88
B8_0ad6:		sty $00			; 84 00
B8_0ad8:	.db $80
B8_0ad9:		.db $00				; 00
B8_0ada:		.db $00				; 00
B8_0adb:		ora ($02, x)	; 01 02
B8_0add:		ora ($00, x)	; 01 00
B8_0adf:		.db $00				; 00
B8_0ae0:		sta ($82, x)	; 81 82
B8_0ae2:		sta ($00, x)	; 81 00
B8_0ae4:	.db $80
B8_0ae5:		.db $00				; 00
B8_0ae6:		.db $00				; 00
B8_0ae7:	.db $03
B8_0ae8:		asl $08			; 06 08
B8_0aea:		asl $03			; 06 03
B8_0aec:		.db $00				; 00
B8_0aed:	.db $83
B8_0aee:		stx $88			; 86 88
B8_0af0:		stx $83			; 86 83
B8_0af2:	.db $80
B8_0af3:		.db $00				; 00
B8_0af4:		.db $00				; 00
B8_0af5:		ora ($01, x)	; 01 01
B8_0af7:		.db $00				; 00
B8_0af8:		.db $00				; 00
B8_0af9:		sta ($81, x)	; 81 81
B8_0afb:		.db $00				; 00
B8_0afc:	.db $80
B8_0afd:		.db $00				; 00
B8_0afe:	.db $04
B8_0aff:		php				; 08 
B8_0b00:	.db $0b
B8_0b01:		php				; 08 
B8_0b02:		sty $88			; 84 88
B8_0b04:	.db $8b
B8_0b05:		dey				; 88 
B8_0b06:	.db $80
B8_0b07:		.db $00				; 00
B8_0b08:		.db $00				; 00
B8_0b09:		ora ($02, x)	; 01 02
B8_0b0b:	.db $02
B8_0b0c:		ora ($01, x)	; 01 01
B8_0b0e:		.db $00				; 00
B8_0b0f:		sta ($82, x)	; 81 82
B8_0b11:	.db $82
B8_0b12:		sta ($81, x)	; 81 81
B8_0b14:	.db $80
B8_0b15:		.db $00				; 00
B8_0b16:		ora ($02, x)	; 01 02
B8_0b18:		ora ($81, x)	; 01 81
B8_0b1a:	.db $82
B8_0b1b:		sta ($80, x)	; 81 80
B8_0b1d:		.db $00				; 00
B8_0b1e:		.db $00				; 00
B8_0b1f:		ora ($03, x)	; 01 03
B8_0b21:	.db $04
B8_0b22:	.db $03
B8_0b23:		ora ($00, x)	; 01 00
B8_0b25:		sta ($83, x)	; 81 83
B8_0b27:		sty $83			; 84 83
B8_0b29:		sta ($80, x)	; 81 80
B8_0b2b:		.db $00				; 00
B8_0b2c:	.db $04
B8_0b2d:	.db $ff
B8_0b2e:		.db $00				; 00
B8_0b2f:	.db $80
B8_0b30:		.db $00				; 00
B8_0b31:		.db $00				; 00
B8_0b32:	.db $80
B8_0b33:	.db $04
B8_0b34:		and $00, x		; 35 00
B8_0b36:	.db $80
B8_0b37:	.db $34
B8_0b38:		.db $00				; 00
B8_0b39:	.db $80
B8_0b3a:	.db $04
B8_0b3b:	.db $34
B8_0b3c:		.db $00				; 00
B8_0b3d:	.db $80
B8_0b3e:	.db $33
B8_0b3f:		.db $00				; 00
B8_0b40:	.db $80
B8_0b41:		ora ($74, x)	; 01 74
B8_0b43:		.db $00				; 00
B8_0b44:	.db $80
B8_0b45:		ora ($73, x)	; 01 73
B8_0b47:		.db $00				; 00
B8_0b48:	.db $80
B8_0b49:		ora ($33, x)	; 01 33
B8_0b4b:		.db $00				; 00
B8_0b4c:	.db $80
B8_0b4d:		.db $00				; 00
B8_0b4e:		.db $00				; 00
B8_0b4f:		adc ($8b, x)	; 61 8b
B8_0b51:		ora ($01, x)	; 01 01
B8_0b53:	.db $b3
B8_0b54:		sty $0202		; 8c 02 02
B8_0b57:	.db $04
B8_0b58:		stx $0303		; 8e 03 03
B8_0b5b:		inx				; e8 
B8_0b5c:		stx $3708		; 8e 08 37
B8_0b5f:		;removed
	.db $90 $ff

B8_0b61:		nop				; ea 
B8_0b62:		sta $91, x		; 95 91
B8_0b64:		sbc $03, x		; f5 03
B8_0b66:		inc $08, x		; f6 08
B8_0b68:	.db $17
B8_0b69:	.db $17
B8_0b6a:	.db $17
B8_0b6b:		nop				; ea 
B8_0b6c:		ldy $91			; a4 91
B8_0b6e:		inc $f611		; ee 11 f6
B8_0b71:		clc				; 18 
B8_0b72:	.db $17
B8_0b73:	.db $17
B8_0b74:	.db $17
B8_0b75:		nop				; ea 
B8_0b76:		sta $91, x		; 95 91
B8_0b78:		sbc $03, x		; f5 03
B8_0b7a:		inc $08, x		; f6 08
B8_0b7c:		clc				; 18 
B8_0b7d:		clc				; 18 
B8_0b7e:		clc				; 18 
B8_0b7f:		nop				; ea 
B8_0b80:		ldy $91			; a4 91
B8_0b82:		inc $f611		; ee 11 f6
B8_0b85:		clc				; 18 
B8_0b86:		clc				; 18 
B8_0b87:		nop				; ea 
B8_0b88:		sta $91, x		; 95 91
B8_0b8a:		sbc $03, x		; f5 03
B8_0b8c:		inc $08, x		; f6 08
B8_0b8e:		clc				; 18 
B8_0b8f:		clc				; 18 
B8_0b90:		clc				; 18 
B8_0b91:		clc				; 18 
B8_0b92:		clc				; 18 
B8_0b93:		clc				; 18 
B8_0b94:	.db $fa
B8_0b95:		inc $6801, x	; fe 01 68
B8_0b98:	.db $8b
B8_0b99:		nop				; ea 
B8_0b9a:		sta $91, x		; 95 91
B8_0b9c:	.db $e7
B8_0b9d:		asl $8a82, x	; 1e 82 8a
B8_0ba0:		sbc $03, x		; f5 03
B8_0ba2:		inc $08, x		; f6 08
B8_0ba4:	.db $1f
B8_0ba5:	.db $1f
B8_0ba6:	.db $1f
B8_0ba7:		nop				; ea 
B8_0ba8:		ldy $91			; a4 91
B8_0baa:		inc $f611		; ee 11 f6
B8_0bad:		clc				; 18 
B8_0bae:	.db $1f
B8_0baf:	.db $1f
B8_0bb0:		nop				; ea 
B8_0bb1:		sta $91, x		; 95 91
B8_0bb3:	.db $ef
B8_0bb4:		inc $08, x		; f6 08
B8_0bb6:	.db $1f
B8_0bb7:		and ($23, x)	; 21 23
B8_0bb9:		nop				; ea 
B8_0bba:		ldy $91			; a4 91
B8_0bbc:		inc $f60e		; ee 0e f6
B8_0bbf:		clc				; 18 
B8_0bc0:		bit $23			; 24 23
B8_0bc2:		and ($fa, x)	; 21 fa
B8_0bc4:	.db $1f
B8_0bc5:		nop				; ea 
B8_0bc6:		sta $91, x		; 95 91
B8_0bc8:		sbc $0c, x		; f5 0c
B8_0bca:		inc $48, x		; f6 48
B8_0bcc:		ora $f6ef, x	; 1d ef f6
B8_0bcf:		php				; 08 
B8_0bd0:		ora $1d1c, x	; 1d 1c 1d
B8_0bd3:	.db $e2
B8_0bd4:		bit $f5			; 24 f5
B8_0bd6:	.db $0c
B8_0bd7:		inc $60, x		; f6 60
B8_0bd9:	.db $1a
B8_0bda:	.db $fa
B8_0bdb:		inc $9901, x	; fe 01 99
B8_0bde:	.db $8b
B8_0bdf:		nop				; ea 
B8_0be0:		cmp $f591, x	; dd 91 f5
B8_0be3:	.db $0c
B8_0be4:	.db $f7
B8_0be5:	.db $1c
B8_0be6:		pha				; 48 
B8_0be7:		nop				; ea 
B8_0be8:		cmp $ef91		; cd 91 ef
B8_0beb:	.db $1c
B8_0bec:		php				; 08 
B8_0bed:		asl $1f08, x	; 1e 08 1f
B8_0bf0:		php				; 08 
B8_0bf1:		nop				; ea 
B8_0bf2:		cmp $f591, x	; dd 91 f5
B8_0bf5:	.db $0c
B8_0bf6:		plp				; 28 
B8_0bf7:		rts				; 60 


B8_0bf8:	.db $1a
B8_0bf9:		pha				; 48 
B8_0bfa:		nop				; ea 
B8_0bfb:		cmp $ef91		; cd 91 ef
B8_0bfe:	.db $1a
B8_0bff:		php				; 08 
B8_0c00:	.db $1c
B8_0c01:		php				; 08 
B8_0c02:		asl $ea08, x	; 1e 08 ea
B8_0c05:		cmp $f591, x	; dd 91 f5
B8_0c08:	.db $0c
B8_0c09:		rol $60			; 26 60
B8_0c0b:		nop				; ea 
B8_0c0c:		sbc $91, x		; f5 91
B8_0c0e:		inc $18, x		; f6 18
B8_0c10:		sbc $0c, x		; f5 0c
B8_0c12:		bit $23			; 24 23
B8_0c14:		and ($1f, x)	; 21 1f
B8_0c16:		nop				; ea 
B8_0c17:	.db $07
B8_0c18:	.db $92
B8_0c19:		bit $23			; 24 23
B8_0c1b:		and ($1f, x)	; 21 1f
B8_0c1d:		nop				; ea 
B8_0c1e:		ora $f792, y	; 19 92 f7
B8_0c21:		sbc $0c, x		; f5 0c
B8_0c23:		and ($60, x)	; 21 60
B8_0c25:		nop				; ea 
B8_0c26:	.db $2b
B8_0c27:	.db $92
B8_0c28:		sbc $06, x		; f5 06
B8_0c2a:	.db $e2
B8_0c2b:		clc				; 18 
B8_0c2c:		rol $38			; 26 38
B8_0c2e:		sbc $03, x		; f5 03
B8_0c30:		inc $08, x		; f6 08
B8_0c32:		rol $26			; 26 26
B8_0c34:		nop				; ea 
B8_0c35:		and $2692, x	; 3d 92 26
B8_0c38:		rol $26			; 26 26
B8_0c3a:	.db $fb
B8_0c3b:		sta $fb8b, y	; 99 8b fb
B8_0c3e:		cpy $8b			; c4 8b
B8_0c40:	.db $fb
B8_0c41:		sta $ea8b, y	; 99 8b ea
B8_0c44:		sta $91, x		; 95 91
B8_0c46:	.db $ef
B8_0c47:		inc $08, x		; f6 08
B8_0c49:		and ($23, x)	; 21 23
B8_0c4b:		bit $e2			; 24 e2
B8_0c4d:		bmi B8_0c46 ; 30 f7

B8_0c4f:	.db $ef
B8_0c50:		rol $60			; 26 60
B8_0c52:		sbc $0c, x		; f5 0c
B8_0c54:	.db $f2
B8_0c55:		rts				; 60 


B8_0c56:		nop				; ea 
B8_0c57:		cmp $e291, x	; dd 91 e2
B8_0c5a:		asl $0cf5, x	; 1e f5 0c
B8_0c5d:		bit $48			; 24 48
B8_0c5f:		nop				; ea 
B8_0c60:		cmp $ef91		; cd 91 ef
B8_0c63:	.db $23
B8_0c64:		php				; 08 
B8_0c65:		bit $08			; 24 08
B8_0c67:	.db $23
B8_0c68:		php				; 08 
B8_0c69:		nop				; ea 
B8_0c6a:		cmp $f591, x	; dd 91 f5
B8_0c6d:	.db $0c
B8_0c6e:		and ($60, x)	; 21 60
B8_0c70:	.db $23
B8_0c71:		pha				; 48 
B8_0c72:		nop				; ea 
B8_0c73:		cmp $ef91		; cd 91 ef
B8_0c76:		and ($08, x)	; 21 08
B8_0c78:	.db $23
B8_0c79:		php				; 08 
B8_0c7a:		and ($08, x)	; 21 08
B8_0c7c:		nop				; ea 
B8_0c7d:		sbc $91, x		; f5 91
B8_0c7f:		sbc $0c, x		; f5 0c
B8_0c81:		inc $18, x		; f6 18
B8_0c83:		jsr $2321		; 20 21 23
B8_0c86:		rol $ea			; 26 ea
B8_0c88:	.db $07
B8_0c89:	.db $92
B8_0c8a:		bit $23			; 24 23
B8_0c8c:		and ($1f, x)	; 21 1f
B8_0c8e:		nop				; ea 
B8_0c8f:		ora $f592, y	; 19 92 f5
B8_0c92:	.db $0c
B8_0c93:	.db $f7
B8_0c94:		asl $f548, x	; 1e 48 f5
B8_0c97:	.db $03
B8_0c98:		inc $08, x		; f6 08
B8_0c9a:		asl $1e1c, x	; 1e 1c 1e
B8_0c9d:		nop				; ea 
B8_0c9e:	.db $2b
B8_0c9f:	.db $92
B8_0ca0:	.db $e7
B8_0ca1:		asl $8a76, x	; 1e 76 8a
B8_0ca4:	.db $e2
B8_0ca5:		bit $f7			; 24 f7
B8_0ca7:	.db $ef
B8_0ca8:	.db $2b
B8_0ca9:		rts				; 60 


B8_0caa:		sbc $600a		; ed0a 60
B8_0cad:	.db $fb
B8_0cae:		adc ($8b, x)	; 61 8b
B8_0cb0:	.db $fc
B8_0cb1:		sta $ea8b, y	; 99 8b ea
B8_0cb4:		sta $91, x		; 95 91
B8_0cb6:		sbc $03, x		; f5 03
B8_0cb8:		inc $08, x		; f6 08
B8_0cba:	.db $1f
B8_0cbb:	.db $1f
B8_0cbc:	.db $1f
B8_0cbd:		nop				; ea 
B8_0cbe:		ldy $91			; a4 91
B8_0cc0:		inc $f611		; ee 11 f6
B8_0cc3:		clc				; 18 
B8_0cc4:	.db $1f
B8_0cc5:	.db $1f
B8_0cc6:	.db $1f
B8_0cc7:		nop				; ea 
B8_0cc8:		sta $91, x		; 95 91
B8_0cca:		sbc $03, x		; f5 03
B8_0ccc:		inc $08, x		; f6 08
B8_0cce:		ora $1d1d, x	; 1d 1d 1d
B8_0cd1:		nop				; ea 
B8_0cd2:		ldy $91			; a4 91
B8_0cd4:		inc $f611		; ee 11 f6
B8_0cd7:		clc				; 18 
B8_0cd8:		ora $95ea, x	; 1d ea 95
B8_0cdb:		sta ($f5), y	; 91 f5
B8_0cdd:	.db $03
B8_0cde:		inc $08, x		; f6 08
B8_0ce0:		ora $1d1d, x	; 1d 1d 1d
B8_0ce3:		ora $1d1d, x	; 1d 1d 1d
B8_0ce6:		inc $ba01, x	; fe 01 ba
B8_0ce9:		sty $95ea		; 8c ea 95
B8_0cec:		sta ($e7), y	; 91 e7
B8_0cee:		asl $8a82, x	; 1e 82 8a
B8_0cf1:		sbc $03, x		; f5 03
B8_0cf3:		inc $08, x		; f6 08
B8_0cf5:	.db $17
B8_0cf6:	.db $17
B8_0cf7:	.db $17
B8_0cf8:		nop				; ea 
B8_0cf9:		ldy $91			; a4 91
B8_0cfb:		inc $f611		; ee 11 f6
B8_0cfe:		clc				; 18 
B8_0cff:	.db $17
B8_0d00:	.db $17
B8_0d01:		nop				; ea 
B8_0d02:		sta $91, x		; 95 91
B8_0d04:	.db $ef
B8_0d05:		inc $08, x		; f6 08
B8_0d07:	.db $17
B8_0d08:	.db $1a
B8_0d09:	.db $1f
B8_0d0a:		nop				; ea 
B8_0d0b:		ldy $91			; a4 91
B8_0d0d:		inc $f60e		; ee 0e f6
B8_0d10:		clc				; 18 
B8_0d11:		and ($1f, x)	; 21 1f
B8_0d13:	.db $1a
B8_0d14:	.db $fa
B8_0d15:	.db $17
B8_0d16:		nop				; ea 
B8_0d17:		sta $91, x		; 95 91
B8_0d19:		sbc $0c, x		; f5 0c
B8_0d1b:		inc $48, x		; f6 48
B8_0d1d:		clc				; 18 
B8_0d1e:		sbc $03, x		; f5 03
B8_0d20:		inc $08, x		; f6 08
B8_0d22:		clc				; 18 
B8_0d23:		clc				; 18 
B8_0d24:		clc				; 18 
B8_0d25:	.db $e2
B8_0d26:		bit $f5			; 24 f5
B8_0d28:	.db $0c
B8_0d29:		inc $60, x		; f6 60
B8_0d2b:		clc				; 18 
B8_0d2c:	.db $fa
B8_0d2d:		inc $ea01, x	; fe 01 ea
B8_0d30:		sty $b7ea		; 8c ea b7
B8_0d33:		sta ($ef), y	; 91 ef
B8_0d35:		inc $08, x		; f6 08
B8_0d37:	.db $1c
B8_0d38:	.db $1f
B8_0d39:		;removed
	.db $30 $32

B8_0d3b:		bmi B8_0d6f ; 30 32

B8_0d3d:	.db $34
B8_0d3e:	.db $32
B8_0d3f:		;removed
	.db $30 $2b

B8_0d41:		plp				; 28 
B8_0d42:		bit $28			; 24 28
B8_0d44:		bit $28			; 24 28
B8_0d46:	.db $2b
B8_0d47:		plp				; 28 
B8_0d48:	.db $2b
B8_0d49:		bmi B8_0d76 ; 30 2b

B8_0d4b:		bmi B8_0d81 ; 30 34

B8_0d4d:		;removed
	.db $30 $34

B8_0d4f:		rol $2a			; 26 2a
B8_0d51:	.db $2f
B8_0d52:	.db $32
B8_0d53:	.db $2f
B8_0d54:	.db $32
B8_0d55:		rol $32, x		; 36 32
B8_0d57:	.db $2f
B8_0d58:	.db $32
B8_0d59:	.db $2f
B8_0d5a:		rol a			; 2a
B8_0d5b:		rol $23			; 26 23
B8_0d5d:		rol $2a			; 26 2a
B8_0d5f:		rol $2a			; 26 2a
B8_0d61:	.db $2f
B8_0d62:		rol a			; 2a
B8_0d63:	.db $2f
B8_0d64:	.db $32
B8_0d65:	.db $2f
B8_0d66:	.db $32
B8_0d67:		nop				; ea 
B8_0d68:	.db $c2
B8_0d69:		sta ($30), y	; 91 30
B8_0d6b:		and $2f29		; 2d 29 2f
B8_0d6e:	.db $2b
B8_0d6f:		rol $2d			; 26 2d
B8_0d71:		and #$24		; 29 24
B8_0d73:	.db $2b
B8_0d74:		rol $23			; 26 23
B8_0d76:		inc $6a01, x	; fe 01 6a
B8_0d79:		sta $2bea		; 8d ea 2b
B8_0d7c:	.db $92
B8_0d7d:	.db $f7
B8_0d7e:		sbc $0c, x		; f5 0c
B8_0d80:	.db $1f
B8_0d81:		rts				; 60 


B8_0d82:		sbc $06, x		; f5 06
B8_0d84:	.db $e2
B8_0d85:		clc				; 18 
B8_0d86:		asl $f538, x	; 1e 38 f5
B8_0d89:	.db $03
B8_0d8a:		inc $08, x		; f6 08
B8_0d8c:		asl $ea1e, x	; 1e 1e ea
B8_0d8f:		and $1e92, x	; 3d 92 1e
B8_0d92:		asl $fb1e, x	; 1e 1e fb
B8_0d95:		nop				; ea 
B8_0d96:		sty $15fb		; 8c fb 15
B8_0d99:		sta $eafb		; 8d fb ea
B8_0d9c:		sty $95ea		; 8c ea 95
B8_0d9f:		sta ($ef), y	; 91 ef
B8_0da1:		inc $08, x		; f6 08
B8_0da3:	.db $1a
B8_0da4:	.db $1f
B8_0da5:		and ($f7, x)	; 21 f7
B8_0da7:		sbc $0c, x		; f5 0c
B8_0da9:		and ($60, x)	; 21 60
B8_0dab:		jsr $ea60		; 20 60 ea
B8_0dae:	.db $b7
B8_0daf:		sta ($ef), y	; 91 ef
B8_0db1:		inc $08, x		; f6 08
B8_0db3:		plp				; 28 
B8_0db4:	.db $2b
B8_0db5:		bmi B8_0de9 ; 30 32

B8_0db7:		bmi B8_0deb ; 30 32

B8_0db9:	.db $34
B8_0dba:	.db $32
B8_0dbb:		bmi B8_0de8 ; 30 2b

B8_0dbd:		plp				; 28 
B8_0dbe:		bit $27			; 24 27
B8_0dc0:	.db $2b
B8_0dc1:		bmi B8_0df5 ; 30 32

B8_0dc3:		bmi B8_0df7 ; 30 32

B8_0dc5:	.db $33
B8_0dc6:	.db $32
B8_0dc7:		;removed
	.db $30 $2b

B8_0dc9:	.db $27
B8_0dca:	.db $2b
B8_0dcb:		rol $2a			; 26 2a
B8_0dcd:	.db $2f
B8_0dce:	.db $32
B8_0dcf:	.db $2f
B8_0dd0:	.db $32
B8_0dd1:		rol $32, x		; 36 32
B8_0dd3:	.db $2f
B8_0dd4:	.db $32
B8_0dd5:	.db $2f
B8_0dd6:		rol a			; 2a
B8_0dd7:		nop				; ea 
B8_0dd8:	.db $c2
B8_0dd9:		sta ($2c), y	; 91 2c
B8_0ddb:		plp				; 28 
B8_0ddc:	.db $23
B8_0ddd:		and $2328		; 2d 28 23
B8_0de0:	.db $2f
B8_0de1:		bit $3228		; 2c 28 32
B8_0de4:		bit $ea28		; 2c 28 ea
B8_0de7:	.db $2b
B8_0de8:	.db $92
B8_0de9:		sbc $0d, x		; f5 0d
B8_0deb:		inc $18, x		; f6 18
B8_0ded:		bmi B8_0e1e ; 30 2f

B8_0def:		and $e72b		; 2d 2b e7
B8_0df2:		asl $8a76, x	; 1e 76 8a
B8_0df5:		sbc $0c, x		; f5 0c
B8_0df7:	.db $f7
B8_0df8:		rol a			; 2a
B8_0df9:		pha				; 48 
B8_0dfa:		sbc $03, x		; f5 03
B8_0dfc:		inc $08, x		; f6 08
B8_0dfe:		rol a			; 2a
B8_0dff:		plp				; 28 
B8_0e00:		rol a			; 2a
B8_0e01:	.db $fc
B8_0e02:	.db $b3
B8_0e03:		sty $ffec		; 8c ec ff
B8_0e06:	.db $eb
B8_0e07:	.db $0f
B8_0e08:		asl $f104, x	; 1e 04 f1
B8_0e0b:	.db $14
B8_0e0c:	.db $27
B8_0e0d:	.db $0c
B8_0e0e:		sbc ($0c), y	; f1 0c
B8_0e10:	.db $fa
B8_0e11:		inc $0802, x	; fe 02 08
B8_0e14:		stx $0827		; 8e 27 08
B8_0e17:	.db $27
B8_0e18:		php				; 08 
B8_0e19:		asl $f104, x	; 1e 04 f1
B8_0e1c:	.db $04
B8_0e1d:	.db $27
B8_0e1e:	.db $0c
B8_0e1f:		sbc ($04), y	; f1 04
B8_0e21:		asl $f104, x	; 1e 04 f1
B8_0e24:	.db $04
B8_0e25:	.db $fa
B8_0e26:	.db $fb
B8_0e27:		php				; 08 
B8_0e28:		stx $08fb		; 8e fb 08
B8_0e2b:		stx $041e		; 8e 1e 04
B8_0e2e:		sbc ($14), y	; f1 14
B8_0e30:	.db $fb
B8_0e31:		ora $278e, x	; 1d 8e 27
B8_0e34:		php				; 08 
B8_0e35:		inc $3305, x	; fe 05 33
B8_0e38:		stx $041e		; 8e 1e 04
B8_0e3b:		sbc ($14), y	; f1 14
B8_0e3d:	.db $27
B8_0e3e:	.db $0c
B8_0e3f:		sbc ($04), y	; f1 04
B8_0e41:		asl $f104, x	; 1e 04 f1
B8_0e44:	.db $04
B8_0e45:		asl $f104, x	; 1e 04 f1
B8_0e48:	.db $14
B8_0e49:	.db $27
B8_0e4a:	.db $0c
B8_0e4b:		sbc ($0c), y	; f1 0c
B8_0e4d:		inc $3902, x	; fe 02 39
B8_0e50:		stx $041e		; 8e 1e 04
B8_0e53:		sbc ($14), y	; f1 14
B8_0e55:	.db $27
B8_0e56:	.db $0c
B8_0e57:		sbc ($04), y	; f1 04
B8_0e59:		asl $f104, x	; 1e 04 f1
B8_0e5c:	.db $04
B8_0e5d:	.db $fa
B8_0e5e:		asl $f104, x	; 1e 04 f1
B8_0e61:	.db $04
B8_0e62:	.db $27
B8_0e63:		php				; 08 
B8_0e64:		asl $f104, x	; 1e 04 f1
B8_0e67:	.db $04
B8_0e68:	.db $27
B8_0e69:	.db $0c
B8_0e6a:		sbc ($04), y	; f1 04
B8_0e6c:	.db $27
B8_0e6d:		php				; 08 
B8_0e6e:	.db $fa
B8_0e6f:	.db $fb
B8_0e70:		and $278e, y	; 39 8e 27
B8_0e73:		php				; 08 
B8_0e74:	.db $27
B8_0e75:		php				; 08 
B8_0e76:		asl $f104, x	; 1e 04 f1
B8_0e79:	.db $04
B8_0e7a:	.db $fb
B8_0e7b:		pla				; 68 
B8_0e7c:		stx $041e		; 8e 1e 04
B8_0e7f:		sbc ($0c), y	; f1 0c
B8_0e81:		asl $f104, x	; 1e 04 f1
B8_0e84:	.db $04
B8_0e85:	.db $27
B8_0e86:	.db $0c
B8_0e87:		sbc ($0c), y	; f1 0c
B8_0e89:	.db $fb
B8_0e8a:		php				; 08 
B8_0e8b:		stx $03fe		; 8e fe 03
B8_0e8e:		adc $fb8e, x	; 7d 8e fb
B8_0e91:		php				; 08 
B8_0e92:		stx $05fe		; 8e fe 05
B8_0e95:		bcc B8_0e25 ; 90 8e

B8_0e97:		asl $f104, x	; 1e 04 f1
B8_0e9a:	.db $0c
B8_0e9b:		asl $f104, x	; 1e 04 f1
B8_0e9e:	.db $04
B8_0e9f:	.db $27
B8_0ea0:	.db $0c
B8_0ea1:		sbc ($04), y	; f1 04
B8_0ea3:		asl $f104, x	; 1e 04 f1
B8_0ea6:	.db $04
B8_0ea7:	.db $27
B8_0ea8:		php				; 08 
B8_0ea9:	.db $1a
B8_0eaa:		php				; 08 
B8_0eab:		asl $f104, x	; 1e 04 f1
B8_0eae:	.db $04
B8_0eaf:	.db $27
B8_0eb0:	.db $0c
B8_0eb1:		sbc ($04), y	; f1 04
B8_0eb3:	.db $27
B8_0eb4:		php				; 08 
B8_0eb5:	.db $fb
B8_0eb6:		and $fb8e, y	; 39 8e fb
B8_0eb9:		lsr $fd8e, x	; 5e 8e fd
B8_0ebc:		ora ($b5, x)	; 01 b5
B8_0ebe:	.db $8e $eb $00
B8_0ec1:	.db $e7
B8_0ec2:		bit $76			; 24 76
B8_0ec4:		txa				; 8a 
B8_0ec5:		nop				; ea 
B8_0ec6:		bit $ef8b		; 2c 8b ef
B8_0ec9:		inc $60, x		; f6 60
B8_0ecb:		plp				; 28 
B8_0ecc:	.db $27
B8_0ecd:		rol $f5			; 26 f5
B8_0ecf:	.db $03
B8_0ed0:		plp				; 28 
B8_0ed1:		inc $18, x		; f6 18
B8_0ed3:		plp				; 28 
B8_0ed4:		rol $24			; 26 24
B8_0ed6:	.db $23
B8_0ed7:	.db $ef
B8_0ed8:		inc $60, x		; f6 60
B8_0eda:		bit $23			; 24 23
B8_0edc:		bit $26			; 24 26
B8_0ede:		bit $f7			; 24 f7
B8_0ee0:		cpx $e6ff		; ec ff e6
B8_0ee3:	.db $eb
B8_0ee4:	.db $0f
B8_0ee5:	.db $fc
B8_0ee6:		and $ec8e, y	; 39 8e ec
B8_0ee9:		.db $00				; 00
B8_0eea:	.db $03
B8_0eeb:		ora ($00, x)	; 01 00
B8_0eed:	.db $0f
B8_0eee:		ora ($08, x)	; 01 08
B8_0ef0:		cpx $0501		; ec 01 05
B8_0ef3:		ora ($02, x)	; 01 02
B8_0ef5:	.db $17
B8_0ef6:	.db $fa
B8_0ef7:		inc $e802, x	; fe 02 e8
B8_0efa:		stx $01ec		; 8e ec 01
B8_0efd:		ora $01			; 05 01
B8_0eff:	.db $02
B8_0f00:	.db $07
B8_0f01:	.db $fa
B8_0f02:	.db $fb
B8_0f03:		sbc $ec8e, x	; fd 8e ec
B8_0f06:		.db $00				; 00
B8_0f07:	.db $03
B8_0f08:		ora ($00, x)	; 01 00
B8_0f0a:	.db $07
B8_0f0b:	.db $fa
B8_0f0c:		cpx $0501		; ec 01 05
B8_0f0f:		ora ($02, x)	; 01 02
B8_0f11:	.db $0f
B8_0f12:		cpx $0300		; ec 00 03
B8_0f15:		ora ($00, x)	; 01 00
B8_0f17:	.db $07
B8_0f18:	.db $fa
B8_0f19:	.db $fb
B8_0f1a:		inx				; e8 
B8_0f1b:		stx $e8fb		; 8e fb e8
B8_0f1e:	.db $8e $ec $00
B8_0f21:	.db $03
B8_0f22:		ora ($00, x)	; 01 00
B8_0f24:	.db $0f
B8_0f25:		ora ($08, x)	; 01 08
B8_0f27:	.db $fa
B8_0f28:	.db $fb
B8_0f29:	.db $0c
B8_0f2a:	.db $8f
B8_0f2b:	.db $fb
B8_0f2c:	.db $fb
B8_0f2d:		stx $05fe		; 8e fe 05
B8_0f30:	.db $2b
B8_0f31:	.db $8f
B8_0f32:		cpx $0300		; ec 00 03
B8_0f35:		ora ($00, x)	; 01 00
B8_0f37:	.db $0f
B8_0f38:		ora ($08, x)	; 01 08
B8_0f3a:		cpx $0501		; ec 01 05
B8_0f3d:		ora ($02, x)	; 01 02
B8_0f3f:	.db $0f
B8_0f40:		cpx $0300		; ec 00 03
B8_0f43:		ora ($00, x)	; 01 00
B8_0f45:	.db $07
B8_0f46:	.db $03
B8_0f47:		ora ($00, x)	; 01 00
B8_0f49:	.db $0f
B8_0f4a:		ora ($08, x)	; 01 08
B8_0f4c:		cpx $0501		; ec 01 05
B8_0f4f:		ora ($02, x)	; 01 02
B8_0f51:	.db $0f
B8_0f52:		cpx $0100		; ec 00 01
B8_0f55:		php				; 08 
B8_0f56:		inc $3202, x	; fe 02 32
B8_0f59:	.db $8f
B8_0f5a:		cpx $0300		; ec 00 03
B8_0f5d:		ora ($00, x)	; 01 00
B8_0f5f:	.db $0f
B8_0f60:		ora ($08, x)	; 01 08
B8_0f62:		cpx $0501		; ec 01 05
B8_0f65:		ora ($02, x)	; 01 02
B8_0f67:	.db $0f
B8_0f68:		cpx $0300		; ec 00 03
B8_0f6b:		ora ($00, x)	; 01 00
B8_0f6d:	.db $07
B8_0f6e:	.db $fa
B8_0f6f:	.db $03
B8_0f70:		ora ($00, x)	; 01 00
B8_0f72:	.db $07
B8_0f73:		cpx $0501		; ec 01 05
B8_0f76:		ora ($02, x)	; 01 02
B8_0f78:	.db $07
B8_0f79:		cpx $0300		; ec 00 03
B8_0f7c:		ora ($00, x)	; 01 00
B8_0f7e:	.db $07
B8_0f7f:		cpx $0501		; ec 01 05
B8_0f82:		ora ($02, x)	; 01 02
B8_0f84:	.db $0f
B8_0f85:		ora $01			; 05 01
B8_0f87:	.db $02
B8_0f88:	.db $07
B8_0f89:	.db $fa
B8_0f8a:	.db $fb
B8_0f8b:	.db $32
B8_0f8c:	.db $8f
B8_0f8d:	.db $fb
B8_0f8e:		sbc $fb8e, x	; fd 8e fb
B8_0f91:		sbc $fb8e, x	; fd 8e fb
B8_0f94:		ora $8f			; 05 8f
B8_0f96:	.db $fb
B8_0f97:	.db $7f
B8_0f98:	.db $8f
B8_0f99:		cpx $0300		; ec 00 03
B8_0f9c:		ora ($00, x)	; 01 00
B8_0f9e:	.db $0f
B8_0f9f:	.db $03
B8_0fa0:		ora ($00, x)	; 01 00
B8_0fa2:	.db $07
B8_0fa3:	.db $fa
B8_0fa4:		cpx $0501		; ec 01 05
B8_0fa7:		ora ($02, x)	; 01 02
B8_0fa9:	.db $0f
B8_0faa:		cpx $0100		; ec 00 01
B8_0fad:		php				; 08 
B8_0fae:	.db $fa
B8_0faf:	.db $fb
B8_0fb0:		and ($8f, x)	; 21 8f
B8_0fb2:	.db $fb
B8_0fb3:		ldy $8f			; a4 8f
B8_0fb5:		inc $9b03, x	; fe 03 9b
B8_0fb8:	.db $8f
B8_0fb9:	.db $fb
B8_0fba:		and ($8f, x)	; 21 8f
B8_0fbc:	.db $fb
B8_0fbd:		ldy $8f			; a4 8f
B8_0fbf:		inc $b905, x	; fe 05 b9
B8_0fc2:	.db $8f
B8_0fc3:	.db $fb
B8_0fc4:		and ($8f, x)	; 21 8f
B8_0fc6:	.db $fb
B8_0fc7:	.db $0c
B8_0fc8:	.db $8f
B8_0fc9:		cpx $0502		; ec 02 05
B8_0fcc:	.db $02
B8_0fcd:	.db $03
B8_0fce:		asl $ec			; 06 ec
B8_0fd0:		ora ($79, x)	; 01 79
B8_0fd2:		ora ($00, x)	; 01 00
B8_0fd4:	.db $07
B8_0fd5:	.db $fb
B8_0fd6:		ora $8f			; 05 8f
B8_0fd8:		cpx $0501		; ec 01 05
B8_0fdb:		ora ($02, x)	; 01 02
B8_0fdd:	.db $0f
B8_0fde:	.db $fb
B8_0fdf:		sbc $fb8e, x	; fd 8e fb
B8_0fe2:	.db $32
B8_0fe3:	.db $8f
B8_0fe4:	.db $fb
B8_0fe5:	.db $6f
B8_0fe6:	.db $8f
B8_0fe7:		sbc $e101, x	; fd 01 e1
B8_0fea:	.db $8f
B8_0feb:		cpx $0300		; ec 00 03
B8_0fee:		ora ($00, x)	; 01 00
B8_0ff0:	.db $0f
B8_0ff1:		ora ($08, x)	; 01 08
B8_0ff3:		cpx $0501		; ec 01 05
B8_0ff6:		ora ($02, x)	; 01 02
B8_0ff8:	.db $0f
B8_0ff9:		cpx $0300		; ec 00 03
B8_0ffc:		ora ($00, x)	; 01 00
B8_0ffe:	.db $07
B8_0fff:	.db $03
B8_1000:		ora ($00, x)	; 01 00
B8_1002:	.db $0f
B8_1003:		ora ($08, x)	; 01 08
B8_1005:		cpx $0501		; ec 01 05
B8_1008:		ora ($02, x)	; 01 02
B8_100a:	.db $0f
B8_100b:		cpx $0100		; ec 00 01
B8_100e:		php				; 08 
B8_100f:	.db $fa
B8_1010:		inc $ed05, x	; fe 05 ed
B8_1013:	.db $8f
B8_1014:	.db $fb
B8_1015:		sbc $fb8f		; ed8f fb
B8_1018:	.db $9b
B8_1019:	.db $8f
B8_101a:	.db $fb
B8_101b:	.db $0c
B8_101c:	.db $8f
B8_101d:		cpx $0503		; ec 03 05
B8_1020:	.db $02
B8_1021:	.db $03
B8_1022:		asl $fb			; 06 fb
B8_1024:	.db $fb
B8_1025:		stx $05fb		; 8e fb 05
B8_1028:	.db $8f
B8_1029:	.db $fb
B8_102a:	.db $fb
B8_102b:		stx $02fe		; 8e fe 02
B8_102e:		and #$90		; 29 90
B8_1030:		sbc $1401, x	; fd 01 14
B8_1033:		;removed
	.db $90 $fc

B8_1035:	.db $32
B8_1036:	.db $8f
B8_1037:	.db $f3
B8_1038:	.db $f2
B8_1039:	.db $89
B8_103a:		inc $18, x		; f6 18
B8_103c:	.db $07
B8_103d:	.db $07
B8_103e:	.db $07
B8_103f:	.db $07
B8_1040:		php				; 08 
B8_1041:		php				; 08 
B8_1042:		inc $08, x		; f6 08
B8_1044:		php				; 08 
B8_1045:	.db $14
B8_1046:		php				; 08 
B8_1047:		inc $18, x		; f6 18
B8_1049:		php				; 08 
B8_104a:		sbc $3a01, x	; fd 01 3a
B8_104d:		bcc B8_1045 ; 90 f6

B8_104f:		php				; 08 
B8_1050:	.db $07
B8_1051:	.db $07
B8_1052:	.db $07
B8_1053:		inc $18, x		; f6 18
B8_1055:	.db $07
B8_1056:	.db $07
B8_1057:	.db $07
B8_1058:	.db $fa
B8_1059:		inc $08, x		; f6 08
B8_105b:	.db $07
B8_105c:		asl $f607		; 0e 07 f6
B8_105f:		clc				; 18 
B8_1060:	.db $07
B8_1061:	.db $07
B8_1062:	.db $07
B8_1063:	.db $fa
B8_1064:	.db $fb
B8_1065:		lsr $f690		; 4e 90 f6
B8_1068:		php				; 08 
B8_1069:	.db $07
B8_106a:	.db $13
B8_106b:	.db $07
B8_106c:		inc $10, x		; f6 10
B8_106e:	.db $07
B8_106f:		inc $08, x		; f6 08
B8_1071:	.db $07
B8_1072:	.db $07
B8_1073:		ora #$0b		; 09 0b
B8_1075:	.db $0c
B8_1076:	.db $0b
B8_1077:		ora #$fa		; 09 fa
B8_1079:	.db $fb
B8_107a:		lsr $fb90		; 4e 90 fb
B8_107d:		eor $fb90, y	; 59 90 fb
B8_1080:		lsr $f690		; 4e 90 f6
B8_1083:		php				; 08 
B8_1084:	.db $07
B8_1085:	.db $07
B8_1086:	.db $07
B8_1087:		inc $18, x		; f6 18
B8_1089:	.db $07
B8_108a:		inc $08, x		; f6 08
B8_108c:	.db $07
B8_108d:	.db $13
B8_108e:	.db $07
B8_108f:	.db $f7
B8_1090:	.db $07
B8_1091:		;removed
	.db $10 $07

B8_1093:		php				; 08 
B8_1094:		inc $08, x		; f6 08
B8_1096:	.db $0c
B8_1097:	.db $0c
B8_1098:	.db $0c
B8_1099:		inc $18, x		; f6 18
B8_109b:	.db $0c
B8_109c:	.db $0c
B8_109d:	.db $0c
B8_109e:		inc $9401, x	; fe 01 94
B8_10a1:		bcc B8_1099 ; 90 f6

B8_10a3:		php				; 08 
B8_10a4:	.db $0b
B8_10a5:	.db $0b
B8_10a6:	.db $0b
B8_10a7:		inc $18, x		; f6 18
B8_10a9:	.db $0b
B8_10aa:	.db $0b
B8_10ab:	.db $0b
B8_10ac:		inc $08, x		; f6 08
B8_10ae:		bpl B8_10c0 ; 10 10

B8_10b0:		;removed
	.db $10 $f6

B8_10b2:		clc				; 18 
B8_10b3:		;removed
	.db $10 $10

B8_10b5:		bpl B8_10c8 ; 10 11

B8_10b7:		inc $b607, x	; fe 07 b6
B8_10ba:		bcc B8_10b2 ; 90 f6

B8_10bc:		php				; 08 
B8_10bd:		asl $0e0e		; 0e 0e 0e
B8_10c0:	.db $fa
B8_10c1:		inc $18, x		; f6 18
B8_10c3:		asl $0e0e		; 0e 0e 0e
B8_10c6:	.db $fb
B8_10c7:	.db $bb
B8_10c8:		bcc B8_10c1 ; 90 f7

B8_10ca:		asl $0e18		; 0e 18 0e
B8_10cd:		php				; 08 
B8_10ce:		inc $cc05, x	; fe 05 cc
B8_10d1:		bcc B8_10ce ; 90 fb

B8_10d3:		lsr $fb90		; 4e 90 fb
B8_10d6:		eor $fb90, y	; 59 90 fb
B8_10d9:		lsr $fb90		; 4e 90 fb
B8_10dc:	.db $67
B8_10dd:		;removed
	.db $90 $fb

B8_10df:		lsr $fb90		; 4e 90 fb
B8_10e2:		lsr $f690		; 4e 90 f6
B8_10e5:		php				; 08 
B8_10e6:		ora $05			; 05 05
B8_10e8:		ora $f6			; 05 f6
B8_10ea:		clc				; 18 
B8_10eb:		ora $05			; 05 05
B8_10ed:		ora $f6			; 05 f6
B8_10ef:		php				; 08 
B8_10f0:	.db $04
B8_10f1:		bpl B8_10f7 ; 10 04

B8_10f3:	.db $f7
B8_10f4:	.db $04
B8_10f5:		clc				; 18 
B8_10f6:	.db $04
B8_10f7:		bpl B8_10ef ; 10 f6

B8_10f9:		php				; 08 
B8_10fa:	.db $04
B8_10fb:		php				; 08 
B8_10fc:		ora #$f7		; 09 f7
B8_10fe:	.db $0b
B8_10ff:	.db $07
B8_1100:		jsr $0902		; 20 02 09
B8_1103:	.db $07
B8_1104:		ora #$08		; 09 08
B8_1106:		ora #$08		; 09 08
B8_1108:	.db $1c
B8_1109:		bpl B8_112b ; 10 20

B8_110b:	.db $07
B8_110c:		jsr $0902		; 20 02 09
B8_110f:	.db $17
B8_1110:	.db $1c
B8_1111:	.db $17
B8_1112:	.db $fa
B8_1113:		jsr $0c02		; 20 02 0c
B8_1116:	.db $07
B8_1117:	.db $0c
B8_1118:		php				; 08 
B8_1119:	.db $0c
B8_111a:		php				; 08 
B8_111b:	.db $1c
B8_111c:		;removed
	.db $10 $20

B8_111e:	.db $07
B8_111f:		jsr $0c02		; 20 02 0c
B8_1122:	.db $17
B8_1123:	.db $1c
B8_1124:	.db $17
B8_1125:		jsr $0b02		; 20 02 0b
B8_1128:	.db $07
B8_1129:	.db $0b
B8_112a:		php				; 08 
B8_112b:	.db $0b
B8_112c:		php				; 08 
B8_112d:	.db $1c
B8_112e:		;removed
	.db $10 $20

B8_1130:	.db $07
B8_1131:		jsr $0b02		; 20 02 0b
B8_1134:	.db $17
B8_1135:	.db $1c
B8_1136:	.db $17
B8_1137:		jsr $1002		; 20 02 10
B8_113a:	.db $07
B8_113b:		;removed
	.db $10 $08

B8_113d:		bpl B8_1147 ; 10 08

B8_113f:	.db $1c
B8_1140:		bpl B8_1162 ; 10 20

B8_1142:	.db $07
B8_1143:		jsr $1002		; 20 02 10
B8_1146:	.db $17
B8_1147:	.db $1c
B8_1148:	.db $17
B8_1149:	.db $fb
B8_114a:		.db $00				; 00
B8_114b:		sta ($20), y	; 91 20
B8_114d:	.db $02
B8_114e:		asl $0e07		; 0e 07 0e
B8_1151:		php				; 08 
B8_1152:		asl $1c08		; 0e 08 1c
B8_1155:		;removed
	.db $10 $20

B8_1157:	.db $07
B8_1158:		jsr $0e02		; 20 02 0e
B8_115b:	.db $17
B8_115c:	.db $1c
B8_115d:	.db $17
B8_115e:		jsr $0702		; 20 02 07
B8_1161:	.db $07
B8_1162:	.db $07
B8_1163:		php				; 08 
B8_1164:	.db $07
B8_1165:		php				; 08 
B8_1166:	.db $1c
B8_1167:		bpl B8_1189 ; 10 20

B8_1169:	.db $07
B8_116a:		jsr $0702		; 20 02 07
B8_116d:	.db $17
B8_116e:	.db $1c
B8_116f:	.db $17
B8_1170:		jsr $0702		; 20 02 07
B8_1173:	.db $07
B8_1174:	.db $07
B8_1175:	.db $07
B8_1176:		jsr $0702		; 20 02 07
B8_1179:	.db $07
B8_117a:	.db $1c
B8_117b:		bpl B8_119d ; 10 20

B8_117d:		php				; 08 
B8_117e:	.db $1c
B8_117f:		php				; 08 
B8_1180:	.db $1c
B8_1181:	.db $07
B8_1182:		jsr $0702		; 20 02 07
B8_1185:	.db $07
B8_1186:	.db $1c
B8_1187:		php				; 08 
B8_1188:	.db $1c
B8_1189:		php				; 08 
B8_118a:	.db $1c
B8_118b:	.db $07
B8_118c:		inc $5e01, x	; fe 01 5e
B8_118f:		sta ($f2), y	; 91 f2
B8_1191:		ora ($fc, x)	; 01 fc
B8_1193:		lsr $0890		; 4e 90 08
B8_1196:		adc $77, x		; 75 77
B8_1198:		adc $7778, y	; 79 78 77
B8_119b:		.db $00				; 00
B8_119c:	.db $80
B8_119d:	.db $72
B8_119e:	.db $73
B8_119f:	.db $73
B8_11a0:	.db $73
B8_11a1:	.db $74
B8_11a2:		.db $00				; 00
B8_11a3:		;removed
	.db $90 $0a

B8_11a5:	.db $7a
B8_11a6:	.db $7c
B8_11a7:		adc $7b7c, x	; 7d 7c 7b
B8_11aa:	.db $7a
B8_11ab:		adc $8000, y	; 79 00 80
B8_11ae:		adc ($72), y	; 71 72
B8_11b0:	.db $73
B8_11b1:	.db $73
B8_11b2:	.db $74
B8_11b3:	.db $74
B8_11b4:		adc $00, x		; 75 00
B8_11b6:		sty $00			; 84 00
B8_11b8:		sei				; 78 
B8_11b9:	.db $77
B8_11ba:	.db $77
B8_11bb:		ror $72, x		; 76 72
B8_11bd:	.db $77
B8_11be:		adc $74, x		; 75 74
B8_11c0:		.db $00				; 00
B8_11c1:	.db $80
B8_11c2:		.db $00				; 00
B8_11c3:	.db $7a
B8_11c4:		tsx				; ba 
B8_11c5:		tsx				; ba 
B8_11c6:		lda $b1b9, y	; b9 b9 b1
B8_11c9:		ldy $b4, x		; b4 b4
B8_11cb:		.db $00				; 00
B8_11cc:	.db $80
B8_11cd:	.db $0b
B8_11ce:	.db $b7
B8_11cf:		lda $bcbb, y	; b9 bb bc
B8_11d2:	.db $bb
B8_11d3:		tsx				; ba 
B8_11d4:		tsx				; ba 
B8_11d5:		lda $8000, y	; b9 00 80
B8_11d8:		lda ($b3), y	; b1 b3
B8_11da:		lda $00, x		; b5 00
B8_11dc:	.db $80
B8_11dd:		ora ($b4), y	; 11 b4
B8_11df:		lda $b6, x		; b5 b6
B8_11e1:	.db $b7
B8_11e2:		clv				; b8 
B8_11e3:		lda $bbba, y	; b9 ba bb
B8_11e6:		ldy $bcbd, x	; bc bd bc
B8_11e9:	.db $bb
B8_11ea:	.db $bb
B8_11eb:		tsx				; ba 
B8_11ec:		.db $00				; 00
B8_11ed:	.db $80
B8_11ee:		lda ($b3), y	; b1 b3
B8_11f0:		ldy $b5, x		; b4 b5
B8_11f2:		ldx $00, y		; b6 00
B8_11f4:	.db $80
B8_11f5:	.db $0c
B8_11f6:		sei				; 78 
B8_11f7:		adc $7b7a, y	; 79 7a 7b
B8_11fa:	.db $7c
B8_11fb:	.db $7c
B8_11fc:	.db $7b
B8_11fd:	.db $7a
B8_11fe:		adc $8000, y	; 79 00 80
B8_1201:		adc ($72), y	; 71 72
B8_1203:	.db $74
B8_1204:		ror $00, x		; 76 00
B8_1206:		sty $0c			; 84 0c
B8_1208:	.db $7a
B8_1209:	.db $7b
B8_120a:	.db $7c
B8_120b:		adc $7d7e, x	; 7d 7e 7d
B8_120e:	.db $7c
B8_120f:	.db $7b
B8_1210:	.db $7a
B8_1211:		.db $00				; 00
B8_1212:	.db $80
B8_1213:		adc ($72), y	; 71 72
B8_1215:	.db $74
B8_1216:		ror $00, x		; 76 00
B8_1218:		sty $0d			; 84 0d
B8_121a:	.db $77
B8_121b:		sei				; 78 
B8_121c:		adc $7b7a, y	; 79 7a 7b
B8_121f:	.db $7c
B8_1220:	.db $7b
B8_1221:	.db $7c
B8_1222:	.db $7b
B8_1223:	.db $7b
B8_1224:		.db $00				; 00
B8_1225:	.db $80
B8_1226:		adc ($74), y	; 71 74
B8_1228:		ror $00, x		; 76 00
B8_122a:	.db $80
B8_122b:		ora $b8b7		; 0d b7 b8
B8_122e:		lda $bbba, y	; b9 ba bb
B8_1231:		ldy $bcbb, x	; bc bb bc
B8_1234:	.db $bb
B8_1235:	.db $bb
B8_1236:		.db $00				; 00
B8_1237:	.db $80
B8_1238:		lda ($b4), y	; b1 b4
B8_123a:		ldx $00, y		; b6 00
B8_123c:	.db $80
B8_123d:	.db $07
B8_123e:		lda $bbba, y	; b9 ba bb
B8_1241:		ldy $8000, x	; bc 00 80
B8_1244:		lda ($b6), y	; b1 b6
B8_1246:		.db $00				; 00
B8_1247:	.db $80
B8_1248:		.db $00				; 00
B8_1249:		.db $00				; 00
B8_124a:	.db $5c
B8_124b:	.db $92
B8_124c:		ora ($01, x)	; 01 01
B8_124e:	.db $8b
B8_124f:	.db $93
B8_1250:	.db $02
B8_1251:	.db $02
B8_1252:	.db $12
B8_1253:		sty $03, x		; 94 03
B8_1255:	.db $03
B8_1256:		pla				; 68 
B8_1257:		sty $08, x		; 94 08
B8_1259:	.db $77
B8_125a:		sty $ff, x		; 94 ff
B8_125c:		sbc ($01), y	; f1 01
B8_125e:	.db $e7
B8_125f:		asl a			; 0a
B8_1260:		bcc B8_11ec ; 90 8a

B8_1262:		sbc $0a, x		; f5 0a
B8_1264:		nop				; ea 
B8_1265:		sta $94			; 85 94
B8_1267:	.db $17
B8_1268:		plp				; 28 
B8_1269:		nop				; ea 
B8_126a:		;removed
	.db $90 $94

B8_126c:	.db $17
B8_126d:	.db $14
B8_126e:	.db $17
B8_126f:	.db $14
B8_1270:		inc $6403, x	; fe 03 64
B8_1273:	.db $92
B8_1274:	.db $e7
B8_1275:		plp				; 28 
B8_1276:		stx $8a, y		; 96 8a
B8_1278:		nop				; ea 
B8_1279:	.db $9b
B8_127a:		sty $ef, x		; 94 ef
B8_127c:		asl $ea3c, x	; 1e 3c ea
B8_127f:	.db $bb
B8_1280:		sty $1f, x		; 94 1f
B8_1282:	.db $3c
B8_1283:		sbc $c80e		; ed0e c8
B8_1286:		nop				; ea 
B8_1287:	.db $9b
B8_1288:		sty $22, x		; 94 22
B8_128a:	.db $3c
B8_128b:		nop				; ea 
B8_128c:	.db $bb
B8_128d:		sty $23, x		; 94 23
B8_128f:	.db $3c
B8_1290:		sbc $c80e		; ed0e c8
B8_1293:		nop				; ea 
B8_1294:	.db $d2
B8_1295:		sty $e7, x		; 94 e7
B8_1297:		asl a			; 0a
B8_1298:		ldy $8a			; a4 8a
B8_129a:		sbc $04, x		; f5 04
B8_129c:		rol a			; 2a
B8_129d:	.db $14
B8_129e:	.db $ef
B8_129f:		plp				; 28 
B8_12a0:		asl $2a			; 06 2a
B8_12a2:	.db $07
B8_12a3:		plp				; 28 
B8_12a4:	.db $07
B8_12a5:		sbc $04, x		; f5 04
B8_12a7:	.db $27
B8_12a8:	.db $14
B8_12a9:		bit $14			; 24 14
B8_12ab:	.db $23
B8_12ac:	.db $14
B8_12ad:		bit $14			; 24 14
B8_12af:		inc $0a, x		; f6 0a
B8_12b1:	.db $ef
B8_12b2:	.db $27
B8_12b3:		plp				; 28 
B8_12b4:		rol a			; 2a
B8_12b5:	.db $2b
B8_12b6:	.db $f7
B8_12b7:	.db $e2
B8_12b8:		asl $0af5, x	; 1e f5 0a
B8_12bb:		rol a			; 2a
B8_12bc:	.db $3c
B8_12bd:	.db $ef
B8_12be:		plp				; 28 
B8_12bf:		asl $2a			; 06 2a
B8_12c1:	.db $07
B8_12c2:		plp				; 28 
B8_12c3:	.db $07
B8_12c4:	.db $27
B8_12c5:		plp				; 28 
B8_12c6:	.db $fa
B8_12c7:		sbc $2806		; ed06 28
B8_12ca:	.db $e2
B8_12cb:		asl a			; 0a
B8_12cc:		sbc $04, x		; f5 04
B8_12ce:		rol a			; 2a
B8_12cf:	.db $14
B8_12d0:	.db $ef
B8_12d1:		plp				; 28 
B8_12d2:		asl $2a			; 06 2a
B8_12d4:	.db $07
B8_12d5:		plp				; 28 
B8_12d6:	.db $07
B8_12d7:		sbc $04, x		; f5 04
B8_12d9:	.db $27
B8_12da:	.db $14
B8_12db:		bit $14			; 24 14
B8_12dd:		inc $0a, x		; f6 0a
B8_12df:	.db $ef
B8_12e0:	.db $23
B8_12e1:		bit $27			; 24 27
B8_12e3:		plp				; 28 
B8_12e4:		rol a			; 2a
B8_12e5:	.db $2b
B8_12e6:		rol a			; 2a
B8_12e7:		plp				; 28 
B8_12e8:	.db $e2
B8_12e9:		asl $2af7, x	; 1e f7 2a
B8_12ec:		bvc B8_12e8 ; 50 fa

B8_12ee:		sbc $5008		; ed08 50
B8_12f1:		nop				; ea 
B8_12f2:	.db $9b
B8_12f3:		sty $e7, x		; 94 e7
B8_12f5:		plp				; 28 
B8_12f6:		stx $8a, y		; 96 8a
B8_12f8:	.db $ef
B8_12f9:		and ($3c, x)	; 21 3c
B8_12fb:		nop				; ea 
B8_12fc:	.db $bb
B8_12fd:		sty $f5, x		; 94 f5
B8_12ff:	.db $14
B8_1300:		asl $ed28, x	; 1e 28 ed
B8_1303:		asl $fa3c		; 0e 3c fa
B8_1306:		nop				; ea 
B8_1307:	.db $9b
B8_1308:		sty $e2, x		; 94 e2
B8_130a:		plp				; 28 
B8_130b:	.db $ef
B8_130c:	.db $1c
B8_130d:	.db $3c
B8_130e:		nop				; ea 
B8_130f:	.db $bb
B8_1310:		sty $f5, x		; 94 f5
B8_1312:	.db $14
B8_1313:		asl $ed28, x	; 1e 28 ed
B8_1316:		asl $fb3c		; 0e 3c fb
B8_1319:		sbc ($92), y	; f1 92
B8_131b:	.db $fb
B8_131c:		sbc ($92), y	; f1 92
B8_131e:		nop				; ea 
B8_131f:	.db $d2
B8_1320:		sty $e7, x		; 94 e7
B8_1322:		asl a			; 0a
B8_1323:		ldy $8a			; a4 8a
B8_1325:		sbc $0a, x		; f5 0a
B8_1327:	.db $23
B8_1328:		plp				; 28 
B8_1329:		sbc $04, x		; f5 04
B8_132b:		inc $14, x		; f6 14
B8_132d:	.db $22
B8_132e:	.db $23
B8_132f:	.db $ef
B8_1330:	.db $27
B8_1331:		plp				; 28 
B8_1332:		rol a			; 2a
B8_1333:	.db $2b
B8_1334:	.db $f7
B8_1335:		sbc $0a, x		; f5 0a
B8_1337:	.db $e2
B8_1338:	.db $14
B8_1339:		and $e23c		; 2d 3c e2
B8_133c:		asl a			; 0a
B8_133d:	.db $ef
B8_133e:	.db $2b
B8_133f:		asl $2d			; 06 2d
B8_1341:	.db $07
B8_1342:	.db $2b
B8_1343:	.db $07
B8_1344:		sbc $03, x		; f5 03
B8_1346:		inc $14, x		; f6 14
B8_1348:		rol a			; 2a
B8_1349:		plp				; 28 
B8_134a:		rol a			; 2a
B8_134b:	.db $2b
B8_134c:		and $eff7		; 2d f7 ef
B8_134f:	.db $2b
B8_1350:		asl $2d			; 06 2d
B8_1352:	.db $07
B8_1353:	.db $2b
B8_1354:	.db $07
B8_1355:		sbc $04, x		; f5 04
B8_1357:		rol a			; 2a
B8_1358:	.db $14
B8_1359:		plp				; 28 
B8_135a:	.db $14
B8_135b:	.db $e2
B8_135c:		asl $2aef, x	; 1e ef 2a
B8_135f:		plp				; 28 
B8_1360:	.db $fa
B8_1361:		sbc $5008		; ed08 50
B8_1364:		inc $0a, x		; f6 0a
B8_1366:		rol a			; 2a
B8_1367:	.db $2b
B8_1368:		rol a			; 2a
B8_1369:		bit $f7			; 24 f7
B8_136b:		rol a			; 2a
B8_136c:		plp				; 28 
B8_136d:	.db $fa
B8_136e:		sbc $3c08		; ed08 3c
B8_1371:		nop				; ea 
B8_1372:		inc $94			; e6 94
B8_1374:		inc $3b			; e6 3b
B8_1376:	.db $14
B8_1377:		rol $3c, x		; 36 3c
B8_1379:	.db $3b
B8_137a:	.db $14
B8_137b:	.db $3c
B8_137c:	.db $14
B8_137d:		rol $3b28, x	; 3e 28 3b
B8_1380:	.db $14
B8_1381:		rol $3c, x		; 36 3c
B8_1383:	.db $3b
B8_1384:	.db $14
B8_1385:		rol $28, x		; 36 28
B8_1387:	.db $fa
B8_1388:	.db $fc
B8_1389:		lsr $f192, x	; 5e 92 f1
B8_138c:		ora $e7, x		; 15 e7
B8_138e:		asl a			; 0a
B8_138f:		bcc B8_131b ; 90 8a

B8_1391:		sbc $0a, x		; f5 0a
B8_1393:		sed				; f8 
B8_1394:	.db $82
B8_1395:		nop				; ea 
B8_1396:	.db $33
B8_1397:	.db $8b
B8_1398:	.db $17
B8_1399:		plp				; 28 
B8_139a:		nop				; ea 
B8_139b:	.db $3a
B8_139c:	.db $8b
B8_139d:	.db $17
B8_139e:	.db $14
B8_139f:	.db $17
B8_13a0:	.db $14
B8_13a1:		inc $9503, x	; fe 03 95
B8_13a4:	.db $93
B8_13a5:	.db $e7
B8_13a6:		plp				; 28 
B8_13a7:		stx $8a, y		; 96 8a
B8_13a9:		nop				; ea 
B8_13aa:		cpy $ef94		; cc 94 ef
B8_13ad:		asl $1f3c, x	; 1e 3c 1f
B8_13b0:	.db $3c
B8_13b1:		sbc $c83c		; ed3c c8
B8_13b4:	.db $22
B8_13b5:	.db $3c
B8_13b6:	.db $23
B8_13b7:	.db $3c
B8_13b8:		sbc $c83c		; ed3c c8
B8_13bb:		nop				; ea 
B8_13bc:		cmp $fb94, x	; dd 94 fb
B8_13bf:		stx $92, y		; 96 92
B8_13c1:		sbc $280a		; ed0a 28
B8_13c4:	.db $fb
B8_13c5:		dex				; ca 
B8_13c6:	.db $92
B8_13c7:		sbc $3c0c		; ed0c 3c
B8_13ca:	.db $e7
B8_13cb:		plp				; 28 
B8_13cc:		stx $8a, y		; 96 8a
B8_13ce:		nop				; ea 
B8_13cf:	.db $9b
B8_13d0:		sty $ef, x		; 94 ef
B8_13d2:	.db $1c
B8_13d3:	.db $3c
B8_13d4:		nop				; ea 
B8_13d5:	.db $bb
B8_13d6:		sty $f5, x		; 94 f5
B8_13d8:	.db $14
B8_13d9:	.db $1b
B8_13da:		plp				; 28 
B8_13db:		sbc $3c0e		; ed0e 3c
B8_13de:	.db $fa
B8_13df:		nop				; ea 
B8_13e0:	.db $9b
B8_13e1:		sty $ef, x		; 94 ef
B8_13e3:		clc				; 18 
B8_13e4:	.db $3c
B8_13e5:		nop				; ea 
B8_13e6:	.db $bb
B8_13e7:		sty $f5, x		; 94 f5
B8_13e9:	.db $14
B8_13ea:	.db $1b
B8_13eb:		plp				; 28 
B8_13ec:		sbc $3c0e		; ed0e 3c
B8_13ef:	.db $fb
B8_13f0:		dec $fb93		; ce 93 fb
B8_13f3:		dec $ed93		; ce 93 ed
B8_13f6:		asl $14			; 06 14
B8_13f8:		nop				; ea 
B8_13f9:		cmp $fb94, x	; dd 94 fb
B8_13fc:		and ($93, x)	; 21 93
B8_13fe:		sbc $5014		; ed14 50
B8_1401:	.db $fb
B8_1402:	.db $64
B8_1403:	.db $93
B8_1404:		sbc $3c14		; ed14 3c
B8_1407:		nop				; ea 
B8_1408:		.db $00				; 00
B8_1409:		sta $f8, x		; 95 f8
B8_140b:	.db $80
B8_140c:	.db $fb
B8_140d:	.db $74
B8_140e:	.db $93
B8_140f:	.db $fc
B8_1410:		sta $ec93		; 8d 93 ec
B8_1413:	.db $ff
B8_1414:	.db $eb
B8_1415:	.db $1a
B8_1416:		sbc ($01), y	; f1 01
B8_1418:		sbc ($14), y	; f1 14
B8_141a:		bmi B8_1421 ; 30 05

B8_141c:		sbc ($0f), y	; f1 0f
B8_141e:		plp				; 28 
B8_141f:		ora $f1			; 05 f1
B8_1421:	.db $0f
B8_1422:		;removed
	.db $30 $05

B8_1424:		sbc ($0f), y	; f1 0f
B8_1426:	.db $fa
B8_1427:	.db $fb
B8_1428:		asl $2894, x	; 1e 94 28
B8_142b:		ora $f1			; 05 f1
B8_142d:		ora $28			; 05 28
B8_142f:		ora $f1			; 05 f1
B8_1431:		ora $28			; 05 28
B8_1433:		ora $f1			; 05 f1
B8_1435:	.db $0f
B8_1436:	.db $fa
B8_1437:	.db $fb
B8_1438:	.db $32
B8_1439:		sty $fb, x		; 94 fb
B8_143b:		asl $fb94, x	; 1e 94 fb
B8_143e:	.db $32
B8_143f:		sty $30, x		; 94 30
B8_1441:		ora $f1			; 05 f1
B8_1443:		ora $30			; 05 30
B8_1445:		ora $f1			; 05 f1
B8_1447:		ora $28			; 05 28
B8_1449:		ora $f1			; 05 f1
B8_144b:	.db $0f
B8_144c:	.db $fa
B8_144d:	.db $fb
B8_144e:		asl $fe94, x	; 1e 94 fe
B8_1451:		bpl B8_148a ; 10 37

B8_1453:		sty $fb, x		; 94 fb
B8_1455:		asl $fb94, x	; 1e 94 fb
B8_1458:	.db $32
B8_1459:		sty $fe, x		; 94 fe
B8_145b:	.db $03
B8_145c:	.db $57
B8_145d:		sty $fb, x		; 94 fb
B8_145f:		rti				; 40 


B8_1460:		sty $fd, x		; 94 fd
B8_1462:		ora ($54, x)	; 01 54
B8_1464:		sty $fc, x		; 94 fc
B8_1466:		clc				; 18 
B8_1467:		sty $ec, x		; 94 ec
B8_1469:	.db $03
B8_146a:	.db $03
B8_146b:		ora ($02, x)	; 01 02
B8_146d:		plp				; 28 
B8_146e:		cpx $0200		; ec 00 02
B8_1471:	.db $14
B8_1472:	.db $02
B8_1473:	.db $13
B8_1474:	.db $fc
B8_1475:		pla				; 68 
B8_1476:		sty $f3, x		; 94 f3
B8_1478:	.db $f2
B8_1479:	.db $89
B8_147a:		jsr $0b02		; 20 02 0b
B8_147d:	.db $27
B8_147e:	.db $0b
B8_147f:	.db $14
B8_1480:	.db $0b
B8_1481:	.db $13
B8_1482:	.db $fc
B8_1483:	.db $7a
B8_1484:		sty $07, x		; 94 07
B8_1486:		and $393a, y	; 39 3a 39
B8_1489:		sec				; 38 
B8_148a:		.db $00				; 00
B8_148b:	.db $80
B8_148c:		and ($34), y	; 31 34
B8_148e:		.db $00				; 00
B8_148f:	.db $80
B8_1490:	.db $07
B8_1491:	.db $37
B8_1492:		sec				; 38 
B8_1493:	.db $37
B8_1494:		rol $00, x		; 36 00
B8_1496:	.db $80
B8_1497:		and ($33), y	; 31 33
B8_1499:		.db $00				; 00
B8_149a:	.db $80
B8_149b:		.db $00				; 00
B8_149c:		adc ($71), y	; 71 71
B8_149e:	.db $72
B8_149f:	.db $72
B8_14a0:	.db $72
B8_14a1:	.db $73
B8_14a2:	.db $73
B8_14a3:	.db $73
B8_14a4:	.db $74
B8_14a5:	.db $74
B8_14a6:	.db $74
B8_14a7:		adc $75, x		; 75 75
B8_14a9:		adc $76, x		; 75 76
B8_14ab:		ror $76, x		; 76 76
B8_14ad:	.db $77
B8_14ae:	.db $77
B8_14af:	.db $77
B8_14b0:		sei				; 78 
B8_14b1:		sei				; 78 
B8_14b2:		sei				; 78 
B8_14b3:		adc $7979, y	; 79 79 79
B8_14b6:	.db $7a
B8_14b7:	.db $7a
B8_14b8:	.db $7a
B8_14b9:		.db $00				; 00
B8_14ba:		txa				; 8a 
B8_14bb:		ora $7474		; 0d 74 74
B8_14be:	.db $74
B8_14bf:		adc $75, x		; 75 75
B8_14c1:		adc $76, x		; 75 76
B8_14c3:		ror $76, x		; 76 76
B8_14c5:	.db $77
B8_14c6:		.db $00				; 00
B8_14c7:		bcc B8_153a ; 90 71

B8_14c9:	.db $73
B8_14ca:		.db $00				; 00
B8_14cb:	.db $80
B8_14cc:		.db $00				; 00
B8_14cd:	.db $73
B8_14ce:	.db $74
B8_14cf:		adc $00, x		; 75 00
B8_14d1:		txs				; 9a 
B8_14d2:	.db $07
B8_14d3:		sec				; 38 
B8_14d4:		and $3b3a, y	; 39 3a 3b
B8_14d7:		.db $00				; 00
B8_14d8:	.db $80
B8_14d9:		and ($37), y	; 31 37
B8_14db:		.db $00				; 00
B8_14dc:	.db $80
B8_14dd:	.db $04
B8_14de:	.db $32
B8_14df:	.db $33
B8_14e0:	.db $34
B8_14e1:		.db $00				; 00
B8_14e2:	.db $80
B8_14e3:	.db $33
B8_14e4:		.db $00				; 00
B8_14e5:	.db $80
B8_14e6:		.db $00				; 00
B8_14e7:		lda $b7b8, x	; bd b8 b7
B8_14ea:	.db $b7
B8_14eb:	.db $b7
B8_14ec:		ldx $b6, y		; b6 b6
B8_14ee:		ldx $b5, y		; b6 b5
B8_14f0:		lda $b5, x		; b5 b5
B8_14f2:		ldy $b4, x		; b4 b4
B8_14f4:		ldy $b3, x		; b4 b3
B8_14f6:	.db $b3
B8_14f7:		lda $b4, x		; b5 b4
B8_14f9:		ldy $b3, x		; b4 b3
B8_14fb:	.db $b3
B8_14fc:	.db $b3
B8_14fd:	.db $b2
B8_14fe:		.db $00				; 00
B8_14ff:	.db $80
B8_1500:		.db $00				; 00
B8_1501:		ldx $b4, y		; b6 b4
B8_1503:		ldy $b4, x		; b4 b4
B8_1505:		ldy $b3, x		; b4 b3
B8_1507:	.db $b3
B8_1508:	.db $b3
B8_1509:	.db $b3
B8_150a:	.db $b3
B8_150b:	.db $b2
B8_150c:	.db $b2
B8_150d:	.db $b2
B8_150e:	.db $b2
B8_150f:	.db $b2
B8_1510:	.db $b2
B8_1511:	.db $b3
B8_1512:	.db $b2
B8_1513:	.db $b2
B8_1514:	.db $b2
B8_1515:	.db $b2
B8_1516:		lda ($00), y	; b1 00
B8_1518:	.db $80
B8_1519:		.db $00				; 00
B8_151a:		.db $00				; 00
B8_151b:		and $0195		; 2d 95 01
B8_151e:		ora ($91, x)	; 01 91
B8_1520:		sta $02, x		; 95 02
B8_1522:	.db $02
B8_1523:		sta $0395, x	; 9d 95 03
B8_1526:	.db $03
B8_1527:	.db $12
B8_1528:		stx $08, y		; 96 08
B8_152a:		cmp $ff96		; cd 96 ff
B8_152d:		sbc ($01), y	; f1 01
B8_152f:		nop				; ea 
B8_1530:		cmp $e797, y	; d9 97 e7
B8_1533:	.db $23
B8_1534:		stx $8a, y		; 96 8a
B8_1536:		sbc $0e, x		; f5 0e
B8_1538:		plp				; 28 
B8_1539:	.db $54
B8_153a:		sbc $04, x		; f5 04
B8_153c:	.db $27
B8_153d:	.db $1c
B8_153e:	.db $2f
B8_153f:	.db $1c
B8_1540:		and $f51c		; 2d 1c f5
B8_1543:		asl $5428		; 0e 28 54
B8_1546:	.db $fa
B8_1547:	.db $27
B8_1548:	.db $54
B8_1549:	.db $fb
B8_154a:		rol $95, x		; 36 95
B8_154c:		sbc $04, x		; f5 04
B8_154e:	.db $27
B8_154f:	.db $1c
B8_1550:		plp				; 28 
B8_1551:	.db $1c
B8_1552:		rol a			; 2a
B8_1553:	.db $1c
B8_1554:	.db $fa
B8_1555:		sbc $0e, x		; f5 0e
B8_1557:		and $f554		; 2d 54 f5
B8_155a:	.db $04
B8_155b:		bit $341c		; 2c 1c 34
B8_155e:	.db $1c
B8_155f:	.db $32
B8_1560:	.db $1c
B8_1561:		sbc $0e, x		; f5 0e
B8_1563:		and $2c54		; 2d 54 2c
B8_1566:	.db $54
B8_1567:	.db $fa
B8_1568:	.db $fb
B8_1569:		eor $95, x		; 55 95
B8_156b:		inc $54, x		; f6 54
B8_156d:	.db $2b
B8_156e:		and #$2b		; 29 2b
B8_1570:		bit $292b		; 2c 2b 29
B8_1573:	.db $2b
B8_1574:	.db $e2
B8_1575:	.db $3f
B8_1576:	.db $ef
B8_1577:		bit $0ef5		; 2c f5 0e
B8_157a:	.db $f2
B8_157b:	.db $e2
B8_157c:	.db $23
B8_157d:		bit $23			; 24 23
B8_157f:	.db $22
B8_1580:		and ($22, x)	; 21 22
B8_1582:		and ($22, x)	; 21 22
B8_1584:	.db $23
B8_1585:		bit $23			; 24 23
B8_1587:	.db $22
B8_1588:		and ($22, x)	; 21 22
B8_158a:	.db $23
B8_158b:		bit $26			; 24 26
B8_158d:	.db $f7
B8_158e:	.db $fc
B8_158f:	.db $32
B8_1590:		sta $f1, x		; 95 f1
B8_1592:		ora ($ea, x)	; 01 ea
B8_1594:		eor ($8b, x)	; 41 8b
B8_1596:		sbc ($14), y	; f1 14
B8_1598:		sed				; f8 
B8_1599:		sta ($fc, x)	; 81 fc
B8_159b:	.db $32
B8_159c:		sta $ec, x		; 95 ec
B8_159e:	.db $ff
B8_159f:		sbc ($01), y	; f1 01
B8_15a1:		inc $0e, x		; f6 0e
B8_15a3:	.db $1c
B8_15a4:	.db $1f
B8_15a5:		bit $26			; 24 26
B8_15a7:		plp				; 28 
B8_15a8:	.db $2b
B8_15a9:		asl $2723, x	; 1e 23 27
B8_15ac:		rol a			; 2a
B8_15ad:	.db $2b
B8_15ae:		and $1f1c		; 2d 1c 1f
B8_15b1:		bit $26			; 24 26
B8_15b3:		plp				; 28 
B8_15b4:	.db $2b
B8_15b5:		and $272a		; 2d 2a 27
B8_15b8:	.db $23
B8_15b9:		and ($1e, x)	; 21 1e
B8_15bb:		inc $a301, x	; fe 01 a3
B8_15be:		sta $21, x		; 95 21
B8_15c0:		bit $29			; 24 29
B8_15c2:	.db $2b
B8_15c3:		and $2330		; 2d 30 23
B8_15c6:		plp				; 28 
B8_15c7:		bit $302f		; 2c 2f 30
B8_15ca:	.db $32
B8_15cb:		and ($24, x)	; 21 24
B8_15cd:		and #$2b		; 29 2b
B8_15cf:		and $3230		; 2d 30 32
B8_15d2:	.db $2f
B8_15d3:		bit $2628		; 2c 28 26
B8_15d6:	.db $23
B8_15d7:		inc $bf01, x	; fe 01 bf
B8_15da:		sta $24, x		; 95 24
B8_15dc:	.db $27
B8_15dd:		rol $272c		; 2e 2c 27
B8_15e0:		bit $fa			; 24 fa
B8_15e2:		and $27			; 25 27
B8_15e4:		and #$2c		; 29 2c
B8_15e6:		and ($35), y	; 31 35
B8_15e8:		inc $db02, x	; fe 02 db
B8_15eb:		sta $fb, x		; 95 fb
B8_15ed:	.db $db
B8_15ee:		sta $25, x		; 95 25
B8_15f0:		jsr $2725		; 20 25 27
B8_15f3:		plp				; 28 
B8_15f4:		bit $3331		; 2c 31 33
B8_15f7:	.db $34
B8_15f8:	.db $33
B8_15f9:		and ($2c), y	; 31 2c
B8_15fb:		sbc ($28), y	; f1 28
B8_15fd:	.db $2b
B8_15fe:		plp				; 28 
B8_15ff:	.db $2b
B8_1600:		plp				; 28 
B8_1601:		inc $fb07, x	; fe 07 fb
B8_1604:		sta $f1, x		; 95 f1
B8_1606:		rol $29			; 26 29
B8_1608:		rol $29			; 26 29
B8_160a:		rol $fe			; 26 fe
B8_160c:	.db $07
B8_160d:		ora $96			; 05 96
B8_160f:	.db $fc
B8_1610:		lda ($95, x)	; a1 95
B8_1612:		cpx $0300		; ec 00 03
B8_1615:		ora ($00, x)	; 01 00
B8_1617:	.db $1b
B8_1618:		cpx $0501		; ec 01 05
B8_161b:		ora ($01, x)	; 01 01
B8_161d:	.db $0d $ec $00
B8_1620:	.db $03
B8_1621:		ora ($00, x)	; 01 00
B8_1623:		ora $01ec		; 0d ec 01
B8_1626:		ora $01			; 05 01
B8_1628:		ora ($1b, x)	; 01 1b
B8_162a:		inc $1206, x	; fe 06 12
B8_162d:		stx $fa, y		; 96 fa
B8_162f:		cpx $0300		; ec 00 03
B8_1632:		ora ($00, x)	; 01 00
B8_1634:	.db $0d $ec $00
B8_1637:		ora $01			; 05 01
B8_1639:		ora ($0d, x)	; 01 0d
B8_163b:		inc $3502, x	; fe 02 35
B8_163e:		stx $05, y		; 96 05
B8_1640:		ora ($01, x)	; 01 01
B8_1642:	.db $1b
B8_1643:	.db $fb
B8_1644:	.db $12
B8_1645:		stx $ec, y		; 96 ec
B8_1647:		ora $03			; 05 03
B8_1649:		ora ($02, x)	; 01 02
B8_164b:	.db $1b
B8_164c:		cpx $0501		; ec 01 05
B8_164f:		ora ($01, x)	; 01 01
B8_1651:	.db $0d $ec $00
B8_1654:	.db $03
B8_1655:		ora ($00, x)	; 01 00
B8_1657:		ora $01ec		; 0d ec 01
B8_165a:		ora $01			; 05 01
B8_165c:		ora ($1b, x)	; 01 1b
B8_165e:		cpx $0305		; ec 05 03
B8_1661:		ora ($02, x)	; 01 02
B8_1663:	.db $1b
B8_1664:		cpx $0501		; ec 01 05
B8_1667:		ora ($01, x)	; 01 01
B8_1669:	.db $1b
B8_166a:		cpx $0300		; ec 00 03
B8_166d:		ora ($00, x)	; 01 00
B8_166f:	.db $1b
B8_1670:		inc $5e06, x	; fe 06 5e
B8_1673:		stx $ec, y		; 96 ec
B8_1675:		ora $03			; 05 03
B8_1677:		ora ($02, x)	; 01 02
B8_1679:	.db $1b
B8_167a:		cpx $0501		; ec 01 05
B8_167d:		ora ($01, x)	; 01 01
B8_167f:	.db $0d $ec $00
B8_1682:	.db $03
B8_1683:		ora ($00, x)	; 01 00
B8_1685:		ora $01ec		; 0d ec 01
B8_1688:		ora $01			; 05 01
B8_168a:		ora ($1b, x)	; 01 1b
B8_168c:		cpx $0500		; ec 00 05
B8_168f:		ora ($01, x)	; 01 01
B8_1691:		ora $03fe		; 0d fe 03
B8_1694:		stx $0596		; 8e 96 05
B8_1697:		ora ($01, x)	; 01 01
B8_1699:	.db $1b
B8_169a:		cpx $0305		; ec 05 03
B8_169d:		ora ($02, x)	; 01 02
B8_169f:	.db $1b
B8_16a0:		cpx $0501		; ec 01 05
B8_16a3:		ora ($01, x)	; 01 01
B8_16a5:	.db $1b
B8_16a6:		ora $01			; 05 01
B8_16a8:		ora ($1b, x)	; 01 1b
B8_16aa:		inc $9a02, x	; fe 02 9a
B8_16ad:		stx $ec, y		; 96 ec
B8_16af:		ora $03			; 05 03
B8_16b1:		ora ($02, x)	; 01 02
B8_16b3:	.db $1b
B8_16b4:		cpx $0501		; ec 01 05
B8_16b7:		ora ($01, x)	; 01 01
B8_16b9:	.db $0d $ec $00
B8_16bc:	.db $03
B8_16bd:		ora ($00, x)	; 01 00
B8_16bf:		ora $01ec		; 0d ec 01
B8_16c2:		ora $01			; 05 01
B8_16c4:		ora ($1b, x)	; 01 1b
B8_16c6:		sbc $9a03, x	; fd 03 9a
B8_16c9:		stx $fc, y		; 96 fc
B8_16cb:	.db $12
B8_16cc:		stx $f3, y		; 96 f3
B8_16ce:	.db $f2
B8_16cf:	.db $89
B8_16d0:		jsr $0c02		; 20 02 0c
B8_16d3:	.db $1a
B8_16d4:	.db $1c
B8_16d5:	.db $02
B8_16d6:		sbc ($0c), y	; f1 0c
B8_16d8:		jsr $0702		; 20 02 07
B8_16db:	.db $0c
B8_16dc:	.db $1c
B8_16dd:	.db $02
B8_16de:	.db $0c
B8_16df:	.db $1a
B8_16e0:	.db $fa
B8_16e1:		jsr $0b02		; 20 02 0b
B8_16e4:	.db $1a
B8_16e5:	.db $1c
B8_16e6:	.db $02
B8_16e7:		sbc ($0c), y	; f1 0c
B8_16e9:		jsr $0602		; 20 02 06
B8_16ec:	.db $0c
B8_16ed:	.db $1c
B8_16ee:	.db $02
B8_16ef:	.db $0b
B8_16f0:	.db $1a
B8_16f1:		inc $d002, x	; fe 02 d0
B8_16f4:		stx $fb, y		; 96 fb
B8_16f6:		;removed
	.db $d0 $96

B8_16f8:		jsr $1702		; 20 02 17
B8_16fb:	.db $0c
B8_16fc:		ora $1d0e, x	; 1d 0e 1d
B8_16ff:		asl $0e1d		; 0e 1d 0e
B8_1702:		asl $201c, x	; 1e 1c 20
B8_1705:	.db $02
B8_1706:		ora ($1a), y	; 11 1a
B8_1708:	.db $1c
B8_1709:	.db $02
B8_170a:		sbc ($0c), y	; f1 0c
B8_170c:		jsr $0c02		; 20 02 0c
B8_170f:	.db $0c
B8_1710:	.db $1c
B8_1711:	.db $02
B8_1712:		ora ($1a), y	; 11 1a
B8_1714:	.db $fa
B8_1715:		jsr $1002		; 20 02 10
B8_1718:	.db $1a
B8_1719:	.db $1c
B8_171a:	.db $02
B8_171b:		sbc ($0c), y	; f1 0c
B8_171d:		jsr $0b02		; 20 02 0b
B8_1720:	.db $0c
B8_1721:	.db $1c
B8_1722:	.db $02
B8_1723:		bpl B8_173f ; 10 1a

B8_1725:		inc wEntityStructs.tileY.w, x	; fe 02 04
B8_1728:	.db $97
B8_1729:	.db $fb
B8_172a:	.db $04
B8_172b:	.db $97
B8_172c:		jsr $1002		; 20 02 10
B8_172f:	.db $1a
B8_1730:	.db $1c
B8_1731:	.db $02
B8_1732:		sbc ($0c), y	; f1 0c
B8_1734:		jsr $f102		; 20 02 f1
B8_1737:	.db $0c
B8_1738:	.db $1c
B8_1739:	.db $02
B8_173a:	.db $04
B8_173b:	.db $1a
B8_173c:		jsr $0802		; 20 02 08
B8_173f:	.db $1a
B8_1740:	.db $1c
B8_1741:	.db $02
B8_1742:		sbc ($1a), y	; f1 1a
B8_1744:		jsr $0802		; 20 02 08
B8_1747:	.db $1a
B8_1748:	.db $fa
B8_1749:		jsr $0d02		; 20 02 0d
B8_174c:	.db $1a
B8_174d:	.db $1c
B8_174e:	.db $02
B8_174f:		sbc ($1a), y	; f1 1a
B8_1751:		jsr $0d02		; 20 02 0d
B8_1754:	.db $1a
B8_1755:		inc $3c02, x	; fe 02 3c
B8_1758:	.db $97
B8_1759:	.db $fb
B8_175a:	.db $3c
B8_175b:	.db $97
B8_175c:		jsr $0d02		; 20 02 0d
B8_175f:	.db $1a
B8_1760:	.db $1c
B8_1761:	.db $02
B8_1762:		sbc ($0c), y	; f1 0c
B8_1764:		jsr $f102		; 20 02 f1
B8_1767:	.db $0c
B8_1768:	.db $1c
B8_1769:	.db $02
B8_176a:		ora $1d1a		; 0d 1a 1d
B8_176d:		asl $0e1d		; 0e 1d 0e
B8_1770:		asl $1e0e, x	; 1e 0e 1e
B8_1773:		asl $1c1f		; 0e 1f 1c
B8_1776:		jsr $0c02		; 20 02 0c
B8_1779:	.db $1a
B8_177a:	.db $1c
B8_177b:	.db $02
B8_177c:		sbc ($1a), y	; f1 1a
B8_177e:	.db $1c
B8_177f:	.db $02
B8_1780:	.db $0c
B8_1781:	.db $1a
B8_1782:	.db $fa
B8_1783:		jsr $0702		; 20 02 07
B8_1786:	.db $1a
B8_1787:	.db $1c
B8_1788:	.db $02
B8_1789:		sbc ($1a), y	; f1 1a
B8_178b:	.db $1c
B8_178c:	.db $02
B8_178d:	.db $07
B8_178e:	.db $1a
B8_178f:	.db $fb
B8_1790:		ror $97, x		; 76 97
B8_1792:		jsr $0702		; 20 02 07
B8_1795:	.db $1a
B8_1796:	.db $1c
B8_1797:	.db $02
B8_1798:		sbc ($0c), y	; f1 0c
B8_179a:		jsr $f102		; 20 02 f1
B8_179d:	.db $0c
B8_179e:	.db $1c
B8_179f:	.db $02
B8_17a0:	.db $07
B8_17a1:	.db $1a
B8_17a2:		inc $7601, x	; fe 01 76
B8_17a5:	.db $97
B8_17a6:		jsr $0e02		; 20 02 0e
B8_17a9:	.db $1a
B8_17aa:	.db $1c
B8_17ab:	.db $02
B8_17ac:		sbc ($1a), y	; f1 1a
B8_17ae:	.db $1c
B8_17af:	.db $02
B8_17b0:		asl $fa1a		; 0e 1a fa
B8_17b3:		jsr $0702		; 20 02 07
B8_17b6:	.db $1a
B8_17b7:	.db $1c
B8_17b8:	.db $02
B8_17b9:		sbc ($1a), y	; f1 1a
B8_17bb:	.db $1c
B8_17bc:	.db $02
B8_17bd:	.db $07
B8_17be:	.db $1a
B8_17bf:	.db $fb
B8_17c0:		ldx $97			; a6 97
B8_17c2:		jsr $0702		; 20 02 07
B8_17c5:	.db $1a
B8_17c6:	.db $1c
B8_17c7:	.db $02
B8_17c8:		sbc ($0c), y	; f1 0c
B8_17ca:		jsr $0e02		; 20 02 0e
B8_17cd:	.db $0c
B8_17ce:	.db $1c
B8_17cf:	.db $02
B8_17d0:	.db $07
B8_17d1:	.db $1a
B8_17d2:		inc $a601, x	; fe 01 a6
B8_17d5:	.db $97
B8_17d6:	.db $fc
B8_17d7:		;removed
	.db $d0 $96

B8_17d9:	.db $0c
B8_17da:		ror $76, x		; 76 76
B8_17dc:	.db $77
B8_17dd:	.db $77
B8_17de:		sei				; 78 
B8_17df:		sei				; 78 
B8_17e0:		adc $7979, y	; 79 79 79
B8_17e3:		.db $00				; 00
B8_17e4:	.db $80
B8_17e5:		adc ($77), y	; 71 77
B8_17e7:		.db $00				; 00
B8_17e8:	.db $80
B8_17e9:		.db $00				; 00
B8_17ea:		.db $00				; 00
B8_17eb:		sbc $0197, x	; fd 97 01
B8_17ee:		ora ($16, x)	; 01 16
B8_17f0:		tya				; 98 
B8_17f1:	.db $02
B8_17f2:	.db $02
B8_17f3:	.db $2f
B8_17f4:		tya				; 98 
B8_17f5:	.db $03
B8_17f6:	.db $03
B8_17f7:		eor ($98, x)	; 41 98
B8_17f9:		php				; 08 
B8_17fa:	.db $42
B8_17fb:		tya				; 98 
B8_17fc:	.db $ff
B8_17fd:		nop				; ea 
B8_17fe:		ror $98, x		; 76 98
B8_1800:	.db $e7
B8_1801:		sec				; 38 
B8_1802:		bcs B8_178e ; b0 8a

B8_1804:		inc $a8, x		; f6 a8
B8_1806:		sbc $1c, x		; f5 1c
B8_1808:	.db $1c
B8_1809:	.db $1a
B8_180a:	.db $1c
B8_180b:	.db $1a
B8_180c:		jsr $201d		; 20 1d 20
B8_180f:	.db $e2
B8_1810:	.db $54
B8_1811:	.db $ef
B8_1812:		and ($ed, x)	; 21 ed
B8_1814:		clc				; 18 
B8_1815:		beq B8_1801 ; f0 ea

B8_1817:		ror $98, x		; 76 98
B8_1819:	.db $e7
B8_181a:		rol $b0, x		; 36 b0
B8_181c:		txa				; 8a 
B8_181d:		inc $a8, x		; f6 a8
B8_181f:		sbc $1c, x		; f5 1c
B8_1821:	.db $17
B8_1822:		asl $17, x		; 16 17
B8_1824:		asl $1b, x		; 16 1b
B8_1826:		clc				; 18 
B8_1827:	.db $1b
B8_1828:	.db $e2
B8_1829:	.db $52
B8_182a:	.db $ef
B8_182b:		ora $18ed, x	; 1d ed 18
B8_182e:		beq B8_181c ; f0 ec

B8_1830:	.db $ff
B8_1831:	.db $e7
B8_1832:	.db $33
B8_1833:		bcs B8_17bf ; b0 8a

B8_1835:		inc $a8, x		; f6 a8
B8_1837:	.db $1f
B8_1838:		ora $1d1f, x	; 1d 1f 1d
B8_183b:	.db $23
B8_183c:		and ($23, x)	; 21 23
B8_183e:		bit $f2			; 24 f2
B8_1840:		beq B8_1832 ; f0 f0

B8_1842:	.db $f3
B8_1843:	.db $f2
B8_1844:	.db $89
B8_1845:	.db $04
B8_1846:	.db $1c
B8_1847:	.db $04
B8_1848:		sec				; 38 
B8_1849:	.db $04
B8_184a:	.db $1c
B8_184b:	.db $04
B8_184c:		sec				; 38 
B8_184d:		asl a			; 0a
B8_184e:	.db $1c
B8_184f:		asl a			; 0a
B8_1850:		sec				; 38 
B8_1851:		asl a			; 0a
B8_1852:	.db $1c
B8_1853:		asl a			; 0a
B8_1854:		sec				; 38 
B8_1855:		inc $4501, x	; fe 01 45
B8_1858:		tya				; 98 
B8_1859:		php				; 08 
B8_185a:	.db $1c
B8_185b:		php				; 08 
B8_185c:		sec				; 38 
B8_185d:		php				; 08 
B8_185e:	.db $1c
B8_185f:		php				; 08 
B8_1860:		sec				; 38 
B8_1861:		ora $1c			; 05 1c
B8_1863:		ora $38			; 05 38
B8_1865:		ora $1c			; 05 1c
B8_1867:		ora $38			; 05 38
B8_1869:		inc $5901, x	; fe 01 59
B8_186c:		tya				; 98 
B8_186d:		ora $1c			; 05 1c
B8_186f:		ora $38			; 05 38
B8_1871:		ora $1c			; 05 1c
B8_1873:		ora $38			; 05 38
B8_1875:		;removed
	.db $f0 $22

B8_1877:		and ($31), y	; 31 31
B8_1879:		and ($31), y	; 31 31
B8_187b:		and ($32), y	; 31 32
B8_187d:	.db $32
B8_187e:	.db $32
B8_187f:	.db $32
B8_1880:	.db $32
B8_1881:	.db $33
B8_1882:	.db $33
B8_1883:	.db $33
B8_1884:	.db $33
B8_1885:	.db $33
B8_1886:	.db $34
B8_1887:	.db $34
B8_1888:	.db $34
B8_1889:	.db $34
B8_188a:	.db $34
B8_188b:		and $35, x		; 35 35
B8_188d:		and $35, x		; 35 35
B8_188f:		and $36, x		; 35 36
B8_1891:		rol $36, x		; 36 36
B8_1893:		rol $36, x		; 36 36
B8_1895:	.db $37
B8_1896:		.db $00				; 00
B8_1897:	.db $80
B8_1898:		and ($35), y	; 31 35
B8_189a:		.db $00				; 00
B8_189b:	.db $8f
B8_189c:		.db $00				; 00
B8_189d:		.db $00				; 00
B8_189e:		bcs B8_1838 ; b0 98

B8_18a0:		ora ($01, x)	; 01 01
B8_18a2:		ldx $99			; a6 99
B8_18a4:	.db $02
B8_18a5:	.db $02
B8_18a6:	.db $5f
B8_18a7:		txs				; 9a 
B8_18a8:	.db $03
B8_18a9:	.db $03
B8_18aa:	.db $fa
B8_18ab:		txs				; 9a 
B8_18ac:		php				; 08 
B8_18ad:	.db $3c
B8_18ae:	.db $9c
B8_18af:	.db $ff
B8_18b0:		sbc ($01), y	; f1 01
B8_18b2:		nop				; ea 
B8_18b3:	.db $74
B8_18b4:		sta $15ee, x	; 9d ee 15
B8_18b7:	.db $1c
B8_18b8:	.db $1c
B8_18b9:	.db $1c
B8_18ba:	.db $1c
B8_18bb:		sbc $0e, x		; f5 0e
B8_18bd:	.db $1c
B8_18be:		asl $071c		; 0e 1c 07
B8_18c1:	.db $1c
B8_18c2:	.db $07
B8_18c3:	.db $1c
B8_18c4:	.db $07
B8_18c5:	.db $1c
B8_18c6:	.db $07
B8_18c7:		sbc $0e05		; ed05 0e
B8_18ca:	.db $fa
B8_18cb:		nop				; ea 
B8_18cc:		ror $f99d, x	; 7e 9d f9
B8_18cf:	.db $03
B8_18d0:	.db $fb
B8_18d1:		lda $98, x		; b5 98
B8_18d3:		nop				; ea 
B8_18d4:		dey				; 88 
B8_18d5:		sta $02f9, x	; 9d f9 02
B8_18d8:	.db $fb
B8_18d9:		lda $98, x		; b5 98
B8_18db:		nop				; ea 
B8_18dc:	.db $92
B8_18dd:		sta $05f9, x	; 9d f9 05
B8_18e0:	.db $fb
B8_18e1:		lda $98, x		; b5 98
B8_18e3:		sbc $fb08, y	; f9 08 fb
B8_18e6:		lda $98, x		; b5 98
B8_18e8:		sbc $ee00, y	; f9 00 ee
B8_18eb:		ora $24, x		; 15 24
B8_18ed:	.db $1c
B8_18ee:		sbc $0e, x		; f5 0e
B8_18f0:		bit $0e			; 24 0e
B8_18f2:		bit $07			; 24 07
B8_18f4:		bit $07			; 24 07
B8_18f6:		inc $0e, x		; f6 0e
B8_18f8:		bit $24			; 24 24
B8_18fa:		bit $24			; 24 24
B8_18fc:	.db $f7
B8_18fd:	.db $fa
B8_18fe:		nop				; ea 
B8_18ff:	.db $9c
B8_1900:		sta $15e7, x	; 9d e7 15
B8_1903:		stx $8a, y		; 96 8a
B8_1905:		sbc $0e, x		; f5 0e
B8_1907:	.db $2b
B8_1908:	.db $54
B8_1909:		inc $07, x		; f6 07
B8_190b:	.db $1f
B8_190c:		bit $fa			; 24 fa
B8_190e:		plp				; 28 
B8_190f:	.db $2b
B8_1910:	.db $f7
B8_1911:		and #$1c		; 29 1c
B8_1913:		plp				; 28 
B8_1914:	.db $1c
B8_1915:		rol $1c			; 26 1c
B8_1917:	.db $fa
B8_1918:		bit $0e			; 24 0e
B8_191a:		sbc $0702		; ed02 07
B8_191d:		bit $07			; 24 07
B8_191f:	.db $e2
B8_1920:		rol a			; 2a
B8_1921:		sbc $0e, x		; f5 0e
B8_1923:		plp				; 28 
B8_1924:		bvs B8_1910 ; 70 ea

B8_1926:	.db $92
B8_1927:		sta $1c16, x	; 9d 16 1c
B8_192a:		ora $1c, x		; 15 1c
B8_192c:		asl $1c, x		; 16 1c
B8_192e:		clc				; 18 
B8_192f:		asl $02ed		; 0e ed 02
B8_1932:	.db $07
B8_1933:		clc				; 18 
B8_1934:	.db $07
B8_1935:	.db $fb
B8_1936:		inc $fb98, x	; fe 98 fb
B8_1939:		asl $2899		; 0e 99 28
B8_193c:		asl $02ed		; 0e ed 02
B8_193f:	.db $07
B8_1940:		plp				; 28 
B8_1941:	.db $07
B8_1942:		and #$54		; 29 54
B8_1944:		and #$1c		; 29 1c
B8_1946:		bit $f654		; 2c 54 f6
B8_1949:	.db $07
B8_194a:		bit $292b		; 2c 2b 29
B8_194d:		bit $eaf7		; 2c f7 ea
B8_1950:		cmp ($9d), y	; d1 9d
B8_1952:		sbc $e60f, y	; f9 0f e6
B8_1955:	.db $fb
B8_1956:		lda $98, x		; b5 98
B8_1958:	.db $fb
B8_1959:		lda $98, x		; b5 98
B8_195b:		sbc $fb0e, y	; f9 0e fb
B8_195e:		lda $98, x		; b5 98
B8_1960:	.db $fb
B8_1961:		lda $98, x		; b5 98
B8_1963:		sbc $fb0f, y	; f9 0f fb
B8_1966:		lda $98, x		; b5 98
B8_1968:	.db $fb
B8_1969:		lda $98, x		; b5 98
B8_196b:		sbc $fb0d, y	; f9 0d fb
B8_196e:		lda $98, x		; b5 98
B8_1970:	.db $fb
B8_1971:		lda $98, x		; b5 98
B8_1973:		sbc $0e03		; ed03 0e
B8_1976:		nop				; ea 
B8_1977:	.db $dc
B8_1978:	.db $9d $f9 $00
B8_197b:	.db $ef
B8_197c:		ora $0e, x		; 15 0e
B8_197e:	.db $1c
B8_197f:	.db $0f
B8_1980:	.db $17
B8_1981:		bpl B8_199c ; 10 19

B8_1983:		ora ($20), y	; 11 20
B8_1985:	.db $12
B8_1986:	.db $1c
B8_1987:	.db $13
B8_1988:	.db $17
B8_1989:	.db $14
B8_198a:	.db $14
B8_198b:		ora $15, x		; 15 15
B8_198d:		asl $1c, x		; 16 1c
B8_198f:	.db $17
B8_1990:	.db $17
B8_1991:		clc				; 18 
B8_1992:		ora $2019, y	; 19 19 20
B8_1995:	.db $1a
B8_1996:	.db $1c
B8_1997:	.db $1b
B8_1998:	.db $17
B8_1999:	.db $1c
B8_199a:	.db $14
B8_199b:	.db $54
B8_199c:		ora $70, x		; 15 70
B8_199e:	.db $1c
B8_199f:		;removed
	.db $70 $f2

B8_19a1:		bvs B8_1995 ; 70 f2

B8_19a3:		sec				; 38 
B8_19a4:	.db $fa
B8_19a5:		beq B8_1998 ; f0 f1

B8_19a7:		ora ($ea, x)	; 01 ea
B8_19a9:	.db $74
B8_19aa:		sta $fdf9, x	; 9d f9 fd
B8_19ad:	.db $fb
B8_19ae:		lda $98, x		; b5 98
B8_19b0:		nop				; ea 
B8_19b1:		ror $f99d, x	; 7e 9d f9
B8_19b4:		.db $00				; 00
B8_19b5:	.db $fb
B8_19b6:		lda $98, x		; b5 98
B8_19b8:		nop				; ea 
B8_19b9:		dey				; 88 
B8_19ba:		sta $fff9, x	; 9d f9 ff
B8_19bd:	.db $fb
B8_19be:		lda $98, x		; b5 98
B8_19c0:		nop				; ea 
B8_19c1:	.db $92
B8_19c2:		sta $02f9, x	; 9d f9 02
B8_19c5:	.db $fb
B8_19c6:		lda $98, x		; b5 98
B8_19c8:		sbc $fb05, y	; f9 05 fb
B8_19cb:		lda $98, x		; b5 98
B8_19cd:		sbc $fbf9, y	; f9 f9 fb
B8_19d0:		nop				; ea 
B8_19d1:		tya				; 98 
B8_19d2:		sbc $f800, y	; f9 00 f8
B8_19d5:		sta ($f1, x)	; 81 f1
B8_19d7:		asl $3aea		; 0e ea 3a
B8_19da:	.db $8b
B8_19db:	.db $fb
B8_19dc:		ora ($99, x)	; 01 99
B8_19de:	.db $f7
B8_19df:		nop				; ea 
B8_19e0:		tsx				; ba 
B8_19e1:		sta $15e7, x	; 9d e7 15
B8_19e4:		stx $8a, y		; 96 8a
B8_19e6:		sbc $0e, x		; f5 0e
B8_19e8:		jsr $ea54		; 20 54 ea
B8_19eb:		ldy $209d		; ac 9d 20
B8_19ee:		asl $02ed		; 0e ed 02
B8_19f1:	.db $07
B8_19f2:		jsr $1f07		; 20 07 1f
B8_19f5:	.db $54
B8_19f6:		nop				; ea 
B8_19f7:	.db $9c
B8_19f8:		sta $0e13, x	; 9d 13 0e
B8_19fb:		sbc $0702		; ed02 07
B8_19fe:	.db $13
B8_19ff:	.db $07
B8_1a00:		nop				; ea 
B8_1a01:	.db $92
B8_1a02:		sta $1c13, x	; 9d 13 1c
B8_1a05:	.db $12
B8_1a06:	.db $1c
B8_1a07:	.db $13
B8_1a08:	.db $1c
B8_1a09:		ora $0e, x		; 15 0e
B8_1a0b:		sbc $0702		; ed02 07
B8_1a0e:		ora $07, x		; 15 07
B8_1a10:		nop				; ea 
B8_1a11:		dey				; 88 
B8_1a12:		sta $2ae2, x	; 9d e2 2a
B8_1a15:	.db $13
B8_1a16:		bvs B8_1a02 ; 70 ea

B8_1a18:		ldy $e29d		; ac 9d e2
B8_1a1b:		ora $20, x		; 15 20
B8_1a1d:	.db $1c
B8_1a1e:	.db $1f
B8_1a1f:	.db $1c
B8_1a20:		ora $1f1c, x	; 1d 1c 1f
B8_1a23:		asl $02ed		; 0e ed 02
B8_1a26:	.db $07
B8_1a27:	.db $1f
B8_1a28:	.db $07
B8_1a29:	.db $ef
B8_1a2a:	.db $e2
B8_1a2b:		sec				; 38 
B8_1a2c:		and $70			; 25 70
B8_1a2e:		sbc $0e, x		; f5 0e
B8_1a30:	.db $f2
B8_1a31:		bvs B8_1a1d ; 70 ea

B8_1a33:		cmp ($9d), y	; d1 9d
B8_1a35:		sbc $fb08, y	; f9 08 fb
B8_1a38:		lda $98, x		; b5 98
B8_1a3a:	.db $fb
B8_1a3b:		lda $98, x		; b5 98
B8_1a3d:		sbc $fb05, y	; f9 05 fb
B8_1a40:		lda $98, x		; b5 98
B8_1a42:	.db $fb
B8_1a43:		lda $98, x		; b5 98
B8_1a45:		sbc $fb08, y	; f9 08 fb
B8_1a48:		lda $98, x		; b5 98
B8_1a4a:	.db $fb
B8_1a4b:		lda $98, x		; b5 98
B8_1a4d:		sbc $fb04, y	; f9 04 fb
B8_1a50:		lda $98, x		; b5 98
B8_1a52:	.db $fb
B8_1a53:		lda $98, x		; b5 98
B8_1a55:		sbc $2303		; ed03 23
B8_1a58:		nop				; ea 
B8_1a59:		sbc #$9d		; e9 9d
B8_1a5b:	.db $fb
B8_1a5c:		adc $f099, y	; 79 99 f0
B8_1a5f:		sbc ($01), y	; f1 01
B8_1a61:		and ($07, x)	; 21 07
B8_1a63:		sbc ($15), y	; f1 15
B8_1a65:		and ($07, x)	; 21 07
B8_1a67:		sbc ($15), y	; f1 15
B8_1a69:		and ($07, x)	; 21 07
B8_1a6b:		sbc ($07), y	; f1 07
B8_1a6d:		and ($06, x)	; 21 06
B8_1a6f:		sbc ($01), y	; f1 01
B8_1a71:		inc $6d03, x	; fe 03 6d
B8_1a74:		txs				; 9a 
B8_1a75:		sbc ($0e), y	; f1 0e
B8_1a77:	.db $fa
B8_1a78:		sbc $fb03, y	; f9 03 fb
B8_1a7b:		adc ($9a, x)	; 61 9a
B8_1a7d:		sbc $fb02, y	; f9 02 fb
B8_1a80:		adc ($9a, x)	; 61 9a
B8_1a82:		sbc $fb05, y	; f9 05 fb
B8_1a85:		adc ($9a, x)	; 61 9a
B8_1a87:		sbc $fb08, y	; f9 08 fb
B8_1a8a:		adc ($9a, x)	; 61 9a
B8_1a8c:		sbc $f600, y	; f9 00 f6
B8_1a8f:	.db $07
B8_1a90:	.db $1f
B8_1a91:		and ($1f, x)	; 21 1f
B8_1a93:		and ($23, x)	; 21 23
B8_1a95:		bit $23			; 24 23
B8_1a97:		bit $26			; 24 26
B8_1a99:		plp				; 28 
B8_1a9a:		and #$2b		; 29 2b
B8_1a9c:	.db $f7
B8_1a9d:		and $2f04		; 2d 04 2f
B8_1aa0:		ora $30			; 05 30
B8_1aa2:		ora $32			; 05 32
B8_1aa4:	.db $04
B8_1aa5:	.db $34
B8_1aa6:		ora $35			; 05 35
B8_1aa8:		ora $e7			; 05 e7
B8_1aaa:		rol a			; 2a
B8_1aab:	.db $c2
B8_1aac:		txa				; 8a 
B8_1aad:		sbc ($70), y	; f1 70
B8_1aaf:		sbc ($70), y	; f1 70
B8_1ab1:		sbc ($70), y	; f1 70
B8_1ab3:	.db $1b
B8_1ab4:	.db $1c
B8_1ab5:	.db $1a
B8_1ab6:	.db $1c
B8_1ab7:	.db $1b
B8_1ab8:	.db $1c
B8_1ab9:		ora $ed0e, x	; 1d 0e ed
B8_1abc:	.db $02
B8_1abd:	.db $07
B8_1abe:		ora $1c07, x	; 1d 07 1c
B8_1ac1:		bvs B8_1ab4 ; 70 f1

B8_1ac3:		;removed
	.db $70 $2c

B8_1ac5:		bvs B8_1ab9 ; 70 f2

B8_1ac7:		;removed
	.db $70 $f9

B8_1ac9:	.db $07
B8_1aca:		inc $fb			; e6 fb
B8_1acc:		adc ($9a, x)	; 61 9a
B8_1ace:	.db $fb
B8_1acf:		adc ($9a, x)	; 61 9a
B8_1ad1:		sbc $fb05, y	; f9 05 fb
B8_1ad4:		adc ($9a, x)	; 61 9a
B8_1ad6:	.db $fb
B8_1ad7:		adc ($9a, x)	; 61 9a
B8_1ad9:		sbc $fb07, y	; f9 07 fb
B8_1adc:		adc ($9a, x)	; 61 9a
B8_1ade:	.db $fb
B8_1adf:		adc ($9a, x)	; 61 9a
B8_1ae1:		sbc $fb04, y	; f9 04 fb
B8_1ae4:		adc ($9a, x)	; 61 9a
B8_1ae6:	.db $fb
B8_1ae7:		adc ($9a, x)	; 61 9a
B8_1ae9:		sbc $2100, y	; f9 00 21
B8_1aec:		;removed
	.db $70 $f2

B8_1aee:		;removed
	.db $70 $f2

B8_1af0:		bvs B8_1ae4 ; 70 f2

B8_1af2:		bvs B8_1ae6 ; 70 f2

B8_1af4:		adc #$f2		; 69 f2
B8_1af6:	.db $54
B8_1af7:	.db $f2
B8_1af8:		;removed
	.db $70 $f0

B8_1afa:		cpx wEntityStructs.subX.w		; ec 01 04
B8_1afd:		ora ($01, x)	; 01 01
B8_1aff:	.db $1b
B8_1b00:	.db $04
B8_1b01:		ora ($01, x)	; 01 01
B8_1b03:	.db $1b
B8_1b04:	.db $04
B8_1b05:		ora ($01, x)	; 01 01
B8_1b07:		ora $0104		; 0d 04 01
B8_1b0a:		ora ($06, x)	; 01 06
B8_1b0c:	.db $04
B8_1b0d:		ora ($01, x)	; 01 01
B8_1b0f:		asl $04			; 06 04
B8_1b11:		ora ($01, x)	; 01 01
B8_1b13:		asl $04			; 06 04
B8_1b15:		ora ($01, x)	; 01 01
B8_1b17:	.db $14
B8_1b18:	.db $fa
B8_1b19:		inc $fc03, x	; fe 03 fc
B8_1b1c:		txs				; 9a 
B8_1b1d:		cpx $0303		; ec 03 03
B8_1b20:		ora ($04, x)	; 01 04
B8_1b22:	.db $1b
B8_1b23:		cpx wEntityStructs.subX.w		; ec 01 04
B8_1b26:		ora ($01, x)	; 01 01
B8_1b28:	.db $1b
B8_1b29:		cpx $0300		; ec 00 03
B8_1b2c:		ora ($00, x)	; 01 00
B8_1b2e:	.db $1b
B8_1b2f:		cpx wEntityStructs.subX.w		; ec 01 04
B8_1b32:		ora ($01, x)	; 01 01
B8_1b34:	.db $1b
B8_1b35:		cpx $0300		; ec 00 03
B8_1b38:		ora ($00, x)	; 01 00
B8_1b3a:	.db $1b
B8_1b3b:		cpx wEntityStructs.subX.w		; ec 01 04
B8_1b3e:		ora ($01, x)	; 01 01
B8_1b40:	.db $0d $ec $00
B8_1b43:	.db $03
B8_1b44:		ora ($00, x)	; 01 00
B8_1b46:		asl $0179		; 0e 79 01
B8_1b49:		.db $00				; 00
B8_1b4a:		asl $fe			; 06 fe
B8_1b4c:		asl $47			; 06 47
B8_1b4e:	.db $9b
B8_1b4f:	.db $79 $01 $00
B8_1b52:		ora $ec			; 05 ec
B8_1b54:	.db $02
B8_1b55:	.db $03
B8_1b56:		ora ($04, x)	; 01 04
B8_1b58:	.db $0d $ec $00
B8_1b5b:		ora ($07, x)	; 01 07
B8_1b5d:		ora ($07, x)	; 01 07
B8_1b5f:		cpx wEntityStructs.subX.w		; ec 01 04
B8_1b62:		ora ($01, x)	; 01 01
B8_1b64:		asl $ec			; 06 ec
B8_1b66:		.db $00				; 00
B8_1b67:		ora ($07, x)	; 01 07
B8_1b69:	.db $03
B8_1b6a:		ora ($00, x)	; 01 00
B8_1b6c:		asl $01			; 06 01
B8_1b6e:	.db $07
B8_1b6f:		ora ($07, x)	; 01 07
B8_1b71:		ora ($07, x)	; 01 07
B8_1b73:	.db $03
B8_1b74:		ora ($00, x)	; 01 00
B8_1b76:		asl $01			; 06 01
B8_1b78:	.db $07
B8_1b79:		cpx wEntityStructs.subX.w		; ec 01 04
B8_1b7c:		ora ($01, x)	; 01 01
B8_1b7e:		asl $04			; 06 04
B8_1b80:		ora ($01, x)	; 01 01
B8_1b82:		asl $ec			; 06 ec
B8_1b84:		.db $00				; 00
B8_1b85:	.db $03
B8_1b86:		ora ($00, x)	; 01 00
B8_1b88:		asl $01			; 06 01
B8_1b8a:	.db $07
B8_1b8b:	.db $03
B8_1b8c:		ora ($00, x)	; 01 00
B8_1b8e:		asl $01			; 06 01
B8_1b90:	.db $07
B8_1b91:		ora ($07, x)	; 01 07
B8_1b93:		ora ($07, x)	; 01 07
B8_1b95:		cpx wEntityStructs.subX.w		; ec 01 04
B8_1b98:		ora ($01, x)	; 01 01
B8_1b9a:		asl $ec			; 06 ec
B8_1b9c:		.db $00				; 00
B8_1b9d:		ora ($07, x)	; 01 07
B8_1b9f:	.db $03
B8_1ba0:		ora ($00, x)	; 01 00
B8_1ba2:		asl $01			; 06 01
B8_1ba4:	.db $07
B8_1ba5:		ora ($07, x)	; 01 07
B8_1ba7:		ora ($07, x)	; 01 07
B8_1ba9:	.db $03
B8_1baa:		ora ($00, x)	; 01 00
B8_1bac:		asl $01			; 06 01
B8_1bae:	.db $07
B8_1baf:		cpx wEntityStructs.subX.w		; ec 01 04
B8_1bb2:		ora ($01, x)	; 01 01
B8_1bb4:		asl $04			; 06 04
B8_1bb6:		ora ($01, x)	; 01 01
B8_1bb8:		asl $ec			; 06 ec
B8_1bba:		.db $00				; 00
B8_1bbb:	.db $03
B8_1bbc:		ora ($00, x)	; 01 00
B8_1bbe:		asl $01			; 06 01
B8_1bc0:	.db $07
B8_1bc1:	.db $fa
B8_1bc2:		inc $8b02, x	; fe 02 8b
B8_1bc5:	.db $9b
B8_1bc6:	.db $03
B8_1bc7:		ora ($00, x)	; 01 00
B8_1bc9:		asl $01			; 06 01
B8_1bcb:	.db $07
B8_1bcc:		ora ($07, x)	; 01 07
B8_1bce:		ora ($07, x)	; 01 07
B8_1bd0:		cpx wEntityStructs.subX.w		; ec 01 04
B8_1bd3:		ora ($01, x)	; 01 01
B8_1bd5:		asl $ec			; 06 ec
B8_1bd7:		.db $00				; 00
B8_1bd8:		ora ($07, x)	; 01 07
B8_1bda:	.db $03
B8_1bdb:		ora ($00, x)	; 01 00
B8_1bdd:		asl $01			; 06 01
B8_1bdf:	.db $07
B8_1be0:		cpx wEntityStructs.subX.w		; ec 01 04
B8_1be3:		ora ($01, x)	; 01 01
B8_1be5:		asl $04			; 06 04
B8_1be7:		ora ($01, x)	; 01 01
B8_1be9:		asl $ec			; 06 ec
B8_1beb:		.db $00				; 00
B8_1bec:	.db $03
B8_1bed:		ora ($00, x)	; 01 00
B8_1bef:		asl $01			; 06 01
B8_1bf1:	.db $07
B8_1bf2:	.db $03
B8_1bf3:		ora ($00, x)	; 01 00
B8_1bf5:		asl $01			; 06 01
B8_1bf7:	.db $07
B8_1bf8:		cpx wEntityStructs.subX.w		; ec 01 04
B8_1bfb:		ora ($01, x)	; 01 01
B8_1bfd:		asl $ec			; 06 ec
B8_1bff:		.db $00				; 00
B8_1c00:		ora ($07, x)	; 01 07
B8_1c02:	.db $fb
B8_1c03:	.db $8b
B8_1c04:	.db $9b
B8_1c05:	.db $fb
B8_1c06:	.db $8b
B8_1c07:	.db $9b
B8_1c08:	.db $03
B8_1c09:		ora ($00, x)	; 01 00
B8_1c0b:		asl $01			; 06 01
B8_1c0d:	.db $07
B8_1c0e:		ora ($07, x)	; 01 07
B8_1c10:		ora ($07, x)	; 01 07
B8_1c12:		cpx wEntityStructs.subX.w		; ec 01 04
B8_1c15:		ora ($01, x)	; 01 01
B8_1c17:		asl $ec			; 06 ec
B8_1c19:		.db $00				; 00
B8_1c1a:		ora ($07, x)	; 01 07
B8_1c1c:	.db $03
B8_1c1d:		ora ($00, x)	; 01 00
B8_1c1f:		asl $01			; 06 01
B8_1c21:	.db $07
B8_1c22:		ora ($07, x)	; 01 07
B8_1c24:		ora ($07, x)	; 01 07
B8_1c26:	.db $03
B8_1c27:		ora ($00, x)	; 01 00
B8_1c29:		asl $01			; 06 01
B8_1c2b:	.db $07
B8_1c2c:	.db $79 $01 $00
B8_1c2f:		asl $fe			; 06 fe
B8_1c31:	.db $03
B8_1c32:		bit $fb9c		; 2c 9c fb
B8_1c35:	.db $fa
B8_1c36:		txs				; 9a 
B8_1c37:		inc $3407, x	; fe 07 34
B8_1c3a:	.db $9c
B8_1c3b:		;removed
	.db $f0 $f3

B8_1c3d:	.db $f2
B8_1c3e:	.db $89
B8_1c3f:	.db $1c
B8_1c40:	.db $02
B8_1c41:		ora #$1a		; 09 1a
B8_1c43:	.db $1c
B8_1c44:	.db $02
B8_1c45:		ora #$1a		; 09 1a
B8_1c47:	.db $1c
B8_1c48:	.db $02
B8_1c49:		ora #$0c		; 09 0c
B8_1c4b:	.db $1c
B8_1c4c:	.db $02
B8_1c4d:		sbc ($05), y	; f1 05
B8_1c4f:	.db $1c
B8_1c50:	.db $02
B8_1c51:		sbc ($05), y	; f1 05
B8_1c53:	.db $1c
B8_1c54:	.db $02
B8_1c55:		ora #$05		; 09 05
B8_1c57:	.db $1c
B8_1c58:	.db $02
B8_1c59:		ora #$13		; 09 13
B8_1c5b:		inc $3f03, x	; fe 03 3f
B8_1c5e:	.db $9c
B8_1c5f:		jsr $0702		; 20 02 07
B8_1c62:	.db $1a
B8_1c63:	.db $1c
B8_1c64:	.db $02
B8_1c65:	.db $07
B8_1c66:	.db $1a
B8_1c67:		jsr $0702		; 20 02 07
B8_1c6a:	.db $1a
B8_1c6b:	.db $1c
B8_1c6c:	.db $02
B8_1c6d:	.db $07
B8_1c6e:	.db $1a
B8_1c6f:		jsr $0702		; 20 02 07
B8_1c72:	.db $1a
B8_1c73:	.db $1c
B8_1c74:	.db $02
B8_1c75:	.db $07
B8_1c76:	.db $0c
B8_1c77:		jsr $f102		; 20 02 f1
B8_1c7a:		ora $07f6		; 0d f6 07
B8_1c7d:	.db $1c
B8_1c7e:	.db $1c
B8_1c7f:		ora $1e1d, x	; 1d 1d 1e
B8_1c82:		asl $f71f, x	; 1e 1f f7
B8_1c85:	.db $1f
B8_1c86:		asl $20			; 06 20
B8_1c88:	.db $02
B8_1c89:	.db $0c
B8_1c8a:		ora $0d0c		; 0d 0c 0d
B8_1c8d:	.db $1c
B8_1c8e:	.db $02
B8_1c8f:	.db $0c
B8_1c90:	.db $0c
B8_1c91:		jsr $0c02		; 20 02 0c
B8_1c94:		ora $0d0c		; 0d 0c 0d
B8_1c97:		jsr $0c02		; 20 02 0c
B8_1c9a:	.db $0c
B8_1c9b:	.db $1c
B8_1c9c:	.db $02
B8_1c9d:	.db $0c
B8_1c9e:		ora $1c			; 05 1c
B8_1ca0:	.db $02
B8_1ca1:	.db $0c
B8_1ca2:		ora $20			; 05 20
B8_1ca4:	.db $02
B8_1ca5:	.db $0c
B8_1ca6:	.db $0c
B8_1ca7:	.db $fa
B8_1ca8:		inc $8701, x	; fe 01 87
B8_1cab:	.db $9c
B8_1cac:		jsr $0c02		; 20 02 0c
B8_1caf:		ora $0d0c		; 0d 0c 0d
B8_1cb2:	.db $1c
B8_1cb3:	.db $02
B8_1cb4:	.db $0c
B8_1cb5:	.db $0c
B8_1cb6:		jsr $0c02		; 20 02 0c
B8_1cb9:		ora $070c		; 0d 0c 07
B8_1cbc:		clc				; 18 
B8_1cbd:		asl $20			; 06 20
B8_1cbf:	.db $02
B8_1cc0:	.db $0c
B8_1cc1:	.db $0c
B8_1cc2:	.db $1c
B8_1cc3:	.db $02
B8_1cc4:	.db $0c
B8_1cc5:		ora $1c			; 05 1c
B8_1cc7:	.db $02
B8_1cc8:	.db $0c
B8_1cc9:		ora $20			; 05 20
B8_1ccb:	.db $02
B8_1ccc:	.db $0c
B8_1ccd:	.db $0c
B8_1cce:	.db $fb
B8_1ccf:	.db $87
B8_1cd0:	.db $9c
B8_1cd1:		jsr $0c02		; 20 02 0c
B8_1cd4:		.db $0d


B8_1cd5:	.db $0c
B8_1cd6:		ora $021c		; 0d 1c 02
B8_1cd9:	.db $0c
B8_1cda:	.db $0c
B8_1cdb:		jsr $0c02		; 20 02 0c
B8_1cde:	.db $0c
B8_1cdf:	.db $1c
B8_1ce0:	.db $02
B8_1ce1:	.db $0c
B8_1ce2:		ora $1c			; 05 1c
B8_1ce4:	.db $02
B8_1ce5:	.db $0c
B8_1ce6:		ora $20			; 05 20
B8_1ce8:	.db $02
B8_1ce9:	.db $0c
B8_1cea:	.db $0c
B8_1ceb:		jsr $0c02		; 20 02 0c
B8_1cee:	.db $0c
B8_1cef:	.db $1c
B8_1cf0:	.db $02
B8_1cf1:	.db $0c
B8_1cf2:	.db $0c
B8_1cf3:	.db $fb
B8_1cf4:	.db $87
B8_1cf5:	.db $9c
B8_1cf6:		jsr $0a02		; 20 02 0a
B8_1cf9:		ora $0d0a		; 0d 0a 0d
B8_1cfc:	.db $1c
B8_1cfd:	.db $02
B8_1cfe:		asl a			; 0a
B8_1cff:	.db $0c
B8_1d00:		jsr $0a02		; 20 02 0a
B8_1d03:		ora $070a		; 0d 0a 07
B8_1d06:		asl $06, x		; 16 06
B8_1d08:		jsr $0a02		; 20 02 0a
B8_1d0b:	.db $0c
B8_1d0c:	.db $1c
B8_1d0d:	.db $02
B8_1d0e:		asl a			; 0a
B8_1d0f:		ora $1c			; 05 1c
B8_1d11:	.db $02
B8_1d12:		asl a			; 0a
B8_1d13:		ora $20			; 05 20
B8_1d15:	.db $02
B8_1d16:		asl a			; 0a
B8_1d17:	.db $0c
B8_1d18:		jsr $0a02		; 20 02 0a
B8_1d1b:		ora $0d0a		; 0d 0a 0d
B8_1d1e:	.db $1c
B8_1d1f:	.db $02
B8_1d20:		asl a			; 0a
B8_1d21:	.db $0c
B8_1d22:		jsr $0a02		; 20 02 0a
B8_1d25:		ora $0d0a		; 0d 0a 0d
B8_1d28:		jsr $0a02		; 20 02 0a
B8_1d2b:	.db $0c
B8_1d2c:		inc $07, x		; f6 07
B8_1d2e:		ora $1e1d, x	; 1d 1d 1e
B8_1d31:		asl $1cf7, x	; 1e f7 1c
B8_1d34:	.db $02
B8_1d35:	.db $0c
B8_1d36:	.db $1a
B8_1d37:	.db $1c
B8_1d38:	.db $02
B8_1d39:	.db $0c
B8_1d3a:	.db $1a
B8_1d3b:	.db $1c
B8_1d3c:	.db $02
B8_1d3d:	.db $0c
B8_1d3e:	.db $0c
B8_1d3f:	.db $1c
B8_1d40:	.db $02
B8_1d41:		sbc ($05), y	; f1 05
B8_1d43:	.db $1c
B8_1d44:	.db $02
B8_1d45:		sbc ($05), y	; f1 05
B8_1d47:	.db $1c
B8_1d48:	.db $02
B8_1d49:	.db $0c
B8_1d4a:		ora $1c			; 05 1c
B8_1d4c:	.db $02
B8_1d4d:	.db $0c
B8_1d4e:	.db $13
B8_1d4f:		inc $3305, x	; fe 05 33
B8_1d52:		sta $021c, x	; 9d 1c 02
B8_1d55:		asl a			; 0a
B8_1d56:	.db $1a
B8_1d57:	.db $1c
B8_1d58:	.db $02
B8_1d59:		asl a			; 0a
B8_1d5a:	.db $1a
B8_1d5b:	.db $1c
B8_1d5c:	.db $02
B8_1d5d:		asl a			; 0a
B8_1d5e:	.db $0c
B8_1d5f:	.db $1c
B8_1d60:	.db $02
B8_1d61:		sbc ($05), y	; f1 05
B8_1d63:	.db $1c
B8_1d64:	.db $02
B8_1d65:		sbc ($05), y	; f1 05
B8_1d67:	.db $1c
B8_1d68:	.db $02
B8_1d69:		asl a			; 0a
B8_1d6a:		ora $1c			; 05 1c
B8_1d6c:	.db $02
B8_1d6d:		asl a			; 0a
B8_1d6e:	.db $13
B8_1d6f:		inc $5301, x	; fe 01 53
B8_1d72:		sta $06f0, x	; 9d f0 06
B8_1d75:	.db $72
B8_1d76:	.db $73
B8_1d77:	.db $74
B8_1d78:		.db $00				; 00
B8_1d79:	.db $80
B8_1d7a:		adc ($72), y	; 71 72
B8_1d7c:		.db $00				; 00
B8_1d7d:		stx $06			; 86 06
B8_1d7f:	.db $73
B8_1d80:	.db $74
B8_1d81:		ror $00, x		; 76 00
B8_1d83:	.db $80
B8_1d84:		adc ($73), y	; 71 73
B8_1d86:		.db $00				; 00
B8_1d87:		stx $06			; 86 06
B8_1d89:		ror $77, x		; 76 77
B8_1d8b:		adc $8000, y	; 79 00 80
B8_1d8e:		adc ($74), y	; 71 74
B8_1d90:		.db $00				; 00
B8_1d91:		stx $06			; 86 06
B8_1d93:	.db $7a
B8_1d94:	.db $7b
B8_1d95:	.db $7c
B8_1d96:		.db $00				; 00
B8_1d97:	.db $80
B8_1d98:		adc ($75), y	; 71 75
B8_1d9a:		.db $00				; 00
B8_1d9b:		stx $0b			; 86 0b
B8_1d9d:		and $393c, x	; 3d 3c 39
B8_1da0:	.db $3a
B8_1da1:	.db $3b
B8_1da2:	.db $3c
B8_1da3:	.db $3d $3d $00
B8_1da6:	.db $80
B8_1da7:		and ($37), y	; 31 37
B8_1da9:		sec				; 38 
B8_1daa:		.db $00				; 00
B8_1dab:	.db $80
B8_1dac:		asl a			; 0a
B8_1dad:		ror $75, x		; 76 75
B8_1daf:		ror $77, x		; 76 77
B8_1db1:	.db $77
B8_1db2:	.db $77
B8_1db3:		ror $00, x		; 76 00
B8_1db5:	.db $80
B8_1db6:		adc ($73), y	; 71 73
B8_1db8:		.db $00				; 00
B8_1db9:	.db $80
B8_1dba:	.db $13
B8_1dbb:	.db $72
B8_1dbc:	.db $72
B8_1dbd:	.db $72
B8_1dbe:	.db $73
B8_1dbf:	.db $73
B8_1dc0:	.db $73
B8_1dc1:	.db $74
B8_1dc2:	.db $74
B8_1dc3:	.db $74
B8_1dc4:		adc $75, x		; 75 75
B8_1dc6:		adc $74, x		; 75 74
B8_1dc8:	.db $74
B8_1dc9:	.db $74
B8_1dca:	.db $74
B8_1dcb:		.db $00				; 00
B8_1dcc:	.db $80
B8_1dcd:		adc ($73), y	; 71 73
B8_1dcf:		.db $00				; 00
B8_1dd0:	.db $80
B8_1dd1:		asl $38			; 06 38
B8_1dd3:	.db $39 $3b $00
B8_1dd6:	.db $80
B8_1dd7:		and ($34), y	; 31 34
B8_1dd9:		and $00, x		; 35 00
B8_1ddb:		stx $00			; 86 00
B8_1ddd:		ldx $b6b7, y	; be b7 b6
B8_1de0:		lda $b4, x		; b5 b4
B8_1de2:		ldy $b4, x		; b4 b4
B8_1de4:		ldy $b1, x		; b4 b1
B8_1de6:		ldy $00, x		; b4 00
B8_1de8:		cpy #$00		; c0 00
B8_1dea:		lda $b3, x		; b5 b3
B8_1dec:	.db $b3
B8_1ded:	.db $b3
B8_1dee:	.db $b3
B8_1def:	.db $b3
B8_1df0:	.db $b3
B8_1df1:	.db $b3
B8_1df2:		lda ($b2), y	; b1 b2
B8_1df4:		.db $00				; 00
B8_1df5:		bne B8_1df7 ; d0 00

B8_1df7:		.db $00				; 00
B8_1df8:		asl a			; 0a
B8_1df9:	.db $9e
B8_1dfa:		ora ($01, x)	; 01 01
B8_1dfc:	.db $a3
B8_1dfd:	.db $9e
B8_1dfe:	.db $02
B8_1dff:	.db $02
B8_1e00:		cmp $039e, x	; dd 9e 03
B8_1e03:	.db $03
B8_1e04:		;removed
	.db $30 $9f

B8_1e06:		php				; 08 
B8_1e07:		and ($9f), y	; 31 9f
B8_1e09:	.db $ff
B8_1e0a:		nop				; ea 
B8_1e0b:	.db $32
B8_1e0c:	.db $9f
B8_1e0d:	.db $ef
B8_1e0e:		inc $16, x		; f6 16
B8_1e10:		rol a			; 2a
B8_1e11:		and ($2d, x)	; 21 2d
B8_1e13:		and ($28, x)	; 21 28
B8_1e15:		and ($2d, x)	; 21 2d
B8_1e17:		and ($26, x)	; 21 26
B8_1e19:		inc $0b, x		; f6 0b
B8_1e1b:	.db $23
B8_1e1c:		and $f6			; 25 f6
B8_1e1e:		asl $26, x		; 16 26
B8_1e20:		plp				; 28 
B8_1e21:		and ($f7, x)	; 21 f7
B8_1e23:	.db $fa
B8_1e24:		nop				; ea 
B8_1e25:		jmp $1c9f		; 4c 9f 1c


B8_1e28:	.db $0b
B8_1e29:		asl $1f0b, x	; 1e 0b 1f
B8_1e2c:		asl $21, x		; 16 21
B8_1e2e:		asl $fa, x		; 16 fa
B8_1e30:		nop				; ea 
B8_1e31:	.db $32
B8_1e32:	.db $9f
B8_1e33:		inc $16, x		; f6 16
B8_1e35:	.db $23
B8_1e36:	.db $1f
B8_1e37:		and $1f			; 25 1f
B8_1e39:		rol $21			; 26 21
B8_1e3b:		plp				; 28 
B8_1e3c:		and ($2a, x)	; 21 2a
B8_1e3e:		inc $0b, x		; f6 0b
B8_1e40:		plp				; 28 
B8_1e41:		rol a			; 2a
B8_1e42:	.db $2b
B8_1e43:		rol a			; 2a
B8_1e44:		plp				; 28 
B8_1e45:		rol $fa			; 26 fa
B8_1e47:		inc $2c, x		; f6 2c
B8_1e49:		rol a			; 2a
B8_1e4a:		plp				; 28 
B8_1e4b:	.db $f7
B8_1e4c:	.db $fb
B8_1e4d:		asl a			; 0a
B8_1e4e:	.db $9e
B8_1e4f:	.db $fb
B8_1e50:		bit $9e			; 24 9e
B8_1e52:		nop				; ea 
B8_1e53:	.db $32
B8_1e54:	.db $9f
B8_1e55:		inc $16, x		; f6 16
B8_1e57:	.db $23
B8_1e58:	.db $1f
B8_1e59:		and $1f			; 25 1f
B8_1e5b:		rol $2d			; 26 2d
B8_1e5d:	.db $2b
B8_1e5e:		rol a			; 2a
B8_1e5f:		plp				; 28 
B8_1e60:		inc $0b, x		; f6 0b
B8_1e62:		rol $25			; 26 25
B8_1e64:	.db $23
B8_1e65:		and $23			; 25 23
B8_1e67:		and $f7			; 25 f7
B8_1e69:		rol $58			; 26 58
B8_1e6b:		inc $0b, x		; f6 0b
B8_1e6d:		sbc $1d04		; ed04 1d
B8_1e70:	.db $1f
B8_1e71:		and ($22, x)	; 21 22
B8_1e73:		bit $26			; 24 26
B8_1e75:	.db $27
B8_1e76:	.db $f7
B8_1e77:		and #$42		; 29 42
B8_1e79:	.db $27
B8_1e7a:		asl $26, x		; 16 26
B8_1e7c:	.db $42
B8_1e7d:		bit $16			; 24 16
B8_1e7f:		bit $16			; 24 16
B8_1e81:	.db $22
B8_1e82:		asl $1d, x		; 16 1d
B8_1e84:		bit $0bf6		; 2c f6 0b
B8_1e87:		sbc $1f08		; ed08 1f
B8_1e8a:		and ($22, x)	; 21 22
B8_1e8c:		bit $26			; 24 26
B8_1e8e:	.db $27
B8_1e8f:		and #$f7		; 29 f7
B8_1e91:	.db $2b
B8_1e92:	.db $42
B8_1e93:		inc $16, x		; f6 16
B8_1e95:		and #$29		; 29 29
B8_1e97:	.db $27
B8_1e98:		rol $24			; 26 24
B8_1e9a:	.db $f7
B8_1e9b:		bit $42			; 24 42
B8_1e9d:	.db $22
B8_1e9e:		ror $fcfa		; 6e fa fc
B8_1ea1:		asl a			; 0a
B8_1ea2:	.db $9e
B8_1ea3:		sbc ($0b), y	; f1 0b
B8_1ea5:		sed				; f8 
B8_1ea6:		sta ($ea, x)	; 81 ea
B8_1ea8:	.db $3f
B8_1ea9:	.db $9f
B8_1eaa:	.db $fb
B8_1eab:		ora $ea9e		; 0d 9e ea
B8_1eae:		eor $fb9f, y	; 59 9f fb
B8_1eb1:	.db $27
B8_1eb2:	.db $9e
B8_1eb3:		nop				; ea 
B8_1eb4:	.db $3f
B8_1eb5:	.db $9f
B8_1eb6:	.db $fb
B8_1eb7:	.db $33
B8_1eb8:	.db $9e
B8_1eb9:		nop				; ea 
B8_1eba:		jmp $1e9f		; 4c 9f 1e


B8_1ebd:	.db $1f
B8_1ebe:		and ($23, x)	; 21 23
B8_1ec0:		and $26			; 25 26
B8_1ec2:		plp				; 28 
B8_1ec3:		nop				; ea 
B8_1ec4:		eor $289f, y	; 59 9f 28
B8_1ec7:	.db $f7
B8_1ec8:		nop				; ea 
B8_1ec9:	.db $3f
B8_1eca:	.db $9f
B8_1ecb:	.db $fb
B8_1ecc:		ora $ea9e		; 0d 9e ea
B8_1ecf:		eor $fb9f, y	; 59 9f fb
B8_1ed2:	.db $27
B8_1ed3:	.db $9e
B8_1ed4:		nop				; ea 
B8_1ed5:	.db $3f
B8_1ed6:	.db $9f
B8_1ed7:	.db $fb
B8_1ed8:		eor $9e, x		; 55 9e
B8_1eda:	.db $fc
B8_1edb:	.db $a7
B8_1edc:	.db $9e
B8_1edd:		cpx $26ff		; ec ff 26
B8_1ee0:		cli				; 58 
B8_1ee1:		and $58			; 25 58
B8_1ee3:	.db $23
B8_1ee4:		bit $2c20		; 2c 20 2c
B8_1ee7:		and ($58, x)	; 21 58
B8_1ee9:		inc $2c, x		; f6 2c
B8_1eeb:	.db $1f
B8_1eec:	.db $1c
B8_1eed:		asl $19fa, x	; 1e fa 19
B8_1ef0:	.db $1a
B8_1ef1:	.db $17
B8_1ef2:		inc $16, x		; f6 16
B8_1ef4:		ora $21, x		; 15 21
B8_1ef6:	.db $1f
B8_1ef7:	.db $1c
B8_1ef8:	.db $f7
B8_1ef9:	.db $fb
B8_1efa:	.db $df
B8_1efb:	.db $9e
B8_1efc:	.db $23
B8_1efd:	.db $1f
B8_1efe:		and ($f7, x)	; 21 f7
B8_1f00:		rol $16			; 26 16
B8_1f02:		and ($16, x)	; 21 16
B8_1f04:	.db $1a
B8_1f05:		bit $16f6		; 2c f6 16
B8_1f08:		asl $1d, x		; 16 1d
B8_1f0a:		rol $1d			; 26 1d
B8_1f0c:		asl $1f, x		; 16 1f
B8_1f0e:	.db $27
B8_1f0f:	.db $1f
B8_1f10:		asl $1e, x		; 16 1e
B8_1f12:	.db $27
B8_1f13:		asl $1d16, x	; 1e 16 1d
B8_1f16:		rol $1d			; 26 1d
B8_1f18:	.db $1b
B8_1f19:	.db $22
B8_1f1a:	.db $2b
B8_1f1b:	.db $22
B8_1f1c:	.db $1a
B8_1f1d:	.db $23
B8_1f1e:	.db $2b
B8_1f1f:	.db $23
B8_1f20:	.db $f7
B8_1f21:		clc				; 18 
B8_1f22:		bit $2c1d		; 2c 1d 2c
B8_1f25:	.db $22
B8_1f26:		ora $251d, x	; 1d 1d 25
B8_1f29:		asl $4d, x		; 16 4d
B8_1f2b:		sbc ($21), y	; f1 21
B8_1f2d:	.db $fc
B8_1f2e:	.db $df
B8_1f2f:	.db $9e
B8_1f30:		beq B8_1f22 ; f0 f0

B8_1f32:		.db $00				; 00
B8_1f33:		ldx $b5b6, y	; be b6 b5
B8_1f36:		ldy $b3, x		; b4 b3
B8_1f38:	.db $b3
B8_1f39:	.db $b3
B8_1f3a:	.db $b3
B8_1f3b:		lda ($b3), y	; b1 b3
B8_1f3d:		.db $00				; 00
B8_1f3e:		cpy #$00		; c0 00
B8_1f40:		lda $b3, x		; b5 b3
B8_1f42:	.db $b3
B8_1f43:	.db $b3
B8_1f44:	.db $b3
B8_1f45:	.db $b3
B8_1f46:	.db $b3
B8_1f47:	.db $b3
B8_1f48:		lda ($b2), y	; b1 b2
B8_1f4a:		.db $00				; 00
B8_1f4b:		bne B8_1f4d ; d0 00

B8_1f4d:		ror $7475, x	; 7e 75 74
B8_1f50:	.db $74
B8_1f51:	.db $73
B8_1f52:	.db $73
B8_1f53:	.db $73
B8_1f54:	.db $73
B8_1f55:		adc ($73), y	; 71 73
B8_1f57:		.db $00				; 00
B8_1f58:		cpy #$00		; c0 00
B8_1f5a:		adc $73, x		; 75 73
B8_1f5c:	.db $73
B8_1f5d:	.db $73
B8_1f5e:	.db $73
B8_1f5f:	.db $73
B8_1f60:	.db $73
B8_1f61:	.db $73
B8_1f62:		adc ($72), y	; 71 72
B8_1f64:		.db $00				; 00
B8_1f65:		bne B8_1f67 ; d0 00

B8_1f67:		.db $00				; 00
B8_1f68:	.db $7a
B8_1f69:	.db $9f
B8_1f6a:		ora ($01, x)	; 01 01
B8_1f6c:	.db $c3
B8_1f6d:	.db $9f
B8_1f6e:	.db $02
B8_1f6f:	.db $02
B8_1f70:		asl $03a0		; 0e a0 03
B8_1f73:	.db $03
B8_1f74:		eor ($a0, x)	; 41 a0
B8_1f76:		php				; 08 
B8_1f77:		sty $ffa0		; 8c a0 ff
B8_1f7a:		nop				; ea 
B8_1f7b:	.db $ab
B8_1f7c:		ldy #$e7		; a0 e7
B8_1f7e:	.db $02
B8_1f7f:		cpy $f58a		; cc 8a f5
B8_1f82:	.db $0c
B8_1f83:		ora $1d08, x	; 1d 08 1d
B8_1f86:		php				; 08 
B8_1f87:		ora $1d08, x	; 1d 08 1d
B8_1f8a:	.db $0c
B8_1f8b:		sbc $0c05		; ed05 0c
B8_1f8e:		ora $ed0c, x	; 1d 0c ed
B8_1f91:		ora $0c			; 05 0c
B8_1f93:		ora $1f08, x	; 1d 08 1f
B8_1f96:		php				; 08 
B8_1f97:		and ($08, x)	; 21 08
B8_1f99:		jsr $2008		; 20 08 20
B8_1f9c:		php				; 08 
B8_1f9d:		jsr $2008		; 20 08 20
B8_1fa0:	.db $0c
B8_1fa1:		sbc $0c05		; ed05 0c
B8_1fa4:		jsr $ed0c		; 20 0c ed
B8_1fa7:		ora $0c			; 05 0c
B8_1fa9:		jsr $2208		; 20 08 22
B8_1fac:		php				; 08 
B8_1fad:	.db $23
B8_1fae:		php				; 08 
B8_1faf:		bit $30			; 24 30
B8_1fb1:		and $20			; 25 20
B8_1fb3:		and $2a			; 25 2a
B8_1fb5:		bit $60			; 24 60
B8_1fb7:		ora ($08), y	; 11 08
B8_1fb9:		ora ($08), y	; 11 08
B8_1fbb:		ora ($08), y	; 11 08
B8_1fbd:		ora ($0c), y	; 11 0c
B8_1fbf:		sbc $600a		; ed0a 60
B8_1fc2:		beq B8_1fae ; f0 ea

B8_1fc4:	.db $ab
B8_1fc5:		ldy #$e7		; a0 e7
B8_1fc7:	.db $02
B8_1fc8:		cpy $f58a		; cc 8a f5
B8_1fcb:	.db $0c
B8_1fcc:		ora $08, x		; 15 08
B8_1fce:		ora $08, x		; 15 08
B8_1fd0:		ora $08, x		; 15 08
B8_1fd2:		ora $0c, x		; 15 0c
B8_1fd4:		sbc $0c05		; ed05 0c
B8_1fd7:		ora $0c, x		; 15 0c
B8_1fd9:		sbc $0c05		; ed05 0c
B8_1fdc:		ora $08, x		; 15 08
B8_1fde:		clc				; 18 
B8_1fdf:		php				; 08 
B8_1fe0:		ora $1d08, x	; 1d 08 1d
B8_1fe3:		php				; 08 
B8_1fe4:		ora $1d08, x	; 1d 08 1d
B8_1fe7:		php				; 08 
B8_1fe8:		ora $ed0c, x	; 1d 0c ed
B8_1feb:		ora $0c			; 05 0c
B8_1fed:		ora $ed0c, x	; 1d 0c ed
B8_1ff0:		ora $0c			; 05 0c
B8_1ff2:		ora $1e08, x	; 1d 08 1e
B8_1ff5:		php				; 08 
B8_1ff6:		jsr $2108		; 20 08 21
B8_1ff9:		;removed
	.db $30 $22

B8_1ffb:		jsr $2a22		; 20 22 2a
		.db $21
		.db $60
