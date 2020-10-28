
.ifndef ROM_JP
B9_0000:		sed				; f8 
B9_0001:		sta ($11, x)	; 81 11
B9_0003:		php				; 08 
B9_0004:		ora ($08), y	; 11 08
B9_0006:		ora ($08), y	; 11 08
B9_0008:		ora ($0c), y	; 11 0c
.endif

B9_000a:		sbc $600a		; ed0a 60
B9_000d:		;removed
	.db $f0 $ec

B9_000f:	.db $ff
B9_0010:	.db $eb
B9_0011:		asl $041e		; 0e 1e 04
B9_0014:		sbc ($14), y	; f1 14
B9_0016:		bit $0c			; 24 0c
B9_0018:		sbc ($0c), y	; f1 0c
B9_001a:		asl $f104, x	; 1e 04 f1
B9_001d:	.db $14
B9_001e:		bit $08			; 24 08
B9_0020:		bit $08			; 24 08
B9_0022:		bit $08			; 24 08
B9_0024:		inc $1201, x	; fe 01 12
B9_0027:		ldy #$1e		; a0 1e
B9_0029:	.db $04
B9_002a:		sbc ($2c), y	; f1 2c
B9_002c:		asl $f104, x	; 1e 04 f1
B9_002f:	.db $1c
B9_0030:		asl $f104, x	; 1e 04 f1
B9_0033:		rol $1e			; 26 1e
B9_0035:	.db $04
B9_0036:		sbc ($5c), y	; f1 5c
B9_0038:		bit $08			; 24 08
B9_003a:		bit $08			; 24 08
B9_003c:		bit $08			; 24 08
B9_003e:		bit $08			; 24 08
B9_0040:		;removed
	.db $f0 $ec

B9_0042:		.db $00				; 00
B9_0043:	.db $03
B9_0044:		ora ($00, x)	; 01 00
B9_0046:	.db $07
B9_0047:		ora ($08, x)	; 01 08
B9_0049:		ora ($08, x)	; 01 08
B9_004b:		cpx $0501		; ec 01 05
B9_004e:		ora ($02, x)	; 01 02
B9_0050:	.db $17
B9_0051:		cpx $0300		; ec 00 03
B9_0054:		ora ($00, x)	; 01 00
B9_0056:	.db $17
B9_0057:		cpx $0501		; ec 01 05
B9_005a:		ora ($02, x)	; 01 02
B9_005c:	.db $07
B9_005d:		inc $5902, x	; fe 02 59
B9_0060:		ldy #$fd		; a0 fd
B9_0062:		ora ($41, x)	; 01 41
B9_0064:		ldy #$ec		; a0 ec
B9_0066:	.db $04
B9_0067:	.db $03
B9_0068:		ora ($03, x)	; 01 03
B9_006a:	.db $17
B9_006b:		sbc ($18), y	; f1 18
B9_006d:	.db $03
B9_006e:		ora ($03, x)	; 01 03
B9_0070:	.db $1f
B9_0071:	.db $03
B9_0072:		ora ($03, x)	; 01 03
B9_0074:		and #$03		; 29 03
B9_0076:		ora ($03, x)	; 01 03
B9_0078:	.db $17
B9_0079:		sbc ($48), y	; f1 48
B9_007b:		cpx $0501		; ec 01 05
B9_007e:		ora ($02, x)	; 01 02
B9_0080:	.db $07
B9_0081:		inc $7d02, x	; fe 02 7d
B9_0084:		ldy #$ec		; a0 ec
B9_0086:	.db $02
B9_0087:		ora $01			; 05 01
B9_0089:	.db $02
B9_008a:		;removed
	.db $30 $f0

B9_008c:	.db $f3
B9_008d:	.db $f2
B9_008e:	.db $89
B9_008f:		inc $18, x		; f6 18
B9_0091:		ora ($11), y	; 11 11
B9_0093:		ora ($11), y	; 11 11
B9_0095:		ora $0d0d		; 0d 0d 0d
B9_0098:		ora $05f7		; 0d f7 05
B9_009b:		bmi B9_00a2 ; 30 05

B9_009d:		jsr $2a05		; 20 05 2a
B9_00a0:		ora $60			; 05 60
B9_00a2:		ora $08			; 05 08
B9_00a4:		ora $08			; 05 08
B9_00a6:		ora $08			; 05 08
B9_00a8:		ora $0c			; 05 0c
B9_00aa:		;removed
	.db $f0 $08

B9_00ac:		adc $797a, y	; 79 7a 79
B9_00af:	.db $7a
B9_00b0:		adc $8000, y	; 79 00 80
B9_00b3:		adc ($75), y	; 71 75
B9_00b5:		.db $00				; 00
B9_00b6:	.db $80
B9_00b7:		.db $00				; 00
B9_00b8:		.db $00				; 00
B9_00b9:	.db $cb
B9_00ba:		ldy #$01		; a0 01
B9_00bc:		ora ($24, x)	; 01 24
B9_00be:		lda ($02, x)	; a1 02
B9_00c0:	.db $02
B9_00c1:		adc $03a1, x	; 7d a1 03
B9_00c4:	.db $03
B9_00c5:		cld				; d8 
B9_00c6:		lda ($08, x)	; a1 08
B9_00c8:		and ($a2, x)	; 21 a2
B9_00ca:	.db $ff
B9_00cb:		nop				; ea 
B9_00cc:	.db $47
B9_00cd:		ldx #$e7		; a2 e7
B9_00cf:	.db $1b
B9_00d0:		ror $8a, x		; 76 8a
B9_00d2:		sbc $04, x		; f5 04
B9_00d4:		rol $0c			; 26 0c
B9_00d6:	.db $27
B9_00d7:	.db $0c
B9_00d8:		and #$0c		; 29 0c
B9_00da:		rol $30			; 26 30
B9_00dc:		sbc $0c04		; ed04 0c
B9_00df:		rol $06			; 26 06
B9_00e1:		rol $06			; 26 06
B9_00e3:		rol $0c			; 26 0c
B9_00e5:	.db $27
B9_00e6:	.db $0c
B9_00e7:		and #$0c		; 29 0c
B9_00e9:		plp				; 28 
B9_00ea:	.db $0c
B9_00eb:		and #$0c		; 29 0c
B9_00ed:	.db $2b
B9_00ee:	.db $0c
B9_00ef:		plp				; 28 
B9_00f0:		bmi B9_00df ; 30 ed

B9_00f2:	.db $04
B9_00f3:	.db $0c
B9_00f4:		plp				; 28 
B9_00f5:		asl $28			; 06 28
B9_00f7:		asl $28			; 06 28
B9_00f9:	.db $0c
B9_00fa:		and #$0c		; 29 0c
B9_00fc:	.db $2b
B9_00fd:	.db $0c
B9_00fe:		rol a			; 2a
B9_00ff:		clc				; 18 
B9_0100:		rol a			; 2a
B9_0101:		asl $2a			; 06 2a
B9_0103:		asl $ee			; 06 ee
B9_0105:	.db $07
B9_0106:		rol a			; 2a
B9_0107:	.db $0c
B9_0108:		rol a			; 2a
B9_0109:	.db $0c
B9_010a:		rol a			; 2a
B9_010b:	.db $0c
B9_010c:		sbc $04, x		; f5 04
B9_010e:		bit $2c18		; 2c 18 2c
B9_0111:		asl $2c			; 06 2c
B9_0113:		asl $ee			; 06 ee
B9_0115:	.db $07
B9_0116:		bit $2c0c		; 2c 0c 2c
B9_0119:	.db $0c
B9_011a:		bit $f50c		; 2c 0c f5
B9_011d:	.db $04
B9_011e:		rol $ed6c		; 2e 6c ed
B9_0121:		php				; 08 
B9_0122:		bit $f0			; 24 f0
B9_0124:		nop				; ea 
B9_0125:	.db $47
B9_0126:		ldx #$e7		; a2 e7
B9_0128:	.db $1b
B9_0129:		ror $8a, x		; 76 8a
B9_012b:		sbc $04, x		; f5 04
B9_012d:	.db $22
B9_012e:	.db $0c
B9_012f:		bit $0c			; 24 0c
B9_0131:		rol $0c			; 26 0c
B9_0133:	.db $22
B9_0134:		;removed
	.db $30 $ed

B9_0136:	.db $04
B9_0137:	.db $0c
B9_0138:	.db $22
B9_0139:		asl $22			; 06 22
B9_013b:		asl $22			; 06 22
B9_013d:	.db $0c
B9_013e:		bit $0c			; 24 0c
B9_0140:		rol $0c			; 26 0c
B9_0142:		bit $0c			; 24 0c
B9_0144:		rol $0c			; 26 0c
B9_0146:		plp				; 28 
B9_0147:	.db $0c
B9_0148:		bit $30			; 24 30
B9_014a:		sbc $0c04		; ed04 0c
B9_014d:		bit $06			; 24 06
B9_014f:		bit $06			; 24 06
B9_0151:		bit $0c			; 24 0c
B9_0153:		rol $0c			; 26 0c
B9_0155:		plp				; 28 
B9_0156:	.db $0c
B9_0157:		rol $18			; 26 18
B9_0159:		rol $06			; 26 06
B9_015b:		rol $06			; 26 06
B9_015d:		inc $2607		; ee 07 26
B9_0160:	.db $0c
B9_0161:		rol $0c			; 26 0c
B9_0163:		rol $0c			; 26 0c
B9_0165:		sbc $04, x		; f5 04
B9_0167:		bit $18			; 24 18
B9_0169:		bit $06			; 24 06
B9_016b:		bit $06			; 24 06
B9_016d:		inc $2407		; ee 07 24
B9_0170:	.db $0c
B9_0171:		bit $0c			; 24 0c
B9_0173:		bit $0c			; 24 0c
B9_0175:		sbc $04, x		; f5 04
B9_0177:	.db $2b
B9_0178:		jmp ($08ed)		; 6c ed 08


B9_017b:		bit $f0			; 24 f0
B9_017d:		cpx $2401		; ec 01 24
B9_0180:	.db $03
B9_0181:		inc $7f1b, x	; fe 1b 7f
B9_0184:		lda ($ec, x)	; a1 ec
B9_0186:	.db $ff
B9_0187:		sbc ($0c), y	; f1 0c
B9_0189:		bit $01			; 24 01
B9_018b:		sbc ($05), y	; f1 05
B9_018d:		bit $01			; 24 01
B9_018f:		sbc ($05), y	; f1 05
B9_0191:		bit $01			; 24 01
B9_0193:		sbc ($0b), y	; f1 0b
B9_0195:		inc $9102, x	; fe 02 91
B9_0198:		lda ($ec, x)	; a1 ec
B9_019a:		ora ($24, x)	; 01 24
B9_019c:	.db $03
B9_019d:		inc $9b1b, x	; fe 1b 9b
B9_01a0:		lda ($ec, x)	; a1 ec
B9_01a2:	.db $ff
B9_01a3:		sbc ($0c), y	; f1 0c
B9_01a5:		bit $01			; 24 01
B9_01a7:		sbc ($05), y	; f1 05
B9_01a9:		bit $01			; 24 01
B9_01ab:		sbc ($05), y	; f1 05
B9_01ad:		bit $01			; 24 01
B9_01af:		sbc ($0b), y	; f1 0b
B9_01b1:		inc $ad02, x	; fe 02 ad
B9_01b4:		lda ($24, x)	; a1 24
B9_01b6:		ora ($f1, x)	; 01 f1
B9_01b8:	.db $17
B9_01b9:		bit $01			; 24 01
B9_01bb:		sbc ($05), y	; f1 05
B9_01bd:		bit $01			; 24 01
B9_01bf:		sbc ($05), y	; f1 05
B9_01c1:		bit $01			; 24 01
B9_01c3:		sbc ($0b), y	; f1 0b
B9_01c5:		inc $c102, x	; fe 02 c1
B9_01c8:		lda ($fd, x)	; a1 fd
B9_01ca:		ora ($b5, x)	; 01 b5
B9_01cc:		lda ($ec, x)	; a1 ec
B9_01ce:		ora ($24, x)	; 01 24
B9_01d0:	.db $03
B9_01d1:		inc $cf22, x	; fe 22 cf
B9_01d4:		lda ($f1, x)	; a1 f1
B9_01d6:		bit $f0			; 24 f0
B9_01d8:		cpx $0301		; ec 01 03
B9_01db:		ora ($01, x)	; 01 01
B9_01dd:	.db $02
B9_01de:		inc $da1a, x	; fe 1a da
B9_01e1:		lda ($03, x)	; a1 03
B9_01e3:		ora ($01, x)	; 01 01
B9_01e5:		asl $0106		; 0e 06 01
B9_01e8:	.db $02
B9_01e9:		ora $06			; 05 06
B9_01eb:		ora ($02, x)	; 01 02
B9_01ed:		ora $ec			; 05 ec
B9_01ef:		ora ($06, x)	; 01 06
B9_01f1:		ora ($02, x)	; 01 02
B9_01f3:	.db $0b
B9_01f4:		inc $f002, x	; fe 02 f0
B9_01f7:		lda ($fd, x)	; a1 fd
B9_01f9:		ora ($d8, x)	; 01 d8
B9_01fb:		lda ($06, x)	; a1 06
B9_01fd:		ora ($02, x)	; 01 02
B9_01ff:	.db $17
B9_0200:		asl $01			; 06 01
B9_0202:	.db $02
B9_0203:		ora $06			; 05 06
B9_0205:		ora ($02, x)	; 01 02
B9_0207:		ora $06			; 05 06
B9_0209:		ora ($02, x)	; 01 02
B9_020b:	.db $0b
B9_020c:		inc $0802, x	; fe 02 08
B9_020f:		ldx #$fd		; a2 fd
B9_0211:		ora ($fc, x)	; 01 fc
B9_0213:		lda ($03, x)	; a1 03
B9_0215:		ora ($01, x)	; 01 01
B9_0217:	.db $02
B9_0218:		inc $1422, x	; fe 22 14
B9_021b:		ldx #$03		; a2 03
B9_021d:		ora ($01, x)	; 01 01
B9_021f:		rol $f0			; 26 f0
B9_0221:	.db $f3
B9_0222:	.db $f2
B9_0223:	.db $89
B9_0224:		asl a			; 0a
B9_0225:	.db $3c
B9_0226:		ora $06			; 05 06
B9_0228:		ora $06			; 05 06
B9_022a:		asl a			; 0a
B9_022b:		pha				; 48 
B9_022c:	.db $0c
B9_022d:	.db $3c
B9_022e:	.db $07
B9_022f:		asl $07			; 06 07
B9_0231:		asl $0c			; 06 0c
B9_0233:		pha				; 48 
B9_0234:		asl $0e24		; 0e 24 0e
B9_0237:	.db $0c
B9_0238:		asl $0e0c		; 0e 0c 0e
B9_023b:	.db $0c
B9_023c:		php				; 08 
B9_023d:		bit $08			; 24 08
B9_023f:	.db $0c
B9_0240:		php				; 08 
B9_0241:	.db $0c
B9_0242:		php				; 08 
B9_0243:	.db $0c
B9_0244:	.db $03
B9_0245:		bcc B9_0237 ; 90 f0

B9_0247:	.db $07
B9_0248:		and $3b3a, y	; 39 3a 3b
B9_024b:	.db $3a
B9_024c:		.db $00				; 00
B9_024d:	.db $80
B9_024e:		and ($36), y	; 31 36
B9_0250:		.db $00				; 00
B9_0251:	.db $80
B9_0252:		.db $00				; 00
B9_0253:		.db $00				; 00
B9_0254:		ror $a2			; 66 a2
B9_0256:		ora ($01, x)	; 01 01
B9_0258:	.db $1f
B9_0259:	.db $a3
B9_025a:	.db $02
B9_025b:	.db $02
B9_025c:		sty $a3, x		; 94 a3
B9_025e:	.db $03
B9_025f:	.db $03
B9_0260:	.db $73
B9_0261:		ldy $08			; a4 08
B9_0263:		ldy #$a5		; a0 a5
B9_0265:	.db $ff
B9_0266:		nop				; ea 
B9_0267:	.db $fa
B9_0268:		lda $e7			; a5 e7
B9_026a:		ora $c2			; 05 c2
B9_026c:		txa				; 8a 
B9_026d:	.db $ef
B9_026e:		ora $06, x		; 15 06
B9_0270:		clc				; 18 
B9_0271:	.db $07
B9_0272:		ora $07, x		; 15 07
B9_0274:	.db $1a
B9_0275:		asl $15			; 06 15
B9_0277:	.db $07
B9_0278:		clc				; 18 
B9_0279:	.db $07
B9_027a:		ora $06, x		; 15 06
B9_027c:		clc				; 18 
B9_027d:	.db $07
B9_027e:		ora $07, x		; 15 07
B9_0280:	.db $1a
B9_0281:		asl $15			; 06 15
B9_0283:	.db $07
B9_0284:		clc				; 18 
B9_0285:	.db $07
B9_0286:		ora $06, x		; 15 06
B9_0288:		clc				; 18 
B9_0289:	.db $07
B9_028a:		ora $07, x		; 15 07
B9_028c:	.db $1a
B9_028d:		asl $15			; 06 15
B9_028f:	.db $07
B9_0290:	.db $1a
B9_0291:	.db $07
B9_0292:	.db $fa
B9_0293:		nop				; ea 
B9_0294:		.db $00				; 00
B9_0295:		ldx $f5			; a6 f5
B9_0297:	.db $04
B9_0298:		clc				; 18 
B9_0299:	.db $0f
B9_029a:	.db $17
B9_029b:	.db $0f
B9_029c:		asl $0a, x		; 16 0a
B9_029e:	.db $fa
B9_029f:		inc $6601, x	; fe 01 66
B9_02a2:		ldx #$ea		; a2 ea
B9_02a4:	.db $1a
B9_02a5:		ldx $e7			; a6 e7
B9_02a7:	.db $0c
B9_02a8:	.db $da
B9_02a9:		txa				; 8a 
B9_02aa:		sbc $06, x		; f5 06
B9_02ac:		jsr $2101		; 20 01 21
B9_02af:		ora ($1c), y	; 11 1c
B9_02b1:	.db $12
B9_02b2:	.db $1b
B9_02b3:		clc				; 18 
B9_02b4:	.db $1a
B9_02b5:	.db $0c
B9_02b6:		clc				; 18 
B9_02b7:	.db $0c
B9_02b8:		ora $0c, x		; 15 0c
B9_02ba:		inc $ac01, x	; fe 01 ac
B9_02bd:		ldx #$1f		; a2 1f
B9_02bf:		ora ($20, x)	; 01 20
B9_02c1:		ora ($1b), y	; 11 1b
B9_02c3:	.db $12
B9_02c4:	.db $1a
B9_02c5:		clc				; 18 
B9_02c6:		ora $180c, y	; 19 0c 18
B9_02c9:	.db $0c
B9_02ca:	.db $14
B9_02cb:	.db $0c
B9_02cc:	.db $1f
B9_02cd:		ora ($20, x)	; 01 20
B9_02cf:		ora ($1b), y	; 11 1b
B9_02d1:	.db $12
B9_02d2:	.db $1a
B9_02d3:		clc				; 18 
B9_02d4:		ora $fa0c, y	; 19 0c fa
B9_02d7:		clc				; 18 
B9_02d8:	.db $0c
B9_02d9:	.db $14
B9_02da:	.db $0c
B9_02db:		sbc $a301, x	; fd 01 a3
B9_02de:		ldx #$ea		; a2 ea
B9_02e0:		bit $1ca6		; 2c a6 1c
B9_02e3:	.db $12
B9_02e4:	.db $1c
B9_02e5:	.db $12
B9_02e6:	.db $1c
B9_02e7:	.db $0c
B9_02e8:		inc $e201, x	; fe 01 e2
B9_02eb:		ldx #$fa		; a2 fa
B9_02ed:	.db $1f
B9_02ee:	.db $12
B9_02ef:	.db $1f
B9_02f0:	.db $12
B9_02f1:	.db $1f
B9_02f2:	.db $0c
B9_02f3:		ora $1d12, x	; 1d 12 1d
B9_02f6:	.db $12
B9_02f7:		ora $fb0c, x	; 1d 0c fb
B9_02fa:	.db $e2
B9_02fb:		ldx #$ea		; a2 ea
B9_02fd:		and $f6a6, y	; 39 a6 f6
B9_0300:		asl $ef			; 06 ef
B9_0302:	.db $14
B9_0303:	.db $17
B9_0304:	.db $1a
B9_0305:	.db $1f
B9_0306:		nop				; ea 
B9_0307:		rol $1aa6, x	; 3e a6 1a
B9_030a:	.db $1f
B9_030b:		jsr $ea23		; 20 23 ea
B9_030e:	.db $43
B9_030f:		ldx $20			; a6 20
B9_0311:	.db $23
B9_0312:		rol $2b			; 26 2b
B9_0314:		nop				; ea 
B9_0315:		pha				; 48 
B9_0316:		ldx $26			; a6 26
B9_0318:	.db $2b
B9_0319:		bit $f72f		; 2c 2f f7
B9_031c:	.db $fc
B9_031d:	.db $a3
B9_031e:		ldx #$f1		; a2 f1
B9_0320:		asl a			; 0a
B9_0321:		sed				; f8 
B9_0322:	.db $82
B9_0323:		nop				; ea 
B9_0324:		asl a			; 0a
B9_0325:		ldx $fb			; a6 fb
B9_0327:		adc #$a2		; 69 a2
B9_0329:		nop				; ea 
B9_032a:		bpl B9_02d2 ; 10 a6

B9_032c:	.db $fb
B9_032d:		stx $a2, y		; 96 a2
B9_032f:		inc $2301, x	; fe 01 23
B9_0332:	.db $a3
B9_0333:		sbc ($08), y	; f1 08
B9_0335:		sed				; f8 
B9_0336:		sta ($ea, x)	; 81 ea
B9_0338:		and $a6			; 25 a6
B9_033a:	.db $fb
B9_033b:		ldx $a2			; a6 a2
B9_033d:		clc				; 18 
B9_033e:	.db $0c
B9_033f:	.db $14
B9_0340:	.db $0c
B9_0341:	.db $fb
B9_0342:		ldx $a2			; a6 a2
B9_0344:		clc				; 18 
B9_0345:		asl $ea			; 06 ea
B9_0347:		bit $f8a6		; 2c a6 f8
B9_034a:	.db $80
B9_034b:	.db $17
B9_034c:	.db $12
B9_034d:	.db $17
B9_034e:	.db $12
B9_034f:	.db $17
B9_0350:	.db $0c
B9_0351:		inc $4b01, x	; fe 01 4b
B9_0354:	.db $a3
B9_0355:	.db $fa
B9_0356:	.db $1a
B9_0357:	.db $12
B9_0358:	.db $1a
B9_0359:	.db $12
B9_035a:	.db $1a
B9_035b:	.db $0c
B9_035c:		clc				; 18 
B9_035d:	.db $12
B9_035e:		clc				; 18 
B9_035f:	.db $12
B9_0360:		clc				; 18 
B9_0361:	.db $0c
B9_0362:	.db $fb
B9_0363:	.db $4b
B9_0364:	.db $a3
B9_0365:		sbc ($08), y	; f1 08
B9_0367:		sed				; f8 
B9_0368:		sta ($ea, x)	; 81 ea
B9_036a:		eor $8b			; 45 8b
B9_036c:		inc $06, x		; f6 06
B9_036e:	.db $ef
B9_036f:	.db $14
B9_0370:	.db $17
B9_0371:	.db $1a
B9_0372:	.db $1f
B9_0373:		nop				; ea 
B9_0374:		eor ($8b, x)	; 41 8b
B9_0376:	.db $1a
B9_0377:	.db $1f
B9_0378:		jsr $ea23		; 20 23 ea
B9_037b:		eor $20a6		; 4d a6 20
B9_037e:	.db $23
B9_037f:		rol $2b			; 26 2b
B9_0381:		nop				; ea 
B9_0382:	.db $52
B9_0383:		ldx $26			; a6 26
B9_0385:	.db $2b
B9_0386:		nop				; ea 
B9_0387:		eor $2ca6		; 4d a6 2c
B9_038a:		nop				; ea 
B9_038b:		eor ($8b, x)	; 41 8b
B9_038d:	.db $2f
B9_038e:	.db $f7
B9_038f:		sbc ($0a), y	; f1 0a
B9_0391:	.db $fc
B9_0392:	.db $37
B9_0393:	.db $a3
B9_0394:		cpx $ebff		; ec ff eb
B9_0397:		ora $041e		; 0d 1e 04
B9_039a:		sbc ($24), y	; f1 24
B9_039c:		inc $9802, x	; fe 02 98
B9_039f:	.db $a3
B9_03a0:		inc $05, x		; f6 05
B9_03a2:		rol $26			; 26 26
B9_03a4:	.db $1f
B9_03a5:	.db $1f
B9_03a6:	.db $1a
B9_03a7:	.db $1a
B9_03a8:	.db $13
B9_03a9:	.db $13
B9_03aa:	.db $f7
B9_03ab:		asl $f104, x	; 1e 04 f1
B9_03ae:		bit $1e			; 24 1e
B9_03b0:	.db $04
B9_03b1:		sbc ($24), y	; f1 24
B9_03b3:	.db $23
B9_03b4:		asl $1e			; 06 1e
B9_03b6:	.db $04
B9_03b7:		sbc ($03), y	; f1 03
B9_03b9:	.db $23
B9_03ba:	.db $07
B9_03bb:		asl $f104, x	; 1e 04 f1
B9_03be:	.db $02
B9_03bf:	.db $23
B9_03c0:	.db $07
B9_03c1:		asl $f104, x	; 1e 04 f1
B9_03c4:	.db $03
B9_03c5:		inc $05, x		; f6 05
B9_03c7:		rol $26			; 26 26
B9_03c9:	.db $1f
B9_03ca:	.db $1f
B9_03cb:	.db $1a
B9_03cc:	.db $1a
B9_03cd:	.db $13
B9_03ce:	.db $13
B9_03cf:	.db $f7
B9_03d0:		asl $f104, x	; 1e 04 f1
B9_03d3:		php				; 08 
B9_03d4:	.db $23
B9_03d5:	.db $0c
B9_03d6:		asl $f104, x	; 1e 04 f1
B9_03d9:	.db $02
B9_03da:		asl $f104, x	; 1e 04 f1
B9_03dd:	.db $02
B9_03de:	.db $23
B9_03df:	.db $0c
B9_03e0:		asl $f104, x	; 1e 04 f1
B9_03e3:	.db $02
B9_03e4:		asl $f104, x	; 1e 04 f1
B9_03e7:	.db $02
B9_03e8:	.db $23
B9_03e9:		asl $1e			; 06 1e
B9_03eb:	.db $04
B9_03ec:		sbc ($08), y	; f1 08
B9_03ee:		asl $f104, x	; 1e 04 f1
B9_03f1:	.db $02
B9_03f2:	.db $23
B9_03f3:	.db $0c
B9_03f4:	.db $fa
B9_03f5:		inc $d002, x	; fe 02 d0
B9_03f8:	.db $a3
B9_03f9:		asl $f104, x	; 1e 04 f1
B9_03fc:		php				; 08 
B9_03fd:	.db $23
B9_03fe:	.db $0c
B9_03ff:		asl $f104, x	; 1e 04 f1
B9_0402:	.db $02
B9_0403:		asl $f104, x	; 1e 04 f1
B9_0406:	.db $02
B9_0407:	.db $23
B9_0408:		asl $1e			; 06 1e
B9_040a:	.db $04
B9_040b:		sbc ($02), y	; f1 02
B9_040d:		inc $04, x		; f6 04
B9_040f:		rol $26			; 26 26
B9_0411:		rol $f6			; 26 f6
B9_0413:		asl $1f			; 06 1f
B9_0415:	.db $1f
B9_0416:	.db $1a
B9_0417:	.db $1a
B9_0418:	.db $13
B9_0419:	.db $13
B9_041a:	.db $f7
B9_041b:	.db $fb
B9_041c:		bne B9_03c1 ; d0 a3

