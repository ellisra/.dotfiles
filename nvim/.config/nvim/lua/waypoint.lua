-- Helper function to get all markdown files recursively
local function get_markdown_files(directory)
    local files = {}
    local all_items = vim.fn.glob(directory .. "/**/*.md", false, true)

    for _, file in ipairs(all_items) do
        -- Convert to relative path from the current directory
        local rel_path = vim.fn.fnamemodify(file, ":.")
        if rel_path:sub(1, 2) == "./" then
            rel_path = rel_path:sub(3)
        end
        table.insert(files, rel_path)
    end

    return files
end

-- Helper function to build directory structure
local function build_directory_structure(files)
    local structure = {}

    for _, file in ipairs(files) do
        local parts = vim.split(file, "/")
        local current = structure

        -- Handle files in the root directory
        if #parts == 1 then
            if not structure["root"] then
                structure["root"] = {}
            end
            table.insert(structure["root"], file)
        else
            -- Handle files in subdirectories
            local path = ""
            for i = 1, #parts - 1 do
                local dir = parts[i]
                path = path .. (path == "" and "" or "/") .. dir
                if not current[path] then
                    current[path] = {}
                end
                if i == #parts - 1 then
                    -- Add the file to this directory
                    table.insert(current[path], file)
                end
            end
        end
    end

    return structure
end

-- Helper function to format directory structure as markdown
local function format_structure(structure)
    local lines = {}

    -- Handle root files first
    if structure["root"] then
        local root_files = structure["root"]
        table.sort(root_files)
        for _, file in ipairs(root_files) do
            table.insert(lines, "- [[" .. file .. "]]")
        end
    end

    -- Get and sort directory names
    local dirs = {}
    for dir, _ in pairs(structure) do
        if dir ~= "root" then
            table.insert(dirs, dir)
        end
    end
    table.sort(dirs)

    -- Handle directories and their files
    for _, dir in ipairs(dirs) do
        table.insert(lines, "- " .. dir .. "/")
        local files = structure[dir]
        table.sort(files)
        for _, file in ipairs(files) do
            table.insert(lines, "  - [[" .. file .. "|" .. file .. "]]")
        end
    end

    return lines
end

function CreateMarkdownIndex()
    -- Get the current buffer's directory
    local current_file = vim.fn.expand("%:p")
    local directory = vim.fn.expand("%:p:h")

    -- Get all markdown files
    local files = get_markdown_files(directory)

    -- Remove current file from the list
    local current_relative = vim.fn.fnamemodify(current_file, ":.")
    if current_relative:sub(1, 2) == "./" then
        current_relative = current_relative:sub(3)
    end

    files = vim.tbl_filter(function(file)
        return file ~= current_relative
    end, files)

    -- Build directory structure
    local structure = build_directory_structure(files)

    -- Format as markdown
    local lines = format_structure(structure)

    -- Get cursor position
    local cursor_pos = vim.api.nvim_win_get_cursor(0)
    local row = cursor_pos[1]

    -- Insert the formatted structure
    vim.api.nvim_buf_set_lines(0, row - 1, row - 1, false, lines)
end

-- Command to call the function
vim.api.nvim_create_user_command("CreateMarkdownIndex", CreateMarkdownIndex, {})
