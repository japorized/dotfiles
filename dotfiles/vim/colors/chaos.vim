if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'chaos'

if &t_Co >= 256

  set background=dark
  hi Normal           ctermbg=0    ctermfg=15   cterm=NONE        guibg=#3c4855 guifg=#ebeae9 gui=NONE

  hi Comment          ctermbg=NONE ctermfg=8    cterm=NONE        guibg=NONE    guifg=#616c72 gui=NONE
  hi Statement        ctermbg=NONE ctermfg=1    cterm=BOLD        guibg=NONE    guifg=#a5a6a4 gui=NONE
  hi Type             ctermbg=NONE ctermfg=2    cterm=BOLD        guibg=NONE    guifg=#a5a6a4 gui=NONE
  hi Function         ctermbg=NONE ctermfg=2    cterm=BOLD        guibg=NONE    guifg=#a5a6a4 gui=NONE
  hi PreProc          ctermbg=NONE ctermfg=2    cterm=BOLD        guibg=NONE    guifg=#a5a6a4 gui=NONE

  hi Title            ctermbg=NONE ctermfg=10   cterm=BOLD        guibg=NONE    guifg=#ebeae9 gui=BOLD
  hi Special          ctermbg=NONE ctermfg=4    cterm=NONE        guibg=NONE    guifg=#a18069 gui=NONE
  hi Identifier       ctermbg=NONE ctermfg=6    cterm=NONE        guibg=NONE    guifg=#8d8775 gui=NONE
  hi Constant         ctermbg=NONE ctermfg=6    cterm=NONE        guibg=NONE    guifg=#8d8775 gui=NONE
  hi Boolean          ctermbg=NONE ctermfg=6    cterm=NONE        guibg=NONE    guifg=#8d8775 gui=NONE
  hi String           ctermbg=NONE ctermfg=6    cterm=NONE        guibg=NONE    guifg=#8d8775 gui=NONE
  hi Delimiter        ctermbg=NONE ctermfg=13   cterm=NONE        guibg=NONE    guifg=#899ba6 gui=NONE

  hi LineNr           ctermbg=NONE ctermfg=4    cterm=NONE        guibg=NONE    guifg=#616c72 gui=NONE
  hi CursorLineNr     ctermbg=NONE ctermfg=3    cterm=NONE        guibg=NONE    guifg=#ddd668 gui=NONE
  hi MatchParen       ctermbg=NONE ctermfg=11   cterm=NONE        guibg=NONE    guifg=#3ba2cc gui=NONE
  hi Conceal          ctermbg=NONE ctermfg=4    cterm=NONE        guibg=NONE    guifg=#616c72 gui=NONE
  hi SpecialKey       ctermbg=NONE ctermfg=4    cterm=NONE        guibg=NONE    guifg=#616c72 gui=NONE
  hi ColorColumn      ctermbg=4    ctermfg=4    cterm=NONE        guibg=#616c72 guifg=#616c72 gui=NONE
  hi SignColumn       ctermbg=4    ctermfg=4    cterm=NONE        guibg=#616c72 guifg=#616c72 gui=NONE
  hi Folded           ctermbg=NONE ctermfg=14   cterm=NONE        guibg=NONE    guifg=#3ba2cc gui=NONE
  hi FoldColumn       ctermbg=NONE ctermfg=14   cterm=NONE        guibg=NONE    guifg=#3ba2cc gui=NONE

  hi Directory        ctermbg=NONE ctermfg=3    cterm=NONE        guibg=NONE    guifg=#5bb899 gui=NONE
  hi Underlined       ctermbg=NONE ctermfg=NONE cterm=UNDERLINE   guibg=NONE    guifg=NONE    gui=NONE

  hi Visual           ctermbg=NONE ctermfg=11   cterm=REVERSE     guibg=NONE    guifg=#87d7ff gui=REVERSE
  hi VisualNOS        ctermbg=NONE ctermfg=NONE cterm=REVERSE     guibg=NONE    guifg=NONE    gui=UNDERLINE
  hi IncSearch        ctermbg=9    ctermfg=0    cterm=NONE        guibg=#d5bc02 guifg=#3c4855 gui=NONE
  hi Search           ctermbg=3    ctermfg=0    cterm=NONE        guibg=#ddd668 guifg=#3c4855 gui=NONE

  hi StatusLine       ctermbg=11   ctermfg=15   cterm=NONE        guibg=#616c72 guifg=#c5d4dd gui=NONE
  hi StatusLineNC     ctermbg=11   ctermfg=0    cterm=NONE        guibg=#616c72 guifg=#c5d4dd gui=NONE
  hi VertSplit        ctermbg=NONE ctermfg=4    cterm=NONE        guibg=NONE    guifg=#616c72 gui=NONE
  hi WildMenu         ctermbg=15   ctermfg=0    cterm=NONE        guibg=#c5d4dd guifg=#3c4855 gui=NONE
  hi ModeMsg          ctermbg=NONE ctermfg=3    cterm=NONE        guibg=NONE    guifg=#5bb899 gui=NONE

  hi DiffAdd          ctermbg=3    ctermfg=0    cterm=NONE        guibg=#5bb899 guifg=#3c4855 gui=NONE
  hi DiffDelete       ctermbg=1    ctermfg=0    cterm=NONE        guibg=#db6c6c guifg=#3c4855 gui=NONE
  hi DiffChange       ctermbg=0    ctermfg=9    cterm=UNDERLINE   guibg=#3c4855 guifg=#d5bc02 gui=UNDERLINE
  hi DiffText         ctermbg=9    ctermfg=0    cterm=NONE        guibg=#d5bc02 guifg=#3c4855 gui=NONE

  hi Pmenu            ctermbg=4    ctermfg=15   cterm=NONE        guibg=#616c72 guifg=#c5d4dd gui=NONE
  hi PmenuSel         ctermbg=0    ctermfg=15   cterm=REVERSE     guibg=#3c4855 guifg=#c5d4dd gui=REVERSE
  hi PmenuSbar        ctermbg=4    ctermfg=NONE cterm=NONE        guibg=#616c72 guifg=NONE    gui=NONE
  hi PmenuThumb       ctermbg=15   ctermfg=NONE cterm=NONE        guibg=#c5d4dd guifg=NONE    gui=NONE

  hi SpellBad         ctermbg=NONE ctermfg=NONE cterm=UNDERCURL   guibg=NONE    guifg=NONE    gui=UNDERCURL
  hi SpellCap         ctermbg=NONE ctermfg=NONE cterm=UNDERCURL   guibg=NONE    guifg=NONE    gui=UNDERCURL
  hi SpellLocal       ctermbg=NONE ctermfg=NONE cterm=UNDERCURL   guibg=NONE    guifg=NONE    gui=UNDERCURL
  hi SpellRare        ctermbg=NONE ctermfg=NONE cterm=UNDERCURL   guibg=NONE    guifg=NONE    gui=UNDERCURL

  hi ErrorMsg         ctermbg=1    ctermfg=4    cterm=NONE        guibg=#db6c6c guifg=#616c72 gui=NONE
  hi WarningMsg       ctermbg=NONE ctermfg=1    cterm=NONE        guibg=NONE    guifg=#db6c6c gui=NONE
  hi MoreMsg          ctermbg=NONE ctermfg=3    cterm=NONE        guibg=NONE    guifg=#5bb899 gui=NONE
  hi Question         ctermbg=NONE ctermfg=3    cterm=NONE        guibg=NONE    guifg=#5bb899 gui=NONE

  hi TabLine          ctermbg=4    ctermfg=15   cterm=NONE        guibg=#616c72 guifg=#c5d4dd gui=NONE
  hi TabLineSel       ctermbg=0    ctermfg=15   cterm=REVERSE     guibg=#3c4855 guifg=#c5d4dd gui=REVERSE
  hi TabLineFill      ctermbg=4    ctermfg=15   cterm=NONE        guibg=#616c72 guifg=#ebeae9 gui=NONE

  hi Error            ctermbg=NONE ctermfg=1    cterm=REVERSE     guibg=NONE    guifg=#db6c6c gui=REVERSE
  hi Ignore           ctermbg=NONE ctermfg=NONE cterm=NONE        guibg=NONE    guifg=NONE    gui=NONE
  hi Todo             ctermbg=0    ctermfg=14   cterm=UNDERLINE   guibg=#3c4855 guifg=#3ba2cc gui=UNDERLINE

  hi NonText          ctermbg=NONE ctermfg=4    cterm=NONE        guibg=NONE    guifg=#616c72 gui=NONE

  hi Cursor           ctermbg=15   ctermfg=NONE cterm=NONE        guibg=#ebeae9 guifg=NONE    gui=NONE
  hi CursorColumn     ctermbg=4    ctermfg=NONE cterm=NONE        guibg=#616c72 guifg=NONE    gui=NONE
  hi CursorLine       ctermbg=4    ctermfg=NONE cterm=NONE        guibg=#616c72 guifg=NONE    gui=NONE

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
hi link qfSeparator Comment
