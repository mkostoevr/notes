box.cfg {
    memtx_memory = 1024 * 1024 * 1024 * 12,
    wal_mode = 'none',
}

require('fiber').set_max_slice(999999)

count = 10000000
insert_rate = 0.01
from_snapshot = true
insert_at_end = false

if from_snapshot and not box.space.s then
    print('Creating a snapshot...')

    s = box.schema.space.create('s')
    s:create_index('pk')

    box.begin()
    for i = 1, count do
        s:insert({i * 2})
    end
    box.commit()

    box.snapshot()

    require('fiber').yield()
    os.exit()
end

if not from_snapshot then
    print('Creating space...')

    if box.space.s then
        box.space.s:drop()
    end

    s = box.schema.space.create('s')
    s:create_index('pk')

    box.begin()
    for i = 1, count do
        s:insert({i * 2})
        if i % (count / 100) == 0 then
            io.write('.')
        end
        if i % (count / 10) == 0 then
            io.write(' ' .. (i / (count / 100)) .. ' ')
        end
        io.flush()
    end
    io.write('\n')
    box.commit()
end

if box.space.s:count() ~= count then
    print(string.format('Wrong snapshot! Expected space size: %d, actual: %d', count, box.space.s:count()))
    os.exit()
end

print(string.format('Count: %d', count))
print(string.format('Update rate: %.0f%%', insert_rate * 100))
print(string.format('BSize0: %.3fMB', box.space.s.index.pk:bsize() / 1024 / 1024))

rv = box.read_view.open()

box.begin()
start = insert_at_end and math.floor(count * (1.0 - insert_rate)) or 1
for i = start, count do
    if insert_at_end or math.random() < insert_rate then
        box.space.s:insert({i * 2 + 1})
    end
end
box.commit()

print(string.format('BSize1: %.3fMB', box.space.s.index.pk:bsize() / 1024 / 1024))

os.exit()
