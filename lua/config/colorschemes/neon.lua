
-- File: colorschemes/neon.lua
-- 90s cyberpunk hacker — dark red-black, hot neons, amber warmth

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.o.background = "dark"
vim.g.colors_name = "neon"

local C = {
  bg      = "NONE",
  fg      = "#f0d0b8",  -- warm amber-white

  cyan    = "#ff7000",  -- electric orange  — functions
  green   = "#00e5a0",  -- neon green       — strings
  magenta = "#ff0055",  -- hot red-pink     — keywords
  purple  = "#d060ff",  -- electric purple  — types
  yellow  = "#ffd200",  -- electric gold    — numbers / constants
  orange  = "#ff9900",  -- amber            — operators / special
  blue    = "#ff5030",  -- red-orange       — fields / properties
  red     = "#ff2020",  -- neon red         — errors

  gray    = "#6a4a4a",  -- red-tinted gray  — comments
  dim     = "#1e0a0a",  -- cursorline
  sel     = "#380808",  -- selection
  white   = "#f8e0c8",  -- bright fg
}

local function hl(g, o) vim.api.nvim_set_hl(0, g, o) end

----------------------------------------------------------
-- Core UI
----------------------------------------------------------
hl("Normal",         { fg = C.fg,    bg = C.bg })
hl("NormalFloat",    { fg = C.fg,    bg = C.dim })
hl("FloatBorder",    { fg = C.gray,  bg = C.dim })

hl("CursorLine",     { bg = C.dim })
hl("CursorLineNr",   { fg = C.cyan,  bold = true })
hl("LineNr",         { fg = C.gray })
hl("SignColumn",     { bg = C.bg })

hl("Visual",         { bg = C.sel })

hl("Search",         { bg = C.yellow,  fg = "#000000" })
hl("IncSearch",      { bg = C.cyan,    fg = "#000000", bold = true })

hl("StatusLine",     { fg = C.fg,    bg = "NONE" })
hl("StatusLineNC",   { fg = C.gray,  bg = "NONE" })
hl("WinBar",         { fg = C.fg,    bg = "NONE" })
hl("WinBarNC",       { fg = C.gray,  bg = "NONE" })

hl("VertSplit",      { fg = C.dim })
hl("ColorColumn",    { bg = C.dim })

hl("Pmenu",          { fg = C.fg,      bg = C.dim })
hl("PmenuSel",       { fg = "#000000", bg = C.cyan })

hl("Whitespace",     { fg = C.dim })

----------------------------------------------------------
-- Basic Syntax
----------------------------------------------------------
hl("Comment",    { fg = C.gray,    italic = true })
hl("Constant",   { fg = C.yellow })
hl("String",     { fg = C.green })
hl("Number",     { fg = C.yellow })
hl("Boolean",    { fg = C.magenta })
hl("Identifier", { fg = C.fg })
hl("Function",   { fg = C.cyan })
hl("Statement",  { fg = C.magenta })
hl("Keyword",    { fg = C.magenta, bold = true })
hl("Type",       { fg = C.purple })
hl("Operator",   { fg = C.orange })
hl("Error",      { fg = C.red,     bold = true })
hl("Todo",       { fg = C.yellow,  bold = true })
hl("Special",    { fg = C.orange })

----------------------------------------------------------
-- Tree-sitter
----------------------------------------------------------
hl("@comment",               { link = "Comment" })
hl("@string",                { fg = C.green })
hl("@string.escape",         { fg = C.orange })
hl("@string.special.symbol", { fg = C.cyan })

hl("@number",                { fg = C.yellow })
hl("@float",                 { fg = C.yellow })
hl("@boolean",               { fg = C.magenta })

hl("@variable",              { fg = C.fg })
hl("@variable.builtin",      { fg = C.cyan })

hl("@field",                 { fg = C.blue })
hl("@property",              { fg = C.blue })

hl("@function",              { fg = C.cyan })
hl("@function.call",         { fg = C.cyan })
hl("@method",                { fg = C.cyan })
hl("@method.call",           { fg = C.cyan })

