
initEntity:
	lda entityInitTable.w, y
	sta wNonGenericJumpTableAddr
	lda entityInitTable.w+1, y
	sta wNonGenericJumpTableAddr+1
	jmp (wNonGenericJumpTableAddr)


func_7_000d:
B7_000d:		lda data_7_001a.w, y	; b9 1a a0
B7_0010:		sta wNonGenericJumpTableAddr			; 85 00
B7_0012:		lda data_7_001a.w+1, y	; b9 1b a0
B7_0015:		sta wNonGenericJumpTableAddr+1			; 85 01
B7_0017:		jmp (wNonGenericJumpTableAddr)

data_7_001a:
	.dw enUpdate_freeonFight_2
	.dw enUpdate_fight01
	.dw enUpdate_fight02
	.dw enUpdate_fight03
	.dw enUpdate_fight04
	.dw enUpdate_fight05
	.dw enUpdate_fight06
	.dw enUpdate_fight07
	.dw enUpdate_fight08
	.dw enUpdate_fight09
	.dw enUpdate_fight0a


entityInitTable:
	.dw enInit_00
	.dw enInit_01
	.dw enInit_02
	.dw enInit_03
	.dw enInit_stub
	.dw enInit_stub
	.dw enInit_06
	.dw enInit_07
	.dw $a227
	.dw $a249
	.dw $a2a0
	.dw enInit_stub
	.dw $a2ce
	.dw $a336
	.dw enInit_roomSideEntrance
	.dw enInit_treasureChest
	.dw $ae9c
	.dw enInit_smallGhost
	.dw $a4be
	.dw $a51a
	.dw $a566
	.dw $a5b5
	.dw $a5ca
	.dw $aeef
	.dw $af07
	.dw $af34
	.dw $af55
	.dw $af6d
	.dw $af8a
	.dw $af9f
	.dw $afb8
	.dw $afd5
	.dw $aff2
	.dw $aeaa
	.dw enInit_freeonFight
	.dw $b05f
	.dw $b0ab
	.dw enInit_stub
	.dw $a5f0
	.dw $a643
	.dw $a694
	.dw $a6d3
	.dw $a6ed
	.dw $a714
	.dw $a737
	.dw $a75d
	.dw $a765
	.dw enInit_stub
	.dw $a77e
	.dw enInit_stub
	.dw $a79b
	.dw enInit_doorEntrance
	.dw $b0f7
	.dw $b13b
	.dw $b153
	.dw $b178
	.dw $a846
	.dw $b199
	.dw $b1dd
	.dw $b222
	.dw $b266
	.dw $b2aa
	.dw $b2e3
	.dw $b32c
	.dw $a897
	.dw $a920
	.dw $a92a
	.dw $a94b
	.dw $b361
	.dw $b3b3
	.dw $b3dc
	.dw enInit_stub
	.dw $a9bf
	.dw $a9e8
	.dw $aa05
	.dw $aa18
	.dw $aa37
	.dw $b416
	.dw $b437
	.dw $b453
	.dw $aa62
	.dw $aa81
	.dw $aa92
	.dw $b476
	.dw $b48f
	.dw $b4a7
	.dw $b4f0
	.dw $aac7
	.dw $ab66
	.dw enInit_dialog
	.dw $b520
	.dw $b545
	.dw $b562
	.dw $abc3
	.dw $abda
	.dw $ac11

enInit_stub:
B7_00f0:		rts				; 60 

enInit_00:
B7_00f1:		ldy #$00		; a0 00
B7_00f3:		lda $a11f, y	; b9 1f a1
B7_00f6:		tax				; aa 
B7_00f7:		lda $a120, y	; b9 20 a1
B7_00fa:		cmp $18			; c5 18
B7_00fc:		bne B7_011a ; d0 1c

B7_00fe:		lda wEntityWramOffset.w		; ad 5b 01
B7_0101:		lsr a			; 4a
B7_0102:		lsr a			; 4a
B7_0103:		lsr a			; 4a
B7_0104:		lsr a			; 4a
B7_0105:		tax				; aa 
B7_0106:		lda $18			; a5 18
B7_0108:		sta $e8, x		; 95 e8
B7_010a:		lda #$00		; a9 00
B7_010c:		sta $18			; 85 18
B7_010e:		sta $e0, x		; 95 e0
B7_0110:		ldx #$04		; a2 04
B7_0112:		jsr $8aea		; 20 ea 8a
B7_0115:		lda #$45		; a9 45
B7_0117:		jmp $8a57		; 4c 57 8a


B7_011a:		iny				; c8 
B7_011b:		dex				; ca 
B7_011c:		bne B7_00f7 ; d0 d9

B7_011e:		rts				; 60 


B7_011f:	.db $17
B7_0120:		ora ($17), y	; 11 17
B7_0122:		clc				; 18 
B7_0123:		ora $1b1a, y	; 19 1a 1b
B7_0126:	.db $1c
B7_0127:		ora $1f1e, x	; 1d 1e 1f
B7_012a:		and $36, x		; 35 36
B7_012c:	.db $37
B7_012d:		eor $4f4e		; 4d 4e 4f
B7_0130:	.db $53
B7_0131:	.db $54
B7_0132:		eor $56, x		; 55 56
B7_0134:	.db $5a
B7_0135:	.db $5b
B7_0136:	.db $5c

enInit_01:
B7_0137:		lda $051f		; ad 1f 05
B7_013a:		and #$7f		; 29 7f
B7_013c:		tay				; a8 
B7_013d:		lda wEntityStructs.byteA.w, y	; b9 0a 04
B7_0140:		sta wCurrRoomGroup.w		; 8d 62 01
B7_0143:		lda wEntityStructs.byteB.w, y	; b9 0b 04
B7_0146:		sta $0500		; 8d 00 05
B7_0149:		lda wEntityStructs.byteC.w, y	; b9 0c 04
B7_014c:		sta $0502		; 8d 02 05
B7_014f:		lda wEntityStructs.byte4.w, y	; b9 04 04
B7_0152:		sta $30			; 85 30
B7_0154:		lda wEntityStructs.byte5.w, y	; b9 05 04
B7_0157:		sta $32			; 85 32
B7_0159:		lda #$80		; a9 80
B7_015b:		sta $0501		; 8d 01 05
B7_015e:		lda #$80		; a9 80
B7_0160:		sta $01			; 85 01
B7_0162:		lda $01			; a5 01
B7_0164:		jsr unsetGlobalFlag		; 20 fc e7
B7_0167:		inc $01			; e6 01
B7_0169:		lda $01			; a5 01
B7_016b:		cmp #$cf		; c9 cf
B7_016d:		bne B7_0162 ; d0 f3

B7_016f:		lda #$00		; a9 00
B7_0171:		sta $0503		; 8d 03 05
B7_0174:		sta $0504		; 8d 04 05
B7_0177:		sta $0505		; 8d 05 05
B7_017a:		sta $31			; 85 31
B7_017c:		sta $33			; 85 33
B7_017e:		sta $051f		; 8d 1f 05
B7_0181:		sta $34			; 85 34
B7_0183:		sta $35			; 85 35
B7_0185:		tax				; aa 
B7_0186:		lda $0309, x	; bd 09 03
B7_0189:		beq B7_01a7 ; f0 1c

B7_018b:		lda $0308, x	; bd 08 03
B7_018e:		cmp #$30		; c9 30
B7_0190:		beq B7_01c6 ; f0 34

B7_0192:		cmp #$26		; c9 26
B7_0194:		beq B7_01bf ; f0 29

B7_0196:		cmp #$28		; c9 28
B7_0198:		bne B7_01a2 ; d0 08

B7_019a:		lda $050b		; ad 0b 05
B7_019d:		and #$fe		; 29 fe
B7_019f:		sta $050b		; 8d 0b 05
B7_01a2:		lda #$00		; a9 00
B7_01a4:		sta $0309, x	; 9d 09 03
B7_01a7:		txa				; 8a 
B7_01a8:		clc				; 18 
B7_01a9:		adc #$10		; 69 10
B7_01ab:		tax				; aa 
B7_01ac:		bne B7_0186 ; d0 d8

B7_01ae:		lda #$00		; a9 00
B7_01b0:		sta wEntityStructs.byte9.w, x	; 9d 09 04
B7_01b3:		txa				; 8a 
B7_01b4:		clc				; 18 
B7_01b5:		adc #$10		; 69 10
B7_01b7:		tax				; aa 
B7_01b8:		cpx #$80		; e0 80
B7_01ba:		bne B7_01ae ; d0 f2

B7_01bc:		jmp $df5b		; 4c 5b df


B7_01bf:		lda $050b		; ad 0b 05
B7_01c2:		and #$01		; 29 01
B7_01c4:		beq B7_01a2 ; f0 dc

B7_01c6:		lda $0500		; ad 00 05
B7_01c9:		sta $0300, x	; 9d 00 03
B7_01cc:		lda $0502		; ad 02 05
B7_01cf:		sta $0302, x	; 9d 02 03
B7_01d2:		jmp $a1a7		; 4c a7 a1

enInit_02:
B7_01d5:		lda #$10		; a9 10
B7_01d7:		sta wCachedEntityStruct.byteA			; 85 1a
B7_01d9:		rts				; 60 

enInit_03:
B7_01da:		lda $1b			; a5 1b
B7_01dc:		and #$80		; 29 80
B7_01de:		beq B7_020c ; f0 2c

B7_01e0:		lda #$21		; a9 21
B7_01e2:		jsr func_08fa		; 20 fa e8
B7_01e5:		lda $1b			; a5 1b
B7_01e7:		and #$7f		; 29 7f
B7_01e9:		sta wCachedEntityStruct.byteB			; 85 1b
B7_01eb:		ldx #$80		; a2 80
B7_01ed:		lda $19			; a5 19
B7_01ef:		and #$02		; 29 02
B7_01f1:		beq B7_01f7 ; f0 04

B7_01f3:		lda #$b8		; a9 b8
B7_01f5:		bne B7_01f9 ; d0 02

B7_01f7:		lda #$48		; a9 48
B7_01f9:		sta $0304, x	; 9d 04 03
B7_01fc:		lda #$e0		; a9 e0
B7_01fe:		sta $0305, x	; 9d 05 03
B7_0201:		sta $030d, x	; 9d 0d 03
B7_0204:		lda $030a, x	; bd 0a 03
B7_0207:		and #$ee		; 29 ee
B7_0209:		sta $030a, x	; 9d 0a 03
B7_020c:		rts				; 60 


enInit_07:
B7_020d:		ldx #$70		; a2 70
B7_020f:		lda $0379		; ad 79 03
B7_0212:		bne B7_0226 ; d0 12

B7_0214:		jsr $ad90		; 20 90 ad
B7_0217:		lda #$07		; a9 07
B7_0219:		sta $0308, x	; 9d 08 03
B7_021c:		lda #$00		; a9 00
B7_021e:		sta $0304, x	; 9d 04 03
B7_0221:		lda #$f0		; a9 f0
B7_0223:		sta $0305, x	; 9d 05 03
B7_0226:		rts				; 60 


B7_0227:		lda #$02		; a9 02
B7_0229:		sta $18			; 85 18
B7_022b:		lda #$80		; a9 80
B7_022d:		ora $19			; 05 19
B7_022f:		sta wCachedEntityStruct.byte9			; 85 19
B7_0231:		lda $1e			; a5 1e
B7_0233:		jsr unsetGlobalFlag		; 20 fc e7
B7_0236:		bit $050a		; 2c 0a 05
B7_0239:		bvc B7_0243 ; 50 08

B7_023b:		lda $050a		; ad 0a 05
B7_023e:		and #$bf		; 29 bf
B7_0240:		sta $050a		; 8d 0a 05
B7_0243:		lda #$00		; a9 00
B7_0245:		sta $051e		; 8d 1e 05
B7_0248:		rts				; 60 


B7_0249:		jsr $e84c		; 20 4c e8
B7_024c:		bne B7_028f ; d0 41

B7_024e:		jsr $ada4		; 20 a4 ad
B7_0251:		lda $0f			; a5 0f
B7_0253:		asl a			; 0a
B7_0254:		tay				; a8 
B7_0255:		lda $a290, y	; b9 90 a2
B7_0258:		clc				; 18 
B7_0259:		adc $16			; 65 16
B7_025b:		sta wEntityStructs.byte6.w, x	; 9d 06 04
B7_025e:		lda $a291, y	; b9 91 a2
B7_0261:		clc				; 18 
B7_0262:		adc $17			; 65 17
B7_0264:		sta wEntityStructs.byte7.w, x	; 9d 07 04
B7_0267:		lda #$38		; a9 38
B7_0269:		sta wEntityStructs.id.w, x	; 9d 08 04
B7_026c:		lda #$01		; a9 01
B7_026e:		sta wEntityStructs.byte9.w, x	; 9d 09 04
B7_0271:		lda #$33		; a9 33
B7_0273:		sta wEntityStructs.byteA.w, x	; 9d 0a 04
B7_0276:		lda #$37		; a9 37
B7_0278:		sta wEntityStructs.byteB.w, x	; 9d 0b 04
B7_027b:		lda #$3b		; a9 3b
B7_027d:		sta wEntityStructs.byteC.w, x	; 9d 0c 04
B7_0280:		lda #$3f		; a9 3f
B7_0282:		sta wEntityStructs.byteD.w, x	; 9d 0d 04
B7_0285:		lda #$0f		; a9 0f
B7_0287:		sta wEntityStructs.byteE.w, x	; 9d 0e 04
B7_028a:		lda #$24		; a9 24
B7_028c:		jmp func_08fa		; 4c fa e8


B7_028f:		rts				; 60 


B7_0290:		.db $00				; 00
B7_0291:		beq B7_02a3 ; f0 10

B7_0293:		jsr $e8f0		; 20 f0 e8
B7_0296:		php				; 08 
B7_0297:		.db $00				; 00
B7_0298:		clc				; 18 
B7_0299:		plp				; 28 
B7_029a:		inx				; e8 
B7_029b:		sed				; f8 
B7_029c:		.db $00				; 00
B7_029d:		cld				; d8 
B7_029e:		sed				; f8 
B7_029f:		bpl B7_024e ; 10 ad

B7_02a1:		adc #$03		; 69 03
B7_02a3:		beq B7_02ac ; f0 07

B7_02a5:		lda $0368		; ad 68 03
B7_02a8:		cmp #$0a		; c9 0a
B7_02aa:		bne B7_02c2 ; d0 16

B7_02ac:		lda wCachedEntityStruct.subID			; a5 1f
B7_02ae:		and #$3f		; 29 3f
B7_02b0:		tay				; a8 
B7_02b1:		lda $a2c7, y	; b9 c7 a2
B7_02b4:		jsr checkGlobalFlag		; 20 e9 e7
B7_02b7:		bne B7_02c2 ; d0 09

B7_02b9:		ldx #$60		; a2 60
B7_02bb:		lda #$00		; a9 00
B7_02bd:		sta wCachedEntityStruct.byteA			; 85 1a
B7_02bf:		jsr $ad90		; 20 90 ad
B7_02c2:		lda #$00		; a9 00
B7_02c4:		sta wCachedEntityStruct.byte9			; 85 19
B7_02c6:		rts				; 60 


B7_02c7:		ora #$08		; 09 08
B7_02c9:		php				; 08 
B7_02ca:	.db $04
B7_02cb:		php				; 08 
B7_02cc:		php				; 08 
B7_02cd:		php				; 08 
B7_02ce:		lda #$7b		; a9 7b
B7_02d0:		jsr func_7_0c42		; 20 42 ac
B7_02d3:		jsr $819f		; 20 9f 81
B7_02d6:		lda wCachedEntityStruct.subID			; a5 1f
B7_02d8:		and #$f0		; 29 f0
B7_02da:		lsr a			; 4a
B7_02db:		lsr a			; 4a
B7_02dc:		sta $1f			; 85 1f
B7_02de:		tay				; a8 
B7_02df:		lda $a312, y	; b9 12 a3
B7_02e2:		sta $10			; 85 10
B7_02e4:		lda $a313, y	; b9 13 a3
B7_02e7:		sta $12			; 85 12
B7_02e9:		eor $32			; 45 32
B7_02eb:		and #$10		; 29 10
B7_02ed:		beq B7_02fc ; f0 0d

B7_02ef:		lda $12			; a5 12
B7_02f1:		cmp $32			; c5 32
B7_02f3:		bcs B7_02fa ; b0 05

B7_02f5:		inc $12			; e6 12
B7_02f7:		jmp $a2fc		; 4c fc a2


B7_02fa:		dec $12			; c6 12
B7_02fc:		lda $a314, y	; b9 14 a3
B7_02ff:		sta wCachedEntityStruct.byte4			; 85 14
B7_0301:		lda $a315, y	; b9 15 a3
B7_0304:		sta wCachedEntityStruct.byte5			; 85 15
B7_0306:		lda #$80		; a9 80
B7_0308:		sta wCachedEntityStruct.subY			; 85 13
B7_030a:		jsr $8a26		; 20 26 8a
B7_030d:		lda #$86		; a9 86
B7_030f:		jmp $8a57		; 4c 57 8a


B7_0312:	.db $3a
B7_0313:		asl a			; 0a
B7_0314:		bpl B7_0316 ; 10 00

B7_0316:	.db $44
B7_0317:	.db $27
B7_0318:		php				; 08 
B7_0319:		.db $00				; 00
B7_031a:	.db $87
B7_031b:		lsr $08			; 46 08
B7_031d:		.db $00				; 00
B7_031e:		asl a			; 0a
B7_031f:		asl $10, x		; 16 10
B7_0321:		.db $00				; 00
B7_0322:	.db $03
B7_0323:	.db $13
B7_0324:		php				; 08 
B7_0325:		.db $00				; 00
B7_0326:		asl a			; 0a
B7_0327:		;removed
	.db $10 $18

B7_0329:		.db $00				; 00
B7_032a:	.db $0c
B7_032b:	.db $19 $f0 $00
B7_032e:	.db $07
B7_032f:		lsr $08			; 46 08
B7_0331:		.db $00				; 00
B7_0332:	.db $43
B7_0333:	.db $19 $10 $00
B7_0336:		jsr $819f		; 20 9f 81
B7_0339:		lda wCachedEntityStruct.subID			; a5 1f
B7_033b:		and #$f0		; 29 f0
B7_033d:		lsr a			; 4a
B7_033e:		lsr a			; 4a
B7_033f:		lsr a			; 4a
B7_0340:		sta $1f			; 85 1f
B7_0342:		tay				; a8 
B7_0343:		lsr a			; 4a
B7_0344:		tax				; aa 
B7_0345:		lda $a36e, y	; b9 6e a3
B7_0348:		sta $10			; 85 10
B7_034a:		lda $a36f, y	; b9 6f a3
B7_034d:		sta $12			; 85 12
B7_034f:		eor $32			; 45 32
B7_0351:		and #$10		; 29 10
B7_0353:		beq B7_0362 ; f0 0d

B7_0355:		lda $12			; a5 12
B7_0357:		cmp $32			; c5 32
B7_0359:		bcs B7_0360 ; b0 05

B7_035b:		inc $12			; e6 12
B7_035d:		jmp $a362		; 4c 62 a3


B7_0360:		dec $12			; c6 12
B7_0362:		lda $a378, x	; bd 78 a3
B7_0365:		sta wCachedEntityStruct.byteA			; 85 1a
B7_0367:		lda #$00		; a9 00
B7_0369:		sta wCachedEntityStruct.byteB			; 85 1b
B7_036b:		sta wCachedEntityStruct.byteC			; 85 1c
B7_036d:		rts				; 60 


B7_036e:	.db $4b
B7_036f:	.db $17
B7_0370:	.db $07
B7_0371:		cli				; 58 
B7_0372:	.db $07
B7_0373:		dey				; 88 
B7_0374:		adc $3308		; 6d 08 33
B7_0377:		ora $0c0c, y	; 19 0c 0c
B7_037a:		asl a			; 0a
B7_037b:	.db $0f
B7_037c:		.db $0e


enInit_roomSideEntrance:
	lda wCachedEntityStruct.subID
B7_037f:		clc				; 18 
B7_0380:		adc #$90		; 69 90
B7_0382:		sta wCachedEntityStruct.byteE			; 85 1e

B7_0384:		jsr checkGlobalFlag		; 20 e9 e7
B7_0387:		beq B7_038e ; f0 05

B7_0389:		lda #$00		; a9 00
B7_038b:		sta wCachedEntityStruct.byte9			; 85 19
B7_038d:		rts				; 60 

B7_038e:		lda $1e			; a5 1e
B7_0390:		jsr setGlobalFlag		; 20 f0 e7
B7_0393:		lda #$0b		; a9 0b
B7_0395:		jsr checkGlobalFlag		; 20 e9 e7
B7_0398:		beq B7_03aa ; f0 10

B7_039a:		lda wCachedEntityStruct.subID			; a5 1f
B7_039c:		beq B7_03a6 ; f0 08

B7_039e:		cmp #$08		; c9 08
B7_03a0:		bne B7_03aa ; d0 08

B7_03a2:		ldy #$63		; a0 63
B7_03a4:		bne B7_03b1 ; d0 0b

B7_03a6:		ldy #$60		; a0 60
B7_03a8:		bne B7_03b1 ; d0 07

B7_03aa:		lda wCachedEntityStruct.subID			; a5 1f
B7_03ac:		asl a			; 0a
B7_03ad:		clc				; 18 
B7_03ae:		adc $1f			; 65 1f
B7_03b0:		tay				; a8 
B7_03b1:		lda sideEntranceDests.w, y	; b9 cf a3
B7_03b4:		sta wCachedEntityStruct.byteA			; 85 1a
B7_03b6:		lda sideEntranceDests.w+1, y	; b9 d0 a3
B7_03b9:		sta wCachedEntityStruct.byteB			; 85 1b
B7_03bb:		and #$f0		; 29 f0
B7_03bd:		sta wCachedEntityStruct.byte4			; 85 14
B7_03bf:		lda sideEntranceDests.w+2, y	; b9 d1 a3
B7_03c2:		sta wCachedEntityStruct.byteC			; 85 1c
B7_03c4:		and #$f0		; 29 f0
B7_03c6:		sta wCachedEntityStruct.byte5			; 85 15
B7_03c8:		lda #$80		; a9 80
B7_03ca:		sta $11			; 85 11
B7_03cc:		sta wCachedEntityStruct.subY			; 85 13
B7_03ce:		rts				; 60 


// group - x - y
sideEntranceDests:
	.db $0a $5f $8b
	.db $04 $80 $0b
	.db $03 $d6 $a1
	.db $03 $4f $5b
	.db $03 $3f $8b
	.db $07 $00 $1b
	.db $07 $00 $2b
	.db $07 $00 $4b
	.db $0a $5f $5b
	.db $04 $cf $0b
	.db $01 $00 $3b
	.db $05 $5f $3b
	.db $05 $00 $49
	.db $04 $0f $0b
	.db $00 $46 $3d
	.db $05 $5f $2a
	.db $01 $00 $6b
	.db $03 $36 $61
	.db $03 $36 $5e
	.db $03 $b0 $0b
	.db $03 $00 $fb
	.db $03 $00 $eb
	.db $03 $ff $0b
	.db $01 $3f $3b
	.db $01 $3f $4b
	.db $01 $3f $6b
	.db $00 $00 $2b
	.db $02 $00 $3b
	.db $00 $00 $2b
	.db $02 $00 $3b
	.db $00 $7f $1b
	.db $03 $00 $7b
	.db $0a $df $8b
	.db $0a $df $5b


// treasure chest
enInit_treasureChest:
B7_0435:		lda #GF_chestContentsLoaded		; a9 89
B7_0437:		jsr checkGlobalFlag		; 20 e9 e7
B7_043a:		bne B7_044e ; @done

// get global flag to
B7_043c:		lda wCachedEntityStruct.subID			; a5 1f
B7_043e:		asl a			; 0a
B7_043f:		tay				; a8 
B7_0440:		lda treasureData_globalFlagsAndChrBanks.w, y	; b9 8e a4
B7_0443:		sta wCachedEntityStruct.byteD			; 85 1d
B7_0445:		cmp #GF_potion		; c9 36
B7_0447:		beq B7_0453 ; @continueLoading

// not potion - done if global flag already set
B7_0449:		jsr checkGlobalFlag		; 20 e9 e7
B7_044c:		beq B7_0453 ; @continueLoading

@done:
B7_044e:		lda #$00		; a9 00
B7_0450:		sta wCachedEntityStruct.byte9			; 85 19
B7_0452:		rts				; 60 

@continueLoading:
B7_0453:		lda wCachedEntityStruct.subID			; a5 1f
B7_0455:		asl a			; 0a
B7_0456:		tay				; a8 
B7_0457:		lda treasureData_globalFlagsAndChrBanks.w+1, y	; b9 8f a4
B7_045a:		jsr func_7_0c42		; 20 42 ac

B7_045d:		lda wCachedEntityStruct.subID			; a5 1f
B7_045f:		cmp #$12		; c9 12
B7_0461:		bcc B7_0472 ; 90 0f

// subid >= $12
B7_0463:		cmp #$14		; c9 14
B7_0465:		beq B7_0472 ; f0 0b

// subid is $12 (potion 0) or $13 (water of life)
B7_0467:		sec				; 38 
B7_0468:		sbc #$12		; e9 12
B7_046a:		clc				; 18
// go to done, if global flag $e0/$e1 set respectively
B7_046b:		adc #$e0		; 69 e0
B7_046d:		jsr checkGlobalFlag		; 20 e9 e7
B7_0470:		bne B7_044e ; @done

B7_0472:		lda #GF_chestContentsLoaded		; a9 89
B7_0474:		jsr setGlobalFlag		; 20 f0 e7

B7_0477:		lda #$80		; a9 80
B7_0479:		sta wCachedEntityStruct.subY			; 85 13
B7_047b:		sta wCachedEntityStruct.subX			; 85 11

B7_047d:		lda #$00		; a9 00
B7_047f:		sta wCachedEntityStruct.byteA			; 85 1a
B7_0481:		sta wCachedEntityStruct.byte4			; 85 14
B7_0483:		sta wCachedEntityStruct.byteE			; 85 1e
B7_0485:		lda #$60		; a9 60
B7_0487:		sta wCachedEntityStruct.byteB			; 85 1b
B7_0489:		lda #$b0		; a9 b0
B7_048b:		sta wCachedEntityStruct.byte5			; 85 15
B7_048d:		rts				; 60 


// $17 entries
treasureData_globalFlagsAndChrBanks:
	.db $10 $78 // 4 hcs
	.db $11 $78
	.db $12 $78
	.db $13 $78
	.db $05 $78 // 3 keys
	.db $06 $78
	.db $07 $78
	.db $39 $78 // 4 specials
	.db $01 $79
	.db $02 $7b
	.db $03 $79
	.db $04 $7b // suction
	.db $30 $7a // map stuff..
	.db $31 $7a
	.db $32 $7a
	.db $33 $78 // incl. 3 rings
	.db $34 $78
	.db $35 $78
	.db $36 $78 // potion
	.db $37 $78 // water of life
	.db $38 $78 // insight
	.db $36 $78 // 3 more potions
	.db $36 $78
	.db $36 $78



