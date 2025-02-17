vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use { 'github/copilot.vim' }

    use {
        'goolord/alpha-nvim',
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require 'alpha'.setup(require 'alpha.themes.startify'.config)
        end
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    use {
        "akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end
    }

    use { "ellisonleao/gruvbox.nvim" }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end
    }

    use {
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup()
        end,
    }

    use('nvim-treesitter/playground')
    use('theprimeagen/harpoon')
    use {'neoclide/coc.nvim', branch = 'release'}

    use 'm4xshen/autoclose.nvim'
    use 'luk400/vim-jukit'
    use {
        'letieu/harpoon-lualine',
        opt = false,
        requires = { { 'ThePrimeagen/harpoon' } }
    }

    use 'folke/lsp-colors.nvim'



    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
          'nvim-tree/nvim-web-devicons', -- optional
        },
      }

      use {"tpope/vim-fugitive"}
      use({
        "stevearc/oil.nvim",
        config = function()
          require("oil").setup()
        end,
      }) 
      use {"mbbill/undotree"}  
      use 'lewis6991/gitsigns.nvim' -- OPTIONAL: for git status
      use 'romgrk/barbar.nvim'
end)
