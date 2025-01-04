return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")

		-- Lualine setup without custom colors
		lualine.setup({
			options = {
				theme = "auto",
				icons_enabled = true, -- Keep icons
				section_separators = { left = "", right = "" }, -- Clean separators
				component_separators = { left = "", right = "" }, -- Subtle component separators
				disabled_filetypes = { "NvimTree", "packer" }, -- Disable in certain windows
			},
			sections = {
				-- Vim mode without custom highlight
				lualine_a = {
					{
						"mode",
						fmt = function(str)
							return string.upper(str) -- Convert mode to uppercase
						end,
					},
				},
				lualine_b = { "branch", "diff" }, -- Git branch and diffs
				lualine_c = { { "filename", path = 1 } }, -- Full file path
				lualine_x = { "encoding", "fileformat", "filetype" }, -- Encoding, fileformat, filetype
				lualine_y = { "progress" }, -- File progress
				lualine_z = { "location" }, -- Cursor location (line/column)
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { { "filename", path = 1 } }, -- Full path in inactive windows
				lualine_x = { "location" }, -- Show location (line/column)
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {}, -- Skip tabline
			extensions = { "fugitive", "quickfix" }, -- Extensions for Git and quickfixes
		})
	end,
}