B7_04be:		lda #$00		; a9 00
B7_04c0:		sta $11			; 85 11
B7_04c2:		sta wCachedEntityStruct.subY			; 85 13
B7_04c4:		jsr func_0709		; 20 09 e7
B7_04c7:		lda #$fd		; a9 fd
B7_04c9:		sta wCachedEntityStruct.byte5			; 85 15
B7_04cb:		lda #$fc		; a9 fc
B7_04cd:		sta wCachedEntityStruct.byteE			; 85 1e
B7_04cf:		ldy #$00		; a0 00
B7_04d1:		jsr $a4f4		; 20 f4 a4
B7_04d4:		stx $10			; 86 10
B7_04d6:		sty $11			; 84 11
B7_04d8:		ldy #$02		; a0 02
B7_04da:		jsr $a4f4		; 20 f4 a4
B7_04dd:		stx $12			; 86 12
B7_04df:		sty $13			; 84 13
B7_04e1:		ldy #$04		; a0 04
B7_04e3:		jsr $a4f4		; 20 f4 a4
B7_04e6:		stx $1a			; 86 1a
B7_04e8:		sty $1b			; 84 1b
B7_04ea:		ldy #$06		; a0 06
B7_04ec:		jsr $a4f4		; 20 f4 a4
B7_04ef:		stx $1c			; 86 1c
B7_04f1:		sty $1d			; 84 1d
B7_04f3:		rts				; 60 


B7_04f4:		lda $16			; a5 16
B7_04f6:		pha				; 48 
B7_04f7:		lda $17			; a5 17
B7_04f9:		pha				; 48 
B7_04fa:		lda $a512, y	; b9 12 a5
B7_04fd:		sta $00			; 85 00
B7_04ff:		lda $a513, y	; b9 13 a5
B7_0502:		sta $01			; 85 01
B7_0504:		jsr $86fb		; 20 fb 86
B7_0507:		ldx $16			; a6 16
B7_0509:		ldy $17			; a4 17
B7_050b:		pla				; 68 
B7_050c:		sta $17			; 85 17
B7_050e:		pla				; 68 
B7_050f:		sta $16			; 85 16
B7_0511:		rts				; 60 


B7_0512:	.db $04
B7_0513:		sed				; f8 
B7_0514:	.db $0c
B7_0515:		sed				; f8 
B7_0516:	.db $04
B7_0517:		.db $00				; 00
B7_0518:	.db $0c
B7_0519:		.db $00				; 00
B7_051a:		jsr $a539		; 20 39 a5
B7_051d:		stx $10			; 86 10
B7_051f:		sty $11			; 84 11
B7_0521:		lda $00			; a5 00
B7_0523:		sta $12			; 85 12
B7_0525:		lda #$0c		; a9 0c
B7_0527:		sta wCachedEntityStruct.subY			; 85 13
B7_0529:		jsr $a539		; 20 39 a5
B7_052c:		stx $1c			; 86 1c
B7_052e:		sty $1d			; 84 1d
B7_0530:		lda $00			; a5 00
B7_0532:		sta wCachedEntityStruct.byteE			; 85 1e
B7_0534:		lda $01			; a5 01
B7_0536:		sta $1f			; 85 1f
B7_0538:		rts				; 60 


B7_0539:		inc $1a			; e6 1a
B7_053b:		lda $1a			; a5 1a
B7_053d:		and #$07		; 29 07
B7_053f:		sta $00			; 85 00
B7_0541:		asl a			; 0a
B7_0542:		tay				; a8 
B7_0543:		lda $a556, y	; b9 56 a5
B7_0546:		clc				; 18 
B7_0547:		adc $16			; 65 16
B7_0549:		tax				; aa 
B7_054a:		lda $a557, y	; b9 57 a5
B7_054d:		clc				; 18 
B7_054e:		adc $17			; 65 17
B7_0550:		tay				; a8 
B7_0551:		lda #$16		; a9 16
B7_0553:		sta $01			; 85 01
B7_0555:		rts				; 60 


B7_0556:		inx				; e8 
B7_0557:		inx				; e8 
B7_0558:		jsr $e8f8		; 20 f8 e8
B7_055b:		php				; 08 
B7_055c:		php				; 08 
B7_055d:		cpx #$18		; e0 18
B7_055f:		php				; 08 
B7_0560:		cpx #$f8		; e0 f8
B7_0562:		sed				; f8 
B7_0563:		cpx #$18		; e0 18
B7_0565:		inx				; e8 
B7_0566:		ldy $a580		; ac 80 a5
B7_0569:		lda $1a			; a5 1a
B7_056b:		cmp $a581, y	; d9 81 a5
B7_056e:		beq B7_0576 ; f0 06

B7_0570:		dey				; 88 
B7_0571:		bpl B7_056b ; 10 f8

B7_0573:		jmp $a63e		; 4c 3e a6


B7_0576:		lda #$18		; a9 18
B7_0578:		sta wCachedEntityStruct.byteB			; 85 1b
B7_057a:		lda $a59b, y	; b9 9b a5
B7_057d:		sta wCachedEntityStruct.byteA			; 85 1a
B7_057f:		rts				; 60 


B7_0580:		ora $1711, y	; 19 11 17
B7_0583:		clc				; 18 
B7_0584:		ora $1b1a, y	; 19 1a 1b
B7_0587:	.db $1c
B7_0588:		ora $1f1e, x	; 1d 1e 1f
B7_058b:		jsr $3529		; 20 29 35
B7_058e:		rol $37, x		; 36 37
B7_0590:		eor $4d			; 45 4d
B7_0592:		lsr $534f		; 4e 4f 53
B7_0595:	.db $54
B7_0596:		eor $56, x		; 55 56
B7_0598:	.db $5a
B7_0599:	.db $5b
B7_059a:	.db $5c
B7_059b:	.db $3a
B7_059c:		and $3f3b, y	; 39 3b 3f
B7_059f:	.db $44
B7_05a0:	.db $4b
B7_05a1:		jmp $5351		; 4c 51 53


B7_05a4:	.db $57
B7_05a5:	.db $da
B7_05a6:		lsr $7d7a		; 4e 7a 7d
B7_05a9:	.db $83
B7_05aa:		ldy $d2cf		; ac cf d2
B7_05ad:		dec $da, x		; d6 da
B7_05af:	.db $dc
B7_05b0:	.db $df
B7_05b1:		sbc ($e4, x)	; e1 e4
B7_05b3:	.db $e7
B7_05b4:		nop				; ea 
B7_05b5:		lda #$65		; a9 65
B7_05b7:		jsr $ac59		; 20 59 ac
B7_05ba:		jsr $819f		; 20 9f 81
B7_05bd:		lda #$80		; a9 80
B7_05bf:		sta wCachedEntityStruct.subY			; 85 13
B7_05c1:		lda #$80		; a9 80
B7_05c3:		sta wCachedEntityStruct.byteA			; 85 1a
B7_05c5:		lda #$c3		; a9 c3
B7_05c7:		jmp $8a57		; 4c 57 8a


B7_05ca:		lda #$6b		; a9 6b
B7_05cc:		jsr $ac59		; 20 59 ac
B7_05cf:		jsr $819f		; 20 9f 81
B7_05d2:		lda #$0b		; a9 0b
B7_05d4:		jsr checkGlobalFlag		; 20 e9 e7
B7_05d7:		beq B7_05e3 ; f0 0a

B7_05d9:		lda #$10		; a9 10
B7_05db:		sta wCachedEntityStruct.byteA			; 85 1a
B7_05dd:		lda #$c0		; a9 c0
B7_05df:		sta $11			; 85 11
B7_05e1:		bne B7_05e7 ; d0 04

B7_05e3:		lda #$80		; a9 80
B7_05e5:		sta wCachedEntityStruct.byteA			; 85 1a
B7_05e7:		lda #$7f		; a9 7f
B7_05e9:		sta $1f			; 85 1f
B7_05eb:		lda #$8a		; a9 8a
B7_05ed:		jmp $8a57		; 4c 57 8a


B7_05f0:		ldx #$80		; a2 80
B7_05f2:		lda $0389		; ad 89 03
B7_05f5:		bne B7_0604 ; d0 0d

B7_05f7:		lda $0399		; ad 99 03
B7_05fa:		beq B7_05ff ; f0 03

B7_05fc:		jsr $a624		; 20 24 a6
B7_05ff:		lda #$0d		; a9 0d
B7_0601:		jmp func_0860		; 4c 60 e8


B7_0604:		lda #$02		; a9 02
B7_0606:		sta $0388		; 8d 88 03
B7_0609:		lda #$81		; a9 81
B7_060b:		sta $0389		; 8d 89 03
B7_060e:		lda $038a		; ad 8a 03
B7_0611:		and #$20		; 29 20
B7_0613:		beq B7_061d ; f0 08

B7_0615:		lda $050b		; ad 0b 05
B7_0618:		and #$fe		; 29 fe
B7_061a:		sta $050b		; 8d 0b 05
B7_061d:		ldx #$90		; a2 90
B7_061f:		lda $0399		; ad 99 03
B7_0622:		beq B7_05ff ; f0 db

B7_0624:		lda #$02		; a9 02
B7_0626:		sta $0398		; 8d 98 03
B7_0629:		lda #$81		; a9 81
B7_062b:		sta $0399		; 8d 99 03
B7_062e:		lda $039a		; ad 9a 03
B7_0631:		and #$20		; 29 20
B7_0633:		beq B7_063d ; f0 08

B7_0635:		lda $050b		; ad 0b 05
B7_0638:		and #$fe		; 29 fe
B7_063a:		sta $050b		; 8d 0b 05
B7_063d:		rts				; 60 


B7_063e:		lda $1a			; a5 1a
B7_0640:		jmp $a645		; 4c 45 a6


B7_0643:		lda $18			; a5 18
B7_0645:		ldy $a65f		; ac 5f a6
B7_0648:		cmp $a660, y	; d9 60 a6
B7_064b:		beq B7_0655 ; f0 08

B7_064d:		dey				; 88 
B7_064e:		bpl B7_0648 ; 10 f8

B7_0650:		lda #$00		; a9 00
B7_0652:		sta wCachedEntityStruct.byte9			; 85 19
B7_0654:		rts				; 60 


B7_0655:		lda #$27		; a9 27
B7_0657:		sta $18			; 85 18
B7_0659:		lda $a67a, y	; b9 7a a6
B7_065c:		sta wCachedEntityStruct.byteA			; 85 1a
B7_065e:		rts				; 60 


B7_065f:		ora $1711, y	; 19 11 17
B7_0662:		clc				; 18 
B7_0663:		ora $1b1a, y	; 19 1a 1b
B7_0666:	.db $1c
B7_0667:		ora $1f1e, x	; 1d 1e 1f
B7_066a:		jsr $3529		; 20 29 35
B7_066d:		rol $37, x		; 36 37
B7_066f:		eor $4d			; 45 4d
B7_0671:		lsr $534f		; 4e 4f 53
B7_0674:	.db $54
B7_0675:		eor $56, x		; 55 56
B7_0677:	.db $5a
B7_0678:	.db $5b
B7_0679:	.db $5c
B7_067a:	.db $37
B7_067b:	.db $37
B7_067c:	.db $3b
B7_067d:	.db $3f
B7_067e:		eor ($46, x)	; 41 46
B7_0680:		jmp $5351		; 4c 51 53


B7_0683:	.db $57
B7_0684:	.db $da
B7_0685:		lsr $7d7a		; 4e 7a 7d
B7_0688:	.db $83
B7_0689:		ldy $d2cf		; ac cf d2
B7_068c:		dec $da, x		; d6 da
B7_068e:	.db $dc
B7_068f:	.db $df
B7_0690:		sbc ($e4, x)	; e1 e4
B7_0692:	.db $e7
B7_0693:		nop				; ea 
B7_0694:		lda #$79		; a9 79
B7_0696:		jsr func_7_0c42		; 20 42 ac
B7_0699:		jsr $819f		; 20 9f 81
B7_069c:		lda #$00		; a9 00
B7_069e:		sta wCachedEntityStruct.byte9			; 85 19
B7_06a0:		lda $1e			; a5 1e
B7_06a2:		jsr unsetGlobalFlag		; 20 fc e7
B7_06a5:		lda #$88		; a9 88
B7_06a7:		jsr checkGlobalFlag		; 20 e9 e7
B7_06aa:		bne B7_06d2 ; d0 26

B7_06ac:		lda #$0c		; a9 0c
B7_06ae:		jsr checkGlobalFlag		; 20 e9 e7
B7_06b1:		bne B7_06d2 ; d0 1f

B7_06b3:		ldy #$02		; a0 02
B7_06b5:		ldx #$c0		; a2 c0
B7_06b7:		jsr $e83c		; 20 3c e8
B7_06ba:		bne B7_06d2 ; d0 16

B7_06bc:		txa				; 8a 
B7_06bd:		pha				; 48 
B7_06be:		lda #$87		; a9 87
B7_06c0:		jsr $8a57		; 20 57 8a
B7_06c3:		pla				; 68 
B7_06c4:		tax				; aa 
B7_06c5:		lda #$0e		; a9 0e
B7_06c7:		jsr func_0860		; 20 60 e8
B7_06ca:		lda #$88		; a9 88
B7_06cc:		sta $030e, x	; 9d 0e 03
B7_06cf:		jmp setGlobalFlag		; 4c f0 e7


B7_06d2:		rts				; 60 


B7_06d3:		lda #$6a		; a9 6a
B7_06d5:		jsr $ac59		; 20 59 ac
B7_06d8:		jsr $819f		; 20 9f 81
B7_06db:		jsr $8a26		; 20 26 8a
B7_06de:		lda #$02		; a9 02
B7_06e0:		sta $1f			; 85 1f
B7_06e2:		lda #$86		; a9 86
B7_06e4:		jsr $8a57		; 20 57 8a
B7_06e7:		lda #$c3		; a9 c3
B7_06e9:		jmp $8a57		; 4c 57 8a


B7_06ec:		rts				; 60 


B7_06ed:		lda #$0e		; a9 0e
B7_06ef:		jsr checkGlobalFlag		; 20 e9 e7
B7_06f2:		bne B7_070f ; d0 1b

B7_06f4:		lda #$6f		; a9 6f
B7_06f6:		jsr $ac59		; 20 59 ac
B7_06f9:		jsr $819f		; 20 9f 81
B7_06fc:		lda #$00		; a9 00
B7_06fe:		sta $11			; 85 11
B7_0700:		sta wCachedEntityStruct.subY			; 85 13
B7_0702:		sta wCachedEntityStruct.byteB			; 85 1b
B7_0704:		sta wCachedEntityStruct.byteA			; 85 1a
B7_0706:		lda #$a0		; a9 a0
B7_0708:		sta wCachedEntityStruct.byteC			; 85 1c
B7_070a:		lda #$c0		; a9 c0
B7_070c:		jmp $8a57		; 4c 57 8a


B7_070f:		lda #$00		; a9 00
B7_0711:		sta wCachedEntityStruct.byte9			; 85 19
B7_0713:		rts				; 60 


B7_0714:		lda #$0f		; a9 0f
B7_0716:		jsr checkGlobalFlag		; 20 e9 e7
B7_0719:		bne B7_0732 ; d0 17

B7_071b:		lda #$6f		; a9 6f
B7_071d:		jsr $ac59		; 20 59 ac
B7_0720:		jsr $819f		; 20 9f 81
B7_0723:		lda #$00		; a9 00
B7_0725:		sta $11			; 85 11
B7_0727:		sta wCachedEntityStruct.subY			; 85 13
B7_0729:		lda #$80		; a9 80
B7_072b:		sta wCachedEntityStruct.byteA			; 85 1a
B7_072d:		lda #$c0		; a9 c0
B7_072f:		jmp $8a57		; 4c 57 8a


B7_0732:		lda #$00		; a9 00
B7_0734:		sta wCachedEntityStruct.byte9			; 85 19
B7_0736:		rts				; 60 


B7_0737:		lda #$0d		; a9 0d
B7_0739:		jsr checkGlobalFlag		; 20 e9 e7
B7_073c:		bne B7_075c ; d0 1e

B7_073e:		lda #$6f		; a9 6f
B7_0740:		jsr $ac59		; 20 59 ac
B7_0743:		jsr $819f		; 20 9f 81
B7_0746:		lda #$20		; a9 20
B7_0748:		sta wCachedEntityStruct.byteA			; 85 1a
B7_074a:		lda #$0d		; a9 0d
B7_074c:		sta wCachedEntityStruct.byteC			; 85 1c
B7_074e:		lda #$08		; a9 08
B7_0750:		sta wCachedEntityStruct.byteB			; 85 1b
B7_0752:		lda #$c0		; a9 c0
B7_0754:		jsr $8a57		; 20 57 8a
B7_0757:		lda #$91		; a9 91
B7_0759:		jmp $8a57		; 4c 57 8a


B7_075c:		rts				; 60 


B7_075d:		jsr $819f		; 20 9f 81
B7_0760:		lda #$00		; a9 00
B7_0762:		sta wCachedEntityStruct.byteA			; 85 1a
B7_0764:		rts				; 60 


B7_0765:		lda #$7a		; a9 7a
B7_0767:		jsr func_7_0c42		; 20 42 ac
B7_076a:		jsr $819f		; 20 9f 81
B7_076d:		lda #$00		; a9 00
B7_076f:		sta $1f			; 85 1f
B7_0771:		sta wCachedEntityStruct.byteA			; 85 1a
B7_0773:		sta wCachedEntityStruct.byte5			; 85 15
B7_0775:		lda #$20		; a9 20
B7_0777:		sta wCachedEntityStruct.byteB			; 85 1b
B7_0779:		lda #$80		; a9 80
B7_077b:		jmp $8a57		; 4c 57 8a


B7_077e:		lda $0500		; ad 00 05
B7_0781:		sta $10			; 85 10
B7_0783:		lda $0501		; ad 01 05
B7_0786:		sta $11			; 85 11
B7_0788:		lda $0502		; ad 02 05
B7_078b:		sta $12			; 85 12
B7_078d:		lda $0503		; ad 03 05
B7_0790:		sta wCachedEntityStruct.subY			; 85 13
B7_0792:		lda #$00		; a9 00
B7_0794:		sta wCachedEntityStruct.byteB			; 85 1b
B7_0796:		sta wCachedEntityStruct.byte4			; 85 14
B7_0798:		sta wCachedEntityStruct.byte5			; 85 15
B7_079a:		rts				; 60 


B7_079b:		lda #$67		; a9 67
B7_079d:		jsr $ac59		; 20 59 ac
B7_07a0:		jsr $819f		; 20 9f 81
B7_07a3:		lda wCachedEntityStruct.subID			; a5 1f
B7_07a5:		bmi B7_07ab ; 30 04

B7_07a7:		lda #$82		; a9 82
B7_07a9:		bne B7_07ad ; d0 02

B7_07ab:		lda #$80		; a9 80
B7_07ad:		sta wCachedEntityStruct.byteA			; 85 1a
B7_07af:		lda #$00		; a9 00
B7_07b1:		sta $1f			; 85 1f
B7_07b3:		lda #$c4		; a9 c4
B7_07b5:		jmp $8a57		; 4c 57 8a


enInit_doorEntrance:
B7_07b8:		lda wCachedEntityStruct.subID			; a5 1f
B7_07ba:		clc				; 18 
B7_07bb:		adc #$b8		; 69 b8
B7_07bd:		sta wCachedEntityStruct.byteE			; 85 1e
B7_07bf:		jsr checkGlobalFlag		; 20 e9 e7
B7_07c2:		beq B7_07c9 ; f0 05

B7_07c4:		lda #$00		; a9 00
B7_07c6:		sta wCachedEntityStruct.byte9			; 85 19
B7_07c8:		rts				; 60 

B7_07c9:		lda $1e			; a5 1e
B7_07cb:		jsr setGlobalFlag		; 20 f0 e7
B7_07ce:		lda #$0b		; a9 0b
B7_07d0:		jsr checkGlobalFlag		; 20 e9 e7
B7_07d3:		beq B7_07e3 ; f0 0e

B7_07d5:		lda wCachedEntityStruct.subID			; a5 1f
B7_07d7:		cmp #$0c		; c9 0c
B7_07d9:		bne B7_07e3 ; d0 08

B7_07db:		ldy #$39		; a0 39
B7_07dd:		bne B7_07ec ; d0 0d

B7_07df:		ldy #$60		; a0 60
B7_07e1:		bne B7_07ec ; d0 09

B7_07e3:		lda wCachedEntityStruct.subID			; a5 1f
B7_07e5:		and #$3f		; 29 3f
B7_07e7:		asl a			; 0a
B7_07e8:		clc				; 18 
B7_07e9:		adc $1f			; 65 1f
B7_07eb:		tay				; a8 
B7_07ec:		lda doorEntranceDests.w, y	; b9 0a a8
B7_07ef:		sta wCachedEntityStruct.byteA			; 85 1a
B7_07f1:		lda doorEntranceDests.w+1, y	; b9 0b a8
B7_07f4:		sta wCachedEntityStruct.byteB			; 85 1b
B7_07f6:		and #$f0		; 29 f0
B7_07f8:		sta wCachedEntityStruct.byte4			; 85 14
B7_07fa:		lda doorEntranceDests.w+2, y	; b9 0c a8
B7_07fd:		sta wCachedEntityStruct.byteC			; 85 1c
B7_07ff:		and #$f0		; 29 f0
B7_0801:		sta wCachedEntityStruct.byte5			; 85 15
B7_0803:		lda #$80		; a9 80
B7_0805:		sta $11			; 85 11
B7_0807:		sta wCachedEntityStruct.subY			; 85 13
B7_0809:		rts				; 60 


// group - x - y
doorEntranceDests:
	.db $04 $94 $1b
	.db $05 $2b $19
	.db $03 $4a $fb
	.db $04 $ba $1b
	.db $03 $04 $1b
	.db $03 $04 $1b
	.db $02 $0c $1b
	.db $04 $0c $0b
	.db $05 $85 $0b
	.db $07 $39 $1a
	.db $07 $39 $1a
	.db $09 $28 $0b
	.db $0a $29 $69
	.db $02 $4c $3b
	.db $00 $7a $2b
	.db $02 $56 $0b
	.db $02 $1a $1b
	.db $0a $cb $15
	.db $02 $56 $2b
	.db $0a $a9 $69


;;
B7_0846:		jsr $e84c		; 20 4c e8
B7_0849:		bne B7_0886 ; d0 3b

B7_084b:		jsr $ada4		; 20 a4 ad
B7_084e:		lda $0f			; a5 0f
B7_0850:		asl a			; 0a
B7_0851:		tay				; a8 
B7_0852:		lda $a887, y	; b9 87 a8
B7_0855:		sta wEntityStructs.byte6.w, x	; 9d 06 04
B7_0858:		lda $a888, y	; b9 88 a8
B7_085b:		sta wEntityStructs.byte7.w, x	; 9d 07 04
B7_085e:		lda #$38		; a9 38
B7_0860:		sta wEntityStructs.id.w, x	; 9d 08 04
B7_0863:		lda #$01		; a9 01
B7_0865:		sta wEntityStructs.byte9.w, x	; 9d 09 04
B7_0868:		lda #$33		; a9 33
B7_086a:		sta wEntityStructs.byteA.w, x	; 9d 0a 04
B7_086d:		lda #$37		; a9 37
B7_086f:		sta wEntityStructs.byteB.w, x	; 9d 0b 04
B7_0872:		lda #$3b		; a9 3b
B7_0874:		sta wEntityStructs.byteC.w, x	; 9d 0c 04
B7_0877:		lda #$3f		; a9 3f
B7_0879:		sta wEntityStructs.byteD.w, x	; 9d 0d 04
B7_087c:		lda #$0f		; a9 0f
B7_087e:		sta wEntityStructs.byteE.w, x	; 9d 0e 04
B7_0881:		lda #$24		; a9 24
B7_0883:		jmp func_08fa		; 4c fa e8


B7_0886:		rts				; 60 


B7_0887:		bvc B7_08c9 ; 50 40

B7_0889:		bvs B7_08db ; 70 50

B7_088b:		cli				; 58 
B7_088c:		cli				; 58 
B7_088d:		bvs B7_08cf ; 70 40

B7_088f:		rts				; 60 


B7_0890:		rts				; 60 


B7_0891:		bvc B7_08eb ; 50 58

B7_0893:		pla				; 68 
B7_0894:		pha				; 48 
B7_0895:		rts				; 60 


B7_0896:		pha				; 48 
B7_0897:		stx $03			; 86 03
B7_0899:		ldx #$00		; a2 00
B7_089b:		lda wEntityStructs.id.w, x	; bd 08 04
B7_089e:		cmp #$40		; c9 40
B7_08a0:		bne B7_08af ; d0 0d

B7_08a2:		lda wEntityStructs.byte9.w, x	; bd 09 04
B7_08a5:		beq B7_08af ; f0 08

B7_08a7:		lda $05			; a5 05
B7_08a9:		cmp wEntityStructs.byteE.w, x	; dd 0e 04
B7_08ac:		bne B7_08af ; d0 01

B7_08ae:		rts				; 60 


B7_08af:		txa				; 8a 
B7_08b0:		clc				; 18 
B7_08b1:		adc #$10		; 69 10
B7_08b3:		tax				; aa 
B7_08b4:		cpx #$80		; e0 80
B7_08b6:		bne B7_089b ; d0 e3

B7_08b8:		jsr $e84c		; 20 4c e8
B7_08bb:		bne B7_091f ; d0 62

B7_08bd:		ldy $05			; a4 05
B7_08bf:		lda $03			; a5 03
B7_08c1:		sta $04			; 85 04
B7_08c3:		lda #$01		; a9 01
B7_08c5:		sta $0600, y	; 99 00 06
B7_08c8:		tya				; 98 
B7_08c9:		clc				; 18 
B7_08ca:		adc #$10		; 69 10
B7_08cc:		tay				; a8 
B7_08cd:		dec $04			; c6 04
B7_08cf:		bne B7_08c3 ; d0 f2

B7_08d1:		lda $05			; a5 05
B7_08d3:		sta wEntityStructs.byteE.w, x	; 9d 0e 04
B7_08d6:		and #$0f		; 29 0f
B7_08d8:		asl a			; 0a
B7_08d9:		sta $01			; 85 01
B7_08db:		lda #$00		; a9 00
B7_08dd:		sta $02			; 85 02
B7_08df:		lda $05			; a5 05
B7_08e1:		and #$f0		; 29 f0
B7_08e3:		asl a			; 0a
B7_08e4:		rol $02			; 26 02
B7_08e6:		asl a			; 0a
B7_08e7:		rol $02			; 26 02
B7_08e9:		ora $01			; 05 01
B7_08eb:		sta wEntityStructs.subX.w, x	; 9d 01 04
B7_08ee:		sta wEntityStructs.subY.w, x	; 9d 03 04
B7_08f1:		lda $30			; a5 30
B7_08f3:		and #$10		; 29 10
B7_08f5:		bne B7_08fb ; d0 04

