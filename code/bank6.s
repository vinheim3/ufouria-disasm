
drawStaticLayoutAtCurrPPUAddr:
	lda staticLayouts.w, y
	sta wLayoutDataAddr
	lda staticLayouts.w+1, y
	sta wLayoutDataAddr+1
// skip the ppu addr 2 bytes
	ldy #$02
	jmp _drawStaticLayoutAfterSettingDataAddr


// from layout address,
// byte 0/1 - top-left ppu address big-endian
// byte 2 - num cols, byte 3 - num rows
drawStaticLayout:
// store addr from 0153 list
	lda staticLayouts.w, y
	sta wLayoutDataAddr
	lda staticLayouts.w+1, y
	sta wLayoutDataAddr+1

// 1st byte in that addr is ppu addr high byte
	ldy #$00
	lda (wLayoutDataAddr), y
	sta wCurrLayoutRowPPUAddrBE

// next byte is ppu addr low byte
	iny
	lda (wLayoutDataAddr), y
	sta wCurrLayoutRowPPUAddrBE+1

// next byte is number of cols
	iny

_drawStaticLayoutAfterSettingDataAddr:
	lda (wLayoutDataAddr), y
	sta wCurrDrawnLayoutCols

// next byte is number of rows
	iny
	lda (wLayoutDataAddr), y
	sta wCurrDrawnLayoutRows
	iny

@nextRow:
	lda wCurrLayoutRowPPUAddrBE
	sta PPUADDR
	lda wCurrLayoutRowPPUAddrBE+1
	sta PPUADDR

	lda wCurrDrawnLayoutCols
	sta wLayoutColsLeft

@nextCol:
	lda (wLayoutDataAddr), y
	sta PPUDATA
	iny
	bne +
	inc wLayoutDataAddr+1
+	dec wLayoutColsLeft
	bne @nextCol

// ppu addr low byte += $20
	lda wCurrLayoutRowPPUAddrBE+1
	clc
	adc #$20
	sta wCurrLayoutRowPPUAddrBE+1
// ppu addr high byte add carry
	lda wCurrLayoutRowPPUAddrBE
	adc #$00
	sta wCurrLayoutRowPPUAddrBE

	dec wCurrDrawnLayoutRows
	bne @nextRow

	rts


copyStaticLayoutForNMIDataCopyingAtCurrPPUAddr:
	lda staticLayouts.w, y
	sta wLayoutDataAddr
	lda staticLayouts.w+1, y
	sta wLayoutDataAddr+1

// skip past the current static layout's given ppu addr
	ldy #$02
	ldx wNMIDataCopyStructNextIdx.w

	lda wCurrLayoutRowPPUAddrBE
	sta wNMIDataCopyDest.w, x
	inx
	lda wCurrLayoutRowPPUAddrBE+1
	sta wNMIDataCopyDest.w, x
	inx
	jmp _copyStaticLayoutForNMIDataCopyingAfterSettingDataAddress


copyStaticLayoutForNMIDataCopying:
	lda staticLayouts.w, y
	sta wLayoutDataAddr
	lda staticLayouts.w+1, y
	sta wLayoutDataAddr+1

	ldy #$00
// store ppu addr high byte for nmi copying and in $0e
	ldx wNMIDataCopyStructNextIdx.w
	lda (wLayoutDataAddr), y
	sta wNMIDataCopyDest.w, x
	sta wCurrLayoutRowPPUAddrBE
	inx
	iny
// store ppu addr low byte for nmi copying and in $0f
	lda (wLayoutDataAddr), y
	sta wNMIDataCopyDest.w, x
	sta wCurrLayoutRowPPUAddrBE+1
	inx
	iny

_copyStaticLayoutForNMIDataCopyingAfterSettingDataAddress:
// width in $02
	lda (wLayoutDataAddr), y
	sta wCurrDrawnLayoutCols
	iny
// height in $03
	lda (wLayoutDataAddr), y
	sta wCurrDrawnLayoutRows
	iny
@nextRow:
// copy number of bytes in row, to load for row during nmi
	lda wCurrDrawnLayoutCols
	sta wLayoutColsLeft
	sta wNMIDataCopyStruct.w, x
	inx
@nextCol:
	lda (wLayoutDataAddr), y
	sta wNMIDataCopyStruct.w, x
	inx
// inc y and inc high byte of data addr offset, if y loops to 0
	iny
	bne +
	inc wLayoutDataAddr+1
+	dec wLayoutColsLeft
	bne @nextCol

	dec wCurrDrawnLayoutRows
	beq @done

// ppu addr low byte += $20
	lda wCurrLayoutRowPPUAddrBE+1
	clc
	adc #$20
	sta wCurrLayoutRowPPUAddrBE+1
// carry ppu addr high byte
	lda wCurrLayoutRowPPUAddrBE
	adc #$00
	sta wCurrLayoutRowPPUAddrBE
// next row ppu addr in nmi data copy struct
	sta wNMIDataCopyDest.w, x
	inx
	lda wCurrLayoutRowPPUAddrBE+1
	sta wNMIDataCopyDest.w, x
	inx
	jmp @nextRow

@done:
	lda #$ff
	sta wNMIDataCopyDest.w, x
	stx wNMIDataCopyStructNextIdx.w
	rts


// like above, but for when ppu free?
func_6_00e4:
	lda staticLayouts.w, y
	sta wLayoutDataAddr
	lda staticLayouts.w+1, y
	sta wLayoutDataAddr+1

// store ppu addr high byte for nmi data copy and $0e
	ldy #$00		; a0 00
	ldx wNMIDataCopyStructNextIdx.w		; ae 00 01
	lda (wLayoutDataAddr), y	; b1 00
	sta wNMIDataCopyDest.w, x	; 9d 01 01
	sta wCurrLayoutRowPPUAddrBE			; 85 0e

// store ppu addr low byte for nmi data copy and $0f
	inx				; e8
	iny				; c8
	lda (wLayoutDataAddr), y	; b1 00
	sta wNMIDataCopyDest.w, x	; 9d 01 01
	sta wCurrLayoutRowPPUAddrBE+1			; 85 0f

// store width in $03
	inx				; e8
	iny				; c8
	lda (wLayoutDataAddr), y	; b1 00
	sta wCurrDrawnLayoutCols			; 85 02

// store height in $02
	iny				; c8
	lda (wLayoutDataAddr), y	; b1 00
	sta wCurrDrawnLayoutRows			; 85 03
	iny				; c8

// loop below until $03 done
func_6_010f:
@nextRow:
// nmi copy col num of bytes, copied next
	lda wCurrDrawnLayoutCols			; a5 02
	sta wLayoutColsLeft			; 85 04
	sta wNMIDataCopyDest.w, x	; 9d 01 01
	inx				; e8

// loop copy layout bytes for row
-	lda (wLayoutDataAddr), y	; b1 00
	sta wNMIDataCopyDest.w, x	; 9d 01 01
	inx				; e8
	iny				; c8
	bne +
	inc wLayoutDataAddr+1			; e6 01
+	dec wLayoutColsLeft			; c6 04
	bne -

// set nmi struct to finish in case done
	lda #$ff		; a9 ff
	sta wNMIDataCopyDest.w, x	; 9d 01 01
	stx wNMIDataCopyStructNextIdx.w		; 8e 00 01
B6_012e:		jsr func_052e		; 20 2e e5
	dec wCurrDrawnLayoutRows			; c6 03
	bne @prepForNextRow

	rts				; 60

@prepForNextRow:
	ldx wNMIDataCopyStructNextIdx.w		; ae 00 01
	lda wCurrLayoutRowPPUAddrBE+1			; a5 0f
	clc				; 18
	adc #$20		; 69 20
	sta wCurrLayoutRowPPUAddrBE+1			; 85 0f
	lda wCurrLayoutRowPPUAddrBE			; a5 0e
	adc #$00		; 69 00
	sta wCurrLayoutRowPPUAddrBE			; 85 0e
	sta wNMIDataCopyDest.w, x	; 9d 01 01
	inx				; e8
	lda wCurrLayoutRowPPUAddrBE+1			; a5 0f
	sta wNMIDataCopyDest.w, x	; 9d 01 01
	inx				; e8
	jmp func_6_010f		; @nextRow


staticLayouts:
	.dw staticLayout_00
	.dw staticLayout_01
	.dw staticLayout_02
	.dw staticLayout_inventoryScreenBox
	.dw staticLayout_inventoryScreenPalettes
	.dw staticLayout_invFreeonShown
	.dw staticLayout_invShadesShown
	.dw staticLayout_invGilShown
	.dw staticLayout_invPasswordCrystal
	.dw staticLayout_invMap
	.dw staticLayout_invCompass
	.dw staticLayout_invBopsSpecial
	.dw staticLayout_invSuctionCup
	.dw staticLayout_invShadesHammer
	.dw staticLayout_invBlueRing
	.dw staticLayout_invGreenRing
	.dw staticLayout_invRedRing
	.dw staticLayout_invGilsBombs
	.dw staticLayout_invFreeonsSpecial
	.dw staticLayout_invPotion
	.dw staticLayout_invWaterOfLife
	.dw staticLayout_invPowerOfInsight
	.dw staticLayout_16
	.dw staticLayout_17
	.dw staticLayout_invKey1
	.dw staticLayout_invKey2
	.dw staticLayout_invKey3
	.dw staticLayout_invBopHidden
	.dw staticLayout_invFreeonHidden
	.dw staticLayout_invShadesHidden
	.dw staticLayout_invGilHidden
	.dw staticLayout_1f
	.dw staticLayout_20
	.dw staticLayout_21
	.dw staticLayout_22
	.dw staticLayout_invPasswordScreen
	.dw staticLayout_24
	.dw staticLayout_25
	.dw staticLayout_26
	.dw staticLayout_27
	.dw staticLayout_28
	.dw staticLayout_29
	.dw staticLayout_2a
	.dw staticLayout_2b
	.dw staticLayout_2c
	.dw staticLayout_2d
	.dw staticLayout_2e
	.dw staticLayout_2f
	.dw staticLayout_30
	.dw staticLayout_31
	.dw staticLayout_32
	.dw staticLayout_33
	.dw staticLayout_titleScreenUfouria
	.dw staticLayout_titleScreenNametable0Palettes
	.dw staticLayout_titleScreenCopyrightAndLicense
	.dw staticLayout_37
	.dw staticLayout_38
	.dw staticLayout_39
	.dw staticLayout_3a
	.dw staticLayout_3b
	.dw staticLayout_3c
	.dw staticLayout_3d
	.dw staticLayout_3e
	.dw staticLayout_3f
	.dw staticLayout_40
	.dw staticLayout_41
	.dw staticLayout_42
	.dw staticLayout_43
	.dw staticLayout_44
	.dw staticLayout_45
	.dw staticLayout_46
	.dw staticLayout_47
	.dw staticLayout_48
	.dw staticLayout_49
	.dw staticLayout_4a
	.dw staticLayout_4b
	.dw staticLayout_4c
	.dw staticLayout_4d
	.dw staticLayout_4e
	.dw staticLayout_4f
	.dw staticLayout_50
	.dw staticLayout_51
	.dw staticLayout_52
	.dw staticLayout_53
	.dw staticLayout_54
	.dw staticLayout_55
	.dw staticLayout_56
	.dw staticLayout_57
	.dw staticLayout_58
	.dw staticLayout_59
	.dw staticLayout_5a
	.dw staticLayout_5b
	.dw staticLayout_5c
	.dw staticLayout_5d
	.dw staticLayout_5e
	.dw staticLayout_5f
	.dw staticLayout_60
	.dw staticLayout_61
	.dw staticLayout_62
	.dw staticLayout_titleScreenCutsceneBopBox
	.dw staticLayout_titleScreenCutsceneNametable0Palettes
	.dw staticLayout_titleScreenCutscene
	.dw staticLayout_66
	.dw staticLayout_67
	.dw staticLayout_68
	.dw staticLayout_69
	.dw staticLayout_6a
	.dw staticLayout_6b
	.dw staticLayout_6c
	.dw staticLayout_6d
	.dw staticLayout_6e
	.dw staticLayout_6f
	.dw staticLayout_70

