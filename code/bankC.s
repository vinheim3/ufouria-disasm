
func_c_0000:
B12_0000:		jsr $8fd8		; 20 d8 8f
B12_0003:		jsr $905b		; 20 5b 90
B12_0006:		jsr $87bc		; 20 bc 87
B12_0009:		jsr $8f23		; 20 23 8f
B12_000c:		lda #$52		; a9 52
B12_000e:		jsr unsetGlobalFlag		; 20 fc e7
B12_0011:		lda #$48		; a9 48
B12_0013:		jsr checkGlobalFlag		; 20 e9 e7
B12_0016:		beq B12_001b ; f0 03

B12_0018:		jmp $80b0		; 4c b0 80

B12_001b:		lda #$56		; a9 56
B12_001d:		jsr checkGlobalFlag		; 20 e9 e7
B12_0020:		beq B12_0025 ; f0 03

B12_0022:		jmp $80ad		; 4c ad 80

B12_0025:		lda $1b			; a5 1b
B12_0027:		and #$10		; 29 10
B12_0029:		bne B12_0038 ; d0 0d

B12_002b:		lda #$5c		; a9 5c
B12_002d:		jsr checkGlobalFlag		; 20 e9 e7
B12_0030:		bne B12_0038 ; d0 06

B12_0032:		lda $1a			; a5 1a
B12_0034:		and #$df		; 29 df
B12_0036:		sta $1a			; 85 1a
B12_0038:		lda $04eb		; ad eb 04
B12_003b:		and #$20		; 29 20
B12_003d:		bne B12_0044 ; d0 05

B12_003f:		lda #$00		; a9 00
B12_0041:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B12_0044:		lda $051a		; ad 1a 05
B12_0047:		beq B12_006b ; f0 22

B12_0049:		dec $051a		; ce 1a 05
B12_004c:		bne B12_00ad ; d0 5f

B12_004e:		lda #$00		; a9 00
B12_0050:		sta $15			; 85 15
B12_0052:		sta $0511		; 8d 11 05
B12_0055:		lda $19			; a5 19
B12_0057:		and #$ef		; 29 ef
B12_0059:		sta $19			; 85 19
B12_005b:		lda $04ec		; ad ec 04
B12_005e:		and #$f7		; 29 f7
B12_0060:		sta $04ec		; 8d ec 04
B12_0063:		lda #$5c		; a9 5c
B12_0065:		jsr unsetGlobalFlag		; 20 fc e7
B12_0068:		jmp $8073		; 4c 73 80

B12_006b:		lda $051c		; ad 1c 05
B12_006e:		beq B12_0073 ; f0 03

B12_0070:		dec $051c		; ce 1c 05
B12_0073:		lda #$53		; a9 53
B12_0075:		jsr checkGlobalFlag		; 20 e9 e7
B12_0078:		beq B12_007d ; f0 03

B12_007a:		jmp $80ce		; 4c ce 80

B12_007d:		lda $04ec		; ad ec 04
B12_0080:		and #$0f		; 29 0f
B12_0082:		beq B12_0087 ; f0 03

B12_0084:		jmp $8101		; 4c 01 81

B12_0087:		lda #$5d		; a9 5d
B12_0089:		jsr checkGlobalFlag		; 20 e9 e7
B12_008c:		beq B12_0091 ; f0 03

B12_008e:		jmp $80b0		; 4c b0 80

B12_0091:		lda #$55		; a9 55
B12_0093:		jsr checkGlobalFlag		; 20 e9 e7
B12_0096:		beq B12_009b ; f0 03

B12_0098:		jmp $80ad		; 4c ad 80

B12_009b:		lda wChosenCharacter.w		; ad 10 05
B12_009e:		and #$03		; 29 03
B12_00a0:		jsr jumpTable_retFollowing		; 20 bc e6
	.dw func_c_00ad
	.dw $9586
	.dw $997c
	.dw $9b64
	.dw $9f1a

func_c_00ad:
B12_00ad:		jsr $88e1		; 20 e1 88
B12_00b0:		lda $1a			; a5 1a
B12_00b2:		and #$20		; 29 20
B12_00b4:		beq B12_00c4 ; f0 0e

B12_00b6:		lda $0484		; ad 84 04
B12_00b9:		sta $10			; 85 10
B12_00bb:		lda $0485		; ad 85 04
B12_00be:		sta $11			; 85 11
B12_00c0:		lda #$00		; a9 00
B12_00c2:		sta $14			; 85 14
B12_00c4:		jsr $818d		; 20 8d 81
B12_00c7:		jsr func_c_0743		; 20 43 87
B12_00ca:		jsr $8f7f		; 20 7f 8f
B12_00cd:		rts				; 60 


B12_00ce:		lda #$84		; a9 84
B12_00d0:		sta $15			; 85 15
B12_00d2:		jsr $8157		; 20 57 81
B12_00d5:		bit $4a			; 24 4a
B12_00d7:		bpl B12_00ee ; 10 15

B12_00d9:		lda $1a			; a5 1a
B12_00db:		and #$bf		; 29 bf
B12_00dd:		sta $1a			; 85 1a
B12_00df:		lda #$53		; a9 53
B12_00e1:		jsr unsetGlobalFlag		; 20 fc e7
B12_00e4:		lda #$49		; a9 49
B12_00e6:		jsr unsetGlobalFlag		; 20 fc e7
B12_00e9:		lda #$00		; a9 00
B12_00eb:		sta $0516		; 8d 16 05
B12_00ee:		lda wChosenCharacter.w		; ad 10 05
B12_00f1:		and #$03		; 29 03
B12_00f3:		tay				; a8 
B12_00f4:		lda $80fd, y	; b9 fd 80
B12_00f7:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B12_00fa:		jmp $80ad		; 4c ad 80


B12_00fd:		and $b67c, x	; 3d 7c b6
B12_0100:	.db $fb
B12_0101:		lda $1a			; a5 1a
B12_0103:		and #$bf		; 29 bf
B12_0105:		sta $1a			; 85 1a
B12_0107:		lda $04ec		; ad ec 04
B12_010a:		lsr a			; 4a
B12_010b:		bcs B12_0146 ; b0 39

B12_010d:		lsr a			; 4a
B12_010e:		bcs B12_0135 ; b0 25

B12_0110:		lsr a			; 4a
B12_0111:		bcs B12_0124 ; b0 11

B12_0113:		lda #$84		; a9 84
B12_0115:		jsr $8157		; 20 57 81
B12_0118:		bit $4a			; 24 4a
B12_011a:		bpl B12_0121 ; 10 05

B12_011c:		lda #$63		; a9 63
B12_011e:		jsr unsetGlobalFlag		; 20 fc e7
B12_0121:		jmp $80ad		; 4c ad 80


B12_0124:		lda #$7c		; a9 7c
B12_0126:		jsr $8157		; 20 57 81
B12_0129:		bit $4a			; 24 4a
B12_012b:		bpl B12_0132 ; 10 05

B12_012d:		lda #$62		; a9 62
B12_012f:		jsr unsetGlobalFlag		; 20 fc e7
B12_0132:		jmp $80ad		; 4c ad 80


B12_0135:		lda #$84		; a9 84
B12_0137:		jsr $8168		; 20 68 81
B12_013a:		bit $4a			; 24 4a
B12_013c:		bvc B12_0143 ; 50 05

B12_013e:		lda #$61		; a9 61
B12_0140:		jsr unsetGlobalFlag		; 20 fc e7
B12_0143:		jmp $80ad		; 4c ad 80


B12_0146:		lda #$7c		; a9 7c
B12_0148:		jsr $8168		; 20 68 81
B12_014b:		bit $4a			; 24 4a
B12_014d:		bvc B12_0154 ; 50 05

B12_014f:		lda #$60		; a9 60
B12_0151:		jsr unsetGlobalFlag		; 20 fc e7
B12_0154:		jmp $80ad		; 4c ad 80


B12_0157:		sta $15			; 85 15
B12_0159:		lda #$00		; a9 00
B12_015b:		sta $14			; 85 14
B12_015d:		lda $015a		; ad 5a 01
B12_0160:		ora #$01		; 09 01
B12_0162:		sta $015a		; 8d 5a 01
B12_0165:		jmp $8176		; 4c 76 81


B12_0168:		sta $14			; 85 14
B12_016a:		lda #$00		; a9 00
B12_016c:		sta $15			; 85 15
B12_016e:		lda $015a		; ad 5a 01
B12_0171:		and #$fe		; 29 fe
B12_0173:		sta $015a		; 8d 5a 01
B12_0176:		lda wChosenCharacter.w		; ad 10 05
B12_0179:		and #$03		; 29 03
B12_017b:		tay				; a8 
B12_017c:		lda $8189, y	; b9 89 81
B12_017f:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B12_0182:		ldx #$00		; a2 00
B12_0184:		lda #$80		; a9 80
B12_0186:		jmp func_13ef		; 4c ef f3


B12_0189:		and $b67c, x	; 3d 7c b6
B12_018c:	.db $fb
B12_018d:		jsr func_0709		; 20 09 e7
B12_0190:		lda $17			; a5 17
B12_0192:		cmp #$3c		; c9 3c
B12_0194:		bcs B12_01a1 ; b0 0b

B12_0196:		lda #$42		; a9 42
B12_0198:		jsr setGlobalFlag		; 20 f0 e7
B12_019b:		jsr $91a5		; 20 a5 91
B12_019e:		jmp $81a6		; 4c a6 81


B12_01a1:		lda #$42		; a9 42
B12_01a3:		jsr unsetGlobalFlag		; 20 fc e7
B12_01a6:		lda #$48		; a9 48
B12_01a8:		jsr checkGlobalFlag		; 20 e9 e7
B12_01ab:		beq B12_01b0 ; f0 03

B12_01ad:		jmp $8369		; 4c 69 83


B12_01b0:		jsr $8240		; 20 40 82
B12_01b3:		lda $16			; a5 16
B12_01b5:		cmp #$11		; c9 11
B12_01b7:		bcc B12_01c1 ; 90 08

B12_01b9:		cmp #$f1		; c9 f1
B12_01bb:		bcc B12_01ce ; 90 11

B12_01bd:		lda #$f0		; a9 f0
B12_01bf:		bne B12_01c3 ; d0 02

B12_01c1:		lda #$11		; a9 11
B12_01c3:		sta $16			; 85 16
B12_01c5:		jsr $83ca		; 20 ca 83
B12_01c8:		lda $1c			; a5 1c
B12_01ca:		ora #$04		; 09 04
B12_01cc:		sta $1c			; 85 1c
B12_01ce:		lda $17			; a5 17
B12_01d0:		cmp #$11		; c9 11
B12_01d2:		bcc B12_01dc ; 90 08

B12_01d4:		cmp #$f1		; c9 f1
B12_01d6:		bcc B12_01e9 ; 90 11

B12_01d8:		lda #$f0		; a9 f0
B12_01da:		bne B12_01de ; d0 02

B12_01dc:		lda #$11		; a9 11
B12_01de:		sta $17			; 85 17
B12_01e0:		jsr $83ea		; 20 ea 83
B12_01e3:		lda $1c			; a5 1c
B12_01e5:		ora #$04		; 09 04
B12_01e7:		sta $1c			; 85 1c
B12_01e9:		lda $11			; a5 11
B12_01eb:		sec				; 38 
B12_01ec:		sbc $0514		; ed14 05
B12_01ef:		beq B12_0207 ; f0 16

B12_01f1:		sta $00			; 85 00
B12_01f3:		lda $16			; a5 16
B12_01f5:		cmp #$68		; c9 68
B12_01f7:		bcs B12_01ff ; b0 06

B12_01f9:		lda $00			; a5 00
B12_01fb:		bpl B12_0207 ; 10 0a

B12_01fd:		bmi B12_020b ; 30 0c

B12_01ff:		cmp #$98		; c9 98
B12_0201:		bcc B12_0207 ; 90 04

B12_0203:		lda $00			; a5 00
B12_0205:		bpl B12_020b ; 10 04

B12_0207:		lda #$00		; a9 00
B12_0209:		beq B12_020d ; f0 02

B12_020b:		lda $00			; a5 00
B12_020d:		sta $34			; 85 34
B12_020f:		lda $13			; a5 13
B12_0211:		sec				; 38 
B12_0212:		sbc $0515		; ed15 05
B12_0215:		beq B12_022d ; f0 16

B12_0217:		sta $00			; 85 00
B12_0219:		lda $17			; a5 17
B12_021b:		cmp #$68		; c9 68
B12_021d:		bcs B12_0225 ; b0 06

B12_021f:		lda $00			; a5 00
B12_0221:		bpl B12_022d ; 10 0a

B12_0223:		bmi B12_0231 ; 30 0c

B12_0225:		cmp #$98		; c9 98
B12_0227:		bcc B12_022d ; 90 04

B12_0229:		lda $00			; a5 00
B12_022b:		bpl B12_0231 ; 10 04

B12_022d:		lda #$00		; a9 00
B12_022f:		beq B12_0233 ; f0 02

B12_0231:		lda $00			; a5 00
B12_0233:		sta $35			; 85 35
B12_0235:		lda $11			; a5 11
B12_0237:		sta $0514		; 8d 14 05
B12_023a:		lda $13			; a5 13
B12_023c:		sta $0515		; 8d 15 05
B12_023f:		rts				; 60 


B12_0240:		lda #$4d		; a9 4d
B12_0242:		jsr checkGlobalFlag		; 20 e9 e7
B12_0245:		beq B12_0248 ; f0 01

B12_0247:		rts				; 60 


B12_0248:		lda $16			; a5 16
B12_024a:		cmp #$16		; c9 16
B12_024c:		bcc B12_027f ; 90 31

B12_024e:		cmp #$e9		; c9 e9
B12_0250:		bcc B12_02ad ; 90 5b

B12_0252:		lda $4b			; a5 4b
B12_0254:		and #$10		; 29 10
B12_0256:		beq B12_02ad ; f0 55

B12_0258:		lda $051e		; ad 1e 05
B12_025b:		bpl B12_0266 ; 10 09

B12_025d:		and #$7f		; 29 7f
B12_025f:		tax				; aa 
B12_0260:		lda wEntityStructs.byte4.w, x	; bd 04 04
B12_0263:		jmp $8268		; 4c 68 82


B12_0266:		lda $14			; a5 14
B12_0268:		beq B12_02ad ; f0 43

B12_026a:		bmi B12_02ad ; 30 41

B12_026c:		lda #$60		; a9 60
B12_026e:		jsr unsetGlobalFlag		; 20 fc e7
B12_0271:		lda $30			; a5 30
B12_0273:		clc				; 18 
B12_0274:		adc #$10		; 69 10
B12_0276:		and #$f0		; 29 f0
B12_0278:		sta $9a			; 85 9a
B12_027a:		lda #$01		; a9 01
B12_027c:		jmp $82f3		; 4c f3 82


B12_027f:		lda $4b			; a5 4b
B12_0281:		and #$20		; 29 20
B12_0283:		beq B12_02ad ; f0 28

B12_0285:		lda $051e		; ad 1e 05
B12_0288:		bpl B12_0293 ; 10 09

B12_028a:		and #$7f		; 29 7f
B12_028c:		tax				; aa 
B12_028d:		lda wEntityStructs.byte4.w, x	; bd 04 04
B12_0290:		jmp $8295		; 4c 95 82


B12_0293:		lda $14			; a5 14
B12_0295:		bpl B12_02ad ; 10 16

B12_0297:		lda #$61		; a9 61
B12_0299:		jsr unsetGlobalFlag		; 20 fc e7
B12_029c:		lda $30			; a5 30
B12_029e:		sec				; 38 
B12_029f:		sbc #$10		; e9 10
B12_02a1:		clc				; 18 
B12_02a2:		adc #$0f		; 69 0f
B12_02a4:		and #$f0		; 29 f0
B12_02a6:		sta $9a			; 85 9a
B12_02a8:		lda #$02		; a9 02
B12_02aa:		jmp $82f3		; 4c f3 82


B12_02ad:		lda $17			; a5 17
B12_02af:		cmp #$19		; c9 19
B12_02b1:		bcc B12_02d6 ; 90 23

B12_02b3:		cmp #$d0		; c9 d0
B12_02b5:		bcc B12_0325 ; 90 6e

B12_02b7:		lda $4b			; a5 4b
B12_02b9:		and #$40		; 29 40
B12_02bb:		beq B12_0325 ; f0 68

B12_02bd:		lda $15			; a5 15
B12_02bf:		beq B12_0325 ; f0 64

B12_02c1:		bmi B12_0325 ; 30 62

B12_02c3:		lda #$62		; a9 62
B12_02c5:		jsr unsetGlobalFlag		; 20 fc e7
B12_02c8:		lda $32			; a5 32
B12_02ca:		clc				; 18 
B12_02cb:		adc #$10		; 69 10
B12_02cd:		and #$f0		; 29 f0
B12_02cf:		sta $9a			; 85 9a
B12_02d1:		lda #$04		; a9 04
B12_02d3:		jmp $82f3		; 4c f3 82


B12_02d6:		lda $4b			; a5 4b
B12_02d8:		and #$80		; 29 80
B12_02da:		beq B12_0325 ; f0 49

B12_02dc:		lda $15			; a5 15
B12_02de:		bpl B12_0325 ; 10 45

B12_02e0:		lda #$63		; a9 63
B12_02e2:		jsr unsetGlobalFlag		; 20 fc e7
B12_02e5:		lda $32			; a5 32
B12_02e7:		sec				; 38 
B12_02e8:		sbc #$10		; e9 10
B12_02ea:		clc				; 18 
B12_02eb:		adc #$0f		; 69 0f
B12_02ed:		and #$f0		; 29 f0
B12_02ef:		sta $9a			; 85 9a
B12_02f1:		lda #$08		; a9 08
B12_02f3:		sta $99			; 85 99
B12_02f5:		lda $14			; a5 14
B12_02f7:		bmi B12_0301 ; 30 08

B12_02f9:		cmp #$41		; c9 41
B12_02fb:		bcc B12_0309 ; 90 0c

B12_02fd:		lda #$20		; a9 20
B12_02ff:		bne B12_0307 ; d0 06

B12_0301:		cmp #$c0		; c9 c0
B12_0303:		bcs B12_0309 ; b0 04

B12_0305:		lda #$e0		; a9 e0
B12_0307:		sta $14			; 85 14
B12_0309:		lda $15			; a5 15
B12_030b:		bmi B12_0315 ; 30 08

B12_030d:		cmp #$41		; c9 41
B12_030f:		bcc B12_031d ; 90 0c

B12_0311:		lda #$3c		; a9 3c
B12_0313:		bne B12_031b ; d0 06

B12_0315:		cmp #$c0		; c9 c0
B12_0317:		bcs B12_031d ; b0 04

B12_0319:		lda #$c4		; a9 c4
B12_031b:		sta $15			; 85 15
B12_031d:		jsr $8326		; 20 26 83
B12_0320:		lda #$48		; a9 48
B12_0322:		jmp setGlobalFlag		; 4c f0 e7


B12_0325:		rts				; 60 


B12_0326:		ldx #$00		; a2 00
B12_0328:		lda wEntityStructs.byte9.w, x	; bd 09 04
B12_032b:		beq B12_0352 ; f0 25

B12_032d:		ldy $835a		; ac 5a 83
B12_0330:		lda wEntityStructs.id.w, x	; bd 08 04
B12_0333:		cmp $835b, y	; d9 5b 83
B12_0336:		beq B12_0352 ; f0 1a

B12_0338:		dey				; 88 
B12_0339:		bpl B12_0333 ; 10 f8

B12_033b:		stx $0f			; 86 0f
B12_033d:		lda #$02		; a9 02
B12_033f:		sta wEntityStructs.id.w, x	; 9d 08 04
B12_0342:		lda #$80		; a9 80
B12_0344:		ora wEntityStructs.byte9.w, x	; 1d 09 04
B12_0347:		sta wEntityStructs.byte9.w, x	; 9d 09 04
B12_034a:		lda wEntityStructs.byteE.w, x	; bd 0e 04
B12_034d:		jsr unsetGlobalFlag		; 20 fc e7
B12_0350:		ldx $0f			; a6 0f
B12_0352:		txa				; 8a 
B12_0353:		clc				; 18 
B12_0354:		adc #$10		; 69 10
B12_0356:		tax				; aa 
B12_0357:		bpl B12_0328 ; 10 cf

B12_0359:		rts				; 60 


B12_035a:		ora $0a06		; 0d 06 0a
B12_035d:	.db $0c
B12_035e:		ora $0f0e		; 0d 0e 0f
B12_0361:		and $3331		; 2d 31 33
B12_0364:		rti				; 40 


B12_0365:		eor ($50, x)	; 41 50
B12_0367:		eor ($59), y	; 51 59
B12_0369:		lda #$00		; a9 00
B12_036b:		sta $20			; 85 20
B12_036d:		lda $99			; a5 99
B12_036f:		and #$0f		; 29 0f
B12_0371:		lsr a			; 4a
B12_0372:		bcs B12_03a8 ; b0 34

B12_0374:		lsr a			; 4a
B12_0375:		bcs B12_03a2 ; b0 2b

B12_0377:		lsr a			; 4a
B12_0378:		bcs B12_0380 ; b0 06

B12_037a:		ldx #$c0		; a2 c0
B12_037c:		lda #$f2		; a9 f2
B12_037e:		bne B12_0384 ; d0 04

B12_0380:		ldx #$40		; a2 40
B12_0382:		lda #$0e		; a9 0e
B12_0384:		stx $35			; 86 35
B12_0386:		sta $00			; 85 00
B12_0388:		clc				; 18 
B12_0389:		adc $13			; 65 13
B12_038b:		sta $13			; 85 13
B12_038d:		lda $00			; a5 00
B12_038f:		bmi B12_0395 ; 30 04

B12_0391:		lda #$00		; a9 00
B12_0393:		beq B12_0397 ; f0 02

B12_0395:		lda #$ff		; a9 ff
B12_0397:		adc $12			; 65 12
B12_0399:		sta $12			; 85 12
B12_039b:		lda #$00		; a9 00
B12_039d:		sta $14			; 85 14
B12_039f:		sta $34			; 85 34
B12_03a1:		rts				; 60 


B12_03a2:		ldx #$c0		; a2 c0
B12_03a4:		lda #$f4		; a9 f4
B12_03a6:		bne B12_03ac ; d0 04

B12_03a8:		ldx #$40		; a2 40
B12_03aa:		lda #$0c		; a9 0c
B12_03ac:		stx $34			; 86 34
B12_03ae:		sta $00			; 85 00
B12_03b0:		clc				; 18 
B12_03b1:		adc $11			; 65 11
B12_03b3:		sta $11			; 85 11
B12_03b5:		lda $00			; a5 00
B12_03b7:		bmi B12_03bd ; 30 04

B12_03b9:		lda #$00		; a9 00
B12_03bb:		beq B12_03bf ; f0 02

B12_03bd:		lda #$ff		; a9 ff
B12_03bf:		adc $10			; 65 10
B12_03c1:		sta $10			; 85 10
B12_03c3:		lda #$00		; a9 00
B12_03c5:		sta $15			; 85 15
B12_03c7:		sta $35			; 85 35
B12_03c9:		rts				; 60 


B12_03ca:		lda #$00		; a9 00
B12_03cc:		sta $14			; 85 14
B12_03ce:		sta $00			; 85 00
B12_03d0:		lda $16			; a5 16
B12_03d2:		asl a			; 0a
B12_03d3:		rol $00			; 26 00
B12_03d5:		asl a			; 0a
B12_03d6:		rol $00			; 26 00
B12_03d8:		asl a			; 0a
B12_03d9:		rol $00			; 26 00
B12_03db:		asl a			; 0a
B12_03dc:		rol $00			; 26 00
B12_03de:		clc				; 18 
B12_03df:		adc $31			; 65 31
B12_03e1:		sta $11			; 85 11
B12_03e3:		lda $30			; a5 30
B12_03e5:		adc $00			; 65 00
B12_03e7:		sta $10			; 85 10
B12_03e9:		rts				; 60 


B12_03ea:		lda #$00		; a9 00
B12_03ec:		sta $15			; 85 15
B12_03ee:		sta $00			; 85 00
B12_03f0:		lda $17			; a5 17
B12_03f2:		asl a			; 0a
B12_03f3:		rol $00			; 26 00
B12_03f5:		asl a			; 0a
B12_03f6:		rol $00			; 26 00
B12_03f8:		asl a			; 0a
B12_03f9:		rol $00			; 26 00
B12_03fb:		asl a			; 0a
B12_03fc:		rol $00			; 26 00
B12_03fe:		clc				; 18 
B12_03ff:		adc $33			; 65 33
B12_0401:		sta $13			; 85 13
B12_0403:		lda $32			; a5 32
B12_0405:		adc $00			; 65 00
B12_0407:		sta $12			; 85 12
B12_0409:		rts				; 60 


