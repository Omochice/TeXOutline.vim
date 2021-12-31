if exists('g:loaded_TeXOutline')
  finish
endif
let g:loaded_TeXOutline = v:true

command! TeXOutline call TeXOutline#opener#open_side_bar(
      \ TeXOutline#constructor#get_sections(-1))

command! -range TeXOutlineIndent call TeXOutline#cmd#indent(+1, <line1>, <line2>)
command! -range TeXOutlineDedent call TeXOutline#cmd#indent(-1, <line1>, <line2>)

nnoremap <silent> <Plug>(texoutline:normal:indent) :TeXOutlineIndent<CR>
nnoremap <silent> <Plug>(texoutline:normal:dedent) :TeXOutlineDedent<CR>

xnoremap <silent> <Plug>(texoutline:visual:indent) :TeXOutlineIndent<CR>
xnoremap <silent> <Plug>(texoutline:visual:dedent) :TeXOutlineDedent<CR>
