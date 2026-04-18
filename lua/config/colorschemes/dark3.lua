
-- File: colorschemes/dark3.lua
-- Dragon base tuned so SC's hi def link chain produces the right colors
-- without any sc-specific overrides. scnvim maps:
--   scObject        → Identifier  → red   (UGens)
--   scString/scChar → String      → green
--   scInteger/Float → Number/Float→ magenta (dusty rose)
--   scBinary/Unary  → Special     → sienna (warm terracotta)
--   scArate/Krate   → Statement   → orange (.ar / .kr)
--   scControl       → Statement   → orange
--   scAoperator     → Statement   → orange ({})
--   scSymbol        → Constant    → amber
--   scVar/scArg     → Type        → pink  (hot pink)
--   scGlobVariable  → Define      → purple
--   scKeyword       → Keyword     → orange
--   scBoolean       → Boolean     → magenta
-- Treesitter @-groups are set independently so other languages stay coherent.

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.o.background = "dark"
vim.g.colors_name = "dark3"

local C = {
  bg      = "#080501",
  fg      = "#DCD7BA",

  red     = "#C34043",   -- Identifier → scObject (UGens). Same red as dark.
  green   = "#98BB6C",   -- String     → scString
  blue    = "#7E9CD8",   -- Func       → treesitter functions
  pink    = "#E060A0",   -- Type       → scVar/scArg (hot pink)
  purple  = "#9D79D0",   -- Define     → scGlobVariable, treesitter @type
  cyan    = "#7AA89F",   -- treesitter builtins, fields, operators
  orange  = "#D4956A",   -- Statement  → .ar/.kr, control flow, keywords
  amber   = "#C9A96E",   -- Constant   → scSymbol
  sienna  = "#B87C5A",   -- Special    → binary/unary operators
  magenta = "#D27E99",   -- Number     → scInteger/scFloat (vivid dusty rose)
  rose    = "#C97B7B",   -- Haskell operators

  white   = "#DCD7BA",
  gray    = "#727169",
  dim     = "#1F1F28",
  sel     = "#2D4F67",
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

hl("Search",         { bg = C.amber,  fg = "#000000" })
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
-- Base Syntax (drives SC via hi def link chain)
----------------------------------------------------------
hl("Comment",    { fg = C.gray,    italic = true })
hl("Constant",   { fg = C.amber })               -- scSymbol
hl("String",     { fg = C.green })               -- scString, scChar
hl("Number",     { fg = C.magenta })             -- scInteger, scInfinity
hl("Float",      { fg = C.magenta })             -- scFloat
hl("Boolean",    { fg = C.magenta })             -- scBoolean
hl("Identifier", { fg = C.red })                 -- scObject (UGens!)
hl("Function",   { fg = C.blue })
hl("Statement",  { fg = C.orange })              -- scArate, scKrate, scControl, scAoperator
hl("Keyword",    { fg = C.orange,  bold = true })-- scKeyword
hl("Type",       { fg = C.pink })                -- scVar, scArg
hl("Special",    { fg = C.sienna })              -- scBinaryoperator, scUnaryoperator
hl("Define",     { fg = C.purple })              -- scGlobVariable
hl("Operator",   { fg = C.cyan })
hl("Error",      { fg = C.red })
hl("Todo",       { fg = C.amber,   bold = true })

----------------------------------------------------------
-- SuperCollider — explicit overrides via FileType autocmd
-- so they always win over hi def link in the syntax file.
----------------------------------------------------------
local gold = "#E6C384"   -- vivid gold for symbols

local function apply_sc_hl()
  hl("scVar",           { fg = C.pink })
  hl("scArg",           { fg = C.pink })
  hl("scSymbol",        { fg = gold })
  hl("scObject",        { fg = C.red })
  hl("scString",        { fg = C.green })
  hl("scChar",          { fg = C.green })
  hl("scInteger",       { fg = C.magenta })
  hl("scFloat",         { fg = C.magenta })
  hl("scInfinity",      { fg = C.magenta })
  hl("scBoolean",       { fg = C.magenta })
  hl("scGlobvariable",  { fg = C.purple })
  hl("scArate",         { fg = C.orange })
  hl("scKrate",         { fg = C.orange })
  hl("scUnaryoperator", { fg = C.sienna })
  hl("scBinaryoperator",{ fg = C.amber })
  hl("scAoperator",     { fg = C.orange })
  hl("scControl",       { fg = C.orange, bold = true })
  hl("scKeyword",       { fg = C.orange })
end

apply_sc_hl()
vim.api.nvim_create_autocmd("FileType", {
  pattern  = { "supercollider", "scdoc" },
  callback = apply_sc_hl,
})

----------------------------------------------------------
-- Tree-sitter (independent from base — other languages)
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

hl("@function",              { fg = C.blue })
hl("@function.call",         { fg = C.blue })
hl("@method",                { fg = C.blue })
hl("@method.call",           { fg = C.blue })

hl("@constructor",           { fg = C.red })
hl("@keyword",               { fg = C.orange })
hl("@keyword.storage",       { fg = "#8870C4" })
hl("@keyword.supercollider", { fg = "#8870C4" })
hl("@variable.builtin.supercollider",    { fg = "#4EC4B0" })
hl("@variable.parameter.supercollider",      { fg = C.blue })
hl("@function.method.call.supercollider",    { fg = C.amber })
hl("@keyword.function",      { fg = C.orange,  bold = true })
hl("@keyword.return",        { fg = C.orange,  bold = true })
hl("@keyword.operator",      { fg = C.cyan })

hl("@type",                  { fg = C.red })
hl("@type.builtin",          { fg = C.red,     italic = true })

hl("@namespace",             { fg = C.cyan })
hl("@operator",              { fg = C.cyan })
hl("@constant",              { fg = C.amber })
hl("@constant.builtin",      { fg = C.magenta })

----------------------------------------------------------
-- Haskell / Tidal
----------------------------------------------------------
hl("@keyword.haskell",               { fg = C.orange,  bold = true })
hl("@keyword.import.haskell",        { fg = C.orange,  bold = true })
hl("@keyword.conditional.haskell",   { fg = C.orange,  bold = true })
hl("@keyword.repeat.haskell",        { fg = C.orange,  bold = true })
hl("@type.haskell",                  { fg = C.purple, bold = true })
hl("@type.builtin.haskell",          { fg = C.purple, italic = true })
hl("@constructor.haskell",           { fg = C.purple, bold = true })
hl("@module.haskell",                { fg = C.cyan,    bold = true })
hl("@namespace.haskell",             { fg = C.cyan })
hl("@variable.haskell",              { fg = C.blue })
hl("@function.call.haskell",         { fg = C.blue })
hl("@variable.parameter.haskell",    { fg = C.orange,  italic = true })
hl("@variable.builtin.haskell",      { fg = C.magenta })
hl("@string.haskell",                { fg = C.green })
hl("@string.escape.haskell",         { fg = C.orange })
hl("@number.haskell",                { fg = C.magenta })
hl("@operator.haskell",              { fg = C.rose,    bold = true })
hl("@punctuation.special.haskell",   { fg = C.rose })
hl("@punctuation.delimiter.haskell", { fg = C.gray })
hl("@punctuation.bracket.haskell",   { fg = C.white })
hl("@comment.haskell",               { fg = C.gray,    italic = true })

----------------------------------------------------------
-- Telescope
----------------------------------------------------------
hl("TelescopeNormal",       { fg = C.fg,     bg = "NONE" })
hl("TelescopeBorder",       { fg = C.gray,   bg = "NONE" })
hl("TelescopeSelection",    { fg = C.blue,   bg = "NONE", bold = true })
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
hl("NvimTreeSpecialFile",      { fg = C.amber })
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
