return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    spec = {
      { "<leader>e", group = "explorer" },
      { "<leader>f", group = "find" },
      { "<leader>s", group = "split" },
      { "<leader>t", group = "tab" },
      { "<leader>h", group = "hunks" },
      { "<leader>x", group = "trouble" },
      { "<leader>w", group = "session" },
      { "<leader>c", group = "code" },
      { "<leader>r", group = "refactor" },
      { "<leader>d", group = "diagnostics" },
    },
  },
}
