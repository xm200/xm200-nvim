-- Neccesary options

vim.cmd("set nu")
vim.opt.syntax = "on"
vim.opt.mouse = "a"
vim.opt.encoding = "UTF-8"

-- Pkg manager

require("config.lazy")

vim.keymap.set("n", "<leader>cp", "<cmd>colorscheme catppuccin<cr>")
vim.keymap.set("n", "<leader>rp", "<cmd>colorscheme rose-pine<cr>")
vim.keymap.set("n", "<leader>gb", "<cmd>colorscheme gruvbox<cr>")
vim.keymap.set("n", "<leader>gd", "<cmd>colorscheme gruber-darker<cr>")


