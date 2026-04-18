
-- File: colorschemes/dark2.lua
-- Dark variation — same Dragon structure, remixed color roles

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.o.background = "dark"
vim.g.colors_name = "dark2"

local C = {
  bg      = "#080501",
  fg      = "#DCD7BA",

  blue    = "#7FB4CA",  -- spring blue
  green   = "#76946A",  -- sage green
  red     = "#E46876",  -- rose coral
  yellow  = "#E6C384",  -- carp yellow
  orange  = "#FFA066",  -- surimi orange
  purple  = "#9D79D0",  -- deep violet
  cyan    = "#7AA89F",  -- wave teal
  magenta = "#D27E99",  -- sakura pink

  white   = "#DCD7BA",
  gray    = "#727169",
  dim     = "#1F1F28",
  sel     = "#2D4F67",
  gold    = "#E6C384",
}

local function hl(g, o) vim.api.nvim_set_hl(0, g, o) end

----------------------------------------------------------
-- Core UI
----------------------------------------------------------
hl("Normal",         { fg = C.fg,   bg = "NONE" })
hl("NormalFloat",    { fg = C.fg,   bg = "NONE" })
hl("FloatBorder",    { fg = C.gray, bg = "NONE" })

hl("CursorLine",     { bg = "#1b1b23" })
hl("CursorLineNr",   { fg = C.orange, bold = true })
hl("LineNr",         { fg = C.gray })
hl("SignColumn",     { bg = "NONE" })

hl("Visual",         { bg = C.sel })

hl("Search",         { bg = C.yellow, fg = "#000000" })
hl("IncSearch",      { bg = C.orange, fg = "#000000", bold = true })

hl("StatusLine",     { fg = C.white, bg = "NONE" })
hl("StatusLineNC",   { fg = C.gray,  bg = "NONE" })
hl("WinBar",         { fg = C.white, bg = "NONE" })
hl("WinBarNC",       { fg = C.gray,  bg = "NONE" })

hl("VertSplit",      { fg = C.dim })
hl("ColorColumn",    { bg = "#1b1b23" })

hl("Pmenu",          { fg = C.white, bg = "#1b1b23" })
hl("PmenuSel",       { fg = "#000000", bg = C.cyan })

hl("Whitespace",     { fg = C.dim })

----------------------------------------------------------
-- Basic Syntax
--  strings   → green    (consistent with SC)
--  numbers   → magenta  (distinctive)
--  functions → green    (organic)
--  keywords  → orange   (assertive)
--  types     → blue     (structural)
--  operators → cyan
--  constants → purple
----------------------------------------------------------
hl("Comment",    { fg = C.gray,   italic = true })
hl("Constant",   { fg = C.purple })
hl("String",     { fg = C.green })
hl("Number",     { fg = C.magenta })
hl("Boolean",    { fg = C.magenta })
hl("Identifier", { fg = C.fg })
hl("Function",   { fg = C.green })
hl("Statement",  { fg = C.orange })
hl("Keyword",    { fg = C.orange, bold = true })
hl("Type",       { fg = C.blue })
hl("Operator",   { fg = C.cyan })
hl("Error",      { fg = C.red })
hl("Todo",       { fg = C.yellow, bold = true })

----------------------------------------------------------
-- Tree-sitter
----------------------------------------------------------
hl("@comment",               { link = "Comment" })
hl("@string",                { fg = C.green })
hl("@string.escape",         { fg = C.orange })
hl("@string.special.symbol", { fg = C.cyan })

hl("@number",                { fg = C.magenta })
hl("@float",                 { fg = C.magenta })
hl("@boolean",               { fg = C.magenta })

hl("@variable",              { fg = C.fg })
hl("@variable.builtin",      { fg = C.cyan })

hl("@field",                 { fg = C.cyan })
hl("@property",              { fg = C.cyan })

hl("@function",              { fg = C.green })
hl("@function.call",         { fg = C.green })
hl("@method",                { fg = C.green })
hl("@method.call",           { fg = C.green })

