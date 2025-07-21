return {
	"hedyhli/outline.nvim",
	lazy = true,
	cmd = { "Outline", "OutlineClose" },
	keys = {
		{ "<leader>o", "<cmd>Outline<CR>", desc = "Toggle Outline" },
	},
	config = function()
		-- Example custom icons. if you have nvim-web-devicons, it will use them automatically
		local icons = {
			File = { icon = "󰈙", hl = "Identifier" },
			Module = { icon = "󰆧", hl = "Include" },
			Namespace = { icon = "󰅩", hl = "Include" },
			Package = { icon = "󰏗", hl = "Include" },
			Class = { icon = "𝓒", hl = "Type" },
			Method = { icon = "ƒ", hl = "Function" },
			Property = { icon = "󰆧", hl = "Identifier" },
			Field = { icon = "󰆧", hl = "Identifier" },
			Constructor = { icon = "", hl = "Special" },
			Enum = { icon = "ℰ", hl = "Type" },
			Interface = { icon = "󰜰", hl = "Type" },
			Function = { icon = "", hl = "Function" },
			Variable = { icon = "", hl = "Identifier" },
			Constant = { icon = "", hl = "Constant" },
			String = { icon = "𝓐", hl = "String" },
			Number = { icon = "", hl = "Number" },
			Boolean = { icon = "⊨", hl = "Boolean" },
			Array = { icon = "󰅪", hl = "Type" },
			Object = { icon = "⦿", hl = "Type" },
			Key = { icon = "🔐", hl = "Type" },
			Null = { icon = "NULL", hl = "Special" },
			EnumMember = { icon = "", hl = "Identifier" },
			Struct = { icon = "𝓢", hl = "Type" },
			Event = { icon = "🗲", hl = "Type" },
			Operator = { icon = "󰆕", hl = "Operator" },
			TypeParameter = { icon = "𝙏", hl = "Type" },
		}

		require("outline").setup({
			-- Your setup opts here
			outline_window = {
				-- When the outline window is opened, it will not take focus.
				focus_on_open = false,
			},
			symbols = {
				-- Set custom icons.
				-- To get the best results, ensure you have a "Nerd Font" installed.
				icons = icons,
			},
			-- By default, the outline panel will close by itself when you leave the buffer.
			auto_close = true,
		})

		-- The keymap is defined in the `keys` table above for lazy.nvim,
		-- but you could also define it here like in your reference:
		--
		-- local keymap = vim.keymap
		-- keymap.set("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })
	end,
}
