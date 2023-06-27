require('mini.trailspace').setup()

vim.cmd("command! -nargs=0 Trim :lua MiniTrailspace.trim()")
