
data_5_0000:
	.dw data_5_0410
	.dw $841f
	.dw data_5_042d
	.dw data_5_043b
	.dw $844a
	.dw $8459
	.dw data_5_0468
	.dw data_5_0476
	.dw $8484
	.dw $8494
	.dw $84a2
	.dw $84b0
	.dw $84be
	.dw $84cc
	.dw $84dc
	.dw $84eb
	.dw $84fa
	.dw $8509
	.dw $8517
	.dw $8525
	.dw $8534
	.dw $8543
	.dw $8551
	.dw $855f
	.dw $856d
	.dw $857b
	.dw $857b
	.dw $858e
	.dw $859c
	.dw $85aa
	.dw $85b8
	.dw $85c4
	.dw $85d0
	.dw $85dc
	.dw $85ec
	.dw $85fc
	.dw $860c
	.dw data_5_061b
	.dw data_5_0625
	.dw $862f
	.dw $8639
	.dw $8649
	.dw $8653
	.dw $8663
	.dw $8673
	.dw $8683
	.dw $8692
	.dw $86a0
	.dw $86a0
	.dw $86a0
	.dw $86a0
	.dw $86a0
	.dw $86af
	.dw $86be
	.dw $86ce
	.dw $86dc
	.dw $86e4
	.dw $86e4
	.dw $86e4
	.dw $86ea
	.dw $86f1
	.dw $86ff
	.dw $870e
	.dw $870e
	.dw $870e
	.dw $871e
	.dw $872e
	.dw $873e
	.dw $874c
	.dw $875a
	.dw $876a
	.dw $877a
	.dw $8790
	.dw $87a0
	.dw $87b0
	.dw $87bf
	.dw $87cf
	.dw $87df
	.dw $87ef
	.dw $87ff
	.dw $880f
	.dw $881f
	.dw $882f
	.dw $883f
	.dw $884f
	.dw $885f
	.dw $886f
	.dw $8882
	.dw $888a
	.dw $888a
	.dw $888a
	.dw $889a
	.dw $88aa
	.dw $88b2
	.dw $88ba
	.dw $88c1
	.dw $88c8
	.dw $88d8
	.dw $88e8
	.dw $88f8
	.dw $8906
	.dw $8915
	.dw $8925
	.dw $8934
	.dw $8944
	.dw $8953
	.dw $8963
	.dw $896d
	.dw $896d
	.dw $896d
	.dw $897d
	.dw $898e
	.dw $898e
	.dw $898e
	.dw $898e
	.dw $899f
	.dw $89af
	.dw $89bf
	.dw $89cf
	.dw $89df
	.dw $89e6
	.dw $89f6
	.dw $8a06
	.dw $8a10
	.dw $8a1a
	.dw $8a28
	.dw $8a28
	.dw $8a28

B5_0100:		plp				; 28
B5_0101:		txa				; 8a
B5_0102:		sec				; 38
B5_0103:		txa				; 8a
B5_0104:	.db $47
B5_0105:		txa				; 8a
B5_0106:		eor $8a, x		; 55 8a
B5_0108:	.db $63
B5_0109:		txa				; 8a
B5_010a:	.db $73
B5_010b:		txa				; 8a
B5_010c:	.db $82
B5_010d:		txa				; 8a
B5_010e:		.db $90 $8a

B5_0110:	.db $9f
B5_0111:		txa				; 8a
B5_0112:	.db $af
B5_0113:		txa				; 8a
B5_0114:	.db $bf
B5_0115:		txa				; 8a
B5_0116:		cmp $dd8a		; cd 8a dd
B5_0119:		txa				; 8a
B5_011a:		cpx $fc8a		; ec 8a fc
B5_011d:		txa				; 8a
B5_011e:	.db $0c
B5_011f:	.db $8b
B5_0120:	.db $1c
B5_0121:	.db $8b
B5_0122:		bit $3b8b		; 2c 8b 3b
B5_0125:	.db $8b
B5_0126:		lsr $618b		; 4e 8b 61
B5_0129:	.db $8b
B5_012a:		adc ($8b), y	; 71 8b
B5_012c:		sta ($8b, x)	; 81 8b
B5_012e:		.db $90 $8b

B5_0130:	.db $9e
B5_0131:	.db $8b
B5_0132:		ldy $ba8b		; ac 8b ba
B5_0135:	.db $8b
B5_0136:		iny				; c8
B5_0137:	.db $8b
B5_0138:	.db $d7
B5_0139:	.db $8b
B5_013a:		inc $8b			; e6 8b
B5_013c:		sbc $8b, x		; f5 8b
B5_013e:	.db $04
B5_013f:		sty $8c04		; 8c 04 8c
B5_0142:	.db $13
B5_0143:		sty $8c1d		; 8c 1d 8c
B5_0146:	.db $27
B5_0147:		sty $8c37		; 8c 37 8c
B5_014a:		eor $8c			; 45 8c
B5_014c:	.db $53
B5_014d:		sty $8c5d		; 8c 5d 8c
B5_0150:	.db $67
B5_0151:		sty $8c71		; 8c 71 8c
B5_0154:	.db $7f
B5_0155:		sty $8c8f		; 8c 8f 8c
B5_0158:	.db $8f
B5_0159:		sty $8c9d		; 8c 9d 8c
B5_015c:		lda $bd8c		; ad 8c bd
B5_015f:		sty $8ccd		; 8c cd 8c
B5_0162:		cmp $cd8c		; cd 8c cd
B5_0165:		sty $8cdd		; 8c dd 8c
B5_0168:	.db $e7
B5_0169:		sty $8cf7		; 8c f7 8c
B5_016c:		inc $0c8c, x	; fe 8c 0c
B5_016f:		sta $8d0c		; 8d 0c 8d
B5_0172:	.db $0c
B5_0173:		sta $8d0c		; 8d 0c 8d
B5_0176:	.db $0c
B5_0177:		sta $8d0c		; 8d 0c 8d
B5_017a:	.db $0c
B5_017b:		sta $8d0c		; 8d 0c 8d
B5_017e:	.db $0c
B5_017f:		sta $8d0c		; 8d 0c 8d
B5_0182:	.db $1b
B5_0183:		sta $8d2a		; 8d 2a 8d
B5_0186:		and $488d, y	; 39 8d 48
B5_0189:		sta $8d57		; 8d 57 8d
B5_018c:	.db $67
B5_018d:		sta $8d76		; 8d 76 8d
B5_0190:		sty $8d			; 84 8d
B5_0192:	.db $93
B5_0193:		sta $8da2		; 8d a2 8d
B5_0196:		lda ($8d), y	; b1 8d
B5_0198:		cmp ($8d, x)	; c1 8d
B5_019a:		bne B5_0129 ; d0 8d

B5_019c:	.db $df
B5_019d:		sta $8dee		; 8d ee 8d
B5_01a0:		sbc $0c8d, x	; fd 8d 0c
B5_01a3:		stx $8e1b		; 8e 1b 8e
B5_01a6:		rol a			; 2a
B5_01a7:		stx $8e39		; 8e 39 8e
B5_01aa:		pha				; 48
B5_01ab:		stx $8e57		; 8e 57 8e
B5_01ae:		ror $8e			; 66 8e
B5_01b0:		adc $8e, x		; 75 8e
B5_01b2:	.db $87
B5_01b3:		stx $8e99		; 8e 99 8e
B5_01b6:		tay				; a8
B5_01b7:		stx $8eb7		; 8e b7 8e
B5_01ba:		cmp $8e			; c5 8e
B5_01bc:		cmp $d48e		; cd 8e d4
B5_01bf:		stx $8edd		; 8e dd 8e
B5_01c2:		inc $8e			; e6 8e
B5_01c4:	.db $f2
B5_01c5:		stx $8f02		; 8e 02 8f
B5_01c8:	.db $02
B5_01c9:	.db $8f
B5_01ca:		clc				; 18
B5_01cb:	.db $8f
B5_01cc:	.db $27
B5_01cd:	.db $8f
B5_01ce:		and ($8f), y	; 31 8f
B5_01d0:	.db $3b
B5_01d1:	.db $8f
B5_01d2:	.db $3b
B5_01d3:	.db $8f
B5_01d4:	.db $3b
B5_01d5:	.db $8f
B5_01d6:		eor $8f			; 45 8f
B5_01d8:	.db $4f
B5_01d9:	.db $8f
B5_01da:	.db $4f
B5_01db:	.db $8f
B5_01dc:	.db $4f
B5_01dd:	.db $8f
B5_01de:	.db $4f
B5_01df:	.db $8f
B5_01e0:	.db $4f
B5_01e1:	.db $8f
B5_01e2:		lsr $688f, x	; 5e 8f 68
B5_01e5:	.db $8f
B5_01e6:		pla				; 68
B5_01e7:	.db $8f
B5_01e8:		pla				; 68
B5_01e9:	.db $8f
B5_01ea:		pla				; 68
B5_01eb:	.db $8f
B5_01ec:	.db $77
B5_01ed:	.db $8f
B5_01ee:		adc $858f, x	; 7d 8f 85
B5_01f1:	.db $8f
B5_01f2:		sty $978f		; 8c 8f 97
B5_01f5:	.db $8f
B5_01f6:	.db $a7
B5_01f7:	.db $8f
B5_01f8:		lda $8f, x		; b5 8f
B5_01fa:		lda $8f, x		; b5 8f
B5_01fc:		lda $8f, x		; b5 8f
B5_01fe:		lda $8f, x		; b5 8f


entityOamSpecs:
	.dw $8fb5
	.dw $8fbb
	.dw $8fc3
	.dw $8fca
	.dw $8fd5
	.dw $8fe0
	.dw $8fe6
	.dw $8fec
	.dw $8ff2
	.dw $8ffd
	.dw $9008
	.dw $9013
	.dw $901b
	.dw $9023
	.dw $902e
	.dw $9039
	.dw $9040
	.dw $9047
	.dw $9047
	.dw $904d
	.dw $9059
	.dw $9065
	.dw $9070
	.dw $907b
	.dw $9081
	.dw $9081
	.dw $9081
	.dw $9081
	.dw $9087
	.dw $908d
	.dw $9094
	.dw $909c
	.dw $90a4
	.dw $90aa
	.dw $90b0
	.dw $90bc
	.dw $90cb
	.dw $90da
	.dw $90e9
	.dw $90f8
	.dw $90ff
	.dw $9106
	.dw $910d
	.dw $9114
	.dw $911b
	.dw data_5_1122 // $2d
	.dw data_5_1129
	.dw $9134
	.dw $913b
	.dw $9142
	.dw $9149
	.dw $9150
	.dw $915c
	.dw $9162
	.dw data_5_1168
	.dw data_5_1168 // points to ghost enemy sprites
	.dw $916f
	.dw $9176
	.dw $917d
	.dw $9184
	.dw $9191
	.dw $919e
	.dw $91ab
	.dw $91b8
	.dw $91cd
	.dw $91e2
	.dw $91e9
	.dw $91f0
	.dw $91f7
	.dw $91fe
	.dw $920c
	.dw $9219
	.dw $9227
	.dw $9235
	.dw $9243
	.dw $9250
	.dw $925d
	.dw $926c
	.dw $927b
	.dw $928a
	.dw $92aa
	.dw $92c9
	.dw $92d8
	.dw $92eb
	.dw $92f4
	.dw $92fd
	.dw $9306
	.dw $930d
	.dw $931c
	.dw $9329
	.dw $9338
	.dw $9341
	.dw $9349
	.dw $9351
	.dw $9359
	.dw $9361
	.dw $9367
	.dw $936d
	.dw $937e
	.dw $938f
	.dw $93a0
	.dw $93b1
	.dw $93b9
	.dw $93c1
	.dw $93c8
	.dw $93cf
	.dw $93da
	.dw $93e5
	.dw $93ec
	.dw $93f3
	.dw $9400
	.dw $941f
	.dw $942e
	.dw $943d
	.dw $943d
	.dw $943d
	.dw $944e
	.dw $945f
	.dw $9461
	.dw $9463
	.dw $9465
	.dw $9467
	.dw $9469
	.dw $9478
	.dw $9487
	.dw $949a
	.dw $94a2
	.dw $94aa

data_5_0300:
	.dw $94b2
	.dw $94b9
	.dw $94cd
	.dw $94e1
	.dw $94f5
	.dw $9509
	.dw $951e
	.dw $9524
	.dw $952b
	.dw $9538
	.dw $9547
	.dw $954d
	.dw $9553
	.dw $955a
	.dw $9560
	.dw data_5_1567
B5_0320:		.db $72
B5_0321:		sta $7d, x		; 95 7d
B5_0323:		sta $88, x		; 95 88
B5_0325:		sta $93, x		; 95 93
B5_0327:		sta $a5, x		; 95 a5
B5_0329:		sta $b3, x		; 95 b3
B5_032b:		sta $c1, x		; 95 c1
B5_032d:		sta $cf, x		; 95 cf
B5_032f:		sta $e6, x		; 95 e6
B5_0331:		sta $f8, x		; 95 f8
B5_0333:		sta $fa, x		; 95 fa
B5_0335:		sta $fc, x		; 95 fc
B5_0337:		sta $fe, x		; 95 fe
B5_0339:		sta $00, x		; 95 00
B5_033b:		stx $02, y		; 96 02
B5_033d:		stx $1c, y		; 96 1c
B5_033f:		stx $2e, y		; 96 2e
B5_0341:		stx $3e, y		; 96 3e
B5_0343:		stx $3e, y		; 96 3e
B5_0345:		stx $50, y		; 96 50
B5_0347:		stx $62, y		; 96 62
B5_0349:		stx $74, y		; 96 74
B5_034b:		stx $76, y		; 96 76
B5_034d:		stx $78, y		; 96 78
B5_034f:		stx $7a, y		; 96 7a
B5_0351:		stx $7c, y		; 96 7c
B5_0353:		stx $83, y		; 96 83
B5_0355:		stx $8a, y		; 96 8a
B5_0357:		stx $b4, y		; 96 b4
B5_0359:		stx $c1, y		; 96 c1
B5_035b:		stx $ce, y		; 96 ce
B5_035d:		stx $db, y		; 96 db
B5_035f:		stx $dd, y		; 96 dd
B5_0361:		stx $df, y		; 96 df
B5_0363:		stx $e1, y		; 96 e1
B5_0365:		stx $e3, y		; 96 e3
B5_0367:		stx $ec, y		; 96 ec
B5_0369:		stx $ee, y		; 96 ee
B5_036b:		stx $f0, y		; 96 f0
B5_036d:		stx $f2, y		; 96 f2
B5_036f:		stx $f4, y		; 96 f4
B5_0371:		stx $f6, y		; 96 f6
B5_0373:		stx $f8, y		; 96 f8
B5_0375:		stx $fa, y		; 96 fa
B5_0377:		stx $fc, y		; 96 fc
B5_0379:		stx $fe, y		; 96 fe
B5_037b:		stx $00, y		; 96 00
B5_037d:	.db $97
B5_037e:		asl $97			; 06 97
B5_0380:		asl $1697		; 0e 97 16
B5_0383:	.db $97
B5_0384:		and $97			; 25 97
B5_0386:	.db $34
B5_0387:	.db $97
B5_0388:	.db $3b
B5_0389:	.db $97
B5_038a:		pha				; 48
B5_038b:	.db $97
B5_038c:		eor $97, x		; 55 97
B5_038e:	.db $62
B5_038f:	.db $97
B5_0390:		adc #$97		; 69 97
B5_0392:		bvs B5_032b ; 70 97

B5_0394:		sei				; 78
B5_0395:	.db $97
B5_0396:	.db $80
B5_0397:	.db $97
B5_0398:		dey				; 88
B5_0399:	.db $97
B5_039a:		txs				; 9a
B5_039b:	.db $97
B5_039c:		ldy #$97		; a0 97
B5_039e:		ldx $97			; a6 97
B5_03a0:	.db $af
B5_03a1:	.db $97
B5_03a2:		clv				; b8
B5_03a3:	.db $97
B5_03a4:		cmp $97			; c5 97
B5_03a6:		cmp $d597		; cd 97 d5
B5_03a9:	.db $97
B5_03aa:		cmp $e597, x	; dd 97 e5
B5_03ad:	.db $97
B5_03ae:	.db $f2
B5_03af:	.db $97
B5_03b0:	.db $ff
B5_03b1:	.db $97
B5_03b2:		asl $98			; 06 98
B5_03b4:		ora $1a98		; 0d 98 1a
B5_03b7:		tya				; 98
B5_03b8:	.db $27
B5_03b9:		tya				; 98
B5_03ba:		rol $98, x		; 36 98
B5_03bc:		eor $98			; 45 98
B5_03be:	.db $54
B5_03bf:		tya				; 98
B5_03c0:	.db $5b
B5_03c1:		tya				; 98
B5_03c2:	.db $62
B5_03c3:		tya				; 98
B5_03c4:	.db $6f
B5_03c5:		tya				; 98
B5_03c6:	.db $7c
B5_03c7:		tya				; 98
B5_03c8:		dey				; 88
B5_03c9:		tya				; 98
B5_03ca:		sta $98, x		; 95 98
B5_03cc:		ldx #$98		; a2 98
B5_03ce:	.db $af
B5_03cf:		tya				; 98
B5_03d0:		ldy $c998, x	; bc 98 c9
B5_03d3:		tya				; 98
B5_03d4:		dec $98, x		; d6 98
B5_03d6:	.db $e3
B5_03d7:		tya				; 98
B5_03d8:		;removed
	.db $f0 $98

B5_03da:		asl $99			; 06 99
B5_03dc:	.db $1c
B5_03dd:		sta $9923, y	; 99 23 99
B5_03e0:		rol $4599, x	; 3e 99 45
B5_03e3:		sta $9945, y	; 99 45 99
B5_03e6:		eor $99			; 45 99
B5_03e8:		eor $99			; 45 99
B5_03ea:		eor $99			; 45 99
B5_03ec:		eor $99			; 45 99
B5_03ee:		eor $99			; 45 99
B5_03f0:		eor $99			; 45 99
B5_03f2:		eor $99			; 45 99
B5_03f4:		eor $99			; 45 99
B5_03f6:		eor $99			; 45 99
B5_03f8:		eor $99			; 45 99
B5_03fa:		eor $99			; 45 99
B5_03fc:		eor $99			; 45 99
B5_03fe:		eor $99			; 45 99
B5_0400:	.db $52
B5_0401:		sta $996b, y	; 99 6b 99
B5_0404:		sty $99			; 84 99
B5_0406:		sta $c199, x	; 9d 99 c1
B5_0409:		sta $99e5, y	; 99 e5 99
B5_040c:		inc $1799, x	; fe 99 17
B5_040f:		txs				; 9a


data_5_0410:
B5_0410:		cpy #$02		; c0 02
B5_0412:	.db $02
B5_0413:	.db $f7
B5_0414:	.db $ef
B5_0415:		.db $00				; 00
B5_0416:		ora ($11, x)	; 01 11
B5_0418:	.db $03
B5_0419:	.db $f7
B5_041a:	.db $ff
B5_041b:		.db $00				; 00
B5_041c:	.db $03
B5_041d:	.db $13
B5_041e:		and #$c0		; 29 c0
B5_0420:	.db $02
B5_0421:	.db $02
B5_0422:	.db $f7
B5_0423:		beq B5_0425 ; f0 00

B5_0425:		and ($31, x)	; 21 31
B5_0427:	.db $02
B5_0428:	.db $f7
B5_0429:		.db $00				; 00
B5_042a:		.db $00				; 00
B5_042b:	.db $23
B5_042c:	.db $33


data_5_042d:
	.db $c0 // bit 7 set, do f:15cd to set 1kb bank to $40
	.db $02 // store this in $0f, skip $8400 section

	.db $02 // store in $02
	.db $f7 // store in $04 -> player X
	.db $f0 // add this with $17 (eg $90), store in $03 -> player Y
	.db $00 // store in $05 -> player attr
	.db $05 // tile idx 1
	.db $15 // tile idx 2

	.db $02
	.db $f7
	.db $00
	.db $00
	.db $07 // tile idx 3
	.db $17 // tile idx 4

data_5_043b:
B5_043b:		cpy #$02		; c0 02
B5_043d:	.db $02
B5_043e:	.db $f7
B5_043f:		beq B5_0441 ; f0 00

B5_0441:		and $35			; 25 35
B5_0443:	.db $03
B5_0444:	.db $f7
B5_0445:		.db $00				; 00
B5_0446:		.db $00				; 00
B5_0447:	.db $27
B5_0448:	.db $37
B5_0449:		and $02c0, y	; 39 c0 02
B5_044c:	.db $02
B5_044d:	.db $f7
B5_044e:	.db $ef
B5_044f:		.db $00				; 00
B5_0450:		ora #$19		; 09 19
B5_0452:	.db $03
B5_0453:	.db $f7
B5_0454:	.db $ff
B5_0455:		.db $00				; 00
B5_0456:	.db $0b
B5_0457:	.db $1b
B5_0458:	.db $2b
B5_0459:		cpy #$02		; c0 02
B5_045b:	.db $02
B5_045c:		sed				; f8
B5_045d:		beq B5_045f ; f0 00

B5_045f:		and $033d		; 2d 3d 03
B5_0462:		sbc $00, x		; f5 00
B5_0464:		.db $00				; 00
B5_0465:	.db $1f
B5_0466:	.db $2f
B5_0467:	.db $3f


data_5_0468:
	.db $c0
	.db $02

	.db $02
	.db $f8
	.db $f0
	.db $00
	.db $0d
	.db $1d

	.db $02
	.db $f8
	.db $00
	.db $00
	.db $0f
	.db $3b

data_5_0476:
B5_0476:	.db $c3
B5_0477:	.db $02
B5_0478:	.db $02
B5_0479:		sed				; f8
B5_047a:		beq B5_047c ; f0 00

B5_047c:		and $35			; 25 35
B5_047e:	.db $02
B5_047f:		sed				; f8
B5_0480:		.db $00				; 00
B5_0481:		.db $00				; 00
B5_0482:	.db $27
B5_0483:	.db $37
B5_0484:		cmp ($02, x)	; c1 02
B5_0486:	.db $03
B5_0487:	.db $f4
B5_0488:		beq B5_048a ; f0 00

B5_048a:		ora ($11, x)	; 01 11
B5_048c:		and ($03, x)	; 21 03
B5_048e:	.db $f4
B5_048f:		.db $00				; 00
B5_0490:		.db $00				; 00
B5_0491:	.db $03
B5_0492:	.db $13
B5_0493:	.db $23
B5_0494:		cmp ($02, x)	; c1 02
B5_0496:	.db $02
B5_0497:		sed				; f8
B5_0498:		beq B5_049a ; f0 00

B5_049a:		ora $15			; 05 15
B5_049c:	.db $02
B5_049d:		sed				; f8
B5_049e:		.db $00				; 00
B5_049f:		.db $00				; 00
B5_04a0:	.db $07
B5_04a1:	.db $17



B5_04a2:		cmp ($02, x)	; c1 02
B5_04a4:	.db $02
B5_04a5:		sed				; f8
B5_04a6:		beq B5_04a8 ; f0 00

B5_04a8:		and $35			; 25 35
B5_04aa:	.db $02
B5_04ab:		sed				; f8
B5_04ac:		.db $00				; 00
B5_04ad:		.db $00				; 00
B5_04ae:	.db $27
B5_04af:	.db $37



B5_04b0:		cmp ($02, x)	; c1 02
B5_04b2:	.db $02
B5_04b3:		sed				; f8
B5_04b4:		beq B5_04b6 ; f0 00

B5_04b6:		ora #$19		; 09 19
B5_04b8:	.db $02
B5_04b9:		sed				; f8
B5_04ba:		.db $00				; 00
B5_04bb:		.db $00				; 00
B5_04bc:	.db $0b
B5_04bd:	.db $1b
B5_04be:		cmp ($02, x)	; c1 02
B5_04c0:	.db $02
B5_04c1:		sed				; f8
B5_04c2:		beq B5_04c4 ; f0 00

B5_04c4:		ora $021d		; 0d 1d 02
B5_04c7:		sed				; f8
B5_04c8:		.db $00				; 00
B5_04c9:		.db $00				; 00
B5_04ca:	.db $0f
B5_04cb:	.db $1f
B5_04cc:		dec $02			; c6 02
B5_04ce:	.db $03
B5_04cf:		sbc $f0, x		; f5 f0
B5_04d1:		.db $00				; 00
B5_04d2:	.db $17
B5_04d3:	.db $27
B5_04d4:	.db $37
B5_04d5:	.db $03
B5_04d6:		sbc $00, x		; f5 00
B5_04d8:		.db $00				; 00
B5_04d9:		ora $3929, y	; 19 29 39
B5_04dc:		dec $02			; c6 02
B5_04de:	.db $02
B5_04df:	.db $fc
B5_04e0:		beq B5_04e2 ; f0 00

B5_04e2:		ora ($11, x)	; 01 11
B5_04e4:	.db $03
B5_04e5:		sbc $00, x		; f5 00
B5_04e7:		.db $00				; 00
B5_04e8:		ora $25, x		; 15 25
B5_04ea:		and $c6, x		; 35 c6
B5_04ec:	.db $02
B5_04ed:	.db $02
B5_04ee:	.db $fd $f0 $00
B5_04f1:		and ($31, x)	; 21 31
B5_04f3:	.db $03
B5_04f4:		sbc $00, x		; f5 00
B5_04f6:		.db $00				; 00
B5_04f7:	.db $13
B5_04f8:	.db $23
B5_04f9:	.db $33
B5_04fa:	.db $c7
B5_04fb:	.db $02
B5_04fc:	.db $02
B5_04fd:	.db $f7
B5_04fe:	.db $ef
B5_04ff:		.db $00				; 00
B5_0500:		ora ($11, x)	; 01 11
B5_0502:	.db $03
B5_0503:	.db $f7
B5_0504:	.db $ff
B5_0505:		.db $00				; 00
B5_0506:	.db $03
B5_0507:	.db $13
B5_0508:		and #$c7		; 29 c7
B5_050a:	.db $02
B5_050b:	.db $02
B5_050c:	.db $f7
B5_050d:		beq B5_050f ; f0 00

B5_050f:		and ($31, x)	; 21 31
B5_0511:	.db $02
B5_0512:	.db $f7
B5_0513:		.db $00				; 00
B5_0514:		.db $00				; 00
B5_0515:	.db $23
B5_0516:	.db $33
B5_0517:	.db $c7
B5_0518:	.db $02
B5_0519:	.db $02
B5_051a:	.db $f7
B5_051b:		beq B5_051d ; f0 00

B5_051d:		ora $15			; 05 15
B5_051f:	.db $02
B5_0520:	.db $f7
B5_0521:		.db $00				; 00
B5_0522:		.db $00				; 00
B5_0523:	.db $07
B5_0524:	.db $17
B5_0525:	.db $c7
B5_0526:	.db $02
B5_0527:	.db $02
B5_0528:	.db $f7
B5_0529:		beq B5_052b ; f0 00

B5_052b:		and $35			; 25 35
B5_052d:	.db $03
B5_052e:	.db $f7
B5_052f:		.db $00				; 00
B5_0530:		.db $00				; 00
B5_0531:	.db $27
B5_0532:	.db $37
B5_0533:		and $02c7, y	; 39 c7 02
B5_0536:	.db $02
B5_0537:	.db $f7
B5_0538:	.db $ef
B5_0539:		.db $00				; 00
B5_053a:		ora #$19		; 09 19
B5_053c:	.db $03
B5_053d:	.db $f7
B5_053e:	.db $ff
B5_053f:		.db $00				; 00
B5_0540:	.db $0b
B5_0541:	.db $1b
B5_0542:	.db $2b
B5_0543:	.db $c7
B5_0544:	.db $02
B5_0545:	.db $02
B5_0546:		sed				; f8
B5_0547:		beq B5_0549 ; f0 00

B5_0549:		ora $021d		; 0d 1d 02
B5_054c:		sed				; f8
B5_054d:		.db $00				; 00
B5_054e:		.db $00				; 00
B5_054f:	.db $0f
B5_0550:	.db $1f
B5_0551:	.db $c7
B5_0552:	.db $02
B5_0553:	.db $02
B5_0554:		sed				; f8
B5_0555:		beq B5_0557 ; f0 00

B5_0557:		and $023d		; 2d 3d 02
B5_055a:		sed				; f8
B5_055b:		.db $00				; 00
B5_055c:		.db $00				; 00
B5_055d:	.db $2f
B5_055e:	.db $3f
B5_055f:		cmp ($02, x)	; c1 02
B5_0561:	.db $02
B5_0562:		sed				; f8
B5_0563:		beq B5_0565 ; f0 00

B5_0565:		and #$39		; 29 39
B5_0567:	.db $02
B5_0568:		sed				; f8
B5_0569:		.db $00				; 00
B5_056a:		.db $00				; 00
B5_056b:	.db $2b
B5_056c:	.db $3b
B5_056d:		cmp ($02, x)	; c1 02
B5_056f:	.db $02
B5_0570:		sed				; f8
B5_0571:		beq B5_0573 ; f0 00

