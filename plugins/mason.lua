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
        "bashls",
        -- Web Development
        "html",
        "cssls",
        "tsserver",
        "intelephense",
        -- "stimulus_ls", This package's name is wrong in lspconfig so run `npm i -g stimulus-lsp`
        -- python
        "pylsp",
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
        "shfmt",
        "xmlformatter",
        -- Web Development
        "prettier",
        -- python
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
