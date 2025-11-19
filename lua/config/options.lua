
-- lua/config/options.lua
-- Basic Neovim settings and sane defaults

local opt = vim.opt
local g = vim.g

-----------------------------------------------------------
-- General
-----------------------------------------------------------
vim.opt.mouse = "a"                         -- enable mouse support
opt.clipboard = "unnamedplus"           -- use system clipboard
opt.swapfile = false                    -- don’t use swap files
opt.backup = false                      -- don’t create backup files
opt.undofile = true                     -- persistent undo
opt.timeoutlen = 400                    -- faster mapped sequence timeout
opt.updatetime = 250                    -- faster completion

-----------------------------------------------------------
-- UI
-----------------------------------------------------------
opt.number = true                       -- show line numbers
opt.relativenumber = true               -- relative line numbers
opt.cursorline = true                   -- highlight current line
opt.signcolumn = "yes"                  -- always show sign column
opt.termguicolors = true                -- enable true color support
opt.wrap = false                        -- no line wrap
opt.scrolloff = 8                       -- keep cursor away from edges
opt.sidescrolloff = 8                   -- same for horizontal scrolling
opt.showmode = false                    -- don’t show mode (lualine handles that)

-----------------------------------------------------------
-- Indentation
-----------------------------------------------------------
opt.expandtab = true                    -- use spaces instead of tabs
opt.shiftwidth = 2                      -- shift 2 spaces when indenting
opt.tabstop = 2                         -- 1 tab == 2 spaces
opt.smartindent = true                  -- smart indentation
opt.autoindent = true                   -- maintain indent from previous line

-----------------------------------------------------------
-- Searching
-----------------------------------------------------------
opt.ignorecase = true                   -- ignore case in searches...
opt.smartcase = true                    -- ...unless uppercase present
opt.incsearch = true                    -- incremental search
opt.hlsearch = false                    -- don’t highlight search matches by default

-----------------------------------------------------------
-- Splits
-----------------------------------------------------------
opt.splitright = true                   -- vertical split to the right
opt.splitbelow = true                   -- horizontal split below

-----------------------------------------------------------
-- Appearance tweaks
-----------------------------------------------------------
opt.cmdheight = 1                       -- minimal command line height
opt.laststatus = 3                      -- global statusline
opt.fillchars = { eob = " " }           -- hide ~ on empty lines
opt.pumheight = 10                      -- pop-up menu height
opt.conceallevel = 2                    -- conceal formatting characters
opt.showtabline = 1                     -- show tabline when multiple tabs open

-----------------------------------------------------------
-- Misc
-----------------------------------------------------------
g.mapleader = " "                       -- space as leader key
g.loaded_netrw = 1                      -- disable netrw (for nvim-tree)
g.loaded_netrwPlugin = 1
