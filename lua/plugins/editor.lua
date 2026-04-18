return {

  ---------------------------------------------------------------------------
  -- GIT SIGNS
  ---------------------------------------------------------------------------
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({})
    end,
  },

  ---------------------------------------------------------------------------
  -- AUTOPAIRS
  ---------------------------------------------------------------------------
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({
        check_ts = true,
        disable_filetype = { "TelescopePrompt", "vim" },
        fast_wrap = {
          map       = "<M-w>",
          chars     = { "{", "[", "(", '"', "'" },
          keys      = "qwertyuiopzxcvbnmasdfghjkl",
          highlight = "Search",
        },
      })
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local ok, cmp = pcall(require, "cmp")
      if ok then cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done()) end
    end,
  },

  ---------------------------------------------------------------------------
  -- COMMENTING
  ---------------------------------------------------------------------------
  { "numToStr/Comment.nvim", config = true },

  ---------------------------------------------------------------------------
  -- SURROUND
  ---------------------------------------------------------------------------
  {
    "echasnovski/mini.surround",
    version = "*",
    config = function()
      require("mini.surround").setup({
        mappings = {
          add            = "sa",
          delete         = "sd",
          replace        = "sr",
          find           = "sf",
          find_left      = "sF",
          highlight      = "sh",
          update_n_lines = "sn",
        },
      })
    end,
  },

  ---------------------------------------------------------------------------
  -- UNDO TREE
  ---------------------------------------------------------------------------
  {
    "mbbill/undotree",
    config = function()
      vim.opt.undofile = true
      vim.opt.undodir  = vim.fn.stdpath("data") .. "/undodir"
      vim.fn.mkdir(vim.fn.stdpath("data") .. "/undodir", "p")
      vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Undo tree" })
    end,
  },

  ---------------------------------------------------------------------------
  -- TREESITTER CONTEXT
  ---------------------------------------------------------------------------
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup({
        max_lines  = 3,
        trim_scope = "outer",
      })
    end,
  },

  ---------------------------------------------------------------------------
  -- AI (CodeCompanion)
  ---------------------------------------------------------------------------
  {
    "olimorris/codecompanion.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      adapters = {
        acp = {
          claude_code = function()
            return require("codecompanion.adapters").extend("claude_code", {
              env = {
                CLAUDE_CODE_OAUTH_TOKEN = "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",
              },
            })
          end,
        },
      },
      strategies = {
        chat   = { adapter = "claude_code" },
        inline = { adapter = "claude_code" },
      },
      sources = {
        per_filetype = { codecompanion = { "codecompanion" } },
      },
    },
  },

}
