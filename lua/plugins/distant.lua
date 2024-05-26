return {
  {
    "chipsenkbeil/distant.nvim",
    config = function()
      require("distant"):setup()
    end,
    opts = function()
      local status_ok, distant_settings = pcall(require, "distant.settings")
      if not status_ok then
        return {}
      end

      return {
        ["*"] = distant_settings.chip_default(),
      }
    end,
  },
}
