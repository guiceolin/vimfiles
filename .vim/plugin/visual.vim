set background=dark

if has('nvim')
  colorscheme NeoSolarized
  set termguicolors
  let g:neosolarized_contrast = "low"
else
  set term=gnome-256color
  colorscheme solarized
endif
