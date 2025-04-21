return {
  {
    'saghen/blink.cmp',
    version = '*',
    enabled = true,
    opts = {
      sources = {
        default = { "lsp", "buffer" },
      },
      fuzzy = {
        implementation = 'lua'
      }
    }
  }
}
