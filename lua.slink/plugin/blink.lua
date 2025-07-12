return {
  {
    'saghen/blink.cmp',
    version = '*',
    enabled = true,
    opts = {
      sources = {
        default = { "lsp", "buffer" },
      },
      keymap = {
        preset = 'super-tab'
      },
      fuzzy = {
        implementation = 'prefer_rust'
      }
    }
  }
}
