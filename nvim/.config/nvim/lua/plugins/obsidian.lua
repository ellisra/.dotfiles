---@diagnostic disable: assign-type-mismatch
return {
    "epwalsh/obsidian.nvim",

    version = "*",
    lazy = true,
    ft = "markdown",
    cmd = { "ObsidianToday", "ObsidianTag" },

    dependencies = {
        "nvim-lua/plenary.nvim",
        "ibhagwan/fzf-lua",
        "nvim-treesitter/nvim-treesitter",
    },

    opts = {
        workspaces = {
            {
                name = "second-brain",
                path = "~/second-brain",
            },
        },

        log_level = vim.log.levels.INFO,

        -- Work todo
        daily_notes = {
            folder = "work/work-todo",
            date_format = "%Y-%m-%d - TODO",
            template = ".obsidian/templates/work-todo-template.md",
            default_tags = {},
        },

        completion = {
            nvim_cmp = false,
            min_chars = 2,
        },

        mappings = {
            ["gf"] = {
                action = function()
                    return require("obsidian").util.gf_passthrough()
                end,
                opts = { noremap = false, expr = true, buffer = true },
            },
            ["<cr>"] = {
                action = function()
                    return require("obsidian").util.smart_action()
                end,
                opts = { buffer = true, expr = true },
            },
        },

        new_notes_location = "current_dir",

        wiki_link_funk = "use_alias_only",
        preferred_link_style = "wiki",

        templates = {
            folder = ".obsidian/templates",
            date_format = "%d-%m-%Y",
            time_format = "%H:%M",
        },

        ---@param url string
        follow_url_func = function(url)
            vim.fn.jobstart({ "xdg-open", url })
            vim.ui.open(url)
        end,

        picker = {
            name = "fzf-lua",
            note_mappings = {
                new = "<C-x>",
                insert_link = "<C-l>",
            },
            tag_mappings = {
                tag_note = "<C-x>",
                insert_tag = "<C-l>",
            },
        },

        sort_by = "modified",
        sort_reversed = true,
        search_max_lines = 1000,

        open_notes_in = "current",

        ui = {
            enable = false,
            update_debounce = 200,
            max_file_length = 5000,

            checkboxes = {
                [" "] = { char = "", hl_group = "ObsidianTodo" },
                ["x"] = { char = "", hl_group = "ObsidianDone" },
            },

            bullets = { char = "•", hl_group = "ObsidianBullet" },
            external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },

            reference_text = { hl_group = "ObsidianRefText" },
            highlight_text = { hl_group = "ObsidianHighlightText" },
            tags = { hl_group = "ObsidianTag" },
            block_ids = { hl_group = "ObsidianBlockID" },
            hl_groups = {
                -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
                ObsidianTodo = { bold = true, fg = "#e67e80" },
                ObsidianDone = { bold = true, fg = "#a7c080" },
                ObsidianBullet = { bold = true, fg = "#7fbbb3" },
                ObsidianRefText = { underline = true, fg = "#7fbbb3" },
                ObsidianExtLinkIcon = { fg = "#7fbbb3" },
                ObsidianTag = { italic = true, fg = "#89ddff" },
                ObsidianBlockID = { italic = true, fg = "#89ddff" },
                ObsidianHighlightText = { bg = "#75662e" },
                -- Seems to be overriden by render-markdown (I think?)
            },
        },
    },

    init = function()
        vim.keymap.set("n", "<leader>tm", "<cmd>ObsidianTemplate<CR>", { desc = "[T]e[M]plate" })
        vim.keymap.set(
            "n",
            "<leader>wp",
            "dGo%% Waypoint %%<Esc><cmd>w<CR><cmd>e<CR>",
            { desc = "Insert [W]ay[p]oint" }
        )
        vim.keymap.set("n", "<leader>td", "<cmd>ObsidianToday<CR>", { desc = "[T]o [D]o note" })
        vim.keymap.set("n", "<leader>st", "<cmd>ObsidianTag<CR>", { desc = "[S]earch [T]ags" })

        vim.api.nvim_create_user_command("JournalEntry", function()
            local client = require("obsidian").get_client()
            client:open_note(client:create_note({
                title = os.date("%A, %d %B %Y"),
                id = os.date("%Y-%m-%d"),
                dir = client.dir / "general/journal/entries",
                tags = { "journal", "journal-entry" },
            }))
        end, { desc = "[J]ournal [E]ntry" })

        vim.api.nvim_create_user_command("WeeklyRecap", function()
            local client = require("obsidian").get_client()
            client:open_note(client:create_note({
                title = string.format("Week %d, %d", os.date("%V"), os.date("%Y")),
                id = string.format("%d-W%02d", os.date("%Y"), os.date("%V")),
                dir = client.dir / "general/journal/weekly-review",
                template = "weekly-recap-template",
            }))
        end, { desc = "Create weekly recap note" })
    end,
}
