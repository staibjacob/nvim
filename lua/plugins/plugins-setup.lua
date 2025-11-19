
-- ~/.config/nvim/lua/plugins/plugins-setup.lua

require("lazy").setup({

  -- === Essentials ===
  { "nvim-lua/plenary.nvim" },

  -- === File Explorer ===
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- === Status Line ===
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- === Telescope ===
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- === Syntax Highlighting ===
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  -- === LSP & Completion ===
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },

  -- === Git Integration ===
  { "lewis6991/gitsigns.nvim" },

  -- === Themes ===
  { "folke/tokyonight.nvim" },
  { "gruvbox-community/gruvbox" },

  -- === Quality of Life ===
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      local autopairs = require("nvim-autopairs")
      autopairs.setup({
        check_ts = true, -- use treesitter for better pairing
        disable_filetype = { "TelescopePrompt", "vim" },
        fast_wrap = {
          map = "<M-e>", -- press Alt+e to wrap inside brackets/quotes
          chars = { "{", "[", "(", '"', "'" },
          pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
          offset = 0, -- cursor offset when wrapping
          end_key = "$",
          keys = "qwertyuiopzxcvbnmasdfghjkl",
          check_comma = true,
          highlight = "Search",
          highlight_grey = "Comment",
        },
      })

      -- === nvim-cmp integration ===
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp_status_ok, cmp = pcall(require, "cmp")
      if cmp_status_ok then
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
      end
    end,
  },

  { "numToStr/Comment.nvim" },

  -- === SuperCollider Support ===

{
  "davidgranstrom/scnvim",
  config = function()
    local scnvim = require("scnvim")
    local map = scnvim.map
    local map_expr = scnvim.map_expr

    -- === Main scnvim setup ===
    scnvim.setup({
      keymaps = {
        -- Send code
        ["<M-e>"] = map("editor.send_line", { "i", "n" }),
        ["<C-e>"] = map("editor.send_block", { "i", "n" }),
        ["x|<C-e>"] = map("editor.send_selection"),

        -- Post window
        ["<CR>"] = map("postwin.toggle"),
        ["<M-CR>"] = map("postwin.toggle", "i"),
        ["<M-L>"] = map("postwin.clear", { "n", "i" }),

        -- Signature help
        ["<C-k>"] = map("signature.show", { "n", "i" }),

        -- SuperCollider actions
        ["<F12>"] = map("sclang.hard_stop", { "n", "x", "i" }),
        ["<leader>st"] = map("sclang.start"),
        ["<leader>sk"] = map("sclang.recompile"),
        ["<F1>"] = map_expr("s.boot"),
        ["<F2>"] = map_expr("s.meter"),
      },

      editor = {
        highlight = {
          color = "IncSearch",
        },
      },

      -- We keep float.enabled=true because scnvim internally requires it.
      -- But we’ll override it with a custom command below.
      postwin = {
        float = {
          enabled = true,
          border = "rounded",
          width = 0.6,
          height = 0.4,
        },
        auto_scroll = true,
      },
    })

    -- === Custom helper: open post window in a normal split buffer ===
    vim.keymap.set("n", "<leader>sp", function()
      local bufname = "SCNvimPost"
      local bufexists = false

      for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_get_name(buf):match(bufname) then
          bufexists = true
          break
        end
      end

      -- Create post buffer if missing
      if not bufexists then
        pcall(function() require("scnvim.postwin").open() end)
        vim.wait(100)
      end

      -- Open the post buffer in a vertical split
      vim.cmd("vsplit")
      vim.cmd("buffer " .. bufname)
    end, { desc = "Open SCNvim post window in split" })
  end,
},
  -- === TidalCycles Support ===
  {
    "grddavies/tidal.nvim",
    opts = {
      boot = {
        tidal = {
          cmd = "ghci",
          args = { "-v0" },
          file = vim.api.nvim_get_runtime_file("~/.config/tidal/BootTidal.hs", false)[1],
          enabled = true,
        },
        sclang = {
          cmd = "sclang",
          args = {},
          file = vim.api.nvim_get_runtime_file("bootfiles/BootSuperDirt.scd", false)[1],
          enabled = false,
        },
        split = "v",
      },
      mappings = {
        send_line = { mode = { "i", "n" }, key = "<S-CR>" },
        send_visual = { mode = { "x" }, key = "<S-CR>" },
        send_block = { mode = { "i", "n", "x" }, key = "<M-CR>" },
        send_node = { mode = "n", key = "<leader><CR>" },
        send_silence = { mode = "n", key = "<leader>d" },
        send_hush = { mode = "n", key = "<leader><Esc>" },
      },
      selection_highlight = {
        highlight = { link = "IncSearch" },
        timeout = 150,
      },
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      opts = { ensure_installed = { "haskell", "supercollider" } },
    },
    config = function(_, opts)
      local tidal = require("tidal")
      tidal.setup(opts)
    end,
  },
})
