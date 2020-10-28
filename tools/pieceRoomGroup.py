import os
from PIL import Image

group = 10
mapRows = [
    4, 7, 4, 16, 5, 6, 4, 8, 4, 4, 10
][group]

bank = 2 if group in [1, 2, 3, 4, 5] else 0
bankOffset = bank * 0x2000

with open('original/OR.bin', 'rb') as f:
    data = f.read()

# get max rooms
rooms = 0
roomGroupOrderAddr = ((data[0x21+group*2+1]<<8)+data[0x21+group*2])-0x8000
for i in range(mapRows*0x10):
    room = data[roomGroupOrderAddr+bankOffset+i]
    rooms = max(rooms, room)
rooms += 1

# firstly gen pieces
os.system('mkdir roomGroupPieces')
for i in range(rooms):
    os.system(f'python tools/buildUpMapTiles.py {group:02x} {i:02x}')
    os.system('python tools/gfx.py')
    os.system(f'mv spr_new.png roomGroupPieces/room{i:02x}.png')

# get map of i to image
fnames = os.listdir('roomGroupPieces')
images = [
    Image.open(f'roomGroupPieces/room{i:02x}.png')
    for i in range(rooms)
]

new_im = Image.new('RGB', (256*16+15, 256*mapRows+(mapRows-1)))

# piece together based on order
for i in range(mapRows):
    for j in range(0x10):
        room = data[roomGroupOrderAddr+bankOffset+i*0x10+j]
        new_im.paste(images[room], (j*256+j, i*256+i))

new_im.save(f'roomGroupGfx/group{group:02x}.png')
os.system('rm -rf roomGroupPieces')
