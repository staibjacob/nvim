
-- File: ~/.config/nvim/colors/rainbow_riot.lua
-- 🎨 Retro rainbow chaos for Neovim
-- Inspired by CRT terminals, rave flyers, and hacker punk aesthetics.
-- Black background, neon spectrum highlights, full Tree-sitter + LSP support.

local C = {
  bg     = "NONE",
  fg     = "#d0d0d0",
  red    = "#ff5c57",
  orange = "#ff9f43",
  yellow = "#f3f99d",
  green  = "#5af78e",
  cyan   = "#57c7ff",
  blue   = "#689dff",
  purple = "#bd93f9",
  pink   = "#ff79c6",
  magenta= "#ff6ac1",
  white  = "#f8f8f2",
  gray   = "#7a7a7a",
  dim    = "#101010",
  panel  = "#111111",
  sel    = "#262626",
  gold   = "#ffe29a",
}

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end
vim.o.background = "dark"
vim.g.colors_name = "rainbow_riot"

local function hl(group, opts) vim.api.nvim_set_hl(0, group, opts) end

--------------------------------------------------------------------
-- UI Core
--------------------------------------------------------------------
hl("Normal",         { fg = C.fg, bg = C.bg })
hl("NormalFloat",    { fg = C.fg, bg = C.panel })
hl("CursorLine",     { bg = "#111111" })
hl("CursorLineNr",   { fg = C.gold, bold = true })
hl("LineNr",         { fg = "#444444" })
hl("SignColumn",     { bg = C.bg })
hl("Visual",         { bg = C.sel })
hl("Search",         { bg = C.blue, fg = C.white, bold = true })
hl("IncSearch",      { bg = C.yellow, fg = "#000000", bold = true })
hl("StatusLine",     { fg = C.white, bg = C.panel })
hl("VertSplit",      { fg = "#222222" })
hl("Pmenu",          { fg = C.white, bg = "#111111" })
hl("PmenuSel",       { fg = C.black, bg = C.cyan, bold = true })
hl("Whitespace",     { fg = "#222222" })

--------------------------------------------------------------------
-- Syntax Spectrum
--------------------------------------------------------------------
-- Rainbow-coded syntax groups: every category has its own color
hl("Comment",        { fg = C.gray, italic = true })
hl("Constant",       { fg = C.yellow })
hl("String",         { fg = C.green })
hl("Character",      { fg = C.green })
hl("Number",         { fg = C.orange })
hl("Boolean",        { fg = C.orange })
hl("Identifier",     { fg = C.cyan })
hl("Function",       { fg = C.blue, bold = true })
hl("Statement",      { fg = C.red })
hl("Keyword",        { fg = C.magenta, bold = true })
hl("Type",           { fg = C.purple })
hl("Operator",       { fg = C.cyan })
hl("Error",          { fg = C.red, bold = true })
hl("Todo",           { fg = C.pink, bold = true })

--------------------------------------------------------------------
-- Tree-sitter (rainbow aware)
--------------------------------------------------------------------
hl("@comment",                  { link = "Comment" })
hl("@string",                   { fg = C.green })
hl("@string.escape",            { fg = C.yellow })
hl("@number",                   { fg = C.orange })
hl("@boolean",                  { fg = C.orange })
hl("@variable",                 { fg = C.fg })
hl("@variable.builtin",         { fg = C.cyan, italic = true })
hl("@field",                    { fg = C.blue })
hl("@property",                 { fg = C.green })
hl("@function",                 { fg = C.blue, bold = true })
hl("@method",                   { fg = C.purple })
hl("@constructor",              { fg = C.magenta })
hl("@keyword",                  { fg = C.red, bold = true })
hl("@keyword.function",         { fg = C.magenta })
hl("@type",                     { fg = C.purple })
hl("@type.builtin",             { fg = C.yellow, italic = true })
hl("@namespace",                { fg = C.cyan })
hl("@operator",                 { fg = C.orange })
hl("@markup.heading",           { fg = C.pink, bold = true })
hl("@markup.link",              { fg = C.blue, underline = true })
hl("@markup.raw",               { fg = C.yellow })
hl("@constant.builtin",         { fg = C.gold, bold = true })

--------------------------------------------------------------------
-- Haskell: double rainbow
--------------------------------------------------------------------
hl("@keyword.haskell",            { fg = C.magenta, bold = true })
hl("@function.haskell",           { fg = C.cyan, bold = true })
hl("@constructor.haskell",        { fg = C.green, bold = true })
hl("@type.haskell",               { fg = C.yellow })
hl("@type.builtin.haskell",       { fg = C.purple, italic = true })
hl("@variable.parameter.haskell", { fg = C.orange })
hl("@module.haskell",             { fg = C.blue, bold = true })
hl("@string.haskell",             { fg = C.green })
hl("@number.haskell",             { fg = C.orange })
hl("@operator.haskell",           { fg = C.red })

--------------------------------------------------------------------
-- Diagnostics / Git
--------------------------------------------------------------------
hl("DiagnosticError", { fg = C.red })
hl("DiagnosticWarn",  { fg = C.yellow })
hl("DiagnosticInfo",  { fg = C.cyan })
hl("DiagnosticHint",  { fg = C.green })
hl("GitSignsAdd",     { fg = C.green })
hl("GitSignsChange",  { fg = C.blue })
hl("GitSignsDelete",  { fg = C.red })

--------------------------------------------------------------------
-- Winbar
--------------------------------------------------------------------
hl("WinBar",   { fg = C.white, bg = C.bg })
hl("WinBarNC", { fg = C.gray, bg = C.bg })

-- 🌈 optional rainbow cursorline ruler
hl("ColorColumn", { bg = "#111111" })
