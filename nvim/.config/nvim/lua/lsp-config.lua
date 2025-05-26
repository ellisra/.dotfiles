return {
    vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),

        callback = function(event)
            local map = function(keys, func, desc)
                vim.keymap.set(
                    "n",
                    keys,
                    func,
                    { buffer = event.buf, desc = "LSP: " .. desc }
                )
            end

            map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame variable")
            map("gD", vim.lsp.buf.declaration, "[G]o to [D]eclaration")
        end,
    }),

    vim.lsp.enable({
        "lua-ls",
        "basedpyright",
        "markdown-oxide",
        "rust-analyzer",
        "clangd",
        "gopls",
    }),

    vim.diagnostic.config({
        virtual_lines = {
            current_line = true,
        },
    }),
}
