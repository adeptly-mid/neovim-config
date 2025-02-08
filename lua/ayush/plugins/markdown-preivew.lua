return {
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
		init = function()
			-- Set default filetypes
			vim.g.mkdp_filetypes = { "markdown" }

			-- Don't auto-start preview
			vim.g.mkdp_auto_start = 0

			-- Don't auto-close preview when changing buffers
			vim.g.mkdp_auto_close = 0

			-- Refresh preview on write, leave insert mode, or cursor moved
			vim.g.mkdp_refresh_slow = 0

			-- Set default browser (empty string means default system browser)
			vim.g.mkdp_browser = ""

			-- Set preview page title
			vim.g.mkdp_page_title = "「${name}」"

			-- Enable sync scrolling
			vim.g.mkdp_preview_options = {
				sync_scroll_type = "middle",
				disable_sync_scroll = 0,
				disable_filename = 0,
			}

			-- Port setting (0 means random port)
			vim.g.mkdp_port = ""

			-- Preview page url format
			vim.g.mkdp_preview_options = {
				mkit = {},
				katex = {},
				uml = {},
				maid = {},
				disable_sync_scroll = 0,
				sync_scroll_type = "middle",
			}

			-- Enable markdown extensions
			vim.g.mkdp_markdown_css = ""
			vim.g.mkdp_highlight_css = ""
			vim.g.mkdp_theme = "dark"
		end,
	},
}
