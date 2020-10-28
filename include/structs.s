.struct EntityStruct
	tileX   db // $00
	subX    db // $01
	tileY   db // $02
	subY    db // $03
	byte4   db
	byte5   db
	byte6   db
	byte7   db
	id      db // $08
	// entity can be loaded if this is 0
	// entity processed from wram if non-0
	// when loaded, $81 if id is < $80, else $83
	// if non-0 after entity update, update entities $400 vals
	byte9   db
	byteA   db
	// misc param?
	byteB   db
	byteC   db
	byteD   db
	byteE   db
	subID   db // $0f
	size   .db
.endst

.struct Oam
	Y       db
	tile    db
	attr    db
	X       db
.endst