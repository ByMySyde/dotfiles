if has('vim_starting')
  set nocompatible
endif

" autoinstall plug-in manager vim-plug: https://github.com/junegunn/vim-plug/
let s:vim_plug_path='~/.vim/autoload/plug.vim'
let s:vim_plug_url=
      \'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
if empty(glob(s:vim_plug_path))
  silent execute 'curl -fLo '.s:vim_plug_path.' --create-dirs '.s:vim_plug_url
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'ajh17/vimcompletesme'
Plug 'bling/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'kien/ctrlp.vim'
"Plug 'ludovicchabant/vim-gutentags'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ntpeters/vim-better-whitespace'
Plug 'racer-rust/vim-racer' " TODO: replacing?
Plug 'rhysd/vim-clang-format'
Plug 'rust-lang/rust.vim', { 'do': 'cargo install rustfmt --force' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
Plug 'shougo/vimproc.vim', { 'do': 'make' }
Plug 'tomasr/molokai'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
"Plug 'w0rp/ale'
Plug 'yuttie/comfortable-motion.vim'
call plug#end()

" airline
"let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1

" vim-indent-guides
let g:indent_guides_auto_colors=0
let g:indent_guides_enable_on_vim_startup=1
augroup vim_indent_guides
  autocmd!
  autocmd VimEnter,Colorscheme * highlight IndentGuidesEven ctermbg=234
  autocmd VimEnter,Colorscheme * highlight IndentGuidesOdd ctermbg=236
augroup END

" vim-better-whitespace
augroup vim_better_whitespace
  autocmd!
  autocmd VimEnter * silent ToggleStripWhitespaceOnSave
augroup END

" vim-racer
let g:racer_cmd="~/.cargo/bin"

" vim-clang-format
augroup vim_clang_format
  autocmd!
  autocmd VimEnter * silent ClangFormatAutoToggle
augroup END
let g:clang_format#detect_style_file=1
let g:clang_format#style_options = {
      \ "AccessModifierOffset" : "-1",
      \ "AlignTrailingComments" : "true",
      \ "AllowShortBlocksOnASingleLine" : "true",
      \ "AllowShortCaseLabelsOnASingleLine" : "true",
      \ "AllowShortFunctionsOnASingleLine" : "true",
      \ "AllowShortIfStatementsOnASingleLine" : "true",
      \ "AllowShortLoopsOnASingleLine" : "true",
      \ "BasedOnStyle" : "google",
      \ "ColumnLimit" : "80",
      \ "IndentWidth" : "2",
      \ "NamespaceIndentation" : "All",
      \ "Standard" : "Cpp11",
      \ "UseTab" : "Never"}

" rust.vim
augroup rust
  autocmd!
  autocmd BufNewFile,BufRead *.rs set filetype=rust
augroup END
let g:rustfmt_autosave=1

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_cpp_compiler_options='-O0 -std=c++14 -Wall -Winline -W'

" ale
"set statusline+=%#warningmsg#
"set statusline+=%{ALEGetStatusLine()}
"set statusline+=%*
"let g:ale_sign_column_always=1
"let g:ale_lint_on_save=1
"let g:ale_lint_on_text_changed=0
"let g:ale_lint_on_enter=0
"let g:ale_c_family_options='-O0 -Wall -Winline -W'
"let g:ale_c_gcc_options='-std=c11 '.g:ale_c_family_options
"let g:ale_cpp_gcc_options='-std=c++14 '.g:ale_c_family_options

" molokai
colorscheme molokai
let g:rehash256=1

" youcompleteme
"let g:ycm_rust_src_path='~/workspace/rust/1.10.0/'
"let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'

" general
filetype plugin indent on
syntax enable
set autoindent
set encoding=utf-8
set hidden
set laststatus=2
set mouse=n
set nobackup noswapfile writebackup
set t_Co=256
set wildmenu

" cursor and gutter look
set colorcolumn=+1,+2 cursorline textwidth=80
highlight CursorLineNr cterm=bold ctermbg=236
highlight LineNr ctermfg=244 ctermbg=234

" cursor behavior
set scrolloff=01110110 sidescrolloff=5
set wrap

" default: relative line number; insert mode: total line number
set number relativenumber
augroup gutter_number
  autocmd!
  autocmd InsertEnter,FocusLost * set norelativenumber
  autocmd InsertLeave,FocusGained * set relativenumber
augroup END

" tab settings
set expandtab shiftround smarttab
set shiftwidth=2 softtabstop=2 tabstop=2
augroup tab_settings
  autocmd!
  autocmd BufNewFile,BufRead *.c,*.h
      \ set filetype=c shiftwidth=8 softtabstop=8 tabstop=8 " Linux kernel style
augroup END

" immediate, default case insensitive highlight search
set hlsearch ignorecase incsearch smartcase

" split behavior
set splitbelow splitright

" keybindings
let mapleader="\<Space>"
nnoremap <leader>h <C-W><C-H><CR>
nnoremap <leader>j <C-W><C-J><CR>
nnoremap <leader>k <C-W><C-K><CR>
nnoremap <leader>l <C-W><C-L><CR>
nnoremap <leader>n :nohlsearch<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>v :e $MYVIMRC<CR>
nnoremap <leader>w :w<CR>
nnoremap <silent><leader><space> :call ScrolloffToggle()<CR>

" buffer navigation
nnoremap <silent><leader><S-tab> :bprevious<CR>
nnoremap <silent><leader><tab> :bnext<CR>

" filetypes
augroup filetypes
  autocmd!
  autocmd BufNewFile,BufRead *.asm set filetype=nasm
  autocmd FileType make setlocal noexpandtab
augroup END

" functions
let g:scrolloff_set=1
function! ScrolloffToggle()
  if g:scrolloff_set
    let g:scrolloff_set=0
    set scrolloff=0
  else
    let g:scrolloff_set=1
    set scrolloff=01110110
  endif
endfunction