B5_0573:		and $023d		; 2d 3d 02
B5_0576:		sed				; f8
B5_0577:		.db $00				; 00
B5_0578:		.db $00				; 00
B5_0579:	.db $2f
B5_057a:	.db $3f
B5_057b:	.db $c3
B5_057c:	.db $03
B5_057d:	.db $02
B5_057e:		sed				; f8
B5_057f:		beq B5_0581 ; f0 00

B5_0581:		and $35			; 25 35
B5_0583:	.db $02
B5_0584:		sed				; f8
B5_0585:		.db $00				; 00
B5_0586:		.db $00				; 00
B5_0587:		ora $0137, y	; 19 37 01
B5_058a:		beq B5_0584 ; f0 f8

B5_058c:		.db $00				; 00
B5_058d:		ora #$c3		; 09 c3
B5_058f:	.db $02
B5_0590:	.db $02
B5_0591:		sed				; f8
B5_0592:		beq B5_0594 ; f0 00

B5_0594:		ora ($11, x)	; 01 11
B5_0596:	.db $02
B5_0597:		sed				; f8
B5_0598:		.db $00				; 00
B5_0599:		.db $00				; 00
B5_059a:	.db $03
B5_059b:	.db $13
B5_059c:	.db $c3
B5_059d:	.db $02
B5_059e:	.db $02
B5_059f:		sed				; f8
B5_05a0:		beq B5_05a2 ; f0 00

B5_05a2:		ora $15			; 05 15
B5_05a4:	.db $02
B5_05a5:		sed				; f8
B5_05a6:		.db $00				; 00
B5_05a7:		.db $00				; 00
B5_05a8:	.db $07
B5_05a9:	.db $17
B5_05aa:	.db $c3
B5_05ab:	.db $02
B5_05ac:	.db $02
B5_05ad:		sed				; f8
B5_05ae:		beq B5_05b0 ; f0 00

B5_05b0:		ora $15			; 05 15
B5_05b2:	.db $02
B5_05b3:		sed				; f8
B5_05b4:		.db $00				; 00
B5_05b5:		.db $00				; 00
B5_05b6:	.db $23
B5_05b7:	.db $33
B5_05b8:	.db $c3
B5_05b9:	.db $02
B5_05ba:		ora ($f8, x)	; 01 f8
B5_05bc:		.db $00				; 00
B5_05bd:		.db $00				; 00
B5_05be:	.db $3b
B5_05bf:		ora ($00, x)	; 01 00
B5_05c1:		.db $00				; 00
B5_05c2:		rti				; 40


B5_05c3:	.db $3b
B5_05c4:	.db $c3
B5_05c5:	.db $02
B5_05c6:		ora ($f8, x)	; 01 f8
B5_05c8:		.db $00				; 00
B5_05c9:		.db $00				; 00
B5_05ca:	.db $3d $01 $00
B5_05cd:		.db $00				; 00
B5_05ce:		rti				; 40


B5_05cf:		and $02c3, x	; 3d c3 02
B5_05d2:		ora ($f8, x)	; 01 f8
B5_05d4:		.db $00				; 00
B5_05d5:		.db $00				; 00
B5_05d6:	.db $3f
B5_05d7:		ora ($00, x)	; 01 00
B5_05d9:		.db $00				; 00
B5_05da:		rti				; 40


B5_05db:	.db $3f
B5_05dc:	.db $c3
B5_05dd:	.db $02
B5_05de:	.db $03
B5_05df:	.db $f4
B5_05e0:		beq B5_05e2 ; f0 00

B5_05e2:	.db $0b
B5_05e3:	.db $1b
B5_05e4:	.db $2b
B5_05e5:	.db $03
B5_05e6:	.db $f4
B5_05e7:		.db $00				; 00
B5_05e8:		.db $00				; 00
B5_05e9:		ora $2d1d		; 0d 1d 2d
B5_05ec:	.db $c3
B5_05ed:	.db $02
B5_05ee:	.db $03
B5_05ef:	.db $f4
B5_05f0:		beq B5_05f2 ; f0 00

B5_05f2:	.db $0b
B5_05f3:	.db $1b
B5_05f4:	.db $2b
B5_05f5:	.db $03
B5_05f6:	.db $f4
B5_05f7:		.db $00				; 00
B5_05f8:		.db $00				; 00
B5_05f9:	.db $0f
B5_05fa:	.db $1f
B5_05fb:	.db $2f
B5_05fc:	.db $c3
B5_05fd:	.db $02
B5_05fe:	.db $03
B5_05ff:	.db $f4
B5_0600:		beq B5_0602 ; f0 00

B5_0602:		ora ($11, x)	; 01 11
B5_0604:		and ($03, x)	; 21 03
B5_0606:	.db $f4
B5_0607:		.db $00				; 00
B5_0608:		.db $00				; 00
B5_0609:	.db $03
B5_060a:		and ($33), y	; 31 33
B5_060c:	.db $c2
B5_060d:	.db $02
B5_060e:	.db $02
B5_060f:	.db $fc
B5_0610:		beq B5_0612 ; f0 00

B5_0612:		and $35			; 25 35
B5_0614:	.db $03
B5_0615:	.db $f4
B5_0616:		.db $00				; 00
B5_0617:		.db $00				; 00
B5_0618:	.db $07
B5_0619:	.db $17
B5_061a:	.db $27

// crouching
data_5_061b:
	.db $c2
	.db $01

	.db $04
	.db $f0
	.db $00
	.db $00
	// tiles
	.db $01
	.db $05
	.db $15
	.db $31


data_5_0625:
B5_0625:	.db $c2
B5_0626:		ora ($04, x)	; 01 04
B5_0628:		beq B5_062a ; f0 00

B5_062a:		.db $00				; 00
B5_062b:	.db $03
B5_062c:	.db $13
B5_062d:	.db $23
B5_062e:	.db $33
B5_062f:	.db $c2
B5_0630:		ora ($04, x)	; 01 04
B5_0632:		beq B5_0634 ; f0 00

B5_0634:		.db $00				; 00
B5_0635:		ora ($11, x)	; 01 11
B5_0637:		and ($31, x)	; 21 31
B5_0639:	.db $c2
B5_063a:	.db $02
B5_063b:	.db $03
B5_063c:	.db $f4
B5_063d:		beq B5_063f ; f0 00

B5_063f:		ora #$19		; 09 19
B5_0641:		and #$03		; 29 03
B5_0643:	.db $f4
B5_0644:		.db $00				; 00
B5_0645:		.db $00				; 00
B5_0646:	.db $1b
B5_0647:	.db $2b
B5_0648:	.db $3b
B5_0649:	.db $c2
B5_064a:		ora ($04, x)	; 01 04
B5_064c:		beq B5_064e ; f0 00

B5_064e:		.db $00				; 00
B5_064f:	.db $0f
B5_0650:	.db $1f
B5_0651:	.db $2f
B5_0652:	.db $3f
B5_0653:		cpy $02			; c4 02
B5_0655:	.db $03
B5_0656:	.db $f4
B5_0657:		beq B5_0659 ; f0 00

B5_0659:		ora ($21), y	; 11 21
B5_065b:		and ($03), y	; 31 03
B5_065d:	.db $f4
B5_065e:		.db $00				; 00
B5_065f:		.db $00				; 00
B5_0660:	.db $13
B5_0661:	.db $23
B5_0662:	.db $33
B5_0663:		cpy $02			; c4 02
B5_0665:	.db $03
B5_0666:	.db $f4
B5_0667:		beq B5_0669 ; f0 00

B5_0669:		ora ($05, x)	; 01 05
B5_066b:		ora $03, x		; 15 03
B5_066d:	.db $f4
B5_066e:		.db $00				; 00
B5_066f:		.db $00				; 00
B5_0670:	.db $03
B5_0671:	.db $07
B5_0672:	.db $17
B5_0673:		cpy $02			; c4 02
B5_0675:	.db $03
B5_0676:		sbc ($f0), y	; f1 f0
B5_0678:		rti				; 40


B5_0679:		and ($21), y	; 31 21
B5_067b:		ora ($03), y	; 11 03
B5_067d:		sbc ($00), y	; f1 00
B5_067f:		rti				; 40


B5_0680:	.db $33
B5_0681:	.db $23
B5_0682:	.db $13
B5_0683:		cmp $02			; c5 02
B5_0685:	.db $02
B5_0686:		sed				; f8
B5_0687:		beq B5_0689 ; f0 00

B5_0689:		and #$39		; 29 39
B5_068b:	.db $03
B5_068c:		sed				; f8
B5_068d:		.db $00				; 00
B5_068e:		.db $00				; 00
B5_068f:	.db $2b
B5_0690:	.db $3b
B5_0691:	.db $37
B5_0692:		cmp $02			; c5 02
B5_0694:	.db $02
B5_0695:	.db $f9 $f0 $00
B5_0698:		ora #$19		; 09 19
B5_069a:	.db $02
B5_069b:	.db $f9 $00 $00
B5_069e:	.db $0b
B5_069f:	.db $1b
B5_06a0:		cmp $02			; c5 02
B5_06a2:	.db $03
B5_06a3:	.db $f4
B5_06a4:		beq B5_06a6 ; f0 00

B5_06a6:		and ($23), y	; 31 23
B5_06a8:	.db $33
B5_06a9:	.db $02
B5_06aa:	.db $fc
B5_06ab:		.db $00				; 00
B5_06ac:		.db $00				; 00
B5_06ad:	.db $03
B5_06ae:	.db $13
B5_06af:		cmp $02			; c5 02
B5_06b1:	.db $03
B5_06b2:	.db $f4
B5_06b3:		beq B5_06b5 ; f0 00

B5_06b5:		ora ($11, x)	; 01 11
B5_06b7:		and ($02, x)	; 21 02
B5_06b9:	.db $fc
B5_06ba:		.db $00				; 00
B5_06bb:		.db $00				; 00
B5_06bc:	.db $03
B5_06bd:	.db $13
B5_06be:		cmp $02			; c5 02
B5_06c0:	.db $03
B5_06c1:	.db $f4
B5_06c2:		beq B5_06c4 ; f0 00

B5_06c4:		ora $15			; 05 15
B5_06c6:		and $03			; 25 03
B5_06c8:	.db $f4
B5_06c9:		.db $00				; 00
B5_06ca:		.db $00				; 00
B5_06cb:	.db $07
B5_06cc:	.db $17
B5_06cd:	.db $27
B5_06ce:		cmp $02			; c5 02
B5_06d0:	.db $02
B5_06d1:	.db $fb
B5_06d2:	.db $f4
B5_06d3:		.db $00				; 00
B5_06d4:		and $023d		; 2d 3d 02
B5_06d7:		sed				; f8
B5_06d8:		.db $00				; 00
B5_06d9:		.db $00				; 00
B5_06da:	.db $0f
B5_06db:	.db $1f
B5_06dc:		cmp $01			; c5 01
B5_06de:	.db $02
B5_06df:		sed				; f8
B5_06e0:		.db $00				; 00
B5_06e1:		.db $00				; 00
B5_06e2:	.db $0f
B5_06e3:	.db $1f
B5_06e4:		ora ($01, x)	; 01 01
B5_06e6:	.db $fc
B5_06e7:		sed				; f8
B5_06e8:		.db $00				; 00
B5_06e9:		adc $0201, x	; 7d 01 02
B5_06ec:	.db $fc
B5_06ed:		sed				; f8
B5_06ee:		.db $00				; 00
B5_06ef:		adc #$79		; 69 79
B5_06f1:	.db $c3
B5_06f2:	.db $02
B5_06f3:	.db $02
B5_06f4:		sed				; f8
B5_06f5:		beq B5_06f7 ; f0 00

B5_06f7:		and $35			; 25 35
B5_06f9:	.db $02
B5_06fa:		sed				; f8
B5_06fb:		.db $00				; 00
B5_06fc:		.db $00				; 00
B5_06fd:		and ($31, x)	; 21 31
B5_06ff:		dec $02			; c6 02
B5_0701:	.db $03
B5_0702:	.db $f4
B5_0703:		beq B5_0705 ; f0 00

B5_0705:	.db $0b
B5_0706:	.db $1b
B5_0707:	.db $2b
B5_0708:	.db $02
B5_0709:	.db $fc
B5_070a:		.db $00				; 00
B5_070b:		.db $00				; 00
B5_070c:	.db $3b
B5_070d:		ora $02d0		; 0d d0 02
B5_0710:	.db $03
B5_0711:	.db $f3
B5_0712:		beq B5_0714 ; f0 00

B5_0714:		ora ($11, x)	; 01 11
B5_0716:		and ($03, x)	; 21 03
B5_0718:	.db $f3
B5_0719:		.db $00				; 00
B5_071a:		.db $00				; 00
B5_071b:	.db $03
B5_071c:	.db $13
B5_071d:	.db $23
B5_071e:		bne B5_0722 ; d0 02

B5_0720:	.db $03
B5_0721:	.db $f3
B5_0722:		beq B5_0724 ; f0 00

B5_0724:		and ($05), y	; 31 05
B5_0726:		ora $03, x		; 15 03
B5_0728:	.db $f3
B5_0729:		.db $00				; 00
B5_072a:		.db $00				; 00
B5_072b:	.db $33
B5_072c:	.db $07
B5_072d:	.db $17
B5_072e:		bne B5_0732 ; d0 02

B5_0730:	.db $03
B5_0731:	.db $f3
B5_0732:		beq B5_0734 ; f0 00

B5_0734:		and $35			; 25 35
B5_0736:		ora #$03		; 09 03
B5_0738:	.db $f3
B5_0739:		.db $00				; 00
B5_073a:		.db $00				; 00
B5_073b:	.db $27
B5_073c:	.db $37
B5_073d:	.db $0b
B5_073e:		bne B5_0742 ; d0 02

B5_0740:	.db $02
B5_0741:	.db $f7
B5_0742:		beq B5_0744 ; f0 00

B5_0744:		ora $021d		; 0d 1d 02
B5_0747:	.db $f7
B5_0748:		.db $00				; 00
B5_0749:		.db $00				; 00
B5_074a:	.db $0f
B5_074b:	.db $1f
B5_074c:		bne B5_0750 ; d0 02

B5_074e:	.db $02
B5_074f:	.db $f7
B5_0750:		beq B5_0752 ; f0 00

B5_0752:		and $023d		; 2d 3d 02
B5_0755:	.db $f7
B5_0756:		.db $00				; 00
B5_0757:		.db $00				; 00
B5_0758:	.db $2f
B5_0759:	.db $3f
B5_075a:		bne B5_075e ; d0 02

B5_075c:	.db $03
B5_075d:	.db $f4
B5_075e:		beq B5_0760 ; f0 00

B5_0760:		ora $3929, y	; 19 29 39
B5_0763:	.db $03
B5_0764:	.db $f4
B5_0765:		.db $00				; 00
B5_0766:		.db $00				; 00
B5_0767:	.db $1b
B5_0768:	.db $2b
B5_0769:	.db $3b
B5_076a:		bne B5_076e ; d0 02

B5_076c:	.db $03
B5_076d:	.db $f4
B5_076e:		beq B5_0770 ; f0 00

B5_0770:		and $35			; 25 35
B5_0772:		ora #$03		; 09 03
B5_0774:	.db $f4
B5_0775:		.db $00				; 00
B5_0776:		.db $00				; 00
B5_0777:	.db $27
B5_0778:	.db $37
B5_0779:	.db $0b
B5_077a:	.db $d3
B5_077b:	.db $04
B5_077c:		ora ($00, x)	; 01 00
B5_077e:		beq B5_0780 ; f0 00

B5_0780:		and ($01), y	; 31 01
B5_0782:		sed				; f8
B5_0783:		beq B5_07c5 ; f0 40

B5_0785:		and ($01), y	; 31 01
B5_0787:		.db $00				; 00
B5_0788:		.db $00				; 00
B5_0789:		.db $00				; 00
B5_078a:	.db $33
B5_078b:		ora ($f8, x)	; 01 f8
B5_078d:		.db $00				; 00
B5_078e:		rti				; 40


B5_078f:	.db $33
B5_0790:		cmp ($02), y	; d1 02
B5_0792:	.db $03
B5_0793:	.db $f4
B5_0794:		beq B5_0796 ; f0 00

B5_0796:		ora ($11, x)	; 01 11
B5_0798:		and ($03, x)	; 21 03
B5_079a:	.db $f4
B5_079b:		.db $00				; 00
B5_079c:		.db $00				; 00
B5_079d:	.db $03
B5_079e:	.db $13
B5_079f:	.db $23
B5_07a0:		cmp ($02), y	; d1 02
B5_07a2:	.db $03
B5_07a3:	.db $f4
B5_07a4:		beq B5_07a6 ; f0 00

B5_07a6:		and ($05), y	; 31 05
B5_07a8:		ora $03, x		; 15 03
B5_07aa:	.db $f4
B5_07ab:		.db $00				; 00
B5_07ac:		.db $00				; 00
B5_07ad:	.db $33
B5_07ae:	.db $07
B5_07af:	.db $17
B5_07b0:		cmp ($02), y	; d1 02
B5_07b2:	.db $02
B5_07b3:	.db $f9 $f0 $00
B5_07b6:		ora #$19		; 09 19
B5_07b8:	.db $03
B5_07b9:	.db $f4
B5_07ba:		.db $00				; 00
B5_07bb:		.db $00				; 00
B5_07bc:	.db $0b
B5_07bd:	.db $1b
B5_07be:	.db $2b
B5_07bf:		cmp ($02), y	; d1 02
B5_07c1:	.db $03
B5_07c2:	.db $f4
B5_07c3:		beq B5_07c5 ; f0 00

B5_07c5:		and $35			; 25 35
B5_07c7:		and #$03		; 29 03
B5_07c9:	.db $f4
B5_07ca:		.db $00				; 00
B5_07cb:		.db $00				; 00
B5_07cc:	.db $27
B5_07cd:	.db $37
B5_07ce:		and $02d2, y	; 39 d2 02
B5_07d1:	.db $03
B5_07d2:	.db $f4
B5_07d3:		beq B5_07d5 ; f0 00

B5_07d5:		ora #$19		; 09 19
B5_07d7:		and #$03		; 29 03
B5_07d9:	.db $f4
B5_07da:		.db $00				; 00
B5_07db:		.db $00				; 00
B5_07dc:	.db $0b
B5_07dd:	.db $1b
B5_07de:	.db $2b
B5_07df:		dec $02, x		; d6 02
B5_07e1:	.db $03
B5_07e2:	.db $f4
B5_07e3:		beq B5_07e5 ; f0 00

B5_07e5:		ora ($11, x)	; 01 11
B5_07e7:		and ($03, x)	; 21 03
B5_07e9:	.db $f4
B5_07ea:		.db $00				; 00
B5_07eb:		.db $00				; 00
B5_07ec:	.db $03
B5_07ed:	.db $13
B5_07ee:	.db $23
B5_07ef:		dec $02, x		; d6 02
B5_07f1:	.db $03
B5_07f2:	.db $f7
B5_07f3:		beq B5_07f5 ; f0 00

B5_07f5:		and ($05), y	; 31 05
B5_07f7:		ora $03, x		; 15 03
B5_07f9:	.db $f7
B5_07fa:		.db $00				; 00
B5_07fb:		.db $00				; 00
B5_07fc:	.db $33
B5_07fd:	.db $07
B5_07fe:	.db $17
B5_07ff:		dec $02, x		; d6 02
B5_0801:	.db $03
B5_0802:	.db $f7
B5_0803:		beq B5_0805 ; f0 00

B5_0805:		and $35			; 25 35
B5_0807:		ora #$03		; 09 03
B5_0809:	.db $f7
B5_080a:		.db $00				; 00
B5_080b:		.db $00				; 00
B5_080c:	.db $27
B5_080d:	.db $37
B5_080e:	.db $0b
B5_080f:	.db $d7
B5_0810:	.db $02
B5_0811:	.db $03
B5_0812:	.db $f3
B5_0813:		beq B5_0815 ; f0 00

B5_0815:		ora ($11, x)	; 01 11
B5_0817:		and ($03, x)	; 21 03
B5_0819:	.db $f3
B5_081a:		.db $00				; 00
B5_081b:		.db $00				; 00
B5_081c:	.db $03
B5_081d:	.db $13
B5_081e:	.db $23
B5_081f:	.db $d7
B5_0820:	.db $02
B5_0821:	.db $03
B5_0822:	.db $f3
B5_0823:		beq B5_0825 ; f0 00

B5_0825:		and ($05), y	; 31 05
B5_0827:		ora $03, x		; 15 03
B5_0829:	.db $f3
B5_082a:		.db $00				; 00
B5_082b:		.db $00				; 00
B5_082c:	.db $33
B5_082d:	.db $07
B5_082e:	.db $17
B5_082f:	.db $d7
B5_0830:	.db $02
B5_0831:	.db $03
B5_0832:	.db $f3
B5_0833:		beq B5_0835 ; f0 00

B5_0835:		and $35			; 25 35
B5_0837:		ora #$03		; 09 03
B5_0839:	.db $f3
B5_083a:		.db $00				; 00
B5_083b:		.db $00				; 00
B5_083c:	.db $27
B5_083d:	.db $37
B5_083e:	.db $0b
B5_083f:	.db $d7
B5_0840:	.db $02
B5_0841:	.db $03
B5_0842:	.db $f3
B5_0843:		beq B5_0845 ; f0 00

B5_0845:		and ($05), y	; 31 05
B5_0847:		ora $f303		; 0d 03 f3
B5_084a:		.db $00				; 00
B5_084b:		.db $00				; 00
B5_084c:	.db $33
B5_084d:	.db $07
B5_084e:	.db $0f
B5_084f:	.db $d7
B5_0850:	.db $02
B5_0851:	.db $03
B5_0852:	.db $f3
B5_0853:		beq B5_0855 ; f0 00

B5_0855:		ora ($11, x)	; 01 11
B5_0857:		ora $f303, x	; 1d 03 f3
B5_085a:		.db $00				; 00
B5_085b:		.db $00				; 00
B5_085c:	.db $03
B5_085d:	.db $13
B5_085e:	.db $1f
B5_085f:	.db $d7
B5_0860:	.db $02
B5_0861:	.db $03
B5_0862:	.db $f4
B5_0863:		beq B5_0865 ; f0 00

B5_0865:		ora $3929, y	; 19 29 39
B5_0868:	.db $03
B5_0869:	.db $f4
B5_086a:		.db $00				; 00
B5_086b:		.db $00				; 00
B5_086c:	.db $03
B5_086d:	.db $13
B5_086e:	.db $1f
B5_086f:	.db $d7
B5_0870:	.db $03
B5_0871:	.db $02
B5_0872:	.db $fc
B5_0873:		beq B5_0875 ; f0 00

B5_0875:		and $023d		; 2d 3d 02
B5_0878:	.db $fc
B5_0879:		.db $00				; 00
B5_087a:		.db $00				; 00
B5_087b:	.db $2f
B5_087c:	.db $3f
B5_087d:		ora ($f4, x)	; 01 f4
B5_087f:		sed				; f8
B5_0880:		.db $00				; 00
B5_0881:	.db $3b
B5_0882:	.db $d7
B5_0883:		ora ($02, x)	; 01 02
B5_0885:		sed				; f8
B5_0886:		.db $00				; 00
B5_0887:		.db $00				; 00
B5_0888:	.db $1b
B5_0889:	.db $2b
B5_088a:	.db $d3
B5_088b:	.db $02
B5_088c:	.db $03
B5_088d:	.db $f4
B5_088e:		beq B5_0890 ; f0 00

B5_0890:		ora ($11, x)	; 01 11
B5_0892:		and ($03, x)	; 21 03
B5_0894:	.db $f4
B5_0895:		.db $00				; 00
B5_0896:		.db $00				; 00
B5_0897:	.db $03
B5_0898:	.db $13
B5_0899:	.db $23
B5_089a:	.db $d3
B5_089b:	.db $02
B5_089c:	.db $03
B5_089d:	.db $f4
B5_089e:		beq B5_08a0 ; f0 00

B5_08a0:		ora #$19		; 09 19
B5_08a2:		and #$03		; 29 03
B5_08a4:	.db $f4
B5_08a5:		.db $00				; 00
B5_08a6:		.db $00				; 00
B5_08a7:	.db $0b
B5_08a8:	.db $1b
B5_08a9:	.db $2b
B5_08aa:	.db $d3
B5_08ab:		ora ($02, x)	; 01 02
B5_08ad:		sed				; f8
B5_08ae:		sed				; f8
B5_08af:		.db $00				; 00
B5_08b0:		and $37, x		; 35 37
B5_08b2:	.db $d3
B5_08b3:		ora ($02, x)	; 01 02
B5_08b5:		sed				; f8
B5_08b6:		sed				; f8
B5_08b7:		.db $00				; 00
B5_08b8:		and $d33b, y	; 39 3b d3
B5_08bb:		ora ($01, x)	; 01 01
B5_08bd:	.db $fc
B5_08be:		sed				; f8
B5_08bf:		.db $00				; 00
B5_08c0:		and $01d3, x	; 3d d3 01
B5_08c3:		ora ($fc, x)	; 01 fc
B5_08c5:		sed				; f8
B5_08c6:		.db $00				; 00
B5_08c7:	.db $3f
B5_08c8:	.db $d3
B5_08c9:	.db $02
B5_08ca:	.db $03
B5_08cb:	.db $f4
B5_08cc:		beq B5_08ce ; f0 00

B5_08ce:		ora #$19		; 09 19
B5_08d0:		and #$03		; 29 03
B5_08d2:	.db $f4
B5_08d3:		.db $00				; 00
B5_08d4:		.db $00				; 00
B5_08d5:	.db $0b
B5_08d6:	.db $1b
B5_08d7:	.db $2b
B5_08d8:	.db $d3
B5_08d9:	.db $02
B5_08da:	.db $03
B5_08db:	.db $f4
B5_08dc:		beq B5_08de ; f0 00

B5_08de:		ora $2d1d		; 0d 1d 2d
B5_08e1:	.db $03
B5_08e2:	.db $f4
B5_08e3:		.db $00				; 00
B5_08e4:		.db $00				; 00
B5_08e5:	.db $0f
B5_08e6:	.db $1f
B5_08e7:	.db $2f
B5_08e8:	.db $d2
B5_08e9:	.db $02
B5_08ea:	.db $03
B5_08eb:	.db $f4
B5_08ec:		beq B5_08ee ; f0 00

B5_08ee:	.db $07
B5_08ef:		and $35			; 25 35
B5_08f1:	.db $03
B5_08f2:	.db $f4
B5_08f3:		.db $00				; 00
B5_08f4:		.db $00				; 00
B5_08f5:	.db $17
B5_08f6:	.db $27
B5_08f7:	.db $37
B5_08f8:		cmp ($02), y	; d1 02
B5_08fa:	.db $02
B5_08fb:	.db $f4
B5_08fc:		beq B5_08fe ; f0 00

B5_08fe:		ora $021d		; 0d 1d 02
B5_0901:	.db $f4
B5_0902:		.db $00				; 00
B5_0903:		.db $00				; 00
B5_0904:	.db $0f
B5_0905:	.db $1f
B5_0906:		cmp ($02), y	; d1 02
B5_0908:	.db $03
B5_0909:		beq B5_08fb ; f0 f0

B5_090b:		.db $00				; 00
B5_090c:		and $3b3d		; 2d 3d 3b
B5_090f:	.db $02
B5_0910:		beq B5_0912 ; f0 00

B5_0912:		.db $00				; 00
B5_0913:	.db $2f
B5_0914:	.db $3f
B5_0915:	.db $d3
B5_0916:	.db $02
B5_0917:	.db $03
B5_0918:	.db $f4
B5_0919:		beq B5_091b ; f0 00

B5_091b:		ora $15			; 05 15
B5_091d:		and $03			; 25 03
B5_091f:	.db $f4
B5_0920:		.db $00				; 00
B5_0921:		.db $00				; 00
B5_0922:	.db $07
B5_0923:	.db $17
B5_0924:	.db $27
B5_0925:	.db $d4
B5_0926:	.db $02
B5_0927:	.db $03
B5_0928:	.db $f2
B5_0929:		beq B5_092b ; f0 00

B5_092b:		ora ($11, x)	; 01 11
B5_092d:		and ($02, x)	; 21 02
B5_092f:	.db $fa
B5_0930:		.db $00				; 00
B5_0931:		.db $00				; 00
B5_0932:	.db $13
B5_0933:	.db $23
B5_0934:	.db $d4
B5_0935:	.db $02
B5_0936:	.db $03
B5_0937:	.db $f2
B5_0938:		beq B5_093a ; f0 00

B5_093a:		ora $25, x		; 15 25
B5_093c:		and $03, x		; 35 03
B5_093e:	.db $f2
B5_093f:		.db $00				; 00
B5_0940:		.db $00				; 00
B5_0941:	.db $17
B5_0942:	.db $27
B5_0943:	.db $37
B5_0944:	.db $d4
B5_0945:	.db $02
B5_0946:	.db $03
B5_0947:		inc $f0, x		; f6 f0
B5_0949:		rti				; 40