B7_08f7:		lda #$20		; a9 20
B7_08f9:		bne B7_08fd ; d0 02

B7_08fb:		lda #$24		; a9 24
B7_08fd:		ora $02			; 05 02
B7_08ff:		sta wEntityStructs.tileX.w, x	; 9d 00 04
B7_0902:		sta wEntityStructs.tileY.w, x	; 9d 02 04
B7_0905:		lda $03			; a5 03
B7_0907:		sta wEntityStructs.byteA.w, x	; 9d 0a 04
B7_090a:		lda #$40		; a9 40
B7_090c:		sta wEntityStructs.id.w, x	; 9d 08 04
B7_090f:		lda #$01		; a9 01
B7_0911:		sta wEntityStructs.byte9.w, x	; 9d 09 04
B7_0914:		lda #$00		; a9 00
B7_0916:		sta wEntityStructs.byteB.w, x	; 9d 0b 04
B7_0919:		sta wEntityStructs.byteC.w, x	; 9d 0c 04
B7_091c:		sta wEntityStructs.byteD.w, x	; 9d 0d 04
B7_091f:		rts				; 60 


B7_0920:		jsr $819f		; 20 9f 81
B7_0923:		lda #$80		; a9 80
B7_0925:		sta $11			; 85 11
B7_0927:		sta wCachedEntityStruct.subY			; 85 13
B7_0929:		rts				; 60 


B7_092a:		stx $00			; 86 00
B7_092c:		jsr func_0838		; 20 38 e8
B7_092f:		bne B7_094a ; d0 19

B7_0931:		lda $00			; a5 00
B7_0933:		sta $0306, x	; 9d 06 03
B7_0936:		lda #$10		; a9 10
B7_0938:		sta $0307, x	; 9d 07 03
B7_093b:		lda #$42		; a9 42
B7_093d:		sta $0308, x	; 9d 08 03
B7_0940:		lda #$01		; a9 01
B7_0942:		sta $0309, x	; 9d 09 03
B7_0945:		lda #$01		; a9 01
B7_0947:		sta $030f, x	; 9d 0f 03
B7_094a:		rts				; 60 


B7_094b:		lda $0399		; ad 99 03
B7_094e:		beq B7_0969 ; f0 19

B7_0950:		lda #$02		; a9 02
B7_0952:		sta $0398		; 8d 98 03
B7_0955:		lda #$81		; a9 81
B7_0957:		sta $0399		; 8d 99 03
B7_095a:		lda $039a		; ad 9a 03
B7_095d:		and #$20		; 29 20
B7_095f:		beq B7_0969 ; f0 08

B7_0961:		lda $050b		; ad 0b 05
B7_0964:		and #$fe		; 29 fe
B7_0966:		sta $050b		; 8d 0b 05
B7_0969:		lda $0389		; ad 89 03
B7_096c:		beq B7_097d ; f0 0f

B7_096e:		lda $038a		; ad 8a 03
B7_0971:		and #$20		; 29 20
B7_0973:		beq B7_097d ; f0 08

B7_0975:		lda $050b		; ad 0b 05
B7_0978:		and #$fe		; 29 fe
B7_097a:		sta $050b		; 8d 0b 05
B7_097d:		lda #$43		; a9 43
B7_097f:		sta $0388		; 8d 88 03
B7_0982:		lda #$01		; a9 01
B7_0984:		sta $0389		; 8d 89 03
B7_0987:		lda #$80		; a9 80
B7_0989:		sta $038a		; 8d 8a 03
B7_098c:		lda #$18		; a9 18
B7_098e:		sta $038b		; 8d 8b 03
B7_0991:		lda #$01		; a9 01
B7_0993:		sta $038c		; 8d 8c 03
B7_0996:		sta $038e		; 8d 8e 03
B7_0999:		sta $038f		; 8d 8f 03
B7_099c:		lda $30			; a5 30
B7_099e:		and #$f0		; 29 f0
B7_09a0:		ora #$08		; 09 08
B7_09a2:		sta $0380		; 8d 80 03
B7_09a5:		lda $32			; a5 32
B7_09a7:		and #$f0		; 29 f0
B7_09a9:		ora #$08		; 09 08
B7_09ab:		sta $0382		; 8d 82 03
B7_09ae:		lda #$00		; a9 00
B7_09b0:		sta $0381		; 8d 81 03
B7_09b3:		sta $0383		; 8d 83 03
B7_09b6:		sta $0384		; 8d 84 03
B7_09b9:		lda #$e0		; a9 e0
B7_09bb:		sta $0385		; 8d 85 03
B7_09be:		rts				; 60 


B7_09bf:		lda #$6e		; a9 6e
B7_09c1:		jsr func_7_0c42		; 20 42 ac
B7_09c4:		jsr $819f		; 20 9f 81
B7_09c7:		lda wCachedEntityStruct.subID			; a5 1f
B7_09c9:		lsr a			; 4a
B7_09ca:		lsr a			; 4a
B7_09cb:		lsr a			; 4a
B7_09cc:		tay				; a8 
B7_09cd:		lda $a9e4, y	; b9 e4 a9
B7_09d0:		sta wCachedEntityStruct.byteD			; 85 1d
B7_09d2:		lda $a9e5, y	; b9 e5 a9
B7_09d5:		sta wCachedEntityStruct.byteA			; 85 1a
B7_09d7:		lda #$1c		; a9 1c
B7_09d9:		sta wCachedEntityStruct.byteC			; 85 1c
B7_09db:		lda #$a0		; a9 a0
B7_09dd:		sta wCachedEntityStruct.byteB			; 85 1b
B7_09df:		lda #$80		; a9 80
B7_09e1:		jmp $8a57		; 4c 57 8a


B7_09e4:		php				; 08 
B7_09e5:	.db $80
B7_09e6:	.db $f4
B7_09e7:		.db $00				; 00
B7_09e8:		jsr func_0838		; 20 38 e8
B7_09eb:		bne B7_0a04 ; d0 17

B7_09ed:		jsr $ad90		; 20 90 ad
B7_09f0:		lda #$03		; a9 03
B7_09f2:		jsr $ade3		; 20 e3 ad
B7_09f5:		lda $0f			; a5 0f
B7_09f7:		jsr $adc4		; 20 c4 ad
B7_09fa:		lda #$49		; a9 49
B7_09fc:		sta $0308, x	; 9d 08 03
B7_09ff:		lda #$01		; a9 01
B7_0a01:		sta $030f, x	; 9d 0f 03
B7_0a04:		rts				; 60 


B7_0a05:		jsr func_0838		; 20 38 e8
B7_0a08:		bne B7_0a17 ; d0 0d

B7_0a0a:		jsr $ad90		; 20 90 ad
B7_0a0d:		lda #$4a		; a9 4a
B7_0a0f:		sta $0308, x	; 9d 08 03
B7_0a12:		lda #$01		; a9 01
B7_0a14:		sta $030f, x	; 9d 0f 03
B7_0a17:		rts				; 60 


B7_0a18:		ldy #$03		; a0 03
B7_0a1a:		ldx #$50		; a2 50
B7_0a1c:		jsr $e83c		; 20 3c e8
B7_0a1f:		bne B7_0a36 ; d0 15

B7_0a21:		jsr $ad90		; 20 90 ad
B7_0a24:		lda #$00		; a9 00
B7_0a26:		jsr $ade3		; 20 e3 ad
B7_0a29:		jsr $adb8		; 20 b8 ad
B7_0a2c:		lda #$4b		; a9 4b
B7_0a2e:		sta $0308, x	; 9d 08 03
B7_0a31:		lda #$01		; a9 01
B7_0a33:		sta $030f, x	; 9d 0f 03
B7_0a36:		rts				; 60 


B7_0a37:		ldy #$02		; a0 02
B7_0a39:		ldx #$40		; a2 40
B7_0a3b:		jsr $e83c		; 20 3c e8
B7_0a3e:		bne B7_0a61 ; d0 21

B7_0a40:		jsr $ad90		; 20 90 ad
B7_0a43:		lda #$01		; a9 01
B7_0a45:		jsr $ade3		; 20 e3 ad
B7_0a48:		lda $19			; a5 19
B7_0a4a:		and #$02		; 29 02
B7_0a4c:		bne B7_0a52 ; d0 04

B7_0a4e:		lda #$02		; a9 02
B7_0a50:		bne B7_0a54 ; d0 02

B7_0a52:		lda #$06		; a9 06
B7_0a54:		jsr $adc4		; 20 c4 ad
B7_0a57:		lda #$4c		; a9 4c
B7_0a59:		sta $0308, x	; 9d 08 03
B7_0a5c:		lda #$02		; a9 02
B7_0a5e:		sta $030f, x	; 9d 0f 03
B7_0a61:		rts				; 60 


B7_0a62:		lda #$0f		; a9 0f
B7_0a64:		jsr checkGlobalFlag		; 20 e9 e7
B7_0a67:		beq B7_0a7c ; f0 13

B7_0a69:		lda #$6f		; a9 6f
B7_0a6b:		jsr $ac59		; 20 59 ac
B7_0a6e:		jsr $819f		; 20 9f 81
B7_0a71:		lda #$80		; a9 80
B7_0a73:		sta $11			; 85 11
B7_0a75:		sta wCachedEntityStruct.subY			; 85 13
B7_0a77:		lda #$c4		; a9 c4
B7_0a79:		jmp $8a57		; 4c 57 8a


B7_0a7c:		lda #$00		; a9 00
B7_0a7e:		sta wCachedEntityStruct.byte9			; 85 19
B7_0a80:		rts				; 60 


B7_0a81:		lda #$6b		; a9 6b
B7_0a83:		jsr $ac59		; 20 59 ac
B7_0a86:		jsr $819f		; 20 9f 81
B7_0a89:		lda #$10		; a9 10
B7_0a8b:		sta wCachedEntityStruct.byteB			; 85 1b
B7_0a8d:		lda #$8a		; a9 8a
B7_0a8f:		jmp $8a57		; 4c 57 8a


B7_0a92:		ldy #$06		; a0 06
B7_0a94:		ldx #$00		; a2 00
B7_0a96:		jsr $e83c		; 20 3c e8
B7_0a99:		bne B7_0ac6 ; d0 2b

B7_0a9b:		lda #$00		; a9 00
B7_0a9d:		sta $0304, x	; 9d 04 03
B7_0aa0:		sta $0305, x	; 9d 05 03
B7_0aa3:		lda #$34		; a9 34
B7_0aa5:		sta $0300, x	; 9d 00 03
B7_0aa8:		lda #$c0		; a9 c0
B7_0aaa:		sta $0301, x	; 9d 01 03
B7_0aad:		lda #$21		; a9 21
B7_0aaf:		sta $0302, x	; 9d 02 03
B7_0ab2:		lda $13			; a5 13
B7_0ab4:		sta $0303, x	; 9d 03 03
B7_0ab7:		lda #$52		; a9 52
B7_0ab9:		sta $0308, x	; 9d 08 03
B7_0abc:		lda #$01		; a9 01
B7_0abe:		sta $0309, x	; 9d 09 03
B7_0ac1:		lda #$08		; a9 08
B7_0ac3:		sta $030f, x	; 9d 0f 03
B7_0ac6:		rts				; 60 


B7_0ac7:		jsr func_0838		; 20 38 e8
B7_0aca:		bne B7_0b01 ; d0 35

B7_0acc:		lda $0f			; a5 0f
B7_0ace:		asl a			; 0a
B7_0acf:		asl a			; 0a
B7_0ad0:		clc				; 18 
B7_0ad1:		adc $0f			; 65 0f
B7_0ad3:		tay				; a8 
B7_0ad4:		lda $ab02, y	; b9 02 ab
B7_0ad7:		sta $0306, x	; 9d 06 03
B7_0ada:		lda #$38		; a9 38
B7_0adc:		sta $0307, x	; 9d 07 03
B7_0adf:		lda $ab03, y	; b9 03 ab
B7_0ae2:		sta $030b, x	; 9d 0b 03
B7_0ae5:		lda $ab04, y	; b9 04 ab
B7_0ae8:		sta $030c, x	; 9d 0c 03
B7_0aeb:		lda $ab05, y	; b9 05 ab
B7_0aee:		sta $030d, x	; 9d 0d 03
B7_0af1:		lda #$57		; a9 57
B7_0af3:		sta $0308, x	; 9d 08 03
B7_0af6:		lda $ab06, y	; b9 06 ab
B7_0af9:		sta $0309, x	; 9d 09 03
B7_0afc:		lda #$00		; a9 00
B7_0afe:		sta $030a, x	; 9d 0a 03
B7_0b01:		rts				; 60 


B7_0b02:		sei				; 78 
B7_0b03:		cld				; d8 
B7_0b04:		cld				; d8 
B7_0b05:	.db $5a
B7_0b06:		ora ($48, x)	; 01 48
B7_0b08:		iny				; c8 
B7_0b09:		cld				; d8 
B7_0b0a:		cli				; 58 
B7_0b0b:		ora ($78, x)	; 01 78
B7_0b0d:		clv				; b8 
B7_0b0e:		cld				; d8 
B7_0b0f:		lsr $01, x		; 56 01
B7_0b11:		pha				; 48 
B7_0b12:		tay				; a8 
B7_0b13:		cld				; d8 
B7_0b14:	.db $52
B7_0b15:		ora ($78, x)	; 01 78
B7_0b17:		tya				; 98 
B7_0b18:		cld				; d8 
B7_0b19:	.db $54
B7_0b1a:		ora ($48, x)	; 01 48
B7_0b1c:		dey				; 88 
B7_0b1d:		cld				; d8 
B7_0b1e:		bvc B7_0b21 ; 50 01

B7_0b20:		sei				; 78 
B7_0b21:		sei				; 78 
B7_0b22:		cld				; d8 
B7_0b23:		lsr $4803		; 4e 03 48
B7_0b26:		pla				; 68 
B7_0b27:		cld				; d8 
B7_0b28:		jmp $7803		; 4c 03 78


B7_0b2b:		cli				; 58 
B7_0b2c:		cld				; d8 
B7_0b2d:		lsr a			; 4a
B7_0b2e:	.db $03
B7_0b2f:		pha				; 48 
B7_0b30:		pha				; 48 
B7_0b31:		cld				; d8 
B7_0b32:		pha				; 48 
B7_0b33:	.db $03
B7_0b34:		pla				; 68 
B7_0b35:		cld				; d8 
B7_0b36:		iny				; c8 
B7_0b37:	.db $1a
B7_0b38:		ora ($58, x)	; 01 58
B7_0b3a:		iny				; c8 
B7_0b3b:		iny				; c8 
B7_0b3c:		clc				; 18 
B7_0b3d:		ora ($68, x)	; 01 68
B7_0b3f:		clv				; b8 
B7_0b40:		iny				; c8 
B7_0b41:		asl $01, x		; 16 01
B7_0b43:		cli				; 58 
B7_0b44:		tay				; a8 
B7_0b45:		iny				; c8 
B7_0b46:	.db $14
B7_0b47:		ora ($68, x)	; 01 68
B7_0b49:		tya				; 98 
B7_0b4a:		iny				; c8 
B7_0b4b:	.db $12
B7_0b4c:		ora ($58, x)	; 01 58
B7_0b4e:		dey				; 88 
B7_0b4f:		iny				; c8 
B7_0b50:		bpl B7_0b53 ; 10 01

B7_0b52:		pla				; 68 
B7_0b53:		sei				; 78 
B7_0b54:		iny				; c8 
B7_0b55:		asl $5801		; 0e 01 58
B7_0b58:		pha				; 48 
B7_0b59:		iny				; c8 
B7_0b5a:		php				; 08 
B7_0b5b:	.db $03
B7_0b5c:		pla				; 68 
B7_0b5d:		cli				; 58 
B7_0b5e:		iny				; c8 
B7_0b5f:		asl a			; 0a
B7_0b60:	.db $03
B7_0b61:		cli				; 58 
B7_0b62:		pla				; 68 
B7_0b63:		iny				; c8 
B7_0b64:	.db $0c
B7_0b65:		ora ($a9, x)	; 01 a9
B7_0b67:		adc $20			; 65 20
B7_0b69:		eor $20ac, y	; 59 ac 20
B7_0b6c:	.db $9f
B7_0b6d:		sta ($a9, x)	; 81 a9
B7_0b6f:	.db $80
B7_0b70:		sta wCachedEntityStruct.byteA			; 85 1a
B7_0b72:		lda #$c3		; a9 c3
B7_0b74:		jmp $8a57		; 4c 57 8a


// idx $59 (dialog entity)
enInit_dialog:
B7_0b77:		jsr func_a_019f		; 20 9f 81
B7_0b7a:		lda #$00		; a9 00
B7_0b7c:		sta wCachedEntityStruct.byteA			; 85 1a
B7_0b7e:		lda wCachedEntityStruct.subID			; a5 1f
// A is high nybble of $1f, Y is double that
B7_0b80:		and #$f0		; 29 f0
B7_0b82:		lsr a			; 4a
B7_0b83:		lsr a			; 4a
B7_0b84:		lsr a			; 4a
B7_0b85:		tay				; a8 
B7_0b86:		lsr a			; 4a
B7_0b87:		sta $00			; 85 00
B7_0b89:		lda data_7_0bb3.w, y	; b9 b3 ab
B7_0b8c:		sta wCachedEntityStruct.byteB			; 85 1b
B7_0b8e:		lda data_7_0bb3.w+1, y	; b9 b4 ab
B7_0b91:		jsr checkGlobalFlag		; 20 e9 e7
B7_0b94:		bne B7_0baa ; d0 14

B7_0b96:		ldy $00			; a4 00
B7_0b98:		lda b7_bitTable.w, y	; b9 bb ab
B7_0b9b:		and $017d		; 2d 7d 01
B7_0b9e:		bne B7_0baa ; d0 0a

B7_0ba0:		lda b7_bitTable.w, y	; b9 bb ab
B7_0ba3:		ora $017d		; 0d 7d 01
B7_0ba6:		sta $017d		; 8d 7d 01
B7_0ba9:		rts				; 60 


B7_0baa:		lda #$00		; a9 00
B7_0bac:		sta wCachedEntityStruct.byte9			; 85 19
B7_0bae:		lda $1e			; a5 1e
B7_0bb0:		jmp unsetGlobalFlag		; 4c fc e7


data_7_0bb3:
	.db $26 $08
	.db $27 $08
	.db $28 $08
	.db $0f $0f


b7_bitTable:
	.db $01 $02 $04 $08 $10 $20 $40 $80


B7_0bc3:		lda #$5d		; a9 5d
B7_0bc5:		sta $18			; 85 18
B7_0bc7:		lda #$e0		; a9 e0
B7_0bc9:		sta wCachedEntityStruct.byte5			; 85 15
B7_0bcb:		lda #$00		; a9 00
B7_0bcd:		sta wCachedEntityStruct.byte4			; 85 14
B7_0bcf:		sta wCachedEntityStruct.byteA			; 85 1a
B7_0bd1:		sta wCachedEntityStruct.byteB			; 85 1b
B7_0bd3:		dec $1b			; c6 1b
B7_0bd5:		lda #$01		; a9 01
B7_0bd7:		sta wCachedEntityStruct.byte9			; 85 19
B7_0bd9:		rts				; 60 


B7_0bda:		lda #$30		; a9 30
B7_0bdc:		jsr $ac59		; 20 59 ac
B7_0bdf:		jsr $819f		; 20 9f 81
B7_0be2:		lda #$ea		; a9 ea
B7_0be4:		sta $10			; 85 10
B7_0be6:		lda #$07		; a9 07
B7_0be8:		sta $12			; 85 12
B7_0bea:		lda #$80		; a9 80
B7_0bec:		sta wCachedEntityStruct.byteA			; 85 1a
B7_0bee:		sta $11			; 85 11
B7_0bf0:		lda $19			; a5 19
B7_0bf2:		ora #$02		; 09 02
B7_0bf4:		sta wCachedEntityStruct.byte9			; 85 19
B7_0bf6:		lda #$08		; a9 08
B7_0bf8:		sta wCachedEntityStruct.byteD			; 85 1d
B7_0bfa:		lda #$00		; a9 00
B7_0bfc:		sta wCachedEntityStruct.byte4			; 85 14
B7_0bfe:		sta wCachedEntityStruct.byte5			; 85 15
B7_0c00:		sta $11			; 85 11
B7_0c02:		sta wCachedEntityStruct.subY			; 85 13
B7_0c04:		sta wCachedEntityStruct.byteB			; 85 1b
B7_0c06:		sta wCachedEntityStruct.byteE			; 85 1e
B7_0c08:		lda #$07		; a9 07
B7_0c0a:		sta $1f			; 85 1f
B7_0c0c:		lda #$5f		; a9 5f
B7_0c0e:		jmp $8033		; 4c 33 80


B7_0c11:		ldx #$60		; a2 60
B7_0c13:		jsr $ada4		; 20 a4 ad
B7_0c16:		lda #$5f		; a9 5f
B7_0c18:		sta $0468		; 8d 68 04
B7_0c1b:		lda #$00		; a9 00
B7_0c1d:		sta $0464		; 8d 64 04
B7_0c20:		sta $0465		; 8d 65 04
B7_0c23:		sta $046a		; 8d 6a 04
B7_0c26:		sta $0450		; 8d 50 04
B7_0c29:		lda #$80		; a9 80
B7_0c2b:		sta $046d		; 8d 6d 04
B7_0c2e:		lda #$03		; a9 03
B7_0c30:		sta $0469		; 8d 69 04
B7_0c33:		sta $046c		; 8d 6c 04
B7_0c36:		lda #$80		; a9 80
B7_0c38:		sta $046e		; 8d 6e 04
B7_0c3b:		sta $0461		; 8d 61 04
B7_0c3e:		dec $0460		; ce 60 04
B7_0c41:		rts				; 60 


func_7_0c42:
B7_0c42:		cmp wShadow1KBChrBank2.w		; cd 6d 01
B7_0c45:		sta $0e			; 85 0e
B7_0c47:		beq B7_0c4e ; f0 05

// 1kb chr bank 2 is not the same as the requested treasure's val
B7_0c49:		ldx #$00		; a2 00
B7_0c4b:		jsr func_7_0cb0		; 20 b0 ac

B7_0c4e:		ldx #$00		; a2 00
B7_0c50:		jsr func_7_0d56		; 20 56 ad

B7_0c53:		lda $0e			; a5 0e
B7_0c55:		sta wShadow1KBChrBank2.w		; 8d 6d 01
B7_0c58:		rts				; 60 


B7_0c59:		cmp wShadow1KBChrBank3.w		; cd 6e 01
B7_0c5c:		sta $0e			; 85 0e
B7_0c5e:		beq B7_0c65 ; f0 05

B7_0c60:		ldx #$ff		; a2 ff
B7_0c62:		jsr func_7_0cb0		; 20 b0 ac
B7_0c65:		ldx #$ff		; a2 ff
B7_0c67:		jsr func_7_0d56		; 20 56 ad
B7_0c6a:		lda $0e			; a5 0e
B7_0c6c:		sta wShadow1KBChrBank3.w		; 8d 6e 01
B7_0c6f:		rts				; 60 


func_7_0c70:
B7_0c70:		cmp wShadow1KBChrBank2.w		; cd 6d 01
B7_0c73:		sta $0e			; 85 0e
B7_0c75:		beq B7_0c7e ; f0 07

B7_0c77:		ldx #$00		; a2 00
B7_0c79:		jsr func_7_0cee		; 20 ee ac
B7_0c7c:		bcs B7_0c89 ; b0 0b

B7_0c7e:		ldx #$00		; a2 00
B7_0c80:		jsr func_7_0d56		; 20 56 ad
B7_0c83:		lda $0e			; a5 0e
B7_0c85:		sta wShadow1KBChrBank2.w		; 8d 6d 01
B7_0c88:		rts				; 60 


B7_0c89:		lda #$00		; a9 00
B7_0c8b:		sta wCachedEntityStruct.byte9			; 85 19
B7_0c8d:		pla				; 68 
B7_0c8e:		pla				; 68 
B7_0c8f:		rts				; 60 


B7_0c90:		cmp wShadow1KBChrBank3.w		; cd 6e 01
B7_0c93:		sta $0e			; 85 0e
B7_0c95:		beq B7_0c9e ; f0 07

B7_0c97:		ldx #$ff		; a2 ff
B7_0c99:		jsr func_7_0cee		; 20 ee ac
B7_0c9c:		bcs B7_0ca9 ; b0 0b

B7_0c9e:		ldx #$ff		; a2 ff
B7_0ca0:		jsr func_7_0d56		; 20 56 ad
B7_0ca3:		lda $0e			; a5 0e
B7_0ca5:		sta wShadow1KBChrBank3.w		; 8d 6e 01
B7_0ca8:		rts				; 60 


B7_0ca9:		lda #$00		; a9 00
B7_0cab:		sta wCachedEntityStruct.byte9			; 85 19
B7_0cad:		pla				; 68 
B7_0cae:		pla				; 68 
B7_0caf:		rts				; 60 


func_7_0cb0:
B7_0cb0:		stx $0d			; 86 0d
B7_0cb2:		ldx #$00		; a2 00
B7_0cb4:		cpx wEntityWramOffset.w		; ec 5b 01
B7_0cb7:		beq B7_0ce3 ; f0 2a

B7_0cb9:		lda wEntityStructs.byte9.w, x	; bd 09 04
B7_0cbc:		beq B7_0ce3 ; f0 25

B7_0cbe:		bmi B7_0ce3 ; 30 23

B7_0cc0:		txa				; 8a 
B7_0cc1:		lsr a			; 4a
B7_0cc2:		lsr a			; 4a
B7_0cc3:		lsr a			; 4a
B7_0cc4:		lsr a			; 4a
B7_0cc5:		and #$07		; 29 07
B7_0cc7:		tay				; a8 
B7_0cc8:		lda $f0.w, y
B7_0ccb:		cmp $0d			; c5 0d
B7_0ccd:		bne B7_0ce3 ; d0 14

B7_0ccf:		ldy $ad76		; ac 76 ad
B7_0cd2:		lda wEntityStructs.id.w, x	; bd 08 04
B7_0cd5:		cmp $ad77, y	; d9 77 ad
B7_0cd8:		bne B7_0ce0 ; d0 06

B7_0cda:		jsr $ad3c		; 20 3c ad
B7_0cdd:		jmp $ace3		; 4c e3 ac


B7_0ce0:		dey				; 88 
B7_0ce1:		bpl B7_0cd2 ; 10 ef

B7_0ce3:		txa				; 8a 
B7_0ce4:		clc				; 18 
B7_0ce5:		adc #$10		; 69 10
B7_0ce7:		tax				; aa 
B7_0ce8:		cpx #$80		; e0 80
B7_0cea:		bne B7_0cb4 ; d0 c8

B7_0cec:		clc				; 18 
B7_0ced:		rts				; 60 


