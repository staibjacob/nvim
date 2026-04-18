
-- ABLETON 12 DEFAULT
-- Neutral, cool, low-contrast UI inspired by Ableton Live 12 default theme
-- Flat panels, steel greys, muted diagnostics, zero saturation

local C = {
  bg      = "none",

  -- UI surfaces
  panel   = "#1E1F22",   -- main Ableton panel grey
  panel2  = "#232427",   -- slightly raised surface
  char    = "#141517",   -- deepest background
  border  = "#2B2C30",

  -- Text
  fg      = "#D6D7D9",   -- primary text
  dim     = "#A6A8AB",   -- secondary text
  faint   = "#7D8086",   -- comments / gutters

  -- Ableton-style accents (VERY restrained)
  steel   = "#8E939A",   -- operators / punctuation
  blue    = "#7FA2B8",   -- info / selection accent
  teal    = "#7FA7A2",   -- identifiers
  green   = "#8FAF9F",   -- success / types
  amber   = "#B8A97A",   -- warnings (desaturated)
  rose    = "#B48A8A",   -- errors (dusty, not red)
}

vim.cmd("highlight clear")
vim.o.background = "dark"
vim.g.colors_name = "ableton12"

local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

----------------------------------------------------------------------
-- CORE UI
----------------------------------------------------------------------

hl("Normal",         { fg = C.fg, bg = C.bg })
hl("NormalFloat",    { fg = C.fg, bg = C.panel })
hl("FloatBorder",    { fg = C.border, bg = C.panel })

hl("CursorLine",     { bg = C.panel2 })
hl("CursorLineNr",   { fg = C.fg, bold = true })
hl("LineNr",         { fg = C.faint })
hl("SignColumn",     { bg = C.bg })

hl("Visual",         { bg = "#2A2D33" })
hl("Search",         { bg = C.blue, fg = C.char })
hl("IncSearch",      { bg = C.teal, fg = C.char })

hl("StatusLine",     { fg = C.dim, bg = "NONE" })
hl("StatusLineNC",   { fg = C.faint, bg = "NONE" })
hl("WinBar",         { fg = C.dim, bg = "NONE" })
hl("WinBarNC",       { fg = C.faint, bg = "NONE" })

hl("VertSplit",      { fg = C.border, bg = "NONE" })
hl("Pmenu",          { fg = C.fg, bg = C.panel })
hl("PmenuSel",       { fg = C.char, bg = C.blue })

----------------------------------------------------------------------
-- STANDARD SYNTAX
----------------------------------------------------------------------

hl("Comment",        { fg = C.faint, italic = true })

hl("String",         { fg = C.green })
hl("Character",      { fg = C.green })
hl("Constant",       { fg = C.dim })
hl("Number",         { fg = C.amber })
hl("Float",          { fg = C.amber })
hl("Boolean",        { fg = C.dim })

hl("Identifier",     { fg = C.teal })
hl("Function",       { fg = C.blue })
hl("Method",         { fg = C.blue })

hl("Type",           { fg = C.green })
hl("Typedef",        { fg = C.green })
hl("Structure",      { fg = C.green })

hl("Keyword",        { fg = C.steel })
hl("Conditional",    { fg = C.steel })
hl("Repeat",         { fg = C.steel })
hl("Operator",       { fg = C.steel })

hl("Delimiter",      { fg = C.steel })
hl("Special",        { fg = C.teal })
hl("SpecialChar",    { fg = C.teal })

----------------------------------------------------------------------
-- TREE-SITTER (ABLETON STYLE)
----------------------------------------------------------------------

hl("@comment",                  { fg = C.faint, italic = true })

hl("@string",                   { fg = C.green })
hl("@string.regex",             { fg = C.dim })
hl("@string.escape",            { fg = C.amber })

hl("@constant",                 { fg = C.dim })
hl("@constant.builtin",         { fg = C.amber })
hl("@number",                   { fg = C.amber })
hl("@float",                    { fg = C.amber })

hl("@variable",                 { fg = C.teal })
hl("@variable.builtin",         { fg = C.dim })
hl("@variable.parameter",       { fg = C.dim })

hl("@function",                 { fg = C.blue })
hl("@function.builtin",         { fg = C.teal })
hl("@method",                   { fg = C.blue })
hl("@constructor",              { fg = C.steel })

hl("@type",                     { fg = C.green })
hl("@type.builtin",             { fg = C.green })
hl("@field",                    { fg = C.teal })
hl("@property",                 { fg = C.teal })

hl("@keyword",                  { fg = C.steel })
hl("@keyword.function",         { fg = C.steel })
hl("@conditional",              { fg = C.steel })
hl("@repeat",                   { fg = C.steel })

hl("@operator",                 { fg = C.steel })

hl("@punctuation.delimiter",    { fg = C.steel })
hl("@punctuation.bracket",      { fg = C.steel })
hl("@punctuation.special",      { fg = C.blue })

----------------------------------------------------------------------
-- DIAGNOSTICS (ABLETON-LIKE: QUIET, NOT ALARMIST)
----------------------------------------------------------------------

hl("DiagnosticError", { fg = C.rose })
hl("DiagnosticWarn",  { fg = C.amber })
hl("DiagnosticInfo",  { fg = C.blue })
hl("DiagnosticHint",  { fg = C.dim })

----------------------------------------------------------------------
-- DISABLE LSP SEMANTIC TOKEN COLORS
----------------------------------------------------------------------

local semantic_groups = vim.fn.getcompletion("@lsp", "highlight")
for _, group in ipairs(semantic_groups) do
  vim.api.nvim_set_hl(0, group, {})
end

----------------------------------------------------------------------
-- END
----------------------------------------------------------------------
