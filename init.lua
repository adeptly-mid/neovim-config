require("josean.core")
require("josean.lazy")

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

-- Set cursor to transparent block in normal mode and solid block in insert mode
-- Set cursor to solid block in normal mode and blinking block in insert mode
vim.o.guicursor = "n-v-c:block,i:block-blinkon20-blinkoff15-blinkwait10"
-- Set the transparency for the Normal mode cursor
vim.cmd([[highlight Cursor guifg=NONE guibg=#1c1c1c]])

-- Load the kanagawa-paper colorscheme
vim.cmd([[colorscheme roseprime]])
