import png

with open('original/OR.chr', 'rb') as f:
# with open('japan/OR.chr', 'rb') as f:
# with open('spr_new.chr', 'rb') as f:
    data = f.read()

# bank switching for chr graphics - 2kb
# bank = 0x37
# if bank is not None:
#     data = data[bank*0x400:(bank+1)*0x400]
# data = data[0x5000:0x6000]
data = data[0x1f000:0x20000]

tiles_wide = 16  # 32 if genning for a map

# 2bpp, 64 pixels per tile = 128 bits = 16 bytes
tiles_high = len(data) // 16 // tiles_wide

palette = [(0, 0, 0), (0x55, 0x55, 0x55), (0xaa, 0xaa, 0xaa), (0xff, 0xff, 0xff)]

all_data = []
for i in range(tiles_high*8):
    # array in every row
    all_data.append([0]*(tiles_wide*8))

# for i in range(tiles_high):
#     for j in range(tiles_wide):
#         array_y_tile_offset = 8*i
#         array_x_tile_offset = 8*j
#         data_offset = (i*0x10*tiles_wide)+(j*0x10)
#         for k in range(8):
#             row_y_offset = array_y_tile_offset+k
#             data_byte_1 = data[data_offset+k]
#             data_byte_2 = data[data_offset+k+8]
#             for l in range(8):
#                 all_data[row_y_offset][array_x_tile_offset+l] = ((data_byte_1>>(7-l))&1)*2+((data_byte_2>>(7-l))&1)

for i in range(tiles_high//2):
    for j in range(tiles_wide):
        array_y_tile_offset = 16*i
        array_x_tile_offset = 8*j
        data_offset = (i*0x20*tiles_wide)+(j*0x20)
        for k in range(8):
            row_y_offset = array_y_tile_offset+k
            data_byte_1 = data[data_offset+k]
            data_byte_2 = data[data_offset+k+8]
            for l in range(8):
                all_data[row_y_offset][array_x_tile_offset+l] = ((data_byte_1>>(7-l))&1)*2+((data_byte_2>>(7-l))&1)
        for k in range(8):
            row_y_offset = array_y_tile_offset+k+8
            data_byte_1 = data[data_offset+k+0x10]
            data_byte_2 = data[data_offset+k+8+0x10]
            for l in range(8):
                all_data[row_y_offset][array_x_tile_offset+l] = ((data_byte_1>>(7-l))&1)*2+((data_byte_2>>(7-l))&1)

# 00 08 | 10 18 | ... | 1f0 1f8
# 01 09 |
# ...   |
# 07 0f | 17 1f | ... " 1f7 1ff
# -----
# 200 208

# 00 08 | 20 28 | ... | 3f0 3f8
# 01 09 |
# ...   |
# 07 0f | 27 2f | ... " 3f7 3ff
# 10 18
# ...
# 17 1f
# -----
# 400 208

w = png.Writer(len(all_data[0]), len(all_data), palette=palette, bitdepth=2)

with open('spr_orig.png', 'wb') as f:
# with open('spr_jp.png', 'wb') as f:
    w.write(f, all_data)
