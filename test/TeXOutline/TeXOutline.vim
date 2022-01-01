let s:suite = themis#suite('TeXTable')
let s:scope = themis#helper('scope')

function! s:construct(lines, ...) abort
  let l:bufnr = a:0 > 0 ? a:000[0] : bufnr()
  call setbufline(l:bufnr, 1, a:lines)
endfunction

let s:lines = [
      \ '\section{1}',
      \ '\subsection{1-1}',
      \ '\subsection{1-2}',
      \ '\subsubsection{1-2-1}',
      \ '\section{1}',
      \ ]

function! s:suite.test_open_outline() abort
  let l:save_bufnr = bufnr()
  let l:n_buffer = len(getbufinfo({'buflisted': v:true}))
  call s:construct(s:lines, l:save_bufnr)
  execute 'TeXOutline'
  " number of buffer must be increased
  call assert_equal(l:n_buffer + 1, len(getbufinfo({'buflisted': v:true})))
  " cursor must move into location-list
  let l:bufnr = bufnr()
  call assert_false(l:save_bufnr == l:bufnr)
  " window width must be equal to 30
  let l:wininfo = filter(getwininfo(), {_, v -> v['bufnr'] == l:bufnr})[0]
  call assert_equal(30, l:wininfo['width'])
endfunction
