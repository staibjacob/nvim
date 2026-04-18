return {

  ---------------------------------------------------------------------------
  -- FILE TREE
  ---------------------------------------------------------------------------
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        sort_by = "case_sensitive",
        view    = { width = 35, side = "left" },
        renderer = { group_empty = true },
        filters  = { dotfiles = false },
      })
    end,
  },

  ---------------------------------------------------------------------------
  -- TELESCOPE
  ---------------------------------------------------------------------------
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  ---------------------------------------------------------------------------
  -- INDENT GUIDES
  ---------------------------------------------------------------------------
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("ibl").setup({
        indent = { char = "│" },
        scope  = { enabled = true, show_start = false, show_end = false },
      })
    end,
  },

  ---------------------------------------------------------------------------
  -- STATUSLINE (lualine)
  ---------------------------------------------------------------------------
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme                = "auto",
          section_separators   = "",
          component_separators = "",
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { "filename" },
          lualine_x = { "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
  },

  ---------------------------------------------------------------------------
  -- WHICH-KEY
  ---------------------------------------------------------------------------
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")
      wk.setup({ delay = 400 })
      wk.add({
        { "<leader>s", group = "SuperCollider" },
        { "<leader>o", group = "Sapf" },
        { "<leader>k", group = "Tidal" },
        { "<leader>x", group = "Diagnostics" },
        { "<leader>e", desc = "File tree" },
        { "<leader>u", desc = "Undo tree" },
      })
    end,
  },

}
