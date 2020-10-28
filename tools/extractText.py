import sys
import clipboard

with open('original/OR.bin', 'rb') as f:
    data = f.read()

start = sys.argv[1]

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


comps = []
string = "\t.asc \""
chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ.,';!?-v"
offset = 0
for byte in data[start:]:
    if byte == 0xff:
        break
    if byte <= 0x2b:
        string += chars[byte]
    elif byte == 0x7c:
        string += " "
    else:
        if string != "\t.asc \"":
            string += '"'
            comps.append(string)
            # comps.append(f'{addr+offset:04x}')  # for addr
            comps.append(f'\t.db ${byte:02x}')
            # comps.append(f'{addr+offset:04x}')  # for addr
            string = "\t.asc \""
        else:
            comps.append(f'\t.db ${byte:02x}')
            # comps.append(f'{addr+offset:04x}')  # for addr
    offset += 1

if string != "\t.asc \"":
    string += '"'
    comps.append(string)

comps.append('\t.db $ff')
final_str = '\n'.join(comps)
print(final_str)
print(f"{addr+offset:04x}")
clipboard.copy(final_str)