B5_094a:		and ($11, x)	; 21 11
B5_094c:		ora ($02, x)	; 01 02
B5_094e:		inc $00, x		; f6 00
B5_0950:		rti				; 40


B5_0951:	.db $23
B5_0952:	.db $13
B5_0953:	.db $d3
B5_0954:	.db $02
B5_0955:	.db $03
B5_0956:	.db $f4
B5_0957:		beq B5_0959 ; f0 00

B5_0959:		ora #$19		; 09 19
B5_095b:		and #$03		; 29 03
B5_095d:	.db $f4
B5_095e:		.db $00				; 00
B5_095f:		.db $00				; 00
B5_0960:	.db $0b
B5_0961:	.db $1b
B5_0962:	.db $2b
B5_0963:	.db $d2
B5_0964:		ora ($04, x)	; 01 04
B5_0966:		beq B5_0968 ; f0 00

B5_0968:		.db $00				; 00
B5_0969:	.db $0f
B5_096a:	.db $1f
B5_096b:	.db $2f
B5_096c:	.db $3f
B5_096d:		cmp $02, x		; d5 02
B5_096f:	.db $03
B5_0970:	.db $f4
B5_0971:		beq B5_0973 ; f0 00

B5_0973:		ora $3d2d, x	; 1d 2d 3d
B5_0976:	.db $03
B5_0977:	.db $f4
B5_0978:		.db $00				; 00
B5_0979:		.db $00				; 00
B5_097a:	.db $1f
B5_097b:	.db $2f
B5_097c:	.db $3f
B5_097d:		cmp $02, x		; d5 02
B5_097f:	.db $04
B5_0980:	.db $ec $f0 $00
B5_0983:		and $35			; 25 35
B5_0985:		and $033d		; 2d 3d 03
B5_0988:	.db $f4
B5_0989:		.db $00				; 00
B5_098a:		.db $00				; 00
B5_098b:	.db $27
B5_098c:	.db $37
B5_098d:	.db $3f
B5_098e:		cmp $02, x		; d5 02
B5_0990:	.db $04
B5_0991:	.db $ec $f0 $00
B5_0994:		and $35			; 25 35
B5_0996:		and $033d		; 2d 3d 03
B5_0999:	.db $f4
B5_099a:		.db $00				; 00
B5_099b:		.db $00				; 00
B5_099c:	.db $27
B5_099d:	.db $37
B5_099e:	.db $3f
B5_099f:		cmp $02, x		; d5 02
B5_09a1:	.db $03
B5_09a2:	.db $f4
B5_09a3:		beq B5_09a5 ; f0 00

B5_09a5:		ora ($11, x)	; 01 11
B5_09a7:		and ($03, x)	; 21 03
B5_09a9:	.db $f4
B5_09aa:		.db $00				; 00
B5_09ab:		.db $00				; 00
B5_09ac:	.db $03
B5_09ad:	.db $13
B5_09ae:	.db $23
B5_09af:		cmp $02, x		; d5 02
B5_09b1:	.db $03
B5_09b2:	.db $f4
B5_09b3:		beq B5_09b5 ; f0 00

B5_09b5:		and ($05), y	; 31 05
B5_09b7:		ora $03, x		; 15 03
B5_09b9:	.db $f4
B5_09ba:		.db $00				; 00
B5_09bb:		.db $00				; 00
B5_09bc:	.db $33
B5_09bd:	.db $07
B5_09be:	.db $17
B5_09bf:		cmp $02, x		; d5 02
B5_09c1:	.db $03
B5_09c2:	.db $f4
B5_09c3:		beq B5_09c5 ; f0 00

B5_09c5:		ora $3929, y	; 19 29 39
B5_09c8:	.db $03
B5_09c9:	.db $f4
B5_09ca:		.db $00				; 00
B5_09cb:		.db $00				; 00
B5_09cc:	.db $1b
B5_09cd:	.db $2b
B5_09ce:	.db $3b
B5_09cf:	.db $d4
B5_09d0:	.db $02
B5_09d1:	.db $03
B5_09d2:	.db $f4
B5_09d3:		beq B5_09d5 ; f0 00

B5_09d5:		ora $3929, y	; 19 29 39
B5_09d8:	.db $03
B5_09d9:	.db $f4
B5_09da:		.db $00				; 00
B5_09db:		.db $00				; 00
B5_09dc:	.db $1b
B5_09dd:	.db $2b
B5_09de:	.db $3b
B5_09df:		ora ($02, x)	; 01 02
B5_09e1:		sed				; f8
B5_09e2:		sed				; f8
B5_09e3:		.db $00				; 00
B5_09e4:	.db $4f
B5_09e5:	.db $4f
B5_09e6:		cmp $02, x		; d5 02
B5_09e8:	.db $03
B5_09e9:	.db $f4
B5_09ea:		beq B5_09ec ; f0 00

B5_09ec:		ora $3d2d, x	; 1d 2d 3d
B5_09ef:	.db $03
B5_09f0:	.db $f4
B5_09f1:		.db $00				; 00
B5_09f2:		.db $00				; 00
B5_09f3:	.db $1f
B5_09f4:	.db $2f
B5_09f5:	.db $3f
B5_09f6:		cmp ($02), y	; d1 02
B5_09f8:	.db $03
B5_09f9:	.db $f4
B5_09fa:		beq B5_09fc ; f0 00

B5_09fc:		ora ($11, x)	; 01 11
B5_09fe:		and ($03, x)	; 21 03
B5_0a00:	.db $f4
B5_0a01:		.db $00				; 00
B5_0a02:		.db $00				; 00
B5_0a03:	.db $03
B5_0a04:	.db $13
B5_0a05:	.db $23
B5_0a06:	.db $d4
B5_0a07:		ora ($04, x)	; 01 04
B5_0a09:		beq B5_0a0b ; f0 00

B5_0a0b:		.db $00				; 00
B5_0a0c:		ora #$07		; 09 07
B5_0a0e:		ora $03			; 05 03
B5_0a10:		dec $01, x		; d6 01
B5_0a12:	.db $04
B5_0a13:		beq B5_0a15 ; f0 00

B5_0a15:		.db $00				; 00
B5_0a16:	.db $2f
B5_0a17:	.db $3f
B5_0a18:		and $d63d		; 2d 3d d6
B5_0a1b:	.db $02
B5_0a1c:	.db $02
B5_0a1d:		sed				; f8
B5_0a1e:		beq B5_0a20 ; f0 00

B5_0a20:		ora $021d		; 0d 1d 02
B5_0a23:		sed				; f8
B5_0a24:		.db $00				; 00
B5_0a25:		.db $00				; 00
B5_0a26:	.db $0f
B5_0a27:	.db $1f
B5_0a28:		cld				; d8
B5_0a29:	.db $02
B5_0a2a:	.db $03
B5_0a2b:	.db $f3
B5_0a2c:		beq B5_0a2e ; f0 00

B5_0a2e:		ora ($11, x)	; 01 11
B5_0a30:		and ($03, x)	; 21 03
B5_0a32:	.db $f3
B5_0a33:		.db $00				; 00
B5_0a34:		.db $00				; 00
B5_0a35:	.db $03
B5_0a36:	.db $13
B5_0a37:	.db $23
B5_0a38:		cld				; d8
B5_0a39:	.db $02
B5_0a3a:	.db $02
B5_0a3b:		sed				; f8
B5_0a3c:		beq B5_0a3e ; f0 00

B5_0a3e:		and ($05), y	; 31 05
B5_0a40:	.db $03
B5_0a41:		beq B5_0a43 ; f0 00

B5_0a43:		.db $00				; 00
B5_0a44:		and $0733, x	; 3d 33 07
B5_0a47:		cld				; d8
B5_0a48:	.db $02
B5_0a49:	.db $02
B5_0a4a:		sed				; f8
B5_0a4b:		beq B5_0a4d ; f0 00

B5_0a4d:		ora $25, x		; 15 25
B5_0a4f:	.db $02
B5_0a50:		sed				; f8
B5_0a51:		.db $00				; 00
B5_0a52:		.db $00				; 00
B5_0a53:	.db $17
B5_0a54:	.db $27
B5_0a55:		cld				; d8
B5_0a56:	.db $02
B5_0a57:	.db $02
B5_0a58:		sed				; f8
B5_0a59:		beq B5_0a5b ; f0 00

B5_0a5b:		and $09, x		; 35 09
B5_0a5d:	.db $02
B5_0a5e:		sed				; f8
B5_0a5f:		.db $00				; 00
B5_0a60:		.db $00				; 00
B5_0a61:	.db $37
B5_0a62:	.db $0b
B5_0a63:		cld				; d8
B5_0a64:	.db $02
B5_0a65:	.db $03
B5_0a66:	.db $f3
B5_0a67:		beq B5_0a69 ; f0 00

B5_0a69:		ora $3929, y	; 19 29 39
B5_0a6c:	.db $03
B5_0a6d:	.db $f3
B5_0a6e:		.db $00				; 00
B5_0a6f:		.db $00				; 00
B5_0a70:	.db $1b
B5_0a71:	.db $2b
B5_0a72:	.db $3b
B5_0a73:		cld				; d8
B5_0a74:	.db $02
B5_0a75:	.db $03
B5_0a76:	.db $f4
B5_0a77:		beq B5_0a79 ; f0 00

B5_0a79:		ora $2d1d		; 0d 1d 2d
B5_0a7c:	.db $02
B5_0a7d:	.db $f4
B5_0a7e:		.db $00				; 00
B5_0a7f:		.db $00				; 00
B5_0a80:	.db $0f
B5_0a81:	.db $1f
B5_0a82:		cld				; d8
B5_0a83:	.db $02
B5_0a84:	.db $02
B5_0a85:		sed				; f8
B5_0a86:		beq B5_0a88 ; f0 00

B5_0a88:	.db $2f
B5_0a89:	.db $3f
B5_0a8a:	.db $02
B5_0a8b:		sed				; f8
B5_0a8c:		.db $00				; 00
B5_0a8d:		.db $00				; 00
B5_0a8e:	.db $17
B5_0a8f:	.db $27
B5_0a90:	.db $db
B5_0a91:	.db $02
B5_0a92:	.db $02
B5_0a93:		sed				; f8
B5_0a94:		beq B5_0a96 ; f0 00

B5_0a96:		and $35			; 25 35
B5_0a98:	.db $03
B5_0a99:	.db $f4
B5_0a9a:		.db $00				; 00
B5_0a9b:		.db $00				; 00
B5_0a9c:	.db $17
B5_0a9d:	.db $27
B5_0a9e:	.db $37
B5_0a9f:		cmp $0302, y	; d9 02 03
B5_0aa2:	.db $f4
B5_0aa3:		beq B5_0aa5 ; f0 00

B5_0aa5:		ora ($11, x)	; 01 11
B5_0aa7:		and ($03, x)	; 21 03
B5_0aa9:	.db $f4
B5_0aaa:		.db $00				; 00
B5_0aab:		.db $00				; 00
B5_0aac:	.db $03
B5_0aad:	.db $13
B5_0aae:	.db $23
B5_0aaf:		cmp $0302, y	; d9 02 03
B5_0ab2:	.db $f4
B5_0ab3:		beq B5_0ab5 ; f0 00

B5_0ab5:		ora $15			; 05 15
B5_0ab7:		and $03			; 25 03
B5_0ab9:	.db $f4
B5_0aba:		.db $00				; 00
B5_0abb:		.db $00				; 00
B5_0abc:	.db $07
B5_0abd:	.db $17
B5_0abe:	.db $27
B5_0abf:		cmp $0202, y	; d9 02 02
B5_0ac2:	.db $f9 $f0 $00
B5_0ac5:		and $09, x		; 35 09
B5_0ac7:	.db $02
B5_0ac8:	.db $f9 $00 $00
B5_0acb:	.db $37
B5_0acc:	.db $0b
B5_0acd:		cmp $0302, y	; d9 02 03
B5_0ad0:	.db $f4
B5_0ad1:		beq B5_0ad3 ; f0 00

B5_0ad3:		ora $1d0d, y	; 19 0d 1d
B5_0ad6:	.db $03
B5_0ad7:	.db $f4
B5_0ad8:		.db $00				; 00
B5_0ad9:		.db $00				; 00
B5_0ada:	.db $1b
B5_0adb:	.db $0f
B5_0adc:	.db $1f
B5_0add:	.db $da
B5_0ade:	.db $02
B5_0adf:	.db $02
B5_0ae0:	.db $fc
B5_0ae1:		beq B5_0ae3 ; f0 00

B5_0ae3:		and $033d		; 2d 3d 03
B5_0ae6:	.db $f4
B5_0ae7:		.db $00				; 00
B5_0ae8:		.db $00				; 00
B5_0ae9:	.db $1f
B5_0aea:	.db $2f
B5_0aeb:	.db $3f
B5_0aec:		cmp $0302, x	; dd 02 03
B5_0aef:	.db $f4
B5_0af0:		beq B5_0af2 ; f0 00

B5_0af2:		ora ($11, x)	; 01 11
B5_0af4:		and ($03, x)	; 21 03
B5_0af6:	.db $f4
B5_0af7:		.db $00				; 00
B5_0af8:		.db $00				; 00
B5_0af9:	.db $03
B5_0afa:	.db $13
B5_0afb:	.db $23
B5_0afc:		cmp $0302, x	; dd 02 03
B5_0aff:	.db $f7
B5_0b00:		beq B5_0b02 ; f0 00

B5_0b02:		and ($05), y	; 31 05
B5_0b04:		ora $03, x		; 15 03
B5_0b06:	.db $f7
B5_0b07:		.db $00				; 00
B5_0b08:		.db $00				; 00
B5_0b09:	.db $33
B5_0b0a:	.db $07
B5_0b0b:	.db $17
B5_0b0c:		cmp $0302, x	; dd 02 03
B5_0b0f:	.db $f7
B5_0b10:		beq B5_0b12 ; f0 00

B5_0b12:		and $35			; 25 35
B5_0b14:		ora #$03		; 09 03
B5_0b16:	.db $f7
B5_0b17:		.db $00				; 00
B5_0b18:		.db $00				; 00
B5_0b19:	.db $27
B5_0b1a:	.db $37
B5_0b1b:	.db $0b
B5_0b1c:		dec $0302, x	; de 02 03
B5_0b1f:	.db $f3
B5_0b20:		beq B5_0b22 ; f0 00

B5_0b22:		ora ($11, x)	; 01 11
B5_0b24:		and ($03, x)	; 21 03
B5_0b26:	.db $f3
B5_0b27:		.db $00				; 00
B5_0b28:		.db $00				; 00
B5_0b29:	.db $03
B5_0b2a:	.db $13
B5_0b2b:	.db $23
B5_0b2c:		dec $0202, x	; de 02 02
B5_0b2f:		sed				; f8
B5_0b30:		beq B5_0b32 ; f0 00

B5_0b32:		and ($05), y	; 31 05
B5_0b34:	.db $03
B5_0b35:		beq B5_0b37 ; f0 00

B5_0b37:		.db $00				; 00
B5_0b38:		and $0733, x	; 3d 33 07
B5_0b3b:		dec $0203, x	; de 03 02
B5_0b3e:		sed				; f8
B5_0b3f:		beq B5_0b41 ; f0 00

B5_0b41:		ora $25, x		; 15 25
B5_0b43:	.db $02
B5_0b44:		sed				; f8
B5_0b45:		.db $00				; 00
B5_0b46:		.db $00				; 00
B5_0b47:	.db $17
B5_0b48:	.db $27
B5_0b49:		ora ($f0, x)	; 01 f0
B5_0b4b:		ora ($00, x)	; 01 00
B5_0b4d:		and $03de, x	; 3d de 03
B5_0b50:	.db $02
B5_0b51:		sed				; f8
B5_0b52:		beq B5_0b54 ; f0 00

B5_0b54:		and $09, x		; 35 09
B5_0b56:	.db $02
B5_0b57:		sed				; f8
B5_0b58:		.db $00				; 00
B5_0b59:		.db $00				; 00
B5_0b5a:	.db $37
B5_0b5b:	.db $0b
B5_0b5c:		ora ($f0, x)	; 01 f0
B5_0b5e:		.db $00				; 00
B5_0b5f:		.db $00				; 00
B5_0b60:		and $02de, x	; 3d de 02
B5_0b63:	.db $03
B5_0b64:	.db $f3
B5_0b65:		beq B5_0b67 ; f0 00

B5_0b67:		ora $3929, y	; 19 29 39
B5_0b6a:	.db $03
B5_0b6b:	.db $f3
B5_0b6c:		.db $00				; 00
B5_0b6d:		.db $00				; 00
B5_0b6e:	.db $1b
B5_0b6f:	.db $2b
B5_0b70:	.db $3b
B5_0b71:	.db $dc
B5_0b72:	.db $02
B5_0b73:	.db $03
B5_0b74:	.db $f4
B5_0b75:		beq B5_0b77 ; f0 00

B5_0b77:		ora ($11, x)	; 01 11
B5_0b79:		and $f403, y	; 39 03 f4
B5_0b7c:		.db $00				; 00
B5_0b7d:		.db $00				; 00
B5_0b7e:	.db $03
B5_0b7f:	.db $13
B5_0b80:	.db $3b
B5_0b81:		dec $0202, x	; de 02 02
B5_0b84:		sed				; f8
B5_0b85:		beq B5_0b87 ; f0 00

B5_0b87:	.db $0f
B5_0b88:	.db $1f
B5_0b89:	.db $03
B5_0b8a:	.db $f4
B5_0b8b:		.db $00				; 00
B5_0b8c:		.db $00				; 00
B5_0b8d:		ora $2d1d		; 0d 1d 2d
B5_0b90:		cmp $0202, y	; d9 02 02
B5_0b93:		sed				; f8
B5_0b94:		beq B5_0b96 ; f0 00

B5_0b96:		and #$39		; 29 39
B5_0b98:	.db $02
B5_0b99:		sed				; f8
B5_0b9a:		.db $00				; 00
B5_0b9b:		.db $00				; 00
B5_0b9c:	.db $2b
B5_0b9d:	.db $3b
B5_0b9e:		cmp $0202, y	; d9 02 02
B5_0ba1:		sed				; f8
B5_0ba2:		beq B5_0ba4 ; f0 00

B5_0ba4:		and $023d		; 2d 3d 02
B5_0ba7:		sed				; f8
B5_0ba8:		.db $00				; 00
B5_0ba9:		.db $00				; 00
B5_0baa:	.db $2f
B5_0bab:	.db $3f
B5_0bac:	.db $db
B5_0bad:	.db $02
B5_0bae:	.db $02
B5_0baf:		sed				; f8
B5_0bb0:		beq B5_0bb2 ; f0 00

B5_0bb2:		and #$39		; 29 39
B5_0bb4:	.db $02
B5_0bb5:		sed				; f8
B5_0bb6:		.db $00				; 00
B5_0bb7:		.db $00				; 00
B5_0bb8:	.db $2b
B5_0bb9:	.db $3b
B5_0bba:	.db $db
B5_0bbb:	.db $02
B5_0bbc:	.db $02
B5_0bbd:		sed				; f8
B5_0bbe:		beq B5_0bc0 ; f0 00

B5_0bc0:		ora ($11, x)	; 01 11
B5_0bc2:	.db $02
B5_0bc3:		sed				; f8
B5_0bc4:		.db $00				; 00
B5_0bc5:		.db $00				; 00
B5_0bc6:	.db $03
B5_0bc7:	.db $13
B5_0bc8:	.db $db
B5_0bc9:	.db $02
B5_0bca:	.db $02
B5_0bcb:		sed				; f8
B5_0bcc:		beq B5_0bce ; f0 00

B5_0bce:		and $35			; 25 35
B5_0bd0:	.db $03
B5_0bd1:	.db $f4
B5_0bd2:		.db $00				; 00
B5_0bd3:		.db $00				; 00
B5_0bd4:		and ($31, x)	; 21 31
B5_0bd6:	.db $33
B5_0bd7:	.db $db
B5_0bd8:	.db $02
B5_0bd9:	.db $02
B5_0bda:		sed				; f8
B5_0bdb:		beq B5_0bdd ; f0 00

B5_0bdd:		and $35			; 25 35
B5_0bdf:	.db $03
B5_0be0:	.db $f4
B5_0be1:		.db $00				; 00
B5_0be2:		.db $00				; 00
B5_0be3:		and ($23, x)	; 21 23
B5_0be5:	.db $33
B5_0be6:	.db $db
B5_0be7:	.db $02
B5_0be8:	.db $02
B5_0be9:		sed				; f8
B5_0bea:		beq B5_0bec ; f0 00

B5_0bec:		and $35			; 25 35
B5_0bee:	.db $03
B5_0bef:	.db $f4
B5_0bf0:		.db $00				; 00
B5_0bf1:		.db $00				; 00
B5_0bf2:		and ($05, x)	; 21 05
B5_0bf4:	.db $33
B5_0bf5:	.db $db
B5_0bf6:	.db $02
B5_0bf7:	.db $02
B5_0bf8:		sed				; f8
B5_0bf9:		beq B5_0bfb ; f0 00

B5_0bfb:		and $35			; 25 35
B5_0bfd:	.db $03
B5_0bfe:	.db $f4
B5_0bff:		.db $00				; 00
B5_0c00:		.db $00				; 00
B5_0c01:		ora $2d1d		; 0d 1d 2d
B5_0c04:	.db $da
B5_0c05:	.db $02
B5_0c06:	.db $02
B5_0c07:		sed				; f8
B5_0c08:		beq B5_0c0a ; f0 00

B5_0c0a:		and $033d		; 2d 3d 03
B5_0c0d:	.db $f4
B5_0c0e:		.db $00				; 00
B5_0c0f:		.db $00				; 00
B5_0c10:	.db $1f
B5_0c11:	.db $2f
B5_0c12:	.db $3f
B5_0c13:	.db $db
B5_0c14:		ora ($04, x)	; 01 04
B5_0c16:		beq B5_0c18 ; f0 00

B5_0c18:		.db $00				; 00
B5_0c19:	.db $0f
B5_0c1a:	.db $1f
B5_0c1b:	.db $2f
B5_0c1c:	.db $3f
B5_0c1d:	.db $db
B5_0c1e:		ora ($04, x)	; 01 04
B5_0c20:		beq B5_0c22 ; f0 00

B5_0c22:		.db $00				; 00
B5_0c23:	.db $0f
B5_0c24:	.db $1f
B5_0c25:	.db $2f
B5_0c26:		and $02d9, x	; 3d d9 02
B5_0c29:	.db $03
B5_0c2a:	.db $f4
B5_0c2b:		beq B5_0c2d ; f0 00

B5_0c2d:		ora ($11, x)	; 01 11
B5_0c2f:		and ($03, x)	; 21 03
B5_0c31:	.db $f4
B5_0c32:		.db $00				; 00
B5_0c33:		.db $00				; 00
B5_0c34:	.db $03
B5_0c35:		and ($33), y	; 31 33
B5_0c37:	.db $da
B5_0c38:	.db $02
B5_0c39:	.db $02
B5_0c3a:		sed				; f8
B5_0c3b:		beq B5_0c3d ; f0 00

B5_0c3d:		ora ($11, x)	; 01 11
B5_0c3f:	.db $02
B5_0c40:		sed				; f8
B5_0c41:		.db $00				; 00
B5_0c42:		.db $00				; 00
B5_0c43:	.db $03
B5_0c44:	.db $13
B5_0c45:	.db $da
B5_0c46:	.db $02
B5_0c47:	.db $02
B5_0c48:		sed				; f8
B5_0c49:		beq B5_0c4b ; f0 00

B5_0c4b:		and ($31, x)	; 21 31
B5_0c4d:	.db $02
B5_0c4e:		sed				; f8
B5_0c4f:		.db $00				; 00
B5_0c50:		.db $00				; 00
B5_0c51:	.db $23
B5_0c52:	.db $33
B5_0c53:	.db $da
B5_0c54:		ora ($04, x)	; 01 04
B5_0c56:		beq B5_0c58 ; f0 00

B5_0c58:		.db $00				; 00
B5_0c59:		ora #$19		; 09 19
B5_0c5b:		and #$39		; 29 39
B5_0c5d:	.db $da
B5_0c5e:		ora ($04, x)	; 01 04
B5_0c60:		beq B5_0c62 ; f0 00

B5_0c62:		.db $00				; 00
B5_0c63:		ora $15			; 05 15
B5_0c65:		and $35			; 25 35
B5_0c67:	.db $da
B5_0c68:		ora ($04, x)	; 01 04
B5_0c6a:		beq B5_0c6c ; f0 00

B5_0c6c:		.db $00				; 00
B5_0c6d:	.db $07
B5_0c6e:	.db $17
B5_0c6f:	.db $27
B5_0c70:	.db $37
B5_0c71:	.db $dc
B5_0c72:	.db $02
B5_0c73:	.db $02
B5_0c74:	.db $f7
B5_0c75:		beq B5_0c77 ; f0 00

B5_0c77:		and ($31, x)	; 21 31
B5_0c79:	.db $02
B5_0c7a:	.db $f7
B5_0c7b:		.db $00				; 00
B5_0c7c:		.db $00				; 00
B5_0c7d:	.db $23
B5_0c7e:	.db $33
B5_0c7f:	.db $dc
B5_0c80:	.db $02
B5_0c81:	.db $03
B5_0c82:	.db $ef
B5_0c83:		beq B5_0c85 ; f0 00

B5_0c85:		ora $15			; 05 15
B5_0c87:		and $03			; 25 03
B5_0c89:	.db $ef
B5_0c8a:		.db $00				; 00
B5_0c8b:		.db $00				; 00
B5_0c8c:	.db $07
B5_0c8d:	.db $17
B5_0c8e:	.db $27
B5_0c8f:	.db $dc
B5_0c90:	.db $02
B5_0c91:	.db $02
B5_0c92:	.db $f7
B5_0c93:		beq B5_0c95 ; f0 00

B5_0c95:		and ($31, x)	; 21 31
B5_0c97:	.db $02
B5_0c98:	.db $f7
B5_0c99:		.db $00				; 00
B5_0c9a:		.db $00				; 00
B5_0c9b:	.db $23
B5_0c9c:	.db $33
B5_0c9d:	.db $dc
B5_0c9e:	.db $02
B5_0c9f:	.db $03
B5_0ca0:	.db $ef
B5_0ca1:		beq B5_0ca3 ; f0 00

B5_0ca3:		ora $15			; 05 15
B5_0ca5:		and $03			; 25 03
B5_0ca7:	.db $ef
B5_0ca8:		.db $00				; 00
B5_0ca9:		.db $00				; 00
B5_0caa:	.db $07
B5_0cab:	.db $17
B5_0cac:	.db $27
B5_0cad:	.db $dc
B5_0cae:	.db $02
B5_0caf:	.db $03
B5_0cb0:	.db $ef
B5_0cb1:		beq B5_0cb3 ; f0 00

B5_0cb3:		ora $15			; 05 15
B5_0cb5:		and $03, x		; 35 03
B5_0cb7:	.db $ef
B5_0cb8:		.db $00				; 00
B5_0cb9:		.db $00				; 00
B5_0cba:	.db $07
B5_0cbb:	.db $17
B5_0cbc:	.db $37
B5_0cbd:	.db $dc
B5_0cbe:	.db $02
B5_0cbf:	.db $03
B5_0cc0:	.db $f7
B5_0cc1:		beq B5_0cc3 ; f0 00

B5_0cc3:		ora #$19		; 09 19
B5_0cc5:		and #$03		; 29 03
B5_0cc7:	.db $f7
B5_0cc8:		.db $00				; 00
B5_0cc9:		.db $00				; 00
B5_0cca:	.db $0b
B5_0ccb:	.db $1b
B5_0ccc:	.db $2b
B5_0ccd:	.db $da
B5_0cce:	.db $02
B5_0ccf:	.db $03
B5_0cd0:	.db $f4
B5_0cd1:		beq B5_0cd3 ; f0 00

B5_0cd3:	.db $0b
B5_0cd4:	.db $1b
B5_0cd5:	.db $2b
B5_0cd6:	.db $03
B5_0cd7:	.db $f4
B5_0cd8:		.db $00				; 00
B5_0cd9:		.db $00				; 00
B5_0cda:	.db $0f
B5_0cdb:		ora $da1d		; 0d 1d da
B5_0cde:		ora ($04, x)	; 01 04
B5_0ce0:		beq B5_0ce2 ; f0 00

B5_0ce2:		.db $00				; 00
B5_0ce3:		ora #$19		; 09 19
B5_0ce5:		and #$39		; 29 39
B5_0ce7:	.db $db
B5_0ce8:	.db $02
B5_0ce9:	.db $03
B5_0cea:	.db $f4
B5_0ceb:		beq B5_0ced ; f0 00

