;OR13



B13_0000:	.db $17
B13_0001:	.db $87
B13_0002:		lda wPlayerOamDetailsIdx.w		; ad 1b 05
B13_0005:		bne B13_000a ; d0 03

B13_0007:		jsr $a1c7		; 20 c7 a1
B13_000a:		rts				; 60 


B13_000b:		lda $1a			; a5 1a
B13_000d:		and #$08		; 29 08
B13_000f:		beq B13_001d ; f0 0c

B13_0011:		lda $13			; a5 13
B13_0013:		cmp #$c0		; c9 c0
B13_0015:		bcc B13_0021 ; 90 0a

B13_0017:		cmp #$f0		; c9 f0
B13_0019:		;removed
	.db $90 $cc

B13_001b:		;removed
	.db $b0 $c6

B13_001d:		lda #$00		; a9 00
B13_001f:		sta $14			; 85 14
B13_0021:		lda #$04		; a9 04
B13_0023:		jmp $9fe5		; 4c e5 9f


B13_0026:		lda #$46		; a9 46
B13_0028:		jsr checkGlobalFlag		; 20 e9 e7
B13_002b:		beq B13_002e ; f0 01

B13_002d:		rts				; 60 


B13_002e:		lda $1b			; a5 1b
B13_0030:		and #$04		; 29 04
B13_0032:		beq B13_0037 ; f0 03

B13_0034:		jmp $8865		; 4c 65 88


B13_0037:		lda $1a			; a5 1a
B13_0039:		and #$20		; 29 20
B13_003b:		bne B13_00b4 ; d0 77

B13_003d:		lda $1b			; a5 1b
B13_003f:		and #$02		; 29 02
B13_0041:		bne B13_00b9 ; d0 76

B13_0043:		lda $19			; a5 19
B13_0045:		and #$02		; 29 02
B13_0047:		beq B13_0080 ; f0 37

B13_0049:		lda $19			; a5 19
B13_004b:		and #$04		; 29 04
B13_004d:		beq B13_0058 ; f0 09

B13_004f:		lda $19			; a5 19
B13_0051:		and #$fd		; 29 fd
B13_0053:		sta $19			; 85 19
B13_0055:		jmp $a080		; 4c 80 a0


B13_0058:		lda $04ea		; ad ea 04
B13_005b:		and #$7f		; 29 7f
B13_005d:		sta $04ea		; 8d ea 04
B13_0060:		lda $14			; a5 14
B13_0062:		beq B13_0072 ; f0 0e

B13_0064:		bpl B13_007a ; 10 14

B13_0066:		cmp #$f4		; c9 f4
B13_0068:		bcs B13_0080 ; b0 16

B13_006a:		lda #$01		; a9 01
B13_006c:		jsr $8e2e		; 20 2e 8e
B13_006f:		jmp $a080		; 4c 80 a0


B13_0072:		lda #$02		; a9 02
B13_0074:		jsr $8e2e		; 20 2e 8e
B13_0077:		jmp $a080		; 4c 80 a0


B13_007a:		lda $1a			; a5 1a
B13_007c:		and #$02		; 29 02
B13_007e:		bne B13_0072 ; d0 f2

B13_0080:		lda $1a			; a5 1a
B13_0082:		and #$03		; 29 03
B13_0084:		tay				; a8 
B13_0085:		lda $14			; a5 14
B13_0087:		bmi B13_0094 ; 30 0b

B13_0089:		cmp $a0d6, y	; d9 d6 a0
B13_008c:		bcc B13_0094 ; 90 06

B13_008e:		lda $a0d6, y	; b9 d6 a0
B13_0091:		sta $14			; 85 14
B13_0093:		rts				; 60 


B13_0094:		lda $19			; a5 19
B13_0096:		and #$04		; 29 04
B13_0098:		bne B13_00a8 ; d0 0e

B13_009a:		lda $1a			; a5 1a
B13_009c:		and #$02		; 29 02
B13_009e:		bne B13_00ae ; d0 0e

B13_00a0:		lda #$01		; a9 01
B13_00a2:		clc				; 18 
B13_00a3:		adc $14			; 65 14
B13_00a5:		sta $14			; 85 14
B13_00a7:		rts				; 60 


B13_00a8:		lda $1a			; a5 1a
B13_00aa:		and #$09		; 29 09
B13_00ac:		bne B13_00b1 ; d0 03

B13_00ae:		inc $14			; e6 14
B13_00b0:		rts				; 60 


B13_00b1:		inc $14			; e6 14
B13_00b3:		rts				; 60 


B13_00b4:		lda #$00		; a9 00
B13_00b6:		sta $15			; 85 15
B13_00b8:		rts				; 60 


B13_00b9:		lda $19			; a5 19
B13_00bb:		and #$02		; 29 02
B13_00bd:		bne B13_00c5 ; d0 06

B13_00bf:		lda #$06		; a9 06
B13_00c1:		jsr $8e2e		; 20 2e 8e
B13_00c4:		rts				; 60 


B13_00c5:		lda $0511		; ad 11 05
B13_00c8:		cmp #$02		; c9 02
B13_00ca:		beq B13_00c4 ; f0 f8

B13_00cc:		lda #$00		; a9 00
B13_00ce:		sta $14			; 85 14
B13_00d0:		lda #$02		; a9 02
B13_00d2:		jsr $8e2e		; 20 2e 8e
B13_00d5:		rts				; 60 


B13_00d6:		;removed
	.db $10 $10

B13_00d8:		clc				; 18 
B13_00d9:		lda #$46		; a9 46
B13_00db:		jsr checkGlobalFlag		; 20 e9 e7
B13_00de:		beq B13_00e1 ; f0 01

B13_00e0:		rts				; 60 


B13_00e1:		lda $1b			; a5 1b
B13_00e3:		and #$04		; 29 04
B13_00e5:		beq B13_00ea ; f0 03

B13_00e7:		jmp $8865		; 4c 65 88


B13_00ea:		lda $1a			; a5 1a
B13_00ec:		and #$20		; 29 20
B13_00ee:		bne B13_0165 ; d0 75

B13_00f0:		lda $1b			; a5 1b
B13_00f2:		and #$02		; 29 02
B13_00f4:		bne B13_016a ; d0 74

B13_00f6:		lda $19			; a5 19
B13_00f8:		and #$02		; 29 02
B13_00fa:		bne B13_012f ; d0 33

B13_00fc:		lda $19			; a5 19
B13_00fe:		and #$04		; 29 04
B13_0100:		beq B13_010b ; f0 09

B13_0102:		lda $19			; a5 19
B13_0104:		ora #$02		; 09 02
B13_0106:		sta $19			; 85 19
B13_0108:		jmp $a12f		; 4c 2f a1


B13_010b:		lda $04ea		; ad ea 04
B13_010e:		and #$7f		; 29 7f
B13_0110:		sta $04ea		; 8d ea 04
B13_0113:		lda $14			; a5 14
B13_0115:		beq B13_0121 ; f0 0a

B13_0117:		bmi B13_0129 ; 30 10

B13_0119:		lda #$01		; a9 01
B13_011b:		jsr $8e2e		; 20 2e 8e
B13_011e:		jmp $a12f		; 4c 2f a1


B13_0121:		lda #$02		; a9 02
B13_0123:		jsr $8e2e		; 20 2e 8e
B13_0126:		jmp $a12f		; 4c 2f a1


B13_0129:		lda $1a			; a5 1a
B13_012b:		and #$02		; 29 02
B13_012d:		bne B13_0121 ; d0 f2

B13_012f:		lda $1a			; a5 1a
B13_0131:		and #$03		; 29 03
B13_0133:		tay				; a8 
B13_0134:		lda $14			; a5 14
B13_0136:		bpl B13_0145 ; 10 0d

B13_0138:		cmp $a187, y	; d9 87 a1
B13_013b:		beq B13_013f ; f0 02

B13_013d:		bcs B13_0145 ; b0 06

B13_013f:		lda $a187, y	; b9 87 a1
B13_0142:		sta $14			; 85 14
B13_0144:		rts				; 60 


B13_0145:		lda $19			; a5 19
B13_0147:		and #$04		; 29 04
B13_0149:		bne B13_0159 ; d0 0e

B13_014b:		lda $1a			; a5 1a
B13_014d:		and #$02		; 29 02
B13_014f:		bne B13_015f ; d0 0e

B13_0151:		lda #$ff		; a9 ff
B13_0153:		clc				; 18 
B13_0154:		adc $14			; 65 14
B13_0156:		sta $14			; 85 14
B13_0158:		rts				; 60 


B13_0159:		lda $1a			; a5 1a
B13_015b:		and #$09		; 29 09
B13_015d:		bne B13_0162 ; d0 03

B13_015f:		dec $14			; c6 14
B13_0161:		rts				; 60 


B13_0162:		dec $14			; c6 14
B13_0164:		rts				; 60 


B13_0165:		lda #$00		; a9 00
B13_0167:		sta $15			; 85 15
B13_0169:		rts				; 60 


B13_016a:		lda $19			; a5 19
B13_016c:		and #$02		; 29 02
B13_016e:		beq B13_0176 ; f0 06

B13_0170:		lda #$06		; a9 06
B13_0172:		jsr $8e2e		; 20 2e 8e
B13_0175:		rts				; 60 


B13_0176:		lda $0511		; ad 11 05
B13_0179:		cmp #$02		; c9 02
B13_017b:		beq B13_0175 ; f0 f8

B13_017d:		lda #$00		; a9 00
B13_017f:		sta $14			; 85 14
B13_0181:		lda #$02		; a9 02
B13_0183:		jsr $8e2e		; 20 2e 8e
B13_0186:		rts				; 60 


B13_0187:		beq B13_0179 ; f0 f0

B13_0189:		inx				; e8 
B13_018a:		jsr $a026		; 20 26 a0
B13_018d:		jmp $84ce		; 4c ce 84


B13_0190:		jsr $a0d9		; 20 d9 a0
B13_0193:		jmp $84ce		; 4c ce 84


B13_0196:		jsr $a026		; 20 26 a0
B13_0199:		jmp $857a		; 4c 7a 85


B13_019c:		jsr $a0d9		; 20 d9 a0
B13_019f:		jmp $857a		; 4c 7a 85


B13_01a2:		lda #$46		; a9 46
B13_01a4:		jsr checkGlobalFlag		; 20 e9 e7
B13_01a7:		beq B13_01aa ; f0 01

B13_01a9:		rts				; 60 


B13_01aa:		lda $1a			; a5 1a
B13_01ac:		and #$09		; 29 09
B13_01ae:		bne B13_01b9 ; d0 09

B13_01b0:		lda #$0b		; a9 0b
B13_01b2:		sta $01			; 85 01
B13_01b4:		lda #$cc		; a9 cc
B13_01b6:		jmp $8412		; 4c 12 84


B13_01b9:		and #$08		; 29 08
B13_01bb:		beq B13_01c6 ; f0 09

B13_01bd:		lda #$0b		; a9 0b
B13_01bf:		sta $01			; 85 01
B13_01c1:		lda #$cc		; a9 cc
B13_01c3:		jmp $840a		; 4c 0a 84


B13_01c6:		rts				; 60 


B13_01c7:		lda $19			; a5 19
B13_01c9:		and #$04		; 29 04
B13_01cb:		bne B13_01ee ; d0 21

B13_01cd:		lda $11			; a5 11
B13_01cf:		sta $00			; 85 00
B13_01d1:		lda $10			; a5 10
B13_01d3:		asl $00			; 06 00
B13_01d5:		rol a			; 2a
B13_01d6:		asl $00			; 06 00
B13_01d8:		rol a			; 2a
B13_01d9:		and #$07		; 29 07
B13_01db:		tay				; a8 
B13_01dc:		lda $1b			; a5 1b
B13_01de:		and #$01		; 29 01
B13_01e0:		beq B13_01e7 ; f0 05

B13_01e2:		tya				; 98 
B13_01e3:		clc				; 18 
B13_01e4:		adc #$08		; 69 08
B13_01e6:		tay				; a8 
B13_01e7:		lda $a209, y	; b9 09 a2
B13_01ea:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B13_01ed:		rts				; 60 


B13_01ee:		lda $1b			; a5 1b
B13_01f0:		and #$01		; 29 01
B13_01f2:		bne B13_0203 ; d0 0f

B13_01f4:		lda $015a		; ad 5a 01
B13_01f7:		and #$08		; 29 08
B13_01f9:		bne B13_01ff ; d0 04

B13_01fb:		lda #$c9		; a9 c9
B13_01fd:		bne B13_0205 ; d0 06

B13_01ff:		lda #$ca		; a9 ca
B13_0201:		bne B13_0205 ; d0 02

B13_0203:		lda #$d7		; a9 d7
B13_0205:		sta wPlayerOamDetailsIdx.w		; 8d 1b 05
B13_0208:		rts				; 60 


B13_0209:		cpy #$c1		; c0 c1
B13_020b:	.db $c2
B13_020c:	.db $c3
B13_020d:		cpy $c3			; c4 c3
B13_020f:	.db $c2
B13_0210:		cmp ($d0, x)	; c1 d0
B13_0212:		cmp ($d2), y	; d1 d2
B13_0214:	.db $d3
B13_0215:	.db $d4
B13_0216:	.db $d3
B13_0217:	.db $d2
B13_0218:		cmp ($60), y	; d1 60
B13_021a:		lda #$60		; a9 60
B13_021c:		sta wShadow1KBChrBank1.w		; 8d 6c 01
B13_021f:		lda #$18		; a9 18
B13_0221:		jsr func_0860		; 20 60 e8
B13_0224:		lda wJoy1ButtonsPressed.w		; ad 50 01
B13_0227:		and #$08		; 29 08
B13_0229:		beq B13_0230 ; f0 05

B13_022b:		lda #$a0		; a9 a0
B13_022d:		sta $0305, x	; 9d 05 03
B13_0230:		lda $19			; a5 19
B13_0232:		and #$02		; 29 02
B13_0234:		beq B13_0247 ; f0 11

B13_0236:		ora $0309, x	; 1d 09 03
B13_0239:		sta $0309, x	; 9d 09 03
B13_023c:		lda $0304, x	; bd 04 03
B13_023f:		eor #$ff		; 49 ff
B13_0241:		clc				; 18 
B13_0242:		adc #$01		; 69 01
B13_0244:		sta $0304, x	; 9d 04 03
B13_0247:		lda $1b			; a5 1b
B13_0249:		and #$fd		; 29 fd
B13_024b:		sta $1b			; 85 1b
B13_024d:		lda #$46		; a9 46
B13_024f:		jsr setGlobalFlag		; 20 f0 e7
B13_0252:		lda #$40		; a9 40
B13_0254:		jmp func_08fa		; 4c fa e8


B13_0257:		lda #$01		; a9 01
B13_0259:		jsr func_0860		; 20 60 e8
B13_025c:		lda $19			; a5 19
B13_025e:		and #$02		; 29 02
B13_0260:		beq B13_026d ; f0 0b

B13_0262:		lda $0304, x	; bd 04 03
B13_0265:		eor #$ff		; 49 ff
B13_0267:		clc				; 18 
B13_0268:		adc #$01		; 69 01
B13_026a:		sta $0304, x	; 9d 04 03
B13_026d:		lda #$46		; a9 46
B13_026f:		jsr setGlobalFlag		; 20 f0 e7
B13_0272:		lda #$43		; a9 43
B13_0274:		jmp func_08fa		; 4c fa e8


B13_0277:		lda #$60		; a9 60
B13_0279:		sta wShadow1KBChrBank1.w		; 8d 6c 01
B13_027c:		lda #$02		; a9 02
B13_027e:		jsr func_0860		; 20 60 e8
B13_0281:		lda $19			; a5 19
B13_0283:		and #$02		; 29 02
B13_0285:		beq B13_0298 ; f0 11

B13_0287:		ora $0309, x	; 1d 09 03
B13_028a:		sta $0309, x	; 9d 09 03
B13_028d:		lda $0304, x	; bd 04 03
B13_0290:		eor #$ff		; 49 ff
B13_0292:		clc				; 18 
B13_0293:		adc #$01		; 69 01
B13_0295:		sta $0304, x	; 9d 04 03
B13_0298:		lda $1b			; a5 1b
B13_029a:		and #$fd		; 29 fd
B13_029c:		sta $1b			; 85 1b
B13_029e:		lda #$46		; a9 46
B13_02a0:		jsr setGlobalFlag		; 20 f0 e7
B13_02a3:		lda #$42		; a9 42
B13_02a5:		jmp func_08fa		; 4c fa e8


B13_02a8:		lda $19			; a5 19
B13_02aa:		pha				; 48 
B13_02ab:		and #$fd		; 29 fd
B13_02ad:		sta $19			; 85 19
B13_02af:		lda #$63		; a9 63
B13_02b1:		sta wShadow1KBChrBank1.w		; 8d 6c 01
B13_02b4:		lda #$49		; a9 49
B13_02b6:		jsr checkGlobalFlag		; 20 e9 e7
B13_02b9:		bne B13_0326 ; d0 6b

B13_02bb:		lda #$32		; a9 32
B13_02bd:		jsr func_08fa		; 20 fa e8
B13_02c0:		ldx #$f0		; a2 f0
B13_02c2:		lda $03f9		; ad f9 03
B13_02c5:		bne B13_02cc ; d0 05

B13_02c7:		lda #$0f		; a9 0f
B13_02c9:		jsr func_0860		; 20 60 e8
B13_02cc:		ldx #$e0		; a2 e0
B13_02ce:		lda $03e9		; ad e9 03
B13_02d1:		bne B13_02d8 ; d0 05

B13_02d3:		lda #$10		; a9 10
B13_02d5:		jsr func_0860		; 20 60 e8
B13_02d8:		ldx #$d0		; a2 d0
B13_02da:		lda $03d9		; ad d9 03
B13_02dd:		bne B13_02e4 ; d0 05

B13_02df:		lda #$11		; a9 11
B13_02e1:		jsr func_0860		; 20 60 e8
B13_02e4:		ldx #$c0		; a2 c0
B13_02e6:		lda $03c9		; ad c9 03
B13_02e9:		bne B13_02f0 ; d0 05

B13_02eb:		lda #$12		; a9 12
B13_02ed:		jsr func_0860		; 20 60 e8
B13_02f0:		ldx #$b0		; a2 b0
B13_02f2:		lda $03b9		; ad b9 03
B13_02f5:		bne B13_02fc ; d0 05

B13_02f7:		lda #$13		; a9 13
B13_02f9:		jsr func_0860		; 20 60 e8
B13_02fc:		ldx #$a0		; a2 a0
B13_02fe:		lda $03a9		; ad a9 03
B13_0301:		bne B13_0308 ; d0 05

B13_0303:		lda #$14		; a9 14
B13_0305:		jsr func_0860		; 20 60 e8
B13_0308:		ldx #$90		; a2 90
B13_030a:		lda $0399		; ad 99 03
B13_030d:		bne B13_0314 ; d0 05

B13_030f:		lda #$15		; a9 15
B13_0311:		jsr func_0860		; 20 60 e8
B13_0314:		ldx #$80		; a2 80
B13_0316:		lda $0389		; ad 89 03
B13_0319:		bne B13_0320 ; d0 05

B13_031b:		lda #$16		; a9 16
B13_031d:		jsr func_0860		; 20 60 e8
B13_0320:		lda $1b			; a5 1b
B13_0322:		and #$fd		; 29 fd
B13_0324:		sta $1b			; 85 1b
B13_0326:		pla				; 68 
B13_0327:		sta $19			; 85 19
B13_0329:		rts				; 60 


B13_032a:		lda #$61		; a9 61
B13_032c:		sta wShadow1KBChrBank1.w		; 8d 6c 01
B13_032f:		lda #$0c		; a9 0c
B13_0331:		jsr func_0860		; 20 60 e8
B13_0334:		lda $19			; a5 19
B13_0336:		and #$02		; 29 02
B13_0338:		beq B13_034b ; f0 11

B13_033a:		ora $0309, x	; 1d 09 03
B13_033d:		sta $0309, x	; 9d 09 03
B13_0340:		lda $0304, x	; bd 04 03
B13_0343:		eor #$ff		; 49 ff
B13_0345:		clc				; 18 
B13_0346:		adc #$01		; 69 01
B13_0348:		sta $0304, x	; 9d 04 03
B13_034b:		lda $1b			; a5 1b
B13_034d:		and #$fd		; 29 fd
B13_034f:		sta $1b			; 85 1b
B13_0351:		lda #$46		; a9 46
B13_0353:		jsr setGlobalFlag		; 20 f0 e7
B13_0356:		lda #$42		; a9 42
B13_0358:		jmp func_08fa		; 4c fa e8


func_d_035b:
B13_035b:		lda #$52		; a9 52
B13_035d:		sta $d7			; 85 d7
B13_035f:		lda wPPUCtrl			; a5 ff
B13_0361:		and #$fe		; 29 fe
B13_0363:		sta wPPUCtrl			; 85 ff
B13_0365:		jsr wOam_outOfYbounds		; 20 6a e5
B13_0368:		lda #$00		; a9 00
B13_036a:		sta $fd			; 85 fd
B13_036c:		sta $fc			; 85 fc
B13_036e:		jsr fillFirst3nametablesWithA_clearPalettes		; 20 74 df

B13_0371:		lda #SL_titleScreenUfouria		; a9 34
B13_0373:		jsr drawStaticLayoutIdxedY		; 20 76 fc
B13_0376:		lda #SL_titleScreenNametable0Palettes		; a9 35
B13_0378:		jsr drawStaticLayoutIdxedY		; 20 76 fc
B13_037b:		lda #SL_titleScreenCopyrightAndLicense		; a9 36
B13_037d:		jsr drawStaticLayoutIdxedY		; 20 76 fc

	jsr loadFollowingDataIntoInternalPalettes2BG		; 20 c9 e3
	.db $0f
	.db $38 $27 $16
	.db $25 $15 $05
	.db $20 $10 $00
	.db $29 $19 $08

	jsr loadFollowingDataIntoInternalPalettes2Spr		; 20 0c e4
	.db $21 $11 $01
	.db $21 $11 $01
	.db $30 $10 $00
	.db $35 $25 $05

B13_039f:		lda #$38
B13_03a1:		sta wShadow2KBChrBank0.w		; 8d 69 01
B13_03a4:		lda #$3a		; a9 3a
B13_03a6:		sta wShadow2KBChrBank1.w		; 8d 6a 01
B13_03a9:		lda #$00		; a9 00
B13_03ab:		sta $015d		; 8d 5d 01
B13_03ae:		sta $19			; 85 19
B13_03b0:		sta wNextUsableOamIdx.w		; 8d 58 01
B13_03b3:		sta $10			; 85 10
B13_03b5:		jsr func_e_1fcf		; ppu mask to show all
B13_03b8:		lda #$04		; a9 04
B13_03ba:		jsr func_08e5		; 20 e5 e8
B13_03bd:		jsr func_d_049f		; 20 9f a4

.ifdef ROM_JP
	lda #$01
	sta $28
.endif

B13_03c0:		lda #$01		; a9 01
B13_03c2:		jsr func_05cb		; copies palettes from 01a0 to 0180
B13_03c5:		jsr func_052e		; 20 2e e5
B13_03c8:		jsr wOam_outOfYbounds		; 20 6a e5
B13_03cb:		jsr func_d_049f		; 20 9f a4

B13_03ce:		lda $015a		; ad 5a 01
B13_03d1:		and #$1f		; 29 1f
B13_03d3:		bne B13_03ec ; d0 17

B13_03d5:		dec $d7			; c6 d7
B13_03d7:		bne B13_03ec ; d0 13