B9_041e:		inc $1b02, x	; fe 02 1b
B9_0421:		ldy $f6			; a4 f6
B9_0423:	.db $04
B9_0424:	.db $23
B9_0425:	.db $23
B9_0426:	.db $23
B9_0427:	.db $f7
B9_0428:	.db $23
B9_0429:		asl $1e			; 06 1e
B9_042b:	.db $04
B9_042c:		sbc ($02), y	; f1 02
B9_042e:	.db $23
B9_042f:		asl $23			; 06 23
B9_0431:		asl $23			; 06 23
B9_0433:		asl $1e			; 06 1e
B9_0435:	.db $04
B9_0436:		sbc ($02), y	; f1 02
B9_0438:	.db $23
B9_0439:		asl $1e			; 06 1e
B9_043b:	.db $04
B9_043c:		sbc ($02), y	; f1 02
B9_043e:		inc $06, x		; f6 06
B9_0440:		rol $26			; 26 26
B9_0442:	.db $1f
B9_0443:	.db $1f
B9_0444:	.db $1a
B9_0445:	.db $1a
B9_0446:	.db $f7
B9_0447:	.db $fb
B9_0448:		;removed
	.db $d0 $a3

B9_044a:	.db $23
B9_044b:		asl $1e			; 06 1e
B9_044d:	.db $04
B9_044e:		sbc ($02), y	; f1 02
B9_0450:		asl $f104, x	; 1e 04 f1
B9_0453:	.db $02
B9_0454:		inc $4a01, x	; fe 01 4a
B9_0457:		ldy $23			; a4 23
B9_0459:		asl $1e			; 06 1e
B9_045b:	.db $04
B9_045c:		sbc ($02), y	; f1 02
B9_045e:		inc $06, x		; f6 06
B9_0460:	.db $23
B9_0461:	.db $23
B9_0462:	.db $1f
B9_0463:	.db $1f
B9_0464:	.db $1a
B9_0465:	.db $1a
B9_0466:	.db $13
B9_0467:	.db $13
B9_0468:	.db $f7
B9_0469:	.db $fb
B9_046a:		bne B9_040f ; d0 a3

B9_046c:		sbc ($30), y	; f1 30
B9_046e:		sbc ($30), y	; f1 30
B9_0470:	.db $fc
B9_0471:		bne B9_0416 ; d0 a3

B9_0473:		cpx $0505		; ec 05 05
B9_0476:	.db $02
B9_0477:	.db $04
B9_0478:		rol $fe			; 26 fe
B9_047a:	.db $02
B9_047b:		adc $a4, x		; 75 a4
B9_047d:		cpx wEntityStructs.tileX.w		; ec 00 04
B9_0480:		ora ($01, x)	; 01 01
B9_0482:	.db $04
B9_0483:		inc $7f07, x	; fe 07 7f
B9_0486:		ldy $ec			; a4 ec
B9_0488:		ora $05			; 05 05
B9_048a:	.db $02
B9_048b:	.db $04
B9_048c:		rol $fe			; 26 fe
B9_048e:		ora ($89, x)	; 01 89
B9_0490:		ldy $ec			; a4 ec
B9_0492:	.db $02
B9_0493:		ora $02			; 05 02
B9_0495:	.db $04
B9_0496:	.db $0b
B9_0497:		ora $02			; 05 02
B9_0499:	.db $04
B9_049a:	.db $0b
B9_049b:		ora $02			; 05 02
B9_049d:	.db $04
B9_049e:	.db $0c
B9_049f:		cpx wEntityStructs.tileX.w		; ec 00 04
B9_04a2:		ora ($01, x)	; 01 01
B9_04a4:	.db $04
B9_04a5:		inc $a107, x	; fe 07 a1
B9_04a8:		ldy $ec			; a4 ec
B9_04aa:	.db $02
B9_04ab:		ora $02			; 05 02
B9_04ad:	.db $04
B9_04ae:		asl a			; 0a
B9_04af:		cpx $0501		; ec 01 05
B9_04b2:		ora ($02, x)	; 01 02
B9_04b4:	.db $0b
B9_04b5:	.db $03
B9_04b6:		ora ($02, x)	; 01 02
B9_04b8:		ora $ec			; 05 ec
B9_04ba:		.db $00				; 00
B9_04bb:	.db $03
B9_04bc:		ora ($00, x)	; 01 00
B9_04be:		ora $ec			; 05 ec
B9_04c0:		ora ($05, x)	; 01 05
B9_04c2:		ora ($02, x)	; 01 02
B9_04c4:	.db $0b
B9_04c5:	.db $03
B9_04c6:		ora ($02, x)	; 01 02
B9_04c8:		ora $ec			; 05 ec
B9_04ca:		.db $00				; 00
B9_04cb:	.db $03
B9_04cc:		ora ($00, x)	; 01 00
B9_04ce:		ora $ec			; 05 ec
B9_04d0:		ora ($05, x)	; 01 05
B9_04d2:		ora ($02, x)	; 01 02
B9_04d4:		ora $ec			; 05 ec
B9_04d6:		.db $00				; 00
B9_04d7:	.db $03
B9_04d8:		ora ($00, x)	; 01 00
B9_04da:		ora $ec			; 05 ec
B9_04dc:		ora ($02, x)	; 01 02
B9_04de:		asl $ec			; 06 ec
B9_04e0:		.db $00				; 00
B9_04e1:	.db $03
B9_04e2:		ora ($00, x)	; 01 00
B9_04e4:		ora $ec			; 05 ec
B9_04e6:		ora ($05, x)	; 01 05
B9_04e8:		ora ($02, x)	; 01 02
B9_04ea:	.db $0b
B9_04eb:	.db $fa
B9_04ec:	.db $03
B9_04ed:		ora ($02, x)	; 01 02
B9_04ef:	.db $0b
B9_04f0:		inc $b102, x	; fe 02 b1
B9_04f3:		ldy $05			; a4 05
B9_04f5:		ora ($02, x)	; 01 02
B9_04f7:	.db $0b
B9_04f8:	.db $03
B9_04f9:		ora ($02, x)	; 01 02
B9_04fb:		ora $ec			; 05 ec
B9_04fd:		.db $00				; 00
B9_04fe:	.db $03
B9_04ff:		ora ($00, x)	; 01 00
B9_0501:		ora $ec			; 05 ec
B9_0503:		ora ($05, x)	; 01 05
B9_0505:		ora ($02, x)	; 01 02
B9_0507:		ora $ec			; 05 ec
B9_0509:		.db $00				; 00
B9_050a:	.db $03
B9_050b:		ora ($00, x)	; 01 00
B9_050d:		ora $04			; 05 04
B9_050f:		ora ($01, x)	; 01 01
B9_0511:	.db $03
B9_0512:		inc $0e02, x	; fe 02 0e
B9_0515:		lda $04			; a5 04
B9_0517:		ora ($01, x)	; 01 01
B9_0519:		ora $fe			; 05 fe
B9_051b:		ora $16			; 05 16
B9_051d:		lda $fb			; a5 fb
B9_051f:		lda #$a4		; a9 a4
B9_0521:	.db $03
B9_0522:		ora ($02, x)	; 01 02
B9_0524:	.db $0b
B9_0525:	.db $fb
B9_0526:		lda ($a4), y	; b1 a4
B9_0528:	.db $03
B9_0529:		ora ($02, x)	; 01 02
B9_052b:	.db $0b
B9_052c:	.db $fb
B9_052d:		lda ($a4), y	; b1 a4
B9_052f:		cpx $0501		; ec 01 05
B9_0532:		ora ($02, x)	; 01 02
B9_0534:	.db $03
B9_0535:		inc $3102, x	; fe 02 31
B9_0538:		lda $05			; a5 05
B9_053a:		ora ($02, x)	; 01 02
B9_053c:		ora $ec			; 05 ec
B9_053e:		.db $00				; 00
B9_053f:	.db $03
B9_0540:		ora ($00, x)	; 01 00
B9_0542:		ora $ec			; 05 ec
B9_0544:		ora ($05, x)	; 01 05
B9_0546:		ora ($02, x)	; 01 02
B9_0548:		ora $fe			; 05 fe
B9_054a:	.db $02
B9_054b:		eor $a5			; 45 a5
B9_054d:		cpx $0300		; ec 00 03
B9_0550:		ora ($00, x)	; 01 00
B9_0552:		ora $ec			; 05 ec
B9_0554:		ora ($05, x)	; 01 05
B9_0556:		ora ($02, x)	; 01 02
B9_0558:		ora $ec			; 05 ec
B9_055a:		.db $00				; 00
B9_055b:	.db $03
B9_055c:		ora ($00, x)	; 01 00
B9_055e:		ora $04			; 05 04
B9_0560:		ora ($01, x)	; 01 01
B9_0562:		ora $fe			; 05 fe
B9_0564:		ora $5f			; 05 5f
B9_0566:		lda $fb			; a5 fb
B9_0568:		lda #$a4		; a9 a4
B9_056a:		cpx $0503		; ec 03 05
B9_056d:	.db $02
B9_056e:	.db $04
B9_056f:		bpl B9_056f ; 10 fe

B9_0571:		ora ($6c, x)	; 01 6c
B9_0573:		lda $05			; a5 05
B9_0575:	.db $02
B9_0576:	.db $04
B9_0577:		asl a			; 0a
B9_0578:	.db $fa
B9_0579:		cpx $0502		; ec 02 05
B9_057c:	.db $02
B9_057d:	.db $04
B9_057e:		asl a			; 0a
B9_057f:		cpx wEntityStructs.tileX.w		; ec 00 04
B9_0582:		ora ($01, x)	; 01 01
B9_0584:		ora $fe			; 05 fe
B9_0586:		ora $81			; 05 81
B9_0588:		lda $fb			; a5 fb
B9_058a:		lda #$a4		; a9 a4
B9_058c:		nop				; ea 
B9_058d:	.db $57
B9_058e:		ldx $04			; a6 04
B9_0590:		bit $e7			; 24 e7
B9_0592:		ora ($77, x)	; 01 77
B9_0594:		ldx $ec			; a6 ec
B9_0596:	.db $07
B9_0597:		.db $00				; 00
B9_0598:	.db $0c
B9_0599:		inc $fb			; e6 fb
B9_059b:		ror a			; 6a
B9_059c:		lda $fc			; a5 fc
B9_059e:		lda #$a4		; a9 a4
B9_05a0:	.db $f3
B9_05a1:	.db $f2
B9_05a2:	.db $89
B9_05a3:		ora #$0d		; 09 0d
B9_05a5:		ora #$06		; 09 06
B9_05a7:		sbc ($01), y	; f1 01
B9_05a9:		inc $a305, x	; fe 05 a3
B9_05ac:		lda $09			; a5 09
B9_05ae:	.db $0f
B9_05af:	.db $07
B9_05b0:	.db $0f
B9_05b1:		asl $0a			; 06 0a
B9_05b3:		sbc $a301, x	; fd 01 a3
B9_05b6:		lda $f6			; a5 f6
B9_05b8:		asl $09			; 06 09
B9_05ba:		ora #$0c		; 09 0c
B9_05bc:		ora #$fe		; 09 fe
B9_05be:	.db $07
B9_05bf:		lda $05a5, y	; b9 a5 05
B9_05c2:		ora $08			; 05 08
B9_05c4:		ora $fe			; 05 fe
B9_05c6:	.db $07
B9_05c7:		cmp ($a5, x)	; c1 a5
B9_05c9:		sbc $b701, x	; fd 01 b7
B9_05cc:		lda $04			; a5 04
B9_05ce:	.db $04
B9_05cf:		;removed
	.db $10 $04

B9_05d1:		inc $cd03, x	; fe 03 cd
B9_05d4:		lda $fa			; a5 fa
B9_05d6:	.db $07
B9_05d7:	.db $07
B9_05d8:	.db $13
B9_05d9:	.db $07
B9_05da:	.db $07
B9_05db:	.db $07
B9_05dc:	.db $13
B9_05dd:	.db $07
B9_05de:		ora $05			; 05 05
B9_05e0:		ora ($05), y	; 11 05
B9_05e2:		ora $05			; 05 05
B9_05e4:		ora ($05), y	; 11 05
B9_05e6:	.db $fb
B9_05e7:		cmp $f7a5		; cd a5 f7
B9_05ea:		sbc ($30), y	; f1 30
B9_05ec:		inc $06, x		; f6 06
B9_05ee:	.db $1c
B9_05ef:		jsr $1c20		; 20 20 1c
B9_05f2:		jsr $1c20		; 20 20 1c
B9_05f5:		jsr $fcf7		; 20 f7 fc
B9_05f8:	.db $b7
B9_05f9:		lda $00			; a5 00
B9_05fb:		ror $78, x		; 76 78
B9_05fd:	.db $37
B9_05fe:		.db $00				; 00
B9_05ff:	.db $80
B9_0600:		asl $3c			; 06 3c
B9_0602:	.db $3d $3c $00
B9_0605:	.db $80
B9_0606:		and ($35), y	; 31 35
B9_0608:		.db $00				; 00
B9_0609:	.db $80
B9_060a:		.db $00				; 00
B9_060b:	.db $73
B9_060c:	.db $74
B9_060d:	.db $34
B9_060e:		.db $00				; 00
B9_060f:	.db $80
B9_0610:		asl $36			; 06 36
B9_0612:	.db $37
B9_0613:		rol $00, x		; 36 00
B9_0615:	.db $80
B9_0616:		and ($34), y	; 31 34
B9_0618:		.db $00				; 00
B9_0619:	.db $80
B9_061a:	.db $07
B9_061b:		and $3d3e, x	; 3d 3e 3d
B9_061e:	.db $3c
B9_061f:		.db $00				; 00
B9_0620:	.db $80
B9_0621:		and ($39), y	; 31 39
B9_0623:		.db $00				; 00
B9_0624:	.db $80
B9_0625:	.db $04
B9_0626:	.db $34
B9_0627:		.db $00				; 00
B9_0628:	.db $80
B9_0629:	.db $33
B9_062a:		.db $00				; 00
B9_062b:	.db $80
B9_062c:		ora #$79		; 09 79
B9_062e:	.db $7a
B9_062f:	.db $7b
B9_0630:	.db $7c
B9_0631:	.db $7b
B9_0632:	.db $7a
B9_0633:		.db $00				; 00
B9_0634:	.db $80
B9_0635:		adc ($75), y	; 71 75
B9_0637:		.db $00				; 00
B9_0638:	.db $80
B9_0639:		.db $00				; 00
B9_063a:		sei				; 78 
B9_063b:		adc $00, x		; 75 00
B9_063d:	.db $80
B9_063e:		.db $00				; 00
B9_063f:	.db $79 $76 $00
B9_0642:	.db $80
B9_0643:		.db $00				; 00
B9_0644:	.db $7b
B9_0645:		sei				; 78 
B9_0646:		.db $00				; 00
B9_0647:	.db $80
B9_0648:		.db $00				; 00
B9_0649:	.db $7d $7a $00
B9_064c:	.db $80
B9_064d:		.db $00				; 00
B9_064e:	.db $77
B9_064f:		ror $00, x		; 76 00
B9_0651:	.db $80
B9_0652:		.db $00				; 00
B9_0653:	.db $79 $78 $00
B9_0656:	.db $80
B9_0657:		.db $00				; 00
B9_0658:	.db $33
B9_0659:	.db $32
B9_065a:		and ($31), y	; 31 31
B9_065c:	.db $32
B9_065d:	.db $32
B9_065e:	.db $33
B9_065f:	.db $33
B9_0660:	.db $34
B9_0661:	.db $34
B9_0662:		and $35, x		; 35 35
B9_0664:		rol $36, x		; 36 36
B9_0666:	.db $37
B9_0667:	.db $37
B9_0668:		sec				; 38 
B9_0669:		sec				; 38 
B9_066a:	.db $3a
B9_066b:	.db $3a
B9_066c:	.db $3b
B9_066d:	.db $3b
B9_066e:	.db $3c
B9_066f:	.db $3c
B9_0670:		and $3e3d, x	; 3d 3d 3e
B9_0673:	.db $3e $3f $00
B9_0676:	.db $80
B9_0677:	.db $04
B9_0678:		ora $06			; 05 06
B9_067a:	.db $07
B9_067b:		php				; 08 
B9_067c:		ora #$0a		; 09 0a
B9_067e:	.db $0b
B9_067f:	.db $0c
B9_0680:		ora $0f0e		; 0d 0e 0f
B9_0683:	.db $80
B9_0684:	.db $0b
B9_0685:		.db $00				; 00
B9_0686:		.db $00				; 00
B9_0687:		sta $01a6, y	; 99 a6 01
B9_068a:		ora ($5b, x)	; 01 5b
B9_068c:		tay				; a8 
B9_068d:	.db $02
B9_068e:	.db $02
B9_068f:		eor $03a9, x	; 5d a9 03
B9_0692:	.db $03
B9_0693:		and $08aa, x	; 3d aa 08
B9_0696:		txs				; 9a 
B9_0697:	.db $ab
B9_0698:	.db $ff
B9_0699:		nop				; ea 
B9_069a:		sbc $e7ac, y	; f9 ac e7
B9_069d:		jsr $8a96		; 20 96 8a
B9_06a0:		sbc $10, x		; f5 10
B9_06a2:		clc				; 18 
B9_06a3:		php				; 08 
B9_06a4:		clc				; 18 
B9_06a5:		;removed
	.db $10 $18

B9_06a7:		clc				; 18 
B9_06a8:		clc				; 18 
B9_06a9:		bpl B9_06c3 ; 10 18

B9_06ab:		clc				; 18 
B9_06ac:	.db $1a
B9_06ad:		clc				; 18 
B9_06ae:	.db $1b
B9_06af:		bpl B9_06a0 ; 10 ef

B9_06b1:		ora $ed10, x	; 1d 10 ed
B9_06b4:		php				; 08 
B9_06b5:		;removed
	.db $30 $ea

B9_06b7:		ora $ad			; 05 ad
B9_06b9:		sbc $08, x		; f5 08
B9_06bb:		ora $ea18, x	; 1d 18 ea
B9_06be:		bpl B9_066d ; 10 ad

B9_06c0:	.db $1b
B9_06c1:		clc				; 18 
B9_06c2:		nop				; ea 
B9_06c3:	.db $1b
B9_06c4:		lda $04f5		; ad f5 04
B9_06c7:	.db $fa
B9_06c8:		ora $fb10, y	; 19 10 fb
B9_06cb:		sta $1da6, y	; 99 a6 1d
B9_06ce:		;removed
	.db $10 $ea

B9_06d0:	.db $47
B9_06d1:		lda $08f5		; ad f5 08
B9_06d4:	.db $1f
B9_06d5:		bmi B9_06f1 ; 30 1a

B9_06d7:		bpl B9_06fb ; 10 22

B9_06d9:		php				; 08 
B9_06da:		jsr $1f10		; 20 10 1f
B9_06dd:		bpl B9_06fe ; 10 1f

B9_06df:		php				; 08 
B9_06e0:		jsr $fe10		; 20 10 fe
B9_06e3:		ora ($d2, x)	; 01 d2
B9_06e5:		ldx $ea			; a6 ea
B9_06e7:	.db $1b
B9_06e8:		lda $f6ef		; ad ef f6
B9_06eb:		php				; 08 
B9_06ec:	.db $1f
B9_06ed:		ora $1a1b, x	; 1d 1b 1a
B9_06f0:		nop				; ea 
B9_06f1:		ora $ad			; 05 ad
B9_06f3:	.db $1f
B9_06f4:		ora $1a1b, x	; 1d 1b 1a
B9_06f7:		nop				; ea 
B9_06f8:		rol $ad			; 26 ad
B9_06fa:	.db $1f
B9_06fb:		ora $1a1b, x	; 1d 1b 1a
B9_06fe:		nop				; ea 
B9_06ff:	.db $2b
B9_0700:		lda $1d1f		; ad 1f 1d
B9_0703:	.db $1b
B9_0704:	.db $1a
B9_0705:		nop				; ea 
B9_0706:	.db $52
B9_0707:		lda $2222		; ad 22 22
B9_070a:		nop				; ea 
B9_070b:	.db $5a
B9_070c:		lda $2222		; ad 22 22
B9_070f:	.db $22
B9_0710:	.db $22
B9_0711:		nop				; ea 
B9_0712:	.db $62
B9_0713:		lda $2222		; ad 22 22
B9_0716:	.db $22
B9_0717:	.db $22
B9_0718:	.db $22
B9_0719:		nop				; ea 
B9_071a:		ror a			; 6a
B9_071b:		lda $2222		; ad 22 22
B9_071e:	.db $22
B9_071f:	.db $22
B9_0720:	.db $22
B9_0721:	.db $f7
B9_0722:		nop				; ea 
B9_0723:		;removed
	.db $70 $ad

B9_0725:	.db $e7
B9_0726:		clc				; 18 
B9_0727:	.db $f4
B9_0728:		txa				; 8a 
B9_0729:		sbc $10, x		; f5 10
B9_072b:		bit $68			; 24 68
B9_072d:		sbc $04, x		; f5 04
B9_072f:	.db $1f
B9_0730:		php				; 08 
B9_0731:		bit $08			; 24 08
B9_0733:	.db $1f
B9_0734:		php				; 08 
B9_0735:		sbc $08, x		; f5 08
B9_0737:	.db $22
B9_0738:		clc				; 18 
B9_0739:		and ($18, x)	; 21 18
B9_073b:	.db $ef
B9_073c:	.db $1f
B9_073d:		jsr $97eb		; 20 eb 97
B9_0740:	.db $fa
B9_0741:		sbc $3005		; ed05 30
B9_0744:	.db $eb
B9_0745:		php				; 08 
B9_0746:		nop				; ea 
B9_0747:		sta ($ad, x)	; 81 ad
B9_0749:	.db $e7
B9_074a:		bmi B9_074a ; 30 fe

B9_074c:		txa				; 8a 
B9_074d:		sbc $03, x		; f5 03
B9_074f:		inc $08, x		; f6 08
B9_0751:		asl $241f, x	; 1e 1f 24
B9_0754:		inc $5104, x	; fe 04 51
B9_0757:	.db $a7
B9_0758:	.db $f7
B9_0759:	.db $1f
B9_075a:	.db $07
B9_075b:	.db $ef
B9_075c:	.db $fa
B9_075d:		nop				; ea 
B9_075e:		sta $ad, x		; 95 ad
B9_0760:		asl $f502, x	; 1e 02 f5
B9_0763:		php				; 08 
B9_0764:		nop				; ea 
B9_0765:		txa				; 8a 
B9_0766:		lda $171d		; ad 1d 17
B9_0769:		nop				; ea 
B9_076a:		sta ($ad, x)	; 81 ad
B9_076c:	.db $1b
B9_076d:		clc				; 18 
B9_076e:		sbc $10, x		; f5 10
B9_0770:		clc				; 18 
B9_0771:		bvc B9_076d ; 50 fa

B9_0773:		sbc $0805		; ed05 08
B9_0776:		nop				; ea 
B9_0777:		bvs B9_0726 ; 70 ad

B9_0779:	.db $e7
B9_077a:		clc				; 18 
B9_077b:		inc $8a			; e6 8a
B9_077d:		sbc $06, x		; f5 06
B9_077f:		inc $08, x		; f6 08
B9_0781:		ora ($16), y	; 11 16
B9_0783:	.db $13
B9_0784:		clc				; 18 
B9_0785:	.db $f7
B9_0786:	.db $1a
B9_0787:		bpl B9_07a4 ; 10 1b

B9_0789:		bpl B9_07a6 ; 10 1b

B9_078b:		php				; 08 
B9_078c:	.db $1a
B9_078d:		bpl B9_07aa ; 10 1b

B9_078f:		;removed
	.db $10 $1d

B9_0791:		;removed
	.db $10 $1f

B9_0793:		clc				; 18 
B9_0794:	.db $1f
B9_0795:		clc				; 18 
B9_0796:	.db $1f
B9_0797:		sec				; 38 
B9_0798:		clc				; 18 
B9_0799:		php				; 08 
B9_079a:	.db $1b
B9_079b:		php				; 08 
B9_079c:	.db $1f
B9_079d:		php				; 08 
B9_079e:		asl $2430, x	; 1e 30 24
B9_07a1:		sec				; 38 
B9_07a2:		bit $08			; 24 08
B9_07a4:		rol $08			; 26 08
B9_07a6:		bit $08			; 24 08
B9_07a8:	.db $23
B9_07a9:		clc				; 18 
B9_07aa:	.db $1f
B9_07ab:		clc				; 18 
B9_07ac:	.db $1a
B9_07ad:		;removed
	.db $10 $1f

B9_07af:		bmi B9_07d0 ; 30 1f

B9_07b1:		bpl B9_07d1 ; 10 1e

B9_07b3:		;removed
	.db $30 $24

B9_07b5:		sec				; 38 
B9_07b6:		bit $08			; 24 08
B9_07b8:		rol $08			; 26 08
B9_07ba:		bit $08			; 24 08
B9_07bc:	.db $23
B9_07bd:		clc				; 18 
B9_07be:		bit $18			; 24 18
B9_07c0:		rol $10			; 26 10
B9_07c2:	.db $1f
B9_07c3:		;removed
	.db $10 $1d

B9_07c5:		;removed
	.db $10 $1b

