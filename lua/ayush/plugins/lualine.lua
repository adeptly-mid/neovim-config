return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		-- Kanagawa-inspired colors
		local colors = {
			sumiInk1 = "#1F1F28", -- dark background
			sumiInk2 = "#2A2A37", -- lighter background
			oldWhite = "#C8C093", -- muted white
			fujiWhite = "#DCD7BA", -- brighter white
			springGreen = "#98BB6C", -- soft green
			crystalBlue = "#7E9CD8", -- muted blue
			autumnYellow = "#DCA561", -- warm yellow
			sakuraPink = "#D27E99", -- soft pink
			waveBlue = "#223249", -- dark blue
			oniViolet = "#957FB8", -- muted purple
		}

		local custom_theme = {
			normal = {
				a = { fg = colors.sumiInk1, bg = colors.springGreen }, -- Mode
				b = { fg = colors.fujiWhite, bg = colors.waveBlue }, -- Branch
				c = { fg = colors.oldWhite, bg = colors.sumiInk1 }, -- General sections
			},
			inactive = {
				c = { fg = colors.sumiInk2, bg = colors.sumiInk1 },
			},
		}

		lualine.setup({
			options = {
				theme = custom_theme,
				icons_enabled = true,
				section_separators = "",
				component_separators = "",
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
						color = { fg = colors.sumiInk1, bg = colors.springGreen },
					},
				},
				lualine_b = {
					{
						"branch",
						separator = { left = "", right = "" },
						color = { fg = colors.fujiWhite, bg = colors.waveBlue },
					},
				},
				lualine_c = {
					{
						"filename",
						path = 1,
						color = { fg = colors.autumnYellow, bg = colors.sumiInk1 },
					},
					{
						"location",
						color = { fg = colors.crystalBlue, bg = colors.sumiInk1 },
					},
				},
				lualine_x = {
					{
						"encoding",
						color = { fg = colors.oldWhite, bg = colors.sumiInk1 },
					},
					{
						"filetype",
						color = { fg = colors.sakuraPink, bg = colors.sumiInk1 },
					},
				},
				lualine_y = {
					{
						"progress",
						separator = { left = "", right = "" },
						color = { fg = colors.sumiInk1, bg = colors.springGreen },
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
						color = { fg = colors.sumiInk2, bg = colors.sumiInk1 },
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
