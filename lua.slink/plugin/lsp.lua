return {
  {
    'neovim/nvim-lspconfig',
    lazy = false,
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          map('<leader>re', vim.lsp.buf.rename, '[R]ename [E]lemnt')
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
          map('K', vim.lsp.buf.hover, 'Hover Documentation')

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              callback = vim.lsp.buf.clear_references,
            })
          end
        end,
      })

      local needed_servers = {
        "ts_ls",
        "gopls",
        "bashls",
        "lua_ls",
        "jdtls",
        "pyright",
        "eslint",
        "clangd"
      }
      local server_configs = {
        bashls = {
          filetypes = { "sh", "bash", "zsh" }
        },
        eslint = {
          root_dir = require('lspconfig').util.root_pattern('package.json'),
          settings = {
            eslint = {
              packageManager = 'npm',
              codeAction = {
                showDocumentation = {
                  enable = true
                },
              },
            },
          },
          on_attach = function(client, bufnr)
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              command = "EslintFixAll",
            })
          end,
        },
      }

      for name, config in pairs(server_configs) do
        if config then
          vim.lsp.config(name, config)
        end
      end

      require('mason').setup()
      require('mason-lspconfig').setup {
        ensure_installed = needed_servers,
      }
    end
  },
}
