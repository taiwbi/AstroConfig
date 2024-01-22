local null_ls = require "null-ls"
return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    -- local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- Set a formatter
      -- null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettier,
      null_ls.builtins.formatting.black.with {
        extra_args = { "--line-length=120", "--skip-string-normalization" },
      },
      null_ls.builtins.formatting.phpcbf.with {
        extra_args = { "--standard=/home/mahdi/.config/nvim/lua/user/plugins/formattin-config/php/phpcs.xml" },
      },
      null_ls.builtins.diagnostics.phpcs.with {
        extra_args = { "--standard=/home/mahdi/.config/nvim/lua/user/plugins/formattin-config/php/phpcs.xml" },
      },
    }
    return config -- return final config table
  end,
}