staticLayout_00:
	dwbe $2089
	.db $0e $01
	.db $0f $15 $0a $10 $3c $0c $18 $17 $0d $12 $1d $12 $18 $17

staticLayout_01:
	dwbe $20e8
	.db $11 $01
	.db $00 $01 $02 $03 $04 $05 $06 $07 $3c $08 $09 $0a $0b $0c $0d $0e $0f

staticLayout_02:
	dwbe $2125
	.db $02 $10
	.db $00 $00
	.db $01 $00
	.db $02 $00
	.db $03 $00
	.db $04 $00
	.db $05 $00
	.db $06 $00
	.db $07 $00
	.db $08 $00
	.db $09 $00
	.db $0a $00
	.db $0b $00
	.db $0c $00
	.db $0d $00
	.db $0e $00
	.db $0f $00

staticLayout_inventoryScreenBox:
	dwbe $2043
	.db $1a $1a
	.db $10 $20 $20 $20 $20 $20 $20 $20 $20 $20 $20 $20 $20 $20 $20 $20 $20 $20 $20 $20 $20 $20 $20 $30 $51 $51
	.db $11 $02 $72 $72 $72 $72 $72 $72 $72 $72 $72 $72 $72 $72 $72 $72 $72 $72 $72 $72 $72 $72 $dc $31 $51 $51
	.db $11 $01 $21 $21 $21 $b0 $90 $c0 $90 $d0 $80 $21 $92 $c0 $f0 $82 $90 $92 $b0 $21 $21 $21 $21 $31 $00 $00
	.db $11 $01 $21 $21 $21 $b1 $91 $c1 $91 $d1 $71 $21 $e1 $c1 $f1 $83 $91 $93 $b1 $21 $21 $21 $21 $31 $00 $00
	.db $11 $01 $40 $50 $ec $fc $60 $40 $50 $50 $50 $60 $40 $50 $50 $50 $60 $40 $50 $50 $50 $60 $21 $31 $00 $00
	.db $11 $01 $41 $dd $ed $fd $61 $41 $21 $21 $21 $61 $41 $21 $21 $21 $61 $41 $21 $21 $21 $61 $21 $31 $00 $00
	.db $11 $01 $41 $de $ee $fe $61 $41 $21 $21 $21 $61 $41 $21 $21 $21 $61 $41 $21 $21 $21 $61 $21 $31 $00 $00
	.db $11 $01 $42 $df $ef $ff $62 $42 $52 $52 $52 $62 $42 $52 $52 $52 $62 $42 $52 $52 $52 $62 $21 $31 $00 $00
	.db $11 $01 $21 $21 $21 $21 $21 $21 $21 $21 $70 $80 $90 $a0 $21 $21 $21 $21 $21 $21 $21 $21 $21 $31 $00 $00
	.db $11 $01 $21 $21 $21 $21 $21 $21 $21 $21 $71 $71 $91 $a1 $21 $21 $21 $21 $21 $21 $21 $21 $21 $31 $00 $00
	.db $11 $01 $40 $50 $50 $60 $40 $50 $50 $60 $40 $50 $50 $50 $50 $50 $50 $50 $50 $50 $50 $60 $21 $31 $00 $00
	.db $11 $01 $41 $21 $21 $61 $41 $21 $21 $61 $41 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $61 $21 $31 $00 $00
	.db $11 $01 $41 $21 $21 $61 $41 $21 $21 $61 $41 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $61 $21 $31 $00 $00
	.db $11 $01 $41 $21 $21 $61 $41 $21 $21 $61 $41 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $61 $21 $31 $00 $00
	.db $11 $01 $41 $21 $21 $61 $41 $21 $21 $61 $41 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $61 $21 $31 $00 $00
	.db $11 $01 $41 $21 $21 $61 $41 $21 $21 $61 $41 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $61 $21 $31 $00 $00
	.db $11 $01 $42 $52 $52 $62 $42 $52 $52 $62 $42 $52 $52 $52 $52 $52 $52 $52 $52 $52 $52 $62 $21 $31 $00 $00
	.db $11 $01 $21 $21 $c0 $70 $a2 $90 $21 $21 $21 $21 $21 $21 $21 $b2 $90 $82 $21 $21 $21 $21 $21 $31 $00 $00
	.db $11 $01 $21 $21 $c1 $71 $a3 $91 $21 $21 $21 $21 $21 $21 $21 $b3 $91 $83 $21 $21 $21 $21 $21 $31 $00 $00
	.db $11 $01 $40 $50 $50 $50 $50 $50 $50 $50 $50 $60 $21 $21 $40 $50 $50 $50 $50 $50 $50 $60 $21 $31 $00 $00
	.db $11 $01 $41 $21 $21 $21 $21 $21 $21 $21 $21 $61 $21 $21 $41 $21 $21 $21 $21 $21 $21 $61 $21 $31 $00 $00
	.db $11 $01 $42 $52 $52 $52 $52 $52 $52 $52 $52 $62 $21 $21 $42 $52 $52 $52 $52 $52 $52 $62 $21 $31 $00 $00
	.db $11 $6c $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $85 $31 $00 $00
	.db $12 $22 $22 $22 $22 $22 $22 $22 $22 $22 $22 $22 $22 $22 $22 $22 $22 $22 $22 $22 $22 $22 $22 $32 $00 $00
	.db $51 $51 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00
	.db $51 $51 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00

staticLayout_inventoryScreenPalettes:
	dwbe $23c0
	.db $20 $02
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $c4 $44 $83 $37 $0b $00 $00
	.db $00 $03 $08 $04 $00 $02 $00 $00
	.db $00 $00 $00 $00 $04 $bb $00 $00
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $00 $00 $00 $00 $00 $00 $00

staticLayout_invFreeonShown:
	dwbe $20cb
	.db $03 $04
	.db $50 $bc $50
	.db $ad $bd $cd
	.db $ae $be $ce
	.db $af $bf $cf

staticLayout_invShadesShown:
	dwbe $20d0
	.db $03 $04
	.db $7c $8c $9c
	.db $7d $8d $9d
	.db $7e $8e $9e
	.db $7f $8f $9f

staticLayout_invGilShown:
	dwbe $20d5
	.db $03 $04
	.db $4c $5c $50
	.db $4d $5d $6d
	.db $4e $5e $6e
	.db $4f $5f $6f

staticLayout_invPasswordCrystal:
	dwbe $21a6
	.db $02 $02
	.db $28 $38
	.db $29 $39

staticLayout_invMap:
	dwbe $2206
	.db $02 $02
	.db $48 $58
	.db $49 $59

staticLayout_invCompass:
	dwbe $21ae
	.db $02 $02
	.db $8a $9a
	.db $8b $9b

staticLayout_invBopsSpecial:
	dwbe $21b0
	.db $02 $02
	.db $4a $5a
	.db $4b $5b

staticLayout_invSuctionCup:
	dwbe $220e
	.db $02 $02
	.db $68 $78
	.db $69 $79

staticLayout_invShadesHammer:
	dwbe $2214
	.db $02 $02
	.db $2e $3e
	.db $2f $3f

staticLayout_invBlueRing:
	dwbe $21b2
	.db $02 $02
	.db $6a $7a
	.db $6b $7b

staticLayout_invGreenRing:
	dwbe $21b4
	.db $02 $02
	.db $6a $7a
	.db $6b $7b

staticLayout_invRedRing:
	dwbe $21b6
	.db $02 $02
	.db $6a $7a
	.db $6b $7b

staticLayout_invGilsBombs:
	dwbe $2212
	.db $02 $02
	.db $0a $1a
	.db $0b $1b

staticLayout_invFreeonsSpecial:
	dwbe $2210
	.db $02 $02
	.db $2c $3c
	.db $2d $3d

staticLayout_invPotion:
	dwbe $21aa
	.db $02 $02
	.db $08 $18
	.db $09 $19

staticLayout_invWaterOfLife:
	dwbe $220a
	.db $02 $02
	.db $08 $18
	.db $09 $19

staticLayout_invPowerOfInsight:
	dwbe $2216
	.db $02 $02
	.db $2a $3a
	.db $2b $3b

staticLayout_16:
	dwbe $220a
	.db $02 $02
	.db $21 $21
	.db $21 $21

staticLayout_17:
	dwbe $2000
	.db $20 $01
	.db $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc

staticLayout_invKey1:
	dwbe $22b2
	.db $02 $03
	.db $87 $97
	.db $88 $98
	.db $89 $99

staticLayout_invKey2:
	dwbe $22b4
	.db $02 $03
	.db $87 $97
	.db $88 $98
	.db $89 $99

staticLayout_invKey3:
	dwbe $22b6
	.db $02 $03
	.db $87 $97
	.db $88 $98
	.db $89 $99

