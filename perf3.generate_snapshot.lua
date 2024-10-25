local bench = require('clock').bench
local str = require('yaml').encode

local field_count = 3000
local tuple_count = 1000000
local batch_size = arg[1]

local fiber = require('fiber')
fiber.set_max_slice(1000)

os.execute("mkdir -p " .. 'snap_' .. batch_size)

box.cfg{ memtx_memory = 1024 * 1024 * 1024 * 8, memtx_dir = 'snap_' .. batch_size}

local tuple = {}
for _ = 1, field_count do
    table.insert(tuple, 0)
end

if box.space.test == nil then
    print('Creating a snapshot...')
    local s = box.schema.space.create('test')
    s:create_index('pk', {parts = {{2, 'unsigned'}}})
    s:create_index('sk', {parts = {{1, 'unsigned'}}, unique = false})
    s:create_index('sk3000', {parts = {{3000, 'unsigned'}}, unique = false})

    for i = 1, tuple_count do
        tuple[2] = i
        tuple[1] = math.floor(i / batch_size)
        tuple[3000] = math.floor(i / batch_size)
        s:insert(tuple)
    end

    box.snapshot()
    print('Done.')
else
    print('Snapshot exists already.')
end

os.exit()
