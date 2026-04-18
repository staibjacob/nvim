
-- File: lua/plugins/treesitter.lua
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "haskell",
        "lua",
        "vim",
        "vimdoc",
        "bash",
        "json",
        "yaml",
        "html",
        "css",
        "javascript",
        "typescript",
      },

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },

      indent = { enable = true },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection    = "<C-space>",
          node_incremental  = "<C-space>",
          scope_incremental = "<C-s>",
          node_decremental  = "<M-space>",
        },
      },
    })
  end,
}