staticLayout_invBopHidden:
	dwbe $20c6
	.db $03 $04
	.db $50 $50 $50
	.db $21 $21 $21
	.db $21 $21 $21
	.db $52 $52 $52

staticLayout_invFreeonHidden:
	dwbe $20cb
	.db $03 $04
	.db $50 $50 $50
	.db $21 $21 $21
	.db $21 $21 $21
	.db $52 $52 $52

staticLayout_invShadesHidden:
	dwbe $20d0
	.db $03 $04
	.db $50 $50 $50
	.db $21 $21 $21
	.db $21 $21 $21
	.db $52 $52 $52

staticLayout_invGilHidden:
	dwbe $20d5
	.db $03 $04
	.db $50 $50 $50
	.db $21 $21 $21
	.db $21 $21 $21
	.db $52 $52 $52

staticLayout_1f:
	dwbe $20c6
	.db $03 $04
	.db $50 $ec $fc
	.db $dd $ed $fd
	.db $de $ee $fe
	.db $df $ef $ff

staticLayout_20:
	dwbe $214b
	.db $0a $01
	.db $7d $2e $86 $5e $00 $00 $3f $7c $5e $3e

staticLayout_21:
	dwbe $2082
	.db $1c $18
	.db $10 $20 $20 $20 $20 $20 $20 $20 $20 $20 $20 $20 $20 $20 $20 $20 $20 $20 $20 $20 $20 $20 $20 $20 $20 $30 $51 $51
	.db $11 $02 $72 $72 $72 $72 $72 $72 $72 $72 $72 $72 $72 $72 $72 $72 $72 $72 $72 $72 $72 $72 $72 $72 $dc $31 $51 $51
	.db $11 $01 $21 $21 $21 $21 $21 $21 $c2 $d2 $92 $c0 $92 $21 $a0 $f0 $92 $21 $21 $21 $21 $21 $21 $21 $21 $31 $00 $00
	.db $11 $01 $21 $21 $21 $21 $21 $21 $c3 $d3 $93 $c1 $e3 $21 $a1 $f1 $e1 $21 $21 $21 $21 $21 $21 $21 $21 $31 $00 $00
	.db $11 $01 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $31 $00 $00
	.db $11 $01 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $31 $00 $00
	.db $11 $01 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $31 $00 $00
	.db $11 $01 $21 $21 $63 $63 $24 $21 $21 $21 $21 $21 $21 $14 $23 $63 $63 $21 $21 $21 $21 $21 $21 $21 $21 $31 $00 $00
	.db $11 $01 $21 $21 $63 $63 $24 $21 $21 $21 $21 $21 $21 $34 $21 $21 $73 $63 $21 $21 $21 $21 $21 $21 $21 $31 $00 $00
	.db $11 $01 $21 $21 $54 $33 $53 $73 $73 $13 $21 $21 $21 $34 $73 $73 $63 $63 $73 $23 $33 $13 $21 $21 $21 $31 $00 $00
	.db $11 $01 $21 $21 $21 $43 $33 $21 $63 $63 $53 $73 $73 $23 $13 $24 $63 $63 $54 $33 $23 $03 $21 $21 $21 $31 $00 $00
	.db $11 $01 $21 $21 $21 $24 $34 $54 $63 $63 $63 $04 $54 $34 $13 $43 $54 $54 $33 $73 $63 $21 $21 $21 $21 $31 $00 $00
	.db $11 $01 $21 $21 $63 $03 $21 $21 $21 $53 $73 $73 $73 $73 $53 $24 $21 $21 $04 $33 $63 $73 $13 $21 $21 $31 $00 $00
	.db $11 $01 $21 $21 $33 $63 $54 $21 $21 $24 $14 $63 $53 $23 $24 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $31 $00 $00
	.db $11 $01 $21 $21 $21 $21 $21 $21 $21 $24 $34 $63 $63 $63 $53 $73 $21 $21 $21 $21 $21 $21 $21 $21 $21 $31 $00 $00
	.db $11 $01 $21 $21 $53 $73 $23 $21 $33 $63 $33 $63 $63 $21 $21 $21 $21 $63 $73 $21 $21 $21 $21 $21 $21 $31 $00 $00
	.db $11 $01 $21 $21 $34 $63 $63 $13 $21 $21 $21 $21 $21 $21 $21 $21 $21 $54 $54 $21 $21 $21 $21 $21 $21 $31 $00 $00
	.db $11 $01 $21 $21 $21 $04 $54 $03 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $31 $00 $00
	.db $11 $01 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $31 $00 $00
	.db $11 $01 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $31 $00 $00
	.db $11 $6c $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $85 $31 $00 $00
	.db $12 $22 $22 $22 $22 $22 $22 $22 $22 $22 $22 $22 $22 $22 $22 $22 $22 $22 $22 $22 $22 $22 $22 $22 $22 $32 $00 $00
	.db $51 $51 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00
	.db $51 $51 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00

staticLayout_22:
	dwbe $23c0
	.db $20 $02
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $00 $00 $00 $00 $0a $00 $00
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $00 $00 $00 $00 $00 $00 $00

staticLayout_invPasswordScreen:
	dwbe $2068
	.db $15 $18
	.db $10 $20 $20 $20 $20 $20 $20 $20 $20 $20 $20 $20 $20 $20 $20 $20 $20 $20 $30 $51 $51
	.db $11 $02 $72 $72 $72 $72 $72 $72 $72 $72 $72 $72 $72 $72 $72 $72 $72 $dc $31 $51 $51
	.db $11 $01 $21 $21 $21 $92 $f0 $b0 $b0 $21 $c2 $d2 $92 $92 $21 $21 $21 $21 $31 $00 $00
	.db $11 $01 $21 $21 $21 $e1 $f1 $b1 $b1 $21 $c3 $d3 $93 $e3 $21 $21 $21 $21 $31 $00 $00
	.db $11 $01 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $31 $00 $00
	.db $11 $01 $21 $21 $94 $a4 $b4 $c4 $d4 $b8 $a6 $b6 $c6 $d6 $e6 $f6 $21 $21 $31 $00 $00
	.db $11 $01 $21 $21 $95 $a5 $b5 $c5 $d5 $e5 $a7 $b7 $c7 $d7 $e7 $b7 $21 $21 $31 $00 $00
	.db $11 $01 $a8 $b8 $0e $1e $0e $1e $0e $1e $0e $1e $0e $1e $0e $1e $21 $21 $31 $00 $00
	.db $11 $01 $a9 $b9 $0f $1f $0f $1f $0f $1f $0f $1f $0f $1f $0f $1f $00 $21 $31 $00 $00
	.db $11 $01 $c8 $b6 $0e $1e $0e $1e $0e $1e $0e $1e $0e $1e $0e $1e $00 $21 $31 $00 $00
	.db $11 $01 $c9 $b7 $0f $1f $0f $1f $0f $1f $0f $1f $0f $1f $0f $1f $00 $21 $31 $00 $00
	.db $11 $01 $94 $f8 $0e $1e $0e $1e $0e $1e $0e $1e $0e $1e $0e $1e $00 $21 $31 $00 $00
	.db $11 $01 $e9 $f9 $0f $1f $0f $1f $0f $1f $0f $1f $0f $1f $0f $1f $00 $21 $31 $00 $00
	.db $11 $01 $84 $a4 $0e $1e $0e $1e $0e $1e $0e $1e $0e $1e $0e $1e $00 $21 $31 $00 $00
	.db $11 $01 $86 $a5 $0f $1f $0f $1f $0f $1f $0f $1f $0f $1f $0f $1f $00 $21 $31 $00 $00
	.db $11 $01 $c8 $f4 $0e $1e $0e $1e $0e $1e $0e $1e $0e $1e $0e $1e $00 $21 $31 $00 $00
	.db $11 $01 $c9 $f5 $0f $1f $0f $1f $0f $1f $0f $1f $0f $1f $0f $1f $00 $21 $31 $00 $00
	.db $11 $01 $84 $fb $0e $1e $0e $1e $0e $1e $0e $1e $0e $1e $0e $1e $00 $21 $31 $00 $00
	.db $11 $01 $86 $96 $0f $1f $0f $1f $0f $1f $0f $1f $0f $1f $0f $1f $00 $21 $31 $00 $00
	.db $11 $01 $21 $21 $21 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $21 $31 $00 $00
	.db $11 $6c $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $21 $85 $31 $00 $00
	.db $12 $22 $22 $22 $22 $22 $22 $22 $22 $22 $22 $22 $22 $22 $22 $22 $22 $22 $32 $00 $00
	.db $51 $51 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00
	.db $51 $51 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00

staticLayout_24:
	dwbe $23c0
	.db $20 $02
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $10 $00 $00 $00 $00 $00 $00
	.db $00 $20 $00 $00 $00 $00 $00 $00
	.db $00 $30 $00 $00 $00 $00 $00 $00
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $00 $00 $00 $00 $00 $00 $00

staticLayout_25:
	dwbe $20c0
	.db $06 $12
	.db $51 $51 $51 $51 $0c $1c
	.db $51 $51 $51 $51 $0d $1d
	.db $51 $51 $51 $51 $51 $51
	.db $51 $51 $51 $51 $51 $51
	.db $51 $51 $51 $51 $0c $1c
	.db $51 $51 $51 $51 $0d $1d
	.db $51 $51 $51 $51 $51 $51
	.db $51 $51 $51 $51 $51 $51
	.db $51 $51 $51 $51 $0c $1c
	.db $51 $51 $51 $51 $0d $1d
	.db $51 $51 $51 $51 $51 $51
	.db $51 $51 $51 $51 $51 $51
	.db $51 $51 $aa $ba $ca $da
	.db $51 $51 $ab $bb $cb $db
	.db $51 $51 $51 $51 $51 $51
	.db $51 $51 $51 $51 $51 $51
	.db $51 $05 $15 $25 $35 $64
	.db $51 $06 $16 $26 $36 $65

staticLayout_26:
	dwbe $21ad
	.db $08 $01
	.db $a4 $3f $5f $1e $77 $5f $a5 $5e

staticLayout_27:
	dwbe $21ed
	.db $03 $01
	.db $5e $5f $4e

staticLayout_28:
staticLayout_29:
	dwbe $0000
	.db $02 $02
	.db $fc $fc
	.db $fc $fc

staticLayout_2a:
	dwbe $0000
	.db $02 $01
	.db $fc $fc

