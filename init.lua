-- Neccesary options

vim.cmd("set nu")
vim.opt.syntax = "on"
vim.opt.mouse = "a"
vim.opt.encoding = "UTF-8"

-- Pkg manager

require("config.lazy")

-- Colorschemes
vim.keymap.set("n", "<leader>ayu", "<cmd>colorscheme ayu-dark<cr>")
vim.keymap.set("n", "<leader>cp", "<cmd>colorscheme catppuccin<cr>")
vim.keymap.set("n", "<leader>rp", "<cmd>colorscheme rose-pine<cr>")
vim.keymap.set("n", "<leader>gb", "<cmd>colorscheme gruvbox<cr>")
vim.keymap.set("n", "<leader>gd", "<cmd>colorscheme gruber-darker<cr>")

-- sync colorschemes
vim.opt.termguicolors = true
vim.cmd("Neotree")

-- File tools and terminal
vim.keymap.set("n", "<leader>tm", "<cmd>rightb vert terminal<cr>")