B12_040a:		sta $00			; 85 00
B12_040c:		lda $1a			; a5 1a
B12_040e:		and #$08		; 29 08
B12_0410:		bne B12_043b ; d0 29

B12_0412:		sta $00			; 85 00
B12_0414:		lda $1a			; a5 1a
B12_0416:		and #$20		; 29 20
B12_0418:		bne B12_0458 ; d0 3e

B12_041a:		lda $19			; a5 19
B12_041c:		and #$04		; 29 04
B12_041e:		beq B12_043b ; f0 1b

B12_0420:		lda $20			; a5 20
B12_0422:		bpl B12_047d ; 10 59

B12_0424:		lda wJoy1ButtonsPressed.w		; ad 50 01
B12_0427:		bmi B12_042e ; 30 05

B12_0429:		lda #$00		; a9 00
B12_042b:		sta $20			; 85 20
B12_042d:		rts				; 60 


B12_042e:		lda $20			; a5 20
B12_0430:		and #$0f		; 29 0f
B12_0432:		cmp $01			; c5 01
B12_0434:		beq B12_047e ; f0 48

B12_0436:		inc $20			; e6 20
B12_0438:		jmp $8479		; 4c 79 84


B12_043b:		lda #$5f		; a9 5f
B12_043d:		jsr checkGlobalFlag		; 20 e9 e7
B12_0440:		bne B12_047d ; d0 3b

B12_0442:		lda wJoy1NewButtonsPressed.w		; ad 54 01
B12_0445:		bpl B12_047d ; 10 36

B12_0447:		lda $04ea		; ad ea 04
B12_044a:		and #$7f		; 29 7f
B12_044c:		sta $04ea		; 8d ea 04
B12_044f:		lda #$03		; a9 03
B12_0451:		jsr $8e2e		; 20 2e 8e
B12_0454:		lda #$80		; a9 80
B12_0456:		bne B12_0465 ; d0 0d

B12_0458:		lda wJoy1NewButtonsPressed.w		; ad 54 01
B12_045b:		bpl B12_047d ; 10 20

B12_045d:		lda $1a			; a5 1a
B12_045f:		and #$df		; 29 df
B12_0461:		sta $1a			; 85 1a
B12_0463:		lda #$c0		; a9 c0
B12_0465:		sta $20			; 85 20
B12_0467:		lda wChosenCharacter.w		; ad 10 05
B12_046a:		and #$03		; 29 03
B12_046c:		tay				; a8 
B12_046d:		lda $8483, y	; b9 83 84
B12_0470:		jsr func_08fa		; 20 fa e8
B12_0473:		lda $19			; a5 19
B12_0475:		and #$bf		; 29 bf
B12_0477:		sta $19			; 85 19
B12_0479:		lda $00			; a5 00
B12_047b:		sta $15			; 85 15
B12_047d:		rts				; 60 


B12_047e:		lda #$00		; a9 00
B12_0480:		sta $20			; 85 20
B12_0482:		rts				; 60 


B12_0483:		.db $20 $2b $2c $2d

B12_0487:		lda $1a			; a5 1a
B12_0489:		and #$20		; 29 20
B12_048b:		beq B12_0494 ; f0 07

B12_048d:		lda #$00		; a9 00
B12_048f:		sta $14			; 85 14
B12_0491:		sta $15			; 85 15
B12_0493:		rts				; 60 


B12_0494:		lda #$41		; a9 41
B12_0496:		jsr checkGlobalFlag		; 20 e9 e7
B12_0499:		beq B12_04a0 ; f0 05

B12_049b:		lda #$41		; a9 41
B12_049d:		jmp unsetGlobalFlag		; 4c fc e7


B12_04a0:		lda $1b			; a5 1b
B12_04a2:		and #$02		; 29 02
B12_04a4:		beq B12_04c2 ; f0 1c

B12_04a6:		lda $1a			; a5 1a
B12_04a8:		and #$02		; 29 02
B12_04aa:		beq B12_04b5 ; f0 09

B12_04ac:		lda $1b			; a5 1b
B12_04ae:		and #$fd		; 29 fd
B12_04b0:		sta $1b			; 85 1b
B12_04b2:		jmp $88ba		; 4c ba 88


B12_04b5:		lda wChosenCharacter.w		; ad 10 05
B12_04b8:		and #$03		; 29 03
B12_04ba:		tay				; a8 
B12_04bb:		lda $84ca, y	; b9 ca 84
B12_04be:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B12_04c1:		rts				; 60 


B12_04c2:		lda #$57		; a9 57
B12_04c4:		jsr unsetGlobalFlag		; 20 fc e7
B12_04c7:		jmp $8865		; 4c 65 88


B12_04ca:		and $7a			; 25 7a
B12_04cc:		ldy $e7			; a4 e7
B12_04ce:		lda #$46		; a9 46
B12_04d0:		jsr checkGlobalFlag		; 20 e9 e7
B12_04d3:		beq B12_04df ; f0 0a

B12_04d5:		lda wChosenCharacter.w		; ad 10 05
B12_04d8:		and #$03		; 29 03
B12_04da:		cmp #$02		; c9 02
B12_04dc:		beq B12_04df ; f0 01

B12_04de:		rts				; 60 


B12_04df:		lda $1b			; a5 1b
B12_04e1:		and #$04		; 29 04
B12_04e3:		beq B12_04e8 ; f0 03

B12_04e5:		jmp $8865		; 4c 65 88


B12_04e8:		lda $1a			; a5 1a
B12_04ea:		and #$20		; 29 20
B12_04ec:		beq B12_0506 ; f0 18

B12_04ee:		lda #$5c		; a9 5c
B12_04f0:		jsr checkGlobalFlag		; 20 e9 e7
B12_04f3:		bne B12_0505 ; d0 10

B12_04f5:		lda #$18		; a9 18
B12_04f7:		sta $15			; 85 15
B12_04f9:		lda $015a		; ad 5a 01
B12_04fc:		and #$07		; 29 07
B12_04fe:		bne B12_0505 ; d0 05

B12_0500:		lda #$26		; a9 26
B12_0502:		jsr func_08fa		; 20 fa e8
B12_0505:		rts				; 60 


B12_0506:		lda $19			; a5 19
B12_0508:		and #$04		; 29 04
B12_050a:		bne B12_0545 ; d0 39

B12_050c:		lda $1a			; a5 1a
B12_050e:		and #$0b		; 29 0b
B12_0510:		bne B12_0539 ; d0 27

B12_0512:		lda $1b			; a5 1b
B12_0514:		and #$02		; 29 02
B12_0516:		bne B12_0557 ; d0 3f

B12_0518:		bit $04ea		; 2c ea 04
B12_051b:		bmi B12_0540 ; 30 23

B12_051d:		lda $1b			; a5 1b
B12_051f:		and #$01		; 29 01
B12_0521:		bne B12_0564 ; d0 41

B12_0523:		lda wJoy1NewButtonsPressed.w		; ad 54 01
B12_0526:		and #$04		; 29 04
B12_0528:		beq B12_0564 ; f0 3a

B12_052a:		lda #$02		; a9 02
B12_052c:		ora $1b			; 05 1b
B12_052e:		sta $1b			; 85 1b
B12_0530:		lda #$00		; a9 00
B12_0532:		sta $14			; 85 14
B12_0534:		lda #$04		; a9 04
B12_0536:		jmp $8e2e		; 4c 2e 8e


B12_0539:		lda $1b			; a5 1b
B12_053b:		and #$fd		; 29 fd
B12_053d:		sta $1b			; 85 1b
B12_053f:		rts				; 60 


B12_0540:		lda #$57		; a9 57
B12_0542:		jmp unsetGlobalFlag		; 4c fc e7


B12_0545:		lda #$57		; a9 57
B12_0547:		jsr setGlobalFlag		; 20 f0 e7
B12_054a:		lda wChosenCharacter.w		; ad 10 05
B12_054d:		and #$03		; 29 03
B12_054f:		tay				; a8 
B12_0550:		lda $8576, y	; b9 76 85
B12_0553:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B12_0556:		rts				; 60 


B12_0557:		lda wChosenCharacter.w		; ad 10 05
B12_055a:		and #$03		; 29 03
B12_055c:		tay				; a8 
B12_055d:		lda $856e, y	; b9 6e 85
B12_0560:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B12_0563:		rts				; 60 


B12_0564:		lda wJoy1ButtonsPressed.w		; ad 50 01
B12_0567:		and #$03		; 29 03
B12_0569:		bne B12_0556 ; d0 eb

B12_056b:		jmp $88ba		; 4c ba 88


B12_056e:		and $7a			; 25 7a
B12_0570:		ldy $e7			; a4 e7
B12_0572:	.db $0c
B12_0573:		jmp $cc8c		; 4c 8c cc


B12_0576:	.db $0b
B12_0577:	.db $4b
B12_0578:	.db $8b
B12_0579:	.db $cb
B12_057a:		lda #$46		; a9 46
B12_057c:		jsr checkGlobalFlag		; 20 e9 e7
B12_057f:		beq B12_0582 ; f0 01

B12_0581:		rts				; 60 


B12_0582:		lda $1b			; a5 1b
B12_0584:		and #$04		; 29 04
B12_0586:		beq B12_058b ; f0 03

B12_0588:		jmp $8865		; 4c 65 88


B12_058b:		lda $1a			; a5 1a
B12_058d:		and #$20		; 29 20
B12_058f:		beq B12_05a9 ; f0 18

B12_0591:		lda #$5c		; a9 5c
B12_0593:		jsr checkGlobalFlag		; 20 e9 e7
B12_0596:		bne B12_05a8 ; d0 10

B12_0598:		lda #$e8		; a9 e8
B12_059a:		sta $15			; 85 15
B12_059c:		lda $015a		; ad 5a 01
B12_059f:		and #$07		; 29 07
B12_05a1:		bne B12_05a8 ; d0 05

B12_05a3:		lda #$26		; a9 26
B12_05a5:		jsr func_08fa		; 20 fa e8
B12_05a8:		rts				; 60 


B12_05a9:		lda $1b			; a5 1b
B12_05ab:		and #$10		; 29 10
B12_05ad:		beq B12_05b2 ; f0 03

B12_05af:		jmp $85da		; 4c da 85


B12_05b2:		lda $1b			; a5 1b
B12_05b4:		and #$02		; 29 02
B12_05b6:		beq B12_05c3 ; f0 0b

B12_05b8:		lda $1b			; a5 1b
B12_05ba:		and #$fd		; 29 fd
B12_05bc:		sta $1b			; 85 1b
B12_05be:		lda #$05		; a9 05
B12_05c0:		jmp $8e2e		; 4c 2e 8e


B12_05c3:		lda wJoy1ButtonsPressed.w		; ad 50 01
B12_05c6:		and #$03		; 29 03
B12_05c8:		bne B12_05a8 ; d0 de

B12_05ca:		lda $19			; a5 19
B12_05cc:		and #$04		; 29 04
B12_05ce:		bne B12_05a8 ; d0 d8

B12_05d0:		jsr $8865		; 20 65 88
B12_05d3:		lda $14			; a5 14
B12_05d5:		bne B12_05a8 ; d0 d1

B12_05d7:		jmp $88ba		; 4c ba 88


B12_05da:		lda $1a			; a5 1a
B12_05dc:		ora #$20		; 09 20
B12_05de:		sta $1a			; 85 1a
B12_05e0:		lda $1b			; a5 1b
B12_05e2:		and #$01		; 29 01
B12_05e4:		beq B12_0606 ; f0 20

B12_05e6:		ldx $0517		; ae 17 05
B12_05e9:		lda #$00		; a9 00
B12_05eb:		sta $030a, x	; 9d 0a 03
B12_05ee:		lda #$e0		; a9 e0
B12_05f0:		sta $0305, x	; 9d 05 03
B12_05f3:		lda #$00		; a9 00
B12_05f5:		sta $0304, x	; 9d 04 03
B12_05f8:		lda $030a, x	; bd 0a 03
B12_05fb:		and #$df		; 29 df
B12_05fd:		sta $030a, x	; 9d 0a 03
B12_0600:		lda $1b			; a5 1b
B12_0602:		and #$fe		; 29 fe
B12_0604:		sta $1b			; 85 1b
B12_0606:		rts				; 60 


B12_0607:		lda $1a			; a5 1a
B12_0609:		and #$20		; 29 20
B12_060b:		bne B12_067c ; d0 6f

B12_060d:		bit wJoy1ButtonsPressed.w		; 2c 50 01
B12_0610:		bvs B12_0615 ; 70 03

B12_0612:		jmp $867d		; 4c 7d 86


B12_0615:		bit wJoy1NewButtonsPressed.w		; 2c 54 01
B12_0618:		bvc B12_062d ; 50 13

B12_061a:		lda $1b			; a5 1b
B12_061c:		and #$01		; 29 01
B12_061e:		bne B12_062a ; d0 0a

B12_0620:		lda #$4a		; a9 4a
B12_0622:		jsr checkGlobalFlag		; 20 e9 e7
B12_0625:		beq B12_062a ; f0 03

B12_0627:		jmp $8694		; 4c 94 86


B12_062a:		jmp $86d1		; 4c d1 86


B12_062d:		lda wChosenCharacter.w		; ad 10 05
B12_0630:		and #$03		; 29 03
B12_0632:		tay				; a8 
B12_0633:		lda $8707, y	; b9 07 87
B12_0636:		jsr checkGlobalFlag		; 20 e9 e7
B12_0639:		beq B12_067c ; f0 41

B12_063b:		lda $19			; a5 19
B12_063d:		and #$04		; 29 04
B12_063f:		bne B12_067c ; d0 3b

B12_0641:		lda $1a			; a5 1a
B12_0643:		and #$20		; 29 20
B12_0645:		bne B12_067c ; d0 35

B12_0647:		lda $1b			; a5 1b
B12_0649:		and #$01		; 29 01
B12_064b:		bne B12_067c ; d0 2f

B12_064d:		lda #$46		; a9 46
B12_064f:		jsr checkGlobalFlag		; 20 e9 e7
B12_0652:		bne B12_067c ; d0 28

B12_0654:		lda #$4a		; a9 4a
B12_0656:		jsr checkGlobalFlag		; 20 e9 e7
B12_0659:		bne B12_067c ; d0 21

B12_065b:		lda $015a		; ad 5a 01
B12_065e:		and #$01		; 29 01
B12_0660:		bne B12_0665 ; d0 03

B12_0662:		inc $0516		; ee 16 05
B12_0665:		lda $0516		; ad 16 05
B12_0668:		cmp #$10		; c9 10
B12_066a:		bne B12_0674 ; d0 08

B12_066c:		jsr $a2a8		; 20 a8 a2
B12_066f:		lda #$49		; a9 49
B12_0671:		jsr setGlobalFlag		; 20 f0 e7
B12_0674:		jsr $86e5		; 20 e5 86
B12_0677:		lda #$43		; a9 43
B12_0679:		jmp setGlobalFlag		; 4c f0 e7


B12_067c:		rts				; 60 


B12_067d:		lda #$43		; a9 43
B12_067f:		jsr unsetGlobalFlag		; 20 fc e7
B12_0682:		lda #$4a		; a9 4a
B12_0684:		jsr checkGlobalFlag		; 20 e9 e7
B12_0687:		beq B12_068a ; f0 01

B12_0689:		rts				; 60 


B12_068a:		lda #$00		; a9 00
B12_068c:		sta $0516		; 8d 16 05
B12_068f:		lda #$49		; a9 49
B12_0691:		jmp unsetGlobalFlag		; 4c fc e7


B12_0694:		lda #$4a		; a9 4a
B12_0696:		jsr unsetGlobalFlag		; 20 fc e7
B12_0699:		ldx #$80		; a2 80
B12_069b:		lda $0309, x	; bd 09 03
B12_069e:		beq B12_06b4 ; f0 14

B12_06a0:		lda $0308, x	; bd 08 03
B12_06a3:		cmp #$30		; c9 30
B12_06a5:		bne B12_06b4 ; d0 0d

B12_06a7:		lda #$02		; a9 02
B12_06a9:		sta $0308, x	; 9d 08 03
B12_06ac:		lda #$80		; a9 80
B12_06ae:		ora $0309, x	; 1d 09 03
B12_06b1:		sta $0309, x	; 9d 09 03
B12_06b4:		txa				; 8a 
B12_06b5:		clc				; 18 
B12_06b6:		adc #$10		; 69 10
B12_06b8:		tax				; aa 
B12_06b9:		bne B12_069b ; d0 e0

B12_06bb:		lda wChosenCharacter.w		; ad 10 05
B12_06be:		and #$03		; 29 03
B12_06c0:		tay				; a8 
B12_06c1:		lda $870b, y	; b9 0b 87
B12_06c4:		jsr $8e2e		; 20 2e 8e
B12_06c7:		lda #$00		; a9 00
B12_06c9:		sta $0516		; 8d 16 05
B12_06cc:		lda #$43		; a9 43
B12_06ce:		jmp unsetGlobalFlag		; 4c fc e7


B12_06d1:		sta $0516		; 8d 16 05
B12_06d4:		lda $1b			; a5 1b
B12_06d6:		and #$01		; 29 01
B12_06d8:		beq B12_06e4 ; f0 0a

B12_06da:		lda #$43		; a9 43
B12_06dc:		jsr unsetGlobalFlag		; 20 fc e7
B12_06df:		lda #$07		; a9 07
B12_06e1:		jmp $8e2e		; 4c 2e 8e


B12_06e4:		rts				; 60 


B12_06e5:		lda wChosenCharacter.w		; ad 10 05
B12_06e8:		and #$03		; 29 03
B12_06ea:		asl a			; 0a
B12_06eb:		tay				; a8 
B12_06ec:		lda $0516		; ad 16 05
B12_06ef:		cmp #$20		; c9 20
B12_06f1:		bcs B12_06f8 ; b0 05

B12_06f3:		lda $86ff, y	; b9 ff 86
B12_06f6:		bne B12_06fb ; d0 03

B12_06f8:		lda $8700, y	; b9 00 87
B12_06fb:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B12_06fe:		rts				; 60 


B12_06ff:		and $6d2e		; 2d 2e 6d
B12_0702:		ror $aaa9		; 6e a9 aa
B12_0705:		beq B12_06f8 ; f0 f1

B12_0707:		and $0302, y	; 39 02 03
B12_070a:		ora ($08, x)	; 01 08
B12_070c:	.db $0b
B12_070d:		asl $0710		; 0e 10 07
B12_0710:	.db $07
B12_0711:	.db $07
B12_0712:	.db $07
B12_0713:	.db $03
B12_0714:	.db $03
B12_0715:	.db $03
B12_0716:	.db $03
B12_0717:		sta $0f			; 85 0f
B12_0719:		lda #$43		; a9 43
B12_071b:		jsr checkGlobalFlag		; 20 e9 e7
B12_071e:		bne B12_0727 ; d0 07

B12_0720:		lda #$5c		; a9 5c
B12_0722:		jsr checkGlobalFlag		; 20 e9 e7
B12_0725:		beq B12_0728 ; f0 01

B12_0727:		rts				; 60 


B12_0728:		bit $051e		; 2c 1e 05
B12_072b:		bmi B12_073e ; 30 11

B12_072d:		lda $1b			; a5 1b
B12_072f:		and #$06		; 29 06
B12_0731:		beq B12_0737 ; f0 04

B12_0733:		ldx #$02		; a2 02
B12_0735:		bne B12_0739 ; d0 02

B12_0737:		ldx #$00		; a2 00
B12_0739:		lda $0f			; a5 0f
B12_073b:		jmp func_13ef		; 4c ef f3


B12_073e:		lda #$40		; a9 40
B12_0740:		jmp func_13ef		; 4c ef f3


func_c_0743:
B12_0743:		lda $051a		; ad 1a 05
B12_0746:		bne B12_0755 ; d0 0d

B12_0748:		lda $051c		; ad 1c 05
B12_074b:		beq B12_0755 ; f0 08

B12_074d:		lda $015a		; ad 5a 01
B12_0750:		and #$01		; 29 01
B12_0752:		bne B12_0755 ; d0 01

B12_0754:		rts				; 60 

B12_0755:		lda #$00		; a9 00
B12_0757:		sta $2a			; 85 2a
B12_0759:		lda $051e		; ad 1e 05
B12_075c:		bmi B12_076b ; 30 0d

B12_075e:		lda wPlayerOamDetailsIdx.w		; ad 1b 05
B12_0761:		jsr func_1596		; 20 96 f5
B12_0764:		lda wNextUsableOamIdx.w		; ad 58 01
B12_0767:		sta $0166		; 8d 66 01
B12_076a:		rts				; 60 


B12_076b:		and #$7f		; 29 7f
B12_076d:		tax				; aa 
B12_076e:		lda wEntityStructs.byte9.w, x	; bd 09 04
B12_0771:		beq B12_07b1 ; f0 3e

B12_0773:		lda wEntityStructs.id.w, x	; bd 08 04
B12_0776:		cmp #$32		; c9 32
B12_0778:		bne B12_07b1 ; d0 37

B12_077a:		lda wEntityStructs.byteA.w, x	; bd 0a 04
B12_077d:		and #$0c		; 29 0c
B12_077f:		beq B12_075e ; f0 dd

B12_0781:		ldy #$00		; a0 00
B12_0783:		lda wEntityStructs.byteA.w, x	; bd 0a 04
B12_0786:		and #$10		; 29 10
B12_0788:		beq B12_078c ; f0 02

B12_078a:		ldy #$02		; a0 02
B12_078c:		lda $16			; a5 16
B12_078e:		pha				; 48 
B12_078f:		clc				; 18 
B12_0790:		adc $87b8, y	; 79 b8 87
B12_0793:		sta $16			; 85 16
B12_0795:		lda $17			; a5 17
B12_0797:		pha				; 48 
B12_0798:		clc				; 18 
B12_0799:		adc $87b9, y	; 79 b9 87
B12_079c:		sta $17			; 85 17
B12_079e:		lda wPlayerOamDetailsIdx.w		; ad 1b 05
B12_07a1:		jsr func_1596		; 20 96 f5
B12_07a4:		pla				; 68 
B12_07a5:		sta $17			; 85 17
B12_07a7:		pla				; 68 
B12_07a8:		sta $16			; 85 16
B12_07aa:		lda wNextUsableOamIdx.w		; ad 58 01
B12_07ad:		sta $0166		; 8d 66 01
B12_07b0:		rts				; 60 


B12_07b1:		lda #$00		; a9 00
B12_07b3:		sta $051e		; 8d 1e 05
B12_07b6:		beq B12_075e ; f0 a6

B12_07b8:		sed				; f8 
B12_07b9:		php				; 08 
B12_07ba:		.db $00				; 00
B12_07bb:		.db $00				; 00
B12_07bc:		lda $051e		; ad 1e 05
B12_07bf:		bpl B12_07fa ; 10 39

B12_07c1:		and #$7f		; 29 7f
B12_07c3:		tax				; aa 
B12_07c4:		lda wJoy1ButtonsPressed.w		; ad 50 01
B12_07c7:		and #$f0		; 29 f0
B12_07c9:		sta wJoy1ButtonsPressed.w		; 8d 50 01
B12_07cc:		lda wJoy1NewButtonsPressed.w		; ad 54 01
B12_07cf:		and #$f0		; 29 f0
B12_07d1:		sta wJoy1NewButtonsPressed.w		; 8d 54 01
B12_07d4:		ldy #$00		; a0 00
B12_07d6:		lda wEntityStructs.byteA.w, x	; bd 0a 04
B12_07d9:		and #$0c		; 29 0c
B12_07db:		beq B12_07df ; f0 02

B12_07dd:		ldy #$02		; a0 02
B12_07df:		lda wEntityStructs.subX.w, x	; bd 01 04
B12_07e2:		bmi B12_07e5 ; 30 01

B12_07e4:		iny				; c8 
B12_07e5:		lda wEntityStructs.byte6.w, x	; bd 06 04
B12_07e8:		sta $16			; 85 16
B12_07ea:		lda wEntityStructs.byte7.w, x	; bd 07 04
B12_07ed:		sta $17			; 85 17
B12_07ef:		lda wEntityStructs.byte9.w, x	; bd 09 04
B12_07f2:		sta $19			; 85 19
B12_07f4:		lda $87fb, y	; b9 fb 87
B12_07f7:		jsr updateEntity_wOam		; 20 67 f5
B12_07fa:		rts				; 60 


