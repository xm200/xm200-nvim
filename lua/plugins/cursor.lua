return {
	{
		"gen740/SmoothCursor.nvim",
		config = function()
			vim.api.nvim_set_hl(0, "SmoothCursor", { fg = "#ff6a00" })
			vim.api.nvim_set_hl(0, "SmoothCursorRed", { fg = "#ff2a00" })
			vim.api.nvim_set_hl(0, "SmoothCursorOrange", { fg = "#ff6a00" })
			vim.api.nvim_set_hl(0, "SmoothCursorYellow", { fg = "#ffb000" })
			vim.api.nvim_set_hl(0, "SmoothCursorGreen", { fg = "#ffd166" })
			vim.api.nvim_set_hl(0, "SmoothCursorAqua", { fg = "#ff8c1a" })
			vim.api.nvim_set_hl(0, "SmoothCursorBlue", { fg = "#ff5a00" })
			vim.api.nvim_set_hl(0, "SmoothCursorPurple", { fg = "#ff3d00" })

			require("smoothcursor").setup({
				type = "exp",
				cursor = "",
				texthl = "SmoothCursor",
				autostart = true,
				always_redraw = true,
				speed = 35,
				intervals = 20,
				threshold = 1,
				disable_float_win = true,
				fancy = {
					enable = true,
					head = { cursor = "▷", texthl = "SmoothCursorYellow" },
					body = {
						{ cursor = "󰝥", texthl = "SmoothCursorRed" },
						{ cursor = "󰝥", texthl = "SmoothCursorOrange" },
						{ cursor = "●", texthl = "SmoothCursorYellow" },
						{ cursor = "●", texthl = "SmoothCursorAqua" },
						{ cursor = "•", texthl = "SmoothCursorBlue" },
					},
					tail = { cursor = nil, texthl = "SmoothCursor" },
				},
			})
		end,
	},
}