func_7_0cee:
B7_0cee:		stx $0d			; 86 0d
B7_0cf0:		ldx #$00		; a2 00
B7_0cf2:		cpx wEntityWramOffset.w		; ec 5b 01
B7_0cf5:		beq B7_0d31 ; f0 3a

B7_0cf7:		lda wEntityStructs.byte9.w, x	; bd 09 04
B7_0cfa:		beq B7_0d31 ; f0 35

B7_0cfc:		bmi B7_0d31 ; 30 33

B7_0cfe:		txa				; 8a 
B7_0cff:		lsr a			; 4a
B7_0d00:		lsr a			; 4a
B7_0d01:		lsr a			; 4a
B7_0d02:		lsr a			; 4a
B7_0d03:		and #$07		; 29 07
B7_0d05:		tay				; a8 
B7_0d06:		lda $f0.w, y
B7_0d09:		cmp $0d			; c5 0d
B7_0d0b:		bne B7_0d31 ; d0 24

B7_0d0d:		ldy $ad65		; ac 65 ad
B7_0d10:		lda wEntityStructs.id.w, x	; bd 08 04
B7_0d13:		cmp $ad66, y	; d9 66 ad
B7_0d16:		bne B7_0d1a ; d0 02

B7_0d18:		sec				; 38 
B7_0d19:		rts				; 60 


B7_0d1a:		dey				; 88 
B7_0d1b:		bpl B7_0d10 ; 10 f3

B7_0d1d:		ldy $ad76		; ac 76 ad
B7_0d20:		lda wEntityStructs.id.w, x	; bd 08 04
B7_0d23:		cmp $ad77, y	; d9 77 ad
B7_0d26:		bne B7_0d2e ; d0 06

B7_0d28:		jsr $ad3c		; 20 3c ad
B7_0d2b:		jmp $ad31		; 4c 31 ad


B7_0d2e:		dey				; 88 
B7_0d2f:		bpl B7_0d20 ; 10 ef

B7_0d31:		txa				; 8a 
B7_0d32:		clc				; 18 
B7_0d33:		adc #$10		; 69 10
B7_0d35:		tax				; aa 
B7_0d36:		cpx #$80		; e0 80
B7_0d38:		bne B7_0cf2 ; d0 b8

B7_0d3a:		clc				; 18 
B7_0d3b:		rts				; 60 


B7_0d3c:		stx $0f			; 86 0f
B7_0d3e:		lda #$02		; a9 02
B7_0d40:		sta wEntityStructs.id.w, x	; 9d 08 04
B7_0d43:		lda #$80		; a9 80
B7_0d45:		ora wEntityStructs.byte9.w, x	; 1d 09 04
B7_0d48:		sta wEntityStructs.byte9.w, x	; 9d 09 04
B7_0d4b:		lda wEntityStructs.byteE.w, x	; bd 0e 04
B7_0d4e:		beq B7_0d55 ; f0 05

B7_0d50:		jsr unsetGlobalFlag		; 20 fc e7
B7_0d53:		ldx $0f			; a6 0f
B7_0d55:		rts				; 60 


func_7_0d56:
B7_0d56:		lda wEntityWramOffset.w		; ad 5b 01
B7_0d59:		lsr a			; 4a
B7_0d5a:		lsr a			; 4a
B7_0d5b:		lsr a			; 4a
B7_0d5c:		lsr a			; 4a
B7_0d5d:		and #$07		; 29 07
B7_0d5f:		tay				; a8 
B7_0d60:		txa				; 8a 
B7_0d61:		sta $f0.w, y
B7_0d64:		rts				; 60 


B7_0d65:	.db $0f
B7_0d66:	.db $0c
B7_0d67:	.db $0f
B7_0d68:		ora $16, x		; 15 16
B7_0d6a:		plp				; 28 
B7_0d6b:		and #$2a		; 29 2a
B7_0d6d:	.db $2b
B7_0d6e:		bit $322e		; 2c 2e 32
B7_0d71:		pha				; 48 
B7_0d72:		bvc B7_0dc5 ; 50 51

B7_0d74:	.db $52
B7_0d75:		cli				; 58 
B7_0d76:		clc				; 18 
B7_0d77:		ora ($17), y	; 11 17
B7_0d79:		clc				; 18 
B7_0d7a:		ora $1b1a, y	; 19 1a 1b
B7_0d7d:	.db $1c
B7_0d7e:		ora $1f1e, x	; 1d 1e 1f
B7_0d81:		jsr $3635		; 20 35 36
B7_0d84:	.db $37
B7_0d85:	.db $3f
B7_0d86:		eor $4f4e		; 4d 4e 4f
B7_0d89:	.db $53
B7_0d8a:	.db $54
B7_0d8b:		eor $56, x		; 55 56
B7_0d8d:	.db $5a
B7_0d8e:	.db $5b
B7_0d8f:	.db $5c
B7_0d90:		ldy #$00		; a0 00
B7_0d92:	.db $b9 $10 $00
B7_0d95:		sta $0300, x	; 9d 00 03
B7_0d98:		iny				; c8 
B7_0d99:		inx				; e8 
B7_0d9a:		cpy #$10		; c0 10
B7_0d9c:		bne B7_0d92 ; d0 f4

B7_0d9e:		txa				; 8a 
B7_0d9f:		sec				; 38 
B7_0da0:		sbc #$10		; e9 10
B7_0da2:		tax				; aa 
B7_0da3:		rts				; 60 


B7_0da4:		ldy #$00		; a0 00
B7_0da6:	.db $b9 $10 $00
B7_0da9:		sta wEntityStructs.tileX.w, x	; 9d 00 04
B7_0dac:		iny				; c8 
B7_0dad:		inx				; e8 
B7_0dae:		cpy #$10		; c0 10
B7_0db0:		bne B7_0da6 ; d0 f4

B7_0db2:		txa				; 8a 
B7_0db3:		sec				; 38 
B7_0db4:		sbc #$10		; e9 10
B7_0db6:		tax				; aa 
B7_0db7:		rts				; 60 


B7_0db8:		lda $19			; a5 19
B7_0dba:		and #$02		; 29 02
B7_0dbc:		bne B7_0dc2 ; d0 04

B7_0dbe:		lda #$02		; a9 02
B7_0dc0:		bne B7_0dc4 ; d0 02

B7_0dc2:		lda #$06		; a9 06
B7_0dc4:		asl a			; 0a
B7_0dc5:		tay				; a8 
B7_0dc6:		lda $add3, y	; b9 d3 ad
B7_0dc9:		sta $0304, x	; 9d 04 03
B7_0dcc:		lda $add4, y	; b9 d4 ad
B7_0dcf:		sta $0305, x	; 9d 05 03
B7_0dd2:		rts				; 60 


B7_0dd3:		.db $00				; 00
B7_0dd4:		cpx #$10		; e0 10
B7_0dd6:		inx				; e8 
B7_0dd7:		jsr $1800		; 20 00 18
B7_0dda:		clc				; 18 
B7_0ddb:		.db $00				; 00
B7_0ddc:		jsr $18e8		; 20 e8 18
B7_0ddf:		cpx #$00		; e0 00
B7_0de1:		inx				; e8 
B7_0de2:		inx				; e8 
B7_0de3:		asl a			; 0a
B7_0de4:		sta $00			; 85 00
B7_0de6:		asl a			; 0a
B7_0de7:		clc				; 18 
B7_0de8:		adc $00			; 65 00
B7_0dea:		tay				; a8 
B7_0deb:		lda $ae49, y	; b9 49 ae
B7_0dee:		clc				; 18 
B7_0def:		adc $13			; 65 13
B7_0df1:		sta $0303, x	; 9d 03 03
B7_0df4:		lda $12			; a5 12
B7_0df6:		adc $ae4a, y	; 79 4a ae
B7_0df9:		sta $0302, x	; 9d 02 03
B7_0dfc:		lda $19			; a5 19
B7_0dfe:		and #$02		; 29 02
B7_0e00:		beq B7_0e04 ; f0 02

B7_0e02:		iny				; c8 
B7_0e03:		iny				; c8 
B7_0e04:		lda $ae4b, y	; b9 4b ae
B7_0e07:		clc				; 18 
B7_0e08:		adc $11			; 65 11
B7_0e0a:		sta $0301, x	; 9d 01 03
B7_0e0d:		lda $ae4c, y	; b9 4c ae
B7_0e10:		adc $10			; 65 10
B7_0e12:		sta $0300, x	; 9d 00 03
B7_0e15:		rts				; 60 


B7_0e16:		asl a			; 0a
B7_0e17:		sta $00			; 85 00
B7_0e19:		asl a			; 0a
B7_0e1a:		clc				; 18 
B7_0e1b:		adc $00			; 65 00
B7_0e1d:		tay				; a8 
B7_0e1e:		lda $ae49, y	; b9 49 ae
B7_0e21:		clc				; 18 
B7_0e22:		adc $13			; 65 13
B7_0e24:		sta wEntityStructs.subY.w, x	; 9d 03 04
B7_0e27:		lda $12			; a5 12
B7_0e29:		adc $ae4a, y	; 79 4a ae
B7_0e2c:		sta wEntityStructs.tileY.w, x	; 9d 02 04
B7_0e2f:		lda $19			; a5 19
B7_0e31:		and #$02		; 29 02
B7_0e33:		beq B7_0e37 ; f0 02

B7_0e35:		iny				; c8 
B7_0e36:		iny				; c8 
B7_0e37:		lda $ae4b, y	; b9 4b ae
B7_0e3a:		clc				; 18 
B7_0e3b:		adc $11			; 65 11
B7_0e3d:		sta wEntityStructs.subX.w, x	; 9d 01 04
B7_0e40:		lda $ae4c, y	; b9 4c ae
B7_0e43:		adc $10			; 65 10
B7_0e45:		sta wEntityStructs.tileX.w, x	; 9d 00 04
B7_0e48:		rts				; 60 


B7_0e49:		rti				; 40 


B7_0e4a:		.db $00				; 00
B7_0e4b:		cpy #$00		; c0 00
B7_0e4d:		rti				; 40 


B7_0e4e:	.db $ff
B7_0e4f:	.db $80
B7_0e50:	.db $ff
B7_0e51:		cpy #$00		; c0 00
B7_0e53:		rti				; 40 


B7_0e54:	.db $ff
B7_0e55:		.db $00				; 00
B7_0e56:		.db $00				; 00
B7_0e57:		.db $00				; 00
B7_0e58:		.db $00				; 00
B7_0e59:		.db $00				; 00
B7_0e5a:	.db $fc
B7_0e5b:		ldy #$ff		; a0 ff
B7_0e5d:	.db $80
B7_0e5e:		.db $00				; 00
B7_0e5f:	.db $80
B7_0e60:	.db $ff


enInit_06:
B7_0e61:		ldx #$70		; a2 70
B7_0e63:		lda wEntityStructs.byte9.w, x	; bd 09 04
B7_0e66:		bne B7_0e9b ; d0 33

B7_0e68:		jsr $ada4		; 20 a4 ad
B7_0e6b:		lda wEntityStructs.tileY.w, x	; bd 02 04
B7_0e6e:		sec				; 38 
B7_0e6f:		sbc #$01		; e9 01
B7_0e71:		sta wEntityStructs.tileY.w, x	; 9d 02 04
B7_0e74:		lda #$c0		; a9 c0
B7_0e76:		sta wEntityStructs.byte5.w, x	; 9d 05 04
B7_0e79:		lda #$1a		; a9 1a
B7_0e7b:		sta wEntityStructs.id.w, x	; 9d 08 04
B7_0e7e:		lda wEntityStructs.byte9.w, x	; bd 09 04
B7_0e81:		ora #$04		; 09 04
B7_0e83:		sta wEntityStructs.byte9.w, x	; 9d 09 04
B7_0e86:		and #$02		; 29 02
B7_0e88:		bne B7_0e8e ; d0 04

B7_0e8a:		lda #$0c		; a9 0c
B7_0e8c:		bne B7_0e90 ; d0 02

B7_0e8e:		lda #$f4		; a9 f4
B7_0e90:		sta wEntityStructs.byte4.w, x	; 9d 04 04
B7_0e93:		lda #$00		; a9 00
B7_0e95:		sta wEntityStructs.byteB.w, x	; 9d 0b 04
B7_0e98:		sta wEntityStructs.subID.w, x	; 9d 0f 04
B7_0e9b:		rts				; 60 


B7_0e9c:		jsr $819f		; 20 9f 81
B7_0e9f:		lda #$80		; a9 80
B7_0ea1:		sta $11			; 85 11
B7_0ea3:		sta wCachedEntityStruct.subY			; 85 13
B7_0ea5:		lda #$16		; a9 16
B7_0ea7:		sta wCachedEntityStruct.byteA			; 85 1a
B7_0ea9:		rts				; 60 


B7_0eaa:		jsr $819f		; 20 9f 81
B7_0ead:		lda #$80		; a9 80
B7_0eaf:		sta $11			; 85 11
B7_0eb1:		sta wCachedEntityStruct.subY			; 85 13
B7_0eb3:		lda #$18		; a9 18
B7_0eb5:		sta wCachedEntityStruct.byteA			; 85 1a
B7_0eb7:		rts				; 60 


enInit_smallGhost:
B7_0eb8:		lda #$7b		; a9 7b
B7_0eba:		jsr func_7_0c70		; 20 70 ac
B7_0ebd:		jsr func_a_019f		; 20 9f 81
B7_0ec0:		jsr func_a_0a26		; 20 26 8a

// 0 left, 1 right
B7_0ec3:		lda wCachedEntityStruct.subID			; a5 1f
B7_0ec5:		and #$80		; 29 80
B7_0ec7:		bpl B7_0ed7 ; 10 0e

// bit 7 set
B7_0ec9:		sta wCachedEntityStruct.byteA			; 85 1a
B7_0ecb:		lda #$00		; a9 00
B7_0ecd:		sta wCachedEntityStruct.byte4			; 85 14
B7_0ecf:		lda #$10		; a9 10
B7_0ed1:		sta wCachedEntityStruct.byteD			; 85 1d
B7_0ed3:		lda #$03		; a9 03
B7_0ed5:		bne B7_0ee0 ; d0 09

// bit 7 not set
B7_0ed7:		sta wCachedEntityStruct.byteA			; 85 1a
B7_0ed9:		lda #$08		; a9 08
B7_0edb:		jsr func_a_0214		; 20 14 82
B7_0ede:		lda #$00		; a9 00

B7_0ee0:		sta wCachedEntityStruct.byteB			; 85 1b
B7_0ee2:		lda #$00		; a9 00
B7_0ee4:		sta $1f			; 85 1f
B7_0ee6:		lda #$80		; a9 80
B7_0ee8:		sta wCachedEntityStruct.subY			; 85 13
B7_0eea:		lda #$86		; a9 86
B7_0eec:		jmp func_a_0a57		; 4c 57 8a


B7_0eef:		lda #$7a		; a9 7a
B7_0ef1:		jsr func_7_0c70		; 20 70 ac
B7_0ef4:		jsr $819f		; 20 9f 81
B7_0ef7:		lda #$80		; a9 80
B7_0ef9:		sta wCachedEntityStruct.subY			; 85 13
B7_0efb:		lda #$00		; a9 00
B7_0efd:		sta $1f			; 85 1f
B7_0eff:		jsr $8a26		; 20 26 8a
B7_0f02:		lda #$88		; a9 88
B7_0f04:		jmp $8a57		; 4c 57 8a


B7_0f07:		lda #$79		; a9 79
B7_0f09:		jsr func_7_0c70		; 20 70 ac
B7_0f0c:		jsr $819f		; 20 9f 81
B7_0f0f:		jsr $8a26		; 20 26 8a
B7_0f12:		lda #$0c		; a9 0c
B7_0f14:		jsr $8214		; 20 14 82
B7_0f17:		lda #$00		; a9 00
B7_0f19:		sta wCachedEntityStruct.byte5			; 85 15
B7_0f1b:		lda #$00		; a9 00
B7_0f1d:		sta wCachedEntityStruct.byteA			; 85 1a
B7_0f1f:		lda #$40		; a9 40
B7_0f21:		sta wCachedEntityStruct.byteC			; 85 1c
B7_0f23:		lda #$09		; a9 09
B7_0f25:		sta wCachedEntityStruct.byteD			; 85 1d
B7_0f27:		lda #$00		; a9 00
B7_0f29:		sta $1f			; 85 1f
B7_0f2b:		lda #$40		; a9 40
B7_0f2d:		sta wCachedEntityStruct.subY			; 85 13
B7_0f2f:		lda #$86		; a9 86
B7_0f31:		jmp $8a57		; 4c 57 8a


B7_0f34:		lda #$65		; a9 65
B7_0f36:		jsr $ac90		; 20 90 ac
B7_0f39:		jsr $819f		; 20 9f 81
B7_0f3c:		lda #$00		; a9 00
B7_0f3e:		sta wCachedEntityStruct.byteA			; 85 1a
B7_0f40:		lda #$40		; a9 40
B7_0f42:		sta wCachedEntityStruct.byteC			; 85 1c
B7_0f44:		lda #$01		; a9 01
B7_0f46:		sta $1f			; 85 1f
B7_0f48:		jsr $8a26		; 20 26 8a
B7_0f4b:		lda #$82		; a9 82
B7_0f4d:		jsr $8a57		; 20 57 8a
B7_0f50:		lda #$c1		; a9 c1
B7_0f52:		jmp $8a57		; 4c 57 8a


B7_0f55:		lda #$65		; a9 65
B7_0f57:		jsr $ac90		; 20 90 ac
B7_0f5a:		jsr $819f		; 20 9f 81
B7_0f5d:		jsr $8a26		; 20 26 8a
B7_0f60:		lda #$00		; a9 00
B7_0f62:		sta wCachedEntityStruct.byteB			; 85 1b
B7_0f64:		lda #$00		; a9 00
B7_0f66:		sta $1f			; 85 1f
B7_0f68:		lda #$c1		; a9 c1
B7_0f6a:		jmp $8a57		; 4c 57 8a


B7_0f6d:		lda #$64		; a9 64
B7_0f6f:		jsr $ac90		; 20 90 ac
B7_0f72:		jsr $819f		; 20 9f 81
B7_0f75:		lda #$00		; a9 00
B7_0f77:		sta wCachedEntityStruct.byteA			; 85 1a
B7_0f79:		jsr $8a26		; 20 26 8a
B7_0f7c:		lda #$08		; a9 08
B7_0f7e:		jsr $8214		; 20 14 82
B7_0f81:		lda #$00		; a9 00
B7_0f83:		sta $1f			; 85 1f
B7_0f85:		lda #$d6		; a9 d6
B7_0f87:		jmp $8a57		; 4c 57 8a


B7_0f8a:		lda #$6a		; a9 6a
B7_0f8c:		jsr $ac90		; 20 90 ac
B7_0f8f:		jsr $819f		; 20 9f 81
B7_0f92:		jsr $8a26		; 20 26 8a
B7_0f95:		lda #$0c		; a9 0c
B7_0f97:		jsr $8214		; 20 14 82
B7_0f9a:		lda #$01		; a9 01
B7_0f9c:		sta $1f			; 85 1f
B7_0f9e:		rts				; 60 


B7_0f9f:		lda #$69		; a9 69
B7_0fa1:		jsr $ac90		; 20 90 ac
B7_0fa4:		jsr $819f		; 20 9f 81
B7_0fa7:		jsr $8a26		; 20 26 8a
B7_0faa:		lda #$20		; a9 20
B7_0fac:		jsr $8214		; 20 14 82
B7_0faf:		lda #$00		; a9 00
B7_0fb1:		sta $1f			; 85 1f
B7_0fb3:		lda #$94		; a9 94
B7_0fb5:		jmp $8a57		; 4c 57 8a


B7_0fb8:		lda #$69		; a9 69
B7_0fba:		jsr $ac90		; 20 90 ac
B7_0fbd:		jsr $819f		; 20 9f 81
B7_0fc0:		jsr $8a26		; 20 26 8a
B7_0fc3:		lda #$10		; a9 10
B7_0fc5:		jsr $8214		; 20 14 82
B7_0fc8:		lda #$00		; a9 00
B7_0fca:		sta wCachedEntityStruct.byteB			; 85 1b
B7_0fcc:		lda #$00		; a9 00
B7_0fce:		sta $1f			; 85 1f
B7_0fd0:		lda #$86		; a9 86
B7_0fd2:		jmp $8a57		; 4c 57 8a


B7_0fd5:		lda #$68		; a9 68
B7_0fd7:		jsr $ac90		; 20 90 ac
B7_0fda:		jsr $819f		; 20 9f 81
B7_0fdd:		jsr $8a26		; 20 26 8a
B7_0fe0:		lda #$06		; a9 06
B7_0fe2:		jsr $8214		; 20 14 82
B7_0fe5:		lda #$00		; a9 00
B7_0fe7:		sta wCachedEntityStruct.byteA			; 85 1a
B7_0fe9:		lda #$00		; a9 00
B7_0feb:		sta $1f			; 85 1f
B7_0fed:		lda #$95		; a9 95
B7_0fef:		jmp $8a57		; 4c 57 8a


B7_0ff2:		ldx wEntityWramOffset.w		; ae 5b 01
B7_0ff5:		lda $0309, x	; bd 09 03
B7_0ff8:		bne B7_1012 ; d0 18

B7_0ffa:		jsr $ad90		; 20 90 ad
B7_0ffd:		lda wEntityWramOffset.w		; ad 5b 01
B7_1000:		sta $030b, x	; 9d 0b 03
B7_1003:		lda #$b0		; a9 b0
B7_1005:		sta $0305, x	; 9d 05 03
B7_1008:		lda #$20		; a9 20
B7_100a:		sta $0308, x	; 9d 08 03
B7_100d:		lda #$01		; a9 01
B7_100f:		sta $030f, x	; 9d 0f 03
B7_1012:		rts				; 60 


enInit_freeonFight:
B7_1013:		lda #GF_freeon		; a9 08
B7_1015:		jsr checkGlobalFlag		; 20 e9 e7
B7_1018:		beq B7_101f ; f0 05

// set to not update
B7_101a:		lda #$00		; a9 00
B7_101c:		sta wCachedEntityStruct.byte9			; 85 19
B7_101e:		rts				; 60 

B7_101f:		jsr $819f		; 20 9f 81
B7_1022:		lda #$80		; a9 80
B7_1024:		sta wCachedEntityStruct.byteA			; 85 1a
B7_1026:		lda #$00		; a9 00
B7_1028:		sta wCachedEntityStruct.byteB			; 85 1b
B7_102a:		lda #$50		; a9 50
B7_102c:		sta wCachedEntityStruct.byteC			; 85 1c
B7_102e:		lda #$01		; a9 01
B7_1030:		sta $1f			; 85 1f
B7_1032:		lda #$88		; a9 88
B7_1034:		sta $2c			; 85 2c
B7_1036:		sta $2d			; 85 2d
B7_1038:		jsr $8a26		; 20 26 8a
B7_103b:		lda #$10		; a9 10
B7_103d:		jsr $8214		; 20 14 82
B7_1040:		lda #$c6		; a9 c6
B7_1042:		jsr $8a57		; 20 57 8a
B7_1045:		lda #$4d		; a9 4d
B7_1047:		jsr setGlobalFlag		; 20 f0 e7
B7_104a:		lda #$5d		; a9 5d
B7_104c:		jsr setGlobalFlag		; 20 f0 e7
B7_104f:		lda #$00		; a9 00
B7_1051:		sta $0504		; 8d 04 05
B7_1054:		sta $0505		; 8d 05 05
B7_1057:		lda #$08		; a9 08
B7_1059:		jsr func_08e5		; 20 e5 e8
B7_105c:		jmp $8789		; 4c 89 87


B7_105f:		lda #$09		; a9 09
B7_1061:		jsr checkGlobalFlag		; 20 e9 e7
B7_1064:		beq B7_106b ; f0 05

B7_1066:		lda #$00		; a9 00
B7_1068:		sta wCachedEntityStruct.byte9			; 85 19
B7_106a:		rts				; 60 

B7_106b:		jsr $819f		; 20 9f 81
B7_106e:		lda #$81		; a9 81
B7_1070:		sta wCachedEntityStruct.byteA			; 85 1a
B7_1072:		lda #$00		; a9 00
B7_1074:		sta wCachedEntityStruct.byteB			; 85 1b
B7_1076:		lda #$50		; a9 50
B7_1078:		sta wCachedEntityStruct.byteC			; 85 1c
B7_107a:		lda #$01		; a9 01
B7_107c:		sta $1f			; 85 1f
B7_107e:		lda #$88		; a9 88
B7_1080:		sta $2c			; 85 2c
B7_1082:		sta $2d			; 85 2d
B7_1084:		jsr $8a26		; 20 26 8a
B7_1087:		lda #$18		; a9 18
B7_1089:		jsr $8214		; 20 14 82
B7_108c:		lda #$c7		; a9 c7
B7_108e:		jsr $8a57		; 20 57 8a
B7_1091:		lda #$4d		; a9 4d
B7_1093:		jsr setGlobalFlag		; 20 f0 e7
B7_1096:		lda #$5d		; a9 5d
B7_1098:		jsr setGlobalFlag		; 20 f0 e7
B7_109b:		lda #$00		; a9 00
B7_109d:		sta $0504		; 8d 04 05
B7_10a0:		sta $0505		; 8d 05 05
B7_10a3:		lda #$08		; a9 08
B7_10a5:		jsr func_08e5		; 20 e5 e8
B7_10a8:		jmp $8789		; 4c 89 87


B7_10ab:		lda #$0a		; a9 0a
B7_10ad:		jsr checkGlobalFlag		; 20 e9 e7
B7_10b0:		beq B7_10b7 ; f0 05

B7_10b2:		lda #$00		; a9 00
B7_10b4:		sta wCachedEntityStruct.byte9			; 85 19
B7_10b6:		rts				; 60 


B7_10b7:		jsr $819f		; 20 9f 81
B7_10ba:		lda #$82		; a9 82
B7_10bc:		sta wCachedEntityStruct.byteA			; 85 1a
B7_10be:		lda #$00		; a9 00
B7_10c0:		sta wCachedEntityStruct.byteB			; 85 1b
B7_10c2:		lda #$50		; a9 50
B7_10c4:		sta wCachedEntityStruct.byteC			; 85 1c
B7_10c6:		lda #$01		; a9 01
B7_10c8:		sta $1f			; 85 1f
B7_10ca:		lda #$88		; a9 88
B7_10cc:		sta $2c			; 85 2c
B7_10ce:		sta $2d			; 85 2d
B7_10d0:		jsr $8a26		; 20 26 8a
B7_10d3:		lda #$18		; a9 18
B7_10d5:		jsr $8214		; 20 14 82
B7_10d8:		lda #$c8		; a9 c8
B7_10da:		jsr $8a57		; 20 57 8a
B7_10dd:		lda #$4d		; a9 4d
B7_10df:		jsr setGlobalFlag		; 20 f0 e7
B7_10e2:		lda #$5d		; a9 5d
B7_10e4:		jsr setGlobalFlag		; 20 f0 e7
B7_10e7:		lda #$00		; a9 00
B7_10e9:		sta $0504		; 8d 04 05
B7_10ec:		sta $0505		; 8d 05 05
B7_10ef:		lda #$08		; a9 08
B7_10f1:		jsr func_08e5		; 20 e5 e8
B7_10f4:		jmp $8789		; 4c 89 87


