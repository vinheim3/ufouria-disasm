;OR14



B14_0000:		cmp $1a20, x	; dd 20 1a
B14_0003:	.db $da
B14_0004:	.db $df
B14_0005:		;removed
	.db $f0 $02

B14_0007:	.db $ff
B14_0008:	.db $fe $af $00
B14_000b:		.db $00				; 00
B14_000c:		.db $00				; 00
B14_000d:		.db $00				; 00
B14_000e:	.db $ff
B14_000f:	.db $ff
B14_0010:		;removed
	.db $50 $a0

B14_0012:	.db $0f
B14_0013:	.db $ff
B14_0014:	.db $f2
B14_0015:		;removed
	.db $f0 $05

B14_0017:		sbc $af20, x	; fd 20 af
B14_001a:		eor $f00f, x	; 5d 0f f0
B14_001d:		.db $00				; 00
B14_001e:	.db $ef
B14_001f:	.db $ef
B14_0020:	.db $ff
B14_0021:		.db $00				; 00
B14_0022:	.db $1a
B14_0023:	.db $20 $ff $00
B14_0026:		asl a			; 0a
B14_0027:	.db $ff
B14_0028:	.db $2f
B14_0029:		nop				; ea 
B14_002a:		.db $00				; 00
B14_002b:		.db $00				; 00
B14_002c:		.db $00				; 00
B14_002d:		.db $00				; 00
B14_002e:	.db $ff
B14_002f:	.db $ff
B14_0030:		lda $50			; a5 50
B14_0032:	.db $5f
B14_0033:	.db $ff
B14_0034:		inc $1f00		; ee 00 1f
B14_0037:		inc $ff00, x	; fe 00 ff
B14_003a:	.db $52
B14_003b:		sbc $0500, x	; fd 00 05
B14_003e:	.db $ff
B14_003f:	.db $ff
B14_0040:	.db $ff
B14_0041:		.db $00				; 00
B14_0042:	.db $02
B14_0043:		ldy #$ff		; a0 ff
B14_0045:		.db $00				; 00
B14_0046:	.db $0f
B14_0047:		beq B14_0068 ; f0 1f

B14_0049:		sbc ($00), y	; f1 00
B14_004b:		.db $00				; 00
B14_004c:		.db $00				; 00
B14_004d:	.db $0f
B14_004e:	.db $ff
B14_004f:	.db $fd $0a $00
B14_0052:	.db $ff
B14_0053:	.db $ff
B14_0054:	.db $ef
B14_0055:		.db $00				; 00
B14_0056:	.db $1f
B14_0057:		sbc $01, x		; f5 01
B14_0059:		sbc $ff50, x	; fd 50 ff
B14_005c:		.db $00				; 00
B14_005d:		ora $ffff		; 0d ff ff
B14_0060:		beq B14_0082 ; f0 20

B14_0062:		rol a			; 2a
B14_0063:		;removed
	.db $50 $ff

B14_0065:		.db $00				; 00
B14_0066:	.db $0f
B14_0067:	.db $fa
B14_0068:	.db $0e $f0 $00
B14_006b:		.db $00				; 00
B14_006c:		.db $00				; 00
B14_006d:	.db $0f
B14_006e:	.db $ff
B14_006f:		sbc $0215, x	; fd 15 02
B14_0072:	.db $ff
B14_0073:	.db $ff
B14_0074:		dec $2f00, x	; de 00 2f
B14_0077:		sbc ($0d), y	; f1 0d
B14_0079:		sbc $ff20		; ed20 ff
B14_007c:		.db $00				; 00
B14_007d:	.db $0f
B14_007e:	.db $ff
B14_007f:	.db $ff
B14_0080:		beq B14_0082 ; f0 00

B14_0082:		tax				; aa 
B14_0083:		;removed
	.db $10 $ff

B14_0085:		.db $00				; 00
B14_0086:	.db $0f
B14_0087:	.db $fa
B14_0088:	.db $0f
B14_0089:		beq B14_008b ; f0 00

B14_008b:		.db $00				; 00
B14_008c:		.db $00				; 00
B14_008d:	.db $ff
B14_008e:	.db $ff
B14_008f:		lda ($22, x)	; a1 22
B14_0091:		ora $ffff		; 0d ff ff
B14_0094:		tax				; aa 
B14_0095:		.db $00				; 00
B14_0096:	.db $df
B14_0097:		bne B14_00c7 ; d0 2e

B14_0099:		sbc $ff11		; ed11 ff
B14_009c:		.db $00				; 00
B14_009d:	.db $0f
B14_009e:	.db $ff
B14_009f:	.db $ff
B14_00a0:		sbc ($00), y	; f1 00
B14_00a2:		ora $02			; 05 02
B14_00a4:	.db $ff
B14_00a5:		.db $00				; 00
B14_00a6:	.db $2f
B14_00a7:		sbc ($2f), y	; f1 2f
B14_00a9:		bvc B14_00ab ; 50 00

B14_00ab:		.db $00				; 00
B14_00ac:		.db $00				; 00
B14_00ad:	.db $ff
B14_00ae:	.db $ff
B14_00af:		bne B14_0102 ; d0 51

B14_00b1:	.db $1a
B14_00b2:	.db $ff
B14_00b3:	.db $ff
B14_00b4:		;removed
	.db $d0 $02

B14_00b6:	.db $ef
B14_00b7:		lda ($5a, x)	; a1 5a
B14_00b9:		sbc $fd0e		; ed0e fd
B14_00bc:		.db $00				; 00
B14_00bd:	.db $0f
B14_00be:	.db $ff
B14_00bf:	.db $ff
B14_00c0:		beq B14_00c2 ; f0 00

B14_00c2:	.db $12
B14_00c3:	.db $1a
B14_00c4:		sbc $00, x		; f5 00
B14_00c6:	.db $ef
B14_00c7:		cmp ($ad), y	; d1 ad
B14_00c9:	.db $20 $00 $00
B14_00cc:		.db $00				; 00
B14_00cd:	.db $ff
B14_00ce:	.db $ff
B14_00cf:		sbc ($10), y	; f1 10
B14_00d1:		lsr $ffff, x	; 5e ff ff
B14_00d4:		and ($05, x)	; 21 05
B14_00d6:		cmp $5d51, x	; dd 51 5d
B14_00d9:		tax				; aa 
B14_00da:	.db $5d $e5 $00
B14_00dd:	.db $af
B14_00de:	.db $ff
B14_00df:	.db $ff
B14_00e0:		bne B14_00e2 ; d0 00

B14_00e2:	.db $02
B14_00e3:		lsr $02d1, x	; 5e d1 02
B14_00e6:		inc $d2aa, x	; fe aa d2
B14_00e9:	.db $20 $00 $00
B14_00ec:		ora $ff			; 05 ff
B14_00ee:	.db $ff
B14_00ef:		cmp ($02), y	; d1 02
B14_00f1:	.db $af
B14_00f2:	.db $ff
B14_00f3:		sbc $2a10, x	; fd 10 2a
B14_00f6:		cmp $ad2a, x	; dd 2a ad
B14_00f9:		lda $ae			; a5 ae
B14_00fb:	.db $d2
B14_00fc:	.db $02
B14_00fd:		dec $ffff, x	; de ff ff
B14_0100:		ldy #$00		; a0 00
B14_0102:	.db $22
B14_0103:		ldx $2aa2		; ae a2 2a
B14_0106:		sbc $d2aa		; edaa d2
B14_0109:		bpl B14_010b ; 10 00

B14_010b:		.db $00				; 00
B14_010c:		ora $ffff		; 0d ff ff
B14_010f:		eor ($05), y	; 51 05
B14_0111:	.db $5f
B14_0112:	.db $ff
B14_0113:		nop				; ea 
B14_0114:		bvc B14_0140 ; 50 2a

B14_0116:	.db $da
B14_0117:		tax				; aa 
B14_0118:		lda $da55		; ad 55 da
B14_011b:		lda $05			; a5 05
B14_011d:		ldx $ffff		; ae ff ff
B14_0120:		and ($00, x)	; 21 00
B14_0122:	.db $22
B14_0123:		lda $2d51		; ad 51 2d
B14_0126:		lda $a55a		; ad 5a a5
B14_0129:		.db $00				; 00
B14_012a:		.db $00				; 00
B14_012b:		.db $00				; 00
B14_012c:	.db $2f
B14_012d:	.db $ff
B14_012e:		sbc $1151, x	; fd 51 11
B14_0131:	.db $af
B14_0132:	.db $ff
B14_0133:		cmp $22, x		; d5 22
B14_0135:		eor $5a, x		; 55 5a
B14_0137:		tax				; aa 
B14_0138:		cmp $5a, x		; d5 5a
B14_013a:	.db $da
B14_013b:	.db $52
B14_013c:	.db $52
B14_013d:		cmp $faff, x	; dd ff fa
B14_0140:		bvc B14_0152 ; 50 10

B14_0142:	.db $22
B14_0143:		cmp $25, x		; d5 25
B14_0145:		eor $aa, x		; 55 aa
B14_0147:	.db $da
B14_0148:		ldx #$10		; a2 10
B14_014a:		.db $00				; 00
B14_014b:		.db $00				; 00
B14_014c:		ldx $fdff		; ae ff fd
B14_014f:		and $15			; 25 15
B14_0151:	.db $af
B14_0152:		inc $a2ea		; ee ea a2
B14_0155:		tax				; aa 
B14_0156:		tax				; aa 
B14_0157:		tax				; aa 
B14_0158:		cmp $5a, x		; d5 5a
B14_015a:	.db $da
B14_015b:	.db $52
B14_015c:		eor $ae, x		; 55 ae
B14_015e:	.db $ff
B14_015f:		sbc $1022		; ed22 10
B14_0162:		and $52			; 25 52
B14_0164:	.db $52
B14_0165:		cmp $aa, x		; d5 aa
B14_0167:	.db $da
B14_0168:		eor ($01), y	; 51 01
B14_016a:		.db $00				; 00
B14_016b:		ora ($5e, x)	; 01 5e
B14_016d:		inc $a5ee, x	; fe ee a5
B14_0170:		rol a			; 2a
B14_0171:		dec $eaee, x	; de ee ea
B14_0174:	.db $52
B14_0175:		tax				; aa 
B14_0176:		tax				; aa 
B14_0177:		tax				; aa 
B14_0178:		cmp $5a, x		; d5 5a
B14_017a:		cmp $25, x		; d5 25
B14_017c:		eor $af, x		; 55 af
B14_017e:	.db $ef
B14_017f:	.db $da
B14_0180:		eor ($10), y	; 51 10
B14_0182:	.db $52
B14_0183:	.db $52
B14_0184:		eor $55, x		; 55 55
B14_0186:		tax				; aa 
B14_0187:		cmp $22, x		; d5 22
B14_0189:		jsr $0210		; 20 10 02
B14_018c:		cmp $edde, x	; dd de ed
B14_018f:		eor $2d, x		; 55 2d
B14_0191:		ldx $d5ee		; ae ee d5
B14_0194:		eor $2a, x		; 55 2a
B14_0196:		tax				; aa 
B14_0197:		tax				; aa 
B14_0198:		cmp $aa, x		; d5 aa
B14_019a:		cmp $25, x		; d5 25
B14_019c:	.db $5a
B14_019d:		cmp $adef, x	; dd ef ad
B14_01a0:	.db $22
B14_01a1:		eor ($12), y	; 51 12
B14_01a3:	.db $52
B14_01a4:		eor $55, x		; 55 55
B14_01a6:		tax				; aa 
B14_01a7:		cmp $11, x		; d5 11
B14_01a9:		;removed
	.db $10 $01

B14_01ab:		ora $ae			; 05 ae
B14_01ad:		inc $55dd		; ee dd 55
B14_01b0:	.db $5a
B14_01b1:		cmp $adda, x	; dd da ad
B14_01b4:		eor $2a, x		; 55 2a
B14_01b6:		tax				; aa 
B14_01b7:		tax				; aa 
B14_01b8:		cmp $ad, x		; d5 ad
B14_01ba:		eor $25, x		; 55 25
B14_01bc:		tax				; aa 
B14_01bd:		inc $aaef		; ee ef aa
B14_01c0:	.db $52
B14_01c1:		and $22			; 25 22
B14_01c3:	.db $52
B14_01c4:		eor $55, x		; 55 55
B14_01c6:		tax				; aa 
B14_01c7:		tax				; aa 
B14_01c8:		eor ($01), y	; 51 01
B14_01ca:		ora ($12, x)	; 01 12
B14_01cc:	.db $da
B14_01cd:		inc $adda		; ee da ad
B14_01d0:		eor $daad, x	; 5d ad da
B14_01d3:		tax				; aa 
B14_01d4:		tax				; aa 
B14_01d5:		tax				; aa 
B14_01d6:		tax				; aa 
B14_01d7:		lda $aa55		; ad 55 aa
B14_01da:	.db $d2
B14_01db:		tax				; aa 
B14_01dc:		lda $faae		; ad ae fa
B14_01df:		cmp $25, x		; d5 25
B14_01e1:		and $22			; 25 22
B14_01e3:	.db $52
B14_01e4:		eor $55, x		; 55 55
B14_01e6:		tax				; aa 
B14_01e7:		lda $22			; a5 22
B14_01e9:		and ($01, x)	; 21 01
B14_01eb:		and $ad			; 25 ad
B14_01ed:		ldx $adda		; ae da ad
B14_01f0:		lda $d5ae		; ad ae d5
B14_01f3:		tax				; aa 
B14_01f4:		tax				; aa 
B14_01f5:		tax				; aa 
B14_01f6:		tax				; aa 
B14_01f7:		lda $aa55		; ad 55 aa
B14_01fa:		tax				; aa 
B14_01fb:		tax				; aa 
B14_01fc:		lda $aedd		; ad dd ae
B14_01ff:		tax				; aa 
B14_0200:		lda $25			; a5 25
B14_0202:	.db $22
B14_0203:	.db $52
B14_0204:		eor $55, x		; 55 55
B14_0206:		tax				; aa 
B14_0207:		lda $11			; a5 11
B14_0209:		bpl B14_022d ; 10 22

B14_020b:		rol a			; 2a
B14_020c:	.db $da
B14_020d:	.db $da
B14_020e:		cmp $ad, x		; d5 ad
B14_0210:		ldx $d5da		; ae da d5
B14_0213:		tax				; aa 
B14_0214:		tax				; aa 
B14_0215:		tax				; aa 
B14_0216:		tax				; aa 
B14_0217:		lda $aa5a		; ad 5a aa
B14_021a:		tax				; aa 
B14_021b:		tax				; aa 
B14_021c:	.db $da
B14_021d:		cmp $aada, x	; dd da aa
B14_0220:	.db $52
B14_0221:		eor $12, x		; 55 12
B14_0223:	.db $52
B14_0224:		lda $55			; a5 55
B14_0226:		eor $52, x		; 55 52
B14_0228:		and $02			; 25 02
B14_022a:	.db $22
B14_022b:		eor $5a, x		; 55 5a
B14_022d:	.db $da
B14_022e:		cmp $ad, x		; d5 ad
B14_0230:	.db $da
B14_0231:	.db $da
B14_0232:		cmp $aa, x		; d5 aa
B14_0234:		tax				; aa 
B14_0235:		tax				; aa 
B14_0236:		tax				; aa 
B14_0237:		lda $aa5a		; ad 5a aa
B14_023a:		tax				; aa 
B14_023b:		tax				; aa 
B14_023c:	.db $da
B14_023d:		sbc $a5ad		; edad a5
B14_0240:	.db $52
B14_0241:	.db $52
B14_0242:	.db $52
B14_0243:	.db $52
B14_0244:		lda $55			; a5 55
B14_0246:		eor $25, x		; 55 25
B14_0248:	.db $22
B14_0249:		and ($22, x)	; 21 22
B14_024b:		tax				; aa 
B14_024c:		lda $d55a		; ad 5a d5
B14_024f:		ldx $dada		; ae da da
B14_0252:		cmp $aa, x		; d5 aa
B14_0254:		tax				; aa 
B14_0255:		tax				; aa 
B14_0256:		tax				; aa 
B14_0257:		cmp $5a, x		; d5 5a
B14_0259:		tax				; aa 
B14_025a:		tax				; aa 
B14_025b:		tax				; aa 
B14_025c:	.db $da
B14_025d:		sbc $55ad		; edad 55
B14_0260:		rol a			; 2a
B14_0261:	.db $52
B14_0262:	.db $52
B14_0263:	.db $52
B14_0264:		lda $55			; a5 55
B14_0266:		eor $25, x		; 55 25
B14_0268:		ora ($11), y	; 11 11
B14_026a:		and $2a			; 25 2a
B14_026c:		cmp $5a, x		; d5 5a
B14_026e:	.db $da
B14_026f:	.db $da
B14_0270:	.db $da
B14_0271:	.db $da
B14_0272:		cmp $aa, x		; d5 aa
B14_0274:		tax				; aa 
B14_0275:		tax				; aa 
B14_0276:		lda $5a55		; ad 55 5a
B14_0279:		tax				; aa 
B14_027a:		tax				; aa 
B14_027b:		lda $adad		; ad ad ad
B14_027e:		lda $a552		; ad 52 a5
B14_0281:	.db $52
B14_0282:	.db $52
B14_0283:	.db $52
B14_0284:		tax				; aa 
B14_0285:		eor $52, x		; 55 52
B14_0287:	.db $52
B14_0288:		and $11			; 25 11
B14_028a:		and $55			; 25 55
B14_028c:		eor $aa, x		; 55 aa
B14_028e:	.db $da
B14_028f:	.db $da
B14_0290:		sbc $d5aa		; edaa d5
B14_0293:		tax				; aa 
B14_0294:		tax				; aa 
B14_0295:		tax				; aa 
B14_0296:		lda $aa55		; ad 55 aa
B14_0299:		tax				; aa 
B14_029a:		tax				; aa 
B14_029b:		lda $adad		; ad ad ad
B14_029e:		tax				; aa 
B14_029f:		tax				; aa 
B14_02a0:		lda $2a			; a5 2a
B14_02a2:	.db $52
B14_02a3:	.db $52
B14_02a4:		tax				; aa 
B14_02a5:		eor $52, x		; 55 52
B14_02a7:		eor ($22), y	; 51 22
B14_02a9:		and $25			; 25 25
B14_02ab:		eor $5a, x		; 55 5a
B14_02ad:		tax				; aa 
B14_02ae:	.db $da
B14_02af:		cmp $aaad, x	; dd ad aa
B14_02b2:		cmp $aa, x		; d5 aa
B14_02b4:		tax				; aa 
B14_02b5:		tax				; aa 
B14_02b6:		cmp $55, x		; d5 55
B14_02b8:		tax				; aa 
B14_02b9:		tax				; aa 
B14_02ba:		tax				; aa 
B14_02bb:		cmp $ad, x		; d5 ad
B14_02bd:		lda $aaaa		; ad aa aa
B14_02c0:		eor $25, x		; 55 25
B14_02c2:	.db $52
B14_02c3:	.db $52
B14_02c4:		tax				; aa 
B14_02c5:		eor $25, x		; 55 25
B14_02c7:		and $12			; 25 12
B14_02c9:		and $2a			; 25 2a
B14_02cb:		tax				; aa 
B14_02cc:		tax				; aa 
B14_02cd:		lda $adad		; ad ad ad
B14_02d0:		lda $d5aa		; ad aa d5
B14_02d3:		tax				; aa 
B14_02d4:		tax				; aa 
B14_02d5:		tax				; aa 
B14_02d6:		cmp $55, x		; d5 55
B14_02d8:		tax				; aa 
B14_02d9:		tax				; aa 
B14_02da:		tax				; aa 
B14_02db:	.db $da
B14_02dc:	.db $da
B14_02dd:		lda $a5aa		; ad aa a5
B14_02e0:	.db $52
B14_02e1:		lda $2a			; a5 2a
B14_02e3:	.db $52
B14_02e4:		tax				; aa 
B14_02e5:		eor $25, x		; 55 25
B14_02e7:	.db $22
B14_02e8:		eor ($25), y	; 51 25
B14_02ea:		rol a			; 2a
B14_02eb:		tax				; aa 
B14_02ec:		tax				; aa 
B14_02ed:		cmp $ad, x		; d5 ad
B14_02ef:		lda $aaad		; ad ad aa
B14_02f2:		cmp $aa, x		; d5 aa
B14_02f4:		tax				; aa 
B14_02f5:		lda $5a55		; ad 55 5a
B14_02f8:		tax				; aa 
B14_02f9:		tax				; aa 
B14_02fa:		lda $da5a		; ad 5a da
B14_02fd:		lda $5555		; ad 55 55
B14_0300:	.db $52
B14_0301:		lda $2a			; a5 2a
B14_0303:	.db $52
B14_0304:		tax				; aa 
B14_0305:	.db $52
B14_0306:		ldx #$52		; a2 52
B14_0308:		and $25			; 25 25
B14_030a:		rol a			; 2a
B14_030b:		tax				; aa 
B14_030c:		tax				; aa 
B14_030d:	.db $da
B14_030e:		lda $adda		; ad da ad
B14_0311:		lda $aa55		; ad 55 aa
B14_0314:		tax				; aa 
B14_0315:		lda $5a55		; ad 55 5a
B14_0318:		tax				; aa 
B14_0319:		tax				; aa 
B14_031a:		lda $da5a		; ad 5a da
B14_031d:		lda $5555		; ad 55 55
B14_0320:		rol a			; 2a
B14_0321:		eor $25, x		; 55 25
B14_0323:	.db $52
B14_0324:		lda $52			; a5 52
B14_0326:	.db $52
B14_0327:		eor ($25), y	; 51 25
B14_0329:		and $52			; 25 52
B14_032b:		tax				; aa 
B14_032c:		lda $da5a		; ad 5a da
B14_032f:	.db $da
B14_0330:		cmp $ad, x		; d5 ad
B14_0332:		eor $aa, x		; 55 aa
B14_0334:		tax				; aa 
B14_0335:		lda $5a55		; ad 55 5a
B14_0338:		tax				; aa 
B14_0339:		tax				; aa 
B14_033a:		cmp $aa, x		; d5 aa
B14_033c:	.db $da
B14_033d:		lda $5555		; ad 55 55
B14_0340:		rol a			; 2a
B14_0341:	.db $52
B14_0342:		lda $52			; a5 52
B14_0344:		lda $52			; a5 52
B14_0346:		eor ($25), y	; 51 25
B14_0348:	.db $12
B14_0349:		lda $55			; a5 55
B14_034b:		rol a			; 2a
B14_034c:		cmp $aa, x		; d5 aa
B14_034e:	.db $da
B14_034f:	.db $da
B14_0350:	.db $da
B14_0351:		lda $aa55		; ad 55 aa
B14_0354:		tax				; aa 
B14_0355:		cmp $55, x		; d5 55
B14_0357:	.db $5a
B14_0358:		tax				; aa 
B14_0359:		tax				; aa 
B14_035a:		cmp $ad, x		; d5 ad
B14_035c:	.db $5a
B14_035d:		lda $5255		; ad 55 52
B14_0360:		lda $52			; a5 52
B14_0362:		lda $52			; a5 52
B14_0364:		lda $25			; a5 25
B14_0366:		and $22			; 25 22
B14_0368:	.db $52
B14_0369:		lda $55			; a5 55
B14_036b:		eor $55, x		; 55 55
B14_036d:		lda $aaad		; ad ad aa
B14_0370:	.db $da
B14_0371:		lda $aa55		; ad 55 aa
B14_0374:		tax				; aa 
B14_0375:		cmp $55, x		; d5 55
B14_0377:		tax				; aa 
B14_0378:		tax				; aa 
B14_0379:		tax				; aa 
B14_037a:		cmp $ad, x		; d5 ad
B14_037c:	.db $5a
B14_037d:		lda $2a55		; ad 55 2a
B14_0380:		lda $52			; a5 52
B14_0382:		eor $2a, x		; 55 2a
B14_0384:		eor $25, x		; 55 25
B14_0386:	.db $22
B14_0387:	.db $52
B14_0388:	.db $52
B14_0389:		lda $55			; a5 55
B14_038b:		eor $5a, x		; 55 5a
B14_038d:		lda $adad		; ad ad ad
B14_0390:	.db $5a
B14_0391:		lda $aa5a		; ad 5a aa
B14_0394:		tax				; aa 
B14_0395:		cmp $55, x		; d5 55
B14_0397:		tax				; aa 
B14_0398:		tax				; aa 
B14_0399:		lda $ad5a		; ad 5a ad
B14_039c:	.db $5a
B14_039d:		tax				; aa 
B14_039e:		tax				; aa 
B14_039f:		tax				; aa 
B14_03a0:		eor $2a, x		; 55 2a
B14_03a2:		eor $2a, x		; 55 2a
B14_03a4:	.db $52
B14_03a5:	.db $52
B14_03a6:	.db $52
B14_03a7:	.db $52
B14_03a8:	.db $52
B14_03a9:		lda $55			; a5 55
B14_03ab:		eor $5a, x		; 55 5a
B14_03ad:	.db $da
B14_03ae:		cmp $ad, x		; d5 ad
B14_03b0:		tax				; aa 
B14_03b1:		cmp $5a, x		; d5 5a
B14_03b3:		tax				; aa 
B14_03b4:		lda $5a55		; ad 55 5a
B14_03b7:		tax				; aa 
B14_03b8:		tax				; aa 
B14_03b9:		lda $ad5a		; ad 5a ad
B14_03bc:		tax				; aa 
B14_03bd:		tax				; aa 
B14_03be:		tax				; aa 
B14_03bf:		lda $55			; a5 55
B14_03c1:		rol a			; 2a
B14_03c2:		eor $2a, x		; 55 2a
B14_03c4:	.db $52
B14_03c5:	.db $52
B14_03c6:	.db $52
B14_03c7:		and $52			; 25 52
B14_03c9:		lda $55			; a5 55
B14_03cb:		eor $aa, x		; 55 aa
B14_03cd:	.db $da
B14_03ce:	.db $da
B14_03cf:		lda $d5aa		; ad aa d5
B14_03d2:	.db $5a
B14_03d3:		tax				; aa 
B14_03d4:		lda $5a55		; ad 55 5a
B14_03d7:		tax				; aa 
B14_03d8:		tax				; aa 
B14_03d9:		cmp $5a, x		; d5 5a
B14_03db:		cmp $aa, x		; d5 aa
B14_03dd:		tax				; aa 
B14_03de:		tax				; aa 
B14_03df:		lda $52			; a5 52
B14_03e1:		lda $52			; a5 52
B14_03e3:		lda $2a			; a5 2a
B14_03e5:		eor ($25), y	; 51 25
B14_03e7:		and $52			; 25 52
B14_03e9:	.db $5a
B14_03ea:		lda $5a			; a5 5a
B14_03ec:		eor $5a, x		; 55 5a
B14_03ee:		eor $aa, x		; 55 aa
B14_03f0:		lda $55			; a5 55
B14_03f2:	.db $5a
B14_03f3:		lda $aa			; a5 aa
B14_03f5:		eor $5a, x		; 55 5a
B14_03f7:	.db $5a
B14_03f8:		.db $00				; 00
B14_03f9:		.db $00				; 00
B14_03fa:		.db $00				; 00
B14_03fb:		.db $00				; 00
B14_03fc:		.db $00				; 00
B14_03fd:		.db $00				; 00
B14_03fe:		.db $00				; 00
B14_03ff:		.db $00				; 00
B14_0400:		lda $0ad0		; ad d0 0a
B14_0403:	.db $da
B14_0404:	.db $ff
B14_0405:		.db $00				; 00
B14_0406:	.db $1f
B14_0407:	.db $f2
B14_0408:	.db $ff
B14_0409:		beq B14_040b ; f0 00

