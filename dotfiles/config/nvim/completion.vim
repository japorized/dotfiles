" Deoplete
" deoplete + neosnippet + autopairs changes 
au Filetype tex let b:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '$':'$', '`':"'"}
let g:AutoPairsMapCR=0
let g:deoplete#auto_complete_start_length = 1 
" Do not complete too short words
" call deoplete#custom#source(
" \ 'dictionary', 'min_pattern_length', 2)
let g:deoplete#auto_complete_start_length = 3
let g:deoplete#enable_at_startup = 1 
call deoplete#custom#option('auto_complete_delay', 200)
let g:deoplete#enable_smart_case = 1 
call deoplete#custom#source('ultisnips', 'matchers', ['matcher_fuzzy'])

" Ultisnips
let g:UltiSnipsSnippetDirectories = [$HOME.'/.vim/mysnippets']
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsEditSplit="horizontal"

if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif
au Filetype tex let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete
