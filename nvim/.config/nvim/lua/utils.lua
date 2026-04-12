local M = {}

function M.select_markdown_table()
    local line_num = vim.fn.line('.')
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    local pattern = '^%s*|'

    local start_line = line_num
    while start_line > 1 and lines[start_line]:match(pattern) do
        start_line = start_line - 1
    end
    if not lines[start_line]:match(pattern) then
        start_line = start_line + 1
    end

    local end_line = line_num
    while end_line <= #lines and lines[end_line]:match(pattern) do
        end_line = end_line + 1
    end
    end_line = end_line - 1

    if start_line <= #lines and lines[start_line]:match(pattern) then
        vim.fn.cursor(start_line, 1)
        vim.cmd('normal! V')
        vim.fn.cursor(end_line, 1)
    else
        print('No table found at cursor')
    end
end

---Get characters surrounding cursor for pair logic
---@param range? integer number of chars to capture on each side (default 1)
---@return string before, string after
function M.get_pair_context(range)
    range = range or 1
    local line = vim.api.nvim_get_current_line()
    local col = vim.api.nvim_win_get_cursor(0)[2]
    local before = line:sub(col - range + 1, col)
    local after = line:sub(col + 1, col + range)
    return before, after
end

---@return string
function M.get_current_filename()
    local filename = vim.fn.expand('%:t')
    filename, _ = filename:gsub('%.%w+$','')

    return filename
end

---@param path string
function M.read_file(path)
    local file = io.open(path, 'r')
    if not file then return nil end
    local content = file:read('*a')
    file:close()
    return content
end

---@param t { path: string, filename: string }
function M.insert_template(t)
    local lines = M.read_file(t.path)
    if not lines then return nil end
    lines = lines:gsub('{{title}}', t.filename)
    vim.api.nvim_put(vim.split(lines, '\n'), 'c', true, true)
end

function M.toggle_checkbox()
    local line = vim.api.nvim_get_current_line()
    local checkbox_checked_pattern = '^%s*%- %[x%]'
    local checkbox_unchecked_pattern = '^%s*%- %[ %]'
    local list_item_pattern = '^%s*%- '
    local new_line

    if line:match(checkbox_checked_pattern) then
        new_line = line:gsub('%[x%]', '[ ]')
    elseif line:match(checkbox_unchecked_pattern) then
        new_line = line:gsub('%[ %]', '[x]')
    elseif line:match(list_item_pattern) then
        new_line = line:gsub('^(%s*%- )', '%1[ ] ')
    else
        local indent = line:match('^%s*') or ''
        new_line = indent .. '- [ ] ' .. line:gsub('^%s*', '')
    end

    vim.api.nvim_set_current_line(new_line)
end

---@param t { dirpath: string, filename: string, template_path?: string, tags?: string[], title?: string }
function M.create_note(t)
    local template_path = t.template_path or ''
    local tags = t.tags or {}
    local title = t.title or t.filename
    local filepath = string.format('%s.md', vim.fs.joinpath(t.dirpath, t.filename))
    vim.cmd('edit ' .. vim.fn.fnameescape(filepath))

    if vim.fn.line('$') == 1 and vim.fn.getline(1) == '' then
        if template_path and template_path ~= '' then
            M.insert_template({ path=vim.fn.expand(template_path), filename=t.filename })
        elseif tags and #tags > 0 then
            local content = {'---', 'tags:'}
            for _, tag in ipairs(tags) do
                table.insert(content, '  - ' .. tag)
            end
            table.insert(content, '---')
            table.insert(content, '')
            table.insert(content, '# ' .. title)
            vim.api.nvim_buf_set_lines(0, 0, 0, false, content)
        else
            vim.api.nvim_buf_set_lines(0, 0, 0, false, { '# ' .. t.filename })
        end
    end
end

function M.show_git_blame()
    local line = vim.fn.line('.')
    local file = vim.fn.expand('%')
    local cmd = string.format('git blame --porcelain -L%d,%d -- "%s"', line, line, file)
    local output = vim.fn.system(cmd)

    if vim.v.shell_error ~= 0 then
        vim.notify('Git blame failed: ' .. output, vim.log.levels.ERROR)
        return
    end

    local lines = vim.split(output, '\n')
    local author, date = '', ''

    for _, line_content in ipairs(lines) do
        if line_content:match('^author ') then
            author = line_content:gsub('^author ', '')
        elseif line_content:match('^author%-time ') then
            local timestamp = line_content:gsub('^author%-time ', '')
            date = tostring(os.date('%Y-%m-%d', tonumber(timestamp)))
        end
    end

    local content = string.format('  %s • %s', author, date)
    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, { content })

    local win = vim.api.nvim_open_win(buf, false, {
        relative = 'cursor',
        row = -3,
        col = 0,
        width = #content,
        height = 1,
        style = 'minimal',
        border = 'single',
        focusable = false,
    })

    local function close_float()
        if vim.api.nvim_win_is_valid(win) then
            vim.api.nvim_win_close(win, true)
        end
    end

    local group = vim.api.nvim_create_augroup('ellisra.git_blame_float', { clear = true })
    vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI', 'InsertEnter', 'BufLeave' }, {
        group = group,
        callback = function ()
            close_float()
            vim.api.nvim_del_augroup_by_id(group)
        end,
    })
end

---@param name string
---@param split_cmd string
function M.create_split_term_command(name, split_cmd)
    vim.api.nvim_create_user_command(name, function(opts)
        local cmd = split_cmd .. ' | terminal'
        if opts.args and opts.args ~= '' then
            cmd = cmd .. ' ' .. vim.o.shell .. ' -c "' .. opts.args .. '; exec $SHELL"'
        end
        vim.cmd(cmd)
    end, { nargs = '*', complete = 'shellcmd', desc = 'Open teminal in split' })
end

return M
