return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
		"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	config = function()
		-- Barbar setup
		require("barbar").setup({
			animation = true,
			insert_at_start = true,
			-- Add more options as needed
		})

		-- Key mappings
		local map = vim.api.nvim_set_keymap
		local opts = { noremap = true, silent = true }
		-- Adjust the active tab's highlight to match your background
		local bg_color = "#1e1e1e" -- Replace with your background color
		local fg_color = "#cccccc" -- Replace with your desired text color

		vim.api.nvim_set_hl(0, "BufferCurrentIcon", { fg = fg_color, bg = bg_color, default = true })
		vim.api.nvim_set_hl(0, "BufferInactiveIcon", { fg = fg_color, bg = bg_color, default = true })
		vim.api.nvim_set_hl(0, "BufferVisibleIcon", { fg = fg_color, bg = bg_color, default = true })
		-- Set highlights
		vim.api.nvim_set_hl(0, "BufferCurrent", { fg = fg_color, bg = bg_color })
		vim.api.nvim_set_hl(0, "BufferCurrentIndex", { fg = fg_color, bg = bg_color })
		vim.api.nvim_set_hl(0, "BufferCurrentMod", { fg = fg_color, bg = bg_color })
		vim.api.nvim_set_hl(0, "BufferCurrentSign", { fg = fg_color, bg = bg_color })
		vim.api.nvim_set_hl(0, "BufferCurrentIcon", { fg = fg_color, bg = bg_color })
		vim.api.nvim_set_hl(0, "BufferCurrentTarget", { fg = fg_color, bg = bg_color })
		-- Move to next/previous buffer with <Space>bn and <Space>bp
		map("n", "<Space>bn", "<Cmd>BufferNext<CR>", opts)
		map("n", "<Space>bp", "<Cmd>BufferPrevious<CR>", opts)

		-- Goto buffer in position with <Space>b<number>
		map("n", "<Space>b1", "<Cmd>BufferGoto 1<CR>", opts)
		map("n", "<Space>b2", "<Cmd>BufferGoto 2<CR>", opts)
		map("n", "<Space>b3", "<Cmd>BufferGoto 3<CR>", opts)
		map("n", "<Space>b4", "<Cmd>BufferGoto 4<CR>", opts)
		map("n", "<Space>b5", "<Cmd>BufferGoto 5<CR>", opts)
		map("n", "<Space>b6", "<Cmd>BufferGoto 6<CR>", opts)
		map("n", "<Space>b7", "<Cmd>BufferGoto 7<CR>", opts)
		map("n", "<Space>b8", "<Cmd>BufferGoto 8<CR>", opts)
		map("n", "<Space>b9", "<Cmd>BufferGoto 9<CR>", opts)
		map("n", "<Space>b0", "<Cmd>BufferLast<CR>", opts)

		-- Pin/unpin buffer with <Space>bp
		map("n", "<Space>bm", "<Cmd>BufferPin<CR>", opts)

		-- Magic buffer-picking mode
		map("n", "<C-p>", "<Cmd>BufferPick<CR>", opts)

		-- Sort automatically by...
		map("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
		map("n", "<Space>bn", "<Cmd>BufferOrderByName<CR>", opts)
		map("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", opts)
		map("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", opts)
		map("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", opts)
	end,
	version = "^1.0.0", -- optional: only update when a new 1.x version is released
}
