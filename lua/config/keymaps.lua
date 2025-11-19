
-- Custom keymaps for Neovim
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-----------------------------------------------------------
-- General
-----------------------------------------------------------

vim.g.mapleader = " "

-- Clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", opts)

-----------------------------------------------------------
-- Window management
-----------------------------------------------------------

-- Split window vertically
keymap.set("n", "<leader>sv", "<C-w>v", opts)

-- Close current split
keymap.set("n", "<leader>sx", ":close<CR>", opts)

-- Navigate splits with Ctrl + hjkl
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)

-----------------------------------------------------------
-- Plugins
-----------------------------------------------------------

-- NvimTree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", opts)



vim.keymap.set("n", "<leader>+", ":resize +2<CR>", { desc = "Increase height" })
vim.keymap.set("n", "<leader>-", ":resize -2<CR>", { desc = "Decrease height" })
vim.keymap.set("n", "<leader><", ":vertical resize -2<CR>", { desc = "Decrease width" })
vim.keymap.set("n", "<leader>>", ":vertical resize +2<CR>", { desc = "Increase width" })





