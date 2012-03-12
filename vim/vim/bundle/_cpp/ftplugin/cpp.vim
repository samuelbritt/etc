setlocal ts=4
setlocal sw=4
setlocal tw=80
setlocal cino+=(0,g0,t0
setlocal foldmethod=syntax
setlocal spell

au BufWritePost *.cpp,*.cc,*.C,*.h silent! !ctags -R --c++-kinds=+p --fields=+iaS --extra=+q &
