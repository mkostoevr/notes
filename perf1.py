def diff(base, value):
    result = ((100.0 / base) * value) - 100.0
    result_s = f'{result:.2f}%'
    color_v = abs(result)
    color_v = min(int((color_v / 5) * 255), 255)
    if value > base:
        result_s = f'+{result_s}'
        color = f'#{hex(color_v)[2:]}0000'
    else:
        color = f'#00{hex(color_v)[2:]}00'
    return f'<span style="color:{color}">{value:.02f}</span>'

ls = open('nohup.out').read().splitlines()

t = {}
bs = None
th = None

bss = set()
ths = set()

for l in ls:
    if l.startswith('@@@@@@ threshold'):
        th = int(l.split(' = ')[1])
        t[th] = {}
        ths.add(int(th))
    elif l.startswith('@@@@@@ batch'):
        bs = int(l.split(' = ')[1])
        t[th][bs] = {}
        bss.add(int(bs))
    else:
        assert(th != None)
        assert(bs != None)
        assert(isinstance(t, dict))
        assert(isinstance(t[th], dict))
        assert(isinstance(t[th][bs], dict))
        sk, time = l.split('\t')
        t[th][bs][sk] = float(time)

bss = sorted(bss)
ths = sorted(ths)[:-1]
#sks = ['sk2', 'sk10', 'sk100', 'sk1000', 'sk2000', 'sk3000']
sks = ['sk2']

def get(th, bs, sk):
    return t[th][bs][sk]

o = {}

base = 1000000
for bs in bss:
    times = []
    for sk in sks:
        times.append(f'{get(base, bs, sk):.02f}')
    base_cell = ' / '.join(times)
    o[bs] = [base_cell]

for bs in bss:
    for th in ths:
        diffs = []
        for sk in sks:
            time = get(th, bs, sk)
            base_time = get(base, bs, sk)
            diffs.append(diff(base_time, time))
        cell = ' / '.join(diffs)
        o[bs].append(cell)

print(f'<table>')
print('<tr>')
print(f'  <td>Batch size</td>')
print(f'  <td>Optimization threshold</td>')
print(f'  <td>Infinite threshold (base)</td>')
for th in ths:
    print(f'  <td>{th}</td>')
print('</tr>')
for bs in bss:
    print('<tr>')
    print(f'  <td colspan=2>{bs}</td>')
    for cell in o[bs]:
        print(f'  <td>{cell}</td>')
    print('</tr>')
print(f'</table>')
