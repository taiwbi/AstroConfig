-- customize mason plugins
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        "lua_ls",
        -- Web Development
        "phpactor",
        "html",
        "cssls",
        "quick_lint_js",
        -- python
        "pyright",
        -- Rust
        "rust_analyzer",
      })
    end,
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        "stylua",
        "shellcheck",
        -- Web Development
        "prettier",
        "phpcbf",
        "blade-formatter",
        "tlint", -- blade linter
        "stylelint",
        "stylelint-lsp",
        -- python
        "black",
        "rustfmt",
      })
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        -- Web Development
        "php",
        -- Python
        "python",
      })
      opts.handlers = require "user.plugins.config.dap-handlers"
    end,
  },
}
