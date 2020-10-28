.memorymap
	defaultslot 1

	slotsize $800
	slot 0 $0000

	slotsize $2000
	slot 1 $8000

	slotsize $2000
	slot 2 $a000

	slotsize $2000
	slot 3 $c000

	slotsize $2000
	slot 4 $e000
.endme

.banksize $2000
.rombanks 16

.asciitable
	map "0" to "9" = $00
	map "A" to "Z" = $0a
	map "." = $24
	map "," = $25
	map "'" = $26
	map ";" = $27
	map "!" = $28
	map "?" = $29
	map "-" = $2a
	map "v" = $2b // ignore?
	map " " = $7c
.enda

// *** HEADER ***

// .db "NES", $1a
// .db 8 ; = number of PRG banks * $4000
// .db 16 ; = number of CHR banks * $2000
// .db 64	; MMC3 TxROM
// .db 0
// .db 0
// .db 0
// .db 0
// .db 0,0,0,0,0
