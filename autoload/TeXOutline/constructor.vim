let s:save_cpo = &cpo
set cpo&vim

function! TeXOutline#constructor#get_sections(bufnr) abort
  if a:bufnr == -1 " use current buffer
    let l:bufnr = bufnr()
  else
    let l:bufnr = a:bufnr
  endif

  let l:lines = getbufline(l:bufnr, 1, '$')
  let l:sections = []
  let l:depths = []
  for l:idx in range(len(l:lines))
    if l:lines[l:idx] =~ '\(=?sub\)*section'
      let l:sections += [l:lines[l:idx] . ':' . string(l:idx+1)]
      let l:depths += [count(l:lines[l:idx], 'sub')]
    endif
  endfor
  call map(l:sections, {_, v -> substitute(v, '^\s*', '', '')[1:]})
  let l:res = s:make_tree(l:sections, l:depths)
  call map(l:res, {_, v -> bufname(l:bufnr) . ':' . v})
  return l:res
endfunction

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
