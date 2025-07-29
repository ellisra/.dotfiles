return {
    "obsidian-nvim/obsidian.nvim",

    version = "*",
    lazy = true,
    ft = "markdown",
    cmd = { "Obsidian" },

    dependencies = {
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

        daily_notes = {
            folder = "work/todo",
            date_format = "%Y-%m-%d - TODO",
            template = ".obsidian/templates/todo-template.md",
            default_tags = {},
        },

        completion = {
            nvim_cmp = false,
            blink = false,
            min_chars = 2,
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

        note_frontmatter_func = function(note)
            local out = { id = note.id, tags = note.tags }

            if note.aliases ~= nil and not vim.tbl_isempty(note.aliases) then
                out.aliases = note.aliases
            end

            if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
                for k, v in pairs(note.metadata) do
                    out[k] = v
                end
            end

            return out
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

            -- checkboxes = {
            --     [" "] = { char = "", hl_group = "ObsidianTodo" },
            --     ["x"] = { char = "", hl_group = "ObsidianDone" },
            -- },

            bullets = { char = "•", hl_group = "ObsidianBullet" },
            external_link_icon = {
                char = "",
                hl_group = "ObsidianExtLinkIcon",
            },

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

        footer = {
            enabled = false,
            separator = "",
            format = "{{backlinks}} backlinks  {{properties}} properties  {{words}} words  {{chars}} chars",
        },

        checkbox = { order = { " ", "x" } },
        legacy_commands = false,
    },

    init = function()
        vim.keymap.set(
            "n",
            "<leader>tm",
            "<cmd>Obsidian template<CR>",
            { desc = "[T]e[M]plate" }
        )
        vim.keymap.set(
            "n",
            "<leader>td",
            "<cmd>Obsidian today<CR>",
            { desc = "[T]o [D]o note" }
        )
        vim.keymap.set(
            "n",
            "<leader>st",
            "<cmd>Obsidian tag<CR>",
            { desc = "[S]earch [T]ags" }
        )
        vim.keymap.set(
            "n",
            "<leader>O",
            "<cmd>Obsidian open<CR>",
            { desc = "[O]pen obsidian" }
        )

        vim.api.nvim_create_user_command("JournalEntry", function()
            local client = require("obsidian").get_client()
            client:open_note(client:create_note({
                title = tostring(os.date("%A, %d %B %Y")),
                id = tostring(os.date("%Y-%m-%d")),
                dir = client.dir / "journal/entries",
                tags = { "journal", "journal-entry" },
            }))
        end, { desc = "Creates a journal entry" })

        vim.api.nvim_create_user_command("JournalNote", function(opts)
            local client = require("obsidian").get_client()
            local title_cont = " - " .. opts.args

            client:open_note(client:create_note({
                title = tostring(os.date("%A, %d %B %Y")) .. title_cont,
                id = tostring(os.date("%Y-%m-%d")) .. title_cont,
                dir = client.dir / "journal/notes",
                tags = { "journal", "note" },
            }))
        end, {
            desc = "Creates a journal note (requires title)",
            nargs = 1,
        })

        vim.api.nvim_create_user_command("JournalSecret", function()
            local client = require("obsidian").get_client()

            client:open_note(client:create_note({
                title = tostring(os.date("%A, %d %B %Y")),
                id = tostring(os.date("%Y-%m-%d")),
                dir = client.dir / "journal/secrets",
                tags = { "journal", "secret" },
            }))
        end, {
            desc = "Create a secret note",
        })

        vim.api.nvim_create_user_command("WeeklyRecap", function()
            local client = require("obsidian").get_client()
            client:open_note(client:create_note({
                title = string.format(
                    "Week %d, %d",
                    os.date("%V"),
                    os.date("%Y")
                ),
                id = string.format("%d-W%02d", os.date("%Y"), os.date("%V")),
                dir = client.dir / "journal/weekly-review",
                tags = { "journal", "weekly-recap" },
            }))
        end, { desc = "Create weekly recap note" })
    end,
}