B13_03d9:		lda #$52		; a9 52
B13_03db:		sta $d7			; 85 d7
B13_03dd:		lda #$04		; a9 04
B13_03df:		jsr func_08e5		; 20 e5 e8
B13_03e2:		jsr func_d_1824		; 20 24 b8
B13_03e5:		lda #$00		; a9 00
B13_03e7:		sta $28			; 85 28
// loop this whole function
B13_03e9:		jmp func_d_035b		; 4c 5b a3


B13_03ec:		lda wJoy1NewButtonsPressed.w		; ad 54 01
B13_03ef:		and #$f0		; 29 f0
B13_03f1:		beq B13_03c5 ; f0 d2

.ifdef ROM_JP
	lda #$37
	jsr $fd21
	lda #$38
	jsr $fd21
	jsr $e5c9
	lda #$3a
	jsr $fd21
	jsr $e5c9
	jsr $e605
	jsr $a479
	jsr $a436
	lda $10
	asl a
	tay
	lda $a475, y
	sta $16
	lda $a476, y
	sta $17
	lda $015a
	and #$08
	bne +

	lda #$8a
	bne ++

+	lda #$8b
++	jsr $f602
.else
B13_03f3:		lda #$52		; a9 52
B13_03f5:		sta $d7			; 85 d7
B13_03f7:		lda #$22		; a9 22
B13_03f9:		sta $0e			; 85 0e
B13_03fb:		lda #$a0		; a9 a0
B13_03fd:		sta $0f			; 85 0f
B13_03ff:		lda #$02		; a9 02
B13_0401:		sta $0d			; 85 0d
B13_0403:		jsr func_052e		; 20 2e e5
B13_0406:		lda #$37		; a9 37
B13_0408:		jsr copyStaticLayoutIdxedYForNMIDataCopyingAtCurrPPUAddr		; 20 96 fc
B13_040b:		lda $0f			; a5 0f
B13_040d:		clc				; 18 
B13_040e:		adc #$20		; 69 20
B13_0410:		sta $0f			; 85 0f
B13_0412:		lda $0e			; a5 0e
B13_0414:		adc #$00		; 69 00
B13_0416:		sta $0e			; 85 0e
B13_0418:		dec $0d			; c6 0d
B13_041a:		bpl B13_0403 ; 10 e7

B13_041c:		lda #$38		; a9 38
B13_041e:		jsr copyStaticLayoutIdxedYForNMIDataCopying		; 20 86 fc
B13_0421:		jsr func_052e		; 20 2e e5
B13_0424:		lda #$3a		; a9 3a
B13_0426:		jsr copyStaticLayoutIdxedYForNMIDataCopying		; 20 86 fc
B13_0429:		jsr func_052e		; 20 2e e5
B13_042c:		jsr wOam_outOfYbounds		; 20 6a e5
B13_042f:		jsr func_d_049f		; 20 9f a4
B13_0432:		jsr $a43b		; 20 3b a4
B13_0435:		jsr $a45e		; 20 5e a4
.endif

B13_0438:		jmp $a429		; 4c 29 a4


B13_043b:		lda wJoy1NewButtonsPressed.w		; ad 54 01
B13_043e:		and #$10		; 29 10
B13_0440:		bne B13_047c ; d0 3a

B13_0442:		lda wJoy1NewButtonsPressed.w		; ad 54 01
B13_0445:		and #$20		; 29 20
B13_0447:		bne B13_0451 ; d0 08

B13_0449:		lda wJoy1NewButtonsPressed.w		; ad 54 01
B13_044c:		and #$0c		; 29 0c
B13_044e:		bne B13_0451 ; d0 01

B13_0450:		rts				; 60 


B13_0451:		inc $10			; e6 10
B13_0453:		lda $10			; a5 10
B13_0455:		and #$01		; 29 01
B13_0457:		sta $10			; 85 10
B13_0459:		lda #$2f		; a9 2f
B13_045b:		jmp func_08fa		; 4c fa e8

.ifndef ROM_JP
B13_045e:		lda $10			; a5 10
B13_0460:		asl a			; 0a
B13_0461:		tay				; a8 
B13_0462:		lda $a49b, y	; b9 9b a4
B13_0465:		sta $16			; 85 16
B13_0467:		lda $a49c, y	; b9 9c a4
B13_046a:		sta $17			; 85 17
B13_046c:		lda $015a		; ad 5a 01
B13_046f:		and #$08		; 29 08
B13_0471:		bne B13_0477 ; d0 04

B13_0473:		lda #$8a		; a9 8a
B13_0475:		bne B13_0479 ; d0 02

B13_0477:		lda #$8b		; a9 8b
B13_0479:		jmp updateEntity_wOam		; 4c 67 f5

B13_047c:		jsr $a45e		; 20 5e a4
.else
B13_047c:
.endif

B13_047f:		lda #$35		; a9 35
B13_0481:		jsr func_08fa		; 20 fa e8
B13_0484:		ldx #$88		; a2 88
B13_0486:		jsr func_0530		; 20 30 e5
B13_0489:		lda #$01		; a9 01
B13_048b:		jsr func_0578		; 20 78 e5
B13_048e:		jsr func_e_1fda		; 20 da df
B13_0491:		lda $10			; a5 10
B13_0493:		beq B13_0498 ; f0 03

B13_0495:		jmp $adf4		; 4c f4 ad


B13_0498:		pla				; 68 
B13_0499:		pla				; 68 
B13_049a:		rts				; 60 


B13_049b:		cli				; 58 
B13_049c:		tya				; 98 
B13_049d:		cli				; 58 
B13_049e:		tay				; a8 

func_d_049f:
.ifndef ROM_JP
B13_049f:		lda #$5f		; a9 5f
B13_04a1:		sta $16			; 85 16
B13_04a3:		lda #$50		; a9 50
B13_04a5:		sta $17			; 85 17
B13_04a7:		lda #$89		; a9 89
B13_04a9:		jsr updateEntity_wOam		; 20 67 f5
.endif
B13_04ac:		lda #$c0		; a9 c0
B13_04ae:		sta $16			; 85 16
B13_04b0:		lda #$48		; a9 48
B13_04b2:		sta $17			; 85 17
B13_04b4:		lda #$88		; a9 88
B13_04b6:		jmp updateEntity_wOam		; 4c 67 f5


func_d_04b9:
B13_04b9:		lda wJoy1NewButtonsPressed.w		; ad 54 01
B13_04bc:		and #PADF_SELECT		; 29 20
B13_04be:		beq B13_04ee ; f0 2e

// going to inventory screen
B13_04c0:		lda $04e8		; ad e8 04
B13_04c3:		and #$c0		; 29 c0
B13_04c5:		bne B13_04ee ; d0 27

B13_04c7:		lda $04e9		; ad e9 04
B13_04ca:		and #$01		; 29 01
B13_04cc:		bne B13_04ee ; d0 20

B13_04ce:		lda $04ea		; ad ea 04
B13_04d1:		and #$68		; 29 68
B13_04d3:		bne B13_04ee ; d0 19

B13_04d5:		lda #$5d		; a9 5d
B13_04d7:		jsr checkGlobalFlag		; 20 e9 e7
B13_04da:		bne B13_04ee ; d0 12

B13_04dc:		lda $0511		; ad 11 05
B13_04df:		cmp #$0b		; c9 0b
B13_04e1:		beq B13_04ee ; f0 0b

B13_04e3:		cmp #$0e		; c9 0e
B13_04e5:		beq B13_04ee ; f0 07

B13_04e7:		lda $04ec		; ad ec 04
B13_04ea:		and #$0f		; 29 0f
B13_04ec:		beq B13_04f0 ; f0 02

B13_04ee:		sec				; 38 
B13_04ef:		rts				; 60 

B13_04f0:		lda wShadow1KBChrBank0.w		; ad 6b 01
B13_04f3:		sta $0480		; 8d 80 04
B13_04f6:		lda wShadow1KBChrBank1.w		; ad 6c 01
B13_04f9:		sta $0481		; 8d 81 04
B13_04fc:		lda wShadow1KBChrBank2.w		; ad 6d 01
B13_04ff:		sta $0482		; 8d 82 04
B13_0502:		lda wShadow1KBChrBank3.w		; ad 6e 01
B13_0505:		sta $0483		; 8d 83 04

B13_0508:		ldy $0165		; ac 65 01
B13_050b:		lda #$f8		; a9 f8
B13_050d:		dey				; 88 
B13_050e:		dey				; 88 
B13_050f:		dey				; 88 
B13_0510:		dey				; 88 
B13_0511:		sta $0200, y	; 99 00 02
B13_0514:		bne B13_050d ; d0 f7

B13_0516:		jsr func_d_06a4		; 20 a4 a6
B13_0519:		lda #$54		; a9 54
B13_051b:		jsr setGlobalFlag		; 20 f0 e7
B13_051e:		lda #$01		; a9 01
B13_0520:		jsr func_0578		; 20 78 e5
B13_0523:		jsr func_e_1fda		; 20 da df
B13_0526:		lda #$00		; a9 00
B13_0528:		sta $28			; 85 28
B13_052a:		sta $fd			; 85 fd
B13_052c:		sta $fc			; 85 fc
B13_052e:		lda #$42		; a9 42
B13_0530:		jsr setGlobalFlag		; 20 f0 e7
B13_0533:		jsr wOam_outOfYbounds		; 20 6a e5
B13_0536:		lda $ff			; a5 ff
B13_0538:		and #$fe		; 29 fe
B13_053a:		sta $ff			; 85 ff

// inventory screen bg tile
	lda #$51
	jsr fillFirst3nametablesWithA_clearPalettes

	lda #SL_inventoryScreenBox
	jsr drawStaticLayoutIdxedY
	lda #SL_inventoryScreenPalettes
	jsr drawStaticLayoutIdxedY

B13_054b:		lda #$13		; a9 13
B13_054d:		sta $0a			; 85 0a

B13_054f:		ldy $0a			; a4 0a
B13_0551:		lda inventoryGlobalFlags.w, y	; b9 69 a6
B13_0554:		jsr checkGlobalFlag		; 20 e9 e7
B13_0557:		beq B13_0561 ; f0 08

B13_0559:		ldy $0a			; a4 0a
B13_055b:		lda inventoryLayoutsToDrawFromGlobalFlags.w, y	; b9 7d a6
B13_055e:		jsr drawStaticLayoutIdxedY		; 20 76 fc
B13_0561:		dec $0a			; c6 0a
B13_0563:		bpl B13_054f ; 10 ea

B13_0565:		lda wChosenCharacter.w		; ad 10 05
B13_0568:		and #$03		; 29 03
B13_056a:		tay				; a8 
B13_056b:		lda inventoryLayoutFromChosenCharacter.w, y	; b9 91 a6
B13_056e:		jsr drawStaticLayoutIdxedY		; 20 76 fc

	jsr loadFollowingDataIntoInternalPalettes2BG
	.db $0f
	.db $30 $10 $00
	.db $30 $10 $21
	.db $30 $10 $25
	.db $30 $10 $29

	jsr loadFollowingDataIntoInternalPalettes2Spr
	.db $30 $10 $0f
	.db $30 $21 $0f
	.db $30 $10 $15
	.db $30 $10 $29

B13_0590:		jsr func_e_1fcf		; 20 cf df

B13_0593:		lda #$3c		; a9 3c
B13_0595:		sta wShadow2KBChrBank0.w		; 8d 69 01
B13_0598:		lda #$3e		; a9 3e
B13_059a:		sta wShadow2KBChrBank1.w		; 8d 6a 01
B13_059d:		lda #$7f		; a9 7f
B13_059f:		sta wShadow1KBChrBank0.w		; 8d 6b 01
B13_05a2:		lda #$62		; a9 62
B13_05a4:		sta wShadow1KBChrBank1.w		; 8d 6c 01

B13_05a7:		lda #$01		; a9 01
B13_05a9:		jsr func_05cb		; 20 cb e5
B13_05ac:		jsr $a81c		; 20 1c a8
B13_05af:		lda #$00		; a9 00
B13_05b1:		sta $19			; 85 19
B13_05b3:		sta $015d		; 8d 5d 01
B13_05b6:		sta $10			; 85 10
B13_05b8:		sta $11			; 85 11
B13_05ba:		lda wChosenCharacter.w		; ad 10 05
B13_05bd:		and #$03		; 29 03
B13_05bf:		tay				; a8 
B13_05c0:		sta $d1			; 85 d1
B13_05c2:		lda data_d_0695.w, y	; b9 95 a6
B13_05c5:		sta $12			; 85 12
@invScreenLoop:
B13_05c7:		jsr func_052e		; 20 2e e5
B13_05ca:		lda #$00		; a9 00
B13_05cc:		sta wNextUsableOamIdx.w		; 8d 58 01
B13_05cf:		sta $0159		; 8d 59 01
B13_05d2:		lda wJoy1NewButtonsPressed.w		; ad 54 01
B13_05d5:		and #PADF_SELECT		; 29 20
B13_05d7:		bne B13_05eb ; d0 12

B13_05d9:		jsr wOam_outOfYbounds		; 20 6a e5
B13_05dc:		jsr func_d_06af		; // handles input?
B13_05df:		jsr func_d_0847		; // draws characters unlocked?
B13_05e2:		jsr func_d_086b		; 20 6b a8
B13_05e5:		jsr func_d_08a5		; // draws heart and life
B13_05e8:		jmp $a5c7		; @invScreenLoop

// exiting inv screen
B13_05eb:		lda #$01		; a9 01
B13_05ed:		jsr func_0578		; 20 78 e5
B13_05f0:		jsr func_e_1fda		; 20 da df
B13_05f3:		jsr wOam_outOfYbounds		; 20 6a e5
B13_05f6:		lda wChosenCharacter.w		; ad 10 05
B13_05f9:		and #$03		; 29 03
B13_05fb:		cmp $d1			; c5 d1
B13_05fd:		beq B13_0630 ; f0 31

B13_05ff:		lda #$4a		; a9 4a
B13_0601:		jsr checkGlobalFlag		; 20 e9 e7
B13_0604:		beq B13_0630 ; f0 2a

B13_0606:		lda #$4a		; a9 4a
B13_0608:		jsr unsetGlobalFlag		; 20 fc e7
B13_060b:		ldx #$80		; a2 80
B13_060d:		lda $0308, x	; bd 08 03
B13_0610:		cmp #$30		; c9 30
B13_0612:		bne B13_0629 ; d0 15

B13_0614:		lda $0309, x	; bd 09 03
B13_0617:		beq B13_0629 ; f0 10

B13_0619:		lda #$02		; a9 02
B13_061b:		sta $0308, x	; 9d 08 03
B13_061e:		lda #$80		; a9 80
B13_0620:		ora $0309, x	; 1d 09 03
B13_0623:		sta $0309, x	; 9d 09 03
B13_0626:		jmp $a630		; 4c 30 a6


B13_0629:		txa				; 8a 
B13_062a:		clc				; 18 
B13_062b:		adc #$10		; 69 10
B13_062d:		tax				; aa 
B13_062e:		bne B13_060d ; d0 dd

B13_0630:		jsr func_12fe		; 20 fe f2
B13_0633:		jsr $b341		; 20 41 b3
B13_0636:		lda #$54		; a9 54
B13_0638:		jsr unsetGlobalFlag		; 20 fc e7
B13_063b:		jsr func_e_1fcf		; 20 cf df
B13_063e:		lda #$02		; a9 02
B13_0640:		sta $28			; 85 28
B13_0642:		lda #$01		; a9 01
B13_0644:		jsr func_05cb		; 20 cb e5
B13_0647:		lda #$42		; a9 42
B13_0649:		jsr unsetGlobalFlag		; 20 fc e7
B13_064c:		lda $0480		; ad 80 04
B13_064f:		sta wShadow1KBChrBank0.w		; 8d 6b 01
B13_0652:		lda $0481		; ad 81 04
B13_0655:		sta wShadow1KBChrBank1.w		; 8d 6c 01
B13_0658:		lda $0482		; ad 82 04
B13_065b:		sta wShadow1KBChrBank2.w		; 8d 6d 01
B13_065e:		lda $0483		; ad 83 04
B13_0661:		sta wShadow1KBChrBank3.w		; 8d 6e 01
B13_0664:		jsr func_d_0699		; 20 99 a6
B13_0667:		clc				; 18 
B13_0668:		rts				; 60 


inventoryGlobalFlags:
	.db GF_freeon
	.db GF_shades
	.db GF_gil
	.db GF_pw_crystal
	.db GF_map
	.db GF_compass
	.db GF_bops_special
	.db GF_suction_cup
	.db GF_shades_hammer
	.db GF_blue_ring
	.db GF_green_ring
	.db GF_red_ring
	.db GF_gils_bombs
	.db GF_freeons_special
	.db GF_potion
	.db GF_water_of_life
	.db GF_power_of_insight
	.db GF_key1
	.db GF_key2
	.db GF_key3

inventoryLayoutsToDrawFromGlobalFlags:
	.db SL_invFreeonShown
	.db SL_invShadesShown
	.db SL_invGilShown
	.db SL_invPasswordCrystal
	.db SL_invMap
	.db SL_invCompass
	.db SL_invBopsSpecial
	.db SL_invSuctionCup
	.db SL_invShadesHammer
	.db SL_invBlueRing
	.db SL_invGreenRing
	.db SL_invRedRing
	.db SL_invGilsBombs
	.db SL_invFreeonsSpecial
	.db SL_invPotion
	.db SL_invWaterOfLife
	.db SL_invPowerOfInsight
	.db SL_invKey1
	.db SL_invKey2
	.db SL_invKey3

inventoryLayoutFromChosenCharacter:
	.db SL_invBopHidden
	.db SL_invShadesHidden
	.db SL_invGilHidden
	.db SL_invFreeonHidden

data_d_0695:
	.db $00 $02 $03 $01


func_d_0699:
B13_0699:		ldx #$0b
B13_069b:		lda $b4, x		; b5 b4
B13_069d:		sta $0194, x	; 9d 94 01
B13_06a0:		dex				; ca 
B13_06a1:		bpl B13_069b ; 10 f8

B13_06a3:		rts				; 60 


func_d_06a4:
B13_06a4:		ldx #$0b		; a2 0b
-	lda $0194, x	; bd 94 01
B13_06a9:		sta $b4, x		; 95 b4
B13_06ab:		dex				; ca 
	bpl -

B13_06ae:		rts				; 60 


func_d_06af:
B13_06af:		lda wJoy1NewButtonsPressed.w		; ad 54 01
B13_06b2:		sta $af			; 85 af
B13_06b4:		lsr $af			; 46 af
B13_06b6:		bcc B13_06bb ; 90 03

B13_06b8:		jsr $a7e4		; 20 e4 a7
B13_06bb:		lsr $af			; 46 af
B13_06bd:		bcc B13_06c2 ; 90 03

B13_06bf:		jsr $a800		; 20 00 a8
B13_06c2:		lsr $af			; 46 af
B13_06c4:		bcc B13_06c9 ; 90 03

B13_06c6:		jsr $a7c3		; 20 c3 a7
B13_06c9:		lsr $af			; 46 af
B13_06cb:		bcc B13_06d0 ; 90 03

B13_06cd:		jsr $a79f		; 20 9f a7
B13_06d0:		lda wJoy1NewButtonsPressed.w		; ad 54 01
B13_06d3:		and #$c0		; 29 c0
B13_06d5:		bne B13_06d8 ; d0 01

B13_06d7:		rts				; 60 


B13_06d8:		lda $10			; a5 10
B13_06da:		bmi B13_06dd ; 30 01

B13_06dc:		rts				; 60 


B13_06dd:		lda $11			; a5 11
B13_06df:		beq B13_0740 ; f0 5f

B13_06e1:		cmp #$01		; c9 01
B13_06e3:		beq B13_0713 ; f0 2e

B13_06e5:		cmp #$02		; c9 02
B13_06e7:		beq B13_0731 ; f0 48

B13_06e9:		lda #$37		; a9 37
B13_06eb:		jsr checkGlobalFlag		; 20 e9 e7
B13_06ee:		beq B13_06dc ; f0 ec

B13_06f0:		lda #$32		; a9 32
B13_06f2:		jsr $a96d		; 20 6d a9
B13_06f5:		lda #$32		; a9 32
B13_06f7:		jsr $a96d		; 20 6d a9
B13_06fa:		lda #$32		; a9 32
B13_06fc:		jsr $a96d		; 20 6d a9
B13_06ff:		lda #$32		; a9 32
B13_0701:		jsr $a96d		; 20 6d a9
B13_0704:		lda #$32		; a9 32
B13_0706:		jsr $a96d		; 20 6d a9
B13_0709:		lda #$37		; a9 37
B13_070b:		jsr unsetGlobalFlag		; 20 fc e7
B13_070e:		lda #$16		; a9 16
B13_0710:		jmp copyStaticLayoutIdxedYForNMIDataCopying		; 4c 86 fc


B13_0713:		lda #$36		; a9 36
B13_0715:		jsr checkGlobalFlag		; 20 e9 e7
B13_0718:		beq B13_06dc ; f0 c2

B13_071a:		lda #$32		; a9 32
B13_071c:		jsr $a96d		; 20 6d a9
B13_071f:		lda #$36		; a9 36
B13_0721:		jsr unsetGlobalFlag		; 20 fc e7
B13_0724:		lda #$21		; a9 21
B13_0726:		sta $0e			; 85 0e
B13_0728:		lda #$aa		; a9 aa
B13_072a:		sta $0f			; 85 0f
B13_072c:		lda #$16		; a9 16
B13_072e:		jmp copyStaticLayoutIdxedYForNMIDataCopyingAtCurrPPUAddr		; 4c 96 fc


B13_0731:		lda #$31		; a9 31
B13_0733:		jsr checkGlobalFlag		; 20 e9 e7
B13_0736:		beq B13_078f ; f0 57

B13_0738:		lda #$30		; a9 30
B13_073a:		jsr func_08fa		; 20 fa e8
B13_073d:		jmp $a9cb		; 4c cb a9


B13_0740:		lda #$30		; a9 30
B13_0742:		jsr checkGlobalFlag		; 20 e9 e7
B13_0745:		beq B13_078f ; f0 48

B13_0747:		lda #$30		; a9 30
B13_0749:		jsr func_08fa		; 20 fa e8
B13_074c:		jmp func_d_0ca8		; 4c a8 ac


B13_074f:		lda #$2f		; a9 2f
B13_0751:		jsr func_08fa		; 20 fa e8
B13_0754:		ldy $12			; a4 12
B13_0756:		beq B13_0763 ; f0 0b

B13_0758:		dey				; 88 
B13_0759:		lda $a790, y	; b9 90 a7
B13_075c:		jsr checkGlobalFlag		; 20 e9 e7
B13_075f:		beq B13_078f ; f0 2e

B13_0761:		ldy $12			; a4 12
B13_0763:		lda wChosenCharacter.w		; ad 10 05
B13_0766:		sta $0a			; 85 0a
B13_0768:		and #$fc		; 29 fc
B13_076a:		ora $a793, y	; 19 93 a7
B13_076d:		sta wChosenCharacter.w		; 8d 10 05
B13_0770:		jsr $a81c		; 20 1c a8
B13_0773:		lda wChosenCharacter.w		; ad 10 05
B13_0776:		and #$03		; 29 03
B13_0778:		tay				; a8 
B13_0779:		lda $a797, y	; b9 97 a7
B13_077c:		jsr copyStaticLayoutIdxedYForNMIDataCopying		; 20 86 fc
B13_077f:		lda $0a			; a5 0a
B13_0781:		cmp wChosenCharacter.w		; cd 10 05
B13_0784:		beq B13_078f ; f0 09