B5_0ced:		ora #$19		; 09 19
B5_0cef:		ora $03, x		; 15 03
B5_0cf1:	.db $f4
B5_0cf2:		.db $00				; 00
B5_0cf3:		.db $00				; 00
B5_0cf4:	.db $0b
B5_0cf5:	.db $1b
B5_0cf6:	.db $07
B5_0cf7:		ora ($02, x)	; 01 02
B5_0cf9:		.db $00				; 00
B5_0cfa:		.db $00				; 00
B5_0cfb:		.db $00				; 00
B5_0cfc:	.db $37
B5_0cfd:		and $02dd, y	; 39 dd 02
B5_0d00:	.db $02
B5_0d01:		sed				; f8
B5_0d02:		beq B5_0d04 ; f0 00

B5_0d04:		ora $021d		; 0d 1d 02
B5_0d07:		sed				; f8
B5_0d08:		.db $00				; 00
B5_0d09:		.db $00				; 00
B5_0d0a:	.db $0f
B5_0d0b:	.db $1f
B5_0d0c:		iny				; c8
B5_0d0d:	.db $02
B5_0d0e:	.db $02
B5_0d0f:	.db $f7
B5_0d10:		beq B5_0d12 ; f0 00

B5_0d12:		ora ($11, x)	; 01 11
B5_0d14:	.db $03
B5_0d15:	.db $ef
B5_0d16:		.db $00				; 00
B5_0d17:		.db $00				; 00
B5_0d18:		and #$03		; 29 03
B5_0d1a:	.db $13
B5_0d1b:		iny				; c8
B5_0d1c:	.db $02
B5_0d1d:	.db $02
B5_0d1e:	.db $f7
B5_0d1f:		beq B5_0d21 ; f0 00

B5_0d21:		and ($31, x)	; 21 31
B5_0d23:	.db $03
B5_0d24:	.db $ef
B5_0d25:		.db $00				; 00
B5_0d26:		.db $00				; 00
B5_0d27:		and $3323, y	; 39 23 33
B5_0d2a:		iny				; c8
B5_0d2b:	.db $02
B5_0d2c:	.db $02
B5_0d2d:	.db $f7
B5_0d2e:		beq B5_0d30 ; f0 00

B5_0d30:		ora $15			; 05 15
B5_0d32:	.db $03
B5_0d33:	.db $ef
B5_0d34:		.db $00				; 00
B5_0d35:		.db $00				; 00
B5_0d36:	.db $2b
B5_0d37:	.db $07
B5_0d38:	.db $17
B5_0d39:		iny				; c8
B5_0d3a:	.db $02
B5_0d3b:	.db $02
B5_0d3c:	.db $f7
B5_0d3d:		beq B5_0d3f ; f0 00

B5_0d3f:		and $35			; 25 35
B5_0d41:	.db $03
B5_0d42:	.db $ef
B5_0d43:		.db $00				; 00
B5_0d44:		.db $00				; 00
B5_0d45:	.db $3b
B5_0d46:	.db $27
B5_0d47:	.db $37
B5_0d48:		iny				; c8
B5_0d49:	.db $02
B5_0d4a:	.db $02
B5_0d4b:	.db $f7
B5_0d4c:		beq B5_0d4e ; f0 00

B5_0d4e:		ora #$19		; 09 19
B5_0d50:	.db $03
B5_0d51:	.db $ef
B5_0d52:		.db $00				; 00
B5_0d53:		.db $00				; 00
B5_0d54:		ora $1b0b		; 0d 0b 1b
B5_0d57:		dex				; ca
B5_0d58:	.db $02
B5_0d59:	.db $03
B5_0d5a:	.db $f4
B5_0d5b:		beq B5_0d5d ; f0 00

B5_0d5d:		ora $2d1d		; 0d 1d 2d
B5_0d60:	.db $03
B5_0d61:	.db $f4
B5_0d62:		.db $00				; 00
B5_0d63:		.db $00				; 00
B5_0d64:	.db $0f
B5_0d65:	.db $1f
B5_0d66:	.db $2f
B5_0d67:		iny				; c8
B5_0d68:	.db $02
B5_0d69:	.db $02
B5_0d6a:		sed				; f8
B5_0d6b:		beq B5_0d6d ; f0 00

B5_0d6d:		and $033d		; 2d 3d 03
B5_0d70:		beq B5_0d72 ; f0 00

B5_0d72:		.db $00				; 00
B5_0d73:	.db $2b
B5_0d74:	.db $2f
B5_0d75:	.db $3f
B5_0d76:	.db $cb
B5_0d77:	.db $02
B5_0d78:	.db $02
B5_0d79:		sed				; f8
B5_0d7a:		beq B5_0d7c ; f0 00

B5_0d7c:		and ($31, x)	; 21 31
B5_0d7e:	.db $02
B5_0d7f:		sed				; f8
B5_0d80:		.db $00				; 00
B5_0d81:		.db $00				; 00
B5_0d82:	.db $23
B5_0d83:	.db $33
B5_0d84:		cmp #$02		; c9 02
B5_0d86:	.db $02
B5_0d87:	.db $fc
B5_0d88:		beq B5_0d8a ; f0 00

B5_0d8a:		ora ($21), y	; 11 21
B5_0d8c:	.db $03
B5_0d8d:	.db $f4
B5_0d8e:		.db $00				; 00
B5_0d8f:		.db $00				; 00
B5_0d90:	.db $03
B5_0d91:	.db $13
B5_0d92:	.db $23
B5_0d93:		cmp #$02		; c9 02
B5_0d95:	.db $02
B5_0d96:		sed				; f8
B5_0d97:		beq B5_0d99 ; f0 00

B5_0d99:		and $35			; 25 35
B5_0d9b:	.db $03
B5_0d9c:		beq B5_0d9e ; f0 00

B5_0d9e:		.db $00				; 00
B5_0d9f:	.db $17
B5_0da0:	.db $27
B5_0da1:	.db $37
B5_0da2:		cmp #$02		; c9 02
B5_0da4:	.db $02
B5_0da5:		sed				; f8
B5_0da6:		beq B5_0da8 ; f0 00

B5_0da8:		and ($07), y	; 31 07
B5_0daa:	.db $03
B5_0dab:		beq B5_0dad ; f0 00

B5_0dad:		.db $00				; 00
B5_0dae:		ora $15			; 05 15
B5_0db0:	.db $37
B5_0db1:		cmp #$02		; c9 02
B5_0db3:	.db $03
B5_0db4:	.db $f4
B5_0db5:		beq B5_0db7 ; f0 00

B5_0db7:		ora #$19		; 09 19
B5_0db9:	.db $33
B5_0dba:	.db $03
B5_0dbb:	.db $f4
B5_0dbc:		.db $00				; 00
B5_0dbd:		.db $00				; 00
B5_0dbe:	.db $3f
B5_0dbf:	.db $0b
B5_0dc0:	.db $1b
B5_0dc1:		cmp #$02		; c9 02
B5_0dc3:	.db $02
B5_0dc4:	.db $fc
B5_0dc5:		beq B5_0dc7 ; f0 00

B5_0dc7:		ora $031d		; 0d 1d 03
B5_0dca:	.db $f4
B5_0dcb:		.db $00				; 00
B5_0dcc:		.db $00				; 00
B5_0dcd:	.db $2f
B5_0dce:	.db $0f
B5_0dcf:	.db $1f
B5_0dd0:		dec $0202		; ce 02 02
B5_0dd3:	.db $f9 $f0 $00
B5_0dd6:		ora ($11, x)	; 01 11
B5_0dd8:	.db $03
B5_0dd9:	.db $f3
B5_0dda:		.db $00				; 00
B5_0ddb:		.db $00				; 00
B5_0ddc:	.db $03
B5_0ddd:	.db $13
B5_0dde:	.db $23
B5_0ddf:		dec $0202		; ce 02 02
B5_0de2:	.db $ff
B5_0de3:		beq B5_0de5 ; f0 00

B5_0de5:		and ($31, x)	; 21 31
B5_0de7:	.db $03
B5_0de8:	.db $f7
B5_0de9:		.db $00				; 00
B5_0dea:		.db $00				; 00
B5_0deb:	.db $33
B5_0dec:		ora $15			; 05 15
B5_0dee:		dec $0202		; ce 02 02
B5_0df1:	.db $ff
B5_0df2:		beq B5_0df4 ; f0 00

B5_0df4:		and $35			; 25 35
B5_0df6:	.db $03
B5_0df7:	.db $f7
B5_0df8:		.db $00				; 00
B5_0df9:		.db $00				; 00
B5_0dfa:	.db $07
B5_0dfb:	.db $17
B5_0dfc:	.db $27
B5_0dfd:	.db $cf
B5_0dfe:	.db $02
B5_0dff:	.db $02
B5_0e00:	.db $f7
B5_0e01:		beq B5_0e03 ; f0 00

B5_0e03:		ora ($11, x)	; 01 11
B5_0e05:	.db $03
B5_0e06:	.db $ef
B5_0e07:		.db $00				; 00
B5_0e08:		.db $00				; 00
B5_0e09:		and #$03		; 29 03
B5_0e0b:	.db $13
B5_0e0c:	.db $cf
B5_0e0d:	.db $02
B5_0e0e:	.db $02
B5_0e0f:	.db $f7
B5_0e10:		beq B5_0e12 ; f0 00

B5_0e12:		and ($31, x)	; 21 31
B5_0e14:	.db $03
B5_0e15:	.db $ef
B5_0e16:		.db $00				; 00
B5_0e17:		.db $00				; 00
B5_0e18:		and $3323, y	; 39 23 33
B5_0e1b:	.db $cf
B5_0e1c:	.db $02
B5_0e1d:	.db $02
B5_0e1e:	.db $f7
B5_0e1f:		beq B5_0e21 ; f0 00

B5_0e21:		ora $15			; 05 15
B5_0e23:	.db $03
B5_0e24:	.db $ef
B5_0e25:		.db $00				; 00
B5_0e26:		.db $00				; 00
B5_0e27:	.db $2b
B5_0e28:	.db $07
B5_0e29:	.db $17
B5_0e2a:	.db $cf
B5_0e2b:	.db $02
B5_0e2c:	.db $02
B5_0e2d:	.db $f7
B5_0e2e:		beq B5_0e30 ; f0 00

B5_0e30:		and $35			; 25 35
B5_0e32:	.db $03
B5_0e33:	.db $ef
B5_0e34:		.db $00				; 00
B5_0e35:		.db $00				; 00
B5_0e36:	.db $3b
B5_0e37:	.db $27
B5_0e38:	.db $37
B5_0e39:	.db $cf
B5_0e3a:	.db $02
B5_0e3b:	.db $02
B5_0e3c:	.db $f7
B5_0e3d:		beq B5_0e3f ; f0 00

B5_0e3f:		ora #$19		; 09 19
B5_0e41:	.db $03
B5_0e42:	.db $ef
B5_0e43:		.db $00				; 00
B5_0e44:		.db $00				; 00
B5_0e45:		ora $1b0b		; 0d 0b 1b
B5_0e48:	.db $cf
B5_0e49:	.db $02
B5_0e4a:	.db $02
B5_0e4b:		sed				; f8
B5_0e4c:		beq B5_0e4e ; f0 00

B5_0e4e:		and $033d		; 2d 3d 03
B5_0e51:		beq B5_0e53 ; f0 00

B5_0e53:		.db $00				; 00
B5_0e54:	.db $2b
B5_0e55:	.db $07
B5_0e56:	.db $17
B5_0e57:	.db $cf
B5_0e58:	.db $02
B5_0e59:	.db $02
B5_0e5a:	.db $fc
B5_0e5b:		beq B5_0e5d ; f0 00

B5_0e5d:	.db $0f
B5_0e5e:	.db $1f
B5_0e5f:	.db $03
B5_0e60:	.db $f4
B5_0e61:		.db $00				; 00
B5_0e62:		.db $00				; 00
B5_0e63:		ora ($2f), y	; 11 2f
B5_0e65:	.db $3f
B5_0e66:		cpy $0202		; cc 02 02
B5_0e69:		sed				; f8
B5_0e6a:		beq B5_0e6c ; f0 00

B5_0e6c:		ora $031d		; 0d 1d 03
B5_0e6f:		beq B5_0e71 ; f0 00

B5_0e71:		.db $00				; 00
B5_0e72:	.db $0f
B5_0e73:	.db $1f
B5_0e74:	.db $3b
B5_0e75:		cmp #$03		; c9 03
B5_0e77:		ora ($f8, x)	; 01 f8
B5_0e79:		beq B5_0e7b ; f0 00

B5_0e7b:	.db $39 $01 $00
B5_0e7e:		beq B5_0ec0 ; f0 40

B5_0e80:		and $f802, y	; 39 02 f8
B5_0e83:		.db $00				; 00
B5_0e84:		.db $00				; 00
B5_0e85:		and $c93d		; 2d 3d c9
B5_0e88:	.db $03
B5_0e89:		ora ($f8, x)	; 01 f8
B5_0e8b:		beq B5_0e8d ; f0 00

B5_0e8d:		and #$01		; 29 01
B5_0e8f:		.db $00				; 00
B5_0e90:		beq B5_0ed2 ; f0 40

B5_0e92:		and #$02		; 29 02
B5_0e94:		sed				; f8
B5_0e95:		.db $00				; 00
B5_0e96:		.db $00				; 00
B5_0e97:	.db $2b
B5_0e98:	.db $3b
B5_0e99:	.db $cb
B5_0e9a:	.db $02
B5_0e9b:	.db $02
B5_0e9c:	.db $fc
B5_0e9d:		beq B5_0e9f ; f0 00

B5_0e9f:		and #$39		; 29 39
B5_0ea1:	.db $03
B5_0ea2:	.db $f4
B5_0ea3:		.db $00				; 00
B5_0ea4:		.db $00				; 00
B5_0ea5:	.db $1b
B5_0ea6:	.db $2b
B5_0ea7:	.db $3b
B5_0ea8:	.db $cb
B5_0ea9:	.db $02
B5_0eaa:	.db $02
B5_0eab:	.db $fc
B5_0eac:		beq B5_0eae ; f0 00

B5_0eae:		and #$39		; 29 39
B5_0eb0:	.db $03
B5_0eb1:	.db $f4
B5_0eb2:		.db $00				; 00
B5_0eb3:		.db $00				; 00
B5_0eb4:		and $3b2b, x	; 3d 2b 3b
B5_0eb7:	.db $cb
B5_0eb8:	.db $02
B5_0eb9:	.db $02
B5_0eba:		sed				; f8
B5_0ebb:		beq B5_0ebd ; f0 00

B5_0ebd:		ora ($11, x)	; 01 11
B5_0ebf:	.db $02
B5_0ec0:		sed				; f8
B5_0ec1:		.db $00				; 00
B5_0ec2:		.db $00				; 00
B5_0ec3:	.db $03
B5_0ec4:	.db $13
B5_0ec5:	.db $cb
B5_0ec6:		ora ($02, x)	; 01 02
B5_0ec8:		sed				; f8
B5_0ec9:		.db $00				; 00
B5_0eca:		.db $00				; 00
B5_0ecb:		ora #$0b		; 09 0b
B5_0ecd:		cmp $0101		; cd 01 01
B5_0ed0:	.db $fc
B5_0ed1:		.db $00				; 00
B5_0ed2:		.db $00				; 00
B5_0ed3:	.db $3f
B5_0ed4:		cmp $0301		; cd 01 03
B5_0ed7:	.db $f4
B5_0ed8:		.db $00				; 00
B5_0ed9:		.db $00				; 00
B5_0eda:	.db $0f
B5_0edb:	.db $1f
B5_0edc:	.db $2f
B5_0edd:		cmp $0301		; cd 01 03
B5_0ee0:	.db $f4
B5_0ee1:		.db $00				; 00
B5_0ee2:		.db $00				; 00
B5_0ee3:		and $3b3d		; 2d 3d 3b
B5_0ee6:		cmp $0102		; cd 02 01
B5_0ee9:	.db $f4
B5_0eea:		.db $00				; 00
B5_0eeb:		.db $00				; 00
B5_0eec:	.db $33
B5_0eed:		ora ($04, x)	; 01 04
B5_0eef:		.db $00				; 00
B5_0ef0:		.db $00				; 00
B5_0ef1:		and $cb, x		; 35 cb
B5_0ef3:	.db $02
B5_0ef4:	.db $03
B5_0ef5:	.db $f4
B5_0ef6:		beq B5_0ef8 ; f0 00

B5_0ef8:		ora $15			; 05 15
B5_0efa:		and $03			; 25 03
B5_0efc:	.db $f4
B5_0efd:		.db $00				; 00
B5_0efe:		.db $00				; 00
B5_0eff:	.db $07
B5_0f00:	.db $17
B5_0f01:	.db $27
B5_0f02:	.db $cb
B5_0f03:	.db $04
B5_0f04:		ora ($f8, x)	; 01 f8
B5_0f06:		beq B5_0f08 ; f0 00

B5_0f08:		and $01, x		; 35 01
B5_0f0a:		sed				; f8
B5_0f0b:		.db $00				; 00
B5_0f0c:		.db $00				; 00
B5_0f0d:	.db $37
B5_0f0e:		ora ($f8, x)	; 01 f8
B5_0f10:		beq B5_0f52 ; f0 40

B5_0f12:		and $01, x		; 35 01
B5_0f14:		sed				; f8
B5_0f15:		.db $00				; 00
B5_0f16:		rti				; 40


B5_0f17:	.db $37
B5_0f18:		dex				; ca
B5_0f19:	.db $02
B5_0f1a:	.db $02
B5_0f1b:		sed				; f8
B5_0f1c:		beq B5_0f1e ; f0 00

B5_0f1e:		ora $25, x		; 15 25
B5_0f20:	.db $03
B5_0f21:		beq B5_0f23 ; f0 00

B5_0f23:		.db $00				; 00
B5_0f24:	.db $07
B5_0f25:	.db $17
B5_0f26:	.db $27
B5_0f27:		dex				; ca
B5_0f28:		ora ($04, x)	; 01 04
B5_0f2a:		inx				; e8
B5_0f2b:		.db $00				; 00
B5_0f2c:		.db $00				; 00
B5_0f2d:		ora ($11, x)	; 01 11
B5_0f2f:		and ($31, x)	; 21 31
B5_0f31:		dex				; ca
B5_0f32:		ora ($04, x)	; 01 04
B5_0f34:		inx				; e8
B5_0f35:		.db $00				; 00
B5_0f36:		.db $00				; 00
B5_0f37:	.db $03
B5_0f38:	.db $13
B5_0f39:	.db $23
B5_0f3a:	.db $33
B5_0f3b:		cpy wEntityStructs.subX.w		; cc 01 04
B5_0f3e:		beq B5_0f40 ; f0 00

B5_0f40:		.db $00				; 00
B5_0f41:		ora ($11, x)	; 01 11
B5_0f43:		and ($31, x)	; 21 31
B5_0f45:		cpy wEntityStructs.subX.w		; cc 01 04
B5_0f48:		beq B5_0f4a ; f0 00

B5_0f4a:		.db $00				; 00
B5_0f4b:	.db $03
B5_0f4c:	.db $13
B5_0f4d:	.db $23
B5_0f4e:	.db $33
B5_0f4f:		cmp $0202		; cd 02 02
B5_0f52:		inc $f0, x		; f6 f0
B5_0f54:		.db $00				; 00
B5_0f55:		ora ($11, x)	; 01 11
B5_0f57:	.db $03
B5_0f58:	.db $f2
B5_0f59:		.db $00				; 00
B5_0f5a:		.db $00				; 00
B5_0f5b:	.db $03
B5_0f5c:	.db $13
B5_0f5d:	.db $23
B5_0f5e:		cmp wEntityStructs.subX.w		; cd 01 04
B5_0f61:		inx				; e8
B5_0f62:		.db $00				; 00
B5_0f63:		.db $00				; 00
B5_0f64:	.db $07
B5_0f65:	.db $17
B5_0f66:	.db $27
B5_0f67:	.db $37
B5_0f68:		cmp $0202		; cd 02 02
B5_0f6b:		sed				; f8
B5_0f6c:		beq B5_0f6e ; f0 00

B5_0f6e:		and ($31, x)	; 21 31
B5_0f70:	.db $03
B5_0f71:		beq B5_0f73 ; f0 00

B5_0f73:		.db $00				; 00
B5_0f74:		ora $15			; 05 15
B5_0f76:		and $01			; 25 01
B5_0f78:		ora ($fc, x)	; 01 fc
B5_0f7a:		.db $00				; 00
B5_0f7b:		.db $00				; 00
B5_0f7c:		eor #$01		; 49 01
B5_0f7e:	.db $03
B5_0f7f:		beq B5_0f81 ; f0 00

B5_0f81:		.db $00				; 00
B5_0f82:		eor $7969, y	; 59 69 79
B5_0f85:		ora ($02, x)	; 01 02
B5_0f87:		sed				; f8
B5_0f88:		.db $00				; 00
B5_0f89:		.db $00				; 00
B5_0f8a:		eor $027d, x	; 5d 7d 02
B5_0f8d:		ora ($f8, x)	; 01 f8
B5_0f8f:		.db $00				; 00
B5_0f90:		.db $00				; 00
B5_0f91:	.db $7f
B5_0f92:		ora ($00, x)	; 01 00
B5_0f94:		.db $00				; 00
B5_0f95:		cpy #$7f		; c0 7f
B5_0f97:	.db $cb
B5_0f98:	.db $02
B5_0f99:	.db $03
B5_0f9a:	.db $f4
B5_0f9b:		beq B5_0f9d ; f0 00

B5_0f9d:		ora $2d1d		; 0d 1d 2d
B5_0fa0:	.db $03
B5_0fa1:	.db $f4
B5_0fa2:		.db $00				; 00
B5_0fa3:		.db $00				; 00
B5_0fa4:	.db $0f
B5_0fa5:	.db $1f
B5_0fa6:	.db $2f
B5_0fa7:		dec $0202		; ce 02 02
B5_0faa:		sed				; f8
B5_0fab:		beq B5_0fad ; f0 00

B5_0fad:		ora #$19		; 09 19
B5_0faf:	.db $02
B5_0fb0:		sed				; f8
B5_0fb1:		.db $00				; 00
B5_0fb2:		.db $00				; 00
B5_0fb3:		and #$39		; 29 39
B5_0fb5:		ora ($01, x)	; 01 01
B5_0fb7:	.db $fc
B5_0fb8:		sed				; f8
B5_0fb9:		.db $00				; 00
B5_0fba:		adc $01, x		; 75 01
B5_0fbc:	.db $03
B5_0fbd:	.db $f4
B5_0fbe:		sed				; f8
B5_0fbf:		.db $00				; 00
B5_0fc0:		eor ($51, x)	; 41 51
B5_0fc2:		adc ($01, x)	; 61 01
B5_0fc4:	.db $02
B5_0fc5:		sed				; f8
B5_0fc6:		sed				; f8
B5_0fc7:		.db $00				; 00
B5_0fc8:	.db $53
B5_0fc9:	.db $63
B5_0fca:	.db $02
B5_0fcb:		ora ($f8, x)	; 01 f8
B5_0fcd:		sed				; f8
B5_0fce:		.db $00				; 00
B5_0fcf:		adc $01			; 65 01
B5_0fd1:		.db $00				; 00
B5_0fd2:		sed				; f8
B5_0fd3:		rti				; 40


B5_0fd4:		adc $02			; 65 02
B5_0fd6:		ora ($f6, x)	; 01 f6
B5_0fd8:		sed				; f8
B5_0fd9:		.db $00				; 00
B5_0fda:	.db $7f
B5_0fdb:		ora ($02, x)	; 01 02
B5_0fdd:		sed				; f8
B5_0fde:		cpy #$7f		; c0 7f
B5_0fe0:		ora ($01, x)	; 01 01
B5_0fe2:	.db $fc
B5_0fe3:		sed				; f8
B5_0fe4:		.db $00				; 00
B5_0fe5:		adc ($01), y	; 71 01
B5_0fe7:		ora ($fc, x)	; 01 fc
B5_0fe9:		sed				; f8
B5_0fea:		.db $00				; 00
B5_0feb:	.db $73
B5_0fec:		ora ($01, x)	; 01 01
B5_0fee:	.db $fc
B5_0fef:		sed				; f8
B5_0ff0:		.db $00				; 00
B5_0ff1:	.db $4f
B5_0ff2:	.db $02
B5_0ff3:		ora ($f8, x)	; 01 f8
B5_0ff5:		sed				; f8
B5_0ff6:		.db $00				; 00
B5_0ff7:	.db $6f
B5_0ff8:		ora ($00, x)	; 01 00
B5_0ffa:		sed				; f8
B5_0ffb:		rti				; 40


B5_0ffc:	.db $6f
B5_0ffd:	.db $02
B5_0ffe:		ora ($f8, x)	; 01 f8
B5_1000:		sed				; f8
B5_1001:		.db $00				; 00
B5_1002:	.db $5f
B5_1003:		ora ($00, x)	; 01 00
B5_1005:		sed				; f8
B5_1006:		rti				; 40


B5_1007:	.db $5f
B5_1008:	.db $02
B5_1009:		ora ($f8, x)	; 01 f8
B5_100b:		sed				; f8
B5_100c:		.db $00				; 00
B5_100d:	.db $7f
B5_100e:		ora ($00, x)	; 01 00
B5_1010:		sed				; f8
B5_1011:		cpy #$7f		; c0 7f
B5_1013:		cpx #$01		; e0 01
B5_1015:	.db $02
B5_1016:		sed				; f8
B5_1017:		beq B5_1019 ; f0 00

B5_1019:		ora #$19		; 09 19
B5_101b:		cpx #$01		; e0 01
B5_101d:	.db $02
B5_101e:		sed				; f8
B5_101f:		beq B5_1021 ; f0 00

B5_1021:		ora $021d		; 0d 1d 02
B5_1024:		ora ($f8, x)	; 01 f8
B5_1026:		sed				; f8
B5_1027:		.db $00				; 00
B5_1028:		adc ($01, x)	; 61 01
B5_102a:		.db $00				; 00
B5_102b:		sed				; f8
B5_102c:		rti				; 40


B5_102d:		adc ($02, x)	; 61 02
B5_102f:		ora ($f8, x)	; 01 f8
B5_1031:		sed				; f8
B5_1032:	.db $80
B5_1033:		adc ($01, x)	; 61 01
B5_1035:		.db $00				; 00
B5_1036:		sed				; f8
B5_1037:		cpy #$61		; c0 61
B5_1039:		ora ($02, x)	; 01 02
B5_103b:		sed				; f8
B5_103c:		sed				; f8
B5_103d:		rti				; 40


B5_103e:		eor ($41), y	; 51 41
B5_1040:		ora ($02, x)	; 01 02
B5_1042:		sed				; f8
B5_1043:		sed				; f8
B5_1044:		.db $00				; 00
B5_1045:		eor ($51, x)	; 41 51
B5_1047:		ora ($01, x)	; 01 01
B5_1049:	.db $fc
B5_104a:		sed				; f8
B5_104b:		.db $00				; 00
B5_104c:	.db $7b
B5_104d:	.db $02
B5_104e:	.db $02
B5_104f:		sed				; f8
B5_1050:		beq B5_1052 ; f0 00

B5_1052:	.db $67
B5_1053:	.db $77
B5_1054:		ora ($fc, x)	; 01 fc
B5_1056:		.db $00				; 00
B5_1057:		.db $00				; 00
B5_1058:		adc #$02		; 69 02
B5_105a:	.db $02
B5_105b:	.db $f4
B5_105c:		sed				; f8
B5_105d:		.db $00				; 00
B5_105e:	.db $4b
B5_105f:	.db $5b
B5_1060:		ora ($04, x)	; 01 04
B5_1062:		sed				; f8
B5_1063:		rti				; 40


B5_1064:	.db $4b
B5_1065:	.db $02
B5_1066:		ora ($fc, x)	; 01 fc
B5_1068:		inx				; e8
B5_1069:		.db $00				; 00
B5_106a:	.db $43
B5_106b:		ora ($fc, x)	; 01 fc
B5_106d:		sed				; f8
B5_106e:		.db $00				; 00
B5_106f:		eor $02			; 45 02
B5_1071:		ora ($fc, x)	; 01 fc
B5_1073:		inx				; e8
B5_1074:		.db $00				; 00
B5_1075:		eor $01, x		; 55 01
B5_1077:	.db $fc
B5_1078:		sed				; f8
B5_1079:		.db $00				; 00
B5_107a:	.db $7f
B5_107b:		ora ($01, x)	; 01 01
B5_107d:	.db $fc
B5_107e:		inx				; e8
B5_107f:		.db $00				; 00
B5_1080:	.db $7f
B5_1081:		ora ($01, x)	; 01 01
B5_1083:	.db $fc
B5_1084:		sed				; f8
B5_1085:		ora ($4d, x)	; 01 4d
B5_1087:		ora ($01, x)	; 01 01
B5_1089:	.db $fc
B5_108a:		sed				; f8
B5_108b:		cmp ($4d, x)	; c1 4d
B5_108d:		sbc ($01, x)	; e1 01
B5_108f:		ora ($fc, x)	; 01 fc
B5_1091:		beq B5_1093 ; f0 00

B5_1093:		and $01e1, x	; 3d e1 01
B5_1096:	.db $02
B5_1097:	.db $f3
B5_1098:		beq B5_109a ; f0 00