B12_07fb:	.db $6f
B12_07fc:		;removed
	.db $70 $73

B12_07fe:	.db $74
B12_07ff:		lda #$46		; a9 46
B12_0801:		jsr checkGlobalFlag		; 20 e9 e7
B12_0804:		beq B12_0818 ; f0 12

B12_0806:		lda #$02		; a9 02
B12_0808:		sta $03f8		; 8d f8 03
B12_080b:		lda #$80		; a9 80
B12_080d:		ora $03f9		; 0d f9 03
B12_0810:		sta $03f9		; 8d f9 03
B12_0813:		lda #$46		; a9 46
B12_0815:		jsr unsetGlobalFlag		; 20 fc e7
B12_0818:		lda $015a		; ad 5a 01
B12_081b:		and #$0f		; 29 0f
B12_081d:		bne B12_0824 ; d0 05

B12_081f:		lda #$27		; a9 27
B12_0821:		jsr func_08fa		; 20 fa e8
B12_0824:		lda $1b			; a5 1b
B12_0826:		and #$fd		; 29 fd
B12_0828:		sta $1b			; 85 1b
B12_082a:		lda $1a			; a5 1a
B12_082c:		and #$08		; 29 08
B12_082e:		beq B12_084c ; f0 1c

B12_0830:		lda $1a			; a5 1a
B12_0832:		and #$08		; 29 08
B12_0834:		beq B12_084c ; f0 16

B12_0836:		lda $15			; a5 15
B12_0838:		bmi B12_083e ; 30 04

B12_083a:		cmp #$04		; c9 04
B12_083c:		bne B12_084c ; d0 0e

B12_083e:		lda $13			; a5 13
B12_0840:		cmp #$60		; c9 60
B12_0842:		bcs B12_085c ; b0 18

B12_0844:		cmp #$10		; c9 10
B12_0846:		bcs B12_0860 ; b0 18

B12_0848:		lda #$04		; a9 04
B12_084a:		bne B12_085e ; d0 12

B12_084c:		lda #$00		; a9 00
B12_084e:		sta $14			; 85 14
B12_0850:		lda $15			; a5 15
B12_0852:		bmi B12_085c ; 30 08

B12_0854:		lda $15			; a5 15
B12_0856:		clc				; 18 
B12_0857:		adc #$fc		; 69 fc
B12_0859:		jmp $885e		; 4c 5e 88


B12_085c:		lda #$fc		; a9 fc
B12_085e:		sta $15			; 85 15
B12_0860:		lda #$80		; a9 80
B12_0862:		jmp $8717		; 4c 17 87


B12_0865:		lda $14			; a5 14
B12_0867:		beq B12_08ae ; f0 45

B12_0869:		bmi B12_0890 ; 30 25

B12_086b:		lda #$49		; a9 49
B12_086d:		jsr checkGlobalFlag		; 20 e9 e7
B12_0870:		bne B12_08ad ; d0 3b

B12_0872:		lda $19			; a5 19
B12_0874:		and #$04		; 29 04
B12_0876:		bne B12_087e ; d0 06

B12_0878:		lda $1a			; a5 1a
B12_087a:		and #$02		; 29 02
B12_087c:		beq B12_0885 ; f0 07

B12_087e:		lda $015a		; ad 5a 01
B12_0881:		and #$07		; 29 07
B12_0883:		bne B12_088f ; d0 0a

B12_0885:		dec $14			; c6 14
B12_0887:		lda $14			; a5 14
B12_0889:		bpl B12_088f ; 10 04

B12_088b:		lda #$00		; a9 00
B12_088d:		sta $14			; 85 14
B12_088f:		rts				; 60 


B12_0890:		lda $19			; a5 19
B12_0892:		and #$04		; 29 04
B12_0894:		bne B12_089c ; d0 06

B12_0896:		lda $1a			; a5 1a
B12_0898:		and #$02		; 29 02
B12_089a:		beq B12_08a3 ; f0 07

B12_089c:		lda $015a		; ad 5a 01
B12_089f:		and #$07		; 29 07
B12_08a1:		bne B12_088f ; d0 ec

B12_08a3:		inc $14			; e6 14
B12_08a5:		lda $14			; a5 14
B12_08a7:		bmi B12_08ad ; 30 04

B12_08a9:		lda #$00		; a9 00
B12_08ab:		sta $14			; 85 14
B12_08ad:		rts				; 60 


B12_08ae:		lda $19			; a5 19
B12_08b0:		and #$04		; 29 04
B12_08b2:		bne B12_08ad ; d0 f9

B12_08b4:		lda $1b			; a5 1b
B12_08b6:		and #$fb		; 29 fb
B12_08b8:		sta $1b			; 85 1b
B12_08ba:		lda wPlayerOamDetailsIdx.w		; ad 1b 05
B12_08bd:		bne B12_08d1 ; d0 12

B12_08bf:		lda wChosenCharacter.w		; ad 10 05
B12_08c2:		and #$03		; 29 03
B12_08c4:		tay				; a8 
B12_08c5:		lda $1b			; a5 1b
B12_08c7:		and #$01		; 29 01
B12_08c9:		bne B12_08d2 ; d0 07

B12_08cb:		lda $88d9, y	; b9 d9 88
B12_08ce:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B12_08d1:		rts				; 60 


B12_08d2:		lda $88dd, y	; b9 dd 88
B12_08d5:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B12_08d8:		rts				; 60 


B12_08d9:		asl $46			; 06 46
B12_08db:		stx $c6			; 86 c6
B12_08dd:	.db $12
B12_08de:	.db $52
B12_08df:	.db $92
B12_08e0:	.db $d2
B12_08e1:		lda $0511		; ad 11 05
B12_08e4:		bne B12_08e7 ; d0 01

B12_08e6:		rts				; 60 


B12_08e7:		sec				; 38 
B12_08e8:		sbc #$01		; e9 01
B12_08ea:		jsr jumpTable		; 20 a6 e6
	.dw $891b
	.dw $8948
	.dw $89a4
	.dw $89cc
	.dw $89f7
	.dw $8a22
	.dw $8af7
	.dw $8b78
	.dw $8b97
	.dw $8bc6
	.dw $8c0b
	.dw $8c44
	.dw $8c45
	.dw $8c46
	.dw $8c79
	.dw $8ca6
	.dw $8cc3
	.dw $8ceb
	.dw $8d0b
	.dw $8d0c
	.dw $8d48
	.dw $8da3
	.dw $8de5

B12_091b:		lda $1a			; a5 1a
B12_091d:		and #$02		; 29 02
B12_091f:		bne B12_093a ; d0 19

B12_0921:		lda wChosenCharacter.w		; ad 10 05
B12_0924:		and #$03		; 29 03
B12_0926:		tay				; a8 
B12_0927:		lda $8944, y	; b9 44 89
B12_092a:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B12_092d:		dec $0512		; ce 12 05
B12_0930:		bne B12_0939 ; d0 07

B12_0932:		lda #$00		; a9 00
B12_0934:		sta $0511		; 8d 11 05
B12_0937:		sta $14			; 85 14
B12_0939:		rts				; 60 


B12_093a:		lda #$00		; a9 00
B12_093c:		sta $0511		; 8d 11 05
B12_093f:		lda #$02		; a9 02
B12_0941:		jmp $8e2e		; 4c 2e 8e


B12_0944:		ora $45			; 05 45
B12_0946:		sta $c5			; 85 c5
B12_0948:		lda $19			; a5 19
B12_094a:		and #$02		; 29 02
B12_094c:		bne B12_0957 ; d0 09

B12_094e:		lda wJoy1ButtonsPressed.w		; ad 50 01
B12_0951:		and #$01		; 29 01
B12_0953:		bne B12_0969 ; d0 14

B12_0955:		beq B12_095e ; f0 07

B12_0957:		lda wJoy1ButtonsPressed.w		; ad 50 01
B12_095a:		and #$02		; 29 02
B12_095c:		bne B12_0969 ; d0 0b

B12_095e:		lda wChosenCharacter.w		; ad 10 05
B12_0961:		and #$03		; 29 03
B12_0963:		tay				; a8 
B12_0964:		dec $0512		; ce 12 05
B12_0967:		bne B12_096f ; d0 06

B12_0969:		lda #$00		; a9 00
B12_096b:		sta $0511		; 8d 11 05
B12_096e:		rts				; 60 


B12_096f:		lda $0512		; ad 12 05
B12_0972:		cmp #$03		; c9 03
B12_0974:		bcc B12_0995 ; 90 1f

B12_0976:		cmp #$07		; c9 07
B12_0978:		bcs B12_0995 ; b0 1b

B12_097a:		cmp #$05		; c9 05
B12_097c:		bne B12_0990 ; d0 12

B12_097e:		lda $19			; a5 19
B12_0980:		and #$02		; 29 02
B12_0982:		bne B12_098a ; d0 06

B12_0984:		lda $19			; a5 19
B12_0986:		ora #$02		; 09 02
B12_0988:		bne B12_098e ; d0 04

B12_098a:		lda $19			; a5 19
B12_098c:		and #$fd		; 29 fd
B12_098e:		sta $19			; 85 19
B12_0990:		lda $89a0, y	; b9 a0 89
B12_0993:		bne B12_0998 ; d0 03

B12_0995:		lda $899c, y	; b9 9c 89
B12_0998:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B12_099b:		rts				; 60 


B12_099c:		asl $46			; 06 46
B12_099e:		stx $c6			; 86 c6
B12_09a0:	.db $07
B12_09a1:	.db $47
B12_09a2:	.db $87
B12_09a3:	.db $c7
B12_09a4:		lda $1b			; a5 1b
B12_09a6:		and #$fd		; 29 fd
B12_09a8:		sta $1b			; 85 1b
B12_09aa:		lda #$46		; a9 46
B12_09ac:		jsr checkGlobalFlag		; 20 e9 e7
B12_09af:		bne B12_09bd ; d0 0c

B12_09b1:		lda wChosenCharacter.w		; ad 10 05
B12_09b4:		and #$03		; 29 03
B12_09b6:		tay				; a8 
B12_09b7:		lda $89c8, y	; b9 c8 89
B12_09ba:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B12_09bd:		dec $0512		; ce 12 05
B12_09c0:		bne B12_09c7 ; d0 05

B12_09c2:		lda #$00		; a9 00
B12_09c4:		sta $0511		; 8d 11 05
B12_09c7:		rts				; 60 


B12_09c8:		php				; 08 
B12_09c9:		pha				; 48 
B12_09ca:		dey				; 88 
B12_09cb:		iny				; c8 
B12_09cc:		lda wChosenCharacter.w		; ad 10 05
B12_09cf:		and #$03		; 29 03
B12_09d1:		tay				; a8 
B12_09d2:		lda $0512		; ad 12 05
B12_09d5:		cmp #$02		; c9 02
B12_09d7:		bcs B12_09de ; b0 05

B12_09d9:		lda $89f3, y	; b9 f3 89
B12_09dc:		bne B12_09e1 ; d0 03

B12_09de:		lda $89ef, y	; b9 ef 89
B12_09e1:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B12_09e4:		dec $0512		; ce 12 05
B12_09e7:		bne B12_09ee ; d0 05

B12_09e9:		lda #$00		; a9 00
B12_09eb:		sta $0511		; 8d 11 05
B12_09ee:		rts				; 60 


B12_09ef:		bit $79			; 24 79
B12_09f1:		ldy $e5			; a4 e5
B12_09f3:		and $79			; 25 79
B12_09f5:		ldy $e6			; a4 e6
B12_09f7:		lda wChosenCharacter.w		; ad 10 05
B12_09fa:		and #$03		; 29 03
B12_09fc:		tay				; a8 
B12_09fd:		lda $0512		; ad 12 05
B12_0a00:		cmp #$02		; c9 02
B12_0a02:		bcs B12_0a09 ; b0 05

B12_0a04:		lda $8a1e, y	; b9 1e 8a
B12_0a07:		bne B12_0a0c ; d0 03

B12_0a09:		lda $8a1a, y	; b9 1a 8a
B12_0a0c:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B12_0a0f:		dec $0512		; ce 12 05
B12_0a12:		bne B12_0a19 ; d0 05

B12_0a14:		lda #$00		; a9 00
B12_0a16:		sta $0511		; 8d 11 05
B12_0a19:		rts				; 60 


B12_0a1a:		and $79			; 25 79
B12_0a1c:		ldy $e6			; a4 e6
B12_0a1e:		bit $79			; 24 79
B12_0a20:		ldy $e5			; a4 e5
B12_0a22:		lda wChosenCharacter.w		; ad 10 05
B12_0a25:		and #$03		; 29 03
B12_0a27:		beq B12_0a63 ; f0 3a

B12_0a29:		cmp #$01		; c9 01
B12_0a2b:		beq B12_0a9a ; f0 6d

B12_0a2d:		cmp #$02		; c9 02
B12_0a2f:		bne B12_0a34 ; d0 03

B12_0a31:		jmp $8ac9		; 4c c9 8a


B12_0a34:		lda #$00		; a9 00
B12_0a36:		sta $14			; 85 14
B12_0a38:		lda $0512		; ad 12 05
B12_0a3b:		cmp #$0c		; c9 0c
B12_0a3d:		bcs B12_0a51 ; b0 12

B12_0a3f:		lda $19			; a5 19
B12_0a41:		and #$02		; 29 02
B12_0a43:		bne B12_0a49 ; d0 04

B12_0a45:		lda #$10		; a9 10
B12_0a47:		bne B12_0a4b ; d0 02

B12_0a49:		lda #$f0		; a9 f0
B12_0a4b:		sta $14			; 85 14
B12_0a4d:		lda #$e7		; a9 e7
B12_0a4f:		bne B12_0a53 ; d0 02

B12_0a51:		lda #$e6		; a9 e6
B12_0a53:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B12_0a56:		dec $0512		; ce 12 05
B12_0a59:		bne B12_0a62 ; d0 07

B12_0a5b:		lda #$00		; a9 00
B12_0a5d:		sta $14			; 85 14
B12_0a5f:		sta $0511		; 8d 11 05
B12_0a62:		rts				; 60 


B12_0a63:		lda #$00		; a9 00
B12_0a65:		sta $14			; 85 14
B12_0a67:		lda $0512		; ad 12 05
B12_0a6a:		cmp #$10		; c9 10
B12_0a6c:		bcs B12_0a84 ; b0 16

B12_0a6e:		cmp #$0c		; c9 0c
B12_0a70:		bcs B12_0a88 ; b0 16

B12_0a72:		lda $19			; a5 19
B12_0a74:		and #$02		; 29 02
B12_0a76:		bne B12_0a7c ; d0 04

B12_0a78:		lda #$10		; a9 10
B12_0a7a:		bne B12_0a7e ; d0 02

B12_0a7c:		lda #$f0		; a9 f0
B12_0a7e:		sta $14			; 85 14
B12_0a80:		lda #$27		; a9 27
B12_0a82:		bne B12_0a8a ; d0 06

B12_0a84:		lda #$25		; a9 25
B12_0a86:		bne B12_0a8a ; d0 02

B12_0a88:		lda #$26		; a9 26
B12_0a8a:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B12_0a8d:		dec $0512		; ce 12 05
B12_0a90:		bne B12_0a99 ; d0 07

B12_0a92:		lda #$00		; a9 00
B12_0a94:		sta $14			; 85 14
B12_0a96:		sta $0511		; 8d 11 05
B12_0a99:		rts				; 60 


B12_0a9a:		lda #$00		; a9 00
B12_0a9c:		sta $14			; 85 14
B12_0a9e:		lda $0512		; ad 12 05
B12_0aa1:		cmp #$08		; c9 08
B12_0aa3:		bcs B12_0ab7 ; b0 12

B12_0aa5:		lda $19			; a5 19
B12_0aa7:		and #$02		; 29 02
B12_0aa9:		bne B12_0aaf ; d0 04

B12_0aab:		lda #$10		; a9 10
B12_0aad:		bne B12_0ab1 ; d0 02

B12_0aaf:		lda #$f0		; a9 f0
B12_0ab1:		sta $14			; 85 14
B12_0ab3:		lda #$7a		; a9 7a
B12_0ab5:		bne B12_0ab9 ; d0 02

B12_0ab7:		lda #$7b		; a9 7b
B12_0ab9:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B12_0abc:		dec $0512		; ce 12 05
B12_0abf:		bne B12_0ac8 ; d0 07

B12_0ac1:		lda #$00		; a9 00
B12_0ac3:		sta $14			; 85 14
B12_0ac5:		sta $0511		; 8d 11 05
B12_0ac8:		rts				; 60 


B12_0ac9:		lda $19			; a5 19
B12_0acb:		and #$02		; 29 02
B12_0acd:		bne B12_0ad3 ; d0 04

B12_0acf:		lda #$10		; a9 10
B12_0ad1:		bne B12_0ad5 ; d0 02

B12_0ad3:		lda #$f0		; a9 f0
B12_0ad5:		sta $14			; 85 14
B12_0ad7:		lda $0512		; ad 12 05
B12_0ada:		cmp #$0c		; c9 0c
B12_0adc:		bcs B12_0ae2 ; b0 04

B12_0ade:		lda #$a4		; a9 a4
B12_0ae0:		bne B12_0ae4 ; d0 02

B12_0ae2:		lda #$a5		; a9 a5
B12_0ae4:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B12_0ae7:		dec $0512		; ce 12 05
B12_0aea:		dec $0512		; ce 12 05
B12_0aed:		bne B12_0af6 ; d0 07

B12_0aef:		lda #$00		; a9 00
B12_0af1:		sta $14			; 85 14
B12_0af3:		sta $0511		; 8d 11 05
B12_0af6:		rts				; 60 


B12_0af7:		lda $1b			; a5 1b
B12_0af9:		and #$fd		; 29 fd
B12_0afb:		sta $1b			; 85 1b
B12_0afd:		lda wChosenCharacter.w		; ad 10 05
B12_0b00:		and #$03		; 29 03
B12_0b02:		tay				; a8 
B12_0b03:		lda $0512		; ad 12 05
B12_0b06:		cmp #$10		; c9 10
B12_0b08:		bcs B12_0b13 ; b0 09

B12_0b0a:		cmp #$08		; c9 08
B12_0b0c:		bcs B12_0b18 ; b0 0a

B12_0b0e:		lda $8b74, y	; b9 74 8b
B12_0b11:		bne B12_0b1b ; d0 08

B12_0b13:		lda $8b6c, y	; b9 6c 8b
B12_0b16:		bne B12_0b1b ; d0 03

B12_0b18:		lda $8b70, y	; b9 70 8b
B12_0b1b:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B12_0b1e:		dec $0512		; ce 12 05
B12_0b21:		bne B12_0b2f ; d0 0c

B12_0b23:		lda #$00		; a9 00
B12_0b25:		sta $0511		; 8d 11 05
B12_0b28:		sta $14			; 85 14
B12_0b2a:		lda #$43		; a9 43
B12_0b2c:		jmp unsetGlobalFlag		; 4c fc e7


B12_0b2f:		lda $0512		; ad 12 05
B12_0b32:		cmp #$08		; c9 08
B12_0b34:		bne B12_0b6b ; d0 35

B12_0b36:		lda $1b			; a5 1b
B12_0b38:		and #$01		; 29 01
B12_0b3a:		beq B12_0b6b ; f0 2f

B12_0b3c:		lda #$21		; a9 21
B12_0b3e:		jsr func_08fa		; 20 fa e8
B12_0b41:		lda $1b			; a5 1b
B12_0b43:		and #$fe		; 29 fe
B12_0b45:		sta $1b			; 85 1b
B12_0b47:		ldx $0517		; ae 17 05
B12_0b4a:		lda $19			; a5 19
B12_0b4c:		and #$02		; 29 02
B12_0b4e:		beq B12_0b54 ; f0 04

B12_0b50:		lda #$b8		; a9 b8
B12_0b52:		bne B12_0b56 ; d0 02

B12_0b54:		lda #$48		; a9 48
B12_0b56:		sta $0304, x	; 9d 04 03
B12_0b59:		lda #$e0		; a9 e0
B12_0b5b:		sta $0305, x	; 9d 05 03
B12_0b5e:		sta $030d, x	; 9d 0d 03
B12_0b61:		lda $030a, x	; bd 0a 03
B12_0b64:		and #$df		; 29 df
B12_0b66:		ora #$01		; 09 01
B12_0b68:		sta $030a, x	; 9d 0a 03
B12_0b6b:		rts				; 60 


B12_0b6c:		ora $8d4d		; 0d 4d 8d
B12_0b6f:		cmp $4e0e		; cd 0e 4e
B12_0b72:		stx $0fce		; 8e ce 0f
B12_0b75:	.db $4f
B12_0b76:	.db $8f
B12_0b77:	.db $cf
B12_0b78:		lda $1b			; a5 1b
B12_0b7a:		and #$fd		; 29 fd
B12_0b7c:		sta $1b			; 85 1b
B12_0b7e:		lda #$00		; a9 00
B12_0b80:		sta $14			; 85 14
B12_0b82:		lda #$37		; a9 37
B12_0b84:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B12_0b87:		lda #$00		; a9 00
B12_0b89:		sta $0511		; 8d 11 05
B12_0b8c:		ldx #$f0		; a2 f0
B12_0b8e:		lda $03f9		; ad f9 03
B12_0b91:		bne B12_0b96 ; d0 03

B12_0b93:		jmp $a21a		; 4c 1a a2


B12_0b96:		rts				; 60 


B12_0b97:		lda $1b			; a5 1b
B12_0b99:		and #$fd		; 29 fd
B12_0b9b:		sta $1b			; 85 1b
B12_0b9d:		lda wChosenCharacter.w		; ad 10 05
B12_0ba0:		and #$03		; 29 03
B12_0ba2:		tay				; a8 
B12_0ba3:		lda #$00		; a9 00
B12_0ba5:		sta $14			; 85 14
B12_0ba7:		lda $015a		; ad 5a 01
B12_0baa:		and #$08		; 29 08
B12_0bac:		bne B12_0bb3 ; d0 05

B12_0bae:		lda $8bbe, y	; b9 be 8b
B12_0bb1:		bne B12_0bb6 ; d0 03

B12_0bb3:		lda $8bc2, y	; b9 c2 8b
B12_0bb6:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B12_0bb9:		lda #$c0		; a9 c0
B12_0bbb:		jmp $8717		; 4c 17 87


B12_0bbe:		and ($60, x)	; 21 60
B12_0bc0:		lda ($da, x)	; a1 da
B12_0bc2:	.db $22
B12_0bc3:		adc ($a2, x)	; 61 a2
B12_0bc5:	.db $db
B12_0bc6:		lda $0512		; ad 12 05
B12_0bc9:		cmp #$08		; c9 08
B12_0bcb:		bne B12_0bd7 ; d0 0a

B12_0bcd:		lda #$d0		; a9 d0
B12_0bcf:		sta $15			; 85 15
B12_0bd1:		lda $1b			; a5 1b
B12_0bd3:		and #$fd		; 29 fd
B12_0bd5:		sta $1b			; 85 1b
B12_0bd7:		lda $19			; a5 19
B12_0bd9:		and #$02		; 29 02
B12_0bdb:		bne B12_0be1 ; d0 04

B12_0bdd:		lda #$08		; a9 08
B12_0bdf:		bne B12_0be3 ; d0 02

B12_0be1:		lda #$f8		; a9 f8
B12_0be3:		sta $14			; 85 14
B12_0be5:		lda wChosenCharacter.w		; ad 10 05
B12_0be8:		and #$03		; 29 03
B12_0bea:		tay				; a8 
B12_0beb:		lda $8c07, y	; b9 07 8c
B12_0bee:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B12_0bf1:		dec $0512		; ce 12 05
B12_0bf4:		bne B12_0c06 ; d0 10

B12_0bf6:		lda $1b			; a5 1b
B12_0bf8:		ora #$04		; 09 04
B12_0bfa:		sta $1b			; 85 1b
B12_0bfc:		lda #$00		; a9 00
B12_0bfe:		sta $0511		; 8d 11 05
B12_0c01:		lda #$3b		; a9 3b
B12_0c03:		jmp func_08fa		; 4c fa e8


B12_0c06:		rts				; 60 


