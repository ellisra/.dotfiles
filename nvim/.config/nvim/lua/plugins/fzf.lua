---@type LazySpec
return {
    "ibhagwan/fzf-lua",

    lazy = false,
    dependencies = "echasnovski/mini.nvim",

    opts = {
        fzf_colors = {
            ["gutter"] = { "bg", "Normal" },
            ["bg+"] = { "bg", { "Cursorline" } },
        },

        fzf_opts = {
            ["--info"] = "inline",
        },

        keymaps = {
            winopts = {
                preview = {
                    layout = "flex",
                    horizontal = "right:40%",
                },
            },
        },

        lsp = {
            code_actions = {
                previewer = "codeaction_native",
                preview_pager = "delta --width=$FZF_PREVIEW_COLUMNS --light",
            },
        },

        oldfiles = {
            ignore_current_session = false,
        },

        previewers = {
            builtin = {
                syntax_limit_b = 1024 * 100,
            },
        },

        winopts = {
            backdrop = 100,

            preview = {
                wrap = true,
                vertical = "down:80%",
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
        },
    },

    keys = {
        {
            "<leader>sf",
            function()
                require("fzf-lua").files()
            end,
            desc = "[S]earch [F]iles",
        },
        {
            "<leader>sg",
            function()
                require("fzf-lua").live_grep()
            end,
            desc = "[S]earch [G]rep",
        },
        {
            "<leader>sm",
            function()
                require("fzf-lua").helptags()
            end,
            desc = "[S]earch [M]anual",
        },
        {
            "<leader>sk",
            function()
                require("fzf-lua").keymaps()
            end,
            desc = "[S]earch [K]eymaps",
        },
        {
            "<leader>sw",
            function()
                require("fzf-lua").grep_cword()
            end,
            desc = "[S]earch current [W]ord",
        },
        {
            "<leader>sd",
            function()
                require("fzf-lua").diagnostics_document()
            end,
            desc = "[S]earch [D]iagnostics",
        },
        {
            "<leader>sr",
            function()
                require("fzf-lua").resume()
            end,
            desc = "[S]earch [R]esume",
        },
        {
            "<leader>sc",
            function()
                require("fzf-lua").colorschemes()
            end,
            desc = "[S]earch [C]olourschemes",
        },
        {
            "<leader>ca",
            function()
                require("fzf-lua").lsp_code_actions()
            end,
            desc = "[C]ode [A]ctions",
        },
        {
            "<leade>sq",
            function()
                require("fzf-lua").quickfix()
            end,
            desc = "[S]earch [Q]uickfix",
        },
        {
            "<leader>so",
            function()
                require("fzf-lua").oldfiles()
            end,
            desc = "[S]earch [O]ldfiles",
        },
        {
            "<leader><leader>",
            function()
                require("fzf-lua").buffers()
            end,
            desc = "[ ] Existing Buffers",
        },
        {
            "<leader>sn",
            function()
                require("fzf-lua").files({ cwd = vim.fn.stdpath("config") })
            end,
            desc = "[S]earch [N]eovim config",
        },
        {
            "<leader>sh",
            function()
                require("fzf-lua").highlights()
            end,
            desc = "[S]earch [H]ighlights",
        },
        {
            "<leader>gd",
            function()
                require("fzf-lua").lsp_definitions({ jump1 = true })
            end,
            desc = "[G]o to [D]efinition",
        },
        {
            "<leader>gr",
            function()
                require("fzf-lua").lsp_references({ ignore_current_line = true })
            end,
            desc = "[G]o to [R]eference",
        },
        {
            "<leader>ds",
            function()
                require("fzf-lua").lsp_document_symbols()
            end,
            desc = "[D]ocument [S]ymbols",
        },
        {
            "<leader>ws",
            function()
                require("fzf-lua").lsp_live_workspace_symbols()
            end,
            desc = "[W]orkspace [S]ymbols",
        },
        {
            "<leader>sp",
            function()
                require("fzf-lua").spell_suggest()
            end,
            desc = "[S][P]elling suggestions",
        },
    },
}
