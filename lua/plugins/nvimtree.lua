
-- lua/config/nvim-tree.lua
-- Configuration for nvim-tree file explorer

-- Recommended settings from nvim-tree docs
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  sort = { sorter = "case_sensitive" },
  view = {
    width = 30,
    side = "left",
  },
  renderer = {
    group_empty = true,
    highlight_git = true,
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
    },
  },
  filters = {
    dotfiles = false,
  },
  git = {
    enable = true,
    ignore = false,
  },
  actions = {
    open_file = {
      quit_on_open = false,
      resize_window = true,
    },
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
})
