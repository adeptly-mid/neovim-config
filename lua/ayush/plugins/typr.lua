return {
	"nvzone/typr",
	dependencies = { "nvzone/volt" },
	opts = {
		winlayout = "responsive", -- Responsive window layout
		kblayout = "qwerty", -- Keyboard layout (qwerty)
		wpm_goal = 120, -- Words per minute goal
		numbers = false, -- Disable typing numbers
		symbols = false, -- Disable typing symbols
		random = false, -- Disable random mode
		insert_on_start = false, -- Do not enter insert mode on start
		stats_filepath = vim.fn.stdpath("data") .. "/typrstats", -- Path to store stats
		mappings = nil, -- No custom mappings by default
		-- Uncomment the below block to set custom mappings
		-- mappings = function(buf)
		--   vim.keymap.set("n", "a", ":echo 'Custom Mapping'<CR>", { buffer = buf })
		-- end,
	},
	config = function(_, opts)
		require("typr").setup(opts)
	end,
	cmd = { "Typr", "TyprStats" }, -- Commands to trigger the plugin
}