B12_0c07:		plp				; 28 
B12_0c08:		adc #$b2		; 69 b2
B12_0c0a:		ora ($a5, x)	; 01 a5
B12_0c0c:	.db $1b
B12_0c0d:		and #$fd		; 29 fd
B12_0c0f:		sta $1b			; 85 1b
B12_0c11:		lda #$00		; a9 00
B12_0c13:		sta $14			; 85 14
B12_0c15:		lda $0512		; ad 12 05
B12_0c18:		lsr a			; 4a
B12_0c19:		lsr a			; 4a
B12_0c1a:		lsr a			; 4a
B12_0c1b:		tay				; a8 
B12_0c1c:		lda $8c40, y	; b9 40 8c
B12_0c1f:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B12_0c22:		dec $0512		; ce 12 05
B12_0c25:		bne B12_0c2f ; d0 08

B12_0c27:		lda #$00		; a9 00
B12_0c29:		sta $0511		; 8d 11 05
B12_0c2c:		sta $14			; 85 14
B12_0c2e:		rts				; 60 


B12_0c2f:		lda $0512		; ad 12 05
B12_0c32:		cmp #$10		; c9 10
B12_0c34:		bne B12_0c2e ; d0 f8

B12_0c36:		ldx #$f0		; a2 f0
B12_0c38:		lda $03f9		; ad f9 03
B12_0c3b:		bne B12_0c2e ; d0 f1

B12_0c3d:		jmp $a277		; 4c 77 a2


B12_0c40:		adc $74, x		; 75 74
B12_0c42:	.db $73
B12_0c43:	.db $72
B12_0c44:		rts				; 60 


B12_0c45:		rts				; 60 


B12_0c46:		lda $1b			; a5 1b
B12_0c48:		and #$fd		; 29 fd
B12_0c4a:		sta $1b			; 85 1b
B12_0c4c:		lda #$00		; a9 00
B12_0c4e:		sta $14			; 85 14
B12_0c50:		lda $0512		; ad 12 05
B12_0c53:		lsr a			; 4a
B12_0c54:		lsr a			; 4a
B12_0c55:		lsr a			; 4a
B12_0c56:		tay				; a8 
B12_0c57:		lda $8c75, y	; b9 75 8c
B12_0c5a:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B12_0c5d:		dec $0512		; ce 12 05
B12_0c60:		beq B12_0c63 ; f0 01

B12_0c62:		rts				; 60 


B12_0c63:		lda #$00		; a9 00
B12_0c65:		sta $0511		; 8d 11 05
B12_0c68:		sta $14			; 85 14
B12_0c6a:		ldx #$f0		; a2 f0
B12_0c6c:		lda $03f9		; ad f9 03
B12_0c6f:		bne B12_0c74 ; d0 03

B12_0c71:		jmp $a257		; 4c 57 a2


B12_0c74:		rts				; 60 


B12_0c75:	.db $af
B12_0c76:		ldx $acad		; ae ad ac
B12_0c79:		lda #$00		; a9 00
B12_0c7b:		sta $14			; 85 14
B12_0c7d:		sta $15			; 85 15
B12_0c7f:		lda wChosenCharacter.w		; ad 10 05
B12_0c82:		and #$03		; 29 03
B12_0c84:		tay				; a8 
B12_0c85:		lda $8ca2, y	; b9 a2 8c
B12_0c88:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B12_0c8b:		lda #$56		; a9 56
B12_0c8d:		jsr checkGlobalFlag		; 20 e9 e7
B12_0c90:		bne B12_0ca1 ; d0 0f

B12_0c92:		dec $0512		; ce 12 05
B12_0c95:		bne B12_0ca1 ; d0 0a

B12_0c97:		lda #$00		; a9 00
B12_0c99:		sta $0511		; 8d 11 05
B12_0c9c:		lda #$5f		; a9 5f
B12_0c9e:		jmp unsetGlobalFlag		; 4c fc e7


B12_0ca1:		rts				; 60 


B12_0ca2:	.db $3c
B12_0ca3:		sei				; 78 
B12_0ca4:		ldy $fa, x		; b4 fa
B12_0ca6:		lda $1b			; a5 1b
B12_0ca8:		and #$fd		; 29 fd
B12_0caa:		sta $1b			; 85 1b
B12_0cac:		lda #$00		; a9 00
B12_0cae:		sta $14			; 85 14
B12_0cb0:		sta $0511		; 8d 11 05
B12_0cb3:		ldx #$f0		; a2 f0
B12_0cb5:		lda $03f9		; ad f9 03
B12_0cb8:		bne B12_0cc2 ; d0 08

B12_0cba:		lda #$f5		; a9 f5
B12_0cbc:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B12_0cbf:		jmp $a32a		; 4c 2a a3


B12_0cc2:		rts				; 60 


B12_0cc3:		lda $1b			; a5 1b
B12_0cc5:		and #$fd		; 29 fd
B12_0cc7:		sta $1b			; 85 1b
B12_0cc9:		lda wChosenCharacter.w		; ad 10 05
B12_0ccc:		and #$03		; 29 03
B12_0cce:		tay				; a8 
B12_0ccf:		lda $8ce7, y	; b9 e7 8c
B12_0cd2:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B12_0cd5:		cpy #$01		; c0 01
B12_0cd7:		bne B12_0ce2 ; d0 09

B12_0cd9:		lda $15			; a5 15
B12_0cdb:		bmi B12_0ce2 ; 30 05

B12_0cdd:		lda #$c8		; a9 c8
B12_0cdf:		jmp $8717		; 4c 17 87


B12_0ce2:		lda #$c0		; a9 c0
B12_0ce4:		jmp $8717		; 4c 17 87


B12_0ce7:		ora $9965, x	; 1d 65 99
B12_0cea:	.db $e2
B12_0ceb:		lda wChosenCharacter.w		; ad 10 05
B12_0cee:		and #$03		; 29 03
B12_0cf0:		tay				; a8 
B12_0cf1:		lda $19			; a5 19
B12_0cf3:		and #$04		; 29 04
B12_0cf5:		bne B12_0cfc ; d0 05

B12_0cf7:		lda $8d03, y	; b9 03 8d
B12_0cfa:		bne B12_0cff ; d0 03

B12_0cfc:		lda $8d07, y	; b9 07 8d
B12_0cff:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B12_0d02:		rts				; 60 


B12_0d03:	.db $0c
B12_0d04:		jmp $cc8c		; 4c 8c cc


B12_0d07:	.db $0b
B12_0d08:	.db $4b
B12_0d09:	.db $8b
B12_0d0a:	.db $cb
B12_0d0b:		rts				; 60 


B12_0d0c:		lda #$00		; a9 00
B12_0d0e:		sta $14			; 85 14
B12_0d10:		lda $19			; a5 19
B12_0d12:		and #$ef		; 29 ef
B12_0d14:		sta $19			; 85 19
B12_0d16:		lda $0512		; ad 12 05
B12_0d19:		cmp #$40		; c9 40
B12_0d1b:		bcs B12_0d3f ; b0 22

B12_0d1d:		dec $0512		; ce 12 05
B12_0d20:		bne B12_0d35 ; d0 13

B12_0d22:		lda #$55		; a9 55
B12_0d24:		jsr unsetGlobalFlag		; 20 fc e7
B12_0d27:		lda #$00		; a9 00
B12_0d29:		sta $0511		; 8d 11 05
B12_0d2c:		pla				; 68 
B12_0d2d:		pla				; 68 
B12_0d2e:		pla				; 68 
B12_0d2f:		pla				; 68 
B12_0d30:		pla				; 68 
B12_0d31:		pla				; 68 
B12_0d32:		jmp $e02b		; 4c 2b e0


B12_0d35:		lda #$1d		; a9 1d
B12_0d37:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B12_0d3a:		lda #$40		; a9 40
B12_0d3c:		jmp $8717		; 4c 17 87


B12_0d3f:		dec $0512		; ce 12 05
B12_0d42:		lda #$1d		; a9 1d
B12_0d44:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B12_0d47:		rts				; 60 


B12_0d48:		lda $19			; a5 19
B12_0d4a:		and #$ef		; 29 ef
B12_0d4c:		sta $19			; 85 19
B12_0d4e:		lda $0512		; ad 12 05
B12_0d51:		cmp #$50		; c9 50
B12_0d53:		bcs B12_0d77 ; b0 22

B12_0d55:		cmp #$20		; c9 20
B12_0d57:		bcc B12_0d80 ; 90 27

B12_0d59:		sec				; 38 
B12_0d5a:		sbc #$20		; e9 20
B12_0d5c:		lsr a			; 4a
B12_0d5d:		lsr a			; 4a
B12_0d5e:		lsr a			; 4a
B12_0d5f:		tay				; a8 
B12_0d60:		lda $8d9d, y	; b9 9d 8d
B12_0d63:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B12_0d66:		dec $0512		; ce 12 05
B12_0d69:		lda $15			; a5 15
B12_0d6b:		bmi B12_0d72 ; 30 05

B12_0d6d:		lda #$48		; a9 48
B12_0d6f:		jmp $8717		; 4c 17 87


B12_0d72:		lda #$40		; a9 40
B12_0d74:		jmp $8717		; 4c 17 87


B12_0d77:		dec $0512		; ce 12 05
B12_0d7a:		lda #$46		; a9 46
B12_0d7c:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B12_0d7f:		rts				; 60 


B12_0d80:		dec $0512		; ce 12 05
B12_0d83:		bne B12_0d98 ; d0 13

B12_0d85:		lda #$55		; a9 55
B12_0d87:		jsr unsetGlobalFlag		; 20 fc e7
B12_0d8a:		lda #$00		; a9 00
B12_0d8c:		sta $0511		; 8d 11 05
B12_0d8f:		pla				; 68 
B12_0d90:		pla				; 68 
B12_0d91:		pla				; 68 
B12_0d92:		pla				; 68 
B12_0d93:		pla				; 68 
B12_0d94:		pla				; 68 
B12_0d95:		jmp $e02b		; 4c 2b e0


B12_0d98:		pla				; 68 
B12_0d99:		pla				; 68 
B12_0d9a:		jmp $8f7f		; 4c 7f 8f


B12_0d9d:	.db $5f
B12_0d9e:		lsr $5c5d, x	; 5e 5d 5c
B12_0da1:	.db $5b
B12_0da2:		lsr $a5			; 46 a5
B12_0da4:		ora $ef29, y	; 19 29 ef
B12_0da7:		sta $19			; 85 19
B12_0da9:		ldy #$04		; a0 04
B12_0dab:		lda $0512		; ad 12 05
B12_0dae:		cmp #$40		; c9 40
B12_0db0:		bcs B12_0dc1 ; b0 0f

B12_0db2:		cmp #$20		; c9 20
B12_0db4:		bcs B12_0dba ; b0 04

B12_0db6:		ldy #$00		; a0 00
B12_0db8:		beq B12_0dc1 ; f0 07

B12_0dba:		sec				; 38 
B12_0dbb:		sbc #$20		; e9 20
B12_0dbd:		lsr a			; 4a
B12_0dbe:		lsr a			; 4a
B12_0dbf:		lsr a			; 4a
B12_0dc0:		tay				; a8 
B12_0dc1:		lda $8de0, y	; b9 e0 8d
B12_0dc4:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B12_0dc7:		dec $0512		; ce 12 05
B12_0dca:		bne B12_0ddf ; d0 13

B12_0dcc:		lda #$55		; a9 55
B12_0dce:		jsr unsetGlobalFlag		; 20 fc e7
B12_0dd1:		lda #$00		; a9 00
B12_0dd3:		sta $0511		; 8d 11 05
B12_0dd6:		pla				; 68 
B12_0dd7:		pla				; 68 
B12_0dd8:		pla				; 68 
B12_0dd9:		pla				; 68 
B12_0dda:		pla				; 68 
B12_0ddb:		pla				; 68 
B12_0ddc:		jmp $e02b		; 4c 2b e0


B12_0ddf:		rts				; 60 


B12_0de0:	.db $9e
B12_0de1:		sta $9b9c, x	; 9d 9c 9b
B12_0de4:	.db $87
B12_0de5:		lda $19			; a5 19
B12_0de7:		and #$ef		; 29 ef
B12_0de9:		sta $19			; 85 19
B12_0deb:		ldy #$08		; a0 08
B12_0ded:		lda $0512		; ad 12 05
B12_0df0:		cmp #$3c		; c9 3c
B12_0df2:		bcs B12_0dfe ; b0 0a

B12_0df4:		cmp #$20		; c9 20
B12_0df6:		bcc B12_0e08 ; 90 10

B12_0df8:		sec				; 38 
B12_0df9:		sbc #$20		; e9 20
B12_0dfb:		lsr a			; 4a
B12_0dfc:		lsr a			; 4a
B12_0dfd:		tay				; a8 
B12_0dfe:		lda $8e25, y	; b9 25 8e
B12_0e01:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B12_0e04:		dec $0512		; ce 12 05
B12_0e07:		rts				; 60 


B12_0e08:		dec $0512		; ce 12 05
B12_0e0b:		bne B12_0e20 ; d0 13

B12_0e0d:		lda #$55		; a9 55
B12_0e0f:		jsr unsetGlobalFlag		; 20 fc e7
B12_0e12:		lda #$00		; a9 00
B12_0e14:		sta $0511		; 8d 11 05
B12_0e17:		pla				; 68 
B12_0e18:		pla				; 68 
B12_0e19:		pla				; 68 
B12_0e1a:		pla				; 68 
B12_0e1b:		pla				; 68 
B12_0e1c:		pla				; 68 
B12_0e1d:		jmp $e02b		; 4c 2b e0


B12_0e20:		pla				; 68 
B12_0e21:		pla				; 68 
B12_0e22:		jmp $8f7f		; 4c 7f 8f


B12_0e25:		sbc ($e0, x)	; e1 e0
B12_0e27:	.db $df
B12_0e28:		dec $dddd, x	; de dd dd
B12_0e2b:	.db $dc
B12_0e2c:	.db $dc
B12_0e2d:		dec $cd			; c6 cd
B12_0e2f:		ora ($05), y	; 11 05
B12_0e31:		bne B12_0e38 ; d0 05

B12_0e33:		cmp #$02		; c9 02
B12_0e35:		beq B12_0e38 ; f0 01

B12_0e37:		rts				; 60 


B12_0e38:		sta $0f			; 85 0f
B12_0e3a:		sec				; 38 
B12_0e3b:		sbc #$01		; e9 01
B12_0e3d:		tay				; a8 
B12_0e3e:		lda $8e87, y	; b9 87 8e
B12_0e41:		sta $0e			; 85 0e
B12_0e43:		lda $0511		; ad 11 05
B12_0e46:		bne B12_0e53 ; d0 0b

B12_0e48:		lda $0f			; a5 0f
B12_0e4a:		sta $0511		; 8d 11 05
B12_0e4d:		lda $0e			; a5 0e
B12_0e4f:		sta $0512		; 8d 12 05
B12_0e52:		rts				; 60 


B12_0e53:		sec				; 38 
B12_0e54:		sbc #$01		; e9 01
B12_0e56:		jsr jumpTable		; 20 a6 e6
	.dw $8ea9
	.dw $8eac
	.dw $8e9e
	.dw $8e9e
	.dw $8e9e
	.dw $8ec9
	.dw $8f11
	.dw $8f11
	.dw $8f08
	.dw $8f08
	.dw $8f11
	.dw $8ec9
	.dw $8ec9
	.dw $8f11
	.dw $8f11
	.dw $8f11
	.dw $8f08
	.dw $8f11
	.dw $8ec9
	.dw $8efc
	.dw $8ee6
	.dw $8f04
	.dw $8f04


B12_0e87:	.db $0c
B12_0e88:		php				; 08 
B12_0e89:		asl $04			; 06 04
B12_0e8b:	.db $04
B12_0e8c:		clc				; 18 
B12_0e8d:		clc				; 18 
B12_0e8e:		.db $00				; 00
B12_0e8f:		rti				; 40 


B12_0e90:		php				; 08 
B12_0e91:	.db $1f
B12_0e92:		php				; 08 
B12_0e93:		;removed
	.db $10 $1f

B12_0e95:		ldy #$1b		; a0 1b
B12_0e97:		.db $00				; 00
B12_0e98:		.db $00				; 00
B12_0e99:	.db $14
B12_0e9a:	.db $5f
B12_0e9b:	.db $6f
B12_0e9c:	.db $5f
B12_0e9d:	.db $5b
B12_0e9e:		lda $0f			; a5 0f
B12_0ea0:		sta $0511		; 8d 11 05
B12_0ea3:		lda $0e			; a5 0e
B12_0ea5:		sta $0512		; 8d 12 05
B12_0ea8:		rts				; 60 


B12_0ea9:		jmp $8e9e		; 4c 9e 8e


B12_0eac:		lda $0512		; ad 12 05
B12_0eaf:		cmp #$06		; c9 06
B12_0eb1:		bcc B12_0ec5 ; 90 12

B12_0eb3:		lda $19			; a5 19
B12_0eb5:		and #$02		; 29 02
B12_0eb7:		bne B12_0ebf ; d0 06

B12_0eb9:		lda $19			; a5 19
B12_0ebb:		ora #$02		; 09 02
B12_0ebd:		bne B12_0ec3 ; d0 04

B12_0ebf:		lda $19			; a5 19
B12_0ec1:		and #$fd		; 29 fd
B12_0ec3:		sta $19			; 85 19
B12_0ec5:		jmp $8e9e		; 4c 9e 8e


B12_0ec8:		rts				; 60 


B12_0ec9:		ldx $8ee0		; ae e0 8e
B12_0ecc:		lda $0f			; a5 0f
B12_0ece:		cmp $8ee1, x	; dd e1 8e
B12_0ed1:		beq B12_0ed7 ; f0 04

B12_0ed3:		dex				; ca 
B12_0ed4:		bpl B12_0ece ; 10 f8

B12_0ed6:		rts				; 60 


B12_0ed7:		lda $1b			; a5 1b
B12_0ed9:		and #$fd		; 29 fd
B12_0edb:		sta $1b			; 85 1b
B12_0edd:		jmp $8e9e		; 4c 9e 8e


B12_0ee0:		ora $03			; 05 03
B12_0ee2:		php				; 08 
B12_0ee3:	.db $0b
B12_0ee4:		asl $a510		; 0e 10 a5
B12_0ee7:		ora $0229, y	; 19 29 02
B12_0eea:		bne B12_0ef0 ; d0 04

B12_0eec:		lda #$e0		; a9 e0
B12_0eee:		bne B12_0ef2 ; d0 02

B12_0ef0:		lda #$20		; a9 20
B12_0ef2:		sta $14			; 85 14
B12_0ef4:		lda #$c4		; a9 c4
B12_0ef6:		sta $15			; 85 15
B12_0ef8:		jmp $8e9e		; 4c 9e 8e


B12_0efb:		rts				; 60 


B12_0efc:		lda #$c4		; a9 c4
B12_0efe:		sta $15			; 85 15
B12_0f00:		jmp $8e9e		; 4c 9e 8e


B12_0f03:		rts				; 60 


B12_0f04:		jmp $8e9e		; 4c 9e 8e


B12_0f07:		rts				; 60 


B12_0f08:		jsr $8f12		; 20 12 8f
B12_0f0b:		bne B12_0f10 ; d0 03

B12_0f0d:		jmp $8e9e		; 4c 9e 8e


B12_0f10:		rts				; 60 


B12_0f11:		rts				; 60 


B12_0f12:		lda $0f			; a5 0f
B12_0f14:		cmp #$14		; c9 14
B12_0f16:		beq B12_0f22 ; f0 0a

B12_0f18:		cmp #$15		; c9 15
B12_0f1a:		beq B12_0f22 ; f0 06

B12_0f1c:		cmp #$16		; c9 16
B12_0f1e:		beq B12_0f22 ; f0 02

B12_0f20:		cmp #$17		; c9 17
B12_0f22:		rts				; 60 


B12_0f23:		lda wChosenCharacter.w		; ad 10 05
B12_0f26:		ora #$80		; 09 80
B12_0f28:		sta wChosenCharacter.w		; 8d 10 05
B12_0f2b:		lda $0500		; ad 00 05
B12_0f2e:		sta $10			; 85 10
B12_0f30:		lda $0501		; ad 01 05
B12_0f33:		sta $11			; 85 11
B12_0f35:		lda $0502		; ad 02 05
B12_0f38:		sta $12			; 85 12
B12_0f3a:		lda $0503		; ad 03 05
B12_0f3d:		sta $13			; 85 13
B12_0f3f:		lda $0504		; ad 04 05
B12_0f42:		sta $14			; 85 14
B12_0f44:		lda $0505		; ad 05 05
B12_0f47:		sta $15			; 85 15
B12_0f49:		lda $0506		; ad 06 05
B12_0f4c:		sta $16			; 85 16
B12_0f4e:		lda $0507		; ad 07 05
B12_0f51:		sta $17			; 85 17
B12_0f53:		lda $0508		; ad 08 05
B12_0f56:		sta $18			; 85 18
B12_0f58:		lda $0509		; ad 09 05
B12_0f5b:		sta $19			; 85 19
B12_0f5d:		lda $050a		; ad 0a 05
B12_0f60:		sta $1a			; 85 1a
B12_0f62:		sta $051d		; 8d 1d 05
B12_0f65:		lda $050b		; ad 0b 05
B12_0f68:		sta $1b			; 85 1b
B12_0f6a:		lda $050c		; ad 0c 05
B12_0f6d:		sta $1c			; 85 1c
B12_0f6f:		lda $050d		; ad 0d 05
B12_0f72:		sta $1d			; 85 1d
B12_0f74:		lda $050e		; ad 0e 05
B12_0f77:		sta $1e			; 85 1e
B12_0f79:		lda $050f		; ad 0f 05
B12_0f7c:		sta $1f			; 85 1f
B12_0f7e:		rts				; 60 


B12_0f7f:		lda wChosenCharacter.w		; ad 10 05
B12_0f82:		and #$7f		; 29 7f
B12_0f84:		sta wChosenCharacter.w		; 8d 10 05
B12_0f87:		lda $10			; a5 10
B12_0f89:		sta $0500		; 8d 00 05
B12_0f8c:		lda $11			; a5 11
B12_0f8e:		sta $0501		; 8d 01 05
B12_0f91:		lda $12			; a5 12
B12_0f93:		sta $0502		; 8d 02 05
B12_0f96:		lda $13			; a5 13
B12_0f98:		sta $0503		; 8d 03 05
B12_0f9b:		lda $14			; a5 14
B12_0f9d:		sta $0504		; 8d 04 05
B12_0fa0:		lda $15			; a5 15
B12_0fa2:		sta $0505		; 8d 05 05
B12_0fa5:		lda $16			; a5 16
B12_0fa7:		sta $0506		; 8d 06 05
B12_0faa:		lda $17			; a5 17
B12_0fac:		sta $0507		; 8d 07 05
B12_0faf:		lda $18			; a5 18
B12_0fb1:		sta $0508		; 8d 08 05
B12_0fb4:		lda $19			; a5 19
B12_0fb6:		sta $0509		; 8d 09 05
B12_0fb9:		lda $1a			; a5 1a
B12_0fbb:		sta $050a		; 8d 0a 05
B12_0fbe:		lda $1b			; a5 1b
B12_0fc0:		sta $050b		; 8d 0b 05
B12_0fc3:		lda $1c			; a5 1c
B12_0fc5:		sta $050c		; 8d 0c 05
B12_0fc8:		lda $1d			; a5 1d
B12_0fca:		sta $050d		; 8d 0d 05
B12_0fcd:		lda $1e			; a5 1e
B12_0fcf:		sta $050e		; 8d 0e 05
B12_0fd2:		lda $1f			; a5 1f
B12_0fd4:		sta $050f		; 8d 0f 05
B12_0fd7:		rts				; 60 


B12_0fd8:		lda $0519		; ad 19 05
B12_0fdb:		beq B12_101d ; f0 40

B12_0fdd:		sta $00			; 85 00
B12_0fdf:		lda wPlayerHealth.w		; ad e5 04
B12_0fe2:		jsr func_0872		; 20 72 e8
B12_0fe5:		sta wPlayerHealth.w		; 8d e5 04
B12_0fe8:		lda $0519		; ad 19 05
B12_0feb:		bmi B12_1023 ; 30 36

B12_0fed:		bcc B12_101d ; 90 2e

B12_0fef:		ldy #$04		; a0 04
B12_0ff1:		lda #$00		; a9 00
B12_0ff3:		sta $00			; 85 00
B12_0ff5:		lda wHCsGotten.w		; ad e2 04
B12_0ff8:		lsr a			; 4a
B12_0ff9:		bcc B12_0ffd ; 90 02

