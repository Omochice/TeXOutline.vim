[![CI](https://github.com/Omochice/TeXOutline.vim/actions/workflows/ci.yml/badge.svg)](https://github.com/Omochice/TeXOutline.vim/actions/workflows/ci.yml)

# TeXOutline.vim

Vim/Neovim plugin that show TeX outline and indent/dedent it.

![demo](https://i.gyazo.com/bc64e56cb2b2e17732ae094044c00d33.gif)

## Installation

Use your favorite plugin-manager.

```vim
"vim-plug
Plug 'Omochice/TeXOutline.vim'

"dein.vim
call dein#add('Omochice/TeXOutline.vim')
```

## Usage

On TeX source buffer, execute `TeXOutline` to show outline.

After this command, cursor move into outline buffer.

On outline buffer, type `>>` or `<<` on normal-mode to indent/dedent section.
And type `>` or `<` on visual-mode is able too.

## Commands

- `TeXOutline`
        Show outline current TeX source.

- `TeXOutlineIndent`
        Indent the section(s) on cursor/selected.

- `TeXOutlineDedent`
        Dedent the section(s) on cursor/selected.

## Mappings

On outline buffer, below commands are defined.

```vim
nmap <buffer> << <Plug>(texoutline:normal:dedent)
nmap <buffer> >> <Plug>(texoutline:normal:indent)
xmap <buffer> <  <Plug>(texoutline:visual:dedent)
xmap <buffer> >  <Plug>(texoutline:visual:indent)
```

## Variables

- `g:texoutline_disable_conceal`
        Disable conceal on outline. (Default to `v:false`)

- `g:texoutline_disable_mappings`
        Disable mappings on outline. (Default to `v:false`)

- `g:texoutline_width`
        Number that use as outline width (Default to `30`)