hl("@constructor",           { fg = C.purple })
hl("@keyword",               { fg = C.orange })
hl("@keyword.function",      { fg = C.orange, bold = true })
hl("@keyword.return",        { fg = C.orange, bold = true })
hl("@keyword.operator",      { fg = C.cyan })

hl("@type",                  { fg = C.blue })
hl("@type.builtin",          { fg = C.blue, italic = true })

hl("@namespace",             { fg = C.purple })
hl("@operator",              { fg = C.cyan })
hl("@constant",              { fg = C.purple })
hl("@constant.builtin",      { fg = C.magenta })

----------------------------------------------------------
-- Haskell / Tidal
--  UGens (variables, function calls) → red — they pop
--  keywords  → orange
--  types     → blue
--  strings   → yellow
--  numbers   → magenta
--  modules   → purple
----------------------------------------------------------
hl("@keyword.haskell",               { fg = C.orange,  bold = true })
hl("@keyword.import.haskell",        { fg = C.orange,  bold = true })
hl("@keyword.conditional.haskell",   { fg = C.orange,  bold = true })
hl("@keyword.repeat.haskell",        { fg = C.orange,  bold = true })

hl("@type.haskell",                  { fg = C.blue,    bold = true })
hl("@type.builtin.haskell",          { fg = C.blue,    italic = true })

hl("@constructor.haskell",           { fg = C.purple,  bold = true })

hl("@module.haskell",                { fg = C.purple,  bold = true })
hl("@namespace.haskell",             { fg = C.purple })

-- UGens / Tidal functions — the star of the show
hl("@variable.haskell",              { fg = C.red })
hl("@function.call.haskell",         { fg = C.red })

hl("@variable.parameter.haskell",    { fg = C.cyan,    italic = true })
hl("@variable.builtin.haskell",      { fg = C.magenta })

hl("@string.haskell",                { fg = C.green })
hl("@string.escape.haskell",         { fg = C.orange })

hl("@number.haskell",                { fg = C.magenta })

hl("@operator.haskell",              { fg = C.cyan,    bold = true })
hl("@punctuation.special.haskell",   { fg = C.orange })
hl("@punctuation.delimiter.haskell", { fg = C.gray })
hl("@punctuation.bracket.haskell",   { fg = C.white })

hl("@comment.haskell",               { fg = C.gray,    italic = true })

----------------------------------------------------------
-- SuperCollider (scnvim)
--  strings → green
--  UGens / classes → red
--  methods (.ar, .kr, unary) → blue
----------------------------------------------------------
hl("scString",         { fg = C.green })
hl("scChar",           { fg = C.green })
hl("scObject",         { fg = C.red })
hl("scArate",          { fg = C.blue,   bold = true })
hl("scKrate",          { fg = C.blue,   bold = true })
hl("scUnaryoperator",  { fg = C.blue })

----------------------------------------------------------
-- Telescope
----------------------------------------------------------
hl("TelescopeNormal",       { fg = C.fg,     bg = "NONE" })
hl("TelescopeBorder",       { fg = C.gray,   bg = "NONE" })
hl("TelescopeSelection",    { fg = C.yellow, bg = "NONE", bold = true })
hl("TelescopeMatching",     { fg = C.orange, bg = "NONE", bold = true })
hl("TelescopePromptNormal", { fg = C.fg,     bg = "NONE" })
hl("TelescopePromptBorder", { fg = C.gray,   bg = "NONE" })

----------------------------------------------------------
-- NvimTree
----------------------------------------------------------
hl("NvimTreeNormal",           { fg = C.fg,      bg = "NONE" })
hl("NvimTreeEndOfBuffer",      { bg = "NONE" })
hl("NvimTreeFolderIcon",       { fg = C.cyan })
hl("NvimTreeFolderName",       { fg = C.cyan })
hl("NvimTreeOpenedFolderName", { fg = C.cyan,    bold = true })
hl("NvimTreeRootFolder",       { fg = C.purple })
hl("NvimTreeExecFile",         { fg = C.green })
hl("NvimTreeSpecialFile",      { fg = C.yellow })
hl("NvimTreeGitDirty",         { fg = C.orange })
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
hl("GitSignsChange",  { fg = C.cyan })
hl("GitSignsDelete",  { fg = C.red })
