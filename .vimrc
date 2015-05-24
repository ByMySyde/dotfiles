" open vimrc
nnoremap <leader>v :e ~/.vimrc<CR>
nnoremap <leader>V :tabnew e ~/.vimrc<CR>

" key remapping "
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Right> <NOP>
noremap <Left> <NOP>

" default "
set encoding=utf8
set expandtab
set shiftwidth=4
set tabstop=4
syntax on
set backspace=2
set laststatus=2

" colorscheme "
colorscheme monokai

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
set numberwidth=4

" cursor position "
set ruler
" set rulerformat=%l,%v
