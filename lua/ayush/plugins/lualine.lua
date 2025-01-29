return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")

		-- Define custom highlights for different components
		local custom_theme = {
			normal = {
				a = { fg = "#121416", bg = "#8faf77" }, -- Mode: Dark text on greenish background
				b = { fg = "#ffffff", bg = "#5e81ac" }, -- Branch: White text on blue-gray background
				c = { fg = "#c8ccd4", bg = "#121416" }, -- Dark background for general sections
			},
			inactive = {
				c = { fg = "#646477", bg = "#121416" }, -- Gray text for inactive sections
			},
		}

		lualine.setup({
			options = {
				theme = custom_theme,
				icons_enabled = true,
				section_separators = "", -- No separators between sections
				component_separators = "", -- No separators between components
				disabled_filetypes = { "NvimTree", "packer" },
				globalstatus = true, -- Enables one unified lualine bar for all windows
			},
			sections = {
				-- Mode with left curve and greenish background
				lualine_a = {
					{
						"mode",
						fmt = function(str)
							return string.upper(str) -- Convert mode to uppercase
						end,
						separator = { left = "", right = "" }, -- Curved start, no end
						color = { fg = "#121416", bg = "#8faf77" }, -- Dark text on green
					},
				},
				-- Branch with curved edge at the end
				lualine_b = {
					{
						"branch",
						separator = { left = "", right = "" }, -- No start, curved end
						color = { fg = "#ffffff", bg = "#5e81ac" }, -- White text on blue-gray
					},
				},
				-- Filename and components
				lualine_c = {
					{
						"filename",
						path = 1,
						color = { fg = "#e5c07b", bg = "#121416" }, -- Golden text for filenames
					},
					{
						"location",
						color = { fg = "#56b6c2", bg = "#121416" }, -- Blue text for locations
					},
				},
				-- Encoding and file type
				lualine_x = {
					{
						"encoding",
						color = { fg = "#c8ccd4", bg = "#121416" },
					},
					{
						"filetype",
						color = { fg = "#d19a66", bg = "#121416" }, -- Orange tint for filetypes
					},
				},
				-- Line numbers (right curve only, no left curve)
				lualine_y = {
					{
						"progress",
						separator = { left = "", right = "" }, -- No left curve, curved end
						color = { fg = "#121416", bg = "#8faf77" }, -- Dark text on green
					},
				},
				-- No extra sections
				lualine_z = {},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {
					{
						"filename",
						path = 1,
						color = { fg = "#646477", bg = "#121416" },
					},
				},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {}, -- No tabline
			extensions = {}, -- No additional extensions
		})
	end,
}
