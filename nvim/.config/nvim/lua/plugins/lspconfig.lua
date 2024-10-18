-- LSP related setup
return {
    {
        -- https://github.com/folke/lazydev.nvim
        "folke/lazydev.nvim",

        ft = "lua",
        opts = {
            library = {
                { path = "luvit-meta/library", words = { "vim%.uv" } },
            },
        },
    },
    { "Bilal2453/luvit-meta" },
    {
        -- Main LSP Config
        "neovim/nvim-lspconfig",

        dependencies = {
            -- Automatically installs LSPs and related tools to stdpath
            {
                -- Must be loaded before dependants
                "williamboman/mason.nvim",
                config = true,
            },

            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",

            { "j-hui/fidget.nvim", opts = {} },

            "hrsh7th/cmp-nvim-lsp",
        },

        config = function()
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
                callback = function(event)
                    -- Helper function for mapping LSP related items
                    local map = function(keys, func, desc)
                        vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                    end

                    -- Jump to definition of word
                    map("gd", require("telescope.builtin").lsp_definitions, "[G]o to [D]efinition")
                    -- Find references for word
                    map("gr", require("telescope.builtin").lsp_references, "[G]o to [R]eferences")
                    -- Jump to implementation of word
                    map("gI", require("telescope.builtin").lsp_implementations, "[G]o to [I]mplementation")
                    -- Jump to type definition
                    map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
                    -- Fuzzy find all symbols in document
                    map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
                    -- Fuzzy find all symbols in workspace
                    map(
                        "<leader>ws",
                        require("telescope.builtin").lsp_dynamic_workspace_symbols,
                        "[W]orkspace [Symbols]"
                    )
                    -- Rename variable
                    map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame variable")
                    -- Go to declaration
                    map("gD", vim.lsp.buf.declaration, "[G]o to [D]eclaration")
                end,
            })

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

            local servers = {
                pyright = {},
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
            vim.list_extend(ensure_installed, {
                "stylua",
            })

            require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

            require("mason-lspconfig").setup({
                handlers = {
                    function(server_name)
                        local server = servers[server_name] or {}

                        server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
                        require("lspconfig")[server_name].setup(server)
                    end,
                },
            })
        end,
    },
}
