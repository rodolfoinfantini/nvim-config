require'nvim-treesitter.configs'.setup {
  ensure_installed = { "vimdoc", "javascript", "typescript", "go", "c", "c_sharp", "query", "lua", "html", "css", "scss", },

  sync_install = false,

  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
if vim.loop.os_uname().sysname == "Windows_NT" then
   require('nvim-treesitter.install').compilers = { "clang" }
end
