local conform = require('conform')

conform.setup({
    formatters_by_ft = {
        python = {'black'}, -- Formatter for Python
        cpp = {'clang-format'}, -- Formatter for C++
        java = {'google-java-format'}, -- Formatter for Java
    },
    async = true, -- Enable asynchronous formatting
})

-- Function to format and notify
local function format_and_notify()
    conform.format()
    vim.notify('Code Successfully Formatted!', vim.log.levels.INFO)
end

-- Make the function available globally for keybinding
_G.format_and_notify = format_and_notify

-- Keybinding for manual formatting
vim.api.nvim_set_keymap('n', '<leader>cf', '<cmd>lua format_and_notify()<CR>', { noremap = true, silent = true })

