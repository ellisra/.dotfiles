return {
    { -- Collection of various small independent plugins/modules
        "echasnovski/mini.nvim",

        event = { "VeryLazy" },
        config = function()
            -- Better Around/Inside textobjects
            require("mini.ai").setup({ n_lines = 500 })

            -- Align text objects, e.g. markdown tables with `ga|`
            require("mini.align").setup({})

            -- Keymap hints
            local miniclue = require("mini.clue")
            miniclue.setup({
                triggers = {
                    -- Leader triggers
                    { mode = "n", keys = "<Leader>" },
                    { mode = "x", keys = "<Leader>" },

                    -- Built-in completion
                    { mode = "i", keys = "<C-x>" },

                    -- `g` key
                    { mode = "n", keys = "g" },
                    { mode = "x", keys = "g" },

                    -- Marks
                    -- { mode = "n", keys = "'" },
                    { mode = "n", keys = "`" },
                    { mode = "x", keys = "'" },
                    { mode = "x", keys = "`" },

                    -- Registers
                    { mode = "n", keys = "\"" },
                    { mode = "x", keys = "\"" },
                    { mode = "i", keys = "<C-r>" },
                    { mode = "c", keys = "<C-r>" },

                    -- Window commands
                    { mode = "n", keys = "<C-w>" },

                    -- `z` key
                    { mode = "n", keys = "z" },
                    { mode = "x", keys = "z" },
                },

                clues = {
                    -- Enhance this by adding descriptions for <Leader> mapping groups
                    miniclue.gen_clues.builtin_completion(),
                    miniclue.gen_clues.g(),
                    miniclue.gen_clues.marks(),
                    miniclue.gen_clues.registers(),
                    miniclue.gen_clues.windows(),
                    miniclue.gen_clues.z(),
                },

                window = {
                    delay = 100,
                },
            })

            -- Visualise git changes and allow git hunk interraction
            require("mini.diff").setup({
                view = {
                    style = "sign",
                    -- signs = { add = "▏", change = "▏", delete = "_" },
                    signs = { add = "│", change = "│", delete = "_" },
                    priority = 199,
                },
            })

            -- Highlight colour codes and other specified patterns
            require("mini.hipatterns").setup({
                highlighters = {
                    fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
                    hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
                    -- todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
                    note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

                    -- Highlight hex color strings (`#rrggbb`) using that color
                    hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
                },
            })

            -- Replacement for nvim-autopairs
            require("mini.pairs").setup({})

            -- Add/delete/replace surroundings (brackets, quotes, etc.)
            require("mini.surround").setup({
                mappings = {
                    add = "ma",
                    delete = "md",
                    find = "mf",
                    find_left = "mF",
                    highlight = "mv",
                    replace = "mr",
                    update_n_lines = "mn",
                },
            })
        end,
    },
}
