vim.g.python3_host_prog = '/opt/anaconda3/bin/python3'
vim.api.nvim_set_keymap('n', 'w', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>wq', ':wq<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'tn', ':tabnew<CR>', { noremap = true, silent = true })
-- Key mappings for moving between tabs
vim.api.nvim_set_keymap('n', '<A-,>', 'gT', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-.>', 'gt', { noremap = true, silent = true })

require("spol29.remap")
require("spol29.packer")
require("spol29.set")
require("autoclose").setup()

-- ...
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

--nvim-tree


-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- OR setup with some options
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 25,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})