B13_0786:		and #$03		; 29 03
B13_0788:		tay				; a8 
B13_0789:		lda $a79b, y	; b9 9b a7
B13_078c:		jmp copyStaticLayoutIdxedYForNMIDataCopying		; 4c 86 fc

B13_078f:		rts				; 60 


B13_0790:		php				; 08 
B13_0791:		ora #$0a		; 09 0a
B13_0793:		.db $00				; 00
B13_0794:	.db $03
B13_0795:		ora ($02, x)	; 01 02
B13_0797:	.db $1b
B13_0798:		ora $1c1e, x	; 1d 1e 1c
B13_079b:	.db $1f
B13_079c:		asl $07			; 06 07
B13_079e:		ora $a5			; 05 a5
B13_07a0:		bpl B13_07b2 ; 10 10

B13_07a2:	.db $1f
B13_07a3:		lda #$2f		; a9 2f
B13_07a5:		jsr func_08fa		; 20 fa e8
B13_07a8:		lda $11			; a5 11
B13_07aa:		lsr a			; 4a
B13_07ab:		lsr a			; 4a
B13_07ac:		bcs B13_07be ; b0 10

B13_07ae:		lda #$00		; a9 00
B13_07b0:		sta $10			; 85 10
B13_07b2:		lda wChosenCharacter.w		; ad 10 05
B13_07b5:		and #$03		; 29 03
B13_07b7:		tay				; a8 
B13_07b8:		lda $a695, y	; b9 95 a6
B13_07bb:		sta $12			; 85 12
B13_07bd:		rts				; 60 


B13_07be:		dec $11			; c6 11
B13_07c0:		dec $11			; c6 11
B13_07c2:		rts				; 60 


B13_07c3:		lda $10			; a5 10
B13_07c5:		bpl B13_07d7 ; 10 10

B13_07c7:		lda $11			; a5 11
B13_07c9:		lsr a			; 4a
B13_07ca:		lsr a			; 4a
B13_07cb:		bcs B13_07d6 ; b0 09

B13_07cd:		inc $11			; e6 11
B13_07cf:		inc $11			; e6 11
B13_07d1:		lda #$2f		; a9 2f
B13_07d3:		jsr func_08fa		; 20 fa e8
B13_07d6:		rts				; 60 


B13_07d7:		lda #$ff		; a9 ff
B13_07d9:		sta $10			; 85 10
B13_07db:		lda #$00		; a9 00
B13_07dd:		sta $11			; 85 11
B13_07df:		lda #$2f		; a9 2f
B13_07e1:		jmp func_08fa		; 4c fa e8


B13_07e4:		lda $10			; a5 10
B13_07e6:		bpl B13_07f5 ; 10 0d

B13_07e8:		lda $11			; a5 11
B13_07ea:		lsr a			; 4a
B13_07eb:		bcs B13_07f4 ; b0 07

B13_07ed:		inc $11			; e6 11
B13_07ef:		lda #$2f		; a9 2f
B13_07f1:		jsr func_08fa		; 20 fa e8
B13_07f4:		rts				; 60 


B13_07f5:		inc $12			; e6 12
B13_07f7:		lda $12			; a5 12
B13_07f9:		and #$03		; 29 03
B13_07fb:		sta $12			; 85 12
B13_07fd:		jmp $a74f		; 4c 4f a7


B13_0800:		lda $10			; a5 10
B13_0802:		bpl B13_0811 ; 10 0d

B13_0804:		lda $11			; a5 11
B13_0806:		lsr a			; 4a
B13_0807:		bcc B13_0810 ; 90 07

B13_0809:		dec $11			; c6 11
B13_080b:		lda #$2f		; a9 2f
B13_080d:		jsr func_08fa		; 20 fa e8
B13_0810:		rts				; 60 


B13_0811:		dec $12			; c6 12
B13_0813:		lda $12			; a5 12
B13_0815:		and #$03		; 29 03
B13_0817:		sta $12			; 85 12
B13_0819:		jmp $a74f		; 4c 4f a7


B13_081c:		lda wChosenCharacter.w		; ad 10 05
B13_081f:		and #$03		; 29 03
B13_0821:		asl a			; 0a
B13_0822:		asl a			; 0a
B13_0823:		tay				; a8 
B13_0824:		lda $a838, y	; b9 38 a8
B13_0827:		sta $0191		; 8d 91 01
B13_082a:		lda $a839, y	; b9 39 a8
B13_082d:		sta $0192		; 8d 92 01
B13_0830:		lda $a83a, y	; b9 3a a8
B13_0833:		sta $0193		; 8d 93 01
B13_0836:		rts				; 60 


B13_0837:	.db $0f
B13_0838:		;removed
	.db $30 $21

B13_083a:	.db $0f
B13_083b:	.db $0f
B13_083c:		;removed
	.db $30 $25

B13_083e:	.db $0f
B13_083f:	.db $0f
B13_0840:		;removed
	.db $30 $29

B13_0842:	.db $0f
B13_0843:	.db $0f
B13_0844:		.db $30 $26

B13_0846:	.db $0f


func_d_0847:
B13_0847:		lda wChosenCharacter.w		; ad 10 05
B13_084a:		and #$03		; 29 03
B13_084c:		tax				; aa 
B13_084d:		asl a			; 0a
B13_084e:		tay				; a8

B13_084f:		lda data_d_085f.w, y	; b9 5f a8
B13_0852:		sta $16			; 85 16
B13_0854:		lda data_d_085f.w+1, y	; b9 60 a8
B13_0857:		sta $17			; 85 17

B13_0859:		lda data_d_0867.w, x	; bd 67 a8
B13_085c:		jmp updateEntity_wOam		; 4c 67 f5

data_d_085f:
	.db $30 $30
	.db $80 $30
	.db $a8 $30
	.db $58 $30

data_d_0867:
	.db $23 $25 $26 $24


func_d_086b:
	lda $10
	bpl B13_0882
B13_086f:		lda $11			; a5 11
B13_0871:		asl a			; 0a
B13_0872:		tay				; a8 
B13_0873:		lda $a89d, y	; b9 9d a8
B13_0876:		sta $16			; 85 16
B13_0878:		lda $a89e, y	; b9 9e a8
B13_087b:		sta $17			; 85 17
B13_087d:		lda #$27		; a9 27
B13_087f:		jmp updateEntity_wOam		; 4c 67 f5


B13_0882:		lda $12			; a5 12
B13_0884:		asl a			; 0a
B13_0885:		tay				; a8 
B13_0886:		lda $a895, y	; b9 95 a8
B13_0889:		sta $16			; 85 16
B13_088b:		lda $a896, y	; b9 96 a8
B13_088e:		sta $17			; 85 17
B13_0890:		lda #$27		; a9 27
B13_0892:		jmp updateEntity_wOam		; 4c 67 f5


B13_0895:		pha				; 48 
B13_0896:		;removed
	.db $50 $70

B13_0898:		;removed
	.db $50 $98

B13_089a:		bvc B13_085c ; 50 c0

B13_089c:		;removed
	.db $50 $3c

B13_089e:	.db $7c
B13_089f:	.db $5c
B13_08a0:	.db $7c
B13_08a1:	.db $3c
B13_08a2:		sty $5c, x		; 94 5c
B13_08a4:		.db $94


// as part of this we draw health
func_d_08a5:
	ldy #$04
B13_08a7:		ldx #$00		; a2 00
B13_08a9:		lda wHCsGotten.w		; ad e2 04
B13_08ac:		lsr a			; 4a
B13_08ad:		bcc B13_08b0 ; 90 01

B13_08af:		inx				; e8 
B13_08b0:		dey				; 88 
B13_08b1:		bne B13_08ac ; d0 f9

B13_08b3:		stx $00			; 86 00
B13_08b5:		lda wFilledHeartContainers.w		; ad e3 04
B13_08b8:		and #$07		; 29 07
B13_08ba:		cmp #$04		; c9 04
B13_08bc:		bcc B13_08c0 ; 90 02

B13_08be:		lda #$04		; a9 04
B13_08c0:		cmp $00			; c5 00
B13_08c2:		bcs B13_08ce ; b0 0a

B13_08c4:		sta $01			; 85 01
B13_08c6:		lda $00			; a5 00
B13_08c8:		sec				; 38 
B13_08c9:		sbc $01			; e5 01
B13_08cb:		jmp $a8d2		; 4c d2 a8

B13_08ce:		sta $01			; 85 01
B13_08d0:		lda #$00		; a9 00

B13_08d2:		sta $00			; 85 00

B13_08d4:		ldy wNextUsableOamIdx.w		; ac 58 01
B13_08d7:		lda #$50		; a9 50
B13_08d9:		sta $02			; 85 02
B13_08db:		lda #$a8		; a9 a8
B13_08dd:		sta $03			; 85 03
B13_08df:		lda $01			; a5 01
B13_08e1:		beq B13_08ec ; f0 09

// full hc
B13_08e3:		lda #$21		; a9 21
B13_08e5:		jsr drawInvHeartContainer		; 20 50 a9
B13_08e8:		dec $01			; c6 01
B13_08ea:		bne B13_08e3 ; d0 f7

B13_08ec:		lda $00			; a5 00
B13_08ee:		beq B13_08f9 ; f0 09

// empty hc
B13_08f0:		lda #$31		; a9 31
B13_08f2:		jsr drawInvHeartContainer		; 20 50 a9
B13_08f5:		dec $00			; c6 00
B13_08f7:		bne B13_08f0 ; d0 f7

B13_08f9:		sty wNextUsableOamIdx.w		; 8c 58 01
B13_08fc:		lda #$00		; a9 00
B13_08fe:		sta $19			; 85 19
B13_0900:		sta $015d		; 8d 5d 01
B13_0903:		lda #$30		; a9 30
B13_0905:		sta $16			; 85 16
B13_0907:		lda #$ae		; a9 ae
B13_0909:		sta $17			; 85 17
B13_090b:		lda #$b5		; a9 b5
B13_090d:		jsr func_1596		; 20 96 f5

// draw player health
B13_0910:		lda wPlayerHealth.w		; ad e5 04
B13_0913:		sta $00			; 85 00

B13_0915:		ldy wNextUsableOamIdx.w		; ac 58 01
B13_0918:		lda #$40		; a9 40
B13_091a:		sta $0203, y	; 99 03 02
B13_091d:		lda #$48		; a9 48
B13_091f:		sta $0207, y	; 99 07 02
B13_0922:		lda #$ae		; a9 ae
B13_0924:		sta $0200, y	; 99 00 02
B13_0927:		sta $0204, y	; 99 04 02
B13_092a:		lda #$00		; a9 00
B13_092c:		sta $0202, y	; 99 02 02
B13_092f:		sta $0206, y	; 99 06 02

// $00 is high/low nybble containing health digits
B13_0932:		lda $00			; a5 00
B13_0934:		and #$f0		; 29 f0
B13_0936:		lsr a			; 4a
B13_0937:		lsr a			; 4a
B13_0938:		lsr a			; 4a
B13_0939:		ora #$01		; 09 01
B13_093b:		sta $0201, y	; 99 01 02

B13_093e:		lda $00			; a5 00
B13_0940:		and #$0f		; 29 0f
B13_0942:		asl a			; 0a
B13_0943:		ora #$01		; 09 01
B13_0945:		sta $0205, y	; 99 05 02

B13_0948:		tya				; 98 
B13_0949:		clc				; 18 
B13_094a:		adc #$08		; 69 08
B13_094c:		sta wNextUsableOamIdx.w		; 8d 58 01
B13_094f:		rts				; 60 


drawInvHeartContainer:
B13_0950:		sta $0201, y	; 99 01 02
B13_0953:		lda #$00		; a9 00
B13_0955:		sta $0202, y	; 99 02 02
B13_0958:		lda $03			; a5 03
B13_095a:		sta $0200, y	; 99 00 02
B13_095d:		lda $02			; a5 02
B13_095f:		sta $0203, y	; 99 03 02
B13_0962:		clc				; 18 
B13_0963:		adc #$08		; 69 08
B13_0965:		sta $02			; 85 02
B13_0967:		tya				; 98 
B13_0968:		clc				; 18 
B13_0969:		adc #$04		; 69 04
B13_096b:		tay				; a8 
B13_096c:		rts				; 60 


B13_096d:		sta $af			; 85 af
B13_096f:		lda #$01		; a9 01
B13_0971:		sta $00			; 85 00
B13_0973:		lda wPlayerHealth.w		; ad e5 04
B13_0976:		jsr func_0872		; 20 72 e8
B13_0979:		sta wPlayerHealth.w		; 8d e5 04
B13_097c:		bcc B13_09b0 ; 90 32

B13_097e:		ldy #$04		; a0 04
B13_0980:		lda #$00		; a9 00
B13_0982:		sta $00			; 85 00
B13_0984:		lda wHCsGotten.w		; ad e2 04
B13_0987:		lsr a			; 4a
B13_0988:		bcc B13_098c ; 90 02

B13_098a:		inc $00			; e6 00
B13_098c:		dey				; 88 
B13_098d:		bne B13_0987 ; d0 f8

B13_098f:		inc wFilledHeartContainers.w		; ee e3 04
B13_0992:		lda wFilledHeartContainers.w		; ad e3 04
B13_0995:		and #$07		; 29 07
B13_0997:		cmp $00			; c5 00
B13_0999:		bcc B13_09b0 ; 90 15

B13_099b:		beq B13_09b0 ; f0 13

B13_099d:		lda wFilledHeartContainers.w		; ad e3 04
B13_09a0:		and #$f8		; 29 f8
B13_09a2:		ora $00			; 05 00
B13_09a4:		sta wFilledHeartContainers.w		; 8d e3 04
B13_09a7:		lda #$49		; a9 49
B13_09a9:		sta wPlayerHealth.w		; 8d e5 04
B13_09ac:		lda #$01		; a9 01
B13_09ae:		sta $af			; 85 af
B13_09b0:		jsr $a847		; 20 47 a8
B13_09b3:		jsr func_d_086b		; 20 6b a8
B13_09b6:		jsr func_d_08a5		; 20 a5 a8
B13_09b9:		lda #$39		; a9 39
B13_09bb:		jsr func_08fa		; 20 fa e8
B13_09be:		ldx #$04		; a2 04
B13_09c0:		jsr func_0530		; 20 30 e5
B13_09c3:		jsr wOam_outOfYbounds		; 20 6a e5
B13_09c6:		dec $af			; c6 af
B13_09c8:		bne B13_096f ; d0 a5

B13_09ca:		rts				; 60 


B13_09cb:		jsr wOam_outOfYbounds		; 20 6a e5
B13_09ce:		lda #$01		; a9 01
B13_09d0:		jsr func_0578		; 20 78 e5
B13_09d3:		jsr func_e_1fda		; 20 da df
B13_09d6:		lda #$51		; a9 51
B13_09d8:		jsr fillFirst3nametablesWithA_clearPalettes		; 20 74 df
B13_09db:		lda #$21		; a9 21
B13_09dd:		jsr drawStaticLayoutIdxedY		; 20 76 fc
B13_09e0:		lda #$22		; a9 22
B13_09e2:		jsr drawStaticLayoutIdxedY		; 20 76 fc
B13_09e5:		jsr loadFollowingDataIntoInternalPalettes2BG		; 20 c9 e3
	.db $0f
	.db $30 $10 $00
	.db $30 $10 $21
	.db $30 $10 $15
	.db $30 $10 $29

B13_09f5:		jsr loadFollowingDataIntoInternalPalettes2Spr
	.db $30 $10 $21
	.db $30 $10 $25
	.db $30 $10 $29
	.db $30 $10 $0f

B13_0a04:		jsr func_e_1fcf		; 20 cf df
B13_0a07:		lda #$01		; a9 01
B13_0a09:		jsr func_05cb		; 20 cb e5
B13_0a0c:		jsr func_052e		; 20 2e e5
B13_0a0f:		lda #$00		; a9 00
B13_0a11:		sta wNextUsableOamIdx.w		; 8d 58 01
B13_0a14:		sta $0159		; 8d 59 01
B13_0a17:		lda wJoy1NewButtonsPressed.w		; ad 54 01
B13_0a1a:		and #$20		; 29 20
B13_0a1c:		bne B13_0a27 ; d0 09

B13_0a1e:		jsr wOam_outOfYbounds		; 20 6a e5
B13_0a21:		jsr $aa2f		; 20 2f aa
B13_0a24:		jmp $aa0c		; 4c 0c aa


B13_0a27:		pla				; 68 
B13_0a28:		pla				; 68 
B13_0a29:		jsr func_d_0699		; 20 99 a6
B13_0a2c:		jmp $a516		; 4c 16 a5


B13_0a2f:		lda #$33		; a9 33
B13_0a31:		jsr checkGlobalFlag		; 20 e9 e7
B13_0a34:		beq B13_0a3b ; f0 05

B13_0a36:		lda #$00		; a9 00
B13_0a38:		jsr $aa76		; 20 76 aa
B13_0a3b:		lda #$34		; a9 34
B13_0a3d:		jsr checkGlobalFlag		; 20 e9 e7
B13_0a40:		beq B13_0a47 ; f0 05

B13_0a42:		lda #$01		; a9 01
B13_0a44:		jsr $aa76		; 20 76 aa
B13_0a47:		lda #$35		; a9 35
B13_0a49:		jsr checkGlobalFlag		; 20 e9 e7
B13_0a4c:		beq B13_0a53 ; f0 05

B13_0a4e:		lda #$02		; a9 02
B13_0a50:		jsr $aa76		; 20 76 aa
B13_0a53:		lda #$32		; a9 32
B13_0a55:		jsr checkGlobalFlag		; 20 e9 e7
B13_0a58:		beq B13_0a5d ; f0 03

B13_0a5a:		jsr $aaad		; 20 ad aa
B13_0a5d:		lda #$38		; a9 38
B13_0a5f:		jsr checkGlobalFlag		; 20 e9 e7
B13_0a62:		beq B13_0a67 ; f0 03

B13_0a64:		jsr $aa9a		; 20 9a aa
B13_0a67:		lda wGlobalFlags.w		; ad e0 04
B13_0a6a:		and #$e0		; 29 e0
B13_0a6c:		cmp #$e0		; c9 e0
B13_0a6e:		bne B13_0a75 ; d0 05

B13_0a70:		lda #$13		; a9 13
B13_0a72:		jsr $aa76		; 20 76 aa
B13_0a75:		rts				; 60 


B13_0a76:		asl a			; 0a
B13_0a77:		asl a			; 0a
B13_0a78:		sta $af			; 85 af
B13_0a7a:		tay				; a8 
B13_0a7b:		lda $ab82, y	; b9 82 ab
B13_0a7e:		jsr checkGlobalFlag		; 20 e9 e7
B13_0a81:		bne B13_0a99 ; d0 16

B13_0a83:		ldy $af			; a4 af
B13_0a85:		lda $ab83, y	; b9 83 ab
B13_0a88:		sta $16			; 85 16
B13_0a8a:		lda $ab84, y	; b9 84 ab
B13_0a8d:		sta $17			; 85 17
B13_0a8f:		lda $ab85, y	; b9 85 ab
B13_0a92:		sta $2b			; 85 2b
B13_0a94:		lda #$cd		; a9 cd
B13_0a96:		jsr updateEntity_wOam		; 20 67 f5
B13_0a99:		rts				; 60 


B13_0a9a:		lda #$03		; a9 03
B13_0a9c:		sta $ae			; 85 ae
B13_0a9e:		lda $ae			; a5 ae
B13_0aa0:		cmp #$13		; c9 13
B13_0aa2:		beq B13_0aac ; f0 08

B13_0aa4:		jsr $aa76		; 20 76 aa
B13_0aa7:		inc $ae			; e6 ae
B13_0aa9:		jmp $aa9e		; 4c 9e aa


B13_0aac:		rts				; 60 


B13_0aad:		lda wCurrRoomGroup.w		; ad 62 01
B13_0ab0:		jsr jumpTable		; 20 a6 e6
	.dw $aac9
	.dw $aac9
	.dw $aada
	.dw $aae1
	.dw $aae8
	.dw $aaef
	.dw $aac9
	.dw $aaf6
	.dw $aac9
	.dw $aac9
	.dw $aafd
B13_0ac9:		lda $0500
B13_0acc:		and #$f0
B13_0ace:		sta $aa
B13_0ad0:		lda $0502		; ad 02 05
B13_0ad3:		and #$f0		; 29 f0
B13_0ad5:		sta $ab			; 85 ab
B13_0ad7:		jmp $ab15		; 4c 15 ab


B13_0ada:		ldy #$00		; a0 00
B13_0adc:		ldx #$0c		; a2 0c
B13_0ade:		jmp $ab39		; 4c 39 ab


B13_0ae1:		ldy #$30		; a0 30
B13_0ae3:		ldx #$0d		; a2 0d
B13_0ae5:		jmp $ab39		; 4c 39 ab


B13_0ae8:		ldy #$64		; a0 64
B13_0aea:		ldx #$11		; a2 11
B13_0aec:		jmp $ab39		; 4c 39 ab


B13_0aef:		ldy #$a8		; a0 a8
B13_0af1:		ldx #$02		; a2 02
B13_0af3:		jmp $ab39		; 4c 39 ab


B13_0af6:		ldy #$b0		; a0 b0
B13_0af8:		ldx #$04		; a2 04
B13_0afa:		jmp $ab39		; 4c 39 ab


B13_0afd:		lda $0500		; ad 00 05
B13_0b00:		and #$f0		; 29 f0
B13_0b02:		cmp #$80		; c9 80
B13_0b04:		bcc B13_0b09 ; 90 03

B13_0b06:		sec				; 38 
B13_0b07:		sbc #$80		; e9 80
B13_0b09:		sta $aa			; 85 aa
B13_0b0b:		lda $0502		; ad 02 05
B13_0b0e:		and #$f0		; 29 f0
B13_0b10:		sta $ab			; 85 ab
B13_0b12:		jmp $ab15		; 4c 15 ab


B13_0b15:		lda wCurrRoomGroup.w		; ad 62 01
B13_0b18:		asl a			; 0a
B13_0b19:		tay				; a8 
B13_0b1a:		lda $abd2, y	; b9 d2 ab
B13_0b1d:		sta $ac			; 85 ac
B13_0b1f:		lda $abd3, y	; b9 d3 ab
B13_0b22:		sta $ad			; 85 ad
B13_0b24:		lda $aa			; a5 aa
B13_0b26:		lsr a			; 4a
B13_0b27:		lsr a			; 4a
B13_0b28:		clc				; 18 
B13_0b29:		adc $ac			; 65 ac
B13_0b2b:		sta $16			; 85 16
B13_0b2d:		lda $ab			; a5 ab
B13_0b2f:		lsr a			; 4a
B13_0b30:		lsr a			; 4a
B13_0b31:		clc				; 18 
B13_0b32:		adc $ad			; 65 ad
B13_0b34:		sta $17			; 85 17
B13_0b36:		jmp $ab6c		; 4c 6c ab


B13_0b39:		lda $0500		; ad 00 05
B13_0b3c:		and #$f0		; 29 f0
B13_0b3e:		sta $aa			; 85 aa
B13_0b40:		lda $0502		; ad 02 05
B13_0b43:		and #$f0		; 29 f0
B13_0b45:		sta $ab			; 85 ab
B13_0b47:		lda $aa			; a5 aa
B13_0b49:		cmp $abe8, y	; d9 e8 ab
B13_0b4c:		bne B13_0b62 ; d0 14

B13_0b4e:		lda $ab			; a5 ab
B13_0b50:		cmp $abe9, y	; d9 e9 ab
B13_0b53:		bne B13_0b62 ; d0 0d

B13_0b55:		lda $abea, y	; b9 ea ab
B13_0b58:		sta $16			; 85 16
B13_0b5a:		lda $abeb, y	; b9 eb ab
B13_0b5d:		sta $17			; 85 17
B13_0b5f:		jmp $ab6c		; 4c 6c ab


B13_0b62:		iny				; c8 
B13_0b63:		iny				; c8 
B13_0b64:		iny				; c8 
B13_0b65:		iny				; c8 
B13_0b66:		dex				; ca 
B13_0b67:		bne B13_0b47 ; d0 de

B13_0b69:		jmp $ab15		; 4c 15 ab


B13_0b6c:		lda #$82		; a9 82
B13_0b6e:		sta $2b			; 85 2b
B13_0b70:		lda #$cd		; a9 cd
B13_0b72:		jsr updateEntity_wOam		; 20 67 f5
B13_0b75:		lda $015a		; ad 5a 01
B13_0b78:		and #$08		; 29 08
B13_0b7a:		bne B13_0b81 ; d0 05

B13_0b7c:		lda #$ce		; a9 ce
B13_0b7e:		jmp updateEntity_wOam		; 4c 67 f5


B13_0b81:		rts				; 60 


B13_0b82:		ora $9c			; 05 9c
B13_0b84:	.db $9c
B13_0b85:	.db $80
B13_0b86:		asl $44			; 06 44
B13_0b88:		dey				; 88 
B13_0b89:	.db $80
B13_0b8a:	.db $07
B13_0b8b:		rti				; 40 


B13_0b8c:	.db $5c
B13_0b8d:	.db $80
B13_0b8e:		;removed
	.db $10 $44

B13_0b90:		tya				; 98 
B13_0b91:		sta ($11, x)	; 81 11
B13_0b93:		;removed
	.db $50 $7c

B13_0b95:		sta ($12, x)	; 81 12
B13_0b97:		;removed
	.db $30 $88

B13_0b99:		sta ($13, x)	; 81 13
B13_0b9b:		sec				; 38 
B13_0b9c:	.db $5c
B13_0b9d:		sta ($39, x)	; 81 39
B13_0b9f:	.db $64
B13_0ba0:	.db $7c
B13_0ba1:		sta ($02, x)	; 81 02
B13_0ba3:	.db $80
B13_0ba4:	.db $74
B13_0ba5:		sta ($03, x)	; 81 03
B13_0ba7:		cpy #$84		; c0 84
B13_0ba9:		sta ($01, x)	; 81 01
B13_0bab:	.db $3c
B13_0bac:		tay				; a8 
B13_0bad:		sta ($33, x)	; 81 33
B13_0baf:		jmp ($819c)		; 6c 9c 81


B13_0bb2:	.db $34
B13_0bb3:		ldy $8184		; ac 84 81
B13_0bb6:		and $6c, x		; 35 6c
B13_0bb8:		sty $0481		; 8c 81 04
B13_0bbb:		sty $58			; 84 58
B13_0bbd:		sta ($32, x)	; 81 32
B13_0bbf:		pla				; 68 
B13_0bc0:		sty $81, x		; 94 81
B13_0bc2:		bmi B13_0c24 ; 30 60

B13_0bc4:	.db $74
B13_0bc5:		sta ($31, x)	; 81 31
B13_0bc7:	.db $80
B13_0bc8:	.db $7c
B13_0bc9:		sta ($38, x)	; 81 38
B13_0bcb:	.db $7c
B13_0bcc:		cli				; 58 
B13_0bcd:		sta ($14, x)	; 81 14
B13_0bcf:		;removed
	.db $50 $6c

B13_0bd1:	.db $80
B13_0bd2:		pha				; 48 
B13_0bd3:		bvs B13_0b65 ; 70 90

B13_0bd5:		rts				; 60 


B13_0bd6:		tya				; 98 
B13_0bd7:		tya				; 98 
B13_0bd8:	.db $7c
B13_0bd9:		cli				; 58 
B13_0bda:		;removed
	.db $30 $98

B13_0bdc:	.db $64
B13_0bdd:		dey				; 88 
B13_0bde:		.db $00				; 00
B13_0bdf:		.db $00				; 00
B13_0be0:		ldy #$68		; a0 68
B13_0be2:		.db $00				; 00
B13_0be3:		.db $00				; 00
B13_0be4:		bmi B13_0b66 ; 30 80

B13_0be6:		bmi B13_0c40 ; 30 58

B13_0be8:		bvc B13_0bea ; 50 00

B13_0bea:	.db $9c
B13_0beb:	.db $9c
B13_0bec:		rts				; 60 


B13_0bed:		.db $00				; 00
B13_0bee:	.db $9c
B13_0bef:	.db $9c
B13_0bf0:		bvs B13_0bf2 ; 70 00

B13_0bf2:	.db $9c
B13_0bf3:	.db $9c
B13_0bf4:		bvc B13_0c16 ; 50 20

B13_0bf6:		rti				; 40 


B13_0bf7:	.db $5c
B13_0bf8:		rts				; 60 


B13_0bf9:		jsr $5c40		; 20 40 5c
B13_0bfc:		;removed
	.db $70 $20

B13_0bfe:		rti				; 40 


B13_0bff:	.db $5c
B13_0c00:		.db $00				; 00
B13_0c01:		;removed
	.db $30 $48

B13_0c03:		jmp ($3010)		; 6c 10 30


B13_0c06:		jmp $206c		; 4c 6c 20


B13_0c09:		bmi B13_0c5b ; 30 50

B13_0c0b:		jmp ($3030)		; 6c 30 30


B13_0c0e:	.db $54
B13_0c0f:		jmp ($3040)		; 6c 40 30


B13_0c12:		cli				; 58 
B13_0c13:	.db $6c $e0 $00
B13_0c16:		;removed
	.db $50 $6c

B13_0c18:		;removed
	.db $d0 $b0

B13_0c1a:		cli				; 58 
B13_0c1b:		sty $d0			; 84 d0
B13_0c1d:		beq B13_0c77 ; f0 58

B13_0c1f:		sty $b0, x		; 94 b0
B13_0c21:		.db $00				; 00
B13_0c22:		;removed
	.db $50 $98

B13_0c24:		cpy #$00		; c0 00
B13_0c26:	.db $54
B13_0c27:		tya				; 98 
B13_0c28:		bne B13_0c2a ; d0 00

B13_0c2a:		cli				; 58 
B13_0c2b:		tya				; 98 
B13_0c2c:		cpx #$00		; e0 00
B13_0c2e:	.db $5c
B13_0c2f:		tya				; 98 
B13_0c30:		beq B13_0c32 ; f0 00

B13_0c32:		rts				; 60 


B13_0c33:		tya				; 98 
B13_0c34:		cpy #$10		; c0 10
B13_0c36:	.db $54
B13_0c37:	.db $9c
B13_0c38:		;removed
	.db $d0 $10

B13_0c3a:		cli				; 58 
B13_0c3b:	.db $9c
B13_0c3c:		cpx #$10		; e0 10
B13_0c3e:	.db $5c
B13_0c3f:	.db $9c
B13_0c40:	.db $80
B13_0c41:		.db $00				; 00
B13_0c42:		.db $00				; 00
B13_0c43:		sed				; f8 
B13_0c44:	.db $80
B13_0c45:		bpl B13_0c47 ; 10 00

B13_0c47:		sed				; f8 
B13_0c48:	.db $80
B13_0c49:		jsr $f800		; 20 00 f8
B13_0c4c:	.db $80
B13_0c4d:		.db $00				; 00
B13_0c4e:		pla				; 68 
B13_0c4f:	.db $74
B13_0c50:		bcc B13_0c52 ; 90 00

B13_0c52:		jmp ($a074)		; 6c 74 a0


B13_0c55:		.db $00				; 00
B13_0c56:		.db $70 $74

B13_0c58:		bcs B13_0c5a ; b0 00

B13_0c5a:	.db $74
B13_0c5b:	.db $74
B13_0c5c:		cpy #$00		; c0 00
B13_0c5e:		sei				; 78 
B13_0c5f:	.db $74
B13_0c60:		;removed
	.db $90 $10

B13_0c62:		jmp ($a078)		; 6c 78 a0


B13_0c65:		.db $10 $70

B13_0c67:		sei				; 78 
B13_0c68:		;removed
	.db $b0 $10

B13_0c6a:	.db $74
B13_0c6b:		sei				; 78 
B13_0c6c:		ldy #$20		; a0 20
B13_0c6e:		sec				; 38 
B13_0c6f:		ldy #$b0		; a0 b0
B13_0c71:		jsr $a03c		; 20 3c a0
B13_0c74:		cpy #$20		; c0 20
B13_0c76:		rti				; 40 


B13_0c77:		ldy #$a0		; a0 a0
B13_0c79:		.db $30 $38

B13_0c7b:		ldy $b0			; a4 b0
B13_0c7d:		;removed
	.db $30 $3c

B13_0c7f:		ldy $c0			; a4 c0
B13_0c81:		.db $30 $40

B13_0c83:		ldy $a0			; a4 a0
B13_0c85:		rti				; 40 


B13_0c86:		sec				; 38 
B13_0c87:		tay				; a8 
B13_0c88:		.db $b0 $40

B13_0c8a:	.db $3c
B13_0c8b:		tay				; a8 
B13_0c8c:		cpy #$40		; c0 40
B13_0c8e:		rti				; 40 


B13_0c8f:		tay				; a8 
B13_0c90:	.db $80
B13_0c91:		.db $00				; 00
B13_0c92:		jmp ($908c)		; 6c 8c 90


B13_0c95:		.db $00				; 00
B13_0c96:		jmp ($b08c)		; 6c 8c b0


B13_0c99:		bmi B13_0c47 ; 30 ac

B13_0c9b:	.db $74
B13_0c9c:		cpy #$30		; c0 30
B13_0c9e:		.db $b0 $74

B13_0ca0:		.db $d0 $30

B13_0ca2:		ldy $74, x		; b4 74
B13_0ca4:		cpy #$40		; c0 40
B13_0ca6:		.db $b0 $78


func_d_0ca8:
B13_0ca8:		jsr wOam_outOfYbounds		; 20 6a e5
B13_0cab:		lda #$01		; a9 01
B13_0cad:		jsr func_0578		; 20 78 e5
B13_0cb0:		jsr func_e_1fda		; 20 da df

// password screen brick tile
	lda #$51
	jsr fillFirst3nametablesWithA_clearPalettes

	lda #SL_invPasswordScreen
	jsr drawStaticLayoutIdxedY

	jsr genBytesForPasswordDisplay
	jsr drawInvPasswordCircles

	jsr loadFollowingDataIntoInternalPalettes2BG
	.db $0f
	.db $30 $10 $00
	.db $30 $10 $21
	.db $30 $10 $15
	.db $30 $10 $29

	jsr loadFollowingDataIntoInternalPalettes2Spr
	.db $30 $10 $0f
	.db $30 $10 $21
	.db $30 $10 $15
	.db $30 $10 $29

B13_0ce2:		jsr func_e_1fcf
B13_0ce5:		lda #$01		; a9 01
B13_0ce7:		jsr func_05cb		; 20 cb e5
@passwordScreenLoop:
B13_0cea:		jsr func_052e		; 20 2e e5
B13_0ced:		lda #$00		; a9 00
B13_0cef:		sta wNextUsableOamIdx.w		; 8d 58 01
B13_0cf2:		sta $0159		; 8d 59 01
	lda wJoy1NewButtonsPressed.w
	and #PADF_SELECT
B13_0cfa:		bne B13_0d02 ; d0 06

B13_0cfc:		jsr wOam_outOfYbounds		; 20 6a e5
B13_0cff:		jmp $acea		; @passwordScreenLoop

// exit password screen
B13_0d02:		pla				; 68 
B13_0d03:		pla				; 68 
B13_0d04:		jsr func_d_0699		; 20 99 a6
B13_0d07:		jmp $a516		; 4c 16 a5


genBytesForPasswordDisplay:
// add together the 1st 8 global flags
	lda #$00
	tax
-	clc
	adc wGlobalFlags.w, x
	inx
	cpx #$08
	bne -

	sta wPasswordSumByte.w

// from 4c4 to 4cb, store in it the 1st 8 global flags, plus the byte
// from (above sum+$e000)
	tay
	ldx #$00
-	lda $e000, y
	clc
	adc wGlobalFlags.w, x
	sta wPasswordGlobalFlagBytes.w, x
	inx
	iny
	cpx #$08
	bne -

// loop 9 times, storing data in 4a0-4c3 (36 bytes, 1 byte per password square)
	ldx #$00
	ldy #$00

@bigLoop:
// for each byte from 4c4 to 4cc, put in 0
// low 2 bits in 4a0+y
	lda wPasswordGlobalFlagBytes.w, x
	sta wCurrInvPasswordByte
	and #$03
	sta wPasswordGridCircleVals.w, y

// next 2 bits in 4a1+y
	lsr wCurrInvPasswordByte
	lsr wCurrInvPasswordByte
	lda wCurrInvPasswordByte
	and #$03
	sta wPasswordGridCircleVals.w+1, y

// next 2 bits in 4a2+y
	lsr wCurrInvPasswordByte
	lsr wCurrInvPasswordByte
	lda wCurrInvPasswordByte
	and #$03
	sta wPasswordGridCircleVals.w+2, y

// next 2 bits in 4a3+y
	lsr wCurrInvPasswordByte
	lsr wCurrInvPasswordByte
	lda wCurrInvPasswordByte
	and #$03
	sta wPasswordGridCircleVals.w+3, y

// next x and y's for each of 1st 8 global flag bytes, and sum byte
	inx
	iny
	iny
	iny
	iny
	cpx #$09
	bne @bigLoop

	rts


drawInvPasswordCircles:
	lda #$00
	sta wInvPasswordCircleIdx
// loop until $00 = 36 (number of dots on screen)
@bigLoop:
// get the 2-bit bytedata from 4a0 region, skipping to next if it's 0
	ldy wInvPasswordCircleIdx
	lda wPasswordGridCircleVals.w, y
	beq @toNextGridByte

// data byte in 0f
	sta wCurr2bitPasswordByte

// get 4 bytes for data byte idx
	lda wInvPasswordCircleIdx
	asl a
	asl a
	tay
// 1st/2nd byte in $01/$02 and used to set ppuaddr big-endian
	lda passwordGridAddresses.w, y
	sta wInvPasswordCirclePPUAddrBE
	sta PPUADDR
	lda passwordGridAddresses.w+1, y
	sta wInvPasswordCirclePPUAddrBE+1
	sta PPUADDR

// 2 bytes for data, as each circle is 2 tiles
	lda #$0c
	sta PPUDATA
	lda #$1c
	sta PPUDATA

// get addresses again to store the bottom half of above 2 tiles
	lda wInvPasswordCirclePPUAddrBE
	sta PPUADDR
	lda wInvPasswordCirclePPUAddrBE+1
	clc
	adc #$20
	sta PPUADDR
	lda #$0d
	sta PPUDATA
	lda #$1d
	sta PPUDATA

// 3rd byte is low byte of palette idx, stored in $04
	lda #$23
	sta PPUADDR
	lda passwordGridAddresses.w+2, y
	sta PPUADDR
	sta wInvPasswordPaletteAddrLowByte
// $03 is palette at curr addr
	lda PPUDATA
	lda PPUDATA
	sta wInvPasswordCurrPaletteByte
// 4th byte, store in $02
	lda passwordGridAddresses.w+3, y
	tay
	sta wInvPasswordCurrCirclePaletteShiftCnt
// get bitmask based on 4th byte
	lda invPasswordGridCirclePaletteBitmask.w, y
	and wInvPasswordCurrPaletteByte
	sta wInvPassword64x64paletteVal

// check 4th byte, shift left the data byte that many times
-	lda wInvPasswordCurrCirclePaletteShiftCnt
	beq @afterCurrCirclePaletteShift

	asl wCurr2bitPasswordByte
	asl wCurr2bitPasswordByte
	dec wInvPasswordCurrCirclePaletteShiftCnt
	jmp -

@afterCurrCirclePaletteShift:
// go back to original palette idx
	lda #$23
	sta PPUADDR
	lda wInvPasswordPaletteAddrLowByte
	sta PPUADDR
// get shifted byte data, or with a mask of the current palette
	lda wCurr2bitPasswordByte
	ora wInvPassword64x64paletteVal
	sta PPUDATA
@toNextGridByte:
	inc wInvPasswordCircleIdx
	lda wInvPasswordCircleIdx
	cmp #$24
	beq +
	jmp @bigLoop
+	rts


B13_0df4:		lda #$00		; a9 00
B13_0df6:		sta $28			; 85 28
B13_0df8:		lda #$51		; a9 51
B13_0dfa:		jsr fillFirst3nametablesWithA_clearPalettes		; 20 74 df
B13_0dfd:		lda #$23		; a9 23
B13_0dff:		jsr drawStaticLayoutIdxedY		; 20 76 fc
B13_0e02:		lda #$24		; a9 24
B13_0e04:		jsr drawStaticLayoutIdxedY		; 20 76 fc
B13_0e07:		lda #$25		; a9 25
B13_0e09:		jsr drawStaticLayoutIdxedY		; 20 76 fc
B13_0e0c:		jsr wOam_outOfYbounds		; 20 6a e5
B13_0e0f:		ldx #$23		; a2 23
B13_0e11:		lda #$00		; a9 00
B13_0e13:		sta wPasswordGridCircleVals.w, x	; 9d a0 04
B13_0e16:		dex				; ca 
B13_0e17:		bpl B13_0e13 ; 10 fa

	jsr loadFollowingDataIntoInternalPalettes2BG
	.db $0f
	.db $30 $10 $00
	.db $30 $10 $21
	.db $30 $10 $15
	.db $30 $10 $29

	jsr loadFollowingDataIntoInternalPalettes2Spr
	.db $30 $10 $00
	.db $30 $21 $0f
	.db $30 $10 $00
	.db $30 $10 $00

B13_0e38:		lda #$3c		; a9 3c
B13_0e3a:		sta wShadow2KBChrBank0.w		; 8d 69 01
B13_0e3d:		lda #$3e		; a9 3e
B13_0e3f:		sta wShadow2KBChrBank1.w		; 8d 6a 01
B13_0e42:		lda #$7f		; a9 7f
B13_0e44:		sta wShadow1KBChrBank0.w		; 8d 6b 01
B13_0e47:		lda #$62		; a9 62
B13_0e49:		sta wShadow1KBChrBank1.w		; 8d 6c 01
B13_0e4c:		lda #$00		; a9 00
B13_0e4e:		sta $015d		; 8d 5d 01
B13_0e51:		sta $19			; 85 19
B13_0e53:		sta wNextUsableOamIdx.w		; 8d 58 01
B13_0e56:		ldx #$1f		; a2 1f
B13_0e58:		sta $0520, x	; 9d 20 05
B13_0e5b:		dex				; ca 
B13_0e5c:		bpl B13_0e58 ; 10 fa

B13_0e5e:		jsr func_e_1fcf		; 20 cf df
B13_0e61:		lda #$05		; a9 05
B13_0e63:		jsr func_08e5		; 20 e5 e8
B13_0e66:		lda #$01		; a9 01
B13_0e68:		jsr func_05cb		; 20 cb e5
B13_0e6b:		lda #$00		; a9 00
B13_0e6d:		sta $18			; 85 18
B13_0e6f:		sta $1a			; 85 1a
B13_0e71:		sta $10			; 85 10
B13_0e73:		sta $11			; 85 11
B13_0e75:		sta $13			; 85 13
B13_0e77:		jsr func_052e		; 20 2e e5
B13_0e7a:		lda #$00		; a9 00
B13_0e7c:		sta wNextUsableOamIdx.w		; 8d 58 01
B13_0e7f:		sta $0159		; 8d 59 01
B13_0e82:		jsr wOam_outOfYbounds		; 20 6a e5
B13_0e85:		lda $18			; a5 18
B13_0e87:		jsr jumpTable_retFollowing		; 20 bc e6
	.dw func_d_0e96
	.dw $aeec
	.dw $b091
	.dw $b124
	.dw $b047
	.dw $b06c

func_d_0e96:
	lda $13
B13_0e98:		asl a			; 0a
B13_0e99:		sta $00			; 85 00
B13_0e9b:		asl a			; 0a
B13_0e9c:		clc				; 18 
B13_0e9d:		adc $00			; 65 00
B13_0e9f:		clc				; 18 
B13_0ea0:		adc $11			; 65 11
B13_0ea2:		sta $1b			; 85 1b
B13_0ea4:		jsr $aeaa		; 20 aa ae
B13_0ea7:		jmp $ae77		; 4c 77 ae


B13_0eaa:		ldy $11			; a4 11
B13_0eac:		lda $aee0, y	; b9 e0 ae
B13_0eaf:		clc				; 18 
B13_0eb0:		adc #$0c		; 69 0c
B13_0eb2:		sta $16			; 85 16
B13_0eb4:		ldy $13			; a4 13
B13_0eb6:		lda $aee6, y	; b9 e6 ae
B13_0eb9:		clc				; 18 
B13_0eba:		adc #$14		; 69 14
B13_0ebc:		sta $17			; 85 17
B13_0ebe:		lda #$27		; a9 27
B13_0ec0:		jsr updateEntity_wOam		; 20 67 f5
B13_0ec3:		lda $10			; a5 10
B13_0ec5:		asl a			; 0a
B13_0ec6:		tay				; a8 
B13_0ec7:		lda $aed6, y	; b9 d6 ae
B13_0eca:		sta $16			; 85 16
B13_0ecc:		lda $aed7, y	; b9 d7 ae
B13_0ecf:		sta $17			; 85 17
B13_0ed1:		lda #$27		; a9 27
B13_0ed3:		jmp updateEntity_wOam		; 4c 67 f5


B13_0ed6:		bit $2c44		; 2c 44 2c
B13_0ed9:	.db $64
B13_0eda:		bit $2c84		; 2c 84 2c
B13_0edd:		ldy $2c			; a4 2c
B13_0edf:		cpy $60			; c4 60
B13_0ee1:		bvs B13_0e63 ; 70 80

B13_0ee3:		bcc B13_0e85 ; 90 a0

B13_0ee5:		bcs B13_0f37 ; b0 50

B13_0ee7:		rts				; 60 


B13_0ee8:		;removed
	.db $70 $80

B13_0eea:		.db $90 $a0

B13_0eec:		lda wJoy1NewButtonsPressed.w		; ad 54 01
B13_0eef:		sta $0f			; 85 0f
B13_0ef1:		lsr $0f			; 46 0f
B13_0ef3:		bcc B13_0ef8 ; 90 03

B13_0ef5:		jsr $af44		; 20 44 af
B13_0ef8:		lsr $0f			; 46 0f
B13_0efa:		bcc B13_0eff ; 90 03

B13_0efc:		jsr $af55		; 20 55 af
B13_0eff:		lsr $0f			; 46 0f
B13_0f01:		bcc B13_0f06 ; 90 03

B13_0f03:		jsr $af33		; 20 33 af
B13_0f06:		lsr $0f			; 46 0f
B13_0f08:		bcc B13_0f0d ; 90 03

B13_0f0a:		jsr $af26		; 20 26 af
B13_0f0d:		lda #$20		; a9 20
B13_0f0f:		bit wJoy1NewButtonsPressed.w		; 2c 54 01
B13_0f12:		bmi B13_0f73 ; 30 5f

B13_0f14:		bvc B13_0f19 ; 50 03

B13_0f16:		jmp $b034		; 4c 34 b0


B13_0f19:		bne B13_0f62 ; d0 47

