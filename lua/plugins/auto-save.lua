return {
  "WinPriv/auto-save.nvim",
  opts = {
    debounce_delay = 1000,
    print_enabled = false,
    callbacks = {
      before_saving = function()
        local mode = vim.api.nvim_get_mode()
        if mode.mode == "n" then -- Don't save while we in insert mode (triggered with autopair and such)
          local buf = vim.api.nvim_get_current_buf()
          require("lazyvim.util").format({ buf = buf, force = true })
        else
          vim.g.auto_save_abort = true
        end
      end,
    },
  },
}
