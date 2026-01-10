local constants = require('constants')
local utils = require('utils')

vim.opt_local.wrap = true
if vim.bo.buftype == '' then
    vim.opt_local.spell = true
end

vim.keymap.set('n', '-', function()
    utils.toggle_checkbox()
end, { desc = 'Togge Checkbox', buffer = true })

vim.keymap.set('n', '<leader>at', function()
    utils.select_markdown_table()
    vim.api.nvim_feedkeys('ga|', 'x', false)
end, { desc = '[A]lign [T]able', buffer = true })

vim.api.nvim_create_user_command('AddFootnote', function(opts)
    local footnote_num = opts.args

    vim.api.nvim_put({ '[^' .. footnote_num .. ']' }, 'c', true, true)

    vim.cmd('normal! G')
    vim.cmd('normal! o')
    vim.api.nvim_put({ '[^' .. footnote_num .. ']: ' }, 'c', false, true)
    vim.cmd('stopinsert')
end, { nargs = 1 })

vim.api.nvim_create_user_command('AddTags', function()
    vim.api.nvim_put({ '---', 'tags:', '  - ', '---' }, 'l', false, true)
    vim.api.nvim_win_set_cursor(0, {3, 5})
    vim.cmd('startinsert!')
end, { desc = 'Add markdown tag block' })

vim.api.nvim_create_user_command('Template', function()
    local template_dir = vim.fn.expand(constants.MD_TEMPLATE_DIR)
    local p = vim.loop.fs_scandir(template_dir)
    if not p then return end
    local entries = {}
    while true do
        local name, type = vim.loop.fs_scandir_next(p)
        if not name then break end
        if type == 'file' then
            table.insert(entries, name)
        end
    end
    require('fzf-lua').fzf_exec(entries, {
        actions = {
            ['default'] = function(selected)
                local choice = selected[1]
                if not choice then return end
                local path = template_dir .. choice
                utils.insert_template({ path = path, filename = utils.get_current_filename() })
            end
        }
    })
end, { desc = 'Open template picker' })

vim.fn.matchadd('MdLinkBrackets', '\\[\\[')
vim.fn.matchadd('MdLinkBrackets', '\\]\\]')