staticLayout_2b:
	dwbe $0000
	.db $02 $02
	.db $ee $ef
	.db $ee $ef

staticLayout_2c:
	dwbe $0000
	.db $18 $01
	.db $f0 $f1 $f1 $f1 $f1 $f1 $f1 $f1 $f1 $f1 $f1 $f1 $f1 $f1 $f1 $f1 $f1 $f1 $f1 $f1 $f1 $f1 $f1 $f2

staticLayout_2d:
	dwbe $0000
	.db $18 $01
	.db $f3 $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $f3

staticLayout_2e:
	dwbe $0000
	.db $18 $01
	.db $f4 $f1 $f1 $f1 $f1 $f1 $f1 $f1 $f1 $f1 $f1 $f1 $f1 $f1 $f1 $f1 $f1 $f1 $f1 $f1 $f1 $f1 $f1 $f5

staticLayout_2f:
staticLayout_30:
	dwbe $0000
	.db $01 $01
	.db $ab

staticLayout_31:
	dwbe $0000
	.db $01 $01
	.db $fc

staticLayout_32:
staticLayout_33:
	dwbe $0000
	.db $06 $01
	.db $ff $ff $ff $ff $ff $ff

staticLayout_titleScreenUfouria:
	dwbe $2080
	.db $20 $0d
	.db $c8 $d8 $c8 $d8 $cc $c8 $c8 $d8 $c8 $d8 $c8 $d8 $cc $c8 $c8 $d8 $c8 $d8 $c8 $d8 $cc $c8 $c8 $d8 $c8 $d8 $c8 $d8 $cc $c8 $c8 $d8
	.db $c9 $d9 $c9 $d9 $e9 $c9 $c9 $d9 $c9 $d9 $c9 $d9 $e9 $c9 $c9 $d9 $c9 $d9 $c9 $d9 $e9 $c9 $c9 $d9 $c9 $d9 $c9 $d9 $e9 $c9 $c9 $d9
	.db $00 $00 $00 $10 $20 $20 $20 $30 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $00 $00 $95 $22 $22 $22 $40 $00 $00 $00 $00 $90 $a0 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $00 $00 $01 $11 $00 $31 $41 $00 $00 $00 $81 $91 $a1 $b1 $00 $00 $00 $06 $16 $26 $36 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $00 $00 $02 $12 $00 $32 $42 $00 $00 $72 $82 $92 $a2 $87 $97 $a7 $b7 $07 $17 $27 $37 $47 $00 $00 $00 $54 $64 $58 $00 $00 $00
	.db $00 $00 $00 $03 $13 $00 $33 $43 $50 $60 $73 $83 $93 $00 $88 $98 $a8 $b8 $08 $18 $28 $38 $52 $62 $00 $00 $55 $65 $59 $00 $00 $00
	.db $00 $00 $00 $04 $14 $24 $34 $44 $51 $61 $74 $84 $00 $00 $89 $99 $a9 $b9 $09 $19 $29 $39 $53 $63 $00 $00 $56 $66 $5a $49 $00 $00
	.db $00 $00 $00 $05 $15 $25 $35 $45 $00 $71 $75 $85 $00 $00 $8a $9a $aa $ba $0a $1a $2a $3a $00 $00 $00 $00 $57 $67 $5b $4a $00 $00
	.db $00 $00 $00 $00 $00 $96 $a6 $00 $70 $80 $76 $00 $00 $00 $8b $9b $ab $bb $0b $1b $2b $3b $4b $00 $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00
	.db $ca $da $ca $da $ea $ca $da $ca $da $ca $da $ca $ea $ca $da $ca $da $ca $da $ca $ea $ca $da $ca $da $ca $da $ca $ea $ca $da $da
	.db $cb $db $cb $db $cc $cb $db $cb $db $cb $db $cb $cc $cb $db $cb $db $cb $db $cb $cc $cb $db $cb $db $cb $db $cb $cc $cb $db $db

staticLayout_titleScreenNametable0Palettes:
	dwbe $23c0
	.db $20 $02
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $4a $5a $0a $1a $0a $0a $0a $0a
	.db $00 $00 $74 $11 $cc $7f $00 $00
	.db $a0 $a0 $a5 $a0 $ac $af $a0 $a0
	.db $0a $8a $aa $aa $aa $aa $2a $0a
	.db $00 $88 $aa $aa $aa $aa $22 $00
	.db $00 $08 $0a $0a $0a $0a $02 $00
	.db $00 $00 $00 $00 $00 $00 $00 $00

staticLayout_titleScreenCopyrightAndLicense:
	dwbe $22a0
	.db $20 $04
	.db $00 $00 $00 $00 $00 $00 $46 $b3 $b0 $b0 $b3 $00 $00 $0c $1c $2c $3c $4c $5c $0c $1c $6c $68 $78 $6a $7a $00 $00 $00 $00 $00 $00
	.db $00 $00 $00 $00 $00 $00 $48 $b4 $a3 $a3 $b4 $b5 $00 $0d $1d $2d $3d $4d $5d $0d $1d $6d $69 $79 $6b $7b $00 $00 $00 $00 $00 $00
	.db $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $00 $00 $00 $00 $00 $94 $77 $a4 $5e $5f $0e $5e $4e $00 $6f $4f $00 $5f $77 $5f $1e $5e $5f $4e $3f $00 $00 $00 $00 $00 $00

staticLayout_37:
	dwbe $0000
	.db $20 $01
	.db $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00

staticLayout_38:
	dwbe $226d
	.db $05 $01
	.db $0e $1e $2e $3e $1e

staticLayout_39:
	dwbe $21ca
	.db $0d $02
	.db $0c $1c $2c $3c $4c $5c $0c $1c $6c $68 $78 $6a $7a
	.db $0d $1d $2d $3d $4d $5d $0d $1d $6d $69 $79 $6b $7b

staticLayout_3a:
	dwbe $22ad
	.db $09 $01
	.db $0f $2e $1f $1f $00 $2f $3f $3e $4e

staticLayout_3b:
	dwbe $23e0
	.db $20 $01
	.db $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $aa $aa $20 $00 $00 $00 $00 $00 $0a $0a $02 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00

staticLayout_3c:
	dwbe $0000
	.db $02 $01
	.db $e0 $f0

staticLayout_3d:
	dwbe $0000
	.db $02 $01
	.db $e1 $f1

staticLayout_3e:
	dwbe $0000
	.db $02 $01
	.db $e2 $f2

staticLayout_3f:
	dwbe $0000
	.db $02 $01
	.db $e3 $f3

staticLayout_40:
	dwbe $20f0
	.db $04 $09
	.db $15 $50 $60 $70
	.db $fc $51 $61 $71
	.db $fc $51 $62 $72
	.db $fc $51 $62 $72
	.db $fc $51 $62 $72
	.db $fc $51 $62 $72
	.db $fc $51 $62 $72
	.db $fc $51 $62 $72
	.db $fc $53 $63 $73

staticLayout_41:
	dwbe $20ec
	.db $04 $09
	.db $20 $30 $40 $05
	.db $21 $31 $41 $fc
	.db $22 $32 $41 $fc
	.db $22 $32 $41 $fc
	.db $22 $32 $41 $fc
	.db $22 $32 $41 $fc
	.db $22 $32 $41 $fc
	.db $22 $32 $41 $fc
	.db $23 $33 $43 $fc

staticLayout_42:
	dwbe $20d1
	.db $03 $0a
	.db $04 $64 $74
	.db $05 $65 $75
	.db $fc $51 $34
	.db $fc $51 $35
	.db $fc $51 $35
	.db $fc $51 $35
	.db $fc $51 $35
	.db $fc $51 $35
	.db $fc $51 $35
	.db $fc $53 $36

staticLayout_43:
	dwbe $20cc
	.db $03 $0a
	.db $44 $54 $14
	.db $45 $55 $15
	.db $24 $41 $fc
	.db $25 $41 $fc
	.db $25 $41 $fc
	.db $25 $41 $fc
	.db $25 $41 $fc
	.db $25 $41 $fc
	.db $25 $41 $fc
	.db $26 $43 $fc

staticLayout_44:
	dwbe $20d2
	.db $02 $0a
	.db $14 $10
	.db $15 $11
	.db $fc $12
	.db $fc $12
	.db $fc $12
	.db $fc $12
	.db $fc $12
	.db $fc $12
	.db $fc $12
	.db $fc $13

staticLayout_45:
	dwbe $20cc
	.db $02 $0a
	.db $5a $04
	.db $01 $05
	.db $02 $fc
	.db $02 $fc
	.db $02 $fc
	.db $02 $fc
	.db $02 $fc
	.db $02 $fc
	.db $02 $fc
	.db $03 $fc

staticLayout_46:
	dwbe $20d3
	.db $02 $0a
	.db $14 $52
	.db $42 $39
	.db $29 $39
	.db $29 $39
	.db $29 $39
	.db $29 $39
	.db $29 $39
	.db $29 $39
	.db $29 $39
	.db $3c $79

staticLayout_47:
	dwbe $20cb
	.db $02 $0a
	.db $06 $04
	.db $67 $16
	.db $67 $77
	.db $67 $77
	.db $67 $77
	.db $67 $77
	.db $67 $77
	.db $67 $77
	.db $67 $77
	.db $68 $78

staticLayout_48:
	dwbe $24c8
	.db $08 $02
	.db $40 $50 $40 $50 $40 $50 $40 $50
	.db $41 $51 $41 $51 $41 $51 $41 $51

staticLayout_49:
staticLayout_4a:
	dwbe $2708
	.db $02 $02
	.db $2a $3a
	.db $2b $3b

staticLayout_4b:
	dwbe $0000
	.db $04 $03
	.db $a0 $b0 $c0 $d0
	.db $a1 $b1 $c1 $d1
	.db $fe $fe $fe $fe

staticLayout_4c:
	dwbe $0000
	.db $04 $03
	.db $a0 $c4 $d4 $e4
	.db $a1 $c5 $d5 $e5
	.db $fe $fe $fe $fe

staticLayout_4d:
	dwbe $0000
	.db $02 $02
	.db $10 $10
	.db $11 $11

staticLayout_4e:
	dwbe $0000
	.db $02 $03
	.db $a0 $b0
	.db $a1 $b1
	.db $fe $fe

staticLayout_4f:
	dwbe $2710
	.db $04 $01
	.db $fc $fc $fc $fc

