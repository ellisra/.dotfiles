-- obsidian-bridge
-- https://github.com/oflisback/obsidian-bridge.nvim

return {
  'oflisback/obsidian-bridge.nvim',
  config = function()
    require('obsidian-bridge').setup()
  end,
  event = {
    'BufReadPre *.md',
    'BufNewFile *.md',
  },
  lazy = true,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
}
