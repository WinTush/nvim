return {
  "WinPriv/auto-save.nvim",
  opts = {
    debounce_delay = 1000,
    print_enabled = false,
    callbacks = {
      before_saving = function()
        local mode = vim.api.nvim_get_mode()
        if mode.mode == "i" or mode.mode == "niI" then -- Don't save while we in insert mode (triggered with autopair and such)
          vim.g.auto_save_abort = true
        else
          local buf = vim.api.nvim_get_current_buf()
          local ft = vim.bo[buf].filetype
          local have_nls = #require("null-ls.sources").get_available(ft, "NULL_LS_FORMATTING") > 0

          vim.lsp.buf.format(vim.tbl_deep_extend("force", {
            bufnr = buf,
            filter = function(client)
              if have_nls then
                return client.name == "null-ls"
              end
              return client.name ~= "null-ls"
            end,
          }, require("lazyvim.util").opts("nvim-lspconfig").format or {}))
        end
      end,
    },
  },
}
