let s:save_cpo = &cpo
set cpo&vim

function! TeXOutline#opener#open_side_bar(contents) abort
  if empty(a:contents)
    " show error?
    return
  endif
  let l:width = get(g:, 'TeXOutline_width', 30)
  let l:save_eft = &errorformat
  let &errorformat = '%f:%m:%l'
  execute 'lgetexpr a:contents | vertical botright' . l:width . 'lopen'
  let &errorfile = l:save_eft

  if !get(g:, 'texoutline_disable_conceal', v:false)
    setlocal conceallevel=3 concealcursor=nc nowrap
    syntax match texoutline_conceal '[a-zA-z\/\._]\+|\d\+|' conceal
    syntax match texoutline_conceal_section '\(sub\)*section' conceal
  endif

  if !get(g:, 'texoutline_disable_mappings', v:false)
    nmap <buffer> << <Plug>(texoutline:normal:dedent)
    nmap <buffer> >> <Plug>(texoutline:normal:indent)
    xmap <buffer> <  <Plug>(texoutline:visual:dedent)
    xmap <buffer> >  <Plug>(texoutline:visual:indent)
  endif
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
