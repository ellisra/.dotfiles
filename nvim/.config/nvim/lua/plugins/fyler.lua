return {
    "A7Lavinraj/fyler.nvim",

    opts = {
        views = {
            confirm = {
                win = {
                    kind = "float",
                    kind_presets = {
                        float = {
                            height = "0.2rel",
                            width = "0.2rel",
                            top = "0.35rel",
                            left = "0.4rel",
                        },
                    },
                    win_opts = {
                        winhighlight = "Normal:FzfLuaNormal,FloatBorder:FzfLuaBorder,FloatTitle:FzfLuaTitle",
                    },
                },
            },
            explorer = {
                confirm_simple = true,
                default_explorer = true,
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
                    kind = "split_right_most",
                    kind_presets = {
                        split_left_most = {
                            width = "0.12rel",
                        },
                        split_right_most = {
                            width = "0.15rel",
                        },
                        float = {
                            width = "0.3rel",
                            top = "0.1rel",
                            left = "0.35rel",
                        },
                    },
                    win_opts = {
                        winhighlight = "FzfLuaNormal:FzfLuaNormal,FzfLuaBorder:FzfLuaBorder,FzfLuaTitle:FzfLuaTitle",
                    },
                },
            },
        },
    },

    init = function()
        local Fyler = require("fyler")

        vim.keymap.set("n", "<leader>o", function()
            local window_width = vim.fn.winwidth(0)

            -- if window_width >= 180 then
            --     Fyler.open()
            -- else
            Fyler.open({ kind = "float" })
            -- end
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
