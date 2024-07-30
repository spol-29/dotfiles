
-- Enable highlighting of cell markers
vim.g.jukit_highlight_markers = 1
vim.api.nvim_set_keymap('n', '<leader>oc', ':call jukit#output#hide()<CR>', { noremap = true, silent = true })
-- Map <leader><cr> to run the current line
vim.api.nvim_set_keymap('n', '<leader><cr>', ':call jukit#send#line()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader><cr>', ':<C-U>call jukit#send#selection()<cr>', { noremap = true, silent = true })

-- Set the highlight colors for cell markers and text cell background
vim.cmd [[
  highlight jukit_cellmarker_colors guifg=#4e4e4e guibg=#4e4e4e ctermbg=238 ctermfg=238
  highlight jukit_textcell_bg_colors guibg=#3a3a3a ctermbg=237
]]