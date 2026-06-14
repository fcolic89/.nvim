return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = 'main',
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter")

      config.setup {}
      config.install({
        "c",
        "cpp",
        "lua",
        "vim",
        "tsx",
        "json",
        "go",
        "rust",
        "javascript",
        "typescript",
        "html",
        "python",
        "bash",
        "vimdoc",
        "java",
        "query",
        "markdown"
      })

      -- vim.api.nvim_create_autocmd('FileType', {
      --   pattern = { '<filetype>' },
      --   callback = function() vim.treesitter.start() end,
      -- })
    end
  },
}
