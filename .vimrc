" important remaps
let mapleader=','

" disable arrow keys
nnoremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>
nnoremap <Up> <NOP>

" open vimrc
nnoremap <leader>v :e ~/.vimrc<CR>
" open package manager: neobundle
nnoremap <leader>n :e ~/.vimrc.neobundle<CR>
" open plugins
nnoremap <leader>p :e ~/.vimrc.plugins<CR>

syntax enable

" general
set encoding=utf8
set noswapfile
set backspace=2       " deletion in insert mode
set clipboard=unnamed " use os clipboard
"set autoindent        " automatically set indent to new line
"set backspace=eol,start,indent     " deletion in insert mode
"set whichwrap+=<,>,h,l " ???

" ui
set noruler laststatus=2 " always display status line
"set statusline=%-15F\ (%c,%l)
"set statusline=%l,%c%V%=%P
set showcmd cmdheight=2  " show command with barheight 2
set cursorline        " highlight current line
set number            " show line numbers
set wildmenu          " visual autocompletion for commands

" tab settings
set expandtab         " convert tabs to spaces
set shiftround        " use << and >> for shifting
set shiftwidth=2      " shift by 2 characters
set tabstop=2
set softtabstop=2

" text width
set textwidth=80
set colorcolumn=+1
set wrap

" search
set incsearch       " immediate search
set hlsearch        " highlight search results
set ignorecase      " no case-sensitive search
" stop highlighting
nnoremap <leader><space> :nohlsearch<CR>

" file
filetype plugin indent on  " filetype-detection & -specific file loading

" include package manager
if filereadable(expand("~/.vimrc.neobundle"))
  source ~/.vimrc.neobundle
endif

" include plugins
if filereadable(expand("~/.vimrc.plugins"))
  source ~/.vimrc.plugins
endif

" no error bells
set noerrorbells visualbell t_vb=

" gui settings
if has('gui_running')
  autocmd GUIEnter * set vb t_vb=  " ensure no error bells for gvim

  set guioptions-=T  " no toolbar
  set guioptions-=m  " no menu
  set guioptions+=c  " use console dialog
  set guioptions-=e  " use console tab page

  " platform specific settings
  if has('gui_win32')
    set guifont=Source_Code_Pro:h10
    "set guifont=Sauce_Code_Powerline:h10  " plugin: airline
    autocmd GUIEnter * simalt ~x  " autostart in fullscreen
  else
    set guifont=Source\ Code\ Pro\ 10
    "set guifont=Sauce\ Code\ Powerline\ h10  " plugin: airline
  endif
endif
