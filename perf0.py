def ratio(base, value):
    return 100.0 / base * value

def get_diff(base, value, reverse = False, orange_thr = 2):
    result = ratio(base, value) - 100.0
    result *= -1 if reverse else 1
    if result == 0:
        return '-'
    if result < 0:
        color = 'green'
    elif result <= orange_thr:
        color = 'RedOrange'
    else:
        color = 'red'
    result *= -1 if reverse else 1
    prefix = '+' if result > 0 else ''
    return f'$\\color{"{"}{color}{"}"}{prefix}{result:.02f}％$'

def print_table(rows, prefix = 0):
    if len(rows) == 0:
        return
    cols = len(rows[0])
    for row in rows:
        assert(cols == len(row))
    max_cell_len = [ -1 ] * cols
    for row in rows:
        for i in range(len(row)):
            length = len(row[i].encode('utf-16-le')) // 2
            max_cell_len[i] = max((max_cell_len[i], length))
    for i in range(len(rows)):
        print(' ' * prefix, end = '')
        print('|', end = '')
        for j in range(len(rows[i])):
            print(f' {rows[i][j].ljust(max_cell_len[j])} |', end = '')
        print('') # Newline.
        if i == 0:
            print(' ' * prefix, end = '')
            print('|', end = '')
            for j in range(len(rows[i])):
                print(f' {"-" * (max_cell_len[j])} |', end = '')
            print('')

    print('')

from statistics import mean, median, stdev, variance
import sys

def get_stats(fname):
    s = open(fname).read()

    entries = []

    for l in s.splitlines():
        key, value = l.split(': ')
        if len(entries) == 0 or key in entries[-1]:
            entries.append({})
        entries[-1][key] = value

    request_entries = {}

    for entry in entries:
        keys = list(entry.keys())
        keys.remove('Request')
        keys.remove('Batch size')
        keys.remove('Max (μs)')
        request = entry['Request']
        if request not in request_entries:
            request_entries[request] = {}
        for key in keys:
            if key not in request_entries[request]:
                request_entries[request][key] = []
            request_entries[request][key].append(float(entry[key]))

    request_stats = {}

    for request, entry in request_entries.items():
        request_stats[request] = {}
        for key in entry:
            request_stats[request][key] = {}
            request_stats[request][key]['mean'] = mean(entry[key])

            min_ = min(entry[key])
            avg_ = mean(entry[key])
            disp_ = avg_ - min_;
            request_stats[request][key]['disp%'] = 100.0 / avg_ * disp_
            request_stats[request][key]['stdev%'] = 100.0 / avg_ * stdev(entry[key])

    return request_stats

request_stats_old = get_stats(sys.argv[1])
request_stats_new = get_stats(sys.argv[2])

table = [['request', 'stat', 'mean (old/new)', 'diff', 'mean disp%', 'mean stdev%']]
for request in request_stats_old:
    assert(request in request_stats_new)
    stats_old = request_stats_old[request]
    stats_new = request_stats_new[request]
    for key in stats_old:
        assert(key in stats_new)
        stat_old = stats_old[key]
        stat_new = stats_new[key]
        t_mean = '{:.2f}/{:.2f}'.format(stat_old['mean'], stat_new['mean'])
        t_diff = get_diff(stat_old['mean'], stat_new['mean'], reverse = (key == 'RPS'))
        t_disp = '{:.2f}'.format((stat_old['disp%'] + stat_new['disp%']) / 2.0)
        t_stdev = '{:.2f}'.format((stat_old['stdev%'] + stat_new['stdev%']) / 2.0)
        table.append([request, key, t_mean, t_diff, t_disp, t_stdev])
        request = ''

print_table(table)