B12_0ffb:		inc $00			; e6 00
B12_0ffd:		dey				; 88 
B12_0ffe:		bne B12_0ff8 ; d0 f8

B12_1000:		inc wFilledHeartContainers.w		; ee e3 04
B12_1003:		lda wFilledHeartContainers.w		; ad e3 04
B12_1006:		and #$07		; 29 07
B12_1008:		cmp $00			; c5 00
B12_100a:		bcc B12_101d ; 90 11

B12_100c:		beq B12_101d ; f0 0f

B12_100e:		lda wFilledHeartContainers.w		; ad e3 04
B12_1011:		and #$f8		; 29 f8
B12_1013:		ora $00			; 05 00
B12_1015:		sta wFilledHeartContainers.w		; 8d e3 04
B12_1018:		lda #$49		; a9 49
B12_101a:		sta wPlayerHealth.w		; 8d e5 04
B12_101d:		lda #$00		; a9 00
B12_101f:		sta $0519		; 8d 19 05
B12_1022:		rts				; 60 


B12_1023:		bcc B12_101d ; 90 f8

B12_1025:		lda wFilledHeartContainers.w		; ad e3 04
B12_1028:		and #$07		; 29 07
B12_102a:		beq B12_1032 ; f0 06

B12_102c:		dec wFilledHeartContainers.w		; ce e3 04
B12_102f:		jmp $901d		; 4c 1d 90


B12_1032:		lda #$00		; a9 00
B12_1034:		sta wPlayerHealth.w		; 8d e5 04
B12_1037:		lda #$55		; a9 55
B12_1039:		jsr setGlobalFlag		; 20 f0 e7
B12_103c:		lda wChosenCharacter.w		; ad 10 05
B12_103f:		and #$03		; 29 03
B12_1041:		tay				; a8 
B12_1042:		lda $9057, y	; b9 57 90
B12_1045:		jsr $8e2e		; 20 2e 8e
B12_1048:		lda #$00		; a9 00
B12_104a:		sta $4b			; 85 4b
B12_104c:		sta $4c			; 85 4c
B12_104e:		sta $051a		; 8d 1a 05
B12_1051:		sta $051c		; 8d 1c 05
B12_1054:		jmp $901d		; 4c 1d 90


B12_1057:	.db $14
B12_1058:		ora $16, x		; 15 16
B12_105a:	.db $17
B12_105b:		lda #$42		; a9 42
B12_105d:		jsr checkGlobalFlag		; 20 e9 e7
B12_1060:		beq B12_1063 ; f0 01

B12_1062:		rts				; 60 


B12_1063:		lda #$5b		; a9 5b
B12_1065:		jsr checkGlobalFlag		; 20 e9 e7
B12_1068:		beq B12_106d ; f0 03

B12_106a:		jmp $9140		; 4c 40 91


B12_106d:		ldy #$04		; a0 04
B12_106f:		ldx #$00		; a2 00
B12_1071:		lda wHCsGotten.w		; ad e2 04
B12_1074:		lsr a			; 4a
B12_1075:		bcc B12_1078 ; 90 01

B12_1077:		inx				; e8 
B12_1078:		dey				; 88 
B12_1079:		bne B12_1074 ; d0 f9

B12_107b:		stx $00			; 86 00
B12_107d:		lda wFilledHeartContainers.w		; ad e3 04
B12_1080:		and #$07		; 29 07
B12_1082:		cmp #$04		; c9 04
B12_1084:		bcc B12_1088 ; 90 02

B12_1086:		lda #$04		; a9 04
B12_1088:		cmp $00			; c5 00
B12_108a:		bcs B12_1096 ; b0 0a

B12_108c:		sta $01			; 85 01
B12_108e:		lda $00			; a5 00
B12_1090:		sec				; 38 
B12_1091:		sbc $01			; e5 01
B12_1093:		jmp $909a		; 4c 9a 90


B12_1096:		sta $01			; 85 01
B12_1098:		lda #$00		; a9 00
B12_109a:		sta $00			; 85 00
B12_109c:		ldy wNextUsableOamIdx.w		; ac 58 01
B12_109f:		lda #$20		; a9 20
B12_10a1:		sta $02			; 85 02
B12_10a3:		lda #$0c		; a9 0c
B12_10a5:		sta $03			; 85 03
B12_10a7:		lda $01			; a5 01
B12_10a9:		beq B12_10b4 ; f0 09

B12_10ab:		lda #$21		; a9 21
B12_10ad:		jsr $9123		; 20 23 91
B12_10b0:		dec $01			; c6 01
B12_10b2:		bne B12_10ab ; d0 f7

B12_10b4:		lda $00			; a5 00
B12_10b6:		beq B12_10c1 ; f0 09

B12_10b8:		lda #$31		; a9 31
B12_10ba:		jsr $9123		; 20 23 91
B12_10bd:		dec $00			; c6 00
B12_10bf:		bne B12_10b8 ; d0 f7

B12_10c1:		sty wNextUsableOamIdx.w		; 8c 58 01
B12_10c4:		lda #$00		; a9 00
B12_10c6:		sta $19			; 85 19
B12_10c8:		sta $015d		; 8d 5d 01
B12_10cb:		lda #$1c		; a9 1c
B12_10cd:		sta $16			; 85 16
B12_10cf:		lda #$1c		; a9 1c
B12_10d1:		sta $17			; 85 17
B12_10d3:		lda #$b5		; a9 b5
B12_10d5:		jsr func_1596		; 20 96 f5
B12_10d8:		lda wPlayerHealth.w		; ad e5 04
B12_10db:		sta $00			; 85 00
B12_10dd:		ldy wNextUsableOamIdx.w		; ac 58 01
B12_10e0:		lda #$30		; a9 30
B12_10e2:		sta $0203, y	; 99 03 02
B12_10e5:		lda #$38		; a9 38
B12_10e7:		sta $0207, y	; 99 07 02
B12_10ea:		lda #$1c		; a9 1c
B12_10ec:		sta $0200, y	; 99 00 02
B12_10ef:		sta $0204, y	; 99 04 02
B12_10f2:		lda #$00		; a9 00
B12_10f4:		sta $0202, y	; 99 02 02
B12_10f7:		sta $0206, y	; 99 06 02
B12_10fa:		lda $00			; a5 00
B12_10fc:		and #$f0		; 29 f0
B12_10fe:		lsr a			; 4a
B12_10ff:		lsr a			; 4a
B12_1100:		lsr a			; 4a
B12_1101:		ora #$01		; 09 01
B12_1103:		sta $0201, y	; 99 01 02
B12_1106:		lda $00			; a5 00
B12_1108:		and #$0f		; 29 0f
B12_110a:		asl a			; 0a
B12_110b:		ora #$01		; 09 01
B12_110d:		sta $0205, y	; 99 05 02
B12_1110:		tya				; 98 
B12_1111:		clc				; 18 
B12_1112:		adc #$08		; 69 08
B12_1114:		sta wNextUsableOamIdx.w		; 8d 58 01
B12_1117:		sta $0165		; 8d 65 01
B12_111a:		rts				; 60 


B12_111b:		sta $0201, y	; 99 01 02
B12_111e:		lda $04			; a5 04
B12_1120:		jmp $9128		; 4c 28 91


B12_1123:		sta $0201, y	; 99 01 02
B12_1126:		lda #$00		; a9 00
B12_1128:		sta $0202, y	; 99 02 02
B12_112b:		lda $03			; a5 03
B12_112d:		sta $0200, y	; 99 00 02
B12_1130:		lda $02			; a5 02
B12_1132:		sta $0203, y	; 99 03 02
B12_1135:		clc				; 18 
B12_1136:		adc #$08		; 69 08
B12_1138:		sta $02			; 85 02
B12_113a:		tya				; 98 
B12_113b:		clc				; 18 
B12_113c:		adc #$04		; 69 04
B12_113e:		tay				; a8 
B12_113f:		rts				; 60 


B12_1140:		ldy wNextUsableOamIdx.w		; ac 58 01
B12_1143:		lda #$20		; a9 20
B12_1145:		sta $02			; 85 02
B12_1147:		lda #$0c		; a9 0c
B12_1149:		sta $03			; 85 03
B12_114b:		lda $2c			; a5 2c
B12_114d:		and #$0f		; 29 0f
B12_114f:		sta $00			; 85 00
B12_1151:		lda $2c			; a5 2c
B12_1153:		lsr a			; 4a
B12_1154:		lsr a			; 4a
B12_1155:		lsr a			; 4a
B12_1156:		lsr a			; 4a
B12_1157:		sec				; 38 
B12_1158:		sbc $00			; e5 00
B12_115a:		sta $01			; 85 01
B12_115c:		lda #$00		; a9 00
B12_115e:		sta $04			; 85 04
B12_1160:		jsr $918a		; 20 8a 91
B12_1163:		lda #$a0		; a9 a0
B12_1165:		sta $02			; 85 02
B12_1167:		lda #$18		; a9 18
B12_1169:		sta $03			; 85 03
B12_116b:		lda $2d			; a5 2d
B12_116d:		and #$0f		; 29 0f
B12_116f:		sta $00			; 85 00
B12_1171:		lda $2d			; a5 2d
B12_1173:		lsr a			; 4a
B12_1174:		lsr a			; 4a
B12_1175:		lsr a			; 4a
B12_1176:		lsr a			; 4a
B12_1177:		sec				; 38 
B12_1178:		sbc $00			; e5 00
B12_117a:		sta $01			; 85 01
B12_117c:		lda #$03		; a9 03
B12_117e:		sta $04			; 85 04
B12_1180:		jsr $918a		; 20 8a 91
B12_1183:		sty wNextUsableOamIdx.w		; 8c 58 01
B12_1186:		sty $0165		; 8c 65 01
B12_1189:		rts				; 60 


B12_118a:		lda $00			; a5 00
B12_118c:		beq B12_1197 ; f0 09

B12_118e:		lda #$21		; a9 21
B12_1190:		jsr $911b		; 20 1b 91
B12_1193:		dec $00			; c6 00
B12_1195:		bne B12_118e ; d0 f7

B12_1197:		lda $01			; a5 01
B12_1199:		beq B12_11a4 ; f0 09

B12_119b:		lda #$31		; a9 31
B12_119d:		jsr $911b		; 20 1b 91
B12_11a0:		dec $01			; c6 01
B12_11a2:		bne B12_119b ; d0 f7

B12_11a4:		rts				; 60 


B12_11a5:		ldy $0165		; ac 65 01
B12_11a8:		lda #$f8		; a9 f8
B12_11aa:		dey				; 88 
B12_11ab:		dey				; 88 
B12_11ac:		dey				; 88 
B12_11ad:		dey				; 88 
B12_11ae:		sta $0200, y	; 99 00 02
B12_11b1:		bne B12_11aa ; d0 f7

B12_11b3:		rts				; 60 


func_c_11b4:
B12_11b4:		lda #$5e		; a9 5e
B12_11b6:		jsr checkGlobalFlag		; 20 e9 e7
B12_11b9:		bne B12_11ca ; d0 0f

B12_11bb:		lda $015a		; ad 5a 01
B12_11be:		lsr a			; 4a
B12_11bf:		lsr a			; 4a
B12_11c0:		lsr a			; 4a
B12_11c1:		and #$03		; 29 03
B12_11c3:		tay				; a8 
B12_11c4:		lda $9204, y	; b9 04 92
B12_11c7:		sta wShadow2KBChrBank1.w		; 8d 6a 01
B12_11ca:		lda $4f			; a5 4f
B12_11cc:		;removed
	.db $10 $35

B12_11ce:		and #$7f		; 29 7f
B12_11d0:		jsr jumpTable		; 20 a6 e6
	.dw $9208
	.dw $9221
	.dw $922c
	.dw $9271
	.dw $9257
	.dw $92a2
	.dw $92b5
	.dw $92d9
	.dw $92ec
	.dw $92f7
	.dw $9310
	.dw $9342
	.dw $9363
	.dw $937d
	.dw $9208
	.dw $93a3
	.dw $93ae
	.dw $93f3
	.dw $93d9
	.dw $941e
	.dw $9431
	.dw $944c
	.dw $9463
	.dw $947a
B12_1203:		rts				; 60
B12_1204:		rol $24			; 26 24
B12_1206:	.db $22
B12_1207:		.db $20

B12_1208:		ldx $0507
B12_120b:		cpx #$d8
B12_120d:		bcc B12_1220 ; 90 11

B12_120f:		lda $050a		; ad 0a 05
B12_1212:		and #$bf		; 29 bf
B12_1214:		sta $050a		; 8d 0a 05
B12_1217:		ldy #$01		; a0 01
B12_1219:		ldx #$88		; a2 88
B12_121b:		lda #$01		; a9 01
B12_121d:		jmp $9445		; 4c 45 94


B12_1220:		rts				; 60 


B12_1221:		lda #$c0		; a9 c0
B12_1223:		sta $00			; 85 00
B12_1225:		lda #$30		; a9 30
B12_1227:		sta $01			; 85 01
B12_1229:		jmp $94fa		; 4c fa 94


B12_122c:		lda #$0d		; a9 0d
B12_122e:		jsr checkGlobalFlag		; 20 e9 e7
B12_1231:		beq B12_1252 ; f0 1f

B12_1233:		lda #$48		; a9 48
B12_1235:		jsr checkGlobalFlag		; 20 e9 e7
B12_1238:		beq B12_1256 ; f0 1c

B12_123a:		lda $99			; a5 99
B12_123c:		cmp #$01		; c9 01
B12_123e:		bne B12_1252 ; d0 12

B12_1240:		lda #$c0		; a9 c0
B12_1242:		sta $9a			; 85 9a
B12_1244:		lda #$b0		; a9 b0
B12_1246:		sta $00			; 85 00
B12_1248:		lda #$30		; a9 30
B12_124a:		sta $01			; 85 01
B12_124c:		jsr $94fa		; 20 fa 94
B12_124f:		jmp $9549		; 4c 49 95


B12_1252:		lda #$00		; a9 00
B12_1254:		sta $4f			; 85 4f
B12_1256:		rts				; 60 


B12_1257:		lda #$48		; a9 48
B12_1259:		jsr checkGlobalFlag		; 20 e9 e7
B12_125c:		bne B12_1270 ; d0 12

B12_125e:		lda #$30		; a9 30
B12_1260:		sta $00			; 85 00
B12_1262:		lda #$30		; a9 30
B12_1264:		sta $01			; 85 01
B12_1266:		jsr $94fa		; 20 fa 94
B12_1269:		jsr $9549		; 20 49 95
B12_126c:		lda #$82		; a9 82
B12_126e:		sta $4f			; 85 4f
B12_1270:		rts				; 60 


B12_1271:		lda #$0d		; a9 0d
B12_1273:		jsr checkGlobalFlag		; 20 e9 e7
B12_1276:		beq B12_129d ; f0 25

B12_1278:		lda #$48		; a9 48
B12_127a:		jsr checkGlobalFlag		; 20 e9 e7
B12_127d:		beq B12_12a1 ; f0 22

B12_127f:		lda $99			; a5 99
B12_1281:		cmp #$02		; c9 02
B12_1283:		bne B12_129d ; d0 18

B12_1285:		lda $30			; a5 30
B12_1287:		cmp #$50		; c9 50
B12_1289:		bne B12_129d ; d0 12

B12_128b:		lda #$c0		; a9 c0
B12_128d:		sta $9a			; 85 9a
B12_128f:		lda #$d0		; a9 d0
B12_1291:		sta $00			; 85 00
B12_1293:		lda #$30		; a9 30
B12_1295:		sta $01			; 85 01
B12_1297:		jsr $94fa		; 20 fa 94
B12_129a:		jmp $9549		; 4c 49 95


B12_129d:		lda #$00		; a9 00
B12_129f:		sta $4f			; 85 4f
B12_12a1:		rts				; 60 


B12_12a2:		lda #$50		; a9 50
B12_12a4:		sta $00			; 85 00
B12_12a6:		lda #$30		; a9 30
B12_12a8:		sta $01			; 85 01
B12_12aa:		jsr $94fa		; 20 fa 94
B12_12ad:		jsr $9549		; 20 49 95
B12_12b0:		lda #$83		; a9 83
B12_12b2:		sta $4f			; 85 4f
B12_12b4:		rts				; 60 


B12_12b5:		lda #$48		; a9 48
B12_12b7:		jsr checkGlobalFlag		; 20 e9 e7
B12_12ba:		beq B12_12d8 ; f0 1c

B12_12bc:		lda $99			; a5 99
B12_12be:		cmp #$02		; c9 02
B12_12c0:		bne B12_12d4 ; d0 12

B12_12c2:		lda #$c0		; a9 c0
B12_12c4:		sta $9a			; 85 9a
B12_12c6:		lda #$d0		; a9 d0
B12_12c8:		sta $00			; 85 00
B12_12ca:		lda #$40		; a9 40
B12_12cc:		sta $01			; 85 01
B12_12ce:		jsr $94fa		; 20 fa 94
B12_12d1:		jmp $9549		; 4c 49 95


B12_12d4:		lda #$00		; a9 00
B12_12d6:		sta $4f			; 85 4f
B12_12d8:		rts				; 60 


B12_12d9:		lda #$50		; a9 50
B12_12db:		sta $00			; 85 00
B12_12dd:		lda #$40		; a9 40
B12_12df:		sta $01			; 85 01
B12_12e1:		jsr $94fa		; 20 fa 94
B12_12e4:		jsr $9549		; 20 49 95
B12_12e7:		lda #$86		; a9 86
B12_12e9:		sta $4f			; 85 4f
B12_12eb:		rts				; 60 


B12_12ec:		lda #$80		; a9 80
B12_12ee:		sta $00			; 85 00
B12_12f0:		lda #$00		; a9 00
B12_12f2:		sta $01			; 85 01
B12_12f4:		jmp $952b		; 4c 2b 95


B12_12f7:		ldx $0507		; ae 07 05
B12_12fa:		cpx #$d8		; e0 d8
B12_12fc:		bcc B12_130f ; 90 11

B12_12fe:		lda #$09		; a9 09
B12_1300:		sta wCurrRoomGroup.w		; 8d 62 01
B12_1303:		ldy #$01		; a0 01
B12_1305:		ldx #$28		; a2 28
B12_1307:		lda #$01		; a9 01
B12_1309:		jsr $9445		; 20 45 94
B12_130c:		jmp $df5b		; 4c 5b df


B12_130f:		rts				; 60 


B12_1310:		lda $0511		; ad 11 05
B12_1313:		cmp #$14		; c9 14
B12_1315:		beq B12_1341 ; f0 2a

B12_1317:		cmp #$15		; c9 15
B12_1319:		beq B12_1341 ; f0 26

B12_131b:		cmp #$16		; c9 16
B12_131d:		beq B12_1341 ; f0 22

B12_131f:		cmp #$17		; c9 17
B12_1321:		beq B12_1341 ; f0 1e

B12_1323:		ldx $0507		; ae 07 05
B12_1326:		cpx #$d8		; e0 d8
B12_1328:		bcc B12_1341 ; 90 17

B12_132a:		lda $0505		; ad 05 05
B12_132d:		bmi B12_1341 ; 30 12

B12_132f:		lda #$03		; a9 03
B12_1331:		sta wCurrRoomGroup.w		; 8d 62 01
B12_1334:		lda #$13		; a9 13
B12_1336:		sta $4f			; 85 4f
B12_1338:		ldy #$01		; a0 01
B12_133a:		ldx #$d6		; a2 d6
B12_133c:		lda #$a1		; a9 a1
B12_133e:		jmp $9445		; 4c 45 94


B12_1341:		rts				; 60 


B12_1342:		ldx $0507		; ae 07 05
B12_1345:		cpx #$18		; e0 18
B12_1347:		bcs B12_1362 ; b0 19

B12_1349:		lda $04ec		; ad ec 04
B12_134c:		and #$08		; 29 08
B12_134e:		beq B12_1362 ; f0 12

B12_1350:		lda #$00		; a9 00
B12_1352:		sta wCurrRoomGroup.w		; 8d 62 01
B12_1355:		lda #$12		; a9 12
B12_1357:		sta $4f			; 85 4f
B12_1359:		ldy #$01		; a0 01
B12_135b:		ldx #$46		; a2 46
B12_135d:		lda #$3d		; a9 3d
B12_135f:		jmp $9445		; 4c 45 94


B12_1362:		rts				; 60 


B12_1363:		ldx $0507		; ae 07 05
B12_1366:		cpx #$d8		; e0 d8
B12_1368:		bcc B12_137c ; 90 12

B12_136a:		lda $0505		; ad 05 05
B12_136d:		bmi B12_137c ; 30 0d

B12_136f:		lda #$15		; a9 15
B12_1371:		sta $4f			; 85 4f
B12_1373:		ldy #$01		; a0 01
B12_1375:		ldx #$36		; a2 36
B12_1377:		lda #$61		; a9 61
B12_1379:		jmp $9445		; 4c 45 94


B12_137c:		rts				; 60 


B12_137d:		ldx $0507		; ae 07 05
B12_1380:		cpx #$18		; e0 18
B12_1382:		bcs B12_13a2 ; b0 1e

B12_1384:		lda $04ec		; ad ec 04
B12_1387:		and #$08		; 29 08
B12_1389:		beq B12_13a2 ; f0 17

B12_138b:		lda #$14		; a9 14
B12_138d:		sta $4f			; 85 4f
B12_138f:		lda #$63		; a9 63
B12_1391:		jsr unsetGlobalFlag		; 20 fc e7
B12_1394:		lda #$88		; a9 88
B12_1396:		sta $0505		; 8d 05 05
B12_1399:		ldy #$01		; a0 01
B12_139b:		ldx #$36		; a2 36
B12_139d:		lda #$5d		; a9 5d
B12_139f:		jmp $9445		; 4c 45 94


B12_13a2:		rts				; 60 


B12_13a3:		lda #$b0		; a9 b0
B12_13a5:		sta $00			; 85 00
B12_13a7:		lda #$30		; a9 30
B12_13a9:		sta $01			; 85 01
B12_13ab:		jmp $94fa		; 4c fa 94


B12_13ae:		lda #$0e		; a9 0e
B12_13b0:		jsr checkGlobalFlag		; 20 e9 e7
B12_13b3:		beq B12_13d4 ; f0 1f

B12_13b5:		lda #$48		; a9 48
B12_13b7:		jsr checkGlobalFlag		; 20 e9 e7
B12_13ba:		beq B12_13d8 ; f0 1c

B12_13bc:		lda $99			; a5 99
B12_13be:		cmp #$01		; c9 01
B12_13c0:		bne B12_13d4 ; d0 12

B12_13c2:		lda #$b0		; a9 b0
B12_13c4:		sta $9a			; 85 9a
B12_13c6:		lda #$a0		; a9 a0
B12_13c8:		sta $00			; 85 00
B12_13ca:		lda #$30		; a9 30
B12_13cc:		sta $01			; 85 01
B12_13ce:		jsr $94fa		; 20 fa 94
B12_13d1:		jsr $9549		; 20 49 95
B12_13d4:		lda #$00		; a9 00
B12_13d6:		sta $4f			; 85 4f
B12_13d8:		rts				; 60 


B12_13d9:		lda #$48		; a9 48
B12_13db:		jsr checkGlobalFlag		; 20 e9 e7
B12_13de:		bne B12_13f2 ; d0 12

B12_13e0:		lda #$20		; a9 20
B12_13e2:		sta $00			; 85 00
B12_13e4:		lda #$30		; a9 30
B12_13e6:		sta $01			; 85 01
B12_13e8:		jsr $94fa		; 20 fa 94
B12_13eb:		jsr $9549		; 20 49 95
B12_13ee:		lda #$90		; a9 90
B12_13f0:		sta $4f			; 85 4f
B12_13f2:		rts				; 60 


B12_13f3:		lda #$0e		; a9 0e
B12_13f5:		jsr checkGlobalFlag		; 20 e9 e7
B12_13f8:		beq B12_1419 ; f0 1f

B12_13fa:		lda #$48		; a9 48
B12_13fc:		jsr checkGlobalFlag		; 20 e9 e7
B12_13ff:		beq B12_141d ; f0 1c

B12_1401:		lda $99			; a5 99
B12_1403:		cmp #$02		; c9 02
B12_1405:		bne B12_1419 ; d0 12