B5_109a:	.db $27
B5_109b:	.db $37
B5_109c:		sbc ($01, x)	; e1 01
B5_109e:	.db $02
B5_109f:	.db $f2
B5_10a0:		beq B5_10a2 ; f0 00

B5_10a2:		and #$39		; 29 39
B5_10a4:		ora ($01, x)	; 01 01
B5_10a6:	.db $fc
B5_10a7:		.db $00				; 00
B5_10a8:		.db $00				; 00
B5_10a9:	.db $67
B5_10aa:		ora ($01, x)	; 01 01
B5_10ac:	.db $fc
B5_10ad:		.db $00				; 00
B5_10ae:		.db $00				; 00
B5_10af:	.db $77
B5_10b0:	.db $02
B5_10b1:	.db $02
B5_10b2:	.db $f4
B5_10b3:		sed				; f8
B5_10b4:	.db $02
B5_10b5:	.db $a7
B5_10b6:	.db $b7
B5_10b7:		ora ($04, x)	; 01 04
B5_10b9:		sed				; f8
B5_10ba:	.db $42
B5_10bb:	.db $a7
B5_10bc:	.db $02
B5_10bd:	.db $03
B5_10be:		.db $00				; 00
B5_10bf:		.db $00				; 00
B5_10c0:		.db $00				; 00
B5_10c1:		eor ($51, x)	; 41 51
B5_10c3:		adc ($03, x)	; 61 03
B5_10c5:		.db $00				; 00
B5_10c6:		bpl B5_10c8 ; 10 00

B5_10c8:	.db $43
B5_10c9:	.db $53
B5_10ca:	.db $63
B5_10cb:	.db $02
B5_10cc:	.db $03
B5_10cd:		.db $00				; 00
B5_10ce:		.db $00				; 00
B5_10cf:		.db $00				; 00
B5_10d0:		eor $55			; 45 55
B5_10d2:		adc $03			; 65 03
B5_10d4:		.db $00				; 00
B5_10d5:		bpl B5_10d7 ; 10 00

B5_10d7:	.db $47
B5_10d8:	.db $57
B5_10d9:	.db $67
B5_10da:	.db $02
B5_10db:	.db $03
B5_10dc:		.db $00				; 00
B5_10dd:		.db $00				; 00
B5_10de:		.db $00				; 00
B5_10df:		eor #$59		; 49 59
B5_10e1:		adc #$03		; 69 03
B5_10e3:		.db $00				; 00
B5_10e4:		bpl B5_10e6 ; 10 00

B5_10e6:	.db $4b
B5_10e7:	.db $5b
B5_10e8:	.db $6b
B5_10e9:	.db $02
B5_10ea:	.db $03
B5_10eb:		.db $00				; 00
B5_10ec:		.db $00				; 00
B5_10ed:		.db $00				; 00
B5_10ee:		eor $6d5d		; 4d 5d 6d
B5_10f1:	.db $03
B5_10f2:		.db $00				; 00
B5_10f3:		bpl B5_10f5 ; 10 00

B5_10f5:	.db $4f
B5_10f6:	.db $5f
B5_10f7:	.db $6f
B5_10f8:		ora ($02, x)	; 01 02
B5_10fa:		.db $00				; 00
B5_10fb:		beq B5_113e ; f0 41

B5_10fd:	.db $73
B5_10fe:		adc ($01), y	; 71 01
B5_1100:	.db $02
B5_1101:		sed				; f8
B5_1102:		sed				; f8
B5_1103:		ora ($47, x)	; 01 47
B5_1105:	.db $57
B5_1106:		ora ($02, x)	; 01 02
B5_1108:		.db $00				; 00
B5_1109:		.db $00				; 00
B5_110a:	.db $03
B5_110b:		adc $77, x		; 75 77
B5_110d:		ora ($02, x)	; 01 02
B5_110f:		.db $00				; 00
B5_1110:		.db $00				; 00
B5_1111:	.db $03
B5_1112:		adc $017b, y	; 79 7b 01
B5_1115:	.db $02
B5_1116:		.db $00				; 00
B5_1117:		.db $00				; 00
B5_1118:	.db $03
B5_1119:		adc $017f, x	; 7d 7f 01
B5_111c:	.db $02
B5_111d:		sed				; f8
B5_111e:		sed				; f8
B5_111f:		ora ($8d, x)	; 01 8d
B5_1121:		.db $9d


data_5_1122:
	.db $01 $02
	.db $f8 $f8 $01 $ad $bd


data_5_1129:
.db $02 $01
B5_112b:		sed				; f8
B5_112c:		sed				; f8
B5_112d:		ora ($8d, x)	; 01 8d
B5_112f:		ora ($00, x)	; 01 00
B5_1131:		sed				; f8
B5_1132:		eor ($8d, x)	; 41 8d


B5_1134:		ora ($02, x)	; 01 02
B5_1136:		sed				; f8
B5_1137:		sed				; f8
B5_1138:		ora ($ab, x)	; 01 ab
B5_113a:	.db $bb


B5_113b:		ora ($02, x)	; 01 02
B5_113d:		sed				; f8
B5_113e:		sed				; f8
B5_113f:		ora ($6b, x)	; 01 6b
B5_1141:		adc $0201		; 6d 01 02
B5_1144:		sed				; f8
B5_1145:		sed				; f8
B5_1146:		ora ($89, x)	; 01 89
B5_1148:		sta $0201, y	; 99 01 02
B5_114b:		sed				; f8
B5_114c:		sed				; f8
B5_114d:		ora ($8b, x)	; 01 8b
B5_114f:	.db $9b
B5_1150:	.db $02
B5_1151:	.db $02
B5_1152:		sed				; f8
B5_1153:		inx				; e8
B5_1154:		ora ($a9, x)	; 01 a9
B5_1156:		lda $fc01, y	; b9 01 fc
B5_1159:		sed				; f8
B5_115a:		ora ($b7, x)	; 01 b7
B5_115c:		ora ($01, x)	; 01 01
B5_115e:	.db $fc
B5_115f:		sed				; f8
B5_1160:		.db $00				; 00
B5_1161:	.db $8f
B5_1162:		ora ($01, x)	; 01 01
B5_1164:	.db $fc
B5_1165:		sed				; f8
B5_1166:		ora ($9f, x)	; 01 9f


data_5_1168:
B5_1168:		ora ($02, x)	; 01 02
B5_116a:		sed				; f8
B5_116b:		sed				; f8
B5_116c:	.db $02
B5_116d:		lda #$b9		; a9 b9
B5_116f:		ora ($02, x)	; 01 02
B5_1171:		sed				; f8
B5_1172:		sed				; f8
B5_1173:	.db $02
B5_1174:	.db $89
B5_1175:		sta $0201, y	; 99 01 02
B5_1178:		sed				; f8
B5_1179:		sed				; f8
B5_117a:	.db $02
B5_117b:	.db $8b
B5_117c:	.db $9b
B5_117d:		ora ($02, x)	; 01 02
B5_117f:		sed				; f8
B5_1180:		sed				; f8
B5_1181:	.db $02
B5_1182:	.db $ab
B5_1183:	.db $bb
B5_1184:	.db $02
B5_1185:	.db $02
B5_1186:		sed				; f8
B5_1187:		beq B5_118b ; f0 02

B5_1189:		lda #$b9		; a9 b9
B5_118b:	.db $02
B5_118c:		sed				; f8
B5_118d:		.db $00				; 00
B5_118e:	.db $02
B5_118f:	.db $ab
B5_1190:	.db $bb
B5_1191:	.db $02
B5_1192:	.db $02
B5_1193:		sed				; f8
B5_1194:		beq B5_1198 ; f0 02

B5_1196:		lda #$b9		; a9 b9
B5_1198:	.db $02
B5_1199:		sed				; f8
B5_119a:		.db $00				; 00
B5_119b:	.db $02
B5_119c:	.db $8b
B5_119d:	.db $9b
B5_119e:	.db $02
B5_119f:	.db $02
B5_11a0:		sed				; f8
B5_11a1:		;removed
	.db $f0 $02

B5_11a3:	.db $89
B5_11a4:		sta $f802, y	; 99 02 f8
B5_11a7:		.db $00				; 00
B5_11a8:	.db $02
B5_11a9:	.db $ab
B5_11aa:	.db $bb
B5_11ab:	.db $02
B5_11ac:	.db $02
B5_11ad:		sed				; f8
B5_11ae:		beq B5_11b2 ; f0 02

B5_11b0:		lda #$b9		; a9 b9
B5_11b2:	.db $02
B5_11b3:		sed				; f8
B5_11b4:		.db $00				; 00
B5_11b5:	.db $02
B5_11b6:	.db $ab
B5_11b7:	.db $bb
B5_11b8:	.db $03
B5_11b9:	.db $03
B5_11ba:	.db $f4
B5_11bb:		inx				; e8
B5_11bc:	.db $03
B5_11bd:	.db $cb
B5_11be:	.db $db
B5_11bf:	.db $eb
B5_11c0:	.db $03
B5_11c1:	.db $f4
B5_11c2:		sed				; f8
B5_11c3:	.db $03
B5_11c4:		cmp $eddd		; cd dd ed
B5_11c7:	.db $02
B5_11c8:		sed				; f8
B5_11c9:		php				; 08
B5_11ca:	.db $02
B5_11cb:	.db $e7
B5_11cc:	.db $f7
B5_11cd:	.db $03
B5_11ce:	.db $03
B5_11cf:	.db $f4
B5_11d0:		inx				; e8
B5_11d1:	.db $03
B5_11d2:	.db $cf
B5_11d3:	.db $df
B5_11d4:	.db $ef
B5_11d5:	.db $03
B5_11d6:	.db $f4
B5_11d7:		sed				; f8
B5_11d8:	.db $03
B5_11d9:		cmp $eddd		; cd dd ed
B5_11dc:	.db $02
B5_11dd:		sed				; f8
B5_11de:		php				; 08
B5_11df:	.db $02
B5_11e0:	.db $e7
B5_11e1:	.db $f7
B5_11e2:		ora ($02, x)	; 01 02
B5_11e4:		sed				; f8
B5_11e5:		sed				; f8
B5_11e6:	.db $03
B5_11e7:		sbc #$f9		; e9 f9
B5_11e9:		ora ($02, x)	; 01 02
B5_11eb:		sed				; f8
B5_11ec:		sed				; f8
B5_11ed:	.db $03
B5_11ee:	.db $fb
B5_11ef:		cmp $0201, y	; d9 01 02
B5_11f2:		sed				; f8
B5_11f3:		sed				; f8
B5_11f4:	.db $03
B5_11f5:	.db $ff
B5_11f6:		sbc $0201, x	; fd 01 02
B5_11f9:		sed				; f8
B5_11fa:		sed				; f8
B5_11fb:	.db $03
B5_11fc:		cmp #$c7		; c9 c7
B5_11fe:	.db $02
B5_11ff:	.db $02
B5_1200:		sed				; f8
B5_1201:		beq B5_1206 ; f0 03

B5_1203:		cmp ($d1, x)	; c1 d1
B5_1205:	.db $03
B5_1206:		sed				; f8
B5_1207:		.db $00				; 00
B5_1208:	.db $03
B5_1209:	.db $c3
B5_120a:	.db $d3
B5_120b:	.db $e3
B5_120c:	.db $02
B5_120d:	.db $02
B5_120e:		sed				; f8
B5_120f:		beq B5_1214 ; f0 03

B5_1211:		cmp $e5, x		; d5 e5
B5_1213:	.db $02
B5_1214:		sed				; f8
B5_1215:		.db $00				; 00
B5_1216:	.db $03
B5_1217:	.db $d7
B5_1218:	.db $e7
B5_1219:	.db $02
B5_121a:	.db $02
B5_121b:		sed				; f8
B5_121c:		beq B5_1221 ; f0 03

B5_121e:		sbc ($c5), y	; f1 c5
B5_1220:	.db $03
B5_1221:		sed				; f8
B5_1222:		.db $00				; 00
B5_1223:	.db $03
B5_1224:	.db $f3
B5_1225:	.db $c7
B5_1226:		sbc ($02, x)	; e1 02
B5_1228:	.db $02
B5_1229:		sed				; f8
B5_122a:		beq B5_122f ; f0 03

B5_122c:		cmp #$d9		; c9 d9
B5_122e:	.db $03
B5_122f:		sed				; f8
B5_1230:		.db $00				; 00
B5_1231:	.db $03
B5_1232:	.db $cb
B5_1233:	.db $db
B5_1234:	.db $f7
B5_1235:	.db $02
B5_1236:	.db $02
B5_1237:		sed				; f8
B5_1238:		beq B5_123d ; f0 03

B5_123a:		sbc #$f9		; e9 f9
B5_123c:	.db $03
B5_123d:	.db $f4
B5_123e:		.db $00				; 00
B5_123f:	.db $03
B5_1240:		sbc $eb			; e5 eb
B5_1242:	.db $fb
B5_1243:	.db $02
B5_1244:	.db $02
B5_1245:		sed				; f8
B5_1246:		beq B5_124b ; f0 03

B5_1248:		cmp $02dd		; cd dd 02
B5_124b:		sed				; f8
B5_124c:		.db $00				; 00
B5_124d:	.db $03
B5_124e:	.db $cf
B5_124f:	.db $df
B5_1250:	.db $02
B5_1251:	.db $02
B5_1252:		sed				; f8
B5_1253:		beq B5_1258 ; f0 03

B5_1255:		sbc $02fd		; edfd 02
B5_1258:		sed				; f8
B5_1259:		.db $00				; 00
B5_125a:	.db $03
B5_125b:	.db $ef
B5_125c:	.db $ff
B5_125d:	.db $02
B5_125e:	.db $03
B5_125f:	.db $f4
B5_1260:		beq B5_1264 ; f0 02

B5_1262:		sbc ($c5), y	; f1 c5
B5_1264:		cmp $03, x		; d5 03
B5_1266:	.db $f4
B5_1267:		.db $00				; 00
B5_1268:	.db $02
B5_1269:	.db $f3
B5_126a:	.db $c7
B5_126b:	.db $d7
B5_126c:	.db $02
B5_126d:	.db $03
B5_126e:	.db $f4
B5_126f:		beq B5_1273 ; f0 02

B5_1271:		sbc $f5			; e5 f5
B5_1273:		cmp #$03		; c9 03
B5_1275:	.db $f4
B5_1276:		.db $00				; 00
B5_1277:	.db $02
B5_1278:	.db $e7
B5_1279:	.db $f7
B5_127a:		cmp $0302, y	; d9 02 03
B5_127d:	.db $f4
B5_127e:		;removed
	.db $f0 $03

B5_1280:		cmp ($d1, x)	; c1 d1
B5_1282:		sbc ($03, x)	; e1 03
B5_1284:	.db $f4
B5_1285:		.db $00				; 00
B5_1286:	.db $03
B5_1287:	.db $c3
B5_1288:	.db $d3
B5_1289:	.db $e3
B5_128a:		ora $03			; 05 03
B5_128c:	.db $f3
B5_128d:		cpx #$00		; e0 00
B5_128f:	.db $db
B5_1290:	.db $eb
B5_1291:	.db $fb
B5_1292:	.db $03
B5_1293:	.db $f4
B5_1294:		beq B5_1299 ; f0 03

B5_1296:		cmp $fded, x	; dd ed fd
B5_1299:	.db $03
B5_129a:	.db $f4
B5_129b:		.db $00				; 00
B5_129c:	.db $03
B5_129d:	.db $df
B5_129e:	.db $ef
B5_129f:	.db $ff
B5_12a0:		ora ($fc, x)	; 01 fc
B5_12a2:		bpl B5_12a7 ; 10 03

B5_12a4:		sbc #$01		; e9 01
B5_12a6:	.db $fc
B5_12a7:		jsr $f903		; 20 03 f9
B5_12aa:		ora $02			; 05 02
B5_12ac:		inc $e0, x		; f6 e0
B5_12ae:		.db $00				; 00
B5_12af:		cmp $03cf		; cd cf 03
B5_12b2:	.db $f4
B5_12b3:		beq B5_12b8 ; f0 03

B5_12b5:		cmp $fded, x	; dd ed fd
B5_12b8:	.db $03
B5_12b9:	.db $f4
B5_12ba:		.db $00				; 00
B5_12bb:	.db $03
B5_12bc:	.db $df
B5_12bd:	.db $ef
B5_12be:	.db $ff
B5_12bf:		ora ($fc, x)	; 01 fc
B5_12c1:		bpl B5_12c6 ; 10 03

B5_12c3:		sbc #$01		; e9 01
B5_12c5:	.db $fc
B5_12c6:		jsr $f903		; 20 03 f9
B5_12c9:	.db $02
B5_12ca:	.db $02
B5_12cb:		sbc $02f0, y	; f9 f0 02
B5_12ce:		sbc ($f1, x)	; e1 f1
B5_12d0:	.db $04
B5_12d1:		beq B5_12d3 ; f0 00

B5_12d3:	.db $02
B5_12d4:	.db $c3
B5_12d5:	.db $d3
B5_12d6:	.db $e3
B5_12d7:	.db $f3
B5_12d8:	.db $03
B5_12d9:	.db $02
B5_12da:		sbc $02f0, y	; f9 f0 02
B5_12dd:		sbc ($f1, x)	; e1 f1
B5_12df:	.db $03
B5_12e0:		sed				; f8
B5_12e1:		.db $00				; 00
B5_12e2:	.db $02
B5_12e3:	.db $d3
B5_12e4:	.db $e3
B5_12e5:	.db $f3
B5_12e6:		ora ($f0, x)	; 01 f0
B5_12e8:		inc $d102, x	; fe 02 d1
B5_12eb:		ora ($04, x)	; 01 04
B5_12ed:		;removed
	.db $f0 $f8

B5_12ef:	.db $02
B5_12f0:	.db $cf
B5_12f1:	.db $df
B5_12f2:	.db $ef
B5_12f3:		cmp $01, x		; d5 01
B5_12f5:	.db $04
B5_12f6:		beq B5_12f0 ; f0 f8

B5_12f8:	.db $02
B5_12f9:		sbc $fffd		; edfd ff
B5_12fc:		cmp $01, x		; d5 01
B5_12fe:	.db $04
B5_12ff:		beq B5_12f9 ; f0 f8

B5_1301:	.db $02
B5_1302:		cmp $ffdd		; cd dd ff
B5_1305:		cmp $01, x		; d5 01
B5_1307:	.db $02
B5_1308:		sed				; f8
B5_1309:		sed				; f8
B5_130a:	.db $02
B5_130b:	.db $cb
B5_130c:	.db $db
B5_130d:	.db $02
B5_130e:	.db $03
B5_130f:	.db $f4
B5_1310:		;removed
	.db $f0 $02

B5_1312:		cmp $f9e9, y	; d9 e9 f9
B5_1315:	.db $03
B5_1316:	.db $f4
B5_1317:		.db $00				; 00
B5_1318:	.db $02
B5_1319:	.db $db
B5_131a:	.db $eb
B5_131b:	.db $fb
B5_131c:	.db $02
B5_131d:	.db $02
B5_131e:	.db $fa
B5_131f:		;removed
	.db $f0 $02

B5_1321:		sbc $02fd		; edfd 02
B5_1324:	.db $fa
B5_1325:		.db $00				; 00
B5_1326:	.db $02
B5_1327:	.db $ef
B5_1328:	.db $ff
B5_1329:	.db $02
B5_132a:	.db $03
B5_132b:	.db $f4
B5_132c:		;removed
	.db $f0 $02

B5_132e:		cmp $c9dd		; cd dd c9
B5_1331:	.db $03
B5_1332:	.db $f4
B5_1333:		.db $00				; 00
B5_1334:	.db $02
B5_1335:	.db $cf
B5_1336:	.db $df
B5_1337:	.db $cb
B5_1338:		ora ($04, x)	; 01 04
B5_133a:		beq B5_133c ; f0 00

B5_133c:	.db $02
B5_133d:	.db $e7
B5_133e:	.db $f7
B5_133f:		sbc $f5			; e5 f5
B5_1341:		ora ($03, x)	; 01 03
B5_1343:	.db $f4
B5_1344:		sed				; f8
B5_1345:	.db $02
B5_1346:		cmp #$d9		; c9 d9
B5_1348:		sbc #$01		; e9 01
B5_134a:	.db $03
B5_134b:	.db $f4
B5_134c:		sed				; f8
B5_134d:	.db $02
B5_134e:	.db $cb
B5_134f:	.db $db
B5_1350:	.db $eb
B5_1351:		ora ($03, x)	; 01 03
B5_1353:	.db $f4
B5_1354:		sed				; f8
B5_1355:	.db $02
B5_1356:	.db $cb
B5_1357:		sbc ($f1, x)	; e1 f1
B5_1359:		ora ($03, x)	; 01 03
B5_135b:	.db $f4
B5_135c:		sed				; f8
B5_135d:	.db $02
B5_135e:	.db $cb
B5_135f:		cmp ($f1), y	; d1 f1
B5_1361:		ora ($01, x)	; 01 01
B5_1363:	.db $fc
B5_1364:		sed				; f8
B5_1365:	.db $02
B5_1366:		sbc $0101, y	; f9 01 01
B5_1369:	.db $fc
B5_136a:		sed				; f8
B5_136b:	.db $02
B5_136c:	.db $fb
B5_136d:	.db $02
B5_136e:	.db $04
B5_136f:	.db $f4
B5_1370:		beq B5_1374 ; f0 02

B5_1372:		cmp ($d1, x)	; c1 d1
B5_1374:		sbc ($f1, x)	; e1 f1
B5_1376:	.db $04
B5_1377:	.db $f4
B5_1378:		.db $00				; 00
B5_1379:	.db $02
B5_137a:	.db $c3
B5_137b:	.db $d3
B5_137c:	.db $e3
B5_137d:	.db $f3
B5_137e:	.db $02
B5_137f:	.db $04
B5_1380:	.db $f4
B5_1381:		beq B5_1385 ; f0 02

B5_1383:		cmp $d5			; c5 d5
B5_1385:		sbc $f5			; e5 f5
B5_1387:	.db $04
B5_1388:	.db $f4
B5_1389:		.db $00				; 00
B5_138a:	.db $02
B5_138b:	.db $c7
B5_138c:	.db $d7
B5_138d:	.db $e7
B5_138e:	.db $f7
B5_138f:	.db $02
B5_1390:	.db $04
B5_1391:	.db $f4
B5_1392:		beq B5_1356 ; f0 c2

B5_1394:	.db $f3
B5_1395:	.db $e3
B5_1396:	.db $d3
B5_1397:	.db $c3
B5_1398:	.db $04
B5_1399:	.db $f4
B5_139a:		.db $00				; 00
B5_139b:	.db $c2
B5_139c:		sbc ($e1), y	; f1 e1
B5_139e:		cmp ($c1), y	; d1 c1
B5_13a0:	.db $02
B5_13a1:	.db $04
B5_13a2:	.db $f4
B5_13a3:		;removed
	.db $f0 $c2

B5_13a5:	.db $f7
B5_13a6:	.db $e7
B5_13a7:	.db $d7
B5_13a8:	.db $c7
B5_13a9:	.db $04
B5_13aa:	.db $f4
B5_13ab:		.db $00				; 00
B5_13ac:	.db $c2
B5_13ad:		sbc $e5, x		; f5 e5
B5_13af:		cmp $c5, x		; d5 c5
B5_13b1:		ora ($03, x)	; 01 03
B5_13b3:	.db $f4
B5_13b4:		sed				; f8
B5_13b5:		.db $00				; 00
B5_13b6:		sta ($91, x)	; 81 91
B5_13b8:		lda ($01, x)	; a1 01
B5_13ba:	.db $03
B5_13bb:	.db $f4
B5_13bc:		sed				; f8
B5_13bd:		.db $00				; 00
B5_13be:		lda ($83), y	; b1 83
B5_13c0:	.db $93
B5_13c1:		ora ($02, x)	; 01 02
B5_13c3:		sed				; f8
B5_13c4:		sed				; f8
B5_13c5:		.db $00				; 00
B5_13c6:	.db $a3
B5_13c7:	.db $b3
B5_13c8:		ora ($02, x)	; 01 02
B5_13ca:		sed				; f8
B5_13cb:		sed				; f8
B5_13cc:		.db $00				; 00
B5_13cd:		sta $95			; 85 95
B5_13cf:	.db $02
B5_13d0:		ora ($f8, x)	; 01 f8
B5_13d2:		sed				; f8
B5_13d3:		.db $00				; 00
B5_13d4:		lda $01			; a5 01
B5_13d6:		.db $00				; 00
B5_13d7:		sed				; f8
B5_13d8:		rti				; 40


B5_13d9:		lda $02			; a5 02
B5_13db:		ora ($f8, x)	; 01 f8
B5_13dd:		sed				; f8
B5_13de:		.db $00				; 00
B5_13df:		lda $01, x		; b5 01
B5_13e1:		.db $00				; 00
B5_13e2:		sed				; f8
B5_13e3:		rti				; 40


B5_13e4:		lda $01, x		; b5 01
B5_13e6:	.db $02
B5_13e7:		sed				; f8
B5_13e8:		sed				; f8
B5_13e9:	.db $02
B5_13ea:	.db $a7
B5_13eb:	.db $b7
B5_13ec:		ora ($02, x)	; 01 02
B5_13ee:		sed				; f8
B5_13ef:		sed				; f8
B5_13f0:		.db $00				; 00
B5_13f1:		eor #$59		; 49 59
B5_13f3:	.db $02
B5_13f4:	.db $02
B5_13f5:		beq B5_13f7 ; f0 00

B5_13f7:	.db $02
B5_13f8:	.db $9f
B5_13f9:	.db $af
B5_13fa:	.db $02
B5_13fb:		.db $00				; 00
B5_13fc:		.db $00				; 00
B5_13fd:	.db $42
B5_13fe:	.db $af
B5_13ff:	.db $9f
B5_1400:		asl $01			; 06 01
B5_1402:		sed				; f8
B5_1403:		cpx #$02		; e0 02
B5_1405:	.db $97
B5_1406:		ora ($00, x)	; 01 00
B5_1408:		cpx #$42		; e0 42
B5_140a:	.db $97
B5_140b:		ora ($f8, x)	; 01 f8
B5_140d:		;removed
	.db $f0 $02

B5_140f:	.db $87
B5_1410:		ora ($00, x)	; 01 00
B5_1412:		;removed
	.db $f0 $42

B5_1414:	.db $87
B5_1415:		ora ($f8, x)	; 01 f8
B5_1417:		.db $00				; 00
B5_1418:	.db $02
B5_1419:	.db $bf
B5_141a:		ora ($00, x)	; 01 00
B5_141c:		.db $00				; 00
B5_141d:	.db $42
B5_141e:	.db $bf
B5_141f:	.db $02
B5_1420:	.db $03
B5_1421:	.db $f4
B5_1422:		;removed
	.db $f0 $03

B5_1424:		cmp ($d1, x)	; c1 d1
B5_1426:		sbc ($03, x)	; e1 03
B5_1428:	.db $f4
B5_1429:		.db $00				; 00
B5_142a:	.db $03
B5_142b:	.db $c3
B5_142c:	.db $d3
B5_142d:	.db $e3
B5_142e:	.db $02
B5_142f:	.db $03
B5_1430:	.db $f4
B5_1431:		;removed
	.db $f0 $03

B5_1433:		cmp $d5			; c5 d5
B5_1435:		sbc $03			; e5 03
B5_1437:	.db $f4
B5_1438:		.db $00				; 00
B5_1439:	.db $03
B5_143a:	.db $c7
B5_143b:	.db $d7
B5_143c:	.db $e7
B5_143d:	.db $02
B5_143e:	.db $04
B5_143f:		inc $fa, x		; f6 fa
B5_1441:	.db $03
B5_1442:		cmp $eddd		; cd dd ed
B5_1445:		sbc $f604, x	; fd 04 f6
B5_1448:		asl a			; 0a
B5_1449:	.db $03
B5_144a:	.db $cf
B5_144b:	.db $df
B5_144c:	.db $ef
B5_144d:	.db $ff
B5_144e:	.db $02
B5_144f:	.db $04
B5_1450:		inc $fa, x		; f6 fa
B5_1452:	.db $03
B5_1453:	.db $f7
B5_1454:		cmp $fded, x	; dd ed fd
B5_1457:	.db $04
B5_1458:		inc $0a, x		; f6 0a
B5_145a:	.db $03
B5_145b:	.db $cf
B5_145c:	.db $df
B5_145d:		sbc $ff, x		; f5 ff
B5_145f:	.db $f2
B5_1460:	.db $80
B5_1461:	.db $f3
B5_1462:	.db $80
B5_1463:	.db $f3
B5_1464:		sta ($f2, x)	; 81 f2
B5_1466:		sta ($f3, x)	; 81 f3
B5_1468:	.db $82
B5_1469:	.db $02
B5_146a:	.db $03
B5_146b:	.db $f4
B5_146c:		;removed
	.db $f0 $03