B9_07c7:		php				; 08 
B9_07c8:	.db $fa
B9_07c9:	.db $1a
B9_07ca:		clc				; 18 
B9_07cb:		nop				; ea 
B9_07cc:	.db $9f
B9_07cd:		lda $f6ef		; ad ef f6
B9_07d0:		php				; 08 
B9_07d1:		clc				; 18 
B9_07d2:	.db $1b
B9_07d3:		ora $ea1f, x	; 1d 1f ea
B9_07d6:	.db $a7
B9_07d7:		lda $1b18		; ad 18 1b
B9_07da:		ora $ea1f, x	; 1d 1f ea
B9_07dd:		ldx $18ad		; ae ad 18
B9_07e0:	.db $1b
B9_07e1:		ora $ea1f, x	; 1d 1f ea
B9_07e4:	.db $b3
B9_07e5:		lda $1b18		; ad 18 1b
B9_07e8:		ora $ea1f, x	; 1d 1f ea
B9_07eb:	.db $9f
B9_07ec:		lda $1814		; ad 14 18
B9_07ef:	.db $1a
B9_07f0:	.db $1b
B9_07f1:		nop				; ea 
B9_07f2:	.db $a7
B9_07f3:		lda $1814		; ad 14 18
B9_07f6:	.db $1a
B9_07f7:	.db $1b
B9_07f8:		nop				; ea 
B9_07f9:		ldx $14ad		; ae ad 14
B9_07fc:		clc				; 18 
B9_07fd:	.db $1a
B9_07fe:	.db $1b
B9_07ff:		nop				; ea 
B9_0800:	.db $b3
B9_0801:		lda $1814		; ad 14 18
B9_0804:	.db $1a
B9_0805:	.db $1b
B9_0806:		nop				; ea 
B9_0807:	.db $9f
B9_0808:		lda $1a16		; ad 16 1a
B9_080b:	.db $1b
B9_080c:		ora $a7ea, x	; 1d ea a7
B9_080f:		lda $1a16		; ad 16 1a
B9_0812:	.db $1b
B9_0813:		ora $aeea, x	; 1d ea ae
B9_0816:		lda $1a16		; ad 16 1a
B9_0819:	.db $1b
B9_081a:		ora $b3ea, x	; 1d ea b3
B9_081d:		lda $1a16		; ad 16 1a
B9_0820:	.db $1b
B9_0821:		ora $9fea, x	; 1d ea 9f
B9_0824:		lda $1713		; ad 13 17
B9_0827:		clc				; 18 
B9_0828:	.db $1a
B9_0829:		nop				; ea 
B9_082a:	.db $a7
B9_082b:		lda $1713		; ad 13 17
B9_082e:		clc				; 18 
B9_082f:	.db $1a
B9_0830:		nop				; ea 
B9_0831:		ldx $13ad		; ae ad 13
B9_0834:	.db $17
B9_0835:		clc				; 18 
B9_0836:	.db $1a
B9_0837:	.db $fa
B9_0838:		nop				; ea 
B9_0839:	.db $b3
B9_083a:		lda $1713		; ad 13 17
B9_083d:		clc				; 18 
B9_083e:	.db $1a
B9_083f:		nop				; ea 
B9_0840:		clv				; b8 
B9_0841:		lda $30e7		; ad e7 30
B9_0844:		stx $8a, y		; 96 8a
B9_0846:		sbc $20, x		; f5 20
B9_0848:		inc $80, x		; f6 80
B9_084a:	.db $2b
B9_084b:		bit $ef2e		; 2c 2e ef
B9_084e:	.db $f7
B9_084f:	.db $2f
B9_0850:		lsr $96eb		; 4e eb 96
B9_0853:		sbc $3205		; ed05 32
B9_0856:	.db $eb
B9_0857:		php				; 08 
B9_0858:	.db $fc
B9_0859:		sta $eaa6, y	; 99 a6 ea
B9_085c:		sbc $e7ac, y	; f9 ac e7
B9_085f:		jsr $8a96		; 20 96 8a
B9_0862:		sbc $10, x		; f5 10
B9_0864:	.db $13
B9_0865:		rti				; 40 


B9_0866:	.db $13
B9_0867:		clc				; 18 
B9_0868:	.db $13
B9_0869:		clc				; 18 
B9_086a:	.db $13
B9_086b:		bpl B9_085c ; 10 ef

B9_086d:	.db $17
B9_086e:		;removed
	.db $10 $ed

B9_0870:		php				; 08 
B9_0871:		;removed
	.db $30 $ea

B9_0873:		ora $ad			; 05 ad
B9_0875:		sbc $08, x		; f5 08
B9_0877:	.db $17
B9_0878:		clc				; 18 
B9_0879:		nop				; ea 
B9_087a:		bpl B9_0829 ; 10 ad

B9_087c:	.db $17
B9_087d:		clc				; 18 
B9_087e:		nop				; ea 
B9_087f:	.db $1b
B9_0880:		lda $04f5		; ad f5 04
B9_0883:	.db $17
B9_0884:		bpl B9_0884 ; 10 fe

B9_0886:		ora ($5b, x)	; 01 5b
B9_0888:		tay				; a8 
B9_0889:		nop				; ea 
B9_088a:		bmi B9_0839 ; 30 ad

B9_088c:	.db $e7
B9_088d:		jsr $8ae6		; 20 e6 8a
B9_0890:		sbc $08, x		; f5 08
B9_0892:	.db $17
B9_0893:		rti				; 40 


B9_0894:		clc				; 18 
B9_0895:		rti				; 40 


B9_0896:	.db $17
B9_0897:		rti				; 40 


B9_0898:		clc				; 18 
B9_0899:		rti				; 40 


B9_089a:	.db $ef
B9_089b:	.db $17
B9_089c:		jsr $0ced		; 20 ed 0c
B9_089f:		rts				; 60 


B9_08a0:		nop				; ea 
B9_08a1:	.db $52
B9_08a2:		lda $08f6		; ad f6 08
B9_08a5:		ora $ea1d, x	; 1d 1d ea
B9_08a8:	.db $5a
B9_08a9:		lda $1d1d		; ad 1d 1d
B9_08ac:		ora $ea1d, x	; 1d 1d ea
B9_08af:	.db $62
B9_08b0:		lda $1d1d		; ad 1d 1d
B9_08b3:		ora $1d1d, x	; 1d 1d 1d
B9_08b6:		nop				; ea 
B9_08b7:		ror a			; 6a
B9_08b8:		lda $1d1d		; ad 1d 1d
B9_08bb:		ora $1d1d, x	; 1d 1d 1d
B9_08be:	.db $f7
B9_08bf:		nop				; ea 
B9_08c0:		adc $e6ad, y	; 79 ad e6
B9_08c3:		sbc ($14), y	; f1 14
B9_08c5:		sed				; f8 
B9_08c6:		sta ($fb, x)	; 81 fb
B9_08c8:		and #$a7		; 29 a7
B9_08ca:		sbc $2c0c		; ed0c 2c
B9_08cd:	.db $eb
B9_08ce:		php				; 08 
B9_08cf:		nop				; ea 
B9_08d0:		eor #$8b		; 49 8b
B9_08d2:	.db $fb
B9_08d3:		eor $eda7		; 4d a7 ed
B9_08d6:	.db $03
B9_08d7:	.db $04
B9_08d8:		nop				; ea 
B9_08d9:	.db $3a
B9_08da:	.db $8b
B9_08db:		asl $f502, x	; 1e 02 f5
B9_08de:		php				; 08 
B9_08df:		ora $fb17, x	; 1d 17 fb
B9_08e2:		jmp ($eda7)		; 6c a7 ed


B9_08e5:		ora $08			; 05 08
B9_08e7:		nop				; ea 
B9_08e8:		adc $fbad, y	; 79 ad fb
B9_08eb:		adc $1aa7, x	; 7d a7 1a
B9_08ee:	.db $14
B9_08ef:		cpx $ef75		; ec 75 ef
B9_08f2:		inc $08, x		; f6 08
B9_08f4:		clc				; 18 
B9_08f5:	.db $1b
B9_08f6:		ora $fa1f, x	; 1d 1f fa
B9_08f9:		cpx $fb74		; ec 74 fb
B9_08fc:	.db $f4
B9_08fd:		tay				; a8 
B9_08fe:		cpx $fb73		; ec 73 fb
B9_0901:	.db $f4
B9_0902:		tay				; a8 
B9_0903:		cpx $fb72		; ec 72 fb
B9_0906:	.db $f4
B9_0907:		tay				; a8 
B9_0908:		cpx $1475		; ec 75 14
B9_090b:		clc				; 18 
B9_090c:	.db $1a
B9_090d:	.db $1b
B9_090e:	.db $fa
B9_090f:		cpx $fb74		; ec 74 fb
B9_0912:		asl a			; 0a
B9_0913:		lda #$ec		; a9 ec
B9_0915:	.db $73
B9_0916:	.db $fb
B9_0917:		asl a			; 0a
B9_0918:		lda #$ec		; a9 ec
B9_091a:	.db $72
B9_091b:	.db $fb
B9_091c:		asl a			; 0a
B9_091d:		lda #$ec		; a9 ec
B9_091f:		adc $16, x		; 75 16
B9_0921:	.db $1a
B9_0922:	.db $1b
B9_0923:		ora $ecfa, x	; 1d fa ec
B9_0926:	.db $74
B9_0927:	.db $fb
B9_0928:		jsr $eca9		; 20 a9 ec
B9_092b:	.db $73
B9_092c:	.db $fb
B9_092d:		jsr $eca9		; 20 a9 ec
B9_0930:	.db $72
B9_0931:	.db $fb
B9_0932:		jsr $eca9		; 20 a9 ec
B9_0935:		adc $13, x		; 75 13
B9_0937:	.db $17
B9_0938:		clc				; 18 
B9_0939:	.db $1a
B9_093a:	.db $fa
B9_093b:		cpx $fb74		; ec 74 fb
B9_093e:		rol $a9, x		; 36 a9
B9_0940:		cpx $fb73		; ec 73 fb
B9_0943:		rol $a9, x		; 36 a9
B9_0945:		cpx $1372		; ec 72 13
B9_0948:	.db $17
B9_0949:	.db $fb
B9_094a:	.db $cb
B9_094b:	.db $a7
B9_094c:		nop				; ea 
B9_094d:	.db $da
B9_094e:		lda $f8f7		; ad f7 f8
B9_0951:	.db $83
B9_0952:	.db $eb
B9_0953:		stx $2f, y		; 96 2f
B9_0955:		jsr $80f8		; 20 f8 80
B9_0958:	.db $eb
B9_0959:		php				; 08 
B9_095a:	.db $fc
B9_095b:	.db $5b
B9_095c:		tay				; a8 
B9_095d:		cpx $ebff		; ec ff eb
B9_0960:	.db $0b
B9_0961:		asl $f104, x	; 1e 04 f1
B9_0964:	.db $14
B9_0965:		asl $f104, x	; 1e 04 f1
B9_0968:	.db $04
B9_0969:	.db $23
B9_096a:		bpl B9_098a ; 10 1e

B9_096c:	.db $04
B9_096d:		sbc ($0c), y	; f1 0c
B9_096f:	.db $fa
B9_0970:		asl $f104, x	; 1e 04 f1
B9_0973:	.db $14
B9_0974:		asl $f104, x	; 1e 04 f1
B9_0977:	.db $04
B9_0978:	.db $23
B9_0979:		php				; 08 
B9_097a:		asl $f104, x	; 1e 04 f1
B9_097d:	.db $04
B9_097e:		asl $f104, x	; 1e 04 f1
B9_0981:	.db $0c
B9_0982:	.db $fa
B9_0983:	.db $fb
B9_0984:		adc ($a9, x)	; 61 a9
B9_0986:		asl $f104, x	; 1e 04 f1
B9_0989:	.db $0c
B9_098a:	.db $23
B9_098b:		php				; 08 
B9_098c:		asl $f104, x	; 1e 04 f1
B9_098f:	.db $04
B9_0990:		asl $f104, x	; 1e 04 f1
B9_0993:	.db $04
B9_0994:	.db $23
B9_0995:		php				; 08 
B9_0996:	.db $1f
B9_0997:		php				; 08 
B9_0998:		asl $f104, x	; 1e 04 f1
B9_099b:	.db $04
B9_099c:		inc $6102, x	; fe 02 61
B9_099f:		lda #$23		; a9 23
B9_09a1:		bpl B9_0994 ; 10 f1

B9_09a3:		bpl B9_09a3 ; 10 fe

B9_09a5:	.db $03
B9_09a6:		ldy #$a9		; a0 a9
B9_09a8:		asl $f104, x	; 1e 04 f1
B9_09ab:	.db $0c
B9_09ac:	.db $23
B9_09ad:		php				; 08 
B9_09ae:		asl $f104, x	; 1e 04 f1
B9_09b1:	.db $04
B9_09b2:		inc $04, x		; f6 04
B9_09b4:		rol $26			; 26 26
B9_09b6:		rol $26			; 26 26
B9_09b8:		inc $08, x		; f6 08
B9_09ba:		rol $26			; 26 26
B9_09bc:		inc $04, x		; f6 04
B9_09be:	.db $1f
B9_09bf:	.db $1f
B9_09c0:	.db $1f
B9_09c1:	.db $1f
B9_09c2:		inc $08, x		; f6 08
B9_09c4:	.db $1f
B9_09c5:	.db $1f
B9_09c6:		inc $04, x		; f6 04
B9_09c8:	.db $1a
B9_09c9:	.db $1a
B9_09ca:	.db $1a
B9_09cb:	.db $1a
B9_09cc:		inc $08, x		; f6 08
B9_09ce:	.db $1a
B9_09cf:	.db $1a
B9_09d0:	.db $f7
B9_09d1:	.db $fb
B9_09d2:		adc ($a9, x)	; 61 a9
B9_09d4:	.db $fb
B9_09d5:		;removed
	.db $70 $a9

B9_09d7:		inc $d102, x	; fe 02 d1
B9_09da:		lda #$fb		; a9 fb
B9_09dc:		adc ($a9, x)	; 61 a9
B9_09de:		asl $f104, x	; 1e 04 f1
B9_09e1:	.db $14
B9_09e2:		asl $f104, x	; 1e 04 f1
B9_09e5:	.db $04
B9_09e6:	.db $23
B9_09e7:		php				; 08 
B9_09e8:	.db $23
B9_09e9:		php				; 08 
B9_09ea:		asl $f104, x	; 1e 04 f1
B9_09ed:	.db $0c
B9_09ee:	.db $fa
B9_09ef:	.db $fb
B9_09f0:		adc ($a9, x)	; 61 a9
B9_09f2:	.db $fb
B9_09f3:		;removed
	.db $70 $a9

B9_09f5:		inc $ef04, x	; fe 04 ef
B9_09f8:		lda #$fb		; a9 fb
B9_09fa:		adc ($a9, x)	; 61 a9
B9_09fc:		asl $f104, x	; 1e 04 f1
B9_09ff:	.db $04
B9_0a00:		inc $08, x		; f6 08
B9_0a02:	.db $23
B9_0a03:	.db $23
B9_0a04:	.db $23
B9_0a05:	.db $1f
B9_0a06:	.db $1f
B9_0a07:	.db $fa
B9_0a08:	.db $1a
B9_0a09:	.db $1a
B9_0a0a:	.db $f7
B9_0a0b:	.db $fb
B9_0a0c:		;removed
	.db $70 $a9

B9_0a0e:	.db $fb
B9_0a0f:		dec $fea9, x	; de a9 fe
B9_0a12:	.db $02
B9_0a13:	.db $0b
B9_0a14:		tax				; aa 
B9_0a15:	.db $fb
B9_0a16:		bvs B9_09c1 ; 70 a9

B9_0a18:	.db $fb
B9_0a19:	.db $fc
B9_0a1a:		lda #$f7		; a9 f7
B9_0a1c:	.db $1a
B9_0a1d:		bpl B9_0a1a ; 10 fb

B9_0a1f:		bvs B9_09ca ; 70 a9

B9_0a21:	.db $fb
B9_0a22:		dec $fea9, x	; de a9 fe
B9_0a25:	.db $02
B9_0a26:		asl $fbaa, x	; 1e aa fb
B9_0a29:		bvs B9_09d4 ; 70 a9

B9_0a2b:		inc $04, x		; f6 04
B9_0a2d:		asl $2323, x	; 1e 23 23
B9_0a30:	.db $23
B9_0a31:		inc $08, x		; f6 08
B9_0a33:	.db $23
B9_0a34:	.db $23
B9_0a35:	.db $1f
B9_0a36:	.db $1f
B9_0a37:	.db $1a
B9_0a38:	.db $1a
B9_0a39:	.db $f7
B9_0a3a:	.db $fc
B9_0a3b:		adc ($a9, x)	; 61 a9
B9_0a3d:		cpx $0300		; ec 00 03
B9_0a40:		ora ($00, x)	; 01 00
B9_0a42:	.db $07
B9_0a43:		ora ($08, x)	; 01 08
B9_0a45:		ora ($08, x)	; 01 08
B9_0a47:	.db $03
B9_0a48:		ora ($00, x)	; 01 00
B9_0a4a:	.db $07
B9_0a4b:	.db $fa
B9_0a4c:		cpx $0501		; ec 01 05
B9_0a4f:		ora ($02, x)	; 01 02
B9_0a51:	.db $07
B9_0a52:		cpx $0100		; ec 00 01
B9_0a55:		php				; 08 
B9_0a56:		ora ($08, x)	; 01 08
B9_0a58:	.db $03
B9_0a59:		ora ($00, x)	; 01 00
B9_0a5b:	.db $07
B9_0a5c:	.db $fa
B9_0a5d:	.db $fb
B9_0a5e:		and $ecaa, x	; 3d aa ec
B9_0a61:		ora ($05, x)	; 01 05
B9_0a63:		ora ($02, x)	; 01 02
B9_0a65:	.db $07
B9_0a66:		cpx $0300		; ec 00 03
B9_0a69:		ora ($00, x)	; 01 00
B9_0a6b:	.db $07
B9_0a6c:	.db $03
B9_0a6d:		ora ($00, x)	; 01 00
B9_0a6f:	.db $07
B9_0a70:		ora ($08, x)	; 01 08
B9_0a72:	.db $fa
B9_0a73:	.db $fb
B9_0a74:		and $fbaa, x	; 3d aa fb
B9_0a77:		jmp $03aa		; 4c aa 03


B9_0a7a:		ora ($00, x)	; 01 00
B9_0a7c:	.db $07
B9_0a7d:		ora ($08, x)	; 01 08
B9_0a7f:		cpx $0501		; ec 01 05
B9_0a82:		ora ($02, x)	; 01 02
B9_0a84:	.db $07
B9_0a85:		cpx $0300		; ec 00 03
B9_0a88:		ora ($00, x)	; 01 00
B9_0a8a:	.db $07
B9_0a8b:	.db $03
B9_0a8c:		ora ($00, x)	; 01 00
B9_0a8e:	.db $07
B9_0a8f:		cpx $0501		; ec 01 05
B9_0a92:		ora ($02, x)	; 01 02
B9_0a94:	.db $07
B9_0a95:		cpx wEntityStructs.tileX.w		; ec 00 04
B9_0a98:		ora ($01, x)	; 01 01
B9_0a9a:	.db $07
B9_0a9b:	.db $03
B9_0a9c:		ora ($00, x)	; 01 00
B9_0a9e:	.db $07
B9_0a9f:		inc $3d02, x	; fe 02 3d
B9_0aa2:		tax				; aa 
B9_0aa3:		cpx $0503		; ec 03 05
B9_0aa6:		ora ($03, x)	; 01 03
B9_0aa8:	.db $1f
B9_0aa9:		inc $a503, x	; fe 03 a5
B9_0aac:		tax				; aa 
B9_0aad:		cpx $0502		; ec 02 05
B9_0ab0:		ora ($03, x)	; 01 03
B9_0ab2:	.db $0f
B9_0ab3:		cpx $0501		; ec 01 05
B9_0ab6:		ora ($02, x)	; 01 02
B9_0ab8:	.db $07
B9_0ab9:		cpx $0300		; ec 00 03
B9_0abc:		ora ($00, x)	; 01 00
B9_0abe:	.db $07
B9_0abf:	.db $04
B9_0ac0:		ora ($01, x)	; 01 01
B9_0ac2:	.db $03
B9_0ac3:		inc $bf03, x	; fe 03 bf
B9_0ac6:		tax				; aa 
B9_0ac7:	.db $04
B9_0ac8:		ora ($01, x)	; 01 01
B9_0aca:	.db $07
B9_0acb:	.db $04
B9_0acc:		ora ($01, x)	; 01 01
B9_0ace:	.db $07
B9_0acf:		sbc $bf02, x	; fd 02 bf
B9_0ad2:		tax				; aa 
B9_0ad3:	.db $fb
B9_0ad4:		and $fbaa, x	; 3d aa fb
B9_0ad7:		jmp $fbaa		; 4c aa fb


B9_0ada:		and $fbaa, x	; 3d aa fb
B9_0add:		rts				; 60 


B9_0ade:		tax				; aa 
B9_0adf:		sbc $d302, x	; fd 02 d3
B9_0ae2:		tax				; aa 
B9_0ae3:	.db $fb
B9_0ae4:		and $fbaa, x	; 3d aa fb
B9_0ae7:		jmp $fbaa		; 4c aa fb


B9_0aea:		and $ecaa, x	; 3d aa ec
B9_0aed:		ora ($05, x)	; 01 05
B9_0aef:		ora ($02, x)	; 01 02
B9_0af1:	.db $07
B9_0af2:		ora $01			; 05 01
B9_0af4:	.db $02
B9_0af5:	.db $07
B9_0af6:		cpx $0300		; ec 00 03
B9_0af9:		ora ($00, x)	; 01 00
B9_0afb:	.db $07
B9_0afc:		ora ($08, x)	; 01 08
B9_0afe:	.db $fa
B9_0aff:	.db $fb
B9_0b00:		and $fbaa, x	; 3d aa fb
B9_0b03:		jmp $fbaa		; 4c aa fb


B9_0b06:		and $fbaa, x	; 3d aa fb
B9_0b09:		rts				; 60 


B9_0b0a:		tax				; aa 
B9_0b0b:		sbc $ff04, x	; fd 04 ff
B9_0b0e:		tax				; aa 
B9_0b0f:	.db $fb
B9_0b10:		and $fbaa, x	; 3d aa fb
B9_0b13:		jmp $ecaa		; 4c aa ec


B9_0b16:	.db $02
B9_0b17:		ora $01			; 05 01
B9_0b19:	.db $03
B9_0b1a:	.db $07
B9_0b1b:		cpx $0501		; ec 01 05
B9_0b1e:		ora ($02, x)	; 01 02
B9_0b20:	.db $07
B9_0b21:		inc $1d02, x	; fe 02 1d
B9_0b24:	.db $ab
B9_0b25:		cpx wEntityStructs.tileX.w		; ec 00 04
B9_0b28:		ora ($01, x)	; 01 01
B9_0b2a:	.db $07
B9_0b2b:		inc $2703, x	; fe 03 27
B9_0b2e:	.db $ab
B9_0b2f:	.db $fb
B9_0b30:		and $fbaa, x	; 3d aa fb
B9_0b33:		rts				; 60 


B9_0b34:		tax				; aa 
B9_0b35:	.db $fb
B9_0b36:		and $fbaa, x	; 3d aa fb
B9_0b39:		cpx $fdaa		; ec aa fd
B9_0b3c:	.db $02
B9_0b3d:	.db $2f
B9_0b3e:	.db $ab
B9_0b3f:	.db $fb
B9_0b40:		and $fbaa, x	; 3d aa fb
B9_0b43:		rts				; 60 


B9_0b44:		tax				; aa 
B9_0b45:	.db $03
B9_0b46:		ora ($00, x)	; 01 00
B9_0b48:	.db $07
B9_0b49:		cpx $0501		; ec 01 05
B9_0b4c:		ora ($02, x)	; 01 02
B9_0b4e:	.db $07
B9_0b4f:		inc $4b02, x	; fe 02 4b
B9_0b52:	.db $ab
B9_0b53:		cpx wEntityStructs.tileX.w		; ec 00 04
B9_0b56:		ora ($01, x)	; 01 01
B9_0b58:	.db $07
B9_0b59:	.db $04
B9_0b5a:		ora ($01, x)	; 01 01
B9_0b5c:	.db $07
B9_0b5d:	.db $04
B9_0b5e:		ora ($01, x)	; 01 01
B9_0b60:	.db $0f
B9_0b61:	.db $fb
B9_0b62:		and $fbaa, x	; 3d aa fb
B9_0b65:		rts				; 60 


B9_0b66:		tax				; aa 
B9_0b67:	.db $fb
B9_0b68:		and $fbaa, x	; 3d aa fb
B9_0b6b:		cpx $fdaa		; ec aa fd
B9_0b6e:	.db $02
B9_0b6f:		adc ($ab, x)	; 61 ab
B9_0b71:	.db $fb
B9_0b72:		and $fbaa, x	; 3d aa fb
B9_0b75:		rts				; 60 


B9_0b76:		tax				; aa 
B9_0b77:		cpx $0501		; ec 01 05
B9_0b7a:		ora ($03, x)	; 01 03
B9_0b7c:	.db $03
B9_0b7d:		ora $01			; 05 01
B9_0b7f:	.db $02
B9_0b80:	.db $03
B9_0b81:		inc $7d02, x	; fe 02 7d
B9_0b84:	.db $ab
B9_0b85:		ora $01			; 05 01
B9_0b87:	.db $02
B9_0b88:	.db $07
B9_0b89:		ora $01			; 05 01
B9_0b8b:	.db $02
B9_0b8c:	.db $07
B9_0b8d:		cpx wEntityStructs.tileX.w		; ec 00 04
B9_0b90:		ora ($01, x)	; 01 01
B9_0b92:	.db $07
B9_0b93:		inc $8f03, x	; fe 03 8f
B9_0b96:	.db $ab
B9_0b97:	.db $fc
B9_0b98:		and $f3aa, x	; 3d aa f3
B9_0b9b:	.db $f2
B9_0b9c:	.db $89
B9_0b9d:	.db $0c
B9_0b9e:		clc				; 18 
B9_0b9f:	.db $0c
B9_0ba0:		php				; 08 
B9_0ba1:	.db $0f
B9_0ba2:		php				; 08 
B9_0ba3:	.db $0c
B9_0ba4:		php				; 08 
B9_0ba5:	.db $0c
B9_0ba6:		bpl B9_0ba6 ; 10 fe

B9_0ba8:		ora ($9d, x)	; 01 9d
B9_0baa:	.db $ab
B9_0bab:		ora $0d18		; 0d 18 0d
B9_0bae:		php				; 08 
B9_0baf:		ora ($08), y	; 11 08
B9_0bb1:		ora $0d08		; 0d 08 0d
B9_0bb4:		;removed
	.db $10 $0d

B9_0bb6:		bpl B9_0bcc ; 10 14

B9_0bb8:		php				; 08 
B9_0bb9:		ora $0d08		; 0d 08 0d
B9_0bbc:		php				; 08 
B9_0bbd:		ora $0d10		; 0d 10 0d
B9_0bc0:		php				; 08 
B9_0bc1:		sbc $9d01, x	; fd 01 9d
B9_0bc4:	.db $ab
B9_0bc5:	.db $07
B9_0bc6:		clc				; 18 
B9_0bc7:	.db $07
B9_0bc8:		php				; 08 
B9_0bc9:	.db $13
B9_0bca:		php				; 08 
B9_0bcb:	.db $07
B9_0bcc:		php				; 08 
B9_0bcd:	.db $07
B9_0bce:		bpl B9_0bd8 ; 10 08

