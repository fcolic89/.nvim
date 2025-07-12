return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = {
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
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require('treesitter-context').setup {
        enable = true
      }
    end
  }
}
