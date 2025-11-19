
-- lua/plugins/telescope.lua
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })

require("telescope").setup({
  defaults = {
    path_display = { "truncate" },
    layout_config = {
      width = 0.9,
      preview_cutoff = 120,
    },
  },
})