B7_10f7:		lda #$20		; a9 20
B7_10f9:		jsr checkGlobalFlag		; 20 e9 e7
B7_10fc:		beq B7_1103 ; f0 05

B7_10fe:		lda #$00		; a9 00
B7_1100:		sta wCachedEntityStruct.byte9			; 85 19
B7_1102:		rts				; 60 


B7_1103:		jsr $819f		; 20 9f 81
B7_1106:		lda #$80		; a9 80
B7_1108:		sta wCachedEntityStruct.byteA			; 85 1a
B7_110a:		sta wCachedEntityStruct.subY			; 85 13
B7_110c:		jsr $8a26		; 20 26 8a
B7_110f:		lda #$10		; a9 10
B7_1111:		jsr $8214		; 20 14 82
B7_1114:		lda #$a0		; a9 a0
B7_1116:		sta wCachedEntityStruct.byteC			; 85 1c
B7_1118:		lda #$04		; a9 04
B7_111a:		sta $1f			; 85 1f
B7_111c:		lda #$c9		; a9 c9
B7_111e:		jsr $8a57		; 20 57 8a
B7_1121:		lda #$4d		; a9 4d
B7_1123:		jsr setGlobalFlag		; 20 f0 e7
B7_1126:		lda #$5d		; a9 5d
B7_1128:		jsr setGlobalFlag		; 20 f0 e7
B7_112b:		lda #$00		; a9 00
B7_112d:		sta $0504		; 8d 04 05
B7_1130:		sta $0505		; 8d 05 05
B7_1133:		lda #$08		; a9 08
B7_1135:		jsr func_08e5		; 20 e5 e8
B7_1138:		jmp $8789		; 4c 89 87


B7_113b:		lda #$6c		; a9 6c
B7_113d:		jsr $ac90		; 20 90 ac
B7_1140:		jsr $819f		; 20 9f 81
B7_1143:		jsr $8a26		; 20 26 8a
B7_1146:		lda #$00		; a9 00
B7_1148:		sta wCachedEntityStruct.byteA			; 85 1a
B7_114a:		lda #$02		; a9 02
B7_114c:		sta $1f			; 85 1f
B7_114e:		lda #$c6		; a9 c6
B7_1150:		jmp $8a57		; 4c 57 8a


B7_1153:		lda #$6c		; a9 6c
B7_1155:		jsr $ac90		; 20 90 ac
B7_1158:		jsr $819f		; 20 9f 81
B7_115b:		jsr $8a26		; 20 26 8a
B7_115e:		lda #$10		; a9 10
B7_1160:		jsr $8214		; 20 14 82
B7_1163:		lda #$00		; a9 00
B7_1165:		sta wCachedEntityStruct.byte5			; 85 15
B7_1167:		lda #$01		; a9 01
B7_1169:		sta wCachedEntityStruct.byteB			; 85 1b
B7_116b:		lda #$10		; a9 10
B7_116d:		sta wCachedEntityStruct.byteD			; 85 1d
B7_116f:		lda #$00		; a9 00
B7_1171:		sta $1f			; 85 1f
B7_1173:		lda #$c6		; a9 c6
B7_1175:		jmp $8a57		; 4c 57 8a


B7_1178:		lda #$6d		; a9 6d
B7_117a:		jsr $ac90		; 20 90 ac
B7_117d:		jsr $819f		; 20 9f 81
B7_1180:		jsr $8a26		; 20 26 8a
B7_1183:		lda #$10		; a9 10
B7_1185:		jsr $8214		; 20 14 82
B7_1188:		lda #$00		; a9 00
B7_118a:		sta wCachedEntityStruct.byteA			; 85 1a
B7_118c:		lda #$60		; a9 60
B7_118e:		sta wCachedEntityStruct.byteC			; 85 1c
B7_1190:		lda #$00		; a9 00
B7_1192:		sta $1f			; 85 1f
B7_1194:		lda #$d7		; a9 d7
B7_1196:		jmp $8a57		; 4c 57 8a


B7_1199:		lda #$21		; a9 21
B7_119b:		jsr checkGlobalFlag		; 20 e9 e7
B7_119e:		beq B7_11a5 ; f0 05

B7_11a0:		lda #$00		; a9 00
B7_11a2:		sta wCachedEntityStruct.byte9			; 85 19
B7_11a4:		rts				; 60 


B7_11a5:		jsr $819f		; 20 9f 81
B7_11a8:		lda #$80		; a9 80
B7_11aa:		sta wCachedEntityStruct.byteA			; 85 1a
B7_11ac:		sta wCachedEntityStruct.subY			; 85 13
B7_11ae:		jsr $8a26		; 20 26 8a
B7_11b1:		lda #$10		; a9 10
B7_11b3:		jsr $8214		; 20 14 82
B7_11b6:		lda #$a8		; a9 a8
B7_11b8:		sta wCachedEntityStruct.byteC			; 85 1c
B7_11ba:		lda #$04		; a9 04
B7_11bc:		sta $1f			; 85 1f
B7_11be:		lda #$cb		; a9 cb
B7_11c0:		jsr $8a57		; 20 57 8a
B7_11c3:		lda #$4d		; a9 4d
B7_11c5:		jsr setGlobalFlag		; 20 f0 e7
B7_11c8:		lda #$5d		; a9 5d
B7_11ca:		jsr setGlobalFlag		; 20 f0 e7
B7_11cd:		lda #$00		; a9 00
B7_11cf:		sta $0504		; 8d 04 05
B7_11d2:		sta $0505		; 8d 05 05
B7_11d5:		lda #$08		; a9 08
B7_11d7:		jsr func_08e5		; 20 e5 e8
B7_11da:		jmp $8789		; 4c 89 87


B7_11dd:		lda #$22		; a9 22
B7_11df:		jsr checkGlobalFlag		; 20 e9 e7
B7_11e2:		beq B7_11e9 ; f0 05

B7_11e4:		lda #$00		; a9 00
B7_11e6:		sta wCachedEntityStruct.byte9			; 85 19
B7_11e8:		rts				; 60 


B7_11e9:		jsr $819f		; 20 9f 81
B7_11ec:		lda #$80		; a9 80
B7_11ee:		sta wCachedEntityStruct.byteA			; 85 1a
B7_11f0:		sta wCachedEntityStruct.subY			; 85 13
B7_11f2:		lda #$a0		; a9 a0
B7_11f4:		sta wCachedEntityStruct.byteC			; 85 1c
B7_11f6:		jsr $8a26		; 20 26 8a
B7_11f9:		lda #$00		; a9 00
B7_11fb:		sta wCachedEntityStruct.byte4			; 85 14
B7_11fd:		sta wCachedEntityStruct.byte5			; 85 15
B7_11ff:		lda #$04		; a9 04
B7_1201:		sta $1f			; 85 1f
B7_1203:		lda #$cc		; a9 cc
B7_1205:		jsr $8a57		; 20 57 8a
B7_1208:		lda #$4d		; a9 4d
B7_120a:		jsr setGlobalFlag		; 20 f0 e7
B7_120d:		lda #$5d		; a9 5d
B7_120f:		jsr setGlobalFlag		; 20 f0 e7
B7_1212:		lda #$00		; a9 00
B7_1214:		sta $0504		; 8d 04 05
B7_1217:		sta $0505		; 8d 05 05
B7_121a:		lda #$08		; a9 08
B7_121c:		jsr func_08e5		; 20 e5 e8
B7_121f:		jmp $8789		; 4c 89 87


B7_1222:		lda #$23		; a9 23
B7_1224:		jsr checkGlobalFlag		; 20 e9 e7
B7_1227:		beq B7_122e ; f0 05

B7_1229:		lda #$00		; a9 00
B7_122b:		sta wCachedEntityStruct.byte9			; 85 19
B7_122d:		rts				; 60 


B7_122e:		jsr $819f		; 20 9f 81
B7_1231:		lda #$80		; a9 80
B7_1233:		sta wCachedEntityStruct.byteA			; 85 1a
B7_1235:		sta wCachedEntityStruct.subY			; 85 13
B7_1237:		jsr $8a26		; 20 26 8a
B7_123a:		lda #$10		; a9 10
B7_123c:		jsr $8214		; 20 14 82
B7_123f:		lda #$a0		; a9 a0
B7_1241:		sta wCachedEntityStruct.byteC			; 85 1c
B7_1243:		lda #$04		; a9 04
B7_1245:		sta $1f			; 85 1f
B7_1247:		lda #$cd		; a9 cd
B7_1249:		jsr $8a57		; 20 57 8a
B7_124c:		lda #$4d		; a9 4d
B7_124e:		jsr setGlobalFlag		; 20 f0 e7
B7_1251:		lda #$5d		; a9 5d
B7_1253:		jsr setGlobalFlag		; 20 f0 e7
B7_1256:		lda #$00		; a9 00
B7_1258:		sta $0504		; 8d 04 05
B7_125b:		sta $0505		; 8d 05 05
B7_125e:		lda #$08		; a9 08
B7_1260:		jsr func_08e5		; 20 e5 e8
B7_1263:		jmp $8789		; 4c 89 87


B7_1266:		lda #$24		; a9 24
B7_1268:		jsr checkGlobalFlag		; 20 e9 e7
B7_126b:		beq B7_1272 ; f0 05

B7_126d:		lda #$00		; a9 00
B7_126f:		sta wCachedEntityStruct.byte9			; 85 19
B7_1271:		rts				; 60 


B7_1272:		jsr $819f		; 20 9f 81
B7_1275:		lda #$80		; a9 80
B7_1277:		sta wCachedEntityStruct.byteA			; 85 1a
B7_1279:		sta wCachedEntityStruct.subY			; 85 13
B7_127b:		lda #$a0		; a9 a0
B7_127d:		sta wCachedEntityStruct.byteC			; 85 1c
B7_127f:		jsr $8a26		; 20 26 8a
B7_1282:		lda #$10		; a9 10
B7_1284:		jsr $8214		; 20 14 82
B7_1287:		lda #$05		; a9 05
B7_1289:		sta $1f			; 85 1f
B7_128b:		lda #$c0		; a9 c0
B7_128d:		jsr $8a57		; 20 57 8a
B7_1290:		lda #$4d		; a9 4d
B7_1292:		jsr setGlobalFlag		; 20 f0 e7
B7_1295:		lda #$5d		; a9 5d
B7_1297:		jsr setGlobalFlag		; 20 f0 e7
B7_129a:		lda #$00		; a9 00
B7_129c:		sta $0504		; 8d 04 05
B7_129f:		sta $0505		; 8d 05 05
B7_12a2:		lda #$08		; a9 08
B7_12a4:		jsr func_08e5		; 20 e5 e8
B7_12a7:		jmp $8789		; 4c 89 87


B7_12aa:		lda #$25		; a9 25
B7_12ac:		jsr checkGlobalFlag		; 20 e9 e7
B7_12af:		beq B7_12b6 ; f0 05

B7_12b1:		lda #$00		; a9 00
B7_12b3:		sta wCachedEntityStruct.byte9			; 85 19
B7_12b5:		rts				; 60 


B7_12b6:		jsr $819f		; 20 9f 81
B7_12b9:		lda #$80		; a9 80
B7_12bb:		sta wCachedEntityStruct.byteA			; 85 1a
B7_12bd:		lda #$24		; a9 24
B7_12bf:		sta $12			; 85 12
B7_12c1:		lda #$a0		; a9 a0
B7_12c3:		sta wCachedEntityStruct.byteC			; 85 1c
B7_12c5:		jsr $8a26		; 20 26 8a
B7_12c8:		lda #$04		; a9 04
B7_12ca:		sta $1f			; 85 1f
B7_12cc:		lda #$8f		; a9 8f
B7_12ce:		jsr $8a57		; 20 57 8a
B7_12d1:		lda #$4d		; a9 4d
B7_12d3:		jsr setGlobalFlag		; 20 f0 e7
B7_12d6:		lda #$5d		; a9 5d
B7_12d8:		jsr setGlobalFlag		; 20 f0 e7
B7_12db:		lda #$08		; a9 08
B7_12dd:		jsr func_08e5		; 20 e5 e8
B7_12e0:		jmp $8789		; 4c 89 87


B7_12e3:		ldx #$00		; a2 00
B7_12e5:		lda $0309, x	; bd 09 03
B7_12e8:		bne B7_132b ; d0 41

B7_12ea:		lda #$4d		; a9 4d
B7_12ec:		sta $0300, x	; 9d 00 03
B7_12ef:		lda #$00		; a9 00
B7_12f1:		sta $0301, x	; 9d 01 03
B7_12f4:		lda #$26		; a9 26
B7_12f6:		sta $0302, x	; 9d 02 03
B7_12f9:		lda #$00		; a9 00
B7_12fb:		sta $0303, x	; 9d 03 03
B7_12fe:		lda #$00		; a9 00
B7_1300:		sta $0304, x	; 9d 04 03
B7_1303:		lda #$d8		; a9 d8
B7_1305:		sta $0305, x	; 9d 05 03
B7_1308:		lda #$3e		; a9 3e
B7_130a:		sta $0308, x	; 9d 08 03
B7_130d:		lda #$03		; a9 03
B7_130f:		sta $0309, x	; 9d 09 03
B7_1312:		lda #$80		; a9 80
B7_1314:		sta $030a, x	; 9d 0a 03
B7_1317:		lda #$03		; a9 03
B7_1319:		sta $030b, x	; 9d 0b 03
B7_131c:		lda #$a0		; a9 a0
B7_131e:		sta $030c, x	; 9d 0c 03
B7_1321:		lda #$01		; a9 01
B7_1323:		sta $030f, x	; 9d 0f 03
B7_1326:		lda #$d0		; a9 d0
B7_1328:		jmp $8a57		; 4c 57 8a


B7_132b:		rts				; 60 


B7_132c:		ldx #$70		; a2 70
B7_132e:		lda wEntityStructs.byte9.w, x	; bd 09 04
B7_1331:		bne B7_1360 ; d0 2d

B7_1333:		jsr $ada4		; 20 a4 ad
B7_1336:		lda wEntityStructs.tileY.w, x	; bd 02 04
B7_1339:		clc				; 18 
B7_133a:		adc #$01		; 69 01
B7_133c:		sta wEntityStructs.tileY.w, x	; 9d 02 04
B7_133f:		lda #$00		; a9 00
B7_1341:		sta wEntityStructs.byte4.w, x	; 9d 04 04
B7_1344:		sta wEntityStructs.byte5.w, x	; 9d 05 04
B7_1347:		lda #$3f		; a9 3f
B7_1349:		sta wEntityStructs.id.w, x	; 9d 08 04
B7_134c:		lda wEntityStructs.byte9.w, x	; bd 09 04
B7_134f:		ora #$04		; 09 04
.ifndef ROM_JP
B7_1351:		and #$fd		; 29 fd
.endif
B7_1353:		sta wEntityStructs.byte9.w, x	; 9d 09 04
B7_1356:		lda #$10		; a9 10
B7_1358:		sta wEntityStructs.byteC.w, x	; 9d 0c 04
B7_135b:		lda #$00		; a9 00
B7_135d:		sta wEntityStructs.subID.w, x	; 9d 0f 04
B7_1360:		rts				; 60 


B7_1361:		lda #$26		; a9 26
B7_1363:		jsr checkGlobalFlag		; 20 e9 e7
B7_1366:		beq B7_136d ; f0 05

B7_1368:		lda #$00		; a9 00
B7_136a:		sta wCachedEntityStruct.byte9			; 85 19
B7_136c:		rts				; 60 


B7_136d:		jsr $819f		; 20 9f 81
B7_1370:		lda #$80		; a9 80
B7_1372:		sta wCachedEntityStruct.byteA			; 85 1a
B7_1374:		jsr $8a26		; 20 26 8a
B7_1377:		lda #$0c		; a9 0c
B7_1379:		jsr $8214		; 20 14 82
B7_137c:		lda #$a0		; a9 a0
B7_137e:		sta wCachedEntityStruct.byteC			; 85 1c
B7_1380:		lda #$40		; a9 40
B7_1382:		sta wCachedEntityStruct.byteD			; 85 1d
B7_1384:		lda #$05		; a9 05
B7_1386:		sta $1f			; 85 1f
B7_1388:		lda #$cf		; a9 cf
B7_138a:		jsr $8a57		; 20 57 8a
B7_138d:		lda #$80		; a9 80
B7_138f:		jsr $8a57		; 20 57 8a
B7_1392:		lda #$53		; a9 53
B7_1394:		jsr $8a57		; 20 57 8a
B7_1397:		lda #$4d		; a9 4d
B7_1399:		jsr setGlobalFlag		; 20 f0 e7
B7_139c:		lda #$5d		; a9 5d
B7_139e:		jsr setGlobalFlag		; 20 f0 e7
B7_13a1:		lda #$00		; a9 00
B7_13a3:		sta $0504		; 8d 04 05
B7_13a6:		sta $0505		; 8d 05 05
B7_13a9:		sta wCachedEntityStruct.byte5			; 85 15
B7_13ab:		lda #$08		; a9 08
B7_13ad:		jsr func_08e5		; 20 e5 e8
B7_13b0:		jmp $8789		; 4c 89 87


B7_13b3:		ldx #$00		; a2 00
B7_13b5:		lda $0309, x	; bd 09 03
B7_13b8:		bne B7_13db ; d0 21

B7_13ba:		jsr $ad90		; 20 90 ad
B7_13bd:		lda $0302, x	; bd 02 03
B7_13c0:		clc				; 18 
B7_13c1:		adc #$03		; 69 03
B7_13c3:		sta $0302, x	; 9d 02 03
B7_13c6:		lda #$00		; a9 00
B7_13c8:		sta $0304, x	; 9d 04 03
B7_13cb:		sta $0305, x	; 9d 05 03
B7_13ce:		sta $030f, x	; 9d 0f 03
B7_13d1:		lda #$45		; a9 45
B7_13d3:		sta $0308, x	; 9d 08 03
B7_13d6:		lda #$43		; a9 43
B7_13d8:		jmp func_08fa		; 4c fa e8


B7_13db:		rts				; 60 


B7_13dc:		jsr func_0838		; 20 38 e8
B7_13df:		bne B7_1415 ; d0 34

B7_13e1:		jsr $ad90		; 20 90 ad
B7_13e4:		lda $0309, x	; bd 09 03
B7_13e7:		and #$02		; 29 02
B7_13e9:		bne B7_13f4 ; d0 09

B7_13eb:		lda $0306, x	; bd 06 03
B7_13ee:		clc				; 18 
B7_13ef:		adc #$20		; 69 20
B7_13f1:		jmp B7_13fa		; 4c fa b3

B7_13f4:		lda $0306, x	; bd 06 03
B7_13f7:		sec				; 38 
B7_13f8:		sbc #$20		; e9 20

B7_13fa:		sta $0306, x	; 9d 06 03
B7_13fd:		lda $0307, x	; bd 07 03
B7_1400:		clc				; 18 
B7_1401:		adc #$10		; 69 10
B7_1403:		sta $0307, x	; 9d 07 03
B7_1406:		lda #$46		; a9 46
B7_1408:		sta $0308, x	; 9d 08 03
B7_140b:		lda #$01		; a9 01
B7_140d:		sta $030f, x	; 9d 0f 03
B7_1410:		lda #$40		; a9 40
B7_1412:		jmp func_08fa		; 4c fa e8


B7_1415:		rts				; 60 


B7_1416:		lda #$2b		; a9 2b
B7_1418:		jsr $ac90		; 20 90 ac
B7_141b:		jsr $819f		; 20 9f 81
B7_141e:		jsr $8a26		; 20 26 8a
B7_1421:		lda #$08		; a9 08
B7_1423:		jsr $8214		; 20 14 82
B7_1426:		lda #$01		; a9 01
B7_1428:		sta wCachedEntityStruct.byteB			; 85 1b
B7_142a:		lda #$00		; a9 00
B7_142c:		sta $1f			; 85 1f
B7_142e:		lda #$80		; a9 80
B7_1430:		sta wCachedEntityStruct.subY			; 85 13
B7_1432:		lda #$de		; a9 de
B7_1434:		jmp $8a57		; 4c 57 8a


B7_1437:		lda #$2a		; a9 2a
B7_1439:		jsr $ac90		; 20 90 ac
B7_143c:		jsr $819f		; 20 9f 81
B7_143f:		jsr $8a26		; 20 26 8a
B7_1442:		lda #$00		; a9 00
B7_1444:		sta wCachedEntityStruct.byte4			; 85 14
B7_1446:		sta wCachedEntityStruct.byteB			; 85 1b
B7_1448:		sta $1f			; 85 1f
B7_144a:		lda #$80		; a9 80
B7_144c:		sta wCachedEntityStruct.subY			; 85 13
B7_144e:		lda #$d9		; a9 d9
B7_1450:		jmp $8a57		; 4c 57 8a


B7_1453:		lda #$2b		; a9 2b
B7_1455:		jsr $ac90		; 20 90 ac
B7_1458:		jsr $819f		; 20 9f 81
B7_145b:		lda $19			; a5 19
B7_145d:		bit $1f			; 24 1f
B7_145f:		bpl B7_1465 ; 10 04

B7_1461:		ora #$02		; 09 02
B7_1463:		bne B7_1467 ; d0 02

B7_1465:		and #$fd		; 29 fd
B7_1467:		sta wCachedEntityStruct.byte9			; 85 19
B7_1469:		lda #$40		; a9 40
B7_146b:		sta wCachedEntityStruct.byteC			; 85 1c
B7_146d:		lda #$00		; a9 00
B7_146f:		sta $1f			; 85 1f
B7_1471:		lda #$de		; a9 de
B7_1473:		jmp $8a57		; 4c 57 8a


B7_1476:		lda #$2b		; a9 2b
B7_1478:		jsr $ac90		; 20 90 ac
B7_147b:		jsr $819f		; 20 9f 81
B7_147e:		lda #$00		; a9 00
B7_1480:		sta wCachedEntityStruct.byteA			; 85 1a
B7_1482:		lda #$01		; a9 01
B7_1484:		sta $1f			; 85 1f
B7_1486:		lda #$80		; a9 80
B7_1488:		sta wCachedEntityStruct.subY			; 85 13
B7_148a:		lda #$de		; a9 de
B7_148c:		jmp $8a57		; 4c 57 8a


B7_148f:		lda #$2a		; a9 2a
B7_1491:		jsr $ac90		; 20 90 ac
B7_1494:		jsr $819f		; 20 9f 81
B7_1497:		jsr $8a26		; 20 26 8a
B7_149a:		lda #$00		; a9 00
B7_149c:		sta wCachedEntityStruct.byteA			; 85 1a
B7_149e:		lda #$01		; a9 01
B7_14a0:		sta $1f			; 85 1f
B7_14a2:		lda #$dc		; a9 dc
B7_14a4:		jmp $8a57		; 4c 57 8a


B7_14a7:		ldx #$70		; a2 70
B7_14a9:		lda wEntityStructs.byte9.w, x	; bd 09 04
B7_14ac:		bne B7_14ef ; d0 41

B7_14ae:		jsr $ada4		; 20 a4 ad
B7_14b1:		lda wEntityStructs.byte9.w, x	; bd 09 04
B7_14b4:		and #$02		; 29 02
B7_14b6:		bne B7_14c5 ; d0 0d

B7_14b8:		lda wEntityStructs.tileX.w, x	; bd 00 04
B7_14bb:		clc				; 18 
B7_14bc:		adc #$01		; 69 01
B7_14be:		sta wEntityStructs.tileX.w, x	; 9d 00 04
B7_14c1:		lda #$10		; a9 10
B7_14c3:		bne B7_14d0 ; d0 0b

B7_14c5:		lda wEntityStructs.tileX.w, x	; bd 00 04
B7_14c8:		sec				; 38 
B7_14c9:		sbc #$01		; e9 01
B7_14cb:		sta wEntityStructs.tileX.w, x	; 9d 00 04
B7_14ce:		lda #$f0		; a9 f0
B7_14d0:		sta wEntityStructs.byte4.w, x	; 9d 04 04
B7_14d3:		lda #$55		; a9 55
B7_14d5:		sta wEntityStructs.id.w, x	; 9d 08 04
B7_14d8:		lda #$00		; a9 00
B7_14da:		sta wEntityStructs.subID.w, x	; 9d 0f 04
B7_14dd:		txa				; 8a 
B7_14de:		lsr a			; 4a
B7_14df:		lsr a			; 4a
B7_14e0:		lsr a			; 4a
B7_14e1:		lsr a			; 4a
B7_14e2:		and #$07		; 29 07
B7_14e4:		tay				; a8 
B7_14e5:		lda #$ff		; a9 ff
B7_14e7:	.db $99 $f0 $00
B7_14ea:		lda #$9d		; a9 9d
B7_14ec:		jmp $8a57		; 4c 57 8a


B7_14ef:		rts				; 60 


B7_14f0:		lda #$6c		; a9 6c
B7_14f2:		jsr $ac90		; 20 90 ac
B7_14f5:		jsr $819f		; 20 9f 81
B7_14f8:		jsr $8a26		; 20 26 8a
B7_14fb:		lda wCachedEntityStruct.subID			; a5 1f
B7_14fd:		bpl B7_150b ; 10 0c

B7_14ff:		and #$80		; 29 80
B7_1501:		sta wCachedEntityStruct.byteA			; 85 1a
B7_1503:		lda #$04		; a9 04
B7_1505:		sta wCachedEntityStruct.byteB			; 85 1b
B7_1507:		lda #$18		; a9 18
B7_1509:		bne B7_1511 ; d0 06

B7_150b:		and #$80		; 29 80
B7_150d:		sta wCachedEntityStruct.byteA			; 85 1a
B7_150f:		lda #$00		; a9 00
B7_1511:		sta wCachedEntityStruct.byteD			; 85 1d
B7_1513:		lda #$00		; a9 00
B7_1515:		sta wCachedEntityStruct.byte4			; 85 14
B7_1517:		sta wCachedEntityStruct.byte5			; 85 15
B7_1519:		sta $1f			; 85 1f
B7_151b:		lda #$db		; a9 db
B7_151d:		jmp $8a57		; 4c 57 8a


B7_1520:		lda #$69		; a9 69
B7_1522:		jsr $ac90		; 20 90 ac
B7_1525:		jsr $819f		; 20 9f 81
B7_1528:		jsr $8a26		; 20 26 8a
B7_152b:		lda #$02		; a9 02
B7_152d:		sta wCachedEntityStruct.byteB			; 85 1b
B7_152f:		lda #$10		; a9 10
B7_1531:		jsr $8214		; 20 14 82
B7_1534:		lda #$00		; a9 00
B7_1536:		sta wCachedEntityStruct.byte5			; 85 15
B7_1538:		lda #$10		; a9 10
B7_153a:		sta wCachedEntityStruct.byteD			; 85 1d
B7_153c:		lda #$00		; a9 00
B7_153e:		sta $1f			; 85 1f
B7_1540:		lda #$df		; a9 df
B7_1542:		jmp $8a57		; 4c 57 8a


