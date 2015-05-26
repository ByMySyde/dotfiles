" important remaps
let mapleader=','

" open vimrc
nnoremap <leader>v :e ~/.vimrc<CR>
"nnoremap <leader>V :tabnew e ~/.vimrc<CR>
nnoremap <leader>n :e ~/.vimrc.bundles<CR>
"nnoremap <leader>N :tabnew e ~/.vimrc.bundles<CR>

syntax enable

" key remapping
nnoremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>
nnoremap <Up> <NOP>

" general
set encoding=utf-8  " encoding: UTF-8
set noswapfile      " create no swap files
set backspace=2     " deletion in insert mode

" ui
set laststatus=2    " always display status line
set showcmd         " show command in bottom bar
set showmatch       " highlight matching {[()]}
set cursorline      " highlight current line
set ruler           " show ruler position
set rulerformat=%l,%v " rulerformat: line, v?
set number          " show line numbers
set wildmenu        " visual autocompletion for commands

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

" search
set incsearch       " immediate search
set hlsearch        " highlight search results
nnoremap <leader><space> :nohlsearch<CR>  " stop highlighting


" file
filetype indent on  " filetype-detection & -specific file loading

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

" gui settings
if has('gui_running')
  set visualbell    " no audible bell
  set guioptions-=T " no toolbar
  set guioptions-=m " no menu
  set guioptions+=c " use console dialog

  " platform specific settings
  if has('gui_win32')
    set guifont=Source_Code_Pro:h10:cANSI " windows font
    au GUIEnter * simalt ~x " start in fullscreen
  else
    set guifont=Source\ Code\ Pro\ 10     " font
  endif

  " colorscheme
  colorscheme molokai
  let g:rehash256=1
else
" no gui settings
  colorscheme desert
endif
