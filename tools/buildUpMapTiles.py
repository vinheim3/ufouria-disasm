import sys

group, room = sys.argv[1:3]

def conv(hexstr):
    return int(f"0x{hexstr}", 16)

group = conv(group)
room = conv(room)

with open('original/OR.bin', 'rb') as f:
    data = f.read()

with open('original/OR.chr', 'rb') as f:
    chr_data = f.read()


def getAddrAtOffset(offset):
    return ((data[offset+1]<<8)|data[offset])-0x8000


# get bank 0 addresses first
bankOffset = data[group]*0x2000
chrBankPaletteAddr = getAddrAtOffset(0x000b+group*2)
room32Metatiles = getAddrAtOffset(0x0037+group*2) + room * 0x40
room16Metatiles = getAddrAtOffset(0x004d+group*2)
room8Metatiles = getAddrAtOffset(0x0063+group*2)

room16MetatileAddresses = [
    getAddrAtOffset(bankOffset+room16Metatiles),
    getAddrAtOffset(bankOffset+room16Metatiles+2),
    getAddrAtOffset(bankOffset+room16Metatiles+4),
    getAddrAtOffset(bankOffset+room16Metatiles+6),
]
room8MetatileAddresses = [
    getAddrAtOffset(bankOffset+room8Metatiles),
    getAddrAtOffset(bankOffset+room8Metatiles+2),
    getAddrAtOffset(bankOffset+room8Metatiles+4),
    getAddrAtOffset(bankOffset+room8Metatiles+6),
]

bgChrBank1 = int(data[bankOffset+chrBankPaletteAddr]) // 2
bgChrBank2 = int(data[bankOffset+chrBankPaletteAddr+1]) // 2
bgChrData = chr_data[bgChrBank1*0x800:(bgChrBank1+1)*0x800] + chr_data[bgChrBank2*0x800:(bgChrBank2+1)*0x800]

allTiles = [0]*32*32*0x10

# row offset = (metatile idx // 8)*32*4
#            + (is 16 br/bl)*32*2
#            + (is 8 br/bl)*32
# col offset = (metatile idx % 8)*4
#            + (is 16 tr/br)*2
#            + (is 8 tr/br)*1


def get_offset(m32_idx, is_16_br_bl, is_8_br_bl, is_16_tr_br, is_8_tr_br):
    return (m32_idx // 8 * 32 * 4) + \
           (is_16_br_bl * 32 * 2) + \
           (is_8_br_bl * 32) + \
           (m32_idx % 8) * 4 + \
           (is_16_tr_br * 2) + \
           is_8_tr_br


# populate screen
for i in range(0x40):
    m32idx = data[bankOffset+room32Metatiles+i]

    # split the 32x32 pixel tiles into 16x16
    for j in range(4):
        _16_br_bl = j // 2 == 1
        _16_tr_br = j % 2 == 1
        _16_idx = data[bankOffset+room16MetatileAddresses[j] + m32idx]

        # split the 16x16 pixels tiles into 8x8
        for k in range(4):
            _8_br_bl = k // 2 == 1
            _8_tr_br = k % 2 == 1
            _8_idx = data[bankOffset+room8MetatileAddresses[k] + _16_idx]

            offset = get_offset(i, _16_br_bl, _8_br_bl, _16_tr_br, _8_tr_br)
            allTiles[offset*0x10:(offset+1)*0x10] = bgChrData[_8_idx*0x10:(_8_idx+1)*0x10]


with open('spr_new.chr', 'wb') as f:
    f.write(bytearray(allTiles))
