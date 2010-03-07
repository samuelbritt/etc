"taken from
"http://henry.precheur.org/2008/4/18/Indenting%20Python%20with%20VIM.html

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=0
setlocal smarttab
setlocal expandtab
setlocal smartindent
setlocal backspace=indent,eol,start
setlocal ruler
setlocal wildmenu

"taken from 
" http://www.amitu.com/blog/2007/july/vim-python-code-folding-and-my-vimrc/
au BufWinLeave * mkview
au BufWinEnter * silent loadview

" this lets us put the marker in the file so that
" it can be shared across and stored in version control.
set foldmethod=marker
" this is for python, put
" # name for the folded text # {{{
" to begin marker and
" # }}}
" close to end it.
set commentstring=\ #\ %s
" default fold level, all open, set it 200 or something
" to make it all closed.
set foldlevel=0

" share clipboard with windows clipboard
set clipboard+=unnamed

" set viminfo='100,f1
" minibufexplorer settings:j
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchWindows = 1

syntax on
