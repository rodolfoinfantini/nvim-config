vim.keymap.set("n", "<Leader>di", "<Plug>VimspectorBalloonEval", { noremap = false })
vim.keymap.set("x", "<Leader>di", "<Plug>VimspectorBalloonEval", { noremap = false })
vim.keymap.set("n", "<Leader><F3>", ":VimspectorReset<CR><CR>", { noremap = false })
vim.keymap.set("n", "<Leader>g", "<Plug>VimspectorGoToCurentLine", { noremap = false })
vim.keymap.set("n", "<leader>b", "<Plug>VimspectorStop:wa<CR>:!dotnet build<CR>", { noremap = false })

vim.cmd([[
command! -nargs=0 Bps :VimspectorBreakpoints
]])
