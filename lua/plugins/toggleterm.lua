return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    open_mapping = [[<c-\>]],
    direction = "horizontal", -- 'horizontal', 'vertical', 'tab', 'float'
    close_on_exit = true,
    terminal_mappings = true,
  },
  keys = {
    {
      "<leader>tt",
      "<cmd>ToggleTerm dir=%:p:h<CR>",
      desc = "Open a horizontal terminal at the current file directory",
    },
  },
  config = true,
}
