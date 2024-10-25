local fio = require('fio')
local tarantool = require('tarantool')
local BUILDDIR = fio.abspath(fio.pathjoin(os.getenv('BUILDDIR') or '.'))
local MODULEPATH = fio.pathjoin(BUILDDIR, 'perf', 'lua',
                                '?.' .. tarantool.build.mod_format)

package.cpath = MODULEPATH .. ';' .. package.cpath

local has_column_scan, test_module = pcall(require, 'column_scan_module')
if not has_column_scan then
    io.stderr:write('Lua module "column_scan_module" is not found.\n')
    os.exit(1)
end

box.cfg{ memtx_memory = 1024 * 1024 * 1024 * 8}

require('fiber').set_slice(9999)

function bench()
    for _, index in ipairs({box.space.test.index.sk, box.space.test.index.sk3000}) do
        print('Index: ' .. index.name)
        test_module.init(box.space.test.id, index.id)
    end
end

print('Warming-up.')
bench()

print('Testing.')
bench()

os.exit()
