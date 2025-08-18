vim.api.nvim_create_user_command("W", "w", {})

vim.api.nvim_create_user_command("AddFootnote", function(opts)
    local footnote_num = opts.args

    vim.api.nvim_put({ "[^" .. footnote_num .. "]" }, "c", true, true)

    vim.cmd("normal! G")
    vim.cmd("normal! o")
    vim.api.nvim_put({ "[^" .. footnote_num .. "]: " }, "c", false, true)
    vim.cmd("stopinsert")
end, { nargs = 1 })

-- NOTE: These commands require obsidian.nvim
vim.api.nvim_create_user_command("WeeklyRecap", function()
    local Note = require("obsidian.note")

    Note.create({
        title = string.format("Week %d, %d", os.date("%V"), os.date("%Y")),
        id = string.format("%d-W%02d", os.date("%Y"), os.date("%V")),
        dir = Obsidian.dir / "journal/weekly-review",
        tags = { "journal", "weekly-recap" },
        should_write = true,
    }):open()
end, { desc = "Create weekly recap note" })

-- FIXME: No frontmatter/title is being inserted into these notes on creation
vim.api.nvim_create_user_command("JournalNote", function(opts)
    local Note = require("obsidian.note")
    local title_cont = " - " .. opts.args

    Note.create({
        title = tostring(os.date("%A, %d %B %Y")) .. title_cont,
        id = tostring(os.date("%Y-%m-%d")) .. title_cont,
        dir = Obsidian.dir / "journal/notes",
        tags = { "journal", "note" },
        should_write = true,
    }):open()
end, { desc = "Create a journal note (requires title)", nargs = 1 })
