return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
		"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
	},
	event = { "BufReadPre", "BufNewFile" },
	version = "^1.0.0", -- optional: only update when a new 1.x version is released
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	main = "barbar",
	opts = {
		-- animation = true,
		-- insert_at_start = true,
		-- …etc.
	},
}
