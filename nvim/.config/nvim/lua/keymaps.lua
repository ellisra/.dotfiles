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

-- Clear search highlight on Esc
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Open [D]iagnostic [L]ist" })

-- Exit built-in terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Vim window split commands
-- <leader>h/j/k/l opens a new window in that direction
vim.keymap.set("n", "<leader>wl", ":vsplit<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>wh", ":leftabove vsplit<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>wj", ":split<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>wk", ":leftabove split<CR>", { noremap = true, silent = true })

-- <leader>H/J/K/L moves the cursor to the window in that direction
vim.keymap.set("n", "<leader>wL", ":wincmd l<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>wH", ":wincmd h<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>wJ", ":wincmd j<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>wK", ":wincmd k<CR>", { noremap = true, silent = true })

-- Insert the current date to make daily notes quicker
vim.keymap.set("n", "td", ":pu=strftime('%Y-%m-%d')<CR>$a", { desc = "Insert [T]oday's [D]ate" })

-- Find and replace word under cursor
vim.keymap.set(
    "n",
    "<leader>r",
    [[:%s/\<<C-r><C-w>\>//g<Left><Left>]],
    { desc = "[R]eplace current word" }
)

-- Insert type: ignore on current line
vim.keymap.set("n", "<leader>ti", "A  # type: ignore<Esc>", { desc = "[T]ype [I]gnore" })

-- Obsidian daily todo note
vim.keymap.set("n", "<leader>td", function()
    require("obsidian")
    vim.cmd("ObsidianToday")
end, { desc = "Create [T]o [D]o note" })
