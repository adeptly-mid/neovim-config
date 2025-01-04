-- Set leader key
vim.g.mapleader = " "

-- Keymap function and options
local map = vim.api.nvim_set_keymap
local keymap = vim.keymap -- for conciseness
local opts = { noremap = true, silent = true }

-- Buffer navigation shortcuts
-- Move to previous/next buffer
map("n", "<leader>tp", "<Cmd>BufferPrevious<CR>", opts)
map("n", "<leader>tn", "<Cmd>BufferNext<CR>", opts)

-- Goto buffer in position...
map("n", "<leader>t1", "<Cmd>BufferGoto 1<CR>", opts)
map("n", "<leader>t2", "<Cmd>BufferGoto 2<CR>", opts)
map("n", "<leader>t3", "<Cmd>BufferGoto 3<CR>", opts)
map("n", "<leader>t4", "<Cmd>BufferGoto 4<CR>", opts)
map("n", "<leader>t5", "<Cmd>BufferGoto 5<CR>", opts)
map("n", "<leader>t6", "<Cmd>BufferGoto 6<CR>", opts)
map("n", "<leader>t7", "<Cmd>BufferGoto 7<CR>", opts)
map("n", "<leader>t8", "<Cmd>BufferGoto 8<CR>", opts)
map("n", "<leader>t9", "<Cmd>BufferGoto 9<CR>", opts)
map("n", "<leader>t0", "<Cmd>BufferLast<CR>", opts)

-- Pin/unpin buffer
map("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)

-- Close buffer
map("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)

-- Magic buffer-picking mode
map("n", "<C-p>", "<Cmd>BufferPick<CR>", opts)

-- Sort buffers automatically
map("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
map("n", "<Space>bn", "<Cmd>BufferOrderByName<CR>", opts)
map("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", opts)
map("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", opts)
map("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", opts)

-- General keybindings
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", ";", ":", { noremap = true, silent = false })
-- Increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- Window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Tab management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Terminal management
keymap.set("n", "<leader>tv", "<cmd>vsplit | terminal<CR>", { desc = "Open terminal in vertical split" })

-- Close current buffer
keymap.set("n", "zz", "<cmd>bd!<CR>", { desc = "Close current buffer" })

keymap.set("n", "<leader>w+", ":vertical resize +10<CR>", { noremap = true, silent = true }) -- Increase width
keymap.set("n", "<leader>w-", ":vertical resize -10<CR>", { noremap = true, silent = true }) -- Decrease width
