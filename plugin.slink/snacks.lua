vim.pack.add({
  "https://github.com/folke/snacks.nvim"
})

require("snacks").setup {
  explorer = { enabled = false },
  picker = {
    enabled = true,
    exclude = {
      ".git",
      "node_modules"
    },
    sources = {
      files = {
        hidden = true
      }
    }
  },
  indent = {
    enabled = true,
    animate = {
      enabled = false
    }
  }
}

-- vim.keymap.set("n", "<leader>e",  function() Snacks.explorer() end,                    { desc = "File Explorer"})
vim.keymap.set("n", "<leader>f", function() Snacks.picker.files() end, { desc = "Files" })
vim.keymap.set("n", "<leader>l", function() Snacks.picker.grep() end, { desc = "Grep" })
vim.keymap.set("n", "<leader>p", function() Snacks.picker.buffers() end, { desc = "Buffers" })
vim.keymap.set("n", "<leader>gl", function() Snacks.picker.git_log() end, { desc = "Git Log" })
vim.keymap.set("n", "<leader>gs", function() Snacks.picker.git_status() end, { desc = "Git Status" })
vim.keymap.set("n", "<leader>gd", function() Snacks.picker.git_diff() end, { desc = "Git Diff (Hunks)" })
vim.keymap.set("n", "gd", function() Snacks.picker.lsp_definitions() end, { desc = "Goto Definition" })
vim.keymap.set("n", "gD", function() Snacks.picker.lsp_declarations() end, { desc = "Goto Declaration" })
-- vim.keymap.set("n", "gD",         function() Snacks.picker.lsp_type_definitions() end, { desc = "Goto T[y]pe Definition" })
vim.keymap.set("n", "gr", function() Snacks.picker.lsp_references() end, { desc = "References" })
vim.keymap.set("n", "gi", function() Snacks.picker.lsp_implementations() end, { desc = "Goto Implementation" })
