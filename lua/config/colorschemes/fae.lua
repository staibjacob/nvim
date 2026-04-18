
vim.cmd("highlight clear")
vim.cmd("syntax reset")
-- ELDERFAE: Ancient forest spirits, pastel-dusty mysticism
-- Moonlit vellum, mossy glyphs, quiet magic
-- Fully Tree-sitter + LSP safe, no neon, no saturation

local C = {
  ------------------------------------------------------------------
  -- CORE
  ------------------------------------------------------------------
  bg        = "none",   -- deep bark black (given)
  panel     = "#120d09",   -- shadowed wood
  fg        = "#e6e0d6",   -- aged parchment

  ------------------------------------------------------------------
  -- ACCENTS (ALL NEW PALETTE)
  ------------------------------------------------------------------
  moss      = "#9fb3a2",   -- soft forest growth
  sage      = "#b8c6a3",   -- herbal wisdom
  lilac     = "#b7a6d8",   -- fairy magic (strings!)
  moon      = "#d9d2c3",   -- lunar dust
  rune      = "#c6b1a0",   -- carved stone glyphs
  mist      = "#a6b6c9",   -- morning fog
  bark      = "#3a2b22",   -- old tree skin
  ember     = "#c89a7d",   -- ritual fire remains
  dusk      = "#8f8494",   -- twilight veil
  shadow    = "#1a120d",   -- near-black root
}

vim.cmd("highlight clear")
vim.o.background = "dark"
vim.g.colors_name = "elderfae"

local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

----------------------------------------------------------------------
-- CORE UI
----------------------------------------------------------------------

hl("Normal",         { fg = C.fg, bg = C.bg })
hl("NormalFloat",    { fg = C.fg, bg = C.panel })
hl("FloatBorder",    { fg = C.mist })

hl("CursorLine",     { bg = C.shadow })
hl("CursorLineNr",   { fg = C.lilac, bold = true })
hl("LineNr",         { fg = C.dusk })
hl("SignColumn",     { bg = "NONE" })

hl("Visual",         { bg = C.bark })
hl("Search",         { fg = C.bg, bg = C.moon })
hl("IncSearch",      { fg = C.bg, bg = C.lilac })

hl("StatusLine",     { fg = C.fg, bg = "NONE" })
hl("StatusLineNC",   { fg = C.dusk, bg = "NONE" })
hl("WinBar",         { fg = C.moon, bg = "NONE" })
hl("WinBarNC",       { fg = C.dusk, bg = "NONE" })

hl("VertSplit",      { fg = C.shadow, bg = "NONE" })
hl("Pmenu",          { fg = C.fg, bg = C.panel })
hl("PmenuSel",       { fg = C.bg, bg = C.moss })

----------------------------------------------------------------------
-- STANDARD SYNTAX
----------------------------------------------------------------------

hl("Comment",        { fg = C.dusk, italic = true })

hl("String",         { fg = C.lilac })   -- ✨ mystical purple strings
hl("Character",      { fg = C.lilac })
hl("Constant",       { fg = C.moon })
hl("Number",         { fg = C.ember })
hl("Float",          { fg = C.ember })
hl("Boolean",        { fg = C.sage })

hl("Identifier",     { fg = C.mist })
hl("Function",       { fg = C.moss })
hl("Method",         { fg = C.moss })

hl("Type",           { fg = C.sage })
hl("Typedef",        { fg = C.sage })
hl("Structure",      { fg = C.sage })

hl("Keyword",        { fg = C.rune })
hl("Conditional",    { fg = C.rune })
hl("Repeat",         { fg = C.rune })
hl("Operator",       { fg = C.dusk })

hl("Delimiter",      { fg = C.dusk })
hl("Special",        { fg = C.mist })
hl("SpecialChar",    { fg = C.mist })

----------------------------------------------------------------------
-- TREE-SITTER
----------------------------------------------------------------------

hl("@comment",                  { fg = C.dusk, italic = true })

hl("@string",                   { fg = C.lilac })
hl("@string.regex",             { fg = C.moon })
hl("@string.escape",            { fg = C.ember })

hl("@constant",                 { fg = C.moon })
hl("@constant.builtin",         { fg = C.ember })
hl("@number",                   { fg = C.ember })
hl("@float",                    { fg = C.ember })

hl("@variable",                 { fg = C.mist })
hl("@variable.builtin",         { fg = C.moon })
hl("@variable.parameter",       { fg = C.rune })

hl("@function",                 { fg = C.moss })
hl("@function.builtin",         { fg = C.sage })
hl("@method",                   { fg = C.moss })
hl("@constructor",              { fg = C.rune })

hl("@type",                     { fg = C.sage })
hl("@type.builtin",             { fg = C.moon })
hl("@field",                    { fg = C.mist })
hl("@property",                 { fg = C.mist })

hl("@keyword",                  { fg = C.rune })
hl("@keyword.function",         { fg = C.rune })
hl("@conditional",              { fg = C.rune })
hl("@repeat",                   { fg = C.rune })

hl("@operator",                 { fg = C.dusk })

hl("@punctuation.delimiter",    { fg = C.dusk })
hl("@punctuation.bracket",      { fg = C.dusk })
hl("@punctuation.special",      { fg = C.moon })

----------------------------------------------------------------------
-- DIAGNOSTICS
----------------------------------------------------------------------

hl("DiagnosticError", { fg = C.lilac })
hl("DiagnosticWarn",  { fg = C.ember })
hl("DiagnosticInfo",  { fg = C.mist })
hl("DiagnosticHint",  { fg = C.sage })

----------------------------------------------------------------------
-- DISABLE LSP SEMANTIC TOKEN COLORS
----------------------------------------------------------------------

local semantic_groups = vim.fn.getcompletion("@lsp", "highlight")
for _, group in ipairs(semantic_groups) do
  vim.api.nvim_set_hl(0, group, {})
end
