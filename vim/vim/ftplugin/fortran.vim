let s:extfname = expand("%:e")
if s:extfname ==? "f90"
	let fortran_free_source=1
	unlet! fortran_fixed_source
else
	let fortran_fixed_source=1
	unlet! fortran_free_source
endif

set ts=4
set sw=4
set fo+=r
set foldmethod=syntax
let fortran_fold=1
let fortran_fold_conditionals=1
"let fortran_fold_multilinecomments=1
let fortran_do_enddo=1
