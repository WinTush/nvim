return {
  "akinsho/toggleterm.nvim",
  keys = {
    { [[<C-\>]] },
    { "<leader>1", "<Cmd>1ToggleTerm<Cr>", desc = "Terminal #1" },
    { "<leader>2", "<Cmd>2ToggleTerm<Cr>", desc = "Terminal #2" },
    { "<leader>3", "<Cmd>3ToggleTerm<Cr>", desc = "Terminal #3" },
    { "<leader>4", "<Cmd>4ToggleTerm<Cr>", desc = "Terminal #4" },
  },
  cmd = { "ToggleTerm", "TermExec" },
  opts = {
    size = 20,
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "float",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
      border = "curved",
    },
    winbar = {
      enabled = false,
      name_formatter = function(term)
        return term.name
      end,
    },
  },
}
