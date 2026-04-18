
-- lua/config/keymaps.lua
local map  = vim.keymap.set
local opts = { noremap = true, silent = true }

---------------------------------------------------------------------------
-- General
---------------------------------------------------------------------------
map("n", "<leader>nh", ":nohl<CR>",  opts)

---------------------------------------------------------------------------
-- Window management
---------------------------------------------------------------------------
map("n", "<leader>sv", "<C-w>v",     opts)   -- split vertical
map("n", "<leader>sx", ":close<CR>", opts)   -- close split

-- Navigate splits
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Resize splits
map("n", "<leader>+", ":resize +2<CR>",          { desc = "Increase height" })
map("n", "<leader>-", ":resize -2<CR>",          { desc = "Decrease height" })
map("n", "<leader><", ":vertical resize -2<CR>", { desc = "Decrease width" })
map("n", "<leader>>", ":vertical resize +2<CR>", { desc = "Increase width" })

---------------------------------------------------------------------------
-- Hydra live coding
---------------------------------------------------------------------------
local hydra_send = function(code)
    local script = vim.fn.expand("~/Desktop/sc/hecker/hydra-eval.sh")
    vim.fn.system("bash " .. script, code)
end

-- visual: eval selection
map("v", "<leader>he", function()
    local s = vim.fn.line("'<") - 1
    local e = vim.fn.line("'>")
    local lines = vim.api.nvim_buf_get_lines(0, s, e, false)
    hydra_send(table.concat(lines, "\n"))
end, { desc = "Hydra: eval selection" })

-- normal: eval paragraph (between blank lines)
map("n", "<leader>he", function()
    vim.cmd("normal! yip")
    hydra_send(vim.fn.getreg('"'))
end, { desc = "Hydra: eval paragraph" })

---------------------------------------------------------------------------
-- Plugins
---------------------------------------------------------------------------
map("n", "<leader>e",  ":NvimTreeToggle<CR>",       opts)
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<leader>fg", ":Telescope live_grep<CR>",  opts)
