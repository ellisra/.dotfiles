-- Enable syntax highlighting for sway config files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "/home/rob/.dotfiles/sway/.config/sway/config.d/*" },
    callback = function()
        vim.bo.filetype = "swayconfig"
    end,
})

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Wrap text on Telescope preview
vim.api.nvim_create_autocmd("User", {
    pattern = "TelescopePreviewerLoaded",
    callback = function()
        vim.wo.wrap = true
    end,
})

-- Turn on spell checking for markdown files
vim.cmd("autocmd FileType markdown setlocal spell")
