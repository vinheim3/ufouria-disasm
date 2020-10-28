import clipboard

with open('original/OR.bin', 'rb') as f:
    data = f.read()

bankOffset = 6*0x2000
listOffset = bankOffset+0x153
listItems = 113

addresses = [
    (data[listOffset+i*2+1]<<8)|data[listOffset+i*2]
    for i in range(listItems)
]
print('\n'.join(hex(addr) for addr in addresses))

comps = [
    f'\t.dw staticLayout_{i:02x}'
    for i in range(listItems)
]
comps.append('')

for i in range(listItems-1):
    bankAddr = addresses[i]-0x8000+bankOffset
    nextBankAddr = addresses[i+1]-0x8000+bankOffset
    comps.append(f'staticLayout_{i:02x}:')
    if bankAddr == nextBankAddr:
        continue

    bytedata = data[bankAddr:nextBankAddr]
    addrByte = (bytedata[0]<<8)|bytedata[1]
    comps.append(f'\tdwbe ${addrByte:04x}')
    realWidth = bytedata[2]
    realHeight = bytedata[3]
    if addrByte in (0x23c0, 0x27c0, 0x2bc0, 0x2fc0):
        height = realWidth*realHeight//8
        width = 8
    else:
        width = realWidth
        height = realHeight
    comps.append(f'\t.db ${realWidth:02x} ${realHeight:02x}')
    layoutByteData = bytedata[4:4+width*height]
    extraByteData = bytedata[4+width*height:]
    for j in range(height):
        rowByteData = layoutByteData[j*width:(j+1)*width]
        if rowByteData:
            combined = " ".join(f"${byte:02x}" for byte in rowByteData)
            comps.append(f'\t.db {combined}')
    if extraByteData:
        combined = " ".join(f"${byte:02x}" for byte in extraByteData)
        comps.append(f'\t.db {combined}')
    comps.append('')

final_str = '\n'.join(comps)
clipboard.copy(final_str)
