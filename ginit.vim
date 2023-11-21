if exists(':GuiFont')
  GuiFont! JetBrainsMono\ NFM:h9.5
endif

if exists(':GuiRenderLigatures')
  GuiRenderLigatures 0
endif

if exists('g:fvim_loaded')
  set guifont=JetBrainsMono\ NFM:h14
  FVimFontNoBuiltinSymbols v:true
endif
