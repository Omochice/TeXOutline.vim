if exists('g:loaded_TeXOutline')
  finish
endif
let g:loaded_TeXOutline = v:true

command! TeXOutline call TeXOutline#opener#open_side_bar(
      \ TeXOutline#constructor#get_sections(v:true))