B7_1545:		lda #$68		; a9 68
B7_1547:		jsr $ac90		; 20 90 ac
B7_154a:		jsr $819f		; 20 9f 81
B7_154d:		jsr $8a26		; 20 26 8a
B7_1550:		lda #$08		; a9 08
B7_1552:		jsr $8214		; 20 14 82
B7_1555:		lda #$02		; a9 02
B7_1557:		sta wCachedEntityStruct.byteB			; 85 1b
B7_1559:		lda #$00		; a9 00
B7_155b:		sta $1f			; 85 1f
B7_155d:		lda #$e0		; a9 e0
B7_155f:		jmp $8a57		; 4c 57 8a


B7_1562:		lda #$66		; a9 66
B7_1564:		jsr $ac90		; 20 90 ac
B7_1567:		jsr $819f		; 20 9f 81
B7_156a:		jsr $8a26		; 20 26 8a
B7_156d:		lda #$10		; a9 10
B7_156f:		jsr $8214		; 20 14 82
B7_1572:		lda #$00		; a9 00
B7_1574:		sta $1f			; 85 1f
B7_1576:		lda #$d6		; a9 d6
B7_1578:		jmp $8a57		; 4c 57 8a


enUpdate_freeonFight_2:
B7_157b:		jmp enUpdate_friendFight		; 4c 31 8f

enUpdate_fight01:
B7_157e:		jmp enUpdate_friendFight		; 4c 31 8f

enUpdate_fight02:
B7_1581:		jmp enUpdate_friendFight		; 4c 31 8f

enUpdate_fight03:
B7_1584:		jsr $81c2		; 20 c2 81
B7_1587:		lda #$03		; a9 03
B7_1589:		sta $2a			; 85 2a
B7_158b:		lda #$56		; a9 56
B7_158d:		jsr checkGlobalFlag		; 20 e9 e7
B7_1590:		beq B7_1593 ; f0 01

B7_1592:		rts				; 60 


B7_1593:		bit $1a			; 24 1a
B7_1595:		bmi B7_15a2 ; 30 0b

B7_1597:		bvs B7_15d8 ; 70 3f

B7_1599:		lda $1a			; a5 1a
B7_159b:		and #$20		; 29 20
B7_159d:		bne B7_15db ; d0 3c

B7_159f:		jmp B7_15de		; 4c de b5

B7_15a2:		lda $1c			; a5 1c
B7_15a4:		cmp #$a0		; c9 a0
B7_15a6:		beq B7_15c8 ; f0 20

B7_15a8:		dec $1c			; c6 1c
B7_15aa:		bne B7_15b5 ; d0 09

B7_15ac:		lda #$00		; a9 00
B7_15ae:		sta wCachedEntityStruct.byteA			; 85 1a
B7_15b0:		lda #$5d		; a9 5d
B7_15b2:		jsr unsetGlobalFlag		; 20 fc e7
B7_15b5:		lda $1c			; a5 1c
B7_15b7:		cmp #$50		; c9 50
B7_15b9:		bcs B7_15c7 ; b0 0c

B7_15bb:		lda $015a		; ad 5a 01
B7_15be:		and #$01		; 29 01
B7_15c0:		bne B7_15c7 ; d0 05

B7_15c2:		lda #$76		; a9 76
B7_15c4:		jmp updateEntity_wOam		; 4c 67 f5


B7_15c7:		rts				; 60 


B7_15c8:		dec $1c			; c6 1c
B7_15ca:		lda #$80		; a9 80
B7_15cc:		ldx #$04		; a2 04
B7_15ce:		jsr $8819		; 20 19 88
B7_15d1:		lda #$8f		; a9 8f
B7_15d3:		ldx #$04		; a2 04
B7_15d5:		jmp $8819		; 4c 19 88


B7_15d8:		jmp $8e5a		; 4c 5a 8e


B7_15db:		jmp $8e9c		; 4c 9c 8e


B7_15de:		jmp $8d3e		; 4c 3e 8d


enUpdate_fight04:
B7_15e1:		jsr $81c2		; 20 c2 81
B7_15e4:		lda #$03		; a9 03
B7_15e6:		sta $2a			; 85 2a
B7_15e8:		lda #$56		; a9 56
B7_15ea:		jsr checkGlobalFlag		; 20 e9 e7
B7_15ed:		beq B7_15f0 ; f0 01

B7_15ef:		rts				; 60 

B7_15f0:		bit $1a			; 24 1a
B7_15f2:		bmi B7_1602 ; 30 0e

B7_15f4:		bvs B7_164b ; 70 55

B7_15f6:		lda $1a			; a5 1a
B7_15f8:		and #$20		; 29 20
B7_15fa:		beq B7_15ff ; f0 03

B7_15fc:		jmp B7_164e		; 4c 4e b6

B7_15ff:		jmp B7_1651		; 4c 51 b6

B7_1602:		lda $1c			; a5 1c
B7_1604:		cmp #$a0		; c9 a0
B7_1606:		beq B7_162d ; f0 25

B7_1608:		dec $1c			; c6 1c
B7_160a:		bne B7_161a ; d0 0e

B7_160c:		lda #$00		; a9 00
B7_160e:		sta wCachedEntityStruct.byteA			; 85 1a
B7_1610:		lda #$5d		; a9 5d
B7_1612:		jsr unsetGlobalFlag		; 20 fc e7
B7_1615:		lda #$b5		; a9 b5
B7_1617:		jmp updateEntity_wOam		; 4c 67 f5

B7_161a:		lda $1c			; a5 1c
B7_161c:		cmp #$50		; c9 50
B7_161e:		bcs B7_162c ; b0 0c

B7_1620:		lda $015a		; ad 5a 01
B7_1623:		and #$01		; 29 01
B7_1625:		bne B7_162c ; d0 05

B7_1627:		lda #$b5		; a9 b5
B7_1629:		jmp updateEntity_wOam		; 4c 67 f5

B7_162c:		rts				; 60 

B7_162d:		dec $1c			; c6 1c
B7_162f:		lda #$80		; a9 80
B7_1631:		ldx #$05		; a2 05
B7_1633:		jsr $8819		; 20 19 88
B7_1636:		lda #$81		; a9 81
B7_1638:		ldx #$05		; a2 05
B7_163a:		jsr $8819		; 20 19 88
B7_163d:		lda #$8e		; a9 8e
B7_163f:		ldx #$05		; a2 05
B7_1641:		jsr $8819		; 20 19 88
B7_1644:		lda #$8f		; a9 8f
B7_1646:		ldx #$05		; a2 05
B7_1648:		jmp $8819		; 4c 19 88

B7_164b:		jmp $8e5a		; 4c 5a 8e

B7_164e:		jmp $8e9c		; 4c 9c 8e

B7_1651:		lda $1a			; a5 1a
B7_1653:		and #$03		; 29 03
B7_1655:		beq B7_1686 ; f0 2f

B7_1657:		and #$01		; 29 01
B7_1659:		bne B7_166b ; d0 10

B7_165b:		dec $1c			; c6 1c
B7_165d:		bne B7_1668 ; d0 09

B7_165f:		lda $1a			; a5 1a
B7_1661:		and #$fd		; 29 fd
B7_1663:		sta wCachedEntityStruct.byteA			; 85 1a
B7_1665:		jmp B7_1686		; 4c 86 b6

B7_1668:		jmp B7_16b8		; 4c b8 b6

B7_166b:		dec $1c			; c6 1c
B7_166d:		bne B7_1678 ; d0 09

B7_166f:		lda $1a			; a5 1a
B7_1671:		and #$fe		; 29 fe
B7_1673:		sta wCachedEntityStruct.byteA			; 85 1a
B7_1675:		jmp B7_1686		; 4c 86 b6

B7_1678:		lda $1c			; a5 1c
B7_167a:		cmp #$20		; c9 20
B7_167c:		bne B7_1683 ; d0 05

B7_167e:		lda #$26		; a9 26
B7_1680:		jsr $8033		; 20 33 80
B7_1683:		jmp B7_16b8		; 4c b8 b6

B7_1686:		lda $015a		; ad 5a 01
B7_1689:		bne B7_1690 ; d0 05

B7_168b:		lda #$07		; a9 07
B7_168d:		jsr $8033		; 20 33 80
B7_1690:		lda $0506		; ad 06 05
B7_1693:		sta $00			; 85 00
B7_1695:		lda $0507		; ad 07 05
B7_1698:		sta $01			; 85 01
B7_169a:		jsr $823c		; 20 3c 82
B7_169d:		ldy #$00		; a0 00
B7_169f:		sty $01			; 84 01
B7_16a1:		jsr $8604		; 20 04 86
B7_16a4:		lda $01			; a5 01
B7_16a6:		sta wCachedEntityStruct.byte4			; 85 14
B7_16a8:		lda $02			; a5 02
B7_16aa:		sta wCachedEntityStruct.byte5			; 85 15
B7_16ac:		jsr $89ce		; 20 ce 89
B7_16af:		lda $00			; a5 00
B7_16b1:		cmp #$08		; c9 08
B7_16b3:		bcc B7_16b8 ; 90 03

B7_16b5:		jsr $8a12		; 20 12 8a
B7_16b8:		ldx #$08		; a2 08
B7_16ba:		lda #$80		; a9 80
B7_16bc:		jsr func_13ef		; 20 ef f3
B7_16bf:		lda $1a			; a5 1a
B7_16c1:		and #$03		; 29 03
B7_16c3:		bne B7_171a ; d0 55

B7_16c5:		lda #$09		; a9 09
B7_16c7:		jsr func_1888		; 20 88 f8
B7_16ca:		lda #$09		; a9 09
B7_16cc:		jsr func_1aac		; 20 ac fa
B7_16cf:		bcs B7_16e8 ; b0 17

B7_16d1:		lda $1a			; a5 1a
B7_16d3:		ora #$01		; 09 01
B7_16d5:		sta wCachedEntityStruct.byteA			; 85 1a
B7_16d7:		lda #$00		; a9 00
B7_16d9:		sta wCachedEntityStruct.byte4			; 85 14
B7_16db:		lda #$08		; a9 08
B7_16dd:		sta wCachedEntityStruct.byte5			; 85 15
B7_16df:		inc $1f			; e6 1f
B7_16e1:		lda #$40		; a9 40
B7_16e3:		sta wCachedEntityStruct.byteC			; 85 1c
B7_16e5:		jmp B7_171a		; 4c 1a b7

B7_16e8:		lda #$09		; a9 09
B7_16ea:		jsr func_1745		; 20 45 f7
B7_16ed:		bcc B7_171a ; 90 2b

B7_16ef:		lda $1a			; a5 1a
B7_16f1:		ora #$02		; 09 02
B7_16f3:		sta wCachedEntityStruct.byteA			; 85 1a
B7_16f5:		lda #$00		; a9 00
B7_16f7:		sta wCachedEntityStruct.byte4			; 85 14
B7_16f9:		lda #$08		; a9 08
B7_16fb:		sta wCachedEntityStruct.byte5			; 85 15
B7_16fd:		lda #$40		; a9 40
B7_16ff:		sta wCachedEntityStruct.byteC			; 85 1c
B7_1701:		lda wCachedEntityStruct.subID			; a5 1f
B7_1703:		bpl B7_171a ; 10 15

B7_1705:		lda #$40		; a9 40
B7_1707:		sta wCachedEntityStruct.byteA			; 85 1a
B7_1709:		lda #$d3		; a9 d3
B7_170b:		sta wCachedEntityStruct.byteB			; 85 1b
B7_170d:		lda #$d7		; a9 d7
B7_170f:		sta wCachedEntityStruct.byteC			; 85 1c
B7_1711:		lda #$db		; a9 db
B7_1713:		sta wCachedEntityStruct.byteD			; 85 1d
B7_1715:		lda #$5d		; a9 5d
B7_1717:		jmp setGlobalFlag		; 4c f0 e7

B7_171a:		lda $1a			; a5 1a
B7_171c:		and #$03		; 29 03
B7_171e:		bne B7_172f ; d0 0f

B7_1720:		lda $015a		; ad 5a 01
B7_1723:		and #$18		; 29 18
B7_1725:		lsr a			; 4a
B7_1726:		lsr a			; 4a
B7_1727:		lsr a			; 4a
B7_1728:		tay				; a8 
B7_1729:		lda data_7_1744.w, y	; b9 44 b7
B7_172c:		jmp updateEntity_wOam		; 4c 67 f5

B7_172f:		ldy #$00		; a0 00
B7_1731:		and #$02		; 29 02
B7_1733:		beq B7_173d ; f0 08

B7_1735:		iny				; c8 
B7_1736:		lda $015a		; ad 5a 01
B7_1739:		and #$01		; 29 01
B7_173b:		bne B7_1743 ; d0 06

B7_173d:		lda $b748, y	; b9 48 b7
B7_1740:		jmp updateEntity_wOam		; 4c 67 f5

B7_1743:		rts				; 60 

data_7_1744:
B7_1744:		ldy $b5, x		; b4 b5
B7_1746:	.db $b7
B7_1747:		lda $b6, x		; b5 b6
B7_1749:		clv				; b8 


enUpdate_fight05:
B7_174a:		jsr $81c2		; 20 c2 81
B7_174d:		lda #$03		; a9 03
B7_174f:		sta $2a			; 85 2a
B7_1751:		lda #$56		; a9 56
B7_1753:		jsr checkGlobalFlag		; 20 e9 e7
B7_1756:		beq B7_1759 ; f0 01

B7_1758:		rts				; 60 


B7_1759:		bit $1a			; 24 1a
B7_175b:		bmi B7_176b ; 30 0e

B7_175d:		bvs B7_17af ; 70 50

B7_175f:		lda $1a			; a5 1a
B7_1761:		and #$20		; 29 20
B7_1763:		beq B7_1768 ; f0 03

B7_1765:		jmp $b7b2		; 4c b2 b7


B7_1768:		jmp $b7b5		; 4c b5 b7


B7_176b:		lda $1c			; a5 1c
B7_176d:		cmp #$a0		; c9 a0
B7_176f:		beq B7_1791 ; f0 20

B7_1771:		dec $1c			; c6 1c
B7_1773:		bne B7_177e ; d0 09

B7_1775:		lda #$00		; a9 00
B7_1777:		sta wCachedEntityStruct.byteA			; 85 1a
B7_1779:		lda #$5d		; a9 5d
B7_177b:		jsr unsetGlobalFlag		; 20 fc e7
B7_177e:		lda $1c			; a5 1c
B7_1780:		cmp #$50		; c9 50
B7_1782:		bcs B7_1790 ; b0 0c

B7_1784:		lda $015a		; ad 5a 01
B7_1787:		and #$01		; 29 01
B7_1789:		bne B7_1790 ; d0 05

B7_178b:		lda #$ba		; a9 ba
B7_178d:		jmp updateEntity_wOam		; 4c 67 f5


B7_1790:		rts				; 60 


B7_1791:		dec $1c			; c6 1c
B7_1793:		lda #$a0		; a9 a0
B7_1795:		ldx #$02		; a2 02
B7_1797:		jsr $8819		; 20 19 88
B7_179a:		lda #$a1		; a9 a1
B7_179c:		ldx #$02		; a2 02
B7_179e:		jsr $8819		; 20 19 88
B7_17a1:		lda #$8e		; a9 8e
B7_17a3:		ldx #$04		; a2 04
B7_17a5:		jsr $8819		; 20 19 88
B7_17a8:		lda #$8f		; a9 8f
B7_17aa:		ldx #$04		; a2 04
B7_17ac:		jmp $8819		; 4c 19 88


B7_17af:		jmp $8e5a		; 4c 5a 8e


B7_17b2:		jmp $8e9c		; 4c 9c 8e


B7_17b5:		jmp $8d3e		; 4c 3e 8d


enUpdate_fight06:
B7_17b8:		jsr $81c2		; 20 c2 81
B7_17bb:		lda #$03		; a9 03
B7_17bd:		sta $2a			; 85 2a
B7_17bf:		lda #$56		; a9 56
B7_17c1:		jsr checkGlobalFlag		; 20 e9 e7
B7_17c4:		beq B7_17c7 ; f0 01

B7_17c6:		rts				; 60 


B7_17c7:		bit $1a			; 24 1a
B7_17c9:		bmi B7_17d9 ; 30 0e

B7_17cb:		bvs B7_1833 ; 70 66

B7_17cd:		lda $1a			; a5 1a
B7_17cf:		and #$20		; 29 20
B7_17d1:		beq B7_17d6 ; f0 03

B7_17d3:		jmp $b836		; 4c 36 b8


B7_17d6:		jmp $b839		; 4c 39 b8


B7_17d9:		lda $1c			; a5 1c
B7_17db:		cmp #$a0		; c9 a0
B7_17dd:		beq B7_180a ; f0 2b

B7_17df:		dec $1c			; c6 1c
B7_17e1:		bne B7_17f7 ; d0 14

B7_17e3:		lda #$02		; a9 02
B7_17e5:		sta wCachedEntityStruct.byteA			; 85 1a
B7_17e7:		lda #$5d		; a9 5d
B7_17e9:		jsr unsetGlobalFlag		; 20 fc e7
B7_17ec:		lda #$00		; a9 00
B7_17ee:		sta wCachedEntityStruct.byte4			; 85 14
B7_17f0:		ldy $1f			; a4 1f
B7_17f2:		lda $b8d7, y	; b9 d7 b8
B7_17f5:		sta wCachedEntityStruct.byte5			; 85 15
B7_17f7:		lda $1c			; a5 1c
B7_17f9:		cmp #$50		; c9 50
B7_17fb:		bcs B7_1809 ; b0 0c

B7_17fd:		lda $015a		; ad 5a 01
B7_1800:		and #$01		; 29 01
B7_1802:		bne B7_1809 ; d0 05

B7_1804:		lda #$a4		; a9 a4
B7_1806:		jmp updateEntity_wOam		; 4c 67 f5


B7_1809:		rts				; 60 


B7_180a:		lda wEntityWramOffset.w		; ad 5b 01
B7_180d:		sta $017e		; 8d 7e 01
B7_1810:		lda #$3e		; a9 3e
B7_1812:		jsr $8033		; 20 33 80
B7_1815:		dec $1c			; c6 1c
B7_1817:		lda #$20		; a9 20
B7_1819:		ldx #$04		; a2 04
B7_181b:		jsr $8819		; 20 19 88
B7_181e:		lda #$21		; a9 21
B7_1820:		ldx #$04		; a2 04
B7_1822:		jsr $8819		; 20 19 88
B7_1825:		lda #$ae		; a9 ae
B7_1827:		ldx #$03		; a2 03
B7_1829:		jsr $8819		; 20 19 88
B7_182c:		lda #$af		; a9 af
B7_182e:		ldx #$03		; a2 03
B7_1830:		jmp $8819		; 4c 19 88


B7_1833:		jmp $8e5a		; 4c 5a 8e


B7_1836:		jmp $8e9c		; 4c 9c 8e


B7_1839:		lda #$00		; a9 00
B7_183b:		jsr func_13ef		; 20 ef f3
B7_183e:		lda $1a			; a5 1a
B7_1840:		and #$01		; 29 01
B7_1842:		beq B7_185a ; f0 16

B7_1844:		lda $17			; a5 17
B7_1846:		cmp #$5d		; c9 5d
B7_1848:		bcc B7_1857 ; 90 0d

B7_184a:		lda $1a			; a5 1a
B7_184c:		and #$fe		; 29 fe
B7_184e:		sta wCachedEntityStruct.byteA			; 85 1a
B7_1850:		ldy $1f			; a4 1f
B7_1852:		lda $b8d2, y	; b9 d2 b8
B7_1855:		sta wCachedEntityStruct.byte5			; 85 15
B7_1857:		jmp $b8bb		; 4c bb b8


B7_185a:		ldy $1f			; a4 1f
B7_185c:		lda $17			; a5 17
B7_185e:		cmp #$40		; c9 40
B7_1860:		bcs B7_1871 ; b0 0f

B7_1862:		bit $15			; 24 15
B7_1864:		bpl B7_186d ; 10 07

B7_1866:		ldy $1f			; a4 1f
B7_1868:		lda $b8d7, y	; b9 d7 b8
B7_186b:		sta wCachedEntityStruct.byte5			; 85 15
B7_186d:		lda #$40		; a9 40
B7_186f:		bne B7_1885 ; d0 14

B7_1871:		cmp #$5d		; c9 5d
B7_1873:		bcc B7_1887 ; 90 12

B7_1875:		bit $15			; 24 15
B7_1877:		bmi B7_1883 ; 30 0a

B7_1879:		jsr $8a12		; 20 12 8a
B7_187c:		ldy $1f			; a4 1f
B7_187e:		lda $b8d2, y	; b9 d2 b8
B7_1881:		sta wCachedEntityStruct.byte5			; 85 15
B7_1883:		lda #$5d		; a9 5d
B7_1885:		sta $17			; 85 17
B7_1887:		lda #$07		; a9 07
B7_1889:		jsr func_1888		; 20 88 f8
B7_188c:		lda #$07		; a9 07
B7_188e:		jsr func_1745		; 20 45 f7
B7_1891:		bcc B7_18bb ; 90 28

B7_1893:		lda #$37		; a9 37
B7_1895:		jsr func_08fa		; 20 fa e8
B7_1898:		lda wCachedEntityStruct.subID			; a5 1f
B7_189a:		bpl B7_18b1 ; 10 15

B7_189c:		lda #$40		; a9 40
B7_189e:		sta wCachedEntityStruct.byteA			; 85 1a
B7_18a0:		lda #$d3		; a9 d3
B7_18a2:		sta wCachedEntityStruct.byteB			; 85 1b
B7_18a4:		lda #$d7		; a9 d7
B7_18a6:		sta wCachedEntityStruct.byteC			; 85 1c
B7_18a8:		lda #$db		; a9 db
B7_18aa:		sta wCachedEntityStruct.byteD			; 85 1d
B7_18ac:		lda #$5d		; a9 5d
B7_18ae:		jmp setGlobalFlag		; 4c f0 e7


B7_18b1:		lda $1a			; a5 1a
B7_18b3:		ora #$01		; 09 01
B7_18b5:		sta wCachedEntityStruct.byteA			; 85 1a
B7_18b7:		lda #$04		; a9 04
B7_18b9:		sta wCachedEntityStruct.byte5			; 85 15
B7_18bb:		lda $1a			; a5 1a
B7_18bd:		and #$01		; 29 01
B7_18bf:		tay				; a8 
B7_18c0:		beq B7_18c9 ; f0 07

B7_18c2:		lda $015a		; ad 5a 01
B7_18c5:		and #$01		; 29 01
B7_18c7:		bne B7_18cf ; d0 06

B7_18c9:		lda $b8d0, y	; b9 d0 b8
B7_18cc:		jmp updateEntity_wOam		; 4c 67 f5


B7_18cf:		rts				; 60 


B7_18d0:		ldy $cc			; a4 cc
B7_18d2:	.db $f4
B7_18d3:		sed				; f8 
B7_18d4:		sed				; f8 
B7_18d5:	.db $fc
B7_18d6:	.db $fc
B7_18d7:		bpl B7_18e5 ; 10 0c

B7_18d9:	.db $0c
B7_18da:		php				; 08 
B7_18db:		php				; 08 

enUpdate_fight07:
B7_18dc:		jsr $81c2		; 20 c2 81
B7_18df:		lda #$03		; a9 03
B7_18e1:		sta $2a			; 85 2a
B7_18e3:		bit $1a			; 24 1a
B7_18e5:		bmi B7_1907 ; 30 20

B7_18e7:		bvs B7_1922 ; 70 39

B7_18e9:		ldx $017e		; ae 7e 01
B7_18ec:		lda wEntityStructs.byteA.w, x	; bd 0a 04
B7_18ef:		and #$40		; 29 40
B7_18f1:		beq B7_1904 ; f0 11

B7_18f3:		lda #$40		; a9 40
B7_18f5:		sta wCachedEntityStruct.byteA			; 85 1a
B7_18f7:		lda #$d3		; a9 d3
B7_18f9:		sta wCachedEntityStruct.byteB			; 85 1b
B7_18fb:		lda #$d7		; a9 d7
B7_18fd:		sta wCachedEntityStruct.byteC			; 85 1c
B7_18ff:		lda #$db		; a9 db
B7_1901:		sta wCachedEntityStruct.byteD			; 85 1d
B7_1903:		rts				; 60 


B7_1904:		jmp $b943		; 4c 43 b9


B7_1907:		dec $1c			; c6 1c
B7_1909:		bne B7_190f ; d0 04

B7_190b:		lda #$00		; a9 00
B7_190d:		sta wCachedEntityStruct.byteA			; 85 1a
B7_190f:		lda $1c			; a5 1c
B7_1911:		cmp #$50		; c9 50
B7_1913:		bcs B7_1921 ; b0 0c

B7_1915:		lda $015a		; ad 5a 01
B7_1918:		and #$01		; 29 01
B7_191a:		bne B7_1921 ; d0 05

B7_191c:		lda #$a2		; a9 a2
B7_191e:		jmp updateEntity_wOam		; 4c 67 f5


B7_1921:		rts				; 60 


B7_1922:		jsr $8c91		; 20 91 8c
B7_1925:		bcs B7_192c ; b0 05

B7_1927:		lda #$00		; a9 00
B7_1929:		sta wCachedEntityStruct.byte9			; 85 19
B7_192b:		rts				; 60 


B7_192c:		lda $1d			; a5 1d
B7_192e:		cmp #$40		; c9 40
B7_1930:		bcc B7_1942 ; 90 10

B7_1932:		lda $015a		; ad 5a 01
B7_1935:		and #$01		; 29 01
B7_1937:		bne B7_1942 ; d0 09

B7_1939:		lda #$03		; a9 03
B7_193b:		sta $2a			; 85 2a
B7_193d:		lda #$a3		; a9 a3
B7_193f:		jmp updateEntity_wOam		; 4c 67 f5


B7_1942:		rts				; 60 


B7_1943:		ldx #$10		; a2 10
B7_1945:		lda #$80		; a9 80
B7_1947:		jsr func_13ef		; 20 ef f3
B7_194a:		lda $16			; a5 16
B7_194c:		and #$fc		; 29 fc
B7_194e:		sta $00			; 85 00
B7_1950:		lda $17			; a5 17
B7_1952:		and #$fc		; 29 fc
B7_1954:		sta $01			; 85 01
B7_1956:		lda $1b			; a5 1b
B7_1958:		and #$03		; 29 03
B7_195a:		asl a			; 0a
B7_195b:		tay				; a8 
B7_195c:		and #$02		; 29 02
B7_195e:		bne B7_1969 ; d0 09

B7_1960:		lda $b9d4, y	; b9 d4 b9
B7_1963:		cmp $00			; c5 00
B7_1965:		bne B7_1980 ; d0 19

B7_1967:		beq B7_1971 ; f0 08

