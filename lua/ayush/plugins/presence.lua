return {
	"andweeb/presence.nvim",
	config = function()
		require("presence"):setup({
			auto_update = true, -- Update Discord status every time you enter or leave Neovim
			neovim_image_text = "Neovim", -- Custom text for the Neovim image in Discord
			main_image = "neovim", -- Main image to show in the Discord status (options: "neovim" or "file")
			client_id = "793271441293967371", -- Client ID for Neovim's rich presence application

			-- Customizing what to display in the Discord presence
			log_level = nil, -- Log level, nil to disable logging
			debounce_timeout = 10, -- Number of seconds to wait before sending an update to Discord
			enable_line_number = false, -- Disable displaying the line number in the Discord status
			blacklist = {}, -- Ignore specific file types from being shown in Discord presence
			buttons = true, -- Show the "working on" button on Discord status

			-- Custom messages when editing different types of files
			editing_text = "Editing %s", -- Customize editing status message (format with %s for file name)
			file_explorer_text = "Browsing %s", -- Customize file explorer status message
			git_commit_text = "Committing changes", -- Customize Git commit status message
			plugin_manager_text = "Managing plugins", -- Customize plugin manager status message
			reading_text = "Reading %s", -- Customize reading status message (for read-only files)
			workspace_text = "Working in %s", -- Customize workspace status message (format with %s for file name)
			line_number_text = "Line %s", -- Customize line number status message (format with %s for line number)
		})
	end,
}
