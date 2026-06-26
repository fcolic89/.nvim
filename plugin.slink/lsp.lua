vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/mason-org/mason-lspconfig.nvim",
  "https://github.com/j-hui/fidget.nvim"
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc)
      vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    map('<leader>re', vim.lsp.buf.rename, '[R]ename [E]lemnt')
    map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
    map('K', vim.lsp.buf.hover, 'Hover Documentation')

    -- format file on save
    vim.api.nvim_create_autocmd('BufWritePre', {
      buffer = event.buf,
      callback = function()
        vim.lsp.buf.format()
      end
    })

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
  "clangd",
  "rust_analyzer"
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
