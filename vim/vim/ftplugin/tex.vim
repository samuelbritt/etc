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
"set wildignore=*.log,*.aux,*.dvi,*.ps,*.pdf,*.aut,*.bbl,*.blg,*.fff,*.out*.toc,*.ttt

let Tex_UseMakefile=0 "use default compile rules, even when a makefile is present
let g:Tex_MultipleCompileFormats='dvi,pdf'
let g:Tex_TEXINPUTS=$HOME . '/texmf/tex/**' " the '.' is string concat.
let g:Tex_BIBINPUTS=$HOME . '/texmf/bibtex/bib' 
"let g:Tex_ViewRule_pdf = 'open'
"let g:Tex_ViewRule_pdf = '/Applications/Skim.app/Contents/MacOS/Skim'
"let g:TreatMacViewerAsUNIX=1

"folds for beamer class
let g:Tex_FoldedEnvironments=',column,frame,codebox'
"let g:Tex_PromptedEnvironments='eqnarray*,eqnarray,equation,equation*,\[,$$,align,align*' "Defaults

" Write and Compile
map <leader>wl :w<CR><leader>ll

" see ~/.vim/after/ftplugin/tex_macros.vim for custom macros
