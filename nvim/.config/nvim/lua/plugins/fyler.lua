return {
    "A7Lavinraj/fyler.nvim",

    opts = {
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
                close_on_select = true,
                confirm_simple = true,
                default_explorer = true,
                git_status = true,
                indentscope = {
                    marker = "▏",
                },
                win = {
                    border = "single",
                    buf_opts = {
                        buflisted = false,
                        buftype = "acwrite",
                        expandtab = true,
                        filetype = "fyler",
                        shiftwidth = 2,
                        syntax = "fyler",
                    },
                    kind = "split_left_most",
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
        local Fyler = require("fyler")

        vim.keymap.set("n", "<leader>o", function()
            local window_width =
                vim.api.nvim_win_get_width(vim.api.nvim_get_current_win())

            -- NOTE: Changes behaviour to use whole nvim width
            -- local window_width = tonumber(
            --     vim.api.nvim_exec2("echo &columns", { output = true }).output
            -- )

            if window_width >= 150 then
                Fyler.open()
            else
                Fyler.open({ kind = "float" })
            end
        end, { desc = "[O]pen File Tree" })

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