staticLayout_50:
	dwbe $2548
	.db $08 $03
	.db $40 $50 $40 $50 $40 $50 $40 $50
	.db $41 $51 $41 $51 $41 $51 $41 $51
	.db $40 $50 $40 $50 $40 $50 $40 $50

staticLayout_51:
	dwbe $2508
	.db $08 $02
	.db $40 $50 $40 $50 $40 $50 $40 $50
	.db $41 $51 $41 $51 $41 $51 $41 $51

staticLayout_52:
	dwbe $27d2
	.db $02 $01
	.db $50 $50

staticLayout_53:
staticLayout_54:
staticLayout_55:
	dwbe $27c2
	.db $02 $01
	.db $05 $05

staticLayout_56:
	dwbe $27d2
	.db $02 $01
	.db $55 $55

staticLayout_57:
	dwbe $222f
	.db $0d $0e
	.db $00 $00 $00 $00 $00 $00 $c7 $d7 $00 $00 $00 $00 $00
	.db $00 $00 $dc $ec $00 $08 $c8 $d8 $e8 $00 $12 $10 $00
	.db $00 $00 $dd $ed $0d $09 $c9 $d9 $e9 $f9 $01 $11 $00
	.db $00 $00 $de $ee $0e $0a $ca $da $ea $fa $02 $00 $00
	.db $00 $00 $df $ef $0f $0b $cb $db $eb $fb $03 $00 $00
	.db $00 $00 $00 $30 $40 $50 $60 $70 $80 $90 $a0 $00 $00
	.db $00 $00 $21 $31 $41 $51 $61 $71 $81 $91 $a1 $00 $00
	.db $00 $00 $22 $32 $42 $52 $62 $72 $82 $92 $a2 $b2 $00
	.db $00 $00 $23 $33 $43 $53 $63 $73 $83 $93 $a3 $b3 $00
	.db $04 $14 $24 $34 $44 $54 $64 $74 $84 $94 $a4 $b4 $c4
	.db $05 $15 $25 $35 $45 $55 $65 $75 $85 $95 $a5 $b5 $c5
	.db $06 $16 $26 $36 $46 $56 $66 $76 $86 $96 $a6 $b6 $c6
	.db $00 $17 $27 $37 $47 $57 $67 $77 $87 $97 $a7 $b7 $00

staticLayout_58:
	dwbe $23c0
	.db $20 $02
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $00 $00 $00 $a0 $aa $a0 $00
	.db $00 $00 $00 $00 $0a $0a $0a $00
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $00 $00 $00 $00 $00 $00 $00

staticLayout_59:
	dwbe $2810
	.db $0c $08
	.db $00 $28 $38 $48 $58 $68 $78 $88 $98 $a8 $b8 $00
	.db $00 $29 $39 $49 $59 $69 $79 $89 $99 $a9 $00 $00
	.db $00 $2a $3a $4a $5a $6a $7a $8a $9a $aa $00 $00
	.db $00 $2b $3b $4b $5b $6b $7b $8b $9b $ab $00 $00
	.db $1c $2c $3c $4c $5c $6c $7c $8c $9c $ac $bc $00
	.db $1d $2d $3d $4d $5d $6d $7d $8d $9d $ad $bd $cd
	.db $1e $2e $3e $4e $5e $6e $7e $8e $9e $ae $be $ce
	.db $00 $00 $3f $4f $5f $00 $00 $00 $00 $00 $00 $00

staticLayout_5a:
	dwbe $2b00
	.db $20 $08
	.db $e4 $f4 $e4 $f4 $1f $2f $d4 $f4 $e4 $f4 $e4 $f4 $e4 $f4 $1f $2f $d4 $f4 $e4 $f4 $e4 $f4 $e4 $f4 $1f $2f $d4 $f4 $e4 $f4 $e4 $f4
	.db $e7 $f7 $e5 $f5 $6f $7f $d5 $f5 $e7 $f7 $e7 $f7 $e5 $f5 $6f $7f $d5 $f5 $e7 $f7 $e7 $f7 $e5 $f5 $6f $7f $d5 $f5 $e7 $f7 $e7 $f7
	.db $e0 $f0 $d0 $e0 $1f $2f $c0 $e0 $f0 $d0 $e0 $f0 $d0 $e0 $1f $2f $c0 $e0 $f0 $d0 $e0 $f0 $d0 $e0 $1f $2f $c0 $e0 $f0 $d0 $e0 $f0
	.db $f6 $f1 $d1 $e1 $1f $2f $c1 $e1 $f1 $e6 $f6 $f1 $d1 $e1 $1f $2f $c1 $e1 $f1 $e6 $f6 $f1 $d1 $e1 $1f $2f $c1 $e1 $f1 $e6 $f6 $f1
	.db $e2 $f2 $d2 $e2 $1f $2f $c2 $e2 $f2 $d2 $e2 $f2 $d2 $e2 $1f $2f $c2 $e2 $f2 $d2 $e2 $f2 $d2 $e2 $1f $2f $c2 $e2 $f2 $d2 $e2 $f2
	.db $e3 $f3 $d3 $e3 $1f $2f $d3 $e3 $f3 $d3 $e3 $f3 $d3 $e3 $1f $2f $d3 $e3 $f3 $d3 $e3 $f3 $d3 $e3 $1f $2f $d3 $e3 $f3 $d3 $e3 $f3
	.db $00 $00 $00 $00 $a0 $a0 $a0 $00 $00 $00 $00 $00 $aa $aa $aa $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $5f $7f $5f $df $5f $5f $7f $5f $05 $07 $05 $0d $05 $05 $07 $05

staticLayout_5b:
	dwbe $2286
	.db $16 $08
	.db $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc
	.db $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc
	.db $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc
	.db $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc
	.db $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc
	.db $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc
	.db $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc
	.db $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc $fc

staticLayout_5c:
	dwbe $228e
	.db $0f $05
	.db $c5 $d5 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00
	.db $34 $76 $78 $8d $00 $00 $00 $00 $02 $04 $06 $00 $00 $b0 $b9
	.db $35 $77 $79 $8e $fa $38 $48 $00 $03 $05 $07 $64 $74 $b1 $b6
	.db $7a $7c $7f $8f $fb $39 $49 $00 $0c $0e $01 $65 $75 $e0 $f0
	.db $7b $7d $00 $8a $eb $00 $00 $00 $0d $0f $00 $00 $00 $00 $00

staticLayout_5d:
	dwbe $24c4
	.db $18 $0a
	.db $ae $be $be $be $be $be $be $be $be $be $be $be $be $be $be $be $be $be $c0 $d0 $be $be $be $af
	.db $9e $7e $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $c1 $d1 $e1 $f1 $7e $ce
	.db $9e $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $c2 $d2 $e2 $f2 $fe $ce
	.db $9e $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $c3 $d3 $e3 $f3 $fe $ce
	.db $9e $fe $fe $86 $96 $a6 $fe $c6 $d6 $fe $9a $aa $fe $fe $fe $fe $fe $fe $c4 $d4 $fe $fe $fe $ce
	.db $9e $fe $fe $87 $97 $a7 $b7 $c7 $d7 $8b $9b $ab $fe $fe $fe $fe $fe $fe $e4 $f4 $fe $fe $fe $ce
	.db $9e $fe $fe $88 $98 $a8 $b8 $c8 $d8 $8c $9c $ac $fe $fe $fe $fe $fe $fe $e5 $f5 $fe $fe $fe $ce
	.db $9e $fe $fe $89 $99 $a9 $fe $c9 $d9 $fe $9d $ad $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $ce
	.db $9e $7e $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $7e $ce
	.db $9f $bf $bf $bf $bf $bf $bf $bf $bf $bf $bf $bf $bf $bf $bf $bf $bf $bf $bf $bf $bf $bf $bf $cf

staticLayout_5e:
	dwbe $27c0
	.db $20 $01
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $00 $00 $00 $00 $c0 $30 $00
	.db $00 $00 $60 $10 $00 $cc $03 $00
	.db $00 $08 $02 $00 $00 $00 $00 $00

staticLayout_5f:
	dwbe $20c4
	.db $18 $0a
	.db $2e $3e $3e $3e $3e $3e $3e $3e $3e $3e $3e $3e $3e $3e $3e $3e $3e $3e $14 $24 $3e $3e $3e $2f
	.db $1e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $15 $25 $7e $7e $7e $4e
	.db $1e $7e $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $7e $4e
	.db $1e $7e $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $7e $4e
	.db $1e $7e $fe $fe $10 $20 $fe $30 $40 $fe $44 $54 $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $7e $4e
	.db $1e $7e $fe $fe $11 $21 $fe $31 $41 $fe $45 $55 $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $7e $4e
	.db $1e $7e $fe $fe $12 $22 $fe $32 $42 $36 $46 $56 $66 $fe $fe $fe $fe $fe $fe $fe $fe $fe $7e $4e
	.db $1e $7e $fe $fe $13 $23 $fe $33 $43 $fe $47 $57 $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $7e $4e
	.db $1e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $4e
	.db $1f $3f $3f $3f $3f $3f $3f $3f $3f $3f $3f $3f $3f $3f $3f $3f $3f $3f $3f $3f $3f $3f $3f $4f

staticLayout_60:
	dwbe $23c0
	.db $20 $01
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $00 $00 $00 $00 $c0 $00 $00
	.db $00 $00 $60 $10 $00 $00 $00 $00
	.db $00 $00 $0a $02 $00 $00 $00 $00

staticLayout_61:
	dwbe $24c4
	.db $18 $0a
	.db $ae $be $be $be $be $be $be $be $be $be $ba $ca $da $be $be $be $be $be $be $be $be $be $be $af
	.db $9e $7e $fe $fe $fe $fe $fe $fe $fe $fe $bb $cb $db $fe $fe $fe $fe $fe $fe $fe $fe $fe $7e $ce
	.db $80 $90 $a0 $fe $fe $fe $fe $fe $fe $fe $bc $cc $b2 $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $ce
	.db $81 $91 $a1 $fe $fe $fe $fe $fe $fe $fe $bd $cd $b3 $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $ce
	.db $82 $92 $a2 $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $e6 $f6 $fe $fe $fe $ce
	.db $83 $93 $a3 $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $e7 $f7 $fe $fe $fe $ce
	.db $9e $fe $fe $fe $84 $94 $a4 $b4 $fe $fe $fe $fe $fe $fe $fe $fe $fe $ea $e8 $f8 $fe $fe $fe $ce
	.db $9e $fe $fe $fe $85 $95 $a5 $b5 $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $e9 $f9 $fe $fe $fe $ce
	.db $9e $7e $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $7e $ce
	.db $9f $bf $bf $bf $bf $bf $bf $bf $bf $bf $bf $bf $bf $bf $bf $bf $bf $bf $bf $bf $bf $bf $bf $cf

