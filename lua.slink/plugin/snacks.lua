return {
  {
    "folke/snacks.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      explorer = { enabled = true },
      picker = { enabled = true },
      indent = {
        enabled = true,
        animate = {
          enabled = false
        }
      },
    },
    keys = {
      { "<leader>e",  function() Snacks.explorer() end,                   desc = "File Explorer" },
      { "<leader>f",  function() Snacks.picker.files() end,               desc = "Files" },
      { "<leader>l",  function() Snacks.picker.grep() end,                desc = "Grep" },
      { "<leader>p",  function() Snacks.picker.buffers() end,             desc = "Buffers" },
      { "<leader>gl", function() Snacks.picker.git_log() end,             desc = "Git Log" },
      { "<leader>gs", function() Snacks.picker.git_status() end,          desc = "Git Status" },
      { "<leader>gd", function() Snacks.picker.git_diff() end,            desc = "Git Diff (Hunks)" },
      { "gd",         function() Snacks.picker.lsp_definitions() end,     desc = "Goto Definition" },
      { "gD",         function() Snacks.picker.lsp_declarations() end,    desc = "Goto Declaration" },
      -- { "gD",         function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
      { "gr",         function() Snacks.picker.lsp_references() end,      nowait = true,               desc = "References" },
      { "gi",         function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
    }
  }
}
