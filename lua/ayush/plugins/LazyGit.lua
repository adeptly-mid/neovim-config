return {
	"kdheepak/lazygit.nvim",
	-- optional for floating window border decoration
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
	},
	-- setting the keymap is the most important part
	keys = {
		{ "<leader>gg", "<cmd>LazyGit<CR>", desc = "LazyGit" },
	},
	-- For this plugin, the default configuration is excellent, so a `config`
	-- function is not required unless you want to customize it.
	-- For example, if you want to use a bottom terminal instead of a floating window:
	--
	-- config = function()
	--   vim.g.lazygit_layout = 'term_below' -- or 'term_left', 'term_right'
	-- end,
}
