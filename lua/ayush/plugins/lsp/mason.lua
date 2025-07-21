return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"ts_ls",
				"html",
				"cssls",
				"tailwindcss",
				"svelte",
				"lua_ls",
				"graphql",
				"emmet_ls",
				"prismals",
				"pyright",
				-- Add Go language server (gopls)
				"gopls",
				"harper_ls",
				"clangd",
				"marksman",
				"jdtls",
				"ast_grep",
				"solang",
				"solc",
				"solidity_ls",
				"solidity_ls_nomicfoundation",
				"css_variables",
				"cssmodules_ls",
				"unocss",
				"lwc_ls",
				"templ",
				"hydra_lsp",
				"spectral",
				"yamlls",
				"lemminx",
				"taplo",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"isort", -- python formatter
				"black", -- python formatter
				"pylint",
				"eslint_d",
				-- Add Go tools
				"golangci_lint_ls", -- Go linter
				"yamlfmt",
				"yamllint",
				"yamlfix",
			},
		})
	end,
}
