; ========================================================================================
; Bank 0
; ========================================================================================

.ramsection "RAM 0" bank 0 slot 0

.union
	wLayoutDataAddr: ; $00
		dw

	wCurrDrawnLayoutCols: ; $02
		db

	wCurrDrawnLayoutRows: ; $03
		db

	wLayoutColsLeft: ; $04
		db
.nextu
	wInlinePaletteDataPtr: ; $00
		dw

	wNumInlinePaletteGroups: ; $02
		db

	wNumInlinePalettesPerGroup: ; $03
		db
.nextu
	wNametablePaletteAddr_hi: ; $00
		db
.nextu
	wPaletteFadePaletteIdx: ; $00
		db

	wPaletteFadePaletteColourIdx: ; $01
		db

	wBitsToCheckForPaletteFading: ; $02
		db
.nextu
	wJumpTableRetIdx: ; $00
		db

	wJumpTableRetAddr: ; $01
		dw
.nextu
	wInvPasswordCircleIdx: ; $00
		db

	wInvPasswordCirclePPUAddrBE: ; $01
		dw

	wInvPasswordCurrPaletteByte: ; $03
		db

	wInvPasswordPaletteAddrLowByte: ; $04
		db
.nextu
	wCurrInvPasswordByte: ; $00
		db

// reused ram from function using above bytes
	wInvPassword64x64paletteVal: ; $01
		db

	wInvPasswordCurrCirclePaletteShiftCnt: ; $02
		db
.nextu
	wNonGenericJumpTableAddr: ; $00
		dw
.nextu
	wWramPageToClear: ; $00
		dw
.nextu
	wCurrRoomGroupPaletteChrAddr: ; $00
		dw
.nextu
	wCurrRoomMetaTileBytesAddr: ; $00
		dw

	wCurrMetaTileVal: ; $02
		db
.nextu
	wCurrPlayerOrEntityOamSpecAddr: ; $00
		db
	// todo: 2 to 5 are used with this
.endu

w005:
	db

wRoomGroupOrderIdx: ; $06
	db

wRoomMetaTileIdx: ; $07
	db

// top-left, top-right, bottom-left, bottom-right
w16x16MetaTileQuadrantIdx: ; $08
	db

w8x8MetaTileQuadrantIdx: ; $09
	db

wCurrColCopyRowIdx: ; $0a
	db

w00b:
	dsb $e-$b

.union
	wCurrLayoutRowPPUAddrBE: ; $0e
		dw
.nextu
	w00e_1:
		db
	.union
		wCurr2bitPasswordByte: ; $0f
			db
	.nextu
		wRoomIdx: ; $0f
			db
	.endu
.endu

wCachedEntityStruct: ; $10
	instanceof EntityStruct

w020:
	dsb 2

wBankSelect: ; $22
	db

w023:
	db

wShouldLoadInternalPalettes: ; $24
	db

w025:
	dsb 8-5

// 0 (n/a) in non-scrolling screens/going between rooms
// 1 (4 at $a0)
// 2 (2->1->3 at $0c)in normal game
// 3 (5->6->7 at $2c) when waiting at intro
wScanlineIRQSetup: ; $28
	db

w029:
	dsb $40-$29

wBank_a000: ; $40
	db

wBank_8000: ; $41
	db

w2KBChrBank0: ; $42
	db

w2KBChrBank1: ; $43
	db

w1KBChrBank0: ; $44
	db

w1KBChrBank1: ; $45
	db

w1KBChrBank2: ; $46
	db

w1KBChrBank3: ; $47
	db

wCurrRoomGroupDataBank: ; $48
	db

w049:
	dsb $50-$49

wCurrRoomGroupMetaTileBytesAddr: ; $50
	dw

// 4 16x16 metatiles making up each 32x32 metatile
wCurrRoomGroup16x16MetaTileBytesAddr: ; $52
	dw

// 4 8x8 tile idxes making up each 16x16 metatile
wCurrRoomGroup8x8MetaTileBytesAddr: ; $54
	dw

w056:
	dsb 2

wCurrRoomGroupRoomOrder: ; $58
	dw

wJumpTableAddr: ; $5a
	dw

wCurrRoomGroupEntitiesAddr: ; $5c
	dw

w05e:
	dsb 2

wIRQVectorFunc: ; $60
	dw

w062:
	dsb 8-2

wScanlineIRQSetupFuncAddr: ; $68
	dw

w06a:
	dsb $70-$6a

wCurr16x16MetaTileQuadrantTopBytesAddr: ; $70
	dw

