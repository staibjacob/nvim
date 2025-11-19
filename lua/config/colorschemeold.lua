  -- File: ~/.config/nvim/colors/mytheme.lua
-- Dark theme with warm-black background (#080501), Tree-sitter, LSP,
-- SCNvim (sclang), and Haskell language tweaks.

local C = {
  -- core palette
  bg     = "#080501", -- warm-brown background
  fg     = "#d4d4d4",
  red    = "#d16969", -- darker red (for classes)
  orange = "#ce9178",
  yellow = "#dcdcaa",
  green  = "#6a9955", -- strings
  greent = "#E37DD9",
  blue   = "#569cd6",
  purple = "#c586c0",
  cyan   = "#4ec9b0", -- methods/functions
  gray   = "#808080",
  dim    = "#0e0b07",
  panel  = "#12100b",
  sel    = "#254d76",
  subtle = "#1a1610",
  flyguy = "#ded666",

  -- tuned accents
  string_orange = "#b7785f",
  number_amber  = "#d7ba7d",
}

-- Reset
vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end
vim.o.background = "dark"
vim.g.colors_name = "mytheme"

local function hl(group, opts) vim.api.nvim_set_hl(0, group, opts) end

--------------------------------------------------------------------
-- Core UI
--------------------------------------------------------------------
hl("Normal",         { fg = C.fg, bg = C.bg })
hl("NormalFloat",    { fg = C.fg, bg = C.panel })
hl("CursorLine",     { bg = C.dim })
hl("CursorLineNr",   { fg = C.yellow, bold = true })
hl("LineNr",         { fg = "#6b655a" })  -- warm gray
hl("SignColumn",     { bg = C.bg })

hl("Pmenu",          { fg = C.fg, bg = C.panel })
hl("PmenuSel",       { bg = C.sel })
hl("PmenuSbar",      { bg = C.dim })
hl("PmenuThumb",     { bg = C.subtle })

hl("Visual",         { bg = C.sel })
hl("MatchParen",     { bg = C.subtle })

hl("Search",         { bg = "#2a3a55", fg = C.yellow })
hl("IncSearch",      { bg = "#34465f", fg = C.yellow, bold = true })

hl("VertSplit",      { fg = C.subtle })
hl("WinSeparator",   { fg = C.subtle })
hl("StatusLine",     { fg = C.fg, bg = C.panel })
hl("StatusLineNC",   { fg = C.gray, bg = C.panel })
hl("Folded",         { fg = C.gray, bg = C.dim })
hl("Whitespace",     { fg = "#2a241b" })

--------------------------------------------------------------------
-- Classic syntax (fallbacks)
--------------------------------------------------------------------
hl("Comment",        { fg = C.gray, italic = true })
hl("Constant",       { fg = C.yellow })
hl("String",         { fg = C.green })
hl("Character",      { fg = C.green })
hl("Number",         { fg = C.number_amber })
hl("Boolean",        { fg = C.number_amber })
hl("Identifier",     { fg = C.cyan })
hl("Function",       { fg = C.cyan }) -- cyan functions
hl("Statement",      { fg = C.blue })
hl("Keyword",        { fg = C.blue, bold = true })
hl("Type",           { fg = C.purple })
hl("Operator",       { fg = C.fg })
hl("Error",          { fg = C.red, bold = true })
hl("Todo",           { fg = C.purple, bold = true })

--------------------------------------------------------------------
-- Diagnostics (LSP)
--------------------------------------------------------------------
hl("DiagnosticError", { fg = C.red })
hl("DiagnosticWarn",  { fg = C.yellow })
hl("DiagnosticInfo",  { fg = C.blue })
hl("DiagnosticHint",  { fg = C.cyan })
hl("DiagnosticOk",    { fg = C.green })

hl("DiagnosticUnderlineError", { undercurl = true, sp = C.red })
hl("DiagnosticUnderlineWarn",  { undercurl = true, sp = C.yellow })
hl("DiagnosticUnderlineInfo",  { undercurl = true, sp = C.blue })
hl("DiagnosticUnderlineHint",  { undercurl = true, sp = C.cyan })

--------------------------------------------------------------------
-- Git signs / diffs
--------------------------------------------------------------------
hl("DiffAdd",        { bg = "#12321a" })
hl("DiffChange",     { bg = "#152a3d" })
hl("DiffDelete",     { bg = "#311a1a" })
hl("DiffText",       { bg = "#1f3552" })
hl("GitSignsAdd",    { fg = C.green })
hl("GitSignsChange", { fg = C.blue })
hl("GitSignsDelete", { fg = C.red })

--------------------------------------------------------------------
-- Telescope
--------------------------------------------------------------------
hl("TelescopeNormal",       { fg = C.fg, bg = C.panel })
hl("TelescopeBorder",       { fg = C.subtle, bg = C.panel })
hl("TelescopePromptNormal", { fg = C.fg, bg = C.panel })
hl("TelescopeSelection",    { bg = C.sel })

--------------------------------------------------------------------
-- Completion (nvim-cmp)
--------------------------------------------------------------------
hl("CmpItemAbbr",          { fg = C.fg })
hl("CmpItemAbbrMatch",     { fg = C.blue, bold = true })
hl("CmpItemAbbrDeprecated",{ fg = C.gray, strikethrough = true })
hl("CmpItemKindFunction",  { fg = C.cyan })
hl("CmpItemKindVariable",  { fg = C.cyan })
hl("CmpItemKindKeyword",   { fg = C.blue })
hl("CmpItemMenu",          { fg = C.gray })

--------------------------------------------------------------------
-- Tree-sitter (base captures)
--------------------------------------------------------------------
hl("@comment",                  { link = "Comment" })
hl("@punctuation.delimiter",    { fg = C.fg })
hl("@punctuation.bracket",      { fg = C.fg })
hl("@punctuation.special",      { fg = C.fg })

hl("@string",        { fg = C.green })
hl("@string.regex",  { fg = C.green })
hl("@string.escape", { fg = C.number_amber })
hl("@character",     { fg = C.green })
hl("@number",        { fg = C.number_amber })
hl("@float",         { fg = C.number_amber })
hl("@boolean",       { fg = C.number_amber })
hl("@constant",                 { link = "Constant" })
hl("@constant.builtin",         { fg = C.yellow, bold = true })
hl("@constant.macro",           { fg = C.yellow })

hl("@variable",                 { fg = C.fg })
hl("@variable.builtin",         { fg = C.cyan, italic = true })
hl("@variable.parameter",       { fg = C.fg })
hl("@variable.member",          { fg = C.cyan })
hl("@field",                    { fg = C.cyan })
hl("@property",                 { fg = C.cyan })
hl("@symbol",                   { fg = C.orange })

hl("@function",                 { fg = C.cyan })
hl("@function.builtin",         { fg = C.cyan, bold = true })
hl("@function.macro",           { fg = C.cyan })
hl("@method",                   { fg = C.cyan })
hl("@constructor",              { fg = C.purple })

hl("@keyword",                  { link = "Keyword" })
hl("@keyword.function",         { fg = C.blue, bold = true })
hl("@keyword.return",           { fg = C.blue })
hl("@keyword.operator",         { fg = C.blue })
hl("@keyword.import",           { fg = C.blue })
hl("@conditional",              { fg = C.blue })
hl("@repeat",                   { fg = C.blue })
hl("@label",                    { fg = C.blue })

hl("@type",                     { link = "Type" })
hl("@type.builtin",             { fg = C.purple, italic = true })
hl("@type.definition",          { fg = C.purple })
hl("@type.qualifier",           { fg = C.purple })
hl("@namespace",                { fg = C.purple })
hl("@operator",                 { link = "Operator" })

hl("@attribute",                { fg = C.purple })
hl("@tag",                      { fg = C.blue })
hl("@tag.attribute",            { fg = C.cyan })
hl("@tag.delimiter",            { fg = C.fg })

hl("@markup.strong",            { bold = true })
hl("@markup.italic",            { italic = true })
hl("@markup.strikethrough",     { strikethrough = true })
hl("@markup.underline",         { underline = true })
hl("@markup.heading",           { fg = C.purple, bold = true })
hl("@markup.link",              { fg = C.blue, underline = true })
hl("@markup.link.url",          { fg = C.cyan, underline = true })
hl("@markup.list",              { fg = C.yellow })
hl("@markup.raw",               { fg = C.orange })

hl("@error",                    { fg = C.red, bold = true })

--------------------------------------------------------------------
-- SCNvim / SuperCollider
--------------------------------------------------------------------


-- Classes → always red
hl("scClass",                         { fg = C.red, bold = true })
hl("sclangClass",                     { fg = C.red, bold = true }) -- regex fallback
hl("@type.class.supercollider",       { fg = C.red, bold = true })
hl("@constructor.supercollider",      { fg = C.red, bold = true }) -- in case constructors map here
hl("@type.supercollider",             { fg = C.red, bold = true })

-- Strings → green
hl("scString", { fg = C.green })
hl("@string.supercollider", { fg = C.green })
hl("scChar", { fg = C.green })

-- Numbers → amber
hl("scNumber", { fg = C.number_amber })
hl("scBoolean", { fg = C.number_amber })
hl("@number.supercollider", { fg = C.number_amber })

-- Keywords → blue
hl("scKeyword", { fg = C.blue, bold = true })
hl("@keyword.supercollider", { fg = C.blue, bold = true })

-- Functions / methods → cyan
hl("scFunction", { fg = C.cyan, bold = true })
hl("@function.method.supercollider", { fg = C.cyan, bold = true })

-- Identifiers → cyan
hl("scIdentifier", { fg = C.cyan })

-- Env vars (~foo) → purple
hl("scEnvVar", { fg = C.purple, italic = true })
hl("@variable.environment.supercollider", { fg = C.purple, italic = true })

-- SuperCollider args → purple
hl("@variable.parameter.supercollider", { fg = C.flyguy, italic = false })  -- new-style capture
hl("@parameter.supercollider",          { fg = C.flyguy, italic = false })  -- legacy capture used by some queries
hl("sclangArg",                          { fg = C.flyguy, italic = false })  -- regex fallback from SCNvim's sclang.vim
-- (Optional, in case LSP tags them)
hl("@lsp.type.parameter",                { fg = C.purple, italic = false })


-- SuperCollider local vars → green
hl("sclangVar",                  { fg = C.purple }) -- regex fallback group from SCNvim
hl("@variable.supercollider",     { fg = C.purple })
hl("@identifier.supercollider",   { fg = C.purple }) -- sometimes used instead
hl("@lsp.type.variable",          { fg = C.purple }) -- in case LSP decorates them

-- SuperCollider function calls (rrand, exprand, wchoose, etc.)
hl("@function.call.supercollider", { fg = C.cyan, bold = true })
hl("@function.call",               { fg = C.cyan, bold = true }) -- fallback if lang not attached
hl("sclangPrimitive",              { fg = C.cyan, bold = true }) -- regex fallback

-- Symbols → blue
hl("scSymbol", { fg = C.blue })
hl("@symbol.supercollider", { fg = C.blue })

hl("@comment.supercollider", { fg = C.gray, italic = true })
hl("@operator.supercollider", { fg = C.orange })
hl("@punctuation.delimiter.supercollider", { fg = C.yellow })
hl("@punctuation.bracket.supercollider", { fg = C.yellow })
hl("@property.supercollider", { fg = "#0F0C97" })
hl("@constant.supercollider", { fg = C.purple })
--------------------------------------------------------------------
-- Haskell
--------------------------------------------------------------------
hl("@keyword.haskell",            { fg = C.red, bold = true })
hl("@function.haskell",           { fg = C.red })
hl("@constructor.haskell",        { fg = C.purple, bold = true })
hl("@type.haskell",               { fg = C.purple })
hl("@type.builtin.haskell",       { fg = C.purple, italic = true })
hl("@operator.haskell",           { fg = C.fg })
hl("@variable.parameter.haskell", { fg = C.red })
hl("@field.haskell",              { fg = C.red })
hl("@module.haskell",             { fg = C.yellow })
hl("@comment.haskell",            { link = "Comment" })
hl("@string.haskell",             { fg = C.green })
hl("@character.haskell",          { fg = C.green })
hl("@number.haskell",             { fg = C.number_amber })
hl("@boolean.haskell",            { fg = C.number_amber })

-- Legacy Vim regex groups
hl("haskellType",        { fg = C.purple, italic = true })
hl("haskellIdentifier",  { fg = C.red })
hl("haskellDeclKeyword", { fg = C.red, bold = true })


-- Match winbar background to your theme
vim.api.nvim_set_hl(0, "WinBar",   { fg = "#d4d4d4", bg = "#080501" })
vim.api.nvim_set_hl(0, "WinBarNC", { fg = "#808080", bg = "#080501" })

