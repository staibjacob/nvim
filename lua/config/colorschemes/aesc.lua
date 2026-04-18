
" AE-SC inspired colorscheme
" calm, dark, non-distracting

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "aesc_sc"

" -------------------------
" Base colors
" -------------------------
let s:bg        = "#1f2326"
let s:fg        = "#c8ccd0"
let s:comment   = "#6b7176"
let s:cyan      = "#5fb3b3"
let s:blue      = "#6fa8dc"
let s:purple    = "#b48ead"
let s:green     = "#8fbc8f"
let s:red       = "#d08770"
let s:yellow    = "#e5c07b"
let s:cursor    = "#30363b"
let s:selection = "#2a2f33"

" -------------------------
" UI
" -------------------------
hi Normal       guifg=s:fg        guibg=s:bg
hi CursorLine   guibg=s:cursor
hi Visual       guibg=s:selection
hi LineNr       guifg="#4b5055"   guibg=s:bg
hi CursorLineNr guifg=s:fg        guibg=s:bg
hi VertSplit    guifg="#2a2f33"   guibg=s:bg
hi StatusLine   guifg=s:fg        guibg="#2a2f33"
hi StatusLineNC guifg="#6b7176"   guibg="#2a2f33"

hi Pmenu        guifg=s:fg        guibg="#2a2f33"
hi PmenuSel     guifg=s:bg        guibg=s:cyan

hi Search       guifg=s:bg        guibg=s:yellow
hi IncSearch    guifg=s:bg        guibg=s:red

" -------------------------
" Syntax
" -------------------------
hi Comment      guifg=s:comment   gui=italic
hi Constant     guifg=s:purple
hi String       guifg=s:green
hi Character    guifg=s:green
hi Number       guifg=s:purple
hi Boolean      guifg=s:purple
hi Float        guifg=s:purple

hi Identifier   guifg=s:blue
hi Function     guifg=s:cyan

hi Statement    guifg=s:cyan
hi Conditional  guifg=s:cyan
hi Repeat       guifg=s:cyan
hi Keyword      guifg=s:cyan
hi Operator     guifg=s:red
hi Exception    guifg=s:red

hi PreProc     guifg=s:yellow
hi Include     guifg=s:blue
hi Define      guifg=s:cyan
hi Macro       guifg=s:cyan

hi Type        guifg=s:blue
hi StorageClass guifg=s:blue
hi Structure   guifg=s:blue
hi Typedef     guifg=s:blue

hi Special     guifg=s:red
hi Delimiter   guifg=s:fg
hi SpecialChar guifg=s:red
hi Tag         guifg=s:blue

" -------------------------
" Diagnostics (LSP)
" -------------------------
hi DiagnosticError guifg=s:red
hi DiagnosticWarn  guifg=s:yellow
hi DiagnosticInfo  guifg=s:blue
hi DiagnosticHint  guifg=s:cyan

" -------------------------
" Treesitter (optional)
" -------------------------
hi link @keyword Keyword
hi link @function Function
hi link @number Number
hi link @string String
hi link @comment Comment
hi link @operator Operator
