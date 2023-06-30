vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- plugins go here
    use 'preservim/nerdtree'
    use 'folke/tokyonight.nvim'
    use 'ms-jpq/coq_nvim'
    use 'nvim-treesitter/nvim-treesitter'
end)
