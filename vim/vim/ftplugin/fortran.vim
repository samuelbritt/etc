let s:extfname = expand("%:e")
if s:extfname ==? "f90"
	let fortran_free_source=1
	unlet! fortran_fixed_source
else
	let fortran_fixed_source=1
	unlet! fortran_free_source
endif

set expandtab
set tabstop=4
set shiftwidth=4
set formatoptions+=r
set foldmethod=syntax
set cursorcolumn "for fixed format
set cursorline 
let fortran_fold=1
let fortran_fold_conditionals=1
"let fortran_fold_multilinecomments=1
let fortran_do_enddo=1