B13_0f1b:		lda wJoy1NewButtonsPressed.w		; ad 54 01
B13_0f1e:		and #$10		; 29 10
B13_0f20:		beq B13_0f25 ; f0 03

B13_0f22:		jmp $afa1		; 4c a1 af


B13_0f25:		rts				; 60 


B13_0f26:		dec $13			; c6 13
B13_0f28:		bpl B13_0f2e ; 10 04

B13_0f2a:		lda #$05		; a9 05
B13_0f2c:		sta $13			; 85 13
B13_0f2e:		lda #$2f		; a9 2f
B13_0f30:		jmp func_08fa		; 4c fa e8


B13_0f33:		inc $13			; e6 13
B13_0f35:		lda $13			; a5 13
B13_0f37:		cmp #$06		; c9 06
B13_0f39:		bne B13_0f3f ; d0 04

B13_0f3b:		lda #$00		; a9 00
B13_0f3d:		sta $13			; 85 13
B13_0f3f:		lda #$2f		; a9 2f
B13_0f41:		jmp func_08fa		; 4c fa e8


B13_0f44:		inc $11			; e6 11
B13_0f46:		lda $11			; a5 11
B13_0f48:		cmp #$06		; c9 06
B13_0f4a:		bne B13_0f50 ; d0 04

B13_0f4c:		lda #$00		; a9 00
B13_0f4e:		sta $11			; 85 11
B13_0f50:		lda #$2f		; a9 2f
B13_0f52:		jmp func_08fa		; 4c fa e8


B13_0f55:		dec $11			; c6 11
B13_0f57:		bpl B13_0f5d ; 10 04

B13_0f59:		lda #$05		; a9 05
B13_0f5b:		sta $11			; 85 11
B13_0f5d:		lda #$2f		; a9 2f
B13_0f5f:		jmp func_08fa		; 4c fa e8


B13_0f62:		inc $10			; e6 10
B13_0f64:		lda $10			; a5 10
B13_0f66:		cmp #$05		; c9 05
B13_0f68:		bne B13_0f6e ; d0 04

B13_0f6a:		lda #$00		; a9 00
B13_0f6c:		sta $10			; 85 10
B13_0f6e:		lda #$2e		; a9 2e
B13_0f70:		jmp func_08fa		; 4c fa e8


B13_0f73:		lda $10			; a5 10
B13_0f75:		cmp #$03		; c9 03
B13_0f77:		bne B13_0f7c ; d0 03

B13_0f79:		jmp $afa1		; 4c a1 af


B13_0f7c:		cmp #$04		; c9 04
B13_0f7e:		bne B13_0f83 ; d0 03

B13_0f80:		jmp $b01e		; 4c 1e b0


B13_0f83:		ldy $1b			; a4 1b
B13_0f85:		lda $10			; a5 10
B13_0f87:		clc				; 18 
B13_0f88:		adc #$01		; 69 01
B13_0f8a:		and #$03		; 29 03
B13_0f8c:		cmp wPasswordGridCircleVals.w, y	; d9 a0 04
B13_0f8f:		beq B13_0f9c ; f0 0b

B13_0f91:		jsr $b194		; 20 94 b1
B13_0f94:		lda #$03		; a9 03
B13_0f96:		sta $18			; 85 18
B13_0f98:		lda #$0c		; a9 0c
B13_0f9a:		sta $1a			; 85 1a
B13_0f9c:		lda #$30		; a9 30
B13_0f9e:		jmp func_08fa		; 4c fa e8


B13_0fa1:		ldx #$00		; a2 00
B13_0fa3:		ldy #$00		; a0 00
B13_0fa5:		lda wPasswordGridCircleVals.w+3, x	; bd a3 04
B13_0fa8:		asl a			; 0a
B13_0fa9:		asl a			; 0a
B13_0faa:		ora wPasswordGridCircleVals.w+2, x	; 1d a2 04
B13_0fad:		asl a			; 0a
B13_0fae:		asl a			; 0a
B13_0faf:		ora wPasswordGridCircleVals.w+1, x	; 1d a1 04
B13_0fb2:		asl a			; 0a
B13_0fb3:		asl a			; 0a
B13_0fb4:		ora wPasswordGridCircleVals.w, x	; 1d a0 04
B13_0fb7:		sta wPasswordGlobalFlagBytes.w, y	; 99 c4 04
B13_0fba:		iny				; c8 
B13_0fbb:		inx				; e8 
B13_0fbc:		inx				; e8 
B13_0fbd:		inx				; e8 
B13_0fbe:		inx				; e8 
B13_0fbf:		cpx #$24		; e0 24
B13_0fc1:		bne B13_0fa5 ; d0 e2

B13_0fc3:		lda #$00		; a9 00
B13_0fc5:		sta $00			; 85 00
B13_0fc7:		tay				; a8 
B13_0fc8:		ldx wPasswordSumByte.w		; ae cc 04
B13_0fcb:		lda wPasswordGlobalFlagBytes.w, y	; b9 c4 04
B13_0fce:		sec				; 38 
B13_0fcf:		sbc $e000, x	; fd 00 e0
B13_0fd2:		sta wPasswordGlobalFlagBytes.w, y	; 99 c4 04
B13_0fd5:		clc				; 18 
B13_0fd6:		adc $00			; 65 00
B13_0fd8:		sta $00			; 85 00
B13_0fda:		iny				; c8 
B13_0fdb:		inx				; e8 
B13_0fdc:		cpy #$08		; c0 08
B13_0fde:		bne B13_0fcb ; d0 eb

B13_0fe0:		lda $00			; a5 00
B13_0fe2:		cmp wPasswordSumByte.w		; cd cc 04
B13_0fe5:		bne B13_1014 ; d0 2d

B13_0fe7:		ldx #$00		; a2 00
B13_0fe9:		lda wPasswordGlobalFlagBytes.w, x	; bd c4 04
B13_0fec:		sta wGlobalFlags.w, x	; 9d e0 04
B13_0fef:		inx				; e8 
B13_0ff0:		cpx #$08		; e0 08
B13_0ff2:		bne B13_0fe9 ; d0 f5

B13_0ff4:		pla				; 68 
B13_0ff5:		pla				; 68 
B13_0ff6:		pla				; 68 
B13_0ff7:		pla				; 68 
B13_0ff8:		lda #$35		; a9 35
B13_0ffa:		jsr func_08fa		; 20 fa e8
B13_0ffd:		ldx #$20		; a2 20
B13_0fff:		jsr func_0530		; 20 30 e5
B13_1002:		lda #$58		; a9 58
B13_1004:		jsr setGlobalFlag		; 20 f0 e7
B13_1007:		lda #$00		; a9 00
B13_1009:		sta wCurrRoomGroup.w		; 8d 62 01
B13_100c:		lda #$08		; a9 08
B13_100e:		jsr func_0578		; 20 78 e5
B13_1011:		jmp func_e_1fda		; 4c da df


B13_1014:		lda #$34		; a9 34
B13_1016:		jsr func_08fa		; 20 fa e8
B13_1019:		ldx #$20		; a2 20
B13_101b:		jmp func_0530		; 4c 30 e5


B13_101e:		pla				; 68 
B13_101f:		pla				; 68 
B13_1020:		pla				; 68 
B13_1021:		pla				; 68 
B13_1022:		pla				; 68 
B13_1023:		pla				; 68 
B13_1024:		lda #$00		; a9 00
B13_1026:		sta wCurrRoomGroup.w		; 8d 62 01
B13_1029:		lda #$01		; a9 01
B13_102b:		jsr func_0578		; 20 78 e5
B13_102e:		jsr func_e_1fda		; 20 da df
B13_1031:		jmp $e033		; 4c 33 e0


B13_1034:		ldy $1b			; a4 1b
B13_1036:		lda wPasswordGridCircleVals.w, y	; b9 a0 04
B13_1039:		beq B13_1046 ; f0 0b

B13_103b:		jsr $b194		; 20 94 b1
B13_103e:		lda #$04		; a9 04
B13_1040:		sta $18			; 85 18
B13_1042:		lda #$0c		; a9 0c
B13_1044:		sta $1a			; 85 1a
B13_1046:		rts				; 60 


B13_1047:		dec $1a			; c6 1a
B13_1049:		beq B13_1064 ; f0 19

B13_104b:		ldy $11			; a4 11
B13_104d:		lda $aee0, y	; b9 e0 ae
B13_1050:		sta $16			; 85 16
B13_1052:		ldy $13			; a4 13
B13_1054:		lda $aee6, y	; b9 e6 ae
B13_1057:		sta $17			; 85 17
B13_1059:		lda $1a			; a5 1a
B13_105b:		lsr a			; 4a
B13_105c:		lsr a			; 4a
B13_105d:		tay				; a8 
B13_105e:		lda $b069, y	; b9 69 b0
B13_1061:		jmp updateEntity_wOam		; 4c 67 f5


B13_1064:		lda #$01		; a9 01
B13_1066:		sta $18			; 85 18
B13_1068:		rts				; 60 


B13_1069:	.db $2b
B13_106a:		rol a			; 2a
B13_106b:		and #$c6		; 29 c6
B13_106d:	.db $1a
B13_106e:		beq B13_1089 ; f0 19

B13_1070:		ldy $11			; a4 11
B13_1072:		lda $aee0, y	; b9 e0 ae
B13_1075:		sta $16			; 85 16
B13_1077:		ldy $13			; a4 13
B13_1079:		lda $aee6, y	; b9 e6 ae
B13_107c:		sta $17			; 85 17
B13_107e:		lda $1a			; a5 1a
B13_1080:		lsr a			; 4a
B13_1081:		lsr a			; 4a
B13_1082:		tay				; a8 
B13_1083:		lda $b08e, y	; b9 8e b0
B13_1086:		jmp updateEntity_wOam		; 4c 67 f5


B13_1089:		lda #$02		; a9 02
B13_108b:		sta $18			; 85 18
B13_108d:		rts				; 60 


B13_108e:		and #$2a		; 29 2a
B13_1090:	.db $2b
B13_1091:		ldx wNMIDataCopyStructNextIdx.w		; ae 00 01
B13_1094:		lda $10			; a5 10
B13_1096:		clc				; 18 
B13_1097:		adc #$01		; 69 01
B13_1099:		sta $0f			; 85 0f
B13_109b:		ldy $1b			; a4 1b
B13_109d:		lda $0f			; a5 0f
B13_109f:		and #$03		; 29 03
B13_10a1:		sta wPasswordGridCircleVals.w, y	; 99 a0 04
B13_10a4:		tya				; 98 
B13_10a5:		asl a			; 0a
B13_10a6:		asl a			; 0a
B13_10a7:		tay				; a8 
B13_10a8:		lda $b1cd, y	; b9 cd b1
B13_10ab:		sta $0101, x	; 9d 01 01
B13_10ae:		sta $0106, x	; 9d 06 01
B13_10b1:		lda $b1ce, y	; b9 ce b1
B13_10b4:		sta $0102, x	; 9d 02 01
B13_10b7:		clc				; 18 
B13_10b8:		adc #$20		; 69 20
B13_10ba:		sta $0107, x	; 9d 07 01
B13_10bd:		lda #$02		; a9 02
B13_10bf:		sta $0103, x	; 9d 03 01
B13_10c2:		sta $0108, x	; 9d 08 01
B13_10c5:		lda #$0c		; a9 0c
B13_10c7:		sta $0104, x	; 9d 04 01
B13_10ca:		lda #$1c		; a9 1c
B13_10cc:		sta $0105, x	; 9d 05 01
B13_10cf:		lda #$0d		; a9 0d
B13_10d1:		sta $0109, x	; 9d 09 01
B13_10d4:		lda #$1d		; a9 1d
B13_10d6:		sta $010a, x	; 9d 0a 01
B13_10d9:		lda #$23		; a9 23
B13_10db:		sta $010b, x	; 9d 0b 01
B13_10de:		lda $b1cf, y	; b9 cf b1
B13_10e1:		sta $010c, x	; 9d 0c 01
B13_10e4:		sec				; 38 
B13_10e5:		sbc #$d2		; e9 d2
B13_10e7:		sta $00			; 85 00
B13_10e9:		lda #$01		; a9 01
B13_10eb:		sta $010d, x	; 9d 0d 01
B13_10ee:		lda $b1d0, y	; b9 d0 b1
B13_10f1:		sta $01			; 85 01
B13_10f3:		tay				; a8 
B13_10f4:		lda $b25d, y	; b9 5d b2
B13_10f7:		ldy $00			; a4 00
B13_10f9:		and $0520, y	; 39 20 05
B13_10fc:		sta $02			; 85 02
B13_10fe:		lda $01			; a5 01
B13_1100:		beq B13_110b ; f0 09

B13_1102:		asl $0f			; 06 0f
B13_1104:		asl $0f			; 06 0f
B13_1106:		dec $01			; c6 01
B13_1108:		jmp $b0fe		; 4c fe b0


B13_110b:		lda $0f			; a5 0f
B13_110d:		ora $02			; 05 02
B13_110f:		sta $0520, y	; 99 20 05
B13_1112:		sta $010e, x	; 9d 0e 01
B13_1115:		lda #$ff		; a9 ff
B13_1117:		sta $010f, x	; 9d 0f 01
B13_111a:		lda #$0e		; a9 0e
B13_111c:		sta wNMIDataCopyStructNextIdx.w		; 8d 00 01
B13_111f:		lda #$00		; a9 00
B13_1121:		sta $18			; 85 18
B13_1123:		rts				; 60 


B13_1124:		ldx wNMIDataCopyStructNextIdx.w		; ae 00 01
B13_1127:		ldy $1b			; a4 1b
B13_1129:		lda #$00		; a9 00
B13_112b:		sta wPasswordGridCircleVals.w, y	; 99 a0 04
B13_112e:		tya				; 98 
B13_112f:		asl a			; 0a
B13_1130:		asl a			; 0a
B13_1131:		tay				; a8 
B13_1132:		lda $b1cd, y	; b9 cd b1
B13_1135:		sta $0101, x	; 9d 01 01
B13_1138:		sta $0106, x	; 9d 06 01
B13_113b:		lda $b1ce, y	; b9 ce b1
B13_113e:		sta $0102, x	; 9d 02 01
B13_1141:		clc				; 18 
B13_1142:		adc #$20		; 69 20
B13_1144:		sta $0107, x	; 9d 07 01
B13_1147:		lda #$02		; a9 02
B13_1149:		sta $0103, x	; 9d 03 01
B13_114c:		sta $0108, x	; 9d 08 01
B13_114f:		lda #$0e		; a9 0e
B13_1151:		sta $0104, x	; 9d 04 01
B13_1154:		lda #$1e		; a9 1e
B13_1156:		sta $0105, x	; 9d 05 01
B13_1159:		lda #$0f		; a9 0f
B13_115b:		sta $0109, x	; 9d 09 01
B13_115e:		lda #$1f		; a9 1f
B13_1160:		sta $010a, x	; 9d 0a 01
B13_1163:		lda #$23		; a9 23
B13_1165:		sta $010b, x	; 9d 0b 01
B13_1168:		lda $b1cf, y	; b9 cf b1
B13_116b:		sta $010c, x	; 9d 0c 01
B13_116e:		sec				; 38 
B13_116f:		sbc #$d2		; e9 d2
B13_1171:		sta $00			; 85 00
B13_1173:		lda #$01		; a9 01
B13_1175:		sta $010d, x	; 9d 0d 01
B13_1178:		lda $b1d0, y	; b9 d0 b1
B13_117b:		tay				; a8 
B13_117c:		lda $b25d, y	; b9 5d b2
B13_117f:		ldy $00			; a4 00
B13_1181:		and $0520, y	; 39 20 05
B13_1184:		sta $0520, y	; 99 20 05
B13_1187:		sta $010e, x	; 9d 0e 01
B13_118a:		lda #$ff		; a9 ff
B13_118c:		sta $010f, x	; 9d 0f 01
B13_118f:		lda #$00		; a9 00
B13_1191:		sta $18			; 85 18
B13_1193:		rts				; 60 


B13_1194:		ldx wNMIDataCopyStructNextIdx.w		; ae 00 01
B13_1197:		lda $1b			; a5 1b
B13_1199:		asl a			; 0a
B13_119a:		asl a			; 0a
B13_119b:		tay				; a8 
B13_119c:		lda $b1cd, y	; b9 cd b1
B13_119f:		sta $0101, x	; 9d 01 01
B13_11a2:		sta $0106, x	; 9d 06 01
B13_11a5:		lda $b1ce, y	; b9 ce b1
B13_11a8:		sta $0102, x	; 9d 02 01
B13_11ab:		clc				; 18 
B13_11ac:		adc #$20		; 69 20
B13_11ae:		sta $0107, x	; 9d 07 01
B13_11b1:		lda #$02		; a9 02
B13_11b3:		sta $0103, x	; 9d 03 01
B13_11b6:		sta $0108, x	; 9d 08 01
B13_11b9:		lda #$00		; a9 00
B13_11bb:		sta $0104, x	; 9d 04 01
B13_11be:		sta $0105, x	; 9d 05 01
B13_11c1:		sta $0109, x	; 9d 09 01
B13_11c4:		sta $010a, x	; 9d 0a 01
B13_11c7:		lda #$ff		; a9 ff
B13_11c9:		sta $010b, x	; 9d 0b 01
B13_11cc:		rts				; 60 


passwordGridAddresses:
// address, palette addr, quadrant of palette 64x64 block
	dwbe $214c
	.db <$23d3, $02
	dwbe $214e
	.db <$23d3, $03
	dwbe $2150
	.db <$23d4, $02
	dwbe $2152
	.db <$23d4, $03
	dwbe $2154
	.db <$23d5, $02
	dwbe $2156
	.db <$23d5, $03

	dwbe $218c
	.db <$23db, $00
	dwbe $218e
	.db <$23db, $01
	dwbe $2190
	.db <$23dc, $00
	dwbe $2192
	.db <$23dc, $01
	dwbe $2194
	.db <$23dd, $00
	dwbe $2196
	.db <$23dd, $01

	dwbe $21cc
	.db <$23db, $02
	dwbe $21ce
	.db <$23db, $03
	dwbe $21d0
	.db <$23dc, $02
	dwbe $21d2
	.db <$23dc, $03
	dwbe $21d4
	.db <$23dd, $02
	dwbe $21d6
	.db <$23dd, $03

	dwbe $220c
	.db <$23e3, $00
	dwbe $220e
	.db <$23e3, $01
	dwbe $2210
	.db <$23e4, $00
	dwbe $2212
	.db <$23e4, $01
	dwbe $2214
	.db <$23e5, $00
	dwbe $2216
	.db <$23e5, $01

	dwbe $224c
	.db <$23e3, $02
	dwbe $224e
	.db <$23e3, $03
	dwbe $2250
	.db <$23e4, $02
	dwbe $2252
	.db <$23e4, $03
	dwbe $2254
	.db <$23e5, $02
	dwbe $2256
	.db <$23e5, $03

	dwbe $228c
	.db <$23eb, $00
	dwbe $228e
	.db <$23eb, $01
	dwbe $2290
	.db <$23ec, $00
	dwbe $2292
	.db <$23ec, $01
	dwbe $2294
	.db <$23ed, $00
	dwbe $2296
	.db <$23ed, $01


invPasswordGridCirclePaletteBitmask:
	.db %11111100
	.db %11110011
	.db %11001111
	.db %00111111


func_d_1261:
.ifdef ROM_JP
	lda #$02
	sta $81
.endif
B13_1261:		lda #$04		; a9 04
B13_1263:		jsr func_0578		; 20 78 e5
B13_1266:		jsr func_e_1fda		; 20 da df

B13_1269:		lda #$00		; a9 00
B13_126b:		sta $28			; 85 28
B13_126d:		sta $fd			; 85 fd
B13_126f:		sta $fc			; 85 fc
B13_1271:		sta $015d		; 8d 5d 01
B13_1274:		sta $19			; 85 19
B13_1276:		sta wNextUsableOamIdx.w		; 8d 58 01
B13_1279:		sta $10			; 85 10
B13_127b:		sta $d7			; 85 d7
B13_127d:		sta wCurrRoomGroup.w		; 8d 62 01
B13_1280:		lda $ff			; a5 ff
B13_1282:		and #$fe		; 29 fe
B13_1284:		sta $ff			; 85 ff
B13_1286:		jsr wOam_outOfYbounds		; 20 6a e5
B13_1289:		lda #$00		; a9 00
B13_128b:		jsr fillFirst3nametablesWithA_clearPalettes		; 20 74 df
B13_128e:		lda #$20		; a9 20
B13_1290:		jsr drawStaticLayoutIdxedY		; 20 76 fc
B13_1293:		lda #$26		; a9 26
B13_1295:		jsr drawStaticLayoutIdxedY		; 20 76 fc
B13_1298:		lda #$27		; a9 27
B13_129a:		jsr drawStaticLayoutIdxedY		; 20 76 fc
B13_129d:		jsr loadFollowingDataIntoInternalPalettes2BG		; 20 c9 e3
	.db $0f
	.db $30 $10 $00
	.db $30 $10 $00
	.db $30 $10 $00
	.db $30 $10 $00

B13_12ad:		jsr loadFollowingDataIntoInternalPalettes2Spr		; 20 0c e4
	.db $21 $11 $01
	.db $21 $11 $01
	.db $30 $10 $00
	.db $35 $25 $05

B13_12bc:		lda #$38
B13_12be:		sta wShadow2KBChrBank0.w		; 8d 69 01
B13_12c1:		lda #$3a		; a9 3a
B13_12c3:		sta wShadow2KBChrBank1.w		; 8d 6a 01
B13_12c6:		jsr func_e_1fcf		; 20 cf df
B13_12c9:		lda #$06		; a9 06
B13_12cb:		jsr func_08e5		; 20 e5 e8
B13_12ce:		lda #$04		; a9 04
B13_12d0:		jsr func_05cb		; 20 cb e5
B13_12d3:		jsr func_052e		; 20 2e e5
B13_12d6:		lda #$00		; a9 00
B13_12d8:		sta wNextUsableOamIdx.w		; 8d 58 01
B13_12db:		sta $0159		; 8d 59 01
B13_12de:		jsr wOam_outOfYbounds		; 20 6a e5
B13_12e1:		jsr $b305		; 20 05 b3
B13_12e4:		lda $10			; a5 10
B13_12e6:		asl a			; 0a
B13_12e7:		tay				; a8 
B13_12e8:		lda $b33d, y	; b9 3d b3
B13_12eb:		sta $16			; 85 16
B13_12ed:		lda $b33e, y	; b9 3e b3
B13_12f0:		sta $17			; 85 17
B13_12f2:		lda $015a		; ad 5a 01
B13_12f5:		and #$08		; 29 08
B13_12f7:		bne B13_12fd ; d0 04

B13_12f9:		lda #$8a		; a9 8a
B13_12fb:		bne B13_12ff ; d0 02

B13_12fd:		lda #$8b		; a9 8b
B13_12ff:		jsr updateEntity_wOam		; 20 67 f5
B13_1302:		jmp $b2d3		; 4c d3 b2


B13_1305:		lda wJoy1NewButtonsPressed.w		; ad 54 01
B13_1308:		and #$10		; 29 10
B13_130a:		bne B13_1324 ; d0 18

B13_130c:		lda wJoy1NewButtonsPressed.w		; ad 54 01
B13_130f:		and #$20		; 29 20
B13_1311:		bne B13_131b ; d0 08

B13_1313:		lda wJoy1NewButtonsPressed.w		; ad 54 01
B13_1316:		and #$0c		; 29 0c
B13_1318:		bne B13_131b ; d0 01

