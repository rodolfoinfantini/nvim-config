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

vim.g.vimspector_enable_mappings = "HUMAN"
vim.g.vimspector_sign_priority = {
    vimspectorBP=500,
    vimspectorBPCond=500,
    vimspectorBPLog=500,
    vimspectorBPDisabled=500,
    vimspectorPC=999,
    vimspectorPCBP=999,
}

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
            build = ":TSUpdate"
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
            "puremourning/vimspector",
            lazy = true,
            cmd = { "VimspectorToggleBreakpoint", "Vimspector" },
            keys = { "<F5>", "<F9>" },
        },
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
            "windwp/nvim-ts-autotag",
            ft = { "html" },
            lazy = true,
        },
        "github/copilot.vim",
        "xiyaowong/transparent.nvim",
        {
            'stevearc/oil.nvim',
            opts = {},
            dependencies = { "nvim-tree/nvim-web-devicons" },
        },

        -- THEMES
        {
            "sainnhe/gruvbox-material",
            lazy = true,
        },
        {
            "morhetz/gruvbox",
            enabled = false,
        },
    })