B5_146e:		cmp ($e1), y	; d1 e1
B5_1470:		sbc ($03), y	; f1 03
B5_1472:	.db $f4
B5_1473:		.db $00				; 00
B5_1474:	.db $03
B5_1475:	.db $d3
B5_1476:	.db $e3
B5_1477:	.db $f3
B5_1478:	.db $02
B5_1479:	.db $03
B5_147a:	.db $f4
B5_147b:		;removed
	.db $f0 $03

B5_147d:		cmp ($c5), y	; d1 c5
B5_147f:		cmp ($03, x)	; c1 03
B5_1481:	.db $f4
B5_1482:		.db $00				; 00
B5_1483:	.db $03
B5_1484:	.db $d3
B5_1485:	.db $c7
B5_1486:	.db $c3
B5_1487:	.db $03
B5_1488:	.db $03
B5_1489:	.db $f4
B5_148a:		;removed
	.db $f0 $03

B5_148c:		cmp $e5, x		; d5 e5
B5_148e:		sbc $02, x		; f5 02
B5_1490:	.db $fc
B5_1491:		.db $00				; 00
B5_1492:	.db $03
B5_1493:	.db $e7
B5_1494:	.db $f7
B5_1495:		ora ($f4, x)	; 01 f4
B5_1497:		.db $00				; 00
B5_1498:	.db $83
B5_1499:		cmp $01, x		; d5 01
B5_149b:	.db $03
B5_149c:	.db $f4
B5_149d:		sed				; f8
B5_149e:	.db $03
B5_149f:		cmp $fded, x	; dd ed fd
B5_14a2:		ora ($03, x)	; 01 03
B5_14a4:	.db $f4
B5_14a5:		sed				; f8
B5_14a6:	.db $03
B5_14a7:	.db $ff
B5_14a8:		cmp $01ef		; cd ef 01
B5_14ab:	.db $03
B5_14ac:	.db $f4
B5_14ad:		sed				; f8
B5_14ae:	.db $03
B5_14af:	.db $cf
B5_14b0:	.db $df
B5_14b1:	.db $ef
B5_14b2:		ora ($02, x)	; 01 02
B5_14b4:		sed				; f8
B5_14b5:		sed				; f8
B5_14b6:	.db $03
B5_14b7:	.db $cb
B5_14b8:	.db $db
B5_14b9:	.db $03
B5_14ba:		ora ($fc, x)	; 01 fc
B5_14bc:		cpx #$03		; e0 03
B5_14be:		sbc ($03), y	; f1 03
B5_14c0:	.db $f4
B5_14c1:		;removed
	.db $f0 $03

B5_14c3:		cmp ($d1, x)	; c1 d1
B5_14c5:		sbc ($03, x)	; e1 03
B5_14c7:	.db $f4
B5_14c8:		.db $00				; 00
B5_14c9:	.db $03
B5_14ca:	.db $c3
B5_14cb:	.db $d3
B5_14cc:	.db $e3
B5_14cd:	.db $03
B5_14ce:		ora ($fc, x)	; 01 fc
B5_14d0:		cpx #$03		; e0 03
B5_14d2:	.db $f3
B5_14d3:	.db $03
B5_14d4:	.db $f4
B5_14d5:		;removed
	.db $f0 $03

B5_14d7:		cmp #$d9		; c9 d9
B5_14d9:		sbc #$03		; e9 03
B5_14db:	.db $f4
B5_14dc:		.db $00				; 00
B5_14dd:	.db $03
B5_14de:	.db $cb
B5_14df:	.db $db
B5_14e0:	.db $eb
B5_14e1:	.db $03
B5_14e2:		ora ($fc, x)	; 01 fc
B5_14e4:		cpx #$03		; e0 03
B5_14e6:		sbc ($03), y	; f1 03
B5_14e8:	.db $f4
B5_14e9:		;removed
	.db $f0 $03

B5_14eb:		cmp $d5			; c5 d5
B5_14ed:		sbc $03			; e5 03
B5_14ef:	.db $f4
B5_14f0:		.db $00				; 00
B5_14f1:	.db $03
B5_14f2:	.db $c7
B5_14f3:	.db $d7
B5_14f4:	.db $e7
B5_14f5:	.db $03
B5_14f6:		ora ($fc, x)	; 01 fc
B5_14f8:		cpx #$03		; e0 03
B5_14fa:		sbc ($03), y	; f1 03
B5_14fc:	.db $f4
B5_14fd:		beq B5_1502 ; f0 03

B5_14ff:	.db $cf
B5_1500:	.db $df
B5_1501:	.db $ef
B5_1502:	.db $03
B5_1503:	.db $f4
B5_1504:		.db $00				; 00
B5_1505:	.db $03
B5_1506:	.db $cb
B5_1507:	.db $db
B5_1508:	.db $eb
B5_1509:	.db $03
B5_150a:	.db $02
B5_150b:	.db $f4
B5_150c:		cpx #$03		; e0 03
B5_150e:	.db $f7
B5_150f:		sbc $03, x		; f5 03
B5_1511:	.db $f4
B5_1512:		beq B5_1517 ; f0 03

B5_1514:		cmp $eddd		; cd dd ed
B5_1517:	.db $03
B5_1518:	.db $f4
B5_1519:		.db $00				; 00
B5_151a:	.db $03
B5_151b:	.db $cb
B5_151c:	.db $db
B5_151d:	.db $eb
B5_151e:		ora ($01, x)	; 01 01
B5_1520:	.db $fc
B5_1521:		sed				; f8
B5_1522:	.db $03
B5_1523:	.db $fb
B5_1524:		ora ($02, x)	; 01 02
B5_1526:		sed				; f8
B5_1527:		sed				; f8
B5_1528:	.db $03
B5_1529:		sbc $02ff, x	; fd ff 02
B5_152c:	.db $02
B5_152d:		.db $00				; 00
B5_152e:		.db $00				; 00
B5_152f:		.db $00				; 00
B5_1530:		cpy #$d0		; c0 d0
B5_1532:	.db $02
B5_1533:		.db $00				; 00
B5_1534:		bpl B5_1536 ; 10 00

B5_1536:	.db $c2
B5_1537:	.db $d2
B5_1538:	.db $02
B5_1539:	.db $03
B5_153a:		.db $00				; 00
B5_153b:		.db $00				; 00
B5_153c:		jsr $d4c4		; 20 c4 d4
B5_153f:		cpx $03			; e4 03
B5_1541:		.db $00				; 00
B5_1542:		bpl B5_1564 ; 10 20

B5_1544:		dec $d6			; c6 d6
B5_1546:		inc $01			; e6 01
B5_1548:		ora ($00, x)	; 01 00
B5_154a:		.db $00				; 00
B5_154b:	.db $03
B5_154c:		cpx #$01		; e0 01
B5_154e:		ora ($00, x)	; 01 00
B5_1550:		.db $00				; 00
B5_1551:	.db $03
B5_1552:		beq B5_1555 ; f0 01

B5_1554:	.db $02
B5_1555:		sed				; f8
B5_1556:		sed				; f8
B5_1557:		.db $00				; 00
B5_1558:		adc #$79		; 69 79
B5_155a:		ora ($01, x)	; 01 01
B5_155c:	.db $fc
B5_155d:		sed				; f8
B5_155e:		.db $00				; 00
B5_155f:		adc $0201, x	; 7d 01 02
B5_1562:		sed				; f8
B5_1563:		sed				; f8
B5_1564:		rti				; 40


B5_1565:		.db $79 $69


data_5_1567:
.db $02
B5_1568:		ora ($f8, x)	; 01 f8
B5_156a:		.db $00				; 00
B5_156b:		.db $00				; 00
B5_156c:	.db $ac $01 $00
B5_156f:		.db $00				; 00
B5_1570:		rti				; 40


B5_1571:		ldy $0102		; ac 02 01
B5_1574:		sed				; f8
B5_1575:		.db $00				; 00
B5_1576:	.db $03
B5_1577:		inc $01, x		; f6 01
B5_1579:		.db $00				; 00
B5_157a:		.db $00				; 00
B5_157b:	.db $43
B5_157c:		inc $02, x		; f6 02
B5_157e:		ora ($f8, x)	; 01 f8
B5_1580:		.db $00				; 00
B5_1581:	.db $03
B5_1582:		sed				; f8
B5_1583:		ora ($00, x)	; 01 00
B5_1585:		.db $00				; 00
B5_1586:	.db $43
B5_1587:		sed				; f8
B5_1588:	.db $02
B5_1589:		ora ($f8, x)	; 01 f8
B5_158b:		.db $00				; 00
B5_158c:	.db $03
B5_158d:	.db $ae $01 $00
B5_1590:		.db $00				; 00
B5_1591:	.db $43
B5_1592:		ldx $02f1		; ae f1 02
B5_1595:	.db $04
B5_1596:		beq B5_1588 ; f0 f0

B5_1598:	.db $03
B5_1599:		ora ($11, x)	; 01 11
B5_159b:		and ($31, x)	; 21 31
B5_159d:	.db $04
B5_159e:		beq B5_15a0 ; f0 00

B5_15a0:	.db $03
B5_15a1:	.db $03
B5_15a2:	.db $13
B5_15a3:	.db $23
B5_15a4:	.db $33
B5_15a5:		sbc ($02), y	; f1 02
B5_15a7:	.db $02
B5_15a8:		sed				; f8
B5_15a9:		cpx #$03		; e0 03
B5_15ab:		and #$39		; 29 39
B5_15ad:	.db $02
B5_15ae:		sed				; f8
B5_15af:		cpx #$43		; e0 43
B5_15b1:		and $f129, y	; 39 29 f1
B5_15b4:	.db $02
B5_15b5:	.db $02
B5_15b6:		sed				; f8
B5_15b7:		cpx #$03		; e0 03
B5_15b9:	.db $0b
B5_15ba:	.db $1b
B5_15bb:	.db $02
B5_15bc:		sed				; f8
B5_15bd:		cpx #$43		; e0 43
B5_15bf:	.db $1b
B5_15c0:	.db $0b
B5_15c1:		sbc ($02), y	; f1 02
B5_15c3:	.db $02
B5_15c4:		sed				; f8
B5_15c5:		cpx #$03		; e0 03
B5_15c7:	.db $0b
B5_15c8:	.db $1b
B5_15c9:	.db $02
B5_15ca:		sed				; f8
B5_15cb:		cpx #$43		; e0 43
B5_15cd:	.db $1b
B5_15ce:	.db $0b
B5_15cf:		sbc ($03), y	; f1 03
B5_15d1:	.db $04
B5_15d2:		beq B5_15c4 ; f0 f0

B5_15d4:	.db $03
B5_15d5:		ora $15			; 05 15
B5_15d7:		and $35			; 25 35
B5_15d9:	.db $04
B5_15da:		beq B5_15dc ; f0 00

B5_15dc:	.db $03
B5_15dd:	.db $07
B5_15de:	.db $17
B5_15df:	.db $27
B5_15e0:	.db $37
B5_15e1:		ora ($fc, x)	; 01 fc
B5_15e3:		bpl B5_15e8 ; 10 03

B5_15e5:	.db $3b
B5_15e6:		sbc ($02), y	; f1 02
B5_15e8:	.db $04
B5_15e9:		;removed
	.db $f0 $f0

B5_15eb:	.db $03
B5_15ec:		ora $2d1d		; 0d 1d 2d
B5_15ef:		and $f004, x	; 3d 04 f0
B5_15f2:		.db $00				; 00
B5_15f3:	.db $03
B5_15f4:	.db $0f
B5_15f5:	.db $1f
B5_15f6:	.db $2f
B5_15f7:	.db $3f
B5_15f8:		tya				; 98
B5_15f9:	.db $80
B5_15fa:		sta $9880, y	; 99 80 98
B5_15fd:		sta ($99, x)	; 81 99
B5_15ff:		sta ($f0, x)	; 81 f0
B5_1601:	.db $80
B5_1602:		beq B5_1607 ; f0 03

B5_1604:	.db $04
B5_1605:		beq B5_15ef ; f0 e8

B5_1607:	.db $03
B5_1608:	.db $07
B5_1609:	.db $17
B5_160a:	.db $27
B5_160b:	.db $37
B5_160c:	.db $04
B5_160d:		beq B5_1607 ; f0 f8

B5_160f:	.db $03
B5_1610:		ora #$19		; 09 19
B5_1612:		and #$39		; 29 39
B5_1614:	.db $04
B5_1615:		beq B5_161f ; f0 08

B5_1617:	.db $03
B5_1618:		ora $15			; 05 15
B5_161a:		and $35			; 25 35
B5_161c:		;removed
	.db $f0 $02

B5_161e:	.db $04
B5_161f:		;removed
	.db $f0 $f8

B5_1621:	.db $03
B5_1622:	.db $0b
B5_1623:	.db $1b
B5_1624:	.db $2b
B5_1625:	.db $3b
B5_1626:	.db $04
B5_1627:		beq B5_1631 ; f0 08

B5_1629:	.db $03
B5_162a:		ora $2d1d		; 0d 1d 2d
B5_162d:		and $0103, x	; 3d 03 01
B5_1630:	.db $fc
B5_1631:		cld				; d8
B5_1632:	.db $83
B5_1633:	.db $ff
B5_1634:		ora ($fc, x)	; 01 fc
B5_1636:		inx				; e8
B5_1637:	.db $83
B5_1638:		sbc $fc01, x	; fd 01 fc
B5_163b:		sed				; f8
B5_163c:	.db $83
B5_163d:		sbc $029c		; ed9c 02
B5_1640:	.db $04
B5_1641:		beq B5_1633 ; f0 f0

B5_1643:	.db $03
B5_1644:		ora ($11, x)	; 01 11
B5_1646:		and ($31, x)	; 21 31
B5_1648:	.db $04
B5_1649:		beq B5_164b ; f0 00

B5_164b:	.db $03
B5_164c:	.db $03
B5_164d:	.db $13
B5_164e:	.db $23
B5_164f:	.db $33
B5_1650:	.db $9c
B5_1651:	.db $02
B5_1652:	.db $04
B5_1653:		;removed
	.db $f0 $f0

B5_1655:	.db $03
B5_1656:		ora $15			; 05 15
B5_1658:		and $35			; 25 35
B5_165a:	.db $04
B5_165b:		beq B5_165d ; f0 00

B5_165d:	.db $03
B5_165e:	.db $07
B5_165f:	.db $17
B5_1660:	.db $27
B5_1661:	.db $37
B5_1662:	.db $9c
B5_1663:	.db $02
B5_1664:	.db $04
B5_1665:		;removed
	.db $f0 $f0

B5_1667:	.db $22
B5_1668:		ora #$19		; 09 19
B5_166a:		and #$39		; 29 39
B5_166c:	.db $04
B5_166d:		beq B5_166f ; f0 00

B5_166f:	.db $22
B5_1670:	.db $0b
B5_1671:	.db $1b
B5_1672:	.db $2b
B5_1673:	.db $3b
B5_1674:		txs				; 9a
B5_1675:		sta $9b			; 85 9b
B5_1677:		stx $9a			; 86 9a
B5_1679:		sta $9b			; 85 9b
B5_167b:		stx $01			; 86 01
B5_167d:	.db $02
B5_167e:		sed				; f8
B5_167f:		sed				; f8
B5_1680:	.db $03
B5_1681:	.db $ef
B5_1682:	.db $ff
B5_1683:		ora ($02, x)	; 01 02
B5_1685:		sed				; f8
B5_1686:		sed				; f8
B5_1687:	.db $03
B5_1688:	.db $cf
B5_1689:	.db $df
B5_168a:	.db $9f
B5_168b:		ora $02			; 05 02
B5_168d:		sed				; f8
B5_168e:		cpx #$03		; e0 03
B5_1690:		ora ($11, x)	; 01 11
B5_1692:	.db $04
B5_1693:		beq B5_1685 ; f0 f0

B5_1695:	.db $03
B5_1696:	.db $03
B5_1697:	.db $13
B5_1698:	.db $23
B5_1699:	.db $33
B5_169a:	.db $04
B5_169b:		beq B5_169d ; f0 00

B5_169d:	.db $03
B5_169e:		ora $15			; 05 15
B5_16a0:		and $35			; 25 35
B5_16a2:		asl $e8			; 06 e8
B5_16a4:		bpl B5_16a8 ; 10 02

B5_16a6:	.db $07
B5_16a7:	.db $17
B5_16a8:	.db $27
B5_16a9:	.db $37
B5_16aa:		and #$39		; 29 39
B5_16ac:	.db $04
B5_16ad:		beq B5_16cf ; f0 20

B5_16af:		ora ($21, x)	; 01 21
B5_16b1:		and ($2b), y	; 31 2b
B5_16b3:	.db $3b
B5_16b4:	.db $02
B5_16b5:	.db $02
B5_16b6:		sed				; f8
B5_16b7:		beq B5_16bc ; f0 03

B5_16b9:		cmp #$d9		; c9 d9
B5_16bb:	.db $02
B5_16bc:		sed				; f8
B5_16bd:		.db $00				; 00
B5_16be:	.db $03
B5_16bf:	.db $cb
B5_16c0:	.db $db
B5_16c1:	.db $02
B5_16c2:	.db $02
B5_16c3:		sed				; f8
B5_16c4:		beq B5_16c9 ; f0 03

B5_16c6:		cmp $02dd		; cd dd 02
B5_16c9:		sed				; f8
B5_16ca:		.db $00				; 00
B5_16cb:	.db $03
B5_16cc:	.db $cf
B5_16cd:	.db $df
B5_16ce:	.db $02
B5_16cf:	.db $02
B5_16d0:		sed				; f8
B5_16d1:		beq B5_16d6 ; f0 03

B5_16d3:		sbc $02fd		; edfd 02
B5_16d6:		sed				; f8
B5_16d7:		.db $00				; 00
B5_16d8:	.db $03
B5_16d9:	.db $ef
B5_16da:	.db $ff
B5_16db:		sta $9e83, x	; 9d 83 9e
B5_16de:	.db $83
B5_16df:		sta $9e84, x	; 9d 84 9e
B5_16e2:		sty $01			; 84 01
B5_16e4:	.db $04
B5_16e5:		beq B5_16df ; f0 f8

B5_16e7:		ora ($ef, x)	; 01 ef
B5_16e9:	.db $ef
B5_16ea:	.db $ef
B5_16eb:	.db $ef
B5_16ec:	.db $f4
B5_16ed:	.db $80
B5_16ee:		sbc $80, x		; f5 80
B5_16f0:	.db $f4
B5_16f1:		sta ($f5, x)	; 81 f5
B5_16f3:		sta ($f5, x)	; 81 f5
B5_16f5:	.db $82
B5_16f6:		inc $80, x		; f6 80
B5_16f8:	.db $f7
B5_16f9:	.db $80
B5_16fa:		inc $81, x		; f6 81
B5_16fc:	.db $f7
B5_16fd:		sta ($f7, x)	; 81 f7
B5_16ff:	.db $82
B5_1700:		ora ($01, x)	; 01 01
B5_1702:	.db $fc
B5_1703:	.db $fc
B5_1704:	.db $03
B5_1705:		cmp ($01, x)	; c1 01
B5_1707:	.db $03
B5_1708:	.db $f4
B5_1709:		.db $00				; 00
B5_170a:	.db $23
B5_170b:		cmp ($e1), y	; d1 e1
B5_170d:		sbc ($01), y	; f1 01
B5_170f:	.db $03
B5_1710:	.db $f4
B5_1711:		.db $00				; 00
B5_1712:	.db $23
B5_1713:	.db $d3
B5_1714:	.db $e3
B5_1715:	.db $f3
B5_1716:	.db $02
B5_1717:	.db $02
B5_1718:		sed				; f8
B5_1719:		beq B5_171e ; f0 03

B5_171b:	.db $c7
B5_171c:	.db $d7
B5_171d:	.db $04
B5_171e:		beq B5_1720 ; f0 00

B5_1720:	.db $03
B5_1721:		cmp $d5			; c5 d5
B5_1723:		sbc $f5			; e5 f5
B5_1725:	.db $02
B5_1726:	.db $02
B5_1727:		sed				; f8
B5_1728:		beq B5_172d ; f0 03

B5_172a:	.db $e7
B5_172b:	.db $f7
B5_172c:	.db $04
B5_172d:		beq B5_172f ; f0 00

B5_172f:	.db $03
B5_1730:		cmp $d5			; c5 d5
B5_1732:		sbc $f5			; e5 f5
B5_1734:		ora ($02, x)	; 01 02
B5_1736:		sed				; f8
B5_1737:		sed				; f8
B5_1738:	.db $02
B5_1739:		sbc $02fd		; edfd 02
B5_173c:	.db $02
B5_173d:		beq B5_173f ; f0 00

B5_173f:	.db $03
B5_1740:	.db $eb
B5_1741:	.db $fb
B5_1742:	.db $02
B5_1743:		.db $00				; 00
B5_1744:		.db $00				; 00
B5_1745:	.db $43
B5_1746:	.db $fb
B5_1747:	.db $eb
B5_1748:	.db $02
B5_1749:	.db $02
B5_174a:		beq B5_174c ; f0 00

B5_174c:	.db $03
B5_174d:	.db $cb
B5_174e:	.db $db
B5_174f:	.db $02
B5_1750:		.db $00				; 00
B5_1751:		.db $00				; 00
B5_1752:	.db $43
B5_1753:	.db $db
B5_1754:	.db $cb
B5_1755:	.db $02
B5_1756:	.db $02
B5_1757:		beq B5_1759 ; f0 00

B5_1759:	.db $03
B5_175a:		cmp #$d9		; c9 d9
B5_175c:	.db $02
B5_175d:		.db $00				; 00
B5_175e:		.db $00				; 00
B5_175f:	.db $43
B5_1760:		cmp $01c9, y	; d9 c9 01
B5_1763:	.db $02
B5_1764:		sed				; f8
B5_1765:		sed				; f8
B5_1766:	.db $03
B5_1767:		cmp $01dd		; cd dd 01
B5_176a:	.db $02
B5_176b:		sed				; f8
B5_176c:		sed				; f8
B5_176d:	.db $03
B5_176e:	.db $cf
B5_176f:	.db $df
B5_1770:		ora ($03, x)	; 01 03
B5_1772:	.db $f4
B5_1773:		sed				; f8
B5_1774:	.db $02
B5_1775:	.db $a7
B5_1776:	.db $b7
B5_1777:	.db $9f
B5_1778:		ora ($03, x)	; 01 03
B5_177a:	.db $f4
B5_177b:		.db $00				; 00
B5_177c:	.db $03
B5_177d:		cmp ($e1), y	; d1 e1
B5_177f:		sbc ($01), y	; f1 01
B5_1781:	.db $03
B5_1782:	.db $f4
B5_1783:		.db $00				; 00
B5_1784:	.db $03
B5_1785:	.db $d3
B5_1786:	.db $e3
B5_1787:	.db $f3
B5_1788:	.db $9c
B5_1789:	.db $02
B5_178a:	.db $04
B5_178b:		beq B5_177d ; f0 f0

B5_178d:	.db $22
B5_178e:		ora $2d1d		; 0d 1d 2d
B5_1791:		and $f004, x	; 3d 04 f0
B5_1794:		.db $00				; 00
B5_1795:	.db $22
B5_1796:	.db $0f
B5_1797:	.db $1f
B5_1798:	.db $2f
B5_1799:	.db $3f
B5_179a:		ora ($01, x)	; 01 01
B5_179c:	.db $ff
B5_179d:	.db $ff
B5_179e:		.db $00				; 00
B5_179f:		nop				; ea
B5_17a0:		ora ($01, x)	; 01 01
B5_17a2:	.db $04
B5_17a3:	.db $ef
B5_17a4:	.db $02
B5_17a5:	.db $44
B5_17a6:		ora ($04, x)	; 01 04
B5_17a8:		beq B5_17a2 ; f0 f8

B5_17aa:	.db $43
B5_17ab:		sbc $d9e9, y	; f9 e9 d9
B5_17ae:		cmp #$01		; c9 01
B5_17b0:	.db $04
B5_17b1:		beq B5_17ab ; f0 f8

B5_17b3:	.db $43
B5_17b4:	.db $fb
B5_17b5:	.db $eb
B5_17b6:	.db $db
B5_17b7:	.db $cb
B5_17b8:	.db $02
B5_17b9:	.db $02
B5_17ba:		sed				; f8
B5_17bb:		inx				; e8
B5_17bc:	.db $43
B5_17bd:	.db $d7
B5_17be:	.db $c7
B5_17bf:	.db $02
B5_17c0:		sed				; f8
B5_17c1:		sed				; f8
B5_17c2:	.db $43
B5_17c3:	.db $f7
B5_17c4:	.db $e7
B5_17c5:		ora ($03, x)	; 01 03
B5_17c7:	.db $f4
B5_17c8:		sed				; f8
B5_17c9:	.db $03
B5_17ca:	.db $fb
B5_17cb:		sbc #$f9		; e9 f9
B5_17cd:		ora ($03, x)	; 01 03
B5_17cf:	.db $f4
B5_17d0:		sed				; f8
B5_17d1:	.db $03
B5_17d2:	.db $cb
B5_17d3:	.db $db
B5_17d4:	.db $eb
B5_17d5:		ora ($03, x)	; 01 03
B5_17d7:	.db $f4
B5_17d8:		sed				; f8
B5_17d9:	.db $03
B5_17da:		cmp $eddd		; cd dd ed
B5_17dd:		ora ($03, x)	; 01 03
B5_17df:	.db $f4
B5_17e0:		sed				; f8
B5_17e1:	.db $03
B5_17e2:	.db $cf
B5_17e3:	.db $df
B5_17e4:	.db $ef
B5_17e5:	.db $02
B5_17e6:	.db $02
B5_17e7:		sed				; f8
B5_17e8:		beq B5_17ed ; f0 03

B5_17ea:		cmp ($d1, x)	; c1 d1
B5_17ec:	.db $02
B5_17ed:		sed				; f8
B5_17ee:		.db $00				; 00
B5_17ef:	.db $03
B5_17f0:	.db $c3
B5_17f1:	.db $d3
B5_17f2:	.db $02
B5_17f3:	.db $02
B5_17f4:		sed				; f8
B5_17f5:		beq B5_17fa ; f0 03

B5_17f7:		sbc ($f1, x)	; e1 f1
B5_17f9:	.db $02
B5_17fa:		sed				; f8
B5_17fb:		.db $00				; 00
B5_17fc:	.db $03
B5_17fd:	.db $e3
B5_17fe:	.db $f3
B5_17ff:		ora ($02, x)	; 01 02
B5_1801:		sed				; f8
B5_1802:		sed				; f8
B5_1803:	.db $03
B5_1804:		cmp $d5			; c5 d5
B5_1806:		ora ($02, x)	; 01 02
B5_1808:		sed				; f8
B5_1809:		sed				; f8
B5_180a:	.db $03
B5_180b:		sbc $f5			; e5 f5
B5_180d:	.db $02
B5_180e:	.db $02
B5_180f:		sed				; f8
B5_1810:		beq B5_1815 ; f0 03

B5_1812:		cmp $02dd		; cd dd 02
B5_1815:		sed				; f8
B5_1816:		.db $00				; 00
B5_1817:	.db $03
B5_1818:	.db $cf
B5_1819:	.db $df
B5_181a:	.db $02
B5_181b:	.db $02
B5_181c:		sed				; f8
B5_181d:		beq B5_1822 ; f0 03

B5_181f:		sbc $02fd		; edfd 02
B5_1822:		sed				; f8
B5_1823:		.db $00				; 00
B5_1824:	.db $03
B5_1825:	.db $ef
B5_1826:	.db $ff
B5_1827:	.db $02
B5_1828:	.db $03
B5_1829:	.db $f4
B5_182a:		;removed
	.db $f0 $03

B5_182c:		cmp ($d1, x)	; c1 d1
B5_182e:		sbc ($03, x)	; e1 03
B5_1830:	.db $f4
B5_1831:		.db $00				; 00
B5_1832:	.db $03
B5_1833:	.db $c3
B5_1834:	.db $d3
B5_1835:	.db $e3
B5_1836:	.db $02
B5_1837:	.db $03
B5_1838:	.db $f4
B5_1839:		;removed
	.db $f0 $03

B5_183b:		cmp $d5			; c5 d5
B5_183d:		sbc ($03), y	; f1 03
B5_183f:	.db $f4
B5_1840:		.db $00				; 00
B5_1841:	.db $03
B5_1842:	.db $c3
B5_1843:	.db $d3
B5_1844:	.db $f3
B5_1845:	.db $02
B5_1846:	.db $03
B5_1847:	.db $f4
B5_1848:		;removed
	.db $f0 $03

B5_184a:	.db $c7
B5_184b:	.db $d7
B5_184c:		sbc $03			; e5 03
B5_184e:	.db $f4
B5_184f:		.db $00				; 00
B5_1850:	.db $03
B5_1851:	.db $c3
B5_1852:	.db $d3
B5_1853:	.db $e7
B5_1854:		ora ($02, x)	; 01 02
B5_1856:		sed				; f8
B5_1857:		sed				; f8
B5_1858:	.db $02
B5_1859:	.db $f7
B5_185a:		sbc $01, x		; f5 01
B5_185c:	.db $02
B5_185d:		sed				; f8
B5_185e:		sed				; f8
B5_185f:	.db $02
B5_1860:		cmp #$d9		; c9 d9
B5_1862:	.db $02
B5_1863:	.db $02
B5_1864:		sed				; f8
B5_1865:		beq B5_186a ; f0 03

