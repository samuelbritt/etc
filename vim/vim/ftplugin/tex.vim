" this is mostly a matter of taste. but LaTeX looks good with just a bit
" of indentation.
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:

set textwidth=70
setlocal spell spelllang=en_us

let g:Tex_MultipleCompileFormats='dvi,pdf'
let g:Tex_TEXINPUTS='.,/home/sam/texmf/tex/**,./**'
let g:Tex_BIBINPUTS='.,/home/sam/texmf/bibtex/bib/**'

"folds for beamer class
let g:Tex_FoldedEnvironments=',column,frame'
"let g:Tex_PromptedEnvironments='eqnarray*,eqnarray,equation,equation*,\[,$$,align,align*' "Defaults

" maps for inserting text
call IMAP(',a', '$\alpha$', 'tex')
call IMAP(',b', '$\beta$', 'tex')
call IMAP(',q', '$\theta$', 'tex')
call IMAP(',w', '$\omega$', 'tex')
call IMAP('`.', '\cdot', 'tex')
call IMAP('==', '&= ', 'tex')

" write and compile
map \wl :w<CR>\ll
