" this is mostly a matter of taste. but LaTeX looks good with just a bit
" of indentation.
set sw=2
set expandtab
" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:

set softtabstop=2
set textwidth=70
setlocal spell spelllang=en_us

" delimitMate math
let b:delimitMate_quotes = "' ` \$"
inoremap <silent> <buffer> .. ..<C-R>=UltiSnips_Anon('[$1]', '..', 'Bracket', 'i')<cr>

let maplocalleader = ","
let g:LatexBox_viewer = "open"
let g:LatexBox_autojump = 1 	" jump to first error on latexmk

nmap <leader>wl 	:w<CR><LocalLeader>ll
imap <buffer> [[ 	\begin{
imap <buffer> ]]	<Plug>LatexCloseCurEnv
nmap <buffer> <F5>	<Plug>LatexChangeEnv
vmap <buffer> <F7>	<Plug>LatexWrapSelection
vmap <buffer> <S-F7>	<Plug>LatexEnvWrapSelection
imap <buffer> (( 	\eqref{
