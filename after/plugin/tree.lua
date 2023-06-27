vim.keymap.set('n', '<C-e>', ':NvimTreeToggle<CR>')

require("nvim-tree").setup({
        disable_netrw = false,
        hijack_netrw = false,
        respect_buf_cwd = true,
        sync_root_with_cwd = true,
        view = {
            adaptive_size = true,
        },
        renderer = {
            indent_width = 2,
            icons = {
                webdev_colors = true,
                show = {
                    file = true,
                    folder = false,
                    folder_arrow = true,
                    git = true
                },
                glyphs = {
                    git = {
                        unstaged = " ",
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
            show_on_dirs = false,
            icons = {
                hint = " ",
                info = " ",
                warning = " ",
                error = " ",
            },
        }
    })
