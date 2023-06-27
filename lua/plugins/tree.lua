vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.keymap.set('n', '<C-e>', ':NvimTreeToggle<CR>')

local HEIGHT_RATIO = 0.8 -- You can change this
local WIDTH_RATIO = 0.5  -- You can change this too

require("nvim-tree").setup({
        disable_netrw = true,
        hijack_netrw = true,
        respect_buf_cwd = true,
        sync_root_with_cwd = true,
        view = {
            relativenumber = true,
            adaptive_size = true,
        },
        renderer = {
            indent_width = 4,
            group_empty = true,
            indent_markers = {
                enable = true,
                icons = {
                    corner = "└ ",
                    edge = "│ ",
                    item = "│ ",
                    none = "  ",
                },
            },
            icons = {
                webdev_colors = true,
                show = {
                    file = true,
                    folder = true,
                    folder_arrow = false,
                    git = true
                },
                glyphs = {
                    default = " ",
                    symlink = " ",
                    folder = {
                        arrow_closed = " ",
                        arrow_open = " ",
                        default = " ",
                        open = " ",
                        empty = " ",
                        empty_open = " ",
                        symlink = " ",
                        symlink_open = " ",
                    },
                    git = {
                        unstaged = " ", -- 
                        staged = " ",
                        unmerged = " ",
                        renamed = "➜ ",
                        untracked = " ",
                        deleted = " ",
                        ignored = "◌ ",
                    },
                },
            }
        },
        filters = {
            custom = { "^.git$" },
        },
        diagnostics = {
            enable = true,
            show_on_dirs = true,
            icons = {
                hint = " ",
                info = " ",
                warning = " ",
                error = " ",
            },
        }
    })
