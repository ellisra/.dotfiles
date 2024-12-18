return {
    "neovim/nvim-lspconfig",

    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        { "williamboman/mason.nvim", config = true },
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "saghen/blink.cmp",
    },

    config = function()
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),

            callback = function(event)
                local map = function(keys, func, desc)
                    ---@diagnostic disable-next-line: missing-fields
                    vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                end

                map("gd", require("telescope.builtin").lsp_definitions, "[G]o to [D]efinition")
                map("gr", require("telescope.builtin").lsp_references, "[G]o to [R]eferences")
                map(
                    "gI",
                    require("telescope.builtin").lsp_implementations,
                    "[G]o to [I]mplementation"
                )
                map(
                    "<leader>D",
                    require("telescope.builtin").lsp_type_definitions,
                    "Type [D]efinition"
                )
                map(
                    "<leader>ds",
                    require("telescope.builtin").lsp_document_symbols,
                    "[D]ocument [S]ymbols"
                )
                map(
                    "<leader>sp",
                    require("telescope.builtin").spell_suggest,
                    "[Sp]elling suggestions"
                )
                map(
                    "<leader>ws",
                    require("telescope.builtin").lsp_dynamic_workspace_symbols,
                    "[W]orkspace [S]ymbols"
                )
                map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame variable")
                map("gD", vim.lsp.buf.declaration, "[G]o to [D]eclaration")
            end,
        })

        local servers = {
            basedpyright = {
                settings = {
                    basedpyright = {
                        disableOrganizeImports = true,
                        analysis = {
                            typeCheckingMode = "standard",
                            diagnosticSeverityOverrides = {
                                reportUnknownParameterType = true,
                                reportImportCycles = "warning",
                                reportDuplicateImport = "warning",
                                reportConstantRedefinition = "error",
                            },
                        },
                    },
                },
            },
            ruff = {},
            rust_analyzer = {
                settings = {
                    cargo = {
                        allFeatures = true,
                    },

                    checkOnSave = {
                        command = "clippy",
                    },
                },
            },
            lua_ls = {
                settings = {
                    Lua = {
                        completion = {
                            callSnippet = "Replace",
                        },
                    },
                },
            },
            clangd = {
                cmd = {
                    "clangd",
                    "--background-index",
                    "--suggest-missing-includes",
                    "--clang-tidy",
                    "--header-insertion=iwyu",
                },
            },
            marksman = {},
        }

        require("mason").setup()
        local ensure_installed = vim.tbl_keys(servers or {})
        vim.list_extend(ensure_installed, { "stylua" })

        require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

        ---@diagnostic disable-next-line: missing-fields
        require("mason-lspconfig").setup({
            handlers = {
                function()
                    for server, config in pairs(servers) do
                        config.capabilities =
                            require("blink.cmp").get_lsp_capabilities(config.capabilities)
                        require("lspconfig")[server].setup(config)
                    end
                end,
            },
        })
    end,
}
