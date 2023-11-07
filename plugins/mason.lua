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
        -- Web Development
        "prettier",
        "phpcbf",
        "blade-formatter",
        "tlint", -- blade linter
        -- python
        "black",
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
      opts.handlers = {
        python = function(source_name)
          local dap = require "dap"
          dap.adapters.php = {
            type = "executable",
            command = "node",
            args = {
              "/home/mahdi/.local/share/nvim/mason/packages/php-debug-adapter/extension/out/phpDebug.js",
            },
          }

          dap.configurations.php = {
            {
              type = "php",
              request = "launch",
              name = "Listen for Xdebug",
              port = "9003",
            },
            {
              name = "Launch currently open script",
              type = "php",
              request = "launch",
              program = "${file}",
              cwd = "${fileDirname}",
              port = 0,
              runtimeArgs = { "-dxdebug.start_with_request=yes" },
              env = {
                XDEBUG_MODE = "debug,develop",
                XDEBUG_CONFIG = "client_port=${port}",
              },
            },
          }
        end,
      }
    end,
  },
}
