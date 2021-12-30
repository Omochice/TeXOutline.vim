let s:save_cpo = &cpo
set cpo&vim

" function! TeXOutline#(...) abort
"   body
" endfunction

function! TeXOutline#constructor#get_sections(make_tree) abort
  let l:lines = getline(1, '$')
  let l:sections = []
  let l:depths = []
  for l:idx in range(len(l:lines))
    if l:lines[l:idx] =~ '\(=?sub\)*section'
      let l:sections += [l:lines[l:idx] . ':' . string(l:idx+1)]
      let l:depths += [count(l:lines[l:idx], 'sub')]
    endif
  endfor
  call map(l:sections, {_, v -> substitute(v, '^\s*', '', '')[1:]})
  if a:make_tree
    return [expand('%')] + s:make_tree(l:sections, l:depths)
  else
    return [expand('%')] + l:sections
  endif
endfunction

" function! s:outline() abort
"   let l:winid = win_getid()
"   let l:lines = getline(1, '$')
"   let l:sections = []
"   let l:depths = []
"   for l:idx in range(len(l:lines))
"     if l:lines[l:idx] =~ '\(=?sub\)*section'
"       let l:sections += [l:lines[l:idx][1:] . ':' . string(l:idx+1)]
"       let l:depths += [count(l:lines[l:idx], 'sub')]
"     endif
"   endfor
"   call map(l:sections, {_, v -> substitute(v, '^\s*', '', '')})
"   let l:results = s:make_tree(l:sections, l:depths)
"   " let l:results = l:sections
"   if empty(l:results)
"     return
"   else
"     let l:opener = get(g:, 'TeXOutline_opener', 'vertical botright')
"     let l:width = get(g:, 'TeXOutline_width', 30)
"     execute join([l:opener . l:width . 'new' . '__TeXOutline__'], ' ')
"     call setline(1, l:results)
"     setlocal readonly buftype=nofile filetype=TeXOutline nomodifiable
"     " if get(g:, 'TeXOutline_no_mapping', v:false)
"     "   " nmap <buffer> << <Cmd>call TeXoutline#cmd#indent(-1)<CR>
"     "   " nmap <buffer> >> <Cmd>call TeXoutline#cmd#indent(+1)<CR>
"     "   nmap <buffer> <CR> <Cmd>call <SID>jump()<CR>
"     " endif
"   endif
" endfunction
" 
" function! s:jump() abort
"   body
" endfunction

function! s:is_last_element(i, d) abort
  return a:i == len(a:d) - 1
        \ || a:d[a:i] > a:d[a:i + 1]
endfunction

function! s:make_tree(contents, depths) abort
  let l:results = map(
        \ a:contents,
        \ {i, val -> repeat('| ', a:depths[i]) . (s:is_last_element(i, a:depths) ? '└ ' : '├ ') . a:contents[i]}
        \ )
  return l:results
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