staticLayout_62:
	dwbe $27c0
	.db $20 $02
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $00 $00 $40 $00 $00 $00 $00
	.db $00 $aa $00 $00 $00 $c0 $00 $00
	.db $00 $00 $00 $00 $00 $0c $00 $00
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $55 $55 $55 $55 $55 $55 $55 $55
	.db $55 $55 $55 $55 $55 $55 $55 $55
	.db $55 $55 $55 $55 $55 $55 $55 $55

staticLayout_titleScreenCutsceneBopBox:
	dwbe $20c4
	.db $18 $0a
	.db $2e $3e $3e $3e $3e $3e $3e $3e $3e $3e $3e $3e $3e $3e $3e $3e $3e $3e $3e $3e $3e $3e $3e $2f
	.db $1e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $4e
	.db $1e $7e $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $7e $4e
	.db $1e $7e $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $fe $7e $4e
	.db $1e $7e $fe $fe $fe $fe $fe $fe $fe $fe $50 $60 $70 $fe $fe $fe $fe $fe $fe $fe $fe $fe $7e $4e
	.db $1e $7e $fe $fe $fe $fe $fe $fe $fe $fe $51 $61 $71 $fe $fe $fe $fe $fe $fe $fe $fe $fe $7e $4e
	.db $1e $7e $fe $fe $fe $fe $fe $fe $fe $fe $52 $62 $72 $fe $fe $fe $fe $fe $fe $fe $fe $fe $7e $4e
	.db $1e $7e $fe $fe $fe $fe $fe $fe $fe $fe $53 $63 $73 $fe $fe $fe $fe $fe $fe $fe $fe $fe $7e $4e
	.db $1e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $4e
	.db $1f $3f $3f $3f $3f $3f $3f $3f $3f $3f $3f $3f $3f $3f $3f $3f $3f $3f $3f $3f $3f $3f $3f $4f

staticLayout_titleScreenCutsceneNametable0Palettes:
	dwbe $23c0
	.db $20 $02
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $00 $00 $c0 $30 $00 $00 $00
	.db $00 $00 $00 $0c $03 $00 $00 $00
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $55 $55 $55 $55 $55 $55 $55 $55
	.db $55 $55 $55 $55 $55 $55 $55 $55
	.db $55 $55 $55 $55 $55 $55 $55 $55

staticLayout_titleScreenCutscene:
	dwbe $2480
	.db $20 $0e
	.db $5c $6c $5c $6c $5c $6c $5c $6c $5c $6c $5c $6c $5c $6c $5c $6c $5c $6c $5c $6c $5c $6c $5c $6c $5c $6c $5c $6c $5c $6c $5c $6c
	.db $5d $6d $5d $6d $5d $6d $5d $6d $5d $6d $5d $6d $5d $6d $5d $6d $5d $6d $5d $6d $5d $6d $5d $6d $5d $6d $5d $6d $5d $6d $5d $6d
	.db $7e $7e $7e $7e $2e $3e $3e $3e $3e $3e $3e $3e $3e $3e $3e $3e $3e $3e $3e $3e $3e $3e $3e $3e $3e $3e $3e $2f $7e $7e $7e $7e
	.db $7e $7e $7e $7e $1e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $4e $7e $7e $7e $7e
	.db $7e $7e $7e $7e $1e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $4e $7e $7e $7e $7e
	.db $7e $7e $7e $7e $1e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $4e $7e $7e $7e $7e
	.db $7e $7e $7e $7e $1e $7e $7e $7e $16 $26 $0a $1a $2a $7e $58 $68 $7e $7e $7e $7e $7e $7e $3a $4a $7e $7e $7e $4e $7e $7e $7e $7e
	.db $7e $7e $7e $7e $1e $7e $7e $7e $17 $27 $0b $1b $2b $7e $59 $69 $7e $7e $7e $7e $7e $7e $3b $4b $7e $7e $7e $4e $7e $7e $7e $7e
	.db $7e $7e $7e $7e $1e $7e $7e $08 $18 $28 $7e $1c $2c $7e $5a $6a $7e $7e $7e $7e $7e $7e $3c $4c $7e $7e $7e $4e $7e $7e $7e $7e
	.db $7e $7e $7e $7e $1e $7e $7e $09 $19 $29 $7e $1d $2d $7e $5b $6b $7e $7e $7e $7e $7e $7e $3d $4d $7e $7e $7e $4e $7e $7e $7e $7e
	.db $7e $7e $7e $7e $1e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $7e $4e $7e $7e $7e $7e
	.db $7e $7e $7e $7e $1f $3f $3f $3f $3f $3f $3f $3f $3f $3f $3f $3f $3f $3f $3f $3f $3f $3f $3f $3f $3f $3f $3f $4f $7e $7e $7e $7e
	.db $5e $6e $5e $6e $5e $6e $5e $6e $5e $6e $5e $6e $5e $6e $5e $6e $5e $6e $5e $6e $5e $6e $5e $6e $5e $6e $5e $6e $5e $6e $5e $6e
	.db $5f $6f $5f $6f $5f $6f $5f $6f $5f $6f $5f $6f $5f $6f $5f $6f $5f $6f $5f $6f $5f $6f $5f $6f $5f $6f $5f $6f $5f $6f $5f $6f

staticLayout_66:
	dwbe $27c0
	.db $20 $02
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $00 $60 $10 $00 $c0 $00 $00
	.db $00 $08 $02 $00 $00 $0c $00 $00
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $00 $00 $00 $00 $00 $00 $00

staticLayout_67:
	dwbe $2bc0
	.db $20 $01
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $00 $00 $0f $03 $00 $00 $00
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $40 $a0 $a0 $00 $00 $00 $00

staticLayout_68:
	dwbe $23c0
	.db $20 $01
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $40 $a0 $a0 $20 $00 $00 $00
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $00 $00 $00 $00 $00 $00 $00

staticLayout_69:
	dwbe $2bc0
	.db $20 $01
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $40 $a0 $a0 $a0 $a0 $00 $00
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $00 $00 $00 $00 $00 $00 $00

staticLayout_6a:
	dwbe $23c0
	.db $20 $01
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $40 $a0 $a0 $a0 $00 $00 $00
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $00 $00 $00 $00 $00 $00 $00

staticLayout_6b:
	dwbe $2bc0
	.db $20 $01
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $40 $a0 $a0 $a0 $a0 $20 $00
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $00 $00 $00 $00 $00 $00 $00

staticLayout_6c:
	dwbe $23c0
	.db $20 $01
	.db $00 $40 $a0 $a0 $a0 $20 $00 $00
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $00 $00 $00 $00 $00 $00 $00

staticLayout_6d:
	dwbe $2bc0
	.db $20 $01
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $00 $00 $00 $00 $00 $00 $00

staticLayout_6e:
	dwbe $23c0
	.db $20 $01
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $04 $0a $0a $00 $00 $00 $00
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $00 $00 $00 $00 $00 $00 $00

staticLayout_6f:
	dwbe $2bc0
	.db $20 $01
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $40 $a0 $a0 $a0 $20 $00 $00

staticLayout_70:
	dwbe $23c0
	.db $20 $01
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $00 $00 $00 $00 $00 $00 $00
	.db $00 $00 $00 $00 $00 $00 $00 $00


