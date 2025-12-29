local map_multistep = require('mini.keymap').map_multistep

map_multistep('i', '<C-l>', { 'jump_after_close' })
map_multistep('i', '<C-h>', { 'jump_before_open' })
