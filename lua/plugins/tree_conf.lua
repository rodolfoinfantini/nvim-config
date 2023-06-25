vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.keymap.set('n', '<C-e>', ':NvimTreeToggle<CR>')

require("nvim-tree").setup({
        sort_by = "case_sensitive",
        view = {
            adaptive_size = true
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
                webdev_colors = false,
                show = {
                    file = false,
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
            dotfiles = true,
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
