return {
  heirline = {
    separators = {
      breadcrumbs = " ► ",
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
  colorscheme = "adwaita",

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
      intelephense = function(opts)
        opts.root_dir = function() return vim.loop.cwd() end
        opts.enabled = false
        opts.filetypes = {}
        local key = io.open(os.getenv "HOME" .. "/intelephense/license", "rb")
        if not key then return opts end
        opts.init_options = { licenceKey = key:read "*all" }
        key:close()
        return opts
      end,
      phpactor = function(opts)
        opts.root_dir = function() return vim.loop.cwd() end
        opts.filetypes = { "php", "blade" }
        return opts
      end,
      tsserver = function(opts)
        opts.root_dir = function() return vim.loop.cwd() end
        return opts
      end,
      sqlls = function(opts)
        opts.root_dir = function() return vim.loop.cwd() end
        return opts
      end,
      bashls = function(opts)
        opts.root_dir = function() return vim.loop.cwd() end
        return opts
      end,
      stimulus_ls = function(opts)
        opts.root_dir = function() return vim.loop.cwd() end
        opts.filetypes = { "blade" }
        return opts
      end,
      rust_analyzer = function(opts)
        opts.settings = {
          ["rust-analyzer"] = {
            files = {
              excludeDirs = { "target", "build", ".flatpak-builder", ".git" },
              watcherExclude = { "target", "build", ".flatpak-builder", ".git" },
            },
          },
        }
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
    transparency = "false"
    local current_theme = vim.api.nvim_exec("colorscheme", true)

    if transparency == "true" then
      if not current_theme == "onedark" or not current_theme == "adwaita" then
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
        vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "none" })
        vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "none" })
        vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
        vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })
        vim.api.nvim_set_hl(0, "TabLine", { bg = "none" })
        vim.api.nvim_set_hl(0, "TabLineSel", { bg = "none" })
        vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none" })
        vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
        vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none", fg = "#74c7ec" })
        vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "none" })
        vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
        vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" })
        vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none" })
        vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
        vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
        vim.api.nvim_set_hl(0, "NonText", { bg = "none" })
        vim.api.nvim_set_hl(0, "NotifyBackground", { bg = "none" })
        vim.api.nvim_set_hl(0, "NotifyErrorBody", { bg = "none" })
        vim.api.nvim_set_hl(0, "NotifyErrorBorder", { bg = "none" })
        vim.api.nvim_set_hl(0, "NotifyDEBUGBody", { bg = "none" })
        vim.api.nvim_set_hl(0, "NotifyDEBUGBorder", { bg = "none" })
        vim.api.nvim_set_hl(0, "NOtifyWARNBody", { bg = "none" })
        vim.api.nvim_set_hl(0, "NOtifyWARNBorder", { bg = "none" })
        vim.api.nvim_set_hl(0, "NotifyINFOBody", { bg = "none" })
        vim.api.nvim_set_hl(0, "NotifyINFOBorder", { bg = "none" })
        vim.api.nvim_set_hl(0, "NotifyTRACEBody", { bg = "none" })
        vim.api.nvim_set_hl(0, "NotifyTRACEBorder", { bg = "none" })
        -- Color for indent-blankline.nvim on xcode colorscheme
        if string.match(current_theme, "^xcode.*") then
          vim.api.nvim_set_hl(0, "IblScope", { bg = "none", fg = "#D476BC" })
        end
      end
    end

    local function handle_theme_change()
      current_theme = vim.api.nvim_exec("colorscheme", true)

      if string.match(current_theme, "^adwaita.*") then
        if vim.o.background == "dark" then
          vim.api.nvim_set_hl(0, "Normal", { bg = "#262626" })
          vim.api.nvim_set_hl(0, "NormalNC", { bg = "#262626" })
        elseif vim.o.background == "light" then
          vim.api.nvim_set_hl(0, "Normal", { bg = "#FFFFFF" })
          vim.api.nvim_set_hl(0, "NormalNC", { bg = "#FFFFFF" })
        end
      elseif string.match(current_theme, "^onedark.*") then
        vim.api.nvim_set_hl(0, "Normal", { bg = "#282C34" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "#282C34" })
      end
    end

    if vim.g.neovide then
      vim.opt.guifont = "Maple Mono:h11"
      vim.opt.guifontwide = "Vazir Code Hack:h10"
      vim.opt.linespace = 0
      vim.g.neovide_padding_top = 0
      vim.g.neovide_padding_bottom = 0
      vim.g.neovide_padding_right = 0
      vim.g.neovide_padding_left = 0
      vim.g.neovide_transparency = 1
      vim.g.neovide_cursor_animation_length = 0.3
      vim.g.neovide_cursor_trail_size = 0.025
      vim.g.neovide_hide_mouse_when_typing = false
      handle_theme_change()
      vim.api.nvim_create_autocmd("ColorScheme", { callback = handle_theme_change })
      vim.api.nvim_create_autocmd("OptionSet", { pattern = "background", callback = handle_theme_change })
    end

    -- Remove this code block if you're not running GNOME
    local last_gnome_theme = ""
    local function gnome_them_sync()
      local gnome_theme = string.gsub(vim.fn.system "gsettings get org.gnome.desktop.interface color-scheme", "\n", "")
      if last_gnome_theme ~= gnome_theme then
        if gnome_theme == "'prefer-dark'" then
          vim.cmd "set background=dark"
        else
          vim.cmd "set background=light"
        end
        last_gnome_theme = gnome_theme
      end
    end
    gnome_them_sync()
    vim.api.nvim_create_autocmd("CursorHold", {
      callback = gnome_them_sync,
      desc = "Update color scheme based on GNOME theme",
    })
    local timer = vim.loop.new_timer()
    timer:start(300, 300, vim.schedule_wrap(function() gnome_them_sync() end))

    vim.opt.showtabline = 0

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
