
-- File: colors/dragon_transparent.lua
-- Fully Transparent Kanagawa Dragon Variant

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.o.background = "dark"
vim.g.colors_name = "dragon_transparent"

----------------------------------------------------------
-- Kanagawa Dragon Palette
----------------------------------------------------------
local C = {
  bg     = "#080501",
  fg     = "#DCD7BA", -- fujiWhite

  blue     = "#7E9CD8",
  green    = "#98BB6C",
  red      = "#C34043",
  yellow   = "#C0A36E",
  orange   = "#FF9E3B",
  purple   = "#957FB8",
  cyan     = "#248f8f",
  magenta  = "#938AA9",
  pink     = "#D58AB9",

  white    = "#DCD7BA",
  gray     = "#727169",
  dim      = "#1F1F28",
  sel      = "#2D4F67",
  gold     = "#C0A36E",
}

local function hl(g, o) vim.api.nvim_set_hl(0, g, o) end

----------------------------------------------------------
-- Core UI (transparent)
----------------------------------------------------------
hl("Normal",         { fg = C.fg, bg = "NONE" })
hl("NormalFloat",    { fg = C.fg, bg = "NONE" })
hl("FloatBorder",    { fg = C.gray, bg = "NONE" })

hl("CursorLine",     { bg = "#1b1b23" })
hl("CursorLineNr",   { fg = C.yellow, bold = true })
hl("LineNr",         { fg = C.gray })
hl("SignColumn",     { bg = C.bg })

hl("Visual",         { bg = C.sel })

hl("Search",         { bg = C.orange, fg = C.white })
hl("IncSearch",      { bg = C.yellow, fg = "#000000", bold = true })

hl("StatusLine",     { fg = C.white, bg = "NONE" })
hl("StatusLineNC",   { fg = C.gray,  bg = "NONE" })

hl("WinBar",         { fg = C.white, bg = "NONE" })
hl("WinBarNC",       { fg = C.gray,  bg = "NONE" })

hl("VertSplit",      { fg = C.dim })
hl("ColorColumn",    { bg = "#1b1b23" })

hl("Pmenu",          { fg = C.white, bg = "#1b1b23" })
hl("PmenuSel",       { fg = "#000000", bg = C.blue })

hl("Whitespace",     { fg = C.dim })

----------------------------------------------------------
-- Basic Syntax (non-TS fallback)
----------------------------------------------------------
hl("Comment",     { fg = C.gray, italic = true })
hl("Constant",    { fg = C.yellow })
hl("String",      { fg = C.green })
hl("Number",      { fg = C.orange })
hl("Boolean",     { fg = C.orange })

hl("Identifier",  { fg = C.cyan })
hl("Function",    { fg = C.blue })

hl("Statement",   { fg = C.red })
hl("Keyword",     { fg = C.magenta, bold = true })

hl("Type",        { fg = C.purple })
hl("Operator",    { fg = C.cyan })

hl("Error",       { fg = C.red })
hl("Todo",        { fg = C.yellow, bold = true })

----------------------------------------------------------
-- Tree-sitter Core
----------------------------------------------------------
hl("@comment",                   { link = "Comment" })
hl("@string",                    { fg = C.green })
hl("@string.escape",             { fg = C.orange })
hl("@string.special.symbol",     { fg = "#658594" })

hl("@number",                    { fg = C.orange })
hl("@boolean",                   { fg = C.orange })

hl("@variable",                  { fg = C.fg })
hl("@variable.builtin",          { fg = C.cyan })
hl("@string.special.symbol.supercollider", { fg = "#5FAF87" })
hl("@type.supercollider",                  { fg = C.red })
hl("@keyword.supercollider",               { fg = C.purple })
hl("@constant.builtin.supercollider",      { fg = "#C87840" })
hl("@variable.builtin.supercollider",      { fg = C.pink })

hl("@field",                     { fg = C.blue })
hl("@property",                  { fg = C.green })

hl("@function",                  { fg = C.blue })
hl("@method",                    { fg = C.purple })