B14_040b:		.db $00				; 00
B14_040c:		.db $00				; 00
B14_040d:	.db $ff
B14_040e:	.db $fd $05 $00
B14_0411:	.db $ff
B14_0412:	.db $ff
B14_0413:		bne B14_0417 ; d0 02

B14_0415:	.db $ff
B14_0416:		.db $00				; 00
B14_0417:		sbc $ffa0, x	; fd a0 ff
B14_041a:		.db $00				; 00
B14_041b:	.db $5f
B14_041c:	.db $ff
B14_041d:	.db $ff
B14_041e:		.db $00				; 00
B14_041f:		ora $10, x		; 15 10
B14_0421:	.db $ff
B14_0422:		.db $00				; 00
B14_0423:	.db $df
B14_0424:		;removed
	.db $50 $fa

B14_0426:		.db $00				; 00
B14_0427:		.db $00				; 00
B14_0428:		.db $00				; 00
B14_0429:	.db $0f
B14_042a:	.db $ff
B14_042b:		ldx #$50		; a2 50
B14_042d:	.db $2f
B14_042e:	.db $ff
B14_042f:	.db $ff
B14_0430:		.db $00				; 00
B14_0431:	.db $df
B14_0432:		ldy #$5f		; a0 5f
B14_0434:		lda $fd			; a5 fd
B14_0436:		.db $00				; 00
B14_0437:	.db $0f
B14_0438:	.db $ff
B14_0439:	.db $ff
B14_043a:		beq B14_043c ; f0 00

B14_043c:		ldy #$ff		; a0 ff
B14_043e:		.db $00				; 00
B14_043f:		sbc $f0, x		; f5 f0
B14_0441:		sbc $00, x		; f5 00
B14_0443:		.db $00				; 00
B14_0444:		.db $00				; 00
B14_0445:	.db $0f
B14_0446:	.db $ff
B14_0447:		bvc B14_0499 ; 50 50

B14_0449:		asl $ffff		; 0e ff ff
B14_044c:		cpx #$0f		; e0 0f
B14_044e:		sbc $0d			; e5 0d
B14_0450:		nop				; ea 
B14_0451:	.db $2f
B14_0452:		beq B14_0454 ; f0 00

B14_0454:	.db $ff
B14_0455:	.db $ff
B14_0456:		beq B14_04a8 ; f0 50

B14_0458:		lda $0f			; a5 0f
B14_045a:		beq B14_046b ; f0 0f

B14_045c:		ldy #$2e		; a0 2e
B14_045e:		sbc ($00), y	; f1 00
B14_0460:		.db $00				; 00
B14_0461:		.db $00				; 00
B14_0462:	.db $ff
B14_0463:	.db $fa
B14_0464:		ora $00, x		; 15 00
B14_0466:	.db $ff
B14_0467:	.db $ff
B14_0468:		sbc $fe00		; ed00 fe
B14_046b:		bpl B14_046b ; 10 fe

B14_046d:		lda ($ff, x)	; a1 ff
B14_046f:		.db $00				; 00
B14_0470:	.db $0f
B14_0471:	.db $ff
B14_0472:	.db $ff
B14_0473:		ora ($0d, x)	; 01 0d
B14_0475:	.db $20 $ef $00
B14_0478:	.db $af
B14_0479:		beq B14_045a ; f0 df

B14_047b:		.db $00				; 00
B14_047c:		.db $00				; 00
B14_047d:		.db $00				; 00
B14_047e:	.db $0f
B14_047f:	.db $ff
B14_0480:		lda ($20, x)	; a1 20
B14_0482:	.db $5f
B14_0483:	.db $ff
B14_0484:		sbc $5f00, x	; fd 00 5f
B14_0487:		cpx #$5e		; e0 5e
B14_0489:		sbc $1f			; e5 1f
B14_048b:		beq B14_048d ; f0 00

B14_048d:	.db $ff
B14_048e:	.db $ff
B14_048f:		beq B14_04a1 ; f0 10

B14_0491:		cmp ($0f), y	; d1 0f
B14_0493:		beq B14_049f ; f0 0a

B14_0495:		sbc $d00e, x	; fd 0e d0
B14_0498:		.db $00				; 00
B14_0499:		.db $00				; 00
B14_049a:		ora $f0ff		; 0d ff f0
B14_049d:		ora ($0a), y	; 11 0a
B14_049f:	.db $ff
B14_04a0:	.db $ff
B14_04a1:		;removed
	.db $d0 $0a

B14_04a3:		sbc $ee0a, x	; fd 0a ee
B14_04a6:	.db $52
B14_04a7:	.db $ff
B14_04a8:		.db $00				; 00
B14_04a9:	.db $1f
B14_04aa:	.db $ff
B14_04ab:	.db $ff
B14_04ac:		jsr $2202		; 20 02 22
B14_04af:		sbc $ff00, x	; fd 00 ff
B14_04b2:		and $aa			; 25 aa
B14_04b4:		.db $00				; 00
B14_04b5:		.db $00				; 00
B14_04b6:		.db $00				; 00
B14_04b7:		sbc $21ff, x	; fd ff 21
B14_04ba:	.db $02
B14_04bb:	.db $df
B14_04bc:	.db $ff
B14_04bd:	.db $f2
B14_04be:		ora ($de, x)	; 01 de
B14_04c0:		ldx #$da		; a2 da
B14_04c2:	.db $d2
B14_04c3:	.db $df
B14_04c4:		bvc B14_04d0 ; 50 0a

B14_04c6:	.db $ff
B14_04c7:	.db $ff
B14_04c8:		sbc ($00), y	; f1 00
B14_04ca:		ora ($5f), y	; 11 5f
B14_04cc:		jsr $e52f		; 20 2f e5
B14_04cf:		tax				; aa 
B14_04d0:		bvc B14_04d2 ; 50 00

B14_04d2:		.db $00				; 00
B14_04d3:	.db $02
B14_04d4:	.db $ff
B14_04d5:		inc $2e10, x	; fe 10 2e
B14_04d8:	.db $ff
B14_04d9:	.db $ff
B14_04da:		bpl B14_0509 ; 10 2d

B14_04dc:		cmp $55, x		; d5 55
B14_04de:		lda $f25a		; ad 5a f2
B14_04e1:	.db $02
B14_04e2:	.db $df
B14_04e3:	.db $ff
B14_04e4:	.db $ff
B14_04e5:		.db $00				; 00
B14_04e6:		ora ($1a, x)	; 01 1a
B14_04e8:	.db $e2
B14_04e9:		ora $ed, x		; 15 ed
B14_04eb:	.db $5a
B14_04ec:		ldx #$00		; a2 00
B14_04ee:		.db $00				; 00
B14_04ef:		.db $00				; 00
B14_04f0:	.db $ef
B14_04f1:	.db $ff
B14_04f2:		ldx #$05		; a2 05
B14_04f4:	.db $df
B14_04f5:	.db $ff
B14_04f6:		cmp ($05), y	; d1 05
B14_04f8:		lda $aa55		; ad 55 aa
B14_04fb:		cmp $da, x		; d5 da
B14_04fd:		bvc B14_0559 ; 50 5a

B14_04ff:	.db $ff
B14_0500:	.db $ff
B14_0501:		;removed
	.db $d0 $01

B14_0503:		ora $ad			; 05 ad
B14_0505:	.db $12
B14_0506:		ldx $a5ad		; ae ad a5
B14_0509:		bpl B14_050b ; 10 00

B14_050b:		.db $00				; 00
B14_050c:	.db $0f
B14_050d:	.db $ff
B14_050e:		nop				; ea 
B14_050f:		and ($2e, x)	; 21 2e
B14_0511:	.db $ff
B14_0512:	.db $fa
B14_0513:		eor ($2a), y	; 51 2a
B14_0515:		lda $aa5a		; ad 5a aa
B14_0518:		cmp $2a52, x	; dd 52 2a
B14_051b:		dec $faff, x	; de ff fa
B14_051e:		and ($01, x)	; 21 01
B14_0520:		rol a			; 2a
B14_0521:		lda $2d			; a5 2d
B14_0523:	.db $5a
B14_0524:		cmp $22, x		; d5 22
B14_0526:		.db $00				; 00
B14_0527:		.db $00				; 00
B14_0528:		ora $ef			; 05 ef
B14_052a:		inc $25a2, x	; fe a2 25
B14_052d:	.db $ef
B14_052e:		inc $52d2		; ee d2 52
B14_0531:		tax				; aa 
B14_0532:		cmp $aa, x		; d5 aa
B14_0534:	.db $da
B14_0535:		cmp $25, x		; d5 25
B14_0537:		and $ffef		; 2d ef ff
B14_053a:		eor ($10), y	; 51 10
B14_053c:		ora $25, x		; 15 25
B14_053e:		rol a			; 2a
B14_053f:		cmp $ad, x		; d5 ad
B14_0541:	.db $52
B14_0542:		bpl B14_0544 ; 10 00

B14_0544:		.db $00				; 00
B14_0545:	.db $af
B14_0546:	.db $ef
B14_0547:		cmp $25, x		; d5 25
B14_0549:		eor $eade, x	; 5d de ea
B14_054c:		lda $55			; a5 55
B14_054e:		eor $5a, x		; 55 5a
B14_0550:		lda $25ad		; ad ad 25
B14_0553:		eor $af, x		; 55 af
B14_0555:		inc $22ea, x	; fe ea 22
B14_0558:	.db $22
B14_0559:	.db $52
B14_055a:	.db $52
B14_055b:		lda $aa5a		; ad 5a aa
B14_055e:		;removed
	.db $50 $10

B14_0560:		.db $00				; 00
B14_0561:		ora $ee, x		; 15 ee
B14_0563:	.db $fa
B14_0564:		tax				; aa 
B14_0565:	.db $5a
B14_0566:		inc $aaed		; ee ed aa
B14_0569:		eor $55, x		; 55 55
B14_056b:		eor $aa, x		; 55 aa
B14_056d:	.db $da
B14_056e:	.db $d2
B14_056f:		eor $5d, x		; 55 5d
B14_0571:	.db $df
B14_0572:		cmp $2252, x	; dd 52 22
B14_0575:		and $25			; 25 25
B14_0577:		rol a			; 2a
B14_0578:		cmp $aa, x		; d5 aa
B14_057a:		ldx #$20		; a2 20
B14_057c:		;removed
	.db $10 $02

B14_057e:		ldx $daee		; ae ee da
B14_0581:		tax				; aa 
B14_0582:	.db $da
B14_0583:		inc $55d5		; ee d5 55
B14_0586:		eor $55, x		; 55 55
B14_0588:		tax				; aa 
B14_0589:		lda $a5aa		; ad aa a5
B14_058c:	.db $5a
B14_058d:		dec $aafd, x	; de fd aa
B14_0590:	.db $52
B14_0591:		and $22			; 25 22
B14_0593:	.db $52
B14_0594:		lda $a55a		; ad 5a a5
B14_0597:		ora ($00), y	; 11 00
B14_0599:		bpl B14_05f0 ; 10 55

B14_059b:	.db $da
B14_059c:		sbc $ad55		; ed55 ad
B14_059f:	.db $da
B14_05a0:		nop				; ea 
B14_05a1:		cmp $55, x		; d5 55
B14_05a3:		eor $5a, x		; 55 5a
B14_05a5:		tax				; aa 
B14_05a6:	.db $da
B14_05a7:		tax				; aa 
B14_05a8:		eor $ae, x		; 55 ae
B14_05aa:	.db $ef
B14_05ab:		lda $5252		; ad 52 52
B14_05ae:	.db $52
B14_05af:		and $52			; 25 52
B14_05b1:		cmp $55, x		; d5 55
B14_05b3:		eor ($01), y	; 51 01
B14_05b5:		ora ($12, x)	; 01 12
B14_05b7:		lda $adae		; ad ae ad
B14_05ba:		lda $daad		; ad ad da
B14_05bd:		lda $5555		; ad 55 55
B14_05c0:		eor $aa, x		; 55 aa
B14_05c2:		cmp $aa, x		; d5 aa
B14_05c4:		lda $ad			; a5 ad
B14_05c6:		ldx $d5fa		; ae fa d5
B14_05c9:		and $25			; 25 25
B14_05cb:	.db $22
B14_05cc:		eor $55, x		; 55 55
B14_05ce:		eor $52, x		; 55 52
B14_05d0:	.db $22
B14_05d1:		;removed
	.db $10 $11

B14_05d3:		eor $ad, x		; 55 ad
B14_05d5:		tax				; aa 
B14_05d6:	.db $da
B14_05d7:	.db $da
B14_05d8:		sbc $d5aa		; edaa d5
B14_05db:		eor $55, x		; 55 55
B14_05dd:		tax				; aa 
B14_05de:		lda $aa5a		; ad 5a aa
B14_05e1:	.db $5a
B14_05e2:		cmp $eada, x	; dd da ea
B14_05e5:		tax				; aa 
B14_05e6:	.db $52
B14_05e7:	.db $52
B14_05e8:		rol a			; 2a
B14_05e9:		eor $55, x		; 55 55
B14_05eb:	.db $52
B14_05ec:		eor ($10), y	; 51 10
B14_05ee:		and ($25, x)	; 21 25
B14_05f0:		tax				; aa 
B14_05f1:		cmp $ad, x		; d5 ad
B14_05f3:		lda $dada		; ad da da
B14_05f6:		tax				; aa 
B14_05f7:		cmp $55, x		; d5 55
B14_05f9:	.db $5a
B14_05fa:		tax				; aa 
B14_05fb:		cmp $aa, x		; d5 aa
B14_05fd:		tax				; aa 
B14_05fe:		lda $addd		; ad dd ad
B14_0601:		tax				; aa 
B14_0602:	.db $52
B14_0603:		lda $25			; a5 25
B14_0605:		and $55			; 25 55
B14_0607:	.db $52
B14_0608:		lda $11			; a5 11
B14_060a:		ora ($25, x)	; 01 25
B14_060c:		rol a			; 2a
B14_060d:		cmp $5a, x		; d5 5a
B14_060f:	.db $da
B14_0610:		cmp $aaad, x	; dd ad aa
B14_0613:		lda $5a55		; ad 55 5a
B14_0616:		tax				; aa 
B14_0617:		lda $aa5a		; ad 5a aa
B14_061a:		tax				; aa 
B14_061b:		sbc $d5da		; edda d5
B14_061e:		eor $2a, x		; 55 2a
B14_0620:	.db $52
B14_0621:	.db $52
B14_0622:		eor $55, x		; 55 55
B14_0624:		and $22			; 25 22
B14_0626:	.db $22
B14_0627:	.db $12
B14_0628:		eor $55, x		; 55 55
B14_062a:	.db $5a
B14_062b:		lda $daae		; ad ae da
B14_062e:	.db $da
B14_062f:		tax				; aa 
B14_0630:		cmp $55, x		; d5 55
B14_0632:		tax				; aa 
B14_0633:		lda $aa55		; ad 55 aa
B14_0636:		tax				; aa 
B14_0637:	.db $da
B14_0638:		cmp $55ad, x	; dd ad 55
B14_063b:	.db $52
B14_063c:	.db $52
B14_063d:		eor $25, x		; 55 25
B14_063f:		eor $2a, x		; 55 2a
B14_0641:		eor ($21), y	; 51 21
B14_0643:		ora ($25), y	; 11 25
B14_0645:		eor $55, x		; 55 55
B14_0647:		tax				; aa 
B14_0648:		cmp $adad, x	; dd ad ad
B14_064b:		tax				; aa 
B14_064c:		lda $5a55		; ad 55 5a
B14_064f:		tax				; aa 
B14_0650:		cmp $5a, x		; d5 5a
B14_0652:		tax				; aa 
B14_0653:		lda $daae		; ad ae da
B14_0656:		cmp $52, x		; d5 52
B14_0658:		lda $25			; a5 25
B14_065a:	.db $52
B14_065b:		eor $52, x		; 55 52
B14_065d:	.db $52
B14_065e:		eor ($11), y	; 51 11
B14_0660:	.db $12
B14_0661:		lda $55			; a5 55
B14_0663:		tax				; aa 
B14_0664:	.db $da
B14_0665:	.db $da
B14_0666:	.db $da
B14_0667:	.db $da
B14_0668:		tax				; aa 
B14_0669:		cmp $55, x		; d5 55
B14_066b:		tax				; aa 
B14_066c:		lda $aa55		; ad 55 aa
B14_066f:		tax				; aa 
B14_0670:		cmp $aaad, x	; dd ad aa
B14_0673:		tax				; aa 
B14_0674:		lda $52			; a5 52
B14_0676:		eor $25, x		; 55 25
B14_0678:		eor $25, x		; 55 25
B14_067a:	.db $22
B14_067b:		and $11			; 25 11
B14_067d:		rol a			; 2a
B14_067e:		tax				; aa 
B14_067f:		tax				; aa 
B14_0680:		lda $adad		; ad ad ad
B14_0683:		lda $d5aa		; ad aa d5
B14_0686:		eor $5a, x		; 55 5a
B14_0688:		tax				; aa 
B14_0689:		cmp $5a, x		; d5 5a
B14_068b:		tax				; aa 
B14_068c:	.db $da
B14_068d:	.db $da
B14_068e:	.db $da
B14_068f:		tax				; aa 
B14_0690:		tax				; aa 
B14_0691:		eor $25, x		; 55 25
B14_0693:		rol a			; 2a
B14_0694:		eor $2a, x		; 55 2a
B14_0696:		eor ($22), y	; 51 22
B14_0698:		and $15			; 25 15
B14_069a:		rol a			; 2a
B14_069b:		tax				; aa 
B14_069c:		lda $ed5a		; ad 5a ed
B14_069f:		tax				; aa 
B14_06a0:	.db $da
B14_06a1:		lda $5a55		; ad 55 5a
B14_06a4:		tax				; aa 
B14_06a5:		cmp $55, x		; d5 55
B14_06a7:		tax				; aa 
B14_06a8:		lda $adad		; ad ad ad
B14_06ab:		tax				; aa 
B14_06ac:		tax				; aa 
B14_06ad:		eor $2a, x		; 55 2a
B14_06af:	.db $52
B14_06b0:		lda $52			; a5 52
B14_06b2:	.db $52
B14_06b3:		eor ($22), y	; 51 22
B14_06b5:		eor ($52), y	; 51 52
B14_06b7:		tax				; aa 
B14_06b8:		tax				; aa 
B14_06b9:	.db $da
B14_06ba:	.db $da
B14_06bb:	.db $da
B14_06bc:		cmp $aa, x		; d5 aa
B14_06be:		cmp $55, x		; d5 55
B14_06c0:		tax				; aa 
B14_06c1:		lda $5a55		; ad 55 5a
B14_06c4:		tax				; aa 
B14_06c5:	.db $da
B14_06c6:	.db $da
B14_06c7:		cmp $aa, x		; d5 aa
B14_06c9:		eor $52, x		; 55 52
B14_06cb:		eor $2a, x		; 55 2a
B14_06cd:		eor $25, x		; 55 25
B14_06cf:	.db $22
B14_06d0:		eor ($22), y	; 51 22
B14_06d2:		lda $52			; a5 52
B14_06d4:		tax				; aa 
B14_06d5:		cmp $ad, x		; d5 ad
B14_06d7:		lda $5aad		; ad ad 5a
B14_06da:		lda $5a55		; ad 55 5a
B14_06dd:		tax				; aa 
B14_06de:		cmp $5a, x		; d5 5a
B14_06e0:		tax				; aa 
B14_06e1:		cmp $ad, x		; d5 ad
B14_06e3:		lda $5555		; ad 55 55
B14_06e6:	.db $52
B14_06e7:		lda $52			; a5 52
B14_06e9:		lda $2a			; a5 2a
B14_06eb:		eor ($22), y	; 51 22
B14_06ed:		eor ($2a), y	; 51 2a
B14_06ef:		eor $2a, x		; 55 2a
B14_06f1:		lda $daaa		; ad aa da
B14_06f4:	.db $da
B14_06f5:		cmp $aa, x		; d5 aa
B14_06f7:		cmp $5a, x		; d5 5a
B14_06f9:		tax				; aa 
B14_06fa:		lda $aa55		; ad 55 aa
B14_06fd:		lda $5aad		; ad ad 5a
B14_0700:		cmp $55, x		; d5 55
B14_0702:		eor $2a, x		; 55 2a
B14_0704:		eor $25, x		; 55 25
B14_0706:	.db $52
B14_0707:	.db $52
B14_0708:		eor ($22), y	; 51 22
B14_070a:	.db $52
B14_070b:		lda $55			; a5 55
B14_070d:		and $da5a		; 2d 5a da
B14_0710:	.db $da
B14_0711:		lda $ad5a		; ad 5a ad
B14_0714:		eor $aa, x		; 55 aa
B14_0716:		lda $5a55		; ad 55 5a
B14_0719:		tax				; aa 
B14_071a:	.db $da
B14_071b:	.db $da
B14_071c:		lda $5555		; ad 55 55
B14_071f:		rol a			; 2a
B14_0720:		eor $2a, x		; 55 2a
B14_0722:		eor $25, x		; 55 25
B14_0724:		and $12			; 25 12
B14_0726:		and $2a			; 25 2a
B14_0728:		eor $55, x		; 55 55
B14_072a:		eor $ad, x		; 55 ad
B14_072c:		lda $daaa		; ad aa da
B14_072f:		tax				; aa 
B14_0730:		cmp $5a, x		; d5 5a
B14_0732:		tax				; aa 
B14_0733:		cmp $5a, x		; d5 5a
B14_0735:		tax				; aa 
B14_0736:		cmp $ad, x		; d5 ad
B14_0738:		tax				; aa 
B14_0739:		cmp $55, x		; d5 55
B14_073b:	.db $52
B14_073c:		lda $52			; a5 52
B14_073e:		lda $52			; a5 52
B14_0740:		eor ($25), y	; 51 25
B14_0742:	.db $12
B14_0743:	.db $52
B14_0744:		lda $55			; a5 55
B14_0746:		eor $ad, x		; 55 ad
B14_0748:		tax				; aa 
B14_0749:	.db $da
B14_074a:		cmp $aa, x		; d5 aa
B14_074c:		cmp $55, x		; d5 55
B14_074e:		tax				; aa 
B14_074f:		cmp $55, x		; d5 55
B14_0751:		tax				; aa 
B14_0752:		lda $da5a		; ad 5a da
B14_0755:		tax				; aa 
B14_0756:		cmp $52, x		; d5 52
B14_0758:		tax				; aa 
B14_0759:		eor $2a, x		; 55 2a
B14_075b:	.db $52
B14_075c:	.db $52
B14_075d:	.db $52
B14_075e:		and $25			; 25 25
B14_0760:		rol a			; 2a
B14_0761:		eor $55, x		; 55 55
B14_0763:		tax				; aa 
B14_0764:	.db $da
B14_0765:		cmp $ad, x		; d5 ad
B14_0767:	.db $5a
B14_0768:		lda $aa55		; ad 55 aa
B14_076b:		lda $5a55		; ad 55 5a
B14_076e:		tax				; aa 
B14_076f:	.db $da
B14_0770:		lda $adaa		; ad aa ad
B14_0773:	.db $52
B14_0774:		tax				; aa 
B14_0775:		eor $2a, x		; 55 2a
B14_0777:		eor $25, x		; 55 25
B14_0779:		and $12			; 25 12
B14_077b:	.db $52
B14_077c:	.db $52
B14_077d:		lda $55			; a5 55
B14_077f:	.db $5a
B14_0780:		cmp $ad, x		; d5 ad
B14_0782:		tax				; aa 
B14_0783:		cmp $aa, x		; d5 aa
B14_0785:		cmp $5a, x		; d5 5a
B14_0787:		tax				; aa 
B14_0788:		cmp $5a, x		; d5 5a
B14_078a:		tax				; aa 
B14_078b:		cmp $ad, x		; d5 ad
B14_078d:	.db $5a
B14_078e:		tax				; aa 
B14_078f:		tax				; aa 
B14_0790:		tax				; aa 
B14_0791:		eor $52, x		; 55 52
B14_0793:		lda $2a			; a5 2a
B14_0795:		eor ($25), y	; 51 25
B14_0797:	.db $22
B14_0798:		eor $2a, x		; 55 2a
B14_079a:		eor $5a, x		; 55 5a
B14_079c:		lda $5aad		; ad ad 5a
B14_079f:		cmp $aa, x		; d5 aa
B14_07a1:		lda $aa5a		; ad 5a aa
B14_07a4:		cmp $55, x		; d5 55
B14_07a6:		tax				; aa 
B14_07a7:		lda $d55a		; ad 5a d5
B14_07aa:		tax				; aa 
B14_07ab:		tax				; aa 
B14_07ac:		tax				; aa 
B14_07ad:		lda $52			; a5 52
B14_07af:		lda $52			; a5 52
B14_07b1:	.db $52
B14_07b2:	.db $52
B14_07b3:		and $25			; 25 25
B14_07b5:	.db $52
B14_07b6:		lda $5a			; a5 5a
B14_07b8:		lda $da5a		; ad 5a da
B14_07bb:		lda $ad5a		; ad 5a ad
B14_07be:		eor $aa, x		; 55 aa
B14_07c0:		lda $aa55		; ad 55 aa
B14_07c3:		tax				; aa 
B14_07c4:	.db $da
B14_07c5:		lda $aa5a		; ad 5a aa
B14_07c8:		tax				; aa 
B14_07c9:		lda $55			; a5 55
B14_07cb:		rol a			; 2a
B14_07cc:		eor $25, x		; 55 25
B14_07ce:	.db $22
B14_07cf:	.db $52
B14_07d0:	.db $52
B14_07d1:		eor $2a, x		; 55 2a
B14_07d3:		tax				; aa 
B14_07d4:		tax				; aa 
B14_07d5:	.db $da
B14_07d6:		lda $d5aa		; ad aa d5
B14_07d9:		tax				; aa 
B14_07da:		cmp $5a, x		; d5 5a
B14_07dc:		tax				; aa 
B14_07dd:		cmp $5a, x		; d5 5a
B14_07df:		tax				; aa 
B14_07e0:		cmp $aa, x		; d5 aa
B14_07e2:		cmp $aa, x		; d5 aa
B14_07e4:		tax				; aa 
B14_07e5:		lda $55			; a5 55
B14_07e7:		rol a			; 2a
B14_07e8:		lda $25			; a5 25
B14_07ea:		and $25			; 25 25
B14_07ec:		and $5a			; 25 5a
B14_07ee:		eor $a5, x		; 55 a5
B14_07f0:		tax				; aa 
B14_07f1:	.db $5a
B14_07f2:		tax				; aa 
B14_07f3:		lda $aa			; a5 aa
B14_07f5:		tax				; aa 
B14_07f6:		eor $55, x		; 55 55
B14_07f8:		.db $00				; 00
B14_07f9:		.db $00				; 00
B14_07fa:		.db $00				; 00
B14_07fb:		.db $00				; 00
B14_07fc:		.db $00				; 00
B14_07fd:		.db $00				; 00
B14_07fe:		.db $00				; 00
B14_07ff:		.db $00				; 00
B14_0800:		cmp $0a50, x	; dd 50 0a
B14_0803:	.db $5f
B14_0804:	.db $0f
B14_0805:	.db $ff
B14_0806:		.db $00				; 00
B14_0807:	.db $2f
B14_0808:	.db $ff
B14_0809:	.db $0f
B14_080a:		beq B14_080c ; f0 00

B14_080c:		.db $00				; 00
B14_080d:		.db $00				; 00
B14_080e:	.db $0f
B14_080f:	.db $ff
B14_0810:	.db $ff
B14_0811:		bvc B14_0863 ; 50 50

