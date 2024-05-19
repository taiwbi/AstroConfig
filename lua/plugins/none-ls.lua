-- Customize None-ls sources

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- Set a formatter
      -- null_ls.builtins.formatting.stylua,
      -- null_ls.builtins.formatting.prettier,
      null_ls.builtins.formatting.phpcsfixer.with {
        command = "php-cs-fixer",
        args = {
          "fix",
          "--using-cache=no",
          "--config=" .. vim.fn.expand "~/.config/nvim/lsp-rules/php-cs-fixer.php",
          "--quiet",
          "--",
          "$FILENAME",
        },
      },
      null_ls.builtins.diagnostics.phpstan.with {
        command = "phpstan",
        args = { "analyze", "--error-format", "raw", "--no-progress", "--level=max", "$FILENAME" },
      },
    }
    return config -- return final config table
  end,
}
