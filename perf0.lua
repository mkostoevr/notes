box.cfg{
    listen = 3301,
    memtx_memory = 1024 * 1024 * 1024 * 8,
    net_msg_max = 2000000000,
    readahead = 2000000000,
}

s = box.schema.space.create('s')
s:create_index('pk')

box.schema.user.grant('guest','read,write,execute,create,drop','universe')
