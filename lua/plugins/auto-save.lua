return {
  "zoriya/auto-save.nvim",
  opts = {
    print_enabled = false,
    callbacks = {
      before_saving = function()
        local mode = vim.api.nvim_get_mode()
        if mode.mode == "i" then -- Don't save while we in insert mode (triggered with autopair and such)
          vim.g.auto_save_abort = true
        else
          vim.lsp.buf.format({ async = true })
        end
      end,
    },
  },
}
