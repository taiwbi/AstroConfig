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
}
