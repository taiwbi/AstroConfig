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
      null_ls.builtins.formatting.prettier,
      null_ls.builtins.formatting.rustfmt.with {
        command = "/usr/bin/rustfmt",
        extra_args = { "--config", "tab_spaces=2", "--edition", "2021" },
      },
      null_ls.builtins.formatting.phpcbf.with {
        extra_args = { "--standard=/home/mahdi/.config/nvim/lua/user/plugins/config/phpcs.xml" },
      },
    }
    return config -- return final config table
  end,
}