B13_131a:		rts				; 60 


B13_131b:		inc $10			; e6 10
B13_131d:		lda $10			; a5 10
B13_131f:		and #$01		; 29 01
B13_1321:		sta $10			; 85 10
B13_1323:		rts				; 60 


B13_1324:		lda #$04		; a9 04
B13_1326:		jsr func_0578		; 20 78 e5
B13_1329:		jsr func_e_1fda		; 20 da df
B13_132c:		pla				; 68 
B13_132d:		pla				; 68 
B13_132e:		lda $10			; a5 10
B13_1330:		beq B13_1333 ; f0 01

B13_1332:		rts				; 60 


B13_1333:		lda #$58		; a9 58
B13_1335:		jsr setGlobalFlag		; 20 f0 e7
B13_1338:		pla				; 68 
B13_1339:		pla				; 68 
B13_133a:		jmp $e03b		; 4c 3b e0


B13_133d:		cli				; 58 
B13_133e:		pla				; 68 
B13_133f:		cli				; 58 
B13_1340:		sei				; 78


func_d_1341:
B13_1341:		jsr $b3c3		; 20 c3 b3
B13_1344:		lda wCurrRoomGroup.w		; ad 62 01
B13_1347:		jsr jumpTable		; 20 a6 e6
	.dw $b360
	.dw $b360
	.dw $b361
	.dw $b360
	.dw $b360
	.dw $b360
	.dw $b360
	.dw $b360
	.dw $b360
	.dw $b390
	.dw $b360
B13_1360:		rts				; 60 


B13_1361:		lda #$5e		; a9 5e
B13_1363:		jsr checkGlobalFlag		; 20 e9 e7
B13_1366:		beq B13_1360 ; f0 f8

B13_1368:		jsr $b538		; 20 38 b5
B13_136b:		lda $0479		; ad 79 04
B13_136e:		beq B13_138f ; f0 1f

B13_1370:		lda $047a		; ad 7a 04
B13_1373:		bpl B13_138f ; 10 1a

B13_1375:		jsr loadFollowingDataIntoInternalPalettes2BG		; 20 c9 e3
	.db $0f
	.db $0f $0f $0f
	.db $38 $26 $16
	.db $0f $0f $0f
	.db $20 $10 $00

B13_1385:		ldx #$0b		; a2 0b
B13_1387:		lda #$0f		; a9 0f
B13_1389:		sta $01b4, x	; 9d b4 01
B13_138c:		dex				; ca 
B13_138d:		bpl B13_1389 ; 10 fa

B13_138f:		rts				; 60 


B13_1390:		lda #$0f		; a9 0f
B13_1392:		jsr checkGlobalFlag		; 20 e9 e7
B13_1395:		bne B13_13b2 ; d0 1b

B13_1397:		ldx #$00		; a2 00
B13_1399:		lda #$0f		; a9 0f
B13_139b:		sta $01b0		; 8d b0 01
B13_139e:		sta $01b4		; 8d b4 01
B13_13a1:		sta $01b8		; 8d b8 01
B13_13a4:		sta $01bc		; 8d bc 01
B13_13a7:		lda $b3b3, x	; bd b3 b3
B13_13aa:		sta $01a0, x	; 9d a0 01
B13_13ad:		inx				; e8 
B13_13ae:		cpx #$10		; e0 10
B13_13b0:		bne B13_13a7 ; d0 f5

B13_13b2:		rts				; 60 


B13_13b3:	.db $0f
B13_13b4:		asl $0f			; 06 0f
B13_13b6:		php				; 08 
B13_13b7:	.db $0f
B13_13b8:	.db $0f
B13_13b9:		ora #$01		; 09 01
B13_13bb:	.db $0f
B13_13bc:		.db $00				; 00
B13_13bd:	.db $02
B13_13be:		ora ($0f, x)	; 01 0f
B13_13c0:		.db $00				; 00
B13_13c1:	.db $0f
B13_13c2:		ora ($a2, x)	; 01 a2
B13_13c4:		.db $00				; 00
B13_13c5:		lda wEntityStructs.id.w, x	; bd 08 04
B13_13c8:		cmp #$40		; c9 40
B13_13ca:		bne B13_13eb ; d0 1f

B13_13cc:		lda wEntityStructs.byte9.w, x	; bd 09 04
B13_13cf:		beq B13_13eb ; f0 1a

B13_13d1:		jsr $b3f3		; 20 f3 b3
B13_13d4:		lda wEntityStructs.byteA.w, x	; bd 0a 04
B13_13d7:		sta $00			; 85 00
B13_13d9:		lda wEntityStructs.byteE.w, x	; bd 0e 04
B13_13dc:		tay				; a8 
B13_13dd:		lda #$01		; a9 01
B13_13df:		sta $0600, y	; 99 00 06
B13_13e2:		tya				; 98 
B13_13e3:		clc				; 18 
B13_13e4:		adc #$10		; 69 10
B13_13e6:		tay				; a8 
B13_13e7:		dec $00			; c6 00
B13_13e9:		bne B13_13dd ; d0 f2

B13_13eb:		txa				; 8a 
B13_13ec:		clc				; 18 
B13_13ed:		adc #$10		; 69 10
B13_13ef:		tax				; aa 
B13_13f0:		bne B13_13c5 ; d0 d3

B13_13f2:		rts				; 60 


B13_13f3:		lda wEntityStructs.byteC.w, x	; bd 0c 04
B13_13f6:		lsr a			; 4a
B13_13f7:		lsr a			; 4a
B13_13f8:		lsr a			; 4a
B13_13f9:		lsr a			; 4a
B13_13fa:		beq B13_13f2 ; f0 f6

B13_13fc:		sta wEntityStructs.byteD.w, x	; 9d 0d 04
B13_13ff:		lda wEntityStructs.tileX.w, x	; bd 00 04

B13_1402:		sta wEntityStructs.tileY.w, x	; 9d 02 04
B13_1405:		lda wEntityStructs.subX.w, x	; bd 01 04

B13_1408:		sta wEntityStructs.subY.w, x	; 9d 03 04
B13_140b:		lda wEntityStructs.tileY.w, x	; bd 02 04

B13_140e:		sta wCurrLayoutRowPPUAddrBE			; 85 0e
B13_1410:		lda wEntityStructs.subY.w, x	; bd 03 04
B13_1413:		sta wCurrLayoutRowPPUAddrBE+1			; 85 0f
B13_1415:		stx $0d			; 86 0d

B13_1417:		lda #$2b		; a9 2b
B13_1419:		jsr drawStaticLayoutIdxedYAtCurrPPUAddr		; 20 dd fc
B13_141c:		ldx $0d			; a6 0d
B13_141e:		jsr $b43a		; 20 3a b4
B13_1421:		dec wEntityStructs.byteD.w, x	; de 0d 04
B13_1424:		beq B13_13f2 ; f0 cc

B13_1426:		lda wEntityStructs.subY.w, x	; bd 03 04
B13_1429:		clc				; 18 
B13_142a:		adc #$40		; 69 40
B13_142c:		sta wEntityStructs.subY.w, x	; 9d 03 04
B13_142f:		lda wEntityStructs.tileY.w, x	; bd 02 04
B13_1432:		adc #$00		; 69 00
B13_1434:		sta wEntityStructs.tileY.w, x	; 9d 02 04
B13_1437:		jmp $b40b		; 4c 0b b4


B13_143a:		ldy #$00		; a0 00
B13_143c:		lda wEntityStructs.subY.w, x	; bd 03 04
B13_143f:		and #$02		; 29 02
B13_1441:		beq B13_1444 ; f0 01

B13_1443:		iny				; c8 
B13_1444:		lda wEntityStructs.subY.w, x	; bd 03 04
B13_1447:		and #$40		; 29 40
B13_1449:		beq B13_144d ; f0 02

B13_144b:		iny				; c8 
B13_144c:		iny				; c8 
B13_144d:		lda $b4b9, y	; b9 b9 b4
B13_1450:		sta $0a			; 85 0a
B13_1452:		lda $b4bd, y	; b9 bd b4
B13_1455:		sta $0b			; 85 0b
B13_1457:		lda wEntityStructs.tileY.w, x	; bd 02 04
B13_145a:		sta $08			; 85 08
B13_145c:		lda wEntityStructs.subY.w, x	; bd 03 04
B13_145f:		lsr $08			; 46 08
B13_1461:		ror a			; 6a
B13_1462:		lsr $08			; 46 08
B13_1464:		ror a			; 6a
B13_1465:		lsr a			; 4a
B13_1466:		lsr a			; 4a
B13_1467:		and #$38		; 29 38
B13_1469:		sta $08			; 85 08
B13_146b:		lda wEntityStructs.subY.w, x	; bd 03 04
B13_146e:		lsr a			; 4a
B13_146f:		lsr a			; 4a
B13_1470:		and #$07		; 29 07
B13_1472:		ora $08			; 05 08
B13_1474:		tay				; a8 
B13_1475:		clc				; 18 
B13_1476:		adc #$c0		; 69 c0
B13_1478:		sta $08			; 85 08
B13_147a:		lda $30			; a5 30
B13_147c:		and #$10		; 29 10
B13_147e:		beq B13_1489 ; f0 09

B13_1480:		tya				; 98 
B13_1481:		clc				; 18 
B13_1482:		adc #$40		; 69 40
B13_1484:		tay				; a8 
B13_1485:		lda #$27		; a9 27
B13_1487:		bne B13_148b ; d0 02

B13_1489:		lda #$23		; a9 23
B13_148b:		sta $09			; 85 09
B13_148d:		lda $0520, y	; b9 20 05
B13_1490:		and $0a			; 25 0a
B13_1492:		ora $0b			; 05 0b
B13_1494:		sta $0520, y	; 99 20 05
B13_1497:		ldy wNMIDataCopyStructNextIdx.w		; ac 00 01
B13_149a:		sta $0104, y	; 99 04 01
B13_149d:		lda $09			; a5 09
B13_149f:		sta $0101, y	; 99 01 01
B13_14a2:		lda $08			; a5 08
B13_14a4:		sta $0102, y	; 99 02 01
B13_14a7:		lda #$01		; a9 01
B13_14a9:		sta $0103, y	; 99 03 01
B13_14ac:		lda #$ff		; a9 ff
B13_14ae:		sta $0105, y	; 99 05 01
B13_14b1:		tya				; 98 
B13_14b2:		clc				; 18 
B13_14b3:		adc #$04		; 69 04
B13_14b5:		sta wNMIDataCopyStructNextIdx.w		; 8d 00 01
B13_14b8:		rts				; 60 


B13_14b9:	.db $fc
B13_14ba:	.db $f3
B13_14bb:	.db $cf
B13_14bc:	.db $3f
B13_14bd:	.db $03
B13_14be:	.db $0c
B13_14bf:		bmi B13_1481 ; 30 c0


func_d_14c1:
B13_14c1:		lda #$08		; a9 08
B13_14c3:		jsr func_0578		; 20 78 e5
B13_14c6:		jsr func_e_1fda		; 20 da df
B13_14c9:		lda #$5e		; a9 5e
B13_14cb:		jsr setGlobalFlag		; 20 f0 e7
B13_14ce:		lda #$e4		; a9 e4
B13_14d0:		sta $0500		; 8d 00 05
B13_14d3:		lda #$0b		; a9 0b
B13_14d5:		sta $0502		; 8d 02 05
B13_14d8:		lda #$00		; a9 00
B13_14da:		sta $0501		; 8d 01 05
B13_14dd:		sta $0503		; 8d 03 05
B13_14e0:		sta $0504		; 8d 04 05
B13_14e3:		sta $0505		; 8d 05 05
B13_14e6:		sta $fd			; 85 fd
B13_14e8:		sta $fc			; 85 fc
B13_14ea:		sta $31			; 85 31
B13_14ec:		sta $32			; 85 32
B13_14ee:		sta $33			; 85 33
B13_14f0:		jsr setNametableMirroringToHorizontal		; 20 5f fe
B13_14f3:		jsr $b538		; 20 38 b5
B13_14f6:		jsr loadFollowingDataIntoInternalPalettes2BG		; 20 c9 e3
	.db $0f
	.db $0f $0f $0f
	.db $38 $26 $16
	.db $0f $0f $0f
	.db $20 $10 $00

B13_1506:		ldx #$0b		; a2 0b
B13_1508:		lda #$0f		; a9 0f
B13_150a:		sta $01b4, x	; 9d b4 01
B13_150d:		dex				; ca 
B13_150e:		bpl B13_150a ; 10 fa

B13_1510:		lda #$5e		; a9 5e
B13_1512:		sta $0478		; 8d 78 04
B13_1515:		lda #$81		; a9 81
B13_1517:		sta $0479		; 8d 79 04
B13_151a:		lda #$07		; a9 07
B13_151c:		sta $047f		; 8d 7f 04
B13_151f:		lda #$08		; a9 08
B13_1521:		sta $fd			; 85 fd
B13_1523:		lda #$78		; a9 78
B13_1525:		sta $fc			; 85 fc
B13_1527:		jsr func_e_1fcf		; 20 cf df
B13_152a:		lda #$02		; a9 02
B13_152c:		sta $28			; 85 28
B13_152e:		lda #$0b		; a9 0b
B13_1530:		jsr func_08e5		; 20 e5 e8
B13_1533:		lda #$08		; a9 08
B13_1535:		jmp func_05cb		; 4c cb e5


B13_1538:		lda #$2c		; a9 2c
B13_153a:		sta wShadow2KBChrBank0.w		; 8d 69 01
B13_153d:		lda #$2e		; a9 2e
B13_153f:		sta wShadow2KBChrBank1.w		; 8d 6a 01
B13_1542:		lda #$0f		; a9 0f
B13_1544:		sta $4c			; 85 4c
B13_1546:		lda #$e0		; a9 e0
B13_1548:		sta $30			; 85 30
B13_154a:		lda #$00		; a9 00
B13_154c:		sta $4b			; 85 4b
B13_154e:		jsr wOam_outOfYbounds		; 20 6a e5
B13_1551:		lda $ff			; a5 ff
B13_1553:		and #$fe		; 29 fe
B13_1555:		sta $ff			; 85 ff
B13_1557:		lda #$00		; a9 00
B13_1559:		jsr fillFirst3nametablesWithA_clearPalettes		; 20 74 df
B13_155c:		lda #$57		; a9 57
B13_155e:		jsr drawStaticLayoutIdxedY		; 20 76 fc
B13_1561:		lda #$58		; a9 58
B13_1563:		jsr drawStaticLayoutIdxedY		; 20 76 fc
B13_1566:		lda #$59		; a9 59
B13_1568:		jsr drawStaticLayoutIdxedY		; 20 76 fc
B13_156b:		lda #$5a		; a9 5a
B13_156d:		jsr drawStaticLayoutIdxedY		; 20 76 fc
B13_1570:		jsr loadFollowingDataIntoInternalPalettes2BG		; 20 c9 e3
	.db $0f
	.db $38 $29 $19
	.db $38 $26 $16
	.db $20 $10 $00
	.db $20 $10 $00

B13_1580:		ldx #$0b		; a2 0b
B13_1582:		lda $b59d, x	; bd 9d b5
B13_1585:		sta $01b4, x	; 9d b4 01
B13_1588:		dex				; ca 
B13_1589:		bpl B13_1582 ; 10 f7

B13_158b:		ldx #$00		; a2 00
B13_158d:		txa				; 8a 
B13_158e:		sta $0600, x	; 9d 00 06
B13_1591:		inx				; e8 
B13_1592:		beq B13_159c ; f0 08

B13_1594:		cpx #$c0		; e0 c0
B13_1596:		bne B13_158e ; d0 f6

B13_1598:		lda #$01		; a9 01
B13_159a:		bne B13_158e ; d0 f2

B13_159c:		rts				; 60 


B13_159d:	.db $0f
B13_159e:		bmi B13_15c5 ; 30 25

B13_15a0:		ora $0f, x		; 15 0f
B13_15a2:		sec				; 38 
B13_15a3:		and #$0f		; 29 0f
B13_15a5:	.db $0f
B13_15a6:		;removed
	.db $30 $10

B13_15a8:	.db $0f
B13_15a9:		asl a			; 0a
B13_15aa:		tay				; a8 
B13_15ab:		lda $b625, y	; b9 25 b6
B13_15ae:		sta $00			; 85 00
B13_15b0:		lda $b626, y	; b9 26 b6
B13_15b3:		sta $01			; 85 01
B13_15b5:		ldy #$00		; a0 00
B13_15b7:		lda $19			; a5 19
B13_15b9:		and #$02		; 29 02
B13_15bb:		bne B13_15cd ; d0 10

B13_15bd:		lda ($00), y	; b1 00
B13_15bf:		clc				; 18 
B13_15c0:		adc $11			; 65 11
B13_15c2:		sta $0301, x	; 9d 01 03
B13_15c5:		iny				; c8 
B13_15c6:		lda ($00), y	; b1 00
B13_15c8:		adc $10			; 65 10
B13_15ca:		jmp $b5da		; 4c da b5


B13_15cd:		lda $11			; a5 11
B13_15cf:		sec				; 38 
B13_15d0:		sbc ($00), y	; f1 00
B13_15d2:		sta $0301, x	; 9d 01 03
B13_15d5:		iny				; c8 
B13_15d6:		lda $10			; a5 10
B13_15d8:		sbc ($00), y	; f1 00
B13_15da:		sta $0300, x	; 9d 00 03
B13_15dd:		iny				; c8 
B13_15de:		lda $04e8		; ad e8 04
B13_15e1:		bmi B13_15f3 ; 30 10

B13_15e3:		lda ($00), y	; b1 00
B13_15e5:		clc				; 18 
B13_15e6:		adc $13			; 65 13
B13_15e8:		sta $0303, x	; 9d 03 03
B13_15eb:		iny				; c8 
B13_15ec:		lda ($00), y	; b1 00
B13_15ee:		adc $12			; 65 12
B13_15f0:		jmp $b600		; 4c 00 b6


B13_15f3:		lda $13			; a5 13
B13_15f5:		sec				; 38 
B13_15f6:		sbc ($00), y	; f1 00
B13_15f8:		sta $0303, x	; 9d 03 03
B13_15fb:		iny				; c8 
B13_15fc:		lda $12			; a5 12
B13_15fe:		sbc ($00), y	; f1 00
B13_1600:		sta $0302, x	; 9d 02 03
B13_1603:		iny				; c8 
B13_1604:		lda ($00), y	; b1 00
B13_1606:		sta $0304, x	; 9d 04 03
B13_1609:		iny				; c8 
B13_160a:		inx				; e8 
B13_160b:		cpy #$10		; c0 10
B13_160d:		bne B13_1604 ; d0 f5

B13_160f:		txa				; 8a 
B13_1610:		sec				; 38 
B13_1611:		sbc #$0c		; e9 0c
B13_1613:		tax				; aa 
B13_1614:		lda $04e8		; ad e8 04
B13_1617:		bpl B13_1624 ; 10 0b

B13_1619:		lda $0305, x	; bd 05 03
B13_161c:		eor #$ff		; 49 ff
B13_161e:		clc				; 18 
B13_161f:		adc #$01		; 69 01
B13_1621:		sta $0305, x	; 9d 05 03
B13_1624:		rts				; 60 


B13_1625:		adc $b6			; 65 b6
B13_1627:		adc $b6, x		; 75 b6
B13_1629:		sta $b6			; 85 b6
B13_162b:		sta $b6, x		; 95 b6
B13_162d:		lda $b6			; a5 b6
B13_162f:		lda $b6, x		; b5 b6
B13_1631:		cmp $b6			; c5 b6
B13_1633:		cmp $b6, x		; d5 b6
B13_1635:		sbc $b6			; e5 b6
B13_1637:		sbc $b6, x		; f5 b6
B13_1639:		ora $b7			; 05 b7
B13_163b:		ora $b7, x		; 15 b7
B13_163d:		and $b7			; 25 b7
B13_163f:		and $b7, x		; 35 b7
B13_1641:		eor $b7			; 45 b7
B13_1643:		eor $b7, x		; 55 b7
B13_1645:		adc $b7			; 65 b7
B13_1647:		adc $b7, x		; 75 b7
B13_1649:		sta $b7			; 85 b7
B13_164b:		sta $b7, x		; 95 b7
B13_164d:		lda $b7			; a5 b7
B13_164f:		lda $b7, x		; b5 b7
B13_1651:		cmp $b7			; c5 b7
B13_1653:		cmp $b7, x		; d5 b7
B13_1655:		sbc $b7			; e5 b7
B13_1657:		sbc $b7, x		; f5 b7
B13_1659:		sbc $b7, x		; f5 b7
B13_165b:		sbc $b7, x		; f5 b7
B13_165d:		sbc $b7, x		; f5 b7
B13_165f:		sbc $b7, x		; f5 b7
B13_1661:		sbc $b7, x		; f5 b7
B13_1663:		sbc $b7, x		; f5 b7
B13_1665:		.db $00				; 00
B13_1666:		.db $00				; 00
B13_1667:		.db $00				; 00
B13_1668:		.db $00				; 00
B13_1669:		.db $00				; 00
B13_166a:		.db $00				; 00
B13_166b:		.db $00				; 00
B13_166c:		.db $00				; 00
B13_166d:		.db $00				; 00
B13_166e:		.db $00				; 00
B13_166f:		.db $00				; 00
B13_1670:		.db $00				; 00
B13_1671:		.db $00				; 00
B13_1672:		.db $00				; 00
B13_1673:		.db $00				; 00
B13_1674:		ora ($80, x)	; 01 80
B13_1676:		.db $00				; 00
B13_1677:		rti				; 40 


B13_1678:		.db $00				; 00
B13_1679:	.db $12
B13_167a:		bpl B13_167c ; 10 00

B13_167c:		.db $00				; 00
B13_167d:		ora ($01, x)	; 01 01
B13_167f:	.db $80
B13_1680:		bpl B13_1682 ; 10 00

B13_1682:		.db $00				; 00
B13_1683:		.db $00				; 00
B13_1684:		ora ($80, x)	; 01 80
B13_1686:		.db $00				; 00
B13_1687:		.db $00				; 00
B13_1688:		.db $00				; 00
B13_1689:		rti				; 40 


B13_168a:		.db $00				; 00
B13_168b:		.db $00				; 00
B13_168c:		.db $00				; 00
B13_168d:		asl $01			; 06 01
B13_168f:		.db $00				; 00
B13_1690:	.db $80
B13_1691:		.db $00				; 00
B13_1692:		.db $00				; 00
B13_1693:		.db $00				; 00
B13_1694:		ora ($00, x)	; 01 00
B13_1696:		.db $00				; 00
B13_1697:		.db $00				; 00
B13_1698:		.db $00				; 00
B13_1699:		;removed
	.db $f0 $e0

B13_169b:		.db $00				; 00
B13_169c:		.db $00				; 00
B13_169d:	.db $04
B13_169e:		ora ($0d, x)	; 01 0d
B13_16a0:		rti				; 40 


B13_16a1:		cpy #$00		; c0 00
B13_16a3:		.db $00				; 00
B13_16a4:		ora ($00, x)	; 01 00
B13_16a6:		.db $00				; 00
B13_16a7:		.db $00				; 00
B13_16a8:		.db $00				; 00
B13_16a9:	.db $fc
B13_16aa:		cpy #$00		; c0 00
B13_16ac:		.db $00				; 00
B13_16ad:	.db $04
B13_16ae:		ora ($0e, x)	; 01 0e
B13_16b0:		rti				; 40 


