
-- File: colorschemes/faded_light.lua
-- Kanagawa Lotus — warm cream light theme

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.o.background = "light"
vim.g.colors_name = "faded_light"

local C = {
  bg      = "NONE",
  fg      = "#545464",  -- lotusInk, muted blue-gray

  blue    = "#4d699b",  -- lotusBlue
  green   = "#6f894e",  -- lotusGreen
  red     = "#c84053",  -- lotusRed
  yellow  = "#77713f",  -- lotusYellow, olive
  orange  = "#cc6d00",  -- lotusOrange
  purple  = "#624c83",  -- lotusPurple
  cyan    = "#4e8ca2",  -- lotusTeal
  magenta = "#b35b79",  -- lotusPink

  gray    = "#8a8980",  -- comments, muted
  dim     = "#e5ddb0",  -- cursorline (lotusWhite2)
  sel     = "#b5cbd2",  -- selection (lotusBlue2)
  gold    = "#c4b28a",
}

local function hl(g, o) vim.api.nvim_set_hl(0, g, o) end

----------------------------------------------------------
-- Core UI
----------------------------------------------------------
hl("Normal",         { fg = C.fg,   bg = C.bg })
hl("NormalFloat",    { fg = C.fg,   bg = C.dim })
hl("FloatBorder",    { fg = C.gray, bg = C.dim })

hl("CursorLine",     { bg = C.dim })
hl("CursorLineNr",   { fg = C.orange, bold = true })
hl("LineNr",         { fg = C.gray })
hl("SignColumn",     { bg = C.bg })

hl("Visual",         { bg = C.sel })

hl("Search",         { bg = C.yellow,  fg = "#f2ecbc" })
hl("IncSearch",      { bg = C.orange,  fg = "#f2ecbc", bold = true })

hl("StatusLine",     { fg = C.fg,   bg = "NONE" })
hl("StatusLineNC",   { fg = C.gray, bg = "NONE" })
hl("WinBar",         { fg = C.fg,   bg = "NONE" })
hl("WinBarNC",       { fg = C.gray, bg = "NONE" })

hl("VertSplit",      { fg = C.dim })
hl("ColorColumn",    { bg = C.dim })

hl("Pmenu",          { fg = C.fg,      bg = C.dim })
hl("PmenuSel",       { fg = "#f2ecbc", bg = C.blue })

hl("Whitespace",     { fg = C.dim })

----------------------------------------------------------
-- Basic Syntax
----------------------------------------------------------
hl("Comment",    { fg = C.gray,    italic = true })
hl("Constant",   { fg = C.yellow })
hl("String",     { fg = C.green })
hl("Number",     { fg = C.orange })
hl("Boolean",    { fg = C.orange })
hl("Identifier", { fg = C.fg })
hl("Function",   { fg = C.blue })
hl("Statement",  { fg = C.red })
hl("Keyword",    { fg = C.red,     bold = true })
hl("Type",       { fg = C.purple })
hl("Operator",   { fg = C.cyan })
hl("Error",      { fg = C.red })
hl("Todo",       { fg = C.orange,  bold = true })
hl("Special",    { fg = C.magenta })

----------------------------------------------------------
-- Tree-sitter
----------------------------------------------------------
hl("@comment",               { link = "Comment" })
hl("@string",                { fg = C.green })
hl("@string.escape",         { fg = C.magenta })
hl("@string.special.symbol", { fg = C.cyan })

hl("@number",                { fg = C.orange })
hl("@boolean",               { fg = C.orange })
hl("@float",                 { fg = C.orange })

hl("@variable",              { fg = C.fg })
hl("@variable.builtin",      { fg = C.magenta })

hl("@field",                 { fg = C.cyan })
hl("@property",              { fg = C.cyan })

hl("@function",              { fg = C.blue })
hl("@function.call",         { fg = C.blue })
hl("@method",                { fg = C.blue })
hl("@method.call",           { fg = C.blue })

hl("@constructor",           { fg = C.purple })
hl("@keyword",               { fg = C.red })
hl("@keyword.function",      { fg = C.red })
hl("@keyword.operator",      { fg = C.red })
hl("@keyword.return",        { fg = C.red })

hl("@type",                  { fg = C.purple })
hl("@type.builtin",          { fg = C.purple, italic = true })

hl("@namespace",             { fg = C.yellow })
hl("@operator",              { fg = C.fg })
hl("@punctuation",           { fg = C.fg })
hl("@constant",              { fg = C.yellow })
hl("@constant.builtin",      { fg = C.orange })

----------------------------------------------------------
-- Haskell / Tidal
----------------------------------------------------------
hl("@keyword.haskell",               { fg = C.red, bold = true })
hl("@keyword.import.haskell",        { fg = C.red, bold = true })
hl("@keyword.conditional.haskell",   { fg = C.red, bold = true })
hl("@keyword.repeat.haskell",        { fg = C.red, bold = true })
hl("@type.haskell",                  { fg = C.purple, bold = true })
hl("@type.builtin.haskell",          { fg = C.purple, italic = true })
hl("@constructor.haskell",           { fg = C.purple, bold = true })
hl("@module.haskell",                { fg = C.yellow, bold = true })
hl("@namespace.haskell",             { fg = C.yellow })
hl("@variable.haskell",              { fg = C.fg })
hl("@function.call.haskell",         { fg = C.blue })
hl("@variable.parameter.haskell",    { fg = C.cyan, italic = true })
hl("@variable.builtin.haskell",      { fg = C.magenta })
hl("@string.haskell",                { fg = C.green })
hl("@string.escape.haskell",         { fg = C.magenta })
hl("@number.haskell",                { fg = C.orange })
hl("@operator.haskell",              { fg = C.red })
hl("@punctuation.special.haskell",   { fg = C.magenta })
hl("@punctuation.delimiter.haskell", { fg = C.gray })
hl("@punctuation.bracket.haskell",   { fg = C.fg })
hl("@comment.haskell",               { fg = C.gray, italic = true })

----------------------------------------------------------
-- Telescope
----------------------------------------------------------
hl("TelescopeNormal",       { fg = C.fg,      bg = "NONE" })
hl("TelescopeBorder",       { fg = C.gray,    bg = "NONE" })
hl("TelescopeSelection",    { fg = C.fg,      bg = C.dim, bold = true })
hl("TelescopeMatching",     { fg = C.orange,              bold = true })
hl("TelescopePromptNormal", { fg = C.fg,      bg = "NONE" })
hl("TelescopePromptBorder", { fg = C.gray,    bg = "NONE" })

----------------------------------------------------------
-- NvimTree
----------------------------------------------------------
hl("NvimTreeNormal",           { fg = C.fg,      bg = "NONE" })
hl("NvimTreeEndOfBuffer",      { bg = "NONE" })
hl("NvimTreeFolderIcon",       { fg = C.blue })
hl("NvimTreeFolderName",       { fg = C.blue })
hl("NvimTreeOpenedFolderName", { fg = C.blue,    bold = true })
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
hl("DiagnosticWarn",  { fg = C.orange })
hl("DiagnosticInfo",  { fg = C.blue })
hl("DiagnosticHint",  { fg = C.cyan })

hl("GitSignsAdd",     { fg = C.green })
hl("GitSignsChange",  { fg = C.blue })
hl("GitSignsDelete",  { fg = C.red })