hl("@constructor",               { fg = C.yellow })
hl("@keyword",                   { fg = C.red })
hl("@keyword.function",          { fg = C.magenta })

hl("@type",                      { fg = C.purple })
hl("@type.builtin",              { fg = C.yellow })

hl("@namespace",                 { fg = C.cyan })
hl("@operator",                  { fg = C.orange })
hl("@constant.builtin",          { fg = C.yellow })

----------------------------------------------------------
-- HASKELL + TIDAL (Treesitter powered)
----------------------------------------------------------
hl("@keyword.haskell",            { fg = C.magenta, bold = true })
hl("@keyword.import.haskell",     { fg = C.magenta, bold = true })
hl("@keyword.conditional.haskell",{ fg = C.red, bold = true })
hl("@keyword.repeat.haskell",     { fg = C.red, bold = true })

hl("@type.haskell",               { fg = C.purple, bold = true })
hl("@type.builtin.haskell",       { fg = C.yellow, italic = true })

hl("@constructor.haskell",        { fg = C.yellow, bold = true })

hl("@module.haskell",             { fg = C.cyan, bold = true })
hl("@namespace.haskell",          { fg = C.cyan })

-- Here is the MAGIC: This makes Tidal look perfect
hl("@variable.haskell",           { fg = C.blue }) -- slow, fast, stack, etc.
hl("@function.call.haskell",      { fg = C.blue })

hl("@variable.parameter.haskell", { fg = C.orange, italic = true })
hl("@variable.builtin.haskell",   { fg = C.orange })

hl("@string.haskell",             { fg = C.green })
hl("@string.escape.haskell",      { fg = C.orange })

hl("@number.haskell",             { fg = C.yellow })

hl("@operator.haskell",           { fg = C.red, bold = true })
hl("@punctuation.special.haskell",{ fg = C.red })

hl("@punctuation.delimiter.haskell", { fg = C.gray })
hl("@punctuation.bracket.haskell",   { fg = C.white })

hl("@comment.haskell",            { fg = C.gray, italic = true })


---------------------------------------------------------
-- Telescope (Dragon Transparent)
----------------------------------------------------------
hl("TelescopeNormal",        { fg = C.fg,     bg = "NONE" })
hl("TelescopeBorder",        { fg = C.gray,   bg = "NONE" })
hl("TelescopeSelection",     { fg = C.blue,   bg = "NONE", bold = true })
hl("TelescopeMatching",      { fg = C.orange, bg = "NONE", bold = true })
hl("TelescopePromptNormal",  { fg = C.fg,     bg = "NONE" })
hl("TelescopePromptBorder",  { fg = C.gray,   bg = "NONE" })

----------------------------------------------------------
-- NvimTree (Dragon)
----------------------------------------------------------
hl("NvimTreeNormal",            { fg = C.fg,   bg = "NONE" })
hl("NvimTreeEndOfBuffer",       { fg = "NONE", bg = "NONE" })
hl("NvimTreeFolderIcon",        { fg = C.blue })
hl("NvimTreeFolderName",        { fg = C.blue })
hl("NvimTreeOpenedFolderName",  { fg = C.blue, bold = true })
hl("NvimTreeRootFolder",        { fg = C.magenta })
hl("NvimTreeExecFile",          { fg = C.green })
hl("NvimTreeSpecialFile",       { fg = C.orange })
hl("NvimTreeGitDirty",          { fg = C.yellow })
hl("NvimTreeGitNew",            { fg = C.green })
hl("NvimTreeGitDeleted",        { fg = C.red })

----------------------------------------------------------
-- Diagnostics
----------------------------------------------------------
hl("DiagnosticError", { fg = C.red })
hl("DiagnosticWarn",  { fg = C.yellow })
hl("DiagnosticInfo",  { fg = C.blue })
hl("DiagnosticHint",  { fg = C.cyan })

hl("GitSignsAdd",     { fg = C.green })
hl("GitSignsChange",  { fg = C.blue })
hl("GitSignsDelete",  { fg = C.red })
