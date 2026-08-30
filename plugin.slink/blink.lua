vim.pack.add({
  "https://github.com/saghen/blink.lib",
  "https://github.com/saghen/blink.cmp"
})

local cmp = require('blink.cmp')

cmp.build():pwait()

cmp.setup {
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