B5_1867:		sbc #$f9		; e9 f9
B5_1869:	.db $02
B5_186a:		sed				; f8
B5_186b:		.db $00				; 00
B5_186c:	.db $03
B5_186d:	.db $eb
B5_186e:	.db $fb
B5_186f:	.db $02
B5_1870:	.db $02
B5_1871:		sed				; f8
B5_1872:		beq B5_1877 ; f0 03

B5_1874:		cmp #$d9		; c9 d9
B5_1876:	.db $02
B5_1877:		sed				; f8
B5_1878:		.db $00				; 00
B5_1879:	.db $03
B5_187a:	.db $d7
B5_187b:	.db $fb
B5_187c:	.db $02
B5_187d:	.db $02
B5_187e:	.db $f4
B5_187f:		sed				; f8
B5_1880:	.db $02
B5_1881:	.db $87
B5_1882:	.db $97
B5_1883:		ora ($04, x)	; 01 04
B5_1885:		sed				; f8
B5_1886:	.db $42
B5_1887:	.db $87
B5_1888:	.db $02
B5_1889:	.db $02
B5_188a:		sed				; f8
B5_188b:		beq B5_1890 ; f0 03

B5_188d:		sbc $f5			; e5 f5
B5_188f:	.db $02
B5_1890:		sed				; f8
B5_1891:		.db $00				; 00
B5_1892:	.db $03
B5_1893:	.db $e7
B5_1894:	.db $f7
B5_1895:	.db $02
B5_1896:	.db $02
B5_1897:		sed				; f8
B5_1898:		sbc ($03), y	; f1 03
B5_189a:		sbc $f5			; e5 f5
B5_189c:	.db $02
B5_189d:		sed				; f8
B5_189e:		ora ($03, x)	; 01 03
B5_18a0:	.db $c7
B5_18a1:	.db $d7
B5_18a2:	.db $02
B5_18a3:	.db $02
B5_18a4:		sed				; f8
B5_18a5:		beq B5_18aa ; f0 03

B5_18a7:		sbc $f5			; e5 f5
B5_18a9:	.db $02
B5_18aa:		sed				; f8
B5_18ab:		.db $00				; 00
B5_18ac:	.db $03
B5_18ad:		cmp #$d9		; c9 d9
B5_18af:	.db $02
B5_18b0:	.db $02
B5_18b1:		sed				; f8
B5_18b2:		beq B5_18b7 ; f0 03

B5_18b4:		cmp ($d1, x)	; c1 d1
B5_18b6:	.db $02
B5_18b7:		sed				; f8
B5_18b8:		.db $00				; 00
B5_18b9:	.db $03
B5_18ba:	.db $c3
B5_18bb:	.db $d3
B5_18bc:	.db $02
B5_18bd:	.db $02
B5_18be:		sed				; f8
B5_18bf:		beq B5_18c4 ; f0 03

B5_18c1:		sbc ($f1, x)	; e1 f1
B5_18c3:	.db $02
B5_18c4:		sed				; f8
B5_18c5:		.db $00				; 00
B5_18c6:	.db $03
B5_18c7:	.db $e3
B5_18c8:	.db $f3
B5_18c9:	.db $02
B5_18ca:	.db $02
B5_18cb:		sed				; f8
B5_18cc:		beq B5_18d1 ; f0 03

B5_18ce:		cmp $d5			; c5 d5
B5_18d0:	.db $02
B5_18d1:		sed				; f8
B5_18d2:		.db $00				; 00
B5_18d3:	.db $03
B5_18d4:	.db $c7
B5_18d5:	.db $d7
B5_18d6:	.db $02
B5_18d7:	.db $02
B5_18d8:		sed				; f8
B5_18d9:		beq B5_18de ; f0 03

B5_18db:		cmp $02dd		; cd dd 02
B5_18de:		sed				; f8
B5_18df:		.db $00				; 00
B5_18e0:	.db $03
B5_18e1:	.db $cf
B5_18e2:	.db $df
B5_18e3:	.db $02
B5_18e4:	.db $02
B5_18e5:		sed				; f8
B5_18e6:		beq B5_18eb ; f0 03

B5_18e8:		sbc $02fd		; edfd 02
B5_18eb:		sed				; f8
B5_18ec:		.db $00				; 00
B5_18ed:	.db $03
B5_18ee:	.db $ef
B5_18ef:	.db $ff
B5_18f0:	.db $03
B5_18f1:	.db $03
B5_18f2:	.db $f4
B5_18f3:		inx				; e8
B5_18f4:	.db $03
B5_18f5:		cmp ($d1, x)	; c1 d1
B5_18f7:		sbc ($03, x)	; e1 03
B5_18f9:	.db $f4
B5_18fa:		sed				; f8
B5_18fb:	.db $02
B5_18fc:	.db $c3
B5_18fd:	.db $d3
B5_18fe:	.db $e3
B5_18ff:	.db $03
B5_1900:	.db $f4
B5_1901:		php				; 08
B5_1902:	.db $02
B5_1903:		cmp $d5			; c5 d5
B5_1905:		sbc $03			; e5 03
B5_1907:	.db $03
B5_1908:	.db $f4
B5_1909:		inx				; e8
B5_190a:	.db $03
B5_190b:		cmp ($d1, x)	; c1 d1
B5_190d:		sbc ($03, x)	; e1 03
B5_190f:	.db $f4
B5_1910:		sed				; f8
B5_1911:	.db $02
B5_1912:	.db $c7
B5_1913:	.db $d7
B5_1914:	.db $e7
B5_1915:	.db $03
B5_1916:	.db $f4
B5_1917:		php				; 08
B5_1918:	.db $02
B5_1919:		cmp $d5			; c5 d5
B5_191b:		sbc $01			; e5 01
B5_191d:	.db $02
B5_191e:		sed				; f8
B5_191f:		sed				; f8
B5_1920:	.db $02
B5_1921:	.db $eb
B5_1922:	.db $fb
B5_1923:	.db $04
B5_1924:	.db $02
B5_1925:		inx				; e8
B5_1926:		ldy $03, x		; b4 03
B5_1928:		cmp #$d9		; c9 d9
B5_192a:	.db $02
B5_192b:		inx				; e8
B5_192c:		cpy $03			; c4 03
B5_192e:	.db $cb
B5_192f:	.db $db
B5_1930:	.db $03
B5_1931:	.db $04
B5_1932:	.db $b3
B5_1933:	.db $03
B5_1934:		cmp $eddd		; cd dd ed
B5_1937:	.db $03
B5_1938:	.db $04
B5_1939:	.db $c3
B5_193a:	.db $03
B5_193b:	.db $cf
B5_193c:	.db $df
B5_193d:	.db $ef
B5_193e:		ora ($02, x)	; 01 02
B5_1940:		beq B5_1942 ; f0 00

B5_1942:		ora ($e9, x)	; 01 e9
B5_1944:		sbc $0202, y	; f9 02 02
B5_1947:		sed				; f8
B5_1948:		beq B5_194a ; f0 00

B5_194a:		inc $02fe, x	; fe fe 02
B5_194d:		sed				; f8
B5_194e:		.db $00				; 00
B5_194f:		.db $00				; 00
B5_1950:		inc $03fe, x	; fe fe 03
B5_1953:	.db $04
B5_1954:		beq B5_193e ; f0 e8

B5_1956:	.db $03
B5_1957:		ora ($11, x)	; 01 11
B5_1959:		and ($31, x)	; 21 31
B5_195b:	.db $04
B5_195c:		beq B5_1956 ; f0 f8

B5_195e:	.db $03
B5_195f:	.db $03
B5_1960:	.db $13
B5_1961:	.db $23
B5_1962:	.db $33
B5_1963:	.db $04
B5_1964:		;removed
	.db $f0 $08

B5_1966:	.db $03
B5_1967:		ora $15			; 05 15
B5_1969:		and $35			; 25 35
B5_196b:	.db $03
B5_196c:	.db $04
B5_196d:		beq B5_1957 ; f0 e8

B5_196f:	.db $03
B5_1970:	.db $07
B5_1971:	.db $17
B5_1972:	.db $27
B5_1973:	.db $37
B5_1974:	.db $04
B5_1975:		beq B5_196f ; f0 f8

B5_1977:	.db $03
B5_1978:		ora #$19		; 09 19
B5_197a:		and #$39		; 29 39
B5_197c:	.db $04
B5_197d:		;removed
	.db $f0 $08

B5_197f:	.db $03
B5_1980:	.db $0b
B5_1981:	.db $1b
B5_1982:	.db $2b
B5_1983:	.db $3b
B5_1984:	.db $03
B5_1985:	.db $04
B5_1986:		beq B5_1970 ; f0 e8

B5_1988:	.db $03
B5_1989:		ora $2d1d		; 0d 1d 2d
B5_198c:		and $f004, x	; 3d 04 f0
B5_198f:		sed				; f8
B5_1990:	.db $03
B5_1991:	.db $0f
B5_1992:	.db $1f
B5_1993:	.db $2f
B5_1994:	.db $3f
B5_1995:	.db $04
B5_1996:		beq B5_19a0 ; f0 08

B5_1998:	.db $03
B5_1999:		ora $15			; 05 15
B5_199b:		and $35			; 25 35
B5_199d:		ora $02			; 05 02
B5_199f:		sed				; f8
B5_19a0:		cpx #$03		; e0 03
B5_19a2:	.db $07
B5_19a3:	.db $17
B5_19a4:	.db $04
B5_19a5:		;removed
	.db $f0 $f0

B5_19a7:	.db $03
B5_19a8:		ora ($11, x)	; 01 11
B5_19aa:		and ($31, x)	; 21 31
B5_19ac:	.db $04
B5_19ad:		beq B5_19af ; f0 00

B5_19af:	.db $03
B5_19b0:	.db $03
B5_19b1:	.db $13
B5_19b2:	.db $23
B5_19b3:	.db $33
B5_19b4:	.db $04
B5_19b5:		beq B5_19c7 ; f0 10

B5_19b7:	.db $03
B5_19b8:		ora $15			; 05 15
B5_19ba:		and $35			; 25 35
B5_19bc:		ora ($10, x)	; 01 10
B5_19be:	.db $07
B5_19bf:	.db $03
B5_19c0:	.db $3f
B5_19c1:		ora $02			; 05 02
B5_19c3:		sed				; f8
B5_19c4:		cpx #$03		; e0 03
B5_19c6:	.db $27
B5_19c7:	.db $37
B5_19c8:	.db $04
B5_19c9:		;removed
	.db $f0 $f0

B5_19cb:	.db $03
B5_19cc:		ora #$19		; 09 19
B5_19ce:		and #$39		; 29 39
B5_19d0:	.db $04
B5_19d1:		beq B5_19d3 ; f0 00

B5_19d3:	.db $03
B5_19d4:	.db $0b
B5_19d5:	.db $1b
B5_19d6:	.db $2b
B5_19d7:	.db $3b
B5_19d8:	.db $04
B5_19d9:		;removed
	.db $f0 $10

B5_19db:	.db $03
B5_19dc:		ora $2d1d		; 0d 1d 2d
B5_19df:		and $1001, x	; 3d 01 10
B5_19e2:	.db $07
B5_19e3:	.db $03
B5_19e4:	.db $3f
B5_19e5:	.db $02
B5_19e6:	.db $04
B5_19e7:		beq B5_19d1 ; f0 e8

B5_19e9:	.db $03
B5_19ea:		ora ($11, x)	; 01 11
B5_19ec:		and ($31, x)	; 21 31
B5_19ee:	.db $04
B5_19ef:		beq B5_19e9 ; f0 f8

B5_19f1:	.db $03
B5_19f2:	.db $03
B5_19f3:	.db $13
B5_19f4:	.db $23
B5_19f5:	.db $33
B5_19f6:	.db $04
B5_19f7:		;removed
	.db $f0 $08

B5_19f9:	.db $03
B5_19fa:		ora $15			; 05 15
B5_19fc:		and $35			; 25 35
B5_19fe:	.db $02
B5_19ff:	.db $04
B5_1a00:		beq B5_19ea ; f0 e8

B5_1a02:	.db $03
B5_1a03:		ora ($11, x)	; 01 11
B5_1a05:		and ($31, x)	; 21 31
B5_1a07:	.db $04
B5_1a08:		beq B5_1a02 ; f0 f8

B5_1a0a:	.db $03
B5_1a0b:	.db $03
B5_1a0c:	.db $13
B5_1a0d:	.db $23
B5_1a0e:	.db $33
B5_1a0f:	.db $04
B5_1a10:		beq B5_1a1a ; f0 08

B5_1a12:	.db $03
B5_1a13:		ora $15			; 05 15
B5_1a15:		and $35			; 25 35
B5_1a17:		jsr $2020		; 20 20 20
B5_1a1a:	.db $12
B5_1a1b:	.db $12
B5_1a1c:	.db $12
B5_1a1d:	.db $12
B5_1a1e:	.db $12
B5_1a1f:	.db $12
B5_1a20:	.db $12
B5_1a21:	.db $12
B5_1a22:	.db $0f
B5_1a23:	.db $0f
B5_1a24:		bpl B5_1a49 ; 10 23

B5_1a26:	.db $23
B5_1a27:		asl $12, x		; 16 12
B5_1a29:	.db $12
B5_1a2a:		rol a			; 2a
B5_1a2b:		rol a			; 2a
B5_1a2c:		rol a			; 2a
B5_1a2d:		rol a			; 2a
B5_1a2e:		rol a			; 2a
B5_1a2f:		asl $12, x		; 16 12
B5_1a31:		and #$2d		; 29 2d
B5_1a33:		and $2d2d		; 2d 2d 2d
B5_1a36:		and $0f0f		; 2d 0f 0f
B5_1a39:	.db $2b
B5_1a3a:	.db $1a
B5_1a3b:	.db $1a
B5_1a3c:	.db $1a
B5_1a3d:	.db $1a
B5_1a3e:	.db $1a
B5_1a3f:	.db $1a
B5_1a40:	.db $1a
B5_1a41:	.db $1a
B5_1a42:	.db $23
B5_1a43:	.db $23
B5_1a44:	.db $23
B5_1a45:	.db $23
B5_1a46:	.db $23
B5_1a47:	.db $23
B5_1a48:	.db $42
B5_1a49:	.db $44
B5_1a4a:		rol a			; 2a
B5_1a4b:		rol a			; 2a
B5_1a4c:		rol a			; 2a
B5_1a4d:		rol a			; 2a
B5_1a4e:		rol a			; 2a
B5_1a4f:		rol a			; 2a
B5_1a50:	.db $44
B5_1a51:		eor #$20		; 49 20
B5_1a53:		jsr $2020		; 20 20 20
B5_1a56:		jsr $4920		; 20 20 49
B5_1a59:	.db $12
B5_1a5a:	.db $12
B5_1a5b:	.db $12
B5_1a5c:	.db $12
B5_1a5d:	.db $12
B5_1a5e:	.db $12
B5_1a5f:	.db $12
B5_1a60:	.db $12
B5_1a61:	.db $12
B5_1a62:	.db $0f
B5_1a63:	.db $0f
B5_1a64:	.db $0f
B5_1a65:	.db $0f
B5_1a66:	.db $0f
B5_1a67:	.db $0f
B5_1a68:	.db $0f
B5_1a69:	.db $12
B5_1a6a:	.db $3b
B5_1a6b:	.db $1a
B5_1a6c:	.db $3b
B5_1a6d:	.db $1a
B5_1a6e:	.db $1a
B5_1a6f:	.db $1a
B5_1a70:	.db $1a
B5_1a71:		asl $40, x		; 16 40
B5_1a73:	.db $23
B5_1a74:		rti				; 40


B5_1a75:	.db $23
B5_1a76:	.db $23
B5_1a77:	.db $23
B5_1a78:	.db $23
B5_1a79:		asl $43, x		; 16 43
B5_1a7b:		rol a			; 2a
B5_1a7c:	.db $43
B5_1a7d:		rol a			; 2a
B5_1a7e:	.db $23
B5_1a7f:	.db $23
B5_1a80:	.db $23
B5_1a81:		asl $20, x		; 16 20
B5_1a83:		jsr $2e20		; 20 20 2e
B5_1a86:	.db $23
B5_1a87:	.db $23
B5_1a88:	.db $23
B5_1a89:		asl $12, x		; 16 12
B5_1a8b:	.db $12
B5_1a8c:	.db $12
B5_1a8d:		and #$23		; 29 23
B5_1a8f:	.db $23
B5_1a90:	.db $23
B5_1a91:		asl $12, x		; 16 12
B5_1a93:	.db $12
B5_1a94:	.db $12
B5_1a95:		and #$23		; 29 23
B5_1a97:	.db $23
B5_1a98:	.db $23
B5_1a99:		asl $12, x		; 16 12
B5_1a9b:	.db $12
B5_1a9c:	.db $12
B5_1a9d:		and #$23		; 29 23
B5_1a9f:	.db $23
B5_1aa0:	.db $23
B5_1aa1:		asl $12, x		; 16 12
B5_1aa3:	.db $12
B5_1aa4:	.db $12
B5_1aa5:	.db $12
B5_1aa6:	.db $12
B5_1aa7:	.db $12
B5_1aa8:	.db $12
B5_1aa9:	.db $12
B5_1aaa:	.db $12
B5_1aab:	.db $0f
B5_1aac:	.db $0f
B5_1aad:	.db $0f
B5_1aae:	.db $0f
B5_1aaf:	.db $0f
B5_1ab0:	.db $12
B5_1ab1:	.db $12
B5_1ab2:		and #$1a		; 29 1a
B5_1ab4:	.db $1a
B5_1ab5:	.db $1a
B5_1ab6:	.db $1a
B5_1ab7:	.db $1a
B5_1ab8:		asl $12, x		; 16 12
B5_1aba:		and #$23		; 29 23
B5_1abc:	.db $23
B5_1abd:	.db $23
B5_1abe:	.db $23
B5_1abf:	.db $23
B5_1ac0:		asl $12, x		; 16 12
B5_1ac2:		and #$23		; 29 23
B5_1ac4:		eor ($52), y	; 51 52
B5_1ac6:	.db $23
B5_1ac7:	.db $23
B5_1ac8:		asl $290f		; 0e 0f 29
B5_1acb:		rol a			; 2a
B5_1acc:		asl $29, x		; 16 29
B5_1ace:		rol a			; 2a
B5_1acf:		rol a			; 2a
B5_1ad0:		rol a			; 2a
B5_1ad1:		rol a			; 2a
B5_1ad2:	.db $12
B5_1ad3:		jsr $1212		; 20 12 12
B5_1ad6:		jsr $2020		; 20 20 20
B5_1ad9:		jsr $1212		; 20 12 12
B5_1adc:	.db $12
B5_1add:	.db $12
B5_1ade:	.db $12
B5_1adf:	.db $12
B5_1ae0:	.db $12
B5_1ae1:	.db $12
B5_1ae2:	.db $12
B5_1ae3:	.db $0f
B5_1ae4:	.db $0f
B5_1ae5:	.db $0f
B5_1ae6:	.db $0f
B5_1ae7:	.db $0f
B5_1ae8:	.db $0f
B5_1ae9:	.db $12
B5_1aea:		and #$1a		; 29 1a
B5_1aec:		bvc B5_1b08 ; 50 1a

B5_1aee:	.db $1a
B5_1aef:	.db $1a
B5_1af0:		bvc B5_1b08 ; 50 16

B5_1af2:		and #$23		; 29 23
B5_1af4:		rti				; 40


B5_1af5:	.db $23
B5_1af6:	.db $23
B5_1af7:	.db $23
B5_1af8:		rti				; 40


B5_1af9:		asl $29, x		; 16 29
B5_1afb:	.db $23
B5_1afc:		rti				; 40


B5_1afd:	.db $23
B5_1afe:	.db $23
B5_1aff:	.db $23
B5_1b00:		rti				; 40


B5_1b01:		asl $2310		; 0e 10 23
B5_1b04:		rti				; 40


B5_1b05:	.db $23
B5_1b06:	.db $23
B5_1b07:	.db $23
B5_1b08:		rti				; 40


B5_1b09:	.db $1a
B5_1b0a:		rol a			; 2a
B5_1b0b:		rol a			; 2a
B5_1b0c:		rti				; 40


B5_1b0d:		rol a			; 2a
B5_1b0e:		rol a			; 2a
B5_1b0f:		rol a			; 2a
B5_1b10:		rti				; 40


B5_1b11:		rol a			; 2a
B5_1b12:		jsr $2020		; 20 20 20
B5_1b15:		jsr $2020		; 20 20 20
B5_1b18:		jsr $1220		; 20 20 12
B5_1b1b:	.db $12
B5_1b1c:	.db $12
B5_1b1d:	.db $12
B5_1b1e:	.db $12
B5_1b1f:	.db $12
B5_1b20:	.db $12
B5_1b21:	.db $12
B5_1b22:	.db $12
B5_1b23:	.db $12
B5_1b24:	.db $12
B5_1b25:	.db $12
B5_1b26:	.db $12
B5_1b27:	.db $12
B5_1b28:	.db $12
B5_1b29:	.db $12
B5_1b2a:	.db $12
B5_1b2b:	.db $12
B5_1b2c:	.db $12
B5_1b2d:	.db $12
B5_1b2e:	.db $12
B5_1b2f:	.db $12
B5_1b30:	.db $12
B5_1b31:	.db $12
B5_1b32:	.db $12
B5_1b33:	.db $12
B5_1b34:	.db $12
B5_1b35:	.db $12
B5_1b36:	.db $12
B5_1b37:	.db $12
B5_1b38:	.db $0f
B5_1b39:	.db $0f
B5_1b3a:	.db $0f
B5_1b3b:	.db $0f
B5_1b3c:	.db $0f
B5_1b3d:	.db $0f
B5_1b3e:	.db $0f
B5_1b3f:	.db $2b
B5_1b40:	.db $1a
B5_1b41:	.db $1a
B5_1b42:	.db $1a
B5_1b43:		bvc B5_1b5f ; 50 1a

B5_1b45:	.db $1a
B5_1b46:		bvc B5_1b9b ; 50 53

B5_1b48:	.db $23
B5_1b49:	.db $23
B5_1b4a:		rol a			; 2a
B5_1b4b:		rti				; 40


B5_1b4c:		rol a			; 2a
B5_1b4d:		rol a			; 2a
B5_1b4e:		rti				; 40


B5_1b4f:		rol a			; 2a
B5_1b50:		rol a			; 2a
B5_1b51:		rol a			; 2a
B5_1b52:		jsr $2020		; 20 20 20
B5_1b55:		jsr $2020		; 20 20 20
B5_1b58:		jsr $1220		; 20 20 12
B5_1b5b:	.db $12
B5_1b5c:	.db $12
B5_1b5d:	.db $12
B5_1b5e:	.db $12
B5_1b5f:	.db $12
B5_1b60:	.db $12
B5_1b61:	.db $12
B5_1b62:	.db $12
B5_1b63:	.db $12
B5_1b64:	.db $12
B5_1b65:		and #$23		; 29 23
B5_1b67:	.db $23
B5_1b68:	.db $23
B5_1b69:		asl $12, x		; 16 12
B5_1b6b:	.db $12
B5_1b6c:	.db $12
B5_1b6d:		and #$23		; 29 23
B5_1b6f:	.db $23
B5_1b70:	.db $23
B5_1b71:		asl $0f, x		; 16 0f
B5_1b73:	.db $0f
B5_1b74:	.db $0f
B5_1b75:	.db $2b
B5_1b76:	.db $23
B5_1b77:	.db $23
B5_1b78:	.db $23
B5_1b79:		asl $1a, x		; 16 1a
B5_1b7b:	.db $3b
B5_1b7c:	.db $3b
B5_1b7d:	.db $1a
B5_1b7e:	.db $23
B5_1b7f:		pha				; 48
B5_1b80:	.db $23
B5_1b81:		asl $23, x		; 16 23
B5_1b83:		rti				; 40


B5_1b84:		rti				; 40


B5_1b85:	.db $23
B5_1b86:	.db $23
B5_1b87:	.db $42
B5_1b88:	.db $44
B5_1b89:	.db $12
B5_1b8a:		rol a			; 2a
B5_1b8b:		rti				; 40


B5_1b8c:		rti				; 40


