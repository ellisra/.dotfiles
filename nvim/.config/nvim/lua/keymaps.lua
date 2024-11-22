--- Reduces flickering when jumping around buffer
---@param keys string inputs from user
---@return function which uses lazyredraw to draw the buffer
local function lazykeys(keys)
    keys = vim.api.nvim_replace_termcodes(keys, true, false, true)
    return function()
        local old = vim.o.lazyredraw
        vim.o.lazyredraw = true
        vim.api.nvim_feedkeys(keys, "nx", false)
        vim.o.lazyredraw = old
    end
end

-- FIXME: Set light/dark theme with Ctrl+[/]
vim.keymap.set("n", "<C-[>", function()
    vim.cmd([[set bg=light]])
end)

vim.keymap.set("n", "<C-]>", function()
    vim.cmd([[set bg=dark]])
end)

-- Make navigation keys handle wrapped text better in navigation mode
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "j", "gj")

-- Ctrl + j/k navigates half page down/up and centres the cursor
vim.keymap.set("n", "<C-j>", lazykeys("<C-d>zz"))
vim.keymap.set("i", "<C-j>", "<C-o><C-d><C-o>zz")
vim.keymap.set("n", "<C-k>", lazykeys("<C-u>zz"))
vim.keymap.set("i", "<C-k>", "<C-o><C-u><C-o>zz")

-- Navigate to the start of the line with Home
vim.keymap.set("n", "<Home>", "^")
vim.keymap.set("i", "<Home>", "<C-o>^")

-- Go to file explorer
vim.keymap.set("n", "<leader>o", ":Oil<CR>", { desc = "[O][i]l file explorer" })

-- Clear search highlight on Esc
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Obsidian Keymaps
-- Toggle obsidian-bridge
vim.keymap.set("n", "<leader>tb", ":ObsidianBridgeToggle<CR>", { desc = "[T]oggle obsidian [B]ridge" })
-- Open template selector
vim.keymap.set("n", "<leader>st", ":ObsidianTemplate<CR>", { desc = "[S]earch [T]emplates" })
-- Create waypoint
vim.keymap.set("n", "<leader>wp", "i%% Waypoint %%<Esc>", { desc = "Insert [W]ay[p]oint" })

-- Open diagnostics window
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit built-in terminal
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Generate docstring
vim.api.nvim_set_keymap("n", "<leader>do", ":Neogen<CR>", { desc = "Generate [Do]cstring" })

-- LuaSnip
local ls = require("luasnip")

-- Jumps to next placeholder in snippet
vim.keymap.set("n", "<tab>", function()
    ls.jump(1)
end, { silent = true })
