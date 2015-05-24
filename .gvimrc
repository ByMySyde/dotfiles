" No audible bell
set vb

" No toolbar
set guioptions-=T

" No menu
set guioptions-=m

" Use console dialogs
set guioptions+=c

" Local config
if filereadable($HOME . "/.gvimrc.local")
  source ~/.gvimrc.local
endif

" start fullscreen
" windows
au GUIEnter * simalt ~x