B14_0813:	.db $0f
B14_0814:	.db $ff
B14_0815:		sbc ($d0), y	; f1 d0
B14_0817:		bpl B14_07f8 ; 10 df

B14_0819:	.db $d2
B14_081a:		ora $f5			; 05 f5
B14_081c:		cmp ($fe), y	; d1 fe
B14_081e:		.db $00				; 00
B14_081f:	.db $02
B14_0820:	.db $ff
B14_0821:	.db $ef
B14_0822:	.db $ff
B14_0823:		ora ($0a, x)	; 01 0a
B14_0825:		ora $f00f, x	; 1d 0f f0
B14_0828:		.db $00				; 00
B14_0829:	.db $2f
B14_082a:	.db $f2
B14_082b:		sbc $f0, x		; f5 f0
B14_082d:		.db $00				; 00
B14_082e:		.db $00				; 00
B14_082f:		.db $00				; 00
B14_0830:	.db $0f
B14_0831:	.db $ff
B14_0832:	.db $ff
B14_0833:	.db $02
B14_0834:		bne B14_0845 ; d0 0f

B14_0836:	.db $ff
B14_0837:	.db $fa
B14_0838:		beq B14_083b ; f0 01

B14_083a:	.db $ff
B14_083b:		ldy #$0f		; a0 0f
B14_083d:	.db $f2
B14_083e:		cpx #$ff		; e0 ff
B14_0840:		.db $00				; 00
B14_0841:		ora $ffff		; 0d ff ff
B14_0844:	.db $ff
B14_0845:		.db $00				; 00
B14_0846:		.db $00				; 00
B14_0847:	.db $52
B14_0848:	.db $0f
B14_0849:		beq B14_084b ; f0 00

B14_084b:	.db $ff
B14_084c:	.db $02
B14_084d:	.db $ff
B14_084e:		ldy #$00		; a0 00
B14_0850:		ora ($00, x)	; 01 00
B14_0852:	.db $0f
B14_0853:	.db $ff
B14_0854:	.db $ff
B14_0855:		ora $ff00		; 0d 00 ff
B14_0858:	.db $ff
B14_0859:		nop				; ea 
B14_085a:		;removed
	.db $f0 $01

B14_085c:		inc $2f50, x	; fe 50 2f
B14_085f:		cmp $2f, x		; d5 2f
B14_0861:		ldy #$a0		; a0 a0
B14_0863:	.db $0f
B14_0864:	.db $ff
B14_0865:	.db $ff
B14_0866:		beq B14_08b8 ; f0 50

B14_0868:		ora $50			; 05 50
B14_086a:	.db $fa
B14_086b:		ora ($0a, x)	; 01 0a
B14_086d:	.db $ff
B14_086e:		ldy #$ff		; a0 ff
B14_0870:		.db $00				; 00
B14_0871:		.db $00				; 00
B14_0872:		.db $00				; 00
B14_0873:		.db $00				; 00
B14_0874:	.db $ff
B14_0875:	.db $ff
B14_0876:	.db $f2
B14_0877:		and $ff00		; 2d 00 ff
B14_087a:	.db $ff
B14_087b:		inc $0a50		; ee 50 0a
B14_087e:		inc $de10, x	; fe 10 de
B14_0881:		cmp $0f, x		; d5 0f
B14_0883:		beq B14_0885 ; f0 00

B14_0885:	.db $5f
B14_0886:	.db $ff
B14_0887:	.db $ff
B14_0888:		beq B14_088a ; f0 00

B14_088a:		ora $20, x		; 15 20
B14_088c:	.db $ff
B14_088d:		.db $00				; 00
B14_088e:		asl $02ff		; 0e ff 02
B14_0891:	.db $fe $00 $00
B14_0894:		.db $00				; 00
B14_0895:		.db $00				; 00
B14_0896:	.db $ff
B14_0897:	.db $ff
B14_0898:		sbc $51, x		; f5 51
B14_089a:		asl a			; 0a
B14_089b:	.db $ff
B14_089c:	.db $ff
B14_089d:	.db $da
B14_089e:		.db $00				; 00
B14_089f:	.db $2f
B14_08a0:		sbc $02, x		; f5 02
B14_08a2:		inc $1fd2		; ee d2 1f
B14_08a5:	.db $f2
B14_08a6:		.db $00				; 00
B14_08a7:	.db $5f
B14_08a8:	.db $ff
B14_08a9:	.db $ff
B14_08aa:		beq B14_08ac ; f0 00

B14_08ac:		ora $00			; 05 00
B14_08ae:	.db $ff
B14_08af:		;removed
	.db $10 $0f

B14_08b1:		inc $f20a, x	; fe 0a f2
B14_08b4:		.db $00				; 00
B14_08b5:		.db $00				; 00
B14_08b6:		.db $00				; 00
B14_08b7:	.db $02
B14_08b8:	.db $ff
B14_08b9:	.db $ff
B14_08ba:		sbc $21, x		; f5 21
B14_08bc:		and $ffff		; 2d ff ff
B14_08bf:		ldx #$01		; a2 01
B14_08c1:		lsr $15f2, x	; 5e f2 15
B14_08c4:	.db $da
B14_08c5:		cmp ($5f), y	; d1 5f
B14_08c7:		bne B14_08c9 ; d0 00

B14_08c9:	.db $ef
B14_08ca:	.db $ff
B14_08cb:	.db $ff
B14_08cc:		cpx #$00		; e0 00
B14_08ce:		ora $0a			; 05 0a
B14_08d0:		sbc $5f00, x	; fd 00 5f
B14_08d3:	.db $f2
B14_08d4:	.db $2e $a5 $00
B14_08d7:		.db $00				; 00
B14_08d8:		.db $00				; 00
B14_08d9:		ora $ffff		; 0d ff ff
B14_08dc:		cmp ($11), y	; d1 11
B14_08de:	.db $2f
B14_08df:	.db $ff
B14_08e0:		inc $0151, x	; fe 51 01
B14_08e3:	.db $af
B14_08e4:		lda $2a			; a5 2a
B14_08e6:	.db $da
B14_08e7:		lda $de			; a5 de
B14_08e9:		bvc B14_08f0 ; 50 05

B14_08eb:	.db $df
B14_08ec:	.db $ff
B14_08ed:	.db $ff
B14_08ee:		bpl B14_08f0 ; 10 00

B14_08f0:	.db $22
B14_08f1:		rol $01e5		; 2e e5 01
B14_08f4:	.db $df
B14_08f5:		lda $5a			; a5 5a
B14_08f7:		eor ($00), y	; 51 00
B14_08f9:		.db $00				; 00
B14_08fa:		.db $00				; 00
B14_08fb:	.db $2f
B14_08fc:	.db $ff
B14_08fd:	.db $ff
B14_08fe:		eor ($11), y	; 51 11
B14_0900:	.db $5f
B14_0901:	.db $ff
B14_0902:		inc $1250		; ee 50 12
B14_0905:		cmp $ad52, x	; dd 52 ad
B14_0908:	.db $5a
B14_0909:	.db $5a
B14_090a:		sbc $0a21		; ed21 0a
B14_090d:	.db $ef
B14_090e:	.db $ff
B14_090f:		inc $0120, x	; fe 20 01
B14_0912:		ora ($5d), y	; 11 5d
B14_0914:	.db $52
B14_0915:		ora $ae, x		; 15 ae
B14_0917:		cmp $aa, x		; d5 aa
B14_0919:		bvc B14_091b ; 50 00

B14_091b:		.db $00				; 00
B14_091c:	.db $02
B14_091d:	.db $af
B14_091e:	.db $ff
B14_091f:	.db $ff
B14_0920:		ora ($12), y	; 11 12
B14_0922:		dec $edff, x	; de ff ed
B14_0925:		and ($15, x)	; 21 15
B14_0927:		tax				; aa 
B14_0928:		tax				; aa 
B14_0929:		lda $ada5		; ad a5 ad
B14_092c:		tax				; aa 
B14_092d:		eor ($15), y	; 51 15
B14_092f:	.db $df
B14_0930:	.db $ff
B14_0931:		sbc $01, x		; f5 01
B14_0933:		ora ($05, x)	; 01 05
B14_0935:		lda $1a25		; ad 25 1a
B14_0938:	.db $da
B14_0939:		lda $20a5		; ad a5 20
B14_093c:		.db $00				; 00
B14_093d:		bpl B14_0944 ; 10 05

B14_093f:	.db $df
B14_0940:	.db $ff
B14_0941:		nop				; ea 
B14_0942:		eor ($15), y	; 51 15
B14_0944:	.db $af
B14_0945:		inc $51ea, x	; fe ea 51
B14_0948:		rol a			; 2a
B14_0949:		tax				; aa 
B14_094a:		tax				; aa 
B14_094b:		cmp $55, x		; d5 55
B14_094d:		lda $25aa		; ad aa 25
B14_0950:		rol a			; 2a
B14_0951:		inc $d5ff, x	; fe ff d5
B14_0954:		bpl B14_0977 ; 10 21

B14_0956:	.db $12
B14_0957:		tax				; aa 
B14_0958:	.db $52
B14_0959:		tax				; aa 
B14_095a:	.db $da
B14_095b:		lda $2152		; ad 52 21
B14_095e:		.db $00				; 00
B14_095f:		ora ($0a, x)	; 01 0a
B14_0961:	.db $ef
B14_0962:	.db $ff
B14_0963:	.db $da
B14_0964:		eor ($2a), y	; 51 2a
B14_0966:		inc $d5fe		; ee fe d5
B14_0969:		and $2a			; 25 2a
B14_096b:		tax				; aa 
B14_096c:		tax				; aa 
B14_096d:		cmp $5a, x		; d5 5a
B14_096f:	.db $da
B14_0970:		lda $25			; a5 25
B14_0972:		and $ffde		; 2d de ff
B14_0975:		tax				; aa 
B14_0976:	.db $22
B14_0977:		ora ($12), y	; 11 12
B14_0979:		lda $2a			; a5 2a
B14_097b:		lda $ad55		; ad 55 ad
B14_097e:	.db $52
B14_097f:		ora ($00), y	; 11 00
B14_0981:		ora ($1a, x)	; 01 1a
B14_0983:	.db $ef
B14_0984:	.db $ef
B14_0985:		lda $5525		; ad 25 55
B14_0988:		cmp $aadd, x	; dd dd aa
B14_098b:		lda $52			; a5 52
B14_098d:		tax				; aa 
B14_098e:		tax				; aa 
B14_098f:		cmp $5a, x		; d5 5a
B14_0991:		cmp $52, x		; d5 52
B14_0993:		eor $5a, x		; 55 5a
B14_0995:	.db $ef
B14_0996:		inc $11d5		; ee d5 11
B14_0999:		ora ($25), y	; 11 25
B14_099b:		and $2a			; 25 2a
B14_099d:		lda $ad5a		; ad 5a ad
B14_09a0:		and $02			; 25 02
B14_09a2:		;removed
	.db $10 $01

B14_09a4:		and $eede		; 2d de ee
B14_09a7:		nop				; ea 
B14_09a8:		lda $5d			; a5 5d
B14_09aa:		ldx $aaed		; ae ed aa
B14_09ad:		eor $55, x		; 55 55
B14_09af:		rol a			; 2a
B14_09b0:		lda $5a55		; ad 55 5a
B14_09b3:		cmp $52, x		; d5 52
B14_09b5:		eor $ad, x		; 55 ad
B14_09b7:		dec $aaee, x	; de ee aa
B14_09ba:		and $11			; 25 11
B14_09bc:		and $25			; 25 25
B14_09be:		rol a			; 2a
B14_09bf:		tax				; aa 
B14_09c0:		cmp $aa, x		; d5 aa
B14_09c2:	.db $52
B14_09c3:		and ($01, x)	; 21 01
B14_09c5:	.db $02
B14_09c6:		tax				; aa 
B14_09c7:		inc $daee		; ee ee da
B14_09ca:		tax				; aa 
B14_09cb:		lda $edda		; ad da ed
B14_09ce:		eor $55, x		; 55 55
B14_09d0:		eor $2a, x		; 55 2a
B14_09d2:		cmp $55, x		; d5 55
B14_09d4:		tax				; aa 
B14_09d5:		cmp $2a, x		; d5 2a
B14_09d7:	.db $5a
B14_09d8:		ldx $edee		; ae ee ed
B14_09db:		eor $22, x		; 55 22
B14_09dd:		eor ($25), y	; 51 25
B14_09df:		and $2a			; 25 2a
B14_09e1:		tax				; aa 
B14_09e2:		cmp $a5, x		; d5 a5
B14_09e4:		eor ($10), y	; 51 10
B14_09e6:		ora ($05), y	; 11 05
B14_09e8:	.db $5a
B14_09e9:		cmp $d5ae, x	; dd ae d5
B14_09ec:	.db $5a
B14_09ed:	.db $da
B14_09ee:		sbc $55ad		; edad 55
B14_09f1:		eor $55, x		; 55 55
B14_09f3:		eor $55, x		; 55 55
B14_09f5:		eor $aa, x		; 55 aa
B14_09f7:		cmp $2a, x		; d5 2a
B14_09f9:		tax				; aa 
B14_09fa:	.db $da
B14_09fb:		inc $aaea		; ee ea aa
B14_09fe:	.db $52
B14_09ff:		and $25			; 25 25
B14_0a01:		and $2a			; 25 2a
B14_0a03:		lda $5555		; ad 55 55
B14_0a06:	.db $22
B14_0a07:	.db $22
B14_0a08:		bpl B14_0a5c ; 10 52

B14_0a0a:		lda $adad		; ad ad ad
B14_0a0d:		lda $adad		; ad ad ad
B14_0a10:		lda $d5aa		; ad aa d5
B14_0a13:		eor $55, x		; 55 55
B14_0a15:		eor $55, x		; 55 55
B14_0a17:	.db $5a
B14_0a18:		tax				; aa 
B14_0a19:	.db $d2
B14_0a1a:		tax				; aa 
B14_0a1b:		tax				; aa 
B14_0a1c:		cmp $dada, x	; dd da da
B14_0a1f:		lda $25			; a5 25
B14_0a21:		and $25			; 25 25
B14_0a23:		and $52			; 25 52
B14_0a25:		lda $5255		; ad 55 52
B14_0a28:		eor ($11), y	; 51 11
B14_0a2a:	.db $02
B14_0a2b:	.db $52
B14_0a2c:		cmp $ad, x		; d5 ad
B14_0a2e:		lda $adad		; ad ad ad
B14_0a31:		lda $aaad		; ad ad aa
B14_0a34:		lda $5555		; ad 55 55
B14_0a37:		eor $55, x		; 55 55
B14_0a39:	.db $5a
B14_0a3a:		tax				; aa 
B14_0a3b:		tax				; aa 
B14_0a3c:		tax				; aa 
B14_0a3d:		lda $daad		; ad ad da
B14_0a40:	.db $da
B14_0a41:		eor $25, x		; 55 25
B14_0a43:		and $25			; 25 25
B14_0a45:		and $52			; 25 52
B14_0a47:		lda $2a55		; ad 55 2a
B14_0a4a:	.db $22
B14_0a4b:	.db $22
B14_0a4c:		and $25			; 25 25
B14_0a4e:		tax				; aa 
B14_0a4f:	.db $da
B14_0a50:		cmp $ad, x		; d5 ad
B14_0a52:		lda $d5da		; ad da d5
B14_0a55:		tax				; aa 
B14_0a56:		lda $5555		; ad 55 55
B14_0a59:		eor $55, x		; 55 55
B14_0a5b:	.db $5a
B14_0a5c:		tax				; aa 
B14_0a5d:		tax				; aa 
B14_0a5e:		tax				; aa 
B14_0a5f:		lda $daae		; ad ae da
B14_0a62:		cmp $52, x		; d5 52
B14_0a64:		lda $25			; a5 25
B14_0a66:		and $25			; 25 25
B14_0a68:		eor $55, x		; 55 55
B14_0a6a:	.db $52
B14_0a6b:		lda $12			; a5 12
B14_0a6d:	.db $22
B14_0a6e:		and $2a			; 25 2a
B14_0a70:		lda $d55a		; ad 5a d5
B14_0a73:		lda $daae		; ad ae da
B14_0a76:		cmp $aa, x		; d5 aa
B14_0a78:		lda $5555		; ad 55 55
B14_0a7b:		eor $55, x		; 55 55
B14_0a7d:		tax				; aa 
B14_0a7e:		tax				; aa 
B14_0a7f:		tax				; aa 
B14_0a80:		tax				; aa 
B14_0a81:	.db $da
B14_0a82:	.db $da
B14_0a83:	.db $da
B14_0a84:		lda $522a		; ad 2a 52
B14_0a87:		lda $25			; a5 25
B14_0a89:		and $55			; 25 55
B14_0a8b:		eor $2a, x		; 55 2a
B14_0a8d:	.db $52
B14_0a8e:		eor ($11), y	; 51 11
B14_0a90:		and $55			; 25 55
B14_0a92:		eor $aa, x		; 55 aa
B14_0a94:	.db $da
B14_0a95:	.db $da
B14_0a96:	.db $da
B14_0a97:	.db $da
B14_0a98:		cmp $aa, x		; d5 aa
B14_0a9a:		lda $5555		; ad 55 55
B14_0a9d:		eor $55, x		; 55 55
B14_0a9f:		tax				; aa 
B14_0aa0:		tax				; aa 
B14_0aa1:		tax				; aa 
B14_0aa2:		tax				; aa 
B14_0aa3:	.db $da
B14_0aa4:	.db $da
B14_0aa5:	.db $da
B14_0aa6:		tax				; aa 
B14_0aa7:		lda $52			; a5 52
B14_0aa9:	.db $52
B14_0aaa:		lda $25			; a5 25
B14_0aac:		eor $52, x		; 55 52
B14_0aae:		lda $51			; a5 51
B14_0ab0:	.db $22
B14_0ab1:		eor ($25), y	; 51 25
B14_0ab3:		eor $5a, x		; 55 5a
B14_0ab5:		lda $da5a		; ad 5a da
B14_0ab8:	.db $da
B14_0ab9:	.db $da
B14_0aba:		cmp $aa, x		; d5 aa
B14_0abc:		lda $5555		; ad 55 55
B14_0abf:		eor $55, x		; 55 55
B14_0ac1:		tax				; aa 
B14_0ac2:		tax				; aa 
B14_0ac3:		tax				; aa 
B14_0ac4:		lda $da5a		; ad 5a da
B14_0ac7:	.db $da
B14_0ac8:		tax				; aa 
B14_0ac9:		eor $2a, x		; 55 2a
B14_0acb:	.db $52
B14_0acc:		eor $25, x		; 55 25
B14_0ace:		eor $52, x		; 55 52
B14_0ad0:		lda $25			; a5 25
B14_0ad2:	.db $12
B14_0ad3:		and $2a			; 25 2a
B14_0ad5:		eor $aa, x		; 55 aa
B14_0ad7:		lda $da5a		; ad 5a da
B14_0ada:		sbc $d5aa		; edaa d5
B14_0add:		tax				; aa 
B14_0ade:		lda $5555		; ad 55 55
B14_0ae1:		eor $5a, x		; 55 5a
B14_0ae3:		tax				; aa 
B14_0ae4:		tax				; aa 
B14_0ae5:		tax				; aa 
B14_0ae6:		lda $aaad		; ad ad aa
B14_0ae9:		cmp $55, x		; d5 55
B14_0aeb:		eor $25, x		; 55 25
B14_0aed:	.db $52
B14_0aee:		eor $25, x		; 55 25
B14_0af0:		eor $2a, x		; 55 2a
B14_0af2:	.db $52
B14_0af3:	.db $52
B14_0af4:		eor ($25), y	; 51 25
B14_0af6:		rol a			; 2a
B14_0af7:		tax				; aa 
B14_0af8:		tax				; aa 
B14_0af9:		cmp $ad, x		; d5 ad
B14_0afb:		lda $adad		; ad ad ad
B14_0afe:	.db $5a
B14_0aff:		tax				; aa 
B14_0b00:		lda $5555		; ad 55 55
B14_0b03:		eor $5a, x		; 55 5a
B14_0b05:		tax				; aa 
B14_0b06:		tax				; aa 
B14_0b07:		tax				; aa 
B14_0b08:		cmp $ad, x		; d5 ad
B14_0b0a:		lda $5555		; ad 55 55
B14_0b0d:	.db $52
B14_0b0e:		lda $2a			; a5 2a
B14_0b10:	.db $52
B14_0b11:		lda $55			; a5 55
B14_0b13:		rol a			; 2a
B14_0b14:	.db $52
B14_0b15:		eor ($25), y	; 51 25
B14_0b17:		and $2a			; 25 2a
B14_0b19:		tax				; aa 
B14_0b1a:		lda $ad55		; ad 55 ad
B14_0b1d:		lda $adad		; ad ad ad
B14_0b20:	.db $5a
B14_0b21:		tax				; aa 
B14_0b22:		lda $5555		; ad 55 55
B14_0b25:		eor $aa, x		; 55 aa
B14_0b27:		tax				; aa 
B14_0b28:		tax				; aa 
B14_0b29:		lda $ad5a		; ad 5a ad
B14_0b2c:		lda $5555		; ad 55 55
B14_0b2f:		rol a			; 2a
B14_0b30:		eor $25, x		; 55 25
B14_0b32:	.db $52
B14_0b33:		lda $55			; a5 55
B14_0b35:		and $25			; 25 25
B14_0b37:		and $22			; 25 22
B14_0b39:		lda $52			; a5 52
B14_0b3b:		tax				; aa 
B14_0b3c:		cmp $5a, x		; d5 5a
B14_0b3e:	.db $da
B14_0b3f:	.db $da
B14_0b40:		cmp $ad, x		; d5 ad
B14_0b42:	.db $5a
B14_0b43:		tax				; aa 
B14_0b44:		lda $5555		; ad 55 55
B14_0b47:		eor $aa, x		; 55 aa
B14_0b49:		tax				; aa 
B14_0b4a:		tax				; aa 
B14_0b4b:		lda $d55a		; ad 5a d5
B14_0b4e:		tax				; aa 
B14_0b4f:		cmp $52, x		; d5 52
B14_0b51:		tax				; aa 
B14_0b52:	.db $52
B14_0b53:		lda $52			; a5 52
B14_0b55:		lda $52			; a5 52
B14_0b57:		lda $25			; a5 25
B14_0b59:	.db $22
B14_0b5a:	.db $52
B14_0b5b:		lda $55			; a5 55
B14_0b5d:		eor $55, x		; 55 55
B14_0b5f:		tax				; aa 
B14_0b60:	.db $da
B14_0b61:	.db $da
B14_0b62:	.db $da
B14_0b63:		lda $aa5a		; ad 5a aa
B14_0b66:		lda $5555		; ad 55 55
B14_0b69:	.db $5a
B14_0b6a:		tax				; aa 
B14_0b6b:		tax				; aa 
B14_0b6c:		tax				; aa 
B14_0b6d:		cmp $aa, x		; d5 aa
B14_0b6f:		cmp $aa, x		; d5 aa
B14_0b71:		tax				; aa 
B14_0b72:		tax				; aa 
B14_0b73:		lda $52			; a5 52
B14_0b75:		lda $52			; a5 52
B14_0b77:		lda $52			; a5 52
B14_0b79:	.db $52
B14_0b7a:	.db $52
B14_0b7b:	.db $52
B14_0b7c:	.db $52
B14_0b7d:		eor $55, x		; 55 55
B14_0b7f:		eor $55, x		; 55 55
B14_0b81:		lda $aaad		; ad ad aa
B14_0b84:	.db $da
B14_0b85:		cmp $5a, x		; d5 5a
B14_0b87:		tax				; aa 
B14_0b88:		lda $5555		; ad 55 55
B14_0b8b:	.db $5a
B14_0b8c:		tax				; aa 
B14_0b8d:		tax				; aa 
B14_0b8e:		tax				; aa 
B14_0b8f:		cmp $aa, x		; d5 aa
B14_0b91:	.db $da
B14_0b92:		tax				; aa 
B14_0b93:		tax				; aa 
B14_0b94:		tax				; aa 
B14_0b95:		eor $2a, x		; 55 2a
B14_0b97:		eor $2a, x		; 55 2a
B14_0b99:		eor $2a, x		; 55 2a
B14_0b9b:	.db $52
B14_0b9c:	.db $52
B14_0b9d:	.db $52
B14_0b9e:	.db $52
B14_0b9f:		lda $55			; a5 55
B14_0ba1:		eor $5a, x		; 55 5a
B14_0ba3:		lda $adad		; ad ad ad
B14_0ba6:	.db $5a
B14_0ba7:		cmp $5a, x		; d5 5a
B14_0ba9:		tax				; aa 
B14_0baa:		lda $5555		; ad 55 55
B14_0bad:		tax				; aa 
B14_0bae:		tax				; aa 
B14_0baf:		tax				; aa 
B14_0bb0:		lda $ad55		; ad 55 ad
B14_0bb3:	.db $5a
B14_0bb4:		tax				; aa 
B14_0bb5:		tax				; aa 
B14_0bb6:		tax				; aa 
B14_0bb7:		eor $2a, x		; 55 2a
B14_0bb9:		eor $2a, x		; 55 2a
B14_0bbb:		eor $25, x		; 55 25
B14_0bbd:		eor ($25), y	; 51 25
B14_0bbf:		and $2a			; 25 2a
B14_0bc1:		lda $55			; a5 55
B14_0bc3:		eor $aa, x		; 55 aa
B14_0bc5:	.db $da
B14_0bc6:		cmp $ad, x		; d5 ad
B14_0bc8:		tax				; aa 
B14_0bc9:		cmp $aa, x		; d5 aa
B14_0bcb:		tax				; aa 
B14_0bcc:		cmp $55, x		; d5 55
B14_0bce:		eor $aa, x		; 55 aa
B14_0bd0:		tax				; aa 
B14_0bd1:		tax				; aa 
B14_0bd2:		lda $ad5a		; ad 5a ad
B14_0bd5:	.db $5a
B14_0bd6:		tax				; aa 
B14_0bd7:		tax				; aa 
B14_0bd8:		lda $52			; a5 52
B14_0bda:		lda $52			; a5 52
B14_0bdc:		tax				; aa 
B14_0bdd:	.db $52
B14_0bde:		lda $25			; a5 25
B14_0be0:		and $25			; 25 25
B14_0be2:		rol a			; 2a
B14_0be3:		lda $55			; a5 55
B14_0be5:	.db $5a
B14_0be6:		lda $da5a		; ad 5a da
B14_0be9:		cmp $ad, x		; d5 ad
B14_0beb:		eor $aa, x		; 55 aa
B14_0bed:	.db $5a
B14_0bee:		lda $a5			; a5 a5
B14_0bf0:		tax				; aa 
B14_0bf1:	.db $5a
B14_0bf2:		tax				; aa 
B14_0bf3:		eor $aa, x		; 55 aa
B14_0bf5:		lda $5a			; a5 5a
B14_0bf7:	.db $5a
B14_0bf8:		.db $00				; 00
B14_0bf9:		.db $00				; 00
B14_0bfa:		.db $00				; 00
B14_0bfb:		.db $00				; 00
B14_0bfc:		.db $00				; 00
B14_0bfd:		.db $00				; 00
B14_0bfe:		.db $00				; 00
B14_0bff:		.db $00				; 00
B14_0c00:		ldx $0ad0		; ae d0 0a
B14_0c03:	.db $da
B14_0c04:	.db $ff
B14_0c05:		.db $00				; 00
B14_0c06:	.db $0f
B14_0c07:	.db $ff
B14_0c08:	.db $2f
B14_0c09:	.db $f2
B14_0c0a:		.db $00				; 00
B14_0c0b:		ora ($00, x)	; 01 00
B14_0c0d:	.db $0f
B14_0c0e:	.db $ff
B14_0c0f:		sbc ($11), y	; f1 11
B14_0c11:		ora $f1ff		; 0d ff f1
B14_0c14:		beq B14_0c1b ; f0 05

