local lspconfig = require('lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

require("mason").setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    'tsserver',
    'eslint',
    'html',
    'cssls',
	'jdtls',
	'rust_analyzer',
	'pyright',
  },
  handlers = {
    function(server)
      lspconfig[server].setup({
        capabilities = lsp_capabilities,
      })
    end,
    ['tsserver'] = function()
      lspconfig.tsserver.setup({
        capabilities = lsp_capabilities,
        settings = {
          completions = {
            completeFunctionCalls = true
          }
        }
      })
    end
  }
})

