let g:tq_map_keys=0
nnoremap <leader>ts :Thesaurus<Space>
nnoremap <leader>tql :ThesaurusQueryLookupCurrentWord<CR>
nnoremap <leader>tqr :ThesaurusQueryReplaceCurrentWord<CR>
nnoremap <leader>tR :ThesaurusQueryReset<CR>
let g:which_key_map.t = {
      \ 'name' : '+thesaurus',
      \ 's' : 'search',
      \ 'q' : {
      \   'name' : '+query',
      \   'r' : 'replace',
      \   'l' : 'lookup'
      \   },
      \ 'R' : 'query-reset'
      \ }
