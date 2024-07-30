vim.g.mapleader = " "
vim.opt.clipboard:append("unnamedplus")


-- Exit nvim with " qq"
vim.keymap.set("n", "<leader>qq", vim.cmd.q)

function CompileAndRun()
    vim.cmd('w')                            -- Save the current file
    if vim.bo.filetype == 'cpp' then
        vim.cmd('term g++ % -o %< && ./%<') -- Compile the file and run the output executable in a terminal
    end
end

vim.api.nvim_create_augroup('cpp', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'cpp',
    callback = function()
        vim.api.nvim_buf_set_keymap(0, 'n', '<F5>', ':lua CompileAndRun()<CR>', { noremap = true, silent = true })
    end,
    group = 'cpp'
})

-- Function to save the current file and run it in a terminal
function RunPython()
    vim.cmd('w')                  -- Save the current file
    if vim.bo.filetype == 'python' then
        vim.cmd('term python3 %') -- Run the current file in a terminal
    end
end

-- Create an augroup to manage autocmds for Python files
vim.api.nvim_create_augroup('python', { clear = true })

-- Set up an autocmd to map <F6> to RunPython function for Python files
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'python',
    callback = function()
        vim.api.nvim_buf_set_keymap(0, 'n', '<F6>', ':lua RunPython()<CR>', { noremap = true, silent = true })
    end,
    group = 'python'
})

-- Function to save the current file, compile it, and run it in a terminal
function CompileAndRunJava()
    vim.cmd('w') -- Save the current file
    if vim.bo.filetype == 'java' then
        -- Get the file name without the extension
        local filename = vim.fn.expand('%:r')
        -- Compile and run the Java file in a terminal
        vim.cmd('term javac % && java ' .. filename)
    end
end

-- Create an augroup to manage autocmds for Java files
vim.api.nvim_create_augroup('java', { clear = true })

-- Set up an autocmd to map <F7> to CompileAndRunJava function for Java files
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'java',
    callback = function()
        vim.api.nvim_buf_set_keymap(0, 'n', '<F7>', ':lua CompileAndRunJava()<CR>', { noremap = true, silent = true })
    end,
    group = 'java'
})


