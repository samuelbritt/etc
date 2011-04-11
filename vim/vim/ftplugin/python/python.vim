"taken from
"http://henry.precheur.org/2008/4/18/Indenting%20Python%20with%20VIM.html
" or maybe
"http://henry.precheur.org/vim/python

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=80
setlocal smarttab
setlocal expandtab
" setlocal smartindent
setlocal backspace=indent,eol,start
setlocal ruler
setlocal wildmenu
set foldmethod=indent
set commentstring=\ #\ %s
"let python_highlight_all=1
let python_highlight_numbers=1
let python_highlight_builtins=1
let python_highlight_exceptions=1
"let python_highlight_space_errors=1

" DelimitMate: allow triple double-quotes
let b:delmitMate_nesting_quotes['"']

syntax on
