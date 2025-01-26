return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")

		-- Define custom highlights for different components
		local custom_theme = {
			normal = {
				a = { fg = "#000000", bg = "#ffffff" }, -- Mode: Black text on white background
				b = { fg = "#ffffff", bg = "#000000" }, -- Branch: White text on black background
				c = { fg = "#ffffff", bg = "#1a1a1a" }, -- Lighter black for other sections
			},
			inactive = {
				c = { fg = "#808080", bg = "#1a1a1a" }, -- Grey text for inactive
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
				-- Mode with left curve and white background
				lualine_a = {
					{
						"mode",
						fmt = function(str)
							return string.upper(str) -- Convert mode to uppercase
						end,
						separator = { left = "", right = "" }, -- Curved start, no end
						color = { fg = "#000000", bg = "#ffffff" }, -- Black text on white
					},
				},
				-- Branch with curved edge at the end
				lualine_b = {
					{
						"branch",
						separator = { left = "", right = "" }, -- No start, curved end
						color = { fg = "#ffffff", bg = "#000000" }, -- White text on black
					},
				},
				-- Filename and components (same background for Top)
				lualine_c = {
					{ "filename", path = 1 },
					{ "location", color = { fg = "#ffffff", bg = "#1a1a1a" } }, -- Top text with unified bg
				},
				-- Encoding and file type with lighter black background
				lualine_x = { "encoding", "filetype" },
				-- Line numbers (right curve only, no left curve)
				lualine_y = {
					{
						"progress",
						separator = { left = "", right = "" }, -- No left curve, curved end
						color = { fg = "#000000", bg = "#ffffff" }, -- Black text on white
					},
				},
				-- No extra sections
				lualine_z = {},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { { "filename", path = 1 } },
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {}, -- No tabline
			extensions = {}, -- No additional extensions
		})

		-- Add padding to the lualine bar
		vim.cmd([[
      hi! LualinePadding guibg=#1a1a1a
      autocmd VimEnter * set laststatus=3
    ]])
	end,
}
