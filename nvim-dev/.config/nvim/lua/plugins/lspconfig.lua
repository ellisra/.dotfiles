return {
    "neovim/nvim-lspconfig",

    dependencies = {
        { "williamboman/mason.nvim", config = true },
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "saghen/blink.cmp",
    },

    -- LSPs
    opts = {
        servers = {
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
        },
    },

    config = function()
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
        }

        require("mason").setup()
        local ensure_installed = vim.tbl_keys(servers or {})
        vim.list_extend(ensure_installed, { "stylua" })

        require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

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

    -- require("mason").setup()
    -- local ensure_installed = vim.tbl_keys(servers or {})
    -- vim.list_extend(ensure_installed, {"stylua"})
    --
    -- require("mason-tool-installer").setup({ensure_installed = ensure_installed})
    --
    --
    -- require("mason-lspconfig").setup({
    --     handlers = {
    --         function(_, opts)
    --             for server, config in pairs(opts.server) do
    --                 config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
    --                 require("lspconfig")[server].setup(config)
    --             end
    --         end,
    --     }
    -- })
}
