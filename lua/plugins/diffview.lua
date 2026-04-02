return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
  keys = {
    { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Open diffview" },
    { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File git history" },
    { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Branch git history" },
    { "<leader>gx", "<cmd>DiffviewClose<cr>", desc = "Close diffview" },
  },
}