B12_1407:		lda #$b0		; a9 b0
B12_1409:		sta $9a			; 85 9a
B12_140b:		lda #$c0		; a9 c0
B12_140d:		sta $00			; 85 00
B12_140f:		lda #$30		; a9 30
B12_1411:		sta $01			; 85 01
B12_1413:		jsr $94fa		; 20 fa 94
B12_1416:		jmp $9549		; 4c 49 95


B12_1419:		lda #$00		; a9 00
B12_141b:		sta $4f			; 85 4f
B12_141d:		rts				; 60 


B12_141e:		lda #$40		; a9 40
B12_1420:		sta $00			; 85 00
B12_1422:		lda #$30		; a9 30
B12_1424:		sta $01			; 85 01
B12_1426:		jsr $94fa		; 20 fa 94
B12_1429:		jsr $9549		; 20 49 95
B12_142c:		lda #$91		; a9 91
B12_142e:		sta $4f			; 85 4f
B12_1430:		rts				; 60 


B12_1431:		ldx #$00		; a2 00
B12_1433:		stx $0501		; 8e 01 05
B12_1436:		stx $0503		; 8e 03 05
B12_1439:		stx $0504		; 8e 04 05
B12_143c:		stx $0505		; 8e 05 05
B12_143f:		ldy #$08		; a0 08
B12_1441:		ldx #$5d		; a2 5d
B12_1443:		lda #$0b		; a9 0b
B12_1445:		sty $c2			; 84 c2
B12_1447:		stx $c0			; 86 c0
B12_1449:		jmp $94c2		; 4c c2 94


B12_144c:		ldx #$00		; a2 00
B12_144e:		stx $0501		; 8e 01 05
B12_1451:		stx $0503		; 8e 03 05
B12_1454:		stx $0504		; 8e 04 05
B12_1457:		stx $0505		; 8e 05 05
B12_145a:		ldy #$08		; a0 08
B12_145c:		ldx #$2d		; a2 2d
B12_145e:		lda #$0b		; a9 0b
B12_1460:		jmp $9445		; 4c 45 94


B12_1463:		ldx #$00		; a2 00
B12_1465:		stx $0501		; 8e 01 05
B12_1468:		stx $0503		; 8e 03 05
B12_146b:		stx $0504		; 8e 04 05
B12_146e:		stx $0505		; 8e 05 05
B12_1471:		ldy #$08		; a0 08
B12_1473:		ldx #$b2		; a2 b2
B12_1475:		lda #$2b		; a9 2b
B12_1477:		jmp $9445		; 4c 45 94


B12_147a:		ldx $c3			; a6 c3
B12_147c:		lda wEntityStructs.id.w, x	; bd 08 04
B12_147f:		cmp #$15		; c9 15
B12_1481:		beq B12_1484 ; f0 01

B12_1483:		rts				; 60 


B12_1484:		lda #$08		; a9 08
B12_1486:		sta wEntityStructs.tileX.w, x	; 9d 00 04
B12_1489:		sta $0484		; 8d 84 04
B12_148c:		sta wEntityStructs.tileY.w, x	; 9d 02 04
B12_148f:		lda #$0a		; a9 0a
B12_1491:		sta $0485		; 8d 85 04
B12_1494:		lda #$07		; a9 07
B12_1496:		sta wCurrRoomGroup.w		; 8d 62 01
B12_1499:		lda #$31		; a9 31
B12_149b:		sta $01bd		; 8d bd 01
B12_149e:		lda #$22		; a9 22
B12_14a0:		sta $01be		; 8d be 01
B12_14a3:		lda #$0f		; a9 0f
B12_14a5:		sta $01bf		; 8d bf 01
B12_14a8:		ldy #$08		; a0 08
B12_14aa:		ldx #$08		; a2 08
B12_14ac:		lda #$0a		; a9 0a
B12_14ae:		jsr $9445		; 20 45 94
B12_14b1:		lda $050a		; ad 0a 05
B12_14b4:		ora #$20		; 09 20
B12_14b6:		sta $050a		; 8d 0a 05
B12_14b9:		lda $050b		; ad 0b 05
B12_14bc:		ora #$10		; 09 10
B12_14be:		sta $050b		; 8d 0b 05
B12_14c1:		rts				; 60 


B12_14c2:		sta $c1			; 85 c1
B12_14c4:		lda $c2			; a5 c2
B12_14c6:		jsr func_0578		; 20 78 e5
B12_14c9:		jsr $dfda		; 20 da df
B12_14cc:		jsr wOam_outOfYbounds		; 20 6a e5
B12_14cf:		lda $c0			; a5 c0
B12_14d1:		sta $0500		; 8d 00 05
B12_14d4:		and #$f0		; 29 f0
B12_14d6:		sta $30			; 85 30
B12_14d8:		lda $c1			; a5 c1
B12_14da:		sta $0502		; 8d 02 05
B12_14dd:		and #$f0		; 29 f0
B12_14df:		sta $32			; 85 32
B12_14e1:		lda #$00		; a9 00
B12_14e3:		sta $31			; 85 31
B12_14e5:		sta $33			; 85 33
B12_14e7:		sta $34			; 85 34
B12_14e9:		sta $35			; 85 35
B12_14eb:		jsr func_12fe		; 20 fe f2
B12_14ee:		jsr $dfc1		; 20 c1 df
B12_14f1:		jsr $dfcf		; 20 cf df
B12_14f4:		lda $c2			; a5 c2
B12_14f6:		jsr func_05cb		; 20 cb e5
B12_14f9:		rts				; 60 


B12_14fa:		lda $0500		; ad 00 05
B12_14fd:		and #$0f		; 29 0f
B12_14ff:		ora $00			; 05 00
B12_1501:		sta $0500		; 8d 00 05
B12_1504:		lda $0502		; ad 02 05
B12_1507:		and #$0f		; 29 0f
B12_1509:		ora $01			; 05 01
B12_150b:		tay				; a8 
B12_150c:		lda $30			; a5 30
B12_150e:		and #$0f		; 29 0f
B12_1510:		ora $00			; 05 00
B12_1512:		tax				; aa 
B12_1513:		lda $32			; a5 32
B12_1515:		and #$0f		; 29 0f
B12_1517:		ora $01			; 05 01
B12_1519:		sta $32			; 85 32
B12_151b:		stx $30			; 86 30
B12_151d:		sty $0502		; 8c 02 05
B12_1520:		lda #$00		; a9 00
B12_1522:		sta $34			; 85 34
B12_1524:		sta $35			; 85 35
B12_1526:		lda #$00		; a9 00
B12_1528:		sta $4f			; 85 4f
B12_152a:		rts				; 60 


B12_152b:		lda $0500		; ad 00 05
B12_152e:		clc				; 18 
B12_152f:		adc $00			; 65 00
B12_1531:		sta $0500		; 8d 00 05
B12_1534:		lda $0502		; ad 02 05
B12_1537:		clc				; 18 
B12_1538:		adc $01			; 65 01
B12_153a:		tay				; a8 
B12_153b:		lda $30			; a5 30
B12_153d:		clc				; 18 
B12_153e:		adc $00			; 65 00
B12_1540:		tax				; aa 
B12_1541:		lda $32			; a5 32
B12_1543:		clc				; 18 
B12_1544:		adc $01			; 65 01
B12_1546:		jmp $9519		; 4c 19 95


B12_1549:		ldx #$00		; a2 00
B12_154b:		lda $0309, x	; bd 09 03
B12_154e:		beq B12_1568 ; f0 18

B12_1550:		lda $0308, x	; bd 08 03
B12_1553:		cmp #$30		; c9 30
B12_1555:		beq B12_1577 ; f0 20

B12_1557:		cmp #$26		; c9 26
B12_1559:		beq B12_1570 ; f0 15

B12_155b:		lda $050b		; ad 0b 05
B12_155e:		and #$fe		; 29 fe
B12_1560:		sta $050b		; 8d 0b 05
B12_1563:		lda #$00		; a9 00
B12_1565:		sta $0309, x	; 9d 09 03
B12_1568:		txa				; 8a 
B12_1569:		clc				; 18 
B12_156a:		adc #$10		; 69 10
B12_156c:		tax				; aa 
B12_156d:		bne B12_154b ; d0 dc

B12_156f:		rts				; 60 


B12_1570:		lda $050b		; ad 0b 05
B12_1573:		and #$01		; 29 01
B12_1575:		beq B12_1563 ; f0 ec

B12_1577:		lda $0500		; ad 00 05
B12_157a:		sta $0300, x	; 9d 00 03
B12_157d:		lda $0502		; ad 02 05
B12_1580:		sta $0302, x	; 9d 02 03
B12_1583:		jmp $9568		; 4c 68 95


B12_1586:		lda $04eb		; ad eb 04
B12_1589:		and #$10		; 29 10
B12_158b:		bne B12_15a8 ; d0 1b

B12_158d:		jsr $988e		; 20 8e 98
B12_1590:		lda $1a			; a5 1a
B12_1592:		and #$09		; 29 09
B12_1594:		bne B12_15a0 ; d0 0a

B12_1596:		lda #$41		; a9 41
B12_1598:		jsr checkGlobalFlag		; 20 e9 e7
B12_159b:		bne B12_15a0 ; d0 03

B12_159d:		jsr $8607		; 20 07 86
B12_15a0:		lda #$49		; a9 49
B12_15a2:		jsr checkGlobalFlag		; 20 e9 e7
B12_15a5:		beq B12_15a8 ; f0 01

B12_15a7:		rts				; 60 


B12_15a8:		lda #$48		; a9 48
B12_15aa:		jsr checkGlobalFlag		; 20 e9 e7
B12_15ad:		beq B12_15b2 ; f0 03

B12_15af:		jmp $968d		; 4c 8d 96


B12_15b2:		lda wJoy1ButtonsPressed.w		; ad 50 01
B12_15b5:		and #$0f		; 29 0f
B12_15b7:		jsr jumpTable_retFollowing		; 20 bc e6
	.dw func_c_15dc
	.dw $8487
	.dw $96ae
	.dw $9791
	.dw $8487
	.dw $84ce
	.dw $9876
	.dw $987c
	.dw $8487
	.dw $857a
	.dw $9882
	.dw $9888
	.dw $8487
	.dw $8487
	.dw $8487
	.dw $8487
	.dw $8487


func_c_15dc:
	lda $1a
B12_15de:		and #$09		; 29 09
B12_15e0:		beq B12_15ef ; f0 0d

B12_15e2:		and #$08		; 29 08
B12_15e4:		beq B12_15ec ; f0 06

B12_15e6:		lda $19			; a5 19
B12_15e8:		and #$04		; 29 04
B12_15ea:		beq B12_15ef ; f0 03

B12_15ec:		jmp $9692		; 4c 92 96


B12_15ef:		lda #$41		; a9 41
B12_15f1:		jsr checkGlobalFlag		; 20 e9 e7
B12_15f4:		bne B12_1657 ; d0 61

B12_15f6:		lda $1a			; a5 1a
B12_15f8:		and #$20		; 29 20
B12_15fa:		beq B12_15ff ; f0 03

B12_15fc:		jmp $9680		; 4c 80 96


B12_15ff:		lda #$c0		; a9 c0
B12_1601:		jsr $8717		; 20 17 87
B12_1604:		lda #$46		; a9 46
B12_1606:		jsr checkGlobalFlag		; 20 e9 e7
B12_1609:		beq B12_1611 ; f0 06

B12_160b:		lda #$37		; a9 37
B12_160d:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B12_1610:		rts				; 60 


B12_1611:		bit $4a			; 24 4a
B12_1613:		bvc B12_164e ; 50 39

B12_1615:		lda wJoy1ButtonsPressed.w		; ad 50 01
B12_1618:		and #$03		; 29 03
B12_161a:		beq B12_164e ; f0 32

B12_161c:		lda #$04		; a9 04
B12_161e:		jsr checkGlobalFlag		; 20 e9 e7
B12_1621:		beq B12_164e ; f0 2b

B12_1623:		lda $15			; a5 15
B12_1625:		bmi B12_164e ; 30 27

B12_1627:		lda $19			; a5 19
B12_1629:		and #$02		; 29 02
B12_162b:		bne B12_1647 ; d0 1a

B12_162d:		lda wJoy1ButtonsPressed.w		; ad 50 01
B12_1630:		and #$01		; 29 01
B12_1632:		beq B12_164e ; f0 1a

B12_1634:		lda $19			; a5 19
B12_1636:		and #$04		; 29 04
B12_1638:		beq B12_164e ; f0 14

B12_163a:		lda #$00		; a9 00
B12_163c:		sta $14			; 85 14
B12_163e:		sta $15			; 85 15
B12_1640:		sta $20			; 85 20
B12_1642:		lda #$41		; a9 41
B12_1644:		jmp setGlobalFlag		; 4c f0 e7


B12_1647:		lda wJoy1ButtonsPressed.w		; ad 50 01
B12_164a:		and #$02		; 29 02
B12_164c:		bne B12_1634 ; d0 e6

B12_164e:		lda wPlayerOamDetailsIdx.w		; ad 1b 05
B12_1651:		bne B12_1656 ; d0 03

B12_1653:		jsr $98f6		; 20 f6 98
B12_1656:		rts				; 60 


B12_1657:		lda $15			; a5 15
B12_1659:		bmi B12_1664 ; 30 09

B12_165b:		lda #$33		; a9 33
B12_165d:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B12_1660:		lda #$c8		; a9 c8
B12_1662:		bne B12_1673 ; d0 0f

B12_1664:		lda $13			; a5 13
B12_1666:		bmi B12_166c ; 30 04

B12_1668:		lda #$34		; a9 34
B12_166a:		bne B12_166e ; d0 02

B12_166c:		lda #$35		; a9 35
B12_166e:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B12_1671:		lda #$c0		; a9 c0
B12_1673:		jsr $8717		; 20 17 87
B12_1676:		bit $4a			; 24 4a
B12_1678:		bvs B12_167f ; 70 05

B12_167a:		lda #$41		; a9 41
B12_167c:		jmp unsetGlobalFlag		; 4c fc e7


B12_167f:		rts				; 60 


B12_1680:		lda $13			; a5 13
B12_1682:		bpl B12_1688 ; 10 04

B12_1684:		lda #$17		; a9 17
B12_1686:		bne B12_168a ; d0 02

B12_1688:		lda #$18		; a9 18
B12_168a:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B12_168d:		lda #$80		; a9 80
B12_168f:		jmp $8717		; 4c 17 87


B12_1692:		lda $1b			; a5 1b
B12_1694:		and #$fd		; 29 fd
B12_1696:		sta $1b			; 85 1b
B12_1698:		jsr $87ff		; 20 ff 87
B12_169b:		lda $015a		; ad 5a 01
B12_169e:		lsr a			; 4a
B12_169f:		lsr a			; 4a
B12_16a0:		and #$03		; 29 03
B12_16a2:		tay				; a8 
B12_16a3:		lda $96aa, y	; b9 aa 96
B12_16a6:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B12_16a9:		rts				; 60 


B12_16aa:		rol a			; 2a
B12_16ab:	.db $2b
B12_16ac:		bit $a92b		; 2c 2b a9
B12_16af:		lsr $20			; 46 20
.ifdef ROM_JP
	sty $e8
.else
B12_16b1:		sbc #$e7		; e9 e7
.endif
B12_16b3:		beq B12_16b6 ; f0 01

B12_16b5:		rts				; 60 


B12_16b6:		lda $1b			; a5 1b
B12_16b8:		and #$04		; 29 04
B12_16ba:		beq B12_16bf ; f0 03

B12_16bc:		jmp $8865		; 4c 65 88


B12_16bf:		lda $1a			; a5 1a
B12_16c1:		and #$20		; 29 20
B12_16c3:		beq B12_16ca ; f0 05

B12_16c5:		lda #$00		; a9 00
B12_16c7:		sta $15			; 85 15
B12_16c9:		rts				; 60 


B12_16ca:		lda $1b			; a5 1b
B12_16cc:		and #$02		; 29 02
B12_16ce:		beq B12_16ed ; f0 1d

B12_16d0:		lda $19			; a5 19
B12_16d2:		and #$02		; 29 02
B12_16d4:		bne B12_16dc ; d0 06

B12_16d6:		lda #$06		; a9 06
B12_16d8:		jsr $8e2e		; 20 2e 8e
B12_16db:		rts				; 60 


B12_16dc:		lda $0511		; ad 11 05
B12_16df:		cmp #$02		; c9 02
B12_16e1:		beq B12_16db ; f0 f8

B12_16e3:		lda #$00		; a9 00
B12_16e5:		sta $14			; 85 14
B12_16e7:		lda #$02		; a9 02
B12_16e9:		jsr $8e2e		; 20 2e 8e
B12_16ec:		rts				; 60 


B12_16ed:		lda $19			; a5 19
B12_16ef:		and #$02		; 29 02
B12_16f1:		beq B12_172f ; f0 3c

B12_16f3:		lda #$41		; a9 41
B12_16f5:		jsr unsetGlobalFlag		; 20 fc e7
B12_16f8:		lda $19			; a5 19
B12_16fa:		and #$04		; 29 04
B12_16fc:		beq B12_1707 ; f0 09

B12_16fe:		lda $19			; a5 19
B12_1700:		and #$fd		; 29 fd
B12_1702:		sta $19			; 85 19
B12_1704:		jmp $972f		; 4c 2f 97


B12_1707:		lda $04ea		; ad ea 04
B12_170a:		and #$7f		; 29 7f
B12_170c:		sta $04ea		; 8d ea 04
B12_170f:		lda $14			; a5 14
B12_1711:		beq B12_1721 ; f0 0e

B12_1713:		bpl B12_1729 ; 10 14

B12_1715:		cmp #$f4		; c9 f4
B12_1717:		bcs B12_172f ; b0 16

B12_1719:		lda #$01		; a9 01
B12_171b:		jsr $8e2e		; 20 2e 8e
B12_171e:		jmp $972f		; 4c 2f 97


B12_1721:		lda #$02		; a9 02
B12_1723:		jsr $8e2e		; 20 2e 8e
B12_1726:		jmp $972f		; 4c 2f 97


B12_1729:		lda $1a			; a5 1a
B12_172b:		and #$02		; 29 02
B12_172d:		bne B12_1721 ; d0 f2

B12_172f:		lda wChosenCharacter.w		; ad 10 05
B12_1732:		and #$03		; 29 03
B12_1734:		asl a			; 0a
B12_1735:		asl a			; 0a
B12_1736:		sta $00			; 85 00
B12_1738:		lda $1a			; a5 1a
B12_173a:		and #$03		; 29 03
B12_173c:		ora $00			; 05 00
B12_173e:		tay				; a8 
B12_173f:		lda $14			; a5 14
B12_1741:		bmi B12_174e ; 30 0b

B12_1743:		cmp $9789, y	; d9 89 97
B12_1746:		bcc B12_174e ; 90 06

B12_1748:		lda $9789, y	; b9 89 97
B12_174b:		sta $14			; 85 14
B12_174d:		rts				; 60 


B12_174e:		lda $19			; a5 19
B12_1750:		and #$04		; 29 04
B12_1752:		bne B12_1762 ; d0 0e

B12_1754:		lda $1a			; a5 1a
B12_1756:		and #$02		; 29 02
B12_1758:		bne B12_1765 ; d0 0b

B12_175a:		lda #$01		; a9 01
B12_175c:		clc				; 18 
B12_175d:		adc $14			; 65 14
B12_175f:		sta $14			; 85 14
B12_1761:		rts				; 60 


B12_1762:		inc $14			; e6 14
B12_1764:		rts				; 60 


B12_1765:		lda $19			; a5 19
B12_1767:		and #$02		; 29 02
B12_1769:		beq B12_1772 ; f0 07

B12_176b:		lda $015a		; ad 5a 01
B12_176e:		and #$07		; 29 07
B12_1770:		bne B12_1788 ; d0 16

B12_1772:		lda $015a		; ad 5a 01
B12_1775:		and #$01		; 29 01
B12_1777:		bne B12_1788 ; d0 0f

B12_1779:		inc $14			; e6 14
B12_177b:		lda $14			; a5 14
B12_177d:		bmi B12_1788 ; 30 09

B12_177f:		cmp #$18		; c9 18
B12_1781:		bcc B12_1788 ; 90 05

B12_1783:		lda #$0a		; a9 0a
B12_1785:		jmp $8e2e		; 4c 2e 8e


B12_1788:		rts				; 60 


B12_1789:		clc				; 18 
B12_178a:	.db $04
B12_178b:		bmi B12_178d ; 30 00

B12_178d:		bpl B12_1793 ; 10 04

B12_178f:		bmi B12_1791 ; 30 00

B12_1791:		lda #$46		; a9 46
B12_1793:		jsr checkGlobalFlag		; 20 e9 e7
B12_1796:		beq B12_1799 ; f0 01

B12_1798:		rts				; 60 


B12_1799:		lda $1b			; a5 1b
B12_179b:		and #$04		; 29 04
B12_179d:		beq B12_17a2 ; f0 03

B12_179f:		jmp $8865		; 4c 65 88


B12_17a2:		lda $1a			; a5 1a
B12_17a4:		and #$20		; 29 20
B12_17a6:		beq B12_17ad ; f0 05

B12_17a8:		lda #$00		; a9 00
B12_17aa:		sta $15			; 85 15
B12_17ac:		rts				; 60 


B12_17ad:		lda $1b			; a5 1b
B12_17af:		and #$02		; 29 02
B12_17b1:		beq B12_17d0 ; f0 1d

B12_17b3:		lda $19			; a5 19
B12_17b5:		and #$02		; 29 02
B12_17b7:		beq B12_17bf ; f0 06

B12_17b9:		lda #$06		; a9 06
B12_17bb:		jsr $8e2e		; 20 2e 8e
B12_17be:		rts				; 60 


B12_17bf:		lda $0511		; ad 11 05
B12_17c2:		cmp #$02		; c9 02
B12_17c4:		beq B12_17be ; f0 f8

B12_17c6:		lda #$00		; a9 00
B12_17c8:		sta $14			; 85 14
B12_17ca:		lda #$02		; a9 02
B12_17cc:		jsr $8e2e		; 20 2e 8e
B12_17cf:		rts				; 60 


B12_17d0:		lda $19			; a5 19
B12_17d2:		and #$02		; 29 02
B12_17d4:		bne B12_1812 ; d0 3c

B12_17d6:		lda #$41		; a9 41
B12_17d8:		jsr unsetGlobalFlag		; 20 fc e7
B12_17db:		lda $19			; a5 19
B12_17dd:		and #$04		; 29 04
B12_17df:		beq B12_17ea ; f0 09

B12_17e1:		lda $19			; a5 19
B12_17e3:		ora #$02		; 09 02
B12_17e5:		sta $19			; 85 19
B12_17e7:		jmp $9812		; 4c 12 98


B12_17ea:		lda $04ea		; ad ea 04
B12_17ed:		and #$7f		; 29 7f
B12_17ef:		sta $04ea		; 8d ea 04
B12_17f2:		lda $14			; a5 14
B12_17f4:		beq B12_1804 ; f0 0e

B12_17f6:		bmi B12_180c ; 30 14

B12_17f8:		cmp #$0c		; c9 0c
B12_17fa:		bcc B12_1812 ; 90 16

B12_17fc:		lda #$01		; a9 01
B12_17fe:		jsr $8e2e		; 20 2e 8e
B12_1801:		jmp $9812		; 4c 12 98


B12_1804:		lda #$02		; a9 02
B12_1806:		jsr $8e2e		; 20 2e 8e
B12_1809:		jmp $9812		; 4c 12 98


B12_180c:		lda $1a			; a5 1a
B12_180e:		and #$02		; 29 02
B12_1810:		bne B12_1804 ; d0 f2

B12_1812:		lda wChosenCharacter.w		; ad 10 05
B12_1815:		and #$03		; 29 03
B12_1817:		asl a			; 0a
B12_1818:		asl a			; 0a
B12_1819:		sta $00			; 85 00
B12_181b:		lda $1a			; a5 1a
B12_181d:		and #$03		; 29 03
B12_181f:		ora $00			; 05 00
B12_1821:		tay				; a8 
B12_1822:		lda $14			; a5 14
B12_1824:		bpl B12_1833 ; 10 0d

B12_1826:		cmp $986e, y	; d9 6e 98
B12_1829:		beq B12_182d ; f0 02

B12_182b:		bcs B12_1833 ; b0 06

B12_182d:		lda $986e, y	; b9 6e 98
B12_1830:		sta $14			; 85 14
B12_1832:		rts				; 60 


B12_1833:		lda $19			; a5 19
B12_1835:		and #$04		; 29 04
B12_1837:		bne B12_1847 ; d0 0e

