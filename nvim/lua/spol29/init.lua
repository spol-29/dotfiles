vim.g.python3_host_prog = '/opt/anaconda3/bin/python3'

require("spol29.remap")
require("spol29.packer")
require("spol29.set")
require("autoclose").setup()

-- ...
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