B6_1cd5:	.db $0c
B6_1cd6:		ora $021c		; 0d 1c 02
B6_1cd9:	.db $0c
B6_1cda:	.db $0c
B6_1cdb:		jsr $0c02		; 20 02 0c
B6_1cde:	.db $0c
B6_1cdf:	.db $1c
B6_1ce0:	.db $02
B6_1ce1:	.db $0c
B6_1ce2:		ora $1c			; 05 1c
B6_1ce4:	.db $02
B6_1ce5:	.db $0c
B6_1ce6:		ora $20			; 05 20
B6_1ce8:	.db $02
B6_1ce9:	.db $0c
B6_1cea:	.db $0c
B6_1ceb:		jsr $0c02		; 20 02 0c
B6_1cee:	.db $0c
B6_1cef:	.db $1c
B6_1cf0:	.db $02
B6_1cf1:	.db $0c
B6_1cf2:	.db $0c
B6_1cf3:	.db $fb
B6_1cf4:	.db $87
B6_1cf5:	.db $9c
B6_1cf6:		jsr $0a02		; 20 02 0a
B6_1cf9:		ora $0d0a		; 0d 0a 0d
B6_1cfc:	.db $1c
B6_1cfd:	.db $02
B6_1cfe:		asl a			; 0a
B6_1cff:	.db $0c
B6_1d00:		jsr $0a02		; 20 02 0a
B6_1d03:		ora $070a		; 0d 0a 07
B6_1d06:		asl $06, x		; 16 06
B6_1d08:		jsr $0a02		; 20 02 0a
B6_1d0b:	.db $0c
B6_1d0c:	.db $1c
B6_1d0d:	.db $02
B6_1d0e:		asl a			; 0a
B6_1d0f:		ora $1c			; 05 1c
B6_1d11:	.db $02
B6_1d12:		asl a			; 0a
B6_1d13:		ora $20			; 05 20
B6_1d15:	.db $02
B6_1d16:		asl a			; 0a
B6_1d17:	.db $0c
B6_1d18:		jsr $0a02		; 20 02 0a
B6_1d1b:		ora $0d0a		; 0d 0a 0d
B6_1d1e:	.db $1c
B6_1d1f:	.db $02
B6_1d20:		asl a			; 0a
B6_1d21:	.db $0c
B6_1d22:		jsr $0a02		; 20 02 0a
B6_1d25:		ora $0d0a		; 0d 0a 0d
B6_1d28:		jsr $0a02		; 20 02 0a
B6_1d2b:	.db $0c
B6_1d2c:		inc $07, x		; f6 07
B6_1d2e:		ora $1e1d, x	; 1d 1d 1e
B6_1d31:		asl $1cf7, x	; 1e f7 1c
B6_1d34:	.db $02
B6_1d35:	.db $0c
B6_1d36:	.db $1a
B6_1d37:	.db $1c
B6_1d38:	.db $02
B6_1d39:	.db $0c
B6_1d3a:	.db $1a
B6_1d3b:	.db $1c
B6_1d3c:	.db $02
B6_1d3d:	.db $0c
B6_1d3e:	.db $0c
B6_1d3f:	.db $1c
B6_1d40:	.db $02
B6_1d41:		sbc ($05), y	; f1 05
B6_1d43:	.db $1c
B6_1d44:	.db $02
B6_1d45:		sbc ($05), y	; f1 05
B6_1d47:	.db $1c
B6_1d48:	.db $02
B6_1d49:	.db $0c
B6_1d4a:		ora $1c			; 05 1c
B6_1d4c:	.db $02
B6_1d4d:	.db $0c
B6_1d4e:	.db $13
B6_1d4f:		inc $3305, x	; fe 05 33
B6_1d52:		sta $021c, x	; 9d 1c 02
B6_1d55:		asl a			; 0a
B6_1d56:	.db $1a
B6_1d57:	.db $1c
B6_1d58:	.db $02
B6_1d59:		asl a			; 0a
B6_1d5a:	.db $1a
B6_1d5b:	.db $1c
B6_1d5c:	.db $02
B6_1d5d:		asl a			; 0a
B6_1d5e:	.db $0c
B6_1d5f:	.db $1c
B6_1d60:	.db $02
B6_1d61:		sbc ($05), y	; f1 05
B6_1d63:	.db $1c
B6_1d64:	.db $02
B6_1d65:		sbc ($05), y	; f1 05
B6_1d67:	.db $1c
B6_1d68:	.db $02
B6_1d69:		asl a			; 0a
B6_1d6a:		ora $1c			; 05 1c
B6_1d6c:	.db $02
B6_1d6d:		asl a			; 0a
B6_1d6e:	.db $13
B6_1d6f:		inc $5301, x	; fe 01 53
B6_1d72:		sta $06f0, x	; 9d f0 06
B6_1d75:	.db $72
B6_1d76:	.db $73
B6_1d77:	.db $74
B6_1d78:		.db $00				; 00
B6_1d79:	.db $80
B6_1d7a:		adc ($72), y	; 71 72
B6_1d7c:		.db $00				; 00
B6_1d7d:		stx $06			; 86 06
B6_1d7f:	.db $73
B6_1d80:	.db $74
B6_1d81:		ror $00, x		; 76 00
B6_1d83:	.db $80
B6_1d84:		adc ($73), y	; 71 73
B6_1d86:		.db $00				; 00
B6_1d87:		stx $06			; 86 06
B6_1d89:		ror $77, x		; 76 77
B6_1d8b:		adc $8000, y	; 79 00 80
B6_1d8e:		adc ($74), y	; 71 74
B6_1d90:		.db $00				; 00
B6_1d91:		stx $06			; 86 06
B6_1d93:	.db $7a
B6_1d94:	.db $7b
B6_1d95:	.db $7c
B6_1d96:		.db $00				; 00
B6_1d97:	.db $80
B6_1d98:		adc ($75), y	; 71 75
B6_1d9a:		.db $00				; 00
B6_1d9b:		stx $0b			; 86 0b
B6_1d9d:		and $393c, x	; 3d 3c 39
B6_1da0:	.db $3a
B6_1da1:	.db $3b
B6_1da2:	.db $3c
B6_1da3:	.db $3d $3d $00
B6_1da6:	.db $80
B6_1da7:		and ($37), y	; 31 37
B6_1da9:		sec				; 38 
B6_1daa:		.db $00				; 00
B6_1dab:	.db $80
B6_1dac:		asl a			; 0a
B6_1dad:		ror $75, x		; 76 75
B6_1daf:		ror $77, x		; 76 77
B6_1db1:	.db $77
B6_1db2:	.db $77
B6_1db3:		ror $00, x		; 76 00
B6_1db5:	.db $80
B6_1db6:		adc ($73), y	; 71 73
B6_1db8:		.db $00				; 00
B6_1db9:	.db $80
B6_1dba:	.db $13
B6_1dbb:	.db $72
B6_1dbc:	.db $72
B6_1dbd:	.db $72
B6_1dbe:	.db $73
B6_1dbf:	.db $73
B6_1dc0:	.db $73
B6_1dc1:	.db $74
B6_1dc2:	.db $74
B6_1dc3:	.db $74
B6_1dc4:		adc $75, x		; 75 75
B6_1dc6:		adc $74, x		; 75 74
B6_1dc8:	.db $74
B6_1dc9:	.db $74
B6_1dca:	.db $74
B6_1dcb:		.db $00				; 00
B6_1dcc:	.db $80
B6_1dcd:		adc ($73), y	; 71 73
B6_1dcf:		.db $00				; 00
B6_1dd0:	.db $80
B6_1dd1:		asl $38			; 06 38
B6_1dd3:	.db $39 $3b $00
B6_1dd6:	.db $80
B6_1dd7:		and ($34), y	; 31 34
B6_1dd9:		and $00, x		; 35 00
B6_1ddb:		stx $00			; 86 00
B6_1ddd:		ldx $b6b7, y	; be b7 b6
B6_1de0:		lda $b4, x		; b5 b4
B6_1de2:		ldy $b4, x		; b4 b4
B6_1de4:		ldy $b1, x		; b4 b1
B6_1de6:		ldy $00, x		; b4 00
B6_1de8:		cpy #$00		; c0 00
B6_1dea:		lda $b3, x		; b5 b3
B6_1dec:	.db $b3
B6_1ded:	.db $b3
B6_1dee:	.db $b3
B6_1def:	.db $b3
B6_1df0:	.db $b3
B6_1df1:	.db $b3
B6_1df2:		lda ($b2), y	; b1 b2
B6_1df4:		.db $00				; 00
B6_1df5:		bne B6_1df7 ; d0 00

B6_1df7:		.db $00				; 00
B6_1df8:		asl a			; 0a
B6_1df9:	.db $9e
B6_1dfa:		ora ($01, x)	; 01 01
B6_1dfc:	.db $a3
B6_1dfd:	.db $9e
B6_1dfe:	.db $02
B6_1dff:	.db $02
B6_1e00:		cmp $039e, x	; dd 9e 03
B6_1e03:	.db $03
B6_1e04:		;removed
	.db $30 $9f

B6_1e06:		php				; 08 
B6_1e07:		and ($9f), y	; 31 9f
B6_1e09:	.db $ff
B6_1e0a:		nop				; ea 
B6_1e0b:	.db $32
B6_1e0c:	.db $9f
B6_1e0d:	.db $ef
B6_1e0e:		inc $16, x		; f6 16
B6_1e10:		rol a			; 2a
B6_1e11:		and ($2d, x)	; 21 2d
B6_1e13:		and ($28, x)	; 21 28
B6_1e15:		and ($2d, x)	; 21 2d
B6_1e17:		and ($26, x)	; 21 26
B6_1e19:		inc $0b, x		; f6 0b
B6_1e1b:	.db $23
B6_1e1c:		and $f6			; 25 f6
B6_1e1e:		asl $26, x		; 16 26
B6_1e20:		plp				; 28 
B6_1e21:		and ($f7, x)	; 21 f7
B6_1e23:	.db $fa
B6_1e24:		nop				; ea 
B6_1e25:		jmp $1c9f		; 4c 9f 1c


B6_1e28:	.db $0b
B6_1e29:		asl $1f0b, x	; 1e 0b 1f
B6_1e2c:		asl $21, x		; 16 21
B6_1e2e:		asl $fa, x		; 16 fa
B6_1e30:		nop				; ea 
B6_1e31:	.db $32
B6_1e32:	.db $9f
B6_1e33:		inc $16, x		; f6 16
B6_1e35:	.db $23
B6_1e36:	.db $1f
B6_1e37:		and $1f			; 25 1f
B6_1e39:		rol $21			; 26 21
B6_1e3b:		plp				; 28 
B6_1e3c:		and ($2a, x)	; 21 2a
B6_1e3e:		inc $0b, x		; f6 0b
B6_1e40:		plp				; 28 
B6_1e41:		rol a			; 2a
B6_1e42:	.db $2b
B6_1e43:		rol a			; 2a
B6_1e44:		plp				; 28 
B6_1e45:		rol $fa			; 26 fa
B6_1e47:		inc $2c, x		; f6 2c
B6_1e49:		rol a			; 2a
B6_1e4a:		plp				; 28 
B6_1e4b:	.db $f7
B6_1e4c:	.db $fb
B6_1e4d:		asl a			; 0a
B6_1e4e:	.db $9e
B6_1e4f:	.db $fb
B6_1e50:		bit $9e			; 24 9e
B6_1e52:		nop				; ea 
B6_1e53:	.db $32
B6_1e54:	.db $9f
B6_1e55:		inc $16, x		; f6 16
B6_1e57:	.db $23
B6_1e58:	.db $1f
B6_1e59:		and $1f			; 25 1f
B6_1e5b:		rol $2d			; 26 2d
B6_1e5d:	.db $2b
B6_1e5e:		rol a			; 2a
B6_1e5f:		plp				; 28 
B6_1e60:		inc $0b, x		; f6 0b
B6_1e62:		rol $25			; 26 25
B6_1e64:	.db $23
B6_1e65:		and $23			; 25 23
B6_1e67:		and $f7			; 25 f7
B6_1e69:		rol $58			; 26 58
B6_1e6b:		inc $0b, x		; f6 0b
B6_1e6d:		sbc $1d04		; ed04 1d
B6_1e70:	.db $1f
B6_1e71:		and ($22, x)	; 21 22
B6_1e73:		bit $26			; 24 26
B6_1e75:	.db $27
B6_1e76:	.db $f7
B6_1e77:		and #$42		; 29 42
B6_1e79:	.db $27
B6_1e7a:		asl $26, x		; 16 26
B6_1e7c:	.db $42
B6_1e7d:		bit $16			; 24 16
B6_1e7f:		bit $16			; 24 16
B6_1e81:	.db $22
B6_1e82:		asl $1d, x		; 16 1d
B6_1e84:		bit $0bf6		; 2c f6 0b
B6_1e87:		sbc $1f08		; ed08 1f
B6_1e8a:		and ($22, x)	; 21 22
B6_1e8c:		bit $26			; 24 26
B6_1e8e:	.db $27
B6_1e8f:		and #$f7		; 29 f7
B6_1e91:	.db $2b
B6_1e92:	.db $42
B6_1e93:		inc $16, x		; f6 16
B6_1e95:		and #$29		; 29 29
B6_1e97:	.db $27
B6_1e98:		rol $24			; 26 24
B6_1e9a:	.db $f7
B6_1e9b:		bit $42			; 24 42
B6_1e9d:	.db $22
B6_1e9e:		ror $fcfa		; 6e fa fc
B6_1ea1:		asl a			; 0a
B6_1ea2:	.db $9e
B6_1ea3:		sbc ($0b), y	; f1 0b
B6_1ea5:		sed				; f8 
B6_1ea6:		sta ($ea, x)	; 81 ea
B6_1ea8:	.db $3f
B6_1ea9:	.db $9f
B6_1eaa:	.db $fb
B6_1eab:		ora $ea9e		; 0d 9e ea
B6_1eae:		eor $fb9f, y	; 59 9f fb
B6_1eb1:	.db $27
B6_1eb2:	.db $9e
B6_1eb3:		nop				; ea 
B6_1eb4:	.db $3f
B6_1eb5:	.db $9f
B6_1eb6:	.db $fb
B6_1eb7:	.db $33
B6_1eb8:	.db $9e
B6_1eb9:		nop				; ea 
B6_1eba:		jmp $1e9f		; 4c 9f 1e


