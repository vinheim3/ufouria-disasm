DEFINES = -D ROM_JP
#DEFINES =

main:
	wla-6502 ${DEFINES} -o game.o game.s
	wlalink -S linkfile ufouria.bin
	rm game.o