B14_0c16:		sbc $fe00, x	; fd 00 fe
B14_0c19:		ldx #$ff		; a2 ff
B14_0c1b:		.db $00				; 00
B14_0c1c:		ora $ffff		; 0d ff ff
B14_0c1f:		beq B14_0c21 ; f0 00

B14_0c21:		lda $0f			; a5 0f
B14_0c23:		beq B14_0c25 ; f0 00

B14_0c25:	.db $ff
B14_0c26:	.db $2f
B14_0c27:	.db $d2
B14_0c28:		.db $00				; 00
B14_0c29:		.db $00				; 00
B14_0c2a:		.db $00				; 00
B14_0c2b:	.db $0f
B14_0c2c:	.db $ff
B14_0c2d:		sbc ($12), y	; f1 12
B14_0c2f:		asl a			; 0a
B14_0c30:	.db $ff
B14_0c31:	.db $ff
B14_0c32:		beq B14_0c35 ; f0 01

B14_0c34:	.db $ff
B14_0c35:		bpl B14_0c16 ; 10 df

B14_0c37:		rol a			; 2a
B14_0c38:		sbc $0d00, x	; fd 00 0d
B14_0c3b:	.db $ff
B14_0c3c:	.db $ff
B14_0c3d:		beq B14_0c3f ; f0 00

B14_0c3f:		cmp $0f, x		; d5 0f
B14_0c41:		beq B14_0c43 ; f0 00

B14_0c43:	.db $ff
B14_0c44:		bvc B14_0c44 ; 50 fe

B14_0c46:		.db $00				; 00
B14_0c47:		.db $00				; 00
B14_0c48:		.db $00				; 00
B14_0c49:	.db $0f
B14_0c4a:	.db $ff
B14_0c4b:	.db $d2
B14_0c4c:		ora $01, x		; 15 01
B14_0c4e:	.db $ff
B14_0c4f:	.db $ff
B14_0c50:		;removed
	.db $d0 $02

B14_0c52:	.db $ff
B14_0c53:		ldy #$af		; a0 af
B14_0c55:		tax				; aa 
B14_0c56:	.db $0f
B14_0c57:		beq B14_0c5b ; f0 02

B14_0c59:	.db $ff
B14_0c5a:	.db $ff
B14_0c5b:		beq B14_0cad ; f0 50

B14_0c5d:		eor $0f, x		; 55 0f
B14_0c5f:		bvc B14_0c61 ; 50 00

B14_0c61:	.db $ff
B14_0c62:		;removed
	.db $f0 $af

B14_0c64:		.db $00				; 00
B14_0c65:		.db $00				; 00
B14_0c66:		.db $00				; 00
B14_0c67:	.db $0f
B14_0c68:	.db $ff
B14_0c69:	.db $f2
B14_0c6a:		ora $01, x		; 15 01
B14_0c6c:	.db $ff
B14_0c6d:	.db $ff
B14_0c6e:	.db $da
B14_0c6f:		.db $00				; 00
B14_0c70:	.db $ef
B14_0c71:		ldy #$5f		; a0 5f
B14_0c73:		tax				; aa 
B14_0c74:	.db $0f
B14_0c75:		beq B14_0c77 ; f0 00

B14_0c77:	.db $ff
B14_0c78:	.db $ff
B14_0c79:	.db $ff
B14_0c7a:		.db $00				; 00
B14_0c7b:		ora $ff00		; 0d 00 ff
B14_0c7e:		.db $00				; 00
B14_0c7f:	.db $5f
B14_0c80:		beq B14_0cb1 ; f0 2f

B14_0c82:		bvc B14_0c84 ; 50 00

B14_0c84:		.db $00				; 00
B14_0c85:		asl $f5ff		; 0e ff f5
B14_0c88:		ora $01			; 05 01
B14_0c8a:	.db $ef
B14_0c8b:	.db $ff
B14_0c8c:	.db $fa
B14_0c8d:		.db $00				; 00
B14_0c8e:	.db $af
B14_0c8f:		sbc ($1e, x)	; e1 1e
B14_0c91:		nop				; ea 
B14_0c92:	.db $1d $fd $00
B14_0c95:	.db $2f
B14_0c96:	.db $ff
B14_0c97:	.db $ff
B14_0c98:		bvc B14_0c9a ; 50 00

B14_0c9a:		bvc B14_0c4b ; 50 af

B14_0c9c:		bvc B14_0cad ; 50 0f

B14_0c9e:	.db $f2
B14_0c9f:	.db $5e $a0 $00
B14_0ca2:		.db $00				; 00
B14_0ca3:		.db $00				; 00
B14_0ca4:	.db $ff
B14_0ca5:	.db $ff
B14_0ca6:		eor ($10), y	; 51 10
B14_0ca8:	.db $df
B14_0ca9:	.db $ff
B14_0caa:	.db $fa
B14_0cab:		.db $00				; 00
B14_0cac:	.db $af
B14_0cad:	.db $e2
B14_0cae:		and $55da		; 2d da 55
B14_0cb1:		sbc $1f00, x	; fd 00 1f
B14_0cb4:	.db $ff
B14_0cb5:	.db $ff
B14_0cb6:		bne B14_0cb8 ; d0 00

B14_0cb8:		bpl B14_0c69 ; 10 af

B14_0cba:		ldy #$0f		; a0 0f
B14_0cbc:		sbc $2d, x		; f5 2d
B14_0cbe:		eor ($00), y	; 51 00
B14_0cc0:		.db $00				; 00
B14_0cc1:		.db $00				; 00
B14_0cc2:	.db $ff
B14_0cc3:	.db $ff
B14_0cc4:		;removed
	.db $50 $21

B14_0cc6:	.db $5f
B14_0cc7:	.db $ff
B14_0cc8:	.db $fa
B14_0cc9:		bpl B14_0cf9 ; 10 2e

B14_0ccb:	.db $f2
B14_0ccc:		eor $da, x		; 55 da
B14_0cce:		eor $ee, x		; 55 ee
B14_0cd0:		;removed
	.db $10 $1e

B14_0cd2:	.db $ff
B14_0cd3:	.db $ff
B14_0cd4:		beq B14_0cd6 ; f0 00

B14_0cd6:		;removed
	.db $10 $af

B14_0cd8:		ldy #$1d		; a0 1d
B14_0cda:		sbc $512d		; ed2d 51
B14_0cdd:		.db $00				; 00
B14_0cde:		.db $00				; 00
B14_0cdf:		.db $00				; 00
B14_0ce0:	.db $2f
B14_0ce1:	.db $ff
B14_0ce2:	.db $fa
B14_0ce3:		bpl B14_0d43 ; 10 5e

B14_0ce5:	.db $ff
B14_0ce6:		inc $1a21, x	; fe 21 1a
B14_0ce9:	.db $da
B14_0cea:		lda $ad			; a5 ad
B14_0cec:		eor $dd, x		; 55 dd
B14_0cee:		jsr $ef2d		; 20 2d ef
B14_0cf1:	.db $ff
B14_0cf2:	.db $f2
B14_0cf3:		.db $00				; 00
B14_0cf4:		ora ($2e), y	; 11 2e
B14_0cf6:		cmp ($0d), y	; d1 0d
B14_0cf8:	.db $da
B14_0cf9:	.db $ad $52 $00
B14_0cfc:		.db $00				; 00
B14_0cfd:		.db $00				; 00
B14_0cfe:	.db $5f
B14_0cff:	.db $ff
B14_0d00:		sbc $02, x		; f5 02
B14_0d02:		and $fdff		; 2d ff fd
B14_0d05:		eor ($0a), y	; 51 0a
B14_0d07:		cmp $5a, x		; d5 5a
B14_0d09:		lda $da55		; ad 55 da
B14_0d0c:		lda ($15, x)	; a1 15
B14_0d0e:	.db $df
B14_0d0f:	.db $ff
B14_0d10:	.db $f2
B14_0d11:		bpl B14_0d15 ; 10 02

B14_0d13:		eor $a5, x		; 55 a5
B14_0d15:		ora $ad, x		; 15 ad
B14_0d17:		tax				; aa 
B14_0d18:	.db $d2
B14_0d19:		bpl B14_0d1b ; 10 00

B14_0d1b:		.db $00				; 00
B14_0d1c:		asl $fdff, x	; 1e ff fd
B14_0d1f:		and ($15, x)	; 21 15
B14_0d21:	.db $ef
B14_0d22:		inc $12d1, x	; fe d1 12
B14_0d25:		cmp $55, x		; d5 55
B14_0d27:		lda $ae55		; ad 55 ae
B14_0d2a:	.db $52
B14_0d2b:		rol a			; 2a
B14_0d2c:		dec $faff, x	; de ff fa
B14_0d2f:		and ($01, x)	; 21 01
B14_0d31:		ora $a5, x		; 15 a5
B14_0d33:		ora $ad, x		; 15 ad
B14_0d35:	.db $5a
B14_0d36:	.db $d2
B14_0d37:	.db $20 $00 $00
B14_0d3a:		rol $faff		; 2e ff fa
B14_0d3d:		ldx #$52		; a2 52
B14_0d3f:	.db $ef
B14_0d40:		inc $25e5		; ee e5 25
B14_0d43:		eor $55, x		; 55 55
B14_0d45:		tax				; aa 
B14_0d46:		cmp $ad, x		; d5 ad
B14_0d48:	.db $52
B14_0d49:	.db $52
B14_0d4a:		cmp $fdef, x	; dd ef fd
B14_0d4d:	.db $22
B14_0d4e:		and ($12, x)	; 21 12
B14_0d50:		eor $25, x		; 55 25
B14_0d52:		tax				; aa 
B14_0d53:		cmp $aa, x		; d5 aa
B14_0d55:		and ($00, x)	; 21 00
B14_0d57:		.db $00				; 00
B14_0d58:		rol a			; 2a
B14_0d59:		inc $a5fd, x	; fe fd a5
B14_0d5c:		and $ae			; 25 ae
B14_0d5e:		sbc $2ad5, x	; fd d5 2a
B14_0d61:		lda $55			; a5 55
B14_0d63:		tax				; aa 
B14_0d64:		lda $52ad		; ad ad 52
B14_0d67:		eor $5a, x		; 55 5a
B14_0d69:		inc $52fd, x	; fe fd 52
B14_0d6c:	.db $22
B14_0d6d:		and $25			; 25 25
B14_0d6f:		and $aa			; 25 aa
B14_0d71:		lda $22aa		; ad aa 22
B14_0d74:		bpl B14_0d76 ; 10 00

B14_0d76:		ora $af, x		; 15 af
B14_0d78:		cmp $2ad5, x	; dd d5 2a
B14_0d7b:	.db $da
B14_0d7c:		inc $aaea		; ee ea aa
B14_0d7f:		tax				; aa 
B14_0d80:		eor $aa, x		; 55 aa
B14_0d82:		tax				; aa 
B14_0d83:	.db $da
B14_0d84:	.db $d2
B14_0d85:		lda $5a			; a5 5a
B14_0d87:	.db $ef
B14_0d88:		inc $51d2		; ee d2 51
B14_0d8b:	.db $12
B14_0d8c:		eor ($2a), y	; 51 2a
B14_0d8e:		tax				; aa 
B14_0d8f:		lda $5155		; ad 55 51
B14_0d92:		ora ($00, x)	; 01 00
B14_0d94:	.db $12
B14_0d95:		ldx $eaee		; ae ee ea
B14_0d98:		tax				; aa 
B14_0d99:	.db $da
B14_0d9a:		sbc $aada		; edda aa
B14_0d9d:		tax				; aa 
B14_0d9e:		tax				; aa 
B14_0d9f:		tax				; aa 
B14_0da0:		tax				; aa 
B14_0da1:	.db $da
B14_0da2:		tax				; aa 
B14_0da3:		lda $5a			; a5 5a
B14_0da5:		inc $aaef		; ee ef aa
B14_0da8:		eor ($25), y	; 51 25
B14_0daa:	.db $12
B14_0dab:	.db $52
B14_0dac:		tax				; aa 
B14_0dad:		tax				; aa 
B14_0dae:		cmp $25, x		; d5 25
B14_0db0:		bpl B14_0dc2 ; 10 10

B14_0db2:		ora ($5a), y	; 11 5a
B14_0db4:		sbc $aada		; edda aa
B14_0db7:	.db $da
B14_0db8:		cmp $5aad, x	; dd ad 5a
B14_0dbb:		tax				; aa 
B14_0dbc:		tax				; aa 
B14_0dbd:		tax				; aa 
B14_0dbe:		tax				; aa 
B14_0dbf:	.db $da
B14_0dc0:		tax				; aa 
B14_0dc1:		tax				; aa 
B14_0dc2:	.db $5a
B14_0dc3:		cmp $d5dd, x	; dd dd d5
B14_0dc6:	.db $52
B14_0dc7:		and $25			; 25 25
B14_0dc9:	.db $22
B14_0dca:		tax				; aa 
B14_0dcb:		tax				; aa 
B14_0dcc:		lda $1125		; ad 25 11
B14_0dcf:		ora ($02, x)	; 01 02
B14_0dd1:		tax				; aa 
B14_0dd2:		cmp $5aad, x	; dd ad 5a
B14_0dd5:	.db $da
B14_0dd6:		cmp $55ad, x	; dd ad 55
B14_0dd9:		tax				; aa 
B14_0dda:		tax				; aa 
B14_0ddb:		tax				; aa 
B14_0ddc:		tax				; aa 
B14_0ddd:		cmp $aa, x		; d5 aa
B14_0ddf:		tax				; aa 
B14_0de0:		tax				; aa 
B14_0de1:		cmp $eada, x	; dd da ea
B14_0de4:		tax				; aa 
B14_0de5:	.db $52
B14_0de6:		eor ($25), y	; 51 25
B14_0de8:		rol a			; 2a
B14_0de9:		tax				; aa 
B14_0dea:		tax				; aa 
B14_0deb:		lda $21			; a5 21
B14_0ded:		;removed
	.db $10 $12

B14_0def:		eor $5a, x		; 55 5a
B14_0df1:	.db $da
B14_0df2:	.db $da
B14_0df3:	.db $da
B14_0df4:	.db $da
B14_0df5:	.db $da
B14_0df6:		cmp $5a, x		; d5 5a
B14_0df8:		tax				; aa 
B14_0df9:		tax				; aa 
B14_0dfa:		tax				; aa 
B14_0dfb:		cmp $aa, x		; d5 aa
B14_0dfd:		tax				; aa 
B14_0dfe:		tax				; aa 
B14_0dff:	.db $da
B14_0e00:		inc $a5da		; ee da a5
B14_0e03:	.db $52
B14_0e04:	.db $52
B14_0e05:	.db $52
B14_0e06:	.db $52
B14_0e07:		tax				; aa 
B14_0e08:		tax				; aa 
B14_0e09:		lda $22			; a5 22
B14_0e0b:		and ($11, x)	; 21 11
B14_0e0d:		rol a			; 2a
B14_0e0e:		tax				; aa 
B14_0e0f:	.db $da
B14_0e10:		cmp $ad, x		; d5 ad
B14_0e12:	.db $da
B14_0e13:	.db $da
B14_0e14:		cmp $55, x		; d5 55
B14_0e16:		tax				; aa 
B14_0e17:		tax				; aa 
B14_0e18:		tax				; aa 
B14_0e19:		cmp $5a, x		; d5 5a
B14_0e1b:		tax				; aa 
B14_0e1c:		tax				; aa 
B14_0e1d:	.db $da
B14_0e1e:		cmp $55ad, x	; dd ad 55
B14_0e21:	.db $52
B14_0e22:	.db $52
B14_0e23:	.db $52
B14_0e24:		eor $2a, x		; 55 2a
B14_0e26:		tax				; aa 
B14_0e27:		lda $22			; a5 22
B14_0e29:	.db $22
B14_0e2a:	.db $22
B14_0e2b:	.db $52
B14_0e2c:		lda $ad5a		; ad 5a ad
B14_0e2f:		lda $daae		; ad ae da
B14_0e32:		lda $aa55		; ad 55 aa
B14_0e35:		tax				; aa 
B14_0e36:		tax				; aa 
B14_0e37:		lda $aa5a		; ad 5a aa
B14_0e3a:		tax				; aa 
B14_0e3b:		lda $eada		; ad da ea
B14_0e3e:		cmp $52, x		; d5 52
B14_0e40:		eor $25, x		; 55 25
B14_0e42:		and $2a			; 25 2a
B14_0e44:		tax				; aa 
B14_0e45:		lda $22			; a5 22
B14_0e47:		;removed
	.db $50 $25

B14_0e49:		ora $55, x		; 15 55
B14_0e4b:	.db $5a
B14_0e4c:		lda $adad		; ad ad ad
B14_0e4f:		lda $55ad		; ad ad 55
B14_0e52:		tax				; aa 
B14_0e53:		tax				; aa 
B14_0e54:		tax				; aa 
B14_0e55:		lda $aa5a		; ad 5a aa
B14_0e58:		tax				; aa 
B14_0e59:		lda $daae		; ad ae da
B14_0e5c:		lda $a52a		; ad 2a a5
B14_0e5f:		and $25			; 25 25
B14_0e61:	.db $52
B14_0e62:		tax				; aa 
B14_0e63:		lda $25			; a5 25
B14_0e65:		ora ($11), y	; 11 11
B14_0e67:		and $55			; 25 55
B14_0e69:	.db $5a
B14_0e6a:		lda $ed5a		; ad 5a ed
B14_0e6d:		lda $d5aa		; ad aa d5
B14_0e70:	.db $5a
B14_0e71:		tax				; aa 
B14_0e72:		tax				; aa 
B14_0e73:		lda $aa55		; ad 55 aa
B14_0e76:		tax				; aa 
B14_0e77:		lda $adad		; ad ad ad
B14_0e7a:		tax				; aa 
B14_0e7b:		tax				; aa 
B14_0e7c:		eor $25, x		; 55 25
B14_0e7e:	.db $52
B14_0e7f:		eor $2a, x		; 55 2a
B14_0e81:		lda $25			; a5 25
B14_0e83:		ora ($22), y	; 11 22
B14_0e85:	.db $52
B14_0e86:		lda $aa			; a5 aa
B14_0e88:		tax				; aa 
B14_0e89:	.db $da
B14_0e8a:		cmp $5aad, x	; dd ad 5a
B14_0e8d:		cmp $55, x		; d5 55
B14_0e8f:		tax				; aa 
B14_0e90:		tax				; aa 
B14_0e91:		lda $aa55		; ad 55 aa
B14_0e94:		tax				; aa 
B14_0e95:		lda $adad		; ad ad ad
B14_0e98:		tax				; aa 
B14_0e99:		tax				; aa 
B14_0e9a:		eor $2a, x		; 55 2a
B14_0e9c:	.db $52
B14_0e9d:		eor $2a, x		; 55 2a
B14_0e9f:		lda $25			; a5 25
B14_0ea1:	.db $22
B14_0ea2:		and $12			; 25 12
B14_0ea4:		tax				; aa 
B14_0ea5:		tax				; aa 
B14_0ea6:		tax				; aa 
B14_0ea7:	.db $da
B14_0ea8:	.db $da
B14_0ea9:	.db $da
B14_0eaa:	.db $da
B14_0eab:		lda $aa55		; ad 55 aa
B14_0eae:		tax				; aa 
B14_0eaf:		lda $aa55		; ad 55 aa
B14_0eb2:		tax				; aa 
B14_0eb3:		lda $adad		; ad ad ad
B14_0eb6:	.db $5a
B14_0eb7:		tax				; aa 
B14_0eb8:		eor $2a, x		; 55 2a
B14_0eba:	.db $52
B14_0ebb:		lda $52			; a5 52
B14_0ebd:		lda $25			; a5 25
B14_0ebf:	.db $22
B14_0ec0:		and $25			; 25 25
B14_0ec2:		rol a			; 2a
B14_0ec3:		tax				; aa 
B14_0ec4:		tax				; aa 
B14_0ec5:	.db $da
B14_0ec6:	.db $da
B14_0ec7:	.db $da
B14_0ec8:	.db $da
B14_0ec9:		lda $aa55		; ad 55 aa
B14_0ecc:		tax				; aa 
B14_0ecd:		lda $5a55		; ad 55 5a
B14_0ed0:		tax				; aa 
B14_0ed1:		lda $da5a		; ad 5a da
B14_0ed4:		cmp $55, x		; d5 55
B14_0ed6:		eor $2a, x		; 55 2a
B14_0ed8:	.db $52
B14_0ed9:		lda $52			; a5 52
B14_0edb:		lda $25			; a5 25
B14_0edd:	.db $22
B14_0ede:		eor ($25), y	; 51 25
B14_0ee0:	.db $52
B14_0ee1:		tax				; aa 
B14_0ee2:		lda $da5a		; ad 5a da
B14_0ee5:	.db $da
B14_0ee6:		cmp $aa, x		; d5 aa
B14_0ee8:		cmp $5a, x		; d5 5a
B14_0eea:		tax				; aa 
B14_0eeb:		lda $5a55		; ad 55 5a
B14_0eee:		tax				; aa 
B14_0eef:		lda $da5a		; ad 5a da
B14_0ef2:		cmp $55, x		; d5 55
B14_0ef4:		eor $2a, x		; 55 2a
B14_0ef6:		eor $25, x		; 55 25
B14_0ef8:	.db $52
B14_0ef9:		lda $51			; a5 51
B14_0efb:		and $12			; 25 12
B14_0efd:	.db $52
B14_0efe:		eor $52, x		; 55 52
B14_0f00:		lda $da5a		; ad 5a da
B14_0f03:	.db $da
B14_0f04:		lda $d5aa		; ad aa d5
B14_0f07:	.db $5a
B14_0f08:		tax				; aa 
B14_0f09:		tax				; aa 
B14_0f0a:		cmp $5a, x		; d5 5a
B14_0f0c:		tax				; aa 
B14_0f0d:		lda $d55a		; ad 5a d5
B14_0f10:		lda $5555		; ad 55 55
B14_0f13:		rol a			; 2a
B14_0f14:		eor $2a, x		; 55 2a
B14_0f16:		eor $25, x		; 55 25
B14_0f18:	.db $52
B14_0f19:		and $22			; 25 22
B14_0f1b:	.db $52
B14_0f1c:		eor $55, x		; 55 55
B14_0f1e:		eor $5a, x		; 55 5a
B14_0f20:	.db $da
B14_0f21:		cmp $ad, x		; d5 ad
B14_0f23:		tax				; aa 
B14_0f24:		cmp $5a, x		; d5 5a
B14_0f26:		tax				; aa 
B14_0f27:		tax				; aa 
B14_0f28:		cmp $5a, x		; d5 5a
B14_0f2a:		tax				; aa 
B14_0f2b:		tax				; aa 
B14_0f2c:	.db $da
B14_0f2d:		lda $d5aa		; ad aa d5
B14_0f30:		eor $2a, x		; 55 2a
B14_0f32:		eor $2a, x		; 55 2a
B14_0f34:		eor $2a, x		; 55 2a
B14_0f36:	.db $52
B14_0f37:		eor ($22), y	; 51 22
B14_0f39:	.db $52
B14_0f3a:		lda $55			; a5 55
B14_0f3c:		eor $5a, x		; 55 5a
B14_0f3e:		lda $adad		; ad ad ad
B14_0f41:	.db $5a
B14_0f42:		lda $aa55		; ad 55 aa
B14_0f45:		tax				; aa 
B14_0f46:		cmp $5a, x		; d5 5a
B14_0f48:		tax				; aa 
B14_0f49:		tax				; aa 
B14_0f4a:	.db $da
B14_0f4b:		lda $adaa		; ad aa ad
B14_0f4e:		eor $2a, x		; 55 2a
B14_0f50:		eor $2a, x		; 55 2a
B14_0f52:		eor $2a, x		; 55 2a
B14_0f54:	.db $52
B14_0f55:		eor ($25), y	; 51 25
B14_0f57:		and $2a			; 25 2a
B14_0f59:		eor $55, x		; 55 55
B14_0f5b:	.db $5a
B14_0f5c:		lda $adad		; ad ad ad
B14_0f5f:	.db $5a
B14_0f60:		lda $aa55		; ad 55 aa
B14_0f63:		tax				; aa 
B14_0f64:		cmp $5a, x		; d5 5a
B14_0f66:		tax				; aa 
B14_0f67:		tax				; aa 
B14_0f68:		cmp $ad, x		; d5 ad
B14_0f6a:	.db $5a
B14_0f6b:		tax				; aa 
B14_0f6c:		tax				; aa 
B14_0f6d:		tax				; aa 
B14_0f6e:		eor $2a, x		; 55 2a
B14_0f70:		eor $2a, x		; 55 2a
B14_0f72:	.db $52
B14_0f73:	.db $52
B14_0f74:		and $25			; 25 25
B14_0f76:		rol a			; 2a
B14_0f77:		eor $55, x		; 55 55
B14_0f79:	.db $5a
B14_0f7a:		lda $adad		; ad ad ad
B14_0f7d:	.db $5a
B14_0f7e:		lda $aa55		; ad 55 aa
B14_0f81:		tax				; aa 
B14_0f82:		cmp $55, x		; d5 55
B14_0f84:		tax				; aa 
B14_0f85:		tax				; aa 
B14_0f86:		cmp $ad, x		; d5 ad
B14_0f88:	.db $5a
B14_0f89:		tax				; aa 
B14_0f8a:		tax				; aa 
B14_0f8b:		tax				; aa 
B14_0f8c:		eor $2a, x		; 55 2a
B14_0f8e:		eor $2a, x		; 55 2a
B14_0f90:	.db $52
B14_0f91:	.db $52
B14_0f92:		eor ($25), y	; 51 25
B14_0f94:	.db $52
B14_0f95:		lda $55			; a5 55
B14_0f97:	.db $5a
B14_0f98:		cmp $ad, x		; d5 ad
B14_0f9a:		tax				; aa 
B14_0f9b:	.db $da
B14_0f9c:		lda $5a55		; ad 55 5a
B14_0f9f:		tax				; aa 
B14_0fa0:		cmp $55, x		; d5 55
B14_0fa2:		tax				; aa 
B14_0fa3:		tax				; aa 
B14_0fa4:		cmp $aa, x		; d5 aa
B14_0fa6:		cmp $aa, x		; d5 aa
B14_0fa8:		tax				; aa 
B14_0fa9:		tax				; aa 
B14_0faa:		eor $2a, x		; 55 2a
B14_0fac:		lda $52			; a5 52
B14_0fae:	.db $52
B14_0faf:	.db $52
B14_0fb0:	.db $52
B14_0fb1:		rol a			; 2a
B14_0fb2:	.db $52
B14_0fb3:		tax				; aa 
B14_0fb4:		eor $aa, x		; 55 aa
B14_0fb6:		cmp $ad, x		; d5 ad
B14_0fb8:		tax				; aa 
B14_0fb9:	.db $da
B14_0fba:		tax				; aa 
B14_0fbb:		cmp $5a, x		; d5 5a
B14_0fbd:		tax				; aa 
B14_0fbe:		cmp $55, x		; d5 55
B14_0fc0:		tax				; aa 
B14_0fc1:		tax				; aa 
B14_0fc2:		cmp $aa, x		; d5 aa
B14_0fc4:		cmp $aa, x		; d5 aa
B14_0fc6:		tax				; aa 
B14_0fc7:		tax				; aa 
B14_0fc8:		eor $2a, x		; 55 2a
B14_0fca:		lda $52			; a5 52
B14_0fcc:	.db $52
B14_0fcd:	.db $52
B14_0fce:	.db $52
B14_0fcf:	.db $52
B14_0fd0:	.db $52
B14_0fd1:		tax				; aa 
B14_0fd2:		tax				; aa 
B14_0fd3:		tax				; aa 
B14_0fd4:		cmp $ad, x		; d5 ad
B14_0fd6:		tax				; aa 
B14_0fd7:		cmp $aa, x		; d5 aa
B14_0fd9:		cmp $5a, x		; d5 5a
B14_0fdb:		tax				; aa 
B14_0fdc:		cmp $55, x		; d5 55
B14_0fde:		tax				; aa 
B14_0fdf:		tax				; aa 
B14_0fe0:		cmp $aa, x		; d5 aa
B14_0fe2:		cmp $5a, x		; d5 5a
B14_0fe4:		tax				; aa 
B14_0fe5:		lda $55			; a5 55
B14_0fe7:		rol a			; 2a
B14_0fe8:		lda $55			; a5 55
B14_0fea:		eor $aa, x		; 55 aa
B14_0fec:		eor $55, x		; 55 55
B14_0fee:	.db $5a
B14_0fef:		tax				; aa 
B14_0ff0:	.db $5a
B14_0ff1:		tax				; aa 
B14_0ff2:		tax				; aa 
B14_0ff3:		lda $aa			; a5 aa
B14_0ff5:		tax				; aa 
B14_0ff6:	.db $5a
B14_0ff7:	.db $5a
B14_0ff8:		.db $00				; 00
B14_0ff9:		.db $00				; 00
B14_0ffa:		.db $00				; 00
B14_0ffb:		.db $00				; 00
B14_0ffc:		.db $00				; 00
B14_0ffd:		.db $00				; 00
B14_0ffe:		.db $00				; 00
B14_0fff:		.db $00				; 00
B14_1000:		cmp $0a50, x	; dd 50 0a
B14_1003:		lsr $ff50, x	; 5e 50 ff
B14_1006:		.db $00				; 00
B14_1007:	.db $ff
B14_1008:	.db $ff
B14_1009:		jsr $02ff		; 20 ff 02
B14_100c:		.db $00				; 00
B14_100d:		.db $00				; 00
B14_100e:		.db $00				; 00
B14_100f:	.db $0f
B14_1010:	.db $ff
B14_1011:	.db $ff
B14_1012:		;removed
	.db $d0 $e0

