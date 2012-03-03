
set shiftwidth=2
set softtabstop=2
set expandtab
set iskeyword+=:
set textwidth=70
setlocal spell spelllang=en_us

let g:tex_fold_enabled = 1

let maplocalleader = ","
let g:LatexBox_viewer = "open"
let g:LatexBox_autojump = 1 	" jump to first error on latexmk

" auto itemize
inoremap <buffer> <C-enter> <esc>o\item 
imap <buffer> it<tab> <esc>ddki<C-enter>

nmap <buffer> <leader>wl  :w<CR><LocalLeader>ll
nmap <buffer> <F5>	  <Plug>LatexChangeEnv
vmap <buffer> <F7>	  <Plug>LatexWrapSelection
vmap <buffer> <S-F7>	  <Plug>LatexEnvWrapSelection
