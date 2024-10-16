-- Set light/dark theme with Ctrl+[/]
vim.keymap.set("n", "<C-[>", function()
    vim.cmd([[set bg=light]])
end)

vim.keymap.set("n", "<C-]>", function()
    vim.cmd([[set bg=dark]])
end)

-- Make navigation keys handle wrapped text better in navigation mode
vim.keymap.set("n", "<up>", "gk")
vim.keymap.set("n", "<down>", "gj")
vim.cmd([[nnoremap j gj]])
vim.cmd([[nnoremap k gk]])

-- Clear search highlight on Esc
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Open diagnostics window
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit built-in terminal
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
