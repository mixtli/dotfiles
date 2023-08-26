let g:run_cmd_julia = ['julia']
let g:run_cmd_haskell = ['runhaskell']
let g:run_cmd_crystal = ['crystal']
let g:run_cmd_c = [
                \ 'gcc',
                \ '-o',
                \ run#defaults#basefilename(),
                \ run#defaults#fullfilepath(),
                \ '&&',
                \ run#defaults#basefilename()
                \ ]
let g:run_cmd_python = ['python3']
