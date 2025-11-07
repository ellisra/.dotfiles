local constants = require('constants')

return {
    'ibhagwan/fzf-lua',

    lazy = false,
    dependencies = 'nvim-mini/mini.nvim',

    opts = {
        fzf_colors = true,
        file_icon_padding = ' ',

        fzf_opts = {
            ['--info'] = 'inline',
        },

        lsp = {
            code_actions = {
                previewer = 'codeaction_native',
                preview_pager = 'delta --width=$FZF_PREVIEW_COLUMNS --light',
            },
        },

        oldfiles = {
            include_current_session = true,
        },

        previewers = {
            builtin = {
                syntax_limit_b = 1024 * 100,
            },
        },

        keymap = {
            builtin = {
                ['<C-p>'] = 'toggle-preview',
                ['<S-Down>'] = 'preview-page-down',
                ['<S-Up>'] = 'preview-page-up',
            },
        },

        winopts = {
            backdrop = 100,

            height = 0.50,
            width = 0.50,
            row = 1,
            col = 0,

            preview = {
                wrap = true,
                vertical = 'down:90%',
                hidden = true,
            },
        },

        -- Pickers
        defaults = {
            find_opts = [[-type f -not -path '*/\.git/*']],
            rg_opts = "--color=never --files --hidden --follow -g '!.git'",
            fd_opts = '--color=never --type f --hidden --follow --exclude .git'
                .. " -E '*.png' -E '*.jpg' -E '*.jpeg' -E '*.webp' -E '*.exe' -E"
                .. " '*.pyc' -E '*.svg'",

            formatter = 'path.filename_first',
            git_icons = true,
        },

        grep = {
            rg_opts = '--column --line-number --no-heading --color=always '
                .. "--smart-case --max-columns=4096 --hidden -g '!.git/' -e",

            rg_glob = true,
            glob_flag = '--iglob',
            glob_separator = '%s%-%-',

            winopts = {
                height = 0.5,
                width = 1,
                row = 1,
                col = 0,

                preview = {
                    wrap = true,
                    horizontal = 'right:70%',
                    hidden = false,
                },
            },
        },
    },

    init = function()
        local FzfLua = require('fzf-lua')
        local utils = require('utils')
        local keymap = vim.keymap.set
        FzfLua.register_ui_select()

        -- Buffers and Files
        keymap('n', '<leader>sf', function()
            FzfLua.files()
        end, { desc = '[S]earch [F]iles' })

        keymap('n', '<leader>so', function()
            FzfLua.oldfiles()
        end, { desc = '[S]earch [O]ldfiles' })

        keymap('n', '<leader>sn', function()
            FzfLua.files({ cwd = vim.fn.stdpath('config') })
        end, { desc = '[S]earch [N]eovim config' })

        keymap('n', '<leader><leader>', function()
            FzfLua.buffers()
        end, { desc = '[ ] Existing buffers' })

        -- Grep
        keymap('n', '<leader>sg', function()
            FzfLua.live_grep()
        end, { desc = '[S]earch [G]rep' })

        -- LSP and Diagnostics
        keymap('n', '<leader>sd', function()
            FzfLua.diagnostics_document({
                winopts = {
                    width = 1,
                    height = 0.2,
                },
            })
        end, { desc = '[S]earch [D]iagnostics' })

        keymap('n', '<leader>sD', function()
            FzfLua.diagnostics_workspace({
                winopts = {
                    width = 1,
                    height = 0.2,
                },
            })
        end, { desc = '[S]earch workspace [D]iagnostics' })

        keymap('n', '<leader>ca', function()
            FzfLua.lsp_code_actions()
        end, { desc = '[C]ode [A]ctions' })

        keymap('n', 'gd', function()
            FzfLua.lsp_definitions({ jump1 = true })
        end, { desc = '[G]o to [D]efinition' })

        keymap('n', '<leader>gr', function()
            FzfLua.lsp_references({ ignore_current_line = true })
        end, { desc = '[G]o to [R]eference' })

        -- Misc
        keymap('n', '<leader>sm', function()
            FzfLua.helptags({
                winopts = {
                    width = 1,
                    preview = {
                        hidden = false,
                        layout = 'horizontal',
                        horizontal = 'right:60%',
                    },
                },
            })
        end, { desc = '[S]earch [M]anual' })

        keymap('n', '<leader>sk', function()
            FzfLua.keymaps({
                winopts = {
                    width = 1,
                    height = 0.4,
                    preview = {
                        layout = 'vertical',
                        vertical = 'down:40%',
                    },
                },
            })
        end, { desc = '[S]earch [K]eymaps' })

        keymap('n', '<leader>sr', function()
            FzfLua.resume()
        end, { desc = '[S]earch [R]esume' })

        keymap('n', '<leader>sc', function()
            FzfLua.colorschemes({
                winopts = { height = 0.2, width = 0.2 },
            })
        end, { desc = '[S]earch [C]olorschemes' })

        keymap('n', '<leader>sh', function()
            FzfLua.highlights({ fzf_colors = true })
        end, { desc = '[S]earch [H]ighlights' })

        keymap('n', '<leader>sp', function()
            FzfLua.spell_suggest({ winopts = { width = 0.1, height = 0.2 } })
        end, { desc = '[S][p]elling suggestions' })

        -- Completion
        keymap('n', '<leader>cp', function()
            FzfLua.complete_path()
        end, { desc = '[C]omplete [P]ath' })

        keymap('n', '<leader>tm', function()
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
            FzfLua.fzf_exec(entries, {
                actions = {
                    ['default'] = function(selected)
                        local choice = selected[1]
                        if not choice then return end
                        local path = template_dir .. choice
                        utils.insert_template({ path=path, filename=utils.get_current_filename() })
                    end,
                    },
                })
        end, { desc = '[T]em[P]late' })
    end,
}
