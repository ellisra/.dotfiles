-- FIXME: Set light/dark theme with Ctrl+[/]
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

-- Ctrl + j/k navigates 5 lines down/up
vim.keymap.set("n", "<C-j>", "5j")
vim.keymap.set("i", "<C-j>", "<C-o>5j")
vim.keymap.set("n", "<C-k>", "5k")
vim.keymap.set("i", "<C-k>", "<C-o>5k")

-- Go to file explorer
vim.keymap.set("n", "<leader>o", ":Oil<CR>", { desc = "[O][i]l file explorer" })

-- Open template selector
vim.keymap.set("n", "<leader>st", ":ObsidianTemplate<CR>", { desc = "[S]earch [T]emplates" })

-- Clear search highlight on Esc
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Open diagnostics window
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit built-in terminal
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Navigate to the start of the line with Home
vim.keymap.set("n", "<Home>", "^")
vim.keymap.set("i", "<Home>", "<C-o>^")
