return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")

		-- One Dark palette
		local colors = {
			base = "#282c34",
			mantle = "#21252b",
			surface1 = "#3e4451",
			surface2 = "#4b5263",
			text = "#abb2bf",
			subtext1 = "#5c6370",
			blue = "#61afef",
			violet = "#c678dd",
			green = "#98c379",
			yellow = "#e5c07b",
			red = "#e06c75",
			aqua = "#56b6c2",
			orange = "#d19a66",
			pink = "#be5046",
		}

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
