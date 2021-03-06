" If the filename extension is ".f90", assume we are programming in free-form
" Fortran 90. Else, assume we are the older fixed-format F77 style.
let s:extfname = expand("%:e")
if s:extfname ==? "f90"
	let fortran_free_source=1
	unlet! fortran_fixed_source
	" highlight column and row for fixed format
	set cursorcolumn
	set cursorline
else
	let fortran_fixed_source=1
	unlet! fortran_free_source
endif

setlocal expandtab
setlocal tabstop=4
setlocal shiftwidth=4
setlocal formatoptions+=r  " auto-insert comment leader
setlocal foldmethod=syntax
setlocal comments+=:c
let b:fortran_do_enddo=1
" Folding for large subroutines can be slow
" let fortran_fold=1
" let fortran_fold_conditionals=1
" let fortran_fold_multilinecomments=1
