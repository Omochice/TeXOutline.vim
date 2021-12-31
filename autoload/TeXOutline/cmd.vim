let s:save_cpo = &cpo
set cpo&vim

function! TeXOutline#cmd#indent(depth, line1, line2) abort
  let l:save_pos = getpos('.')
  let l:lines = a:line1 == a:line2
        \ ? [getline('.')]
        \ : getline(a:line1, a:line2)
  let l:bufname = split(l:lines[0], '|')[0]
  let l:bufnr = bufnr(l:bufname)
  for l:line in l:lines
    let l:lnum = split(l:line, '|')[1]
    let l:content = getbufline(l:bufnr, l:lnum)[0]
    call setbufline(l:bufnr, l:lnum,
          \ (a:depth == 1
          \ ? substitute(l:content, 'section', 'subsection', '')
          \ : substitute(l:content, 'subsection', 'section', '')))
  endfor
  call TeXOutline#opener#open_side_bar(
        \ TeXOutline#constructor#get_sections(l:bufnr)
        \ )
  call setpos('.', l:save_pos)
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
