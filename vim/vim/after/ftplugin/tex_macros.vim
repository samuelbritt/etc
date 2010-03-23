"Custom macros

call IMAP(',a', '$\alpha$', 'tex')
call IMAP(',b', '$\beta$', 'tex')
call IMAP(',q', '$\theta$', 'tex')
call IMAP(',w', '$\omega$', 'tex')

call IMAP('`w', '\omega', 'tex')	  "change \wedge default
call IMAP('`e', '\epsilon', 'tex')        "change \varepsilon default

call IMAP(',u', '\unit{<++>}{<++>}<++>', 'tex')
call IMAP(',v', '\bvec{<++>}<++>', 'tex') "change \varsigma default
call IMAP(',d', '\dot{<++>}<++>', 'tex')
call IMAP(',t', '\text{<++>}<++>', 'tex')

call IMAP('<<', '\left< <++> \right><++>', 'tex')
call IMAP('||', '\left| <++> \right|<++>', 'tex')
call IMAP('==', '&= ', 'tex')             "needs align environment


" Beamer Class:
"frame environment
call IMAP('EFE', "\\begin{frame}\<CR>\\frametitle{<++>}\<CR><++>\<CR>\\end{frame}<++>", 'tex') 

"columns environment
call IMAP('ECS', "\\begin{columns}[<+options+>]\<CR><++>\<CR>\\end{columns}<++>", 'tex')

"column environment
call IMAP('ECO', "\\begin{column}[<+placement+>]{<+width+>}\<CR><++>\<CR>\\end{column}<++>", 'tex')

