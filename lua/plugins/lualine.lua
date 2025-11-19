
-- lua/config/lualine.lua
-- 🌈 Transparent with preserved mode colors

vim.opt.cmdheight = 0 -- Make lualine the bottom-most line

require("lualine").setup({
  options = {
    theme = {
      normal = {
        a = { fg = "#000000", bg = "#689dff", gui = "bold" }, -- keep color
        b = { fg = "#689dff", bg = "none" },
        c = { fg = "#f8f8f2", bg = "none" },
      },
      insert = {
        a = { fg = "#000000", bg = "#5af78e", gui = "bold" }, -- keep color
        b = { fg = "#5af78e", bg = "none" },
        c = { fg = "#f8f8f2", bg = "none" },
      },
      visual = {
        a = { fg = "#000000", bg = "#bd93f9", gui = "bold" }, -- keep color
        b = { fg = "#bd93f9", bg = "none" },
        c = { fg = "#f8f8f2", bg = "none" },
      },
      replace = {
        a = { fg = "#000000", bg = "#ff5c57", gui = "bold" }, -- keep color
        b = { fg = "#ff5c57", bg = "none" },
        c = { fg = "#f8f8f2", bg = "none" },
      },
      command = {
        a = { fg = "#000000", bg = "#ff9f43", gui = "bold" }, -- keep color
        b = { fg = "#ff9f43", bg = "none" },
        c = { fg = "#f8f8f2", bg = "none" },
      },
      inactive = {
        a = { fg = "#7a7a7a", bg = "none" },
        b = { fg = "#7a7a7a", bg = "none" },
        c = { fg = "#7a7a7a", bg = "none" },
      },
    },

    section_separators = "",
    component_separators = "",
    globalstatus = false,
  },

  sections = {
   lualine_a = {
  {
    "mode",
    fmt = function(str)
      return str:sub(1, 1) .. str:sub(2):lower()
    end,

    -- Add the ellipse shapes around the mode
    separator = { left = "", right = "" },

    -- Give the separators the same background as the mode block
    separator_color = function()
      local m = vim.fn.mode()
      local colors = {
        n  = "#689dff",
        i  = "#5af78e",
        v  = "#bd93f9",
        V  = "#bd93f9",
        [""] = "#bd93f9",
        R  = "#ff5c57",
        c  = "#ff9f43",
      }
      return { bg = "none", fg = colors[m] or "#689dff" }
    end,

    -- The mode block colors themselves
    color = function()
      local m = vim.fn.mode()
      local colors = {
        n  = { fg = "#000000", bg = "#689dff", gui = "bold" },
        i  = { fg = "#000000", bg = "#5af78e", gui = "bold" },
        v  = { fg = "#000000", bg = "#bd93f9", gui = "bold" },
        V  = { fg = "#000000", bg = "#bd93f9", gui = "bold" },
        [""] = { fg = "#000000", bg = "#bd93f9", gui = "bold" },
        R  = { fg = "#000000", bg = "#ff5c57", gui = "bold" },
        c  = { fg = "#000000", bg = "#ff9f43", gui = "bold" },
      }
      return colors[m] or { fg = "#000000", bg = "#689dff", gui = "bold" }
    end,
  },
},
    lualine_b = {
      { "branch", color = { fg = "#ff79c6", bg = "none" } },
    },

    lualine_c = {
      { "filename", color = { fg = "#f8f8f2", bg = "none" } },
    },

    lualine_x = {
      { "encoding", color = { fg = "#57c7ff", bg = "none" } },
      { "filetype", color = { fg = "#5af78e", bg = "none" } },
    },

    lualine_y = {
      { "progress", color = { fg = "#f3f99d", bg = "none" } },
    },

    lualine_z = {
      { "location", color = { fg = "#bd93f9", bg = "none" } },
    },
  },
})

-- Hide lualine during command input
vim.api.nvim_create_autocmd("CmdlineEnter", {
  callback = function()
    vim.opt.laststatus = 0
  end,
})

vim.api.nvim_create_autocmd("CmdlineLeave", {
  callback = function()
    vim.opt.laststatus = 2
  end,
})

-- Force transparency on the base highlight groups
vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })
