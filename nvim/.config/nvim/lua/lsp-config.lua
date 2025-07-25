return {
    vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),

        callback = function(event)
            vim.keymap.set(
                "n",
                "<leader>rn",
                vim.lsp.buf.rename,
                { desc = "[R]e[N]ame variable" }
            )
            vim.keymap.set(
                "n",
                "gD",
                vim.lsp.buf.declaration,
                { desc = "[G]o to [D]eclaration" }
            )
            vim.keymap.set("n", "K", function()
                vim.lsp.buf.hover({ border = "single" })
            end, { buffer = event.buf })
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