B9_0bd0:		clc				; 18 
B9_0bd1:		php				; 08 
B9_0bd2:		php				; 08 
B9_0bd3:	.db $14
B9_0bd4:		php				; 08 
B9_0bd5:		php				; 08 
B9_0bd6:		php				; 08 
B9_0bd7:		php				; 08 
B9_0bd8:		bpl B9_0bd8 ; 10 fe

B9_0bda:		ora ($c5, x)	; 01 c5
B9_0bdc:	.db $ab
B9_0bdd:		jsr $0701		; 20 01 07
B9_0be0:	.db $07
B9_0be1:		inc $08, x		; f6 08
B9_0be3:		sbc ($11), y	; f1 11
B9_0be5:	.db $13
B9_0be6:		jsr $07f7		; 20 f7 07
B9_0be9:		;removed
	.db $10 $07

B9_0beb:		php				; 08 
B9_0bec:		jsr $0708		; 20 08 07
B9_0bef:		php				; 08 
B9_0bf0:		asl $0708		; 0e 08 07
B9_0bf3:		php				; 08 
B9_0bf4:		jsr $1101		; 20 01 11
B9_0bf7:	.db $07
B9_0bf8:	.db $07
B9_0bf9:		php				; 08 
B9_0bfa:	.db $13
B9_0bfb:		bpl B9_0bf3 ; 10 f6

B9_0bfd:		php				; 08 
B9_0bfe:		jsr $1105		; 20 05 11
B9_0c01:	.db $13
B9_0c02:		clc				; 18 
B9_0c03:	.db $1a
B9_0c04:		ora ($13), y	; 11 13
B9_0c06:	.db $f7
B9_0c07:	.db $07
B9_0c08:		bpl B9_0c20 ; 10 16

B9_0c0a:		php				; 08 
B9_0c0b:	.db $07
B9_0c0c:		php				; 08 
B9_0c0d:	.db $0c
B9_0c0e:		php				; 08 
B9_0c0f:	.db $07
B9_0c10:		php				; 08 
B9_0c11:		asl $0c10		; 0e 10 0c
B9_0c14:		bpl B9_0c25 ; 10 0f

B9_0c16:		php				; 08 
B9_0c17:	.db $0c
B9_0c18:		php				; 08 
B9_0c19:		ora ($10), y	; 11 10
B9_0c1b:	.db $0f
B9_0c1c:		php				; 08 
B9_0c1d:	.db $0c
B9_0c1e:		bpl B9_0c2c ; 10 0c

B9_0c20:		php				; 08 
B9_0c21:	.db $fa
B9_0c22:	.db $0f
B9_0c23:		php				; 08 
B9_0c24:	.db $0c
B9_0c25:		php				; 08 
B9_0c26:		ora ($10), y	; 11 10
B9_0c28:	.db $0f
B9_0c29:		bpl B9_0c25 ; 10 fa

B9_0c2b:	.db $fb
B9_0c2c:	.db $13
B9_0c2d:		ldy $080f		; ac 0f 08
B9_0c30:	.db $0c
B9_0c31:		php				; 08 
B9_0c32:		ora ($08), y	; 11 08
B9_0c34:	.db $0c
B9_0c35:		php				; 08 
B9_0c36:	.db $13
B9_0c37:		;removed
	.db $10 $fa

B9_0c39:	.db $fb
B9_0c3a:	.db $13
B9_0c3b:		ldy $22fb		; ac fb 22
B9_0c3e:		ldy $13fb		; ac fb 13
B9_0c41:		ldy $0811		; ac 11 08
B9_0c44:	.db $12
B9_0c45:		php				; 08 
B9_0c46:	.db $13
B9_0c47:		bpl B9_0c5f ; 10 16

B9_0c49:		bpl B9_0c46 ; 10 fb

B9_0c4b:	.db $13
B9_0c4c:		ldy $22fb		; ac fb 22
B9_0c4f:		ldy $13fb		; ac fb 13
B9_0c52:		ldy $2efb		; ac fb 2e
B9_0c55:		ldy $100e		; ac 0e 10
B9_0c58:		ora #$08		; 09 08
B9_0c5a:		asl $1208		; 0e 08 12
B9_0c5d:		bpl B9_0c6d ; 10 0e

B9_0c5f:		php				; 08 
B9_0c60:		asl $0e10		; 0e 10 0e
B9_0c63:		php				; 08 
B9_0c64:		ora #$08		; 09 08
B9_0c66:		asl $1508		; 0e 08 15
B9_0c69:		;removed
	.db $10 $0e

B9_0c6b:		;removed
	.db $10 $fa

B9_0c6d:	.db $07
B9_0c6e:		bpl B9_0c7b ; 10 0b

B9_0c70:		php				; 08 
B9_0c71:	.db $07
B9_0c72:		php				; 08 
B9_0c73:		asl $0710		; 0e 10 07
B9_0c76:		php				; 08 
B9_0c77:	.db $07
B9_0c78:		bpl B9_0c81 ; 10 07

B9_0c7a:		php				; 08 
B9_0c7b:		asl $0708		; 0e 08 07
B9_0c7e:		php				; 08 
B9_0c7f:		ora ($08), y	; 11 08
B9_0c81:	.db $13
B9_0c82:		php				; 08 
B9_0c83:	.db $07
B9_0c84:		bpl B9_0c81 ; 10 fb

B9_0c86:		lsr $ac, x		; 56 ac
B9_0c88:	.db $07
B9_0c89:		;removed
	.db $10 $0e

B9_0c8b:		php				; 08 
B9_0c8c:	.db $07
B9_0c8d:		php				; 08 
B9_0c8e:		ora ($08), y	; 11 08
B9_0c90:	.db $13
B9_0c91:		php				; 08 
B9_0c92:		asl $0708		; 0e 08 07
B9_0c95:		bpl B9_0c9e ; 10 07

B9_0c97:		php				; 08 
B9_0c98:		ora ($08), y	; 11 08
B9_0c9a:	.db $07
B9_0c9b:		php				; 08 
B9_0c9c:	.db $0f
B9_0c9d:		php				; 08 
B9_0c9e:		asl $0710		; 0e 10 07
B9_0ca1:		php				; 08 
B9_0ca2:	.db $0c
B9_0ca3:		clc				; 18 
B9_0ca4:	.db $0c
B9_0ca5:		php				; 08 
B9_0ca6:	.db $0f
B9_0ca7:		php				; 08 
B9_0ca8:	.db $0c
B9_0ca9:		php				; 08 
B9_0caa:	.db $0c
B9_0cab:		clc				; 18 
B9_0cac:	.db $0c
B9_0cad:		php				; 08 
B9_0cae:	.db $07
B9_0caf:		php				; 08 
B9_0cb0:		asl a			; 0a
B9_0cb1:		php				; 08 
B9_0cb2:	.db $0c
B9_0cb3:		php				; 08 
B9_0cb4:	.db $0f
B9_0cb5:		php				; 08 
B9_0cb6:		ora ($10), y	; 11 10
B9_0cb8:		php				; 08 
B9_0cb9:		clc				; 18 
B9_0cba:		php				; 08 
B9_0cbb:		php				; 08 
B9_0cbc:	.db $0f
B9_0cbd:		php				; 08 
B9_0cbe:		php				; 08 
B9_0cbf:		php				; 08 
B9_0cc0:		php				; 08 
B9_0cc1:		clc				; 18 
B9_0cc2:		inc $08, x		; f6 08
B9_0cc4:		php				; 08 
B9_0cc5:	.db $0f
B9_0cc6:		php				; 08 
B9_0cc7:	.db $14
B9_0cc8:	.db $0f
B9_0cc9:	.db $f7
B9_0cca:		php				; 08 
B9_0ccb:		bpl B9_0cd7 ; 10 0a

B9_0ccd:		clc				; 18 
B9_0cce:		asl a			; 0a
B9_0ccf:		php				; 08 
B9_0cd0:		asl $0a08		; 0e 08 0a
B9_0cd3:		php				; 08 
B9_0cd4:		inc $cc01, x	; fe 01 cc
B9_0cd7:		ldy $0814		; ac 14 08
B9_0cda:		asl $08, x		; 16 08
B9_0cdc:		asl a			; 0a
B9_0cdd:		bpl B9_0ce6 ; 10 07

B9_0cdf:		clc				; 18 
B9_0ce0:	.db $07
B9_0ce1:		php				; 08 
B9_0ce2:		asl $0708		; 0e 08 07
B9_0ce5:		php				; 08 
B9_0ce6:	.db $07
B9_0ce7:		clc				; 18 
B9_0ce8:		inc $08, x		; f6 08
B9_0cea:	.db $07
B9_0ceb:		ora ($13), y	; 11 13
B9_0ced:	.db $0f
B9_0cee:		ora ($0e), y	; 11 0e
B9_0cf0:	.db $0f
B9_0cf1:	.db $f7
B9_0cf2:		sbc $a201, x	; fd 01 a2
B9_0cf5:		ldy $9dfc		; ac fc 9d
B9_0cf8:	.db $ab
B9_0cf9:	.db $07
B9_0cfa:		ror $79, x		; 76 79
B9_0cfc:	.db $79 $78 $00
B9_0cff:	.db $80
B9_0d00:		adc ($74), y	; 71 74
B9_0d02:		ror $00, x		; 76 00
B9_0d04:	.db $80
B9_0d05:	.db $07
B9_0d06:	.db $7b
B9_0d07:		ror $75, x		; 76 75
B9_0d09:	.db $74
B9_0d0a:		.db $00				; 00
B9_0d0b:	.db $80
B9_0d0c:		adc ($73), y	; 71 73
B9_0d0e:		.db $00				; 00
B9_0d0f:	.db $80
B9_0d10:	.db $07
B9_0d11:		adc $7778, x	; 7d 78 77
B9_0d14:		ror $00, x		; 76 00
B9_0d16:	.db $80
B9_0d17:		adc ($75), y	; 71 75
B9_0d19:		.db $00				; 00
B9_0d1a:	.db $80
B9_0d1b:	.db $07
B9_0d1c:	.db $7f
B9_0d1d:	.db $7c
B9_0d1e:	.db $7b
B9_0d1f:	.db $7a
B9_0d20:		.db $00				; 00
B9_0d21:	.db $80
B9_0d22:		adc ($76), y	; 71 76
B9_0d24:		.db $00				; 00
B9_0d25:	.db $80
B9_0d26:		.db $00				; 00
B9_0d27:	.db $77
B9_0d28:	.db $74
B9_0d29:		.db $00				; 00
B9_0d2a:	.db $80
B9_0d2b:		.db $00				; 00
B9_0d2c:	.db $74
B9_0d2d:	.db $72
B9_0d2e:		.db $00				; 00
B9_0d2f:	.db $80
B9_0d30:	.db $13
B9_0d31:	.db $74
B9_0d32:	.db $74
B9_0d33:	.db $74
B9_0d34:		adc $75, x		; 75 75
B9_0d36:		adc $76, x		; 75 76
B9_0d38:		ror $76, x		; 76 76
B9_0d3a:	.db $77
B9_0d3b:	.db $77
B9_0d3c:	.db $77
B9_0d3d:		sei				; 78 
B9_0d3e:		sei				; 78 
B9_0d3f:		sei				; 78 
B9_0d40:		adc $8000, y	; 79 00 80
B9_0d43:		adc ($75), y	; 71 75
B9_0d45:		.db $00				; 00
B9_0d46:	.db $80
B9_0d47:		asl $7c			; 06 7c
B9_0d49:	.db $7a
B9_0d4a:	.db $7a
B9_0d4b:		.db $00				; 00
B9_0d4c:	.db $80
B9_0d4d:		adc ($74), y	; 71 74
B9_0d4f:		ror $00, x		; 76 00
B9_0d51:	.db $80
B9_0d52:		.db $00				; 00
B9_0d53:	.db $3f
B9_0d54:		rol $313e, x	; 3e 3e 31
B9_0d57:		rol $00, x		; 36 00
B9_0d59:	.db $80
B9_0d5a:		.db $00				; 00
B9_0d5b:	.db $3c
B9_0d5c:		sec				; 38 
B9_0d5d:		sec				; 38 
B9_0d5e:		and ($34), y	; 31 34
B9_0d60:		.db $00				; 00
B9_0d61:	.db $80
B9_0d62:		.db $00				; 00
B9_0d63:		sec				; 38 
B9_0d64:		and $35, x		; 35 35
B9_0d66:		and ($33), y	; 31 33
B9_0d68:		.db $00				; 00
B9_0d69:	.db $80
B9_0d6a:		.db $00				; 00
B9_0d6b:	.db $34
B9_0d6c:	.db $33
B9_0d6d:	.db $32
B9_0d6e:		.db $00				; 00
B9_0d6f:	.db $80
B9_0d70:		ora $b8			; 05 b8
B9_0d72:		tsx				; ba 
B9_0d73:		.db $00				; 00
B9_0d74:	.db $80
B9_0d75:		lda ($b5), y	; b1 b5
B9_0d77:		.db $00				; 00
B9_0d78:	.db $80
B9_0d79:		ora $b4			; 05 b4
B9_0d7b:		lda $00, x		; b5 00
B9_0d7d:	.db $80
B9_0d7e:	.db $b3
B9_0d7f:		.db $00				; 00
B9_0d80:	.db $80
B9_0d81:		ora $3d			; 05 3d
B9_0d83:		sec				; 38 
B9_0d84:		.db $00				; 00
B9_0d85:	.db $80
B9_0d86:		and ($34), y	; 31 34
B9_0d88:		.db $00				; 00
B9_0d89:	.db $80
B9_0d8a:	.db $07
B9_0d8b:	.db $3f
B9_0d8c:	.db $3c
B9_0d8d:	.db $3b
B9_0d8e:	.db $3a
B9_0d8f:		.db $00				; 00
B9_0d90:	.db $80
B9_0d91:		and ($35), y	; 31 35
B9_0d93:		.db $00				; 00
B9_0d94:	.db $80
B9_0d95:		asl $38			; 06 38
B9_0d97:		rol $35, x		; 36 35
B9_0d99:		.db $00				; 00
B9_0d9a:	.db $80
B9_0d9b:		and ($33), y	; 31 33
B9_0d9d:		.db $00				; 00
B9_0d9e:	.db $80
B9_0d9f:		.db $00				; 00
B9_0da0:	.db $7f
B9_0da1:	.db $7b
B9_0da2:	.db $7a
B9_0da3:	.db $79 $78 $00
B9_0da6:	.db $80
B9_0da7:		.db $00				; 00
B9_0da8:	.db $7b
B9_0da9:		sei				; 78 
B9_0daa:	.db $77
B9_0dab:		ror $00, x		; 76 00
B9_0dad:	.db $80
B9_0dae:		.db $00				; 00
B9_0daf:	.db $77
B9_0db0:		adc $00, x		; 75 00
B9_0db2:	.db $80
B9_0db3:		.db $00				; 00
B9_0db4:		adc $74, x		; 75 74
B9_0db6:		.db $00				; 00
B9_0db7:	.db $80
B9_0db8:	.db $1c
B9_0db9:	.db $b3
B9_0dba:	.db $b3
B9_0dbb:	.db $b3
B9_0dbc:	.db $b3
B9_0dbd:	.db $b3
B9_0dbe:	.db $b3
B9_0dbf:		ldy $b4, x		; b4 b4
B9_0dc1:		ldy $b4, x		; b4 b4
B9_0dc3:		ldy $b4, x		; b4 b4
B9_0dc5:		lda $b5, x		; b5 b5
B9_0dc7:		lda $b5, x		; b5 b5
B9_0dc9:		lda $b5, x		; b5 b5
B9_0dcb:		ldx $b6, y		; b6 b6
B9_0dcd:		ldx $b6, y		; b6 b6
B9_0dcf:		ldx $b6, y		; b6 b6
B9_0dd1:	.db $b7
B9_0dd2:		.db $00				; 00
B9_0dd3:	.db $80
B9_0dd4:		lda ($b4), y	; b1 b4
B9_0dd6:		lda $b6, x		; b5 b6
B9_0dd8:		.db $00				; 00
B9_0dd9:		sty $b200		; 8c 00 b2
B9_0ddc:	.db $b2
B9_0ddd:	.db $b3
B9_0dde:	.db $b3
B9_0ddf:	.db $b3
B9_0de0:	.db $b3
B9_0de1:		.db $00				; 00
B9_0de2:	.db $87
B9_0de3:		.db $00				; 00
B9_0de4:		.db $00				; 00
B9_0de5:	.db $f7
B9_0de6:		lda $0101		; ad 01 01
B9_0de9:	.db $ef
B9_0dea:		ldx $0202		; ae 02 02
B9_0ded:		sbc ($af), y	; f1 af
B9_0def:	.db $03
B9_0df0:	.db $03
B9_0df1:		txs				; 9a 
B9_0df2:		;removed
	.db $b0 $08

B9_0df4:		pha				; 48 
B9_0df5:		lda ($ff), y	; b1 ff
B9_0df7:		nop				; ea 
B9_0df8:	.db $8f
B9_0df9:	.db $b2
B9_0dfa:	.db $e7
B9_0dfb:		asl $8a96		; 0e 96 8a
B9_0dfe:		sbc $03, x		; f5 03
B9_0e00:		asl $1f09, x	; 1e 09 1f
B9_0e03:		ora #$21		; 09 21
B9_0e05:		asl a			; 0a
B9_0e06:	.db $fa
B9_0e07:		sbc $0e, x		; f5 0e
B9_0e09:		rol $38			; 26 38
B9_0e0b:	.db $fb
B9_0e0c:		inc $f5ad, x	; fe ad f5
B9_0e0f:		asl $6226		; 0e 26 62
B9_0e12:		sbc $0e02		; ed02 0e
B9_0e15:	.db $fb
B9_0e16:		inc $f5ad, x	; fe ad f5
B9_0e19:		asl $3826		; 0e 26 38
B9_0e1c:		sbc $03, x		; f5 03
B9_0e1e:		rol $09			; 26 09
B9_0e20:		plp				; 28 
B9_0e21:		ora #$2a		; 09 2a
B9_0e23:		asl a			; 0a
B9_0e24:		sbc $0b, x		; f5 0b
B9_0e26:		inc $1c, x		; f6 1c
B9_0e28:	.db $e2
B9_0e29:		sec				; 38 
B9_0e2a:	.db $2b
B9_0e2b:		rol a			; 2a
B9_0e2c:		plp				; 28 
B9_0e2d:		and ($f7, x)	; 21 f7
B9_0e2f:		nop				; ea 
B9_0e30:	.db $af
B9_0e31:	.db $b2
B9_0e32:		sbc $0e, x		; f5 0e
B9_0e34:		rol $1c			; 26 1c
B9_0e36:		rol $1c			; 26 1c
B9_0e38:		rol $0e			; 26 0e
B9_0e3a:		rol $07			; 26 07
B9_0e3c:		inc $3a03, x	; fe 03 3a
B9_0e3f:		ldx $0ef2		; ae f2 0e
B9_0e42:	.db $fa
B9_0e43:		nop				; ea 
B9_0e44:		clv				; b8 
B9_0e45:	.db $b2
B9_0e46:		sbc $fbfe, y	; f9 fe fb
B9_0e49:	.db $32
B9_0e4a:		ldx $c1ea		; ae ea c1
B9_0e4d:	.db $b2
B9_0e4e:		sbc $fbfc, y	; f9 fc fb
B9_0e51:	.db $32
B9_0e52:		ldx $caea		; ae ea ca
B9_0e55:	.db $b2
B9_0e56:		sbc $fbfb, y	; f9 fb fb
B9_0e59:	.db $32
B9_0e5a:	.db $ae $f9 $00
B9_0e5d:		nop				; ea 
B9_0e5e:	.db $8f
B9_0e5f:	.db $b2
B9_0e60:		sbc $1c, x		; f5 1c
B9_0e62:	.db $e2
B9_0e63:	.db $1c
B9_0e64:	.db $1a
B9_0e65:		lsr $f5			; 46 f5
B9_0e67:	.db $04
B9_0e68:	.db $1a
B9_0e69:		asl $0e1c		; 0e 1c 0e
B9_0e6c:		asl $f50e, x	; 1e 0e f5
B9_0e6f:	.db $07
B9_0e70:	.db $1f
B9_0e71:	.db $1c
B9_0e72:		asl $1c0e, x	; 1e 0e 1c
B9_0e75:	.db $1c
B9_0e76:	.db $fa
B9_0e77:		sbc $0e, x		; f5 0e
B9_0e79:	.db $1a
B9_0e7a:		rol a			; 2a
B9_0e7b:		clc				; 18 
B9_0e7c:		rol a			; 2a
B9_0e7d:	.db $1f
B9_0e7e:	.db $1c
B9_0e7f:		clc				; 18 
B9_0e80:		rol a			; 2a
B9_0e81:		sbc $07, x		; f5 07
B9_0e83:		asl $1c, x		; 16 1c
B9_0e85:		clc				; 18 
B9_0e86:		asl $0ef5		; 0e f5 0e
B9_0e89:		ora $46, x		; 15 46
B9_0e8b:	.db $fb
B9_0e8c:		rts				; 60 


B9_0e8d:		ldx $07f5		; ae f5 07
B9_0e90:		asl $1f0e, x	; 1e 0e 1f
B9_0e93:	.db $1c
B9_0e94:	.db $e2
B9_0e95:		lsr $ef			; 46 ef
B9_0e97:		and ($70, x)	; 21 70
B9_0e99:		sbc $1c, x		; f5 1c
B9_0e9b:	.db $f2
B9_0e9c:		bvs B9_0e80 ; 70 e2

B9_0e9e:	.db $1c
B9_0e9f:		sbc $0e, x		; f5 0e
B9_0ea1:	.db $1f
B9_0ea2:		rol a			; 2a
B9_0ea3:		rol $2a			; 26 2a
B9_0ea5:	.db $1f
B9_0ea6:	.db $1c
B9_0ea7:		asl $1c2a, x	; 1e 2a 1c
B9_0eaa:		lsr $1e			; 46 1e
B9_0eac:		rol a			; 2a
B9_0ead:		and $2a			; 25 2a
B9_0eaf:		asl $f51c, x	; 1e 1c f5
B9_0eb2:	.db $07
B9_0eb3:	.db $1c
B9_0eb4:	.db $1c
B9_0eb5:	.db $1a
B9_0eb6:		asl $1c19		; 0e 19 1c
B9_0eb9:	.db $1a
B9_0eba:		rol a			; 2a
B9_0ebb:		sbc $0e, x		; f5 0e
B9_0ebd:	.db $1f
B9_0ebe:		rol a			; 2a
B9_0ebf:		sbc $07, x		; f5 07
B9_0ec1:	.db $17
B9_0ec2:	.db $1c
B9_0ec3:		sbc $04, x		; f5 04
B9_0ec5:	.db $17
B9_0ec6:		asl $0e1a		; 0e 1a 0e
B9_0ec9:	.db $1f
B9_0eca:		asl $0ef5		; 0e f5 0e
B9_0ecd:		asl $1c2a, x	; 1e 2a 1c
B9_0ed0:		rol a			; 2a
B9_0ed1:		asl $e21c, x	; 1e 1c e2
B9_0ed4:		rol a			; 2a
B9_0ed5:		sbc $1c, x		; f5 1c
B9_0ed7:	.db $1a
B9_0ed8:		;removed
	.db $70 $1c

B9_0eda:		bvs B9_0efb ; 70 1f

B9_0edc:		bvs B9_0f00 ; 70 22

B9_0ede:		ror $04f2, x	; 7e f2 04
B9_0ee1:	.db $e7
B9_0ee2:		lsr $08			; 46 08
B9_0ee4:	.db $8b
B9_0ee5:		inc $70, x		; f6 70
B9_0ee7:	.db $ef
B9_0ee8:		and ($f2, x)	; 21 f2
B9_0eea:		sbc $ed0a		; ed0a ed
B9_0eed:	.db $14
B9_0eee:		beq B9_0ee1 ; f0 f1

B9_0ef0:		php				; 08 
B9_0ef1:	.db $ef
B9_0ef2:		sed				; f8 
B9_0ef3:		sta ($e7, x)	; 81 e7
B9_0ef5:		asl $8a96		; 0e 96 8a
B9_0ef8:		nop				; ea 
B9_0ef9:		ldy #$b2		; a0 b2
B9_0efb:		asl $1f09, x	; 1e 09 1f
B9_0efe:		ora #$21		; 09 21
B9_0f00:	.db $02
B9_0f01:	.db $fa
B9_0f02:		nop				; ea 
B9_0f03:		ldy $b2			; a4 b2
B9_0f05:	.db $fb
B9_0f06:		inc $f5ad, x	; fe ad f5
B9_0f09:		asl $2426		; 0e 26 24
B9_0f0c:		nop				; ea 
B9_0f0d:		ldy #$b2		; a0 b2
B9_0f0f:	.db $fb
B9_0f10:		inc $26ad, x	; fe ad 26
B9_0f13:	.db $14
B9_0f14:		nop				; ea 
B9_0f15:		ldy $b2			; a4 b2
B9_0f17:	.db $fb
B9_0f18:		inc $f5ad, x	; fe ad f5
B9_0f1b:		asl $4026		; 0e 26 40
B9_0f1e:	.db $fb
B9_0f1f:		sed				; f8 
B9_0f20:		ldx $a4ea		; ae ea a4
B9_0f23:	.db $b2
B9_0f24:	.db $fb
B9_0f25:		inc $f5ad, x	; fe ad f5
B9_0f28:		asl $2426		; 0e 26 24
B9_0f2b:		nop				; ea 
B9_0f2c:		ldy #$b2		; a0 b2
B9_0f2e:		sbc $03, x		; f5 03
B9_0f30:		rol $09			; 26 09
B9_0f32:		plp				; 28 
B9_0f33:		ora #$2a		; 09 2a
B9_0f35:	.db $02
B9_0f36:		nop				; ea 
B9_0f37:	.db $8f
B9_0f38:	.db $b2
B9_0f39:		sbc $0b, x		; f5 0b
B9_0f3b:		inc $1c, x		; f6 1c
B9_0f3d:	.db $e2
B9_0f3e:		sec				; 38 
B9_0f3f:		rol $26			; 26 26
B9_0f41:		and $1f			; 25 1f
B9_0f43:	.db $f7
B9_0f44:		nop				; ea 
B9_0f45:	.db $af
B9_0f46:	.db $b2
B9_0f47:		sbc $fbf8, y	; f9 f8 fb
B9_0f4a:	.db $32
B9_0f4b:		ldx $b8ea		; ae ea b8
B9_0f4e:	.db $b2
B9_0f4f:		sbc $fbf6, y	; f9 f6 fb
B9_0f52:	.db $32
B9_0f53:		ldx $c1ea		; ae ea c1
B9_0f56:	.db $b2
B9_0f57:		sbc $fbf4, y	; f9 f4 fb
B9_0f5a:	.db $32
B9_0f5b:		ldx $caea		; ae ea ca
B9_0f5e:	.db $b2
B9_0f5f:		sbc $fbf3, y	; f9 f3 fb
B9_0f62:	.db $32
B9_0f63:	.db $ae $f9 $00
B9_0f66:		sbc $1201		; ed01 12
B9_0f69:		nop				; ea 
B9_0f6a:		eor $8b			; 45 8b
B9_0f6c:		sed				; f8 
B9_0f6d:	.db $82
B9_0f6e:	.db $fb
B9_0f6f:		rts				; 60 


