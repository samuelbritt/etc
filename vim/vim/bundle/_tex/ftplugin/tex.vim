
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal expandtab
setlocal iskeyword+=:
setlocal textwidth=70
setlocal spell

let g:tex_fold_enabled = 1

let maplocalleader = ","
let g:LatexBox_viewer = "$PDFVIEWER"
let g:LatexBox_autojump = 1 	" jump to first error on latexmk

" Maps
inoremap <buffer> <C-CR> <C-O>o\item<space>
nnoremap <buffer> <C-CR> o\item<space>
inoremap <silent> <buffer> it<tab> it<C-R>=UltiSnips_Anon('\\item ${1:${VISUAL}}', 'it', 'item', 'b')<cr><C-O>==
noreabbrev <buffer> ... \ldots

nmap <buffer> <LocalLeader>wl  :w<CR><LocalLeader>ll
nmap <buffer> <F5>	  <Plug>LatexChangeEnv
vmap <buffer> <F7>	  <Plug>LatexWrapSelection
vmap <buffer> <S-F7>	  <Plug>LatexEnvWrapSelection
