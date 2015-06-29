" Local config
"if filereadable($HOME . "/.gvimrc.local")
"  source ~/.gvimrc.local
"endif

" gui settings
if has('gui_running')
  autocmd GUIEnter * set vb t_vb=  " ensure no error bells for gvim

  set guioptions-=T  " no toolbar
  set guioptions-=m  " no menu
  set guioptions+=c  " use console dialog
  set guioptions-=e  " use console tab page
  set guioptions-=L  " never have left scrollbar

  if has('gui_win32')
    autocmd GUIEnter * simalt ~x  " autostart in fullscreen
  endif
endif
