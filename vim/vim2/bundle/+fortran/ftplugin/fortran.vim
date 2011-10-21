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

set expandtab
set tabstop=4
set shiftwidth=4
set formatoptions+=r  " auto-insert comment leader
set foldmethod=syntax
let fortran_do_enddo=1
set comments+=:c
" Folding for large subroutines can be slow
" let fortran_fold=1
" let fortran_fold_conditionals=1
" let fortran_fold_multilinecomments=1
