return {
    "ibhagwan/fzf-lua",

    dependencies = "echasnovski/mini.nvim",

    opts = {
        grep = {
            rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=4096 --hidden -g '!.git/' -e",
        },

        winopts = {
            backdrop = 100,

            preview = {
                wrap = true,
                vertical = "down:50%",
            },
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
                require("fzf-lua").lsp_definitions()
            end,
            desc = "[G]o to [D]efinition",
        },

        -- map("gd", require("fzf-lua").lsp_definitions(), "[G]o to [D]efinition")
    },
}