B9_0f70:		ldx $181a		; ae 1a 18
B9_0f73:		nop				; ea 
B9_0f74:	.db $d3
B9_0f75:	.db $b2
B9_0f76:		sbc $0e, x		; f5 0e
B9_0f78:		bpl B9_0fa4 ; 10 2a

B9_0f7a:		clc				; 18 
B9_0f7b:	.db $1c
B9_0f7c:		bpl B9_0fa8 ; 10 2a

B9_0f7e:		asl $0d2a		; 0e 2a 0d
B9_0f81:		lsr $ed			; 46 ed
B9_0f83:	.db $02
B9_0f84:	.db $12
B9_0f85:		nop				; ea 
B9_0f86:		eor $8b			; 45 8b
B9_0f88:	.db $fb
B9_0f89:		rts				; 60 


B9_0f8a:		ldx $07f5		; ae f5 07
B9_0f8d:		asl $1f0e, x	; 1e 0e 1f
B9_0f90:		asl a			; 0a
B9_0f91:		nop				; ea 
B9_0f92:	.db $d3
B9_0f93:	.db $b2
B9_0f94:	.db $e2
B9_0f95:		rol a			; 2a
B9_0f96:		sbc $1c, x		; f5 1c
B9_0f98:	.db $1c
B9_0f99:		;removed
	.db $70 $e2

B9_0f9b:	.db $1f
B9_0f9c:		sbc $07, x		; f5 07
B9_0f9e:	.db $1b
B9_0f9f:	.db $1c
B9_0fa0:	.db $1c
B9_0fa1:		asl $0ef5		; 0e f5 0e
B9_0fa4:		asl $171c, x	; 1e 1c 17
B9_0fa7:		rol a			; 2a
B9_0fa8:	.db $17
B9_0fa9:		rol a			; 2a
B9_0faa:	.db $1f
B9_0fab:		rol a			; 2a
B9_0fac:	.db $17
B9_0fad:	.db $1c
B9_0fae:		asl $2a, x		; 16 2a
B9_0fb0:		asl $46, x		; 16 46
B9_0fb2:		ora $2a, x		; 15 2a
B9_0fb4:		asl $152a, x	; 1e 2a 15
B9_0fb7:	.db $1c
B9_0fb8:		ora $46, x		; 15 46
B9_0fba:		ora $2a, x		; 15 2a
B9_0fbc:	.db $17
B9_0fbd:		rol a			; 2a
B9_0fbe:		sbc $07, x		; f5 07
B9_0fc0:	.db $13
B9_0fc1:	.db $1c
B9_0fc2:		sbc $04, x		; f5 04
B9_0fc4:	.db $13
B9_0fc5:		asl $0e17		; 0e 17 0e
B9_0fc8:	.db $17
B9_0fc9:		asl $0ef5		; 0e f5 0e
B9_0fcc:		ora $192a, y	; 19 2a 19
B9_0fcf:		rol a			; 2a
B9_0fd0:		ora $ea1c, y	; 19 1c ea
B9_0fd3:	.db $8f
B9_0fd4:	.db $b2
B9_0fd5:	.db $e2
B9_0fd6:		and $1cf5		; 2d f5 1c
B9_0fd9:	.db $12
B9_0fda:		;removed
	.db $70 $13

B9_0fdc:		bvs B9_0ff6 ; 70 18

B9_0fde:		bvs B9_0fff ; 70 1f

B9_0fe0:		ror $04f2, x	; 7e f2 04
B9_0fe3:	.db $ef
B9_0fe4:	.db $e7
B9_0fe5:		lsr $08			; 46 08
B9_0fe7:	.db $8b
B9_0fe8:		inc $70, x		; f6 70
B9_0fea:		asl $edf2, x	; 1e f2 ed
B9_0fed:		asl a			; 0a
B9_0fee:		sbc $f014		; ed14 f0
B9_0ff1:		cpx $1aff		; ec ff 1a
B9_0ff4:		and $21			; 25 21
B9_0ff6:		ora ($f1, x)	; 01 f1
B9_0ff8:		php				; 08 
B9_0ff9:		and ($01, x)	; 21 01
B9_0ffb:		sbc ($09), y	; f1 09
B9_0ffd:		and ($03, x)	; 21 03
B9_0fff:		sbc ($19), y	; f1 19
B9_1001:		and ($03, x)	; 21 03
B9_1003:		sbc ($19), y	; f1 19
B9_1005:	.db $fa
B9_1006:		clc				; 18 
B9_1007:		and $fb			; 25 fb
B9_1009:		sbc $af, x		; f5 af
B9_100b:	.db $17
B9_100c:		and $fb			; 25 fb
B9_100e:		sbc $af, x		; f5 af
B9_1010:		and ($03, x)	; 21 03
B9_1012:		sbc ($19), y	; f1 19
B9_1014:	.db $fa
B9_1015:		inc $1003, x	; fe 03 10
B9_1018:		bcs B9_1015 ; b0 fb

B9_101a:		bpl B9_0fcc ; 10 b0

B9_101c:	.db $fb
B9_101d:		bpl B9_0fcf ; 10 b0

B9_101f:		and ($03, x)	; 21 03
B9_1021:		sbc ($0b), y	; f1 0b
B9_1023:	.db $fa
B9_1024:		and ($02, x)	; 21 02
B9_1026:		sbc ($05), y	; f1 05
B9_1028:	.db $fa
B9_1029:		inc $2403, x	; fe 03 24
B9_102c:		bcs B9_101f ; b0 f1

B9_102e:		asl $03fd		; 0e fd 03
B9_1031:		ora $21b0, y	; 19 b0 21
B9_1034:	.db $02
B9_1035:		sbc ($05), y	; f1 05
B9_1037:		inc $3303, x	; fe 03 33
B9_103a:		;removed
	.db $b0 $21

B9_103c:	.db $03
B9_103d:		sbc ($0b), y	; f1 0b
B9_103f:		and ($03, x)	; 21 03
B9_1041:		sbc ($19), y	; f1 19
B9_1043:		and ($03, x)	; 21 03
B9_1045:		sbc ($0b), y	; f1 0b
B9_1047:		and ($03, x)	; 21 03
B9_1049:		sbc ($19), y	; f1 19
B9_104b:	.db $fa
B9_104c:		sbc $3302, x	; fd 02 33
B9_104f:		bcs B9_1072 ; b0 21

B9_1051:	.db $02
B9_1052:		sbc ($05), y	; f1 05
B9_1054:		inc $5003, x	; fe 03 50
B9_1057:		;removed
	.db $b0 $21

B9_1059:	.db $03
B9_105a:		sbc ($0b), y	; f1 0b
B9_105c:		and ($03, x)	; 21 03
B9_105e:		sbc ($19), y	; f1 19
B9_1060:		and ($03, x)	; 21 03
B9_1062:		sbc ($0b), y	; f1 0b
B9_1064:		and ($02, x)	; 21 02
B9_1066:		sbc ($05), y	; f1 05
B9_1068:		inc $6403, x	; fe 03 64
B9_106b:		;removed
	.db $b0 $fa

B9_106d:	.db $fb
B9_106e:	.db $33
B9_106f:		bcs B9_106e ; b0 fd

B9_1071:	.db $02
B9_1072:		adc $fbb0		; 6d b0 fb
B9_1075:		;removed
	.db $50 $b0

B9_1077:	.db $fb
B9_1078:	.db $33
B9_1079:		bcs B9_1078 ; b0 fd

B9_107b:		php				; 08 
B9_107c:	.db $77
B9_107d:		;removed
	.db $b0 $fb

B9_107f:		bit $b0			; 24 b0
B9_1081:		inc $7e03, x	; fe 03 7e
B9_1084:		bcs B9_1081 ; b0 fb

B9_1086:	.db $1f
B9_1087:		bcs B9_1084 ; b0 fb

B9_1089:		;removed
	.db $10 $b0

B9_108b:		and ($03, x)	; 21 03
B9_108d:		sbc ($10), y	; f1 10
B9_108f:		and ($03, x)	; 21 03
B9_1091:		sbc ($22), y	; f1 22
B9_1093:		sbc ($04), y	; f1 04
B9_1095:		and ($03, x)	; 21 03
B9_1097:		asl $f0a8		; 0e a8 f0
B9_109a:		cpx $0201		; ec 01 02
B9_109d:		ora ($01, x)	; 01 01
B9_109f:	.db $02
B9_10a0:		inc $9c0a, x	; fe 0a 9c
B9_10a3:		bcs B9_10a7 ; b0 02

B9_10a5:		ora ($01, x)	; 01 01
B9_10a7:	.db $03
B9_10a8:	.db $03
B9_10a9:		ora ($02, x)	; 01 02
B9_10ab:		php				; 08 
B9_10ac:	.db $04
B9_10ad:		ora ($02, x)	; 01 02
B9_10af:		ora #$05		; 09 05
B9_10b1:		ora ($02, x)	; 01 02
B9_10b3:	.db $1b
B9_10b4:	.db $fa
B9_10b5:	.db $fb
B9_10b6:		bcs B9_1068 ; b0 b0

B9_10b8:		sbc $9c02, x	; fd 02 9c
B9_10bb:		bcs B9_10b8 ; b0 fb

B9_10bd:		bcs B9_106f ; b0 b0

B9_10bf:		inc $bc03, x	; fe 03 bc
B9_10c2:		bcs B9_10bf ; b0 fb

B9_10c4:		;removed
	.db $b0 $b0

B9_10c6:	.db $fb
B9_10c7:		bcs B9_1079 ; b0 b0

B9_10c9:		ora $01			; 05 01
B9_10cb:	.db $02
B9_10cc:		ora $04fa		; 0d fa 04
B9_10cf:		ora ($02, x)	; 01 02
B9_10d1:		asl $fe			; 06 fe
B9_10d3:	.db $02
B9_10d4:		dec $04b0		; ce b0 04
B9_10d7:		ora ($02, x)	; 01 02
B9_10d9:	.db $14
B9_10da:		sbc $c303, x	; fd 03 c3
B9_10dd:		bcs B9_10e3 ; b0 04

B9_10df:		ora ($02, x)	; 01 02
B9_10e1:		asl $fe			; 06 fe
B9_10e3:	.db $03
B9_10e4:		dec $05b0, x	; de b0 05
B9_10e7:		ora ($02, x)	; 01 02
B9_10e9:		ora $0105		; 0d 05 01
B9_10ec:	.db $02
B9_10ed:	.db $1b
B9_10ee:		ora $01			; 05 01
B9_10f0:	.db $02
B9_10f1:		ora $0105		; 0d 05 01
B9_10f4:	.db $02
B9_10f5:	.db $1b
B9_10f6:	.db $fa
B9_10f7:		sbc $de02, x	; fd 02 de
B9_10fa:		bcs B9_1100 ; b0 04

B9_10fc:		ora ($02, x)	; 01 02
B9_10fe:		asl $fe			; 06 fe
B9_1100:	.db $03
B9_1101:	.db $fb
B9_1102:		bcs B9_1109 ; b0 05

B9_1104:		ora ($02, x)	; 01 02
B9_1106:		ora $0105		; 0d 05 01
B9_1109:	.db $02
B9_110a:	.db $1b
B9_110b:		ora $01			; 05 01
B9_110d:	.db $02
B9_110e:		ora $0104		; 0d 04 01
B9_1111:	.db $02
B9_1112:		asl $fe			; 06 fe
B9_1114:	.db $03
B9_1115:	.db $0f
B9_1116:		lda ($fa), y	; b1 fa
B9_1118:	.db $fb
B9_1119:		dec $fdb0, x	; de b0 fd
B9_111c:	.db $02
B9_111d:		clc				; 18 
B9_111e:		lda ($fb), y	; b1 fb
B9_1120:	.db $fb
B9_1121:		bcs B9_111e ; b0 fb

B9_1123:		dec $fdb0, x	; de b0 fd
B9_1126:		php				; 08 
B9_1127:	.db $22
B9_1128:		lda ($04), y	; b1 04
B9_112a:		ora ($02, x)	; 01 02
B9_112c:		asl $fe			; 06 fe
B9_112e:	.db $03
B9_112f:		and #$b1		; 29 b1
B9_1131:	.db $fb
B9_1132:		cmp #$b0		; c9 b0
B9_1134:	.db $fb
B9_1135:		bcs B9_10e7 ; b0 b0

B9_1137:		ora $01			; 05 01
B9_1139:	.db $02
B9_113a:	.db $12
B9_113b:		ora $01			; 05 01
B9_113d:	.db $02
B9_113e:		bit $f2			; 24 f2
B9_1140:	.db $04
B9_1141:		cpx $0507		; ec 07 05
B9_1144:		ora ($02, x)	; 01 02
B9_1146:	.db $6f
B9_1147:		;removed
	.db $f0 $f3

B9_1149:	.db $f2
B9_114a:	.db $89
B9_114b:		asl $0e25		; 0e 25 0e
B9_114e:		ora #$0e		; 09 0e
B9_1150:		asl a			; 0a
B9_1151:	.db $1c
B9_1152:		ora ($0e, x)	; 01 0e
B9_1154:	.db $1b
B9_1155:	.db $1c
B9_1156:		ora ($0e, x)	; 01 0e
B9_1158:	.db $1b
B9_1159:	.db $0c
B9_115a:		and $0c			; 25 0c
B9_115c:		ora #$0c		; 09 0c
B9_115e:		asl a			; 0a
B9_115f:	.db $1c
B9_1160:		ora ($0c, x)	; 01 0c
B9_1162:	.db $1b
B9_1163:	.db $1c
B9_1164:		ora ($0c, x)	; 01 0c
B9_1166:	.db $1b
B9_1167:	.db $0b
B9_1168:		and $0b			; 25 0b
B9_116a:		ora #$0b		; 09 0b
B9_116c:		asl a			; 0a
B9_116d:	.db $1c
B9_116e:		ora ($0b, x)	; 01 0b
B9_1170:	.db $1b
B9_1171:	.db $1c
B9_1172:		ora ($0b, x)	; 01 0b
B9_1174:	.db $1b
B9_1175:	.db $1c
B9_1176:		ora ($0a, x)	; 01 0a
B9_1178:	.db $1b
B9_1179:	.db $1c
B9_117a:		ora ($0a, x)	; 01 0a
B9_117c:	.db $1b
B9_117d:	.db $1c
B9_117e:		ora ($09, x)	; 01 09
B9_1180:	.db $1b
B9_1181:	.db $1c
B9_1182:		ora ($09, x)	; 01 09
B9_1184:	.db $1b
B9_1185:	.db $fa
B9_1186:	.db $1c
B9_1187:		ora ($0e, x)	; 01 0e
B9_1189:	.db $1b
B9_118a:	.db $1c
B9_118b:		ora ($0e, x)	; 01 0e
B9_118d:	.db $1b
B9_118e:	.db $1c
B9_118f:		ora ($0e, x)	; 01 0e
B9_1191:		ora $011c		; 0d 1c 01
B9_1194:		sbc ($06), y	; f1 06
B9_1196:	.db $1c
B9_1197:		ora ($f1, x)	; 01 f1
B9_1199:		asl $fa			; 06 fa
B9_119b:	.db $1c
B9_119c:		ora ($0e, x)	; 01 0e
B9_119e:	.db $1b
B9_119f:		inc $8602, x	; fe 02 86
B9_11a2:		lda ($fb), y	; b1 fb
B9_11a4:		adc $1cb1, x	; 7d b1 1c
B9_11a7:		ora ($09, x)	; 01 09
B9_11a9:		ora $92fb		; 0d fb 92
B9_11ac:		lda ($1c), y	; b1 1c
B9_11ae:		ora ($09, x)	; 01 09
B9_11b0:	.db $1b
B9_11b1:	.db $1c
B9_11b2:		ora ($0e, x)	; 01 0e
B9_11b4:	.db $1b
B9_11b5:	.db $1c
B9_11b6:		ora ($0e, x)	; 01 0e
B9_11b8:		ora $011c		; 0d 1c 01
B9_11bb:		asl $1c1b		; 0e 1b 1c
B9_11be:		ora ($0e, x)	; 01 0e
B9_11c0:		ora $011c		; 0d 1c 01
B9_11c3:		asl $fa1b		; 0e 1b fa
B9_11c6:		inc $b102, x	; fe 02 b1
B9_11c9:		lda ($1c), y	; b1 1c
B9_11cb:		ora ($0a, x)	; 01 0a
B9_11cd:	.db $1b
B9_11ce:	.db $1c
B9_11cf:		ora ($0a, x)	; 01 0a
B9_11d1:		ora $011c		; 0d 1c 01
B9_11d4:		ora #$1b		; 09 1b
B9_11d6:	.db $1c
B9_11d7:		ora ($09, x)	; 01 09
B9_11d9:		ora $011c		; 0d 1c 01
B9_11dc:		ora #$1b		; 09 1b
B9_11de:	.db $fb
B9_11df:		lda ($b1), y	; b1 b1
B9_11e1:	.db $fb
B9_11e2:		lda ($b1), y	; b1 b1
B9_11e4:	.db $1c
B9_11e5:		ora ($0c, x)	; 01 0c
B9_11e7:	.db $1b
B9_11e8:	.db $1c
B9_11e9:		ora ($0c, x)	; 01 0c
B9_11eb:		ora $011c		; 0d 1c 01
B9_11ee:	.db $0c
B9_11ef:	.db $1b
B9_11f0:	.db $1c
B9_11f1:		ora ($0c, x)	; 01 0c
B9_11f3:		ora $011c		; 0d 1c 01
B9_11f6:	.db $0c
B9_11f7:	.db $1b
B9_11f8:	.db $1c
B9_11f9:		ora ($0b, x)	; 01 0b
B9_11fb:	.db $1b
B9_11fc:	.db $1c
B9_11fd:		ora ($0b, x)	; 01 0b
B9_11ff:		ora $011c		; 0d 1c 01
B9_1202:	.db $0b
B9_1203:	.db $1b
B9_1204:	.db $1c
B9_1205:		ora ($0b, x)	; 01 0b
B9_1207:		ora $011c		; 0d 1c 01
B9_120a:	.db $0b
B9_120b:	.db $1b
B9_120c:	.db $fa
B9_120d:	.db $1c
B9_120e:		ora ($10, x)	; 01 10
B9_1210:	.db $1b
B9_1211:	.db $1c
B9_1212:		ora ($10, x)	; 01 10
B9_1214:		ora $011c		; 0d 1c 01
B9_1217:		bpl B9_1234 ; 10 1b

B9_1219:	.db $1c
B9_121a:		ora ($10, x)	; 01 10
B9_121c:		ora $011c		; 0d 1c 01
B9_121f:		;removed
	.db $10 $1b

B9_1221:	.db $fa
B9_1222:	.db $1c
B9_1223:		ora ($13, x)	; 01 13
B9_1225:	.db $1b
B9_1226:	.db $1c
B9_1227:		ora ($13, x)	; 01 13
B9_1229:		ora $011c		; 0d 1c 01
B9_122c:	.db $13
B9_122d:	.db $1b
B9_122e:	.db $1c
B9_122f:		ora ($13, x)	; 01 13
B9_1231:		ora $011c		; 0d 1c 01
B9_1234:	.db $13
B9_1235:	.db $1b
B9_1236:	.db $1c
B9_1237:		ora ($12, x)	; 01 12
B9_1239:	.db $1b
B9_123a:	.db $1c
B9_123b:		ora ($12, x)	; 01 12
B9_123d:		ora $011c		; 0d 1c 01
B9_1240:	.db $12
B9_1241:	.db $1b
B9_1242:	.db $1c
B9_1243:		ora ($12, x)	; 01 12
B9_1245:		ora $011c		; 0d 1c 01
B9_1248:	.db $12
B9_1249:	.db $1b
B9_124a:	.db $fb
B9_124b:		sed				; f8 
B9_124c:		lda ($fb), y	; b1 fb
B9_124e:		ora $1cb2		; 0d b2 1c
B9_1251:		ora ($09, x)	; 01 09
B9_1253:	.db $1b
B9_1254:	.db $1c
B9_1255:		ora ($09, x)	; 01 09
B9_1257:		ora $011c		; 0d 1c 01
B9_125a:		ora #$1b		; 09 1b
B9_125c:	.db $1c
B9_125d:		ora ($09, x)	; 01 09
B9_125f:		ora $011c		; 0d 1c 01
B9_1262:		ora #$1b		; 09 1b
B9_1264:	.db $1c
B9_1265:		ora ($0e, x)	; 01 0e
B9_1267:	.db $1b
B9_1268:	.db $1c
B9_1269:		ora ($0e, x)	; 01 0e
B9_126b:		ora $011c		; 0d 1c 01
B9_126e:		asl $fa1b		; 0e 1b fa
B9_1271:	.db $1c
B9_1272:		ora ($0e, x)	; 01 0e
B9_1274:		ora $011c		; 0d 1c 01
B9_1277:		asl $fe1b		; 0e 1b fe
B9_127a:	.db $02
B9_127b:	.db $64
B9_127c:	.db $b2
B9_127d:	.db $fb
B9_127e:	.db $64
B9_127f:	.db $b2
B9_1280:	.db $1c
B9_1281:		ora ($0e, x)	; 01 0e
B9_1283:	.db $12
B9_1284:	.db $1c
B9_1285:		ora ($0e, x)	; 01 0e
B9_1287:		bit $f2			; 24 f2
B9_1289:	.db $04
B9_128a:	.db $1c
B9_128b:		ora ($0e, x)	; 01 0e
B9_128d:		bvs B9_127f ; 70 f0

B9_128f:		ora $797b		; 0d 7b 79
B9_1292:	.db $7a
B9_1293:	.db $7a
B9_1294:	.db $7b
B9_1295:	.db $7b
B9_1296:	.db $7c
B9_1297:	.db $7c
B9_1298:	.db $7d $7e $00
B9_129b:	.db $80
B9_129c:	.db $77
B9_129d:	.db $77
B9_129e:		.db $00				; 00
B9_129f:	.db $80
B9_12a0:		ora ($76, x)	; 01 76
B9_12a2:		.db $00				; 00
B9_12a3:	.db $80
B9_12a4:	.db $07
B9_12a5:		sec				; 38 
B9_12a6:	.db $37
B9_12a7:		sec				; 38 
B9_12a8:		and $8000, y	; 39 00 80
B9_12ab:		and ($35), y	; 31 35
B9_12ad:		.db $00				; 00
B9_12ae:	.db $80
B9_12af:		ora $3c			; 05 3c
B9_12b1:	.db $37
B9_12b2:		.db $00				; 00
B9_12b3:	.db $80
B9_12b4:		and ($34), y	; 31 34
B9_12b6:		.db $00				; 00
B9_12b7:	.db $80
B9_12b8:		ora $3d			; 05 3d
B9_12ba:		sec				; 38 
B9_12bb:		.db $00				; 00
B9_12bc:	.db $80
B9_12bd:		and ($34), y	; 31 34
B9_12bf:		.db $00				; 00
B9_12c0:	.db $80
B9_12c1:		ora $3e			; 05 3e
B9_12c3:		and $8000, y	; 39 00 80
B9_12c6:		and ($34), y	; 31 34
B9_12c8:		.db $00				; 00
B9_12c9:	.db $80
B9_12ca:		ora $3f			; 05 3f
B9_12cc:	.db $3b
B9_12cd:		.db $00				; 00
B9_12ce:	.db $80
B9_12cf:		and ($35), y	; 31 35
B9_12d1:		.db $00				; 00
B9_12d2:	.db $80
B9_12d3:		php				; 08 
B9_12d4:	.db $7c
B9_12d5:		adc $797b, x	; 7d 7b 79
B9_12d8:	.db $7a
B9_12d9:		.db $00				; 00
B9_12da:	.db $80
B9_12db:		adc ($75), y	; 71 75
B9_12dd:		.db $00				; 00
B9_12de:	.db $80
B9_12df:		.db $00				; 00
B9_12e0:		.db $00				; 00
B9_12e1:	.db $f3
B9_12e2:	.db $b2
B9_12e3:		ora ($01, x)	; 01 01
B9_12e5:	.db $62
B9_12e6:	.db $b3
B9_12e7:	.db $02
B9_12e8:	.db $02
B9_12e9:		sta ($b3), y	; 91 b3
B9_12eb:	.db $03
B9_12ec:	.db $03
B9_12ed:		asl $08b4		; 0e b4 08
B9_12f0:	.db $9b
B9_12f1:		ldy $ff, x		; b4 ff
B9_12f3:	.db $e7
B9_12f4:	.db $03
B9_12f5:		asl $8b, x		; 16 8b
B9_12f7:		nop				; ea 
B9_12f8:		beq B9_12ae ; f0 b4