B13_16b1:		cpy #$00		; c0 00
B13_16b3:		.db $00				; 00
B13_16b4:		ora ($00, x)	; 01 00
B13_16b6:		.db $00				; 00
B13_16b7:		.db $00				; 00
B13_16b8:		.db $00				; 00
B13_16b9:	.db $04
B13_16ba:		cpy #$00		; c0 00
B13_16bc:		.db $00				; 00
B13_16bd:	.db $04
B13_16be:		ora ($0f, x)	; 01 0f
B13_16c0:		rti				; 40 


B13_16c1:		cpy #$00		; c0 00
B13_16c3:		.db $00				; 00
B13_16c4:		ora ($00, x)	; 01 00
B13_16c6:		.db $00				; 00
B13_16c7:		.db $00				; 00
B13_16c8:		.db $00				; 00
B13_16c9:		;removed
	.db $10 $e0

B13_16cb:		.db $00				; 00
B13_16cc:		.db $00				; 00
B13_16cd:	.db $04
B13_16ce:		ora ($10, x)	; 01 10
B13_16d0:		rti				; 40 


B13_16d1:		cpy #$00		; c0 00
B13_16d3:		.db $00				; 00
B13_16d4:		ora ($00, x)	; 01 00
B13_16d6:		.db $00				; 00
B13_16d7:		.db $00				; 00
B13_16d8:		.db $00				; 00
B13_16d9:		.db $00				; 00
B13_16da:		.db $00				; 00
B13_16db:		.db $00				; 00
B13_16dc:		.db $00				; 00
B13_16dd:		ora $01			; 05 01
B13_16df:	.db $20 $00 $00
B13_16e2:		.db $00				; 00
B13_16e3:		.db $00				; 00
B13_16e4:		ora ($00, x)	; 01 00
B13_16e6:		.db $00				; 00
B13_16e7:		.db $00				; 00
B13_16e8:		.db $00				; 00
B13_16e9:		.db $00				; 00
B13_16ea:		.db $00				; 00
B13_16eb:		.db $00				; 00
B13_16ec:		.db $00				; 00
B13_16ed:	.db $07
B13_16ee:		ora ($28, x)	; 01 28
B13_16f0:		.db $00				; 00
B13_16f1:		.db $00				; 00
B13_16f2:		.db $00				; 00
B13_16f3:		.db $00				; 00
B13_16f4:		ora ($00, x)	; 01 00
B13_16f6:		.db $00				; 00
B13_16f7:		.db $00				; 00
B13_16f8:		.db $00				; 00
B13_16f9:		.db $00				; 00
B13_16fa:		.db $00				; 00
B13_16fb:		.db $00				; 00
B13_16fc:		.db $00				; 00
B13_16fd:		php				; 08 
B13_16fe:		ora ($28, x)	; 01 28
B13_1700:		.db $00				; 00
B13_1701:		.db $00				; 00
B13_1702:		.db $00				; 00
B13_1703:		.db $00				; 00
B13_1704:		ora ($00, x)	; 01 00
B13_1706:		.db $00				; 00
B13_1707:		.db $00				; 00
B13_1708:		.db $00				; 00
B13_1709:		.db $00				; 00
B13_170a:		.db $00				; 00
B13_170b:		.db $00				; 00
B13_170c:		.db $00				; 00
B13_170d:		ora #$01		; 09 01
B13_170f:		plp				; 28 
B13_1710:		.db $00				; 00
B13_1711:		.db $00				; 00
B13_1712:		.db $00				; 00
B13_1713:		.db $00				; 00
B13_1714:		ora ($00, x)	; 01 00
B13_1716:		.db $00				; 00
B13_1717:		.db $00				; 00
B13_1718:		.db $00				; 00
B13_1719:		.db $00				; 00
B13_171a:		.db $00				; 00
B13_171b:		.db $00				; 00
B13_171c:		.db $00				; 00
B13_171d:		asl a			; 0a
B13_171e:		ora ($28, x)	; 01 28
B13_1720:		.db $00				; 00
B13_1721:		.db $00				; 00
B13_1722:		.db $00				; 00
B13_1723:		.db $00				; 00
B13_1724:		ora ($80, x)	; 01 80
B13_1726:		.db $00				; 00
B13_1727:		rti				; 40 


B13_1728:	.db $ff
B13_1729:		bmi B13_172b ; 30 00

B13_172b:		.db $00				; 00
B13_172c:		.db $00				; 00
B13_172d:		and $01			; 25 01
B13_172f:	.db $20 $00 $00
B13_1732:		.db $00				; 00
B13_1733:		.db $00				; 00
B13_1734:		ora ($00, x)	; 01 00
B13_1736:		.db $00				; 00
B13_1737:		.db $00				; 00
B13_1738:		.db $00				; 00
B13_1739:		.db $00				; 00
B13_173a:		.db $00				; 00
B13_173b:		.db $00				; 00
B13_173c:		.db $00				; 00
B13_173d:		rol $01			; 26 01
B13_173f:	.db $80
B13_1740:		clc				; 18 
B13_1741:		.db $00				; 00
B13_1742:		.db $00				; 00
B13_1743:		ora ($01, x)	; 01 01
B13_1745:		.db $00				; 00
B13_1746:		.db $00				; 00
B13_1747:	.db $80
B13_1748:		.db $00				; 00
B13_1749:		.db $00				; 00
B13_174a:		.db $00				; 00
B13_174b:		.db $00				; 00
B13_174c:		.db $00				; 00
B13_174d:		plp				; 28 
B13_174e:		ora ($00, x)	; 01 00
B13_1750:		clc				; 18 
B13_1751:		.db $00				; 00
B13_1752:		.db $00				; 00
B13_1753:		.db $00				; 00
B13_1754:		ora ($94, x)	; 01 94
B13_1756:	.db $07
B13_1757:		clc				; 18 
B13_1758:	.db $f9 $00 $00
B13_175b:		.db $00				; 00
B13_175c:		.db $00				; 00
B13_175d:	.db $13
B13_175e:		ora ($30, x)	; 01 30
B13_1760:		.db $00				; 00
B13_1761:		sta $00			; 85 00
B13_1763:		.db $00				; 00
B13_1764:		.db $00				; 00
B13_1765:		sty $00			; 84 00
B13_1767:	.db $1c
B13_1768:		inc $00, x		; f6 00
B13_176a:		.db $00				; 00
B13_176b:		.db $00				; 00
B13_176c:		.db $00				; 00
B13_176d:	.db $13
B13_176e:		ora ($30, x)	; 01 30
B13_1770:		.db $00				; 00
B13_1771:	.db $9b
B13_1772:		.db $00				; 00
B13_1773:		.db $00				; 00
B13_1774:		ora ($18, x)	; 01 18
B13_1776:		sbc $f918, y	; f9 18 f9
B13_1779:		.db $00				; 00
B13_177a:		.db $00				; 00
B13_177b:		.db $00				; 00
B13_177c:		.db $00				; 00
B13_177d:	.db $13
B13_177e:		ora ($30, x)	; 01 30
B13_1780:		.db $00				; 00
B13_1781:	.db $b2
B13_1782:		.db $00				; 00
B13_1783:		.db $00				; 00
B13_1784:		ora ($1c, x)	; 01 1c
B13_1786:		inc $28, x		; f6 28
B13_1788:		.db $00				; 00
B13_1789:		.db $00				; 00
B13_178a:		.db $00				; 00
B13_178b:		.db $00				; 00
B13_178c:		.db $00				; 00
B13_178d:	.db $13
B13_178e:		ora ($30, x)	; 01 30
B13_1790:		.db $00				; 00
B13_1791:	.db $14
B13_1792:		.db $00				; 00
B13_1793:		.db $00				; 00
B13_1794:		ora ($18, x)	; 01 18
B13_1796:		sbc $0794, y	; f9 94 07
B13_1799:		.db $00				; 00
B13_179a:		.db $00				; 00
B13_179b:		.db $00				; 00
B13_179c:		.db $00				; 00
B13_179d:	.db $13
B13_179e:		ora ($30, x)	; 01 30
B13_17a0:		.db $00				; 00
B13_17a1:	.db $2b
B13_17a2:		.db $00				; 00
B13_17a3:		.db $00				; 00
B13_17a4:		ora ($28, x)	; 01 28
B13_17a6:		.db $00				; 00
B13_17a7:		tya				; 98 
B13_17a8:		asl a			; 0a
B13_17a9:		.db $00				; 00
B13_17aa:		.db $00				; 00
B13_17ab:		.db $00				; 00
B13_17ac:		.db $00				; 00
B13_17ad:	.db $13
B13_17ae:		ora ($30, x)	; 01 30
B13_17b0:		.db $00				; 00
B13_17b1:		eor ($00, x)	; 41 00
B13_17b3:		.db $00				; 00
B13_17b4:		ora ($94, x)	; 01 94
B13_17b6:	.db $07
B13_17b7:		sty $07, x		; 94 07
B13_17b9:		.db $00				; 00
B13_17ba:		.db $00				; 00
B13_17bb:		.db $00				; 00
B13_17bc:		.db $00				; 00
B13_17bd:	.db $13
B13_17be:		ora ($30, x)	; 01 30
B13_17c0:		.db $00				; 00
B13_17c1:		cli				; 58 
B13_17c2:		.db $00				; 00
B13_17c3:		.db $00				; 00
B13_17c4:		ora ($98, x)	; 01 98
B13_17c6:		asl a			; 0a
B13_17c7:		sty $00			; 84 00
B13_17c9:		.db $00				; 00
B13_17ca:		.db $00				; 00
B13_17cb:		.db $00				; 00
B13_17cc:		.db $00				; 00
B13_17cd:	.db $13
B13_17ce:		ora ($30, x)	; 01 30
B13_17d0:		.db $00				; 00
B13_17d1:	.db $6e $00 $00
B13_17d4:		ora ($00, x)	; 01 00
B13_17d6:		.db $00				; 00
B13_17d7:		.db $00				; 00
B13_17d8:		.db $00				; 00
B13_17d9:		.db $00				; 00
B13_17da:		.db $00				; 00
B13_17db:		.db $00				; 00
B13_17dc:		.db $00				; 00
B13_17dd:	.db $2f
B13_17de:		ora ($00, x)	; 01 00
B13_17e0:		bpl B13_17e2 ; 10 00

B13_17e2:		.db $00				; 00
B13_17e3:		.db $00				; 00
B13_17e4:		.db $00				; 00
B13_17e5:	.db $80
B13_17e6:		.db $00				; 00
B13_17e7:	.db $80
B13_17e8:	.db $ff
B13_17e9:		rts				; 60 


B13_17ea:		.db $00				; 00
B13_17eb:		.db $00				; 00
B13_17ec:		.db $00				; 00
B13_17ed:		and ($01), y	; 31 01
B13_17ef:		.db $00				; 00
B13_17f0:		php				; 08 
B13_17f1:	.db $03
B13_17f2:		.db $00				; 00
B13_17f3:		.db $00				; 00
B13_17f4:		ora ($20, x)	; 01 20
B13_17f6:	.db $53
B13_17f7:		clv				; b8

.ifdef ROM_JP
	lda #$00
	sta $d3

	lda #$20
	sta $0e
	lda #$80
	sta $0f
	lda #$65
	jsr $fd78

	lda #$65
	jsr $fd11

	lda #$20
	sta $0e
	lda #$c4
	sta $0f
	lda #$63
	jsr $fd78

	lda #$23
	sta $0e
	lda #$c0
	sta $0f
	lda #$64
	jsr $fd78
	jsr $dfcf
	lda #$01
	jmp $b8c1
	jsr $b871
	sei
.endif

B13_17f8:		lda #>$2080		; a9 20
B13_17fa:		sta wCurrLayoutRowPPUAddrBE			; 85 0e
B13_17fc:		lda #<$2080		; a9 80
B13_17fe:		sta wCurrLayoutRowPPUAddrBE+1			; 85 0f
B13_1800:		lda #SL_titleScreenCutscene		; a9 65
B13_1802:		jsr drawStaticLayoutIdxedYAtCurrPPUAddr		; 20 dd fc

B13_1805:		lda #SL_titleScreenCutscene		; a9 65
B13_1807:		jsr drawStaticLayoutIdxedY		; 20 76 fc

B13_180a:		lda #>$23c0		; a9 23
B13_180c:		sta wCurrLayoutRowPPUAddrBE			; 85 0e
B13_180e:		lda #<$23c0		; a9 c0
B13_1810:		sta wCurrLayoutRowPPUAddrBE+1			; 85 0f
B13_1812:		lda #$66		; a9 66
B13_1814:		jsr drawStaticLayoutIdxedYAtCurrPPUAddr		; 20 dd fc

.ifdef ROM_JP
	cli
.endif

B13_1817:		jsr func_e_1fcf		; 20 cf df
B13_181a:		lda #$0a		; a9 0a
B13_181c:		jsr func_08e5		; 20 e5 e8
B13_181f:		lda #$00		; a9 00
B13_1821:		jmp func_d_18a3		; 4c a3 b8


func_d_1824:
B13_1824:		jsr func_d_1853		; 20 53 b8
B13_1827:		lda #$00		; a9 00
B13_1829:		sta $d3			; 85 d3

// nametable 0
	lda #>$2080
	sta wCurrLayoutRowPPUAddrBE
	lda #<$2080
	sta wCurrLayoutRowPPUAddrBE+1
	lda #SL_titleScreenCutscene
	jsr drawStaticLayoutIdxedYAtCurrPPUAddr

// nametable 1
	lda #SL_titleScreenCutscene
	jsr drawStaticLayoutIdxedY

.ifdef ROM_JP
	lda #$20
	sta $0e
	lda #$c4
	sta $0f
.endif

// nametable 0
	lda #SL_titleScreenCutsceneBopBox
	jsr drawStaticLayoutIdxedY

.ifdef ROM_JP
	lda #$23
	sta $0e
	lda #$c0
	sta $0f
.endif

	lda #SL_titleScreenCutsceneNametable0Palettes
	jsr drawStaticLayoutIdxedY

B13_1847:		jsr func_e_1fcf		; 20 cf df
B13_184a:		lda #$80		; a9 80
B13_184c:		sta $9c			; 85 9c
B13_184e:		lda #$01		; a9 01
B13_1850:		jmp func_d_18a3		; 4c a3 b8


func_d_1853:
B13_1853:		lda #$08		; a9 08
B13_1855:		jsr func_0578		; 20 78 e5
B13_1858:		jsr func_e_1fda		; 20 da df
B13_185b:		jsr $fe59		; 20 59 fe
B13_185e:		lda #$00		; a9 00
B13_1860:		sta $fd			; 85 fd
B13_1862:		sta $fc			; 85 fc
B13_1864:		sta $0178		; 8d 78 01
B13_1867:		sta $d1			; 85 d1
B13_1869:		lda $ff			; a5 ff
B13_186b:		and #$fe		; 29 fe
B13_186d:		sta $d2			; 85 d2
B13_186f:		sta $ff			; 85 ff
B13_1871:		jsr loadFollowingDataIntoInternalPalettes2BG		; 20 c9 e3
	.db $0f
	.db $20 $10 $29
	.db $20 $10 $25
	.db $20 $10 $26
	.db $20 $10 $21

B13_1881:		jsr loadFollowingDataIntoInternalPalettes2Spr		; 20 0c e4
	.db $30 $21 $0f
	.db $30 $25 $0f
	.db $30 $29 $0f
	.db $30 $26 $0f

B13_1890:		lda #$34		; a9 34
B13_1892:		sta wShadow2KBChrBank0.w		; 8d 69 01
B13_1895:		lda #$36		; a9 36
B13_1897:		sta wShadow2KBChrBank1.w		; 8d 6a 01
B13_189a:		jsr wOam_outOfYbounds		; 20 6a e5
B13_189d:		lda #$fc		; a9 fc
B13_189f:		jsr fillFirst3nametablesWithA_clearPalettes		; 20 74 df
B13_18a2:		rts				; 60 


func_d_18a3:
B13_18a3:		asl a			; 0a
B13_18a4:		tay				; a8 
B13_18a5:		lda $b991, y	; b9 91 b9
B13_18a8:		sta $f5			; 85 f5
B13_18aa:		lda $b992, y	; b9 92 b9
B13_18ad:		sta $f6			; 85 f6
B13_18af:		lda #$00		; a9 00
B13_18b1:		sta $d4			; 85 d4
B13_18b3:		lda #$03		; a9 03
B13_18b5:		sta $28			; 85 28
B13_18b7:		lda #$08		; a9 08
B13_18b9:		jsr func_05cb		; 20 cb e5
B13_18bc:		lda $9c			; a5 9c
B13_18be:		cmp #$ff		; c9 ff
B13_18c0:		bne B13_18c5 ; d0 03

B13_18c2:		jmp $b90c		; 4c 0c b9


B13_18c5:		ldy $d4			; a4 d4
B13_18c7:		inc $d4			; e6 d4
B13_18c9:		lda ($f5), y	; b1 f5
B13_18cb:		jsr jumpTable		; 20 a6 e6
	.dw $b91e
	.dw $b92a
	.dw $b937
	.dw $b949
	.dw $b943
	.dw $b8dc
	.dw $b90c
B13_18dc:		dec $0178
B13_18df:		lda #$02
B13_18e1:		sta wBitmapOfPalettesToFadeOut.w		; 8d 5f 01
B13_18e4:		lda #$01		; a9 01
B13_18e6:		jsr $e57d		; 20 7d e5
B13_18e9:		lda #$5c		; a9 5c
B13_18eb:		jsr $fced		; 20 ed fc
B13_18ee:		ldx #$00		; a2 00
B13_18f0:		jsr func_0530		; 20 30 e5
B13_18f3:		lda #$20		; a9 20
B13_18f5:		sta $01a5		; 8d a5 01
B13_18f8:		lda #$10		; a9 10
B13_18fa:		sta $01a6		; 8d a6 01
B13_18fd:		lda #$21		; a9 21
B13_18ff:		sta $01a7		; 8d a7 01
B13_1902:		lda #$02		; a9 02
B13_1904:		sta wBitmapOfPalettesToFadeOut.w		; 8d 5f 01
B13_1907:		lda #$10		; a9 10
B13_1909:		jmp $e5d0		; 4c d0 e5


B13_190c:		lda #$10		; a9 10
B13_190e:		jsr func_0578		; 20 78 e5
B13_1911:		lda #$00		; a9 00
B13_1913:		sta $28			; 85 28
B13_1915:		sta $9c			; 85 9c
B13_1917:		sta $a0			; 85 a0
B13_1919:		sta $a2			; 85 a2
B13_191b:		jmp func_e_1fda		; 4c da df


B13_191e:		ldy $d4			; a4 d4
B13_1920:		inc $d4			; e6 d4
B13_1922:		lda ($f5), y	; b1 f5
B13_1924:		jsr $b94f		; 20 4f b9
B13_1927:		jmp $b8bc		; 4c bc b8


B13_192a:		ldy $d4			; a4 d4
B13_192c:		inc $d4			; e6 d4
B13_192e:		lda ($f5), y	; b1 f5
B13_1930:		tax				; aa 
B13_1931:		jsr func_0530		; 20 30 e5
B13_1934:		jmp $b8bc		; 4c bc b8


B13_1937:		ldy $d4			; a4 d4
B13_1939:		inc $d4			; e6 d4
B13_193b:		lda ($f5), y	; b1 f5
B13_193d:		jsr $fced		; 20 ed fc
B13_1940:		jmp $b8bc		; 4c bc b8


B13_1943:		jsr $b961		; 20 61 b9
B13_1946:		jmp $b8bc		; 4c bc b8


B13_1949:		jsr $b96f		; 20 6f b9
B13_194c:		jmp $b8bc		; 4c bc b8


B13_194f:		tax				; aa 
B13_1950:		lda #$22		; a9 22
B13_1952:		sta $0d			; 85 0d
B13_1954:		lda #$a6		; a9 a6
B13_1956:		sta $0e			; 85 0e
B13_1958:		lda #$ff		; a9 ff
B13_195a:		sta $0179		; 8d 79 01
B13_195d:		txa				; 8a 
B13_195e:		jmp $fcc9		; 4c c9 fc


B13_1961:		lda #$00		; a9 00
B13_1963:		sta $a0			; 85 a0
B13_1965:		sta $a2			; 85 a2
B13_1967:		jsr wOam_outOfYbounds		; 20 6a e5
B13_196a:		lda #$5b		; a9 5b
B13_196c:		jmp $fced		; 4c ed fc


B13_196f:		jsr func_052e		; 20 2e e5
B13_1972:		lda $d1			; a5 d1
B13_1974:		clc				; 18 
B13_1975:		adc #$fc		; 69 fc
B13_1977:		sta $d1			; 85 d1
B13_1979:		beq B13_1990 ; f0 15

B13_197b:		bcs B13_196f ; b0 f2

B13_197d:		lda $d2			; a5 d2
B13_197f:		and #$01		; 29 01
B13_1981:		eor #$01		; 49 01
B13_1983:		sta $d3			; 85 d3
B13_1985:		lda $d2			; a5 d2
B13_1987:		and #$fe		; 29 fe
B13_1989:		ora $d3			; 05 d3
B13_198b:		sta $d2			; 85 d2
B13_198d:		jmp $b96f		; 4c 6f b9


B13_1990:		rts				; 60 


B13_1991:		sta $b9, x		; 95 b9
B13_1993:	.db $d7
B13_1994:		lda $5001, y	; b9 01 50
B13_1997:		.db $00				; 00
B13_1998:		and #$01		; 29 01
B13_199a:		bvc B13_19a0 ; 50 04

B13_199c:		.db $00				; 00
B13_199d:		rol a			; 2a
B13_199e:		ora ($50, x)	; 01 50
B13_19a0:	.db $04
B13_19a1:		.db $00				; 00
B13_19a2:	.db $2b
B13_19a3:		ora ($50, x)	; 01 50
B13_19a5:	.db $04
B13_19a6:	.db $02
B13_19a7:		eor $5e02, x	; 5d 02 5e
B13_19aa:	.db $03
B13_19ab:		ora ($50, x)	; 01 50
B13_19ad:		.db $00				; 00
B13_19ae:		bit $5001		; 2c 01 50
B13_19b1:	.db $04
B13_19b2:	.db $02
B13_19b3:	.db $5f
B13_19b4:	.db $02
B13_19b5:		rts				; 60 


B13_19b6:	.db $03
B13_19b7:		ora ($50, x)	; 01 50
B13_19b9:		.db $00				; 00
B13_19ba:		and $5001		; 2d 01 50
B13_19bd:	.db $04
B13_19be:	.db $02
B13_19bf:		adc $02			; 65 02
B13_19c1:		ror $03			; 66 03
B13_19c3:		ora ($50, x)	; 01 50
B13_19c5:		.db $00				; 00
B13_19c6:		rol $5001		; 2e 01 50
B13_19c9:	.db $04
B13_19ca:	.db $02
B13_19cb:	.db $63
B13_19cc:	.db $02
B13_19cd:	.db $64
B13_19ce:	.db $03
B13_19cf:		ora ($50, x)	; 01 50
B13_19d1:		.db $00				; 00
B13_19d2:	.db $2f
B13_19d3:		ora ($e0, x)	; 01 e0
B13_19d5:	.db $04
B13_19d6:		ora $01			; 05 01
B13_19d8:		plp				; 28 
B13_19d9:		.db $00				; 00
B13_19da:		;removed
	.db $30 $01

B13_19dc:		;removed
	.db $d0 $04

B13_19de:		.db $00				; 00
B13_19df:		and ($01), y	; 31 01
B13_19e1:		bne B13_19e7 ; d0 04