B14_1014:	.db $0f
B14_1015:	.db $af
B14_1016:	.db $ff
B14_1017:	.db $2f
B14_1018:		.db $00				; 00
B14_1019:	.db $0f
B14_101a:	.db $fa
B14_101b:		bpl B14_0fcc ; 10 af

B14_101d:		eor $f01e, x	; 5d 1e f0
B14_1020:		.db $00				; 00
B14_1021:	.db $0f
B14_1022:	.db $ff
B14_1023:	.db $ff
B14_1024:	.db $ff
B14_1025:		.db $00				; 00
B14_1026:		ora ($0e, x)	; 01 0e
B14_1028:	.db $0f
B14_1029:		beq B14_102b ; f0 00

B14_102b:	.db $1f
B14_102c:		sbc ($5f), y	; f1 5f
B14_102e:		cpx #$12		; e0 12
B14_1030:		.db $00				; 00
B14_1031:		.db $00				; 00
B14_1032:		.db $00				; 00
B14_1033:	.db $ff
B14_1034:	.db $ff
B14_1035:	.db $ff
B14_1036:		asl a			; 0a
B14_1037:		;removed
	.db $50 $2f

B14_1039:	.db $ff
B14_103a:	.db $f2
B14_103b:		beq B14_104d ; f0 10

B14_103d:	.db $ef
B14_103e:		nop				; ea 
B14_103f:		.db $00				; 00
B14_1040:	.db $ff
B14_1041:	.db $5a
B14_1042:	.db $0f
B14_1043:		beq B14_1045 ; f0 00

B14_1045:	.db $5f
B14_1046:		inc $f1ff, x	; fe ff f1
B14_1049:		.db $00				; 00
B14_104a:		ora $25, x		; 15 25
B14_104c:	.db $0f
B14_104d:		beq B14_104f ; f0 00

B14_104f:	.db $af
B14_1050:	.db $fa
B14_1051:	.db $0d $f2 $00
B14_1054:		.db $00				; 00
B14_1055:		bvc B14_1057 ; 50 00

B14_1057:	.db $ff
B14_1058:	.db $ff
B14_1059:		sbc $0e, x		; f5 0e
B14_105b:		.db $00				; 00
B14_105c:	.db $ff
B14_105d:	.db $ff
B14_105e:	.db $f2
B14_105f:		beq B14_1061 ; f0 00

B14_1061:	.db $ff
B14_1062:		lda ($0d, x)	; a1 0d
B14_1064:		sbc $a1, x		; f5 a1
B14_1066:	.db $fa
B14_1067:		jsr $ff01		; 20 01 ff
B14_106a:		sbc $f0ff, x	; fd ff f0
B14_106d:		.db $00				; 00
B14_106e:	.db $12
B14_106f:		ldy #$fa		; a0 fa
B14_1071:		jsr $ff05		; 20 05 ff
B14_1074:		beq B14_1085 ; f0 0f

B14_1076:		beq B14_1078 ; f0 00

B14_1078:		.db $00				; 00
B14_1079:		jsr $ff0f		; 20 0f ff
B14_107c:	.db $ff
B14_107d:		lda ($a2, x)	; a1 a2
B14_107f:		asl a			; 0a
B14_1080:	.db $ff
B14_1081:	.db $ff
B14_1082:	.db $da
B14_1083:		ldy #$05		; a0 05
B14_1085:		inc $1f50, x	; fe 50 1f
B14_1088:		cmp $50, x		; d5 50
B14_108a:	.db $ff
B14_108b:		.db $00				; 00
B14_108c:	.db $02
B14_108d:	.db $ff
B14_108e:	.db $ff
B14_108f:	.db $ff
B14_1090:		beq B14_1092 ; f0 00

B14_1092:	.db $02
B14_1093:	.db $20 $ff $00
B14_1096:		ora $a0ff		; 0d ff a0
B14_1099:	.db $df
B14_109a:		jsr $0100		; 20 00 01
B14_109d:		.db $00				; 00
B14_109e:	.db $0f
B14_109f:	.db $ff
B14_10a0:	.db $ff
B14_10a1:		cmp ($50), y	; d1 50
B14_10a3:		rol $ffff		; 2e ff ff
B14_10a6:		tax				; aa 
B14_10a7:		;removed
	.db $10 $0f

B14_10a9:	.db $fa
B14_10aa:		bpl B14_108a ; 10 de

B14_10ac:	.db $da
B14_10ad:		ora ($ff), y	; 11 ff
B14_10af:		jsr $ff02		; 20 02 ff
B14_10b2:	.db $ff
B14_10b3:	.db $ff
B14_10b4:		ldy #$00		; a0 00
B14_10b6:		asl a			; 0a
B14_10b7:		ora ($ff, x)	; 01 ff
B14_10b9:		;removed
	.db $10 $0e

B14_10bb:	.db $ff
B14_10bc:	.db $02
B14_10bd:	.db $fd $10 $00
B14_10c0:		.db $00				; 00
B14_10c1:		.db $00				; 00
B14_10c2:	.db $1f
B14_10c3:	.db $ff
B14_10c4:	.db $ff
B14_10c5:		lda $21			; a5 21
B14_10c7:		eor $feff, x	; 5d ff fe
B14_10ca:		lda $00			; a5 00
B14_10cc:		lsr $05f5, x	; 5e f5 05
B14_10cf:		ldx $2ed2		; ae d2 2e
B14_10d2:		sbc $0e00, x	; fd 00 0e
B14_10d5:	.db $ff
B14_10d6:	.db $ff
B14_10d7:	.db $ff
B14_10d8:		.db $00				; 00
B14_10d9:		.db $00				; 00
B14_10da:	.db $12
B14_10db:	.db $1a
B14_10dc:	.db $fa
B14_10dd:		.db $00				; 00
B14_10de:	.db $af
B14_10df:	.db $fa
B14_10e0:		rol a			; 2a
B14_10e1:		sbc $10			; e5 10
B14_10e3:		.db $00				; 00
B14_10e4:		.db $00				; 00
B14_10e5:		.db $00				; 00
B14_10e6:	.db $ff
B14_10e7:	.db $ff
B14_10e8:		inc $0551, x	; fe 51 05
B14_10eb:	.db $af
B14_10ec:	.db $ff
B14_10ed:		sbc $0221, x	; fd 21 02
B14_10f0:	.db $af
B14_10f1:		lda $2a			; a5 2a
B14_10f3:	.db $da
B14_10f4:		cmp ($ae), y	; d1 ae
B14_10f6:		sbc $00			; e5 00
B14_10f8:		eor $ffff, x	; 5d ff ff
B14_10fb:		sbc $00, x		; f5 00
B14_10fd:		.db $00				; 00
B14_10fe:	.db $22
B14_10ff:		lsr $11e2, x	; 5e e2 11
B14_1102:	.db $af
B14_1103:		cmp $55, x		; d5 55
B14_1105:	.db $52
B14_1106:		bpl B14_1108 ; 10 00

B14_1108:		.db $00				; 00
B14_1109:	.db $12
B14_110a:	.db $ff
B14_110b:	.db $ff
B14_110c:	.db $fa
B14_110d:		bvc B14_1139 ; 50 2a

B14_110f:	.db $df
B14_1110:	.db $ff
B14_1111:		nop				; ea 
B14_1112:		bvc B14_1136 ; 50 22

B14_1114:		cmp $2d55, x	; dd 55 2d
B14_1117:	.db $5a
B14_1118:		lda $dd			; a5 dd
B14_111a:		eor ($02), y	; 51 02
B14_111c:		ldx $ffff		; ae ff ff
B14_111f:		sbc ($00), y	; f1 00
B14_1121:		ora ($12, x)	; 01 12
B14_1123:	.db $da
B14_1124:		lda $0a			; a5 0a
B14_1126:		inc $d5aa		; ee aa d5
B14_1129:		eor ($00), y	; 51 00
B14_112b:		.db $00				; 00
B14_112c:		ora ($1d, x)	; 01 1d
B14_112e:	.db $ff
B14_112f:	.db $ff
B14_1130:	.db $d2
B14_1131:	.db $22
B14_1132:		and $fedf		; 2d df fe
B14_1135:		nop				; ea 
B14_1136:	.db $22
B14_1137:		and $ad			; 25 ad
B14_1139:		eor $55, x		; 55 55
B14_113b:		tax				; aa 
B14_113c:		tax				; aa 
B14_113d:		sbc $2522		; ed22 25
B14_1140:		lda $feff		; ad ff fe
B14_1143:		cmp ($00), y	; d1 00
B14_1145:		ora ($12), y	; 11 12
B14_1147:	.db $da
B14_1148:		eor ($55), y	; 51 55
B14_114a:		lda $d5aa		; ad aa d5
B14_114d:		and ($00, x)	; 21 00
B14_114f:		.db $00				; 00
B14_1150:		ora ($2f), y	; 11 2f
B14_1152:	.db $ff
B14_1153:		inc $22d2, x	; fe d2 22
B14_1156:	.db $5a
B14_1157:		inc $d5fe, x	; fe fe d5
B14_115a:		ora ($2a), y	; 11 2a
B14_115c:		tax				; aa 
B14_115d:		tax				; aa 
B14_115e:		cmp $a5, x		; d5 a5
B14_1160:		lda $52aa		; ad aa 52
B14_1163:		rol a			; 2a
B14_1164:		cmp $fdef, x	; dd ef fd
B14_1167:	.db $52
B14_1168:		;removed
	.db $10 $11

B14_116a:		ora $55, x		; 15 55
B14_116c:		and $5a			; 25 5a
B14_116e:		cmp $aa, x		; d5 aa
B14_1170:	.db $d2
B14_1171:		;removed
	.db $50 $10

B14_1173:		.db $00				; 00
B14_1174:		ora ($af), y	; 11 af
B14_1176:	.db $ff
B14_1177:		inc $25a5		; ee a5 25
B14_117a:		rol $ddef		; 2e ef dd
B14_117d:		tax				; aa 
B14_117e:		and $55			; 25 55
B14_1180:		rol a			; 2a
B14_1181:		lda $5a55		; ad 55 5a
B14_1184:		lda $25a5		; ad a5 25
B14_1187:		eor $ae, x		; 55 ae
B14_1189:		inc $a2fa, x	; fe fa a2
B14_118c:	.db $22
B14_118d:		ora ($25), y	; 11 25
B14_118f:	.db $52
B14_1190:		eor $5a, x		; 55 5a
B14_1192:		lda $a5aa		; ad aa a5
B14_1195:		ora ($00), y	; 11 00
B14_1197:		;removed
	.db $10 $15

B14_1199:	.db $af
B14_119a:	.db $ef
B14_119b:		cmp $2555, x	; dd 55 25
B14_119e:		lda $dddd		; ad dd dd
B14_11a1:		eor $2a, x		; 55 2a
B14_11a3:		eor $52, x		; 55 52
B14_11a5:		cmp $55, x		; d5 55
B14_11a7:	.db $5a
B14_11a8:		cmp $55, x		; d5 55
B14_11aa:		and $55			; 25 55
B14_11ac:		cmp $edee, x	; dd ee ed
B14_11af:		and $11			; 25 11
B14_11b1:		ora ($2a), y	; 11 2a
B14_11b3:	.db $52
B14_11b4:		eor $aa, x		; 55 aa
B14_11b6:		lda $a2aa		; ad aa a2
B14_11b9:	.db $22
B14_11ba:		bpl B14_11cc ; 10 10

B14_11bc:		rol a			; 2a
B14_11bd:		inc $dafd		; ee fd da
B14_11c0:	.db $d2
B14_11c1:		tax				; aa 
B14_11c2:	.db $da
B14_11c3:		inc $d2da		; ee da d2
B14_11c6:		tax				; aa 
B14_11c7:		eor $55, x		; 55 55
B14_11c9:		eor $55, x		; 55 55
B14_11cb:	.db $5a
B14_11cc:		cmp $52, x		; d5 52
B14_11ce:		lda $5a			; a5 5a
B14_11d0:		inc $eaee		; ee ee ea
B14_11d3:	.db $52
B14_11d4:		eor ($12), y	; 51 12
B14_11d6:	.db $52
B14_11d7:	.db $52
B14_11d8:		eor $aa, x		; 55 aa
B14_11da:		lda $515a		; ad 5a 51
B14_11dd:		ora ($01), y	; 11 01
B14_11df:	.db $02
B14_11e0:	.db $5a
B14_11e1:		cmp $dadd, x	; dd dd da
B14_11e4:		tax				; aa 
B14_11e5:		lda $daad		; ad ad da
B14_11e8:	.db $da
B14_11e9:		tax				; aa 
B14_11ea:		tax				; aa 
B14_11eb:		eor $55, x		; 55 55
B14_11ed:		eor $55, x		; 55 55
B14_11ef:		tax				; aa 
B14_11f0:		cmp $52, x		; d5 52
B14_11f2:		lda $ad			; a5 ad
B14_11f4:		ldx $d5fa		; ae fa d5
B14_11f7:		eor ($22), y	; 51 22
B14_11f9:	.db $52
B14_11fa:	.db $52
B14_11fb:		rol a			; 2a
B14_11fc:		eor $aa, x		; 55 aa
B14_11fe:		lda $2255		; ad 55 22
B14_1201:	.db $22
B14_1202:		ora ($05), y	; 11 05
B14_1204:		and $edae		; 2d ae ed
B14_1207:		lda $daaa		; ad aa da
B14_120a:	.db $da
B14_120b:	.db $da
B14_120c:		cmp $aa, x		; d5 aa
B14_120e:		lda $55			; a5 55
B14_1210:		eor $55, x		; 55 55
B14_1212:		eor $ad, x		; 55 ad
B14_1214:		eor $2a, x		; 55 2a
B14_1216:		tax				; aa 
B14_1217:		ldx $dadd		; ae dd da
B14_121a:		tax				; aa 
B14_121b:		lda $12			; a5 12
B14_121d:	.db $52
B14_121e:		eor ($2a), y	; 51 2a
B14_1220:		tax				; aa 
B14_1221:		tax				; aa 
B14_1222:		lda $5152		; ad 52 51
B14_1225:		and ($10, x)	; 21 10
B14_1227:	.db $52
B14_1228:	.db $5a
B14_1229:		cmp $adad, x	; dd ad ad
B14_122c:		tax				; aa 
B14_122d:	.db $da
B14_122e:		sbc $55ad		; edad 55
B14_1231:		eor $55, x		; 55 55
B14_1233:		eor $55, x		; 55 55
B14_1235:		eor $5a, x		; 55 5a
B14_1237:		lda $aa52		; ad 52 aa
B14_123a:		tax				; aa 
B14_123b:	.db $da
B14_123c:		sbc $aad5		; edd5 aa
B14_123f:	.db $52
B14_1240:	.db $52
B14_1241:	.db $52
B14_1242:		and $52			; 25 52
B14_1244:		tax				; aa 
B14_1245:		tax				; aa 
B14_1246:		lda $252a		; ad 2a 25
B14_1249:		bpl B14_126d ; 10 22

B14_124b:	.db $52
B14_124c:		lda $adad		; ad ad ad
B14_124f:		lda $adad		; ad ad ad
B14_1252:		lda $55ad		; ad ad 55
B14_1255:		eor $55, x		; 55 55
B14_1257:		eor $55, x		; 55 55
B14_1259:		eor $aa, x		; 55 aa
B14_125b:		tax				; aa 
B14_125c:		tax				; aa 
B14_125d:		tax				; aa 
B14_125e:		lda $aead		; ad ad ae
B14_1261:		cmp $55, x		; d5 55
B14_1263:		and $2a			; 25 2a
B14_1265:		eor ($25), y	; 51 25
B14_1267:	.db $52
B14_1268:		tax				; aa 
B14_1269:		tax				; aa 
B14_126a:		tax				; aa 
B14_126b:		lda $12			; a5 12
B14_126d:	.db $22
B14_126e:	.db $22
B14_126f:		eor $5a, x		; 55 5a
B14_1271:	.db $da
B14_1272:		lda $adad		; ad ad ad
B14_1275:		lda $add5		; ad d5 ad
B14_1278:		eor $55, x		; 55 55
B14_127a:		eor $55, x		; 55 55
B14_127c:		eor $55, x		; 55 55
B14_127e:		tax				; aa 
B14_127f:		tax				; aa 
B14_1280:		tax				; aa 
B14_1281:		tax				; aa 
B14_1282:		lda $daad		; ad ad da
B14_1285:		lda $a552		; ad 52 a5
B14_1288:		and $25			; 25 25
B14_128a:		and $52			; 25 52
B14_128c:		tax				; aa 
B14_128d:		tax				; aa 
B14_128e:		tax				; aa 
B14_128f:	.db $52
B14_1290:		and $11			; 25 11
B14_1292:	.db $22
B14_1293:		tax				; aa 
B14_1294:		lda $d55a		; ad 5a d5
B14_1297:		lda $daae		; ad ae da
B14_129a:	.db $da
B14_129b:		lda $5555		; ad 55 55
B14_129e:		eor $55, x		; 55 55
B14_12a0:		eor $5a, x		; 55 5a
B14_12a2:		tax				; aa 
B14_12a3:		tax				; aa 
B14_12a4:		tax				; aa 
B14_12a5:		tax				; aa 
B14_12a6:		cmp $ae, x		; d5 ae
B14_12a8:	.db $da
B14_12a9:		tax				; aa 
B14_12aa:		tax				; aa 
B14_12ab:		eor $25, x		; 55 25
B14_12ad:		and $25			; 25 25
B14_12af:	.db $52
B14_12b0:		tax				; aa 
B14_12b1:		tax				; aa 
B14_12b2:		lda $25			; a5 25
B14_12b4:	.db $22
B14_12b5:		and $25			; 25 25
B14_12b7:		rol a			; 2a
B14_12b8:		cmp $aa, x		; d5 aa
B14_12ba:	.db $da
B14_12bb:	.db $da
B14_12bc:	.db $da
B14_12bd:	.db $da
B14_12be:	.db $da
B14_12bf:		lda $5555		; ad 55 55
B14_12c2:		eor $55, x		; 55 55
B14_12c4:		eor $5a, x		; 55 5a
B14_12c6:		tax				; aa 
B14_12c7:		tax				; aa 
B14_12c8:		tax				; aa 
B14_12c9:		tax				; aa 
B14_12ca:	.db $da
B14_12cb:	.db $da
B14_12cc:	.db $da
B14_12cd:		tax				; aa 
B14_12ce:		lda $52			; a5 52
B14_12d0:		eor $25, x		; 55 25
B14_12d2:		and $52			; 25 52
B14_12d4:		tax				; aa 
B14_12d5:		tax				; aa 
B14_12d6:		eor $22, x		; 55 22
B14_12d8:		eor ($25), y	; 51 25
B14_12da:		and $55			; 25 55
B14_12dc:	.db $5a
B14_12dd:		lda $da5a		; ad 5a da
B14_12e0:	.db $da
B14_12e1:	.db $da
B14_12e2:	.db $da
B14_12e3:		lda $5555		; ad 55 55
B14_12e6:		eor $55, x		; 55 55
B14_12e8:		eor $aa, x		; 55 aa
B14_12ea:		tax				; aa 
B14_12eb:		tax				; aa 
B14_12ec:		tax				; aa 
B14_12ed:		lda $da5a		; ad 5a da
B14_12f0:		cmp $aa, x		; d5 aa
B14_12f2:		eor $2a, x		; 55 2a
B14_12f4:	.db $52
B14_12f5:		lda $25			; a5 25
B14_12f7:	.db $52
B14_12f8:		tax				; aa 
B14_12f9:		lda $52			; a5 52
B14_12fb:	.db $52
B14_12fc:		and $12			; 25 12
B14_12fe:		lda $55			; a5 55
B14_1300:		tax				; aa 
B14_1301:		cmp $aa, x		; d5 aa
B14_1303:		cmp $adad, x	; dd ad ad
B14_1306:	.db $5a
B14_1307:		lda $5555		; ad 55 55
B14_130a:		eor $55, x		; 55 55
B14_130c:		eor $aa, x		; 55 aa
B14_130e:		tax				; aa 
B14_130f:		tax				; aa 
B14_1310:		tax				; aa 
B14_1311:		cmp $ad, x		; d5 ad
B14_1313:	.db $5a
B14_1314:		cmp $55, x		; d5 55
B14_1316:	.db $52
B14_1317:		lda $52			; a5 52
B14_1319:		eor $25, x		; 55 25
B14_131b:	.db $52
B14_131c:		tax				; aa 
B14_131d:		lda $25			; a5 25
B14_131f:		and $12			; 25 12
B14_1321:	.db $52
B14_1322:		tax				; aa 
B14_1323:		tax				; aa 
B14_1324:		tax				; aa 
B14_1325:		cmp $ad, x		; d5 ad
B14_1327:		lda $adad		; ad ad ad
B14_132a:	.db $5a
B14_132b:		lda $5555		; ad 55 55
B14_132e:		eor $55, x		; 55 55
B14_1330:	.db $5a
B14_1331:		tax				; aa 
B14_1332:		tax				; aa 
B14_1333:		tax				; aa 
B14_1334:		tax				; aa 
B14_1335:		cmp $ad, x		; d5 ad
B14_1337:		tax				; aa 
B14_1338:		cmp $55, x		; d5 55
B14_133a:	.db $52
B14_133b:		lda $2a			; a5 2a
B14_133d:	.db $52
B14_133e:		lda $52			; a5 52
B14_1340:		tax				; aa 
B14_1341:		eor $25, x		; 55 25
B14_1343:	.db $12
B14_1344:	.db $52
B14_1345:	.db $52
B14_1346:		tax				; aa 
B14_1347:		tax				; aa 
B14_1348:		lda $d55a		; ad 5a d5
B14_134b:	.db $da
B14_134c:		cmp $ad, x		; d5 ad
B14_134e:		tax				; aa 
B14_134f:		lda $5555		; ad 55 55
B14_1352:		eor $55, x		; 55 55
B14_1354:		tax				; aa 
B14_1355:		tax				; aa 
B14_1356:		tax				; aa 
B14_1357:		tax				; aa 
B14_1358:		lda $ad5a		; ad 5a ad
B14_135b:		tax				; aa 
B14_135c:		cmp $52, x		; d5 52
B14_135e:		tax				; aa 
B14_135f:		eor $25, x		; 55 25
B14_1361:	.db $52
B14_1362:		lda $52			; a5 52
B14_1364:		lda $52			; a5 52
B14_1366:	.db $52
B14_1367:	.db $52
B14_1368:		rol a			; 2a
B14_1369:	.db $52
B14_136a:		tax				; aa 
B14_136b:		lda $aa55		; ad 55 aa
B14_136e:	.db $da
B14_136f:	.db $da
B14_1370:	.db $da
B14_1371:		cmp $aa, x		; d5 aa
B14_1373:		lda $5555		; ad 55 55
B14_1376:		eor $55, x		; 55 55
B14_1378:		tax				; aa 
B14_1379:		tax				; aa 
B14_137a:		tax				; aa 
B14_137b:		tax				; aa 
B14_137c:		cmp $5a, x		; d5 5a
B14_137e:		cmp $aa, x		; d5 aa
B14_1380:		lda $a52a		; ad 2a a5
B14_1383:	.db $52
B14_1384:		lda $2a			; a5 2a
B14_1386:		eor $52, x		; 55 52
B14_1388:		lda $2a			; a5 2a
B14_138a:		eor ($25), y	; 51 25
B14_138c:		and $55			; 25 55
B14_138e:		eor $55, x		; 55 55
B14_1390:		eor $ad, x		; 55 ad
B14_1392:		lda $daaa		; ad aa da
B14_1395:		cmp $aa, x		; d5 aa
B14_1397:		lda $5555		; ad 55 55
B14_139a:		eor $5a, x		; 55 5a
B14_139c:		tax				; aa 
B14_139d:		tax				; aa 
B14_139e:		tax				; aa 
B14_139f:		tax				; aa 
B14_13a0:		cmp $aa, x		; d5 aa
B14_13a2:		cmp $aa, x		; d5 aa
B14_13a4:		tax				; aa 
B14_13a5:		tax				; aa 
B14_13a6:		eor $2a, x		; 55 2a
B14_13a8:		eor $2a, x		; 55 2a
B14_13aa:		eor $2a, x		; 55 2a
B14_13ac:		eor $25, x		; 55 25
B14_13ae:		and $25			; 25 25
B14_13b0:		and $55			; 25 55
B14_13b2:		eor $55, x		; 55 55
B14_13b4:	.db $5a
B14_13b5:		lda $adad		; ad ad ad
B14_13b8:		tax				; aa 
B14_13b9:		cmp $aa, x		; d5 aa
B14_13bb:		lda $5555		; ad 55 55
B14_13be:		eor $5a, x		; 55 5a
B14_13c0:		tax				; aa 
B14_13c1:		tax				; aa 
B14_13c2:		tax				; aa 
B14_13c3:		lda $ad55		; ad 55 ad
B14_13c6:	.db $5a
B14_13c7:		tax				; aa 
B14_13c8:		tax				; aa 
B14_13c9:		lda $55			; a5 55
B14_13cb:		rol a			; 2a
B14_13cc:		eor $2a, x		; 55 2a
B14_13ce:		eor $2a, x		; 55 2a
B14_13d0:	.db $52
B14_13d1:	.db $52
B14_13d2:	.db $52
B14_13d3:		eor $25, x		; 55 25
B14_13d5:		eor $55, x		; 55 55
B14_13d7:		eor $aa, x		; 55 aa
B14_13d9:	.db $da
B14_13da:	.db $da
B14_13db:		lda $5aad		; ad ad 5a
B14_13de:		tax				; aa 
B14_13df:		lda $5555		; ad 55 55
B14_13e2:		eor $aa, x		; 55 aa
B14_13e4:		tax				; aa 
B14_13e5:		tax				; aa 
B14_13e6:		tax				; aa 
B14_13e7:		lda $5a			; a5 5a
B14_13e9:		eor $a5, x		; 55 a5
B14_13eb:		eor $5a, x		; 55 5a
B14_13ed:		eor $aa, x		; 55 aa
B14_13ef:		tax				; aa 
B14_13f0:		eor $a5, x		; 55 a5
B14_13f2:	.db $5a
B14_13f3:		tax				; aa 
B14_13f4:	.db $5a
B14_13f5:		lda $5a			; a5 5a
B14_13f7:	.db $5a
B14_13f8:		.db $00				; 00
B14_13f9:		.db $00				; 00
B14_13fa:		.db $00				; 00
B14_13fb:		.db $00				; 00
B14_13fc:		.db $00				; 00
B14_13fd:		.db $00				; 00
B14_13fe:		.db $00				; 00
B14_13ff:		.db $00				; 00
B14_1400:		ldy #$f0		; a0 f0
B14_1402:	.db $ef
B14_1403:		asl a			; 0a
B14_1404:	.db $ff
B14_1405:		ora ($f5, x)	; 01 f5
B14_1407:		ora $0f15		; 0d 15 0f
B14_140a:	.db $ff
B14_140b:		.db $00				; 00
B14_140c:		;removed
	.db $f0 $0f

