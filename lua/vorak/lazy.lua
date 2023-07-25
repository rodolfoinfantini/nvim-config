local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable", -- latest stable release
            lazypath,
        })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazy").setup({
        {
            "neoclide/coc.nvim",
            branch = "master",
            build = "yarn install --frozen-lockfile",
        },
        "tpope/vim-fugitive",
        "ryanoasis/vim-devicons",
        "airblade/vim-gitgutter",
        "sheerun/vim-polyglot",
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope.nvim",
            lazy = true,
        },
        "fannheyward/telescope-coc.nvim",
        {
            "christoomey/vim-tmux-navigator",
            enabled = false,
        },
        {
            "nvim-treesitter/nvim-treesitter",
            build = ":tsupdate"
        },
        {
            "ThePrimeagen/harpoon",
            lazy = true,
        },
        "mbbill/undotree",
        {
            "nvim-lualine/lualine.nvim",
            lazy = true,
        },
        {
            "APZelos/blamer.nvim",
            lazy = true,
            event = "BufRead",
        },
        {
            "rcarriga/nvim-dap-ui",
            dependencies = {
                "mfussenegger/nvim-dap",
            }
        },
        "theHamsta/nvim-dap-virtual-text",
        "leoluz/nvim-dap-go",
        {
            "ThePrimeagen/vim-be-good",
            lazy = true,
            cmd = "VimBeGood",
        },
        "lukas-reineke/indent-blankline.nvim",
        {
            "sindrets/diffview.nvim",
            lazy = true,
            cmd = "DiffviewOpen",
        },
        "motosir/skel-nvim",
        "preservim/nerdcommenter",
        "nvim-tree/nvim-web-devicons",
        'folke/lsp-colors.nvim',
        {
            'echasnovski/mini.trailspace',
            version = false
        },
        {
            "windwp/nvim-ts-autotag",
            ft = { "html" },
            lazy = true,
        },
        "github/copilot.vim",
        {
            "nvim-tree/nvim-tree.lua",
            lazy = true,
            cmd = { "NvimTreeToggle" },
        },
        "xiyaowong/transparent.nvim",
        {
            'stevearc/oil.nvim',
            opts = {},
            dependencies = { "nvim-tree/nvim-web-devicons" },
        },
        {
            'fatih/vim-go',
            lazy = true,
            ft = { "go" },
        },
        'wakatime/vim-wakatime',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make'
        },
        {
            "jackMort/ChatGPT.nvim",
            event = "VeryLazy",
            dependencies = {
                "MunifTanjim/nui.nvim",
                "nvim-lua/plenary.nvim",
                "nvim-telescope/telescope.nvim",
            },
        },
        {
            "folke/flash.nvim",
            enabled = false,
            event = "VeryLazy",
            opts = {},
            keys = {
                {
                    "m",
                    mode = { "n", "x", "o" },
                    function()
                        require("flash").jump({
                                search = {
                                    mode = function(str)
                                        return "\\<" .. str
                                    end,
                                },
                            })
                    end,
                    desc = "Flash",
                },
                {
                    "M",
                    mode = { "n", "o", "x" },
                    function()
                        require("flash").treesitter()
                    end,
                    desc = "Flash Treesitter",
                },
                {
                    "r",
                    mode = "o",
                    function()
                        require("flash").remote()
                    end,
                    desc = "Remote Flash",
                },
                {
                    "R",
                    mode = { "o", "x" },
                    function()
                        require("flash").treesitter_search()
                    end,
                    desc = "Flash Treesitter Search",
                },
            },
        },
        {
            "folke/zen-mode.nvim",
        },

        -- THEMES
        {
            "sainnhe/gruvbox-material",
            lazy = true,
        },
        {
            "sainnhe/everforest",
            enabled = false,
        },
        {
            "morhetz/gruvbox",
            enabled = false,
        },
    })
