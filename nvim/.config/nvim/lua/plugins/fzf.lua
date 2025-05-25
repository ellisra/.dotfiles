---@type LazySpec
return {
    "ibhagwan/fzf-lua",

    lazy = false,
    dependencies = "echasnovski/mini.nvim",

    opts = {
        fzf_colors = true,

        fzf_opts = {
            ["--info"] = "inline",
        },

        lsp = {
            code_actions = {
                previewer = "codeaction_native",
                preview_pager = "delta --width=$FZF_PREVIEW_COLUMNS --light",
            },
        },

        oldfiles = {
            include_current_session = true,
        },

        previewers = {
            builtin = {
                syntax_limit_b = 1024 * 100,
            },
        },

        keymap = {
            builtin = {
                ["<C-p>"] = "toggle-preview",
                ["<S-Down>"] = "preview-page-down",
                ["<S-Up>"] = "preview-page-up",
            },
        },

        winopts = {
            backdrop = 100,

            height = 0.50,
            width = 0.50,
            row = 1,
            col = 0,

            preview = {
                wrap = true,
                vertical = "down:90%",
                hidden = true,
            },
        },

        -- Pickers
        defaults = {
            find_opts = [[-type f -not -path '*/\.git/*']],
            rg_opts = [[--color=never --files --hidden --follow -g "!.git"]],
            fd_opts = [[--color=never --type f --hidden --follow --exclude .git -E '*.png' -E '*.jpg' -E '*.jpeg' -E '*.webp' -E '*.exe' -E '*.pyc' -E '*.svg']],

            formatter = "path.filename_first",
            git_icons = true,
        },

        grep = {
            rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=4096 --hidden -g '!.git/' -e",

            rg_glob = true,
            glob_flag = "--iglob",
            glob_separator = "%s%-%-",

            winopts = {
                height = 0.5,
                width = 1,
                row = 1,
                col = 0,

                preview = {
                    wrap = true,
                    horizontal = "right:70%",
                    hidden = false,
                },
            },
        },
    },

    init = function()
        local FzfLua = require("fzf-lua")
        local map = vim.keymap.set
        FzfLua.register_ui_select()

        -- Buffers and Files
        map("n", "<leader>sf", function()
            FzfLua.files()
        end, { desc = "[S]earch [F]iles" })

        map("n", "<leader>so", function()
            FzfLua.oldfiles()
        end, { desc = "[S]earch [O]ldfiles" })

        map("n", "<leader>sn", function()
            FzfLua.files({ cwd = vim.fn.stdpath("config") })
        end, { desc = "[S]earch [N]eovim config" })

        map("n", "<leader><leader>", function()
            FzfLua.buffers()
        end, { desc = "[ ] Existing buffers" })

        -- Grep
        map("n", "<leader>sg", function()
            FzfLua.live_grep()
        end, { desc = "[S]earch [G]rep" })

        -- LSP and Diagnostics
        map("n", "<leader>sd", function()
            FzfLua.diagnostics_document({
                winopts = {
                    width = 1,
                    height = 0.2,
                },
            })
        end, { desc = "[S]earch [D]iagnostics" })

        map("n", "<leader>sD", function()
            FzfLua.diagnostics_workspace({
                winopts = {
                    width = 1,
                    height = 0.2,
                },
            })
        end, { desc = "[S]earch workspace [D]iagnostics" })

        map("n", "<leader>ca", function()
            FzfLua.lsp_code_actions()
        end, { desc = "[C]ode [A]ctions" })

        map("n", "<leader>gd", function()
            FzfLua.lsp_definitions({ jump1 = true })
        end, { desc = "[G]o to [D]efinition" })

        map("n", "<leader>gr", function()
            FzfLua.lsp_references({ ignore_current_line = true })
        end, { desc = "[G]o to [R]eference" })

        -- Misc
        map("n", "<leader>sm", function()
            FzfLua.helptags({
                winopts = {
                    width = 1,
                    preview = {
                        hidden = false,
                        layout = "horizontal",
                        horizontal = "right:60%",
                    },
                },
            })
        end, { desc = "[S]earch [M]anual" })

        map("n", "<leader>sk", function()
            FzfLua.keymaps({
                winopts = {
                    width = 1,
                    height = 0.4,
                    preview = {
                        layout = "vertical",
                        vertical = "down:40%",
                    },
                },
            })
        end, { desc = "[S]earch [K]eymaps" })

        map("n", "<leader>sr", function()
            FzfLua.resume()
        end, { desc = "[S]earch [R]esume" })

        map("n", "<leader>sc", function()
            FzfLua.colorschemes({
                winopts = { height = 0.2, width = 0.2 },
            })
        end, { desc = "[S]earch [C]olorschemes" })

        map("n", "<leader>sh", function()
            FzfLua.highlights()
        end, { desc = "[S]earch [H]ighlights" })

        map("n", "<leader>sp", function()
            FzfLua.spell_suggest()
        end, { desc = "[S][p]elling suggestions" })

        -- Completion
        map("n", "<leader>cp", function()
            FzfLua.complete_path()
        end, { desc = "[C]omplete [P]ath" })
    end,
}
