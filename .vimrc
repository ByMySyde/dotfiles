" open vimrc
nnoremap <leader>v :e ~/.vimrc<CR>
"nnoremap <leader>V :tabnew e ~/.vimrc<CR>
nnoremap <leader>n :e ~/.vimrc.bundles<CR>
"nnoremap <leader>N :tabnew e ~/.vimrc.bundles<CR>

syntax enable

" key remapping
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Right> <NOP>
nnoremap <Left> <NOP>

" general
set encoding=utf-8  " encoding: UTF-8
set noswapfile      " create no swap files
set backspace=2     " deletion in insert mode
set laststatus=2    " always display status line
set showcmd         " show command in bottom bar
set cursorline      " highlight current line
set ruler           " show ruler position
set rulerformat=%l,%v " rulerformat: line, v?
set number          " show line numbers (numberwidth=4 (default))

" tab settings
set expandtab
set shiftround
set shiftwidth=2
set tabstop=2
set softtabstop=2

" text width
set textwidth=80
set colorcolumn=+1
set wrap

" include package manager
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0

" cpp syntax
let g:cpp_class_scope_highlight=1
let g:cpp_experimental_template_highlight=1

" indent guide
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=2

if has('gui_running')
  " font
  if has('gui_win32')
    set guifont=Source_Code_Pro:h10:cANSI
  else
    set guifont=Source\ Code\ Pro\ 10
  endif

  " colorscheme
  colorscheme molokai
  let g:rehash256=1
else
  colorscheme desert
endif
