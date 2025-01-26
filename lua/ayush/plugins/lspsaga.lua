return {
	"nvimdev/lspsaga.nvim",
	event = "BufRead", -- Load Lspsaga on buffer read
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- Optional for better syntax parsing
		"nvim-tree/nvim-web-devicons", -- Optional for icons
	},
	config = function()
		local saga = require("lspsaga")

		saga.setup({
			-- Breadcrumbs settings
			symbol_in_winbar = {
				enable = true, -- Enable breadcrumbs
				separator = "  ", -- Separator symbol
				hide_keyword = true, -- Hide LSP keywords (e.g., 'function')
				show_file = true, -- Include filename in breadcrumbs
				color_mode = true, -- Enable highlighting for breadcrumbs
			},
			-- UI customization
			ui = {
				border = "rounded", -- Use rounded borders for all UI components
			},
			-- Code action settings
			code_action = {
				show_server_name = true, -- Show server name in code actions
				extend_gitsigns = true, -- Extend Gitsigns integration
			},
			-- Lightbulb settings
			lightbulb = {
				enable = true, -- Enable lightbulb indicator
				sign = true,
				virtual_text = false,
			},
			-- Diagnostics settings
			diagnostic = {
				show_code_action = true,
				show_source = true,
				border_follow_cursor = true,
			},
		})

		-- Keybindings for Lspsaga (Optional)
		vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true, noremap = true })
		vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { silent = true, noremap = true })
		vim.keymap.set("n", "<leader>sd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true, noremap = true })
		vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true, noremap = true })
		vim.keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true, noremap = true })
	end,
}
