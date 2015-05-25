" open vimrc
nnoremap <leader>v :e ~/.vimrc<CR>
"nnoremap <leader>V :tabnew e ~/.vimrc<CR>
nnoremap <leader>n :e ~/.vimrc.bundles<CR>
"nnoremap <leader>N :tabnew e ~/.vimrc.bundles<CR>

syntax on

" key remapping "
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Right> <NOP>
nnoremap <Left> <NOP>

" default "
set encoding=utf-8
set noswapfile
set backspace=2
set laststatus=2

" tab settings
set expandtab
set shiftround
set shiftwidth=2
set tabstop=2

" font "
set guifont=Source_Code_Pro:h10:cANSI

" text width "
set textwidth=80
set colorcolumn=+1
set wrap

" numbers "
set number
" set numberwidth=4

" cursor position "
set ruler
" set rulerformat=%l,%v

" include package manager
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" colorscheme
colors molokai
let g:rehash256=1

" syntax:
let g:syntastic_check_on_open=1

" cpp syntax "
let g:cpp_class_scope_highlight=1
let g:cpp_experimental_template_highlight=1

" indent guide
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=2
