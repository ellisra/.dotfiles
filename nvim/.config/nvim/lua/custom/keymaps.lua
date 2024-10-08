-- Set light/dark theme with Ctrl+[/]
vim.keymap.set('n', '<C-[>', function()
  vim.cmd [[set bg=light]]
end)

vim.keymap.set('n', '<C-]>', function()
  vim.cmd [[set bg=dark]]
end)

-- Make navigation keys handle wrapped text better in navigation mode
vim.keymap.set('n', '<up>', 'gk')
vim.keymap.set('n', '<down>', 'gj')
