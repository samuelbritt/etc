setlocal tw=80
setlocal sw=8
setlocal ts=8
setlocal cino+=(0,t0
setlocal foldmethod=syntax
setlocal spell

au BufWritePost *.c,*.h silent! !ctags -R --c-kinds=+p --fields=+S &
