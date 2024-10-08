-- Everforest
-- https://github.com/neanias/everforest-nvim

return {
  'neanias/everforest-nvim',

  name = 'everforest',
  priority = 1000,
  init = function()
    vim.cmd.colorscheme 'everforest'
    vim.cmd.hi 'Comment gui=none'
  end,
}
