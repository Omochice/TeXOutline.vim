let s:save_cpo = &cpo
set cpo&vim

function! TeXoutline#cmd#jump(arg) abort
  let l:curline = line('.')
  if l:curline == 0
    return
  else if l:curline == 1
    call s:goto_win(getline(l:curline))
  endif
  let l:line = getline(l:curline)
endfunction

function! s:get_info_under_cursor(lnum) abort

endfunction   

let &cpo = s:save_cpo
unlet s:save_cpo