B14_140e:		jsr $ff00		; 20 00 ff
B14_1411:	.db $0f
B14_1412:		beq B14_13f3 ; f0 df

B14_1414:	.db $ff
B14_1415:		eor $ef, x		; 55 ef
B14_1417:		asl a			; 0a
B14_1418:		beq B14_141b ; f0 01

B14_141a:		.db $00				; 00
B14_141b:		asl $0d00		; 0e 00 0d
B14_141e:	.db $fa
B14_141f:	.db $ef
B14_1420:	.db $fa
B14_1421:	.db $ff
B14_1422:		sbc $af, x		; f5 af
B14_1424:		ora $2a			; 05 2a
B14_1426:		beq B14_1428 ; f0 00

B14_1428:		.db $00				; 00
B14_1429:	.db $0f
B14_142a:		asl a			; 0a
B14_142b:		sbc ($d1, x)	; e1 d1
B14_142d:	.db $ff
B14_142e:	.db $ff
B14_142f:	.db $0f
B14_1430:	.db $ff
B14_1431:		lda $a515		; ad 15 a5
B14_1434:		.db $00				; 00
B14_1435:		ora $00			; 05 00
B14_1437:		bvc B14_1447 ; 50 0e

B14_1439:		sbc ($f1, x)	; e1 f1
B14_143b:	.db $ff
B14_143c:	.db $2f
B14_143d:	.db $ff
B14_143e:	.db $ff
B14_143f:		sbc $05			; e5 05
B14_1441:		beq B14_1443 ; f0 00

B14_1443:		and ($12, x)	; 21 12
B14_1445:		ora ($1a, x)	; 01 1a
B14_1447:		;removed
	.db $d0 $f1

B14_1449:		dec $ffaf, x	; de af ff
B14_144c:		inc $a5ff		; ee ff a5
B14_144f:		ldy #$f1		; a0 f1
B14_1451:		.db $00				; 00
B14_1452:		.db $00				; 00
B14_1453:		and ($11, x)	; 21 11
B14_1455:	.db $02
B14_1456:		beq B14_14b7 ; f0 5f

B14_1458:	.db $1f
B14_1459:		sbc $ff, x		; f5 ff
B14_145b:		sbc $efff, x	; fd ff ef
B14_145e:		.db $00				; 00
B14_145f:		beq B14_1463 ; f0 02

B14_1461:		.db $00				; 00
B14_1462:		.db $00				; 00
B14_1463:		ora $05			; 05 05
B14_1465:		cpx #$f1		; e0 f1
B14_1467:	.db $af
B14_1468:	.db $ff
B14_1469:	.db $df
B14_146a:	.db $ff
B14_146b:		inc $aa5a, x	; fe 5a aa
B14_146e:		eor ($10), y	; 51 10
B14_1470:		.db $00				; 00
B14_1471:		ora ($00, x)	; 01 00
B14_1473:		and $e202		; 2d 02 e2
B14_1476:	.db $ff
B14_1477:		ldx $ffff		; ae ff ff
B14_147a:		inc $fff1, x	; fe f1 ff
B14_147d:	.db $20 $0a $00
B14_1480:		bpl B14_1482 ; 10 00

B14_1482:		bvc B14_1484 ; 50 00

B14_1484:	.db $fa
B14_1485:	.db $2f
B14_1486:	.db $5a
B14_1487:	.db $ff
B14_1488:	.db $ff
B14_1489:	.db $ff
B14_148a:		sbc $ff, x		; f5 ff
B14_148c:	.db $1f
B14_148d:		bpl B14_1491 ; 10 02

B14_148f:		bpl B14_149b ; 10 0a

B14_1491:		.db $00				; 00
B14_1492:		.db $00				; 00
B14_1493:		rol a			; 2a
B14_1494:		sbc ($2f), y	; f1 2f
B14_1496:		sbc $ffae, x	; fd ae ff
B14_1499:		sbc $ff, x		; f5 ff
B14_149b:	.db $2f
B14_149c:	.db $fa
B14_149d:	.db $1a
B14_149e:	.db $02
B14_149f:		ora ($02, x)	; 01 02
B14_14a1:		.db $00				; 00
B14_14a2:		cpx #$0f		; e0 0f
B14_14a4:		.db $00				; 00
B14_14a5:	.db $2f
B14_14a6:		sbc ($df), y	; f1 df
B14_14a8:	.db $fa
B14_14a9:	.db $ff
B14_14aa:	.db $ff
B14_14ab:	.db $ef
B14_14ac:		sbc $f0			; e5 f0
B14_14ae:	.db $0d $00 $00
B14_14b1:		.db $00				; 00
B14_14b2:		.db $00				; 00
B14_14b3:		bvc B14_14c4 ; 50 0f

B14_14b5:		and ($fa, x)	; 21 fa
B14_14b7:	.db $df
B14_14b8:	.db $ff
B14_14b9:	.db $ff
B14_14ba:	.db $ff
B14_14bb:	.db $ff
B14_14bc:		sbc ($0f), y	; f1 0f
B14_14be:		beq B14_14c0 ; f0 00

B14_14c0:		.db $00				; 00
B14_14c1:		.db $00				; 00
B14_14c2:		.db $00				; 00
B14_14c3:		.db $00				; 00
B14_14c4:	.db $0f
B14_14c5:		and $ff			; 25 ff
B14_14c7:	.db $f2
B14_14c8:	.db $af
B14_14c9:	.db $ff
B14_14ca:	.db $df
B14_14cb:		sbc $fe			; e5 fe
B14_14cd:		bne B14_14c4 ; d0 f5

B14_14cf:		ora ($50, x)	; 01 50
B14_14d1:		.db $00				; 00
B14_14d2:		jsr $50a2		; 20 a2 50
B14_14d5:		and $0f5a		; 2d 5a 0f
B14_14d8:		beq B14_14c9 ; f0 ef

B14_14da:		sbc $de, x		; f5 de
B14_14dc:	.db $ff
B14_14dd:	.db $0f
B14_14de:	.db $f2
B14_14df:		;removed
	.db $f0 $fa

B14_14e1:	.db $0f
B14_14e2:		.db $00				; 00
B14_14e3:		cpx #$05		; e0 05
B14_14e5:		.db $00				; 00
B14_14e6:		.db $00				; 00
B14_14e7:		cpx #$0d		; e0 0d
B14_14e9:		eor ($df), y	; 51 df
B14_14eb:	.db $5a
B14_14ec:	.db $ff
B14_14ed:	.db $df
B14_14ee:	.db $ff
B14_14ef:	.db $ff
B14_14f0:	.db $f2
B14_14f1:		sbc ($e0), y	; f1 e0
B14_14f3:		cmp ($00), y	; d1 00
B14_14f5:		.db $00				; 00
B14_14f6:		.db $00				; 00
B14_14f7:		.db $00				; 00
B14_14f8:		jsr $2f0d		; 20 0d 2f
B14_14fb:		ora $fffd, x	; 1d fd ff
B14_14fe:	.db $ff
B14_14ff:	.db $fa
B14_1500:	.db $ff
B14_1501:	.db $5f
B14_1502:		sbc $a0, x		; f5 a0
B14_1504:	.db $0e $00 $00
B14_1507:		.db $00				; 00
B14_1508:		;removed
	.db $d0 $01

B14_150a:		ora ($f2, x)	; 01 f2
B14_150c:	.db $5f
B14_150d:	.db $2f
B14_150e:	.db $fa
B14_150f:	.db $ff
B14_1510:	.db $af
B14_1511:	.db $ff
B14_1512:	.db $ef
B14_1513:		beq B14_14c4 ; f0 af

B14_1515:	.db $0f
B14_1516:		.db $00				; 00
B14_1517:		ldy #$0d		; a0 0d
B14_1519:		.db $00				; 00
B14_151a:		.db $00				; 00
B14_151b:		bvc B14_14c2 ; 50 a5

B14_151d:		ora $aa0f		; 0d 0f aa
B14_1520:		cmp $fa, x		; d5 fa
B14_1522:	.db $ff
B14_1523:	.db $df
B14_1524:	.db $ff
B14_1525:		sbc $dd, x		; f5 dd
B14_1527:		beq B14_1548 ; f0 1f

B14_1529:		.db $00				; 00
B14_152a:		bne B14_152c ; d0 00

B14_152c:		bpl B14_152e ; 10 00

B14_152e:		asl a			; 0a
B14_152f:		.db $00				; 00
B14_1530:		beq B14_1541 ; f0 0f

B14_1532:		lda $fff1		; ad f1 ff
B14_1535:	.db $ff
B14_1536:	.db $ff
B14_1537:	.db $ff
B14_1538:	.db $ff
B14_1539:		sbc $2d1a, x	; fd 1a 2d
B14_153c:		.db $00				; 00
B14_153d:		.db $00				; 00
B14_153e:		.db $00				; 00
B14_153f:		.db $00				; 00
B14_1540:		.db $00				; 00
B14_1541:		.db $00				; 00
B14_1542:		.db $00				; 00
B14_1543:	.db $da
B14_1544:		inc $fffe		; ee fe ff
B14_1547:	.db $ff
B14_1548:	.db $ff
B14_1549:	.db $ff
B14_154a:	.db $ff
B14_154b:	.db $fa
B14_154c:	.db $da
B14_154d:		ora $50			; 05 50
B14_154f:		.db $00				; 00
B14_1550:		.db $00				; 00
B14_1551:		.db $00				; 00
B14_1552:		.db $00				; 00
B14_1553:		.db $00				; 00
B14_1554:	.db $02
B14_1555:		cmp $dfe5, x	; dd e5 df
B14_1558:	.db $ef
B14_1559:	.db $fa
B14_155a:	.db $ff
B14_155b:	.db $fa
B14_155c:		sbc $0dfa, x	; fd fa 0d
B14_155f:	.db $e2
B14_1560:	.db $0f
B14_1561:		bvc B14_1584 ; 50 21

B14_1563:	.db $02
B14_1564:		ldy #$1a		; a0 1a
B14_1566:		ora $12			; 05 12
B14_1568:	.db $52
B14_1569:		tax				; aa 
B14_156a:		beq B14_1569 ; f0 fd

B14_156c:	.db $0f
B14_156d:	.db $2f
B14_156e:		lda ($ff, x)	; a1 ff
B14_1570:	.db $2f
B14_1571:		inc $fade, x	; fe de fa
B14_1574:		bne B14_1574 ; d0 fe

B14_1576:	.db $0d $02 $00
B14_1579:		bne B14_157b ; d0 00

B14_157b:		.db $00				; 00
B14_157c:	.db $0f
B14_157d:		and ($51, x)	; 21 51
B14_157f:	.db $da
B14_1580:	.db $2f
B14_1581:	.db $f2
B14_1582:	.db $ff
B14_1583:	.db $5f
B14_1584:	.db $ff
B14_1585:	.db $ef
B14_1586:	.db $ef
B14_1587:		beq B14_1537 ; f0 ae

B14_1589:		asl $10a5		; 0e a5 10
B14_158c:	.db $02
B14_158d:	.db $02
B14_158e:		.db $00				; 00
B14_158f:		.db $00				; 00
B14_1590:	.db $2f
B14_1591:		bvc B14_15b8 ; 50 25

B14_1593:	.db $ff
B14_1594:		asl $2ffd, x	; 1e fd 2f
B14_1597:		inc $2afd, x	; fe fd 2a
B14_159a:		sbc $f0, x		; f5 f0
B14_159c:	.db $af
B14_159d:	.db $0f
B14_159e:		eor ($2d), y	; 51 2d
B14_15a0:		ora ($10), y	; 11 10
B14_15a2:		;removed
	.db $f0 $0d

B14_15a4:		ora $10			; 05 10
B14_15a6:		cmp ($a5), y	; d1 a5
B14_15a8:		;removed
	.db $50 $ad

B14_15aa:	.db $0f
B14_15ab:	.db $52
B14_15ac:		dec $faaf, x	; de af fa
B14_15af:		inc $5eff		; ee ff 5e
B14_15b2:		sbc $55ed, x	; fd ed 55
B14_15b5:		ora $02d0		; 0d d0 02
B14_15b8:		.db $00				; 00
B14_15b9:		ora ($00, x)	; 01 00
B14_15bb:		ora $00			; 05 00
B14_15bd:		bpl B14_161c ; 10 5d

B14_15bf:	.db $2f
B14_15c0:	.db $e2
B14_15c1:	.db $ff
B14_15c2:	.db $ff
B14_15c3:	.db $ff
B14_15c4:	.db $ff
B14_15c5:	.db $ff
B14_15c6:		sbc $2afe, x	; fd fe 2a
B14_15c9:		asl $1000, x	; 1e 00 10
B14_15cc:		.db $00				; 00
B14_15cd:		.db $00				; 00
B14_15ce:		.db $00				; 00
B14_15cf:	.db $12
B14_15d0:		ora $a1			; 05 a1
B14_15d2:		rol $aeed		; 2e ed ae
B14_15d5:		sbc $5fdf, x	; fd df 5f
B14_15d8:		cmp $f5, x		; d5 f5
B14_15da:		sbc $f01f		; ed1f f0
B14_15dd:	.db $ef
B14_15de:	.db $1a
B14_15df:		cmp $05, x		; d5 05
B14_15e1:		eor ($20), y	; 51 20
B14_15e3:		lda ($00, x)	; a1 00
B14_15e5:		ldy #$0a		; a0 0a
B14_15e7:		ora ($d1, x)	; 01 d1
B14_15e9:		ora $da, x		; 15 da
B14_15eb:		ldx $ffe5		; ae e5 ff
B14_15ee:	.db $2f
B14_15ef:	.db $ef
B14_15f0:		inc $f0ff		; ee ff f0
B14_15f3:	.db $ff
B14_15f4:	.db $1a
B14_15f5:		sbc ($1a), y	; f1 1a
B14_15f7:		jsr $0520		; 20 20 05
B14_15fa:		.db $00				; 00
B14_15fb:		ora $01			; 05 01
B14_15fd:		;removed
	.db $10 $d5

B14_15ff:		ora $5551, x	; 1d 51 55
B14_1602:		ora ($2d), y	; 11 2d
B14_1604:		lda $aaad		; ad ad aa
B14_1607:		cmp $5d, x		; d5 5d
B14_1609:	.db $5a
B14_160a:		cmp $2f, x		; d5 2f
B14_160c:		sbc $ffff		; edff ff
B14_160f:		sbc $15			; e5 15
B14_1611:		bpl B14_1613 ; 10 00

B14_1613:		.db $00				; 00
B14_1614:		.db $00				; 00
B14_1615:		.db $00				; 00
B14_1616:		.db $00				; 00
B14_1617:		eor ($25), y	; 51 25
B14_1619:		rol a			; 2a
B14_161a:		lda $2a			; a5 2a
B14_161c:	.db $52
B14_161d:		lda $d5de		; ad de d5
B14_1620:	.db $ef
B14_1621:		inc $edef		; ee ef ed
B14_1624:		sbc $edde		; edde ed
B14_1627:	.db $ef
B14_1628:		inc $dada		; ee da da
B14_162b:		lda $5a52		; ad 52 5a
B14_162e:		lda $12			; a5 12
B14_1630:		ldx #$a5		; a2 a5
B14_1632:		and $22			; 25 22
B14_1634:		and $11			; 25 11
B14_1636:	.db $22
B14_1637:	.db $52
B14_1638:		eor ($52), y	; 51 52
B14_163a:		lda $2d			; a5 2d
B14_163c:		eor $55, x		; 55 55
B14_163e:		tax				; aa 
B14_163f:	.db $52
B14_1640:		tax				; aa 
B14_1641:	.db $52
B14_1642:		eor $2a, x		; 55 2a
B14_1644:		lda $55			; a5 55
B14_1646:		and $5552		; 2d 52 55
B14_1649:	.db $52
B14_164a:		cmp $2a, x		; d5 2a
B14_164c:		tax				; aa 
B14_164d:		lda $da5a		; ad 5a da
B14_1650:		lda $ddaa		; ad aa dd
B14_1653:		lda $5aad		; ad ad 5a
B14_1656:	.db $da
B14_1657:	.db $da
B14_1658:		lda $d55a		; ad 5a d5
B14_165b:		tax				; aa 
B14_165c:		eor $55, x		; 55 55
B14_165e:		rol a			; 2a
B14_165f:		tax				; aa 
B14_1660:		lda $2a			; a5 2a
B14_1662:		tax				; aa 
B14_1663:		eor $55, x		; 55 55
B14_1665:		rol a			; 2a
B14_1666:		lda $55			; a5 55
B14_1668:		eor $55, x		; 55 55
B14_166a:		tax				; aa 
B14_166b:		lda $5555		; ad 55 55
B14_166e:		eor $2d, x		; 55 2d
B14_1670:		eor $55, x		; 55 55
B14_1672:		lda $5555		; ad 55 55
B14_1675:		eor $52, x		; 55 52
B14_1677:		tax				; aa 
B14_1678:		eor $a5, x		; 55 a5
B14_167a:		rol a			; 2a
B14_167b:		eor $55, x		; 55 55
B14_167d:		and $55			; 25 55
B14_167f:	.db $52
B14_1680:		eor $52, x		; 55 52
B14_1682:		lda $5a			; a5 5a
B14_1684:		lda $55			; a5 55
B14_1686:		eor $55, x		; 55 55
B14_1688:	.db $5a
B14_1689:		tax				; aa 
B14_168a:		lda $5a			; a5 5a
B14_168c:		cmp $2a, x		; d5 2a
B14_168e:		cmp $2a, x		; d5 2a
B14_1690:		tax				; aa 
B14_1691:	.db $da
B14_1692:		lda $55			; a5 55
B14_1694:	.db $52
B14_1695:		tax				; aa 
B14_1696:		tax				; aa 
B14_1697:		tax				; aa 
B14_1698:		eor $55, x		; 55 55
B14_169a:		eor $2d, x		; 55 2d
B14_169c:		eor $5a, x		; 55 5a
B14_169e:		tax				; aa 
B14_169f:		cmp $5a, x		; d5 5a
B14_16a1:		lda $ad5a		; ad 5a ad
B14_16a4:		tax				; aa 
B14_16a5:		lda $aa55		; ad 55 aa
B14_16a8:		lda $5555		; ad 55 55
B14_16ab:		tax				; aa 
B14_16ac:		tax				; aa 
B14_16ad:		tax				; aa 
B14_16ae:		lda $55			; a5 55
B14_16b0:		eor $55, x		; 55 55
B14_16b2:		rol a			; 2a
B14_16b3:		tax				; aa 
B14_16b4:		lda $55			; a5 55
B14_16b6:		eor $52, x		; 55 52
B14_16b8:		tax				; aa 
B14_16b9:		tax				; aa 
B14_16ba:		eor $55, x		; 55 55
B14_16bc:		eor $2a, x		; 55 2a
B14_16be:		lda $55			; a5 55
B14_16c0:		and $55			; 25 55
B14_16c2:	.db $52
B14_16c3:		tax				; aa 
B14_16c4:		tax				; aa 
B14_16c5:		eor $55, x		; 55 55
B14_16c7:	.db $52
B14_16c8:		tax				; aa 
B14_16c9:		lda $aa2a		; ad 2a aa
B14_16cc:		cmp $55, x		; d5 55
B14_16ce:		tax				; aa 
B14_16cf:		tax				; aa 
B14_16d0:		cmp $55, x		; d5 55
B14_16d2:	.db $5a
B14_16d3:		tax				; aa 
B14_16d4:	.db $ad $55 $00


loadRoomGroupData:
	jsr pushLower2romBanks
// room groups' metadata at beginning of bank 0
	lda #$00
	jsr swapLower2romBanksIdxedA

// room group idx
	lda wCurrRoomGroup.w
	tay
	asl a
	tax

// bank to get data from
	lda levelLoading_lower2romBanks.w, y
	sta wCurrRoomGroupDataBank

// get list of all 32x32 metatiles for entire group
// updated to get specific room's metatiles far below
	lda levelLoading_room32x32metaTiles.w, x
	sta wCurrRoomGroupMetaTileBytesAddr
	lda levelLoading_room32x32metaTiles.w+1, x
	sta wCurrRoomGroupMetaTileBytesAddr+1

// get curr group's room order
	lda levelLoading_roomGroupRoomOrders.w, x
	sta wCurrRoomGroupRoomOrder
	lda levelLoading_roomGroupRoomOrders.w+1, x
	sta wCurrRoomGroupRoomOrder+1

// get curr group's 4x4->2x2's metatile definition address
	lda levelLoading_16x16metaTileData.w, x
	sta wCurrRoomGroup16x16MetaTileBytesAddr
	lda levelLoading_16x16metaTileData.w+1, x
	sta wCurrRoomGroup16x16MetaTileBytesAddr+1

// get curr group's 2x2->1x1 tile idxes definition address
	lda levelLoading_8x8metaTileData.w, x
	sta wCurrRoomGroup8x8MetaTileBytesAddr
	lda levelLoading_8x8metaTileData.w+1, x
	sta wCurrRoomGroup8x8MetaTileBytesAddr+1

// todo:
B14_1712:		lda levelLoading_word_56_57.w, x	; bd 79 80
B14_1715:		sta $56			; 85 56
B14_1717:		lda levelLoading_word_56_57.w+1, x	; bd 7a 80
B14_171a:		sta $57			; 85 57

// lastly get chr banks and palettes
	lda levelLoading_chrBanksAndBasePalettes.w, x
	sta wCurrRoomGroupPaletteChrAddr
	lda levelLoading_chrBanksAndBasePalettes.w+1, x
	sta wCurrRoomGroupPaletteChrAddr+1

// swap to the banks where curr group's data is stored
// and start setting vars from those data
	lda wCurrRoomGroupDataBank
	jsr swapLower2romBanksIdxedA

// starting with bg 2kb chr banks
	ldy #$00
	lda (wCurrRoomGroupPaletteChrAddr), y
	sta wShadow2KBChrBank0.w
	iny
	lda (wCurrRoomGroupPaletteChrAddr), y
	sta wShadow2KBChrBank1.w
	iny

// then internal palettes, sprite invisble colour first
	ldx #$00
	lda (wCurrRoomGroupPaletteChrAddr), y
	sta wInternalPalettes_2.w+$10
	sta wInternalPalettes_2.w+$14
	sta wInternalPalettes_2.w+$18
	sta wInternalPalettes_2.w+$1c

// then only bg palettes
-	lda (wCurrRoomGroupPaletteChrAddr), y
	sta wInternalPalettes_2.w, x
	inx
	iny
	cpx #$10
	bne -

// get group again, to idx into bank 4 metadata
	lda wCurrRoomGroup.w
	asl a
	tay
	lda #$04
	jsr swapLower2romBanksIdxedA

// get addr of group's entities
	lda levelLoading_itemsEntities.w, y
	sta wCurrRoomGroupEntitiesAddr
	lda levelLoading_itemsEntities.w+1, y
	sta wCurrRoomGroupEntitiesAddr+1

// redundant bank swap
	lda #$04
	jsr swapLower2romBanksIdxedA

// todo:
B14_176d:		lda levelLoading_word_5e_5f.w, y	; b9 00 80
B14_1770:		sta $5e			; 85 5e
B14_1772:		lda levelLoading_word_5e_5f.w+1, y	; b9 01 80
B14_1775:		sta $5f			; 85 5f

B14_1777:		lda levelLoading_word_4d_4e.w, y	; b9 16 80
B14_177a:		sta $4d			; 85 4d
B14_177c:		lda levelLoading_word_4d_4e.w+1, y	; b9 17 80
B14_177f:		sta $4e			; 85 4e

//
B14_1781:		lda $0501		; ad 01 05
B14_1784:		sta $0514		; 8d 14 05
B14_1787:		lda $0503		; ad 03 05
B14_178a:		sta $0515		; 8d 15 05
B14_178d:		jsr func_139c		; 20 9c f3
B14_1790:		jmp pullAndSetLower2romBanks		; 4c 5b fc


// these functions kickstart the process of queueing room vram tiles
func_e_1793:
B14_1793:		jsr pushLower2romBanks		; 20 43 fc
B14_1796:		jsr func_e_179c		; 20 9c d7
B14_1799:		jmp pullAndSetLower2romBanks		; 4c 5b fc


func_e_179c:
	lda wCurrRoomGroupDataBank
	jsr swapLower2romBanksIdxedA

B14_17a1:		lda $31			; a5 31
B14_17a3:		and #$80		; 29 80
B14_17a5:		eor $37			; 45 37
B14_17a7:		bpl B14_17b7 ; 10 0e

B14_17a9:		lda $31			; a5 31
B14_17ab:		sta $37			; 85 37
B14_17ad:		lda $34			; a5 34
B14_17af:		sta $3a			; 85 3a
B14_17b1:		lda #$01		; a9 01
B14_17b3:		ora $49			; 05 49
B14_17b5:		sta $49			; 85 49
B14_17b7:		lda $33			; a5 33
B14_17b9:		and #$80		; 29 80
B14_17bb:		eor $39			; 45 39
B14_17bd:		bpl B14_17cd ; 10 0e

B14_17bf:		lda $33			; a5 33
B14_17c1:		sta $39			; 85 39
B14_17c3:		lda $35			; a5 35
B14_17c5:		sta $3b			; 85 3b
B14_17c7:		lda #$02		; a9 02
B14_17c9:		ora $49			; 05 49
B14_17cb:		sta $49			; 85 49
B14_17cd:		lda $015a		; ad 5a 01
B14_17d0:		and #$01		; 29 01
B14_17d2:		bne B14_1822 ; d0 4e

B14_17d4:		lda $49			; a5 49
B14_17d6:		and #$02		; 29 02
B14_17d8:		bne B14_17db ; d0 01

B14_17da:		rts				; 60

