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
        "ryanoasis/vim-devicons",
        "airblade/vim-gitgutter",
        "sheerun/vim-polyglot",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
        "fannheyward/telescope-coc.nvim",
        "christoomey/vim-tmux-navigator",
        {
            "nvim-treesitter/nvim-treesitter",
            build = ":TSUpdate"
        },
        "ThePrimeagen/harpoon",
        "mbbill/undotree",
        "nvim-lualine/lualine.nvim",
        "APZelos/blamer.nvim",
        "puremourning/vimspector",
        "ThePrimeagen/vim-be-good",
        "lukas-reineke/indent-blankline.nvim",
        "sindrets/diffview.nvim",
        "motosir/skel-nvim",
        "preservim/nerdcommenter",
        "nvim-tree/nvim-web-devicons",
        "nvim-tree/nvim-tree.lua",
        'folke/lsp-colors.nvim',
        "windwp/nvim-ts-autotag",
        "github/copilot.vim",
        "xiyaowong/transparent.nvim",

        -- THEMES
        "sainnhe/gruvbox-material",
        "morhetz/gruvbox",
    })

require('colors')
require('settings')
require('keybindings')
require('plugins')