B6_1ebd:	.db $1f
B6_1ebe:		and ($23, x)	; 21 23
B6_1ec0:		and $26			; 25 26
B6_1ec2:		plp				; 28 
B6_1ec3:		nop				; ea 
B6_1ec4:		eor $289f, y	; 59 9f 28
B6_1ec7:	.db $f7
B6_1ec8:		nop				; ea 
B6_1ec9:	.db $3f
B6_1eca:	.db $9f
B6_1ecb:	.db $fb
B6_1ecc:		ora $ea9e		; 0d 9e ea
B6_1ecf:		eor $fb9f, y	; 59 9f fb
B6_1ed2:	.db $27
B6_1ed3:	.db $9e
B6_1ed4:		nop				; ea 
B6_1ed5:	.db $3f
B6_1ed6:	.db $9f
B6_1ed7:	.db $fb
B6_1ed8:		eor $9e, x		; 55 9e
B6_1eda:	.db $fc
B6_1edb:	.db $a7
B6_1edc:	.db $9e
B6_1edd:		cpx $26ff		; ec ff 26
B6_1ee0:		cli				; 58 
B6_1ee1:		and $58			; 25 58
B6_1ee3:	.db $23
B6_1ee4:		bit $2c20		; 2c 20 2c
B6_1ee7:		and ($58, x)	; 21 58
B6_1ee9:		inc $2c, x		; f6 2c
B6_1eeb:	.db $1f
B6_1eec:	.db $1c
B6_1eed:		asl $19fa, x	; 1e fa 19
B6_1ef0:	.db $1a
B6_1ef1:	.db $17
B6_1ef2:		inc $16, x		; f6 16
B6_1ef4:		ora $21, x		; 15 21
B6_1ef6:	.db $1f
B6_1ef7:	.db $1c
B6_1ef8:	.db $f7
B6_1ef9:	.db $fb
B6_1efa:	.db $df
B6_1efb:	.db $9e
B6_1efc:	.db $23
B6_1efd:	.db $1f
B6_1efe:		and ($f7, x)	; 21 f7
B6_1f00:		rol $16			; 26 16
B6_1f02:		and ($16, x)	; 21 16
B6_1f04:	.db $1a
B6_1f05:		bit $16f6		; 2c f6 16
B6_1f08:		asl $1d, x		; 16 1d
B6_1f0a:		rol $1d			; 26 1d
B6_1f0c:		asl $1f, x		; 16 1f
B6_1f0e:	.db $27
B6_1f0f:	.db $1f
B6_1f10:		asl $1e, x		; 16 1e
B6_1f12:	.db $27
B6_1f13:		asl $1d16, x	; 1e 16 1d
B6_1f16:		rol $1d			; 26 1d
B6_1f18:	.db $1b
B6_1f19:	.db $22
B6_1f1a:	.db $2b
B6_1f1b:	.db $22
B6_1f1c:	.db $1a
B6_1f1d:	.db $23
B6_1f1e:	.db $2b
B6_1f1f:	.db $23
B6_1f20:	.db $f7
B6_1f21:		clc				; 18 
B6_1f22:		bit $2c1d		; 2c 1d 2c
B6_1f25:	.db $22
B6_1f26:		ora $251d, x	; 1d 1d 25
B6_1f29:		asl $4d, x		; 16 4d
B6_1f2b:		sbc ($21), y	; f1 21
B6_1f2d:	.db $fc
B6_1f2e:	.db $df
B6_1f2f:	.db $9e
B6_1f30:		beq B6_1f22 ; f0 f0

B6_1f32:		.db $00				; 00
B6_1f33:		ldx $b5b6, y	; be b6 b5
B6_1f36:		ldy $b3, x		; b4 b3
B6_1f38:	.db $b3
B6_1f39:	.db $b3
B6_1f3a:	.db $b3
B6_1f3b:		lda ($b3), y	; b1 b3
B6_1f3d:		.db $00				; 00
B6_1f3e:		cpy #$00		; c0 00
B6_1f40:		lda $b3, x		; b5 b3
B6_1f42:	.db $b3
B6_1f43:	.db $b3
B6_1f44:	.db $b3
B6_1f45:	.db $b3
B6_1f46:	.db $b3
B6_1f47:	.db $b3
B6_1f48:		lda ($b2), y	; b1 b2
B6_1f4a:		.db $00				; 00
B6_1f4b:		bne B6_1f4d ; d0 00

B6_1f4d:		ror $7475, x	; 7e 75 74
B6_1f50:	.db $74
B6_1f51:	.db $73
B6_1f52:	.db $73
B6_1f53:	.db $73
B6_1f54:	.db $73
B6_1f55:		adc ($73), y	; 71 73
B6_1f57:		.db $00				; 00
B6_1f58:		cpy #$00		; c0 00
B6_1f5a:		adc $73, x		; 75 73
B6_1f5c:	.db $73
B6_1f5d:	.db $73
B6_1f5e:	.db $73
B6_1f5f:	.db $73
B6_1f60:	.db $73
B6_1f61:	.db $73
B6_1f62:		adc ($72), y	; 71 72
B6_1f64:		.db $00				; 00
B6_1f65:		bne B6_1f67 ; d0 00

B6_1f67:		.db $00				; 00
B6_1f68:	.db $7a
B6_1f69:	.db $9f
B6_1f6a:		ora ($01, x)	; 01 01
B6_1f6c:	.db $c3
B6_1f6d:	.db $9f
B6_1f6e:	.db $02
B6_1f6f:	.db $02
B6_1f70:		asl $03a0		; 0e a0 03
B6_1f73:	.db $03
B6_1f74:		eor ($a0, x)	; 41 a0
B6_1f76:		php				; 08 
B6_1f77:		sty $ffa0		; 8c a0 ff
B6_1f7a:		nop				; ea 
B6_1f7b:	.db $ab
B6_1f7c:		ldy #$e7		; a0 e7
B6_1f7e:	.db $02
B6_1f7f:		cpy $f58a		; cc 8a f5
B6_1f82:	.db $0c
B6_1f83:		ora $1d08, x	; 1d 08 1d
B6_1f86:		php				; 08 
B6_1f87:		ora $1d08, x	; 1d 08 1d
B6_1f8a:	.db $0c
B6_1f8b:		sbc $0c05		; ed05 0c
B6_1f8e:		ora $ed0c, x	; 1d 0c ed
B6_1f91:		ora $0c			; 05 0c
B6_1f93:		ora $1f08, x	; 1d 08 1f
B6_1f96:		php				; 08 
B6_1f97:		and ($08, x)	; 21 08
B6_1f99:		jsr $2008		; 20 08 20
B6_1f9c:		php				; 08 
B6_1f9d:		jsr $2008		; 20 08 20
B6_1fa0:	.db $0c
B6_1fa1:		sbc $0c05		; ed05 0c
B6_1fa4:		jsr $ed0c		; 20 0c ed
B6_1fa7:		ora $0c			; 05 0c
B6_1fa9:		jsr $2208		; 20 08 22
B6_1fac:		php				; 08 
B6_1fad:	.db $23
B6_1fae:		php				; 08 
B6_1faf:		bit $30			; 24 30
B6_1fb1:		and $20			; 25 20
B6_1fb3:		and $2a			; 25 2a
B6_1fb5:		bit $60			; 24 60
B6_1fb7:		ora ($08), y	; 11 08
B6_1fb9:		ora ($08), y	; 11 08
B6_1fbb:		ora ($08), y	; 11 08
B6_1fbd:		ora ($0c), y	; 11 0c
B6_1fbf:		sbc $600a		; ed0a 60
B6_1fc2:		beq B6_1fae ; f0 ea

B6_1fc4:	.db $ab
B6_1fc5:		ldy #$e7		; a0 e7
B6_1fc7:	.db $02
B6_1fc8:		cpy $f58a		; cc 8a f5
B6_1fcb:	.db $0c
B6_1fcc:		ora $08, x		; 15 08
B6_1fce:		ora $08, x		; 15 08
B6_1fd0:		ora $08, x		; 15 08
B6_1fd2:		ora $0c, x		; 15 0c
B6_1fd4:		sbc $0c05		; ed05 0c
B6_1fd7:		ora $0c, x		; 15 0c
B6_1fd9:		sbc $0c05		; ed05 0c
B6_1fdc:		ora $08, x		; 15 08
B6_1fde:		clc				; 18 
B6_1fdf:		php				; 08 
B6_1fe0:		ora $1d08, x	; 1d 08 1d
B6_1fe3:		php				; 08 
B6_1fe4:		ora $1d08, x	; 1d 08 1d
B6_1fe7:		php				; 08 
B6_1fe8:		ora $ed0c, x	; 1d 0c ed
B6_1feb:		ora $0c			; 05 0c
B6_1fed:		ora $ed0c, x	; 1d 0c ed
B6_1ff0:		ora $0c			; 05 0c
B6_1ff2:		ora $1e08, x	; 1d 08 1e
B6_1ff5:		php				; 08 
B6_1ff6:		jsr $2108		; 20 08 21
B6_1ff9:		;removed
	.db $30 $22

B6_1ffb:		jsr $2a22		; 20 22 2a
		.db $21
		.db $60
