
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal expandtab
setlocal iskeyword+=:
setlocal textwidth=70
" setlocal textwidth=0
" setlocal showbreak+=\ \ \ \ \ 
setlocal spell

let g:tex_fold_enabled = 1

let maplocalleader = ","
let g:LatexBox_viewer = "$PDFVIEWER"
let g:LatexBox_autojump = 1 	" jump to first error on latexmk

" Maps
inoremap <buffer> <C-CR> <C-O>o\item<space>
nnoremap <buffer> <C-CR> o\item<space>
inoremap " ``"<Esc>:call BC_AddChar("\"")<CR>i
inoremap $ $$<Esc>:call BC_AddChar("$")<CR>i
inoremap ^^ ^{}<Esc>:call BC_AddChar("}")<CR>i
inoremap __ _{}<Esc>:call BC_AddChar("}")<CR>i
" inoremap (( \l(  \r)<Esc>Bh:call BC_AddChar("$")<CR>i
" inoremap <silent> <buffer> it<tab> it<C-R>=UltiSnips_Anon('\\item ${1:${VISUAL}}', 'it', 'item', 'b')<cr><C-O>==
" inoremap <silent> <buffer> $$ $$<C-R>=UltiSnips_Anon('\$${1:${VISUAL}}\$', '$$', 'math', '')<cr><C-O>==

nmap <buffer> <LocalLeader>wl  :w<CR><LocalLeader>ll
nmap <buffer> <F5>	  <Plug>LatexChangeEnv
vmap <buffer> <F7>	  <Plug>LatexWrapSelection
vmap <buffer> <S-F7>	  <Plug>LatexEnvWrapSelection

" Reformat lines (getting the spacing correct) {{{
fun! TeX_fmt()
    if (getline(".") != "")
    let save_cursor = getpos(".")
        let op_wrapscan = &wrapscan
        set nowrapscan
	let par_begin = '^\(%D\)\=\s*\($\|\\begin\|\\end\|\\\[\|\\\]\|\\\(sub\)*section\>\|\\item\>\|\\NC\>\|\\blank\>\|\\noindent\>\)'
	let par_end   = '^\(%D\)\=\s*\($\|\\begin\|\\end\|\\\[\|\\\]\|\\place\|\\\(sub\)*section\>\|\\item\>\|\\NC\>\|\\blank\>\)'
    try
      exe '?'.par_begin.'?+'
    catch /E384/
      1
    endtry
        norm V
    try
      exe '/'.par_end.'/-'
    catch /E385/
      $
    endtry
    norm gq
        let &wrapscan = op_wrapscan
    call setpos('.', save_cursor) 
    endif
endfun

nmap Q :call TeX_fmt()<CR>
