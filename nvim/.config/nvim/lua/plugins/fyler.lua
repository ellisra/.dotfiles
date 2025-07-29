return {
    "A7Lavinraj/fyler.nvim",

    opts = {
        -- Changes configuration for associated view
        views = {
            confirm = {
                win = {
                    kind = "float",
                    kind_presets = {
                        float = {
                            height = 0.2,
                            width = 0.2,
                        },
                    },
                },
            },
            explorer = {
                -- Changes explorer closing behaviour when a file get selected
                close_on_select = true,
                -- Changes explorer behaviour to auto confirm simple edits
                confirm_simple = true,
                -- Changes explorer behaviour to hijack NETRW
                default_explorer = true,
                -- Changes git statuses visibility
                git_status = true,
                -- Changes Indentation marker properties
                indentscope = {
                    marker = "▏",
                },
                win = {
                    -- Changes window border
                    border = "single",
                    -- Changes buffer options
                    buf_opts = {
                        buflisted = false,
                        buftype = "acwrite",
                        expandtab = true,
                        filetype = "fyler",
                        shiftwidth = 2,
                        syntax = "fyler",
                    },
                    -- Changes window kind
                    kind = "split_left_most",
                    -- Changes window kind preset
                    kind_presets = {
                        split_left_most = {
                            width = 0.12,
                        },
                    },
                },
            },
        },
    },

    init = function()
        vim.keymap.set(
            "n",
            "<leader>o",
            "<cmd>Fyler<CR>",
            { desc = "[O]pen File Tree" }
        )

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "fyler",
            callback = function()
                vim.opt_local.statuscolumn = ""
                vim.opt_local.number = false
                vim.opt_local.relativenumber = false
            end,
        })
    end,
}
