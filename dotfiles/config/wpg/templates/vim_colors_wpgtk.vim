if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'wpgtk'

if &t_Co >= 256

set background=dark
hi Normal           ctermbg=NONE ctermfg=15   cterm=NONE        guibg=NONE    guifg=#fbf1c7  gui=NONE

hi Comment          ctermbg=NONE ctermfg=7    cterm=NONE        guibg=NONE    guifg=#d5c4a1  gui=NONE
hi Statement        ctermbg=NONE ctermfg=1    cterm=BOLD        guibg=NONE    guifg=#fb4934  gui=NONE
hi Type             ctermbg=NONE ctermfg=2    cterm=BOLD        guibg=NONE    guifg=#b8bb26  gui=NONE
hi Function         ctermbg=NONE ctermfg=2    cterm=BOLD        guibg=NONE    guifg=#b8bb26  gui=NONE
hi PreProc          ctermbg=NONE ctermfg=2    cterm=BOLD        guibg=NONE    guifg=#b8bb26  gui=NONE

hi Title            ctermbg=NONE ctermfg=10   cterm=BOLD        guibg=NONE    guifg=#b8bb26  gui=BOLD
hi Special          ctermbg=NONE ctermfg=4    cterm=NONE        guibg=NONE    guifg=#83a598  gui=NONE
hi Identifier       ctermbg=NONE ctermfg=6    cterm=NONE        guibg=NONE    guifg=#8ec07c  gui=NONE
hi Constant         ctermbg=NONE ctermfg=6    cterm=NONE        guibg=NONE    guifg=#8ec07c  gui=NONE
hi Boolean          ctermbg=NONE ctermfg=6    cterm=NONE        guibg=NONE    guifg=#8ec07c  gui=NONE
hi String           ctermbg=NONE ctermfg=6    cterm=NONE        guibg=NONE    guifg=#8ec07c  gui=NONE
hi Delimiter        ctermbg=NONE ctermfg=13   cterm=NONE        guibg=NONE    guifg=#d3869b  gui=NONE

hi LineNr           ctermbg=NONE ctermfg=4    cterm=NONE        guibg=NONE      guifg=#83a598  gui=NONE
hi CursorLineNr     ctermbg=NONE ctermfg=3    cterm=NONE        guibg=NONE      guifg=#fabd2f  gui=NONE
hi MatchParen       ctermbg=NONE ctermfg=11   cterm=NONE        guibg=NONE      guifg=#fabd2f  gui=NONE
hi Conceal          ctermbg=NONE ctermfg=3    cterm=NONE        guibg=NONE      guifg=#fabd2f  gui=NONE
hi SpecialKey       ctermbg=NONE ctermfg=4    cterm=NONE        guibg=NONE      guifg=#83a598  gui=NONE
hi ColorColumn      ctermbg=12   ctermfg=4    cterm=NONE        guibg=#83a598 guifg=#83a598  gui=NONE
hi SignColumn       ctermbg=NONE ctermfg=4    cterm=NONE        guibg=NONE      guifg=#83a598  gui=NONE
hi Folded           ctermbg=NONE ctermfg=14   cterm=NONE        guibg=NONE      guifg=#8ec07c  gui=NONE
hi FoldColumn       ctermbg=NONE ctermfg=14   cterm=NONE        guibg=NONE      guifg=#8ec07c  gui=NONE

hi Directory        ctermbg=NONE ctermfg=3    cterm=NONE        guibg=NONE    guifg=#fabd2f  gui=NONE
hi Underlined       ctermbg=NONE ctermfg=NONE cterm=UNDERLINE   guibg=NONE    guifg=NONE      gui=UNDERLINE

hi Visual           ctermbg=NONE ctermfg=11   cterm=REVERSE     guibg=NONE    guifg=#fabd2f gui=REVERSE
hi VisualNOS        ctermbg=NONE ctermfg=NONE cterm=REVERSE     guibg=NONE    guifg=NONE    gui=REVERSE
hi IncSearch        ctermbg=9    ctermfg=0    cterm=NONE        guibg=#fb4934 guifg=#32302f gui=NONE
hi Search           ctermbg=3    ctermfg=0    cterm=NONE        guibg=#fabd2f guifg=#32302f gui=NONE

hi StatusLine       ctermbg=3    ctermfg=0    cterm=NONE        guibg=#fabd2f guifg=#32302f gui=NONE
hi StatusLineNC     ctermbg=2    ctermfg=0    cterm=NONE        guibg=#b8bb26 guifg=#32302f gui=NONE
hi VertSplit        ctermbg=NONE ctermfg=4    cterm=NONE        guibg=NONE    guifg=#83a598 gui=NONE
hi WildMenu         ctermbg=15   ctermfg=0    cterm=NONE        guibg=#fbf1c7 guifg=#32302f gui=NONE
hi ModeMsg          ctermbg=NONE ctermfg=3    cterm=NONE        guibg=NONE    guifg=#fabd2f gui=NONE

hi DiffAdd          ctermbg=NONE ctermfg=6    cterm=NONE        guibg=NONE guifg=#8ec07c gui=NONE
hi DiffDelete       ctermbg=NONE ctermfg=1    cterm=NONE        guibg=NONE guifg=#fb4934 gui=NONE
hi DiffChange       ctermbg=NONE ctermfg=4    cterm=UNDERLINE   guibg=NONE guifg=#83a598 gui=UNDERLINE
hi DiffText         ctermbg=NONE ctermfg=15   cterm=NONE        guibg=NONE guifg=#fbf1c7 gui=NONE