B13_19e3:		.db $00				; 00
B13_19e4:	.db $32
B13_19e5:		ora ($d0, x)	; 01 d0
B13_19e7:	.db $04
B13_19e8:		.db $00				; 00
B13_19e9:	.db $33
B13_19ea:		ora ($d0, x)	; 01 d0
B13_19ec:	.db $04
B13_19ed:		.db $00				; 00
B13_19ee:	.db $34
B13_19ef:		ora ($d0, x)	; 01 d0
B13_19f1:	.db $04
B13_19f2:		.db $00				; 00
B13_19f3:		and $01, x		; 35 01
B13_19f5:		;removed
	.db $d0 $04

B13_19f7:		.db $00				; 00
B13_19f8:		rol $01, x		; 36 01
B13_19fa:		bne B13_1a00 ; d0 04

B13_19fc:		.db $00				; 00
B13_19fd:	.db $37
B13_19fe:		ora ($d0, x)	; 01 d0
B13_1a00:	.db $04
B13_1a01:		asl $ee			; 06 ee
B13_1a03:	.db $02
B13_1a04:		ora $ee			; 05 ee
B13_1a06:	.db $02
B13_1a07:	.db $03
B13_1a08:		inc $0312		; ee 12 03
B13_1a0b:		inc $0322		; ee 22 03
B13_1a0e:		inc $0332		; ee 32 03
B13_1a11:		inc $0342		; ee 42 03
B13_1a14:		inc $0352		; ee 52 03
B13_1a17:		inc $0362		; ee 62 03
B13_1a1a:		inc $0372		; ee 72 03
B13_1a1d:		inc $0382		; ee 82 03
B13_1a20:		inc $0392		; ee 92 03
B13_1a23:		inc $03a2		; ee a2 03
B13_1a26:		inc $03b2		; ee b2 03
B13_1a29:		inc $03c2		; ee c2 03
B13_1a2c:		inc $03d2		; ee d2 03
B13_1a2f:		inc $03e2		; ee e2 03
B13_1a32:		inc $03f2		; ee f2 03
B13_1a35:		inc wEntityStructs.tileY.w		; ee 02 04
B13_1a38:		inc $0412		; ee 12 04
B13_1a3b:		inc $0422		; ee 22 04
B13_1a3e:		inc $0432		; ee 32 04
B13_1a41:		inc $0442		; ee 42 04
B13_1a44:		inc $0452		; ee 52 04
B13_1a47:		inc $0462		; ee 62 04
B13_1a4a:		inc $0472		; ee 72 04
B13_1a4d:		rts				; 60 


B13_1a4e:		dec $0502		; ce 02 05
B13_1a51:		dec $0302		; ce 02 03
B13_1a54:		dec $0312		; ce 12 03
B13_1a57:		dec $0322		; ce 22 03
B13_1a5a:		dec $0332		; ce 32 03
B13_1a5d:		dec $0342		; ce 42 03
B13_1a60:		dec $0352		; ce 52 03
B13_1a63:		dec $0362		; ce 62 03
B13_1a66:		dec $0372		; ce 72 03
B13_1a69:		dec $0382		; ce 82 03
B13_1a6c:		dec $0392		; ce 92 03
B13_1a6f:		dec $03a2		; ce a2 03
B13_1a72:		dec $03b2		; ce b2 03
B13_1a75:		dec $03c2		; ce c2 03
B13_1a78:		dec $03d2		; ce d2 03
B13_1a7b:		dec $03e2		; ce e2 03
B13_1a7e:		dec $03f2		; ce f2 03
B13_1a81:		dec wEntityStructs.tileY.w		; ce 02 04
B13_1a84:		dec $0412		; ce 12 04
B13_1a87:		dec $0422		; ce 22 04
B13_1a8a:		dec $0432		; ce 32 04
B13_1a8d:		dec $0442		; ce 42 04
B13_1a90:		dec $0452		; ce 52 04
B13_1a93:		dec $0462		; ce 62 04
B13_1a96:		dec $0472		; ce 72 04
B13_1a99:		rts				; 60 


B13_1a9a:		jsr $baa0		; 20 a0 ba
B13_1a9d:		jmp $bc33		; 4c 33 bc


B13_1aa0:		lda $34			; a5 34
B13_1aa2:		bne B13_1aa5 ; d0 01

B13_1aa4:		rts				; 60 


B13_1aa5:		clc				; 18 
B13_1aa6:		adc $31			; 65 31
B13_1aa8:		sta $0e			; 85 0e
B13_1aaa:		lda $34			; a5 34
B13_1aac:		bmi B13_1ab2 ; 30 04

B13_1aae:		lda #$00		; a9 00
B13_1ab0:		beq B13_1ab4 ; f0 02

B13_1ab2:		lda #$ff		; a9 ff
B13_1ab4:		adc $30			; 65 30
B13_1ab6:		sta $0f			; 85 0f
B13_1ab8:		lda $30			; a5 30
B13_1aba:		sta $0d			; 85 0d
B13_1abc:		lda $34			; a5 34
B13_1abe:		bpl B13_1ac3 ; 10 03

B13_1ac0:		jmp $bb79		; 4c 79 bb


B13_1ac3:		lda $04ea		; ad ea 04
B13_1ac6:		and #$02		; 29 02
B13_1ac8:		bne B13_1b16 ; d0 4c

B13_1aca:		lda $04e9		; ad e9 04
B13_1acd:		and #$01		; 29 01
B13_1acf:		beq B13_1ad9 ; f0 08

B13_1ad1:		lda #$01		; a9 01
B13_1ad3:		and $99			; 25 99
B13_1ad5:		bne B13_1b16 ; d0 3f

B13_1ad7:		beq B13_1b09 ; f0 30

B13_1ad9:		lda #$10		; a9 10
B13_1adb:		and $4b			; 25 4b
B13_1add:		bne B13_1ae5 ; d0 06

B13_1adf:		lda #$01		; a9 01
B13_1ae1:		and $4c			; 25 4c
B13_1ae3:		beq B13_1b10 ; f0 2b

B13_1ae5:		lda $04ec		; ad ec 04
B13_1ae8:		and #$01		; 29 01
B13_1aea:		bne B13_1af0 ; d0 04

B13_1aec:		lda #$c3		; a9 c3
B13_1aee:		bne B13_1af2 ; d0 02

B13_1af0:		lda #$83		; a9 83
B13_1af2:		clc				; 18 
B13_1af3:		adc $0e			; 65 0e
B13_1af5:		lda $0f			; a5 0f
B13_1af7:		adc #$ff		; 69 ff
B13_1af9:		eor $0f			; 45 0f
B13_1afb:		and #$f0		; 29 f0
B13_1afd:		beq B13_1b09 ; f0 0a

B13_1aff:		lda #$00		; a9 00
B13_1b01:		sta $31			; 85 31
B13_1b03:		lda $0f			; a5 0f
B13_1b05:		and #$f0		; 29 f0
B13_1b07:		sta $30			; 85 30
B13_1b09:		lda #$00		; a9 00
B13_1b0b:		sta $34			; 85 34
B13_1b0d:		jmp $bc02		; 4c 02 bc


B13_1b10:		lda #$01		; a9 01
B13_1b12:		and $4b			; 25 4b
B13_1b14:		beq B13_1b09 ; f0 f3

B13_1b16:		lda $0e			; a5 0e
B13_1b18:		sta $31			; 85 31
B13_1b1a:		lda $0f			; a5 0f
B13_1b1c:		sta $30			; 85 30
B13_1b1e:		eor $0d			; 45 0d
B13_1b20:		and #$f0		; 29 f0
B13_1b22:		beq B13_1b76 ; f0 52

B13_1b24:		lda $04e9		; ad e9 04
B13_1b27:		and #$01		; 29 01
B13_1b29:		beq B13_1b4e ; f0 23

B13_1b2b:		lda $30			; a5 30
B13_1b2d:		cmp $9a			; c5 9a
B13_1b2f:		beq B13_1b3b ; f0 0a

B13_1b31:		bcc B13_1b3b ; 90 08

B13_1b33:		cmp #$f0		; c9 f0
B13_1b35:		bcc B13_1b4e ; 90 17

B13_1b37:		lda $9a			; a5 9a
B13_1b39:		bne B13_1b4e ; d0 13

B13_1b3b:		lda $9a			; a5 9a
B13_1b3d:		sta $30			; 85 30
B13_1b3f:		lda #$00		; a9 00
B13_1b41:		sta $31			; 85 31
B13_1b43:		lda $04e9		; ad e9 04
B13_1b46:		and #$fe		; 29 fe
B13_1b48:		sta $04e9		; 8d e9 04
B13_1b4b:		jmp $bb55		; 4c 55 bb


B13_1b4e:		lda $04ea		; ad ea 04
B13_1b51:		and #$02		; 29 02
B13_1b53:		bne B13_1b76 ; d0 21

B13_1b55:		lda $30			; a5 30
B13_1b57:		sta $00			; 85 00
B13_1b59:		lda $32			; a5 32
B13_1b5b:		sta $02			; 85 02
B13_1b5d:		jsr $f3a4		; 20 a4 f3
B13_1b60:		lda $4b			; a5 4b
B13_1b62:		and #$10		; 29 10
B13_1b64:		bne B13_1b6c ; d0 06

B13_1b66:		lda $4c			; a5 4c
B13_1b68:		and #$01		; 29 01
B13_1b6a:		beq B13_1b76 ; f0 0a

B13_1b6c:		lda $30			; a5 30
B13_1b6e:		and #$f0		; 29 f0
B13_1b70:		sta $30			; 85 30
B13_1b72:		lda #$00		; a9 00
B13_1b74:		sta $31			; 85 31
B13_1b76:		jmp $bc02		; 4c 02 bc


B13_1b79:		lda $04ea		; ad ea 04
B13_1b7c:		and #$02		; 29 02
B13_1b7e:		bne B13_1bba ; d0 3a

B13_1b80:		lda $04e9		; ad e9 04
B13_1b83:		and #$01		; 29 01
B13_1b85:		beq B13_1b8f ; f0 08

B13_1b87:		lda #$02		; a9 02
B13_1b89:		and $99			; 25 99
B13_1b8b:		bne B13_1bba ; d0 2d

B13_1b8d:		beq B13_1bad ; f0 1e

B13_1b8f:		lda #$20		; a9 20
B13_1b91:		and $4b			; 25 4b
B13_1b93:		bne B13_1b9b ; d0 06

B13_1b95:		lda #$02		; a9 02
B13_1b97:		and $4c			; 25 4c
B13_1b99:		beq B13_1bb4 ; f0 19

B13_1b9b:		lda $0f			; a5 0f
B13_1b9d:		eor $0d			; 45 0d
B13_1b9f:		and #$f0		; 29 f0
B13_1ba1:		beq B13_1bb4 ; f0 11

B13_1ba3:		lda #$00		; a9 00
B13_1ba5:		sta $31			; 85 31
B13_1ba7:		lda $30			; a5 30
B13_1ba9:		and #$f0		; 29 f0
B13_1bab:		sta $30			; 85 30
B13_1bad:		lda #$00		; a9 00
B13_1baf:		sta $34			; 85 34
B13_1bb1:		jmp $bc02		; 4c 02 bc


B13_1bb4:		lda #$02		; a9 02
B13_1bb6:		and $4b			; 25 4b
B13_1bb8:		beq B13_1bad ; f0 f3

B13_1bba:		lda $0e			; a5 0e
B13_1bbc:		sta $31			; 85 31
B13_1bbe:		lda $0f			; a5 0f
B13_1bc0:		sta $30			; 85 30
B13_1bc2:		eor $0d			; 45 0d
B13_1bc4:		and #$f0		; 29 f0
B13_1bc6:		beq B13_1c02 ; f0 3a

B13_1bc8:		lda $04e9		; ad e9 04
B13_1bcb:		and #$01		; 29 01
B13_1bcd:		beq B13_1bf0 ; f0 21

B13_1bcf:		lda $30			; a5 30
B13_1bd1:		cmp $9a			; c5 9a
B13_1bd3:		bcc B13_1bdd ; 90 08

B13_1bd5:		cmp #$f0		; c9 f0
B13_1bd7:		bcc B13_1bf0 ; 90 17

B13_1bd9:		lda $9a			; a5 9a
B13_1bdb:		bne B13_1bf0 ; d0 13

B13_1bdd:		lda $9a			; a5 9a
B13_1bdf:		sta $30			; 85 30
B13_1be1:		lda #$00		; a9 00
B13_1be3:		sta $31			; 85 31
B13_1be5:		lda $04e9		; ad e9 04
B13_1be8:		and #$fe		; 29 fe
B13_1bea:		sta $04e9		; 8d e9 04
B13_1bed:		jmp $bbf7		; 4c f7 bb


B13_1bf0:		lda $04ea		; ad ea 04
B13_1bf3:		and #$02		; 29 02
B13_1bf5:		bne B13_1c02 ; d0 0b

B13_1bf7:		lda $30			; a5 30
B13_1bf9:		sta $00			; 85 00
B13_1bfb:		lda $32			; a5 32
B13_1bfd:		sta $02			; 85 02
B13_1bff:		jsr $f3a4		; 20 a4 f3
B13_1c02:		lda $30			; a5 30
B13_1c04:		sta $00			; 85 00
B13_1c06:		lda $31			; a5 31
B13_1c08:		lsr $00			; 46 00
B13_1c0a:		ror a			; 6a
B13_1c0b:		lsr $00			; 46 00
B13_1c0d:		ror a			; 6a
B13_1c0e:		lsr $00			; 46 00
B13_1c10:		ror a			; 6a
B13_1c11:		lsr $00			; 46 00
B13_1c13:		ror a			; 6a
B13_1c14:		sta $fd			; 85 fd
B13_1c16:		lda $ff			; a5 ff
B13_1c18:		and #$01		; 29 01
B13_1c1a:		eor $00			; 45 00
B13_1c1c:		and #$01		; 29 01
B13_1c1e:		beq B13_1c32 ; f0 12

B13_1c20:		lda $ff			; a5 ff
B13_1c22:		and #$01		; 29 01
B13_1c24:		bne B13_1c2c ; d0 06

B13_1c26:		lda $ff			; a5 ff
B13_1c28:		ora #$01		; 09 01
B13_1c2a:		bne B13_1c30 ; d0 04

B13_1c2c:		lda $ff			; a5 ff
B13_1c2e:		and #$fe		; 29 fe
B13_1c30:		sta $ff			; 85 ff
B13_1c32:		rts				; 60 


B13_1c33:		lda $35			; a5 35
B13_1c35:		bne B13_1c38 ; d0 01

B13_1c37:		rts				; 60 


B13_1c38:		clc				; 18 
B13_1c39:		adc $33			; 65 33
B13_1c3b:		sta $0e			; 85 0e
B13_1c3d:		lda $35			; a5 35
B13_1c3f:		bmi B13_1c45 ; 30 04

B13_1c41:		lda #$00		; a9 00
B13_1c43:		beq B13_1c47 ; f0 02

B13_1c45:		lda #$ff		; a9 ff
B13_1c47:		adc $32			; 65 32
B13_1c49:		sta $0f			; 85 0f
B13_1c4b:		lda $32			; a5 32
B13_1c4d:		sta $0d			; 85 0d
B13_1c4f:		lda $35			; a5 35
B13_1c51:		bpl B13_1c56 ; 10 03

B13_1c53:		jmp $bcfa		; 4c fa bc


B13_1c56:		lda $04ea		; ad ea 04
B13_1c59:		and #$02		; 29 02
B13_1c5b:		bne B13_1ca9 ; d0 4c

B13_1c5d:		lda $04e9		; ad e9 04
B13_1c60:		and #$01		; 29 01
B13_1c62:		beq B13_1c6c ; f0 08

B13_1c64:		lda #$04		; a9 04
B13_1c66:		and $99			; 25 99
B13_1c68:		bne B13_1ca9 ; d0 3f

B13_1c6a:		beq B13_1c9c ; f0 30

B13_1c6c:		lda #$40		; a9 40
B13_1c6e:		and $4b			; 25 4b
B13_1c70:		bne B13_1c78 ; d0 06

B13_1c72:		lda #$04		; a9 04
B13_1c74:		and $4c			; 25 4c
B13_1c76:		beq B13_1ca3 ; f0 2b

B13_1c78:		lda $04ec		; ad ec 04
B13_1c7b:		and #$04		; 29 04
B13_1c7d:		bne B13_1c83 ; d0 04

B13_1c7f:		lda #$c3		; a9 c3
B13_1c81:		bne B13_1c85 ; d0 02

B13_1c83:		lda #$83		; a9 83
B13_1c85:		clc				; 18 
B13_1c86:		adc $0e			; 65 0e
B13_1c88:		lda $0f			; a5 0f
B13_1c8a:		adc #$ff		; 69 ff
B13_1c8c:		eor $0f			; 45 0f
B13_1c8e:		and #$f0		; 29 f0
B13_1c90:		beq B13_1c9c ; f0 0a

B13_1c92:		lda #$00		; a9 00
B13_1c94:		sta $33			; 85 33
B13_1c96:		lda $0f			; a5 0f
B13_1c98:		and #$f0		; 29 f0
B13_1c9a:		sta $32			; 85 32
B13_1c9c:		lda #$00		; a9 00
B13_1c9e:		sta $35			; 85 35
B13_1ca0:		jmp $bd8e		; 4c 8e bd


B13_1ca3:		lda #$04		; a9 04
B13_1ca5:		and $4b			; 25 4b
B13_1ca7:		beq B13_1c9c ; f0 f3

B13_1ca9:		lda $0e			; a5 0e
B13_1cab:		sta $33			; 85 33
B13_1cad:		lda $0f			; a5 0f
B13_1caf:		sta $32			; 85 32
B13_1cb1:		and #$0f		; 29 0f
B13_1cb3:		cmp #$0f		; c9 0f
B13_1cb5:		bne B13_1cf7 ; d0 40

B13_1cb7:		lda $04ea		; ad ea 04
B13_1cba:		and #$02		; 29 02
B13_1cbc:		bne B13_1cf7 ; d0 39

B13_1cbe:		lda $04e9		; ad e9 04
B13_1cc1:		and #$01		; 29 01
B13_1cc3:		beq B13_1cd1 ; f0 0c

B13_1cc5:		lda $04e9		; ad e9 04
B13_1cc8:		and #$fe		; 29 fe
B13_1cca:		sta $04e9		; 8d e9 04
B13_1ccd:		lda #$00		; a9 00
B13_1ccf:		sta $33			; 85 33
B13_1cd1:		jsr $ba02		; 20 02 ba
B13_1cd4:		inc $32			; e6 32
B13_1cd6:		lda $32			; a5 32
B13_1cd8:		sta $02			; 85 02
B13_1cda:		lda $30			; a5 30
B13_1cdc:		sta $00			; 85 00
B13_1cde:		jsr $f3a4		; 20 a4 f3
B13_1ce1:		lda $4b			; a5 4b
B13_1ce3:		and #$40		; 29 40
B13_1ce5:		bne B13_1ced ; d0 06

B13_1ce7:		lda $4c			; a5 4c
B13_1ce9:		and #$04		; 29 04
B13_1ceb:		beq B13_1cf7 ; f0 0a

B13_1ced:		lda $32			; a5 32
B13_1cef:		and #$f0		; 29 f0
B13_1cf1:		sta $32			; 85 32
B13_1cf3:		lda #$00		; a9 00
B13_1cf5:		sta $33			; 85 33
B13_1cf7:		jmp $bd8e		; 4c 8e bd


B13_1cfa:		lda $04ea		; ad ea 04
B13_1cfd:		and #$02		; 29 02
B13_1cff:		bne B13_1d35 ; d0 34

B13_1d01:		lda $04e9		; ad e9 04
B13_1d04:		and #$01		; 29 01
B13_1d06:		beq B13_1d10 ; f0 08

B13_1d08:		lda #$08		; a9 08
B13_1d0a:		and $99			; 25 99
B13_1d0c:		bne B13_1d3b ; d0 2d

B13_1d0e:		beq B13_1d2e ; f0 1e

B13_1d10:		lda #$80		; a9 80
B13_1d12:		and $4b			; 25 4b
B13_1d14:		bne B13_1d1c ; d0 06

B13_1d16:		lda #$08		; a9 08
B13_1d18:		and $4c			; 25 4c
B13_1d1a:		beq B13_1d35 ; f0 19

B13_1d1c:		lda $0f			; a5 0f
B13_1d1e:		eor $0d			; 45 0d
B13_1d20:		and #$f0		; 29 f0
B13_1d22:		beq B13_1d35 ; f0 11

B13_1d24:		lda #$00		; a9 00
B13_1d26:		sta $33			; 85 33
B13_1d28:		lda $32			; a5 32
B13_1d2a:		and #$f0		; 29 f0
B13_1d2c:		sta $32			; 85 32
B13_1d2e:		lda #$00		; a9 00
B13_1d30:		sta $35			; 85 35
B13_1d32:		jmp $bd8e		; 4c 8e bd


B13_1d35:		lda #$08		; a9 08
B13_1d37:		and $4b			; 25 4b
B13_1d39:		beq B13_1d2e ; f0 f3

B13_1d3b:		lda $0e			; a5 0e
B13_1d3d:		sta $33			; 85 33
B13_1d3f:		lda $0f			; a5 0f
B13_1d41:		sta $32			; 85 32
B13_1d43:		eor $0d			; 45 0d
B13_1d45:		and #$f0		; 29 f0
B13_1d47:		beq B13_1d8e ; f0 45

B13_1d49:		lda $04e9		; ad e9 04
B13_1d4c:		and #$01		; 29 01
B13_1d4e:		beq B13_1d73 ; f0 23

B13_1d50:		lda $32			; a5 32
B13_1d52:		cmp $9a			; c5 9a
B13_1d54:		bcc B13_1d5e ; 90 08

B13_1d56:		cmp #$f0		; c9 f0
B13_1d58:		bcc B13_1d73 ; 90 19

B13_1d5a:		lda $9a			; a5 9a
B13_1d5c:		bne B13_1d73 ; d0 15

B13_1d5e:		lda $9a			; a5 9a
B13_1d60:		sta $32			; 85 32
B13_1d62:		lda #$00		; a9 00
B13_1d64:		sta $33			; 85 33
B13_1d66:		lda $04e9		; ad e9 04
B13_1d69:		and #$fe		; 29 fe
B13_1d6b:		sta $04e9		; 8d e9 04
B13_1d6e:		lda $32			; a5 32
B13_1d70:		jmp $bd85		; 4c 85 bd


B13_1d73:		lda $04ea		; ad ea 04
B13_1d76:		and #$02		; 29 02
B13_1d78:		bne B13_1d8e ; d0 14

B13_1d7a:		jsr $ba4e		; 20 4e ba
B13_1d7d:		lda $32			; a5 32
B13_1d7f:		and #$f0		; 29 f0
B13_1d81:		ora #$0e		; 09 0e
B13_1d83:		sta $32			; 85 32
B13_1d85:		sta $02			; 85 02
B13_1d87:		lda $30			; a5 30
B13_1d89:		sta $00			; 85 00
B13_1d8b:		jsr $f3a4		; 20 a4 f3
B13_1d8e:		lda $33			; a5 33
B13_1d90:		sta $00			; 85 00
B13_1d92:		lda $32			; a5 32
B13_1d94:		asl $00			; 06 00
B13_1d96:		rol a			; 2a
B13_1d97:		asl $00			; 06 00
B13_1d99:		rol a			; 2a
B13_1d9a:		asl $00			; 06 00
B13_1d9c:		rol a			; 2a
B13_1d9d:		asl $00			; 06 00
B13_1d9f:		rol a			; 2a
B13_1da0:		sta $fc			; 85 fc
B13_1da2:		rts				; 60 
