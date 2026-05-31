-- LazySpec (plugin specification)
return {
	{
		"Shatur/neovim-ayu",
		name = "ayu",
		priority = 1000,
		config = function()
			require("ayu").setup({
				overrides = {
					Normal = { fg = "#ffd7a3", bg = "#121417" },
					NormalFloat = { fg = "#ffd7a3", bg = "#1a1d21" },
					FloatBorder = { fg = "#ff6a00", bg = "#1a1d21" },
					LineNr = { fg = "#7a2b00" },
					CursorLine = { bg = "#1d2126" },
					CursorLineNr = { fg = "#ffb000", bold = true },
					Visual = { bg = "#4a1a00" },
					Search = { fg = "#121417", bg = "#ffb000" },
					IncSearch = { fg = "#121417", bg = "#ff3d00" },
					Pmenu = { fg = "#ffd7a3", bg = "#1a1d21" },
					PmenuSel = { fg = "#121417", bg = "#ff6a00" },
					Comment = { fg = "#a84800", italic = true },
					String = { fg = "#ffb000" },
					Function = { fg = "#ff7a00" },
					Keyword = { fg = "#ff3d00" },
					Type = { fg = "#ffcc33" },
					Constant = { fg = "#ff8c1a" },
					Operator = { fg = "#ff5a00" },
					DiagnosticError = { fg = "#ff2a00" },
					DiagnosticWarn = { fg = "#ffb000" },
					DiagnosticInfo = { fg = "#ff7a00" },
					DiagnosticHint = { fg = "#ffd166" },
				},
			})

			vim.cmd("colorscheme ayu-dark")
		end,
	},
	{ "catppuccin/nvim", name = "catppuccin" },
	{ "rose-pine/neovim", name = "rose-pine" },
	{ "xiyaowong/transparent.nvim" },
	{ "ellisonleao/gruvbox.nvim" },
	{ "blazkowolf/gruber-darker.nvim" },
}
-- `lazy` and `priority` are only needed if this is your primary colorscheme to load it first
-- }
