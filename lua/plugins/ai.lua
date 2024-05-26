return {
  {
    "Bryley/neoai.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    opts = {
      ui = {
        output_popup_text = "NeoAI",
        input_popup_text = "Prompt",
        width = 40,
        output_popup_height = 80,
        submit = "<Enter>",
      },
      models = {
        {
          name = "openai",
          model = "gpt-4o",
          params = nil,
        },
      },
      shortcuts = {
        {
          name = "textify",
          key = "<leader>as",
          desc = "fix text with AI",
          use_context = true,
          prompt = [[
                Please rewrite the text to make it more readable, clear,
                concise, and fix any grammatical, punctuation, or spelling
                errors
            ]],
          modes = { "v" },
          strip_function = nil,
        },
        {
          name = "gitcommit",
          key = "<leader>ag",
          desc = "generate git commit message",
          use_context = false,
          prompt = function()
            return [[
                    Act as a Software Developer.
                    Write a conventional commit message with optional scope, body and footer from the git diff below
                    The commit message should follow the format: <type>(<scope>): <subject>
                    The type should be one of the following: feat, fix, docs, build, style, refactor, test, chore.
                    Choose the most appropriate type.
                    The scope is optional and can be any word that describes the area of the code affected
                    The subject should be a concise description of the changes made
                    The body is optional and can provide more details about the changes
                    The footer is optional and can reference issues or breaking changes

                    Example:
                    ```
                    fix(main): add logging option

                      - Add logging module to main.py
                      - Use logging.debug and logging.info to print messages
                      - Add -v/--verbose argument to enable debug level logging

                    Closes #12
                    ```

                    Diff:
                ]] .. vim.fn.system("git diff --cached")
          end,
          modes = { "n" },
          strip_function = nil,
        },
      },
    },
    init = function()
      vim.treesitter.language.register("markdown", "neoai-output")
    end,
  },
  {
    "jackMort/ChatGPT.nvim",
    cmd = {
      "ChatGPT",
      "ChatGPTRun",
      "ChatGPTActAs",
      "ChatGPTCompleteCode",
      "ChatGPTEditWithInstructions",
    },
    opts = {
      openai_params = {
        model = "gpt-4o",
        frequency_penalty = 0,
        presence_penalty = 0,
        max_tokens = 12000,
        temperature = 0,
        top_p = 1,
        n = 1,
      },
    },
    config = function()
      require("chatgpt").setup()
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
  -- which key integration
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>a"] = { name = "+ai" },
      },
    },
  },
}
