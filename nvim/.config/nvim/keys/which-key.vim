" Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
" set timeoutlen=100


" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Single mappings
let g:which_key_map['#'] = [ '<Plug>NERDCommenterToggle'  , 'comment' ]
"let g:which_key_map['f'] = [ ':RnvimrToggle'              , 'ranger' ]
let g:which_key_map['z'] = [ 'Goyo'                       , 'zen' ]
"let g:which_key_map['n'] = [ ':NERDTreeToggle'            , 'NERDTree' ]

:nnoremap <Leader>gg :Git<Space>
:nnoremap <Leader>gg :Gmove<Space>
:nnoremap <Leader>ge :Gedit<Space>
:nnoremap <Leader>gf :Ggrep<Space>
:nnoremap <Leader>ti :FloatermNew tig <C-r>%<Enter>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fl <cmd>lua require('telescope.builtin').file_browser()<cr>
nnoremap <leader>fs <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>fr <cmd>lua require('telescope.builtin').lsp_references()<cr>


let g:which_key_map.n = {
      \ 'name' : '+NERDTree' ,
      \ 'f' : [':NERDTreeFocus', 'focus'],
      \ 't' : [':NERDTreeToggle' , 'toggle'],
      \ 'o' : [':NERDTree' , 'open'],
      \ 's' : [':NERDTreeFind' , 'find'],
      \ }

let g:which_key_map.a = {
      \ 'name' : '+neomux',
      \ 'o' : 'open',
      \ 's' : 'swap',
      \ 'y' : 'yank',
      \ 'p' : 'paste',
      \ 'f' : 'fix',
      \ 'h' : 'horizontal',
      \ 'v' : 'vertical',
      \ }

" s is for search
let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ '/' : [':History/'     , 'history'],
      \ ';' : [':Commands'     , 'commands'],
      \ 'a' : [':Ag'           , 'text Ag'],
      \ 'b' : [':BLines'       , 'current buffer'],
      \ 'B' : [':Buffers'      , 'open buffers'],
      \ 'c' : [':Commits'      , 'commits'],
      \ 'C' : [':BCommits'     , 'buffer commits'],
      \ 'f' : [':Files'        , 'files'],
      \ 'g' : [':GFiles'       , 'git files'],
      \ 'G' : [':GFiles?'      , 'modified git files'],
      \ 'h' : [':History'      , 'file history'],
      \ 'H' : [':History:'     , 'command history'],
      \ 'l' : [':Lines'        , 'lines'] ,
      \ 'm' : [':Marks'        , 'marks'] ,
      \ 'M' : [':Maps'         , 'normal maps'] ,
      \ 'p' : [':Helptags'     , 'help tags'] ,
      \ 'P' : [':Tags'         , 'project tags'],
      \ 'r' : [':Rg'           , 'text Rg'],
      \ 's' : [':Snippets'     , 'snippets'],
      \ 'S' : [':Colors'       , 'color schemes'],
      \ 'T' : [':BTags'        , 'buffer tags'],
      \ 'w' : [':Windows'      , 'search windows'],
      \ 'y' : [':Filetypes'    , 'file types'],
      \ 'z' : [':FZF'          , 'FZF'],
      \ }

" tmux commands
let g:which_key_map.l = {
      \ 'name' : '+language' ,
      \ 't' : [':TestNearest', 'Test Nearest'],
      \ 's' : [':TestSuite', 'Test Suite'],
      \ 'l' : [':TestLast', 'Test Last'],
      \ 'f' : [':TestFile', 'Test File'],
      \ }

let g:which_key_map.f = {
      \ 'name': 'Telescope',
      \ 'f' : 'Find Files',
      \ 'b' : 'Find Buffers',
      \ 'g' : 'Live Grep',
      \ 'h' : 'Help Tags',
      \ 't' : 'File Browser',
      \ 's' : 'Git Files',
      \ 'r' : 'LSP References',
      \ }

