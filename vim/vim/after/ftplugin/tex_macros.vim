"Custom macros

call IMAP(',a', '$\alpha$', 'tex')
call IMAP(',b', '$\beta$', 'tex')
call IMAP(',q', '$\theta$', 'tex')
call IMAP(',w', '$\omega$', 'tex')

call IMAP('`w', '\omega', 'tex')	        "change the \wedge default
call IMAP('`e', '\epsilon', 'tex')	        "change the \varepsilon default
call IMAP('`u', '\unit{<++>}{<++>}<++>', 'tex')	"change the \upsilon default
call IMAP(',v', '\bvec{<++>}<++>', 'tex')	"change the \varsigma default
call IMAP(',d', '\dot{<++>}<++>', 'tex')
call IMAP('<<', '\left< <++> \right><++>', 'tex')
call IMAP('||', '\left| <++> \right|<++>', 'tex')
call IMAP('==', '&= ', 'tex')                   "needs align environment


"frame environment for beamer class:
call IMAP('EFE', "\\begin{frame}\<CR>\\frametitle{<++>}\<CR><++>\<CR>\\end{frame}<++>", 'tex') 

"columns environment for beamer class:
call IMAP('ECS', "\\begin{columns}[<+options+>]\<CR><++>\<CR>\\end{columns}<++>", 'tex')

"column environment for beamer class:
call IMAP('ECO', "\\begin{column}[<+placement+>]{<+width+>}\<CR><++>\<CR>\\end{column}<++>", 'tex')

