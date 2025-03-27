return {
    "neovim/nvim-lspconfig",

    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "saghen/blink.cmp" },

    config = function()
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),

            callback = function(event)
                local map = function(keys, func, desc)
                    ---@diagnostic disable-next-line: missing-fields
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
        })

        local servers = {
            basedpyright = {
                settings = {
                    basedpyright = {
                        disableOrganizeImports = true,
                        analysis = {
                            typeCheckingMode = "standard",
                            diagnosticSeverityOverrides = {
                                useLibraryCodeForTypes = true,
                                reportUnknownParameterType = true,
                                reportImportCycles = "warning",
                                reportDuplicateImport = "warning",
                                reportConstantRedefinition = "error",
                                reportUnnecessaryTypeIgnoreComment = "warning",
                                reportUnusedClass = "warning",
                                reportUnusedFunction = "warning",
                                reportUnusedVariable = "warning",
                                reportUnusedExpression = "warning",
                            },
                        },
                    },
                },
            },
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
            markdown_oxide = {},
        }

        for server, config in pairs(servers) do
            config.capabilities =
                require("blink.cmp").get_lsp_capabilities(config.capabilities)
            require("lspconfig")[server].setup(config)
        end

        vim.diagnostic.config({
            virtual_lines = {
                current_line = true,
            },
        })
    end,
}
