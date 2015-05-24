" open vimrc
nnoremap <leader>v :e ~/.vimrc<CR>
nnoremap <leader>V :tabnew e ~/.vimrc<CR>

syntax on

" key remapping "
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Right> <NOP>
nnoremap <Left> <NOP>

" default "
set encoding=utf-8
set noswapfile
set expandtab
set shiftwidth=2
set tabstop=2
set backspace=2
set laststatus=2

" font "
set guifont=Source_Code_Pro:h10:cANSI

" cpp syntax "
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

" text width "
set textwidth=80
set colorcolumn=+1
set wrap

" numbers "
set number
set numberwidth=5

" cursor position "
set ruler
" set rulerformat=%l,%v

" package manager: neobundle "
if !1 | finish | endif

if has('vim_starting')
  if &compatible
    set nocompatible
  endif

   " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
  filetype plugin indent on

  NeoBundleFetch 'Shougo/neobundle.vim'

  NeoBundle 'tomasr/molokai'
  NeoBundle 'altercation/vim-colors-solarized'
  NeoBundle 'nathanaelkane/vim-indent-guides'
call neobundle#end()

" install uninstalled bundles
NeoBundleCheck

" colorscheme
colors molokai
let g:rehash256=1

" indent guide
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=2