B9_12fa:		sbc $02, x		; f5 02
B9_12fc:		and ($07, x)	; 21 07
B9_12fe:		inc $fc08, x	; fe 08 fc
B9_1301:	.db $b2
B9_1302:		nop				; ea 
B9_1303:	.db $fa
B9_1304:		ldy $21, x		; b4 21
B9_1306:		asl $0e21		; 0e 21 0e
B9_1309:		sbc $f701, x	; fd 01 f7
B9_130c:	.db $b2
B9_130d:	.db $fa
B9_130e:		sbc $fb01, y	; f9 01 fb
B9_1311:	.db $f7
B9_1312:	.db $b2
B9_1313:		sbc $ea00, y	; f9 00 ea
B9_1316:	.db $04
B9_1317:		lda $e7, x		; b5 e7
B9_1319:		ora $1e, x		; 15 1e
B9_131b:	.db $8b
B9_131c:	.db $ef
B9_131d:		inc $01, x		; f6 01
B9_131f:		sbc #$15		; e9 15
B9_1321:		asl $17, x		; 16 17
B9_1323:		clc				; 18 
B9_1324:		ora $1b1a, y	; 19 1a 1b
B9_1327:	.db $1c
B9_1328:		ora $1f1e, x	; 1d 1e 1f
B9_132b:		jsr $21f7		; 20 f7 21
B9_132e:	.db $4f
B9_132f:		sbc $f2			; e5 f2
B9_1331:	.db $23
B9_1332:		sbc $3806		; ed06 38
B9_1335:		inc $01, x		; f6 01
B9_1337:		sbc #$16		; e9 16
B9_1339:	.db $17
B9_133a:		clc				; 18 
B9_133b:		ora $1b1a, y	; 19 1a 1b
B9_133e:	.db $1c
B9_133f:		ora $1f1e, x	; 1d 1e 1f
B9_1342:		jsr $f721		; 20 21 f7
B9_1345:	.db $22
B9_1346:	.db $4f
B9_1347:		sbc $f2			; e5 f2
B9_1349:	.db $23
B9_134a:		sbc $3806		; ed06 38
B9_134d:		nop				; ea 
B9_134e:	.db $1c
B9_134f:		lda $e2, x		; b5 e2
B9_1351:		asl $1cf5		; 0e f5 1c
B9_1354:		inc $70, x		; f6 70
B9_1356:	.db $1c
B9_1357:	.db $1f
B9_1358:	.db $1c
B9_1359:	.db $22
B9_135a:	.db $1c
B9_135b:	.db $1f
B9_135c:	.db $1c
B9_135d:	.db $22
B9_135e:	.db $f7
B9_135f:	.db $fc
B9_1360:	.db $f3
B9_1361:	.db $b2
B9_1362:	.db $e7
B9_1363:		ora ($16, x)	; 01 16
B9_1365:	.db $8b
B9_1366:		sbc $fbf4, y	; f9 f4 fb
B9_1369:	.db $f7
B9_136a:	.db $b2
B9_136b:		sbc $fbf5, y	; f9 f5 fb
B9_136e:	.db $f7
B9_136f:	.db $b2
B9_1370:		sbc $fbf4, y	; f9 f4 fb
B9_1373:	.db $f7
B9_1374:	.db $b2
B9_1375:		sbc $fbf5, y	; f9 f5 fb
B9_1378:	.db $f7
B9_1379:	.db $b2
B9_137a:		sbc $ea00, y	; f9 00 ea
B9_137d:	.db $1c
B9_137e:		lda $e2, x		; b5 e2
B9_1380:		asl $1cf5		; 0e f5 1c
B9_1383:		inc $70, x		; f6 70
B9_1385:		ora $18, x		; 15 18
B9_1387:		ora $1b, x		; 15 1b
B9_1389:		ora $18, x		; 15 18
B9_138b:		ora $1b, x		; 15 1b
B9_138d:	.db $f7
B9_138e:	.db $fc
B9_138f:	.db $62
B9_1390:	.db $b3
B9_1391:		cpx $1cff		; ec ff 1c
B9_1394:		asl $f1			; 06 f1
B9_1396:		ora ($fe, x)	; 01 fe
B9_1398:		php				; 08 
B9_1399:	.db $93
B9_139a:	.db $b3
B9_139b:	.db $1c
B9_139c:	.db $0c
B9_139d:		sbc ($02), y	; f1 02
B9_139f:	.db $1c
B9_13a0:	.db $0c
B9_13a1:		sbc ($02), y	; f1 02
B9_13a3:		sbc $9301, x	; fd 01 93
B9_13a6:	.db $b3
B9_13a7:	.db $fa
B9_13a8:		sbc $fb01, y	; f9 01 fb
B9_13ab:	.db $93
B9_13ac:	.db $b3
B9_13ad:		sbc $fb00, y	; f9 00 fb
B9_13b0:	.db $93
B9_13b1:	.db $b3
B9_13b2:		sbc $fb01, y	; f9 01 fb
B9_13b5:	.db $93
B9_13b6:	.db $b3
B9_13b7:	.db $eb
B9_13b8:	.db $0b
B9_13b9:		inc $07, x		; f6 07
B9_13bb:		asl $23f1, x	; 1e f1 23
B9_13be:		asl $1ef1, x	; 1e f1 1e
B9_13c1:	.db $f7
B9_13c2:	.db $23
B9_13c3:		asl $071e		; 0e 1e 07
B9_13c6:		sbc ($07), y	; f1 07
B9_13c8:	.db $23
B9_13c9:		asl $071e		; 0e 1e 07
B9_13cc:		sbc ($07), y	; f1 07
B9_13ce:	.db $23
B9_13cf:		asl $f6fa		; 0e fa f6
B9_13d2:	.db $07
B9_13d3:		asl $23f1, x	; 1e f1 23
B9_13d6:		asl $1ef1, x	; 1e f1 1e
B9_13d9:	.db $f7
B9_13da:	.db $23
B9_13db:		asl $071e		; 0e 1e 07
B9_13de:		sbc ($07), y	; f1 07
B9_13e0:	.db $23
B9_13e1:		asl $0e23		; 0e 23 0e
B9_13e4:	.db $23
B9_13e5:		asl $02fe		; 0e fe 02
B9_13e8:		lda $fbb3, y	; b9 b3 fb
B9_13eb:		lda $f6b3, y	; b9 b3 f6
B9_13ee:	.db $07
B9_13ef:		asl $23f1, x	; 1e f1 23
B9_13f2:		asl $1ef1, x	; 1e f1 1e
B9_13f5:	.db $f7
B9_13f6:	.db $23
B9_13f7:		asl $031e		; 0e 1e 03
B9_13fa:	.db $23
B9_13fb:	.db $04
B9_13fc:	.db $23
B9_13fd:	.db $03
B9_13fe:	.db $23
B9_13ff:	.db $04
B9_1400:		inc $07, x		; f6 07
B9_1402:	.db $23
B9_1403:	.db $23
B9_1404:	.db $1f
B9_1405:	.db $1f
B9_1406:	.db $1a
B9_1407:	.db $1a
B9_1408:	.db $f7
B9_1409:	.db $eb
B9_140a:		.db $00				; 00
B9_140b:	.db $fc
B9_140c:	.db $93
B9_140d:	.db $b3
B9_140e:		cpx $0303		; ec 03 03
B9_1411:	.db $02
B9_1412:	.db $02
B9_1413:	.db $13
B9_1414:		inc $1002, x	; fe 02 10
B9_1417:		ldy $06, x		; b4 06
B9_1419:	.db $02
B9_141a:	.db $04
B9_141b:	.db $0c
B9_141c:		asl $02			; 06 02
B9_141e:	.db $04
B9_141f:	.db $0c
B9_1420:		sbc $1007, x	; fd 07 10
B9_1423:		ldy $ec, x		; b4 ec
B9_1425:		ora ($03, x)	; 01 03
B9_1427:		ora ($01, x)	; 01 01
B9_1429:		ora $0105		; 0d 05 01
B9_142c:	.db $02
B9_142d:		asl $03			; 06 03
B9_142f:		ora ($00, x)	; 01 00
B9_1431:		asl $01			; 06 01
B9_1433:	.db $07
B9_1434:	.db $03
B9_1435:		ora ($00, x)	; 01 00
B9_1437:		asl $05			; 06 05
B9_1439:		ora ($02, x)	; 01 02
B9_143b:		ora $0103		; 0d 03 01
B9_143e:		ora ($0d, x)	; 01 0d
B9_1440:		ora $01			; 05 01
B9_1442:	.db $02
B9_1443:		ora $01fe		; 0d fe 01
B9_1446:	.db $3c
B9_1447:		ldy $fa, x		; b4 fa
B9_1449:	.db $03
B9_144a:		ora ($01, x)	; 01 01
B9_144c:		ora $0105		; 0d 05 01
B9_144f:	.db $02
B9_1450:		asl $03			; 06 03
B9_1452:		ora ($00, x)	; 01 00
B9_1454:		asl $01			; 06 01
B9_1456:	.db $07
B9_1457:	.db $03
B9_1458:		ora ($00, x)	; 01 00
B9_145a:		asl $05			; 06 05
B9_145c:		ora ($02, x)	; 01 02
B9_145e:		ora $03fa		; 0d fa 03
B9_1461:		ora ($01, x)	; 01 01
B9_1463:		ora $0105		; 0d 05 01
B9_1466:	.db $02
B9_1467:		ora $02fe		; 0d fe 02
B9_146a:	.db $64
B9_146b:		ldy $fd, x		; b4 fd
B9_146d:	.db $02
B9_146e:		rol $b4			; 26 b4
B9_1470:	.db $fb
B9_1471:		rol $b4			; 26 b4
B9_1473:	.db $fb
B9_1474:		eor #$b4		; 49 b4
B9_1476:	.db $03
B9_1477:		ora ($00, x)	; 01 00
B9_1479:	.db $02
B9_147a:		ora $01			; 05 01
B9_147c:	.db $02
B9_147d:	.db $03
B9_147e:		ora $01			; 05 01
B9_1480:	.db $02
B9_1481:	.db $02
B9_1482:		ora $01			; 05 01
B9_1484:	.db $02
B9_1485:	.db $03
B9_1486:		ora $01			; 05 01
B9_1488:	.db $02
B9_1489:		asl $05			; 06 05
B9_148b:		ora ($02, x)	; 01 02
B9_148d:		asl $ec			; 06 ec
B9_148f:		.db $00				; 00
B9_1490:	.db $04
B9_1491:		ora ($01, x)	; 01 01
B9_1493:		asl $fe			; 06 fe
B9_1495:	.db $03
B9_1496:		bcc B9_144c ; 90 b4

B9_1498:	.db $fc
B9_1499:		asl $f3b4		; 0e b4 f3
B9_149c:	.db $f2
B9_149d:	.db $89
B9_149e:		jsr $0902		; 20 02 09
B9_14a1:		ora $09			; 05 09
B9_14a3:	.db $07
B9_14a4:		ora #$07		; 09 07
B9_14a6:		inc $9e02, x	; fe 02 9e
B9_14a9:		ldy $1c, x		; b4 1c
B9_14ab:	.db $02
B9_14ac:		ora #$0c		; 09 0c
B9_14ae:	.db $1c
B9_14af:	.db $02
B9_14b0:		ora #$0c		; 09 0c
B9_14b2:		sbc $9e01, x	; fd 01 9e
B9_14b5:		ldy $20, x		; b4 20
B9_14b7:	.db $02
B9_14b8:		asl a			; 0a
B9_14b9:		ora $0a			; 05 0a
B9_14bb:	.db $07
B9_14bc:		asl a			; 0a
B9_14bd:	.db $07
B9_14be:		inc $b602, x	; fe 02 b6
B9_14c1:		ldy $1c, x		; b4 1c
B9_14c3:	.db $02
B9_14c4:		asl a			; 0a
B9_14c5:	.db $0c
B9_14c6:	.db $1c
B9_14c7:	.db $02
B9_14c8:		asl a			; 0a
B9_14c9:	.db $0c
B9_14ca:		sbc $b601, x	; fd 01 b6
B9_14cd:		ldy $fa, x		; b4 fa
B9_14cf:	.db $fb
B9_14d0:	.db $9e
B9_14d1:		ldy $f6, x		; b4 f6
B9_14d3:	.db $07
B9_14d4:		ora #$0c		; 09 0c
B9_14d6:	.db $07
B9_14d7:		ora #$f2		; 09 f2
B9_14d9:		ora #$f6		; 09 f6
B9_14db:		asl $090c		; 0e 0c 09
B9_14de:	.db $fa
B9_14df:		asl $0c09		; 0e 09 0c
B9_14e2:	.db $fb
B9_14e3:	.db $d2
B9_14e4:		ldy $0f, x		; b4 0f
B9_14e6:		asl $fe0c		; 0e 0c fe
B9_14e9:	.db $03
B9_14ea:	.db $d2
B9_14eb:		ldy $f7, x		; b4 f7
B9_14ed:	.db $fc
B9_14ee:	.db $9e
B9_14ef:		ldy $07, x		; b4 07
B9_14f1:	.db $34
B9_14f2:	.db $37
B9_14f3:	.db $39 $38 $00
B9_14f6:	.db $80
B9_14f7:	.db $37
B9_14f8:		.db $00				; 00
B9_14f9:	.db $80
B9_14fa:	.db $07
B9_14fb:	.db $34
B9_14fc:	.db $37
B9_14fd:	.db $39 $39 $00
B9_1500:	.db $80
B9_1501:	.db $37
B9_1502:		.db $00				; 00
B9_1503:	.db $80
B9_1504:		.db $00				; 00
B9_1505:		adc $75, x		; 75 75
B9_1507:		adc $75, x		; 75 75
B9_1509:		ror $76, x		; 76 76
B9_150b:		ror $76, x		; 76 76
B9_150d:	.db $77
B9_150e:	.db $77
B9_150f:	.db $77
B9_1510:	.db $77
B9_1511:		sei				; 78 
B9_1512:		sei				; 78 
B9_1513:		sei				; 78 
B9_1514:		sei				; 78 
B9_1515:		adc $7979, y	; 79 79 79
B9_1518:	.db $79 $7a $00
B9_151b:	.db $80
B9_151c:		asl a			; 0a
B9_151d:	.db $33
B9_151e:	.db $34
B9_151f:		and $36, x		; 35 36
B9_1521:	.db $37
B9_1522:		sec				; 38 
B9_1523:	.db $39 $3a $00
B9_1526:	.db $80
B9_1527:		and ($35), y	; 31 35
B9_1529:		.db $00				; 00
B9_152a:	.db $80
B9_152b:		.db $00				; 00
B9_152c:		.db $00				; 00
B9_152d:	.db $3f
B9_152e:		lda $01, x		; b5 01
B9_1530:		ora ($8a, x)	; 01 8a
B9_1532:		lda $02, x		; b5 02
B9_1534:	.db $02
B9_1535:		sty $b5, x		; 94 b5
B9_1537:	.db $03
B9_1538:	.db $03
B9_1539:		inc $08b5, x	; fe b5 08
B9_153c:		ldy #$b6		; a0 b6
B9_153e:	.db $ff
B9_153f:		nop				; ea 
B9_1540:	.db $bf
B9_1541:		ldx $ef, y		; b6 ef
B9_1543:		inc $0a, x		; f6 0a
B9_1545:		asl $1311		; 0e 11 13
B9_1548:		ora ($0e), y	; 11 0e
B9_154a:		ora ($13), y	; 11 13
B9_154c:		inc $14, x		; f6 14
B9_154e:	.db $14
B9_154f:		inc $0a, x		; f6 0a
B9_1551:	.db $13
B9_1552:		ora ($0e), y	; 11 0e
B9_1554:		ora ($0e), y	; 11 0e
B9_1556:	.db $0c
B9_1557:		ora $01fe		; 0d fe 01
B9_155a:	.db $43
B9_155b:		lda $fa, x		; b5 fa
B9_155d:	.db $fb
B9_155e:	.db $42
B9_155f:		lda $f5, x		; b5 f5
B9_1561:		asl a			; 0a
B9_1562:		inc $14, x		; f6 14
B9_1564:		asl $ef0e		; 0e 0e ef
B9_1567:		inc $0a, x		; f6 0a
B9_1569:		asl $0c09		; 0e 09 0c
B9_156c:		inc $14, x		; f6 14
B9_156e:		asl $f6fa		; 0e fa f6
B9_1571:		asl a			; 0a
B9_1572:		asl $0e0c		; 0e 0c 0e
B9_1575:		ora ($0e), y	; 11 0e
B9_1577:	.db $13
B9_1578:	.db $0c
B9_1579:	.db $fa
B9_157a:	.db $fb
B9_157b:		rts				; 60 


B9_157c:		lda $f6, x		; b5 f6
B9_157e:		asl a			; 0a
B9_157f:	.db $0b
B9_1580:	.db $17
B9_1581:	.db $0b
B9_1582:	.db $0c
B9_1583:		clc				; 18 
B9_1584:		ora $fa19		; 0d 19 fa
B9_1587:	.db $fc
B9_1588:		eor $eab5, x	; 5d b5 ea
B9_158b:		eor #$8b		; 49 8b
B9_158d:		sbc ($0c), y	; f1 0c
B9_158f:		sed				; f8 
B9_1590:		sta ($fc, x)	; 81 fc
B9_1592:	.db $42
B9_1593:		lda $eb, x		; b5 eb
B9_1595:	.db $0b
B9_1596:		cpx $f1ff		; ec ff f1
B9_1599:		;removed
	.db $50 $f1

B9_159b:		;removed
	.db $50 $22

B9_159d:		asl a			; 0a
B9_159e:	.db $1f
B9_159f:		ora $f1			; 05 f1
B9_15a1:		ora $fa			; 05 fa
B9_15a3:		inc $9c02, x	; fe 02 9c
B9_15a6:		lda $22, x		; b5 22
B9_15a8:		asl a			; 0a
B9_15a9:	.db $22
B9_15aa:	.db $14
B9_15ab:	.db $fb
B9_15ac:	.db $9e
B9_15ad:		lda $22, x		; b5 22
B9_15af:		ora $22			; 05 22
B9_15b1:		ora $fb			; 05 fb
B9_15b3:	.db $9e
B9_15b4:		lda $f6, x		; b5 f6
B9_15b6:		ora $22			; 05 22
B9_15b8:	.db $22
B9_15b9:	.db $1f
B9_15ba:	.db $1f
B9_15bb:	.db $f7
B9_15bc:	.db $fb
B9_15bd:	.db $9e
B9_15be:		lda $22, x		; b5 22
B9_15c0:		asl a			; 0a
B9_15c1:	.db $1f
B9_15c2:		ora $f1			; 05 f1
B9_15c4:	.db $0f
B9_15c5:	.db $22
B9_15c6:	.db $14
B9_15c7:	.db $1f
B9_15c8:		ora $f1			; 05 f1
B9_15ca:		ora $1f			; 05 1f
B9_15cc:		ora $f1			; 05 f1
B9_15ce:		ora $22			; 05 22
B9_15d0:	.db $14
B9_15d1:	.db $1f
B9_15d2:		ora $f1			; 05 f1
B9_15d4:		ora $1f			; 05 1f
B9_15d6:		ora $f1			; 05 f1
B9_15d8:		ora $22			; 05 22
B9_15da:		asl a			; 0a
B9_15db:	.db $1f
B9_15dc:		ora $fa			; 05 fa
B9_15de:		sbc ($0f), y	; f1 0f
B9_15e0:	.db $fb
B9_15e1:	.db $9e
B9_15e2:		lda $22, x		; b5 22
B9_15e4:	.db $14
B9_15e5:		inc $c101, x	; fe 01 c1
B9_15e8:		lda $fb, x		; b5 fb
B9_15ea:		cmp ($b5, x)	; c1 b5
B9_15ec:		sbc ($05), y	; f1 05
B9_15ee:	.db $22
B9_15ef:		asl a			; 0a
B9_15f0:	.db $fb
B9_15f1:	.db $9e
B9_15f2:		lda $fe, x		; b5 fe
B9_15f4:		ora ($ee, x)	; 01 ee
B9_15f6:		lda $fd, x		; b5 fd
B9_15f8:		ora ($e9, x)	; 01 e9
B9_15fa:		lda $fc, x		; b5 fc
B9_15fc:		cmp ($b5, x)	; c1 b5
B9_15fe:		sbc ($50), y	; f1 50
B9_1600:		sbc ($50), y	; f1 50
B9_1602:		cpx $0501		; ec 01 05
B9_1605:		ora ($02, x)	; 01 02
B9_1607:		ora #$fa		; 09 fa
B9_1609:		cpx $0300		; ec 00 03
B9_160c:		ora ($00, x)	; 01 00
B9_160e:		ora #$fa		; 09 fa
B9_1610:		inc $0202, x	; fe 02 02
B9_1613:		ldx $fb, y		; b6 fb
B9_1615:	.db $02
B9_1616:		ldx $ec, y		; b6 ec
B9_1618:	.db $04
B9_1619:		ora $02			; 05 02
B9_161b:		ora ($12, x)	; 01 12
B9_161d:	.db $fb
B9_161e:		ora #$b6		; 09 b6
B9_1620:		cpx $0501		; ec 01 05
B9_1623:		ora ($02, x)	; 01 02
B9_1625:	.db $04
B9_1626:		ora $01			; 05 01
B9_1628:	.db $02
B9_1629:	.db $04
B9_162a:	.db $fb
B9_162b:		ora #$b6		; 09 b6
B9_162d:		cpx $0501		; ec 01 05
B9_1630:		ora ($02, x)	; 01 02
B9_1632:	.db $04
B9_1633:		ora $01			; 05 01
B9_1635:	.db $02
B9_1636:	.db $04
B9_1637:		cpx wEntityStructs.tileX.w		; ec 00 04
B9_163a:		ora ($01, x)	; 01 01
B9_163c:	.db $04
B9_163d:	.db $04
B9_163e:		ora ($01, x)	; 01 01
B9_1640:	.db $04
B9_1641:	.db $fb
B9_1642:		ora #$b6		; 09 b6
B9_1644:		cpx $0503		; ec 03 05
B9_1647:	.db $02
B9_1648:	.db $02
B9_1649:		php				; 08 
B9_164a:		cpx $0301		; ec 01 03
B9_164d:		ora ($01, x)	; 01 01
B9_164f:	.db $13
B9_1650:		ora $01			; 05 01
B9_1652:	.db $02
B9_1653:	.db $13
B9_1654:	.db $03
B9_1655:		ora ($01, x)	; 01 01
B9_1657:		ora #$ec		; 09 ec
B9_1659:		.db $00				; 00
B9_165a:	.db $03
B9_165b:		ora ($00, x)	; 01 00
B9_165d:		ora #$ec		; 09 ec
B9_165f:		ora ($05, x)	; 01 05
B9_1661:		ora ($02, x)	; 01 02
B9_1663:	.db $13
B9_1664:	.db $03
B9_1665:		ora ($01, x)	; 01 01
B9_1667:		ora #$ec		; 09 ec
B9_1669:		.db $00				; 00
B9_166a:	.db $03
B9_166b:		ora ($00, x)	; 01 00
B9_166d:		ora #$ec		; 09 ec
B9_166f:		ora ($05, x)	; 01 05
B9_1671:		ora ($02, x)	; 01 02
B9_1673:		ora #$ec		; 09 ec
B9_1675:		.db $00				; 00
B9_1676:	.db $03
B9_1677:		ora ($00, x)	; 01 00
B9_1679:		ora #$fa		; 09 fa
B9_167b:		cpx $0101		; ec 01 01
B9_167e:		asl a			; 0a
B9_167f:	.db $fb
B9_1680:		ora #$b6		; 09 b6
B9_1682:		cpx $0501		; ec 01 05
B9_1685:		ora ($02, x)	; 01 02
B9_1687:	.db $13
B9_1688:		inc $4a01, x	; fe 01 4a
B9_168b:		ldx $fb, y		; b6 fb
B9_168d:		lsr a			; 4a
B9_168e:		ldx $fb, y		; b6 fb
B9_1690:	.db $02
B9_1691:		ldx $fb, y		; b6 fb
B9_1693:		ora #$b6		; 09 b6
B9_1695:		inc $8f01, x	; fe 01 8f
B9_1698:		ldx $fd, y		; b6 fd
B9_169a:		ora ($8c, x)	; 01 8c
B9_169c:		ldx $fc, y		; b6 fc
B9_169e:		lsr a			; 4a
B9_169f:		ldx $f3, y		; b6 f3
B9_16a1:	.db $f2
B9_16a2:	.db $89
B9_16a3:	.db $fb
B9_16a4:	.db $43
B9_16a5:		lda $fb, x		; b5 fb
B9_16a7:	.db $43
B9_16a8:		lda $0e, x		; b5 0e
B9_16aa:		sbc ($0e), y	; f1 0e
B9_16ac:		sbc ($0e), y	; f1 0e
B9_16ae:		ora #$0c		; 09 0c
B9_16b0:		asl $faf2		; 0e f2 fa
B9_16b3:	.db $fb
B9_16b4:		bvs B9_166b ; 70 b5

B9_16b6:	.db $fb
B9_16b7:		lda #$b6		; a9 b6
B9_16b9:	.db $fb
B9_16ba:		adc $fcb5, x	; 7d b5 fc
B9_16bd:		ldx $b6			; a6 b6
B9_16bf:	.db $07
B9_16c0:		rol $3a, x		; 36 3a
B9_16c2:		rol $35, x		; 36 35
B9_16c4:		.db $00				; 00
B9_16c5:		sta $31			; 85 31
B9_16c7:	.db $32
B9_16c8:		.db $00				; 00
B9_16c9:	.db $80
B9_16ca:	.db $04
B9_16cb:		ora ($cf, x)	; 01 cf
B9_16cd:		ldx $ff, y		; b6 ff
B9_16cf:		cpx $ebbb		; ec bb eb
B9_16d2:	.db $83
B9_16d3:		and $02			; 25 02
B9_16d5:		and ($02, x)	; 21 02
B9_16d7:	.db $eb
B9_16d8:		sty $0421		; 8c 21 04
B9_16db:	.db $23
B9_16dc:	.db $03
B9_16dd:	.db $fa
B9_16de:		cpx $fbb8		; ec b8 fb
B9_16e1:		cmp $ecb6, y	; d9 b6 ec
B9_16e4:		ldy $fb, x		; b4 fb
B9_16e6:		cmp $f0b6, y	; d9 b6 f0
B9_16e9:	.db $04
B9_16ea:		ora ($ee, x)	; 01 ee
B9_16ec:		ldx $ff, y		; b6 ff
B9_16ee:		cpx $ebb9		; ec b9 eb
B9_16f1:	.db $8b
B9_16f2:	.db $23
B9_16f3:	.db $03
B9_16f4:	.db $eb
B9_16f5:		sta $2b			; 85 2b
B9_16f7:	.db $07
B9_16f8:		cpx $2bb5		; ec b5 2b
B9_16fb:	.db $07
B9_16fc:		;removed
	.db $f0 $04

B9_16fe:		ora ($06, x)	; 01 06
B9_1700:	.db $b7
B9_1701:		ora $03			; 05 03
B9_1703:		rol $b7			; 26 b7
B9_1705:	.db $ff
B9_1706:		cpx $ebbb		; ec bb eb
B9_1709:	.db $82
B9_170a:		bit $02			; 24 02
B9_170c:		bit $02			; 24 02
B9_170e:		cpx $ebb6		; ec b6 eb
B9_1711:		sty $012c		; 8c 2c 01
B9_1714:		plp				; 28 
B9_1715:	.db $02
B9_1716:		asl $02, x		; 16 02
B9_1718:	.db $14
B9_1719:		ora ($fa, x)	; 01 fa
B9_171b:		cpx $fbb4		; ec b4 fb
B9_171e:	.db $12
B9_171f:	.db $b7
B9_1720:		cpx $fbb2		; ec b2 fb
B9_1723:	.db $12
B9_1724:	.db $b7
B9_1725:		;removed
	.db $f0 $ec

B9_1727:		ora ($16, x)	; 01 16
B9_1729:		ora $ec			; 05 ec
B9_172b:	.db $1c
B9_172c:	.db $13
B9_172d:		asl $15ec		; 0e ec 15
B9_1730:	.db $13
B9_1731:		asl a			; 0a
B9_1732:		;removed
	.db $f0 $04

