-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
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

-- Disable diagnostics inside markdown files
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*.md",
    callback = function()
        vim.diagnostic.enable(false)
    end,
})
-- Re-enable diagnostics inside non-markdown files
vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        if vim.bo.filetype ~= "markdown" then
            vim.diagnostic.enable()
        end
    end,
})