B5_1b8d:		rol a			; 2a
B5_1b8e:		rol a			; 2a
B5_1b8f:	.db $44
B5_1b90:		eor #$12		; 49 12
B5_1b92:		jsr $2020		; 20 20 20
B5_1b95:		jsr $4920		; 20 20 49
B5_1b98:	.db $12
B5_1b99:	.db $12
B5_1b9a:	.db $12
B5_1b9b:	.db $12
B5_1b9c:	.db $12
B5_1b9d:	.db $12
B5_1b9e:	.db $12
B5_1b9f:	.db $12
B5_1ba0:	.db $12
B5_1ba1:	.db $12
B5_1ba2:	.db $12
B5_1ba3:	.db $12
B5_1ba4:	.db $12
B5_1ba5:	.db $12
B5_1ba6:	.db $12
B5_1ba7:	.db $12
B5_1ba8:	.db $12
B5_1ba9:	.db $12
B5_1baa:	.db $12
B5_1bab:	.db $12
B5_1bac:	.db $12
B5_1bad:	.db $12
B5_1bae:	.db $12
B5_1baf:	.db $12
B5_1bb0:	.db $12
B5_1bb1:	.db $12
B5_1bb2:	.db $12
B5_1bb3:	.db $12
B5_1bb4:	.db $12
B5_1bb5:	.db $12
B5_1bb6:	.db $12
B5_1bb7:	.db $12
B5_1bb8:	.db $12
B5_1bb9:	.db $12
B5_1bba:	.db $12
B5_1bbb:	.db $12
B5_1bbc:	.db $12
B5_1bbd:	.db $12
B5_1bbe:	.db $12
B5_1bbf:	.db $12
B5_1bc0:	.db $12
B5_1bc1:	.db $12
B5_1bc2:	.db $12
B5_1bc3:	.db $12
B5_1bc4:	.db $12
B5_1bc5:	.db $12
B5_1bc6:	.db $12
B5_1bc7:	.db $12
B5_1bc8:	.db $12
B5_1bc9:	.db $12
B5_1bca:	.db $12
B5_1bcb:	.db $12
B5_1bcc:	.db $12
B5_1bcd:	.db $12
B5_1bce:	.db $12
B5_1bcf:	.db $12
B5_1bd0:	.db $12
B5_1bd1:	.db $12
B5_1bd2:	.db $12
B5_1bd3:	.db $12
B5_1bd4:	.db $12
B5_1bd5:	.db $12
B5_1bd6:	.db $12
B5_1bd7:	.db $12
B5_1bd8:	.db $12
B5_1bd9:	.db $12
B5_1bda:	.db $12
B5_1bdb:	.db $12
B5_1bdc:	.db $12
B5_1bdd:	.db $12
B5_1bde:	.db $12
B5_1bdf:	.db $12
B5_1be0:	.db $12
B5_1be1:	.db $12
B5_1be2:	.db $12
B5_1be3:	.db $12
B5_1be4:	.db $12
B5_1be5:	.db $12
B5_1be6:	.db $12
B5_1be7:	.db $12
B5_1be8:	.db $12
B5_1be9:	.db $12
B5_1bea:	.db $12
B5_1beb:	.db $12
B5_1bec:	.db $12
B5_1bed:	.db $12
B5_1bee:	.db $12
B5_1bef:	.db $12
B5_1bf0:	.db $0f
B5_1bf1:	.db $0f
B5_1bf2:	.db $12
B5_1bf3:	.db $12
B5_1bf4:	.db $12
B5_1bf5:	.db $12
B5_1bf6:	.db $12
B5_1bf7:	.db $2b
B5_1bf8:	.db $1a
B5_1bf9:	.db $1a
B5_1bfa:	.db $0f
B5_1bfb:	.db $0f
B5_1bfc:	.db $0f
B5_1bfd:	.db $0f
B5_1bfe:	.db $2b
B5_1bff:	.db $23
B5_1c00:	.db $23
B5_1c01:	.db $23
B5_1c02:	.db $1a
B5_1c03:	.db $1a
B5_1c04:	.db $1a
B5_1c05:	.db $1a
B5_1c06:	.db $23
B5_1c07:	.db $23
B5_1c08:	.db $23
B5_1c09:	.db $23
B5_1c0a:		rol a			; 2a
B5_1c0b:		rol a			; 2a
B5_1c0c:		rol a			; 2a
B5_1c0d:		rol a			; 2a
B5_1c0e:		rol a			; 2a
B5_1c0f:		rol a			; 2a
B5_1c10:		rol a			; 2a
B5_1c11:	.db $44
B5_1c12:		jsr $2020		; 20 20 20
B5_1c15:		jsr $2020		; 20 20 20
B5_1c18:		jsr $1249		; 20 49 12
B5_1c1b:	.db $12
B5_1c1c:	.db $12
B5_1c1d:	.db $12
B5_1c1e:	.db $12
B5_1c1f:	.db $12
B5_1c20:	.db $12
B5_1c21:	.db $12
B5_1c22:	.db $12
B5_1c23:	.db $0f
B5_1c24:	.db $0f
B5_1c25:	.db $0f
B5_1c26:	.db $0f
B5_1c27:	.db $0f
B5_1c28:	.db $12
B5_1c29:	.db $12
B5_1c2a:	.db $2b
B5_1c2b:	.db $1a
B5_1c2c:	.db $1a
B5_1c2d:	.db $1a
B5_1c2e:	.db $1a
B5_1c2f:	.db $1a
B5_1c30:		and $2312, x	; 3d 12 23
B5_1c33:	.db $23
B5_1c34:	.db $23
B5_1c35:	.db $23
B5_1c36:	.db $23
B5_1c37:	.db $23
B5_1c38:		eor ($3d, x)	; 41 3d
B5_1c3a:	.db $23
B5_1c3b:	.db $23
B5_1c3c:		rol a			; 2a
B5_1c3d:		rol a			; 2a
B5_1c3e:		rol a			; 2a
B5_1c3f:	.db $23
B5_1c40:	.db $23
B5_1c41:		eor ($42, x)	; 41 42
B5_1c43:	.db $44
B5_1c44:		jsr $3020		; 20 20 30
B5_1c47:	.db $54
B5_1c48:	.db $23
B5_1c49:	.db $23
B5_1c4a:		jsr $1249		; 20 49 12
B5_1c4d:	.db $12
B5_1c4e:	.db $12
B5_1c4f:	.db $34
B5_1c50:		and ($2a), y	; 31 2a
B5_1c52:	.db $12
B5_1c53:	.db $12
B5_1c54:	.db $12
B5_1c55:	.db $12
B5_1c56:	.db $12
B5_1c57:	.db $12
B5_1c58:		and $1220, y	; 39 20 12
B5_1c5b:	.db $12
B5_1c5c:	.db $12
B5_1c5d:	.db $12
B5_1c5e:	.db $12
B5_1c5f:	.db $12
B5_1c60:	.db $12
B5_1c61:	.db $12
B5_1c62:	.db $12
B5_1c63:	.db $12
B5_1c64:	.db $0f
B5_1c65:	.db $0f
B5_1c66:	.db $0f
B5_1c67:	.db $0f
B5_1c68:	.db $0f
B5_1c69:	.db $0f
B5_1c6a:	.db $12
B5_1c6b:	.db $2b
B5_1c6c:	.db $1a
B5_1c6d:	.db $1a
B5_1c6e:	.db $1a
B5_1c6f:	.db $1a
B5_1c70:	.db $1a
B5_1c71:	.db $1a
B5_1c72:	.db $2b
B5_1c73:	.db $1a
B5_1c74:	.db $23
B5_1c75:	.db $23
B5_1c76:	.db $23
B5_1c77:	.db $23
B5_1c78:	.db $23
B5_1c79:	.db $23
B5_1c7a:	.db $23
B5_1c7b:	.db $23
B5_1c7c:		rol a			; 2a
B5_1c7d:	.db $23
B5_1c7e:		rol a			; 2a
B5_1c7f:		rol a			; 2a
B5_1c80:	.db $23
B5_1c81:		rol a			; 2a
B5_1c82:	.db $42
B5_1c83:	.db $44
B5_1c84:		rol $3223		; 2e 23 32
B5_1c87:		rol $3223		; 2e 23 32
B5_1c8a:	.db $44
B5_1c8b:		eor #$29		; 49 29
B5_1c8d:	.db $23
B5_1c8e:		asl $29, x		; 16 29
B5_1c90:	.db $23
B5_1c91:		asl $49, x		; 16 49
B5_1c93:	.db $12
B5_1c94:		and #$23		; 29 23
B5_1c96:		asl $29, x		; 16 29
B5_1c98:	.db $23
B5_1c99:		asl $12, x		; 16 12
B5_1c9b:	.db $12
B5_1c9c:		and #$23		; 29 23
B5_1c9e:		asl $29, x		; 16 29
B5_1ca0:	.db $23
B5_1ca1:		asl $0f, x		; 16 0f
B5_1ca3:	.db $12
B5_1ca4:	.db $12
B5_1ca5:	.db $12
B5_1ca6:	.db $12
B5_1ca7:	.db $12
B5_1ca8:	.db $12
B5_1ca9:	.db $12
B5_1caa:	.db $1a
B5_1cab:		and $1212, x	; 3d 12 12
B5_1cae:	.db $12
B5_1caf:	.db $12
B5_1cb0:	.db $12
B5_1cb1:	.db $2b
B5_1cb2:	.db $23
B5_1cb3:		eor ($3d, x)	; 41 3d
B5_1cb5:	.db $12
B5_1cb6:	.db $12
B5_1cb7:	.db $12
B5_1cb8:	.db $2b
B5_1cb9:	.db $1a
B5_1cba:		rol a			; 2a
B5_1cbb:	.db $23
B5_1cbc:		eor ($3d, x)	; 41 3d
B5_1cbe:	.db $0f
B5_1cbf:	.db $2b
B5_1cc0:	.db $1a
B5_1cc1:	.db $42
B5_1cc2:		;removed
	.db $30 $54

B5_1cc4:	.db $23
B5_1cc5:	.db $23
B5_1cc6:	.db $1a
B5_1cc7:	.db $1a
B5_1cc8:	.db $42
B5_1cc9:		eor $12, x		; 55 12
B5_1ccb:	.db $34
B5_1ccc:		and ($2a), y	; 31 2a
B5_1cce:		rol a			; 2a
B5_1ccf:		rol a			; 2a
B5_1cd0:	.db $44
B5_1cd1:		eor #$12		; 49 12
B5_1cd3:	.db $12
B5_1cd4:		and $2020, y	; 39 20 20
B5_1cd7:		jsr $1249		; 20 49 12
B5_1cda:	.db $12
B5_1cdb:	.db $12
B5_1cdc:	.db $12
B5_1cdd:	.db $12
B5_1cde:	.db $12
B5_1cdf:	.db $12
B5_1ce0:	.db $12
B5_1ce1:	.db $12
B5_1ce2:	.db $0f
B5_1ce3:	.db $12
B5_1ce4:	.db $12
B5_1ce5:	.db $12
B5_1ce6:	.db $12
B5_1ce7:	.db $12
B5_1ce8:	.db $12
B5_1ce9:	.db $12
B5_1cea:	.db $1a
B5_1ceb:		and $1212, x	; 3d 12 12
B5_1cee:	.db $12
B5_1cef:	.db $12
B5_1cf0:	.db $12
B5_1cf1:	.db $12
B5_1cf2:	.db $23
B5_1cf3:		eor ($3d, x)	; 41 3d
B5_1cf5:	.db $12
B5_1cf6:	.db $12
B5_1cf7:	.db $12
B5_1cf8:	.db $12
B5_1cf9:	.db $12
B5_1cfa:		rol a			; 2a
B5_1cfb:	.db $23
B5_1cfc:		eor ($3d, x)	; 41 3d
B5_1cfe:	.db $0f
B5_1cff:	.db $0f
B5_1d00:	.db $0f
B5_1d01:	.db $0f
B5_1d02:		lsr $54, x		; 56 54
B5_1d04:	.db $23
B5_1d05:	.db $23
B5_1d06:	.db $1a
B5_1d07:	.db $1a
B5_1d08:	.db $1a
B5_1d09:	.db $1a
B5_1d0a:		sec				; 38
B5_1d0b:	.db $34
B5_1d0c:	.db $54
B5_1d0d:		rol a			; 2a
B5_1d0e:		rol a			; 2a
B5_1d0f:		rol a			; 2a
B5_1d10:		rol a			; 2a
B5_1d11:		rol a			; 2a
B5_1d12:	.db $12
B5_1d13:	.db $12
B5_1d14:		and $2020, y	; 39 20 20
B5_1d17:		jsr $2020		; 20 20 20
B5_1d1a:	.db $12
B5_1d1b:	.db $12
B5_1d1c:	.db $12
B5_1d1d:	.db $12
B5_1d1e:	.db $12
B5_1d1f:	.db $12
B5_1d20:	.db $12
B5_1d21:	.db $12
B5_1d22:	.db $12
B5_1d23:	.db $12
B5_1d24:	.db $12
B5_1d25:	.db $12
B5_1d26:	.db $12
B5_1d27:	.db $12
B5_1d28:	.db $12
B5_1d29:	.db $12
B5_1d2a:	.db $12
B5_1d2b:	.db $12
B5_1d2c:	.db $12
B5_1d2d:	.db $12
B5_1d2e:	.db $12
B5_1d2f:	.db $12
B5_1d30:	.db $12
B5_1d31:	.db $12
B5_1d32:	.db $12
B5_1d33:	.db $12
B5_1d34:	.db $12
B5_1d35:	.db $12
B5_1d36:	.db $12
B5_1d37:	.db $12
B5_1d38:	.db $12
B5_1d39:	.db $12
B5_1d3a:	.db $12
B5_1d3b:	.db $0f
B5_1d3c:	.db $0f
B5_1d3d:	.db $12
B5_1d3e:	.db $12
B5_1d3f:	.db $0f
B5_1d40:	.db $12
B5_1d41:	.db $12
B5_1d42:		and #$57		; 29 57
B5_1d44:		cli				; 58
B5_1d45:		and $1a2b, x	; 3d 2b 1a
B5_1d48:		and $292b, x	; 3d 2b 29
B5_1d4b:		eor $2319, y	; 59 19 23
B5_1d4e:	.db $23
B5_1d4f:	.db $23
B5_1d50:	.db $23
B5_1d51:	.db $23
B5_1d52:	.db $12
B5_1d53:		jsr $2020		; 20 20 20
B5_1d56:		jsr $2020		; 20 20 20
B5_1d59:		jsr $1212		; 20 12 12
B5_1d5c:	.db $12
B5_1d5d:	.db $12
B5_1d5e:	.db $12
B5_1d5f:	.db $12
B5_1d60:	.db $12
B5_1d61:	.db $12
B5_1d62:	.db $12
B5_1d63:	.db $12
B5_1d64:		and #$23		; 29 23
B5_1d66:		asl $29, x		; 16 29
B5_1d68:	.db $23
B5_1d69:		asl $12, x		; 16 12
B5_1d6b:	.db $12
B5_1d6c:		and #$23		; 29 23
B5_1d6e:		asl $29, x		; 16 29
B5_1d70:	.db $23
B5_1d71:		asl $12, x		; 16 12
B5_1d73:	.db $12
B5_1d74:		and #$23		; 29 23
B5_1d76:		asl $29, x		; 16 29
B5_1d78:	.db $23
B5_1d79:		asl $0f, x		; 16 0f
B5_1d7b:	.db $0f
B5_1d7c:		bpl B5_1da1 ; 10 23

B5_1d7e:		asl $29, x		; 16 29
B5_1d80:	.db $23
B5_1d81:		asl $1a, x		; 16 1a
B5_1d83:	.db $1a
B5_1d84:	.db $1a
B5_1d85:	.db $23
B5_1d86:		asl $29, x		; 16 29
B5_1d88:	.db $23
B5_1d89:		asl $2323		; 0e 23 23
B5_1d8c:	.db $23
B5_1d8d:	.db $23
B5_1d8e:		asl $29, x		; 16 29
B5_1d90:	.db $23
B5_1d91:	.db $1a
B5_1d92:		jsr $2020		; 20 20 20
B5_1d95:		jsr $1212		; 20 12 12
B5_1d98:		jsr $1220		; 20 20 12
B5_1d9b:	.db $12
B5_1d9c:	.db $12
B5_1d9d:	.db $12
B5_1d9e:	.db $12
B5_1d9f:	.db $12
B5_1da0:	.db $12
B5_1da1:	.db $12
B5_1da2:	.db $12
B5_1da3:	.db $12
B5_1da4:	.db $12
B5_1da5:	.db $12
B5_1da6:	.db $12
B5_1da7:	.db $12
B5_1da8:	.db $12
B5_1da9:	.db $12
B5_1daa:	.db $12
B5_1dab:	.db $12
B5_1dac:	.db $12
B5_1dad:	.db $12
B5_1dae:	.db $12
B5_1daf:	.db $12
B5_1db0:	.db $12
B5_1db1:	.db $12
B5_1db2:	.db $12
B5_1db3:	.db $12
B5_1db4:	.db $12
B5_1db5:	.db $0f
B5_1db6:	.db $0f
B5_1db7:	.db $0f
B5_1db8:	.db $12
B5_1db9:	.db $12
B5_1dba:	.db $12
B5_1dbb:	.db $12
B5_1dbc:		and #$1a		; 29 1a
B5_1dbe:	.db $1a
B5_1dbf:	.db $1a
B5_1dc0:		asl $12, x		; 16 12
B5_1dc2:	.db $0f
B5_1dc3:	.db $0f
B5_1dc4:		bpl B5_1de9 ; 10 23

B5_1dc6:	.db $57
B5_1dc7:		cli				; 58
B5_1dc8:		asl $12, x		; 16 12
B5_1dca:	.db $1a
B5_1dcb:	.db $1a
B5_1dcc:	.db $1a
B5_1dcd:	.db $23
B5_1dce:		eor $1619, y	; 59 19 16
B5_1dd1:	.db $12
B5_1dd2:		jsr $2020		; 20 20 20
B5_1dd5:		jsr $2020		; 20 20 20
B5_1dd8:	.db $12
B5_1dd9:	.db $12
B5_1dda:	.db $12
B5_1ddb:	.db $12
B5_1ddc:	.db $12
B5_1ddd:	.db $12
B5_1dde:	.db $12
B5_1ddf:	.db $12
B5_1de0:	.db $12
B5_1de1:	.db $12
B5_1de2:		nop				; ea
B5_1de3:		sta $9e44, x	; 9d 44 9e
B5_1de6:	.db $9e
B5_1de7:	.db $9e
B5_1de8:		sed				; f8
B5_1de9:	.db $9e
B5_1dea:	.db $2f
B5_1deb:		.db $00				; 00
B5_1dec:		and $2b4a		; 2d 4a 2b
B5_1def:	.db $17
B5_1df0:	.db $5b
B5_1df1:		.db $00				; 00
B5_1df2:		.db $00				; 00
B5_1df3:		ora $2f00, y	; 19 00 2f
B5_1df6:		sec				; 38
B5_1df7:	.db $37
B5_1df8:		ora $0101, y	; 19 01 01
B5_1dfb:		.db $00				; 00
B5_1dfc:		ora ($2f, x)	; 01 2f
B5_1dfe:		.db $00				; 00
B5_1dff:		.db $00				; 00
B5_1e00:	.db $19 $2d $00
B5_1e03:		.db $00				; 00
B5_1e04:	.db $07
B5_1e05:	.db $2f
B5_1e06:	.db $2b
B5_1e07:		rol a			; 2a
B5_1e08:		.db $00				; 00
B5_1e09:	.db $17
B5_1e0a:	.db $14
B5_1e0b:	.db $37
B5_1e0c:	.db $37
B5_1e0d:	.db $04
B5_1e0e:		sec				; 38
B5_1e0f:		cli				; 58
B5_1e10:	.db $47
B5_1e11:	.db $37
B5_1e12:		ora wEntityStructs.subX.w, y	; 19 01 04
B5_1e15:		ora ($17, x)	; 01 17
B5_1e17:	.db $14
B5_1e18:	.db $14
B5_1e19:	.db $12
B5_1e1a:	.db $14
B5_1e1b:	.db $12
B5_1e1c:	.db $17
B5_1e1d:		and $3b			; 25 3b
B5_1e1f:	.db $13
B5_1e20:		cli				; 58
B5_1e21:		php				; 08
B5_1e22:		ora ($3b, x)	; 01 3b
B5_1e24:		ora $0705, x	; 1d 05 07
B5_1e27:		asl $1406, x	; 1e 06 14
B5_1e2a:		ora $04			; 05 04
B5_1e2c:	.db $04
B5_1e2d:		ora $52			; 05 52
B5_1e2f:		ora $13, x		; 15 13
B5_1e31:	.db $04
B5_1e32:	.db $02
B5_1e33:		lsr $3b, x		; 56 3b
B5_1e35:	.db $5c
B5_1e36:	.db $12
B5_1e37:		ora ($12, x)	; 01 12
B5_1e39:		ora $1205, y	; 19 05 12
B5_1e3c:	.db $12
B5_1e3d:	.db $07
B5_1e3e:		asl $52, x		; 16 52
B5_1e40:	.db $57
B5_1e41:	.db $04
B5_1e42:	.db $04
B5_1e43:	.db $04
B5_1e44:		and ($00), y	; 31 00
B5_1e46:		rol $4b2b		; 2e 2b 4b
B5_1e49:		ora $36, x		; 15 36
B5_1e4b:		.db $00				; 00
B5_1e4c:		.db $00				; 00
B5_1e4d:		clc				; 18
B5_1e4e:		.db $00				; 00
B5_1e4f:		rol $4d4d		; 2e 4d 4d
B5_1e52:		ora ($01, x)	; 01 01
B5_1e54:		clc				; 18
B5_1e55:		.db $00				; 00
B5_1e56:		ora ($31, x)	; 01 31
B5_1e58:		.db $00				; 00
B5_1e59:		.db $00				; 00
B5_1e5a:		ora ($2e, x)	; 01 2e
B5_1e5c:	.db $64
B5_1e5d:		lsr $4807		; 4e 07 48
B5_1e60:	.db $2b
B5_1e61:		rol $1400		; 2e 00 14
B5_1e64:	.db $14
B5_1e65:		eor $0439		; 4d 39 04
B5_1e68:		eor $4758		; 4d 58 47
B5_1e6b:		and $1825, y	; 39 25 18
B5_1e6e:	.db $04
B5_1e6f:	.db $1f
B5_1e70:	.db $14
B5_1e71:	.db $14
B5_1e72:		ora $12, x		; 15 12
B5_1e74:		bit $1404		; 2c 04 14
B5_1e77:		and $2c			; 25 2c
B5_1e79:	.db $04
B5_1e7a:		cli				; 58
B5_1e7b:		php				; 08
B5_1e7c:		and $14			; 25 14
B5_1e7e:		ora $0606, x	; 1d 06 06
B5_1e81:		ora ($04, x)	; 01 04
B5_1e83:		ora $09, x		; 15 09
B5_1e85:		asl $04			; 06 04
B5_1e87:		ora #$55		; 09 55
B5_1e89:	.db $5c
B5_1e8a:	.db $04
B5_1e8b:	.db $04
B5_1e8c:	.db $02
B5_1e8d:		and $15			; 25 15
B5_1e8f:	.db $13
B5_1e90:	.db $04
B5_1e91:		clc				; 18
B5_1e92:	.db $12
B5_1e93:		ora ($07, x)	; 01 07
B5_1e95:	.db $12
B5_1e96:	.db $12
B5_1e97:	.db $04
B5_1e98:	.db $04
B5_1e99:	.db $53
B5_1e9a:	.db $5c
B5_1e9b:	.db $04
B5_1e9c:	.db $04
B5_1e9d:	.db $64
B5_1e9e:		jmp $3e00		; 4c 00 3e


B5_1ea1:		and $36, x		; 35 36
B5_1ea3:		ora $4a00, y	; 19 00 4a
B5_1ea6:	.db $2b
B5_1ea7:		ora $4c59, y	; 19 59 4c
B5_1eaa:		ora $1c01, y	; 19 01 1c
B5_1ead:		ora $2b1d, x	; 1d 1d 2b
B5_1eb0:		ora ($4c, x)	; 01 4c
B5_1eb2:		.db $00				; 00
B5_1eb3:		rts				; 60


B5_1eb4:	.db $19 $40 $00
B5_1eb7:		.db $00				; 00
B5_1eb8:	.db $04
B5_1eb9:		jmp $4c4c		; 4c 4c 4c


B5_1ebc:	.db $22
B5_1ebd:		ora $2525, y	; 19 25 25
B5_1ec0:		and $04			; 25 04
B5_1ec2:		ora $5858, y	; 19 58 58
B5_1ec5:		and $25			; 25 25
B5_1ec7:		ora ($12, x)	; 01 12
B5_1ec9:	.db $1f
B5_1eca:	.db $1c
B5_1ecb:		ora $2225, x	; 1d 25 22
B5_1ece:		and $2c			; 25 2c
B5_1ed0:		ora $2501, y	; 19 01 25
B5_1ed3:		bit $0828		; 2c 28 08
B5_1ed6:		ora ($25, x)	; 01 25
B5_1ed8:		.db $00				; 00
B5_1ed9:		ora $04			; 05 04
B5_1edb:		asl $04			; 06 04
B5_1edd:		ora wEntityStructs.byte5.w, x	; 1d 05 04
B5_1ee0:	.db $04
B5_1ee1:		ora $55			; 05 55
B5_1ee3:		and $2c			; 25 2c
B5_1ee5:	.db $12
B5_1ee6:	.db $07
B5_1ee7:		and $25			; 25 25
B5_1ee9:	.db $3b
B5_1eea:	.db $5c
B5_1eeb:		ora ($63, x)	; 01 63
B5_1eed:		ora ($05, x)	; 01 05
B5_1eef:	.db $17
B5_1ef0:	.db $14
B5_1ef1:	.db $04
B5_1ef2:		bit $2555		; 2c 55 25
B5_1ef5:	.db $04
B5_1ef6:		rts				; 60


B5_1ef7:	.db $04
B5_1ef8:	.db $3f
B5_1ef9:		.db $00				; 00
B5_1efa:		jmp $3a36		; 4c 36 3a


B5_1efd:		clc				; 18
B5_1efe:		.db $00				; 00
B5_1eff:	.db $2b
B5_1f00:	.db $2b
B5_1f01:		clc				; 18
B5_1f02:		lsr $014c, x	; 5e 4c 01
B5_1f05:		ora ($1d, x)	; 01 1d
B5_1f07:		ora $4b20, x	; 1d 20 4b
B5_1f0a:		ora ($41, x)	; 01 41
B5_1f0c:	.db $5f
B5_1f0d:		adc ($01, x)	; 61 01
B5_1f0f:		jmp $4e64		; 4c 64 4e


B5_1f12:	.db $04
B5_1f13:		jmp $4c4c		; 4c 4c 4c


B5_1f16:	.db $23
B5_1f17:		and $25			; 25 25
B5_1f19:		and $18			; 25 18
B5_1f1b:	.db $04
B5_1f1c:		and $58			; 25 58
B5_1f1e:		cli				; 58
B5_1f1f:		and $25			; 25 25
B5_1f21:		clc				; 18
B5_1f22:	.db $12
B5_1f23:		asl $1d			; 06 1d
B5_1f25:		ora $2318, x	; 1d 18 23
B5_1f28:	.db $3b
B5_1f29:	.db $13
B5_1f2a:		ora ($01, x)	; 01 01
B5_1f2c:	.db $3b
B5_1f2d:	.db $12
B5_1f2e:		plp				; 28
B5_1f2f:		php				; 08
B5_1f30:		ora ($25, x)	; 01 25
B5_1f32:		.db $00				; 00
B5_1f33:		ora #$04		; 09 04
B5_1f35:		asl $2004, x	; 1e 04 20
B5_1f38:		ora #$04		; 09 04
B5_1f3a:	.db $52
B5_1f3b:	.db $12
B5_1f3c:		lsr $3b, x		; 56 3b
B5_1f3e:	.db $13
B5_1f3f:	.db $04
B5_1f40:	.db $07
B5_1f41:		ora ($25, x)	; 01 25
B5_1f43:		ora $12, x		; 15 12
B5_1f45:		ora ($1a, x)	; 01 1a
B5_1f47:		ora ($09, x)	; 01 09
B5_1f49:	.db $14
B5_1f4a:		ora $04, x		; 15 04
B5_1f4c:	.db $13
B5_1f4d:		lsr $3b, x		; 56 3b
B5_1f4f:	.db $5f
B5_1f50:		adc ($64, x)	; 61 64
B5_1f52:	.db $5a
B5_1f53:	.db $9f
B5_1f54:		cpy #$9f		; c0 9f
B5_1f56:		rol $a0			; 26 a0
B5_1f58:	.db $8c $a0 $00
B5_1f5b:	.db $62
B5_1f5c:		cpy $40ff		; cc ff 40
B5_1f5f:		php				; 08
B5_1f60:	.db $0f
B5_1f61:	.db $0f
B5_1f62:		rol a			; 2a
B5_1f63:	.db $1f
B5_1f64:		eor $3a2a, y	; 59 2a 3a
B5_1f67:		asl a			; 0a
B5_1f68:		rol a			; 2a
B5_1f69:	.db $1a
B5_1f6a:		asl a			; 0a
B5_1f6b:	.db $1a
B5_1f6c:	.db $0f
B5_1f6d:		asl $03			; 06 03
B5_1f6f:	.db $03
B5_1f70:		.db $00				; 00
B5_1f71:		rol $62			; 26 62
B5_1f73:		adc $01			; 65 01
B5_1f75:		php				; 08
B5_1f76:		adc $62			; 65 62
B5_1f78:		pla				; 68
B5_1f79:		ror a			; 6a
B5_1f7a:	.db $62
B5_1f7b:		lsr $c0a0, x	; 5e a0 c0
B5_1f7e:		rti				; 40


B5_1f7f:	.db $42
B5_1f80:	.db $ff
B5_1f81:		cmp $fefe		; cd fe fe
B5_1f84:		and $5700		; 2d 00 57
B5_1f87:		and $ff59		; 2d 59 ff
B5_1f8a:		and $1f59		; 2d 59 1f
B5_1f8d:	.db $2f
B5_1f8e:	.db $ff
B5_1f8f:		and $ffff		; 2d ff ff
B5_1f92:		and $ff32		; 2d 32 ff
B5_1f95:	.db $44
B5_1f96:		ora $2dff		; 0d ff 2d
B5_1f99:	.db $ff
B5_1f9a:		and $28ff		; 2d ff 28
B5_1f9d:	.db $7b
B5_1f9e:	.db $ff
B5_1f9f:		.db $00				; 00
B5_1fa0:		.db $00				; 00
B5_1fa1:		lsr $59, x		; 56 59
B5_1fa3:		.db $00				; 00
B5_1fa4:		.db $00				; 00
B5_1fa5:		.db $00				; 00
B5_1fa6:	.db $ff
B5_1fa7:	.db $32
B5_1fa8:		cld				; d8
B5_1fa9:		plp				; 28
B5_1faa:		inc $0f62, x	; fe 62 0f
B5_1fad:		.db $00				; 00
B5_1fae:		eor ($00, x)	; 41 00
B5_1fb0:		bit $26			; 24 26
B5_1fb2:		inc $0f00, x	; fe 00 0f
B5_1fb5:		jmp ($1f46)		; 6c 46 1f


B5_1fb8:		.db $00				; 00
B5_1fb9:		stx $a6			; 86 a6
B5_1fbb:		dec $01			; c6 01
B5_1fbd:		ora ($86, x)	; 01 86
B5_1fbf:	.db $ff
B5_1fc0:		.db $00				; 00
B5_1fc1:	.db $72
B5_1fc2:	.db $dc
B5_1fc3:	.db $4f
B5_1fc4:		bvc B5_1fde ; 50 18

B5_1fc6:	.db $1f
B5_1fc7:	.db $1f
B5_1fc8:	.db $3a
B5_1fc9:		;removed
	.db $50 $4f

B5_1fcb:	.db $1a
B5_1fcc:		rol a			; 2a
B5_1fcd:	.db $3a
B5_1fce:		asl a			; 0a
B5_1fcf:		asl a			; 0a
B5_1fd0:	.db $1a
B5_1fd1:	.db $3a
B5_1fd2:	.db $1f
B5_1fd3:	.db $1f
B5_1fd4:	.db $13
B5_1fd5:		rol $1f, x		; 36 1f
B5_1fd7:	.db $13
B5_1fd8:		adc $72, x		; 75 72
B5_1fda:		ora ($18), y	; 11 18
B5_1fdc:	.db $72
B5_1fdd:	.db $72
B5_1fde:	.db $72
B5_1fdf:	.db $7a
B5_1fe0:		adc $16, x		; 75 16
B5_1fe2:		;removed
	.db $b0 $d0

B5_1fe4:		;removed
	.db $50 $52

B5_1fe6:	.db $ff
B5_1fe7:		cmp $fefe, x	; dd fe fe
B5_1fea:		eor #$00		; 49 00
B5_1fec:		.db $00				; 00
B5_1fed:		eor #$ff		; 49 ff
B5_1fef:		eor #$ff		; 49 ff
B5_1ff1:		and $ff00, x	; 3d 00 ff
B5_1ff4:		and $ffff, x	; 3d ff ff
B5_1ff7:	.db $22
B5_1ff8:	.db $22
B5_1ff9:		and $0e1e, x	; 3d 1e 0e
B5_1ffc:	.db $ff
B5_1ffd:		ora $3dff, x	; 1d ff 3d
