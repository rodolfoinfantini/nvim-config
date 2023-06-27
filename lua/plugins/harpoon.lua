local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>j", mark.add_file)
vim.keymap.set("n", "<leader>e", ui.toggle_quick_menu)
