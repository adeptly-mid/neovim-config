require("ayush.core.init")
require("ayush.lazy")

-- Enable true color support
vim.o.termguicolors = true

-- Set the background color to dark
vim.o.background = "dark"

-- Optionally set a softer black as the background color
vim.cmd([[highlight Normal guibg=#1c1c1c]])

-- Optional settings for the kanagawa-paper colorscheme
-- Uncomment these if you want bold styles and transparency
-- vim.g.rasmus_bold_comments = true
-- vim.g.rasmus_bold_keywords = true
-- vim.g.rasmus_bold_booleans = true
-- vim.g.rasmus_bold_functions = true
-- vim.g.rasmus_bold_variables = true
-- vim.g.rasmus_transparent = true

-- Set cursor to solid orange block in all modes
vim.o.guicursor = "n-v-c:block-Cursor,i:block-Cursor"

vim.cmd([[highlight Cursor guifg=white guibg=#78b4dc]])
-- Set the Visual highlight group for selected text with lighter white
vim.cmd([[highlight Visual guifg=NONE guibg=#cdcdcd]]) -- Load the kanagawa-paper colorscheme
vim.cmd([[colorscheme roseprime]])
