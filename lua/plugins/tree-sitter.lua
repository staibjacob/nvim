
-- lua/config/treesitter.lua
-- Treesitter configuration for better syntax highlighting and code parsing

require("nvim-treesitter.configs").setup({
  -- Languages you want parsers for
  ensure_installed = {
    "lua",
    "vim",
    "vimdoc",
    "bash",
    "python",
    "javascript",
    "typescript",
    "html",
    "css",
    "json",
    "yaml",
    "markdown",
    "markdown_inline",
    "haskell",
    "supercollider",
  },

  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  indent = { enable = true },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
})

-- Optional fix for Telescope preview highlighting crash
vim.api.nvim_create_autocmd("FileType", {
  pattern = "TelescopeResults",
  callback = function()
    vim.opt_local.syntax = "off"
  end,
})
