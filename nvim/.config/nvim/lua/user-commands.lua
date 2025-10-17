local utils = require('utils')
local constants = require('constants')

vim.api.nvim_create_user_command('W', 'w', {})

vim.api.nvim_create_user_command('AddFootnote', function(opts)
    local footnote_num = opts.args

    vim.api.nvim_put({ '[^' .. footnote_num .. ']' }, 'c', true, true)

    vim.cmd('normal! G')
    vim.cmd('normal! o')
    vim.api.nvim_put({ '[^' .. footnote_num .. ']: ' }, 'c', false, true)
    vim.cmd('stopinsert')
end, { nargs = 1 })

-- Terminal Commands
local function create_term_command(name, split_cmd)
    vim.api.nvim_create_user_command(name, function(opts)
        local cmd = split_cmd .. ' | terminal'
        if opts.args and opts.args ~= '' then
            cmd = cmd .. ' ' .. vim.o.shell .. ' -c "' .. opts.args .. '; exec $SHELL"'
        end
        vim.cmd(cmd)
        vim.cmd.startinsert()
    end, {
        nargs = '*',
        complete = 'shellcmd',
        desc = 'Open terminal in split',
    })
end

create_term_command('HTerm', 'split')
create_term_command('VTerm', 'vsplit')

-- -- NOTE: These commands require obsidian.nvim
-- vim.api.nvim_create_user_command('WeeklyRecap', function()
--     local Note = require('obsidian.note')
--
--     Note.create({
--         title = string.format('Week %d, %d', os.date('%V'), os.date('%Y')),
--         id = string.format('%d-W%02d', os.date('%Y'), os.date('%V')),
--         dir = Obsidian.dir / 'journal/weekly-review',
--         tags = { 'journal', 'weekly-recap' },
--         should_write = true,
--     }):open()
-- end, { desc = 'Create weekly recap note' })
--
-- vim.api.nvim_create_user_command('JournalNote', function(opts)
--     local Note = require('obsidian.note')
--     local title_cont = ' - ' .. opts.args
--
--     Note.create({
--         title = tostring(os.date('%A, %d %B %Y')) .. title_cont,
--         id = tostring(os.date('%Y-%m-%d')) .. title_cont,
--         dir = Obsidian.dir / 'journal/notes',
--         tags = { 'journal', 'note' },
--         should_write = true,
--     }):open()
-- end, { desc = 'Create a journal note (requires title)', nargs = 1 })

vim.api.nvim_create_user_command('Note', function(opts)
    local args = vim.split(opts.args, ' ', { trimempty = true })
    local dirpath = args[1]
    local filename = args[2]
    local template_path = nil
    local tags = {}

    if args[3] and args[3]:match('%.md$') then
        template_path = args[3]
    else
        for i = 3, #args do
            table.insert(tags, args[i])
        end
    end

    utils.create_note(dirpath, filename, tags, template_path)
end, { desc = 'Create a note', nargs = '+', complete = 'dir' })

-- vim.api.nvim_create_user_command('WeeklyRecap', function()
--     utils.create_note(
--         constants.VAULT_DIR .. 'journal/weekly/',
--         string.format('%d-W%02d', os.date('%Y'), os.date('%V')),
--         { 'journal', 'weekly-recap' },
--     )
-- end)
