local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files)
vim.keymap.set('n', '<leader>fj', builtin.live_grep)
vim.keymap.set('n', '<leader>fb', builtin.buffers)
vim.keymap.set('n', '<leader>fm', ':Telescope coc document_symbols<CR>')
vim.keymap.set('n', '<leader>fd', ':Telescope coc diagnostics<CR>')

require('telescope').setup{
    file_ignore_patterns = {"node%_modules/.*", ".git/.*"},
    extensions = {
        coc = {
            prefer_locations = true, -- always use Telescope locations to preview definitions/declarations/implementations etc
        },
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
                override_generic_sorter = true,  -- override the generic sorter
                override_file_sorter = true,     -- override the file sorter
                case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                -- the default case_mode is "smart_case"
            },
        },
        defaults = {
            layout_strategy = 'horizontal',
            layout_config = { height = 0.95, width = 0.75, preview_width = 0.35 },
        },
    }
    require('telescope').load_extension('coc')
    require('telescope').load_extension('fzf')
