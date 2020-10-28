import clipboard
import os

strings = """9d6 4 b09
b0a 7 c8d
c8e 4 d9c
d9d 16 1145
1146 8 1308
1309 10 14ea
14eb 8 168a
168b 7 1775
1776 9 18f5
18f6 16 1c16""".split('\n')

headers = """itemsEntities0
itemsEntities1
itemsEntities2
itemsEntities3
itemsEntities4
itemsEntities5
itemsEntities67
itemsEntities8
itemsEntities9
itemsEntitiesA""".split('\n')

comps = []
for i in range(len(strings)):
    comps.append(headers[i]+':')
    os.system(f'python tools/entityDataExtract.py 4:{strings[i]}')
    comps.append(clipboard.paste())
    comps.append('')

final_str = "\n".join(comps)
clipboard.copy(final_str)