B9_1734:		ora ($3c, x)	; 01 3c
B9_1736:	.db $b7
B9_1737:		ora $03			; 05 03
B9_1739:		lsr a			; 4a
B9_173a:	.db $b7
B9_173b:	.db $ff
B9_173c:		cpx $ebbd		; ec bd eb
B9_173f:	.db $83
B9_1740:		inc $09, x		; f6 09
B9_1742:		bmi B9_1730 ; 30 ec

B9_1744:		lda $30, x		; b5 30
B9_1746:		cpx $30b2		; ec b2 30
B9_1749:		beq B9_1737 ; f0 ec

B9_174b:		ora ($f9, x)	; 01 f9
B9_174d:		cpy #$26		; c0 26
B9_174f:	.db $03
B9_1750:		bit $f004		; 2c 04 f0
B9_1753:	.db $04
B9_1754:		ora ($5c, x)	; 01 5c
B9_1756:	.db $b7
B9_1757:		ora $03			; 05 03
B9_1759:		jmp ($ffb7)		; 6c b7 ff


B9_175c:		cpx $ebbf		; ec bf eb
B9_175f:	.db $83
B9_1760:		clc				; 18 
B9_1761:		ora $f6			; 05 f6
B9_1763:		asl a			; 0a
B9_1764:	.db $1f
B9_1765:		cpx $1fb7		; ec b7 1f
B9_1768:		cpx $1fb3		; ec b3 1f
B9_176b:		beq B9_1759 ; f0 ec

B9_176d:	.db $03
B9_176e:		asl $ec05, x	; 1e 05 ec
B9_1771:	.db $1f
B9_1772:		inc $0a, x		; f6 0a
B9_1774:		ora $18ec, x	; 1d ec 18
B9_1777:		ora $13ec, x	; 1d ec 13
B9_177a:		ora $04f0, x	; 1d f0 04
B9_177d:		ora ($85, x)	; 01 85
B9_177f:	.db $b7
B9_1780:		ora $03			; 05 03
B9_1782:		tya				; 98 
B9_1783:	.db $b7
B9_1784:	.db $ff
B9_1785:		cpx $ebbd		; ec bd eb
B9_1788:		sta ($28, x)	; 81 28
B9_178a:	.db $03
B9_178b:		sec				; 38 
B9_178c:		php				; 08 
B9_178d:		cpx $ebb4		; ec b4 eb
B9_1790:	.db $8b
B9_1791:		jsr $ec06		; 20 06 ec
B9_1794:	.db $b2
B9_1795:		jsr $f006		; 20 06 f0
B9_1798:		cpx $0c03		; ec 03 0c
B9_179b:		asl a			; 0a
B9_179c:		cpx $0a16		; ec 16 0a
B9_179f:		php				; 08 
B9_17a0:		cpx $0a12		; ec 12 0a
B9_17a3:		php				; 08 
B9_17a4:		beq B9_17aa ; f0 04

B9_17a6:		ora ($aa, x)	; 01 aa
B9_17a8:	.db $b7
B9_17a9:	.db $ff
B9_17aa:		cpx $eb78		; ec 78 eb
B9_17ad:	.db $89
B9_17ae:		inc $01, x		; f6 01
B9_17b0:		bit $26			; 24 26
B9_17b2:		plp				; 28 
B9_17b3:		cpx $24b3		; ec b3 24
B9_17b6:		rol $28			; 26 28
B9_17b8:		;removed
	.db $f0 $04

B9_17ba:		ora ($c2, x)	; 01 c2
B9_17bc:	.db $b7
B9_17bd:		ora $03			; 05 03
B9_17bf:	.db $d3
B9_17c0:	.db $b7
B9_17c1:	.db $ff
B9_17c2:		cpx $eb75		; ec 75 eb
B9_17c5:	.db $8b
B9_17c6:		inc $02, x		; f6 02
B9_17c8:		bit $30			; 24 30
B9_17ca:		bit $30			; 24 30
B9_17cc:	.db $fa
B9_17cd:		cpx $fb72		; ec 72 fb
B9_17d0:		iny				; c8 
B9_17d1:	.db $b7
B9_17d2:		beq B9_17c0 ; f0 ec

B9_17d4:	.db $17
B9_17d5:		inc $02, x		; f6 02
B9_17d7:	.db $07
B9_17d8:		ora #$06		; 09 06
B9_17da:		php				; 08 
B9_17db:	.db $fa
B9_17dc:		cpx $fb13		; ec 13 fb
B9_17df:	.db $d7
B9_17e0:	.db $b7
B9_17e1:		beq B9_17e7 ; f0 04

B9_17e3:		ora ($e7, x)	; 01 e7
B9_17e5:	.db $b7
B9_17e6:	.db $ff
B9_17e7:		cpx $ebbc		; ec bc eb
B9_17ea:	.db $83
B9_17eb:		bit $04			; 24 04
B9_17ed:	.db $32
B9_17ee:	.db $03
B9_17ef:	.db $fa
B9_17f0:		cpx $fbb5		; ec b5 fb
B9_17f3:		sbc #$b7		; e9 b7
B9_17f5:		cpx $32b3		; ec b3 32
B9_17f8:	.db $03
B9_17f9:		beq B9_17ff ; f0 04

B9_17fb:		ora ($ff, x)	; 01 ff
B9_17fd:	.db $b7
B9_17fe:	.db $ff
B9_17ff:		cpx $ebb6		; ec b6 eb
B9_1802:		sta $0326		; 8d 26 03
B9_1805:		inc $0302, x	; fe 02 03
B9_1808:		clv				; b8 
B9_1809:	.db $fa
B9_180a:		cpx $fbb1		; ec b1 fb
B9_180d:	.db $03
B9_180e:		clv				; b8 
B9_180f:		beq B9_1815 ; f0 04

B9_1811:		ora ($15, x)	; 01 15
B9_1813:		clv				; b8 
B9_1814:	.db $ff
B9_1815:		cpx $f6bb		; ec bb f6
B9_1818:		ora ($13, x)	; 01 13
B9_181a:		;removed
	.db $10 $0c

B9_181c:	.db $eb
B9_181d:	.db $8b
B9_181e:	.db $f7
B9_181f:	.db $13
B9_1820:	.db $04
B9_1821:	.db $fa
B9_1822:		cpx $fbb5		; ec b5 fb
B9_1825:	.db $1f
B9_1826:		clv				; b8 
B9_1827:		beq B9_182d ; f0 04

B9_1829:		ora ($2d, x)	; 01 2d
B9_182b:		clv				; b8 
B9_182c:	.db $ff
B9_182d:		cpx $ebba		; ec ba eb
B9_1830:		sty $23			; 84 23
B9_1832:	.db $02
B9_1833:	.db $1f
B9_1834:	.db $02
B9_1835:	.db $eb
B9_1836:		sta $08f6		; 8d f6 08
B9_1839:	.db $1f
B9_183a:		cpx $1fb7		; ec b7 1f
B9_183d:		cpx $1fb5		; ec b5 1f
B9_1840:		cpx $1fb3		; ec b3 1f
B9_1843:		beq B9_1849 ; f0 04

B9_1845:		ora ($49, x)	; 01 49
B9_1847:		clv				; b8 
B9_1848:	.db $ff
B9_1849:		cpx $ebbb		; ec bb eb
B9_184c:		sty $1d			; 84 1d
B9_184e:	.db $02
B9_184f:		ora $eb02, y	; 19 02 eb
B9_1852:		sta $0619		; 8d 19 06
B9_1855:		inc $05, x		; f6 05
B9_1857:		cpx $19b8		; ec b8 19
B9_185a:		cpx $19b5		; ec b5 19
B9_185d:		cpx $19b3		; ec b3 19
B9_1860:		beq B9_1866 ; f0 04

B9_1862:		ora ($66, x)	; 01 66
B9_1864:		clv				; b8 
B9_1865:	.db $ff
B9_1866:		cpx $ebbb		; ec bb eb
B9_1869:		sty $16			; 84 16
B9_186b:	.db $02
B9_186c:	.db $eb
B9_186d:		sty $0616		; 8c 16 06
B9_1870:		inc $05, x		; f6 05
B9_1872:		cpx $16b8		; ec b8 16
B9_1875:		cpx $16b5		; ec b5 16
B9_1878:		cpx $16b3		; ec b3 16
B9_187b:		beq B9_1881 ; f0 04

B9_187d:		ora ($81, x)	; 01 81
B9_187f:		clv				; b8 
B9_1880:	.db $ff
B9_1881:		cpx $13bc		; ec bc 13
B9_1884:		ora ($1f, x)	; 01 1f
B9_1886:	.db $02
B9_1887:		cpx $13b6		; ec b6 13
B9_188a:		ora ($1f, x)	; 01 1f
B9_188c:	.db $03
B9_188d:		cpx $13b5		; ec b5 13
B9_1890:		ora ($1f, x)	; 01 1f
B9_1892:	.db $04
B9_1893:		cpx $13b3		; ec b3 13
B9_1896:		ora ($1f, x)	; 01 1f
B9_1898:	.db $04
B9_1899:		beq B9_189f ; f0 04

B9_189b:		ora ($9f, x)	; 01 9f
B9_189d:		clv				; b8 
B9_189e:	.db $ff
B9_189f:		cpx $393b		; ec 3b 39
B9_18a2:		ora ($ec, x)	; 01 ec
B9_18a4:	.db $32
B9_18a5:		and $f005, y	; 39 05 f0
B9_18a8:	.db $04
B9_18a9:		ora ($ad, x)	; 01 ad
B9_18ab:		clv				; b8 
B9_18ac:	.db $ff
B9_18ad:		inc $01, x		; f6 01
B9_18af:		sbc $ec04, y	; f9 04 ec
B9_18b2:		tsx				; ba 
B9_18b3:	.db $37
B9_18b4:		and $3c3b, y	; 39 3b 3c
B9_18b7:		rol $4340, x	; 3e 40 43
B9_18ba:		eor $43			; 45 43
B9_18bc:		rti				; 40 


B9_18bd:	.db $fa
B9_18be:		cpx $fbb4		; ec b4 fb
B9_18c1:	.db $b3
B9_18c2:		clv				; b8 
B9_18c3:		cpx $fbb1		; ec b1 fb
B9_18c6:	.db $b3
B9_18c7:		clv				; b8 
B9_18c8:		;removed
	.db $f0 $04

B9_18ca:	.db $02
B9_18cb:	.db $1c
B9_18cc:		lda $0305, y	; b9 05 03
B9_18cf:	.db $1c
B9_18d0:		lda $0106, y	; b9 06 01
B9_18d3:	.db $12
B9_18d4:	.db $b9 $07 $00
B9_18d7:		cmp $09b8, x	; dd b8 09
B9_18da:	.db $1c
B9_18db:		lda $eaff, y	; b9 ff ea
B9_18de:		and $b9			; 25 b9
B9_18e0:	.db $e7
B9_18e1:	.db $0c
B9_18e2:	.db $da
B9_18e3:		txa				; 8a 
B9_18e4:	.db $ef
B9_18e5:	.db $23
B9_18e6:	.db $0c
B9_18e7:		inc $03, x		; f6 03
B9_18e9:	.db $27
B9_18ea:		plp				; 28 
B9_18eb:		rol a			; 2a
B9_18ec:	.db $2b
B9_18ed:		rol $332f		; 2e 2f 33
B9_18f0:	.db $34
B9_18f1:		rol $37, x		; 36 37
B9_18f3:	.db $3a
B9_18f4:	.db $f7
B9_18f5:		sbc $03, x		; f5 03
B9_18f7:	.db $3b
B9_18f8:		asl $03ed, x	; 1e ed 03
B9_18fb:		clc				; 18 
B9_18fc:	.db $ef
B9_18fd:	.db $3c
B9_18fe:	.db $04
B9_18ff:	.db $3b
B9_1900:	.db $04
B9_1901:	.db $3a
B9_1902:	.db $04
B9_1903:		sbc $0c, x		; f5 0c
B9_1905:		rol $30, x		; 36 30
B9_1907:	.db $fa
B9_1908:		sbc $0c03		; ed03 0c
B9_190b:	.db $fb
B9_190c:	.db $fc
B9_190d:		clv				; b8 
B9_190e:		sbc $6409		; ed09 64
B9_1911:		beq B9_18fd ; f0 ea

B9_1913:	.db $34
B9_1914:		lda $82f8, y	; b9 f8 82
B9_1917:		sbc ($0d), y	; f1 0d
B9_1919:	.db $fc
B9_191a:		cpx #$b8		; e0 b8
B9_191c:		sbc ($27), y	; f1 27
B9_191e:		sbc ($4e), y	; f1 4e
B9_1920:		sbc ($6c), y	; f1 6c
B9_1922:		sbc ($66), y	; f1 66
B9_1924:		beq B9_1931 ; f0 0b

B9_1926:	.db $37
B9_1927:		sec				; 38 
B9_1928:		and $3b3a, y	; 39 3a 3b
B9_192b:	.db $3c
B9_192c:	.db $3d $3e $00
B9_192f:	.db $80
B9_1930:	.db $32
B9_1931:	.db $37
B9_1932:		.db $00				; 00
B9_1933:	.db $80
B9_1934:		ora $34			; 05 34
B9_1936:		and $00, x		; 35 00
B9_1938:	.db $80
B9_1939:	.db $34
B9_193a:		.db $00				; 00
B9_193b:	.db $80
B9_193c:	.db $07
B9_193d:		ora ($41, x)	; 01 41
B9_193f:		lda $ecff, y	; b9 ff ec
B9_1942:		sec				; 38 
B9_1943:	.db $eb
B9_1944:		sta $05f6		; 8d f6 05
B9_1947:	.db $0c
B9_1948:		asl $1110		; 0e 10 11
B9_194b:	.db $13
B9_194c:		ora $17, x		; 15 17
B9_194e:	.db $fa
B9_194f:		cpx $eb39		; ec 39 eb
B9_1952:		sty $03f6		; 8c f6 03
B9_1955:		sbc $fb0c, y	; f9 0c fb
B9_1958:	.db $47
B9_1959:		lda $3aec, y	; b9 ec 3a
B9_195c:		inc $02, x		; f6 02
B9_195e:		sbc $eb18, y	; f9 18 eb
B9_1961:	.db $8b
B9_1962:	.db $fb
B9_1963:	.db $47
B9_1964:		lda $34ec, y	; b9 ec 34
B9_1967:	.db $fb
B9_1968:	.db $47
B9_1969:		lda $07f0, y	; b9 f0 07
B9_196c:		ora ($7a, x)	; 01 7a
B9_196e:	.db $b9 $06 $00
B9_1971:	.db $74
B9_1972:		lda $f1ff, y	; b9 ff f1
B9_1975:		ora ($f9, x)	; 01 f9
B9_1977:	.db $f4
B9_1978:		sed				; f8 
B9_1979:		sty $ec			; 84 ec
B9_197b:	.db $7c
B9_197c:		inc $03, x		; f6 03
B9_197e:	.db $34
B9_197f:		cpx $357a		; ec 7a 35
B9_1982:		cpx $3778		; ec 78 37
B9_1985:		cpx $3976		; ec 76 39
B9_1988:		cpx $3b74		; ec 74 3b
B9_198b:		cpx $3c72		; ec 72 3c
B9_198e:		cpx $3474		; ec 74 34
B9_1991:		and $ec, x		; 35 ec
B9_1993:	.db $73
B9_1994:	.db $37
B9_1995:		and $72ec, y	; 39 ec 72
B9_1998:	.db $3b
B9_1999:	.db $3c
B9_199a:		cpx $3471		; ec 71 34
B9_199d:		and $37, x		; 35 37
B9_199f:		and $3c3b, y	; 39 3b 3c
B9_19a2:		beq B9_19ab ; f0 07

B9_19a4:		ora ($a8, x)	; 01 a8
B9_19a6:		lda $ecff, y	; b9 ff ec
B9_19a9:		sei				; 78 
B9_19aa:	.db $eb
B9_19ab:		sta $1f			; 85 1f
B9_19ad:		asl a			; 0a
B9_19ae:		cpx $1f74		; ec 74 1f
B9_19b1:		asl a			; 0a
B9_19b2:		cpx $1f72		; ec 72 1f
B9_19b5:		asl a			; 0a
B9_19b6:		beq B9_19b8 ; f0 00

B9_19b8:		.db $00				; 00
B9_19b9:	.db $cb
B9_19ba:		lda $0101, y	; b9 01 01
B9_19bd:	.db $da
B9_19be:		lda $0202, y	; b9 02 02
B9_19c1:		sbc ($b9), y	; f1 b9
B9_19c3:	.db $03
B9_19c4:	.db $03
B9_19c5:		sbc ($b9), y	; f1 b9
B9_19c7:		php				; 08 
B9_19c8:		sbc ($b9), y	; f1 b9
B9_19ca:	.db $ff
B9_19cb:		sbc ($08), y	; f1 08
B9_19cd:		sed				; f8 
B9_19ce:		sta ($ec, x)	; 81 ec
B9_19d0:	.db $b3
B9_19d1:	.db $fb
B9_19d2:	.db $dc
B9_19d3:		lda $b1ec, y	; b9 ec b1
B9_19d6:	.db $fb
B9_19d7:	.db $dc
B9_19d8:		lda $ecf0, y	; b9 f0 ec
B9_19db:		tsx				; ba 
B9_19dc:		inc $03, x		; f6 03
B9_19de:		rol $2b			; 26 2b
B9_19e0:		and $322f		; 2d 2f 32
B9_19e3:	.db $37
B9_19e4:		and $fa3b, y	; 39 3b fa
B9_19e7:		cpx $fbb2		; ec b2 fb
B9_19ea:	.db $dc
B9_19eb:		lda $b1ec, y	; b9 ec b1
B9_19ee:	.db $fb
B9_19ef:	.db $dc
B9_19f0:		lda $01f1, y	; b9 f1 01
B9_19f3:		;removed
	.db $f0 $04

B9_19f5:		ora ($f9, x)	; 01 f9
B9_19f7:		lda $ecff, y	; b9 ff ec
B9_19fa:		sec				; 38 
B9_19fb:	.db $eb
B9_19fc:		sta $f6			; 85 f6
B9_19fe:	.db $02
B9_19ff:	.db $2b
B9_1a00:		cpx $2b35		; ec 35 2b
B9_1a03:		;removed
	.db $f0 $06

B9_1a05:		ora ($09, x)	; 01 09
B9_1a07:		tsx				; ba 
B9_1a08:	.db $ff
B9_1a09:		cpx $eb38		; ec 38 eb
B9_1a0c:		stx $34			; 86 34
B9_1a0e:	.db $02
B9_1a0f:	.db $33
B9_1a10:	.db $14
B9_1a11:		cpx $3332		; ec 32 33
B9_1a14:	.db $14
B9_1a15:		;removed
	.db $f0 $06

B9_1a17:		ora ($1b, x)	; 01 1b
B9_1a19:		tsx				; ba 
B9_1a1a:	.db $ff
B9_1a1b:		cpx $ebb9		; ec b9 eb
B9_1a1e:		stx $11f6		; 8e f6 11
B9_1a21:		ora $ec, x		; 15 ec
B9_1a23:	.db $b7
B9_1a24:		ora $ec, x		; 15 ec
B9_1a26:		lda $15, x		; b5 15
B9_1a28:		cpx $15b3		; ec b3 15
B9_1a2b:		beq B9_1a33 ; f0 06

B9_1a2d:		ora ($31, x)	; 01 31
B9_1a2f:		tsx				; ba 
B9_1a30:	.db $ff
B9_1a31:	.db $eb
B9_1a32:		txa				; 8a 
B9_1a33:		cpx $f6b9		; ec b9 f6
B9_1a36:	.db $02
B9_1a37:	.db $32
B9_1a38:	.db $37
B9_1a39:		and $3e3b, y	; 39 3b 3e
B9_1a3c:	.db $43
B9_1a3d:		eor $47			; 45 47
B9_1a3f:	.db $fa
B9_1a40:		cpx $fbb4		; ec b4 fb
B9_1a43:	.db $37
B9_1a44:		tsx				; ba 
B9_1a45:		cpx $fbb2		; ec b2 fb
B9_1a48:	.db $37
B9_1a49:		tsx				; ba 
B9_1a4a:		beq B9_1a52 ; f0 06

B9_1a4c:		ora ($50, x)	; 01 50
B9_1a4e:		tsx				; ba 
B9_1a4f:	.db $ff
B9_1a50:	.db $fc
B9_1a51:	.db $33
B9_1a52:		tsx				; ba 
B9_1a53:	.db $04
B9_1a54:		ora ($58, x)	; 01 58
B9_1a56:		tsx				; ba 
B9_1a57:	.db $ff
B9_1a58:		cpx $eb3a		; ec 3a eb
B9_1a5b:		txa				; 8a 
B9_1a5c:		and ($03), y	; 31 03
B9_1a5e:		bmi B9_1a6d ; 30 0d

B9_1a60:		cpx $3533		; ec 33 35
B9_1a63:		ora $04f0		; 0d f0 04
B9_1a66:		ora ($6a, x)	; 01 6a
B9_1a68:		tsx				; ba 
B9_1a69:	.db $ff
B9_1a6a:		cpx $eb77		; ec 77 eb
B9_1a6d:		sty $042c		; 8c 2c 04
B9_1a70:		;removed
	.db $30 $02

B9_1a72:		cpx $2c33		; ec 33 2c
B9_1a75:	.db $04
B9_1a76:		bmi B9_1a7a ; 30 02

B9_1a78:		;removed
	.db $f0 $04

B9_1a7a:		ora ($82, x)	; 01 82
B9_1a7c:		tsx				; ba 
B9_1a7d:		ora $03			; 05 03
B9_1a7f:		sta $ba, x		; 95 ba
B9_1a81:	.db $ff
B9_1a82:		cpx $ebbf		; ec bf eb
B9_1a85:		sta ($22, x)	; 81 22
B9_1a87:	.db $03
B9_1a88:		rol a			; 2a
B9_1a89:		php				; 08 
B9_1a8a:	.db $eb
B9_1a8b:	.db $83
B9_1a8c:	.db $1a
B9_1a8d:		asl $fa			; 06 fa
B9_1a8f:		cpx $fbb4		; ec b4 fb
B9_1a92:		sty $ba			; 84 ba
B9_1a94:		beq B9_1a82 ; f0 ec

B9_1a96:	.db $1c
B9_1a97:	.db $0c
B9_1a98:	.db $02
B9_1a99:	.db $0f
B9_1a9a:	.db $02
B9_1a9b:	.db $0c
B9_1a9c:	.db $02
B9_1a9d:		cpx $0816		; ec 16 08
B9_1aa0:	.db $03
B9_1aa1:		asl a			; 0a
B9_1aa2:	.db $0c
B9_1aa3:		cpx $0812		; ec 12 08
B9_1aa6:	.db $03
B9_1aa7:		asl a			; 0a
B9_1aa8:	.db $0c
B9_1aa9:		beq B9_1aaf ; f0 04

B9_1aab:		ora ($af, x)	; 01 af
B9_1aad:		tsx				; ba 
B9_1aae:	.db $ff
B9_1aaf:		cpx $ebbe		; ec be eb
B9_1ab2:	.db $83
B9_1ab3:		jsr $ec04		; 20 04 ec
B9_1ab6:		lda $8deb, y	; b9 eb 8d
B9_1ab9:		bpl B9_1ad3 ; 10 18

B9_1abb:		cpx $10b2		; ec b2 10
B9_1abe:		clc				; 18 
B9_1abf:		beq B9_1ac1 ; f0 00

B9_1ac1:		.db $00				; 00
B9_1ac2:	.db $d4
B9_1ac3:		tsx				; ba 
B9_1ac4:		ora ($01, x)	; 01 01
B9_1ac6:	.db $d7
B9_1ac7:		tsx				; ba 
B9_1ac8:	.db $02
B9_1ac9:	.db $02
B9_1aca:	.db $d4
B9_1acb:		tsx				; ba 
B9_1acc:	.db $03
B9_1acd:	.db $03
B9_1ace:		cpx $ba			; e4 ba
B9_1ad0:		php				; 08 
B9_1ad1:	.db $d4
B9_1ad2:		tsx				; ba 
B9_1ad3:	.db $ff
B9_1ad4:		sbc ($01), y	; f1 01
B9_1ad6:		beq B9_1ac3 ; f0 eb

B9_1ad8:	.db $83
B9_1ad9:		cpx $1fb6		; ec b6 1f
B9_1adc:	.db $04
B9_1add:		rol $08			; 26 08
B9_1adf:		cpx $26b2		; ec b2 26
B9_1ae2:		php				; 08 
B9_1ae3:		;removed
	.db $f0 $f6

B9_1ae5:		ora ($ec, x)	; 01 ec
B9_1ae7:	.db $1a
B9_1ae8:	.db $0c
B9_1ae9:		ora $0f0e		; 0d 0e 0f
B9_1aec:		cpx $0c18		; ec 18 0c
B9_1aef:	.db $0b
B9_1af0:		asl a			; 0a
B9_1af1:		ora #$08		; 09 08
B9_1af3:		ora #$07		; 09 07
B9_1af5:		ora #$0b		; 09 0b
B9_1af7:		ora #$0a		; 09 0a
B9_1af9:		ora #$fa		; 09 fa
B9_1afb:		cpx $fb12		; ec 12 fb
B9_1afe:		inc $f0ba		; ee ba f0
B9_1b01:	.db $04
B9_1b02:		ora ($0a, x)	; 01 0a
B9_1b04:	.db $bb
B9_1b05:		ora $03			; 05 03
B9_1b07:	.db $1b
B9_1b08:	.db $bb
B9_1b09:	.db $ff
B9_1b0a:		cpx $ebbf		; ec bf eb
B9_1b0d:	.db $83
B9_1b0e:		and $05			; 25 05
B9_1b10:		cpx $eb79		; ec 79 eb
B9_1b13:		sta $26			; 85 26
B9_1b15:		ora $73ec		; 0d ec 73
B9_1b18:		rol $0d			; 26 0d
B9_1b1a:		beq B9_1b08 ; f0 ec

B9_1b1c:		clc				; 18 
B9_1b1d:		inc $01, x		; f6 01
B9_1b1f:		asl a			; 0a
B9_1b20:	.db $0b
B9_1b21:	.db $0c
B9_1b22:		ora $ec0e		; 0d 0e ec
B9_1b25:		ora $f6, x		; 15 f6
B9_1b27:		ora $ec08		; 0d 08 ec
B9_1b2a:	.db $12
B9_1b2b:		php				; 08 
B9_1b2c:		beq B9_1b32 ; f0 04

B9_1b2e:	.db $03
B9_1b2f:	.db $32
B9_1b30:	.db $bb
B9_1b31:	.db $ff
B9_1b32:		inc $02, x		; f6 02
B9_1b34:		cpx $081a		; ec 1a 08
B9_1b37:		cpx $081b		; ec 1b 08
B9_1b3a:		cpx $081c		; ec 1c 08
B9_1b3d:		cpx $081d		; ec 1d 08
B9_1b40:		cpx $081e		; ec 1e 08
B9_1b43:		inc $04, x		; f6 04
B9_1b45:	.db $0c
B9_1b46:		cpx $0c18		; ec 18 0c
B9_1b49:		cpx $0814		; ec 14 08
B9_1b4c:		cpx $0c13		; ec 13 0c
B9_1b4f:		beq B9_1b55 ; f0 04

