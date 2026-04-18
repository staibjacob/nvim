
-- WASTELAND: Dry, muted, post-industrial, dust-blasted theme
-- Fully transparent, no neon, no saturation, full Tree-sitter + LSP support

local C = {
  bg      = "none",
  panel   = "#151412",   -- dark clay
  fg      = "#D8D5CD",   -- bone ash

  sand    = "#C9BA9E",   -- dry sand
  oxide   = "#A0856A",   -- rusted alloy
  lichen  = "#8FA18A",   -- sun-bleached plant
  slate   = "#74848C",   -- old machinery steel
  rose    = "#A68C8F",   -- faded paint
  amber   = "#D5C5A3",   -- sun-damaged amber
  teal    = "#7A8D8A",   -- oxidized copper
  ashen   = "#888682",   -- aged cement
  char    = "#1A1918",   -- almost-black clay
}

vim.cmd("highlight clear")
vim.o.background = "dark"
vim.g.colors_name = "wasteland"

local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

----------------------------------------------------------------------
-- CORE UI
----------------------------------------------------------------------

hl("Normal",         { fg = C.fg, bg = C.bg })
hl("NormalFloat",    { fg = C.fg, bg = C.panel })
hl("FloatBorder",    { fg = C.ashen })

hl("CursorLine",     { bg = C.char })
hl("CursorLineNr",   { fg = C.amber, bold = true })
hl("LineNr",         { fg = C.ashen })
hl("SignColumn",     { bg = C.bg })

hl("Visual",         { bg = "#24221f" })
hl("Search",         { bg = C.slate, fg = C.bg })
hl("IncSearch",      { bg = C.rose, fg = C.bg })

hl("StatusLine",     { fg = C.fg, bg = "NONE" })
hl("StatusLineNC",   { fg = C.ashen, bg = "NONE" })
hl("WinBar",         { fg = C.fg, bg = "NONE" })
hl("WinBarNC",       { fg = C.ashen, bg = "NONE" })

hl("VertSplit",      { fg = C.char, bg = "NONE" })
hl("Pmenu",          { fg = C.fg, bg = C.panel })
hl("PmenuSel",       { fg = C.bg, bg = C.oxide })

----------------------------------------------------------------------
-- STANDARD SYNTAX
----------------------------------------------------------------------

hl("Comment",        { fg = C.ashen, italic = true })

hl("String",         { fg = C.rose })     -- UNIQUE
hl("Character",      { fg = C.rose })
hl("Constant",       { fg = C.sand })
hl("Number",         { fg = C.amber })
hl("Float",          { fg = C.amber })
hl("Boolean",        { fg = C.sand })

hl("Identifier",     { fg = C.teal })
hl("Function",       { fg = C.slate })
hl("Method",         { fg = C.slate })

hl("Type",           { fg = C.lichen })
hl("Typedef",        { fg = C.lichen })
hl("Structure",      { fg = C.lichen })

hl("Keyword",        { fg = C.oxide })
hl("Conditional",    { fg = C.oxide })
hl("Repeat",         { fg = C.oxide })
hl("Operator",       { fg = C.ashen })

hl("Delimiter",      { fg = C.ashen })
hl("Special",        { fg = C.teal })
hl("SpecialChar",    { fg = C.teal })

----------------------------------------------------------------------
-- TREE-SITTER (FULL, CUSTOM PALETTE)
----------------------------------------------------------------------

-- COMMENTS
hl("@comment",                  { fg = C.ashen, italic = true })

-- STRINGS
hl("@string",                   { fg = C.rose })
hl("@string.regex",             { fg = C.sand })
hl("@string.escape",            { fg = C.amber })

-- CONSTANTS / NUMBERS
hl("@constant",                 { fg = C.sand })
hl("@constant.builtin",         { fg = C.amber })
hl("@number",                   { fg = C.amber })
hl("@float",                    { fg = C.amber })

-- VARIABLES
hl("@variable",                 { fg = C.teal })
hl("@variable.builtin",         { fg = C.sand })
hl("@variable.parameter",       { fg = C.oxide })

-- FUNCTIONS
hl("@function",                 { fg = C.slate })
hl("@function.builtin",         { fg = C.teal })
hl("@method",                   { fg = C.slate })
hl("@constructor",              { fg = C.oxide })

-- TYPES
hl("@type",                     { fg = C.lichen })
hl("@type.builtin",             { fg = C.sand })
hl("@field",                    { fg = C.teal })
hl("@property",                 { fg = C.teal })

-- KEYWORDS
hl("@keyword",                  { fg = C.oxide })
hl("@keyword.function",         { fg = C.oxide })
hl("@conditional",              { fg = C.oxide })
hl("@repeat",                   { fg = C.oxide })

-- OPERATORS
hl("@operator",                 { fg = C.ashen })

-- PUNCTUATION (THIS FIXES YOUR BRACKETS)
hl("@punctuation.delimiter",    { fg = C.ashen })
hl("@punctuation.bracket",      { fg = C.ashen })
hl("@punctuation.special",      { fg = C.slate })

----------------------------------------------------------------------
-- DIAGNOSTICS
----------------------------------------------------------------------

hl("DiagnosticError", { fg = C.rose })
hl("DiagnosticWarn",  { fg = C.amber })
hl("DiagnosticInfo",  { fg = C.teal })
hl("DiagnosticHint",  { fg = C.lichen })

----------------------------------------------------------------------
-- DISABLE LSP SEMANTIC TOKEN COLORS
-- prevents neon overrides from language servers
----------------------------------------------------------------------

local semantic_groups = vim.fn.getcompletion("@lsp", "highlight")
for _, group in ipairs(semantic_groups) do
  vim.api.nvim_set_hl(0, group, {})
end

----------------------------------------------------------------------
-- END
----------------------------------------------------------------------

