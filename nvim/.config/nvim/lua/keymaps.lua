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

vim.keymap.set(
    "n",
    "<leader>dl",
    vim.diagnostic.setloclist,
    { desc = "Open [D]iagnostic [L]ist" }
)

-- Exit built-in terminal
vim.keymap.set(
    "t",
    "<Esc><Esc>",
    "<C-\\><C-n>",
    { desc = "Exit terminal mode" }
)

-- Vim window split commands
-- <leader>h/j/k/l opens a new window in that direction
vim.keymap.set(
    "n",
    "<leader>wl",
    "<cmd>vsplit<CR>",
    { noremap = true, silent = true, desc = "New window right" }
)
vim.keymap.set(
    "n",
    "<leader>wh",
    "<cmd>leftabove vsplit<CR>",
    { noremap = true, silent = true, desc = "New window left" }
)
vim.keymap.set(
    "n",
    "<leader>wj",
    "<cmd>split<CR>",
    { noremap = true, silent = true, desc = "New window down" }
)
vim.keymap.set(
    "n",
    "<leader>wk",
    "<cmd>leftabove split<CR>",
    { noremap = true, silent = true, desc = "New window up" }
)

-- <leader>H/J/K/L moves the cursor to the window in that direction
vim.keymap.set(
    "n",
    "<leader>wL",
    "<cmd>wincmd l<CR>",
    { noremap = true, silent = true, desc = "Focus right window" }
)
vim.keymap.set(
    "n",
    "<leader>wH",
    "<cmd>wincmd h<CR>",
    { noremap = true, silent = true, desc = "Focus left window" }
)
vim.keymap.set(
    "n",
    "<leader>wJ",
    "<cmd>wincmd j<CR>",
    { noremap = true, silent = true, desc = "Focus down window" }
)
vim.keymap.set(
    "n",
    "<leader>wK",
    "<cmd>wincmd k<CR>",
    { noremap = true, silent = true, desc = "Focus up window" }
)

-- Insert the current date to make daily notes quicker
vim.keymap.set(
    "n",
    "td",
    "<cmd>pu=strftime('%Y-%m-%d')<CR>$a",
    { desc = "Insert [T]oday's [D]ate" }
)

-- Find and replace word under cursor
vim.keymap.set(
    "n",
    "<leader>rw",
    [[<cmd>%s/\<<C-r><C-w>\>//g<Left><Left>]],
    { desc = "[R]eplace [W]ord" }
)

-- Insert type: ignore on current line
vim.keymap.set(
    "n",
    "<leader>ti",
    "A  # type: ignore<Esc>",
    { desc = "[T]ype [I]gnore" }
)

-- Open Lazy.nvim
vim.keymap.set(
    "n",
    "<leader>lz",
    "<cmd>Lazy<CR>",
    { desc = "Open [L]a[z]y.nvim" }
)

-- Echo current filepath
vim.keymap.set(
    "n",
    "<leader>cd",
    "<cmd>echo expand('%p')<CR>",
    { desc = "[C]urrent [D]irectory" }
)

-- Move current line up/down
vim.keymap.set("n", "<S-Down>", "ddp")
vim.keymap.set("n", "<S-Up>", "ddkP")
