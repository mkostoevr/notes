local bench = require('clock').bench
local str = require('yaml').encode

local field_count = 3000
local tuple_count = 18000 -- almost filled 3-level tree.

local fiber = require('fiber')
fiber.set_max_slice(1000000)

box.cfg{ memtx_memory = 1024 * 1024 * 1024 * 8}

local tuple = {}
for _ = 1, field_count do
    table.insert(tuple, 0)
end

if box.space.test == nil then
    print('Creating a snapshot...')
    local s = box.schema.space.create('test')
    s:create_index('pk', {parts = {{1, 'unsigned'}}})
    s:create_index('sk2', {parts = {{2, 'unsigned'}}, unique = false})
    s:create_index('sk10', {parts = {{10, 'unsigned'}}, unique = false})
    s:create_index('sk100', {parts = {{100, 'unsigned'}}, unique = false})
    s:create_index('sk1000', {parts = {{1000, 'unsigned'}}, unique = false})
    s:create_index('sk2000', {parts = {{2000, 'unsigned'}}, unique = false})
    s:create_index('sk3000', {parts = {{3000, 'unsigned'}}, unique = false})

    for i = 1, tuple_count do
        tuple[1] = i
        s:insert(tuple)
    end

    box.snapshot()
    print('Done. Please restart Tarantool')
    os.exit()
end

for i = 1, 100 do
    print('@@@@@@ threshold = ' .. (i == 1 and 1000000 or (i - 1)))
    io.flush()

    local rv = box.read_view.open()

    function f(index, tuple_batch)
        for i = 1, (tuple_count / tuple_batch) do
            local counter = 0
            for _, tuple in index:pairs({0}, {iterator = 'eq'}) do
                tuple = nil
                counter = counter + 1
                if counter == tuple_batch then
                    break
                end
            end
        end
    end

    local batches = {}
    for i = 1, 100 do
        table.insert(batches, i)
    end
    table.insert(batches, 500)
    table.insert(batches, 1000)
    table.insert(batches, tuple_count)

    for _, tuple_batch in ipairs(batches) do
        print('@@@@@@ batch = ' .. tuple_batch)
        io.flush()
        for _, index in ipairs(rv.space.test.index) do
            assert(tuple_batch <= tuple_count)
            print(index.name, bench(f, index, tuple_batch)[1])
            io.flush()
            fiber.yield()
        end
    end

    rv:close()
    tuple[1] = tuple_count + i
    box.space.test:insert(tuple)
end
