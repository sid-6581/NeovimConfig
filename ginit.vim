if exists(':GuiFont')
  GuiFont! JetBrainsMono\ Nerd\ Font\ Mono:h9.5:w57
endif

if exists(':GuiRenderLigatures')
  GuiRenderLigatures 0
endif

if exists('g:fvim_loaded')
  set guifont=JetBrainsMono\ Nerd\ Font\ Mono:h14
  FVimFontNoBuiltinSymbols v:true
endif
