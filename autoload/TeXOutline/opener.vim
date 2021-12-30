let s:save_cpo = &cpo
set cpo&vim

function! TeXOutline#opener#open_side_bar(contents) abort
  if empty(a:contents)
    " show error?
    return
  endif
  let l:opener = get(g:, 'TeXOutline_opener', 'vertical botright')
  let l:width = get(g:, 'TeXOutline_width', 30)
  " open
  let l:cmd =  join([l:opener . l:width . 'new' . '__TeXOutline__'], ' ')
  execute l:cmd
  call setline(1, a:contents)
  call s:set_option()
endfunction

function! s:set_option() abort
  setlocal readonly buftype=nofile filetype=TeXOutline nomodifiable
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
