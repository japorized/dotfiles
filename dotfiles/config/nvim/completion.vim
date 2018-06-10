" Deoplete
" deoplete + neosnippet + autopairs changes 
au Filetype tex let b:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '$':'$', '`':"'"}
let g:AutoPairsMapCR=0
let g:deoplete#auto_complete_start_length = 1 
let g:deoplete#enable_at_startup = 1 
let g:deoplete#enable_smart_case = 1 
call deoplete#custom#source('ultisnips', 'matchers', ['matcher_fuzzy'])

" Ultisnips
let g:UltiSnipsSnippetDirectories = [$HOME.'/.vim/mysnippets']
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete