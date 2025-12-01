require('mini.ai').setup()
require('mini.align').setup()
require('mini.icons').setup()
require('mini.jump').setup()
require('mini.splitjoin').setup()
require('mini.pairs').setup({ modes = { insert = true, command = true } })

require('plugins.mini-clue')
require('plugins.mini-diff')
require('plugins.mini-hipatterns')
require('plugins.mini-indentscope')
require('plugins.mini-keymap')

require('mini.misc').setup_termbg_sync()
