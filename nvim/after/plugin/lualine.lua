-- Lualine Configuration 
-- This configuration is mainly implemented from their github repository.
-- Helper function to get system load
local function system_load()
  local handle = io.popen("uptime | awk -F'[a-z]:' '{ print $2 }'")
  local result = handle:read("*a")
  handle:close()
  return 'Load:' .. result:gsub("^%s*(.-)%s*$", "%1")
end

-- Helper function to show LSP progress
local function lsp_progress()
  local lsp_status = require('lsp-status')
  return lsp_status.status()
end

-- Helper function to get file size
local function filesize()
  local file = vim.fn.expand('%:p')
  local size = vim.fn.getfsize(file)
  if size < 1024 then
    return size .. 'B'
  elseif size < 1024 * 1024 then
    return string.format('%.1fKB', size / 1024)
  elseif size < 1024 * 1024 * 1024 then
    return string.format('%.1fMB', size / (1024 * 1024))
  else
    return string.format('%.1fGB', size / (1024 * 1024 * 1024))
  end
end

-- Helper function to get current time
local function current_time()
  return os.date("%H:%M")
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {}, -- Add NvimTree here
      winbar = {}, -- Add NvimTree here
    },
    ignore_focus = {'NvimTree', 'packer'},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename', { filesize, icon = '' }}, -- Added file size with icon
    lualine_x = {'encoding', 'fileformat', 'filetype', { lsp_progress, icon = ' LSP:' }}, -- Added LSP status with icon
    lualine_y = {'progress', current_time}, -- Added current time function
    lualine_z = {'location', { system_load, icon = '' }, { 'hostname', icon = '' }} -- Added system load and hostname with icons
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
  
}
