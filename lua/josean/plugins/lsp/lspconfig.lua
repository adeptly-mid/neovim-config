return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		-- Import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- Import mason_lspconfig plugin
		local mason_lspconfig = require("mason-lspconfig")

		-- Import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap -- for conciseness

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf, silent = true }

				-- Set keybinds
				opts.desc = "Show LSP references"
				keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- Show definition, references

				opts.desc = "Go to declaration"
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- Go to declaration

				opts.desc = "Show LSP definitions"
				keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- Show LSP definitions

				opts.desc = "Show LSP implementations"
				keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- Show LSP implementations

				opts.desc = "Show LSP type definitions"
				keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- Show LSP type definitions

				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- See available code actions, in visual mode will apply to selection

				opts.desc = "Smart rename"
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- Smart rename

				opts.desc = "Show buffer diagnostics"
				keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- Show diagnostics for file

				opts.desc = "Show line diagnostics"
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- Show diagnostics for line

				opts.desc = "Go to previous diagnostic"
				keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- Jump to previous diagnostic in buffer

				opts.desc = "Go to next diagnostic"
				keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- Jump to next diagnostic in buffer

				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "K", vim.lsp.buf.hover, opts) -- Show documentation for what is under cursor

				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- Mapping to restart LSP if necessary
			end,
		})

		-- Used to enable autocompletion (assign to every LSP server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		mason_lspconfig.setup_handlers({
			-- Default handler for installed servers
			function(server_name)
				if lspconfig[server_name] then
					lspconfig[server_name].setup({
						capabilities = capabilities,
					})
				else
					vim.notify("LSP server " .. server_name .. " is not available.", vim.log.levels.WARN)
				end
			end,
			-- Specific configurations for certain servers
			["svelte"] = function()
				if lspconfig.svelte then
					lspconfig.svelte.setup({
						capabilities = capabilities,
						on_attach = function(client, bufnr)
							vim.api.nvim_create_autocmd("BufWritePost", {
								pattern = { "*.js", "*.ts" },
								callback = function(ctx)
									-- Use ctx.match instead of ctx.file
									client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
								end,
							})
						end,
					})
				else
					vim.notify("LSP server svelte is not available.", vim.log.levels.WARN)
				end
			end,
			["graphql"] = function()
				if lspconfig.graphql then
					lspconfig.graphql.setup({
						capabilities = capabilities,
						filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
					})
				else
					vim.notify("LSP server graphql is not available.", vim.log.levels.WARN)
				end
			end,
			["emmet_ls"] = function()
				if lspconfig.emmet_ls then
					lspconfig.emmet_ls.setup({
						capabilities = capabilities,
						filetypes = {
							"html",
							"typescriptreact",
							"javascriptreact",
							"css",
							"sass",
							"scss",
							"less",
							"svelte",
						},
					})
				else
					vim.notify("LSP server emmet_ls is not available.", vim.log.levels.WARN)
				end
			end,
			["lua_ls"] = function()
				if lspconfig.lua_ls then
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								-- Make the language server recognize "vim" global
								diagnostics = {
									globals = { "vim" },
								},
								completion = {
									callSnippet = "Replace",
								},
							},
						},
					})
				else
					vim.notify("LSP server lua_ls is not available.", vim.log.levels.WARN)
				end
			end,
		})
	end,
}
