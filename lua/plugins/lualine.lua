return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"bluz71/vim-moonfly-colors",
	},
	config = function()
		local palette = require("moonfly").palette

		local theme = {
			normal = {
				a = { fg = palette.bg, bg = palette.blue },
				b = { fg = palette.fg, bg = palette.bg_alt },
				c = { fg = palette.fg, bg = palette.bg },
			},
			insert = {
				a = { fg = palette.bg, bg = palette.green },
			},
			visual = {
				a = { fg = palette.bg, bg = palette.magenta },
			},
			replace = {
				a = { fg = palette.bg, bg = palette.red },
			},
			command = {
				a = { fg = palette.bg, bg = palette.yellow },
			},
			inactive = {
				a = { fg = palette.grey, bg = palette.bg },
				b = { fg = palette.grey, bg = palette.bg },
				c = { fg = palette.grey, bg = palette.bg },
			},
		}

		require("lualine").setup({
			options = {
				theme = theme,
				globalstatus = true,
				section_separators = "",
				component_separators = "",
			},

			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = { { "filename", path = 1 } },

				lualine_x = { "diagnostics", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		})
	end,
}
