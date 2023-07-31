return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      {
        "jay-babu/mason-null-ls.nvim",
        config = function()
          require("mason-null-ls").setup({
            ensure_installed = {},
            automatic_installation = true,
            automatic_setup = false,
          })
        end,
      },
    },
    opts = function()
      local nls = require("null-ls").builtins
      return {
        sources = {
          -- formatters
          nls.formatting.astyle,
          nls.formatting.black.with({ extra_args = { "--fast" } }),
          nls.formatting.clang_format,
          nls.formatting.fixjson,
          nls.formatting.google_java_format,
          nls.formatting.isort,
          nls.formatting.prettierd.with({
            extra_filetypes = { "toml" },
            extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
          }),
          nls.formatting.shfmt,
          nls.formatting.stylua,
          nls.formatting.sqlfluff.with({
            extra_args = { "--dialect", "postgres" }, -- change to your dialect
          }),

          -- linters
          nls.diagnostics.codespell,
          nls.diagnostics.djlint,
          nls.diagnostics.flake8,
          nls.diagnostics.gitlint,
          nls.diagnostics.markdownlint,
          nls.diagnostics.shellcheck,
          nls.diagnostics.tsc,
          nls.diagnostics.write_good,
          nls.diagnostics.sqlfluff.with({
            extra_args = { "--dialect", "postgres" }, -- change to your dialect
          }),

          -- code actions
          nls.code_actions.eslint_d,
          nls.code_actions.gitrebase,
          nls.code_actions.gitsigns,

          -- hover
          nls.hover.dictionary,
        },
      }
    end,
  },
}
