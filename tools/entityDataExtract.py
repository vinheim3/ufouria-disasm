import sys
import clipboard

"""
0 - 9d6 4 b09
1 - b0a 7 c8d
2 - c8e 4 d9c
3 - d9d 16 1145
4 - 1146 8 1308
5 - 1309 10 14ea
67 - 14eb 8 168a
8 - 168b 7 1775
9 - 1776 9 18f5
a - 18f6 16 1c16
"""

with open('original/OR.bin', 'rb') as f:
    data = f.read()

start, rows, stub = sys.argv[1:4]

# get entity id mapping
with open('constants/entities.s') as f:
    entityData = f.read().split('\n')
entities = {}
for row in entityData:
    if not row:
        continue
    words = row.split()
    name = words[1]
    eid = int(f'0x{words[2][1:]}', 16)
    entities[eid] = name

def conv(hexstr):
    return int(f"0x{hexstr}", 16)

if ':' in start:
    bank, addr = start.split(':')
    bank = conv(bank)
    addr = conv(addr)
    start = bank*0x2000+addr
else:
    start = conv(start)
    addr = start

rows = int(rows)
stub = conv(stub)

comps = []

offset = 0
addresses = []
addr_toColRowMap = {}

for i in range(rows * 0x10):
    curr_addr = (data[start+offset+1] << 8) | data[start+offset]
    if curr_addr-0x8000 == stub:
        comps.append('\t.dw @stub')
    else:
        row = i // 0x10
        col = i % 0x10
        addr_toColRowMap[curr_addr] = f"{row:02x}_{col:02x}"
        comps.append(f'\t.dw @data_{addr_toColRowMap[curr_addr]}')
    if i % 0x10 == 0xf:
        comps.append('')
    addresses.append(curr_addr)
    offset += 2

s_addresses = sorted(set(addresses))

for s_addr in s_addresses:
    assert s_addr - 0x8000 == addr + offset
    if s_addr - 0x8000 == stub:
        comps.append('@stub:')
    else:
        comps.append(f'@data_{addr_toColRowMap[s_addr]}:')
    nb = data[start+offset]
    offset += 1
    comps.append(f'\t.db ${nb:02x}')
    for i in range(nb):
        nbs = data[start+offset:start+offset+4]
        offset += 4
        conv_nbs = [f"${nbs[i]:02x}" for i in (0, 1, 3)]
        if nbs[2] in entities:
            conv_nbs.insert(2, entities[nbs[2]])
        else:
            conv_nbs.insert(2, f"${nbs[2]:02x}")
        joined = " ".join(conv_nbs)
        comps.append(f'\t.db {joined}')
    comps.append('')

final_str = '\n'.join(comps)
clipboard.copy(final_str)