B14_17db:		lda $49			; a5 49
B14_17dd:		and #$fd		; 29 fd
B14_17df:		sta $49			; 85 49
B14_17e1:		jsr func_e_1b60		; 20 60 db
B14_17e4:		jsr func_e_1b0e		; 20 0e db
B14_17e7:		inc wNMIDataCopyStructNextIdx.w		; ee 00 01
B14_17ea:		inc wNMIDataCopyStructNextIdx.w		; ee 00 01
B14_17ed:		inc wNMIDataCopyStructNextIdx.w		; ee 00 01
B14_17f0:		lda #$00		; a9 00
B14_17f2:		sta $0a			; 85 0a
B14_17f4:		lda #$03		; a9 03
B14_17f6:		sta $0b			; 85 0b
B14_17f8:		jsr func_e_1a26		; 20 26 da
B14_17fb:		lda $06			; a5 06
B14_17fd:		and #$01		; 29 01
B14_17ff:		bne B14_1805 ; d0 04

B14_1801:		lda #$23		; a9 23
B14_1803:		bne B14_1807 ; d0 02

B14_1805:		lda #$27		; a9 27
B14_1807:		sta $05a0		; 8d a0 05
B14_180a:		lda $07			; a5 07
B14_180c:		ora #$c0		; 09 c0
B14_180e:		sta $05a1		; 8d a1 05
B14_1811:		lda wNMIDataCopyNumBytes.w		; ad 03 01
B14_1814:		clc				; 18 
B14_1815:		adc #$03		; 69 03
B14_1817:		lsr a			; 4a
B14_1818:		lsr a			; 4a
B14_1819:		sta $05a2		; 8d a2 05
B14_181c:		jsr func_e_18f9		; 20 f9 d8
B14_181f:		jmp func_e_1d53		; 4c 53 dd

B14_1822:		lda $49			; a5 49
B14_1824:		and #$01		; 29 01
B14_1826:		bne B14_1829 ; d0 01

B14_1828:		rts				; 60 

B14_1829:		lda $49			; a5 49
B14_182b:		and #$fe		; 29 fe
B14_182d:		sta $49			; 85 49
B14_182f:		jsr func_e_1b3b		; 20 3b db
B14_1832:		jsr func_e_1b0e		; 20 0e db
B14_1835:		inc wNMIDataCopyStructNextIdx.w		; ee 00 01
B14_1838:		inc wNMIDataCopyStructNextIdx.w		; ee 00 01
B14_183b:		inc wNMIDataCopyStructNextIdx.w		; ee 00 01
B14_183e:		lda #$00		; a9 00
B14_1840:		sta $0a			; 85 0a
B14_1842:		sta $0b			; 85 0b
B14_1844:		jsr func_e_1a26		; 20 26 da
B14_1847:		jsr vramQueueColumnOfTiles		; 20 4d d8
B14_184a:		jmp func_e_1d23		; nametable palettes


vramQueueColumnOfTiles:
// start copying into the next usable idx
	ldx wNMIDataCopyStructNextIdx.w

// based on quadrant idx, 1st load top-left quadrant addr, otherwise top-right
	lda w16x16MetaTileQuadrantIdx
	and #$01
	asl a
	tay
	lda (wCurrRoomGroup16x16MetaTileBytesAddr), y
	sta wCurr16x16MetaTileQuadrantTopBytesAddr
	iny
	lda (wCurrRoomGroup16x16MetaTileBytesAddr), y
	sta wCurr16x16MetaTileQuadrantTopBytesAddr+1

// skip past next word, getting bottom-left, if prev top-left, eg
	iny
	iny
	iny
	lda (wCurrRoomGroup16x16MetaTileBytesAddr), y
	sta wCurr16x16MetaTileQuadrantBottomBytesAddr
	iny
	lda (wCurrRoomGroup16x16MetaTileBytesAddr), y
	sta wCurr16x16MetaTileQuadrantBottomBytesAddr+1

// repeat for 8x8 quadrants, 0 means get top-left, then bottom-left
	lda w8x8MetaTileQuadrantIdx
	and #$01
	asl a
	tay
	lda (wCurrRoomGroup8x8MetaTileBytesAddr), y
	sta wCurr8x8MetaTileQuadrantTopBytesAddr
	iny
	lda (wCurrRoomGroup8x8MetaTileBytesAddr), y
	sta wCurr8x8MetaTileQuadrantTopBytesAddr+1

	iny
	iny
	iny
	lda (wCurrRoomGroup8x8MetaTileBytesAddr), y
	sta wCurr8x8MetaTileQuadrantBottomBytesAddr
	iny
	lda (wCurrRoomGroup8x8MetaTileBytesAddr), y
	sta wCurr8x8MetaTileQuadrantBottomBytesAddr+1

// start processing data for the column of tiles
@nextMetaTile:
B14_1886:		ldy wRoomMetaTileIdx			; a4 07
B14_1888:		lda (wCurrRoomMetaTileBytesAddr), y	; b1 00
B14_188a:		sta wCurrMetaTileVal			; 85 02

B14_188c:		jsr func_e_1bba		; 20 ba db

@nextQuadrantTile:
	ldy wCurrMetaTileVal

// bit 1 set means we're loading from either bottom quadrant
	lda w16x16MetaTileQuadrantIdx
	and #$02
	bne +
	lda (wCurr16x16MetaTileQuadrantTopBytesAddr), y
	jmp @afterChoosing16x16Table
+
	lda (wCurr16x16MetaTileQuadrantBottomBytesAddr), y

@afterChoosing16x16Table:
	tay
	lda wCurrColCopyRowIdx
	bne +

// if idx == 0 (copying 1st byte), and 8x8 quadrant is bottom, copy it
	lda w8x8MetaTileQuadrantIdx
	and #$02
	bne @copyFromBottom8x8quadrants
+
// copy from a top 8x8 quadrant
	lda (wCurr8x8MetaTileQuadrantTopBytesAddr), y
	sta wNMIDataCopyStruct.w, x

// check if done getting tiles in the column ($1e tiles per column)
	inx
	inc wCurrColCopyRowIdx
	lda wCurrColCopyRowIdx
	cmp #$1e
	beq @end

// bottom 8x8 quadrants
@copyFromBottom8x8quadrants:
	lda (wCurr8x8MetaTileQuadrantBottomBytesAddr), y
	sta wNMIDataCopyStruct.w, x

// after copy to struct, check if done
	inx
	inc wCurrColCopyRowIdx
	lda wCurrColCopyRowIdx
	cmp #$1e
	beq @end

// if on last metatile row, start processing metatiles from room below
	lda wRoomMetaTileIdx
	and #$38
	cmp #$38
	beq @getMetaTilesFromNextRoom

// get quadrant below this one
	lda w16x16MetaTileQuadrantIdx
	clc
	adc #$02
	and #$03
	sta w16x16MetaTileQuadrantIdx
	and #$02
	bne @nextQuadrantTile

// if bit 1 now unset, we're in the next metatile; get it
	lda wRoomMetaTileIdx
	clc
	adc #$08
	sta wRoomMetaTileIdx
	jmp $d886		; @nextMetaTile

@getMetaTilesFromNextRoom:
// and $07 to get relevant 1st row metatile of next room
	lda wRoomMetaTileIdx
	and #$07
	sta wRoomMetaTileIdx
	jsr startProcessingMetaTilesFromRoomBelow
	jmp $d886		; @nextMetaTile

@end:
	stx wNMIDataCopyStructNextIdx.w
	lda #$ff
	sta wNMIDataCopyStruct.w, x
	rts


// probably similar to above, but for doing row nmi copies
func_e_18f9:
B14_18f9:		ldx wNMIDataCopyStructNextIdx.w		; ae 00 01
B14_18fc:		lda w16x16MetaTileQuadrantIdx			; a5 08
B14_18fe:		and #$02		; 29 02
B14_1900:		asl a			; 0a
B14_1901:		tay				; a8 
B14_1902:		lda (wCurrRoomGroup16x16MetaTileBytesAddr), y	; b1 52
B14_1904:		sta wCurr16x16MetaTileQuadrantTopBytesAddr			; 85 70
B14_1906:		iny				; c8 
B14_1907:		lda (wCurrRoomGroup16x16MetaTileBytesAddr), y	; b1 52
B14_1909:		sta wCurr16x16MetaTileQuadrantTopBytesAddr+1			; 85 71
B14_190b:		iny				; c8 
B14_190c:		lda (wCurrRoomGroup16x16MetaTileBytesAddr), y	; b1 52
B14_190e:		sta wCurr16x16MetaTileQuadrantBottomBytesAddr			; 85 72
B14_1910:		iny				; c8 
B14_1911:		lda (wCurrRoomGroup16x16MetaTileBytesAddr), y	; b1 52
B14_1913:		sta wCurr16x16MetaTileQuadrantBottomBytesAddr+1			; 85 73
B14_1915:		lda w8x8MetaTileQuadrantIdx			; a5 09
B14_1917:		and #$02		; 29 02
B14_1919:		asl a			; 0a
B14_191a:		tay				; a8 
B14_191b:		lda (wCurrRoomGroup8x8MetaTileBytesAddr), y	; b1 54
B14_191d:		sta wCurr8x8MetaTileQuadrantTopBytesAddr			; 85 74
B14_191f:		iny				; c8 
B14_1920:		lda (wCurrRoomGroup8x8MetaTileBytesAddr), y	; b1 54
B14_1922:		sta wCurr8x8MetaTileQuadrantTopBytesAddr+1			; 85 75
B14_1924:		iny				; c8 
B14_1925:		lda (wCurrRoomGroup8x8MetaTileBytesAddr), y	; b1 54
B14_1927:		sta wCurr8x8MetaTileQuadrantBottomBytesAddr			; 85 76
B14_1929:		iny				; c8 
B14_192a:		lda (wCurrRoomGroup8x8MetaTileBytesAddr), y	; b1 54
B14_192c:		sta wCurr8x8MetaTileQuadrantBottomBytesAddr+1			; 85 77
B14_192e:		ldy wRoomMetaTileIdx			; a4 07
B14_1930:		lda (wCurrRoomMetaTileBytesAddr), y	; b1 00
B14_1932:		sta wCurrMetaTileVal			; 85 02
B14_1934:		jsr $dc95		; 20 95 dc
B14_1937:		ldy wCurrMetaTileVal			; a4 02
B14_1939:		lda w16x16MetaTileQuadrantIdx			; a5 08
B14_193b:		and #$01		; 29 01
B14_193d:		bne B14_1944 ; d0 05

B14_193f:		lda (wCurr16x16MetaTileQuadrantTopBytesAddr), y	; b1 70
B14_1941:		jmp $d946		; 4c 46 d9


B14_1944:		lda (wCurr16x16MetaTileQuadrantBottomBytesAddr), y	; b1 72
B14_1946:		tay				; a8 
B14_1947:		lda $0a			; a5 0a
B14_1949:		bne B14_1951 ; d0 06

B14_194b:		lda w8x8MetaTileQuadrantIdx			; a5 09
B14_194d:		and #$01		; 29 01
B14_194f:		bne B14_195f ; d0 0e

B14_1951:		lda (wCurr8x8MetaTileQuadrantTopBytesAddr), y	; b1 74
B14_1953:		sta wNMIDataCopyStruct.w, x	; 9d 01 01
B14_1956:		inx				; e8 
B14_1957:		inc wCurrColCopyRowIdx			; e6 0a
B14_1959:		lda wCurrColCopyRowIdx			; a5 0a
B14_195b:		cmp #$20		; c9 20
B14_195d:		beq B14_1992 ; f0 33

B14_195f:		lda #$00		; a9 00
B14_1961:		sta w8x8MetaTileQuadrantIdx			; 85 09
B14_1963:		lda (wCurr8x8MetaTileQuadrantBottomBytesAddr), y	; b1 76
B14_1965:		sta wNMIDataCopyStruct.w, x	; 9d 01 01
B14_1968:		inx				; e8 
B14_1969:		inc wCurrColCopyRowIdx			; e6 0a
B14_196b:		lda wCurrColCopyRowIdx			; a5 0a
B14_196d:		cmp #$20		; c9 20
B14_196f:		beq B14_1992 ; f0 21

B14_1971:		inc w16x16MetaTileQuadrantIdx			; e6 08
B14_1973:		lda w16x16MetaTileQuadrantIdx			; a5 08
B14_1975:		and #$01		; 29 01
B14_1977:		bne B14_1937 ; d0 be

B14_1979:		dec w16x16MetaTileQuadrantIdx			; c6 08
B14_197b:		dec w16x16MetaTileQuadrantIdx			; c6 08
B14_197d:		inc wRoomMetaTileIdx			; e6 07
B14_197f:		lda wRoomMetaTileIdx			; a5 07
B14_1981:		and #$07		; 29 07
B14_1983:		bne B14_192e ; d0 a9

B14_1985:		lda wRoomMetaTileIdx			; a5 07
B14_1987:		sec				; 38 
B14_1988:		sbc #$08		; e9 08
B14_198a:		sta wRoomMetaTileIdx			; 85 07
B14_198c:		jsr $d9c0		; 20 c0 d9
B14_198f:		jmp $d92e		; 4c 2e d9


B14_1992:		stx wNMIDataCopyStructNextIdx.w		; 8e 00 01
B14_1995:		lda #$ff		; a9 ff
B14_1997:		sta wNMIDataCopyStruct.w, x	; 9d 01 01
B14_199a:		rts				; 60 


startProcessingMetaTilesFromRoomBelow:
// num bytes to copy from next row is $1e (height) - what we have in curr room
	lda #$1e
	sec
	sbc wNMIDataCopyNumBytes.w
	sta wNMIDataCopyNumBytes.w, x

// ppu addr high byte is start of curr nametable
	lda wNMIDataCopyDest.w
	and #$fc
	sta wNMIDataCopyDest.w, x

// ppu addr low byte is 1st row of curr nametable
	inx
	lda wNMIDataCopyDest.w+1
	and #$1f
	sta wNMIDataCopyDest.w, x

// past copy byte to actual bytes to copy
	inx
	inx

// room group maps are $10-wide, so add $10 to get to room below
	lda wRoomGroupOrderIdx
	clc
	adc #$10
	tay
	jmp getCurrRoomsMetaTileBytesAddr


B14_19c0:		lda #$20		; a9 20
B14_19c2:		sec				; 38 
B14_19c3:		sbc wNMIDataCopyNumBytes.w		; ed 03 01
B14_19c6:		sta wNMIDataCopyDest.w+2, x	; 9d 03 01
B14_19c9:		lda wNMIDataCopyDest.w		; ad 01 01
B14_19cc:		and #$04		; 29 04
B14_19ce:		bne B14_19d7 ; d0 07

B14_19d0:		lda wNMIDataCopyDest.w		; ad 01 01
B14_19d3:		ora #$04		; 09 04
B14_19d5:		bne B14_19dc ; d0 05

B14_19d7:		lda wNMIDataCopyDest.w		; ad 01 01
B14_19da:		and #$fb		; 29 fb
B14_19dc:		sta wNMIDataCopyStruct.w, x	; 9d 01 01
B14_19df:		lda wNMIDataCopyDest.w+1		; ad 02 01
B14_19e2:		and #$e0		; 29 e0
B14_19e4:		sta wNMIDataCopyStruct.w+1, x	; 9d 02 01
B14_19e7:		inc $06			; e6 06
B14_19e9:		lda $06			; a5 06
B14_19eb:		and #$0f		; 29 0f
B14_19ed:		bne B14_19f6 ; d0 07

B14_19ef:		lda $06			; a5 06
B14_19f1:		sec				; 38 
B14_19f2:		sbc #$10		; e9 10
B14_19f4:		sta $06			; 85 06
B14_19f6:		and #$01		; 29 01
B14_19f8:		bne B14_19fe ; d0 04

B14_19fa:		lda #$23		; a9 23
B14_19fc:		bne B14_1a00 ; d0 02

B14_19fe:		lda #$27		; a9 27
B14_1a00:		ldy $0b			; a4 0b
B14_1a02:		sta $05a0, y	; 99 a0 05
B14_1a05:		lda $07			; a5 07
B14_1a07:		ora #$c0		; 09 c0
B14_1a09:		sta $05a1, y	; 99 a1 05
B14_1a0c:		lda $0b			; a5 0b
B14_1a0e:		clc				; 18 
B14_1a0f:		adc #$03		; 69 03
B14_1a11:		sta $0b			; 85 0b
B14_1a13:		lda wNMIDataCopyDest.w+2, x	; bd 03 01
B14_1a16:		clc				; 18 
B14_1a17:		adc #$03		; 69 03
B14_1a19:		lsr a			; 4a
B14_1a1a:		lsr a			; 4a
B14_1a1b:		sta $05a2, y	; 99 a2 05
B14_1a1e:		inx				; e8 
B14_1a1f:		inx				; e8 
B14_1a20:		inx				; e8 
B14_1a21:		ldy $06			; a4 06
B14_1a23:		jmp getCurrRoomsMetaTileBytesAddr		; 4c 9a da


func_e_1a26:
B14_1a26:		lda $3c			; a5 3c
B14_1a28:		and #$0e		; 29 0e
B14_1a2a:		lsr a			; 4a
B14_1a2b:		sta $0f			; 85 0f

B14_1a2d:		lda $3e			; a5 3e
B14_1a2f:		and #$0e		; 29 0e
B14_1a31:		asl a			; 0a
B14_1a32:		asl a			; 0a
B14_1a33:		ora $0f			; 05 0f
B14_1a35:		sta wRoomMetaTileIdx			; 85 07

B14_1a37:		lda $3d			; a5 3d
B14_1a39:		sta $00			; 85 00

B14_1a3b:		lda $3c			; a5 3c
B14_1a3d:		asl $00			; 06 00
B14_1a3f:		rol a			; 2a
B14_1a40:		and #$1f		; 29 1f
B14_1a42:		sta $00			; 85 00

B14_1a44:		lda $3c			; a5 3c
B14_1a46:		and #$10		; 29 10
B14_1a48:		beq B14_1a4e ; f0 04

B14_1a4a:		lda #$24		; a9 24
B14_1a4c:		bne B14_1a50 ; d0 02

B14_1a4e:		lda #$20		; a9 20
B14_1a50:		sta $01			; 85 01
B14_1a52:		lda $3f			; a5 3f
B14_1a54:		sta $02			; 85 02
B14_1a56:		lda $3e			; a5 3e
B14_1a58:		asl $02			; 06 02
B14_1a5a:		rol a			; 2a
B14_1a5b:		and #$1f		; 29 1f
B14_1a5d:		sta $02			; 85 02
B14_1a5f:		asl a			; 0a
B14_1a60:		tay				; a8 
B14_1a61:		lda data_e_1ab2.w, y	; b9 b2 da
B14_1a64:		ora $00			; 05 00
B14_1a66:		sta wNMIDataCopyDest.w+1		; 8d 02 01
B14_1a69:		lda data_e_1ab2.w+1, y	; b9 b3 da
B14_1a6c:		ora $01			; 05 01
B14_1a6e:		sta wNMIDataCopyDest.w		; 8d 01 01
B14_1a71:		lda $015a		; ad 5a 01
B14_1a74:		and #$01		; 29 01
B14_1a76:		beq B14_1a81 ; @rowCopies

B14_1a78:		ldy $02			; a4 02
B14_1a7a:		lda data_1ehMinusIdx.w, y	; b9 f0 da
// nmi num bytes - copy going down
B14_1a7d:		ora #$80		; 09 80
B14_1a7f:		bne B14_1a86 ; d0 05

@rowCopies:
B14_1a81:		ldy $00			; a4 00
B14_1a83:		lda data_20hMinusIdx.w, y	; b9 ee da
B14_1a86:		sta wNMIDataCopyNumBytes.w		; 8d 03 01
// $3e's high nybble is room's row in room group
B14_1a89:		lda $3e			; a5 3e
B14_1a8b:		and #$f0		; 29 f0
B14_1a8d:		sta $00			; 85 00
// $3c's high nybble is room's col in room group
B14_1a8f:		lda $3c			; a5 3c
B14_1a91:		lsr a			; 4a
B14_1a92:		lsr a			; 4a
B14_1a93:		lsr a			; 4a
B14_1a94:		lsr a			; 4a
B14_1a95:		ora $00			; 05 00
B14_1a97:		tay				; a8 
B14_1a98:		sta wRoomGroupOrderIdx			; 85 06

getCurrRoomsMetaTileBytesAddr:
// y is idx into room group order
	lda (wCurrRoomGroupRoomOrder), y
	sta wRoomIdx

// idx/a //= 4, ie a=idx*$40 as there are $40 metatiles per room
	lda #$00
	lsr wRoomIdx
	ror a
	lsr wRoomIdx
	ror a

// add onto group's metatile bytes address to get room's
	clc
	adc wCurrRoomGroupMetaTileBytesAddr
	sta wCurrRoomMetaTileBytesAddr
	lda wCurrRoomGroupMetaTileBytesAddr+1
	adc wRoomIdx
	sta wCurrRoomMetaTileBytesAddr+1
	rts

// should be big-endian?
data_e_1ab2:
	.dw $0000
	.dw $0020
	.dw $0040
	.dw $0060
	.dw $0080
	.dw $00a0
	.dw $00c0
	.dw $00e0
	.dw $0100
	.dw $0120
	.dw $0140
	.dw $0160
	.dw $0180
	.dw $01a0
	.dw $01c0
	.dw $01e0
	.dw $0200
	.dw $0220
	.dw $0240
	.dw $0260
	.dw $0280
	.dw $02a0
	.dw $02c0
	.dw $02e0
	.dw $0300
	.dw $0320
	.dw $0340
	.dw $0360
	.dw $0380
	.dw $03a0


data_20hMinusIdx:
	.db $20 $1f

data_1ehMinusIdx:
	.db         $1e $1d $1c $1b $1a $19
	.db $18 $17 $16 $15 $14 $13 $12 $11
	.db $10 $0f $0e $0d $0c $0b $0a $09
	.db $08 $07 $06 $05 $04 $03 $02 $01


func_e_1b0e:
	lda #$00
B14_1b10:		ldy $3d			; a4 3d
B14_1b12:		bpl B14_1b16 ; 10 02

B14_1b14:		lda #$01		; a9 01
B14_1b16:		ldy $3f			; a4 3f
B14_1b18:		bpl B14_1b1c ; 10 02

B14_1b1a:		ora #$02		; 09 02
B14_1b1c:		sta w8x8MetaTileQuadrantIdx			; 85 09
B14_1b1e:		ldy #$00		; a0 00
B14_1b20:		lda $3c			; a5 3c
B14_1b22:		and #$01		; 29 01
B14_1b24:		beq B14_1b28 ; f0 02

B14_1b26:		ldy #$01		; a0 01
B14_1b28:		sty $00			; 84 00
B14_1b2a:		lda $3e			; a5 3e
B14_1b2c:		and #$01		; 29 01
B14_1b2e:		beq B14_1b36 ; f0 06

B14_1b30:		lda #$02		; a9 02
B14_1b32:		ora $00			; 05 00
B14_1b34:		sta $00			; 85 00
B14_1b36:		lda $00			; a5 00
B14_1b38:		sta w16x16MetaTileQuadrantIdx			; 85 08
B14_1b3a:		rts				; 60 


func_e_1b3b:
B14_1b3b:		lda $3a			; a5 3a
B14_1b3d:		bmi B14_1b4f ; 30 10

B14_1b3f:		lda $31			; a5 31
B14_1b41:		clc				; 18 
B14_1b42:		adc #$80		; 69 80
B14_1b44:		sta $3d			; 85 3d
B14_1b46:		lda $30			; a5 30
B14_1b48:		adc #$0f		; 69 0f
B14_1b4a:		sta $3c			; 85 3c
B14_1b4c:		jmp B14_1b57		; 4c 57 db

B14_1b4f:		lda $31			; a5 31
B14_1b51:		sta $3d			; 85 3d
B14_1b53:		lda $30			; a5 30
B14_1b55:		sta $3c			; 85 3c

B14_1b57:		lda $33			; a5 33
B14_1b59:		sta $3f			; 85 3f
B14_1b5b:		lda $32			; a5 32
B14_1b5d:		sta $3e			; 85 3e
B14_1b5f:		rts				; 60 


func_e_1b60:
B14_1b60:		lda $3b			; a5 3b
B14_1b62:		bpl B14_1b6f ; 10 0b

B14_1b64:		lda $33			; a5 33
B14_1b66:		sta $3f			; 85 3f
B14_1b68:		lda $32			; a5 32
B14_1b6a:		sta $3e			; 85 3e
B14_1b6c:		jmp $db89		; 4c 89 db

B14_1b6f:		lda $33			; a5 33
B14_1b71:		clc				; 18 
B14_1b72:		adc #$80		; 69 80
B14_1b74:		sta $3f			; 85 3f
B14_1b76:		lda $32			; a5 32
B14_1b78:		and #$0f		; 29 0f
B14_1b7a:		beq B14_1b83 ; f0 07

B14_1b7c:		lda $32			; a5 32
B14_1b7e:		adc #$0f		; 69 0f
B14_1b80:		jmp $db87		; 4c 87 db

B14_1b83:		lda $32			; a5 32
B14_1b85:		adc #$0e		; 69 0e
B14_1b87:		sta $3e			; 85 3e
B14_1b89:		sta $00			; 85 00
B14_1b8b:		lda $3b			; a5 3b
B14_1b8d:		sta $01			; 85 01
B14_1b8f:		lda $00			; a5 00
B14_1b91:		and #$0f		; 29 0f
B14_1b93:		cmp #$0f		; c9 0f
B14_1b95:		bne B14_1bad ; d0 16

B14_1b97:		lda $01			; a5 01
B14_1b99:		bmi B14_1ba5 ; 30 0a

B14_1b9b:		lda $00			; a5 00
B14_1b9d:		and #$f0		; 29 f0
B14_1b9f:		clc				; 18 
B14_1ba0:		adc #$10		; 69 10
B14_1ba2:		jmp $dbab		; 4c ab db

B14_1ba5:		lda $00			; a5 00
B14_1ba7:		and #$f0		; 29 f0
B14_1ba9:		ora #$0e		; 09 0e
B14_1bab:		sta $00			; 85 00
B14_1bad:		lda $00			; a5 00
B14_1baf:		sta $3e			; 85 3e
B14_1bb1:		lda $31			; a5 31
B14_1bb3:		sta $3d			; 85 3d
B14_1bb5:		lda $30			; a5 30
B14_1bb7:		sta $3c			; 85 3c
B14_1bb9:		rts				; 60 


func_e_1bba:
B14_1bba:		ldy wCurrMetaTileVal			; a4 02
B14_1bbc:		lda (wCurr16x16MetaTileQuadrantTopBytesAddr), y	; b1 70
B14_1bbe:		sta $0f			; 85 0f
B14_1bc0:		lda (wCurr16x16MetaTileQuadrantBottomBytesAddr), y	; b1 72
B14_1bc2:		tay				; a8 
B14_1bc3:		lda ($56), y	; b1 56
B14_1bc5:		sta $78			; 85 78
B14_1bc7:		and #$03		; 29 03
B14_1bc9:		asl a			; 0a
B14_1bca:		asl a			; 0a
B14_1bcb:		asl a			; 0a
B14_1bcc:		asl a			; 0a
B14_1bcd:		sta $0c			; 85 0c
B14_1bcf:		ldy $0f			; a4 0f
B14_1bd1:		lda ($56), y	; b1 56
B14_1bd3:		sta $79			; 85 79
B14_1bd5:		and #$03		; 29 03
B14_1bd7:		ora $0c			; 05 0c
B14_1bd9:		sta $0f			; 85 0f
B14_1bdb:		lda $0a			; a5 0a
B14_1bdd:		cmp #$1d		; c9 1d
B14_1bdf:		bcs B14_1c17 ; b0 36