B7_1969:		iny				; c8 
B7_196a:		lda $b9d4, y	; b9 d4 b9
B7_196d:		cmp $17			; c5 17
B7_196f:		bne B7_1980 ; d0 0f

B7_1971:		inc $1b			; e6 1b
B7_1973:		ldx $017e		; ae 7e 01
B7_1976:		lda wEntityStructs.subID.w, x	; bd 0f 04
B7_1979:		tay				; a8 
B7_197a:		lda $b9dc, y	; b9 dc b9
B7_197d:		jsr $b9e3		; 20 e3 b9
B7_1980:		lda $1a			; a5 1a
B7_1982:		and #$01		; 29 01
B7_1984:		beq B7_19a1 ; f0 1b

B7_1986:		dec $1c			; c6 1c
B7_1988:		bne B7_1993 ; d0 09

B7_198a:		lda $1a			; a5 1a
B7_198c:		and #$fe		; 29 fe
B7_198e:		sta wCachedEntityStruct.byteA			; 85 1a
B7_1990:		jmp $b9a1		; 4c a1 b9


B7_1993:		lda $1c			; a5 1c
B7_1995:		cmp #$20		; c9 20
B7_1997:		bne B7_199e ; d0 05

B7_1999:		lda #$26		; a9 26
B7_199b:		jsr $8033		; 20 33 80
B7_199e:		jmp $b9c5		; 4c c5 b9


B7_19a1:		jsr $89ce		; 20 ce 89
B7_19a4:		lda $00			; a5 00
B7_19a6:		cmp #$08		; c9 08
B7_19a8:		bcc B7_19ad ; 90 03

B7_19aa:		jsr $8a12		; 20 12 8a
B7_19ad:		lda #$08		; a9 08
B7_19af:		jsr func_1888		; 20 88 f8
B7_19b2:		lda #$08		; a9 08
B7_19b4:		jsr func_1aac		; 20 ac fa
B7_19b7:		bcs B7_19c5 ; b0 0c

B7_19b9:		inc $1f			; e6 1f
B7_19bb:		lda $1a			; a5 1a
B7_19bd:		ora #$01		; 09 01
B7_19bf:		sta wCachedEntityStruct.byteA			; 85 1a
B7_19c1:		lda #$40		; a9 40
B7_19c3:		sta wCachedEntityStruct.byteC			; 85 1c
B7_19c5:		ldy #$00		; a0 00
B7_19c7:		lda $1a			; a5 1a
B7_19c9:		and #$01		; 29 01
B7_19cb:		beq B7_19ce ; f0 01

B7_19cd:		iny				; c8 
B7_19ce:		lda $b9e1, y	; b9 e1 b9
B7_19d1:		jmp updateEntity_wOam		; 4c 67 f5


B7_19d4:		;removed
	.db $30 $30

B7_19d6:		;removed
	.db $30 $c0

B7_19d8:		;removed
	.db $d0 $c0

B7_19da:		bne B7_1a0c ; d0 30

B7_19dc:		sec				; 38 
B7_19dd:	.db $34
B7_19de:		bmi B7_1a0c ; 30 2c

B7_19e0:		plp				; 28 
B7_19e1:		ldx #$a3		; a2 a3
B7_19e3:		sta $00			; 85 00
B7_19e5:		lda $1b			; a5 1b
B7_19e7:		and #$03		; 29 03
B7_19e9:		beq B7_19f1 ; f0 06

B7_19eb:		cmp #$03		; c9 03
B7_19ed:		beq B7_19f1 ; f0 02

B7_19ef:		bne B7_19f9 ; d0 08

B7_19f1:		lda $00			; a5 00
B7_19f3:		eor #$ff		; 49 ff
B7_19f5:		sta $00			; 85 00
B7_19f7:		inc $00			; e6 00
B7_19f9:		lda $1b			; a5 1b
B7_19fb:		and #$01		; 29 01
B7_19fd:		bne B7_1a08 ; d0 09

B7_19ff:		lda $00			; a5 00
B7_1a01:		sta wCachedEntityStruct.byte4			; 85 14
B7_1a03:		lda #$00		; a9 00
B7_1a05:		sta wCachedEntityStruct.byte5			; 85 15
B7_1a07:		rts				; 60 


B7_1a08:		lda #$00		; a9 00
B7_1a0a:		sta wCachedEntityStruct.byte4			; 85 14
B7_1a0c:		lda $00			; a5 00
B7_1a0e:		sta wCachedEntityStruct.byte5			; 85 15
B7_1a10:		rts				; 60 


enUpdate_fight08:
B7_1a11:		jsr $81c2		; 20 c2 81
B7_1a14:		lda $16			; a5 16
B7_1a16:		sec				; 38 
B7_1a17:		sbc #$a8		; e9 a8
B7_1a19:		eor #$ff		; 49 ff
B7_1a1b:		clc				; 18 
B7_1a1c:		adc #$01		; 69 01
B7_1a1e:		sta $fd			; 85 fd
B7_1a20:		lda $17			; a5 17
B7_1a22:		sec				; 38 
B7_1a23:		sbc #$e8		; e9 e8
B7_1a25:		eor #$ff		; 49 ff
B7_1a27:		clc				; 18 
B7_1a28:		adc #$01		; 69 01
B7_1a2a:		sta $fc			; 85 fc
B7_1a2c:		lda #$20		; a9 20
B7_1a2e:		bit $1a			; 24 1a
B7_1a30:		bmi B7_1a39 ; 30 07

B7_1a32:		bvs B7_1a75 ; 70 41

B7_1a34:		bne B7_1aa3 ; d0 6d

B7_1a36:		jmp $bac0		; 4c c0 ba


B7_1a39:		dec $1e			; c6 1e
B7_1a3b:		dec $1e			; c6 1e
B7_1a3d:		bne B7_1a6c ; d0 2d

B7_1a3f:		jsr loadFollowingDataIntoInternalPalettes2BG		; 20 c9 e3
B7_1a42:	.db $0f
B7_1a43:		sec				; 38 
B7_1a44:		and #$19		; 29 19
B7_1a46:		sec				; 38 
B7_1a47:		rol $16			; 26 16
B7_1a49:	.db $20 $10 $00
B7_1a4c:	.db $20 $10 $00
B7_1a4f:		jsr $e40c		; 20 0c e4
B7_1a52:		;removed
	.db $30 $10

B7_1a54:	.db $0f
B7_1a55:		;removed
	.db $30 $25

B7_1a57:		ora $38, x		; 15 38
B7_1a59:		and #$0f		; 29 0f
B7_1a5b:		;removed
	.db $30 $10

B7_1a5d:	.db $0f
B7_1a5e:		lda #$e5		; a9 e5
B7_1a60:		sta wBitmapOfPalettesToFadeOut.w		; 8d 5f 01
B7_1a63:		lda #$10		; a9 10
B7_1a65:		jsr $e5d0		; 20 d0 e5
B7_1a68:		lda #$00		; a9 00
B7_1a6a:		sta wCachedEntityStruct.byteA			; 85 1a
B7_1a6c:		lda $19			; a5 19
B7_1a6e:		and #$fd		; 29 fd
B7_1a70:		sta wCachedEntityStruct.byte9			; 85 19
B7_1a72:		jmp $badc		; 4c dc ba


B7_1a75:		lda #$02		; a9 02
B7_1a77:		sta wCachedEntityStruct.byte5			; 85 15
B7_1a79:		lda #$00		; a9 00
B7_1a7b:		jsr func_13ef		; 20 ef f3
B7_1a7e:		lda #$31		; a9 31
B7_1a80:		sta wShadow1KBChrBank3.w		; 8d 6e 01
B7_1a83:		lda #$ef		; a9 ef
B7_1a85:		jsr updateEntity_wOam		; 20 67 f5
B7_1a88:		lda $015a		; ad 5a 01
B7_1a8b:		and #$1f		; 29 1f
B7_1a8d:		bne B7_1abf ; d0 30

B7_1a8f:		dec $1b			; c6 1b
B7_1a91:		lda $1b			; a5 1b
B7_1a93:		beq B7_1a9e ; f0 09

B7_1a95:		and #$07		; 29 07
B7_1a97:		sta $0f			; 85 0f
B7_1a99:		lda #$09		; a9 09
B7_1a9b:		jmp $8033		; 4c 33 80


B7_1a9e:		lda #$20		; a9 20
B7_1aa0:		sta wCachedEntityStruct.byteA			; 85 1a
B7_1aa2:		rts				; 60 


B7_1aa3:		lda #$e5		; a9 e5
B7_1aa5:		sta wBitmapOfPalettesToFadeOut.w		; 8d 5f 01
B7_1aa8:		lda #$10		; a9 10
B7_1aaa:		jsr $e57d		; 20 7d e5
B7_1aad:		lda #$07		; a9 07
B7_1aaf:		jsr func_08e5		; 20 e5 e8
B7_1ab2:		ldy #$02		; a0 02
B7_1ab4:		ldx #$d0		; a2 d0
B7_1ab6:		jsr func_0530		; 20 30 e5
B7_1ab9:		dey				; 88 
B7_1aba:		bpl B7_1ab4 ; 10 f8

B7_1abc:		jmp $e2b1		; 4c b1 e2


B7_1abf:		rts				; 60 


B7_1ac0:		lda $015a		; ad 5a 01
B7_1ac3:		and #$07		; 29 07
B7_1ac5:		bne B7_1aca ; d0 03

B7_1ac7:		jsr $89ed		; 20 ed 89
B7_1aca:		lda #$00		; a9 00
B7_1acc:		jsr func_13ef		; 20 ef f3
B7_1acf:		lda #$05		; a9 05
B7_1ad1:		jsr func_1b72		; 20 72 fb
B7_1ad4:		lda $1b			; a5 1b
B7_1ad6:		beq B7_1adc ; f0 04

B7_1ad8:		lda #$31		; a9 31
B7_1ada:		bne B7_1ade ; d0 02

B7_1adc:		lda #$30		; a9 30
B7_1ade:		sta wShadow1KBChrBank3.w		; 8d 6e 01
B7_1ae1:		lda #$ef		; a9 ef
B7_1ae3:		jsr updateEntity_wOam		; 20 67 f5
B7_1ae6:		lda $046a		; ad 6a 04
B7_1ae9:		beq B7_1b25 ; f0 3a

B7_1aeb:		lda $1b			; a5 1b
B7_1aed:		beq B7_1af4 ; f0 05

B7_1aef:		dec $1b			; c6 1b
B7_1af1:		jmp $bb20		; 4c 20 bb


B7_1af4:		lda #$04		; a9 04
B7_1af6:		jsr func_1745		; 20 45 f7
B7_1af9:		bcc B7_1b20 ; 90 25

B7_1afb:		lda wCachedEntityStruct.subID			; a5 1f
B7_1afd:		bpl B7_1b17 ; 10 18

B7_1aff:		lda #$10		; a9 10
B7_1b01:		sta $046a		; 8d 6a 04
B7_1b04:		lda #$18		; a9 18
B7_1b06:		sta wCachedEntityStruct.byteB			; 85 1b
B7_1b08:		lda #$02		; a9 02
B7_1b0a:		sta $81			; 85 81
B7_1b0c:		lda #$5d		; a9 5d
B7_1b0e:		jsr setGlobalFlag		; 20 f0 e7
B7_1b11:		lda #$40		; a9 40
B7_1b13:		sta wCachedEntityStruct.byteA			; 85 1a
B7_1b15:		bne B7_1b20 ; d0 09

B7_1b17:		lda #$40		; a9 40
B7_1b19:		sta wCachedEntityStruct.byteB			; 85 1b
B7_1b1b:		lda #$80		; a9 80
B7_1b1d:		sta $046a		; 8d 6a 04
B7_1b20:		lda #$f0		; a9 f0
B7_1b22:		jmp updateEntity_wOam		; 4c 67 f5


B7_1b25:		rts				; 60 

enUpdate_fight09:
B7_1b26:		lda #$7f		; a9 7f
B7_1b28:		sta $1f			; 85 1f
B7_1b2a:		jsr func_0709		; 20 09 e7
B7_1b2d:		lda $047a		; ad 7a 04
B7_1b30:		bpl B7_1b35 ; 10 03

B7_1b32:		jmp $bc6c		; 4c 6c bc


B7_1b35:		lda $047b		; ad 7b 04
B7_1b38:		bne B7_1b88 ; d0 4e

B7_1b3a:		lda $0450		; ad 50 04
B7_1b3d:		beq B7_1b45 ; f0 06

B7_1b3f:		dec $0450		; ce 50 04
B7_1b42:		jmp $bb88		; 4c 88 bb


B7_1b45:		lda #$0d		; a9 0d
B7_1b47:		jsr func_1aac		; 20 ac fa
B7_1b4a:		bcs B7_1b5d ; b0 11

B7_1b4c:		lda #$40		; a9 40
B7_1b4e:		sta $0450		; 8d 50 04
B7_1b51:		lda #$26		; a9 26
B7_1b53:		jsr $8033		; 20 33 80
B7_1b56:		lda #$80		; a9 80
B7_1b58:		sta wCachedEntityStruct.byteA			; 85 1a
B7_1b5a:		jmp $bb88		; 4c 88 bb


B7_1b5d:		lda #$00		; a9 00
B7_1b5f:		jsr func_13ef		; 20 ef f3
B7_1b62:		lda $10			; a5 10
B7_1b64:		cmp #$e1		; c9 e1
B7_1b66:		bcc B7_1b76 ; 90 0e

B7_1b68:		cmp #$ef		; c9 ef
B7_1b6a:		bcs B7_1b76 ; b0 0a

B7_1b6c:		lda $12			; a5 12
B7_1b6e:		cmp #$01		; c9 01
B7_1b70:		bcc B7_1b76 ; 90 04

B7_1b72:		cmp #$0e		; c9 0e
B7_1b74:		bcc B7_1b7a ; 90 04

B7_1b76:		lda #$80		; a9 80
B7_1b78:		sta wCachedEntityStruct.byteA			; 85 1a
B7_1b7a:		lda #$0f		; a9 0f
B7_1b7c:		jsr func_1888		; 20 88 f8
B7_1b7f:		bcs B7_1b88 ; b0 07

B7_1b81:		lda #$80		; a9 80
B7_1b83:		sta wCachedEntityStruct.byteA			; 85 1a
B7_1b85:		jmp $bc25		; 4c 25 bc


B7_1b88:		lda #$30		; a9 30
B7_1b8a:		bit $1a			; 24 1a
B7_1b8c:		bpl B7_1b91 ; 10 03

B7_1b8e:		jmp $bc25		; 4c 25 bc


B7_1b91:		bvs B7_1bc2 ; 70 2f

B7_1b93:		beq B7_1b9e ; f0 09

B7_1b95:		lda $1a			; a5 1a
B7_1b97:		and #$20		; 29 20
B7_1b99:		bne B7_1bf3 ; d0 58

B7_1b9b:		jmp $bc22		; 4c 22 bc


B7_1b9e:		jsr $bcef		; 20 ef bc
B7_1ba1:		dec $1e			; c6 1e
B7_1ba3:		bne B7_1bbf ; d0 1a

B7_1ba5:		inc $1d			; e6 1d
B7_1ba7:		lda $1d			; a5 1d
B7_1ba9:		and #$07		; 29 07
B7_1bab:		tay				; a8 
B7_1bac:		lda $bc7a, y	; b9 7a bc
B7_1baf:		sta wCachedEntityStruct.byteA			; 85 1a
B7_1bb1:		lda $bc82, y	; b9 82 bc
B7_1bb4:		sta wCachedEntityStruct.byteE			; 85 1e
B7_1bb6:		lda #$70		; a9 70
B7_1bb8:		sta wCachedEntityStruct.byteB			; 85 1b
B7_1bba:		lda #$2c		; a9 2c
B7_1bbc:		jsr func_08fa		; 20 fa e8
B7_1bbf:		jmp $bc62		; 4c 62 bc


B7_1bc2:		lda $1b			; a5 1b
B7_1bc4:		jsr $8316		; 20 16 83
B7_1bc7:		ldy #$01		; a0 01
B7_1bc9:		lda ($00), y	; b1 00
B7_1bcb:		asl a			; 0a
B7_1bcc:		sta wCachedEntityStruct.byte4			; 85 14
B7_1bce:		ldy #$03		; a0 03
B7_1bd0:		lda ($00), y	; b1 00
B7_1bd2:		asl a			; 0a
B7_1bd3:		sta wCachedEntityStruct.byte5			; 85 15
B7_1bd5:		inc $1b			; e6 1b
B7_1bd7:		lda $1b			; a5 1b
B7_1bd9:		cmp #$b4		; c9 b4
B7_1bdb:		bne B7_1be1 ; d0 04

B7_1bdd:		lda #$00		; a9 00
B7_1bdf:		sta wCachedEntityStruct.byteB			; 85 1b
B7_1be1:		lda $015a		; ad 5a 01
B7_1be4:		and #$01		; 29 01
B7_1be6:		bne B7_1bf0 ; d0 08

B7_1be8:		dec $1e			; c6 1e
B7_1bea:		bne B7_1bf0 ; d0 04

B7_1bec:		lda #$80		; a9 80
B7_1bee:		sta wCachedEntityStruct.byteA			; 85 1a
B7_1bf0:		jmp $bc62		; 4c 62 bc


B7_1bf3:		lda $1a			; a5 1a
B7_1bf5:		cmp #$20		; c9 20
B7_1bf7:		bne B7_1c17 ; d0 1e

B7_1bf9:		lda $0506		; ad 06 05
B7_1bfc:		sta $00			; 85 00
B7_1bfe:		lda $0507		; ad 07 05
B7_1c01:		sta $01			; 85 01
B7_1c03:		jsr $823c		; 20 3c 82
B7_1c06:		ldx #$03		; a2 03
B7_1c08:		stx $01			; 86 01
B7_1c0a:		jsr $8604		; 20 04 86
B7_1c0d:		lda $01			; a5 01
B7_1c0f:		sta wCachedEntityStruct.byte4			; 85 14
B7_1c11:		lda $02			; a5 02
B7_1c13:		sta wCachedEntityStruct.byte5			; 85 15
B7_1c15:		inc $1a			; e6 1a
B7_1c17:		dec $1e			; c6 1e
B7_1c19:		bne B7_1c1f ; d0 04

B7_1c1b:		lda #$80		; a9 80
B7_1c1d:		sta wCachedEntityStruct.byteA			; 85 1a
B7_1c1f:		jmp $bc62		; 4c 62 bc


B7_1c22:		jmp $8824		; 4c 24 88


B7_1c25:		lda $0476		; ad 76 04
B7_1c28:		sta $00			; 85 00
B7_1c2a:		sta $0e			; 85 0e
B7_1c2c:		lda $0477		; ad 77 04
B7_1c2f:		sta $01			; 85 01
B7_1c31:		sta $0f			; 85 0f
B7_1c33:		jsr $823c		; 20 3c 82
B7_1c36:		ldx #$03		; a2 03
B7_1c38:		sta $01			; 85 01
B7_1c3a:		jsr $8604		; 20 04 86
B7_1c3d:		lda $01			; a5 01
B7_1c3f:		sta wCachedEntityStruct.byte4			; 85 14
B7_1c41:		lda $02			; a5 02
B7_1c43:		sta wCachedEntityStruct.byte5			; 85 15
B7_1c45:		lda #$10		; a9 10
B7_1c47:		sta $00			; 85 00
B7_1c49:		sta $01			; 85 01
B7_1c4b:		lda $0f			; a5 0f
B7_1c4d:		sta $02			; 85 02
B7_1c4f:		lda $0e			; a5 0e
B7_1c51:		jsr func_170b		; 20 0b f7
B7_1c54:		bcs B7_1c62 ; b0 0c

B7_1c56:		lda #$00		; a9 00
B7_1c58:		sta wCachedEntityStruct.byteA			; 85 1a
B7_1c5a:		sta wCachedEntityStruct.byte4			; 85 14
B7_1c5c:		sta wCachedEntityStruct.byte5			; 85 15
B7_1c5e:		lda #$40		; a9 40
B7_1c60:		sta wCachedEntityStruct.byteE			; 85 1e
B7_1c62:		ldy #$00		; a0 00
B7_1c64:		jsr $bc8a		; 20 8a bc
B7_1c67:		ldy #$02		; a0 02
B7_1c69:		jsr $bc8a		; 20 8a bc
B7_1c6c:		lda $0450		; ad 50 04
B7_1c6f:		bne B7_1c75 ; d0 04

B7_1c71:		lda #$ec		; a9 ec
B7_1c73:		bne B7_1c77 ; d0 02

B7_1c75:		lda #$ed		; a9 ed
B7_1c77:		jmp updateEntity_wOam		; 4c 67 f5


B7_1c7a:		rti				; 40 


B7_1c7b:		jsr $2040		; 20 40 20
B7_1c7e:		jsr $2040		; 20 40 20
B7_1c81:		jsr $302c		; 20 2c 30
B7_1c84:		bit $3030		; 2c 30 30
B7_1c87:		bit $3030		; 2c 30 30
B7_1c8a:		lda $0476		; ad 76 04
B7_1c8d:		clc				; 18 
B7_1c8e:		adc $bceb, y	; 79 eb bc
B7_1c91:		sec				; 38 
B7_1c92:		sbc $16			; e5 16
B7_1c94:		bcc B7_1c9b ; 90 05

B7_1c96:		lsr a			; 4a
B7_1c97:		lsr a			; 4a
B7_1c98:		jmp $bc9f		; 4c 9f bc


B7_1c9b:		sec				; 38 
B7_1c9c:		ror a			; 6a
B7_1c9d:		sec				; 38 
B7_1c9e:		ror a			; 6a
B7_1c9f:		sta $0a			; 85 0a
B7_1ca1:		lda $0477		; ad 77 04
B7_1ca4:		clc				; 18 
B7_1ca5:		adc $bcec, y	; 79 ec bc
B7_1ca8:		sec				; 38 
B7_1ca9:		sbc $17			; e5 17
B7_1cab:		bcc B7_1cb2 ; 90 05

B7_1cad:		lsr a			; 4a
B7_1cae:		lsr a			; 4a
B7_1caf:		jmp $bcb6		; 4c b6 bc


B7_1cb2:		sec				; 38 
B7_1cb3:		ror a			; 6a
B7_1cb4:		sec				; 38 
B7_1cb5:		ror a			; 6a
B7_1cb6:		sta $0b			; 85 0b
B7_1cb8:		lda $16			; a5 16
B7_1cba:		pha				; 48 
B7_1cbb:		lda $17			; a5 17
B7_1cbd:		pha				; 48 
B7_1cbe:		lda $1c			; a5 1c
B7_1cc0:		pha				; 48 
B7_1cc1:		lda $16			; a5 16
B7_1cc3:		clc				; 18 
B7_1cc4:		adc $0a			; 65 0a
B7_1cc6:		sta $16			; 85 16
B7_1cc8:		lda $17			; a5 17
B7_1cca:		clc				; 18 
B7_1ccb:		adc $0b			; 65 0b
B7_1ccd:		sta $17			; 85 17
B7_1ccf:		lda $015a		; ad 5a 01
B7_1cd2:		eor $1c			; 45 1c
B7_1cd4:		and #$01		; 29 01
B7_1cd6:		bne B7_1cdd ; d0 05

B7_1cd8:		lda #$ee		; a9 ee
B7_1cda:		jsr updateEntity_wOam		; 20 67 f5
B7_1cdd:		dec $1c			; c6 1c
B7_1cdf:		bne B7_1cc1 ; d0 e0

B7_1ce1:		pla				; 68 
B7_1ce2:		sta wCachedEntityStruct.byteC			; 85 1c
B7_1ce4:		pla				; 68 
B7_1ce5:		sta $17			; 85 17
B7_1ce7:		pla				; 68 
B7_1ce8:		sta $16			; 85 16
B7_1cea:		rts				; 60 


B7_1ceb:	.db $da
B7_1cec:	.db $fa
B7_1ced:		bit $adf8		; 2c f8 ad
B7_1cf0:	.db $14
B7_1cf1:		lda $6d18, x	; bd 18 6d
B7_1cf4:	.db $73
B7_1cf5:	.db $04
B7_1cf6:		sta wCachedEntityStruct.subY			; 85 13
B7_1cf8:		lda $0472		; ad 72 04
B7_1cfb:		adc $bd15		; 6d 15 bd
B7_1cfe:		sta $12			; 85 12
B7_1d00:		ldy #$00		; a0 00
B7_1d02:		lda $bd16		; ad 16 bd
B7_1d05:		clc				; 18 
B7_1d06:		adc $0471		; 6d 71 04
B7_1d09:		sta $11			; 85 11
B7_1d0b:		lda $bd17		; ad 17 bd
B7_1d0e:		adc $0470		; 6d 70 04
B7_1d11:		sta $10			; 85 10
B7_1d13:		rts				; 60 


B7_1d14:		.db $00				; 00
B7_1d15:		.db $00				; 00
B7_1d16:	.db $80
B7_1d17:	.db $ff


enUpdate_fight0a:
B7_1d18:		jsr $81c2		; 20 c2 81
B7_1d1b:		bit $1a			; 24 1a
B7_1d1d:		bmi B7_1d2e ; 30 0f

B7_1d1f:		ldx #$06		; a2 06
B7_1d21:		lda #$c0		; a9 c0
B7_1d23:		jsr func_13ef		; 20 ef f3
B7_1d26:		lda $4a			; a5 4a
B7_1d28:		beq B7_1d2e ; f0 04

B7_1d2a:		lda #$80		; a9 80
B7_1d2c:		sta wCachedEntityStruct.byteA			; 85 1a
B7_1d2e:		jsr $bd4c		; 20 4c bd
B7_1d31:		dec $1b			; c6 1b
B7_1d33:		bne B7_1d3a ; d0 05

B7_1d35:		lda #$00		; a9 00
B7_1d37:		sta wCachedEntityStruct.byte9			; 85 19
B7_1d39:		rts				; 60 


B7_1d3a:		lda $1b			; a5 1b
B7_1d3c:		cmp #$20		; c9 20
B7_1d3e:		bcs B7_1d47 ; b0 07

B7_1d40:		lda $015a		; ad 5a 01
B7_1d43:		and #$01		; 29 01
B7_1d45:		bne B7_1d39 ; d0 f2

B7_1d47:		lda #$34		; a9 34
B7_1d49:		jmp updateEntity_wOam		; 4c 67 f5


B7_1d4c:		lda #$10		; a9 10
B7_1d4e:		sta $00			; 85 00
B7_1d50:		sta $01			; 85 01
B7_1d52:		lda $0507		; ad 07 05
B7_1d55:		sta $02			; 85 02
B7_1d57:		lda $0506		; ad 06 05
B7_1d5a:		sta $03			; 85 03
B7_1d5c:		lda #$02		; a9 02
B7_1d5e:		jsr $8847		; 20 47 88
B7_1d61:		bcs B7_1d68 ; b0 05

B7_1d63:		lda #$39		; a9 39
B7_1d65:		jsr func_08fa		; 20 fa e8
B7_1d68:		rts				; 60 


