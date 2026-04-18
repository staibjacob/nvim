
-- RITUAL-MACHINE
-- Cold spectral skull-tech, occult signal noise
-- Background: NONE (transparent)

local C = {
  bg        = "none",
  fg        = "#d6dde6",
  panel     = "#121722",
  shadow    = "#0a0d12",

  ice       = "#9fb4c8",
  steel     = "#6e879d",
  fog       = "#7f96ab",

  void      = "#3b1f4a",
  ether     = "#7b3fa1",
  pulse     = "#b05acb",

  ember     = "#d47a3c",
  rust      = "#a8542e",

  bone      = "#b8c2cc",
  ash       = "#8a9099",
}

vim.cmd("highlight clear")
vim.o.background = "dark"
vim.g.colors_name = "ritual-machine"

local function hl(g, o)
  vim.api.nvim_set_hl(0, g, o)
end

----------------------------------------------------------------------
-- UI
----------------------------------------------------------------------

hl("Normal",       { fg = C.fg, bg = C.bg })
hl("NormalFloat",  { fg = C.fg, bg = C.panel })
hl("FloatBorder",  { fg = C.steel })

hl("CursorLine",   { bg = C.shadow })
hl("CursorLineNr", { fg = C.pulse, bold = true })
hl("LineNr",       { fg = C.ash })
hl("SignColumn",   { bg = C.bg })

hl("Visual",       { bg = C.void })
hl("Search",       { fg = C.bg, bg = C.ember })
hl("IncSearch",    { fg = C.bg, bg = C.pulse })

hl("VertSplit",    { fg = C.shadow })
hl("Pmenu",        { fg = C.fg, bg = C.panel })
hl("PmenuSel",     { fg = C.bg, bg = C.ether })

----------------------------------------------------------------------
-- SYNTAX
----------------------------------------------------------------------

hl("Comment",    { fg = C.ash, italic = true })

hl("String",     { fg = C.pulse })
hl("Character",  { fg = C.pulse })
hl("Number",     { fg = C.ember })
hl("Boolean",    { fg = C.ember })

hl("Identifier", { fg = C.bone })
hl("Function",   { fg = C.ice })
hl("Method",     { fg = C.ice })

hl("Type",       { fg = C.fog })
hl("Structure",  { fg = C.fog })

hl("Keyword",    { fg = C.ether })
hl("Conditional",{ fg = C.ether })
hl("Repeat",     { fg = C.ether })

hl("Operator",   { fg = C.steel })
hl("Delimiter",  { fg = C.steel })

----------------------------------------------------------------------
-- TREE-SITTER
----------------------------------------------------------------------

hl("@comment",                  { fg = C.ash, italic = true })

hl("@string",                   { fg = C.pulse })
hl("@number",                   { fg = C.ember })

hl("@variable",                 { fg = C.bone })
hl("@variable.parameter",       { fg = C.steel })

hl("@function",                 { fg = C.ice })
hl("@function.builtin",         { fg = C.pulse })

hl("@type",                     { fg = C.fog })
hl("@type.builtin",             { fg = C.bone })

hl("@keyword",                  { fg = C.ether })
hl("@operator",                 { fg = C.steel })

hl("@punctuation.bracket",      { fg = C.steel })
hl("@punctuation.delimiter",    { fg = C.steel })
hl("@punctuation.special",      { fg = C.ember })

----------------------------------------------------------------------
-- DIAGNOSTICS
----------------------------------------------------------------------

hl("DiagnosticError", { fg = C.pulse })
hl("DiagnosticWarn",  { fg = C.ember })
hl("DiagnosticInfo",  { fg = C.ice })
hl("DiagnosticHint",  { fg = C.fog })

----------------------------------------------------------------------
-- DISABLE LSP SEMANTIC TOKENS
----------------------------------------------------------------------

for _, g in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
  vim.api.nvim_set_hl(0, g, {})
end