hi Pmenu            ctermbg=8    ctermfg=15   cterm=NONE        guibg=#665c54 guifg=#fbf1c7 gui=NONE
hi PmenuSel         ctermbg=1    ctermfg=15   cterm=REVERSE     guibg=#fb4934 guifg=#fbf1c7 gui=REVERSE
hi PmenuSbar        ctermbg=NONE ctermfg=1    cterm=NONE        guibg=NONE     guifg=#fb4934    gui=NONE
hi PmenuThumb       ctermbg=14   ctermfg=0    cterm=NONE        guibg=#8ec07c guifg=#32302f    gui=NONE

hi SpellBad         ctermbg=NONE ctermfg=NONE cterm=UNDERCURL   guibg=NONE    guifg=NONE    gui=UNDERCURL
hi SpellCap         ctermbg=NONE ctermfg=NONE cterm=UNDERCURL   guibg=NONE    guifg=NONE    gui=UNDERCURL
hi SpellLocal       ctermbg=NONE ctermfg=NONE cterm=UNDERCURL   guibg=NONE    guifg=NONE    gui=UNDERCURL
hi SpellRare        ctermbg=NONE ctermfg=NONE cterm=UNDERCURL   guibg=NONE    guifg=NONE    gui=UNDERCURL

hi ErrorMsg         ctermbg=1    ctermfg=0    cterm=NONE        guibg=#fb4934 guifg=#32302f gui=NONE
hi WarningMsg       ctermbg=NONE ctermfg=1    cterm=NONE        guibg=NONE    guifg=#fb4934 gui=NONE
hi MoreMsg          ctermbg=NONE ctermfg=3    cterm=NONE        guibg=NONE    guifg=#fabd2f gui=NONE
hi Question         ctermbg=NONE ctermfg=3    cterm=NONE        guibg=NONE    guifg=#fabd2f gui=NONE

hi TabLine          ctermbg=NONE ctermfg=15   cterm=NONE        guibg=NONE    guifg=#fbf1c7 gui=NONE
hi TabLineSel       ctermbg=3    ctermfg=0    cterm=NONE        guibg=#fabd2f guifg=#32302f gui=NONE
hi TabLineFill      ctermbg=NONE ctermfg=15   cterm=NONE        guibg=NONE    guifg=#fbf1c7 gui=NONE

hi Error            ctermbg=NONE ctermfg=1    cterm=REVERSE     guibg=NONE    guifg=#fb4934 gui=REVERSE
hi Ignore           ctermbg=NONE ctermfg=NONE cterm=NONE        guibg=NONE    guifg=NONE    gui=NONE
hi Todo             ctermbg=0    ctermfg=14   cterm=UNDERLINE   guibg=#32302f guifg=#8ec07c gui=UNDERLINE

hi NonText          ctermbg=NONE ctermfg=4    cterm=NONE        guibg=NONE    guifg=#83a598 gui=NONE

hi Cursor           ctermbg=15   ctermfg=NONE cterm=NONE        guibg=#fbf1c7 guifg=NONE    gui=NONE
hi CursorColumn     ctermbg=4    ctermfg=NONE cterm=NONE        guibg=#83a598 guifg=NONE    gui=NONE
hi CursorLine       ctermbg=4    ctermfg=NONE cterm=NONE        guibg=#83a598 guifg=NONE    gui=NONE
hi EndOfBuffer      ctermbg=NONE ctermfg=0    cterm=NONE        guibg=NONE    guifg=#32302f    gui=NONE

hi helpleadblank    ctermbg=NONE ctermfg=NONE cterm=NONE        guibg=NONE    guifg=NONE    gui=NONE
hi helpnormal       ctermbg=NONE ctermfg=NONE cterm=NONE        guibg=NONE    guifg=NONE    gui=NONE

endif

hi link Number             Constant
hi link Character          Constant

hi link Conditional        Statement
hi link Debug              Special
hi link Define             PreProc
hi link Exception          Statement
hi link Float              Number
hi link HelpCommand        Statement
hi link HelpExample        Statement
hi link Include            PreProc
hi link Keyword            Statement
hi link Label              Statement
hi link Macro              PreProc
hi link Operator           Statement
hi link PreCondit          PreProc
hi link Repeat             Statement
hi link SpecialComment     Delimiter
hi link StorageClass       Type
hi link Structure          Type
hi link Tag                Special
hi link Typedef            Type

hi link htmlEndTag         htmlTagName
hi link htmlLink           Function
hi link htmlSpecialTagName htmlTagName
hi link htmlTag            htmlTagName
hi link xmlTag             Statement
hi link xmlTagName         Statement
hi link xmlEndTag          Statement

hi link markdownItalic     Preproc

hi link pandocDelimitedCodeBlockLanguage    Delimiter
hi link rOKeyword                           SpecialComment

hi link diffBDiffer        WarningMsg
hi link diffCommon         WarningMsg
hi link diffDiffer         WarningMsg
hi link diffIdentical      WarningMsg
hi link diffIsA            WarningMsg
hi link diffNoEOL          WarningMsg
hi link diffOnly           WarningMsg
hi link diffRemoved        WarningMsg
hi link diffAdded          String

hi link vimHiAttrib        Constant
hi link vimParenSep        Normal
hi link vimVar             Normal
hi link vimMapMod          Identifier
hi link vimMapModKey       Identifier
hi link vimNotation        Identifier
hi link vimBracket         Identifier

hi link QuickFixLine       TabLineSel
hi link qfFileName         Function
hi link qfLineNr           String
hi link qfSeparator        Comment