" tmux commands
let g:which_key_map.m = {
      \ 'name' : '+tmux' ,
      \ 'r' : [':VtrSendCommandToRunner!', 'Run'],
      \ 'f' : [':VtrFlushCommand', 'Flush'],
      \ 'k' : [':VtrKillRunner', 'Kill'],
      \ }
"
" git commands
let g:which_key_map.g = {
      \ 'name' : '+git' ,
      \ 'a' : [':Git write', 'Add'],
      \ 'b' : [':Git blame', 'Blame'],
      \ 'c' : [':Git commit', 'Commit'],
      \ 'd' : [':Git diff!', 'Diff'],
      \ 'e' : 'Edit Version',
      \ 'f' : [':0Git log', 'Log File'],
      \ 'l' : [':Git log', 'Log'],
      \ 'm' : [':GRename', 'Rename'],
      \ 'p' : [':Git Grep', 'Grep' ],
      \ 'r' : [':Git read', 'Checkout'],
      \ 's' : [':Git', 'Status'],
      \ 'V' : [':GV', 'GV (history)'],
      \ 'v' : [':GV!', 'GV (history current file)'],
      \ 'w' : [':Gbrowse', 'Web Browser'],
      \ 'x' : [':GRemove', 'Remove'],
      \ }

" terminal commands
let g:which_key_map.t = {
      \ 'name' : '+terminal' ,
      \ ';' : [':FloatermNew --wintype=popup --height=6'        , 'terminal'],
      \ 'f' : [':FloatermNew fzf'                               , 'fzf'],
      \ 'g' : [':FloatermNew lazygit'                           , 'git'],
      \ 'i' : 'Tig',
      \ 'd' : [':FloatermNew lazydocker'                        , 'docker'],
      \ 'n' : [':FloatermNew node'                              , 'node'],
      \ 'p' : [':FloatermNew python'                            , 'python'],
      \ 'r' : [':FloatermNew ranger'                            , 'ranger'],
      \ 'R' : [':FloatermNew /usr/bin/irb'                      , 'ruby'],
      \ 't' : [':FloatermToggle'                                , 'toggle'],
      \ 'h' : [':FloatermNew htop'                              , 'htop'],
      \ 's' : [':FloatermNew ncdu'                              , 'ncdu'],
      \ }

let g:which_key_map.r = {
      \ 'name' : '+ruby' ,
      \ 's' : [':call RunNearestSpec()'                               , 'run nearest spec'],
      \ 'l' : [':call RunLastSpec()'                               , 'run last spec'],
      \ 'f' : [':call RunCurrentSpecFile()'                               , 'run spec file'],
      \ 'a' : [':call RunAllSpecs()'                               , 'run all specs'],
      \ }

" devspace bindings
let g:which_key_map.d = {
      \ 'name' : '+devspace' ,
      \ 'd' : [':VtrSendCommandToRunner! devspace dev'        , 'dev'],
      \ 'pd' : [':VtrSendCommandToRunner! devspace dev -i -p development'        , 'development profile'],
      \ 'pt' : [':VtrSendCommandToRunner! devspace dev -i -p test'        , 'test profile'],
      \ }

" CoC bindings
"xmap <leader>cs  <Plug>(coc-codeaction-selected)
"let g:which_key_map.c = {
"      \ 'name' : '+CoC' ,
"      \ 'a' : [ '<Plug>(coc-codeaction)',   'action' ],
"      \ 'e' : [ ':CocCommand explorer',   'explorer' ],
"      \ 'f' : [ '<Plug>(coc-format-selected)',   'format' ],
"      \ 'r' : [ '<Plug>(coc-rename)',   'rename' ],
"      \ 's' : [ '<Plug>(coc-codeaction-selected)',   'selected' ],
"      \ 'c' : [ '<Plug>(coc-fix-current)',   'fix current' ]
"      \ }
"
" Register which key map
call which_key#register('<Space>', "g:which_key_map")
