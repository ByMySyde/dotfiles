" Neovim

if has('vim_starting')
  set nocompatible
endif

" autoinstall plug-in manager vim-plug
" https://github.com/junegunn/vim-plug/
let s:vim_plug_path='~/.config/nvim/autoload/plug.vim'
let s:vim_plug_url='https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
if empty(glob(s:vim_plug_path))
  echo 'vim-plug not found.'
  if executeable('curl')
    echo 'Downloading vim-plug.'
    silent execute 'curl -fLo '.s:vim_plug_path.' --create-dirs '.s:vim_plug_url
  else
    echo 'Unable to download vim-plug.'
    finish
  endif
  augroup vimplug
    autocmd!
    autocmd VimEnter * PlugInstall
  augroup END
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'bling/vim-airline'
Plug 'kien/ctrlp.vim'
Plug 'metakirby5/codi.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ntpeters/vim-better-whitespace'
Plug 'rhysd/vim-clang-format'
Plug 'rust-lang/rust.vim', { 'do': 'cargo install rustfmt' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
Plug 'shougo/vimproc.vim', { 'do': 'make' }
Plug 'tomasr/molokai'
Plug 'tpope/vim-sensible'
Plug 'valloric/youcompleteme', { 'do': './install.py --all' }
call plug#end()

" airline
let g:airline_powerline_fonts=1
" let g:airline_theme='smol'
let g:airline#extensions#tabline#enabled=1

" codi
function CodiSetWidth()
  "let g:codi#width=winwidth('%')/2
  let g:codi#width=str2nr(winwidth(0))/2
  Codi
endfunction
augroup Codi
  autocmd!
  autocmd VimResized * let g:codi#width=str2nr(winwidth(0))/2
augroup END

" vim-indent-guides
let g:indent_guides_auto_colors=0
let g:indent_guides_enable_on_vim_startup=1
autocmd VimEnter,Colorscheme * highlight IndentGuidesEven ctermbg=234
autocmd VimEnter,Colorscheme * highlight IndentGuidesOdd ctermbg=236

" vim-better-whitespace
autocmd VimEnter * silent ToggleStripWhitespaceOnSave

" vim-clang-format
autocmd VimEnter * silent ClangFormatAutoToggle
let g:clang_format#style_options = {
      \ "AccessModifierOffset" : "-1",
      \ "AlignConsecutiveAssignments" : "true",
      \ "AlignTrailingComments" : "true",
      \ "AllowShortIfStatementsOnASingleLine" : "true",
      \ "AllowShortLoopsOnASingleLine" : "true",
      \ "BasedOnStyle" : "google",
      \ "ColumnLimit" : "80",
      \ "IndentWidth" : "2",
      \ "NamespaceIndentation" : "All",
      \ "Standard" : "Cpp14",
      \ "UseTap" : "Never"}

" rust.vim
autocmd BufNewFile,BufRead *.rs set filetype=rust
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

" molokai
colorscheme molokai
let g:rehash256=1

" youcompleteme
let g:ycm_rust_src_path='~/workspace/rust/1.10.0/'
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'

" general
filetype plugin indent on
syntax enable
set encoding=utf-8
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

"default: relative line number; insert mode: total line number
set number relativenumber
autocmd InsertEnter,FocusLost * set norelativenumber
autocmd InsertLeave,FocusGained * set relativenumber

" tab settings
set expandtab shiftround smarttab
set shiftwidth=2 softtabstop=2 tabstop=2

" immediate, default case_insensitive highlight search
set hlsearch ignorecase incsearch smartcase

" split behavior
set splitbelow splitright

" keybindings
let mapleader="\<Space>"
nnoremap <leader>q :q<CR>
nnoremap <leader>v :e $MYVIMRC<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader><space> :nohlsearch<CR>

" buffer navigation
nnoremap <silent><leader><S-tab> :bprevious<CR>
nnoremap <silent><leader><tab> :bnext<CR>

" filetypes
autocmd BufNewFile,BufRead *.asm set filetype=nasm
autocmd FileType make setlocal noexpandtab
