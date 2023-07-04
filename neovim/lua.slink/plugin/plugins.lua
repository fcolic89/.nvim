vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- plugins go here
    -- use 'preservim/nerdtree'
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    }
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.2',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
    use 'folke/tokyonight.nvim'
    use 'ms-jpq/coq_nvim'
    use 'nvim-treesitter/nvim-treesitter'
end)
