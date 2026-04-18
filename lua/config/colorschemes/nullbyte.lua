
-- NULL-BYTE
-- Faded data. Old phosphor. Signals through static.
-- Background: NONE (transparent)

local C = {
  bg        = "none",
  fg        = "#8fa0b0",      -- muted blue-grey body text
  panel     = "#0b0f14",
  shadow    = "#070a0d",

  dim       = "#354048",      -- very dim: punctuation, brackets
  ghost     = "#2a333b",      -- near-invisible: separators

  -- faded phosphor green: strings
  green     = "#4d7a5a",
  dim_green = "#2e4a38",

  -- dusty cyan: functions
  cyan      = "#3d7a88",
  dim_cyan  = "#264f58",

  -- slate: keywords
  slate     = "#5a5a7a",
  dim_slate = "#3a3a52",

  -- sage: numbers/constants
  sage      = "#6a7a58",

  -- muted teal: types
  teal      = "#3d7070",

  -- steel: variables, identifiers
  steel     = "#5a7088",
  ice       = "#6a8098",

  -- fault (kept dim)
  fault     = "#7a3a44",
  warn      = "#7a5a2a",
}

vim.cmd("highlight clear")
vim.o.background = "dark"
vim.g.colors_name = "null-byte"

local function hl(g, o)
  vim.api.nvim_set_hl(0, g, o)
end

----------------------------------------------------------------------
-- UI
----------------------------------------------------------------------

hl("Normal",       { fg = C.fg,    bg = C.bg })
hl("NormalFloat",  { fg = C.fg,    bg = C.panel })
hl("NormalNC",     { fg = C.steel, bg = C.bg })
hl("FloatBorder",  { fg = C.ghost })

hl("CursorLine",   { bg = C.shadow })
hl("CursorLineNr", { fg = C.dim_cyan })
hl("LineNr",       { fg = C.ghost })
hl("SignColumn",   { bg = C.bg })

hl("Visual",       { bg = C.dim_slate })
hl("Search",       { fg = C.shadow, bg = C.sage })
hl("IncSearch",    { fg = C.shadow, bg = C.dim_cyan })

hl("VertSplit",    { fg = C.ghost })
hl("WinSeparator", { fg = C.ghost })
hl("Pmenu",        { fg = C.fg,    bg = C.panel })
hl("PmenuSel",     { fg = C.shadow, bg = C.dim_cyan })
hl("PmenuSbar",    { bg = C.panel })
hl("PmenuThumb",   { bg = C.ghost })

hl("StatusLine",   { fg = C.steel, bg = "none" })
hl("StatusLineNC", { fg = C.ghost, bg = "none" })

----------------------------------------------------------------------
-- SYNTAX
----------------------------------------------------------------------

hl("Comment",     { fg = C.ghost,   italic = true })
hl("String",      { fg = C.green })
hl("Character",   { fg = C.green })
hl("Number",      { fg = C.sage })
hl("Float",       { fg = C.sage })
hl("Boolean",     { fg = C.sage })
hl("Constant",    { fg = C.sage })

hl("Identifier",  { fg = C.ice })
hl("Function",    { fg = C.cyan })

hl("Keyword",     { fg = C.slate })
hl("Statement",   { fg = C.slate })
hl("Conditional", { fg = C.slate })
hl("Repeat",      { fg = C.slate })
hl("Exception",   { fg = C.fault })
hl("Label",       { fg = C.slate })

hl("Type",        { fg = C.teal })
hl("Structure",   { fg = C.teal })
hl("StorageClass",{ fg = C.teal })
hl("Typedef",     { fg = C.teal })

hl("Operator",    { fg = C.dim })
hl("Delimiter",   { fg = C.ghost })

hl("PreProc",     { fg = C.steel })
hl("Include",     { fg = C.steel })
hl("Define",      { fg = C.steel })
hl("Macro",       { fg = C.steel })

hl("Special",     { fg = C.fault })
hl("SpecialChar", { fg = C.fault })

----------------------------------------------------------------------
-- TREE-SITTER
----------------------------------------------------------------------

hl("@comment",                  { fg = C.ghost,    italic = true })

hl("@string",                   { fg = C.green })
hl("@string.escape",            { fg = C.dim_green })
hl("@number",                   { fg = C.sage })
hl("@float",                    { fg = C.sage })
hl("@boolean",                  { fg = C.sage })

hl("@variable",                 { fg = C.ice })
hl("@variable.parameter",       { fg = C.steel })
hl("@variable.builtin",         { fg = C.dim_cyan })

hl("@function",                 { fg = C.cyan })
hl("@function.builtin",         { fg = C.dim_cyan })
hl("@function.call",            { fg = C.cyan })
hl("@method",                   { fg = C.cyan })
hl("@method.call",              { fg = C.cyan })
hl("@constructor",              { fg = C.teal })

hl("@type",                     { fg = C.teal })
hl("@type.builtin",             { fg = C.teal })

hl("@keyword",                  { fg = C.slate })
hl("@keyword.return",           { fg = C.fault })
hl("@keyword.operator",         { fg = C.dim })

hl("@operator",                 { fg = C.dim })

hl("@constant",                 { fg = C.sage })
hl("@constant.builtin",         { fg = C.sage })

hl("@punctuation.bracket",      { fg = C.ghost })
hl("@punctuation.delimiter",    { fg = C.ghost })
hl("@punctuation.special",      { fg = C.dim })

hl("@property",                 { fg = C.steel })
hl("@field",                    { fg = C.steel })
hl("@attribute",                { fg = C.dim_cyan })

hl("@namespace",                { fg = C.teal,   italic = true })
hl("@module",                   { fg = C.teal,   italic = true })

hl("@tag",                      { fg = C.steel })
hl("@tag.attribute",            { fg = C.ice })
hl("@tag.delimiter",            { fg = C.ghost })

----------------------------------------------------------------------
-- DIAGNOSTICS
----------------------------------------------------------------------

hl("DiagnosticError",            { fg = C.fault })
hl("DiagnosticWarn",             { fg = C.warn })
hl("DiagnosticInfo",             { fg = C.dim_cyan })
hl("DiagnosticHint",             { fg = C.teal })
hl("DiagnosticVirtualTextError", { fg = C.fault, bg = "none" })
hl("DiagnosticVirtualTextWarn",  { fg = C.warn,  bg = "none" })
hl("DiagnosticVirtualTextInfo",  { fg = C.dim_cyan, bg = "none" })
hl("DiagnosticVirtualTextHint",  { fg = C.teal,  bg = "none" })

----------------------------------------------------------------------
-- GIT SIGNS
----------------------------------------------------------------------

hl("GitSignsAdd",    { fg = C.dim_green })
hl("GitSignsChange", { fg = C.sage })
hl("GitSignsDelete", { fg = C.fault })

----------------------------------------------------------------------
-- MISC
----------------------------------------------------------------------

hl("MatchParen",  { fg = C.cyan,  underline = true })
hl("Todo",        { fg = C.shadow, bg = C.dim_cyan })
hl("Error",       { fg = C.fault })
hl("Title",       { fg = C.steel })
hl("Directory",   { fg = C.steel })

----------------------------------------------------------------------
-- DISABLE LSP SEMANTIC TOKENS
----------------------------------------------------------------------

for _, g in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
  vim.api.nvim_set_hl(0, g, {})
end
