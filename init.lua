return {
  heirline = {
    separators = {
      breadcrumbs = "  ",
      path = "  ",
    },
  },
  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false, -- automatically quit the current session after a successful update
    remotes = { -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },

  -- Set colorscheme to use
  colorscheme = "catppuccin",

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
        -- "lua_ls",
      },
      timeout_ms = 10000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
    config = {
      pylsp = function(opts)
        opts.root_dir = require("lspconfig.util").root_pattern "main.py"
        opts.settings = {
          pylsp = {
            configurationSources = { "pycodestyle" },
            plugins = {
              autopep8 = { enabled = false },
              yapf = {
                enabled = true,
                style = {
                  based_on_style = "pep8",
                  indent_width = 2,
                },
              },
              pycodestyle = {
                enabled = true,
                maxLineLength = 121,
                indentSize = 2,
              },
            },
          },
        }
        return opts
      end,
      phpactor = function(opts)
        opts.root_dir = function() return vim.loop.cwd() end
        -- opts.enabled = false
        return opts
      end,
      intelephense = function(opts)
        opts.enabled = false
        opts.root_dir = function() return vim.loop.cwd() end
        local key = io.open(os.getenv "HOME" .. "/intelephense/license", "rb")
        if not key then return opts end
        opts.init_options = { licenceKey = key:read "*all" }
        key:close()
        return opts
      end,
      sqlls = function(opts)
        opts.root_dir = function() return vim.loop.cwd() end
        return opts
      end,
    },
  },

  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
    vim.filetype.add {
      pattern = {
        [".*.blade.php"] = "blade",
      },
    }

    -- Adding my custom snippets
    require("luasnip.loaders.from_vscode").lazy_load {
      -- this can be used if your configuration lives in ~/.config/nvim
      -- if your configuration lives in ~/.config/astronvim, the full path
      -- must be specified in the next line
      paths = { "./lua/user/snippets" },
    }

    -- Fixing Arabic text
    -- Make sure to install a persian monospace font if you type persian in your code
    vim.opt.arabicshape = false

    local transparency = os.getenv "TRANSPARENT_VIM"

    if transparency == 'true' then
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
      vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
      vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "none" })
      vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "none" })
    end

    -- set indent size
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2
    vim.opt.shiftwidth = 2
    vim.opt.expandtab = true
    function StTabs()
      vim.opt.tabstop = 2
      vim.opt.softtabstop = 2
      vim.opt.shiftwidth = 2
    end
  end,
}
