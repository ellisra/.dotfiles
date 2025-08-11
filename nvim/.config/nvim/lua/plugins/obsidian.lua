return {
    "obsidian-nvim/obsidian.nvim",

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
        checkbox = { order = { " ", "x" } },
        legacy_commands = false,

        ui = { enable = false },
        footer = { enabled = false },
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
    end,
}
