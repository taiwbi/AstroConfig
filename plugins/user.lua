return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "tpope/vim-dadbod",
    event = "User AstroFile",
    opt = {},
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    event = "User AstroFile",
    opt = {},
  },
  {
    "kristijanhusak/vim-dadbod-completion",
    event = "User AstroFile",
    config = function() require("user.plugins.config.dadbod").setup() end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opt = {},
    event = "VeryLazy",
  },
  {
    "olimorris/onedarkpro.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local transparency = os.getenv "TRANSPARENT_VIM"
      require("onedarkpro").setup {
        options = {
          transparency = transparency,
        },
      }
    end,
  },
  {
    "adalessa/laravel.nvim",
    name = "laravel",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "tpope/vim-dotenv",
      "MunifTanjim/nui.nvim",
    },
    cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
    event = { "VeryLazy" },
    config = function()
      require("laravel").setup()
      require("telescope").load_extension "laravel"
    end,
  },
  {
    "rbong/vim-flog",
    lazy = true,
    cmd = { "Flog", "Flogsplit", "Floggit" },
    dependencies = {
      "tpope/vim-fugitive",
    },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    event = "User AstroFile",
  },
  {
    "AstroNvim/astrocommunity",
    { import = "astrocommunity.pack.typescript" },
    { import = "astrocommunity.colorscheme.tokyonight-nvim" },
  },
  {
    "arzg/vim-colors-xcode",
    config = function()
      -- code
    end,
    event = "VeryLazy",
  },
  {
    "Mofiqul/adwaita.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local transparency = os.getenv "TRANSPARENT_VIM"
      vim.g.adwaita_transparent = transparency == "true"
    end,
  },
}