hl("@constructor",           { fg = C.purple })
hl("@keyword",               { fg = C.magenta })
hl("@keyword.function",      { fg = C.magenta, bold = true })
hl("@keyword.operator",      { fg = C.orange })
hl("@keyword.return",        { fg = C.magenta, bold = true })

hl("@type",                  { fg = C.purple })
hl("@type.builtin",          { fg = C.purple, italic = true })

hl("@namespace",             { fg = C.blue })
hl("@operator",              { fg = C.orange })
hl("@punctuation",           { fg = C.fg })
hl("@constant",              { fg = C.yellow })
hl("@constant.builtin",      { fg = C.orange })

----------------------------------------------------------
-- Haskell / Tidal
----------------------------------------------------------
hl("@keyword.haskell",               { fg = C.magenta, bold = true })
hl("@keyword.import.haskell",        { fg = C.magenta, bold = true })
hl("@keyword.conditional.haskell",   { fg = C.magenta, bold = true })
hl("@keyword.repeat.haskell",        { fg = C.magenta, bold = true })
hl("@type.haskell",                  { fg = C.purple,  bold = true })
hl("@type.builtin.haskell",          { fg = C.purple,  italic = true })
hl("@constructor.haskell",           { fg = C.purple,  bold = true })
hl("@module.haskell",                { fg = C.blue,    bold = true })
hl("@namespace.haskell",             { fg = C.blue })
hl("@variable.haskell",              { fg = C.fg })
hl("@function.call.haskell",         { fg = C.cyan })
hl("@variable.parameter.haskell",    { fg = C.orange,  italic = true })
hl("@variable.builtin.haskell",      { fg = C.cyan })
hl("@string.haskell",                { fg = C.green })
hl("@string.escape.haskell",         { fg = C.orange })
hl("@number.haskell",                { fg = C.yellow })
hl("@operator.haskell",              { fg = C.orange,  bold = true })
hl("@punctuation.special.haskell",   { fg = C.magenta })
hl("@punctuation.delimiter.haskell", { fg = C.gray })
hl("@punctuation.bracket.haskell",   { fg = C.blue })
hl("@comment.haskell",               { fg = C.gray,    italic = true })

----------------------------------------------------------
-- Telescope
----------------------------------------------------------
hl("TelescopeNormal",       { fg = C.fg,      bg = "NONE" })
hl("TelescopeBorder",       { fg = C.gray,    bg = "NONE" })
hl("TelescopeSelection",    { fg = C.cyan,    bg = C.dim, bold = true })
hl("TelescopeMatching",     { fg = C.yellow,              bold = true })
hl("TelescopePromptNormal", { fg = C.fg,      bg = "NONE" })
hl("TelescopePromptBorder", { fg = C.gray,    bg = "NONE" })

----------------------------------------------------------
-- NvimTree
----------------------------------------------------------
hl("NvimTreeNormal",           { fg = C.fg,      bg = "NONE" })
hl("NvimTreeEndOfBuffer",      { bg = "NONE" })
hl("NvimTreeFolderIcon",       { fg = C.cyan })
hl("NvimTreeFolderName",       { fg = C.cyan })
hl("NvimTreeOpenedFolderName", { fg = C.cyan,    bold = true })
hl("NvimTreeRootFolder",       { fg = C.magenta })
hl("NvimTreeExecFile",         { fg = C.green })
hl("NvimTreeSpecialFile",      { fg = C.orange })
hl("NvimTreeGitDirty",         { fg = C.yellow })
hl("NvimTreeGitNew",           { fg = C.green })
hl("NvimTreeGitDeleted",       { fg = C.red })

----------------------------------------------------------
-- Diagnostics / Git
----------------------------------------------------------
hl("DiagnosticError", { fg = C.red })
hl("DiagnosticWarn",  { fg = C.yellow })
hl("DiagnosticInfo",  { fg = C.cyan })
hl("DiagnosticHint",  { fg = C.blue })

hl("GitSignsAdd",     { fg = C.green })
hl("GitSignsChange",  { fg = C.blue })
hl("GitSignsDelete",  { fg = C.red })