.ifdef ROM_JP
B7_1d67:		bit $15			; 24 15
B7_1d69:		bmi B7_1d6f ; 30 04

B7_1d6b:		ldy #$01		; a0 01
B7_1d6d:		bne B7_1d74 ; d0 05

B7_1d6f:		bit $13			; 24 13
B7_1d71:		bvc B7_1d74 ; 50 01

B7_1d73:		iny				; c8
B7_1d74:		lda $bd7a, y	; b9 7a bd
B7_1d77:		jmp $f602		; 4c 02 f6


B7_1d7a:		dec $d7, x		; d6 d7
B7_1d7c:		jsr $81c2		; 20 c2 81
B7_1d7f:		ldx #$0c		; a2 0c
B7_1d81:		lda #$c0		; a9 c0
B7_1d83:		jsr $f48a		; 20 8a f4
B7_1d86:		lda $0509		; ad 09 05
B7_1d89:		and #$04		; 29 04
B7_1d8b:		beq B7_1da6 ; f0 19

B7_1d8d:		lda #$08		; a9 08
B7_1d8f:		sta $00			; 85 00
B7_1d91:		lda #$40		; a9 40
B7_1d93:		sta $01			; 85 01
B7_1d95:		jsr $fb30		; 20 30 fb
B7_1d98:		bcs B7_1da6 ; b0 0c

B7_1d9a:		lda $0507		; ad 07 05
B7_1d9d:		cmp $17			; c5 17
B7_1d9f:		bcs B7_1da6 ; b0 05

B7_1da1:		lda #$20		; a9 20
B7_1da3:		jsr $8033		; 20 33 80
B7_1da6:		lda #$00		; a9 00
B7_1da8:		jsr $f923		; 20 23 f9
B7_1dab:		lda #$00		; a9 00
B7_1dad:		jsr $f7e0		; 20 e0 f7
B7_1db0:		bcc B7_1db4 ; 90 02

B7_1db2:		inc $1f			; e6 1f
B7_1db4:		ldy #$00		; a0 00
B7_1db6:		ldx $015b		; ae 5b 01
B7_1db9:		lda $0309, x	; bd 09 03
B7_1dbc:		and #$04		; 29 04
B7_1dbe:		beq B7_1dc1 ; f0 01

B7_1dc0:		iny				; c8
B7_1dc1:		lda $bdc7, y	; b9 c7 bd
B7_1dc4:		jmp $f602		; 4c 02 f6


B7_1dc7:		cld				; d8
B7_1dc8:		cmp $c220, y	; d9 20 c2
B7_1dcb:		sta ($a2, x)	; 81 a2
B7_1dcd:		;removed
	.db  $10 $a9

B7_1dcf:		cpy #$20		; c0 20
B7_1dd1:		txa				; 8a
B7_1dd2:	.db $f4
B7_1dd3:		bit $1a			; 24 1a
B7_1dd5:		bpl B7_1df2 ; 10 1b

B7_1dd7:		dec $1c			; c6 1c
B7_1dd9:		bne B7_1de4 ; d0 09

B7_1ddb:		lda $1a			; a5 1a
B7_1ddd:		and #$7f		; 29 7f
B7_1ddf:		sta $1a			; 85 1a
B7_1de1:		jmp $bdf2		; 4c f2 bd


B7_1de4:		lda $1c			; a5 1c
B7_1de6:		cmp #$10		; c9 10
B7_1de8:		bne B7_1def ; d0 05

B7_1dea:		lda #$55		; a9 55
B7_1dec:		jsr $8033		; 20 33 80
B7_1def:		jmp $be16		; 4c 16 be


B7_1df2:		jsr $89ce		; 20 ce 89
B7_1df5:		lda $00			; a5 00
B7_1df7:		cmp #$08		; c9 08
B7_1df9:		bcc B7_1dfe ; 90 03

B7_1dfb:		jsr $8a12		; 20 12 8a
B7_1dfe:		ldx #$70		; a2 70
B7_1e00:		lda $0409, x	; bd 09 04
B7_1e03:		bne B7_1e16 ; d0 11

B7_1e05:		lda $015a		; ad 5a 01
B7_1e08:		and #$7f		; 29 7f
B7_1e0a:		bne B7_1e16 ; d0 0a

B7_1e0c:		lda $1a			; a5 1a
B7_1e0e:		ora #$80		; 09 80
B7_1e10:		sta $1a			; 85 1a
B7_1e12:		lda #$20		; a9 20
B7_1e14:		sta $1c			; 85 1c
B7_1e16:		lda #$05		; a9 05
B7_1e18:		jsr $f923		; 20 23 f9
B7_1e1b:		lda #$05		; a9 05
B7_1e1d:		jsr $fb47		; 20 47 fb
B7_1e20:		lda #$05		; a9 05
B7_1e22:		jsr $f7e0		; 20 e0 f7
B7_1e25:		bcc B7_1e30 ; 90 09

B7_1e27:		lda $1f			; a5 1f
B7_1e29:		bpl B7_1e30 ; 10 05

B7_1e2b:		lda #$27		; a9 27
B7_1e2d:		jmp $8033		; 4c 33 80


B7_1e30:		bit $1a			; 24 1a
B7_1e32:		bpl B7_1e38 ; 10 04

B7_1e34:		ldy #$02		; a0 02
B7_1e36:		bne B7_1e42 ; d0 0a

B7_1e38:		ldy #$00		; a0 00
B7_1e3a:		lda $015a		; ad 5a 01
B7_1e3d:		and #$08		; 29 08
B7_1e3f:		bne B7_1e42 ; d0 01

B7_1e41:		iny				; c8
B7_1e42:		lda $be48, y	; b9 48 be
B7_1e45:		jmp $f602		; 4c 02 f6


B7_1e48:	.db $dc
B7_1e49:		cmp $20de, x	; dd de 20
B7_1e4c:	.db $c2
B7_1e4d:		sta ($a2, x)	; 81 a2
B7_1e4f:	.db $0c
B7_1e50:		lda #$c0		; a9 c0
B7_1e52:		jsr $f48a		; 20 8a f4
B7_1e55:		jsr $89ce		; 20 ce 89
B7_1e58:		lda $00			; a5 00
B7_1e5a:		cmp #$10		; c9 10
B7_1e5c:		bcc B7_1e61 ; 90 03

B7_1e5e:		jsr $8a12		; 20 12 8a
B7_1e61:		lda #$0c		; a9 0c
B7_1e63:		jsr $8214		; 20 14 82
B7_1e66:		lda #$00		; a9 00
B7_1e68:		jsr $f923		; 20 23 f9
B7_1e6b:		lda #$00		; a9 00
B7_1e6d:		jsr $fb47		; 20 47 fb
B7_1e70:		lda #$00		; a9 00
B7_1e72:		jsr $f7e0		; 20 e0 f7
B7_1e75:		bcc B7_1e80 ; 90 09

B7_1e77:		lda $1f			; a5 1f
B7_1e79:		bpl B7_1e80 ; 10 05

B7_1e7b:		lda #$27		; a9 27
B7_1e7d:		jmp $8033		; 4c 33 80


B7_1e80:		ldy #$00		; a0 00
B7_1e82:		lda $015a		; ad 5a 01
B7_1e85:		and #$08		; 29 08
B7_1e87:		bne B7_1e8a ; d0 01

B7_1e89:		iny				; c8
B7_1e8a:		lda $be90, y	; b9 90 be
B7_1e8d:		jmp $f602		; 4c 02 f6


B7_1e90:	.db $df
B7_1e91:		cpx #$a5		; e0 a5
B7_1e93:	.db $1a
B7_1e94:		bpl B7_1e99 ; 10 03

B7_1e96:		jmp $9561		; 4c 61 95


B7_1e99:		jsr $81c2		; 20 c2 81
B7_1e9c:		ldx #$0a		; a2 0a
B7_1e9e:		lda #$00		; a9 00
B7_1ea0:		jsr $f48a		; 20 8a f4
B7_1ea3:		lda $015a		; ad 5a 01
B7_1ea6:		and #$01		; 29 01
B7_1ea8:		bne B7_1ee2 ; d0 38

B7_1eaa:		inc $1d			; e6 1d
B7_1eac:		lda $1d			; a5 1d
B7_1eae:		and #$3f		; 29 3f
B7_1eb0:		sta $00			; 85 00
B7_1eb2:		lda $19			; a5 19
B7_1eb4:		and #$02		; 29 02
B7_1eb6:		beq B7_1ec0 ; f0 08

B7_1eb8:		lda $00			; a5 00
B7_1eba:		eor #$ff		; 49 ff
B7_1ebc:		sta $00			; 85 00
B7_1ebe:		inc $00			; e6 00
B7_1ec0:		lda #$00		; a9 00
B7_1ec2:		sta $01			; 85 01
B7_1ec4:		lda $00			; a5 00
B7_1ec6:		jsr $8604		; 20 04 86
B7_1ec9:		lda $19			; a5 19
B7_1ecb:		and #$02		; 29 02
B7_1ecd:		bne B7_1ed7 ; d0 08

B7_1ecf:		lda $01			; a5 01
B7_1ed1:		clc				; 18
B7_1ed2:		adc #$04		; 69 04
B7_1ed4:		jmp $bedc		; 4c dc be


B7_1ed7:		lda $01			; a5 01
B7_1ed9:		sec				; 38
B7_1eda:		sbc #$04		; e9 04
B7_1edc:		sta $14			; 85 14
B7_1ede:		lda $02			; a5 02
B7_1ee0:		sta $15			; 85 15
B7_1ee2:		lda #$02		; a9 02
B7_1ee4:		jsr $f923		; 20 23 f9
B7_1ee7:		lda #$02		; a9 02
B7_1ee9:		jsr $fb47		; 20 47 fb
B7_1eec:		lda #$02		; a9 02
B7_1eee:		jsr $f7e0		; 20 e0 f7
B7_1ef1:		bcc B7_1efc ; 90 09

B7_1ef3:		lda $1f			; a5 1f
B7_1ef5:		bpl B7_1efc ; 10 05

B7_1ef7:		lda #$27		; a9 27
B7_1ef9:		jmp $8033		; 4c 33 80


B7_1efc:		ldy #$00		; a0 00
B7_1efe:		lda $015a		; ad 5a 01
B7_1f01:		and #$08		; 29 08
B7_1f03:		bne B7_1f06 ; d0 01

B7_1f05:		iny				; c8
B7_1f06:		lda $bf0c, y	; b9 0c bf
B7_1f09:		jmp $f602		; 4c 02 f6


B7_1f0c:		sbc ($e2, x)	; e1 e2
B7_1f0e:		jmp $9561		; 4c 61 95


B7_1f11:		jmp $94da		; 4c da 94


B7_1f14:		jsr $81c2		; 20 c2 81
B7_1f17:		ldx #$0a		; a2 0a
B7_1f19:		lda #$c0		; a9 c0
B7_1f1b:		jsr $f48a		; 20 8a f4
B7_1f1e:		jsr $8225		; 20 25 82
B7_1f21:		lda $19			; a5 19
B7_1f23:		and #$04		; 29 04
B7_1f25:		bne B7_1f35 ; d0 0e

B7_1f27:		lda $015a		; ad 5a 01
B7_1f2a:		and #$7f		; 29 7f
B7_1f2c:		bne B7_1f35 ; d0 07

B7_1f2e:		jsr $8a12		; 20 12 8a
B7_1f31:		lda #$c0		; a9 c0
B7_1f33:		sta $15			; 85 15
B7_1f35:		lda #$10		; a9 10
B7_1f37:		jsr $8214		; 20 14 82
B7_1f3a:		lda #$02		; a9 02
B7_1f3c:		jsr $f923		; 20 23 f9
B7_1f3f:		lda #$02		; a9 02
B7_1f41:		jsr $fb47		; 20 47 fb
B7_1f44:		lda #$02		; a9 02
B7_1f46:		jsr $f7e0		; 20 e0 f7
B7_1f49:		bcc B7_1f54 ; 90 09

B7_1f4b:		lda $1f			; a5 1f
B7_1f4d:		bpl B7_1f54 ; 10 05

B7_1f4f:		lda #$27		; a9 27
B7_1f51:		jmp $8033		; 4c 33 80


B7_1f54:		ldy #$00		; a0 00
B7_1f56:		lda $19			; a5 19
B7_1f58:		and #$04		; 29 04
B7_1f5a:		bne B7_1f61 ; d0 05

B7_1f5c:		bit $11			; 24 11
B7_1f5e:		bvs B7_1f61 ; 70 01

B7_1f60:		iny				; c8
B7_1f61:		lda $bf67, y	; b9 67 bf
B7_1f64:		jmp $f602		; 4c 02 f6


B7_1f67:	.db $eb
B7_1f68:		nop				; ea
.else
B7_1d69:		ora $137c, x	; 1d 7c 13
B7_1d6c:		asl $1d1c, x	; 1e 1c 1d
B7_1d6f:	.db $7c
B7_1d70:	.db $1c
B7_1d71:		ora $170a, x	; 1d 0a 17
B7_1d74:		ora $7cfd		; 0d fd 7c
B7_1d77:		ora $0e11, x	; 1d 11 0e
B7_1d7a:	.db $1b
B7_1d7b:		asl $7c24		; 0e 24 7c
B7_1d7e:		ora $0e, x		; 15 0e
B7_1d80:		ora $1c26, x	; 1d 26 1c
B7_1d83:	.db $7c
B7_1d84:		;removed
	.db $10 $18

B7_1d86:		plp				; 28 
B7_1d87:	.db $fc
B7_1d88:	.db $ff
B7_1d89:		ora $0e11, x	; 1d 11 0e
B7_1d8c:	.db $12
B7_1d8d:	.db $1b
B7_1d8e:	.db $7c
B7_1d8f:	.db $1c
B7_1d90:		asl a			; 0a
B7_1d91:		;removed
	.db $10 $0a

B7_1d93:	.db $7c
B7_1d94:		jsr $1512		; 20 12 15
B7_1d97:		ora $fd, x		; 15 fd
B7_1d99:	.db $0c
B7_1d9a:		clc				; 18 
B7_1d9b:	.db $17
B7_1d9c:		ora $1712, x	; 1d 12 17
B7_1d9f:		asl $7c0e, x	; 1e 0e 7c
B7_1da2:	.db $0f
B7_1da3:		clc				; 18 
B7_1da4:	.db $1b
B7_1da5:		asl $0e1f		; 0e 1f 0e
B7_1da8:	.db $1b
B7_1da9:		bit $24			; 24 24
B7_1dab:		bit $24			; 24 24
B7_1dad:	.db $fc
B7_1dae:	.db $ff
B7_1daf:		ora ($0e), y	; 11 0e
B7_1db1:		ora $15, x		; 15 15
B7_1db3:		clc				; 18 
B7_1db4:		plp				; 28 
B7_1db5:	.db $7c
B7_1db6:		asl $22, x		; 16 22
B7_1db8:	.db $7c
B7_1db9:	.db $17
B7_1dba:		asl a			; 0a
B7_1dbb:		asl $0e, x		; 16 0e
B7_1dbd:	.db $7c
B7_1dbe:	.db $12
B7_1dbf:	.db $1c
B7_1dc0:		sbc $180b, x	; fd 0b 18
B7_1dc3:		ora $157c, y	; 19 7c 15
B7_1dc6:		clc				; 18 
B7_1dc7:		asl $0e12, x	; 1e 12 0e
B7_1dca:	.db $7c
B7_1dcb:		asl a			; 0a
B7_1dcc:	.db $17
B7_1dcd:		ora $127c		; 0d 7c 12
B7_1dd0:	.db $7c
B7_1dd1:		asl a			; 0a
B7_1dd2:		asl $7c, x		; 16 7c
B7_1dd4:	.db $12
B7_1dd5:	.db $17
B7_1dd6:		sbc $120b, x	; fd 0b 12
B7_1dd9:		;removed
	.db $10 $7c

B7_1ddb:		ora $181b, x	; 1d 1b 18
B7_1dde:		asl $150b, x	; 1e 0b 15
B7_1de1:		asl $fc24		; 0e 24 fc
B7_1de4:	.db $ff
B7_1de5:	.db $12
B7_1de6:	.db $7c
B7_1de7:		jsr $1c0a		; 20 0a 1c
B7_1dea:	.db $7c
B7_1deb:		ora $12, x		; 15 12
B7_1ded:	.db $1f
B7_1dee:	.db $12
B7_1def:	.db $17
B7_1df0:		;removed
	.db $10 $7c

B7_1df2:	.db $12
B7_1df3:	.db $17
B7_1df4:	.db $7c
B7_1df5:		asl a			; 0a
B7_1df6:		sbc $0e19, x	; fd 19 0e
B7_1df9:		asl a			; 0a
B7_1dfa:	.db $0c
B7_1dfb:		asl $1e0f		; 0e 0f 1e
B7_1dfe:		ora $7c, x		; 15 7c
B7_1e00:		ora $0a, x		; 15 0a
B7_1e02:	.db $17
B7_1e03:		ora $0c7c		; 0d 7c 0c
B7_1e06:		asl a			; 0a
B7_1e07:		ora $15, x		; 15 15
B7_1e09:		asl $fd0d		; 0e 0d fd
B7_1e0c:		asl $180f, x	; 1e 0f 18
B7_1e0f:		asl $121b, x	; 1e 1b 12
B7_1e12:		asl a			; 0a
B7_1e13:		bit $fc			; 24 fc
B7_1e15:	.db $ff
B7_1e16:		clc				; 18 
B7_1e17:	.db $17
B7_1e18:		asl $0d7c		; 0e 7c 0d
B7_1e1b:		asl a			; 0a
B7_1e1c:	.db $22
B7_1e1d:		and $7c			; 25 7c
B7_1e1f:		asl $22, x		; 16 22
B7_1e21:	.db $7c
B7_1e22:	.db $0f
B7_1e23:	.db $1b
B7_1e24:	.db $12
B7_1e25:		asl $0d17		; 0e 17 0d
B7_1e28:	.db $1c
B7_1e29:		sbc $170a, x	; fd 0a 17
B7_1e2c:		ora $127c		; 0d 7c 12
B7_1e2f:	.db $7c
B7_1e30:	.db $0f
B7_1e31:		clc				; 18 
B7_1e32:		asl $0d17, x	; 1e 17 0d
B7_1e35:	.db $7c
B7_1e36:		asl a			; 0a
B7_1e37:	.db $7c
B7_1e38:		bpl B7_1e4c ; 10 12

B7_1e3a:		;removed
	.db $10 $0a

B7_1e3c:	.db $17
B7_1e3d:		ora $0c12, x	; 1d 12 0c
B7_1e40:		sbc $1b0c, x	; fd 0c 1b
B7_1e43:		asl a			; 0a
B7_1e44:		ora $1b0e, x	; 1d 0e 1b
B7_1e47:	.db $7c
B7_1e48:	.db $17
B7_1e49:		asl $1b0a		; 0e 0a 1b
B7_1e4c:	.db $7c
B7_1e4d:		ora $0e11, x	; 1d 11 0e
B7_1e50:	.db $7c
B7_1e51:		ora $0a15, y	; 19 15 0a
B7_1e54:	.db $0c
B7_1e55:		asl $20fd		; 0e fd 20
B7_1e58:		ora ($0e), y	; 11 0e
B7_1e5a:	.db $1b
B7_1e5b:		asl $207c		; 0e 7c 20
B7_1e5e:		asl $157c		; 0e 7c 15
B7_1e61:	.db $12
B7_1e62:	.db $1f
B7_1e63:		asl $fc24		; 0e 24 fc
B7_1e66:	.db $ff
B7_1e67:		jsr $7c0e		; 20 0e 7c
B7_1e6a:		jsr $1b0e		; 20 0e 1b
B7_1e6d:		asl $0a7c		; 0e 7c 0a
B7_1e70:		ora $15, x		; 15 15
B7_1e72:	.db $7c
B7_1e73:	.db $1f
B7_1e74:		asl $221b		; 0e 1b 22
B7_1e77:		sbc $1e0c, x	; fd 0c 1e
B7_1e7a:	.db $1b
B7_1e7b:	.db $12
B7_1e7c:		clc				; 18 
B7_1e7d:		asl $7c1c, x	; 1e 1c 7c
B7_1e80:		ora $7c18, x	; 1d 18 7c
B7_1e83:	.db $1c
B7_1e84:		asl $7c0e		; 0e 0e 7c
B7_1e87:		jsr $0a11		; 20 11 0a
B7_1e8a:		ora $20fd, x	; 1d fd 20
B7_1e8d:		asl a			; 0a
B7_1e8e:	.db $1c
B7_1e8f:	.db $7c
B7_1e90:		ora $2018		; 0d 18 20
B7_1e93:	.db $17
B7_1e94:	.db $7c
B7_1e95:	.db $12
B7_1e96:	.db $17
B7_1e97:	.db $1c
B7_1e98:	.db $12
B7_1e99:		ora $7c0e		; 0d 0e 7c
B7_1e9c:	.db $0b
B7_1e9d:		asl $fc1d, x	; 1e 1d fc
B7_1ea0:	.db $ff
B7_1ea1:		jsr $7c0e		; 20 0e 7c
B7_1ea4:	.db $0c
B7_1ea5:		asl a			; 0a
B7_1ea6:		asl $0e, x		; 16 0e
B7_1ea8:	.db $7c
B7_1ea9:		ora $1818, x	; 1d 18 18
B7_1eac:	.db $7c
B7_1ead:	.db $0c
B7_1eae:		ora $18, x		; 15 18
B7_1eb0:	.db $1c
B7_1eb1:		asl $1d7c		; 0e 7c 1d
B7_1eb4:		clc				; 18 
B7_1eb5:		sbc $111d, x	; fd 1d 11
B7_1eb8:		asl $0e7c		; 0e 7c 0e
B7_1ebb:		ora $0e10		; 0d 10 0e
B7_1ebe:	.db $7c
B7_1ebf:		asl a			; 0a
B7_1ec0:	.db $17
B7_1ec1:		ora $1c7c		; 0d 7c 1c
B7_1ec4:		ora $12, x		; 15 12
B7_1ec6:		ora $0e19, y	; 19 19 0e
B7_1ec9:		ora $fc28		; 0d 28 fc
B7_1ecc:	.db $ff
B7_1ecd:	.db $17
B7_1ece:		clc				; 18 
B7_1ecf:		jsr $127c		; 20 7c 12
B7_1ed2:	.db $7c
B7_1ed3:		asl a			; 0a
B7_1ed4:		asl $7c, x		; 16 7c
B7_1ed6:		ora $18, x		; 15 18
B7_1ed8:	.db $1c
B7_1ed9:		ora $127c, x	; 1d 7c 12
B7_1edc:	.db $17
B7_1edd:	.db $7c
B7_1ede:		asl a			; 0a
B7_1edf:		sbc $1d1c, x	; fd 1c 1d
B7_1ee2:	.db $1b
B7_1ee3:		asl a			; 0a
B7_1ee4:	.db $17
B7_1ee5:		;removed
	.db $10 $0e

B7_1ee7:	.db $7c
B7_1ee8:		jsr $1b18		; 20 18 1b
B7_1eeb:		ora $0d, x		; 15 0d
B7_1eed:	.db $7c
B7_1eee:		asl a			; 0a
B7_1eef:	.db $17
B7_1ef0:		ora $127c		; 0d 7c 12
B7_1ef3:		sbc $180d, x	; fd 0d 18
B7_1ef6:	.db $7c
B7_1ef7:	.db $17
B7_1ef8:		clc				; 18 
B7_1ef9:		ora $147c, x	; 1d 7c 14
B7_1efc:	.db $17
B7_1efd:		clc				; 18 
B7_1efe:		jsr $207c		; 20 7c 20
B7_1f01:		ora ($0e), y	; 11 0e
B7_1f03:	.db $1b
B7_1f04:		asl $167c		; 0e 7c 16
B7_1f07:	.db $22
B7_1f08:		sbc $1b0f, x	; fd 0f 1b
B7_1f0b:	.db $12
B7_1f0c:		asl $0d17		; 0e 17 0d
B7_1f0f:	.db $1c
B7_1f10:	.db $7c
B7_1f11:		asl a			; 0a
B7_1f12:	.db $1b
B7_1f13:		asl $fc24		; 0e 24 fc
B7_1f16:	.db $ff
B7_1f17:		ora $0e15, y	; 19 15 0e
B7_1f1a:		asl a			; 0a
B7_1f1b:	.db $1c
B7_1f1c:		asl $117c		; 0e 7c 11
B7_1f1f:		asl $1915		; 0e 15 19
B7_1f22:	.db $7c
B7_1f23:		asl $0e, x		; 16 0e
B7_1f25:	.db $7c
B7_1f26:	.db $0f
B7_1f27:	.db $12
B7_1f28:	.db $17
B7_1f29:		ora $16fd		; 0d fd 16
B7_1f2c:	.db $22
B7_1f2d:	.db $7c
B7_1f2e:	.db $0f
B7_1f2f:	.db $1b
B7_1f30:	.db $12
B7_1f31:		asl $0d17		; 0e 17 0d
B7_1f34:	.db $1c
B7_1f35:		and $7c			; 25 7c
B7_1f37:	.db $1c
B7_1f38:		ora ($0a), y	; 11 0a
B7_1f3a:		ora $1c0e		; 0d 0e 1c
B7_1f3d:		and $fd			; 25 fd
B7_1f3f:	.db $0f
B7_1f40:	.db $1b
B7_1f41:		asl $180e		; 0e 0e 18
B7_1f44:	.db $17
B7_1f45:		rol a			; 2a
B7_1f46:		ora $0e, x		; 15 0e
B7_1f48:		asl $1718		; 0e 18 17
B7_1f4b:	.db $7c
B7_1f4c:		asl a			; 0a
B7_1f4d:	.db $17
B7_1f4e:		ora $107c		; 0d 7c 10
B7_1f51:	.db $12
B7_1f52:		ora $fc, x		; 15 fc
B7_1f54:	.db $ff
B7_1f55:	.db $1c
B7_1f56:		clc				; 18 
B7_1f57:	.db $7c
B7_1f58:		jsr $7c0e		; 20 0e 7c
B7_1f5b:	.db $0c
B7_1f5c:		asl a			; 0a
B7_1f5d:	.db $17
B7_1f5e:	.db $7c
B7_1f5f:		.db $10 $18

B7_1f61:	.db $7c
B7_1f62:	.db $0b
B7_1f63:		asl a			; 0a
B7_1f64:	.db $0c
B7_1f65:	.db $14
B7_1f66:	.db $7c
B7_1f67:		ora ($18), y	; 11 18
B7_1f69:		asl $0e, x		; 16 0e
B7_1f6b:		sbc $181d, x	; fd 1d 18
B7_1f6e:	.db $7c
B7_1f6f:		asl $180f, x	; 1e 0f 18
B7_1f72:		asl $121b, x	; 1e 1b 12
B7_1f75:		asl a			; 0a
B7_1f76:		bit $fc			; 24 fc
B7_1f78:	.db $ff
.endif