B12_1839:		lda $1a			; a5 1a
B12_183b:		and #$02		; 29 02
B12_183d:		bne B12_184a ; d0 0b

B12_183f:		lda #$ff		; a9 ff
B12_1841:		clc				; 18 
B12_1842:		adc $14			; 65 14
B12_1844:		sta $14			; 85 14
B12_1846:		rts				; 60 


B12_1847:		dec $14			; c6 14
B12_1849:		rts				; 60 


B12_184a:		lda $19			; a5 19
B12_184c:		and #$02		; 29 02
B12_184e:		bne B12_1857 ; d0 07

B12_1850:		lda $015a		; ad 5a 01
B12_1853:		and #$07		; 29 07
B12_1855:		bne B12_186d ; d0 16

B12_1857:		lda $015a		; ad 5a 01
B12_185a:		and #$01		; 29 01
B12_185c:		bne B12_186d ; d0 0f

B12_185e:		dec $14			; c6 14
B12_1860:		lda $14			; a5 14
B12_1862:		bpl B12_186d ; 10 09

B12_1864:		cmp #$e9		; c9 e9
B12_1866:		bcs B12_186d ; b0 05

B12_1868:		lda #$0a		; a9 0a
B12_186a:		jmp $8e2e		; 4c 2e 8e


B12_186d:		rts				; 60 


B12_186e:		inx				; e8 
B12_186f:	.db $fc
B12_1870:		bne B12_1872 ; d0 00

B12_1872:		beq B12_1870 ; f0 fc

B12_1874:		bne B12_1876 ; d0 00

B12_1876:		jsr $96ae		; 20 ae 96
B12_1879:		jmp $84ce		; 4c ce 84


B12_187c:		jsr $9791		; 20 91 97
B12_187f:		jmp $84ce		; 4c ce 84


B12_1882:		jsr $96ae		; 20 ae 96
B12_1885:		jmp $857a		; 4c 7a 85


B12_1888:		jsr $9791		; 20 91 97
B12_188b:		jmp $857a		; 4c 7a 85


B12_188e:		lda #$46		; a9 46
B12_1890:		jsr checkGlobalFlag		; 20 e9 e7
B12_1893:		beq B12_1896 ; f0 01

B12_1895:		rts				; 60 


B12_1896:		lda $1b			; a5 1b
B12_1898:		and #$04		; 29 04
B12_189a:		bne B12_18d1 ; d0 35

B12_189c:		lda $1a			; a5 1a
B12_189e:		and #$09		; 29 09
B12_18a0:		bne B12_18c2 ; d0 20

B12_18a2:		lda #$41		; a9 41
B12_18a4:		jsr checkGlobalFlag		; 20 e9 e7
B12_18a7:		bne B12_18d2 ; d0 29

B12_18a9:		lda $1a			; a5 1a
B12_18ab:		and #$02		; 29 02
B12_18ad:		bne B12_18b8 ; d0 09

B12_18af:		lda #$0b		; a9 0b
B12_18b1:		sta $01			; 85 01
B12_18b3:		lda #$cc		; a9 cc
B12_18b5:		jmp $8412		; 4c 12 84


B12_18b8:		lda wJoy1NewButtonsPressed.w		; ad 54 01
B12_18bb:		bpl B12_18d1 ; 10 14

B12_18bd:		lda #$0a		; a9 0a
B12_18bf:		jmp $8e2e		; 4c 2e 8e


B12_18c2:		lda $19			; a5 19
B12_18c4:		and #$04		; 29 04
B12_18c6:		bne B12_18d1 ; d0 09

B12_18c8:		lda #$0b		; a9 0b
B12_18ca:		sta $01			; 85 01
B12_18cc:		lda #$cc		; a9 cc
B12_18ce:		jmp $840a		; 4c 0a 84


B12_18d1:		rts				; 60 


B12_18d2:		lda $20			; a5 20
B12_18d4:		bne B12_18f3 ; d0 1d

B12_18d6:		lda wJoy1NewButtonsPressed.w		; ad 54 01
B12_18d9:		bpl B12_18f5 ; 10 1a

B12_18db:		lda #$d8		; a9 d8
B12_18dd:		clc				; 18 
B12_18de:		adc $15			; 65 15
B12_18e0:		bpl B12_18e8 ; 10 06

B12_18e2:		cmp #$d0		; c9 d0
B12_18e4:		bcs B12_18e8 ; b0 02

B12_18e6:		lda #$d0		; a9 d0
B12_18e8:		sta $15			; 85 15
B12_18ea:		lda #$02		; a9 02
B12_18ec:		sta $20			; 85 20
B12_18ee:		lda #$3c		; a9 3c
B12_18f0:		jmp func_08fa		; 4c fa e8


B12_18f3:		dec $20			; c6 20
B12_18f5:		rts				; 60 


B12_18f6:		lda $1b			; a5 1b
B12_18f8:		and #$04		; 29 04
B12_18fa:		bne B12_1955 ; d0 59

B12_18fc:		lda $19			; a5 19
B12_18fe:		and #$04		; 29 04
B12_1900:		bne B12_193a ; d0 38

B12_1902:		lda $1a			; a5 1a
B12_1904:		and #$02		; 29 02
B12_1906:		bne B12_1917 ; d0 0f

B12_1908:		lda $11			; a5 11
B12_190a:		sta $00			; 85 00
B12_190c:		lda $10			; a5 10
B12_190e:		asl $00			; 06 00
B12_1910:		rol a			; 2a
B12_1911:		asl $00			; 06 00
B12_1913:		rol a			; 2a
B12_1914:		jmp $9925		; 4c 25 99


B12_1917:		lda wJoy1ButtonsPressed.w		; ad 50 01
B12_191a:		and #$03		; 29 03
B12_191c:		bne B12_1921 ; d0 03

B12_191e:		jmp $88ba		; 4c ba 88


B12_1921:		lda $015a		; ad 5a 01
B12_1924:		lsr a			; 4a
B12_1925:		and #$07		; 29 07
B12_1927:		tay				; a8 
B12_1928:		lda $1b			; a5 1b
B12_192a:		and #$01		; 29 01
B12_192c:		beq B12_1933 ; f0 05

B12_192e:		tya				; 98 
B12_192f:		clc				; 18 
B12_1930:		adc #$08		; 69 08
B12_1932:		tay				; a8 
B12_1933:		lda $996c, y	; b9 6c 99
B12_1936:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B12_1939:		rts				; 60 


B12_193a:		lda $1b			; a5 1b
B12_193c:		and #$01		; 29 01
B12_193e:		bne B12_194f ; d0 0f

B12_1940:		lda $015a		; ad 5a 01
B12_1943:		and #$08		; 29 08
B12_1945:		bne B12_194b ; d0 04

B12_1947:		lda #$09		; a9 09
B12_1949:		bne B12_1951 ; d0 06

B12_194b:		lda #$0a		; a9 0a
B12_194d:		bne B12_1951 ; d0 02

B12_194f:		lda #$15		; a9 15
B12_1951:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B12_1954:		rts				; 60 


B12_1955:		lda $0511		; ad 11 05
B12_1958:		cmp #$0a		; c9 0a
B12_195a:		beq B12_196b ; f0 0f

B12_195c:		lda $14			; a5 14
B12_195e:		bne B12_1966 ; d0 06

B12_1960:		lda $1b			; a5 1b
B12_1962:		and #$fb		; 29 fb
B12_1964:		sta $1b			; 85 1b
B12_1966:		lda #$29		; a9 29
B12_1968:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B12_196b:		rts				; 60 


B12_196c:		.db $00				; 00
B12_196d:		ora ($02, x)	; 01 02
B12_196f:	.db $03
B12_1970:	.db $04
B12_1971:	.db $03
B12_1972:	.db $02
B12_1973:		ora ($10, x)	; 01 10
B12_1975:		ora ($12), y	; 11 12
B12_1977:	.db $13
B12_1978:	.db $14
B12_1979:	.db $13
B12_197a:	.db $12
B12_197b:		ora ($ad), y	; 11 ad
B12_197d:	.db $eb
B12_197e:	.db $04
B12_197f:		and #$10		; 29 10
B12_1981:		bne B12_1997 ; d0 14

B12_1983:		jsr $9aa1		; 20 a1 9a
B12_1986:		lda $1a			; a5 1a
B12_1988:		and #$09		; 29 09
B12_198a:		bne B12_198f ; d0 03

B12_198c:		jsr $8607		; 20 07 86
B12_198f:		lda #$49		; a9 49
B12_1991:		jsr checkGlobalFlag		; 20 e9 e7
B12_1994:		beq B12_1997 ; f0 01

B12_1996:		rts				; 60 


B12_1997:		lda #$48		; a9 48
B12_1999:		jsr checkGlobalFlag		; 20 e9 e7
B12_199c:		beq B12_19a1 ; f0 03

B12_199e:		jmp $9a28		; 4c 28 9a


B12_19a1:		lda wJoy1ButtonsPressed.w		; ad 50 01
B12_19a4:		and #$0f		; 29 0f
B12_19a6:		jsr jumpTable_retFollowing		; 20 bc e6
	.dw func_c_19cb
	.dw $8487
	.dw $96ae
	.dw $9791
	.dw $8487
	.dw $84ce
	.dw $9a6d
	.dw $9a73
	.dw $8487
	.dw $857a
	.dw $9a95
	.dw $9a9b
	.dw $8487
	.dw $8487
	.dw $8487
	.dw $8487
	.dw $8487

func_c_19cb:
	lda $1a
B12_19cd:		and #$09		; 29 09
B12_19cf:		beq B12_19de ; f0 0d

B12_19d1:		and #$08		; 29 08
B12_19d3:		beq B12_19db ; f0 06

B12_19d5:		lda $19			; a5 19
B12_19d7:		and #$04		; 29 04
B12_19d9:		beq B12_19de ; f0 03

B12_19db:		jmp $9a2d		; 4c 2d 9a


B12_19de:		lda $1a			; a5 1a
B12_19e0:		and #$20		; 29 20
B12_19e2:		bne B12_1a1b ; d0 37

B12_19e4:		lda $04e8		; ad e8 04
B12_19e7:		bpl B12_19ef ; 10 06

B12_19e9:		lda $15			; a5 15
B12_19eb:		bpl B12_19f3 ; 10 06

B12_19ed:		bmi B12_19f8 ; 30 09

B12_19ef:		lda $15			; a5 15
B12_19f1:		bpl B12_19f8 ; 10 05

B12_19f3:		lda #$c0		; a9 c0
B12_19f5:		jmp $9a02		; 4c 02 9a


B12_19f8:		lda $1a			; a5 1a
B12_19fa:		and #$08		; 29 08
B12_19fc:		bne B12_19f3 ; d0 f5

B12_19fe:		lda #$c8		; a9 c8
B12_1a00:		bne B12_1a02 ; d0 00

B12_1a02:		jsr $8717		; 20 17 87
B12_1a05:		lda #$46		; a9 46
B12_1a07:		jsr checkGlobalFlag		; 20 e9 e7
B12_1a0a:		beq B12_1a12 ; f0 06

B12_1a0c:		lda #$76		; a9 76
B12_1a0e:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B12_1a11:		rts				; 60 


B12_1a12:		lda wPlayerOamDetailsIdx.w		; ad 1b 05
B12_1a15:		bne B12_1a1a ; d0 03

B12_1a17:		jsr $9ade		; 20 de 9a
B12_1a1a:		rts				; 60 


B12_1a1b:		lda $13			; a5 13
B12_1a1d:		bpl B12_1a23 ; 10 04

B12_1a1f:		lda #$63		; a9 63
B12_1a21:		bne B12_1a25 ; d0 02

B12_1a23:		lda #$64		; a9 64
B12_1a25:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B12_1a28:		lda #$80		; a9 80
B12_1a2a:		jmp $8717		; 4c 17 87


B12_1a2d:		lda $1b			; a5 1b
B12_1a2f:		and #$01		; 29 01
B12_1a31:		beq B12_1a33 ; f0 00

B12_1a33:		lda $1b			; a5 1b
B12_1a35:		and #$fd		; 29 fd
B12_1a37:		sta $1b			; 85 1b
B12_1a39:		jsr $87ff		; 20 ff 87
B12_1a3c:		lda $015a		; ad 5a 01
B12_1a3f:		lsr a			; 4a
B12_1a40:		lsr a			; 4a
B12_1a41:		lsr a			; 4a
B12_1a42:		and #$03		; 29 03
B12_1a44:		tay				; a8 
B12_1a45:		lda $9a4c, y	; b9 4c 9a
B12_1a48:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B12_1a4b:		rts				; 60 


B12_1a4c:		ror $67			; 66 67
B12_1a4e:		pla				; 68 
B12_1a4f:	.db $67
B12_1a50:		lda $04e8		; ad e8 04
B12_1a53:		bpl B12_1a58 ; 10 03

B12_1a55:		jmp $9a81		; 4c 81 9a


B12_1a58:		lda $1b			; a5 1b
B12_1a5a:		and #$04		; 29 04
B12_1a5c:		beq B12_1a61 ; f0 03

B12_1a5e:		jmp $8865		; 4c 65 88


B12_1a61:		lda $1a			; a5 1a
B12_1a63:		and #$20		; 29 20
B12_1a65:		beq B12_1a6c ; f0 05

B12_1a67:		lda #$18		; a9 18
B12_1a69:		sta $15			; 85 15
B12_1a6b:		rts				; 60 


B12_1a6c:		rts				; 60 


B12_1a6d:		jsr $96ae		; 20 ae 96
B12_1a70:		jmp $9a50		; 4c 50 9a


B12_1a73:		jsr $9791		; 20 91 97
B12_1a76:		jmp $9a50		; 4c 50 9a


B12_1a79:		lda $04e8		; ad e8 04
B12_1a7c:		bpl B12_1a81 ; 10 03

B12_1a7e:		jmp $9a58		; 4c 58 9a


B12_1a81:		lda $1b			; a5 1b
B12_1a83:		and #$04		; 29 04
B12_1a85:		beq B12_1a8a ; f0 03

B12_1a87:		jmp $8865		; 4c 65 88


B12_1a8a:		lda $1a			; a5 1a
B12_1a8c:		and #$20		; 29 20
B12_1a8e:		beq B12_1a94 ; f0 04

B12_1a90:		lda #$e8		; a9 e8
B12_1a92:		sta $15			; 85 15
B12_1a94:		rts				; 60 


B12_1a95:		jsr $96ae		; 20 ae 96
B12_1a98:		jmp $9a79		; 4c 79 9a


B12_1a9b:		jsr $9791		; 20 91 97
B12_1a9e:		jmp $9a79		; 4c 79 9a


B12_1aa1:		lda #$46		; a9 46
B12_1aa3:		jsr checkGlobalFlag		; 20 e9 e7
B12_1aa6:		beq B12_1aa9 ; f0 01

B12_1aa8:		rts				; 60 


B12_1aa9:		lda $1b			; a5 1b
B12_1aab:		and #$04		; 29 04
B12_1aad:		bne B12_1ad3 ; d0 24

B12_1aaf:		lda $1a			; a5 1a
B12_1ab1:		and #$09		; 29 09
B12_1ab3:		bne B12_1ac4 ; d0 0f

B12_1ab5:		lda $1a			; a5 1a
B12_1ab7:		and #$02		; 29 02
B12_1ab9:		bne B12_1ad4 ; d0 19

B12_1abb:		lda #$0b		; a9 0b
B12_1abd:		sta $01			; 85 01
B12_1abf:		lda #$cc		; a9 cc
B12_1ac1:		jmp $8412		; 4c 12 84


B12_1ac4:		lda $19			; a5 19
B12_1ac6:		and #$04		; 29 04
B12_1ac8:		bne B12_1ad3 ; d0 09

B12_1aca:		lda #$0b		; a9 0b
B12_1acc:		sta $01			; 85 01
B12_1ace:		lda #$cc		; a9 cc
B12_1ad0:		jmp $840a		; 4c 0a 84


B12_1ad3:		rts				; 60 


B12_1ad4:		lda wJoy1NewButtonsPressed.w		; ad 54 01
B12_1ad7:		bpl B12_1ad3 ; 10 fa

B12_1ad9:		lda #$0a		; a9 0a
B12_1adb:		jmp $8e2e		; 4c 2e 8e


B12_1ade:		lda $1b			; a5 1b
B12_1ae0:		and #$04		; 29 04
B12_1ae2:		bne B12_1b3d ; d0 59

B12_1ae4:		lda $19			; a5 19
B12_1ae6:		and #$04		; 29 04
B12_1ae8:		bne B12_1b22 ; d0 38

B12_1aea:		lda $1a			; a5 1a
B12_1aec:		and #$02		; 29 02
B12_1aee:		bne B12_1aff ; d0 0f

B12_1af0:		lda $11			; a5 11
B12_1af2:		sta $00			; 85 00
B12_1af4:		lda $10			; a5 10
B12_1af6:		asl $00			; 06 00
B12_1af8:		rol a			; 2a
B12_1af9:		asl $00			; 06 00
B12_1afb:		rol a			; 2a
B12_1afc:		jmp $9b0d		; 4c 0d 9b


B12_1aff:		lda wJoy1ButtonsPressed.w		; ad 50 01
B12_1b02:		and #$03		; 29 03
B12_1b04:		bne B12_1b09 ; d0 03

B12_1b06:		jmp $88ba		; 4c ba 88


B12_1b09:		lda $015a		; ad 5a 01
B12_1b0c:		lsr a			; 4a
B12_1b0d:		and #$07		; 29 07
B12_1b0f:		tay				; a8 
B12_1b10:		lda $1b			; a5 1b
B12_1b12:		and #$01		; 29 01
B12_1b14:		beq B12_1b1b ; f0 05

B12_1b16:		tya				; 98 
B12_1b17:		clc				; 18 
B12_1b18:		adc #$08		; 69 08
B12_1b1a:		tay				; a8 
B12_1b1b:		lda $9b54, y	; b9 54 9b
B12_1b1e:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B12_1b21:		rts				; 60 


B12_1b22:		lda $1b			; a5 1b
B12_1b24:		and #$01		; 29 01
B12_1b26:		bne B12_1b37 ; d0 0f

B12_1b28:		lda $015a		; ad 5a 01
B12_1b2b:		and #$08		; 29 08
B12_1b2d:		bne B12_1b33 ; d0 04

B12_1b2f:		lda #$49		; a9 49
B12_1b31:		bne B12_1b39 ; d0 06

B12_1b33:		lda #$4a		; a9 4a
B12_1b35:		bne B12_1b39 ; d0 02

B12_1b37:		lda #$55		; a9 55
B12_1b39:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B12_1b3c:		rts				; 60 


B12_1b3d:		lda $0511		; ad 11 05
B12_1b40:		cmp #$0a		; c9 0a
B12_1b42:		beq B12_1b53 ; f0 0f

B12_1b44:		lda $14			; a5 14
B12_1b46:		bne B12_1b4e ; d0 06

B12_1b48:		lda $1b			; a5 1b
B12_1b4a:		and #$fb		; 29 fb
B12_1b4c:		sta $1b			; 85 1b
B12_1b4e:		lda #$6a		; a9 6a
B12_1b50:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B12_1b53:		rts				; 60 


B12_1b54:		rti				; 40 


B12_1b55:		eor ($42, x)	; 41 42
B12_1b57:	.db $43
B12_1b58:	.db $44
B12_1b59:	.db $43
B12_1b5a:	.db $42
B12_1b5b:		eor ($50, x)	; 41 50
B12_1b5d:		eor ($52), y	; 51 52
B12_1b5f:	.db $53
B12_1b60:	.db $54
B12_1b61:	.db $53
B12_1b62:	.db $52
B12_1b63:		eor ($ad), y	; 51 ad
B12_1b65:	.db $eb
B12_1b66:	.db $04
B12_1b67:		and #$10		; 29 10
B12_1b69:		bne B12_1b79 ; d0 0e

B12_1b6b:		jsr $9dc3		; 20 c3 9d
B12_1b6e:		jsr $8607		; 20 07 86
B12_1b71:		lda #$49		; a9 49
B12_1b73:		jsr checkGlobalFlag		; 20 e9 e7
B12_1b76:		beq B12_1b79 ; f0 01

B12_1b78:		rts				; 60 


B12_1b79:		lda #$48		; a9 48
B12_1b7b:		jsr checkGlobalFlag		; 20 e9 e7
B12_1b7e:		bne B12_1bf0 ; d0 70

B12_1b80:		lda wJoy1ButtonsPressed.w		; ad 50 01
B12_1b83:		and #$0f		; 29 0f
B12_1b85:		jsr jumpTable_retFollowing		; 20 bc e6
	.dw func_c_1baa
	.dw $8487
	.dw $9bf5
	.dw $9cd1
	.dw $8487
	.dw $84ce
	.dw $9dab
	.dw $9db1
	.dw $8487
	.dw $857a
	.dw $9db7
	.dw $9dbd
	.dw $8487
	.dw $8487
	.dw $8487
	.dw $8487
	.dw $8487

func_c_1baa:
B12_1baa:		lda $1a
B12_1bac:		and #$09		; 29 09
B12_1bae:		beq B12_1bb3 ; f0 03

B12_1bb0:		jmp $9bc7		; 4c c7 9b


B12_1bb3:		lda $1a			; a5 1a
B12_1bb5:		and #$20		; 29 20
B12_1bb7:		bne B12_1be3 ; d0 2a

B12_1bb9:		lda #$c0		; a9 c0
B12_1bbb:		jsr $8717		; 20 17 87
B12_1bbe:		lda wPlayerOamDetailsIdx.w		; ad 1b 05
B12_1bc1:		bne B12_1bc6 ; d0 03

B12_1bc3:		jsr $9e5a		; 20 5a 9e
B12_1bc6:		rts				; 60 


B12_1bc7:		lda $1b			; a5 1b
B12_1bc9:		and #$fd		; 29 fd
B12_1bcb:		sta $1b			; 85 1b
B12_1bcd:		lda #$d0		; a9 d0
B12_1bcf:		jsr $8717		; 20 17 87
B12_1bd2:		lda $015a		; ad 5a 01
B12_1bd5:		bne B12_1bda ; d0 03

B12_1bd7:		jsr $9eeb		; 20 eb 9e
B12_1bda:		lda wPlayerOamDetailsIdx.w		; ad 1b 05
B12_1bdd:		bne B12_1be2 ; d0 03

B12_1bdf:		jsr $9e5a		; 20 5a 9e
B12_1be2:		rts				; 60 


B12_1be3:		lda $13			; a5 13
B12_1be5:		bpl B12_1beb ; 10 04

B12_1be7:		lda #$97		; a9 97
B12_1be9:		bne B12_1bed ; d0 02

B12_1beb:		lda #$98		; a9 98
B12_1bed:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B12_1bf0:		lda #$80		; a9 80
B12_1bf2:		jmp $8717		; 4c 17 87


B12_1bf5:		lda $1b			; a5 1b
B12_1bf7:		and #$04		; 29 04
B12_1bf9:		beq B12_1bfe ; f0 03

B12_1bfb:		jmp $8865		; 4c 65 88


B12_1bfe:		lda $1a			; a5 1a
B12_1c00:		and #$20		; 29 20
B12_1c02:		beq B12_1c09 ; f0 05

B12_1c04:		lda #$00		; a9 00
B12_1c06:		sta $15			; 85 15
B12_1c08:		rts				; 60 


B12_1c09:		lda $1b			; a5 1b
B12_1c0b:		and #$02		; 29 02
B12_1c0d:		beq B12_1c2c ; f0 1d

B12_1c0f:		lda $19			; a5 19
B12_1c11:		and #$02		; 29 02
B12_1c13:		bne B12_1c1b ; d0 06

B12_1c15:		lda #$06		; a9 06
B12_1c17:		jsr $8e2e		; 20 2e 8e
B12_1c1a:		rts				; 60 


B12_1c1b:		lda $0511		; ad 11 05
B12_1c1e:		cmp #$02		; c9 02
B12_1c20:		beq B12_1c1a ; f0 f8

B12_1c22:		lda #$00		; a9 00
B12_1c24:		sta $14			; 85 14
B12_1c26:		lda #$02		; a9 02
B12_1c28:		jsr $8e2e		; 20 2e 8e
B12_1c2b:		rts				; 60 


B12_1c2c:		lda $19			; a5 19
B12_1c2e:		and #$02		; 29 02
B12_1c30:		beq B12_1c6f ; f0 3d

B12_1c32:		lda $1a			; a5 1a
B12_1c34:		and #$09		; 29 09
B12_1c36:		bne B12_1c3e ; d0 06

