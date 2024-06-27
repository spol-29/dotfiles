
-- Enable highlighting of cell markers
vim.g.jukit_highlight_markers = 1

-- Set the highlight colors for cell markers and text cell background
vim.cmd [[
  highlight jukit_cellmarker_colors guifg=#4e4e4e guibg=#4e4e4e ctermbg=238 ctermfg=238
  highlight jukit_textcell_bg_colors guibg=#3a3a3a ctermbg=237
]]