B14_1be1:		lda $07			; a5 07
B14_1be3:		and #$07		; 29 07
B14_1be5:		asl a			; 0a
B14_1be6:		sta $7b			; 85 7b
B14_1be8:		lda $07			; a5 07
B14_1bea:		and #$38		; 29 38
B14_1bec:		asl a			; 0a
B14_1bed:		asl a			; 0a
B14_1bee:		ora $7b			; 05 7b
B14_1bf0:		sta $7a			; 85 7a
B14_1bf2:		lda $08			; a5 08
B14_1bf4:		and #$01		; 29 01
B14_1bf6:		ora $7a			; 05 7a
B14_1bf8:		tay				; a8 
B14_1bf9:		lda $0a			; a5 0a
B14_1bfb:		bne B14_1c03 ; d0 06

B14_1bfd:		lda $08			; a5 08
B14_1bff:		and #$02		; 29 02
B14_1c01:		bne B14_1c10 ; d0 0d

B14_1c03:		lda $79			; a5 79
B14_1c05:		lsr a			; 4a
B14_1c06:		lsr a			; 4a
B14_1c07:		sta $0600, y	; 99 00 06
B14_1c0a:		lda $0a			; a5 0a
B14_1c0c:		cmp #$1b		; c9 1b
B14_1c0e:		bcs B14_1c17 ; b0 07

B14_1c10:		lda $78			; a5 78
B14_1c12:		lsr a			; 4a
B14_1c13:		lsr a			; 4a
B14_1c14:		sta $0610, y	; 99 10 06
B14_1c17:		ldy $08			; a4 08
B14_1c19:		lda $07			; a5 07
B14_1c1b:		and #$38		; 29 38
B14_1c1d:		cmp #$38		; c9 38
B14_1c1f:		beq B14_1c33 ; f0 12

B14_1c21:		lda $0a			; a5 0a
B14_1c23:		beq B14_1c2e ; f0 09

B14_1c25:		cmp #$1c		; c9 1c
B14_1c27:		bcs B14_1c33 ; b0 0a

B14_1c29:		lda $dc89, y	; b9 89 dc
B14_1c2c:		bne B14_1c3d ; d0 0f

B14_1c2e:		tya				; 98 
B14_1c2f:		and #$02		; 29 02
B14_1c31:		beq B14_1c29 ; f0 f6

B14_1c33:		lda $dc91, y	; b9 91 dc
B14_1c36:		and $0f			; 25 0f
B14_1c38:		sta $0f			; 85 0f
B14_1c3a:		lda $dc8d, y	; b9 8d dc
B14_1c3d:		sta $0e			; 85 0e
B14_1c3f:		ldy $07			; a4 07
B14_1c41:		lda $06			; a5 06
B14_1c43:		and #$01		; 29 01
B14_1c45:		beq B14_1c4b ; f0 04

B14_1c47:		tya				; 98 
B14_1c48:		ora #$40		; 09 40
B14_1c4a:		tay				; a8 
B14_1c4b:		lda $08			; a5 08
B14_1c4d:		and #$01		; 29 01
B14_1c4f:		beq B14_1c55 ; f0 04

B14_1c51:		asl $0f			; 06 0f
B14_1c53:		asl $0f			; 06 0f
B14_1c55:		lda $0520, y	; b9 20 05
B14_1c58:		and $0e			; 25 0e
B14_1c5a:		ora $0f			; 05 0f
B14_1c5c:		sta $0520, y	; 99 20 05
B14_1c5f:		sta $0e			; 85 0e
B14_1c61:		ldy $0b			; a4 0b
B14_1c63:		lda $06			; a5 06
B14_1c65:		and #$01		; 29 01
B14_1c67:		bne B14_1c6d ; d0 04

B14_1c69:		lda #$23		; a9 23
B14_1c6b:		bne B14_1c6f ; d0 02

B14_1c6d:		lda #$27		; a9 27
B14_1c6f:		sta $0f			; 85 0f
B14_1c71:		lda $07			; a5 07
B14_1c73:		ora #$c0		; 09 c0
B14_1c75:		sta $05a1, y	; 99 a1 05
B14_1c78:		lda $0f			; a5 0f
B14_1c7a:		sta $05a0, y	; 99 a0 05
B14_1c7d:		lda $0e			; a5 0e
B14_1c7f:		sta $05a2, y	; 99 a2 05
B14_1c82:		inc $0b			; e6 0b
B14_1c84:		inc $0b			; e6 0b
B14_1c86:		inc $0b			; e6 0b
B14_1c88:		rts				; 60 


B14_1c89:		cpy $cc33		; cc 33 cc
B14_1c8c:	.db $33
B14_1c8d:	.db $fc
B14_1c8e:	.db $f3
B14_1c8f:	.db $cf
B14_1c90:	.db $3f
B14_1c91:	.db $03
B14_1c92:	.db $03
B14_1c93:		bmi B14_1cc5 ; 30 30

B14_1c95:		ldy $02			; a4 02
B14_1c97:		lda ($70), y	; b1 70
B14_1c99:		sta $0f			; 85 0f
B14_1c9b:		lda ($72), y	; b1 72
B14_1c9d:		tay				; a8 
B14_1c9e:		lda ($56), y	; b1 56
B14_1ca0:		sta $78			; 85 78
B14_1ca2:		and #$03		; 29 03
B14_1ca4:		asl a			; 0a
B14_1ca5:		asl a			; 0a
B14_1ca6:		sta $0c			; 85 0c
B14_1ca8:		ldy $0f			; a4 0f
B14_1caa:		lda ($56), y	; b1 56
B14_1cac:		sta $79			; 85 79
B14_1cae:		and #$03		; 29 03
B14_1cb0:		ora $0c			; 05 0c
B14_1cb2:		sta $0c			; 85 0c
B14_1cb4:		lda $0a			; a5 0a
B14_1cb6:		cmp #$1f		; c9 1f
B14_1cb8:		bcs B14_1cf3 ; b0 39

B14_1cba:		lda $07			; a5 07
B14_1cbc:		and #$07		; 29 07
B14_1cbe:		asl a			; 0a
B14_1cbf:		sta $7b			; 85 7b
B14_1cc1:		lda $07			; a5 07
B14_1cc3:		and #$38		; 29 38
B14_1cc5:		asl a			; 0a
B14_1cc6:		asl a			; 0a
B14_1cc7:		ora $7b			; 05 7b
B14_1cc9:		sta $7a			; 85 7a
B14_1ccb:		lda $08			; a5 08
B14_1ccd:		and #$02		; 29 02
B14_1ccf:		asl a			; 0a
B14_1cd0:		asl a			; 0a
B14_1cd1:		asl a			; 0a
B14_1cd2:		ora $7a			; 05 7a
B14_1cd4:		tay				; a8 
B14_1cd5:		lda $0a			; a5 0a
B14_1cd7:		bne B14_1cdf ; d0 06

B14_1cd9:		lda $08			; a5 08
B14_1cdb:		and #$01		; 29 01
B14_1cdd:		bne B14_1cec ; d0 0d

B14_1cdf:		lda $79			; a5 79
B14_1ce1:		lsr a			; 4a
B14_1ce2:		lsr a			; 4a
B14_1ce3:		sta $0600, y	; 99 00 06
B14_1ce6:		lda $0a			; a5 0a
B14_1ce8:		cmp #$1d		; c9 1d
B14_1cea:		bcs B14_1cf3 ; b0 07

B14_1cec:		lda $78			; a5 78
B14_1cee:		lsr a			; 4a
B14_1cef:		lsr a			; 4a
B14_1cf0:		sta $0601, y	; 99 01 06
B14_1cf3:		ldy $07			; a4 07
B14_1cf5:		lda $06			; a5 06
B14_1cf7:		and #$01		; 29 01
B14_1cf9:		beq B14_1cff ; f0 04

B14_1cfb:		tya				; 98 
B14_1cfc:		ora #$40		; 09 40
B14_1cfe:		tay				; a8 
B14_1cff:		lda $08			; a5 08
B14_1d01:		and #$02		; 29 02
B14_1d03:		beq B14_1d11 ; f0 0c

B14_1d05:		asl $0c			; 06 0c
B14_1d07:		asl $0c			; 06 0c
B14_1d09:		asl $0c			; 06 0c
B14_1d0b:		asl $0c			; 06 0c
B14_1d0d:		lda #$0f		; a9 0f
B14_1d0f:		bne B14_1d13 ; d0 02

B14_1d11:		lda #$f0		; a9 f0
B14_1d13:		and $0520, y	; 39 20 05
B14_1d16:		ora $0c			; 05 0c
B14_1d18:		sta $0520, y	; 99 20 05
B14_1d1b:		ldy $0b			; a4 0b
B14_1d1d:		sta $05a0, y	; 99 a0 05
B14_1d20:		inc $0b			; e6 0b
B14_1d22:		rts				; 60 


func_e_1d23:
B14_1d23:		ldx wNMIDataCopyStructNextIdx.w		; ae 00 01
B14_1d26:		ldy #$00		; a0 00
B14_1d28:		lda $05a0, y	; b9 a0 05
B14_1d2b:		sta wNMIDataCopyStruct.w, x	; 9d 01 01
B14_1d2e:		lda $05a1, y	; b9 a1 05
B14_1d31:		sta wNMIDataCopyStruct.w+1, x	; 9d 02 01
B14_1d34:		lda #$01		; a9 01
B14_1d36:		sta wNMIDataCopyDest.w+2, x	; 9d 03 01
B14_1d39:		lda $05a2, y	; b9 a2 05
B14_1d3c:		sta wNMIDataCopyBytes.w, x	; 9d 04 01
// y += 3, x += 4
B14_1d3f:		iny				; c8 
B14_1d40:		iny				; c8 
B14_1d41:		iny				; c8 
B14_1d42:		inx				; e8 
B14_1d43:		inx				; e8 
B14_1d44:		inx				; e8 
B14_1d45:		inx				; e8 
B14_1d46:		cpy #$18		; c0 18
B14_1d48:		bne B14_1d28 ; d0 de

B14_1d4a:		stx wNMIDataCopyStructNextIdx.w		; 8e 00 01
B14_1d4d:		lda #$ff		; a9 ff
B14_1d4f:		sta wNMIDataCopyStruct.w, x	; 9d 01 01
B14_1d52:		rts				; 60 


func_e_1d53:
B14_1d53:		ldx wNMIDataCopyStructNextIdx.w		; ae 00 01
B14_1d56:		ldy #$00		; a0 00
B14_1d58:		lda $05a0, y	; b9 a0 05
B14_1d5b:		sta wNMIDataCopyStruct.w, x	; 9d 01 01
B14_1d5e:		inx				; e8 
B14_1d5f:		iny				; c8 
B14_1d60:		dec $0b			; c6 0b
B14_1d62:		bne B14_1d58 ; d0 f4

B14_1d64:		lda #$ff		; a9 ff
B14_1d66:		sta wNMIDataCopyStruct.w, x	; 9d 01 01
B14_1d69:		stx wNMIDataCopyStructNextIdx.w		; 8e 00 01
B14_1d6c:		rts				; 60 


func_e_1d6d:
B14_1d6d:		lda #$51		; a9 51
B14_1d6f:		jsr setGlobalFlag		; 20 f0 e7
B14_1d72:		jsr pushLower2romBanks		; 20 43 fc
B14_1d75:		lda $34			; a5 34
B14_1d77:		pha				; 48 
B14_1d78:		lda $35			; a5 35
B14_1d7a:		pha				; 48 
B14_1d7b:		jsr $dfda		; 20 da df
B14_1d7e:		sei				; 78 
B14_1d7f:		lda $30			; a5 30
B14_1d81:		clc				; 18 
B14_1d82:		adc #$10		; 69 10
B14_1d84:		sta $30			; 85 30
B14_1d86:		lda $015a		; ad 5a 01
B14_1d89:		ora #$01		; 09 01
B14_1d8b:		sta $015a		; 8d 5a 01
B14_1d8e:		lda #$80		; a9 80
B14_1d90:		sta $34			; 85 34
B14_1d92:		lda #$00		; a9 00
B14_1d94:		sta $35			; 85 35
B14_1d96:		ldx #$20		; a2 20
B14_1d98:		txa				; 8a 
B14_1d99:		pha				; 48 
B14_1d9a:		jsr func_1386		; 20 86 f3
B14_1d9d:		jsr $d793		; 20 93 d7
B14_1da0:		jsr copyDataToDisplayFromVramQueue		; 20 48 e6
B14_1da3:		lda #$04		; a9 04
B14_1da5:		jsr swapLower2romBanksIdxedA		; 20 0c fd
B14_1da8:		lda $0170		; ad 70 01
B14_1dab:		eor $30			; 45 30
B14_1dad:		and #$01		; 29 01
B14_1daf:		bne B14_1db9 ; d0 08

B14_1db1:		lda $0170		; ad 70 01
B14_1db4:		eor #$01		; 49 01
B14_1db6:		sta $0170		; 8d 70 01
B14_1db9:		jsr func_4_0880		; 20 80 88

B14_1dbc:		lda #$0a		; a9 0a
B14_1dbe:		jsr swapLower2romBanksIdxedA		; 20 0c fd
B14_1dc1:		jsr $8000		; 20 00 80
B14_1dc4:		pla				; 68 
B14_1dc5:		tax				; aa 
B14_1dc6:		dex				; ca 
B14_1dc7:		bne B14_1d98 ; d0 cf

B14_1dc9:		cli				; 58 
B14_1dca:		lda #$5e		; a9 5e
B14_1dcc:		jsr checkGlobalFlag		; 20 e9 e7
B14_1dcf:		bne B14_1dfa ; d0 29

B14_1dd1:		lda $31			; a5 31
B14_1dd3:		sta $00			; 85 00
B14_1dd5:		lda $30			; a5 30
B14_1dd7:		asl $00			; 06 00
B14_1dd9:		rol a			; 2a
B14_1dda:		asl $00			; 06 00
B14_1ddc:		rol a			; 2a
B14_1ddd:		asl $00			; 06 00
B14_1ddf:		rol a			; 2a
B14_1de0:		asl $00			; 06 00
B14_1de2:		rol a			; 2a
B14_1de3:		sta $fd			; 85 fd
B14_1de5:		lda $33			; a5 33
B14_1de7:		sta $00			; 85 00
B14_1de9:		lda $32			; a5 32
B14_1deb:		asl $00			; 06 00
B14_1ded:		rol a			; 2a
B14_1dee:		asl $00			; 06 00
B14_1df0:		rol a			; 2a
B14_1df1:		asl $00			; 06 00
B14_1df3:		rol a			; 2a
B14_1df4:		asl $00			; 06 00
B14_1df6:		rol a			; 2a
B14_1df7:		jmp $de11		; 4c 11 de


B14_1dfa:		lda $0476		; ad 76 04
B14_1dfd:		sec				; 38 
B14_1dfe:		sbc #$a8		; e9 a8
B14_1e00:		eor #$ff		; 49 ff
B14_1e02:		sta $fd			; 85 fd
B14_1e04:		inc $fd			; e6 fd
B14_1e06:		lda $0477		; ad 77 04
B14_1e09:		sec				; 38 
B14_1e0a:		sbc #$e8		; e9 e8
B14_1e0c:		eor #$ff		; 49 ff
B14_1e0e:		clc				; 18 
B14_1e0f:		adc #$01		; 69 01
B14_1e11:		sta $fc			; 85 fc
B14_1e13:		pla				; 68 
B14_1e14:		sta $35			; 85 35
B14_1e16:		pla				; 68 
B14_1e17:		sta $34			; 85 34
B14_1e19:		lda #$51		; a9 51
B14_1e1b:		jsr unsetGlobalFlag		; 20 fc e7
B14_1e1e:		jmp pullAndSetLower2romBanks		; 4c 5b fc


B14_1e21:		jsr pushLower2romBanks		; 20 43 fc
B14_1e24:		lda wCurrRoomGroupDataBank			; a5 48
B14_1e26:		jsr swapLower2romBanksIdxedA		; 20 0c fd
B14_1e29:		ldx #$0b		; a2 0b
B14_1e2b:		lda $015a		; ad 5a 01
B14_1e2e:		and #$fe		; 29 fe
B14_1e30:		sta $015a		; 8d 5a 01
B14_1e33:		txa				; 8a 
B14_1e34:		pha				; 48 
B14_1e35:		asl a			; 0a
B14_1e36:		tay				; a8 
B14_1e37:		lda $33			; a5 33
B14_1e39:		clc				; 18 
B14_1e3a:		adc $de5c, y	; 79 5c de
B14_1e3d:		sta $3f			; 85 3f
B14_1e3f:		lda $32			; a5 32
B14_1e41:		adc $de5d, y	; 79 5d de
B14_1e44:		sta $3e			; 85 3e
B14_1e46:		lda $31			; a5 31
B14_1e48:		sta $3d			; 85 3d
B14_1e4a:		lda $30			; a5 30
B14_1e4c:		sta $3c			; 85 3c
B14_1e4e:		jsr $d7e4		; 20 e4 d7
B14_1e51:		jsr func_052e		; 20 2e e5
B14_1e54:		pla				; 68 
B14_1e55:		tax				; aa 
B14_1e56:		dex				; ca 
B14_1e57:		bpl B14_1e2b ; 10 d2

B14_1e59:		jmp pullAndSetLower2romBanks		; 4c 5b fc


B14_1e5c:		.db $00				; 00
B14_1e5d:	.db $02
B14_1e5e:	.db $80
B14_1e5f:	.db $02
B14_1e60:		.db $00				; 00
B14_1e61:	.db $03
B14_1e62:	.db $80
B14_1e63:	.db $03
B14_1e64:		.db $00				; 00
B14_1e65:	.db $04
B14_1e66:	.db $80
B14_1e67:	.db $04
B14_1e68:		.db $00				; 00
B14_1e69:		ora $80			; 05 80
B14_1e6b:		ora $00			; 05 00
B14_1e6d:		asl $80			; 06 80
B14_1e6f:		asl $00			; 06 00
B14_1e71:	.db $07
B14_1e72:	.db $80
B14_1e73:	.db $07
B14_1e74:		jsr pushLower2romBanks		; 20 43 fc
B14_1e77:		ldx #$00		; a2 00
B14_1e79:		lda wEntityStructs.id.w, x	; bd 08 04
B14_1e7c:		cmp #$40		; c9 40
B14_1e7e:		bne B14_1e8a ; d0 0a

B14_1e80:		lda wEntityStructs.byte9.w, x	; bd 09 04
B14_1e83:		beq B14_1e8a ; f0 05

B14_1e85:		lda #$00		; a9 00
B14_1e87:		sta wEntityStructs.byte9.w, x	; 9d 09 04
B14_1e8a:		txa				; 8a 
B14_1e8b:		clc				; 18 
B14_1e8c:		adc #$10		; 69 10
B14_1e8e:		tax				; aa 
B14_1e8f:		cmp #$80		; c9 80
B14_1e91:		bne B14_1e79 ; d0 e6

B14_1e93:		lda wCurrRoomGroupDataBank			; a5 48
B14_1e95:		jsr swapLower2romBanksIdxedA		; 20 0c fd
B14_1e98:		ldx #$1d		; a2 1d
B14_1e9a:		lda $015a		; ad 5a 01
B14_1e9d:		and #$fe		; 29 fe
B14_1e9f:		sta $015a		; 8d 5a 01
B14_1ea2:		txa				; 8a 
B14_1ea3:		pha				; 48 
B14_1ea4:		asl a			; 0a
B14_1ea5:		tay				; a8 
B14_1ea6:		lda $33			; a5 33
B14_1ea8:		clc				; 18 
B14_1ea9:		adc $decd, y	; 79 cd de
B14_1eac:		sta $3f			; 85 3f
B14_1eae:		lda $32			; a5 32
B14_1eb0:		adc $dece, y	; 79 ce de
B14_1eb3:		sta $3e			; 85 3e
B14_1eb5:		lda $31			; a5 31
B14_1eb7:		sta $3d			; 85 3d
B14_1eb9:		lda $30			; a5 30
B14_1ebb:		sta $3c			; 85 3c
B14_1ebd:		jsr $d7e4		; 20 e4 d7
B14_1ec0:		ldx #$04		; a2 04
B14_1ec2:		jsr func_0530		; 20 30 e5
B14_1ec5:		pla				; 68 
B14_1ec6:		tax				; aa 
B14_1ec7:		dex				; ca 
B14_1ec8:		bpl B14_1e9a ; 10 d0

B14_1eca:		jmp pullAndSetLower2romBanks		; 4c 5b fc


B14_1ecd:		.db $00				; 00
B14_1ece:		.db $00				; 00
B14_1ecf:	.db $80
B14_1ed0:		.db $00				; 00
B14_1ed1:		.db $00				; 00
B14_1ed2:		ora ($80, x)	; 01 80
B14_1ed4:		ora ($00, x)	; 01 00
B14_1ed6:	.db $02
B14_1ed7:	.db $80
B14_1ed8:	.db $02
B14_1ed9:		.db $00				; 00
B14_1eda:	.db $03
B14_1edb:	.db $80
B14_1edc:	.db $03
B14_1edd:		.db $00				; 00
B14_1ede:	.db $04
B14_1edf:	.db $80
B14_1ee0:	.db $04
B14_1ee1:		.db $00				; 00
B14_1ee2:		ora $80			; 05 80
B14_1ee4:		ora $00			; 05 00
B14_1ee6:		asl $80			; 06 80
B14_1ee8:		asl $00			; 06 00
B14_1eea:	.db $07
B14_1eeb:	.db $80
B14_1eec:	.db $07
B14_1eed:		.db $00				; 00
B14_1eee:		php				; 08 
B14_1eef:	.db $80
B14_1ef0:		php				; 08 
B14_1ef1:		.db $00				; 00
B14_1ef2:		ora #$80		; 09 80
B14_1ef4:		ora #$00		; 09 00
B14_1ef6:		asl a			; 0a
B14_1ef7:	.db $80
B14_1ef8:		asl a			; 0a
B14_1ef9:		.db $00				; 00
B14_1efa:	.db $0b
B14_1efb:	.db $80
B14_1efc:	.db $0b
B14_1efd:		.db $00				; 00
B14_1efe:	.db $0c
B14_1eff:	.db $80
B14_1f00:	.db $0c
B14_1f01:		.db $00				; 00
B14_1f02:		ora $0d80		; 0d 80 0d
B14_1f05:		.db $00				; 00
B14_1f06:		asl $0e80		; 0e 80 0e


func_e_1f09:
B14_1f09:		jsr pushLower2romBanks		; 20 43 fc
B14_1f0c:		lda #:func_c_11b4		; a9 0c
B14_1f0e:		jsr swapLower2romBanksIdxedA		; 20 0c fd
B14_1f11:		jsr func_c_11b4		; 20 b4 91
B14_1f14:		jmp pullAndSetLower2romBanks		; 4c 5b fc


B14_1f17:		jsr pushLower2romBanks		; 20 43 fc
B14_1f1a:		lda #$0c		; a9 0c
B14_1f1c:		jsr swapLower2romBanksIdxedA		; 20 0c fd
B14_1f1f:		lda #$02		; a9 02
B14_1f21:		sta $81			; 85 81
B14_1f23:		jsr func_d_14c1		; 20 c1 b4
B14_1f26:		jmp pullAndSetLower2romBanks		; 4c 5b fc


func_e_1f29:
B14_1f29:		jsr pushLower2romBanks		; 20 43 fc
B14_1f2c:		lda #$0a		; a9 0a
B14_1f2e:		jsr swapLower2romBanksIdxedA		; 20 0c fd
B14_1f31:		lda #$01		; a9 01
B14_1f33:		jsr func_0578		; 20 78 e5
B14_1f36:		jsr $dfda		; 20 da df
B14_1f39:		lda #$00		; a9 00
B14_1f3b:		sta $28			; 85 28
B14_1f3d:		lda #$01		; a9 01
B14_1f3f:		jsr $8033		; 20 33 80
B14_1f42:		jsr wOam_outOfYbounds		; 20 6a e5
B14_1f45:		jsr func_12fe		; 20 fe f2
B14_1f48:		jsr $dfc1		; 20 c1 df
B14_1f4b:		jsr $dfcf		; 20 cf df
B14_1f4e:		lda #$01		; a9 01
B14_1f50:		jsr func_05cb		; 20 cb e5
B14_1f53:		jsr pullAndSetLower2romBanks		; 20 5b fc
B14_1f56:		pla				; 68 
B14_1f57:		pla				; 68 
B14_1f58:		jmp $e060		; 4c 60 e0


B14_1f5b:		ldy wCurrRoomGroup.w		; ac 62 01
B14_1f5e:		lda $df69, y	; b9 69 df
B14_1f61:		cmp $c7			; c5 c7
B14_1f63:		beq B14_1f68 ; f0 03

B14_1f65:		jmp func_08e5		; 4c e5 e8


B14_1f68:		rts				; 60 


B14_1f69:		.db $00				; 00
B14_1f6a:		.db $00				; 00
B14_1f6b:		ora ($02, x)	; 01 02
B14_1f6d:		ora #$01		; 09 01
B14_1f6f:		.db $00				; 00
B14_1f70:		.db $00				; 00
B14_1f71:		.db $00				; 00
B14_1f72:		ora ($00, x)	; 01 00


fillFirst3nametablesWithA_clearPalettes:
	pha
	ldx #>$2000
	ldy #>$23c0
	jsr fillNametableWithA_clearPalettes
	pla
	pha
	ldx #>$2400
	ldy #>$27c0
	jsr fillNametableWithA_clearPalettes
	pla
	ldx #>$2800
	ldy #>$2bc0
	jmp fillNametableWithA_clearPalettes


B14_1f8d:		ldx #$20		; a2 20
B14_1f8f:		ldy #$23		; a0 23
B14_1f91:		bne fillNametableWithA_clearPalettes ; d0 04

B14_1f93:		ldx #$24		; a2 24
B14_1f95:		ldy #$27		; a0 27

fillNametableWithA_clearPalettes:
	sty wNametablePaletteAddr_hi
// x is high byte of ppu addr
	stx PPUADDR
	ldx #$00
	stx PPUADDR
// set ppu data from A to whole nametable incl palettes
	ldy #$04
-	sta PPUDATA
	dex
	bne -
	dey
	bne -

// orig y,$c0 is palette addr
	lda wNametablePaletteAddr_hi
	sta PPUADDR
	lda #$c0
	sta PPUADDR
// clear with 0
	ldx #$40
	lda #$00
-	sta PPUDATA
	dex
	bne -

	rts


func_e_1fc1:
B14_1fc1:		jsr pushLower2romBanks		; 20 43 fc
B14_1fc4:		lda #$0c		; a9 0c
B14_1fc6:		jsr swapLower2romBanksIdxedA		; 20 0c fd
B14_1fc9:		jsr func_d_1341		; 20 41 b3
B14_1fcc:		jmp pullAndSetLower2romBanks		; 4c 5b fc


func_e_1fcf:
B14_1fcf:		jsr func_052e		; 20 2e e5
B14_1fd2:		lda #$1e		; a9 1e
B14_1fd4:		sta wPPUMask			; 85 fe
B14_1fd6:		sta PPUMASK		; 8d 01 20
B14_1fd9:		rts				; 60 


func_e_1fda:
B14_1fda:		jsr func_052e		; 20 2e e5
B14_1fdd:		lda #$00		; a9 00
B14_1fdf:		sta wPPUMask			; 85 fe
B14_1fe1:		sta PPUMASK		; 8d 01 20
B14_1fe4:		rts				; 60 