B9_1b51:		ora ($55, x)	; 01 55
B9_1b53:	.db $bb
B9_1b54:	.db $ff
B9_1b55:		cpx $303f		; ec 3f 30
B9_1b58:		ora ($ec, x)	; 01 ec
B9_1b5a:	.db $3b
B9_1b5b:		;removed
	.db $30 $05

B9_1b5d:		cpx $3c3f		; ec 3f 3c
B9_1b60:	.db $02
B9_1b61:		cpx $3c38		; ec 38 3c
B9_1b64:		asl a			; 0a
B9_1b65:		cpx $3038		; ec 38 30
B9_1b68:		ora ($ec, x)	; 01 ec
B9_1b6a:	.db $34
B9_1b6b:		;removed
	.db $30 $05

B9_1b6d:		cpx $3c38		; ec 38 3c
B9_1b70:	.db $02
B9_1b71:		cpx $3c33		; ec 33 3c
B9_1b74:		asl a			; 0a
B9_1b75:		cpx $3034		; ec 34 30
B9_1b78:		ora ($ec, x)	; 01 ec
B9_1b7a:	.db $32
B9_1b7b:		;removed
	.db $30 $05

B9_1b7d:		cpx $3c34		; ec 34 3c
B9_1b80:	.db $02
B9_1b81:		cpx $3c31		; ec 31 3c
B9_1b84:		asl a			; 0a
B9_1b85:		beq B9_1b8b ; f0 04

B9_1b87:		ora ($8b, x)	; 01 8b
B9_1b89:	.db $bb
B9_1b8a:	.db $ff
B9_1b8b:		cpx $eb7c		; ec 7c eb
B9_1b8e:		sta $0a0c		; 8d 0c 0a
B9_1b91:	.db $eb
B9_1b92:		php				; 08 
B9_1b93:		and ($02, x)	; 21 02
B9_1b95:	.db $17
B9_1b96:	.db $04
B9_1b97:	.db $fa
B9_1b98:		cpx $fb73		; ec 73 fb
B9_1b9b:		sta $f0bb		; 8d bb f0
B9_1b9e:	.db $07
B9_1b9f:		ora ($a3, x)	; 01 a3
B9_1ba1:	.db $bb
B9_1ba2:	.db $ff
B9_1ba3:		cpx $f67c		; ec 7c f6
B9_1ba6:	.db $02
B9_1ba7:	.db $eb
B9_1ba8:		txa				; 8a 
B9_1ba9:		bmi B9_1bdd ; 30 32

B9_1bab:	.db $34
B9_1bac:		and $37, x		; 35 37
B9_1bae:		and $fa3b, y	; 39 3b fa
B9_1bb1:		cpx $fb75		; ec 75 fb
B9_1bb4:		lda #$bb		; a9 bb
B9_1bb6:		cpx $fb72		; ec 72 fb
B9_1bb9:		lda #$bb		; a9 bb
B9_1bbb:		beq B9_1bc1 ; f0 04

B9_1bbd:		ora ($c1, x)	; 01 c1
B9_1bbf:	.db $bb
B9_1bc0:	.db $ff
B9_1bc1:		cpx $eb38		; ec 38 eb
B9_1bc4:		sty $f6			; 84 f6
B9_1bc6:	.db $02
B9_1bc7:		and #$ec		; 29 ec
B9_1bc9:		and $29, x		; 35 29
B9_1bcb:		;removed
	.db $f0

.ifdef ROM_JP
	clc
	jsr $bc0a
	lda #$10
	sta $1a
	lda #$d3
.endif

B9_1bcc:		sta $1b
B9_1bce:		lda #$d7		; a9 d7
B9_1bd0:		sta $1c			; 85 1c
B9_1bd2:		lda #$db		; a9 db
B9_1bd4:		sta $1d			; 85 1d
B9_1bd6:		lda #$5d		; a9 5d
B9_1bd8:		jmp setGlobalFlag		; 4c f0 e7


B9_1bdb:		lda $1a			; a5 1a
B9_1bdd:		ora #$02		; 09 02
B9_1bdf:		sta $1a			; 85 1a
B9_1be1:		lda #$00		; a9 00
B9_1be3:		sta $14			; 85 14
B9_1be5:		lda #$40		; a9 40
B9_1be7:		sta $1c			; 85 1c
B9_1be9:		jsr $bc0a		; 20 0a bc
B9_1bec:		lda $11			; a5 11
B9_1bee:		sta $00			; 85 00
B9_1bf0:		lda $10			; a5 10
B9_1bf2:		asl $00			; 06 00
B9_1bf4:		rol a			; 2a
B9_1bf5:		and #$03		; 29 03
B9_1bf7:		tay				; a8 
B9_1bf8:		lda $bbfe, y	; b9 fe bb
B9_1bfb:		jmp updateEntity_wOam		; 4c 67 f5


B9_1bfe:	.db $af
B9_1bff:		;removed
	.db $b0 $b2

B9_1c01:		bcs B9_1ba8 ; b0 a5

B9_1c03:	.db $17
B9_1c04:		clc				; 18 
B9_1c05:		adc #$10		; 69 10
B9_1c07:		sta $17			; 85 17
B9_1c09:		rts				; 60 


B9_1c0a:		lda $17			; a5 17
B9_1c0c:		sec				; 38 
B9_1c0d:		sbc #$10		; e9 10
B9_1c0f:		sta $17			; 85 17
B9_1c11:		rts				; 60 


B9_1c12:		jsr $81c2		; 20 c2 81
B9_1c15:		bit wEntityStructs.byteA.w		; 2c 0a 04
B9_1c18:		bvc B9_1c1f ; 50 05

B9_1c1a:		lda #$00		; a9 00
B9_1c1c:		sta $19			; 85 19
B9_1c1e:		rts				; 60 


B9_1c1f:		ldx #$0a		; a2 0a
B9_1c21:		lda #$c8		; a9 c8
B9_1c23:		jsr func_13ef		; 20 ef f3
B9_1c26:		lda $19			; a5 19
B9_1c28:		and #$04		; 29 04
B9_1c2a:		bne B9_1c34 ; d0 08

B9_1c2c:		jsr $8225		; 20 25 82
B9_1c2f:		lda #$08		; a9 08
B9_1c31:		jsr $8214		; 20 14 82
B9_1c34:		lda #$01		; a9 01
B9_1c36:		jsr func_1888		; 20 88 f8
B9_1c39:		lda #$01		; a9 01
B9_1c3b:		jsr func_1aac		; 20 ac fa
B9_1c3e:		bcs B9_1c51 ; b0 11

B9_1c40:		lda $1f			; a5 1f
B9_1c42:		bpl B9_1c51 ; 10 0d

B9_1c44:		jsr $8824		; 20 24 88
B9_1c47:		lda #$26		; a9 26
B9_1c49:		jsr $8033		; 20 33 80
B9_1c4c:		lda #$00		; a9 00
B9_1c4e:		sta $19			; 85 19
B9_1c50:		rts				; 60 


B9_1c51:		lda $19			; a5 19
B9_1c53:		and #$04		; 29 04
B9_1c55:		beq B9_1c65 ; f0 0e

B9_1c57:		lda $015a		; ad 5a 01
B9_1c5a:		and #$0c		; 29 0c
B9_1c5c:		lsr a			; 4a
B9_1c5d:		lsr a			; 4a
B9_1c5e:		tay				; a8 
B9_1c5f:		lda $bc7a, y	; b9 7a bc
B9_1c62:		jmp updateEntity_wOam		; 4c 67 f5


B9_1c65:		lda $11			; a5 11
B9_1c67:		sta $00			; 85 00
B9_1c69:		lda $10			; a5 10
B9_1c6b:		asl $00			; 06 00
B9_1c6d:		rol a			; 2a
B9_1c6e:		asl $00			; 06 00
B9_1c70:		rol a			; 2a
B9_1c71:		and #$03		; 29 03
B9_1c73:		tay				; a8 
B9_1c74:		lda $bc7a, y	; b9 7a bc
B9_1c77:		jmp updateEntity_wOam		; 4c 67 f5


B9_1c7a:		ldy $aead		; ac ad ae
B9_1c7d:		lda $19a5		; ad a5 19
B9_1c80:		and #$02		; 29 02
B9_1c82:		bne B9_1c88 ; d0 04

B9_1c84:		lda #$06		; a9 06
B9_1c86:		bne B9_1c8a ; d0 02

B9_1c88:		lda #$fa		; a9 fa
B9_1c8a:		sta $00			; 85 00
B9_1c8c:		lda #$00		; a9 00
B9_1c8e:		sta $01			; 85 01
B9_1c90:		jsr $8714		; 20 14 87
B9_1c93:		bcs B9_1ca4 ; b0 0f

B9_1c95:		jsr $86fe		; 20 fe 86
B9_1c98:		bcs B9_1ca4 ; b0 0a

B9_1c9a:		lda #$0e		; a9 0e
B9_1c9c:		jsr $bca9		; 20 a9 bc
B9_1c9f:		lda #$b3		; a9 b3
B9_1ca1:		jmp updateEntity_wOam		; 4c 67 f5


B9_1ca4:		lda #$00		; a9 00
B9_1ca6:		sta $19			; 85 19
B9_1ca8:		rts				; 60 


B9_1ca9:		lda #$14		; a9 14
B9_1cab:		sta $00			; 85 00
B9_1cad:		lda #$08		; a9 08
B9_1caf:		sta $01			; 85 01
B9_1cb1:		lda $0507		; ad 07 05
B9_1cb4:		sta $02			; 85 02
B9_1cb6:		lda $0506		; ad 06 05
B9_1cb9:		sta $03			; 85 03
B9_1cbb:		lda #$83		; a9 83
B9_1cbd:		jmp $8847		; 4c 47 88


B9_1cc0:		jmp $94da		; 4c da 94


B9_1cc3:		jsr $81c2		; 20 c2 81
B9_1cc6:		lda $015a		; ad 5a 01
B9_1cc9:		and #$07		; 29 07
B9_1ccb:		bne B9_1ce4 ; d0 17

B9_1ccd:		inc $1b			; e6 1b
B9_1ccf:		lda $1b			; a5 1b
B9_1cd1:		and #$07		; 29 07
B9_1cd3:		cmp #$04		; c9 04
B9_1cd5:		bcc B9_1cdf ; 90 08

B9_1cd7:		cmp #$07		; c9 07
B9_1cd9:		beq B9_1cdf ; f0 04

B9_1cdb:		lda #$08		; a9 08
B9_1cdd:		bne B9_1ce1 ; d0 02

B9_1cdf:		lda #$00		; a9 00
B9_1ce1:		jsr $8214		; 20 14 82
B9_1ce4:		ldx #$0c		; a2 0c
B9_1ce6:		lda #$c0		; a9 c0
B9_1ce8:		jsr func_13ef		; 20 ef f3
B9_1ceb:		lda $14			; a5 14
B9_1ced:		beq B9_1cfa ; f0 0b

B9_1cef:		jsr $81ea		; 20 ea 81
B9_1cf2:		jsr $8225		; 20 25 82
B9_1cf5:		lda #$08		; a9 08
B9_1cf7:		jsr $8214		; 20 14 82
B9_1cfa:		lda #$03		; a9 03
B9_1cfc:		jsr func_1888		; 20 88 f8
B9_1cff:		lda #$03		; a9 03
B9_1d01:		jsr func_1aac		; 20 ac fa
B9_1d04:		lda #$03		; a9 03
B9_1d06:		jsr func_1745		; 20 45 f7
B9_1d09:		bcc B9_1d14 ; 90 09

B9_1d0b:		lda $1f			; a5 1f
B9_1d0d:		bpl B9_1d14 ; 10 05

B9_1d0f:		lda #$27		; a9 27
B9_1d11:		jmp $8033		; 4c 33 80


B9_1d14:		lda $1b			; a5 1b
B9_1d16:		and #$07		; 29 07
B9_1d18:		tay				; a8 
B9_1d19:		lda $bd1f, y	; b9 1f bd
B9_1d1c:		jmp updateEntity_wOam		; 4c 67 f5


B9_1d1f:	.db $d2
B9_1d20:	.db $d3
B9_1d21:	.db $d4
B9_1d22:		cmp $d5, x		; d5 d5
B9_1d24:	.db $d4
B9_1d25:	.db $d3
B9_1d26:	.db $d2
B9_1d27:		jsr $81c2		; 20 c2 81
B9_1d2a:		bit $1a			; 24 1a
B9_1d2c:		bmi B9_1d32 ; 30 04

B9_1d2e:		lda #$08		; a9 08
B9_1d30:		bne B9_1d34 ; d0 02

B9_1d32:		lda #$f8		; a9 f8
B9_1d34:		sta $15			; 85 15
B9_1d36:		dec $1c			; c6 1c
B9_1d38:		bne B9_1d44 ; d0 0a

B9_1d3a:		lda $1a			; a5 1a
B9_1d3c:		eor #$80		; 49 80
B9_1d3e:		sta $1a			; 85 1a
B9_1d40:		lda #$40		; a9 40
B9_1d42:		sta $1c			; 85 1c
B9_1d44:		ldx #$0a		; a2 0a
B9_1d46:		lda #$80		; a9 80
B9_1d48:		jsr func_13ef		; 20 ef f3
B9_1d4b:		lda #$02		; a9 02
B9_1d4d:		jsr func_1888		; 20 88 f8
B9_1d50:		lda #$02		; a9 02
B9_1d52:		jsr func_1aac		; 20 ac fa
B9_1d55:		lda #$02		; a9 02
B9_1d57:		jsr func_1745		; 20 45 f7
B9_1d5a:		bcc B9_1d65 ; 90 09

B9_1d5c:		lda $1f			; a5 1f
B9_1d5e:		bpl B9_1d65 ; 10 05

B9_1d60:		lda #$27		; a9 27
B9_1d62:		jmp $8033		; 4c 33 80


B9_1d65:		ldy #$00		; a0 00
B9_1d67:		bit $15			; 24 15
B9_1d69:		bmi B9_1d6f ; 30 04

B9_1d6b:		ldy #$01		; a0 01
B9_1d6d:		bne B9_1d74 ; d0 05

B9_1d6f:		bit $13			; 24 13
B9_1d71:		bvc B9_1d74 ; 50 01

B9_1d73:		iny				; c8 
B9_1d74:		lda $bd7a, y	; b9 7a bd
B9_1d77:		jmp updateEntity_wOam		; 4c 67 f5


B9_1d7a:		dec $d7, x		; d6 d7
B9_1d7c:		jsr $81c2		; 20 c2 81
B9_1d7f:		ldx #$0c		; a2 0c
B9_1d81:		lda #$c0		; a9 c0
B9_1d83:		jsr func_13ef		; 20 ef f3
B9_1d86:		lda $0509		; ad 09 05
B9_1d89:		and #$04		; 29 04
B9_1d8b:		beq B9_1da6 ; f0 19

B9_1d8d:		lda #$08		; a9 08
B9_1d8f:		sta $00			; 85 00
B9_1d91:		lda #$40		; a9 40
B9_1d93:		sta $01			; 85 01
B9_1d95:		jsr func_1a95		; 20 95 fa
B9_1d98:		bcs B9_1da6 ; b0 0c

B9_1d9a:		lda $0507		; ad 07 05
B9_1d9d:		cmp $17			; c5 17
B9_1d9f:		bcs B9_1da6 ; b0 05

B9_1da1:		lda #$20		; a9 20
B9_1da3:		jsr $8033		; 20 33 80
B9_1da6:		lda #$00		; a9 00
B9_1da8:		jsr func_1888		; 20 88 f8
B9_1dab:		lda #$00		; a9 00
B9_1dad:		jsr func_1745		; 20 45 f7
B9_1db0:		bcc B9_1db4 ; 90 02

B9_1db2:		inc $1f			; e6 1f
B9_1db4:		ldy #$00		; a0 00
B9_1db6:		ldx wEntityWramOffset.w		; ae 5b 01
B9_1db9:		lda $0309, x	; bd 09 03
B9_1dbc:		and #$04		; 29 04
B9_1dbe:		beq B9_1dc1 ; f0 01

B9_1dc0:		iny				; c8 
B9_1dc1:		lda $bdc7, y	; b9 c7 bd
B9_1dc4:		jmp updateEntity_wOam		; 4c 67 f5


B9_1dc7:		cld				; d8 
B9_1dc8:		cmp $c220, y	; d9 20 c2
B9_1dcb:		sta ($a2, x)	; 81 a2
B9_1dcd:		;removed
	.db $10 $a9

B9_1dcf:		cpy #$20		; c0 20
B9_1dd1:	.db $ef
B9_1dd2:	.db $f3
B9_1dd3:		bit $1a			; 24 1a
B9_1dd5:		bpl B9_1df2 ; 10 1b

B9_1dd7:		dec $1c			; c6 1c
B9_1dd9:		bne B9_1de4 ; d0 09

B9_1ddb:		lda $1a			; a5 1a
B9_1ddd:		and #$7f		; 29 7f
B9_1ddf:		sta $1a			; 85 1a
B9_1de1:		jmp $bdf2		; 4c f2 bd


B9_1de4:		lda $1c			; a5 1c
B9_1de6:		cmp #$10		; c9 10
B9_1de8:		bne B9_1def ; d0 05

B9_1dea:		lda #$55		; a9 55
B9_1dec:		jsr $8033		; 20 33 80
B9_1def:		jmp $be16		; 4c 16 be


B9_1df2:		jsr $89ce		; 20 ce 89
B9_1df5:		lda $00			; a5 00
B9_1df7:		cmp #$08		; c9 08
B9_1df9:		bcc B9_1dfe ; 90 03

B9_1dfb:		jsr $8a12		; 20 12 8a
B9_1dfe:		ldx #$70		; a2 70
B9_1e00:		lda wEntityStructs.byte9.w, x	; bd 09 04
B9_1e03:		bne B9_1e16 ; d0 11

B9_1e05:		lda $015a		; ad 5a 01
B9_1e08:		and #$7f		; 29 7f
B9_1e0a:		bne B9_1e16 ; d0 0a

B9_1e0c:		lda $1a			; a5 1a
B9_1e0e:		ora #$80		; 09 80
B9_1e10:		sta $1a			; 85 1a
B9_1e12:		lda #$20		; a9 20
B9_1e14:		sta $1c			; 85 1c
B9_1e16:		lda #$05		; a9 05
B9_1e18:		jsr func_1888		; 20 88 f8
B9_1e1b:		lda #$05		; a9 05
B9_1e1d:		jsr func_1aac		; 20 ac fa
B9_1e20:		lda #$05		; a9 05
B9_1e22:		jsr func_1745		; 20 45 f7
B9_1e25:		bcc B9_1e30 ; 90 09

B9_1e27:		lda $1f			; a5 1f
B9_1e29:		bpl B9_1e30 ; 10 05

B9_1e2b:		lda #$27		; a9 27
B9_1e2d:		jmp $8033		; 4c 33 80


B9_1e30:		bit $1a			; 24 1a
B9_1e32:		bpl B9_1e38 ; 10 04

B9_1e34:		ldy #$02		; a0 02
B9_1e36:		bne B9_1e42 ; d0 0a

B9_1e38:		ldy #$00		; a0 00
B9_1e3a:		lda $015a		; ad 5a 01
B9_1e3d:		and #$08		; 29 08
B9_1e3f:		bne B9_1e42 ; d0 01

B9_1e41:		iny				; c8 
B9_1e42:		lda $be48, y	; b9 48 be
B9_1e45:		jmp updateEntity_wOam		; 4c 67 f5


B9_1e48:	.db $dc
B9_1e49:		cmp $20de, x	; dd de 20
B9_1e4c:	.db $c2
B9_1e4d:		sta ($a2, x)	; 81 a2
B9_1e4f:	.db $0c
B9_1e50:		lda #$c0		; a9 c0
B9_1e52:		jsr func_13ef		; 20 ef f3
B9_1e55:		jsr $89ce		; 20 ce 89
B9_1e58:		lda $00			; a5 00
B9_1e5a:		cmp #$10		; c9 10
B9_1e5c:		bcc B9_1e61 ; 90 03

B9_1e5e:		jsr $8a12		; 20 12 8a
B9_1e61:		lda #$0c		; a9 0c
B9_1e63:		jsr $8214		; 20 14 82
B9_1e66:		lda #$00		; a9 00
B9_1e68:		jsr func_1888		; 20 88 f8
B9_1e6b:		lda #$00		; a9 00
B9_1e6d:		jsr func_1aac		; 20 ac fa
B9_1e70:		lda #$00		; a9 00
B9_1e72:		jsr func_1745		; 20 45 f7
B9_1e75:		bcc B9_1e80 ; 90 09

B9_1e77:		lda $1f			; a5 1f
B9_1e79:		bpl B9_1e80 ; 10 05

B9_1e7b:		lda #$27		; a9 27
B9_1e7d:		jmp $8033		; 4c 33 80


B9_1e80:		ldy #$00		; a0 00
B9_1e82:		lda $015a		; ad 5a 01
B9_1e85:		and #$08		; 29 08
B9_1e87:		bne B9_1e8a ; d0 01

B9_1e89:		iny				; c8 
B9_1e8a:		lda $be90, y	; b9 90 be
B9_1e8d:		jmp updateEntity_wOam		; 4c 67 f5


B9_1e90:	.db $df
B9_1e91:		cpx #$a5		; e0 a5
B9_1e93:	.db $1a
B9_1e94:		bpl B9_1e99 ; 10 03

B9_1e96:		jmp $9561		; 4c 61 95


B9_1e99:		jsr $81c2		; 20 c2 81
B9_1e9c:		ldx #$0a		; a2 0a
B9_1e9e:		lda #$00		; a9 00
B9_1ea0:		jsr func_13ef		; 20 ef f3
B9_1ea3:		lda $015a		; ad 5a 01
B9_1ea6:		and #$01		; 29 01
B9_1ea8:		bne B9_1ee2 ; d0 38

B9_1eaa:		inc $1d			; e6 1d
B9_1eac:		lda $1d			; a5 1d
B9_1eae:		and #$3f		; 29 3f
B9_1eb0:		sta $00			; 85 00
B9_1eb2:		lda $19			; a5 19
B9_1eb4:		and #$02		; 29 02
B9_1eb6:		beq B9_1ec0 ; f0 08

B9_1eb8:		lda $00			; a5 00
B9_1eba:		eor #$ff		; 49 ff
B9_1ebc:		sta $00			; 85 00
B9_1ebe:		inc $00			; e6 00
B9_1ec0:		lda #$00		; a9 00
B9_1ec2:		sta $01			; 85 01
B9_1ec4:		lda $00			; a5 00
B9_1ec6:		jsr $8604		; 20 04 86
B9_1ec9:		lda $19			; a5 19
B9_1ecb:		and #$02		; 29 02
B9_1ecd:		bne B9_1ed7 ; d0 08

B9_1ecf:		lda $01			; a5 01
B9_1ed1:		clc				; 18 
B9_1ed2:		adc #$04		; 69 04
B9_1ed4:		jmp $bedc		; 4c dc be


B9_1ed7:		lda $01			; a5 01
B9_1ed9:		sec				; 38 
B9_1eda:		sbc #$04		; e9 04
B9_1edc:		sta $14			; 85 14
B9_1ede:		lda $02			; a5 02
B9_1ee0:		sta $15			; 85 15
B9_1ee2:		lda #$02		; a9 02
B9_1ee4:		jsr func_1888		; 20 88 f8
B9_1ee7:		lda #$02		; a9 02
B9_1ee9:		jsr func_1aac		; 20 ac fa
B9_1eec:		lda #$02		; a9 02
B9_1eee:		jsr func_1745		; 20 45 f7
B9_1ef1:		bcc B9_1efc ; 90 09

B9_1ef3:		lda $1f			; a5 1f
B9_1ef5:		bpl B9_1efc ; 10 05

B9_1ef7:		lda #$27		; a9 27
B9_1ef9:		jmp $8033		; 4c 33 80


B9_1efc:		ldy #$00		; a0 00
B9_1efe:		lda $015a		; ad 5a 01
B9_1f01:		and #$08		; 29 08
B9_1f03:		bne B9_1f06 ; d0 01

B9_1f05:		iny				; c8 
B9_1f06:		lda $bf0c, y	; b9 0c bf
B9_1f09:		jmp updateEntity_wOam		; 4c 67 f5


B9_1f0c:		sbc ($e2, x)	; e1 e2
B9_1f0e:		jmp $9561		; 4c 61 95


B9_1f11:		jmp $94da		; 4c da 94


B9_1f14:		jsr $81c2		; 20 c2 81
B9_1f17:		ldx #$0a		; a2 0a
B9_1f19:		lda #$c0		; a9 c0
B9_1f1b:		jsr func_13ef		; 20 ef f3
B9_1f1e:		jsr $8225		; 20 25 82
B9_1f21:		lda $19			; a5 19
B9_1f23:		and #$04		; 29 04
B9_1f25:		bne B9_1f35 ; d0 0e

B9_1f27:		lda $015a		; ad 5a 01
B9_1f2a:		and #$7f		; 29 7f
B9_1f2c:		bne B9_1f35 ; d0 07

B9_1f2e:		jsr $8a12		; 20 12 8a
B9_1f31:		lda #$c0		; a9 c0
B9_1f33:		sta $15			; 85 15
B9_1f35:		lda #$10		; a9 10
B9_1f37:		jsr $8214		; 20 14 82
B9_1f3a:		lda #$02		; a9 02
B9_1f3c:		jsr func_1888		; 20 88 f8
B9_1f3f:		lda #$02		; a9 02
B9_1f41:		jsr func_1aac		; 20 ac fa
B9_1f44:		lda #$02		; a9 02
B9_1f46:		jsr func_1745		; 20 45 f7
B9_1f49:		bcc B9_1f54 ; 90 09

B9_1f4b:		lda $1f			; a5 1f
B9_1f4d:		bpl B9_1f54 ; 10 05

B9_1f4f:		lda #$27		; a9 27
B9_1f51:		jmp $8033		; 4c 33 80


B9_1f54:		ldy #$00		; a0 00
B9_1f56:		lda $19			; a5 19
B9_1f58:		and #$04		; 29 04
B9_1f5a:		bne B9_1f61 ; d0 05

B9_1f5c:		bit $11			; 24 11
B9_1f5e:		bvs B9_1f61 ; 70 01

B9_1f60:		iny				; c8 
B9_1f61:		lda $bf67, y	; b9 67 bf
B9_1f64:		jmp updateEntity_wOam		; 4c 67 f5


B9_1f67:	.db $eb
B9_1f68:		nop				; ea