B12_1c38:		lda $19			; a5 19
B12_1c3a:		and #$04		; 29 04
B12_1c3c:		beq B12_1c47 ; f0 09

B12_1c3e:		lda $19			; a5 19
B12_1c40:		and #$fd		; 29 fd
B12_1c42:		sta $19			; 85 19
B12_1c44:		jmp $9c6f		; 4c 6f 9c


B12_1c47:		lda $04ea		; ad ea 04
B12_1c4a:		and #$7f		; 29 7f
B12_1c4c:		sta $04ea		; 8d ea 04
B12_1c4f:		lda $14			; a5 14
B12_1c51:		beq B12_1c61 ; f0 0e

B12_1c53:		bpl B12_1c69 ; 10 14

B12_1c55:		cmp #$f4		; c9 f4
B12_1c57:		bcs B12_1c6f ; b0 16

B12_1c59:		lda #$01		; a9 01
B12_1c5b:		jsr $8e2e		; 20 2e 8e
B12_1c5e:		jmp $9c6f		; 4c 6f 9c


B12_1c61:		lda #$02		; a9 02
B12_1c63:		jsr $8e2e		; 20 2e 8e
B12_1c66:		jmp $9c6f		; 4c 6f 9c


B12_1c69:		lda $1a			; a5 1a
B12_1c6b:		and #$02		; 29 02
B12_1c6d:		bne B12_1c61 ; d0 f2

B12_1c6f:		lda $1a			; a5 1a
B12_1c71:		and #$03		; 29 03
B12_1c73:		tay				; a8 
B12_1c74:		lda $14			; a5 14
B12_1c76:		bmi B12_1c83 ; 30 0b

B12_1c78:		cmp $9cce, y	; d9 ce 9c
B12_1c7b:		bcc B12_1c83 ; 90 06

B12_1c7d:		lda $9cce, y	; b9 ce 9c
B12_1c80:		sta $14			; 85 14
B12_1c82:		rts				; 60 


B12_1c83:		lda $19			; a5 19
B12_1c85:		and #$04		; 29 04
B12_1c87:		bne B12_1c97 ; d0 0e

B12_1c89:		lda $1a			; a5 1a
B12_1c8b:		and #$02		; 29 02
B12_1c8d:		bne B12_1caa ; d0 1b

B12_1c8f:		lda #$01		; a9 01
B12_1c91:		clc				; 18 
B12_1c92:		adc $14			; 65 14
B12_1c94:		sta $14			; 85 14
B12_1c96:		rts				; 60 


B12_1c97:		lda $1a			; a5 1a
B12_1c99:		and #$09		; 29 09
B12_1c9b:		bne B12_1ca0 ; d0 03

B12_1c9d:		inc $14			; e6 14
B12_1c9f:		rts				; 60 


B12_1ca0:		lda $015a		; ad 5a 01
B12_1ca3:		and #$07		; 29 07
B12_1ca5:		bne B12_1ca9 ; d0 02

B12_1ca7:		inc $14			; e6 14
B12_1ca9:		rts				; 60 


B12_1caa:		lda $19			; a5 19
B12_1cac:		and #$02		; 29 02
B12_1cae:		beq B12_1cb7 ; f0 07

B12_1cb0:		lda $015a		; ad 5a 01
B12_1cb3:		and #$07		; 29 07
B12_1cb5:		bne B12_1ccd ; d0 16

B12_1cb7:		lda $015a		; ad 5a 01
B12_1cba:		and #$01		; 29 01
B12_1cbc:		bne B12_1ccd ; d0 0f

B12_1cbe:		inc $14			; e6 14
B12_1cc0:		lda $14			; a5 14
B12_1cc2:		bmi B12_1ccd ; 30 09

B12_1cc4:		cmp #$18		; c9 18
B12_1cc6:		bcc B12_1ccd ; 90 05

B12_1cc8:		lda #$0a		; a9 0a
B12_1cca:		jmp $8e2e		; 4c 2e 8e


B12_1ccd:		rts				; 60 


B12_1cce:		;removed
	.db $10 $18

B12_1cd0:		jsr $1ba5		; 20 a5 1b
B12_1cd3:		and #$04		; 29 04
B12_1cd5:		beq B12_1cda ; f0 03

B12_1cd7:		jmp $8865		; 4c 65 88


B12_1cda:		lda $1a			; a5 1a
B12_1cdc:		and #$20		; 29 20
B12_1cde:		beq B12_1ce5 ; f0 05

B12_1ce0:		lda #$00		; a9 00
B12_1ce2:		sta $15			; 85 15
B12_1ce4:		rts				; 60 


B12_1ce5:		lda $1b			; a5 1b
B12_1ce7:		and #$02		; 29 02
B12_1ce9:		beq B12_1d08 ; f0 1d

B12_1ceb:		lda $19			; a5 19
B12_1ced:		and #$02		; 29 02
B12_1cef:		beq B12_1cf7 ; f0 06

B12_1cf1:		lda #$06		; a9 06
B12_1cf3:		jsr $8e2e		; 20 2e 8e
B12_1cf6:		rts				; 60 


B12_1cf7:		lda $0511		; ad 11 05
B12_1cfa:		cmp #$02		; c9 02
B12_1cfc:		beq B12_1cf6 ; f0 f8

B12_1cfe:		lda #$00		; a9 00
B12_1d00:		sta $14			; 85 14
B12_1d02:		lda #$02		; a9 02
B12_1d04:		jsr $8e2e		; 20 2e 8e
B12_1d07:		rts				; 60 


B12_1d08:		lda $19			; a5 19
B12_1d0a:		and #$02		; 29 02
B12_1d0c:		bne B12_1d47 ; d0 39

B12_1d0e:		lda $1a			; a5 1a
B12_1d10:		and #$09		; 29 09
B12_1d12:		bne B12_1d1a ; d0 06

B12_1d14:		lda $19			; a5 19
B12_1d16:		and #$04		; 29 04
B12_1d18:		beq B12_1d23 ; f0 09

B12_1d1a:		lda $19			; a5 19
B12_1d1c:		ora #$02		; 09 02
B12_1d1e:		sta $19			; 85 19
B12_1d20:		jmp $9d47		; 4c 47 9d


B12_1d23:		lda $04ea		; ad ea 04
B12_1d26:		and #$7f		; 29 7f
B12_1d28:		sta $04ea		; 8d ea 04
B12_1d2b:		lda $14			; a5 14
B12_1d2d:		beq B12_1d39 ; f0 0a

B12_1d2f:		bmi B12_1d41 ; 30 10

B12_1d31:		lda #$01		; a9 01
B12_1d33:		jsr $8e2e		; 20 2e 8e
B12_1d36:		jmp $9d47		; 4c 47 9d


B12_1d39:		lda #$02		; a9 02
B12_1d3b:		jsr $8e2e		; 20 2e 8e
B12_1d3e:		jmp $9d47		; 4c 47 9d


B12_1d41:		lda $1a			; a5 1a
B12_1d43:		and #$02		; 29 02
B12_1d45:		bne B12_1d39 ; d0 f2

B12_1d47:		lda $1a			; a5 1a
B12_1d49:		and #$03		; 29 03
B12_1d4b:		tay				; a8 
B12_1d4c:		lda $14			; a5 14
B12_1d4e:		bpl B12_1d5d ; 10 0d

B12_1d50:		cmp $9da8, y	; d9 a8 9d
B12_1d53:		beq B12_1d57 ; f0 02

B12_1d55:		bcs B12_1d5d ; b0 06

B12_1d57:		lda $9da8, y	; b9 a8 9d
B12_1d5a:		sta $14			; 85 14
B12_1d5c:		rts				; 60 


B12_1d5d:		lda $19			; a5 19
B12_1d5f:		and #$04		; 29 04
B12_1d61:		bne B12_1d71 ; d0 0e

B12_1d63:		lda $1a			; a5 1a
B12_1d65:		and #$02		; 29 02
B12_1d67:		bne B12_1d84 ; d0 1b

B12_1d69:		lda #$ff		; a9 ff
B12_1d6b:		clc				; 18 
B12_1d6c:		adc $14			; 65 14
B12_1d6e:		sta $14			; 85 14
B12_1d70:		rts				; 60 


B12_1d71:		lda $1a			; a5 1a
B12_1d73:		and #$09		; 29 09
B12_1d75:		bne B12_1d7a ; d0 03

B12_1d77:		dec $14			; c6 14
B12_1d79:		rts				; 60 


B12_1d7a:		lda $015a		; ad 5a 01
B12_1d7d:		and #$07		; 29 07
B12_1d7f:		bne B12_1d83 ; d0 02

B12_1d81:		dec $14			; c6 14
B12_1d83:		rts				; 60 


B12_1d84:		lda $19			; a5 19
B12_1d86:		and #$02		; 29 02
B12_1d88:		bne B12_1d91 ; d0 07

B12_1d8a:		lda $015a		; ad 5a 01
B12_1d8d:		and #$07		; 29 07
B12_1d8f:		bne B12_1da7 ; d0 16

B12_1d91:		lda $015a		; ad 5a 01
B12_1d94:		and #$01		; 29 01
B12_1d96:		bne B12_1da7 ; d0 0f

B12_1d98:		dec $14			; c6 14
B12_1d9a:		lda $14			; a5 14
B12_1d9c:		bpl B12_1da7 ; 10 09

B12_1d9e:		cmp #$e9		; c9 e9
B12_1da0:		bcs B12_1da7 ; b0 05

B12_1da2:		lda #$0a		; a9 0a
B12_1da4:		jmp $8e2e		; 4c 2e 8e


B12_1da7:		rts				; 60 


B12_1da8:		;removed
	.db $f0 $e8

B12_1daa:		cpx #$20		; e0 20
B12_1dac:		sbc $9b, x		; f5 9b
B12_1dae:		jmp $84ce		; 4c ce 84


B12_1db1:		jsr $9cd1		; 20 d1 9c
B12_1db4:		jmp $84ce		; 4c ce 84


B12_1db7:		jsr $9bf5		; 20 f5 9b
B12_1dba:		jmp $857a		; 4c 7a 85


B12_1dbd:		jsr $9cd1		; 20 d1 9c
B12_1dc0:		jmp $857a		; 4c 7a 85


B12_1dc3:		lda $1b			; a5 1b
B12_1dc5:		and #$04		; 29 04
B12_1dc7:		bne B12_1e2b ; d0 62

B12_1dc9:		lda $1a			; a5 1a
B12_1dcb:		and #$08		; 29 08
B12_1dcd:		bne B12_1de4 ; d0 15

B12_1dcf:		lda $1a			; a5 1a
B12_1dd1:		and #$01		; 29 01
B12_1dd3:		bne B12_1ded ; d0 18

B12_1dd5:		lda $1a			; a5 1a
B12_1dd7:		and #$02		; 29 02
B12_1dd9:		bne B12_1e50 ; d0 75

B12_1ddb:		lda #$0b		; a9 0b
B12_1ddd:		sta $01			; 85 01
B12_1ddf:		lda #$cc		; a9 cc
B12_1de1:		jmp $8412		; 4c 12 84


B12_1de4:		lda #$0b		; a9 0b
B12_1de6:		sta $01			; 85 01
B12_1de8:		lda #$cc		; a9 cc
B12_1dea:		jmp $840a		; 4c 0a 84


B12_1ded:		lda $20			; a5 20
B12_1def:		bne B12_1e29 ; d0 38

B12_1df1:		lda wJoy1NewButtonsPressed.w		; ad 54 01
B12_1df4:		bpl B12_1e2b ; 10 35

B12_1df6:		lda $04e8		; ad e8 04
B12_1df9:		bmi B12_1e2c ; 30 31

B12_1dfb:		lda $1a			; a5 1a
B12_1dfd:		and #$08		; 29 08
B12_1dff:		bne B12_1e20 ; d0 1f

B12_1e01:		lda $19			; a5 19
B12_1e03:		and #$04		; 29 04
B12_1e05:		bne B12_1e0b ; d0 04

B12_1e07:		lda #$e8		; a9 e8
B12_1e09:		bne B12_1e22 ; d0 17

B12_1e0b:		lda $1b			; a5 1b
B12_1e0d:		and #$08		; 29 08
B12_1e0f:		bne B12_1e15 ; d0 04

B12_1e11:		lda #$ec		; a9 ec
B12_1e13:		bne B12_1e17 ; d0 02

B12_1e15:		lda #$d0		; a9 d0
B12_1e17:		clc				; 18 
B12_1e18:		adc $15			; 65 15
B12_1e1a:		bpl B12_1e22 ; 10 06

B12_1e1c:		cmp #$c7		; c9 c7
B12_1e1e:		bcs B12_1e22 ; b0 02

B12_1e20:		lda #$c8		; a9 c8
B12_1e22:		sta $15			; 85 15
B12_1e24:		lda #$08		; a9 08
B12_1e26:		sta $20			; 85 20
B12_1e28:		rts				; 60 


B12_1e29:		dec $20			; c6 20
B12_1e2b:		rts				; 60 


B12_1e2c:		lda $1a			; a5 1a
B12_1e2e:		and #$08		; 29 08
B12_1e30:		bne B12_1e47 ; d0 15

B12_1e32:		lda $19			; a5 19
B12_1e34:		and #$04		; 29 04
B12_1e36:		bne B12_1e3c ; d0 04

B12_1e38:		lda #$18		; a9 18
B12_1e3a:		bne B12_1e49 ; d0 0d

B12_1e3c:		lda #$14		; a9 14
B12_1e3e:		clc				; 18 
B12_1e3f:		adc $15			; 65 15
B12_1e41:		bmi B12_1e49 ; 30 06

B12_1e43:		cmp #$38		; c9 38
B12_1e45:		bcc B12_1e49 ; 90 02

B12_1e47:		lda #$38		; a9 38
B12_1e49:		sta $15			; 85 15
B12_1e4b:		lda #$08		; a9 08
B12_1e4d:		sta $20			; 85 20
B12_1e4f:		rts				; 60 


B12_1e50:		lda wJoy1NewButtonsPressed.w		; ad 54 01
B12_1e53:		bpl B12_1e2b ; 10 d6

B12_1e55:		lda #$0a		; a9 0a
B12_1e57:		jmp $8e2e		; 4c 2e 8e


B12_1e5a:		lda $1b			; a5 1b
B12_1e5c:		and #$04		; 29 04
B12_1e5e:		bne B12_1ec4 ; d0 64

B12_1e60:		lda $1a			; a5 1a
B12_1e62:		and #$09		; 29 09
B12_1e64:		bne B12_1e6c ; d0 06

B12_1e66:		lda $19			; a5 19
B12_1e68:		and #$04		; 29 04
B12_1e6a:		bne B12_1ea9 ; d0 3d

B12_1e6c:		lda $1a			; a5 1a
B12_1e6e:		and #$02		; 29 02
B12_1e70:		bne B12_1e81 ; d0 0f

B12_1e72:		lda $11			; a5 11
B12_1e74:		sta $00			; 85 00
B12_1e76:		lda $10			; a5 10
B12_1e78:		asl $00			; 06 00
B12_1e7a:		rol a			; 2a
B12_1e7b:		asl $00			; 06 00
B12_1e7d:		rol a			; 2a
B12_1e7e:		jmp $9e8f		; 4c 8f 9e


B12_1e81:		lda wJoy1ButtonsPressed.w		; ad 50 01
B12_1e84:		and #$03		; 29 03
B12_1e86:		bne B12_1e8b ; d0 03

B12_1e88:		jmp $88ba		; 4c ba 88


B12_1e8b:		lda $015a		; ad 5a 01
B12_1e8e:		lsr a			; 4a
B12_1e8f:		and #$07		; 29 07
B12_1e91:		tay				; a8 
B12_1e92:		lda $1b			; a5 1b
B12_1e94:		and #$01		; 29 01
B12_1e96:		beq B12_1ea2 ; f0 0a

B12_1e98:		asl a			; 0a
B12_1e99:		asl a			; 0a
B12_1e9a:		asl a			; 0a
B12_1e9b:		sta $00			; 85 00
B12_1e9d:		tya				; 98 
B12_1e9e:		clc				; 18 
B12_1e9f:		adc $00			; 65 00
B12_1ea1:		tay				; a8 
B12_1ea2:		lda $9edb, y	; b9 db 9e
B12_1ea5:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B12_1ea8:		rts				; 60 


B12_1ea9:		lda $1b			; a5 1b
B12_1eab:		and #$01		; 29 01
B12_1ead:		bne B12_1ebe ; d0 0f

B12_1eaf:		lda $015a		; ad 5a 01
B12_1eb2:		and #$08		; 29 08
B12_1eb4:		bne B12_1eba ; d0 04

B12_1eb6:		lda #$89		; a9 89
B12_1eb8:		bne B12_1ec0 ; d0 06

B12_1eba:		lda #$8a		; a9 8a
B12_1ebc:		bne B12_1ec0 ; d0 02

B12_1ebe:		lda #$95		; a9 95
B12_1ec0:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B12_1ec3:		rts				; 60 


B12_1ec4:		lda $0511		; ad 11 05
B12_1ec7:		cmp #$0a		; c9 0a
B12_1ec9:		beq B12_1ec3 ; f0 f8

B12_1ecb:		lda $14			; a5 14
B12_1ecd:		bne B12_1ed5 ; d0 06

B12_1ecf:		lda $1b			; a5 1b
B12_1ed1:		and #$fb		; 29 fb
B12_1ed3:		sta $1b			; 85 1b
B12_1ed5:		lda #$b3		; a9 b3
B12_1ed7:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B12_1eda:		rts				; 60 


B12_1edb:	.db $80
B12_1edc:		sta ($82, x)	; 81 82
B12_1ede:	.db $83
B12_1edf:		sty $83			; 84 83
B12_1ee1:	.db $82
B12_1ee2:		sta ($90, x)	; 81 90
B12_1ee4:		sta ($92), y	; 91 92
B12_1ee6:	.db $93
B12_1ee7:		sty $93, x		; 94 93
B12_1ee9:	.db $92
B12_1eea:		sta ($a2), y	; 91 a2
B12_1eec:		bvs B12_1e9b ; 70 ad

B12_1eee:		adc $d003, y	; 79 03 d0
B12_1ef1:	.db $27
B12_1ef2:		ldy #$00		; a0 00
B12_1ef4:	.db $b9 $10 $00
B12_1ef7:		sta $0300, x	; 9d 00 03
B12_1efa:		iny				; c8 
B12_1efb:		inx				; e8 
B12_1efc:		cpy #$10		; c0 10
B12_1efe:		bne B12_1ef4 ; d0 f4

B12_1f00:		txa				; 8a 
B12_1f01:		sec				; 38 
B12_1f02:		sbc #$10		; e9 10
B12_1f04:		tax				; aa 
B12_1f05:		lda #$07		; a9 07
B12_1f07:		sta $0308, x	; 9d 08 03
B12_1f0a:		lda #$01		; a9 01
B12_1f0c:		sta $0309, x	; 9d 09 03
B12_1f0f:		lda #$00		; a9 00
B12_1f11:		sta $0304, x	; 9d 04 03
B12_1f14:		lda #$f0		; a9 f0
B12_1f16:		sta $0305, x	; 9d 05 03
B12_1f19:		rts				; 60 


B12_1f1a:		lda $04eb		; ad eb 04
B12_1f1d:		and #$10		; 29 10
B12_1f1f:		bne B12_1f35 ; d0 14

B12_1f21:		jsr $a1a2		; 20 a2 a1
B12_1f24:		lda $1a			; a5 1a
B12_1f26:		and #$09		; 29 09
B12_1f28:		bne B12_1f2d ; d0 03

B12_1f2a:		jsr $8607		; 20 07 86
B12_1f2d:		lda #$49		; a9 49
B12_1f2f:		jsr checkGlobalFlag		; 20 e9 e7
B12_1f32:		beq B12_1f35 ; f0 01

B12_1f34:		rts				; 60 


B12_1f35:		lda #$48		; a9 48
B12_1f37:		jsr checkGlobalFlag		; 20 e9 e7
B12_1f3a:		bne B12_1fa7 ; d0 6b

B12_1f3c:		lda wJoy1ButtonsPressed.w		; ad 50 01
B12_1f3f:		and #$0f		; 29 0f
B12_1f41:		jsr jumpTable_retFollowing		; 20 bc e6
	.dw func_c_1f66
	.dw $8487
	.dw $a026
	.dw $a0d9
	.dw $8487
	.dw $84ce
	.dw $a18a
	.dw $a190
	.dw $8487
	.dw $857a
	.dw $a196
	.dw $a19c
	.dw $8487
	.dw $8487
	.dw $8487
	.dw $8487
	.dw $8487

func_c_1f66:
	lda $1a
B12_1f68:		and #$09		; 29 09
B12_1f6a:		beq B12_1f79 ; f0 0d

B12_1f6c:		and #$08		; 29 08
B12_1f6e:		beq B12_1f76 ; f0 06

B12_1f70:		lda $19			; a5 19
B12_1f72:		and #$04		; 29 04
B12_1f74:		beq B12_1f79 ; f0 03

B12_1f76:		jmp $9fac		; 4c ac 9f


B12_1f79:		lda $1a			; a5 1a
B12_1f7b:		and #$20		; 29 20
B12_1f7d:		bne B12_1f9a ; d0 1b

B12_1f7f:		lda #$c0		; a9 c0
B12_1f81:		jsr $8717		; 20 17 87
B12_1f84:		lda #$46		; a9 46
B12_1f86:		jsr checkGlobalFlag		; 20 e9 e7
B12_1f89:		beq B12_1f91 ; f0 06

B12_1f8b:		lda #$f5		; a9 f5
B12_1f8d:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B12_1f90:		rts				; 60 


B12_1f91:		lda wPlayerOamDetailsIdx.w		; ad 1b 05
B12_1f94:		bne B12_1f99 ; d0 03

B12_1f96:		jsr $a1c7		; 20 c7 a1
B12_1f99:		rts				; 60 


B12_1f9a:		lda $13			; a5 13
B12_1f9c:		bpl B12_1fa2 ; 10 04

B12_1f9e:		lda #$d8		; a9 d8
B12_1fa0:		bne B12_1fa4 ; d0 02

B12_1fa2:		lda #$d9		; a9 d9
B12_1fa4:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B12_1fa7:		lda #$80		; a9 80
B12_1fa9:		jmp $8717		; 4c 17 87


B12_1fac:		lda $1b			; a5 1b
B12_1fae:		and #$01		; 29 01
B12_1fb0:		beq B12_1fb2 ; f0 00

B12_1fb2:		lda $1b			; a5 1b
B12_1fb4:		and #$fd		; 29 fd
B12_1fb6:		sta $1b			; 85 1b
B12_1fb8:		lda $04e8		; ad e8 04
B12_1fbb:		;removed
	.db $30 $4e

B12_1fbd:		lda $1b			; a5 1b
B12_1fbf:		and #$08		; 29 08
B12_1fc1:		bne B12_1ffb ; d0 38

B12_1fc3:		lda $1a			; a5 1a
B12_1fc5:		and #$08		; 29 08
B12_1fc7:		beq B12_1fdf ; f0 16

B12_1fc9:		lda $15			; a5 15
B12_1fcb:		bpl B12_1fd1 ; 10 04

B12_1fcd:		cmp #$f0		; c9 f0
B12_1fcf:		bcc B12_1fe7 ; 90 16

B12_1fd1:		lda $13			; a5 13
B12_1fd3:		cmp #$30		; c9 30
B12_1fd5:		bcs B12_1fe3 ; b0 0c

B12_1fd7:		cmp #$04		; c9 04
B12_1fd9:		bcs B12_1fe7 ; b0 0c

B12_1fdb:		lda #$04		; a9 04
B12_1fdd:		bne B12_1fe5 ; d0 06

B12_1fdf:		lda #$00		; a9 00
B12_1fe1:		sta $14			; 85 14
B12_1fe3:		lda #$fc		; a9 fc
B12_1fe5:		sta $15			; 85 15
B12_1fe7:		lda $11			; a5 11
B12_1fe9:		bpl B12_1fef ; 10 04

B12_1feb:		lda #$ea		; a9 ea
B12_1fed:		bne B12_1ff1 ; d0 02

B12_1fef:		lda #$eb		; a9 eb
B12_1ff1:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B12_1ff4:		ldx #$00		; a2 00
B12_1ff6:		lda #$80		; a9 80
B12_1ff8:		jmp $8717		; 4c 17 87


B12_1ffb:		ldx #$00		; a2 00
B12_1ffd:		lda #$c0		; a9 c0
		.db $20
