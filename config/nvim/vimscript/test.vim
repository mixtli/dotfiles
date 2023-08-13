" let test#strategy = "vtr"

nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-p> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

function! DockerTransform(cmd) abort
  return "docker compose run local " . a:cmd
endfunction

let g:test#custom_transformations = {'docker': function('DockerTransform')}
let g:test#transformation = 'docker'
