
-- lua/config/theme.lua
-- Reads ~/.config/theme-mode ("dark" | "light" | "neon") and loads the right colorscheme + lualine.

local M = {}

local function read_mode()
  local f = io.open(os.getenv("HOME") .. "/.config/theme-mode", "r")
  if not f then return "dark" end
  local mode = f:read("*l")
  f:close()
  if mode == "light" then return "light" end
  if mode == "neon"  then return "neon"  end
  if mode == "dark2" then return "dark2" end
  if mode == "dark3" then return "dark3" end
  return "dark"
end

local palettes = {
  dark = {
    bg      = "#080501",
    fg      = "#DCD7BA",
    blue    = "#7E9CD8",
    green   = "#98BB6C",
    red     = "#C34043",
    yellow  = "#C0A36E",
    orange  = "#FF9E3B",
    purple  = "#957FB8",
    cyan    = "#248f8f",
    magenta = "#938AA9",
    gray    = "#727169",
  },
  light = {
    bg      = "#f2ecbc",
    fg      = "#545464",
    blue    = "#4d699b",
    green   = "#6f894e",
    red     = "#c84053",
    yellow  = "#77713f",
    orange  = "#cc6d00",
    purple  = "#624c83",
    cyan    = "#4e8ca2",
    magenta = "#b35b79",
    gray    = "#8a8980",
  },
  dark2 = {
    bg      = "#080501",
    fg      = "#DCD7BA",
    blue    = "#7FB4CA",
    green   = "#76946A",
    red     = "#E46876",
    yellow  = "#E6C384",
    orange  = "#FFA066",
    purple  = "#9D79D0",
    cyan    = "#7AA89F",
    magenta = "#D27E99",
    gray    = "#727169",
  },
  dark3 = {
    bg      = "#080501",
    fg      = "#DCD7BA",
    blue    = "#7E9CD8",
    green   = "#98BB6C",
    red     = "#C34043",
    yellow  = "#C9A96E",
    orange  = "#D4956A",
    purple  = "#957FB8",
    cyan    = "#7AA89F",
    magenta = "#938AA9",
    gray    = "#727169",
  },
  neon = {
    bg      = "#000000",
    fg      = "#f0d0b8",
    blue    = "#ff5030",
    green   = "#00e5a0",
    red     = "#ff2020",
    yellow  = "#ffd200",
    orange  = "#ff9900",
    purple  = "#d060ff",
    cyan    = "#ff7000",
    magenta = "#ff0055",
    gray    = "#6a4a4a",
  },
}

local function setup_lualine(C)
  local ok, lualine = pcall(require, "lualine")
  if not ok then return end

  lualine.setup({
    options = {
      globalstatus = false,
      section_separators = "",
      component_separators = "",
      theme = {
        normal = {
          a = { fg = C.bg, bg = C.blue,    gui = "bold" },
          b = { fg = C.blue,  bg = "NONE" },
          c = { fg = C.fg,    bg = "NONE" },
        },
        insert  = { a = { fg = C.bg, bg = C.green,   gui = "bold" } },
        visual  = { a = { fg = C.bg, bg = C.magenta, gui = "bold" } },
        replace = { a = { fg = C.bg, bg = C.red,     gui = "bold" } },
        command = { a = { fg = C.bg, bg = C.yellow,  gui = "bold" } },
        inactive = {
          a = { fg = C.fg, bg = "NONE" },
          b = { fg = C.fg, bg = "NONE" },
          c = { fg = C.fg, bg = "NONE" },
        },
      },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch" },
      lualine_c = { { "filename", path = 1 } },
      lualine_x = { "diagnostics", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
  })
end

function M.load()
  local mode = read_mode()
  if mode == "light" then
    require("config.colorschemes.faded_light")
  elseif mode == "neon" then
    require("config.colorschemes.neon")
  elseif mode == "dark2" then
    require("config.colorschemes.dark2")
  elseif mode == "dark3" then
    require("config.colorschemes.dark3")
  else
    require("config.colorschemes.faded")
  end
  setup_lualine(palettes[mode])
end

function M.reload()
  package.loaded["config.colorschemes.faded"]       = nil
  package.loaded["config.colorschemes.faded_light"] = nil
  package.loaded["config.colorschemes.neon"]        = nil
  package.loaded["config.colorschemes.dark2"]       = nil
  package.loaded["config.colorschemes.dark3"]       = nil
  package.loaded["config.theme"]                    = nil
  require("config.theme").load()
end

M.load()

return M
