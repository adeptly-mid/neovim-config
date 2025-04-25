-- Set leader key
vim.g.mapleader = " "

-- Keymap function and options
local map = vim.api.nvim_set_keymap
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- ====================
-- Buffer Navigation
-- ====================
map("n", "<leader>bp", "<Cmd>BufferPrevious<CR>", opts)
map("n", "<leader>bn", "<Cmd>BufferNext<CR>", opts)

-- Goto buffer by number
for i = 1, 9 do
	map("n", "<leader>b" .. i, "<Cmd>BufferGoto " .. i .. "<CR>", opts)
end
map("n", "<leader>b0", "<Cmd>BufferLast<CR>", opts)

-- Pin, close, pick buffers
map("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)
map("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)
map("n", "<C-p>", "<Cmd>BufferPick<CR>", opts)

-- Sort buffers
map("n", "<leader>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
map("n", "<leader>bd", "<Cmd>BufferOrderByDirectory<CR>", opts)
map("n", "<leader>bl", "<Cmd>BufferOrderByLanguage<CR>", opts)
map("n", "<leader>bw", "<Cmd>BufferOrderByWindowNumber<CR>", opts)
map("n", "<leader>bn", "<Cmd>BufferOrderByName<CR>", opts)

-- ====================
-- General Shortcuts
-- ====================
keymap.set("n", "<C-q>", "@q", { noremap = true, silent = false })
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set("n", ";", ":", { noremap = true, silent = false })
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })
keymap.set("n", "zz", "<cmd>bd!<CR>", { desc = "Close current buffer" })

-- ====================
-- Window Management
-- ====================
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Resize windows
keymap.set("n", "<leader>w+", ":vertical resize +10<CR>", opts)
keymap.set("n", "<leader>w-", ":vertical resize -10<CR>", opts)

-- ====================
-- Tab Management
-- ====================
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- ====================
-- Terminal
-- ====================
keymap.set("n", "<leader>tv", "<cmd>vsplit | terminal<CR>", { desc = "Open terminal in vertical split" })

-- ====================
-- LSP Keybindings
-- ====================
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "java", "lua", "python", "typescript", "javascript" }, -- add your supported LSP filetypes
	callback = function()
		local opts = { noremap = true, silent = true, buffer = true }
		keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		keymap.set("n", "gr", vim.lsp.buf.references, opts)
		keymap.set("n", "K", vim.lsp.buf.hover, opts)
		keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
	end,
})