wCurr16x16MetaTileQuadrantBottomBytesAddr: ; $72
	dw

wCurr8x8MetaTileQuadrantTopBytesAddr: ; $74
	dw

wCurr8x8MetaTileQuadrantBottomBytesAddr: ; $76
	dw

w078:
	dsb $9d-$78

wBitToCheck: ; $9d
	db

w09e:
	dsb $aa-$9e

wCurrTextsAddress: ; $aa
	dw

w0ac:
	dsb $c6-$ac

wTempBank_a000_duringEntityBank7func: ; $c6
	db

w0c7:
	dsb $f9-$c7

// set to 55h to mark we should do major funcs
wShouldWaitForMajorNMIInterruptFuncs: ; $f9
	db

wNMIVectorTempY: ; $fa
	db

wNMIVectorTempX: ; $fb
	db

wPPUScrollY: ; $fc
	db

wPPUScrollX: ; $fd
	db

wPPUMask: ; $fe
	db

wPPUCtrl: ; $ff
	db

wNMIDataCopyStructNextIdx: ; $100
	db

wNMIDataCopyStruct: ; $101
	.db

wNMIDataCopyDest: ; $101
	dw // big-endian

// bit 7 set means copy down?
wNMIDataCopyNumBytes: ; $103
	db

wNMIDataCopyBytes: ; $104
	dsb $50-4

.union
	wJoy1ButtonsPressedBit0: ; $150
		db
.nextu
	wJoy1ButtonsPressed: ; $150
		db
.endu

wJoy1OldButtonsPressed: ; $151
	db

.union
	wJoy2ButtonsPressedBit0: ; $152
		db
.nextu
	wJoy2ButtonsPressed: ; $152
		db
.endu

wJoy2OldButtonsPressed: ; $153
	db

wJoy1NewButtonsPressed: ; $154
	db

wJoy2NewButtonsPressed: ; $155
	db

wJoy1ButtonsPressedBit1: ; $156
	db

wJoy2ButtonsPressedBit1: ; $157
	db

wNextUsableOamIdx: ; $158
	db

w159:
	dsb 2

wEntityWramOffset: ; $15b
	db

// eg for 1st $400 entity, this val is 8. For 7th, this val is 1
wEntityIdxReversed: ; $15c
	db

w015d:
	dsb 2

wBitmapOfPalettesToFadeOut: ; $15f
	db

w160:
	dsb 2-0

wCurrRoomGroup: ; $162
	db

w163:
	dsb 9-3

wShadow2KBChrBank0: ; $169
	db

wShadow2KBChrBank1: ; $16a
	db

wShadow1KBBanks: ; $16b
	.db
wShadow1KBChrBank0: ; $16b
	db
wShadow1KBChrBank1: ; $16c
	db
wShadow1KBChrBank2: ; $16d
	db
wShadow1KBChrBank3: ; $16e
	db

w16f:
	dsb $80-$6f

// palettes are loaded from 2 to 1, then to $3f00
wInternalPalettes_1: ; $180
	dsb $20

wInternalPalettes_2: ; $1a0
	dsb $20

w1c0:
	dsb $200-$1c0

wOam: ; $200
	instanceof Oam
wOamCont: ; $204
	dsb $100-4

w300:
	dsb $400-$300

wEntityStructs: ; $400
	instanceof EntityStruct
wEntityStructsCont: ; $410
	dsb (MAX_ENTITIES-1) * $10

w480:
	dsb $4a0-$480

wPasswordGridCircleVals: ; $4a0
	dsb 36

wPasswordGlobalFlagBytes: ; $4c4
	dsb 8

wPasswordSumByte: ; $4cc
	db

w4cd:
	dsb $d0-$cd

wRomBankPairsOnStack: ; $4d0
	db

wRomBankStack_8000: ; $4d1
	db // unknown size

wRomBankStack_a000: ; $4d2
	db // unknown size

w4d3:
	dsb $e0-$d3

wGlobalFlags: ; $4e0
	dsb $20

w500:
	dsb $10-0

wChosenCharacter: ; $510
	db

w511:
	dsb $b-1

wPlayerOamDetailsIdx: ; $51b
	db

.ends

// bit 1? (on top of snow house)
// bit 2? (beneath water in starting area)
// bit 3 (in tiny cracked wall blocked room in waterfall area)
// bit 4 (last dark area)
.define wHCsGotten $4e2 // lower 4 bits, 1 per hc
.define wFilledHeartContainers $4e3 // max 4
.define wPlayerHealth $4e5 // max 50