return {
    'mfussenegger/nvim-dap',

    ft = { 'python', 'rust' },
    dependencies = {
        'igorlfs/nvim-dap-view',
        'theHamsta/nvim-dap-virtual-text',
        { 'mfussenegger/nvim-dap-python', ft = 'python' },
    },

    config = function()
        local dap = require('dap')

        require('dap-view').setup({
            auto_toggle = true,
            winbar = { default_section = 'scopes' },
            windows = { terminal = { position = 'right' } },
        })

        require('nvim-dap-virtual-text').setup({ virt_text_pos = 'eol' })

        -- Python
        require('dap-python').setup('uv')

        table.insert(dap.configurations.python, {
            type = 'python',
            request = 'launch',
            name = 'django:runserver',
            program = '${workspaceFolder}/manage.py',
            args = { 'runserver', '--noreload' },
            django = true,
            console = 'integratedTerminal',
            justMyCode = true,
        })

        table.insert(dap.configurations.python, {
            type = 'python',
            request = 'launch',
            name = 'django:command',
            program = '${workspaceFolder}/manage.py',
            args = function()
                local input = vim.fn.input('Management command: ')
                local args = {}
                for arg in input:gmatch('%S+') do
                    table.insert(args, arg)
                end
                return args
            end,
            django = true,
            console = 'integratedTerminal',
            justMyCode = true,
        })

        -- Rust
        dap.adapters['rust-gdb'] = {
            type = 'executable',
            command = 'rust-gdb',
            args = { '--interpreter=dap', '--eval-command', 'set print pretty on'},
        }

        dap.configurations.rust = {
            {
                name = 'launch',
                type = 'rust-gdb',
                request = 'launch',
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopAtBeginningOfMainSubprogram = false,
            },

            {
                name = "Select and attach to process",
                type = "rust-gdb",
                request = "attach",
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                pid = function()
                    local name = vim.fn.input('Executable name (filter): ')
                    return require("dap.utils").pick_process({ filter = name })
                end,
                cwd = "${workspaceFolder}"
            },

            {
                name = "Attach to gdbserver :1234",
                type = "rust-gdb",
                request = "attach",
                target = "localhost:1234",
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}'
            },
        }

        vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = '[B]reakpoint' })
        vim.keymap.set('n', '<F10>', dap.continue)
        vim.keymap.set('n', '<F9>', dap.step_over)
        vim.keymap.set('n', '<F8>', dap.step_into)
        vim.keymap.set('n', '<F7>', dap.step_out)
        vim.keymap.set('n', '<F6>', dap.restart)
        vim.keymap.set('n', '<leader>dk', function()
            dap.terminate({ all = true })
        end, { desc = 'Kill debug processes' })
    end,
}
