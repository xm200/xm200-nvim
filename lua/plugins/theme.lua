-- LazySpec (plugin specification)
return { 
        { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
        { "rose-pine/neovim", name = "rose-pine", 
                config = function ()
                        vim.cmd("colorscheme rose-pine")
                end
        },
        { "xiyaowong/transparent.nvim" },
        { "ellisonleao/gruvbox.nvim" },
        { "blazkowolf/gruber-darker.nvim" },
} 
-- `lazy` and `priority` are only needed if this is your primary colorscheme to load it first
-- }
