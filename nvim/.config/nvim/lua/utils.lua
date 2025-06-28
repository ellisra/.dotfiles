local M = {}

---Selects markdown table under cursor in visual line mode
function M.select_markdown_table()
    local line_num = vim.fn.line(".")
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

    -- Find table start (look backwards for first line starting with |)
    local start_line = line_num
    while start_line > 1 and lines[start_line]:match("^%s*|") do
        start_line = start_line - 1
    end
    -- If we went too far back, move forward one line
    if not lines[start_line]:match("^%s*|") then
        start_line = start_line + 1
    end

    -- Find table end (look forwards for last line starting with |)
    local end_line = line_num
    while end_line <= #lines and lines[end_line]:match("^%s*|") do
        end_line = end_line + 1
    end
    -- Move back to the last actual table line
    end_line = end_line - 1

    -- Check if we're actually in a table
    if start_line <= #lines and lines[start_line]:match("^%s*|") then
        -- Move to start of table and begin visual selection
        vim.fn.cursor(start_line, 1)
        vim.cmd("normal! V")
        -- Extend selection to end of table
        vim.fn.cursor(end_line, 1)
    else
        print("No table found at cursor")
    end
end

return M
