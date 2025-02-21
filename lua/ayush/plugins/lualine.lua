return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		-- Dragon palette
		local colors = {
			base = "#12120f", -- dragonBlack1
			mantle = "#0d0c0c", -- dragonBlack0
			surface1 = "#282727", -- dragonBlack4
			surface2 = "#393836", -- dragonBlack5
			text = "#c5c9c5", -- dragonWhite
			subtext1 = "#a6a69c", -- dragonGray
			blue = "#8ba4b0", -- dragonBlue2
			violet = "#8992a7", -- dragonViolet
			green = "#87a987", -- dragonGreen
			yellow = "#c4b28a", -- dragonYellow
			red = "#c4746e", -- dragonRed
			aqua = "#8ea4a2", -- dragonAqua
			orange = "#b6927b", -- dragonOrange
			pink = "#a292a3", -- dragonPink
		}

		-- Custom theme using Dragon colors
		local custom_theme = {
			normal = {
				a = { fg = colors.base, bg = colors.violet },
				b = { fg = colors.text, bg = colors.surface2 },
				c = { fg = colors.text, bg = colors.base },
			},
			insert = {
				a = { fg = colors.base, bg = colors.green },
			},
			visual = {
				a = { fg = colors.base, bg = colors.yellow },
			},
			replace = {
				a = { fg = colors.base, bg = colors.red },
			},
			command = {
				a = { fg = colors.base, bg = colors.blue },
			},
			inactive = {
				c = { fg = colors.subtext1, bg = colors.base },
			},
		}

		lualine.setup({
			options = {
				theme = custom_theme,
				icons_enabled = true,
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				disabled_filetypes = { "NvimTree", "packer" },
				globalstatus = true,
			},
			sections = {
				lualine_a = {
					{
						"mode",
						fmt = function(str)
							return string.upper(str)
						end,
						separator = { left = "", right = "" },
						color = { fg = colors.base, bg = colors.violet },
					},
				},
				lualine_b = {
					{
						"branch",
						separator = { left = "", right = "" },
						color = { fg = colors.text, bg = colors.surface2 },
					},
				},
				lualine_c = {
					{
						"filename",
						path = 1,
						color = { fg = colors.yellow, bg = colors.base },
					},
					{
						"location",
						color = { fg = colors.blue, bg = colors.base },
					},
				},
				lualine_x = {
					{
						"encoding",
						separator = { left = "", right = "" },
						color = { fg = colors.subtext1, bg = colors.base },
					},
					{
						"filetype",
						separator = { left = "", right = "" },
						color = { fg = colors.aqua, bg = colors.base },
					},
				},
				lualine_y = {
					{
						"progress",
						separator = { left = "", right = "" },
						color = { fg = colors.base, bg = colors.violet },
					},
				},
				lualine_z = {},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {
					{
						"filename",
						path = 1,
						color = { fg = colors.subtext1, bg = colors.base },
					},
				},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			extensions = {},
		})
	end,
}
