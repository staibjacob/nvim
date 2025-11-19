
-- File: ~/.config/nvim/colors/ibm_1983.lua
-- IBM 1983 — CGA/MDA retro terminal palette
-- Black background, low-gamma blue foreground, magenta & cyan accents
-- Crisp, minimal, harsh retro aesthetic

local C = {
  bg      = "#000000", -- true black
  fg      = "#b8b8b8", -- soft CRT white
  blue    = "#00a2ff", -- IBM cyan-blue (CGA)
  cyan    = "#00ffff", -- pure cyan
  magenta = "#ff00ff", -- pure magenta
  white   = "#ffffff",
  gray    = "#6d6d6d",
  darkgray= "#1a1a1a",
  yellow  = "#ffff55", -- CGA yellow
  red     = "#ff5555", -- harsh CGA red
  green   = "#55ff55", -- CGA green
}

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end
vim.o.background = "dark"
vim.g.colors_name = "ibm_1983"

local function hl(group, opts) vim.api.nvim_set_hl(0, group, opts) end

--------------------------------------------------------------------
-- UI Core
--------------------------------------------------------------------
hl("Normal",       { fg = C.fg, bg = C.bg })
hl("NormalFloat",  { fg = C.fg, bg = C.darkgray })
hl("CursorLine",   { bg = "#0a0a0a" })
hl("CursorLineNr", { fg = C.yellow, bold = true })
hl("LineNr",       { fg = C.gray })
hl("SignColumn",   { bg = C.bg })
hl("Visual",       { bg = "#002244" }) -- deep blue highlight
hl("Search",       { bg = C.blue, fg = C.white })
hl("IncSearch",    { bg = C.yellow, fg = C.bg })
hl("StatusLine",   { fg = C.cyan, bg = "#050505" })
hl("Pmenu",        { fg = C.white, bg = "#050505" })
hl("PmenuSel",     { fg = C.bg, bg = C.blue, bold = true })
hl("VertSplit",    { fg = C.darkgray })

--------------------------------------------------------------------
-- Syntax (CGA-style)
--------------------------------------------------------------------
hl("Comment",    { fg = C.gray, italic = true })
hl("Constant",   { fg = C.yellow })
hl("String",     { fg = C.green })
hl("Character",  { fg = C.green })
hl("Number",     { fg = C.yellow })
hl("Boolean",    { fg = C.yellow })
hl("Identifier", { fg = C.cyan })
hl("Function",   { fg = C.blue, bold = true })
hl("Statement",  { fg = C.magenta })
hl("Keyword",    { fg = C.magenta, bold = true })
hl("Type",       { fg = C.cyan })
hl("Operator",   { fg = C.white })
hl("Error",      { fg = C.red, bold = true })
hl("Todo",       { fg = C.magenta, bold = true })

--------------------------------------------------------------------
-- Tree-sitter
--------------------------------------------------------------------
hl("@comment",                  { link = "Comment" })
hl("@string",                   { fg = C.green })
hl("@string.escape",            { fg = C.yellow })
hl("@number",                   { fg = C.yellow })
hl("@boolean",                  { fg = C.yellow })
hl("@variable",                 { fg = C.fg })
hl("@variable.builtin",         { fg = C.cyan })
hl("@field",                    { fg = C.blue })
hl("@property",                 { fg = C.cyan })
hl("@function",                 { fg = C.blue, bold = true })
hl("@method",                   { fg = C.magenta })
hl("@constructor",              { fg = C.magenta })
hl("@keyword",                  { fg = C.magenta, bold = true })
hl("@keyword.function",         { fg = C.magenta })
hl("@type",                     { fg = C.cyan })
hl("@type.builtin",             { fg = C.yellow })
hl("@namespace",                { fg = C.blue })
hl("@operator",                 { fg = C.white })

--------------------------------------------------------------------
-- Haskell (retro-tuned)
--------------------------------------------------------------------
hl("@keyword.haskell",            { fg = C.magenta, bold = true })
hl("@function.haskell",           { fg = C.blue })
hl("@constructor.haskell",        { fg = C.cyan })
hl("@type.haskell",               { fg = C.yellow })
hl("@type.builtin.haskell",       { fg = C.magenta })
hl("@variable.parameter.haskell", { fg = C.white })
hl("@module.haskell",             { fg = C.blue })

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
hl("WinBar",   { fg = C.cyan, bg = C.bg })
hl("WinBarNC", { fg = C.gray, bg = C.bg })
hl("ColorColumn", { bg = "#090909" })
