"Custom macros

call IMAP('`w', '\omega', 'tex')	  "change \wedge default
call IMAP('`e', '\epsilon', 'tex')        "change \varepsilon default

call IMAP(',a', '$\alpha$', 'tex')
call IMAP(',b', '$\beta$', 'tex')
call IMAP(',q', '$\theta$', 'tex')
call IMAP(',w', '$\omega$', 'tex')

call IMAP(',u', '\unit{<++>}{<++>}<++>', 'tex')
call IMAP(',v', '\bvec{<++>}<++>', 'tex') "change \varsigma default
call IMAP(',d', '\dot{<++>}<++>', 'tex')
call IMAP(',t', '\text{<++>}<++>', 'tex')
call IMAP(',-', '\bar{<++>}<++>', 'tex')
call IMAP(',_', '\bar{<++>}<++>', 'tex')
call IMAP(',h', '\hat{<++>}<++>', 'tex')
call IMAP(',n', '\note{<++>}<++>', 'tex')
call IMAP(',T', '\todo{<++>}<++>', 'tex')


call IMAP('<<', '\left< <++> \right><++>', 'tex')
call IMAP('||', '\left| <++> \right|<++>', 'tex')
call IMAP('`[', '\{ <++> \}<++>', 'tex')
call IMAP(',{', '\{ <++> \}<++>', 'tex')
call IMAP('==', '&= ', 'tex')             "needs align environment

"align environment
call IMAP('EAL', "\\begin{align}\<CR><++>\<CR>\\label{<++>}\<CR>\\end{align}<++>", 'tex')
"
"starred align environment
call IMAP('EAS', "\\begin{align*}\<CR><++>\<CR>\\label{<++>}\<CR>\\end{align*}<++>", 'tex')

"starred equation environment
call IMAP('EES', "\\begin{equation*}\<CR><++>\<CR>\\label{<++>}\<CR>\\end{equation*}<++>", 'tex')

" Beamer Class:
"frame environment
call IMAP('EFE', "\\begin{frame}\<CR>\\frametitle{<++>}\<CR><++>\<CR>\\end{frame}<++>", 'tex')

"columns environment
call IMAP('ECS', "\\begin{columns}[<+options+>]\<CR><++>\<CR>\\end{columns}<++>", 'tex')

"column environment
call IMAP('ECO', "\\begin{column}[<+placement+>]{<+width+>}\<CR><++>\<CR>\\end{column}<++>", 'tex')

