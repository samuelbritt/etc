"Alters macros provided by Vim-LaTeX

call IMAP('`w', '\omega', 'tex')	"change the \wedge default expansion
call IMAP('`e', '\epsilon', 'tex')	"change the \varepsilon default
call IMAP('`v', '\bvec{<++>}<++>', 'tex')	"change the \varsigma default
call IMAP('`u', '\unit{<++>}{<++>}<++>', 'tex')	"change the \upsilon default

"call IMAP('`v', '`v', 'tex') 		"remove the \varsigma default
"call IMAP('``v', '``v', 'tex') 	"remove the \varsigma default
"call IMAP('`ve', '\varepsilon', 'tex')	"new
"call IMAP('`vs', '\varsigma', 'tex')	"new

" Frame environment for beamer class
call IMAP('EFE', "\\begin{frame}\<CR>\\frametitle{<++>}\<CR><++>\<CR>\\end{frame}<++>", 'tex')

" Columns environment for beamer class
call IMAP('ECS', "\\begin{columns}[<+options+>]\<CR><++>\<CR>\\end{columns}<++>", 'tex')

" Column environment for beamer class
call IMAP('ECO', "\\begin{column}[<+placement+>]{<+width+>}\<CR><++>\<CR>\\end{column}<++>", 'tex')
