
set shiftwidth=2
set softtabstop=2
set expandtab
set iskeyword+=:
set textwidth=70
setlocal spell spelllang=en_us

let maplocalleader = ","
let g:LatexBox_viewer = "open"
let g:LatexBox_autojump = 1 	" jump to first error on latexmk

nmap <leader>wl 	:w<CR><LocalLeader>ll
nmap <buffer> <F5>	<Plug>LatexChangeEnv
vmap <buffer> <F7>	<Plug>LatexWrapSelection
vmap <buffer> <S-F7>	<Plug>LatexEnvWrapSelection

" inline math as a quote
inoremap <silent> $$ $$<C-R>=UltiSnips_Anon('$$1$', '$$', 'math', 'i')<cr>
inoremap <silent> "" ""<C-R>=UltiSnips_Anon('\`\`$1''''', '""', 'tex quote', 'i')<cr>
