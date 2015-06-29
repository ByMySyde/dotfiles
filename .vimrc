" .vimrc

" include settings
if filereadable(expand("~/.vimrc.settings"))
  source ~/.vimrc.settings
endif

" include keymappings
if filereadable(expand("~/.vimrc.keymappings"))
  source ~/.vimrc.keymappings
endif

" include package manager
if filereadable(expand("~/.vimrc.neobundle"))
  source ~/.vimrc.neobundle
endif

" include plugins
if filereadable(expand("~/.vimrc.plugins"))
  source ~/.vimrc.plugins
endif

" include funtcions
if filereadable(expand("~/.vimrc.functions"))
  source ~/.vimrc.functions
endif
